/**
	Based on IndustryStandard/Acpi50.h, original notice:

	ACPI 5.0 definitions from the ACPI Specification Revision 5.0a November 13, 2013.
	
	Copyright (c) 2014 Hewlett-Packard Development Company, L.P.
	Copyright (c) 2011 - 2014, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
**/
module uefi.acpi50;
import uefi.base;
import uefi.base_type;
import uefi.acpiaml;
import uefi.acpi10;
import uefi.acpi20;
import uefi.acpi30;
import uefi.acpi40;

public:
extern (C):
// FIXME: INCLUDE <IndustryStandard/Acpi40.h>
enum ACPI_SMALL_FIXED_DMA_DESCRIPTOR_NAME = 0x0A;
enum ACPI_LARGE_GPIO_CONNECTION_DESCRIPTOR_NAME = 0x0C;
enum ACPI_LARGE_GENERIC_SERIAL_BUS_CONNECTION_DESCRIPTOR_NAME = 0x0E;
enum ACPI_FIXED_DMA_DESCRIPTOR = 0x55;
enum ACPI_GPIO_CONNECTION_DESCRIPTOR = 0x8C;
enum ACPI_GENERIC_SERIAL_BUS_CONNECTION_DESCRIPTOR = 0x8E;
/// Generic DMA Descriptor.
struct EFI_ACPI_FIXED_DMA_DESCRIPTOR
{
align(1):
    ACPI_SMALL_RESOURCE_HEADER Header;
    UINT16 DmaRequestLine;
    UINT16 DmaChannel;
    UINT8 DmaTransferWidth;
}
/// GPIO Connection Descriptor
struct EFI_ACPI_GPIO_CONNECTION_DESCRIPTOR
{
align(1):
    ACPI_LARGE_RESOURCE_HEADER Header;
    UINT8 RevisionId;
    UINT8 ConnectionType;
    UINT16 GeneralFlags;
    UINT16 InterruptFlags;
    UINT8 PinConfiguration;
    UINT16 OutputDriveStrength;
    UINT16 DebounceTimeout;
    UINT16 PinTableOffset;
    UINT8 ResourceSourceIndex;
    UINT16 ResourceSourceNameOffset;
    UINT16 VendorDataOffset;
    UINT16 VendorDataLength;
}

enum EFI_ACPI_GPIO_CONNECTION_TYPE_INTERRUPT = 0x0;
enum EFI_ACPI_GPIO_CONNECTION_TYPE_IO = 0x1;
/// Serial Bus Resource Descriptor (Generic)
struct EFI_ACPI_SERIAL_BUS_RESOURCE_DESCRIPTOR
{
align(1):
    ACPI_LARGE_RESOURCE_HEADER Header;
    UINT8 RevisionId;
    UINT8 ResourceSourceIndex;
    UINT8 SerialBusType;
    UINT8 GeneralFlags;
    UINT16 TypeSpecificFlags;
    UINT8 TypeSpecificRevisionId;
    UINT16 TypeDataLength;
    // Type specific data
}

enum EFI_ACPI_SERIAL_BUS_RESOURCE_TYPE_I2C = 0x1;
enum EFI_ACPI_SERIAL_BUS_RESOURCE_TYPE_SPI = 0x2;
enum EFI_ACPI_SERIAL_BUS_RESOURCE_TYPE_UART = 0x3;
/// Serial Bus Resource Descriptor (I2C)
struct EFI_ACPI_SERIAL_BUS_RESOURCE_I2C_DESCRIPTOR
{
align(1):
    ACPI_LARGE_RESOURCE_HEADER Header;
    UINT8 RevisionId;
    UINT8 ResourceSourceIndex;
    UINT8 SerialBusType;
    UINT8 GeneralFlags;
    UINT16 TypeSpecificFlags;
    UINT8 TypeSpecificRevisionId;
    UINT16 TypeDataLength;
    UINT32 ConnectionSpeed;
    UINT16 SlaveAddress;
}
/// Serial Bus Resource Descriptor (SPI)
struct EFI_ACPI_SERIAL_BUS_RESOURCE_SPI_DESCRIPTOR
{
align(1):
    ACPI_LARGE_RESOURCE_HEADER Header;
    UINT8 RevisionId;
    UINT8 ResourceSourceIndex;
    UINT8 SerialBusType;
    UINT8 GeneralFlags;
    UINT16 TypeSpecificFlags;
    UINT8 TypeSpecificRevisionId;
    UINT16 TypeDataLength;
    UINT32 ConnectionSpeed;
    UINT8 DataBitLength;
    UINT8 Phase;
    UINT8 Polarity;
    UINT16 DeviceSelection;
}
/// Serial Bus Resource Descriptor (UART)
struct EFI_ACPI_SERIAL_BUS_RESOURCE_UART_DESCRIPTOR
{
align(1):
    ACPI_LARGE_RESOURCE_HEADER Header;
    UINT8 RevisionId;
    UINT8 ResourceSourceIndex;
    UINT8 SerialBusType;
    UINT8 GeneralFlags;
    UINT16 TypeSpecificFlags;
    UINT8 TypeSpecificRevisionId;
    UINT16 TypeDataLength;
    UINT32 DefaultBaudRate;
    UINT16 RxFIFO;
    UINT16 TxFIFO;
    UINT8 Parity;
    UINT8 SerialLinesEnabled;
}
/// ACPI 5.0 Generic Address Space definition
struct EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE
{
align(1):
    UINT8 AddressSpaceId;
    UINT8 RegisterBitWidth;
    UINT8 RegisterBitOffset;
    UINT8 AccessSize;
    UINT64 Address;
}

