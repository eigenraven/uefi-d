/**
	Based on IndustryStandard/Acpi40.h, original notice:

	ACPI 4.0 definitions from the ACPI Specification Revision 4.0a April 5, 2010
	
	Copyright (c) 2010 - 2011, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
**/
module uefi.acpi40;
import uefi.base;
import uefi.base_type;
import uefi.acpiaml;
import uefi.acpi10;
import uefi.acpi20;
import uefi.acpi30;

public:
extern (C):

/// ACPI 4.0 Generic Address Space definition
struct EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE
{
align(1):
    UINT8 AddressSpaceId;
    UINT8 RegisterBitWidth;
    UINT8 RegisterBitOffset;
    UINT8 AccessSize;
    UINT64 Address;
}

enum EFI_ACPI_4_0_SYSTEM_MEMORY = 0;
enum EFI_ACPI_4_0_SYSTEM_IO = 1;
enum EFI_ACPI_4_0_PCI_CONFIGURATION_SPACE = 2;
enum EFI_ACPI_4_0_EMBEDDED_CONTROLLER = 3;
enum EFI_ACPI_4_0_SMBUS = 4;
enum EFI_ACPI_4_0_FUNCTIONAL_FIXED_HARDWARE = 0x7F;
enum EFI_ACPI_4_0_UNDEFINED = 0;
enum EFI_ACPI_4_0_BYTE = 1;
enum EFI_ACPI_4_0_WORD = 2;
enum EFI_ACPI_4_0_DWORD = 3;
enum EFI_ACPI_4_0_QWORD = 4;
/// Root System Description Pointer Structure
struct EFI_ACPI_4_0_ROOT_SYSTEM_DESCRIPTION_POINTER
{
align(1):
    UINT64 Signature;
    UINT8 Checksum;
    UINT8[6] OemId;
    UINT8 Revision;
    UINT32 RsdtAddress;
    UINT32 Length;
    UINT64 XsdtAddress;
    UINT8 ExtendedChecksum;
    UINT8[3] Reserved;
}
/// RSD_PTR Revision (as defined in ACPI 4.0b spec.)
enum EFI_ACPI_4_0_ROOT_SYSTEM_DESCRIPTION_POINTER_REVISION = 0x02; ///< ACPISpec (Revision 4.0a) says current value is 2 
/// Common table header, this prefaces all ACPI tables, including FACS, but
/// excluding the RSD PTR structure
struct EFI_ACPI_4_0_COMMON_HEADER
{
align(1):
    UINT32 Signature;
    UINT32 Length;
}
/// RSDT Revision (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_ROOT_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x01;
/// XSDT Revision (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_EXTENDED_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x01;
/// Fixed ACPI Description Table Structure (FADT)
struct EFI_ACPI_4_0_FIXED_ACPI_DESCRIPTION_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 FirmwareCtrl;
    UINT32 Dsdt;
    UINT8 Reserved0;
    UINT8 PreferredPmProfile;
    UINT16 SciInt;
    UINT32 SmiCmd;
    UINT8 AcpiEnable;
    UINT8 AcpiDisable;
    UINT8 S4BiosReq;
    UINT8 PstateCnt;
    UINT32 Pm1aEvtBlk;
    UINT32 Pm1bEvtBlk;
    UINT32 Pm1aCntBlk;
    UINT32 Pm1bCntBlk;
    UINT32 Pm2CntBlk;
    UINT32 PmTmrBlk;
    UINT32 Gpe0Blk;
    UINT32 Gpe1Blk;
    UINT8 Pm1EvtLen;
    UINT8 Pm1CntLen;
    UINT8 Pm2CntLen;
    UINT8 PmTmrLen;
    UINT8 Gpe0BlkLen;
    UINT8 Gpe1BlkLen;
    UINT8 Gpe1Base;
    UINT8 CstCnt;
    UINT16 PLvl2Lat;
    UINT16 PLvl3Lat;
    UINT16 FlushSize;
    UINT16 FlushStride;
    UINT8 DutyOffset;
    UINT8 DutyWidth;
    UINT8 DayAlrm;
    UINT8 MonAlrm;
    UINT8 Century;
    UINT16 IaPcBootArch;
    UINT8 Reserved1;
    UINT32 Flags;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE ResetReg;
    UINT8 ResetValue;
    UINT8[3] Reserved2;
    UINT64 XFirmwareCtrl;
    UINT64 XDsdt;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XPm1aEvtBlk;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XPm1bEvtBlk;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XPm1aCntBlk;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XPm1bCntBlk;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XPm2CntBlk;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XPmTmrBlk;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XGpe0Blk;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE XGpe1Blk;
}
/// FADT Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_FIXED_ACPI_DESCRIPTION_TABLE_REVISION = 0x04;
enum EFI_ACPI_4_0_PM_PROFILE_UNSPECIFIED = 0;
enum EFI_ACPI_4_0_PM_PROFILE_DESKTOP = 1;
enum EFI_ACPI_4_0_PM_PROFILE_MOBILE = 2;
enum EFI_ACPI_4_0_PM_PROFILE_WORKSTATION = 3;
enum EFI_ACPI_4_0_PM_PROFILE_ENTERPRISE_SERVER = 4;
enum EFI_ACPI_4_0_PM_PROFILE_SOHO_SERVER = 5;
enum EFI_ACPI_4_0_PM_PROFILE_APPLIANCE_PC = 6;
enum EFI_ACPI_4_0_PM_PROFILE_PERFORMANCE_SERVER = 7;
enum EFI_ACPI_4_0_LEGACY_DEVICES = BIT0;
enum EFI_ACPI_4_0_8042 = BIT1;
enum EFI_ACPI_4_0_VGA_NOT_PRESENT = BIT2;
enum EFI_ACPI_4_0_MSI_NOT_SUPPORTED = BIT3;
enum EFI_ACPI_4_0_PCIE_ASPM_CONTROLS = BIT4;
enum EFI_ACPI_4_0_WBINVD = BIT0;
enum EFI_ACPI_4_0_WBINVD_FLUSH = BIT1;
enum EFI_ACPI_4_0_PROC_C1 = BIT2;
enum EFI_ACPI_4_0_P_LVL2_UP = BIT3;
enum EFI_ACPI_4_0_PWR_BUTTON = BIT4;
enum EFI_ACPI_4_0_SLP_BUTTON = BIT5;
enum EFI_ACPI_4_0_FIX_RTC = BIT6;
enum EFI_ACPI_4_0_RTC_S4 = BIT7;
enum EFI_ACPI_4_0_TMR_VAL_EXT = BIT8;
enum EFI_ACPI_4_0_DCK_CAP = BIT9;
enum EFI_ACPI_4_0_RESET_REG_SUP = BIT10;
enum EFI_ACPI_4_0_SEALED_CASE = BIT11;
enum EFI_ACPI_4_0_HEADLESS = BIT12;
enum EFI_ACPI_4_0_CPU_SW_SLP = BIT13;
enum EFI_ACPI_4_0_PCI_EXP_WAK = BIT14;
enum EFI_ACPI_4_0_USE_PLATFORM_CLOCK = BIT15;
enum EFI_ACPI_4_0_S4_RTC_STS_VALID = BIT16;
enum EFI_ACPI_4_0_REMOTE_POWER_ON_CAPABLE = BIT17;
enum EFI_ACPI_4_0_FORCE_APIC_CLUSTER_MODEL = BIT18;
enum EFI_ACPI_4_0_FORCE_APIC_PHYSICAL_DESTINATION_MODE = BIT19;
/// Firmware ACPI Control Structure
struct EFI_ACPI_4_0_FIRMWARE_ACPI_CONTROL_STRUCTURE
{
align(1):
    UINT32 Signature;
    UINT32 Length;
    UINT32 HardwareSignature;
    UINT32 FirmwareWakingVector;
    UINT32 GlobalLock;
    UINT32 Flags;
    UINT64 XFirmwareWakingVector;
    UINT8 Version;
    UINT8[3] Reserved0;
    UINT32 OspmFlags;
    UINT8[24] Reserved1;
}
/// FACS Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_FIRMWARE_ACPI_CONTROL_STRUCTURE_VERSION = 0x02;
/// Firmware Control Structure Feature Flags
/// All other bits are reserved and must be set to 0.
enum EFI_ACPI_4_0_S4BIOS_F = BIT0;
enum EFI_ACPI_4_0_64BIT_WAKE_SUPPORTED_F = BIT1;
/// OSPM Enabled Firmware Control Structure Flags
/// All other bits are reserved and must be set to 0.
enum EFI_ACPI_4_0_OSPM_64BIT_WAKE__F = BIT0;
enum EFI_ACPI_4_0_DIFFERENTIATED_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x02;
enum EFI_ACPI_4_0_SECONDARY_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x02;
/// Multiple APIC Description Table header definition.  The rest of the table
/// must be defined in a platform specific manner.
struct EFI_ACPI_4_0_MULTIPLE_APIC_DESCRIPTION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 LocalApicAddress;
    UINT32 Flags;
}
/// MADT Revision (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_MULTIPLE_APIC_DESCRIPTION_TABLE_REVISION = 0x03;
/// Multiple APIC Flags
/// All other bits are reserved and must be set to 0.
enum EFI_ACPI_4_0_PCAT_COMPAT = BIT0;
enum EFI_ACPI_4_0_PROCESSOR_LOCAL_APIC = 0x00;
enum EFI_ACPI_4_0_IO_APIC = 0x01;
enum EFI_ACPI_4_0_INTERRUPT_SOURCE_OVERRIDE = 0x02;
enum EFI_ACPI_4_0_NON_MASKABLE_INTERRUPT_SOURCE = 0x03;
enum EFI_ACPI_4_0_LOCAL_APIC_NMI = 0x04;
enum EFI_ACPI_4_0_LOCAL_APIC_ADDRESS_OVERRIDE = 0x05;
enum EFI_ACPI_4_0_IO_SAPIC = 0x06;
enum EFI_ACPI_4_0_LOCAL_SAPIC = 0x07;
enum EFI_ACPI_4_0_PLATFORM_INTERRUPT_SOURCES = 0x08;
enum EFI_ACPI_4_0_PROCESSOR_LOCAL_X2APIC = 0x09;
enum EFI_ACPI_4_0_LOCAL_X2APIC_NMI = 0x0A;
/// Processor Local APIC Structure Definition
struct EFI_ACPI_4_0_PROCESSOR_LOCAL_APIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 AcpiProcessorId;
    UINT8 ApicId;
    UINT32 Flags;
}
/// Local APIC Flags.  All other bits are reserved and must be 0.
enum EFI_ACPI_4_0_LOCAL_APIC_ENABLED = BIT0;
/// IO APIC Structure
struct EFI_ACPI_4_0_IO_APIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 IoApicId;
    UINT8 Reserved;
    UINT32 IoApicAddress;
    UINT32 GlobalSystemInterruptBase;
}
/// Interrupt Source Override Structure
struct EFI_ACPI_4_0_INTERRUPT_SOURCE_OVERRIDE_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 Bus;
    UINT8 Source;
    UINT32 GlobalSystemInterrupt;
    UINT16 Flags;
}
/// Platform Interrupt Sources Structure Definition
struct EFI_ACPI_4_0_PLATFORM_INTERRUPT_APIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Flags;
    UINT8 InterruptType;
    UINT8 ProcessorId;
    UINT8 ProcessorEid;
    UINT8 IoSapicVector;
    UINT32 GlobalSystemInterrupt;
    UINT32 PlatformInterruptSourceFlags;
    UINT8 CpeiProcessorOverride;
    UINT8[31] Reserved;
}

