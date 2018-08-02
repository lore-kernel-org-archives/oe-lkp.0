Content-Type: multipart/mixed; boundary="===============5759053142140197937=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: c3bc8fd637 [ 27.885548] WARNING: CPU: 0 PID: 7 at kernel/rcu/tree.c:999 rcu_irq_enter
Date: Wed, 01 Aug 2018 23:03:20 -0400
Message-ID: <20180801230320.6936dfe8@vmware.local.home>
In-Reply-To: <20180802024451.GB26770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5759053142140197937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Aug 2018 10:44:51 +0800
kernel test robot <rong.a.chen@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git f=
trace/core
> =

> commit c3bc8fd637a9623f5c507bd18f9677effbddf584
> Author:     Joel Fernandes (Google) <joel@joelfernandes.org>

Joel,

I take it that you can handle this ;-)

-- Steve

> AuthorDate: Mon Jul 30 15:24:23 2018 -0700
> Commit:     Steven Rostedt (VMware) <rostedt@goodmis.org>
> CommitDate: Tue Jul 31 11:32:27 2018 -0400
> =

>     tracing: Centralize preemptirq tracepoints and unify their usage
>     =

>     This patch detaches the preemptirq tracepoints from the tracers and
>     keeps it separate.
>     =

>     Advantages:
>     * Lockdep and irqsoff event can now run in parallel since they no lon=
ger
>     have their own calls.
>     =

>     * This unifies the usecase of adding hooks to an irqsoff and irqson
>     event, and a preemptoff and preempton event.
>       3 users of the events exist:
>       - Lockdep
>       - irqsoff and preemptoff tracers
>       - irqs and preempt trace events
>     =

>     The unification cleans up several ifdefs and makes the code in preempt
>     tracer and irqsoff tracers simpler. It gets rid of all the horrific
>     ifdeferry around PROVE_LOCKING and makes configuration of the differe=
nt
>     users of the tracepoints more easy and understandable. It also gets r=
id
>     of the time_* function calls from the lockdep hooks used to call into
>     the preemptirq tracer which is not needed anymore. The negative delta=
 in
>     lines of code in this patch is quite large too.
>     =

>     In the patch we introduce a new CONFIG option PREEMPTIRQ_TRACEPOINTS
>     as a single point for registering probes onto the tracepoints. With
>     this,
>     the web of config options for preempt/irq toggle tracepoints and its
>     users becomes:
>     =

>      PREEMPT_TRACER   PREEMPTIRQ_EVENTS  IRQSOFF_TRACER PROVE_LOCKING
>            |                 |     \         |           |
>            \    (selects)    /      \        \ (selects) /
>           TRACE_PREEMPT_TOGGLE       ----> TRACE_IRQFLAGS
>                           \                  /
>                            \ (depends on)   /
>                          PREEMPTIRQ_TRACEPOINTS
>     =

>     Other than the performance tests mentioned in the previous patch, I a=
lso
>     ran the locking API test suite. I verified that all tests cases are
>     passing.
>     =

>     I also injected issues by not registering lockdep probes onto the
>     tracepoints and I see failures to confirm that the probes are indeed
>     working.
>     =

>     This series + lockdep probes not registered (just to inject errors):
>     [    0.000000]      hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
>     [    0.000000]      soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
>     [    0.000000]        sirq-safe-A =3D> hirqs-on/12:FAILED|FAILED|  ok=
  |
>     [    0.000000]        sirq-safe-A =3D> hirqs-on/21:FAILED|FAILED|  ok=
  |
>     [    0.000000]          hard-safe-A + irqs-on/12:FAILED|FAILED|  ok  |
>     [    0.000000]          soft-safe-A + irqs-on/12:FAILED|FAILED|  ok  |
>     [    0.000000]          hard-safe-A + irqs-on/21:FAILED|FAILED|  ok  |
>     [    0.000000]          soft-safe-A + irqs-on/21:FAILED|FAILED|  ok  |
>     [    0.000000]     hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
>     [    0.000000]     soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
>     =

>     With this series + lockdep probes registered, all locking tests pass:
>     =

>     [    0.000000]      hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
>     [    0.000000]      soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
>     [    0.000000]        sirq-safe-A =3D> hirqs-on/12:  ok  |  ok  |  ok=
  |
>     [    0.000000]        sirq-safe-A =3D> hirqs-on/21:  ok  |  ok  |  ok=
  |
