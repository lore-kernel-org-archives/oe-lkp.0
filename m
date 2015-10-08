Content-Type: multipart/mixed; boundary="===============0491675464180697865=="
MIME-Version: 1.0
From: Hanjun Guo <hanjun.guo@linaro.org>
To: lkp@lists.01.org
Subject: Re: [ACPI] 7494b07eba: Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
Date: Thu, 08 Oct 2015 19:44:01 +0800
Message-ID: <56165701.90402@linaro.org>
In-Reply-To: <871td6xcxc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0491675464180697865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 11:21 AM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 7494b07ebaae2117629024369365f7be7adc16c3 ("ACPI: add in a bad_madt=
_entry() function to eventually replace the macro")
>
> [    0.000000] ACPI: undefined MADT subtable type for FADT 4.0: 127 (leng=
th 12)

Seems that the MADT table contains reserved subtable type (0x7F),
so this is traded as a wrong type in our patch.

> [    0.000000] ACPI: Error parsing LAPIC address override entry

This was called by early_acpi_parse_madt_lapic_addr_ovr() in
arch/x86/kernel/acpi/boot.c, which is scanning MADT for the first
time when booting, so it will fail the boot process when finding
the reserved MADT subtable type.

> [    0.000000] ACPI: Invalid BIOS MADT, disabling ACPI

As the spec said in Table 5-46 (ACPI 6.0):

0x10-0x7F Reserved. OSPM skips structures of the reserved type.

Should we just ignore those reserved type when scanning the MADT
table? In the patch "ACPI: add in a bad_madt_entry() function to
eventually replace the macro", we just trade it as wrong, that's
why we failed to boot the system.

Thanks
Hanjun

--===============0491675464180697865==--