enum EFI_ACPI_4_0_POLARITY = (3 << 0);
enum EFI_ACPI_4_0_TRIGGER_MODE = (3 << 2);
/// Non-Maskable Interrupt Source Structure
struct EFI_ACPI_4_0_NON_MASKABLE_INTERRUPT_SOURCE_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Flags;
    UINT32 GlobalSystemInterrupt;
}
/// Local APIC NMI Structure
struct EFI_ACPI_4_0_LOCAL_APIC_NMI_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 AcpiProcessorId;
    UINT16 Flags;
    UINT8 LocalApicLint;
}
/// Local APIC Address Override Structure
struct EFI_ACPI_4_0_LOCAL_APIC_ADDRESS_OVERRIDE_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Reserved;
    UINT64 LocalApicAddress;
}
/// IO SAPIC Structure
struct EFI_ACPI_4_0_IO_SAPIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 IoApicId;
    UINT8 Reserved;
    UINT32 GlobalSystemInterruptBase;
    UINT64 IoSapicAddress;
}
/// Local SAPIC Structure
/// This struct followed by a null-terminated ASCII string - ACPI Processor UID String
struct EFI_ACPI_4_0_PROCESSOR_LOCAL_SAPIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 AcpiProcessorId;
    UINT8 LocalSapicId;
    UINT8 LocalSapicEid;
    UINT8[3] Reserved;
    UINT32 Flags;
    UINT32 ACPIProcessorUIDValue;
}
/// Platform Interrupt Sources Structure
struct EFI_ACPI_4_0_PLATFORM_INTERRUPT_SOURCES_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Flags;
    UINT8 InterruptType;
    UINT8 ProcessorId;
    UINT8 ProcessorEid;
    UINT8 IoSapicVector;
    UINT32 GlobalSystemInterrupt;
    UINT32 PlatformInterruptSourceFlags;
}
/// Platform Interrupt Source Flags.
/// All other bits are reserved and must be set to 0.
enum EFI_ACPI_4_0_CPEI_PROCESSOR_OVERRIDE = BIT0;
/// Processor Local x2APIC Structure Definition
struct EFI_ACPI_4_0_PROCESSOR_LOCAL_X2APIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8[2] Reserved;
    UINT32 X2ApicId;
    UINT32 Flags;
    UINT32 AcpiProcessorUid;
}
/// Local x2APIC NMI Structure
struct EFI_ACPI_4_0_LOCAL_X2APIC_NMI_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Flags;
    UINT32 AcpiProcessorUid;
    UINT8 LocalX2ApicLint;
    UINT8[3] Reserved;
}
/// Smart Battery Description Table (SBST)
struct EFI_ACPI_4_0_SMART_BATTERY_DESCRIPTION_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 WarningEnergyLevel;
    UINT32 LowEnergyLevel;
    UINT32 CriticalEnergyLevel;
}
/// SBST Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_SMART_BATTERY_DESCRIPTION_TABLE_REVISION = 0x01;
/// Embedded Controller Boot Resources Table (ECDT)
/// The table is followed by a null terminated ASCII string that contains
/// a fully qualified reference to the name space object.
struct EFI_ACPI_4_0_EMBEDDED_CONTROLLER_BOOT_RESOURCES_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE EcControl;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE EcData;
    UINT32 Uid;
    UINT8 GpeBit;
}
/// ECDT Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_EMBEDDED_CONTROLLER_BOOT_RESOURCES_TABLE_REVISION = 0x01;
/// System Resource Affinity Table (SRAT.  The rest of the table
/// must be defined in a platform specific manner.
struct EFI_ACPI_4_0_SYSTEM_RESOURCE_AFFINITY_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 Reserved1; ///< Must be set to 1
    UINT64 Reserved2;
}
/// SRAT Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_SYSTEM_RESOURCE_AFFINITY_TABLE_REVISION = 0x03;
enum EFI_ACPI_4_0_PROCESSOR_LOCAL_APIC_SAPIC_AFFINITY = 0x00;
enum EFI_ACPI_4_0_MEMORY_AFFINITY = 0x01;
enum EFI_ACPI_4_0_PROCESSOR_LOCAL_X2APIC_AFFINITY = 0x02;
/// Processor Local APIC/SAPIC Affinity Structure Definition
struct EFI_ACPI_4_0_PROCESSOR_LOCAL_APIC_SAPIC_AFFINITY_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 ProximityDomain7To0;
    UINT8 ApicId;
    UINT32 Flags;
    UINT8 LocalSapicEid;
    UINT8[3] ProximityDomain31To8;
    UINT32 ClockDomain;
}
/// Local APIC/SAPIC Flags.  All other bits are reserved and must be 0.
enum EFI_ACPI_4_0_PROCESSOR_LOCAL_APIC_SAPIC_ENABLED = (1 << 0);
/// Memory Affinity Structure Definition
struct EFI_ACPI_4_0_MEMORY_AFFINITY_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT32 ProximityDomain;
    UINT16 Reserved1;
    UINT32 AddressBaseLow;
    UINT32 AddressBaseHigh;
    UINT32 LengthLow;
    UINT32 LengthHigh;
    UINT32 Reserved2;
    UINT32 Flags;
    UINT64 Reserved3;
}

