Content-Type: multipart/mixed; boundary="===============5310434856638715112=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rcutorture] 3398b55446: WARNING:possible_recursive_locking_detected
Date: Tue, 24 Jul 2018 17:30:27 -0700
Message-ID: <20180725003027.GA13300@linux.vnet.ibm.com>
In-Reply-To: <20180724172855.GL12945@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5310434856638715112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 10:28:55AM -0700, Paul E. McKenney wrote:
> On Tue, Jul 24, 2018 at 03:43:10PM +0800, kernel test robot wrote:
> > =

> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: 3398b55446fb602245007d5955b6778fb6ff326a ("rcutorture: Handle e=
xtended "rcu" read-side critical sections")
> > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev
> > =

> > in testcase: boot
> > =

> > on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > +---------------------------------------------+------------+-----------=
-+
> > |                                             | 6fb6dfca01 | 3398b55446=
 |
> > +---------------------------------------------+------------+-----------=
-+
> > | boot_successes                              | 28         | 4         =
 |
> > | boot_failures                               | 0          | 26        =
 |
> > | WARNING:possible_recursive_locking_detected | 0          | 26        =
 |
> > +---------------------------------------------+------------+-----------=
-+
> =

> But this one is all too real!
> =

> Excellent catch, and thank you for your testing efforts!!!
> =

> My rcutorture runs somehow missed this one, but it does require a long
> chain of events to trigger.  Sounds like also a bug in rcutorture.  ;-)

Not yet sure how to fix the rcutorture bug, but I do believe that I have
a fix for the Linux-kernel RCU bug queued.

							Thanx, Paul

> > [   15.516826] WARNING: possible recursive locking detected
> > [   15.518058] 4.18.0-rc5-00173-g3398b55 #1 Not tainted
> > [   15.519215] --------------------------------------------
> > [   15.520008] rcu_torture_rea/78 is trying to acquire lock:
> > [   15.520008] (____ptrval____) (&p->pi_lock){-.-.}, at: try_to_wake_up=
+0x30/0x317
> > [   15.520008] =

> > [   15.520008] but task is already holding lock:
> > [   15.520008] (____ptrval____) (&p->pi_lock){-.-.}, at: try_to_wake_up=
+0x30/0x317
> > [   15.520008] =

> > [   15.520008] other info that might help us debug this:
> > [   15.520008]  Possible unsafe locking scenario:
> > [   15.520008] =

> > [   15.520008]        CPU0
> > [   15.520008]        ----
> > [   15.520008]   lock(&p->pi_lock);
> > [   15.520008]   lock(&p->pi_lock);
> > [   15.520008] =

> > [   15.520008]  *** DEADLOCK ***
> > [   15.520008] =

> > [   15.520008]  May be due to missing lock nesting notation
> > [   15.520008] =

> > [   15.520008] 2 locks held by rcu_torture_rea/78:
> > [   15.520008]  #0: (____ptrval____) (&p->pi_lock){-.-.}, at: try_to_wa=
ke_up+0x30/0x317
> > [   15.520008]  #1: (____ptrval____) (rcu_read_lock){....}, at: select_=
task_rq_rt+0x1a/0x152
> > [   15.520008] =

> > [   15.520008] stack backtrace:
> > [   15.520008] CPU: 1 PID: 78 Comm: rcu_torture_rea Not tainted 4.18.0-=
rc5-00173-g3398b55 #1
> > [   15.520008] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
> > [   15.520008] Call Trace:
> > [   15.520008]  dump_stack+0xc4/0x117
> > [   15.520008]  __lock_acquire+0x806/0xf26
> > [   15.520008]  ? kvm_clock_read+0x23/0x33
> > [   15.520008]  lock_acquire+0x70/0x9f
> > [   15.520008]  ? try_to_wake_up+0x30/0x317
> > [   15.520008]  _raw_spin_lock_irqsave+0x62/0x9d
> > [   15.520008]  ? try_to_wake_up+0x30/0x317
> > [   15.520008]  try_to_wake_up+0x30/0x317
> > [   15.520008]  ? __lock_acquire+0x2d7/0xf26
> > [   15.520008]  wake_up_process+0x10/0x12
> > [   15.520008]  wakeup_softirqd+0x2b/0x2d
> > [   15.520008]  raise_softirq_irqoff+0x1c/0x1e
> > [   15.520008]  rcu_read_unlock_special+0x7b/0xca
> > [   15.520008]  __rcu_read_unlock+0x3f/0x5b
> > [   15.520008]  select_task_rq_rt+0x127/0x152
> > [   15.520008]  try_to_wake_up+0x16c/0x317
> > [   15.520008]  wake_up_process+0x10/0x12
> > [   15.520008]  rcu_initiate_boost+0xa3/0xb5
> > [   15.520008]  __rcu_report_exp_rnp+0x3f/0xc3
> > [   15.520008]  rcu_report_exp_cpu_mult+0x59/0x62
> > [   15.520008]  rcu_report_exp_rdp+0x1a/0x1c
> > [   15.520008]  rcu_preempt_deferred_qs_irqrestore+0xec/0x382
> > [   15.520008]  rcu_preempt_deferred_qs+0x4c/0x51
> > [   15.520008]  rcu_note_context_switch+0x360/0x3d0
> > [   15.520008]  __schedule+0x186/0x7ad
> > [   15.520008]  ? preempt_schedule+0x30/0x32
> > [   15.520008]  ? rcutorture_one_extend+0xce/0x178
> > [   15.520008]  preempt_schedule_common+0x65/0x7f
> > [   15.520008]  preempt_schedule+0x30/0x32
> > [   15.520008]  ___preempt_schedule+0x16/0x18
> > [   15.520008]  __local_bh_enable_ip+0xf5/0xfa
> > [   15.520008]  rcutorture_one_extend+0xdf/0x178
> > [   15.520008]  rcu_torture_one_read+0x26e/0x287
> > [   15.520008]  ? rcu_torture_one_read+0x287/0x287
> > [   15.520008]  rcu_torture_reader+0xd2/0x131
> > [   15.520008]  ? rcu_busted_torture_deferred_free+0xb/0xb
> > [   15.520008]  ? __kthread_parkme+0x47/0x7c
> > [   15.520008]  kthread+0x125/0x12d
> > [   15.520008]  ? rcu_torture_one_read+0x287/0x287
> > [   15.520008]  ? kthread+0x125/0x12d
> > [   15.520008]  ? kthread_flush_work_fn+0xf/0xf
> > [   15.520008]  ret_from_fork+0x3a/0x50
> > [   51.562859] [drm] Initialized vgem 1.0.0 20120112 for virtual device=
 on minor 0
> > [   51.566668] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolf=
o Giometti
> > [   51.569287] usbcore: registered new interface driver viperboard
> > [   51.571011] usbcore: registered new interface driver dln2
> > [   51.572479] Uniform Multi-Platform E-IDE driver
> > [   51.574488] ide-gd driver 1.18
> > [   51.600600] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21=
-k8-NAPI
> > [   51.601993] e1000: Copyright (c) 1999-2006 Intel Corporation.
> > [   51.785059] PCI Interrupt Link [LNKC] enabled at IRQ 11
> > [   52.234347] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:=
34:56
> > [   52.255507] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Conne=
ction
> > [   52.256896] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
> > [   52.258046] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> > [   52.259434] igb: Intel(R) Gigabit Ethernet Network Driver - version =
5.4.0-k
> > [   52.260805] igb: Copyright (c) 2007-2014 Intel Corporation.
> > [   52.261961] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver - =
version 5.1.0-k
> > [   52.263751] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
> > [   52.287160] usbcore: registered new interface driver hwa-rc
> > [   52.288320] usbcore: registered new interface driver i1480-dfu-usb
> > [   52.289967] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driv=
er
> > [   52.291304] ehci-pci: EHCI PCI platform driver
> > [   52.292268] ehci-platform: EHCI generic platform driver
> > [   52.293463] usbcore: registered new interface driver hwa-hc
> > [   52.294591] fotg210_hcd: FOTG210 Host Controller (EHCI) Driver
> > [   52.308853] usbcore: registered new interface driver wusb-cbaf
> > [   52.310075] usbcore: registered new interface driver cdc_acm
> > [   52.311213] cdc_acm: USB Abstract Control Model driver for USB modem=
s and ISDN adapters
> > [   52.312838] usbcore: registered new interface driver usblp
> > [   52.314096] usbcore: registered new interface driver usbtmc
> > [   52.315287] usbcore: registered new interface driver mdc800
> > =

> > =

> > To reproduce:
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> > =

> > =

> > =

> > Thanks,
> > Rong, Chen
> =

> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/x86_64 4.18.0-rc5 Kernel Configuration
> > #
> > =

> > #
> > # Compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
> > #
> > CONFIG_64BIT=3Dy
> > CONFIG_X86_64=3Dy
> > CONFIG_X86=3Dy
> > CONFIG_INSTRUCTION_DECODER=3Dy
> > CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> > CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> > CONFIG_LOCKDEP_SUPPORT=3Dy
> > CONFIG_STACKTRACE_SUPPORT=3Dy
> > CONFIG_MMU=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> > CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> > CONFIG_GENERIC_ISA_DMA=3Dy
> > CONFIG_GENERIC_BUG=3Dy
> > CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> > CONFIG_GENERIC_HWEIGHT=3Dy
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > CONFIG_ZONE_DMA32=3Dy
> > CONFIG_AUDIT_ARCH=3Dy
> > CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > CONFIG_X86_64_SMP=3Dy
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
> > CONFIG_PGTABLE_LEVELS=3D4
> > CONFIG_CC_IS_GCC=3Dy
> > CONFIG_GCC_VERSION=3D70300
> > CONFIG_CLANG_VERSION=3D0
> > CONFIG_CONSTRUCTORS=3Dy
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> > CONFIG_THREAD_INFO_IN_TASK=3Dy
> > =

> > #
> > # General setup
> > #
> > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > # CONFIG_COMPILE_TEST is not set
> > CONFIG_LOCALVERSION=3D""
> > CONFIG_LOCALVERSION_AUTO=3Dy
> > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > CONFIG_HAVE_KERNEL_XZ=3Dy
> > CONFIG_HAVE_KERNEL_LZO=3Dy
> > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > CONFIG_KERNEL_LZMA=3Dy
> > # CONFIG_KERNEL_XZ is not set
> > # CONFIG_KERNEL_LZO is not set
> > # CONFIG_KERNEL_LZ4 is not set
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > CONFIG_SWAP=3Dy
> > CONFIG_SYSVIPC=3Dy
> > CONFIG_SYSVIPC_SYSCTL=3Dy
> > # CONFIG_POSIX_MQUEUE is not set
> > CONFIG_CROSS_MEMORY_ATTACH=3Dy
> > CONFIG_USELIB=3Dy
> > # CONFIG_AUDIT is not set
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > =

> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> > CONFIG_GENERIC_PENDING_IRQ=3Dy
> > CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> > CONFIG_GENERIC_IRQ_CHIP=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > CONFIG_IRQ_SIM=3Dy
> > CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> > CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> > CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > =

> > #
> > # Timers subsystem
> > #
> > CONFIG_TICK_ONESHOT=3Dy
> > CONFIG_HZ_PERIODIC=3Dy
> > # CONFIG_NO_HZ_IDLE is not set
> > # CONFIG_NO_HZ_FULL is not set
> > CONFIG_NO_HZ=3Dy
> > CONFIG_HIGH_RES_TIMERS=3Dy
> > =

> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> > # CONFIG_TICK_CPU_ACCOUNTING is not set
> > CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_BSD_PROCESS_ACCT=3Dy
> > CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> > # CONFIG_TASKSTATS is not set
> > CONFIG_CPU_ISOLATION=3Dy
> > =

> > #
> > # RCU Subsystem
> > #
> > CONFIG_PREEMPT_RCU=3Dy
> > CONFIG_RCU_EXPERT=3Dy
> > CONFIG_SRCU=3Dy
> > CONFIG_TREE_SRCU=3Dy
> > CONFIG_TASKS_RCU=3Dy
> > CONFIG_RCU_STALL_COMMON=3Dy
> > CONFIG_RCU_NEED_SEGCBLIST=3Dy
> > CONFIG_CONTEXT_TRACKING=3Dy
> > CONFIG_CONTEXT_TRACKING_FORCE=3Dy
> > CONFIG_RCU_FANOUT=3D64
> > CONFIG_RCU_FANOUT_LEAF=3D16
> > CONFIG_RCU_BOOST=3Dy
> > CONFIG_RCU_BOOST_DELAY=3D500
> > # CONFIG_RCU_NOCB_CPU is not set
> > CONFIG_BUILD_BIN2C=3Dy
> > CONFIG_IKCONFIG=3Dy
> > CONFIG_IKCONFIG_PROC=3Dy
> > CONFIG_LOG_BUF_SHIFT=3D20
> > CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> > CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> > CONFIG_ARCH_SUPPORTS_INT128=3Dy
> > CONFIG_CGROUPS=3Dy
> > # CONFIG_MEMCG is not set
> > # CONFIG_BLK_CGROUP is not set
> > CONFIG_CGROUP_SCHED=3Dy
> > CONFIG_FAIR_GROUP_SCHED=3Dy
> > CONFIG_CFS_BANDWIDTH=3Dy
> > CONFIG_RT_GROUP_SCHED=3Dy
> > # CONFIG_CGROUP_PIDS is not set
> > CONFIG_CGROUP_RDMA=3Dy
> > # CONFIG_CGROUP_FREEZER is not set
> > CONFIG_CPUSETS=3Dy
> > # CONFIG_PROC_PID_CPUSET is not set
> > # CONFIG_CGROUP_DEVICE is not set
> > # CONFIG_CGROUP_CPUACCT is not set
> > CONFIG_CGROUP_PERF=3Dy
> > CONFIG_CGROUP_DEBUG=3Dy
> > CONFIG_NAMESPACES=3Dy
> > # CONFIG_UTS_NS is not set
> > CONFIG_IPC_NS=3Dy
> > # CONFIG_USER_NS is not set
> > # CONFIG_PID_NS is not set
> > CONFIG_NET_NS=3Dy
> > # CONFIG_SCHED_AUTOGROUP is not set
> > # CONFIG_SYSFS_DEPRECATED is not set
> > CONFIG_RELAY=3Dy
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > # CONFIG_RD_BZIP2 is not set
> > CONFIG_RD_LZMA=3Dy
> > # CONFIG_RD_XZ is not set
> > CONFIG_RD_LZO=3Dy
> > # CONFIG_RD_LZ4 is not set
> > # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> > CONFIG_SYSCTL=3Dy
> > CONFIG_ANON_INODES=3Dy
> > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > CONFIG_BPF=3Dy
> > # CONFIG_EXPERT is not set
> > CONFIG_MULTIUSER=3Dy
> > CONFIG_SGETMASK_SYSCALL=3Dy
> > CONFIG_SYSFS_SYSCALL=3Dy
> > CONFIG_FHANDLE=3Dy
> > CONFIG_POSIX_TIMERS=3Dy
> > CONFIG_PRINTK=3Dy
> > CONFIG_PRINTK_NMI=3Dy
> > CONFIG_BUG=3Dy
> > CONFIG_ELF_CORE=3Dy
> > CONFIG_PCSPKR_PLATFORM=3Dy
> > CONFIG_BASE_FULL=3Dy
> > CONFIG_FUTEX=3Dy
> > CONFIG_FUTEX_PI=3Dy
> > CONFIG_EPOLL=3Dy
> > CONFIG_SIGNALFD=3Dy
> > CONFIG_TIMERFD=3Dy
> > CONFIG_EVENTFD=3Dy
> > CONFIG_SHMEM=3Dy
> > CONFIG_AIO=3Dy
> > CONFIG_ADVISE_SYSCALLS=3Dy
> > CONFIG_MEMBARRIER=3Dy
> > CONFIG_KALLSYMS=3Dy
> > CONFIG_KALLSYMS_ALL=3Dy
> > CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > # CONFIG_BPF_SYSCALL is not set
> > # CONFIG_USERFAULTFD is not set
> > CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> > CONFIG_RSEQ=3Dy
> > # CONFIG_EMBEDDED is not set
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> > =

> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > CONFIG_VM_EVENT_COUNTERS=3Dy
> > # CONFIG_COMPAT_BRK is not set
> > CONFIG_SLAB=3Dy
> > # CONFIG_SLUB is not set
> > # CONFIG_SLAB_MERGE_DEFAULT is not set
> > # CONFIG_SLAB_FREELIST_RANDOM is not set
> > # CONFIG_PROFILING is not set
> > CONFIG_HAVE_OPROFILE=3Dy
> > CONFIG_OPROFILE_NMI_TIMER=3Dy
> > # CONFIG_JUMP_LABEL is not set
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > CONFIG_HAVE_KPROBES=3Dy
> > CONFIG_HAVE_KRETPROBES=3Dy
> > CONFIG_HAVE_OPTPROBES=3Dy
> > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> > CONFIG_HAVE_NMI=3Dy
> > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_RSEQ=3Dy
> > CONFIG_HAVE_CLK=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> > CONFIG_HAVE_PERF_REGS=3Dy
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > CONFIG_HAVE_RCU_TABLE_FREE=3Dy
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > CONFIG_SECCOMP_FILTER=3Dy
> > CONFIG_PLUGIN_HOSTCC=3D"g++"
> > CONFIG_HAVE_GCC_PLUGINS=3Dy
> > CONFIG_GCC_PLUGINS=3Dy
> > # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> > CONFIG_GCC_PLUGIN_STRUCTLEAK=3Dy
> > # CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
> > # CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
> > # CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
> > CONFIG_HAVE_STACKPROTECTOR=3Dy
> > CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> > # CONFIG_STACKPROTECTOR is not set
> > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> > CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> > CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> > CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> > CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> > CONFIG_MODULES_USE_ELF_RELA=3Dy
> > CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> > CONFIG_HAVE_EXIT_THREAD=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS=3D28
> > CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> > CONFIG_HAVE_STACK_VALIDATION=3Dy
> > CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> > CONFIG_ISA_BUS_API=3Dy
> > CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> > CONFIG_VMAP_STACK=3Dy
> > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> > CONFIG_STRICT_KERNEL_RWX=3Dy
> > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> > CONFIG_ARCH_HAS_REFCOUNT=3Dy
> > # CONFIG_REFCOUNT_FULL is not set
> > =

> > #
> > # GCOV-based kernel profiling
> > #
> > CONFIG_GCOV_KERNEL=3Dy
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > # CONFIG_GCOV_PROFILE_ALL is not set
> > CONFIG_GCOV_FORMAT_4_7=3Dy
> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D0
> > # CONFIG_MODULES is not set
> > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > CONFIG_BLOCK=3Dy
> > CONFIG_BLK_SCSI_REQUEST=3Dy
> > CONFIG_BLK_DEV_BSG=3Dy
> > # CONFIG_BLK_DEV_BSGLIB is not set
> > CONFIG_BLK_DEV_INTEGRITY=3Dy
> > CONFIG_BLK_DEV_ZONED=3Dy
> > CONFIG_BLK_CMDLINE_PARSER=3Dy
> > CONFIG_BLK_WBT=3Dy
> > # CONFIG_BLK_WBT_SQ is not set
> > CONFIG_BLK_WBT_MQ=3Dy
> > # CONFIG_BLK_DEBUG_FS is not set
> > # CONFIG_BLK_SED_OPAL is not set
> > =

> > #
> > # Partition Types
> > #
> > # CONFIG_PARTITION_ADVANCED is not set
> > CONFIG_MSDOS_PARTITION=3Dy
> > CONFIG_EFI_PARTITION=3Dy
> > CONFIG_BLK_MQ_PCI=3Dy
> > CONFIG_BLK_MQ_VIRTIO=3Dy
> > =

> > #
> > # IO Schedulers
> > #
> > CONFIG_IOSCHED_NOOP=3Dy
> > # CONFIG_IOSCHED_DEADLINE is not set
> > CONFIG_IOSCHED_CFQ=3Dy
> > CONFIG_DEFAULT_CFQ=3Dy
> > # CONFIG_DEFAULT_NOOP is not set
> > CONFIG_DEFAULT_IOSCHED=3D"cfq"
> > CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> > CONFIG_MQ_IOSCHED_KYBER=3Dy
> > # CONFIG_IOSCHED_BFQ is not set
> > CONFIG_PADATA=3Dy
> > CONFIG_ASN1=3Dy
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> > CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> > CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > CONFIG_QUEUED_SPINLOCKS=3Dy
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > CONFIG_QUEUED_RWLOCKS=3Dy
> > CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> > CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> > CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> > CONFIG_FREEZER=3Dy
> > =

> > #
> > # Processor type and features
> > #
> > CONFIG_ZONE_DMA=3Dy
> > CONFIG_SMP=3Dy
> > CONFIG_X86_FEATURE_NAMES=3Dy
> > # CONFIG_X86_X2APIC is not set
> > CONFIG_X86_MPPARSE=3Dy
> > CONFIG_GOLDFISH=3Dy
> > CONFIG_RETPOLINE=3Dy
> > CONFIG_INTEL_RDT=3Dy
> > # CONFIG_X86_EXTENDED_PLATFORM is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > # CONFIG_IOSF_MBI is not set
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > CONFIG_HYPERVISOR_GUEST=3Dy
> > CONFIG_PARAVIRT=3Dy
> > CONFIG_PARAVIRT_DEBUG=3Dy
> > # CONFIG_PARAVIRT_SPINLOCKS is not set
> > # CONFIG_XEN is not set
> > CONFIG_KVM_GUEST=3Dy
> > CONFIG_KVM_DEBUG_FS=3Dy
> > CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> > CONFIG_PARAVIRT_CLOCK=3Dy
> > # CONFIG_JAILHOUSE_GUEST is not set
> > CONFIG_NO_BOOTMEM=3Dy
> > # CONFIG_MK8 is not set
> > # CONFIG_MPSC is not set
> > # CONFIG_MCORE2 is not set
> > # CONFIG_MATOM is not set
> > CONFIG_GENERIC_CPU=3Dy
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_CMPXCHG64=3Dy
> > CONFIG_X86_CMOV=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> > CONFIG_X86_DEBUGCTLMSR=3Dy
> > CONFIG_CPU_SUP_INTEL=3Dy
> > CONFIG_CPU_SUP_AMD=3Dy
> > CONFIG_CPU_SUP_CENTAUR=3Dy
> > CONFIG_HPET_TIMER=3Dy
> > CONFIG_DMI=3Dy
> > # CONFIG_GART_IOMMU is not set
> > # CONFIG_CALGARY_IOMMU is not set
> > # CONFIG_MAXSMP is not set
> > CONFIG_NR_CPUS_RANGE_BEGIN=3D2
> > CONFIG_NR_CPUS_RANGE_END=3D512
> > CONFIG_NR_CPUS_DEFAULT=3D64
> > CONFIG_NR_CPUS=3D64
> > CONFIG_SCHED_SMT=3Dy
> > # CONFIG_SCHED_MC is not set
> > # CONFIG_PREEMPT_NONE is not set
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > CONFIG_PREEMPT=3Dy
> > CONFIG_PREEMPT_COUNT=3Dy
> > CONFIG_X86_LOCAL_APIC=3Dy
> > CONFIG_X86_IO_APIC=3Dy
> > CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> > # CONFIG_X86_MCE is not set
> > =

> > #
> > # Performance monitoring
> > #
> > CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> > CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> > CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> > # CONFIG_PERF_EVENTS_AMD_POWER is not set
> > CONFIG_X86_16BIT=3Dy
> > CONFIG_X86_ESPFIX64=3Dy
> > CONFIG_X86_VSYSCALL_EMULATION=3Dy
> > # CONFIG_I8K is not set
> > CONFIG_MICROCODE=3Dy
> > CONFIG_MICROCODE_INTEL=3Dy
> > CONFIG_MICROCODE_AMD=3Dy
> > CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> > # CONFIG_X86_MSR is not set
> > CONFIG_X86_CPUID=3Dy
> > # CONFIG_X86_5LEVEL is not set
> > CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> > CONFIG_AMD_MEM_ENCRYPT=3Dy
> > CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT=3Dy
> > CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> > # CONFIG_NUMA is not set
> > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > # CONFIG_ARCH_MEMORY_PROBE is not set
> > CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_SPARSEMEM_MANUAL=3Dy
> > CONFIG_SPARSEMEM=3Dy
> > CONFIG_HAVE_MEMORY_PRESENT=3Dy
> > CONFIG_SPARSEMEM_EXTREME=3Dy
> > CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> > CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> > CONFIG_SPARSEMEM_VMEMMAP=3Dy
> > CONFIG_HAVE_MEMBLOCK=3Dy
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> > CONFIG_HAVE_GENERIC_GUP=3Dy
> > CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> > CONFIG_MEMORY_ISOLATION=3Dy
> > CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> > CONFIG_MEMORY_HOTPLUG=3Dy
> > CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> > CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
> > CONFIG_MEMORY_HOTREMOVE=3Dy
> > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> > CONFIG_COMPACTION=3Dy
> > CONFIG_MIGRATION=3Dy
> > CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> > CONFIG_PHYS_ADDR_T_64BIT=3Dy
> > CONFIG_BOUNCE=3Dy
> > CONFIG_VIRT_TO_BUS=3Dy
> > # CONFIG_KSM is not set
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> > # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> > CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> > CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> > CONFIG_THP_SWAP=3Dy
> > CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> > # CONFIG_CLEANCACHE is not set
> > # CONFIG_FRONTSWAP is not set
> > CONFIG_CMA=3Dy
> > # CONFIG_CMA_DEBUG is not set
> > # CONFIG_CMA_DEBUGFS is not set
> > CONFIG_CMA_AREAS=3D7
> > CONFIG_ZPOOL=3Dy
> > CONFIG_ZBUD=3Dy
> > CONFIG_Z3FOLD=3Dy
> > # CONFIG_ZSMALLOC is not set
> > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> > CONFIG_IDLE_PAGE_TRACKING=3Dy
> > CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
> > # CONFIG_ZONE_DEVICE is not set
> > CONFIG_FRAME_VECTOR=3Dy
> > CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> > CONFIG_ARCH_HAS_PKEYS=3Dy
> > # CONFIG_PERCPU_STATS is not set
> > CONFIG_GUP_BENCHMARK=3Dy
> > CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> > # CONFIG_X86_PMEM_LEGACY is not set
> > CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> > CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
> > CONFIG_X86_RESERVE_LOW=3D64
> > CONFIG_MTRR=3Dy
> > CONFIG_MTRR_SANITIZER=3Dy
> > CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> > CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> > CONFIG_X86_PAT=3Dy
> > CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> > CONFIG_ARCH_RANDOM=3Dy
> > CONFIG_X86_SMAP=3Dy
> > CONFIG_X86_INTEL_UMIP=3Dy
> > # CONFIG_X86_INTEL_MPX is not set
> > CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> > # CONFIG_EFI is not set
> > CONFIG_SECCOMP=3Dy
> > CONFIG_HZ_100=3Dy
> > # CONFIG_HZ_250 is not set
> > # CONFIG_HZ_300 is not set
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=3D100
> > CONFIG_SCHED_HRTICK=3Dy
> > # CONFIG_KEXEC is not set
> > # CONFIG_KEXEC_FILE is not set
> > # CONFIG_CRASH_DUMP is not set
> > CONFIG_PHYSICAL_START=3D0x1000000
> > # CONFIG_RELOCATABLE is not set
> > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > CONFIG_HOTPLUG_CPU=3Dy
> > CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> > CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> > CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> > # CONFIG_LEGACY_VSYSCALL_NONE is not set
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_MODIFY_LDT_SYSCALL=3Dy
> > CONFIG_HAVE_LIVEPATCH=3Dy
> > CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> > =

> > #
> > # Power management and ACPI options
> > #
> > CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> > # CONFIG_SUSPEND is not set
> > CONFIG_HIBERNATE_CALLBACKS=3Dy
> > CONFIG_HIBERNATION=3Dy
> > CONFIG_PM_STD_PARTITION=3D""
> > CONFIG_PM_SLEEP=3Dy
> > CONFIG_PM_SLEEP_SMP=3Dy
> > CONFIG_PM_AUTOSLEEP=3Dy
> > # CONFIG_PM_WAKELOCKS is not set
> > CONFIG_PM=3Dy
> > # CONFIG_PM_DEBUG is not set
> > CONFIG_PM_CLK=3Dy
> > CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > # CONFIG_ACPI_DEBUGGER is not set
> > CONFIG_ACPI_SPCR_TABLE=3Dy
> > CONFIG_ACPI_LPIT=3Dy
> > CONFIG_ACPI_SLEEP=3Dy
> > # CONFIG_ACPI_PROCFS_POWER is not set
> > CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > CONFIG_ACPI_AC=3Dy
> > CONFIG_ACPI_BATTERY=3Dy
> > CONFIG_ACPI_BUTTON=3Dy
> > # CONFIG_ACPI_VIDEO is not set
> > CONFIG_ACPI_FAN=3Dy
> > # CONFIG_ACPI_TAD is not set
> > # CONFIG_ACPI_DOCK is not set
> > CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> > CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> > CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> > CONFIG_ACPI_PROCESSOR=3Dy
> > CONFIG_ACPI_HOTPLUG_CPU=3Dy
> > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > CONFIG_ACPI_THERMAL=3Dy
> > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > # CONFIG_ACPI_DEBUG is not set
> > # CONFIG_ACPI_PCI_SLOT is not set
> > CONFIG_ACPI_CONTAINER=3Dy
> > # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> > CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> > # CONFIG_ACPI_SBS is not set
> > # CONFIG_ACPI_HED is not set
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_NFIT is not set
> > CONFIG_HAVE_ACPI_APEI=3Dy
> > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > # CONFIG_ACPI_APEI is not set
> > # CONFIG_DPTF_POWER is not set
> > # CONFIG_PMIC_OPREGION is not set
> > # CONFIG_ACPI_CONFIGFS is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > CONFIG_SFI=3Dy
> > =

