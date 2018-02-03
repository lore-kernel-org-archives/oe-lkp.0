Content-Type: multipart/mixed; boundary="===============0030679435453978762=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: 0a5ca4b36c ("rcu: Parallelize expedited grace-period .."): WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:2866 flush_work
Date: Sat, 03 Feb 2018 12:48:22 -0800
Message-ID: <20180203204822.GM3617@linux.vnet.ibm.com>
In-Reply-To: <5a7545ea.m2sg11V8PBssH3hs%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0030679435453978762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 03, 2018 at 01:17:30PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu=
/dev
> =

> commit 0a5ca4b36cf64ab6c333d2b0f6b79fca044d30ed
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Thu Feb 1 22:05:38 2018 -0800
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Fri Feb 2 03:28:18 2018 -0800
> =

>     rcu: Parallelize expedited grace-period initialization
>     =

>     The latency of RCU expedited grace periods grows with increasing numb=
ers
>     of CPUs, eventually failing to be all that expedited.  Much of the gr=
owth
>     in latency is in the initialization phase, so this commit uses workqu=
eues
>     to carry out this initialization concurrently on a rcu_node-by-rcu_no=
de
>     basis.
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

This one is currently experimental, and I am talking to Tejun about how
best to resolve it.  Apologies for the noise!

							Thanx, Paul

> 0f0a62adf1  torture: Provide more sensible nreader/nwriter defaults for r=
cuperf
> 0a5ca4b36c  rcu: Parallelize expedited grace-period initialization
> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | 0f0a62adf1 | 0a=
5ca4b36c |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_successes                                        | 35         | 0 =
         |
> | boot_failures                                         | 0          | 15=
         |
> | WARNING:at_kernel/workqueue.c:#flush_work             | 0          | 15=
         |
> | EIP:flush_work                                        | 0          | 15=
         |
> | BUG:scheduling_while_atomic                           | 0          | 15=
         |
> | WARNING:at_kernel/locking/lockdep.c:#lock_release     | 0          | 15=
         |
> | EIP:lock_release                                      | 0          | 15=
         |
> | WARNING:at_kernel/locking/lockdep.c:#lock_unpin_lock  | 0          | 15=
         |
> | EIP:lock_unpin_lock                                   | 0          | 15=
         |
> | WARNING:CPU:#PID:#at_kernel/locking/lockdep.c:#lock_u | 0          | 1 =
         |
> +-------------------------------------------------------+------------+---=
---------+
> =

> [    0.020000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.020000] mce: CPU supports 10 MCE banks
> [    0.020077] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.020676] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.021493] CPU: Intel Core Processor (Haswell) (family: 0x6, model: 0=
x3c, stepping: 0x4)
> [    0.023238] WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:2866 flush_wo=
rk+0x278/0x290
> [    0.024330] Modules linked in:
> [    0.024756] CPU: 0 PID: 0 Comm: swapper Not tainted 4.15.0-rc1-00112-g=
0a5ca4b #1
> [    0.025664] task: 818cbe00 task.stack: 818c0000
> [    0.026214] EIP: flush_work+0x278/0x290
> [    0.026698] EFLAGS: 00210246 CPU: 0
> [    0.027145] EAX: 00000000 EBX: 81a250c0 ECX: 00000006 EDX: 00000001
> [    0.027856] ESI: 81a25094 EDI: 81a25358 EBP: 818c1e00 ESP: 818c1d30
> [    0.028743]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    0.029397] CR0: 80050033 CR2: ffffffff CR3: 01b0d000 CR4: 001406d0
> [    0.030000] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    0.030000] DR6: fffe0ff0 DR7: 00000400
> [    0.030000] Call Trace:
> [    0.030000]  ? kvm_clock_read+0x14/0x30
> [    0.030000]  ? kvm_sched_clock_read+0x9/0x20
> [    0.030000]  ? sched_clock+0x9/0x10
> [    0.030000]  ? sched_clock_local+0x8a/0x160
> [    0.030000]  ? sched_clock_cpu+0xe5/0x120
> [    0.030000]  ? mark_held_locks+0x4a/0x70
> [    0.030000]  ? queue_work_on+0x36/0x80
> [    0.030000]  ? sync_rcu_exp_select_cpus+0x129/0x220
> [    0.030000]  ? rcu_preempt_qs+0x70/0x70
> [    0.030000]  ? _synchronize_rcu_expedited+0x2dc/0x300
> [    0.030000]  ? __native_set_fixmap+0x30/0x30
> [    0.030000]  ? ___ratelimit+0xb7/0x120
> [    0.030000]  ? apply_paravirt+0x92/0x110
> [    0.030000]  ? sched_clock_local+0x73/0x160
> [    0.030000]  ? acpi_hw_read_port+0x4d/0xbd
> [    0.030000]  ? synchronize_rcu+0x5d/0x70
> [    0.030000]  ? acpi_hw_read_multiple+0x1e/0x65
> [    0.030000]  ? acpi_hw_register_read+0x59/0xd4
> [    0.030000]  ? acpi_read_bit_register+0x2e/0x59
> [    0.030000]  ? rcu_test_sync_prims+0x5/0x20
> [    0.030000]  ? rest_init+0x9/0x1d0
> [    0.030000]  ? start_kernel+0x3df/0x3f8
> [    0.030000]  ? startup_32_smp+0x15f/0x170
> [    0.030000] Code: cb e0 01 00 00 e9 d9 fe ff ff 89 f6 8d bc 27 00 00 0=
0 00 8b 85 34 ff ff ff e8 d5 bf 5c 00 31 c0 e9 5d ff ff ff 8d b6 00 00 00 0=
0 <0f> ff e9 50 ff ff ff e8 2c b2 fe ff 8d b6 00 00 00 00 8d bf 00
> [    0.030000] ---[ end trace 94904b8e3de7dea6 ]---
> [    0.030038] BUG: scheduling while atomic: swapper/0/0x00000002
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start e2b60513fa8b07a40502812988533cf8cb10591e d8a5b80568a9cb6=
6810e75b182018e9edb68e8ff --
> git bisect  bad 58b10f77084bf6cc7f8197c8fdbe4175e05abf18  # 07:48  B     =
 0     9   23   0  Merge 'linux-review/Shreyas-NC/ASoC-Add-Multi-CPU-DAI-su=
pport/20180201-111320' into devel-hourly-2018020301
> git bisect good dbfc3e24124c8e8763ec087f5c8b0a23d5985668  # 08:27  G     =
11     0    0   0  Merge 'linux-review/SF-Markus-Elfring/input-joystick-gam=
econ-Adjustments-for-gc_attach/20180130-143827' into devel-hourly-2018020301
> git bisect good 495e3a5de5b1dc60026e1d984fdad1db0b6e2edb  # 08:42  G     =
11     0    0   0  Merge 'regulator/fix/suspend' into devel-hourly-20180203=
01
> git bisect  bad 689177b3136567e1f74a36f42d2fb45ea5454fbe  # 09:12  B     =
 0    10   25   1  Merge 'sunxi/sunxi/for-next-next' into devel-hourly-2018=
020301
> git bisect good 92def772c47a7d1d7a5715d114cc0b5d1c84ab46  # 09:46  G     =
11     0    0   0  Merge 'linux-review/Derek-Basehore/cpu_pm-add-syscore_su=
spend-error-handling/20180201-133540' into devel-hourly-2018020301
> git bisect  bad 75057dfeeadd8fb283d00bd49e1629ccfb60ea43  # 10:05  B     =
 0    11   27   2  Merge 'linux-review/Lyude-Paul/Implement-full-clockgatin=
g-for-Kepler1-and-2/20180201-231630' into devel-hourly-2018020301
> git bisect  bad 16507d8c12819310bec815dfb343edac194d03c8  # 10:19  B     =
 0     2   16   0  Merge 'rcu/rcu/dev' into devel-hourly-2018020301
> git bisect good ad47dc6d915bf9ab013898220f3256be1cc9ad47  # 10:35  G     =
11     0    0   0  Merge 'linux-review/Valentin-Vidic/staging-pi433-fix-Cam=
elCase-for-syncValues/20180129-233738' into devel-hourly-2018020301
> git bisect good ccb640f29b5f1cd14f11724b0d4c062dbf48eeb5  # 11:08  G     =
11     0    0   0  Merge 'linux-review/Stephen-Boyd/MAINTAINERS-Update-sboy=
d-s-email-address/20180201-021431' into devel-hourly-2018020301
> git bisect good 91b4c53238fd26ed23e5adccb7f91c549e02f0ee  # 11:26  G     =
11     0    0   0  rcu: Remove obsolete callback-invocation statistics for =
debugfs
> git bisect good 152de4e4e835bf56392c04bd64dc2cc3ce1c6625  # 11:37  G     =
11     0    0   0  rcu: Fix misprint in srcu_funnel_exp_start
> git bisect good a2958a05be14e20ebb6f82c081d59add1bbfb1fb  # 11:59  G     =
11     0    0   0  rcu: Add more tracing of expedited grace periods
> git bisect good caff197f675357096a10a6ac7400675096c390d3  # 12:12  G     =
10     0    0   0  rcu: Meke expedited RCU CPU selection avoid unnecessary =
stores
> git bisect  bad 0a5ca4b36cf64ab6c333d2b0f6b79fca044d30ed  # 12:27  B     =
 0     7   22   1  rcu: Parallelize expedited grace-period initialization
> git bisect good 0f0a62adf1c0fbec3c0e5988fb225e80b66d0340  # 12:40  G     =
11     0    0   0  torture: Provide more sensible nreader/nwriter defaults =
for rcuperf
> # first bad commit: [0a5ca4b36cf64ab6c333d2b0f6b79fca044d30ed] rcu: Paral=
lelize expedited grace-period initialization
> git bisect good 0f0a62adf1c0fbec3c0e5988fb225e80b66d0340  # 12:43  G     =
31     0    0   0  torture: Provide more sensible nreader/nwriter defaults =
for rcuperf
> # extra tests with debug options
> git bisect  bad 0a5ca4b36cf64ab6c333d2b0f6b79fca044d30ed  # 12:53  B     =
 0    11   25   0  rcu: Parallelize expedited grace-period initialization
> # extra tests on HEAD of linux-devel/devel-hourly-2018020301
> git bisect  bad e2b60513fa8b07a40502812988533cf8cb10591e  # 12:53  B     =
 0    46   63   0  0day head guard for 'devel-hourly-2018020301'
> # extra tests on tree/branch rcu/rcu/dev
> git bisect  bad 0a5ca4b36cf64ab6c333d2b0f6b79fca044d30ed  # 13:04  B     =
 0    15   29   0  rcu: Parallelize expedited grace-period initialization
> # extra tests with first bad commit reverted
> git bisect good d7ab22c6a90b87c44e778ace204f2fa18fec128d  # 13:16  G     =
11     0    0   0  Revert "rcu: Parallelize expedited grace-period initiali=
zation"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion


> #!/bin/bash
> =

> kernel=3D$1
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep
> 	-kernel $kernel
> 	-m 256
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
> # Linux/i386 4.15.0-rc1 Kernel Configuration
> #
> # CONFIG_64BIT is not set
> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
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
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_HAVE_INTEL_TXT=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D2
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=3Dy
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
> # CONFIG_KERNEL_LZMA is not set
> CONFIG_KERNEL_XZ=3Dy
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_USELIB=3Dy
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
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
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
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
> CONFIG_RCU_FANOUT=3D32
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_BOOST is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_SOCK_CGROUP_DATA is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> # CONFIG_USER_NS is not set
> # CONFIG_PID_NS is not set
> CONFIG_NET_NS=3Dy
> # CONFIG_SCHED_AUTOGROUP is not set
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
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> # CONFIG_UID16 is not set
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> # CONFIG_SYSFS_SYSCALL is not set
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_MEMBARRIER=3Dy
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_SYSCALL is not set
> CONFIG_USERFAULTFD=3Dy
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
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
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
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # CONFIG_GCC_PLUGINS is not set
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> CONFIG_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> CONFIG_CC_STACKPROTECTOR_STRONG=3Dy
> CONFIG_THIN_ARCHIVES=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D8
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> # CONFIG_HAVE_ARCH_HASH is not set
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> # CONFIG_HAVE_ARCH_VMAP_STACK is not set
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> # CONFIG_REFCOUNT_FULL is not set
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> # CONFIG_GCOV_FORMAT_AUTODETECT is not set
> CONFIG_GCOV_FORMAT_3_4=3Dy
> # CONFIG_GCOV_FORMAT_4_7 is not set
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> CONFIG_MODULE_COMPRESS_XZ=3Dy
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_FAST_FEATURE_TESTS is not set
> # CONFIG_X86_MPPARSE is not set
> CONFIG_GOLDFISH=3Dy
> CONFIG_INTEL_RDT=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_RDC321X=3Dy
> CONFIG_X86_32_IRIS=3Dm
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> CONFIG_M586MMX=3Dy
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
> CONFIG_X86_GENERIC=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> # CONFIG_X86_PPRO_FENCE is not set
> CONFIG_X86_F00F_BUG=3Dy
> CONFIG_X86_ALIGNMENT_16=3Dy
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D4
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> # CONFIG_CPU_SUP_UMC_32 is not set
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_NR_CPUS=3D1
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_UP_LATE_INIT=3Dy
> CONFIG_X86_UP_APIC=3Dy
> CONFIG_X86_UP_IOAPIC=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCELOG_LEGACY is not set
> # CONFIG_X86_MCE_INTEL is not set
> # CONFIG_X86_MCE_AMD is not set
> CONFIG_X86_ANCIENT_MCE=3Dy
> # CONFIG_X86_MCE_INJECT is not set
> =

