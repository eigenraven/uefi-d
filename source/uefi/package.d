/**
	Package root module, importing appropriate bind module and other UEFI modules.
**/
module uefi;

import uefi.bind;

mixin(UEFI_BindPublicImportString);

public import uefi.base;
public import uefi.base_type;

public import uefi.gpt;

public import uefi.protocols.devicepath;
public import uefi.protocols.simpletextin;
public import uefi.protocols.simpletextout;
public import uefi.protocols.graphicsoutput;

public import uefi.spec;