>     [    0.000000]          hard-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
>     [    0.000000]          soft-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
>     [    0.000000]          hard-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
>     [    0.000000]          soft-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
>     [    0.000000]     hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
>     [    0.000000]     soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
>     =

>     Link: http://lkml.kernel.org/r/20180730222423.196630-4-joel(a)joelfer=
nandes.org
>     =

>     Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>     Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>     Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> =

> e6753f23d9  tracepoint: Make rcuidle tracepoint callers use SRCU
> c3bc8fd637  tracing: Centralize preemptirq tracepoints and unify their us=
age
> 5248ee8560  tracefs: Annotate tracefs_ops with __ro_after_init
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> |                                                                  | e675=
3f23d9 | c3bc8fd637 | 5248ee8560 |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> | boot_successes                                                   | 800 =
       | 245        | 259        |
> | boot_failures                                                    | 145 =
       | 60         | 49         |
> | INFO:task_blocked_for_more_than#seconds                          | 132 =
       | 34         | 33         |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks                 | 132 =
       | 34         | 33         |
> | WARNING:at_kernel/locking/lockdep.c:#__lock_acquire              | 10  =
       |            |            |
> | RIP:__lock_acquire                                               | 10  =
       | 1          | 2          |
> | Initiating_system_reboot                                         | 1   =
       |            |            |
> | Mem-Info                                                         | 2   =
       | 1          | 3          |
> | WARNING:suspicious_RCU_usage                                     | 1   =
       |            |            |
> | kernel/rcu/rcutorture.c:#suspicious_rcu_dereference_check()usage | 1   =
       |            |            |
> | WARNING:at_kernel/rcu/tree.c:#rcu_irq_enter                      | 0   =
       | 13         | 5          |
> | RIP:rcu_irq_enter                                                | 0   =
       | 13         | 5          |
> | RIP:lock_acquire                                                 | 0   =
       | 13         | 5          |
> | WARNING:at_kernel/locking/lockdep.c:#check_flags                 | 0   =
       | 24         | 11         |
> | RIP:check_flags                                                  | 0   =
       | 24         | 11         |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 0 =
         | 1          | 3          |
> | Out_of_memory:Kill_process                                       | 0   =
       | 1          | 1          |
> | BUG:unable_to_handle_kernel                                      | 0   =
       | 1          | 2          |
> | Oops:#[##]                                                       | 0   =
       | 1          | 2          |
> | Kernel_panic-not_syncing:Fatal_exception                         | 0   =
       | 1          | 2          |
> | WARNING:at_arch/x86/entry/common.c:#do_syscall_64                | 0   =
       | 0          | 1          |
> | RIP:do_syscall_64                                                | 0   =
       | 0          | 1          |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> =

> [   27.455115] VFS: Warning: trinity-c0 using old stat() call. Recompile =
your binary.
> [   27.525036] VFS: Warning: trinity-c1 using old stat() call. Recompile =
your binary.
> [child0:1188] acct (51:[32BIT]) returned ENOSYS, marking as inactive.
> [   27.881419] ------------[ cut here ]------------
> [   27.883572] IRQs not disabled as expected
> [   27.885548] WARNING: CPU: 0 PID: 7 at kernel/rcu/tree.c:999 rcu_irq_en=
ter+0x78/0x80
> [   27.889630] Modules linked in:
> [   27.891356] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G        W      =
 T 4.18.0-rc6-00023-gc3bc8fd #2
> [   27.894721] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   27.897267] Workqueue: netns cleanup_net
> [   27.898657] RIP: 0010:rcu_irq_enter+0x78/0x80
> [   27.900202] Code: 2e fe ff ff 8b 80 c8 1c 00 00 85 c0 74 d6 80 3d 46 5=
6 98 02 00 75 cd 48 c7 c7 e8 0e 7a b6 c6 05 36 56 98 02 01 e8 28 e9 f7 ff <=
0f> 0b eb b6 0f 1f 40 00 cc 3b e0 df 0a 53 48 83 3d 52 d7 52 01 00 =

