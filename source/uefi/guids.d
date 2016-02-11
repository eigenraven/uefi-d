/**
	Based on Guid/*.h, original notice:
	
	Copyright (c) 2006 - 2009, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
	@par Revision Reference:
	GUIDs defined in UEFI 2.0 spec.
	
**/
module uefi.guids;
import uefi.base;
import uefi.base_type;

import uefi.protocols.loadedimage;
import uefi.protocols.graphicsoutput;
import uefi.protocols.hash;

public:
extern (C):
enum EFI_GUID ACPI_TABLE_GUID = EFI_GUID(0xeb9d2d30, 0x2d88, 0x11d3, [0x9a,
        0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
enum EFI_GUID EFI_ACPI_TABLE_GUID = EFI_GUID(0x8868e871, 0xe4f1, 0x11d3, [0xbc,
        0x22, 0x0, 0x80, 0xc7, 0x3c, 0x88, 0x81]);
enum ACPI_10_TABLE_GUID = ACPI_TABLE_GUID;
enum EFI_ACPI_20_TABLE_GUID = EFI_ACPI_TABLE_GUID;
enum EFI_GUID PEI_APRIORI_FILE_NAME_GUID = EFI_GUID(0x1b45cc0a, 0x156a, 0x428a,
        [0x62, 0XAF, 0x49, 0x86, 0x4d, 0xa0, 0xe6, 0xe6]);
///  This file must be of type EFI_FV_FILETYPE_FREEFORM and must
///  contain a single section of type EFI_SECTION_RAW. For details on
///  firmware volumes, firmware file types, and firmware file section
///  types.
struct PEI_APRIORI_FILE_CONTENTS
{
    ///
    /// An array of zero or more EFI_GUID type entries that match the file names of PEIM
    /// modules in the same Firmware Volume. The maximum number of entries. 
    ///
    EFI_GUID[1] FileNamesWithinVolume;
}

enum EFI_GUID EFI_APRIORI_GUID = EFI_GUID(0xfc510ee7, 0xffdc, 0x11d4, [0xbd,
        0x41, 0x0, 0x80, 0xc7, 0x3c, 0x88, 0x81]);
enum EFI_GUID EFI_CAPSULE_REPORT_GUID = EFI_GUID(0x39b68c46, 0xf7fb, 0x441b,
        [0xb6, 0xec, 0x16, 0xb0, 0xf6, 0x98, 0x21, 0xf3]);
struct EFI_CAPSULE_RESULT_VARIABLE_HEADER
{
    ///
    /// Size in bytes of the variable including any data beyond header as specified by CapsuleGuid
    ///
    UINT32 VariableTotalSize;
    ///
    /// For alignment
    ///
    UINT32 Reserved;
    ///
    /// Guid from EFI_CAPSULE_HEADER
    ///
    EFI_GUID CapsuleGuid;
    ///
    /// Timestamp using system time when processing completed
    ///
    EFI_TIME CapsuleProcessed;
    ///
    /// Result of the capsule processing. Exact interpretation of any error code may depend
    /// upon type of capsule processed
    ///
    EFI_STATUS CapsuleStatus;
}

struct EFI_CAPSULE_RESULT_VARIABLE_FMP
{
    ///
    /// Version of this structure, currently 0x00000001
    ///
    UINT16 Version;
    ///
    /// The index of the payload within the FMP capsule which was processed to generate this report
    /// Starting from zero
    ///
    UINT8 PayloadIndex;
    ///
    /// The UpdateImageIndex from EFI_FIRMWARE_MANAGEMENT_CAPSULE_IMAGE_HEADER
    /// (after unsigned conversion from UINT8 to UINT16).
    ///
    UINT8 UpdateImageIndex;
    ///
    /// The UpdateImageTypeId Guid from EFI_FIRMWARE_MANAGEMENT_CAPSULE_IMAGE_HEADER.
    ///
    EFI_GUID UpdateImageTypeId;
    ///
    /// In case of capsule loaded from disk, the zero-terminated array containing file name of capsule that was processed.
    /// In case of capsule submitted directly to UpdateCapsule() there is no file name, and this field is required to contain a single 16-bit zero character
    ///  which is included in VariableTotalSize.
    ///
    /// CHAR16 CapsuleFileName[];
    ///
    ///
    /// This field will contain a zero-terminated CHAR16 string containing the text representation of the device path of device publishing Firmware Management Protocol
    /// (if present). In case where device path is not present and the target is not otherwise known to firmware, or when payload was blocked by policy, or skipped,
    /// this field is required to contain a single 16-bit zero character which is included in VariableTotalSize.
    ///
    /// CHAR16 CapsuleTarget[];
    ///
}

enum EFI_ERROR_RECORD_SIGNATURE_START = SIGNATURE_32('C', 'P', 'E', 'R');
enum EFI_ERROR_RECORD_SIGNATURE_END = 0xFFFFFFFF;
/// Error Severity in Error Record Header and Error Section Descriptor
///@{
enum EFI_GENERIC_ERROR_RECOVERABLE = 0x00000000;
enum EFI_GENERIC_ERROR_FATAL = 0x00000001;
enum EFI_GENERIC_ERROR_CORRECTED = 0x00000002;
enum EFI_GENERIC_ERROR_INFO = 0x00000003;
///@}
/// The validation bit mask indicates the validity of the following fields
/// in Error Record Header.
///@{
enum EFI_ERROR_RECORD_HEADER_PLATFORM_ID_VALID = BIT0;
enum EFI_ERROR_RECORD_HEADER_TIME_STAMP_VALID = BIT1;
enum EFI_ERROR_RECORD_HEADER_PARTITION_ID_VALID = BIT2;
///@}
/// Timestamp is precise if this bit is set and correlates to the time of the
/// error event.
enum EFI_ERROR_TIME_STAMP_PRECISE = BIT0;
/// The timestamp correlates to the time when the error information was collected
/// by the system software and may not necessarily represent the time of the error
/// event. The timestamp contains the local time in BCD format.
struct EFI_ERROR_TIME_STAMP
{
align(1):
    UINT8 Seconds;
    UINT8 Minutes;
    UINT8 Hours;
    UINT8 Flag;
    UINT8 Day;
    UINT8 Month;
    UINT8 Year;
    UINT8 Century;
}
/// GUID value indicating the record association with an error event notification type.
///@{
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_CMC_GUID = EFI_GUID(0x2DCE8BB1,
        0xBDD7, 0x450e, [0xB9, 0xAD, 0x9C, 0xF4, 0xEB, 0xD4, 0xF8, 0x90]);
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_CPE_GUID = EFI_GUID(0x4E292F96,
        0xD843, 0x4a55, [0xA8, 0xC2, 0xD4, 0x81, 0xF2, 0x7E, 0xBE, 0xEE]);
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_MCE_GUID = EFI_GUID(0xE8F56FFE,
        0x919C, 0x4cc5, [0xBA, 0x88, 0x65, 0xAB, 0xE1, 0x49, 0x13, 0xBB]);
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_PCIE_GUID = EFI_GUID(0xCF93C01F,
        0x1A16, 0x4dfc, [0xB8, 0xBC, 0x9C, 0x4D, 0xAF, 0x67, 0xC1, 0x04]);
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_INIT_GUID = EFI_GUID(0xCC5263E8,
        0x9308, 0x454a, [0x89, 0xD0, 0x34, 0x0B, 0xD3, 0x9B, 0xC9, 0x8E]);
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_NMI_GUID = EFI_GUID(0x5BAD89FF,
        0xB7E6, 0x42c9, [0x81, 0x4A, 0xCF, 0x24, 0x85, 0xD6, 0xE9, 0x8A]);
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_BOOT_GUID = EFI_GUID(0x3D61A466,
        0xAB40, 0x409a, [0xA6, 0x98, 0xF3, 0x62, 0xD4, 0x64, 0xB3, 0x8F]);
enum EFI_GUID EFI_EVENT_NOTIFICATION_TYEP_DMAR_GUID = EFI_GUID(0x667DD791,
        0xC6B3, 0x4c27, [0x8A, 0x6B, 0x0F, 0x8E, 0x72, 0x2D, 0xEB, 0x41]);
///@}
/// Error Record Header Flags
///@{
enum EFI_HW_ERROR_FLAGS_RECOVERED = 0x00000001;
enum EFI_HW_ERROR_FLAGS_PREVERR = 0x00000002;
enum EFI_HW_ERROR_FLAGS_SIMULATED = 0x00000004;
///@}
/// Common error record header
struct EFI_COMMON_ERROR_RECORD_HEADER
{
align(1):
    UINT32 SignatureStart;
    UINT16 Revision;
    UINT32 SignatureEnd;
    UINT16 SectionCount;
    UINT32 ErrorSeverity;
    UINT32 ValidationBits;
    UINT32 RecordLength;
    EFI_ERROR_TIME_STAMP TimeStamp;
    EFI_GUID PlatformID;
    EFI_GUID PartitionID;
    EFI_GUID CreatorID;
    EFI_GUID NotificationType;
    UINT64 RecordID;
    UINT32 Flags;
    UINT64 PersistenceInfo;
    UINT8[12] Resv1;
    ///
    /// An array of SectionCount descriptors for the associated
    /// sections. The number of valid sections is equivalent to the
    /// SectionCount. The buffer size of the record may include
    /// more space to dynamically add additional Section
    /// Descriptors to the error record.
    ///
}
/// Validity Fields in Error Section Descriptor.
enum EFI_ERROR_SECTION_FRU_ID_VALID = BIT0;
enum EFI_ERROR_SECTION_FRU_STRING_VALID = BIT1;
/// Flag field contains information that describes the error section
/// in Error Section Descriptor.
enum EFI_ERROR_SECTION_FLAGS_PRIMARY = BIT0;
enum EFI_ERROR_SECTION_FLAGS_CONTAINMENT_WARNING = BIT1;
enum EFI_ERROR_SECTION_FLAGS_RESET = BIT2;
enum EFI_ERROR_SECTION_FLAGS_ERROR_THRESHOLD_EXCEEDED = BIT3;
enum EFI_ERROR_SECTION_FLAGS_RESOURCE_NOT_ACCESSIBLE = BIT4;
enum EFI_ERROR_SECTION_FLAGS_LATENT_ERROR = BIT5;
/// Error Sectition Type GUIDs in Error Section Descriptor
///@{
enum EFI_GUID EFI_ERROR_SECTION_PROCESSOR_GENERIC_GUID = EFI_GUID(0x9876ccad,
        0x47b4, 0x4bdb, [0xb6, 0x5e, 0x16, 0xf1, 0x93, 0xc4, 0xf3, 0xdb]);
enum EFI_GUID EFI_ERROR_SECTION_PROCESSOR_SPECIFIC_GUID = EFI_GUID(0xdc3ea0b0,
        0xa144, 0x4797, [0xb9, 0x5b, 0x53, 0xfa, 0x24, 0x2b, 0x6e, 0x1d]);
enum EFI_GUID EFI_ERROR_SECTION_PLATFORM_MEMORY_GUID = EFI_GUID(0xa5bc1114,
        0x6f64, 0x4ede, [0xb8, 0x63, 0x3e, 0x83, 0xed, 0x7c, 0x83, 0xb1]);
enum EFI_GUID EFI_ERROR_SECTION_PLATFORM_MEMORY2_GUID = EFI_GUID(0x61EC04FC,
        0x48E6, 0xD813, [0x25, 0xC9, 0x8D, 0xAA, 0x44, 0x75, 0x0B, 0x12]);
enum EFI_GUID EFI_ERROR_SECTION_PCIE_GUID = EFI_GUID(0xd995e954, 0xbbc1,
        0x430f, [0xad, 0x91, 0xb4, 0x4d, 0xcb, 0x3c, 0x6f, 0x35]);
enum EFI_GUID EFI_ERROR_SECTION_FW_ERROR_RECORD_GUID = EFI_GUID(0x81212a96,
        0x09ed, 0x4996, [0x94, 0x71, 0x8d, 0x72, 0x9c, 0x8e, 0x69, 0xed]);
enum EFI_GUID EFI_ERROR_SECTION_PCI_PCIX_BUS_GUID = EFI_GUID(0xc5753963,
        0x3b84, 0x4095, [0xbf, 0x78, 0xed, 0xda, 0xd3, 0xf9, 0xc9, 0xdd]);
enum EFI_GUID EFI_ERROR_SECTION_PCI_DEVICE_GUID = EFI_GUID(0xeb5e4685, 0xca66,
        0x4769, [0xb6, 0xa2, 0x26, 0x06, 0x8b, 0x00, 0x13, 0x26]);
enum EFI_GUID EFI_ERROR_SECTION_DMAR_GENERIC_GUID = EFI_GUID(0x5b51fef7,
        0xc79d, 0x4434, [0x8f, 0x1b, 0xaa, 0x62, 0xde, 0x3e, 0x2c, 0x64]);
enum EFI_GUID EFI_ERROR_SECTION_DIRECTED_IO_DMAR_GUID = EFI_GUID(0x71761d37,
        0x32b2, 0x45cd, [0xa7, 0xd0, 0xb0, 0xfe, 0xdd, 0x93, 0xe8, 0xcf]);
enum EFI_GUID EFI_ERROR_SECTION_IOMMU_DMAR_GUID = EFI_GUID(0x036f84e1, 0x7f37,
        0x428c, [0xa7, 0x9e, 0x57, 0x5f, 0xdf, 0xaa, 0x84, 0xec]);
///@}
/// Error Section Descriptor
struct EFI_ERROR_SECTION_DESCRIPTOR
{
align(1):
    UINT32 SectionOffset;
    UINT32 SectionLength;
    UINT16 Revision;
    UINT8 SecValidMask;
    UINT8 Resv1;
    UINT32 SectionFlags;
    EFI_GUID SectionType;
    EFI_GUID FruId;
    UINT32 Severity;
    CHAR8[20] FruString;
}
/// The validation bit mask indicates whether or not each of the following fields are
/// valid in Proessor Generic Error section.
///@{
enum EFI_GENERIC_ERROR_PROC_TYPE_VALID = BIT0;
enum EFI_GENERIC_ERROR_PROC_ISA_VALID = BIT1;
enum EFI_GENERIC_ERROR_PROC_ERROR_TYPE_VALID = BIT2;
enum EFI_GENERIC_ERROR_PROC_OPERATION_VALID = BIT3;
enum EFI_GENERIC_ERROR_PROC_FLAGS_VALID = BIT4;
enum EFI_GENERIC_ERROR_PROC_LEVEL_VALID = BIT5;
enum EFI_GENERIC_ERROR_PROC_VERSION_VALID = BIT6;
enum EFI_GENERIC_ERROR_PROC_BRAND_VALID = BIT7;
enum EFI_GENERIC_ERROR_PROC_ID_VALID = BIT8;
enum EFI_GENERIC_ERROR_PROC_TARGET_ADDR_VALID = BIT9;
enum EFI_GENERIC_ERROR_PROC_REQUESTER_ID_VALID = BIT10;
enum EFI_GENERIC_ERROR_PROC_RESPONDER_ID_VALID = BIT11;
enum EFI_GENERIC_ERROR_PROC_INST_IP_VALID = BIT12;
///@}
/// The type of the processor architecture in Proessor Generic Error section.
///@{
enum EFI_GENERIC_ERROR_PROC_TYPE_IA32_X64 = 0x00;
enum EFI_GENERIC_ERROR_PROC_TYPE_IA64 = 0x01;
///@}
/// The type of the instruction set executing when the error occurred in Proessor
/// Generic Error section.
///@{
enum EFI_GENERIC_ERROR_PROC_ISA_IA32 = 0x00;
enum EFI_GENERIC_ERROR_PROC_ISA_IA64 = 0x01;
enum EFI_GENERIC_ERROR_PROC_ISA_X64 = 0x02;
///@}
/// The type of error that occurred in Proessor Generic Error section.
///@{
enum EFI_GENERIC_ERROR_PROC_ERROR_TYPE_UNKNOWN = 0x00;
enum EFI_GENERIC_ERROR_PROC_ERROR_TYPE_CACHE = 0x01;
enum EFI_GENERIC_ERROR_PROC_ERROR_TYPE_TLB = 0x02;
enum EFI_GENERIC_ERROR_PROC_ERROR_TYPE_BUS = 0x04;
enum EFI_GENERIC_ERROR_PROC_ERROR_TYPE_MICRO_ARCH = 0x08;
///@}
/// The type of operation in Proessor Generic Error section.
///@{
enum EFI_GENERIC_ERROR_PROC_OPERATION_GENERIC = 0x00;
enum EFI_GENERIC_ERROR_PROC_OPERATION_DATA_READ = 0x01;
enum EFI_GENERIC_ERROR_PROC_OPERATION_DATA_WRITE = 0x02;
enum EFI_GENERIC_ERROR_PROC_OPERATION_INSTRUCTION_EXEC = 0x03;
///@}
/// Flags bit mask indicates additional information about the error in Proessor Generic
/// Error section
///@{
enum EFI_GENERIC_ERROR_PROC_FLAGS_RESTARTABLE = BIT0;
enum EFI_GENERIC_ERROR_PROC_FLAGS_PRECISE_IP = BIT1;
enum EFI_GENERIC_ERROR_PROC_FLAGS_OVERFLOW = BIT2;
enum EFI_GENERIC_ERROR_PROC_FLAGS_CORRECTED = BIT3;
///@}
/// Processor Generic Error Section
/// describes processor reported hardware errors for logical processors in the system.
struct EFI_PROCESSOR_GENERIC_ERROR_DATA
{
align(1):
    UINT64 ValidFields;
    UINT8 Type;
    UINT8 Isa;
    UINT8 ErrorType;
    UINT8 Operation;
    UINT8 Flags;
    UINT8 Level;
    UINT16 Resv1;
    UINT64 VersionInfo;
    CHAR8[128] BrandString;
    UINT64 ApicId;
    UINT64 TargetAddr;
    UINT64 RequestorId;
    UINT64 ResponderId;
    UINT64 InstructionIP;
}
/// IA32 and x64 Specific definitions.
/// GUID value indicating the type of Processor Error Information structure
/// in IA32/X64 Processor Error Information Structure.
///@{
enum EFI_GUID EFI_IA32_X64_ERROR_TYPE_CACHE_CHECK_GUID = EFI_GUID(0xA55701F5,
        0xE3EF, 0x43de, [0xAC, 0x72, 0x24, 0x9B, 0x57, 0x3F, 0xAD, 0x2C]);
enum EFI_GUID EFI_IA32_X64_ERROR_TYPE_TLB_CHECK_GUID = EFI_GUID(0xFC06B535,
        0x5E1F, 0x4562, [0x9F, 0x25, 0x0A, 0x3B, 0x9A, 0xDB, 0x63, 0xC3]);
enum EFI_GUID EFI_IA32_X64_ERROR_TYPE_BUS_CHECK_GUID = EFI_GUID(0x1CF3F8B3,
        0xC5B1, 0x49a2, [0xAA, 0x59, 0x5E, 0xEF, 0x92, 0xFF, 0xA6, 0x3C]);
enum EFI_GUID EFI_IA32_X64_ERROR_TYPE_MS_CHECK_GUID = EFI_GUID(0x48AB7F57,
        0xDC34, 0x4f6c, [0xA7, 0xD3, 0xB0, 0xB5, 0xB0, 0xA7, 0x43, 0x14]);
///@}
/// The validation bit mask indicates which fields in the Cache Check structure
/// are valid.
///@{
enum EFI_CACHE_CHECK_TRANSACTION_TYPE_VALID = BIT0;
enum EFI_CACHE_CHECK_OPERATION_VALID = BIT1;
enum EFI_CACHE_CHECK_LEVEL_VALID = BIT2;
enum EFI_CACHE_CHECK_CONTEXT_CORRUPT_VALID = BIT3;
enum EFI_CACHE_CHECK_UNCORRECTED_VALID = BIT4;
enum EFI_CACHE_CHECK_PRECISE_IP_VALID = BIT5;
enum EFI_CACHE_CHECK_RESTARTABLE_VALID = BIT6;
enum EFI_CACHE_CHECK_OVERFLOW_VALID = BIT7;
///@}
/// Type of cache error in the Cache Check structure
///@{
enum EFI_CACHE_CHECK_ERROR_TYPE_INSTRUCTION = 0;
enum EFI_CACHE_CHECK_ERROR_TYPE_DATA_ACCESS = 1;
enum EFI_CACHE_CHECK_ERROR_TYPE_GENERIC = 2;
///@}
/// Type of cache operation that caused the error in the Cache
/// Check structure
///@{
enum EFI_CACHE_CHECK_OPERATION_TYPE_GENERIC = 0;
enum EFI_CACHE_CHECK_OPERATION_TYPE_GENERIC_READ = 1;
enum EFI_CACHE_CHECK_OPERATION_TYPE_GENERIC_WRITE = 2;
enum EFI_CACHE_CHECK_OPERATION_TYPE_DATA_READ = 3;
enum EFI_CACHE_CHECK_OPERATION_TYPE_DATA_WRITE = 4;
enum EFI_CACHE_CHECK_OPERATION_TYPE_INSTRUCTION_FETCH = 5;
enum EFI_CACHE_CHECK_OPERATION_TYPE_PREFETCH = 6;
enum EFI_CACHE_CHECK_OPERATION_TYPE_EVICTION = 7;
enum EFI_CACHE_CHECK_OPERATION_TYPE_SNOOP = 8;
///@}
/// IA32/X64 Cache Check Structure
struct EFI_IA32_X64_CACHE_CHECK_INFO
{
align(1):
    mixin(bitfields!(UINT64, "ValidFields", 16, UINT64, "TransactionType", 2,
        UINT64, "Operation", 4, UINT64, "Leve", 3, UINT64, "ContextCorrupt"w,
        1, UINT64, "ErrorUncorrected", 1, UINT64, "PreciseIp", 1, UINT64,
        "RestartableIp", 1, UINT64, "Overflow", 1, UINT64, "Resv1", 34));
}
/// The validation bit mask indicates which fields in the TLB Check structure
/// are valid.
///@{
enum EFI_TLB_CHECK_TRANSACTION_TYPE_VALID = BIT0;
enum EFI_TLB_CHECK_OPERATION_VALID = BIT1;
enum EFI_TLB_CHECK_LEVEL_VALID = BIT2;
enum EFI_TLB_CHECK_CONTEXT_CORRUPT_VALID = BIT3;
enum EFI_TLB_CHECK_UNCORRECTED_VALID = BIT4;
enum EFI_TLB_CHECK_PRECISE_IP_VALID = BIT5;
enum EFI_TLB_CHECK_RESTARTABLE_VALID = BIT6;
enum EFI_TLB_CHECK_OVERFLOW_VALID = BIT7;
///@}
/// Type of cache error in the TLB Check structure
///@{
enum EFI_TLB_CHECK_ERROR_TYPE_INSTRUCTION = 0;
enum EFI_TLB_CHECK_ERROR_TYPE_DATA_ACCESS = 1;
enum EFI_TLB_CHECK_ERROR_TYPE_GENERIC = 2;
///@}
/// Type of cache operation that caused the error in the TLB
/// Check structure
///@{
enum EFI_TLB_CHECK_OPERATION_TYPE_GENERIC = 0;
enum EFI_TLB_CHECK_OPERATION_TYPE_GENERIC_READ = 1;
enum EFI_TLB_CHECK_OPERATION_TYPE_GENERIC_WRITE = 2;
enum EFI_TLB_CHECK_OPERATION_TYPE_DATA_READ = 3;
enum EFI_TLB_CHECK_OPERATION_TYPE_DATA_WRITE = 4;
enum EFI_TLB_CHECK_OPERATION_TYPE_INST_FETCH = 5;
enum EFI_TLB_CHECK_OPERATION_TYPE_PREFETCH = 6;
///@}
/// IA32/X64 TLB Check Structure
struct EFI_IA32_X64_TLB_CHECK_INFO
{
align(1):
    mixin(bitfields!(UINT64, "ValidFields", 16, UINT64, "TransactionType", 2,
        UINT64, "Operation", 4, UINT64, "Leve", 3, UINT64, "ContextCorrupt"w,
        1, UINT64, "ErrorUncorrected", 1, UINT64, "PreciseIp", 1, UINT64,
        "RestartableIp", 1, UINT64, "Overflow", 1, UINT64, "Resv1", 34));
}
/// The validation bit mask indicates which fields in the MS Check structure
/// are valid.
///@{
enum EFI_BUS_CHECK_TRANSACTION_TYPE_VALID = BIT0;
enum EFI_BUS_CHECK_OPERATION_VALID = BIT1;
enum EFI_BUS_CHECK_LEVEL_VALID = BIT2;
enum EFI_BUS_CHECK_CONTEXT_CORRUPT_VALID = BIT3;
enum EFI_BUS_CHECK_UNCORRECTED_VALID = BIT4;
enum EFI_BUS_CHECK_PRECISE_IP_VALID = BIT5;
enum EFI_BUS_CHECK_RESTARTABLE_VALID = BIT6;
enum EFI_BUS_CHECK_OVERFLOW_VALID = BIT7;
enum EFI_BUS_CHECK_PARTICIPATION_TYPE_VALID = BIT8;
enum EFI_BUS_CHECK_TIME_OUT_VALID = BIT9;
enum EFI_BUS_CHECK_ADDRESS_SPACE_VALID = BIT10;
///@}
/// Type of cache error in the Bus Check structure
///@{
enum EFI_BUS_CHECK_ERROR_TYPE_INSTRUCTION = 0;
enum EFI_BUS_CHECK_ERROR_TYPE_DATA_ACCESS = 1;
enum EFI_BUS_CHECK_ERROR_TYPE_GENERIC = 2;
///@}
/// Type of cache operation that caused the error in the Bus
/// Check structure
///@{
enum EFI_BUS_CHECK_OPERATION_TYPE_GENERIC = 0;
enum EFI_BUS_CHECK_OPERATION_TYPE_GENERIC_READ = 1;
enum EFI_BUS_CHECK_OPERATION_TYPE_GENERIC_WRITE = 2;
enum EFI_BUS_CHECK_OPERATION_TYPE_DATA_READ = 3;
enum EFI_BUS_CHECK_OPERATION_TYPE_DATA_WRITE = 4;
enum EFI_BUS_CHECK_OPERATION_TYPE_INST_FETCH = 5;
enum EFI_BUS_CHECK_OPERATION_TYPE_PREFETCH = 6;
///@}
/// Type of Participation
///@{
enum EFI_BUS_CHECK_PARTICIPATION_TYPE_REQUEST = 0;
enum EFI_BUS_CHECK_PARTICIPATION_TYPE_RESPONDED = 1;
enum EFI_BUS_CHECK_PARTICIPATION_TYPE_OBSERVED = 2;
enum EFI_BUS_CHECK_PARTICIPATION_TYPE_GENERIC = 3;
///@}
/// Type of Address Space
///@{
enum EFI_BUS_CHECK_ADDRESS_SPACE_TYPE_MEMORY = 0;
enum EFI_BUS_CHECK_ADDRESS_SPACE_TYPE_RESERVED = 1;
enum EFI_BUS_CHECK_ADDRESS_SPACE_TYPE_IO = 2;
enum EFI_BUS_CHECK_ADDRESS_SPACE_TYPE_OTHER = 3;
///@}
/// IA32/X64 Bus Check Structure
struct EFI_IA32_X64_BUS_CHECK_INFO
{
align(1):
    mixin(bitfields!(UINT64, "ValidFields", 16, UINT64, "TransactionType", 2,
        UINT64, "Operation", 4, UINT64, "Leve", 3, UINT64, "ContextCorrupt"w,
        1, UINT64, "ErrorUncorrected", 1, UINT64, "PreciseIp", 1, UINT64,
        "RestartableIp", 1, UINT64, "Overflow", 1, UINT64, "ParticipationType",
        2, UINT64, "TimeOut", 1, UINT64, "AddressSpace", 2, UINT64, "Resv1", 29));
}
/// The validation bit mask indicates which fields in the MS Check structure
/// are valid.
///@{
enum EFI_MS_CHECK_ERROR_TYPE_VALID = BIT0;
enum EFI_MS_CHECK_CONTEXT_CORRUPT_VALID = BIT1;
enum EFI_MS_CHECK_UNCORRECTED_VALID = BIT2;
enum EFI_MS_CHECK_PRECISE_IP_VALID = BIT3;
enum EFI_MS_CHECK_RESTARTABLE_VALID = BIT4;
enum EFI_MS_CHECK_OVERFLOW_VALID = BIT5;
///@}
/// Error type identifies the operation that caused the error.
///@{
enum EFI_MS_CHECK_ERROR_TYPE_NO = 0;
enum EFI_MS_CHECK_ERROR_TYPE_UNCLASSIFIED = 1;
enum EFI_MS_CHECK_ERROR_TYPE_MICROCODE_PARITY = 2;
enum EFI_MS_CHECK_ERROR_TYPE_EXTERNAL = 3;
enum EFI_MS_CHECK_ERROR_TYPE_FRC = 4;
enum EFI_MS_CHECK_ERROR_TYPE_INTERNAL_UNCLASSIFIED = 5;
///@}
/// IA32/X64 MS Check Field Description
struct EFI_IA32_X64_MS_CHECK_INFO
{
align(1):
    mixin(bitfields!(UINT64, "ValidFields", 16, UINT64, "ErrorType", 3,
        UINT64, "ContextCorrupt", 1, UINT64, "ErrorUncorrected", 1, UINT64,
        "PreciseIp", 1, UINT64, "RestartableIp", 1, UINT64, "Overflow", 1, UINT64,
        "Resv1", 40));
}
/// IA32/X64 Check Information Item
union EFI_IA32_X64_CHECK_INFO_ITEM
{
    EFI_IA32_X64_CACHE_CHECK_INFO CacheCheck;
    EFI_IA32_X64_TLB_CHECK_INFO TlbCheck;
    EFI_IA32_X64_BUS_CHECK_INFO BusCheck;
    EFI_IA32_X64_MS_CHECK_INFO MsCheck;
    UINT64 Data64;
}
/// The validation bit mask indicates which fields in the IA32/X64 Processor Error
/// Information Structure are valid.
///@{
enum EFI_IA32_X64_ERROR_PROC_CHECK_INFO_VALID = BIT0;
enum EFI_IA32_X64_ERROR_PROC_TARGET_ADDR_VALID = BIT1;
enum EFI_IA32_X64_ERROR_PROC_REQUESTER_ID_VALID = BIT2;
enum EFI_IA32_X64_ERROR_PROC_RESPONDER_ID_VALID = BIT3;
enum EFI_IA32_X64_ERROR_PROC_INST_IP_VALID = BIT4;
///@}
/// IA32/X64 Processor Error Information Structure
struct EFI_IA32_X64_PROCESS_ERROR_INFO
{
align(1):
    EFI_GUID ErrorType;
    UINT64 ValidFields;
    EFI_IA32_X64_CHECK_INFO_ITEM CheckInfo;
    UINT64 TargetId;
    UINT64 RequestorId;
    UINT64 ResponderId;
    UINT64 InstructionIP;
}
/// IA32/X64 Processor Context Information Structure
struct EFI_IA32_X64_PROCESSOR_CONTEXT_INFO
{
align(1):
    UINT16 RegisterType;
    UINT16 ArraySize;
    UINT32 MsrAddress;
    UINT64 MmRegisterAddress;
    //
    // This field will provide the contents of the actual registers or raw data.
    // The number of Registers or size of the raw data reported is determined
    // by (Array Size / 8) or otherwise specified by the context structure type
    // definition.
    //
}
/// Register Context Type
///@{
enum EFI_REG_CONTEXT_TYPE_UNCLASSIFIED = 0x0000;
enum EFI_REG_CONTEXT_TYPE_MSR = 0x0001;
enum EFI_REG_CONTEXT_TYPE_IA32 = 0x0002;
enum EFI_REG_CONTEXT_TYPE_X64 = 0x0003;
enum EFI_REG_CONTEXT_TYPE_FXSAVE = 0x0004;
enum EFI_REG_CONTEXT_TYPE_DR_IA32 = 0x0005;
enum EFI_REG_CONTEXT_TYPE_DR_X64 = 0x0006;
enum EFI_REG_CONTEXT_TYPE_MEM_MAP = 0x0007;
///@}
/// IA32 Register State
struct EFI_CONTEXT_IA32_REGISTER_STATE
{
align(1):
    UINT32 Eax;
    UINT32 Ebx;
    UINT32 Ecx;
    UINT32 Edx;
    UINT32 Esi;
    UINT32 Edi;
    UINT32 Ebp;
    UINT32 Esp;
    UINT16 Cs;
    UINT16 Ds;
    UINT16 Ss;
    UINT16 Es;
    UINT16 Fs;
    UINT16 Gs;
    UINT32 Eflags;
    UINT32 Eip;
    UINT32 Cr0;
    UINT32 Cr1;
    UINT32 Cr2;
    UINT32 Cr3;
    UINT32 Cr4;
    UINT32[2] Gdtr;
    UINT32[2] Idtr;
    UINT16 Ldtr;
    UINT16 Tr;
}
/// X64 Register State
struct EFI_CONTEXT_X64_REGISTER_STATE
{
align(1):
    UINT64 Rax;
    UINT64 Rbx;
    UINT64 Rcx;
    UINT64 Rdx;
    UINT64 Rsi;
    UINT64 Rdi;
    UINT64 Rbp;
    UINT64 Rsp;
    UINT64 R8;
    UINT64 R9;
    UINT64 R10;
    UINT64 R11;
    UINT64 R12;
    UINT64 R13;
    UINT64 R14;
    UINT64 R15;
    UINT16 Cs;
    UINT16 Ds;
    UINT16 Ss;
    UINT16 Es;
    UINT16 Fs;
    UINT16 Gs;
    UINT32 Resv1;
    UINT64 Rflags;
    UINT64 Rip;
    UINT64 Cr0;
    UINT64 Cr1;
    UINT64 Cr2;
    UINT64 Cr3;
    UINT64 Cr4;
    UINT64[2] Gdtr;
    UINT64[2] Idtr;
    UINT16 Ldtr;
    UINT16 Tr;
}
/// The validation bit mask indicates each of the following field is in IA32/X64
/// Processor Error Section.
struct EFI_IA32_X64_VALID_BITS
{
align(1):
    mixin(bitfields!(UINT64, "ApicIdValid", 1, UINT64, "CpuIdInforValid", 1,
        UINT64, "ErrorInfoNum", 6, UINT64, "ContextNum", 6, UINT64, "Resv1", 50));
}
/// Error Status Fields
struct EFI_GENERIC_ERROR_STATUS
{
align(1):
    mixin(bitfields!(UINT64, "Resv1", 8, UINT64, "Type", 8, UINT64,
        "AddressSigna", 1, UINT64, "ControlSignal", 1, UINT64, "DataSignal"w,
        1, UINT64, "DetectedByResponder", 1, UINT64, "DetectedByRequester", 1,
        UINT64, "FirstError", 1, UINT64, "OverflowNotLogged", 1, UINT64, "Resv2", 41));
}
/// Error Type
alias EFI_GENERIC_ERROR_STATUS_ERROR_TYPE = UINT32;
enum : EFI_GENERIC_ERROR_STATUS_ERROR_TYPE
{
    ///
    /// General Internal errors
    ///
    ErrorInternal = 1,
    ErrorBus = 16,
    ///
    /// Component Internal errors
    ///
    ErrorMemStorage = 4, // Error in memory device
    ErrorTlbStorage = 5, // TLB error in cache
    ErrorCacheStorage = 6,
    ErrorFunctionalUnit = 7,
    ErrorSelftest = 8,
    ErrorOverflow = 9,
    ///
    /// Bus internal errors
    ///
    ErrorVirtualMap = 17,
    ErrorAccessInvalid = 18, // Improper access
    ErrorUnimplAccess = 19, // Unimplemented memory access
    ErrorLossOfLockstep = 20,
    ErrorResponseInvalid = 21, // Response not associated with request
    ErrorParity = 22,
    ErrorProtocol = 23,
    ErrorPath = 24, // Detected path error
    ErrorTimeout = 25, // Bus timeout
    ErrorPoisoned = 26 // Read data poisoned
}
/// Validation bit mask indicates which fields in the memory error record are valid
/// in Memory Error section
///@{
enum EFI_PLATFORM_MEMORY_ERROR_STATUS_VALID = BIT0;
enum EFI_PLATFORM_MEMORY_PHY_ADDRESS_VALID = BIT1;
enum EFI_PLATFORM_MEMORY_PHY_ADDRESS_MASK_VALID = BIT2;
enum EFI_PLATFORM_MEMORY_NODE_VALID = BIT3;
enum EFI_PLATFORM_MEMORY_CARD_VALID = BIT4;
enum EFI_PLATFORM_MEMORY_MODULE_VALID = BIT5;
enum EFI_PLATFORM_MEMORY_BANK_VALID = BIT6;
enum EFI_PLATFORM_MEMORY_DEVICE_VALID = BIT7;
enum EFI_PLATFORM_MEMORY_ROW_VALID = BIT8;
enum EFI_PLATFORM_MEMORY_COLUMN_VALID = BIT9;
enum EFI_PLATFORM_MEMORY_BIT_POS_VALID = BIT10;
enum EFI_PLATFORM_MEMORY_REQUESTOR_ID_VALID = BIT11;
enum EFI_PLATFORM_MEMORY_RESPONDER_ID_VALID = BIT12;
enum EFI_PLATFORM_MEMORY_TARGET_ID_VALID = BIT13;
enum EFI_PLATFORM_MEMORY_ERROR_TYPE_VALID = BIT14;
enum EFI_PLATFORM_MEMORY_ERROR_RANK_NUM_VALID = BIT15;
enum EFI_PLATFORM_MEMORY_ERROR_CARD_HANDLE_VALID = BIT16;
enum EFI_PLATFORM_MEMORY_ERROR_MODULE_HANDLE_VALID = BIT17;
enum EFI_PLATFORM_MEMORY_ERROR_EXTENDED_ROW_BIT_16_17_VALID = BIT18;
enum EFI_PLATFORM_MEMORY_ERROR_BANK_GROUP_VALID = BIT19;
enum EFI_PLATFORM_MEMORY_ERROR_BANK_ADDRESS_VALID = BIT20;
enum EFI_PLATFORM_MEMORY_ERROR_CHIP_IDENTIFICATION_VALID = BIT21;
///@}
/// Memory Error Type identifies the type of error that occurred in Memory
/// Error section
///@{
enum EFI_PLATFORM_MEMORY_ERROR_UNKNOWN = 0x00;
enum EFI_PLATFORM_MEMORY_ERROR_NONE = 0x01;
enum EFI_PLATFORM_MEMORY_ERROR_SINGLEBIT_ECC = 0x02;
enum EFI_PLATFORM_MEMORY_ERROR_MLTIBIT_ECC = 0x03;
enum EFI_PLATFORM_MEMORY_ERROR_SINGLESYMBOLS_CHIPKILL = 0x04;
enum EFI_PLATFORM_MEMORY_ERROR_MULTISYMBOL_CHIPKILL = 0x05;
enum EFI_PLATFORM_MEMORY_ERROR_MATER_ABORT = 0x06;
enum EFI_PLATFORM_MEMORY_ERROR_TARGET_ABORT = 0x07;
enum EFI_PLATFORM_MEMORY_ERROR_PARITY = 0x08;
enum EFI_PLATFORM_MEMORY_ERROR_WDT = 0x09;
enum EFI_PLATFORM_MEMORY_ERROR_INVALID_ADDRESS = 0x0A;
enum EFI_PLATFORM_MEMORY_ERROR_MIRROR_FAILED = 0x0B;
enum EFI_PLATFORM_MEMORY_ERROR_SPARING = 0x0C;
enum EFI_PLATFORM_MEMORY_ERROR_SCRUB_CORRECTED = 0x0D;
enum EFI_PLATFORM_MEMORY_ERROR_SCRUB_UNCORRECTED = 0x0E;
enum EFI_PLATFORM_MEMORY_ERROR_MEMORY_MAP_EVENT = 0x0F;
///@}
/// Memory Error Section
struct EFI_PLATFORM_MEMORY_ERROR_DATA
{
align(1):
    UINT64 ValidFields;
    EFI_GENERIC_ERROR_STATUS ErrorStatus;
    UINT64 PhysicalAddress; // Error physical address
    UINT64 PhysicalAddressMask; // Grnaularity
    UINT16 Node; // Node #
    UINT16 Card;
    UINT16 ModuleRank; // Module or Rank#
    UINT16 Bank;
    UINT16 Device;
    UINT16 Row;
    UINT16 Column;
    UINT16 BitPosition;
    UINT64 RequestorId;
    UINT64 ResponderId;
    UINT64 TargetId;
    UINT8 ErrorType;
    UINT8 Extended;
    UINT16 RankNum;
    UINT16 CardHandle;
    UINT16 ModuleHandle;
}
/// Validation bit mask indicates which fields in the memory error record 2 are valid
/// in Memory Error section 2
///@{
enum EFI_PLATFORM_MEMORY2_ERROR_STATUS_VALID = BIT0;
enum EFI_PLATFORM_MEMORY2_PHY_ADDRESS_VALID = BIT1;
enum EFI_PLATFORM_MEMORY2_PHY_ADDRESS_MASK_VALID = BIT2;
enum EFI_PLATFORM_MEMORY2_NODE_VALID = BIT3;
enum EFI_PLATFORM_MEMORY2_CARD_VALID = BIT4;
enum EFI_PLATFORM_MEMORY2_MODULE_VALID = BIT5;
enum EFI_PLATFORM_MEMORY2_BANK_VALID = BIT6;
enum EFI_PLATFORM_MEMORY2_DEVICE_VALID = BIT7;
enum EFI_PLATFORM_MEMORY2_ROW_VALID = BIT8;
enum EFI_PLATFORM_MEMORY2_COLUMN_VALID = BIT9;
enum EFI_PLATFORM_MEMORY2_RANK_VALID = BIT10;
enum EFI_PLATFORM_MEMORY2_BIT_POS_VALID = BIT11;
enum EFI_PLATFORM_MEMORY2_CHIP_ID_VALID = BIT12;
enum EFI_PLATFORM_MEMORY2_MEMORY_ERROR_TYPE_VALID = BIT13;
enum EFI_PLATFORM_MEMORY2_STATUS_VALID = BIT14;
enum EFI_PLATFORM_MEMORY2_REQUESTOR_ID_VALID = BIT15;
enum EFI_PLATFORM_MEMORY2_RESPONDER_ID_VALID = BIT16;
enum EFI_PLATFORM_MEMORY2_TARGET_ID_VALID = BIT17;
enum EFI_PLATFORM_MEMORY2_CARD_HANDLE_VALID = BIT18;
enum EFI_PLATFORM_MEMORY2_MODULE_HANDLE_VALID = BIT19;
enum EFI_PLATFORM_MEMORY2_BANK_GROUP_VALID = BIT20;
enum EFI_PLATFORM_MEMORY2_BANK_ADDRESS_VALID = BIT21;
///@}
/// Memory Error Type identifies the type of error that occurred in Memory
/// Error section 2
///@{
enum EFI_PLATFORM_MEMORY2_ERROR_UNKNOWN = 0x00;
enum EFI_PLATFORM_MEMORY2_ERROR_NONE = 0x01;
enum EFI_PLATFORM_MEMORY2_ERROR_SINGLEBIT_ECC = 0x02;
enum EFI_PLATFORM_MEMORY2_ERROR_MLTIBIT_ECC = 0x03;
enum EFI_PLATFORM_MEMORY2_ERROR_SINGLESYMBOL_CHIPKILL = 0x04;
enum EFI_PLATFORM_MEMORY2_ERROR_MULTISYMBOL_CHIPKILL = 0x05;
enum EFI_PLATFORM_MEMORY2_ERROR_MASTER_ABORT = 0x06;
enum EFI_PLATFORM_MEMORY2_ERROR_TARGET_ABORT = 0x07;
enum EFI_PLATFORM_MEMORY2_ERROR_PARITY = 0x08;
enum EFI_PLATFORM_MEMORY2_ERROR_WDT = 0x09;
enum EFI_PLATFORM_MEMORY2_ERROR_INVALID_ADDRESS = 0x0A;
enum EFI_PLATFORM_MEMORY2_ERROR_MIRROR_BROKEN = 0x0B;
enum EFI_PLATFORM_MEMORY2_ERROR_MEMORY_SPARING = 0x0C;
enum EFI_PLATFORM_MEMORY2_ERROR_SCRUB_CORRECTED = 0x0D;
enum EFI_PLATFORM_MEMORY2_ERROR_SCRUB_UNCORRECTED = 0x0E;
enum EFI_PLATFORM_MEMORY2_ERROR_MEMORY_MAP_EVENT = 0x0F;
///@}
/// Memory Error Section 2
struct EFI_PLATFORM_MEMORY2_ERROR_DATA
{
align(1):
    UINT64 ValidFields;
    EFI_GENERIC_ERROR_STATUS ErrorStatus;
    UINT64 PhysicalAddress; // Error physical address
    UINT64 PhysicalAddressMask; // Grnaularity
    UINT16 Node; // Node #
    UINT16 Card;
    UINT16 Module; // Module or Rank#
    UINT16 Bank;
    UINT32 Device;
    UINT32 Row;
    UINT32 Column;
    UINT32 Rank;
    UINT32 BitPosition;
    UINT8 ChipId;
    UINT8 MemErrorType;
    UINT8 Status;
    UINT8 Reserved;
    UINT64 RequestorId;
    UINT64 ResponderId;
    UINT64 TargetId;
    UINT32 CardHandle;
    UINT32 ModuleHandle;
}
/// Validation bits mask indicates which of the following fields is valid
/// in PCI Express Error Record.
///@{
enum EFI_PCIE_ERROR_PORT_TYPE_VALID = BIT0;
enum EFI_PCIE_ERROR_VERSION_VALID = BIT1;
enum EFI_PCIE_ERROR_COMMAND_STATUS_VALID = BIT2;
enum EFI_PCIE_ERROR_DEVICE_ID_VALID = BIT3;
enum EFI_PCIE_ERROR_SERIAL_NO_VALID = BIT4;
enum EFI_PCIE_ERROR_BRIDGE_CRL_STS_VALID = BIT5;
enum EFI_PCIE_ERROR_CAPABILITY_INFO_VALID = BIT6;
enum EFI_PCIE_ERROR_AER_INFO_VALID = BIT7;
///@}
/// PCIe Device/Port Type as defined in the PCI Express capabilities register
///@{
enum EFI_PCIE_ERROR_PORT_PCIE_ENDPOINT = 0x00000000;
enum EFI_PCIE_ERROR_PORT_PCI_ENDPOINT = 0x00000001;
enum EFI_PCIE_ERROR_PORT_ROOT_PORT = 0x00000004;
enum EFI_PCIE_ERROR_PORT_UPSWITCH_PORT = 0x00000005;
enum EFI_PCIE_ERROR_PORT_DOWNSWITCH_PORT = 0x00000006;
enum EFI_PCIE_ERROR_PORT_PCIE_TO_PCI_BRIDGE = 0x00000007;
enum EFI_PCIE_ERROR_PORT_PCI_TO_PCIE_BRIDGE = 0x00000008;
enum EFI_PCIE_ERROR_PORT_ROOT_INT_ENDPOINT = 0x00000009;
enum EFI_PCIE_ERROR_PORT_ROOT_EVENT_COLLECTOR = 0x0000000A;
///@}
/// PCI Slot number
struct EFI_GENERIC_ERROR_PCI_SLOT
{
align(1):
    mixin(bitfields!(UINT16, "Resv1", 3, UINT16, "Number", 13));
}
/// PCIe Root Port PCI/bridge PCI compatible device number and
/// bus number information to uniquely identify the root port or
/// bridge. Default values for both the bus numbers is zero.
struct EFI_GENERIC_ERROR_PCIE_DEV_BRIDGE_ID
{
align(1):
    UINT16 VendorId;
    UINT16 DeviceId;
    UINT8[3] ClassCode;
    UINT8 Function;
    UINT8 Device;
    UINT16 Segment;
    UINT8 PrimaryOrDeviceBus;
    UINT8 SecondaryBus;
    EFI_GENERIC_ERROR_PCI_SLOT Slot;
    UINT8 Resv1;
}
/// PCIe Capability Structure
struct EFI_PCIE_ERROR_DATA_CAPABILITY
{
align(1):
    UINT8[60] PcieCap;
}
/// PCIe Advanced Error Reporting Extended Capability Structure.
struct EFI_PCIE_ERROR_DATA_AER
{
align(1):
    UINT8[96] PcieAer;
}
/// PCI Express Error Record
struct EFI_PCIE_ERROR_DATA
{
align(1):
    UINT64 ValidFields;
    UINT32 PortType;
    UINT32 Version;
    UINT32 CommandStatus;
    UINT32 Resv2;
    EFI_GENERIC_ERROR_PCIE_DEV_BRIDGE_ID DevBridge;
    UINT64 SerialNo;
    UINT32 BridgeControlStatus;
    EFI_PCIE_ERROR_DATA_CAPABILITY Capability;
    EFI_PCIE_ERROR_DATA_AER AerInfo;
}
/// Validation bits Indicates which of the following fields is valid
/// in PCI/PCI-X Bus Error Section.
///@{
enum EFI_PCI_PCIX_BUS_ERROR_STATUS_VALID = BIT0;
enum EFI_PCI_PCIX_BUS_ERROR_TYPE_VALID = BIT1;
enum EFI_PCI_PCIX_BUS_ERROR_BUS_ID_VALID = BIT2;
enum EFI_PCI_PCIX_BUS_ERROR_BUS_ADDRESS_VALID = BIT3;
enum EFI_PCI_PCIX_BUS_ERROR_BUS_DATA_VALID = BIT4;
enum EFI_PCI_PCIX_BUS_ERROR_COMMAND_VALID = BIT5;
enum EFI_PCI_PCIX_BUS_ERROR_REQUESTOR_ID_VALID = BIT6;
enum EFI_PCI_PCIX_BUS_ERROR_COMPLETER_ID_VALID = BIT7;
enum EFI_PCI_PCIX_BUS_ERROR_TARGET_ID_VALID = BIT8;
///@}
/// PCI Bus Error Type in PCI/PCI-X Bus Error Section
///@{
enum EFI_PCI_PCIX_BUS_ERROR_UNKNOWN = 0x0000;
enum EFI_PCI_PCIX_BUS_ERROR_DATA_PARITY = 0x0001;
enum EFI_PCI_PCIX_BUS_ERROR_SYSTEM = 0x0002;
enum EFI_PCI_PCIX_BUS_ERROR_MASTER_ABORT = 0x0003;
enum EFI_PCI_PCIX_BUS_ERROR_BUS_TIMEOUT = 0x0004;
enum EFI_PCI_PCIX_BUS_ERROR_MASTER_DATA_PARITY = 0x0005;
enum EFI_PCI_PCIX_BUS_ERROR_ADDRESS_PARITY = 0x0006;
enum EFI_PCI_PCIX_BUS_ERROR_COMMAND_PARITY = 0x0007;
///@}
/// PCI/PCI-X Bus Error Section
struct EFI_PCI_PCIX_BUS_ERROR_DATA
{
align(1):
    UINT64 ValidFields;
    EFI_GENERIC_ERROR_STATUS ErrorStatus;
    UINT16 Type;
    UINT16 BusId;
    UINT32 Resv2;
    UINT64 BusAddress;
    UINT64 BusData;
    UINT64 BusCommand;
    UINT64 RequestorId;
    UINT64 ResponderId;
    UINT64 TargetId;
}
/// Validation bits Indicates which of the following fields is valid
/// in PCI/PCI-X Component Error Section.
///@{
enum EFI_PCI_PCIX_DEVICE_ERROR_STATUS_VALID = BIT0;
enum EFI_PCI_PCIX_DEVICE_ERROR_ID_INFO_VALID = BIT1;
enum EFI_PCI_PCIX_DEVICE_ERROR_MEM_NUM_VALID = BIT2;
enum EFI_PCI_PCIX_DEVICE_ERROR_IO_NUM_VALID = BIT3;
enum EFI_PCI_PCIX_DEVICE_ERROR_REG_DATA_PAIR_VALID = BIT4;
///@}
/// PCI/PCI-X Device Identification Information
struct EFI_GENERIC_ERROR_PCI_DEVICE_ID
{
align(1):
    UINT16 VendorId;
    UINT16 DeviceId;
    UINT8[3] ClassCode;
    UINT8 Function;
    UINT8 Device;
    UINT8 Bus;
    UINT8 Segment;
    UINT8 Resv1;
    UINT32 Resv2;
}
/// Identifies the type of firmware error record
enum EFI_FIRMWARE_ERROR_TYPE_IPF_SAL = 0x00;
/// Firmware Error Record Section
struct EFI_FIRMWARE_ERROR_DATA
{
align(1):
    UINT8 ErrorType;
    UINT8[7] Resv1;
    UINT64 RecordId;
}
/// Fault Reason in DMAr Generic Error Section
///@{
enum EFI_DMA_FAULT_REASON_TABLE_ENTRY_NOT_PRESENT = 0x01;
enum EFI_DMA_FAULT_REASON_TABLE_ENTRY_INVALID = 0x02;
enum EFI_DMA_FAULT_REASON_ACCESS_MAPPING_TABLE_ERROR = 0x03;
enum EFI_DMA_FAULT_REASON_RESV_BIT_ERROR_IN_MAPPING_TABLE = 0x04;
enum EFI_DMA_FAULT_REASON_ACCESS_ADDR_OUT_OF_SPACE = 0x05;
enum EFI_DMA_FAULT_REASON_INVALID_ACCESS = 0x06;
enum EFI_DMA_FAULT_REASON_INVALID_REQUEST = 0x07;
enum EFI_DMA_FAULT_REASON_ACCESS_TRANSLATE_TABLE_ERROR = 0x08;
enum EFI_DMA_FAULT_REASON_RESV_BIT_ERROR_IN_TRANSLATE_TABLE = 0x09;
enum EFI_DMA_FAULT_REASON_INVALID_COMMAOND = 0x0A;
enum EFI_DMA_FAULT_REASON_ACCESS_COMMAND_BUFFER_ERROR = 0x0B;
///@}
/// DMA access type in DMAr Generic Error Section
///@{
enum EFI_DMA_ACCESS_TYPE_READ = 0x00;
enum EFI_DMA_ACCESS_TYPE_WRITE = 0x01;
///@}
/// DMA address type in DMAr Generic Error Section
///@{
enum EFI_DMA_ADDRESS_UNTRANSLATED = 0x00;
enum EFI_DMA_ADDRESS_TRANSLATION = 0x01;
///@}
/// Architecture type in DMAr Generic Error Section
///@{
enum EFI_DMA_ARCH_TYPE_VT = 0x01;
enum EFI_DMA_ARCH_TYPE_IOMMU = 0x02;
///@}
/// DMAr Generic Error Section
struct EFI_DMAR_GENERIC_ERROR_DATA
{
align(1):
    UINT16 RequesterId;
    UINT16 SegmentNumber;
    UINT8 FaultReason;
    UINT8 AccessType;
    UINT8 AddressType;
    UINT8 ArchType;
    UINT64 DeviceAddr;
    UINT8[16] Resv1;
}
/// Intel VT for Directed I/O specific DMAr Errors
struct EFI_DIRECTED_IO_DMAR_ERROR_DATA
{
align(1):
    UINT8 Version;
    UINT8 Revision;
    UINT8[6] OemId;
    UINT64 Capability;
    UINT64 CapabilityEx;
    UINT32 GlobalCommand;
    UINT32 GlobalStatus;
    UINT32 FaultStatus;
    UINT8[12] Resv1;
    UINT64[2] FaultRecord;
    UINT64[2] RootEntry;
    UINT64[2] ContextEntry;
    UINT64 PteL6;
    UINT64 PteL5;
    UINT64 PteL4;
    UINT64 PteL3;
    UINT64 PteL2;
    UINT64 PteL1;
}
/// IOMMU specific DMAr Errors
struct EFI_IOMMU_DMAR_ERROR_DATA
{
align(1):
    UINT8 Revision;
    UINT8[7] Resv1;
    UINT64 Control;
    UINT64 Status;
    UINT8[8] Resv2;
    UINT64[2] EventLogEntry;
    UINT8[16] Resv3;
    UINT64[4] DeviceTableEntry;
    UINT64 PteL6;
    UINT64 PteL5;
    UINT64 PteL4;
    UINT64 PteL3;
    UINT64 PteL2;
    UINT64 PteL1;
}
/// IA32 and x64 Specific definitions.
/// EFI_DEBUG_IMAGE_INFO_TABLE configuration table GUID declaration.
enum EFI_GUID EFI_DEBUG_IMAGE_INFO_TABLE_GUID = EFI_GUID(0x49152e77, 0x1ada,
        0x4764, [0xb7, 0xa2, 0x7a, 0xfe, 0xfe, 0xd9, 0x5e, 0x8b]);
enum EFI_DEBUG_IMAGE_INFO_UPDATE_IN_PROGRESS = 0x01;
enum EFI_DEBUG_IMAGE_INFO_TABLE_MODIFIED = 0x02;
enum EFI_DEBUG_IMAGE_INFO_TYPE_NORMAL = 0x01;
struct EFI_SYSTEM_TABLE_POINTER
{
    UINT64 Signature; ///< A constant UINT64 that has the value EFI_SYSTEM_TABLE_SIGNATURE
    EFI_PHYSICAL_ADDRESS EfiSystemTableBase; ///< The physical address of the EFI system table.
    UINT32 Crc32; ///< A 32-bit CRC value that is used to verify the EFI_SYSTEM_TABLE_POINTER structure is valid.
}

struct EFI_DEBUG_IMAGE_INFO_NORMAL
{
    ///
    /// Indicates the type of image info structure. For PE32 EFI images,
    /// this is set to EFI_DEBUG_IMAGE_INFO_TYPE_NORMAL.
    ///
    UINT32 ImageInfoType;
    ///
    /// A pointer to an instance of the loaded image protocol for the associated image.
    ///
    EFI_LOADED_IMAGE_PROTOCOL* LoadedImageProtocolInstance;
    ///
    /// Indicates the image handle of the associated image.
    ///
    EFI_HANDLE ImageHandle;
}

union EFI_DEBUG_IMAGE_INFO
{
    UINT32* ImageInfoType;
    EFI_DEBUG_IMAGE_INFO_NORMAL* NormalImage;
}

struct EFI_DEBUG_IMAGE_INFO_TABLE_HEADER
{
    ///
    /// UpdateStatus is used by the system to indicate the state of the debug image info table.
    ///
    UINT32 UpdateStatus;
    ///
    /// The number of EFI_DEBUG_IMAGE_INFO elements in the array pointed to by EfiDebugImageInfoTable.
    ///
    UINT32 TableSize;
    ///
    /// A pointer to the first element of an array of EFI_DEBUG_IMAGE_INFO structures.
    ///
    EFI_DEBUG_IMAGE_INFO* EfiDebugImageInfoTable;
}

enum EFI_GUID DXE_SERVICES_TABLE_GUID = EFI_GUID(0x5ad34ba, 0x6f02, 0x4214,
        [0x95, 0x2e, 0x4d, 0xa0, 0x39, 0x8e, 0x2b, 0xb9]);
enum EFI_GUID EFI_EVENT_GROUP_EXIT_BOOT_SERVICES = EFI_GUID(0x27abf055, 0xb1b8,
        0x4c26, [0x80, 0x48, 0x74, 0x8f, 0x37, 0xba, 0xa2, 0xdf]);
enum EFI_GUID EFI_EVENT_GROUP_VIRTUAL_ADDRESS_CHANGE = EFI_GUID(0x13fa7698,
        0xc831, 0x49c7, [0x87, 0xea, 0x8f, 0x43, 0xfc, 0xc2, 0x51, 0x96]);
enum EFI_GUID EFI_EVENT_GROUP_MEMORY_MAP_CHANGE = EFI_GUID(0x78bee926, 0x692f,
        0x48fd, [0x9e, 0xdb, 0x1, 0x42, 0x2e, 0xf0, 0xd7, 0xab]);
enum EFI_GUID EFI_EVENT_GROUP_READY_TO_BOOT = EFI_GUID(0x7ce88fb3, 0x4bd7,
        0x4679, [0x87, 0xa8, 0xa8, 0xd8, 0xde, 0xe5, 0x0d, 0x2b]);
enum EFI_GUID EFI_EVENT_GROUP_DXE_DISPATCH_GUID = EFI_GUID(0x7081e22f, 0xcac6,
        0x4053, [0x94, 0x68, 0x67, 0x57, 0x82, 0xcf, 0x88, 0xe5]);
enum EFI_GUID EFI_END_OF_DXE_EVENT_GROUP_GUID = EFI_GUID(0x2ce967a, 0xdd7e,
        0x4ffc, [0x9e, 0xe7, 0x81, 0xc, 0xf0, 0x47, 0x8, 0x80]);
enum EFI_GUID EFI_EVENT_LEGACY_BOOT_GUID = EFI_GUID(0x2a571201, 0x4966, 0x47f6,
        [0x8b, 0x86, 0xf3, 0x1e, 0x41, 0xf3, 0x2f, 0x10]);
enum EFI_GUID EFI_FILE_INFO_ID = EFI_GUID(0x9576e92, 0x6d3f, 0x11d2, [0x8e,
        0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b]);
struct EFI_FILE_INFO
{
    ///
    /// The size of the EFI_FILE_INFO structure, including the Null-terminated FileName string.
    ///
    UINT64 Size;
    ///
    /// The size of the file in bytes.
    ///
    UINT64 FileSize;
    ///
    /// PhysicalSize The amount of physical space the file consumes on the file system volume.
    ///
    UINT64 PhysicalSize;
    ///
    /// The time the file was created.
    ///
    EFI_TIME CreateTime;
    ///
    /// The time when the file was last accessed.
    ///
    EFI_TIME LastAccessTime;
    ///
    /// The time when the file's contents were last modified.
    ///
    EFI_TIME ModificationTime;
    ///
    /// The attribute bits for the file.
    ///
    UINT64 Attribute;
    ///
    /// The Null-terminated name of the file.
    ///
    CHAR16[1] FileName;
}

enum EFI_GUID EFI_FILE_SYSTEM_INFO_ID = EFI_GUID(0x9576e93, 0x6d3f, 0x11d2,
        [0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b]);
struct EFI_FILE_SYSTEM_INFO
{
    ///
    /// The size of the EFI_FILE_SYSTEM_INFO structure, including the Null-terminated VolumeLabel string.
    ///
    UINT64 Size;
    ///
    /// TRUE if the volume only supports read access.
    ///
    BOOLEAN ReadOnly;
    ///
    /// The number of bytes managed by the file system.
    ///
    UINT64 VolumeSize;
    ///
    /// The number of available bytes for use by the file system.
    ///
    UINT64 FreeSpace;
    ///
    /// The nominal block size by which files are typically grown.
    ///
    UINT32 BlockSize;
    ///
    /// The Null-terminated string that is the volume's label.
    ///
    CHAR16[1] VolumeLabel;
}

enum EFI_GUID EFI_FILE_SYSTEM_VOLUME_LABEL_ID = EFI_GUID(0xDB47D7D3, 0xFE81,
        0x11d3, [0x9A, 0x35, 0x00, 0x90, 0x27, 0x3F, 0xC1, 0x4D]);
struct EFI_FILE_SYSTEM_VOLUME_LABEL
{
    ///
    /// The Null-terminated string that is the volume's label.
    ///
    CHAR16[1] VolumeLabel;
}

enum EFI_GUID EFI_FIRMWARE_CONTENTS_SIGNED_GUID = EFI_GUID(0xf9d89e8, 0x9259,
        0x4f76, [0xa5, 0xaf, 0xc, 0x89, 0xe3, 0x40, 0x23, 0xdf]);
/// The firmware volume header contains a data field for
/// the file system GUID
enum EFI_GUID EFI_FIRMWARE_FILE_SYSTEM2_GUID = EFI_GUID(0x8c8ce578, 0x8a3d,
        0x4f1c, [0x99, 0x35, 0x89, 0x61, 0x85, 0xc3, 0x2d, 0xd3]);
/// A Volume Top File (VTF) is a file that must be
/// located such that the last byte of the file is
/// also the last byte of the firmware volume
enum EFI_GUID EFI_FFS_VOLUME_TOP_FILE_GUID = EFI_GUID(0x1BA0062E, 0xC779,
        0x4582, [0x85, 0x66, 0x33, 0x6A, 0xE8, 0xF7, 0x8F, 0x9]);
/// The firmware volume header contains a data field for the file system GUID
/// {5473C07A-3DCB-4dca-BD6F-1E9689E7349A}
enum EFI_GUID EFI_FIRMWARE_FILE_SYSTEM3_GUID = EFI_GUID(0x5473c07a, 0x3dcb,
        0x4dca, [0xbd, 0x6f, 0x1e, 0x96, 0x89, 0xe7, 0x34, 0x9a]);

enum EFI_GUID EFI_FIRMWARE_MANAGEMENT_CAPSULE_ID_GUID = EFI_GUID(0x6dcbd5ed,
        0xe82d, 0x4c44, [0xbd, 0xa1, 0x71, 0x94, 0x19, 0x9a, 0xd9, 0x2a]);
struct EFI_FIRMWARE_MANAGEMENT_CAPSULE_HEADER
{
align(1):
    UINT32 Version;
    ///
    /// The number of drivers included in the capsule and the number of corresponding
    /// offsets stored in ItemOffsetList array.
    ///
    UINT16 EmbeddedDriverCount;
    ///
    /// The number of payload items included in the capsule and the number of
    /// corresponding offsets stored in the ItemOffsetList array.
    ///
    UINT16 PayloadItemCount;
    ///
    /// Variable length array of dimension [EmbeddedDriverCount + PayloadItemCount]
    /// containing offsets of each of the drivers and payload items contained within the capsule
    ///
    // UINT64 ItemOffsetList[];
}

struct EFI_FIRMWARE_MANAGEMENT_CAPSULE_IMAGE_HEADER
{
align(1):
    UINT32 Version;
    ///
    /// Used to identify device firmware targeted by this update. This guid is matched by
    /// system firmware against ImageTypeId field within a EFI_FIRMWARE_IMAGE_DESCRIPTOR
    ///
    EFI_GUID UpdateImageTypeId;
    ///
    /// Passed as ImageIndex in call to EFI_FIRMWARE_MANAGEMENT_PROTOCOL.SetImage()
    ///
    UINT8 UpdateImageIndex;
    UINT8[3] reserved_bytes;
    ///
    /// Size of the binary update image which immediately follows this structure
    ///
    UINT32 UpdateImageSize;
    ///
    /// Size of the VendorCode bytes which optionally immediately follow binary update image in the capsule
    ///
    UINT32 UpdateVendorCodeSize;
    ///
    /// The HardwareInstance to target with this update. If value is zero it means match all
    /// HardwareInstances. This field allows update software to target only a single device in
    /// cases where there are more than one device with the same ImageTypeId GUID.
    /// This header is outside the signed data of the Authentication Info structure and
    /// therefore can be modified without changing the Auth data.
    ///
    UINT64 UpdateHardwareInstance;
}

enum EFI_FIRMWARE_MANAGEMENT_CAPSULE_HEADER_INIT_VERSION = 0x00000001;
enum EFI_FIRMWARE_MANAGEMENT_CAPSULE_IMAGE_HEADER_INIT_VERSION = 0x00000002;
enum EFI_GUID EFI_GLOBAL_VARIABLE = EFI_GUID(0x8BE4DF61, 0x93CA, 0x11d2, [0xAA,
        0x0D, 0x00, 0xE0, 0x98, 0x03, 0x2B, 0x8C]);
/// The language codes that the firmware supports. This value is deprecated.
/// Its attribute is BS+RT.
enum EFI_LANG_CODES_VARIABLE_NAME = "LangCodes"w;
/// The language code that the system is configured for. This value is deprecated.
/// Its attribute is NV+BS+RT.
enum EFI_LANG_VARIABLE_NAME = "Lang"w;
/// The firmware's boot managers timeout, in seconds, before initiating the default boot selection.
/// Its attribute is NV+BS+RT.
enum EFI_TIME_OUT_VARIABLE_NAME = "Timeout"w;
/// The language codes that the firmware supports.
/// Its attribute is BS+RT.
enum EFI_PLATFORM_LANG_CODES_VARIABLE_NAME = "PlatformLangCodes"w;
/// The language code that the system is configured for.
/// Its attribute is NV+BS+RT.
enum EFI_PLATFORM_LANG_VARIABLE_NAME = "PlatformLang"w;
/// The device path of the default input/output/error output console.
/// Its attribute is NV+BS+RT.
enum EFI_CON_IN_VARIABLE_NAME = "ConIn"w;
enum EFI_CON_OUT_VARIABLE_NAME = "ConOut"w;
enum EFI_ERR_OUT_VARIABLE_NAME = "ErrOut"w;
/// The device path of all possible input/output/error output devices.
/// Its attribute is BS+RT.
enum EFI_CON_IN_DEV_VARIABLE_NAME = "ConInDev"w;
enum EFI_CON_OUT_DEV_VARIABLE_NAME = "ConOutDev"w;
enum EFI_ERR_OUT_DEV_VARIABLE_NAME = "ErrOutDev"w;
/// The ordered boot option load list.
/// Its attribute is NV+BS+RT.
enum EFI_BOOT_ORDER_VARIABLE_NAME = "BootOrder"w;
/// The boot option for the next boot only.
/// Its attribute is NV+BS+RT.
enum EFI_BOOT_NEXT_VARIABLE_NAME = "BootNext"w;
/// The boot option that was selected for the current boot.
/// Its attribute is BS+RT.
enum EFI_BOOT_CURRENT_VARIABLE_NAME = "BootCurrent"w;
/// The types of boot options supported by the boot manager. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_BOOT_OPTION_SUPPORT_VARIABLE_NAME = "BootOptionSupport"w;
/// The ordered driver load option list.
/// Its attribute is NV+BS+RT.
enum EFI_DRIVER_ORDER_VARIABLE_NAME = "DriverOrder"w;
/// The ordered System Prep Application load option list.
/// Its attribute is NV+BS+RT.
enum EFI_SYS_PREP_ORDER_VARIABLE_NAME = "SysPrepOrder"w;
/// Identifies the level of hardware error record persistence
/// support implemented by the platform. This variable is
/// only modified by firmware and is read-only to the OS.
/// Its attribute is NV+BS+RT.
enum EFI_HW_ERR_REC_SUPPORT_VARIABLE_NAME = "HwErrRecSupport"w;
/// Whether the system is operating in setup mode (1) or not (0).
/// All other values are reserved. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_SETUP_MODE_NAME = "SetupMode"w;
/// The Key Exchange Key Signature Database.
/// Its attribute is NV+BS+RT+AT.
enum EFI_KEY_EXCHANGE_KEY_NAME = "KEK"w;
/// The public Platform Key.
/// Its attribute is NV+BS+RT+AT.
enum EFI_PLATFORM_KEY_NAME = "PK"w;
/// Array of GUIDs representing the type of signatures supported
/// by the platform firmware. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_SIGNATURE_SUPPORT_NAME = "SignatureSupport"w;
/// Whether the platform firmware is operating in Secure boot mode (1) or not (0).
/// All other values are reserved. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_SECURE_BOOT_MODE_NAME = "SecureBoot"w;
/// The OEM's default Key Exchange Key Signature Database. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_KEK_DEFAULT_VARIABLE_NAME = "KEKDefault"w;
/// The OEM's default public Platform Key. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_PK_DEFAULT_VARIABLE_NAME = "PKDefault"w;
/// The OEM's default secure boot signature store. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_DB_DEFAULT_VARIABLE_NAME = "dbDefault"w;
/// The OEM's default secure boot blacklist signature store. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_DBX_DEFAULT_VARIABLE_NAME = "dbxDefault"w;
/// The OEM's default secure boot timestamp signature store. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_DBT_DEFAULT_VARIABLE_NAME = "dbtDefault"w;
/// Allows the firmware to indicate supported features and actions to the OS.
/// Its attribute is BS+RT.
enum EFI_OS_INDICATIONS_SUPPORT_VARIABLE_NAME = "OsIndicationsSupported"w;
/// Allows the OS to request the firmware to enable certain features and to take certain actions.
/// Its attribute is NV+BS+RT.
enum EFI_OS_INDICATIONS_VARIABLE_NAME = "OsIndications"w;
/// Whether the system is configured to use only vendor provided
/// keys or not. Should be treated as read-only.
/// Its attribute is BS+RT.
enum EFI_VENDOR_KEYS_VARIABLE_NAME = "VendorKeys"w;
enum EFI_GUID EFI_PART_TYPE_UNUSED_GUID = EFI_GUID(0x00000000, 0x0000, 0x0000,
        [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]);
enum EFI_GUID EFI_PART_TYPE_EFI_SYSTEM_PART_GUID = EFI_GUID(0xc12a7328, 0xf81f,
        0x11d2, [0xba, 0x4b, 0x00, 0xa0, 0xc9, 0x3e, 0xc9, 0x3b]);
enum EFI_GUID EFI_PART_TYPE_LEGACY_MBR_GUID = EFI_GUID(0x024dee41, 0x33e7,
        0x11d3, [0x9d, 0x69, 0x00, 0x08, 0xc7, 0x81, 0xf3, 0x9f]);
enum EFI_GUID EFI_PEI_GRAPHICS_INFO_HOB_GUID = EFI_GUID(0x39f62cce, 0x6825,
        0x4669, [0xbb, 0x56, 0x54, 0x1a, 0xba, 0x75, 0x3a, 0x07]);
struct EFI_PEI_GRAPHICS_INFO_HOB
{
    EFI_PHYSICAL_ADDRESS FrameBufferBase;
    UINT32 FrameBufferSize;
    EFI_GRAPHICS_OUTPUT_MODE_INFORMATION GraphicsMode;
}

enum EFI_GUID EFI_HARDWARE_ERROR_VARIABLE = EFI_GUID(0x414E6BDD, 0xE47B,
        0x47cc, [0xB2, 0x44, 0xBB, 0x61, 0x02, 0x0C, 0xF5, 0x16]);
enum EFI_GUID EFI_HII_STANDARD_FORM_GUID = EFI_GUID(0x3bd2f4ec, 0xe524, 0x46e4,
        [0xa9, 0xd8, 0x51, 0x1, 0x17, 0x42, 0x55, 0x62]);
enum EFI_GUID EFI_HII_SET_KEYBOARD_LAYOUT_EVENT_GUID = EFI_GUID(0x14982a4f,
        0xb0ed, 0x45b8, [0xa8, 0x11, 0x5a, 0x7a, 0x9b, 0xc2, 0x32, 0xdf]);
enum EFI_GUID EFI_HII_PLATFORM_SETUP_FORMSET_GUID = EFI_GUID(0x93039971,
        0x8545, 0x4b04, [0xb4, 0x5e, 0x32, 0xeb, 0x83, 0x26, 0x4, 0xe]);
enum EFI_GUID EFI_HII_DRIVER_HEALTH_FORMSET_GUID = EFI_GUID(0xf22fc20c, 0x8cf4,
        0x45eb, [0x8e, 0x6, 0xad, 0x4e, 0x50, 0xb9, 0x5d, 0xd3]);
enum EFI_GUID EFI_HII_USER_CREDENTIAL_FORMSET_GUID = EFI_GUID(0x337f4407,
        0x5aee, 0x4b83, [0xb2, 0xa7, 0x4e, 0xad, 0xca, 0x30, 0x88, 0xcd]);
enum EFI_GUID HOB_LIST_GUID = EFI_GUID(0x7739f24c, 0x93d7, 0x11d4, [0x9a, 0x3a,
        0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
enum EFI_GUID EFI_IMAGE_SECURITY_DATABASE_GUID = EFI_GUID(0xd719b2cb, 0x3d3a,
        0x4596, [0xa3, 0xbc, 0xda, 0xd0, 0xe, 0x67, 0x65, 0x6f]);
/// Varialbe name with guid EFI_IMAGE_SECURITY_DATABASE_GUID
/// for the authorized signature database.
enum EFI_IMAGE_SECURITY_DATABASE = "db"w;
/// Varialbe name with guid EFI_IMAGE_SECURITY_DATABASE_GUID
/// for the forbidden signature database.
enum EFI_IMAGE_SECURITY_DATABASE1 = "dbx"w;
/// Variable name with guid EFI_IMAGE_SECURITY_DATABASE_GUID
/// for the timestamp signature database.
enum EFI_IMAGE_SECURITY_DATABASE2 = "dbt"w;
enum SECURE_BOOT_MODE_ENABLE = 1;
enum SECURE_BOOT_MODE_DISABLE = 0;
enum SETUP_MODE = 1;
enum USER_MODE = 0;
/// The format of a signature database.
struct EFI_SIGNATURE_DATA
{
align(1):
    ///
    /// An identifier which identifies the agent which added the signature to the list.
    ///
    EFI_GUID SignatureOwner;
    ///
    /// The format of the signature is defined by the SignatureType.
    ///
    UINT8[1] SignatureData;
}

struct EFI_SIGNATURE_LIST
{
align(1):
    ///
    /// Type of the signature. GUID signature types are defined in below.
    ///
    EFI_GUID SignatureType;
    ///
    /// Total size of the signature list, including this header.
    ///
    UINT32 SignatureListSize;
    ///
    /// Size of the signature header which precedes the array of signatures.
    ///
    UINT32 SignatureHeaderSize;
    ///
    /// Size of each signature.
    ///
    UINT32 SignatureSize;
    ///
    /// Header before the array of signatures. The format of this header is specified
    /// by the SignatureType.
    /// UINT8           SignatureHeader[SignatureHeaderSize];
    ///
    /// An array of signatures. Each signature is SignatureSize bytes in length.
    /// EFI_SIGNATURE_DATA Signatures[][SignatureSize];
    ///
}

struct EFI_CERT_X509_SHA256
{
align(1):
    ///
    /// The SHA256 hash of an X.509 certificate's To-Be-Signed contents.
    ///
    EFI_SHA256_HASH ToBeSignedHash;
    ///
    /// The time that the certificate shall be considered to be revoked.
    ///
    EFI_TIME TimeOfRevocation;
}

struct EFI_CERT_X509_SHA384
{
align(1):
    ///
    /// The SHA384 hash of an X.509 certificate's To-Be-Signed contents.
    ///
    EFI_SHA384_HASH ToBeSignedHash;
    ///
    /// The time that the certificate shall be considered to be revoked.
    ///
    EFI_TIME TimeOfRevocation;
}

struct EFI_CERT_X509_SHA512
{
align(1):
    ///
    /// The SHA512 hash of an X.509 certificate's To-Be-Signed contents.
    ///
    EFI_SHA512_HASH ToBeSignedHash;
    ///
    /// The time that the certificate shall be considered to be revoked.
    ///
    EFI_TIME TimeOfRevocation;
}
/// This identifies a signature containing a SHA-256 hash. The SignatureHeader size shall
/// always be 0. The SignatureSize shall always be 16 (size of SignatureOwner component) +
/// 32 bytes.
enum EFI_GUID EFI_CERT_SHA256_GUID = EFI_GUID(0xc1c41626, 0x504c, 0x4092,
        [0xac, 0xa9, 0x41, 0xf9, 0x36, 0x93, 0x43, 0x28]);
/// This identifies a signature containing an RSA-2048 key. The key (only the modulus
/// since the public key exponent is known to be 0x10001) shall be stored in big-endian
/// order.
/// The SignatureHeader size shall always be 0. The SignatureSize shall always be 16 (size
/// of SignatureOwner component) + 256 bytes.
enum EFI_GUID EFI_CERT_RSA2048_GUID = EFI_GUID(0x3c5766e8, 0x269c, 0x4e34,
        [0xaa, 0x14, 0xed, 0x77, 0x6e, 0x85, 0xb3, 0xb6]);
/// This identifies a signature containing a RSA-2048 signature of a SHA-256 hash.  The
/// SignatureHeader size shall always be 0. The SignatureSize shall always be 16 (size of
/// SignatureOwner component) + 256 bytes.
enum EFI_GUID EFI_CERT_RSA2048_SHA256_GUID = EFI_GUID(0xe2b36190, 0x879b,
        0x4a3d, [0xad, 0x8d, 0xf2, 0xe7, 0xbb, 0xa3, 0x27, 0x84]);
/// This identifies a signature containing a SHA-1 hash.  The SignatureSize shall always
/// be 16 (size of SignatureOwner component) + 20 bytes.
enum EFI_GUID EFI_CERT_SHA1_GUID = EFI_GUID(0x826ca512, 0xcf10, 0x4ac9, [0xb1,
        0x87, 0xbe, 0x1, 0x49, 0x66, 0x31, 0xbd]);
/// TThis identifies a signature containing a RSA-2048 signature of a SHA-1 hash.  The
/// SignatureHeader size shall always be 0. The SignatureSize shall always be 16 (size of
/// SignatureOwner component) + 256 bytes.
enum EFI_GUID EFI_CERT_RSA2048_SHA1_GUID = EFI_GUID(0x67f8444f, 0x8743, 0x48f1,
        [0xa3, 0x28, 0x1e, 0xaa, 0xb8, 0x73, 0x60, 0x80]);
/// This identifies a signature based on an X.509 certificate. If the signature is an X.509
/// certificate then verification of the signature of an image should validate the public
/// key certificate in the image using certificate path verification, up to this X.509
/// certificate as a trusted root.  The SignatureHeader size shall always be 0. The
/// SignatureSize may vary but shall always be 16 (size of the SignatureOwner component) +
/// the size of the certificate itself.
/// Note: This means that each certificate will normally be in a separate EFI_SIGNATURE_LIST.
enum EFI_GUID EFI_CERT_X509_GUID = EFI_GUID(0xa5c059a1, 0x94e4, 0x4aa7, [0x87,
        0xb5, 0xab, 0x15, 0x5c, 0x2b, 0xf0, 0x72]);
/// This identifies a signature containing a SHA-224 hash. The SignatureHeader size shall
/// always be 0. The SignatureSize shall always be 16 (size of SignatureOwner component) +
/// 28 bytes.
enum EFI_GUID EFI_CERT_SHA224_GUID = EFI_GUID(0xb6e5233, 0xa65c, 0x44c9, [0x94,
        0x7, 0xd9, 0xab, 0x83, 0xbf, 0xc8, 0xbd]);
/// This identifies a signature containing a SHA-384 hash. The SignatureHeader size shall
/// always be 0. The SignatureSize shall always be 16 (size of SignatureOwner component) +
/// 48 bytes.
enum EFI_GUID EFI_CERT_SHA384_GUID = EFI_GUID(0xff3e5307, 0x9fd0, 0x48c9,
        [0x85, 0xf1, 0x8a, 0xd5, 0x6c, 0x70, 0x1e, 0x1]);
/// This identifies a signature containing a SHA-512 hash. The SignatureHeader size shall
/// always be 0. The SignatureSize shall always be 16 (size of SignatureOwner component) +
/// 64 bytes.
enum EFI_GUID EFI_CERT_SHA512_GUID = EFI_GUID(0x93e0fae, 0xa6c4, 0x4f50, [0x9f,
        0x1b, 0xd4, 0x1e, 0x2b, 0x89, 0xc1, 0x9a]);
/// This identifies a signature containing the SHA256 hash of an X.509 certificate's
/// To-Be-Signed contents, and a time of revocation. The SignatureHeader size shall
/// always be 0. The SignatureSize shall always be 16 (size of the SignatureOwner component)
/// + 48 bytes for an EFI_CERT_X509_SHA256 structure. If the TimeOfRevocation is non-zero,
/// the certificate should be considered to be revoked from that time and onwards, and
/// otherwise the certificate shall be considered to always be revoked.
enum EFI_GUID EFI_CERT_X509_SHA256_GUID = EFI_GUID(0x3bd2a492, 0x96c0, 0x4079,
        [0xb4, 0x20, 0xfc, 0xf9, 0x8e, 0xf1, 0x03, 0xed]);
/// This identifies a signature containing the SHA384 hash of an X.509 certificate's
/// To-Be-Signed contents, and a time of revocation. The SignatureHeader size shall
/// always be 0. The SignatureSize shall always be 16 (size of the SignatureOwner component)
/// + 64 bytes for an EFI_CERT_X509_SHA384 structure. If the TimeOfRevocation is non-zero,
/// the certificate should be considered to be revoked from that time and onwards, and
/// otherwise the certificate shall be considered to always be revoked.
enum EFI_GUID EFI_CERT_X509_SHA384_GUID = EFI_GUID(0x7076876e, 0x80c2, 0x4ee6,
        [0xaa, 0xd2, 0x28, 0xb3, 0x49, 0xa6, 0x86, 0x5b]);
/// This identifies a signature containing the SHA512 hash of an X.509 certificate's
/// To-Be-Signed contents, and a time of revocation. The SignatureHeader size shall
/// always be 0. The SignatureSize shall always be 16 (size of the SignatureOwner component)
/// + 80 bytes for an EFI_CERT_X509_SHA512 structure. If the TimeOfRevocation is non-zero,
/// the certificate should be considered to be revoked from that time and onwards, and
/// otherwise the certificate shall be considered to always be revoked.
enum EFI_GUID EFI_CERT_X509_SHA512_GUID = EFI_GUID(0x446dbf63, 0x2502, 0x4cda,
        [0xbc, 0xfa, 0x24, 0x65, 0xd2, 0xb0, 0xfe, 0x9d]);
/// This identifies a signature containing a DER-encoded PKCS #7 version 1.5 [RFC2315]
/// SignedData value.
enum EFI_GUID EFI_CERT_TYPE_PKCS7_GUID = EFI_GUID(0x4aafd29d, 0x68df, 0x49ee,
        [0x8a, 0xa9, 0x34, 0x7d, 0x37, 0x56, 0x65, 0xa7]);
alias EFI_IMAGE_EXECUTION_ACTION = UINT32;
enum EFI_IMAGE_EXECUTION_AUTHENTICATION = 0x00000007;
enum EFI_IMAGE_EXECUTION_AUTH_UNTESTED = 0x00000000;
enum EFI_IMAGE_EXECUTION_AUTH_SIG_FAILED = 0x00000001;
enum EFI_IMAGE_EXECUTION_AUTH_SIG_PASSED = 0x00000002;
enum EFI_IMAGE_EXECUTION_AUTH_SIG_NOT_FOUND = 0x00000003;
enum EFI_IMAGE_EXECUTION_AUTH_SIG_FOUND = 0x00000004;
enum EFI_IMAGE_EXECUTION_POLICY_FAILED = 0x00000005;
enum EFI_IMAGE_EXECUTION_INITIALIZED = 0x00000008;
struct EFI_IMAGE_EXECUTION_INFO
{
    ///
    /// Describes the action taken by the firmware regarding this image.
    ///
    EFI_IMAGE_EXECUTION_ACTION Action;
    ///
    /// Size of all of the entire structure.
    ///
    UINT32 InfoSize;
    ///
    /// If this image was a UEFI device driver (for option ROM, for example) this is the
    /// null-terminated, user-friendly name for the device. If the image was for an application,
    /// then this is the name of the application. If this cannot be determined, then a simple
    /// NULL character should be put in this position.
    /// CHAR16                    Name[];
    ///
    ///
    /// For device drivers, this is the device path of the device for which this device driver
    /// was intended. In some cases, the driver itself may be stored as part of the system
    /// firmware, but this field should record the device's path, not the firmware path. For
    /// applications, this is the device path of the application. If this cannot be determined,
    /// a simple end-of-path device node should be put in this position.
    /// EFI_DEVICE_PATH_PROTOCOL  DevicePath;
    ///
    ///
    /// Zero or more image signatures. If the image contained no signatures,
    /// then this field is empty.
    /// EFI_SIGNATURE_LIST            Signature;
    ///
}

struct EFI_IMAGE_EXECUTION_INFO_TABLE
{
    ///
    /// Number of EFI_IMAGE_EXECUTION_INFO structures.
    ///
    UINTN NumberOfImages;
    ///
    /// Number of image instances of EFI_IMAGE_EXECUTION_INFO structures.
    ///
    // EFI_IMAGE_EXECUTION_INFO  InformationInfo[]
}

enum EFI_GUID MDEPKG_TOKEN_SPACE_GUID = EFI_GUID(0x914AEBE7, 0x4635, 0x459b,
        [0xAA, 0x1C, 0x11, 0xE2, 0x19, 0xB0, 0x3A, 0x10]);
enum EFI_GUID EFI_HOB_MEMORY_ALLOC_BSP_STORE_GUID = EFI_GUID(0x564b33cd,
        0xc92a, 0x4593, [0x90, 0xbf, 0x24, 0x73, 0xe4, 0x3c, 0x63, 0x22]);
enum EFI_GUID EFI_HOB_MEMORY_ALLOC_STACK_GUID = EFI_GUID(0x4ed4bf27, 0x4092,
        0x42e9, [0x80, 0x7d, 0x52, 0x7b, 0x1d, 0x0, 0xc9, 0xbd]);
enum EFI_GUID EFI_HOB_MEMORY_ALLOC_MODULE_GUID = EFI_GUID(0xf8e21975, 0x899,
        0x4f58, [0xa4, 0xbe, 0x55, 0x25, 0xa9, 0xc6, 0xd7, 0x7a]);
enum EFI_GUID MEMORY_ONLY_RESET_CONTROL_GUID = EFI_GUID(0xe20939be, 0x32d4,
        0x41be, [0xa1, 0x50, 0x89, 0x7f, 0x85, 0xd4, 0x98, 0x29]);
///  Variable name is "MemoryOverwriteRequestControl" and it is a 1 byte unsigned value.
///  The attributes should be:
///  EFI_VARIABLE_NON_ |
///  EFI_VARIABLE_BOOTSERVICE_ACCESS |
///  EFI_VARIABLE_RUNTIME_ACCESS
enum MEMORY_OVERWRITE_REQUEST_VARIABLE_NAME = "MemoryOverwriteRequestControl"w;
/// 0 = Firmware MUST clear the MOR bi
/// 1 = Firmware MUST set the MOR bit
enum MOR_CLEAR_MEMORY_BIT_MASK = 0x01;
/// 0 = Firmware MAY autodetect a clean shutdown of the Static RTM OS.
/// 1 = Firmware MUST NOT autodetect a clean shutdown of the Static RTM OS.
enum MOR_DISABLEAUTODETECT_BIT_MASK = 0x10;
/// MOR field bit offset
enum MOR_CLEAR_MEMORY_BIT_OFFSET = 0;
enum MOR_DISABLEAUTODETECT_BIT_OFFSET = 4;
/**
	Return the ClearMemory bit value 0 or 1.
	
	@param mor   1 byte value that contains ClearMemory and DisableAutoDetect bit.
	
	@return ClearMemory bit value
**/
// #define MOR_CLEAR_MEMORY_VALUE(mor)        (((UINT8)(mor) & MOR_CLEAR_MEMORY_BIT_MASK) >> MOR_CLEAR_MEMORY_BIT_OFFSET)
/**
	Return the DisableAutoDetect bit value 0 or 1.
	
	@param mor   1 byte value that contains ClearMemory and DisableAutoDetect bit.
	
	@return DisableAutoDetect bit value
**/
// #define MOR_DISABLE_AUTO_DETECT_VALUE(mor) (((UINT8)(mor) & MOR_DISABLEAUTODETECT_BIT_MASK) >> MOR_DISABLEAUTODETECT_BIT_OFFSET)
enum EFI_GUID EFI_MPS_TABLE_GUID = EFI_GUID(0xeb9d2d2f, 0x2d88, 0x11d3, [0x9a,
        0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
enum MPS_TABLE_GUID = EFI_MPS_TABLE_GUID;
enum EFI_GUID EFI_PC_ANSI_GUID = EFI_GUID(0xe0c14753, 0xf9be, 0x11d2, [0x9a,
        0x0c, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
enum EFI_GUID EFI_VT_100_GUID = EFI_GUID(0xdfa66065, 0xb419, 0x11d3, [0x9a,
        0x2d, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
enum EFI_GUID EFI_VT_100_PLUS_GUID = EFI_GUID(0x7baec70b, 0x57e0, 0x4c76,
        [0x8e, 0x87, 0x2f, 0x9e, 0x28, 0x08, 0x83, 0x43]);
enum EFI_GUID EFI_VT_UTF8_GUID = EFI_GUID(0xad15a0d6, 0x8bec, 0x4acf, [0xa0,
        0x73, 0xd0, 0x1d, 0xe7, 0x7e, 0x2d, 0x88]);
enum EFI_GUID DEVICE_PATH_MESSAGING_UART_FLOW_CONTROL = EFI_GUID(0x37499a9d,
        0x542f, 0x4c89, [0xa0, 0x26, 0x35, 0xda, 0x14, 0x20, 0x94, 0xe4]);
enum EFI_GUID EFI_SAS_DEVICE_PATH_GUID = EFI_GUID(0xd487ddb4, 0x008b, 0x11d9,
        [0xaf, 0xdc, 0x00, 0x10, 0x83, 0xff, 0xca, 0x4d]);

struct EFI_PROPERTIES_TABLE
{
    UINT32 Version;
    UINT32 Length;
    UINT64 MemoryProtectionAttribute;
}

enum EFI_PROPERTIES_TABLE_VERSION = 0x00010000;
enum EFI_PROPERTIES_RUNTIME_MEMORY_PROTECTION_NON_EXECUTABLE_PE_DATA = 0x1;
enum EFI_GUID SAL_SYSTEM_TABLE_GUID = EFI_GUID(0xeb9d2d32, 0x2d88, 0x11d3,
        [0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
enum EFI_GUID SMBIOS_TABLE_GUID = EFI_GUID(0xeb9d2d31, 0x2d88, 0x11d3, [0x9a,
        0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
enum EFI_GUID SMBIOS3_TABLE_GUID = EFI_GUID(0xf2fd1544, 0x9794, 0x4a2c, [0x99,
        0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94]);
/+
// FIXME: INCLUDE <PiDxe.h>
// FIXME: INCLUDE <Protocol/DebugSupport.h>
/// Global ID for the EFI_STATUS_CODE_STRING structure
enum EFI_GUID EFI_STATUS_CODE_DATA_TYPE_STRING_GUID = EFI_GUID(0x92D11080,
        0x496F, 0x4D95, [0xBE, 0x7E, 0x03, 0x74, 0x88, 0x38, 0x2B, 0x0A]);
alias EFI_STRING_TYPE = UINT32;
enum : EFI_STRING_TYPE
{
    ///
    /// A NULL-terminated ASCII string.
    ///
    EfiStringAscii,
    ///
    /// A double NULL-terminated Unicode string.
    ///
    EfiStringUnicode,
    ///
    /// An EFI_STATUS_CODE_STRING_TOKEN representing the string.  The actual
    /// string can be obtained by querying the HII Database
    ///
    EfiStringToken
}
/// Specifies the format of the data in EFI_STATUS_CODE_STRING_DATA.String.
struct EFI_STATUS_CODE_STRING_TOKEN
{
    ///
    /// The HII package list which contains the string.  Handle is a dynamic value that may
    /// not be the same for different boots.  Type EFI_HII_HANDLE is defined in
    /// EFI_HII_DATABASE_PROTOCOL.NewPackageList() in the UEFI Specification.
    ///
    EFI_HII_HANDLE Handle;
    ///
    /// When combined with Handle, the string token can be used to retrieve the string.
    /// Type EFI_STRING_ID is defined in EFI_IFR_OP_HEADER in the UEFI Specification.
    ///
    EFI_STRING_ID Token;
}

union EFI_STATUS_CODE_STRING
{
    ///
    /// ASCII formatted string.
    ///
    CHAR8* Ascii;
    ///
    /// Unicode formatted string.
    ///
    CHAR16* Unicode;
    ///
    /// HII handle/token pair.
    ///
    EFI_STATUS_CODE_STRING_TOKEN Hii;
}
/// This data type defines a string type of extended data. A string can accompany
/// any status code. The string can provide additional information about the
/// status code. The string can be ASCII, Unicode, or a Human Interface Infrastructure
/// (HII) token/GUID pair.
struct EFI_STATUS_CODE_STRING_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_STATUS_CODE_STRING_DATA) - HeaderSize, and
    /// DataHeader.Type should be
    /// EFI_STATUS_CODE_DATA_TYPE_STRING_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// Specifies the format of the data in String.
    ///
    EFI_STRING_TYPE StringType;
    ///
    /// A pointer to the extended data. The data follows the format specified by
    /// StringType.
    ///
    EFI_STATUS_CODE_STRING String;
}
/// Global ID for the following structures:
///   - EFI_DEVICE_PATH_EXTENDED_DATA
///   - EFI_DEVICE_HANDLE_EXTENDED_DATA
///   - EFI_RESOURCE_ALLOC_FAILURE_ERROR_DATA
///   - EFI_COMPUTING_UNIT_VOLTAGE_ERROR_DATA
///   - EFI_COMPUTING_UNIT_MICROCODE_UPDATE_ERROR_DATA
///   - EFI_COMPUTING_UNIT_TIMER_EXPIRED_ERROR_DATA
///   - EFI_HOST_PROCESSOR_MISMATCH_ERROR_DATA
///   - EFI_MEMORY_RANGE_EXTENDED_DATA
///   - EFI_DEBUG_ASSERT_DATA
///   - EFI_STATUS_CODE_EXCEP_EXTENDED_DATA
///   - EFI_STATUS_CODE_START_EXTENDED_DATA
///   - EFI_LEGACY_OPROM_EXTENDED_DATA
enum EFI_GUID EFI_STATUS_CODE_SPECIFIC_DATA_GUID = EFI_GUID(0x335984bd, 0xe805,
        0x409a, [0xb8, 0xf8, 0xd2, 0x7e, 0xce, 0x5f, 0xf7, 0xa6]);
		
/// Extended data about the device path, which is used for many errors and
/// progress codes to point to the device.
/// The device path is used to point to the physical device in case there is more than one device
/// belonging to the same subclass. For example, the system may contain two USB keyboards and one
/// PS/2* keyboard. The driver that parses the status code can use the device path extended data to
/// differentiate between the three. The index field is not useful in this case because there is no standard
/// numbering convention. Device paths are preferred over using device handles because device handles
/// for a given device can change from one boot to another and do not mean anything beyond Boot
/// Services time. In certain cases, the bus driver may not create a device handle for a given device if it
/// detects a critical error. In these cases, the device path extended data can be used to refer to the
/// device, but there may not be any device handles with an instance of
/// EFI_DEVICE_PATH_PROTOCOL that matches DevicePath. The variable device path structure
/// is included in this structure to make it self sufficient.
struct EFI_DEVICE_PATH_EXTENDED_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA). DataHeader.Size should be the size
    /// of variable-length DevicePath, and DataHeader.Size is zero for a virtual
    /// device that does not have a device path. DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The device path to the controller or the hardware device. Note that this parameter is a
    /// variable-length device path structure and not a pointer to such a structure. This structure is
    /// populated only if it is a physical device. For virtual devices, the Size field in DataHeader
    /// is set to zero and this field is not populated.
    ///
    //  EFI_DEVICE_PATH_PROTOCOL         DevicePath;
}
/// Device handle Extended Data. Used for many
/// errors and progress codes to point to the device.
/// The handle of the device with which the progress or error code is associated. The handle is
/// guaranteed to be accurate only at the time the status code is reported. Handles are dynamic entities
/// between boots, so handles cannot be considered to be valid if the system has reset subsequent to the
/// status code being reported. Handles may be used to determine a wide variety of useful information
/// about the source of the status code.
struct EFI_DEVICE_HANDLE_EXTENDED_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_DEVICE_HANDLE_EXTENDED_DATA) - HeaderSize, and
    /// DataHeader.Type should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The device handle.
    ///
    EFI_HANDLE Handle;
}
/// This structure defines extended data describing a PCI resource allocation error.
/// @par Note:
///   The following structure contains variable-length fields and cannot be defined as a C-style
///   structure.
/// This extended data conveys details for a PCI resource allocation failure error. See the PCI
/// specification and the ACPI specification for details on PCI resource allocations and the format for
/// resource descriptors. This error does not detail why the resource allocation failed. It may be due to a
/// bad resource request or a lack of available resources to satisfy a valid request. The variable device
/// path structure and the resource structures are included in this structure to make it self sufficient.
struct EFI_RESOURCE_ALLOC_FAILURE_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be sizeof
    /// (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// (DevicePathSize + DevicePathSize + DevicePathSize +
    /// sizeof(UINT32) + 3 * sizeof (UINT16) ), and DataHeader.Type
    /// should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The PCI BAR. Applicable only for PCI devices. Ignored for all other devices.
    ///
    UINT32 Bar;
    ///
    /// DevicePathSize should be zero if it is a virtual device that is not associated with
    /// a device path. Otherwise, this parameter is the length of the variable-length
    /// DevicePath.
    ///
    UINT16 DevicePathSize;
    ///
    /// Represents the size the ReqRes parameter. ReqResSize should be zero if the
    /// requested resources are not provided as a part of extended data.
    ///
    UINT16 ReqResSize;
    ///
    /// Represents the size the AllocRes parameter. AllocResSize should be zero if the
    /// allocated resources are not provided as a part of extended data.
    ///
    UINT16 AllocResSize;
    ///
    /// The device path to the controller or the hardware device that did not get the requested
    /// resources. Note that this parameter is the variable-length device path structure and not
    /// a pointer to this structure.
    ///
    //  EFI_DEVICE_PATH_PROTOCOL       DevicePath;
    ///
    /// The requested resources in the format of an ACPI 2.0 resource descriptor. This
    /// parameter is not a pointer; it is the complete resource descriptor.
    ///
    //  UINT8                          ReqRes[];
    ///
    /// The allocated resources in the format of an ACPI 2.0 resource descriptor. This
    /// parameter is not a pointer; it is the complete resource descriptor.
    ///
    //  UINT8                          AllocRes[];
}
/// This structure provides a calculation for base-10 representations.
/// Not consistent with PI 1.2 Specification.
/// This data type is not defined in the PI 1.2 Specification, but is
/// required by several of the other data structures in this file.
struct EFI_EXP_BASE10_DATA
{
    ///
    /// The INT16 number by which to multiply the base-2 representation.
    ///
    INT16 Value;
    ///
    /// The INT16 number by which to raise the base-2 calculation.
    ///
    INT16 Exponent;
}
/// This structure provides the voltage at the time of error. It also provides
/// the threshold value indicating the minimum or maximum voltage that is considered
/// an error. If the voltage is less then the threshold, the error indicates that the
/// voltage fell below the minimum acceptable value. If the voltage is greater then the threshold,
/// the error indicates that the voltage rose above the maximum acceptable value.
struct EFI_COMPUTING_UNIT_VOLTAGE_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_COMPUTING_UNIT_VOLTAGE_ERROR_DATA) -
    /// HeaderSize, and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The voltage value at the time of the error.
    ///
    EFI_EXP_BASE10_DATA Voltage;
    ///
    /// The voltage threshold.
    ///
    EFI_EXP_BASE10_DATA Threshold;
}
/// Microcode Update Extended Error Data
struct EFI_COMPUTING_UNIT_MICROCODE_UPDATE_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_COMPUTING_UNIT_MICROCODE_UPDATE_ERROR_DATA) -
    /// HeaderSize, and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The version of the microcode update from the header.
    ///
    UINT32 Version;
}
/// This structure provides details about the computing unit timer expiration error.
/// The timer limit provides the timeout value of the timer prior to expiration.
struct EFI_COMPUTING_UNIT_TIMER_EXPIRED_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_COMPUTING_UNIT_TIMER_EXPIRED_ERROR_DATA) -
    /// HeaderSize, and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The number of seconds that the computing unit timer was configured to expire.
    ///
    EFI_EXP_BASE10_DATA TimerLimit;
}
/// Attribute bits for EFI_HOST_PROCESSOR_MISMATCH_ERROR_DATA.Attributes
/// All other attributes are reserved for future use and must be initialized to 0.
///@{
enum EFI_COMPUTING_UNIT_MISMATCH_SPEED = 0x0001;
enum EFI_COMPUTING_UNIT_MISMATCH_FSB_SPEED = 0x0002;
enum EFI_COMPUTING_UNIT_MISMATCH_FAMILY = 0x0004;
enum EFI_COMPUTING_UNIT_MISMATCH_MODEL = 0x0008;
enum EFI_COMPUTING_UNIT_MISMATCH_STEPPING = 0x0010;
enum EFI_COMPUTING_UNIT_MISMATCH_CACHE_SIZE = 0x0020;
enum EFI_COMPUTING_UNIT_MISMATCH_OEM1 = 0x1000;
enum EFI_COMPUTING_UNIT_MISMATCH_OEM2 = 0x2000;
enum EFI_COMPUTING_UNIT_MISMATCH_OEM3 = 0x4000;
enum EFI_COMPUTING_UNIT_MISMATCH_OEM4 = 0x8000;
///@}
/// This structure defines extended data for processor mismatch errors.
/// This provides information to indicate which processors mismatch, and how they mismatch. The
/// status code contains the instance number of the processor that is in error. This structure's
/// Instance indicates the second processor that does not match. This differentiation allows the
/// consumer to determine which two processors do not match. The Attributes indicate what
/// mismatch is being reported. Because Attributes is a bit field, more than one mismatch can be
/// reported with one error code.
struct EFI_HOST_PROCESSOR_MISMATCH_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_ HOST_PROCESSOR_MISMATCH_ERROR_DATA) -
    /// HeaderSize , and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The unit number of the computing unit that does not match.
    ///
    UINT32 Instance;
    ///
    /// The attributes describing the failure.
    ///
    UINT16 Attributes;
}
/// This structure provides details about the computing unit thermal failure.
/// This structure provides the temperature at the time of error. It also provides the threshold value
/// indicating the minimum temperature that is considered an error.
struct EFI_COMPUTING_UNIT_THERMAL_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_COMPUTING_UNIT_THERMAL_ERROR_DATA) -
    /// HeaderSize , and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The thermal value at the time of the error.
    ///
    EFI_EXP_BASE10_DATA Temperature;
    ///
    /// The thermal threshold.
    ///
    EFI_EXP_BASE10_DATA Threshold;
}
/// Enumeration of valid cache types
alias EFI_INIT_CACHE_TYPE = UINT32;
enum : EFI_INIT_CACHE_TYPE
{
    EfiInitCacheDataOnly,
    EfiInitCacheInstrOnly,
    EfiInitCacheBoth,
    EfiInitCacheUnspecified
}
/// Embedded cache init extended data
struct EFI_CACHE_INIT_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_CACHE_INIT_DATA) - HeaderSize , and
    /// DataHeader.Type should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The cache level. Starts with 1 for level 1 cache.
    ///
    UINT32 Level;
    ///
    /// The type of cache.
    ///
    EFI_INIT_CACHE_TYPE Type;
}

