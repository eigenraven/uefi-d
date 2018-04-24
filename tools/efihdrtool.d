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

import std.stdio, std.string, std.array, std.algorithm, std.range,
    std.format, std.conv;
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
        this.dpath = name.translate(['.':'/']) ~ ".d";
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
    if(args.length != 2 || gor.helpWanted)
    {
        defaultGetoptPrinter("dub run --single efihdrtool.d -- [options] specfile.map", gor.options);
        return 1;
    }

    try
    {
        loadMapping(File(args[1], "r"));
    }
    catch(Exception e)
    {
        writeln(e.msg);
        return 1;
    }

    // look for nonexistant files
    string[] nonexistant;
    foreach(hpath, mod; headerToModuleMappings)
    {
        string hfullpath = buildNormalizedPath(inPathRoot, hpath);
        if(!exists(hfullpath) || !isFile(hfullpath))
            nonexistant ~= hfullpath;
        string dfulldir = buildNormalizedPath(outPathRoot, mod.dpath).dirName;
        if(!exists(dfulldir))
            mkdirRecurse(dfulldir);
    }
    if(nonexistant.length > 0)
    {
        writefln("The following files could not be found: \n%(%s\n%)", nonexistant);
        return 1;
    }

    foreach(dmod; modules)
    {
        foreach(hpath; dmod.hpaths)
        {
            string hfullpath = buildNormalizedPath(inPathRoot, hpath);
            string htext = readText(hfullpath);
            processCode(dmod, htext);
        }
    }

    return 0;
}

void loadMapping(File mapFile)
{
    foreach(lineR; mapFile.byLine)
    {
        auto line = lineR.strip;
        if(line.length < 1)
            continue;
        if(line[0] == '#')
            continue;
        if(auto spl = line.findSplit("="))
        {
            string hpath = spl[0].strip.idup;
            string dmod = spl[2].strip.idup;
            if(dmod !in modules)
                modules[dmod] = new GeneratedModule(dmod);
            modules[dmod].hpaths ~= hpath;
            headerToModuleMappings[hpath] = modules[dmod];
        }
        else
        {
            throw new Exception("Malformed input line: "~lineR.idup);
        }
    }
}

void processCode(GeneratedModule* dmod, string htext)
{
    ParseTree p = CCode(htext);
    import pegged.tohtml;
    toHTML(p, File("parseresult.html", "w"));
}

mixin(grammar(PEG_C_GRAMMAR));
enum string PEG_C_GRAMMAR = q{
CCode:

    Unit <- (Spacing? (
              GuardedBlock
            / Include
            / DefineMacro
            / DefineConstant
            / AliasTypedef
            / UnrecognisedDecl
            ))+

    DocComment <~ "/**" (!"*/" .)* "*/"
                / "///" (!endOfLine .)* endOfLine (space* "///" (!endOfLine .)* endOfLine)*
    Comment <~ "//" (!endOfLine .)* endOfLine
             / "/*" (!"*/" .)* "*/"

    Spacing <~ (:space / :endOfLine / DocComment / :Comment)*
    Identifier <~ [a-zA-Z_] [a-zA-Z0-9_]*
    Pointer <- Type Spacing? '*'
    Type <- Pointer / Identifier
    UntilEOL <~ (!endOfLine .)* :endOfLine

    GuardStart <- "#ifndef" Spacing Identifier endOfLine
                  "#define" Spacing Identifier endOfLine
    GuardEnd <- "#endif"
    GuardedBlock <- GuardStart Unit GuardEnd

    Include <- "#include" Spacing ('<'/doublequote) ~(!doublequote !'>' .)+ ('>'/doublequote)
    DefineMacro <- "#define" Spacing Identifier ~('(' (!')' .)* ')') UntilEOL
    DefineConstant <- "#define" Spacing Identifier Spacing UntilEOL

    AliasTypedef <- "typedef" Spacing Type Spacing Identifier ";"


    UnrecognisedDecl <- (!';' .)+ ';'
};
