Content-Type: multipart/mixed; boundary="===============3410075136101481896=="
MIME-Version: 1.0
From: Kirill Tkhai <ktkhai@parallels.com>
To: lkp@lists.01.org
Subject: Re: [sched] [ INFO: suspicious RCU usage. ]
Date: Mon, 02 Feb 2015 12:33:26 +0300
Message-ID: <1422869606.19790.2.camel@tkhai>
In-Reply-To: <20150202042235.GB23438@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3410075136101481896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Fengguang,

We already fixed that in f7b8a47da17c "sched: Remove lockdep check in sched=
_move_task()".

=D0=92 =D0=92=D1=81, 01/02/2015 =D0=B2 20:22 -0800, Fengguang Wu =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> Hi Kirill,
> =

> FYI the RCU warning shows up since this commit, however there are
> several other BUGs, so it's not necessarily a problem of this patch.
> =

> commit eeb61e53ea19be0c4015b00b2e8b3b2185436f2b
> Author:     Kirill Tkhai <ktkhai@parallels.com>
> AuthorDate: Mon Oct 27 14:18:25 2014 +0400
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Tue Oct 28 10:45:59 2014 +0100
> =

>     sched: Fix race between task_group and sched_task_group
>     =

>     The race may happen when somebody is changing task_group of a forking=
 task.
>     Child's cgroup is the same as parent's after dup_task_struct() (there=
 just
>     memory copying). Also, cfs_rq and rt_rq are the same as parent's.
>     =

>     But if parent changes its task_group before it's called cgroup_post_f=
ork(),
>     we do not reflect this situation on child. Child's cfs_rq and rt_rq r=
emain
>     the same, while child's task_group changes in cgroup_post_fork().
>     =

>     To fix this we introduce fork() method, which calls sched_move_task()=
 directly.
>     This function changes sched_task_group on appropriate (also its logic=
 has
>     no problem with freshly created tasks, so we shouldn't introduce some=
thing
>     special; we are able just to use it).
>     =

>     Possibly, this decides the Burke Libbey's problem: https://lkml.org/l=
kml/2014/10/24/456
>     =

>     Signed-off-by: Kirill Tkhai <ktkhai@parallels.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Link: http://lkml.kernel.org/r/1414405105.19914.169.camel(a)tkhai
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> PARENT COMMIT NOT CLEAN. LOOK OUT FOR WRONG BISECT!
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =

> Attached dmesg for the parent commit, too, to help confirm whether it is =
a noise error.
> =

> +--------------------------------------------------------+------------+--=
----------+------------+
> |                                                        | xfs-for-li | e=
eb61e53ea | 28ff344e1d |
> +--------------------------------------------------------+------------+--=
----------+------------+
> | boot_successes                                         | 0          | 0=
          | 0          |
> | boot_failures                                          | 60         | 2=
0         | 11         |
> | WARNING:at_include/linux/kref.h:#kobject_get()         | 60         | 2=
0         | 11         |
> | WARNING:at_fs/kernfs/dir.c:#kernfs_remove_by_name_ns() | 1          | 1=
          | 1          |
> | BUG:unable_to_handle_kernel                            | 59         | 2=
0         | 11         |
> | Oops                                                   | 59         | 2=
0         | 11         |
> | RIP:string                                             | 1          | 1=
          | 1          |
> | Kernel_panic-not_syncing:Fatal_exception               | 59         | 2=
0         | 11         |
> | backtrace:platform_driver_unregister                   | 60         | 2=
0         | 11         |
> | backtrace:init_mac80211_hwsim                          | 60         | 2=
0         | 11         |
> | backtrace:kernel_init_freeable                         | 60         | 2=
0         | 11         |
> | backtrace:bus_register                                 | 1          | 1=
          | 1          |
> | backtrace:i2o_driver_init                              | 1          | 1=
          | 1          |
> | backtrace:i2o_iop_init                                 | 1          | 1=
          | 1          |
> | INFO:trying_to_register_non-static_key                 | 59         | 1=
8         | 10         |
> | RIP:mutex_lock_nested                                  | 58         | 1=
8         | 10         |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks           | 1          |  =
          |            |
> | INFO:task_blocked_for_more_than#seconds                | 1          |  =
          |            |
> | INFO:lockdep_is_turned_off                             | 1          |  =
          |            |
> | RIP:native_apic_mem_write                              | 1          |  =
          |            |
> | RIP:rep_nop                                            | 1          |  =
          |            |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks       | 1          |  =
          |            |
> | backtrace:ring_buffer_producer_thread                  | 1          |  =
          |            |
> | backtrace:watchdog                                     | 1          |  =
          |            |
