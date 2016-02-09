/**
	Based on Protocol/LoadFile2.h, original notice:

	Load File protocol as defined in the UEFI 2.0 specification.
	
	Load file protocol exists to supports the addition of new boot devices,
	and to support booting from devices that do not map well to file system.
	Network boot is done via a LoadFile protocol.
	
	UEFI 2.0 can boot from any device that produces a LoadFile protocol.
	
	Copyright (c) 2006 - 2008, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
**/
module uefi.protocols.loadfile2;
import uefi.base;
import uefi.base_type;
import uefi.protocols.devicepath;

public:
extern (C):
enum EFI_GUID EFI_LOAD_FILE2_PROTOCOL_GUID = EFI_GUID(0x4006c0c1, 0xfcb3,
        0x403e, [0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d]);
/// Protocol Guid defined by UEFI2.1.
enum LOAD_FILE2_PROTOCOL = EFI_LOAD_FILE2_PROTOCOL_GUID;
alias EFI_LOAD_FILE2_PROTOCOL = _EFI_LOAD_FILE2_PROTOCOL;
/**
	Causes the driver to load a specified file.
	
	@param  This       Protocol instance pointer.
	@param  FilePath   The device specific path of the file to load.
	@param  BootPolicy Should always be FALSE.
	@param  BufferSize On input the size of Buffer in bytes. On output with a return
	code of EFI_SUCCESS, the amount of data transferred to
	Buffer. On output with a return code of EFI_BUFFER_TOO_SMALL,
	the size of Buffer required to retrieve the requested file.
	@param  Buffer     The memory buffer to transfer the file to. IF Buffer is NULL,
	then no the size of the requested file is returned in
	BufferSize.
	
	@retval EFI_SUCCESS           The file was loaded.
	@retval EFI_UNSUPPORTED       BootPolicy is TRUE.
	@retval EFI_INVALID_PARAMETER FilePath is not a valid device path, or
	BufferSize is NULL.
	@retval EFI_NO_MEDIA          No medium was present to load the file.
	@retval EFI_DEVICE_ERROR      The file was not loaded due to a device error.
	@retval EFI_NO_RESPONSE       The remote system did not respond.
	@retval EFI_NOT_FOUND         The file was not found
	@retval EFI_ABORTED           The file load process was manually canceled.
	@retval EFI_BUFFER_TOO_SMALL  The BufferSize is too small to read the current
	directory entry. BufferSize has been updated with
	the size needed to complete the request.
	
	
**/
alias EFI_LOAD_FILE2 = EFI_STATUS function(EFI_LOAD_FILE2_PROTOCOL* This,
    EFI_DEVICE_PATH_PROTOCOL* FilePath, BOOLEAN BootPolicy, UINTN* BufferSize, void* Buffer) @nogc nothrow;
/// The EFI_LOAD_FILE_PROTOCOL is a simple protocol used to obtain files from arbitrary devices.
struct _EFI_LOAD_FILE2_PROTOCOL
{
    EFI_LOAD_FILE2 LoadFile;

}