> > #
> > # CPU Frequency scaling
> > #
> > # CONFIG_CPU_FREQ is not set
> > =

> > #
> > # CPU Idle
> > #
> > CONFIG_CPU_IDLE=3Dy
> > CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> > CONFIG_CPU_IDLE_GOV_MENU=3Dy
> > CONFIG_INTEL_IDLE=3Dy
> > =

> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI=3Dy
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_MMCONFIG=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > CONFIG_MMCONF_FAM10H=3Dy
> > # CONFIG_PCIEPORTBUS is not set
> > # CONFIG_PCI_MSI is not set
> > CONFIG_PCI_QUIRKS=3Dy
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_STUB is not set
> > CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> > # CONFIG_PCI_IOV is not set
> > # CONFIG_PCI_PRI is not set
> > # CONFIG_PCI_PASID is not set
> > CONFIG_PCI_LABEL=3Dy
> > # CONFIG_HOTPLUG_PCI is not set
> > =

> > #
> > # PCI controller drivers
> > #
> > =

> > #
> > # Cadence PCIe controllers support
> > #
> > # CONFIG_PCIE_CADENCE_HOST is not set
> > # CONFIG_PCI_FTPCI100 is not set
> > # CONFIG_PCI_HOST_GENERIC is not set
> > =

> > #
> > # DesignWare PCI Core Support
> > #
> > =

> > #
> > # PCI Endpoint
> > #
> > # CONFIG_PCI_ENDPOINT is not set
> > =

> > #
> > # PCI switch controller drivers
> > #
> > # CONFIG_PCI_SW_SWITCHTEC is not set
> > CONFIG_ISA_DMA_API=3Dy
> > CONFIG_AMD_NB=3Dy
> > CONFIG_PCCARD=3Dy
> > CONFIG_PCMCIA=3Dy
> > # CONFIG_PCMCIA_LOAD_CIS is not set
> > CONFIG_CARDBUS=3Dy
> > =

> > #
> > # PC-card bridges
> > #
> > # CONFIG_YENTA is not set
> > # CONFIG_PD6729 is not set
> > # CONFIG_I82092 is not set
> > # CONFIG_RAPIDIO is not set
> > # CONFIG_X86_SYSFB is not set
> > =

> > #
> > # Executable file formats / Emulations
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_ELFCORE=3Dy
> > # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> > CONFIG_BINFMT_SCRIPT=3Dy
> > CONFIG_BINFMT_MISC=3Dy
> > CONFIG_COREDUMP=3Dy
> > # CONFIG_IA32_EMULATION is not set
> > # CONFIG_X86_X32 is not set
> > CONFIG_X86_DEV_DMA_OPS=3Dy
> > CONFIG_NET=3Dy
> > =

> > #
> > # Networking options
> > #
> > # CONFIG_PACKET is not set
> > CONFIG_UNIX=3Dy
> > # CONFIG_UNIX_DIAG is not set
> > # CONFIG_TLS is not set
> > CONFIG_XFRM=3Dy
> > # CONFIG_XFRM_USER is not set
> > # CONFIG_XFRM_SUB_POLICY is not set
> > # CONFIG_XFRM_MIGRATE is not set
> > # CONFIG_XFRM_STATISTICS is not set
> > # CONFIG_NET_KEY is not set
> > CONFIG_INET=3Dy
> > # CONFIG_IP_MULTICAST is not set
> > # CONFIG_IP_ADVANCED_ROUTER is not set
> > CONFIG_IP_PNP=3Dy
> > CONFIG_IP_PNP_DHCP=3Dy
> > # CONFIG_IP_PNP_BOOTP is not set
> > # CONFIG_IP_PNP_RARP is not set
> > # CONFIG_NET_IPIP is not set
> > # CONFIG_NET_IPGRE_DEMUX is not set
> > CONFIG_NET_IP_TUNNEL=3Dy
> > # CONFIG_SYN_COOKIES is not set
> > # CONFIG_NET_IPVTI is not set
> > # CONFIG_NET_FOU is not set
> > # CONFIG_NET_FOU_IP_TUNNELS is not set
> > # CONFIG_INET_AH is not set
> > # CONFIG_INET_ESP is not set
> > # CONFIG_INET_IPCOMP is not set
> > CONFIG_INET_TUNNEL=3Dy
> > CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
> > CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
> > CONFIG_INET_XFRM_MODE_BEET=3Dy
> > CONFIG_INET_DIAG=3Dy
> > CONFIG_INET_TCP_DIAG=3Dy
> > # CONFIG_INET_UDP_DIAG is not set
> > # CONFIG_INET_RAW_DIAG is not set
> > # CONFIG_INET_DIAG_DESTROY is not set
> > # CONFIG_TCP_CONG_ADVANCED is not set
> > CONFIG_TCP_CONG_CUBIC=3Dy
> > CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> > # CONFIG_TCP_MD5SIG is not set
> > CONFIG_IPV6=3Dy
> > # CONFIG_IPV6_ROUTER_PREF is not set
> > # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> > # CONFIG_INET6_AH is not set
> > # CONFIG_INET6_ESP is not set
> > # CONFIG_INET6_IPCOMP is not set
> > # CONFIG_IPV6_MIP6 is not set
> > CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
> > CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> > CONFIG_INET6_XFRM_MODE_BEET=3Dy
> > # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> > # CONFIG_IPV6_VTI is not set
> > CONFIG_IPV6_SIT=3Dy
> > # CONFIG_IPV6_SIT_6RD is not set
> > CONFIG_IPV6_NDISC_NODETYPE=3Dy
> > # CONFIG_IPV6_TUNNEL is not set
> > # CONFIG_IPV6_MULTIPLE_TABLES is not set
> > # CONFIG_IPV6_MROUTE is not set
> > # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> > # CONFIG_IPV6_SEG6_HMAC is not set
> > # CONFIG_NETWORK_SECMARK is not set
> > CONFIG_NET_PTP_CLASSIFY=3Dy
> > # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> > # CONFIG_NETFILTER is not set
> > # CONFIG_BPFILTER is not set
> > # CONFIG_IP_DCCP is not set
> > # CONFIG_IP_SCTP is not set
> > # CONFIG_RDS is not set
> > # CONFIG_TIPC is not set
> > # CONFIG_ATM is not set
> > # CONFIG_L2TP is not set
> > # CONFIG_BRIDGE is not set
> > CONFIG_HAVE_NET_DSA=3Dy
> > # CONFIG_NET_DSA is not set
> > # CONFIG_VLAN_8021Q is not set
> > # CONFIG_DECNET is not set
> > # CONFIG_LLC2 is not set
> > # CONFIG_ATALK is not set
> > # CONFIG_X25 is not set
> > # CONFIG_LAPB is not set
> > # CONFIG_PHONET is not set
> > # CONFIG_6LOWPAN is not set
> > # CONFIG_IEEE802154 is not set
> > # CONFIG_NET_SCHED is not set
> > # CONFIG_DCB is not set
> > CONFIG_DNS_RESOLVER=3Dy
> > # CONFIG_BATMAN_ADV is not set
> > # CONFIG_OPENVSWITCH is not set
> > # CONFIG_VSOCKETS is not set
> > # CONFIG_NETLINK_DIAG is not set
> > # CONFIG_MPLS is not set
> > # CONFIG_NET_NSH is not set
> > # CONFIG_HSR is not set
> > # CONFIG_NET_SWITCHDEV is not set
> > # CONFIG_NET_L3_MASTER_DEV is not set
> > # CONFIG_NET_NCSI is not set
> > CONFIG_RPS=3Dy
> > CONFIG_RFS_ACCEL=3Dy
> > CONFIG_XPS=3Dy
> > # CONFIG_CGROUP_NET_PRIO is not set
> > # CONFIG_CGROUP_NET_CLASSID is not set
> > CONFIG_NET_RX_BUSY_POLL=3Dy
> > CONFIG_BQL=3Dy
> > CONFIG_NET_FLOW_LIMIT=3Dy
> > =

> > #
> > # Network testing
> > #
> > # CONFIG_NET_PKTGEN is not set
> > # CONFIG_HAMRADIO is not set
> > # CONFIG_CAN is not set
> > # CONFIG_BT is not set
> > # CONFIG_AF_RXRPC is not set
> > # CONFIG_AF_KCM is not set
> > CONFIG_WIRELESS=3Dy
> > # CONFIG_CFG80211 is not set
> > =

> > #
> > # CFG80211 needs to be enabled for MAC80211
> > #
> > CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> > # CONFIG_WIMAX is not set
> > # CONFIG_RFKILL is not set
> > # CONFIG_NET_9P is not set
> > # CONFIG_CAIF is not set
> > # CONFIG_CEPH_LIB is not set
> > # CONFIG_NFC is not set
> > # CONFIG_PSAMPLE is not set
> > # CONFIG_NET_IFE is not set
> > # CONFIG_LWTUNNEL is not set
> > CONFIG_DST_CACHE=3Dy
> > CONFIG_GRO_CELLS=3Dy
> > # CONFIG_NET_DEVLINK is not set
> > CONFIG_MAY_USE_DEVLINK=3Dy
> > # CONFIG_FAILOVER is not set
> > CONFIG_HAVE_EBPF_JIT=3Dy
> > =

> > #
> > # Device Drivers
> > #
> > =

> > #
> > # Generic Driver Options
> > #
> > CONFIG_UEVENT_HELPER=3Dy
> > CONFIG_UEVENT_HELPER_PATH=3D""
> > CONFIG_DEVTMPFS=3Dy
> > # CONFIG_DEVTMPFS_MOUNT is not set
> > CONFIG_STANDALONE=3Dy
> > # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> > =

> > #
> > # Firmware loader
> > #
> > CONFIG_FW_LOADER=3Dy
> > CONFIG_EXTRA_FIRMWARE=3D""
> > CONFIG_FW_LOADER_USER_HELPER=3Dy
> > # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> > CONFIG_WANT_DEV_COREDUMP=3Dy
> > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > CONFIG_DEV_COREDUMP=3Dy
> > # CONFIG_DEBUG_DRIVER is not set
> > CONFIG_DEBUG_DEVRES=3Dy
> > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> > CONFIG_REGMAP=3Dy
> > CONFIG_REGMAP_I2C=3Dy
> > CONFIG_REGMAP_SPMI=3Dy
> > CONFIG_REGMAP_W1=3Dy
> > CONFIG_REGMAP_MMIO=3Dy
> > CONFIG_REGMAP_IRQ=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > CONFIG_DMA_FENCE_TRACE=3Dy
> > CONFIG_DMA_CMA=3Dy
> > =

> > #
> > # Default contiguous memory area size:
> > #
> > CONFIG_CMA_SIZE_PERCENTAGE=3D0
> > # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> > CONFIG_CMA_SIZE_SEL_PERCENTAGE=3Dy
> > # CONFIG_CMA_SIZE_SEL_MIN is not set
> > # CONFIG_CMA_SIZE_SEL_MAX is not set
> > CONFIG_CMA_ALIGNMENT=3D8
> > =

> > #
> > # Bus devices
> > #
> > CONFIG_SIMPLE_PM_BUS=3Dy
> > # CONFIG_CONNECTOR is not set
> > # CONFIG_MTD is not set
> > CONFIG_DTC=3Dy
> > CONFIG_OF=3Dy
> > CONFIG_OF_UNITTEST=3Dy
> > CONFIG_OF_FLATTREE=3Dy
> > CONFIG_OF_EARLY_FLATTREE=3Dy
> > CONFIG_OF_KOBJ=3Dy
> > CONFIG_OF_DYNAMIC=3Dy
> > CONFIG_OF_ADDRESS=3Dy
> > CONFIG_OF_IRQ=3Dy
> > CONFIG_OF_NET=3Dy
> > CONFIG_OF_RESOLVE=3Dy
> > # CONFIG_OF_OVERLAY is not set
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > # CONFIG_PARPORT is not set
> > CONFIG_PNP=3Dy
> > CONFIG_PNP_DEBUG_MESSAGES=3Dy
> > =

> > #
> > # Protocols
> > #
> > CONFIG_PNPACPI=3Dy
> > CONFIG_BLK_DEV=3Dy
> > # CONFIG_BLK_DEV_NULL_BLK is not set
> > # CONFIG_BLK_DEV_FD is not set
> > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > # CONFIG_BLK_DEV_DAC960 is not set
> > # CONFIG_BLK_DEV_UMEM is not set
> > # CONFIG_BLK_DEV_LOOP is not set
> > # CONFIG_BLK_DEV_DRBD is not set
> > # CONFIG_BLK_DEV_NBD is not set
> > # CONFIG_BLK_DEV_SKD is not set
> > # CONFIG_BLK_DEV_SX8 is not set
> > # CONFIG_BLK_DEV_RAM is not set
> > # CONFIG_CDROM_PKTCDVD is not set
> > # CONFIG_ATA_OVER_ETH is not set
> > # CONFIG_VIRTIO_BLK is not set
> > # CONFIG_BLK_DEV_RBD is not set
> > # CONFIG_BLK_DEV_RSXX is not set
> > =

> > #
> > # NVME Support
> > #
> > CONFIG_NVME_CORE=3Dy
> > # CONFIG_BLK_DEV_NVME is not set
> > CONFIG_NVME_MULTIPATH=3Dy
> > CONFIG_NVME_FABRICS=3Dy
> > CONFIG_NVME_FC=3Dy
> > # CONFIG_NVME_TARGET is not set
> > =

> > #
> > # Misc devices
> > #
> > CONFIG_SENSORS_LIS3LV02D=3Dy
> > CONFIG_AD525X_DPOT=3Dy
> > CONFIG_AD525X_DPOT_I2C=3Dy
> > # CONFIG_DUMMY_IRQ is not set
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_SGI_IOC4 is not set
> > # CONFIG_TIFM_CORE is not set
> > # CONFIG_ICS932S401 is not set
> > # CONFIG_ENCLOSURE_SERVICES is not set
> > # CONFIG_HP_ILO is not set
> > CONFIG_APDS9802ALS=3Dy
> > # CONFIG_ISL29003 is not set
> > CONFIG_ISL29020=3Dy
> > # CONFIG_SENSORS_TSL2550 is not set
> > CONFIG_SENSORS_BH1770=3Dy
> > CONFIG_SENSORS_APDS990X=3Dy
> > CONFIG_HMC6352=3Dy
> > CONFIG_DS1682=3Dy
> > CONFIG_USB_SWITCH_FSA9480=3Dy
> > CONFIG_SRAM=3Dy
> > # CONFIG_PCI_ENDPOINT_TEST is not set
> > CONFIG_C2PORT=3Dy
> > # CONFIG_C2PORT_DURAMAR_2150 is not set
> > =

> > #
> > # EEPROM support
> > #
> > CONFIG_EEPROM_AT24=3Dy
> > CONFIG_EEPROM_LEGACY=3Dy
> > CONFIG_EEPROM_MAX6875=3Dy
> > # CONFIG_EEPROM_93CX6 is not set
> > CONFIG_EEPROM_IDT_89HPESX=3Dy
> > # CONFIG_CB710_CORE is not set
> > =

> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # CONFIG_TI_ST is not set
> > CONFIG_SENSORS_LIS3_I2C=3Dy
> > # CONFIG_ALTERA_STAPL is not set
> > # CONFIG_INTEL_MEI is not set
> > # CONFIG_INTEL_MEI_ME is not set
> > # CONFIG_INTEL_MEI_TXE is not set
> > # CONFIG_VMWARE_VMCI is not set
> > =

> > #
> > # Intel MIC & related support
> > #
> > =

> > #
> > # Intel MIC Bus Driver
> > #
> > # CONFIG_INTEL_MIC_BUS is not set
> > =

> > #
> > # SCIF Bus Driver
> > #
> > # CONFIG_SCIF_BUS is not set
> > =

> > #
> > # VOP Bus Driver
> > #
> > # CONFIG_VOP_BUS is not set
> > =

> > #
> > # Intel MIC Host Driver
> > #
> > =

> > #
> > # Intel MIC Card Driver
> > #
> > =

> > #
> > # SCIF Driver
> > #
> > =

> > #
> > # Intel MIC Coprocessor State Management (COSM) Drivers
> > #
> > =

> > #
> > # VOP Driver
> > #
> > # CONFIG_GENWQE is not set
> > # CONFIG_ECHO is not set
> > # CONFIG_MISC_RTSX_PCI is not set
> > # CONFIG_MISC_RTSX_USB is not set
> > CONFIG_HAVE_IDE=3Dy
> > CONFIG_IDE=3Dy
> > =

> > #
> > # Please see Documentation/ide/ide.txt for help/info on IDE drives
> > #
> > CONFIG_IDE_XFER_MODE=3Dy
> > CONFIG_IDE_TIMINGS=3Dy
> > CONFIG_IDE_ATAPI=3Dy
> > CONFIG_BLK_DEV_IDE_SATA=3Dy
> > CONFIG_IDE_GD=3Dy
> > # CONFIG_IDE_GD_ATA is not set
> > # CONFIG_IDE_GD_ATAPI is not set
> > # CONFIG_BLK_DEV_IDECS is not set
> > # CONFIG_BLK_DEV_DELKIN is not set
> > # CONFIG_BLK_DEV_IDECD is not set
> > CONFIG_BLK_DEV_IDETAPE=3Dy
> > # CONFIG_BLK_DEV_IDEACPI is not set
> > # CONFIG_IDE_TASK_IOCTL is not set
> > CONFIG_IDE_PROC_FS=3Dy
> > =

> > #
> > # IDE chipset support/bugfixes
> > #
> > # CONFIG_IDE_GENERIC is not set
> > CONFIG_BLK_DEV_PLATFORM=3Dy
> > CONFIG_BLK_DEV_CMD640=3Dy
> > # CONFIG_BLK_DEV_CMD640_ENHANCED is not set
> > # CONFIG_BLK_DEV_IDEPNP is not set
> > =

> > #
> > # PCI IDE chipsets support
> > #
> > # CONFIG_BLK_DEV_GENERIC is not set
> > # CONFIG_BLK_DEV_OPTI621 is not set
> > # CONFIG_BLK_DEV_RZ1000 is not set
> > # CONFIG_BLK_DEV_AEC62XX is not set
> > # CONFIG_BLK_DEV_ALI15X3 is not set
> > # CONFIG_BLK_DEV_AMD74XX is not set
> > # CONFIG_BLK_DEV_ATIIXP is not set
> > # CONFIG_BLK_DEV_CMD64X is not set
> > # CONFIG_BLK_DEV_TRIFLEX is not set
> > # CONFIG_BLK_DEV_HPT366 is not set
> > # CONFIG_BLK_DEV_JMICRON is not set
> > # CONFIG_BLK_DEV_PIIX is not set
> > # CONFIG_BLK_DEV_IT8172 is not set
> > # CONFIG_BLK_DEV_IT8213 is not set
> > # CONFIG_BLK_DEV_IT821X is not set
> > # CONFIG_BLK_DEV_NS87415 is not set
> > # CONFIG_BLK_DEV_PDC202XX_OLD is not set
> > # CONFIG_BLK_DEV_PDC202XX_NEW is not set
> > # CONFIG_BLK_DEV_SVWKS is not set
> > # CONFIG_BLK_DEV_SIIMAGE is not set
> > # CONFIG_BLK_DEV_SIS5513 is not set
> > # CONFIG_BLK_DEV_SLC90E66 is not set
> > # CONFIG_BLK_DEV_TRM290 is not set
> > # CONFIG_BLK_DEV_VIA82CXXX is not set
> > # CONFIG_BLK_DEV_TC86C001 is not set
> > =

> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dy
> > CONFIG_RAID_ATTRS=3Dy
> > # CONFIG_SCSI is not set
> > # CONFIG_ATA is not set
> > CONFIG_MD=3Dy
> > # CONFIG_BLK_DEV_MD is not set
> > # CONFIG_BCACHE is not set
> > CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> > CONFIG_BLK_DEV_DM=3Dy
> > # CONFIG_DM_MQ_DEFAULT is not set
> > # CONFIG_DM_DEBUG is not set
> > CONFIG_DM_BUFIO=3Dy
> > # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> > CONFIG_DM_BIO_PRISON=3Dy
> > CONFIG_DM_PERSISTENT_DATA=3Dy
> > CONFIG_DM_UNSTRIPED=3Dy
> > CONFIG_DM_CRYPT=3Dy
> > CONFIG_DM_SNAPSHOT=3Dy
> > CONFIG_DM_THIN_PROVISIONING=3Dy
> > CONFIG_DM_CACHE=3Dy
> > # CONFIG_DM_CACHE_SMQ is not set
> > CONFIG_DM_WRITECACHE=3Dy
> > # CONFIG_DM_ERA is not set
> > # CONFIG_DM_MIRROR is not set
> > # CONFIG_DM_RAID is not set
> > CONFIG_DM_ZERO=3Dy
> > CONFIG_DM_MULTIPATH=3Dy
> > CONFIG_DM_MULTIPATH_QL=3Dy
> > CONFIG_DM_MULTIPATH_ST=3Dy
> > CONFIG_DM_DELAY=3Dy
> > CONFIG_DM_UEVENT=3Dy
> > CONFIG_DM_FLAKEY=3Dy
> > # CONFIG_DM_VERITY is not set
> > CONFIG_DM_SWITCH=3Dy
> > CONFIG_DM_LOG_WRITES=3Dy
> > CONFIG_DM_INTEGRITY=3Dy
> > # CONFIG_DM_ZONED is not set
> > # CONFIG_FUSION is not set
> > =

> > #
> > # IEEE 1394 (FireWire) support
> > #
> > CONFIG_FIREWIRE=3Dy
> > # CONFIG_FIREWIRE_OHCI is not set
> > # CONFIG_FIREWIRE_NET is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > # CONFIG_MACINTOSH_DRIVERS is not set
> > CONFIG_NETDEVICES=3Dy
> > CONFIG_NET_CORE=3Dy
> > # CONFIG_BONDING is not set
> > # CONFIG_DUMMY is not set
> > # CONFIG_EQUALIZER is not set
> > # CONFIG_NET_TEAM is not set
> > # CONFIG_MACVLAN is not set
> > # CONFIG_VXLAN is not set
> > # CONFIG_MACSEC is not set
> > # CONFIG_NETCONSOLE is not set
> > # CONFIG_TUN is not set
> > # CONFIG_TUN_VNET_CROSS_LE is not set
> > # CONFIG_VETH is not set
> > # CONFIG_VIRTIO_NET is not set
> > # CONFIG_NLMON is not set
> > # CONFIG_ARCNET is not set
> > =

> > #
> > # CAIF transport drivers
> > #
> > =

> > #
> > # Distributed Switch Architecture drivers
> > #
> > CONFIG_ETHERNET=3Dy
> > CONFIG_MDIO=3Dy
> > CONFIG_NET_VENDOR_3COM=3Dy
> > # CONFIG_PCMCIA_3C574 is not set
> > # CONFIG_PCMCIA_3C589 is not set
> > # CONFIG_VORTEX is not set
> > # CONFIG_TYPHOON is not set
> > CONFIG_NET_VENDOR_ADAPTEC=3Dy
> > # CONFIG_ADAPTEC_STARFIRE is not set
> > CONFIG_NET_VENDOR_AGERE=3Dy
> > # CONFIG_ET131X is not set
> > CONFIG_NET_VENDOR_ALACRITECH=3Dy
> > # CONFIG_SLICOSS is not set
> > CONFIG_NET_VENDOR_ALTEON=3Dy
> > # CONFIG_ACENIC is not set
> > # CONFIG_ALTERA_TSE is not set
> > CONFIG_NET_VENDOR_AMAZON=3Dy
> > CONFIG_NET_VENDOR_AMD=3Dy
> > # CONFIG_AMD8111_ETH is not set
> > # CONFIG_PCNET32 is not set
> > # CONFIG_PCMCIA_NMCLAN is not set
> > # CONFIG_AMD_XGBE is not set
> > CONFIG_NET_VENDOR_AQUANTIA=3Dy
> > # CONFIG_AQTION is not set
> > CONFIG_NET_VENDOR_ARC=3Dy
> > CONFIG_NET_VENDOR_ATHEROS=3Dy
> > # CONFIG_ATL2 is not set
> > # CONFIG_ATL1 is not set
> > # CONFIG_ATL1E is not set
> > # CONFIG_ATL1C is not set
> > # CONFIG_ALX is not set
> > # CONFIG_NET_VENDOR_AURORA is not set
> > CONFIG_NET_VENDOR_BROADCOM=3Dy
> > # CONFIG_B44 is not set
> > # CONFIG_BCMGENET is not set
> > # CONFIG_BNX2 is not set
> > # CONFIG_CNIC is not set
> > # CONFIG_TIGON3 is not set
> > # CONFIG_BNX2X is not set
> > # CONFIG_SYSTEMPORT is not set
> > # CONFIG_BNXT is not set
> > CONFIG_NET_VENDOR_BROCADE=3Dy
> > # CONFIG_BNA is not set
> > CONFIG_NET_CADENCE=3Dy
> > # CONFIG_MACB is not set
> > CONFIG_NET_VENDOR_CAVIUM=3Dy
> > # CONFIG_THUNDER_NIC_PF is not set
> > # CONFIG_THUNDER_NIC_VF is not set
> > # CONFIG_THUNDER_NIC_BGX is not set
> > # CONFIG_THUNDER_NIC_RGX is not set
> > CONFIG_CAVIUM_PTP=3Dy
> > # CONFIG_LIQUIDIO is not set
> > CONFIG_NET_VENDOR_CHELSIO=3Dy
> > # CONFIG_CHELSIO_T1 is not set
> > # CONFIG_CHELSIO_T3 is not set
> > # CONFIG_CHELSIO_T4 is not set
> > # CONFIG_CHELSIO_T4VF is not set
> > CONFIG_NET_VENDOR_CISCO=3Dy
> > # CONFIG_ENIC is not set
> > CONFIG_NET_VENDOR_CORTINA=3Dy
> > # CONFIG_GEMINI_ETHERNET is not set
> > # CONFIG_CX_ECAT is not set
> > # CONFIG_DNET is not set
> > CONFIG_NET_VENDOR_DEC=3Dy
> > # CONFIG_NET_TULIP is not set
> > CONFIG_NET_VENDOR_DLINK=3Dy
> > # CONFIG_DL2K is not set
> > # CONFIG_SUNDANCE is not set
> > CONFIG_NET_VENDOR_EMULEX=3Dy
> > # CONFIG_BE2NET is not set
> > CONFIG_NET_VENDOR_EZCHIP=3Dy
> > # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> > CONFIG_NET_VENDOR_FUJITSU=3Dy
> > # CONFIG_PCMCIA_FMVJ18X is not set
> > CONFIG_NET_VENDOR_HP=3Dy
> > # CONFIG_HP100 is not set
> > CONFIG_NET_VENDOR_HUAWEI=3Dy
> > CONFIG_NET_VENDOR_I825XX=3Dy
> > CONFIG_NET_VENDOR_INTEL=3Dy
> > # CONFIG_E100 is not set
> > CONFIG_E1000=3Dy
> > CONFIG_E1000E=3Dy
> > CONFIG_E1000E_HWTS=3Dy
> > CONFIG_IGB=3Dy
> > CONFIG_IGB_HWMON=3Dy
> > # CONFIG_IGBVF is not set
> > # CONFIG_IXGB is not set
> > CONFIG_IXGBE=3Dy
> > CONFIG_IXGBE_HWMON=3Dy
> > # CONFIG_I40E is not set
> > CONFIG_NET_VENDOR_EXAR=3Dy
> > # CONFIG_S2IO is not set
> > # CONFIG_VXGE is not set
> > # CONFIG_JME is not set
> > CONFIG_NET_VENDOR_MARVELL=3Dy
> > # CONFIG_MVMDIO is not set
> > # CONFIG_SKGE is not set
> > # CONFIG_SKY2 is not set
> > CONFIG_NET_VENDOR_MELLANOX=3Dy
> > # CONFIG_MLX4_EN is not set
> > # CONFIG_MLX5_CORE is not set
> > # CONFIG_MLXSW_CORE is not set
> > # CONFIG_MLXFW is not set
> > CONFIG_NET_VENDOR_MICREL=3Dy
> > # CONFIG_KS8851_MLL is not set
> > # CONFIG_KSZ884X_PCI is not set
> > CONFIG_NET_VENDOR_MICROSEMI=3Dy
> > CONFIG_NET_VENDOR_MYRI=3Dy
> > # CONFIG_MYRI10GE is not set
> > # CONFIG_FEALNX is not set
> > CONFIG_NET_VENDOR_NATSEMI=3Dy
> > # CONFIG_NATSEMI is not set
> > # CONFIG_NS83820 is not set
> > CONFIG_NET_VENDOR_NETRONOME=3Dy
> > CONFIG_NET_VENDOR_NI=3Dy
> > CONFIG_NET_VENDOR_8390=3Dy
> > # CONFIG_PCMCIA_AXNET is not set
> > # CONFIG_NE2K_PCI is not set
> > # CONFIG_PCMCIA_PCNET is not set
> > CONFIG_NET_VENDOR_NVIDIA=3Dy
> > # CONFIG_FORCEDETH is not set
> > CONFIG_NET_VENDOR_OKI=3Dy
> > # CONFIG_ETHOC is not set
> > CONFIG_NET_PACKET_ENGINE=3Dy
> > # CONFIG_HAMACHI is not set
> > # CONFIG_YELLOWFIN is not set
> > CONFIG_NET_VENDOR_QLOGIC=3Dy
> > # CONFIG_QLA3XXX is not set
> > # CONFIG_QLCNIC is not set
> > # CONFIG_QLGE is not set
> > # CONFIG_NETXEN_NIC is not set
> > # CONFIG_QED is not set
> > CONFIG_NET_VENDOR_QUALCOMM=3Dy
> > # CONFIG_QCA7000_UART is not set
> > # CONFIG_QCOM_EMAC is not set
> > # CONFIG_RMNET is not set
> > CONFIG_NET_VENDOR_RDC=3Dy
> > # CONFIG_R6040 is not set
> > CONFIG_NET_VENDOR_REALTEK=3Dy
> > # CONFIG_8139CP is not set
> > # CONFIG_8139TOO is not set
> > # CONFIG_R8169 is not set
> > CONFIG_NET_VENDOR_RENESAS=3Dy
> > CONFIG_NET_VENDOR_ROCKER=3Dy
> > CONFIG_NET_VENDOR_SAMSUNG=3Dy
> > # CONFIG_SXGBE_ETH is not set
> > CONFIG_NET_VENDOR_SEEQ=3Dy
> > CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> > # CONFIG_SFC is not set
> > # CONFIG_SFC_FALCON is not set
> > CONFIG_NET_VENDOR_SILAN=3Dy
> > # CONFIG_SC92031 is not set
> > CONFIG_NET_VENDOR_SIS=3Dy
> > # CONFIG_SIS900 is not set
> > # CONFIG_SIS190 is not set
> > CONFIG_NET_VENDOR_SMSC=3Dy
> > # CONFIG_PCMCIA_SMC91C92 is not set
> > # CONFIG_EPIC100 is not set
> > # CONFIG_SMSC911X is not set
> > # CONFIG_SMSC9420 is not set
> > CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> > CONFIG_NET_VENDOR_STMICRO=3Dy
> > # CONFIG_STMMAC_ETH is not set
> > CONFIG_NET_VENDOR_SUN=3Dy
> > # CONFIG_HAPPYMEAL is not set
> > # CONFIG_SUNGEM is not set
> > # CONFIG_CASSINI is not set
> > # CONFIG_NIU is not set
> > CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> > # CONFIG_DWC_XLGMAC is not set
> > CONFIG_NET_VENDOR_TEHUTI=3Dy
> > # CONFIG_TEHUTI is not set
> > CONFIG_NET_VENDOR_TI=3Dy
> > # CONFIG_TI_CPSW_ALE is not set
> > # CONFIG_TLAN is not set
> > CONFIG_NET_VENDOR_VIA=3Dy
> > # CONFIG_VIA_RHINE is not set
> > # CONFIG_VIA_VELOCITY is not set
> > CONFIG_NET_VENDOR_WIZNET=3Dy
> > # CONFIG_WIZNET_W5100 is not set
> > # CONFIG_WIZNET_W5300 is not set
> > CONFIG_NET_VENDOR_XIRCOM=3Dy
> > # CONFIG_PCMCIA_XIRC2PS is not set
> > # CONFIG_FDDI is not set
> > # CONFIG_HIPPI is not set
> > # CONFIG_NET_SB1000 is not set
> > # CONFIG_MDIO_DEVICE is not set
> > # CONFIG_PHYLIB is not set
> > # CONFIG_PPP is not set
> > # CONFIG_SLIP is not set
> > CONFIG_USB_NET_DRIVERS=3Dy
> > # CONFIG_USB_CATC is not set
> > # CONFIG_USB_KAWETH is not set
> > # CONFIG_USB_PEGASUS is not set
> > # CONFIG_USB_RTL8150 is not set
> > # CONFIG_USB_RTL8152 is not set
> > # CONFIG_USB_LAN78XX is not set
> > # CONFIG_USB_USBNET is not set
> > # CONFIG_USB_IPHETH is not set
> > CONFIG_WLAN=3Dy
> > CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> > CONFIG_WLAN_VENDOR_ATH=3Dy
> > # CONFIG_ATH_DEBUG is not set
> > # CONFIG_ATH5K_PCI is not set
> > CONFIG_WLAN_VENDOR_ATMEL=3Dy
> > CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> > CONFIG_WLAN_VENDOR_CISCO=3Dy
> > CONFIG_WLAN_VENDOR_INTEL=3Dy
> > CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> > # CONFIG_HOSTAP is not set
> > # CONFIG_PRISM54 is not set
> > CONFIG_WLAN_VENDOR_MARVELL=3Dy
> > CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> > CONFIG_WLAN_VENDOR_RALINK=3Dy
> > CONFIG_WLAN_VENDOR_REALTEK=3Dy
> > CONFIG_WLAN_VENDOR_RSI=3Dy
> > CONFIG_WLAN_VENDOR_ST=3Dy
> > CONFIG_WLAN_VENDOR_TI=3Dy
> > CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> > CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> > # CONFIG_PCMCIA_RAYCS is not set
> > =

