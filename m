Content-Type: multipart/mixed; boundary="===============4124465323288838259=="
MIME-Version: 1.0
From: Al Stone <al.stone@linaro.org>
To: lkp@lists.01.org
Subject: Re: [ACPI] 7494b07eba: Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
Date: Thu, 08 Oct 2015 14:32:15 -0600
Message-ID: <5616D2CF.80200@linaro.org>
In-Reply-To: <9591316.rZitHL3YIp@vostro.rjw.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============4124465323288838259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 02:41 PM, Rafael J. Wysocki wrote:
> On Thursday, October 08, 2015 10:37:55 PM Rafael J. Wysocki wrote:
>> On Thursday, October 08, 2015 10:36:40 AM Al Stone wrote:
>>> On 10/08/2015 05:44 AM, Hanjun Guo wrote:
>>>> On 10/08/2015 11:21 AM, kernel test robot wrote:
>>>>> FYI, we noticed the below changes on
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git m=
aster
>>>>> commit 7494b07ebaae2117629024369365f7be7adc16c3 ("ACPI: add in a
>>>>> bad_madt_entry() function to eventually replace the macro")
>>>>>
>>>>> [    0.000000] ACPI: undefined MADT subtable type for FADT 4.0: 127 (=
length 12)
>>>>
>>>> Seems that the MADT table contains reserved subtable type (0x7F),
>>>> so this is traded as a wrong type in our patch.
>>>>
>>>>> [    0.000000] ACPI: Error parsing LAPIC address override entry
>>>>
>>>> This was called by early_acpi_parse_madt_lapic_addr_ovr() in
>>>> arch/x86/kernel/acpi/boot.c, which is scanning MADT for the first
>>>> time when booting, so it will fail the boot process when finding
>>>> the reserved MADT subtable type.
>>>>
>>>>> [    0.000000] ACPI: Invalid BIOS MADT, disabling ACPI
>>>>
>>>> As the spec said in Table 5-46 (ACPI 6.0):
>>>>
>>>> 0x10-0x7F Reserved. OSPM skips structures of the reserved type.
>>>>
>>>> Should we just ignore those reserved type when scanning the MADT
>>>> table? In the patch "ACPI: add in a bad_madt_entry() function to
>>>> eventually replace the macro", we just trade it as wrong, that's
>>>> why we failed to boot the system.
>>>>
>>>> Thanks
>>>> Hanjun
>>>
>>> Arrgh.  This is why people get frustrated with ACPI.  The spec is
>>> saying that those sub-table types are reserved -- implying they can
>>> and probably will be used for something else in the future -- but
>>> then vendors are shipping firmware that uses those reserved values,
>>> and an OS *expects* them to be used, and there is *no* documentation
>>> of it other than a kernel workaround.
>>>
>>> So yet again, technically this MADT subtable *is* wrong, and someone
>>> should slap the vendor for doing this.  But, the practical side of
>>> this is that we now have to workaround what is now a known violation
>>> of the spec.
>>>
>>> The more ACPI allows this kind of nonsense, the less usable it will
>>> become.
>>
>> Linux Kernel Developer's First Rule: You shall not break setups that
>> worked previously, even if they worked by accident.
>>
>> IOW, if something booted and your commit made it not boot any more, it c=
ounts
>> as a regression and needs to be modified or reverted.
> =

> Moreover, if the firmware in question shipped in a product, we have no ch=
oice
> but to work around bugs in it.  Doing otherwise would be refusing to supp=
ort
> our users and not the vendor of the systems they were unfortunate enough =
to
> acquire.
> =

> Thanks,
> Rafael
> =


Yup, understood and agreed.  I have no issue at all with the First Rule.

What I have an issue with is all the exceptions to the standards -- and
primarily the unknown ones -- that exist with ACPI (or any other standard,
mind you), independent of any OS.

It's just like driving a car.  I will (and do) grumble at people when they
break the rules.  On the other hand, I'm not going to crash into them even
if they are at fault.  When the ACPI spec gets twisted around, I'm going
to say something about it; just the same, I am not going to break their
system if it already works.

/me goes back to testing his patch for this breakage....

-- =

ciao,
al
-----------------------------------
Al Stone
Software Engineer
Linaro Enterprise Group
al.stone(a)linaro.org
-----------------------------------

--===============4124465323288838259==--

