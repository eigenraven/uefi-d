#!/bin/sh

# Compile D file
ldc2 -mtriple=x86_64-unknown-windows-coff -boundscheck=off -nogc -defaultlib= -debuglib= -code-model=large -I../source -c ./source/uefihelloworld.d -of=uefihelloworld.obj &&
# Link EFI executable
x86_64-w64-mingw32-gcc -nostdlib -Wl,-dll -shared -Wl,--subsystem,10 -e efi_main -o BOOTX64.EFI uefihelloworld.obj 
