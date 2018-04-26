
//=====================================
// Uefi/UefiBaseType.h
//=====================================
/** @file
  Defines data types and constants introduced in UEFI.

Copyright (c) 2006 - 2017, Intel Corporation. All rights reserved.<BR>
Portions copyright (c) 2011 - 2016, ARM Ltd. All rights reserved.<BR>

This program and the accompanying materials are licensed and made available under 
the terms and conditions of the BSD License that accompanies this distribution.  
The full text of the license may be found at
http://opensource.org/licenses/bsd-license.php.                                          
    
THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,                     
WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/
//HDRERROR: Missing mapping to Base.h
///
/// 128-bit buffer containing a unique identifier value.
///

alias EFI_GUID = GUID;
alias EFI_STATUS = RETURN_STATUS;
alias EFI_HANDLE = VOID*;
alias EFI_EVENT = VOID*;
alias EFI_TPL = UINTN;
alias EFI_LBA = UINT64;
alias EFI_PHYSICAL_ADDRESS = UINT64;
alias EFI_VIRTUAL_ADDRESS = UINT64;
alias EFI_IPv4_ADDRESS = IPv4_ADDRESS;
alias EFI_IPv6_ADDRESS = IPv6_ADDRESS;
enum EFI_SUCCESS =                RETURN_SUCCESS              ;
enum EFI_LOAD_ERROR =             RETURN_LOAD_ERROR           ;
enum EFI_INVALID_PARAMETER =      RETURN_INVALID_PARAMETER    ;
enum EFI_UNSUPPORTED =            RETURN_UNSUPPORTED          ;
enum EFI_BAD_BUFFER_SIZE =        RETURN_BAD_BUFFER_SIZE      ;
enum EFI_BUFFER_TOO_SMALL =       RETURN_BUFFER_TOO_SMALL     ;
enum EFI_NOT_READY =              RETURN_NOT_READY            ;
enum EFI_DEVICE_ERROR =           RETURN_DEVICE_ERROR         ;
enum EFI_WRITE_PROTECTED =        RETURN_WRITE_PROTECTED      ;
enum EFI_OUT_OF_RESOURCES =       RETURN_OUT_OF_RESOURCES     ;
enum EFI_VOLUME_CORRUPTED =       RETURN_VOLUME_CORRUPTED     ;
enum EFI_VOLUME_FULL =            RETURN_VOLUME_FULL          ;
enum EFI_NO_MEDIA =               RETURN_NO_MEDIA             ;
enum EFI_MEDIA_CHANGED =          RETURN_MEDIA_CHANGED        ;
enum EFI_NOT_FOUND =              RETURN_NOT_FOUND            ;
enum EFI_ACCESS_DENIED =          RETURN_ACCESS_DENIED        ;
enum EFI_NO_RESPONSE =            RETURN_NO_RESPONSE          ;
enum EFI_NO_MAPPING =             RETURN_NO_MAPPING           ;
enum EFI_TIMEOUT =                RETURN_TIMEOUT              ;
enum EFI_NOT_STARTED =            RETURN_NOT_STARTED          ;
enum EFI_ALREADY_STARTED =        RETURN_ALREADY_STARTED      ;
enum EFI_ABORTED =                RETURN_ABORTED              ;
enum EFI_ICMP_ERROR =             RETURN_ICMP_ERROR           ;
enum EFI_TFTP_ERROR =             RETURN_TFTP_ERROR           ;
enum EFI_PROTOCOL_ERROR =         RETURN_PROTOCOL_ERROR       ;
enum EFI_INCOMPATIBLE_VERSION =   RETURN_INCOMPATIBLE_VERSION ;
enum EFI_SECURITY_VIOLATION =     RETURN_SECURITY_VIOLATION   ;
enum EFI_CRC_ERROR =              RETURN_CRC_ERROR   ;
enum EFI_END_OF_MEDIA =           RETURN_END_OF_MEDIA;
enum EFI_END_OF_FILE =            RETURN_END_OF_FILE;
enum EFI_INVALID_LANGUAGE =       RETURN_INVALID_LANGUAGE;
enum EFI_COMPROMISED_DATA =       RETURN_COMPROMISED_DATA;
enum EFI_HTTP_ERROR =             RETURN_HTTP_ERROR;
enum EFI_WARN_UNKNOWN_GLYPH =     RETURN_WARN_UNKNOWN_GLYPH   ;
enum EFI_WARN_DELETE_FAILURE =    RETURN_WARN_DELETE_FAILURE  ;
enum EFI_WARN_WRITE_FAILURE =     RETURN_WARN_WRITE_FAILURE   ;
enum EFI_WARN_BUFFER_TOO_SMALL =  RETURN_WARN_BUFFER_TOO_SMALL;
enum EFI_WARN_STALE_DATA =        RETURN_WARN_STALE_DATA;
enum EFI_WARN_FILE_SYSTEM =       RETURN_WARN_FILE_SYSTEM;
///@}

///
/// Define macro to encode the status code.
/// 

auto EFIERR(_a_T__, )(_a_T__ _a, )
{
    return ENCODE_ERROR(_a);
}

auto EFI_ERROR(A_T__, )(A_T__ A, )
{
    return RETURN_ERROR(A);
}

///
/// ICMP error definitions
///@{

enum EFI_NETWORK_UNREACHABLE =    EFIERR(100);
enum EFI_HOST_UNREACHABLE =       EFIERR(101) ;
enum EFI_PROTOCOL_UNREACHABLE =   EFIERR(102);
enum EFI_PORT_UNREACHABLE =       EFIERR(103);
///@}

///
/// Tcp connection status definitions
///@{

enum EFI_CONNECTION_FIN =         EFIERR(104);
enum EFI_CONNECTION_RESET =       EFIERR(105);
enum EFI_CONNECTION_REFUSED =     EFIERR(106);
///@}

enum EFI_PAGE_SIZE =              SIZE_4KB;
enum EFI_PAGE_MASK =              0xFFF;
enum EFI_PAGE_SHIFT =             12;
/**
  Macro that converts a size, in bytes, to a number of EFI_PAGESs.

  @param  Size      A size in bytes.  This parameter is assumed to be type UINTN.  
                    Passing in a parameter that is larger than UINTN may produce 
                    unexpected results.

  @return  The number of EFI_PAGESs associated with the number of bytes specified
           by Size.

**/
auto EFI_SIZE_TO_PAGES(Size_T__, )(Size_T__ Size, )
{
    return (((Size) >> EFI_PAGE_SHIFT) + (((Size) & EFI_PAGE_MASK) ? 1 : 0));
}

