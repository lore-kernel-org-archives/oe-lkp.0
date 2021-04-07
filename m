Content-Type: multipart/mixed; boundary="===============6292413594798189352=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [rcu] 7308e02404: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Wed, 07 Apr 2021 14:32:13 -0700
Message-ID: <20210407213213.GH4510@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210407072934.GD22260@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6292413594798189352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 03:29:34PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 7308e0240410d3644c9d7cc6263079a58e3effeb ("rcu: Make rcu_read_unl=
ock_special() expedite strict grace periods")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: trinity
> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> with following parameters:
> =

> 	group: group-04
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------------------------+---------=
---+------------+
> |                                                              | 5e59fba5=
73 | 7308e02404 |
> +--------------------------------------------------------------+---------=
---+------------+
> | boot_successes                                               | 134     =
   | 51         |
> | boot_failures                                                | 0       =
   | 13         |
> | INFO:rcu_preempt_self-detected_stall_on_CPU                  | 0       =
   | 3          |
> | EIP:lock_is_held_type                                        | 0       =
   | 1          |
> | EIP:_raw_write_unlock_irq                                    | 0       =
   | 1          |
> | EIP:_raw_spin_unlock_irq                                     | 0       =
   | 6          |
> | EIP:perf_lock_task_context                                   | 0       =
   | 2          |
> | BUG:kernel_hang_in_test_stage                                | 0       =
   | 6          |
> | WARNING:at_kernel/rcu/tree_stall.h:#rcu_check_gp_start_stall | 0       =
   | 2          |
> | EIP:rcu_check_gp_start_stall                                 | 0       =
   | 2          |
> | INFO:rcu_preempt_detected_stalls_on_CPUs/tasks               | 0       =
   | 4          |
> | EIP:queued_spin_lock_slowpath                                | 0       =
   | 3          |
> | EIP:_raw_spin_unlock_irqrestore                              | 0       =
   | 3          |
> | WARNING:inconsistent_lock_state                              | 0       =
   | 4          |
> | inconsistent{IN-HARDIRQ-W}->{HARDIRQ-ON-W}usage              | 0       =
   | 4          |
> | EIP:preempt_schedule_common                                  | 0       =
   | 2          |
> | BUG:scheduling_while_atomic                                  | 0       =
   | 4          |
> | EIP:schedule                                                 | 0       =
   | 1          |
> | EIP:hlock_class                                              | 0       =
   | 1          |
> | EIP:__xapic_wait_icr_idle                                    | 0       =
   | 1          |
> | EIP:rcu_preempt_deferred_qs_irqrestore                       | 0       =
   | 1          |
> +--------------------------------------------------------------+---------=
---+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  380.783397] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  380.783736] 	(detected by 1, t=3D10502 jiffies, g=3D185097, q=3D3169)
> [  380.784177] rcu: All QSes seen, last rcu_preempt kthread activity 4119=
 (8021-3902), jiffies_till_next_fqs=3D1, root ->qsmask 0x0
> [  380.784706] rcu: rcu_preempt kthread starved for 4119 jiffies! g185097=
 f0x2 RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D0
> [  380.785185] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time,=
 OOM is now expected behavior.

My guess first guess was that you ran CONFIG_RCU_STRICT_GRACE_PERIOD=3Dy on
a system with more than a handful of CPUs, but a look at the dmesg says
this was a two-CPU system.

But I should enforce this constraint somehow, shouldn't I?

OK.  Later on, there is a lockdep complaint.  But it is complaining that
a lock acquired while irqs are disabled might result in self-deadlock
due to a later irq handler also taking that lock, which should be
prevented by the local_irq_save().  One of the RCU CPU stall warning
stack traces does show CPU 0 spinning on the rcu_node structure's
->lock, but the prior rcu_preempt_deferred_qs() would have disabled
interrupts, again via local_irq_save().  Something is clearly broken,
but the diagnostics don't seem to match the code.

So what am I missing here?

							Thanx, Paul

> [  380.785607] rcu: RCU grace-period kthread stack dump:
> [  380.785845] task:rcu_preempt     state:R  running task     stack:    0=
 pid:   14 ppid:     2 flags:0x00004008
> [  380.786307] Call Trace:
> [  380.786428] __schedule (kbuild/src/consumer/kernel/sched/core.c:4327 k=
build/src/consumer/kernel/sched/core.c:5075) =

> [  380.786598] schedule (kbuild/src/consumer/arch/x86/include/asm/preempt=
.h:85 (discriminator 1) kbuild/src/consumer/kernel/sched/core.c:5155 (discr=
iminator 1)) =

> [  380.786751] schedule_timeout (kbuild/src/consumer/kernel/time/timer.c:=
1893) =

> [  380.786948] ? __next_timer_interrupt (kbuild/src/consumer/kernel/time/=
timer.c:1816) =

> [  380.787156] rcu_gp_kthread (kbuild/src/consumer/kernel/rcu/tree.c:2005=
 kbuild/src/consumer/kernel/rcu/tree.c:2178) =

> [  380.787333] ? strict_work_handler (kbuild/src/consumer/kernel/rcu/tree=
.c:2153) =

> [  380.787532] kthread (kbuild/src/consumer/kernel/kthread.c:294) =

> [  380.787681] ? strict_work_handler (kbuild/src/consumer/kernel/rcu/tree=
.c:2153) =

> [  380.787879] ? test_bit (kbuild/src/consumer/arch/x86/include/asm/msr.h=
:124) =

> [  380.788074] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_32=
.S:856) =

> [  380.788241] rcu: Stack dump where RCU GP kthread last ran:
> [  380.788492] Sending NMI from CPU 1 to CPUs 0:
> [  380.789729] NMI backtrace for cpu 0
> [  380.789730] CPU: 0 PID: 2497 Comm: getty Not tainted 5.12.0-rc2-00004-=
g7308e0240410 #1
> [  380.789731] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  380.789731] EIP: queued_spin_lock_slowpath (kbuild/src/consumer/arch/x=
86/include/asm/vdso/processor.h:19 kbuild/src/consumer/arch/x86/include/asm=
/qspinlock.h:100 kbuild/src/consumer/kernel/locking/qspinlock.c:326) =

> [ 380.789732] Code: bb 01 00 00 00 7f 1b 81 fa 00 01 00 00 75 2c b8 01 02=
 00 00 eb 1b f0 0f b1 19 85 c0 0f 84 6c 01 00 00 8b 01 85 c0 74 ee f3 90 <e=
b> f6 48 74 0c f3 90 8b 11 81 fa 00 01 00 00 74 f1 81 e2 00 ff ff
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	bb 01 00 00 00       	mov    $0x1,%ebx
>    5:	7f 1b                	jg     0x22
>    7:	81 fa 00 01 00 00    	cmp    $0x100,%edx
>    d:	75 2c                	jne    0x3b
>    f:	b8 01 02 00 00       	mov    $0x201,%eax
>   14:	eb 1b                	jmp    0x31
>   16:	f0 0f b1 19          	lock cmpxchg %ebx,(%rcx)
>   1a:	85 c0                	test   %eax,%eax
>   1c:	0f 84 6c 01 00 00    	je     0x18e
>   22:	8b 01                	mov    (%rcx),%eax
>   24:	85 c0                	test   %eax,%eax
>   26:	74 ee                	je     0x16
>   28:	f3 90                	pause  =

>   2a:*	eb f6                	jmp    0x22		<-- trapping instruction
>   2c:	48 74 0c             	rex.W je 0x3b
>   2f:	f3 90                	pause  =

>   31:	8b 11                	mov    (%rcx),%edx
>   33:	81 fa 00 01 00 00    	cmp    $0x100,%edx
>   39:	74 f1                	je     0x2c
>   3b:	81                   	.byte 0x81
>   3c:	e2 00                	loop   0x3e
>   3e:	ff                   	(bad)  =

>   3f:	ff                   	.byte 0xff
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	eb f6                	jmp    0xfffffffffffffff8
>    2:	48 74 0c             	rex.W je 0x11
>    5:	f3 90                	pause  =

>    7:	8b 11                	mov    (%rcx),%edx
>    9:	81 fa 00 01 00 00    	cmp    $0x100,%edx
>    f:	74 f1                	je     0x2
>   11:	81                   	.byte 0x81
>   12:	e2 00                	loop   0x14
>   14:	ff                   	(bad)  =

>   15:	ff                   	.byte 0xff
> [  380.789732] EAX: 00000001 EBX: 00000001 ECX: b7a5a300 EDX: 00000001
> [  380.789733] ESI: 00000046 EDI: dae55300 EBP: dddafda0 ESP: dddafd94
> [  380.789733] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00000=
002
> [  380.789734] CR0: 80050033 CR2: 0177a77c CR3: 2de0e000 CR4: 00040690
> [  380.789734] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [  380.789735] DR6: fffe0ff0 DR7: 00000400
> [  380.789735] Call Trace:
> [  380.789735] do_raw_spin_lock (kbuild/src/consumer/include/asm-generic/=
qspinlock.h:85 kbuild/src/consumer/kernel/locking/spinlock_debug.c:113) =

> [  380.789735] _raw_spin_lock_irqsave (kbuild/src/consumer/kernel/locking=
/spinlock.c:160) =

> [  380.789736] ? rcu_report_qs_rdp (kbuild/src/consumer/kernel/rcu/tree.c=
:2336 (discriminator 13)) =

> [  380.789736] rcu_report_qs_rdp (kbuild/src/consumer/kernel/rcu/tree.c:2=
336 (discriminator 13)) =

> [  380.789736] rcu_preempt_deferred_qs_irqrestore (kbuild/src/consumer/ke=
rnel/rcu/tree_plugin.h:465) =

> [  380.789737] rcu_preempt_deferred_qs (kbuild/src/consumer/kernel/rcu/tr=
ee_plugin.h:580) =

> [  380.789737] rcu_note_context_switch (kbuild/src/consumer/kernel/rcu/tr=
ee_plugin.h:333) =

> [  380.789738] __schedule (kbuild/src/consumer/kernel/sched/core.c:4992 (=
discriminator 3)) =

> [  380.789738] ? exc_nmi (kbuild/src/consumer/arch/x86/kernel/irq_work.c:=
17) =

> [  380.789738] preempt_schedule_irq (kbuild/src/consumer/arch/x86/include=
/asm/irqflags.h:29 kbuild/src/consumer/arch/x86/include/asm/irqflags.h:70 k=
build/src/consumer/arch/x86/include/asm/irqflags.h:137 kbuild/src/consumer/=
kernel/sched/core.c:5533) =

> [  380.789739] irqentry_exit_cond_resched (kbuild/src/consumer/kernel/ent=
ry/common.c:394) =

> [  380.789739] irqentry_exit (kbuild/src/consumer/kernel/entry/common.c:4=
32) =

> [  380.789739] sysvec_irq_work (kbuild/src/consumer/arch/x86/kernel/irq_w=
ork.c:17) =

> [  380.789740] handle_exception (kbuild/src/consumer/arch/x86/entry/entry=
_32.S:1179) =

> [  380.789740] EIP: _raw_spin_unlock_irqrestore (kbuild/src/consumer/incl=
ude/linux/spinlock_api_smp.h:161 kbuild/src/consumer/kernel/locking/spinloc=
k.c:191) =

> [ 380.789741] Code: 8f 68 6c ff 81 e3 00 02 00 00 74 05 e8 e4 99 71 ff 9c=
 58 0f ba e0 09 73 05 e8 4a 9d ff ff 85 db 74 01 fb 64 ff 0d 0c 08 ca b7 <7=
5> 05 e8 df 1c 00 00 5b 5e 5d c3 55 89 e5 53 64 ff 05 0c 08 ca b7
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	8f 68 6c ff          	(bad)  =

>    4:	81 e3 00 02 00 00    	and    $0x200,%ebx
>    a:	74 05                	je     0x11
>    c:	e8 e4 99 71 ff       	callq  0xffffffffff7199f5
>   11:	9c                   	pushfq =

>   12:	58                   	pop    %rax
>   13:	0f ba e0 09          	bt     $0x9,%eax
>   17:	73 05                	jae    0x1e
>   19:	e8 4a 9d ff ff       	callq  0xffffffffffff9d68
>   1e:	85 db                	test   %ebx,%ebx
>   20:	74 01                	je     0x23
>   22:	fb                   	sti    =

>   23:	64 ff 0d 0c 08 ca b7 	decl   %fs:-0x4835f7f4(%rip)        # 0xfffff=
fffb7ca0836
>   2a:*	75 05                	jne    0x31		<-- trapping instruction
>   2c:	e8 df 1c 00 00       	callq  0x1d10
>   31:	5b                   	pop    %rbx
>   32:	5e                   	pop    %rsi
>   33:	5d                   	pop    %rbp
>   34:	c3                   	retq   =

>   35:	55                   	push   %rbp
>   36:	89 e5                	mov    %esp,%ebp
>   38:	53                   	push   %rbx
>   39:	64 ff 05 0c 08 ca b7 	incl   %fs:-0x4835f7f4(%rip)        # 0xfffff=
fffb7ca084c
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	75 05                	jne    0x7
>    2:	e8 df 1c 00 00       	callq  0x1ce6
>    7:	5b                   	pop    %rbx
>    8:	5e                   	pop    %rsi
>    9:	5d                   	pop    %rbp
>    a:	c3                   	retq   =

>    b:	55                   	push   %rbp
>    c:	89 e5                	mov    %esp,%ebp
>    e:	53                   	push   %rbx
>    f:	64 ff 05 0c 08 ca b7 	incl   %fs:-0x4835f7f4(%rip)        # 0xfffff=
fffb7ca0822
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.12.0-rc2-00004-g7308e0240410 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 5.12.0-rc2 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_UAPI_HEADER_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> CONFIG_KERNEL_LZMA=3Dy
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_WATCH_QUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> =

> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_PREEMPTION=3Dy
> CONFIG_PREEMPT_DYNAMIC=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_FANOUT=3D32
> CONFIG_RCU_FANOUT_LEAF=3D2
> # CONFIG_RCU_FAST_NO_HZ is not set
> # CONFIG_RCU_BOOST is not set
> # CONFIG_RCU_NOCB_CPU is not set
> # CONFIG_TASKS_TRACE_RCU_READ_MB is not set
> # end of RCU Subsystem
> =

> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_IKHEADERS=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # end of Scheduler features
> =

> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> # CONFIG_MEMCG is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> # CONFIG_RT_GROUP_SCHED is not set
> CONFIG_CGROUP_PIDS=3Dy
> CONFIG_CGROUP_RDMA=3Dy
> # CONFIG_CGROUP_FREEZER is not set
> CONFIG_CGROUP_HUGETLB=3Dy
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> CONFIG_CGROUP_DEVICE=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_DEBUG=3Dy
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> CONFIG_BOOT_CONFIG=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> # CONFIG_POSIX_TIMERS is not set
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> # CONFIG_IO_URING is not set
> # CONFIG_ADVISE_SYSCALLS is not set
> # CONFIG_MEMBARRIER is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> # CONFIG_RSEQ is not set
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PERF_USE_VMALLOC=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_X86_32_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D2
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_MPPARSE is not set
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> # CONFIG_X86_CPU_RESCTRL is not set
> # CONFIG_X86_BIGSMP is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_X86_32_IRIS is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_M486SX is not set
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> CONFIG_M586TSC=3Dy
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> # CONFIG_MPENTIUMII is not set
> # CONFIG_MPENTIUMIII is not set
> # CONFIG_MPENTIUMM is not set
> # CONFIG_MPENTIUM4 is not set
> # CONFIG_MK6 is not set
> # CONFIG_MK7 is not set
> # CONFIG_MK8 is not set
> # CONFIG_MCRUSOE is not set
> # CONFIG_MEFFICEON is not set
> # CONFIG_MWINCHIPC6 is not set
> # CONFIG_MWINCHIP3D is not set
> # CONFIG_MELAN is not set
> # CONFIG_MGEODEGX1 is not set
> # CONFIG_MGEODE_LX is not set
> # CONFIG_MCYRIXIII is not set
> # CONFIG_MVIAC3_2 is not set
> # CONFIG_MVIAC7 is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> # CONFIG_X86_GENERIC is not set
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D5
> CONFIG_X86_L1_CACHE_SHIFT=3D5
> CONFIG_X86_F00F_BUG=3Dy
> CONFIG_X86_ALIGNMENT_16=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> # CONFIG_CPU_SUP_CYRIX_32 is not set
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_HYGON is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> # CONFIG_CPU_SUP_UMC_32 is not set
> # CONFIG_CPU_SUP_ZHAOXIN is not set
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D2
> CONFIG_NR_CPUS_RANGE_END=3D8
> CONFIG_NR_CPUS_DEFAULT=3D8
> CONFIG_NR_CPUS=3D8
> CONFIG_SCHED_SMT=3Dy
> # CONFIG_SCHED_MC is not set
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> # end of Performance monitoring
> =

