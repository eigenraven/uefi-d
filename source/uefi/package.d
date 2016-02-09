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
public import uefi.protocols.simpletextinex;
public import uefi.protocols.simpletextout;
public import uefi.protocols.simplepointer;
public import uefi.protocols.simplenetwork;
public import uefi.protocols.simplefilesystem;
public import uefi.protocols.loadfile2;
public import uefi.protocols.loadedimage;
public import uefi.protocols.graphicsoutput;

public import uefi.acpiaml;
public import uefi.acpi10;
public import uefi.acpi20;
public import uefi.acpi30;
public import uefi.acpi40;
public import uefi.acpi50;
public import uefi.acpi51;
public import uefi.acpi60;
public import uefi.acpidatatable;

public import uefi.pxe;
public import uefi.spec;
