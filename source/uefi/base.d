/**
	Based on Base.h file, original notice:

	Root include file for Mde Package Base type modules

	This is the include file for any module of type base. Base modules only use
	types defined via this include file and can be ported easily to any
	environment. There are a set of base libraries in the Mde Package that can
	be used to implement base modules.

	Copyright (c) 2006 - 2015, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php

	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
**/
module uefi.base;

import uefi.bind;

public:
extern (C):

/// 128 bit buffer containing a unique identifier value.
/// Unless otherwise specified, aligned on a 64 bit boundary.
struct GUID
{
    UINT32 Data1;
    UINT16 Data2;
    UINT16 Data3;
    UINT8 Data4[8];
}

/// 8-bytes unsigned value that represents a physical system address.
alias PHYSICAL_ADDRESS = UINT64;

/// LIST_ENTRY structure definition.
struct LIST_ENTRY
{
    LIST_ENTRY* ForwardLink;
    LIST_ENTRY* BackwardLink;
}

/// Boolean true value.
enum BOOLEAN TRUE = 1;

/// Boolean false value.
enum BOOLEAN FALSE = 0;

/// 
enum : UINT32
{
    BIT0 = 0x00000001,
    BIT1 = 0x00000002,
    BIT2 = 0x00000004,
    BIT3 = 0x00000008,
    BIT4 = 0x00000010,
    BIT5 = 0x00000020,
    BIT6 = 0x00000040,
    BIT7 = 0x00000080,
    BIT8 = 0x00000100,
    BIT9 = 0x00000200,
    BIT10 = 0x00000400,
    BIT11 = 0x00000800,
    BIT12 = 0x00001000,
    BIT13 = 0x00002000,
    BIT14 = 0x00004000,
    BIT15 = 0x00008000,
    BIT16 = 0x00010000,
    BIT17 = 0x00020000,
    BIT18 = 0x00040000,
    BIT19 = 0x00080000,
    BIT20 = 0x00100000,
    BIT21 = 0x00200000,
    BIT22 = 0x00400000,
    BIT23 = 0x00800000,
    BIT24 = 0x01000000,
    BIT25 = 0x02000000,
    BIT26 = 0x04000000,
    BIT27 = 0x08000000,
    BIT28 = 0x10000000,
    BIT29 = 0x20000000,
    BIT30 = 0x40000000,
    BIT31 = 0x80000000,

    SIZE_1KB = 0x00000400,
    SIZE_2KB = 0x00000800,
    SIZE_4KB = 0x00001000,
    SIZE_8KB = 0x00002000,
    SIZE_16KB = 0x00004000,
    SIZE_32KB = 0x00008000,
    SIZE_64KB = 0x00010000,
    SIZE_128KB = 0x00020000,
    SIZE_256KB = 0x00040000,
    SIZE_512KB = 0x00080000,
    SIZE_1MB = 0x00100000,
    SIZE_2MB = 0x00200000,
    SIZE_4MB = 0x00400000,
    SIZE_8MB = 0x00800000,
    SIZE_16MB = 0x01000000,
    SIZE_32MB = 0x02000000,
    SIZE_64MB = 0x04000000,
    SIZE_128MB = 0x08000000,
    SIZE_256MB = 0x10000000,
    SIZE_512MB = 0x20000000,
    SIZE_1GB = 0x40000000,
    SIZE_2GB = 0x80000000,