> # CONFIG_X86_LEGACY_VM86 is not set
> # CONFIG_X86_16BIT is not set
> # CONFIG_X86_IOPL_IOPERM is not set
> CONFIG_TOSHIBA=3Dy
> CONFIG_I8K=3Dy
> # CONFIG_X86_REBOOTFIXUPS is not set
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> # CONFIG_MICROCODE_AMD is not set
> # CONFIG_MICROCODE_OLD_INTERFACE is not set
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> # CONFIG_NOHIGHMEM is not set
> CONFIG_HIGHMEM4G=3Dy
> # CONFIG_VMSPLIT_3G is not set
> CONFIG_VMSPLIT_3G_OPT=3Dy
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_2G_OPT is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xB0000000
> CONFIG_HIGHMEM=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> CONFIG_HIGHPTE=3Dy
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> # CONFIG_X86_PAT is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> CONFIG_X86_INTEL_TSX_MODE_ON=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_EFI is not set
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> # CONFIG_KEXEC is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> CONFIG_COMPAT_VDSO=3Dy
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> # CONFIG_SUSPEND_SKIP_SYNC is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_DEBUGGER=3Dy
> CONFIG_ACPI_DEBUGGER_USER=3Dy
> # CONFIG_ACPI_SPCR_TABLE is not set
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_TAD is not set
> # CONFIG_ACPI_DOCK is not set
> # CONFIG_ACPI_PROCESSOR is not set
> CONFIG_ACPI_IPMI=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_TABLE_UPGRADE is not set
> CONFIG_ACPI_DEBUG=3Dy
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_CONFIGFS=3Dy
> # CONFIG_PMIC_OPREGION is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dy
> CONFIG_APM_IGNORE_USER_SUSPEND=3Dy
> CONFIG_APM_DO_ENABLE=3Dy
> CONFIG_APM_CPU_IDLE=3Dy
> # CONFIG_APM_DISPLAY_BLANK is not set
> # CONFIG_APM_ALLOW_INTS is not set
> =

> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> # CONFIG_PCI_GOBIOS is not set
> # CONFIG_PCI_GOMMCONFIG is not set
> # CONFIG_PCI_GODIRECT is not set
> # CONFIG_PCI_GOOLPC is not set
> CONFIG_PCI_GOANY=3Dy
> CONFIG_PCI_BIOS=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_OLPC=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_ISA_BUS=3Dy
> CONFIG_ISA_DMA_API=3Dy
> # CONFIG_ISA is not set
> CONFIG_SCx200=3Dy
> CONFIG_SCx200HR_TIMER=3Dy
> CONFIG_OLPC=3Dy
> CONFIG_OLPC_XO15_SCI=3Dy
> # CONFIG_ALIX is not set
> CONFIG_NET5501=3Dy
> # CONFIG_GEOS is not set
> # CONFIG_X86_SYSFB is not set
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> CONFIG_COMPAT_32=3Dy
> # end of Binary Emulations
> =

> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_DMIID is not set
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> # CONFIG_KPROBES is not set
> # CONFIG_JUMP_LABEL is not set
> CONFIG_STATIC_CALL_SELFTEST=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_32BIT_OFF_T=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D8
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_LOCK_EVENT_COUNTS=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_SPLIT_ARG64=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_FLATMEM_MANUAL is not set
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_COMPACTION is not set
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> # CONFIG_CLEANCACHE is not set
> CONFIG_CMA=3Dy
> # CONFIG_CMA_DEBUG is not set
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> CONFIG_Z3FOLD=3Dy
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_PERCPU_STATS=3Dy
> # CONFIG_GUP_TEST is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_KMAP_LOCAL=3Dy
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> # CONFIG_PACKET_DIAG is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_UNIX_DIAG=3Dy
> # CONFIG_TLS is not set
> # CONFIG_XFRM_USER is not set
> # CONFIG_NET_KEY is not set
> CONFIG_INET=3Dy
> # CONFIG_IP_MULTICAST is not set
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> # CONFIG_NET_IPIP is not set
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=3Dy
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_NET_IPVTI is not set
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TUNNEL=3Dy
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> # CONFIG_INET_UDP_DIAG is not set
> # CONFIG_INET_RAW_DIAG is not set
> # CONFIG_INET_DIAG_DESTROY is not set
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=3Dy
> # CONFIG_IPV6_ROUTER_PREF is not set
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> # CONFIG_INET6_AH is not set
> # CONFIG_INET6_ESP is not set
> # CONFIG_INET6_IPCOMP is not set
> # CONFIG_IPV6_MIP6 is not set
> # CONFIG_IPV6_ILA is not set
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_MPTCP is not set
> CONFIG_NETWORK_SECMARK=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> # CONFIG_BRIDGE_NETFILTER is not set
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> # CONFIG_NETFILTER_NETLINK_ACCT is not set
> # CONFIG_NETFILTER_NETLINK_QUEUE is not set
> # CONFIG_NETFILTER_NETLINK_LOG is not set
> # CONFIG_NETFILTER_NETLINK_OSF is not set
> # CONFIG_NF_CONNTRACK is not set
> # CONFIG_NF_LOG_NETDEV is not set
> # CONFIG_NF_TABLES is not set
> # CONFIG_NETFILTER_XTABLES is not set
> # end of Core Netfilter Configuration
> =

> # CONFIG_IP_SET is not set
> # CONFIG_IP_VS is not set
> =

> #
> # IP: Netfilter Configuration
> #
> # CONFIG_NF_SOCKET_IPV4 is not set
> # CONFIG_NF_TPROXY_IPV4 is not set
> # CONFIG_NF_DUP_IPV4 is not set
> # CONFIG_NF_LOG_ARP is not set
> # CONFIG_NF_LOG_IPV4 is not set
> # CONFIG_NF_REJECT_IPV4 is not set
> # CONFIG_IP_NF_IPTABLES is not set
> # CONFIG_IP_NF_ARPTABLES is not set
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> # CONFIG_NF_SOCKET_IPV6 is not set
> # CONFIG_NF_TPROXY_IPV6 is not set
> # CONFIG_NF_DUP_IPV6 is not set
> # CONFIG_NF_REJECT_IPV6 is not set
> # CONFIG_NF_LOG_IPV6 is not set
> # CONFIG_IP6_NF_IPTABLES is not set
> # end of IPv6: Netfilter Configuration
> =

> #
> # DECnet: Netfilter Configuration
> #
> # CONFIG_DECNET_NF_GRABULATOR is not set
> # end of DECnet: Netfilter Configuration
> =

> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> CONFIG_ATM=3Dy
> # CONFIG_ATM_CLIP is not set
> # CONFIG_ATM_LANE is not set
> # CONFIG_ATM_BR2684 is not set
> # CONFIG_L2TP is not set
> CONFIG_STP=3Dy
> CONFIG_BRIDGE=3Dy
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> # CONFIG_BRIDGE_MRP is not set
> CONFIG_BRIDGE_CFM=3Dy
> CONFIG_HAVE_NET_DSA=3Dy
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> CONFIG_DECNET=3Dy
> # CONFIG_DECNET_ROUTER is not set
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> CONFIG_ATALK=3Dy
> # CONFIG_DEV_APPLETALK is not set
> # CONFIG_X25 is not set
> CONFIG_LAPB=3Dy
> CONFIG_PHONET=3Dy
> # CONFIG_6LOWPAN is not set
> CONFIG_IEEE802154=3Dy
> CONFIG_IEEE802154_NL802154_EXPERIMENTAL=3Dy
> CONFIG_IEEE802154_SOCKET=3Dy
> CONFIG_MAC802154=3Dy
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> # CONFIG_NET_SCH_CBQ is not set
> CONFIG_NET_SCH_HTB=3Dy
> # CONFIG_NET_SCH_HFSC is not set
> # CONFIG_NET_SCH_ATM is not set
> # CONFIG_NET_SCH_PRIO is not set
> # CONFIG_NET_SCH_MULTIQ is not set
> # CONFIG_NET_SCH_RED is not set
> # CONFIG_NET_SCH_SFB is not set
> CONFIG_NET_SCH_SFQ=3Dy
> # CONFIG_NET_SCH_TEQL is not set
> CONFIG_NET_SCH_TBF=3Dy
> CONFIG_NET_SCH_CBS=3Dy
> CONFIG_NET_SCH_ETF=3Dy
> # CONFIG_NET_SCH_TAPRIO is not set
> # CONFIG_NET_SCH_GRED is not set
> CONFIG_NET_SCH_DSMARK=3Dy
> # CONFIG_NET_SCH_NETEM is not set
> CONFIG_NET_SCH_DRR=3Dy
> CONFIG_NET_SCH_MQPRIO=3Dy
> CONFIG_NET_SCH_SKBPRIO=3Dy
> CONFIG_NET_SCH_CHOKE=3Dy
> # CONFIG_NET_SCH_QFQ is not set
> CONFIG_NET_SCH_CODEL=3Dy
> # CONFIG_NET_SCH_FQ_CODEL is not set
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dy
> # CONFIG_NET_SCH_HHF is not set
> # CONFIG_NET_SCH_PIE is not set
> CONFIG_NET_SCH_PLUG=3Dy
> CONFIG_NET_SCH_ETS=3Dy
> # CONFIG_NET_SCH_DEFAULT is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dy
> CONFIG_NET_CLS_TCINDEX=3Dy
> # CONFIG_NET_CLS_ROUTE4 is not set
> CONFIG_NET_CLS_FW=3Dy
> CONFIG_NET_CLS_U32=3Dy
> # CONFIG_CLS_U32_PERF is not set
> CONFIG_CLS_U32_MARK=3Dy
> # CONFIG_NET_CLS_RSVP is not set
> # CONFIG_NET_CLS_RSVP6 is not set
> CONFIG_NET_CLS_FLOW=3Dy
> CONFIG_NET_CLS_CGROUP=3Dy
> # CONFIG_NET_CLS_BPF is not set
> CONFIG_NET_CLS_FLOWER=3Dy
> CONFIG_NET_CLS_MATCHALL=3Dy
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dy
> # CONFIG_NET_EMATCH_NBYTE is not set
> # CONFIG_NET_EMATCH_U32 is not set
> # CONFIG_NET_EMATCH_META is not set
> CONFIG_NET_EMATCH_TEXT=3Dy
> # CONFIG_NET_CLS_ACT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> # CONFIG_DNS_RESOLVER is not set
> CONFIG_BATMAN_ADV=3Dy
> CONFIG_BATMAN_ADV_BATMAN_V=3Dy
> CONFIG_BATMAN_ADV_BLA=3Dy
> CONFIG_BATMAN_ADV_DAT=3Dy
> # CONFIG_BATMAN_ADV_NC is not set
> CONFIG_BATMAN_ADV_MCAST=3Dy
> CONFIG_BATMAN_ADV_DEBUG=3Dy
> CONFIG_BATMAN_ADV_TRACING=3Dy
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> CONFIG_NETLINK_DIAG=3Dy
> # CONFIG_MPLS is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> # CONFIG_QRTR is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_JIT is not set
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> # end of Network testing
> # end of Networking options
> =

> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_WIRELESS=3Dy
> CONFIG_CFG80211=3Dy
> CONFIG_NL80211_TESTMODE=3Dy
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> CONFIG_CFG80211_CERTIFICATION_ONUS=3Dy
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> # CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS is not set
> CONFIG_CFG80211_EXTRA_REGDB_KEYDIR=3D""
> CONFIG_CFG80211_REG_CELLULAR_HINTS=3Dy
> CONFIG_CFG80211_REG_RELAX_NO_IR=3Dy
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> # CONFIG_CFG80211_CRDA_SUPPORT is not set
> # CONFIG_CFG80211_WEXT is not set
> CONFIG_MAC80211=3Dy
> CONFIG_MAC80211_HAS_RC=3Dy
> CONFIG_MAC80211_RC_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
> # CONFIG_MAC80211_MESH is not set
> # CONFIG_MAC80211_LEDS is not set
> # CONFIG_MAC80211_DEBUGFS is not set
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> CONFIG_MAC80211_DEBUG_MENU=3Dy
> CONFIG_MAC80211_NOINLINE=3Dy
> # CONFIG_MAC80211_VERBOSE_DEBUG is not set
> CONFIG_MAC80211_MLME_DEBUG=3Dy
> # CONFIG_MAC80211_STA_DEBUG is not set
> CONFIG_MAC80211_HT_DEBUG=3Dy
> # CONFIG_MAC80211_OCB_DEBUG is not set
> # CONFIG_MAC80211_IBSS_DEBUG is not set
> CONFIG_MAC80211_PS_DEBUG=3Dy
> # CONFIG_MAC80211_TDLS_DEBUG is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> # CONFIG_RFKILL_INPUT is not set
> # CONFIG_RFKILL_GPIO is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> CONFIG_NET_9P_DEBUG=3Dy
> # CONFIG_CAIF is not set
> # CONFIG_CEPH_LIB is not set
> CONFIG_NFC=3Dy
> CONFIG_NFC_DIGITAL=3Dy
> # CONFIG_NFC_NCI is not set
> CONFIG_NFC_HCI=3Dy
> # CONFIG_NFC_SHDLC is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> # CONFIG_NFC_SIM is not set
> CONFIG_NFC_PN533=3Dy
> CONFIG_NFC_PN533_I2C=3Dy
> CONFIG_NFC_PN532_UART=3Dy
> # end of Near Field Communication (NFC) devices
> =

> CONFIG_PSAMPLE=3Dy
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_PAGE_POOL=3Dy
> CONFIG_FAILOVER=3Dy
> # CONFIG_ETHTOOL_NETLINK is not set
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_PCIE_BUS_TUNE_OFF is not set
> CONFIG_PCIE_BUS_DEFAULT=3Dy
> # CONFIG_PCIE_BUS_SAFE is not set
> # CONFIG_PCIE_BUS_PERFORMANCE is not set
> # CONFIG_PCIE_BUS_PEER2PEER is not set
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI controller drivers
> #
> # CONFIG_PCI_FTPCI100 is not set
> # CONFIG_PCI_HOST_GENERIC is not set
> # CONFIG_PCIE_XILINX is not set
> =

> #
> # DesignWare PCI Core Support
> #
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # CONFIG_PCIE_CADENCE_PLAT_HOST is not set
> # CONFIG_PCI_J721E_HOST is not set
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> =

> # CONFIG_CXL_BUS is not set
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> # CONFIG_STANDALONE is not set
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_FW_LOADER_COMPRESS=3Dy
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_WANT_DEV_COREDUMP=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_PM_QOS_KUNIT_TEST=3Dy
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_KUNIT_DRIVER_PE_TEST=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SLIMBUS=3Dy
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_REGMAP_SOUNDWIRE=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> CONFIG_SIMPLE_PM_BUS=3Dy
> CONFIG_MHI_BUS=3Dy
> # CONFIG_MHI_BUS_DEBUG is not set
> # CONFIG_MHI_BUS_PCI_GENERIC is not set
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> # CONFIG_GNSS is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_TESTS is not set
> =

> #
> # Partition parsers
> #
> # CONFIG_MTD_AR7_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_OF_PARTS=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # end of Partition parsers
> =

> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_OOPS is not set
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_INTELEXT is not set
> CONFIG_MTD_CFI_AMDSTD=3Dy
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_ABSENT is not set
> # end of RAM/ROM/Flash chip drivers
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> # CONFIG_MTD_PHYSMAP_OF is not set
> CONFIG_MTD_PHYSMAP_GPIO_ADDR=3Dy
> CONFIG_MTD_SCx200_DOCFLASH=3Dy
> CONFIG_MTD_AMD76XROM=3Dy
> # CONFIG_MTD_ICHXROM is not set
> # CONFIG_MTD_ESB2ROM is not set
> # CONFIG_MTD_CK804XROM is not set
> # CONFIG_MTD_SCB2_FLASH is not set
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dy
> # CONFIG_MTD_PCI is not set
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dy
> # end of Mapping drivers for chip access
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> CONFIG_MTD_SLRAM=3Dy
> # CONFIG_MTD_PHRAM is not set
> # CONFIG_MTD_MTDRAM is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> # end of Self-contained MTD device drivers
> =

> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=3Dy
> CONFIG_MTD_ONENAND=3Dy
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> CONFIG_MTD_ONENAND_OTP=3Dy
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> CONFIG_MTD_RAW_NAND=3Dy
> =

> #
> # Raw/parallel NAND flash controllers
> #
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> # CONFIG_MTD_NAND_DENALI_DT is not set
> # CONFIG_MTD_NAND_CAFE is not set
> CONFIG_MTD_NAND_CS553X=3Dy
> CONFIG_MTD_NAND_MXIC=3Dy
> CONFIG_MTD_NAND_GPIO=3Dy
> CONFIG_MTD_NAND_PLATFORM=3Dy
> CONFIG_MTD_NAND_CADENCE=3Dy
> CONFIG_MTD_NAND_ARASAN=3Dy
> CONFIG_MTD_NAND_INTEL_LGM=3Dy
> =

> #
> # Misc
> #
> CONFIG_MTD_NAND_NANDSIM=3Dy
> # CONFIG_MTD_NAND_RICOH is not set
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> =

> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> # CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
> CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> # end of ECC engine support
> # end of NAND
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> # end of LPDDR & LPDDR2 PCM memory drivers
> =

> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> CONFIG_MTD_UBI_GLUEBI=3Dy
> CONFIG_MTD_HYPERBUS=3Dy
> CONFIG_DTC=3Dy
> CONFIG_OF=3Dy
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_EARLY_FLATTREE=3Dy
> CONFIG_OF_PROMTREE=3Dy
> CONFIG_OF_KOBJ=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_RESERVED_MEM=3Dy
> # CONFIG_OF_OVERLAY is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # NVME Support
> #
> # end of NVME Support
> =

> #
> # Misc devices
> #
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> # CONFIG_PCH_PHUB is not set
> # CONFIG_SRAM is not set
> # CONFIG_PCI_ENDPOINT_TEST is not set
> CONFIG_XILINX_SDFEC=3Dy
> CONFIG_PVPANIC=3Dy
> # CONFIG_HISI_HIKEY_USB is not set
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> CONFIG_EEPROM_EE1004=3Dy
> # end of EEPROM support
> =

> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> # CONFIG_SENSORS_LIS3_I2C is not set
> # CONFIG_ALTERA_STAPL is not set
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
> CONFIG_ECHO=3Dy
> # CONFIG_MISC_ALCOR_PCI is not set
> # CONFIG_MISC_RTSX_PCI is not set
> # CONFIG_HABANA_AI is not set
> # end of Misc devices
> =

> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # end of SCSI device support
> =

> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_MAC_EMUMOUSEBTN is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> # CONFIG_NET_CORE is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> CONFIG_ATM_DUMMY=3Dy
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> =

> #
> # Distributed Switch Architecture drivers
> #
> # end of Distributed Switch Architecture drivers
> =

> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> # CONFIG_NET_VENDOR_ALACRITECH is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> # CONFIG_NET_VENDOR_AMAZON is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> # CONFIG_NET_VENDOR_AQUANTIA is not set
> # CONFIG_NET_VENDOR_ARC is not set
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> # CONFIG_NET_VENDOR_BROADCOM is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> # CONFIG_NET_VENDOR_CAVIUM is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> CONFIG_GEMINI_ETHERNET=3Dy
> # CONFIG_CX_ECAT is not set
> CONFIG_DNET=3Dy
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> # CONFIG_NET_VENDOR_GOOGLE is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_I40E is not set
> # CONFIG_IGC is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> # CONFIG_NET_VENDOR_MELLANOX is not set
> # CONFIG_NET_VENDOR_MICREL is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_LAN743X is not set
> # CONFIG_NET_VENDOR_MICROSEMI is not set
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> # CONFIG_NET_VENDOR_NATSEMI is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> # CONFIG_NET_VENDOR_NETRONOME is not set
> # CONFIG_NET_VENDOR_NI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_PCH_GBE is not set
> CONFIG_ETHOC=3Dy
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> # CONFIG_NET_VENDOR_QUALCOMM is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> CONFIG_SXGBE_ETH=3Dy
> # CONFIG_NET_VENDOR_SEEQ is not set
> # CONFIG_NET_VENDOR_SOLARFLARE is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> # CONFIG_NET_VENDOR_SOCIONEXT is not set
> CONFIG_NET_VENDOR_STMICRO=3Dy
> CONFIG_STMMAC_ETH=3Dy
> # CONFIG_STMMAC_SELFTESTS is not set
> CONFIG_STMMAC_PLATFORM=3Dy
> CONFIG_DWMAC_DWC_QOS_ETH=3Dy
> CONFIG_DWMAC_GENERIC=3Dy
> CONFIG_DWMAC_INTEL_PLAT=3Dy
> CONFIG_DWMAC_INTEL=3Dy
> # CONFIG_STMMAC_PCI is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> # CONFIG_NET_VENDOR_VIA is not set
> # CONFIG_NET_VENDOR_WIZNET is not set
> # CONFIG_NET_VENDOR_XILINX is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> CONFIG_NET_SB1000=3Dy
> CONFIG_PHYLINK=3Dy
> CONFIG_PHYLIB=3Dy
> CONFIG_SWPHY=3Dy
> # CONFIG_LED_TRIGGER_PHY is not set
> CONFIG_FIXED_PHY=3Dy
> CONFIG_SFP=3Dy
> =

> #
> # MII PHY device drivers
> #
> CONFIG_AMD_PHY=3Dy
> CONFIG_ADIN_PHY=3Dy
> CONFIG_AQUANTIA_PHY=3Dy
> CONFIG_AX88796B_PHY=3Dy
> CONFIG_BROADCOM_PHY=3Dy
> CONFIG_BCM54140_PHY=3Dy
> CONFIG_BCM7XXX_PHY=3Dy
> CONFIG_BCM84881_PHY=3Dy
> CONFIG_BCM87XX_PHY=3Dy
> CONFIG_BCM_NET_PHYLIB=3Dy
> # CONFIG_CICADA_PHY is not set
> # CONFIG_CORTINA_PHY is not set
> # CONFIG_DAVICOM_PHY is not set
> CONFIG_ICPLUS_PHY=3Dy
> # CONFIG_LXT_PHY is not set
> CONFIG_INTEL_XWAY_PHY=3Dy
> CONFIG_LSI_ET1011C_PHY=3Dy
> CONFIG_MARVELL_PHY=3Dy
> CONFIG_MARVELL_10G_PHY=3Dy
> CONFIG_MICREL_PHY=3Dy
> CONFIG_MICROCHIP_PHY=3Dy
> # CONFIG_MICROCHIP_T1_PHY is not set
> # CONFIG_MICROSEMI_PHY is not set
> # CONFIG_NATIONAL_PHY is not set
> CONFIG_NXP_TJA11XX_PHY=3Dy
> # CONFIG_AT803X_PHY is not set
> CONFIG_QSEMI_PHY=3Dy
> CONFIG_REALTEK_PHY=3Dy
> CONFIG_RENESAS_PHY=3Dy
> CONFIG_ROCKCHIP_PHY=3Dy
> CONFIG_SMSC_PHY=3Dy
> CONFIG_STE10XP=3Dy
> CONFIG_TERANETICS_PHY=3Dy
> # CONFIG_DP83822_PHY is not set
> CONFIG_DP83TC811_PHY=3Dy
> CONFIG_DP83848_PHY=3Dy
> CONFIG_DP83867_PHY=3Dy
> CONFIG_DP83869_PHY=3Dy
> # CONFIG_VITESSE_PHY is not set
> # CONFIG_XILINX_GMII2RGMII is not set
> CONFIG_MDIO_DEVICE=3Dy
> CONFIG_MDIO_BUS=3Dy
> CONFIG_OF_MDIO=3Dy
> CONFIG_MDIO_DEVRES=3Dy
> # CONFIG_MDIO_BITBANG is not set
> CONFIG_MDIO_BCM_UNIMAC=3Dy
> CONFIG_MDIO_HISI_FEMAC=3Dy
> CONFIG_MDIO_I2C=3Dy
> # CONFIG_MDIO_MSCC_MIIM is not set
> CONFIG_MDIO_IPQ4019=3Dy
> CONFIG_MDIO_IPQ8064=3Dy
> =

> #
> # MDIO Multiplexers
> #
> CONFIG_MDIO_BUS_MUX=3Dy
> # CONFIG_MDIO_BUS_MUX_GPIO is not set
> CONFIG_MDIO_BUS_MUX_MULTIPLEXER=3Dy
> # CONFIG_MDIO_BUS_MUX_MMIOREG is not set
> =

> #
> # PCS device drivers
> #
> CONFIG_PCS_XPCS=3Dy
> # end of PCS device drivers
> =

> CONFIG_PPP=3Dy
> CONFIG_PPP_BSDCOMP=3Dy
> # CONFIG_PPP_DEFLATE is not set
> CONFIG_PPP_FILTER=3Dy
> CONFIG_PPP_MPPE=3Dy
> # CONFIG_PPP_MULTILINK is not set
> # CONFIG_PPPOATM is not set
> # CONFIG_PPPOE is not set
> # CONFIG_PPP_ASYNC is not set
> # CONFIG_PPP_SYNC_TTY is not set
> # CONFIG_SLIP is not set
> CONFIG_SLHC=3Dy
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> # CONFIG_ADM8211 is not set
> # CONFIG_WLAN_VENDOR_ATH is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> # CONFIG_ATMEL is not set
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> # CONFIG_B43 is not set
> # CONFIG_B43LEGACY is not set
> CONFIG_BRCMUTIL=3Dy
> CONFIG_BRCMSMAC=3Dy
> CONFIG_BRCMFMAC=3Dy
> CONFIG_BRCMFMAC_PROTO_BCDC=3Dy
> CONFIG_BRCMFMAC_SDIO=3Dy
> # CONFIG_BRCMFMAC_PCIE is not set
> CONFIG_BRCM_TRACING=3Dy
> # CONFIG_BRCMDBG is not set
> # CONFIG_WLAN_VENDOR_CISCO is not set
> # CONFIG_WLAN_VENDOR_INTEL is not set
> # CONFIG_WLAN_VENDOR_INTERSIL is not set
> # CONFIG_WLAN_VENDOR_MARVELL is not set
> # CONFIG_WLAN_VENDOR_MEDIATEK is not set
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> # CONFIG_WILC1000_SDIO is not set
> # CONFIG_WLAN_VENDOR_RALINK is not set
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> # CONFIG_RTL8180 is not set
> CONFIG_RTL_CARDS=3Dy
> # CONFIG_RTL8192CE is not set
> # CONFIG_RTL8192SE is not set
> # CONFIG_RTL8192DE is not set
> # CONFIG_RTL8723AE is not set
> # CONFIG_RTL8723BE is not set
> # CONFIG_RTL8188EE is not set
> # CONFIG_RTL8192EE is not set
> # CONFIG_RTL8821AE is not set
> CONFIG_RTW88=3Dy
> # CONFIG_RTW88_8822BE is not set
> # CONFIG_RTW88_8822CE is not set
> # CONFIG_RTW88_8723DE is not set
> # CONFIG_RTW88_8821CE is not set
> # CONFIG_WLAN_VENDOR_RSI is not set
> CONFIG_WLAN_VENDOR_ST=3Dy
> CONFIG_CW1200=3Dy
> # CONFIG_CW1200_WLAN_SDIO is not set
> CONFIG_WLAN_VENDOR_TI=3Dy
> # CONFIG_WL1251 is not set
> CONFIG_WL12XX=3Dy
> # CONFIG_WL18XX is not set
> CONFIG_WLCORE=3Dy
> # CONFIG_WLCORE_SDIO is not set
> # CONFIG_WLAN_VENDOR_ZYDAS is not set
> # CONFIG_WLAN_VENDOR_QUANTENNA is not set
> CONFIG_MAC80211_HWSIM=3Dy
> CONFIG_VIRT_WIFI=3Dy
> CONFIG_WAN=3Dy
> # CONFIG_LANMEDIA is not set
> CONFIG_HDLC=3Dy
> CONFIG_HDLC_RAW=3Dy
> CONFIG_HDLC_RAW_ETH=3Dy
> # CONFIG_HDLC_CISCO is not set
> CONFIG_HDLC_FR=3Dy
> # CONFIG_HDLC_PPP is not set
> CONFIG_HDLC_X25=3Dy
> # CONFIG_PCI200SYN is not set
> # CONFIG_WANXL is not set
> # CONFIG_PC300TOO is not set
> # CONFIG_FARSYNC is not set
> # CONFIG_SBNI is not set
> # CONFIG_IEEE802154_DRIVERS is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=3Dy
> CONFIG_ISDN=3Dy
> CONFIG_MISDN=3Dy
> CONFIG_MISDN_DSP=3Dy
> CONFIG_MISDN_L1OIP=3Dy
> =

> #
> # mISDN hardware drivers
> #
> # CONFIG_MISDN_HFCPCI is not set
> # CONFIG_MISDN_HFCMULTI is not set
> # CONFIG_MISDN_AVMFRITZ is not set
> # CONFIG_MISDN_SPEEDFAX is not set
> # CONFIG_MISDN_INFINEON is not set
> # CONFIG_MISDN_W6692 is not set
> # CONFIG_MISDN_NETJET is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_SPARSEKMAP is not set
> # CONFIG_INPUT_MATRIXKMAP is not set
> =

> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADC is not set
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_STMPE is not set
> # CONFIG_KEYBOARD_IQS62X is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> # CONFIG_KEYBOARD_BCM is not set
> # CONFIG_KEYBOARD_MTK_PMIC is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> # CONFIG_MOUSE_PS2_OLPC is not set
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> # CONFIG_MOUSE_ELAN_I2C is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> # CONFIG_MOUSE_GPIO is not set
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> # CONFIG_RMI4_CORE is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_SERIO_APBPS2=3Dy
> CONFIG_SERIO_GPIO_PS2=3Dy
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> # CONFIG_GAMEPORT_NS558 is not set
> CONFIG_GAMEPORT_L4=3Dy
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_ASPEED_VUART is not set
> CONFIG_SERIAL_8250_DWLIB=3Dy
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_OF_PLATFORM is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SIFIVE is not set
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_PCH_UART is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_SERIAL_SPRD is not set
> # CONFIG_SERIAL_LITEUART is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> # CONFIG_TRACE_SINK is not set
> CONFIG_SERIAL_DEV_BUS=3Dy
> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dy
> # CONFIG_IPMI_SSIF is not set
> CONFIG_IPMI_WATCHDOG=3Dy
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_IPMB_DEVICE_INTERFACE=3Dy
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_GEODE=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_HW_RANDOM_CCTRNG is not set
> CONFIG_HW_RANDOM_XIPHERA=3Dy
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> # CONFIG_MWAVE is not set
> CONFIG_SCx200_GPIO=3Dy
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVKMEM is not set
> CONFIG_NVRAM=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> # CONFIG_HPET_MMAP is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> # CONFIG_HW_RANDOM_TPM is not set
> # CONFIG_TCG_TIS is not set
> # CONFIG_TCG_TIS_I2C_CR50 is not set
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> # CONFIG_TCG_NSC is not set
> CONFIG_TCG_ATMEL=3Dy
> CONFIG_TCG_INFINEON=3Dy
> CONFIG_TCG_CRB=3Dy
> CONFIG_TCG_VTPM_PROXY=3Dy
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> CONFIG_TELCLOCK=3Dy
> # CONFIG_XILLYBUS is not set
> # end of Character devices
> =

> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
> CONFIG_I2C_MUX_GPIO=3Dy
> # CONFIG_I2C_MUX_GPMUX is not set
> CONFIG_I2C_MUX_LTC4306=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_PINCTRL is not set
> # CONFIG_I2C_MUX_REG is not set
> # CONFIG_I2C_DEMUX_PINCTRL is not set
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> =

> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> # CONFIG_I2C_AMD8111 is not set
> # CONFIG_I2C_AMD_MP2 is not set
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> # CONFIG_I2C_ISMT is not set
> # CONFIG_I2C_PIIX4 is not set
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_NVIDIA_GPU is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> # CONFIG_I2C_SIS96X is not set
> # CONFIG_I2C_VIA is not set
> # CONFIG_I2C_VIAPRO is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_I2C_SCMI is not set
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dy
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EG20T is not set
> CONFIG_I2C_EMEV2=3Dy
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> CONFIG_I2C_KEMPLD=3Dy
> CONFIG_I2C_OCORES=3Dy
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA is not set
> CONFIG_I2C_RK3X=3Dy
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_SCx200_ACB is not set
> CONFIG_I2C_FSI=3Dy
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> CONFIG_I2C_SLAVE_TESTUNIT=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> # CONFIG_HSI_CHAR is not set
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_GPIO=3Dy
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_PTP_1588_CLOCK_PCH=3Dy
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> # CONFIG_DEBUG_PINCTRL is not set
> CONFIG_PINCTRL_AMD=3Dy
> CONFIG_PINCTRL_DA9062=3Dy
> CONFIG_PINCTRL_MCP23S08_I2C=3Dy
> CONFIG_PINCTRL_MCP23S08=3Dy
> # CONFIG_PINCTRL_SINGLE is not set
> CONFIG_PINCTRL_SX150X=3Dy
> CONFIG_PINCTRL_STMFX=3Dy
> CONFIG_PINCTRL_MAX77620=3Dy
> CONFIG_PINCTRL_PALMAS=3Dy
> # CONFIG_PINCTRL_RK805 is not set
> CONFIG_PINCTRL_OCELOT=3Dy
> # CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_ALDERLAKE=3Dy
> CONFIG_PINCTRL_BROXTON=3Dy
> CONFIG_PINCTRL_CANNONLAKE=3Dy
> # CONFIG_PINCTRL_CEDARFORK is not set
> CONFIG_PINCTRL_DENVERTON=3Dy
> CONFIG_PINCTRL_ELKHARTLAKE=3Dy
> # CONFIG_PINCTRL_EMMITSBURG is not set
> CONFIG_PINCTRL_GEMINILAKE=3Dy
> CONFIG_PINCTRL_ICELAKE=3Dy
> # CONFIG_PINCTRL_JASPERLAKE is not set
> CONFIG_PINCTRL_LAKEFIELD=3Dy
> CONFIG_PINCTRL_LEWISBURG=3Dy
> CONFIG_PINCTRL_SUNRISEPOINT=3Dy
> CONFIG_PINCTRL_TIGERLAKE=3Dy
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_PINCTRL_LOCHNAGAR=3Dy
> CONFIG_PINCTRL_MADERA=3Dy
> CONFIG_PINCTRL_CS47L15=3Dy
> CONFIG_PINCTRL_CS47L90=3Dy
> CONFIG_PINCTRL_CS47L92=3Dy
> CONFIG_PINCTRL_EQUILIBRIUM=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=3Dy
> CONFIG_GPIO_ALTERA=3Dy
> CONFIG_GPIO_AMDPT=3Dy
> CONFIG_GPIO_CADENCE=3Dy
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_FTGPIO010 is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_GRGPIO=3Dy
> CONFIG_GPIO_HLWD=3Dy
> # CONFIG_GPIO_ICH is not set
> CONFIG_GPIO_LOGICVC=3Dy
> CONFIG_GPIO_MB86S7X=3Dy
> # CONFIG_GPIO_MENZ127 is not set
> CONFIG_GPIO_SAMA5D2_PIOBU=3Dy
> CONFIG_GPIO_SIFIVE=3Dy
> CONFIG_GPIO_SIOX=3Dy
> CONFIG_GPIO_SYSCON=3Dy
> # CONFIG_GPIO_VX855 is not set
> CONFIG_GPIO_WCD934X=3Dy
> CONFIG_GPIO_XILINX=3Dy
> CONFIG_GPIO_AMD_FCH=3Dy
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_IT87=3Dy
> CONFIG_GPIO_SCH=3Dy
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> # CONFIG_GPIO_ADP5588_IRQ is not set
> # CONFIG_GPIO_ADNP is not set
> CONFIG_GPIO_GW_PLD=3Dy
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> # CONFIG_GPIO_PCA9570 is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=3Dy
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_BD70528=3Dy
> # CONFIG_GPIO_BD9571MWV is not set
> # CONFIG_GPIO_DA9052 is not set
> # CONFIG_GPIO_DA9055 is not set
> CONFIG_GPIO_KEMPLD=3Dy
> CONFIG_GPIO_LP3943=3Dy
> CONFIG_GPIO_LP87565=3Dy
> CONFIG_GPIO_MADERA=3Dy
> CONFIG_GPIO_MAX77620=3Dy
> # CONFIG_GPIO_MAX77650 is not set
> # CONFIG_GPIO_PALMAS is not set
> CONFIG_GPIO_RC5T583=3Dy
> CONFIG_GPIO_STMPE=3Dy
> # CONFIG_GPIO_TPS65912 is not set
> # CONFIG_GPIO_TQMX86 is not set
> # CONFIG_GPIO_TWL4030 is not set
> # CONFIG_GPIO_WM8350 is not set
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # CONFIG_GPIO_SODAVILLE is not set
> # end of PCI GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=3Dy
> # CONFIG_GPIO_MOCKUP is not set
> # end of Virtual GPIO drivers
> =

