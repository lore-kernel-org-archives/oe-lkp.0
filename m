Content-Type: multipart/mixed; boundary="===============2655798810733394587=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [rcutorture] be6350ccbb: WARNING:bad_unlock_balance_detected
Date: Tue, 05 Oct 2021 20:09:20 -0700
Message-ID: <20211006030920.GC880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211002154023.GB22347@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2655798810733394587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 02, 2021 at 11:40:23PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: be6350ccbb78fbc8186f4b3265ed331654ef3ad9 ("rcutorture: Sanitize r=
cutorture_one_extend() use of idxold")
> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev.20=
21.09.22a

This commit had several problems and has since been replaced by
be6350ccbb78 ("rcutorture: Sanitize RCUTORTURE_RDR_MASK").

							Thanx, Paul

> in testcase: rcutorture
> version: =

> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: rcu
> =

> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
--------------------------------+------------+------------+
> |                                                                        =
                                | 1ae66df91a | be6350ccbb |
> +------------------------------------------------------------------------=
--------------------------------+------------+------------+
> | WARNING:bad_unlock_balance_detected                                    =
                                | 0          | 58         |
> | is_trying_to_release_lock(rcu_read_lock_sched)at                       =
                                | 0          | 33         |
> | WARNING:at_kernel/time/timer.c:#call_timer_fn                          =
                                | 0          | 55         |
> | BUG:KFENCE:invalid_write_in_handle_exception_return                    =
                                | 0          | 1          |
> | BUG:KFENCE:out-of-bounds_write_in_handle_exception_return              =
                                | 0          | 1          |
> | BUG:KFENCE:use-after-free_write_in_handle_exception_return             =
                                | 0          | 1          |
> | WARNING:at_kernel/softirq.c:#__local_bh_disable_ip                     =
                                | 0          | 53         |
> | EIP:__local_bh_disable_ip                                              =
                                | 0          | 53         |
> | WARNING:at_kernel/softirq.c:#__local_bh_enable_ip                      =
                                | 0          | 57         |
> | EIP:__local_bh_enable_ip                                               =
                                | 0          | 57         |
> | WARNING:suspicious_RCU_usage                                           =
                                | 0          | 10         |
> | include/trace/events/lock.h:#suspicious_rcu_dereference_check()usage   =
                                | 0          | 10         |
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_one_read[rcutorture]   =
                                | 0          | 57         |
> | EIP:rcu_torture_one_read                                               =
                                | 0          | 56         |
> | BUG:scheduling_while_atomic                                            =
                                | 0          | 55         |
> | EIP:call_timer_fn                                                      =
                                | 0          | 54         |
> | Kernel_panic-not_syncing:Aiee,killing_interrupt_handler                =
                                | 0          | 29         |
> | is_trying_to_release_lock(rcu_read_lock_bh)at                          =
                                | 0          | 24         |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/torture.c  =
                                | 0          | 46         |
> | BUG:kernel_NULL_pointer_dereference,address                            =
                                | 0          | 19         |
> | Oops:#[##]                                                             =
                                | 0          | 24         |
> | WARNING:stack_recursion                                                =
                                | 0          | 26         |
> | Kernel_panic-not_syncing:Fatal_exception                               =
                                | 0          | 24         |
> | BUG:unable_to_handle_page_fault_for_address                            =
                                | 0          | 5          |
> | EIP:update_group_capacity                                              =
                                | 0          | 1          |
> | kernel_BUG_at_kernel/sched/core.c                                      =
                                | 0          | 3          |
> | invalid_opcode:#[##]                                                   =
                                | 0          | 3          |
> | EIP:__sched_setscheduler                                               =
                                | 0          | 3          |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt                  =
                                | 0          | 3          |
> | Kernel_panic-not_syncing:stack-protector:Kernel_stack_is_corrupted_in:v=
printk_store                    | 0          | 1          |
> | WARNING:inconsistent_lock_state                                        =
                                | 0          | 1          |
> | inconsistent{IN-SOFTIRQ-W}->{SOFTIRQ-ON-W}usage                        =
                                | 0          | 1          |
> | WARNING:at_kernel/module.c:#module_assert_mutex_or_preempt             =
                                | 0          | 1          |
> | EIP:module_assert_mutex_or_preempt                                     =
                                | 0          | 1          |
> | Kernel_panic-not_syncing:stack-protector:Kernel_stack_is_corrupted_in:r=
cu_torture_one_read[rcutorture] | 0          | 1          |
> +------------------------------------------------------------------------=
--------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> =

> [   27.567579][  T496] rcu-torture: rcu_torture_reader task started
> [   27.570786][  T496]
> [   27.571020][  T496] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   27.571561][  T496] WARNING: bad unlock balance detected!
> [   27.572095][  T496] 5.15.0-rc1-00093-gbe6350ccbb78 #1 Not tainted
> [   27.572689][  T496] -------------------------------------
> [   27.573260][  T496] rcu_torture_rea/496 is trying to release lock (rcu=
_read_lock_sched) at:
> [   27.574076][  T496] [<f6c5a490>] rcutorture_one_extend+0x190/0x480 [rc=
utorture]
> [   27.574781][  T496] but there are no more locks to release!
> [   27.575398][  T496]
> [   27.575398][  T496] other info that might help us debug this:
> [   27.576141][  T496] no locks held by rcu_torture_rea/496.
> [   27.576648][  T496]
> [   27.576648][  T496] stack backtrace:
> [   27.577186][  T496] CPU: 0 PID: 496 Comm: rcu_torture_rea Not tainted =
5.15.0-rc1-00093-gbe6350ccbb78 #1 9163dea460308125cc5b8cc0f1df3eca089bc795
> [   27.578407][  T496] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [   27.579294][  T496] Call Trace:
> [   27.579612][  T496]  dump_stack_lvl+0x55/0x79
> [   27.579924][  T488] rcu-torture: Creating torture_shuffle task
> [   27.580060][  T496]  ? rcutorture_one_extend+0x190/0x480 [rcutorture 2=
6936e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.580773][  T497] rcu-torture: rcu_torture_stats task started
> [   27.581665][  T496]  dump_stack+0xd/0x10
> [   27.581674][  T496]  print_unlock_imbalance_bug.cold+0x96/0x9e
> [   27.581684][  T496]  ? rcutorture_one_extend+0x190/0x480 [rcutorture 2=
6936e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.581712][  T496]  ? rcutorture_one_extend+0x190/0x480 [rcutorture 2=
6936e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.581719][  T496]  ? rcutorture_one_extend+0x190/0x480 [rcutorture 2=
6936e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.581726][  T496]  lock_release+0x1b4/0x440
> [   27.581731][  T496]  ? rcu_read_delay+0x1f/0x180 [rcutorture 26936e0d5=
9ae68533deba419b7fc8ae986e561cf]
> [   27.581738][  T496]  rcutorture_one_extend+0x19f/0x480 [rcutorture 269=
36e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.581746][  T496]  rcu_torture_one_read+0x438/0x700 [rcutorture 2693=
6e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.581758][  T496]  rcu_torture_reader+0x8d/0x200 [rcutorture 26936e0=
d59ae68533deba419b7fc8ae986e561cf]
> [   27.581766][  T496]  ? rcutorture_booster_init+0x1c0/0x1c0 [rcutorture=
 26936e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.581775][  T496]  ? __kthread_parkme+0x5c/0x80
> [   27.581781][  T496]  kthread+0x10d/0x140
> [   27.581785][  T496]  ? rcu_torture_one_read+0x700/0x700 [rcutorture 26=
936e0d59ae68533deba419b7fc8ae986e561cf]
> [   27.581792][  T496]  ? set_kthread_struct+0x40/0x40
> [   27.581796][  T496]  ret_from_fork+0x1c/0x28
> =

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.15.0-rc1-00093-gbe6350ccbb78 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
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
> # Linux/i386 5.15.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_AS_IS_GNU=3Dy
> CONFIG_AS_VERSION=3D23502
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
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
> # CONFIG_WERROR is not set
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
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> CONFIG_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> CONFIG_WATCH_QUEUE=3Dy
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
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
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
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> CONFIG_TIME_KUNIT_TEST=3Dm
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> # end of Timers subsystem
> =

> CONFIG_BPF=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_BPF_JIT=3Dy
> # CONFIG_BPF_JIT_ALWAYS_ON is not set
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
> CONFIG_USERMODE_DRIVER=3Dy
> # CONFIG_BPF_PRELOAD is not set
> # end of BPF subsystem
> =

> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_SCHED_CORE is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> CONFIG_PSI=3Dy
> CONFIG_PSI_DEFAULT_DISABLED=3Dy
> # end of CPU/Task time and stats accounting
> =

> # CONFIG_CPU_ISOLATION is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
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
> CONFIG_RCU_FANOUT_LEAF=3D16
> CONFIG_RCU_FAST_NO_HZ=3Dy
> CONFIG_RCU_NOCB_CPU=3Dy
> # CONFIG_TASKS_TRACE_RCU_READ_MB is not set
> # end of RCU Subsystem
> =

> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_IKHEADERS=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> # CONFIG_PRINTK_INDEX is not set
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # end of Scheduler features
> =

> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_HUGETLB is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_BPF is not set
> # CONFIG_CGROUP_MISC is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> # CONFIG_TIME_NS is not set
> # CONFIG_IPC_NS is not set
> CONFIG_USER_NS=3Dy
> # CONFIG_PID_NS is not set
> CONFIG_NET_NS=3Dy
> CONFIG_CHECKPOINT_RESTORE=3Dy
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_EXPERT=3Dy
> # CONFIG_UID16 is not set
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
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
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_USERFAULTFD is not set
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> # CONFIG_RSEQ is not set
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_SLUB_DEBUG is not set
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> CONFIG_SLAB_FREELIST_HARDENED=3Dy
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> # CONFIG_SLUB_CPU_PARTIAL is not set
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> # CONFIG_PROFILING is not set
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
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_MPPARSE is not set
> CONFIG_GOLDFISH=3Dy
> CONFIG_RETPOLINE=3Dy
> CONFIG_X86_CPU_RESCTRL=3Dy
> CONFIG_X86_BIGSMP=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> CONFIG_X86_INTEL_MID=3Dy
> # CONFIG_X86_INTEL_QUARK is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_X86_RDC321X is not set
> CONFIG_X86_32_NON_STANDARD=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_STA2X11 is not set
> CONFIG_X86_32_IRIS=3Dm
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
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> # CONFIG_MPENTIUMII is not set
> CONFIG_MPENTIUMIII=3Dy
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
> CONFIG_X86_GENERIC=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D6
> CONFIG_X86_DEBUGCTLMSR=3Dy
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
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D2
> CONFIG_NR_CPUS_RANGE_END=3D64
> CONFIG_NR_CPUS_DEFAULT=3D32
> CONFIG_NR_CPUS=3D32
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> # CONFIG_SCHED_MC_PRIO is not set
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCELOG_LEGACY is not set
> CONFIG_X86_MCE_INTEL=3Dy
> # CONFIG_X86_ANCIENT_MCE is not set
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dm
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dm
> # CONFIG_PERF_EVENTS_INTEL_RAPL is not set
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> # end of Performance monitoring
> =

> # CONFIG_X86_LEGACY_VM86 is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX32=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> # CONFIG_TOSHIBA is not set
> CONFIG_I8K=3Dy
> # CONFIG_X86_REBOOTFIXUPS is not set
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dm
> CONFIG_X86_CPUID=3Dy
> # CONFIG_NOHIGHMEM is not set
> CONFIG_HIGHMEM4G=3Dy
> # CONFIG_HIGHMEM64G is not set
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_3G_OPT is not set
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_2G_OPT is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_HIGHMEM=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> # CONFIG_HIGHPTE is not set
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> # CONFIG_X86_PAT is not set
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> CONFIG_X86_INTEL_TSX_MODE_AUTO=3Dy
> # CONFIG_EFI is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> CONFIG_HZ_300=3Dy
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D300
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> # CONFIG_CRASH_DUMP is not set
> # CONFIG_KEXEC_JUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
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

> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> CONFIG_ACPI_EC_DEBUGFS=3Dy
> CONFIG_ACPI_AC=3Dm
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_TAD=3Dm
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dm
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> CONFIG_ACPI_THERMAL=3Dm
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dm
> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_CONFIGFS=3Dm
> CONFIG_PMIC_OPREGION=3Dy
> CONFIG_XPOWER_PMIC_OPREGION=3Dy
> CONFIG_BXT_WC_PMIC_OPREGION=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dy
> # CONFIG_APM_IGNORE_USER_SUSPEND is not set
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
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> CONFIG_INTEL_IDLE=3Dy
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> # CONFIG_PCI_GOBIOS is not set
> # CONFIG_PCI_GOMMCONFIG is not set
> # CONFIG_PCI_GODIRECT is not set
> CONFIG_PCI_GOANY=3Dy
> CONFIG_PCI_BIOS=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> CONFIG_SCx200=3Dm
> # CONFIG_SCx200HR_TIMER is not set
> # CONFIG_OLPC is not set
> CONFIG_ALIX=3Dy
> CONFIG_NET5501=3Dy
> CONFIG_GEOS=3Dy
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
> =

> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
> =

> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_FW_CFG_SYSFS is not set
> CONFIG_SYSFB=3Dy
> # CONFIG_SYSFB_SIMPLEFB is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> CONFIG_UEFI_CPER=3Dy
> CONFIG_UEFI_CPER_X86=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQFD=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> CONFIG_HAVE_KVM_NO_POLL=3Dy
> CONFIG_KVM_XFER_TO_GUEST_WORK=3Dy
> CONFIG_HAVE_KVM_PM_NOTIFIER=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dy
> # CONFIG_KVM_WERROR is not set
> # CONFIG_KVM_INTEL is not set
> # CONFIG_KVM_AMD is not set
> # CONFIG_KVM_XEN is not set
> # CONFIG_KVM_MMU_AUDIT is not set
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_WANTS_NO_INSTR=3Dy
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
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
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
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_SPLIT_ARG64=3Dy
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
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
> CONFIG_MODULE_COMPRESS_NONE=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=3Dy
> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_DEV_BSG_COMMON=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_INTEGRITY_T10=3Dy
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_WBT=3Dy
> CONFIG_BLK_WBT_MQ=3Dy
> # CONFIG_BLK_DEBUG_FS is not set
> CONFIG_BLK_SED_OPAL=3Dy
> CONFIG_BLK_INLINE_ENCRYPTION=3Dy
> # CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> CONFIG_ACORN_PARTITION=3Dy
> CONFIG_ACORN_PARTITION_CUMANA=3Dy
> # CONFIG_ACORN_PARTITION_EESOX is not set
> # CONFIG_ACORN_PARTITION_ICS is not set
> # CONFIG_ACORN_PARTITION_ADFS is not set
> # CONFIG_ACORN_PARTITION_POWERTEC is not set
> # CONFIG_ACORN_PARTITION_RISCIX is not set
> CONFIG_AIX_PARTITION=3Dy
> # CONFIG_OSF_PARTITION is not set
> # CONFIG_AMIGA_PARTITION is not set
> CONFIG_ATARI_PARTITION=3Dy
> # CONFIG_MAC_PARTITION is not set
> # CONFIG_MSDOS_PARTITION is not set
> # CONFIG_LDM_PARTITION is not set
> # CONFIG_SGI_PARTITION is not set
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> # CONFIG_EFI_PARTITION is not set
> # CONFIG_SYSV68_PARTITION is not set
> CONFIG_CMDLINE_PARTITION=3Dy
> # end of Partition Types
> =

> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_PM=3Dy
> =

> #
> # IO Schedulers
> #
> # CONFIG_MQ_IOSCHED_DEADLINE is not set
> # CONFIG_MQ_IOSCHED_KYBER is not set
> # CONFIG_IOSCHED_BFQ is not set
> # end of IO Schedulers
> =

> CONFIG_PREEMPT_NOTIFIERS=3Dy
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
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> # CONFIG_COREDUMP is not set
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_COMPACTION=3Dy
> # CONFIG_PAGE_REPORTING is not set
> CONFIG_MIGRATION=3Dy
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_MEMORY_FAILURE is not set
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_CLEANCACHE=3Dy
> CONFIG_FRONTSWAP=3Dy
> # CONFIG_CMA is not set
> # CONFIG_ZSWAP is not set
> # CONFIG_ZPOOL is not set
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_PAGE_IDLE_FLAG=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_ZONE_DMA_SET=3Dy
> # CONFIG_ZONE_DMA is not set
> CONFIG_PERCPU_STATS=3Dy
> CONFIG_GUP_TEST=3Dy
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_KMAP_LOCAL=3Dy
> =

> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> CONFIG_PACKET_DIAG=3Dm
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_AF_UNIX_OOB=3Dy
> CONFIG_UNIX_DIAG=3Dy
> # CONFIG_TLS is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dm
> CONFIG_XFRM_USER=3Dm
> CONFIG_XFRM_INTERFACE=3Dm
> # CONFIG_XFRM_SUB_POLICY is not set
> # CONFIG_XFRM_MIGRATE is not set
> # CONFIG_XFRM_STATISTICS is not set
> CONFIG_XFRM_AH=3Dm
> CONFIG_XFRM_IPCOMP=3Dm
> # CONFIG_NET_KEY is not set
> CONFIG_XDP_SOCKETS=3Dy
> CONFIG_XDP_SOCKETS_DIAG=3Dm
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_ROUTE_CLASSID=3Dy
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> CONFIG_IP_PNP_RARP=3Dy
> CONFIG_NET_IPIP=3Dy
> CONFIG_NET_IPGRE_DEMUX=3Dm
> CONFIG_NET_IP_TUNNEL=3Dy
> CONFIG_NET_IPGRE=3Dm
> # CONFIG_NET_IPGRE_BROADCAST is not set
> CONFIG_IP_MROUTE_COMMON=3Dy
> CONFIG_IP_MROUTE=3Dy
> CONFIG_IP_PIMSM_V1=3Dy
> # CONFIG_IP_PIMSM_V2 is not set
> CONFIG_SYN_COOKIES=3Dy
> CONFIG_NET_IPVTI=3Dm
> CONFIG_NET_UDP_TUNNEL=3Dy
> CONFIG_NET_FOU=3Dm
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> CONFIG_INET_IPCOMP=3Dm
> CONFIG_INET_XFRM_TUNNEL=3Dm
> CONFIG_INET_TUNNEL=3Dy
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> CONFIG_INET_UDP_DIAG=3Dy
> CONFIG_INET_RAW_DIAG=3Dy
> # CONFIG_INET_DIAG_DESTROY is not set
> CONFIG_TCP_CONG_ADVANCED=3Dy
> # CONFIG_TCP_CONG_BIC is not set
> CONFIG_TCP_CONG_CUBIC=3Dm
> CONFIG_TCP_CONG_WESTWOOD=3Dy
> CONFIG_TCP_CONG_HTCP=3Dm
> # CONFIG_TCP_CONG_HSTCP is not set
> CONFIG_TCP_CONG_HYBLA=3Dy
> CONFIG_TCP_CONG_VEGAS=3Dy
> CONFIG_TCP_CONG_NV=3Dm
> # CONFIG_TCP_CONG_SCALABLE is not set
> CONFIG_TCP_CONG_LP=3Dy
> CONFIG_TCP_CONG_VENO=3Dy
> CONFIG_TCP_CONG_YEAH=3Dy
> CONFIG_TCP_CONG_ILLINOIS=3Dm
> # CONFIG_TCP_CONG_DCTCP is not set
> CONFIG_TCP_CONG_CDG=3Dm
> CONFIG_TCP_CONG_BBR=3Dm
> # CONFIG_DEFAULT_HYBLA is not set
> # CONFIG_DEFAULT_VEGAS is not set
> CONFIG_DEFAULT_VENO=3Dy
> # CONFIG_DEFAULT_WESTWOOD is not set
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"veno"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=3Dy
> # CONFIG_IPV6_ROUTER_PREF is not set
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> CONFIG_INET6_AH=3Dm
> # CONFIG_INET6_ESP is not set
> # CONFIG_INET6_IPCOMP is not set
> CONFIG_IPV6_MIP6=3Dy
> CONFIG_IPV6_ILA=3Dm
> CONFIG_INET6_TUNNEL=3Dy
> CONFIG_IPV6_VTI=3Dy
> # CONFIG_IPV6_SIT is not set
> CONFIG_IPV6_TUNNEL=3Dy
> CONFIG_IPV6_GRE=3Dm
> CONFIG_IPV6_FOU=3Dm
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> CONFIG_IPV6_SEG6_HMAC=3Dy
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> # CONFIG_NETLABEL is not set
> CONFIG_MPTCP=3Dy
> CONFIG_INET_MPTCP_DIAG=3Dy
> CONFIG_MPTCP_IPV6=3Dy
> # CONFIG_MPTCP_KUNIT_TEST is not set
> CONFIG_NETWORK_SECMARK=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> CONFIG_BRIDGE_NETFILTER=3Dm
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dy
> CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
> CONFIG_NETFILTER_FAMILY_ARP=3Dy
> CONFIG_NETFILTER_NETLINK_HOOK=3Dm
> CONFIG_NETFILTER_NETLINK_ACCT=3Dy
> CONFIG_NETFILTER_NETLINK_QUEUE=3Dy
> CONFIG_NETFILTER_NETLINK_LOG=3Dy
> # CONFIG_NETFILTER_NETLINK_OSF is not set
> CONFIG_NF_CONNTRACK=3Dy
> CONFIG_NF_LOG_SYSLOG=3Dm
> CONFIG_NETFILTER_CONNCOUNT=3Dy
> CONFIG_NF_CONNTRACK_MARK=3Dy
> # CONFIG_NF_CONNTRACK_SECMARK is not set
> CONFIG_NF_CONNTRACK_ZONES=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> CONFIG_NF_CONNTRACK_EVENTS=3Dy
> CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
> CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
> # CONFIG_NF_CONNTRACK_LABELS is not set
> # CONFIG_NF_CT_PROTO_DCCP is not set
> CONFIG_NF_CT_PROTO_SCTP=3Dy
> # CONFIG_NF_CT_PROTO_UDPLITE is not set
> # CONFIG_NF_CONNTRACK_AMANDA is not set
> # CONFIG_NF_CONNTRACK_FTP is not set
> CONFIG_NF_CONNTRACK_H323=3Dm
> CONFIG_NF_CONNTRACK_IRC=3Dm
> # CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
> # CONFIG_NF_CONNTRACK_SNMP is not set
> # CONFIG_NF_CONNTRACK_PPTP is not set
> # CONFIG_NF_CONNTRACK_SANE is not set
> # CONFIG_NF_CONNTRACK_SIP is not set
> # CONFIG_NF_CONNTRACK_TFTP is not set
> CONFIG_NF_CT_NETLINK=3Dm
> CONFIG_NF_CT_NETLINK_TIMEOUT=3Dy
> CONFIG_NF_CT_NETLINK_HELPER=3Dm
> CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
> CONFIG_NF_NAT=3Dy
> CONFIG_NF_NAT_IRC=3Dm
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_NAT_MASQUERADE=3Dy
> CONFIG_NETFILTER_SYNPROXY=3Dy
> CONFIG_NF_TABLES=3Dy
> # CONFIG_NF_TABLES_INET is not set
> CONFIG_NF_TABLES_NETDEV=3Dy
> CONFIG_NFT_NUMGEN=3Dm
> # CONFIG_NFT_CT is not set
> CONFIG_NFT_FLOW_OFFLOAD=3Dm
> CONFIG_NFT_COUNTER=3Dy
> # CONFIG_NFT_CONNLIMIT is not set
> CONFIG_NFT_LOG=3Dm
> # CONFIG_NFT_LIMIT is not set
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dy
> CONFIG_NFT_NAT=3Dy
> CONFIG_NFT_TUNNEL=3Dy
> CONFIG_NFT_OBJREF=3Dy
> # CONFIG_NFT_QUEUE is not set
> CONFIG_NFT_QUOTA=3Dy
> CONFIG_NFT_REJECT=3Dm
> CONFIG_NFT_COMPAT=3Dy
> CONFIG_NFT_HASH=3Dy
> CONFIG_NFT_FIB=3Dy
> CONFIG_NFT_XFRM=3Dy
> CONFIG_NFT_SOCKET=3Dy
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> CONFIG_NFT_SYNPROXY=3Dy
> CONFIG_NF_DUP_NETDEV=3Dy
> CONFIG_NFT_DUP_NETDEV=3Dy
> # CONFIG_NFT_FWD_NETDEV is not set
> CONFIG_NF_FLOW_TABLE_INET=3Dm
> CONFIG_NF_FLOW_TABLE=3Dm
> CONFIG_NETFILTER_XTABLES=3Dy
> =

> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=3Dy
> CONFIG_NETFILTER_XT_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_SET=3Dm
> =

> #
> # Xtables targets
> #
> # CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
> CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
> # CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
> CONFIG_NETFILTER_XT_TARGET_CT=3Dm
> CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
> CONFIG_NETFILTER_XT_TARGET_HL=3Dm
> CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dy
> CONFIG_NETFILTER_XT_TARGET_LED=3Dy
> # CONFIG_NETFILTER_XT_TARGET_LOG is not set
> CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
> CONFIG_NETFILTER_XT_NAT=3Dm
> CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dy
> # CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
> CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dy
> # CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
> CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
> CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
> CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
> # CONFIG_NETFILTER_XT_TARGET_TEE is not set
> CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
> CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
> # CONFIG_NETFILTER_XT_TARGET_SECMARK is not set
> # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
> # CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
> =

> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dy
> CONFIG_NETFILTER_XT_MATCH_BPF=3Dy
> # CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
> CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
> CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
> # CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNLABEL is not set
> CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dy
> CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dy
> CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
> CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DSCP=3Dy
> CONFIG_NETFILTER_XT_MATCH_ECN=3Dy
> # CONFIG_NETFILTER_XT_MATCH_ESP is not set
> CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
> CONFIG_NETFILTER_XT_MATCH_HL=3Dy
> CONFIG_NETFILTER_XT_MATCH_IPCOMP=3Dm
> CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
> CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> # CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
> # CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_MAC is not set
> CONFIG_NETFILTER_XT_MATCH_MARK=3Dy
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
> CONFIG_NETFILTER_XT_MATCH_NFACCT=3Dy
> # CONFIG_NETFILTER_XT_MATCH_OSF is not set
> # CONFIG_NETFILTER_XT_MATCH_OWNER is not set
> # CONFIG_NETFILTER_XT_MATCH_POLICY is not set
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dy
> CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
> # CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
> # CONFIG_NETFILTER_XT_MATCH_REALM is not set
> CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
> # CONFIG_NETFILTER_XT_MATCH_SCTP is not set
> CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
> # CONFIG_NETFILTER_XT_MATCH_STATE is not set
> CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dy
> # CONFIG_NETFILTER_XT_MATCH_STRING is not set
> CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dy
> CONFIG_NETFILTER_XT_MATCH_TIME=3Dy
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # end of Core Netfilter Configuration
> =

> CONFIG_IP_SET=3Dm
> CONFIG_IP_SET_MAX=3D256
> CONFIG_IP_SET_BITMAP_IP=3Dm
> # CONFIG_IP_SET_BITMAP_IPMAC is not set
> # CONFIG_IP_SET_BITMAP_PORT is not set
> # CONFIG_IP_SET_HASH_IP is not set
> CONFIG_IP_SET_HASH_IPMARK=3Dm
> CONFIG_IP_SET_HASH_IPPORT=3Dm
> CONFIG_IP_SET_HASH_IPPORTIP=3Dm
> # CONFIG_IP_SET_HASH_IPPORTNET is not set
> CONFIG_IP_SET_HASH_IPMAC=3Dm
> CONFIG_IP_SET_HASH_MAC=3Dm
> CONFIG_IP_SET_HASH_NETPORTNET=3Dm
> # CONFIG_IP_SET_HASH_NET is not set
> CONFIG_IP_SET_HASH_NETNET=3Dm
> CONFIG_IP_SET_HASH_NETPORT=3Dm
> CONFIG_IP_SET_HASH_NETIFACE=3Dm
> CONFIG_IP_SET_LIST_SET=3Dm
> CONFIG_IP_VS=3Dm
> # CONFIG_IP_VS_IPV6 is not set
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=3D12
> =

> #
> # IPVS transport protocol load balancing support
> #
> # CONFIG_IP_VS_PROTO_TCP is not set
> CONFIG_IP_VS_PROTO_UDP=3Dy
> CONFIG_IP_VS_PROTO_AH_ESP=3Dy
> # CONFIG_IP_VS_PROTO_ESP is not set
> CONFIG_IP_VS_PROTO_AH=3Dy
> # CONFIG_IP_VS_PROTO_SCTP is not set
> =

> #
> # IPVS scheduler
> #
> CONFIG_IP_VS_RR=3Dm
> # CONFIG_IP_VS_WRR is not set
> # CONFIG_IP_VS_LC is not set
> CONFIG_IP_VS_WLC=3Dm
> # CONFIG_IP_VS_FO is not set
> CONFIG_IP_VS_OVF=3Dm
> CONFIG_IP_VS_LBLC=3Dm
> # CONFIG_IP_VS_LBLCR is not set
> CONFIG_IP_VS_DH=3Dm
> CONFIG_IP_VS_SH=3Dm
> CONFIG_IP_VS_MH=3Dm
> CONFIG_IP_VS_SED=3Dm
> CONFIG_IP_VS_NQ=3Dm
> CONFIG_IP_VS_TWOS=3Dm
> =

> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=3D8
> =

> #
> # IPVS MH scheduler
> #
> CONFIG_IP_VS_MH_TAB_INDEX=3D12
> =

> #
> # IPVS application helper
> #
> CONFIG_IP_VS_NFCT=3Dy
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dy
> CONFIG_NF_SOCKET_IPV4=3Dy
> CONFIG_NF_TPROXY_IPV4=3Dm
> CONFIG_NF_TABLES_IPV4=3Dy
> CONFIG_NFT_REJECT_IPV4=3Dm
> # CONFIG_NFT_DUP_IPV4 is not set
> CONFIG_NFT_FIB_IPV4=3Dy
> # CONFIG_NF_TABLES_ARP is not set
> CONFIG_NF_FLOW_TABLE_IPV4=3Dm
> # CONFIG_NF_DUP_IPV4 is not set
> # CONFIG_NF_LOG_ARP is not set
> # CONFIG_NF_LOG_IPV4 is not set
> CONFIG_NF_REJECT_IPV4=3Dy
> CONFIG_NF_NAT_H323=3Dm
> CONFIG_IP_NF_IPTABLES=3Dy
> # CONFIG_IP_NF_MATCH_AH is not set
> CONFIG_IP_NF_MATCH_ECN=3Dy
> CONFIG_IP_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP_NF_MATCH_TTL=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> CONFIG_IP_NF_TARGET_REJECT=3Dm
> CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP_NF_NAT=3Dm
> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP_NF_TARGET_NETMAP=3Dm
> CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> CONFIG_IP_NF_MANGLE=3Dm
> # CONFIG_IP_NF_TARGET_CLUSTERIP is not set
> # CONFIG_IP_NF_TARGET_ECN is not set
> CONFIG_IP_NF_TARGET_TTL=3Dm
> CONFIG_IP_NF_RAW=3Dy
> # CONFIG_IP_NF_SECURITY is not set
> CONFIG_IP_NF_ARPTABLES=3Dy
> CONFIG_IP_NF_ARPFILTER=3Dm
> # CONFIG_IP_NF_ARP_MANGLE is not set
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV6=3Dm
> CONFIG_NF_TPROXY_IPV6=3Dm
> # CONFIG_NF_TABLES_IPV6 is not set
> CONFIG_NF_FLOW_TABLE_IPV6=3Dm
> # CONFIG_NF_DUP_IPV6 is not set
> CONFIG_NF_REJECT_IPV6=3Dy
> CONFIG_NF_LOG_IPV6=3Dm
> CONFIG_IP6_NF_IPTABLES=3Dm
> # CONFIG_IP6_NF_MATCH_AH is not set
> CONFIG_IP6_NF_MATCH_EUI64=3Dm
> CONFIG_IP6_NF_MATCH_FRAG=3Dm
> # CONFIG_IP6_NF_MATCH_OPTS is not set
> CONFIG_IP6_NF_MATCH_HL=3Dm
> # CONFIG_IP6_NF_MATCH_IPV6HEADER is not set
> # CONFIG_IP6_NF_MATCH_MH is not set
> CONFIG_IP6_NF_MATCH_RT=3Dm
> # CONFIG_IP6_NF_MATCH_SRH is not set
> CONFIG_IP6_NF_FILTER=3Dm
> CONFIG_IP6_NF_TARGET_REJECT=3Dm
> # CONFIG_IP6_NF_TARGET_SYNPROXY is not set
> # CONFIG_IP6_NF_MANGLE is not set
> # CONFIG_IP6_NF_RAW is not set
> # CONFIG_IP6_NF_SECURITY is not set
> CONFIG_IP6_NF_NAT=3Dm
> CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP6_NF_TARGET_NPT=3Dm
> # end of IPv6: Netfilter Configuration
> =

> CONFIG_NF_DEFRAG_IPV6=3Dy
> CONFIG_NF_TABLES_BRIDGE=3Dm
> CONFIG_NFT_BRIDGE_META=3Dm
> CONFIG_NFT_BRIDGE_REJECT=3Dm
> CONFIG_NF_CONNTRACK_BRIDGE=3Dm
> # CONFIG_BRIDGE_NF_EBTABLES is not set
> CONFIG_BPFILTER=3Dy
> CONFIG_BPFILTER_UMH=3Dm
> # CONFIG_IP_DCCP is not set
> CONFIG_IP_SCTP=3Dm
> # CONFIG_SCTP_DBG_OBJCNT is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dm
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dm
> # CONFIG_TIPC_MEDIA_UDP is not set
> CONFIG_TIPC_CRYPTO=3Dy
> CONFIG_TIPC_DIAG=3Dm
> CONFIG_ATM=3Dy
> CONFIG_ATM_CLIP=3Dy
> CONFIG_ATM_CLIP_NO_ICMP=3Dy
> CONFIG_ATM_LANE=3Dy
> CONFIG_ATM_MPOA=3Dm
> CONFIG_ATM_BR2684=3Dy
> CONFIG_ATM_BR2684_IPFILTER=3Dy
> CONFIG_L2TP=3Dy
> CONFIG_L2TP_DEBUGFS=3Dy
> # CONFIG_L2TP_V3 is not set
> CONFIG_STP=3Dm
> CONFIG_BRIDGE=3Dm
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> CONFIG_BRIDGE_MRP=3Dy
> CONFIG_BRIDGE_CFM=3Dy
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dy
> # CONFIG_LLC2 is not set
> CONFIG_ATALK=3Dy
> CONFIG_DEV_APPLETALK=3Dm
> # CONFIG_LTPC is not set
> # CONFIG_COPS is not set
> CONFIG_IPDDP=3Dm
> # CONFIG_IPDDP_ENCAP is not set
> CONFIG_X25=3Dy
> # CONFIG_LAPB is not set
> CONFIG_PHONET=3Dy
> CONFIG_6LOWPAN=3Dm
> # CONFIG_6LOWPAN_DEBUGFS is not set
> CONFIG_6LOWPAN_NHC=3Dm
> # CONFIG_6LOWPAN_NHC_DEST is not set
> CONFIG_6LOWPAN_NHC_FRAGMENT=3Dm
> CONFIG_6LOWPAN_NHC_HOP=3Dm
> CONFIG_6LOWPAN_NHC_IPV6=3Dm
> CONFIG_6LOWPAN_NHC_MOBILITY=3Dm
> CONFIG_6LOWPAN_NHC_ROUTING=3Dm
> CONFIG_6LOWPAN_NHC_UDP=3Dm
> CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=3Dm
> # CONFIG_6LOWPAN_GHC_UDP is not set
> CONFIG_6LOWPAN_GHC_ICMPV6=3Dm
> CONFIG_6LOWPAN_GHC_EXT_HDR_DEST=3Dm
> CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=3Dm
> # CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
> CONFIG_IEEE802154=3Dm
> CONFIG_IEEE802154_NL802154_EXPERIMENTAL=3Dy
> CONFIG_IEEE802154_SOCKET=3Dm
> CONFIG_IEEE802154_6LOWPAN=3Dm
> CONFIG_MAC802154=3Dm
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dm
> # CONFIG_NET_SCH_HTB is not set
> # CONFIG_NET_SCH_HFSC is not set
> CONFIG_NET_SCH_ATM=3Dm
> CONFIG_NET_SCH_PRIO=3Dy
> CONFIG_NET_SCH_MULTIQ=3Dm
> CONFIG_NET_SCH_RED=3Dm
> CONFIG_NET_SCH_SFB=3Dy
> # CONFIG_NET_SCH_SFQ is not set
> CONFIG_NET_SCH_TEQL=3Dm
> CONFIG_NET_SCH_TBF=3Dm
> CONFIG_NET_SCH_CBS=3Dm
> CONFIG_NET_SCH_ETF=3Dm
> # CONFIG_NET_SCH_TAPRIO is not set
> CONFIG_NET_SCH_GRED=3Dy
> # CONFIG_NET_SCH_DSMARK is not set
> CONFIG_NET_SCH_NETEM=3Dy
> CONFIG_NET_SCH_DRR=3Dm
> CONFIG_NET_SCH_MQPRIO=3Dy
> CONFIG_NET_SCH_SKBPRIO=3Dy
> CONFIG_NET_SCH_CHOKE=3Dy
> CONFIG_NET_SCH_QFQ=3Dm
> # CONFIG_NET_SCH_CODEL is not set
> CONFIG_NET_SCH_FQ_CODEL=3Dm
> CONFIG_NET_SCH_CAKE=3Dy
> # CONFIG_NET_SCH_FQ is not set
> CONFIG_NET_SCH_HHF=3Dm
> # CONFIG_NET_SCH_PIE is not set
> CONFIG_NET_SCH_INGRESS=3Dy
> # CONFIG_NET_SCH_PLUG is not set
> CONFIG_NET_SCH_ETS=3Dm
> # CONFIG_NET_SCH_DEFAULT is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dy
> # CONFIG_NET_CLS_TCINDEX is not set
> CONFIG_NET_CLS_ROUTE4=3Dy
> CONFIG_NET_CLS_FW=3Dm
> CONFIG_NET_CLS_U32=3Dm
> # CONFIG_CLS_U32_PERF is not set
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dy
> CONFIG_NET_CLS_RSVP6=3Dy
> CONFIG_NET_CLS_FLOW=3Dy
> # CONFIG_NET_CLS_CGROUP is not set
> CONFIG_NET_CLS_BPF=3Dm
> # CONFIG_NET_CLS_FLOWER is not set
> # CONFIG_NET_CLS_MATCHALL is not set
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dy
> CONFIG_NET_EMATCH_NBYTE=3Dm
> # CONFIG_NET_EMATCH_U32 is not set
> # CONFIG_NET_EMATCH_META is not set
> # CONFIG_NET_EMATCH_TEXT is not set
> # CONFIG_NET_EMATCH_CANID is not set
> CONFIG_NET_EMATCH_IPSET=3Dm
> # CONFIG_NET_EMATCH_IPT is not set
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dy
> CONFIG_NET_ACT_GACT=3Dm
> # CONFIG_GACT_PROB is not set
> CONFIG_NET_ACT_MIRRED=3Dm
> CONFIG_NET_ACT_SAMPLE=3Dm
> CONFIG_NET_ACT_IPT=3Dy
> CONFIG_NET_ACT_NAT=3Dm
> # CONFIG_NET_ACT_PEDIT is not set
> # CONFIG_NET_ACT_SIMP is not set
> CONFIG_NET_ACT_SKBEDIT=3Dm
> CONFIG_NET_ACT_CSUM=3Dm
> CONFIG_NET_ACT_MPLS=3Dy
> CONFIG_NET_ACT_VLAN=3Dy
> CONFIG_NET_ACT_BPF=3Dm
> CONFIG_NET_ACT_CONNMARK=3Dm
> CONFIG_NET_ACT_CTINFO=3Dm
> CONFIG_NET_ACT_SKBMOD=3Dy
> # CONFIG_NET_ACT_IFE is not set
> CONFIG_NET_ACT_TUNNEL_KEY=3Dy
> CONFIG_NET_ACT_CT=3Dm
> CONFIG_NET_ACT_GATE=3Dy
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=3Dy
> CONFIG_BATMAN_ADV=3Dy
> CONFIG_BATMAN_ADV_BATMAN_V=3Dy
> CONFIG_BATMAN_ADV_BLA=3Dy
> # CONFIG_BATMAN_ADV_DAT is not set
> CONFIG_BATMAN_ADV_NC=3Dy
> # CONFIG_BATMAN_ADV_DEBUG is not set
> # CONFIG_BATMAN_ADV_TRACING is not set
> CONFIG_OPENVSWITCH=3Dy
> # CONFIG_OPENVSWITCH_GRE is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> # CONFIG_MPLS_ROUTING is not set
> CONFIG_NET_NSH=3Dy
> CONFIG_HSR=3Dm
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> CONFIG_QRTR=3Dm
> CONFIG_QRTR_SMD=3Dm
> CONFIG_QRTR_TUN=3Dm
> # CONFIG_QRTR_MHI is not set
> # CONFIG_NET_NCSI is not set
> # CONFIG_PCPU_DEV_REFCNT is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
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

> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> # CONFIG_AX25 is not set
> CONFIG_CAN=3Dm
> # CONFIG_CAN_RAW is not set
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dm
> CONFIG_CAN_J1939=3Dm
> CONFIG_CAN_ISOTP=3Dm
> =

> #
> # CAN Device Drivers
> #
> # CONFIG_CAN_VCAN is not set
> CONFIG_CAN_VXCAN=3Dm
> # CONFIG_CAN_SLCAN is not set
> CONFIG_CAN_DEV=3Dm
> # CONFIG_CAN_CALC_BITTIMING is not set
> CONFIG_CAN_JANZ_ICAN3=3Dm
> CONFIG_CAN_KVASER_PCIEFD=3Dm
> CONFIG_PCH_CAN=3Dm
> CONFIG_CAN_C_CAN=3Dm
> CONFIG_CAN_C_CAN_PLATFORM=3Dm
> # CONFIG_CAN_C_CAN_PCI is not set
> CONFIG_CAN_CC770=3Dm
> CONFIG_CAN_CC770_ISA=3Dm
> # CONFIG_CAN_CC770_PLATFORM is not set
> # CONFIG_CAN_IFI_CANFD is not set
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_PEAK_PCIEFD is not set
> # CONFIG_CAN_SJA1000 is not set
> CONFIG_CAN_SOFTING=3Dm
> =

> #
> # CAN SPI interfaces
> #
> CONFIG_CAN_HI311X=3Dm
> CONFIG_CAN_MCP251X=3Dm
> CONFIG_CAN_MCP251XFD=3Dm
> # CONFIG_CAN_MCP251XFD_SANITY is not set
> # end of CAN SPI interfaces
> =

> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> # CONFIG_BT is not set
> CONFIG_AF_RXRPC=3Dy
> # CONFIG_AF_RXRPC_IPV6 is not set
> CONFIG_AF_RXRPC_INJECT_LOSS=3Dy
> # CONFIG_AF_RXRPC_DEBUG is not set
> CONFIG_RXKAD=3Dy
> CONFIG_AF_KCM=3Dy
> CONFIG_STREAM_PARSER=3Dy
> # CONFIG_MCTP is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dm
> CONFIG_RFKILL_LEDS=3Dy
> # CONFIG_RFKILL_INPUT is not set
> CONFIG_RFKILL_GPIO=3Dm
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dm
> CONFIG_NET_9P_DEBUG=3Dy
> # CONFIG_CAIF is not set
> CONFIG_CEPH_LIB=3Dm
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> # CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
> CONFIG_NFC=3Dm
> CONFIG_NFC_DIGITAL=3Dm
> CONFIG_NFC_NCI=3Dm
> CONFIG_NFC_NCI_SPI=3Dm
> # CONFIG_NFC_NCI_UART is not set
> # CONFIG_NFC_HCI is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_TRF7970A=3Dm
> # CONFIG_NFC_SIM is not set
> CONFIG_NFC_VIRTUAL_NCI=3Dm
> # CONFIG_NFC_FDP is not set
> # CONFIG_NFC_PN533_I2C is not set
> # CONFIG_NFC_ST_NCI_I2C is not set
> # CONFIG_NFC_ST_NCI_SPI is not set
> CONFIG_NFC_NXP_NCI=3Dm
> CONFIG_NFC_NXP_NCI_I2C=3Dm
> CONFIG_NFC_S3FWRN5=3Dm
> CONFIG_NFC_S3FWRN5_I2C=3Dm
> CONFIG_NFC_ST95HF=3Dm
> # end of Near Field Communication (NFC) devices
> =

> CONFIG_PSAMPLE=3Dm
> CONFIG_NET_IFE=3Dm
> CONFIG_LWTUNNEL=3Dy
> # CONFIG_LWTUNNEL_BPF is not set
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_FAILOVER=3Dm
> # CONFIG_ETHTOOL_NETLINK is not set
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
> CONFIG_PCIE_PTM=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_PCIE_BUS_TUNE_OFF is not set
> # CONFIG_PCIE_BUS_DEFAULT is not set
> # CONFIG_PCIE_BUS_SAFE is not set
> CONFIG_PCIE_BUS_PERFORMANCE=3Dy
> # CONFIG_PCIE_BUS_PEER2PEER is not set
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI controller drivers
> #
> =

> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=3Dy
> CONFIG_PCIE_DW_HOST=3Dy
> CONFIG_PCIE_DW_PLAT=3Dy
> CONFIG_PCIE_DW_PLAT_HOST=3Dy
> # CONFIG_PCI_MESON is not set
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
> CONFIG_PCI_SW_SWITCHTEC=3Dm
> # end of PCI switch controller drivers
> =

> # CONFIG_CXL_BUS is not set
> CONFIG_PCCARD=3Dm
> # CONFIG_PCMCIA is not set
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dm
> # CONFIG_YENTA_O2 is not set
> CONFIG_YENTA_RICOH=3Dy
> # CONFIG_YENTA_TI is not set
> # CONFIG_YENTA_TOSHIBA is not set
> CONFIG_PCMCIA_PROBE=3Dy
> CONFIG_RAPIDIO=3Dm
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_ENUM_BASIC=3Dm
> # CONFIG_RAPIDIO_CHMAN is not set
> CONFIG_RAPIDIO_MPORT_CDEV=3Dm
> =

> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_TSI57X=3Dm
> # CONFIG_RAPIDIO_CPS_XX is not set
> # CONFIG_RAPIDIO_TSI568 is not set
> CONFIG_RAPIDIO_CPS_GEN2=3Dm
> CONFIG_RAPIDIO_RXS_GEN3=3Dm
> # end of RapidIO Switch drivers
> =

> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=3Dy
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> # CONFIG_FW_LOADER_USER_HELPER is not set
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
> CONFIG_TEST_ASYNC_DRIVER_PROBE=3Dm
> CONFIG_DRIVER_PE_KUNIT_TEST=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SLIMBUS=3Dm
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_SPMI=3Dm
> CONFIG_REGMAP_W1=3Dm
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_REGMAP_SOUNDWIRE=3Dm
> CONFIG_REGMAP_SOUNDWIRE_MBQ=3Dm
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> CONFIG_MHI_BUS=3Dy
> # CONFIG_MHI_BUS_DEBUG is not set
> CONFIG_MHI_BUS_PCI_GENERIC=3Dy
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> CONFIG_GNSS=3Dm
> CONFIG_MTD=3Dy
> CONFIG_MTD_TESTS=3Dm
> =

> #
> # Partition parsers
> #
> CONFIG_MTD_AR7_PARTS=3Dy
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # end of Partition parsers
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> # CONFIG_MTD_BLOCK is not set
> CONFIG_MTD_BLOCK_RO=3Dy
> =

> #
> # Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
> #
> CONFIG_FTL=3Dm
> # CONFIG_NFTL is not set
> CONFIG_INFTL=3Dm
> CONFIG_RFD_FTL=3Dy
> CONFIG_SSFDC=3Dy
> CONFIG_SM_FTL=3Dm
> CONFIG_MTD_OOPS=3Dy
> CONFIG_MTD_SWAP=3Dm
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
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dm
> # end of RAM/ROM/Flash chip drivers
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> CONFIG_MTD_PHYSMAP=3Dm
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> # CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
> # CONFIG_MTD_SCx200_DOCFLASH is not set
> # CONFIG_MTD_AMD76XROM is not set
> CONFIG_MTD_ICHXROM=3Dm
> CONFIG_MTD_ESB2ROM=3Dm
> # CONFIG_MTD_CK804XROM is not set
> CONFIG_MTD_SCB2_FLASH=3Dy
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dm
> CONFIG_MTD_PCI=3Dy
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> CONFIG_MTD_PLATRAM=3Dy
> # end of Mapping drivers for chip access
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dm
> CONFIG_MTD_PMC551_BUGFIX=3Dy
> CONFIG_MTD_PMC551_DEBUG=3Dy
> CONFIG_MTD_DATAFLASH=3Dy
> # CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
> CONFIG_MTD_DATAFLASH_OTP=3Dy
> # CONFIG_MTD_MCHP23K256 is not set
> # CONFIG_MTD_MCHP48L640 is not set
> CONFIG_MTD_SST25L=3Dm
> CONFIG_MTD_SLRAM=3Dm
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> CONFIG_MTD_BLOCK2MTD=3Dm
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dm
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> # end of Self-contained MTD device drivers
> =

> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=3Dy
> CONFIG_MTD_ONENAND=3Dm
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> # CONFIG_MTD_ONENAND_GENERIC is not set
> # CONFIG_MTD_ONENAND_OTP is not set
> CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> # CONFIG_MTD_RAW_NAND is not set
> CONFIG_MTD_SPI_NAND=3Dy
> =

> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=3Dy
> CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> # end of ECC engine support
> # end of NAND
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dm
> CONFIG_MTD_QINFO_PROBE=3Dm
> # end of LPDDR & LPDDR2 PCM memory drivers
> =

> CONFIG_MTD_SPI_NOR=3Dm
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> # CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
> # CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
> CONFIG_MTD_SPI_NOR_SWP_KEEP=3Dy
> CONFIG_SPI_INTEL_SPI=3Dm
> CONFIG_SPI_INTEL_SPI_PCI=3Dm
> # CONFIG_SPI_INTEL_SPI_PLATFORM is not set
> CONFIG_MTD_UBI=3Dm
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> CONFIG_MTD_UBI_GLUEBI=3Dm
> CONFIG_MTD_UBI_BLOCK=3Dy
> CONFIG_MTD_HYPERBUS=3Dy
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dm
> # CONFIG_PARPORT_PC is not set
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_ISAPNP=3Dy
> # CONFIG_PNPBIOS is not set
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dm
> CONFIG_BLK_DEV_FD=3Dy
> CONFIG_BLK_DEV_PCIESSD_MTIP32XX=3Dm
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_DEV_LOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> CONFIG_BLK_DEV_NBD=3Dy
> CONFIG_BLK_DEV_SX8=3Dm
> CONFIG_BLK_DEV_RAM=3Dy
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D4096
> # CONFIG_CDROM_PKTCDVD is not set
> CONFIG_ATA_OVER_ETH=3Dm
> CONFIG_VIRTIO_BLK=3Dm
> CONFIG_BLK_DEV_RBD=3Dm
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dy
> CONFIG_BLK_DEV_NVME=3Dy
> CONFIG_NVME_MULTIPATH=3Dy
> # CONFIG_NVME_HWMON is not set
> CONFIG_NVME_FABRICS=3Dy
> CONFIG_NVME_FC=3Dy
> # CONFIG_NVME_TCP is not set
> CONFIG_NVME_TARGET=3Dm
> # CONFIG_NVME_TARGET_PASSTHRU is not set
> CONFIG_NVME_TARGET_LOOP=3Dm
> CONFIG_NVME_TARGET_FC=3Dm
> CONFIG_NVME_TARGET_FCLOOP=3Dm
> # CONFIG_NVME_TARGET_TCP is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_AD525X_DPOT=3Dm
> CONFIG_AD525X_DPOT_I2C=3Dm
> # CONFIG_AD525X_DPOT_SPI is not set
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> CONFIG_PHANTOM=3Dm
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> CONFIG_CS5535_MFGPT=3Dy
> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> # CONFIG_CS5535_CLOCK_EVENT_SRC is not set
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dm
> CONFIG_ISL29003=3Dm
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dm
> CONFIG_DS1682=3Dm
> # CONFIG_VMWARE_BALLOON is not set
> CONFIG_PCH_PHUB=3Dy
> CONFIG_LATTICE_ECP3_CONFIG=3Dm
> CONFIG_SRAM=3Dy
> CONFIG_DW_XDATA_PCIE=3Dm
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dm
> CONFIG_C2PORT=3Dm
> CONFIG_C2PORT_DURAMAR_2150=3Dm
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> # CONFIG_EEPROM_AT25 is not set
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_93XX46=3Dm
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> CONFIG_EEPROM_EE1004=3Dm
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dm
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> # CONFIG_SENSORS_LIS3_I2C is not set
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_INTEL_MEI=3Dm
> CONFIG_INTEL_MEI_ME=3Dm
> CONFIG_INTEL_MEI_TXE=3Dm
> CONFIG_VMWARE_VMCI=3Dy
> # CONFIG_ECHO is not set
> CONFIG_BCM_VK=3Dm
> # CONFIG_BCM_VK_TTY is not set
> CONFIG_MISC_ALCOR_PCI=3Dm
> CONFIG_MISC_RTSX_PCI=3Dm
> # CONFIG_HABANA_AI is not set
> CONFIG_PVPANIC=3Dy
> CONFIG_PVPANIC_MMIO=3Dm
> # CONFIG_PVPANIC_PCI is not set
> # end of Misc devices
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dm
> CONFIG_RAID_ATTRS=3Dm
> CONFIG_SCSI_COMMON=3Dm
> CONFIG_SCSI=3Dm
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_NETLINK=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> # CONFIG_CHR_DEV_ST is not set
> # CONFIG_BLK_DEV_SR is not set
> CONFIG_CHR_DEV_SG=3Dm
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_CHR_DEV_SCH=3Dm
> CONFIG_SCSI_CONSTANTS=3Dy
> # CONFIG_SCSI_LOGGING is not set
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dm
> CONFIG_SCSI_FC_ATTRS=3Dm
> CONFIG_SCSI_ISCSI_ATTRS=3Dm
> # CONFIG_SCSI_SAS_ATTRS is not set
> # CONFIG_SCSI_SAS_LIBSAS is not set
> CONFIG_SCSI_SRP_ATTRS=3Dm
> # end of SCSI Transports
> =

> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_DH is not set
> # end of SCSI device support
> =

> CONFIG_ATA=3Dm
> CONFIG_SATA_HOST=3Dy
> CONFIG_PATA_TIMINGS=3Dy
> # CONFIG_ATA_VERBOSE_ERROR is not set
> CONFIG_ATA_FORCE=3Dy
> CONFIG_ATA_ACPI=3Dy
> CONFIG_SATA_ZPODD=3Dy
> # CONFIG_SATA_PMP is not set
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dm
> CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> # CONFIG_SATA_AHCI_PLATFORM is not set
> CONFIG_SATA_INIC162X=3Dm
> # CONFIG_SATA_ACARD_AHCI is not set
> CONFIG_SATA_SIL24=3Dm
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> CONFIG_SATA_QSTOR=3Dm
> # CONFIG_SATA_SX4 is not set
> # CONFIG_ATA_BMDMA is not set
> =

> #
> # PIO-only SFF controllers
> #
> CONFIG_PATA_CMD640_PCI=3Dm
> CONFIG_PATA_ISAPNP=3Dm
> CONFIG_PATA_MPIIX=3Dm
> CONFIG_PATA_NS87410=3Dm
> CONFIG_PATA_OPTI=3Dm
> # CONFIG_PATA_PLATFORM is not set
> CONFIG_PATA_QDI=3Dm
> CONFIG_PATA_RZ1000=3Dm
> CONFIG_PATA_WINBOND_VLB=3Dm
> =

> #
> # Generic fallback / legacy drivers
> #
> CONFIG_PATA_LEGACY=3Dm
> # CONFIG_MD is not set
> CONFIG_TARGET_CORE=3Dm
> # CONFIG_TCM_IBLOCK is not set
> CONFIG_TCM_FILEIO=3Dm
> CONFIG_TCM_PSCSI=3Dm
> CONFIG_TCM_USER2=3Dm
> CONFIG_LOOPBACK_TARGET=3Dm
> CONFIG_ISCSI_TARGET=3Dm
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=3Dm
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_MAC_EMUMOUSEBTN is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_IFB is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_MHI_NET is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
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
> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_EL3 is not set
> # CONFIG_3C515 is not set
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_LANCE is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_NI65 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CIRRUS=3Dy
> # CONFIG_CS89x0_ISA is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> # CONFIG_GVE is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_IXGBEVF is not set
> # CONFIG_I40E is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> # CONFIG_IGC is not set
> CONFIG_NET_VENDOR_MICROSOFT=3Dy
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_LITEX=3Dy
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2000 is not set
> # CONFIG_NE2K_PCI is not set
> # CONFIG_ULTRA is not set
> # CONFIG_WD80x3 is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_SMC9194 is not set
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
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
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_MICREL_KS8995MA is not set
> # CONFIG_MDIO_DEVICE is not set
> =

> #
> # PCS device drivers
> #
> # end of PCS device drivers
> =

> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> CONFIG_WLAN_VENDOR_RSI=3Dy
> CONFIG_WLAN_VENDOR_ST=3Dy
> CONFIG_WLAN_VENDOR_TI=3Dy
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dm
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_AT86RF230 is not set
> # CONFIG_IEEE802154_MRF24J40 is not set
> # CONFIG_IEEE802154_CC2520 is not set
> # CONFIG_IEEE802154_ADF7242 is not set
> # CONFIG_IEEE802154_CA8210 is not set
> # CONFIG_IEEE802154_MCR20A is not set
> # CONFIG_IEEE802154_HWSIM is not set
> =

> #
> # Wireless WAN
> #
> # CONFIG_WWAN is not set
> # end of Wireless WAN
> =

> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_USB4_NET is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=3Dm
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> # CONFIG_INPUT_FF_MEMLESS is not set
> CONFIG_INPUT_SPARSEKMAP=3Dm
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
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
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
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> # CONFIG_MOUSE_ELAN_I2C is not set
> # CONFIG_MOUSE_INPORT is not set
> # CONFIG_MOUSE_LOGIBM is not set
> # CONFIG_MOUSE_PC110PAD is not set
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
> CONFIG_SERIO_PARKBD=3Dm
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dm
> # CONFIG_SERIO_ARC_PS2 is not set
> # CONFIG_SERIO_GPIO_PS2 is not set
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dm
> CONFIG_GAMEPORT_L4=3Dm
> CONFIG_GAMEPORT_EMU10K1=3Dm
> CONFIG_GAMEPORT_FM801=3Dm
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
> CONFIG_SERIAL_8250_DWLIB=3Dy
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_PCH_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_GOLDFISH_TTY is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> # CONFIG_TTY_PRINTK is not set
> CONFIG_PRINTER=3Dm
> CONFIG_LP_CONSOLE=3Dy
> CONFIG_PPDEV=3Dm
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dm
> # CONFIG_IPMI_SSIF is not set
> CONFIG_IPMI_WATCHDOG=3Dm
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_IPMB_DEVICE_INTERFACE=3Dm
> # CONFIG_HW_RANDOM is not set
> CONFIG_DTLK=3Dy
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> # CONFIG_MWAVE is not set
> # CONFIG_SCx200_GPIO is not set
> CONFIG_PC8736x_GPIO=3Dm
> CONFIG_NSC_GPIO=3Dm
> # CONFIG_DEVMEM is not set
> CONFIG_NVRAM=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> CONFIG_HPET_MMAP_DEFAULT=3Dy
> CONFIG_HANGCHECK_TIMER=3Dm
> # CONFIG_TCG_TPM is not set
> # CONFIG_TELCLOCK is not set
> CONFIG_XILLYBUS_CLASS=3Dm
> CONFIG_XILLYBUS=3Dm
> CONFIG_XILLYBUS_PCIE=3Dm
> CONFIG_RANDOM_TRUST_CPU=3Dy
> CONFIG_RANDOM_TRUST_BOOTLOADER=3Dy
> # end of Character devices
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> # CONFIG_ACPI_I2C_OPREGION is not set
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dm
> CONFIG_I2C_MUX_LTC4306=3Dm
> CONFIG_I2C_MUX_PCA9541=3Dm
> # CONFIG_I2C_MUX_PCA954x is not set
> CONFIG_I2C_MUX_REG=3Dm
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # end of Multiplexer I2C Chip support
> =

> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dm
> CONFIG_I2C_ALGOPCF=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> # end of I2C Algorithms
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dm
> CONFIG_I2C_ALI1563=3Dy
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=3Dm
> CONFIG_I2C_AMD_MP2=3Dy
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dm
> CONFIG_I2C_PIIX4=3Dy
> CONFIG_I2C_NFORCE2=3Dy
> # CONFIG_I2C_NFORCE2_S4985 is not set
> CONFIG_I2C_NVIDIA_GPU=3Dy
> CONFIG_I2C_SIS5595=3Dm
> CONFIG_I2C_SIS630=3Dm
> CONFIG_I2C_SIS96X=3Dy
> # CONFIG_I2C_VIA is not set
> CONFIG_I2C_VIAPRO=3Dm
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dm
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> # CONFIG_I2C_EG20T is not set
> CONFIG_I2C_EMEV2=3Dy
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_KEMPLD is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dm
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_PCA_ISA=3Dm
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> # CONFIG_SCx200_ACB is not set
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> =

> CONFIG_I2C_STUB=3Dm
> CONFIG_I2C_SLAVE=3Dy
> # CONFIG_I2C_SLAVE_EEPROM is not set
> CONFIG_I2C_SLAVE_TESTUNIT=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> CONFIG_SPI=3Dy
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=3Dy
> CONFIG_SPI_MEM=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> CONFIG_SPI_BITBANG=3Dy
> CONFIG_SPI_BUTTERFLY=3Dm
> CONFIG_SPI_CADENCE=3Dm
> CONFIG_SPI_DESIGNWARE=3Dm
> CONFIG_SPI_DW_DMA=3Dy
> CONFIG_SPI_DW_PCI=3Dm
> CONFIG_SPI_DW_MMIO=3Dm
> # CONFIG_SPI_NXP_FLEXSPI is not set
> CONFIG_SPI_GPIO=3Dy
> CONFIG_SPI_LM70_LLP=3Dm
> # CONFIG_SPI_LANTIQ_SSC is not set
> CONFIG_SPI_OC_TINY=3Dy
> CONFIG_SPI_PXA2XX=3Dy
> CONFIG_SPI_PXA2XX_PCI=3Dy
> # CONFIG_SPI_ROCKCHIP is not set
> CONFIG_SPI_SC18IS602=3Dy
> CONFIG_SPI_SIFIVE=3Dy
> # CONFIG_SPI_MXIC is not set
> # CONFIG_SPI_TOPCLIFF_PCH is not set
> # CONFIG_SPI_XCOMM is not set
> CONFIG_SPI_XILINX=3Dm
> # CONFIG_SPI_ZYNQMP_GQSPI is not set
> CONFIG_SPI_AMD=3Dy
> =

> #
> # SPI Multiplexer support
> #
> CONFIG_SPI_MUX=3Dy
> =

> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=3Dm
> CONFIG_SPI_LOOPBACK_TEST=3Dm
> CONFIG_SPI_TLE62X0=3Dm
> CONFIG_SPI_SLAVE=3Dy
> CONFIG_SPI_SLAVE_TIME=3Dm
> # CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
> CONFIG_SPI_DYNAMIC=3Dy
> CONFIG_SPMI=3Dy
> # CONFIG_SPMI_HISI3670 is not set
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
> # CONFIG_PPS is not set
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_DA9062=3Dm
> CONFIG_PINCTRL_MCP23S08_I2C=3Dy
> CONFIG_PINCTRL_MCP23S08_SPI=3Dy
> CONFIG_PINCTRL_MCP23S08=3Dy
> CONFIG_PINCTRL_SX150X=3Dy
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> CONFIG_PINCTRL_CHERRYVIEW=3Dm
> # CONFIG_PINCTRL_LYNXPOINT is not set
> CONFIG_PINCTRL_MERRIFIELD=3Dy
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_ALDERLAKE=3Dm
> CONFIG_PINCTRL_BROXTON=3Dy
> CONFIG_PINCTRL_CANNONLAKE=3Dy
> # CONFIG_PINCTRL_CEDARFORK is not set
> CONFIG_PINCTRL_DENVERTON=3Dy
> CONFIG_PINCTRL_ELKHARTLAKE=3Dm
> # CONFIG_PINCTRL_EMMITSBURG is not set
> CONFIG_PINCTRL_GEMINILAKE=3Dy
> CONFIG_PINCTRL_ICELAKE=3Dy
> # CONFIG_PINCTRL_JASPERLAKE is not set
> CONFIG_PINCTRL_LAKEFIELD=3Dm
> CONFIG_PINCTRL_LEWISBURG=3Dy
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> CONFIG_PINCTRL_TIGERLAKE=3Dy
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_PINCTRL_MADERA=3Dm
> CONFIG_PINCTRL_CS47L85=3Dy
> CONFIG_PINCTRL_CS47L92=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_CDEV=3Dy
> # CONFIG_GPIO_CDEV_V1 is not set
> CONFIG_GPIO_GENERIC=3Dm
> CONFIG_GPIO_MAX730X=3Dm
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_AMDPT=3Dm
> CONFIG_GPIO_DWAPB=3Dm
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dm
> CONFIG_GPIO_ICH=3Dm
> CONFIG_GPIO_MB86S7X=3Dm
> CONFIG_GPIO_MENZ127=3Dm
> CONFIG_GPIO_SIOX=3Dy
> # CONFIG_GPIO_VX855 is not set
> CONFIG_GPIO_AMD_FCH=3Dy
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_IT87=3Dm
> CONFIG_GPIO_SCH=3Dy
> CONFIG_GPIO_SCH311X=3Dm
> # CONFIG_GPIO_WINBOND is not set
> CONFIG_GPIO_WS16C48=3Dm
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> CONFIG_GPIO_MAX7300=3Dm
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> CONFIG_GPIO_PCA9570=3Dm
> # CONFIG_GPIO_PCF857X is not set
> CONFIG_GPIO_TPIC2810=3Dm
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_BD9571MWV=3Dm
> # CONFIG_GPIO_CS5535 is not set
> CONFIG_GPIO_DA9055=3Dm
> CONFIG_GPIO_JANZ_TTL=3Dm
> # CONFIG_GPIO_KEMPLD is not set
> CONFIG_GPIO_LP3943=3Dm
> CONFIG_GPIO_MADERA=3Dm
> CONFIG_GPIO_PALMAS=3Dy
> # CONFIG_GPIO_RC5T583 is not set
> # CONFIG_GPIO_TIMBERDALE is not set
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS6586X=3Dy
> # CONFIG_GPIO_TPS65912 is not set
> # CONFIG_GPIO_TQMX86 is not set
> # CONFIG_GPIO_TWL4030 is not set
> CONFIG_GPIO_TWL6040=3Dy
> CONFIG_GPIO_WHISKEY_COVE=3Dm
> CONFIG_GPIO_WM8994=3Dm
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_MERRIFIELD is not set
> CONFIG_GPIO_ML_IOH=3Dm
> CONFIG_GPIO_PCH=3Dy
> CONFIG_GPIO_PCI_IDIO_16=3Dy
> CONFIG_GPIO_PCIE_IDIO_24=3Dm
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> =

> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_MAX3191X=3Dy
> CONFIG_GPIO_MAX7301=3Dm
> # CONFIG_GPIO_MC33880 is not set
> CONFIG_GPIO_PISOSR=3Dm
> CONFIG_GPIO_XRA1403=3Dy
> # end of SPI GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=3Dm
> CONFIG_GPIO_MOCKUP=3Dy
> # CONFIG_GPIO_VIRTIO is not set
> # end of Virtual GPIO drivers
> =

> CONFIG_W1=3Dm
> CONFIG_W1_CON=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2482=3Dm
> # CONFIG_W1_MASTER_DS1WM is not set
> # CONFIG_W1_MASTER_GPIO is not set
> CONFIG_W1_MASTER_SGI=3Dm
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> CONFIG_W1_SLAVE_SMEM=3Dm
> CONFIG_W1_SLAVE_DS2405=3Dm
> CONFIG_W1_SLAVE_DS2408=3Dm
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dm
> CONFIG_W1_SLAVE_DS2423=3Dm
> CONFIG_W1_SLAVE_DS2805=3Dm
> CONFIG_W1_SLAVE_DS2430=3Dm
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dm
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> CONFIG_W1_SLAVE_DS2438=3Dm
> CONFIG_W1_SLAVE_DS250X=3Dm
> CONFIG_W1_SLAVE_DS2780=3Dm
> CONFIG_W1_SLAVE_DS2781=3Dm
> CONFIG_W1_SLAVE_DS28E04=3Dm
> CONFIG_W1_SLAVE_DS28E17=3Dm
> # end of 1-wire Slaves
> =

> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_RESTART=3Dy
> # CONFIG_POWER_RESET_TPS65086 is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> CONFIG_GENERIC_ADC_BATTERY=3Dm
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_88PM860X=3Dm
> # CONFIG_CHARGER_ADP5061 is not set
> CONFIG_BATTERY_CW2015=3Dy
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_DS2780 is not set
> CONFIG_BATTERY_DS2781=3Dm
> CONFIG_BATTERY_DS2782=3Dm
> CONFIG_BATTERY_SBS=3Dm
> CONFIG_CHARGER_SBS=3Dm
> CONFIG_MANAGER_SBS=3Dm
> # CONFIG_BATTERY_BQ27XXX is not set
> CONFIG_BATTERY_DA9030=3Dm
> CONFIG_CHARGER_AXP20X=3Dm
> CONFIG_BATTERY_AXP20X=3Dm
> CONFIG_AXP20X_POWER=3Dm
> CONFIG_AXP288_FUEL_GAUGE=3Dm
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dm
> CONFIG_BATTERY_MAX1721X=3Dm
> CONFIG_BATTERY_TWL4030_MADC=3Dy
> # CONFIG_CHARGER_88PM860X is not set
> CONFIG_CHARGER_PCF50633=3Dy
> # CONFIG_BATTERY_RX51 is not set
> CONFIG_CHARGER_MAX8903=3Dy
> # CONFIG_CHARGER_TWL4030 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_LT3651=3Dy
> CONFIG_CHARGER_LTC4162L=3Dm
> CONFIG_CHARGER_MAX14577=3Dy
> CONFIG_CHARGER_MP2629=3Dm
> # CONFIG_CHARGER_MT6360 is not set
> CONFIG_CHARGER_BQ2415X=3Dm
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24257=3Dm
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ2515X=3Dy
> CONFIG_CHARGER_BQ25890=3Dm
> # CONFIG_CHARGER_BQ25980 is not set
> # CONFIG_CHARGER_BQ256XX is not set
> CONFIG_CHARGER_SMB347=3Dm
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_GOLDFISH=3Dm
> CONFIG_BATTERY_RT5033=3Dy
> CONFIG_CHARGER_RT9455=3Dy
> # CONFIG_CHARGER_CROS_USBPD is not set
> CONFIG_CHARGER_CROS_PCHG=3Dm
> CONFIG_CHARGER_BD99954=3Dy
> # CONFIG_CHARGER_WILCO is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> CONFIG_SENSORS_ABITUGURU3=3Dy
> # CONFIG_SENSORS_AD7314 is not set
> CONFIG_SENSORS_AD7414=3Dy
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> # CONFIG_SENSORS_ADM1029 is not set
> # CONFIG_SENSORS_ADM1031 is not set
> CONFIG_SENSORS_ADM1177=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> # CONFIG_SENSORS_ADT7310 is not set
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=3Dy
> # CONFIG_SENSORS_ADT7462 is not set
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dm
> CONFIG_SENSORS_AHT10=3Dm
> CONFIG_SENSORS_AS370=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dy
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> CONFIG_SENSORS_DRIVETEMP=3Dm
> # CONFIG_SENSORS_DS620 is not set
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dy
> # CONFIG_SENSORS_DA9055 is not set
> CONFIG_SENSORS_I5K_AMB=3Dm
> CONFIG_SENSORS_F71805F=3Dm
> # CONFIG_SENSORS_F71882FG is not set
> CONFIG_SENSORS_F75375S=3Dm
> # CONFIG_SENSORS_MC13783_ADC is not set
> CONFIG_SENSORS_FSCHMD=3Dm
> # CONFIG_SENSORS_FTSTEUTATES is not set
> # CONFIG_SENSORS_GL518SM is not set
> # CONFIG_SENSORS_GL520SM is not set
> # CONFIG_SENSORS_G760A is not set
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dm
> # CONFIG_SENSORS_IBMPEX is not set
> CONFIG_SENSORS_IIO_HWMON=3Dm
> CONFIG_SENSORS_I5500=3Dy
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dm
> CONFIG_SENSORS_LINEAGE=3Dm
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC2947=3Dy
> CONFIG_SENSORS_LTC2947_I2C=3Dy
> CONFIG_SENSORS_LTC2947_SPI=3Dy
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC2992=3Dy
> # CONFIG_SENSORS_LTC4151 is not set
> # CONFIG_SENSORS_LTC4215 is not set
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> CONFIG_SENSORS_MAX1111=3Dm
> CONFIG_SENSORS_MAX127=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dy
> # CONFIG_SENSORS_MAX197 is not set
> CONFIG_SENSORS_MAX31722=3Dy
> # CONFIG_SENSORS_MAX31730 is not set
> CONFIG_SENSORS_MAX6621=3Dy
> # CONFIG_SENSORS_MAX6639 is not set
> # CONFIG_SENSORS_MAX6642 is not set
> # CONFIG_SENSORS_MAX6650 is not set
> CONFIG_SENSORS_MAX6697=3Dm
> CONFIG_SENSORS_MAX31790=3Dm
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_TC654=3Dy
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_MR75203=3Dm
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dm
> CONFIG_SENSORS_LM70=3Dy
> CONFIG_SENSORS_LM73=3Dy
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=3Dm
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dm
> CONFIG_SENSORS_LM85=3Dm
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dy
> # CONFIG_SENSORS_LM95234 is not set
> # CONFIG_SENSORS_LM95241 is not set
> CONFIG_SENSORS_LM95245=3Dm
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=3Dy
> CONFIG_SENSORS_NCT7802=3Dm
> # CONFIG_SENSORS_NCT7904 is not set
> # CONFIG_SENSORS_NPCM7XX is not set
> CONFIG_SENSORS_PCF8591=3Dm
> CONFIG_PMBUS=3Dm
> CONFIG_SENSORS_PMBUS=3Dm
> CONFIG_SENSORS_ADM1266=3Dm
> CONFIG_SENSORS_ADM1275=3Dm
> CONFIG_SENSORS_BEL_PFE=3Dm
> CONFIG_SENSORS_BPA_RS600=3Dm
> CONFIG_SENSORS_FSP_3Y=3Dm
> CONFIG_SENSORS_IBM_CFFPS=3Dm
> # CONFIG_SENSORS_DPS920AB is not set
> CONFIG_SENSORS_INSPUR_IPSPS=3Dm
> CONFIG_SENSORS_IR35221=3Dm
> # CONFIG_SENSORS_IR36021 is not set
> # CONFIG_SENSORS_IR38064 is not set
> CONFIG_SENSORS_IRPS5401=3Dm
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX15301=3Dm
> CONFIG_SENSORS_MAX16064=3Dm
> CONFIG_SENSORS_MAX16601=3Dm
> # CONFIG_SENSORS_MAX20730 is not set
> CONFIG_SENSORS_MAX20751=3Dm
> CONFIG_SENSORS_MAX31785=3Dm
> # CONFIG_SENSORS_MAX34440 is not set
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_MP2888=3Dm
> # CONFIG_SENSORS_MP2975 is not set
> # CONFIG_SENSORS_PIM4328 is not set
> CONFIG_SENSORS_PM6764TR=3Dm
> # CONFIG_SENSORS_PXE1610 is not set
> CONFIG_SENSORS_Q54SJ108A2=3Dm
> CONFIG_SENSORS_STPDDC60=3Dm
> # CONFIG_SENSORS_TPS40422 is not set
> # CONFIG_SENSORS_TPS53679 is not set
> # CONFIG_SENSORS_UCD9000 is not set
> # CONFIG_SENSORS_UCD9200 is not set
> CONFIG_SENSORS_XDPE122=3Dm
> CONFIG_SENSORS_ZL6100=3Dm
> CONFIG_SENSORS_SBTSI=3Dy
> # CONFIG_SENSORS_SBRMI is not set
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=3Dm
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHT4x=3Dy
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SIS5595=3Dm
> # CONFIG_SENSORS_DME1737 is not set
> CONFIG_SENSORS_EMC1403=3Dm
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dm
> # CONFIG_SENSORS_SMSC47M1 is not set
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=3Dm
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dm
> CONFIG_SENSORS_SCH5636=3Dy
> CONFIG_SENSORS_STTS751=3Dm
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dm
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_ADS7871=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> # CONFIG_SENSORS_INA209 is not set
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_INA3221=3Dm
> CONFIG_SENSORS_TC74=3Dm
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dm
> # CONFIG_SENSORS_TMP103 is not set
> CONFIG_SENSORS_TMP108=3Dm
> # CONFIG_SENSORS_TMP401 is not set
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_TMP513=3Dy
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> CONFIG_SENSORS_VIA686A=3Dy
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dm
> CONFIG_SENSORS_W83773G=3Dm
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dy
> # CONFIG_SENSORS_W83792D is not set
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> # CONFIG_SENSORS_W83627HF is not set
> CONFIG_SENSORS_W83627EHF=3Dy
> CONFIG_SENSORS_XGENE=3Dm
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dm
> CONFIG_SENSORS_ATK0110=3Dm
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> # CONFIG_INTEL_POWERCLAMP is not set
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dm
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
> # end of ACPI INT340X thermal drivers
> =

> CONFIG_INTEL_BXT_PMIC_THERMAL=3Dm
> CONFIG_INTEL_PCH_THERMAL=3Dm
> CONFIG_INTEL_TCC_COOLING=3Dm
> # CONFIG_INTEL_MENLOW is not set
> # end of Intel thermal drivers
> =

> # CONFIG_GENERIC_ADC_THERMAL is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> CONFIG_WATCHDOG_SYSFS=3Dy
> CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=3Dy
> =

> #
> # Watchdog Pretimeout Governors
> #
> CONFIG_WATCHDOG_PRETIMEOUT_GOV=3Dy
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=3Dm
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=3Dy
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dm
> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=3Dy
> # CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC is not set
> =

> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_DA9055_WATCHDOG=3Dy
> CONFIG_DA9063_WATCHDOG=3Dm
> CONFIG_DA9062_WATCHDOG=3Dy
> # CONFIG_MENF21BMC_WATCHDOG is not set
> # CONFIG_MENZ069_WATCHDOG is not set
> # CONFIG_WDAT_WDT is not set
> CONFIG_XILINX_WATCHDOG=3Dm
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> CONFIG_CADENCE_WATCHDOG=3Dy
> # CONFIG_DW_WATCHDOG is not set
> CONFIG_TWL4030_WATCHDOG=3Dy
> # CONFIG_MAX63XX_WATCHDOG is not set
> CONFIG_RETU_WATCHDOG=3Dm
> # CONFIG_ACQUIRE_WDT is not set
> CONFIG_ADVANTECH_WDT=3Dm
> CONFIG_ALIM1535_WDT=3Dy
> CONFIG_ALIM7101_WDT=3Dm
> CONFIG_EBC_C384_WDT=3Dy
> # CONFIG_F71808E_WDT is not set
> # CONFIG_SP5100_TCO is not set
> CONFIG_GEODE_WDT=3Dm
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> # CONFIG_IBMASR is not set
> CONFIG_WAFER_WDT=3Dy
> CONFIG_I6300ESB_WDT=3Dy
> # CONFIG_IE6XX_WDT is not set
> # CONFIG_INTEL_MID_WATCHDOG is not set
> CONFIG_ITCO_WDT=3Dm
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> # CONFIG_IT8712F_WDT is not set
> CONFIG_IT87_WDT=3Dy
> CONFIG_HP_WATCHDOG=3Dy
> # CONFIG_HPWDT_NMI_DECODING is not set
> CONFIG_KEMPLD_WDT=3Dm
> CONFIG_SC1200_WDT=3Dm
> CONFIG_SCx200_WDT=3Dm
> CONFIG_PC87413_WDT=3Dy
> CONFIG_NV_TCO=3Dm
> CONFIG_60XX_WDT=3Dm
> CONFIG_SBC8360_WDT=3Dy
> CONFIG_SBC7240_WDT=3Dy
> # CONFIG_CPU5_WDT is not set
> # CONFIG_SMSC_SCH311X_WDT is not set
> CONFIG_SMSC37B787_WDT=3Dy
> # CONFIG_TQMX86_WDT is not set
> CONFIG_VIA_WDT=3Dy
> # CONFIG_W83627HF_WDT is not set
> # CONFIG_W83877F_WDT is not set
> CONFIG_W83977F_WDT=3Dy
> CONFIG_MACHZ_WDT=3Dm
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> CONFIG_INTEL_MEI_WDT=3Dm
> CONFIG_NI903X_WDT=3Dm
> CONFIG_NIC7018_WDT=3Dy
> CONFIG_MEN_A21_WDT=3Dm
> =

> #
> # ISA-based Watchdog Cards
> #
> # CONFIG_PCWATCHDOG is not set
> # CONFIG_MIXCOMWD is not set
> # CONFIG_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dy
> # CONFIG_WDTPCI is not set
> CONFIG_SSB_POSSIBLE=3Dy
> CONFIG_SSB=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> CONFIG_BCMA_DEBUG=3Dy
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dm
> CONFIG_MFD_BD9571MWV=3Dm
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> CONFIG_MFD_CROS_EC_DEV=3Dm
> CONFIG_MFD_MADERA=3Dm
> # CONFIG_MFD_MADERA_I2C is not set
> CONFIG_MFD_MADERA_SPI=3Dm
> # CONFIG_MFD_CS47L15 is not set
> # CONFIG_MFD_CS47L35 is not set
> CONFIG_MFD_CS47L85=3Dy
> # CONFIG_MFD_CS47L90 is not set
> CONFIG_MFD_CS47L92=3Dy
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> CONFIG_MFD_DA9062=3Dy
> CONFIG_MFD_DA9063=3Dm
> # CONFIG_MFD_DA9150 is not set
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dm
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_MFD_MP2629=3Dm
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC_BXTWC=3Dm
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_INTEL_SOC_PMIC_MRFLD=3Dm
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> CONFIG_MFD_INTEL_PMC_BXT=3Dm
> CONFIG_MFD_INTEL_PMT=3Dy
> # CONFIG_MFD_IQS62X is not set
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dm
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6360=3Dm
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dm
> # CONFIG_EZX_PCAP is not set
> CONFIG_MFD_RETU=3Dm
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> CONFIG_PCF50633_GPIO=3Dm
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT4831 is not set
> CONFIG_MFD_RT5033=3Dm
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_SI476X_CORE=3Dy
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SKY81452=3Dm
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> CONFIG_MFD_LP3943=3Dm
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_TI_LMU=3Dy
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dm
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TI_LP873X is not set
> CONFIG_MFD_TPS6586X=3Dy
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> CONFIG_MFD_TPS65912_SPI=3Dy
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dm
> CONFIG_MFD_LM3533=3Dm
> CONFIG_MFD_TIMBERDALE=3Dy
> CONFIG_MFD_TQMX86=3Dm
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dm
> CONFIG_MFD_ARIZONA_I2C=3Dm
> # CONFIG_MFD_ARIZONA_SPI is not set
> CONFIG_MFD_CS47L24=3Dy
> CONFIG_MFD_WM5102=3Dy
> # CONFIG_MFD_WM5110 is not set
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=3Dy
> CONFIG_MFD_WM8400=3Dy
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dm
> CONFIG_MFD_WCD934X=3Dm
> # CONFIG_MFD_ATC260X_I2C is not set
> # CONFIG_MFD_INTEL_M10_BMC is not set
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dm
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=3Dm
> CONFIG_REGULATOR_88PM800=3Dm
> CONFIG_REGULATOR_88PM8607=3Dm
> CONFIG_REGULATOR_ACT8865=3Dm
> # CONFIG_REGULATOR_AD5398 is not set
> # CONFIG_REGULATOR_ARIZONA_LDO1 is not set
> CONFIG_REGULATOR_ARIZONA_MICSUPP=3Dm
> # CONFIG_REGULATOR_AXP20X is not set
> # CONFIG_REGULATOR_BCM590XX is not set
> CONFIG_REGULATOR_BD9571MWV=3Dm
> CONFIG_REGULATOR_DA903X=3Dy
> # CONFIG_REGULATOR_DA9055 is not set
> # CONFIG_REGULATOR_DA9062 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dm
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LM363X=3Dm
> CONFIG_REGULATOR_LP3971=3Dy
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dm
> # CONFIG_REGULATOR_LTC3589 is not set
> CONFIG_REGULATOR_LTC3676=3Dy
> CONFIG_REGULATOR_MAX14577=3Dy
> CONFIG_REGULATOR_MAX1586=3Dm
> CONFIG_REGULATOR_MAX8649=3Dm
> CONFIG_REGULATOR_MAX8660=3Dy
> # CONFIG_REGULATOR_MAX8893 is not set
> # CONFIG_REGULATOR_MAX8907 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> # CONFIG_REGULATOR_MAX77826 is not set
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> CONFIG_REGULATOR_MC13892=3Dm
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MT6311=3Dm
> CONFIG_REGULATOR_MT6315=3Dm
> # CONFIG_REGULATOR_MT6360 is not set
> CONFIG_REGULATOR_PALMAS=3Dy
> # CONFIG_REGULATOR_PCA9450 is not set
> # CONFIG_REGULATOR_PCF50633 is not set
> # CONFIG_REGULATOR_PV88060 is not set
> # CONFIG_REGULATOR_PV88080 is not set
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> # CONFIG_REGULATOR_QCOM_USB_VBUS is not set
> # CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY is not set
> CONFIG_REGULATOR_RC5T583=3Dy
> CONFIG_REGULATOR_RT4801=3Dy
> # CONFIG_REGULATOR_RT5033 is not set
> # CONFIG_REGULATOR_RT6160 is not set
> CONFIG_REGULATOR_RT6245=3Dy
> # CONFIG_REGULATOR_RTQ2134 is not set
> # CONFIG_REGULATOR_RTMV20 is not set
> # CONFIG_REGULATOR_RTQ6752 is not set
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_SLG51000=3Dm
> CONFIG_REGULATOR_TPS51632=3Dm
> CONFIG_REGULATOR_TPS6105X=3Dy
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dm
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dm
> CONFIG_REGULATOR_TPS65132=3Dm
> CONFIG_REGULATOR_TPS6524X=3Dy
> # CONFIG_REGULATOR_TPS6586X is not set
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_TPS80031=3Dy
> # CONFIG_REGULATOR_TWL4030 is not set
> CONFIG_REGULATOR_WM8400=3Dy
> CONFIG_REGULATOR_WM8994=3Dm
> CONFIG_REGULATOR_QCOM_LABIBB=3Dy
> # CONFIG_RC_CORE is not set
> CONFIG_CEC_CORE=3Dm
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> CONFIG_MEDIA_SUPPORT=3Dm
> CONFIG_MEDIA_SUPPORT_FILTER=3Dy
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> =

