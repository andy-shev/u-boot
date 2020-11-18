// SPDX-License-Identifier: GPL-2.0+
#include <common.h>
#include <init.h>

#include <asm/pmu.h>
#include <asm/u-boot-x86.h>

/* List of Intel Tangier LSSs */
#define PMU_LSS_TANGIER_SDIO0_01	1

int board_early_init_r(void)
{
	pmu_turn_power(PMU_LSS_TANGIER_SDIO0_01, true);
	return 0;
}
