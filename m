Content-Type: multipart/mixed; boundary="===============5628672339098188655=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [printk] INFO: possible circular locking dependency detected
Date: Fri, 01 Aug 2014 12:34:51 +0200
Message-ID: <20140801103451.GC27281@quack.suse.cz>
In-Reply-To: <20140801012638.GB8729@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5628672339098188655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Hello,

On Fri 01-08-14 09:26:38, Wu Fengguang wrote:
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 939f04bec1a4ef6ba4370b0f34b01decc844b1b1
> Author:     Jan Kara <jack@suse.cz>
> AuthorDate: Wed Jun 4 16:11:37 2014 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Wed Jun 4 16:54:17 2014 -0700
> =

>     printk: enable interrupts before calling console_trylock_for_printk()
>     =

>     We need interrupts disabled when calling console_trylock_for_printk()
>     only so that cpu id we pass to can_use_console() remains valid (for
>     other things console_sem provides all the exclusion we need and
>     deadlocks on console_sem due to interrupts are impossible because we =
use
>     down_trylock()).  However if we are rescheduled, we are guaranteed to
>     run on an online cpu so we can easily just get the cpu id in
>     can_use_console().
>     =

>     We can lose a bit of performance when we enable interrupts in
>     vprintk_emit() and then disable them again in console_unlock() but OT=
OH
>     it can somewhat reduce interrupt latency caused by console_unlock()
>     especially since later in the patch series we will want to spin on
>     console_sem in console_trylock_for_printk().
>     =

>     Signed-off-by: Jan Kara <jack@suse.cz>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
  Thanks for report! Two notes here:
1) This commit has been reverted from upstream already because machines
   with lockdep enabled were unable to boot in some cases (lockdep decided
   to report problem and hung the machine while doing it).
2) This patch just makes the problem visible.

  In this particular case I think the problem is in
clockevents_increase_min_delta(). It is calling printk() from under
hrtimer_bases.lock and that is causing lock inversion with some scheduler
locks.

The attached patch should fix the problem. Can you please test it (but you
cannot use latest Linus' kernel as that has
939f04bec1a4ef6ba4370b0f34b01decc844b1b1 reverted)? =


								Honza


> +----------------------------------------------------+------------+------=
------+------------+
> |                                                    | bd8d7cf5b8 | 939f0=
4bec1 | fb3ec67942 |
> +----------------------------------------------------+------------+------=
------+------------+
> | boot_successes                                     | 1159       | 280  =
      | 41         |
> | boot_failures                                      | 41         | 20   =
      | 5          |
> | BUG:kernel_boot_hang                               | 41         | 13   =
      | 3          |
> | INFO:possible_circular_locking_dependency_detected | 0          | 7    =
      | 2          |
> | backtrace:do_fork                                  | 0          | 7    =
      | 2          |
> | backtrace:vfs_write                                | 0          | 7    =
      | 2          |
> | backtrace:SyS_write                                | 0          | 7    =
      | 2          |
> | backtrace:event_create_dir                         | 0          | 2    =
      | 1          |
> | backtrace:event_trace_init                         | 0          | 2    =
      | 1          |
> | backtrace:kernel_init_freeable                     | 0          | 3    =
      | 1          |
> | backtrace:SYSC_perf_event_open                     | 0          | 7    =
      | 2          |
> | backtrace:SyS_perf_event_open                      | 0          | 7    =
      | 2          |
> | backtrace:trace_create_cpu_file                    | 0          | 1    =
      |            |
> | backtrace:init_tracer_debugfs                      | 0          | 1    =
      |            |
> | backtrace:tracer_init_debugfs                      | 0          | 1    =
      |            |
> +----------------------------------------------------+------------+------=
------+------------+
> =

> [   29.644027] CE: hpet increased min_delta_ns to 25312 nsec
> [   29.644027] =

> [   29.644027] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   29.644027] [ INFO: possible circular locking dependency detected ]
> [   29.644027] 3.15.0-rc8-06195-g939f04b #2 Not tainted
> [   29.644027] -------------------------------------------------------
> [   29.644027] trinity-main/74 is trying to acquire lock:
> [   29.644027]  (&port_lock_key){-.....}, at: [<811c60be>] serial8250_con=
sole_write+0x8c/0x10c
> [   29.644027] =

> [   29.644027] but task is already holding lock:
> [   29.644027]  (hrtimer_bases.lock){-.-...}, at: [<8103caeb>] hrtimer_tr=
y_to_cancel+0x13/0x66
> [   29.644027] =

> [   29.644027] which lock already depends on the new lock.
> [   29.644027] =

> [   29.644027] =

> [   29.644027] the existing dependency chain (in reverse order) is:
> [   29.644027] =

> [   29.644027] -> #5 (hrtimer_bases.lock){-.-...}:
> [   29.644027]        [<8104a942>] lock_acquire+0x92/0x101
> [   29.644027]        [<8142f11d>] _raw_spin_lock_irqsave+0x2e/0x3e
> [   29.644027]        [<8103c918>] __hrtimer_start_range_ns+0x1c/0x197
> [   29.644027]        [<8107ec20>] perf_swevent_start_hrtimer.part.41+0x7=
a/0x85
> [   29.644027]        [<81080792>] task_clock_event_start+0x3a/0x3f
> [   29.644027]        [<810807a4>] task_clock_event_add+0xd/0x14
> [   29.644027]        [<8108259a>] event_sched_in+0xb6/0x17a
> [   29.644027]        [<810826a2>] group_sched_in+0x44/0x122
> [   29.644027]        [<81082885>] ctx_sched_in.isra.67+0x105/0x11f
> [   29.644027]        [<810828e6>] perf_event_sched_in.isra.70+0x47/0x4b
> [   29.644027]        [<81082bf6>] __perf_install_in_context+0x8b/0xa3
> [   29.644027]        [<8107eb8e>] remote_function+0x12/0x2a
> [   29.644027]        [<8105f5af>] smp_call_function_single+0x2d/0x53
> [   29.644027]        [<8107e17d>] task_function_call+0x30/0x36
> [   29.644027]        [<8107fb82>] perf_install_in_context+0x87/0xbb
> [   29.644027]        [<810852c9>] SYSC_perf_event_open+0x5c6/0x701
> [   29.644027]        [<810856f9>] SyS_perf_event_open+0x17/0x19
> [   29.644027]        [<8142f8ee>] syscall_call+0x7/0xb
> [   29.644027] =

> [   29.644027] -> #4 (&ctx->lock){......}:
> [   29.644027]        [<8104a942>] lock_acquire+0x92/0x101
> [   29.644027]        [<8142f04c>] _raw_spin_lock+0x21/0x30
> [   29.644027]        [<81081df3>] __perf_event_task_sched_out+0x1dc/0x34f
> [   29.644027]        [<8142cacc>] __schedule+0x4c6/0x4cb
> [   29.644027]        [<8142cae0>] schedule+0xf/0x11
> [   29.644027]        [<8142f9a6>] work_resched+0x5/0x30
> [   29.644027] =

