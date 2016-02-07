/**
	Based on Uefi/UefiBaseType.h file, original notice:

	Defines data types and constants introduced in UEFI.
	
	Also based on Uefi/UefiMultiPhase.h file, original notice:
	This includes some definitions introduced in UEFI that will be used in both PEI and DXE phases.

	Copyright (c) 2006 - 2015, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php

	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
**/
module uefi.base_type;

import uefi.bind;
import uefi.base;

public:
extern (C):

//
// Basic data type definitions introduced in UEFI.
//

///
/// 128-bit buffer containing a unique identifier value.
///
alias EFI_GUID = GUID;
///
/// Function return status for EFI API.
///
alias EFI_STATUS = RETURN_STATUS;
///
/// A collection of related interfaces.
///
alias EFI_HANDLE = VOID*;
///
/// Handle to an event structure.
///
alias EFI_EVENT = VOID*;
///
/// Task priority level.
///
alias EFI_TPL = UINTN;
///
/// Logical block address.
///
alias EFI_LBA = UINT64;

///
/// 64-bit physical memory address.
///
alias EFI_PHYSICAL_ADDRESS = UINT64;

///
/// 64-bit virtual memory address.
///
alias EFI_VIRTUAL_ADDRESS = UINT64;

/// EFI Time Abstraction:
struct EFI_TIME
{
    ///  Year:       1900 - 9999
    UINT16 Year;
    ///  Month:      1 - 12
    UINT8 Month;
    ///  Day:        1 - 31
    UINT8 Day;
    ///  Hour:       0 - 23
    UINT8 Hour;
    ///  Minute:     0 - 59
    UINT8 Minute;
    ///  Second:     0 - 59
    UINT8 Second;
    /// -
    UINT8 Pad1;
    ///  Nanosecond: 0 - 999,999,999
    UINT32 Nanosecond;
    ///  TimeZone:   -1440 to 1440 or 2047
    INT16 TimeZone;
    /// -
    UINT8 Daylight;
    /// -
    UINT8 Pad2;
}

///
/// 4-byte buffer. An IPv4 internet protocol address.
///
struct EFI_IPv4_ADDRESS
{
    UINT8[4] Addr;
}

///
/// 16-byte buffer. An IPv6 internet protocol address.
///
struct EFI_IPv6_ADDRESS
{
    UINT8[16] Addr;
}

///
/// 32-byte buffer containing a network Media Access Control address.
///
struct EFI_MAC_ADDRESS
{
    UINT8[32] Addr;
}

///
/// 16-byte buffer aligned on a 4-byte boundary.
/// An IPv4 or IPv6 internet protocol address.
///
union EFI_IP_ADDRESS
{
    UINT32[4] Addr;
    EFI_IPv4_ADDRESS v4;
    EFI_IPv6_ADDRESS v6;
}

///
/// Enumeration of EFI_STATUS.
///
enum : EFI_STATUS
{
    EFI_SUCCESS = RETURN_SUCCESS,
    EFI_LOAD_ERROR = RETURN_LOAD_ERROR,
    EFI_INVALID_PARAMETER = RETURN_INVALID_PARAMETER,
    EFI_UNSUPPORTED = RETURN_UNSUPPORTED,
    EFI_BAD_BUFFER_SIZE = RETURN_BAD_BUFFER_SIZE,
    EFI_BUFFER_TOO_SMALL = RETURN_BUFFER_TOO_SMALL,
    EFI_NOT_READY = RETURN_NOT_READY,
    EFI_DEVICE_ERROR = RETURN_DEVICE_ERROR,
    EFI_WRITE_PROTECTED = RETURN_WRITE_PROTECTED,
    EFI_OUT_OF_RESOURCES = RETURN_OUT_OF_RESOURCES,
    EFI_VOLUME_CORRUPTED = RETURN_VOLUME_CORRUPTED,
    EFI_VOLUME_FULL = RETURN_VOLUME_FULL,
    EFI_NO_MEDIA = RETURN_NO_MEDIA,
    EFI_MEDIA_CHANGED = RETURN_MEDIA_CHANGED,
    EFI_NOT_FOUND = RETURN_NOT_FOUND,
    EFI_ACCESS_DENIED = RETURN_ACCESS_DENIED,
    EFI_NO_RESPONSE = RETURN_NO_RESPONSE,
    EFI_NO_MAPPING = RETURN_NO_MAPPING,
    EFI_TIMEOUT = RETURN_TIMEOUT,
    EFI_NOT_STARTED = RETURN_NOT_STARTED,
    EFI_ALREADY_STARTED = RETURN_ALREADY_STARTED,
    EFI_ABORTED = RETURN_ABORTED,
    EFI_ICMP_ERROR = RETURN_ICMP_ERROR,
    EFI_TFTP_ERROR = RETURN_TFTP_ERROR,
    EFI_PROTOCOL_ERROR = RETURN_PROTOCOL_ERROR,
    EFI_INCOMPATIBLE_VERSION = RETURN_INCOMPATIBLE_VERSION,
    EFI_SECURITY_VIOLATION = RETURN_SECURITY_VIOLATION,
    EFI_CRC_ERROR = RETURN_CRC_ERROR,
    EFI_END_OF_MEDIA = RETURN_END_OF_MEDIA,
    EFI_END_OF_FILE = RETURN_END_OF_FILE,
    EFI_INVALID_LANGUAGE = RETURN_INVALID_LANGUAGE,
    EFI_COMPROMISED_DATA = RETURN_COMPROMISED_DATA,
    EFI_WARN_UNKNOWN_GLYPH = RETURN_WARN_UNKNOWN_GLYPH,
    EFI_WARN_DELETE_FAILURE = RETURN_WARN_DELETE_FAILURE,
    EFI_WARN_WRITE_FAILURE = RETURN_WARN_WRITE_FAILURE,
    EFI_WARN_BUFFER_TOO_SMALL = RETURN_WARN_BUFFER_TOO_SMALL,
    EFI_WARN_STALE_DATA = RETURN_WARN_STALE_DATA
}

