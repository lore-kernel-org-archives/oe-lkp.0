Content-Type: multipart/mixed; boundary="===============3316749781164262915=="
MIME-Version: 1.0
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fs] df4c0e36f1: NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
Date: Mon, 02 Nov 2015 12:32:55 +0300
Message-ID: <CAPAsAGwVYSgXm0Rgbtim-5iFxhWaakc1emXQALKwYLm36OoVsw@mail.gmail.com>
In-Reply-To: <87611kakr3.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3316749781164262915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2015-11-02 11:06 GMT+03:00 kernel test robot <ying.huang@linux.intel.com>:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit df4c0e36f1b1782b0611a77c52cc240e5c4752dd ("fs: dcache: manually un=
poison dname after allocation to shut up kasan's reports")
>
>
> The commit fixed a KASan bug, but introduced or revealed a soft lockup
> issue as follow.
>

I think that this issue is caused by several factors.
 1. Non-preempt kernel + heavy debug options (CONFIG_PREEMPT=3Dn
CONFIG_GCOV_PROFILE_ALL=3Dy CONFIG_KASAN=3Dy)
 2. I suspect that your host is overloaded, thus KVM guest runs too slow.

And the major factor here is number 2.

In your dmesg:
[   67.891156] rbtree testing -> 570841 cycles
[   88.609636] augmented rbtree testing
[  116.546697] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s!
[swapper/0:1]


I've tried to reproduce this, and got this:
[    0.693574] rbtree testing -> 15513 cycles
570841/15513 =3D 36x times faster.

[    1.159450] augmented rbtree testing -> 23675 cycles
[    1.864996]
It took less than a second, meanwhile in your case it didn't finish in
22 seconds.

This makes me think that your host is overloaded and the problem is on
your side.

>
> [  116.546697] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swa=
pper/0:1]
> [  116.546697] irq event stamp: 3018750
> [  116.546697] hardirqs last  enabled at (3018749): [<ffffffff8224f36c>] =
restore_args+0x0/0x30
> [  116.546697] hardirqs last disabled at (3018750): [<ffffffff8224f65d>] =
apic_timer_interrupt+0x6d/0x80
> [  116.546697] softirqs last  enabled at (3018748): [<ffffffff810de898>] =
__do_softirq+0x417/0x65b
> [  116.546697] softirqs last disabled at (3018743): [<ffffffff810ded30>] =
irq_exit+0x55/0xc3
> [  116.546697] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.0-05249-gdf=
4c0e3 #1
> [  116.546697] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [  116.546697] task: ffff88002f3f0000 ti: ffff88002f3f8000 task.ti: ffff8=
8002f3f8000
> [  116.546697] RIP: 0010:[<ffffffff8125fdf9>]  [<ffffffff8125fdf9>] __asa=
n_load4+0x12/0x91
> [  116.546697] RSP: 0000:ffff88002f3fbdc8  EFLAGS: 00000282
> [  116.546697] RAX: ffff7fffffffffff RBX: 0000000000000000 RCX: dffffc000=
0000000
> [  116.546697] RDX: fffffbfff0763087 RSI: ffffffff83b18b10 RDI: ffffffff8=
3b1803c
> [  116.546697] RBP: ffff88002f3fbdf8 R08: 0000000000000001 R09: fffffbfff=
0763074
> [  116.546697] R10: ffffffff83b183a7 R11: fffffbfff0763074 R12: ffff88003=
8d29003
> [  116.546697] R13: ffffed00071a5200 R14: ffffffff818cfadb R15: ffff88002=
f3fbdf8
> [  116.546697] FS:  0000000000000000(0000) GS:ffff88002f600000(0000) knlG=
S:0000000000000000
> [  116.546697] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [  116.546697] CR2: 0000000000000000 CR3: 0000000002793000 CR4: 000000000=
00006f0
> [  116.546697] Stack:
> [  116.546697]  ffffffff83b18d5c ffffffff83b18b08 ffffffff83b18878 ffffff=
ff83b18b10
> [  116.546697]  ffffffff83b18868 0000000000000000 ffff88002f3fbe48 ffffff=
ff8223c4d3
> [  116.546697]  0000000000000000 c4400d6283b18d40 0000000000000202 000000=
0000000d98
> [  116.546697] Call Trace:
> [  116.546697]  [<ffffffff8223c4d3>] insert_augmented+0x52/0xf5
> [  116.546697]  [<ffffffff82b7b4ef>] rbtree_test_init+0x151/0x205
> [  116.546697]  [<ffffffff82b7b39e>] ? glob_init+0x11c/0x11c
> [  116.546697]  [<ffffffff82b222dc>] do_one_initcall+0x105/0x197
> [  116.546697]  [<ffffffff82b22501>] kernel_init_freeable+0x193/0x22e
> [  116.546697]  [<ffffffff8222ba4b>] ? rest_init+0x14d/0x14d
> [  116.546697]  [<ffffffff8222ba59>] kernel_init+0xe/0xdf
> [  116.546697]  [<ffffffff8224e5fc>] ret_from_fork+0x7c/0xb0
> [  116.546697]  [<ffffffff8222ba4b>] ? rest_init+0x14d/0x14d
> [  116.546697] Code: 38 00 74 13 48 8b 4d 08 ba 01 00 00 00 be 02 00 00 0=
0 e8 e0 09 00 00 c9 c3 55 48 b8 ff ff ff ff ff 7f ff ff 48 89 e5 48 83 ec 3=
0 <48> 39 c7 77 23 48 8b 45 08 48 89 7d d8 48 8d 7d d8 48 c7 45 e8
> [  116.546697] Kernel panic - not syncing: softlockup: hung tasks
> [  116.546697] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G             L  3.=
19.0-05249-gdf4c0e3 #1
> [  116.546697] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [  116.546697]  0000000000000000 0000000000000000 0000000000000000 ffff88=
002f603d48
> [  116.546697]  ffffffff8223bcf7 fffffbfff074360b ffffffff8263d4e2 ffff88=
002f603dc8
> [  116.546697]  ffffffff82234300 ffff88002f603dc8 ffffffff00000008 ffff88=
002f603dd8
> [  116.546697] Call Trace:
> [  116.546697]  <IRQ>  [<ffffffff8223bcf7>] dump_stack+0x4c/0x65
> [  116.546697]  [<ffffffff82234300>] panic+0xed/0x231
> [  116.546697]  [<ffffffff811adf9d>] watchdog_timer_fn+0x1d2/0x1f8
> [  116.546697]  [<ffffffff811addcb>] ? __touch_watchdog+0x1c/0x1c
> [  116.546697]  [<ffffffff8117083e>] __run_hrtimer+0x283/0x6a2
> [  116.546697]  [<ffffffff81171aaf>] hrtimer_run_queues+0x126/0x145
> [  116.546697]  [<ffffffff8116ff2f>] run_local_timers+0xe/0x1a
> [  116.546697]  [<ffffffff8116ff62>] update_process_times+0x27/0x54
> [  116.546697]  [<ffffffff81181e76>] tick_nohz_handler+0x101/0x164
> [  116.546697]  [<ffffffff81040dbc>] local_apic_timer_interrupt+0x78/0x80
> [  116.546697]  [<ffffffff8225144c>] smp_apic_timer_interrupt+0x57/0x69
> [  116.546697]  [<ffffffff8224f662>] apic_timer_interrupt+0x72/0x80
> [  116.546697]  <EOI>  [<ffffffff8125fdf9>] ? __asan_load4+0x12/0x91
> [  116.546697]  [<ffffffff8223c4d3>] insert_augmented+0x52/0xf5
> [  116.546697]  [<ffffffff82b7b4ef>] rbtree_test_init+0x151/0x205
> [  116.546697]  [<ffffffff82b7b39e>] ? glob_init+0x11c/0x11c
> [  116.546697]  [<ffffffff82b222dc>] do_one_initcall+0x105/0x197
> [  116.546697]  [<ffffffff82b22501>] kernel_init_freeable+0x193/0x22e
> [  116.546697]  [<ffffffff8222ba4b>] ? rest_init+0x14d/0x14d
> [  116.546697]  [<ffffffff8222ba59>] kernel_init+0xe/0xdf
> [  116.546697]  [<ffffffff8224e5fc>] ret_from_fork+0x7c/0xb0
> [  116.546697]  [<ffffffff8222ba4b>] ? rest_init+0x14d/0x14d
> [  116.546697] Kernel Offset: 0x0 from 0xffffffff81000000 (relocation ran=
ge: 0xffffffff80000000-0xffffffff9fffffff)
>
>
> Thanks,
> Ying Huang

--===============3316749781164262915==--