> [   29.644027] -> #3 (&rq->lock){-.-.-.}:
> [   29.644027]        [<8104a942>] lock_acquire+0x92/0x101
> [   29.644027]        [<8142f04c>] _raw_spin_lock+0x21/0x30
> [   29.644027]        [<81040873>] __task_rq_lock+0x33/0x3a
> [   29.644027]        [<8104184c>] wake_up_new_task+0x25/0xc2
> [   29.644027]        [<8102474b>] do_fork+0x15c/0x2a0
> [   29.644027]        [<810248a9>] kernel_thread+0x1a/0x1f
> [   29.644027]        [<814232a2>] rest_init+0x1a/0x10e
> [   29.644027]        [<817af949>] start_kernel+0x303/0x308
> [   29.644027]        [<817af2ab>] i386_start_kernel+0x79/0x7d
> [   29.644027] =

> [   29.644027] -> #2 (&p->pi_lock){-.-...}:
> [   29.644027]        [<8104a942>] lock_acquire+0x92/0x101
> [   29.644027]        [<8142f11d>] _raw_spin_lock_irqsave+0x2e/0x3e
> [   29.644027]        [<810413dd>] try_to_wake_up+0x1d/0xd6
> [   29.644027]        [<810414cd>] default_wake_function+0xb/0xd
> [   29.644027]        [<810461f3>] __wake_up_common+0x39/0x59
> [   29.644027]        [<81046346>] __wake_up+0x29/0x3b
> [   29.644027]        [<811b8733>] tty_wakeup+0x49/0x51
> [   29.644027]        [<811c3568>] uart_write_wakeup+0x17/0x19
> [   29.644027]        [<811c5dc1>] serial8250_tx_chars+0xbc/0xfb
> [   29.644027]        [<811c5f28>] serial8250_handle_irq+0x54/0x6a
> [   29.644027]        [<811c5f57>] serial8250_default_handle_irq+0x19/0x1c
> [   29.644027]        [<811c56d8>] serial8250_interrupt+0x38/0x9e
> [   29.644027]        [<810510e7>] handle_irq_event_percpu+0x5f/0x1e2
> [   29.644027]        [<81051296>] handle_irq_event+0x2c/0x43
> [   29.644027]        [<81052cee>] handle_level_irq+0x57/0x80
> [   29.644027]        [<81002a72>] handle_irq+0x46/0x5c
> [   29.644027]        [<810027df>] do_IRQ+0x32/0x89
> [   29.644027]        [<8143036e>] common_interrupt+0x2e/0x33
> [   29.644027]        [<8142f23c>] _raw_spin_unlock_irqrestore+0x3f/0x49
> [   29.644027]        [<811c25a4>] uart_start+0x2d/0x32
> [   29.644027]        [<811c2c04>] uart_write+0xc7/0xd6
> [   29.644027]        [<811bc6f6>] n_tty_write+0xb8/0x35e
> [   29.644027]        [<811b9beb>] tty_write+0x163/0x1e4
> [   29.644027]        [<811b9cd9>] redirected_tty_write+0x6d/0x75
> [   29.644027]        [<810b6ed6>] vfs_write+0x75/0xb0
> [   29.644027]        [<810b7265>] SyS_write+0x44/0x77
> [   29.644027]        [<8142f8ee>] syscall_call+0x7/0xb
> [   29.644027] =

> [   29.644027] -> #1 (&tty->write_wait){-.....}:
> [   29.644027]        [<8104a942>] lock_acquire+0x92/0x101
> [   29.644027]        [<8142f11d>] _raw_spin_lock_irqsave+0x2e/0x3e
> [   29.644027]        [<81046332>] __wake_up+0x15/0x3b
> [   29.644027]        [<811b8733>] tty_wakeup+0x49/0x51
> [   29.644027]        [<811c3568>] uart_write_wakeup+0x17/0x19
> [   29.644027]        [<811c5dc1>] serial8250_tx_chars+0xbc/0xfb
> [   29.644027]        [<811c5f28>] serial8250_handle_irq+0x54/0x6a
> [   29.644027]        [<811c5f57>] serial8250_default_handle_irq+0x19/0x1c
> [   29.644027]        [<811c56d8>] serial8250_interrupt+0x38/0x9e
> [   29.644027]        [<810510e7>] handle_irq_event_percpu+0x5f/0x1e2
> [   29.644027]        [<81051296>] handle_irq_event+0x2c/0x43
> [   29.644027]        [<81052cee>] handle_level_irq+0x57/0x80
> [   29.644027]        [<81002a72>] handle_irq+0x46/0x5c
> [   29.644027]        [<810027df>] do_IRQ+0x32/0x89
> [   29.644027]        [<8143036e>] common_interrupt+0x2e/0x33
> [   29.644027]        [<8142f23c>] _raw_spin_unlock_irqrestore+0x3f/0x49
> [   29.644027]        [<811c25a4>] uart_start+0x2d/0x32
> [   29.644027]        [<811c2c04>] uart_write+0xc7/0xd6
> [   29.644027]        [<811bc6f6>] n_tty_write+0xb8/0x35e
> [   29.644027]        [<811b9beb>] tty_write+0x163/0x1e4
> [   29.644027]        [<811b9cd9>] redirected_tty_write+0x6d/0x75
> [   29.644027]        [<810b6ed6>] vfs_write+0x75/0xb0
> [   29.644027]        [<810b7265>] SyS_write+0x44/0x77
> [   29.644027]        [<8142f8ee>] syscall_call+0x7/0xb
> [   29.644027] =

> [   29.644027] -> #0 (&port_lock_key){-.....}:
> [   29.644027]        [<8104a62d>] __lock_acquire+0x9ea/0xc6d
> [   29.644027]        [<8104a942>] lock_acquire+0x92/0x101
> [   29.644027]        [<8142f11d>] _raw_spin_lock_irqsave+0x2e/0x3e
> [   29.644027]        [<811c60be>] serial8250_console_write+0x8c/0x10c
> [   29.644027]        [<8104e402>] call_console_drivers.constprop.31+0x87=
/0x118
> [   29.644027]        [<8104f5d5>] console_unlock+0x1d7/0x398
> [   29.644027]        [<8104fb70>] vprintk_emit+0x3da/0x3e4
> [   29.644027]        [<81425f76>] printk+0x17/0x19
> [   29.644027]        [<8105bfa0>] clockevents_program_min_delta+0x104/0x=
116
> [   29.644027]        [<8105c548>] clockevents_program_event+0xe7/0xf3
> [   29.644027]        [<8105cc1c>] tick_program_event+0x1e/0x23
> [   29.644027]        [<8103c43c>] hrtimer_force_reprogram+0x88/0x8f
> [   29.644027]        [<8103c49e>] __remove_hrtimer+0x5b/0x79
> [   29.644027]        [<8103cb21>] hrtimer_try_to_cancel+0x49/0x66
> [   29.644027]        [<8103cb4b>] hrtimer_cancel+0xd/0x18
> [   29.644027]        [<8107f102>] perf_swevent_cancel_hrtimer.part.60+0x=
2b/0x30
> [   29.644027]        [<81080705>] task_clock_event_stop+0x20/0x64
> [   29.644027]        [<81080756>] task_clock_event_del+0xd/0xf
> [   29.644027]        [<81081350>] event_sched_out+0xab/0x11e
> [   29.644027]        [<810813e0>] group_sched_out+0x1d/0x66
> [   29.644027]        [<81081682>] ctx_sched_out+0xaf/0xbf
> [   29.644027]        [<81081e04>] __perf_event_task_sched_out+0x1ed/0x34f
> [   29.644027]        [<8142cacc>] __schedule+0x4c6/0x4cb
> [   29.644027]        [<8142cae0>] schedule+0xf/0x11
> [   29.644027]        [<8142f9a6>] work_resched+0x5/0x30
> [   29.644027] =