enum EFI_ACPI_5_0_SYSTEM_MEMORY = 0;
enum EFI_ACPI_5_0_SYSTEM_IO = 1;
enum EFI_ACPI_5_0_PCI_CONFIGURATION_SPACE = 2;
enum EFI_ACPI_5_0_EMBEDDED_CONTROLLER = 3;
enum EFI_ACPI_5_0_SMBUS = 4;
enum EFI_ACPI_5_0_PLATFORM_COMMUNICATION_CHANNEL = 0x0A;
enum EFI_ACPI_5_0_FUNCTIONAL_FIXED_HARDWARE = 0x7F;
enum EFI_ACPI_5_0_UNDEFINED = 0;
enum EFI_ACPI_5_0_BYTE = 1;
enum EFI_ACPI_5_0_WORD = 2;
enum EFI_ACPI_5_0_DWORD = 3;
enum EFI_ACPI_5_0_QWORD = 4;
/// Root System Description Pointer Structure
struct EFI_ACPI_5_0_ROOT_SYSTEM_DESCRIPTION_POINTER
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
/// RSD_PTR Revision (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_ROOT_SYSTEM_DESCRIPTION_POINTER_REVISION = 0x02; ///< ACPISpec (Revision 5.0) says current value is 2 
/// Common table header, this prefaces all ACPI tables, including FACS, but
/// excluding the RSD PTR structure
struct EFI_ACPI_5_0_COMMON_HEADER
{
align(1):
    UINT32 Signature;
    UINT32 Length;
}
/// RSDT Revision (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_ROOT_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x01;
/// XSDT Revision (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_EXTENDED_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x01;
/// Fixed ACPI Description Table Structure (FADT)
struct EFI_ACPI_5_0_FIXED_ACPI_DESCRIPTION_TABLE
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
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE ResetReg;
    UINT8 ResetValue;
    UINT8[3] Reserved2;
    UINT64 XFirmwareCtrl;
    UINT64 XDsdt;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XPm1aEvtBlk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XPm1bEvtBlk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XPm1aCntBlk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XPm1bCntBlk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XPm2CntBlk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XPmTmrBlk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XGpe0Blk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE XGpe1Blk;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE SleepControlReg;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE SleepStatusReg;
}
/// FADT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_FIXED_ACPI_DESCRIPTION_TABLE_REVISION = 0x05;
enum EFI_ACPI_5_0_PM_PROFILE_UNSPECIFIED = 0;
enum EFI_ACPI_5_0_PM_PROFILE_DESKTOP = 1;
enum EFI_ACPI_5_0_PM_PROFILE_MOBILE = 2;
enum EFI_ACPI_5_0_PM_PROFILE_WORKSTATION = 3;
enum EFI_ACPI_5_0_PM_PROFILE_ENTERPRISE_SERVER = 4;
enum EFI_ACPI_5_0_PM_PROFILE_SOHO_SERVER = 5;
enum EFI_ACPI_5_0_PM_PROFILE_APPLIANCE_PC = 6;
enum EFI_ACPI_5_0_PM_PROFILE_PERFORMANCE_SERVER = 7;
enum EFI_ACPI_5_0_PM_PROFILE_TABLET = 8;
enum EFI_ACPI_5_0_LEGACY_DEVICES = BIT0;
enum EFI_ACPI_5_0_8042 = BIT1;
enum EFI_ACPI_5_0_VGA_NOT_PRESENT = BIT2;
enum EFI_ACPI_5_0_MSI_NOT_SUPPORTED = BIT3;
enum EFI_ACPI_5_0_PCIE_ASPM_CONTROLS = BIT4;
enum EFI_ACPI_5_0_CMOS_RTC_NOT_PRESENT = BIT5;
enum EFI_ACPI_5_0_WBINVD = BIT0;
enum EFI_ACPI_5_0_WBINVD_FLUSH = BIT1;
enum EFI_ACPI_5_0_PROC_C1 = BIT2;
enum EFI_ACPI_5_0_P_LVL2_UP = BIT3;
enum EFI_ACPI_5_0_PWR_BUTTON = BIT4;
enum EFI_ACPI_5_0_SLP_BUTTON = BIT5;
enum EFI_ACPI_5_0_FIX_RTC = BIT6;
enum EFI_ACPI_5_0_RTC_S4 = BIT7;
enum EFI_ACPI_5_0_TMR_VAL_EXT = BIT8;
enum EFI_ACPI_5_0_DCK_CAP = BIT9;
enum EFI_ACPI_5_0_RESET_REG_SUP = BIT10;
enum EFI_ACPI_5_0_SEALED_CASE = BIT11;
enum EFI_ACPI_5_0_HEADLESS = BIT12;
enum EFI_ACPI_5_0_CPU_SW_SLP = BIT13;
enum EFI_ACPI_5_0_PCI_EXP_WAK = BIT14;
enum EFI_ACPI_5_0_USE_PLATFORM_CLOCK = BIT15;
enum EFI_ACPI_5_0_S4_RTC_STS_VALID = BIT16;
enum EFI_ACPI_5_0_REMOTE_POWER_ON_CAPABLE = BIT17;
enum EFI_ACPI_5_0_FORCE_APIC_CLUSTER_MODEL = BIT18;
enum EFI_ACPI_5_0_FORCE_APIC_PHYSICAL_DESTINATION_MODE = BIT19;
enum EFI_ACPI_5_0_HW_REDUCED_ACPI = BIT20;
enum EFI_ACPI_5_0_LOW_POWER_S0_IDLE_CAPABLE = BIT21;
/// Firmware ACPI Control Structure
struct EFI_ACPI_5_0_FIRMWARE_ACPI_CONTROL_STRUCTURE
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
/// FACS Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_FIRMWARE_ACPI_CONTROL_STRUCTURE_VERSION = 0x02;
/// Firmware Control Structure Feature Flags
/// All other bits are reserved and must be set to 0.
enum EFI_ACPI_5_0_S4BIOS_F = BIT0;
enum EFI_ACPI_5_0_64BIT_WAKE_SUPPORTED_F = BIT1;
/// OSPM Enabled Firmware Control Structure Flags
/// All other bits are reserved and must be set to 0.
enum EFI_ACPI_5_0_OSPM_64BIT_WAKE_F = BIT0;
enum EFI_ACPI_5_0_DIFFERENTIATED_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x02;
enum EFI_ACPI_5_0_SECONDARY_SYSTEM_DESCRIPTION_TABLE_REVISION = 0x02;
/// Multiple APIC Description Table header definition.  The rest of the table
/// must be defined in a platform specific manner.
struct EFI_ACPI_5_0_MULTIPLE_APIC_DESCRIPTION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 LocalApicAddress;
    UINT32 Flags;
}
/// MADT Revision (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_MULTIPLE_APIC_DESCRIPTION_TABLE_REVISION = 0x03;
/// Multiple APIC Flags
/// All other bits are reserved and must be set to 0.
enum EFI_ACPI_5_0_PCAT_COMPAT = BIT0;
enum EFI_ACPI_5_0_PROCESSOR_LOCAL_APIC = 0x00;
enum EFI_ACPI_5_0_IO_APIC = 0x01;
enum EFI_ACPI_5_0_INTERRUPT_SOURCE_OVERRIDE = 0x02;
enum EFI_ACPI_5_0_NON_MASKABLE_INTERRUPT_SOURCE = 0x03;
enum EFI_ACPI_5_0_LOCAL_APIC_NMI = 0x04;
enum EFI_ACPI_5_0_LOCAL_APIC_ADDRESS_OVERRIDE = 0x05;
enum EFI_ACPI_5_0_IO_SAPIC = 0x06;
enum EFI_ACPI_5_0_LOCAL_SAPIC = 0x07;
enum EFI_ACPI_5_0_PLATFORM_INTERRUPT_SOURCES = 0x08;
enum EFI_ACPI_5_0_PROCESSOR_LOCAL_X2APIC = 0x09;
enum EFI_ACPI_5_0_LOCAL_X2APIC_NMI = 0x0A;
enum EFI_ACPI_5_0_GIC = 0x0B;
enum EFI_ACPI_5_0_GICD = 0x0C;
/// Processor Local APIC Structure Definition
struct EFI_ACPI_5_0_PROCESSOR_LOCAL_APIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 AcpiProcessorId;
    UINT8 ApicId;
    UINT32 Flags;
}
/// Local APIC Flags.  All other bits are reserved and must be 0.
enum EFI_ACPI_5_0_LOCAL_APIC_ENABLED = BIT0;
/// IO APIC Structure
struct EFI_ACPI_5_0_IO_APIC_STRUCTURE
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
struct EFI_ACPI_5_0_INTERRUPT_SOURCE_OVERRIDE_STRUCTURE
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
struct EFI_ACPI_5_0_PLATFORM_INTERRUPT_APIC_STRUCTURE
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

enum EFI_ACPI_5_0_POLARITY = (3 << 0);
enum EFI_ACPI_5_0_TRIGGER_MODE = (3 << 2);
/// Non-Maskable Interrupt Source Structure
struct EFI_ACPI_5_0_NON_MASKABLE_INTERRUPT_SOURCE_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Flags;
    UINT32 GlobalSystemInterrupt;
}
/// Local APIC NMI Structure
struct EFI_ACPI_5_0_LOCAL_APIC_NMI_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 AcpiProcessorId;
    UINT16 Flags;
    UINT8 LocalApicLint;
}
/// Local APIC Address Override Structure
struct EFI_ACPI_5_0_LOCAL_APIC_ADDRESS_OVERRIDE_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Reserved;
    UINT64 LocalApicAddress;
}
/// IO SAPIC Structure
struct EFI_ACPI_5_0_IO_SAPIC_STRUCTURE
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
struct EFI_ACPI_5_0_PROCESSOR_LOCAL_SAPIC_STRUCTURE
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
struct EFI_ACPI_5_0_PLATFORM_INTERRUPT_SOURCES_STRUCTURE
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
enum EFI_ACPI_5_0_CPEI_PROCESSOR_OVERRIDE = BIT0;
/// Processor Local x2APIC Structure Definition
struct EFI_ACPI_5_0_PROCESSOR_LOCAL_X2APIC_STRUCTURE
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
struct EFI_ACPI_5_0_LOCAL_X2APIC_NMI_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Flags;
    UINT32 AcpiProcessorUid;
    UINT8 LocalX2ApicLint;
    UINT8[3] Reserved;
}
/// GIC Structure
struct EFI_ACPI_5_0_GIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Reserved;
    UINT32 GicId;
    UINT32 AcpiProcessorUid;
    UINT32 Flags;
    UINT32 ParkingProtocolVersion;
    UINT32 PerformanceInterruptGsiv;
    UINT64 ParkedAddress;
    UINT64 PhysicalBaseAddress;
}
/// GIC Flags.  All other bits are reserved and must be 0.
enum EFI_ACPI_5_0_GIC_ENABLED = BIT0;
enum EFI_ACPI_5_0_PERFORMANCE_INTERRUPT_MODEL = BIT1;
/// GIC Distributor Structure
struct EFI_ACPI_5_0_GIC_DISTRIBUTOR_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT16 Reserved1;
    UINT32 GicId;
    UINT64 PhysicalBaseAddress;
    UINT32 SystemVectorBase;
    UINT32 Reserved2;
}
/// Smart Battery Description Table (SBST)
struct EFI_ACPI_5_0_SMART_BATTERY_DESCRIPTION_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 WarningEnergyLevel;
    UINT32 LowEnergyLevel;
    UINT32 CriticalEnergyLevel;
}
/// SBST Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_SMART_BATTERY_DESCRIPTION_TABLE_REVISION = 0x01;
/// Embedded Controller Boot Resources Table (ECDT)
/// The table is followed by a null terminated ASCII string that contains
/// a fully qualified reference to the name space object.
struct EFI_ACPI_5_0_EMBEDDED_CONTROLLER_BOOT_RESOURCES_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE EcControl;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE EcData;
    UINT32 Uid;
    UINT8 GpeBit;
}
/// ECDT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_EMBEDDED_CONTROLLER_BOOT_RESOURCES_TABLE_REVISION = 0x01;
/// System Resource Affinity Table (SRAT).  The rest of the table
/// must be defined in a platform specific manner.
struct EFI_ACPI_5_0_SYSTEM_RESOURCE_AFFINITY_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 Reserved1; ///< Must be set to 1
    UINT64 Reserved2;
}
/// SRAT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_SYSTEM_RESOURCE_AFFINITY_TABLE_REVISION = 0x03;
enum EFI_ACPI_5_0_PROCESSOR_LOCAL_APIC_SAPIC_AFFINITY = 0x00;
enum EFI_ACPI_5_0_MEMORY_AFFINITY = 0x01;
enum EFI_ACPI_5_0_PROCESSOR_LOCAL_X2APIC_AFFINITY = 0x02;
/// Processor Local APIC/SAPIC Affinity Structure Definition
struct EFI_ACPI_5_0_PROCESSOR_LOCAL_APIC_SAPIC_AFFINITY_STRUCTURE
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
enum EFI_ACPI_5_0_PROCESSOR_LOCAL_APIC_SAPIC_ENABLED = (1 << 0);
/// Memory Affinity Structure Definition
struct EFI_ACPI_5_0_MEMORY_AFFINITY_STRUCTURE
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