> CONFIG_W1=3Dy
> # CONFIG_W1_CON is not set
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> # CONFIG_W1_MASTER_DS2482 is not set
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> CONFIG_W1_MASTER_SGI=3Dy
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> # CONFIG_W1_SLAVE_SMEM is not set
> # CONFIG_W1_SLAVE_DS2405 is not set
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> # CONFIG_W1_SLAVE_DS2805 is not set
> CONFIG_W1_SLAVE_DS2430=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> # CONFIG_W1_SLAVE_DS2438 is not set
> # CONFIG_W1_SLAVE_DS250X is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> CONFIG_W1_SLAVE_DS28E17=3Dy
> # end of 1-wire Slaves
> =

> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_GENERIC_ADC_BATTERY is not set
> CONFIG_WM8350_POWER=3Dy
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_88PM860X=3Dy
> CONFIG_CHARGER_ADP5061=3Dy
> CONFIG_BATTERY_ACT8945A=3Dy
> # CONFIG_BATTERY_CW2015 is not set
> CONFIG_BATTERY_DS2760=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_OLPC=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_CHARGER_SBS=3Dy
> # CONFIG_MANAGER_SBS is not set
> CONFIG_BATTERY_BQ27XXX=3Dy
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dy
> CONFIG_BATTERY_DA9030=3Dy
> # CONFIG_BATTERY_DA9052 is not set
> CONFIG_CHARGER_DA9150=3Dy
> CONFIG_BATTERY_DA9150=3Dy
> CONFIG_BATTERY_MAX17040=3Dy
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=3Dy
> CONFIG_BATTERY_TWL4030_MADC=3Dy
> CONFIG_CHARGER_88PM860X=3Dy
> # CONFIG_CHARGER_PCF50633 is not set
> CONFIG_BATTERY_RX51=3Dy
> # CONFIG_CHARGER_ISP1704 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_TWL4030=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_GPIO=3Dy
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_LT3651=3Dy
> CONFIG_CHARGER_LTC4162L=3Dy
> CONFIG_CHARGER_DETECTOR_MAX14656=3Dy
> # CONFIG_CHARGER_MAX77650 is not set
> # CONFIG_CHARGER_MAX77693 is not set
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24190=3Dy
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ2515X=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_BQ25980=3Dy
> # CONFIG_CHARGER_BQ256XX is not set
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_CHARGER_TPS65217=3Dy
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_RT5033=3Dy
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_CHARGER_UCS1002=3Dy
> # CONFIG_CHARGER_BD70528 is not set
> CONFIG_CHARGER_BD99954=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> # CONFIG_SENSORS_ABITUGURU3 is not set
> CONFIG_SENSORS_AD7414=3Dy
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> # CONFIG_SENSORS_ADM1031 is not set
> CONFIG_SENSORS_ADM1177=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_AHT10=3Dy
> CONFIG_SENSORS_AS370=3Dy
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> # CONFIG_SENSORS_K8TEMP is not set
> CONFIG_SENSORS_AMD_ENERGY=3Dy
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> CONFIG_SENSORS_ASPEED=3Dy
> # CONFIG_SENSORS_ATXP1 is not set
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9052_ADC=3Dy
> CONFIG_SENSORS_DA9055=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> # CONFIG_SENSORS_F71882FG is not set
> CONFIG_SENSORS_F75375S=3Dy
> # CONFIG_SENSORS_GSC is not set
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_GL518SM=3Dy
> # CONFIG_SENSORS_GL520SM is not set
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> CONFIG_SENSORS_IBMAEM=3Dy
> # CONFIG_SENSORS_IBMPEX is not set
> # CONFIG_SENSORS_IIO_HWMON is not set
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LOCHNAGAR=3Dy
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC2947=3Dy
> CONFIG_SENSORS_LTC2947_I2C=3Dy
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC2992=3Dy
> # CONFIG_SENSORS_LTC4151 is not set
> # CONFIG_SENSORS_LTC4215 is not set
> CONFIG_SENSORS_LTC4222=3Dy
> # CONFIG_SENSORS_LTC4245 is not set
> # CONFIG_SENSORS_LTC4260 is not set
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_MAX127=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> # CONFIG_SENSORS_MAX1619 is not set
> # CONFIG_SENSORS_MAX1668 is not set
> CONFIG_SENSORS_MAX197=3Dy
> CONFIG_SENSORS_MAX31730=3Dy
> CONFIG_SENSORS_MAX6621=3Dy
> CONFIG_SENSORS_MAX6639=3Dy
> CONFIG_SENSORS_MAX6642=3Dy
> # CONFIG_SENSORS_MAX6650 is not set
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_MLXREG_FAN=3Dy
> CONFIG_SENSORS_TC654=3Dy
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_MR75203=3Dy
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM73 is not set
> # CONFIG_SENSORS_LM75 is not set
> # CONFIG_SENSORS_LM77 is not set
> # CONFIG_SENSORS_LM78 is not set
> # CONFIG_SENSORS_LM80 is not set
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> # CONFIG_SENSORS_LM92 is not set
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> CONFIG_SENSORS_LM95241=3Dy
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dy
> # CONFIG_SENSORS_PC87427 is not set
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> CONFIG_SENSORS_NCT6775=3Dy
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_NPCM7XX=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> # CONFIG_SENSORS_ADM1266 is not set
> CONFIG_SENSORS_ADM1275=3Dy
> # CONFIG_SENSORS_BEL_PFE is not set
> CONFIG_SENSORS_IBM_CFFPS=3Dy
> CONFIG_SENSORS_INSPUR_IPSPS=3Dy
> CONFIG_SENSORS_IR35221=3Dy
> # CONFIG_SENSORS_IR38064 is not set
> CONFIG_SENSORS_IRPS5401=3Dy
> CONFIG_SENSORS_ISL68137=3Dy
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> CONFIG_SENSORS_LTC3815=3Dy
> CONFIG_SENSORS_MAX16064=3Dy
> CONFIG_SENSORS_MAX16601=3Dy
> CONFIG_SENSORS_MAX20730=3Dy
> CONFIG_SENSORS_MAX20751=3Dy
> CONFIG_SENSORS_MAX31785=3Dy
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dy
> CONFIG_SENSORS_MP2975=3Dy
> CONFIG_SENSORS_PM6764TR=3Dy
> # CONFIG_SENSORS_PXE1610 is not set
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> CONFIG_SENSORS_TPS40422=3Dy
> CONFIG_SENSORS_TPS53679=3Dy
> # CONFIG_SENSORS_UCD9000 is not set
> CONFIG_SENSORS_UCD9200=3Dy
> # CONFIG_SENSORS_XDPE122 is not set
> # CONFIG_SENSORS_ZL6100 is not set
> CONFIG_SENSORS_PWM_FAN=3Dy
> # CONFIG_SENSORS_SBTSI is not set
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> # CONFIG_SENSORS_STTS751 is not set
> CONFIG_SENSORS_SMM665=3Dy
> # CONFIG_SENSORS_ADC128D818 is not set
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_AMC6821=3Dy
> # CONFIG_SENSORS_INA209 is not set
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_INA3221=3Dy
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> # CONFIG_SENSORS_TMP102 is not set
> # CONFIG_SENSORS_TMP103 is not set
> CONFIG_SENSORS_TMP108=3Dy
> # CONFIG_SENSORS_TMP401 is not set
> # CONFIG_SENSORS_TMP421 is not set
> # CONFIG_SENSORS_TMP513 is not set
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> CONFIG_SENSORS_WM8350=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dy
> CONFIG_SENSORS_ATK0110=3Dy
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_NETLINK=3Dy
> CONFIG_THERMAL_STATISTICS=3Dy
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> # CONFIG_THERMAL_OF is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> CONFIG_THERMAL_MMIO=3Dy
> CONFIG_MAX77620_THERMAL=3Dy
> # CONFIG_DA9062_THERMAL is not set
> =

> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=3Dy
> CONFIG_X86_THERMAL_VECTOR=3Dy
> # CONFIG_X86_PKG_TEMP_THERMAL is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> =

> # CONFIG_INTEL_PCH_THERMAL is not set
> # end of Intel thermal drivers
> =

> CONFIG_GENERIC_ADC_THERMAL=3Dy
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_SFLASH=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_CS5535 is not set
> CONFIG_MFD_ACT8945A=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_MFD_AS3722 is not set
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_ATMEL_FLEXCOM is not set
> CONFIG_MFD_ATMEL_HLCDC=3Dy
> # CONFIG_MFD_BCM590XX is not set
> CONFIG_MFD_BD9571MWV=3Dy
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_MADERA=3Dy
> CONFIG_MFD_MADERA_I2C=3Dy
> CONFIG_MFD_CS47L15=3Dy
> # CONFIG_MFD_CS47L35 is not set
> # CONFIG_MFD_CS47L85 is not set
> CONFIG_MFD_CS47L90=3Dy
> CONFIG_MFD_CS47L92=3Dy
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> CONFIG_MFD_DA9055=3Dy
> CONFIG_MFD_DA9062=3Dy
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_GATEWORKS_GSC=3Dy
> # CONFIG_MFD_MC13XXX_I2C is not set
> CONFIG_MFD_MP2629=3Dy
> # CONFIG_MFD_HI6421_PMIC is not set
> CONFIG_HTC_PASIC3=3Dy
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> # CONFIG_LPC_ICH is not set
> CONFIG_LPC_SCH=3Dy
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> CONFIG_INTEL_SOC_PMIC_CHTDC_TI=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_INTEL_PMT is not set
> CONFIG_MFD_IQS62X=3Dy
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dy
> # CONFIG_MFD_88PM805 is not set
> CONFIG_MFD_88PM860X=3Dy
> # CONFIG_MFD_MAX14577 is not set
> CONFIG_MFD_MAX77620=3Dy
> CONFIG_MFD_MAX77650=3Dy
> CONFIG_MFD_MAX77686=3Dy
> CONFIG_MFD_MAX77693=3Dy
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> CONFIG_MFD_MAX8997=3Dy
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6360 is not set
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dy
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> # CONFIG_PCF50633_GPIO is not set
> # CONFIG_MFD_RDC321X is not set
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_RK808=3Dy
> # CONFIG_MFD_RN5T618 is not set
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SKY81452=3Dy
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_STMPE=3Dy
> =

> #
> # STMicroelectronics STMPE Interface Drivers
> #
> # CONFIG_STMPE_I2C is not set
> # end of STMicroelectronics STMPE Interface Drivers
> =

> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_TI_LMU=3Dy
> CONFIG_MFD_PALMAS=3Dy
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dy
> # CONFIG_MFD_TPS68470 is not set
> # CONFIG_MFD_TI_LP873X is not set
> CONFIG_MFD_TI_LP87565=3Dy
> # CONFIG_MFD_TPS65218 is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS80031 is not set
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_MFD_TWL4030_AUDIO is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TIMBERDALE is not set
> # CONFIG_MFD_TC3589X is not set
> CONFIG_MFD_TQMX86=3Dy
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_LOCHNAGAR=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_CS47L24=3Dy
> # CONFIG_MFD_WM5102 is not set
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8997=3Dy
> CONFIG_MFD_WM8998=3Dy
> CONFIG_MFD_WM8400=3Dy
> # CONFIG_MFD_WM831X_I2C is not set
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> # CONFIG_MFD_WM8994 is not set
> CONFIG_MFD_ROHM_BD718XX=3Dy
> CONFIG_MFD_ROHM_BD70528=3Dy
> # CONFIG_MFD_ROHM_BD71828 is not set
> # CONFIG_MFD_STPMIC1 is not set
> CONFIG_MFD_STMFX=3Dy
> CONFIG_MFD_WCD934X=3Dy
> CONFIG_RAVE_SP_CORE=3Dy
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> # CONFIG_REGULATOR_88PG86X is not set
> # CONFIG_REGULATOR_88PM800 is not set
> # CONFIG_REGULATOR_88PM8607 is not set
> # CONFIG_REGULATOR_ACT8865 is not set
> # CONFIG_REGULATOR_ACT8945A is not set
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_ARIZONA_LDO1=3Dy
> # CONFIG_REGULATOR_ARIZONA_MICSUPP is not set
> CONFIG_REGULATOR_BD70528=3Dy
> CONFIG_REGULATOR_BD718XX=3Dy
> # CONFIG_REGULATOR_BD9571MWV is not set
> CONFIG_REGULATOR_DA903X=3Dy
> # CONFIG_REGULATOR_DA9052 is not set
> CONFIG_REGULATOR_DA9055=3Dy
> # CONFIG_REGULATOR_DA9062 is not set
> CONFIG_REGULATOR_DA9063=3Dy
> CONFIG_REGULATOR_DA9121=3Dy
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_FAN53880=3Dy
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> CONFIG_REGULATOR_ISL6271A=3Dy
> CONFIG_REGULATOR_LM363X=3Dy
> # CONFIG_REGULATOR_LOCHNAGAR is not set
> # CONFIG_REGULATOR_LP3971 is not set
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=3Dy
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LP87565=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> CONFIG_REGULATOR_LTC3676=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX77620=3Dy
> CONFIG_REGULATOR_MAX77650=3Dy
> # CONFIG_REGULATOR_MAX8649 is not set
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8907=3Dy
> CONFIG_REGULATOR_MAX8952=3Dy
> # CONFIG_REGULATOR_MAX8997 is not set
> CONFIG_REGULATOR_MAX77686=3Dy
> CONFIG_REGULATOR_MAX77693=3Dy
> # CONFIG_REGULATOR_MAX77802 is not set
> # CONFIG_REGULATOR_MAX77826 is not set
> CONFIG_REGULATOR_MCP16502=3Dy
> # CONFIG_REGULATOR_MP5416 is not set
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MP886X=3Dy
> # CONFIG_REGULATOR_MPQ7920 is not set
> # CONFIG_REGULATOR_MT6311 is not set
> # CONFIG_REGULATOR_MT6323 is not set
> CONFIG_REGULATOR_MT6358=3Dy
> # CONFIG_REGULATOR_MT6397 is not set
> # CONFIG_REGULATOR_PALMAS is not set
> # CONFIG_REGULATOR_PCA9450 is not set
> # CONFIG_REGULATOR_PCF50633 is not set
> CONFIG_REGULATOR_PF8X00=3Dy
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_PWM=3Dy
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=3Dy
> CONFIG_REGULATOR_RC5T583=3Dy
> CONFIG_REGULATOR_RK808=3Dy
> CONFIG_REGULATOR_ROHM=3Dy
> CONFIG_REGULATOR_RT4801=3Dy
> # CONFIG_REGULATOR_RT5033 is not set
> CONFIG_REGULATOR_RTMV20=3Dy
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_SLG51000=3Dy
> # CONFIG_REGULATOR_SY8106A is not set
> CONFIG_REGULATOR_SY8824X=3Dy
> CONFIG_REGULATOR_SY8827N=3Dy
> CONFIG_REGULATOR_TPS51632=3Dy
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=3Dy
> CONFIG_REGULATOR_TPS6507X=3Dy
> CONFIG_REGULATOR_TPS65132=3Dy
> CONFIG_REGULATOR_TPS65217=3Dy
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_TWL4030=3Dy
> # CONFIG_REGULATOR_VCTRL is not set
> # CONFIG_REGULATOR_WM8350 is not set
> CONFIG_REGULATOR_WM8400=3Dy
> # CONFIG_RC_CORE is not set
> CONFIG_CEC_CORE=3Dy
> CONFIG_CEC_NOTIFIER=3Dy
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dy
> CONFIG_DRM_MIPI_DSI=3Dy
> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> CONFIG_DRM_DEBUG_MM=3Dy
> # CONFIG_DRM_DEBUG_SELFTEST is not set
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_FBDEV_OVERALLOC=3D100
> CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM=3Dy
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_DP_CEC=3Dy
> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> CONFIG_DRM_KMS_CMA_HELPER=3Dy
> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> CONFIG_DRM_SCHED=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> CONFIG_DRM_KOMEDA=3Dy
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_VGEM is not set
> CONFIG_DRM_VKMS=3Dy
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> CONFIG_DRM_RCAR_DW_HDMI=3Dy
> # CONFIG_DRM_RCAR_LVDS is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> CONFIG_DRM_PANEL_ARM_VERSATILE=3Dy
> CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=3Dy
> CONFIG_DRM_PANEL_BOE_HIMAX8279D=3Dy
> # CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
> CONFIG_DRM_PANEL_DSI_CM=3Dy
> CONFIG_DRM_PANEL_LVDS=3Dy
> CONFIG_DRM_PANEL_SIMPLE=3Dy
> CONFIG_DRM_PANEL_ELIDA_KD35T133=3Dy
> # CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02 is not set
> CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=3Dy
> CONFIG_DRM_PANEL_ILITEK_ILI9881C=3Dy
> # CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
> # CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
> CONFIG_DRM_PANEL_KHADAS_TS050=3Dy
> # CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
> # CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
> # CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
> CONFIG_DRM_PANEL_NOVATEK_NT35510=3Dy
> CONFIG_DRM_PANEL_NOVATEK_NT36672A=3Dy
> CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=3Dy
> CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=3Dy
> # CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
> CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=3Dy
> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=3Dy
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> CONFIG_DRM_PANEL_RAYDIUM_RM67191=3Dy
> # CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
> CONFIG_DRM_PANEL_RONBO_RB070D30=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=3Dy
> CONFIG_DRM_PANEL_SEIKO_43WVF1G=3Dy
> # CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
> CONFIG_DRM_PANEL_SHARP_LS037V7DW01=3Dy
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dy
> # CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
> CONFIG_DRM_PANEL_SITRONIX_ST7703=3Dy
> CONFIG_DRM_PANEL_SONY_ACX424AKP=3Dy
> CONFIG_DRM_PANEL_TDO_TL070WSH30=3Dy
> CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=3Dy
> CONFIG_DRM_PANEL_VISIONOX_RM69299=3Dy
> # CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_CDNS_DSI is not set
> CONFIG_DRM_CHRONTEL_CH7033=3Dy
> CONFIG_DRM_DISPLAY_CONNECTOR=3Dy
> CONFIG_DRM_LONTIUM_LT9611=3Dy
> CONFIG_DRM_LONTIUM_LT9611UXC=3Dy
> CONFIG_DRM_LVDS_CODEC=3Dy
> # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> # CONFIG_DRM_NWL_MIPI_DSI is not set
> CONFIG_DRM_NXP_PTN3460=3Dy
> CONFIG_DRM_PARADE_PS8622=3Dy
> # CONFIG_DRM_PARADE_PS8640 is not set
> CONFIG_DRM_SIL_SII8620=3Dy
> CONFIG_DRM_SII902X=3Dy
> CONFIG_DRM_SII9234=3Dy
> CONFIG_DRM_SIMPLE_BRIDGE=3Dy
> # CONFIG_DRM_THINE_THC63LVD1024 is not set
> CONFIG_DRM_TOSHIBA_TC358762=3Dy
> CONFIG_DRM_TOSHIBA_TC358764=3Dy
> CONFIG_DRM_TOSHIBA_TC358767=3Dy
> # CONFIG_DRM_TOSHIBA_TC358768 is not set
> CONFIG_DRM_TOSHIBA_TC358775=3Dy
> # CONFIG_DRM_TI_TFP410 is not set
> CONFIG_DRM_TI_SN65DSI86=3Dy
> # CONFIG_DRM_TI_TPD12S015 is not set
> CONFIG_DRM_ANALOGIX_ANX6345=3Dy
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> CONFIG_DRM_ANALOGIX_DP=3Dy
> CONFIG_DRM_ANALOGIX_ANX7625=3Dy
> CONFIG_DRM_I2C_ADV7511=3Dy
> # CONFIG_DRM_I2C_ADV7511_AUDIO is not set
> # CONFIG_DRM_I2C_ADV7511_CEC is not set
> # CONFIG_DRM_CDNS_MHDP8546 is not set
> CONFIG_DRM_DW_HDMI=3Dy
> CONFIG_DRM_DW_HDMI_AHB_AUDIO=3Dy
> CONFIG_DRM_DW_HDMI_I2S_AUDIO=3Dy
> CONFIG_DRM_DW_HDMI_CEC=3Dy
> # end of Display Interface Bridges
> =

