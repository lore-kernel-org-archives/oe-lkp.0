Content-Type: multipart/mixed; boundary="===============9159070413502292020=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] WARNING: CPU: 0 PID: 10 at kernel/kthread.c:333 __kthread_bind_mask()
Date: Thu, 04 Jun 2015 12:54:50 +0800
Message-ID: <20150604045450.GA30151@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9159070413502292020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

0day kernel testing robot got the below dmesg and the first bad commit is

git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core

commit 645566620ce8feea0970122c4a23907aa217d7f0
Author:     Peter Zijlstra <peterz@infradead.org>
AuthorDate: Fri May 15 17:43:34 2015 +0200
Commit:     Peter Zijlstra <peterz@infradead.org>
CommitDate: Tue Jun 2 12:01:40 2015 +0200

    sched: Fix a race between __kthread_bind() and sched_setaffinity()
    =

    Because sched_setscheduler() checks p->flags & PF_NO_SETAFFINITY
    without locks, a caller might observe an old value and race with the
    set_cpus_allowed_ptr() call from __kthread_bind() and effectively undo
    it.
    =

    	__kthread_bind()
    	  do_set_cpus_allowed()
    						<SYSCALL>
    						  sched_setaffinity()
    						    if (p->flags & PF_NO_SETAFFINITIY)
    						    set_cpus_allowed_ptr()
    	  p->flags |=3D PF_NO_SETAFFINITY
    =

    Fix the issue by putting everything under the regular scheduler locks.
    =

    This also closes a hole in the serialization of
    task_struct::{nr_,}cpus_allowed.
    =

    Cc: dedekind1(a)gmail.com
    Cc: mgorman(a)suse.de
    Cc: rostedt(a)goodmis.org
    Cc: juri.lelli(a)arm.com
    Cc: Oleg Nesterov <oleg@redhat.com>
    Cc: mingo(a)kernel.org
    Cc: riel(a)redhat.com
    Acked-by: Tejun Heo <tj@kernel.org>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Link: http://lkml.kernel.org/r/20150515154833.545640346(a)infradead.org

+----------------------------------------------------+------------+--------=
----+------------+
|                                                    | cfd0d66561 | 6455666=
20c | 86da5c5884 |
+----------------------------------------------------+------------+--------=
----+------------+
| boot_successes                                     | 150        | 2      =
    | 9          |
| boot_failures                                      | 0          | 9      =
    | 3          |
| WARNING:at_kernel/kthread.c:#__kthread_bind_mask() | 0          | 9      =
    | 3          |
| backtrace:rescuer_thread                           | 0          | 9      =
    | 3          |
+----------------------------------------------------+------------+--------=
----+------------+

[    2.425398] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    2.427338] pcnet32: pcnet32.c:v1.35 21.Apr.2008 tsbogend(a)alpha.franke=
n.de
[    2.442390] ------------[ cut here ]------------
[    2.443944] WARNING: CPU: 0 PID: 10 at kernel/kthread.c:333 __kthread_bi=
nd_mask+0x34/0x6e()
[    2.446978] Modules linked in:
[    2.448359] CPU: 0 PID: 10 Comm: khelper Not tainted 4.1.0-rc6-00314-g64=
55666 #4
[    2.450990] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[    2.454132]  0000000000000009 ffff88000f643d68 ffffffff81a3df14 00000000=
00000b02
[    2.470295]  0000000000000000 ffff88000f643da8 ffffffff810f308f 00000000=
0f643da8
[    2.503291]  ffffffff8110d116 ffff88000f55d580 ffff88000f5240c0 ffff8800=
0f4936e0
[    2.506510] Call Trace:
[    2.520770]  [<ffffffff81a3df14>] dump_stack+0x4c/0x65
[    2.522479]  [<ffffffff810f308f>] warn_slowpath_common+0xa1/0xbb
[    2.524334]  [<ffffffff8110d116>] ? __kthread_bind_mask+0x34/0x6e
[    2.526219]  [<ffffffff810f314c>] warn_slowpath_null+0x1a/0x1c
[    2.528069]  [<ffffffff8110d116>] __kthread_bind_mask+0x34/0x6e
[    2.529925]  [<ffffffff8110d381>] kthread_bind_mask+0x13/0x15
[    2.531738]  [<ffffffff8110679d>] worker_attach_to_pool+0x39/0x7c
[    2.546650]  [<ffffffff8110866b>] rescuer_thread+0x130/0x318
[    2.548484]  [<ffffffff8110853b>] ? cancel_delayed_work_sync+0x15/0x15
[    2.550411]  [<ffffffff8110853b>] ? cancel_delayed_work_sync+0x15/0x15
[    2.552207]  [<ffffffff8110cd0f>] kthread+0xf8/0x100
[    2.553864]  [<ffffffff8110cc17>] ? kthread_create_on_node+0x184/0x184
[    2.555795]  [<ffffffff81a457c2>] ret_from_fork+0x42/0x70
[    2.557538]  [<ffffffff8110cc17>] ? kthread_create_on_node+0x184/0x184
[    2.572520] ---[ end trace 362b92c9255ab666 ]---
[    2.574163] ------------[ cut here ]------------