> [   27.905927] RSP: 0018:ffff93b75a003fc0 EFLAGS: 00010082
> [   27.907495] RAX: 000000000000001d RBX: ffff93b75a1e00e0 RCX: ffff93b75=
a003e74
> [   27.909347] RDX: 0000000000000002 RSI: 0000000000000001 RDI: 000000000=
0000086
> [   27.911287] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000001
> [   27.913213] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [   27.915066] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   27.916998] FS:  0000000000000000(0000) GS:ffff93b75a000000(0000) knlG=
S:0000000000000000
> [   27.920010] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   27.922297] CR2: 0000000000000008 CR3: 000000001c222001 CR4: 000000000=
01606f0
> [   27.925013] Call Trace:
> [   27.926548]  <IRQ>
> [   27.927942]  irq_enter+0xb/0x70
> [   27.929633]  smp_apic_timer_interrupt+0x1c/0x230
> [   27.931752]  apic_timer_interrupt+0xf/0x20
> [   27.933693]  </IRQ>
> [   27.935081] RIP: 0010:lock_acquire+0xfb/0x200
> [   27.937062] Code: 48 8b 04 25 c0 5e 01 00 48 83 c4 20 48 83 3d 43 63 5=
5 01 00 c7 80 88 15 00 00 00 00 00 00 0f 84 db 00 00 00 48 8b 3c 24 57 9d <=
0f> 1f 44 00 00 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 65 8b =

> [   27.957001] RSP: 0018:ffff93b759ecbc28 EFLAGS: 00000286 ORIG_RAX: ffff=
ffffffffff13
> [   27.960368] RAX: ffff93b759ec1000 RBX: ffff93b751b6d410 RCX: 000000000=
0000001
> [   27.962417] RDX: ffff93b759ec2f38 RSI: 0000000029b9be5e RDI: 000000000=
0000286
> [   27.964873] RBP: 0000000000000000 R08: 00000000a213c504 R09: ffffffffb=
80cb198
> [   27.967463] R10: ffff93b759ecbc08 R11: 0000000000000000 R12: 000000000=
0000000
> [   27.970040] R13: 0000000000000000 R14: 0000000000000001 R15: 000000000=
0000000
> [   27.972812]  __kernfs_remove+0x264/0x2e0
> [   27.974666]  ? kernfs_remove_by_name_ns+0x40/0x80
> [   27.976781]  kernfs_remove_by_name_ns+0x40/0x80
> [   27.978812]  sysfs_unmerge_group+0x3d/0x60
> [   27.980712]  dpm_sysfs_remove+0x34/0x60
> [   27.982557]  device_del+0x46/0x340
> [   27.984315]  rollback_registered_many+0x21c/0x3d0
> [   27.986416]  unregister_netdevice_many+0xe/0x90
> [   27.988599]  ip6_tnl_exit_batch_net+0x1d3/0x2b0
> [   27.990660]  cleanup_net+0x1d0/0x2d0
> [   27.992469]  process_one_work+0x2b4/0x630
> [   27.994503]  worker_thread+0x39/0x3f0
> [   27.996195]  ? process_one_work+0x630/0x630
> [   27.997723]  kthread+0x11f/0x140
> [   27.999129]  ? kthread_flush_work_fn+0x10/0x10
> [   28.000652]  ret_from_fork+0x24/0x30
> [   28.002027] irq event stamp: 70837
> [   28.003297] hardirqs last  enabled at (70837): [<ffffffffb6000a3d>] re=
store_regs_and_return_to_kernel+0x0/0x23
> [   28.006845] hardirqs last disabled at (70836): [<ffffffffb6001169>] er=
ror_entry+0x89/0x110
> [   28.010661] softirqs last  enabled at (69958): [<ffffffffb620033c>] __=
do_softirq+0x33c/0x4b0
> [   28.015345] softirqs last disabled at (69885): [<ffffffffb549da03>] ir=
q_exit+0x103/0x110
> [   28.019132] ---[ end trace 81ff0f71cbfb01bc ]---
> [   28.021265] ------------[ cut here ]------------
> [   28.021265] ------------[ cut here ]------------
> [   28.021269] DEBUG_LOCKS_WARN_ON(current->hardirqs_enabled)
> [   28.021274] WARNING: CPU: 0 PID: 7 at kernel/locking/lockdep.c:3820 ch=
eck_flags+0x195/0x1a0
> [   28.021278] Modules linked in:
> [   28.021286] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G               =
 T 4.18.0-rc6-00023-gc3bc8fd #2
> [   28.021289] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   28.021293] Workqueue: netns cleanup_net
> [   28.021300] RIP: 0010:check_flags+0x195/0x1a0
> [   28.021304] Code: f1 a9 7b b6 48 c7 c7 af 3b 7a b6 e8 95 b2 fa ff 0f 0=
b e9 f7 fe ff ff 48 c7 c6 f2 a9 7b b6 48 c7 c7 af 3b 7a b6 e8 7b b2 fa ff <=
0f> 0b e9 61 ff ff ff 0f 1f 40 00 41 54 55 53 65 48 8b 04 25 c0 5e =