> CONFIG_DRM_ETNAVIV=3Dy
> # CONFIG_DRM_ETNAVIV_THERMAL is not set
> CONFIG_DRM_ARCPGU=3Dy
> CONFIG_DRM_MXS=3Dy
> CONFIG_DRM_MXSFB=3Dy
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_VBOXVIDEO is not set
> CONFIG_DRM_LEGACY=3Dy
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> CONFIG_FIRMWARE_EDID=3Dy
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> # CONFIG_FB_TILEBLITTING is not set
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> CONFIG_FB_ARC=3Dy
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_UVESA=3Dy
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_GEODE is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_FB_METRONOME=3Dy
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_SIMPLE is not set
> CONFIG_FB_SSD1307=3Dy
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_KTD253=3Dy
> # CONFIG_BACKLIGHT_PWM is not set
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_DA9052=3Dy
> CONFIG_BACKLIGHT_APPLE=3Dy
> CONFIG_BACKLIGHT_QCOM_WLED=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_ADP5520=3Dy
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_88PM860X=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=3Dy
> CONFIG_BACKLIGHT_PANDORA=3Dy
> CONFIG_BACKLIGHT_SKY81452=3Dy
> CONFIG_BACKLIGHT_TPS65217=3Dy
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> CONFIG_BACKLIGHT_BD6107=3Dy
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> # CONFIG_BACKLIGHT_RAVE_SP is not set
> CONFIG_BACKLIGHT_LED=3Dy
> # end of Backlight & LCD device support
> =

> CONFIG_VIDEOMODE_HELPERS=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # end of Graphics support
> =

> CONFIG_SOUND=3Dy
> CONFIG_SND=3Dy
> CONFIG_SND_TIMER=3Dy
> CONFIG_SND_PCM=3Dy
> CONFIG_SND_PCM_ELD=3Dy
> CONFIG_SND_PCM_IEC958=3Dy
> CONFIG_SND_DMAENGINE_PCM=3Dy
> CONFIG_SND_RAWMIDI=3Dy
> CONFIG_SND_COMPRESS_OFFLOAD=3Dy
> CONFIG_SND_JACK=3Dy
> CONFIG_SND_JACK_INPUT_DEV=3Dy
> # CONFIG_SND_OSSEMUL is not set
> CONFIG_SND_PCM_TIMER=3Dy
> # CONFIG_SND_DYNAMIC_MINORS is not set
> CONFIG_SND_SUPPORT_OLD_API=3Dy
> CONFIG_SND_PROC_FS=3Dy
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> # CONFIG_SND_VERBOSE_PRINTK is not set
> # CONFIG_SND_DEBUG is not set
> CONFIG_SND_DMA_SGBUF=3Dy
> # CONFIG_SND_SEQUENCER is not set
> # CONFIG_SND_DRIVERS is not set
> CONFIG_SND_PCI=3Dy
> # CONFIG_SND_AD1889 is not set
> # CONFIG_SND_ALS4000 is not set
> # CONFIG_SND_ASIHPI is not set
> # CONFIG_SND_ATIIXP is not set
> # CONFIG_SND_ATIIXP_MODEM is not set
> # CONFIG_SND_AU8810 is not set
> # CONFIG_SND_AU8820 is not set
> # CONFIG_SND_AU8830 is not set
> # CONFIG_SND_AW2 is not set
> # CONFIG_SND_BT87X is not set
> # CONFIG_SND_CA0106 is not set
> # CONFIG_SND_CMIPCI is not set
> # CONFIG_SND_OXYGEN is not set
> # CONFIG_SND_CS4281 is not set
> # CONFIG_SND_CS46XX is not set
> # CONFIG_SND_CS5530 is not set
> # CONFIG_SND_CS5535AUDIO is not set
> # CONFIG_SND_CTXFI is not set
> # CONFIG_SND_DARLA20 is not set
> # CONFIG_SND_GINA20 is not set
> # CONFIG_SND_LAYLA20 is not set
> # CONFIG_SND_DARLA24 is not set
> # CONFIG_SND_GINA24 is not set
> # CONFIG_SND_LAYLA24 is not set
> # CONFIG_SND_MONA is not set
> # CONFIG_SND_MIA is not set
> # CONFIG_SND_ECHO3G is not set
> # CONFIG_SND_INDIGO is not set
> # CONFIG_SND_INDIGOIO is not set
> # CONFIG_SND_INDIGODJ is not set
> # CONFIG_SND_INDIGOIOX is not set
> # CONFIG_SND_INDIGODJX is not set
> # CONFIG_SND_ENS1370 is not set
> # CONFIG_SND_ENS1371 is not set
> # CONFIG_SND_FM801 is not set
> # CONFIG_SND_HDSP is not set
> # CONFIG_SND_HDSPM is not set
> # CONFIG_SND_ICE1724 is not set
> # CONFIG_SND_INTEL8X0 is not set
> # CONFIG_SND_INTEL8X0M is not set
> # CONFIG_SND_KORG1212 is not set
> # CONFIG_SND_LOLA is not set
> # CONFIG_SND_LX6464ES is not set
> # CONFIG_SND_MIXART is not set
> # CONFIG_SND_NM256 is not set
> # CONFIG_SND_PCXHR is not set
> # CONFIG_SND_RIPTIDE is not set
> # CONFIG_SND_RME32 is not set
> # CONFIG_SND_RME96 is not set
> # CONFIG_SND_RME9652 is not set
> # CONFIG_SND_SE6X is not set
> # CONFIG_SND_VIA82XX is not set
> # CONFIG_SND_VIA82XX_MODEM is not set
> # CONFIG_SND_VIRTUOSO is not set
> # CONFIG_SND_VX222 is not set
> # CONFIG_SND_YMFPCI is not set
> =

> #
> # HD-Audio
> #
> # CONFIG_SND_HDA_INTEL is not set
> # end of HD-Audio
> =

> CONFIG_SND_HDA_PREALLOC_SIZE=3D0
> CONFIG_SND_INTEL_NHLT=3Dy
> CONFIG_SND_INTEL_DSP_CONFIG=3Dy
> CONFIG_SND_INTEL_SOUNDWIRE_ACPI=3Dy
> CONFIG_SND_SOC=3Dy
> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> CONFIG_SND_SOC_COMPRESS=3Dy
> CONFIG_SND_SOC_TOPOLOGY=3Dy
> # CONFIG_SND_SOC_TOPOLOGY_KUNIT_TESTS is not set
> CONFIG_SND_SOC_ACPI=3Dy
> CONFIG_SND_SOC_ADI=3Dy
> # CONFIG_SND_SOC_ADI_AXI_I2S is not set
> CONFIG_SND_SOC_ADI_AXI_SPDIF=3Dy
> CONFIG_SND_SOC_AMD_ACP=3Dy
> # CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH is not set
> CONFIG_SND_SOC_AMD_CZ_RT5645_MACH=3Dy
> # CONFIG_SND_SOC_AMD_ACP3x is not set
> # CONFIG_SND_SOC_AMD_RENOIR is not set
> # CONFIG_SND_ATMEL_SOC is not set
> CONFIG_SND_BCM63XX_I2S_WHISTLER=3Dy
> CONFIG_SND_DESIGNWARE_I2S=3Dy
> CONFIG_SND_DESIGNWARE_PCM=3Dy
> =

> #
> # SoC Audio for Freescale CPUs
> #
> =

> #
> # Common SoC Audio options for Freescale CPUs:
> #
> CONFIG_SND_SOC_FSL_ASRC=3Dy
> CONFIG_SND_SOC_FSL_SAI=3Dy
> # CONFIG_SND_SOC_FSL_MQS is not set
> CONFIG_SND_SOC_FSL_AUDMIX=3Dy
> CONFIG_SND_SOC_FSL_SSI=3Dy
> # CONFIG_SND_SOC_FSL_SPDIF is not set
> CONFIG_SND_SOC_FSL_ESAI=3Dy
> # CONFIG_SND_SOC_FSL_MICFIL is not set
> CONFIG_SND_SOC_FSL_EASRC=3Dy
> # CONFIG_SND_SOC_FSL_XCVR is not set
> CONFIG_SND_SOC_IMX_AUDMUX=3Dy
> # end of SoC Audio for Freescale CPUs
> =

> CONFIG_SND_I2S_HI6210_I2S=3Dy
> CONFIG_SND_SOC_IMG=3Dy
> CONFIG_SND_SOC_IMG_I2S_IN=3Dy
> # CONFIG_SND_SOC_IMG_I2S_OUT is not set
> CONFIG_SND_SOC_IMG_PARALLEL_OUT=3Dy
> CONFIG_SND_SOC_IMG_SPDIF_IN=3Dy
> CONFIG_SND_SOC_IMG_SPDIF_OUT=3Dy
> # CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
> CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=3Dy
> CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=3Dy
> # CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI is not set
> CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=3Dy
> # CONFIG_SND_SOC_INTEL_SKYLAKE is not set
> # CONFIG_SND_SOC_INTEL_SKL is not set
> # CONFIG_SND_SOC_INTEL_APL is not set
> # CONFIG_SND_SOC_INTEL_KBL is not set
> # CONFIG_SND_SOC_INTEL_GLK is not set
> # CONFIG_SND_SOC_INTEL_CNL is not set
> # CONFIG_SND_SOC_INTEL_CFL is not set
> # CONFIG_SND_SOC_INTEL_CML_H is not set
> # CONFIG_SND_SOC_INTEL_CML_LP is not set
> CONFIG_SND_SOC_ACPI_INTEL_MATCH=3Dy
> CONFIG_SND_SOC_INTEL_MACH=3Dy
> # CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES is not set
> # CONFIG_SND_SOC_MTK_BTCVSD is not set
> CONFIG_SND_SOC_SOF_TOPLEVEL=3Dy
> # CONFIG_SND_SOC_SOF_PCI is not set
> CONFIG_SND_SOC_SOF_ACPI=3Dy
> CONFIG_SND_SOC_SOF_ACPI_DEV=3Dy
> # CONFIG_SND_SOC_SOF_OF is not set
> CONFIG_SND_SOC_SOF_DEBUG_PROBES=3Dy
> CONFIG_SND_SOC_SOF_DEVELOPER_SUPPORT=3Dy
> # CONFIG_SND_SOC_SOF_NOCODEC_SUPPORT is not set
> # CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS is not set
> CONFIG_SND_SOC_SOF_DEBUG=3Dy
> # CONFIG_SND_SOC_SOF_DEBUG_XRUN_STOP is not set
> # CONFIG_SND_SOC_SOF_DEBUG_VERBOSE_IPC is not set
> CONFIG_SND_SOC_SOF_DEBUG_FORCE_IPC_POSITION=3Dy
> # CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE is not set
> # CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE is not set
> CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST=3Dy
> # CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT is not set
> CONFIG_SND_SOC_SOF=3Dy
> CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=3Dy
> CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC=3Dy
> CONFIG_SND_SOC_SOF_INTEL_COMMON=3Dy
> # CONFIG_SND_SOC_SOF_BAYTRAIL is not set
> CONFIG_SND_SOC_SOF_BROADWELL=3Dy
> CONFIG_SND_SOC_SOF_XTENSA=3Dy
> =

> #
> # STMicroelectronics STM32 SOC audio support
> #
> # end of STMicroelectronics STM32 SOC audio support
> =

> CONFIG_SND_SOC_XILINX_I2S=3Dy
> # CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
> CONFIG_SND_SOC_XILINX_SPDIF=3Dy
> CONFIG_SND_SOC_XTFPGA_I2S=3Dy
> CONFIG_SND_SOC_I2C_AND_SPI=3Dy
> =

