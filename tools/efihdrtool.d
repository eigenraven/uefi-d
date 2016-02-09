/// A program to simplify the process of translating UEFI headers from C -> D
/// Usage: efihdrtool InFile OutFile
module efihdrtool;

import std.stdio, std.string, std.array, std.algorithm, std.range, std.math,
    std.format, std.conv;
import std.path, std.process;

File fpIn;
File fpOut;
char[] cLine;
string moduleName = "0";
string inFile;

void main(string[] args)
{
    if (args.length != 3)
    {
        stderr.writefln("Usage: %s InFile.h OutFile.d", args[0]);
        return;
    }
    inFile = args[1];
    inFile = inFile[inFile.indexOf("Include/") + 8 .. $];
    fpIn = File(args[1], "r");
    fpOut = File(args[2], "w");
    if (args[2].startsWith("source/"))
        moduleName = args[2]["source/uefi/".length .. $ - 2].replace("/", ".");
    while (!fpIn.eof())
    {
        nextLine();
        process();
    }
    fpOut.flush();
    fpIn.close();
    fpOut.close();
    execute(["dfix", args[2]]);
    execute(["dfmt", args[2], "-i"]);
}

void nextLine()
{
    fpIn.readln(cLine);
    cLine = cLine.strip;
}

bool startsWith(const(char[]) a, const(char[]) b)
{
    size_t bl = b.length;
    if (b[$ - 1] == '\0')
        bl--;
    if (a.length < bl)
        return false;
    for (int i = 0; i < bl; i++)
    {
        if (a[i] != b[i])
            return false;
    }
    return true;
}

bool endsWith(const(char[]) a, const(char[]) b)
{
    size_t bl = b.length;
    if (b[$ - 1] == '\0')
        bl--;
    if (a.length < bl)
        return false;
    for (int i = 0; i < bl; i++)
    {
        if (a[$ - bl + i] != b[i])
            return false;
    }
    return true;
}

__gshared int pack = 0;