> #
> # Media device types
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> # CONFIG_MEDIA_PLATFORM_SUPPORT is not set
> CONFIG_MEDIA_TEST_SUPPORT=3Dy
> # end of Media device types
> =

> CONFIG_VIDEO_DEV=3Dm
> CONFIG_MEDIA_CONTROLLER=3Dy
> =

> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2=3Dm
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> CONFIG_V4L2_MEM2MEM_DEV=3Dm
> CONFIG_V4L2_FWNODE=3Dm
> CONFIG_V4L2_ASYNC=3Dm
> # end of Video4Linux options
> =

> #
> # Media controller options
> #
> CONFIG_MEDIA_CONTROLLER_REQUEST_API=3Dy
> =

> #
> # Please notice that the enabled Media controller Request API is EXPERIME=
NTAL
> #
> # end of Media controller options
> =

> #
> # Media drivers
> #
> =

> #
> # Drivers filtered as selected at 'Filter media drivers'
> #
> CONFIG_MEDIA_PCI_SUPPORT=3Dy
> CONFIG_VIDEO_IPU3_CIO2=3Dm
> # CONFIG_CIO2_BRIDGE is not set
> CONFIG_VIDEOBUF2_CORE=3Dm
> CONFIG_VIDEOBUF2_V4L2=3Dm
> CONFIG_VIDEOBUF2_MEMOPS=3Dm
> CONFIG_VIDEOBUF2_VMALLOC=3Dm
> CONFIG_VIDEOBUF2_DMA_SG=3Dm
> CONFIG_VIDEO_V4L2_TPG=3Dm
> CONFIG_V4L_TEST_DRIVERS=3Dy
> CONFIG_VIDEO_VIMC=3Dm
> # CONFIG_VIDEO_VIM2M is not set
> CONFIG_VIDEO_VICODEC=3Dm
> # end of Media drivers
> =

> #
> # Media ancillary drivers
> #
> =

> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_TVAUDIO=3Dm
> CONFIG_VIDEO_TDA7432=3Dm
> # CONFIG_VIDEO_TDA9840 is not set
> CONFIG_VIDEO_TDA1997X=3Dm
> CONFIG_VIDEO_TEA6415C=3Dm
> CONFIG_VIDEO_TEA6420=3Dm
> CONFIG_VIDEO_MSP3400=3Dm
> CONFIG_VIDEO_CS3308=3Dm
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> CONFIG_VIDEO_UDA1342=3Dm
> CONFIG_VIDEO_WM8775=3Dm
> # CONFIG_VIDEO_WM8739 is not set
> CONFIG_VIDEO_VP27SMPX=3Dm
> CONFIG_VIDEO_SONY_BTF_MPX=3Dm
> # end of Audio decoders, processors and mixers
> =

> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=3Dm
> # end of RDS decoders
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7180 is not set
> CONFIG_VIDEO_ADV7183=3Dm
> # CONFIG_VIDEO_ADV7604 is not set
> CONFIG_VIDEO_ADV7842=3Dm
> CONFIG_VIDEO_ADV7842_CEC=3Dy
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> # CONFIG_VIDEO_BT866 is not set
> CONFIG_VIDEO_KS0127=3Dm
> CONFIG_VIDEO_ML86V7667=3Dm
> CONFIG_VIDEO_SAA7110=3Dm
> CONFIG_VIDEO_SAA711X=3Dm
> CONFIG_VIDEO_TC358743=3Dm
> CONFIG_VIDEO_TC358743_CEC=3Dy
> CONFIG_VIDEO_TVP514X=3Dm
> CONFIG_VIDEO_TVP5150=3Dm
> CONFIG_VIDEO_TVP7002=3Dm
> CONFIG_VIDEO_TW2804=3Dm
> CONFIG_VIDEO_TW9903=3Dm
> CONFIG_VIDEO_TW9906=3Dm
> CONFIG_VIDEO_TW9910=3Dm
> CONFIG_VIDEO_VPX3220=3Dm
> =

> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=3Dm
> CONFIG_VIDEO_CX25840=3Dm
> # end of Video decoders
> =

> #
> # Video encoders
> #
> CONFIG_VIDEO_SAA7127=3Dm
> CONFIG_VIDEO_SAA7185=3Dm
> # CONFIG_VIDEO_ADV7170 is not set
> CONFIG_VIDEO_ADV7175=3Dm
> # CONFIG_VIDEO_ADV7343 is not set
> CONFIG_VIDEO_ADV7393=3Dm
> CONFIG_VIDEO_ADV7511=3Dm
> # CONFIG_VIDEO_ADV7511_CEC is not set
> CONFIG_VIDEO_AD9389B=3Dm
> CONFIG_VIDEO_AK881X=3Dm
> CONFIG_VIDEO_THS8200=3Dm
> # end of Video encoders
> =

> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=3Dm
> CONFIG_VIDEO_UPD64083=3Dm
> # end of Video improvement chips
> =

> #
> # Audio/Video compression chips
> #
> # CONFIG_VIDEO_SAA6752HS is not set
> # end of Audio/Video compression chips
> =

> #
> # SDR tuner chips
> #
> CONFIG_SDR_MAX2175=3Dm
> # end of SDR tuner chips
> =

> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_THS7303 is not set
> CONFIG_VIDEO_M52790=3Dm
> # CONFIG_VIDEO_I2C is not set
> CONFIG_VIDEO_ST_MIPID02=3Dm
> # end of Miscellaneous helper chips
> =

> #
> # SPI helper chips
> #
> # CONFIG_VIDEO_GS1662 is not set
> # end of SPI helper chips
> =

> #
> # Media SPI Adapters
> #
> # end of Media SPI Adapters
> =

> CONFIG_MEDIA_TUNER=3Dm
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> # CONFIG_MEDIA_TUNER_TDA18250 is not set
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> # CONFIG_MEDIA_TUNER_TEA5767 is not set
> CONFIG_MEDIA_TUNER_MSI001=3Dm
> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> # CONFIG_MEDIA_TUNER_MT2060 is not set
> # CONFIG_MEDIA_TUNER_MT2063 is not set
> CONFIG_MEDIA_TUNER_MT2266=3Dm
> CONFIG_MEDIA_TUNER_MT2131=3Dm
> CONFIG_MEDIA_TUNER_QT1010=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dm
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> # CONFIG_MEDIA_TUNER_MAX2165 is not set
> CONFIG_MEDIA_TUNER_TDA18218=3Dm
> # CONFIG_MEDIA_TUNER_FC0011 is not set
> # CONFIG_MEDIA_TUNER_FC0012 is not set
> CONFIG_MEDIA_TUNER_FC0013=3Dm
> # CONFIG_MEDIA_TUNER_TDA18212 is not set
> # CONFIG_MEDIA_TUNER_E4000 is not set
> CONFIG_MEDIA_TUNER_FC2580=3Dm
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> # CONFIG_MEDIA_TUNER_TUA9001 is not set
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> # CONFIG_MEDIA_TUNER_IT913X is not set
> CONFIG_MEDIA_TUNER_R820T=3Dm
> CONFIG_MEDIA_TUNER_MXL301RF=3Dm
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> # end of Customize TV tuners
> =

> #
> # Tools to develop new frontends
> #
> # end of Media ancillary drivers
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> # CONFIG_DRM is not set
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> #
> # Frame buffer Devices
> #
> # CONFIG_FB is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> # CONFIG_LCD_L4F00242T03 is not set
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> # CONFIG_LCD_ILI922X is not set
> CONFIG_LCD_ILI9320=3Dm
> CONFIG_LCD_TDO24M=3Dy
> CONFIG_LCD_VGG2432A4=3Dm
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_LCD_AMS369FG06=3Dy
> # CONFIG_LCD_LMS501KF03 is not set
> # CONFIG_LCD_HX8357 is not set
> CONFIG_LCD_OTM3225A=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_KTD253=3Dy
> CONFIG_BACKLIGHT_LM3533=3Dm
> CONFIG_BACKLIGHT_DA903X=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_QCOM_WLED=3Dm
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dm
> CONFIG_BACKLIGHT_ADP8870=3Dm
> CONFIG_BACKLIGHT_88PM860X=3Dm
> CONFIG_BACKLIGHT_PCF50633=3Dm
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_PANDORA=3Dy
> CONFIG_BACKLIGHT_SKY81452=3Dm
> CONFIG_BACKLIGHT_GPIO=3Dm
> CONFIG_BACKLIGHT_LV5207LP=3Dm
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> # end of Graphics support
> =

> CONFIG_SOUND=3Dy
> CONFIG_SND=3Dy
> CONFIG_SND_TIMER=3Dy
> CONFIG_SND_PCM=3Dy
> CONFIG_SND_DMAENGINE_PCM=3Dy
> CONFIG_SND_HWDEP=3Dy
> CONFIG_SND_SEQ_DEVICE=3Dy
> CONFIG_SND_RAWMIDI=3Dy
> CONFIG_SND_COMPRESS_OFFLOAD=3Dy
> CONFIG_SND_JACK=3Dy
> CONFIG_SND_JACK_INPUT_DEV=3Dy
> # CONFIG_SND_OSSEMUL is not set
> # CONFIG_SND_PCM_TIMER is not set
> CONFIG_SND_HRTIMER=3Dy
> CONFIG_SND_DYNAMIC_MINORS=3Dy
> CONFIG_SND_MAX_CARDS=3D32
> # CONFIG_SND_SUPPORT_OLD_API is not set
> CONFIG_SND_PROC_FS=3Dy
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> CONFIG_SND_VERBOSE_PRINTK=3Dy
> CONFIG_SND_DEBUG=3Dy
> CONFIG_SND_DEBUG_VERBOSE=3Dy
> # CONFIG_SND_PCM_XRUN_DEBUG is not set
> CONFIG_SND_CTL_VALIDATION=3Dy
> CONFIG_SND_JACK_INJECTION_DEBUG=3Dy
> CONFIG_SND_DMA_SGBUF=3Dy
> CONFIG_SND_SEQUENCER=3Dy
> CONFIG_SND_SEQ_DUMMY=3Dy
> # CONFIG_SND_SEQ_HRTIMER_DEFAULT is not set
> CONFIG_SND_SEQ_MIDI_EVENT=3Dy
> CONFIG_SND_SEQ_MIDI=3Dy
> CONFIG_SND_SEQ_MIDI_EMUL=3Dy
> CONFIG_SND_MPU401_UART=3Dy
> CONFIG_SND_OPL3_LIB=3Dy
> CONFIG_SND_OPL4_LIB=3Dm
> CONFIG_SND_OPL3_LIB_SEQ=3Dy
> CONFIG_SND_OPL4_LIB_SEQ=3Dm
> # CONFIG_SND_DRIVERS is not set
> CONFIG_SND_WSS_LIB=3Dy
> CONFIG_SND_SB_COMMON=3Dy
> CONFIG_SND_SB8_DSP=3Dy
> CONFIG_SND_SB16_DSP=3Dy
> CONFIG_SND_ISA=3Dy
> CONFIG_SND_ADLIB=3Dm
> CONFIG_SND_AD1816A=3Dm
> CONFIG_SND_AD1848=3Dy
> # CONFIG_SND_ALS100 is not set
> CONFIG_SND_AZT1605=3Dy
> # CONFIG_SND_AZT2316 is not set
> CONFIG_SND_AZT2320=3Dy
> # CONFIG_SND_CMI8328 is not set
> CONFIG_SND_CMI8330=3Dy
> CONFIG_SND_CS4231=3Dm
> CONFIG_SND_CS4236=3Dy
> # CONFIG_SND_ES1688 is not set
> # CONFIG_SND_ES18XX is not set
> CONFIG_SND_SC6000=3Dy
> CONFIG_SND_GUSCLASSIC=3Dm
> CONFIG_SND_GUSEXTREME=3Dy
> CONFIG_SND_GUSMAX=3Dy
> CONFIG_SND_INTERWAVE=3Dm
> # CONFIG_SND_INTERWAVE_STB is not set
> # CONFIG_SND_JAZZ16 is not set
> CONFIG_SND_OPL3SA2=3Dy
> CONFIG_SND_OPTI92X_AD1848=3Dm
> CONFIG_SND_OPTI92X_CS4231=3Dm
> CONFIG_SND_OPTI93X=3Dm
> CONFIG_SND_MIRO=3Dm
> CONFIG_SND_SB8=3Dy
> # CONFIG_SND_SB16 is not set
> # CONFIG_SND_SBAWE is not set
> CONFIG_SND_SSCAPE=3Dy
> CONFIG_SND_WAVEFRONT=3Dy
> CONFIG_SND_MSND_PINNACLE=3Dm
> # CONFIG_SND_MSND_CLASSIC is not set
> # CONFIG_SND_PCI is not set
> =

> #
> # HD-Audio
> #
> # end of HD-Audio
> =

> CONFIG_SND_HDA_PREALLOC_SIZE=3D0
> CONFIG_SND_INTEL_NHLT=3Dy
> CONFIG_SND_INTEL_DSP_CONFIG=3Dy
> CONFIG_SND_INTEL_SOUNDWIRE_ACPI=3Dy
> CONFIG_SND_SPI=3Dy
> CONFIG_SND_SOC=3Dy
> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> CONFIG_SND_SOC_COMPRESS=3Dy
> CONFIG_SND_SOC_TOPOLOGY=3Dy
> CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST=3Dy
> CONFIG_SND_SOC_ACPI=3Dy
> CONFIG_SND_SOC_ADI=3Dy
> # CONFIG_SND_SOC_ADI_AXI_I2S is not set
> CONFIG_SND_SOC_ADI_AXI_SPDIF=3Dy
> # CONFIG_SND_SOC_AMD_ACP is not set
> CONFIG_SND_SOC_AMD_ACP3x=3Dy
> # CONFIG_SND_SOC_AMD_RV_RT5682_MACH is not set
> CONFIG_SND_SOC_AMD_RENOIR=3Dy
> CONFIG_SND_SOC_AMD_RENOIR_MACH=3Dy
> # CONFIG_SND_SOC_AMD_ACP5x is not set
> CONFIG_SND_ATMEL_SOC=3Dy
> # CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
> # CONFIG_SND_DESIGNWARE_I2S is not set
> =

> #
> # SoC Audio for Freescale CPUs
> #
> =

> #
> # Common SoC Audio options for Freescale CPUs:
> #
> CONFIG_SND_SOC_FSL_ASRC=3Dy
> # CONFIG_SND_SOC_FSL_SAI is not set
> CONFIG_SND_SOC_FSL_AUDMIX=3Dy
> # CONFIG_SND_SOC_FSL_SSI is not set
> CONFIG_SND_SOC_FSL_SPDIF=3Dm
> # CONFIG_SND_SOC_FSL_ESAI is not set
> CONFIG_SND_SOC_FSL_MICFIL=3Dy
> # CONFIG_SND_SOC_FSL_EASRC is not set
> CONFIG_SND_SOC_FSL_XCVR=3Dm
> # CONFIG_SND_SOC_FSL_RPMSG is not set
> # CONFIG_SND_SOC_IMX_AUDMUX is not set
> # end of SoC Audio for Freescale CPUs
> =

> CONFIG_SND_I2S_HI6210_I2S=3Dy
> CONFIG_SND_SOC_IMG=3Dy
> # CONFIG_SND_SOC_IMG_I2S_IN is not set
> # CONFIG_SND_SOC_IMG_I2S_OUT is not set
> CONFIG_SND_SOC_IMG_PARALLEL_OUT=3Dy
> CONFIG_SND_SOC_IMG_SPDIF_IN=3Dy
> # CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
> CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=3Dm
> # CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
> CONFIG_SND_SOC_ACPI_INTEL_MATCH=3Dy
> CONFIG_SND_SOC_INTEL_MACH=3Dy
> CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES=3Dy
> # CONFIG_SND_SOC_INTEL_SOF_WM8804_MACH is not set
> # CONFIG_SND_SOC_MTK_BTCVSD is not set
> CONFIG_SND_SOC_SOF_TOPLEVEL=3Dy
> CONFIG_SND_SOC_SOF_PCI_DEV=3Dm
> CONFIG_SND_SOC_SOF_PCI=3Dm
> CONFIG_SND_SOC_SOF_ACPI=3Dy
> CONFIG_SND_SOC_SOF_ACPI_DEV=3Dy
> CONFIG_SND_SOC_SOF_DEBUG_PROBES=3Dy
> # CONFIG_SND_SOC_SOF_DEVELOPER_SUPPORT is not set
> CONFIG_SND_SOC_SOF=3Dy
> CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=3Dy
> CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC=3Dy
> CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP=3Dy
> CONFIG_SND_SOC_SOF_INTEL_COMMON=3Dy
> CONFIG_SND_SOC_SOF_BAYTRAIL=3Dy
> # CONFIG_SND_SOC_SOF_BROADWELL is not set
> CONFIG_SND_SOC_SOF_MERRIFIELD=3Dm
> CONFIG_SND_SOC_SOF_INTEL_APL=3Dm
> CONFIG_SND_SOC_SOF_APOLLOLAKE=3Dm
> CONFIG_SND_SOC_SOF_GEMINILAKE=3Dm
> CONFIG_SND_SOC_SOF_INTEL_CNL=3Dm
> # CONFIG_SND_SOC_SOF_CANNONLAKE is not set
> CONFIG_SND_SOC_SOF_COFFEELAKE=3Dm
> CONFIG_SND_SOC_SOF_COMETLAKE=3Dm
> CONFIG_SND_SOC_SOF_INTEL_ICL=3Dm
> CONFIG_SND_SOC_SOF_ICELAKE=3Dm
> CONFIG_SND_SOC_SOF_JASPERLAKE=3Dm
> CONFIG_SND_SOC_SOF_INTEL_TGL=3Dm
> CONFIG_SND_SOC_SOF_TIGERLAKE=3Dm
> CONFIG_SND_SOC_SOF_ELKHARTLAKE=3Dm
> CONFIG_SND_SOC_SOF_ALDERLAKE=3Dm
> CONFIG_SND_SOC_SOF_HDA_COMMON=3Dm
> # CONFIG_SND_SOC_SOF_HDA_LINK is not set
> CONFIG_SND_SOC_SOF_HDA_PROBES=3Dy
> CONFIG_SND_SOC_SOF_HDA_LINK_BASELINE=3Dm
> CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=3Dm
> # CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE is not set
> CONFIG_SND_SOC_SOF_XTENSA=3Dy
> =

> #
> # STMicroelectronics STM32 SOC audio support
> #
> # end of STMicroelectronics STM32 SOC audio support
> =

> # CONFIG_SND_SOC_XILINX_I2S is not set
> CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=3Dy
> CONFIG_SND_SOC_XILINX_SPDIF=3Dy
> CONFIG_SND_SOC_XTFPGA_I2S=3Dy
> CONFIG_SND_SOC_I2C_AND_SPI=3Dy
> =

