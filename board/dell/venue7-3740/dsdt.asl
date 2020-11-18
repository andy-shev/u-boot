/* SPDX-License-Identifier: GPL-2.0+ */

DefinitionBlock("dsdt.aml", "DSDT", 2, "U-BOOT", "U-BOOTBL", 0x00010000)
{
	/* platform specific */
	#include <asm/arch/acpi/platform.asl>
}