> > #
> > # Enable WiMAX (Networking options) to see the WiMAX drivers
> > #
> > # CONFIG_WAN is not set
> > # CONFIG_VMXNET3 is not set
> > # CONFIG_FUJITSU_ES is not set
> > # CONFIG_NETDEVSIM is not set
> > # CONFIG_NET_FAILOVER is not set
> > # CONFIG_ISDN is not set
> > # CONFIG_NVM is not set
> > =

> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > CONFIG_INPUT_LEDS=3Dy
> > CONFIG_INPUT_FF_MEMLESS=3Dy
> > CONFIG_INPUT_POLLDEV=3Dy
> > CONFIG_INPUT_SPARSEKMAP=3Dy
> > CONFIG_INPUT_MATRIXKMAP=3Dy
> > =

> > #
> > # Userland interfaces
> > #
> > # CONFIG_INPUT_MOUSEDEV is not set
> > # CONFIG_INPUT_JOYDEV is not set
> > CONFIG_INPUT_EVDEV=3Dy
> > CONFIG_INPUT_EVBUG=3Dy
> > =

> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > # CONFIG_KEYBOARD_ADC is not set
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > # CONFIG_KEYBOARD_ADP5589 is not set
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_QT1070 is not set
> > # CONFIG_KEYBOARD_QT2160 is not set
> > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_GPIO is not set
> > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > # CONFIG_KEYBOARD_TCA6416 is not set
> > # CONFIG_KEYBOARD_TCA8418 is not set
> > # CONFIG_KEYBOARD_MATRIX is not set
> > # CONFIG_KEYBOARD_LM8323 is not set
> > # CONFIG_KEYBOARD_LM8333 is not set
> > # CONFIG_KEYBOARD_MAX7359 is not set
> > # CONFIG_KEYBOARD_MCS is not set
> > # CONFIG_KEYBOARD_MPR121 is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_SAMSUNG is not set
> > # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_STMPE is not set
> > # CONFIG_KEYBOARD_OMAP4 is not set
> > # CONFIG_KEYBOARD_TC3589X is not set
> > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_KEYBOARD_CROS_EC is not set
> > # CONFIG_KEYBOARD_CAP11XX is not set
> > # CONFIG_KEYBOARD_BCM is not set
> > # CONFIG_KEYBOARD_MTK_PMIC is not set
> > CONFIG_INPUT_MOUSE=3Dy
> > # CONFIG_MOUSE_PS2 is not set
> > # CONFIG_MOUSE_SERIAL is not set
> > CONFIG_MOUSE_APPLETOUCH=3Dy
> > # CONFIG_MOUSE_BCM5974 is not set
> > # CONFIG_MOUSE_CYAPA is not set
> > # CONFIG_MOUSE_ELAN_I2C is not set
> > CONFIG_MOUSE_VSXXXAA=3Dy
> > # CONFIG_MOUSE_GPIO is not set
> > CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
> > CONFIG_MOUSE_SYNAPTICS_USB=3Dy
> > CONFIG_INPUT_JOYSTICK=3Dy
> > CONFIG_JOYSTICK_ANALOG=3Dy
> > CONFIG_JOYSTICK_A3D=3Dy
> > CONFIG_JOYSTICK_ADI=3Dy
> > CONFIG_JOYSTICK_COBRA=3Dy
> > # CONFIG_JOYSTICK_GF2K is not set
> > # CONFIG_JOYSTICK_GRIP is not set
> > CONFIG_JOYSTICK_GRIP_MP=3Dy
> > # CONFIG_JOYSTICK_GUILLEMOT is not set
> > CONFIG_JOYSTICK_INTERACT=3Dy
> > # CONFIG_JOYSTICK_SIDEWINDER is not set
> > CONFIG_JOYSTICK_TMDC=3Dy
> > # CONFIG_JOYSTICK_IFORCE is not set
> > CONFIG_JOYSTICK_WARRIOR=3Dy
> > CONFIG_JOYSTICK_MAGELLAN=3Dy
> > CONFIG_JOYSTICK_SPACEORB=3Dy
> > # CONFIG_JOYSTICK_SPACEBALL is not set
> > CONFIG_JOYSTICK_STINGER=3Dy
> > CONFIG_JOYSTICK_TWIDJOY=3Dy
> > CONFIG_JOYSTICK_ZHENHUA=3Dy
> > CONFIG_JOYSTICK_AS5011=3Dy
> > CONFIG_JOYSTICK_JOYDUMP=3Dy
> > # CONFIG_JOYSTICK_XPAD is not set
> > CONFIG_JOYSTICK_PXRC=3Dy
> > # CONFIG_INPUT_TABLET is not set
> > CONFIG_INPUT_TOUCHSCREEN=3Dy
> > CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> > # CONFIG_TOUCHSCREEN_AD7879 is not set
> > CONFIG_TOUCHSCREEN_AR1021_I2C=3Dy
> > CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> > CONFIG_TOUCHSCREEN_ATMEL_MXT_T37=3Dy
> > CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> > CONFIG_TOUCHSCREEN_BU21013=3Dy
> > # CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
> > # CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
> > # CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
> > # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> > # CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
> > CONFIG_TOUCHSCREEN_DA9034=3Dy
> > CONFIG_TOUCHSCREEN_DA9052=3Dy
> > CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> > CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> > # CONFIG_TOUCHSCREEN_EETI is not set
> > # CONFIG_TOUCHSCREEN_EGALAX is not set
> > CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> > # CONFIG_TOUCHSCREEN_EXC3000 is not set
> > CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> > CONFIG_TOUCHSCREEN_GOODIX=3Dy
> > CONFIG_TOUCHSCREEN_HIDEEP=3Dy
> > # CONFIG_TOUCHSCREEN_ILI210X is not set
> > CONFIG_TOUCHSCREEN_S6SY761=3Dy
> > # CONFIG_TOUCHSCREEN_GUNZE is not set
> > # CONFIG_TOUCHSCREEN_EKTF2127 is not set
> > CONFIG_TOUCHSCREEN_ELAN=3Dy
> > CONFIG_TOUCHSCREEN_ELO=3Dy
> > CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> > CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> > CONFIG_TOUCHSCREEN_MAX11801=3Dy
> > CONFIG_TOUCHSCREEN_MCS5000=3Dy
> > CONFIG_TOUCHSCREEN_MMS114=3Dy
> > CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> > # CONFIG_TOUCHSCREEN_MTOUCH is not set
> > CONFIG_TOUCHSCREEN_IMX6UL_TSC=3Dy
> > CONFIG_TOUCHSCREEN_INEXIO=3Dy
> > # CONFIG_TOUCHSCREEN_MK712 is not set
> > CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> > CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> > CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> > CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> > CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
> > CONFIG_TOUCHSCREEN_UCB1400=3Dy
> > # CONFIG_TOUCHSCREEN_PIXCIR is not set
> > CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
> > CONFIG_TOUCHSCREEN_WM831X=3Dy
> > CONFIG_TOUCHSCREEN_WM97XX=3Dy
> > # CONFIG_TOUCHSCREEN_WM9705 is not set
> > # CONFIG_TOUCHSCREEN_WM9712 is not set
> > # CONFIG_TOUCHSCREEN_WM9713 is not set
> > CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dy
> > # CONFIG_TOUCHSCREEN_MC13783 is not set
> > CONFIG_TOUCHSCREEN_USB_EGALAX=3Dy
> > CONFIG_TOUCHSCREEN_USB_PANJIT=3Dy
> > CONFIG_TOUCHSCREEN_USB_3M=3Dy
> > CONFIG_TOUCHSCREEN_USB_ITM=3Dy
> > CONFIG_TOUCHSCREEN_USB_ETURBO=3Dy
> > CONFIG_TOUCHSCREEN_USB_GUNZE=3Dy
> > CONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy
> > CONFIG_TOUCHSCREEN_USB_IRTOUCH=3Dy
> > CONFIG_TOUCHSCREEN_USB_IDEALTEK=3Dy
> > CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=3Dy
> > CONFIG_TOUCHSCREEN_USB_GOTOP=3Dy
> > CONFIG_TOUCHSCREEN_USB_JASTEC=3Dy
> > CONFIG_TOUCHSCREEN_USB_ELO=3Dy
> > CONFIG_TOUCHSCREEN_USB_E2I=3Dy
> > CONFIG_TOUCHSCREEN_USB_ZYTRONIC=3Dy
> > CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=3Dy
> > CONFIG_TOUCHSCREEN_USB_NEXIO=3Dy
> > CONFIG_TOUCHSCREEN_USB_EASYTOUCH=3Dy
> > CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> > CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> > CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> > CONFIG_TOUCHSCREEN_TSC2004=3Dy
> > CONFIG_TOUCHSCREEN_TSC2007=3Dy
> > CONFIG_TOUCHSCREEN_TSC2007_IIO=3Dy
> > CONFIG_TOUCHSCREEN_RM_TS=3Dy
> > CONFIG_TOUCHSCREEN_SILEAD=3Dy
> > CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
> > # CONFIG_TOUCHSCREEN_ST1232 is not set
> > # CONFIG_TOUCHSCREEN_STMFTS is not set
> > CONFIG_TOUCHSCREEN_STMPE=3Dy
> > # CONFIG_TOUCHSCREEN_SX8654 is not set
> > CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> > CONFIG_TOUCHSCREEN_ZET6223=3Dy
> > CONFIG_TOUCHSCREEN_ZFORCE=3Dy
> > # CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
> > # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> > # CONFIG_INPUT_MISC is not set
> > CONFIG_RMI4_CORE=3Dy
> > # CONFIG_RMI4_I2C is not set
> > CONFIG_RMI4_SMB=3Dy
> > CONFIG_RMI4_F03=3Dy
> > CONFIG_RMI4_F03_SERIO=3Dy
> > # CONFIG_RMI4_F11 is not set
> > # CONFIG_RMI4_F12 is not set
> > CONFIG_RMI4_F30=3Dy
> > # CONFIG_RMI4_F34 is not set
> > # CONFIG_RMI4_F54 is not set
> > # CONFIG_RMI4_F55 is not set
> > =

> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > CONFIG_SERIO_SERPORT=3Dy
> > CONFIG_SERIO_CT82C710=3Dy
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=3Dy
> > # CONFIG_SERIO_RAW is not set
> > CONFIG_SERIO_ALTERA_PS2=3Dy
> > CONFIG_SERIO_PS2MULT=3Dy
> > CONFIG_SERIO_ARC_PS2=3Dy
> > # CONFIG_SERIO_APBPS2 is not set
> > CONFIG_SERIO_GPIO_PS2=3Dy
> > CONFIG_USERIO=3Dy
> > CONFIG_GAMEPORT=3Dy
> > CONFIG_GAMEPORT_NS558=3Dy
> > CONFIG_GAMEPORT_L4=3Dy
> > # CONFIG_GAMEPORT_EMU10K1 is not set
> > # CONFIG_GAMEPORT_FM801 is not set
> > =

> > #
> > # Character devices
> > #
> > CONFIG_TTY=3Dy
> > CONFIG_VT=3Dy
> > CONFIG_CONSOLE_TRANSLATIONS=3Dy
> > CONFIG_VT_CONSOLE=3Dy
> > CONFIG_VT_CONSOLE_SLEEP=3Dy
> > CONFIG_HW_CONSOLE=3Dy
> > CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> > CONFIG_UNIX98_PTYS=3Dy
> > CONFIG_LEGACY_PTYS=3Dy
> > CONFIG_LEGACY_PTY_COUNT=3D256
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_NOZOMI is not set
> > # CONFIG_N_GSM is not set
> > CONFIG_TRACE_ROUTER=3Dy
> > CONFIG_TRACE_SINK=3Dy
> > # CONFIG_GOLDFISH_TTY is not set
> > CONFIG_DEVMEM=3Dy
> > # CONFIG_DEVKMEM is not set
> > =

> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=3Dy
> > CONFIG_SERIAL_8250=3Dy
> > CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> > CONFIG_SERIAL_8250_PNP=3Dy
> > # CONFIG_SERIAL_8250_FINTEK is not set
> > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > CONFIG_SERIAL_8250_PCI=3Dy
> > CONFIG_SERIAL_8250_EXAR=3Dy
> > CONFIG_SERIAL_8250_CS=3Dy
> > # CONFIG_SERIAL_8250_MEN_MCB is not set
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > CONFIG_SERIAL_8250_EXTENDED=3Dy
> > CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> > CONFIG_SERIAL_8250_ASPEED_VUART=3Dy
> > CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> > CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> > CONFIG_SERIAL_8250_RSA=3Dy
> > CONFIG_SERIAL_8250_DW=3Dy
> > CONFIG_SERIAL_8250_RT288X=3Dy
> > CONFIG_SERIAL_8250_LPSS=3Dy
> > CONFIG_SERIAL_8250_MID=3Dy
> > # CONFIG_SERIAL_8250_MOXA is not set
> > CONFIG_SERIAL_OF_PLATFORM=3Dy
> > =

> > #
> > # Non-8250 serial port support
> > #
> > CONFIG_SERIAL_UARTLITE=3Dy
> > CONFIG_SERIAL_UARTLITE_CONSOLE=3Dy
> > CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > # CONFIG_SERIAL_JSM is not set
> > CONFIG_SERIAL_SCCNXP=3Dy
> > CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
> > CONFIG_SERIAL_SC16IS7XX_CORE=3Dy
> > CONFIG_SERIAL_SC16IS7XX=3Dy
> > CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
> > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > CONFIG_SERIAL_ALTERA_UART=3Dy
> > CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> > CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> > CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> > # CONFIG_SERIAL_XILINX_PS_UART is not set
> > # CONFIG_SERIAL_ARC is not set
> > # CONFIG_SERIAL_RP2 is not set
> > CONFIG_SERIAL_FSL_LPUART=3Dy
> > CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
> > CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
> > # CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
> > # CONFIG_SERIAL_MEN_Z135 is not set
> > CONFIG_SERIAL_DEV_BUS=3Dy
> > CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> > CONFIG_HVC_DRIVER=3Dy
> > CONFIG_VIRTIO_CONSOLE=3Dy
> > # CONFIG_IPMI_HANDLER is not set
> > CONFIG_HW_RANDOM=3Dy
> > CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> > CONFIG_HW_RANDOM_INTEL=3Dy
> > CONFIG_HW_RANDOM_AMD=3Dy
> > # CONFIG_HW_RANDOM_VIA is not set
> > CONFIG_HW_RANDOM_VIRTIO=3Dy
> > # CONFIG_NVRAM is not set
> > CONFIG_R3964=3Dy
> > # CONFIG_APPLICOM is not set
> > =

> > #
> > # PCMCIA character devices
> > #
> > CONFIG_SYNCLINK_CS=3Dy
> > # CONFIG_CARDMAN_4000 is not set
> > CONFIG_CARDMAN_4040=3Dy
> > CONFIG_SCR24X=3Dy
> > # CONFIG_IPWIRELESS is not set
> > CONFIG_MWAVE=3Dy
> > CONFIG_RAW_DRIVER=3Dy
> > CONFIG_MAX_RAW_DEVS=3D256
> > # CONFIG_HPET is not set
> > # CONFIG_HANGCHECK_TIMER is not set
> > CONFIG_TCG_TPM=3Dy
> > CONFIG_HW_RANDOM_TPM=3Dy
> > # CONFIG_TCG_TIS is not set
> > CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> > CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> > # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> > CONFIG_TCG_NSC=3Dy
> > # CONFIG_TCG_ATMEL is not set
> > # CONFIG_TCG_INFINEON is not set
> > # CONFIG_TCG_CRB is not set
> > CONFIG_TCG_VTPM_PROXY=3Dy
> > CONFIG_TCG_TIS_ST33ZP24=3Dy
> > CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> > CONFIG_TELCLOCK=3Dy
> > CONFIG_DEVPORT=3Dy
> > CONFIG_XILLYBUS=3Dy
> > # CONFIG_XILLYBUS_OF is not set
> > =

> > #
> > # I2C support
> > #
> > CONFIG_I2C=3Dy
> > CONFIG_ACPI_I2C_OPREGION=3Dy
> > CONFIG_I2C_BOARDINFO=3Dy
> > CONFIG_I2C_COMPAT=3Dy
> > CONFIG_I2C_CHARDEV=3Dy
> > CONFIG_I2C_MUX=3Dy
> > =

> > #
> > # Multiplexer I2C Chip support
> > #
> > CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
> > CONFIG_I2C_MUX_GPIO=3Dy
> > # CONFIG_I2C_MUX_GPMUX is not set
> > CONFIG_I2C_MUX_LTC4306=3Dy
> > CONFIG_I2C_MUX_PCA9541=3Dy
> > CONFIG_I2C_MUX_PCA954x=3Dy
> > CONFIG_I2C_MUX_PINCTRL=3Dy
> > CONFIG_I2C_MUX_REG=3Dy
> > CONFIG_I2C_DEMUX_PINCTRL=3Dy
> > CONFIG_I2C_MUX_MLXCPLD=3Dy
> > CONFIG_I2C_HELPER_AUTO=3Dy
> > CONFIG_I2C_SMBUS=3Dy
> > CONFIG_I2C_ALGOBIT=3Dy
> > =

> > #
> > # I2C Hardware Bus support
> > #
> > =

> > #
> > # PC SMBus host controller drivers
> > #
> > # CONFIG_I2C_ALI1535 is not set
> > # CONFIG_I2C_ALI1563 is not set
> > # CONFIG_I2C_ALI15X3 is not set
> > # CONFIG_I2C_AMD756 is not set
> > # CONFIG_I2C_AMD8111 is not set
> > # CONFIG_I2C_I801 is not set
> > # CONFIG_I2C_ISCH is not set
> > # CONFIG_I2C_ISMT is not set
> > # CONFIG_I2C_PIIX4 is not set
> > # CONFIG_I2C_NFORCE2 is not set
> > # CONFIG_I2C_SIS5595 is not set
> > # CONFIG_I2C_SIS630 is not set
> > # CONFIG_I2C_SIS96X is not set
> > # CONFIG_I2C_VIA is not set
> > # CONFIG_I2C_VIAPRO is not set
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_I2C_SCMI is not set
> > =

> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > CONFIG_I2C_CBUS_GPIO=3Dy
> > CONFIG_I2C_DESIGNWARE_CORE=3Dy
> > CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> > CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > # CONFIG_I2C_EMEV2 is not set
> > CONFIG_I2C_GPIO=3Dy
> > CONFIG_I2C_GPIO_FAULT_INJECTOR=3Dy
> > CONFIG_I2C_OCORES=3Dy
> > # CONFIG_I2C_PCA_PLATFORM is not set
> > # CONFIG_I2C_RK3X is not set
> > CONFIG_I2C_SIMTEC=3Dy
> > CONFIG_I2C_XILINX=3Dy
> > =

> > #
> > # External I2C/SMBus adapter drivers
> > #
> > CONFIG_I2C_DIOLAN_U2C=3Dy
> > CONFIG_I2C_DLN2=3Dy
> > CONFIG_I2C_PARPORT_LIGHT=3Dy
> > CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> > # CONFIG_I2C_TAOS_EVM is not set
> > # CONFIG_I2C_TINY_USB is not set
> > # CONFIG_I2C_VIPERBOARD is not set
> > =

> > #
> > # Other I2C/SMBus bus drivers
> > #
> > CONFIG_I2C_MLXCPLD=3Dy
> > CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> > CONFIG_I2C_SLAVE=3Dy
> > CONFIG_I2C_SLAVE_EEPROM=3Dy
> > # CONFIG_I2C_DEBUG_CORE is not set
> > # CONFIG_I2C_DEBUG_ALGO is not set
> > # CONFIG_I2C_DEBUG_BUS is not set
> > # CONFIG_SPI is not set
> > CONFIG_SPMI=3Dy
> > CONFIG_HSI=3Dy
> > CONFIG_HSI_BOARDINFO=3Dy
> > =

> > #
> > # HSI controllers
> > #
> > =

> > #
> > # HSI clients
> > #
> > # CONFIG_HSI_CHAR is not set
> > CONFIG_PPS=3Dy
> > # CONFIG_PPS_DEBUG is not set
> > # CONFIG_NTP_PPS is not set
> > =

> > #
> > # PPS clients support
> > #
> > # CONFIG_PPS_CLIENT_KTIMER is not set
> > # CONFIG_PPS_CLIENT_LDISC is not set
> > # CONFIG_PPS_CLIENT_GPIO is not set
> > =

> > #
> > # PPS generators support
> > #
> > =

> > #
> > # PTP clock support
> > #
> > CONFIG_PTP_1588_CLOCK=3Dy
> > =

> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
> > #
> > CONFIG_PTP_1588_CLOCK_KVM=3Dy
> > CONFIG_PINCTRL=3Dy
> > CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> > CONFIG_PINMUX=3Dy
> > CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> > CONFIG_PINCONF=3Dy
> > CONFIG_GENERIC_PINCONF=3Dy
> > # CONFIG_DEBUG_PINCTRL is not set
> > # CONFIG_PINCTRL_AXP209 is not set
> > # CONFIG_PINCTRL_AMD is not set
> > # CONFIG_PINCTRL_MCP23S08 is not set
> > CONFIG_PINCTRL_SINGLE=3Dy
> > # CONFIG_PINCTRL_SX150X is not set
> > # CONFIG_PINCTRL_MAX77620 is not set
> > CONFIG_PINCTRL_PALMAS=3Dy
> > CONFIG_PINCTRL_RK805=3Dy
> > # CONFIG_PINCTRL_BAYTRAIL is not set
> > # CONFIG_PINCTRL_CHERRYVIEW is not set
> > # CONFIG_PINCTRL_BROXTON is not set
> > # CONFIG_PINCTRL_CANNONLAKE is not set
> > # CONFIG_PINCTRL_CEDARFORK is not set
> > # CONFIG_PINCTRL_DENVERTON is not set
> > # CONFIG_PINCTRL_GEMINILAKE is not set
> > # CONFIG_PINCTRL_LEWISBURG is not set
> > # CONFIG_PINCTRL_SUNRISEPOINT is not set
> > CONFIG_GPIOLIB=3Dy
> > CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> > CONFIG_OF_GPIO=3Dy
> > CONFIG_GPIO_ACPI=3Dy
> > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > # CONFIG_DEBUG_GPIO is not set
> > CONFIG_GPIO_SYSFS=3Dy
> > CONFIG_GPIO_GENERIC=3Dy
> > =

> > #
> > # Memory mapped GPIO drivers
> > #
> > CONFIG_GPIO_74XX_MMIO=3Dy
> > CONFIG_GPIO_ALTERA=3Dy
> > # CONFIG_GPIO_AMDPT is not set
> > CONFIG_GPIO_DWAPB=3Dy
> > # CONFIG_GPIO_EXAR is not set
> > CONFIG_GPIO_FTGPIO010=3Dy
> > CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> > CONFIG_GPIO_GRGPIO=3Dy
> > # CONFIG_GPIO_HLWD is not set
> > # CONFIG_GPIO_ICH is not set
> > # CONFIG_GPIO_LYNXPOINT is not set
> > CONFIG_GPIO_MB86S7X=3Dy
> > # CONFIG_GPIO_MENZ127 is not set
> > CONFIG_GPIO_MOCKUP=3Dy
> > CONFIG_GPIO_SYSCON=3Dy
> > # CONFIG_GPIO_VX855 is not set
> > # CONFIG_GPIO_XILINX is not set
> > =

