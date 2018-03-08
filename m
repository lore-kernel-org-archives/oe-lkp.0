Content-Type: multipart/mixed; boundary="===============1681897734587294346=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] 3f6b5ffc70 [ 0.001000] WARNING: bad unlock balance detected!
Date: Wed, 07 Mar 2018 20:15:06 -0800
Message-ID: <20180308041506.GK3918@linux.vnet.ibm.com>
In-Reply-To: <20180308011854.zcwgow7ef75wpgxz@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1681897734587294346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 08, 2018 at 09:18:54AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev=
.2018.03.01a
> =

> commit 3f6b5ffc706a54598b82456ae0be395aa6465982
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Tue Mar 6 17:04:55 2018 -0800
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Tue Mar 6 17:04:55 2018 -0800
> =

>     EXP softirq: Is it possible to RCUify BH disable/enable?
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

I dropped this patch, FYI!

							Thanx, Paul

> 08c5ee9132  softirq: Eliminate unused cond_resched_softirq() macro
> 3f6b5ffc70  EXP softirq: Is it possible to RCUify BH disable/enable?
> +------------------------------------------------------------------------=
--------------------------+------------+------------+
> |                                                                        =
                          | 08c5ee9132 | 3f6b5ffc70 |
> +------------------------------------------------------------------------=
--------------------------+------------+------------+
> | boot_successes                                                         =
                          | 32         | 0          |
> | boot_failures                                                          =
                          | 1          | 15         |
> | Mem-Info                                                               =
                          | 1          |            |
> | WARNING:bad_unlock_balance_detected                                    =
                          | 0          | 15         |
> | is_trying_to_release_lock(rcu_read_lock)at                             =
                          | 0          | 15         |
> | RIP:native_restore_fl                                                  =
                          | 0          | 15         |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mut=
ex.c                      | 0          | 15         |
> | BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c   =
                          | 0          | 8          |
> | BUG:sleeping_function_called_from_invalid_context_at_include/linux/perc=
pu-rwsem.h                | 0          | 4          |
> | BUG:sleeping_function_called_from_invalid_context_at_drivers/net/ethern=
et/intel/e1000_hw.c       | 0          | 11         |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/workqueue.c=
                          | 0          | 2          |
> | BUG:sleeping_function_called_from_invalid_context_at_fs/dcache.c       =
                          | 0          | 5          |
> | BUG:sleeping_function_called_from_invalid_context_at_mm/rmap.c         =
                          | 0          | 1          |
> | BUG:sleeping_function_called_from_invalid_context_at_mm/filemap.c      =
                          | 0          | 1          |
> | BUG:sleeping_function_called_from_invalid_context_at_mm/vmstat.c       =
                          | 0          | 3          |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/rws=
em.c                      | 0          | 2          |
> | BUG:sleeping_function_called_from_invalid_context_at_lib/usercopy.c    =
                          | 0          | 3          |
> | BUG:sleeping_function_called_from_invalid_context_at_arch/x86/mm/fault.=
c                         | 0          | 1          |
> | WARNING:suspicious_RCU_usage                                           =
                          | 0          | 2          |
> | kernel/rcu/tree_plugin.h:#rcu_read_unlock()from_irq_or_softirq_with_blo=
cking_in_critical_section | 0          | 2          |
> | RIP:_raw_spin_unlock_irq                                               =
                          | 0          | 2          |
> | BUG:sleeping_function_called_from_invalid_context_at_drivers/tty/tty_ld=
sem.c                     | 0          | 1          |
> | BUG:sleeping_function_called_from_invalid_context_at_lib/iov_iter.c    =
                          | 0          | 2          |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/rcu/tree.c =
                          | 0          | 1          |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/torture.c  =
                          | 0          | 2          |
> +------------------------------------------------------------------------=
--------------------------+------------+------------+
> =

> [    0.001000] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    0.001000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.001000] hpet clockevent registered
> [    0.001000] =

> [    0.001000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.001000] WARNING: bad unlock balance detected!
> [    0.001000] 4.16.0-rc1-00055-g3f6b5ff #2 Not tainted
> [    0.001000] -------------------------------------
> [    0.001000] swapper/0/0 is trying to release lock (rcu_read_lock) at:
> [    0.001000] [<ffffffff810807c0>] __local_bh_enable+0x0/0x30
> [    0.001000] but there are no more locks to release!
> [    0.001000] =

> [    0.001000] other info that might help us debug this:
> [    0.001000] 1 lock held by swapper/0/0:
> [    0.001000]  #0:  (&desc->request_mutex){....}, at: [<        (ptrval)=
>] __setup_irq+0xed/0x930
> [    0.001000] =

> [    0.001000] stack backtrace:
> [    0.001000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.16.0-rc1-00055=
-g3f6b5ff #2
> [    0.001000] Call Trace:
> [    0.001000]  <IRQ>
> [    0.001000]  dump_stack+0x85/0xb4
> [    0.001000]  ? __local_bh_disable_ip+0x10/0x10
> [    0.001000]  print_unlock_imbalance_bug+0xec/0x100
> [    0.001000]  lock_release+0x1a1/0x340
> [    0.001000]  ? check_preemption_disabled+0x35/0x120
> [    0.001000]  __local_bh_enable+0x24/0x30
> [    0.001000]  _local_bh_enable+0x1c/0x30
> [    0.001000]  irq_enter+0x57/0x60
> [    0.001000]  do_IRQ+0x2a/0xe0
> [    0.001000]  common_interrupt+0xb9/0xb9
> [    0.001000]  </IRQ>
> [    0.001000] RIP: 0010:native_restore_fl+0x6/0x10
> [    0.001000] RSP: 0000:ffffffff82203df0 EFLAGS: 00000293 ORIG_RAX: ffff=
ffffffffffcf
> [    0.001000] RAX: 0000000000000000 RBX: 0000000000000293 RCX: 000000003=
43b035d
> [    0.001000] RDX: 00000000cbbd884c RSI: ffffffff82218638 RDI: 000000000=
0000293
> [    0.001000] RBP: ffffffff82203df0 R08: ffffffff82218600 R09: 000000000=
0000000
> [    0.001000] R10: 00000000fff0bcc3 R11: 10a4f0a400000000 R12: ffff88000=
00818d0
> [    0.001000] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000800
> [    0.001000]  _raw_spin_unlock_irqrestore+0x31/0x60
> [    0.001000]  __setup_irq+0x5e9/0x930
> [    0.001000]  setup_irq+0x5e/0xb0
> [    0.001000]  ? update_intr_gate+0x1f/0x1f
> [    0.001000]  hpet_time_init+0x20/0x34
> [    0.001000]  x86_late_time_init+0xa/0x17
> [    0.001000]  start_kernel+0x503/0x58f
> [    0.001000]  x86_64_start_reservations+0x2a/0x2c
> [    0.001000]  x86_64_start_kernel+0x6e/0x71
> [    0.001000]  secondary_startup_64+0xa5/0xb0
> [    0.002009] APIC: Switch to symmetric I/O mode setup
> [    0.002641] x2apic enabled
> [    0.003005] Switched APIC routing to physical x2apic.
> [    0.003525] enabled ExtINT on CPU#0
> [    0.004580] ENABLING IO-APIC IRQs
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start a31ceb1cbcc0c0cc2afb9818227186afacd91afc 661e50bc853209e=
41a5c14a290ca4decc43cbfd1 --
> git bisect good 75706b05850dfa1c105e90a71ee8a5ee50e2d935  # 19:54  G     =
11     0    2   2  Merge 'linux-review/Douglas-Gilbert/Make-SCSI-Status-CON=
DITION-MET-equivalent-to-GOOD/20180307-124808' into devel-catchup-201803071=
327
> git bisect  bad e34002b8f7cb8450c0d26e816c71fb5e6c93d556  # 20:12  B     =
 0     4   22   4  Merge 'linux-review/Tomas-Winkler/scsi-ufs-ufshcd_dump_r=
egs-to-use-memcpy_fromio/20180307-071519' into devel-catchup-201803071327
> git bisect good b8837f3af6817ab9bc22238b6c43e6d96088c214  # 20:25  G     =
11     0    3   3  Merge 'linux-review/Peter-Chen/usb-host-xhci-do-not-retu=
rn-error-status-for-URB/20180307-111640' into devel-catchup-201803071327
> git bisect  bad 6515c86567c519c20457f5e7bf5a65b7ad349074  # 20:38  B     =
 0    11   27   2  Merge 'rcu/dev.2018.03.01a' into devel-catchup-201803071=
327
> git bisect good ad7c946b35ad455417fdd4bc0e17deda4011841b  # 20:51  G     =
11     0    0   0  rcu: Create RCU-specific workqueues with rescuers
> git bisect good 338c46403f169dd76bff8ed58fd0be0d600e7aba  # 21:02  G     =
11     0    0   0  Merge branches 'fixes.2018.02.23a', 'srcu.2018.02.20a' a=
nd 'torture.2018.02.20a' into HEAD
> git bisect good f3816c6768369108663243992d5651b9ceed58bb  # 21:16  G     =
11     0    1   1  rcu: Parallelize expedited grace-period initialization
> git bisect good 7e3ada5c77658f35997b8ef3bcc99e4192f30be9  # 21:28  G     =
10     0    3   3  rcu: Remove deprecated RCU debugfs tracing code
> git bisect good 4551cfd69a85393f478462fe5e16e42f0fa6391e  # 21:42  G     =
11     0    2   2  rcu: Rename cond_resched_rcu_qs() to cond_resched_tasks_=
rcu_qs()
> git bisect  bad 3f6b5ffc706a54598b82456ae0be395aa6465982  # 21:52  B     =
 0     8   23   1  EXP softirq: Is it possible to RCUify BH disable/enable?
> git bisect good 08c5ee9132655d957daef41dc264b694dff817e3  # 22:03  G     =
11     0    2   2  softirq: Eliminate unused cond_resched_softirq() macro
> # first bad commit: [3f6b5ffc706a54598b82456ae0be395aa6465982] EXP softir=
q: Is it possible to RCUify BH disable/enable?
> git bisect good 08c5ee9132655d957daef41dc264b694dff817e3  # 22:08  G     =
32     0    4   6  softirq: Eliminate unused cond_resched_softirq() macro
> # extra tests with debug options
> git bisect  bad 3f6b5ffc706a54598b82456ae0be395aa6465982  # 22:17  B     =
 0    11   25   0  EXP softirq: Is it possible to RCUify BH disable/enable?
> # extra tests on HEAD of linux-devel/devel-catchup-201803071327
> git bisect  bad a31ceb1cbcc0c0cc2afb9818227186afacd91afc  # 22:18  B     =
 0   343  360   0  0day head guard for 'devel-catchup-201803071327'
> # extra tests on tree/branch rcu/dev.2018.03.01a
> git bisect  bad 3f6b5ffc706a54598b82456ae0be395aa6465982  # 22:19  B     =
 0    15   29   0  EXP softirq: Is it possible to RCUify BH disable/enable?
> # extra tests with first bad commit reverted
> git bisect good 7d72a35a80d52e0aff6f5aaf280221a385aac70d  # 22:36  G     =
11     0    2   2  Revert "EXP softirq: Is it possible to RCUify BH disable=
/enable?"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dyocto-trinity-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/yocto/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 512
> 	-smp 1
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	root=3D/dev/ram0
> 	hung_task_panic=3D1
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> 	console=3Dtty0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	vga=3Dnormal
> 	rw
> 	drbd.minor_count=3D8
> 	rcuperf.shutdown=3D0
> )
> =

> "${kvm[@]}" -append "${append[*]}"

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.16.0-rc1 Kernel Configuration
> #
> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> CONFIG_CROSS_COMPILE=3D""
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> CONFIG_KERNEL_LZMA=3Dy
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
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
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ_FULL is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_BSD_PROCESS_ACCT=3Dy
> # CONFIG_BSD_PROCESS_ACCT_V3 is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_CPU_ISOLATION is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> CONFIG_RCU_BOOST=3Dy
> CONFIG_RCU_BOOST_DELAY=3D500
> # CONFIG_RCU_NOCB_CPU is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_NUMA_BALANCING=3Dy
> CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=3Dy
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_HUGETLB is not set
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_BPF is not set
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_SOCK_CGROUP_DATA is not set
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
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
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> # CONFIG_SYSFS_SYSCALL is not set
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
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
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PERF_USE_VMALLOC=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> # CONFIG_VM_EVENT_COUNTERS is not set
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> # CONFIG_OPROFILE is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_KPROBES is not set
> # CONFIG_JUMP_LABEL is not set
> # CONFIG_UPROBES is not set
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
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
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGIN_CYC_COMPLEXITY=3Dy
> CONFIG_GCC_PLUGIN_SANCOV=3Dy
> # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> # CONFIG_GCC_PLUGIN_STRUCTLEAK is not set
> CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy
> # CONFIG_GCC_PLUGIN_RANDSTRUCT_PERFORMANCE is not set
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_CC_STACKPROTECTOR_AUTO=3Dy
> CONFIG_THIN_ARCHIVES=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> # CONFIG_HAVE_ARCH_HASH is not set
> CONFIG_ISA_BUS_API=3Dy
> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_ARCH_HAS_PHYS_TO_DMA=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> # CONFIG_REFCOUNT_FULL is not set
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> CONFIG_MODVERSIONS=3Dy
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> CONFIG_TRIM_UNUSED_KSYMS=3Dy
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
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> # CONFIG_FREEZER is not set
> =

> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
> CONFIG_X86_X2APIC=3Dy
> CONFIG_X86_MPPARSE=3Dy
> CONFIG_GOLDFISH=3Dy
> CONFIG_RETPOLINE=3Dy
> CONFIG_INTEL_RDT=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> # CONFIG_IOSF_MBI is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> # CONFIG_CALGARY_IOMMU is not set
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS=3D8192
> # CONFIG_SCHED_SMT is not set
> CONFIG_SCHED_MC=3Dy
> # CONFIG_SCHED_MC_PRIO is not set
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> # CONFIG_VM86 is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_I8K=3Dy
> # CONFIG_MICROCODE is not set
> # CONFIG_X86_MSR is not set
> CONFIG_X86_CPUID=3Dy
> # CONFIG_X86_5LEVEL is not set
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_NUMA=3Dy
> CONFIG_AMD_NUMA=3Dy
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NODES_SPAN_OTHER_NODES=3Dy
> CONFIG_NUMA_EMU=3Dy
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_MEMORY_PROBE=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_NEED_MULTIPLE_NODES=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_BALLOON_COMPACTION is not set
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_THP_SWAP=3Dy
> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_CMA is not set
> # CONFIG_MEM_SOFT_DIRTY is not set
> # CONFIG_ZPOOL is not set
> CONFIG_ZBUD=3Dy
> CONFIG_ZSMALLOC=3Dm
> # CONFIG_PGTABLE_MAPPING is not set
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
> CONFIG_ZONE_DEVICE=3Dy
> CONFIG_ARCH_HAS_HMM=3Dy
> CONFIG_MIGRATE_VMA_HELPER=3Dy
> CONFIG_HMM=3Dy
> CONFIG_HMM_MIRROR=3Dy
> CONFIG_DEVICE_PRIVATE=3Dy
> # CONFIG_DEVICE_PUBLIC is not set
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> CONFIG_PERCPU_STATS=3Dy
> CONFIG_GUP_BENCHMARK=3Dy
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_INTEL_UMIP is not set
> CONFIG_X86_INTEL_MPX=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> # CONFIG_KEXEC is not set
> CONFIG_KEXEC_FILE=3Dy
> # CONFIG_KEXEC_VERIFY_SIG is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_HOTPLUG_CPU is not set
> # CONFIG_LEGACY_VSYSCALL_NATIVE is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> # CONFIG_PM is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_LPIT=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_NUMA=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> # CONFIG_ACPI_CONTAINER is not set
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_DPTF_POWER is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_X86_PM_TIMER=3Dy
> # CONFIG_SFI is not set
> =

> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # Cadence PCIe controllers support
> #
> =

> #
> # DesignWare PCI Core Support
> #
> =

> #
> # PCI host controller drivers
> #
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> CONFIG_ISA_BUS=3Dy
> # CONFIG_ISA_DMA_API is not set
> CONFIG_PCCARD=3Dm
> CONFIG_PCMCIA=3Dm
> # CONFIG_PCMCIA_LOAD_CIS is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_PD6729 is not set
> # CONFIG_I82092 is not set
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> # CONFIG_COREDUMP is not set
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_TLS is not set
> CONFIG_XFRM=3Dy
> # CONFIG_XFRM_USER is not set
> # CONFIG_XFRM_SUB_POLICY is not set
> # CONFIG_XFRM_MIGRATE is not set
> # CONFIG_XFRM_STATISTICS is not set
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
> # CONFIG_NET_UDP_TUNNEL is not set
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> # CONFIG_INET_XFRM_TUNNEL is not set
> CONFIG_INET_TUNNEL=3Dy
> CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
> CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
> CONFIG_INET_XFRM_MODE_BEET=3Dy
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
> # CONFIG_INET6_XFRM_TUNNEL is not set
> # CONFIG_INET6_TUNNEL is not set
> CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> CONFIG_INET6_XFRM_MODE_BEET=3Dy
> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_FOU is not set
> # CONFIG_IPV6_FOU_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_NETLABEL is not set
> # CONFIG_NETWORK_SECMARK is not set
> CONFIG_NET_PTP_CLASSIFY=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> # CONFIG_L2TP is not set
> # CONFIG_BRIDGE is not set
> CONFIG_HAVE_NET_DSA=3Dy
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_6LOWPAN is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=3Dm
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_JIT is not set
> # CONFIG_BPF_STREAM_PARSER is not set
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> # CONFIG_STREAM_PARSER is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> # CONFIG_LIB80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_CEPH_LIB is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> # CONFIG_NET_DEVLINK is not set
> CONFIG_MAY_USE_DEVLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_TEST_ASYNC_DRIVER_PROBE=3Dm
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_SPMI=3Dy
> CONFIG_REGMAP_W1=3Dm
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_TESTS is not set
> CONFIG_MTD_REDBOOT_PARTS=3Dm
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dm
> # CONFIG_MTD_AR7_PARTS is not set
> =

> #
> # Partition parsers
> #
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
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_GEN_PROBE=3Dy
> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> # CONFIG_MTD_CFI_NOSWAP is not set
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_LE_BYTE_SWAP=3Dy
> CONFIG_MTD_CFI_GEOMETRY=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> CONFIG_MTD_MAP_BANK_WIDTH_32=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> # CONFIG_MTD_CFI_I2 is not set
> CONFIG_MTD_CFI_I4=3Dy
> # CONFIG_MTD_CFI_I8 is not set
> # CONFIG_MTD_OTP is not set
> CONFIG_MTD_CFI_INTELEXT=3Dy
> # CONFIG_MTD_CFI_AMDSTD is not set
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> # CONFIG_MTD_ABSENT is not set
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
> # CONFIG_MTD_SBC_GXX is not set
> # CONFIG_MTD_PCI is not set
> # CONFIG_MTD_PCMCIA is not set
> CONFIG_MTD_GPIO_ADDR=3Dy
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dy
> CONFIG_MTD_LATCH_ADDR=3Dm
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_DATAFLASH is not set
> # CONFIG_MTD_MCHP23K256 is not set
> # CONFIG_MTD_SST25L is not set
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dm
> # CONFIG_MTD_NAND_ECC_SMC is not set
> CONFIG_MTD_NAND=3Dm
> CONFIG_MTD_NAND_BCH=3Dm
> CONFIG_MTD_NAND_ECC_BCH=3Dy
> # CONFIG_MTD_SM_COMMON is not set
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> # CONFIG_MTD_NAND_GPIO is not set
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> # CONFIG_MTD_NAND_RICOH is not set
> CONFIG_MTD_NAND_DISKONCHIP=3Dm
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> CONFIG_MTD_NAND_DOCG4=3Dm
> # CONFIG_MTD_NAND_CAFE is not set
> CONFIG_MTD_NAND_NANDSIM=3Dm
> CONFIG_MTD_NAND_PLATFORM=3Dm
> CONFIG_MTD_ONENAND=3Dm
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> CONFIG_MTD_ONENAND_GENERIC=3Dm
> # CONFIG_MTD_ONENAND_OTP is not set
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> # CONFIG_MTD_SPI_NOR is not set
> # CONFIG_MTD_UBI is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dm
> CONFIG_PARPORT_PC=3Dm
> # CONFIG_PARPORT_SERIAL is not set
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> CONFIG_PARPORT_PC_PCMCIA=3Dm
> # CONFIG_PARPORT_GSC is not set
> CONFIG_PARPORT_AX88796=3Dm
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # NVME Support
> #
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> CONFIG_AD525X_DPOT=3Dm
> CONFIG_AD525X_DPOT_I2C=3Dm
> CONFIG_AD525X_DPOT_SPI=3Dm
> CONFIG_DUMMY_IRQ=3Dm
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dy
> CONFIG_ENCLOSURE_SERVICES=3Dy
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dm
> # CONFIG_ISL29020 is not set
> # CONFIG_SENSORS_TSL2550 is not set
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dy
> CONFIG_USB_SWITCH_FSA9480=3Dy
> CONFIG_LATTICE_ECP3_CONFIG=3Dm
> # CONFIG_SRAM is not set
> # CONFIG_PCI_ENDPOINT_TEST is not set
> CONFIG_MISC_RTSX=3Dm
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> CONFIG_EEPROM_AT25=3Dm
> # CONFIG_EEPROM_LEGACY is not set
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dm
> CONFIG_EEPROM_93XX46=3Dy
> CONFIG_EEPROM_IDT_89HPESX=3Dm
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dm
> CONFIG_ALTERA_STAPL=3Dy
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC & related support
> #
> =

> #
> # Intel MIC Bus Driver
> #
> # CONFIG_INTEL_MIC_BUS is not set
> =

> #
> # SCIF Bus Driver
> #
> # CONFIG_SCIF_BUS is not set
> =

> #
> # VOP Bus Driver
> #
> # CONFIG_VOP_BUS is not set
> =

> #
> # Intel MIC Host Driver
> #
> =

> #
> # Intel MIC Card Driver
> #
> =

> #
> # SCIF Driver
> #
> =

> #
> # Intel MIC Coprocessor State Management (COSM) Drivers
> #
> =

> #
> # VOP Driver
> #
> # CONFIG_GENWQE is not set
> CONFIG_ECHO=3Dm
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
> # CONFIG_CXL_LIB is not set
> # CONFIG_OCXL_BASE is not set
> # CONFIG_MISC_RTSX_PCI is not set
> CONFIG_MISC_RTSX_USB=3Dm
> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_SCSI_DMA is not set
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NETPOLL is not set
> # CONFIG_NET_POLL_CONTROLLER is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
> =

> #
> # CAIF transport drivers
> #
> =

> #
> # Distributed Switch Architecture drivers
> #
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dm
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_PCMCIA_3C574 is not set
> # CONFIG_PCMCIA_3C589 is not set
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
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_PCMCIA_NMCLAN is not set
> # CONFIG_AMD_XGBE is not set
> # CONFIG_AMD_XGBE_HAVE_ECC is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> # CONFIG_NET_VENDOR_AURORA is not set
> CONFIG_NET_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> CONFIG_CAVIUM_PTP=3Dy
> # CONFIG_LIQUIDIO is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
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
> CONFIG_NET_VENDOR_EXAR=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_FUJITSU=3Dy
> # CONFIG_PCMCIA_FMVJ18X is not set
> CONFIG_NET_VENDOR_HP=3Dy
> # CONFIG_HP100 is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> CONFIG_E1000E=3Dm
> CONFIG_E1000E_HWTS=3Dy
> CONFIG_IGB=3Dm
> CONFIG_IGB_HWMON=3Dy
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> CONFIG_IXGBE=3Dm
> CONFIG_IXGBE_HWMON=3Dy
> # CONFIG_I40E is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX4_CORE is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_PCMCIA_AXNET is not set
> # CONFIG_NE2K_PCI is not set
> # CONFIG_PCMCIA_PCNET is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_PACKET_ENGINE=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_QLGE is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_ROCKER=3Dy
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_PCMCIA_SMC91C92 is not set
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
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_ALE is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XIRCOM=3Dy
> # CONFIG_PCMCIA_XIRC2PS is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_MDIO_BUS is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_MICREL_KS8995MA is not set
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> CONFIG_USB_NET_DRIVERS=3Dy
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> # CONFIG_USB_RTL8152 is not set
> # CONFIG_USB_LAN78XX is not set
> # CONFIG_USB_USBNET is not set
> # CONFIG_USB_IPHETH is not set
> CONFIG_WLAN=3Dy
> # CONFIG_WIRELESS_WDS is not set
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
> # CONFIG_PRISM54 is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> CONFIG_WLAN_VENDOR_RSI=3Dy
> CONFIG_WLAN_VENDOR_ST=3Dy
> CONFIG_WLAN_VENDOR_TI=3Dy
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_PCMCIA_RAYCS is not set
> =

> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_NETDEVSIM is not set
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dm
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> CONFIG_INPUT_JOYDEV=3Dm
> CONFIG_INPUT_EVDEV=3Dm
> CONFIG_INPUT_EVBUG=3Dm
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADC is not set
> CONFIG_KEYBOARD_ADP5588=3Dm
> CONFIG_KEYBOARD_ADP5589=3Dm
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1070 is not set
> CONFIG_KEYBOARD_QT2160=3Dy
> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
> # CONFIG_KEYBOARD_LKKBD is not set
> CONFIG_KEYBOARD_GPIO=3Dm
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> CONFIG_KEYBOARD_TCA6416=3Dm
> CONFIG_KEYBOARD_TCA8418=3Dm
> CONFIG_KEYBOARD_MATRIX=3Dm
> # CONFIG_KEYBOARD_LM8323 is not set
> CONFIG_KEYBOARD_LM8333=3Dy
> CONFIG_KEYBOARD_MAX7359=3Dy
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dm
> CONFIG_KEYBOARD_NEWTON=3Dm
> CONFIG_KEYBOARD_OPENCORES=3Dm
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> CONFIG_KEYBOARD_SUNKBD=3Dy
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> CONFIG_KEYBOARD_XTKBD=3Dm
> CONFIG_KEYBOARD_CROS_EC=3Dy
> CONFIG_INPUT_MOUSE=3Dy
> # CONFIG_MOUSE_PS2 is not set
> CONFIG_MOUSE_SERIAL=3Dm
> CONFIG_MOUSE_APPLETOUCH=3Dy
> CONFIG_MOUSE_BCM5974=3Dy
> CONFIG_MOUSE_CYAPA=3Dy
> CONFIG_MOUSE_ELAN_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
> # CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
> CONFIG_MOUSE_VSXXXAA=3Dm
> CONFIG_MOUSE_GPIO=3Dy
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_AD714X=3Dy
> CONFIG_INPUT_AD714X_I2C=3Dm
> CONFIG_INPUT_AD714X_SPI=3Dm
> CONFIG_INPUT_ARIZONA_HAPTICS=3Dm
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_E3X0_BUTTON=3Dm
> CONFIG_INPUT_MAX77693_HAPTIC=3Dy
> # CONFIG_INPUT_MAX8925_ONKEY is not set
> CONFIG_INPUT_MAX8997_HAPTIC=3Dm
> CONFIG_INPUT_MC13783_PWRBUTTON=3Dm
> # CONFIG_INPUT_MMA8450 is not set
> CONFIG_INPUT_APANEL=3Dm
> CONFIG_INPUT_GP2A=3Dy
> CONFIG_INPUT_GPIO_BEEPER=3Dm
> # CONFIG_INPUT_GPIO_DECODER is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> CONFIG_INPUT_ATI_REMOTE2=3Dm
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> # CONFIG_INPUT_KXTJ9 is not set
> CONFIG_INPUT_POWERMATE=3Dy
> CONFIG_INPUT_YEALINK=3Dy
> # CONFIG_INPUT_CM109 is not set
> # CONFIG_INPUT_REGULATOR_HAPTIC is not set
> CONFIG_INPUT_AXP20X_PEK=3Dm
> # CONFIG_INPUT_UINPUT is not set
> # CONFIG_INPUT_PCF50633_PMU is not set
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_PWM_BEEPER=3Dm
> CONFIG_INPUT_PWM_VIBRA=3Dm
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
> CONFIG_INPUT_DA9052_ONKEY=3Dm
> # CONFIG_INPUT_DA9063_ONKEY is not set
> CONFIG_INPUT_WM831X_ON=3Dm
> CONFIG_INPUT_PCAP=3Dm
> CONFIG_INPUT_ADXL34X=3Dy
> CONFIG_INPUT_ADXL34X_I2C=3Dm
> CONFIG_INPUT_ADXL34X_SPI=3Dy
> # CONFIG_INPUT_IMS_PCU is not set
> CONFIG_INPUT_CMA3000=3Dy
> CONFIG_INPUT_CMA3000_I2C=3Dy
> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> # CONFIG_INPUT_SOC_BUTTON_ARRAY is not set
> CONFIG_INPUT_DRV260X_HAPTICS=3Dy
> CONFIG_INPUT_DRV2665_HAPTICS=3Dy
> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> CONFIG_RMI4_CORE=3Dm
> CONFIG_RMI4_I2C=3Dm
> CONFIG_RMI4_SPI=3Dm
> CONFIG_RMI4_SMB=3Dm
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> # CONFIG_RMI4_F34 is not set
> # CONFIG_RMI4_F55 is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dm
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dm
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dm
> CONFIG_SERIO_GPIO_PS2=3Dy
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> # CONFIG_GAMEPORT_L4 is not set
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_ROCKETPORT is not set
> # CONFIG_CYCLADES is not set
> # CONFIG_MOXA_INTELLIO is not set
> # CONFIG_MOXA_SMARTIO is not set
> # CONFIG_SYNCLINKMP is not set
> # CONFIG_SYNCLINK_GT is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_ISI is not set
> # CONFIG_N_HDLC is not set
> # CONFIG_N_GSM is not set
> CONFIG_TRACE_ROUTER=3Dm
> CONFIG_TRACE_SINK=3Dy
> CONFIG_GOLDFISH_TTY=3Dm
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVKMEM is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> CONFIG_SERIAL_8250_FINTEK=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> # CONFIG_SERIAL_8250_DMA is not set
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_CS=3Dm
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_FSL is not set
> CONFIG_SERIAL_8250_DW=3Dm
> CONFIG_SERIAL_8250_RT288X=3Dy
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_8250_MOXA is not set
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
> CONFIG_SERIAL_SCCNXP=3Dy
> CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
> CONFIG_SERIAL_SC16IS7XX=3Dy
> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> # CONFIG_SERIAL_SC16IS7XX_SPI is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_IFX6X60 is not set
> CONFIG_SERIAL_ARC=3Dy
> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dm
> # CONFIG_SERIAL_MEN_Z135 is not set
> CONFIG_SERIAL_DEV_BUS=3Dy
> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> CONFIG_TTY_PRINTK=3Dy
> # CONFIG_PRINTER is not set
> CONFIG_PPDEV=3Dm
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dy
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PROC_INTERFACE=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_WATCHDOG=3Dy
> CONFIG_IPMI_POWEROFF=3Dy
> CONFIG_HW_RANDOM=3Dm
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> CONFIG_HW_RANDOM_INTEL=3Dm
> CONFIG_HW_RANDOM_AMD=3Dm
> CONFIG_HW_RANDOM_VIA=3Dm
> CONFIG_HW_RANDOM_VIRTIO=3Dm
> # CONFIG_NVRAM is not set
> CONFIG_R3964=3Dm
> # CONFIG_APPLICOM is not set
> =

> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> CONFIG_CARDMAN_4000=3Dm
> # CONFIG_CARDMAN_4040 is not set
> # CONFIG_SCR24X is not set
> # CONFIG_IPWIRELESS is not set
> CONFIG_MWAVE=3Dm
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dm
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dm
> CONFIG_TCG_TIS_SPI=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> # CONFIG_TCG_TIS_I2C_INFINEON is not set
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> # CONFIG_TCG_NSC is not set
> # CONFIG_TCG_ATMEL is not set
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> CONFIG_TELCLOCK=3Dm
> CONFIG_DEVPORT=3Dy
> # CONFIG_XILLYBUS is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_LTC4306=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> # CONFIG_I2C_MUX_PCA954x is not set
> CONFIG_I2C_MUX_REG=3Dy
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
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
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> # CONFIG_I2C_ISMT is not set
> # CONFIG_I2C_PIIX4 is not set
> # CONFIG_I2C_NFORCE2 is not set
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
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> CONFIG_I2C_KEMPLD=3Dm
> CONFIG_I2C_OCORES=3Dm
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dy
> CONFIG_I2C_DLN2=3Dm
> CONFIG_I2C_PARPORT=3Dm
> CONFIG_I2C_PARPORT_LIGHT=3Dm
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> CONFIG_I2C_TAOS_EVM=3Dy
> CONFIG_I2C_TINY_USB=3Dm
> CONFIG_I2C_VIPERBOARD=3Dm
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dm
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> CONFIG_SPI=3Dy
> CONFIG_SPI_DEBUG=3Dy
> CONFIG_SPI_MASTER=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> CONFIG_SPI_BITBANG=3Dy
> # CONFIG_SPI_BUTTERFLY is not set
> CONFIG_SPI_CADENCE=3Dm
> CONFIG_SPI_DESIGNWARE=3Dm
> # CONFIG_SPI_DW_PCI is not set
> CONFIG_SPI_DW_MMIO=3Dm
> CONFIG_SPI_DLN2=3Dm
> CONFIG_SPI_GPIO=3Dy
> # CONFIG_SPI_LM70_LLP is not set
> CONFIG_SPI_OC_TINY=3Dm
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_PXA2XX_PCI is not set
> CONFIG_SPI_ROCKCHIP=3Dy
> CONFIG_SPI_SC18IS602=3Dm
> # CONFIG_SPI_XCOMM is not set
> # CONFIG_SPI_XILINX is not set
> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> =

> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=3Dm
> # CONFIG_SPI_LOOPBACK_TEST is not set
> # CONFIG_SPI_TLE62X0 is not set
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPMI=3Dy
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
> CONFIG_HSI_CHAR=3Dy
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> CONFIG_NTP_PPS=3Dy
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_LDISC=3Dm
> # CONFIG_PPS_CLIENT_PARPORT is not set
> CONFIG_PPS_CLIENT_GPIO=3Dm
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=3Dy
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_PTP_1588_CLOCK_KVM=3Dy
> # CONFIG_PINCTRL is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dm
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_LYNXPOINT is not set
> CONFIG_GPIO_MB86S7X=3Dm
> CONFIG_GPIO_MENZ127=3Dm
> CONFIG_GPIO_MOCKUP=3Dy
> # CONFIG_GPIO_VX855 is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_F7188X is not set
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dm
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dm
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dm
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_DA9052=3Dy
> # CONFIG_GPIO_DLN2 is not set
> CONFIG_GPIO_KEMPLD=3Dm
> CONFIG_GPIO_LP873X=3Dm
> # CONFIG_GPIO_RC5T583 is not set
> # CONFIG_GPIO_TPS65086 is not set
> # CONFIG_GPIO_TPS65910 is not set
> # CONFIG_GPIO_WM831X is not set
> CONFIG_GPIO_WM8994=3Dm
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_MAX3191X=3Dm
> CONFIG_GPIO_MAX7301=3Dy
> CONFIG_GPIO_MC33880=3Dm
> CONFIG_GPIO_PISOSR=3Dm
> CONFIG_GPIO_XRA1403=3Dy
> =

> #
> # USB GPIO expanders
> #
> CONFIG_GPIO_VIPERBOARD=3Dm
> CONFIG_W1=3Dm
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=3Dm
> CONFIG_W1_MASTER_DS2482=3Dm
> CONFIG_W1_MASTER_DS1WM=3Dm
> CONFIG_W1_MASTER_GPIO=3Dm
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dm
> CONFIG_W1_SLAVE_SMEM=3Dm
> CONFIG_W1_SLAVE_DS2405=3Dm
> CONFIG_W1_SLAVE_DS2408=3Dm
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> CONFIG_W1_SLAVE_DS2413=3Dm
> CONFIG_W1_SLAVE_DS2406=3Dm
> CONFIG_W1_SLAVE_DS2423=3Dm
> CONFIG_W1_SLAVE_DS2805=3Dm
> CONFIG_W1_SLAVE_DS2431=3Dm
> # CONFIG_W1_SLAVE_DS2433 is not set
> CONFIG_W1_SLAVE_DS2438=3Dm
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dm
> CONFIG_W1_SLAVE_DS2781=3Dm
> CONFIG_W1_SLAVE_DS28E04=3Dm
> CONFIG_W1_SLAVE_DS28E17=3Dm
> # CONFIG_POWER_AVS is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> CONFIG_PDA_POWER=3Dm
> # CONFIG_GENERIC_ADC_BATTERY is not set
> # CONFIG_MAX8925_POWER is not set
> CONFIG_WM831X_BACKUP=3Dm
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_TEST_POWER is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> CONFIG_BATTERY_DS2782=3Dm
> # CONFIG_BATTERY_SBS is not set
> CONFIG_CHARGER_SBS=3Dm
> CONFIG_MANAGER_SBS=3Dy
> CONFIG_BATTERY_BQ27XXX=3Dm
> CONFIG_BATTERY_BQ27XXX_I2C=3Dm
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dm
> # CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
> # CONFIG_BATTERY_DA9052 is not set
> CONFIG_AXP20X_POWER=3Dm
> CONFIG_AXP288_CHARGER=3Dm
> # CONFIG_AXP288_FUEL_GAUGE is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=3Dm
> CONFIG_CHARGER_PCF50633=3Dm
> CONFIG_CHARGER_ISP1704=3Dy
> CONFIG_CHARGER_MAX8903=3Dm
> CONFIG_CHARGER_LP8727=3Dm
> CONFIG_CHARGER_LP8788=3Dy
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_LTC3651=3Dm
> CONFIG_CHARGER_MAX14577=3Dm
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> CONFIG_CHARGER_BQ24257=3Dm
> CONFIG_CHARGER_BQ24735=3Dm
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_CHARGER_TPS65090=3Dm
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_GOLDFISH=3Dm
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7314=3Dy
> CONFIG_SENSORS_AD7414=3Dm
> CONFIG_SENSORS_AD7418=3Dm
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dm
> # CONFIG_SENSORS_ADM1026 is not set
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dm
> CONFIG_SENSORS_ADT7410=3Dy
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dm
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dy
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> CONFIG_SENSORS_APPLESMC=3Dm
> CONFIG_SENSORS_ASB100=3Dm
> CONFIG_SENSORS_ASPEED=3Dm
> CONFIG_SENSORS_ATXP1=3Dm
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9052_ADC=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_MC13783_ADC=3Dm
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_HIH6130=3Dm
> # CONFIG_SENSORS_IBMAEM is not set
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dm
> # CONFIG_SENSORS_I5500 is not set
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=3Dm
> # CONFIG_SENSORS_JC42 is not set
> # CONFIG_SENSORS_POWR1220 is not set
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dm
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dm
> # CONFIG_SENSORS_MAX1111 is not set
> CONFIG_SENSORS_MAX16065=3Dy
> # CONFIG_SENSORS_MAX1619 is not set
> # CONFIG_SENSORS_MAX1668 is not set
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX31722 is not set
> CONFIG_SENSORS_MAX6621=3Dm
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_MAX31790=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_TC654 is not set
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM70 is not set
> CONFIG_SENSORS_LM73=3Dm
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dm
> CONFIG_SENSORS_LM80=3Dm
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dm
> # CONFIG_SENSORS_LM87 is not set
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dm
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dm
> CONFIG_SENSORS_NCT6775=3Dy
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NCT7904=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dm
> # CONFIG_SENSORS_PMBUS is not set
> CONFIG_SENSORS_ADM1275=3Dm
> CONFIG_SENSORS_IBM_CFFPS=3Dm
> # CONFIG_SENSORS_IR35221 is not set
> # CONFIG_SENSORS_LM25066 is not set
> CONFIG_SENSORS_LTC2978=3Dm
> # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> CONFIG_SENSORS_LTC3815=3Dm
> # CONFIG_SENSORS_MAX16064 is not set
> CONFIG_SENSORS_MAX20751=3Dm
> CONFIG_SENSORS_MAX31785=3Dm
> CONFIG_SENSORS_MAX34440=3Dm
> # CONFIG_SENSORS_MAX8688 is not set
> # CONFIG_SENSORS_TPS40422 is not set
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dm
> CONFIG_SENSORS_UCD9200=3Dm
> CONFIG_SENSORS_ZL6100=3Dm
> CONFIG_SENSORS_SHT15=3Dm
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHT3x=3Dy
> CONFIG_SENSORS_SHTC1=3Dm
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dm
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_STTS751=3Dm
> CONFIG_SENSORS_SMM665=3Dm
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS1015 is not set
> CONFIG_SENSORS_ADS7828=3Dm
> # CONFIG_SENSORS_ADS7871 is not set
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dm
> CONFIG_SENSORS_INA2XX=3Dm
> # CONFIG_SENSORS_INA3221 is not set
> CONFIG_SENSORS_TC74=3Dm
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dm
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=3Dy
> CONFIG_SENSORS_W83781D=3Dm
> # CONFIG_SENSORS_W83791D is not set
> CONFIG_SENSORS_W83792D=3Dm
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dm
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> CONFIG_SENSORS_W83L785TS=3Dm
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> CONFIG_SENSORS_WM831X=3Dm
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> # CONFIG_CLOCK_THERMAL is not set
> # CONFIG_DEVFREQ_THERMAL is not set
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
> # CONFIG_GENERIC_ADC_THERMAL is not set
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dm
> # CONFIG_MFD_BD9571MWV is not set
> CONFIG_MFD_AXP20X=3Dm
> CONFIG_MFD_AXP20X_I2C=3Dm
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dy
> # CONFIG_MFD_CROS_EC_SPI is not set
> # CONFIG_MFD_CROS_EC_CHARDEV is not set
> # CONFIG_PMIC_DA903X is not set
> CONFIG_PMIC_DA9052=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> CONFIG_MFD_DA9052_I2C=3Dy
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9062=3Dy
> CONFIG_MFD_DA9063=3Dm
> # CONFIG_MFD_DA9150 is not set
> CONFIG_MFD_DLN2=3Dm
> CONFIG_MFD_MC13XXX=3Dm
> # CONFIG_MFD_MC13XXX_SPI is not set
> CONFIG_MFD_MC13XXX_I2C=3Dm
> CONFIG_HTC_PASIC3=3Dm
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dm
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=3Dm
> # CONFIG_MFD_MAX77693 is not set
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_MT6397=3Dm
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_EZX_PCAP=3Dy
> CONFIG_MFD_VIPERBOARD=3Dm
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> CONFIG_PCF50633_GPIO=3Dy
> # CONFIG_UCB1400_CORE is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> # CONFIG_MFD_SM501_GPIO is not set
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_SMSC is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dm
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_TI_LMU=3Dm
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dm
> CONFIG_MFD_TPS65086=3Dy
> CONFIG_MFD_TPS65090=3Dy
> # CONFIG_MFD_TPS68470 is not set
> CONFIG_MFD_TI_LP873X=3Dm
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS65912_SPI is not set
> CONFIG_MFD_TPS80031=3Dy
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dm
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_ARIZONA_SPI=3Dy
> CONFIG_MFD_CS47L24=3Dy
> # CONFIG_MFD_WM5102 is not set
> CONFIG_MFD_WM5110=3Dy
> # CONFIG_MFD_WM8997 is not set
> # CONFIG_MFD_WM8998 is not set
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> # CONFIG_MFD_WM831X_I2C is not set
> CONFIG_MFD_WM831X_SPI=3Dy
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dm
> CONFIG_RAVE_SP_CORE=3Dm
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dm
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_AD5398=3Dy
> # CONFIG_REGULATOR_ANATOP is not set
> # CONFIG_REGULATOR_ARIZONA_LDO1 is not set
> CONFIG_REGULATOR_ARIZONA_MICSUPP=3Dm
> CONFIG_REGULATOR_AXP20X=3Dm
> # CONFIG_REGULATOR_BCM590XX is not set
> CONFIG_REGULATOR_DA9052=3Dm
> CONFIG_REGULATOR_DA9062=3Dm
> CONFIG_REGULATOR_DA9063=3Dm
> CONFIG_REGULATOR_DA9210=3Dm
> # CONFIG_REGULATOR_DA9211 is not set
> # CONFIG_REGULATOR_FAN53555 is not set
> CONFIG_REGULATOR_GPIO=3Dm
> # CONFIG_REGULATOR_ISL9305 is not set
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LP3971=3Dm
> CONFIG_REGULATOR_LP3972=3Dm
> CONFIG_REGULATOR_LP872X=3Dy
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LP8788=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> CONFIG_REGULATOR_LTC3676=3Dm
> CONFIG_REGULATOR_MAX14577=3Dm
> CONFIG_REGULATOR_MAX1586=3Dm
> CONFIG_REGULATOR_MAX8649=3Dy
> CONFIG_REGULATOR_MAX8660=3Dm
> # CONFIG_REGULATOR_MAX8907 is not set
> # CONFIG_REGULATOR_MAX8925 is not set
> # CONFIG_REGULATOR_MAX8952 is not set
> # CONFIG_REGULATOR_MAX8997 is not set
> # CONFIG_REGULATOR_MAX8998 is not set
> # CONFIG_REGULATOR_MAX77693 is not set
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> CONFIG_REGULATOR_MC13783=3Dm
> # CONFIG_REGULATOR_MC13892 is not set
> CONFIG_REGULATOR_MT6311=3Dm
> # CONFIG_REGULATOR_MT6323 is not set
> CONFIG_REGULATOR_MT6397=3Dm
> CONFIG_REGULATOR_PCAP=3Dm
> CONFIG_REGULATOR_PCF50633=3Dm
> CONFIG_REGULATOR_PFUZE100=3Dm
> CONFIG_REGULATOR_PV88060=3Dm
> CONFIG_REGULATOR_PV88080=3Dm
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_PWM=3Dy
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> CONFIG_REGULATOR_RC5T583=3Dy
> # CONFIG_REGULATOR_S2MPA01 is not set
> # CONFIG_REGULATOR_S2MPS11 is not set
> # CONFIG_REGULATOR_S5M8767 is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> CONFIG_REGULATOR_TPS6105X=3Dy
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dm
> CONFIG_REGULATOR_TPS65090=3Dm
> # CONFIG_REGULATOR_TPS65132 is not set
> # CONFIG_REGULATOR_TPS6524X is not set
> # CONFIG_REGULATOR_TPS65910 is not set
> CONFIG_REGULATOR_TPS80031=3Dy
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8994=3Dm
> # CONFIG_RC_CORE is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> CONFIG_MEDIA_CONTROLLER=3Dy
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_DVB_CORE=3Dy
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> =