enum EFI_ACPI_5_0_MEMORY_ENABLED = (1 << 0);
enum EFI_ACPI_5_0_MEMORY_HOT_PLUGGABLE = (1 << 1);
enum EFI_ACPI_5_0_MEMORY_NONVOLATILE = (1 << 2);
/// Processor Local x2APIC Affinity Structure Definition
struct EFI_ACPI_5_0_PROCESSOR_LOCAL_X2APIC_AFFINITY_STRUCTURE
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
struct EFI_ACPI_5_0_SYSTEM_LOCALITY_DISTANCE_INFORMATION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT64 NumberOfSystemLocalities;
}
/// SLIT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_SYSTEM_LOCALITY_DISTANCE_INFORMATION_TABLE_REVISION = 0x01;
/// Corrected Platform Error Polling Table (CPEP)
struct EFI_ACPI_5_0_CORRECTED_PLATFORM_ERROR_POLLING_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT8[8] Reserved;
}
/// CPEP Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_CORRECTED_PLATFORM_ERROR_POLLING_TABLE_REVISION = 0x01;
enum EFI_ACPI_5_0_CPEP_PROCESSOR_APIC_SAPIC = 0x00;
/// Corrected Platform Error Polling Processor Structure Definition
struct EFI_ACPI_5_0_CPEP_PROCESSOR_APIC_SAPIC_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8 ProcessorId;
    UINT8 ProcessorEid;
    UINT32 PollingInterval;
}
/// Maximum System Characteristics Table (MSCT)
struct EFI_ACPI_5_0_MAXIMUM_SYSTEM_CHARACTERISTICS_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 OffsetProxDomInfo;
    UINT32 MaximumNumberOfProximityDomains;
    UINT32 MaximumNumberOfClockDomains;
    UINT64 MaximumPhysicalAddress;
}
/// MSCT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_MAXIMUM_SYSTEM_CHARACTERISTICS_TABLE_REVISION = 0x01;
/// Maximum Proximity Domain Information Structure Definition
struct EFI_ACPI_5_0_MAXIMUM_PROXIMITY_DOMAIN_INFORMATION_STRUCTURE
{
align(1):
    UINT8 Revision;
    UINT8 Length;
    UINT32 ProximityDomainRangeLow;
    UINT32 ProximityDomainRangeHigh;
    UINT32 MaximumProcessorCapacity;
    UINT64 MaximumMemoryCapacity;
}
/// ACPI RAS Feature Table definition.
struct EFI_ACPI_5_0_RAS_FEATURE_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT8[12] PlatformCommunicationChannelIdentifier;
}
/// RASF Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_RAS_FEATURE_TABLE_REVISION = 0x01;
/// ACPI RASF Platform Communication Channel Shared Memory Region definition.
struct EFI_ACPI_5_0_RASF_PLATFORM_COMMUNICATION_CHANNEL_SHARED_MEMORY_REGION
{
align(1):
    UINT32 Signature;
    UINT16 Command;
    UINT16 Status;
    UINT16 Version;
    UINT8[16] RASCapabilities;
    UINT8[16] SetRASCapabilities;
    UINT16 NumberOfRASFParameterBlocks;
    UINT32 SetRASCapabilitiesStatus;
}
/// ACPI RASF PCC command code
enum EFI_ACPI_5_0_RASF_PCC_COMMAND_CODE_EXECUTE_RASF_COMMAND = 0x01;
/// ACPI RASF Platform RAS Capabilities
enum EFI_ACPI_5_0_RASF_PLATFORM_RAS_CAPABILITY_HARDWARE_BASED_PATROL_SCRUB_SUPPOTED = 0x01;
enum EFI_ACPI_5_0_RASF_PLATFORM_RAS_CAPABILITY_HARDWARE_BASED_PATROL_SCRUB_SUPPOTED_AND_EXPOSED_TO_SOFTWARE = 0x02;
/// ACPI RASF Parameter Block structure for PATROL_SCRUB
struct EFI_ACPI_5_0_RASF_PATROL_SCRUB_PLATFORM_BLOCK_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 Version;
    UINT16 Length;
    UINT16 PatrolScrubCommand;
    UINT64[2] RequestedAddressRange;
    UINT64[2] ActualAddressRange;
    UINT16 Flags;
    UINT8 RequestedSpeed;
}
/// ACPI RASF Patrol Scrub command
enum EFI_ACPI_5_0_RASF_PATROL_SCRUB_COMMAND_GET_PATROL_PARAMETERS = 0x01;
enum EFI_ACPI_5_0_RASF_PATROL_SCRUB_COMMAND_START_PATROL_SCRUBBER = 0x02;
enum EFI_ACPI_5_0_RASF_PATROL_SCRUB_COMMAND_STOP_PATROL_SCRUBBER = 0x03;
/// Memory Power State Table definition.
struct EFI_ACPI_5_0_MEMORY_POWER_STATUS_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT8 PlatformCommunicationChannelIdentifier;
    UINT8[3] Reserved;
    // Memory Power Node Structure
    // Memory Power State Characteristics
}
/// MPST Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_MEMORY_POWER_STATE_TABLE_REVISION = 0x01;
/// MPST Platform Communication Channel Shared Memory Region definition.
struct EFI_ACPI_5_0_MPST_PLATFORM_COMMUNICATION_CHANNEL_SHARED_MEMORY_REGION
{
align(1):
    UINT32 Signature;
    UINT16 Command;
    UINT16 Status;
    UINT32 MemoryPowerCommandRegister;
    UINT32 MemoryPowerStatusRegister;
    UINT32 PowerStateId;
    UINT32 MemoryPowerNodeId;
    UINT64 MemoryEnergyConsumed;
    UINT64 ExpectedAveragePowerComsuned;
}
/// ACPI MPST PCC command code
enum EFI_ACPI_5_0_MPST_PCC_COMMAND_CODE_EXECUTE_MPST_COMMAND = 0x03;
/// ACPI MPST Memory Power command
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_COMMAND_GET_MEMORY_POWER_STATE = 0x01;
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_COMMAND_SET_MEMORY_POWER_STATE = 0x02;
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_COMMAND_GET_AVERAGE_POWER_CONSUMED = 0x03;
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_COMMAND_GET_MEMORY_ENERGY_CONSUMED = 0x04;
/// MPST Memory Power Node Table
struct EFI_ACPI_5_0_MPST_MEMORY_POWER_STATE
{
align(1):
    UINT8 PowerStateValue;
    UINT8 PowerStateInformationIndex;
}

struct EFI_ACPI_5_0_MPST_MEMORY_POWER_STRUCTURE
{
align(1):
    UINT8 Flag;
    UINT8 Reserved;
    UINT16 MemoryPowerNodeId;
    UINT32 Length;
    UINT64 AddressBase;
    UINT64 AddressLength;
    UINT32 NumberOfPowerStates;
    UINT32 NumberOfPhysicalComponents;
    //EFI_ACPI_5_0_MPST_MEMORY_POWER_STATE              MemoryPowerState[NumberOfPowerStates];
    //UINT16                                            PhysicalComponentIdentifier[NumberOfPhysicalComponents];
}

enum EFI_ACPI_5_0_MPST_MEMORY_POWER_STRUCTURE_FLAG_ENABLE = 0x01;
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_STRUCTURE_FLAG_POWER_MANAGED = 0x02;
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_STRUCTURE_FLAG_HOT_PLUGGABLE = 0x04;
struct EFI_ACPI_5_0_MPST_MEMORY_POWER_NODE_TABLE
{
align(1):
    UINT16 MemoryPowerNodeCount;
    UINT8[2] Reserved;
}
/// MPST Memory Power State Characteristics Table
struct EFI_ACPI_5_0_MPST_MEMORY_POWER_STATE_CHARACTERISTICS_STRUCTURE
{
align(1):
    UINT8 PowerStateStructureID;
    UINT8 Flag;
    UINT16 Reserved;
    UINT32 AveragePowerConsumedInMPS0;
    UINT32 RelativePowerSavingToMPS0;
    UINT64 ExitLatencyToMPS0;
}