> > #
> > # Port-mapped I/O GPIO drivers
> > #
> > # CONFIG_GPIO_F7188X is not set
> > CONFIG_GPIO_IT87=3Dy
> > # CONFIG_GPIO_SCH is not set
> > CONFIG_GPIO_SCH311X=3Dy
> > # CONFIG_GPIO_WINBOND is not set
> > CONFIG_GPIO_WS16C48=3Dy
> > =

> > #
> > # I2C GPIO expanders
> > #
> > CONFIG_GPIO_ADP5588=3Dy
> > CONFIG_GPIO_ADP5588_IRQ=3Dy
> > CONFIG_GPIO_ADNP=3Dy
> > # CONFIG_GPIO_MAX7300 is not set
> > CONFIG_GPIO_MAX732X=3Dy
> > # CONFIG_GPIO_MAX732X_IRQ is not set
> > CONFIG_GPIO_PCA953X=3Dy
> > # CONFIG_GPIO_PCA953X_IRQ is not set
> > CONFIG_GPIO_PCF857X=3Dy
> > CONFIG_GPIO_TPIC2810=3Dy
> > =

> > #
> > # MFD GPIO expanders
> > #
> > CONFIG_GPIO_BD9571MWV=3Dy
> > # CONFIG_GPIO_DA9052 is not set
> > CONFIG_GPIO_DA9055=3Dy
> > # CONFIG_GPIO_DLN2 is not set
> > # CONFIG_GPIO_LP3943 is not set
> > CONFIG_GPIO_LP873X=3Dy
> > CONFIG_GPIO_LP87565=3Dy
> > # CONFIG_GPIO_MAX77620 is not set
> > CONFIG_GPIO_PALMAS=3Dy
> > CONFIG_GPIO_STMPE=3Dy
> > CONFIG_GPIO_TC3589X=3Dy
> > # CONFIG_GPIO_TPS65086 is not set
> > CONFIG_GPIO_TPS65218=3Dy
> > # CONFIG_GPIO_TPS6586X is not set
> > # CONFIG_GPIO_TPS65910 is not set
> > # CONFIG_GPIO_TPS65912 is not set
> > CONFIG_GPIO_UCB1400=3Dy
> > CONFIG_GPIO_WM831X=3Dy
> > # CONFIG_GPIO_WM8994 is not set
> > =

> > #
> > # PCI GPIO expanders
> > #
> > # CONFIG_GPIO_AMD8111 is not set
> > # CONFIG_GPIO_BT8XX is not set
> > # CONFIG_GPIO_ML_IOH is not set
> > # CONFIG_GPIO_PCI_IDIO_16 is not set
> > # CONFIG_GPIO_PCIE_IDIO_24 is not set
> > # CONFIG_GPIO_RDC321X is not set
> > # CONFIG_GPIO_SODAVILLE is not set
> > =

> > #
> > # USB GPIO expanders
> > #
> > # CONFIG_GPIO_VIPERBOARD is not set
> > CONFIG_W1=3Dy
> > =

> > #
> > # 1-wire Bus Masters
> > #
> > # CONFIG_W1_MASTER_MATROX is not set
> > CONFIG_W1_MASTER_DS2490=3Dy
> > CONFIG_W1_MASTER_DS2482=3Dy
> > # CONFIG_W1_MASTER_DS1WM is not set
> > CONFIG_W1_MASTER_GPIO=3Dy
> > =

> > #
> > # 1-wire Slaves
> > #
> > CONFIG_W1_SLAVE_THERM=3Dy
> > # CONFIG_W1_SLAVE_SMEM is not set
> > # CONFIG_W1_SLAVE_DS2405 is not set
> > CONFIG_W1_SLAVE_DS2408=3Dy
> > CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> > # CONFIG_W1_SLAVE_DS2413 is not set
> > CONFIG_W1_SLAVE_DS2406=3Dy
> > CONFIG_W1_SLAVE_DS2423=3Dy
> > # CONFIG_W1_SLAVE_DS2805 is not set
> > # CONFIG_W1_SLAVE_DS2431 is not set
> > # CONFIG_W1_SLAVE_DS2433 is not set
> > CONFIG_W1_SLAVE_DS2438=3Dy
> > CONFIG_W1_SLAVE_DS2760=3Dy
> > CONFIG_W1_SLAVE_DS2780=3Dy
> > CONFIG_W1_SLAVE_DS2781=3Dy
> > # CONFIG_W1_SLAVE_DS28E04 is not set
> > CONFIG_W1_SLAVE_DS28E17=3Dy
> > # CONFIG_POWER_AVS is not set
> > # CONFIG_POWER_RESET is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > CONFIG_POWER_SUPPLY_DEBUG=3Dy
> > # CONFIG_PDA_POWER is not set
> > # CONFIG_GENERIC_ADC_BATTERY is not set
> > CONFIG_MAX8925_POWER=3Dy
> > CONFIG_WM831X_BACKUP=3Dy
> > CONFIG_WM831X_POWER=3Dy
> > # CONFIG_TEST_POWER is not set
> > # CONFIG_BATTERY_ACT8945A is not set
> > CONFIG_BATTERY_DS2760=3Dy
> > CONFIG_BATTERY_DS2780=3Dy
> > # CONFIG_BATTERY_DS2781 is not set
> > # CONFIG_BATTERY_DS2782 is not set
> > CONFIG_BATTERY_LEGO_EV3=3Dy
> > # CONFIG_BATTERY_WM97XX is not set
> > CONFIG_BATTERY_SBS=3Dy
> > # CONFIG_CHARGER_SBS is not set
> > CONFIG_MANAGER_SBS=3Dy
> > # CONFIG_BATTERY_BQ27XXX is not set
> > CONFIG_BATTERY_DA9030=3Dy
> > CONFIG_BATTERY_DA9052=3Dy
> > CONFIG_CHARGER_DA9150=3Dy
> > CONFIG_BATTERY_DA9150=3Dy
> > CONFIG_CHARGER_AXP20X=3Dy
> > CONFIG_BATTERY_AXP20X=3Dy
> > # CONFIG_AXP20X_POWER is not set
> > CONFIG_AXP288_CHARGER=3Dy
> > # CONFIG_AXP288_FUEL_GAUGE is not set
> > CONFIG_BATTERY_MAX17040=3Dy
> > CONFIG_BATTERY_MAX17042=3Dy
> > CONFIG_BATTERY_MAX1721X=3Dy
> > CONFIG_CHARGER_PCF50633=3Dy
> > CONFIG_CHARGER_ISP1704=3Dy
> > CONFIG_CHARGER_MAX8903=3Dy
> > CONFIG_CHARGER_LP8727=3Dy
> > # CONFIG_CHARGER_GPIO is not set
> > # CONFIG_CHARGER_MANAGER is not set
> > CONFIG_CHARGER_LTC3651=3Dy
> > CONFIG_CHARGER_MAX14577=3Dy
> > # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> > CONFIG_CHARGER_MAX77693=3Dy
> > CONFIG_CHARGER_BQ2415X=3Dy
> > CONFIG_CHARGER_BQ24190=3Dy
> > CONFIG_CHARGER_BQ24257=3Dy
> > CONFIG_CHARGER_BQ24735=3Dy
> > # CONFIG_CHARGER_BQ25890 is not set
> > CONFIG_CHARGER_SMB347=3Dy
> > # CONFIG_CHARGER_TPS65090 is not set
> > CONFIG_CHARGER_TPS65217=3Dy
> > # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> > # CONFIG_BATTERY_GOLDFISH is not set
> > CONFIG_BATTERY_RT5033=3Dy
> > # CONFIG_CHARGER_RT9455 is not set
> > CONFIG_HWMON=3Dy
> > CONFIG_HWMON_VID=3Dy
> > CONFIG_HWMON_DEBUG_CHIP=3Dy
> > =

> > #
> > # Native drivers
> > #
> > CONFIG_SENSORS_ABITUGURU=3Dy
> > # CONFIG_SENSORS_ABITUGURU3 is not set
> > # CONFIG_SENSORS_AD7414 is not set
> > # CONFIG_SENSORS_AD7418 is not set
> > # CONFIG_SENSORS_ADM1021 is not set
> > CONFIG_SENSORS_ADM1025=3Dy
> > CONFIG_SENSORS_ADM1026=3Dy
> > CONFIG_SENSORS_ADM1029=3Dy
> > CONFIG_SENSORS_ADM1031=3Dy
> > CONFIG_SENSORS_ADM9240=3Dy
> > CONFIG_SENSORS_ADT7X10=3Dy
> > CONFIG_SENSORS_ADT7410=3Dy
> > # CONFIG_SENSORS_ADT7411 is not set
> > CONFIG_SENSORS_ADT7462=3Dy
> > CONFIG_SENSORS_ADT7470=3Dy
> > # CONFIG_SENSORS_ADT7475 is not set
> > CONFIG_SENSORS_ASC7621=3Dy
> > # CONFIG_SENSORS_K8TEMP is not set
> > # CONFIG_SENSORS_K10TEMP is not set
> > # CONFIG_SENSORS_FAM15H_POWER is not set
> > CONFIG_SENSORS_APPLESMC=3Dy
> > CONFIG_SENSORS_ASB100=3Dy
> > # CONFIG_SENSORS_ASPEED is not set
> > # CONFIG_SENSORS_ATXP1 is not set
> > CONFIG_SENSORS_DS620=3Dy
> > # CONFIG_SENSORS_DS1621 is not set
> > # CONFIG_SENSORS_DELL_SMM is not set
> > CONFIG_SENSORS_DA9052_ADC=3Dy
> > # CONFIG_SENSORS_DA9055 is not set
> > # CONFIG_SENSORS_I5K_AMB is not set
> > CONFIG_SENSORS_F71805F=3Dy
> > CONFIG_SENSORS_F71882FG=3Dy
> > CONFIG_SENSORS_F75375S=3Dy
> > CONFIG_SENSORS_MC13783_ADC=3Dy
> > CONFIG_SENSORS_FSCHMD=3Dy
> > CONFIG_SENSORS_GL518SM=3Dy
> > CONFIG_SENSORS_GL520SM=3Dy
> > # CONFIG_SENSORS_G760A is not set
> > # CONFIG_SENSORS_G762 is not set
> > CONFIG_SENSORS_GPIO_FAN=3Dy
> > CONFIG_SENSORS_HIH6130=3Dy
> > CONFIG_SENSORS_IIO_HWMON=3Dy
> > # CONFIG_SENSORS_I5500 is not set
> > CONFIG_SENSORS_CORETEMP=3Dy
> > CONFIG_SENSORS_IT87=3Dy
> > CONFIG_SENSORS_JC42=3Dy
> > # CONFIG_SENSORS_POWR1220 is not set
> > CONFIG_SENSORS_LINEAGE=3Dy
> > CONFIG_SENSORS_LTC2945=3Dy
> > CONFIG_SENSORS_LTC2990=3Dy
> > # CONFIG_SENSORS_LTC4151 is not set
> > CONFIG_SENSORS_LTC4215=3Dy
> > CONFIG_SENSORS_LTC4222=3Dy
> > CONFIG_SENSORS_LTC4245=3Dy
> > CONFIG_SENSORS_LTC4260=3Dy
> > CONFIG_SENSORS_LTC4261=3Dy
> > CONFIG_SENSORS_MAX16065=3Dy
> > # CONFIG_SENSORS_MAX1619 is not set
> > CONFIG_SENSORS_MAX1668=3Dy
> > CONFIG_SENSORS_MAX197=3Dy
> > CONFIG_SENSORS_MAX6621=3Dy
> > # CONFIG_SENSORS_MAX6639 is not set
> > CONFIG_SENSORS_MAX6642=3Dy
> > CONFIG_SENSORS_MAX6650=3Dy
> > CONFIG_SENSORS_MAX6697=3Dy
> > CONFIG_SENSORS_MAX31790=3Dy
> > CONFIG_SENSORS_MCP3021=3Dy
> > CONFIG_SENSORS_TC654=3Dy
> > CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> > CONFIG_SENSORS_LM63=3Dy
> > # CONFIG_SENSORS_LM73 is not set
> > CONFIG_SENSORS_LM75=3Dy
> > CONFIG_SENSORS_LM77=3Dy
> > CONFIG_SENSORS_LM78=3Dy
> > CONFIG_SENSORS_LM80=3Dy
> > CONFIG_SENSORS_LM83=3Dy
> > CONFIG_SENSORS_LM85=3Dy
> > # CONFIG_SENSORS_LM87 is not set
> > CONFIG_SENSORS_LM90=3Dy
> > # CONFIG_SENSORS_LM92 is not set
> > # CONFIG_SENSORS_LM93 is not set
> > # CONFIG_SENSORS_LM95234 is not set
> > CONFIG_SENSORS_LM95241=3Dy
> > CONFIG_SENSORS_LM95245=3Dy
> > CONFIG_SENSORS_PC87360=3Dy
> > # CONFIG_SENSORS_PC87427 is not set
> > # CONFIG_SENSORS_NTC_THERMISTOR is not set
> > # CONFIG_SENSORS_NCT6683 is not set
> > CONFIG_SENSORS_NCT6775=3Dy
> > CONFIG_SENSORS_NCT7802=3Dy
> > CONFIG_SENSORS_NCT7904=3Dy
> > CONFIG_SENSORS_PCF8591=3Dy
> > CONFIG_PMBUS=3Dy
> > CONFIG_SENSORS_PMBUS=3Dy
> > CONFIG_SENSORS_ADM1275=3Dy
> > CONFIG_SENSORS_IBM_CFFPS=3Dy
> > CONFIG_SENSORS_IR35221=3Dy
> > # CONFIG_SENSORS_LM25066 is not set
> > CONFIG_SENSORS_LTC2978=3Dy
> > # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> > # CONFIG_SENSORS_LTC3815 is not set
> > CONFIG_SENSORS_MAX16064=3Dy
> > CONFIG_SENSORS_MAX20751=3Dy
> > # CONFIG_SENSORS_MAX31785 is not set
> > CONFIG_SENSORS_MAX34440=3Dy
> > # CONFIG_SENSORS_MAX8688 is not set
> > # CONFIG_SENSORS_TPS40422 is not set
> > CONFIG_SENSORS_TPS53679=3Dy
> > CONFIG_SENSORS_UCD9000=3Dy
> > CONFIG_SENSORS_UCD9200=3Dy
> > # CONFIG_SENSORS_ZL6100 is not set
> > CONFIG_SENSORS_SHT15=3Dy
> > CONFIG_SENSORS_SHT21=3Dy
> > CONFIG_SENSORS_SHT3x=3Dy
> > CONFIG_SENSORS_SHTC1=3Dy
> > # CONFIG_SENSORS_SIS5595 is not set
> > # CONFIG_SENSORS_DME1737 is not set
> > CONFIG_SENSORS_EMC1403=3Dy
> > CONFIG_SENSORS_EMC2103=3Dy
> > # CONFIG_SENSORS_EMC6W201 is not set
> > # CONFIG_SENSORS_SMSC47M1 is not set
> > # CONFIG_SENSORS_SMSC47M192 is not set
> > CONFIG_SENSORS_SMSC47B397=3Dy
> > CONFIG_SENSORS_STTS751=3Dy
> > CONFIG_SENSORS_SMM665=3Dy
> > CONFIG_SENSORS_ADC128D818=3Dy
> > # CONFIG_SENSORS_ADS1015 is not set
> > CONFIG_SENSORS_ADS7828=3Dy
> > CONFIG_SENSORS_AMC6821=3Dy
> > # CONFIG_SENSORS_INA209 is not set
> > CONFIG_SENSORS_INA2XX=3Dy
> > CONFIG_SENSORS_INA3221=3Dy
> > CONFIG_SENSORS_TC74=3Dy
> > # CONFIG_SENSORS_THMC50 is not set
> > # CONFIG_SENSORS_TMP102 is not set
> > CONFIG_SENSORS_TMP103=3Dy
> > CONFIG_SENSORS_TMP108=3Dy
> > CONFIG_SENSORS_TMP401=3Dy
> > CONFIG_SENSORS_TMP421=3Dy
> > CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> > # CONFIG_SENSORS_VIA686A is not set
> > CONFIG_SENSORS_VT1211=3Dy
> > # CONFIG_SENSORS_VT8231 is not set
> > CONFIG_SENSORS_W83773G=3Dy
> > CONFIG_SENSORS_W83781D=3Dy
> > # CONFIG_SENSORS_W83791D is not set
> > CONFIG_SENSORS_W83792D=3Dy
> > CONFIG_SENSORS_W83793=3Dy
> > CONFIG_SENSORS_W83795=3Dy
> > # CONFIG_SENSORS_W83795_FANCTRL is not set
> > CONFIG_SENSORS_W83L785TS=3Dy
> > CONFIG_SENSORS_W83L786NG=3Dy
> > # CONFIG_SENSORS_W83627HF is not set
> > CONFIG_SENSORS_W83627EHF=3Dy
> > # CONFIG_SENSORS_WM831X is not set
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_SENSORS_ACPI_POWER is not set
> > # CONFIG_SENSORS_ATK0110 is not set
> > CONFIG_THERMAL=3Dy
> > # CONFIG_THERMAL_STATISTICS is not set
> > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> > # CONFIG_THERMAL_HWMON is not set
> > CONFIG_THERMAL_OF=3Dy
> > # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> > CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> > CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> > # CONFIG_THERMAL_GOV_USER_SPACE is not set
> > CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> > CONFIG_THERMAL_EMULATION=3Dy
> > # CONFIG_MAX77620_THERMAL is not set
> > CONFIG_QORIQ_THERMAL=3Dy
> > CONFIG_INTEL_POWERCLAMP=3Dy
> > # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> > =

> > #
> > # ACPI INT340X thermal drivers
> > #
> > # CONFIG_INT340X_THERMAL is not set
> > # CONFIG_INTEL_PCH_THERMAL is not set
> > CONFIG_QCOM_SPMI_TEMP_ALARM=3Dy
> > CONFIG_GENERIC_ADC_THERMAL=3Dy
> > # CONFIG_WATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=3Dy
> > CONFIG_SSB=3Dy
> > CONFIG_SSB_SPROM=3Dy
> > CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> > CONFIG_SSB_PCIHOST=3Dy
> > CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> > # CONFIG_SSB_PCMCIAHOST is not set
> > CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> > CONFIG_SSB_SDIOHOST=3Dy
> > # CONFIG_SSB_DEBUG is not set
> > CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> > # CONFIG_SSB_DRIVER_PCICORE is not set
> > # CONFIG_SSB_DRIVER_GPIO is not set
> > CONFIG_BCMA_POSSIBLE=3Dy
> > CONFIG_BCMA=3Dy
> > CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > CONFIG_BCMA_HOST_PCI=3Dy
> > CONFIG_BCMA_HOST_SOC=3Dy
> > CONFIG_BCMA_DRIVER_PCI=3Dy
> > # CONFIG_BCMA_SFLASH is not set
> > # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> > # CONFIG_BCMA_DRIVER_GPIO is not set
> > CONFIG_BCMA_DEBUG=3Dy
> > =

> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dy
> > CONFIG_MFD_ACT8945A=3Dy
> > # CONFIG_MFD_AS3711 is not set
> > # CONFIG_MFD_AS3722 is not set
> > # CONFIG_PMIC_ADP5520 is not set
> > CONFIG_MFD_AAT2870_CORE=3Dy
> > CONFIG_MFD_ATMEL_FLEXCOM=3Dy
> > # CONFIG_MFD_ATMEL_HLCDC is not set
> > CONFIG_MFD_BCM590XX=3Dy
> > CONFIG_MFD_BD9571MWV=3Dy
> > CONFIG_MFD_AXP20X=3Dy
> > CONFIG_MFD_AXP20X_I2C=3Dy
> > CONFIG_MFD_CROS_EC=3Dy
> > CONFIG_MFD_CROS_EC_I2C=3Dy
> > # CONFIG_MFD_CROS_EC_CHARDEV is not set
> > CONFIG_PMIC_DA903X=3Dy
> > CONFIG_PMIC_DA9052=3Dy
> > CONFIG_MFD_DA9052_I2C=3Dy
> > CONFIG_MFD_DA9055=3Dy
> > # CONFIG_MFD_DA9062 is not set
> > CONFIG_MFD_DA9063=3Dy
> > CONFIG_MFD_DA9150=3Dy
> > CONFIG_MFD_DLN2=3Dy
> > CONFIG_MFD_MC13XXX=3Dy
> > CONFIG_MFD_MC13XXX_I2C=3Dy
> > CONFIG_MFD_HI6421_PMIC=3Dy
> > # CONFIG_HTC_PASIC3 is not set
> > CONFIG_HTC_I2CPLD=3Dy
> > # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_LPC_SCH is not set
> > # CONFIG_INTEL_SOC_PMIC is not set
> > # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> > # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> > # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> > # CONFIG_MFD_INTEL_LPSS_PCI is not set
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > # CONFIG_MFD_KEMPLD is not set
> > CONFIG_MFD_88PM800=3Dy
> > CONFIG_MFD_88PM805=3Dy
> > # CONFIG_MFD_88PM860X is not set
> > CONFIG_MFD_MAX14577=3Dy
> > CONFIG_MFD_MAX77620=3Dy
> > CONFIG_MFD_MAX77686=3Dy
> > CONFIG_MFD_MAX77693=3Dy
> > # CONFIG_MFD_MAX77843 is not set
> > # CONFIG_MFD_MAX8907 is not set
> > CONFIG_MFD_MAX8925=3Dy
> > # CONFIG_MFD_MAX8997 is not set
> > # CONFIG_MFD_MAX8998 is not set
> > CONFIG_MFD_MT6397=3Dy
> > CONFIG_MFD_MENF21BMC=3Dy
> > CONFIG_MFD_VIPERBOARD=3Dy
> > CONFIG_MFD_RETU=3Dy
> > CONFIG_MFD_PCF50633=3Dy
> > # CONFIG_PCF50633_ADC is not set
> > CONFIG_PCF50633_GPIO=3Dy
> > CONFIG_UCB1400_CORE=3Dy
> > # CONFIG_MFD_RDC321X is not set
> > CONFIG_MFD_RT5033=3Dy
> > # CONFIG_MFD_RC5T583 is not set
> > CONFIG_MFD_RK808=3Dy
> > CONFIG_MFD_RN5T618=3Dy
> > # CONFIG_MFD_SEC_CORE is not set
> > # CONFIG_MFD_SI476X_CORE is not set
> > CONFIG_MFD_SM501=3Dy
> > # CONFIG_MFD_SM501_GPIO is not set
> > # CONFIG_MFD_SKY81452 is not set
> > CONFIG_MFD_SMSC=3Dy
> > # CONFIG_ABX500_CORE is not set
> > CONFIG_MFD_STMPE=3Dy
> > =

> > #
> > # STMicroelectronics STMPE Interface Drivers
> > #
> > CONFIG_STMPE_I2C=3Dy
> > CONFIG_MFD_SYSCON=3Dy
> > CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> > CONFIG_MFD_LP3943=3Dy
> > # CONFIG_MFD_LP8788 is not set
> > CONFIG_MFD_TI_LMU=3Dy
> > CONFIG_MFD_PALMAS=3Dy
> > CONFIG_TPS6105X=3Dy
> > # CONFIG_TPS65010 is not set
> > CONFIG_TPS6507X=3Dy
> > CONFIG_MFD_TPS65086=3Dy
> > CONFIG_MFD_TPS65090=3Dy
> > CONFIG_MFD_TPS65217=3Dy
> > # CONFIG_MFD_TPS68470 is not set
> > CONFIG_MFD_TI_LP873X=3Dy
> > CONFIG_MFD_TI_LP87565=3Dy
> > CONFIG_MFD_TPS65218=3Dy
> > CONFIG_MFD_TPS6586X=3Dy
> > CONFIG_MFD_TPS65910=3Dy
> > CONFIG_MFD_TPS65912=3Dy
> > CONFIG_MFD_TPS65912_I2C=3Dy
> > # CONFIG_MFD_TPS80031 is not set
> > # CONFIG_TWL4030_CORE is not set
> > # CONFIG_TWL6040_CORE is not set
> > # CONFIG_MFD_WL1273_CORE is not set
> > # CONFIG_MFD_LM3533 is not set
> > CONFIG_MFD_TC3589X=3Dy
> > # CONFIG_MFD_VX855 is not set
> > # CONFIG_MFD_ARIZONA_I2C is not set
> > CONFIG_MFD_WM8400=3Dy
> > CONFIG_MFD_WM831X=3Dy
> > CONFIG_MFD_WM831X_I2C=3Dy
> > # CONFIG_MFD_WM8350_I2C is not set
> > CONFIG_MFD_WM8994=3Dy
> > CONFIG_RAVE_SP_CORE=3Dy
> > CONFIG_REGULATOR=3Dy
> > # CONFIG_REGULATOR_DEBUG is not set
> > CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> > # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> > # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> > CONFIG_REGULATOR_88PG86X=3Dy
> > CONFIG_REGULATOR_88PM800=3Dy
> > # CONFIG_REGULATOR_ACT8865 is not set
> > # CONFIG_REGULATOR_ACT8945A is not set
> > CONFIG_REGULATOR_AD5398=3Dy
> > CONFIG_REGULATOR_ANATOP=3Dy
> > CONFIG_REGULATOR_AAT2870=3Dy
> > # CONFIG_REGULATOR_AXP20X is not set
> > CONFIG_REGULATOR_BCM590XX=3Dy
> > CONFIG_REGULATOR_BD9571MWV=3Dy
> > # CONFIG_REGULATOR_DA903X is not set
> > CONFIG_REGULATOR_DA9052=3Dy
> > CONFIG_REGULATOR_DA9055=3Dy
> > CONFIG_REGULATOR_DA9063=3Dy
> > CONFIG_REGULATOR_DA9210=3Dy
> > CONFIG_REGULATOR_DA9211=3Dy
> > CONFIG_REGULATOR_FAN53555=3Dy
> > # CONFIG_REGULATOR_GPIO is not set
> > CONFIG_REGULATOR_HI6421=3Dy
> > # CONFIG_REGULATOR_HI6421V530 is not set
> > CONFIG_REGULATOR_ISL9305=3Dy
> > CONFIG_REGULATOR_ISL6271A=3Dy
> > CONFIG_REGULATOR_LM363X=3Dy
> > # CONFIG_REGULATOR_LP3971 is not set
> > CONFIG_REGULATOR_LP3972=3Dy
> > CONFIG_REGULATOR_LP872X=3Dy
> > CONFIG_REGULATOR_LP873X=3Dy
> > # CONFIG_REGULATOR_LP8755 is not set
> > CONFIG_REGULATOR_LP87565=3Dy
> > CONFIG_REGULATOR_LTC3589=3Dy
> > CONFIG_REGULATOR_LTC3676=3Dy
> > CONFIG_REGULATOR_MAX14577=3Dy
> > CONFIG_REGULATOR_MAX1586=3Dy
> > CONFIG_REGULATOR_MAX77620=3Dy
> > CONFIG_REGULATOR_MAX8649=3Dy
> > CONFIG_REGULATOR_MAX8660=3Dy
> > # CONFIG_REGULATOR_MAX8925 is not set
> > # CONFIG_REGULATOR_MAX8952 is not set
> > CONFIG_REGULATOR_MAX8973=3Dy
> > CONFIG_REGULATOR_MAX77686=3Dy
> > CONFIG_REGULATOR_MAX77693=3Dy
> > CONFIG_REGULATOR_MAX77802=3Dy
> > CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> > CONFIG_REGULATOR_MC13783=3Dy
> > CONFIG_REGULATOR_MC13892=3Dy
> > # CONFIG_REGULATOR_MT6311 is not set
> > # CONFIG_REGULATOR_MT6323 is not set
> > CONFIG_REGULATOR_MT6397=3Dy
> > # CONFIG_REGULATOR_PALMAS is not set
> > # CONFIG_REGULATOR_PCF50633 is not set
> > CONFIG_REGULATOR_PFUZE100=3Dy
> > # CONFIG_REGULATOR_PV88060 is not set
> > # CONFIG_REGULATOR_PV88080 is not set
> > CONFIG_REGULATOR_PV88090=3Dy
> > CONFIG_REGULATOR_QCOM_SPMI=3Dy
> > # CONFIG_REGULATOR_RK808 is not set
> > CONFIG_REGULATOR_RN5T618=3Dy
> > CONFIG_REGULATOR_RT5033=3Dy
> > CONFIG_REGULATOR_SY8106A=3Dy
> > CONFIG_REGULATOR_TPS51632=3Dy
> > # CONFIG_REGULATOR_TPS6105X is not set
> > # CONFIG_REGULATOR_TPS62360 is not set
> > CONFIG_REGULATOR_TPS65023=3Dy
> > # CONFIG_REGULATOR_TPS6507X is not set
> > CONFIG_REGULATOR_TPS65086=3Dy
> > CONFIG_REGULATOR_TPS65090=3Dy
> > # CONFIG_REGULATOR_TPS65132 is not set
> > CONFIG_REGULATOR_TPS65217=3Dy
> > # CONFIG_REGULATOR_TPS65218 is not set
> > # CONFIG_REGULATOR_TPS6586X is not set
> > # CONFIG_REGULATOR_TPS65910 is not set
> > CONFIG_REGULATOR_TPS65912=3Dy
> > CONFIG_REGULATOR_VCTRL=3Dy
> > # CONFIG_REGULATOR_WM831X is not set
> > CONFIG_REGULATOR_WM8400=3Dy
> > # CONFIG_REGULATOR_WM8994 is not set
> > CONFIG_RC_CORE=3Dy
> > CONFIG_RC_MAP=3Dy
> > # CONFIG_LIRC is not set
> > # CONFIG_RC_DECODERS is not set
> > # CONFIG_RC_DEVICES is not set
> > CONFIG_MEDIA_SUPPORT=3Dy
> > =