> [   29.644027] other info that might help us debug this:
> [   29.644027] =

> [   29.644027] Chain exists of:
> [   29.644027]   &port_lock_key --> &ctx->lock --> hrtimer_bases.lock
> [   29.644027] =

> [   29.644027]  Possible unsafe locking scenario:
> [   29.644027] =

> [   29.644027]        CPU0                    CPU1
> [   29.644027]        ----                    ----
> [   29.644027]   lock(hrtimer_bases.lock);
> [   29.644027]                                lock(&ctx->lock);
> [   29.644027]                                lock(hrtimer_bases.lock);
> [   29.644027]   lock(&port_lock_key);
> [   29.644027] =

> [   29.644027]  *** DEADLOCK ***
> [   29.644027] =

> [   29.644027] 4 locks held by trinity-main/74:
> [   29.644027]  #0:  (&rq->lock){-.-.-.}, at: [<8142c6f3>] __schedule+0xe=
d/0x4cb
> [   29.644027]  #1:  (&ctx->lock){......}, at: [<81081df3>] __perf_event_=
task_sched_out+0x1dc/0x34f
> [   29.644027]  #2:  (hrtimer_bases.lock){-.-...}, at: [<8103caeb>] hrtim=
er_try_to_cancel+0x13/0x66
> [   29.644027]  #3:  (console_lock){+.+...}, at: [<8104fb5d>] vprintk_emi=
t+0x3c7/0x3e4
> [   29.644027] =

> [   29.644027] stack backtrace:
> [   29.644027] CPU: 0 PID: 74 Comm: trinity-main Not tainted 3.15.0-rc8-0=
6195-g939f04b #2
> [   29.644027]  00000000 81c3a310 8b995c14 81426f69 8b995c44 81425a99 816=
1f671 8161f570
> [   29.644027]  8161f538 8161f559 8161f538 8b995c78 8b142bb0 00000004 8b1=
42fdc 8b142bb0
> [   29.644027]  8b995ca8 8104a62d 8b142fac 000016f2 81c3a310 00000001 000=
00001 00000003
> [   29.644027] Call Trace:
> [   29.644027]  [<81426f69>] dump_stack+0x16/0x18
> [   29.644027]  [<81425a99>] print_circular_bug+0x18f/0x19c
> [   29.644027]  [<8104a62d>] __lock_acquire+0x9ea/0xc6d
> [   29.644027]  [<8104a942>] lock_acquire+0x92/0x101
> [   29.644027]  [<811c60be>] ? serial8250_console_write+0x8c/0x10c
> [   29.644027]  [<811c6032>] ? wait_for_xmitr+0x76/0x76
> [   29.644027]  [<8142f11d>] _raw_spin_lock_irqsave+0x2e/0x3e
> [   29.644027]  [<811c60be>] ? serial8250_console_write+0x8c/0x10c
> [   29.644027]  [<811c60be>] serial8250_console_write+0x8c/0x10c
> [   29.644027]  [<8104af87>] ? lock_release+0x191/0x223
> [   29.644027]  [<811c6032>] ? wait_for_xmitr+0x76/0x76
> [   29.644027]  [<8104e402>] call_console_drivers.constprop.31+0x87/0x118
> [   29.644027]  [<8104f5d5>] console_unlock+0x1d7/0x398
> [   29.644027]  [<8104fb70>] vprintk_emit+0x3da/0x3e4
> [   29.644027]  [<81425f76>] printk+0x17/0x19
> [   29.644027]  [<8105bfa0>] clockevents_program_min_delta+0x104/0x116
> [   29.644027]  [<8105c548>] clockevents_program_event+0xe7/0xf3
> [   29.644027]  [<8105cc1c>] tick_program_event+0x1e/0x23
> [   29.644027]  [<8103c43c>] hrtimer_force_reprogram+0x88/0x8f
> [   29.644027]  [<8103c49e>] __remove_hrtimer+0x5b/0x79
> [   29.644027]  [<8103cb21>] hrtimer_try_to_cancel+0x49/0x66
> [   29.644027]  [<8103cb4b>] hrtimer_cancel+0xd/0x18
> [   29.644027]  [<8107f102>] perf_swevent_cancel_hrtimer.part.60+0x2b/0x30
> [   29.644027]  [<81080705>] task_clock_event_stop+0x20/0x64
> [   29.644027]  [<81080756>] task_clock_event_del+0xd/0xf
> [   29.644027]  [<81081350>] event_sched_out+0xab/0x11e
> [   29.644027]  [<810813e0>] group_sched_out+0x1d/0x66
> [   29.644027]  [<81081682>] ctx_sched_out+0xaf/0xbf
> [   29.644027]  [<81081e04>] __perf_event_task_sched_out+0x1ed/0x34f
> [   29.644027]  [<8104416d>] ? __dequeue_entity+0x23/0x27
> [   29.644027]  [<81044505>] ? pick_next_task_fair+0xb1/0x120
> [   29.644027]  [<8142cacc>] __schedule+0x4c6/0x4cb
> [   29.644027]  [<81047574>] ? trace_hardirqs_off_caller+0xd7/0x108
> [   29.644027]  [<810475b0>] ? trace_hardirqs_off+0xb/0xd
> [   29.644027]  [<81056346>] ? rcu_irq_exit+0x64/0x77
> =

> git bisect start 9f6226a762c7ae02f6a23a3d4fc552dafa57ea23 v3.15 --
> git bisect  bad 71998d1be4ae70e7d320cdd21595c1a02a29c61e  # 01:13     79-=
      5  Merge branch 'x86-irq-for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tip/tip
> git bisect  bad 9ee4d7a6538308a7681b638d2f35f2a301420355  # 01:24      3-=
      1  Merge branch 'akpm' (patches from Andrew Morton)
> git bisect  bad 9894e6d9c020b754dd962960e9f7eac18282f69f  # 01:58    128-=
      5  Merge tag 'fbdev-omap-dt-3.16' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/tomba/linux
> git bisect  bad 963649d735c8b6eb0f97e82c54f02426ff3f1f45  # 02:06     48-=
      3  Merge tag 'for-linus-3.16-merge-window' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/ericvh/v9fs
> git bisect  bad b20dcab9d4589ef9918a13c888c5493945adfc13  # 02:13     35-=
      1  Merge tag 'llvmlinux-for-v3.16' of git://git.linuxfoundation.org/l=