> #
> # CODEC drivers
> #
> # CONFIG_SND_SOC_AC97_CODEC is not set
> CONFIG_SND_SOC_ADAU_UTILS=3Dy
> CONFIG_SND_SOC_ADAU1372=3Dy
> CONFIG_SND_SOC_ADAU1372_I2C=3Dy
> CONFIG_SND_SOC_ADAU1372_SPI=3Dm
> CONFIG_SND_SOC_ADAU1701=3Dy
> CONFIG_SND_SOC_ADAU17X1=3Dm
> CONFIG_SND_SOC_ADAU1761=3Dm
> CONFIG_SND_SOC_ADAU1761_I2C=3Dm
> # CONFIG_SND_SOC_ADAU1761_SPI is not set
> CONFIG_SND_SOC_ADAU7002=3Dm
> CONFIG_SND_SOC_ADAU7118=3Dm
> CONFIG_SND_SOC_ADAU7118_HW=3Dm
> CONFIG_SND_SOC_ADAU7118_I2C=3Dm
> CONFIG_SND_SOC_AK4104=3Dm
> # CONFIG_SND_SOC_AK4118 is not set
> CONFIG_SND_SOC_AK4458=3Dy
> # CONFIG_SND_SOC_AK4554 is not set
> CONFIG_SND_SOC_AK4613=3Dy
> # CONFIG_SND_SOC_AK4642 is not set
> CONFIG_SND_SOC_AK5386=3Dm
> CONFIG_SND_SOC_AK5558=3Dm
> # CONFIG_SND_SOC_ALC5623 is not set
> # CONFIG_SND_SOC_BD28623 is not set
> CONFIG_SND_SOC_BT_SCO=3Dy
> CONFIG_SND_SOC_CROS_EC_CODEC=3Dy
> CONFIG_SND_SOC_CS35L32=3Dm
> CONFIG_SND_SOC_CS35L33=3Dy
> CONFIG_SND_SOC_CS35L34=3Dm
> CONFIG_SND_SOC_CS35L35=3Dy
> CONFIG_SND_SOC_CS35L36=3Dy
> CONFIG_SND_SOC_CS42L42=3Dm
> CONFIG_SND_SOC_CS42L51=3Dm
> CONFIG_SND_SOC_CS42L51_I2C=3Dm
> # CONFIG_SND_SOC_CS42L52 is not set
> # CONFIG_SND_SOC_CS42L56 is not set
> CONFIG_SND_SOC_CS42L73=3Dy
> CONFIG_SND_SOC_CS4234=3Dm
> CONFIG_SND_SOC_CS4265=3Dm
> # CONFIG_SND_SOC_CS4270 is not set
> # CONFIG_SND_SOC_CS4271_I2C is not set
> # CONFIG_SND_SOC_CS4271_SPI is not set
> CONFIG_SND_SOC_CS42XX8=3Dy
> CONFIG_SND_SOC_CS42XX8_I2C=3Dy
> CONFIG_SND_SOC_CS43130=3Dm
> # CONFIG_SND_SOC_CS4341 is not set
> # CONFIG_SND_SOC_CS4349 is not set
> # CONFIG_SND_SOC_CS53L30 is not set
> CONFIG_SND_SOC_CX2072X=3Dy
> CONFIG_SND_SOC_DA7213=3Dy
> CONFIG_SND_SOC_DMIC=3Dy
> CONFIG_SND_SOC_ES7134=3Dm
> CONFIG_SND_SOC_ES7241=3Dy
> CONFIG_SND_SOC_ES8316=3Dy
> CONFIG_SND_SOC_ES8328=3Dm
> # CONFIG_SND_SOC_ES8328_I2C is not set
> CONFIG_SND_SOC_ES8328_SPI=3Dm
> CONFIG_SND_SOC_GTM601=3Dy
> CONFIG_SND_SOC_ICS43432=3Dy
> CONFIG_SND_SOC_INNO_RK3036=3Dm
> CONFIG_SND_SOC_MAX98088=3Dy
> CONFIG_SND_SOC_MAX98357A=3Dy
> CONFIG_SND_SOC_MAX98504=3Dm
> CONFIG_SND_SOC_MAX9867=3Dy
> CONFIG_SND_SOC_MAX98927=3Dm
> CONFIG_SND_SOC_MAX98373=3Dm
> CONFIG_SND_SOC_MAX98373_I2C=3Dm
> CONFIG_SND_SOC_MAX98373_SDW=3Dm
> # CONFIG_SND_SOC_MAX98390 is not set
> CONFIG_SND_SOC_MAX9860=3Dm
> CONFIG_SND_SOC_MSM8916_WCD_ANALOG=3Dy
> CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dm
> CONFIG_SND_SOC_PCM1681=3Dy
> # CONFIG_SND_SOC_PCM1789_I2C is not set
> CONFIG_SND_SOC_PCM179X=3Dy
> CONFIG_SND_SOC_PCM179X_I2C=3Dy
> # CONFIG_SND_SOC_PCM179X_SPI is not set
> CONFIG_SND_SOC_PCM186X=3Dm
> CONFIG_SND_SOC_PCM186X_I2C=3Dm
> # CONFIG_SND_SOC_PCM186X_SPI is not set
> CONFIG_SND_SOC_PCM3060=3Dm
> # CONFIG_SND_SOC_PCM3060_I2C is not set
> CONFIG_SND_SOC_PCM3060_SPI=3Dm
> CONFIG_SND_SOC_PCM3168A=3Dm
> CONFIG_SND_SOC_PCM3168A_I2C=3Dm
> # CONFIG_SND_SOC_PCM3168A_SPI is not set
> # CONFIG_SND_SOC_PCM5102A is not set
> CONFIG_SND_SOC_PCM512x=3Dy
> CONFIG_SND_SOC_PCM512x_I2C=3Dy
> CONFIG_SND_SOC_PCM512x_SPI=3Dy
> CONFIG_SND_SOC_RK3328=3Dm
> CONFIG_SND_SOC_RL6231=3Dy
> CONFIG_SND_SOC_RT1308_SDW=3Dm
> CONFIG_SND_SOC_RT1316_SDW=3Dm
> CONFIG_SND_SOC_RT5616=3Dy
> CONFIG_SND_SOC_RT5631=3Dy
> # CONFIG_SND_SOC_RT5640 is not set
> CONFIG_SND_SOC_RT5659=3Dy
> CONFIG_SND_SOC_RT5682=3Dm
> CONFIG_SND_SOC_RT5682_SDW=3Dm
> # CONFIG_SND_SOC_RT700_SDW is not set
> # CONFIG_SND_SOC_RT711_SDW is not set
> CONFIG_SND_SOC_RT711_SDCA_SDW=3Dm
> CONFIG_SND_SOC_RT715=3Dm
> CONFIG_SND_SOC_RT715_SDW=3Dm
> CONFIG_SND_SOC_RT715_SDCA_SDW=3Dm
> # CONFIG_SND_SOC_SDW_MOCKUP is not set
> CONFIG_SND_SOC_SGTL5000=3Dm
> CONFIG_SND_SOC_SIGMADSP=3Dy
> CONFIG_SND_SOC_SIGMADSP_I2C=3Dy
> CONFIG_SND_SOC_SIGMADSP_REGMAP=3Dm
> CONFIG_SND_SOC_SIMPLE_AMPLIFIER=3Dy
> CONFIG_SND_SOC_SIMPLE_MUX=3Dm
> CONFIG_SND_SOC_SPDIF=3Dm
> CONFIG_SND_SOC_SSM2305=3Dm
> CONFIG_SND_SOC_SSM2518=3Dy
> CONFIG_SND_SOC_SSM2602=3Dy
> CONFIG_SND_SOC_SSM2602_SPI=3Dy
> # CONFIG_SND_SOC_SSM2602_I2C is not set
> # CONFIG_SND_SOC_SSM4567 is not set
> # CONFIG_SND_SOC_STA32X is not set
> CONFIG_SND_SOC_STA350=3Dy
> CONFIG_SND_SOC_STI_SAS=3Dy
> # CONFIG_SND_SOC_TAS2552 is not set
> CONFIG_SND_SOC_TAS2562=3Dm
> CONFIG_SND_SOC_TAS2764=3Dm
> CONFIG_SND_SOC_TAS2770=3Dm
> # CONFIG_SND_SOC_TAS5086 is not set
> CONFIG_SND_SOC_TAS571X=3Dy
> CONFIG_SND_SOC_TAS5720=3Dm
> CONFIG_SND_SOC_TAS6424=3Dm
> CONFIG_SND_SOC_TDA7419=3Dy
> CONFIG_SND_SOC_TFA9879=3Dm
> # CONFIG_SND_SOC_TFA989X is not set
> CONFIG_SND_SOC_TLV320AIC23=3Dm
> CONFIG_SND_SOC_TLV320AIC23_I2C=3Dm
> # CONFIG_SND_SOC_TLV320AIC23_SPI is not set
> CONFIG_SND_SOC_TLV320AIC31XX=3Dy
> CONFIG_SND_SOC_TLV320AIC32X4=3Dm
> CONFIG_SND_SOC_TLV320AIC32X4_I2C=3Dm
> CONFIG_SND_SOC_TLV320AIC32X4_SPI=3Dm
> CONFIG_SND_SOC_TLV320AIC3X=3Dy
> CONFIG_SND_SOC_TLV320AIC3X_I2C=3Dm
> CONFIG_SND_SOC_TLV320AIC3X_SPI=3Dy
> # CONFIG_SND_SOC_TLV320ADCX140 is not set
> CONFIG_SND_SOC_TS3A227E=3Dm
> CONFIG_SND_SOC_TSCS42XX=3Dm
> # CONFIG_SND_SOC_TSCS454 is not set
> # CONFIG_SND_SOC_UDA1334 is not set
> # CONFIG_SND_SOC_WCD9335 is not set
> CONFIG_SND_SOC_WCD_MBHC=3Dm
> CONFIG_SND_SOC_WCD934X=3Dm
> CONFIG_SND_SOC_WCD938X=3Dm
> CONFIG_SND_SOC_WCD938X_SDW=3Dm
> # CONFIG_SND_SOC_WM8510 is not set
> CONFIG_SND_SOC_WM8523=3Dy
> CONFIG_SND_SOC_WM8524=3Dy
> # CONFIG_SND_SOC_WM8580 is not set
> CONFIG_SND_SOC_WM8711=3Dm
> # CONFIG_SND_SOC_WM8728 is not set
> CONFIG_SND_SOC_WM8731=3Dy
> # CONFIG_SND_SOC_WM8737 is not set
> # CONFIG_SND_SOC_WM8741 is not set
> CONFIG_SND_SOC_WM8750=3Dy
> CONFIG_SND_SOC_WM8753=3Dy
> CONFIG_SND_SOC_WM8770=3Dm
> CONFIG_SND_SOC_WM8776=3Dm
> # CONFIG_SND_SOC_WM8782 is not set
> # CONFIG_SND_SOC_WM8804_I2C is not set
> # CONFIG_SND_SOC_WM8804_SPI is not set
> CONFIG_SND_SOC_WM8903=3Dm
> CONFIG_SND_SOC_WM8904=3Dy
> # CONFIG_SND_SOC_WM8960 is not set
> # CONFIG_SND_SOC_WM8962 is not set
> CONFIG_SND_SOC_WM8974=3Dy
> # CONFIG_SND_SOC_WM8978 is not set
> # CONFIG_SND_SOC_WM8985 is not set
> CONFIG_SND_SOC_WSA881X=3Dm
> CONFIG_SND_SOC_ZL38060=3Dm
> CONFIG_SND_SOC_MAX9759=3Dm
> # CONFIG_SND_SOC_MT6351 is not set
> CONFIG_SND_SOC_MT6358=3Dy
> CONFIG_SND_SOC_MT6660=3Dm
> CONFIG_SND_SOC_NAU8315=3Dy
> CONFIG_SND_SOC_NAU8540=3Dm
> CONFIG_SND_SOC_NAU8810=3Dm
> CONFIG_SND_SOC_NAU8822=3Dy
> CONFIG_SND_SOC_NAU8824=3Dy
> # CONFIG_SND_SOC_TPA6130A2 is not set
> # CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
> CONFIG_SND_SOC_LPASS_VA_MACRO=3Dy
> CONFIG_SND_SOC_LPASS_RX_MACRO=3Dm
> CONFIG_SND_SOC_LPASS_TX_MACRO=3Dm
> # end of CODEC drivers
> =

> CONFIG_SND_SIMPLE_CARD_UTILS=3Dy
> CONFIG_SND_SIMPLE_CARD=3Dy
> # CONFIG_SND_X86 is not set
> # CONFIG_SND_VIRTIO is not set
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
> # CONFIG_HID_SEMITEK is not set
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
> # end of I2C HID support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> # CONFIG_TYPEC is not set
> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dm
> CONFIG_MMC_BLOCK=3Dm
> CONFIG_MMC_BLOCK_MINORS=3D8
> # CONFIG_SDIO_UART is not set
> # CONFIG_MMC_TEST is not set
> # CONFIG_MMC_CRYPTO is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dm
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dm
> CONFIG_MMC_RICOH_MMC=3Dy
> CONFIG_MMC_SDHCI_ACPI=3Dm
> CONFIG_MMC_SDHCI_PLTFM=3Dm
> CONFIG_MMC_SDHCI_F_SDH30=3Dm
> CONFIG_MMC_WBSD=3Dm
> CONFIG_MMC_ALCOR=3Dm
> CONFIG_MMC_TIFM_SD=3Dm
> CONFIG_MMC_SPI=3Dm
> CONFIG_MMC_CB710=3Dm
> CONFIG_MMC_VIA_SDMMC=3Dm
> CONFIG_MMC_USDHI6ROL0=3Dm
> CONFIG_MMC_REALTEK_PCI=3Dm
> CONFIG_MMC_CQHCI=3Dm
> CONFIG_MMC_HSQ=3Dm
> CONFIG_MMC_TOSHIBA_PCI=3Dm
> CONFIG_MMC_MTK=3Dm
> # CONFIG_MMC_SDHCI_XENON is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_CLASS_MULTICOLOR=3Dm
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> CONFIG_LEDS_APU=3Dy
> CONFIG_LEDS_LM3530=3Dm
> # CONFIG_LEDS_LM3532 is not set
> CONFIG_LEDS_LM3533=3Dm
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP50XX=3Dm
> # CONFIG_LEDS_CLEVO_MAIL is not set
> CONFIG_LEDS_PCA955X=3Dm
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=3Dy
> # CONFIG_LEDS_DA903X is not set
> # CONFIG_LEDS_DAC124S085 is not set
> CONFIG_LEDS_REGULATOR=3Dm
> # CONFIG_LEDS_BD2802 is not set
> # CONFIG_LEDS_INTEL_SS4200 is not set
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_MC13783=3Dy
> CONFIG_LEDS_TCA6507=3Dy
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_LM355x is not set
> CONFIG_LEDS_OT200=3Dm
> CONFIG_LEDS_MENF21BMC=3Dm
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> CONFIG_LEDS_MLXCPLD=3Dy
> CONFIG_LEDS_MLXREG=3Dm
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> # CONFIG_LEDS_TPS6105X is not set
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
> # CONFIG_LEDS_TRIGGER_DISK is not set
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> # CONFIG_LEDS_TRIGGER_GPIO is not set
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> # CONFIG_LEDS_TRIGGER_TRANSIENT is not set
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> CONFIG_LEDS_TRIGGER_PATTERN=3Dy
> CONFIG_LEDS_TRIGGER_AUDIO=3Dy
> # CONFIG_LEDS_TRIGGER_TTY is not set
> CONFIG_ACCESSIBILITY=3Dy
> =

> #
> # Speakup console speech
> #
> # end of Speakup console speech
> =

> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_SYSTOHC is not set
> CONFIG_RTC_DEBUG=3Dy
> # CONFIG_RTC_LIB_KUNIT_TEST is not set
> # CONFIG_RTC_NVMEM is not set
> =

> #
> # RTC interfaces
> #
> # CONFIG_RTC_INTF_SYSFS is not set
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
> CONFIG_RTC_DRV_TEST=3Dm
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM860X=3Dm
> # CONFIG_RTC_DRV_88PM80X is not set
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> CONFIG_RTC_DRV_ABX80X=3Dm
> CONFIG_RTC_DRV_DS1307=3Dy
> CONFIG_RTC_DRV_DS1307_CENTURY=3Dy
> CONFIG_RTC_DRV_DS1374=3Dy
> CONFIG_RTC_DRV_DS1374_WDT=3Dy
> # CONFIG_RTC_DRV_DS1672 is not set
> CONFIG_RTC_DRV_MAX6900=3Dm
> CONFIG_RTC_DRV_MAX8907=3Dm
> CONFIG_RTC_DRV_RS5C372=3Dy
> CONFIG_RTC_DRV_ISL1208=3Dm
> # CONFIG_RTC_DRV_ISL12022 is not set
> CONFIG_RTC_DRV_X1205=3Dy
> # CONFIG_RTC_DRV_PCF8523 is not set
> # CONFIG_RTC_DRV_PCF85063 is not set
> CONFIG_RTC_DRV_PCF85363=3Dy
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dy
> CONFIG_RTC_DRV_M41T80=3Dm
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dm
> CONFIG_RTC_DRV_PALMAS=3Dm
> CONFIG_RTC_DRV_TPS6586X=3Dy
> CONFIG_RTC_DRV_TPS80031=3Dm
> CONFIG_RTC_DRV_RC5T583=3Dy
> CONFIG_RTC_DRV_S35390A=3Dm
> CONFIG_RTC_DRV_FM3130=3Dy
> CONFIG_RTC_DRV_RX8010=3Dy
> # CONFIG_RTC_DRV_RX8581 is not set
> CONFIG_RTC_DRV_RX8025=3Dm
> # CONFIG_RTC_DRV_EM3027 is not set
> # CONFIG_RTC_DRV_RV3028 is not set
> CONFIG_RTC_DRV_RV3032=3Dm
> # CONFIG_RTC_DRV_RV8803 is not set
> # CONFIG_RTC_DRV_SD3078 is not set
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_DRV_M41T93=3Dm
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1302 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> CONFIG_RTC_DRV_DS1343=3Dm
> CONFIG_RTC_DRV_DS1347=3Dy
> CONFIG_RTC_DRV_DS1390=3Dm
> # CONFIG_RTC_DRV_MAX6916 is not set
> CONFIG_RTC_DRV_R9701=3Dm
> CONFIG_RTC_DRV_RX4581=3Dy
> # CONFIG_RTC_DRV_RS5C348 is not set
> CONFIG_RTC_DRV_MAX6902=3Dm
> CONFIG_RTC_DRV_PCF2123=3Dm
> CONFIG_RTC_DRV_MCP795=3Dm
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dm
> # CONFIG_RTC_DRV_DS3232_HWMON is not set
> CONFIG_RTC_DRV_PCF2127=3Dy
> # CONFIG_RTC_DRV_RV3029C2 is not set
> CONFIG_RTC_DRV_RX6110=3Dy
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dy
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dy
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_DS2404=3Dy
> CONFIG_RTC_DRV_DA9055=3Dm
> CONFIG_RTC_DRV_DA9063=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dm
> CONFIG_RTC_DRV_M48T86=3Dy
> # CONFIG_RTC_DRV_M48T35 is not set
> # CONFIG_RTC_DRV_M48T59 is not set
> # CONFIG_RTC_DRV_MSM6242 is not set
> CONFIG_RTC_DRV_BQ4802=3Dm
> CONFIG_RTC_DRV_RP5C01=3Dy
> # CONFIG_RTC_DRV_V3020 is not set
> CONFIG_RTC_DRV_PCF50633=3Dm
> CONFIG_RTC_DRV_CROS_EC=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_FTRTC010 is not set
> CONFIG_RTC_DRV_MC13XXX=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_GOLDFISH is not set
> # CONFIG_RTC_DRV_WILCO_EC is not set
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> # CONFIG_SYNC_FILE is not set
> CONFIG_UDMABUF=3Dy
> CONFIG_DMABUF_MOVE_NOTIFY=3Dy
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> CONFIG_DMABUF_HEAPS=3Dy
> # CONFIG_DMABUF_SYSFS_STATS is not set
> # CONFIG_DMABUF_HEAPS_SYSTEM is not set
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dm
> CONFIG_HD44780_COMMON=3Dm
> # CONFIG_HD44780 is not set
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_LCD2S=3Dm
> CONFIG_PARPORT_PANEL=3Dm
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> CONFIG_CHARLCD_BL_OFF=3Dy
> # CONFIG_CHARLCD_BL_ON is not set
> # CONFIG_CHARLCD_BL_FLASH is not set
> CONFIG_PANEL=3Dm
> CONFIG_UIO=3Dm
> CONFIG_UIO_CIF=3Dm
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> # CONFIG_UIO_DMEM_GENIRQ is not set
> CONFIG_UIO_AEC=3Dm
> CONFIG_UIO_SERCOS3=3Dm
> # CONFIG_UIO_PCI_GENERIC is not set
> CONFIG_UIO_NETX=3Dm
> CONFIG_UIO_PRUSS=3Dm
> # CONFIG_UIO_MF624 is not set
> # CONFIG_VFIO is not set
> CONFIG_IRQ_BYPASS_MANAGER=3Dy
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dm
> # CONFIG_VIRTIO_MENU is not set
> # CONFIG_VDPA is not set
> # CONFIG_VHOST_MENU is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACPI_WMI=3Dm
> # CONFIG_WMI_BMOF is not set
> # CONFIG_MXM_WMI is not set
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_XIAOMI_WMI is not set
> CONFIG_GIGABYTE_WMI=3Dm
> CONFIG_ACERHDF=3Dm
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_ACER_WMI is not set
> CONFIG_AMD_PMC=3Dm
> # CONFIG_ADV_SWBUTTON is not set
> CONFIG_APPLE_GMUX=3Dy
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_MERAKI_MX100 is not set
> CONFIG_X86_PLATFORM_DRIVERS_DELL=3Dy
> # CONFIG_ALIENWARE_WMI is not set
> CONFIG_DCDBAS=3Dm
> # CONFIG_DELL_LAPTOP is not set
> # CONFIG_DELL_RBU is not set
> CONFIG_DELL_RBTN=3Dm
> CONFIG_DELL_SMBIOS=3Dm
> CONFIG_DELL_SMBIOS_WMI=3Dy
> # CONFIG_DELL_SMBIOS_SMM is not set
> # CONFIG_DELL_SMO8800 is not set
> CONFIG_DELL_WMI=3Dm
> # CONFIG_DELL_WMI_PRIVACY is not set
> CONFIG_DELL_WMI_AIO=3Dm
> CONFIG_DELL_WMI_DESCRIPTOR=3Dm
> CONFIG_DELL_WMI_LED=3Dm
> CONFIG_DELL_WMI_SYSMAN=3Dm
> CONFIG_AMILO_RFKILL=3Dm
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> CONFIG_GPD_POCKET_FAN=3Dm
> # CONFIG_HP_ACCEL is not set
> # CONFIG_WIRELESS_HOTKEY is not set
> # CONFIG_HP_WMI is not set
> # CONFIG_TC1100_WMI is not set
> # CONFIG_IBM_RTL is not set
> # CONFIG_IDEAPAD_LAPTOP is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_THINKPAD_LMI is not set
> # CONFIG_X86_PLATFORM_DRIVERS_INTEL is not set
> # CONFIG_MSI_LAPTOP is not set
> # CONFIG_MSI_WMI is not set
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> CONFIG_SAMSUNG_Q10=3Dy
> # CONFIG_ACPI_TOSHIBA is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> # CONFIG_ACPI_CMPC is not set
> CONFIG_COMPAL_LAPTOP=3Dm
> # CONFIG_LG_LAPTOP is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SONY_LAPTOP is not set
> CONFIG_SYSTEM76_ACPI=3Dm
> # CONFIG_TOPSTAR_LAPTOP is not set
> CONFIG_I2C_MULTI_INSTANTIATE=3Dm
> CONFIG_MLX_PLATFORM=3Dm
> CONFIG_FW_ATTR_CLASS=3Dm
> CONFIG_INTEL_IPS=3Dy
> CONFIG_INTEL_SCU_IPC=3Dy
> CONFIG_INTEL_SCU=3Dy
> CONFIG_INTEL_SCU_PCI=3Dy
> # CONFIG_INTEL_SCU_PLATFORM is not set
> CONFIG_INTEL_SCU_IPC_UTIL=3Dy
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_GOLDFISH_PIPE is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_LAPTOP=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dm
> # CONFIG_CHROMEOS_TBMC is not set
> CONFIG_CROS_EC=3Dy
> CONFIG_CROS_EC_I2C=3Dm
> CONFIG_CROS_EC_SPI=3Dm
> CONFIG_CROS_EC_LPC=3Dy
> CONFIG_CROS_EC_PROTO=3Dy
> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> # CONFIG_CROS_EC_CHARDEV is not set
> CONFIG_CROS_EC_LIGHTBAR=3Dm
> # CONFIG_CROS_EC_DEBUGFS is not set
> CONFIG_CROS_EC_SENSORHUB=3Dm
> CONFIG_CROS_EC_SYSFS=3Dm
> CONFIG_CROS_USBPD_NOTIFY=3Dm
> CONFIG_WILCO_EC=3Dm
> CONFIG_WILCO_EC_DEBUGFS=3Dm
> CONFIG_WILCO_EC_EVENTS=3Dm
> CONFIG_WILCO_EC_TELEMETRY=3Dm
> # CONFIG_MELLANOX_PLATFORM is not set
> # CONFIG_SURFACE_PLATFORMS is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Clock driver for ARM Reference designs
> #
> # CONFIG_ICST is not set
> CONFIG_CLK_SP810=3Dy
> # end of Clock driver for ARM Reference designs
> =