> > #
> > # Multimedia core support
> > #
> > # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> > # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> > CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> > CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> > CONFIG_MEDIA_SDR_SUPPORT=3Dy
> > # CONFIG_MEDIA_CEC_SUPPORT is not set
> > CONFIG_MEDIA_CONTROLLER=3Dy
> > CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> > CONFIG_VIDEO_DEV=3Dy
> > # CONFIG_VIDEO_V4L2_SUBDEV_API is not set
> > CONFIG_VIDEO_V4L2=3Dy
> > # CONFIG_VIDEO_ADV_DEBUG is not set
> > # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> > CONFIG_V4L2_FWNODE=3Dy
> > CONFIG_DVB_CORE=3Dy
> > CONFIG_DVB_MMAP=3Dy
> > CONFIG_DVB_NET=3Dy
> > CONFIG_DVB_MAX_ADAPTERS=3D16
> > CONFIG_DVB_DYNAMIC_MINORS=3Dy
> > CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=3Dy
> > CONFIG_DVB_ULE_DEBUG=3Dy
> > =

> > #
> > # Media drivers
> > #
> > # CONFIG_MEDIA_USB_SUPPORT is not set
> > # CONFIG_MEDIA_PCI_SUPPORT is not set
> > # CONFIG_DVB_PLATFORM_DRIVERS is not set
> > # CONFIG_SDR_PLATFORM_DRIVERS is not set
> > =

> > #
> > # Supported MMC/SDIO adapters
> > #
> > CONFIG_SMS_SDIO_DRV=3Dy
> > # CONFIG_RADIO_ADAPTERS is not set
> > =

> > #
> > # Supported FireWire (IEEE 1394) Adapters
> > #
> > # CONFIG_DVB_FIREDTV is not set
> > CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> > =

> > #
> > # common driver options
> > #
> > CONFIG_CYPRESS_FIRMWARE=3Dy
> > CONFIG_VIDEOBUF2_CORE=3Dy
> > CONFIG_VIDEOBUF2_V4L2=3Dy
> > CONFIG_VIDEOBUF2_MEMOPS=3Dy
> > CONFIG_VIDEOBUF2_VMALLOC=3Dy
> > CONFIG_SMS_SIANO_MDTV=3Dy
> > # CONFIG_SMS_SIANO_RC is not set
> > =

> > #
> > # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> > #
> > # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> > CONFIG_VIDEO_IR_I2C=3Dy
> > =

> > #
> > # I2C Encoders, decoders, sensors and other helper chips
> > #
> > =

> > #
> > # Audio decoders, processors and mixers
> > #
> > CONFIG_VIDEO_TVAUDIO=3Dy
> > CONFIG_VIDEO_TDA7432=3Dy
> > # CONFIG_VIDEO_TDA9840 is not set
> > CONFIG_VIDEO_TEA6415C=3Dy
> > # CONFIG_VIDEO_TEA6420 is not set
> > CONFIG_VIDEO_MSP3400=3Dy
> > CONFIG_VIDEO_CS3308=3Dy
> > CONFIG_VIDEO_CS5345=3Dy
> > CONFIG_VIDEO_CS53L32A=3Dy
> > CONFIG_VIDEO_TLV320AIC23B=3Dy
> > CONFIG_VIDEO_UDA1342=3Dy
> > # CONFIG_VIDEO_WM8775 is not set
> > # CONFIG_VIDEO_WM8739 is not set
> > CONFIG_VIDEO_VP27SMPX=3Dy
> > # CONFIG_VIDEO_SONY_BTF_MPX is not set
> > =

> > #
> > # RDS decoders
> > #
> > CONFIG_VIDEO_SAA6588=3Dy
> > =

> > #
> > # Video decoders
> > #
> > # CONFIG_VIDEO_ADV7183 is not set
> > CONFIG_VIDEO_BT819=3Dy
> > # CONFIG_VIDEO_BT856 is not set
> > CONFIG_VIDEO_BT866=3Dy
> > # CONFIG_VIDEO_KS0127 is not set
> > # CONFIG_VIDEO_ML86V7667 is not set
> > CONFIG_VIDEO_AD5820=3Dy
> > # CONFIG_VIDEO_SAA7110 is not set
> > # CONFIG_VIDEO_SAA711X is not set
> > CONFIG_VIDEO_TVP514X=3Dy
> > CONFIG_VIDEO_TVP5150=3Dy
> > CONFIG_VIDEO_TVP7002=3Dy
> > # CONFIG_VIDEO_TW2804 is not set
> > CONFIG_VIDEO_TW9903=3Dy
> > CONFIG_VIDEO_TW9906=3Dy
> > CONFIG_VIDEO_TW9910=3Dy
> > # CONFIG_VIDEO_VPX3220 is not set
> > =

> > #
> > # Video and audio decoders
> > #
> > # CONFIG_VIDEO_SAA717X is not set
> > # CONFIG_VIDEO_CX25840 is not set
> > =

> > #
> > # Video encoders
> > #
> > # CONFIG_VIDEO_SAA7127 is not set
> > CONFIG_VIDEO_SAA7185=3Dy
> > CONFIG_VIDEO_ADV7170=3Dy
> > CONFIG_VIDEO_ADV7175=3Dy
> > # CONFIG_VIDEO_ADV7343 is not set
> > # CONFIG_VIDEO_ADV7393 is not set
> > CONFIG_VIDEO_AK881X=3Dy
> > CONFIG_VIDEO_THS8200=3Dy
> > =

> > #
> > # Camera sensor devices
> > #
> > CONFIG_VIDEO_MT9M111=3Dy
> > =

> > #
> > # Flash devices
> > #
> > =

> > #
> > # Video improvement chips
> > #
> > # CONFIG_VIDEO_UPD64031A is not set
> > # CONFIG_VIDEO_UPD64083 is not set
> > =

> > #
> > # Audio/Video compression chips
> > #
> > CONFIG_VIDEO_SAA6752HS=3Dy
> > =

> > #
> > # SDR tuner chips
> > #
> > CONFIG_SDR_MAX2175=3Dy
> > =

> > #
> > # Miscellaneous helper chips
> > #
> > CONFIG_VIDEO_THS7303=3Dy
> > # CONFIG_VIDEO_M52790 is not set
> > CONFIG_VIDEO_I2C=3Dy
> > =

> > #
> > # Sensors used on soc_camera driver
> > #
> > =

> > #
> > # SPI helper chips
> > #
> > CONFIG_MEDIA_TUNER=3Dy
> > =

> > #
> > # Customize TV tuners
> > #
> > # CONFIG_MEDIA_TUNER_SIMPLE is not set
> > CONFIG_MEDIA_TUNER_TDA18250=3Dy
> > # CONFIG_MEDIA_TUNER_TDA8290 is not set
> > CONFIG_MEDIA_TUNER_TDA827X=3Dy
> > CONFIG_MEDIA_TUNER_TDA18271=3Dy
> > CONFIG_MEDIA_TUNER_TDA9887=3Dy
> > CONFIG_MEDIA_TUNER_TEA5761=3Dy
> > CONFIG_MEDIA_TUNER_TEA5767=3Dy
> > CONFIG_MEDIA_TUNER_MT20XX=3Dy
> > CONFIG_MEDIA_TUNER_MT2060=3Dy
> > # CONFIG_MEDIA_TUNER_MT2063 is not set
> > # CONFIG_MEDIA_TUNER_MT2266 is not set
> > # CONFIG_MEDIA_TUNER_MT2131 is not set
> > CONFIG_MEDIA_TUNER_QT1010=3Dy
> > CONFIG_MEDIA_TUNER_XC2028=3Dy
> > CONFIG_MEDIA_TUNER_XC5000=3Dy
> > # CONFIG_MEDIA_TUNER_XC4000 is not set
> > CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> > # CONFIG_MEDIA_TUNER_MXL5007T is not set
> > CONFIG_MEDIA_TUNER_MC44S803=3Dy
> > CONFIG_MEDIA_TUNER_MAX2165=3Dy
> > CONFIG_MEDIA_TUNER_TDA18218=3Dy
> > CONFIG_MEDIA_TUNER_FC0011=3Dy
> > CONFIG_MEDIA_TUNER_FC0012=3Dy
> > CONFIG_MEDIA_TUNER_FC0013=3Dy
> > CONFIG_MEDIA_TUNER_TDA18212=3Dy
> > CONFIG_MEDIA_TUNER_E4000=3Dy
> > CONFIG_MEDIA_TUNER_FC2580=3Dy
> > CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
> > CONFIG_MEDIA_TUNER_TUA9001=3Dy
> > CONFIG_MEDIA_TUNER_SI2157=3Dy
> > # CONFIG_MEDIA_TUNER_IT913X is not set
> > CONFIG_MEDIA_TUNER_R820T=3Dy
> > # CONFIG_MEDIA_TUNER_MXL301RF is not set
> > # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> > CONFIG_MEDIA_TUNER_QM1D1B0004=3Dy
> > =

> > #
> > # Customise DVB Frontends
> > #
> > =

> > #
> > # Multistandard (satellite) frontends
> > #
> > CONFIG_DVB_STB0899=3Dy
> > # CONFIG_DVB_STB6100 is not set
> > CONFIG_DVB_STV090x=3Dy
> > # CONFIG_DVB_STV0910 is not set
> > CONFIG_DVB_STV6110x=3Dy
> > # CONFIG_DVB_STV6111 is not set
> > CONFIG_DVB_MXL5XX=3Dy
> > CONFIG_DVB_M88DS3103=3Dy
> > =

> > #
> > # Multistandard (cable + terrestrial) frontends
> > #
> > # CONFIG_DVB_DRXK is not set
> > CONFIG_DVB_TDA18271C2DD=3Dy
> > # CONFIG_DVB_SI2165 is not set
> > CONFIG_DVB_MN88472=3Dy
> > # CONFIG_DVB_MN88473 is not set
> > =

> > #
> > # DVB-S (satellite) frontends
> > #
> > # CONFIG_DVB_CX24110 is not set
> > CONFIG_DVB_CX24123=3Dy
> > # CONFIG_DVB_MT312 is not set
> > CONFIG_DVB_ZL10036=3Dy
> > # CONFIG_DVB_ZL10039 is not set
> > CONFIG_DVB_S5H1420=3Dy
> > # CONFIG_DVB_STV0288 is not set
> > CONFIG_DVB_STB6000=3Dy
> > # CONFIG_DVB_STV0299 is not set
> > CONFIG_DVB_STV6110=3Dy
> > CONFIG_DVB_STV0900=3Dy
> > CONFIG_DVB_TDA8083=3Dy
> > CONFIG_DVB_TDA10086=3Dy
> > CONFIG_DVB_TDA8261=3Dy
> > # CONFIG_DVB_VES1X93 is not set
> > CONFIG_DVB_TUNER_ITD1000=3Dy
> > # CONFIG_DVB_TUNER_CX24113 is not set
> > CONFIG_DVB_TDA826X=3Dy
> > CONFIG_DVB_TUA6100=3Dy
> > CONFIG_DVB_CX24116=3Dy
> > # CONFIG_DVB_CX24117 is not set
> > CONFIG_DVB_CX24120=3Dy
> > # CONFIG_DVB_SI21XX is not set
> > # CONFIG_DVB_TS2020 is not set
> > CONFIG_DVB_DS3000=3Dy
> > # CONFIG_DVB_MB86A16 is not set
> > # CONFIG_DVB_TDA10071 is not set
> > =

> > #
> > # DVB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_SP8870=3Dy
> > # CONFIG_DVB_SP887X is not set
> > CONFIG_DVB_CX22700=3Dy
> > # CONFIG_DVB_CX22702 is not set
> > CONFIG_DVB_S5H1432=3Dy
> > CONFIG_DVB_DRXD=3Dy
> > CONFIG_DVB_L64781=3Dy
> > # CONFIG_DVB_TDA1004X is not set
> > CONFIG_DVB_NXT6000=3Dy
> > # CONFIG_DVB_MT352 is not set
> > # CONFIG_DVB_ZL10353 is not set
> > # CONFIG_DVB_DIB3000MB is not set
> > CONFIG_DVB_DIB3000MC=3Dy
> > CONFIG_DVB_DIB7000M=3Dy
> > # CONFIG_DVB_DIB7000P is not set
> > CONFIG_DVB_DIB9000=3Dy
> > # CONFIG_DVB_TDA10048 is not set
> > CONFIG_DVB_AF9013=3Dy
> > # CONFIG_DVB_EC100 is not set
> > CONFIG_DVB_STV0367=3Dy
> > CONFIG_DVB_CXD2820R=3Dy
> > CONFIG_DVB_CXD2841ER=3Dy
> > CONFIG_DVB_RTL2830=3Dy
> > CONFIG_DVB_RTL2832=3Dy
> > # CONFIG_DVB_RTL2832_SDR is not set
> > # CONFIG_DVB_SI2168 is not set
> > CONFIG_DVB_ZD1301_DEMOD=3Dy
> > =

> > #
> > # DVB-C (cable) frontends
> > #
> > CONFIG_DVB_VES1820=3Dy
> > CONFIG_DVB_TDA10021=3Dy
> > CONFIG_DVB_TDA10023=3Dy
> > CONFIG_DVB_STV0297=3Dy
> > =

> > #
> > # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> > #
> > CONFIG_DVB_NXT200X=3Dy
> > # CONFIG_DVB_OR51211 is not set
> > # CONFIG_DVB_OR51132 is not set
> > CONFIG_DVB_BCM3510=3Dy
> > CONFIG_DVB_LGDT330X=3Dy
> > # CONFIG_DVB_LGDT3305 is not set
> > CONFIG_DVB_LGDT3306A=3Dy
> > CONFIG_DVB_LG2160=3Dy
> > CONFIG_DVB_S5H1409=3Dy
> > # CONFIG_DVB_AU8522_DTV is not set
> > # CONFIG_DVB_AU8522_V4L is not set
> > CONFIG_DVB_S5H1411=3Dy
> > =

> > #
> > # ISDB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_S921=3Dy
> > # CONFIG_DVB_DIB8000 is not set
> > # CONFIG_DVB_MB86A20S is not set
> > =

> > #
> > # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_TC90522=3Dy
> > =

> > #
> > # Digital terrestrial only tuners/PLL
> > #
> > # CONFIG_DVB_PLL is not set
> > CONFIG_DVB_TUNER_DIB0070=3Dy
> > CONFIG_DVB_TUNER_DIB0090=3Dy
> > =

> > #
> > # SEC control devices for DVB-S
> > #
> > CONFIG_DVB_DRX39XYJ=3Dy
> > # CONFIG_DVB_LNBH25 is not set
> > CONFIG_DVB_LNBP21=3Dy
> > # CONFIG_DVB_LNBP22 is not set
> > CONFIG_DVB_ISL6405=3Dy
> > CONFIG_DVB_ISL6421=3Dy
> > # CONFIG_DVB_ISL6423 is not set
> > CONFIG_DVB_A8293=3Dy
> > CONFIG_DVB_LGS8GL5=3Dy
> > CONFIG_DVB_LGS8GXX=3Dy
> > # CONFIG_DVB_ATBM8830 is not set
> > CONFIG_DVB_TDA665x=3Dy
> > # CONFIG_DVB_IX2505V is not set
> > CONFIG_DVB_M88RS2000=3Dy
> > CONFIG_DVB_AF9033=3Dy
> > CONFIG_DVB_HORUS3A=3Dy
> > CONFIG_DVB_ASCOT2E=3Dy
> > # CONFIG_DVB_HELENE is not set
> > =

> > #
> > # Common Interface (EN50221) controller drivers
> > #
> > CONFIG_DVB_CXD2099=3Dy
> > CONFIG_DVB_SP2=3Dy
> > =

> > #
> > # Tools to develop new frontends
> > #
> > CONFIG_DVB_DUMMY_FE=3Dy
> > =

> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=3D16
> > # CONFIG_VGA_SWITCHEROO is not set
> > CONFIG_DRM=3Dy
> > CONFIG_DRM_MIPI_DSI=3Dy
> > CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> > # CONFIG_DRM_DEBUG_MM is not set
> > CONFIG_DRM_DEBUG_SELFTEST=3Dy
> > CONFIG_DRM_KMS_HELPER=3Dy
> > CONFIG_DRM_KMS_FB_HELPER=3Dy
> > CONFIG_DRM_FBDEV_EMULATION=3Dy
> > CONFIG_DRM_FBDEV_OVERALLOC=3D100
> > CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> > CONFIG_DRM_TTM=3Dy
> > CONFIG_DRM_GEM_CMA_HELPER=3Dy
> > CONFIG_DRM_KMS_CMA_HELPER=3Dy
> > =

> > #
> > # I2C encoder or helper chips
> > #
> > CONFIG_DRM_I2C_CH7006=3Dy
> > CONFIG_DRM_I2C_SIL164=3Dy
> > # CONFIG_DRM_I2C_NXP_TDA998X is not set
> > # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> > # CONFIG_DRM_RADEON is not set
> > # CONFIG_DRM_AMDGPU is not set
> > =

> > #
> > # ACP (Audio CoProcessor) Configuration
> > #
> > =

> > #
> > # AMD Library routines
> > #
> > # CONFIG_DRM_NOUVEAU is not set
> > # CONFIG_DRM_I915 is not set
> > CONFIG_DRM_VGEM=3Dy
> > # CONFIG_DRM_VMWGFX is not set
> > # CONFIG_DRM_GMA500 is not set
> > # CONFIG_DRM_UDL is not set
> > # CONFIG_DRM_AST is not set
> > # CONFIG_DRM_MGAG200 is not set
> > # CONFIG_DRM_CIRRUS_QEMU is not set
> > # CONFIG_DRM_RCAR_DW_HDMI is not set
> > # CONFIG_DRM_RCAR_LVDS is not set
> > # CONFIG_DRM_QXL is not set
> > # CONFIG_DRM_BOCHS is not set
> > CONFIG_DRM_VIRTIO_GPU=3Dy
> > CONFIG_DRM_PANEL=3Dy
> > =

> > #
> > # Display Panels
> > #
> > # CONFIG_DRM_PANEL_ARM_VERSATILE is not set
> > # CONFIG_DRM_PANEL_LVDS is not set
> > CONFIG_DRM_PANEL_SIMPLE=3Dy
> > CONFIG_DRM_PANEL_INNOLUX_P079ZCA=3Dy
> > CONFIG_DRM_PANEL_JDI_LT070ME05000=3Dy
> > CONFIG_DRM_PANEL_ORISETECH_OTM8009A=3Dy
> > CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=3Dy
> > # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> > CONFIG_DRM_PANEL_RAYDIUM_RM68200=3Dy
> > CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dy
> > # CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
> > CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=3Dy
> > # CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
> > CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=3Dy
> > CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dy
> > CONFIG_DRM_BRIDGE=3Dy
> > CONFIG_DRM_PANEL_BRIDGE=3Dy
> > =

> > #
> > # Display Interface Bridges
> > #
> > CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> > CONFIG_DRM_CDNS_DSI=3Dy
> > CONFIG_DRM_DUMB_VGA_DAC=3Dy
> > # CONFIG_DRM_LVDS_ENCODER is not set
> > # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> > CONFIG_DRM_NXP_PTN3460=3Dy
> > CONFIG_DRM_PARADE_PS8622=3Dy
> > CONFIG_DRM_SIL_SII8620=3Dy
> > CONFIG_DRM_SII902X=3Dy
> > CONFIG_DRM_SII9234=3Dy
> > # CONFIG_DRM_THINE_THC63LVD1024 is not set
> > CONFIG_DRM_TOSHIBA_TC358767=3Dy
> > CONFIG_DRM_TI_TFP410=3Dy
> > CONFIG_DRM_I2C_ADV7511=3Dy
> > CONFIG_DRM_I2C_ADV7511_AUDIO=3Dy
> > # CONFIG_DRM_I2C_ADV7533 is not set
> > # CONFIG_DRM_I2C_ADV7511_CEC is not set
> > CONFIG_DRM_ARCPGU=3Dy
> > # CONFIG_DRM_HISI_HIBMC is not set
> > # CONFIG_DRM_MXSFB is not set
> > CONFIG_DRM_TINYDRM=3Dy
> > # CONFIG_DRM_LEGACY is not set
> > CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> > CONFIG_DRM_LIB_RANDOM=3Dy
> > =

> > #
> > # Frame buffer Devices
> > #
> > CONFIG_FB=3Dy
> > # CONFIG_FIRMWARE_EDID is not set
> > CONFIG_FB_CMDLINE=3Dy
> > CONFIG_FB_NOTIFY=3Dy
> > CONFIG_FB_CFB_FILLRECT=3Dy
> > CONFIG_FB_CFB_COPYAREA=3Dy
> > CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > CONFIG_FB_SYS_FILLRECT=3Dy
> > CONFIG_FB_SYS_COPYAREA=3Dy
> > CONFIG_FB_SYS_IMAGEBLIT=3Dy
> > # CONFIG_FB_FOREIGN_ENDIAN is not set
> > CONFIG_FB_SYS_FOPS=3Dy
> > CONFIG_FB_DEFERRED_IO=3Dy
> > CONFIG_FB_HECUBA=3Dy
> > CONFIG_FB_MODE_HELPERS=3Dy
> > CONFIG_FB_TILEBLITTING=3Dy
> > =

> > #
> > # Frame buffer hardware drivers
> > #
> > # CONFIG_FB_CIRRUS is not set
> > # CONFIG_FB_PM2 is not set
> > # CONFIG_FB_CYBER2000 is not set
> > CONFIG_FB_ARC=3Dy
> > # CONFIG_FB_ASILIANT is not set
> > # CONFIG_FB_IMSTT is not set
> > # CONFIG_FB_VGA16 is not set
> > # CONFIG_FB_VESA is not set
> > CONFIG_FB_N411=3Dy
> > # CONFIG_FB_HGA is not set
> > # CONFIG_FB_OPENCORES is not set
> > CONFIG_FB_S1D13XXX=3Dy
> > # CONFIG_FB_NVIDIA is not set
> > # CONFIG_FB_RIVA is not set
> > # CONFIG_FB_I740 is not set
> > # CONFIG_FB_LE80578 is not set
> > # CONFIG_FB_MATROX is not set
> > # CONFIG_FB_RADEON is not set
> > # CONFIG_FB_ATY128 is not set
> > # CONFIG_FB_ATY is not set
> > # CONFIG_FB_S3 is not set
> > # CONFIG_FB_SAVAGE is not set
> > # CONFIG_FB_SIS is not set
> > # CONFIG_FB_VIA is not set
> > # CONFIG_FB_NEOMAGIC is not set
> > # CONFIG_FB_KYRO is not set
> > # CONFIG_FB_3DFX is not set
> > # CONFIG_FB_VOODOO1 is not set
> > # CONFIG_FB_VT8623 is not set
> > # CONFIG_FB_TRIDENT is not set
> > # CONFIG_FB_ARK is not set
> > # CONFIG_FB_PM3 is not set
> > # CONFIG_FB_CARMINE is not set
> > CONFIG_FB_SM501=3Dy
> > # CONFIG_FB_SMSCUFX is not set
> > CONFIG_FB_UDL=3Dy
> > CONFIG_FB_IBM_GXT4500=3Dy
> > # CONFIG_FB_GOLDFISH is not set
> > CONFIG_FB_VIRTUAL=3Dy
> > CONFIG_FB_METRONOME=3Dy
> > # CONFIG_FB_MB862XX is not set
> > CONFIG_FB_BROADSHEET=3Dy
> > # CONFIG_FB_SIMPLE is not set
> > # CONFIG_FB_SSD1307 is not set
> > # CONFIG_FB_SM712 is not set
> > CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> > CONFIG_LCD_CLASS_DEVICE=3Dy
> > CONFIG_LCD_PLATFORM=3Dy
> > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> > CONFIG_BACKLIGHT_GENERIC=3Dy
> > CONFIG_BACKLIGHT_DA903X=3Dy
> > # CONFIG_BACKLIGHT_DA9052 is not set
> > # CONFIG_BACKLIGHT_MAX8925 is not set
> > # CONFIG_BACKLIGHT_APPLE is not set
> > CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> > CONFIG_BACKLIGHT_SAHARA=3Dy
> > CONFIG_BACKLIGHT_WM831X=3Dy
> > CONFIG_BACKLIGHT_ADP8860=3Dy
> > CONFIG_BACKLIGHT_ADP8870=3Dy
> > CONFIG_BACKLIGHT_PCF50633=3Dy
> > # CONFIG_BACKLIGHT_AAT2870 is not set
> > CONFIG_BACKLIGHT_LM3639=3Dy
> > CONFIG_BACKLIGHT_TPS65217=3Dy
> > # CONFIG_BACKLIGHT_GPIO is not set
> > CONFIG_BACKLIGHT_LV5207LP=3Dy
> > CONFIG_BACKLIGHT_BD6107=3Dy
> > CONFIG_BACKLIGHT_ARCXCNN=3Dy
> > CONFIG_BACKLIGHT_RAVE_SP=3Dy
> > CONFIG_VIDEOMODE_HELPERS=3Dy
> > CONFIG_HDMI=3Dy
> > =

> > #
> > # Console display driver support
> > #
> > CONFIG_VGA_CONSOLE=3Dy
> > # CONFIG_VGACON_SOFT_SCROLLBACK is not set
> > CONFIG_DUMMY_CONSOLE=3Dy
> > CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> > CONFIG_DUMMY_CONSOLE_ROWS=3D25
> > CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> > CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> > CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> > # CONFIG_LOGO is not set
> > CONFIG_SOUND=3Dy
> > CONFIG_SOUND_OSS_CORE=3Dy
> > # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> > CONFIG_SND=3Dy
> > CONFIG_SND_TIMER=3Dy
> > CONFIG_SND_PCM=3Dy
> > CONFIG_SND_PCM_ELD=3Dy
> > CONFIG_SND_PCM_IEC958=3Dy
> > CONFIG_SND_DMAENGINE_PCM=3Dy
> > CONFIG_SND_JACK=3Dy
> > CONFIG_SND_JACK_INPUT_DEV=3Dy
> > CONFIG_SND_OSSEMUL=3Dy
> > CONFIG_SND_MIXER_OSS=3Dy
> > # CONFIG_SND_PCM_OSS is not set
> > CONFIG_SND_PCM_TIMER=3Dy
> > CONFIG_SND_HRTIMER=3Dy
> > # CONFIG_SND_DYNAMIC_MINORS is not set
> > CONFIG_SND_SUPPORT_OLD_API=3Dy
> > CONFIG_SND_PROC_FS=3Dy
> > # CONFIG_SND_VERBOSE_PROCFS is not set
> > CONFIG_SND_VERBOSE_PRINTK=3Dy
> > CONFIG_SND_DEBUG=3Dy
> > # CONFIG_SND_DEBUG_VERBOSE is not set
> > CONFIG_SND_VMASTER=3Dy
> > CONFIG_SND_DMA_SGBUF=3Dy
> > # CONFIG_SND_SEQUENCER is not set
> > CONFIG_SND_AC97_CODEC=3Dy
> > # CONFIG_SND_DRIVERS is not set
> > CONFIG_SND_PCI=3Dy
> > # CONFIG_SND_AD1889 is not set
> > # CONFIG_SND_ALS300 is not set
> > # CONFIG_SND_ALS4000 is not set
> > # CONFIG_SND_ALI5451 is not set
> > # CONFIG_SND_ASIHPI is not set
> > # CONFIG_SND_ATIIXP is not set
> > # CONFIG_SND_ATIIXP_MODEM is not set
> > # CONFIG_SND_AU8810 is not set
> > # CONFIG_SND_AU8820 is not set
> > # CONFIG_SND_AU8830 is not set
> > # CONFIG_SND_AW2 is not set
> > # CONFIG_SND_AZT3328 is not set
> > # CONFIG_SND_BT87X is not set
> > # CONFIG_SND_CA0106 is not set
> > # CONFIG_SND_CMIPCI is not set
> > # CONFIG_SND_OXYGEN is not set
> > # CONFIG_SND_CS4281 is not set
> > # CONFIG_SND_CS46XX is not set
> > # CONFIG_SND_CTXFI is not set
> > # CONFIG_SND_DARLA20 is not set
> > # CONFIG_SND_GINA20 is not set
> > # CONFIG_SND_LAYLA20 is not set
> > # CONFIG_SND_DARLA24 is not set
> > # CONFIG_SND_GINA24 is not set
> > # CONFIG_SND_LAYLA24 is not set
> > # CONFIG_SND_MONA is not set
> > # CONFIG_SND_MIA is not set
> > # CONFIG_SND_ECHO3G is not set
> > # CONFIG_SND_INDIGO is not set
> > # CONFIG_SND_INDIGOIO is not set
> > # CONFIG_SND_INDIGODJ is not set
> > # CONFIG_SND_INDIGOIOX is not set
> > # CONFIG_SND_INDIGODJX is not set
> > # CONFIG_SND_EMU10K1 is not set
> > # CONFIG_SND_EMU10K1X is not set
> > # CONFIG_SND_ENS1370 is not set
> > # CONFIG_SND_ENS1371 is not set
> > # CONFIG_SND_ES1938 is not set
> > # CONFIG_SND_ES1968 is not set
> > # CONFIG_SND_FM801 is not set
> > # CONFIG_SND_HDSP is not set
> > # CONFIG_SND_HDSPM is not set
> > # CONFIG_SND_ICE1712 is not set
> > # CONFIG_SND_ICE1724 is not set
> > # CONFIG_SND_INTEL8X0 is not set
> > # CONFIG_SND_INTEL8X0M is not set
> > # CONFIG_SND_KORG1212 is not set
> > # CONFIG_SND_LOLA is not set
> > # CONFIG_SND_LX6464ES is not set
> > # CONFIG_SND_MAESTRO3 is not set
> > # CONFIG_SND_MIXART is not set
> > # CONFIG_SND_NM256 is not set
> > # CONFIG_SND_PCXHR is not set
> > # CONFIG_SND_RIPTIDE is not set
> > # CONFIG_SND_RME32 is not set
> > # CONFIG_SND_RME96 is not set
> > # CONFIG_SND_RME9652 is not set
> > # CONFIG_SND_SE6X is not set
> > # CONFIG_SND_SONICVIBES is not set
> > # CONFIG_SND_TRIDENT is not set
> > # CONFIG_SND_VIA82XX is not set
> > # CONFIG_SND_VIA82XX_MODEM is not set
> > # CONFIG_SND_VIRTUOSO is not set
> > # CONFIG_SND_VX222 is not set
> > # CONFIG_SND_YMFPCI is not set
> > =

