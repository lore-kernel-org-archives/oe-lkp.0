Content-Type: multipart/mixed; boundary="===============5942229730554211627=="
MIME-Version: 1.0
From: Josh Boyer <jwboyer@fedoraproject.org>
To: lkp@lists.01.org
Subject: Re: [sched] [ INFO: suspicious RCU usage. ]
Date: Tue, 11 Nov 2014 08:39:53 -0500
Message-ID: <CA+5PVA7o5XFcz2NF_p3xJvVibBQbduoMa1sj60u8tLAivweF-w@mail.gmail.com>
In-Reply-To: <2127541415042898@web25h.yandex.ru>
List-Id: <oe-lkp.lists.linux.dev>

--===============5942229730554211627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2014 at 2:28 PM, Kirill Tkhai <tkhai@yandex.ru> wrote:
> Hi,
>
> the fix is already in PeterZ queue, it will go to mainline soon.

When is soon?  We're still carrying:

"sched: Remove lockdep check in sched_move_task()"

from you as a stand alone patch on top of Linus' tree in Fedora.  I
would have thought this would be in 3.18-rc4 already.

josh

>
> 03.11.2014, 17:54, "Fengguang Wu" <fengguang.wu@intel.com>:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> commit eeb61e53ea19be0c4015b00b2e8b3b2185436f2b
>> Author:     Kirill Tkhai <ktkhai@parallels.com>
>> AuthorDate: Mon Oct 27 14:18:25 2014 +0400
>> Commit:     Ingo Molnar <mingo@kernel.org>
>> CommitDate: Tue Oct 28 10:45:59 2014 +0100
>>
>>     sched: Fix race between task_group and sched_task_group
>>
>>     The race may happen when somebody is changing task_group of a forkin=
g task.
>>     Child's cgroup is the same as parent's after dup_task_struct() (ther=
e just
>>     memory copying). Also, cfs_rq and rt_rq are the same as parent's.
>>
>>     But if parent changes its task_group before it's called cgroup_post_=
fork(),
>>     we do not reflect this situation on child. Child's cfs_rq and rt_rq =
remain
>>     the same, while child's task_group changes in cgroup_post_fork().
>>
>>     To fix this we introduce fork() method, which calls sched_move_task(=
) directly.
>>     This function changes sched_task_group on appropriate (also its logi=
c has
>>     no problem with freshly created tasks, so we shouldn't introduce som=
ething
>>     special; we are able just to use it).
>>
>>     Possibly, this decides the Burke Libbey's problem: https://lkml.org/=
lkml/2014/10/24/456
>>
>>     Signed-off-by: Kirill Tkhai <ktkhai@parallels.com>
>>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>>     Link: http://lkml.kernel.org/r/1414405105.19914.169.camel(a)tkhai
>>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>
>> +------------------------------------------------+-----------+----------=
--+---------------+
>> |                                                | v3.18-rc2 | eeb61e53e=
a | next-20141031 |
>> +------------------------------------------------+-----------+----------=
--+---------------+
>> | boot_successes                                 | 60        | 0        =
  | 0             |
>> | boot_failures                                  | 0         | 20       =
  | 11            |
>> | INFO:suspicious_RCU_usage                      | 0         | 20       =
  | 11            |
>> | backtrace:do_fork                              | 0         | 20       =
  | 11            |
>> | WARNING:at_kernel/sched/core.c:__might_sleep() | 0         | 0        =
  | 11            |
>> | backtrace:rfcomm_run                           | 0         | 0        =
  | 11            |
>> | WARNING:CPU:#PID:#at/kbuild/src/smo            | 0         | 0        =
  | 1             |
>> | BUG:kernel_boot_hang                           | 0         | 0        =
  | 1             |