alias EFI_CPU_STATE_CHANGE_CAUSE = UINT32;
/// The reasons that the processor is disabled.
/// Used to fill in EFI_COMPUTING_UNIT_CPU_DISABLED_ERROR_DATA.Cause.
///@{
enum EFI_CPU_CAUSE_INTERNAL_ERROR = 0x0001;
enum EFI_CPU_CAUSE_THERMAL_ERROR = 0x0002;
enum EFI_CPU_CAUSE_SELFTEST_FAILURE = 0x0004;
enum EFI_CPU_CAUSE_PREBOOT_TIMEOUT = 0x0008;
enum EFI_CPU_CAUSE_FAILED_TO_START = 0x0010;
enum EFI_CPU_CAUSE_CONFIG_ERROR = 0x0020;
enum EFI_CPU_CAUSE_USER_SELECTION = 0x0080;
enum EFI_CPU_CAUSE_BY_ASSOCIATION = 0x0100;
enum EFI_CPU_CAUSE_UNSPECIFIED = 0x8000;
///@}
/// This structure provides information about the disabled computing unit.
/// This structure provides details as to why and how the computing unit was disabled. The causes
/// should cover the typical reasons a processor would be disabled. How the processor was disabled is
/// important because there are distinct differences between hardware and software disabling.
struct EFI_COMPUTING_UNIT_CPU_DISABLED_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_COMPUTING_UNIT_CPU_DISABLED_ERROR_DATA) -
    /// HeaderSize, and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The reason for disabling the processor.
    ///
    UINT32 Cause;
    ///
    /// TRUE if the processor is disabled via software means such as not listing it in the ACPI tables.
    /// Such a processor will respond to Interprocessor Interrupts (IPIs). FALSE if the processor is hardware
    /// disabled, which means it is invisible to software and will not respond to IPIs.
    ///
    BOOLEAN SoftwareDisabled;
}
/// Memory Error Granularity Definition
alias EFI_MEMORY_ERROR_GRANULARITY = UINT8;
/// Memory Error Granularities.  Used to fill in EFI_MEMORY_EXTENDED_ERROR_DATA.Granularity.
///@{
enum EFI_MEMORY_ERROR_OTHER = 0x01;
enum EFI_MEMORY_ERROR_UNKNOWN = 0x02;
enum EFI_MEMORY_ERROR_DEVICE = 0x03;
enum EFI_MEMORY_ERROR_PARTITION = 0x04;
///@}
/// Memory Error Operation Definition
alias EFI_MEMORY_ERROR_OPERATION = UINT8;
/// Memory Error Operations.  Used to fill in EFI_MEMORY_EXTENDED_ERROR_DATA.Operation.
///@{
enum EFI_MEMORY_OPERATION_OTHER = 0x01;
enum EFI_MEMORY_OPERATION_UNKNOWN = 0x02;
enum EFI_MEMORY_OPERATION_READ = 0x03;
enum EFI_MEMORY_OPERATION_WRITE = 0x04;
enum EFI_MEMORY_OPERATION_PARTIAL_WRITE = 0x05;
///@}
/// This structure provides specific details about the memory error that was detected. It provides
/// enough information so that consumers can identify the exact failure and provides enough
/// information to enable corrective action if necessary.
struct EFI_MEMORY_EXTENDED_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_MEMORY_EXTENDED_ERROR_DATA) - HeaderSize, and
    /// DataHeader.Type should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The error granularity type.
    ///
    EFI_MEMORY_ERROR_GRANULARITY Granularity;
    ///
    /// The operation that resulted in the error being detected.
    ///
    EFI_MEMORY_ERROR_OPERATION Operation;
    ///
    /// The error syndrome, vendor-specific ECC syndrome, or CRC data associated with
    /// the error.  If unknown, should be initialized to 0.
    /// Inconsistent with specification here:
    /// This field in StatusCodes spec0.9 is defined as UINT32, keep code unchanged.
    ///
    UINTN Syndrome;
    ///
    /// The physical address of the error.
    ///
    EFI_PHYSICAL_ADDRESS Address;
    ///
    /// The range, in bytes, within which the error address can be determined.
    ///
    UINTN Resolution;
}
/// A definition to describe that the operation is performed on multiple devices within the array.
/// May be used for EFI_STATUS_CODE_DIMM_NUMBER.Array and EFI_STATUS_CODE_DIMM_NUMBER.Device.
enum EFI_MULTIPLE_MEMORY_DEVICE_OPERATION = 0xfffe;
/// A definition to describe that the operation is performed on all devices within the array.
/// May be used for EFI_STATUS_CODE_DIMM_NUMBER.Array and EFI_STATUS_CODE_DIMM_NUMBER.Device.
enum EFI_ALL_MEMORY_DEVICE_OPERATION = 0xffff;
/// A definition to describe that the operation is performed on multiple arrays.
/// May be used for EFI_STATUS_CODE_DIMM_NUMBER.Array and EFI_STATUS_CODE_DIMM_NUMBER.Device.
enum EFI_MULTIPLE_MEMORY_ARRAY_OPERATION = 0xfffe;
/// A definition to describe that the operation is performed on all the arrays.
/// May be used for EFI_STATUS_CODE_DIMM_NUMBER.Array and EFI_STATUS_CODE_DIMM_NUMBER.Device.
enum EFI_ALL_MEMORY_ARRAY_OPERATION = 0xffff;
/// This extended data provides some context that consumers can use to locate a DIMM within the
/// overall memory scheme.
/// This extended data provides some context that consumers can use to locate a DIMM within the
/// overall memory scheme. The Array and Device numbers may indicate a specific DIMM, or they
/// may be populated with the group definitions in "Related Definitions" below.
struct EFI_STATUS_CODE_DIMM_NUMBER
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_STATUS_CODE_DIMM_NUMBER) - HeaderSize, and
    /// DataHeader.Type should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The memory array number.
    ///
    UINT16 Array;
    ///
    /// The device number within that Array.
    ///
    UINT16 Device;
}
/// This structure defines extended data describing memory modules that do not match.
/// This extended data may be used to convey the specifics of memory modules that do not match.
struct EFI_MEMORY_MODULE_MISMATCH_ERROR_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_MEMORY_MODULE_MISMATCH_ERROR_DATA) -
    /// HeaderSize, and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The instance number of the memory module that does not match.
    ///
    EFI_STATUS_CODE_DIMM_NUMBER Instance;
}
/// This structure defines extended data describing a memory range.
/// This extended data may be used to convey the specifics of a memory range.  Ranges are specified
/// with a start address and a length.
struct EFI_MEMORY_RANGE_EXTENDED_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_MEMORY_RANGE_EXTENDED_DATA) - HeaderSize, and
    /// DataHeader.Type should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The starting address of the memory range.
    ///
    EFI_PHYSICAL_ADDRESS Start;
    ///
    /// The length in bytes of the memory range.
    ///
    EFI_PHYSICAL_ADDRESS Length;
}
/// This structure provides the assert information that is typically associated with a debug assertion failing.
/// The data indicates the location of the assertion that failed in the source code. This information
/// includes the file name and line number that are necessary to find the failing assertion in source code.
struct EFI_DEBUG_ASSERT_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_DEBUG_ASSERT_DATA) - HeaderSize , and
    /// DataHeader.Type should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The line number of the source file where the fault was generated.
    ///
    UINT32 LineNumber;
    ///
    /// The size in bytes of FileName.
    ///
    UINT32 FileNameSize;
    ///
    /// A pointer to a NULL-terminated ASCII or Unicode string that represents
    /// the file name of the source file where the fault was generated.
    ///
    EFI_STATUS_CODE_STRING_DATA* FileName;
}
/// System Context Data EBC/IA32/IPF
union EFI_STATUS_CODE_EXCEP_SYSTEM_CONTEXT
{
    ///
    /// The context of the EBC virtual machine when the exception was generated. Type
    /// EFI_SYSTEM_CONTEXT_EBC is defined in EFI_DEBUG_SUPPORT_PROTOCOL
    /// in the UEFI Specification.
    ///
    EFI_SYSTEM_CONTEXT_EBC SystemContextEbc;
    ///
    /// The context of the IA-32 processor when the exception was generated. Type
    /// EFI_SYSTEM_CONTEXT_IA32 is defined in the
    /// EFI_DEBUG_SUPPORT_PROTOCOL in the UEFI Specification.
    ///
    EFI_SYSTEM_CONTEXT_IA32 SystemContextIa32;
    ///
    /// The context of the Itanium(R) processor when the exception was generated. Type
    /// EFI_SYSTEM_CONTEXT_IPF is defined in the
    /// EFI_DEBUG_SUPPORT_PROTOCOL in the UEFI Specification.
    ///
    EFI_SYSTEM_CONTEXT_IPF SystemContextIpf;
    ///
    /// The context of the X64 processor when the exception was generated. Type
    /// EFI_SYSTEM_CONTEXT_X64 is defined in the
    /// EFI_DEBUG_SUPPORT_PROTOCOL in the UEFI Specification.
    ///
    EFI_SYSTEM_CONTEXT_X64 SystemContextX64;
    ///
    /// The context of the ARM processor when the exception was generated. Type
    /// EFI_SYSTEM_CONTEXT_ARM is defined in the
    /// EFI_DEBUG_SUPPORT_PROTOCOL in the UEFI Specification.
    ///
    EFI_SYSTEM_CONTEXT_ARM SystemContextArm;
}
/// This structure defines extended data describing a processor exception error.
/// This extended data allows the processor context that is present at the time of the exception to be
/// reported with the exception. The format and contents of the context data varies depending on the
/// processor architecture.
struct EFI_STATUS_CODE_EXCEP_EXTENDED_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_STATUS_CODE_EXCEP_EXTENDED_DATA) - HeaderSize,
    /// and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The system context.
    ///
    EFI_STATUS_CODE_EXCEP_SYSTEM_CONTEXT Context;
}
/// This structure defines extended data describing a call to a driver binding protocol start function.
/// This extended data records information about a Start() function call. Start() is a member of
/// the UEFI Driver Binding Protocol.
struct EFI_STATUS_CODE_START_EXTENDED_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_STATUS_CODE_START_EXTENDED_DATA) - HeaderSize,
    /// and DataHeader.Type should be
    /// EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The controller handle.
    ///
    EFI_HANDLE ControllerHandle;
    ///
    /// The driver binding handle.
    ///
    EFI_HANDLE DriverBindingHandle;
    ///
    /// The size of the RemainingDevicePath. It is zero if the Start() function is
    /// called with RemainingDevicePath = NULL.  The UEFI Specification allows
    /// that the Start() function of bus drivers can be called in this way.
    ///
    UINT16 DevicePathSize;
    ///
    /// Matches the RemainingDevicePath parameter being passed to the Start() function.
    /// Note that this parameter is the variable-length device path and not a pointer
    /// to the device path.
    ///
    //  EFI_DEVICE_PATH_PROTOCOL   RemainingDevicePath;
}
/// This structure defines extended data describing a legacy option ROM (OpROM).
/// The device handle and ROM image base can be used by consumers to determine which option ROM
/// failed. Due to the black-box nature of legacy option ROMs, the amount of information that can be
/// obtained may be limited.
struct EFI_LEGACY_OPROM_EXTENDED_DATA
{
    ///
    /// The data header identifying the data. DataHeader.HeaderSize should be
    /// sizeof (EFI_STATUS_CODE_DATA), DataHeader.Size should be
    /// sizeof (EFI_LEGACY_OPROM_EXTENDED_DATA) - HeaderSize, and
    /// DataHeader.Type should be EFI_STATUS_CODE_SPECIFIC_DATA_GUID.
    ///
    EFI_STATUS_CODE_DATA DataHeader;
    ///
    /// The handle corresponding to the device that this legacy option ROM is being invoked.
    ///
    EFI_HANDLE DeviceHandle;
    ///
    /// The base address of the shadowed legacy ROM image.  May or may not point to the shadow RAM area.
    ///
    EFI_PHYSICAL_ADDRESS RomImageBase;
}
+/
enum EFI_GUID EFI_SYSTEM_RESOURCE_TABLE_GUID = EFI_GUID(0xb122a263, 0x3661,
        0x4f68, [0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80]);