lvmlinux/kernel
> git bisect  bad 3f17ea6dea8ba5668873afa54628a91aaa3fb1c0  # 02:19     58-=
      4  Merge branch 'next' (accumulated 3.16 merge window patches) into m=
aster
> git bisect good 49eb7b0750d9483c74e9c14ae6ea1e9d62481c3c  # 02:35    300+=
      7  Merge tag 'tty-3.16-rc1' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/gregkh/tty into next
> git bisect good 15b588303155b22edd559672905db8e59a44ef9a  # 02:51    300+=
      0  Merge tag 'fbdev-omap-3.16' of git://git.kernel.org/pub/scm/linux/=
kernel/git/tomba/linux into next
> git bisect good d09cc3659db494aca4b3bb2393c533fb4946b794  # 03:19    300+=
      1  Merge branch 'irq-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip into next
> git bisect  bad cc07aabc53978ae09a1d539237189f7c9841060a  # 03:37     66-=
      2  Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/arm64/linux into next
> git bisect  bad 8091b895b76f690aa2f6689b6ed602f07525a938  # 04:55    103-=
      1  fs/ncpfs/getopt.c: replace simple_strtoul by kstrtoul
> git bisect good d53aea3d46d64e95da9952887969f7533b9ab25e  # 05:59    300+=
     19  mm, compaction: return failed migration target pages back to freel=
ist
> git bisect good 72d09633c9afa02bea317d65eb8b8a4ce7659a2a  # 06:31    300+=
     10  mm/zswap: NUMA aware allocation for zswap_dstmem
> git bisect  bad 0046dd9fed0c9313cbb4fb860324476cd298dc9f  # 06:35     42-=
      1  lib/string.c: use the name "C-string" in comments
> git bisect good 0a581694ab7a5bc083d710df8a552a6a055b005f  # 06:54    300+=
     15  printk: split code for making free space in the log buffer
> git bisect  bad 939f04bec1a4ef6ba4370b0f34b01decc844b1b1  # 06:58     46-=
      2  printk: enable interrupts before calling console_trylock_for_print=
k()
> git bisect good 034633ccb24d675850f99bf85c1c5880c831e4b6  # 07:16    300+=
     28  printk: return really stored message length
> git bisect good 608873cacb9d0d2811586fcc79a38b64eabd6d32  # 07:29    300+=
     22  printk: release lockbuf_lock before calling console_trylock_for_pr=
intk()
> git bisect good bd8d7cf5b8410fe98eba06a9aaa90efe88815d8a  # 07:42    300+=
      7  printk: fix lockdep instrumentation of console_sem
> # first bad commit: [939f04bec1a4ef6ba4370b0f34b01decc844b1b1] printk: en=
able interrupts before calling console_trylock_for_printk()
> git bisect good bd8d7cf5b8410fe98eba06a9aaa90efe88815d8a  # 08:21    900+=
     41  printk: fix lockdep instrumentation of console_sem
> git bisect  bad fb3ec67942e92e5713e05b7691b277d0a0c0575d  # 08:21      0-=
      5  KVM: arm64: GICv3: mandate page-aligned GICV region
> git bisect good 6f0928036bcbd8dd2ebee9201580da8bcc0a81af  # 08:49    900+=
     87  Merge tag 'pm+acpi-3.16-rc8' of git://git.kernel.org/pub/scm/linux=
/kernel/git/rafael/linux-pm
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-i386.cgz
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
> 	panic=3D10
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
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

-- =

Jan Kara <jack@suse.cz>
SUSE Labs, CR

--===============5628672339098188655==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-timer-Fix-lock-inversion-between-hrtimer_bases.lock-.patch"