enum EFI_ACPI_4_0_MEMORY_ENABLED = (1 << 0);
enum EFI_ACPI_4_0_MEMORY_HOT_PLUGGABLE = (1 << 1);
enum EFI_ACPI_4_0_MEMORY_NONVOLATILE = (1 << 2);
/// Processor Local x2APIC Affinity Structure Definition
struct EFI_ACPI_4_0_PROCESSOR_LOCAL_X2APIC_AFFINITY_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8[2] Reserved1;
    UINT32 ProximityDomain;
    UINT32 X2ApicId;
    UINT32 Flags;
    UINT32 ClockDomain;
    UINT8[4] Reserved2;
}
/// System Locality Distance Information Table (SLIT).
/// The rest of the table is a matrix.
struct EFI_ACPI_4_0_SYSTEM_LOCALITY_DISTANCE_INFORMATION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT64 NumberOfSystemLocalities;
}
/// SLIT Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_SYSTEM_LOCALITY_DISTANCE_INFORMATION_TABLE_REVISION = 0x01;
/// Corrected Platform Error Polling Table (CPEP)
struct EFI_ACPI_4_0_CORRECTED_PLATFORM_ERROR_POLLING_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT8[8] Reserved;
}
/// CPEP Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_CORRECTED_PLATFORM_ERROR_POLLING_TABLE_REVISION = 0x01;
enum EFI_ACPI_4_0_CPEP_PROCESSOR_APIC_SAPIC = 0x00;
/// Corrected Platform Error Polling Processor Structure Definition
struct EFI_ACPI_4_0_CPEP_PROCESSOR_APIC_SAPIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 ProcessorId;
    UINT8 ProcessorEid;
    UINT32 PollingInterval;
}
/// Maximum System Characteristics Table (MSCT)
struct EFI_ACPI_4_0_MAXIMUM_SYSTEM_CHARACTERISTICS_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 OffsetProxDomInfo;
    UINT32 MaximumNumberOfProximityDomains;
    UINT32 MaximumNumberOfClockDomains;
    UINT64 MaximumPhysicalAddress;
}
/// MSCT Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_MAXIMUM_SYSTEM_CHARACTERISTICS_TABLE_REVISION = 0x01;
/// Maximum Proximity Domain Information Structure Definition
struct EFI_ACPI_4_0_MAXIMUM_PROXIMITY_DOMAIN_INFORMATION_STRUCTURE
{
align(1):
    UINT8 Revision;
    UINT8 Length;
    UINT32 ProximityDomainRangeLow;
    UINT32 ProximityDomainRangeHigh;
    UINT32 MaximumProcessorCapacity;
    UINT64 MaximumMemoryCapacity;
}
/// Boot Error Record Table (BERT)
struct EFI_ACPI_4_0_BOOT_ERROR_RECORD_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 BootErrorRegionLength;
    UINT64 BootErrorRegion;
}
/// BERT Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_BOOT_ERROR_RECORD_TABLE_REVISION = 0x01;
/// Boot Error Region Block Status Definition
struct EFI_ACPI_4_0_ERROR_BLOCK_STATUS
{
align(1):
    mixin(bitfields!(UINT32, "UncorrectableErrorValid", 1, UINT32,
        "CorrectableErrorValid", 1, UINT32, "MultipleUncorrectableErrors", 1,
        UINT32, "MultipleCorrectableErrors", 1, UINT32, "ErrorDataEntryCount",
        10, UINT32, "Reserved", 18));
}
/// Boot Error Region Definition
struct EFI_ACPI_4_0_BOOT_ERROR_REGION_STRUCTURE
{
align(1):
    EFI_ACPI_4_0_ERROR_BLOCK_STATUS BlockStatus;
    UINT32 RawDataOffset;
    UINT32 RawDataLength;
    UINT32 DataLength;
    UINT32 ErrorSeverity;
}