> CONFIG_LMK04832=3Dm
> CONFIG_COMMON_CLK_MAX9485=3Dy
> # CONFIG_COMMON_CLK_SI5341 is not set
> CONFIG_COMMON_CLK_SI5351=3Dy
> CONFIG_COMMON_CLK_SI544=3Dy
> CONFIG_COMMON_CLK_CDCE706=3Dy
> CONFIG_COMMON_CLK_CS2000_CP=3Dm
> CONFIG_CLK_TWL6040=3Dy
> # CONFIG_COMMON_CLK_PALMAS is not set
> CONFIG_XILINX_VCU=3Dm
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> CONFIG_DW_APB_TIMER=3Dy
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> CONFIG_PCC=3Dy
> # CONFIG_ALTERA_MBOX is not set
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
> CONFIG_RPMSG_NS=3Dm
> CONFIG_RPMSG_QCOM_GLINK=3Dy
> CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
> CONFIG_RPMSG_VIRTIO=3Dm
> # end of Rpmsg drivers
> =

> CONFIG_SOUNDWIRE=3Dm
> =

> #
> # SoundWire Devices
> #
> CONFIG_SOUNDWIRE_CADENCE=3Dm
> CONFIG_SOUNDWIRE_INTEL=3Dm
> CONFIG_SOUNDWIRE_QCOM=3Dm
> CONFIG_SOUNDWIRE_GENERIC_ALLOCATION=3Dm
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
> # CONFIG_EXTCON_AXP288 is not set
> # CONFIG_EXTCON_FSA9480 is not set
> # CONFIG_EXTCON_GPIO is not set
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> CONFIG_EXTCON_INTEL_MRFLD=3Dm
> # CONFIG_EXTCON_MAX14577 is not set
> # CONFIG_EXTCON_MAX3355 is not set
> CONFIG_EXTCON_PALMAS=3Dy
> CONFIG_EXTCON_PTN5150=3Dm
> CONFIG_EXTCON_RT8973A=3Dm
> CONFIG_EXTCON_SM5502=3Dy
> CONFIG_EXTCON_USB_GPIO=3Dm
> CONFIG_EXTCON_USBC_CROS_EC=3Dm
> CONFIG_EXTCON_USBC_TUSB320=3Dy
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_BUFFER_DMA=3Dm
> # CONFIG_IIO_BUFFER_DMAENGINE is not set
> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> # CONFIG_IIO_SW_DEVICE is not set
> # CONFIG_IIO_SW_TRIGGER is not set
> CONFIG_IIO_TRIGGERED_EVENT=3Dm
> =

> #
> # Accelerometers
> #
> CONFIG_ADIS16201=3Dy
> # CONFIG_ADIS16209 is not set
> CONFIG_ADXL345=3Dy
> CONFIG_ADXL345_I2C=3Dy
> CONFIG_ADXL345_SPI=3Dy
> CONFIG_ADXL372=3Dm
> CONFIG_ADXL372_SPI=3Dm
> # CONFIG_ADXL372_I2C is not set
> # CONFIG_BMA180 is not set
> CONFIG_BMA220=3Dm
> CONFIG_BMA400=3Dy
> CONFIG_BMA400_I2C=3Dy
> CONFIG_BMA400_SPI=3Dy
> # CONFIG_BMC150_ACCEL is not set
> CONFIG_BMI088_ACCEL=3Dm
> CONFIG_BMI088_ACCEL_SPI=3Dm
> CONFIG_DA280=3Dy
> CONFIG_DA311=3Dm
> CONFIG_DMARD09=3Dm
> # CONFIG_DMARD10 is not set
> CONFIG_FXLS8962AF=3Dy
> CONFIG_FXLS8962AF_I2C=3Dy
> # CONFIG_FXLS8962AF_SPI is not set
> CONFIG_IIO_CROS_EC_ACCEL_LEGACY=3Dm
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dm
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dm
> CONFIG_IIO_ST_ACCEL_SPI_3AXIS=3Dm
> CONFIG_KXSD9=3Dm
> CONFIG_KXSD9_SPI=3Dm
> CONFIG_KXSD9_I2C=3Dm
> CONFIG_KXCJK1013=3Dy
> # CONFIG_MC3230 is not set
> CONFIG_MMA7455=3Dy
> CONFIG_MMA7455_I2C=3Dm
> CONFIG_MMA7455_SPI=3Dy
> CONFIG_MMA7660=3Dm
> CONFIG_MMA8452=3Dy
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> CONFIG_MMA9553=3Dy
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=3Dy
> CONFIG_SCA3000=3Dm
> CONFIG_SCA3300=3Dy
> # CONFIG_STK8312 is not set
> # CONFIG_STK8BA50 is not set
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> CONFIG_AD7091R5=3Dm
> CONFIG_AD7124=3Dy
> # CONFIG_AD7192 is not set
> # CONFIG_AD7266 is not set
> # CONFIG_AD7291 is not set
> # CONFIG_AD7292 is not set
> # CONFIG_AD7298 is not set
> # CONFIG_AD7476 is not set
> # CONFIG_AD7606_IFACE_PARALLEL is not set
> # CONFIG_AD7606_IFACE_SPI is not set
> # CONFIG_AD7766 is not set
> # CONFIG_AD7768_1 is not set
> # CONFIG_AD7780 is not set
> # CONFIG_AD7791 is not set
> CONFIG_AD7793=3Dy
> # CONFIG_AD7887 is not set
> # CONFIG_AD7923 is not set
> CONFIG_AD7949=3Dy
> CONFIG_AD799X=3Dm
> CONFIG_AXP20X_ADC=3Dm
> # CONFIG_AXP288_ADC is not set
> CONFIG_CC10001_ADC=3Dy
> CONFIG_HI8435=3Dm
> # CONFIG_HX711 is not set
> CONFIG_INA2XX_ADC=3Dy
> CONFIG_INTEL_MRFLD_ADC=3Dm
> CONFIG_LTC2471=3Dm
> CONFIG_LTC2485=3Dm
> CONFIG_LTC2496=3Dm
> CONFIG_LTC2497=3Dy
> CONFIG_MAX1027=3Dm
> CONFIG_MAX11100=3Dm
> # CONFIG_MAX1118 is not set
> CONFIG_MAX1241=3Dm
> # CONFIG_MAX1363 is not set
> CONFIG_MAX9611=3Dy
> CONFIG_MCP320X=3Dm
> # CONFIG_MCP3422 is not set
> CONFIG_MCP3911=3Dm
> CONFIG_MEDIATEK_MT6360_ADC=3Dm
> # CONFIG_MEN_Z188_ADC is not set
> CONFIG_MP2629_ADC=3Dm
> CONFIG_NAU7802=3Dm
> # CONFIG_PALMAS_GPADC is not set
> CONFIG_QCOM_VADC_COMMON=3Dm
> # CONFIG_QCOM_SPMI_IADC is not set
> CONFIG_QCOM_SPMI_VADC=3Dm
> # CONFIG_QCOM_SPMI_ADC5 is not set
> CONFIG_TI_ADC081C=3Dm
> CONFIG_TI_ADC0832=3Dy
> CONFIG_TI_ADC084S021=3Dy
> CONFIG_TI_ADC12138=3Dm
> CONFIG_TI_ADC108S102=3Dy
> # CONFIG_TI_ADC128S052 is not set
> # CONFIG_TI_ADC161S626 is not set
> CONFIG_TI_ADS1015=3Dy
> CONFIG_TI_ADS7950=3Dm
> # CONFIG_TI_ADS131E08 is not set
> # CONFIG_TI_TLC4541 is not set
> CONFIG_TI_TSC2046=3Dy
> CONFIG_TWL4030_MADC=3Dy
> # CONFIG_TWL6030_GPADC is not set
> CONFIG_XILINX_XADC=3Dm
> # end of Analog to digital converters
> =

> #
> # Analog Front Ends
> #
> # end of Analog Front Ends
> =

> #
> # Amplifiers
> #
> CONFIG_AD8366=3Dm
> CONFIG_HMC425=3Dm
> # end of Amplifiers
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dm
> # end of Capacitance to digital converters
> =

> #
> # Chemical Sensors
> #
> # CONFIG_ATLAS_PH_SENSOR is not set
> # CONFIG_ATLAS_EZO_SENSOR is not set
> # CONFIG_BME680 is not set
> # CONFIG_CCS811 is not set
> CONFIG_IAQCORE=3Dy
> # CONFIG_SCD30_CORE is not set
> CONFIG_SENSIRION_SGP30=3Dy
> # CONFIG_SENSIRION_SGP40 is not set
> CONFIG_SPS30=3Dy
> CONFIG_SPS30_I2C=3Dy
> # CONFIG_VZ89X is not set
> # end of Chemical Sensors
> =

> CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dm
> CONFIG_IIO_CROS_EC_SENSORS=3Dm
> CONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE=3Dm
> =

> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
> =

> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # IIO SCMI Sensors
> #
> # end of IIO SCMI Sensors
> =

> #
> # SSP Sensor Common
> #
> # CONFIG_IIO_SSP_SENSORHUB is not set
> # end of SSP Sensor Common
> =

> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_SPI=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> # CONFIG_AD5064 is not set
> # CONFIG_AD5360 is not set
> CONFIG_AD5380=3Dy
> CONFIG_AD5421=3Dm
> CONFIG_AD5446=3Dm
> CONFIG_AD5449=3Dm
> CONFIG_AD5592R_BASE=3Dy
> CONFIG_AD5592R=3Dy
> CONFIG_AD5593R=3Dy
> # CONFIG_AD5504 is not set
> # CONFIG_AD5624R_SPI is not set
> CONFIG_AD5686=3Dy
> # CONFIG_AD5686_SPI is not set
> CONFIG_AD5696_I2C=3Dy
> CONFIG_AD5755=3Dm
> # CONFIG_AD5758 is not set
> CONFIG_AD5761=3Dm
> CONFIG_AD5764=3Dm
> # CONFIG_AD5766 is not set
> # CONFIG_AD5770R is not set
> CONFIG_AD5791=3Dm
> # CONFIG_AD7303 is not set
> # CONFIG_AD8801 is not set
> CONFIG_DS4424=3Dm
> CONFIG_LTC1660=3Dm
> CONFIG_LTC2632=3Dm
> CONFIG_M62332=3Dy
> CONFIG_MAX517=3Dm
> CONFIG_MCP4725=3Dm
> # CONFIG_MCP4922 is not set
> CONFIG_TI_DAC082S085=3Dm
> CONFIG_TI_DAC5571=3Dm
> CONFIG_TI_DAC7311=3Dm
> CONFIG_TI_DAC7612=3Dy
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
> CONFIG_AD9523=3Dy
> # end of Clock Generator/Distribution
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> CONFIG_ADF4350=3Dm
> CONFIG_ADF4371=3Dy
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16080=3Dy
> CONFIG_ADIS16130=3Dm
> CONFIG_ADIS16136=3Dy
> # CONFIG_ADIS16260 is not set
> CONFIG_ADXRS290=3Dm
> CONFIG_ADXRS450=3Dy
> CONFIG_BMG160=3Dm
> CONFIG_BMG160_I2C=3Dm
> CONFIG_BMG160_SPI=3Dm
> CONFIG_FXAS21002C=3Dm
> CONFIG_FXAS21002C_I2C=3Dm
> CONFIG_FXAS21002C_SPI=3Dm
> CONFIG_MPU3050=3Dm
> CONFIG_MPU3050_I2C=3Dm
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
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
> CONFIG_AFE4403=3Dm
> CONFIG_AFE4404=3Dy
> CONFIG_MAX30100=3Dm
> # CONFIG_MAX30102 is not set
> # end of Heart Rate Monitors
> # end of Health Sensors
> =

> #
> # Humidity sensors
> #
> # CONFIG_AM2315 is not set
> # CONFIG_DHT11 is not set
> # CONFIG_HDC100X is not set
> CONFIG_HDC2010=3Dm
> # CONFIG_HTS221 is not set
> # CONFIG_HTU21 is not set
> # CONFIG_SI7005 is not set
> CONFIG_SI7020=3Dm
> # end of Humidity sensors
> =

> #
> # Inertial measurement units
> #
> CONFIG_ADIS16400=3Dm
> # CONFIG_ADIS16460 is not set
> CONFIG_ADIS16475=3Dm
> # CONFIG_ADIS16480 is not set
> CONFIG_BMI160=3Dy
> CONFIG_BMI160_I2C=3Dy
> CONFIG_BMI160_SPI=3Dy
> # CONFIG_FXOS8700_I2C is not set
> # CONFIG_FXOS8700_SPI is not set
> CONFIG_KMX61=3Dm
> CONFIG_INV_ICM42600=3Dm
> # CONFIG_INV_ICM42600_I2C is not set
> CONFIG_INV_ICM42600_SPI=3Dm
> CONFIG_INV_MPU6050_IIO=3Dy
> # CONFIG_INV_MPU6050_I2C is not set
> CONFIG_INV_MPU6050_SPI=3Dy
> # CONFIG_IIO_ST_LSM6DSX is not set
> CONFIG_IIO_ST_LSM9DS0=3Dm
> CONFIG_IIO_ST_LSM9DS0_I2C=3Dm
> CONFIG_IIO_ST_LSM9DS0_SPI=3Dm
> # end of Inertial measurement units
> =

> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dm
> CONFIG_ADUX1020=3Dm
> CONFIG_AL3010=3Dm
> CONFIG_AL3320A=3Dm
> # CONFIG_APDS9300 is not set
> # CONFIG_APDS9960 is not set
> CONFIG_AS73211=3Dy
> # CONFIG_BH1750 is not set
> # CONFIG_BH1780 is not set
> # CONFIG_CM32181 is not set
> CONFIG_CM3232=3Dy
> CONFIG_CM3323=3Dm
> CONFIG_CM36651=3Dm
> CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dm
> CONFIG_GP2AP002=3Dm
> CONFIG_GP2AP020A00F=3Dy
> CONFIG_SENSORS_ISL29018=3Dm
> CONFIG_SENSORS_ISL29028=3Dm
> CONFIG_ISL29125=3Dy
> CONFIG_JSA1212=3Dy
> CONFIG_RPR0521=3Dy
> CONFIG_SENSORS_LM3533=3Dm
> CONFIG_LTR501=3Dy
> CONFIG_LV0104CS=3Dm
> # CONFIG_MAX44000 is not set
> # CONFIG_MAX44009 is not set
> # CONFIG_NOA1305 is not set
> # CONFIG_OPT3001 is not set
> CONFIG_PA12203001=3Dm
> # CONFIG_SI1133 is not set
> CONFIG_SI1145=3Dy
> # CONFIG_STK3310 is not set
> CONFIG_ST_UVIS25=3Dm
> CONFIG_ST_UVIS25_I2C=3Dm
> CONFIG_ST_UVIS25_SPI=3Dm
> CONFIG_TCS3414=3Dm
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL2583=3Dy
> CONFIG_TSL2591=3Dy
> # CONFIG_TSL2772 is not set
> CONFIG_TSL4531=3Dm
> CONFIG_US5182D=3Dy
> CONFIG_VCNL4000=3Dm
> CONFIG_VCNL4035=3Dy
> # CONFIG_VEML6030 is not set
> CONFIG_VEML6070=3Dy
> # CONFIG_VL6180 is not set
> CONFIG_ZOPT2201=3Dm
> # end of Light sensors
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dm
> # CONFIG_AK09911 is not set
> CONFIG_BMC150_MAGN=3Dm
> # CONFIG_BMC150_MAGN_I2C is not set
> CONFIG_BMC150_MAGN_SPI=3Dm
> CONFIG_MAG3110=3Dm
> CONFIG_MMC35240=3Dm
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> CONFIG_SENSORS_HMC5843_SPI=3Dy
> CONFIG_SENSORS_RM3100=3Dy
> CONFIG_SENSORS_RM3100_I2C=3Dy
> # CONFIG_SENSORS_RM3100_SPI is not set
> CONFIG_YAMAHA_YAS530=3Dm
> # end of Magnetometer sensors
> =

> #
> # Multiplexers
> #
> # end of Multiplexers
> =

> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
> =

> CONFIG_IIO_TEST_FORMAT=3Dy
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_INTERRUPT_TRIGGER is not set
> CONFIG_IIO_SYSFS_TRIGGER=3Dy
> # end of Triggers - standalone
> =

> #
> # Linear and angular position sensors
> #
> # end of Linear and angular position sensors
> =

> #
> # Digital potentiometers
> #
> # CONFIG_AD5110 is not set
> CONFIG_AD5272=3Dy
> CONFIG_DS1803=3Dm
> # CONFIG_MAX5432 is not set
> CONFIG_MAX5481=3Dy
> CONFIG_MAX5487=3Dm
> CONFIG_MCP4018=3Dm
> # CONFIG_MCP4131 is not set
> # CONFIG_MCP4531 is not set
> CONFIG_MCP41010=3Dm
> CONFIG_TPL0102=3Dm
> # end of Digital potentiometers
> =

> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=3Dm
> # end of Digital potentiostats
> =

> #
> # Pressure sensors
> #
> # CONFIG_ABP060MG is not set
> CONFIG_BMP280=3Dm
> CONFIG_BMP280_I2C=3Dm
> CONFIG_BMP280_SPI=3Dm
> CONFIG_IIO_CROS_EC_BARO=3Dm
> CONFIG_DLHL60D=3Dm
> # CONFIG_DPS310 is not set
> CONFIG_HP03=3Dm
> CONFIG_ICP10100=3Dy
> CONFIG_MPL115=3Dy
> CONFIG_MPL115_I2C=3Dy
> CONFIG_MPL115_SPI=3Dm
> CONFIG_MPL3115=3Dm
> CONFIG_MS5611=3Dy
> # CONFIG_MS5611_I2C is not set
> # CONFIG_MS5611_SPI is not set
> CONFIG_MS5637=3Dm
> # CONFIG_IIO_ST_PRESS is not set
> # CONFIG_T5403 is not set
> CONFIG_HP206C=3Dm
> # CONFIG_ZPA2326 is not set
> # end of Pressure sensors
> =

> #
> # Lightning sensors
> #
> # CONFIG_AS3935 is not set
> # end of Lightning sensors
> =

> #
> # Proximity and distance sensors
> #
> CONFIG_CROS_EC_MKBP_PROXIMITY=3Dy
> CONFIG_ISL29501=3Dm
> CONFIG_LIDAR_LITE_V2=3Dy
> # CONFIG_MB1232 is not set
> CONFIG_PING=3Dm
> CONFIG_RFD77402=3Dm
> CONFIG_SRF04=3Dy
> CONFIG_SX9310=3Dm
> CONFIG_SX9500=3Dm
> # CONFIG_SRF08 is not set
> CONFIG_VCNL3020=3Dy
> # CONFIG_VL53L0X_I2C is not set
> # end of Proximity and distance sensors
> =

> #
> # Resolver to digital converters
> #
> CONFIG_AD2S90=3Dy
> CONFIG_AD2S1200=3Dm
> # end of Resolver to digital converters
> =

> #
> # Temperature sensors
> #
> # CONFIG_LTC2983 is not set
> CONFIG_MAXIM_THERMOCOUPLE=3Dm
> CONFIG_MLX90614=3Dm
> CONFIG_MLX90632=3Dy
> CONFIG_TMP006=3Dy
> # CONFIG_TMP007 is not set
> CONFIG_TMP117=3Dy
> CONFIG_TSYS01=3Dy
> CONFIG_TSYS02D=3Dm
> # CONFIG_MAX31856 is not set
> # end of Temperature sensors
> =

> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_MADERA_IRQ=3Dm
> # end of IRQ chip support
> =

> CONFIG_IPACK_BUS=3Dm
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_TI_SYSCON=3Dm
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_USB_LGM_PHY is not set
> CONFIG_PHY_CAN_TRANSCEIVER=3Dm
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_PXA_28NM_HSIC=3Dm
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> # CONFIG_PHY_CPCAP_USB is not set
> CONFIG_PHY_INTEL_LGM_EMMC=3Dy
> # end of PHY Subsystem
> =

> # CONFIG_POWERCAP is not set
> CONFIG_MCB=3Dy
> CONFIG_MCB_PCI=3Dm
> # CONFIG_MCB_LPC is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> # CONFIG_RAS is not set
> CONFIG_USB4=3Dy
> # CONFIG_USB4_DEBUGFS_WRITE is not set
> # CONFIG_USB4_KUNIT_TEST is not set
> # CONFIG_USB4_DMA_TEST is not set
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
> # CONFIG_NVMEM_NINTENDO_OTP is not set
> # CONFIG_NVMEM_SPMI_SDAM is not set
> CONFIG_NVMEM_RMEM=3Dy
> =

> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dm
> CONFIG_INTEL_TH_PCI=3Dm
> CONFIG_INTEL_TH_ACPI=3Dm
> CONFIG_INTEL_TH_GTH=3Dm
> # CONFIG_INTEL_TH_MSU is not set
> CONFIG_INTEL_TH_PTI=3Dm
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> CONFIG_FPGA=3Dy
> CONFIG_ALTERA_PR_IP_CORE=3Dy
> CONFIG_FPGA_MGR_ALTERA_PS_SPI=3Dy
> CONFIG_FPGA_MGR_ALTERA_CVP=3Dy
> CONFIG_FPGA_MGR_XILINX_SPI=3Dm
> CONFIG_FPGA_MGR_MACHXO2_SPI=3Dm
> # CONFIG_FPGA_BRIDGE is not set
> # CONFIG_FPGA_DFL is not set
> CONFIG_MULTIPLEXER=3Dy
> =

> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=3Dm
> CONFIG_MUX_ADGS1408=3Dm
> CONFIG_MUX_GPIO=3Dy
> # end of Multiplexer drivers
> =

> CONFIG_SIOX=3Dy
> CONFIG_SIOX_BUS_GPIO=3Dm
> CONFIG_SLIMBUS=3Dm
> CONFIG_SLIM_QCOM_CTRL=3Dm
> # CONFIG_INTERCONNECT is not set
> CONFIG_COUNTER=3Dy
> # CONFIG_INTERRUPT_CNT is not set
> CONFIG_INTEL_QEP=3Dy
> CONFIG_MOST=3Dy
> # CONFIG_MOST_CDEV is not set
> # CONFIG_MOST_SND is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=3Dy
> # CONFIG_EXT2_FS is not set
> CONFIG_EXT3_FS=3Dy
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> CONFIG_EXT3_FS_SECURITY=3Dy
> CONFIG_EXT4_FS=3Dy
> # CONFIG_EXT4_USE_FOR_EXT2 is not set
> # CONFIG_EXT4_FS_POSIX_ACL is not set
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_EXT4_KUNIT_TESTS=3Dm
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> CONFIG_JFS_FS=3Dm
> CONFIG_JFS_POSIX_ACL=3Dy
> # CONFIG_JFS_SECURITY is not set
> # CONFIG_JFS_DEBUG is not set
> # CONFIG_JFS_STATISTICS is not set
> CONFIG_XFS_FS=3Dm
> # CONFIG_XFS_SUPPORT_V4 is not set
> CONFIG_XFS_QUOTA=3Dy
> CONFIG_XFS_POSIX_ACL=3Dy
> CONFIG_XFS_RT=3Dy
> # CONFIG_XFS_ONLINE_SCRUB is not set
> CONFIG_XFS_WARN=3Dy
> # CONFIG_XFS_DEBUG is not set
> CONFIG_GFS2_FS=3Dy
> CONFIG_OCFS2_FS=3Dm
> # CONFIG_OCFS2_FS_O2CB is not set
> # CONFIG_OCFS2_FS_USERSPACE_CLUSTER is not set
> # CONFIG_OCFS2_FS_STATS is not set
> # CONFIG_OCFS2_DEBUG_MASKLOG is not set
> # CONFIG_OCFS2_DEBUG_FS is not set
> CONFIG_BTRFS_FS=3Dy
> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> CONFIG_BTRFS_ASSERT=3Dy
> CONFIG_BTRFS_FS_REF_VERIFY=3Dy
> # CONFIG_NILFS2_FS is not set
> CONFIG_F2FS_FS=3Dm
> CONFIG_F2FS_STAT_FS=3Dy
> # CONFIG_F2FS_FS_XATTR is not set
> CONFIG_F2FS_CHECK_FS=3Dy
> CONFIG_F2FS_FAULT_INJECTION=3Dy
> # CONFIG_F2FS_FS_COMPRESSION is not set
> CONFIG_F2FS_IOSTAT=3Dy
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_FS_ENCRYPTION is not set
> CONFIG_FS_VERITY=3Dy
> CONFIG_FS_VERITY_DEBUG=3Dy
> CONFIG_FS_VERITY_BUILTIN_SIGNATURES=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dm
> # CONFIG_QFMT_V1 is not set
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> # CONFIG_CUSE is not set
> CONFIG_VIRTIO_FS=3Dm
> CONFIG_OVERLAY_FS=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> CONFIG_OVERLAY_FS_METACOPY=3Dy
> =

> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=3Dy
> # CONFIG_NETFS_STATS is not set
> # CONFIG_FSCACHE is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> CONFIG_JOLIET=3Dy
> # CONFIG_ZISOFS is not set
> CONFIG_UDF_FS=3Dy
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dm
> # CONFIG_MSDOS_FS is not set
> CONFIG_VFAT_FS=3Dm
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> # CONFIG_FAT_KUNIT_TEST is not set
> # CONFIG_EXFAT_FS is not set
> CONFIG_NTFS_FS=3Dm
> CONFIG_NTFS_DEBUG=3Dy
> CONFIG_NTFS_RW=3Dy
> # CONFIG_NTFS3_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
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
> CONFIG_PROC_CPU_RESCTRL=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> CONFIG_TMPFS_XATTR=3Dy
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ADFS_FS=3Dy
> # CONFIG_ADFS_FS_RW is not set
> CONFIG_AFFS_FS=3Dy
> CONFIG_ECRYPT_FS=3Dm
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> # CONFIG_HFS_FS is not set
> CONFIG_HFSPLUS_FS=3Dy
> CONFIG_BEFS_FS=3Dm
> CONFIG_BEFS_DEBUG=3Dy
> CONFIG_BFS_FS=3Dm
> CONFIG_EFS_FS=3Dm
> CONFIG_JFFS2_FS=3Dm
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> CONFIG_JFFS2_SUMMARY=3Dy
> # CONFIG_JFFS2_FS_XATTR is not set
> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> CONFIG_JFFS2_ZLIB=3Dy
> CONFIG_JFFS2_LZO=3Dy
> CONFIG_JFFS2_RTIME=3Dy
> CONFIG_JFFS2_RUBIN=3Dy
> # CONFIG_JFFS2_CMODE_NONE is not set
> # CONFIG_JFFS2_CMODE_PRIORITY is not set
> CONFIG_JFFS2_CMODE_SIZE=3Dy
> # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
> CONFIG_UBIFS_FS=3Dm
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> CONFIG_UBIFS_FS_ZSTD=3Dy
> # CONFIG_UBIFS_ATIME_SUPPORT is not set
> # CONFIG_UBIFS_FS_XATTR is not set
> CONFIG_UBIFS_FS_AUTHENTICATION=3Dy
> CONFIG_CRAMFS=3Dm
> # CONFIG_CRAMFS_BLOCKDEV is not set
> # CONFIG_CRAMFS_MTD is not set
> # CONFIG_SQUASHFS is not set
> # CONFIG_VXFS_FS is not set
> CONFIG_MINIX_FS=3Dm
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> CONFIG_QNX4FS_FS=3Dm
> CONFIG_QNX6FS_FS=3Dm
> # CONFIG_QNX6FS_DEBUG is not set
> CONFIG_ROMFS_FS=3Dm
> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> # CONFIG_ROMFS_BACKED_BY_MTD is not set
> CONFIG_ROMFS_BACKED_BY_BOTH=3Dy
> CONFIG_ROMFS_ON_BLOCK=3Dy
> CONFIG_ROMFS_ON_MTD=3Dy
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dm
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> CONFIG_PSTORE_LZ4_COMPRESS=3Dm
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> CONFIG_PSTORE_842_COMPRESS=3Dy
> CONFIG_PSTORE_ZSTD_COMPRESS=3Dy
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> CONFIG_PSTORE_CONSOLE=3Dy
> CONFIG_PSTORE_PMSG=3Dy
> CONFIG_PSTORE_RAM=3Dm
> CONFIG_SYSV_FS=3Dy
> # CONFIG_UFS_FS is not set
> CONFIG_EROFS_FS=3Dm
> CONFIG_EROFS_FS_DEBUG=3Dy
> # CONFIG_EROFS_FS_XATTR is not set
> # CONFIG_EROFS_FS_ZIP is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V2=3Dm
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> CONFIG_NFS_V4_1=3Dy
> CONFIG_NFS_V4_2=3Dy
> CONFIG_PNFS_FILE_LAYOUT=3Dm
> CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
> # CONFIG_NFS_V4_1_MIGRATION is not set
> CONFIG_NFS_V4_SECURITY_LABEL=3Dy
> # CONFIG_ROOT_NFS is not set
> CONFIG_NFS_USE_LEGACY_DNS=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> # CONFIG_NFS_V4_2_READ_PLUS is not set
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_NFS_V4_2_SSC_HELPER=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> CONFIG_SUNRPC_BACKCHANNEL=3Dy
> # CONFIG_SUNRPC_DEBUG is not set
> # CONFIG_CEPH_FS is not set
> CONFIG_CIFS=3Dm
> CONFIG_CIFS_STATS2=3Dy
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=3Dm
> # CONFIG_CODA_FS is not set
> CONFIG_AFS_FS=3Dy
> # CONFIG_AFS_DEBUG is not set
> # CONFIG_AFS_DEBUG_CURSOR is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dm
> # CONFIG_NLS_CODEPAGE_861 is not set
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> # CONFIG_NLS_CODEPAGE_869 is not set
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dm
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dm
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> # CONFIG_NLS_ASCII is not set
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dm
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dm
> CONFIG_NLS_MAC_CROATIAN=3Dm
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dy
> # CONFIG_NLS_MAC_INUIT is not set
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> # CONFIG_NLS_MAC_TURKISH is not set
> CONFIG_NLS_UTF8=3Dy
> CONFIG_DLM=3Dm
> CONFIG_DLM_DEBUG=3Dy
> CONFIG_UNICODE=3Dy
> CONFIG_UNICODE_NORMALIZATION_SELFTEST=3Dm
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_BIG_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dm
> CONFIG_KEY_DH_OPERATIONS=3Dy
> CONFIG_KEY_NOTIFICATIONS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> # CONFIG_SECURITYFS is not set
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
> CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_LOADPIN is not set
> # CONFIG_SECURITY_YAMA is not set
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> # CONFIG_IMA is not set
> # CONFIG_EVM is not set
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
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dy
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
> CONFIG_CRYPTO_RNG_DEFAULT=3Dm
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dm
> # CONFIG_CRYPTO_CRYPTD is not set
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> CONFIG_CRYPTO_ECDH=3Dm
> CONFIG_CRYPTO_ECDSA=3Dy
> # CONFIG_CRYPTO_ECRDSA is not set
> CONFIG_CRYPTO_SM2=3Dy
> # CONFIG_CRYPTO_CURVE25519 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> # CONFIG_CRYPTO_AEGIS128 is not set
> CONFIG_CRYPTO_SEQIV=3Dm
> # CONFIG_CRYPTO_ECHAINIV is not set
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dm
> CONFIG_CRYPTO_CFB=3Dm
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dm
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dm
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> # CONFIG_CRYPTO_KEYWRAP is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> # CONFIG_CRYPTO_ESSIV is not set
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dm
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_XXHASH=3Dy
> CONFIG_CRYPTO_BLAKE2B=3Dy
> # CONFIG_CRYPTO_BLAKE2S is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dm
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dm
> # CONFIG_CRYPTO_SHA3 is not set
> CONFIG_CRYPTO_SM3=3Dy
> # CONFIG_CRYPTO_STREEBOG is not set
> CONFIG_CRYPTO_WP512=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dm
> # CONFIG_CRYPTO_AES_TI is not set
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dm
> # CONFIG_CRYPTO_CAST5 is not set
> CONFIG_CRYPTO_CAST6=3Dm
> # CONFIG_CRYPTO_DES is not set
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dm
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
> CONFIG_CRYPTO_SM4=3Dm
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> CONFIG_CRYPTO_TWOFISH_586=3Dm
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dm
> CONFIG_CRYPTO_LZO=3Dm
> CONFIG_CRYPTO_842=3Dy
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
> CONFIG_CRYPTO_ZSTD=3Dy
> =

> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> CONFIG_CRYPTO_DRBG_MENU=3Dm
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dm
> CONFIG_CRYPTO_JITTERENTROPY=3Dm
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dm
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dm
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dm
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CHACHA=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_POLY1305=3Dy
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_LIB_SM4=3Dm
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dm
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> CONFIG_SYSTEM_REVOCATION_LIST=3Dy
> CONFIG_SYSTEM_REVOCATION_KEYS=3D""
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dy
> # CONFIG_RAID6_PQ_BENCHMARK is not set
> CONFIG_LINEAR_RANGES=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_CORDIC=3Dy
> CONFIG_PRIME_NUMBERS=3Dy
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
> CONFIG_CRC32_SELFTEST=3Dy
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=3Dy
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dm
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
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dm
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_BCH=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_DMA_MAP_BENCHMARK=3Dy
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dm
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_32=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dm
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_AUTOSELECT=3Dy
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_STACK_HASH_ORDER=3D20
> CONFIG_SBITMAP=3Dy
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
> CONFIG_PRINTK_CALLER=3Dy
> CONFIG_STACKTRACE_BUILD_ID=3Dy
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> # CONFIG_DYNAMIC_DEBUG_CORE is not set
> # CONFIG_SYMBOLIC_ERRNAME is not set
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
> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B=3Dy
> CONFIG_FRAME_POINTER=3Dy
> CONFIG_VMLINUX_MAP=3Dy
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
> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> CONFIG_DEBUG_FS_DISALLOW_MOUNT=3Dy
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_TRAP is not set
> CONFIG_CC_HAS_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_ONLY_BOUNDS=3Dy
> CONFIG_UBSAN_SHIFT=3Dy
> # CONFIG_UBSAN_DIV_ZERO is not set
> CONFIG_UBSAN_UNREACHABLE=3Dy
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_TEST_UBSAN=3Dm
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> # CONFIG_DEBUG_MISC is not set
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_PAGE_POISONING=3Dy
> # CONFIG_DEBUG_PAGE_REF is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> CONFIG_DEBUG_WX=3Dy
> CONFIG_GENERIC_PTDUMP=3Dy
> CONFIG_PTDUMP_CORE=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SLUB_STATS=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> CONFIG_DEBUG_VM=3Dy
> CONFIG_DEBUG_VM_VMACACHE=3Dy
> CONFIG_DEBUG_VM_RB=3Dy
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
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
> CONFIG_KFENCE_STATIC_KEYS=3Dy
> CONFIG_KFENCE_SAMPLE_INTERVAL=3D100
> CONFIG_KFENCE_NUM_OBJECTS=3D255
> CONFIG_KFENCE_STRESS_TEST_FAULTS=3D0
> # CONFIG_KFENCE_KUNIT_TEST is not set
> # end of Memory Debugging
> =

> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> CONFIG_WQ_WATCHDOG=3Dy
> CONFIG_TEST_LOCKUP=3Dm
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

> CONFIG_DEBUG_TIMEKEEPING=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCKDEP_BITS=3D15
> CONFIG_LOCKDEP_CHAINS_BITS=3D16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=3D19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=3D14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=3D12
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
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> # CONFIG_DEBUG_LIST is not set
> CONFIG_DEBUG_PLIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> # CONFIG_DEBUG_NOTIFIERS is not set
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # end of Debug kernel data structures
> =

> CONFIG_DEBUG_CREDENTIALS=3Dy
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
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_CPU_HOTPLUG_STATE_CONTROL=3Dy
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
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> CONFIG_IO_DELAY_NONE=3Dy
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
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
> # CONFIG_KUNIT_DEBUGFS is not set
> CONFIG_KUNIT_TEST=3Dm
> CONFIG_KUNIT_EXAMPLE_TEST=3Dm
> # CONFIG_KUNIT_ALL_TESTS is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dm
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm
> CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dm
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> # CONFIG_RUNTIME_TESTING_MENU is not set
> CONFIG_ARCH_USE_MEMTEST=3Dy
> # CONFIG_MEMTEST is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'rcutorture'
> 	export testcase=3D'rcutorture'
> 	export category=3D'functional'
> 	export need_memory=3D'300MB'
> 	export runtime=3D300
> 	export job_origin=3D'rcutorture.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit'
> 	export queue=3D'bisect'
> 	export testbox=3D'vm-snb-i386-2'
> 	export tbox_group=3D'vm-snb-i386'
> 	export branch=3D'paulmck-rcu/dev.2021.09.22a'
> 	export commit=3D'be6350ccbb78fbc8186f4b3265ed331654ef3ad9'
> 	export kconfig=3D'i386-randconfig-a003-20210930'
> 	export nr_vm=3D160
> 	export submit_id=3D'615611e8545c7c63db15174a'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-i386-2/rcutorture-300s-cpu=
hotplug-rcu-debian-i386-20191205.cgz-be6350ccbb78fbc8186f4b3265ed331654ef3a=
d9-20211001-91099-1s0bqgb-4.yaml'
> 	export id=3D'61746895b3d08b6e8af40a15517207d134ba7649'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-i386 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'4G'
> 	export need_kconfig=3D\{\"RCU_TORTURE_TEST\"\=3D\>\"m\"\}'
> '\{\"SECURITY_LOADPIN_ENABLED\"\=3D\>\"n,\ \<\=3D\ v4.19\"\}'
> '\{\"SECURITY_LOADPIN_ENFORCE\"\=3D\>\"n,\ v4.20\"\}'
> '\{\"KVM_GUEST\"\=3D\>\"y\"\}
> 	export ssh_base_port=3D23400
> 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_owner=
=3Don'
> 	export rootfs=3D'debian-i386-20191205.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2021-10-01 03:37:12 +0800'
> 	export _id=3D'61561816545c7c63db15174e'
> 	export _rt=3D'/result/rcutorture/300s-cpuhotplug-rcu/vm-snb-i386/debian-=
i386-20191205.cgz/i386-randconfig-a003-20210930/gcc-9/be6350ccbb78fbc8186f4=
b3265ed331654ef3ad9'
> 	export user=3D'lkp'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export result_root=3D'/result/rcutorture/300s-cpuhotplug-rcu/vm-snb-i386=
/debian-i386-20191205.cgz/i386-randconfig-a003-20210930/gcc-9/be6350ccbb78f=
bc8186f4b3265ed331654ef3ad9/3'
> 	export scheduler_version=3D'/lkp/lkp/.src-20210930-100745'
> 	export arch=3D'i386'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/debian/debian-i386-20191205.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/vm-snb-i386-2/rcutorture-300s-cpuhotplug-rcu-de=
bian-i386-20191205.cgz-be6350ccbb78fbc8186f4b3265ed331654ef3ad9-20211001-91=
099-1s0bqgb-4.yaml
> ARCH=3Di386
> kconfig=3Di386-randconfig-a003-20210930
> branch=3Dpaulmck-rcu/dev.2021.09.22a
> commit=3Dbe6350ccbb78fbc8186f4b3265ed331654ef3ad9
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a003-20210930/gcc-9/be6350ccbb78f=
bc8186f4b3265ed331654ef3ad9/vmlinuz-5.15.0-rc1-00093-gbe6350ccbb78
> vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> max_uptime=3D2100
> RESULT_ROOT=3D/result/rcutorture/300s-cpuhotplug-rcu/vm-snb-i386/debian-i=
386-20191205.cgz/i386-randconfig-a003-20210930/gcc-9/be6350ccbb78fbc8186f4b=
3265ed331654ef3ad9/3
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
> 	export modules_initrd=3D'/pkg/linux/i386-randconfig-a003-20210930/gcc-9/=
be6350ccbb78fbc8186f4b3265ed331654ef3ad9/modules.cgz'
> 	export bm_initrd=3D'/osimage/deps/debian-i386-20191205.cgz/lkp_20201203.=
cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export kernel=3D'/pkg/linux/i386-randconfig-a003-20210930/gcc-9/be6350cc=
bb78fbc8186f4b3265ed331654ef3ad9/vmlinuz-5.15.0-rc1-00093-gbe6350ccbb78'
> 	export dequeue_time=3D'2021-10-01 04:04:01 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-i386-2/rcutorture-300s-c=
puhotplug-rcu-debian-i386-20191205.cgz-be6350ccbb78fbc8186f4b3265ed331654ef=
3ad9-20211001-91099-1s0bqgb-4.cgz'
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
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	run_test test=3D'cpuhotplug' torture_type=3D'rcu' $LKP_SRC/tests/wrapper=
 rcutorture
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	env test=3D'cpuhotplug' torture_type=3D'rcu' $LKP_SRC/stats/wrapper rcut=
orture
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper meminfo
> =

> 	$LKP_SRC/stats/wrapper time rcutorture.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"


--===============2655798810733394587==--