enum EFI_ACPI_5_0_MPST_MEMORY_POWER_STATE_CHARACTERISTICS_STRUCTURE_FLAG_MEMORY_CONTENT_PRESERVED = 0x01;
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_STATE_CHARACTERISTICS_STRUCTURE_FLAG_AUTONOMOUS_MEMORY_POWER_STATE_ENTRY = 0x02;
enum EFI_ACPI_5_0_MPST_MEMORY_POWER_STATE_CHARACTERISTICS_STRUCTURE_FLAG_AUTONOMOUS_MEMORY_POWER_STATE_EXIT = 0x04;
struct EFI_ACPI_5_0_MPST_MEMORY_POWER_STATE_CHARACTERISTICS_TABLE
{
align(1):
    UINT16 MemoryPowerStateCharacteristicsCount;
    UINT8[2] Reserved;
}
/// Memory Topology Table definition.
struct EFI_ACPI_5_0_MEMORY_TOPOLOGY_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 Reserved;
}
/// PMTT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_MEMORY_TOPOLOGY_TABLE_REVISION = 0x01;
/// Common Memory Aggregator Device Structure.
struct EFI_ACPI_5_0_PMMT_COMMON_MEMORY_AGGREGATOR_DEVICE_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Reserved;
    UINT16 Length;
    UINT16 Flags;
    UINT16 Reserved1;
}
/// Memory Aggregator Device Type
enum EFI_ACPI_5_0_PMMT_MEMORY_AGGREGATOR_DEVICE_TYPE_SOCKET = 0x1;
enum EFI_ACPI_5_0_PMMT_MEMORY_AGGREGATOR_DEVICE_TYPE_MEMORY_CONTROLLER = 0x2;
enum EFI_ACPI_5_0_PMMT_MEMORY_AGGREGATOR_DEVICE_TYPE_DIMM = 0x3;
/// Socket Memory Aggregator Device Structure.
struct EFI_ACPI_5_0_PMMT_SOCKET_MEMORY_AGGREGATOR_DEVICE_STRUCTURE
{
align(1):
    EFI_ACPI_5_0_PMMT_COMMON_MEMORY_AGGREGATOR_DEVICE_STRUCTURE Header;
    UINT16 SocketIdentifier;
    UINT16 Reserved;
    //EFI_ACPI_5_0_PMMT_MEMORY_CONTROLLER_MEMORY_AGGREGATOR_DEVICE_STRUCTURE  MemoryController[];
}
/// MemoryController Memory Aggregator Device Structure.
struct EFI_ACPI_5_0_PMMT_MEMORY_CONTROLLER_MEMORY_AGGREGATOR_DEVICE_STRUCTURE
{
align(1):
    EFI_ACPI_5_0_PMMT_COMMON_MEMORY_AGGREGATOR_DEVICE_STRUCTURE Header;
    UINT32 ReadLatency;
    UINT32 WriteLatency;
    UINT32 ReadBandwidth;
    UINT32 WriteBandwidth;
    UINT16 OptimalAccessUnit;
    UINT16 OptimalAccessAlignment;
    UINT16 Reserved;
    UINT16 NumberOfProximityDomains;
    //UINT32                                                       ProximityDomain[NumberOfProximityDomains];
    //EFI_ACPI_5_0_PMMT_DIMM_MEMORY_AGGREGATOR_DEVICE_STRUCTURE    PhysicalComponent[];
}
/// DIMM Memory Aggregator Device Structure.
struct EFI_ACPI_5_0_PMMT_DIMM_MEMORY_AGGREGATOR_DEVICE_STRUCTURE
{
align(1):
    EFI_ACPI_5_0_PMMT_COMMON_MEMORY_AGGREGATOR_DEVICE_STRUCTURE Header;
    UINT16 PhysicalComponentIdentifier;
    UINT16 Reserved;
    UINT32 SizeOfDimm;
    UINT32 SmbiosHandle;
}
/// Boot Graphics Resource Table definition.
struct EFI_ACPI_5_0_BOOT_GRAPHICS_RESOURCE_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    ///
    /// 2-bytes (16 bit) version ID. This value must be 1.
    ///
    UINT16 Version;
    ///
    /// 1-byte status field indicating current status about the table.
    ///     Bit [0] = Valid. A one indicates the boot image graphic is valid.
    ///
    UINT8 Status;
    /// 1-byte enumerated type field indicating format of the image.
    ///     0 = Bitmap
    ///     1 - 255  Reserved (for future use)
    ///
    UINT8 ImageType; ///
    /// 8-byte (64 bit) physical address pointing to the firmware's in-memory copy
    /// of the image bitmap.
    ///
    UINT64 ImageAddress; ///
    /// A 4-byte (32-bit) unsigned long describing the display X-offset of the boot image.
    /// (X, Y) display offset of the top left corner of the boot image.
    /// The top left corner of the display is at offset (0, 0).
    ///
    UINT32 ImageOffsetX; ///
    /// A 4-byte (32-bit) unsigned long describing the display Y-offset of the boot image.
    /// (X, Y) display offset of the top left corner of the boot image.
    /// The top left corner of the display is at offset (0, 0).
    ///
    UINT32 ImageOffsetY;
}
/// BGRT Revision
enum EFI_ACPI_5_0_BOOT_GRAPHICS_RESOURCE_TABLE_REVISION = 1; /// BGRT Version
enum EFI_ACPI_5_0_BGRT_VERSION = 0x01; /// BGRT Status
enum EFI_ACPI_5_0_BGRT_STATUS_NOT_DISPLAYED = 0x00;
enum EFI_ACPI_5_0_BGRT_STATUS_DISPLAYED = 0x01;
enum EFI_ACPI_5_0_BGRT_STATUS_INVALID = EFI_ACPI_5_0_BGRT_STATUS_NOT_DISPLAYED;
enum EFI_ACPI_5_0_BGRT_STATUS_VALID = EFI_ACPI_5_0_BGRT_STATUS_DISPLAYED;
/// BGRT Image Type
enum EFI_ACPI_5_0_BGRT_IMAGE_TYPE_BMP = 0x00; /// FPDT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_FIRMWARE_PERFORMANCE_DATA_TABLE_REVISION = 0x01; /// FPDT Performance Record Types
enum EFI_ACPI_5_0_FPDT_RECORD_TYPE_FIRMWARE_BASIC_BOOT_POINTER = 0x0000;
enum EFI_ACPI_5_0_FPDT_RECORD_TYPE_S3_PERFORMANCE_TABLE_POINTER = 0x0001;
/// FPDT Performance Record Revision
enum EFI_ACPI_5_0_FPDT_RECORD_REVISION_FIRMWARE_BASIC_BOOT_POINTER = 0x01;
enum EFI_ACPI_5_0_FPDT_RECORD_REVISION_S3_PERFORMANCE_TABLE_POINTER = 0x01;
/// FPDT Runtime Performance Record Types
enum EFI_ACPI_5_0_FPDT_RUNTIME_RECORD_TYPE_S3_RESUME = 0x0000;
enum EFI_ACPI_5_0_FPDT_RUNTIME_RECORD_TYPE_S3_SUSPEND = 0x0001;
enum EFI_ACPI_5_0_FPDT_RUNTIME_RECORD_TYPE_FIRMWARE_BASIC_BOOT = 0x0002;
/// FPDT Runtime Performance Record Revision
enum EFI_ACPI_5_0_FPDT_RUNTIME_RECORD_REVISION_S3_RESUME = 0x01;
enum EFI_ACPI_5_0_FPDT_RUNTIME_RECORD_REVISION_S3_SUSPEND = 0x01;
enum EFI_ACPI_5_0_FPDT_RUNTIME_RECORD_REVISION_FIRMWARE_BASIC_BOOT = 0x02;
/// FPDT Performance Record header
struct EFI_ACPI_5_0_FPDT_PERFORMANCE_RECORD_HEADER
{
align(1):
    UINT16 Type;
    UINT8 Length;
    UINT8 Revision;
}
/// FPDT Performance Table header
struct EFI_ACPI_5_0_FPDT_PERFORMANCE_TABLE_HEADER
{
align(1):
    UINT32 Signature;
    UINT32 Length;
}
/// FPDT Firmware Basic Boot Performance Pointer Record Structure
struct EFI_ACPI_5_0_FPDT_BOOT_PERFORMANCE_TABLE_POINTER_RECORD
{
align(1):
    EFI_ACPI_5_0_FPDT_PERFORMANCE_RECORD_HEADER Header;
    UINT32 Reserved; ///
    /// 64-bit processor-relative physical address of the Basic Boot Performance Table.
    ///
    UINT64 BootPerformanceTablePointer;
}
/// FPDT S3 Performance Table Pointer Record Structure
struct EFI_ACPI_5_0_FPDT_S3_PERFORMANCE_TABLE_POINTER_RECORD
{
align(1):
    EFI_ACPI_5_0_FPDT_PERFORMANCE_RECORD_HEADER Header;
    UINT32 Reserved;
    ///
    /// 64-bit processor-relative physical address of the S3 Performance Table.
    ///
    UINT64 S3PerformanceTablePointer;
}
/// FPDT Firmware Basic Boot Performance Record Structure
struct EFI_ACPI_5_0_FPDT_FIRMWARE_BASIC_BOOT_RECORD
{
align(1):
    EFI_ACPI_5_0_FPDT_PERFORMANCE_RECORD_HEADER Header;
    UINT32 Reserved;
    ///
    /// Timer value logged at the beginning of firmware image execution.
    /// This may not always be zero or near zero.
    ///
    UINT64 ResetEnd; ///
    /// Timer value logged just prior to loading the OS boot loader into memory.
    /// For non-UEFI compatible boots, this field must be zero.
    ///
    UINT64 OsLoaderLoadImageStart; ///
    /// Timer value logged just prior to launching the previously loaded OS boot loader image.
    /// For non-UEFI compatible boots, the timer value logged will be just prior
    /// to the INT 19h handler invocation.
    ///
    UINT64 OsLoaderStartImageStart; ///
    /// Timer value logged at the point when the OS loader calls the
    /// ExitBootServices function for UEFI compatible firmware.
    /// For non-UEFI compatible boots, this field must be zero.
    ///
    UINT64 ExitBootServicesEntry; ///
    /// Timer value logged at the point just prior towhen the OS loader gaining
    /// control back from calls the ExitBootServices function for UEFI compatible firmware.
    /// For non-UEFI compatible boots, this field must be zero.
    ///
    UINT64 ExitBootServicesExit;
}
/// FPDT Firmware Basic Boot Performance Table signature
enum EFI_ACPI_5_0_FPDT_BOOT_PERFORMANCE_TABLE_SIGNATURE = SIGNATURE_32('F', 'B', 'P',
        'T');