/// Current Entry Version
enum EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION = 1;
/// Firmware Type Definitions
enum ESRT_FW_TYPE_UNKNOWN = 0x00000000;
enum ESRT_FW_TYPE_SYSTEMFIRMWARE = 0x00000001;
enum ESRT_FW_TYPE_DEVICEFIRMWARE = 0x00000002;
enum ESRT_FW_TYPE_UEFIDRIVER = 0x00000003;
/// Last Attempt Status Values
enum LAST_ATTEMPT_STATUS_SUCCESS = 0x00000000;
enum LAST_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL = 0x00000001;
enum LAST_ATTEMPT_STATUS_ERROR_INSUFFICIENT_RESOURCES = 0x00000002;
enum LAST_ATTEMPT_STATUS_ERROR_INCORRECT_VERSION = 0x00000003;
enum LAST_ATTEMPT_STATUS_ERROR_INVALID_FORMAT = 0x00000004;
enum LAST_ATTEMPT_STATUS_ERROR_AUTH_ERROR = 0x00000005;
enum LAST_ATTEMPT_STATUS_ERROR_PWR_EVT_AC = 0x00000006;
enum LAST_ATTEMPT_STATUS_ERROR_PWR_EVT_BATT = 0x00000007;
struct EFI_SYSTEM_RESOURCE_ENTRY
{
    ///
    /// The firmware class field contains a GUID that identifies a firmware component
    /// that can be updated via UpdateCapsule(). This GUID must be unique within all
    /// entries of the ESRT.
    ///
    EFI_GUID FwClass;
    ///
    /// Identifies the type of firmware resource.
    ///
    UINT32 FwType;
    ///
    /// The firmware version field represents the current version of the firmware
    /// resource, value must always increase as a larger number represents a newer
    /// version.
    ///
    UINT32 FwVersion;
    ///
    /// The lowest firmware resource version to which a firmware resource can be
    /// rolled back for the given system/device. Generally this is used to protect
    /// against known and fixed security issues.
    ///
    UINT32 LowestSupportedFwVersion;
    ///
    /// The capsule flags field contains the CapsuleGuid flags (bits 0- 15) as defined
    /// in the EFI_CAPSULE_HEADER that will be set in the capsule header.
    ///
    UINT32 CapsuleFlags;
    ///
    /// The last attempt version field describes the last firmware version for which
    /// an update was attempted (uses the same format as Firmware Version).
    /// Last Attempt Version is updated each time an UpdateCapsule() is attempted for
    /// an ESRT entry and is preserved across reboots (non-). However, in
    /// cases where the attempt version is not recorded due to limitations in the
    /// update process, the field shall set to zero after a failed update. Similarly,
    /// in the case of a removable device, this value is set to 0 in cases where the
    /// device has not been updated since being added to the system.
    ///
    UINT32 LastAttemptVersion;
    ///
    /// The last attempt status field describes the result of the last firmware update
    /// attempt for the firmware resource entry.
    /// LastAttemptStatus is updated each time an UpdateCapsule() is attempted for an
    /// ESRT entry and is preserved across reboots (non-).
    /// If a firmware update has never been attempted or is unknown, for example after
    /// fresh insertion of a removable device, LastAttemptStatus must be set to Success.
    ///
    UINT32 LastAttemptStatus;
}