    BASE_1KB = 0x00000400,
    BASE_2KB = 0x00000800,
    BASE_4KB = 0x00001000,
    BASE_8KB = 0x00002000,
    BASE_16KB = 0x00004000,
    BASE_32KB = 0x00008000,
    BASE_64KB = 0x00010000,
    BASE_128KB = 0x00020000,
    BASE_256KB = 0x00040000,
    BASE_512KB = 0x00080000,
    BASE_1MB = 0x00100000,
    BASE_2MB = 0x00200000,
    BASE_4MB = 0x00400000,
    BASE_8MB = 0x00800000,
    BASE_16MB = 0x01000000,
    BASE_32MB = 0x02000000,
    BASE_64MB = 0x04000000,
    BASE_128MB = 0x08000000,
    BASE_256MB = 0x10000000,
    BASE_512MB = 0x20000000,
    BASE_1GB = 0x40000000,
    BASE_2GB = 0x80000000
}
/// ditto
enum : UINT64
{
    BIT32 = 0x0000000100000000UL,
    BIT33 = 0x0000000200000000UL,
    BIT34 = 0x0000000400000000UL,
    BIT35 = 0x0000000800000000UL,
    BIT36 = 0x0000001000000000UL,
    BIT37 = 0x0000002000000000UL,
    BIT38 = 0x0000004000000000UL,
    BIT39 = 0x0000008000000000UL,
    BIT40 = 0x0000010000000000UL,
    BIT41 = 0x0000020000000000UL,
    BIT42 = 0x0000040000000000UL,
    BIT43 = 0x0000080000000000UL,
    BIT44 = 0x0000100000000000UL,
    BIT45 = 0x0000200000000000UL,
    BIT46 = 0x0000400000000000UL,
    BIT47 = 0x0000800000000000UL,
    BIT48 = 0x0001000000000000UL,
    BIT49 = 0x0002000000000000UL,
    BIT50 = 0x0004000000000000UL,
    BIT51 = 0x0008000000000000UL,
    BIT52 = 0x0010000000000000UL,
    BIT53 = 0x0020000000000000UL,
    BIT54 = 0x0040000000000000UL,
    BIT55 = 0x0080000000000000UL,
    BIT56 = 0x0100000000000000UL,
    BIT57 = 0x0200000000000000UL,
    BIT58 = 0x0400000000000000UL,
    BIT59 = 0x0800000000000000UL,
    BIT60 = 0x1000000000000000UL,
    BIT61 = 0x2000000000000000UL,
    BIT62 = 0x4000000000000000UL,
    BIT63 = 0x8000000000000000UL,

    SIZE_4GB = 0x0000000100000000UL,
    SIZE_8GB = 0x0000000200000000UL,
    SIZE_16GB = 0x0000000400000000UL,
    SIZE_32GB = 0x0000000800000000UL,
    SIZE_64GB = 0x0000001000000000UL,
    SIZE_128GB = 0x0000002000000000UL,
    SIZE_256GB = 0x0000004000000000UL,
    SIZE_512GB = 0x0000008000000000UL,
    SIZE_1TB = 0x0000010000000000UL,
    SIZE_2TB = 0x0000020000000000UL,
    SIZE_4TB = 0x0000040000000000UL,
    SIZE_8TB = 0x0000080000000000UL,
    SIZE_16TB = 0x0000100000000000UL,
    SIZE_32TB = 0x0000200000000000UL,
    SIZE_64TB = 0x0000400000000000UL,
    SIZE_128TB = 0x0000800000000000UL,
    SIZE_256TB = 0x0001000000000000UL,
    SIZE_512TB = 0x0002000000000000UL,
    SIZE_1PB = 0x0004000000000000UL,
    SIZE_2PB = 0x0008000000000000UL,
    SIZE_4PB = 0x0010000000000000UL,
    SIZE_8PB = 0x0020000000000000UL,
    SIZE_16PB = 0x0040000000000000UL,
    SIZE_32PB = 0x0080000000000000UL,
    SIZE_64PB = 0x0100000000000000UL,
    SIZE_128PB = 0x0200000000000000UL,
    SIZE_256PB = 0x0400000000000000UL,
    SIZE_512PB = 0x0800000000000000UL,
    SIZE_1EB = 0x1000000000000000UL,
    SIZE_2EB = 0x2000000000000000UL,
    SIZE_4EB = 0x4000000000000000UL,
    SIZE_8EB = 0x8000000000000000UL,

