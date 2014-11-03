Content-Type: multipart/mixed; boundary="===============6257857447407580254=="
MIME-Version: 1.0
From: Kirill Tkhai <tkhai@yandex.ru>
To: lkp@lists.01.org
Subject: Re: [sched] [ INFO: suspicious RCU usage. ]
Date: Mon, 03 Nov 2014 22:28:18 +0300
Message-ID: <2127541415042898@web25h.yandex.ru>
In-Reply-To: <20141103145332.GA5157@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6257857447407580254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

the fix is already in PeterZ queue, it will go to mainline soon.

03.11.2014, 17:54, "Fengguang Wu" <fengguang.wu@intel.com>:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit eeb61e53ea19be0c4015b00b2e8b3b2185436f2b
> Author: =C2=A0=C2=A0=C2=A0=C2=A0Kirill Tkhai <ktkhai@parallels.com>
> AuthorDate: Mon Oct 27 14:18:25 2014 +0400
> Commit: =C2=A0=C2=A0=C2=A0=C2=A0Ingo Molnar <mingo@kernel.org>
> CommitDate: Tue Oct 28 10:45:59 2014 +0100
>
> =C2=A0=C2=A0=C2=A0=C2=A0sched: Fix race between task_group and sched_task=
_group
>
> =C2=A0=C2=A0=C2=A0=C2=A0The race may happen when somebody is changing tas=
k_group of a forking task.
> =C2=A0=C2=A0=C2=A0=C2=A0Child's cgroup is the same as parent's after dup_=
task_struct() (there just
> =C2=A0=C2=A0=C2=A0=C2=A0memory copying). Also, cfs_rq and rt_rq are the s=
ame as parent's.
>
> =C2=A0=C2=A0=C2=A0=C2=A0But if parent changes its task_group before it's =
called cgroup_post_fork(),
> =C2=A0=C2=A0=C2=A0=C2=A0we do not reflect this situation on child. Child'=
s cfs_rq and rt_rq remain
> =C2=A0=C2=A0=C2=A0=C2=A0the same, while child's task_group changes in cgr=
oup_post_fork().
>
> =C2=A0=C2=A0=C2=A0=C2=A0To fix this we introduce fork() method, which cal=
ls sched_move_task() directly.
> =C2=A0=C2=A0=C2=A0=C2=A0This function changes sched_task_group on appropr=
iate (also its logic has
> =C2=A0=C2=A0=C2=A0=C2=A0no problem with freshly created tasks, so we shou=
ldn't introduce something
> =C2=A0=C2=A0=C2=A0=C2=A0special; we are able just to use it).
>
> =C2=A0=C2=A0=C2=A0=C2=A0Possibly, this decides the Burke Libbey's problem=
: https://lkml.org/lkml/2014/10/24/456
>
> =C2=A0=C2=A0=C2=A0=C2=A0Signed-off-by: Kirill Tkhai <ktkhai@parallels.c=
om>
> =C2=A0=C2=A0=C2=A0=C2=A0Signed-off-by: Peter Zijlstra (Intel) <peterz@i=
nfradead.org>
> =C2=A0=C2=A0=C2=A0=C2=A0Cc: Linus Torvalds <torvalds@linux-foundation.o=
rg>
> =C2=A0=C2=A0=C2=A0=C2=A0Link: http://lkml.kernel.org/r/1414405105.19914.1=
69.camel(a)tkhai
> =C2=A0=C2=A0=C2=A0=C2=A0Signed-off-by: Ingo Molnar <mingo@kernel.org>
>
> +------------------------------------------------+-----------+-----------=
-+---------------+
> | =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| v3.18-rc2 =
| eeb61e53ea | next-20141031 |
> +------------------------------------------------+-----------+-----------=
-+---------------+
> | boot_successes =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 60 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|
> | boot_failures =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 20 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 11 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|
> | INFO:suspicious_RCU_usage =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 20 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 11 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> | backtrace:do_fork =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 20 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 11 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|
> | WARNING:at_kernel/sched/core.c:__might_sleep() | 0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 11 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
> | backtrace:rfcomm_run =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 11 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> | WARNING:CPU:#PID:#at/kbuild/src/smo =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> | BUG:kernel_boot_hang =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> +------------------------------------------------+-----------+-----------=
-+---------------+
>
> [ =C2=A0=C2=A0=C2=A00.086529] debug: unmapping init [mem 0xffffffff826070=
00-0xffffffff82609fff]
> [ =C2=A0=C2=A0=C2=A00.090115]
> [ =C2=A0=C2=A0=C2=A00.090782] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ =C2=A0=C2=A0=C2=A00.091842] [ INFO: suspicious RCU usage. ]
> [ =C2=A0=C2=A0=C2=A00.092000] 3.18.0-rc2-00001-geeb61e5 #7 Not tainted
> [ =C2=A0=C2=A0=C2=A00.092000] -------------------------------
> [ =C2=A0=C2=A0=C2=A00.092000] kernel/sched/core.c:7408 suspicious rcu_der=
eference_check() usage!
> [ =C2=A0=C2=A0=C2=A00.092000]
> [ =C2=A0=C2=A0=C2=A00.092000] other info that might help us debug this:
> [ =C2=A0=C2=A0=C2=A00.092000]
> [ =C2=A0=C2=A0=C2=A00.092000]
> [ =C2=A0=C2=A0=C2=A00.092000] rcu_scheduler_active =3D 1, debug_locks =3D=
 0
