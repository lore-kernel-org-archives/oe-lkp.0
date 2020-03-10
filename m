Content-Type: multipart/mixed; boundary="===============4304202456794658122=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: fbc2d237ab ("kcsan: Make KCSAN compatible with lockdep"): [ 5.453598] WARNING: CPU: 0 PID: 5 at kernel/softirq.c:169 __local_bh_enable_ip
Date: Wed, 11 Mar 2020 00:09:19 +0800
Message-ID: <20200310160919.GH22995@intel.com>
In-Reply-To: <CANpmjNPbn0X4OdTaquL-Hq4adA0mJLva0CET+yh7E3XTCWX4pA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4304202456794658122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 01:12:12PM +0100, Marco Elver wrote:
> On Tue, 10 Mar 2020 at 09:27, kernel test robot <lkp@intel.com> wrote:
> >
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> >
> > commit fbc2d237ab2f9012de5ea3ac27cc726d0bb20681
> > Author:     Marco Elver <elver@google.com>
> > AuthorDate: Wed Jan 15 17:25:12 2020 +0100
> > Commit:     Paul E. McKenney <paulmck@kernel.org>
> > CommitDate: Fri Feb 7 11:27:41 2020 -0800
> >
> >     kcsan: Make KCSAN compatible with lockdep
> >
> >     We must avoid any recursion into lockdep if KCSAN is enabled on uti=
lities
> >     used by lockdep. One manifestation of this is corruption of lockdep=
's
> >     IRQ trace state (if TRACE_IRQFLAGS), resulting in spurious warnings
> >     (see below).  This commit fixes this by:
> >
> >     1. Using raw_local_irq{save,restore} in kcsan_setup_watchpoint().
> >     2. Disabling lockdep in kcsan_report().
> >
> >     Tested with:
> >
> >       CONFIG_LOCKDEP=3Dy
> >       CONFIG_DEBUG_LOCKDEP=3Dy
> >       CONFIG_TRACE_IRQFLAGS=3Dy
> >
> >     This fix eliminates spurious warnings such as the following one:
> >
> >         WARNING: CPU: 0 PID: 2 at kernel/locking/lockdep.c:4406 check_f=
lags.part.0+0x101/0x220
> >         Modules linked in:
> >         CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.5.0-rc1+ #11
> >         Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.1=
2.0-1 04/01/2014
> >         RIP: 0010:check_flags.part.0+0x101/0x220
> >         <snip>
> >         Call Trace:
> >          lock_is_held_type+0x69/0x150
> >          freezer_fork+0x20b/0x370
> >          cgroup_post_fork+0x2c9/0x5c0
> >          copy_process+0x2675/0x3b40
> >          _do_fork+0xbe/0xa30
> >          ? _raw_spin_unlock_irqrestore+0x40/0x50
> >          ? match_held_lock+0x56/0x250
> >          ? kthread_park+0xf0/0xf0
> >          kernel_thread+0xa6/0xd0
> >          ? kthread_park+0xf0/0xf0
> >          kthreadd+0x321/0x3d0
> >          ? kthread_create_on_cpu+0x130/0x130
> >          ret_from_fork+0x3a/0x50
> >         irq event stamp: 64
> >         hardirqs last  enabled at (63): [<ffffffff9a7995d0>] _raw_spin_=
unlock_irqrestore+0x40/0x50
> >         hardirqs last disabled at (64): [<ffffffff992a96d2>] kcsan_setu=
p_watchpoint+0x92/0x460
> >         softirqs last  enabled at (32): [<ffffffff990489b8>] fpu__copy+=
0xe8/0x470
> >         softirqs last disabled at (30): [<ffffffff99048939>] fpu__copy+=
0x69/0x470
> >
> >     Reported-by: Qian Cai <cai@lca.pw>
> >     Signed-off-by: Marco Elver <elver@google.com>
> >     Acked-by: Alexander Potapenko <glider@google.com>
> >     Tested-by: Qian Cai <cai@lca.pw>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >
> > 5e250abcb1  kcsan: Rate-limit reporting per data races
> > fbc2d237ab  kcsan: Make KCSAN compatible with lockdep
> > +-----------------------------------------------------+------------+---=
---------+
> > |                                                     | 5e250abcb1 | fb=
c2d237ab |
> > +-----------------------------------------------------+------------+---=
---------+
> > | boot_successes                                      | 38         | 3 =
         |