> #
> # Media drivers
> #
> CONFIG_MEDIA_USB_SUPPORT=3Dy
> =

> #
> # Analog/digital TV USB devices
> #
> # CONFIG_VIDEO_AU0828 is not set
> =

> #
> # Digital TV USB devices
> #
> CONFIG_DVB_USB_V2=3Dy
> # CONFIG_DVB_USB_AF9015 is not set
> CONFIG_DVB_USB_AF9035=3Dm
> CONFIG_DVB_USB_ANYSEE=3Dy
> # CONFIG_DVB_USB_AU6610 is not set
> CONFIG_DVB_USB_AZ6007=3Dm
> # CONFIG_DVB_USB_CE6230 is not set
> CONFIG_DVB_USB_EC168=3Dm
> # CONFIG_DVB_USB_GL861 is not set
> CONFIG_DVB_USB_MXL111SF=3Dy
> CONFIG_DVB_USB_RTL28XXU=3Dy
> CONFIG_DVB_USB_DVBSKY=3Dm
> CONFIG_DVB_USB_ZD1301=3Dy
> # CONFIG_DVB_TTUSB_BUDGET is not set
> # CONFIG_DVB_TTUSB_DEC is not set
> CONFIG_SMS_USB_DRV=3Dm
> CONFIG_DVB_B2C2_FLEXCOP_USB=3Dy
> # CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
> CONFIG_DVB_AS102=3Dm
> =

> #
> # Webcam, TV (analog/digital) USB devices
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_SMS_SDIO_DRV=3Dm
> CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> =

> #
> # common driver options
> #
> CONFIG_VIDEO_TVEEPROM=3Dy
> CONFIG_CYPRESS_FIRMWARE=3Dm
> CONFIG_DVB_B2C2_FLEXCOP=3Dy
> CONFIG_SMS_SIANO_MDTV=3Dm
> CONFIG_SMS_SIANO_DEBUGFS=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> # CONFIG_MEDIA_TUNER_SIMPLE is not set
> CONFIG_MEDIA_TUNER_TDA18250=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> CONFIG_MEDIA_TUNER_TEA5767=3Dm
> # CONFIG_MEDIA_TUNER_MT20XX is not set
> # CONFIG_MEDIA_TUNER_MT2060 is not set
> # CONFIG_MEDIA_TUNER_MT2063 is not set
> CONFIG_MEDIA_TUNER_MT2266=3Dm
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> CONFIG_MEDIA_TUNER_QT1010=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> # CONFIG_MEDIA_TUNER_XC5000 is not set
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> # CONFIG_MEDIA_TUNER_MC44S803 is not set
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> CONFIG_MEDIA_TUNER_TDA18218=3Dy
> CONFIG_MEDIA_TUNER_FC0011=3Dm
> CONFIG_MEDIA_TUNER_FC0012=3Dy
> CONFIG_MEDIA_TUNER_FC0013=3Dm
> CONFIG_MEDIA_TUNER_TDA18212=3Dm
> CONFIG_MEDIA_TUNER_E4000=3Dy
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> CONFIG_MEDIA_TUNER_TUA9001=3Dy
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> CONFIG_MEDIA_TUNER_IT913X=3Dm
> # CONFIG_MEDIA_TUNER_R820T is not set
> # CONFIG_MEDIA_TUNER_MXL301RF is not set
> # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dm
> CONFIG_DVB_STB6100=3Dy
> # CONFIG_DVB_STV090x is not set
> CONFIG_DVB_STV0910=3Dm
> # CONFIG_DVB_STV6110x is not set
> CONFIG_DVB_STV6111=3Dy
> # CONFIG_DVB_MXL5XX is not set
> CONFIG_DVB_M88DS3103=3Dy
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> # CONFIG_DVB_DRXK is not set
> # CONFIG_DVB_TDA18271C2DD is not set
> CONFIG_DVB_SI2165=3Dm
> CONFIG_DVB_MN88472=3Dm
> CONFIG_DVB_MN88473=3Dm
> =

> #
> # DVB-S (satellite) frontends
> #
> # CONFIG_DVB_CX24110 is not set
> CONFIG_DVB_CX24123=3Dy
> CONFIG_DVB_MT312=3Dy
> CONFIG_DVB_ZL10036=3Dm
> # CONFIG_DVB_ZL10039 is not set
> CONFIG_DVB_S5H1420=3Dy
> CONFIG_DVB_STV0288=3Dm
> # CONFIG_DVB_STB6000 is not set
> CONFIG_DVB_STV0299=3Dy
> CONFIG_DVB_STV6110=3Dm
> CONFIG_DVB_STV0900=3Dm
> CONFIG_DVB_TDA8083=3Dm
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=3Dy
> # CONFIG_DVB_VES1X93 is not set
> CONFIG_DVB_TUNER_ITD1000=3Dm
> CONFIG_DVB_TUNER_CX24113=3Dy
> CONFIG_DVB_TDA826X=3Dm
> # CONFIG_DVB_TUA6100 is not set
> CONFIG_DVB_CX24116=3Dy
> CONFIG_DVB_CX24117=3Dm
> CONFIG_DVB_CX24120=3Dm
> CONFIG_DVB_SI21XX=3Dy
> CONFIG_DVB_TS2020=3Dy
> # CONFIG_DVB_DS3000 is not set
> CONFIG_DVB_MB86A16=3Dm
> CONFIG_DVB_TDA10071=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> # CONFIG_DVB_SP8870 is not set
> CONFIG_DVB_SP887X=3Dm
> CONFIG_DVB_CX22700=3Dy
> # CONFIG_DVB_CX22702 is not set
> CONFIG_DVB_S5H1432=3Dy
> CONFIG_DVB_DRXD=3Dy
> CONFIG_DVB_L64781=3Dm
> CONFIG_DVB_TDA1004X=3Dm
> CONFIG_DVB_NXT6000=3Dy
> CONFIG_DVB_MT352=3Dy
> CONFIG_DVB_ZL10353=3Dy
> CONFIG_DVB_DIB3000MB=3Dm
> CONFIG_DVB_DIB3000MC=3Dm
> CONFIG_DVB_DIB7000M=3Dm
> CONFIG_DVB_DIB7000P=3Dy
> CONFIG_DVB_DIB9000=3Dy
> CONFIG_DVB_TDA10048=3Dy
> CONFIG_DVB_AF9013=3Dy
> CONFIG_DVB_EC100=3Dm
> CONFIG_DVB_STV0367=3Dm
> CONFIG_DVB_CXD2820R=3Dm
> CONFIG_DVB_CXD2841ER=3Dy
> CONFIG_DVB_RTL2830=3Dy
> CONFIG_DVB_RTL2832=3Dy
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_AS102_FE=3Dm
> CONFIG_DVB_ZD1301_DEMOD=3Dy
> # CONFIG_DVB_GP8PSK_FE is not set
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dy
> CONFIG_DVB_TDA10021=3Dm
> # CONFIG_DVB_TDA10023 is not set
> # CONFIG_DVB_STV0297 is not set
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dy
> CONFIG_DVB_OR51211=3Dm
> CONFIG_DVB_OR51132=3Dm
> # CONFIG_DVB_BCM3510 is not set
> CONFIG_DVB_LGDT330X=3Dy
> # CONFIG_DVB_LGDT3305 is not set
> CONFIG_DVB_LGDT3306A=3Dy
> # CONFIG_DVB_LG2160 is not set
> # CONFIG_DVB_S5H1409 is not set
> CONFIG_DVB_AU8522=3Dy
> CONFIG_DVB_AU8522_DTV=3Dy
> # CONFIG_DVB_S5H1411 is not set
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_S921 is not set
> CONFIG_DVB_DIB8000=3Dy
> CONFIG_DVB_MB86A20S=3Dm
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dy
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> # CONFIG_DVB_PLL is not set
> CONFIG_DVB_TUNER_DIB0070=3Dy
> # CONFIG_DVB_TUNER_DIB0090 is not set
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dm
> CONFIG_DVB_LNBH25=3Dm
> CONFIG_DVB_LNBP21=3Dy
> CONFIG_DVB_LNBP22=3Dy
> CONFIG_DVB_ISL6405=3Dm
> CONFIG_DVB_ISL6421=3Dy
> # CONFIG_DVB_ISL6423 is not set
> CONFIG_DVB_A8293=3Dm
> CONFIG_DVB_SP2=3Dy
> CONFIG_DVB_LGS8GL5=3Dy
> CONFIG_DVB_LGS8GXX=3Dy
> # CONFIG_DVB_ATBM8830 is not set
> # CONFIG_DVB_TDA665x is not set
> # CONFIG_DVB_IX2505V is not set
> CONFIG_DVB_M88RS2000=3Dy
> CONFIG_DVB_AF9033=3Dm
> CONFIG_DVB_HORUS3A=3Dm
> # CONFIG_DVB_ASCOT2E is not set
> CONFIG_DVB_HELENE=3Dy
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dy
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> CONFIG_DRM_DEBUG_MM=3Dy
> CONFIG_DRM_DEBUG_MM_SELFTEST=3Dm
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_FBDEV_OVERALLOC=3D100
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dm
> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> CONFIG_DRM_KMS_CMA_HELPER=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> =

