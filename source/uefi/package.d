/**
	Package root module, importing appropriate bind module and other UEFI modules.
**/
module uefi;

import uefi.bind;

mixin(UEFI_BindPublicImportString);

public import uefi.base;
public import uefi.base_type;

public import uefi.gpt;