struct EFI_ACPI_5_0_FPDT_FIRMWARE_BASIC_BOOT_TABLE
{
align(1):
    EFI_ACPI_5_0_FPDT_PERFORMANCE_TABLE_HEADER Header; //
    // one or more Performance Records.
    //
}
/// FPDT "S3PT" S3 Performance Table
enum EFI_ACPI_5_0_FPDT_S3_PERFORMANCE_TABLE_SIGNATURE = SIGNATURE_32('S', '3', 'P',
        'T');
struct EFI_ACPI_5_0_FPDT_FIRMWARE_S3_BOOT_TABLE
{
align(1):
    EFI_ACPI_5_0_FPDT_PERFORMANCE_TABLE_HEADER Header; //
    // one or more Performance Records.
    //
}
/// FPDT Basic S3 Resume Performance Record
struct EFI_ACPI_5_0_FPDT_S3_RESUME_RECORD
{
align(1):
    EFI_ACPI_5_0_FPDT_PERFORMANCE_RECORD_HEADER Header; ///
    /// A count of the number of S3 resume cycles since the last full boot sequence.
    ///
    UINT32 ResumeCount; ///
    /// Timer recorded at the end of BIOS S3 resume, just prior to handoff to the
    /// OS waking vector. Only the most recent resume cycle's time is retained.
    ///
    UINT64 FullResume; ///
    /// Average timer value of all resume cycles logged since the last full boot
    /// sequence, including the most recent resume.  Note that the entire log of
    /// timer values does not need to be retained in order to calculate this average.
    ///
    UINT64 AverageResume;
}
/// FPDT Basic S3 Suspend Performance Record
struct EFI_ACPI_5_0_FPDT_S3_SUSPEND_RECORD
{
align(1):
    EFI_ACPI_5_0_FPDT_PERFORMANCE_RECORD_HEADER Header; ///
    /// Timer value recorded at the OS write to SLP_TYP upon entry to S3.
    /// Only the most recent suspend cycle's timer value is retained.
    ///
    UINT64 SuspendStart; ///
    /// Timer value recorded at the final firmware write to SLP_TYP (or other
    /// mechanism) used to trigger hardware entry to S3.
    /// Only the most recent suspend cycle's timer value is retained.
    ///
    UINT64 SuspendEnd;
}
/// Firmware Performance Record Table definition.
struct EFI_ACPI_5_0_FIRMWARE_PERFORMANCE_RECORD_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
}
/// Generic Timer Description Table definition.
struct EFI_ACPI_5_0_GENERIC_TIMER_DESCRIPTION_TABLE
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT64 PhysicalAddress;
    UINT32 GlobalFlags;
    UINT32 SecurePL1TimerGSIV;
    UINT32 SecurePL1TimerFlags;
    UINT32 NonSecurePL1TimerGSIV;
    UINT32 NonSecurePL1TimerFlags;
    UINT32 VirtualTimerGSIV;
    UINT32 VirtualTimerFlags;
    UINT32 NonSecurePL2TimerGSIV;
    UINT32 NonSecurePL2TimerFlags;
}
/// GTDT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_GENERIC_TIMER_DESCRIPTION_TABLE_REVISION = 0x01;
/// Global Flags.  All other bits are reserved and must be 0.
enum EFI_ACPI_5_0_GTDT_GLOBAL_FLAG_MEMORY_MAPPED_BLOCK_PRESENT = BIT0;
enum EFI_ACPI_5_0_GTDT_GLOBAL_FLAG_INTERRUPT_MODE = BIT1;
/// Timer Flags.  All other bits are reserved and must be 0.
enum EFI_ACPI_5_0_GTDT_TIMER_FLAG_TIMER_INTERRUPT_MODE = BIT0;
enum EFI_ACPI_5_0_GTDT_TIMER_FLAG_TIMER_INTERRUPT_POLARITY = BIT1;
/// Boot Error Record Table (BERT)
struct EFI_ACPI_5_0_BOOT_ERROR_RECORD_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 BootErrorRegionLength;
    UINT64 BootErrorRegion;
}
/// BERT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_BOOT_ERROR_RECORD_TABLE_REVISION = 0x01;
/// Boot Error Region Block Status Definition
struct EFI_ACPI_5_0_ERROR_BLOCK_STATUS
{
align(1):
    mixin(bitfields!(UINT32, "UncorrectableErrorValid", 1, UINT32,
        "CorrectableErrorValid", 1, UINT32, "MultipleUncorrectableErrors", 1,
        UINT32, "MultipleCorrectableErrors", 1, UINT32, "ErrorDataEntryCount",
        10, UINT32, "Reserved", 18));
}
/// Boot Error Region Definition
struct EFI_ACPI_5_0_BOOT_ERROR_REGION_STRUCTURE
{
align(1):
    EFI_ACPI_5_0_ERROR_BLOCK_STATUS BlockStatus;
    UINT32 RawDataOffset;
    UINT32 RawDataLength;
    UINT32 DataLength;
    UINT32 ErrorSeverity;
}

