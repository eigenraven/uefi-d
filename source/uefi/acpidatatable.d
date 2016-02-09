/**
	Based on Uefi/UefiAcpiDataTable.h, original notice:

	UEFI ACPI Data Table Definition.
	
	Copyright (c) 2011, Intel Corporation. All rights reserved.
	This program and the accompanying materials are licensed and made available under
	the terms and conditions of the BSD License that accompanies this distribution.
	The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php.
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
**/
module uefi.acpidatatable;
import uefi.base;
import uefi.base_type;

public:
extern (C):
public import uefi.acpi;

struct EFI_ACPI_DATA_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    GUID Identifier;
    UINT16 DataOffset;
}

struct EFI_SMM_COMMUNICATION_ACPI_TABLE
{
align(1):
    EFI_ACPI_DATA_TABLE UefiAcpiDataTable;
    UINT32 SwSmiNumber;
    UINT64 BufferPtrAddress;
}
/// To avoid confusion in interpreting frames, the communication buffer should always
/// begin with EFI_SMM_COMMUNICATE_HEADER
struct EFI_SMM_COMMUNICATE_HEADER
{
align(1):
    ///
    /// Allows for disambiguation of the message format.
    ///
    EFI_GUID HeaderGuid;
    ///
    /// Describes the size of Data (in bytes) and does not include the size of the header.
    ///
    UINTN MessageLength;
    ///
    /// Designates an array of bytes that is MessageLength in size.
    ///
    UINT8[1] Data;
}
