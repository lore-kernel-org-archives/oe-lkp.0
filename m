Content-Type: multipart/mixed; boundary="===============0986279750559799677=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [x86/time] 03fa63cc96: ACPI_Error:Table[DMAR]is_not_invalidated_during_early_boot_stage(#/tbxface -#)
Date: Fri, 07 Jul 2017 10:39:10 +0800
Message-ID: <1802eca6-9956-8287-40ea-55654bc0cba8@cn.fujitsu.com>
In-Reply-To: <20170707015445.GG5222@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0986279750559799677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi xiaolong,

Really thanks for your testing.

At 07/07/2017 09:54 AM, Ye Xiaolong wrote:
> On 07/06, Thomas Gleixner wrote:
>> On Thu, 6 Jul 2017, kernel test robot wrote:
>>
>>> commit: 03fa63cc96ab35592e0a7d522b8edbc1e6b02d22 ("x86/time: Initialize=
 interrupt mode behind timer init")
>>
>>> +----------------+------------+------------+
>>> |                | 43436935b7 | 03fa63cc96 |
>>> +----------------+------------+------------+
>>> | boot_successes | 0          | 4          |
>>> +----------------+------------+------------+
>>
>> So 03fa63cc96 makes the box boot again. I'm confused as usual by the
>> output of this tool.,
>>
>>> kern  :info  : [    0.005000] tsc: Fast TSC calibration using PIT
>>> kern  :info  : [    0.006000] tsc: Detected 2195.020 MHz processor
>>> kern  :info  : [    0.007000] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 4390.04 BogoMIPS (lpj=3D2195020)
>>> kern  :info  : [    0.008001] pid_max: default: 90112 minimum: 704
>>> kern  :info  : [    0.009037] ACPI: Core revision 20170303
>>> kern  :err   : [    0.010002] ACPI Error: Table [DMAR] is not invalidat=
ed during early boot stage (20170303/tbxface-193)
>>
>> Sure we have a error message here, but compared to what? Compared to
>> something which does not boot at all?
>
> Sorry for the confusion, here commit 43436935b7 boot failed due to OOM wh=
ich
> happened at the late stage of kernel boot while the ACPI error showed at =
the
> early boot stage for commit 03fa63cc96 and it didn't appear in 43436935b7=
's
> dmesg.
>

let's make the problem clearly firstly:

1) Commit 43436935b7 ("x86/xen: Bypass intr mode setup in enlighten_pv
system") made kernel boot failed, which caused by OOM.

2) Commit 03fa63cc96 ("x86/time: Initialize interrupt mode behind timer =

init") can make the kernel boot success again, but with an ACPI error =

happened.

And both *1* and *2* used the same configuration showed in the
attachment.

Does anything I missed?

Thanks,

	dou.

> Thanks,
> Xiaolong
>
>>
>> Thanks,
>>
>> 	tglx
>>
>
>
>



--===============0986279750559799677==--