> #
> # Performance monitoring
> #
> # CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
> CONFIG_PERF_EVENTS_AMD_POWER=3Dm
> CONFIG_X86_LEGACY_VM86=3Dy
> CONFIG_VM86=3Dy
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX32=3Dy
> CONFIG_TOSHIBA=3Dm
> CONFIG_I8K=3Dm
> CONFIG_X86_REBOOTFIXUPS=3Dy
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dm
> CONFIG_X86_CPUID=3Dy
> # CONFIG_NOHIGHMEM is not set
> CONFIG_HIGHMEM4G=3Dy
> # CONFIG_HIGHMEM64G is not set
> # CONFIG_VMSPLIT_3G is not set
> # CONFIG_VMSPLIT_3G_OPT is not set
> CONFIG_VMSPLIT_2G=3Dy
> # CONFIG_VMSPLIT_2G_OPT is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0x80000000
> CONFIG_HIGHMEM=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_NEED_NODE_MEMMAP_SIZE=3Dy
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_FLATMEM_MANUAL is not set
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_BALLOON_COMPACTION is not set
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> # CONFIG_PHYS_ADDR_T_64BIT is not set
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> # CONFIG_ARCH_WANTS_THP_SWAP is not set
> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> CONFIG_NEED_PER_CPU_KM=3Dy
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_CMA is not set
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> CONFIG_ZSMALLOC=3Dm
> CONFIG_PGTABLE_MAPPING=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_FRAME_VECTOR=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_BENCHMARK is not set
> # CONFIG_HIGHPTE is not set
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MATH_EMULATION is not set
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_INTEL_UMIP is not set
> # CONFIG_EFI is not set
> CONFIG_SECCOMP=3Dy
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_COMPAT_VDSO=3Dy
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> # CONFIG_SUSPEND_SKIP_SYNC is not set
> CONFIG_PM_SLEEP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> CONFIG_PM_WAKELOCKS_GC=3Dy
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> CONFIG_PM_ADVANCED_DEBUG=3Dy
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_DPM_WATCHDOG is not set
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> CONFIG_ACPI_EC_DEBUGFS=3Dm
> # CONFIG_ACPI_AC is not set
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dm
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dm
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> CONFIG_ACPI_THERMAL=3Dm
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> CONFIG_DPTF_POWER=3Dm
> CONFIG_ACPI_EXTLOG=3Dm
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> # CONFIG_TPS68470_PMIC_OPREGION is not set
> # CONFIG_SFI is not set
> # CONFIG_APM is not set
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> # CONFIG_CPUFREQ_DT is not set
> # CONFIG_X86_INTEL_PSTATE is not set
> # CONFIG_X86_PCC_CPUFREQ is not set
> CONFIG_X86_ACPI_CPUFREQ=3Dm
> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> CONFIG_X86_POWERNOW_K6=3Dm
> CONFIG_X86_POWERNOW_K7=3Dm
> CONFIG_X86_POWERNOW_K7_ACPI=3Dy
> # CONFIG_X86_POWERNOW_K8 is not set
> # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
> # CONFIG_X86_GX_SUSPMOD is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> CONFIG_X86_SPEEDSTEP_ICH=3Dm
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> CONFIG_X86_P4_CLOCKMOD=3Dy
> CONFIG_X86_CPUFREQ_NFORCE2=3Dm
> # CONFIG_X86_LONGRUN is not set
> # CONFIG_X86_LONGHAUL is not set
> CONFIG_X86_E_POWERSAVER=3Dm
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> # CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is not set
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> # CONFIG_CPU_IDLE_GOV_MENU is not set
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> CONFIG_INTEL_IDLE=3Dy
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> # CONFIG_PCI_GOBIOS is not set
> CONFIG_PCI_GOMMCONFIG=3Dy
> # CONFIG_PCI_GODIRECT is not set
> # CONFIG_PCI_GOOLPC is not set
> # CONFIG_PCI_GOANY is not set
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_PCIEAER=3Dy
> # CONFIG_PCIE_ECRC is not set
> CONFIG_PCIEAER_INJECT=3Dm
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEBUG=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_DPC=3Dy
> CONFIG_PCIE_PTM=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
> CONFIG_PCI_STUB=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=3Dy
> CONFIG_PCIE_DW_HOST=3Dy
> CONFIG_PCIE_DW_PLAT=3Dy
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
> CONFIG_ISA_DMA_API=3Dy
> # CONFIG_ISA is not set
> # CONFIG_SCx200 is not set
> CONFIG_OLPC=3Dy
> CONFIG_OLPC_XO1_PM=3Dy
> # CONFIG_OLPC_XO1_SCI is not set
> # CONFIG_OLPC_XO15_SCI is not set
> # CONFIG_ALIX is not set
> # CONFIG_NET5501 is not set
> CONFIG_AMD_NB=3Dy
> # CONFIG_PCCARD is not set
> CONFIG_RAPIDIO=3Dm
> CONFIG_RAPIDIO_TSI721=3Dm
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> # CONFIG_RAPIDIO_DMA_ENGINE is not set
> CONFIG_RAPIDIO_DEBUG=3Dy
> CONFIG_RAPIDIO_ENUM_BASIC=3Dm
> CONFIG_RAPIDIO_CHMAN=3Dm
> CONFIG_RAPIDIO_MPORT_CDEV=3Dm
> =

> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_TSI57X=3Dm
> CONFIG_RAPIDIO_CPS_XX=3Dm
> CONFIG_RAPIDIO_TSI568=3Dm
> CONFIG_RAPIDIO_CPS_GEN2=3Dm
> CONFIG_RAPIDIO_RXS_GEN3=3Dm
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_HAVE_AOUT=3Dy
> CONFIG_BINFMT_AOUT=3Dy
> # CONFIG_BINFMT_MISC is not set
> CONFIG_COREDUMP=3Dy
> CONFIG_COMPAT_32=3Dy
> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
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
> # CONFIG_IPX is not set
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
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
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
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_REGMAP_HWSPINLOCK=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> =

> #
> # Bus devices
> #
> # CONFIG_SIMPLE_PM_BUS is not set
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dm
> # CONFIG_MTD_TESTS is not set
> # CONFIG_MTD_REDBOOT_PARTS is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dm
> CONFIG_MTD_OF_PARTS=3Dm
> CONFIG_MTD_AR7_PARTS=3Dm
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
> # CONFIG_MTD_CFI is not set
> CONFIG_MTD_JEDECPROBE=3Dm
> CONFIG_MTD_GEN_PROBE=3Dm
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> CONFIG_MTD_CFI_INTELEXT=3Dm
> CONFIG_MTD_CFI_AMDSTD=3Dm
> CONFIG_MTD_CFI_STAA=3Dm
> CONFIG_MTD_CFI_UTIL=3Dm
> CONFIG_MTD_RAM=3Dm
> CONFIG_MTD_ROM=3Dm
> CONFIG_MTD_ABSENT=3Dm
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dm
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> CONFIG_MTD_PHYSMAP_OF=3Dm
> # CONFIG_MTD_PHYSMAP_OF_VERSATILE is not set
> CONFIG_MTD_PHYSMAP_OF_GEMINI=3Dy
> # CONFIG_MTD_AMD76XROM is not set
> # CONFIG_MTD_ICHXROM is not set
> CONFIG_MTD_ESB2ROM=3Dm
> CONFIG_MTD_CK804XROM=3Dm
> # CONFIG_MTD_SCB2_FLASH is not set
> CONFIG_MTD_NETtel=3Dm
> # CONFIG_MTD_L440GX is not set
> # CONFIG_MTD_INTEL_VR_NOR is not set
> # CONFIG_MTD_PLATRAM is not set
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dm
> CONFIG_MTD_PMC551_BUGFIX=3Dy
> CONFIG_MTD_PMC551_DEBUG=3Dy
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> # CONFIG_MTD_MTDRAM is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> # CONFIG_MTD_NAND is not set
> CONFIG_MTD_ONENAND=3Dm
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> # CONFIG_MTD_ONENAND_GENERIC is not set
> CONFIG_MTD_ONENAND_OTP=3Dy
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dm
> CONFIG_MTD_QINFO_PROBE=3Dm
> CONFIG_MTD_SPI_NOR=3Dm
> # CONFIG_MTD_MT81xx_NOR is not set
> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> CONFIG_SPI_INTEL_SPI=3Dm
> CONFIG_SPI_INTEL_SPI_PCI=3Dm
> CONFIG_SPI_INTEL_SPI_PLATFORM=3Dm
> CONFIG_MTD_UBI=3Dm
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> CONFIG_DTC=3Dy
> CONFIG_OF=3Dy
> CONFIG_OF_UNITTEST=3Dy
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_EARLY_FLATTREE=3Dy
> CONFIG_OF_PROMTREE=3Dy
> CONFIG_OF_KOBJ=3Dy
> CONFIG_OF_DYNAMIC=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_ADDRESS_PCI=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_PCI=3Dy
> CONFIG_OF_PCI_IRQ=3Dy
> CONFIG_OF_RESOLVE=3Dy
> # CONFIG_OF_OVERLAY is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> # CONFIG_PARPORT_SERIAL is not set
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_GSC is not set
> CONFIG_PARPORT_AX88796=3Dm
> CONFIG_PARPORT_1284=3Dy
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
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dm
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dy
> CONFIG_CS5535_MFGPT=3Dm
> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> # CONFIG_CS5535_CLOCK_EVENT_SRC is not set
> CONFIG_HP_ILO=3Dm
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dm
> CONFIG_HMC6352=3Dy
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dy
> # CONFIG_PCH_PHUB is not set
> # CONFIG_USB_SWITCH_FSA9480 is not set
> CONFIG_SRAM=3Dy
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> CONFIG_C2PORT=3Dm
> # CONFIG_C2PORT_DURAMAR_2150 is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> # CONFIG_EEPROM_LEGACY is not set
> CONFIG_EEPROM_MAX6875=3Dm
> # CONFIG_EEPROM_93CX6 is not set
> CONFIG_EEPROM_IDT_89HPESX=3Dm
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dy
> # CONFIG_ALTERA_STAPL is not set
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> CONFIG_VMWARE_VMCI=3Dy
> =

> #
> # Intel MIC & related support
> #
> =

> #
> # Intel MIC Bus Driver
> #
> =

> #
> # SCIF Bus Driver
> #
> =

> #
> # VOP Bus Driver
> #
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
> CONFIG_ECHO=3Dy
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
> # CONFIG_CXL_LIB is not set
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
> CONFIG_FIREWIRE=3Dy
> # CONFIG_FIREWIRE_OHCI is not set
> # CONFIG_FIREWIRE_NET is not set
> CONFIG_FIREWIRE_NOSY=3Dm
> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_MAC_EMUMOUSEBTN is not set
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
> # CONFIG_RIONET is not set
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
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> # CONFIG_AMD_XGBE_HAVE_ECC is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
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
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
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
> # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_EXAR=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_HP=3Dy
> # CONFIG_HP100 is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
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
> # CONFIG_IXGBEVF is not set
> # CONFIG_I40E is not set
> # CONFIG_I40EVF is not set
> # CONFIG_FM10K is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_MVNETA_BM is not set
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
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_PCH_GBE is not set
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
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
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
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_MDIO_BUS is not set
> # CONFIG_PHYLIB is not set
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
> =

> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_THUNDERBOLT_NET is not set
> # CONFIG_HYPERV_NET is not set
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> # CONFIG_INPUT_LEDS is not set
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dm
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dy
> CONFIG_INPUT_EVDEV=3Dm
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
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
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TC3589X is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> # CONFIG_KEYBOARD_BCM is not set
> CONFIG_INPUT_MOUSE=3Dy
> # CONFIG_MOUSE_PS2 is not set
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> CONFIG_MOUSE_ELAN_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
> # CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
> CONFIG_MOUSE_VSXXXAA=3Dy
> CONFIG_MOUSE_GPIO=3Dm
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> CONFIG_JOYSTICK_ANALOG=3Dm
> CONFIG_JOYSTICK_A3D=3Dm
> CONFIG_JOYSTICK_ADI=3Dy
> # CONFIG_JOYSTICK_COBRA is not set
> # CONFIG_JOYSTICK_GF2K is not set
> CONFIG_JOYSTICK_GRIP=3Dm
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dm
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dm
> # CONFIG_JOYSTICK_IFORCE is not set
> CONFIG_JOYSTICK_WARRIOR=3Dm
> CONFIG_JOYSTICK_MAGELLAN=3Dm
> CONFIG_JOYSTICK_SPACEORB=3Dm
> CONFIG_JOYSTICK_SPACEBALL=3Dm
> CONFIG_JOYSTICK_STINGER=3Dm
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> # CONFIG_JOYSTICK_DB9 is not set
> CONFIG_JOYSTICK_GAMECON=3Dy
> # CONFIG_JOYSTICK_TURBOGRAFX is not set
> # CONFIG_JOYSTICK_AS5011 is not set
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> CONFIG_JOYSTICK_XPAD=3Dm
> # CONFIG_JOYSTICK_XPAD_FF is not set
> # CONFIG_JOYSTICK_XPAD_LEDS is not set
> CONFIG_JOYSTICK_WALKERA0701=3Dy
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> CONFIG_TABLET_USB_AIPTEK=3Dm
> # CONFIG_TABLET_USB_GTCO is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> CONFIG_TABLET_USB_KBTAB=3Dm
> CONFIG_TABLET_USB_PEGASUS=3Dy
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> # CONFIG_TOUCHSCREEN_88PM860X is not set
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
> CONFIG_TOUCHSCREEN_AR1021_I2C=3Dm
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
> CONFIG_TOUCHSCREEN_ATMEL_MXT_T37=3Dy
> # CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=3Dy
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dm
> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> # CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
> # CONFIG_TOUCHSCREEN_DYNAPRO is not set
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dm
> CONFIG_TOUCHSCREEN_EETI=3Dm
> # CONFIG_TOUCHSCREEN_EGALAX is not set
> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> # CONFIG_TOUCHSCREEN_EXC3000 is not set
> # CONFIG_TOUCHSCREEN_FUJITSU is not set
> CONFIG_TOUCHSCREEN_GOODIX=3Dm
> # CONFIG_TOUCHSCREEN_HIDEEP is not set
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> CONFIG_TOUCHSCREEN_S6SY761=3Dy
> # CONFIG_TOUCHSCREEN_GUNZE is not set
> CONFIG_TOUCHSCREEN_EKTF2127=3Dm
> CONFIG_TOUCHSCREEN_ELAN=3Dy
> # CONFIG_TOUCHSCREEN_ELO is not set
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> # CONFIG_TOUCHSCREEN_WACOM_I2C is not set
> CONFIG_TOUCHSCREEN_MAX11801=3Dy
> CONFIG_TOUCHSCREEN_MCS5000=3Dy
> CONFIG_TOUCHSCREEN_MMS114=3Dy
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> CONFIG_TOUCHSCREEN_IMX6UL_TSC=3Dy
> CONFIG_TOUCHSCREEN_INEXIO=3Dm
> # CONFIG_TOUCHSCREEN_MK712 is not set
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dm
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dm
> CONFIG_TOUCHSCREEN_PIXCIR=3Dm
> # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
> CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dy
> CONFIG_TOUCHSCREEN_MC13783=3Dm
> CONFIG_TOUCHSCREEN_USB_EGALAX=3Dy
> CONFIG_TOUCHSCREEN_USB_PANJIT=3Dy
> # CONFIG_TOUCHSCREEN_USB_3M is not set
> # CONFIG_TOUCHSCREEN_USB_ITM is not set
> CONFIG_TOUCHSCREEN_USB_ETURBO=3Dy
> CONFIG_TOUCHSCREEN_USB_GUNZE=3Dy
> # CONFIG_TOUCHSCREEN_USB_DMC_TSC10 is not set
> CONFIG_TOUCHSCREEN_USB_IRTOUCH=3Dy
> # CONFIG_TOUCHSCREEN_USB_IDEALTEK is not set
> CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=3Dy
> # CONFIG_TOUCHSCREEN_USB_GOTOP is not set
> # CONFIG_TOUCHSCREEN_USB_JASTEC is not set
> # CONFIG_TOUCHSCREEN_USB_ELO is not set
> # CONFIG_TOUCHSCREEN_USB_E2I is not set
> # CONFIG_TOUCHSCREEN_USB_ZYTRONIC is not set
> # CONFIG_TOUCHSCREEN_USB_ETT_TC45USB is not set
> CONFIG_TOUCHSCREEN_USB_NEXIO=3Dy
> CONFIG_TOUCHSCREEN_USB_EASYTOUCH=3Dy
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> # CONFIG_TOUCHSCREEN_TSC2004 is not set
> CONFIG_TOUCHSCREEN_TSC2007=3Dy
> CONFIG_TOUCHSCREEN_RM_TS=3Dm
> # CONFIG_TOUCHSCREEN_SILEAD is not set
> # CONFIG_TOUCHSCREEN_SIS_I2C is not set
> CONFIG_TOUCHSCREEN_ST1232=3Dm
> # CONFIG_TOUCHSCREEN_STMFTS is not set
> # CONFIG_TOUCHSCREEN_SUR40 is not set
> # CONFIG_TOUCHSCREEN_SX8654 is not set
> # CONFIG_TOUCHSCREEN_TPS6507X is not set
> CONFIG_TOUCHSCREEN_ZET6223=3Dm
> CONFIG_TOUCHSCREEN_ZFORCE=3Dm
> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dm
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM860X_ONKEY=3Dy
> # CONFIG_INPUT_AD714X is not set
> CONFIG_INPUT_ATMEL_CAPTOUCH=3Dy
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_E3X0_BUTTON=3Dm
> # CONFIG_INPUT_PCSPKR is not set
> CONFIG_INPUT_MAX8925_ONKEY=3Dy
> CONFIG_INPUT_MC13783_PWRBUTTON=3Dm
> # CONFIG_INPUT_MMA8450 is not set
> # CONFIG_INPUT_APANEL is not set
> # CONFIG_INPUT_GP2A is not set
> CONFIG_INPUT_GPIO_BEEPER=3Dm
> # CONFIG_INPUT_GPIO_TILT_POLLED is not set
> CONFIG_INPUT_GPIO_DECODER=3Dy
> CONFIG_INPUT_WISTRON_BTNS=3Dy
> # CONFIG_INPUT_ATLAS_BTNS is not set
> CONFIG_INPUT_ATI_REMOTE2=3Dy
> CONFIG_INPUT_KEYSPAN_REMOTE=3Dy
> # CONFIG_INPUT_KXTJ9 is not set
> CONFIG_INPUT_POWERMATE=3Dy
> # CONFIG_INPUT_YEALINK is not set
> CONFIG_INPUT_CM109=3Dm
> # CONFIG_INPUT_REGULATOR_HAPTIC is not set
> CONFIG_INPUT_RETU_PWRBUTTON=3Dm
> CONFIG_INPUT_TPS65218_PWRBUTTON=3Dm
> # CONFIG_INPUT_TWL4030_PWRBUTTON is not set
> CONFIG_INPUT_TWL4030_VIBRA=3Dm
> # CONFIG_INPUT_UINPUT is not set
> # CONFIG_INPUT_PCF50633_PMU is not set
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_RK805_PWRKEY=3Dm
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
> CONFIG_INPUT_DA9055_ONKEY=3Dm
> # CONFIG_INPUT_DA9063_ONKEY is not set
> CONFIG_INPUT_ADXL34X=3Dy
> # CONFIG_INPUT_ADXL34X_I2C is not set
> CONFIG_INPUT_IMS_PCU=3Dm
> # CONFIG_INPUT_CMA3000 is not set
> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> # CONFIG_INPUT_DRV260X_HAPTICS is not set
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> CONFIG_RMI4_CORE=3Dy
> # CONFIG_RMI4_I2C is not set
> CONFIG_RMI4_SMB=3Dy
> # CONFIG_RMI4_F03 is not set
> CONFIG_RMI4_2D_SENSOR=3Dy
> # CONFIG_RMI4_F11 is not set
> CONFIG_RMI4_F12=3Dy
> # CONFIG_RMI4_F30 is not set
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
> # CONFIG_SERIO_CT82C710 is not set
> CONFIG_SERIO_PARKBD=3Dm
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_APBPS2=3Dy
> CONFIG_SERIO_OLPC_APSP=3Dy
> CONFIG_HYPERV_KEYBOARD=3Dm
> CONFIG_SERIO_GPIO_PS2=3Dy
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> # CONFIG_GAMEPORT_NS558 is not set
> CONFIG_GAMEPORT_L4=3Dy
> CONFIG_GAMEPORT_EMU10K1=3Dm
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
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> # CONFIG_GOLDFISH_TTY is not set
> CONFIG_DEVMEM=3Dy
> CONFIG_DEVKMEM=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_ASPEED_VUART is not set
> # CONFIG_SERIAL_8250_FSL is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_8250_MOXA is not set
> # CONFIG_SERIAL_OF_PLATFORM is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_PCH_UART is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> # CONFIG_TTY_PRINTK is not set
> CONFIG_PRINTER=3Dm
> # CONFIG_LP_CONSOLE is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> # CONFIG_IPMI_HANDLER is not set
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> # CONFIG_HW_RANDOM_INTEL is not set
> # CONFIG_HW_RANDOM_AMD is not set
> # CONFIG_HW_RANDOM_GEODE is not set
> CONFIG_HW_RANDOM_VIA=3Dy
> # CONFIG_HW_RANDOM_VIRTIO is not set
> CONFIG_HW_RANDOM_TPM=3Dy
> # CONFIG_NVRAM is not set
> # CONFIG_R3964 is not set
> CONFIG_APPLICOM=3Dy
> # CONFIG_SONYPI is not set
> # CONFIG_MWAVE is not set
> CONFIG_PC8736x_GPIO=3Dm
> CONFIG_NSC_GPIO=3Dy
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> CONFIG_HPET_MMAP_DEFAULT=3Dy
> CONFIG_HANGCHECK_TIMER=3Dm
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> CONFIG_TCG_NSC=3Dm
> # CONFIG_TCG_ATMEL is not set
> # CONFIG_TCG_INFINEON is not set
> CONFIG_TCG_CRB=3Dm
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> CONFIG_TELCLOCK=3Dm
> # CONFIG_DEVPORT is not set
> CONFIG_XILLYBUS=3Dm
> CONFIG_XILLYBUS_PCIE=3Dm
> CONFIG_XILLYBUS_OF=3Dm
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dm
> CONFIG_I2C_MUX_GPIO=3Dm
> # CONFIG_I2C_MUX_GPMUX is not set
> # CONFIG_I2C_MUX_LTC4306 is not set
> CONFIG_I2C_MUX_PCA9541=3Dm
> CONFIG_I2C_MUX_PCA954x=3Dm
> CONFIG_I2C_MUX_PINCTRL=3Dm
> CONFIG_I2C_MUX_REG=3Dm
> # CONFIG_I2C_DEMUX_PINCTRL is not set
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCF=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dm
> # CONFIG_I2C_ALI1563 is not set
> CONFIG_I2C_ALI15X3=3Dy
> CONFIG_I2C_AMD756=3Dy
> CONFIG_I2C_AMD756_S4882=3Dy
> CONFIG_I2C_AMD8111=3Dm
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dm
> CONFIG_I2C_ISMT=3Dm
> # CONFIG_I2C_PIIX4 is not set
> CONFIG_I2C_CHT_WC=3Dm
> # CONFIG_I2C_NFORCE2 is not set
> CONFIG_I2C_SIS5595=3Dy
> CONFIG_I2C_SIS630=3Dy
> CONFIG_I2C_SIS96X=3Dy
> # CONFIG_I2C_VIA is not set
> CONFIG_I2C_VIAPRO=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dy
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dm
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> CONFIG_I2C_EG20T=3Dy
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_KEMPLD is not set
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dy
> CONFIG_I2C_PXA=3Dy
> CONFIG_I2C_PXA_PCI=3Dy
> CONFIG_I2C_RK3X=3Dy
> CONFIG_I2C_SIMTEC=3Dm
> CONFIG_I2C_XILINX=3Dm
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> CONFIG_I2C_DLN2=3Dm
> CONFIG_I2C_PARPORT=3Dy
> CONFIG_I2C_PARPORT_LIGHT=3Dm
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> # CONFIG_I2C_TAOS_EVM is not set
> CONFIG_I2C_TINY_USB=3Dy
> CONFIG_I2C_VIPERBOARD=3Dm
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> CONFIG_SCx200_ACB=3Dy
> CONFIG_I2C_STUB=3Dm
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
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
> CONFIG_NTP_PPS=3Dy
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> CONFIG_PPS_CLIENT_GPIO=3Dm
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=3Dm
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # CONFIG_PTP_1588_CLOCK_PCH is not set
> CONFIG_PTP_1588_CLOCK_KVM=3Dm
> CONFIG_PINCTRL=3Dy
> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> CONFIG_PINCTRL_AS3722=3Dy
> CONFIG_PINCTRL_AMD=3Dy
> # CONFIG_PINCTRL_MCP23S08 is not set
> CONFIG_PINCTRL_SINGLE=3Dm
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_MAX77620=3Dy
> # CONFIG_PINCTRL_RK805 is not set
> # CONFIG_PINCTRL_BAYTRAIL is not set
> CONFIG_PINCTRL_CHERRYVIEW=3Dm
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_BROXTON=3Dm
> CONFIG_PINCTRL_CANNONLAKE=3Dm
> CONFIG_PINCTRL_CEDARFORK=3Dm
> CONFIG_PINCTRL_DENVERTON=3Dy
> # CONFIG_PINCTRL_GEMINILAKE is not set
> CONFIG_PINCTRL_LEWISBURG=3Dm
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_74XX_MMIO is not set
> # CONFIG_GPIO_ALTERA is not set
> CONFIG_GPIO_AMDPT=3Dm
> CONFIG_GPIO_DWAPB=3Dm
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_FTGPIO010=3Dy
> CONFIG_GPIO_GENERIC_PLATFORM=3Dm
> CONFIG_GPIO_GRGPIO=3Dm
> CONFIG_GPIO_ICH=3Dm
> CONFIG_GPIO_LYNXPOINT=3Dy
> # CONFIG_GPIO_MB86S7X is not set
> CONFIG_GPIO_MOCKUP=3Dy
> CONFIG_GPIO_SYSCON=3Dm
> CONFIG_GPIO_VX855=3Dm
> # CONFIG_GPIO_XILINX is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> # CONFIG_GPIO_IT87 is not set
> CONFIG_GPIO_SCH=3Dm
> CONFIG_GPIO_SCH311X=3Dm
> CONFIG_GPIO_WS16C48=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dm
> CONFIG_GPIO_ADNP=3Dm
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> # CONFIG_GPIO_PCF857X is not set
> CONFIG_GPIO_TPIC2810=3Dy
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=3Dy
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_BD9571MWV=3Dm
> # CONFIG_GPIO_CS5535 is not set
> CONFIG_GPIO_DA9055=3Dm
> CONFIG_GPIO_DLN2=3Dm
> CONFIG_GPIO_JANZ_TTL=3Dm
> CONFIG_GPIO_KEMPLD=3Dm
> CONFIG_GPIO_MAX77620=3Dm
> # CONFIG_GPIO_TC3589X is not set
> # CONFIG_GPIO_TIMBERDALE is not set
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS65218=3Dm
> CONFIG_GPIO_TPS6586X=3Dy
> CONFIG_GPIO_TPS65910=3Dy
> CONFIG_GPIO_TPS68470=3Dy
> CONFIG_GPIO_TWL4030=3Dy
> # CONFIG_GPIO_WM8350 is not set
> CONFIG_GPIO_WM8994=3Dm
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> CONFIG_GPIO_PCH=3Dm
> CONFIG_GPIO_PCI_IDIO_16=3Dm
> CONFIG_GPIO_RDC321X=3Dm
> # CONFIG_GPIO_SODAVILLE is not set
> =