> #
> # AMD Library routines
> #
> # CONFIG_CHASH is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> CONFIG_DRM_VGEM=3Dm
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> CONFIG_DRM_UDL=3Dm
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> CONFIG_DRM_VIRTIO_GPU=3Dm
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dm
> # CONFIG_DRM_HISI_HIBMC is not set
> CONFIG_DRM_TINYDRM=3Dy
> CONFIG_TINYDRM_MIPI_DBI=3Dy
> # CONFIG_TINYDRM_ILI9225 is not set
> CONFIG_TINYDRM_MI0283QT=3Dm
> # CONFIG_TINYDRM_REPAPER is not set
> # CONFIG_TINYDRM_ST7586 is not set
> CONFIG_TINYDRM_ST7735R=3Dy
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> # CONFIG_FB_DDC is not set
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> CONFIG_FB_FOREIGN_ENDIAN=3Dy
> # CONFIG_FB_BOTH_ENDIAN is not set
> # CONFIG_FB_BIG_ENDIAN is not set
> CONFIG_FB_LITTLE_ENDIAN=3Dy
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> # CONFIG_FB_SVGALIB is not set
> # CONFIG_FB_MACMODES is not set
> # CONFIG_FB_BACKLIGHT is not set
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_N411 is not set
> CONFIG_FB_HGA=3Dm
> CONFIG_FB_OPENCORES=3Dy
> CONFIG_FB_S1D13XXX=3Dm
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
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> CONFIG_FB_IBM_GXT4500=3Dy
> CONFIG_FB_GOLDFISH=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_BROADSHEET=3Dm
> CONFIG_FB_AUO_K190X=3Dy
> CONFIG_FB_AUO_K1900=3Dm
> # CONFIG_FB_AUO_K1901 is not set
> # CONFIG_FB_SIMPLE is not set
> # CONFIG_FB_SM712 is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_L4F00242T03=3Dy
> CONFIG_LCD_LMS283GF05=3Dy
> # CONFIG_LCD_LTV350QV is not set
> CONFIG_LCD_ILI922X=3Dy
> CONFIG_LCD_ILI9320=3Dm
> CONFIG_LCD_TDO24M=3Dy
> # CONFIG_LCD_VGG2432A4 is not set
> CONFIG_LCD_PLATFORM=3Dy
> # CONFIG_LCD_S6E63M0 is not set
> # CONFIG_LCD_LD9040 is not set
> CONFIG_LCD_AMS369FG06=3Dm
> CONFIG_LCD_LMS501KF03=3Dm
> # CONFIG_LCD_HX8357 is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dm
> CONFIG_BACKLIGHT_LM3533=3Dm
> CONFIG_BACKLIGHT_PWM=3Dm
> CONFIG_BACKLIGHT_DA9052=3Dy
> CONFIG_BACKLIGHT_MAX8925=3Dm
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dm
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_WM831X is not set
> CONFIG_BACKLIGHT_ADP8860=3Dm
> CONFIG_BACKLIGHT_ADP8870=3Dm
> CONFIG_BACKLIGHT_PCF50633=3Dm
> CONFIG_BACKLIGHT_LM3630A=3Dm
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=3Dy
> CONFIG_BACKLIGHT_LP8788=3Dy
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dm
> # CONFIG_VGASTATE is not set
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> CONFIG_SOUND=3Dm
> CONFIG_SOUND_OSS_CORE=3Dy
> CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
> CONFIG_SND=3Dm
> CONFIG_SND_TIMER=3Dm
> CONFIG_SND_PCM=3Dm
> CONFIG_SND_PCM_ELD=3Dy
> CONFIG_SND_PCM_IEC958=3Dy
> CONFIG_SND_DMAENGINE_PCM=3Dm
> CONFIG_SND_SEQ_DEVICE=3Dm
> CONFIG_SND_RAWMIDI=3Dm
> CONFIG_SND_JACK=3Dy
> CONFIG_SND_JACK_INPUT_DEV=3Dy
> CONFIG_SND_OSSEMUL=3Dy
> # CONFIG_SND_MIXER_OSS is not set
> # CONFIG_SND_PCM_OSS is not set
> CONFIG_SND_PCM_TIMER=3Dy
> CONFIG_SND_HRTIMER=3Dm
> # CONFIG_SND_DYNAMIC_MINORS is not set
> CONFIG_SND_SUPPORT_OLD_API=3Dy
> CONFIG_SND_PROC_FS=3Dy
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> # CONFIG_SND_VERBOSE_PRINTK is not set
> CONFIG_SND_DEBUG=3Dy
> # CONFIG_SND_DEBUG_VERBOSE is not set
> # CONFIG_SND_PCM_XRUN_DEBUG is not set
> CONFIG_SND_VMASTER=3Dy
> CONFIG_SND_DMA_SGBUF=3Dy
> CONFIG_SND_SEQUENCER=3Dm
> CONFIG_SND_SEQ_DUMMY=3Dm
> # CONFIG_SND_SEQUENCER_OSS is not set
> CONFIG_SND_SEQ_HRTIMER_DEFAULT=3Dy
> CONFIG_SND_SEQ_MIDI_EVENT=3Dm
> CONFIG_SND_SEQ_MIDI=3Dm
> # CONFIG_SND_OPL3_LIB_SEQ is not set
> # CONFIG_SND_OPL4_LIB_SEQ is not set
> CONFIG_SND_AC97_CODEC=3Dm
> CONFIG_SND_DRIVERS=3Dy
> # CONFIG_SND_DUMMY is not set
> CONFIG_SND_ALOOP=3Dm
> # CONFIG_SND_VIRMIDI is not set
> CONFIG_SND_MTPAV=3Dm
> # CONFIG_SND_MTS64 is not set
> # CONFIG_SND_SERIAL_U16550 is not set
> # CONFIG_SND_MPU401 is not set
> CONFIG_SND_PORTMAN2X4=3Dm
> CONFIG_SND_AC97_POWER_SAVE=3Dy
> CONFIG_SND_AC97_POWER_SAVE_DEFAULT=3D0
> CONFIG_SND_PCI=3Dy
> # CONFIG_SND_AD1889 is not set
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
> # CONFIG_SND_EMU10K1_SEQ is not set
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
> CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> # CONFIG_SND_SPI is not set
> # CONFIG_SND_USB is not set
> CONFIG_SND_PCMCIA=3Dy
> # CONFIG_SND_VXPOCKET is not set
> CONFIG_SND_PDAUDIOCF=3Dm
> CONFIG_SND_SOC=3Dm
> CONFIG_SND_SOC_AC97_BUS=3Dy
> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> # CONFIG_SND_SOC_AMD_ACP is not set
> CONFIG_SND_ATMEL_SOC=3Dm
> # CONFIG_SND_DESIGNWARE_I2S is not set
> =

> #
> # SoC Audio for Freescale CPUs
> #
> =

> #
> # Common SoC Audio options for Freescale CPUs:
> #
> CONFIG_SND_SOC_FSL_ASRC=3Dm
> CONFIG_SND_SOC_FSL_SAI=3Dm
> CONFIG_SND_SOC_FSL_SSI=3Dm
> # CONFIG_SND_SOC_FSL_SPDIF is not set
> CONFIG_SND_SOC_FSL_ESAI=3Dm
> # CONFIG_SND_SOC_IMX_AUDMUX is not set
> CONFIG_SND_I2S_HI6210_I2S=3Dm
> CONFIG_SND_SOC_IMG=3Dy
> CONFIG_SND_SOC_IMG_I2S_IN=3Dm
> # CONFIG_SND_SOC_IMG_I2S_OUT is not set
> CONFIG_SND_SOC_IMG_PARALLEL_OUT=3Dm
> CONFIG_SND_SOC_IMG_SPDIF_IN=3Dm
> # CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
> CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=3Dm
> # CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
> =

> #
> # STMicroelectronics STM32 SOC audio support
> #
> CONFIG_SND_SOC_XTFPGA_I2S=3Dm
> # CONFIG_ZX_TDM is not set
> CONFIG_SND_SOC_I2C_AND_SPI=3Dm
> =

> #
> # CODEC drivers
> #
> CONFIG_SND_SOC_AC97_CODEC=3Dm
> CONFIG_SND_SOC_ADAU_UTILS=3Dm
> CONFIG_SND_SOC_ADAU1701=3Dm
> CONFIG_SND_SOC_ADAU17X1=3Dm
> CONFIG_SND_SOC_ADAU1761=3Dm
> CONFIG_SND_SOC_ADAU1761_I2C=3Dm
> CONFIG_SND_SOC_ADAU1761_SPI=3Dm
> # CONFIG_SND_SOC_ADAU7002 is not set
> CONFIG_SND_SOC_AK4104=3Dm
> CONFIG_SND_SOC_AK4554=3Dm
> CONFIG_SND_SOC_AK4613=3Dm
> CONFIG_SND_SOC_AK4642=3Dm
> CONFIG_SND_SOC_AK5386=3Dm
> CONFIG_SND_SOC_ALC5623=3Dm
> CONFIG_SND_SOC_BT_SCO=3Dm
> CONFIG_SND_SOC_CS35L32=3Dm
> CONFIG_SND_SOC_CS35L33=3Dm
> CONFIG_SND_SOC_CS35L34=3Dm
> CONFIG_SND_SOC_CS35L35=3Dm
> CONFIG_SND_SOC_CS42L42=3Dm
> CONFIG_SND_SOC_CS42L51=3Dm
> CONFIG_SND_SOC_CS42L51_I2C=3Dm
> # CONFIG_SND_SOC_CS42L52 is not set
> CONFIG_SND_SOC_CS42L56=3Dm
> CONFIG_SND_SOC_CS42L73=3Dm
> CONFIG_SND_SOC_CS4265=3Dm
> # CONFIG_SND_SOC_CS4270 is not set
> # CONFIG_SND_SOC_CS4271_I2C is not set
> # CONFIG_SND_SOC_CS4271_SPI is not set
> # CONFIG_SND_SOC_CS42XX8_I2C is not set
> CONFIG_SND_SOC_CS43130=3Dm
> CONFIG_SND_SOC_CS4349=3Dm
> CONFIG_SND_SOC_CS53L30=3Dm
> # CONFIG_SND_SOC_DIO2125 is not set
> CONFIG_SND_SOC_HDMI_CODEC=3Dm
> CONFIG_SND_SOC_ES7134=3Dm
> CONFIG_SND_SOC_ES8316=3Dm
> CONFIG_SND_SOC_ES8328=3Dm
> CONFIG_SND_SOC_ES8328_I2C=3Dm
> # CONFIG_SND_SOC_ES8328_SPI is not set
> CONFIG_SND_SOC_GTM601=3Dm
> CONFIG_SND_SOC_INNO_RK3036=3Dm
> CONFIG_SND_SOC_MAX98504=3Dm
> CONFIG_SND_SOC_MAX98927=3Dm
> CONFIG_SND_SOC_MAX98373=3Dm
> # CONFIG_SND_SOC_MAX9860 is not set
> # CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
> CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dm
> # CONFIG_SND_SOC_PCM1681 is not set
> CONFIG_SND_SOC_PCM179X=3Dm
> # CONFIG_SND_SOC_PCM179X_I2C is not set
> CONFIG_SND_SOC_PCM179X_SPI=3Dm
> CONFIG_SND_SOC_PCM186X=3Dm
> CONFIG_SND_SOC_PCM186X_I2C=3Dm
> CONFIG_SND_SOC_PCM186X_SPI=3Dm
> CONFIG_SND_SOC_PCM3168A=3Dm
> CONFIG_SND_SOC_PCM3168A_I2C=3Dm
> CONFIG_SND_SOC_PCM3168A_SPI=3Dm
> CONFIG_SND_SOC_PCM512x=3Dm
> # CONFIG_SND_SOC_PCM512x_I2C is not set
> CONFIG_SND_SOC_PCM512x_SPI=3Dm
> CONFIG_SND_SOC_RL6231=3Dm
> # CONFIG_SND_SOC_RT5514_SPI_BUILTIN is not set
> CONFIG_SND_SOC_RT5616=3Dm
> # CONFIG_SND_SOC_RT5631 is not set
> # CONFIG_SND_SOC_RT5677_SPI is not set
> CONFIG_SND_SOC_SGTL5000=3Dm
> CONFIG_SND_SOC_SIGMADSP=3Dm
> CONFIG_SND_SOC_SIGMADSP_I2C=3Dm
> CONFIG_SND_SOC_SIGMADSP_REGMAP=3Dm
> CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dm
> CONFIG_SND_SOC_SPDIF=3Dm
> CONFIG_SND_SOC_SSM2602=3Dm
> # CONFIG_SND_SOC_SSM2602_SPI is not set
> CONFIG_SND_SOC_SSM2602_I2C=3Dm
> CONFIG_SND_SOC_SSM4567=3Dm
> CONFIG_SND_SOC_STA32X=3Dm
> CONFIG_SND_SOC_STA350=3Dm
> CONFIG_SND_SOC_STI_SAS=3Dm
> CONFIG_SND_SOC_TAS2552=3Dm
> CONFIG_SND_SOC_TAS5086=3Dm
> CONFIG_SND_SOC_TAS571X=3Dm
> # CONFIG_SND_SOC_TAS5720 is not set
> CONFIG_SND_SOC_TAS6424=3Dm
> CONFIG_SND_SOC_TFA9879=3Dm
> # CONFIG_SND_SOC_TLV320AIC23_I2C is not set
> # CONFIG_SND_SOC_TLV320AIC23_SPI is not set
> # CONFIG_SND_SOC_TLV320AIC31XX is not set
> CONFIG_SND_SOC_TLV320AIC32X4=3Dm
> CONFIG_SND_SOC_TLV320AIC32X4_I2C=3Dm
> CONFIG_SND_SOC_TLV320AIC32X4_SPI=3Dm
> CONFIG_SND_SOC_TLV320AIC3X=3Dm
> # CONFIG_SND_SOC_TS3A227E is not set
> CONFIG_SND_SOC_TSCS42XX=3Dm
> # CONFIG_SND_SOC_WM8510 is not set
> # CONFIG_SND_SOC_WM8523 is not set
> CONFIG_SND_SOC_WM8524=3Dm
> CONFIG_SND_SOC_WM8580=3Dm
> # CONFIG_SND_SOC_WM8711 is not set
> CONFIG_SND_SOC_WM8728=3Dm
> CONFIG_SND_SOC_WM8731=3Dm
> CONFIG_SND_SOC_WM8737=3Dm
> CONFIG_SND_SOC_WM8741=3Dm
> CONFIG_SND_SOC_WM8750=3Dm
> CONFIG_SND_SOC_WM8753=3Dm
> # CONFIG_SND_SOC_WM8770 is not set
> CONFIG_SND_SOC_WM8776=3Dm
> CONFIG_SND_SOC_WM8804=3Dm
> # CONFIG_SND_SOC_WM8804_I2C is not set
> CONFIG_SND_SOC_WM8804_SPI=3Dm
> CONFIG_SND_SOC_WM8903=3Dm
> CONFIG_SND_SOC_WM8960=3Dm
> CONFIG_SND_SOC_WM8962=3Dm
> CONFIG_SND_SOC_WM8974=3Dm
> CONFIG_SND_SOC_WM8978=3Dm
> CONFIG_SND_SOC_WM8985=3Dm
> CONFIG_SND_SOC_ZX_AUD96P22=3Dm
> CONFIG_SND_SOC_NAU8540=3Dm
> # CONFIG_SND_SOC_NAU8810 is not set
> CONFIG_SND_SOC_NAU8824=3Dm
> CONFIG_SND_SOC_TPA6130A2=3Dm
> # CONFIG_SND_SIMPLE_CARD is not set
> # CONFIG_SND_X86 is not set
> CONFIG_AC97_BUS=3Dm
> =

