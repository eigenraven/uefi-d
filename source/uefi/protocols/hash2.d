/**
	Based on Protocol/Hash2.h, original notice:

	EFI_HASH2_SERVICE_BINDING_PROTOCOL as defined in UEFI 2.5.
	EFI_HASH2_PROTOCOL as defined in UEFI 2.5.
	The EFI Hash2 Service Binding Protocol is used to locate hashing services support
	provided by a driver and to create and destroy instances of the EFI Hash2 Protocol
	so that a multiple drivers can use the underlying hashing services.
	EFI_HASH2_PROTOCOL describes hashing functions for which the algorithm-required
	message padding and finalization are performed by the supporting driver.
	
	Copyright (c) 2015, Intel Corporation. All rights reserved.
	This program and the accompanying materials are licensed and made available under
	the terms and conditions of the BSD License that accompanies this distribution.
	The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php.
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
**/
module uefi.protocols.hash2;
import uefi.base;
import uefi.base_type;
import uefi.protocols.hash;

public:
extern (C):
enum EFI_GUID EFI_HASH2_SERVICE_BINDING_PROTOCOL_GUID = EFI_GUID(0xda836f8d,
        0x217f, 0x4ca0, [0x99, 0xc2, 0x1c, 0xa4, 0xe1, 0x60, 0x77, 0xea]);
enum EFI_GUID EFI_HASH2_PROTOCOL_GUID = EFI_GUID(0x55b1d734, 0xc5e1, 0x49db,
        [0x96, 0x47, 0xb1, 0x6a, 0xfb, 0xe, 0x30, 0x5b]);

alias EFI_HASH2_PROTOCOL = _EFI_HASH2_PROTOCOL;
alias EFI_MD5_HASH2 = UINT8[16];
alias EFI_SHA1_HASH2 = UINT8[20];
alias EFI_SHA224_HASH2 = UINT8[28];
alias EFI_SHA256_HASH2 = UINT8[32];
alias EFI_SHA384_HASH2 = UINT8[48];
alias EFI_SHA512_HASH2 = UINT8[64];
union EFI_HASH2_OUTPUT
{
    EFI_MD5_HASH2 Md5Hash;
    EFI_SHA1_HASH2 Sha1Hash;
    EFI_SHA224_HASH2 Sha224Hash;
    EFI_SHA256_HASH2 Sha256Hash;
    EFI_SHA384_HASH2 Sha384Hash;
    EFI_SHA512_HASH2 Sha512Hash;
}
/**
	Returns the size of the hash which results from a specific algorithm.
	
	@param[in]  This                  Points to this instance of EFI_HASH2_PROTOCOL.
	@param[in]  HashAlgorithm         Points to the EFI_GUID which identifies the algorithm to use.
	@param[out] HashSize              Holds the returned size of the algorithm's hash.
	
	@retval EFI_SUCCESS           Hash size returned successfully.
	@retval EFI_INVALID_PARAMETER This or HashSize is NULL.
	@retval EFI_UNSUPPORTED       The algorithm specified by HashAlgorithm is not supported by this driver
	or HashAlgorithm is null.
	
**/
alias EFI_HASH2_GET_HASH_SIZE = EFI_STATUS function(const EFI_HASH2_PROTOCOL* This,
    const EFI_GUID* HashAlgorithm, UINTN* HashSize) @nogc nothrow;
/**
	Creates a hash for the specified message text. The hash is not extendable.
	The output is final with any algorithm-required padding added by the function.
	
	@param[in]  This          Points to this instance of EFI_HASH2_PROTOCOL.
	@param[in]  HashAlgorithm Points to the EFI_GUID which identifies the algorithm to use.
	@param[in]  Message       Points to the start of the message.
	@param[in]  MessageSize   The size of Message, in bytes.
	@param[in,out]  Hash      On input, points to a caller-allocated buffer of the size
	returned by GetHashSize() for the specified HashAlgorithm.
	On output, the buffer holds the resulting hash computed from the message.
	
	@retval EFI_SUCCESS           Hash returned successfully.
	@retval EFI_INVALID_PARAMETER This or Hash is NULL.
	@retval EFI_UNSUPPORTED       The algorithm specified by HashAlgorithm is not supported by this driver
	or HashAlgorithm is Null.
	@retval EFI_OUT_OF_RESOURCES  Some resource required by the function is not available
	or MessageSize is greater than platform maximum.
	
**/
alias EFI_HASH2_HASH = EFI_STATUS function(const EFI_HASH2_PROTOCOL* This,
    const EFI_GUID* HashAlgorithm, const UINT8* Message, UINTN MessageSize, EFI_HASH2_OUTPUT* Hash) @nogc nothrow;