> #
> # CODEC drivers
> #
> # CONFIG_SND_SOC_AC97_CODEC is not set
> CONFIG_SND_SOC_ADAU_UTILS=3Dy
> # CONFIG_SND_SOC_ADAU1372_I2C is not set
> CONFIG_SND_SOC_ADAU1701=3Dy
> CONFIG_SND_SOC_ADAU17X1=3Dy
> CONFIG_SND_SOC_ADAU1761=3Dy
> CONFIG_SND_SOC_ADAU1761_I2C=3Dy
> CONFIG_SND_SOC_ADAU7002=3Dy
> # CONFIG_SND_SOC_ADAU7118_HW is not set
> # CONFIG_SND_SOC_ADAU7118_I2C is not set
> CONFIG_SND_SOC_AK4118=3Dy
> # CONFIG_SND_SOC_AK4458 is not set
> CONFIG_SND_SOC_AK4554=3Dy
> CONFIG_SND_SOC_AK4613=3Dy
> # CONFIG_SND_SOC_AK4642 is not set
> CONFIG_SND_SOC_AK5386=3Dy
> # CONFIG_SND_SOC_AK5558 is not set
> CONFIG_SND_SOC_ALC5623=3Dy
> CONFIG_SND_SOC_BD28623=3Dy
> # CONFIG_SND_SOC_BT_SCO is not set
> CONFIG_SND_SOC_CS35L32=3Dy
> CONFIG_SND_SOC_CS35L33=3Dy
> CONFIG_SND_SOC_CS35L34=3Dy
> CONFIG_SND_SOC_CS35L35=3Dy
> CONFIG_SND_SOC_CS35L36=3Dy
> # CONFIG_SND_SOC_CS42L42 is not set
> # CONFIG_SND_SOC_CS42L51_I2C is not set
> # CONFIG_SND_SOC_CS42L52 is not set
> # CONFIG_SND_SOC_CS42L56 is not set
> # CONFIG_SND_SOC_CS42L73 is not set
> CONFIG_SND_SOC_CS4234=3Dy
> # CONFIG_SND_SOC_CS4265 is not set
> # CONFIG_SND_SOC_CS4270 is not set
> CONFIG_SND_SOC_CS4271=3Dy
> CONFIG_SND_SOC_CS4271_I2C=3Dy
> CONFIG_SND_SOC_CS42XX8=3Dy
> CONFIG_SND_SOC_CS42XX8_I2C=3Dy
> CONFIG_SND_SOC_CS43130=3Dy
> CONFIG_SND_SOC_CS4341=3Dy
> CONFIG_SND_SOC_CS4349=3Dy
> # CONFIG_SND_SOC_CS53L30 is not set
> # CONFIG_SND_SOC_CX2072X is not set
> CONFIG_SND_SOC_DA7213=3Dy
> CONFIG_SND_SOC_DMIC=3Dy
> CONFIG_SND_SOC_HDMI_CODEC=3Dy
> CONFIG_SND_SOC_ES7134=3Dy
> CONFIG_SND_SOC_ES7241=3Dy
> CONFIG_SND_SOC_ES8316=3Dy
> CONFIG_SND_SOC_ES8328=3Dy
> CONFIG_SND_SOC_ES8328_I2C=3Dy
> CONFIG_SND_SOC_GTM601=3Dy
> CONFIG_SND_SOC_INNO_RK3036=3Dy
> # CONFIG_SND_SOC_LOCHNAGAR_SC is not set
> # CONFIG_SND_SOC_MAX98088 is not set
> CONFIG_SND_SOC_MAX98357A=3Dy
> CONFIG_SND_SOC_MAX98504=3Dy
> CONFIG_SND_SOC_MAX9867=3Dy
> CONFIG_SND_SOC_MAX98927=3Dy
> CONFIG_SND_SOC_MAX98373=3Dy
> # CONFIG_SND_SOC_MAX98373_I2C is not set
> CONFIG_SND_SOC_MAX98373_SDW=3Dy
> CONFIG_SND_SOC_MAX98390=3Dy
> CONFIG_SND_SOC_MAX9860=3Dy
> CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dy
> CONFIG_SND_SOC_PCM1681=3Dy
> CONFIG_SND_SOC_PCM1789=3Dy
> CONFIG_SND_SOC_PCM1789_I2C=3Dy
> # CONFIG_SND_SOC_PCM179X_I2C is not set
> # CONFIG_SND_SOC_PCM186X_I2C is not set
> CONFIG_SND_SOC_PCM3060=3Dy
> CONFIG_SND_SOC_PCM3060_I2C=3Dy
> CONFIG_SND_SOC_PCM3168A=3Dy
> CONFIG_SND_SOC_PCM3168A_I2C=3Dy
> CONFIG_SND_SOC_PCM5102A=3Dy
> CONFIG_SND_SOC_PCM512x=3Dy
> CONFIG_SND_SOC_PCM512x_I2C=3Dy
> CONFIG_SND_SOC_RK3328=3Dy
> CONFIG_SND_SOC_RL6231=3Dy
> CONFIG_SND_SOC_RT1308_SDW=3Dy
> CONFIG_SND_SOC_RT5616=3Dy
> CONFIG_SND_SOC_RT5631=3Dy
> CONFIG_SND_SOC_RT5645=3Dy
> CONFIG_SND_SOC_RT5659=3Dy
> # CONFIG_SND_SOC_RT5682_SDW is not set
> CONFIG_SND_SOC_RT700=3Dy
> CONFIG_SND_SOC_RT700_SDW=3Dy
> CONFIG_SND_SOC_RT711=3Dy
> CONFIG_SND_SOC_RT711_SDW=3Dy
> CONFIG_SND_SOC_RT715=3Dy
> CONFIG_SND_SOC_RT715_SDW=3Dy
> CONFIG_SND_SOC_SGTL5000=3Dy
> CONFIG_SND_SOC_SIGMADSP=3Dy
> CONFIG_SND_SOC_SIGMADSP_I2C=3Dy
> CONFIG_SND_SOC_SIGMADSP_REGMAP=3Dy
> # CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
> # CONFIG_SND_SOC_SIMPLE_MUX is not set
> # CONFIG_SND_SOC_SIRF_AUDIO_CODEC is not set
> CONFIG_SND_SOC_SPDIF=3Dy
> CONFIG_SND_SOC_SSM2305=3Dy
> CONFIG_SND_SOC_SSM2602=3Dy
> CONFIG_SND_SOC_SSM2602_I2C=3Dy
> CONFIG_SND_SOC_SSM4567=3Dy
> CONFIG_SND_SOC_STA32X=3Dy
> CONFIG_SND_SOC_STA350=3Dy
> CONFIG_SND_SOC_STI_SAS=3Dy
> CONFIG_SND_SOC_TAS2552=3Dy
> CONFIG_SND_SOC_TAS2562=3Dy
> CONFIG_SND_SOC_TAS2764=3Dy
> CONFIG_SND_SOC_TAS2770=3Dy
> CONFIG_SND_SOC_TAS5086=3Dy
> CONFIG_SND_SOC_TAS571X=3Dy
> CONFIG_SND_SOC_TAS5720=3Dy
> CONFIG_SND_SOC_TAS6424=3Dy
> CONFIG_SND_SOC_TDA7419=3Dy
> CONFIG_SND_SOC_TFA9879=3Dy
> CONFIG_SND_SOC_TLV320AIC23=3Dy
> CONFIG_SND_SOC_TLV320AIC23_I2C=3Dy
> # CONFIG_SND_SOC_TLV320AIC31XX is not set
> # CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
> # CONFIG_SND_SOC_TLV320AIC3X is not set
> CONFIG_SND_SOC_TLV320ADCX140=3Dy
> CONFIG_SND_SOC_TS3A227E=3Dy
> CONFIG_SND_SOC_TSCS42XX=3Dy
> CONFIG_SND_SOC_TSCS454=3Dy
> CONFIG_SND_SOC_UDA1334=3Dy
> # CONFIG_SND_SOC_WCD9335 is not set
> # CONFIG_SND_SOC_WCD934X is not set
> CONFIG_SND_SOC_WM8510=3Dy
> # CONFIG_SND_SOC_WM8523 is not set
> # CONFIG_SND_SOC_WM8524 is not set
> CONFIG_SND_SOC_WM8580=3Dy
> # CONFIG_SND_SOC_WM8711 is not set
> CONFIG_SND_SOC_WM8728=3Dy
> CONFIG_SND_SOC_WM8731=3Dy
> CONFIG_SND_SOC_WM8737=3Dy
> CONFIG_SND_SOC_WM8741=3Dy
> # CONFIG_SND_SOC_WM8750 is not set
> CONFIG_SND_SOC_WM8753=3Dy
> CONFIG_SND_SOC_WM8776=3Dy
> CONFIG_SND_SOC_WM8782=3Dy
> CONFIG_SND_SOC_WM8804=3Dy
> CONFIG_SND_SOC_WM8804_I2C=3Dy
> CONFIG_SND_SOC_WM8903=3Dy
> CONFIG_SND_SOC_WM8904=3Dy
> CONFIG_SND_SOC_WM8960=3Dy
> # CONFIG_SND_SOC_WM8962 is not set
> # CONFIG_SND_SOC_WM8974 is not set
> CONFIG_SND_SOC_WM8978=3Dy
> CONFIG_SND_SOC_WM8985=3Dy
> # CONFIG_SND_SOC_WSA881X is not set
> CONFIG_SND_SOC_ZX_AUD96P22=3Dy
> CONFIG_SND_SOC_MAX9759=3Dy
> CONFIG_SND_SOC_MT6351=3Dy
> CONFIG_SND_SOC_MT6358=3Dy
> CONFIG_SND_SOC_MT6660=3Dy
> # CONFIG_SND_SOC_NAU8315 is not set
> CONFIG_SND_SOC_NAU8540=3Dy
> CONFIG_SND_SOC_NAU8810=3Dy
> CONFIG_SND_SOC_NAU8822=3Dy
> CONFIG_SND_SOC_NAU8824=3Dy
> CONFIG_SND_SOC_TPA6130A2=3Dy
> CONFIG_SND_SOC_LPASS_WSA_MACRO=3Dy
> # CONFIG_SND_SOC_LPASS_VA_MACRO is not set
> # CONFIG_SND_SOC_LPASS_RX_MACRO is not set
> CONFIG_SND_SOC_LPASS_TX_MACRO=3Dy
> # end of CODEC drivers
> =

> CONFIG_SND_SIMPLE_CARD_UTILS=3Dy
> # CONFIG_SND_SIMPLE_CARD is not set
> CONFIG_SND_AUDIO_GRAPH_CARD=3Dy
> CONFIG_SND_X86=3Dy
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> # CONFIG_UHID is not set
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> # CONFIG_HID_PRODIKEYS is not set
> # CONFIG_HID_CMEDIA is not set
> # CONFIG_HID_CYPRESS is not set
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> # CONFIG_HID_GFRM is not set
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_VIVALDI is not set
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> # CONFIG_HID_ITE is not set
> # CONFIG_HID_JABRA is not set
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> # CONFIG_HID_LCPOWER is not set
> # CONFIG_HID_LED is not set
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_REDRAGON is not set
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> # CONFIG_HID_MULTITOUCH is not set
> # CONFIG_HID_NTI is not set
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> # CONFIG_HID_PLAYSTATION is not set
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> # CONFIG_HID_SPEEDLINK is not set
> # CONFIG_HID_STEAM is not set
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> # CONFIG_HID_GREENASIA is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> # CONFIG_HID_THINGM is not set
> # CONFIG_HID_THRUSTMASTER is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_WIIMOTE is not set
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> # end of Special HID drivers
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID_ACPI is not set
> # CONFIG_I2C_HID_OF is not set
> # CONFIG_I2C_HID_OF_GOODIX is not set
> # end of I2C HID support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_LED_TRIG is not set
> CONFIG_USB_ULPI_BUS=3Dy
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> # CONFIG_USB_CDNS_SUPPORT is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> CONFIG_USB_CHIPIDEA=3Dy
> # CONFIG_USB_CHIPIDEA_UDC is not set
> CONFIG_USB_CHIPIDEA_PCI=3Dy
> CONFIG_USB_CHIPIDEA_MSM=3Dy
> CONFIG_USB_CHIPIDEA_IMX=3Dy
> # CONFIG_USB_CHIPIDEA_GENERIC is not set
> CONFIG_USB_CHIPIDEA_TEGRA=3Dy
> CONFIG_USB_ISP1760=3Dy
> CONFIG_USB_ISP1761_UDC=3Dy
> CONFIG_USB_ISP1760_GADGET_ROLE=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_ISP1301 is not set
> # end of USB Physical Layer drivers
> =

> CONFIG_USB_GADGET=3Dy
> # CONFIG_USB_GADGET_DEBUG is not set
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> CONFIG_USB_GADGET_DEBUG_FS=3Dy
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> =

> #
> # USB Peripheral Controller
> #
> CONFIG_USB_FUSB300=3Dy
> CONFIG_USB_FOTG210_UDC=3Dy
> # CONFIG_USB_GR_UDC is not set
> CONFIG_USB_R8A66597=3Dy
> CONFIG_USB_PXA27X=3Dy
> # CONFIG_USB_MV_UDC is not set
> CONFIG_USB_MV_U3D=3Dy
> CONFIG_USB_SNP_CORE=3Dy
> CONFIG_USB_SNP_UDC_PLAT=3Dy
> # CONFIG_USB_M66592 is not set
> # CONFIG_USB_BDC_UDC is not set
> # CONFIG_USB_AMD5536UDC is not set
> CONFIG_USB_NET2272=3Dy
> # CONFIG_USB_NET2272_DMA is not set
> # CONFIG_USB_NET2280 is not set
> # CONFIG_USB_GOKU is not set
> # CONFIG_USB_EG20T is not set
> CONFIG_USB_GADGET_XILINX=3Dy
> # end of USB Peripheral Controller
> =

> CONFIG_USB_LIBCOMPOSITE=3Dy
> CONFIG_USB_U_ETHER=3Dy
> CONFIG_USB_U_AUDIO=3Dy
> CONFIG_USB_F_NCM=3Dy
> CONFIG_USB_F_ECM=3Dy
> CONFIG_USB_F_EEM=3Dy
> CONFIG_USB_F_SUBSET=3Dy
> CONFIG_USB_F_RNDIS=3Dy
> CONFIG_USB_F_FS=3Dy
> CONFIG_USB_F_UAC1=3Dy
> CONFIG_USB_F_UAC1_LEGACY=3Dy
> CONFIG_USB_F_UAC2=3Dy
> CONFIG_USB_F_MIDI=3Dy
> CONFIG_USB_F_HID=3Dy
> CONFIG_USB_F_PRINTER=3Dy
> CONFIG_USB_CONFIGFS=3Dy
> # CONFIG_USB_CONFIGFS_SERIAL is not set
> # CONFIG_USB_CONFIGFS_ACM is not set
> # CONFIG_USB_CONFIGFS_OBEX is not set
> CONFIG_USB_CONFIGFS_NCM=3Dy
> CONFIG_USB_CONFIGFS_ECM=3Dy
> CONFIG_USB_CONFIGFS_ECM_SUBSET=3Dy
> CONFIG_USB_CONFIGFS_RNDIS=3Dy
> CONFIG_USB_CONFIGFS_EEM=3Dy
> # CONFIG_USB_CONFIGFS_PHONET is not set
> # CONFIG_USB_CONFIGFS_F_LB_SS is not set
> CONFIG_USB_CONFIGFS_F_FS=3Dy
> CONFIG_USB_CONFIGFS_F_UAC1=3Dy
> CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=3Dy
> # CONFIG_USB_CONFIGFS_F_UAC2 is not set
> CONFIG_USB_CONFIGFS_F_MIDI=3Dy
> CONFIG_USB_CONFIGFS_F_HID=3Dy
> CONFIG_USB_CONFIGFS_F_PRINTER=3Dy
> =

> #
> # USB Gadget precomposed configurations
> #
> # CONFIG_USB_ZERO is not set
> CONFIG_USB_AUDIO=3Dy
> # CONFIG_GADGET_UAC1 is not set
> CONFIG_USB_ETH=3Dy
> # CONFIG_USB_ETH_RNDIS is not set
> # CONFIG_USB_ETH_EEM is not set
> CONFIG_USB_G_NCM=3Dy
> CONFIG_USB_GADGETFS=3Dy
> CONFIG_USB_FUNCTIONFS=3Dy
> # CONFIG_USB_FUNCTIONFS_ETH is not set
> CONFIG_USB_FUNCTIONFS_RNDIS=3Dy
> # CONFIG_USB_FUNCTIONFS_GENERIC is not set
> # CONFIG_USB_G_SERIAL is not set
> CONFIG_USB_MIDI_GADGET=3Dy
> CONFIG_USB_G_PRINTER=3Dy
> # CONFIG_USB_CDC_COMPOSITE is not set
> # CONFIG_USB_G_HID is not set
> # CONFIG_USB_G_DBGP is not set
> # CONFIG_USB_RAW_GADGET is not set
> # end of USB Gadget precomposed configurations
> =

> CONFIG_TYPEC=3Dy
> # CONFIG_TYPEC_UCSI is not set
> CONFIG_TYPEC_HD3SS3220=3Dy
> # CONFIG_TYPEC_TPS6598X is not set
> # CONFIG_TYPEC_STUSB160X is not set
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> CONFIG_TYPEC_MUX_PI3USB30532=3Dy
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # CONFIG_TYPEC_DP_ALTMODE is not set
> # end of USB Type-C Alternate Mode drivers
> =

> CONFIG_USB_ROLE_SWITCH=3Dy
> CONFIG_USB_ROLES_INTEL_XHCI=3Dy
> CONFIG_MMC=3Dy
> CONFIG_PWRSEQ_EMMC=3Dy
> # CONFIG_PWRSEQ_SIMPLE is not set
> # CONFIG_SDIO_UART is not set
> CONFIG_MMC_TEST=3Dy
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_DEBUG=3Dy
> CONFIG_MMC_SDHCI=3Dy
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> CONFIG_MMC_SDHCI_OF_ARASAN=3Dy
> CONFIG_MMC_SDHCI_OF_ASPEED=3Dy
> CONFIG_MMC_SDHCI_OF_ASPEED_TEST=3Dy
> CONFIG_MMC_SDHCI_OF_AT91=3Dy
> # CONFIG_MMC_SDHCI_OF_DWCMSHC is not set
> # CONFIG_MMC_SDHCI_CADENCE is not set
> CONFIG_MMC_SDHCI_F_SDH30=3Dy
> CONFIG_MMC_SDHCI_MILBEAUT=3Dy
> # CONFIG_MMC_WBSD is not set
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> # CONFIG_MMC_USDHI6ROL0 is not set
> CONFIG_MMC_CQHCI=3Dy
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> # CONFIG_MMC_SDHCI_XENON is not set
> # CONFIG_MMC_SDHCI_OMAP is not set
> CONFIG_MMC_SDHCI_AM654=3Dy
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> CONFIG_LEDS_AN30259A=3Dy
> CONFIG_LEDS_APU=3Dy
> CONFIG_LEDS_AW2013=3Dy
> CONFIG_LEDS_BCM6328=3Dy
> # CONFIG_LEDS_BCM6358 is not set
> CONFIG_LEDS_LM3530=3Dy
> CONFIG_LEDS_LM3532=3Dy
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_LM3692X is not set
> # CONFIG_LEDS_MT6323 is not set
> CONFIG_LEDS_NET48XX=3Dy
> CONFIG_LEDS_WRAP=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP3952=3Dy
> CONFIG_LEDS_LP50XX=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> # CONFIG_LEDS_LP5521 is not set
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=3Dy
> # CONFIG_LEDS_LP8501 is not set
> CONFIG_LEDS_LP8860=3Dy
> # CONFIG_LEDS_CLEVO_MAIL is not set
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> CONFIG_LEDS_PCA963X=3Dy
> CONFIG_LEDS_WM8350=3Dy
> CONFIG_LEDS_DA903X=3Dy
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_PWM=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dy
> # CONFIG_LEDS_INTEL_SS4200 is not set
> CONFIG_LEDS_LT3593=3Dy
> # CONFIG_LEDS_ADP5520 is not set
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dy
> # CONFIG_LEDS_MAX77650 is not set
> # CONFIG_LEDS_MAX8997 is not set
> CONFIG_LEDS_LM355x=3Dy
> CONFIG_LEDS_OT200=3Dy
> CONFIG_LEDS_MENF21BMC=3Dy
> CONFIG_LEDS_IS31FL319X=3Dy
> # CONFIG_LEDS_IS31FL32XX is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> CONFIG_LEDS_SYSCON=3Dy
> # CONFIG_LEDS_MLXCPLD is not set
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=3Dy
> # CONFIG_LEDS_NIC78BX is not set
> CONFIG_LEDS_TI_LMU_COMMON=3Dy
> # CONFIG_LEDS_LM3697 is not set
> CONFIG_LEDS_LM36274=3Dy
> =

