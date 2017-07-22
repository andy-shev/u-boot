/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (c) 2017 Intel Corporation
 *
 * Partially based on platform.asl for other x86 platforms
 */

#include <asm/acpi/statdef.asl>
#include <asm/arch/iomap.h>

/*
 * The _PTS method (Prepare To Sleep) is called before the OS is
 * entering a sleep state. The sleep state number is passed in Arg0.
 */
Method(_PTS, 1)
{
}

/* The _WAK method is called on system wakeup */
Method(_WAK, 1)
{
    Return (Package() { Zero, Zero })
}

Scope (\_SB)
{
    /* High Performance Event Timer */
    Device (HPET)
    {
        Name (_HID, EISAID("PNP0103"))
        Name (_UID, Zero)
        Name (_CRS, ResourceTemplate()
        {
            Memory32Fixed(ReadOnly, 0xFED00000, 0x00000400)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) { 8 }
        })

        Method (_STA)
        {
            Return (STA_VISIBLE)
        }
    }

    /* Real Time Clock */
    Device (RTC0)
    {
        Name (_HID, EisaId ("PNP0B00"))
        Name (_CRS, ResourceTemplate()
        {
            IO(Decode16, 0x70, 0x70, 0x01, 0x08)
        })
    }
}

/* ACPI global NVS */
#include "global_nvs.asl"

Scope (\_SB)
{
    #include "southcluster.asl"
}