///
/// Define macro to encode the status code.
/// 
alias EFIERR = ENCODE_ERROR;
alias EFI_ERROR = RETURN_ERROR;

enum : EFI_STATUS
{
    /// ICMP error definitions
    EFI_NETWORK_UNREACHABLE = EFIERR!(100),
    /// ditto
    EFI_HOST_UNREACHABLE = EFIERR!(101),
    /// ditto 
    EFI_PROTOCOL_UNREACHABLE = EFIERR!(102),
    /// ditto
    EFI_PORT_UNREACHABLE = EFIERR!(103),

    /// Tcp connection status definitions
    EFI_CONNECTION_FIN = EFIERR!(104),
    /// ditto
    EFI_CONNECTION_RESET = EFIERR!(105),
    /// ditto
    EFI_CONNECTION_REFUSED = EFIERR!(106)
}

/// The EFI memory allocation functions work in units of EFI_PAGEs that are
/// 4KB. This should in no way be confused with the page size of the processor.
/// An EFI_PAGE is just the quanta of memory in EFI.
enum EFI_PAGE_SIZE = SIZE_4KB;
enum EFI_PAGE_MASK = 0xFFF;
enum EFI_PAGE_SHIFT = 12;

/**
  Macro that converts a size, in bytes, to a number of EFI_PAGESs.

  Params:  
  Size =    A size in bytes.  This parameter is assumed to be type UINTN.  
                    Passing in a parameter that is larger than UINTN may produce 
                    unexpected results.

  Returns:  The number of EFI_PAGESs associated with the number of bytes specified
           by Size.

**/
auto EFI_SIZE_TO_PAGES(T)(T Size)
{
    return ((Size) >> EFI_PAGE_SHIFT) + (((Size) & EFI_PAGE_MASK) ? 1 : 0);
}

/**
  Macro that converts a number of EFI_PAGEs to a size in bytes.

  Params:  
  Pages  =  The number of EFI_PAGES.  This parameter is assumed to be 
                    type UINTN.  Passing in a parameter that is larger than 
                    UINTN may produce unexpected results.

  Returns:  The number of bytes associated with the number of EFI_PAGEs specified 
           by Pages.
  
**/
auto EFI_PAGES_TO_SIZE(T)(T Pages)
{
    return (Pages) << EFI_PAGE_SHIFT;
}

///
/// PE32+ Machine type for IA32 UEFI images.
///
enum EFI_IMAGE_MACHINE_IA32 = 0x014C;

///
/// PE32+ Machine type for IA64 UEFI images.
///
enum EFI_IMAGE_MACHINE_IA64 = 0x0200;

///
/// PE32+ Machine type for EBC UEFI images.
///
enum EFI_IMAGE_MACHINE_EBC = 0x0EBC;

///
/// PE32+ Machine type for X64 UEFI images.
///
enum EFI_IMAGE_MACHINE_X64 = 0x8664;

///
/// PE32+ Machine type for ARM mixed ARM and Thumb/Thumb2 images.
///
enum EFI_IMAGE_MACHINE_ARMTHUMB_MIXED = 0x01C2;

///
/// PE32+ Machine type for AARCH64 A64 images.
///
enum EFI_IMAGE_MACHINE_AARCH64 = 0xAA64;

//  UEFI Multi Phase