> #
> # USB GPIO expanders
> #
> # CONFIG_GPIO_VIPERBOARD is not set
> CONFIG_W1=3Dm
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dm
> CONFIG_W1_MASTER_DS2490=3Dm
> CONFIG_W1_MASTER_DS2482=3Dm
> CONFIG_W1_MASTER_DS1WM=3Dm
> # CONFIG_W1_MASTER_GPIO is not set
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dm
> CONFIG_W1_SLAVE_SMEM=3Dm
> CONFIG_W1_SLAVE_DS2405=3Dm
> CONFIG_W1_SLAVE_DS2408=3Dm
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> CONFIG_W1_SLAVE_DS2413=3Dm
> CONFIG_W1_SLAVE_DS2406=3Dm
> CONFIG_W1_SLAVE_DS2423=3Dm
> CONFIG_W1_SLAVE_DS2805=3Dm
> CONFIG_W1_SLAVE_DS2431=3Dm
> # CONFIG_W1_SLAVE_DS2433 is not set
> CONFIG_W1_SLAVE_DS2438=3Dm
> CONFIG_W1_SLAVE_DS2760=3Dm
> CONFIG_W1_SLAVE_DS2780=3Dm
> CONFIG_W1_SLAVE_DS2781=3Dm
> CONFIG_W1_SLAVE_DS28E04=3Dm
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # CONFIG_POWER_AVS is not set
> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_PDA_POWER is not set
> # CONFIG_MAX8925_POWER is not set
> CONFIG_WM8350_POWER=3Dy
> # CONFIG_TEST_POWER is not set
> # CONFIG_BATTERY_88PM860X is not set
> CONFIG_BATTERY_ACT8945A=3Dy
> # CONFIG_BATTERY_DS2760 is not set
> CONFIG_BATTERY_DS2780=3Dm
> CONFIG_BATTERY_DS2781=3Dm
> CONFIG_BATTERY_DS2782=3Dm
> CONFIG_BATTERY_OLPC=3Dm
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_CHARGER_SBS=3Dm
> CONFIG_MANAGER_SBS=3Dm
> # CONFIG_BATTERY_BQ27XXX is not set
> CONFIG_BATTERY_DA9150=3Dm
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dm
> # CONFIG_BATTERY_MAX1721X is not set
> # CONFIG_CHARGER_PCF50633 is not set
> # CONFIG_CHARGER_ISP1704 is not set
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dm
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_LTC3651=3Dm
> CONFIG_CHARGER_MAX14577=3Dy
> # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> CONFIG_CHARGER_MAX77693=3Dm
> # CONFIG_CHARGER_MAX8998 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24257=3Dy
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_CHARGER_TPS65217=3Dm
> CONFIG_BATTERY_GAUGE_LTC2941=3Dm
> CONFIG_BATTERY_GOLDFISH=3Dy
> CONFIG_BATTERY_RT5033=3Dm
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_HWMON=3Dm
> CONFIG_HWMON_VID=3Dm
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dm
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dm
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> CONFIG_SENSORS_ADT7410=3Dm
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_ASC7621=3Dm
> CONFIG_SENSORS_K8TEMP=3Dm
> CONFIG_SENSORS_K10TEMP=3Dm
> CONFIG_SENSORS_FAM15H_POWER=3Dm
> CONFIG_SENSORS_APPLESMC=3Dm
> CONFIG_SENSORS_ASB100=3Dm
> CONFIG_SENSORS_ASPEED=3Dm
> CONFIG_SENSORS_ATXP1=3Dm
> CONFIG_SENSORS_DS620=3Dm
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DELL_SMM=3Dm
> CONFIG_SENSORS_DA9055=3Dm
> CONFIG_SENSORS_I5K_AMB=3Dm
> CONFIG_SENSORS_F71805F=3Dm
> # CONFIG_SENSORS_F71882FG is not set
> CONFIG_SENSORS_F75375S=3Dm
> # CONFIG_SENSORS_MC13783_ADC is not set
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_GL518SM=3Dm
> # CONFIG_SENSORS_GL520SM is not set
> CONFIG_SENSORS_G760A=3Dm
> CONFIG_SENSORS_G762=3Dm
> CONFIG_SENSORS_GPIO_FAN=3Dm
> CONFIG_SENSORS_HIH6130=3Dm
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dm
> CONFIG_SENSORS_IT87=3Dm
> CONFIG_SENSORS_JC42=3Dm
> CONFIG_SENSORS_POWR1220=3Dm
> CONFIG_SENSORS_LINEAGE=3Dm
> CONFIG_SENSORS_LTC2945=3Dm
> CONFIG_SENSORS_LTC2990=3Dm
> # CONFIG_SENSORS_LTC4151 is not set
> CONFIG_SENSORS_LTC4215=3Dm
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> # CONFIG_SENSORS_LTC4260 is not set
> # CONFIG_SENSORS_LTC4261 is not set
> # CONFIG_SENSORS_MAX16065 is not set
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> CONFIG_SENSORS_MAX6621=3Dm
> CONFIG_SENSORS_MAX6639=3Dm
> CONFIG_SENSORS_MAX6642=3Dm
> # CONFIG_SENSORS_MAX6650 is not set
> CONFIG_SENSORS_MAX6697=3Dm
> CONFIG_SENSORS_MAX31790=3Dm
> CONFIG_SENSORS_MCP3021=3Dm
> CONFIG_SENSORS_TC654=3Dm
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> # CONFIG_SENSORS_LM63 is not set
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dm
> # CONFIG_SENSORS_LM77 is not set
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dm
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dm
> # CONFIG_SENSORS_LM87 is not set
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> CONFIG_SENSORS_PC87360=3Dm
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> CONFIG_SENSORS_NCT6683=3Dm
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT7802=3Dm
> CONFIG_SENSORS_NCT7904=3Dm
> CONFIG_SENSORS_PCF8591=3Dm
> # CONFIG_PMBUS is not set
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHT3x=3Dm
> # CONFIG_SENSORS_SHTC1 is not set
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dm
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dm
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dm
> CONFIG_SENSORS_SMSC47M192=3Dm
> # CONFIG_SENSORS_SMSC47B397 is not set
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> # CONFIG_SENSORS_STTS751 is not set
> CONFIG_SENSORS_SMM665=3Dm
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS1015=3Dm
> CONFIG_SENSORS_ADS7828=3Dm
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dm
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_INA3221=3Dm
> CONFIG_SENSORS_TC74=3Dm
> CONFIG_SENSORS_THMC50=3Dm
> CONFIG_SENSORS_TMP102=3Dm
> CONFIG_SENSORS_TMP103=3Dm
> CONFIG_SENSORS_TMP108=3Dm
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dm
> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dm
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dm
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> # CONFIG_SENSORS_W83L786NG is not set
> # CONFIG_SENSORS_W83627HF is not set
> # CONFIG_SENSORS_W83627EHF is not set
> # CONFIG_SENSORS_WM8350 is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> CONFIG_SENSORS_ATK0110=3Dm
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_OF=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> CONFIG_CPU_THERMAL=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_MAX77620_THERMAL is not set
> # CONFIG_QORIQ_THERMAL is not set
> # CONFIG_DA9062_THERMAL is not set
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
> # CONFIG_INT3406_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> CONFIG_SSB=3Dm
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> # CONFIG_SSB_B43_PCI_BRIDGE is not set
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> CONFIG_SSB_SDIOHOST=3Dy
> # CONFIG_SSB_SILENT is not set
> CONFIG_SSB_DEBUG=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> # CONFIG_BCMA is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dm
> CONFIG_MFD_ACT8945A=3Dy
> # CONFIG_MFD_AS3711 is not set
> CONFIG_MFD_AS3722=3Dy
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_ATMEL_FLEXCOM is not set
> CONFIG_MFD_ATMEL_HLCDC=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dm
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_CROS_EC=3Dm
> CONFIG_MFD_CROS_EC_I2C=3Dm
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> CONFIG_MFD_DA9062=3Dy
> CONFIG_MFD_DA9063=3Dm
> CONFIG_MFD_DA9150=3Dm
> CONFIG_MFD_DLN2=3Dm
> CONFIG_MFD_MC13XXX=3Dm
> CONFIG_MFD_MC13XXX_I2C=3Dm
> CONFIG_MFD_HI6421_PMIC=3Dy
> CONFIG_HTC_PASIC3=3Dm
> CONFIG_HTC_I2CPLD=3Dy
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dm
> CONFIG_LPC_ICH=3Dm
> CONFIG_LPC_SCH=3Dy
> # CONFIG_INTEL_SOC_PMIC is not set
> CONFIG_INTEL_SOC_PMIC_CHTWC=3Dy
> CONFIG_INTEL_SOC_PMIC_CHTDC_TI=3Dy
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dm
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dm
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> CONFIG_MFD_MAX77620=3Dy
> # CONFIG_MFD_MAX77686 is not set
> CONFIG_MFD_MAX77693=3Dm
> CONFIG_MFD_MAX77843=3Dy
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MAX8925=3Dy
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_MT6397=3Dm
> CONFIG_MFD_MENF21BMC=3Dm
> CONFIG_MFD_VIPERBOARD=3Dy
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dm
> CONFIG_PCF50633_ADC=3Dm
> # CONFIG_PCF50633_GPIO is not set
> CONFIG_MFD_RDC321X=3Dm
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RT5033=3Dm
> # CONFIG_MFD_RTSX_USB is not set
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_RK808=3Dm
> CONFIG_MFD_RN5T618=3Dy
> # CONFIG_MFD_SEC_CORE is not set
> CONFIG_MFD_SI476X_CORE=3Dy
> CONFIG_MFD_SM501=3Dm
> # CONFIG_MFD_SM501_GPIO is not set
> CONFIG_MFD_SKY81452=3Dm
> # CONFIG_MFD_SMSC is not set
> CONFIG_ABX500_CORE=3Dy
> # CONFIG_AB3100_CORE is not set
> # CONFIG_MFD_STMPE is not set
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_TI_LMU=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dm
> CONFIG_MFD_TPS68470=3Dy
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TI_LP87565 is not set
> CONFIG_MFD_TPS65218=3Dm
> CONFIG_MFD_TPS6586X=3Dy
> CONFIG_MFD_TPS65910=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dm
> CONFIG_MFD_LM3533=3Dm
> CONFIG_MFD_TIMBERDALE=3Dm
> CONFIG_MFD_TC3589X=3Dy
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dm
> # CONFIG_MFD_CS47L24 is not set
> # CONFIG_MFD_WM5102 is not set
> CONFIG_MFD_WM5110=3Dy
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=3Dy
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dm
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> CONFIG_REGULATOR_88PM8607=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> # CONFIG_REGULATOR_ACT8945A is not set
> CONFIG_REGULATOR_AD5398=3Dy
> # CONFIG_REGULATOR_ANATOP is not set
> CONFIG_REGULATOR_AS3722=3Dy
> CONFIG_REGULATOR_BCM590XX=3Dm
> CONFIG_REGULATOR_BD9571MWV=3Dm
> # CONFIG_REGULATOR_DA9055 is not set
> CONFIG_REGULATOR_DA9062=3Dy
> CONFIG_REGULATOR_DA9063=3Dm
> CONFIG_REGULATOR_DA9210=3Dm
> # CONFIG_REGULATOR_DA9211 is not set
> # CONFIG_REGULATOR_FAN53555 is not set
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_HI6421=3Dy
> CONFIG_REGULATOR_HI6421V530=3Dy
> CONFIG_REGULATOR_ISL9305=3Dm
> CONFIG_REGULATOR_ISL6271A=3Dm
> CONFIG_REGULATOR_LM363X=3Dm
> CONFIG_REGULATOR_LP3971=3Dy
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_LTC3676 is not set
> # CONFIG_REGULATOR_MAX14577 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX77620=3Dy
> CONFIG_REGULATOR_MAX8649=3Dm
> CONFIG_REGULATOR_MAX8660=3Dy
> # CONFIG_REGULATOR_MAX8925 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8973=3Dm
> CONFIG_REGULATOR_MAX8998=3Dy
> # CONFIG_REGULATOR_MAX77693 is not set
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> CONFIG_REGULATOR_MC13783=3Dm
> CONFIG_REGULATOR_MC13892=3Dm
> # CONFIG_REGULATOR_MT6311 is not set
> CONFIG_REGULATOR_MT6323=3Dm
> CONFIG_REGULATOR_MT6397=3Dm
> CONFIG_REGULATOR_PCF50633=3Dm
> # CONFIG_REGULATOR_PFUZE100 is not set
> # CONFIG_REGULATOR_PV88060 is not set
> CONFIG_REGULATOR_PV88080=3Dy
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_RK808=3Dm
> CONFIG_REGULATOR_RN5T618=3Dy
> # CONFIG_REGULATOR_RT5033 is not set
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_TPS51632=3Dm
> CONFIG_REGULATOR_TPS6105X=3Dy
> CONFIG_REGULATOR_TPS62360=3Dm
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=3Dy
> # CONFIG_REGULATOR_TPS65086 is not set
> # CONFIG_REGULATOR_TPS65132 is not set
> CONFIG_REGULATOR_TPS65217=3Dm
> CONFIG_REGULATOR_TPS65218=3Dm
> # CONFIG_REGULATOR_TPS6586X is not set
> CONFIG_REGULATOR_TPS65910=3Dm
> # CONFIG_REGULATOR_TPS80031 is not set
> CONFIG_REGULATOR_TWL4030=3Dy
> CONFIG_REGULATOR_VCTRL=3Dm
> CONFIG_REGULATOR_WM8350=3Dy
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_CEC_CORE=3Dm
> CONFIG_CEC_PIN=3Dy
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dm
> # CONFIG_RC_DECODERS is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=3Dm
> CONFIG_IR_HIX5HD2=3Dy
> # CONFIG_IR_IMON is not set
> CONFIG_IR_MCEUSB=3Dm
> CONFIG_IR_ITE_CIR=3Dm
> CONFIG_IR_FINTEK=3Dy
> CONFIG_IR_NUVOTON=3Dy
> # CONFIG_IR_REDRAT3 is not set
> # CONFIG_IR_STREAMZAP is not set
> # CONFIG_IR_WINBOND_CIR is not set
> CONFIG_IR_IGORPLUGUSB=3Dy
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> # CONFIG_RC_LOOPBACK is not set
> CONFIG_IR_GPIO_CIR=3Dm
> CONFIG_IR_SERIAL=3Dy
> # CONFIG_IR_SERIAL_TRANSMITTER is not set
> CONFIG_IR_SIR=3Dm
> CONFIG_MEDIA_SUPPORT=3Dm
> =

