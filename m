Content-Type: multipart/mixed; boundary="===============8254015113868928548=="
MIME-Version: 1.0
From: Fengguang Wu <wfg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: e0a6d42673 ("Merge 'bvanassche/block-scsi-for-next' into .."): BUG: kernel reboot-without-warning in boot stage
Date: Tue, 16 Jan 2018 09:12:29 +0800
Message-ID: <20180116011229.gvzm2gvqhfy7zgle@wfg-t540p.sh.intel.com>
In-Reply-To: <1515791128.2396.53.camel@wdc.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8254015113868928548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Fri, Jan 12, 2018 at 09:05:29PM +0000, Bart Van Assche wrote:
>Hello Wu,
>
>I think the (very highly regarded) 0-day test infrastructure discovered a =
bug
>that was not introduced by my changes, namely a missing cond_resched() in =
the
>ACPI code. Do you have any recommendations about how to proceed? Should I =
try
>to send a fix upstream or should rather a suppression rule be added to the
>0-day test infrastructure?

It would be great if you can send a fix upstream. :)

Thanks,
Fengguang

>On Thu, 2018-01-11 at 20:49 +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> git://internal_merge_and_test_tree devel-catchup-201801111238
>>
>> commit e0a6d426732d59ac27faa38264d1d5effc4d6e16
>> Merge: ad52b48ef9782 248c2116badd8
>> Author:     0day robot <fengguang.wu@intel.com>
>> AuthorDate: Thu Jan 11 12:44:28 2018 +0800
>> Commit:     0day robot <fengguang.wu@intel.com>
>> CommitDate: Thu Jan 11 12:44:28 2018 +0800
>>
>>     Merge 'bvanassche/block-scsi-for-next' into devel-catchup-2018011112=
38
>>
>> ad52b48ef9  Merge 'char-misc/char-misc-next' into devel-catchup-20180111=
1238
>> 248c2116ba  scsi_debug: delay fix
>> e0a6d42673  Merge 'bvanassche/block-scsi-for-next' into devel-catchup-20=
1801111238
>> 6d7f285e89  0day head guard for 'devel-catchup-201801111238'
>> +-------------------------------------------------+------------+--------=
----+------------+------------+
>> >                                                 | ad52b48ef9 | 248c211=
6ba | e0a6d42673 | 6d7f285e89 |
>>
>> +-------------------------------------------------+------------+--------=
----+------------+------------+
>> > boot_successes                                  | 35         | 19     =
    | 0          | 0          |
>> > boot_failures                                   | 0          | 16     =
    | 15         | 13         |
>> > BUG:soft_lockup-CPU##stuck_for#s                | 0          | 15     =
    |            |            |
>> > RIP:_raw_spin_unlock_irqrestore                 | 0          | 5      =
    |            |            |
>> > Kernel_panic-not_syncing:softlockup:hung_tasks  | 0          | 15     =
    |            |            |
>> > RIP:__slab_alloc                                | 0          | 3      =
    |            |            |
>> > RIP:unwind_next_frame                           | 0          | 1      =
    |            |            |
>> > RIP:__orc_find                                  | 0          | 3      =
    |            |            |
>> > invoked_oom-killer:gfp_mask=3D0x                  | 0          | 1    =
      |            |            |
>> > Mem-Info                                        | 0          | 1      =
    |            |            |
>> > RIP:deref_stack_reg                             | 0          | 1      =
    |            |            |
>> > RIP:core_kernel_text                            | 0          | 1      =
    |            |            |
>> > RIP:save_stack_address                          | 0          | 1      =
    |            |            |
>> > BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 0      =
    | 15         | 11         |
>> > BUG:kernel_in_stage                             | 0          | 0      =
    | 0          | 2          |
>>
>> +-------------------------------------------------+------------+--------=
----+------------+------------+
>>
>> [    0.000000] ACPI: Early table checksum verification disabled
>> [    0.000000] ACPI: RSDP 0x00000000000F6840 000014 (v00 BOCHS )
>> [    0.000000] ACPI: RSDT 0x000000001FFE1628 000030 (v01 BOCHS  BXPCRSDT=
 00000001 BXPC 00000001)
>> [    0.000000] ACPI: FACP 0x000000001FFE147C 000074 (v01 BOCHS  BXPCFACP=
 00000001 BXPC 00000001)