    BASE_4GB = 0x0000000100000000UL,
    BASE_8GB = 0x0000000200000000UL,
    BASE_16GB = 0x0000000400000000UL,
    BASE_32GB = 0x0000000800000000UL,
    BASE_64GB = 0x0000001000000000UL,
    BASE_128GB = 0x0000002000000000UL,
    BASE_256GB = 0x0000004000000000UL,
    BASE_512GB = 0x0000008000000000UL,
    BASE_1TB = 0x0000010000000000UL,
    BASE_2TB = 0x0000020000000000UL,
    BASE_4TB = 0x0000040000000000UL,
    BASE_8TB = 0x0000080000000000UL,
    BASE_16TB = 0x0000100000000000UL,
    BASE_32TB = 0x0000200000000000UL,
    BASE_64TB = 0x0000400000000000UL,
    BASE_128TB = 0x0000800000000000UL,
    BASE_256TB = 0x0001000000000000UL,
    BASE_512TB = 0x0002000000000000UL,
    BASE_1PB = 0x0004000000000000UL,
    BASE_2PB = 0x0008000000000000UL,
    BASE_4PB = 0x0010000000000000UL,
    BASE_8PB = 0x0020000000000000UL,
    BASE_16PB = 0x0040000000000000UL,
    BASE_32PB = 0x0080000000000000UL,
    BASE_64PB = 0x0100000000000000UL,
    BASE_128PB = 0x0200000000000000UL,
    BASE_256PB = 0x0400000000000000UL,
    BASE_512PB = 0x0800000000000000UL,
    BASE_1EB = 0x1000000000000000UL,
    BASE_2EB = 0x2000000000000000UL,
    BASE_4EB = 0x4000000000000000UL,
    BASE_8EB = 0x8000000000000000UL
}

/// Variable used to traverse the list of arguments. This type can vary by
/// implementation and could be an array or structure.
alias VA_LIST = ubyte*;

/// Pointer to the start of a variable argument list stored in a memory buffer. Same as UINT8 *.
alias BASE_LIST = UINTN*;

/**
  Rounds a value up to the next boundary using a specified alignment.

  This function rounds Value up to the next boundary using the specified Alignment.
  This aligned value is returned.

  Params:
     Value     = The value to round up.
     Alignment = The alignment boundary used to return the aligned value.

  Returns:  A value up to the next boundary.

**/
auto ALIGN_VALUE(T)(T Value, T Alignment)
{
    return ((Value) + (((Alignment) - (Value)) & ((Alignment) - 1)));
}

/**
  Adjust a pointer by adding the minimum offset required for it to be aligned on
  a specified alignment boundary.

  This function rounds the pointer specified by Pointer to the next alignment boundary
  specified by Alignment. The pointer to the aligned address is returned.

  Params:
     Pointer    The pointer to round up.
     Alignment  The alignment boundary to use to return an aligned pointer.

  Returns:  Pointer to the aligned address.

**/
T* ALIGN_POINTER(T)(T* Pointer, INTN Alignment)
{
    return (cast(VOID*)(ALIGN_VALUE(cast(UINTN)(Pointer), (Alignment))));
}

/**
  Rounds a value up to the next natural boundary for the current CPU.
  This is 4-bytes for 32-bit CPUs and 8-bytes for 64-bit CPUs.

  This function rounds the value specified by Value up to the next natural boundary for the
  current CPU. This rounded value is returned.

  @param   Value      The value to round up.

  @return  Rounded value specified by Value.

**/
auto ALIGN_VARIABLE(T)(T Value)
{
    return ALIGN_VALUE((Value), UINTN.sizeof);
}

/**
  Return the maximum of two operands.

  Params:
     a     =   The first operand with any numerical type.
     b     =   The second operand.

  Returns:  Maximum of two operands.

**/
auto MAX(T, U)(T A, U B)
{
    return (A > B) ? A : B;
}

/**
  Return the minimum of two operands.

  Params:
     a     =   The first operand with any numerical type.
     b     =   The second operand.

  Returns:  Minimum of two operands.

**/
auto MIN(T, U)(T A, U B)
{
    return (A < B) ? A : B;
}

/**
  Return the absolute value of a signed operand.

  Params:
     a     =   The signed operand.

  Returns:  The absolute value of the signed operand.

**/
auto ABS(T)(T A)
{
    return (A < 0) ? (-A) : (A);
}

/// Status codes common to all execution phases
alias RETURN_STATUS = UINTN;

/**
  Returns true if a specified RETURN_STATUS code is an error code.

  This function returns TRUE if StatusCode has the high bit set.  Otherwise, false is returned.

  Params:
    StatusCode  =  The status code value to evaluate.

  Returns: true if         The high bit of StatusCode is set.
   false if        The high bit of StatusCode is clear.

**/
bool RETURN_ERROR(T)(T StatusCode)
{
    return cast(INTN)(cast(RETURN_STATUS)(StatusCode)) < 0;
}