/**
  Macro that converts a number of EFI_PAGEs to a size in bytes.

  @param  Pages     The number of EFI_PAGES.  This parameter is assumed to be 
                    type UINTN.  Passing in a parameter that is larger than 
                    UINTN may produce unexpected results.

  @return  The number of bytes associated with the number of EFI_PAGEs specified 
           by Pages.
  
**/
auto EFI_PAGES_TO_SIZE(Pages_T__, )(Pages_T__ Pages, )
{
    return ((Pages) << EFI_PAGE_SHIFT);
}

///
/// PE32+ Machine type for IA32 UEFI images.
///

enum EFI_IMAGE_MACHINE_IA32 =             0x014C;
///
/// PE32+ Machine type for IA64 UEFI images.
///

enum EFI_IMAGE_MACHINE_IA64 =             0x0200;
///
/// PE32+ Machine type for EBC UEFI images.
///

enum EFI_IMAGE_MACHINE_EBC =              0x0EBC;
///
/// PE32+ Machine type for X64 UEFI images.
///

enum EFI_IMAGE_MACHINE_X64 =              0x8664;
///
/// PE32+ Machine type for ARM mixed ARM and Thumb/Thumb2 images.
///

enum EFI_IMAGE_MACHINE_ARMTHUMB_MIXED =   0x01C2;
///
/// PE32+ Machine type for AARCH64 A64 images.
///

enum EFI_IMAGE_MACHINE_AARCH64 =   0xAA64;
auto EFI_IMAGE_MACHINE_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (((Machine) == EFI_IMAGE_MACHINE_IA32) || ((Machine) == EFI_IMAGE_MACHINE_EBC));
}

auto EFI_IMAGE_MACHINE_CROSS_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return ((Machine) == EFI_IMAGE_MACHINE_X64);
}

auto EFI_IMAGE_MACHINE_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (((Machine) == EFI_IMAGE_MACHINE_IA64) || ((Machine) == EFI_IMAGE_MACHINE_EBC));
}

auto EFI_IMAGE_MACHINE_CROSS_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (FALSE);
}

auto EFI_IMAGE_MACHINE_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (((Machine) == EFI_IMAGE_MACHINE_X64) || ((Machine) == EFI_IMAGE_MACHINE_EBC));
}

auto EFI_IMAGE_MACHINE_CROSS_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return ((Machine) == EFI_IMAGE_MACHINE_IA32);
}

auto EFI_IMAGE_MACHINE_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return ((Machine) == EFI_IMAGE_MACHINE_ARMTHUMB_MIXED);
}

auto EFI_IMAGE_MACHINE_CROSS_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (FALSE);
}

auto EFI_IMAGE_MACHINE_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (((Machine) == EFI_IMAGE_MACHINE_AARCH64) || ((Machine) == EFI_IMAGE_MACHINE_EBC));
}

auto EFI_IMAGE_MACHINE_CROSS_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (FALSE);
}

///
/// This is just to make sure you can cross compile with the EBC compiler.
/// It does not make sense to have a PE loader coded in EBC. 
///

auto EFI_IMAGE_MACHINE_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return ((Machine) == EFI_IMAGE_MACHINE_EBC);
}

auto EFI_IMAGE_MACHINE_CROSS_TYPE_SUPPORTED(Machine_T__, )(Machine_T__ Machine, )
{
    return (FALSE);
}

static assert(0, `Unknown Processor Type`);