PkZyb20gM2NmOGExOTFiN2M0OGJhMTAyMzk4OTJlZmJmZTgzMGFiMTg5ZTkzYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KRGF0ZTogRnJpLCAx
IEF1ZyAyMDE0IDEyOjIwOjAyICswMjAwClN1YmplY3Q6IFtQQVRDSF0gdGltZXI6IEZpeCBsb2Nr
IGludmVyc2lvbiBiZXR3ZWVuIGhydGltZXJfYmFzZXMubG9jayBhbmQKIHNjaGVkdWxlciBsb2Nr
cwoKY2xvY2tldmVudHNfaW5jcmVhc2VfbWluX2RlbHRhKCkgY2FsbHMgcHJpbnRrKCkgZnJvbSB1
bmRlcgpocnRpbWVyX2Jhc2VzLmxvY2suIFRoYXQgY2F1c2VzIGxvY2sgaW52ZXJzaW9uIG9uIHNj
aGVkdWxlciBsb2NrcyBiZWNhdXNlCnByaW50aygpIGNhbiBjYWxsIGludG8gdGhlIHNjaGVkdWxl
ci4gTG9ja2RlcCBwdXRzIGl0IGFzOgoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09ClsgSU5GTzogcG9zc2libGUgY2lyY3VsYXIgbG9ja2luZyBk
ZXBlbmRlbmN5IGRldGVjdGVkIF0KMy4xNS4wLXJjOC0wNjE5NS1nOTM5ZjA0YiAjMiBOb3QgdGFp
bnRlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCnRyaW5pdHktbWFpbi83NCBpcyB0cnlpbmcgdG8gYWNxdWlyZSBsb2NrOgogKCZwb3J0X2xv
Y2tfa2V5KXstLi4uLi59LCBhdDogWzw4MTFjNjBiZT5dIHNlcmlhbDgyNTBfY29uc29sZV93cml0
ZSsweDhjLzB4MTBjCgpidXQgdGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9jazoKIChocnRpbWVy
X2Jhc2VzLmxvY2spey0uLS4uLn0sIGF0OiBbPDgxMDNjYWViPl0gaHJ0aW1lcl90cnlfdG9fY2Fu
Y2VsKzB4MTMvMHg2NgoKd2hpY2ggbG9jayBhbHJlYWR5IGRlcGVuZHMgb24gdGhlIG5ldyBsb2Nr
LgoKdGhlIGV4aXN0aW5nIGRlcGVuZGVuY3kgY2hhaW4gKGluIHJldmVyc2Ugb3JkZXIpIGlzOgoK
LT4gIzUgKGhydGltZXJfYmFzZXMubG9jayl7LS4tLi4ufToKICAgICAgIFs8ODEwNGE5NDI+XSBs
b2NrX2FjcXVpcmUrMHg5Mi8weDEwMQogICAgICAgWzw4MTQyZjExZD5dIF9yYXdfc3Bpbl9sb2Nr
X2lycXNhdmUrMHgyZS8weDNlCiAgICAgICBbPDgxMDNjOTE4Pl0gX19ocnRpbWVyX3N0YXJ0X3Jh
bmdlX25zKzB4MWMvMHgxOTcKICAgICAgIFs8ODEwN2VjMjA+XSBwZXJmX3N3ZXZlbnRfc3RhcnRf
aHJ0aW1lci5wYXJ0LjQxKzB4N2EvMHg4NQogICAgICAgWzw4MTA4MDc5Mj5dIHRhc2tfY2xvY2tf
ZXZlbnRfc3RhcnQrMHgzYS8weDNmCiAgICAgICBbPDgxMDgwN2E0Pl0gdGFza19jbG9ja19ldmVu
dF9hZGQrMHhkLzB4MTQKICAgICAgIFs8ODEwODI1OWE+XSBldmVudF9zY2hlZF9pbisweGI2LzB4
MTdhCiAgICAgICBbPDgxMDgyNmEyPl0gZ3JvdXBfc2NoZWRfaW4rMHg0NC8weDEyMgogICAgICAg
Wzw4MTA4Mjg4NT5dIGN0eF9zY2hlZF9pbi5pc3JhLjY3KzB4MTA1LzB4MTFmCiAgICAgICBbPDgx
MDgyOGU2Pl0gcGVyZl9ldmVudF9zY2hlZF9pbi5pc3JhLjcwKzB4NDcvMHg0YgogICAgICAgWzw4
MTA4MmJmNj5dIF9fcGVyZl9pbnN0YWxsX2luX2NvbnRleHQrMHg4Yi8weGEzCiAgICAgICBbPDgx
MDdlYjhlPl0gcmVtb3RlX2Z1bmN0aW9uKzB4MTIvMHgyYQogICAgICAgWzw4MTA1ZjVhZj5dIHNt
cF9jYWxsX2Z1bmN0aW9uX3NpbmdsZSsweDJkLzB4NTMKICAgICAgIFs8ODEwN2UxN2Q+XSB0YXNr
X2Z1bmN0aW9uX2NhbGwrMHgzMC8weDM2CiAgICAgICBbPDgxMDdmYjgyPl0gcGVyZl9pbnN0YWxs
X2luX2NvbnRleHQrMHg4Ny8weGJiCiAgICAgICBbPDgxMDg1MmM5Pl0gU1lTQ19wZXJmX2V2ZW50
X29wZW4rMHg1YzYvMHg3MDEKICAgICAgIFs8ODEwODU2Zjk+XSBTeVNfcGVyZl9ldmVudF9vcGVu
KzB4MTcvMHgxOQogICAgICAgWzw4MTQyZjhlZT5dIHN5c2NhbGxfY2FsbCsweDcvMHhiCgotPiAj
NCAoJmN0eC0+bG9jayl7Li4uLi4ufToKICAgICAgIFs8ODEwNGE5NDI+XSBsb2NrX2FjcXVpcmUr
MHg5Mi8weDEwMQogICAgICAgWzw4MTQyZjA0Yz5dIF9yYXdfc3Bpbl9sb2NrKzB4MjEvMHgzMAog
ICAgICAgWzw4MTA4MWRmMz5dIF9fcGVyZl9ldmVudF90YXNrX3NjaGVkX291dCsweDFkYy8weDM0
ZgogICAgICAgWzw4MTQyY2FjYz5dIF9fc2NoZWR1bGUrMHg0YzYvMHg0Y2IKICAgICAgIFs8ODE0
MmNhZTA+XSBzY2hlZHVsZSsweGYvMHgxMQogICAgICAgWzw4MTQyZjlhNj5dIHdvcmtfcmVzY2hl
ZCsweDUvMHgzMAoKLT4gIzMgKCZycS0+bG9jayl7LS4tLi0ufToKICAgICAgIFs8ODEwNGE5NDI+
XSBsb2NrX2FjcXVpcmUrMHg5Mi8weDEwMQogICAgICAgWzw4MTQyZjA0Yz5dIF9yYXdfc3Bpbl9s
b2NrKzB4MjEvMHgzMAogICAgICAgWzw4MTA0MDg3Mz5dIF9fdGFza19ycV9sb2NrKzB4MzMvMHgz
YQogICAgICAgWzw4MTA0MTg0Yz5dIHdha2VfdXBfbmV3X3Rhc2srMHgyNS8weGMyCiAgICAgICBb
PDgxMDI0NzRiPl0gZG9fZm9yaysweDE1Yy8weDJhMAogICAgICAgWzw4MTAyNDhhOT5dIGtlcm5l
bF90aHJlYWQrMHgxYS8weDFmCiAgICAgICBbPDgxNDIzMmEyPl0gcmVzdF9pbml0KzB4MWEvMHgx
MGUKICAgICAgIFs8ODE3YWY5NDk+XSBzdGFydF9rZXJuZWwrMHgzMDMvMHgzMDgKICAgICAgIFs8
ODE3YWYyYWI+XSBpMzg2X3N0YXJ0X2tlcm5lbCsweDc5LzB4N2QKCi0+ICMyICgmcC0+cGlfbG9j
ayl7LS4tLi4ufToKICAgICAgIFs8ODEwNGE5NDI+XSBsb2NrX2FjcXVpcmUrMHg5Mi8weDEwMQog
ICAgICAgWzw4MTQyZjExZD5dIF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUrMHgyZS8weDNlCiAgICAg
ICBbPDgxMDQxM2RkPl0gdHJ5X3RvX3dha2VfdXArMHgxZC8weGQ2CiAgICAgICBbPDgxMDQxNGNk
Pl0gZGVmYXVsdF93YWtlX2Z1bmN0aW9uKzB4Yi8weGQKICAgICAgIFs8ODEwNDYxZjM+XSBfX3dh
a2VfdXBfY29tbW9uKzB4MzkvMHg1OQogICAgICAgWzw4MTA0NjM0Nj5dIF9fd2FrZV91cCsweDI5
LzB4M2IKICAgICAgIFs8ODExYjg3MzM+XSB0dHlfd2FrZXVwKzB4NDkvMHg1MQogICAgICAgWzw4
MTFjMzU2OD5dIHVhcnRfd3JpdGVfd2FrZXVwKzB4MTcvMHgxOQogICAgICAgWzw4MTFjNWRjMT5d
IHNlcmlhbDgyNTBfdHhfY2hhcnMrMHhiYy8weGZiCiAgICAgICBbPDgxMWM1ZjI4Pl0gc2VyaWFs
ODI1MF9oYW5kbGVfaXJxKzB4NTQvMHg2YQogICAgICAgWzw4MTFjNWY1Nz5dIHNlcmlhbDgyNTBf
ZGVmYXVsdF9oYW5kbGVfaXJxKzB4MTkvMHgxYwogICAgICAgWzw4MTFjNTZkOD5dIHNlcmlhbDgy
NTBfaW50ZXJydXB0KzB4MzgvMHg5ZQogICAgICAgWzw4MTA1MTBlNz5dIGhhbmRsZV9pcnFfZXZl
bnRfcGVyY3B1KzB4NWYvMHgxZTIKICAgICAgIFs8ODEwNTEyOTY+XSBoYW5kbGVfaXJxX2V2ZW50
KzB4MmMvMHg0MwogICAgICAgWzw4MTA1MmNlZT5dIGhhbmRsZV9sZXZlbF9pcnErMHg1Ny8weDgw
CiAgICAgICBbPDgxMDAyYTcyPl0gaGFuZGxlX2lycSsweDQ2LzB4NWMKICAgICAgIFs8ODEwMDI3
ZGY+XSBkb19JUlErMHgzMi8weDg5CiAgICAgICBbPDgxNDMwMzZlPl0gY29tbW9uX2ludGVycnVw
dCsweDJlLzB4MzMKICAgICAgIFs8ODE0MmYyM2M+XSBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3Rv
cmUrMHgzZi8weDQ5CiAgICAgICBbPDgxMWMyNWE0Pl0gdWFydF9zdGFydCsweDJkLzB4MzIKICAg
ICAgIFs8ODExYzJjMDQ+XSB1YXJ0X3dyaXRlKzB4YzcvMHhkNgogICAgICAgWzw4MTFiYzZmNj5d
IG5fdHR5X3dyaXRlKzB4YjgvMHgzNWUKICAgICAgIFs8ODExYjliZWI+XSB0dHlfd3JpdGUrMHgx
NjMvMHgxZTQKICAgICAgIFs8ODExYjljZDk+XSByZWRpcmVjdGVkX3R0eV93cml0ZSsweDZkLzB4
NzUKICAgICAgIFs8ODEwYjZlZDY+XSB2ZnNfd3JpdGUrMHg3NS8weGIwCiAgICAgICBbPDgxMGI3
MjY1Pl0gU3lTX3dyaXRlKzB4NDQvMHg3NwogICAgICAgWzw4MTQyZjhlZT5dIHN5c2NhbGxfY2Fs
bCsweDcvMHhiCgotPiAjMSAoJnR0eS0+d3JpdGVfd2FpdCl7LS4uLi4ufToKICAgICAgIFs8ODEw
NGE5NDI+XSBsb2NrX2FjcXVpcmUrMHg5Mi8weDEwMQogICAgICAgWzw4MTQyZjExZD5dIF9yYXdf
c3Bpbl9sb2NrX2lycXNhdmUrMHgyZS8weDNlCiAgICAgICBbPDgxMDQ2MzMyPl0gX193YWtlX3Vw
KzB4MTUvMHgzYgogICAgICAgWzw4MTFiODczMz5dIHR0eV93YWtldXArMHg0OS8weDUxCiAgICAg
ICBbPDgxMWMzNTY4Pl0gdWFydF93cml0ZV93YWtldXArMHgxNy8weDE5CiAgICAgICBbPDgxMWM1
ZGMxPl0gc2VyaWFsODI1MF90eF9jaGFycysweGJjLzB4ZmIKICAgICAgIFs8ODExYzVmMjg+XSBz
ZXJpYWw4MjUwX2hhbmRsZV9pcnErMHg1NC8weDZhCiAgICAgICBbPDgxMWM1ZjU3Pl0gc2VyaWFs
ODI1MF9kZWZhdWx0X2hhbmRsZV9pcnErMHgxOS8weDFjCiAgICAgICBbPDgxMWM1NmQ4Pl0gc2Vy
aWFsODI1MF9pbnRlcnJ1cHQrMHgzOC8weDllCiAgICAgICBbPDgxMDUxMGU3Pl0gaGFuZGxlX2ly
cV9ldmVudF9wZXJjcHUrMHg1Zi8weDFlMgogICAgICAgWzw4MTA1MTI5Nj5dIGhhbmRsZV9pcnFf
ZXZlbnQrMHgyYy8weDQzCiAgICAgICBbPDgxMDUyY2VlPl0gaGFuZGxlX2xldmVsX2lycSsweDU3
LzB4ODAKICAgICAgIFs8ODEwMDJhNzI+XSBoYW5kbGVfaXJxKzB4NDYvMHg1YwogICAgICAgWzw4
MTAwMjdkZj5dIGRvX0lSUSsweDMyLzB4ODkKICAgICAgIFs8ODE0MzAzNmU+XSBjb21tb25faW50
ZXJydXB0KzB4MmUvMHgzMwogICAgICAgWzw4MTQyZjIzYz5dIF9yYXdfc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSsweDNmLzB4NDkKICAgICAgIFs8ODExYzI1YTQ+XSB1YXJ0X3N0YXJ0KzB4MmQvMHgz
MgogICAgICAgWzw4MTFjMmMwND5dIHVhcnRfd3JpdGUrMHhjNy8weGQ2CiAgICAgICBbPDgxMWJj
NmY2Pl0gbl90dHlfd3JpdGUrMHhiOC8weDM1ZQogICAgICAgWzw4MTFiOWJlYj5dIHR0eV93cml0
ZSsweDE2My8weDFlNAogICAgICAgWzw4MTFiOWNkOT5dIHJlZGlyZWN0ZWRfdHR5X3dyaXRlKzB4
NmQvMHg3NQogICAgICAgWzw4MTBiNmVkNj5dIHZmc193cml0ZSsweDc1LzB4YjAKICAgICAgIFs8
ODEwYjcyNjU+XSBTeVNfd3JpdGUrMHg0NC8weDc3CiAgICAgICBbPDgxNDJmOGVlPl0gc3lzY2Fs
bF9jYWxsKzB4Ny8weGIKCi0+ICMwICgmcG9ydF9sb2NrX2tleSl7LS4uLi4ufToKICAgICAgIFs8
ODEwNGE2MmQ+XSBfX2xvY2tfYWNxdWlyZSsweDllYS8weGM2ZAogICAgICAgWzw4MTA0YTk0Mj5d
IGxvY2tfYWNxdWlyZSsweDkyLzB4MTAxCiAgICAgICBbPDgxNDJmMTFkPl0gX3Jhd19zcGluX2xv
Y2tfaXJxc2F2ZSsweDJlLzB4M2UKICAgICAgIFs8ODExYzYwYmU+XSBzZXJpYWw4MjUwX2NvbnNv
bGVfd3JpdGUrMHg4Yy8weDEwYwogICAgICAgWzw4MTA0ZTQwMj5dIGNhbGxfY29uc29sZV9kcml2
ZXJzLmNvbnN0cHJvcC4zMSsweDg3LzB4MTE4CiAgICAgICBbPDgxMDRmNWQ1Pl0gY29uc29sZV91
bmxvY2srMHgxZDcvMHgzOTgKICAgICAgIFs8ODEwNGZiNzA+XSB2cHJpbnRrX2VtaXQrMHgzZGEv
MHgzZTQKICAgICAgIFs8ODE0MjVmNzY+XSBwcmludGsrMHgxNy8weDE5CiAgICAgICBbPDgxMDVi
ZmEwPl0gY2xvY2tldmVudHNfcHJvZ3JhbV9taW5fZGVsdGErMHgxMDQvMHgxMTYKICAgICAgIFs8
ODEwNWM1NDg+XSBjbG9ja2V2ZW50c19wcm9ncmFtX2V2ZW50KzB4ZTcvMHhmMwogICAgICAgWzw4
MTA1Y2MxYz5dIHRpY2tfcHJvZ3JhbV9ldmVudCsweDFlLzB4MjMKICAgICAgIFs8ODEwM2M0M2M+
XSBocnRpbWVyX2ZvcmNlX3JlcHJvZ3JhbSsweDg4LzB4OGYKICAgICAgIFs8ODEwM2M0OWU+XSBf
X3JlbW92ZV9ocnRpbWVyKzB4NWIvMHg3OQogICAgICAgWzw4MTAzY2IyMT5dIGhydGltZXJfdHJ5
X3RvX2NhbmNlbCsweDQ5LzB4NjYKICAgICAgIFs8ODEwM2NiNGI+XSBocnRpbWVyX2NhbmNlbCsw
eGQvMHgxOAogICAgICAgWzw4MTA3ZjEwMj5dIHBlcmZfc3dldmVudF9jYW5jZWxfaHJ0aW1lci5w
YXJ0LjYwKzB4MmIvMHgzMAogICAgICAgWzw4MTA4MDcwNT5dIHRhc2tfY2xvY2tfZXZlbnRfc3Rv
cCsweDIwLzB4NjQKICAgICAgIFs8ODEwODA3NTY+XSB0YXNrX2Nsb2NrX2V2ZW50X2RlbCsweGQv
MHhmCiAgICAgICBbPDgxMDgxMzUwPl0gZXZlbnRfc2NoZWRfb3V0KzB4YWIvMHgxMWUKICAgICAg
IFs8ODEwODEzZTA+XSBncm91cF9zY2hlZF9vdXQrMHgxZC8weDY2CiAgICAgICBbPDgxMDgxNjgy
Pl0gY3R4X3NjaGVkX291dCsweGFmLzB4YmYKICAgICAgIFs8ODEwODFlMDQ+XSBfX3BlcmZfZXZl
bnRfdGFza19zY2hlZF9vdXQrMHgxZWQvMHgzNGYKICAgICAgIFs8ODE0MmNhY2M+XSBfX3NjaGVk
dWxlKzB4NGM2LzB4NGNiCiAgICAgICBbPDgxNDJjYWUwPl0gc2NoZWR1bGUrMHhmLzB4MTEKICAg
ICAgIFs8ODE0MmY5YTY+XSB3b3JrX3Jlc2NoZWQrMHg1LzB4MzAKCm90aGVyIGluZm8gdGhhdCBt
aWdodCBoZWxwIHVzIGRlYnVnIHRoaXM6CgpDaGFpbiBleGlzdHMgb2Y6CiAgJnBvcnRfbG9ja19r
ZXkgLS0+ICZjdHgtPmxvY2sgLS0+IGhydGltZXJfYmFzZXMubG9jawoKIFBvc3NpYmxlIHVuc2Fm
ZSBsb2NraW5nIHNjZW5hcmlvOgoKICAgICAgIENQVTAgICAgICAgICAgICAgICAgICAgIENQVTEK
ICAgICAgIC0tLS0gICAgICAgICAgICAgICAgICAgIC0tLS0KICBsb2NrKGhydGltZXJfYmFzZXMu
bG9jayk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKCZjdHgtPmxvY2spOwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9jayhocnRpbWVyX2Jhc2VzLmxvY2spOwog
IGxvY2soJnBvcnRfbG9ja19rZXkpOwoKICoqKiBERUFETE9DSyAqKioKCjQgbG9ja3MgaGVsZCBi
eSB0cmluaXR5LW1haW4vNzQ6CiAjMDogICgmcnEtPmxvY2spey0uLS4tLn0sIGF0OiBbPDgxNDJj
NmYzPl0gX19zY2hlZHVsZSsweGVkLzB4NGNiCiAjMTogICgmY3R4LT5sb2NrKXsuLi4uLi59LCBh
dDogWzw4MTA4MWRmMz5dIF9fcGVyZl9ldmVudF90YXNrX3NjaGVkX291dCsweDFkYy8weDM0Zgog
IzI6ICAoaHJ0aW1lcl9iYXNlcy5sb2NrKXstLi0uLi59LCBhdDogWzw4MTAzY2FlYj5dIGhydGlt
ZXJfdHJ5X3RvX2NhbmNlbCsweDEzLzB4NjYKICMzOiAgKGNvbnNvbGVfbG9jayl7Ky4rLi4ufSwg
YXQ6IFs8ODEwNGZiNWQ+XSB2cHJpbnRrX2VtaXQrMHgzYzcvMHgzZTQKCnN0YWNrIGJhY2t0cmFj
ZToKQ1BVOiAwIFBJRDogNzQgQ29tbTogdHJpbml0eS1tYWluIE5vdCB0YWludGVkIDMuMTUuMC1y
YzgtMDYxOTUtZzkzOWYwNGIgIzIKIDAwMDAwMDAwIDgxYzNhMzEwIDhiOTk1YzE0IDgxNDI2ZjY5
IDhiOTk1YzQ0IDgxNDI1YTk5IDgxNjFmNjcxIDgxNjFmNTcwCiA4MTYxZjUzOCA4MTYxZjU1OSA4
MTYxZjUzOCA4Yjk5NWM3OCA4YjE0MmJiMCAwMDAwMDAwNCA4YjE0MmZkYyA4YjE0MmJiMAogOGI5
OTVjYTggODEwNGE2MmQgOGIxNDJmYWMgMDAwMDE2ZjIgODFjM2EzMTAgMDAwMDAwMDEgMDAwMDAw
MDEgMDAwMDAwMDMKQ2FsbCBUcmFjZToKIFs8ODE0MjZmNjk+XSBkdW1wX3N0YWNrKzB4MTYvMHgx
OAogWzw4MTQyNWE5OT5dIHByaW50X2NpcmN1bGFyX2J1ZysweDE4Zi8weDE5YwogWzw4MTA0YTYy
ZD5dIF9fbG9ja19hY3F1aXJlKzB4OWVhLzB4YzZkCiBbPDgxMDRhOTQyPl0gbG9ja19hY3F1aXJl
KzB4OTIvMHgxMDEKIFs8ODExYzYwYmU+XSA/IHNlcmlhbDgyNTBfY29uc29sZV93cml0ZSsweDhj
LzB4MTBjCiBbPDgxMWM2MDMyPl0gPyB3YWl0X2Zvcl94bWl0cisweDc2LzB4NzYKIFs8ODE0MmYx
MWQ+XSBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKzB4MmUvMHgzZQogWzw4MTFjNjBiZT5dID8gc2Vy
aWFsODI1MF9jb25zb2xlX3dyaXRlKzB4OGMvMHgxMGMKIFs8ODExYzYwYmU+XSBzZXJpYWw4MjUw
X2NvbnNvbGVfd3JpdGUrMHg4Yy8weDEwYwogWzw4MTA0YWY4Nz5dID8gbG9ja19yZWxlYXNlKzB4
MTkxLzB4MjIzCiBbPDgxMWM2MDMyPl0gPyB3YWl0X2Zvcl94bWl0cisweDc2LzB4NzYKIFs8ODEw
NGU0MDI+XSBjYWxsX2NvbnNvbGVfZHJpdmVycy5jb25zdHByb3AuMzErMHg4Ny8weDExOAogWzw4
MTA0ZjVkNT5dIGNvbnNvbGVfdW5sb2NrKzB4MWQ3LzB4Mzk4CiBbPDgxMDRmYjcwPl0gdnByaW50
a19lbWl0KzB4M2RhLzB4M2U0CiBbPDgxNDI1Zjc2Pl0gcHJpbnRrKzB4MTcvMHgxOQogWzw4MTA1
YmZhMD5dIGNsb2NrZXZlbnRzX3Byb2dyYW1fbWluX2RlbHRhKzB4MTA0LzB4MTE2CiBbPDgxMDVj
YzFjPl0gdGlja19wcm9ncmFtX2V2ZW50KzB4MWUvMHgyMwogWzw4MTAzYzQzYz5dIGhydGltZXJf
Zm9yY2VfcmVwcm9ncmFtKzB4ODgvMHg4ZgogWzw4MTAzYzQ5ZT5dIF9fcmVtb3ZlX2hydGltZXIr
MHg1Yi8weDc5CiBbPDgxMDNjYjIxPl0gaHJ0aW1lcl90cnlfdG9fY2FuY2VsKzB4NDkvMHg2Ngog
Wzw4MTAzY2I0Yj5dIGhydGltZXJfY2FuY2VsKzB4ZC8weDE4CiBbPDgxMDdmMTAyPl0gcGVyZl9z
d2V2ZW50X2NhbmNlbF9ocnRpbWVyLnBhcnQuNjArMHgyYi8weDMwCiBbPDgxMDgwNzA1Pl0gdGFz
a19jbG9ja19ldmVudF9zdG9wKzB4MjAvMHg2NAogWzw4MTA4MDc1Nj5dIHRhc2tfY2xvY2tfZXZl
bnRfZGVsKzB4ZC8weGYKIFs8ODEwODEzNTA+XSBldmVudF9zY2hlZF9vdXQrMHhhYi8weDExZQog
Wzw4MTA4MTNlMD5dIGdyb3VwX3NjaGVkX291dCsweDFkLzB4NjYKIFs8ODEwODE2ODI+XSBjdHhf
c2NoZWRfb3V0KzB4YWYvMHhiZgogWzw4MTA4MWUwND5dIF9fcGVyZl9ldmVudF90YXNrX3NjaGVk
X291dCsweDFlZC8weDM0ZgogWzw4MTA0NDE2ZD5dID8gX19kZXF1ZXVlX2VudGl0eSsweDIzLzB4
MjcKIFs8ODEwNDQ1MDU+XSA/IHBpY2tfbmV4dF90YXNrX2ZhaXIrMHhiMS8weDEyMAogWzw4MTQy
Y2FjYz5dIF9fc2NoZWR1bGUrMHg0YzYvMHg0Y2IKIFs8ODEwNDc1NzQ+XSA/IHRyYWNlX2hhcmRp
cnFzX29mZl9jYWxsZXIrMHhkNy8weDEwOAogWzw4MTA0NzViMD5dID8gdHJhY2VfaGFyZGlycXNf
b2ZmKzB4Yi8weGQKIFs8ODEwNTYzNDY+XSA/IHJjdV9pcnFfZXhpdCsweDY0LzB4NzcKCkZpeCB0
aGUgcHJvYmxlbSBieSB1c2luZyBwcmludGtfZGVmZXJyZWQoKSB3aGljaCBkb2VzIG5vdCBjYWxs
IGludG8gdGhlCnNjaGVkdWxlci4KClJlcG9ydGVkLWJ5OiBGZW5nZ3VhbmcgV3UgPGZlbmdndWFu
Zy53dUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Ci0t
LQoga2VybmVsL3RpbWUvY2xvY2tldmVudHMuYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVs
L3RpbWUvY2xvY2tldmVudHMuYyBiL2tlcm5lbC90aW1lL2Nsb2NrZXZlbnRzLmMKaW5kZXggYWQz
NjJjMjYwZWY0Li45Yzk0YzE5ZjEzMDUgMTAwNjQ0Ci0tLSBhL2tlcm5lbC90aW1lL2Nsb2NrZXZl
bnRzLmMKKysrIGIva2VybmVsL3RpbWUvY2xvY2tldmVudHMuYwpAQCAtMTQ2LDcgKzE0Niw4IEBA
IHN0YXRpYyBpbnQgY2xvY2tldmVudHNfaW5jcmVhc2VfbWluX2RlbHRhKHN0cnVjdCBjbG9ja19l
dmVudF9kZXZpY2UgKmRldikKIHsKIAkvKiBOb3RoaW5nIHRvIGRvIGlmIHdlIGFscmVhZHkgcmVh
Y2hlZCB0aGUgbGltaXQgKi8KIAlpZiAoZGV2LT5taW5fZGVsdGFfbnMgPj0gTUlOX0RFTFRBX0xJ
TUlUKSB7Ci0JCXByaW50ayhLRVJOX1dBUk5JTkcgIkNFOiBSZXByb2dyYW1taW5nIGZhaWx1cmUu
IEdpdmluZyB1cFxuIik7CisJCXByaW50a19kZWZlcnJlZChLRVJOX1dBUk5JTkcKKwkJCQkiQ0U6
IFJlcHJvZ3JhbW1pbmcgZmFpbHVyZS4gR2l2aW5nIHVwXG4iKTsKIAkJZGV2LT5uZXh0X2V2ZW50
LnR2NjQgPSBLVElNRV9NQVg7CiAJCXJldHVybiAtRVRJTUU7CiAJfQpAQCAtMTU5LDkgKzE2MCwx
MCBAQCBzdGF0aWMgaW50IGNsb2NrZXZlbnRzX2luY3JlYXNlX21pbl9kZWx0YShzdHJ1Y3QgY2xv
Y2tfZXZlbnRfZGV2aWNlICpkZXYpCiAJaWYgKGRldi0+bWluX2RlbHRhX25zID4gTUlOX0RFTFRB
X0xJTUlUKQogCQlkZXYtPm1pbl9kZWx0YV9ucyA9IE1JTl9ERUxUQV9MSU1JVDsKIAotCXByaW50
ayhLRVJOX1dBUk5JTkcgIkNFOiAlcyBpbmNyZWFzZWQgbWluX2RlbHRhX25zIHRvICVsbHUgbnNl
Y1xuIiwKLQkgICAgICAgZGV2LT5uYW1lID8gZGV2LT5uYW1lIDogIj8iLAotCSAgICAgICAodW5z
aWduZWQgbG9uZyBsb25nKSBkZXYtPm1pbl9kZWx0YV9ucyk7CisJcHJpbnRrX2RlZmVycmVkKEtF
Uk5fV0FSTklORworCQkJIkNFOiAlcyBpbmNyZWFzZWQgbWluX2RlbHRhX25zIHRvICVsbHUgbnNl
Y1xuIiwKKwkJCWRldi0+bmFtZSA/IGRldi0+bmFtZSA6ICI/IiwKKwkJCSh1bnNpZ25lZCBsb25n
IGxvbmcpIGRldi0+bWluX2RlbHRhX25zKTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMS44LjEuNAoK

--===============5628672339098188655==--

