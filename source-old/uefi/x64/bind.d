/**
	Based on X64/ProcessorBind.h file, original notice:

	Processor or Compiler specific defines and types x64 (Intel 64, AMD64).

	Copyright (c) 2006 - 2015, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php

	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
**/
module uefi.x64.bind;

version (X86_64)
{
public:
extern (C):

    /// void
    alias VOID = void;

    /// 8-byte unsigned value
    alias UINT64 = ulong;

    /// 4-byte unsigned value
    alias UINT32 = uint;

    /// 2-byte unsigned value
    alias UINT16 = ushort;

    /// 1-byte unsigned value
    alias UINT8 = ubyte;

    /// 8-byte signed value
    alias INT64 = long;

    /// 4-byte signed value
    alias INT32 = int;

    /// 2-byte signed value
    alias INT16 = short;

    /// 1-byte signed value
    alias INT8 = byte;

    /// 1-byte character
    alias CHAR8 = char;

    /// 2-byte Character.  Unless otherwise specified all strings are stored in the
    /// UTF-16 encoding format as defined by Unicode 2.1 and ISO/IEC 10646 standards.
    alias CHAR16 = wchar;

    /// Logical Boolean.  1-byte value containing 0 for FALSE or a 1 for TRUE.  Other
    /// values are undefined.
    alias BOOLEAN = ubyte;

    /// Unsigned value of native width.  (4 bytes on supported 32-bit processor instructions,
    /// 8 bytes on supported 64-bit processor instructions)
    alias UINTN = UINT64;

    /// Signed value of native width.  (4 bytes on supported 32-bit processor instructions,
    /// 8 bytes on supported 64-bit processor instructions)
    alias INTN = INT64;

    /// A value of native width with the highest bit set.
    enum MAX_BIT = 0x8000_0000_0000_0000UL;

    /// A value of native width with the two highest bits set.
    enum MAX_2_BITS = 0xC000_0000_0000_0000UL;

    /// Maximum legal x64 address
    enum MAX_ADDRESS = 0xFFFF_FFFF_FFFF_FFFFUL;

    /// Maximum legal x64 INTN and UINTN values.
    enum MAX_INTN = INTN.max;
    /// ditto
    enum MAX_UINTN = UINTN.max;

    /// The stack alignment required for x64
    enum CPU_STACK_ALIGNMENT = 16;

    /**
  Return the pointer to the first instruction of a function given a function pointer.
  On x64 CPU architectures, these two pointer values are the same,
  so the implementation of this macro is very simple.

  Params:
      FunctionPointer = A pointer to a function.

  Returns: The pointer to the first instruction of a function given a function pointer.

  **/
    void* FUNCTION_ENTRY_POINT(T)(T fptr) if (is(T == function))
    {
        return cast(void*)(fptr);
    }
}
