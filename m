Content-Type: multipart/mixed; boundary="===============3895302823166711884=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Tue, 28 Nov 2017 12:46:19 -0800
Message-ID: <20171128204619.GA16740@linux.vnet.ibm.com>
In-Reply-To: <20171128173554.GV3624@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3895302823166711884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 09:35:54AM -0800, Paul E. McKenney wrote:
> On Tue, Nov 28, 2017 at 06:10:08PM +0100, Thomas Gleixner wrote:
> > On Tue, 28 Nov 2017, Paul E. McKenney wrote:
> > > On Tue, Nov 28, 2017 at 05:47:35PM +0100, Thomas Gleixner wrote:
> > > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > > index db774b0f217e..a3321bb565db 100644
> > > --- a/kernel/time/timer.c
> > > +++ b/kernel/time/timer.c
> > > @@ -1803,7 +1803,7 @@ signed long __sched schedule_timeout(signed lon=
g timeout)
> > >  		idx =3D timer_get_idx(&timer.timer);
> > >  		idx_now =3D calc_wheel_index(j, base->clk);
> > >  		raw_spin_unlock_irqrestore(&base->lock, flags);
> > > -		pr_info("%s: Waylayed timer idx: %u idx_now: %u\n", __func__, idx,=
 idx_now);
> > > +		pr_info("%s: Waylayed timer base->clk: %#lx jiffies: %#lx base->ne=
xt_expiry: %#lx timer->flags: %#x timer->expires %#lx idx: %u idx_now: %u\n=
", __func__, base->clk, j, base->next_expiry, timer.timer.flags, timer.time=
r.expires, idx, idx_now);
> > =

> > Please print idx and idx_now as hex values. It's simpler to decode that=
 way.
> =

> Here you go!  Starting tests at this end, focusing on TREE01 and TREE04.
> BTW, TREE04 doesn't do any CPU hotplug, providing a counterexample to
> my long-held assumption that this only happened in the presence of CPU
> hotplug operations.

And here is output with changes discussed on IRC.  TREE04 managed to
have not one but two overlapping RCU CPU stall warnings, one for RCU-bh
and the second for RCU-sched.  TREE04 and TREE04.  HZ=3D1000.

------------------------------------------------------------------------
TREE04
------------------------------------------------------------------------

[   28.336052] INFO: rcu_bh detected stalls on CPUs/tasks:
[   28.347354] 	1-...!: (14 ticks this GP) idle=3Dc2a/1/4611686018427387904=
 softirq=3D0/0 fqs=3D3 last_accelerate: 0000/dad0, nonlazy_posted: 0, LD
[   28.349312] 	2-...!: (81 GPs behind) idle=3D892/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D3 last_accelerate: 0000/dad0, nonlazy_posted: 0, LD
[   28.351338] 	3-...!: (11 GPs behind) idle=3D31e/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D3 last_accelerate: 0000/dad0, nonlazy_posted: 0, LD
[   28.353177] 	4-...!: (81 GPs behind) idle=3Ddd6/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D3 last_accelerate: 0000/dad0, nonlazy_posted: 0, LD
[   28.354966] 	5-...!: (81 GPs behind) idle=3Dcbe/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D3 last_accelerate: 0000/dad0, nonlazy_posted: 0, LD
[   28.356866] 	7-...!: (81 GPs behind) idle=3Dfa2/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D3 last_accelerate: 0000/dad0, nonlazy_posted: 0, LD
[   28.358698] 	(detected by 0, t=3D21002 jiffies, g=3D-219, c=3D-220, q=3D=
0)
[   28.359697] Sending NMI from CPU 0 to CPUs 1:
[   28.360694] NMI backtrace for cpu 1
[   28.360897] CPU: 1 PID: 771 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   28.360899] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   28.360923] task: ffff95965de172c0 task.stack: ffffa09d80bcc000
[   28.361249] RIP: 0010:delay_tsc+0x30/0x50
[   28.361250] RSP: 0018:ffffa09d80bcfe50 EFLAGS: 00000206
[   28.361253] RAX: 000000100247c65a RBX: 000000000000000d RCX: 00000000000=
84130
[   28.361254] RDX: 0000001000000000 RSI: 00000010023f852a RDI: 00000000001=
e717e
[   28.361256] RBP: ffffa09d80bcfe90 R08: 0000000000000001 R09: 00000000000=
00101
[   28.361257] R10: 0000000000000000 R11: ffffa09d80bcfe58 R12: 0000000001b=
42b8a
[   28.361259] R13: ffffffffffffff24 R14: 00000006a7ca1638 R15: fffffffffff=
fff25
[   28.361261] FS:  0000000000000000(0000) GS:ffff95965fc40000(0000) knlGS:=
0000000000000000
[   28.361267] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.361269] CR2: 0000000008d98b40 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   28.361269] Call Trace:
[   28.361604]  rcu_read_delay+0xab/0xf0
[   28.361809]  rcu_torture_reader+0x175/0x2e0
[   28.361837]  ? rcu_torture_reader+0x2e0/0x2e0
[   28.361864]  ? kthread+0xf0/0x130
[   28.361866]  kthread+0xf0/0x130
[   28.361938]  ? rcu_torture_timer_cb+0x10/0x10
[   28.361940]  ? kthread_destroy_worker+0x40/0x40
[   28.362012]  ? call_usermodehelper_exec_async+0x11c/0x120
[   28.362059]  ret_from_fork+0x1f/0x30
[   28.362106] Code: 03 10 5a 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 =
0f ae e8 0f 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 =
<65> 8b 0d f9 02 10 5a 41 39 c8 74 db 48 29 c6 41 89 c8 48 01 f7 =

[   28.362281] INFO: NMI handler (nmi_cpu_backtrace_handler) took too long =
to run: 1.540 msecs
[   28.362458] Sending NMI from CPU 0 to CPUs 2:
[   28.362489] NMI backtrace for cpu 2
[   28.362512] CPU: 2 PID: 775 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   28.362513] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   28.362515] task: ffff95965e348000 task.stack: ffffa09d8151c000
[   28.362519] RIP: 0010:kthread_should_stop+0x0/0x30
[   28.362520] RSP: 0000:ffffa09d8151fe70 EFLAGS: 00000246
[   28.362523] RAX: 0000000000000001 RBX: ffffffffa7b79a60 RCX: 00000000000=
0000a
[   28.362524] RDX: 0000000000000000 RSI: 00000000fffffe01 RDI: ffffffffa61=
d6272
[   28.362525] RBP: ffffa09d8151ff00 R08: 0000000000000002 R09: 00000000000=
00101
[   28.362527] R10: 0000000000000000 R11: ffffa09d8151fe58 R12: fffffffffff=
fff24
[   28.362528] R13: 0000000000000000 R14: 00000006aa8d6d83 R15: fffffffffff=
fff25
[   28.362530] FS:  0000000000000000(0000) GS:ffff95965fc80000(0000) knlGS:=
0000000000000000
[   28.362543] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.362548] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   28.362549] Call Trace:
[   28.362585]  torture_must_stop+0x16/0x20
[   28.362607]  rcu_torture_reader+0xf4/0x2e0
[   28.362611]  ? rcu_torture_reader+0x2e0/0x2e0
[   28.362613]  ? kthread+0xf0/0x130
[   28.362615]  kthread+0xf0/0x130
[   28.362618]  ? rcu_torture_timer_cb+0x10/0x10
[   28.362620]  ? kthread_destroy_worker+0x40/0x40
[   28.362623]  ret_from_fork+0x1f/0x30
[   28.362625] Code: 90 66 2e 0f 1f 84 00 00 00 00 00 48 8b 4f 40 48 89 d0 =
be 00 10 00 00 48 c7 c2 e0 6b 1c a6 48 89 c7 e8 65 a8 89 00 48 98 c3 90 90 =
<65> 48 8b 04 25 00 c4 00 00 f6 40 4e 20 74 11 48 8b 80 b8 05 00 =