> > | boot_failures                                       | 11         | 18=
         |
> > | slot:BUG:kernel_hang_in_boot_stage                  | 1          |   =
         |
> > | WARNING:at(____ptrval____)for_ip_interrupt_entry/0x | 5          |   =
         |
> > | WARNING:at#for_ip_interrupt_entry/0x                | 5          |   =
         |
> > | WARNING:at_kernel/softirq.c:#__local_bh_enable_ip   | 0          | 18=
         |
> > | RIP:__local_bh_enable_ip                            | 0          | 18=
         |
> > | WARNING:at_kernel/fork.c:#copy_process              | 0          | 8 =
         |
> > | RIP:copy_process                                    | 0          | 8 =
         |
> > +-----------------------------------------------------+------------+---=
---------+
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > [    5.450300] KCSAN: watching read, size: 4, addr: ffffffff82941e34 [s=
lot: 1, encoded: 8ffff82941e34]
> > [    5.451096] ------------[ cut here ]------------
> > [    5.451496] IRQs not enabled as expected
> > [    5.451856] KCSAN: watching read, size: 8, addr: ffffffff8433e2b8 [s=
lot: 62, encoded: 10ffff8433e2b8]
> > [    5.452700] KCSAN: watching write, size: 1, addr: ffffffff8433e500 [=
slot: 62, encoded: 8002ffff8433e500]
> > [    5.453598] WARNING: CPU: 0 PID: 5 at kernel/softirq.c:169 __local_b=
h_enable_ip+0x99/0xd0
> > [    5.454485] Modules linked in:
> > [    5.454768] CPU: 0 PID: 5 Comm: kworker/u2:0 Not tainted 5.5.0-rc1-0=
0092-gfbc2d237ab2f9 #1
> > [    5.455499] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.12.0-1 04/01/2014
> > [    5.456193] Workqueue: events_unbound call_usermodehelper_exec_work
> > [    5.456797] RIP: 0010:__local_bh_enable_ip+0x99/0xd0
> > [    5.457220] Code: fb 5b 5d c3 8b 80 68 07 00 00 85 c0 75 b7 80 3d 0f=
 91 87 01 00 75 ae 48 c7 c7 2f 57 4f 82 c6 05 ff 90 87 01 01 e8 37 7c ff ff=
 <0f> 0b eb 97 48 89 ef e8 fb a0 05 00 eb a5 66 8b 05 32 57 79 01 66