> #
> # Multimedia core support
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> CONFIG_MEDIA_CEC_RC=3Dy
> CONFIG_VIDEO_DEV=3Dm
> CONFIG_VIDEO_V4L2=3Dm
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_VIDEOBUF2_CORE=3Dm
> CONFIG_VIDEOBUF2_MEMOPS=3Dm
> CONFIG_VIDEOBUF2_VMALLOC=3Dm
> # CONFIG_TTPCI_EEPROM is not set
> =

> #
> # Media drivers
> #
> CONFIG_MEDIA_USB_SUPPORT=3Dy
> =

> #
> # Software defined radio USB devices
> #
> CONFIG_USB_AIRSPY=3Dm
> # CONFIG_USB_HACKRF is not set
> =

> #
> # USB HDMI CEC adapters
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_CEC_PLATFORM_DRIVERS=3Dy
> CONFIG_CEC_GPIO=3Dm
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_CYPRESS_FIRMWARE=3Dm
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # Audio decoders, processors and mixers
> #
> =

> #
> # RDS decoders
> #
> =

> #
> # Video decoders
> #
> =

> #
> # Video and audio decoders
> #
> =

> #
> # Video encoders
> #
> =

> #
> # Camera sensor devices
> #
> =

> #
> # Flash devices
> #
> =

> #
> # Video improvement chips
> #
> =

> #
> # Audio/Video compression chips
> #
> =

> #
> # SDR tuner chips
> #
> =

> #
> # Miscellaneous helper chips
> #
> =

> #
> # Sensors used on soc_camera driver
> #
> CONFIG_MEDIA_TUNER=3Dm
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dm
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> =

> #
> # Tools to develop new frontends
> #
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dm
> # CONFIG_AGP_ALI is not set
> # CONFIG_AGP_ATI is not set
> CONFIG_AGP_AMD=3Dm
> CONFIG_AGP_AMD64=3Dm
> # CONFIG_AGP_INTEL is not set
> # CONFIG_AGP_NVIDIA is not set
> CONFIG_AGP_SIS=3Dm
> CONFIG_AGP_SWORKS=3Dm
> CONFIG_AGP_VIA=3Dm
> # CONFIG_AGP_EFFICEON is not set
> CONFIG_INTEL_GTT=3Dm
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> CONFIG_DRM=3Dm
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> CONFIG_DRM_DEBUG_MM_SELFTEST=3Dm
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dm
> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> CONFIG_DRM_KMS_CMA_HELPER=3Dy
> CONFIG_DRM_VM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dm
> CONFIG_DRM_I2C_SIL164=3Dm
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> CONFIG_DRM_RADEON=3Dm
> CONFIG_DRM_RADEON_USERPTR=3Dy
> CONFIG_DRM_AMDGPU=3Dm
> CONFIG_DRM_AMDGPU_SI=3Dy
> CONFIG_DRM_AMDGPU_CIK=3Dy
> CONFIG_DRM_AMDGPU_USERPTR=3Dy
> # CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_AMD_ACP is not set
> =

> #
> # Display Engine Configuration
> #
> # CONFIG_DRM_AMD_DC is not set
> # CONFIG_DRM_AMD_DC_PRE_VEGA is not set
> =

> #
> # AMD Library routines
> #
> CONFIG_CHASH=3Dm
> CONFIG_CHASH_STATS=3Dy
> CONFIG_CHASH_SELFTEST=3Dy
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dm
> # CONFIG_DRM_I915_ALPHA_SUPPORT is not set
> # CONFIG_DRM_I915_CAPTURE_ERROR is not set
> # CONFIG_DRM_I915_USERPTR is not set
> =