[   28.363476] Sending NMI from CPU 0 to CPUs 3:
[   28.363509] NMI backtrace for cpu 3
[   28.363529] CPU: 3 PID: 774 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   28.363530] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   28.363532] task: ffff95965e34f2c0 task.stack: ffffa09d81514000
[   28.363547] RIP: 0010:native_sched_clock+0x28/0x70
[   28.363548] RSP: 0000:ffffa09d81517e70 EFLAGS: 00000a47
[   28.363549] RAX: 033b0c542f257800 RBX: ffffffffa7b79a60 RCX: 00000000000=
00000
[   28.363550] RDX: 0000000000000004 RSI: 0000000040291878 RDI: 00000000000=
00001
[   28.363551] RBP: ffffa09d81517f00 R08: 0000000000000003 R09: 00000000000=
00101
[   28.363552] R10: 0000000000000000 R11: ffffa09d81517e58 R12: fffffffffff=
fff24
[   28.363553] R13: 0000000000000000 R14: 00000006aa9cf9f2 R15: fffffffffff=
fff25
[   28.363554] FS:  0000000000000000(0000) GS:ffff95965fcc0000(0000) knlGS:=
0000000000000000
[   28.363558] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.363559] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   28.363561] Call Trace:
[   28.363582]  trace_clock_local+0x5/0x10
[   28.363598]  rcu_torture_reader+0x146/0x2e0
[   28.363602]  ? rcu_torture_reader+0x2e0/0x2e0
[   28.363605]  ? kthread+0xf0/0x130
[   28.363606]  kthread+0xf0/0x130
[   28.363608]  ? rcu_torture_timer_cb+0x10/0x10
[   28.363610]  ? kthread_destroy_worker+0x40/0x40
[   28.363616]  ret_from_fork+0x1f/0x30
[   28.363618] Code: 00 00 00 0f 1f 44 00 00 0f 31 48 c1 e2 20 48 09 c2 65 =
8b 0d cb 67 9f 5a 83 e1 01 48 c1 e1 04 65 8b b1 80 77 01 00 89 f0 48 f7 e2 =
<65> 48 8b b9 88 77 01 00 48 81 c1 80 77 01 00 65 8b 49 04 48 0f =

[   28.364496] Sending NMI from CPU 0 to CPUs 4:
[   28.364558] NMI backtrace for cpu 4
[   28.364580] CPU: 4 PID: 776 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   28.364581] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   28.364583] task: ffff95965e349980 task.stack: ffffa09d81524000
[   28.364594] RIP: 0010:rcu_read_delay+0x21/0xf0
[   28.364595] RSP: 0000:ffffa09d81527e58 EFLAGS: 00000246
[   28.364596] RAX: 00000000000011b7 RBX: ffffffffa7b79a60 RCX: 00000000000=
aae60
[   28.364597] RDX: 000000000004121f RSI: 0000000000000001 RDI: ffffa09d815=
27e90
[   28.364598] RBP: ffffa09d81527e90 R08: 0000000000000004 R09: 00000000000=
00001
[   28.364599] R10: 0000000000000000 R11: 0000000000000000 R12: fffffffffff=
fff24
[   28.364600] R13: 0000000000000000 R14: 00000006aaac8262 R15: fffffffffff=
fff25
[   28.364602] FS:  0000000000000000(0000) GS:ffff95965fd00000(0000) knlGS:=
0000000000000000
[   28.364606] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.364607] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   28.364608] Call Trace:
[   28.364615]  rcu_torture_reader+0x175/0x2e0
[   28.364618]  ? rcu_torture_reader+0x2e0/0x2e0
[   28.364622]  ? kthread+0xf0/0x130
[   28.364623]  kthread+0xf0/0x130
[   28.364625]  ? rcu_torture_timer_cb+0x10/0x10
[   28.364626]  ? kthread_destroy_worker+0x40/0x40
[   28.364633]  ret_from_fork+0x1f/0x30
[   28.364635] Code: 7c 0a ff ff e9 d4 fe ff ff 90 41 55 41 54 55 53 48 89 =
fd e8 d2 14 08 00 48 63 0d ff 5f 4d 02 31 d2 48 69 c9 a0 86 01 00 48 f7 f1 =
<48> 85 d2 74 4c 48 89 ef e8 b2 14 08 00 48 63 15 df 5f 4d 02 48 =

[   28.365511] Sending NMI from CPU 0 to CPUs 5:
[   28.365568] NMI backtrace for cpu 5
[   28.365590] CPU: 5 PID: 777 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   28.365591] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   28.365593] task: ffff95965e34b300 task.stack: ffffa09d8152c000
[   28.365600] RIP: 0010:delay_tsc+0x30/0x50
[   28.365601] RSP: 0000:ffffa09d8152fe50 EFLAGS: 00000206
[   28.365604] RAX: 0000001002e258ec RBX: 0000000000000030 RCX: 00000000001=
b1080
[   28.365605] RDX: 0000001000000000 RSI: 0000001002c7486c RDI: 00000000001=
e713d
[   28.365606] RBP: ffffa09d8152fe90 R08: 0000000000000005 R09: 00000000000=
00101
[   28.365608] R10: 0000000000000000 R11: ffffa09d8152fe58 R12: 0000000001b=
4e144
[   28.365609] R13: ffffffffffffff24 R14: 00000006aa8ff1b1 R15: fffffffffff=
fff25
[   28.365611] FS:  0000000000000000(0000) GS:ffff95965fd40000(0000) knlGS:=
0000000000000000
[   28.365616] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.365617] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   28.365618] Call Trace:
[   28.365626]  rcu_read_delay+0xab/0xf0
[   28.365631]  rcu_torture_reader+0x175/0x2e0
[   28.365634]  ? rcu_torture_reader+0x2e0/0x2e0
[   28.365638]  ? kthread+0xf0/0x130
[   28.365640]  kthread+0xf0/0x130
[   28.365643]  ? rcu_torture_timer_cb+0x10/0x10
[   28.365645]  ? kthread_destroy_worker+0x40/0x40
[   28.365650]  ret_from_fork+0x1f/0x30
[   28.365652] Code: 03 10 5a 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 =
0f ae e8 0f 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 =
<65> 8b 0d f9 02 10 5a 41 39 c8 74 db 48 29 c6 41 89 c8 48 01 f7 =