> [ =C2=A0=C2=A0=C2=A00.092000] 2 locks held by swapper/0/0:
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0#0: =C2=A0(&p->pi_lock){......}, at: =
[<ffffffff810b8d96>] task_rq_lock+0x30/0xaa
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0#1: =C2=A0(&rq->lock){-.....}, at: [<=
ffffffff810b8db8>] task_rq_lock+0x52/0xaa
> [ =C2=A0=C2=A0=C2=A00.092000]
> [ =C2=A0=C2=A0=C2=A00.092000] stack backtrace:
> [ =C2=A0=C2=A0=C2=A00.092000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3=
.18.0-rc2-00001-geeb61e5 #7
> [ =C2=A0=C2=A0=C2=A00.092000] Hardware name: Bochs Bochs, BIOS Bochs 01/0=
1/2011
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A00000000000000001 ffffffff819dbcb8 fff=
fffff815e2acd 000000000000182c
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0ffffffff819f85c0 ffffffff819dbce8 fff=
fffff810d1774 ffff880013510000
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0ffff8800139de180 ffff880013528000 000=
0000000800300 ffffffff819dbd48
> [ =C2=A0=C2=A0=C2=A00.092000] Call Trace:
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff815e2acd>] dump_stack+0x4e/=
0x68
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff810d1774>] lockdep_rcu_susp=
icious+0x107/0x110
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff810bf887>] sched_move_task+=
0xda/0x17b
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff810bf945>] cpu_cgroup_fork+=
0x9/0xb
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff8110c301>] cgroup_post_fork=
+0x9b/0xaa
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff8109c1bd>] copy_process+0x1=
7e5/0x1832
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff815def62>] ? rest_init+0x13=
6/0x136
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff8109c367>] do_fork+0x8a/0x2=
43
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff8109c541>] kernel_thread+0x=
21/0x23
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff815dee4a>] rest_init+0x1e/0=
x136
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff82520fb5>] start_kernel+0x4=
ba/0x4c7
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff82520120>] ? early_idt_hand=
lers+0x120/0x120
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff825204de>] x86_64_start_res=
ervations+0x2a/0x2c
> [ =C2=A0=C2=A0=C2=A00.092000] =C2=A0[<ffffffff825205e6>] x86_64_start_ker=
nel+0x106/0x115
> [ =C2=A0=C2=A0=C2=A00.096042] Getting VERSION: 1050014
> [ =C2=A0=C2=A0=C2=A00.097061] Getting VERSION: 1050014
> [ =C2=A0=C2=A0=C2=A00.098000] Getting ID: 0
>
> git bisect start 4fbe40970dc154aaeeda0584aab8913fc073127b cac7f2429872d37=
33dc3f9915857b1691da2eb2f --
> git bisect good fd2e6bbbe5b2e8f6d8ea6a28b614ec5c1c8b5a62 =C2=A0# 23:14 =
=C2=A0=C2=A0=C2=A0=C2=A020+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0Merge rem=
ote-tracking branch 'hwmon-staging/hwmon-next'
> git bisect good ab6af24617af5f94df5185611f1eb39432d49292 =C2=A0# 01:33 =
=C2=A0=C2=A0=C2=A0=C2=A020+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0Merge rem=
ote-tracking branch 'spi/for-next'
> git bisect =C2=A0bad f5ef810eb87c283118797ea33778c5b3c937ad29 =C2=A0# 02:=
08 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03 =C2=A0M=
erge remote-tracking branch 'staging/staging-next'
> git bisect =C2=A0bad 50247251e8b6078b491b5fb54dc31c24867f5930 =C2=A0# 02:=
47 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A09 =C2=A0M=
erge remote-tracking branch 'rcu/rcu/next'
> git bisect =C2=A0bad 6a91cd724c20352f8cdc2a73c0649bae71897ed8 =C2=A0# 03:=
27 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A07 =C2=A0M=
erge remote-tracking branch 'edac-amd/for-next'
> git bisect =C2=A0bad d7a8d245f2ffb9adde1a7121e5ab86eed8d03584 =C2=A0# 03:=
39 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A04 =C2=A0M=
erge remote-tracking branch 'tip/auto-latest'
> git bisect good 26c2d2b39128adba276d140eefa2745591b88536 =C2=A0# 09:46 =
=C2=A0=C2=A0=C2=A0=C2=A020+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0i386/audi=
t: stop scribbling on the stack frame
> git bisect =C2=A0bad 3427445afd26bd2395f29241319283a93f362cd0 =C2=A0# 11:=
03 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 =C2=A0s=
ched: Exclude cond_resched() from nested sleep test
> git bisect =C2=A0bad 1a43a14a5bd9c32dbd7af35e35a5afa703944bcb =C2=A0# 11:=
39 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A02 =C2=A0s=
ched: Fix schedule_tail() to disable preemption
> git bisect =C2=A0bad f3a7e1a9c464a32ee186ab91388313c82e7ce018 =C2=A0# 12:=
38 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 =C2=A0s=
ched/dl: Fix preemption checks
> git bisect =C2=A0bad 1effd9f19324efb05fccc7421530e11a52db0278 =C2=A0# 12:=
55 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 =C2=A0s=
ched/numa: Fix unsafe get_task_struct() in task_numa_assign()
> git bisect =C2=A0bad 64be6f1f5f710f5995d41caf8a1767fe6d2b5a87 =C2=A0# 15:=
30 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03 =C2=A0s=
ched/deadline: Don't replenish from a !SCHED_DEADLINE entity
> git bisect =C2=A0bad eeb61e53ea19be0c4015b00b2e8b3b2185436f2b =C2=A0# 17:=
18 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 =C2=A0s=
ched: Fix race between task_group and sched_task_group
> # first bad commit: [eeb61e53ea19be0c4015b00b2e8b3b2185436f2b] sched: Fix=
 race between task_group and sched_task_group