> > #
> > # HD-Audio
> > #
> > # CONFIG_SND_HDA_INTEL is not set
> > CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> > # CONFIG_SND_USB is not set
> > # CONFIG_SND_FIREWIRE is not set
> > CONFIG_SND_PCMCIA=3Dy
> > # CONFIG_SND_VXPOCKET is not set
> > CONFIG_SND_PDAUDIOCF=3Dy
> > CONFIG_SND_SOC=3Dy
> > CONFIG_SND_SOC_AC97_BUS=3Dy
> > CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> > CONFIG_SND_SOC_AMD_ACP=3Dy
> > CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH=3Dy
> > # CONFIG_SND_SOC_AMD_CZ_RT5645_MACH is not set
> > CONFIG_SND_ATMEL_SOC=3Dy
> > # CONFIG_SND_DESIGNWARE_I2S is not set
> > =

> > #
> > # SoC Audio for Freescale CPUs
> > #
> > =

> > #
> > # Common SoC Audio options for Freescale CPUs:
> > #
> > # CONFIG_SND_SOC_FSL_ASRC is not set
> > CONFIG_SND_SOC_FSL_SAI=3Dy
> > CONFIG_SND_SOC_FSL_SSI=3Dy
> > CONFIG_SND_SOC_FSL_SPDIF=3Dy
> > CONFIG_SND_SOC_FSL_ESAI=3Dy
> > CONFIG_SND_SOC_IMX_AUDMUX=3Dy
> > # CONFIG_SND_I2S_HI6210_I2S is not set
> > # CONFIG_SND_SOC_IMG is not set
> > # CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
> > =

> > #
> > # STMicroelectronics STM32 SOC audio support
> > #
> > CONFIG_SND_SOC_XTFPGA_I2S=3Dy
> > # CONFIG_ZX_TDM is not set
> > CONFIG_SND_SOC_I2C_AND_SPI=3Dy
> > =

> > #
> > # CODEC drivers
> > #
> > CONFIG_SND_SOC_AC97_CODEC=3Dy
> > CONFIG_SND_SOC_ADAU_UTILS=3Dy
> > CONFIG_SND_SOC_ADAU1701=3Dy
> > CONFIG_SND_SOC_ADAU17X1=3Dy
> > CONFIG_SND_SOC_ADAU1761=3Dy
> > CONFIG_SND_SOC_ADAU1761_I2C=3Dy
> > CONFIG_SND_SOC_ADAU7002=3Dy
> > CONFIG_SND_SOC_AK4458=3Dy
> > CONFIG_SND_SOC_AK4554=3Dy
> > CONFIG_SND_SOC_AK4613=3Dy
> > CONFIG_SND_SOC_AK4642=3Dy
> > CONFIG_SND_SOC_AK5386=3Dy
> > CONFIG_SND_SOC_AK5558=3Dy
> > CONFIG_SND_SOC_ALC5623=3Dy
> > CONFIG_SND_SOC_BD28623=3Dy
> > CONFIG_SND_SOC_BT_SCO=3Dy
> > CONFIG_SND_SOC_CS35L32=3Dy
> > CONFIG_SND_SOC_CS35L33=3Dy
> > CONFIG_SND_SOC_CS35L34=3Dy
> > CONFIG_SND_SOC_CS35L35=3Dy
> > CONFIG_SND_SOC_CS42L42=3Dy
> > CONFIG_SND_SOC_CS42L51=3Dy
> > CONFIG_SND_SOC_CS42L51_I2C=3Dy
> > CONFIG_SND_SOC_CS42L52=3Dy
> > CONFIG_SND_SOC_CS42L56=3Dy
> > CONFIG_SND_SOC_CS42L73=3Dy
> > CONFIG_SND_SOC_CS4265=3Dy
> > CONFIG_SND_SOC_CS4270=3Dy
> > CONFIG_SND_SOC_CS4271=3Dy
> > CONFIG_SND_SOC_CS4271_I2C=3Dy
> > CONFIG_SND_SOC_CS42XX8=3Dy
> > CONFIG_SND_SOC_CS42XX8_I2C=3Dy
> > CONFIG_SND_SOC_CS43130=3Dy
> > CONFIG_SND_SOC_CS4349=3Dy
> > CONFIG_SND_SOC_CS53L30=3Dy
> > CONFIG_SND_SOC_DA7219=3Dy
> > CONFIG_SND_SOC_DIO2125=3Dy
> > CONFIG_SND_SOC_HDMI_CODEC=3Dy
> > CONFIG_SND_SOC_ES7134=3Dy
> > CONFIG_SND_SOC_ES8316=3Dy
> > CONFIG_SND_SOC_ES8328=3Dy
> > CONFIG_SND_SOC_ES8328_I2C=3Dy
> > CONFIG_SND_SOC_GTM601=3Dy
> > CONFIG_SND_SOC_INNO_RK3036=3Dy
> > CONFIG_SND_SOC_MAX98357A=3Dy
> > CONFIG_SND_SOC_MAX98504=3Dy
> > CONFIG_SND_SOC_MAX9867=3Dy
> > CONFIG_SND_SOC_MAX98927=3Dy
> > CONFIG_SND_SOC_MAX98373=3Dy
> > CONFIG_SND_SOC_MAX9860=3Dy
> > CONFIG_SND_SOC_MSM8916_WCD_ANALOG=3Dy
> > CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dy
> > CONFIG_SND_SOC_PCM1681=3Dy
> > CONFIG_SND_SOC_PCM1789=3Dy
> > CONFIG_SND_SOC_PCM1789_I2C=3Dy
> > CONFIG_SND_SOC_PCM179X=3Dy
> > CONFIG_SND_SOC_PCM179X_I2C=3Dy
> > CONFIG_SND_SOC_PCM186X=3Dy
> > CONFIG_SND_SOC_PCM186X_I2C=3Dy
> > CONFIG_SND_SOC_PCM3168A=3Dy
> > CONFIG_SND_SOC_PCM3168A_I2C=3Dy
> > CONFIG_SND_SOC_PCM512x=3Dy
> > CONFIG_SND_SOC_PCM512x_I2C=3Dy
> > CONFIG_SND_SOC_RL6231=3Dy
> > CONFIG_SND_SOC_RT5616=3Dy
> > CONFIG_SND_SOC_RT5631=3Dy
> > CONFIG_SND_SOC_SGTL5000=3Dy
> > CONFIG_SND_SOC_SIGMADSP=3Dy
> > CONFIG_SND_SOC_SIGMADSP_I2C=3Dy
> > CONFIG_SND_SOC_SIGMADSP_REGMAP=3Dy
> > CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dy
> > CONFIG_SND_SOC_SPDIF=3Dy
> > CONFIG_SND_SOC_SSM2305=3Dy
> > CONFIG_SND_SOC_SSM2602=3Dy
> > CONFIG_SND_SOC_SSM2602_I2C=3Dy
> > CONFIG_SND_SOC_SSM4567=3Dy
> > CONFIG_SND_SOC_STA32X=3Dy
> > CONFIG_SND_SOC_STA350=3Dy
> > CONFIG_SND_SOC_STI_SAS=3Dy
> > CONFIG_SND_SOC_TAS2552=3Dy
> > CONFIG_SND_SOC_TAS5086=3Dy
> > CONFIG_SND_SOC_TAS571X=3Dy
> > CONFIG_SND_SOC_TAS5720=3Dy
> > CONFIG_SND_SOC_TAS6424=3Dy
> > CONFIG_SND_SOC_TDA7419=3Dy
> > CONFIG_SND_SOC_TFA9879=3Dy
> > CONFIG_SND_SOC_TLV320AIC23=3Dy
> > CONFIG_SND_SOC_TLV320AIC23_I2C=3Dy
> > CONFIG_SND_SOC_TLV320AIC31XX=3Dy
> > CONFIG_SND_SOC_TLV320AIC32X4=3Dy
> > CONFIG_SND_SOC_TLV320AIC32X4_I2C=3Dy
> > CONFIG_SND_SOC_TLV320AIC3X=3Dy
> > CONFIG_SND_SOC_TS3A227E=3Dy
> > CONFIG_SND_SOC_TSCS42XX=3Dy
> > CONFIG_SND_SOC_TSCS454=3Dy
> > CONFIG_SND_SOC_WM8510=3Dy
> > CONFIG_SND_SOC_WM8523=3Dy
> > CONFIG_SND_SOC_WM8524=3Dy
> > CONFIG_SND_SOC_WM8580=3Dy
> > CONFIG_SND_SOC_WM8711=3Dy
> > CONFIG_SND_SOC_WM8728=3Dy
> > CONFIG_SND_SOC_WM8731=3Dy
> > CONFIG_SND_SOC_WM8737=3Dy
> > CONFIG_SND_SOC_WM8741=3Dy
> > CONFIG_SND_SOC_WM8750=3Dy
> > CONFIG_SND_SOC_WM8753=3Dy
> > CONFIG_SND_SOC_WM8776=3Dy
> > CONFIG_SND_SOC_WM8782=3Dy
> > CONFIG_SND_SOC_WM8804=3Dy
> > CONFIG_SND_SOC_WM8804_I2C=3Dy
> > CONFIG_SND_SOC_WM8903=3Dy
> > CONFIG_SND_SOC_WM8960=3Dy
> > CONFIG_SND_SOC_WM8962=3Dy
> > CONFIG_SND_SOC_WM8974=3Dy
> > CONFIG_SND_SOC_WM8978=3Dy
> > CONFIG_SND_SOC_WM8985=3Dy
> > CONFIG_SND_SOC_ZX_AUD96P22=3Dy
> > CONFIG_SND_SOC_MAX9759=3Dy
> > CONFIG_SND_SOC_MT6351=3Dy
> > CONFIG_SND_SOC_NAU8540=3Dy
> > CONFIG_SND_SOC_NAU8810=3Dy
> > CONFIG_SND_SOC_NAU8824=3Dy
> > CONFIG_SND_SOC_TPA6130A2=3Dy
> > CONFIG_SND_SIMPLE_CARD_UTILS=3Dy
> > CONFIG_SND_SIMPLE_CARD=3Dy
> > CONFIG_SND_SIMPLE_SCU_CARD=3Dy
> > CONFIG_SND_AUDIO_GRAPH_CARD=3Dy
> > CONFIG_SND_AUDIO_GRAPH_SCU_CARD=3Dy
> > CONFIG_SND_X86=3Dy
> > CONFIG_AC97_BUS=3Dy
> > =

> > #
> > # HID support
> > #
> > # CONFIG_HID is not set
> > =

> > #
> > # USB HID support
> > #
> > # CONFIG_USB_HID is not set
> > CONFIG_HID_PID=3Dy
> > =

> > #
> > # I2C HID support
> > #
> > # CONFIG_I2C_HID is not set
> > =

> > #
> > # Intel ISH HID support
> > #
> > # CONFIG_INTEL_ISH_HID is not set
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_COMMON=3Dy
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > CONFIG_USB=3Dy
> > CONFIG_USB_PCI=3Dy
> > # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> > =

> > #
> > # Miscellaneous USB options
> > #
> > # CONFIG_USB_DEFAULT_PERSIST is not set
> > CONFIG_USB_DYNAMIC_MINORS=3Dy
> > CONFIG_USB_OTG=3Dy
> > # CONFIG_USB_OTG_WHITELIST is not set
> > CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
> > CONFIG_USB_OTG_FSM=3Dy
> > CONFIG_USB_MON=3Dy
> > CONFIG_USB_WUSB=3Dy
> > CONFIG_USB_WUSB_CBAF=3Dy
> > CONFIG_USB_WUSB_CBAF_DEBUG=3Dy
> > =

> > #
> > # USB Host Controller Drivers
> > #
> > CONFIG_USB_C67X00_HCD=3Dy
> > CONFIG_USB_XHCI_HCD=3Dy
> > CONFIG_USB_XHCI_DBGCAP=3Dy
> > CONFIG_USB_XHCI_PCI=3Dy
> > CONFIG_USB_XHCI_PLATFORM=3Dy
> > CONFIG_USB_EHCI_HCD=3Dy
> > # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
> > # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> > CONFIG_USB_EHCI_PCI=3Dy
> > CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> > # CONFIG_USB_OXU210HP_HCD is not set
> > # CONFIG_USB_ISP116X_HCD is not set
> > CONFIG_USB_FOTG210_HCD=3Dy
> > # CONFIG_USB_OHCI_HCD is not set
> > # CONFIG_USB_UHCI_HCD is not set
> > # CONFIG_USB_U132_HCD is not set
> > CONFIG_USB_SL811_HCD=3Dy
> > CONFIG_USB_SL811_HCD_ISO=3Dy
> > # CONFIG_USB_SL811_CS is not set
> > CONFIG_USB_R8A66597_HCD=3Dy
> > # CONFIG_USB_WHCI_HCD is not set
> > CONFIG_USB_HWA_HCD=3Dy
> > # CONFIG_USB_HCD_BCMA is not set
> > CONFIG_USB_HCD_SSB=3Dy
> > CONFIG_USB_HCD_TEST_MODE=3Dy
> > =

> > #
> > # USB Device Class drivers
> > #
> > CONFIG_USB_ACM=3Dy
> > CONFIG_USB_PRINTER=3Dy
> > # CONFIG_USB_WDM is not set
> > CONFIG_USB_TMC=3Dy
> > =

> > #
> > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > #
> > =

> > #
> > # also be needed; see USB_STORAGE Help for more info
> > #
> > =

> > #
> > # USB Imaging devices
> > #
> > CONFIG_USB_MDC800=3Dy
> > # CONFIG_USBIP_CORE is not set
> > # CONFIG_USB_MUSB_HDRC is not set
> > CONFIG_USB_DWC3=3Dy
> > # CONFIG_USB_DWC3_ULPI is not set
> > CONFIG_USB_DWC3_HOST=3Dy
> > =

> > #
> > # Platform Glue Driver Support
> > #
> > CONFIG_USB_DWC3_PCI=3Dy
> > CONFIG_USB_DWC3_OF_SIMPLE=3Dy
> > # CONFIG_USB_DWC2 is not set
> > # CONFIG_USB_CHIPIDEA is not set
> > # CONFIG_USB_ISP1760 is not set
> > =

> > #
> > # USB port drivers
> > #
> > CONFIG_USB_SERIAL=3Dy
> > # CONFIG_USB_SERIAL_CONSOLE is not set
> > CONFIG_USB_SERIAL_GENERIC=3Dy
> > CONFIG_USB_SERIAL_SIMPLE=3Dy
> > # CONFIG_USB_SERIAL_AIRCABLE is not set
> > CONFIG_USB_SERIAL_ARK3116=3Dy
> > CONFIG_USB_SERIAL_BELKIN=3Dy
> > CONFIG_USB_SERIAL_CH341=3Dy
> > CONFIG_USB_SERIAL_WHITEHEAT=3Dy
> > # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> > CONFIG_USB_SERIAL_CP210X=3Dy
> > CONFIG_USB_SERIAL_CYPRESS_M8=3Dy
> > CONFIG_USB_SERIAL_EMPEG=3Dy
> > # CONFIG_USB_SERIAL_FTDI_SIO is not set
> > # CONFIG_USB_SERIAL_VISOR is not set
> > # CONFIG_USB_SERIAL_IPAQ is not set
> > CONFIG_USB_SERIAL_IR=3Dy
> > # CONFIG_USB_SERIAL_EDGEPORT is not set
> > CONFIG_USB_SERIAL_EDGEPORT_TI=3Dy
> > CONFIG_USB_SERIAL_F81232=3Dy
> > CONFIG_USB_SERIAL_F8153X=3Dy
> > # CONFIG_USB_SERIAL_GARMIN is not set
> > CONFIG_USB_SERIAL_IPW=3Dy
> > CONFIG_USB_SERIAL_IUU=3Dy
> > CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dy
> > # CONFIG_USB_SERIAL_KEYSPAN is not set
> > # CONFIG_USB_SERIAL_KLSI is not set
> > CONFIG_USB_SERIAL_KOBIL_SCT=3Dy
> > CONFIG_USB_SERIAL_MCT_U232=3Dy
> > # CONFIG_USB_SERIAL_METRO is not set
> > CONFIG_USB_SERIAL_MOS7720=3Dy
> > # CONFIG_USB_SERIAL_MOS7840 is not set
> > CONFIG_USB_SERIAL_MXUPORT=3Dy
> > CONFIG_USB_SERIAL_NAVMAN=3Dy
> > CONFIG_USB_SERIAL_PL2303=3Dy
> > CONFIG_USB_SERIAL_OTI6858=3Dy
> > CONFIG_USB_SERIAL_QCAUX=3Dy
> > CONFIG_USB_SERIAL_QUALCOMM=3Dy
> > CONFIG_USB_SERIAL_SPCP8X5=3Dy
> > CONFIG_USB_SERIAL_SAFE=3Dy
> > # CONFIG_USB_SERIAL_SAFE_PADDED is not set
> > # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> > CONFIG_USB_SERIAL_SYMBOL=3Dy
> > # CONFIG_USB_SERIAL_TI is not set
> > CONFIG_USB_SERIAL_CYBERJACK=3Dy
> > CONFIG_USB_SERIAL_XIRCOM=3Dy
> > CONFIG_USB_SERIAL_WWAN=3Dy
> > # CONFIG_USB_SERIAL_OPTION is not set
> > CONFIG_USB_SERIAL_OMNINET=3Dy
> > # CONFIG_USB_SERIAL_OPTICON is not set
> > # CONFIG_USB_SERIAL_XSENS_MT is not set
> > CONFIG_USB_SERIAL_WISHBONE=3Dy
> > CONFIG_USB_SERIAL_SSU100=3Dy
> > CONFIG_USB_SERIAL_QT2=3Dy
> > # CONFIG_USB_SERIAL_UPD78F0730 is not set
> > CONFIG_USB_SERIAL_DEBUG=3Dy
> > =

> > #
> > # USB Miscellaneous drivers
> > #
> > # CONFIG_USB_EMI62 is not set
> > CONFIG_USB_EMI26=3Dy
> > CONFIG_USB_ADUTUX=3Dy
> > CONFIG_USB_SEVSEG=3Dy
> > CONFIG_USB_RIO500=3Dy
> > CONFIG_USB_LEGOTOWER=3Dy
> > CONFIG_USB_LCD=3Dy
> > CONFIG_USB_CYPRESS_CY7C63=3Dy
> > CONFIG_USB_CYTHERM=3Dy
> > CONFIG_USB_IDMOUSE=3Dy
> > CONFIG_USB_FTDI_ELAN=3Dy
> > # CONFIG_USB_APPLEDISPLAY is not set
> > # CONFIG_USB_SISUSBVGA is not set
> > # CONFIG_USB_LD is not set
> > CONFIG_USB_TRANCEVIBRATOR=3Dy
> > CONFIG_USB_IOWARRIOR=3Dy
> > CONFIG_USB_TEST=3Dy
> > # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> > CONFIG_USB_ISIGHTFW=3Dy
> > CONFIG_USB_YUREX=3Dy
> > CONFIG_USB_EZUSB_FX2=3Dy
> > # CONFIG_USB_HUB_USB251XB is not set
> > CONFIG_USB_HSIC_USB3503=3Dy
> > CONFIG_USB_HSIC_USB4604=3Dy
> > CONFIG_USB_LINK_LAYER_TEST=3Dy
> > CONFIG_USB_CHAOSKEY=3Dy
> > =

> > #
> > # USB Physical Layer drivers
> > #
> > CONFIG_USB_PHY=3Dy
> > # CONFIG_NOP_USB_XCEIV is not set
> > # CONFIG_USB_GPIO_VBUS is not set
> > # CONFIG_TAHVO_USB is not set
> > CONFIG_USB_ISP1301=3Dy
> > # CONFIG_USB_GADGET is not set
> > # CONFIG_TYPEC is not set
> > # CONFIG_USB_ROLES_INTEL_XHCI is not set
> > CONFIG_USB_ULPI_BUS=3Dy
> > CONFIG_USB_ROLE_SWITCH=3Dy
> > CONFIG_UWB=3Dy
> > CONFIG_UWB_HWA=3Dy
> > # CONFIG_UWB_WHCI is not set
> > CONFIG_UWB_I1480U=3Dy
> > CONFIG_MMC=3Dy
> > # CONFIG_PWRSEQ_EMMC is not set
> > # CONFIG_PWRSEQ_SIMPLE is not set
> > CONFIG_MMC_BLOCK=3Dy
> > CONFIG_MMC_BLOCK_MINORS=3D8
> > # CONFIG_SDIO_UART is not set
> > # CONFIG_MMC_TEST is not set
> > =

> > #
> > # MMC/SD/SDIO Host Controller Drivers
> > #
> > CONFIG_MMC_DEBUG=3Dy
> > CONFIG_MMC_SDHCI=3Dy
> > # CONFIG_MMC_SDHCI_PCI is not set
> > # CONFIG_MMC_SDHCI_ACPI is not set
> > CONFIG_MMC_SDHCI_PLTFM=3Dy
> > # CONFIG_MMC_SDHCI_OF_ARASAN is not set
> > CONFIG_MMC_SDHCI_OF_AT91=3Dy
> > # CONFIG_MMC_SDHCI_CADENCE is not set
> > CONFIG_MMC_SDHCI_F_SDH30=3Dy
> > CONFIG_MMC_WBSD=3Dy
> > # CONFIG_MMC_TIFM_SD is not set
> > CONFIG_MMC_GOLDFISH=3Dy
> > # CONFIG_MMC_SDRICOH_CS is not set
> > # CONFIG_MMC_CB710 is not set
> > # CONFIG_MMC_VIA_SDMMC is not set
> > # CONFIG_MMC_VUB300 is not set
> > CONFIG_MMC_USHC=3Dy
> > CONFIG_MMC_USDHI6ROL0=3Dy
> > # CONFIG_MMC_CQHCI is not set
> > # CONFIG_MMC_TOSHIBA_PCI is not set
> > # CONFIG_MMC_MTK is not set
> > CONFIG_MMC_SDHCI_XENON=3Dy
> > # CONFIG_MMC_SDHCI_OMAP is not set
> > CONFIG_MEMSTICK=3Dy
> > CONFIG_MEMSTICK_DEBUG=3Dy
> > =

> > #
> > # MemoryStick drivers
> > #
> > CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> > CONFIG_MSPRO_BLOCK=3Dy
> > CONFIG_MS_BLOCK=3Dy
> > =

> > #
> > # MemoryStick Host Controller Drivers
> > #
> > # CONFIG_MEMSTICK_TIFM_MS is not set
> > # CONFIG_MEMSTICK_JMICRON_38X is not set
> > # CONFIG_MEMSTICK_R592 is not set
> > CONFIG_NEW_LEDS=3Dy
> > CONFIG_LEDS_CLASS=3Dy
> > CONFIG_LEDS_CLASS_FLASH=3Dy
> > # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> > =

> > #
> > # LED drivers
> > #
> > # CONFIG_LEDS_AAT1290 is not set
> > CONFIG_LEDS_APU=3Dy
> > CONFIG_LEDS_AS3645A=3Dy
> > CONFIG_LEDS_BCM6328=3Dy
> > # CONFIG_LEDS_BCM6358 is not set
> > CONFIG_LEDS_LM3530=3Dy
> > # CONFIG_LEDS_LM3642 is not set
> > CONFIG_LEDS_LM3692X=3Dy
> > CONFIG_LEDS_LM3601X=3Dy
> > # CONFIG_LEDS_MT6323 is not set
> > # CONFIG_LEDS_PCA9532 is not set
> > CONFIG_LEDS_GPIO=3Dy
> > # CONFIG_LEDS_LP3944 is not set
> > CONFIG_LEDS_LP3952=3Dy
> > CONFIG_LEDS_LP55XX_COMMON=3Dy
> > # CONFIG_LEDS_LP5521 is not set
> > # CONFIG_LEDS_LP5523 is not set
> > # CONFIG_LEDS_LP5562 is not set
> > CONFIG_LEDS_LP8501=3Dy
> > # CONFIG_LEDS_LP8860 is not set
> > # CONFIG_LEDS_CLEVO_MAIL is not set
> > CONFIG_LEDS_PCA955X=3Dy
> > CONFIG_LEDS_PCA955X_GPIO=3Dy
> > # CONFIG_LEDS_PCA963X is not set
> > CONFIG_LEDS_WM831X_STATUS=3Dy
> > CONFIG_LEDS_DA903X=3Dy
> > CONFIG_LEDS_DA9052=3Dy
> > # CONFIG_LEDS_REGULATOR is not set
> > CONFIG_LEDS_BD2802=3Dy
> > # CONFIG_LEDS_INTEL_SS4200 is not set
> > CONFIG_LEDS_LT3593=3Dy
> > # CONFIG_LEDS_MC13783 is not set
> > # CONFIG_LEDS_TCA6507 is not set
> > # CONFIG_LEDS_TLC591XX is not set
> > CONFIG_LEDS_MAX77693=3Dy
> > # CONFIG_LEDS_LM355x is not set
> > CONFIG_LEDS_MENF21BMC=3Dy
> > # CONFIG_LEDS_KTD2692 is not set
> > # CONFIG_LEDS_IS31FL319X is not set
> > CONFIG_LEDS_IS31FL32XX=3Dy
> > =

> > #
> > # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
> > #
> > CONFIG_LEDS_BLINKM=3Dy
> > # CONFIG_LEDS_SYSCON is not set
> > CONFIG_LEDS_MLXCPLD=3Dy
> > # CONFIG_LEDS_MLXREG is not set
> > CONFIG_LEDS_USER=3Dy
> > # CONFIG_LEDS_NIC78BX is not set
> > =

> > #
> > # LED Triggers
> > #
> > # CONFIG_LEDS_TRIGGERS is not set
> > CONFIG_ACCESSIBILITY=3Dy
> > # CONFIG_A11Y_BRAILLE_CONSOLE is not set
> > # CONFIG_INFINIBAND is not set
> > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > CONFIG_EDAC_SUPPORT=3Dy
> > # CONFIG_EDAC is not set
> > CONFIG_RTC_LIB=3Dy
> > CONFIG_RTC_MC146818_LIB=3Dy
> > # CONFIG_RTC_CLASS is not set
> > # CONFIG_DMADEVICES is not set
> > =

> > #
> > # DMABUF options
> > #
> > CONFIG_SYNC_FILE=3Dy
> > # CONFIG_SW_SYNC is not set
> > # CONFIG_AUXDISPLAY is not set
> > CONFIG_UIO=3Dy
> > # CONFIG_UIO_CIF is not set
> > CONFIG_UIO_PDRV_GENIRQ=3Dy
> > CONFIG_UIO_DMEM_GENIRQ=3Dy
> > # CONFIG_UIO_AEC is not set
> > # CONFIG_UIO_SERCOS3 is not set
> > # CONFIG_UIO_PCI_GENERIC is not set
> > # CONFIG_UIO_NETX is not set
> > # CONFIG_UIO_PRUSS is not set
> > # CONFIG_UIO_MF624 is not set
> > CONFIG_VIRT_DRIVERS=3Dy
> > # CONFIG_VBOXGUEST is not set
> > CONFIG_VIRTIO=3Dy
> > # CONFIG_VIRTIO_MENU is not set
> > =