[   28.366528] Sending NMI from CPU 0 to CPUs 7:
[   28.366582] NMI backtrace for cpu 7
[   28.366606] CPU: 7 PID: 773 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   28.366607] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   28.366609] task: ffff95965e34a640 task.stack: ffffa09d8150c000
[   28.366613] RIP: 0010:delay_tsc+0x1a/0x50
[   28.366615] RSP: 0000:ffffa09d8150fe50 EFLAGS: 00000246
[   28.366617] RAX: 0000001003014a92 RBX: ffffffffa7b79a60 RCX: 00000000000=
00007
[   28.366618] RDX: 0000001000000000 RSI: 0000001002fe3cda RDI: 00000000000=
6169a
[   28.366619] RBP: ffffa09d8150fe90 R08: 0000000000000007 R09: 00000000000=
00001
[   28.366621] R10: 0000000000000000 R11: 0000000000000002 R12: fffffffffff=
fff24
[   28.366622] R13: 0000000000000000 R14: 00000006aaca0452 R15: fffffffffff=
fff25
[   28.366624] FS:  0000000000000000(0000) GS:ffff95965fdc0000(0000) knlGS:=
0000000000000000
[   28.366629] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.366630] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   28.366631] Call Trace:
[   28.366635]  rcu_read_delay+0xe8/0xf0
[   28.366639]  rcu_torture_reader+0x175/0x2e0
[   28.366642]  ? rcu_torture_reader+0x2e0/0x2e0
[   28.366644]  ? kthread+0xf0/0x130
[   28.366646]  kthread+0xf0/0x130
[   28.366648]  ? rcu_torture_timer_cb+0x10/0x10
[   28.366651]  ? kthread_destroy_worker+0x40/0x40
[   28.366654]  ret_from_fork+0x1f/0x30
[   28.366655] Code: 00 00 00 f7 e2 48 8d 7a 01 ff 25 e2 80 5f 00 66 90 65 =
44 8b 05 28 03 10 5a 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 0f ae e8 =
<0f> 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 =

[   28.367562] rcu_bh kthread starved for 21016 jiffies! g18446744073709551=
397 c18446744073709551396 f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=3D1
[   28.367567] rcu_bh          I15008     9      2 0x80080000
[   28.367589] Call Trace:
[   28.367606]  ? __schedule+0x316/0x6b0
[   28.367607]  schedule+0x2d/0x80
[   28.367610]  schedule_timeout+0x159/0x3f0
[   28.367625]  ? __next_timer_interrupt+0xc0/0xc0
[   28.367629]  rcu_gp_kthread+0x627/0xd90
[   28.367646]  ? migrate_swap_stop+0x160/0x180
[   28.367649]  kthread+0xf0/0x130
[   28.367655]  ? rcu_barrier_sched+0x10/0x10
[   28.367657]  ? kthread_destroy_worker+0x40/0x40
[   28.367659]  ret_from_fork+0x1f/0x30
[   28.567094] schedule_timeout: Waylayed timer base->clk: 0xfffb88d4 jiffi=
es: 0xfffbdbb7 base->next_expiry: 0xfffb88d4 timer->flags: 0x5800001 timer-=
>expires 0xfffb88d5 idx: 16 idx_now: ee base->pending_map           500000 =
400000000000000   1000000000000              40               0            =
   2               0               0               0
[   30.330055] INFO: rcu_sched detected stalls on CPUs/tasks:
[   30.331770] 	1-...!: (88 GPs behind) idle=3Dc36/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D0 last_accelerate: 0000/e29a, nonlazy_posted: 0, LD
[   30.335218] 	4-...!: (88 GPs behind) idle=3Dde2/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D0 last_accelerate: 0000/e29a, nonlazy_posted: 0, LD
[   30.337537] 	5-...!: (88 GPs behind) idle=3Dcca/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D0 last_accelerate: 0000/e29a, nonlazy_posted: 0, LD
[   30.339869] 	7-...!: (0 ticks this GP) idle=3Dfae/1/4611686018427387904 =
softirq=3D0/0 fqs=3D0 last_accelerate: 0000/e29a, nonlazy_posted: 0, LD
[   30.342199] 	(detected by 0, t=3D21002 jiffies, g=3D-212, c=3D-213, q=3D=
80)
[   30.343442] Sending NMI from CPU 0 to CPUs 1:
[   30.344302] NMI backtrace for cpu 1
[   30.344328] CPU: 1 PID: 771 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   30.344329] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   30.344331] task: ffff95965de172c0 task.stack: ffffa09d80bcc000
[   30.344347] RIP: 0010:torture_random+0x0/0x50
[   30.344348] RSP: 0018:ffffa09d80bcfe50 EFLAGS: 00000202
[   30.344351] RAX: 0000000000000e40 RBX: ffffffffa7b79a60 RCX: 00000000000=
aae60
[   30.344352] RDX: 000000000006afb0 RSI: 0000000000000001 RDI: ffffa09d80b=
cfe90
[   30.344353] RBP: ffffa09d80bcfe90 R08: 0000000000000001 R09: 00000000000=
00101
[   30.344355] R10: 0000000000000000 R11: ffffa09d80bcfe58 R12: fffffffffff=
fff27
[   30.344356] R13: 0000000000000000 R14: 0000000720ada1cc R15: fffffffffff=
fff27
[   30.344358] FS:  0000000000000000(0000) GS:ffff95965fc40000(0000) knlGS:=
0000000000000000
[   30.344364] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.344365] CR2: 0000000008d98b40 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   30.344366] Call Trace:
[   30.344381]  rcu_read_delay+0x2e/0xf0
[   30.344387]  rcu_torture_reader+0x175/0x2e0
[   30.344390]  ? rcu_torture_reader+0x2e0/0x2e0
[   30.344395]  ? kthread+0xf0/0x130
[   30.344396]  kthread+0xf0/0x130
[   30.344399]  ? rcu_torture_timer_cb+0x10/0x10
[   30.344401]  ? kthread_destroy_worker+0x40/0x40
[   30.344407]  ? call_usermodehelper_exec_async+0x11c/0x120
[   30.344416]  ret_from_fork+0x1f/0x30
[   30.344418] Code: 00 66 2e 0f 1f 84 00 00 00 00 00 31 c0 c3 0f 1f 00 66 =
2e 0f 1f 84 00 00 00 00 00 8b 05 4a e0 d2 00 85 c0 0f 95 c0 c3 0f 1f 40 00 =
<48> 83 6f 08 01 78 14 48 69 07 01 15 61 02 48 05 65 fc 8c 1c 48 =