> #
> # drm/i915 Debugging
> #
> # CONFIG_DRM_I915_WERROR is not set
> # CONFIG_DRM_I915_DEBUG is not set
> # CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
> # CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
> # CONFIG_DRM_I915_SELFTEST is not set
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS=3Dy
> # CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
> CONFIG_DRM_VGEM=3Dm
> CONFIG_DRM_VMWGFX=3Dm
> # CONFIG_DRM_VMWGFX_FBCON is not set
> CONFIG_DRM_GMA500=3Dm
> # CONFIG_DRM_GMA600 is not set
> CONFIG_DRM_GMA3600=3Dy
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dm
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> CONFIG_DRM_RCAR_DW_HDMI=3Dm
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> CONFIG_DRM_VIRTIO_GPU=3Dm
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> CONFIG_DRM_PANEL_LVDS=3Dm
> CONFIG_DRM_PANEL_SIMPLE=3Dm
> # CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
> CONFIG_DRM_PANEL_JDI_LT070ME05000=3Dm
> # CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
> # CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
> CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=3Dm
> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dm
> CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=3Dm
> # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
> # CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
> CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=3Dm
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dm
> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dm
> CONFIG_DRM_DUMB_VGA_DAC=3Dm
> # CONFIG_DRM_LVDS_ENCODER is not set
> CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=3Dm
> CONFIG_DRM_NXP_PTN3460=3Dm
> CONFIG_DRM_PARADE_PS8622=3Dm
> CONFIG_DRM_SIL_SII8620=3Dm
> CONFIG_DRM_SII902X=3Dm
> # CONFIG_DRM_SII9234 is not set
> CONFIG_DRM_TOSHIBA_TC358767=3Dm
> # CONFIG_DRM_TI_TFP410 is not set
> CONFIG_DRM_I2C_ADV7511=3Dm
> CONFIG_DRM_I2C_ADV7533=3Dy
> # CONFIG_DRM_I2C_ADV7511_CEC is not set
> CONFIG_DRM_DW_HDMI=3Dm
> # CONFIG_DRM_DW_HDMI_CEC is not set
> CONFIG_DRM_ARCPGU=3Dm
> # CONFIG_DRM_HISI_HIBMC is not set
> CONFIG_DRM_MXS=3Dy
> CONFIG_DRM_MXSFB=3Dm
> # CONFIG_DRM_TINYDRM is not set
> CONFIG_DRM_LEGACY=3Dy
> CONFIG_DRM_TDFX=3Dm
> CONFIG_DRM_R128=3Dm
> # CONFIG_DRM_MGA is not set
> CONFIG_DRM_SIS=3Dm
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dm
> CONFIG_FB_SVGALIB=3Dy
> # CONFIG_FB_MACMODES is not set
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> CONFIG_FB_PM2=3Dm
> CONFIG_FB_PM2_FIFO_DISCONNECT=3Dy
> CONFIG_FB_CYBER2000=3Dm
> # CONFIG_FB_CYBER2000_DDC is not set
> CONFIG_FB_ARC=3Dm
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_VESA is not set
> CONFIG_FB_N411=3Dm
> CONFIG_FB_HGA=3Dm
> CONFIG_FB_OPENCORES=3Dy
> # CONFIG_FB_S1D13XXX is not set
> CONFIG_FB_NVIDIA=3Dm
> # CONFIG_FB_NVIDIA_I2C is not set
> CONFIG_FB_NVIDIA_DEBUG=3Dy
> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> CONFIG_FB_RIVA=3Dy
> CONFIG_FB_RIVA_I2C=3Dy
> CONFIG_FB_RIVA_DEBUG=3Dy
> # CONFIG_FB_RIVA_BACKLIGHT is not set
> # CONFIG_FB_I740 is not set
> CONFIG_FB_LE80578=3Dm
> CONFIG_FB_CARILLO_RANCH=3Dm
> # CONFIG_FB_MATROX is not set
> CONFIG_FB_RADEON=3Dy
> # CONFIG_FB_RADEON_I2C is not set
> CONFIG_FB_RADEON_BACKLIGHT=3Dy
> # CONFIG_FB_RADEON_DEBUG is not set
> CONFIG_FB_ATY128=3Dm
> # CONFIG_FB_ATY128_BACKLIGHT is not set
> CONFIG_FB_ATY=3Dy
> # CONFIG_FB_ATY_CT is not set
> # CONFIG_FB_ATY_GX is not set
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> CONFIG_FB_S3=3Dy
> CONFIG_FB_S3_DDC=3Dy
> # CONFIG_FB_SAVAGE is not set
> CONFIG_FB_SIS=3Dy
> CONFIG_FB_SIS_300=3Dy
> # CONFIG_FB_SIS_315 is not set
> # CONFIG_FB_VIA is not set
> CONFIG_FB_NEOMAGIC=3Dm
> # CONFIG_FB_KYRO is not set
> CONFIG_FB_3DFX=3Dm
> # CONFIG_FB_3DFX_ACCEL is not set
> # CONFIG_FB_3DFX_I2C is not set
> CONFIG_FB_VOODOO1=3Dm
> CONFIG_FB_VT8623=3Dm
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> CONFIG_FB_PM3=3Dy
> CONFIG_FB_CARMINE=3Dm
> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> # CONFIG_FB_GEODE is not set
> # CONFIG_FB_SM501 is not set
> CONFIG_FB_SMSCUFX=3Dy
> CONFIG_FB_UDL=3Dm
> CONFIG_FB_IBM_GXT4500=3Dy
> CONFIG_FB_GOLDFISH=3Dm
> CONFIG_FB_VIRTUAL=3Dy
> # CONFIG_FB_METRONOME is not set
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> # CONFIG_FB_MB862XX_I2C is not set
> CONFIG_FB_BROADSHEET=3Dm
> # CONFIG_FB_AUO_K190X is not set
> CONFIG_FB_HYPERV=3Dm
> # CONFIG_FB_SIMPLE is not set
> # CONFIG_FB_SSD1307 is not set
> CONFIG_FB_SM712=3Dm
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> # CONFIG_LCD_PLATFORM is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> # CONFIG_BACKLIGHT_LM3533 is not set
> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dm
> CONFIG_BACKLIGHT_MAX8925=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> # CONFIG_BACKLIGHT_PM8941_WLED is not set
> CONFIG_BACKLIGHT_SAHARA=3Dm
> # CONFIG_BACKLIGHT_ADP5520 is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dm
> CONFIG_BACKLIGHT_88PM860X=3Dm
> CONFIG_BACKLIGHT_PCF50633=3Dm
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_PANDORA=3Dm
> CONFIG_BACKLIGHT_SKY81452=3Dm
> # CONFIG_BACKLIGHT_TPS65217 is not set
> # CONFIG_BACKLIGHT_GPIO is not set
> CONFIG_BACKLIGHT_LV5207LP=3Dm
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> CONFIG_VGASTATE=3Dy
> CONFIG_VIDEOMODE_HELPERS=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dy
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> # CONFIG_HID_ACRUX is not set
> CONFIG_HID_APPLE=3Dm
> CONFIG_HID_ASUS=3Dm
> CONFIG_HID_AUREAL=3Dm
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_CHICONY=3Dm
> CONFIG_HID_CORSAIR=3Dy
> CONFIG_HID_CMEDIA=3Dm
> CONFIG_HID_CYPRESS=3Dm
> # CONFIG_HID_DRAGONRISE is not set
> CONFIG_HID_EMS_FF=3Dm
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_EZKEY is not set
> CONFIG_HID_GEMBIRD=3Dm
> CONFIG_HID_GFRM=3Dm
> CONFIG_HID_KEYTOUCH=3Dy
> # CONFIG_HID_KYE is not set
> # CONFIG_HID_WALTOP is not set
> CONFIG_HID_GYRATION=3Dm
> # CONFIG_HID_ICADE is not set
> # CONFIG_HID_ITE is not set
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LED=3Dy
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> CONFIG_HID_MAGICMOUSE=3Dm
> CONFIG_HID_MAYFLASH=3Dm
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dm
> CONFIG_HID_NTI=3Dy
> CONFIG_HID_ORTEK=3Dy
> CONFIG_HID_PANTHERLORD=3Dm
> # CONFIG_PANTHERLORD_FF is not set
> CONFIG_HID_PETALYNX=3Dm
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LCD=3Dy
> # CONFIG_HID_PICOLCD_LEDS is not set
> CONFIG_HID_PICOLCD_CIR=3Dy
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dm
> CONFIG_HID_SAITEK=3Dm
> CONFIG_HID_SAMSUNG=3Dm
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dm
> # CONFIG_HID_RMI is not set
> CONFIG_HID_GREENASIA=3Dm
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_HYPERV_MOUSE=3Dm
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> # CONFIG_HID_THINGM is not set
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_UDRAW_PS3=3Dy
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dy
> # CONFIG_HID_ZEROPLUS is not set
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> CONFIG_HID_ALPS=3Dy
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
> CONFIG_USB_KBD=3Dm
> CONFIG_USB_MOUSE=3Dm
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dy
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
> # CONFIG_USB_DEFAULT_PERSIST is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> # CONFIG_USB_OTG is not set
> CONFIG_USB_OTG_WHITELIST=3Dy
> # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> # CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
> # CONFIG_USB_MON is not set
> CONFIG_USB_WUSB=3Dy
> # CONFIG_USB_WUSB_CBAF is not set
> =

> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> # CONFIG_USB_XHCI_HCD is not set
> # CONFIG_USB_EHCI_HCD is not set
> CONFIG_USB_OXU210HP_HCD=3Dy
> CONFIG_USB_ISP116X_HCD=3Dy
> CONFIG_USB_ISP1362_HCD=3Dy
> CONFIG_USB_FOTG210_HCD=3Dm
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> CONFIG_USB_UHCI_HCD=3Dm
> CONFIG_USB_SL811_HCD=3Dy
> # CONFIG_USB_SL811_HCD_ISO is not set
> CONFIG_USB_R8A66597_HCD=3Dm
> CONFIG_USB_WHCI_HCD=3Dm
> CONFIG_USB_HWA_HCD=3Dm
> # CONFIG_USB_HCD_SSB is not set
> CONFIG_USB_HCD_TEST_MODE=3Dy
> =

> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> CONFIG_USB_PRINTER=3Dy
> CONFIG_USB_WDM=3Dy
> # CONFIG_USB_TMC is not set
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
> CONFIG_USB_MDC800=3Dm
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> CONFIG_USB_DWC2=3Dy
> CONFIG_USB_DWC2_HOST=3Dy
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> CONFIG_USB_DWC2_PCI=3Dm
> CONFIG_USB_DWC2_DEBUG=3Dy
> CONFIG_USB_DWC2_VERBOSE=3Dy
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> # CONFIG_USB_DWC2_DEBUG_PERIODIC is not set
> CONFIG_USB_ISP1760=3Dy
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1760_HOST_ROLE=3Dy
> =

> #
> # USB port drivers
> #
> CONFIG_USB_USS720=3Dy
> # CONFIG_USB_SERIAL is not set
> =

> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dm
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> CONFIG_USB_SEVSEG=3Dy
> CONFIG_USB_RIO500=3Dm
> CONFIG_USB_LEGOTOWER=3Dm
> CONFIG_USB_LCD=3Dy
> CONFIG_USB_CYPRESS_CY7C63=3Dy
> # CONFIG_USB_CYTHERM is not set
> CONFIG_USB_IDMOUSE=3Dy
> # CONFIG_USB_FTDI_ELAN is not set
> CONFIG_USB_APPLEDISPLAY=3Dy
> # CONFIG_USB_LD is not set
> CONFIG_USB_TRANCEVIBRATOR=3Dy
> CONFIG_USB_IOWARRIOR=3Dm
> CONFIG_USB_TEST=3Dy
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> # CONFIG_USB_EZUSB_FX2 is not set
> # CONFIG_USB_HUB_USB251XB is not set
> CONFIG_USB_HSIC_USB3503=3Dm
> # CONFIG_USB_HSIC_USB4604 is not set
> CONFIG_USB_LINK_LAYER_TEST=3Dy
> # CONFIG_USB_CHAOSKEY is not set
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> CONFIG_USB_GPIO_VBUS=3Dy
> CONFIG_TAHVO_USB=3Dm
> # CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
> # CONFIG_USB_ISP1301 is not set
> # CONFIG_USB_GADGET is not set
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> CONFIG_TYPEC=3Dy
> # CONFIG_TYPEC_TCPM is not set
> CONFIG_TYPEC_UCSI=3Dy
> CONFIG_UCSI_ACPI=3Dm
> CONFIG_TYPEC_TPS6598X=3Dm
> CONFIG_USB_LED_TRIG=3Dy
> CONFIG_USB_ULPI_BUS=3Dy
> CONFIG_UWB=3Dy
> CONFIG_UWB_HWA=3Dy
> CONFIG_UWB_WHCI=3Dm
> # CONFIG_UWB_I1480U is not set
> CONFIG_MMC=3Dy
> # CONFIG_PWRSEQ_EMMC is not set
> CONFIG_PWRSEQ_SIMPLE=3Dm
> # CONFIG_SDIO_UART is not set
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dm
> CONFIG_MMC_SDHCI_PCI=3Dm
> # CONFIG_MMC_RICOH_MMC is not set
> CONFIG_MMC_SDHCI_ACPI=3Dm
> CONFIG_MMC_SDHCI_PLTFM=3Dm
> CONFIG_MMC_SDHCI_OF_ARASAN=3Dm
> CONFIG_MMC_SDHCI_OF_AT91=3Dm
> CONFIG_MMC_SDHCI_CADENCE=3Dm
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> CONFIG_MMC_WBSD=3Dm
> CONFIG_MMC_TIFM_SD=3Dm
> # CONFIG_MMC_GOLDFISH is not set
> # CONFIG_MMC_CB710 is not set
> CONFIG_MMC_VIA_SDMMC=3Dy
> CONFIG_MMC_VUB300=3Dm
> # CONFIG_MMC_USHC is not set
> CONFIG_MMC_USDHI6ROL0=3Dm
> # CONFIG_MMC_TOSHIBA_PCI is not set
> CONFIG_MMC_MTK=3Dy
> CONFIG_MMC_SDHCI_XENON=3Dm
> CONFIG_MMC_SDHCI_OMAP=3Dm
> CONFIG_MEMSTICK=3Dm
> # CONFIG_MEMSTICK_DEBUG is not set
> =

> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> =

> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=3Dm
> CONFIG_MEMSTICK_JMICRON_38X=3Dm
> CONFIG_MEMSTICK_R592=3Dm
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dm
> CONFIG_LEDS_BCM6328=3Dy
> CONFIG_LEDS_BCM6358=3Dm
> # CONFIG_LEDS_LM3530 is not set
> CONFIG_LEDS_LM3533=3Dm
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_MT6323=3Dm
> CONFIG_LEDS_PCA9532=3Dm
> # CONFIG_LEDS_PCA9532_GPIO is not set
> CONFIG_LEDS_GPIO=3Dy
> CONFIG_LEDS_LP3944=3Dm
> CONFIG_LEDS_LP3952=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=3Dy
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dy
> CONFIG_LEDS_LP8860=3Dm
> CONFIG_LEDS_PCA955X=3Dm
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=3Dy
> CONFIG_LEDS_WM8350=3Dm
> # CONFIG_LEDS_REGULATOR is not set
> CONFIG_LEDS_BD2802=3Dy
> CONFIG_LEDS_LT3593=3Dy
> # CONFIG_LEDS_ADP5520 is not set
> CONFIG_LEDS_MC13783=3Dm
> CONFIG_LEDS_TCA6507=3Dm
> CONFIG_LEDS_TLC591XX=3Dm
> CONFIG_LEDS_LM355x=3Dm
> CONFIG_LEDS_OT200=3Dy
> CONFIG_LEDS_MENF21BMC=3Dm
> CONFIG_LEDS_IS31FL319X=3Dy
> CONFIG_LEDS_IS31FL32XX=3Dm
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> # CONFIG_LEDS_SYSCON is not set
> # CONFIG_LEDS_USER is not set
> CONFIG_LEDS_NIC78BX=3Dm
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> CONFIG_ACCESSIBILITY=3Dy
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dm
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> CONFIG_EDAC_DEBUG=3Dy
> CONFIG_EDAC_AMD76X=3Dm
> CONFIG_EDAC_E7XXX=3Dm
> # CONFIG_EDAC_E752X is not set
> CONFIG_EDAC_I82875P=3Dm
> CONFIG_EDAC_I82975X=3Dm
> CONFIG_EDAC_I3000=3Dm
> # CONFIG_EDAC_I3200 is not set
> # CONFIG_EDAC_IE31200 is not set
> CONFIG_EDAC_X38=3Dm
> # CONFIG_EDAC_I5400 is not set
> CONFIG_EDAC_I82860=3Dm
> # CONFIG_EDAC_R82600 is not set
> CONFIG_EDAC_I5000=3Dm
> CONFIG_EDAC_I5100=3Dm
> # CONFIG_EDAC_I7300 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> CONFIG_DMA_OF=3Dy
> CONFIG_ALTERA_MSGDMA=3Dy
> CONFIG_FSL_EDMA=3Dm
> # CONFIG_INTEL_IDMA64 is not set
> CONFIG_PCH_DMA=3Dm
> CONFIG_TIMB_DMA=3Dm
> # CONFIG_QCOM_HIDMA_MGMT is not set
> CONFIG_QCOM_HIDMA=3Dm
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dm
> CONFIG_DW_DMAC_PCI=3Dy
> CONFIG_HSU_DMA=3Dy
> =

> #
> # DMA Clients
> #
> # CONFIG_ASYNC_TX_DMA is not set
> # CONFIG_DMATEST is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_HD44780=3Dy
> # CONFIG_KS0108 is not set
> CONFIG_IMG_ASCII_LCD=3Dy
> CONFIG_HT16K33=3Dm
> CONFIG_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> # CONFIG_UIO_AEC is not set
> CONFIG_UIO_SERCOS3=3Dm
> CONFIG_UIO_PCI_GENERIC=3Dm
> CONFIG_UIO_NETX=3Dm
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> # CONFIG_UIO_HV_GENERIC is not set
> CONFIG_VFIO_IOMMU_TYPE1=3Dy
> CONFIG_VFIO_VIRQFD=3Dy
> CONFIG_VFIO=3Dy
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI=3Dy
> # CONFIG_VFIO_PCI_VGA is not set
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> CONFIG_VFIO_PCI_IGD=3Dy
> CONFIG_VFIO_MDEV=3Dy
> CONFIG_VFIO_MDEV_DEVICE=3Dy
> CONFIG_IRQ_BYPASS_MANAGER=3Dy
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_INPUT=3Dm
> CONFIG_VIRTIO_MMIO=3Dm
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dm
> # CONFIG_HYPERV_TSCPAGE is not set
> CONFIG_HYPERV_BALLOON=3Dm
> CONFIG_STAGING=3Dy
> # CONFIG_IRDA is not set
> CONFIG_COMEDI=3Dy
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> # CONFIG_COMEDI_MISC_DRIVERS is not set
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> # CONFIG_COMEDI_PCL711 is not set
> CONFIG_COMEDI_PCL724=3Dm
> CONFIG_COMEDI_PCL726=3Dm
> CONFIG_COMEDI_PCL730=3Dm
> # CONFIG_COMEDI_PCL812 is not set
> CONFIG_COMEDI_PCL816=3Dm
> CONFIG_COMEDI_PCL818=3Dm
> CONFIG_COMEDI_PCM3724=3Dy
> CONFIG_COMEDI_AMPLC_DIO200_ISA=3Dm
> CONFIG_COMEDI_AMPLC_PC236_ISA=3Dm
> CONFIG_COMEDI_AMPLC_PC263_ISA=3Dy
> # CONFIG_COMEDI_RTI800 is not set
> CONFIG_COMEDI_RTI802=3Dy
> CONFIG_COMEDI_DAC02=3Dy
> CONFIG_COMEDI_DAS16M1=3Dm
> # CONFIG_COMEDI_DAS08_ISA is not set
> CONFIG_COMEDI_DAS16=3Dy
> # CONFIG_COMEDI_DAS800 is not set
> # CONFIG_COMEDI_DAS1800 is not set
> CONFIG_COMEDI_DAS6402=3Dy
> CONFIG_COMEDI_DT2801=3Dm
> # CONFIG_COMEDI_DT2811 is not set
> CONFIG_COMEDI_DT2814=3Dy
> CONFIG_COMEDI_DT2815=3Dy
> CONFIG_COMEDI_DT2817=3Dy
> CONFIG_COMEDI_DT282X=3Dm
> CONFIG_COMEDI_DMM32AT=3Dm
> CONFIG_COMEDI_FL512=3Dy
> CONFIG_COMEDI_AIO_AIO12_8=3Dy
> CONFIG_COMEDI_AIO_IIRO_16=3Dy
> # CONFIG_COMEDI_II_PCI20KC is not set
> CONFIG_COMEDI_C6XDIGIO=3Dy
> CONFIG_COMEDI_MPC624=3Dy
> CONFIG_COMEDI_ADQ12B=3Dy
> CONFIG_COMEDI_NI_AT_A2150=3Dm
> CONFIG_COMEDI_NI_AT_AO=3Dy
> CONFIG_COMEDI_NI_ATMIO=3Dy
> CONFIG_COMEDI_NI_ATMIO16D=3Dy
> # CONFIG_COMEDI_NI_LABPC_ISA is not set
> CONFIG_COMEDI_PCMAD=3Dy
> # CONFIG_COMEDI_PCMDA12 is not set
> CONFIG_COMEDI_PCMMIO=3Dm
> CONFIG_COMEDI_PCMUIO=3Dy
> CONFIG_COMEDI_MULTIQ3=3Dy
> CONFIG_COMEDI_S526=3Dy
> CONFIG_COMEDI_PCI_DRIVERS=3Dm
> CONFIG_COMEDI_8255_PCI=3Dm
> CONFIG_COMEDI_ADDI_WATCHDOG=3Dm
> CONFIG_COMEDI_ADDI_APCI_1032=3Dm
> CONFIG_COMEDI_ADDI_APCI_1500=3Dm
> CONFIG_COMEDI_ADDI_APCI_1516=3Dm
> # CONFIG_COMEDI_ADDI_APCI_1564 is not set
> CONFIG_COMEDI_ADDI_APCI_16XX=3Dm
> # CONFIG_COMEDI_ADDI_APCI_2032 is not set
> CONFIG_COMEDI_ADDI_APCI_2200=3Dm
> # CONFIG_COMEDI_ADDI_APCI_3120 is not set
> CONFIG_COMEDI_ADDI_APCI_3501=3Dm
> # CONFIG_COMEDI_ADDI_APCI_3XXX is not set
> CONFIG_COMEDI_ADL_PCI6208=3Dm
> CONFIG_COMEDI_ADL_PCI7X3X=3Dm
> CONFIG_COMEDI_ADL_PCI8164=3Dm
> CONFIG_COMEDI_ADL_PCI9111=3Dm
> CONFIG_COMEDI_ADL_PCI9118=3Dm
> CONFIG_COMEDI_ADV_PCI1710=3Dm
> # CONFIG_COMEDI_ADV_PCI1720 is not set
> CONFIG_COMEDI_ADV_PCI1723=3Dm
> CONFIG_COMEDI_ADV_PCI1724=3Dm
> # CONFIG_COMEDI_ADV_PCI1760 is not set
> CONFIG_COMEDI_ADV_PCI_DIO=3Dm
> CONFIG_COMEDI_AMPLC_DIO200_PCI=3Dm
> # CONFIG_COMEDI_AMPLC_PC236_PCI is not set
> CONFIG_COMEDI_AMPLC_PC263_PCI=3Dm
> CONFIG_COMEDI_AMPLC_PCI224=3Dm
> CONFIG_COMEDI_AMPLC_PCI230=3Dm
> CONFIG_COMEDI_CONTEC_PCI_DIO=3Dm
> # CONFIG_COMEDI_DAS08_PCI is not set
> CONFIG_COMEDI_DT3000=3Dm
> CONFIG_COMEDI_DYNA_PCI10XX=3Dm
> # CONFIG_COMEDI_GSC_HPDI is not set
> # CONFIG_COMEDI_MF6X4 is not set
> CONFIG_COMEDI_ICP_MULTI=3Dm
> # CONFIG_COMEDI_DAQBOARD2000 is not set
> CONFIG_COMEDI_JR3_PCI=3Dm
> CONFIG_COMEDI_KE_COUNTER=3Dm
> # CONFIG_COMEDI_CB_PCIDAS64 is not set
> CONFIG_COMEDI_CB_PCIDAS=3Dm
> CONFIG_COMEDI_CB_PCIDDA=3Dm
> CONFIG_COMEDI_CB_PCIMDAS=3Dm
> CONFIG_COMEDI_CB_PCIMDDA=3Dm
> # CONFIG_COMEDI_ME4000 is not set
> CONFIG_COMEDI_ME_DAQ=3Dm
> # CONFIG_COMEDI_NI_6527 is not set
> CONFIG_COMEDI_NI_65XX=3Dm
> # CONFIG_COMEDI_NI_660X is not set
> CONFIG_COMEDI_NI_670X=3Dm
> # CONFIG_COMEDI_NI_LABPC_PCI is not set
> # CONFIG_COMEDI_NI_PCIDIO is not set
> CONFIG_COMEDI_NI_PCIMIO=3Dm
> CONFIG_COMEDI_RTD520=3Dm
> # CONFIG_COMEDI_S626 is not set
> CONFIG_COMEDI_MITE=3Dm
> CONFIG_COMEDI_NI_TIOCMD=3Dm
> CONFIG_COMEDI_USB_DRIVERS=3Dm
> CONFIG_COMEDI_DT9812=3Dm
> CONFIG_COMEDI_NI_USB6501=3Dm
> CONFIG_COMEDI_USBDUX=3Dm
> CONFIG_COMEDI_USBDUXFAST=3Dm
> CONFIG_COMEDI_USBDUXSIGMA=3Dm
> CONFIG_COMEDI_VMK80XX=3Dm
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dy
> # CONFIG_COMEDI_KCOMEDILIB is not set
> CONFIG_COMEDI_AMPLC_DIO200=3Dm
> CONFIG_COMEDI_AMPLC_PC236=3Dm
> CONFIG_COMEDI_ISADMA=3Dy
> CONFIG_COMEDI_NI_TIO=3Dy
> CONFIG_FB_OLPC_DCON=3Dy
> CONFIG_FB_OLPC_DCON_1_5=3Dy
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_R8712U is not set
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
> CONFIG_ASHMEM=3Dy
> CONFIG_ION=3Dy
> CONFIG_ION_SYSTEM_HEAP=3Dy
> # CONFIG_ION_CARVEOUT_HEAP is not set
> # CONFIG_ION_CHUNK_HEAP is not set
> # CONFIG_STAGING_BOARD is not set
> # CONFIG_LTE_GDM724X is not set
> # CONFIG_FIREWIRE_SERIAL is not set
> # CONFIG_GOLDFISH_AUDIO is not set
> CONFIG_MTD_GOLDFISH_NAND=3Dm
> # CONFIG_LNET is not set
> # CONFIG_DGNC is not set
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
> # CONFIG_MOST is not set
> # CONFIG_KS7010 is not set
> # CONFIG_GREYBUS is not set
> CONFIG_CRYPTO_DEV_CCREE=3Dy
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> CONFIG_DRM_VBOXVIDEO=3Dm
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_GOLDFISH_BUS=3Dy
> # CONFIG_GOLDFISH_PIPE is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> CONFIG_CROS_EC_CHARDEV=3Dm
> # CONFIG_CROS_EC_LPC is not set
> CONFIG_CROS_EC_PROTO=3Dy
> CONFIG_CROS_KBD_LED_BACKLIGHT=3Dy
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> CONFIG_CLK_HSDK=3Dy
> # CONFIG_COMMON_CLK_MAX77686 is not set
> CONFIG_COMMON_CLK_RK808=3Dm
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI514 is not set
> CONFIG_COMMON_CLK_SI570=3Dm
> CONFIG_COMMON_CLK_CDCE706=3Dm
> # CONFIG_COMMON_CLK_CDCE925 is not set
> CONFIG_COMMON_CLK_CS2000_CP=3Dm
> # CONFIG_COMMON_CLK_NXP is not set
> # CONFIG_COMMON_CLK_PXA is not set
> # CONFIG_COMMON_CLK_PIC32 is not set
> CONFIG_COMMON_CLK_VC5=3Dm
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_MAILBOX is not set
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_OF_IOMMU=3Dy
> CONFIG_DMAR_TABLE=3Dy
> CONFIG_INTEL_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU_SVM is not set
> CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dy
> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
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
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_GPIO=3Dy
> CONFIG_EXTCON_INTEL_INT3496=3Dy
> CONFIG_EXTCON_INTEL_CHT_WC=3Dm
> CONFIG_EXTCON_MAX14577=3Dm
> # CONFIG_EXTCON_MAX3355 is not set
> CONFIG_EXTCON_MAX77693=3Dm
> CONFIG_EXTCON_MAX77843=3Dm
> CONFIG_EXTCON_RT8973A=3Dm
> CONFIG_EXTCON_SM5502=3Dm
> CONFIG_EXTCON_USB_GPIO=3Dm
> CONFIG_EXTCON_USBC_CROS_EC=3Dm
> CONFIG_MEMORY=3Dy
> # CONFIG_IIO is not set
> # CONFIG_NTB is not set
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> CONFIG_VME_CA91CX42=3Dm
> # CONFIG_VME_TSI148 is not set
> CONFIG_VME_FAKE=3Dy
> =