> [   28.021505] RSP: 0018:ffff93b75a003e28 EFLAGS: 00010096
> [   28.021513] RAX: 000000000000002e RBX: ffffffffb6a57758 RCX: 000000000=
0000002
> [   28.021517] RDX: 0000000000000003 RSI: ffffffffb67a3bc6 RDI: ffff93b75=
a1d8868
> [   28.021520] RBP: 0000000000000000 R08: ffffffffb67ba9f1 R09: ffff93b75=
a1d88bb
> [   28.021524] R10: 0000000000000000 R11: 0000000000000001 R12: 000000000=
0000000
> [   28.021528] R13: 0000000000000000 R14: 0000000000000001 R15: 000000000=
0000000
> [   28.021531] FS:  0000000000000000(0000) GS:ffff93b75a000000(0000) knlG=
S:0000000000000000
> [   28.021535] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   28.021539] CR2: 0000000000000008 CR3: 000000001c222001 CR4: 000000000=
01606f0
> [   28.021542] Call Trace:
> [   28.021546]  <IRQ>
> [   28.021549]  lock_acquire+0x190/0x200
> [   28.021553]  _raw_spin_lock+0x30/0x70
> [   28.021556]  ? vprintk_emit+0x88/0x520
> [   28.021560]  vprintk_emit+0x88/0x520
> [   28.021563]  printk+0x43/0x4b
> [   28.021567]  ? apic_timer_interrupt+0xa/0x20
> [   28.021570]  __warn_printk+0x3c/0x70
> [   28.021574]  ? apic_timer_interrupt+0xa/0x20
> [   28.021577]  rcu_irq_enter+0x78/0x80
> [   28.021581]  irq_enter+0xb/0x70
> [   28.021584]  smp_apic_timer_interrupt+0x1c/0x230
> [   28.021588]  apic_timer_interrupt+0xf/0x20
> [   28.021592]  </IRQ>
> [   28.021595] RIP: 0010:lock_acquire+0xfb/0x200
> [   28.021598] Code: 48 8b 04 25 c0 5e 01 00 48 83 c4 20 48 83 3d 43 63 5=
5 01 00 c7 80 88 15 00 00 00 00 00 00 0f 84 db 00 00 00 48 8b 3c 24 57 9d <=
0f> 1f 44 00 00 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 65 8b =

