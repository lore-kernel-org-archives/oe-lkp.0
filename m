Content-Type: multipart/mixed; boundary="===============9069868520299215441=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [ACPICA] 174cc7187e: kmsg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thread[#](#/utmutex-#)
Date: Mon, 16 Jan 2017 09:57:27 +0800
Message-ID: <20170116015727.GH690@yexl-desktop>
In-Reply-To: <1AE640813FDE7649BE1B193DEA596E886CE2ABF9@SHSMSX101.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9069868520299215441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/12, Zheng, Lv wrote:
>Hi, Xiaolong
>
>> From: Ye, Xiaolong
>> Subject: Re: [lkp-developer] [ACPICA] 174cc7187e:
>> kmsg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thread[#]=
(#/utmutex-#)
>> =

>> On 01/12, Zheng, Lv wrote:
>> >Hi, Xiaolong
>> >
>> >My internal tree on bee:
>> >ssh://bee.sh.intel.com/git/zetalog/linux-acpica.git
>> >Can it be added to phoronix?
>
>The commit in question has nothing to do with MTX_TABLE mutex inside of AC=
PICA.
>And the error quite looks like an old issue we've fixed in 4.9-rcs.
>
>> =

>> Just noticed you tree has been added to lkp monitor list before:
>> =

>> $ cat repo/linux-intel/internal-acpica
>> url: git://bee.sh.intel.com/git/zetalog/linux-acpica.git
>> belongs_to: ACPI
>
>And the commit is rebased in one of the branches on this internal test tre=
e.
>Can you boot a latest kernel to see if the error message is still there?
>

Sorry for the late.

Seems this error persists in dmesg/kmsg of v4.10-rc1, here is the comparison

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/need_x/rootfs/tbox_group/test/testcase:
  gcc-6/performance/x86_64-rhel-7.2/true/debian-full-x86_64/lkp-ne02/jxrend=
ermark-1.2.0/phoronix-test-suite

commit: =

  5a6e7ec3bfef2ea518061d8d5d77367952770efb (parent commit of 174cc71)
  174cc7187e6f088942c8e74daa7baff7b44b33c9
  v4.10-rc1

5a6e7ec3bfef2ea5 174cc7187e6f088942c8e74daa                  v4.10-rc1 =

---------------- -------------------------- -------------------------- =

       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |    =

          1:18          -6%            :18           0%           1:12    l=
ast_state.is_incomplete_run
           :18           0%            :18          61%          11:12    d=
mesg.ACPI_Error:Mutex[#]is_not_acquired,cannot_release(#/utmutex-#)
           :18           0%            :18          61%          11:12    d=
mesg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thread[#](#/=
utmutex-#)
           :18         100%          18:18           6%           1:12    k=
msg.ACPI_Error:Mutex[#]is_not_acquired,cannot_release(#/utmutex-#)
           :18         100%          18:18           6%           1:12    k=
msg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thread[#](#/u=
tmutex-#)
          3:18          -6%           2:18         -17%            :12    k=
msg.DHCP/BOOTP:Reply_not_for_us_on_eth#,op[#]xid[#]
           :18           0%            :18          61%          11:12    k=
msg.ipmi_si_ipmi_si.#:Interface_detection_failed


Thanks,
Xiaolong

>Thanks
>Lv
>
>> =

>> =

>> >
>> >Thanks
>> >Lv
>> >
>> >> -----Original Message-----
>> >> From: Ye, Xiaolong
>> >> Sent: Thursday, January 12, 2017 2:00 PM
>> >> To: Zheng, Lv <lv.zheng@intel.com>
>> >> Cc: Wysocki, Rafael J <rafael.j.wysocki@intel.com>; Moore, Robert <=
robert.moore@intel.com>; LKML
>> >> <linux-kernel@vger.kernel.org>; Linus Torvalds <torvalds@linux-fo=
undation.org>; lkp(a)01.org
>> >> Subject: Re: [lkp-developer] [ACPICA] 174cc7187e:
>> >> kmsg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thread=
[#](#/utmutex-#)
>> >>
>> >> Hi, Lv
>> >>
>> >> On 01/12, Zheng, Lv wrote:
>> >> >Hi, Xiaolong
>> >> >
>> >> >I noticed the tested version in your the test dmesg: Linux version 4=
.9.0-rc5
>> >> >While the commit bisected should be in v4.10-rc1.
>> >> >Does that mean your test tree doesn't contain some basic lock fixes?
>> >>
>> >> The reported kernel version is Linux version 4.9.0-rc5-00017-g174cc71=
 which means
>> >> commit 174cc7187e is the head commit to be built.
>> >>
>> >> Thanks,
>> >> Xiaolong
>> >>
>> >> >
>> >> >Thanks and best regards
>> >> >Lv
>> >> >
>> >> >> From: lkp-developer-request(a)eclists.intel.com [mailto:lkp-develo=
per-request(a)eclists.intel.com]
>> On
>> >> >> Behalf Of Ye, Xiaolong
>> >> >> Subject: [lkp-developer] [ACPICA] 174cc7187e:
>> >> >> kmsg.ACPI_Error:Mutex[ACPI_MTX_Tables]already_acquired_by_this_thr=
ead[#](#/utmutex-#)
>> >> >>
>> >> >>
>> >> >> FYI, we noticed the following commit:
>> >> >>
>> >> >> commit: 174cc7187e6f088942c8e74daa7baff7b44b33c9 ("ACPICA: Tables:=
 Back port
>> >> acpi_get_table_with_size()
>> >> >> and early_acpi_os_unmap_memory() from Linux kernel")
>> >> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 master
>> >> >>
>> >> >> in testcase: phoronix-test-suite
>> >> >> with following parameters:
>> >> >>
>> >> >> 	need_x: true
>> >> >> 	test: jxrendermark-1.2.0
>> >> >> 	cpufreq_governor: performance
>> >> >>
>> >> >> test-description: The Phoronix Test Suite is the most comprehensiv=
e testing and benchmarking
>> >> platform
>> >> >> available that provides an extensible framework for which new test=
s can be easily added.
>> >> >> test-url: http://www.phoronix-test-suite.com/
>> >> >>
>> >> >>
>> >> >> on test machine: 16 threads Nehalem-EP with 16G memory
>> >> >>
>> >> >> caused below changes:
>> >> >>
>> >> >>
>> >> >> [    2.043693] ACPI Error: Mutex [ACPI_MTX_Tables] already acquire=
d by this thread [497483776]
>> >> >> (20160930/utmutex-254)
>> >> >> [    2.054084] ACPI Error: Mutex [0x2] is not acquired, cannot rel=
ease (20160930/utmutex-326)
>> >> >>
>> >> >> To reproduce:
>> >> >>
>> >> >>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wf=
g/lkp-tests.git
>> >> >>         cd lkp-tests
>> >> >>         bin/lkp install job.yaml  # job file is attached in this e=
mail
>> >> >>         bin/lkp run     job.yaml
>> >> >>
>> >> >>
>> >> >>
>> >> >> Thanks,
>> >> >> Xiaolong

--===============9069868520299215441==--