> #
> # HID support
> #
> CONFIG_HID=3Dm
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dm
> CONFIG_HID_GENERIC=3Dm
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> # CONFIG_HID_ACRUX is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_ASUS is not set
> CONFIG_HID_AUREAL=3Dm
> CONFIG_HID_BELKIN=3Dm
> CONFIG_HID_CHERRY=3Dm
> # CONFIG_HID_CHICONY is not set
> CONFIG_HID_CORSAIR=3Dm
> CONFIG_HID_PRODIKEYS=3Dm
> CONFIG_HID_CMEDIA=3Dm
> # CONFIG_HID_CYPRESS is not set
> CONFIG_HID_DRAGONRISE=3Dm
> # CONFIG_DRAGONRISE_FF is not set
> CONFIG_HID_EMS_FF=3Dm
> CONFIG_HID_ELECOM=3Dm
> CONFIG_HID_EZKEY=3Dm
> CONFIG_HID_GEMBIRD=3Dm
> CONFIG_HID_GFRM=3Dm
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> # CONFIG_HID_WALTOP is not set
> CONFIG_HID_GYRATION=3Dm
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_ITE=3Dm
> CONFIG_HID_JABRA=3Dm
> CONFIG_HID_TWINHAN=3Dm
> CONFIG_HID_KENSINGTON=3Dm
> CONFIG_HID_LCPOWER=3Dm
> CONFIG_HID_LED=3Dm
> CONFIG_HID_LENOVO=3Dm
> CONFIG_HID_LOGITECH=3Dm
> CONFIG_HID_LOGITECH_HIDPP=3Dm
> CONFIG_LOGITECH_FF=3Dy
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> CONFIG_LOGIWHEELS_FF=3Dy
> CONFIG_HID_MAGICMOUSE=3Dm
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> CONFIG_HID_MULTITOUCH=3Dm
> CONFIG_HID_NTI=3Dm
> CONFIG_HID_ORTEK=3Dm
> CONFIG_HID_PANTHERLORD=3Dm
> CONFIG_PANTHERLORD_FF=3Dy
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
> CONFIG_HID_PICOLCD_LCD=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> CONFIG_HID_PRIMAX=3Dm
> # CONFIG_HID_SAITEK is not set
> CONFIG_HID_SAMSUNG=3Dm
> # CONFIG_HID_SPEEDLINK is not set
> # CONFIG_HID_STEELSERIES is not set
> CONFIG_HID_SUNPLUS=3Dm
> CONFIG_HID_RMI=3Dm
> CONFIG_HID_GREENASIA=3Dm
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dm
> CONFIG_HID_TOPSEED=3Dm
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_UDRAW_PS3=3Dm
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dm
> CONFIG_HID_SENSOR_HUB=3Dm
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> # CONFIG_HID_ALPS is not set
> =

> #
> # USB HID support
> #
> # CONFIG_USB_HID is not set
> # CONFIG_HID_PID is not set
> =

> #
> # USB HID Boot Protocol drivers
> #
> CONFIG_USB_KBD=3Dy
> CONFIG_USB_MOUSE=3Dm
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dm
> =

> #
> # Intel ISH HID support
> #
> # CONFIG_INTEL_ISH_HID is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_PCI=3Dy
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> =

> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> # CONFIG_USB_DYNAMIC_MINORS is not set
> CONFIG_USB_OTG_WHITELIST=3Dy
> CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
> CONFIG_USB_MON=3Dy
> CONFIG_USB_WUSB_CBAF=3Dm
> CONFIG_USB_WUSB_CBAF_DEBUG=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dm
> CONFIG_USB_XHCI_HCD=3Dy
> CONFIG_USB_XHCI_DBGCAP=3Dy
> CONFIG_USB_XHCI_PCI=3Dy
> CONFIG_USB_XHCI_PLATFORM=3Dm
> # CONFIG_USB_EHCI_HCD is not set
> CONFIG_USB_OXU210HP_HCD=3Dm
> CONFIG_USB_ISP116X_HCD=3Dm
> CONFIG_USB_ISP1362_HCD=3Dm
> # CONFIG_USB_FOTG210_HCD is not set
> CONFIG_USB_MAX3421_HCD=3Dy
> CONFIG_USB_OHCI_HCD=3Dm
> CONFIG_USB_OHCI_HCD_PCI=3Dm
> CONFIG_USB_OHCI_HCD_PLATFORM=3Dm
> # CONFIG_USB_UHCI_HCD is not set
> CONFIG_USB_U132_HCD=3Dm
> CONFIG_USB_SL811_HCD=3Dy
> # CONFIG_USB_SL811_HCD_ISO is not set
> CONFIG_USB_SL811_CS=3Dm
> CONFIG_USB_R8A66597_HCD=3Dy
> CONFIG_USB_HCD_BCMA=3Dm
> CONFIG_USB_HCD_TEST_MODE=3Dy
> =

> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dy
> # CONFIG_USB_PRINTER is not set
> CONFIG_USB_WDM=3Dm
> CONFIG_USB_TMC=3Dy
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> =

> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=3Dy
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_MUSB_HDRC is not set
> CONFIG_USB_DWC3=3Dm
> CONFIG_USB_DWC3_ULPI=3Dy
> CONFIG_USB_DWC3_HOST=3Dy
> =

> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_PCI=3Dm
> CONFIG_USB_DWC2=3Dm
> CONFIG_USB_DWC2_HOST=3Dy
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> # CONFIG_USB_DWC2_PCI is not set
> # CONFIG_USB_DWC2_DEBUG is not set
> CONFIG_USB_DWC2_TRACK_MISSED_SOFS=3Dy
> # CONFIG_USB_ISP1760 is not set
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> # CONFIG_USB_SERIAL is not set
> =

> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dm
> CONFIG_USB_EMI26=3Dy
> CONFIG_USB_ADUTUX=3Dy
> CONFIG_USB_SEVSEG=3Dm
> # CONFIG_USB_RIO500 is not set
> CONFIG_USB_LEGOTOWER=3Dy
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> CONFIG_USB_CYTHERM=3Dm
> CONFIG_USB_IDMOUSE=3Dy
> CONFIG_USB_FTDI_ELAN=3Dm
> CONFIG_USB_APPLEDISPLAY=3Dy
> # CONFIG_USB_LD is not set
> CONFIG_USB_TRANCEVIBRATOR=3Dm
> CONFIG_USB_IOWARRIOR=3Dm
> CONFIG_USB_TEST=3Dy
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dm
> # CONFIG_USB_ISIGHTFW is not set
> CONFIG_USB_YUREX=3Dy
> # CONFIG_USB_EZUSB_FX2 is not set
> CONFIG_USB_HUB_USB251XB=3Dy
> # CONFIG_USB_HSIC_USB3503 is not set
> CONFIG_USB_HSIC_USB4604=3Dm
> CONFIG_USB_LINK_LAYER_TEST=3Dm
> CONFIG_USB_CHAOSKEY=3Dm
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> # CONFIG_USB_GPIO_VBUS is not set
> CONFIG_USB_ISP1301=3Dm
> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=3Dy
> CONFIG_TYPEC_TCPM=3Dm
> CONFIG_TYPEC_FUSB302=3Dm
> # CONFIG_TYPEC_UCSI is not set
> CONFIG_TYPEC_TPS6598X=3Dy
> CONFIG_USB_ULPI_BUS=3Dm
> # CONFIG_UWB is not set
> CONFIG_MMC=3Dy
> CONFIG_SDIO_UART=3Dm
> CONFIG_MMC_TEST=3Dm
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_SDHCI is not set
> # CONFIG_MMC_TIFM_SD is not set
> CONFIG_MMC_GOLDFISH=3Dy
> # CONFIG_MMC_SPI is not set
> # CONFIG_MMC_SDRICOH_CS is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_VUB300=3Dm
> CONFIG_MMC_USHC=3Dy
> CONFIG_MMC_USDHI6ROL0=3Dm
> CONFIG_MMC_REALTEK_USB=3Dm
> # CONFIG_MMC_CQHCI is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_MEMSTICK_REALTEK_USB=3Dm
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dm
> CONFIG_LEDS_CLASS_FLASH=3Dm
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_AS3645A=3Dm
> # CONFIG_LEDS_LM3530 is not set
> CONFIG_LEDS_LM3533=3Dm
> CONFIG_LEDS_LM3642=3Dm
> # CONFIG_LEDS_MT6323 is not set
> CONFIG_LEDS_PCA9532=3Dm
> # CONFIG_LEDS_PCA9532_GPIO is not set
> CONFIG_LEDS_GPIO=3Dm
> CONFIG_LEDS_LP3944=3Dm
> CONFIG_LEDS_LP3952=3Dm
> CONFIG_LEDS_LP55XX_COMMON=3Dm
> CONFIG_LEDS_LP5521=3Dm
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=3Dm
> CONFIG_LEDS_LP8501=3Dm
> CONFIG_LEDS_LP8788=3Dm
> # CONFIG_LEDS_PCA955X is not set
> CONFIG_LEDS_PCA963X=3Dm
> CONFIG_LEDS_WM831X_STATUS=3Dm
> # CONFIG_LEDS_DA9052 is not set
> CONFIG_LEDS_DAC124S085=3Dm
> # CONFIG_LEDS_PWM is not set
> CONFIG_LEDS_REGULATOR=3Dm
> CONFIG_LEDS_BD2802=3Dm
> # CONFIG_LEDS_LT3593 is not set
> # CONFIG_LEDS_MC13783 is not set
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=3Dm
> CONFIG_LEDS_MAX8997=3Dm
> CONFIG_LEDS_LM355x=3Dm
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> CONFIG_LEDS_USER=3Dm
> # CONFIG_LEDS_NIC78BX is not set
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> CONFIG_DMADEVICES=3Dy
> CONFIG_DMADEVICES_DEBUG=3Dy
> # CONFIG_DMADEVICES_VDEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dm
> CONFIG_DMA_ACPI=3Dy
> # CONFIG_ALTERA_MSGDMA is not set
> CONFIG_INTEL_IDMA64=3Dm
> # CONFIG_INTEL_IOATDMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> CONFIG_QCOM_HIDMA=3Dm
> CONFIG_DW_DMAC_CORE=3Dm
> CONFIG_DW_DMAC=3Dm
> # CONFIG_DW_DMAC_PCI is not set
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dm
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_HD44780=3Dy
> # CONFIG_KS0108 is not set
> CONFIG_IMG_ASCII_LCD=3Dy
> CONFIG_PANEL=3Dm
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> CONFIG_UIO=3Dm
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> CONFIG_UIO_DMEM_GENIRQ=3Dm
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> CONFIG_VIRT_DRIVERS=3Dy
> # CONFIG_VBOXGUEST is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> # CONFIG_VIRTIO_INPUT is not set
> CONFIG_VIRTIO_MMIO=3Dm
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # CONFIG_HYPERV_TSCPAGE is not set
> CONFIG_STAGING=3Dy
> # CONFIG_IRDA is not set
> # CONFIG_IPX is not set
> # CONFIG_NCP_FS is not set
> CONFIG_COMEDI=3Dy
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> CONFIG_COMEDI_MISC_DRIVERS=3Dy
> CONFIG_COMEDI_BOND=3Dy
> # CONFIG_COMEDI_TEST is not set
> CONFIG_COMEDI_PARPORT=3Dy
> # CONFIG_COMEDI_SERIAL2002 is not set
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> CONFIG_COMEDI_PCL711=3Dy
> CONFIG_COMEDI_PCL724=3Dm
> # CONFIG_COMEDI_PCL726 is not set
> CONFIG_COMEDI_PCL730=3Dm
> CONFIG_COMEDI_PCL812=3Dm
> # CONFIG_COMEDI_PCL816 is not set
> CONFIG_COMEDI_PCL818=3Dm
> # CONFIG_COMEDI_PCM3724 is not set
> CONFIG_COMEDI_AMPLC_DIO200_ISA=3Dy
> # CONFIG_COMEDI_AMPLC_PC236_ISA is not set
> CONFIG_COMEDI_AMPLC_PC263_ISA=3Dm
> # CONFIG_COMEDI_RTI800 is not set
> # CONFIG_COMEDI_RTI802 is not set
> CONFIG_COMEDI_DAC02=3Dy
> # CONFIG_COMEDI_DAS16M1 is not set
> # CONFIG_COMEDI_DAS08_ISA is not set
> CONFIG_COMEDI_DAS16=3Dm
> CONFIG_COMEDI_DAS800=3Dm
> CONFIG_COMEDI_DAS1800=3Dy
> CONFIG_COMEDI_DAS6402=3Dm
> # CONFIG_COMEDI_DT2801 is not set
> CONFIG_COMEDI_DT2811=3Dm
> # CONFIG_COMEDI_DT2814 is not set
> CONFIG_COMEDI_DT2815=3Dm
> CONFIG_COMEDI_DT2817=3Dy
> # CONFIG_COMEDI_DT282X is not set
> CONFIG_COMEDI_DMM32AT=3Dm
> # CONFIG_COMEDI_FL512 is not set
> CONFIG_COMEDI_AIO_AIO12_8=3Dy
> CONFIG_COMEDI_AIO_IIRO_16=3Dy
> CONFIG_COMEDI_II_PCI20KC=3Dm
> # CONFIG_COMEDI_C6XDIGIO is not set
> CONFIG_COMEDI_MPC624=3Dm
> CONFIG_COMEDI_ADQ12B=3Dy
> CONFIG_COMEDI_NI_AT_A2150=3Dm
> CONFIG_COMEDI_NI_AT_AO=3Dm
> # CONFIG_COMEDI_NI_ATMIO is not set
> # CONFIG_COMEDI_NI_ATMIO16D is not set
> CONFIG_COMEDI_NI_LABPC_ISA=3Dm
> # CONFIG_COMEDI_PCMAD is not set
> CONFIG_COMEDI_PCMDA12=3Dm
> CONFIG_COMEDI_PCMMIO=3Dm
> CONFIG_COMEDI_PCMUIO=3Dm
> CONFIG_COMEDI_MULTIQ3=3Dy
> CONFIG_COMEDI_S526=3Dy
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> # CONFIG_COMEDI_PCMCIA_DRIVERS is not set
> # CONFIG_COMEDI_USB_DRIVERS is not set
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dm
> CONFIG_COMEDI_KCOMEDILIB=3Dy
> CONFIG_COMEDI_AMPLC_DIO200=3Dy
> CONFIG_COMEDI_NI_LABPC=3Dm
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_R8712U is not set
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> CONFIG_ADIS16201=3Dm
> CONFIG_ADIS16203=3Dy
> CONFIG_ADIS16209=3Dy
> CONFIG_ADIS16240=3Dm
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD7606=3Dy
> # CONFIG_AD7606_IFACE_PARALLEL is not set
> CONFIG_AD7606_IFACE_SPI=3Dm
> # CONFIG_AD7780 is not set
> # CONFIG_AD7816 is not set
> # CONFIG_AD7192 is not set
> CONFIG_AD7280=3Dm
> =