> [   28.021806] RSP: 0018:ffff93b759ecbc28 EFLAGS: 00000286 ORIG_RAX: ffff=
ffffffffff13
> [   28.021813] RAX: ffff93b759ec1000 RBX: ffff93b751b6d410 RCX: 000000000=
0000001
> [   28.021817] RDX: ffff93b759ec2f38 RSI: 0000000029b9be5e RDI: 000000000=
0000286
> [   28.021821] RBP: 0000000000000000 R08: 00000000a213c504 R09: ffffffffb=
80cb198
> [   28.021824] R10: ffff93b759ecbc08 R11: 0000000000000000 R12: 000000000=
0000000
> [   28.021828] R13: 0000000000000000 R14: 0000000000000001 R15: 000000000=
0000000
> [   28.021832]  __kernfs_remove+0x264/0x2e0
> [   28.021835]  ? kernfs_remove_by_name_ns+0x40/0x80
> [   28.021839]  kernfs_remove_by_name_ns+0x40/0x80
> [   28.021842]  sysfs_unmerge_group+0x3d/0x60
> [   28.021846]  dpm_sysfs_remove+0x34/0x60
> [   28.021849]  device_del+0x46/0x340
> [   28.021853]  rollback_registered_many+0x21c/0x3d0
> [   28.021857]  unregister_netdevice_many+0xe/0x90
> [   28.021860]  ip6_tnl_exit_batch_net+0x1d3/0x2b0
> [   28.021864]  cleanup_net+0x1d0/0x2d0
> [   28.021868]  process_one_work+0x2b4/0x630
> [   28.021871]  worker_thread+0x39/0x3f0
> [   28.021875]  ? process_one_work+0x630/0x630
> [   28.021878]  kthread+0x11f/0x140
> [   28.021882]  ? kthread_flush_work_fn+0x10/0x10
> [   28.021885]  ret_from_fork+0x24/0x30
> [   28.021889] irq event stamp: 70837
> [   28.021893] hardirqs last  enabled at (70837): [<ffffffffb6000a3d>] re=
store_regs_and_return_to_kernel+0x0/0x23
> [   28.021896] hardirqs last disabled at (70836): [<ffffffffb6001169>] er=
ror_entry+0x89/0x110
> [   28.021900] softirqs last  enabled at (69958): [<ffffffffb620033c>] __=
do_softirq+0x33c/0x4b0
> [   28.021904] softirqs last disabled at (69885): [<ffffffffb549da03>] ir=
q_exit+0x103/0x110
> [   28.021908] ---[ end trace 81ff0f71cbfb01bb ]---
> [   28.021911] possible reason: unannotated irqs-off.
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 12298d7dde32fe2b38f7e30d9eb1cdba2fcb0e19 acb1872577b346b=
d15ab3a3f8dff780d6cca4b70 --
> git bisect good 25cd2574cdb80dbcdec7526f22b0ddc3abbbe4c5  # 00:32  G    1=
33     0   14  14  Merge 'dhowells-fs/mount-api' into devel-catchup-2018080=
12100
> git bisect  bad a4886d51f508d080c7570396b838be793234f1d1  # 00:55  B     =
36     1    2   2  Merge 'staging/staging-next' into devel-catchup-20180801=
2100
> git bisect good 94298dd972555ba51b122d6e3cd2c11605956d7c  # 01:34  G    3=
00     0   48  48  Merge 'usb/usb-next' into devel-catchup-201808012100
> git bisect  bad 1619e8699ea8e1e2a8c629d0a9cdc31df041f9ef  # 01:55  B     =
10     1    1   1  Merge 'tj-libata/for-next' into devel-catchup-2018080121=
00
> git bisect good 83ac025d915013b5bce254abe7828798ff8ecd00  # 02:38  G    3=
04     0   41  41  Merge 'ulf.hansson-mmc/next' into devel-catchup-20180801=
2100
> git bisect  bad d9c630e3efce9d1a50fbeba5e3db5a3b77133700  # 03:01  B     =
19     1    2   2  Merge 'trace/ftrace/core' into devel-catchup-201808012100
> git bisect good 87107a25a2f857693156f075da6e2a1438f4b4a0  # 03:45  G    3=
01     0   43  43  tracing/kprobes: Simplify the logic of enable_trace_kpro=
be()
> git bisect good 6fc7c4110cbaff85b1f49fd70b77950384c3a201  # 04:32  G    3=
01     0   37  37  selftests/ftrace: Fix kprobe string testcase to not prob=
e notrace function
> git bisect good e6753f23d961d601dbae50a2fc2a3975c9715b14  # 05:25  G    3=
00     0   35  35  tracepoint: Make rcuidle tracepoint callers use SRCU
> git bisect  bad 5248ee85603067e62a228402afd2fb68f957746b  # 05:50  B     =
83     2    7   7  tracefs: Annotate tracefs_ops with __ro_after_init
> git bisect  bad c3bc8fd637a9623f5c507bd18f9677effbddf584  # 06:26  B     =
23     1    1   1  tracing: Centralize preemptirq tracepoints and unify the=
ir usage
> # first bad commit: [c3bc8fd637a9623f5c507bd18f9677effbddf584] tracing: C=
entralize preemptirq tracepoints and unify their usage
> git bisect good e6753f23d961d601dbae50a2fc2a3975c9715b14  # 07:37  G    9=
01     0  105 150  tracepoint: Make rcuidle tracepoint callers use SRCU
> # extra tests with debug options
> git bisect  bad c3bc8fd637a9623f5c507bd18f9677effbddf584  # 08:01  B     =
 1     1    0   0  tracing: Centralize preemptirq tracepoints and unify the=
ir usage
> # extra tests on HEAD of linux-devel/devel-catchup-201808012100
> git bisect  bad 12298d7dde32fe2b38f7e30d9eb1cdba2fcb0e19  # 08:02  B    2=
91    14    0  60  0day head guard for 'devel-catchup-201808012100'
> # extra tests on tree/branch trace/ftrace/core
> git bisect  bad 5248ee85603067e62a228402afd2fb68f957746b  # 08:04  B    2=
55     5    0  50  tracefs: Annotate tracefs_ops with __ro_after_init
> # extra tests with first bad commit reverted
> git bisect good df4371bd9f7fa8c109296f52c43d4a9bcabd50b8  # 08:52  G    3=
03     0   35  35  Revert "tracing: Centralize preemptirq tracepoints and u=
nify their usage"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion


--===============5759053142140197937==--