alias EFI_MEMORY_TYPE = UINT32;
///
/// Enumeration of memory types introduced in UEFI.
///
enum : EFI_MEMORY_TYPE
{
    ///
    /// Not used.
    ///
    EfiReservedMemoryType,
    ///
    /// The code portions of a loaded application.
    /// (Note that UEFI OS loaders are UEFI applications.)
    ///
    EfiLoaderCode,
    ///
    /// The data portions of a loaded application and the default data allocation
    /// type used by an application to allocate pool memory.
    ///
    EfiLoaderData,
    ///
    /// The code portions of a loaded Boot Services Driver.
    ///
    EfiBootServicesCode,
    ///
    /// The data portions of a loaded Boot Serves Driver, and the default data
    /// allocation type used by a Boot Services Driver to allocate pool memory.
    ///
    EfiBootServicesData,
    ///
    /// The code portions of a loaded Runtime Services Driver.
    ///
    EfiRuntimeServicesCode,
    ///
    /// The data portions of a loaded Runtime Services Driver and the default
    /// data allocation type used by a Runtime Services Driver to allocate pool memory.
    ///
    EfiRuntimeServicesData,
    ///
    /// Free (unallocated) memory.
    ///
    EfiConventionalMemory,
    ///
    /// Memory in which errors have been detected.
    ///
    EfiUnusableMemory,
    ///
    /// Memory that holds the ACPI tables.
    ///
    EfiACPIReclaimMemory,
    ///
    /// Address space reserved for use by the firmware.
    ///
    EfiACPIMemoryNVS,
    ///
    /// Used by system firmware to request that a memory-mapped IO region
    /// be mapped by the OS to a virtual address so it can be accessed by EFI runtime services.
    ///
    EfiMemoryMappedIO,
    ///
    /// System memory-mapped IO region that is used to translate memory
    /// cycles to IO cycles by the processor.
    ///
    EfiMemoryMappedIOPortSpace,
    ///
    /// Address space reserved by the firmware for code that is part of the processor.
    ///
    EfiPalCode,
    ///
    /// A memory region that operates as EfiConventionalMemory, 
    /// however it happens to also support byte-addressable non-volatility.
    ///
    EfiPersistentMemory,
    EfiMaxMemoryType
}

alias EFI_RESET_TYPE = UINT32;
///
/// Enumeration of reset types.
///
enum : EFI_RESET_TYPE
{
    ///
    /// Used to induce a system-wide reset. This sets all circuitry within the
    /// system to its initial state.  This type of reset is asynchronous to system
    /// operation and operates withgout regard to cycle boundaries.  EfiColdReset
    /// is tantamount to a system power cycle.
    ///
    EfiResetCold,
    ///
    /// Used to induce a system-wide initialization. The processors are set to their
    /// initial state, and pending cycles are not corrupted.  If the system does
    /// not support this reset type, then an EfiResetCold must be performed.
    ///
    EfiResetWarm,
    ///
    /// Used to induce an entry into a power state equivalent to the ACPI G2/S5 or G3
    /// state.  If the system does not support this reset type, then when the system
    /// is rebooted, it should exhibit the EfiResetCold attributes.
    ///
    EfiResetShutdown,
    ///
    /// Used to induce a system-wide reset. The exact type of the reset is defined by
    /// the EFI_GUID that follows the Null-terminated Unicode string passed into
    /// ResetData. If the platform does not recognize the EFI_GUID in ResetData the
    /// platform must pick a supported reset type to perform. The platform may
    /// optionally log the parameters from any non-normal reset that occurs.
    ///
    EfiResetPlatformSpecific
}

///
/// Data structure that precedes all of the standard EFI table types.
///
struct EFI_TABLE_HEADER
{
    ///
    /// A 64-bit signature that identifies the type of table that follows.
    /// Unique signatures have been generated for the EFI System Table,
    /// the EFI Boot Services Table, and the EFI Runtime Services Table.
    ///
    UINT64 Signature;
    ///
    /// The revision of the EFI Specification to which this table
    /// conforms. The upper 16 bits of this field contain the major
    /// revision value, and the lower 16 bits contain the minor revision
    /// value. The minor revision values are limited to the range of 00..99.
    ///
    UINT32 Revision;
    ///
    /// The size, in bytes, of the entire table including the EFI_TABLE_HEADER.
    ///
    UINT32 HeaderSize;
    ///
    /// The 32-bit CRC for the entire table. This value is computed by
    /// setting this field to 0, and computing the 32-bit CRC for HeaderSize bytes.
    ///
    UINT32 CRC32;
    ///
    /// Reserved field that must be set to 0.
    ///
    UINT32 Reserved;
}

///
/// Attributes of variable.
///
enum EFI_VARIABLE_NON_VOLATILE = 0x00000001;
enum EFI_VARIABLE_BOOTSERVICE_ACCESS = 0x00000002;
enum EFI_VARIABLE_RUNTIME_ACCESS = 0x00000004;
///
/// This attribute is identified by the mnemonic 'HR'
/// elsewhere in this specification.
///
enum EFI_VARIABLE_HARDWARE_ERROR_RECORD = 0x00000008;
///
/// Attributes of Authenticated Variable
///
enum EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS = 0x00000010;
enum EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS = 0x00000020;
enum EFI_VARIABLE_APPEND_WRITE = 0x00000040;

// TODO: WIN_CERTIFICATE_UEFI_GUID-dependent structures
