Content-Type: multipart/mixed; boundary="===============7853471357717867473=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 67bb8e999e ("x86/mm: Disable various instrumentations of .."): BUG: -1 unexpected failures (out of 262) - debugging disabled! |
Date: Tue, 31 Oct 2017 22:43:14 +0100
Message-ID: <20171031214314.fjlu7zqqdksnlysf@wfg-t540p.sh.intel.com>
In-Reply-To: <452160a8-9a8a-574b-aaed-aa748b50e4e1@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7853471357717867473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2017 at 10:09:44AM -0500, Tom Lendacky wrote:
>On 10/29/2017 8:39 PM, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> commit 67bb8e999e0aeac285d22f0e53c856b9df5282c6
>> Author:     Tom Lendacky <thomas.lendacky@amd.com>
>> AuthorDate: Tue Oct 10 14:45:04 2017 -0500
>> Commit:     Ingo Molnar <mingo@kernel.org>
>> CommitDate: Wed Oct 11 17:22:59 2017 +0200
>>
>
>So this patch just allows the boot to continue where it previously was not
>able to continue.  The config has KCOV and FUNCTION_TRACER/STACK_TRACER
>enabled which causes issues with the early boot code in mm/mem_encrypt.c.
>
>If there is an issue that is being hidden by these config options, then
>performing a bisect without those settings may help identify the real
>issue.

Yeah sorry for the noise! The exposed bug:

>> [    0.003333] BUG:  -1 unexpected failures (out of 262) - debugging dis=
abled! |

looks very similar to the one triggered by

        commit d82fed75294229abc9d757f08a4817febae6c4f4
        Author:     Peter Zijlstra <peterz@infradead.org>
        AuthorDate: Mon Aug 28 14:42:45 2017 +0200
        Commit:     Ingo Molnar <mingo@kernel.org>
        CommitDate: Tue Aug 29 15:15:17 2017 +0200

            locking/lockdep/selftests: Fix mixed read-write ABBA tests

which should have been fixed in latest mainline kernel.

Thanks,
Fengguang

[...]

>>
>> ab7ff471aa  x86/hyperv: Fix hypercalls with extended CPU ranges for TLB =
flushing
>> 67bb8e999e  x86/mm: Disable various instrumentations of mm/mem_encrypt.c=
 and mm/tlb.c
>> 19e12196da  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
>> 36ef71cae3  Add linux-next specific files for 20171018
>> +-----------------------------------------------------------------------=
---------------+------------+------------+------------+---------------+
>> |                                                                       =
               | ab7ff471aa | 67bb8e999e | 19e12196da | next-20171018 |
>> +-----------------------------------------------------------------------=
---------------+------------+------------+------------+---------------+
>> | boot_successes                                                        =
               | 3          | 0          | 2          | 10            |
>> | boot_failures                                                         =
               | 761        | 42         | 201        | 77            |
>> | BUG:kernel_reboot-without-warning_in_early-boot_stage,last_printk:Boot=
ing_the_kernel | 760        |            |            |               |
>> | BUG:kernel_reboot-without-warning_in_test_stage                       =
               | 1          |            |            |               |
>> | BUG:-#unexpected_failures(out_of#)-debugging_disabled!|               =
               | 0          | 42         |            |               |
>> | BUG:kernel_hang_in_test_stage                                         =
               | 0          | 42         | 200        | 77            |
>> | WARNING:at_kernel/events/core.c:#perf_swevent_add                     =
               | 0          | 1          | 10         | 1             |
>> +-----------------------------------------------------------------------=
---------------+------------+------------+------------+---------------+
>>
>> [    0.003333]                           context:failed|  ok  |  ok  |
>> [    0.003333]                               try:failed|  ok  |failed|
>> [    0.003333]                             block:failed|  ok  |failed|
>> [    0.003333]                          spinlock:failed|  ok  |failed|
>> [    0.003333] ---------------------------------------------------------=
--------
>> [    0.003333] BUG:  -1 unexpected failures (out of 262) - debugging dis=
abled! |
>> [    0.003333] ---------------------------------------------------------=
--------
>> [    0.003333] ODEBUG: selftest passed
>> [    0.003333] clocksource: hpet: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 19112604467 ns
>> [    0.003333] hpet clockevent registered
>> [    0.003345] tsc: Detected 2926.328 MHz processor
>>
>>                                                            # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start bb176f67090ca54869fc1262c913aa69d2ede070 v4.13 --
>> git bisect good 820bf5c419e4b85298e5c3001bd1b5be46d60765  # 21:42  G    =
 38     0    6   6  Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi
>> git bisect good 9c0c1adab6024ab7222333ead95c57ca60f39f6f  # 21:53  G    =
 38     0   38  40  Merge tag 'drm-fixes-for-v4.14-rc4' of git://people.fre=
edesktop.org/~airlied/linux
>> git bisect good 9aa0d2dde6ebd14e9d16e28081a24721d5b41cc8  # 22:29  G    =
 38     0   38  38  Merge tag 'drm-fixes-for-v4.14-rc5' of git://people.fre=
edesktop.org/~airlied/linux
>> git bisect  bad 27fdb35fe99011d86bcc54f62fe84712c53f4d05  # 23:11  B    =
  6     3    6   7  doc: Fix various RCU docbook comment-header problems
>> git bisect  bad 33d930e59a98fa10a0db9f56c7fa2f21a4aef9b9  # 23:12  B    =
  0     1   15   1  Linux 4.14-rc5
>> git bisect good 7b764cedcb1a04e795795dd0fa38570467583be3  # 23:33  G    =
 35     0   33  33  Merge branch 'ras-urgent-for-linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip
>> git bisect  bad 7a23c5abb930cefcef85df6dc0c8fb3e8961980c  # 00:08  B    =
  8     5    8   8  Merge tag 'dmaengine-fix-4.14-rc5' of git://git.infrade=
ad.org/users/vkoul/slave-dma
>> git bisect good a339b351304d5e6b02c7cf8eed895d181e64bce0  # 00:31  G    =
 38     0   10  13  Merge branch 'sched-urgent-for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/tip/tip
>> git bisect  bad e7a36a6ec9cf1b60273e48ee980b8920f333bd4d  # 01:06  B    =
  8     5    8   9  Merge branch 'x86-urgent-for-linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip
>> git bisect good d4a2d031dd42f9594107d317e2a9a0c6d73ad46b  # 01:30  G    =
 36     0   26  28  x86/unwind: Disable unwinder warnings on 32-bit
>> git bisect  bad 67bb8e999e0aeac285d22f0e53c856b9df5282c6  # 02:05  B    =
 12     1   12  12  x86/mm: Disable various instrumentations of mm/mem_encr=
ypt.c and mm/tlb.c
>> git bisect good 60d73a7c96601434dfdb56d5b9167ff3b850d8d7  # 03:04  G    =
195     0  195 195  x86/hyperv: Don't use percpu areas for pcpu_flush/pcpu_=
flush_ex structures
>> git bisect good ab7ff471aa5db670197070760f022622793da7e5  # 03:23  G    =
188     0  188 190  x86/hyperv: Fix hypercalls with extended CPU ranges for=
 TLB flushing
>> # first bad commit: [67bb8e999e0aeac285d22f0e53c856b9df5282c6] x86/mm: D=
isable various instrumentations of mm/mem_encrypt.c and mm/tlb.c
>> git bisect good ab7ff471aa5db670197070760f022622793da7e5  # 03:55  G    =
561     0  560 750  x86/hyperv: Fix hypercalls with extended CPU ranges for=
 TLB flushing
>> # extra tests with CONFIG_DEBUG_INFO_REDUCED
>> git bisect  bad 67bb8e999e0aeac285d22f0e53c856b9df5282c6  # 04:40  B    =
 26    19   26  26  x86/mm: Disable various instrumentations of mm/mem_encr=
ypt.c and mm/tlb.c
>> # extra tests on HEAD of linux-devel/devel-hourly-2017102915
>> git bisect  bad 75c176ba09dee0b693e5f63442b2c96315799cc1  # 04:40  B    =
  0     2   28  10  0day head guard for 'devel-hourly-2017102915'
>> # extra tests on tree/branch linus/master
>> git bisect  bad 19e12196da601f7b80b5639adbcecf60fae13389  # 06:25  B    =
 10     1   10  16  Merge git://git.kernel.org/pub/scm/linux/kernel/git/dav=
em/net
>> # extra tests with first bad commit reverted
>> git bisect good 191d249fb18624fb43bf27b4105b081db434d721  # 08:20  G    =
187     0  187 187  Revert "x86/mm: Disable various instrumentations of mm/=
mem_encrypt.c and mm/tlb.c"
>> # extra tests on tree/branch linux-next/master
>> git bisect  bad 36ef71cae353f88fd6e095e2aaa3e5953af1685d  # 09:27  B    =
 28     1   28  28  Add linux-next specific files for 20171018
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation
>>
>

--===============7853471357717867473==--