/**
  Produces a RETURN_STATUS code with the highest bit set.

  Params:
    StatusCode  =  The status code value to convert into a warning code.
                   StatusCode must be in the range 0x00000000..0x7FFFFFFF.

  Returns: The value specified by StatusCode with the highest bit set.

**/
template ENCODE_ERROR(UINTN StatusCode)
{
    enum RETURN_STATUS ENCODE_ERROR = StatusCode | MAX_BIT;
}

/**
  Produces a RETURN_STATUS code with the highest bit clear.

  Params:
    StatusCode  =  The status code value to convert into a warning code.
                   StatusCode must be in the range 0x00000000..0x7FFFFFFF.

  Returns: The value specified by StatusCode with the highest bit clear.

**/
template ENCODE_WARNING(UINTN StatusCode)
{
    enum RETURN_STATUS ENCODE_WARNING = StatusCode | MAX_BIT;
}

/// Return status codes
enum : RETURN_STATUS
{

    ///
    /// The operation completed successfully.
    ///
    RETURN_SUCCESS = 0,
    ///
    /// The image failed to load.
    ///
    RETURN_LOAD_ERROR = ENCODE_ERROR!(1),

    ///
    /// The parameter was incorrect.
    ///
    RETURN_INVALID_PARAMETER = ENCODE_ERROR!(2),

    ///
    /// The operation is not supported.
    ///
    RETURN_UNSUPPORTED = ENCODE_ERROR!(3),

    ///
    /// The buffer was not the proper size for the request.
    ///
    RETURN_BAD_BUFFER_SIZE = ENCODE_ERROR!(4),

    ///
    /// The buffer was not large enough to hold the requested data.
    /// The required buffer size is returned in the appropriate
    /// parameter when this error occurs.
    ///
    RETURN_BUFFER_TOO_SMALL = ENCODE_ERROR!(5),

    ///
    /// There is no data pending upon return.
    ///
    RETURN_NOT_READY = ENCODE_ERROR!(6),

    ///
    /// The physical device reported an error while attempting the
    /// operation.
    ///
    RETURN_DEVICE_ERROR = ENCODE_ERROR!(7),

    ///
    /// The device can not be written to.
    ///
    RETURN_WRITE_PROTECTED = ENCODE_ERROR!(8),

    ///
    /// The resource has run out.
    ///
    RETURN_OUT_OF_RESOURCES = ENCODE_ERROR!(9),

    ///
    /// An inconsistency was detected on the file system causing the
    /// operation to fail.
    ///
    RETURN_VOLUME_CORRUPTED = ENCODE_ERROR!(10),

    ///
    /// There is no more space on the file system.
    ///
    RETURN_VOLUME_FULL = ENCODE_ERROR!(11),

    ///
    /// The device does not contain any medium to perform the
    /// operation.
    ///
    RETURN_NO_MEDIA = ENCODE_ERROR!(12),

    ///
    /// The medium in the device has changed since the last
    /// access.
    ///
    RETURN_MEDIA_CHANGED = ENCODE_ERROR!(13),

    ///
    /// The item was not found.
    ///
    RETURN_NOT_FOUND = ENCODE_ERROR!(14),

    ///
    /// Access was denied.
    ///
    RETURN_ACCESS_DENIED = ENCODE_ERROR!(15),

    ///
    /// The server was not found or did not respond to the request.
    ///
    RETURN_NO_RESPONSE = ENCODE_ERROR!(16),

    ///
    /// A mapping to the device does not exist.
    ///
    RETURN_NO_MAPPING = ENCODE_ERROR!(17),

    ///
    /// A timeout time expired.
    ///
    RETURN_TIMEOUT = ENCODE_ERROR!(18),

    ///
    /// The protocol has not been started.
    ///
    RETURN_NOT_STARTED = ENCODE_ERROR!(19),

    ///
    /// The protocol has already been started.
    ///
    RETURN_ALREADY_STARTED = ENCODE_ERROR!(20),

    ///
    /// The operation was aborted.
    ///
    RETURN_ABORTED = ENCODE_ERROR!(21),

    ///
    /// An ICMP error occurred during the network operation.
    ///
    RETURN_ICMP_ERROR = ENCODE_ERROR!(22),