[   30.345302] Sending NMI from CPU 0 to CPUs 4:
[   30.345329] NMI backtrace for cpu 4
[   30.345359] CPU: 4 PID: 776 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   30.345361] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   30.345364] task: ffff95965e349980 task.stack: ffffa09d81524000
[   30.345375] RIP: 0010:rcu_torture_reader+0xc5/0x2e0
[   30.345376] RSP: 0000:ffffa09d81527e80 EFLAGS: 00000213
[   30.345379] RAX: 0000000000000001 RBX: ffffffffa7b79a60 RCX: 00000000000=
0000a
[   30.345380] RDX: ffffffffa64462c0 RSI: 0000000000000001 RDI: ffffa09d815=
27e90
[   30.345382] RBP: ffffa09d81527f00 R08: 0000000000000004 R09: ffff95965fd=
1a040
[   30.345383] R10: 0000000000000000 R11: 0000000000000000 R12: fffffffffff=
fff27
[   30.345384] R13: 0000000000000000 R14: 0000000720bd3427 R15: fffffffffff=
fff27
[   30.345386] FS:  0000000000000000(0000) GS:ffff95965fd00000(0000) knlGS:=
0000000000000000
[   30.345392] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.345393] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   30.345445] Call Trace:
[   30.345455]  ? rcu_torture_reader+0x2e0/0x2e0
[   30.345459]  ? kthread+0xf0/0x130
[   30.345461]  kthread+0xf0/0x130
[   30.345464]  ? rcu_torture_timer_cb+0x10/0x10
[   30.345466]  ? kthread_destroy_worker+0x40/0x40
[   30.345473]  ret_from_fork+0x1f/0x30
[   30.345476] Code: f8 00 00 00 48 8b 15 53 51 4d 02 4c 89 e0 4d 63 d5 4c =
29 f8 b9 0a 00 00 00 65 4a ff 04 d5 20 0f 01 00 48 83 7a 30 01 48 83 d8 ff =
<48> 83 f8 0a 48 0f 47 c1 65 48 ff 04 c5 c0 0e 01 00 48 8b 05 1b =

[   30.346316] Sending NMI from CPU 0 to CPUs 5:
[   30.346336] NMI backtrace for cpu 5
[   30.346358] CPU: 5 PID: 777 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   30.346359] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   30.346361] task: ffff95965e34b300 task.stack: ffffa09d8152c000
[   30.346369] RIP: 0010:delay_tsc+0x30/0x50
[   30.346371] RSP: 0000:ffffa09d8152fe50 EFLAGS: 00000202
[   30.346373] RAX: 00000010ee6c68c7 RBX: 000000000000001e RCX: 00000000001=
91a4c
[   30.346374] RDX: 0000001000000000 RSI: 00000010ee534e7b RDI: 00000000001=
e713d
[   30.346376] RBP: ffffa09d8152fe90 R08: 0000000000000005 R09: 00000000000=
00001
[   30.346377] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000001d=
2d4b3
[   30.346378] R13: ffffffffffffff27 R14: 000000071f8edc6b R15: fffffffffff=
fff27
[   30.346380] FS:  0000000000000000(0000) GS:ffff95965fd40000(0000) knlGS:=
0000000000000000
[   30.346385] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.346386] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   30.346387] Call Trace:
[   30.346392]  rcu_read_delay+0xab/0xf0
[   30.346395]  rcu_torture_reader+0x175/0x2e0
[   30.346398]  ? rcu_torture_reader+0x2e0/0x2e0
[   30.346400]  ? kthread+0xf0/0x130
[   30.346402]  kthread+0xf0/0x130
[   30.346404]  ? rcu_torture_timer_cb+0x10/0x10
[   30.346406]  ? kthread_destroy_worker+0x40/0x40
[   30.346409]  ret_from_fork+0x1f/0x30
[   30.346410] Code: 03 10 5a 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 =
0f ae e8 0f 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 =
<65> 8b 0d f9 02 10 5a 41 39 c8 74 db 48 29 c6 41 89 c8 48 01 f7 =

[   30.347331] Sending NMI from CPU 0 to CPUs 7:
[   30.347360] NMI backtrace for cpu 7
[   30.347389] CPU: 7 PID: 773 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   30.347391] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   30.347393] task: ffff95965e34a640 task.stack: ffffa09d8150c000
[   30.347403] RIP: 0010:delay_tsc+0x30/0x50
[   30.347405] RSP: 0000:ffffa09d8150fe50 EFLAGS: 00000216
[   30.347407] RAX: 00000010ee8b5168 RBX: 0000000000000022 RCX: 00000000000=
74d6c
[   30.347408] RDX: 0000001000000000 RSI: 00000010ee8403fc RDI: 00000000001=
e7101
[   30.347409] RBP: ffffa09d8150fe90 R08: 0000000000000007 R09: 00000000000=
00001
[   30.347410] R10: 0000000000000000 R11: 0000000000000010 R12: 0000000001d=
2ea95
[   30.347412] R13: ffffffffffffff27 R14: 000000071fe45867 R15: fffffffffff=
fff27
[   30.347414] FS:  0000000000000000(0000) GS:ffff95965fdc0000(0000) knlGS:=
0000000000000000
[   30.347419] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.347421] CR2: 0000000000000000 CR3: 000000000820a000 CR4: 00000000000=
006e0
[   30.347422] Call Trace:
[   30.347432]  rcu_read_delay+0xab/0xf0
[   30.347436]  rcu_torture_reader+0x175/0x2e0
[   30.347440]  ? rcu_torture_reader+0x2e0/0x2e0
[   30.347444]  ? kthread+0xf0/0x130
[   30.347445]  kthread+0xf0/0x130
[   30.347448]  ? rcu_torture_timer_cb+0x10/0x10
[   30.347451]  ? kthread_destroy_worker+0x40/0x40
[   30.347456]  ret_from_fork+0x1f/0x30
[   30.347459] Code: 03 10 5a 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 =
0f ae e8 0f 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 =
<65> 8b 0d f9 02 10 5a 41 39 c8 74 db 48 29 c6 41 89 c8 48 01 f7 =

[   30.348367] rcu_sched kthread starved for 21002 jiffies! g18446744073709=
551404 c18446744073709551403 f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=
=3D7
[   30.348370] rcu_sched       I15008     8      2 0x80080000
[   30.348398] Call Trace:
[   30.348405]  ? __schedule+0x316/0x6b0
[   30.348410]  schedule+0x2d/0x80
[   30.348414]  schedule_timeout+0x159/0x3f0
[   30.348422]  ? __next_timer_interrupt+0xc0/0xc0
[   30.348428]  rcu_gp_kthread+0x627/0xd90
[   30.348436]  ? migrate_swap_stop+0x161/0x180
[   30.348439]  kthread+0xf0/0x130
[   30.348444]  ? rcu_barrier_sched+0x10/0x10
[   30.348446]  ? kthread_destroy_worker+0x40/0x40
[   30.348448]  ret_from_fork+0x1f/0x30
[   30.371242] schedule_timeout: Waylayed timer base->clk: 0xfffb884b jiffi=
es: 0xfffbe2c3 base->next_expiry: 0xfffb884a timer->flags: 0x20c00007 timer=
->expires 0xfffb9093 idx: 83 idx_now: f2 base->pending_map             1000=
               0   1020000000008    800000000000               0           =
    2               0               0               0
[   30.600337] clocksource: timekeeping watchdog on CPU1: Marking clocksour=
ce 'tsc' as unstable because the skew is too large:

And the qemu command is as follows:

qemu-system-x86_64 -enable-kvm -nographic -smp 8 -serial file:/home/paulmck=
/public_git/linux-rcu/tools/testing/selftests/rcutorture/res/2017.11.28-11:=
58:02/TREE04/console.log -m 512 -kernel /home/paulmck/public_git/linux-rcu/=
tools/testing/selftests/rcutorture/res/2017.11.28-11:58:02/TREE04/bzImage -=
append "noapic selinux=3D0 initcall_debug debug console=3DttyS0 rcutorture.=
torture_type=3Drcu_bh rcutree.rcu_fanout_leaf=3D4 rcutorture.n_barrier_cbs=
=3D4 rcutorture.stat_interval=3D15 rcutorture.shutdown_secs=3D1800 rcutortu=
re.test_no_idle_hz=3D1 rcutorture.verbose=3D1"

You will of course want to adjust the -serial and -kernel parameters.

------------------------------------------------------------------------
TREE04.2
------------------------------------------------------------------------

[   27.630095] INFO: rcu_bh detected stalls on CPUs/tasks:
[   27.632352] 	1-...!: (20 GPs behind) idle=3Dfc6/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D2 last_accelerate: 0000/d80e, nonlazy_posted: 0, LD
[   27.634299] 	3-...!: (121 GPs behind) idle=3Dc32/1/4611686018427387904 s=
oftirq=3D0/0 fqs=3D2 last_accelerate: 0000/d80e, nonlazy_posted: 0, LD
[   27.636244] 	4-...!: (121 GPs behind) idle=3Dc92/1/4611686018427387904 s=
oftirq=3D0/0 fqs=3D2 last_accelerate: 0000/d80e, nonlazy_posted: 0, LD
[   27.638271] 	6-...!: (54 GPs behind) idle=3D93e/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D2 last_accelerate: 0000/d80e, nonlazy_posted: 0, LD
[   27.640210] 	(detected by 0, t=3D21002 jiffies, g=3D-179, c=3D-180, q=3D=
0)
[   27.641179] Sending NMI from CPU 0 to CPUs 1:
[   27.641926] NMI backtrace for cpu 1
[   27.641946] CPU: 1 PID: 769 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   27.641947] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   27.641949] task: ffff96c7dde2b300 task.stack: ffffaa3180d7c000
[   27.641961] RIP: 0010:delay_tsc+0x30/0x50
[   27.641962] RSP: 0000:ffffaa3180d7fe50 EFLAGS: 00000216
[   27.641963] RAX: 0000000f94f40c86 RBX: ffffffffb3979a90 RCX: 00000000000=
4bc7e
[   27.641964] RDX: 0000000f00000000 RSI: 0000000f94ef5008 RDI: 00000000000=
6171a
[   27.641965] RBP: ffffaa3180d7fe90 R08: 0000000000000001 R09: ffff96c7dfc=
5a040
[   27.641966] R10: 0000000000000000 R11: ffffaa3180d7fe58 R12: fffffffffff=
fff4c
[   27.641967] R13: 0000000000000000 R14: 000000067f2f5cf8 R15: fffffffffff=
fff4d
[   27.641968] FS:  0000000000000000(0000) GS:ffff96c7dfc40000(0000) knlGS:=
0000000000000000
[   27.641973] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.641974] CR2: ffffaa31802f0000 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   27.641975] Call Trace:
[   27.641995]  rcu_read_delay+0xe8/0xf0
[   27.641999]  rcu_torture_reader+0x175/0x2e0
[   27.642001]  ? rcu_torture_reader+0x2e0/0x2e0
[   27.642005]  ? kthread+0xf0/0x130
[   27.642007]  kthread+0xf0/0x130
[   27.642009]  ? rcu_torture_timer_cb+0x10/0x10
[   27.642010]  ? kthread_destroy_worker+0x40/0x40
[   27.642016]  ? call_usermodehelper_exec_async+0x11c/0x120
[   27.642023]  ret_from_fork+0x1f/0x30
[   27.642025] Code: 03 30 4e 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 =
0f ae e8 0f 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 =
<65> 8b 0d f9 02 30 4e 41 39 c8 74 db 48 29 c6 41 89 c8 48 01 f7 =

[   27.642920] Sending NMI from CPU 0 to CPUs 3:
[   27.642939] NMI backtrace for cpu 3
[   27.642956] CPU: 3 PID: 775 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   27.642956] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   27.642958] task: ffff96c7dde20000 task.stack: ffffaa3180d94000
[   27.642962] RIP: 0010:delay_tsc+0x30/0x50
[   27.642962] RSP: 0018:ffffaa3180d97e50 EFLAGS: 00000216
[   27.642964] RAX: 0000000f9513283c RBX: 000000000000000e RCX: 00000000001=
c6e1e
[   27.642965] RDX: 0000000f00000000 RSI: 0000000f94f6ba1e RDI: 00000000001=
e8454
[   27.642966] RBP: ffffaa3180d97e90 R08: 0000000000000003 R09: 00000000000=
00001
[   27.642967] R10: 0000000000000000 R11: 0000000000000282 R12: 0000000001a=
93a71
[   27.642968] R13: ffffffffffffff4c R14: 000000067d0c49dd R15: fffffffffff=
fff4d
[   27.642969] FS:  0000000000000000(0000) GS:ffff96c7dfcc0000(0000) knlGS:=
0000000000000000
[   27.642973] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.642974] CR2: 0000000008382b40 CR3: 000000001df34000 CR4: 00000000000=
006e0
[   27.642974] Call Trace:
[   27.642978]  rcu_read_delay+0xab/0xf0
[   27.642980]  rcu_torture_reader+0x175/0x2e0
[   27.642982]  ? rcu_torture_reader+0x2e0/0x2e0
[   27.642984]  ? kthread+0xf0/0x130
[   27.642985]  kthread+0xf0/0x130
[   27.642987]  ? rcu_torture_timer_cb+0x10/0x10
[   27.642988]  ? kthread_destroy_worker+0x40/0x40
[   27.642991]  ? call_usermodehelper_exec_async+0x11c/0x120
[   27.642993]  ret_from_fork+0x1f/0x30
[   27.642994] Code: 03 30 4e 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 =
0f ae e8 0f 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 =
<65> 8b 0d f9 02 30 4e 41 39 c8 74 db 48 29 c6 41 89 c8 48 01 f7 =