> #
> # Analog digital bi-direction converters
> #
> CONFIG_ADT7316=3Dm
> CONFIG_ADT7316_SPI=3Dm
> CONFIG_ADT7316_I2C=3Dm
> =

> #
> # Capacitance to digital converters
> #
> # CONFIG_AD7150 is not set
> CONFIG_AD7152=3Dm
> # CONFIG_AD7746 is not set
> =

> #
> # Direct Digital Synthesis
> #
> CONFIG_AD9832=3Dy
> CONFIG_AD9834=3Dy
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16060=3Dm
> =

> #
> # Network Analyzer, Impedance Converters
> #
> CONFIG_AD5933=3Dm
> =

> #
> # Light sensors
> #
> CONFIG_TSL2x7x=3Dy
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7753=3Dm
> CONFIG_ADE7754=3Dm
> # CONFIG_ADE7758 is not set
> # CONFIG_ADE7759 is not set
> # CONFIG_ADE7854 is not set
> =

> #
> # Resolver to digital converters
> #
> # CONFIG_AD2S90 is not set
> CONFIG_AD2S1200=3Dm
> # CONFIG_AD2S1210 is not set
> =

> #
> # Triggers - standalone
> #
> # CONFIG_FB_SM750 is not set
> # CONFIG_FB_XGI is not set
> =

> #
> # Speakup console speech
> #
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> # CONFIG_LTE_GDM724X is not set
> CONFIG_GOLDFISH_AUDIO=3Dm
> # CONFIG_MTD_GOLDFISH_NAND is not set
> CONFIG_MTD_SPINAND_MT29F=3Dm
> # CONFIG_MTD_SPINAND_ONDIEECC is not set
> # CONFIG_LNET is not set
> # CONFIG_DGNC is not set
> # CONFIG_GS_FPGABOOT is not set
> # CONFIG_CRYPTO_SKEIN is not set
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_FB_TFT is not set
> CONFIG_MOST=3Dy
> # CONFIG_MOST_CDEV is not set
> # CONFIG_MOST_NET is not set
> # CONFIG_MOST_SOUND is not set
> # CONFIG_MOST_DIM2 is not set
> CONFIG_MOST_I2C=3Dy
> # CONFIG_MOST_USB is not set
> # CONFIG_KS7010 is not set
> CONFIG_GREYBUS=3Dy
> # CONFIG_GREYBUS_ES2 is not set
> # CONFIG_GREYBUS_AUDIO is not set
> CONFIG_GREYBUS_BOOTROM=3Dy
> # CONFIG_GREYBUS_FIRMWARE is not set
> CONFIG_GREYBUS_HID=3Dm
> CONFIG_GREYBUS_LIGHT=3Dm
> # CONFIG_GREYBUS_LOG is not set
> CONFIG_GREYBUS_LOOPBACK=3Dy
> CONFIG_GREYBUS_POWER=3Dm
> CONFIG_GREYBUS_RAW=3Dy
> CONFIG_GREYBUS_VIBRATOR=3Dy
> CONFIG_GREYBUS_BRIDGED_PHY=3Dy
> CONFIG_GREYBUS_GPIO=3Dy
> CONFIG_GREYBUS_I2C=3Dm
> CONFIG_GREYBUS_PWM=3Dy
> CONFIG_GREYBUS_SDIO=3Dy
> CONFIG_GREYBUS_SPI=3Dm
> CONFIG_GREYBUS_UART=3Dy
> CONFIG_GREYBUS_USB=3Dy
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> CONFIG_TYPEC_TCPCI=3Dm
> # CONFIG_DRM_VBOXVIDEO is not set
> # CONFIG_PI433 is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_GOLDFISH_BUS is not set
> CONFIG_GOLDFISH_PIPE=3Dm
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> # CONFIG_CROS_EC_LPC is not set
> CONFIG_CROS_EC_PROTO=3Dy
> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> # CONFIG_COMMON_CLK_WM831X is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> # CONFIG_COMMON_CLK_NXP is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_COMMON_CLK_PXA is not set
> # CONFIG_COMMON_CLK_PIC32 is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dm
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> # CONFIG_RPMSG_CHAR is not set
> CONFIG_RPMSG_VIRTIO=3Dy
> CONFIG_SOUNDWIRE=3Dy
> =

> #
> # SoundWire Devices
> #
> # CONFIG_SOUNDWIRE_INTEL is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> =

> #
> # Broadcom SoC drivers
> #
> =

> #
> # i.MX SoC drivers
> #
> =

> #
> # Qualcomm SoC drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> CONFIG_XILINX_VCU=3Dm
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dm
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dm
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dm
> # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> =

> #
> # DEVFREQ Drivers
> #
> # CONFIG_PM_DEVFREQ_EVENT is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> CONFIG_EXTCON_ARIZONA=3Dm
> CONFIG_EXTCON_AXP288=3Dm
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> # CONFIG_EXTCON_MAX14577 is not set
> # CONFIG_EXTCON_MAX3355 is not set
> CONFIG_EXTCON_MAX77843=3Dm
> CONFIG_EXTCON_MAX8997=3Dy
> # CONFIG_EXTCON_RT8973A is not set
> CONFIG_EXTCON_SM5502=3Dm
> # CONFIG_EXTCON_USB_GPIO is not set
> # CONFIG_EXTCON_USBC_CROS_EC is not set
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dm
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> CONFIG_IIO_SW_TRIGGER=3Dy
> CONFIG_IIO_TRIGGERED_EVENT=3Dm
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dm
> # CONFIG_BMA220 is not set
> CONFIG_BMC150_ACCEL=3Dm
> CONFIG_BMC150_ACCEL_I2C=3Dm
> CONFIG_BMC150_ACCEL_SPI=3Dm
> CONFIG_DA280=3Dy
> # CONFIG_DA311 is not set
> # CONFIG_DMARD09 is not set
> # CONFIG_DMARD10 is not set
> CONFIG_HID_SENSOR_ACCEL_3D=3Dm
> # CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> CONFIG_KXSD9=3Dy
> CONFIG_KXSD9_SPI=3Dy
> # CONFIG_KXSD9_I2C is not set
> # CONFIG_KXCJK1013 is not set
> # CONFIG_MC3230 is not set
> CONFIG_MMA7455=3Dy
> CONFIG_MMA7455_I2C=3Dm
> CONFIG_MMA7455_SPI=3Dy
> CONFIG_MMA7660=3Dm
> CONFIG_MMA8452=3Dm
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dm
> CONFIG_MMA9553=3Dy
> CONFIG_MXC4005=3Dy
> CONFIG_MXC6255=3Dm
> CONFIG_SCA3000=3Dy
> CONFIG_STK8312=3Dy
> CONFIG_STK8BA50=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> CONFIG_AD7266=3Dy
> CONFIG_AD7291=3Dm
> CONFIG_AD7298=3Dm
> CONFIG_AD7476=3Dm
> CONFIG_AD7766=3Dy
> # CONFIG_AD7791 is not set
> CONFIG_AD7793=3Dy
> # CONFIG_AD7887 is not set
> CONFIG_AD7923=3Dy
> CONFIG_AD799X=3Dm
> # CONFIG_AXP20X_ADC is not set
> CONFIG_AXP288_ADC=3Dm
> # CONFIG_CC10001_ADC is not set
> # CONFIG_DLN2_ADC is not set
> CONFIG_HI8435=3Dm
> CONFIG_HX711=3Dy
> # CONFIG_INA2XX_ADC is not set
> CONFIG_LP8788_ADC=3Dy
> CONFIG_LTC2471=3Dy
> CONFIG_LTC2485=3Dm
> # CONFIG_LTC2497 is not set
> CONFIG_MAX1027=3Dy
> CONFIG_MAX11100=3Dm
> CONFIG_MAX1118=3Dy
> CONFIG_MAX1363=3Dy
> CONFIG_MAX9611=3Dm
> CONFIG_MCP320X=3Dm
> CONFIG_MCP3422=3Dm
> CONFIG_MEN_Z188_ADC=3Dy
> # CONFIG_NAU7802 is not set
> CONFIG_QCOM_VADC_COMMON=3Dm
> CONFIG_QCOM_SPMI_IADC=3Dy
> CONFIG_QCOM_SPMI_VADC=3Dm
> CONFIG_TI_ADC081C=3Dy
> # CONFIG_TI_ADC0832 is not set
> CONFIG_TI_ADC084S021=3Dm
> CONFIG_TI_ADC12138=3Dy
> # CONFIG_TI_ADC108S102 is not set
> CONFIG_TI_ADC128S052=3Dm
> CONFIG_TI_ADC161S626=3Dm
> CONFIG_TI_ADS1015=3Dy
> # CONFIG_TI_ADS7950 is not set
> # CONFIG_TI_AM335X_ADC is not set
> CONFIG_TI_TLC4541=3Dy
> CONFIG_VIPERBOARD_ADC=3Dm
> =

> #
> # Amplifiers
> #
> CONFIG_AD8366=3Dy
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dm
> CONFIG_CCS811=3Dy
> # CONFIG_IAQCORE is not set
> # CONFIG_VZ89X is not set
> CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dy
> CONFIG_IIO_CROS_EC_SENSORS=3Dy
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dm
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dm
> CONFIG_IIO_MS_SENSORS_I2C=3Dm
> =

> #
> # SSP Sensor Common
> #
> CONFIG_IIO_SSP_SENSORS_COMMONS=3Dy
> CONFIG_IIO_SSP_SENSORHUB=3Dy
> CONFIG_IIO_ST_SENSORS_I2C=3Dm
> CONFIG_IIO_ST_SENSORS_SPI=3Dm
> CONFIG_IIO_ST_SENSORS_CORE=3Dm
> =

> #
> # Counters
> #
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dm
> CONFIG_AD5360=3Dm
> CONFIG_AD5380=3Dm
> CONFIG_AD5421=3Dy
> CONFIG_AD5446=3Dm
> # CONFIG_AD5449 is not set
> CONFIG_AD5592R_BASE=3Dy
> CONFIG_AD5592R=3Dy
> CONFIG_AD5593R=3Dy
> CONFIG_AD5504=3Dm
> CONFIG_AD5624R_SPI=3Dy
> CONFIG_LTC2632=3Dm
> CONFIG_AD5686=3Dm
> CONFIG_AD5755=3Dm
> CONFIG_AD5761=3Dm
> # CONFIG_AD5764 is not set
> CONFIG_AD5791=3Dm
> # CONFIG_AD7303 is not set
> # CONFIG_CIO_DAC is not set
> # CONFIG_AD8801 is not set
> CONFIG_DS4424=3Dm
> # CONFIG_M62332 is not set
> CONFIG_MAX517=3Dm
> CONFIG_MCP4725=3Dm
> CONFIG_MCP4922=3Dy
> # CONFIG_TI_DAC082S085 is not set
> =

> #
> # IIO dummy driver
> #
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> CONFIG_AD9523=3Dy
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # CONFIG_ADF4350 is not set
> =

> #
> # Digital gyroscope sensors
> #
> # CONFIG_ADIS16080 is not set
> CONFIG_ADIS16130=3Dm
> CONFIG_ADIS16136=3Dy
> CONFIG_ADIS16260=3Dm
> CONFIG_ADXRS450=3Dy
> CONFIG_BMG160=3Dy
> CONFIG_BMG160_I2C=3Dy
> CONFIG_BMG160_SPI=3Dy
> # CONFIG_HID_SENSOR_GYRO_3D is not set
> CONFIG_MPU3050=3Dy
> CONFIG_MPU3050_I2C=3Dy
> # CONFIG_IIO_ST_GYRO_3AXIS is not set
> CONFIG_ITG3200=3Dm
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> # CONFIG_AFE4403 is not set
> CONFIG_AFE4404=3Dy
> CONFIG_MAX30100=3Dy
> CONFIG_MAX30102=3Dy
> =

