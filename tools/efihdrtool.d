#!/usr/bin/env dub
/+ dub.sdl:
	name "efihdrtool"
    dependency "pegged" version="~>0.4.3"
+/
/// A program to simplify the process of translating UEFI headers from C -> D
/// Usage: dub run --single efihdrtool.d -- [options] specfile.map
/// Where specfile.map contains pairs a/b/header.h = uefi.dmodulename
/// It outputs files to source/pack/age/module.d unless otherwise specified
module efihdrtool;

import std.stdio, std.string, std.array, std.algorithm, std.range, std.format,
    std.conv;
import std.path, std.process, std.getopt;
import std.file : isFile, exists, mkdirRecurse, readText;
import pegged.grammar;

bool runDfmt = false;
string inPathRoot = "../tianocore_hdrs/Include";
string outPathRoot = "source";

struct GeneratedModule
{
    this(string name)
    {
        this.name = name;
        this.dpath = name.translate(['.' : '/']) ~ ".d";
    }

    string name;
    string dpath;
    string[] hpaths;
    Appender!(char[]) code;
}

/// Modules indexed by their names
GeneratedModule*[string] modules;
/// Header paths mapped to modules
GeneratedModule*[string] headerToModuleMappings;

int main(string[] args)
{
    // dfmt off
    GetoptResult gor = getopt(args,
        "f|dfmt", "Run dfmt on the generated source code", &runDfmt,
        "i|inputPath", "The root of the input header files", &inPathRoot,
        "o|outputPath", "The source root for the outputted modules", &outPathRoot
    );
    // dfmt on
    if (args.length != 2 || gor.helpWanted)
    {
        defaultGetoptPrinter("dub run --single efihdrtool.d -- [options] specfile.map", gor.options);
        return 1;
    }

    try
    {
        loadMapping(File(args[1], "r"));
    }
    catch (Exception e)
    {
        writeln(e.msg);
        return 1;
    }

    // look for nonexistant files
    string[] nonexistant;
    foreach (hpath, mod; headerToModuleMappings)
    {
        string hfullpath = buildNormalizedPath(inPathRoot, hpath);
        if (!exists(hfullpath) || !isFile(hfullpath))
            nonexistant ~= hfullpath;
        string dfulldir = buildNormalizedPath(outPathRoot, mod.dpath).dirName;
        if (!exists(dfulldir))
            mkdirRecurse(dfulldir);
    }
    if (nonexistant.length > 0)
    {
        writefln("The following files could not be found: \n%(%s\n%)", nonexistant);
        return 1;
    }

    foreach (dmod; modules)
    {
        foreach (hpath; dmod.hpaths)
        {
            string hfullpath = buildNormalizedPath(inPathRoot, hpath);
            string htext = readText(hfullpath);
            processCode(dmod, htext, hpath);
        }
    }

    return 0;
}

void loadMapping(File mapFile)
{
    foreach (lineR; mapFile.byLine)
    {
        auto line = lineR.strip;
        if (line.length < 1)
            continue;
        if (line[0] == '#')
            continue;
        if (auto spl = line.findSplit("="))
        {
            string hpath = spl[0].strip.idup;
            string dmod = spl[2].strip.idup;
            if (dmod !in modules)
                modules[dmod] = new GeneratedModule(dmod);
            modules[dmod].hpaths ~= hpath;
            headerToModuleMappings[hpath] = modules[dmod];
        }
        else
        {
            throw new Exception("Malformed input line: " ~ lineR.idup);
        }
    }
}

