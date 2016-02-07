/**
	Based on Protocol/SimpleTextIn.h, original notice:

	Simple Text Input protocol from the UEFI 2.0 specification.
	
	Abstraction of a very simple input device like a keyboard or serial
	terminal.
	
	Copyright (c) 2006 - 2011, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
**/
module uefi.protocols.simpletextin;
import uefi.base;
import uefi.base_type;

public:
extern (C):
enum EFI_GUID EFI_SIMPLE_TEXT_INPUT_PROTOCOL_GUID = EFI_GUID(0x387477c1,
        0x69c7, 0x11d2, [0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b]);
alias EFI_SIMPLE_TEXT_INPUT_PROTOCOL = _EFI_SIMPLE_TEXT_INPUT_PROTOCOL;
/// Protocol GUID name defined in EFI1.1.
enum SIMPLE_INPUT_PROTOCOL = EFI_SIMPLE_TEXT_INPUT_PROTOCOL_GUID;
/// Protocol name in EFI1.1 for backward-compatible.
alias SIMPLE_INPUT_INTERFACE = _EFI_SIMPLE_TEXT_INPUT_PROTOCOL;
/// The keystroke information for the key that was pressed.
struct EFI_INPUT_KEY
{
    UINT16 ScanCode;
    CHAR16 UnicodeChar;
}

enum CHAR_NULL = 0x0000;
enum CHAR_BACKSPACE = 0x0008;
enum CHAR_TAB = 0x0009;
enum CHAR_LINEFEED = 0x000A;
enum CHAR_CARRIAGE_RETURN = 0x000D;
enum SCAN_NULL = 0x0000;
enum SCAN_UP = 0x0001;
enum SCAN_DOWN = 0x0002;
enum SCAN_RIGHT = 0x0003;
enum SCAN_LEFT = 0x0004;
enum SCAN_HOME = 0x0005;
enum SCAN_END = 0x0006;
enum SCAN_INSERT = 0x0007;
enum SCAN_DELETE = 0x0008;
enum SCAN_PAGE_UP = 0x0009;
enum SCAN_PAGE_DOWN = 0x000A;
enum SCAN_F1 = 0x000B;
enum SCAN_F2 = 0x000C;
enum SCAN_F3 = 0x000D;
enum SCAN_F4 = 0x000E;
enum SCAN_F5 = 0x000F;
enum SCAN_F6 = 0x0010;
enum SCAN_F7 = 0x0011;
enum SCAN_F8 = 0x0012;
enum SCAN_F9 = 0x0013;
enum SCAN_F10 = 0x0014;
enum SCAN_ESC = 0x0017;
/**
	Reset the input device and optionally run diagnostics
	
	@param  This                 Protocol instance pointer.
	@param  ExtendedVerification Driver may perform diagnostics on reset.
	
	@retval EFI_SUCCESS          The device was reset.
	@retval EFI_DEVICE_ERROR     The device is not functioning properly and could not be reset.
	
**/
alias EFI_INPUT_RESET = EFI_STATUS function(EFI_SIMPLE_TEXT_INPUT_PROTOCOL* This,
    BOOLEAN ExtendedVerification) @nogc nothrow;
/**
	Reads the next keystroke from the input device. The WaitForKey Event can
	be used to test for existence of a keystroke via WaitForEvent () call.
	
	@param  This  Protocol instance pointer.
	@param  Key   A pointer to a buffer that is filled in with the keystroke
	information for the key that was pressed.
	
	@retval EFI_SUCCESS      The keystroke information was returned.
	@retval EFI_NOT_READY    There was no keystroke data available.
	@retval EFI_DEVICE_ERROR The keystroke information was not returned due to
	hardware errors.
	
**/
alias EFI_INPUT_READ_KEY = EFI_STATUS function(
    EFI_SIMPLE_TEXT_INPUT_PROTOCOL* This, EFI_INPUT_KEY* Key) @nogc nothrow;
/// The EFI_SIMPLE_TEXT_INPUT_PROTOCOL is used on the ConsoleIn device.
/// It is the minimum required protocol for ConsoleIn.
struct _EFI_SIMPLE_TEXT_INPUT_PROTOCOL
{
    EFI_INPUT_RESET Reset;
    EFI_INPUT_READ_KEY ReadKeyStroke;
    ///
    /// Event to use with WaitForEvent() to wait for a key to be available
    ///
    EFI_EVENT WaitForKey;
}