> #
> # Flash and Torch LED drivers
> #
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> CONFIG_LEDS_TRIGGER_CPU=3Dy
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> # CONFIG_LEDS_TRIGGER_PATTERN is not set
> # CONFIG_LEDS_TRIGGER_AUDIO is not set
> # CONFIG_LEDS_TRIGGER_TTY is not set
> =

> #
> # LED Blink
> #
> # CONFIG_LEDS_BLINK is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> # CONFIG_EDAC_AMD76X is not set
> # CONFIG_EDAC_E7XXX is not set
> # CONFIG_EDAC_E752X is not set
> # CONFIG_EDAC_I82875P is not set
> # CONFIG_EDAC_I82975X is not set
> # CONFIG_EDAC_I3000 is not set
> # CONFIG_EDAC_I3200 is not set
> # CONFIG_EDAC_IE31200 is not set
> # CONFIG_EDAC_X38 is not set
> # CONFIG_EDAC_I5400 is not set
> # CONFIG_EDAC_I82860 is not set
> # CONFIG_EDAC_R82600 is not set
> # CONFIG_EDAC_I5000 is not set
> # CONFIG_EDAC_I5100 is not set
> # CONFIG_EDAC_I7300 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> CONFIG_DMABUF_DEBUG=3Dy
> # CONFIG_DMABUF_SELFTESTS is not set
> CONFIG_DMABUF_HEAPS=3Dy
> CONFIG_DMABUF_HEAPS_SYSTEM=3Dy
> # CONFIG_DMABUF_HEAPS_CMA is not set
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_HD44780_COMMON=3Dy
> CONFIG_HD44780=3Dy
> CONFIG_IMG_ASCII_LCD=3Dy
> # CONFIG_HT16K33 is not set
> # CONFIG_LCD2S is not set
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_CHARLCD_BL_OFF is not set
> CONFIG_CHARLCD_BL_ON=3Dy
> # CONFIG_CHARLCD_BL_FLASH is not set
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dy
> # CONFIG_UIO_MF624 is not set
> CONFIG_VIRT_DRIVERS=3Dy
> # CONFIG_VBOXGUEST is not set
> # CONFIG_NITRO_ENCLAVES is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_VDPA=3Dy
> CONFIG_VIRTIO_BALLOON=3Dy
> # CONFIG_VIRTIO_INPUT is not set
> CONFIG_VIRTIO_MMIO=3Dy
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> CONFIG_VDPA=3Dy
> CONFIG_VDPA_SIM=3Dy
> # CONFIG_VDPA_SIM_NET is not set
> CONFIG_VHOST_IOTLB=3Dy
> CONFIG_VHOST_RING=3Dy
> # CONFIG_VHOST_MENU is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> CONFIG_GREYBUS=3Dy
> # CONFIG_STAGING is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_LAPTOP=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> # CONFIG_CHROMEOS_TBMC is not set
> # CONFIG_CROS_EC is not set
> CONFIG_CROS_KBD_LED_BACKLIGHT=3Dy
> CONFIG_MELLANOX_PLATFORM=3Dy
> # CONFIG_MLXREG_HOTPLUG is not set
> CONFIG_MLXREG_IO=3Dy
> CONFIG_OLPC_EC=3Dy
> # CONFIG_SURFACE_PLATFORMS is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> CONFIG_COMMON_CLK_MAX77686=3Dy
> CONFIG_COMMON_CLK_MAX9485=3Dy
> # CONFIG_COMMON_CLK_RK808 is not set
> CONFIG_COMMON_CLK_SI5341=3Dy
> CONFIG_COMMON_CLK_SI5351=3Dy
> CONFIG_COMMON_CLK_SI514=3Dy
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_SI570 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> CONFIG_COMMON_CLK_CDCE925=3Dy
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_COMMON_CLK_AXI_CLKGEN=3Dy
> CONFIG_COMMON_CLK_LOCHNAGAR=3Dy
> CONFIG_COMMON_CLK_PALMAS=3Dy
> CONFIG_COMMON_CLK_PWM=3Dy
> # CONFIG_COMMON_CLK_VC5 is not set
> CONFIG_COMMON_CLK_BD718XX=3Dy
> CONFIG_COMMON_CLK_FIXED_MMIO=3Dy
> CONFIG_CLK_LGM_CGU=3Dy
> CONFIG_XILINX_VCU=3Dy
> # CONFIG_HWSPINLOCK is not set
> =

> #
> # Clock Source drivers
> #
> CONFIG_TIMER_OF=3Dy
> CONFIG_TIMER_PROBE=3Dy
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> CONFIG_CLKSRC_MMIO=3Dy
> CONFIG_MICROCHIP_PIT64B=3Dy
> # end of Clock Source drivers
> =

> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> # CONFIG_RPMSG_CHAR is not set
> CONFIG_RPMSG_NS=3Dy
> CONFIG_RPMSG_VIRTIO=3Dy
> # end of Rpmsg drivers
> =

> CONFIG_SOUNDWIRE=3Dy
> =

> #
> # SoundWire Devices
> #
> # CONFIG_SOUNDWIRE_INTEL is not set
> CONFIG_SOUNDWIRE_QCOM=3Dy
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Enable LiteX SoC Builder specific drivers
> #
> CONFIG_LITEX=3Dy
> CONFIG_LITEX_SOC_CONTROLLER=3Dy
> CONFIG_LITEX_SUBREG_SIZE=3D4
> # end of Enable LiteX SoC Builder specific drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> # CONFIG_EXTCON_ARIZONA is not set
> # CONFIG_EXTCON_FSA9480 is not set
> # CONFIG_EXTCON_GPIO is not set
> CONFIG_EXTCON_INTEL_INT3496=3Dy
> CONFIG_EXTCON_MAX3355=3Dy
> # CONFIG_EXTCON_MAX77693 is not set
> CONFIG_EXTCON_MAX77843=3Dy
> # CONFIG_EXTCON_MAX8997 is not set
> CONFIG_EXTCON_PALMAS=3Dy
> CONFIG_EXTCON_PTN5150=3Dy
> # CONFIG_EXTCON_RT8973A is not set
> CONFIG_EXTCON_SM5502=3Dy
> # CONFIG_EXTCON_USB_GPIO is not set
> CONFIG_EXTCON_USBC_TUSB320=3Dy
> CONFIG_MEMORY=3Dy
> # CONFIG_FPGA_DFL_EMIF is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_BUFFER_DMA=3Dy
> CONFIG_IIO_BUFFER_DMAENGINE=3Dy
> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> # CONFIG_IIO_SW_DEVICE is not set
> CONFIG_IIO_SW_TRIGGER=3Dy
> CONFIG_IIO_TRIGGERED_EVENT=3Dy
> =

> #
> # Accelerometers
> #
> CONFIG_ADXL345=3Dy
> CONFIG_ADXL345_I2C=3Dy
> # CONFIG_ADXL372_I2C is not set
> CONFIG_BMA180=3Dy
> CONFIG_BMA400=3Dy
> CONFIG_BMA400_I2C=3Dy
> CONFIG_BMC150_ACCEL=3Dy
> CONFIG_BMC150_ACCEL_I2C=3Dy
> CONFIG_DA280=3Dy
> CONFIG_DA311=3Dy
> CONFIG_DMARD06=3Dy
> CONFIG_DMARD09=3Dy
> # CONFIG_DMARD10 is not set
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
> # CONFIG_KXSD9 is not set
> # CONFIG_KXCJK1013 is not set
> CONFIG_MC3230=3Dy
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7660=3Dy
> CONFIG_MMA8452=3Dy
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> CONFIG_MMA9553=3Dy
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=3Dy
> CONFIG_STK8312=3Dy
> CONFIG_STK8BA50=3Dy
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD7091R5=3Dy
> CONFIG_AD7291=3Dy
> CONFIG_AD7606=3Dy
> CONFIG_AD7606_IFACE_PARALLEL=3Dy
> # CONFIG_AD799X is not set
> CONFIG_ADI_AXI_ADC=3Dy
> # CONFIG_CC10001_ADC is not set
> CONFIG_DA9150_GPADC=3Dy
> CONFIG_ENVELOPE_DETECTOR=3Dy
> # CONFIG_HX711 is not set
> CONFIG_INA2XX_ADC=3Dy
> # CONFIG_LTC2471 is not set
> CONFIG_LTC2485=3Dy
> CONFIG_LTC2497=3Dy
> # CONFIG_MAX1363 is not set
> # CONFIG_MAX9611 is not set
> CONFIG_MCP3422=3Dy
> CONFIG_MEN_Z188_ADC=3Dy
> # CONFIG_MP2629_ADC is not set
> # CONFIG_NAU7802 is not set
> CONFIG_PALMAS_GPADC=3Dy
> # CONFIG_SD_ADC_MODULATOR is not set
> # CONFIG_STMPE_ADC is not set
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_ADS1015=3Dy
> # CONFIG_TI_AM335X_ADC is not set
> CONFIG_TWL4030_MADC=3Dy
> # CONFIG_TWL6030_GPADC is not set
> CONFIG_VF610_ADC=3Dy
> CONFIG_XILINX_XADC=3Dy
> # end of Analog to digital converters
> =

> #
> # Analog Front Ends
> #
> CONFIG_IIO_RESCALE=3Dy
> # end of Analog Front Ends
> =

> #
> # Amplifiers
> #
> CONFIG_HMC425=3Dy
> # end of Amplifiers
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dy
> CONFIG_ATLAS_EZO_SENSOR=3Dy
> CONFIG_BME680=3Dy
> CONFIG_BME680_I2C=3Dy
> # CONFIG_CCS811 is not set
> CONFIG_IAQCORE=3Dy
> CONFIG_PMS7003=3Dy
> # CONFIG_SCD30_CORE is not set
> CONFIG_SENSIRION_SGP30=3Dy
> # CONFIG_SPS30 is not set
> CONFIG_VZ89X=3Dy
> # end of Chemical Sensors
> =

> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
> =

> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # SSP Sensor Common
> #
> # end of SSP Sensor Common
> =

> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> # CONFIG_AD5064 is not set
> CONFIG_AD5380=3Dy
> CONFIG_AD5446=3Dy
> CONFIG_AD5592R_BASE=3Dy
> CONFIG_AD5593R=3Dy
> CONFIG_AD5686=3Dy
> CONFIG_AD5696_I2C=3Dy
> # CONFIG_CIO_DAC is not set
> CONFIG_DPOT_DAC=3Dy
> CONFIG_DS4424=3Dy
> CONFIG_M62332=3Dy
> # CONFIG_MAX517 is not set
> CONFIG_MAX5821=3Dy
> CONFIG_MCP4725=3Dy
> CONFIG_TI_DAC5571=3Dy
> CONFIG_VF610_DAC=3Dy
> # end of Digital to analog converters
> =

> #
> # IIO dummy driver
> #
> # end of IIO dummy driver
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> # end of Clock Generator/Distribution
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_BMG160=3Dy
> CONFIG_BMG160_I2C=3Dy
> CONFIG_FXAS21002C=3Dy
> CONFIG_FXAS21002C_I2C=3Dy
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> # end of Digital gyroscope sensors
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> # CONFIG_AFE4404 is not set
> CONFIG_MAX30100=3Dy
> CONFIG_MAX30102=3Dy
> # end of Heart Rate Monitors
> # end of Health Sensors
> =

> #
> # Humidity sensors
> #
> CONFIG_AM2315=3Dy
> CONFIG_DHT11=3Dy
> CONFIG_HDC100X=3Dy
> # CONFIG_HDC2010 is not set
> CONFIG_HTS221=3Dy
> CONFIG_HTS221_I2C=3Dy
> CONFIG_HTU21=3Dy
> # CONFIG_SI7005 is not set
> CONFIG_SI7020=3Dy
> # end of Humidity sensors
> =

> #
> # Inertial measurement units
> #
> # CONFIG_BMI160_I2C is not set
> CONFIG_FXOS8700=3Dy
> CONFIG_FXOS8700_I2C=3Dy
> # CONFIG_KMX61 is not set
> CONFIG_INV_ICM42600=3Dy
> CONFIG_INV_ICM42600_I2C=3Dy
> # CONFIG_INV_MPU6050_I2C is not set
> CONFIG_IIO_ST_LSM6DSX=3Dy
> CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
> # end of Inertial measurement units
> =

> #
> # Light sensors
> #
> CONFIG_ACPI_ALS=3Dy
> CONFIG_ADJD_S311=3Dy
> CONFIG_ADUX1020=3Dy
> CONFIG_AL3010=3Dy
> # CONFIG_AL3320A is not set
> CONFIG_APDS9300=3Dy
> CONFIG_APDS9960=3Dy
> CONFIG_AS73211=3Dy
> CONFIG_BH1750=3Dy
> # CONFIG_BH1780 is not set
> CONFIG_CM32181=3Dy
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=3Dy
> CONFIG_CM3605=3Dy
> CONFIG_CM36651=3Dy
> CONFIG_GP2AP002=3Dy
> CONFIG_GP2AP020A00F=3Dy
> CONFIG_IQS621_ALS=3Dy
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=3Dy
> # CONFIG_ISL29125 is not set
> CONFIG_JSA1212=3Dy
> CONFIG_RPR0521=3Dy
> # CONFIG_LTR501 is not set
> # CONFIG_LV0104CS is not set
> CONFIG_MAX44000=3Dy
> CONFIG_MAX44009=3Dy
> CONFIG_NOA1305=3Dy
> CONFIG_OPT3001=3Dy
> CONFIG_PA12203001=3Dy
> CONFIG_SI1133=3Dy
> CONFIG_SI1145=3Dy
> CONFIG_STK3310=3Dy
> CONFIG_ST_UVIS25=3Dy
> CONFIG_ST_UVIS25_I2C=3Dy
> CONFIG_TCS3414=3Dy
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> # CONFIG_TSL2583 is not set
> CONFIG_TSL2772=3Dy
> CONFIG_TSL4531=3Dy
> CONFIG_US5182D=3Dy
> # CONFIG_VCNL4000 is not set
> # CONFIG_VCNL4035 is not set
> # CONFIG_VEML6030 is not set
> CONFIG_VEML6070=3Dy
> CONFIG_VL6180=3Dy
> CONFIG_ZOPT2201=3Dy
> # end of Light sensors
> =

> #
> # Magnetometer sensors
> #
> # CONFIG_AK8974 is not set
> CONFIG_AK8975=3Dy
> CONFIG_AK09911=3Dy
> CONFIG_BMC150_MAGN=3Dy
> CONFIG_BMC150_MAGN_I2C=3Dy
> CONFIG_MAG3110=3Dy
> CONFIG_MMC35240=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> CONFIG_SENSORS_RM3100=3Dy
> CONFIG_SENSORS_RM3100_I2C=3Dy
> CONFIG_YAMAHA_YAS530=3Dy
> # end of Magnetometer sensors
> =

> #
> # Multiplexers
> #
> CONFIG_IIO_MUX=3Dy
> # end of Multiplexers
> =

> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> # CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> # end of Triggers - standalone
> =

> #
> # Linear and angular position sensors
> #
> CONFIG_IQS624_POS=3Dy
> # end of Linear and angular position sensors
> =

> #
> # Digital potentiometers
> #
> CONFIG_AD5272=3Dy
> CONFIG_DS1803=3Dy
> CONFIG_MAX5432=3Dy
> # CONFIG_MCP4018 is not set
> # CONFIG_MCP4531 is not set
> CONFIG_TPL0102=3Dy
> # end of Digital potentiometers
> =

> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=3Dy
> # end of Digital potentiostats
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dy
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> CONFIG_DLHL60D=3Dy
> CONFIG_DPS310=3Dy
> # CONFIG_HP03 is not set
> # CONFIG_ICP10100 is not set
> CONFIG_MPL115=3Dy
> CONFIG_MPL115_I2C=3Dy
> CONFIG_MPL3115=3Dy
> # CONFIG_MS5611 is not set
> # CONFIG_MS5637 is not set
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> # CONFIG_T5403 is not set
> CONFIG_HP206C=3Dy
> CONFIG_ZPA2326=3Dy
> CONFIG_ZPA2326_I2C=3Dy
> # end of Pressure sensors
> =

> #
> # Lightning sensors
> #
> # end of Lightning sensors
> =