>> +------------------------------------------------+-----------+----------=
--+---------------+
>>
>> [    0.086529] debug: unmapping init [mem 0xffffffff82607000-0xffffffff8=
2609fff]
>> [    0.090115]
>> [    0.090782] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    0.091842] [ INFO: suspicious RCU usage. ]
>> [    0.092000] 3.18.0-rc2-00001-geeb61e5 #7 Not tainted
>> [    0.092000] -------------------------------
>> [    0.092000] kernel/sched/core.c:7408 suspicious rcu_dereference_check=
() usage!
>> [    0.092000]
>> [    0.092000] other info that might help us debug this:
>> [    0.092000]
>> [    0.092000]
>> [    0.092000] rcu_scheduler_active =3D 1, debug_locks =3D 0
>> [    0.092000] 2 locks held by swapper/0/0:
>> [    0.092000]  #0:  (&p->pi_lock){......}, at: [<ffffffff810b8d96>] tas=
k_rq_lock+0x30/0xaa
>> [    0.092000]  #1:  (&rq->lock){-.....}, at: [<ffffffff810b8db8>] task_=
rq_lock+0x52/0xaa
>> [    0.092000]
>> [    0.092000] stack backtrace:
>> [    0.092000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.18.0-rc2-0000=
1-geeb61e5 #7
>> [    0.092000] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
>> [    0.092000]  0000000000000001 ffffffff819dbcb8 ffffffff815e2acd 00000=
0000000182c
>> [    0.092000]  ffffffff819f85c0 ffffffff819dbce8 ffffffff810d1774 ffff8=
80013510000
>> [    0.092000]  ffff8800139de180 ffff880013528000 0000000000800300 fffff=
fff819dbd48
>> [    0.092000] Call Trace:
>> [    0.092000]  [<ffffffff815e2acd>] dump_stack+0x4e/0x68
>> [    0.092000]  [<ffffffff810d1774>] lockdep_rcu_suspicious+0x107/0x110
>> [    0.092000]  [<ffffffff810bf887>] sched_move_task+0xda/0x17b
>> [    0.092000]  [<ffffffff810bf945>] cpu_cgroup_fork+0x9/0xb
>> [    0.092000]  [<ffffffff8110c301>] cgroup_post_fork+0x9b/0xaa
>> [    0.092000]  [<ffffffff8109c1bd>] copy_process+0x17e5/0x1832
>> [    0.092000]  [<ffffffff815def62>] ? rest_init+0x136/0x136
>> [    0.092000]  [<ffffffff8109c367>] do_fork+0x8a/0x243
>> [    0.092000]  [<ffffffff8109c541>] kernel_thread+0x21/0x23
>> [    0.092000]  [<ffffffff815dee4a>] rest_init+0x1e/0x136
>> [    0.092000]  [<ffffffff82520fb5>] start_kernel+0x4ba/0x4c7
>> [    0.092000]  [<ffffffff82520120>] ? early_idt_handlers+0x120/0x120
>> [    0.092000]  [<ffffffff825204de>] x86_64_start_reservations+0x2a/0x2c
>> [    0.092000]  [<ffffffff825205e6>] x86_64_start_kernel+0x106/0x115
>> [    0.096042] Getting VERSION: 1050014
>> [    0.097061] Getting VERSION: 1050014
>> [    0.098000] Getting ID: 0
>>
>> git bisect start 4fbe40970dc154aaeeda0584aab8913fc073127b cac7f2429872d3=
733dc3f9915857b1691da2eb2f --
>> git bisect good fd2e6bbbe5b2e8f6d8ea6a28b614ec5c1c8b5a62  # 23:14     20=
+      0  Merge remote-tracking branch 'hwmon-staging/hwmon-next'
>> git bisect good ab6af24617af5f94df5185611f1eb39432d49292  # 01:33     20=
+      0  Merge remote-tracking branch 'spi/for-next'
>> git bisect  bad f5ef810eb87c283118797ea33778c5b3c937ad29  # 02:08      0=
-      3  Merge remote-tracking branch 'staging/staging-next'
>> git bisect  bad 50247251e8b6078b491b5fb54dc31c24867f5930  # 02:47      0=
-      9  Merge remote-tracking branch 'rcu/rcu/next'
>> git bisect  bad 6a91cd724c20352f8cdc2a73c0649bae71897ed8  # 03:27      0=
-      7  Merge remote-tracking branch 'edac-amd/for-next'
>> git bisect  bad d7a8d245f2ffb9adde1a7121e5ab86eed8d03584  # 03:39      0=
-      4  Merge remote-tracking branch 'tip/auto-latest'
>> git bisect good 26c2d2b39128adba276d140eefa2745591b88536  # 09:46     20=
+      0  i386/audit: stop scribbling on the stack frame
>> git bisect  bad 3427445afd26bd2395f29241319283a93f362cd0  # 11:03      0=
-      1  sched: Exclude cond_resched() from nested sleep test
>> git bisect  bad 1a43a14a5bd9c32dbd7af35e35a5afa703944bcb  # 11:39      0=
-      2  sched: Fix schedule_tail() to disable preemption
>> git bisect  bad f3a7e1a9c464a32ee186ab91388313c82e7ce018  # 12:38      0=
-      1  sched/dl: Fix preemption checks
>> git bisect  bad 1effd9f19324efb05fccc7421530e11a52db0278  # 12:55      0=
-      1  sched/numa: Fix unsafe get_task_struct() in task_numa_assign()
>> git bisect  bad 64be6f1f5f710f5995d41caf8a1767fe6d2b5a87  # 15:30      0=
-      3  sched/deadline: Don't replenish from a !SCHED_DEADLINE entity
>> git bisect  bad eeb61e53ea19be0c4015b00b2e8b3b2185436f2b  # 17:18      0=
-      1  sched: Fix race between task_group and sched_task_group
>> # first bad commit: [eeb61e53ea19be0c4015b00b2e8b3b2185436f2b] sched: Fi=
x race between task_group and sched_task_group
>> git bisect good cac7f2429872d3733dc3f9915857b1691da2eb2f  # 17:31     60=
+      0  Linux 3.18-rc2
>> git bisect  bad 4fbe40970dc154aaeeda0584aab8913fc073127b  # 17:31      0=
-     11  Add linux-next specific files for 20141031
>> git bisect  bad 0df1f2487d2f0d04703f142813d53615d62a1da4  # 20:17      0=
-      3  Linux 3.18-rc3
>> git bisect  bad a641d0e16b552f986e8c4a8735e66a1443a769cf  # 21:44      0=
-      3  Add linux-next specific files for 20141103
>>
>> This script may reproduce the error.
>>
>> ------------------------------------------------------------------------=
----
>> #!/bin/bash
>>
>> kernel=3D$1
>> initrd=3Dyocto-minimal-x86_64.cgz
>>
>> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/=
master/initrd/$initrd
>>
>> kvm=3D(
>>         qemu-system-x86_64
>>         -enable-kvm
>>         -cpu Haswell,+smep,+smap
>>         -kernel $kernel
>>         -initrd $initrd
>>         -m 320
>>         -smp 1
>>         -net nic,vlan=3D1,model=3De1000
>>         -net user,vlan=3D1
>>         -boot order=3Dnc
>>         -no-reboot
>>         -watchdog i6300esb
>>         -rtc base=3Dlocaltime
>>         -serial stdio
>>         -display none
>>         -monitor null
>> )
>>
>> append=3D(
>>         hung_task_panic=3D1
>>         earlyprintk=3DttyS0,115200
>>         debug
>>         apic=3Ddebug
>>         sysrq_always_enabled
>>         rcupdate.rcu_cpu_stall_timeout=3D100
>>         panic=3D-1
>>         softlockup_panic=3D1
>>         nmi_watchdog=3Dpanic
>>         oops=3Dpanic
>>         load_ramdisk=3D2
>>         prompt_ramdisk=3D0
>>         console=3DttyS0,115200
>>         console=3Dtty0
>>         vga=3Dnormal
>>         root=3D/dev/ram0
>>         rw
>>         drbd.minor_count=3D8
>> )
>>
>> "${kvm[@]}" --append "${append[*]}"
>> ------------------------------------------------------------------------=
----
>>
>> Thanks,
>> Fengguang
>> ,
>>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)linux.intel.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--===============5942229730554211627==--