enum EFI_ACPI_4_0_ERROR_SEVERITY_CORRECTABLE = 0x00;
enum EFI_ACPI_4_0_ERROR_SEVERITY_FATAL = 0x01;
enum EFI_ACPI_4_0_ERROR_SEVERITY_CORRECTED = 0x02;
enum EFI_ACPI_4_0_ERROR_SEVERITY_NONE = 0x03;
/// Generic Error Data Entry Definition
struct EFI_ACPI_4_0_GENERIC_ERROR_DATA_ENTRY_STRUCTURE
{
align(1):
    UINT8[16] SectionType;
    UINT32 ErrorSeverity;
    UINT16 Revision;
    UINT8 ValidationBits;
    UINT8 Flags;
    UINT32 ErrorDataLength;
    UINT8[16] FruId;
    UINT8[20] FruText;
}
/// Generic Error Data Entry Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_GENERIC_ERROR_DATA_ENTRY_REVISION = 0x0201;
/// HEST - Hardware Error Source Table
struct EFI_ACPI_4_0_HARDWARE_ERROR_SOURCE_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 ErrorSourceCount;
}
/// HEST Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_HARDWARE_ERROR_SOURCE_TABLE_REVISION = 0x01;
enum EFI_ACPI_4_0_IA32_ARCHITECTURE_MACHINE_CHECK_EXCEPTION = 0x00;
enum EFI_ACPI_4_0_IA32_ARCHITECTURE_CORRECTED_MACHINE_CHECK = 0x01;
enum EFI_ACPI_4_0_IA32_ARCHITECTURE_NMI_ERROR = 0x02;
enum EFI_ACPI_4_0_PCI_EXPRESS_ROOT_PORT_AER = 0x06;
enum EFI_ACPI_4_0_PCI_EXPRESS_DEVICE_AER = 0x07;
enum EFI_ACPI_4_0_PCI_EXPRESS_BRIDGE_AER = 0x08;
enum EFI_ACPI_4_0_GENERIC_HARDWARE_ERROR = 0x09;
enum EFI_ACPI_4_0_ERROR_SOURCE_FLAG_FIRMWARE_FIRST = (1 << 0);
enum EFI_ACPI_4_0_ERROR_SOURCE_FLAG_GLOBAL = (1 << 1);
/// IA-32 Architecture Machine Check Exception Structure Definition
struct EFI_ACPI_4_0_IA32_ARCHITECTURE_MACHINE_CHECK_EXCEPTION_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT8[2] Reserved0;
    UINT8 Flags;
    UINT8 Enabled;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    UINT64 GlobalCapabilityInitData;
    UINT64 GlobalControlInitData;
    UINT8 NumberOfHardwareBanks;
    UINT8[7] Reserved1;
}
/// IA-32 Architecture Machine Check Bank Structure Definition
struct EFI_ACPI_4_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_BANK_STRUCTURE
{
align(1):
    UINT8 BankNumber;
    UINT8 ClearStatusOnInitialization;
    UINT8 StatusDataFormat;
    UINT8 Reserved0;
    UINT32 ControlRegisterMsrAddress;
    UINT64 ControlInitData;
    UINT32 StatusRegisterMsrAddress;
    UINT32 AddressRegisterMsrAddress;
    UINT32 MiscRegisterMsrAddress;
}
/// IA-32 Architecture Machine Check Bank Structure MCA data format
enum EFI_ACPI_4_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_DATA_FORMAT_IA32 = 0x00;
enum EFI_ACPI_4_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_DATA_FORMAT_INTEL64 = 0x01;
enum EFI_ACPI_4_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_DATA_FORMAT_AMD64 = 0x02;
enum EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_POLLED = 0x00;
enum EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_EXTERNAL_INTERRUPT = 0x01;
enum EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_LOCAL_INTERRUPT = 0x02;
enum EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_SCI = 0x03;
enum EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_NMI = 0x04;
/// Hardware Error Notification Configuration Write Enable Structure Definition
struct EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_CONFIGURATION_WRITE_ENABLE_STRUCTURE
{
align(1):
    mixin(bitfields!(UINT16, "Type", 1, UINT16, "PollInterval", 1, UINT16,
        "SwitchToPollingThresholdValue", 1, UINT16,
        "SwitchToPollingThresholdWindow", 1, UINT16, "ErrorThresholdValue", 1,
        UINT16, "ErrorThresholdWindow", 1, UINT16, "Reserved", 10));
}
/// Hardware Error Notification Structure Definition
struct EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_CONFIGURATION_WRITE_ENABLE_STRUCTURE ConfigurationWriteEnable;
    UINT32 PollInterval;
    UINT32 Vector;
    UINT32 SwitchToPollingThresholdValue;
    UINT32 SwitchToPollingThresholdWindow;
    UINT32 ErrorThresholdValue;
    UINT32 ErrorThresholdWindow;
}
/// IA-32 Architecture Corrected Machine Check Structure Definition
struct EFI_ACPI_4_0_IA32_ARCHITECTURE_CORRECTED_MACHINE_CHECK_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT8[2] Reserved0;
    UINT8 Flags;
    UINT8 Enabled;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_STRUCTURE NotificationStructure;
    UINT8 NumberOfHardwareBanks;
    UINT8[3] Reserved1;
}
/// IA-32 Architecture NMI Error Structure Definition
struct EFI_ACPI_4_0_IA32_ARCHITECTURE_NMI_ERROR_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT8[2] Reserved0;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    UINT32 MaxRawDataLength;
}
/// PCI Express Root Port AER Structure Definition
struct EFI_ACPI_4_0_PCI_EXPRESS_ROOT_PORT_AER_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT8[2] Reserved0;
    UINT8 Flags;
    UINT8 Enabled;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    UINT32 Bus;
    UINT16 Device;
    UINT16 Function;
    UINT16 DeviceControl;
    UINT8[2] Reserved1;
    UINT32 UncorrectableErrorMask;
    UINT32 UncorrectableErrorSeverity;
    UINT32 CorrectableErrorMask;
    UINT32 AdvancedErrorCapabilitiesAndControl;
    UINT32 RootErrorCommand;
}
/// PCI Express Device AER Structure Definition
struct EFI_ACPI_4_0_PCI_EXPRESS_DEVICE_AER_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT8[2] Reserved0;
    UINT8 Flags;
    UINT8 Enabled;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    UINT32 Bus;
    UINT16 Device;
    UINT16 Function;
    UINT16 DeviceControl;
    UINT8[2] Reserved1;
    UINT32 UncorrectableErrorMask;
    UINT32 UncorrectableErrorSeverity;
    UINT32 CorrectableErrorMask;
    UINT32 AdvancedErrorCapabilitiesAndControl;
}
/// PCI Express Bridge AER Structure Definition
struct EFI_ACPI_4_0_PCI_EXPRESS_BRIDGE_AER_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT8[2] Reserved0;
    UINT8 Flags;
    UINT8 Enabled;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    UINT32 Bus;
    UINT16 Device;
    UINT16 Function;
    UINT16 DeviceControl;
    UINT8[2] Reserved1;
    UINT32 UncorrectableErrorMask;
    UINT32 UncorrectableErrorSeverity;
    UINT32 CorrectableErrorMask;
    UINT32 AdvancedErrorCapabilitiesAndControl;
    UINT32 SecondaryUncorrectableErrorMask;
    UINT32 SecondaryUncorrectableErrorSeverity;
    UINT32 SecondaryAdvancedErrorCapabilitiesAndControl;
}
/// Generic Hardware Error Source Structure Definition
struct EFI_ACPI_4_0_GENERIC_HARDWARE_ERROR_SOURCE_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT16 RelatedSourceId;
    UINT8 Flags;
    UINT8 Enabled;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    UINT32 MaxRawDataLength;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE ErrorStatusAddress;
    EFI_ACPI_4_0_HARDWARE_ERROR_NOTIFICATION_STRUCTURE NotificationStructure;
    UINT32 ErrorStatusBlockLength;
}
/// Generic Error Status Definition
struct EFI_ACPI_4_0_GENERIC_ERROR_STATUS_STRUCTURE
{
align(1):
    EFI_ACPI_4_0_ERROR_BLOCK_STATUS BlockStatus;
    UINT32 RawDataOffset;
    UINT32 RawDataLength;
    UINT32 DataLength;
    UINT32 ErrorSeverity;
}
/// ERST - Error Record Serialization Table
struct EFI_ACPI_4_0_ERROR_RECORD_SERIALIZATION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 SerializationHeaderSize;
    UINT8[4] Reserved0;
    UINT32 InstructionEntryCount;
}
/// ERST Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_ERROR_RECORD_SERIALIZATION_TABLE_REVISION = 0x01;
/// ERST Serialization Actions
enum EFI_ACPI_4_0_ERST_BEGIN_WRITE_OPERATION = 0x00;
enum EFI_ACPI_4_0_ERST_BEGIN_READ_OPERATION = 0x01;
enum EFI_ACPI_4_0_ERST_BEGIN_CLEAR_OPERATION = 0x02;
enum EFI_ACPI_4_0_ERST_END_OPERATION = 0x03;
enum EFI_ACPI_4_0_ERST_SET_RECORD_OFFSET = 0x04;
enum EFI_ACPI_4_0_ERST_EXECUTE_OPERATION = 0x05;
enum EFI_ACPI_4_0_ERST_CHECK_BUSY_STATUS = 0x06;
enum EFI_ACPI_4_0_ERST_GET_COMMAND_STATUS = 0x07;
enum EFI_ACPI_4_0_ERST_GET_RECORD_IDENTIFIER = 0x08;
enum EFI_ACPI_4_0_ERST_SET_RECORD_IDENTIFIER = 0x09;
enum EFI_ACPI_4_0_ERST_GET_RECORD_COUNT = 0x0A;
enum EFI_ACPI_4_0_ERST_BEGIN_DUMMY_WRITE_OPERATION = 0x0B;
enum EFI_ACPI_4_0_ERST_GET_ERROR_LOG_ADDRESS_RANGE = 0x0D;
enum EFI_ACPI_4_0_ERST_GET_ERROR_LOG_ADDRESS_RANGE_LENGTH = 0x0E;
enum EFI_ACPI_4_0_ERST_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES = 0x0F;
/// ERST Action Command Status
//enum EFI_ACPI_4_0_EINJ_STATUS_SUCCESS = 0x00;
enum EFI_ACPI_4_0_EINJ_STATUS_NOT_ENOUGH_SPACE = 0x01;
enum EFI_ACPI_4_0_EINJ_STATUS_HARDWARE_NOT_AVAILABLE = 0x02;
enum EFI_ACPI_4_0_EINJ_STATUS_FAILED = 0x03;
enum EFI_ACPI_4_0_EINJ_STATUS_RECORD_STORE_EMPTY = 0x04;
enum EFI_ACPI_4_0_EINJ_STATUS_RECORD_NOT_FOUND = 0x05;
/// ERST Serialization Instructions
enum EFI_ACPI_4_0_ERST_READ_REGISTER = 0x00;
enum EFI_ACPI_4_0_ERST_READ_REGISTER_VALUE = 0x01;
enum EFI_ACPI_4_0_ERST_WRITE_REGISTER = 0x02;
enum EFI_ACPI_4_0_ERST_WRITE_REGISTER_VALUE = 0x03;
enum EFI_ACPI_4_0_ERST_NOOP = 0x04;
enum EFI_ACPI_4_0_ERST_LOAD_VAR1 = 0x05;
enum EFI_ACPI_4_0_ERST_LOAD_VAR2 = 0x06;
enum EFI_ACPI_4_0_ERST_STORE_VAR1 = 0x07;
enum EFI_ACPI_4_0_ERST_ADD = 0x08;
enum EFI_ACPI_4_0_ERST_SUBTRACT = 0x09;
enum EFI_ACPI_4_0_ERST_ADD_VALUE = 0x0A;
enum EFI_ACPI_4_0_ERST_SUBTRACT_VALUE = 0x0B;
enum EFI_ACPI_4_0_ERST_STALL = 0x0C;
enum EFI_ACPI_4_0_ERST_STALL_WHILE_TRUE = 0x0D;
enum EFI_ACPI_4_0_ERST_SKIP_NEXT_INSTRUCTION_IF_TRUE = 0x0E;
enum EFI_ACPI_4_0_ERST_GOTO = 0x0F;
enum EFI_ACPI_4_0_ERST_SET_SRC_ADDRESS_BASE = 0x10;
enum EFI_ACPI_4_0_ERST_SET_DST_ADDRESS_BASE = 0x11;
enum EFI_ACPI_4_0_ERST_MOVE_DATA = 0x12;
/// ERST Instruction Flags
enum EFI_ACPI_4_0_ERST_PRESERVE_REGISTER = 0x01;
/// ERST Serialization Instruction Entry
struct EFI_ACPI_4_0_ERST_SERIALIZATION_INSTRUCTION_ENTRY
{
align(1):
    UINT8 SerializationAction;
    UINT8 Instruction;
    UINT8 Flags;
    UINT8 Reserved0;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE RegisterRegion;
    UINT64 Value;
    UINT64 Mask;
}
/// EINJ - Error Injection Table
struct EFI_ACPI_4_0_ERROR_INJECTION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 InjectionHeaderSize;
    UINT8 InjectionFlags;
    UINT8[3] Reserved0;
    UINT32 InjectionEntryCount;
}
/// EINJ Version (as defined in ACPI 4.0 spec.)
enum EFI_ACPI_4_0_ERROR_INJECTION_TABLE_REVISION = 0x01;
/// EINJ Error Injection Actions
enum EFI_ACPI_4_0_EINJ_BEGIN_INJECTION_OPERATION = 0x00;
enum EFI_ACPI_4_0_EINJ_GET_TRIGGER_ERROR_ACTION_TABLE = 0x01;
enum EFI_ACPI_4_0_EINJ_SET_ERROR_TYPE = 0x02;
enum EFI_ACPI_4_0_EINJ_GET_ERROR_TYPE = 0x03;
enum EFI_ACPI_4_0_EINJ_END_OPERATION = 0x04;
enum EFI_ACPI_4_0_EINJ_EXECUTE_OPERATION = 0x05;
enum EFI_ACPI_4_0_EINJ_CHECK_BUSY_STATUS = 0x06;
enum EFI_ACPI_4_0_EINJ_GET_COMMAND_STATUS = 0x07;
enum EFI_ACPI_4_0_EINJ_TRIGGER_ERROR = 0xFF;
/// EINJ Action Command Status
enum EFI_ACPI_4_0_EINJ_STATUS_SUCCESS = 0x00;
enum EFI_ACPI_4_0_EINJ_STATUS_UNKNOWN_FAILURE = 0x01;
enum EFI_ACPI_4_0_EINJ_STATUS_INVALID_ACCESS = 0x02;
/// EINJ Error Type Definition
enum EFI_ACPI_4_0_EINJ_ERROR_PROCESSOR_CORRECTABLE = (1 << 0);
enum EFI_ACPI_4_0_EINJ_ERROR_PROCESSOR_UNCORRECTABLE_NONFATAL = (1 << 1);
enum EFI_ACPI_4_0_EINJ_ERROR_PROCESSOR_UNCORRECTABLE_FATAL = (1 << 2);
enum EFI_ACPI_4_0_EINJ_ERROR_MEMORY_CORRECTABLE = (1 << 3);
enum EFI_ACPI_4_0_EINJ_ERROR_MEMORY_UNCORRECTABLE_NONFATAL = (1 << 4);
enum EFI_ACPI_4_0_EINJ_ERROR_MEMORY_UNCORRECTABLE_FATAL = (1 << 5);
enum EFI_ACPI_4_0_EINJ_ERROR_PCI_EXPRESS_CORRECTABLE = (1 << 6);
enum EFI_ACPI_4_0_EINJ_ERROR_PCI_EXPRESS_UNCORRECTABLE_NONFATAL = (1 << 7);
enum EFI_ACPI_4_0_EINJ_ERROR_PCI_EXPRESS_UNCORRECTABLE_FATAL = (1 << 8);
enum EFI_ACPI_4_0_EINJ_ERROR_PLATFORM_CORRECTABLE = (1 << 9);
enum EFI_ACPI_4_0_EINJ_ERROR_PLATFORM_UNCORRECTABLE_NONFATAL = (1 << 10);
enum EFI_ACPI_4_0_EINJ_ERROR_PLATFORM_UNCORRECTABLE_FATAL = (1 << 11);
/// EINJ Injection Instructions
enum EFI_ACPI_4_0_EINJ_READ_REGISTER = 0x00;
enum EFI_ACPI_4_0_EINJ_READ_REGISTER_VALUE = 0x01;
enum EFI_ACPI_4_0_EINJ_WRITE_REGISTER = 0x02;
enum EFI_ACPI_4_0_EINJ_WRITE_REGISTER_VALUE = 0x03;
enum EFI_ACPI_4_0_EINJ_NOOP = 0x04;
/// EINJ Instruction Flags
enum EFI_ACPI_4_0_EINJ_PRESERVE_REGISTER = 0x01;
/// EINJ Injection Instruction Entry
struct EFI_ACPI_4_0_EINJ_INJECTION_INSTRUCTION_ENTRY
{
align(1):
    UINT8 InjectionAction;
    UINT8 Instruction;
    UINT8 Flags;
    UINT8 Reserved0;
    EFI_ACPI_4_0_GENERIC_ADDRESS_STRUCTURE RegisterRegion;
    UINT64 Value;
    UINT64 Mask;
}
/// EINJ Trigger Action Table
struct EFI_ACPI_4_0_EINJ_TRIGGER_ACTION_TABLE
{
align(1):
    UINT32 HeaderSize;
    UINT32 Revision;
    UINT32 TableSize;
    UINT32 EntryCount;
}
/// "RSD PTR " Root System Description Pointer
enum EFI_ACPI_4_0_ROOT_SYSTEM_DESCRIPTION_POINTER_SIGNATURE = SIGNATURE_64('R',
        'S', 'D', ' ', 'P', 'T', 'R', ' ');