    ///
    /// A TFTP error occurred during the network operation.
    ///
    RETURN_TFTP_ERROR = ENCODE_ERROR!(23),

    ///
    /// A protocol error occurred during the network operation.
    ///
    RETURN_PROTOCOL_ERROR = ENCODE_ERROR!(24),

    ///
    /// A function encountered an internal version that was
    /// incompatible with a version requested by the caller.
    ///
    RETURN_INCOMPATIBLE_VERSION = ENCODE_ERROR!(25),

    ///
    /// The function was not performed due to a security violation.
    ///
    RETURN_SECURITY_VIOLATION = ENCODE_ERROR!(26),

    ///
    /// A CRC error was detected.
    ///
    RETURN_CRC_ERROR = ENCODE_ERROR!(27),

    ///
    /// The beginning or end of media was reached.
    ///
    RETURN_END_OF_MEDIA = ENCODE_ERROR!(28),

    ///
    /// The end of the file was reached.
    ///
    RETURN_END_OF_FILE = ENCODE_ERROR!(31),

    ///
    /// The language specified was invalid.
    ///
    RETURN_INVALID_LANGUAGE = ENCODE_ERROR!(32),

    ///
    /// The security status of the data is unknown or compromised
    /// and the data must be updated or replaced to restore a valid
    /// security status.
    ///
    RETURN_COMPROMISED_DATA = ENCODE_ERROR!(33),

    ///
    /// The string contained one or more characters that
    /// the device could not render and were skipped.
    ///
    RETURN_WARN_UNKNOWN_GLYPH = ENCODE_WARNING!(1),

    ///
    /// The handle was closed, but the file was not deleted.
    ///
    RETURN_WARN_DELETE_FAILURE = ENCODE_WARNING!(2),

    ///
    /// The handle was closed, but the data to the file was not
    /// flushed properly.
    ///
    RETURN_WARN_WRITE_FAILURE = ENCODE_WARNING!(3),

    ///
    /// The resulting buffer was too small, and the data was
    /// truncated to the buffer size.
    ///
    RETURN_WARN_BUFFER_TOO_SMALL = ENCODE_WARNING!(4),

    ///
    /// The data has not been updated within the timeframe set by
    /// local policy for this type of data.
    ///
    RETURN_WARN_STALE_DATA = ENCODE_WARNING!(5),

}

/**
  Returns a 16-bit signature built from 2 ASCII characters.

  This macro returns a 16-bit value built from the two ASCII characters specified
  by A and B.

  Params:
    A =   The first ASCII character.
    B =   The second ASCII character.

  Returns: A 16-bit value built from the two ASCII characters specified by A and B.

**/
auto SIGNATURE_16(T)(T A, T B)
{
    return ((A) | (B << 8));
}

/**
  Returns a 32-bit signature built from 2 ASCII characters.

  This macro returns a 32-bit value built from the four ASCII characters specified
  by A, B, C, and D.

  Params:
    A =   The first ASCII character.
    B =   The second ASCII character.
	C =   The third ASCII character.
	D =   The fourth ASCII character.

  Returns: A 32-bit value built from the two ASCII characters specified by A, B, C and D.

**/
auto SIGNATURE_32(T)(T A, T B, T C, T D)
{
    return (SIGNATURE_16(A, B) | (SIGNATURE_16(C, D) << 16));
}

/**
  Returns a 64-bit signature built from 8 ASCII characters.

  This macro returns a 64-bit value built from the eight ASCII characters specified
  by A, B, C, D, E, F, G,and H.

  Params:
    A  =  The first ASCII character.
    B  =  The second ASCII character.
    C  =  The third ASCII character.
    D  =  The fourth ASCII character.
    E  =  The fifth ASCII character.
    F  =  The sixth ASCII character.
    G  =  The seventh ASCII character.
    H  =  The eighth ASCII character.

  Returns: A 64-bit value built from the two ASCII characters specified by A, B,
          C, D, E, F, G and H.

**/
auto SIGNATURE_64(T)(T A, T B, T C, T D, T E, T F, T G, T H)
{
    return (SIGNATURE_32(A, B, C, D) | ((UINT64)(SIGNATURE_32(E, F, G, H)) << 32));
}