enum EFI_ACPI_5_0_ERROR_SEVERITY_CORRECTABLE = 0x00;
enum EFI_ACPI_5_0_ERROR_SEVERITY_FATAL = 0x01;
enum EFI_ACPI_5_0_ERROR_SEVERITY_CORRECTED = 0x02;
enum EFI_ACPI_5_0_ERROR_SEVERITY_NONE = 0x03;
/// Generic Error Data Entry Definition
struct EFI_ACPI_5_0_GENERIC_ERROR_DATA_ENTRY_STRUCTURE
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
/// Generic Error Data Entry Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_GENERIC_ERROR_DATA_ENTRY_REVISION = 0x0201;
/// HEST - Hardware Error Source Table
struct EFI_ACPI_5_0_HARDWARE_ERROR_SOURCE_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 ErrorSourceCount;
}
/// HEST Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_HARDWARE_ERROR_SOURCE_TABLE_REVISION = 0x01;
enum EFI_ACPI_5_0_IA32_ARCHITECTURE_MACHINE_CHECK_EXCEPTION = 0x00;
enum EFI_ACPI_5_0_IA32_ARCHITECTURE_CORRECTED_MACHINE_CHECK = 0x01;
enum EFI_ACPI_5_0_IA32_ARCHITECTURE_NMI_ERROR = 0x02;
enum EFI_ACPI_5_0_PCI_EXPRESS_ROOT_PORT_AER = 0x06;
enum EFI_ACPI_5_0_PCI_EXPRESS_DEVICE_AER = 0x07;
enum EFI_ACPI_5_0_PCI_EXPRESS_BRIDGE_AER = 0x08;
enum EFI_ACPI_5_0_GENERIC_HARDWARE_ERROR = 0x09;
enum EFI_ACPI_5_0_ERROR_SOURCE_FLAG_FIRMWARE_FIRST = (1 << 0);
enum EFI_ACPI_5_0_ERROR_SOURCE_FLAG_GLOBAL = (1 << 1);
/// IA-32 Architecture Machine Check Exception Structure Definition
struct EFI_ACPI_5_0_IA32_ARCHITECTURE_MACHINE_CHECK_EXCEPTION_STRUCTURE
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
struct EFI_ACPI_5_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_BANK_STRUCTURE
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
enum EFI_ACPI_5_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_DATA_FORMAT_IA32 = 0x00;
enum EFI_ACPI_5_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_DATA_FORMAT_INTEL64 = 0x01;
enum EFI_ACPI_5_0_IA32_ARCHITECTURE_MACHINE_CHECK_ERROR_DATA_FORMAT_AMD64 = 0x02;
enum EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_POLLED = 0x00;
enum EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_EXTERNAL_INTERRUPT = 0x01;
enum EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_LOCAL_INTERRUPT = 0x02;
enum EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_SCI = 0x03;
enum EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_NMI = 0x04;
/// Hardware Error Notification Configuration Write Enable Structure Definition
struct EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_CONFIGURATION_WRITE_ENABLE_STRUCTURE
{
align(1):
    mixin(bitfields!(UINT16, "Type", 1, UINT16, "PollInterval", 1, UINT16,
        "SwitchToPollingThresholdValue", 1, UINT16,
        "SwitchToPollingThresholdWindow", 1, UINT16, "ErrorThresholdValue", 1,
        UINT16, "ErrorThresholdWindow", 1, UINT16, "Reserved", 10));
}
/// Hardware Error Notification Structure Definition
struct EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_STRUCTURE
{
align(1):
    UINT8 Type;
    UINT8 Length;
    EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_CONFIGURATION_WRITE_ENABLE_STRUCTURE ConfigurationWriteEnable;
    UINT32 PollInterval;
    UINT32 Vector;
    UINT32 SwitchToPollingThresholdValue;
    UINT32 SwitchToPollingThresholdWindow;
    UINT32 ErrorThresholdValue;
    UINT32 ErrorThresholdWindow;
}
/// IA-32 Architecture Corrected Machine Check Structure Definition
struct EFI_ACPI_5_0_IA32_ARCHITECTURE_CORRECTED_MACHINE_CHECK_STRUCTURE
{
align(1):
    UINT16 Type;
    UINT16 SourceId;
    UINT8[2] Reserved0;
    UINT8 Flags;
    UINT8 Enabled;
    UINT32 NumberOfRecordsToPreAllocate;
    UINT32 MaxSectionsPerRecord;
    EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_STRUCTURE NotificationStructure;
    UINT8 NumberOfHardwareBanks;
    UINT8[3] Reserved1;
}
/// IA-32 Architecture NMI Error Structure Definition
struct EFI_ACPI_5_0_IA32_ARCHITECTURE_NMI_ERROR_STRUCTURE
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
struct EFI_ACPI_5_0_PCI_EXPRESS_ROOT_PORT_AER_STRUCTURE
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
struct EFI_ACPI_5_0_PCI_EXPRESS_DEVICE_AER_STRUCTURE
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
struct EFI_ACPI_5_0_PCI_EXPRESS_BRIDGE_AER_STRUCTURE
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
struct EFI_ACPI_5_0_GENERIC_HARDWARE_ERROR_SOURCE_STRUCTURE
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
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE ErrorStatusAddress;
    EFI_ACPI_5_0_HARDWARE_ERROR_NOTIFICATION_STRUCTURE NotificationStructure;
    UINT32 ErrorStatusBlockLength;
}
/// Generic Error Status Definition
struct EFI_ACPI_5_0_GENERIC_ERROR_STATUS_STRUCTURE
{
align(1):
    EFI_ACPI_5_0_ERROR_BLOCK_STATUS BlockStatus;
    UINT32 RawDataOffset;
    UINT32 RawDataLength;
    UINT32 DataLength;
    UINT32 ErrorSeverity;
}
/// ERST - Error Record Serialization Table
struct EFI_ACPI_5_0_ERROR_RECORD_SERIALIZATION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 SerializationHeaderSize;
    UINT8[4] Reserved0;
    UINT32 InstructionEntryCount;
}
/// ERST Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_ERROR_RECORD_SERIALIZATION_TABLE_REVISION = 0x01;
/// ERST Serialization Actions
enum EFI_ACPI_5_0_ERST_BEGIN_WRITE_OPERATION = 0x00;
enum EFI_ACPI_5_0_ERST_BEGIN_READ_OPERATION = 0x01;
enum EFI_ACPI_5_0_ERST_BEGIN_CLEAR_OPERATION = 0x02;
enum EFI_ACPI_5_0_ERST_END_OPERATION = 0x03;
enum EFI_ACPI_5_0_ERST_SET_RECORD_OFFSET = 0x04;
enum EFI_ACPI_5_0_ERST_EXECUTE_OPERATION = 0x05;
enum EFI_ACPI_5_0_ERST_CHECK_BUSY_STATUS = 0x06;
enum EFI_ACPI_5_0_ERST_GET_COMMAND_STATUS = 0x07;
enum EFI_ACPI_5_0_ERST_GET_RECORD_IDENTIFIER = 0x08;
enum EFI_ACPI_5_0_ERST_SET_RECORD_IDENTIFIER = 0x09;
enum EFI_ACPI_5_0_ERST_GET_RECORD_COUNT = 0x0A;
enum EFI_ACPI_5_0_ERST_BEGIN_DUMMY_WRITE_OPERATION = 0x0B;
enum EFI_ACPI_5_0_ERST_GET_ERROR_LOG_ADDRESS_RANGE = 0x0D;
enum EFI_ACPI_5_0_ERST_GET_ERROR_LOG_ADDRESS_RANGE_LENGTH = 0x0E;
enum EFI_ACPI_5_0_ERST_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES = 0x0F;
/// ERST Action Command Status
enum EFI_ACPI_5_0_ERST_STATUS_SUCCESS = 0x00;
enum EFI_ACPI_5_0_ERST_STATUS_NOT_ENOUGH_SPACE = 0x01;
enum EFI_ACPI_5_0_ERST_STATUS_HARDWARE_NOT_AVAILABLE = 0x02;
enum EFI_ACPI_5_0_ERST_STATUS_FAILED = 0x03;
enum EFI_ACPI_5_0_ERST_STATUS_RECORD_STORE_EMPTY = 0x04;
enum EFI_ACPI_5_0_ERST_STATUS_RECORD_NOT_FOUND = 0x05;
/// ERST Serialization Instructions
enum EFI_ACPI_5_0_ERST_READ_REGISTER = 0x00;
enum EFI_ACPI_5_0_ERST_READ_REGISTER_VALUE = 0x01;
enum EFI_ACPI_5_0_ERST_WRITE_REGISTER = 0x02;
enum EFI_ACPI_5_0_ERST_WRITE_REGISTER_VALUE = 0x03;
enum EFI_ACPI_5_0_ERST_NOOP = 0x04;
enum EFI_ACPI_5_0_ERST_LOAD_VAR1 = 0x05;
enum EFI_ACPI_5_0_ERST_LOAD_VAR2 = 0x06;
enum EFI_ACPI_5_0_ERST_STORE_VAR1 = 0x07;
enum EFI_ACPI_5_0_ERST_ADD = 0x08;
enum EFI_ACPI_5_0_ERST_SUBTRACT = 0x09;
enum EFI_ACPI_5_0_ERST_ADD_VALUE = 0x0A;
enum EFI_ACPI_5_0_ERST_SUBTRACT_VALUE = 0x0B;
enum EFI_ACPI_5_0_ERST_STALL = 0x0C;
enum EFI_ACPI_5_0_ERST_STALL_WHILE_TRUE = 0x0D;
enum EFI_ACPI_5_0_ERST_SKIP_NEXT_INSTRUCTION_IF_TRUE = 0x0E;
enum EFI_ACPI_5_0_ERST_GOTO = 0x0F;
enum EFI_ACPI_5_0_ERST_SET_SRC_ADDRESS_BASE = 0x10;
enum EFI_ACPI_5_0_ERST_SET_DST_ADDRESS_BASE = 0x11;
enum EFI_ACPI_5_0_ERST_MOVE_DATA = 0x12;
/// ERST Instruction Flags
enum EFI_ACPI_5_0_ERST_PRESERVE_REGISTER = 0x01;
/// ERST Serialization Instruction Entry
struct EFI_ACPI_5_0_ERST_SERIALIZATION_INSTRUCTION_ENTRY
{
align(1):
    UINT8 SerializationAction;
    UINT8 Instruction;
    UINT8 Flags;
    UINT8 Reserved0;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE RegisterRegion;
    UINT64 Value;
    UINT64 Mask;
}
/// EINJ - Error Injection Table
struct EFI_ACPI_5_0_ERROR_INJECTION_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 InjectionHeaderSize;
    UINT8 InjectionFlags;
    UINT8[3] Reserved0;
    UINT32 InjectionEntryCount;
}
/// EINJ Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_ERROR_INJECTION_TABLE_REVISION = 0x01;
/// EINJ Error Injection Actions
enum EFI_ACPI_5_0_EINJ_BEGIN_INJECTION_OPERATION = 0x00;
enum EFI_ACPI_5_0_EINJ_GET_TRIGGER_ERROR_ACTION_TABLE = 0x01;
enum EFI_ACPI_5_0_EINJ_SET_ERROR_TYPE = 0x02;
enum EFI_ACPI_5_0_EINJ_GET_ERROR_TYPE = 0x03;
enum EFI_ACPI_5_0_EINJ_END_OPERATION = 0x04;
enum EFI_ACPI_5_0_EINJ_EXECUTE_OPERATION = 0x05;
enum EFI_ACPI_5_0_EINJ_CHECK_BUSY_STATUS = 0x06;
enum EFI_ACPI_5_0_EINJ_GET_COMMAND_STATUS = 0x07;
enum EFI_ACPI_5_0_EINJ_TRIGGER_ERROR = 0xFF;
/// EINJ Action Command Status
enum EFI_ACPI_5_0_EINJ_STATUS_SUCCESS = 0x00;
enum EFI_ACPI_5_0_EINJ_STATUS_UNKNOWN_FAILURE = 0x01;
enum EFI_ACPI_5_0_EINJ_STATUS_INVALID_ACCESS = 0x02;
/// EINJ Error Type Definition
enum EFI_ACPI_5_0_EINJ_ERROR_PROCESSOR_CORRECTABLE = (1 << 0);
enum EFI_ACPI_5_0_EINJ_ERROR_PROCESSOR_UNCORRECTABLE_NONFATAL = (1 << 1);
enum EFI_ACPI_5_0_EINJ_ERROR_PROCESSOR_UNCORRECTABLE_FATAL = (1 << 2);
enum EFI_ACPI_5_0_EINJ_ERROR_MEMORY_CORRECTABLE = (1 << 3);
enum EFI_ACPI_5_0_EINJ_ERROR_MEMORY_UNCORRECTABLE_NONFATAL = (1 << 4);
enum EFI_ACPI_5_0_EINJ_ERROR_MEMORY_UNCORRECTABLE_FATAL = (1 << 5);
enum EFI_ACPI_5_0_EINJ_ERROR_PCI_EXPRESS_CORRECTABLE = (1 << 6);
enum EFI_ACPI_5_0_EINJ_ERROR_PCI_EXPRESS_UNCORRECTABLE_NONFATAL = (1 << 7);
enum EFI_ACPI_5_0_EINJ_ERROR_PCI_EXPRESS_UNCORRECTABLE_FATAL = (1 << 8);
enum EFI_ACPI_5_0_EINJ_ERROR_PLATFORM_CORRECTABLE = (1 << 9);
enum EFI_ACPI_5_0_EINJ_ERROR_PLATFORM_UNCORRECTABLE_NONFATAL = (1 << 10);
enum EFI_ACPI_5_0_EINJ_ERROR_PLATFORM_UNCORRECTABLE_FATAL = (1 << 11); /// EINJ Injection Instructions
enum EFI_ACPI_5_0_EINJ_READ_REGISTER = 0x00;
enum EFI_ACPI_5_0_EINJ_READ_REGISTER_VALUE = 0x01;
enum EFI_ACPI_5_0_EINJ_WRITE_REGISTER = 0x02;
enum EFI_ACPI_5_0_EINJ_WRITE_REGISTER_VALUE = 0x03;
enum EFI_ACPI_5_0_EINJ_NOOP = 0x04;
/// EINJ Instruction Flags
enum EFI_ACPI_5_0_EINJ_PRESERVE_REGISTER = 0x01;
/// EINJ Injection Instruction Entry
struct EFI_ACPI_5_0_EINJ_INJECTION_INSTRUCTION_ENTRY
{
align(1):
    UINT8 InjectionAction;
    UINT8 Instruction;
    UINT8 Flags;
    UINT8 Reserved0;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE RegisterRegion;
    UINT64 Value;
    UINT64 Mask;
}
/// EINJ Trigger Action Table
struct EFI_ACPI_5_0_EINJ_TRIGGER_ACTION_TABLE
{
align(1):
    UINT32 HeaderSize;
    UINT32 Revision;
    UINT32 TableSize;
    UINT32 EntryCount;
}
/// Platform Communications Channel Table (PCCT)
struct EFI_ACPI_5_0_PLATFORM_COMMUNICATION_CHANNEL_TABLE_HEADER
{
align(1):
    EFI_ACPI_DESCRIPTION_HEADER Header;
    UINT32 Flags;
    UINT64 Reserved;
}
/// PCCT Version (as defined in ACPI 5.0 spec.)
enum EFI_ACPI_5_0_PLATFORM_COMMUNICATION_CHANNEL_TABLE_REVISION = 0x01;
/// PCCT Global Flags
enum EFI_ACPI_5_0_PCCT_FLAGS_SCI_DOORBELL = BIT0;
enum EFI_ACPI_5_0_PCCT_SUBSPACE_TYPE_GENERIC = 0x00;
/// PCC Subspace Structure Header
struct EFI_ACPI_5_0_PCCT_SUBSPACE_HEADER
{
align(1):
    UINT8 Type;
    UINT8 Length;
}
/// Generic Communications Subspace Structure
struct EFI_ACPI_5_0_PCCT_SUBSPACE_GENERIC
{
align(1):
    UINT8 Type;
    UINT8 Length;
    UINT8[6] Reserved;
    UINT64 BaseAddress;
    UINT64 AddressLength;
    EFI_ACPI_5_0_GENERIC_ADDRESS_STRUCTURE DoorbellRegister;
    UINT64 DoorbellPreserve;
    UINT64 DoorbellWrite;
    UINT32 NominalLatency;
    UINT32 MaximumPeriodicAccessRate;
    UINT16 MinimumRequestTurnaroundTime;
}
/// Generic Communications Channel Shared Memory Region
struct EFI_ACPI_5_0_PCCT_GENERIC_SHARED_MEMORY_REGION_COMMAND
{
align(1):
    UINT8 Command;
    mixin(bitfields!(UINT8, "Reserved", 7, UINT8, "GenerateSci", 1));
}