/// "APIC" Multiple APIC Description Table
enum EFI_ACPI_4_0_MULTIPLE_APIC_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('A', 'P',
        'I', 'C');
/// "BERT" Boot Error Record Table
enum EFI_ACPI_4_0_BOOT_ERROR_RECORD_TABLE_SIGNATURE = SIGNATURE_32('B', 'E', 'R', 'T');
/// "CPEP" Corrected Platform Error Polling Table
enum EFI_ACPI_4_0_CORRECTED_PLATFORM_ERROR_POLLING_TABLE_SIGNATURE = SIGNATURE_32(
        'C', 'P', 'E', 'P');
/// "DSDT" Differentiated System Description Table
enum EFI_ACPI_4_0_DIFFERENTIATED_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32(
        'D', 'S', 'D', 'T');
/// "ECDT" Embedded Controller Boot Resources Table
enum EFI_ACPI_4_0_EMBEDDED_CONTROLLER_BOOT_RESOURCES_TABLE_SIGNATURE = SIGNATURE_32(
        'E', 'C', 'D', 'T');
/// "EINJ" Error Injection Table
enum EFI_ACPI_4_0_ERROR_INJECTION_TABLE_SIGNATURE = SIGNATURE_32('E', 'I', 'N', 'J');
/// "ERST" Error Record Serialization Table
enum EFI_ACPI_4_0_ERROR_RECORD_SERIALIZATION_TABLE_SIGNATURE = SIGNATURE_32('E', 'R',
        'S', 'T');