> > #
> > # Microsoft Hyper-V guest support
> > #
> > # CONFIG_HYPERV is not set
> > # CONFIG_STAGING is not set
> > CONFIG_X86_PLATFORM_DEVICES=3Dy
> > # CONFIG_ACER_WIRELESS is not set
> > # CONFIG_ACERHDF is not set
> > # CONFIG_ASUS_LAPTOP is not set
> > CONFIG_DELL_SMBIOS=3Dy
> > # CONFIG_DELL_SMBIOS_SMM is not set
> > CONFIG_DELL_LAPTOP=3Dy
> > # CONFIG_DELL_SMO8800 is not set
> > # CONFIG_FUJITSU_LAPTOP is not set
> > # CONFIG_FUJITSU_TABLET is not set
> > # CONFIG_GPD_POCKET_FAN is not set
> > # CONFIG_HP_ACCEL is not set
> > # CONFIG_HP_WIRELESS is not set
> > # CONFIG_PANASONIC_LAPTOP is not set
> > # CONFIG_THINKPAD_ACPI is not set
> > # CONFIG_SENSORS_HDAPS is not set
> > # CONFIG_INTEL_MENLOW is not set
> > # CONFIG_ASUS_WIRELESS is not set
> > # CONFIG_ACPI_WMI is not set
> > # CONFIG_TOPSTAR_LAPTOP is not set
> > # CONFIG_TOSHIBA_BT_RFKILL is not set
> > # CONFIG_TOSHIBA_HAPS is not set
> > # CONFIG_ACPI_CMPC is not set
> > # CONFIG_INTEL_CHT_INT33FE is not set
> > # CONFIG_INTEL_INT0002_VGPIO is not set
> > # CONFIG_INTEL_HID_EVENT is not set
> > # CONFIG_INTEL_VBTN is not set
> > # CONFIG_INTEL_IPS is not set
> > # CONFIG_INTEL_PMC_CORE is not set
> > # CONFIG_IBM_RTL is not set
> > # CONFIG_SAMSUNG_LAPTOP is not set
> > # CONFIG_SAMSUNG_Q10 is not set
> > # CONFIG_APPLE_GMUX is not set
> > # CONFIG_INTEL_RST is not set
> > # CONFIG_INTEL_SMARTCONNECT is not set
> > # CONFIG_PVPANIC is not set
> > # CONFIG_INTEL_PMC_IPC is not set
> > # CONFIG_SURFACE_PRO3_BUTTON is not set
> > CONFIG_INTEL_PUNIT_IPC=3Dy
> > CONFIG_MLX_PLATFORM=3Dy
> > # CONFIG_SILEAD_DMI is not set
> > CONFIG_PMC_ATOM=3Dy
> > # CONFIG_GOLDFISH_BUS is not set
> > # CONFIG_GOLDFISH_PIPE is not set
> > CONFIG_CHROME_PLATFORMS=3Dy
> > CONFIG_CHROMEOS_LAPTOP=3Dy
> > CONFIG_CHROMEOS_PSTORE=3Dy
> > # CONFIG_CHROMEOS_TBMC is not set
> > # CONFIG_CROS_EC_LPC is not set
> > CONFIG_CROS_EC_PROTO=3Dy
> > # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> > CONFIG_MELLANOX_PLATFORM=3Dy
> > CONFIG_MLXREG_HOTPLUG=3Dy
> > CONFIG_CLKDEV_LOOKUP=3Dy
> > CONFIG_HAVE_CLK_PREPARE=3Dy
> > CONFIG_COMMON_CLK=3Dy
> > =

> > #
> > # Common Clock Framework
> > #
> > # CONFIG_COMMON_CLK_WM831X is not set
> > # CONFIG_CLK_HSDK is not set
> > # CONFIG_COMMON_CLK_MAX77686 is not set
> > # CONFIG_COMMON_CLK_RK808 is not set
> > # CONFIG_COMMON_CLK_SI5351 is not set
> > # CONFIG_COMMON_CLK_SI514 is not set
> > # CONFIG_COMMON_CLK_SI544 is not set
> > # CONFIG_COMMON_CLK_SI570 is not set
> > # CONFIG_COMMON_CLK_CDCE706 is not set
> > # CONFIG_COMMON_CLK_CDCE925 is not set
> > # CONFIG_COMMON_CLK_CS2000_CP is not set
> > # CONFIG_COMMON_CLK_PALMAS is not set
> > # CONFIG_COMMON_CLK_VC5 is not set
> > CONFIG_HWSPINLOCK=3Dy
> > =

> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_I8253_LOCK=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > # CONFIG_MAILBOX is not set
> > CONFIG_IOMMU_SUPPORT=3Dy
> > =

> > #
> > # Generic IOMMU Pagetable Support
> > #
> > # CONFIG_AMD_IOMMU is not set
> > =

> > #
> > # Remoteproc drivers
> > #
> > CONFIG_REMOTEPROC=3Dy
> > =

> > #
> > # Rpmsg drivers
> > #
> > CONFIG_RPMSG=3Dy
> > # CONFIG_RPMSG_CHAR is not set
> > CONFIG_RPMSG_VIRTIO=3Dy
> > CONFIG_SOUNDWIRE=3Dy
> > =

> > #
> > # SoundWire Devices
> > #
> > # CONFIG_SOUNDWIRE_INTEL is not set
> > =

> > #
> > # SOC (System On Chip) specific Drivers
> > #
> > =

> > #
> > # Amlogic SoC drivers
> > #
> > =

> > #
> > # Broadcom SoC drivers
> > #
> > =

> > #
> > # i.MX SoC drivers
> > #
> > =

> > #
> > # Qualcomm SoC drivers
> > #
> > # CONFIG_SOC_TI is not set
> > =

> > #
> > # Xilinx SoC drivers
> > #
> > CONFIG_XILINX_VCU=3Dy
> > # CONFIG_PM_DEVFREQ is not set
> > CONFIG_EXTCON=3Dy
> > =

> > #
> > # Extcon Device Drivers
> > #
> > # CONFIG_EXTCON_ADC_JACK is not set
> > CONFIG_EXTCON_AXP288=3Dy
> > CONFIG_EXTCON_GPIO=3Dy
> > # CONFIG_EXTCON_INTEL_INT3496 is not set
> > CONFIG_EXTCON_MAX14577=3Dy
> > # CONFIG_EXTCON_MAX3355 is not set
> > CONFIG_EXTCON_MAX77693=3Dy
> > CONFIG_EXTCON_PALMAS=3Dy
> > CONFIG_EXTCON_RT8973A=3Dy
> > CONFIG_EXTCON_SM5502=3Dy
> > CONFIG_EXTCON_USB_GPIO=3Dy
> > # CONFIG_EXTCON_USBC_CROS_EC is not set
> > # CONFIG_MEMORY is not set
> > CONFIG_IIO=3Dy
> > CONFIG_IIO_BUFFER=3Dy
> > CONFIG_IIO_BUFFER_CB=3Dy
> > CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
> > CONFIG_IIO_KFIFO_BUF=3Dy
> > CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> > CONFIG_IIO_CONFIGFS=3Dy
> > CONFIG_IIO_TRIGGER=3Dy
> > CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> > CONFIG_IIO_SW_DEVICE=3Dy
> > # CONFIG_IIO_SW_TRIGGER is not set
> > =

> > #
> > # Accelerometers
> > #
> > CONFIG_ADXL345=3Dy
> > CONFIG_ADXL345_I2C=3Dy
> > # CONFIG_BMA180 is not set
> > CONFIG_BMC150_ACCEL=3Dy
> > CONFIG_BMC150_ACCEL_I2C=3Dy
> > CONFIG_DA280=3Dy
> > CONFIG_DA311=3Dy
> > CONFIG_DMARD06=3Dy
> > CONFIG_DMARD09=3Dy
> > CONFIG_DMARD10=3Dy
> > CONFIG_IIO_CROS_EC_ACCEL_LEGACY=3Dy
> > CONFIG_KXSD9=3Dy
> > CONFIG_KXSD9_I2C=3Dy
> > # CONFIG_KXCJK1013 is not set
> > CONFIG_MC3230=3Dy
> > # CONFIG_MMA7455_I2C is not set
> > CONFIG_MMA7660=3Dy
> > # CONFIG_MMA8452 is not set
> > CONFIG_MMA9551_CORE=3Dy
> > # CONFIG_MMA9551 is not set
> > CONFIG_MMA9553=3Dy
> > CONFIG_MXC4005=3Dy
> > CONFIG_MXC6255=3Dy
> > CONFIG_STK8312=3Dy
> > CONFIG_STK8BA50=3Dy
> > =

> > #
> > # Analog to digital converters
> > #
> > CONFIG_AD7291=3Dy
> > # CONFIG_AD799X is not set
> > CONFIG_AXP20X_ADC=3Dy
> > CONFIG_AXP288_ADC=3Dy
> > # CONFIG_CC10001_ADC is not set
> > CONFIG_DA9150_GPADC=3Dy
> > # CONFIG_DLN2_ADC is not set
> > CONFIG_ENVELOPE_DETECTOR=3Dy
> > CONFIG_HX711=3Dy
> > CONFIG_LTC2471=3Dy
> > # CONFIG_LTC2485 is not set
> > CONFIG_LTC2497=3Dy
> > # CONFIG_MAX1363 is not set
> > # CONFIG_MAX9611 is not set
> > CONFIG_MCP3422=3Dy
> > CONFIG_MEN_Z188_ADC=3Dy
> > CONFIG_NAU7802=3Dy
> > CONFIG_PALMAS_GPADC=3Dy
> > CONFIG_QCOM_VADC_COMMON=3Dy
> > CONFIG_QCOM_SPMI_IADC=3Dy
> > CONFIG_QCOM_SPMI_VADC=3Dy
> > CONFIG_SD_ADC_MODULATOR=3Dy
> > # CONFIG_TI_ADC081C is not set
> > CONFIG_TI_ADS1015=3Dy
> > # CONFIG_TI_AM335X_ADC is not set
> > CONFIG_VF610_ADC=3Dy
> > CONFIG_VIPERBOARD_ADC=3Dy
> > =

> > #
> > # Analog Front Ends
> > #
> > # CONFIG_IIO_RESCALE is not set
> > =

> > #
> > # Amplifiers
> > #
> > =

> > #
> > # Chemical Sensors
> > #
> > # CONFIG_ATLAS_PH_SENSOR is not set
> > CONFIG_CCS811=3Dy
> > # CONFIG_IAQCORE is not set
> > CONFIG_VZ89X=3Dy
> > CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dy
> > CONFIG_IIO_CROS_EC_SENSORS=3Dy
> > =

> > #
> > # Hid Sensor IIO Common
> > #
> > CONFIG_IIO_MS_SENSORS_I2C=3Dy
> > =

> > #
> > # SSP Sensor Common
> > #
> > CONFIG_IIO_ST_SENSORS_I2C=3Dy
> > CONFIG_IIO_ST_SENSORS_CORE=3Dy
> > =

> > #
> > # Counters
> > #
> > =

> > #
> > # Digital to analog converters
> > #
> > # CONFIG_AD5064 is not set
> > CONFIG_AD5380=3Dy
> > CONFIG_AD5446=3Dy
> > # CONFIG_AD5593R is not set
> > # CONFIG_AD5696_I2C is not set
> > # CONFIG_DPOT_DAC is not set
> > CONFIG_DS4424=3Dy
> > CONFIG_M62332=3Dy
> > # CONFIG_MAX517 is not set
> > CONFIG_MAX5821=3Dy
> > CONFIG_MCP4725=3Dy
> > CONFIG_TI_DAC5571=3Dy
> > CONFIG_VF610_DAC=3Dy
> > =

> > #
> > # IIO dummy driver
> > #
> > CONFIG_IIO_SIMPLE_DUMMY=3Dy
> > # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> > CONFIG_IIO_SIMPLE_DUMMY_BUFFER=3Dy
> > =

> > #
> > # Frequency Synthesizers DDS/PLL
> > #
> > =

> > #
> > # Clock Generator/Distribution
> > #
> > =

> > #
> > # Phase-Locked Loop (PLL) frequency synthesizers
> > #
> > =

> > #
> > # Digital gyroscope sensors
> > #
> > # CONFIG_BMG160 is not set
> > CONFIG_MPU3050=3Dy
> > CONFIG_MPU3050_I2C=3Dy
> > CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> > CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> > CONFIG_ITG3200=3Dy
> > =

> > #
> > # Health Sensors
> > #
> > =

> > #
> > # Heart Rate Monitors
> > #
> > CONFIG_AFE4404=3Dy
> > # CONFIG_MAX30100 is not set
> > CONFIG_MAX30102=3Dy
> > =

> > #
> > # Humidity sensors
> > #
> > CONFIG_AM2315=3Dy
> > # CONFIG_DHT11 is not set
> > CONFIG_HDC100X=3Dy
> > CONFIG_HTS221=3Dy
> > CONFIG_HTS221_I2C=3Dy
> > # CONFIG_HTU21 is not set
> > CONFIG_SI7005=3Dy
> > CONFIG_SI7020=3Dy
> > =

> > #
> > # Inertial measurement units
> > #
> > # CONFIG_BMI160_I2C is not set
> > CONFIG_KMX61=3Dy
> > # CONFIG_INV_MPU6050_I2C is not set
> > CONFIG_IIO_ST_LSM6DSX=3Dy
> > CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
> > =

> > #
> > # Light sensors
> > #
> > # CONFIG_ACPI_ALS is not set
> > # CONFIG_ADJD_S311 is not set
> > # CONFIG_AL3320A is not set
> > CONFIG_APDS9300=3Dy
> > CONFIG_APDS9960=3Dy
> > CONFIG_BH1750=3Dy
> > # CONFIG_BH1780 is not set
> > CONFIG_CM32181=3Dy
> > # CONFIG_CM3232 is not set
> > CONFIG_CM3323=3Dy
> > # CONFIG_CM3605 is not set
> > CONFIG_CM36651=3Dy
> > # CONFIG_IIO_CROS_EC_LIGHT_PROX is not set
> > # CONFIG_GP2AP020A00F is not set
> > # CONFIG_SENSORS_ISL29018 is not set
> > CONFIG_SENSORS_ISL29028=3Dy
> > CONFIG_ISL29125=3Dy
> > CONFIG_JSA1212=3Dy
> > CONFIG_RPR0521=3Dy
> > CONFIG_LTR501=3Dy
> > CONFIG_LV0104CS=3Dy
> > # CONFIG_MAX44000 is not set
> > # CONFIG_OPT3001 is not set
> > CONFIG_PA12203001=3Dy
> > # CONFIG_SI1145 is not set
> > CONFIG_STK3310=3Dy
> > CONFIG_ST_UVIS25=3Dy
> > CONFIG_ST_UVIS25_I2C=3Dy
> > # CONFIG_TCS3414 is not set
> > # CONFIG_TCS3472 is not set
> > CONFIG_SENSORS_TSL2563=3Dy
> > CONFIG_TSL2583=3Dy
> > CONFIG_TSL2772=3Dy
> > CONFIG_TSL4531=3Dy
> > # CONFIG_US5182D is not set
> > CONFIG_VCNL4000=3Dy
> > # CONFIG_VEML6070 is not set
> > CONFIG_VL6180=3Dy
> > CONFIG_ZOPT2201=3Dy
> > =

> > #
> > # Magnetometer sensors
> > #
> > CONFIG_AK8974=3Dy
> > CONFIG_AK8975=3Dy
> > CONFIG_AK09911=3Dy
> > CONFIG_BMC150_MAGN=3Dy
> > CONFIG_BMC150_MAGN_I2C=3Dy
> > CONFIG_MAG3110=3Dy
> > CONFIG_MMC35240=3Dy
> > CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> > CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> > CONFIG_SENSORS_HMC5843=3Dy
> > CONFIG_SENSORS_HMC5843_I2C=3Dy
> > =

> > #
> > # Multiplexers
> > #
> > CONFIG_IIO_MUX=3Dy
> > =

> > #
> > # Inclinometer sensors
> > #
> > =

> > #
> > # Triggers - standalone
> > #
> > CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> > # CONFIG_IIO_SYSFS_TRIGGER is not set
> > =

> > #
> > # Digital potentiometers
> > #
> > # CONFIG_AD5272 is not set
> > # CONFIG_DS1803 is not set
> > # CONFIG_MCP4018 is not set
> > # CONFIG_MCP4531 is not set
> > CONFIG_TPL0102=3Dy
> > =

> > #
> > # Digital potentiostats
> > #
> > CONFIG_LMP91000=3Dy
> > =

> > #
> > # Pressure sensors
> > #
> > CONFIG_ABP060MG=3Dy
> > # CONFIG_BMP280 is not set
> > # CONFIG_IIO_CROS_EC_BARO is not set
> > # CONFIG_HP03 is not set
> > # CONFIG_MPL115_I2C is not set
> > # CONFIG_MPL3115 is not set
> > CONFIG_MS5611=3Dy
> > # CONFIG_MS5611_I2C is not set
> > CONFIG_MS5637=3Dy
> > CONFIG_IIO_ST_PRESS=3Dy
> > CONFIG_IIO_ST_PRESS_I2C=3Dy
> > # CONFIG_T5403 is not set
> > # CONFIG_HP206C is not set
> > # CONFIG_ZPA2326 is not set
> > =

> > #
> > # Lightning sensors
> > #
> > =

> > #
> > # Proximity and distance sensors
> > #
> > # CONFIG_LIDAR_LITE_V2 is not set
> > CONFIG_RFD77402=3Dy
> > CONFIG_SRF04=3Dy
> > CONFIG_SX9500=3Dy
> > # CONFIG_SRF08 is not set
> > =

> > #
> > # Resolver to digital converters
> > #
> > =

> > #
> > # Temperature sensors
> > #
> > # CONFIG_MLX90614 is not set
> > CONFIG_MLX90632=3Dy
> > # CONFIG_TMP006 is not set
> > CONFIG_TMP007=3Dy
> > CONFIG_TSYS01=3Dy
> > CONFIG_TSYS02D=3Dy
> > # CONFIG_NTB is not set
> > # CONFIG_VME_BUS is not set
> > # CONFIG_PWM is not set
> > =

> > #
> > # IRQ chip support
> > #
> > CONFIG_IRQCHIP=3Dy
> > CONFIG_ARM_GIC_MAX_NR=3D1
> > CONFIG_IPACK_BUS=3Dy
> > # CONFIG_BOARD_TPCI200 is not set
> > # CONFIG_SERIAL_IPOCTAL is not set
> > CONFIG_RESET_CONTROLLER=3Dy
> > CONFIG_RESET_TI_SYSCON=3Dy
> > CONFIG_FMC=3Dy
> > CONFIG_FMC_FAKEDEV=3Dy
> > CONFIG_FMC_TRIVIAL=3Dy
> > CONFIG_FMC_WRITE_EEPROM=3Dy
> > # CONFIG_FMC_CHARDEV is not set
> > =

> > #
> > # PHY Subsystem
> > #
> > CONFIG_GENERIC_PHY=3Dy
> > # CONFIG_BCM_KONA_USB2_PHY is not set
> > # CONFIG_PHY_PXA_28NM_HSIC is not set
> > CONFIG_PHY_PXA_28NM_USB2=3Dy
> > # CONFIG_PHY_CPCAP_USB is not set
> > CONFIG_PHY_MAPPHONE_MDM6600=3Dy
> > CONFIG_PHY_QCOM_USB_HS=3Dy
> > CONFIG_PHY_QCOM_USB_HSIC=3Dy
> > CONFIG_PHY_TUSB1210=3Dy
> > CONFIG_POWERCAP=3Dy
> > CONFIG_MCB=3Dy
> > # CONFIG_MCB_PCI is not set
> > CONFIG_MCB_LPC=3Dy
> > =

> > #
> > # Performance monitor support
> > #
> > CONFIG_RAS=3Dy
> > # CONFIG_THUNDERBOLT is not set
> > =

> > #
> > # Android
> > #
> > CONFIG_ANDROID=3Dy
> > # CONFIG_ANDROID_BINDER_IPC is not set
> > # CONFIG_LIBNVDIMM is not set
> > CONFIG_DAX=3Dy
> > # CONFIG_DEV_DAX is not set
> > CONFIG_NVMEM=3Dy
> > # CONFIG_RAVE_SP_EEPROM is not set
> > =

> > #
> > # HW tracing support
> > #
> > CONFIG_STM=3Dy
> > # CONFIG_STM_DUMMY is not set
> > CONFIG_STM_SOURCE_CONSOLE=3Dy
> > CONFIG_STM_SOURCE_HEARTBEAT=3Dy
> > # CONFIG_INTEL_TH is not set
> > # CONFIG_FPGA is not set
> > CONFIG_FSI=3Dy
> > CONFIG_FSI_MASTER_GPIO=3Dy
> > CONFIG_FSI_MASTER_HUB=3Dy
> > # CONFIG_FSI_SCOM is not set
> > CONFIG_MULTIPLEXER=3Dy
> > =

> > #
> > # Multiplexer drivers
> > #
> > CONFIG_MUX_ADG792A=3Dy
> > # CONFIG_MUX_GPIO is not set
> > CONFIG_MUX_MMIO=3Dy
> > # CONFIG_UNISYS_VISORBUS is not set
> > CONFIG_SIOX=3Dy
> > CONFIG_SIOX_BUS_GPIO=3Dy
> > # CONFIG_SLIMBUS is not set
> > =

> > #
> > # Firmware Drivers
> > #
> > # CONFIG_EDD is not set
> > CONFIG_FIRMWARE_MEMMAP=3Dy
> > CONFIG_DELL_RBU=3Dy
> > CONFIG_DCDBAS=3Dy
> > CONFIG_DMIID=3Dy
> > # CONFIG_DMI_SYSFS is not set
> > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> > # CONFIG_ISCSI_IBFT_FIND is not set
> > CONFIG_FW_CFG_SYSFS=3Dy
> > CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> > # CONFIG_GOOGLE_FIRMWARE is not set
> > =

> > #
> > # Tegra firmware driver
> > #
> > =

> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > CONFIG_FS_IOMAP=3Dy
> > CONFIG_EXT2_FS=3Dy
> > CONFIG_EXT2_FS_XATTR=3Dy
> > CONFIG_EXT2_FS_POSIX_ACL=3Dy
> > # CONFIG_EXT2_FS_SECURITY is not set
> > CONFIG_EXT3_FS=3Dy
> > # CONFIG_EXT3_FS_POSIX_ACL is not set
> > CONFIG_EXT3_FS_SECURITY=3Dy
> > CONFIG_EXT4_FS=3Dy
> > CONFIG_EXT4_FS_POSIX_ACL=3Dy
> > CONFIG_EXT4_FS_SECURITY=3Dy
> > CONFIG_EXT4_ENCRYPTION=3Dy
> > CONFIG_EXT4_FS_ENCRYPTION=3Dy
> > # CONFIG_EXT4_DEBUG is not set
> > CONFIG_JBD2=3Dy
> > # CONFIG_JBD2_DEBUG is not set
> > CONFIG_FS_MBCACHE=3Dy
> > # CONFIG_REISERFS_FS is not set
> > CONFIG_JFS_FS=3Dy
> > CONFIG_JFS_POSIX_ACL=3Dy
> > # CONFIG_JFS_SECURITY is not set
> > CONFIG_JFS_DEBUG=3Dy
> > CONFIG_JFS_STATISTICS=3Dy
> > # CONFIG_XFS_FS is not set
> > CONFIG_GFS2_FS=3Dy
> > # CONFIG_OCFS2_FS is not set
> > CONFIG_BTRFS_FS=3Dy
> > CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> > CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> > # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> > # CONFIG_BTRFS_DEBUG is not set
> > # CONFIG_BTRFS_ASSERT is not set
> > CONFIG_BTRFS_FS_REF_VERIFY=3Dy
> > # CONFIG_NILFS2_FS is not set
> > # CONFIG_F2FS_FS is not set
> > # CONFIG_FS_DAX is not set
> > CONFIG_FS_POSIX_ACL=3Dy
> > CONFIG_EXPORTFS=3Dy
> > CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> > CONFIG_FILE_LOCKING=3Dy
> > # CONFIG_MANDATORY_FILE_LOCKING is not set
> > CONFIG_FS_ENCRYPTION=3Dy
> > CONFIG_FSNOTIFY=3Dy
> > CONFIG_DNOTIFY=3Dy
> > CONFIG_INOTIFY_USER=3Dy
> > # CONFIG_FANOTIFY is not set
> > # CONFIG_QUOTA is not set
> > # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> > CONFIG_QUOTACTL=3Dy
> > CONFIG_AUTOFS4_FS=3Dy
> > CONFIG_AUTOFS_FS=3Dy
> > CONFIG_FUSE_FS=3Dy
> > CONFIG_CUSE=3Dy
> > CONFIG_OVERLAY_FS=3Dy
> > CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> > CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> > # CONFIG_OVERLAY_FS_INDEX is not set
> > CONFIG_OVERLAY_FS_XINO_AUTO=3Dy
> > =

> > #
> > # Caches
> > #
> > CONFIG_FSCACHE=3Dy
> > CONFIG_FSCACHE_STATS=3Dy
> > # CONFIG_FSCACHE_HISTOGRAM is not set
> > CONFIG_FSCACHE_DEBUG=3Dy
> > # CONFIG_FSCACHE_OBJECT_LIST is not set
> > # CONFIG_CACHEFILES is not set
> > =

> > #
> > # CD-ROM/DVD Filesystems
> > #
> > CONFIG_ISO9660_FS=3Dy
> > CONFIG_JOLIET=3Dy
> > CONFIG_ZISOFS=3Dy
> > # CONFIG_UDF_FS is not set
> > =

> > #
> > # DOS/FAT/NT Filesystems
> > #
> > CONFIG_FAT_FS=3Dy
> > CONFIG_MSDOS_FS=3Dy
> > CONFIG_VFAT_FS=3Dy
> > CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> > CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> > # CONFIG_FAT_DEFAULT_UTF8 is not set
> > # CONFIG_NTFS_FS is not set
> > =

> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=3Dy
> > # CONFIG_PROC_KCORE is not set
> > CONFIG_PROC_SYSCTL=3Dy
> > CONFIG_PROC_PAGE_MONITOR=3Dy
> > # CONFIG_PROC_CHILDREN is not set
> > CONFIG_KERNFS=3Dy
> > CONFIG_SYSFS=3Dy
> > CONFIG_TMPFS=3Dy
> > # CONFIG_TMPFS_POSIX_ACL is not set
> > # CONFIG_TMPFS_XATTR is not set
> > # CONFIG_HUGETLBFS is not set
> > CONFIG_MEMFD_CREATE=3Dy
> > CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> > CONFIG_CONFIGFS_FS=3Dy
> > # CONFIG_MISC_FILESYSTEMS is not set
> > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > CONFIG_NFS_FS=3Dy
> > CONFIG_NFS_V2=3Dy
> > CONFIG_NFS_V3=3Dy
> > # CONFIG_NFS_V3_ACL is not set
> > CONFIG_NFS_V4=3Dy
> > # CONFIG_NFS_SWAP is not set
> > # CONFIG_NFS_V4_1 is not set
> > # CONFIG_ROOT_NFS is not set
> > # CONFIG_NFS_FSCACHE is not set
> > # CONFIG_NFS_USE_LEGACY_DNS is not set
> > CONFIG_NFS_USE_KERNEL_DNS=3Dy
> > # CONFIG_NFSD is not set
> > CONFIG_GRACE_PERIOD=3Dy
> > CONFIG_LOCKD=3Dy
> > CONFIG_LOCKD_V4=3Dy
> > CONFIG_NFS_COMMON=3Dy
> > CONFIG_SUNRPC=3Dy
> > CONFIG_SUNRPC_GSS=3Dy
> > CONFIG_RPCSEC_GSS_KRB5=3Dy
> > # CONFIG_SUNRPC_DEBUG is not set
> > # CONFIG_CEPH_FS is not set
> > CONFIG_CIFS=3Dy
> > # CONFIG_CIFS_STATS is not set
> > # CONFIG_CIFS_WEAK_PW_HASH is not set
> > # CONFIG_CIFS_UPCALL is not set
> > # CONFIG_CIFS_XATTR is not set
> > CONFIG_CIFS_DEBUG=3Dy
> > # CONFIG_CIFS_DEBUG2 is not set
> > # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> > # CONFIG_CIFS_DFS_UPCALL is not set
> > # CONFIG_CIFS_SMB311 is not set
> > # CONFIG_CIFS_FSCACHE is not set
> > # CONFIG_CODA_FS is not set
> > # CONFIG_AFS_FS is not set
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=3Dy
> > CONFIG_NLS_CODEPAGE_737=3Dy
> > CONFIG_NLS_CODEPAGE_775=3Dy
> > CONFIG_NLS_CODEPAGE_850=3Dy
> > CONFIG_NLS_CODEPAGE_852=3Dy
> > CONFIG_NLS_CODEPAGE_855=3Dy
> > # CONFIG_NLS_CODEPAGE_857 is not set
> > CONFIG_NLS_CODEPAGE_860=3Dy
> > # CONFIG_NLS_CODEPAGE_861 is not set
> > # CONFIG_NLS_CODEPAGE_862 is not set
> > CONFIG_NLS_CODEPAGE_863=3Dy
> > CONFIG_NLS_CODEPAGE_864=3Dy
> > # CONFIG_NLS_CODEPAGE_865 is not set
> > CONFIG_NLS_CODEPAGE_866=3Dy
> > # CONFIG_NLS_CODEPAGE_869 is not set
> > # CONFIG_NLS_CODEPAGE_936 is not set
> > # CONFIG_NLS_CODEPAGE_950 is not set
> > CONFIG_NLS_CODEPAGE_932=3Dy
> > CONFIG_NLS_CODEPAGE_949=3Dy
> > CONFIG_NLS_CODEPAGE_874=3Dy
> > CONFIG_NLS_ISO8859_8=3Dy
> > CONFIG_NLS_CODEPAGE_1250=3Dy
> > CONFIG_NLS_CODEPAGE_1251=3Dy
> > CONFIG_NLS_ASCII=3Dy
> > CONFIG_NLS_ISO8859_1=3Dy
> > # CONFIG_NLS_ISO8859_2 is not set
> > CONFIG_NLS_ISO8859_3=3Dy
> > CONFIG_NLS_ISO8859_4=3Dy
> > CONFIG_NLS_ISO8859_5=3Dy
> > # CONFIG_NLS_ISO8859_6 is not set
> > CONFIG_NLS_ISO8859_7=3Dy
> > CONFIG_NLS_ISO8859_9=3Dy
> > CONFIG_NLS_ISO8859_13=3Dy
> > CONFIG_NLS_ISO8859_14=3Dy
> > CONFIG_NLS_ISO8859_15=3Dy
> > # CONFIG_NLS_KOI8_R is not set
> > CONFIG_NLS_KOI8_U=3Dy
> > # CONFIG_NLS_MAC_ROMAN is not set
> > # CONFIG_NLS_MAC_CELTIC is not set
> > CONFIG_NLS_MAC_CENTEURO=3Dy
> > CONFIG_NLS_MAC_CROATIAN=3Dy
> > CONFIG_NLS_MAC_CYRILLIC=3Dy
> > CONFIG_NLS_MAC_GAELIC=3Dy
> > CONFIG_NLS_MAC_GREEK=3Dy
> > CONFIG_NLS_MAC_ICELAND=3Dy
> > CONFIG_NLS_MAC_INUIT=3Dy
> > # CONFIG_NLS_MAC_ROMANIAN is not set
> > CONFIG_NLS_MAC_TURKISH=3Dy
> > # CONFIG_NLS_UTF8 is not set
> > # CONFIG_DLM is not set
> > =

