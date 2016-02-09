/**
	Based on Protocol/SimpleTextInEx.h, original notice:

	Simple Text Input Ex protocol from the UEFI 2.0 specification.
	
	This protocol defines an extension to the EFI_SIMPLE_TEXT_INPUT_PROTOCOL
	which exposes much more state and modifier information from the input device,
	also allows one to register a notification for a particular keystroke.
	
	Copyright (c) 2006 - 2012, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
**/
module uefi.protocols.simpletextinex;
import uefi.base;
import uefi.base_type;
import std.bitmanip;
import uefi.protocols.simpletextin;

public:
extern (C):

enum EFI_GUID EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID = EFI_GUID(0xdd9e7534,
        0x7762, 0x4698, [0x8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa]);
/**
	The Reset() function resets the input device hardware. As part
	of initialization process, the firmware/device will make a quick
	but reasonable attempt to verify that the device is functioning.
	If the ExtendedVerification flag is TRUE the firmware may take
	an extended amount of time to verify the device is operating on
	reset. Otherwise the reset operation is to occur as quickly as
	possible. The hardware verification process is not defined by
	this specification and is left up to the platform firmware or
	driver to implement.
	
	@param This                 A pointer to the EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL instance.
	
	@param ExtendedVerification Indicates that the driver may
	perform a more exhaustive
	verification operation of the
	device during reset.
	
	
	@retval EFI_SUCCESS       The device was reset.
	
	@retval EFI_DEVICE_ERROR  The device is not functioning
	correctly and could not be reset.
	
**/
alias EFI_INPUT_RESET_EX = EFI_STATUS function(
    EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL* This, BOOLEAN ExtendedVerification) @nogc nothrow;
/// EFI_KEY_TOGGLE_STATE. The toggle states are defined.
/// They are: EFI_TOGGLE_STATE_VALID, EFI_SCROLL_LOCK_ACTIVE
/// EFI_NUM_LOCK_ACTIVE, EFI_CAPS_LOCK_ACTIVE
alias EFI_KEY_TOGGLE_STATE = UINT8;
struct EFI_KEY_STATE
{
    ///
    /// Reflects the currently pressed shift
    /// modifiers for the input device. The
    /// returned value is valid only if the high
    /// order bit has been set.
    ///
    UINT32 KeyShiftState;
    ///
    /// Reflects the current internal state of
    /// various toggled attributes. The returned
    /// value is valid only if the high order
    /// bit has been set.
    ///
    EFI_KEY_TOGGLE_STATE KeyToggleState;
}

struct EFI_KEY_DATA
{
    ///
    /// The EFI scan code and Unicode value returned from the input device.
    ///
    EFI_INPUT_KEY Key;
    ///
    /// The current state of various toggled attributes as well as input modifier values.
    ///
    EFI_KEY_STATE KeyState;
}

enum EFI_SHIFT_STATE_VALID = 0x80000000;
enum EFI_RIGHT_SHIFT_PRESSED = 0x00000001;
enum EFI_LEFT_SHIFT_PRESSED = 0x00000002;
enum EFI_RIGHT_CONTROL_PRESSED = 0x00000004;
enum EFI_LEFT_CONTROL_PRESSED = 0x00000008;
enum EFI_RIGHT_ALT_PRESSED = 0x00000010;
enum EFI_LEFT_ALT_PRESSED = 0x00000020;
enum EFI_RIGHT_LOGO_PRESSED = 0x00000040;
enum EFI_LEFT_LOGO_PRESSED = 0x00000080;
enum EFI_MENU_KEY_PRESSED = 0x00000100;
enum EFI_SYS_REQ_PRESSED = 0x00000200;
enum EFI_TOGGLE_STATE_VALID = 0x80;
enum EFI_KEY_STATE_EXPOSED = 0x40;
enum EFI_SCROLL_LOCK_ACTIVE = 0x01;
enum EFI_NUM_LOCK_ACTIVE = 0x02;
enum EFI_CAPS_LOCK_ACTIVE = 0x04;
enum SCAN_F11 = 0x0015;
enum SCAN_F12 = 0x0016;
enum SCAN_PAUSE = 0x0048;
enum SCAN_F13 = 0x0068;
enum SCAN_F14 = 0x0069;
enum SCAN_F15 = 0x006A;
enum SCAN_F16 = 0x006B;
enum SCAN_F17 = 0x006C;
enum SCAN_F18 = 0x006D;
enum SCAN_F19 = 0x006E;
enum SCAN_F20 = 0x006F;
enum SCAN_F21 = 0x0070;
enum SCAN_F22 = 0x0071;
enum SCAN_F23 = 0x0072;
enum SCAN_F24 = 0x0073;
enum SCAN_MUTE = 0x007F;
enum SCAN_VOLUME_UP = 0x0080;
enum SCAN_VOLUME_DOWN = 0x0081;
enum SCAN_BRIGHTNESS_UP = 0x0100;
enum SCAN_BRIGHTNESS_DOWN = 0x0101;
enum SCAN_SUSPEND = 0x0102;
enum SCAN_HIBERNATE = 0x0103;
enum SCAN_TOGGLE_DISPLAY = 0x0104;
enum SCAN_RECOVERY = 0x0105;
enum SCAN_EJECT = 0x0106;
/**
	The function reads the next keystroke from the input device. If
	there is no pending keystroke the function returns
	EFI_NOT_READY. If there is a pending keystroke, then
	KeyData.Key.ScanCode is the EFI scan code defined in Error!
	Reference source not found. The KeyData.Key.UnicodeChar is the
	actual printable character or is zero if the key does not
	represent a printable character (control key, function key,
	etc.). The KeyData.KeyState is shift state for the character
	reflected in KeyData.Key.UnicodeChar or KeyData.Key.ScanCode .
	When interpreting the data from this function, it should be
	noted that if a class of printable characters that are
	normally adjusted by shift modifiers (e.g. Shift Key + "f"
	key) would be presented solely as a KeyData.Key.UnicodeChar
	without the associated shift state. So in the previous example
	of a Shift Key + "f" key being pressed, the only pertinent
	data returned would be KeyData.Key.UnicodeChar with the value
	of "F". This of course would not typically be the case for
	non-printable characters such as the pressing of the Right
	Shift Key + F10 key since the corresponding returned data
	would be reflected both in the KeyData.KeyState.KeyShiftState
	and KeyData.Key.ScanCode values. UEFI drivers which implement
	the EFI_SIMPLE_TEXT_INPUT_EX protocol are required to return
	KeyData.Key and KeyData.KeyState values. These drivers must
	always return the most current state of
	KeyData.KeyState.KeyShiftState and
	KeyData.KeyState.KeyToggleState. It should also be noted that
	certain input devices may not be able to produce shift or toggle
	state information, and in those cases the high order bit in the
	respective Toggle and Shift state fields should not be active.
	
	
	@param This     A pointer to the EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL instance.
	
	@param KeyData  A pointer to a buffer that is filled in with
	the keystroke state data for the key that was
	pressed.
	
	
	@retval EFI_SUCCESS     The keystroke information was
	returned.
	
	@retval EFI_NOT_READY   There was no keystroke data available.
	EFI_DEVICE_ERROR The keystroke
	information was not returned due to
	hardware errors.
	
	
**/
alias EFI_INPUT_READ_KEY_EX = EFI_STATUS function(
    EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL* This, EFI_KEY_DATA* KeyData) @nogc nothrow;