> | INFO:suspicious_RCU_usage                              | 0          | 2=
0         | 11         |
> | WARNING:at_kernel/locking/lockdep.c:#__bfs()           | 0          | 1=
          |            |
> | RIP:__bfs                                              | 0          | 1=
          |            |
> | backtrace:do_fork                                      | 0          | 2=
0         | 11         |
> +--------------------------------------------------------+------------+--=
----------+------------+
> =

> [    0.014295] debug: unmapping init [mem 0xffffffff82820000-0xffffffff82=
823fff]
> [    0.017254] =

> [    0.017433] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.017885] [ INFO: suspicious RCU usage. ]
> [    0.018000] 3.18.0-rc2-00001-geeb61e5 #6 Not tainted
> [    0.018000] -------------------------------
> [    0.018000] kernel/sched/core.c:7408 suspicious rcu_dereference_check(=
) usage!
> [    0.018000] =

> [    0.018000] other info that might help us debug this:
> [    0.018000] =

> [    0.018000] =

> [    0.018000] rcu_scheduler_active =3D 1, debug_locks =3D 1
> [    0.018000] 2 locks held by swapper/0/0:
> [    0.018000]  #0:  (&p->pi_lock){......}, at: [<ffffffff810dbbdf>] task=
_rq_lock+0x38/0xe7
> [    0.018000]  #1:  (&rq->lock){-.....}, at: [<ffffffff810dbbfa>] task_r=
q_lock+0x53/0xe7
> [    0.018000] =

> [    0.018000] stack backtrace:
> [    0.018000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.18.0-rc2-00001=
-geeb61e5 #6
> [    0.018000] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.018000]  0000000000000001 ffffffff82403cc8 ffffffff81b9e83f ffffff=
ff82425580
> [    0.018000]  0000000000000001 ffffffff82403cf8 ffffffff810f3d12 ffff88=
0012068000
> [    0.018000]  ffff880012422040 0000000000000000 0000000000000000 ffffff=
ff82403d58
> [    0.018000] Call Trace:
> [    0.018000]  [<ffffffff81b9e83f>] dump_stack+0x51/0xaa
> [    0.018000]  [<ffffffff810f3d12>] lockdep_rcu_suspicious+0xfa/0x103
> [    0.018000]  [<ffffffff810e2c04>] sched_move_task+0xe5/0x153
> [    0.018000]  [<ffffffff810e2c8f>] cpu_cgroup_fork+0x9/0xb
> [    0.018000]  [<ffffffff81131f85>] cgroup_post_fork+0x9b/0xaa
> [    0.018000]  [<ffffffff810ba1f0>] copy_process+0x178a/0x18bf
> [    0.018000]  [<ffffffff81b9776c>] ? rest_init+0x130/0x130
> [    0.018000]  [<ffffffff8119f86c>] ? vm_unmap_aliases+0x196/0x1a5
> [    0.018000]  [<ffffffff810ba4ff>] do_fork+0xec/0x3e1
> [    0.018000]  [<ffffffff81b9776c>] ? rest_init+0x130/0x130
> [    0.018000]  [<ffffffff810ba815>] kernel_thread+0x21/0x23
> [    0.018000]  [<ffffffff81b9765a>] rest_init+0x1e/0x130
> [    0.018000]  [<ffffffff82728f3c>] start_kernel+0x433/0x440
> [    0.018000]  [<ffffffff82728120>] ? early_idt_handlers+0x120/0x120
> [    0.018000]  [<ffffffff827284cb>] x86_64_start_reservations+0x2a/0x2c
> [    0.018000]  [<ffffffff82728608>] x86_64_start_kernel+0x13b/0x14a
> [    0.018079] Getting VERSION: 1050014
> [    0.019012] Getting VERSION: 1050014
> [    0.019403] Getting ID: 0
> =

> git bisect start 5e62863aea463c9bf24538315327d0922be35d64 v3.17 --
> git bisect good f207671f402b9aa7367ee21dbab2e450d16c9d7e  # 01:43     20+=
     20  staging: unisys: refactor ULTRA_DIAG_CHANNEL_PROTOCOL
> git bisect good 7c0496d19159df8b5a537154194a75dcdfca873a  # 01:50     20+=
     20  staging: vt6655: mac80211 conversion: s_vFillRTSHead convert to us=
ing struct ieee80211_hdr
> git bisect  bad 33192fa1d173b91ba98c29cb8ab414c76ae3ff0b  # 01:53      0-=
     20  staging: unisys: refactor VISORCHIPSET_BUS_INFO