[   27.643940] Sending NMI from CPU 0 to CPUs 4:
[   27.643962] NMI backtrace for cpu 4
[   27.643983] CPU: 4 PID: 770 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   27.643984] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   27.643986] task: ffff96c7dde2bfc0 task.stack: ffffaa318151c000
[   27.643994] RIP: 0010:rcu_read_delay+0x46/0xf0
[   27.643995] RSP: 0018:ffffaa318151fe58 EFLAGS: 00000206
[   27.643997] RAX: 000000000014888f RBX: ffffffffb3979a90 RCX: 00000000000=
00af0
[   27.643998] RDX: 00000000000006fb RSI: 0000000000000001 RDI: ffffaa31815=
1fe90
[   27.643999] RBP: ffffaa318151fe90 R08: 0000000000000004 R09: ffff96c7dfd=
1a040
[   27.644000] R10: 0000000000000000 R11: ffffaa318151fe58 R12: fffffffffff=
fff4c
[   27.644001] R13: 0000000000000000 R14: 000000067f50d977 R15: fffffffffff=
fff4d
[   27.644003] FS:  0000000000000000(0000) GS:ffff96c7dfd00000(0000) knlGS:=
0000000000000000
[   27.644007] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.644008] CR2: 00000000f7dbdf80 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   27.644009] Call Trace:
[   27.644015]  rcu_torture_reader+0x175/0x2e0
[   27.644018]  ? rcu_torture_reader+0x2e0/0x2e0
[   27.644021]  ? kthread+0xf0/0x130
[   27.644022]  kthread+0xf0/0x130
[   27.644024]  ? rcu_torture_timer_cb+0x10/0x10
[   27.644025]  ? kthread_destroy_worker+0x40/0x40
[   27.644031]  ret_from_fork+0x1f/0x30
[   27.644032] Code: 86 01 00 48 f7 f1 48 85 d2 74 4c 48 89 ef e8 b2 14 08 =
00 48 63 15 df 5f 4d 02 48 8d 14 92 48 8d 0c 92 31 d2 48 c1 e1 04 48 f7 f1 =
<48> 85 d2 0f 84 8f 00 00 00 65 8b 05 ba 77 b6 4e a9 ff ff ff 7f =

[   27.644955] Sending NMI from CPU 0 to CPUs 6:
[   27.644973] NMI backtrace for cpu 6
[   27.644990] CPU: 6 PID: 773 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   27.644990] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   27.644992] task: ffff96c7debc2640 task.stack: ffffaa318152c000
[   27.644995] RIP: 0010:delay_tsc+0x1c/0x50
[   27.644996] RSP: 0000:ffffaa318152fe50 EFLAGS: 00000246
[   27.644998] RAX: 0000000095510f68 RBX: ffffffffb3979a90 RCX: 00000000000=
00006
[   27.644999] RDX: 000000000000000f RSI: 0000000f954b5738 RDI: 00000000000=
61754
[   27.644999] RBP: ffffaa318152fe90 R08: 0000000000000006 R09: 00000000000=
00001
[   27.645000] R10: 0000000000000000 R11: ffffaa318152fe58 R12: fffffffffff=
fff4c
[   27.645001] R13: 0000000000000000 R14: 000000067f5d7e21 R15: fffffffffff=
fff4d
[   27.645003] FS:  0000000000000000(0000) GS:ffff96c7dfd80000(0000) knlGS:=
0000000000000000
[   27.645006] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.645007] CR2: 0000000000000000 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   27.645007] Call Trace:
[   27.645010]  rcu_read_delay+0xe8/0xf0
[   27.645012]  rcu_torture_reader+0x175/0x2e0
[   27.645014]  ? rcu_torture_reader+0x2e0/0x2e0
[   27.645016]  ? kthread+0xf0/0x130
[   27.645017]  kthread+0xf0/0x130
[   27.645019]  ? rcu_torture_timer_cb+0x10/0x10
[   27.645020]  ? kthread_destroy_worker+0x40/0x40
[   27.645022]  ret_from_fork+0x1f/0x30
[   27.645023] Code: 00 f7 e2 48 8d 7a 01 ff 25 e2 80 5f 00 66 90 65 44 8b =
05 28 03 30 4e 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 0f ae e8 0f 31 =
<48> c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 65 =

[   27.645975] rcu_bh kthread starved for 20835 jiffies! g18446744073709551=
437 c18446744073709551436 f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=3D2
[   27.645988] rcu_bh          I15008     9      2 0x80080000
[   27.646000] Call Trace:
[   27.646011]  ? __schedule+0x316/0x6b0
[   27.646013]  schedule+0x2d/0x80
[   27.646017]  schedule_timeout+0x159/0x3f0
[   27.646025]  ? __next_timer_interrupt+0xc0/0xc0
[   27.646029]  rcu_gp_kthread+0x627/0xd90
[   27.646036]  ? migrate_swap_stop+0x160/0x180
[   27.646039]  kthread+0xf0/0x130
[   27.646041]  ? rcu_barrier_sched+0x10/0x10
[   27.646043]  ? kthread_destroy_worker+0x40/0x40
[   27.646048]  ret_from_fork+0x1f/0x30
[   27.646111] schedule_timeout: Waylayed timer base->clk: 0xfffb86af jiffi=
es: 0xfffbd81e base->next_expiry: 0xfffb86af timer->flags: 0xbc00002 timer-=
>expires 0xfffb86ae idx: 2f idx_now: ed base->pending_map     800000000000 =
      100000000     10000000000               0          200040            =
   2               0               0               0
[   33.898125] INFO: rcu_sched detected stalls on CPUs/tasks:
[   33.899348] 	1-...!: (47 GPs behind) idle=3D01a/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D0 last_accelerate: 0000/f08a, nonlazy_posted: 0, LD
[   33.901444] 	2-...!: (15 GPs behind) idle=3Db3a/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D0 last_accelerate: 0000/f08a, nonlazy_posted: 0, LD
[   33.903620] 	4-...!: (42 GPs behind) idle=3Dce6/1/4611686018427387904 so=
ftirq=3D0/0 fqs=3D0 last_accelerate: 0000/f08a, nonlazy_posted: 0, LD
[   33.905677] 	5-...!: (0 ticks this GP) idle=3Dbbe/1/4611686018427387904 =
softirq=3D0/0 fqs=3D0 last_accelerate: 0000/f08a, nonlazy_posted: 0, LD
[   33.907820] 	6-...!: (24 ticks this GP) idle=3D992/1/4611686018427387904=
 softirq=3D1/1 fqs=3D0 last_accelerate: 0000/f08a, nonlazy_posted: 0, LD
[   33.909911] 	7-...!: (36 ticks this GP) idle=3D176/1/4611686018427387904=
 softirq=3D2/2 fqs=3D0 last_accelerate: 0000/f08a, nonlazy_posted: 0, LD
[   33.912077] 	(detected by 0, t=3D21002 jiffies, g=3D-213, c=3D-214, q=3D=
34)
[   33.913168] Sending NMI from CPU 0 to CPUs 1:
[   33.913923] NMI backtrace for cpu 1
[   33.913944] CPU: 1 PID: 769 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   33.913945] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   33.913947] task: ffff96c7dde2b300 task.stack: ffffaa3180d7c000
[   33.913954] RIP: 0010:__local_bh_enable_ip+0x28/0x50
[   33.913955] RSP: 0000:ffffaa3180d7fe78 EFLAGS: 00000246
[   33.913957] RAX: 0000000000000000 RBX: ffffffffb3979a90 RCX: 00000000000=
0000a
[   33.913958] RDX: ffffffffb22462c0 RSI: 00000000fffffe01 RDI: ffffffffb14=
a58e0
[   33.913958] RBP: ffffaa3180d7ff00 R08: 0000000000000001 R09: 00000000000=
00001
[   33.913959] R10: 0000000000000000 R11: ffffaa3180d7fe00 R12: fffffffffff=
fff62
[   33.913960] R13: 0000000000000000 R14: 00000007f508d9b1 R15: fffffffffff=
fff62
[   33.913961] FS:  0000000000000000(0000) GS:ffff96c7dfc40000(0000) knlGS:=
0000000000000000
[   33.913966] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.913967] CR2: ffffaa31802f0000 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   33.913968] Call Trace:
[   33.913977]  rcu_torture_reader+0xe3/0x2e0
[   33.913980]  ? rcu_torture_reader+0x2e0/0x2e0
[   33.913984]  ? kthread+0xf0/0x130
[   33.913985]  kthread+0xf0/0x130
[   33.913987]  ? rcu_torture_timer_cb+0x10/0x10
[   33.913988]  ? kthread_destroy_worker+0x40/0x40
[   33.913992]  ? call_usermodehelper_exec_async+0x11c/0x120
[   33.913998]  ret_from_fork+0x1f/0x30
[   33.914000] Code: c3 66 90 83 ee 01 65 8b 05 36 3b bb 4e f7 de a9 00 00 =
0f 00 75 1d 65 01 35 26 3b bb 4e 65 8b 05 1f 3b bb 4e a9 00 ff 1f 00 74 0c =
<65> ff 0d 11 3b bb 4e c3 0f ff eb df 65 8b 05 75 ee bb 4e 85 c0 =