/**
	The SetState() function allows the input device hardware to
	have state settings adjusted.
	
	@param This           A pointer to the EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL instance.
	
	@param KeyToggleState Pointer to the EFI_KEY_TOGGLE_STATE to
	set the state for the input device.
	
	
	@retval EFI_SUCCESS       The device state was set appropriately.
	
	@retval EFI_DEVICE_ERROR  The device is not functioning
	correctly and could not have the
	setting adjusted.
	
	@retval EFI_UNSUPPORTED   The device does not support the
	ability to have its state set.
	
**/
alias EFI_SET_STATE = EFI_STATUS function(EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL* This,
    EFI_KEY_TOGGLE_STATE* KeyToggleState) @nogc nothrow;
/// The function will be called when the key sequence is typed specified by KeyData.
alias EFI_KEY_NOTIFY_FUNCTION = EFI_STATUS function(EFI_KEY_DATA* KeyData) @nogc nothrow;
/**
	The RegisterKeystrokeNotify() function registers a function
	which will be called when a specified keystroke will occur.
	
	@param This                     A pointer to the EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL instance.
	
	@param KeyData                  A pointer to a buffer that is filled in with
	the keystroke information for the key that was
	pressed.
	
	@param KeyNotificationFunction  Points to the function to be
	called when the key sequence
	is typed specified by KeyData.
	
	
	@param NotifyHandle             Points to the unique handle assigned to
	the registered notification.
	
	@retval EFI_SUCCESS           The device state was set
	appropriately.
	
	@retval EFI_OUT_OF_RESOURCES  Unable to allocate necessary
	data structures.
	
**/
alias EFI_REGISTER_KEYSTROKE_NOTIFY = EFI_STATUS function(
    EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL* This, EFI_KEY_DATA* KeyData,
    EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction, void** NotifyHandle) @nogc nothrow;
/**
	The UnregisterKeystrokeNotify() function removes the
	notification which was previously registered.
	
	@param This               A pointer to the EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL instance.
	
	@param NotificationHandle The handle of the notification
	function being unregistered.
	
	@retval EFI_SUCCESS The device state was set appropriately.
	
	@retval EFI_INVALID_PARAMETER The NotificationHandle is
	invalid.
	
**/
alias EFI_UNREGISTER_KEYSTROKE_NOTIFY = EFI_STATUS function(
    EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL* This, void* NotificationHandle) @nogc nothrow;
/// The EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL is used on the ConsoleIn
/// device. It is an extension to the Simple Text Input protocol
/// which allows a variety of extended shift state information to be
/// returned.
struct EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL
{
    EFI_INPUT_RESET_EX Reset;
    EFI_INPUT_READ_KEY_EX ReadKeyStrokeEx;
    ///
    /// Event to use with WaitForEvent() to wait for a key to be available.
    ///
    EFI_EVENT WaitForKeyEx;
    EFI_SET_STATE SetState;
    EFI_REGISTER_KEYSTROKE_NOTIFY RegisterKeyNotify;
    EFI_UNREGISTER_KEYSTROKE_NOTIFY UnregisterKeyNotify;

}