> git bisect good cac7f2429872d3733dc3f9915857b1691da2eb2f =C2=A0# 17:31 =
=C2=A0=C2=A0=C2=A0=C2=A060+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0Linux 3.1=
8-rc2
> git bisect =C2=A0bad 4fbe40970dc154aaeeda0584aab8913fc073127b =C2=A0# 17:=
31 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A011 =C2=A0Add li=
nux-next specific files for 20141031
> git bisect =C2=A0bad 0df1f2487d2f0d04703f142813d53615d62a1da4 =C2=A0# 20:=
17 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03 =C2=A0L=
inux 3.18-rc3
> git bisect =C2=A0bad a641d0e16b552f986e8c4a8735e66a1443a769cf =C2=A0# 21:=
44 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A03 =C2=A0A=
dd linux-next specific files for 20141103
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dyocto-minimal-x86_64.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu-system-x86_64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-enable-kvm
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-cpu Haswell,+smep,+smap
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-kernel $kernel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-initrd $initrd
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-m 320
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-smp 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-net nic,vlan=3D1,model=
=3De1000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-net user,vlan=3D1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-boot order=3Dnc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-no-reboot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-watchdog i6300esb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-rtc base=3Dlocaltime
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-serial stdio
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-display none
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-monitor null
> )
>
> append=3D(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hung_task_panic=3D1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0earlyprintk=3DttyS0,115200
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0debug
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic=3Ddebug
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysrq_always_enabled
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rcupdate.rcu_cpu_stall_ti=
meout=3D100
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0panic=3D-1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0softlockup_panic=3D1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nmi_watchdog=3Dpanic
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0oops=3Dpanic
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0load_ramdisk=3D2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0prompt_ramdisk=3D0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0console=3DttyS0,115200
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0console=3Dtty0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vga=3Dnormal
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0root=3D/dev/ram0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rw
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> Thanks,
> Fengguang
> ,
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com

--===============6257857447407580254==--