/**
	This function must be called to initialize a digest calculation to be subsequently performed using the
	EFI_HASH2_PROTOCOL functions HashUpdate() and HashFinal().
	
	@param[in]  This          Points to this instance of EFI_HASH2_PROTOCOL.
	@param[in]  HashAlgorithm Points to the EFI_GUID which identifies the algorithm to use.
	
	@retval EFI_SUCCESS           Initialized successfully.
	@retval EFI_INVALID_PARAMETER This is NULL.
	@retval EFI_UNSUPPORTED       The algorithm specified by HashAlgorithm is not supported by this driver
	or HashAlgorithm is Null.
	@retval EFI_OUT_OF_RESOURCES  Process failed due to lack of required resource.
	@retval EFI_ALREADY_STARTED   This function is called when the operation in progress is still in processing Hash(),
	or HashInit() is already called before and not terminated by HashFinal() yet on the same instance.
	
**/
alias EFI_HASH2_HASH_INIT = EFI_STATUS function(const EFI_HASH2_PROTOCOL* This,
    const EFI_GUID* HashAlgorithm) @nogc nothrow;
/**
	Updates the hash of a computation in progress by adding a message text.
	
	@param[in]  This          Points to this instance of EFI_HASH2_PROTOCOL.
	@param[in]  Message       Points to the start of the message.
	@param[in]  MessageSize   The size of Message, in bytes.
	
	@retval EFI_SUCCESS           Digest in progress updated successfully.
	@retval EFI_INVALID_PARAMETER This or Hash is NULL.
	@retval EFI_OUT_OF_RESOURCES  Some resource required by the function is not available
	or MessageSize is greater than platform maximum.
	@retval EFI_NOT_READY         This call was not preceded by a valid call to HashInit(),
	or the operation in progress was terminated by a call to Hash() or HashFinal() on the same instance.
	
**/
alias EFI_HASH2_HASH_UPDATE = EFI_STATUS function(const EFI_HASH2_PROTOCOL* This,
    const UINT8* Message, UINTN MessageSize) @nogc nothrow;
/**
	Finalizes a hash operation in progress and returns calculation result.
	The output is final with any necessary padding added by the function.
	The hash may not be further updated or extended after HashFinal().
	
	@param[in]  This          Points to this instance of EFI_HASH2_PROTOCOL.
	@param[in,out]  Hash      On input, points to a caller-allocated buffer of the size
	returned by GetHashSize() for the specified HashAlgorithm specified in preceding HashInit().
	On output, the buffer holds the resulting hash computed from the message.
	
	@retval EFI_SUCCESS           Hash returned successfully.
	@retval EFI_INVALID_PARAMETER This or Hash is NULL.
	@retval EFI_NOT_READY         This call was not preceded by a valid call to HashInit() and at least one call to HashUpdate(),
	or the operation in progress was canceled by a call to Hash() on the same instance.
	
**/
alias EFI_HASH2_HASH_FINAL = EFI_STATUS function(const EFI_HASH2_PROTOCOL* This,
    EFI_HASH2_OUTPUT* Hash) @nogc nothrow;
/// This protocol describes hashing functions for which the algorithm-required message padding and
/// finalization are performed by the supporting driver.
struct _EFI_HASH2_PROTOCOL
{
    EFI_HASH2_GET_HASH_SIZE GetHashSize;
    EFI_HASH2_HASH Hash;
    EFI_HASH2_HASH_INIT HashInit;
    EFI_HASH2_HASH_UPDATE HashUpdate;
    EFI_HASH2_HASH_FINAL HashFinal;

}