struct EFI_ACPI_5_0_PCCT_GENERIC_SHARED_MEMORY_REGION_STATUS
{
align(1):
    mixin(bitfields!(UINT8, "CommandComplete", 1, UINT8, "SciDoorbell", 1,
        UINT8, "Error", 1, UINT8, "PlatformNotification", 1, UINT8, "Reserved", 4));
    UINT8 Reserved1;
}

struct EFI_ACPI_5_0_PCCT_GENERIC_SHARED_MEMORY_REGION_HEADER
{
align(1):
    UINT32 Signature;
    EFI_ACPI_5_0_PCCT_GENERIC_SHARED_MEMORY_REGION_COMMAND Command;
    EFI_ACPI_5_0_PCCT_GENERIC_SHARED_MEMORY_REGION_STATUS Status;
}
/// "RSD PTR " Root System Description Pointer
enum EFI_ACPI_5_0_ROOT_SYSTEM_DESCRIPTION_POINTER_SIGNATURE = SIGNATURE_64('R',
        'S', 'D', ' ', 'P', 'T', 'R', ' '); /// "APIC" Multiple APIC Description Table
enum EFI_ACPI_5_0_MULTIPLE_APIC_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('A', 'P',
        'I', 'C');
/// "BERT" Boot Error Record Table
enum EFI_ACPI_5_0_BOOT_ERROR_RECORD_TABLE_SIGNATURE = SIGNATURE_32('B', 'E', 'R', 'T');
/// "BGRT" Boot Graphics Resource Table
enum EFI_ACPI_5_0_BOOT_GRAPHICS_RESOURCE_TABLE_SIGNATURE = SIGNATURE_32('B', 'G', 'R',
        'T');
/// "CPEP" Corrected Platform Error Polling Table
enum EFI_ACPI_5_0_CORRECTED_PLATFORM_ERROR_POLLING_TABLE_SIGNATURE = SIGNATURE_32(
        'C', 'P', 'E', 'P');
/// "DSDT" Differentiated System Description Table
enum EFI_ACPI_5_0_DIFFERENTIATED_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32(
        'D', 'S', 'D', 'T');
/// "ECDT" Embedded Controller Boot Resources Table
enum EFI_ACPI_5_0_EMBEDDED_CONTROLLER_BOOT_RESOURCES_TABLE_SIGNATURE = SIGNATURE_32(
        'E', 'C', 'D', 'T');
/// "EINJ" Error Injection Table
enum EFI_ACPI_5_0_ERROR_INJECTION_TABLE_SIGNATURE = SIGNATURE_32('E', 'I', 'N', 'J');
/// "ERST" Error Record Serialization Table
enum EFI_ACPI_5_0_ERROR_RECORD_SERIALIZATION_TABLE_SIGNATURE = SIGNATURE_32('E', 'R',
        'S', 'T');