void processCode(GeneratedModule* dmod, string htext, string hpath)
{
    import std.regex;

    htext = htext.replaceAll(regex(`\\\r?\n`, "gs"), "");
    ParseTree p = CCode(htext);
    import pegged.tohtml;

    toHTML(p, File("parseresult.html", "w"));
    dmod.code ~= "\n//=====================================\n// ";
    dmod.code ~= hpath;
    dmod.code ~= "\n//=====================================\n";

    void parse(ParseTree pt)
    {
        switch (pt.name)
        {
        case "CCode":
            return parse(pt.children[0]);
        case "CCode.Unit":
            {
                foreach (i, ref c; pt.children)
                {
                    switch (c.name)
                    {
                    case "CCode.PIf":
                        if (c.matches[1].endsWith("_H__")) // ignore header guards
                            break;
                        // TODO:Handle #if
                        break;
                    case "CCode.PElif":
                        // TODO: Handle #elif
                        break;
                    case "CCode.PEndIf":
                        // TODO:Handle #endif
                        break;
                    default:
                        parse(c);
                    }
                }
                break;
            }
        case "CCode.DocComment":
            foreach (m; pt.matches)
                dmod.code ~= m;
            dmod.code ~= '\n';
            break;
        case "CCode.PError":
            dmod.code ~= "static assert(0, `";
            dmod.code ~= pt.matches[1];
            dmod.code ~= "`);\n";
            break;
        case "CCode.Include":
            string ipath = pt.children[0].matches[0];
            GeneratedModule** mpp = ipath in headerToModuleMappings;
            if (mpp !is null)
            {
                if ((*mpp) is dmod)
                    break;
                dmod.code ~= "import ";
                dmod.code ~= (*mpp).name;
                dmod.code ~= ";\n";
            }
            else
            {
                dmod.code ~= "//HDRERROR: Missing mapping to " ~ ipath ~ "\n";
                writeln("Missing mapping to ", ipath);
            }
            break;
        case "CCode.DefineConstant":
            {
                string id = pt.children[0].matches[0];
                if (id.endsWith("_H__")) // ignore header guards
                    break;
                string value = pt.children.length == 1 ? "true" : pt.children[1].matches[0];
                dmod.code ~= "enum ";
                dmod.code ~= id;
                dmod.code ~= " = ";
                dmod.code ~= value;
                dmod.code ~= ";\n";
                break;
            }
        case "CCode.AliasTypedef":
            {
                if (pt.children[0].name == "CCode.FuncPointerVar")
                {
                    // TODO
                    break;
                }
                // else: if(pt.children[0].name == "CCode.Type")
                ParseTree tpt = pt.children[0].children[0];
                string id = pt.children[1].matches[0];
                if (tpt.name == "CCode.StructType" || tpt.name == "CCode.UnionType")
                {
                    // TODO
                    break;
                }
                int stars = 0;
                while (tpt.name == "CCode.Pointer")
                {
                    tpt = tpt.children[0].children[0];
                    stars++;
                }
                assert(tpt.name == "CCode.Identifier");
                dmod.code ~= "alias ";
                dmod.code ~= id;
                dmod.code ~= " = ";
                dmod.code ~= tpt.matches[0];
                foreach (i; 0 .. stars)
                    dmod.code ~= '*';
                ParseTree* arrPostfix = (&pt).getChild("CCode.ArrayPostfix");
                if (arrPostfix !is null)
                    dmod.code ~= arrPostfix.input[arrPostfix.begin .. arrPostfix.end];
                dmod.code ~= ";\n";
                break;
            }
        case "CCode.DefineMacro":
            {
                string mname = pt.children[0].matches[0];
                string[] argnames = pt.children[1].children.map!(x => x.matches[0]).array;
                string code = pt.children[2].matches[0].strip;
                // TODO:Support manual overrides
                dmod.code ~= "auto ";
                dmod.code ~= mname;
                dmod.code ~= "(";
                foreach(i, a; argnames) // template type arguments
                {
                    dmod.code ~= a;
                    dmod.code ~= "_T__, ";
                }
                dmod.code ~= ")(";
                foreach(i, a; argnames) // real arguments
                {
                    dmod.code ~= a;
                    dmod.code ~= "_T__ ";
                    dmod.code ~= a;
                    dmod.code ~= ", ";
                }
                dmod.code ~= ")\n{\n    return ";
                dmod.code ~= code;
                dmod.code ~= ";\n}\n\n";
                break;
            }
        default:
            //throw new Exception("Unexpected parsetree node: " ~ pt.name);
            break;
        }
    }

    parse(p);
    static import std.file;

    std.file.write("testout.d", dmod.code.data);
}

ParseTree warnUnrecognisedDecl(ParseTree pt)
{
    string match = pt.input[pt.begin .. pt.end];
    if (match.length < 1)
        return pt;
    stderr.writefln("Unrecognised code: %s", match);
    return pt;
}

ParseTree dropToChild(ParseTree pt)
{
    if (pt.successful && pt.children.length > 0)
    {
        return pt.children[0];
    }
    else
    {
        return pt;
    }
}

ParseTree* getChild(ParseTree* pt, string name)
{
    foreach (ref c; pt.children)
        if (c.name == name)
            return &c;
    return null;
}

mixin(grammar(PEG_C_GRAMMAR));
enum string PEG_C_GRAMMAR = q{
CCode:

    Unit <- (Spacing {dropToChild} (
            / PreprocessorOnlyLine {dropToChild}
            / DefineMacro
            / DefineConstant
            / AliasTypedef
            / LoneDefinition {dropToChild}
            / UnrecognisedDecl
            ))+

    DocComment <~ "/**" (!"*/" .)* "*/"
                / "///" (!endOfLine .)* endOfLine (space* "///" (!endOfLine .)* endOfLine)*
    Comment <~ "//" (!endOfLine .)* endOfLine
             / "/*" (!"*/" .)* "*/"

    PreprocessorOnlyLine <- Include / PIf / PElif / PElse / PEndIf / PError
    PIf <- "#if" UntilEOL
    PElif <- "#elif" UntilEOL
    PElse <- "#else" endOfLine
    PEndIf <- "#endif" endOfLine
    PError <- "#error" Spacing UntilEOL

    ForceSpacing <- (DocComment / :space / :Comment)+
    Spacing <- (DocComment / :space / :endOfLine / :Comment)*
    Identifier <~ [a-zA-Z_] [a-zA-Z0-9_]*
    Number <~ [0-9]+
    ArrayPostfix < "[" Number? "]"
    BitsPostfix < ":" Number
    UntilEOL <~ (!endOfLine .)* :endOfLine

    LoneDefinition < StructType / UnionType ";"
    StructType <- "struct" Spacing Identifier? Spacing "{" Spacing FieldDecl* Spacing "}"
    UnionType <- "union" Spacing Identifier? Spacing "{" Spacing FieldDecl* Spacing "}"
    Pointer <- Type Spacing "*"
    Type <- StructType / UnionType / Pointer / Identifier
    Argument < "IN"? "OUT"? Type Identifier? ArrayPostfix? "OPTIONAL"?
    FuncPointerVar < Type "(" "EFIAPI" "*" Identifier? ")" "(" (Argument ",")* Argument? ")"

    Path <~ [-a-zA-Z_./]+
    Include <- "#include" Spacing ("<"/doublequote) Path (">"/doublequote) endOfLine
    MacroArguments < (Identifier ",")* Identifier?
    DefineMacro <- "#define" Spacing Identifier "(" MacroArguments ")" UntilEOL
    DefineConstant <- "#define" Spacing Identifier (endOfLine / UntilEOL)

    AliasTypedef < "typedef" (FuncPointerVar / Type Identifier ArrayPostfix?) ";"
    FieldsBlock < FieldDecl*
    FieldDecl < (FuncPointerVar / Type Identifier? (ArrayPostfix / BitsPostfix)?) ";"
    

    UnrecognisedDecl <- ~((!";" .)+ ";") {warnUnrecognisedDecl}
};