git bisect start 86da5c5884b34736ff50473372600c9324716df7 8af660e3a2d074010=
8df598ef757eb6b61953b0e --
git bisect  bad 7629b214f83ecb8c4890ef4773492881b0fd8802  # 18:40     23-  =
   28  Merge branch 'sched/core'
git bisect good c4cf50ed13b30a929c5538040c9f2115672c6f45  # 18:45     50+  =
    1  Merge branch 'sched/urgent'
git bisect  bad b2731dabb650c8d2dd35c787ef94fc6e48a47415  # 18:57     22-  =
   15  Cleanup: preempt notifiers: disallow hlist_del within unsafe iterati=
on
git bisect  bad 8c224cd2989fb7138d0bb5ce40fd0c6ebe16ae2f  # 19:10      5-  =
    5  revert 095bebf61a46 ("sched/numa: Do not move past the balance point=
 if unbalanced")
git bisect  bad 645566620ce8feea0970122c4a23907aa217d7f0  # 19:10      0-  =
    9  sched: Fix a race between __kthread_bind() and sched_setaffinity()
git bisect good cfd0d66561af813f3595f2c53d433ea2fc11e619  # 19:13     50+  =
    0  Merge branch 'sched/urgent'
# first bad commit: [645566620ce8feea0970122c4a23907aa217d7f0] sched: Fix a=
 race between __kthread_bind() and sched_setaffinity()
git bisect good cfd0d66561af813f3595f2c53d433ea2fc11e619  # 19:17    150+  =
    0  Merge branch 'sched/urgent'
# extra tests on HEAD of peterz-queue/master
git bisect  bad 86da5c5884b34736ff50473372600c9324716df7  # 19:17      0-  =
    3  Merge branch 'perf/core'
# extra tests on tree/branch peterz-queue/sched/core
git bisect  bad 84612110b39582c3da47b4bf7a287b93b9f9524a  # 19:19     29-  =
   70  sched: prevent throttle in early pick_next_task_fair
# extra tests on tree/branch linus/master
git bisect good c46a024ea5eb0165114dbbc8c82c29b7bcf66e71  # 07:08    150+  =
   12  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
# extra tests on tree/branch next/master
git bisect good 0dfc0e41172cd9f50f5f6f0182081fa03c44e0e9  # 20:08    150+  =
   11  Add linux-next specific files for 20150602


This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1
initrd=3Dyocto-minimal-x86_64.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/mas=
ter/initrd/$initrd

kvm=3D(
	qemu-system-x86_64
	-enable-kvm
	-cpu Haswell,+smep,+smap
	-kernel $kernel
	-initrd $initrd
	-m 256
	-smp 1
	-device e1000,netdev=3Dnet0
	-netdev user,id=3Dnet0
	-boot order=3Dnc
	-no-reboot
	-watchdog i6300esb
	-rtc base=3Dlocaltime
	-serial stdio
	-display none
	-monitor null =

)

append=3D(
	hung_task_panic=3D1
	earlyprintk=3DttyS0,115200
	systemd.log_level=3Derr
	debug
	apic=3Ddebug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=3D100
	panic=3D-1
	softlockup_panic=3D1
	nmi_watchdog=3Dpanic
	oops=3Dpanic
	load_ramdisk=3D2
	prompt_ramdisk=3D0
	console=3DttyS0,115200
	console=3Dtty0
	vga=3Dnormal
	root=3D/dev/ram0
	rw
	drbd.minor_count=3D8
)

"${kvm[@]}" --append "${append[*]}"
----------------------------------------------------------------------------

Thanks,
Fengguang

--===============9159070413502292020==--