> > [    5.457693] RSP: 0000:ffff888236e9bb20 EFLAGS: 00010282
> > [    5.457693] RAX: 0000000000000000 RBX: 0000000000000200 RCX: 0000000=
000000000
> > [    5.457693] RDX: 0000000000000000 RSI: ffff888236e9b9e0 RDI: ffff888=
236e9b9e0
> > [    5.457693] RBP: ffffffff81038538 R08: 0000000000000000 R09: 0000888=
236e9b9e0
> > [    5.457693] R10: 0000000000000001 R11: 0000888236e9b9e7 R12: ffff888=
236f925c0
> > [    5.457693] R13: ffff888236f92600 R14: ffff888236e962c0 R15: 0000000=
000800100
> > [    5.457693] FS:  0000000000000000(0000) GS:ffffffff8284e000(0000) kn=
lGS:0000000000000000
> > [    5.457693] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    5.457693] CR2: 0000000000000000 CR3: 0000000002822001 CR4: 0000000=
0001606b0
> > [    5.457693] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> > [    5.457693] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> > [    5.457693] Call Trace:
> > [    5.457693]  fpu__copy+0xe9/0x390
> > [    5.457693]  copy_process+0x29b/0x2bc0
> > [    5.457693]  ? rb_insert_color+0x108/0x390
> > [    5.457693] KCSAN: watching read, size: 8, addr: ffffffff8281c878 [s=
lot: 28, encoded: 10ffff8281c878]
> > [    5.457693]  _do_fork+0xa9/0x7c0
> > [    5.457693]  ? __lock_acquire+0x241/0x13e0
> > [    5.457693]  ? mark_held_locks+0x49/0x70
> > [    5.457693]  ? umh_complete+0x50/0x50
> > [    5.457693]  kernel_thread+0x9e/0xd0
> > [    5.457693]  ? umh_complete+0x50/0x50
> > [    5.457693]  call_usermodehelper_exec_work+0x8e/0x120
> > [    5.457693]  ? rcu_read_lock_sched_held+0x41/0x90
> > [    5.457693]  process_one_work+0x468/0x9e0
> > [    5.457693]  worker_thread+0x83/0x610
> > [    5.457693]  ? rescuer_thread+0x590/0x590
> > [    5.457693]  kthread+0x1b4/0x1d0
> > [    5.457693]  ? kthread_create_worker_on_cpu+0xa0/0xa0
> > [    5.457693]  ret_from_fork+0x24/0x30
> > [    5.457693] irq event stamp: 219
> > [    5.457693] hardirqs last  enabled at (218): [<ffffffff81118f31>] co=
nsole_unlock+0x761/0x870
> > [    5.457693] hardirqs last disabled at (219): [<ffffffff8100260e>] tr=
ace_hardirqs_off_thunk+0x1a/0x1c
> > [    5.457693] softirqs last  enabled at (80): [<ffffffff81038538>] fpu=
__copy+0xd8/0x390
> > [    5.457693] softirqs last disabled at (195): [<ffffffff810384c3>] fp=
u__copy+0x63/0x390
> > [    5.457693] ---[ end trace 3e3648b70f09208e ]---
> > [    5.457693] KCSAN: watching write, size: 8, addr: ffff888236e9b7c0 [=
slot: 27, encoded: 8010888236e9b7c0]
> =

> Thanks for this. However, the random config this is using has
> CONFIG_KCSAN_DEBUG=3Dy.
> =

> It also has LOCKDEP=3Dy, and the warning above is generated by a lockdep
> assertion. I'm not surprised, because CONFIG_KCSAN_DEBUG=3Dy just prints
> information about every set up watchpoint, and calling printk from
> some locations to show this information then causes the assertion to
> fail (without KCSAN_DEBUG no warnings are generated). KCSAN_DEBUG
> should only be used by KCSAN developers.
> =

> There are 4 options:
> =

> 1. Do nothing, and just beware that KCSAN_DEBUG is not to be used
> except by KCSAN developers. It's quite obvious if it's enabled,
> because the console also gets spammed with information about
> watchpoints. The main purpose so far has been to debug watchpoint
> encoding.
> =

> 2. Remove the KCSAN_DEBUG option entirely.
> =

> 3. Make this work with lockdep. I don't think this is valuable, since
> I never expected this option to work with such config combinations
> (and chasing this up might be a deep rabbit hole without real
> benefit).
> =

> 4. Guard the option so that test robots never enable it. Is there an
> option that can be used for this?
> =

