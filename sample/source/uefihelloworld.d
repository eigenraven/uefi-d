/**
	A sample UEFI application that prints "Hello, world!" to the console and waits for key input.
**/
module uefihelloworld;

import uefi;

/// Dummy symbols
extern (C) void* _Dmodule_ref;
/// ditto
extern (C) void* _tls_index = null;

/// Helper function for showing D string on the screen
void showBootString(EFI_SYSTEM_TABLE* ST, const(wchar)[] lstr) @nogc nothrow
{
    ST.ConOut.OutputString(ST.ConOut, cast(CHAR16*)(lstr.ptr));
}

/// UEFI Entry Point
extern (C) EFI_STATUS efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE* ST) @nogc nothrow
{
    // Show hello world message
    showBootString(ST, "Hello, D UEFI world!\r\n\r\n"w);

    // Prompt for a key press
    showBootString(ST, "Press key..."w);
    // Clear the input buffer
    ST.ConIn.Reset(ST.ConIn, FALSE);
    // Wait for a key press
    EFI_INPUT_KEY Key = void;
    while (ST.ConIn.ReadKeyStroke(ST.ConIn, &Key) == EFI_NOT_READY)
    {
    }
	return EFI_SUCCESS;
}
