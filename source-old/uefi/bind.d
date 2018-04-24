/**
	Contains code to select appropriate bind module.
**/
module uefi.bind;

version (X86_64)
{
    /// An import statement for the bind module
    enum string UEFI_BindImportString = `import uefi.x64.bind;`;
    /// An public import statement for the bind module
    enum string UEFI_BindPublicImportString = `public ` ~ UEFI_BindImportString;
}
else version (X86)
{
    /// An import statement for the bind module
    enum string UEFI_BindImportString = `import uefi.ia32.bind;`;
    /// An public import statement for the bind module
    enum string UEFI_BindPublicImportString = `public ` ~ UEFI_BindImportString;
}
else
{
    /// An import statement for the bind module
    enum string UEFI_BindImportString = ``;
    /// An public import statement for the bind module
    enum string UEFI_BindPublicImportString = ``;
}

mixin(UEFI_BindPublicImportString);