> My preference is 1 (or 2, if necessary).  AFAIK there is no option for
> 4 (CONFIG_COMPILE_TEST doesn't apply).
Thanks Marco for detail info, we (0-day ci) will take a look at preference =
4,
and consult you if any question.

> =

> Thanks,
> -- Marco
> =

> >                                                           # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> > git bisect start 770fbb32d34e5d6298cc2be590c9d2fd6069aa17 f8788d86ab28f=
61f7b46eb6be375f8a726783636 --
> > git bisect good 9d80285654d339544828950e079e62d41891ff2d  # 16:31  G   =
  10     0    7  15  Merge remote-tracking branch 'i2c/i2c/for-next'
> > git bisect good 16ec05acd66e5c80698c2f5e50723e580d270b73  # 16:39  G   =
  10     0    0   3  Merge remote-tracking branch 'edac/edac-for-next'
> > git bisect  bad 077d565f8a071c9ade174052bd2724d70091664b  # 16:39  B   =
   0    13   30   0  Merge remote-tracking branch 'slave-dma/next'
> > git bisect  bad 9a4bc229bd283d7da3f56ad065031d59fc16dd33  # 16:39  B   =
   0    13   29   0  Merge remote-tracking branch 'usb/usb-next'
> > git bisect  bad 491c6161c2addc6e601f592a0c68af9b75f7f16b  # 16:39  B   =
   0    11   27   0  Merge remote-tracking branch 'workqueues/for-next'
> > git bisect  bad 072396bd132d5914605599bb8acc01175e6d5623  # 16:39  B   =
   1     9    0   1  Merge remote-tracking branch 'kvms390/next'
> > git bisect  bad aad0c7255f300b15beb0f1b9b9e92db47b814ffa  # 17:00  B   =
   0     1   17   0  Merge remote-tracking branch 'rcu/rcu/next'
> > git bisect good b5e91fead597a4eca629e0d2dcf767d49b79acb3  # 17:55  G   =
  11     0   11  11  Merge branches 'doc.2020.02.27a', 'fixes.2020.02.27a',=
 'kfree_rcu.2020.02.20a', 'locktorture.2020.02.20a', 'ovld.2020.02.20a', 'r=
cu-tasks.2020.02.20a', 'srcu.2020.02.20a' and 'torture.2020.02.20a' into HE=
AD
> > git bisect good c53e3e7401f6faca431fdf435181e54a130f4eb0  # 18:40  G   =
  11     0   11  18  tools/memory-model: Use "-unroll 0" to keep --hw runs =
finite
> > git bisect  bad 218a10d2260b9fca4142e38d254f844db75e0856  # 18:56  B   =
   0     1   21   4  kcsan, trace: Make KCSAN compatible with tracing
> > git bisect  bad d18f1a33e4a37a8f41bfd431250337fdb3ba23cc  # 19:17  B   =
   0     2   18   0  kcsan: Clarify Kconfig option KCSAN_IGNORE_ATOMICS
> > git bisect  bad 3c1b8e31ace831ff6dc9f6e9ad51bc8b574a032c  # 19:39  B   =
   0     1   17   0  include/linux: Add instrumented.h infrastructure
> > git bisect good f7f8c8ae79d181daeb10932581cb341612c0404a  # 20:00  G   =
  11     0    3   4  kcsan: Show full access type in report
> > git bisect  bad fbc2d237ab2f9012de5ea3ac27cc726d0bb20681  # 20:23  B   =
   0     1   17   0  kcsan: Make KCSAN compatible with lockdep
> > git bisect good 5e250abcb18a9db7331c635e305ac842d4ffccd4  # 20:43  G   =
  11     0    1   1  kcsan: Rate-limit reporting per data races
> > # first bad commit: [fbc2d237ab2f9012de5ea3ac27cc726d0bb20681] kcsan: M=
ake KCSAN compatible with lockdep
> > git bisect good 5e250abcb18a9db7331c635e305ac842d4ffccd4  # 20:55  G   =
  36     0    6   9  kcsan: Rate-limit reporting per data races
> > # extra tests with debug options
> > git bisect good fbc2d237ab2f9012de5ea3ac27cc726d0bb20681  # 21:20  G   =
  12     0    0   0  kcsan: Make KCSAN compatible with lockdep
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4304202456794658122==--