/// "FACP" Fixed ACPI Description Table
enum EFI_ACPI_4_0_FIXED_ACPI_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('F', 'A', 'C',
        'P');
/// "FACS" Firmware ACPI Control Structure
enum EFI_ACPI_4_0_FIRMWARE_ACPI_CONTROL_STRUCTURE_SIGNATURE = SIGNATURE_32('F', 'A',
        'C', 'S');
/// "HEST" Hardware Error Source Table
enum EFI_ACPI_4_0_HARDWARE_ERROR_SOURCE_TABLE_SIGNATURE = SIGNATURE_32('H', 'E', 'S',
        'T');
/// "MSCT" Maximum System Characteristics Table
enum EFI_ACPI_4_0_MAXIMUM_SYSTEM_CHARACTERISTICS_TABLE_SIGNATURE = SIGNATURE_32('M',
        'S', 'C', 'T');
/// "PSDT" Persistent System Description Table
enum EFI_ACPI_4_0_PERSISTENT_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('P',
        'S', 'D', 'T');
/// "RSDT" Root System Description Table
enum EFI_ACPI_4_0_ROOT_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('R', 'S',
        'D', 'T');
/// "SBST" Smart Battery Specification Table
enum EFI_ACPI_4_0_SMART_BATTERY_SPECIFICATION_TABLE_SIGNATURE = SIGNATURE_32('S', 'B',
        'S', 'T');