> #
> # VME Board Drivers
> #
> CONFIG_VMIVME_7805=3Dm
> =

> #
> # VME Device Drivers
> #
> CONFIG_VME_USER=3Dm
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=3Dy
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_ARM_GIC_V3_ITS is not set
> CONFIG_IPACK_BUS=3Dm
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> # CONFIG_RESET_ATH79 is not set
> # CONFIG_RESET_AXS10X is not set
> # CONFIG_RESET_BERLIN is not set
> # CONFIG_RESET_IMX7 is not set
> # CONFIG_RESET_LANTIQ is not set
> # CONFIG_RESET_LPC18XX is not set
> # CONFIG_RESET_MESON is not set
> # CONFIG_RESET_PISTACHIO is not set
> # CONFIG_RESET_SIMPLE is not set
> # CONFIG_RESET_SUNXI is not set
> # CONFIG_RESET_TI_SYSCON is not set
> # CONFIG_RESET_ZYNQ is not set
> # CONFIG_RESET_TEGRA_BPMP is not set
> CONFIG_FMC=3Dm
> CONFIG_FMC_FAKEDEV=3Dm
> CONFIG_FMC_TRIVIAL=3Dm
> # CONFIG_FMC_WRITE_EEPROM is not set
> # CONFIG_FMC_CHARDEV is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dm
> CONFIG_PHY_PXA_28NM_HSIC=3Dm
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> CONFIG_PHY_QCOM_USB_HS=3Dm
> # CONFIG_PHY_QCOM_USB_HSIC is not set
> # CONFIG_PHY_SAMSUNG_USB2 is not set
> CONFIG_PHY_TUSB1210=3Dy
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> CONFIG_RAS=3Dy
> CONFIG_THUNDERBOLT=3Dm
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> CONFIG_ANDROID_BINDER_DEVICES=3D"binder,hwbinder,vndbinder"
> CONFIG_ANDROID_BINDER_IPC_32BIT=3Dy
> CONFIG_ANDROID_BINDER_IPC_SELFTEST=3Dy
> # CONFIG_DAX is not set
> CONFIG_NVMEM=3Dm
> CONFIG_STM=3Dm
> CONFIG_STM_DUMMY=3Dm
> CONFIG_STM_SOURCE_CONSOLE=3Dm
> # CONFIG_STM_SOURCE_HEARTBEAT is not set
> CONFIG_INTEL_TH=3Dm
> CONFIG_INTEL_TH_PCI=3Dm
> CONFIG_INTEL_TH_GTH=3Dm
> # CONFIG_INTEL_TH_STH is not set
> CONFIG_INTEL_TH_MSU=3Dm
> CONFIG_INTEL_TH_PTI=3Dm
> # CONFIG_INTEL_TH_DEBUG is not set
> # CONFIG_FPGA is not set
> =

> #
> # FSI support
> #
> # CONFIG_FSI is not set
> =

> #
> # Firmware Drivers
> #
> # CONFIG_EDD is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> # CONFIG_FW_CFG_SYSFS is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> CONFIG_UEFI_CPER=3Dy
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
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dm
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> # CONFIG_PRINT_QUOTA_WARNING is not set
> CONFIG_QUOTA_DEBUG=3Dy
> CONFIG_QUOTA_TREE=3Dy
> CONFIG_QFMT_V1=3Dy
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> # CONFIG_CUSE is not set
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_VMCORE=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> CONFIG_ECRYPT_FS=3Dy
> CONFIG_ECRYPT_FS_MESSAGING=3Dy
> CONFIG_JFFS2_FS=3Dm
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> CONFIG_JFFS2_SUMMARY=3Dy
> # CONFIG_JFFS2_FS_XATTR is not set
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> # CONFIG_JFFS2_LZO is not set
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> CONFIG_UBIFS_FS=3Dm
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> # CONFIG_UBIFS_ATIME_SUPPORT is not set
> CONFIG_UBIFS_FS_SECURITY=3Dy
> CONFIG_CRAMFS=3Dm
> CONFIG_CRAMFS_MTD=3Dy
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dm
> # CONFIG_PSTORE_ZLIB_COMPRESS is not set
> CONFIG_PSTORE_LZO_COMPRESS=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_CONSOLE is not set
> CONFIG_PSTORE_PMSG=3Dy
> CONFIG_PSTORE_RAM=3Dm
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dm
> CONFIG_NFS_V2=3Dm
> CONFIG_NFS_V3=3Dm
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dm
> CONFIG_LOCKD=3Dm
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dm
> CONFIG_SUNRPC_GSS=3Dm
> CONFIG_RPCSEC_GSS_KRB5=3Dm
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
> # CONFIG_NCP_FS is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dm
> # CONFIG_NLS_CODEPAGE_850 is not set
> CONFIG_NLS_CODEPAGE_852=3Dm
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dy
> # CONFIG_NLS_CODEPAGE_860 is not set
> CONFIG_NLS_CODEPAGE_861=3Dy
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dm
> # CONFIG_NLS_CODEPAGE_865 is not set
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dm
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dm
> CONFIG_NLS_CODEPAGE_874=3Dm
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dm
> # CONFIG_NLS_ISO8859_2 is not set
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> # CONFIG_NLS_KOI8_U is not set
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> # CONFIG_NLS_MAC_CENTEURO is not set
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dy
> # CONFIG_NLS_MAC_GREEK is not set
> CONFIG_NLS_MAC_ICELAND=3Dy
> # CONFIG_NLS_MAC_INUIT is not set
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> # CONFIG_NLS_UTF8 is not set
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
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> # CONFIG_DYNAMIC_DEBUG is not set
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
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
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
> CONFIG_DEBUG_PAGEALLOC=3Dy
> CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
> # CONFIG_PAGE_POISONING_ZERO is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> CONFIG_DEBUG_VM_RB=3Dy
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_HIGHMEM is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> # CONFIG_DEBUG_PREEMPT is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCK_STAT=3Dy
> CONFIG_LOCKDEP_CROSSRELEASE=3Dy
> CONFIG_LOCKDEP_COMPLETIONS=3Dy
> # CONFIG_BOOTPARAM_LOCKDEP_CROSSRELEASE_FULLSTACK is not set
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dy
> # CONFIG_WW_MUTEX_SELFTEST is not set
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PI_LIST is not set
> CONFIG_DEBUG_SG=3Dy
> # CONFIG_DEBUG_NOTIFIERS is not set
> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_PERF_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> CONFIG_RCU_EQS_DEBUG=3Dy
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dm
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm
> CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=3Dm
> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_DMA_API_DEBUG is not set
> =

> #
> # Runtime Testing
> #
> # CONFIG_TEST_LIST_SORT is not set
> CONFIG_TEST_SORT=3Dm
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> CONFIG_INTERVAL_TREE_TEST=3Dy
> CONFIG_PERCPU_TEST=3Dm
> CONFIG_ATOMIC64_SELFTEST=3Dm
> # CONFIG_TEST_HEXDUMP is not set
> CONFIG_TEST_STRING_HELPERS=3Dy
> CONFIG_TEST_KSTRTOX=3Dm
> CONFIG_TEST_PRINTF=3Dy
> CONFIG_TEST_BITMAP=3Dy
> # CONFIG_TEST_UUID is not set
> CONFIG_TEST_RHASHTABLE=3Dy
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_LKM is not set
> CONFIG_TEST_USER_COPY=3Dm
> # CONFIG_TEST_BPF is not set
> CONFIG_TEST_FIND_BIT=3Dm
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_TEST_UDELAY is not set
> CONFIG_TEST_STATIC_KEYS=3Dm
> # CONFIG_TEST_DEBUG_VIRTUAL is not set
> # CONFIG_MEMTEST is not set
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_UBSAN_NULL=3Dy
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> # CONFIG_STRICT_DEVMEM is not set
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> CONFIG_X86_PTDUMP_CORE=3Dy
> CONFIG_X86_PTDUMP=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_IOMMU_STRESS=3Dy
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
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> CONFIG_UNWINDER_GUESS=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> CONFIG_TRUSTED_KEYS=3Dm
> # CONFIG_ENCRYPTED_KEYS is not set
> CONFIG_KEY_DH_OPERATIONS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> # CONFIG_SECURITY_WRITABLE_HOOKS is not set
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_SECURITY_PATH is not set
> # CONFIG_INTEL_TXT is not set
> # CONFIG_FORTIFY_SOURCE is not set
> CONFIG_STATIC_USERMODEHELPER=3Dy
> CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_YAMA=3Dy
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> # CONFIG_IMA_TEMPLATE is not set
> CONFIG_IMA_NG_TEMPLATE=3Dy
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> CONFIG_IMA_WRITE_POLICY=3Dy
> CONFIG_IMA_READ_POLICY=3Dy
> CONFIG_IMA_APPRAISE=3Dy
> CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
> # CONFIG_IMA_TRUSTED_KEYRING is not set
> # CONFIG_EVM is not set
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
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> # CONFIG_CRYPTO_MCRYPTD is not set
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_SIMD=3Dm
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dm
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dm
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> # CONFIG_CRYPTO_PCBC is not set
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dm
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dm
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> # CONFIG_CRYPTO_CRCT10DIF is not set
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dm
> CONFIG_CRYPTO_RMD256=3Dm
> CONFIG_CRYPTO_RMD320=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dm
> # CONFIG_CRYPTO_SM3 is not set
> CONFIG_CRYPTO_TGR192=3Dm
> # CONFIG_CRYPTO_WP512 is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> CONFIG_CRYPTO_AES_586=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dm
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dm
> CONFIG_CRYPTO_CAST5=3Dm
> # CONFIG_CRYPTO_CAST6 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_KHAZAD=3Dm
> # CONFIG_CRYPTO_SALSA20 is not set
> # CONFIG_CRYPTO_SALSA20_586 is not set
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> CONFIG_CRYPTO_TEA=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> # CONFIG_CRYPTO_TWOFISH_586 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dm
> CONFIG_CRYPTO_LZO=3Dm
> CONFIG_CRYPTO_842=3Dm
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dm
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
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> # CONFIG_CRYPTO_DEV_GEODE is not set
> CONFIG_CRYPTO_DEV_HIFN_795X=3Dy
> CONFIG_CRYPTO_DEV_HIFN_795X_RNG=3Dy
> # CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
> CONFIG_CRYPTO_DEV_CCP=3Dy
> # CONFIG_CRYPTO_DEV_CCP_DD is not set
> CONFIG_CRYPTO_DEV_QAT=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dy
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
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
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
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
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dm
> CONFIG_CRC16=3Dy
> # CONFIG_CRC_T10DIF is not set
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dm
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC4=3Dm
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=3Dm
> CONFIG_842_DECOMPRESS=3Dm
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dm
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dm
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> # CONFIG_XZ_DEC_POWERPC is not set
> # CONFIG_XZ_DEC_IA64 is not set
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_RADIX_TREE_MULTIORDER=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> # CONFIG_DMA_NOOP_OPS is not set
> # CONFIG_DMA_VIRT_OPS is not set
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> CONFIG_DDR=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_LIBFDT=3Dy
> CONFIG_OID_REGISTRY=3Dy
> # CONFIG_SG_SPLIT is not set
> # CONFIG_SG_POOL is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_PRIME_NUMBERS=3Dm
> CONFIG_STRING_SELFTEST=3Dm


--===============0030679435453978762==--

