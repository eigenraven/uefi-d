# uefi-d
D bindings for UEFI specifications, based on the headers from [EDK II 2015](http://www.tianocore.org/edk2/).
They allow to compile fully functional EFI executables without assembly or C bootstrapping, it boots directly to D :-)
They can be used to build UEFI-compatible applications and drivers in the D Programming Language.
Sample "Hello, world" program is provided, with source and a linux script to compile:
![My laptop booting to D UEFI executable](sample/photo.jpg?raw=true)

## Compilation of D UEFI projects
I'm pretty sure dub won't be able to handle your projects, the best way is to use either [reggae](https://github.com/atilaneves/reggae) or another custom build system.
The executables must not require the D runtime or standard library, suggested ldc2 compiler options for 64-bit compiles:
```
ldc2 -mtriple=x86_64-unknown-windows-coff -boundscheck=off -nogc -defaultlib= -debuglib= -code-model=large
```
And GNU linker options:
```
x86_64-w64-mingw32-gcc -nostdlib -Wl,-dll -shared -Wl,--subsystem,10 -e efi_main
```
It probably would be possible to write a minimal D runtime, but this is not a goal for this project in the near future (unless somebody wants to contribute one).