/// "SLIT" System Locality Information Table
enum EFI_ACPI_4_0_SYSTEM_LOCALITY_INFORMATION_TABLE_SIGNATURE = SIGNATURE_32('S', 'L',
        'I', 'T');
/// "SRAT" System Resource Affinity Table
enum EFI_ACPI_4_0_SYSTEM_RESOURCE_AFFINITY_TABLE_SIGNATURE = SIGNATURE_32('S', 'R',
        'A', 'T');
/// "SSDT" Secondary System Description Table
enum EFI_ACPI_4_0_SECONDARY_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('S',
        'S', 'D', 'T');
/// "XSDT" Extended System Description Table
enum EFI_ACPI_4_0_EXTENDED_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('X', 'S',
        'D', 'T');
/// "BOOT" MS Simple Boot Spec
enum EFI_ACPI_4_0_SIMPLE_BOOT_FLAG_TABLE_SIGNATURE = SIGNATURE_32('B', 'O', 'O', 'T');
/// "DBGP" MS Debug Port Spec
enum EFI_ACPI_4_0_DEBUG_PORT_TABLE_SIGNATURE = SIGNATURE_32('D', 'B', 'G', 'P');
/// "DMAR" DMA Remapping Table
enum EFI_ACPI_4_0_DMA_REMAPPING_TABLE_SIGNATURE = SIGNATURE_32('D', 'M', 'A', 'R');
/// "ETDT" Event Timer Description Table
enum EFI_ACPI_4_0_EVENT_TIMER_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('E', 'T',
        'D', 'T');