struct EFI_SYSTEM_RESOURCE_TABLE
{
    ///
    /// The number of firmware resources in the table, must not be zero.
    ///
    UINT32 FwResourceCount;
    ///
    /// The maximum number of resource array entries that can be within the table
    /// without reallocating the table, must not be zero.
    ///
    UINT32 FwResourceCountMax;
    ///
    /// The version of the EFI_SYSTEM_RESOURCE_ENTRY entities used in this table.
    /// This field should be set to 1.
    ///
    UINT64 FwResourceVersion;
    ///
    /// Array of EFI_SYSTEM_RESOURCE_ENTRY
    ///
    //EFI_SYSTEM_RESOURCE_ENTRY  Entries[];
}
// FIXME: INCLUDE <Ppi/VectorHandoffInfo.h>
enum EFI_GUID EFI_VECTOR_HANDOF_TABLE_GUID = EFI_GUID(0x996ec11c, 0x5397,
        0x4e73, [0xb5, 0x8f, 0x82, 0x7e, 0x52, 0x90, 0x6d, 0xef]);
enum WIN_CERT_TYPE_PKCS_SIGNED_DATA = 0x0002;
enum WIN_CERT_TYPE_EFI_PKCS115 = 0x0EF0;
enum WIN_CERT_TYPE_EFI_GUID = 0x0EF1;
/// The WIN_CERTIFICATE structure is part of the PE/COFF specification.
struct WIN_CERTIFICATE
{
    ///
    /// The length of the entire certificate,
    /// including the length of the header, in bytes.
    ///
    UINT32 dwLength;
    ///
    /// The revision level of the WIN_CERTIFICATE
    /// structure. The current revision level is 0x0200.
    ///
    UINT16 wRevision;
    ///
    /// The certificate type. See WIN_CERT_TYPE_xxx for the UEFI
    /// certificate types. The UEFI specification reserves the range of
    /// certificate type values from 0x0EF0 to 0x0EFF.
    ///
    UINT16 wCertificateType;
    ///
    /// The following is the actual certificate. The format of
    /// the certificate depends on wCertificateType.
    ///
    /// UINT8 bCertificate[ANYSIZE_ARRAY];
    ///
}
/// WIN_CERTIFICATE_UEFI_GUID.CertType
enum EFI_GUID EFI_CERT_TYPE_RSA2048_SHA256_GUID = EFI_GUID(0xa7717414, 0xc616,
        0x4977, [0x94, 0x20, 0x84, 0x47, 0x12, 0xa7, 0x35, 0xbf]);