> > #
> > # Kernel hacking
> > #
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > =

> > #
> > # printk and dmesg options
> > #
> > CONFIG_PRINTK_TIME=3Dy
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > # CONFIG_DYNAMIC_DEBUG is not set
> > =

> > #
> > # Compile-time checks and compiler options
> > #
> > CONFIG_DEBUG_INFO=3Dy
> > CONFIG_DEBUG_INFO_REDUCED=3Dy
> > # CONFIG_DEBUG_INFO_SPLIT is not set
> > # CONFIG_DEBUG_INFO_DWARF4 is not set
> > # CONFIG_GDB_SCRIPTS is not set
> > CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> > # CONFIG_ENABLE_MUST_CHECK is not set
> > CONFIG_FRAME_WARN=3D2048
> > CONFIG_STRIP_ASM_SYMS=3Dy
> > # CONFIG_READABLE_ASM is not set
> > # CONFIG_UNUSED_SYMBOLS is not set
> > # CONFIG_PAGE_OWNER is not set
> > CONFIG_DEBUG_FS=3Dy
> > CONFIG_HEADERS_CHECK=3Dy
> > CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> > # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> > CONFIG_FRAME_POINTER=3Dy
> > CONFIG_STACK_VALIDATION=3Dy
> > # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> > CONFIG_MAGIC_SYSRQ=3Dy
> > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> > # CONFIG_MAGIC_SYSRQ_SERIAL is not set
> > CONFIG_DEBUG_KERNEL=3Dy
> > =

> > #
> > # Memory Debugging
> > #
> > CONFIG_PAGE_EXTENSION=3Dy
> > CONFIG_DEBUG_PAGEALLOC=3Dy
> > CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
> > CONFIG_PAGE_POISONING=3Dy
> > CONFIG_PAGE_POISONING_NO_SANITY=3Dy
> > CONFIG_PAGE_POISONING_ZERO=3Dy
> > # CONFIG_DEBUG_RODATA_TEST is not set
> > # CONFIG_DEBUG_OBJECTS is not set
> > CONFIG_DEBUG_SLAB=3Dy
> > # CONFIG_DEBUG_SLAB_LEAK is not set
> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > CONFIG_DEBUG_STACK_USAGE=3Dy
> > # CONFIG_DEBUG_VM is not set
> > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > CONFIG_DEBUG_VIRTUAL=3Dy
> > CONFIG_DEBUG_MEMORY_INIT=3Dy
> > # CONFIG_DEBUG_PER_CPU_MAPS is not set
> > CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> > # CONFIG_DEBUG_STACKOVERFLOW is not set
> > CONFIG_HAVE_ARCH_KASAN=3Dy
> > CONFIG_ARCH_HAS_KCOV=3Dy
> > CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> > # CONFIG_KCOV is not set
> > # CONFIG_DEBUG_SHIRQ is not set
> > =

> > #
> > # Debug Lockups and Hangs
> > #
> > CONFIG_LOCKUP_DETECTOR=3Dy
> > CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> > CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> > CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> > CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> > CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
> > # CONFIG_DETECT_HUNG_TASK is not set
> > # CONFIG_WQ_WATCHDOG is not set
> > CONFIG_PANIC_ON_OOPS=3Dy
> > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > CONFIG_PANIC_TIMEOUT=3D0
> > CONFIG_SCHED_DEBUG=3Dy
> > CONFIG_SCHED_INFO=3Dy
> > CONFIG_SCHEDSTATS=3Dy
> > CONFIG_SCHED_STACK_END_CHECK=3Dy
> > # CONFIG_DEBUG_TIMEKEEPING is not set
> > CONFIG_DEBUG_PREEMPT=3Dy
> > =

> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> > CONFIG_PROVE_LOCKING=3Dy
> > CONFIG_LOCK_STAT=3Dy
> > CONFIG_DEBUG_RT_MUTEXES=3Dy
> > CONFIG_DEBUG_SPINLOCK=3Dy
> > CONFIG_DEBUG_MUTEXES=3Dy
> > CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> > CONFIG_DEBUG_RWSEMS=3Dy
> > CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > CONFIG_LOCKDEP=3Dy
> > # CONFIG_DEBUG_LOCKDEP is not set
> > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > # CONFIG_LOCK_TORTURE_TEST is not set
> > CONFIG_WW_MUTEX_SELFTEST=3Dy
> > CONFIG_TRACE_IRQFLAGS=3Dy
> > CONFIG_STACKTRACE=3Dy
> > CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> > # CONFIG_DEBUG_KOBJECT is not set
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > CONFIG_DEBUG_LIST=3Dy
> > # CONFIG_DEBUG_PI_LIST is not set
> > CONFIG_DEBUG_SG=3Dy
> > # CONFIG_DEBUG_NOTIFIERS is not set
> > # CONFIG_DEBUG_CREDENTIALS is not set
> > =

> > #
> > # RCU Debugging
> > #
> > CONFIG_PROVE_RCU=3Dy
> > CONFIG_TORTURE_TEST=3Dy
> > # CONFIG_RCU_PERF_TEST is not set
> > CONFIG_RCU_TORTURE_TEST=3Dy
> > CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> > CONFIG_RCU_TRACE=3Dy
> > CONFIG_RCU_EQS_DEBUG=3Dy
> > CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> > # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> > # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > CONFIG_FAULT_INJECTION=3Dy
> > # CONFIG_FAILSLAB is not set
> > CONFIG_FAIL_PAGE_ALLOC=3Dy
> > # CONFIG_FAIL_MAKE_REQUEST is not set
> > CONFIG_FAIL_IO_TIMEOUT=3Dy
> > # CONFIG_FAIL_FUTEX is not set
> > # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
> > CONFIG_LATENCYTOP=3Dy
> > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > CONFIG_HAVE_FENTRY=3Dy
> > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > CONFIG_TRACE_CLOCK=3Dy
> > CONFIG_TRACING_SUPPORT=3Dy
> > # CONFIG_FTRACE is not set
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > # CONFIG_DMA_API_DEBUG is not set
> > # CONFIG_RUNTIME_TESTING_MENU is not set
> > # CONFIG_MEMTEST is not set
> > CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > CONFIG_UBSAN=3Dy
> > # CONFIG_UBSAN_SANITIZE_ALL is not set
> > # CONFIG_UBSAN_ALIGNMENT is not set
> > CONFIG_UBSAN_NULL=3Dy
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> > CONFIG_STRICT_DEVMEM=3Dy
> > # CONFIG_IO_STRICT_DEVMEM is not set
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > CONFIG_EARLY_PRINTK=3Dy
> > # CONFIG_EARLY_PRINTK_DBGP is not set
> > # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> > CONFIG_X86_PTDUMP_CORE=3Dy
> > CONFIG_X86_PTDUMP=3Dy
> > CONFIG_DEBUG_WX=3Dy
> > CONFIG_DOUBLEFAULT=3Dy
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > CONFIG_IO_DELAY_TYPE_0X80=3D0
> > CONFIG_IO_DELAY_TYPE_0XED=3D1
> > CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> > CONFIG_IO_DELAY_TYPE_NONE=3D3
> > CONFIG_IO_DELAY_0X80=3Dy
> > # CONFIG_IO_DELAY_0XED is not set
> > # CONFIG_IO_DELAY_UDELAY is not set
> > # CONFIG_IO_DELAY_NONE is not set
> > CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
> > CONFIG_DEBUG_BOOT_PARAMS=3Dy
> > # CONFIG_CPA_DEBUG is not set
> > # CONFIG_OPTIMIZE_INLINING is not set
> > # CONFIG_DEBUG_ENTRY is not set
> > # CONFIG_DEBUG_NMI_SELFTEST is not set
> > CONFIG_X86_DEBUG_FPU=3Dy
> > # CONFIG_PUNIT_ATOM_DEBUG is not set
> > # CONFIG_UNWINDER_ORC is not set
> > CONFIG_UNWINDER_FRAME_POINTER=3Dy
> > =

> > #
> > # Security options
> > #
> > CONFIG_KEYS=3Dy
> > # CONFIG_PERSISTENT_KEYRINGS is not set
> > # CONFIG_BIG_KEYS is not set
> > CONFIG_TRUSTED_KEYS=3Dy
> > CONFIG_ENCRYPTED_KEYS=3Dy
> > # CONFIG_KEY_DH_OPERATIONS is not set
> > CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> > # CONFIG_SECURITY is not set
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_PAGE_TABLE_ISOLATION=3Dy
> > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> > # CONFIG_HARDENED_USERCOPY is not set
> > CONFIG_FORTIFY_SOURCE=3Dy
> > CONFIG_STATIC_USERMODEHELPER=3Dy
> > CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> > CONFIG_DEFAULT_SECURITY_DAC=3Dy
> > CONFIG_DEFAULT_SECURITY=3D""
> > CONFIG_XOR_BLOCKS=3Dy
> > CONFIG_ASYNC_CORE=3Dy
> > CONFIG_ASYNC_XOR=3Dy
> > CONFIG_CRYPTO=3Dy
> > =

> > #
> > # Crypto core or helper
> > #
> > CONFIG_CRYPTO_ALGAPI=3Dy
> > CONFIG_CRYPTO_ALGAPI2=3Dy
> > CONFIG_CRYPTO_AEAD=3Dy
> > CONFIG_CRYPTO_AEAD2=3Dy
> > CONFIG_CRYPTO_BLKCIPHER=3Dy
> > CONFIG_CRYPTO_BLKCIPHER2=3Dy
> > CONFIG_CRYPTO_HASH=3Dy
> > CONFIG_CRYPTO_HASH2=3Dy
> > CONFIG_CRYPTO_RNG=3Dy
> > CONFIG_CRYPTO_RNG2=3Dy
> > CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > CONFIG_CRYPTO_AKCIPHER=3Dy
> > CONFIG_CRYPTO_KPP2=3Dy
> > CONFIG_CRYPTO_KPP=3Dy
> > CONFIG_CRYPTO_ACOMP2=3Dy
> > CONFIG_CRYPTO_RSA=3Dy
> > CONFIG_CRYPTO_DH=3Dy
> > CONFIG_CRYPTO_ECDH=3Dy
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > # CONFIG_CRYPTO_USER is not set
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > CONFIG_CRYPTO_GF128MUL=3Dy
> > CONFIG_CRYPTO_NULL=3Dy
> > CONFIG_CRYPTO_NULL2=3Dy
> > CONFIG_CRYPTO_PCRYPT=3Dy
> > CONFIG_CRYPTO_WORKQUEUE=3Dy
> > CONFIG_CRYPTO_CRYPTD=3Dy
> > CONFIG_CRYPTO_MCRYPTD=3Dy
> > CONFIG_CRYPTO_AUTHENC=3Dy
> > CONFIG_CRYPTO_SIMD=3Dy
> > CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> > CONFIG_CRYPTO_ENGINE=3Dy
> > =

> > #
> > # Authenticated Encryption with Associated Data
> > #
> > CONFIG_CRYPTO_CCM=3Dy
> > CONFIG_CRYPTO_GCM=3Dy
> > CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> > # CONFIG_CRYPTO_AEGIS128 is not set
> > CONFIG_CRYPTO_AEGIS128L=3Dy
> > CONFIG_CRYPTO_AEGIS256=3Dy
> > CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=3Dy
> > CONFIG_CRYPTO_AEGIS128L_AESNI_SSE2=3Dy
> > CONFIG_CRYPTO_AEGIS256_AESNI_SSE2=3Dy
> > # CONFIG_CRYPTO_MORUS640 is not set
> > CONFIG_CRYPTO_MORUS640_GLUE=3Dy
> > CONFIG_CRYPTO_MORUS640_SSE2=3Dy
> > # CONFIG_CRYPTO_MORUS1280 is not set
> > CONFIG_CRYPTO_MORUS1280_GLUE=3Dy
> > # CONFIG_CRYPTO_MORUS1280_SSE2 is not set
> > CONFIG_CRYPTO_MORUS1280_AVX2=3Dy
> > CONFIG_CRYPTO_SEQIV=3Dy
> > CONFIG_CRYPTO_ECHAINIV=3Dy
> > =

> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=3Dy
> > # CONFIG_CRYPTO_CFB is not set
> > CONFIG_CRYPTO_CTR=3Dy
> > CONFIG_CRYPTO_CTS=3Dy
> > CONFIG_CRYPTO_ECB=3Dy
> > CONFIG_CRYPTO_LRW=3Dy
> > CONFIG_CRYPTO_PCBC=3Dy
> > CONFIG_CRYPTO_XTS=3Dy
> > CONFIG_CRYPTO_KEYWRAP=3Dy
> > =

> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=3Dy
> > CONFIG_CRYPTO_HMAC=3Dy
> > CONFIG_CRYPTO_XCBC=3Dy
> > CONFIG_CRYPTO_VMAC=3Dy
> > =

> > #
> > # Digest
> > #
> > CONFIG_CRYPTO_CRC32C=3Dy
> > CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> > CONFIG_CRYPTO_CRC32=3Dy
> > CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> > CONFIG_CRYPTO_CRCT10DIF=3Dy
> > CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dy
> > CONFIG_CRYPTO_GHASH=3Dy
> > CONFIG_CRYPTO_POLY1305=3Dy
> > CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> > CONFIG_CRYPTO_MD4=3Dy
> > CONFIG_CRYPTO_MD5=3Dy
> > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > CONFIG_CRYPTO_RMD128=3Dy
> > CONFIG_CRYPTO_RMD160=3Dy
> > CONFIG_CRYPTO_RMD256=3Dy
> > CONFIG_CRYPTO_RMD320=3Dy
> > CONFIG_CRYPTO_SHA1=3Dy
> > # CONFIG_CRYPTO_SHA1_SSSE3 is not set
> > CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> > # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> > CONFIG_CRYPTO_SHA1_MB=3Dy
> > CONFIG_CRYPTO_SHA256_MB=3Dy
> > CONFIG_CRYPTO_SHA512_MB=3Dy
> > CONFIG_CRYPTO_SHA256=3Dy
> > CONFIG_CRYPTO_SHA512=3Dy
> > # CONFIG_CRYPTO_SHA3 is not set
> > # CONFIG_CRYPTO_SM3 is not set
> > # CONFIG_CRYPTO_TGR192 is not set
> > CONFIG_CRYPTO_WP512=3Dy
> > CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> > =

> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=3Dy
> > CONFIG_CRYPTO_AES_TI=3Dy
> > CONFIG_CRYPTO_AES_X86_64=3Dy
> > CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> > CONFIG_CRYPTO_ANUBIS=3Dy
> > CONFIG_CRYPTO_ARC4=3Dy
> > CONFIG_CRYPTO_BLOWFISH=3Dy
> > CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> > # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> > # CONFIG_CRYPTO_CAMELLIA is not set
> > CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> > CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> > CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
> > CONFIG_CRYPTO_CAST_COMMON=3Dy
> > CONFIG_CRYPTO_CAST5=3Dy
> > CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> > CONFIG_CRYPTO_CAST6=3Dy
> > # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> > CONFIG_CRYPTO_DES=3Dy
> > CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> > CONFIG_CRYPTO_FCRYPT=3Dy
> > CONFIG_CRYPTO_KHAZAD=3Dy
> > CONFIG_CRYPTO_SALSA20=3Dy
> > CONFIG_CRYPTO_CHACHA20=3Dy
> > # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> > # CONFIG_CRYPTO_SEED is not set
> > CONFIG_CRYPTO_SERPENT=3Dy
> > CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> > CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> > CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
> > CONFIG_CRYPTO_SM4=3Dy
> > CONFIG_CRYPTO_SPECK=3Dy
> > CONFIG_CRYPTO_TEA=3Dy
> > CONFIG_CRYPTO_TWOFISH=3Dy
> > CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> > CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> > CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> > CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> > =

> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=3Dy
> > # CONFIG_CRYPTO_LZO is not set
> > CONFIG_CRYPTO_842=3Dy
> > # CONFIG_CRYPTO_LZ4 is not set
> > # CONFIG_CRYPTO_LZ4HC is not set
> > CONFIG_CRYPTO_ZSTD=3Dy
> > =

> > #
> > # Random Number Generation
> > #
> > CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > CONFIG_CRYPTO_DRBG_HASH=3Dy
> > CONFIG_CRYPTO_DRBG_CTR=3Dy
> > CONFIG_CRYPTO_DRBG=3Dy
> > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > # CONFIG_CRYPTO_USER_API_HASH is not set
> > # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> > # CONFIG_CRYPTO_USER_API_RNG is not set
> > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > CONFIG_CRYPTO_HASH_INFO=3Dy
> > CONFIG_CRYPTO_HW=3Dy
> > CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> > CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
> > # CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
> > # CONFIG_CRYPTO_DEV_CCP is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> > CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> > # CONFIG_CRYPTO_DEV_CCREE is not set
> > # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> > =

> > #
> > # Certificates for signature checking
> > #
> > # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> > CONFIG_HAVE_KVM=3Dy
> > CONFIG_VIRTUALIZATION=3Dy
> > # CONFIG_KVM is not set
> > # CONFIG_VHOST_NET is not set
> > # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> > =

> > #
> > # Library routines
> > #
> > CONFIG_RAID6_PQ=3Dy
> > CONFIG_BITREVERSE=3Dy
> > CONFIG_RATIONAL=3Dy
> > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > CONFIG_GENERIC_NET_UTILS=3Dy
> > CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > CONFIG_GENERIC_IOMAP=3Dy
> > CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > CONFIG_CRC_CCITT=3Dy
> > CONFIG_CRC16=3Dy
> > CONFIG_CRC_T10DIF=3Dy
> > CONFIG_CRC_ITU_T=3Dy
> > CONFIG_CRC32=3Dy
> > CONFIG_CRC32_SELFTEST=3Dy
> > # CONFIG_CRC32_SLICEBY8 is not set
> > CONFIG_CRC32_SLICEBY4=3Dy
> > # CONFIG_CRC32_SARWATE is not set
> > # CONFIG_CRC32_BIT is not set
> > CONFIG_CRC4=3Dy
> > CONFIG_CRC7=3Dy
> > CONFIG_LIBCRC32C=3Dy
> > CONFIG_CRC8=3Dy
> > CONFIG_XXHASH=3Dy
> > # CONFIG_RANDOM32_SELFTEST is not set
> > CONFIG_842_COMPRESS=3Dy
> > CONFIG_842_DECOMPRESS=3Dy
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dy
> > CONFIG_LZO_COMPRESS=3Dy
> > CONFIG_LZO_DECOMPRESS=3Dy
> > CONFIG_ZSTD_COMPRESS=3Dy
> > CONFIG_ZSTD_DECOMPRESS=3Dy
> > # CONFIG_XZ_DEC is not set
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_DECOMPRESS_LZMA=3Dy
> > CONFIG_DECOMPRESS_LZO=3Dy
> > CONFIG_GENERIC_ALLOCATOR=3Dy
> > CONFIG_RADIX_TREE_MULTIORDER=3Dy
> > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT_MAP=3Dy
> > CONFIG_HAS_DMA=3Dy
> > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > CONFIG_NEED_DMA_MAP_STATE=3Dy
> > CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> > CONFIG_DMA_DIRECT_OPS=3Dy
> > CONFIG_SWIOTLB=3Dy
> > CONFIG_SGL_ALLOC=3Dy
> > CONFIG_CPU_RMAP=3Dy
> > CONFIG_DQL=3Dy
> > CONFIG_NLATTR=3Dy
> > CONFIG_CLZ_TAB=3Dy
> > # CONFIG_CORDIC is not set
> > # CONFIG_DDR is not set
> > CONFIG_IRQ_POLL=3Dy
> > CONFIG_MPILIB=3Dy
> > CONFIG_LIBFDT=3Dy
> > CONFIG_OID_REGISTRY=3Dy
> > CONFIG_FONT_SUPPORT=3Dy
> > # CONFIG_FONTS is not set
> > CONFIG_FONT_8x8=3Dy
> > CONFIG_FONT_8x16=3Dy
> > CONFIG_SG_POOL=3Dy
> > CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> > CONFIG_ARCH_HAS_PMEM_API=3Dy
> > CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> > CONFIG_ARCH_HAS_UACCESS_MCSAFE=3Dy
> > CONFIG_SBITMAP=3Dy
> > CONFIG_PRIME_NUMBERS=3Dy
> > CONFIG_STRING_SELFTEST=3Dy
> =

> > #!/bin/sh
> > =

> > export_top_env()
> > {
> > 	export suite=3D'boot'
> > 	export testcase=3D'boot'
> > 	export timeout=3D'10m'
> > 	export job_origin=3D'/lkp/lkp/src/jobs/boot.yaml'
> > 	export queue=3D'bisect'
> > 	export testbox=3D'vm-ivb41-quantal-x86_64-23'
> > 	export tbox_group=3D'vm-ivb41-quantal-x86_64'
> > 	export branch=3D'linux-devel/devel-spot-201807211235'
> > 	export commit=3D'3398b55446fb602245007d5955b6778fb6ff326a'
> > 	export kconfig=3D'x86_64-randconfig-a0-07211320'
> > 	export submit_id=3D'5b5597210b9a930c13b32658'
> > 	export job_file=3D'/lkp/scheduled/vm-ivb41-quantal-x86_64-23/boot-1-qu=
antal-core-x86_64.cgz-3398b55446fb602245007d5955b6778fb6ff326a-20180723-309=
1-qqfgj0-0.yaml'
> > 	export id=3D'698f7bcdb51f450627f00f39d141162ca35eadc2'
> > 	export model=3D'qemu-system-x86_64 -enable-kvm'
> > 	export nr_vm=3D32
> > 	export nr_cpu=3D2
> > 	export memory=3D'512M'
> > 	export rootfs=3D'quantal-core-x86_64.cgz'
> > 	export need_kconfig=3D'CONFIG_KVM_GUEST=3Dy'
> > 	export compiler=3D'gcc-7'
> > 	export enqueue_time=3D'2018-07-23 16:51:45 +0800'
> > 	export _id=3D'5b5597210b9a930c13b32658'
> > 	export _rt=3D'/result/boot/1/vm-ivb41-quantal-x86_64/quantal-core-x86_=
64.cgz/x86_64-randconfig-a0-07211320/gcc-7/3398b55446fb602245007d5955b6778f=
b6ff326a'
> > 	export user=3D'lkp'
> > 	export result_root=3D'/result/boot/1/vm-ivb41-quantal-x86_64/quantal-c=
ore-x86_64.cgz/x86_64-randconfig-a0-07211320/gcc-7/3398b55446fb602245007d59=
55b6778fb6ff326a/0'
> > 	export LKP_SERVER=3D'inn'
> > 	export max_uptime=3D600
> > 	export initrd=3D'/osimage/quantal/quantal-core-x86_64.cgz'
> > 	export bootloader_append=3D'root=3D/dev/ram0
> > user=3Dlkp
> > job=3D/lkp/scheduled/vm-ivb41-quantal-x86_64-23/boot-1-quantal-core-x86=
_64.cgz-3398b55446fb602245007d5955b6778fb6ff326a-20180723-3091-qqfgj0-0.yaml
> > ARCH=3Dx86_64
> > kconfig=3Dx86_64-randconfig-a0-07211320
> > branch=3Dlinux-devel/devel-spot-201807211235
> > commit=3D3398b55446fb602245007d5955b6778fb6ff326a
> > BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a0-07211320/gcc-7/3398b55446f=
b602245007d5955b6778fb6ff326a/vmlinuz-4.18.0-rc5-00173-g3398b55
> > max_uptime=3D600
> > RESULT_ROOT=3D/result/boot/1/vm-ivb41-quantal-x86_64/quantal-core-x86_6=
4.cgz/x86_64-randconfig-a0-07211320/gcc-7/3398b55446fb602245007d5955b6778fb=
6ff326a/0
> > LKP_SERVER=3Dinn
> > debug
> > apic=3Ddebug
> > sysrq_always_enabled
> > rcupdate.rcu_cpu_stall_timeout=3D100
> > net.ifnames=3D0
> > printk.devkmsg=3Don
> > panic=3D-1
> > softlockup_panic=3D1
> > nmi_watchdog=3Dpanic
> > oops=3Dpanic
> > load_ramdisk=3D2
> > prompt_ramdisk=3D0
> > drbd.minor_count=3D8
> > systemd.log_level=3Derr
> > ignore_loglevel
> > console=3Dtty0
> > earlyprintk=3DttyS0,115200
> > console=3DttyS0,115200
> > vga=3Dnormal
> > rw'
> > 	export lkp_initrd=3D'/lkp/lkp/lkp-x86_64.cgz'
> > 	export site=3D'inn'
> > 	export LKP_CGI_PORT=3D80
> > 	export LKP_CIFS_PORT=3D139
> > 	export kernel=3D'/pkg/linux/x86_64-randconfig-a0-07211320/gcc-7/3398b5=
5446fb602245007d5955b6778fb6ff326a/vmlinuz-4.18.0-rc5-00173-g3398b55'
> > 	export dequeue_time=3D'2018-07-23 17:19:15 +0800'
> > 	export job_initrd=3D'/lkp/scheduled/vm-ivb41-quantal-x86_64-23/boot-1-=
quantal-core-x86_64.cgz-3398b55446fb602245007d5955b6778fb6ff326a-20180723-3=
091-qqfgj0-0.cgz'
> > =

> > 	[ -n "$LKP_SRC" ] ||
> > 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> > }
> > =

> > run_job()
> > {
> > 	echo $$ > $TMP/run-job.pid
> > =

> > 	. $LKP_SRC/lib/http.sh
> > 	. $LKP_SRC/lib/job.sh
> > 	. $LKP_SRC/lib/env.sh
> > =

> > 	export_top_env
> > =

> > 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
> > 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
> > 	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
> > 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> > 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> > 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> > 	run_monitor $LKP_SRC/monitors/plain/watchdog
> > =

> > 	run_test $LKP_SRC/tests/wrapper sleep 1
> > }
> > =

> > extract_stats()
> > {
> > 	$LKP_SRC/stats/wrapper boot-slabinfo
> > 	$LKP_SRC/stats/wrapper boot-meminfo
> > 	$LKP_SRC/stats/wrapper memmap
> > 	$LKP_SRC/stats/wrapper boot-memory
> > 	$LKP_SRC/stats/wrapper boot-time
> > 	$LKP_SRC/stats/wrapper kernel-size
> > 	$LKP_SRC/stats/wrapper kmsg
> > =

> > 	$LKP_SRC/stats/wrapper time sleep.time
> > 	$LKP_SRC/stats/wrapper time
> > 	$LKP_SRC/stats/wrapper dmesg
> > 	$LKP_SRC/stats/wrapper kmsg
> > 	$LKP_SRC/stats/wrapper stderr
> > 	$LKP_SRC/stats/wrapper last_state
> > }
> > =

> > "$@"
> =

> =



--===============5310434856638715112==--