>> [    0.000000] ACPI: DSDT 0x000000001FFE0040 00143C (v01 BOCHS  BXPCDSDT=
 00000001 BXPC 00000001)
>> BUG: kernel reboot-without-warning in boot stage
>>
>>
>>                                                           # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start 6d7f285e89e5d2c17dcdc0ae8609341e50a4a36d b4464bcab38d3f=
7fe995a7cb960eeac6889bec08 --
>> git bisect good 5d1c4e90360721485a929a52485c1f79658849ce  # 17:30  G    =
 10     0    0   0  Merge 'rcu/rcu/dev' into devel-catchup-201801111238
>> git bisect good 363e1cfac0ce9f8f9521dc9bd243d60d4aaf77d8  # 17:43  G    =
 11     0    1   1  Merge 'lunn/v4.15-rc4-net-next-atu-vtu-irq' into devel-=
catchup-201801111238
>> git bisect good 1c0e7171d00386de445a6a156ad12d53e9426e56  # 18:00  G    =
 11     0    1   1  Merge 'clk/clk-next' into devel-catchup-201801111238
>> git bisect  bad e0a6d426732d59ac27faa38264d1d5effc4d6e16  # 18:11  B    =
  0     6   19   0  Merge 'bvanassche/block-scsi-for-next' into devel-catch=
up-201801111238
>> git bisect good ad52b48ef978217409681ab72ba68734767c0746  # 18:33  G    =
 11     0    0   0  Merge 'char-misc/char-misc-next' into devel-catchup-201=
801111238
>> git bisect good ce30c6855578e134b371885c32737ea27e4b3949  # 18:50  G    =
 11     0    2   2  Merge branch 'scsi-target-for-next' into block-scsi-for=
-next
>> git bisect good e67ed2abbd49d4d0db4f38fd3619ae12f5ce0a20  # 19:06  G    =
 11     0    0   0  Merge branch 'srp-initiator-for-next' into block-scsi-f=
or-next
>> git bisect good 6385a09f5675e51effa844afdbaaa37404541c5a  # 19:24  G    =
 10     0    4   4  sd: Compute threshold only if needed
>> git bisect good 552be5f2e246810e1d07837cccf8243e886da507  # 19:36  G    =
 11     0    1   1  scsi_dh: Document alua_rtpg_queue() arguments
>> git bisect good ef499a8d64490bd3b70817d9b1d745dd8e3cd473  # 19:47  G    =
 11     0    1   1  PM / sleep: Make lock/unlock_system_sleep() available t=
o kernel modules
>> git bisect good a11e9f34115cce512f355ae1aef65582503a680d  # 20:00  G    =
 11     0    0   0  Merge branch 'scsi-for-next' into block-scsi-for-next
>> git bisect good 248c2116badd86d2736fc9ffd5cf99ef34976898  # 20:18  G    =
 10     0    0   0  scsi_debug: delay fix
>> # first bad commit: [e0a6d426732d59ac27faa38264d1d5effc4d6e16] Merge 'bv=
anassche/block-scsi-for-next' into devel-catchup-201801111238
>> git bisect good ad52b48ef978217409681ab72ba68734767c0746  # 20:24  G    =
 30     0    0   0  Merge 'char-misc/char-misc-next' into devel-catchup-201=
801111238
>> git bisect good 248c2116badd86d2736fc9ffd5cf99ef34976898  # 20:29  G    =
 31     0   16  16  scsi_debug: delay fix
>> # extra tests with debug options
>> git bisect  bad e0a6d426732d59ac27faa38264d1d5effc4d6e16  # 20:39  B    =
  0     2   15   0  Merge 'bvanassche/block-scsi-for-next' into devel-catch=
up-201801111238
>> # extra tests on HEAD of linux-devel/devel-catchup-201801111238
>> git bisect  bad 6d7f285e89e5d2c17dcdc0ae8609341e50a4a36d  # 20:44  B    =
  0    11   29   2  0day head guard for 'devel-catchup-201801111238'
>> # extra tests on tree/branch linux-devel/devel-catchup-201801111238
>> git bisect  bad 6d7f285e89e5d2c17dcdc0ae8609341e50a4a36d  # 20:49  B    =
  0    11   29   2  0day head guard for 'devel-catchup-201801111238'
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation

--===============8254015113868928548==--