[   33.914918] Sending NMI from CPU 0 to CPUs 2:
[   33.914936] NMI backtrace for cpu 2
[   33.914953] CPU: 2 PID: 771 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   33.914954] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   33.914955] task: ffff96c7de184c80 task.stack: ffffaa318149c000
[   33.914962] RIP: 0010:__local_bh_enable_ip+0x28/0x50
[   33.914963] RSP: 0000:ffffaa318149fe78 EFLAGS: 00000246
[   33.914964] RAX: 0000000000000000 RBX: ffffffffb3979a90 RCX: 00000000000=
0000a
[   33.914965] RDX: ffffffffb22462c0 RSI: 00000000fffffe01 RDI: ffffffffb14=
a58e0
[   33.914966] RBP: ffffaa318149ff00 R08: 0000000000000002 R09: 00000000000=
00001
[   33.914967] R10: 0000000000000000 R11: 0000000000000000 R12: fffffffffff=
fff62
[   33.914968] R13: 0000000000000000 R14: 00000007f5186150 R15: fffffffffff=
fff62
[   33.914970] FS:  0000000000000000(0000) GS:ffff96c7dfc80000(0000) knlGS:=
0000000000000000
[   33.914974] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.914975] CR2: 0000000000000000 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   33.914976] Call Trace:
[   33.914985]  rcu_torture_reader+0xe3/0x2e0
[   33.914988]  ? rcu_torture_reader+0x2e0/0x2e0
[   33.914992]  ? kthread+0xf0/0x130
[   33.914993]  kthread+0xf0/0x130
[   33.914995]  ? rcu_torture_timer_cb+0x10/0x10
[   33.914996]  ? kthread_destroy_worker+0x40/0x40
[   33.915000]  ? call_usermodehelper_exec_async+0x11c/0x120
[   33.915006]  ret_from_fork+0x1f/0x30
[   33.915007] Code: c3 66 90 83 ee 01 65 8b 05 36 3b bb 4e f7 de a9 00 00 =
0f 00 75 1d 65 01 35 26 3b bb 4e 65 8b 05 1f 3b bb 4e a9 00 ff 1f 00 74 0c =
<65> ff 0d 11 3b bb 4e c3 0f ff eb df 65 8b 05 75 ee bb 4e 85 c0 =

[   33.915934] Sending NMI from CPU 0 to CPUs 4:
[   33.915956] NMI backtrace for cpu 4
[   33.915977] CPU: 4 PID: 770 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   33.915978] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   33.915980] task: ffff96c7dde2bfc0 task.stack: ffffaa318151c000
[   33.915990] RIP: 0010:delay_tsc+0x30/0x50
[   33.915990] RSP: 0018:ffffaa318151fe50 EFLAGS: 00000216
[   33.915992] RAX: 000000127f0117e3 RBX: 0000000000000013 RCX: 00000000000=
556dc
[   33.915993] RDX: 0000001200000000 RSI: 000000127efbc107 RDI: 00000000001=
e73d2
[   33.915994] RBP: ffffaa318151fe90 R08: 0000000000000004 R09: ffff96c7dfd=
1a040
[   33.915995] R10: 0000000000000000 R11: ffffaa318151fe58 R12: 00000000020=
9089c
[   33.915996] R13: ffffffffffffff62 R14: 00000007f349a167 R15: fffffffffff=
fff62
[   33.915998] FS:  0000000000000000(0000) GS:ffff96c7dfd00000(0000) knlGS:=
0000000000000000
[   33.916002] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.916003] CR2: 00000000f7dbdf80 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   33.916004] Call Trace:
[   33.916012]  rcu_read_delay+0xab/0xf0
[   33.916016]  rcu_torture_reader+0x175/0x2e0
[   33.916018]  ? rcu_torture_reader+0x2e0/0x2e0
[   33.916021]  ? kthread+0xf0/0x130
[   33.916023]  kthread+0xf0/0x130
[   33.916024]  ? rcu_torture_timer_cb+0x10/0x10
[   33.916026]  ? kthread_destroy_worker+0x40/0x40
[   33.916031]  ret_from_fork+0x1f/0x30
[   33.916033] Code: 03 30 4e 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 =
0f ae e8 0f 31 48 c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 =
<65> 8b 0d f9 02 30 4e 41 39 c8 74 db 48 29 c6 41 89 c8 48 01 f7 =

[   33.916949] Sending NMI from CPU 0 to CPUs 5:
[   33.916968] NMI backtrace for cpu 5
[   33.916985] CPU: 5 PID: 774 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   33.916986] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   33.916987] task: ffff96c7debc0cc0 task.stack: ffffaa3181534000
[   33.916990] RIP: 0010:rcu_read_delay+0x46/0xf0
[   33.916991] RSP: 0018:ffffaa3181537e58 EFLAGS: 00000206
[   33.916993] RAX: 00000000000aa73b RBX: ffffffffb3979a90 RCX: 00000000000=
00af0
[   33.916994] RDX: 00000000000008aa RSI: 0000000000000001 RDI: ffffaa31815=
37e90
[   33.916995] RBP: ffffaa3181537e90 R08: 0000000000000005 R09: 00000000000=
00001
[   33.916995] R10: 0000000000000000 R11: 0000000000000002 R12: fffffffffff=
fff62
[   33.916996] R13: 0000000000000000 R14: 00000007f5376188 R15: fffffffffff=
fff62
[   33.916998] FS:  0000000000000000(0000) GS:ffff96c7dfd40000(0000) knlGS:=
0000000000000000
[   33.917001] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.917002] CR2: 00000000f7eb3010 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   33.917003] Call Trace:
[   33.917007]  rcu_torture_reader+0x175/0x2e0
[   33.917009]  ? rcu_torture_reader+0x2e0/0x2e0
[   33.917011]  ? kthread+0xf0/0x130
[   33.917012]  kthread+0xf0/0x130
[   33.917014]  ? rcu_torture_timer_cb+0x10/0x10
[   33.917015]  ? kthread_destroy_worker+0x40/0x40
[   33.917017]  ret_from_fork+0x1f/0x30
[   33.917019] Code: 86 01 00 48 f7 f1 48 85 d2 74 4c 48 89 ef e8 b2 14 08 =
00 48 63 15 df 5f 4d 02 48 8d 14 92 48 8d 0c 92 31 d2 48 c1 e1 04 48 f7 f1 =
<48> 85 d2 0f 84 8f 00 00 00 65 8b 05 ba 77 b6 4e a9 ff ff ff 7f =