> #
> # Humidity sensors
> #
> CONFIG_AM2315=3Dm
> CONFIG_DHT11=3Dm
> CONFIG_HDC100X=3Dy
> CONFIG_HID_SENSOR_HUMIDITY=3Dm
> CONFIG_HTS221=3Dm
> CONFIG_HTS221_I2C=3Dm
> CONFIG_HTS221_SPI=3Dm
> CONFIG_HTU21=3Dm
> CONFIG_SI7005=3Dy
> CONFIG_SI7020=3Dy
> =

> #
> # Inertial measurement units
> #
> CONFIG_ADIS16400=3Dy
> CONFIG_ADIS16480=3Dm
> CONFIG_BMI160=3Dy
> CONFIG_BMI160_I2C=3Dm
> CONFIG_BMI160_SPI=3Dy
> # CONFIG_KMX61 is not set
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_INV_MPU6050_I2C=3Dy
> CONFIG_INV_MPU6050_SPI=3Dy
> CONFIG_IIO_ST_LSM6DSX=3Dm
> CONFIG_IIO_ST_LSM6DSX_I2C=3Dm
> CONFIG_IIO_ST_LSM6DSX_SPI=3Dm
> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> # CONFIG_ADJD_S311 is not set
> CONFIG_AL3320A=3Dy
> # CONFIG_APDS9300 is not set
> # CONFIG_APDS9960 is not set
> CONFIG_BH1750=3Dy
> CONFIG_BH1780=3Dy
> CONFIG_CM32181=3Dy
> # CONFIG_CM3232 is not set
> # CONFIG_CM3323 is not set
> CONFIG_CM36651=3Dy
> # CONFIG_IIO_CROS_EC_LIGHT_PROX is not set
> # CONFIG_GP2AP020A00F is not set
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=3Dy
> CONFIG_ISL29125=3Dy
> # CONFIG_HID_SENSOR_ALS is not set
> CONFIG_HID_SENSOR_PROX=3Dm
> CONFIG_JSA1212=3Dm
> # CONFIG_RPR0521 is not set
> CONFIG_SENSORS_LM3533=3Dy
> CONFIG_LTR501=3Dy
> # CONFIG_MAX44000 is not set
> # CONFIG_OPT3001 is not set
> CONFIG_PA12203001=3Dy
> CONFIG_SI1145=3Dm
> CONFIG_STK3310=3Dm
> CONFIG_ST_UVIS25=3Dm
> CONFIG_ST_UVIS25_I2C=3Dm
> CONFIG_ST_UVIS25_SPI=3Dm
> # CONFIG_TCS3414 is not set
> # CONFIG_TCS3472 is not set
> # CONFIG_SENSORS_TSL2563 is not set
> CONFIG_TSL2583=3Dm
> CONFIG_TSL4531=3Dm
> CONFIG_US5182D=3Dm
> CONFIG_VCNL4000=3Dm
> # CONFIG_VEML6070 is not set
> # CONFIG_VL6180 is not set
> CONFIG_ZOPT2201=3Dm
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> CONFIG_AK09911=3Dy
> CONFIG_BMC150_MAGN=3Dy
> # CONFIG_BMC150_MAGN_I2C is not set
> CONFIG_BMC150_MAGN_SPI=3Dy
> CONFIG_MAG3110=3Dy
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dm
> CONFIG_MMC35240=3Dy
> # CONFIG_IIO_ST_MAGN_3AXIS is not set
> CONFIG_SENSORS_HMC5843=3Dy
> # CONFIG_SENSORS_HMC5843_I2C is not set
> CONFIG_SENSORS_HMC5843_SPI=3Dy
> =

> #
> # Multiplexers
> #
> =

> #
> # Inclinometer sensors
> #
> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dm
> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dm
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dm
> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
> CONFIG_IIO_SYSFS_TRIGGER=3Dm
> =

> #
> # Digital potentiometers
> #
> CONFIG_DS1803=3Dm
> CONFIG_MAX5481=3Dm
> # CONFIG_MAX5487 is not set
> CONFIG_MCP4131=3Dy
> # CONFIG_MCP4531 is not set
> # CONFIG_TPL0102 is not set
> =

> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=3Dy
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dy
> # CONFIG_BMP280 is not set
> # CONFIG_IIO_CROS_EC_BARO is not set
> # CONFIG_HID_SENSOR_PRESS is not set
> CONFIG_HP03=3Dm
> CONFIG_MPL115=3Dy
> CONFIG_MPL115_I2C=3Dy
> # CONFIG_MPL115_SPI is not set
> CONFIG_MPL3115=3Dy
> # CONFIG_MS5611 is not set
> # CONFIG_MS5637 is not set
> CONFIG_IIO_ST_PRESS=3Dm
> CONFIG_IIO_ST_PRESS_I2C=3Dm
> CONFIG_IIO_ST_PRESS_SPI=3Dm
> # CONFIG_T5403 is not set
> CONFIG_HP206C=3Dm
> CONFIG_ZPA2326=3Dm
> CONFIG_ZPA2326_I2C=3Dm
> CONFIG_ZPA2326_SPI=3Dm
> =

> #
> # Lightning sensors
> #
> CONFIG_AS3935=3Dm
> =

> #
> # Proximity and distance sensors
> #
> # CONFIG_LIDAR_LITE_V2 is not set
> # CONFIG_RFD77402 is not set
> CONFIG_SRF04=3Dm
> CONFIG_SX9500=3Dm
> CONFIG_SRF08=3Dm
> =

> #
> # Temperature sensors
> #
> # CONFIG_MAXIM_THERMOCOUPLE is not set
> CONFIG_HID_SENSOR_TEMP=3Dm
> CONFIG_MLX90614=3Dy
> CONFIG_TMP006=3Dm
> # CONFIG_TMP007 is not set
> CONFIG_TSYS01=3Dm
> # CONFIG_TSYS02D is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_CROS_EC=3Dm
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dy
> =

> #
> # IRQ chip support
> #
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_ARM_GIC_V3_ITS is not set
> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> CONFIG_FMC=3Dm
> CONFIG_FMC_FAKEDEV=3Dm
> # CONFIG_FMC_TRIVIAL is not set
> CONFIG_FMC_WRITE_EEPROM=3Dm
> # CONFIG_FMC_CHARDEV is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dm
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> CONFIG_PHY_CPCAP_USB=3Dm
> CONFIG_PHY_QCOM_USB_HS=3Dm
> CONFIG_PHY_QCOM_USB_HSIC=3Dm
> CONFIG_PHY_SAMSUNG_USB2=3Dm
> # CONFIG_PHY_EXYNOS4210_USB2 is not set
> # CONFIG_PHY_EXYNOS4X12_USB2 is not set
> # CONFIG_PHY_EXYNOS5250_USB2 is not set
> CONFIG_PHY_TUSB1210=3Dm
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> # CONFIG_MCB_LPC is not set
> =

> #
> # Performance monitor support
> #
> # CONFIG_RAS is not set
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> CONFIG_DAX=3Dy
> # CONFIG_DEV_DAX is not set
> CONFIG_NVMEM=3Dy
> # CONFIG_STM is not set
> # CONFIG_INTEL_TH is not set
> CONFIG_FPGA=3Dm
> CONFIG_ALTERA_PR_IP_CORE=3Dm
> CONFIG_FPGA_MGR_ALTERA_PS_SPI=3Dm
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_MGR_XILINX_SPI=3Dm
> # CONFIG_FPGA_BRIDGE is not set
> CONFIG_FSI=3Dm
> CONFIG_FSI_MASTER_GPIO=3Dm
> CONFIG_FSI_MASTER_HUB=3Dm
> CONFIG_FSI_SCOM=3Dm
> CONFIG_PM_OPP=3Dy
> # CONFIG_UNISYS_VISORBUS is not set
> CONFIG_SIOX=3Dy
> # CONFIG_SIOX_BUS_GPIO is not set
> CONFIG_SLIMBUS=3Dm
> # CONFIG_SLIM_QCOM_CTRL is not set
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_DELL_RBU=3Dy
> CONFIG_DCDBAS=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_FW_CFG_SYSFS is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> # CONFIG_GOOGLE_COREBOOT_TABLE_ACPI is not set
> # CONFIG_EFI_DEV_PATH_PARSER is not set
> =

> #
> # Tegra firmware driver
> #
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_MANDATORY_FILE_LOCKING is not set
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QFMT_V1=3Dy
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_QUOTACTL_COMPAT=3Dy
> CONFIG_AUTOFS4_FS=3Dm
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> CONFIG_OVERLAY_FS=3Dy
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> CONFIG_OVERLAY_FS_INDEX=3Dy
> # CONFIG_OVERLAY_FS_NFS_EXPORT is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> CONFIG_FSCACHE_DEBUG=3Dy
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V2=3Dy
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_FSCACHE is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dy
> CONFIG_RPCSEC_GSS_KRB5=3Dy
> # CONFIG_SUNRPC_DEBUG is not set
> # CONFIG_CEPH_FS is not set
> CONFIG_CIFS=3Dm
> # CONFIG_CIFS_STATS is not set
> # CONFIG_CIFS_WEAK_PW_HASH is not set
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CIFS_SMB311 is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> # CONFIG_NLS_CODEPAGE_850 is not set
> CONFIG_NLS_CODEPAGE_852=3Dm
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dm
> # CONFIG_NLS_CODEPAGE_865 is not set
> CONFIG_NLS_CODEPAGE_866=3Dm
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dy
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dy
> CONFIG_NLS_ASCII=3Dm
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> # CONFIG_NLS_ISO8859_15 is not set
> # CONFIG_NLS_KOI8_R is not set
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dm
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dm
> # CONFIG_NLS_MAC_GREEK is not set
> CONFIG_NLS_MAC_ICELAND=3Dm
> CONFIG_NLS_MAC_INUIT=3Dy
> CONFIG_NLS_MAC_ROMANIAN=3Dm
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_DLM is not set
> =

> #
> # Kernel hacking
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_GDB_SCRIPTS is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_FRAME_POINTER=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_DEBUG_VM is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_MEMORY_INIT is not set
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_KCOV=3Dy
> # CONFIG_KCOV_ENABLE_COMPARISONS is not set
> CONFIG_KCOV_INSTRUMENT_ALL=3Dy
> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Lockups and Hangs
> #
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_DEBUG_TIMEKEEPING=3Dy
> CONFIG_DEBUG_PREEMPT=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> # CONFIG_PROVE_LOCKING is not set
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> CONFIG_STACKTRACE=3Dy
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PI_LIST is not set
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> # CONFIG_PROVE_RCU is not set
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_PERF_TEST is not set
> CONFIG_RCU_TORTURE_TEST=3Dy
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FAULT_INJECTION=3Dy
> CONFIG_FAIL_PAGE_ALLOC=3Dy
> CONFIG_FAIL_MMC_REQUEST=3Dy
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_RUNTIME_TESTING_MENU is not set
> CONFIG_MEMTEST=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> # CONFIG_UBSAN is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> # CONFIG_X86_PTDUMP_CORE is not set
> # CONFIG_X86_PTDUMP is not set
> # CONFIG_DEBUG_WX is not set
> # CONFIG_DOUBLEFAULT is not set
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> # CONFIG_IO_DELAY_0X80 is not set
> CONFIG_IO_DELAY_0XED=3Dy
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D1
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_OPTIMIZE_INLINING is not set
> CONFIG_DEBUG_ENTRY=3Dy
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> CONFIG_X86_DEBUG_FPU=3Dy
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> # CONFIG_UNWINDER_ORC is not set
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_KEYS_COMPAT=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> # CONFIG_TRUSTED_KEYS is not set
> CONFIG_ENCRYPTED_KEYS=3Dm
> CONFIG_KEY_DH_OPERATIONS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> # CONFIG_SECURITY_WRITABLE_HOOKS is not set
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> CONFIG_STATIC_USERMODEHELPER=3Dy
> CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_YAMA is not set
> # CONFIG_INTEGRITY is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_BLKCIPHER=3Dy
> CONFIG_CRYPTO_BLKCIPHER2=3Dy
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
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dm
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_SIMD=3Dm
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dm
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dm
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dm
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dm
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dm
> # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
> CONFIG_CRYPTO_GHASH=3Dm
> # CONFIG_CRYPTO_POLY1305 is not set
> # CONFIG_CRYPTO_POLY1305_X86_64 is not set
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dm
> # CONFIG_CRYPTO_RMD256 is not set
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dm
> CONFIG_CRYPTO_SHA512_SSSE3=3Dy
> CONFIG_CRYPTO_SHA1_MB=3Dm
> CONFIG_CRYPTO_SHA256_MB=3Dm
> # CONFIG_CRYPTO_SHA512_MB is not set
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> # CONFIG_CRYPTO_SHA3 is not set
> CONFIG_CRYPTO_SM3=3Dy
> CONFIG_CRYPTO_TGR192=3Dm
> CONFIG_CRYPTO_WP512=3Dm
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dm
> CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> # CONFIG_CRYPTO_CAST5 is not set
> # CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> CONFIG_CRYPTO_DES=3Dy
> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> # CONFIG_CRYPTO_SALSA20 is not set
> # CONFIG_CRYPTO_SALSA20_X86_64 is not set
> CONFIG_CRYPTO_CHACHA20=3Dm
> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dm
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dm
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
> CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
> # CONFIG_BINARY_PRINTF is not set
> =

> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> # CONFIG_HAVE_ARCH_BITREVERSE is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dm
> CONFIG_CRC16=3Dm
> CONFIG_CRC_T10DIF=3Dm
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=3Dy
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dm
> CONFIG_842_DECOMPRESS=3Dm
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dm
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> # CONFIG_XZ_DEC_X86 is not set
> # CONFIG_XZ_DEC_POWERPC is not set
> CONFIG_XZ_DEC_IA64=3Dy
> # CONFIG_XZ_DEC_ARM is not set
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dm
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dm
> CONFIG_RADIX_TREE_MULTIORDER=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_SGL_ALLOC=3Dy
> # CONFIG_DMA_DIRECT_OPS is not set
> # CONFIG_DMA_VIRT_OPS is not set
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_CORDIC is not set
> # CONFIG_DDR is not set
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> # CONFIG_SG_SPLIT is not set
> # CONFIG_SG_POOL is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_PRIME_NUMBERS=3Dm
> # CONFIG_STRING_SELFTEST is not set


--===============1681897734587294346==--

