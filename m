Content-Type: multipart/mixed; boundary="===============2052053476408668919=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/core] 3640269b04: WARNING: CPU: 0 PID: 0 at kernel/sched/sched.h:804 rq_clock_task
Date: Wed, 14 Dec 2016 09:35:44 +0100
Message-ID: <20161214083544.GN3124@twins.programming.kicks-ass.net>
In-Reply-To: <5850a938.e6a6qkScKoCH7I8X%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2052053476408668919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 10:06:48AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://internal_merge_and_test_tree devel-catchup-201612130113
> =

> commit 3640269b04db583c0033678c9114f3406a0f489b
> Author:     Matt Fleming <matt@codeblueprint.co.uk>
> AuthorDate: Wed Sep 21 14:38:13 2016 +0100
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Mon Dec 12 16:42:09 2016 +0100
> =

>     sched/core: Add debug code to catch missing update_rq_clock()
>     =


> [    0.031009] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.033107] Freeing SMP alternatives memory: 12K (ffffffff81b7b000 - f=
fffffff81b7e000)
> [    0.035721] ------------[ cut here ]------------
> [    0.036000] WARNING: CPU: 0 PID: 0 at kernel/sched/sched.h:804 rq_cloc=
k_task+0x51/0x70
> [    0.036000] rq->clock_update_flags < RQCF_ACT_SKIP
> [    0.036000] Modules linked in:
> [    0.036000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.9.0-rc8-00183-=
g3640269 #1
> [    0.036000]  ffffffff81a03cc0 ffffffff8122375f ffffffff81a0f580 ffffff=
ff81a03d28
> [    0.036000]  0000000000000000 ffffffff81098591 ffffffff81a03d00 ffffff=
ff8106a63f
> [    0.036000]  0000000981a03d98 ffffffff81793092 ffff88001e6146c0 000000=
0000000000
> [    0.036000] Call Trace:
> [    0.036000]  [<ffffffff8122375f>] dump_stack+0xb0/0x101
> [    0.036000]  [<ffffffff81098591>] ? rq_clock_task+0x51/0x70
> [    0.036000]  [<ffffffff8106a63f>] __warn+0x107/0x127
> [    0.036000]  [<ffffffff8106a6c4>] warn_slowpath_fmt+0x65/0x6e
> [    0.036000]  [<ffffffff81098591>] rq_clock_task+0x51/0x70
> [    0.036000]  [<ffffffff81098e3c>] update_load_avg+0x4c/0x263
> [    0.036000]  [<ffffffff8109908c>] attach_entity_cfs_rq+0x39/0x92
> [    0.036000]  [<ffffffff8109908c>] ? attach_entity_cfs_rq+0x39/0x92
> [    0.036000]  [<ffffffff81099efd>] post_init_entity_util_avg+0xa9/0xac
> [    0.036000]  [<ffffffff810935a3>] wake_up_new_task+0x59/0xc3
> [    0.036000]  [<ffffffff81069ab8>] _do_fork+0x1bc/0x283
> [    0.036000]  [<ffffffff8123add0>] ? find_next_bit+0x45/0x51
> [    0.036000]  [<ffffffff814cef26>] ? rest_init+0x16d/0x16d
> [    0.036000]  [<ffffffff81069bb3>] kernel_thread+0x34/0x3b
> [    0.036000]  [<ffffffff81aaec89>] ? trap_init+0x20e/0x20e
> [    0.036000]  [<ffffffff814ceddb>] rest_init+0x22/0x16d
> [    0.036000]  [<ffffffff81aaec89>] ? trap_init+0x20e/0x20e
> [    0.036000]  [<ffffffff81aac10f>] start_kernel+0x4dc/0x4e9
> [    0.036000]  [<ffffffff81aab120>] ? early_idt_handler_array+0x120/0x120
> [    0.036000]  [<ffffffff81aab416>] x86_64_start_reservations+0x2a/0x2c
> [    0.036000]  [<ffffffff81aab4fe>] x86_64_start_kernel+0xe6/0xf3
> [    0.036000] ---[ end trace 0000000000000000 ]---
> [    0.037197] smpboot: APIC(0) Converting physical 0 to logical package 0
> =

> git bisect start e84cc2b92f0301361c20d97210099d4ac7731196 69973b830859bc6=
529a7a0468ba0d80ee5117826 --
> git bisect  bad f50e71f8660649cc8ec74d0a35273ff627929a08  # 23:13     11-=
      5  Merge 'linux-review/Madalin-Bucur/powerpc-fsl-dts-add-QMan-and-BMa=
n-portal-nodes-on-t1023rdb/20161207-034042' into devel-hourly-2016121315
> git bisect  bad 1d169e013b8e9d7fa3e3af5af6e52145a8de114a  # 23:30     10-=
      4  Merge 'miklos-vfs/misc' into devel-hourly-2016121315
> git bisect good 068926f19428d7a4e9281fc4b8ec9d8a0856e26d  # 00:10    132+=
     29  Merge 'linux-review/Grygorii-Strashko/usb-dwc3-omap-fix-race-of-pm=
-runtime-with-irq-handler-in-probe/20161213-053605' into devel-hourly-20161=
21315
> git bisect  bad 43d1a53eec3973cdabbd54215aff4aa5a70ad1b2  # 00:22      4-=
      3  Merge 'pinchartl-media/omapdrm/devel' into devel-hourly-2016121315
> git bisect  bad 85f539d220e9fb2c9c0b6f542527b6e4f3f0fe71  # 00:32      6-=
      2  Merge 'hwmon/watchdog-next' into devel-hourly-2016121315
> git bisect good 2c22794aa932c328633337d1720bbc873d36d26f  # 01:24    131+=
     17  Merge 'ipmi/for-next' into devel-hourly-2016121315
> git bisect  bad f185bb4654ea9a94553b07ac1fa76a277750c278  # 01:44      9-=
      1  Merge 'linux-review/Himanshu-Madhani/qla2xxx-Feature-updaes-for-dr=
iver/20161213-064500' into devel-hourly-2016121315
> git bisect  bad 1e09f27041eb80acbde6571e8896115174343d72  # 02:08      2-=
      2  Merge 'peterz-queue/sched/debug' into devel-hourly-2016121315

So as per that entry it appears you got the commit from my tree.


That tree also contains the below commit, right after the one you
fingered. And the above stacktrace looks very much like the one here,
no?


commit 73bc83482218caf16d09407e1547299dfc862613
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Oct 3 16:20:59 2016 +0200

    sched: Add missing update_rq_clock() in post_init_entity_util_avg().
    =

    WARNING: CPU: 0 PID: 0 at ../kernel/sched/sched.h:797 post_init_entity_=
util_avg+0x175/0x180
    rq->clock_update_flags < RQCF_ACT_SKIPdModules linked in:
    dCPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.8.0-00637-g67223e2-dirty #=
552
    dHardware name: Intel Corporation S2600GZ/S2600GZ, BIOS SE5C600.86B.02.=
02.0002.122320131210 12/23/2013
     ffffffff82203d88 ffffffff81615285 ffffffff82203dd8 0000000000000000
     ffffffff82203dc8 ffffffff810d5bab 0000031d8220b4c0 0000000000000200
     ffff88042f817b68 ffff88042dbf0080 ffff88042f817b00 ffffffff82515440
    Call Trace:
     [<ffffffff81615285>] dump_stack+0x67/0x92
     [<ffffffff810d5bab>] __warn+0xcb/0xf0
     [<ffffffff810d5c1f>] warn_slowpath_fmt+0x4f/0x60
     [<ffffffff8110fa25>] post_init_entity_util_avg+0x175/0x180
     [<ffffffff811013d7>] wake_up_new_task+0xf7/0x240
     [<ffffffff810d4eea>] _do_fork+0x12a/0x3b0
     [<ffffffff8118a35f>] ? ftrace_process_locs+0x32f/0x430
     [<ffffffff810d5199>] kernel_thread+0x29/0x30
     [<ffffffff81a7d862>] rest_init+0x22/0x90
     [<ffffffff8239ff28>] start_kernel+0x403/0x410
     [<ffffffff8239f28f>] x86_64_start_reservations+0x2a/0x2c
     [<ffffffff8239f409>] x86_64_start_kernel+0x178/0x18b
    4---[ end trace dab466e88c65317a ]---
    =

    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 32028a15f02d..cff3ac1247dd 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2581,6 +2581,7 @@ void wake_up_new_task(struct task_struct *p)
 	__set_task_cpu(p, select_task_rq(p, task_cpu(p), SD_BALANCE_FORK, 0));
 #endif
 	rq =3D __task_rq_lock(p, &rf);
+	update_rq_clock(rq);
 	post_init_entity_util_avg(&p->se);
 =

 	activate_task(rq, p, 0);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index faf80e10d662..972b67622922 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9267,6 +9267,7 @@ void online_fair_sched_group(struct task_group *tg)
 		se =3D tg->se[i];
 =

 		raw_spin_lock_irq(&rq->lock);
+		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
 		sync_throttle(tg, i);
 		raw_spin_unlock_irq(&rq->lock);

--===============2052053476408668919==--

