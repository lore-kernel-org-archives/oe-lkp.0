Content-Type: multipart/mixed; boundary="===============1921554528916552814=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rjw@rjwysocki.net>
To: lkp@lists.01.org
Subject: Re: [ACPI] 7494b07eba: Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
Date: Fri, 09 Oct 2015 23:02:02 +0200
Message-ID: <6420944.JWV5li10OE@vostro.rjw.lan>
In-Reply-To: <5616F69C.9080900@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1921554528916552814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday, October 08, 2015 05:05:00 PM Al Stone wrote:
> On 10/08/2015 04:50 PM, Rafael J. Wysocki wrote:
> > On Thursday, October 08, 2015 02:32:15 PM Al Stone wrote:
> >> On 10/08/2015 02:41 PM, Rafael J. Wysocki wrote:
> >>> On Thursday, October 08, 2015 10:37:55 PM Rafael J. Wysocki wrote:
> >>>> On Thursday, October 08, 2015 10:36:40 AM Al Stone wrote:
> >>>>> On 10/08/2015 05:44 AM, Hanjun Guo wrote:
> >>>>>> On 10/08/2015 11:21 AM, kernel test robot wrote:
> >>>>>>> FYI, we noticed the below changes on
> >>>>>>>
> >>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> >>>>>>> commit 7494b07ebaae2117629024369365f7be7adc16c3 ("ACPI: add in a
> >>>>>>> bad_madt_entry() function to eventually replace the macro")
> >>>>>>>
> >>>>>>> [    0.000000] ACPI: undefined MADT subtable type for FADT 4.0: 1=
27 (length 12)
> >>>>>>
> >>>>>> Seems that the MADT table contains reserved subtable type (0x7F),
> >>>>>> so this is traded as a wrong type in our patch.
> >>>>>>
> >>>>>>> [    0.000000] ACPI: Error parsing LAPIC address override entry
> >>>>>>
> >>>>>> This was called by early_acpi_parse_madt_lapic_addr_ovr() in
> >>>>>> arch/x86/kernel/acpi/boot.c, which is scanning MADT for the first
> >>>>>> time when booting, so it will fail the boot process when finding
> >>>>>> the reserved MADT subtable type.
> >>>>>>
> >>>>>>> [    0.000000] ACPI: Invalid BIOS MADT, disabling ACPI
> >>>>>>
> >>>>>> As the spec said in Table 5-46 (ACPI 6.0):
> >>>>>>
> >>>>>> 0x10-0x7F Reserved. OSPM skips structures of the reserved type.
> >>>>>>
> >>>>>> Should we just ignore those reserved type when scanning the MADT
> >>>>>> table? In the patch "ACPI: add in a bad_madt_entry() function to
> >>>>>> eventually replace the macro", we just trade it as wrong, that's
> >>>>>> why we failed to boot the system.
> >>>>>>
> >>>>>> Thanks
> >>>>>> Hanjun
> >>>>>
> >>>>> Arrgh.  This is why people get frustrated with ACPI.  The spec is
> >>>>> saying that those sub-table types are reserved -- implying they can
> >>>>> and probably will be used for something else in the future -- but
> >>>>> then vendors are shipping firmware that uses those reserved values,
> >>>>> and an OS *expects* them to be used, and there is *no* documentation
> >>>>> of it other than a kernel workaround.
> >>>>>
> >>>>> So yet again, technically this MADT subtable *is* wrong, and someone
> >>>>> should slap the vendor for doing this.  But, the practical side of
> >>>>> this is that we now have to workaround what is now a known violation
> >>>>> of the spec.
> >>>>>
> >>>>> The more ACPI allows this kind of nonsense, the less usable it will
> >>>>> become.
> >>>>
> >>>> Linux Kernel Developer's First Rule: You shall not break setups that
> >>>> worked previously, even if they worked by accident.
> >>>>
> >>>> IOW, if something booted and your commit made it not boot any more, =
it counts
> >>>> as a regression and needs to be modified or reverted.
> >>>
> >>> Moreover, if the firmware in question shipped in a product, we have n=
o choice
> >>> but to work around bugs in it.  Doing otherwise would be refusing to =
support
> >>> our users and not the vendor of the systems they were unfortunate eno=
ugh to
> >>> acquire.
> >>>
> >>> Thanks,
> >>> Rafael
> >>>
> >>
> >> Yup, understood and agreed.  I have no issue at all with the First Rul=
e.
> >>
> >> What I have an issue with is all the exceptions to the standards -- and
> >> primarily the unknown ones -- that exist with ACPI (or any other stand=
ard,
> >> mind you), independent of any OS.
> > =

> > Well, one can argue that stadards are not what is written in specificat=
ions,
> > but what is done in practice by everybody.  If a specification does not=
 agree
> > with the common practice, there is a problem with it, not with the prac=
tice.
> =

> True.  That is the other side of it.  How rampant is this particular prob=
lem,
> though?  Does everyone and their uncle use some reserved MADT subtable ID=
 value
> in their firmware?  This is the first time I've personally seen this, but=
 then
> I haven't been looking for it until now.

Well, that depends on whether or not the OS the firmware was tested against
contained checks that would catch the problem and make it complain.  We don=
't
have them without your patch, but do other OSes have them?  If they don't
either, quite a lot of stuff like that may be expected to have gone to user=
s.

It only takes one reference firmware containing bugs like those to make them
quite widespread.

> >> It's just like driving a car.  I will (and do) grumble at people when =
they
> >> break the rules.  On the other hand, I'm not going to crash into them =
even
> >> if they are at fault.  When the ACPI spec gets twisted around, I'm goi=
ng
> >> to say something about it; just the same, I am not going to break their
> >> system if it already works.
> > =

> > OK
> > =

> > So IMO there are two things we can do.  First, try to update the spec to
> > reflect the reality where needed.  Second, having done that, add approp=
riate
> > checks to a firmware test suite and make it scream bloody murder every =
time
> > they trigger.  It also may be a good idea to print warnings into the ke=
rnel
> > buffer for them.
> > =

> =

> Agreed.  The patch below uses pr_err() for arm64, as the maintainers wish=
, and
> flags with pr_warn() any such uses on other architectures; this should fi=
x the
> regression.
> =

> In the meantime, I'll poke the spec folks on the use of reserved subtable=
 IDs
> in the MADT and see what the consensus is there.  It may just be a matter=
 of
> clarifying the language in the spec.

One additional question to ask is what checks have been present in the OSes
and what they do if they see a reserved MADT subtable ID.  If they haven't =
been
doing anything so far, I'm afraid this particular train may be gone already.

> It's also on my plate to really dig into an ACPI test suite and see about
> building something really robust for that -- this can be added as an exam=
ple.
> I'll see if I have time to send in a patch for FWTS, too, which is pretty
> good about capturing such things.

Sounds good!

Thanks,
Rafael


--===============1921554528916552814==--

