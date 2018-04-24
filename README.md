# uefi-d
D bindings for UEFI specifications, based on the headers from [EDK II UDK2018](https://github.com/tianocore/tianocore.github.io/wiki/EDK-II).
They allow to compile fully functional EFI executables without assembly or C bootstrapping, it boots directly to D :-)
They can be used to build UEFI-compatible applications and drivers in the D Programming Language.
A sample "Hello, world" program is provided, with source and a linux script to compile:
![My laptop booting to D UEFI executable](sample/photo.jpg?raw=true)

## Compilation of D UEFI projects
Handling the projects with dub might not be the simplest, so I think the best way is to use a more sophisticated build system.
The executables must not require the D runtime or standard library, suggested ldc2 compiler options for 64-bit compiles:
```
ldc2 -mtriple=x86_64-unknown-windows-coff -boundscheck=off -nogc -defaultlib= -debuglib= -code-model=large
```
And GNU linker options:
```
x86_64-w64-mingw32-gcc -nostdlib -Wl,-dll -shared -Wl,--subsystem,10 -e efi_main
```
The target must be 64-bit Windows, because UEFI uses its calling conventions for its functions, and currently there is no easy way to mark
a function as `extern(Win64)` or something similar on non-Windows platform in D.
It would also be possible to write a minimal D runtime, but this is not a goal for this project in the near future (unless somebody wants to contribute one).