> #
> # Proximity and distance sensors
> #
> # CONFIG_ISL29501 is not set
> CONFIG_LIDAR_LITE_V2=3Dy
> CONFIG_MB1232=3Dy
> CONFIG_PING=3Dy
> CONFIG_RFD77402=3Dy
> # CONFIG_SRF04 is not set
> CONFIG_SX9310=3Dy
> # CONFIG_SX9500 is not set
> # CONFIG_SRF08 is not set
> CONFIG_VCNL3020=3Dy
> # CONFIG_VL53L0X_I2C is not set
> # end of Proximity and distance sensors
> =

> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> =

> #
> # Temperature sensors
> #
> CONFIG_IQS620AT_TEMP=3Dy
> CONFIG_MLX90614=3Dy
> CONFIG_MLX90632=3Dy
> # CONFIG_TMP006 is not set
> CONFIG_TMP007=3Dy
> CONFIG_TSYS01=3Dy
> CONFIG_TSYS02D=3Dy
> # end of Temperature sensors
> =

> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_DEBUG=3Dy
> CONFIG_PWM_ATMEL_HLCDC_PWM=3Dy
> CONFIG_PWM_ATMEL_TCB=3Dy
> # CONFIG_PWM_DWC is not set
> CONFIG_PWM_FSL_FTM=3Dy
> # CONFIG_PWM_INTEL_LGM is not set
> CONFIG_PWM_IQS620A=3Dy
> CONFIG_PWM_LP3943=3Dy
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dy
> # CONFIG_PWM_STMPE is not set
> CONFIG_PWM_TWL=3Dy
> CONFIG_PWM_TWL_LED=3Dy
> =

> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=3Dy
> # CONFIG_AL_FIC is not set
> CONFIG_MADERA_IRQ=3Dy
> # end of IRQ chip support
> =

> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_BRCMSTB_RESCAL=3Dy
> # CONFIG_RESET_INTEL_GW is not set
> CONFIG_RESET_TI_SYSCON=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> CONFIG_USB_LGM_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> CONFIG_PHY_CADENCE_TORRENT=3Dy
> # CONFIG_PHY_CADENCE_DPHY is not set
> CONFIG_PHY_CADENCE_SIERRA=3Dy
> CONFIG_PHY_CADENCE_SALVO=3Dy
> CONFIG_PHY_FSL_IMX8MQ_USB=3Dy
> CONFIG_PHY_MIXEL_MIPI_DPHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> CONFIG_PHY_CPCAP_USB=3Dy
> CONFIG_PHY_MAPPHONE_MDM6600=3Dy
> CONFIG_PHY_OCELOT_SERDES=3Dy
> CONFIG_PHY_QCOM_USB_HS=3Dy
> CONFIG_PHY_QCOM_USB_HSIC=3Dy
> CONFIG_PHY_TUSB1210=3Dy
> # CONFIG_PHY_INTEL_LGM_COMBO is not set
> CONFIG_PHY_INTEL_LGM_EMMC=3Dy
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> # CONFIG_INTEL_RAPL is not set
> CONFIG_IDLE_INJECT=3Dy
> # CONFIG_DTPM is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> CONFIG_MCB_LPC=3Dy
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> # CONFIG_ANDROID_BINDER_IPC is not set
> # end of Android
> =

> CONFIG_DAX=3Dy
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> CONFIG_RAVE_SP_EEPROM=3Dy
> CONFIG_NVMEM_RMEM=3Dy
> =

> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> # CONFIG_INTEL_TH is not set
> # end of HW tracing support
> =

> CONFIG_FPGA=3Dy
> CONFIG_ALTERA_PR_IP_CORE=3Dy
> CONFIG_ALTERA_PR_IP_CORE_PLAT=3Dy
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_BRIDGE=3Dy
> # CONFIG_ALTERA_FREEZE_BRIDGE is not set
> CONFIG_XILINX_PR_DECOUPLER=3Dy
> CONFIG_FPGA_REGION=3Dy
> CONFIG_OF_FPGA_REGION=3Dy
> CONFIG_FPGA_DFL=3Dy
> # CONFIG_FPGA_DFL_FME is not set
> CONFIG_FPGA_DFL_AFU=3Dy
> # CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
> # CONFIG_FPGA_DFL_PCI is not set
> CONFIG_FSI=3Dy
> CONFIG_FSI_NEW_DEV_NODE=3Dy
> CONFIG_FSI_MASTER_GPIO=3Dy
> # CONFIG_FSI_MASTER_HUB is not set
> # CONFIG_FSI_MASTER_ASPEED is not set
> CONFIG_FSI_SCOM=3Dy
> CONFIG_FSI_SBEFIFO=3Dy
> # CONFIG_FSI_OCC is not set
> CONFIG_MULTIPLEXER=3Dy
> =

> #
> # Multiplexer drivers
> #
> # CONFIG_MUX_ADG792A is not set
> CONFIG_MUX_GPIO=3Dy
> CONFIG_MUX_MMIO=3Dy
> # end of Multiplexer drivers
> =

> CONFIG_SIOX=3Dy
> CONFIG_SIOX_BUS_GPIO=3Dy
> CONFIG_SLIMBUS=3Dy
> CONFIG_SLIM_QCOM_CTRL=3Dy
> CONFIG_INTERCONNECT=3Dy
> CONFIG_COUNTER=3Dy
> CONFIG_FTM_QUADDEC=3Dy
> CONFIG_MICROCHIP_TCB_CAPTURE=3Dy
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_VALIDATE_FS_PARSER=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> # CONFIG_FS_ENCRYPTION is not set
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> # CONFIG_AUTOFS4_FS is not set
> # CONFIG_AUTOFS_FS is not set
> # CONFIG_FUSE_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> CONFIG_OVERLAY_FS_INDEX=3Dy
> CONFIG_OVERLAY_FS_NFS_EXPORT=3Dy
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> # end of Caches
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> CONFIG_JFFS2_SUMMARY=3Dy
> CONFIG_JFFS2_FS_XATTR=3Dy
> CONFIG_JFFS2_FS_POSIX_ACL=3Dy
> # CONFIG_JFFS2_FS_SECURITY is not set
> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> # CONFIG_JFFS2_ZLIB is not set
> # CONFIG_JFFS2_LZO is not set
> # CONFIG_JFFS2_RTIME is not set
> # CONFIG_JFFS2_RUBIN is not set
> # CONFIG_JFFS2_CMODE_NONE is not set
> # CONFIG_JFFS2_CMODE_PRIORITY is not set
> # CONFIG_JFFS2_CMODE_SIZE is not set
> CONFIG_JFFS2_CMODE_FAVOURLZO=3Dy
> # CONFIG_UBIFS_FS is not set
> CONFIG_CRAMFS=3Dy
> CONFIG_CRAMFS_MTD=3Dy
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> CONFIG_PSTORE_LZO_COMPRESS=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_RAM=3Dy
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=3Dy
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=3Dy
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dy
> # CONFIG_NLS_CODEPAGE_865 is not set
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> CONFIG_NLS_ISO8859_8=3Dy
> # CONFIG_NLS_CODEPAGE_1250 is not set
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> # CONFIG_NLS_ISO8859_1 is not set
> # CONFIG_NLS_ISO8859_2 is not set
> CONFIG_NLS_ISO8859_3=3Dy
> # CONFIG_NLS_ISO8859_4 is not set
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> # CONFIG_NLS_ISO8859_15 is not set
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dy
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_DLM is not set
> # CONFIG_UNICODE is not set
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_TRUSTED_KEYS=3Dy
> # CONFIG_ENCRYPTED_KEYS is not set
> CONFIG_KEY_DH_OPERATIONS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> # CONFIG_SECURITY is not set
> # CONFIG_SECURITYFS is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
> CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy
> # CONFIG_FORTIFY_SOURCE is not set
> CONFIG_STATIC_USERMODEHELPER=3Dy
> CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_TEST=3Dy
> CONFIG_CRYPTO_SIMD=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_ECRDSA=3Dy
> CONFIG_CRYPTO_SM2=3Dy
> # CONFIG_CRYPTO_CURVE25519 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_AEGIS128=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> # CONFIG_CRYPTO_LRW is not set
> CONFIG_CRYPTO_OFB=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> CONFIG_CRYPTO_NHPOLY1305=3Dy
> CONFIG_CRYPTO_ADIANTUM=3Dy
> # CONFIG_CRYPTO_ESSIV is not set
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> CONFIG_CRYPTO_CRC32=3Dy
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_XXHASH=3Dy
> # CONFIG_CRYPTO_BLAKE2B is not set
> CONFIG_CRYPTO_BLAKE2S=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> # CONFIG_CRYPTO_SHA512 is not set
> CONFIG_CRYPTO_SHA3=3Dy
> CONFIG_CRYPTO_SM3=3Dy
> CONFIG_CRYPTO_STREEBOG=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> # CONFIG_CRYPTO_CAST5 is not set
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> CONFIG_CRYPTO_SM4=3Dy
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> # CONFIG_CRYPTO_TWOFISH_586 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dy
> # CONFIG_CRYPTO_ZSTD is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> CONFIG_CRYPTO_USER_API_RNG_CAVP=3Dy
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_ARC4=3Dy
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_BLAKE2S=3Dy
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CHACHA=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519=3Dy
> CONFIG_CRYPTO_LIB_DES=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_POLY1305=3Dy
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> CONFIG_TPM_KEY_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> CONFIG_PKCS7_TEST_KEY=3Dy
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_LINEAR_RANGES=3Dy
> CONFIG_PACKING=3Dy
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_CORDIC=3Dy
> # CONFIG_PRIME_NUMBERS is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=3Dy
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=3Dy
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> # CONFIG_XZ_DEC_ARM is not set
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_TEXTSEARCH=3Dy
> CONFIG_TEXTSEARCH_KMP=3Dy
> CONFIG_TEXTSEARCH_BM=3Dy
> CONFIG_TEXTSEARCH_FSM=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_DMA_DECLARE_COHERENT=3Dy
> CONFIG_DMA_CMA=3Dy
> # CONFIG_DMA_PERNUMA_CMA is not set
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D0
> CONFIG_CMA_SIZE_PERCENTAGE=3D0
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> CONFIG_CMA_SIZE_SEL_MIN=3Dy
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=3D8
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_LIBFDT=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_32=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_STACK_HASH_ORDER=3D20
> CONFIG_STRING_SELFTEST=3Dy
> # end of Library routines
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> # CONFIG_DYNAMIC_DEBUG_CORE is not set
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=3D8192
> CONFIG_STRIP_ASM_SYMS=3Dy
> CONFIG_READABLE_ASM=3Dy
> CONFIG_HEADERS_INSTALL=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_32B=3Dy
> CONFIG_FRAME_POINTER=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_DEBUG_PAGE_REF=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_DEBUG_KMAP_LOCAL=3Dy
> CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=3Dy
> CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=3Dy
> # CONFIG_DEBUG_HIGHMEM is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> CONFIG_KFENCE=3Dy
> CONFIG_KFENCE_SAMPLE_INTERVAL=3D100
> CONFIG_KFENCE_NUM_OBJECTS=3D255
> CONFIG_KFENCE_STRESS_TEST_FAULTS=3D0
> CONFIG_KFENCE_KUNIT_TEST=3Dm
> # end of Memory Debugging
> =

> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> # CONFIG_DEBUG_PREEMPT is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dm
> CONFIG_WW_MUTEX_SELFTEST=3Dy
> # CONFIG_SCF_TORTURE_TEST is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> CONFIG_DEBUG_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> =

> #
> # Debug kernel data structures
> #
> # CONFIG_DEBUG_LIST is not set
> # CONFIG_DEBUG_PLIST is not set
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # end of Debug kernel data structures
> =

> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_LIST is not set
> CONFIG_TORTURE_TEST=3Dm
> CONFIG_RCU_SCALE_TEST=3Dm
> CONFIG_RCU_TORTURE_TEST=3Dm
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_EQS_DEBUG=3Dy
> CONFIG_RCU_STRICT_GRACE_PERIOD=3Dy
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_SAMPLES is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> # CONFIG_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=3Dy
> CONFIG_KUNIT_DEBUGFS=3Dy
> CONFIG_KUNIT_TEST=3Dy
> CONFIG_KUNIT_EXAMPLE_TEST=3Dy
> # CONFIG_KUNIT_ALL_TESTS is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_STRSCPY is not set
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=3Dy
> CONFIG_TEST_BITMAP=3Dy
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> # CONFIG_TEST_VMALLOC is not set
> # CONFIG_TEST_USER_COPY is not set
> # CONFIG_TEST_BPF is not set
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> CONFIG_BITFIELD_KUNIT=3Dy
> CONFIG_RESOURCE_KUNIT_TEST=3Dy
> CONFIG_SYSCTL_KUNIT_TEST=3Dy
> CONFIG_LIST_KUNIT_TEST=3Dy
> CONFIG_LINEAR_RANGES_TEST=3Dy
> CONFIG_CMDLINE_KUNIT_TEST=3Dy
> # CONFIG_BITS_TEST is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_MEMCAT_P is not set
> CONFIG_TEST_STACKINIT=3Dy
> # CONFIG_TEST_MEMINIT is not set
> CONFIG_TEST_FREE_PAGES=3Dy
> CONFIG_TEST_FPU=3Dy
> CONFIG_MEMTEST=3Dy
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'trinity'
> 	export testcase=3D'trinity'
> 	export category=3D'functional'
> 	export need_memory=3D'300MB'
> 	export job_origin=3D'trinity.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit
> queue_at_least_once'
> 	export queue=3D'validate'
> 	export testbox=3D'vm-snb-i386-140'
> 	export tbox_group=3D'vm-snb-i386'
> 	export branch=3D'linux-next/master'
> 	export commit=3D'7308e0240410d3644c9d7cc6263079a58e3effeb'
> 	export kconfig=3D'i386-randconfig-r032-20210331'
> 	export repeat_to=3D64
> 	export nr_vm=3D160
> 	export submit_id=3D'606ba55ce8b182181a0bfdbc'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-i386-140/trinity-group-04-=
quantal-i386-core-20190426.cgz-7308e0240410d3644c9d7cc6263079a58e3effeb-202=
10406-6170-ro89zc-24.yaml'
> 	export id=3D'8fe404f5f95af1b4cf91e3b6124a26a9f09f56cb'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-i386 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'16G'
> 	export need_kconfig=3D'CONFIG_KVM_GUEST=3Dy'
> 	export ssh_base_port=3D23400
> 	export kernel_cmdline=3D'vmalloc=3D512M'
> 	export rootfs=3D'quantal-i386-core-20190426.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2021-04-06 08:03:41 +0800'
> 	export _id=3D'606ba55ce8b182181a0bfdbc'
> 	export _rt=3D'/result/trinity/group-04/vm-snb-i386/quantal-i386-core-201=
90426.cgz/i386-randconfig-r032-20210331/gcc-9/7308e0240410d3644c9d7cc626307=
9a58e3effeb'
> 	export user=3D'lkp'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export result_root=3D'/result/trinity/group-04/vm-snb-i386/quantal-i386-=
core-20190426.cgz/i386-randconfig-r032-20210331/gcc-9/7308e0240410d3644c9d7=
cc6263079a58e3effeb/50'
> 	export scheduler_version=3D'/lkp/lkp/src'
> 	export arch=3D'i386'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/quantal/quantal-i386-core-20190426.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/vm-snb-i386-140/trinity-group-04-quantal-i386-c=
ore-20190426.cgz-7308e0240410d3644c9d7cc6263079a58e3effeb-20210406-6170-ro8=
9zc-24.yaml
> ARCH=3Di386
> kconfig=3Di386-randconfig-r032-20210331
> branch=3Dlinux-next/master
> commit=3D7308e0240410d3644c9d7cc6263079a58e3effeb
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-r032-20210331/gcc-9/7308e0240410d=
3644c9d7cc6263079a58e3effeb/vmlinuz-5.12.0-rc2-00004-g7308e0240410
> vmalloc=3D512M
> max_uptime=3D2100
> RESULT_ROOT=3D/result/trinity/group-04/vm-snb-i386/quantal-i386-core-2019=
0426.cgz/i386-randconfig-r032-20210331/gcc-9/7308e0240410d3644c9d7cc6263079=
a58e3effeb/50
> LKP_SERVER=3Dinternal-lkp-server
> selinux=3D0
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0
> printk.devkmsg=3Don
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> drbd.minor_count=3D8
> systemd.log_level=3Derr
> ignore_loglevel
> console=3Dtty0
> earlyprintk=3DttyS0,115200
> console=3DttyS0,115200
> vga=3Dnormal
> rw'
> 	export modules_initrd=3D'/pkg/linux/i386-randconfig-r032-20210331/gcc-9/=
7308e0240410d3644c9d7cc6263079a58e3effeb/modules.cgz'
> 	export bm_initrd=3D'/osimage/pkg/quantal-i386-core.cgz/trinity-static-i3=
86-x86_64-f93256fb_2019-08-28.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> 	export site=3D'15633b8e0fd4'
> 	export queue_at_least_once=3D1
> 	export kernel=3D'/pkg/linux/i386-randconfig-r032-20210331/gcc-9/7308e024=
0410d3644c9d7cc6263079a58e3effeb/vmlinuz-5.12.0-rc2-00004-g7308e0240410'
> 	export dequeue_time=3D'2021-04-06 08:05:22 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-i386-140/trinity-group-0=
4-quantal-i386-core-20190426.cgz-7308e0240410d3644c9d7cc6263079a58e3effeb-2=
0210406-6170-ro89zc-24.cgz'
> =

> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> }
> =

> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> =

> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> =

> 	export_top_env
> =

> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> =

> 	run_test group=3D'group-04' $LKP_SRC/tests/wrapper trinity
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper meminfo
> =

> 	$LKP_SRC/stats/wrapper time trinity.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"


--===============6292413594798189352==--

