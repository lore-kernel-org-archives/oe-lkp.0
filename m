Content-Type: multipart/mixed; boundary="===============5690095180054540694=="
MIME-Version: 1.0
From: Al Stone <al.stone@linaro.org>
To: lkp@lists.01.org
Subject: Re: [ACPI] 7494b07eba: Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
Date: Thu, 08 Oct 2015 10:36:40 -0600
Message-ID: <56169B98.3070105@linaro.org>
In-Reply-To: <56165701.90402@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5690095180054540694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 05:44 AM, Hanjun Guo wrote:
> On 10/08/2015 11:21 AM, kernel test robot wrote:
>> FYI, we noticed the below changes on
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit 7494b07ebaae2117629024369365f7be7adc16c3 ("ACPI: add in a
>> bad_madt_entry() function to eventually replace the macro")
>>
>> [    0.000000] ACPI: undefined MADT subtable type for FADT 4.0: 127 (len=
gth 12)
> =

> Seems that the MADT table contains reserved subtable type (0x7F),
> so this is traded as a wrong type in our patch.
> =

>> [    0.000000] ACPI: Error parsing LAPIC address override entry
> =

> This was called by early_acpi_parse_madt_lapic_addr_ovr() in
> arch/x86/kernel/acpi/boot.c, which is scanning MADT for the first
> time when booting, so it will fail the boot process when finding
> the reserved MADT subtable type.
> =

>> [    0.000000] ACPI: Invalid BIOS MADT, disabling ACPI
> =

> As the spec said in Table 5-46 (ACPI 6.0):
> =

> 0x10-0x7F Reserved. OSPM skips structures of the reserved type.
> =

> Should we just ignore those reserved type when scanning the MADT
> table? In the patch "ACPI: add in a bad_madt_entry() function to
> eventually replace the macro", we just trade it as wrong, that's
> why we failed to boot the system.
> =

> Thanks
> Hanjun

Arrgh.  This is why people get frustrated with ACPI.  The spec is
saying that those sub-table types are reserved -- implying they can
and probably will be used for something else in the future -- but
then vendors are shipping firmware that uses those reserved values,
and an OS *expects* them to be used, and there is *no* documentation
of it other than a kernel workaround.

So yet again, technically this MADT subtable *is* wrong, and someone
should slap the vendor for doing this.  But, the practical side of
this is that we now have to workaround what is now a known violation
of the spec.

The more ACPI allows this kind of nonsense, the less usable it will
become.

At a minimum, whoever is responsible for this firmware needs to make
sure the spec reflects what they are doing.  In the meantime, the
only option is what Hanjun suggests -- make this a warning and not a
failure.  I'll prepare a patch and attach it to a reply here in a few
minutes...


-- =

ciao,
al
-----------------------------------
Al Stone
Software Engineer
Linaro Enterprise Group
al.stone(a)linaro.org
-----------------------------------

--===============5690095180054540694==--