void process()
{
    if (cLine.length < 1)
    {
        //fpOut.writeln();
        return;
    }
    if (cLine.startsWith("#pragma"))
    {
        if (cLine.indexOf("pack") > 0)
        {
            if (cLine.endsWith(`()`))
            {
                pack = 0;
            }
            else
            {
                pack = 1;
            }
        }
    }
    if (cLine == "///")
        return;
    if (cLine.startsWith("///"))
    {
        fpOut.writeln(cLine);
    }
    if (cLine == "/** @file")
    {
        fpOut.writeln("/**");
        fpOut.writefln("\tBased on %s, original notice:\n", inFile);
        while (true)
        {
            nextLine();
            if (cLine != "**/")
            {
                fpOut.writeln("\t", cLine.replace("<BR>", ""));
            }
            else
            {
                break;
            }
        }
        fpOut.writeln("**/");
        fpOut.writefln("module uefi.%s;", moduleName);
        fpOut.writeln("import uefi.base;");
        fpOut.writeln("import uefi.base_type;");
        fpOut.writeln("import std.bitmanip;");
        fpOut.writeln("public:");
        fpOut.writeln("extern (C):");
        return;
    }
    if (cLine == "/**")
    {
        fpOut.writeln("/**");
        while (true)
        {
            nextLine();
            if (!cLine.endsWith("**/"))
            {
                fpOut.writeln("\t", cLine);
            }
            else
            {
                break;
            }
        }
        fpOut.writeln("**/");
        return;
    }
    if (cLine.startsWith("#ifndef __"))
    {
        nextLine(); // skip header safeguard
        return;
    }
    if (cLine.startsWith("#include "))
    {
        fpOut.writeln("// FIXME: INCLUDE ", cLine[9 .. $]);
        stderr.writeln("// FIXME: INCLUDE ", cLine[9 .. $]);
        return;
    }
    if (cLine.startsWith("#define"))
    {
        if (cLine.endsWith("_H_"))
        {
            return;
        }
        if (cLine.endsWith("_GUID \\"))
        {
            string Id = cLine[8 .. $ - 2].idup;
            nextLine();
            nextLine();
            string Guid = cLine[0 .. $ - 2].idup;
            nextLine();
            fpOut.writeln("enum EFI_GUID ", Id, " = EFI_GUID(",
                Guid.replace("{", "[").replace("}", "]"), ");");
        }
        else
        {
            // #define abc def
            auto Split = cLine.replace("ULL", "UL").split;
            if (Split[1].indexOf("(") > 0)
            {
                fpOut.writeln("// ", cLine);
                while (cLine[$ - 1] == '\\')
                {
                    nextLine();
                    fpOut.writeln("// ", cLine);
                }
            }
            else
            {
                fpOut.writef("enum %s = ", Split[1]); //Split[2..$].join(" ")
                bool hadSemicolon = false;
                foreach (txt; Split[2 .. $])
                {
                    if (txt.startsWith("//") || txt.startsWith("/*"))
                    {
                        hadSemicolon = true;
                        fpOut.write("; ");
                    }
                    if (txt == "{")
                    {
                        fpOut.write(txt, "GUID( ");
                    }
                    else if (txt == "}")
                    {
                        fpOut.write(txt, " );");
                    }
                    else
                    {
                        fpOut.write(txt, ' ');
                    }
                }
                fpOut.write((hadSemicolon) ? "\n" : ";\n");
            }
        }
        return;
    }
    if (cLine.startsWith("typedef "))
    {
        cLine = cLine[8 .. $];
        if (cLine.startsWith("PACKED"))
        {
            cLine = cLine[7 .. $];
        }
        if (cLine.startsWith("struct _") && (cLine[$ - 1] != '{'))
            cLine = cLine[7 .. $];
        if (cLine.startsWith("union _") && (cLine[$ - 1] != '{'))
            cLine = cLine[6 .. $];
        if (cLine.startsWith("struct"))
        {
            auto app = appender!string;
            nextLine();
            handleStructInterior(app);
            string Id;
            if (cLine.length < 3)
            {
                nextLine();
                Id = cLine[0 .. $ - 1].idup;
            }
            else
            {
                Id = cLine[2 .. $ - 1].idup;
            }
            fpOut.writeln("struct ", Id, pack ? " {align(1):\n" : " {\n", app.data,
                "}");
        }
        else if (cLine.startsWith("enum"))
        {
            auto app = appender!string;
            nextLine();
            while (!cLine.startsWith("}"))
            {
                app ~= cLine.idup;
                app ~= '\n';
                nextLine();
            }
            string Id;
            if (cLine.length < 3)
            {
                nextLine();
                Id = cLine[0 .. $ - 1].idup;
            }
            else
            {
                Id = cLine[2 .. $ - 1].idup;
            }
            fpOut.writeln("alias ", Id, " = UINT32;");
            fpOut.writeln("enum :", Id, " {\n", app.data, "}");
        }
        else if (cLine.startsWith("union"))
        {
            auto app = appender!string;
            nextLine();
            handleStructInterior(app);
            string Id;
            if (cLine.length < 3)
            {
                nextLine();
                Id = cLine[0 .. $ - 1].idup;
            }
            else
            {
                Id = cLine[2 .. $ - 1].idup;
            }
            fpOut.writeln("union ", Id, " {\n", app.data, "}");
        }
        else
        {
            auto Split = cLine[0 .. $ - 1].split;
            fpOut.writefln("alias %s = %s;", Split[$ - 1], Split[0 .. $ - 1].join(" "));
        }
        return;
    }
    if (cLine == "typedef") // function pointer
    {
        nextLine();
        string RetType = cLine.idup;
        nextLine();
        // (EFIAPI *EFI_TEXT_CLEAR_SCREEN)(
        string FunName = cLine[9 .. $ - 2].idup;
        nextLine();
        auto Args = appender!string;
        while (cLine != ");")
        {
            auto Kw = cLine.split;
            foreach (K; Kw)
            {
                if ((K == "IN") || (K == "OUT") || (K == "EFIAPI") || (K == "OPTIONAL"))
                    continue;
                if ((K == "IN,") || (K == "OUT,") || (K == "EFIAPI,") || (K == "OPTIONAL,"))
                {
                    Args ~= ',';
                    continue;
                }
                if (K == "CONST")
                    K = "const".dup;
                if (K == "VOID")
                    K = "void".dup;
                Args ~= K;
                Args ~= ' ';
            }
            nextLine();
        }
        fpOut.writefln("alias %s = %s function(%s) @nogc nothrow;", FunName, RetType,
            Args.data);
    }
    if (cLine.startsWith("struct"))
    {
        auto app = appender!string;
        handleStructInterior(app);
        fpOut.writeln(app.data);
        fpOut.writeln("}");
        return;
    }
}

void handleStructInterior(T)(T app)
{
    int numNests = 1;
    bool inBitfields = false;
    while (true)
    {
        if (cLine.length < 1)
        {
            nextLine();
            continue;
        }
		if(cLine.startsWith("//"))
		{
			app ~= cLine.idup;
			app ~= '\n';
			nextLine();
			continue;
		}
        if (cLine.startsWith("PACKED "))
        {
            cLine = cLine[7 .. $];
        }
        if (cLine.startsWith("union {") || cLine.startsWith("struct {"))
        {
            app ~= `/* FIX:NESTED STRUCTURES */`;
            numNests++;
        }
        if (cLine.startsWith("}"))
        {
            numNests--;
        }
        if (numNests <= 0)
        {
            break;
        }

        if (cLine.indexOf(":") > 0)
        {
            import std.regex;
			cLine = cLine.strip;
            auto spl = splitter(cLine, regex(`[ \t:;]+`)).array;
            if (!inBitfields)
            {
                inBitfields = true;
                app ~= "mixin(bitfields!(\n";
            }
            else
            {
                app ~= ",\n";
            }
            app ~= spl[0].idup; // type
            app ~= `,"`;
            app ~= spl[1].idup; // fname
            app ~= `",`;
            app ~= spl[2].idup; // width
        }
        else
        {
            if (inBitfields)
            {
                inBitfields = false;
                app ~= "));";
            }
            app ~= cLine.idup;
            app ~= '\n';
        }
        nextLine();
    }
	if (inBitfields)
	{
		inBitfields = false;
		app ~= "));";
	}
}
