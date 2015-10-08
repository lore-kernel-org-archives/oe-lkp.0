Content-Type: multipart/mixed; boundary="===============1107170726337310900=="
MIME-Version: 1.0
From: Al Stone <al.stone@linaro.org>
To: lkp@lists.01.org
Subject: Re: [ACPI] 7494b07eba: Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
Date: Thu, 08 Oct 2015 17:05:00 -0600
Message-ID: <5616F69C.9080900@linaro.org>
In-Reply-To: <4975068.hExdhgQqJN@vostro.rjw.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============1107170726337310900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 04:50 PM, Rafael J. Wysocki wrote:
> On Thursday, October 08, 2015 02:32:15 PM Al Stone wrote:
>> On 10/08/2015 02:41 PM, Rafael J. Wysocki wrote:
>>> On Thursday, October 08, 2015 10:37:55 PM Rafael J. Wysocki wrote:
>>>> On Thursday, October 08, 2015 10:36:40 AM Al Stone wrote:
>>>>> On 10/08/2015 05:44 AM, Hanjun Guo wrote:
>>>>>> On 10/08/2015 11:21 AM, kernel test robot wrote:
>>>>>>> FYI, we noticed the below changes on
>>>>>>>
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
>>>>>>> commit 7494b07ebaae2117629024369365f7be7adc16c3 ("ACPI: add in a
>>>>>>> bad_madt_entry() function to eventually replace the macro")
>>>>>>>
>>>>>>> [    0.000000] ACPI: undefined MADT subtable type for FADT 4.0: 127=
 (length 12)
>>>>>>
>>>>>> Seems that the MADT table contains reserved subtable type (0x7F),
>>>>>> so this is traded as a wrong type in our patch.
>>>>>>
>>>>>>> [    0.000000] ACPI: Error parsing LAPIC address override entry
>>>>>>
>>>>>> This was called by early_acpi_parse_madt_lapic_addr_ovr() in
>>>>>> arch/x86/kernel/acpi/boot.c, which is scanning MADT for the first
>>>>>> time when booting, so it will fail the boot process when finding
>>>>>> the reserved MADT subtable type.
>>>>>>
>>>>>>> [    0.000000] ACPI: Invalid BIOS MADT, disabling ACPI
>>>>>>
>>>>>> As the spec said in Table 5-46 (ACPI 6.0):
>>>>>>
>>>>>> 0x10-0x7F Reserved. OSPM skips structures of the reserved type.
>>>>>>
>>>>>> Should we just ignore those reserved type when scanning the MADT
>>>>>> table? In the patch "ACPI: add in a bad_madt_entry() function to
>>>>>> eventually replace the macro", we just trade it as wrong, that's
>>>>>> why we failed to boot the system.
>>>>>>
>>>>>> Thanks
>>>>>> Hanjun
>>>>>
>>>>> Arrgh.  This is why people get frustrated with ACPI.  The spec is
>>>>> saying that those sub-table types are reserved -- implying they can
>>>>> and probably will be used for something else in the future -- but
>>>>> then vendors are shipping firmware that uses those reserved values,
>>>>> and an OS *expects* them to be used, and there is *no* documentation
>>>>> of it other than a kernel workaround.
>>>>>
>>>>> So yet again, technically this MADT subtable *is* wrong, and someone
>>>>> should slap the vendor for doing this.  But, the practical side of
>>>>> this is that we now have to workaround what is now a known violation
>>>>> of the spec.
>>>>>
>>>>> The more ACPI allows this kind of nonsense, the less usable it will
>>>>> become.
>>>>
>>>> Linux Kernel Developer's First Rule: You shall not break setups that
>>>> worked previously, even if they worked by accident.
>>>>
>>>> IOW, if something booted and your commit made it not boot any more, it=
 counts
>>>> as a regression and needs to be modified or reverted.
>>>
>>> Moreover, if the firmware in question shipped in a product, we have no =
choice
>>> but to work around bugs in it.  Doing otherwise would be refusing to su=
pport
>>> our users and not the vendor of the systems they were unfortunate enoug=
h to
>>> acquire.
>>>
>>> Thanks,
>>> Rafael
>>>
>>
>> Yup, understood and agreed.  I have no issue at all with the First Rule.
>>
>> What I have an issue with is all the exceptions to the standards -- and
>> primarily the unknown ones -- that exist with ACPI (or any other standar=
d,
>> mind you), independent of any OS.
> =

> Well, one can argue that stadards are not what is written in specificatio=
ns,
> but what is done in practice by everybody.  If a specification does not a=
gree
> with the common practice, there is a problem with it, not with the practi=
ce.

True.  That is the other side of it.  How rampant is this particular proble=
m,
though?  Does everyone and their uncle use some reserved MADT subtable ID v=
alue
in their firmware?  This is the first time I've personally seen this, but t=
hen
I haven't been looking for it until now.

>> It's just like driving a car.  I will (and do) grumble at people when th=
ey
>> break the rules.  On the other hand, I'm not going to crash into them ev=
en
>> if they are at fault.  When the ACPI spec gets twisted around, I'm going
>> to say something about it; just the same, I am not going to break their
>> system if it already works.
> =

> OK
> =

> So IMO there are two things we can do.  First, try to update the spec to
> reflect the reality where needed.  Second, having done that, add appropri=
ate
> checks to a firmware test suite and make it scream bloody murder every ti=
me
> they trigger.  It also may be a good idea to print warnings into the kern=
el
> buffer for them.
> =

> Thanks,
> Rafael
> =


Agreed.  The patch below uses pr_err() for arm64, as the maintainers wish, =
and
flags with pr_warn() any such uses on other architectures; this should fix =
the
regression.

In the meantime, I'll poke the spec folks on the use of reserved subtable I=
Ds
in the MADT and see what the consensus is there.  It may just be a matter of
clarifying the language in the spec.

It's also on my plate to really dig into an ACPI test suite and see about
building something really robust for that -- this can be added as an exampl=
e.
I'll see if I have time to send in a patch for FWTS, too, which is pretty
good about capturing such things.

-- =

ciao,
al
-----------------------------------
Al Stone
Software Engineer
Linaro Enterprise Group
al.stone(a)linaro.org
-----------------------------------

>From 9ae1261f0c2f2ee87d45521579e3ce572692d2aa Mon Sep 17 00:00:00 2001
>From: Al Stone <ahs3@redhat.com>
>Date: Thu, 8 Oct 2015 16:20:53 -0600
>Subject: [PATCH] ACPI: fix regression where x86 firmware contains MADT
 reserved subtable IDs

Kernel testing uncovered a case where x86 firmware contained an MADT
subtable with a type of 0x7F.  This is a reserved value, and arguably
should not really be used; however, disallowing its use causes the
regression.

This patch allows bad_madt_entry() to let those cases slide if we're
not using an arm64 platform where we want stricter conformance to the
ACPI spec.

Signed-off-by: Al Stone <al.stone@linaro.org>
---
 drivers/acpi/tables.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index a2ed38a..a74b6fa 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -413,9 +413,15 @@ static int __init bad_madt_entry(struct acpi_table_hea=
der
*table,
 	}

 	if (entry->type >=3D ms->num_types) {
-		pr_err("undefined MADT subtable type for FADT %d.%d: %d (length %d)\n",
-		       major, minor, entry->type, entry->length);
-		return 1;
+		if (IS_ENABLED(CONFIG_ARM64)) {
+			pr_err("undefined MADT subtable type for FADT %d.%d: %d (length %d)\n",
+			       major, minor, entry->type, entry->length);
+			return 1;
+		} else {
+			pr_warn("firmware should not be using reserved MADT subtable type for F=
ADT
%d.%d: %d (length %d)\n",
+			        major, minor, entry->type, entry->length);
+			return 0;
+		}
 	}

 	/* verify that the table is allowed for this version of the spec */
-- =

2.4.3

--===============1107170726337310900==--