[   33.917964] Sending NMI from CPU 0 to CPUs 6:
[   33.917981] NMI backtrace for cpu 6
[   33.917999] CPU: 6 PID: 773 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   33.918000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   33.918001] task: ffff96c7debc2640 task.stack: ffffaa318152c000
[   33.918008] RIP: 0010:native_sched_clock+0x7/0x70
[   33.918009] RSP: 0000:ffffaa318152fe70 EFLAGS: 00000282
[   33.918010] RAX: 000000007f3eed81 RBX: ffffffffb3979a90 RCX: 00000000000=
0000a
[   33.918011] RDX: 0000000000000012 RSI: 00000000fffffe01 RDI: 00000000000=
00001
[   33.918012] RBP: ffffaa318152ff00 R08: 0000000000000006 R09: 00000000000=
00101
[   33.918013] R10: 0000000000000000 R11: ffffaa318152fe58 R12: fffffffffff=
fff62
[   33.918014] R13: 0000000000000000 R14: 00000007f546e075 R15: fffffffffff=
fff62
[   33.918016] FS:  0000000000000000(0000) GS:ffff96c7dfd80000(0000) knlGS:=
0000000000000000
[   33.918019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.918020] CR2: 0000000000000000 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   33.918021] Call Trace:
[   33.918026]  trace_clock_local+0x5/0x10
[   33.918029]  rcu_torture_reader+0x146/0x2e0
[   33.918031]  ? rcu_torture_reader+0x2e0/0x2e0
[   33.918033]  ? kthread+0xf0/0x130
[   33.918034]  kthread+0xf0/0x130
[   33.918035]  ? rcu_torture_timer_cb+0x10/0x10
[   33.918037]  ? kthread_destroy_worker+0x40/0x40
[   33.918039]  ret_from_fork+0x1f/0x30
[   33.918041] Code: 89 47 04 65 8b 05 fa 67 bf 4e 39 c2 75 c6 f3 c3 0f 1f =
40 00 c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 0f 31 =
<48> c1 e2 20 48 09 c2 65 8b 0d cb 67 bf 4e 83 e1 01 48 c1 e1 04 =

[   33.918979] Sending NMI from CPU 0 to CPUs 7:
[   33.918997] NMI backtrace for cpu 7
[   33.919013] CPU: 7 PID: 772 Comm: rcu_torture_rea Not tainted 4.15.0-rc1=
+ #1
[   33.919014] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   33.919015] task: ffff96c7debc72c0 task.stack: ffffaa3181524000
[   33.919021] RIP: 0010:delay_tsc+0x1c/0x50
[   33.919022] RSP: 0018:ffffaa3181527e50 EFLAGS: 00000246
[   33.919024] RAX: 000000007f5dd538 RBX: 0000000000000026 RCX: 00000000000=
00007
[   33.919025] RDX: 0000000000000012 RSI: 000000127f4c7028 RDI: 00000000001=
e736b
[   33.919026] RBP: ffffaa3181527e90 R08: 0000000000000007 R09: 00000000000=
00101
[   33.919027] R10: 0000000000000000 R11: ffffaa3181527e58 R12: 00000000020=
95dd0
[   33.919028] R13: ffffffffffffff62 R14: 00000007f49676e8 R15: fffffffffff=
fff62
[   33.919029] FS:  0000000000000000(0000) GS:ffff96c7dfdc0000(0000) knlGS:=
0000000000000000
[   33.919033] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.919033] CR2: 00000000f7ecbca3 CR3: 000000001780a000 CR4: 00000000000=
006e0
[   33.919034] Call Trace:
[   33.919038]  rcu_read_delay+0xab/0xf0
[   33.919040]  rcu_torture_reader+0x175/0x2e0
[   33.919042]  ? rcu_torture_reader+0x2e0/0x2e0
[   33.919044]  ? kthread+0xf0/0x130
[   33.919045]  kthread+0xf0/0x130
[   33.919046]  ? rcu_torture_timer_cb+0x10/0x10
[   33.919048]  ? kthread_destroy_worker+0x40/0x40
[   33.919050]  ret_from_fork+0x1f/0x30
[   33.919051] Code: 00 f7 e2 48 8d 7a 01 ff 25 e2 80 5f 00 66 90 65 44 8b =
05 28 03 30 4e 0f ae e8 0f 31 48 c1 e2 20 48 89 d6 48 09 c6 0f ae e8 0f 31 =
<48> c1 e2 20 48 09 d0 48 89 c1 48 29 f1 48 39 cf 76 19 f3 90 65 =

[   33.919997] rcu_sched kthread starved for 21019 jiffies! g18446744073709=
551403 c18446744073709551402 f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=
=3D5
[   33.919999] rcu_sched       I15008     8      2 0x80080000
[   33.920013] Call Trace:
[   33.920020]  ? __schedule+0x316/0x6b0
[   33.920022]  schedule+0x2d/0x80
[   33.920024]  schedule_timeout+0x159/0x3f0
[   33.920035]  ? __next_timer_interrupt+0xc0/0xc0
[   33.920038]  rcu_gp_kthread+0x627/0xd90
[   33.920046]  ? migrate_swap_stop+0x161/0x180
[   33.920049]  kthread+0xf0/0x130
[   33.920051]  ? rcu_barrier_sched+0x10/0x10
[   33.920052]  ? kthread_destroy_worker+0x40/0x40
[   33.920056]  ret_from_fork+0x1f/0x30
[   33.920133] schedule_timeout: Waylayed timer base->clk: 0xfffb86c3 jiffi=
es: 0xfffbf0a0 base->next_expiry: 0xfffb86c3 timer->flags: 0x34000005 timer=
->expires 0xfffb9e83 idx: d0 idx_now: f9 base->pending_map                8=
               0     10000000000           10000               0           =
    2               0               0               0

And the qemu command is as follows:

qemu-system-x86_64 -enable-kvm -nographic -smp 8 -serial file:/home/paulmck=
/public_git/linux-rcu/tools/testing/selftests/rcutorture/res/2017.11.28-11:=
58:02/TREE04.2/console.log -m 512 -kernel /home/paulmck/public_git/linux-rc=
u/tools/testing/selftests/rcutorture/res/2017.11.28-11:58:02/TREE04/bzImage=
 -append "noapic selinux=3D0 initcall_debug debug console=3DttyS0 rcutortur=
e.torture_type=3Drcu_bh rcutree.rcu_fanout_leaf=3D4 rcutorture.n_barrier_cb=
s=3D4 rcutorture.stat_interval=3D15 rcutorture.shutdown_secs=3D1800 rcutort=
ure.test_no_idle_hz=3D1 rcutorture.verbose=3D1"


--===============3895302823166711884==--