/// "FACP" Fixed ACPI Description Table
enum EFI_ACPI_5_0_FIXED_ACPI_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('F', 'A', 'C',
        'P');
/// "FACS" Firmware ACPI Control Structure
enum EFI_ACPI_5_0_FIRMWARE_ACPI_CONTROL_STRUCTURE_SIGNATURE = SIGNATURE_32('F', 'A',
        'C', 'S');
/// "FPDT" Firmware Performance Data Table
enum EFI_ACPI_5_0_FIRMWARE_PERFORMANCE_DATA_TABLE_SIGNATURE = SIGNATURE_32('F', 'P',
        'D', 'T');
/// "GTDT" Generic Timer Description Table
enum EFI_ACPI_5_0_GENERIC_TIMER_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('G', 'T',
        'D', 'T');
/// "HEST" Hardware Error Source Table
enum EFI_ACPI_5_0_HARDWARE_ERROR_SOURCE_TABLE_SIGNATURE = SIGNATURE_32('H', 'E', 'S',
        'T');
/// "MPST" Memory Power State Table
enum EFI_ACPI_5_0_MEMORY_POWER_STATE_TABLE_SIGNATURE = SIGNATURE_32('M', 'P', 'S',
        'T');
/// "MSCT" Maximum System Characteristics Table
enum EFI_ACPI_5_0_MAXIMUM_SYSTEM_CHARACTERISTICS_TABLE_SIGNATURE = SIGNATURE_32('M',
        'S', 'C', 'T');
/// "PMTT" Platform Memory Topology Table
enum EFI_ACPI_5_0_PLATFORM_MEMORY_TOPOLOGY_TABLE_SIGNATURE = SIGNATURE_32('P', 'M',
        'T', 'T');
/// "PSDT" Persistent System Description Table
enum EFI_ACPI_5_0_PERSISTENT_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('P',
        'S', 'D', 'T');
/// "RASF" ACPI RAS Feature Table
enum EFI_ACPI_5_0_ACPI_RAS_FEATURE_TABLE_SIGNATURE = SIGNATURE_32('R', 'A', 'S', 'F');
/// "RSDT" Root System Description Table
enum EFI_ACPI_5_0_ROOT_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('R', 'S',
        'D', 'T');
/// "SBST" Smart Battery Specification Table
enum EFI_ACPI_5_0_SMART_BATTERY_SPECIFICATION_TABLE_SIGNATURE = SIGNATURE_32('S', 'B',
        'S', 'T');
/// "SLIT" System Locality Information Table
enum EFI_ACPI_5_0_SYSTEM_LOCALITY_INFORMATION_TABLE_SIGNATURE = SIGNATURE_32('S', 'L',
        'I', 'T');
/// "SRAT" System Resource Affinity Table
enum EFI_ACPI_5_0_SYSTEM_RESOURCE_AFFINITY_TABLE_SIGNATURE = SIGNATURE_32('S', 'R',
        'A', 'T');
/// "SSDT" Secondary System Description Table
enum EFI_ACPI_5_0_SECONDARY_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('S',
        'S', 'D', 'T');
/// "XSDT" Extended System Description Table
enum EFI_ACPI_5_0_EXTENDED_SYSTEM_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('X', 'S',
        'D', 'T');
/// "BOOT" MS Simple Boot Spec
enum EFI_ACPI_5_0_SIMPLE_BOOT_FLAG_TABLE_SIGNATURE = SIGNATURE_32('B', 'O', 'O', 'T');
/// "CSRT" MS Core System Resource Table
enum EFI_ACPI_5_0_CORE_SYSTEM_RESOURCE_TABLE_SIGNATURE = SIGNATURE_32('C', 'S', 'R',
        'T');
/// "DBG2" MS Debug Port 2 Spec
enum EFI_ACPI_5_0_DEBUG_PORT_2_TABLE_SIGNATURE = SIGNATURE_32('D', 'B', 'G', '2');
/// "DBGP" MS Debug Port Spec
enum EFI_ACPI_5_0_DEBUG_PORT_TABLE_SIGNATURE = SIGNATURE_32('D', 'B', 'G', 'P');
/// "DMAR" DMA Remapping Table
enum EFI_ACPI_5_0_DMA_REMAPPING_TABLE_SIGNATURE = SIGNATURE_32('D', 'M', 'A', 'R');
/// "DRTM" Dynamic Root of Trust for Measurement Table
enum EFI_ACPI_5_0_DYNAMIC_ROOT_OF_TRUST_FOR_MEASUREMENT_TABLE_SIGNATURE = SIGNATURE_32(
        'D', 'R', 'T', 'M');
/// "ETDT" Event Timer Description Table
enum EFI_ACPI_5_0_EVENT_TIMER_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32('E', 'T',
        'D', 'T');
/// "HPET" IA-PC High Precision Event Timer Table
enum EFI_ACPI_5_0_HIGH_PRECISION_EVENT_TIMER_TABLE_SIGNATURE = SIGNATURE_32('H', 'P',
        'E', 'T');
/// "iBFT" iSCSI Boot Firmware Table
enum EFI_ACPI_5_0_ISCSI_BOOT_FIRMWARE_TABLE_SIGNATURE = SIGNATURE_32('i', 'B', 'F',
        'T');
/// "IVRS" I/O Virtualization Reporting Structure
enum EFI_ACPI_5_0_IO_VIRTUALIZATION_REPORTING_STRUCTURE_SIGNATURE = SIGNATURE_32('I',
        'V', 'R', 'S');
/// "MCFG" PCI Express Memory Mapped Configuration Space Base Address Description Table
enum EFI_ACPI_5_0_PCI_EXPRESS_MEMORY_MAPPED_CONFIGURATION_SPACE_BASE_ADDRESS_DESCRIPTION_TABLE_SIGNATURE = SIGNATURE_32(
        'M', 'C', 'F', 'G');
/// "MCHI" Management Controller Host Interface Table
enum EFI_ACPI_5_0_MANAGEMENT_CONTROLLER_HOST_INTERFACE_TABLE_SIGNATURE = SIGNATURE_32(
        'M', 'C', 'H', 'I');
/// "MSDM" MS Data Management Table
enum EFI_ACPI_5_0_DATA_MANAGEMENT_TABLE_SIGNATURE = SIGNATURE_32('M', 'S', 'D', 'M');
/// "SLIC" MS Software Licensing Table Specification
enum EFI_ACPI_5_0_SOFTWARE_LICENSING_TABLE_SIGNATURE = SIGNATURE_32('S', 'L', 'I',
        'C');
/// "SPCR" Serial Port Concole Redirection Table
enum EFI_ACPI_5_0_SERIAL_PORT_CONSOLE_REDIRECTION_TABLE_SIGNATURE = SIGNATURE_32('S',
        'P', 'C', 'R');
/// "SPMI" Server Platform Management Interface Table
enum EFI_ACPI_5_0_SERVER_PLATFORM_MANAGEMENT_INTERFACE_TABLE_SIGNATURE = SIGNATURE_32(
        'S', 'P', 'M', 'I');
/// "TCPA" Trusted Computing Platform Alliance Capabilities Table
enum EFI_ACPI_5_0_TRUSTED_COMPUTING_PLATFORM_ALLIANCE_CAPABILITIES_TABLE_SIGNATURE = SIGNATURE_32(
        'T', 'C', 'P', 'A');
/// "TPM2" Trusted Computing Platform 1 Table
enum EFI_ACPI_5_0_TRUSTED_COMPUTING_PLATFORM_2_TABLE_SIGNATURE = SIGNATURE_32('T',
        'P', 'M', '2');
/// "UEFI" UEFI ACPI Data Table
enum EFI_ACPI_5_0_UEFI_ACPI_DATA_TABLE_SIGNATURE = SIGNATURE_32('U', 'E', 'F', 'I');
/// "WAET" Windows ACPI Emulated Devices Table
enum EFI_ACPI_5_0_WINDOWS_ACPI_EMULATED_DEVICES_TABLE_SIGNATURE = SIGNATURE_32('W',
        'A', 'E', 'T');
enum EFI_ACPI_5_0_WINDOWS_ACPI_ENLIGHTENMENT_TABLE_SIGNATURE = EFI_ACPI_5_0_WINDOWS_ACPI_EMULATED_DEVICES_TABLE_SIGNATURE;
/// "WDAT" Watchdog Action Table
enum EFI_ACPI_5_0_WATCHDOG_ACTION_TABLE_SIGNATURE = SIGNATURE_32('W', 'D', 'A', 'T'); /// "WDRT" Watchdog Resource Table
enum EFI_ACPI_5_0_WATCHDOG_RESOURCE_TABLE_SIGNATURE = SIGNATURE_32('W', 'D', 'R', 'T');
/// "WPBT" MS Platform Binary Table
enum EFI_ACPI_5_0_PLATFORM_BINARY_TABLE_SIGNATURE = SIGNATURE_32('W', 'P', 'B', 'T');