/// WIN_CERTIFICATE_UEFI_GUID.CertData
struct EFI_CERT_BLOCK_RSA_2048_SHA256
{
    EFI_GUID HashType;
    UINT8[256] PublicKey;
    UINT8[256] Signature;
}
/// Certificate which encapsulates a GUID-specific digital signature
struct WIN_CERTIFICATE_UEFI_GUID
{
    ///
    /// This is the standard WIN_CERTIFICATE header, where
    /// wCertificateType is set to WIN_CERT_TYPE_EFI_GUID.
    ///
    WIN_CERTIFICATE Hdr;
    ///
    /// This is the unique id which determines the
    /// format of the CertData. .
    ///
    EFI_GUID CertType;
    ///
    /// The following is the certificate data. The format of
    /// the data is determined by the CertType.
    /// If CertType is EFI_CERT_TYPE_RSA2048_SHA256_GUID,
    /// the CertData will be EFI_CERT_BLOCK_RSA_2048_SHA256 structure.
    ///
    UINT8[1] CertData;
}
/// Certificate which encapsulates the RSASSA_PKCS1-v1_5 digital signature.
/// The WIN_CERTIFICATE_UEFI_PKCS1_15 structure is derived from
/// WIN_CERTIFICATE and encapsulate the information needed to
/// implement the RSASSA-PKCS1-v1_5 digital signature algorithm as
/// specified in RFC2437.
struct WIN_CERTIFICATE_EFI_PKCS1_15
{
    ///
    /// This is the standard WIN_CERTIFICATE header, where
    /// wCertificateType is set to WIN_CERT_TYPE_UEFI_PKCS1_15.
    ///
    WIN_CERTIFICATE Hdr;
    ///
    /// This is the hashing algorithm which was performed on the
    /// UEFI executable when creating the digital signature.
    ///
    EFI_GUID HashAlgorithm;
    ///
    /// The following is the actual digital signature. The
    /// size of the signature is the same size as the key
    /// (1024-bit key is 128 bytes) and can be determined by
    /// subtracting the length of the other parts of this header
    /// from the total length of the certificate as found in
    /// Hdr.dwLength.
    ///
    /// UINT8 Signature[];
    ///
}