/// "HPET" IA-PC High Precision Event Timer Table
enum EFI_ACPI_4_0_HIGH_PRECISION_EVENT_TIMER_TABLE_SIGNATURE = SIGNATURE_32('H', 'P',
        'E', 'T');
/// "iBFT" iSCSI Boot Firmware Table
enum EFI_ACPI_4_0_ISCSI_BOOT_FIRMWARE_TABLE_SIGNATURE = SIGNATURE_32('i', 'B', 'F',
        'T');
/// "IVRS" I/O Virtualization Reporting Structure
enum EFI_ACPI_4_0_IO_VIRTUALIZATION_REPORTING_STRUCTURE_SIGNATURE = SIGNATURE_32('I',
        'V', 'R', 'S');
/// "MCFG" PCI Express Memory Mapped Configuration Space Base Address Description Table
enum EFI_ACPI_4_0_PCI_EXPRESS_MEMORY_MAPPED_CONFIGURATION_SPACE_BASE_ADDRESS_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32(
        'M', 'C', 'F', 'G');
/// "MCHI" Management Controller Host Interface Table
enum EFI_ACPI_4_0_MANAGEMENT_CONTROLLER_HOST_INTERFACE_TABLE_SIGNATURE = SIGNATURE_32(
        'M', 'C', 'H', 'I');
/// "SPCR" Serial Port Concole Redirection Table
enum EFI_ACPI_4_0_SERIAL_PORT_CONSOLE_REDIRECTION_TABLE_SIGNATURE = SIGNATURE_32('S',
        'P', 'C', 'R');
/// "SPMI" Server Platform Management Interface Table
enum EFI_ACPI_4_0_SERVER_PLATFORM_MANAGEMENT_INTERFACE_TABLE_SIGNATURE = SIGNATURE_32(
        'S', 'P', 'M', 'I');
/// "TCPA" Trusted Computing Platform Alliance Capabilities Table
enum EFI_ACPI_4_0_TRUSTED_COMPUTING_PLATFORM_ALLIANCE_CAPABILITIES_TABLE_SIGNATURE = SIGNATURE_32(
        'T', 'C', 'P', 'A');
/// "UEFI" UEFI ACPI Data Table
enum EFI_ACPI_4_0_UEFI_ACPI_DATA_TABLE_SIGNATURE = SIGNATURE_32('U', 'E', 'F', 'I');
/// "WAET" Windows ACPI Enlightenment Table
enum EFI_ACPI_4_0_WINDOWS_ACPI_ENLIGHTENMENT_TABLE_SIGNATURE = SIGNATURE_32('W', 'A',
        'E', 'T');
/// "WDAT" Watchdog Action Table
enum EFI_ACPI_4_0_WATCHDOG_ACTION_TABLE_SIGNATURE = SIGNATURE_32('W', 'D', 'A', 'T');
/// "WDRT" Watchdog Resource Table
enum EFI_ACPI_4_0_WATCHDOG_RESOURCE_TABLE_SIGNATURE = SIGNATURE_32('W', 'D', 'R', 'T');
