/**
	Based on IndustryStandard/AcpiAml.h, original notice:

	This file contains AML code definition in the latest ACPI spec.
	
	Copyright (c) 2011, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
**/
module uefi.acpiaml;
import uefi.base;
import uefi.base_type;

public:
extern (C):
enum AML_ZERO_OP = 0x00;
enum AML_ONE_OP = 0x01;
enum AML_ALIAS_OP = 0x06;
enum AML_NAME_OP = 0x08;
enum AML_BYTE_PREFIX = 0x0a;
enum AML_WORD_PREFIX = 0x0b;
enum AML_DWORD_PREFIX = 0x0c;
enum AML_STRING_PREFIX = 0x0d;
enum AML_QWORD_PREFIX = 0x0e;
enum AML_SCOPE_OP = 0x10;
enum AML_BUFFER_OP = 0x11;
enum AML_PACKAGE_OP = 0x12;
enum AML_VAR_PACKAGE_OP = 0x13;
enum AML_METHOD_OP = 0x14;
enum AML_DUAL_NAME_PREFIX = 0x2e;
enum AML_MULTI_NAME_PREFIX = 0x2f;
enum AML_NAME_CHAR_A = 0x41;
enum AML_NAME_CHAR_B = 0x42;
enum AML_NAME_CHAR_C = 0x43;
enum AML_NAME_CHAR_D = 0x44;
enum AML_NAME_CHAR_E = 0x45;
enum AML_NAME_CHAR_F = 0x46;
enum AML_NAME_CHAR_G = 0x47;
enum AML_NAME_CHAR_H = 0x48;
enum AML_NAME_CHAR_I = 0x49;
enum AML_NAME_CHAR_J = 0x4a;
enum AML_NAME_CHAR_K = 0x4b;
enum AML_NAME_CHAR_L = 0x4c;
enum AML_NAME_CHAR_M = 0x4d;
enum AML_NAME_CHAR_N = 0x4e;
enum AML_NAME_CHAR_O = 0x4f;
enum AML_NAME_CHAR_P = 0x50;
enum AML_NAME_CHAR_Q = 0x51;
enum AML_NAME_CHAR_R = 0x52;
enum AML_NAME_CHAR_S = 0x53;
enum AML_NAME_CHAR_T = 0x54;
enum AML_NAME_CHAR_U = 0x55;
enum AML_NAME_CHAR_V = 0x56;
enum AML_NAME_CHAR_W = 0x57;
enum AML_NAME_CHAR_X = 0x58;
enum AML_NAME_CHAR_Y = 0x59;
enum AML_NAME_CHAR_Z = 0x5a;
enum AML_ROOT_CHAR = 0x5c;
enum AML_PARENT_PREFIX_CHAR = 0x5e;
enum AML_NAME_CHAR__ = 0x5f;
enum AML_LOCAL0 = 0x60;
enum AML_LOCAL1 = 0x61;
enum AML_LOCAL2 = 0x62;
enum AML_LOCAL3 = 0x63;
enum AML_LOCAL4 = 0x64;
enum AML_LOCAL5 = 0x65;
enum AML_LOCAL6 = 0x66;
enum AML_LOCAL7 = 0x67;
enum AML_ARG0 = 0x68;
enum AML_ARG1 = 0x69;
enum AML_ARG2 = 0x6a;
enum AML_ARG3 = 0x6b;
enum AML_ARG4 = 0x6c;
enum AML_ARG5 = 0x6d;
enum AML_ARG6 = 0x6e;
enum AML_STORE_OP = 0x70;
enum AML_REF_OF_OP = 0x71;
enum AML_ADD_OP = 0x72;
enum AML_CONCAT_OP = 0x73;
enum AML_SUBTRACT_OP = 0x74;
enum AML_INCREMENT_OP = 0x75;
enum AML_DECREMENT_OP = 0x76;
enum AML_MULTIPLY_OP = 0x77;
enum AML_DIVIDE_OP = 0x78;
enum AML_SHIFT_LEFT_OP = 0x79;
enum AML_SHIFT_RIGHT_OP = 0x7a;
enum AML_AND_OP = 0x7b;
enum AML_NAND_OP = 0x7c;
enum AML_OR_OP = 0x7d;
enum AML_NOR_OP = 0x7e;
enum AML_XOR_OP = 0x7f;
enum AML_NOT_OP = 0x80;
enum AML_FIND_SET_LEFT_BIT_OP = 0x81;
enum AML_FIND_SET_RIGHT_BIT_OP = 0x82;
enum AML_DEREF_OF_OP = 0x83;
enum AML_CONCAT_RES_OP = 0x84;
enum AML_MOD_OP = 0x85;
enum AML_NOTIFY_OP = 0x86;
enum AML_SIZE_OF_OP = 0x87;
enum AML_INDEX_OP = 0x88;
enum AML_MATCH_OP = 0x89;
enum AML_CREATE_DWORD_FIELD_OP = 0x8a;
enum AML_CREATE_WORD_FIELD_OP = 0x8b;
enum AML_CREATE_BYTE_FIELD_OP = 0x8c;
enum AML_CREATE_BIT_FIELD_OP = 0x8d;
enum AML_OBJECT_TYPE_OP = 0x8e;
enum AML_CREATE_QWORD_FIELD_OP = 0x8f;
enum AML_LAND_OP = 0x90;
enum AML_LOR_OP = 0x91;
enum AML_LNOT_OP = 0x92;
enum AML_LEQUAL_OP = 0x93;
enum AML_LGREATER_OP = 0x94;
enum AML_LLESS_OP = 0x95;
enum AML_TO_BUFFER_OP = 0x96;
enum AML_TO_DEC_STRING_OP = 0x97;
enum AML_TO_HEX_STRING_OP = 0x98;
enum AML_TO_INTEGER_OP = 0x99;
enum AML_TO_STRING_OP = 0x9c;
enum AML_COPY_OBJECT_OP = 0x9d;
enum AML_MID_OP = 0x9e;
enum AML_CONTINUE_OP = 0x9f;
enum AML_IF_OP = 0xa0;
enum AML_ELSE_OP = 0xa1;
enum AML_WHILE_OP = 0xa2;
enum AML_NOOP_OP = 0xa3;
enum AML_RETURN_OP = 0xa4;
enum AML_BREAK_OP = 0xa5;
enum AML_BREAK_POINT_OP = 0xcc;
enum AML_ONES_OP = 0xff;
enum AML_EXT_OP = 0x5b;
enum AML_EXT_MUTEX_OP = 0x01;
enum AML_EXT_EVENT_OP = 0x02;
enum AML_EXT_COND_REF_OF_OP = 0x12;
enum AML_EXT_CREATE_FIELD_OP = 0x13;
enum AML_EXT_LOAD_TABLE_OP = 0x1f;
enum AML_EXT_LOAD_OP = 0x20;
enum AML_EXT_STALL_OP = 0x21;
enum AML_EXT_SLEEP_OP = 0x22;
enum AML_EXT_ACQUIRE_OP = 0x23;
enum AML_EXT_SIGNAL_OP = 0x24;
enum AML_EXT_WAIT_OP = 0x25;
enum AML_EXT_RESET_OP = 0x26;
enum AML_EXT_RELEASE_OP = 0x27;
enum AML_EXT_FROM_BCD_OP = 0x28;
enum AML_EXT_TO_BCD_OP = 0x29;
enum AML_EXT_UNLOAD_OP = 0x2a;
enum AML_EXT_REVISION_OP = 0x30;
enum AML_EXT_DEBUG_OP = 0x31;
enum AML_EXT_FATAL_OP = 0x32;
enum AML_EXT_TIMER_OP = 0x33;
enum AML_EXT_REGION_OP = 0x80;
enum AML_EXT_FIELD_OP = 0x81;
enum AML_EXT_DEVICE_OP = 0x82;
enum AML_EXT_PROCESSOR_OP = 0x83;
enum AML_EXT_POWER_RES_OP = 0x84;
enum AML_EXT_THERMAL_ZONE_OP = 0x85;
enum AML_EXT_INDEX_FIELD_OP = 0x86;
enum AML_EXT_BANK_FIELD_OP = 0x87;
enum AML_EXT_DATA_REGION_OP = 0x88;
