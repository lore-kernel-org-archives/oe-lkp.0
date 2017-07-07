Content-Type: multipart/mixed; boundary="===============9053977930218072957=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [x86/time] 03fa63cc96: ACPI_Error:Table[DMAR]is_not_invalidated_during_early_boot_stage(#/tbxface -#)
Date: Fri, 07 Jul 2017 12:46:38 +0800
Message-ID: <f0e8f0b3-9dcb-029c-68a1-4b60f06d480b@cn.fujitsu.com>
In-Reply-To: <20170707030414.GJ5222@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============9053977930218072957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

At 07/07/2017 11:04 AM, Ye Xiaolong wrote:
> On 07/07, Dou Liyang wrote:
>> Hi xiaolong,
>>
>> Really thanks for your testing.
>>
>> At 07/07/2017 09:54 AM, Ye Xiaolong wrote:
>>> On 07/06, Thomas Gleixner wrote:
>>>> On Thu, 6 Jul 2017, kernel test robot wrote:
>>>>
>>>>> commit: 03fa63cc96ab35592e0a7d522b8edbc1e6b02d22 ("x86/time: Initiali=
ze interrupt mode behind timer init")
>>>>
>>>>> +----------------+------------+------------+
>>>>> |                | 43436935b7 | 03fa63cc96 |
>>>>> +----------------+------------+------------+
>>>>> | boot_successes | 0          | 4          |
>>>>> +----------------+------------+------------+
>>>>
>>>> So 03fa63cc96 makes the box boot again. I'm confused as usual by the
>>>> output of this tool.,
>>>>
>>>>> kern  :info  : [    0.005000] tsc: Fast TSC calibration using PIT
>>>>> kern  :info  : [    0.006000] tsc: Detected 2195.020 MHz processor
>>>>> kern  :info  : [    0.007000] Calibrating delay loop (skipped), value=
 calculated using timer frequency.. 4390.04 BogoMIPS (lpj=3D2195020)
>>>>> kern  :info  : [    0.008001] pid_max: default: 90112 minimum: 704
>>>>> kern  :info  : [    0.009037] ACPI: Core revision 20170303
>>>>> kern  :err   : [    0.010002] ACPI Error: Table [DMAR] is not invalid=
ated during early boot stage (20170303/tbxface-193)
>>>>
>>>> Sure we have a error message here, but compared to what? Compared to
>>>> something which does not boot at all?
>>>
>>> Sorry for the confusion, here commit 43436935b7 boot failed due to OOM =
which
>>> happened at the late stage of kernel boot while the ACPI error showed a=
t the
>>> early boot stage for commit 03fa63cc96 and it didn't appear in 43436935=
b7's
>>> dmesg.
>>>
>>
>> let's make the problem clearly firstly:
>>
>> 1) Commit 43436935b7 ("x86/xen: Bypass intr mode setup in enlighten_pv
>> system") made kernel boot failed, which caused by OOM.
>>

It is so interesting!

This patch only work for XEN in pv mode, if we boot a kernel w/o XEN,
it will not work in fact.


>> 2) Commit 03fa63cc96 ("x86/time: Initialize interrupt mode behind
>> timer init") can make the kernel boot success again, but with an ACPI
>> error happened.

Indeed, the ACPI Error appeared with this patch.

If x2apic is enabled in x86-64, initializing interrupt mode contains
irq remapping setup and the ACPI DMAR table initialization.

default_setup_apic_routing()
   enable_IR_x2apic()
     irq_remapping_prepare()
       intel_prepare_irq_remapping()
         dmar_table_init()

this patch make interrupt mode setup before acpi_early_init() which has
the check of ACPI table state in acpi_reallocate_root_table() where the
ACPI Error generated.

I have got a machine which supports x2apic. I am tracking the code,
try to find out more.

Thanks,

	dou.
>>
>> And both *1* and *2* used the same configuration showed in the
>> attachment.
>>
>> Does anything I missed?
>
> Yes, this is exactly what I meant.
>
> Thanks,
> Xiaolong
>>
>> Thanks,
>>
>> 	dou.
>>
>>> Thanks,
>>> Xiaolong
>>>
>>>>
>>>> Thanks,
>>>>
>>>> 	tglx
>>>>
>>>
>>>
>>>
>>
>>
>
>
>



--===============9053977930218072957==--

