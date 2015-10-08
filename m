Content-Type: multipart/mixed; boundary="===============5379482705013122916=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rjw@rjwysocki.net>
To: lkp@lists.01.org
Subject: Re: [ACPI] 7494b07eba: Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
Date: Thu, 08 Oct 2015 22:41:33 +0200
Message-ID: <9591316.rZitHL3YIp@vostro.rjw.lan>
In-Reply-To: <2153324.tm1YTXhMTh@vostro.rjw.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============5379482705013122916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday, October 08, 2015 10:37:55 PM Rafael J. Wysocki wrote:
> On Thursday, October 08, 2015 10:36:40 AM Al Stone wrote:
> > On 10/08/2015 05:44 AM, Hanjun Guo wrote:
> > > On 10/08/2015 11:21 AM, kernel test robot wrote:
> > >> FYI, we noticed the below changes on
> > >>
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git =
master
> > >> commit 7494b07ebaae2117629024369365f7be7adc16c3 ("ACPI: add in a
> > >> bad_madt_entry() function to eventually replace the macro")
> > >>
> > >> [    0.000000] ACPI: undefined MADT subtable type for FADT 4.0: 127 =
(length 12)
> > > =

> > > Seems that the MADT table contains reserved subtable type (0x7F),
> > > so this is traded as a wrong type in our patch.
> > > =

> > >> [    0.000000] ACPI: Error parsing LAPIC address override entry
> > > =

> > > This was called by early_acpi_parse_madt_lapic_addr_ovr() in
> > > arch/x86/kernel/acpi/boot.c, which is scanning MADT for the first
> > > time when booting, so it will fail the boot process when finding
> > > the reserved MADT subtable type.
> > > =

> > >> [    0.000000] ACPI: Invalid BIOS MADT, disabling ACPI
> > > =

> > > As the spec said in Table 5-46 (ACPI 6.0):
> > > =

> > > 0x10-0x7F Reserved. OSPM skips structures of the reserved type.
> > > =

> > > Should we just ignore those reserved type when scanning the MADT
> > > table? In the patch "ACPI: add in a bad_madt_entry() function to
> > > eventually replace the macro", we just trade it as wrong, that's
> > > why we failed to boot the system.
> > > =

> > > Thanks
> > > Hanjun
> > =

> > Arrgh.  This is why people get frustrated with ACPI.  The spec is
> > saying that those sub-table types are reserved -- implying they can
> > and probably will be used for something else in the future -- but
> > then vendors are shipping firmware that uses those reserved values,
> > and an OS *expects* them to be used, and there is *no* documentation
> > of it other than a kernel workaround.
> > =

> > So yet again, technically this MADT subtable *is* wrong, and someone
> > should slap the vendor for doing this.  But, the practical side of
> > this is that we now have to workaround what is now a known violation
> > of the spec.
> > =

> > The more ACPI allows this kind of nonsense, the less usable it will
> > become.
> =

> Linux Kernel Developer's First Rule: You shall not break setups that
> worked previously, even if they worked by accident.
> =

> IOW, if something booted and your commit made it not boot any more, it co=
unts
> as a regression and needs to be modified or reverted.

Moreover, if the firmware in question shipped in a product, we have no choi=
ce
but to work around bugs in it.  Doing otherwise would be refusing to support
our users and not the vendor of the systems they were unfortunate enough to
acquire.

Thanks,
Rafael


--===============5379482705013122916==--