> git bisect good 146761058f63d8530d150bef00c1d3daaa53dbba  # 01:58     20+=
     20  staging: vt6655: struct vnt_private remove dead members
> git bisect good 037a449ac71fc5c70d2b0af28ce6792065daae55  # 02:04     20+=
     20  staging: rtl8188eu: os_dep: Remove useless cast on void pointer
> git bisect good 425ebd0aa35dcfc5fe2449ef3e1194e422f6f9b4  # 02:14     20+=
     20  staging: unisys: virtpci: Add a blank line after the definition of=
 driver_private
> git bisect good 9056be30542bfff51190bdda67088f319cf4c9f5  # 02:20     20+=
     20  Staging: lustre: lnet: lnet: Better cookie gen
> git bisect  bad 2c683cde06c1d57a9ecbacc484540e259e7255fa  # 02:26      0-=
     20  staging: unisys: refactor CRASH_OBJ_TYPE
> git bisect  bad 37951dabd899587afc31ddd508b9cdddc9c24524  # 02:33      0-=
     20  staging: unisys: get rid of VISORCHIPSET_STATE typedef
> git bisect  bad 7cbe010a5ea728d7c4440b11a1a3997faca0e46d  # 02:40      0-=
     20  Merge 3.18-rc3 into staging-next
> git bisect good f7e87a44ef60ad379e39b45437604141453bf0ec  # 02:48     20+=
     20  Merge tag 'media/v3.18-rc2' of git://git.kernel.org/pub/scm/linux/=
kernel/git/mchehab/linux-media
> git bisect  bad 89453379aaf0608253124057df6cd8ac63948135  # 02:56      0-=
     20  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
> git bisect  bad 19e0d5f16ad9759d92f5739b53acdebfe22fa2a2  # 03:04      0-=
     20  Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
> git bisect good 94712927d06c19b785bae92db07ef84b89f156c8  # 03:11     20+=
     20  Merge tag 'sound-3.18-rc3' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/tiwai/sound
> git bisect good aea4869f68b5869afbb308bfb7d777d725df8900  # 03:14     20+=
     20  Merge branch 'core-urgent-for-linus' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/tip/tip
> git bisect good 5656b408ff2696551c0f572689edcad3113e3a32  # 03:17     20+=
     20  Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/tip/tip
> git bisect good d1cd1210834649ce1ca6bafe5ac25d2f40331343  # 03:31     20+=
     20  x86, pageattr: Prevent overflow in slow_virt_to_phys() for X86_PAE
> git bisect  bad 2847c90e1b3ae95379af24894fc4f98e7f2fd705  # 03:34      0-=
     20  sched/fair: Care divide error in update_task_scan_period()
> git bisect  bad 64be6f1f5f710f5995d41caf8a1767fe6d2b5a87  # 03:37      0-=
     20  sched/deadline: Don't replenish from a !SCHED_DEADLINE entity
> git bisect  bad eeb61e53ea19be0c4015b00b2e8b3b2185436f2b  # 03:39      0-=
     20  sched: Fix race between task_group and sched_task_group
> # first bad commit: [eeb61e53ea19be0c4015b00b2e8b3b2185436f2b] sched: Fix=
 race between task_group and sched_task_group
> git bisect good cac7f2429872d3733dc3f9915857b1691da2eb2f  # 03:45     60+=
     60  Linux 3.18-rc2
> # extra tests with DEBUG_INFO
> git bisect good eeb61e53ea19be0c4015b00b2e8b3b2185436f2b  # 03:52     60+=
     49  sched: Fix race between task_group and sched_task_group
> # extra tests on HEAD of next/master
> git bisect good 827e3bdf1bb2401c1a1e5586eb3977d228d298b2  # 03:59     60+=
      0  Add linux-next specific files for 20150130
> # extra tests on tree/branch linus/master
> git bisect  bad 788807d7ca3821b5ea835a588a52d55631c17e18  # 04:01     58-=
      3  Merge branch 'i2c/for-current' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/wsa/linux
> # extra tests with first bad commit reverted
> # extra tests on tree/branch linus/master
> git bisect  bad 788807d7ca3821b5ea835a588a52d55631c17e18  # 04:03      0-=
      3  Merge branch 'i2c/for-current' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/wsa/linux
> # extra tests on tree/branch next/master
> git bisect  bad 827e3bdf1bb2401c1a1e5586eb3977d228d298b2  # 04:07    295-=
     40  Add linux-next specific files for 20150130
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep,+smap
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 320
> 	-smp 2
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )
> =

> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---

Regards/=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
Kirill Tkhai/=D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=BB =D0=A2=D1=85=D0=B0=D0=B9


--===============3410075136101481896==--

