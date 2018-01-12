Content-Type: multipart/mixed; boundary="===============0725081800219306651=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: a2f2577d96 ("torture: Eliminate torture_runnable and .."): BUG: kernel hang in test stage
Date: Fri, 12 Jan 2018 13:32:08 +0800
Message-ID: <20180112053208.l4yasgp4ckaqkaud@wfg-t540p.sh.intel.com>
In-Reply-To: <20180111195812.GQ9671@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0725081800219306651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, Jan 11, 2018 at 11:58:12AM -0800, Paul E. McKenney wrote:
>On Thu, Jan 11, 2018 at 11:40:30AM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>>
>> commit a2f2577d96ad060b65eb909dd39b57d676754119
>> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> AuthorDate: Tue Nov 21 20:19:17 2017 -0800
>> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> CommitDate: Mon Dec 11 09:18:29 2017 -0800
>>
>>     torture: Eliminate torture_runnable and perf_runnable
>>
>>     The purpose of torture_runnable is to allow rcutorture and locktortu=
re
>>     to be started and stopped via sysfs when they are built into the ker=
nel
>>     (as in not compiled as loadable modules).  However, the 0444 permiss=
ions
>>     for both instances of torture_runnable prevent this use case from ev=
er
>>     being put into practice.  Given that there have been no complaints
>>     about this deficiency, it is reasonable to conclude that no one actu=
ally
>>     makes use of this sysfs capability.  The perf_runnable module parame=
ter
>>     for rcuperf is in the same situation.
>>
>>     This commit therefore removes both torture_runnable instances as well
>>     as perf_runnable.
>>
>>     Reported-by: Thomas Gleixner <tglx@linutronix.de>
>>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
>Ah!  Were you using the perf_runnable module parameter to prevent
>rcuperf from exiting early?

Nope. Sorry it's a false bisect. More boot tests show that the parent
commit suffers from this error, too. Basically the VM hangs at reboot
time:

        [   62.773511] Writes:  Total: 2951365  Max/Min: 0/0   Fail: 0
        [  124.213450] Writes:  Total: 3855884  Max/Min: 0/0   Fail: 0
        procd: - shutdown -
        [  128.697914] br-lan: port 1(eth0) entered disabled state
        [  128.704047] device eth0 left promiscuous mode
        [  128.705123] br-lan: port 1(eth0) entered disabled state
        [  128.765913] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
        procd: - reboot -
        [  128.897917] Unregister pv shared memory for cpu 0
        [  128.898372] spin_lock-torture: Unscheduled system shutdown detec=
ted
        [  129.208111] sd 0:0:0:0: [sda] Synchronizing SCSI cache
        [  129.208943] reboot: Restarting system
        BUG: kernel hang in test stage

        Elapsed time: 1520

Thanks,
Fengguang

>> 4ced3314fd  torture: Make stutter less vulnerable to compilers and races
>> a2f2577d96  torture: Eliminate torture_runnable and perf_runnable
>> b4464bcab3  Add linux-next specific files for 20180110
>> +-------------------------------------------------------+------------+--=
----------+---------------+
>> |                                                       | 4ced3314fd | a=
2f2577d96 | next-20180110 |
>> +-------------------------------------------------------+------------+--=
----------+---------------+
>> | boot_successes                                        | 103        | 4=
4         | 5             |
>> | boot_failures                                         | 0          | 2=
8         | 1             |
>> | BUG:kernel_hang_in_test_stage                         | 0          | 2=
8         | 1             |
>> | WARNING:at_drivers/pci/pci-sysfs.c:#pci_mmap_resource | 0          | 1=
          |               |
>> | EIP:pci_mmap_resource                                 | 0          | 1=
          |               |
>> +-------------------------------------------------------+------------+--=
----------+---------------+
>>
>> procd: - reboot -
>> [  128.897917] Unregister pv shared memory for cpu 0
>> [  128.898372] spin_lock-torture: Unscheduled system shutdown detected
>> [  129.208111] sd 0:0:0:0: [sda] Synchronizing SCSI cache
>> [  129.208943] reboot: Restarting system
>> BUG: kernel hang in test stage
>>
>>
>>                                                           # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start 7730aba20e60e7471f4c4aa2de942b2724beafed 4fbd8d194f06c8=
a3fd2af1ce560ddb31f7ec8323 --
>> git bisect  bad 517642a19ecf5b0496f187eb64d6f127a3645eb3  # 07:32  B    =
 11     3    0  11  doc: Fixed typo in rcutorture documentation
>> git bisect good dc259accec0845ddf56e87337c0b211026eca0ae  # 07:43  G    =
 22     0    0   1  rcu: Account for rcu_all_qs() in cond_resched()
>> git bisect  bad ad0f025fbbd10227bf9222e04672a4b87812fa07  # 08:12  B    =
 15     1    0  11  rcutorture: Replace multi-instance kzalloc() with kcall=
oc()
>> git bisect  bad ad452b6a4fd2efe9fba8e1a79de8fb32b0f43ce7  # 08:54  B    =
 12     1    0   0  rcu: Remove unnecessary spinlock in rcu_boot_init_percp=
u_data()
>> git bisect  bad 1dfa55e01987288d847220b8c027204871440ed1  # 09:29  B    =
 13     3    0   6  Merge branches 'cond_resched.2017.12.04a', 'dyntick.201=
7.11.28a', 'fixes.2017.12.11a', 'srbd.2017.12.05a' and 'torture.2017.12.11a=
' into HEAD
>> git bisect good 3a5db0b108e0a40f08c2bcff6a675dbf632b91e0  # 09:43  G    =
 22     0    0   0  drivers/vhost: Remove now-redundant read_barrier_depend=
s()
>> git bisect  bad 29d3939084583b26a5487be64b9523e61468f1be  # 10:13  B    =
 14     3    0  11  torture: Save a line in stutter_wait(): while -> for
>> git bisect good 512e3bd0b554eb25d8816ab3954e0f39c98e8183  # 10:26  G    =
 23     0    0   0  rcutorture/kvm.sh: Support execution from any directory
>> git bisect good 8f9dd8317386b0bcb20cf0bfc832ba2ea67f44d1  # 10:43  G    =
 23     0    0   0  torture: Place all torture-test modules in one MAINTAIN=
ERS group
>> git bisect good 2ce77d16db4240dd2e422fc0a5c26d3e2ec03446  # 10:48  G    =
 23     0    0   0  locking/locktorture: Fix num reader/writer corner cases
>> git bisect  bad a2f2577d96ad060b65eb909dd39b57d676754119  # 11:19  B    =
 13     3    0  18  torture: Eliminate torture_runnable and perf_runnable
>> git bisect good 4ced3314fd3a73dabac4e8a41747883eff36c3e8  # 11:29  G    =
 21     0    0   0  torture: Make stutter less vulnerable to compilers and =
races
>> # first bad commit: [a2f2577d96ad060b65eb909dd39b57d676754119] torture: =
Eliminate torture_runnable and perf_runnable
>> git bisect good 4ced3314fd3a73dabac4e8a41747883eff36c3e8  # 11:37  G    =
 64     0    0   0  torture: Make stutter less vulnerable to compilers and =
races
>> # extra tests on HEAD of rcu/rcu/dev
>> git bisect  bad 7730aba20e60e7471f4c4aa2de942b2724beafed  # 11:38  B    =
  7     7    0   0  rcu: Remove obsolete force-quiescent-state statistics f=
or debugfs
>> # extra tests on tree/branch linux-next/master
>> git bisect  bad b4464bcab38d3f7fe995a7cb960eeac6889bec08  # 11:40  B    =
  2     1    0   0  Add linux-next specific files for 20180110
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation
>
>
>> #!/bin/bash
>>
>> kernel=3D$1
>> initrd=3Dopenwrt-trinity-i386.cgz
>>
>> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/=
master/openwrt/$initrd
>>
>> kvm=3D(
>> 	qemu-system-x86_64
>> 	-enable-kvm
>> 	-cpu Haswell,+smep
>> 	-kernel $kernel
>> 	-initrd $initrd
>> 	-m 256
>> 	-smp 1
>> 	-device e1000,netdev=3Dnet0
>> 	-netdev user,id=3Dnet0
>> 	-boot order=3Dnc
>> 	-no-reboot
>> 	-watchdog i6300esb
>> 	-watchdog-action debug
>> 	-rtc base=3Dlocaltime
>> 	-serial stdio
>> 	-display none
>> 	-monitor null
>> )
>>
>> append=3D(
>> 	root=3D/dev/ram0
>> 	hung_task_panic=3D1
>> 	debug
>> 	apic=3Ddebug
>> 	sysrq_always_enabled
>> 	rcupdate.rcu_cpu_stall_timeout=3D100
>> 	net.ifnames=3D0
>> 	printk.devkmsg=3Don
>> 	panic=3D-1
>> 	softlockup_panic=3D1
>> 	nmi_watchdog=3Dpanic
>> 	oops=3Dpanic
>> 	load_ramdisk=3D2
>> 	prompt_ramdisk=3D0
>> 	drbd.minor_count=3D8
>> 	systemd.log_level=3Derr
>> 	ignore_loglevel
>> 	console=3Dtty0
>> 	earlyprintk=3DttyS0,115200
>> 	console=3DttyS0,115200
>> 	vga=3Dnormal
>> 	rw
>> 	drbd.minor_count=3D8
>> )
>>
>> "${kvm[@]}" -append "${append[*]}"
>
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/i386 4.15.0-rc1 Kernel Configuration
>> #
>> # CONFIG_64BIT is not set
>> CONFIG_X86_32=3Dy
>> CONFIG_X86=3Dy
>> CONFIG_INSTRUCTION_DECODER=3Dy
>> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
>> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
>> CONFIG_LOCKDEP_SUPPORT=3Dy
>> CONFIG_STACKTRACE_SUPPORT=3Dy
>> CONFIG_MMU=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
>> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>> CONFIG_NEED_SG_DMA_LENGTH=3Dy
>> CONFIG_GENERIC_ISA_DMA=3Dy
>> CONFIG_GENERIC_BUG=3Dy
>> CONFIG_GENERIC_HWEIGHT=3Dy
>> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
>> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
>> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
>> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
>> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
>> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
>> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
>> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
>> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
>> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>> CONFIG_X86_32_LAZY_GS=3Dy
>> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>> CONFIG_FIX_EARLYCON_MEM=3Dy
>> CONFIG_PGTABLE_LEVELS=3D2
>> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>> CONFIG_IRQ_WORK=3Dy
>> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
>> CONFIG_THREAD_INFO_IN_TASK=3Dy
>>
>> #
>> # General setup
>> #
>> CONFIG_BROKEN_ON_SMP=3Dy
>> CONFIG_INIT_ENV_ARG_LIMIT=3D32
>> CONFIG_CROSS_COMPILE=3D""
>> # CONFIG_COMPILE_TEST is not set
>> CONFIG_LOCALVERSION=3D""
>> CONFIG_LOCALVERSION_AUTO=3Dy
>> CONFIG_HAVE_KERNEL_GZIP=3Dy
>> CONFIG_HAVE_KERNEL_BZIP2=3Dy
>> CONFIG_HAVE_KERNEL_LZMA=3Dy
>> CONFIG_HAVE_KERNEL_XZ=3Dy
>> CONFIG_HAVE_KERNEL_LZO=3Dy
>> CONFIG_HAVE_KERNEL_LZ4=3Dy
>> CONFIG_KERNEL_GZIP=3Dy
>> # CONFIG_KERNEL_BZIP2 is not set
>> # CONFIG_KERNEL_LZMA is not set
>> # CONFIG_KERNEL_XZ is not set
>> # CONFIG_KERNEL_LZO is not set
>> # CONFIG_KERNEL_LZ4 is not set
>> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>> # CONFIG_SWAP is not set
>> CONFIG_SYSVIPC=3Dy
>> CONFIG_SYSVIPC_SYSCTL=3Dy
>> CONFIG_POSIX_MQUEUE=3Dy
>> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
>> CONFIG_CROSS_MEMORY_ATTACH=3Dy
>> # CONFIG_USELIB is not set
>> CONFIG_AUDIT=3Dy
>> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>> CONFIG_AUDITSYSCALL=3Dy
>> CONFIG_AUDIT_WATCH=3Dy
>> CONFIG_AUDIT_TREE=3Dy
>>
>> #
>> # IRQ subsystem
>> #
>> CONFIG_GENERIC_IRQ_PROBE=3Dy
>> CONFIG_GENERIC_IRQ_SHOW=3Dy
>> CONFIG_IRQ_DOMAIN=3Dy
>> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
>> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
>> CONFIG_IRQ_FORCED_THREADING=3Dy
>> CONFIG_SPARSE_IRQ=3Dy
>> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
>> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
>> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
>> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
>> CONFIG_GENERIC_CMOS_UPDATE=3Dy
>>
>> #
>> # Timers subsystem
>> #
>> CONFIG_TICK_ONESHOT=3Dy
>> CONFIG_NO_HZ_COMMON=3Dy
>> # CONFIG_HZ_PERIODIC is not set
>> CONFIG_NO_HZ_IDLE=3Dy
>> CONFIG_NO_HZ=3Dy
>> CONFIG_HIGH_RES_TIMERS=3Dy
>>
>> #
>> # CPU/Task time and stats accounting
>> #
>> CONFIG_TICK_CPU_ACCOUNTING=3Dy
>> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
>> # CONFIG_BSD_PROCESS_ACCT is not set
>> # CONFIG_TASKSTATS is not set
>> # CONFIG_CPU_ISOLATION is not set
>>
>> #
>> # RCU Subsystem
>> #
>> CONFIG_TINY_RCU=3Dy
>> CONFIG_RCU_EXPERT=3Dy
>> CONFIG_SRCU=3Dy
>> CONFIG_TINY_SRCU=3Dy
>> CONFIG_TASKS_RCU=3Dy
>> # CONFIG_RCU_STALL_COMMON is not set
>> # CONFIG_RCU_NEED_SEGCBLIST is not set
>> CONFIG_BUILD_BIN2C=3Dy
>> CONFIG_IKCONFIG=3Dy
>> CONFIG_IKCONFIG_PROC=3Dy
>> CONFIG_LOG_BUF_SHIFT=3D20
>> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>> CONFIG_CGROUPS=3Dy
>> CONFIG_PAGE_COUNTER=3Dy
>> CONFIG_MEMCG=3Dy
>> CONFIG_BLK_CGROUP=3Dy
>> # CONFIG_DEBUG_BLK_CGROUP is not set
>> CONFIG_CGROUP_WRITEBACK=3Dy
>> CONFIG_CGROUP_SCHED=3Dy
>> CONFIG_FAIR_GROUP_SCHED=3Dy
>> CONFIG_CFS_BANDWIDTH=3Dy
>> # CONFIG_RT_GROUP_SCHED is not set
>> # CONFIG_CGROUP_PIDS is not set
>> CONFIG_CGROUP_RDMA=3Dy
>> # CONFIG_CGROUP_FREEZER is not set
>> # CONFIG_CGROUP_HUGETLB is not set
>> # CONFIG_CGROUP_DEVICE is not set
>> # CONFIG_CGROUP_CPUACCT is not set
>> CONFIG_CGROUP_PERF=3Dy
>> # CONFIG_CGROUP_BPF is not set
>> # CONFIG_CGROUP_DEBUG is not set
>> # CONFIG_SOCK_CGROUP_DATA is not set
>> # CONFIG_NAMESPACES is not set
>> CONFIG_SCHED_AUTOGROUP=3Dy
>> # CONFIG_SYSFS_DEPRECATED is not set
>> CONFIG_RELAY=3Dy
>> CONFIG_BLK_DEV_INITRD=3Dy
>> CONFIG_INITRAMFS_SOURCE=3D""
>> CONFIG_RD_GZIP=3Dy
>> CONFIG_RD_BZIP2=3Dy
>> CONFIG_RD_LZMA=3Dy
>> # CONFIG_RD_XZ is not set
>> # CONFIG_RD_LZO is not set
>> CONFIG_RD_LZ4=3Dy
>> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
>> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>> CONFIG_SYSCTL=3Dy
>> CONFIG_ANON_INODES=3Dy
>> CONFIG_HAVE_UID16=3Dy
>> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>> CONFIG_BPF=3Dy
>> CONFIG_EXPERT=3Dy
>> CONFIG_UID16=3Dy
>> CONFIG_MULTIUSER=3Dy
>> CONFIG_SGETMASK_SYSCALL=3Dy
>> # CONFIG_SYSFS_SYSCALL is not set
>> # CONFIG_SYSCTL_SYSCALL is not set
>> CONFIG_FHANDLE=3Dy
>> # CONFIG_POSIX_TIMERS is not set
>> CONFIG_PRINTK=3Dy
>> CONFIG_PRINTK_NMI=3Dy
>> CONFIG_BUG=3Dy
>> CONFIG_PCSPKR_PLATFORM=3Dy
>> # CONFIG_BASE_FULL is not set
>> CONFIG_FUTEX=3Dy
>> CONFIG_FUTEX_PI=3Dy
>> CONFIG_EPOLL=3Dy
>> CONFIG_SIGNALFD=3Dy
>> CONFIG_TIMERFD=3Dy
>> CONFIG_EVENTFD=3Dy
>> CONFIG_SHMEM=3Dy
>> # CONFIG_AIO is not set
>> # CONFIG_ADVISE_SYSCALLS is not set
>> # CONFIG_MEMBARRIER is not set
>> CONFIG_CHECKPOINT_RESTORE=3Dy
>> CONFIG_KALLSYMS=3Dy
>> CONFIG_KALLSYMS_ALL=3Dy
>> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
>> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>> CONFIG_BPF_SYSCALL=3Dy
>> # CONFIG_USERFAULTFD is not set
>> CONFIG_EMBEDDED=3Dy
>> CONFIG_HAVE_PERF_EVENTS=3Dy
>> CONFIG_PERF_USE_VMALLOC=3Dy
>> # CONFIG_PC104 is not set
>>
>> #
>> # Kernel Performance Events And Counters
>> #
>> CONFIG_PERF_EVENTS=3Dy
>> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
>> # CONFIG_VM_EVENT_COUNTERS is not set
>> CONFIG_COMPAT_BRK=3Dy
>> CONFIG_SLAB=3Dy
>> # CONFIG_SLUB is not set
>> # CONFIG_SLOB is not set
>> CONFIG_SLAB_MERGE_DEFAULT=3Dy
>> CONFIG_SLAB_FREELIST_RANDOM=3Dy
>> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
>> CONFIG_PROFILING=3Dy
>> CONFIG_TRACEPOINTS=3Dy
>> CONFIG_CRASH_CORE=3Dy
>> CONFIG_KEXEC_CORE=3Dy
>> # CONFIG_OPROFILE is not set
>> CONFIG_HAVE_OPROFILE=3Dy
>> CONFIG_OPROFILE_NMI_TIMER=3Dy
>> CONFIG_JUMP_LABEL=3Dy
>> CONFIG_STATIC_KEYS_SELFTEST=3Dy
>> # CONFIG_UPROBES is not set
>> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>> CONFIG_HAVE_IOREMAP_PROT=3Dy
>> CONFIG_HAVE_KPROBES=3Dy
>> CONFIG_HAVE_KRETPROBES=3Dy
>> CONFIG_HAVE_OPTPROBES=3Dy
>> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>> CONFIG_HAVE_NMI=3Dy
>> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
>> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
>> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>> CONFIG_HAVE_CLK=3Dy
>> CONFIG_HAVE_DMA_API_DEBUG=3Dy
>> CONFIG_HAVE_HW_BREAKPOINT=3Dy
>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HAVE_PERF_REGS=3Dy
>> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>> CONFIG_SECCOMP_FILTER=3Dy
>> CONFIG_HAVE_GCC_PLUGINS=3Dy
>> # CONFIG_GCC_PLUGINS is not set
>> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
>> # CONFIG_CC_STACKPROTECTOR is not set
>> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
>> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
>> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
>> CONFIG_THIN_ARCHIVES=3Dy
>> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
>> CONFIG_MODULES_USE_ELF_REL=3Dy
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>> CONFIG_HAVE_EXIT_THREAD=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS=3D8
>> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>> # CONFIG_HAVE_ARCH_HASH is not set
>> # CONFIG_ISA_BUS_API is not set
>> CONFIG_CLONE_BACKWARDS=3Dy
>> CONFIG_OLD_SIGSUSPEND3=3Dy
>> CONFIG_OLD_SIGACTION=3Dy
>> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
>> # CONFIG_HAVE_ARCH_VMAP_STACK is not set
>> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
>> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
>> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
>> CONFIG_STRICT_KERNEL_RWX=3Dy
>> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
>> CONFIG_ARCH_HAS_REFCOUNT=3Dy
>> # CONFIG_REFCOUNT_FULL is not set
>>
>> #
>> # GCOV-based kernel profiling
>> #
>> # CONFIG_GCOV_KERNEL is not set
>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
>> CONFIG_RT_MUTEXES=3Dy
>> CONFIG_BASE_SMALL=3D1
>> # CONFIG_MODULES is not set
>> CONFIG_MODULES_TREE_LOOKUP=3Dy
>> CONFIG_BLOCK=3Dy
>> CONFIG_LBDAF=3Dy
>> CONFIG_BLK_SCSI_REQUEST=3Dy
>> CONFIG_BLK_DEV_BSG=3Dy
>> CONFIG_BLK_DEV_BSGLIB=3Dy
>> CONFIG_BLK_DEV_INTEGRITY=3Dy
>> CONFIG_BLK_DEV_ZONED=3Dy
>> CONFIG_BLK_DEV_THROTTLING=3Dy
>> CONFIG_BLK_DEV_THROTTLING_LOW=3Dy
>> # CONFIG_BLK_CMDLINE_PARSER is not set
>> CONFIG_BLK_WBT=3Dy
>> # CONFIG_BLK_WBT_SQ is not set
>> CONFIG_BLK_WBT_MQ=3Dy
>> CONFIG_BLK_DEBUG_FS=3Dy
>> # CONFIG_BLK_SED_OPAL is not set
>>
>> #
>> # Partition Types
>> #
>> # CONFIG_PARTITION_ADVANCED is not set
>> CONFIG_MSDOS_PARTITION=3Dy
>> CONFIG_EFI_PARTITION=3Dy
>> CONFIG_BLK_MQ_PCI=3Dy
>> CONFIG_BLK_MQ_RDMA=3Dy
>>
>> #
>> # IO Schedulers
>> #
>> CONFIG_IOSCHED_NOOP=3Dy
>> # CONFIG_IOSCHED_DEADLINE is not set
>> CONFIG_IOSCHED_CFQ=3Dy
>> # CONFIG_CFQ_GROUP_IOSCHED is not set
>> CONFIG_DEFAULT_CFQ=3Dy
>> # CONFIG_DEFAULT_NOOP is not set
>> CONFIG_DEFAULT_IOSCHED=3D"cfq"
>> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
>> CONFIG_MQ_IOSCHED_KYBER=3Dy
>> CONFIG_IOSCHED_BFQ=3Dy
>> # CONFIG_BFQ_GROUP_IOSCHED is not set
>> CONFIG_ASN1=3Dy
>> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
>> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>> # CONFIG_FREEZER is not set
>>
>> #
>> # Processor type and features
>> #
>> # CONFIG_ZONE_DMA is not set
>> # CONFIG_SMP is not set
>> CONFIG_X86_FEATURE_NAMES=3Dy
>> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
>> # CONFIG_GOLDFISH is not set
>> CONFIG_X86_EXTENDED_PLATFORM=3Dy
>> # CONFIG_X86_GOLDFISH is not set
>> # CONFIG_X86_INTEL_LPSS is not set
>> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
>> # CONFIG_IOSF_MBI is not set
>> # CONFIG_X86_RDC321X is not set
>> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
>> CONFIG_X86_32_IRIS=3Dy
>> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>> CONFIG_HYPERVISOR_GUEST=3Dy
>> CONFIG_PARAVIRT=3Dy
>> # CONFIG_PARAVIRT_DEBUG is not set
>> CONFIG_KVM_GUEST=3Dy
>> # CONFIG_KVM_DEBUG_FS is not set
>> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>> CONFIG_PARAVIRT_CLOCK=3Dy
>> CONFIG_NO_BOOTMEM=3Dy
>> # CONFIG_M486 is not set
>> # CONFIG_M586 is not set
>> # CONFIG_M586TSC is not set
>> # CONFIG_M586MMX is not set
>> CONFIG_M686=3Dy
>> # CONFIG_MPENTIUMII is not set
>> # CONFIG_MPENTIUMIII is not set
>> # CONFIG_MPENTIUMM is not set
>> # CONFIG_MPENTIUM4 is not set
>> # CONFIG_MK6 is not set
>> # CONFIG_MK7 is not set
>> # CONFIG_MK8 is not set
>> # CONFIG_MCRUSOE is not set
>> # CONFIG_MEFFICEON is not set
>> # CONFIG_MWINCHIPC6 is not set
>> # CONFIG_MWINCHIP3D is not set
>> # CONFIG_MELAN is not set
>> # CONFIG_MGEODEGX1 is not set
>> # CONFIG_MGEODE_LX is not set
>> # CONFIG_MCYRIXIII is not set
>> # CONFIG_MVIAC3_2 is not set
>> # CONFIG_MVIAC7 is not set
>> # CONFIG_MCORE2 is not set
>> # CONFIG_MATOM is not set
>> # CONFIG_X86_GENERIC is not set
>> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D5
>> CONFIG_X86_L1_CACHE_SHIFT=3D5
>> # CONFIG_X86_PPRO_FENCE is not set
>> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
>> CONFIG_X86_TSC=3Dy
>> CONFIG_X86_CMPXCHG64=3Dy
>> CONFIG_X86_CMOV=3Dy
>> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
>> CONFIG_X86_DEBUGCTLMSR=3Dy
>> CONFIG_PROCESSOR_SELECT=3Dy
>> # CONFIG_CPU_SUP_INTEL is not set
>> CONFIG_CPU_SUP_CYRIX_32=3Dy
>> CONFIG_CPU_SUP_AMD=3Dy
>> # CONFIG_CPU_SUP_CENTAUR is not set
>> # CONFIG_CPU_SUP_TRANSMETA_32 is not set
>> CONFIG_CPU_SUP_UMC_32=3Dy
>> CONFIG_HPET_TIMER=3Dy
>> CONFIG_DMI=3Dy
>> CONFIG_NR_CPUS=3D1
>> CONFIG_PREEMPT_NONE=3Dy
>> # CONFIG_PREEMPT_VOLUNTARY is not set
>> # CONFIG_PREEMPT is not set
>> CONFIG_PREEMPT_COUNT=3Dy
>> # CONFIG_X86_UP_APIC is not set
>> CONFIG_X86_MCE=3Dy
>> CONFIG_X86_MCELOG_LEGACY=3Dy
>> CONFIG_X86_ANCIENT_MCE=3Dy
>>
>> #
>> # Performance monitoring
>> #
>> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
>> CONFIG_X86_LEGACY_VM86=3Dy
>> CONFIG_VM86=3Dy
>> CONFIG_X86_16BIT=3Dy
>> CONFIG_X86_ESPFIX32=3Dy
>> # CONFIG_TOSHIBA is not set
>> CONFIG_I8K=3Dy
>> CONFIG_X86_REBOOTFIXUPS=3Dy
>> # CONFIG_MICROCODE is not set
>> CONFIG_X86_MSR=3Dy
>> # CONFIG_X86_CPUID is not set
>> # CONFIG_NOHIGHMEM is not set
>> CONFIG_HIGHMEM4G=3Dy
>> # CONFIG_HIGHMEM64G is not set
>> # CONFIG_VMSPLIT_3G is not set
>> # CONFIG_VMSPLIT_3G_OPT is not set
>> # CONFIG_VMSPLIT_2G is not set
>> # CONFIG_VMSPLIT_2G_OPT is not set
>> CONFIG_VMSPLIT_1G=3Dy
>> CONFIG_PAGE_OFFSET=3D0x40000000
>> CONFIG_HIGHMEM=3Dy
>> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
>> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
>> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_ILLEGAL_POINTER_VALUE=3D0
>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_FLATMEM_MANUAL=3Dy
>> # CONFIG_SPARSEMEM_MANUAL is not set
>> CONFIG_FLATMEM=3Dy
>> CONFIG_FLAT_NODE_MEM_MAP=3Dy
>> CONFIG_SPARSEMEM_STATIC=3Dy
>> CONFIG_HAVE_MEMBLOCK=3Dy
>> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>> CONFIG_HAVE_GENERIC_GUP=3Dy
>> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>> CONFIG_MEMORY_ISOLATION=3Dy
>> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
>> CONFIG_SPLIT_PTLOCK_CPUS=3D4
>> CONFIG_COMPACTION=3Dy
>> CONFIG_MIGRATION=3Dy
>> # CONFIG_PHYS_ADDR_T_64BIT is not set
>> CONFIG_BOUNCE=3Dy
>> CONFIG_VIRT_TO_BUS=3Dy
>> # CONFIG_KSM is not set
>> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
>> # CONFIG_MEMORY_FAILURE is not set
>> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
>> # CONFIG_ARCH_WANTS_THP_SWAP is not set
>> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
>> CONFIG_NEED_PER_CPU_KM=3Dy
>> # CONFIG_CLEANCACHE is not set
>> CONFIG_CMA=3Dy
>> CONFIG_CMA_DEBUG=3Dy
>> # CONFIG_CMA_DEBUGFS is not set
>> CONFIG_CMA_AREAS=3D7
>> # CONFIG_ZPOOL is not set
>> # CONFIG_ZBUD is not set
>> # CONFIG_ZSMALLOC is not set
>> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
>> # CONFIG_IDLE_PAGE_TRACKING is not set
>> # CONFIG_PERCPU_STATS is not set
>> # CONFIG_GUP_BENCHMARK is not set
>> # CONFIG_HIGHPTE is not set
>> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
>> CONFIG_X86_RESERVE_LOW=3D64
>> CONFIG_MATH_EMULATION=3Dy
>> CONFIG_MTRR=3Dy
>> CONFIG_MTRR_SANITIZER=3Dy
>> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
>> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
>> CONFIG_X86_PAT=3Dy
>> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
>> CONFIG_ARCH_RANDOM=3Dy
>> # CONFIG_X86_SMAP is not set
>> # CONFIG_EFI is not set
>> CONFIG_SECCOMP=3Dy
>> # CONFIG_HZ_100 is not set
>> # CONFIG_HZ_250 is not set
>> CONFIG_HZ_300=3Dy
>> # CONFIG_HZ_1000 is not set
>> CONFIG_HZ=3D300
>> CONFIG_SCHED_HRTICK=3Dy
>> CONFIG_KEXEC=3Dy
>> CONFIG_CRASH_DUMP=3Dy
>> CONFIG_PHYSICAL_START=3D0x1000000
>> CONFIG_RELOCATABLE=3Dy
>> # CONFIG_RANDOMIZE_BASE is not set
>> CONFIG_X86_NEED_RELOCS=3Dy
>> CONFIG_PHYSICAL_ALIGN=3D0x200000
>> # CONFIG_COMPAT_VDSO is not set
>> # CONFIG_CMDLINE_BOOL is not set
>> CONFIG_MODIFY_LDT_SYSCALL=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>>
>> #
>> # Power management and ACPI options
>> #
>> # CONFIG_SUSPEND is not set
>> # CONFIG_PM is not set
>> CONFIG_ACPI=3Dy
>> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
>> # CONFIG_ACPI_DEBUGGER is not set
>> # CONFIG_ACPI_PROCFS_POWER is not set
>> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>> # CONFIG_ACPI_EC_DEBUGFS is not set
>> CONFIG_ACPI_AC=3Dy
>> CONFIG_ACPI_BATTERY=3Dy
>> CONFIG_ACPI_BUTTON=3Dy
>> # CONFIG_ACPI_VIDEO is not set
>> CONFIG_ACPI_FAN=3Dy
>> # CONFIG_ACPI_DOCK is not set
>> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
>> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>> CONFIG_ACPI_PROCESSOR=3Dy
>> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
>> CONFIG_ACPI_THERMAL=3Dy
>> # CONFIG_ACPI_CUSTOM_DSDT is not set
>> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
>> CONFIG_ACPI_TABLE_UPGRADE=3Dy
>> # CONFIG_ACPI_DEBUG is not set
>> # CONFIG_ACPI_PCI_SLOT is not set
>> CONFIG_X86_PM_TIMER=3Dy
>> # CONFIG_ACPI_CONTAINER is not set
>> # CONFIG_ACPI_SBS is not set
>> # CONFIG_ACPI_HED is not set
>> # CONFIG_ACPI_CUSTOM_METHOD is not set
>> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
>> CONFIG_HAVE_ACPI_APEI=3Dy
>> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>> # CONFIG_ACPI_APEI is not set
>> # CONFIG_DPTF_POWER is not set
>> # CONFIG_PMIC_OPREGION is not set
>> # CONFIG_ACPI_CONFIGFS is not set
>> CONFIG_SFI=3Dy
>>
>> #
>> # CPU Frequency scaling
>> #
>> # CONFIG_CPU_FREQ is not set
>>
>> #
>> # CPU Idle
>> #
>> CONFIG_CPU_IDLE=3Dy
>> # CONFIG_CPU_IDLE_GOV_LADDER is not set
>> CONFIG_CPU_IDLE_GOV_MENU=3Dy
>> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
>>
>> #
>> # Bus options (PCI etc.)
>> #
>> CONFIG_PCI=3Dy
>> # CONFIG_PCI_GOBIOS is not set
>> # CONFIG_PCI_GOMMCONFIG is not set
>> # CONFIG_PCI_GODIRECT is not set
>> CONFIG_PCI_GOANY=3Dy
>> CONFIG_PCI_BIOS=3Dy
>> CONFIG_PCI_DIRECT=3Dy
>> CONFIG_PCI_MMCONFIG=3Dy
>> CONFIG_PCI_DOMAINS=3Dy
>> # CONFIG_PCI_CNB20LE_QUIRK is not set
>> # CONFIG_PCIEPORTBUS is not set
>> # CONFIG_PCI_MSI is not set
>> CONFIG_PCI_QUIRKS=3Dy
>> # CONFIG_PCI_DEBUG is not set
>> # CONFIG_PCI_STUB is not set
>> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
>> # CONFIG_PCI_IOV is not set
>> # CONFIG_PCI_PRI is not set
>> # CONFIG_PCI_PASID is not set
>> CONFIG_PCI_LABEL=3Dy
>> # CONFIG_HOTPLUG_PCI is not set
>>
>> #
>> # DesignWare PCI Core Support
>> #
>>
>> #
>> # PCI host controller drivers
>> #
>>
>> #
>> # PCI Endpoint
>> #
>> CONFIG_PCI_ENDPOINT=3Dy
>> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
>> # CONFIG_PCI_EPF_TEST is not set
>>
>> #
>> # PCI switch controller drivers
>> #
>> # CONFIG_PCI_SW_SWITCHTEC is not set
>> # CONFIG_ISA_BUS is not set
>> CONFIG_ISA_DMA_API=3Dy
>> # CONFIG_ISA is not set
>> CONFIG_SCx200=3Dy
>> CONFIG_SCx200HR_TIMER=3Dy
>> # CONFIG_OLPC is not set
>> CONFIG_ALIX=3Dy
>> # CONFIG_NET5501 is not set
>> # CONFIG_GEOS is not set
>> CONFIG_AMD_NB=3Dy
>> CONFIG_PCCARD=3Dy
>> CONFIG_PCMCIA=3Dy
>> # CONFIG_PCMCIA_LOAD_CIS is not set
>> CONFIG_CARDBUS=3Dy
>>
>> #
>> # PC-card bridges
>> #
>> # CONFIG_YENTA is not set
>> # CONFIG_PD6729 is not set
>> # CONFIG_I82092 is not set
>> # CONFIG_RAPIDIO is not set
>> CONFIG_X86_SYSFB=3Dy
>>
>> #
>> # Executable file formats / Emulations
>> #
>> CONFIG_BINFMT_ELF=3Dy
>> CONFIG_ELFCORE=3Dy
>> CONFIG_BINFMT_SCRIPT=3Dy
>> CONFIG_HAVE_AOUT=3Dy
>> CONFIG_BINFMT_AOUT=3Dy
>> CONFIG_BINFMT_MISC=3Dy
>> # CONFIG_COREDUMP is not set
>> CONFIG_COMPAT_32=3Dy
>> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
>> CONFIG_NET=3Dy
>>
>> #
>> # Networking options
>> #
>> # CONFIG_PACKET is not set
>> CONFIG_UNIX=3Dy
>> # CONFIG_UNIX_DIAG is not set
>> CONFIG_TLS=3Dy
>> CONFIG_XFRM=3Dy
>> CONFIG_XFRM_OFFLOAD=3Dy
>> CONFIG_XFRM_ALGO=3Dy
>> CONFIG_XFRM_USER=3Dy
>> # CONFIG_XFRM_SUB_POLICY is not set
>> # CONFIG_XFRM_MIGRATE is not set
>> # CONFIG_XFRM_STATISTICS is not set
>> CONFIG_XFRM_IPCOMP=3Dy
>> CONFIG_NET_KEY=3Dy
>> # CONFIG_NET_KEY_MIGRATE is not set
>> CONFIG_SMC=3Dy
>> CONFIG_SMC_DIAG=3Dy
>> CONFIG_INET=3Dy
>> CONFIG_IP_MULTICAST=3Dy
>> CONFIG_IP_ADVANCED_ROUTER=3Dy
>> CONFIG_IP_FIB_TRIE_STATS=3Dy
>> # CONFIG_IP_MULTIPLE_TABLES is not set
>> # CONFIG_IP_ROUTE_MULTIPATH is not set
>> CONFIG_IP_ROUTE_VERBOSE=3Dy
>> CONFIG_IP_PNP=3Dy
>> CONFIG_IP_PNP_DHCP=3Dy
>> # CONFIG_IP_PNP_BOOTP is not set
>> # CONFIG_IP_PNP_RARP is not set
>> CONFIG_NET_IPIP=3Dy
>> CONFIG_NET_IPGRE_DEMUX=3Dy
>> CONFIG_NET_IP_TUNNEL=3Dy
>> CONFIG_NET_IPGRE=3Dy
>> # CONFIG_NET_IPGRE_BROADCAST is not set
>> CONFIG_IP_MROUTE=3Dy
>> CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
>> CONFIG_IP_PIMSM_V1=3Dy
>> CONFIG_IP_PIMSM_V2=3Dy
>> CONFIG_SYN_COOKIES=3Dy
>> CONFIG_NET_IPVTI=3Dy
>> CONFIG_NET_UDP_TUNNEL=3Dy
>> CONFIG_NET_FOU=3Dy
>> CONFIG_NET_FOU_IP_TUNNELS=3Dy
>> CONFIG_INET_AH=3Dy
>> CONFIG_INET_ESP=3Dy
>> CONFIG_INET_ESP_OFFLOAD=3Dy
>> CONFIG_INET_IPCOMP=3Dy
>> CONFIG_INET_XFRM_TUNNEL=3Dy
>> CONFIG_INET_TUNNEL=3Dy
>> # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>> CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
>> CONFIG_INET_XFRM_MODE_BEET=3Dy
>> CONFIG_INET_DIAG=3Dy
>> CONFIG_INET_TCP_DIAG=3Dy
>> # CONFIG_INET_UDP_DIAG is not set
>> CONFIG_INET_RAW_DIAG=3Dy
>> # CONFIG_INET_DIAG_DESTROY is not set
>> # CONFIG_TCP_CONG_ADVANCED is not set
>> CONFIG_TCP_CONG_CUBIC=3Dy
>> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
>> # CONFIG_TCP_MD5SIG is not set
>> CONFIG_IPV6=3Dy
>> CONFIG_IPV6_ROUTER_PREF=3Dy
>> CONFIG_IPV6_ROUTE_INFO=3Dy
>> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
>> CONFIG_INET6_AH=3Dy
>> CONFIG_INET6_ESP=3Dy
>> CONFIG_INET6_ESP_OFFLOAD=3Dy
>> CONFIG_INET6_IPCOMP=3Dy
>> CONFIG_IPV6_MIP6=3Dy
>> CONFIG_INET6_XFRM_TUNNEL=3Dy
>> CONFIG_INET6_TUNNEL=3Dy
>> CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
>> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
>> CONFIG_INET6_XFRM_MODE_BEET=3Dy
>> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
>> CONFIG_IPV6_VTI=3Dy
>> # CONFIG_IPV6_SIT is not set
>> CONFIG_IPV6_TUNNEL=3Dy
>> CONFIG_IPV6_GRE=3Dy
>> CONFIG_IPV6_FOU=3Dy
>> CONFIG_IPV6_FOU_TUNNEL=3Dy
>> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
>> CONFIG_IPV6_SUBTREES=3Dy
>> # CONFIG_IPV6_MROUTE is not set
>> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
>> CONFIG_IPV6_SEG6_HMAC=3Dy
>> CONFIG_NETWORK_SECMARK=3Dy
>> # CONFIG_NET_PTP_CLASSIFY is not set
>> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
>> # CONFIG_NETFILTER is not set
>> # CONFIG_IP_DCCP is not set
>> CONFIG_IP_SCTP=3Dy
>> # CONFIG_SCTP_DBG_OBJCNT is not set
>> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=3Dy
>> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
>> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
>> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
>> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
>> CONFIG_INET_SCTP_DIAG=3Dy
>> # CONFIG_RDS is not set
>> CONFIG_TIPC=3Dy
>> # CONFIG_TIPC_MEDIA_UDP is not set
>> # CONFIG_ATM is not set
>> CONFIG_L2TP=3Dy
>> CONFIG_L2TP_DEBUGFS=3Dy
>> CONFIG_L2TP_V3=3Dy
>> # CONFIG_L2TP_IP is not set
>> CONFIG_L2TP_ETH=3Dy
>> CONFIG_STP=3Dy
>> CONFIG_BRIDGE=3Dy
>> # CONFIG_BRIDGE_IGMP_SNOOPING is not set
>> CONFIG_HAVE_NET_DSA=3Dy
>> # CONFIG_NET_DSA is not set
>> # CONFIG_VLAN_8021Q is not set
>> CONFIG_DECNET=3Dy
>> # CONFIG_DECNET_ROUTER is not set
>> CONFIG_LLC=3Dy
>> CONFIG_LLC2=3Dy
>> CONFIG_IPX=3Dy
>> # CONFIG_IPX_INTERN is not set
>> CONFIG_ATALK=3Dy
>> CONFIG_DEV_APPLETALK=3Dy
>> CONFIG_IPDDP=3Dy
>> CONFIG_IPDDP_ENCAP=3Dy
>> CONFIG_X25=3Dy
>> # CONFIG_LAPB is not set
>> CONFIG_PHONET=3Dy
>> CONFIG_6LOWPAN=3Dy
>> # CONFIG_6LOWPAN_DEBUGFS is not set
>> CONFIG_6LOWPAN_NHC=3Dy
>> # CONFIG_6LOWPAN_NHC_DEST is not set
>> # CONFIG_6LOWPAN_NHC_FRAGMENT is not set
>> # CONFIG_6LOWPAN_NHC_HOP is not set
>> CONFIG_6LOWPAN_NHC_IPV6=3Dy
>> CONFIG_6LOWPAN_NHC_MOBILITY=3Dy
>> CONFIG_6LOWPAN_NHC_ROUTING=3Dy
>> # CONFIG_6LOWPAN_NHC_UDP is not set
>> # CONFIG_6LOWPAN_GHC_EXT_HDR_HOP is not set
>> CONFIG_6LOWPAN_GHC_UDP=3Dy
>> CONFIG_6LOWPAN_GHC_ICMPV6=3Dy
>> # CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
>> CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=3Dy
>> CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=3Dy
>> CONFIG_IEEE802154=3Dy
>> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
>> # CONFIG_IEEE802154_SOCKET is not set
>> CONFIG_IEEE802154_6LOWPAN=3Dy
>> # CONFIG_MAC802154 is not set
>> # CONFIG_NET_SCHED is not set
>> CONFIG_DCB=3Dy
>> CONFIG_DNS_RESOLVER=3Dy
>> # CONFIG_BATMAN_ADV is not set
>> # CONFIG_OPENVSWITCH is not set
>> # CONFIG_VSOCKETS is not set
>> CONFIG_NETLINK_DIAG=3Dy
>> # CONFIG_MPLS is not set
>> CONFIG_NET_NSH=3Dy
>> # CONFIG_HSR is not set
>> CONFIG_NET_SWITCHDEV=3Dy
>> CONFIG_NET_L3_MASTER_DEV=3Dy
>> CONFIG_NET_NCSI=3Dy
>> # CONFIG_CGROUP_NET_PRIO is not set
>> # CONFIG_CGROUP_NET_CLASSID is not set
>> CONFIG_NET_RX_BUSY_POLL=3Dy
>> CONFIG_BQL=3Dy
>> CONFIG_BPF_STREAM_PARSER=3Dy
>>
>> #
>> # Network testing
>> #
>> # CONFIG_NET_PKTGEN is not set
>> # CONFIG_NET_DROP_MONITOR is not set
>> # CONFIG_HAMRADIO is not set
>> CONFIG_CAN=3Dy
>> CONFIG_CAN_RAW=3Dy
>> # CONFIG_CAN_BCM is not set
>> CONFIG_CAN_GW=3Dy
>>
>> #
>> # CAN Device Drivers
>> #
>> # CONFIG_CAN_VCAN is not set
>> CONFIG_CAN_VXCAN=3Dy
>> CONFIG_CAN_SLCAN=3Dy
>> CONFIG_CAN_DEV=3Dy
>> # CONFIG_CAN_CALC_BITTIMING is not set
>> # CONFIG_CAN_LEDS is not set
>> # CONFIG_CAN_GRCAN is not set
>> # CONFIG_PCH_CAN is not set
>> CONFIG_CAN_C_CAN=3Dy
>> CONFIG_CAN_C_CAN_PLATFORM=3Dy
>> # CONFIG_CAN_C_CAN_PCI is not set
>> # CONFIG_CAN_CC770 is not set
>> CONFIG_CAN_IFI_CANFD=3Dy
>> CONFIG_CAN_M_CAN=3Dy
>> # CONFIG_CAN_PEAK_PCIEFD is not set
>> CONFIG_CAN_SJA1000=3Dy
>> # CONFIG_CAN_SJA1000_ISA is not set
>> CONFIG_CAN_SJA1000_PLATFORM=3Dy
>> # CONFIG_CAN_EMS_PCMCIA is not set
>> # CONFIG_CAN_EMS_PCI is not set
>> CONFIG_CAN_PEAK_PCMCIA=3Dy
>> # CONFIG_CAN_PEAK_PCI is not set
>> # CONFIG_CAN_KVASER_PCI is not set
>> # CONFIG_CAN_PLX_PCI is not set
>> CONFIG_CAN_SOFTING=3Dy
>> CONFIG_CAN_SOFTING_CS=3Dy
>> # CONFIG_CAN_DEBUG_DEVICES is not set
>> CONFIG_BT=3Dy
>> # CONFIG_BT_BREDR is not set
>> CONFIG_BT_LE=3Dy
>> # CONFIG_BT_6LOWPAN is not set
>> CONFIG_BT_LEDS=3Dy
>> # CONFIG_BT_SELFTEST is not set
>> # CONFIG_BT_DEBUGFS is not set
>>
>> #
>> # Bluetooth device drivers
>> #
>> CONFIG_BT_INTEL=3Dy
>> CONFIG_BT_QCA=3Dy
>> CONFIG_BT_HCIBTSDIO=3Dy
>> CONFIG_BT_HCIUART=3Dy
>> CONFIG_BT_HCIUART_SERDEV=3Dy
>> CONFIG_BT_HCIUART_H4=3Dy
>> CONFIG_BT_HCIUART_BCSP=3Dy
>> CONFIG_BT_HCIUART_ATH3K=3Dy
>> CONFIG_BT_HCIUART_LL=3Dy
>> # CONFIG_BT_HCIUART_3WIRE is not set
>> CONFIG_BT_HCIUART_INTEL=3Dy
>> # CONFIG_BT_HCIUART_BCM is not set
>> CONFIG_BT_HCIUART_QCA=3Dy
>> # CONFIG_BT_HCIUART_AG6XX is not set
>> # CONFIG_BT_HCIUART_MRVL is not set
>> CONFIG_BT_HCIDTL1=3Dy
>> # CONFIG_BT_HCIBT3C is not set
>> CONFIG_BT_HCIBLUECARD=3Dy
>> CONFIG_BT_HCIBTUART=3Dy
>> CONFIG_BT_HCIVHCI=3Dy
>> CONFIG_BT_MRVL=3Dy
>> CONFIG_BT_MRVL_SDIO=3Dy
>> CONFIG_BT_WILINK=3Dy
>> CONFIG_AF_RXRPC=3Dy
>> CONFIG_AF_RXRPC_IPV6=3Dy
>> CONFIG_AF_RXRPC_INJECT_LOSS=3Dy
>> # CONFIG_AF_RXRPC_DEBUG is not set
>> CONFIG_RXKAD=3Dy
>> CONFIG_AF_KCM=3Dy
>> CONFIG_STREAM_PARSER=3Dy
>> CONFIG_FIB_RULES=3Dy
>> CONFIG_WIRELESS=3Dy
>> # CONFIG_CFG80211 is not set
>> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
>> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
>> # CONFIG_LIB80211 is not set
>>
>> #
>> # CFG80211 needs to be enabled for MAC80211
>> #
>> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
>> # CONFIG_WIMAX is not set
>> # CONFIG_RFKILL is not set
>> CONFIG_NET_9P=3Dy
>> # CONFIG_NET_9P_RDMA is not set
>> # CONFIG_NET_9P_DEBUG is not set
>> CONFIG_CAIF=3Dy
>> CONFIG_CAIF_DEBUG=3Dy
>> CONFIG_CAIF_NETDEV=3Dy
>> CONFIG_CAIF_USB=3Dy
>> CONFIG_CEPH_LIB=3Dy
>> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
>> # CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
>> CONFIG_NFC=3Dy
>> CONFIG_NFC_DIGITAL=3Dy
>> # CONFIG_NFC_NCI is not set
>> CONFIG_NFC_HCI=3Dy
>> CONFIG_NFC_SHDLC=3Dy
>>
>> #
>> # Near Field Communication (NFC) devices
>> #
>> CONFIG_NFC_SIM=3Dy
>> # CONFIG_NFC_PN544_I2C is not set
>> # CONFIG_NFC_PN533_I2C is not set
>> CONFIG_NFC_MICROREAD=3Dy
>> CONFIG_NFC_MICROREAD_I2C=3Dy
>> CONFIG_NFC_ST21NFCA=3Dy
>> CONFIG_NFC_ST21NFCA_I2C=3Dy
>> CONFIG_PSAMPLE=3Dy
>> CONFIG_NET_IFE=3Dy
>> # CONFIG_LWTUNNEL is not set
>> CONFIG_DST_CACHE=3Dy
>> CONFIG_GRO_CELLS=3Dy
>> CONFIG_NET_DEVLINK=3Dy
>> CONFIG_MAY_USE_DEVLINK=3Dy
>>
>> #
>> # Device Drivers
>> #
>>
>> #
>> # Generic Driver Options
>> #
>> # CONFIG_UEVENT_HELPER is not set
>> CONFIG_DEVTMPFS=3Dy
>> # CONFIG_DEVTMPFS_MOUNT is not set
>> CONFIG_STANDALONE=3Dy
>> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
>> CONFIG_FW_LOADER=3Dy
>> # CONFIG_FIRMWARE_IN_KERNEL is not set
>> CONFIG_EXTRA_FIRMWARE=3D""
>> CONFIG_FW_LOADER_USER_HELPER=3Dy
>> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
>> CONFIG_WANT_DEV_COREDUMP=3Dy
>> # CONFIG_ALLOW_DEV_COREDUMP is not set
>> # CONFIG_DEBUG_DRIVER is not set
>> CONFIG_DEBUG_DEVRES=3Dy
>> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
>> # CONFIG_SYS_HYPERVISOR is not set
>> # CONFIG_GENERIC_CPU_DEVICES is not set
>> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>> CONFIG_REGMAP=3Dy
>> CONFIG_REGMAP_I2C=3Dy
>> CONFIG_REGMAP_SPMI=3Dy
>> CONFIG_REGMAP_MMIO=3Dy
>> CONFIG_REGMAP_IRQ=3Dy
>> CONFIG_REGMAP_HWSPINLOCK=3Dy
>> CONFIG_DMA_SHARED_BUFFER=3Dy
>> # CONFIG_DMA_FENCE_TRACE is not set
>> # CONFIG_DMA_CMA is not set
>>
>> #
>> # Bus devices
>> #
>> CONFIG_CONNECTOR=3Dy
>> # CONFIG_PROC_EVENTS is not set
>> CONFIG_MTD=3Dy
>> # CONFIG_MTD_REDBOOT_PARTS is not set
>> CONFIG_MTD_CMDLINE_PARTS=3Dy
>> CONFIG_MTD_OF_PARTS=3Dy
>> # CONFIG_MTD_AR7_PARTS is not set
>>
>> #
>> # Partition parsers
>> #
>>
>> #
>> # User Modules And Translation Layers
>> #
>> CONFIG_MTD_BLKDEVS=3Dy
>> CONFIG_MTD_BLOCK=3Dy
>> # CONFIG_FTL is not set
>> CONFIG_NFTL=3Dy
>> # CONFIG_NFTL_RW is not set
>> CONFIG_INFTL=3Dy
>> # CONFIG_RFD_FTL is not set
>> CONFIG_SSFDC=3Dy
>> CONFIG_SM_FTL=3Dy
>> CONFIG_MTD_OOPS=3Dy
>> CONFIG_MTD_PARTITIONED_MASTER=3Dy
>>
>> #
>> # RAM/ROM/Flash chip drivers
>> #
>> CONFIG_MTD_CFI=3Dy
>> CONFIG_MTD_JEDECPROBE=3Dy
>> CONFIG_MTD_GEN_PROBE=3Dy
>> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
>> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
>> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
>> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
>> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
>> CONFIG_MTD_CFI_I1=3Dy
>> CONFIG_MTD_CFI_I2=3Dy
>> # CONFIG_MTD_CFI_I4 is not set
>> # CONFIG_MTD_CFI_I8 is not set
>> CONFIG_MTD_CFI_INTELEXT=3Dy
>> # CONFIG_MTD_CFI_AMDSTD is not set
>> # CONFIG_MTD_CFI_STAA is not set
>> CONFIG_MTD_CFI_UTIL=3Dy
>> CONFIG_MTD_RAM=3Dy
>> # CONFIG_MTD_ROM is not set
>> CONFIG_MTD_ABSENT=3Dy
>>
>> #
>> # Mapping drivers for chip access
>> #
>> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
>> CONFIG_MTD_PHYSMAP=3Dy
>> # CONFIG_MTD_PHYSMAP_COMPAT is not set
>> # CONFIG_MTD_PHYSMAP_OF is not set
>> # CONFIG_MTD_SCx200_DOCFLASH is not set
>> CONFIG_MTD_AMD76XROM=3Dy
>> CONFIG_MTD_ICHXROM=3Dy
>> # CONFIG_MTD_ESB2ROM is not set
>> # CONFIG_MTD_CK804XROM is not set
>> # CONFIG_MTD_SCB2_FLASH is not set
>> # CONFIG_MTD_NETtel is not set
>> CONFIG_MTD_L440GX=3Dy
>> # CONFIG_MTD_INTEL_VR_NOR is not set
>> CONFIG_MTD_PLATRAM=3Dy
>>
>> #
>> # Self-contained MTD device drivers
>> #
>> # CONFIG_MTD_PMC551 is not set
>> CONFIG_MTD_SLRAM=3Dy
>> # CONFIG_MTD_PHRAM is not set
>> CONFIG_MTD_MTDRAM=3Dy
>> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
>> CONFIG_MTDRAM_ERASE_SIZE=3D128
>> CONFIG_MTD_BLOCK2MTD=3Dy
>>
>> #
>> # Disk-On-Chip Device Drivers
>> #
>> CONFIG_MTD_DOCG3=3Dy
>> CONFIG_BCH_CONST_M=3D14
>> CONFIG_BCH_CONST_T=3D4
>> CONFIG_MTD_NAND_ECC=3Dy
>> CONFIG_MTD_NAND_ECC_SMC=3Dy
>> CONFIG_MTD_NAND=3Dy
>> CONFIG_MTD_NAND_BCH=3Dy
>> CONFIG_MTD_NAND_ECC_BCH=3Dy
>> # CONFIG_MTD_SM_COMMON is not set
>> # CONFIG_MTD_NAND_DENALI_PCI is not set
>> # CONFIG_MTD_NAND_DENALI_DT is not set
>> # CONFIG_MTD_NAND_GPIO is not set
>> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
>> # CONFIG_MTD_NAND_RICOH is not set
>> CONFIG_MTD_NAND_DISKONCHIP=3Dy
>> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
>> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
>> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
>> # CONFIG_MTD_NAND_DOCG4 is not set
>> # CONFIG_MTD_NAND_CAFE is not set
>> CONFIG_MTD_NAND_CS553X=3Dy
>> CONFIG_MTD_NAND_NANDSIM=3Dy
>> # CONFIG_MTD_NAND_PLATFORM is not set
>> # CONFIG_MTD_ONENAND is not set
>>
>> #
>> # LPDDR & LPDDR2 PCM memory drivers
>> #
>> # CONFIG_MTD_LPDDR is not set
>> CONFIG_MTD_SPI_NOR=3Dy
>> CONFIG_MTD_MT81xx_NOR=3Dy
>> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
>> # CONFIG_SPI_INTEL_SPI_PCI is not set
>> # CONFIG_SPI_INTEL_SPI_PLATFORM is not set
>> CONFIG_MTD_UBI=3Dy
>> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
>> CONFIG_MTD_UBI_BEB_LIMIT=3D20
>> # CONFIG_MTD_UBI_FASTMAP is not set
>> # CONFIG_MTD_UBI_GLUEBI is not set
>> # CONFIG_MTD_UBI_BLOCK is not set
>> CONFIG_OF=3Dy
>> # CONFIG_OF_UNITTEST is not set
>> CONFIG_OF_KOBJ=3Dy
>> CONFIG_OF_DYNAMIC=3Dy
>> CONFIG_OF_ADDRESS=3Dy
>> CONFIG_OF_ADDRESS_PCI=3Dy
>> CONFIG_OF_IRQ=3Dy
>> CONFIG_OF_NET=3Dy
>> CONFIG_OF_PCI=3Dy
>> CONFIG_OF_PCI_IRQ=3Dy
>> CONFIG_OF_RESOLVE=3Dy
>> CONFIG_OF_OVERLAY=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>> CONFIG_PARPORT=3Dy
>> CONFIG_PARPORT_PC=3Dy
>> # CONFIG_PARPORT_SERIAL is not set
>> # CONFIG_PARPORT_PC_FIFO is not set
>> CONFIG_PARPORT_PC_SUPERIO=3Dy
>> # CONFIG_PARPORT_PC_PCMCIA is not set
>> # CONFIG_PARPORT_GSC is not set
>> # CONFIG_PARPORT_AX88796 is not set
>> CONFIG_PARPORT_1284=3Dy
>> CONFIG_PNP=3Dy
>> CONFIG_PNP_DEBUG_MESSAGES=3Dy
>>
>> #
>> # Protocols
>> #
>> CONFIG_PNPACPI=3Dy
>> CONFIG_BLK_DEV=3Dy
>> # CONFIG_BLK_DEV_NULL_BLK is not set
>> # CONFIG_BLK_DEV_FD is not set
>> # CONFIG_PARIDE is not set
>> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
>> # CONFIG_BLK_DEV_DAC960 is not set
>> # CONFIG_BLK_DEV_UMEM is not set
>> # CONFIG_BLK_DEV_COW_COMMON is not set
>> # CONFIG_BLK_DEV_LOOP is not set
>> # CONFIG_BLK_DEV_DRBD is not set
>> # CONFIG_BLK_DEV_NBD is not set
>> # CONFIG_BLK_DEV_SX8 is not set
>> # CONFIG_BLK_DEV_RAM is not set
>> # CONFIG_CDROM_PKTCDVD is not set
>> # CONFIG_ATA_OVER_ETH is not set
>> # CONFIG_BLK_DEV_RBD is not set
>> # CONFIG_BLK_DEV_RSXX is not set
>>
>> #
>> # NVME Support
>> #
>> CONFIG_NVME_CORE=3Dy
>> # CONFIG_BLK_DEV_NVME is not set
>> # CONFIG_NVME_MULTIPATH is not set
>> CONFIG_NVME_FABRICS=3Dy
>> CONFIG_NVME_RDMA=3Dy
>> CONFIG_NVME_FC=3Dy
>> CONFIG_NVME_TARGET=3Dy
>> # CONFIG_NVME_TARGET_LOOP is not set
>> CONFIG_NVME_TARGET_RDMA=3Dy
>> # CONFIG_NVME_TARGET_FC is not set
>>
>> #
>> # Misc devices
>> #
>> # CONFIG_SENSORS_LIS3LV02D is not set
>> CONFIG_AD525X_DPOT=3Dy
>> # CONFIG_AD525X_DPOT_I2C is not set
>> # CONFIG_DUMMY_IRQ is not set
>> # CONFIG_IBM_ASM is not set
>> # CONFIG_PHANTOM is not set
>> # CONFIG_SGI_IOC4 is not set
>> # CONFIG_TIFM_CORE is not set
>> CONFIG_ICS932S401=3Dy
>> # CONFIG_ENCLOSURE_SERVICES is not set
>> # CONFIG_HP_ILO is not set
>> # CONFIG_APDS9802ALS is not set
>> # CONFIG_ISL29003 is not set
>> CONFIG_ISL29020=3Dy
>> CONFIG_SENSORS_TSL2550=3Dy
>> CONFIG_SENSORS_BH1770=3Dy
>> # CONFIG_SENSORS_APDS990X is not set
>> # CONFIG_HMC6352 is not set
>> CONFIG_DS1682=3Dy
>> # CONFIG_PCH_PHUB is not set
>> CONFIG_USB_SWITCH_FSA9480=3Dy
>> CONFIG_SRAM=3Dy
>> # CONFIG_PCI_ENDPOINT_TEST is not set
>> # CONFIG_C2PORT is not set
>>
>> #
>> # EEPROM support
>> #
>> CONFIG_EEPROM_AT24=3Dy
>> CONFIG_EEPROM_LEGACY=3Dy
>> CONFIG_EEPROM_MAX6875=3Dy
>> # CONFIG_EEPROM_93CX6 is not set
>> # CONFIG_EEPROM_IDT_89HPESX is not set
>> # CONFIG_CB710_CORE is not set
>>
>> #
>> # Texas Instruments shared transport line discipline
>> #
>> CONFIG_TI_ST=3Dy
>> # CONFIG_SENSORS_LIS3_I2C is not set
>> CONFIG_ALTERA_STAPL=3Dy
>> # CONFIG_INTEL_MEI is not set
>> # CONFIG_INTEL_MEI_ME is not set
>> # CONFIG_INTEL_MEI_TXE is not set
>> # CONFIG_VMWARE_VMCI is not set
>>
>> #
>> # Intel MIC & related support
>> #
>>
>> #
>> # Intel MIC Bus Driver
>> #
>>
>> #
>> # SCIF Bus Driver
>> #
>>
>> #
>> # VOP Bus Driver
>> #
>>
>> #
>> # Intel MIC Host Driver
>> #
>>
>> #
>> # Intel MIC Card Driver
>> #
>>
>> #
>> # SCIF Driver
>> #
>>
>> #
>> # Intel MIC Coprocessor State Management (COSM) Drivers
>> #
>>
>> #
>> # VOP Driver
>> #
>> # CONFIG_ECHO is not set
>> # CONFIG_CXL_BASE is not set
>> # CONFIG_CXL_AFU_DRIVER_OPS is not set
>> # CONFIG_CXL_LIB is not set
>> CONFIG_HAVE_IDE=3Dy
>> CONFIG_IDE=3Dy
>>
>> #
>> # Please see Documentation/ide/ide.txt for help/info on IDE drives
>> #
>> CONFIG_IDE_XFER_MODE=3Dy
>> CONFIG_IDE_TIMINGS=3Dy
>> CONFIG_IDE_ATAPI=3Dy
>> # CONFIG_BLK_DEV_IDE_SATA is not set
>> CONFIG_IDE_GD=3Dy
>> # CONFIG_IDE_GD_ATA is not set
>> # CONFIG_IDE_GD_ATAPI is not set
>> # CONFIG_BLK_DEV_IDECS is not set
>> # CONFIG_BLK_DEV_DELKIN is not set
>> # CONFIG_BLK_DEV_IDECD is not set
>> CONFIG_BLK_DEV_IDETAPE=3Dy
>> # CONFIG_BLK_DEV_IDEACPI is not set
>> # CONFIG_IDE_TASK_IOCTL is not set
>> CONFIG_IDE_PROC_FS=3Dy
>>
>> #
>> # IDE chipset support/bugfixes
>> #
>> CONFIG_IDE_GENERIC=3Dy
>> CONFIG_BLK_DEV_PLATFORM=3Dy
>> CONFIG_BLK_DEV_CMD640=3Dy
>> CONFIG_BLK_DEV_CMD640_ENHANCED=3Dy
>> # CONFIG_BLK_DEV_IDEPNP is not set
>>
>> #
>> # PCI IDE chipsets support
>> #
>> # CONFIG_BLK_DEV_GENERIC is not set
>> # CONFIG_BLK_DEV_OPTI621 is not set
>> # CONFIG_BLK_DEV_RZ1000 is not set
>> # CONFIG_BLK_DEV_AEC62XX is not set
>> # CONFIG_BLK_DEV_ALI15X3 is not set
>> # CONFIG_BLK_DEV_AMD74XX is not set
>> # CONFIG_BLK_DEV_ATIIXP is not set
>> # CONFIG_BLK_DEV_CMD64X is not set
>> # CONFIG_BLK_DEV_TRIFLEX is not set
>> # CONFIG_BLK_DEV_CS5520 is not set
>> # CONFIG_BLK_DEV_CS5530 is not set
>> # CONFIG_BLK_DEV_CS5535 is not set
>> # CONFIG_BLK_DEV_CS5536 is not set
>> # CONFIG_BLK_DEV_HPT366 is not set
>> # CONFIG_BLK_DEV_JMICRON is not set
>> # CONFIG_BLK_DEV_SC1200 is not set
>> # CONFIG_BLK_DEV_PIIX is not set
>> # CONFIG_BLK_DEV_IT8172 is not set
>> # CONFIG_BLK_DEV_IT8213 is not set
>> # CONFIG_BLK_DEV_IT821X is not set
>> # CONFIG_BLK_DEV_NS87415 is not set
>> # CONFIG_BLK_DEV_PDC202XX_OLD is not set
>> # CONFIG_BLK_DEV_PDC202XX_NEW is not set
>> # CONFIG_BLK_DEV_SVWKS is not set
>> # CONFIG_BLK_DEV_SIIMAGE is not set
>> # CONFIG_BLK_DEV_SIS5513 is not set
>> # CONFIG_BLK_DEV_SLC90E66 is not set
>> # CONFIG_BLK_DEV_TRM290 is not set
>> # CONFIG_BLK_DEV_VIA82CXXX is not set
>> # CONFIG_BLK_DEV_TC86C001 is not set
>> # CONFIG_BLK_DEV_IDEDMA is not set
>>
>> #
>> # SCSI device support
>> #
>> CONFIG_SCSI_MOD=3Dy
>> CONFIG_RAID_ATTRS=3Dy
>> CONFIG_SCSI=3Dy
>> CONFIG_SCSI_DMA=3Dy
>> # CONFIG_SCSI_NETLINK is not set
>> CONFIG_SCSI_MQ_DEFAULT=3Dy
>> CONFIG_SCSI_PROC_FS=3Dy
>>
>> #
>> # SCSI support type (disk, tape, CD-ROM)
>> #
>> CONFIG_BLK_DEV_SD=3Dy
>> CONFIG_CHR_DEV_ST=3Dy
>> # CONFIG_CHR_DEV_OSST is not set
>> # CONFIG_BLK_DEV_SR is not set
>> # CONFIG_CHR_DEV_SG is not set
>> CONFIG_CHR_DEV_SCH=3Dy
>> # CONFIG_SCSI_CONSTANTS is not set
>> # CONFIG_SCSI_LOGGING is not set
>> CONFIG_SCSI_SCAN_ASYNC=3Dy
>>
>> #
>> # SCSI Transports
>> #
>> # CONFIG_SCSI_SPI_ATTRS is not set
>> # CONFIG_SCSI_FC_ATTRS is not set
>> CONFIG_SCSI_ISCSI_ATTRS=3Dy
>> CONFIG_SCSI_SAS_ATTRS=3Dy
>> CONFIG_SCSI_SAS_LIBSAS=3Dy
>> CONFIG_SCSI_SAS_ATA=3Dy
>> CONFIG_SCSI_SAS_HOST_SMP=3Dy
>> CONFIG_SCSI_SRP_ATTRS=3Dy
>> CONFIG_SCSI_LOWLEVEL=3Dy
>> CONFIG_ISCSI_TCP=3Dy
>> CONFIG_ISCSI_BOOT_SYSFS=3Dy
>> # CONFIG_SCSI_CXGB3_ISCSI is not set
>> # CONFIG_SCSI_CXGB4_ISCSI is not set
>> # CONFIG_SCSI_BNX2_ISCSI is not set
>> # CONFIG_BE2ISCSI is not set
>> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
>> # CONFIG_SCSI_HPSA is not set
>> # CONFIG_SCSI_3W_9XXX is not set
>> # CONFIG_SCSI_3W_SAS is not set
>> # CONFIG_SCSI_ACARD is not set
>> # CONFIG_SCSI_AACRAID is not set
>> # CONFIG_SCSI_AIC7XXX is not set
>> # CONFIG_SCSI_AIC79XX is not set
>> # CONFIG_SCSI_AIC94XX is not set
>> # CONFIG_SCSI_MVSAS is not set
>> # CONFIG_SCSI_MVUMI is not set
>> # CONFIG_SCSI_DPT_I2O is not set
>> # CONFIG_SCSI_ADVANSYS is not set
>> # CONFIG_SCSI_ARCMSR is not set
>> # CONFIG_SCSI_ESAS2R is not set
>> # CONFIG_MEGARAID_NEWGEN is not set
>> # CONFIG_MEGARAID_LEGACY is not set
>> # CONFIG_MEGARAID_SAS is not set
>> # CONFIG_SCSI_MPT3SAS is not set
>> # CONFIG_SCSI_MPT2SAS is not set
>> # CONFIG_SCSI_SMARTPQI is not set
>> # CONFIG_SCSI_UFSHCD is not set
>> # CONFIG_SCSI_HPTIOP is not set
>> # CONFIG_SCSI_BUSLOGIC is not set
>> # CONFIG_VMWARE_PVSCSI is not set
>> # CONFIG_SCSI_SNIC is not set
>> # CONFIG_SCSI_DMX3191D is not set
>> # CONFIG_SCSI_EATA is not set
>> # CONFIG_SCSI_FUTURE_DOMAIN is not set
>> # CONFIG_SCSI_GDTH is not set
>> # CONFIG_SCSI_ISCI is not set
>> # CONFIG_SCSI_IPS is not set
>> # CONFIG_SCSI_INITIO is not set
>> # CONFIG_SCSI_INIA100 is not set
>> CONFIG_SCSI_PPA=3Dy
>> CONFIG_SCSI_IMM=3Dy
>> CONFIG_SCSI_IZIP_EPP16=3Dy
>> CONFIG_SCSI_IZIP_SLOW_CTR=3Dy
>> # CONFIG_SCSI_STEX is not set
>> # CONFIG_SCSI_SYM53C8XX_2 is not set
>> # CONFIG_SCSI_IPR is not set
>> # CONFIG_SCSI_QLOGIC_1280 is not set
>> # CONFIG_SCSI_QLA_ISCSI is not set
>> # CONFIG_SCSI_DC395x is not set
>> # CONFIG_SCSI_AM53C974 is not set
>> # CONFIG_SCSI_NSP32 is not set
>> # CONFIG_SCSI_WD719X is not set
>> CONFIG_SCSI_DEBUG=3Dy
>> # CONFIG_SCSI_PMCRAID is not set
>> # CONFIG_SCSI_PM8001 is not set
>> # CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
>> # CONFIG_SCSI_DH is not set
>> CONFIG_SCSI_OSD_INITIATOR=3Dy
>> CONFIG_SCSI_OSD_ULD=3Dy
>> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
>> # CONFIG_SCSI_OSD_DEBUG is not set
>> CONFIG_ATA=3Dy
>> # CONFIG_ATA_NONSTANDARD is not set
>> # CONFIG_ATA_VERBOSE_ERROR is not set
>> CONFIG_ATA_ACPI=3Dy
>> CONFIG_SATA_PMP=3Dy
>>
>> #
>> # Controllers with non-SFF native interface
>> #
>> # CONFIG_SATA_AHCI is not set
>> # CONFIG_SATA_AHCI_PLATFORM is not set
>> CONFIG_AHCI_CEVA=3Dy
>> # CONFIG_AHCI_QORIQ is not set
>> # CONFIG_SATA_INIC162X is not set
>> # CONFIG_SATA_ACARD_AHCI is not set
>> # CONFIG_SATA_SIL24 is not set
>> CONFIG_ATA_SFF=3Dy
>>
>> #
>> # SFF controllers with custom DMA interface
>> #
>> # CONFIG_PDC_ADMA is not set
>> # CONFIG_SATA_QSTOR is not set
>> # CONFIG_SATA_SX4 is not set
>> CONFIG_ATA_BMDMA=3Dy
>>
>> #
>> # SATA SFF controllers with BMDMA
>> #
>> # CONFIG_ATA_PIIX is not set
>> CONFIG_SATA_DWC=3Dy
>> CONFIG_SATA_DWC_OLD_DMA=3Dy
>> # CONFIG_SATA_DWC_DEBUG is not set
>> # CONFIG_SATA_MV is not set
>> # CONFIG_SATA_NV is not set
>> # CONFIG_SATA_PROMISE is not set
>> # CONFIG_SATA_SIL is not set
>> # CONFIG_SATA_SIS is not set
>> # CONFIG_SATA_SVW is not set
>> # CONFIG_SATA_ULI is not set
>> # CONFIG_SATA_VIA is not set
>> # CONFIG_SATA_VITESSE is not set
>>
>> #
>> # PATA SFF controllers with BMDMA
>> #
>> # CONFIG_PATA_ALI is not set
>> # CONFIG_PATA_AMD is not set
>> # CONFIG_PATA_ARTOP is not set
>> # CONFIG_PATA_ATIIXP is not set
>> # CONFIG_PATA_ATP867X is not set
>> # CONFIG_PATA_CMD64X is not set
>> # CONFIG_PATA_CS5520 is not set
>> # CONFIG_PATA_CS5530 is not set
>> # CONFIG_PATA_CS5535 is not set
>> # CONFIG_PATA_CS5536 is not set
>> # CONFIG_PATA_CYPRESS is not set
>> # CONFIG_PATA_EFAR is not set
>> # CONFIG_PATA_HPT366 is not set
>> # CONFIG_PATA_HPT37X is not set
>> # CONFIG_PATA_HPT3X2N is not set
>> # CONFIG_PATA_HPT3X3 is not set
>> # CONFIG_PATA_IT8213 is not set
>> # CONFIG_PATA_IT821X is not set
>> # CONFIG_PATA_JMICRON is not set
>> # CONFIG_PATA_MARVELL is not set
>> # CONFIG_PATA_NETCELL is not set
>> # CONFIG_PATA_NINJA32 is not set
>> # CONFIG_PATA_NS87415 is not set
>> # CONFIG_PATA_OLDPIIX is not set
>> # CONFIG_PATA_OPTIDMA is not set
>> # CONFIG_PATA_PDC2027X is not set
>> # CONFIG_PATA_PDC_OLD is not set
>> # CONFIG_PATA_RADISYS is not set
>> # CONFIG_PATA_RDC is not set
>> # CONFIG_PATA_SC1200 is not set
>> # CONFIG_PATA_SCH is not set
>> # CONFIG_PATA_SERVERWORKS is not set
>> # CONFIG_PATA_SIL680 is not set
>> # CONFIG_PATA_SIS is not set
>> # CONFIG_PATA_TOSHIBA is not set
>> # CONFIG_PATA_TRIFLEX is not set
>> # CONFIG_PATA_VIA is not set
>> # CONFIG_PATA_WINBOND is not set
>>
>> #
>> # PIO-only SFF controllers
>> #
>> # CONFIG_PATA_CMD640_PCI is not set
>> # CONFIG_PATA_MPIIX is not set
>> # CONFIG_PATA_NS87410 is not set
>> # CONFIG_PATA_OPTI is not set
>> # CONFIG_PATA_PCMCIA is not set
>> CONFIG_PATA_PLATFORM=3Dy
>> CONFIG_PATA_OF_PLATFORM=3Dy
>> # CONFIG_PATA_RZ1000 is not set
>>
>> #
>> # Generic fallback / legacy drivers
>> #
>> # CONFIG_PATA_ACPI is not set
>> # CONFIG_ATA_GENERIC is not set
>> # CONFIG_PATA_LEGACY is not set
>> # CONFIG_MD is not set
>> CONFIG_TARGET_CORE=3Dy
>> CONFIG_TCM_IBLOCK=3Dy
>> CONFIG_TCM_FILEIO=3Dy
>> CONFIG_TCM_PSCSI=3Dy
>> CONFIG_TCM_USER2=3Dy
>> CONFIG_LOOPBACK_TARGET=3Dy
>> CONFIG_ISCSI_TARGET=3Dy
>> # CONFIG_FUSION is not set
>>
>> #
>> # IEEE 1394 (FireWire) support
>> #
>> # CONFIG_FIREWIRE is not set
>> # CONFIG_FIREWIRE_NOSY is not set
>> # CONFIG_MACINTOSH_DRIVERS is not set
>> CONFIG_NETDEVICES=3Dy
>> CONFIG_NET_CORE=3Dy
>> # CONFIG_BONDING is not set
>> # CONFIG_DUMMY is not set
>> # CONFIG_EQUALIZER is not set
>> # CONFIG_NET_FC is not set
>> # CONFIG_NET_TEAM is not set
>> # CONFIG_MACVLAN is not set
>> # CONFIG_VXLAN is not set
>> # CONFIG_GENEVE is not set
>> # CONFIG_GTP is not set
>> # CONFIG_MACSEC is not set
>> # CONFIG_NETCONSOLE is not set
>> # CONFIG_NETPOLL is not set
>> # CONFIG_NET_POLL_CONTROLLER is not set
>> # CONFIG_TUN is not set
>> # CONFIG_TUN_VNET_CROSS_LE is not set
>> # CONFIG_VETH is not set
>> # CONFIG_NLMON is not set
>> # CONFIG_ARCNET is not set
>>
>> #
>> # CAIF transport drivers
>> #
>> # CONFIG_CAIF_TTY is not set
>> # CONFIG_CAIF_SPI_SLAVE is not set
>> # CONFIG_CAIF_HSI is not set
>> # CONFIG_CAIF_VIRTIO is not set
>>
>> #
>> # Distributed Switch Architecture drivers
>> #
>> CONFIG_ETHERNET=3Dy
>> CONFIG_MDIO=3Dy
>> CONFIG_NET_VENDOR_3COM=3Dy
>> # CONFIG_PCMCIA_3C574 is not set
>> # CONFIG_PCMCIA_3C589 is not set
>> # CONFIG_VORTEX is not set
>> # CONFIG_TYPHOON is not set
>> CONFIG_NET_VENDOR_ADAPTEC=3Dy
>> # CONFIG_ADAPTEC_STARFIRE is not set
>> CONFIG_NET_VENDOR_AGERE=3Dy
>> # CONFIG_ET131X is not set
>> CONFIG_NET_VENDOR_ALACRITECH=3Dy
>> # CONFIG_SLICOSS is not set
>> CONFIG_NET_VENDOR_ALTEON=3Dy
>> # CONFIG_ACENIC is not set
>> # CONFIG_ALTERA_TSE is not set
>> CONFIG_NET_VENDOR_AMAZON=3Dy
>> CONFIG_NET_VENDOR_AMD=3Dy
>> # CONFIG_AMD8111_ETH is not set
>> # CONFIG_PCNET32 is not set
>> # CONFIG_PCMCIA_NMCLAN is not set
>> # CONFIG_AMD_XGBE is not set
>> # CONFIG_AMD_XGBE_HAVE_ECC is not set
>> CONFIG_NET_VENDOR_AQUANTIA=3Dy
>> CONFIG_NET_VENDOR_ARC=3Dy
>> CONFIG_NET_VENDOR_ATHEROS=3Dy
>> # CONFIG_ATL2 is not set
>> # CONFIG_ATL1 is not set
>> # CONFIG_ATL1E is not set
>> # CONFIG_ATL1C is not set
>> # CONFIG_ALX is not set
>> # CONFIG_NET_VENDOR_AURORA is not set
>> CONFIG_NET_CADENCE=3Dy
>> # CONFIG_MACB is not set
>> CONFIG_NET_VENDOR_BROADCOM=3Dy
>> # CONFIG_B44 is not set
>> # CONFIG_BCMGENET is not set
>> # CONFIG_BNX2 is not set
>> # CONFIG_CNIC is not set
>> # CONFIG_TIGON3 is not set
>> # CONFIG_BNX2X is not set
>> # CONFIG_SYSTEMPORT is not set
>> # CONFIG_BNXT is not set
>> CONFIG_NET_VENDOR_BROCADE=3Dy
>> # CONFIG_BNA is not set
>> CONFIG_NET_VENDOR_CAVIUM=3Dy
>> CONFIG_NET_VENDOR_CHELSIO=3Dy
>> # CONFIG_CHELSIO_T1 is not set
>> # CONFIG_CHELSIO_T3 is not set
>> # CONFIG_CHELSIO_T4 is not set
>> # CONFIG_CHELSIO_T4VF is not set
>> CONFIG_NET_VENDOR_CISCO=3Dy
>> # CONFIG_ENIC is not set
>> # CONFIG_CX_ECAT is not set
>> # CONFIG_DNET is not set
>> CONFIG_NET_VENDOR_DEC=3Dy
>> # CONFIG_NET_TULIP is not set
>> CONFIG_NET_VENDOR_DLINK=3Dy
>> # CONFIG_DL2K is not set
>> # CONFIG_SUNDANCE is not set
>> CONFIG_NET_VENDOR_EMULEX=3Dy
>> # CONFIG_BE2NET is not set
>> CONFIG_NET_VENDOR_EZCHIP=3Dy
>> # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
>> CONFIG_NET_VENDOR_EXAR=3Dy
>> # CONFIG_S2IO is not set
>> # CONFIG_VXGE is not set
>> CONFIG_NET_VENDOR_FUJITSU=3Dy
>> # CONFIG_PCMCIA_FMVJ18X is not set
>> CONFIG_NET_VENDOR_HP=3Dy
>> # CONFIG_HP100 is not set
>> CONFIG_NET_VENDOR_HUAWEI=3Dy
>> CONFIG_NET_VENDOR_INTEL=3Dy
>> # CONFIG_E100 is not set
>> CONFIG_E1000=3Dy
>> CONFIG_E1000E=3Dy
>> CONFIG_E1000E_HWTS=3Dy
>> CONFIG_IGB=3Dy
>> CONFIG_IGB_HWMON=3Dy
>> # CONFIG_IGBVF is not set
>> # CONFIG_IXGB is not set
>> CONFIG_IXGBE=3Dy
>> CONFIG_IXGBE_HWMON=3Dy
>> # CONFIG_IXGBE_DCB is not set
>> # CONFIG_I40E is not set
>> CONFIG_NET_VENDOR_I825XX=3Dy
>> # CONFIG_JME is not set
>> CONFIG_NET_VENDOR_MARVELL=3Dy
>> # CONFIG_MVMDIO is not set
>> # CONFIG_MVNETA_BM is not set
>> # CONFIG_SKGE is not set
>> # CONFIG_SKY2 is not set
>> CONFIG_NET_VENDOR_MELLANOX=3Dy
>> # CONFIG_MLX4_EN is not set
>> # CONFIG_MLX4_CORE is not set
>> # CONFIG_MLX5_CORE is not set
>> # CONFIG_MLXSW_CORE is not set
>> # CONFIG_MLXFW is not set
>> CONFIG_NET_VENDOR_MICREL=3Dy
>> # CONFIG_KS8842 is not set
>> # CONFIG_KS8851_MLL is not set
>> # CONFIG_KSZ884X_PCI is not set
>> CONFIG_NET_VENDOR_MYRI=3Dy
>> # CONFIG_MYRI10GE is not set
>> # CONFIG_FEALNX is not set
>> CONFIG_NET_VENDOR_NATSEMI=3Dy
>> # CONFIG_NATSEMI is not set
>> # CONFIG_NS83820 is not set
>> CONFIG_NET_VENDOR_NETRONOME=3Dy
>> CONFIG_NET_VENDOR_8390=3Dy
>> # CONFIG_PCMCIA_AXNET is not set
>> # CONFIG_NE2K_PCI is not set
>> # CONFIG_PCMCIA_PCNET is not set
>> CONFIG_NET_VENDOR_NVIDIA=3Dy
>> # CONFIG_FORCEDETH is not set
>> CONFIG_NET_VENDOR_OKI=3Dy
>> # CONFIG_PCH_GBE is not set
>> # CONFIG_ETHOC is not set
>> CONFIG_NET_PACKET_ENGINE=3Dy
>> # CONFIG_HAMACHI is not set
>> # CONFIG_YELLOWFIN is not set
>> CONFIG_NET_VENDOR_QLOGIC=3Dy
>> # CONFIG_QLA3XXX is not set
>> # CONFIG_QLCNIC is not set
>> # CONFIG_QLGE is not set
>> # CONFIG_NETXEN_NIC is not set
>> # CONFIG_QED is not set
>> CONFIG_NET_VENDOR_QUALCOMM=3Dy
>> # CONFIG_QCA7000_UART is not set
>> # CONFIG_QCOM_EMAC is not set
>> # CONFIG_RMNET is not set
>> CONFIG_NET_VENDOR_REALTEK=3Dy
>> # CONFIG_ATP is not set
>> # CONFIG_8139CP is not set
>> # CONFIG_8139TOO is not set
>> # CONFIG_R8169 is not set
>> CONFIG_NET_VENDOR_RENESAS=3Dy
>> CONFIG_NET_VENDOR_RDC=3Dy
>> # CONFIG_R6040 is not set
>> CONFIG_NET_VENDOR_ROCKER=3Dy
>> # CONFIG_ROCKER is not set
>> CONFIG_NET_VENDOR_SAMSUNG=3Dy
>> # CONFIG_SXGBE_ETH is not set
>> CONFIG_NET_VENDOR_SEEQ=3Dy
>> CONFIG_NET_VENDOR_SILAN=3Dy
>> # CONFIG_SC92031 is not set
>> CONFIG_NET_VENDOR_SIS=3Dy
>> # CONFIG_SIS900 is not set
>> # CONFIG_SIS190 is not set
>> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
>> # CONFIG_SFC is not set
>> # CONFIG_SFC_FALCON is not set
>> CONFIG_NET_VENDOR_SMSC=3Dy
>> # CONFIG_PCMCIA_SMC91C92 is not set
>> # CONFIG_EPIC100 is not set
>> # CONFIG_SMSC911X is not set
>> # CONFIG_SMSC9420 is not set
>> CONFIG_NET_VENDOR_STMICRO=3Dy
>> # CONFIG_STMMAC_ETH is not set
>> CONFIG_NET_VENDOR_SUN=3Dy
>> # CONFIG_HAPPYMEAL is not set
>> # CONFIG_SUNGEM is not set
>> # CONFIG_CASSINI is not set
>> # CONFIG_NIU is not set
>> CONFIG_NET_VENDOR_TEHUTI=3Dy
>> # CONFIG_TEHUTI is not set
>> CONFIG_NET_VENDOR_TI=3Dy
>> # CONFIG_TI_CPSW_ALE is not set
>> # CONFIG_TLAN is not set
>> CONFIG_NET_VENDOR_VIA=3Dy
>> # CONFIG_VIA_RHINE is not set
>> # CONFIG_VIA_VELOCITY is not set
>> CONFIG_NET_VENDOR_WIZNET=3Dy
>> # CONFIG_WIZNET_W5100 is not set
>> # CONFIG_WIZNET_W5300 is not set
>> CONFIG_NET_VENDOR_XIRCOM=3Dy
>> # CONFIG_PCMCIA_XIRC2PS is not set
>> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
>> # CONFIG_DWC_XLGMAC is not set
>> # CONFIG_FDDI is not set
>> # CONFIG_HIPPI is not set
>> # CONFIG_NET_SB1000 is not set
>> # CONFIG_MDIO_DEVICE is not set
>> # CONFIG_MDIO_BUS is not set
>> # CONFIG_PHYLIB is not set
>> # CONFIG_PLIP is not set
>> # CONFIG_PPP is not set
>> # CONFIG_SLIP is not set
>>
>> #
>> # Host-side USB support is needed for USB Network Adapter support
>> #
>> CONFIG_WLAN=3Dy
>> # CONFIG_WIRELESS_WDS is not set
>> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
>> CONFIG_WLAN_VENDOR_ATH=3Dy
>> # CONFIG_ATH_DEBUG is not set
>> # CONFIG_ATH5K_PCI is not set
>> CONFIG_WLAN_VENDOR_ATMEL=3Dy
>> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
>> CONFIG_WLAN_VENDOR_CISCO=3Dy
>> CONFIG_WLAN_VENDOR_INTEL=3Dy
>> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
>> # CONFIG_HOSTAP is not set
>> # CONFIG_PRISM54 is not set
>> CONFIG_WLAN_VENDOR_MARVELL=3Dy
>> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
>> CONFIG_WLAN_VENDOR_RALINK=3Dy
>> CONFIG_WLAN_VENDOR_REALTEK=3Dy
>> CONFIG_WLAN_VENDOR_RSI=3Dy
>> CONFIG_WLAN_VENDOR_ST=3Dy
>> CONFIG_WLAN_VENDOR_TI=3Dy
>> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
>> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
>> # CONFIG_PCMCIA_RAYCS is not set
>>
>> #
>> # Enable WiMAX (Networking options) to see the WiMAX drivers
>> #
>> # CONFIG_WAN is not set
>> CONFIG_IEEE802154_DRIVERS=3Dy
>> # CONFIG_VMXNET3 is not set
>> # CONFIG_FUJITSU_ES is not set
>> # CONFIG_ISDN is not set
>> # CONFIG_NVM is not set
>>
>> #
>> # Input device support
>> #
>> CONFIG_INPUT=3Dy
>> CONFIG_INPUT_LEDS=3Dy
>> # CONFIG_INPUT_FF_MEMLESS is not set
>> CONFIG_INPUT_POLLDEV=3Dy
>> CONFIG_INPUT_SPARSEKMAP=3Dy
>> CONFIG_INPUT_MATRIXKMAP=3Dy
>>
>> #
>> # Userland interfaces
>> #
>> CONFIG_INPUT_MOUSEDEV=3Dy
>> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
>> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
>> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
>> CONFIG_INPUT_JOYDEV=3Dy
>> CONFIG_INPUT_EVDEV=3Dy
>> CONFIG_INPUT_EVBUG=3Dy
>>
>> #
>> # Input Device Drivers
>> #
>> CONFIG_INPUT_KEYBOARD=3Dy
>> CONFIG_KEYBOARD_ADC=3Dy
>> CONFIG_KEYBOARD_ADP5588=3Dy
>> CONFIG_KEYBOARD_ADP5589=3Dy
>> CONFIG_KEYBOARD_ATKBD=3Dy
>> # CONFIG_KEYBOARD_QT1070 is not set
>> CONFIG_KEYBOARD_QT2160=3Dy
>> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
>> CONFIG_KEYBOARD_LKKBD=3Dy
>> CONFIG_KEYBOARD_GPIO=3Dy
>> # CONFIG_KEYBOARD_GPIO_POLLED is not set
>> # CONFIG_KEYBOARD_TCA6416 is not set
>> # CONFIG_KEYBOARD_TCA8418 is not set
>> CONFIG_KEYBOARD_MATRIX=3Dy
>> # CONFIG_KEYBOARD_LM8323 is not set
>> CONFIG_KEYBOARD_LM8333=3Dy
>> CONFIG_KEYBOARD_MAX7359=3Dy
>> CONFIG_KEYBOARD_MCS=3Dy
>> # CONFIG_KEYBOARD_MPR121 is not set
>> CONFIG_KEYBOARD_NEWTON=3Dy
>> # CONFIG_KEYBOARD_OPENCORES is not set
>> # CONFIG_KEYBOARD_SAMSUNG is not set
>> CONFIG_KEYBOARD_STOWAWAY=3Dy
>> # CONFIG_KEYBOARD_SUNKBD is not set
>> CONFIG_KEYBOARD_OMAP4=3Dy
>> CONFIG_KEYBOARD_TC3589X=3Dy
>> CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
>> # CONFIG_KEYBOARD_XTKBD is not set
>> # CONFIG_KEYBOARD_CAP11XX is not set
>> # CONFIG_KEYBOARD_BCM is not set
>> CONFIG_INPUT_MOUSE=3Dy
>> CONFIG_MOUSE_PS2=3Dy
>> CONFIG_MOUSE_PS2_ALPS=3Dy
>> CONFIG_MOUSE_PS2_BYD=3Dy
>> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
>> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
>> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
>> # CONFIG_MOUSE_PS2_CYPRESS is not set
>> # CONFIG_MOUSE_PS2_LIFEBOOK is not set
>> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
>> CONFIG_MOUSE_PS2_ELANTECH=3Dy
>> CONFIG_MOUSE_PS2_SENTELIC=3Dy
>> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
>> # CONFIG_MOUSE_PS2_FOCALTECH is not set
>> # CONFIG_MOUSE_PS2_VMMOUSE is not set
>> CONFIG_MOUSE_PS2_SMBUS=3Dy
>> CONFIG_MOUSE_SERIAL=3Dy
>> # CONFIG_MOUSE_APPLETOUCH is not set
>> # CONFIG_MOUSE_BCM5974 is not set
>> # CONFIG_MOUSE_CYAPA is not set
>> # CONFIG_MOUSE_ELAN_I2C is not set
>> CONFIG_MOUSE_VSXXXAA=3Dy
>> CONFIG_MOUSE_GPIO=3Dy
>> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
>> # CONFIG_MOUSE_SYNAPTICS_USB is not set
>> # CONFIG_INPUT_JOYSTICK is not set
>> CONFIG_INPUT_TABLET=3Dy
>> # CONFIG_TABLET_USB_ACECAD is not set
>> # CONFIG_TABLET_USB_AIPTEK is not set
>> # CONFIG_TABLET_USB_HANWANG is not set
>> # CONFIG_TABLET_USB_KBTAB is not set
>> # CONFIG_TABLET_USB_PEGASUS is not set
>> # CONFIG_TABLET_SERIAL_WACOM4 is not set
>> CONFIG_INPUT_TOUCHSCREEN=3Dy
>> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
>> # CONFIG_TOUCHSCREEN_AD7879 is not set
>> CONFIG_TOUCHSCREEN_AR1021_I2C=3Dy
>> # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
>> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
>> # CONFIG_TOUCHSCREEN_BU21013 is not set
>> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
>> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
>> # CONFIG_TOUCHSCREEN_DA9052 is not set
>> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
>> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
>> CONFIG_TOUCHSCREEN_EETI=3Dy
>> CONFIG_TOUCHSCREEN_EGALAX=3Dy
>> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
>> CONFIG_TOUCHSCREEN_EXC3000=3Dy
>> # CONFIG_TOUCHSCREEN_FUJITSU is not set
>> # CONFIG_TOUCHSCREEN_GOODIX is not set
>> # CONFIG_TOUCHSCREEN_HIDEEP is not set
>> # CONFIG_TOUCHSCREEN_ILI210X is not set
>> CONFIG_TOUCHSCREEN_S6SY761=3Dy
>> CONFIG_TOUCHSCREEN_GUNZE=3Dy
>> CONFIG_TOUCHSCREEN_EKTF2127=3Dy
>> # CONFIG_TOUCHSCREEN_ELAN is not set
>> # CONFIG_TOUCHSCREEN_ELO is not set
>> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
>> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
>> CONFIG_TOUCHSCREEN_MAX11801=3Dy
>> # CONFIG_TOUCHSCREEN_MCS5000 is not set
>> # CONFIG_TOUCHSCREEN_MMS114 is not set
>> # CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
>> # CONFIG_TOUCHSCREEN_MTOUCH is not set
>> CONFIG_TOUCHSCREEN_IMX6UL_TSC=3Dy
>> CONFIG_TOUCHSCREEN_INEXIO=3Dy
>> CONFIG_TOUCHSCREEN_MK712=3Dy
>> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
>> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
>> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
>> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
>> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
>> CONFIG_TOUCHSCREEN_UCB1400=3Dy
>> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
>> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
>> CONFIG_TOUCHSCREEN_WM97XX=3Dy
>> CONFIG_TOUCHSCREEN_WM9705=3Dy
>> CONFIG_TOUCHSCREEN_WM9712=3Dy
>> CONFIG_TOUCHSCREEN_WM9713=3Dy
>> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
>> # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
>> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
>> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
>> CONFIG_TOUCHSCREEN_TSC2004=3Dy
>> CONFIG_TOUCHSCREEN_TSC2007=3Dy
>> # CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
>> # CONFIG_TOUCHSCREEN_RM_TS is not set
>> CONFIG_TOUCHSCREEN_SILEAD=3Dy
>> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
>> # CONFIG_TOUCHSCREEN_ST1232 is not set
>> CONFIG_TOUCHSCREEN_STMFTS=3Dy
>> CONFIG_TOUCHSCREEN_SX8654=3Dy
>> # CONFIG_TOUCHSCREEN_TPS6507X is not set
>> CONFIG_TOUCHSCREEN_ZET6223=3Dy
>> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
>> CONFIG_TOUCHSCREEN_COLIBRI_VF50=3Dy
>> # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
>> # CONFIG_INPUT_MISC is not set
>> # CONFIG_RMI4_CORE is not set
>>
>> #
>> # Hardware I/O ports
>> #
>> CONFIG_SERIO=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>> CONFIG_SERIO_I8042=3Dy
>> CONFIG_SERIO_SERPORT=3Dy
>> CONFIG_SERIO_CT82C710=3Dy
>> CONFIG_SERIO_PARKBD=3Dy
>> # CONFIG_SERIO_PCIPS2 is not set
>> CONFIG_SERIO_LIBPS2=3Dy
>> # CONFIG_SERIO_RAW is not set
>> # CONFIG_SERIO_ALTERA_PS2 is not set
>> CONFIG_SERIO_PS2MULT=3Dy
>> CONFIG_SERIO_ARC_PS2=3Dy
>> CONFIG_SERIO_APBPS2=3Dy
>> # CONFIG_SERIO_GPIO_PS2 is not set
>> CONFIG_USERIO=3Dy
>> CONFIG_GAMEPORT=3Dy
>> CONFIG_GAMEPORT_NS558=3Dy
>> CONFIG_GAMEPORT_L4=3Dy
>> # CONFIG_GAMEPORT_EMU10K1 is not set
>> # CONFIG_GAMEPORT_FM801 is not set
>>
>> #
>> # Character devices
>> #
>> CONFIG_TTY=3Dy
>> # CONFIG_VT is not set
>> CONFIG_UNIX98_PTYS=3Dy
>> # CONFIG_LEGACY_PTYS is not set
>> CONFIG_SERIAL_NONSTANDARD=3Dy
>> # CONFIG_ROCKETPORT is not set
>> # CONFIG_CYCLADES is not set
>> # CONFIG_MOXA_INTELLIO is not set
>> # CONFIG_MOXA_SMARTIO is not set
>> # CONFIG_SYNCLINK is not set
>> # CONFIG_SYNCLINKMP is not set
>> # CONFIG_SYNCLINK_GT is not set
>> # CONFIG_NOZOMI is not set
>> # CONFIG_ISI is not set
>> CONFIG_N_HDLC=3Dy
>> CONFIG_N_GSM=3Dy
>> # CONFIG_TRACE_SINK is not set
>> # CONFIG_DEVMEM is not set
>> CONFIG_DEVKMEM=3Dy
>>
>> #
>> # Serial drivers
>> #
>> CONFIG_SERIAL_EARLYCON=3Dy
>> CONFIG_SERIAL_8250=3Dy
>> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
>> CONFIG_SERIAL_8250_PNP=3Dy
>> CONFIG_SERIAL_8250_FINTEK=3Dy
>> CONFIG_SERIAL_8250_CONSOLE=3Dy
>> # CONFIG_SERIAL_8250_DMA is not set
>> CONFIG_SERIAL_8250_PCI=3Dy
>> CONFIG_SERIAL_8250_EXAR=3Dy
>> # CONFIG_SERIAL_8250_CS is not set
>> # CONFIG_SERIAL_8250_MEN_MCB is not set
>> CONFIG_SERIAL_8250_NR_UARTS=3D4
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>> CONFIG_SERIAL_8250_EXTENDED=3Dy
>> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
>> CONFIG_SERIAL_8250_ASPEED_VUART=3Dy
>> CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
>> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
>> CONFIG_SERIAL_8250_RSA=3Dy
>> # CONFIG_SERIAL_8250_FSL is not set
>> CONFIG_SERIAL_8250_DW=3Dy
>> CONFIG_SERIAL_8250_RT288X=3Dy
>> CONFIG_SERIAL_8250_LPSS=3Dy
>> CONFIG_SERIAL_8250_MID=3Dy
>> # CONFIG_SERIAL_8250_MOXA is not set
>> CONFIG_SERIAL_OF_PLATFORM=3Dy
>>
>> #
>> # Non-8250 serial port support
>> #
>> CONFIG_SERIAL_UARTLITE=3Dy
>> CONFIG_SERIAL_UARTLITE_CONSOLE=3Dy
>> CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
>> CONFIG_SERIAL_CORE=3Dy
>> CONFIG_SERIAL_CORE_CONSOLE=3Dy
>> # CONFIG_SERIAL_JSM is not set
>> CONFIG_SERIAL_SCCNXP=3Dy
>> CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
>> CONFIG_SERIAL_SC16IS7XX_CORE=3Dy
>> CONFIG_SERIAL_SC16IS7XX=3Dy
>> CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
>> CONFIG_SERIAL_TIMBERDALE=3Dy
>> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
>> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
>> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
>> CONFIG_SERIAL_ALTERA_UART=3Dy
>> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
>> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
>> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
>> # CONFIG_SERIAL_PCH_UART is not set
>> CONFIG_SERIAL_XILINX_PS_UART=3Dy
>> CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
>> CONFIG_SERIAL_ARC=3Dy
>> # CONFIG_SERIAL_ARC_CONSOLE is not set
>> CONFIG_SERIAL_ARC_NR_PORTS=3D1
>> # CONFIG_SERIAL_RP2 is not set
>> CONFIG_SERIAL_FSL_LPUART=3Dy
>> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
>> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
>> # CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
>> CONFIG_SERIAL_MEN_Z135=3Dy
>> CONFIG_SERIAL_DEV_BUS=3Dy
>> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
>> CONFIG_TTY_PRINTK=3Dy
>> CONFIG_PRINTER=3Dy
>> CONFIG_LP_CONSOLE=3Dy
>> CONFIG_PPDEV=3Dy
>> # CONFIG_IPMI_HANDLER is not set
>> CONFIG_HW_RANDOM=3Dy
>> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
>> CONFIG_HW_RANDOM_INTEL=3Dy
>> CONFIG_HW_RANDOM_AMD=3Dy
>> CONFIG_HW_RANDOM_GEODE=3Dy
>> CONFIG_HW_RANDOM_VIA=3Dy
>> CONFIG_NVRAM=3Dy
>> # CONFIG_R3964 is not set
>> # CONFIG_APPLICOM is not set
>> # CONFIG_SONYPI is not set
>>
>> #
>> # PCMCIA character devices
>> #
>> # CONFIG_SYNCLINK_CS is not set
>> # CONFIG_CARDMAN_4000 is not set
>> CONFIG_CARDMAN_4040=3Dy
>> # CONFIG_SCR24X is not set
>> # CONFIG_IPWIRELESS is not set
>> # CONFIG_MWAVE is not set
>> CONFIG_SCx200_GPIO=3Dy
>> # CONFIG_PC8736x_GPIO is not set
>> CONFIG_NSC_GPIO=3Dy
>> CONFIG_RAW_DRIVER=3Dy
>> CONFIG_MAX_RAW_DEVS=3D256
>> # CONFIG_HPET is not set
>> # CONFIG_HANGCHECK_TIMER is not set
>> # CONFIG_TCG_TPM is not set
>> # CONFIG_TELCLOCK is not set
>> CONFIG_DEVPORT=3Dy
>> # CONFIG_XILLYBUS is not set
>>
>> #
>> # I2C support
>> #
>> CONFIG_I2C=3Dy
>> CONFIG_ACPI_I2C_OPREGION=3Dy
>> CONFIG_I2C_BOARDINFO=3Dy
>> # CONFIG_I2C_COMPAT is not set
>> CONFIG_I2C_CHARDEV=3Dy
>> CONFIG_I2C_MUX=3Dy
>>
>> #
>> # Multiplexer I2C Chip support
>> #
>> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
>> CONFIG_I2C_MUX_GPIO=3Dy
>> # CONFIG_I2C_MUX_GPMUX is not set
>> CONFIG_I2C_MUX_LTC4306=3Dy
>> CONFIG_I2C_MUX_PCA9541=3Dy
>> CONFIG_I2C_MUX_PCA954x=3Dy
>> CONFIG_I2C_MUX_PINCTRL=3Dy
>> CONFIG_I2C_MUX_REG=3Dy
>> CONFIG_I2C_DEMUX_PINCTRL=3Dy
>> CONFIG_I2C_MUX_MLXCPLD=3Dy
>> CONFIG_I2C_HELPER_AUTO=3Dy
>> CONFIG_I2C_ALGOBIT=3Dy
>>
>> #
>> # I2C Hardware Bus support
>> #
>>
>> #
>> # PC SMBus host controller drivers
>> #
>> # CONFIG_I2C_ALI1535 is not set
>> # CONFIG_I2C_ALI1563 is not set
>> # CONFIG_I2C_ALI15X3 is not set
>> # CONFIG_I2C_AMD756 is not set
>> # CONFIG_I2C_AMD8111 is not set
>> # CONFIG_I2C_I801 is not set
>> # CONFIG_I2C_ISCH is not set
>> # CONFIG_I2C_ISMT is not set
>> # CONFIG_I2C_PIIX4 is not set
>> # CONFIG_I2C_NFORCE2 is not set
>> # CONFIG_I2C_SIS5595 is not set
>> # CONFIG_I2C_SIS630 is not set
>> # CONFIG_I2C_SIS96X is not set
>> # CONFIG_I2C_VIA is not set
>> # CONFIG_I2C_VIAPRO is not set
>>
>> #
>> # ACPI drivers
>> #
>> # CONFIG_I2C_SCMI is not set
>>
>> #
>> # I2C system bus drivers (mostly embedded / system-on-chip)
>> #
>> # CONFIG_I2C_CBUS_GPIO is not set
>> CONFIG_I2C_DESIGNWARE_CORE=3Dy
>> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
>> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
>> # CONFIG_I2C_DESIGNWARE_PCI is not set
>> # CONFIG_I2C_EG20T is not set
>> # CONFIG_I2C_EMEV2 is not set
>> CONFIG_I2C_GPIO=3Dy
>> CONFIG_I2C_OCORES=3Dy
>> # CONFIG_I2C_PCA_PLATFORM is not set
>> # CONFIG_I2C_PXA is not set
>> # CONFIG_I2C_PXA_PCI is not set
>> # CONFIG_I2C_RK3X is not set
>> CONFIG_I2C_SIMTEC=3Dy
>> CONFIG_I2C_XILINX=3Dy
>>
>> #
>> # External I2C/SMBus adapter drivers
>> #
>> # CONFIG_I2C_PARPORT is not set
>> # CONFIG_I2C_PARPORT_LIGHT is not set
>> CONFIG_I2C_TAOS_EVM=3Dy
>>
>> #
>> # Other I2C/SMBus bus drivers
>> #
>> # CONFIG_SCx200_ACB is not set
>> CONFIG_I2C_SLAVE=3Dy
>> CONFIG_I2C_SLAVE_EEPROM=3Dy
>> # CONFIG_I2C_DEBUG_CORE is not set
>> # CONFIG_I2C_DEBUG_ALGO is not set
>> # CONFIG_I2C_DEBUG_BUS is not set
>> # CONFIG_SPI is not set
>> CONFIG_SPMI=3Dy
>> # CONFIG_HSI is not set
>> CONFIG_PPS=3Dy
>> # CONFIG_PPS_DEBUG is not set
>>
>> #
>> # PPS clients support
>> #
>> CONFIG_PPS_CLIENT_KTIMER=3Dy
>> CONFIG_PPS_CLIENT_LDISC=3Dy
>> # CONFIG_PPS_CLIENT_PARPORT is not set
>> CONFIG_PPS_CLIENT_GPIO=3Dy
>>
>> #
>> # PPS generators support
>> #
>>
>> #
>> # PTP clock support
>> #
>>
>> #
>> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clock=
s.
>> #
>> CONFIG_PTP_1588_CLOCK_PCH=3Dy
>> CONFIG_PINCTRL=3Dy
>> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
>> CONFIG_PINMUX=3Dy
>> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
>> CONFIG_PINCONF=3Dy
>> CONFIG_GENERIC_PINCONF=3Dy
>> # CONFIG_DEBUG_PINCTRL is not set
>> CONFIG_PINCTRL_AS3722=3Dy
>> CONFIG_PINCTRL_AMD=3Dy
>> # CONFIG_PINCTRL_MCP23S08 is not set
>> CONFIG_PINCTRL_SINGLE=3Dy
>> CONFIG_PINCTRL_SX150X=3Dy
>> # CONFIG_PINCTRL_MAX77620 is not set
>> CONFIG_PINCTRL_PALMAS=3Dy
>> # CONFIG_PINCTRL_BAYTRAIL is not set
>> # CONFIG_PINCTRL_CHERRYVIEW is not set
>> # CONFIG_PINCTRL_BROXTON is not set
>> # CONFIG_PINCTRL_CANNONLAKE is not set
>> # CONFIG_PINCTRL_CEDARFORK is not set
>> # CONFIG_PINCTRL_DENVERTON is not set
>> # CONFIG_PINCTRL_GEMINILAKE is not set
>> # CONFIG_PINCTRL_LEWISBURG is not set
>> # CONFIG_PINCTRL_SUNRISEPOINT is not set
>> CONFIG_GPIOLIB=3Dy
>> CONFIG_OF_GPIO=3Dy
>> CONFIG_GPIO_ACPI=3Dy
>> CONFIG_GPIOLIB_IRQCHIP=3Dy
>> CONFIG_DEBUG_GPIO=3Dy
>> # CONFIG_GPIO_SYSFS is not set
>> CONFIG_GPIO_GENERIC=3Dy
>> CONFIG_GPIO_MAX730X=3Dy
>>
>> #
>> # Memory mapped GPIO drivers
>> #
>> # CONFIG_GPIO_74XX_MMIO is not set
>> CONFIG_GPIO_ALTERA=3Dy
>> # CONFIG_GPIO_AMDPT is not set
>> # CONFIG_GPIO_AXP209 is not set
>> # CONFIG_GPIO_DWAPB is not set
>> # CONFIG_GPIO_EXAR is not set
>> CONFIG_GPIO_FTGPIO010=3Dy
>> # CONFIG_GPIO_GENERIC_PLATFORM is not set
>> CONFIG_GPIO_GRGPIO=3Dy
>> # CONFIG_GPIO_ICH is not set
>> # CONFIG_GPIO_LYNXPOINT is not set
>> CONFIG_GPIO_MB86S7X=3Dy
>> CONFIG_GPIO_MENZ127=3Dy
>> # CONFIG_GPIO_MOCKUP is not set
>> CONFIG_GPIO_SYSCON=3Dy
>> # CONFIG_GPIO_VX855 is not set
>> CONFIG_GPIO_XILINX=3Dy
>>
>> #
>> # Port-mapped I/O GPIO drivers
>> #
>> CONFIG_GPIO_F7188X=3Dy
>> CONFIG_GPIO_IT87=3Dy
>> # CONFIG_GPIO_SCH is not set
>> CONFIG_GPIO_SCH311X=3Dy
>>
>> #
>> # I2C GPIO expanders
>> #
>> CONFIG_GPIO_ADP5588=3Dy
>> CONFIG_GPIO_ADP5588_IRQ=3Dy
>> # CONFIG_GPIO_ADNP is not set
>> CONFIG_GPIO_MAX7300=3Dy
>> # CONFIG_GPIO_MAX732X is not set
>> # CONFIG_GPIO_PCA953X is not set
>> CONFIG_GPIO_PCF857X=3Dy
>> # CONFIG_GPIO_TPIC2810 is not set
>>
>> #
>> # MFD GPIO expanders
>> #
>> # CONFIG_GPIO_BD9571MWV is not set
>> # CONFIG_GPIO_DA9052 is not set
>> CONFIG_GPIO_LP3943=3Dy
>> CONFIG_GPIO_LP87565=3Dy
>> CONFIG_GPIO_MAX77620=3Dy
>> # CONFIG_GPIO_PALMAS is not set
>> # CONFIG_GPIO_TC3589X is not set
>> CONFIG_GPIO_TPS65086=3Dy
>> CONFIG_GPIO_TPS65218=3Dy
>> # CONFIG_GPIO_TPS65910 is not set
>> CONFIG_GPIO_TPS65912=3Dy
>> CONFIG_GPIO_UCB1400=3Dy
>> CONFIG_GPIO_WM8994=3Dy
>>
>> #
>> # PCI GPIO expanders
>> #
>> # CONFIG_GPIO_AMD8111 is not set
>> # CONFIG_GPIO_BT8XX is not set
>> # CONFIG_GPIO_ML_IOH is not set
>> # CONFIG_GPIO_PCH is not set
>> # CONFIG_GPIO_PCI_IDIO_16 is not set
>> # CONFIG_GPIO_RDC321X is not set
>> # CONFIG_GPIO_SODAVILLE is not set
>> CONFIG_W1=3Dy
>> CONFIG_W1_CON=3Dy
>>
>> #
>> # 1-wire Bus Masters
>> #
>> # CONFIG_W1_MASTER_MATROX is not set
>> CONFIG_W1_MASTER_DS2482=3Dy
>> # CONFIG_W1_MASTER_DS1WM is not set
>> CONFIG_W1_MASTER_GPIO=3Dy
>>
>> #
>> # 1-wire Slaves
>> #
>> CONFIG_W1_SLAVE_THERM=3Dy
>> CONFIG_W1_SLAVE_SMEM=3Dy
>> # CONFIG_W1_SLAVE_DS2405 is not set
>> CONFIG_W1_SLAVE_DS2408=3Dy
>> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
>> CONFIG_W1_SLAVE_DS2413=3Dy
>> # CONFIG_W1_SLAVE_DS2406 is not set
>> # CONFIG_W1_SLAVE_DS2423 is not set
>> CONFIG_W1_SLAVE_DS2805=3Dy
>> CONFIG_W1_SLAVE_DS2431=3Dy
>> CONFIG_W1_SLAVE_DS2433=3Dy
>> # CONFIG_W1_SLAVE_DS2433_CRC is not set
>> CONFIG_W1_SLAVE_DS2438=3Dy
>> # CONFIG_W1_SLAVE_DS2760 is not set
>> CONFIG_W1_SLAVE_DS2780=3Dy
>> CONFIG_W1_SLAVE_DS2781=3Dy
>> CONFIG_W1_SLAVE_DS28E04=3Dy
>> CONFIG_W1_SLAVE_DS28E17=3Dy
>> CONFIG_POWER_AVS=3Dy
>> # CONFIG_POWER_RESET is not set
>> CONFIG_POWER_SUPPLY=3Dy
>> CONFIG_POWER_SUPPLY_DEBUG=3Dy
>> CONFIG_PDA_POWER=3Dy
>> CONFIG_GENERIC_ADC_BATTERY=3Dy
>> CONFIG_TEST_POWER=3Dy
>> CONFIG_BATTERY_ACT8945A=3Dy
>> CONFIG_BATTERY_DS2780=3Dy
>> CONFIG_BATTERY_DS2781=3Dy
>> CONFIG_BATTERY_DS2782=3Dy
>> CONFIG_BATTERY_LEGO_EV3=3Dy
>> CONFIG_BATTERY_WM97XX=3Dy
>> CONFIG_BATTERY_SBS=3Dy
>> CONFIG_CHARGER_SBS=3Dy
>> # CONFIG_MANAGER_SBS is not set
>> # CONFIG_BATTERY_BQ27XXX is not set
>> CONFIG_BATTERY_DA9052=3Dy
>> CONFIG_CHARGER_DA9150=3Dy
>> CONFIG_BATTERY_DA9150=3Dy
>> CONFIG_AXP20X_POWER=3Dy
>> CONFIG_AXP288_FUEL_GAUGE=3Dy
>> # CONFIG_BATTERY_MAX17040 is not set
>> CONFIG_BATTERY_MAX17042=3Dy
>> # CONFIG_BATTERY_MAX1721X is not set
>> CONFIG_CHARGER_MAX8903=3Dy
>> # CONFIG_CHARGER_LP8727 is not set
>> # CONFIG_CHARGER_GPIO is not set
>> CONFIG_CHARGER_LTC3651=3Dy
>> # CONFIG_CHARGER_MAX14577 is not set
>> CONFIG_CHARGER_DETECTOR_MAX14656=3Dy
>> # CONFIG_CHARGER_MAX77693 is not set
>> CONFIG_CHARGER_BQ2415X=3Dy
>> CONFIG_CHARGER_BQ24190=3Dy
>> # CONFIG_CHARGER_BQ24257 is not set
>> CONFIG_CHARGER_BQ24735=3Dy
>> CONFIG_CHARGER_BQ25890=3Dy
>> CONFIG_CHARGER_SMB347=3Dy
>> # CONFIG_CHARGER_TPS65090 is not set
>> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
>> CONFIG_BATTERY_RT5033=3Dy
>> # CONFIG_CHARGER_RT9455 is not set
>> CONFIG_HWMON=3Dy
>> CONFIG_HWMON_VID=3Dy
>> # CONFIG_HWMON_DEBUG_CHIP is not set
>>
>> #
>> # Native drivers
>> #
>> # CONFIG_SENSORS_ABITUGURU is not set
>> CONFIG_SENSORS_ABITUGURU3=3Dy
>> CONFIG_SENSORS_AD7414=3Dy
>> CONFIG_SENSORS_AD7418=3Dy
>> CONFIG_SENSORS_ADM1021=3Dy
>> CONFIG_SENSORS_ADM1025=3Dy
>> CONFIG_SENSORS_ADM1026=3Dy
>> # CONFIG_SENSORS_ADM1029 is not set
>> # CONFIG_SENSORS_ADM1031 is not set
>> CONFIG_SENSORS_ADM9240=3Dy
>> # CONFIG_SENSORS_ADT7410 is not set
>> CONFIG_SENSORS_ADT7411=3Dy
>> # CONFIG_SENSORS_ADT7462 is not set
>> # CONFIG_SENSORS_ADT7470 is not set
>> # CONFIG_SENSORS_ADT7475 is not set
>> CONFIG_SENSORS_ASC7621=3Dy
>> # CONFIG_SENSORS_K8TEMP is not set
>> # CONFIG_SENSORS_K10TEMP is not set
>> # CONFIG_SENSORS_FAM15H_POWER is not set
>> # CONFIG_SENSORS_APPLESMC is not set
>> CONFIG_SENSORS_ASB100=3Dy
>> CONFIG_SENSORS_ASPEED=3Dy
>> # CONFIG_SENSORS_ATXP1 is not set
>> CONFIG_SENSORS_DS620=3Dy
>> CONFIG_SENSORS_DS1621=3Dy
>> CONFIG_SENSORS_DELL_SMM=3Dy
>> CONFIG_SENSORS_DA9052_ADC=3Dy
>> # CONFIG_SENSORS_I5K_AMB is not set
>> # CONFIG_SENSORS_F71805F is not set
>> # CONFIG_SENSORS_F71882FG is not set
>> CONFIG_SENSORS_F75375S=3Dy
>> CONFIG_SENSORS_FSCHMD=3Dy
>> CONFIG_SENSORS_GL518SM=3Dy
>> CONFIG_SENSORS_GL520SM=3Dy
>> CONFIG_SENSORS_G760A=3Dy
>> CONFIG_SENSORS_G762=3Dy
>> CONFIG_SENSORS_GPIO_FAN=3Dy
>> # CONFIG_SENSORS_HIH6130 is not set
>> CONFIG_SENSORS_IIO_HWMON=3Dy
>> # CONFIG_SENSORS_I5500 is not set
>> CONFIG_SENSORS_CORETEMP=3Dy
>> CONFIG_SENSORS_IT87=3Dy
>> # CONFIG_SENSORS_JC42 is not set
>> CONFIG_SENSORS_POWR1220=3Dy
>> CONFIG_SENSORS_LINEAGE=3Dy
>> # CONFIG_SENSORS_LTC2945 is not set
>> # CONFIG_SENSORS_LTC2990 is not set
>> CONFIG_SENSORS_LTC4151=3Dy
>> # CONFIG_SENSORS_LTC4215 is not set
>> CONFIG_SENSORS_LTC4222=3Dy
>> # CONFIG_SENSORS_LTC4245 is not set
>> CONFIG_SENSORS_LTC4260=3Dy
>> CONFIG_SENSORS_LTC4261=3Dy
>> CONFIG_SENSORS_MAX16065=3Dy
>> CONFIG_SENSORS_MAX1619=3Dy
>> # CONFIG_SENSORS_MAX1668 is not set
>> # CONFIG_SENSORS_MAX197 is not set
>> # CONFIG_SENSORS_MAX6621 is not set
>> CONFIG_SENSORS_MAX6639=3Dy
>> # CONFIG_SENSORS_MAX6642 is not set
>> # CONFIG_SENSORS_MAX6650 is not set
>> # CONFIG_SENSORS_MAX6697 is not set
>> CONFIG_SENSORS_MAX31790=3Dy
>> # CONFIG_SENSORS_MCP3021 is not set
>> CONFIG_SENSORS_TC654=3Dy
>> # CONFIG_SENSORS_LM63 is not set
>> CONFIG_SENSORS_LM73=3Dy
>> CONFIG_SENSORS_LM75=3Dy
>> CONFIG_SENSORS_LM77=3Dy
>> # CONFIG_SENSORS_LM78 is not set
>> CONFIG_SENSORS_LM80=3Dy
>> # CONFIG_SENSORS_LM83 is not set
>> CONFIG_SENSORS_LM85=3Dy
>> # CONFIG_SENSORS_LM87 is not set
>> CONFIG_SENSORS_LM90=3Dy
>> CONFIG_SENSORS_LM92=3Dy
>> # CONFIG_SENSORS_LM93 is not set
>> # CONFIG_SENSORS_LM95234 is not set
>> # CONFIG_SENSORS_LM95241 is not set
>> CONFIG_SENSORS_LM95245=3Dy
>> CONFIG_SENSORS_PC87360=3Dy
>> CONFIG_SENSORS_PC87427=3Dy
>> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
>> CONFIG_SENSORS_NCT6683=3Dy
>> # CONFIG_SENSORS_NCT6775 is not set
>> # CONFIG_SENSORS_NCT7802 is not set
>> # CONFIG_SENSORS_NCT7904 is not set
>> # CONFIG_SENSORS_PCF8591 is not set
>> CONFIG_PMBUS=3Dy
>> CONFIG_SENSORS_PMBUS=3Dy
>> CONFIG_SENSORS_ADM1275=3Dy
>> # CONFIG_SENSORS_IBM_CFFPS is not set
>> CONFIG_SENSORS_IR35221=3Dy
>> CONFIG_SENSORS_LM25066=3Dy
>> # CONFIG_SENSORS_LTC2978 is not set
>> CONFIG_SENSORS_LTC3815=3Dy
>> CONFIG_SENSORS_MAX16064=3Dy
>> CONFIG_SENSORS_MAX20751=3Dy
>> CONFIG_SENSORS_MAX31785=3Dy
>> # CONFIG_SENSORS_MAX34440 is not set
>> # CONFIG_SENSORS_MAX8688 is not set
>> # CONFIG_SENSORS_TPS40422 is not set
>> CONFIG_SENSORS_TPS53679=3Dy
>> # CONFIG_SENSORS_UCD9000 is not set
>> # CONFIG_SENSORS_UCD9200 is not set
>> # CONFIG_SENSORS_ZL6100 is not set
>> # CONFIG_SENSORS_PWM_FAN is not set
>> # CONFIG_SENSORS_SHT15 is not set
>> CONFIG_SENSORS_SHT21=3Dy
>> CONFIG_SENSORS_SHT3x=3Dy
>> CONFIG_SENSORS_SHTC1=3Dy
>> # CONFIG_SENSORS_SIS5595 is not set
>> CONFIG_SENSORS_DME1737=3Dy
>> # CONFIG_SENSORS_EMC1403 is not set
>> CONFIG_SENSORS_EMC2103=3Dy
>> CONFIG_SENSORS_EMC6W201=3Dy
>> CONFIG_SENSORS_SMSC47M1=3Dy
>> CONFIG_SENSORS_SMSC47M192=3Dy
>> CONFIG_SENSORS_SMSC47B397=3Dy
>> # CONFIG_SENSORS_SCH56XX_COMMON is not set
>> # CONFIG_SENSORS_STTS751 is not set
>> CONFIG_SENSORS_SMM665=3Dy
>> CONFIG_SENSORS_ADC128D818=3Dy
>> # CONFIG_SENSORS_ADS1015 is not set
>> CONFIG_SENSORS_ADS7828=3Dy
>> # CONFIG_SENSORS_AMC6821 is not set
>> CONFIG_SENSORS_INA209=3Dy
>> # CONFIG_SENSORS_INA2XX is not set
>> CONFIG_SENSORS_INA3221=3Dy
>> CONFIG_SENSORS_TC74=3Dy
>> CONFIG_SENSORS_THMC50=3Dy
>> # CONFIG_SENSORS_TMP102 is not set
>> CONFIG_SENSORS_TMP103=3Dy
>> # CONFIG_SENSORS_TMP108 is not set
>> CONFIG_SENSORS_TMP401=3Dy
>> # CONFIG_SENSORS_TMP421 is not set
>> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
>> # CONFIG_SENSORS_VIA686A is not set
>> CONFIG_SENSORS_VT1211=3Dy
>> # CONFIG_SENSORS_VT8231 is not set
>> # CONFIG_SENSORS_W83781D is not set
>> # CONFIG_SENSORS_W83791D is not set
>> CONFIG_SENSORS_W83792D=3Dy
>> # CONFIG_SENSORS_W83793 is not set
>> CONFIG_SENSORS_W83795=3Dy
>> # CONFIG_SENSORS_W83795_FANCTRL is not set
>> CONFIG_SENSORS_W83L785TS=3Dy
>> # CONFIG_SENSORS_W83L786NG is not set
>> CONFIG_SENSORS_W83627HF=3Dy
>> # CONFIG_SENSORS_W83627EHF is not set
>>
>> #
>> # ACPI drivers
>> #
>> # CONFIG_SENSORS_ACPI_POWER is not set
>> # CONFIG_SENSORS_ATK0110 is not set
>> CONFIG_THERMAL=3Dy
>> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
>> CONFIG_THERMAL_HWMON=3Dy
>> CONFIG_THERMAL_OF=3Dy
>> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
>> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
>> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
>> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
>> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
>> # CONFIG_THERMAL_GOV_BANG_BANG is not set
>> # CONFIG_THERMAL_GOV_USER_SPACE is not set
>> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
>> # CONFIG_CLOCK_THERMAL is not set
>> # CONFIG_DEVFREQ_THERMAL is not set
>> # CONFIG_THERMAL_EMULATION is not set
>> # CONFIG_MAX77620_THERMAL is not set
>> # CONFIG_QORIQ_THERMAL is not set
>> # CONFIG_DA9062_THERMAL is not set
>> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
>>
>> #
>> # ACPI INT340X thermal drivers
>> #
>> # CONFIG_INT340X_THERMAL is not set
>> # CONFIG_INTEL_PCH_THERMAL is not set
>> # CONFIG_QCOM_SPMI_TEMP_ALARM is not set
>> # CONFIG_GENERIC_ADC_THERMAL is not set
>> # CONFIG_WATCHDOG is not set
>> CONFIG_SSB_POSSIBLE=3Dy
>>
>> #
>> # Sonics Silicon Backplane
>> #
>> CONFIG_SSB=3Dy
>> CONFIG_SSB_SPROM=3Dy
>> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
>> CONFIG_SSB_PCIHOST=3Dy
>> # CONFIG_SSB_B43_PCI_BRIDGE is not set
>> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
>> # CONFIG_SSB_PCMCIAHOST is not set
>> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
>> # CONFIG_SSB_SDIOHOST is not set
>> CONFIG_SSB_SILENT=3Dy
>> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
>> # CONFIG_SSB_DRIVER_PCICORE is not set
>> # CONFIG_SSB_DRIVER_GPIO is not set
>> CONFIG_BCMA_POSSIBLE=3Dy
>> CONFIG_BCMA=3Dy
>> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
>> CONFIG_BCMA_HOST_PCI=3Dy
>> CONFIG_BCMA_HOST_SOC=3Dy
>> CONFIG_BCMA_DRIVER_PCI=3Dy
>> # CONFIG_BCMA_SFLASH is not set
>> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
>> # CONFIG_BCMA_DRIVER_GPIO is not set
>> CONFIG_BCMA_DEBUG=3Dy
>>
>> #
>> # Multifunction device drivers
>> #
>> CONFIG_MFD_CORE=3Dy
>> # CONFIG_MFD_CS5535 is not set
>> CONFIG_MFD_ACT8945A=3Dy
>> CONFIG_MFD_AS3711=3Dy
>> CONFIG_MFD_AS3722=3Dy
>> # CONFIG_PMIC_ADP5520 is not set
>> # CONFIG_MFD_AAT2870_CORE is not set
>> CONFIG_MFD_ATMEL_FLEXCOM=3Dy
>> # CONFIG_MFD_ATMEL_HLCDC is not set
>> CONFIG_MFD_BCM590XX=3Dy
>> CONFIG_MFD_BD9571MWV=3Dy
>> CONFIG_MFD_AXP20X=3Dy
>> CONFIG_MFD_AXP20X_I2C=3Dy
>> # CONFIG_MFD_CROS_EC is not set
>> # CONFIG_PMIC_DA903X is not set
>> CONFIG_PMIC_DA9052=3Dy
>> CONFIG_MFD_DA9052_I2C=3Dy
>> # CONFIG_MFD_DA9055 is not set
>> CONFIG_MFD_DA9062=3Dy
>> # CONFIG_MFD_DA9063 is not set
>> CONFIG_MFD_DA9150=3Dy
>> # CONFIG_MFD_MC13XXX_I2C is not set
>> CONFIG_MFD_HI6421_PMIC=3Dy
>> # CONFIG_HTC_PASIC3 is not set
>> # CONFIG_HTC_I2CPLD is not set
>> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
>> # CONFIG_LPC_ICH is not set
>> # CONFIG_LPC_SCH is not set
>> # CONFIG_INTEL_SOC_PMIC is not set
>> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
>> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
>> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
>> # CONFIG_MFD_INTEL_LPSS_PCI is not set
>> # CONFIG_MFD_JANZ_CMODIO is not set
>> # CONFIG_MFD_KEMPLD is not set
>> CONFIG_MFD_88PM800=3Dy
>> CONFIG_MFD_88PM805=3Dy
>> # CONFIG_MFD_88PM860X is not set
>> CONFIG_MFD_MAX14577=3Dy
>> CONFIG_MFD_MAX77620=3Dy
>> # CONFIG_MFD_MAX77686 is not set
>> CONFIG_MFD_MAX77693=3Dy
>> # CONFIG_MFD_MAX77843 is not set
>> # CONFIG_MFD_MAX8907 is not set
>> # CONFIG_MFD_MAX8925 is not set
>> # CONFIG_MFD_MAX8997 is not set
>> CONFIG_MFD_MAX8998=3Dy
>> # CONFIG_MFD_MT6397 is not set
>> # CONFIG_MFD_MENF21BMC is not set
>> CONFIG_MFD_RETU=3Dy
>> # CONFIG_MFD_PCF50633 is not set
>> CONFIG_UCB1400_CORE=3Dy
>> # CONFIG_MFD_RDC321X is not set
>> # CONFIG_MFD_RTSX_PCI is not set
>> CONFIG_MFD_RT5033=3Dy
>> # CONFIG_MFD_RC5T583 is not set
>> # CONFIG_MFD_RK808 is not set
>> CONFIG_MFD_RN5T618=3Dy
>> CONFIG_MFD_SEC_CORE=3Dy
>> CONFIG_MFD_SI476X_CORE=3Dy
>> CONFIG_MFD_SM501=3Dy
>> CONFIG_MFD_SM501_GPIO=3Dy
>> # CONFIG_MFD_SKY81452 is not set
>> CONFIG_MFD_SMSC=3Dy
>> CONFIG_ABX500_CORE=3Dy
>> CONFIG_AB3100_CORE=3Dy
>> # CONFIG_AB3100_OTP is not set
>> # CONFIG_MFD_STMPE is not set
>> CONFIG_MFD_SYSCON=3Dy
>> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
>> CONFIG_MFD_LP3943=3Dy
>> # CONFIG_MFD_LP8788 is not set
>> # CONFIG_MFD_TI_LMU is not set
>> CONFIG_MFD_PALMAS=3Dy
>> # CONFIG_TPS6105X is not set
>> # CONFIG_TPS65010 is not set
>> CONFIG_TPS6507X=3Dy
>> CONFIG_MFD_TPS65086=3Dy
>> CONFIG_MFD_TPS65090=3Dy
>> # CONFIG_MFD_TPS65217 is not set
>> # CONFIG_MFD_TPS68470 is not set
>> # CONFIG_MFD_TI_LP873X is not set
>> CONFIG_MFD_TI_LP87565=3Dy
>> CONFIG_MFD_TPS65218=3Dy
>> # CONFIG_MFD_TPS6586X is not set
>> CONFIG_MFD_TPS65910=3Dy
>> CONFIG_MFD_TPS65912=3Dy
>> CONFIG_MFD_TPS65912_I2C=3Dy
>> # CONFIG_MFD_TPS80031 is not set
>> # CONFIG_TWL4030_CORE is not set
>> # CONFIG_TWL6040_CORE is not set
>> CONFIG_MFD_WL1273_CORE=3Dy
>> CONFIG_MFD_LM3533=3Dy
>> # CONFIG_MFD_TIMBERDALE is not set
>> CONFIG_MFD_TC3589X=3Dy
>> # CONFIG_MFD_TMIO is not set
>> # CONFIG_MFD_VX855 is not set
>> # CONFIG_MFD_ARIZONA_I2C is not set
>> # CONFIG_MFD_WM8400 is not set
>> # CONFIG_MFD_WM831X_I2C is not set
>> # CONFIG_MFD_WM8350_I2C is not set
>> CONFIG_MFD_WM8994=3Dy
>> # CONFIG_REGULATOR is not set
>> # CONFIG_RC_CORE is not set
>> # CONFIG_MEDIA_SUPPORT is not set
>>
>> #
>> # Graphics support
>> #
>> # CONFIG_AGP is not set
>> CONFIG_VGA_ARB=3Dy
>> CONFIG_VGA_ARB_MAX_GPUS=3D16
>> # CONFIG_VGA_SWITCHEROO is not set
>> CONFIG_DRM=3Dy
>> CONFIG_DRM_MIPI_DSI=3Dy
>> # CONFIG_DRM_DP_AUX_CHARDEV is not set
>> CONFIG_DRM_DEBUG_MM=3Dy
>> CONFIG_DRM_DEBUG_MM_SELFTEST=3Dy
>> CONFIG_DRM_KMS_HELPER=3Dy
>> # CONFIG_DRM_FBDEV_EMULATION is not set
>> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
>> CONFIG_DRM_VM=3Dy
>>
>> #
>> # I2C encoder or helper chips
>> #
>> CONFIG_DRM_I2C_CH7006=3Dy
>> CONFIG_DRM_I2C_SIL164=3Dy
>> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
>> # CONFIG_DRM_RADEON is not set
>> # CONFIG_DRM_AMDGPU is not set
>>
>> #
>> # ACP (Audio CoProcessor) Configuration
>> #
>>
>> #
>> # AMD Library routines
>> #
>> # CONFIG_CHASH is not set
>> # CONFIG_DRM_NOUVEAU is not set
>> # CONFIG_DRM_I915 is not set
>> CONFIG_DRM_VGEM=3Dy
>> # CONFIG_DRM_VMWGFX is not set
>> # CONFIG_DRM_GMA500 is not set
>> # CONFIG_DRM_UDL is not set
>> # CONFIG_DRM_AST is not set
>> # CONFIG_DRM_MGAG200 is not set
>> # CONFIG_DRM_CIRRUS_QEMU is not set
>> # CONFIG_DRM_RCAR_DW_HDMI is not set
>> # CONFIG_DRM_QXL is not set
>> # CONFIG_DRM_BOCHS is not set
>> CONFIG_DRM_PANEL=3Dy
>>
>> #
>> # Display Panels
>> #
>> # CONFIG_DRM_PANEL_LVDS is not set
>> CONFIG_DRM_PANEL_SIMPLE=3Dy
>> CONFIG_DRM_PANEL_INNOLUX_P079ZCA=3Dy
>> CONFIG_DRM_PANEL_JDI_LT070ME05000=3Dy
>> CONFIG_DRM_PANEL_ORISETECH_OTM8009A=3Dy
>> # CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
>> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
>> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dy
>> # CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
>> # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
>> # CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
>> CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=3Dy
>> # CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
>> CONFIG_DRM_BRIDGE=3Dy
>> CONFIG_DRM_PANEL_BRIDGE=3Dy
>>
>> #
>> # Display Interface Bridges
>> #
>> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
>> CONFIG_DRM_DUMB_VGA_DAC=3Dy
>> # CONFIG_DRM_LVDS_ENCODER is not set
>> CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=3Dy
>> CONFIG_DRM_NXP_PTN3460=3Dy
>> # CONFIG_DRM_PARADE_PS8622 is not set
>> CONFIG_DRM_SII902X=3Dy
>> CONFIG_DRM_SII9234=3Dy
>> CONFIG_DRM_TOSHIBA_TC358767=3Dy
>> CONFIG_DRM_TI_TFP410=3Dy
>> CONFIG_DRM_I2C_ADV7511=3Dy
>> # CONFIG_DRM_I2C_ADV7511_AUDIO is not set
>> CONFIG_DRM_I2C_ADV7533=3Dy
>> # CONFIG_DRM_I2C_ADV7511_CEC is not set
>> # CONFIG_DRM_ARCPGU is not set
>> # CONFIG_DRM_HISI_HIBMC is not set
>> # CONFIG_DRM_MXSFB is not set
>> # CONFIG_DRM_TINYDRM is not set
>> CONFIG_DRM_LEGACY=3Dy
>> # CONFIG_DRM_TDFX is not set
>> # CONFIG_DRM_R128 is not set
>> # CONFIG_DRM_MGA is not set
>> # CONFIG_DRM_VIA is not set
>> # CONFIG_DRM_SAVAGE is not set
>> CONFIG_DRM_LIB_RANDOM=3Dy
>>
>> #
>> # Frame buffer Devices
>> #
>> CONFIG_FB=3Dy
>> # CONFIG_FIRMWARE_EDID is not set
>> CONFIG_FB_CMDLINE=3Dy
>> CONFIG_FB_NOTIFY=3Dy
>> # CONFIG_FB_DDC is not set
>> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
>> CONFIG_FB_CFB_FILLRECT=3Dy
>> CONFIG_FB_CFB_COPYAREA=3Dy
>> CONFIG_FB_CFB_IMAGEBLIT=3Dy
>> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
>> CONFIG_FB_SYS_FILLRECT=3Dy
>> CONFIG_FB_SYS_COPYAREA=3Dy
>> CONFIG_FB_SYS_IMAGEBLIT=3Dy
>> # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
>> # CONFIG_FB_FOREIGN_ENDIAN is not set
>> CONFIG_FB_SYS_FOPS=3Dy
>> CONFIG_FB_DEFERRED_IO=3Dy
>> CONFIG_FB_HECUBA=3Dy
>> # CONFIG_FB_SVGALIB is not set
>> # CONFIG_FB_MACMODES is not set
>> CONFIG_FB_BACKLIGHT=3Dy
>> CONFIG_FB_MODE_HELPERS=3Dy
>> CONFIG_FB_TILEBLITTING=3Dy
>>
>> #
>> # Frame buffer hardware drivers
>> #
>> # CONFIG_FB_CIRRUS is not set
>> # CONFIG_FB_PM2 is not set
>> # CONFIG_FB_CYBER2000 is not set
>> CONFIG_FB_ARC=3Dy
>> # CONFIG_FB_ASILIANT is not set
>> # CONFIG_FB_IMSTT is not set
>> # CONFIG_FB_VGA16 is not set
>> CONFIG_FB_UVESA=3Dy
>> CONFIG_FB_VESA=3Dy
>> CONFIG_FB_N411=3Dy
>> # CONFIG_FB_HGA is not set
>> CONFIG_FB_OPENCORES=3Dy
>> # CONFIG_FB_S1D13XXX is not set
>> # CONFIG_FB_NVIDIA is not set
>> # CONFIG_FB_RIVA is not set
>> # CONFIG_FB_I740 is not set
>> # CONFIG_FB_LE80578 is not set
>> # CONFIG_FB_MATROX is not set
>> # CONFIG_FB_RADEON is not set
>> # CONFIG_FB_ATY128 is not set
>> # CONFIG_FB_ATY is not set
>> # CONFIG_FB_S3 is not set
>> # CONFIG_FB_SAVAGE is not set
>> # CONFIG_FB_SIS is not set
>> # CONFIG_FB_VIA is not set
>> # CONFIG_FB_NEOMAGIC is not set
>> # CONFIG_FB_KYRO is not set
>> # CONFIG_FB_3DFX is not set
>> # CONFIG_FB_VOODOO1 is not set
>> # CONFIG_FB_VT8623 is not set
>> # CONFIG_FB_TRIDENT is not set
>> # CONFIG_FB_ARK is not set
>> # CONFIG_FB_PM3 is not set
>> # CONFIG_FB_CARMINE is not set
>> # CONFIG_FB_GEODE is not set
>> CONFIG_FB_SM501=3Dy
>> CONFIG_FB_IBM_GXT4500=3Dy
>> CONFIG_FB_VIRTUAL=3Dy
>> CONFIG_FB_METRONOME=3Dy
>> # CONFIG_FB_MB862XX is not set
>> CONFIG_FB_BROADSHEET=3Dy
>> # CONFIG_FB_AUO_K190X is not set
>> CONFIG_FB_SIMPLE=3Dy
>> CONFIG_FB_SSD1307=3Dy
>> # CONFIG_FB_SM712 is not set
>> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>> CONFIG_LCD_CLASS_DEVICE=3Dy
>> CONFIG_LCD_PLATFORM=3Dy
>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> CONFIG_BACKLIGHT_GENERIC=3Dy
>> CONFIG_BACKLIGHT_LM3533=3Dy
>> # CONFIG_BACKLIGHT_PWM is not set
>> # CONFIG_BACKLIGHT_DA9052 is not set
>> # CONFIG_BACKLIGHT_APPLE is not set
>> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
>> CONFIG_BACKLIGHT_SAHARA=3Dy
>> CONFIG_BACKLIGHT_ADP8860=3Dy
>> # CONFIG_BACKLIGHT_ADP8870 is not set
>> # CONFIG_BACKLIGHT_LM3630A is not set
>> # CONFIG_BACKLIGHT_LM3639 is not set
>> # CONFIG_BACKLIGHT_LP855X is not set
>> # CONFIG_BACKLIGHT_AS3711 is not set
>> # CONFIG_BACKLIGHT_GPIO is not set
>> # CONFIG_BACKLIGHT_LV5207LP is not set
>> CONFIG_BACKLIGHT_BD6107=3Dy
>> CONFIG_BACKLIGHT_ARCXCNN=3Dy
>> # CONFIG_VGASTATE is not set
>> CONFIG_VIDEOMODE_HELPERS=3Dy
>> CONFIG_HDMI=3Dy
>> # CONFIG_LOGO is not set
>> CONFIG_SOUND=3Dy
>> # CONFIG_SOUND_OSS_CORE is not set
>> CONFIG_SND=3Dy
>> CONFIG_SND_TIMER=3Dy
>> CONFIG_SND_PCM=3Dy
>> CONFIG_SND_PCM_ELD=3Dy
>> CONFIG_SND_PCM_IEC958=3Dy
>> CONFIG_SND_DMAENGINE_PCM=3Dy
>> CONFIG_SND_HWDEP=3Dy
>> CONFIG_SND_SEQ_DEVICE=3Dy
>> CONFIG_SND_RAWMIDI=3Dy
>> CONFIG_SND_COMPRESS_OFFLOAD=3Dy
>> CONFIG_SND_JACK=3Dy
>> CONFIG_SND_JACK_INPUT_DEV=3Dy
>> # CONFIG_SND_OSSEMUL is not set
>> CONFIG_SND_PCM_TIMER=3Dy
>> CONFIG_SND_HRTIMER=3Dy
>> # CONFIG_SND_DYNAMIC_MINORS is not set
>> CONFIG_SND_SUPPORT_OLD_API=3Dy
>> CONFIG_SND_PROC_FS=3Dy
>> CONFIG_SND_VERBOSE_PROCFS=3Dy
>> # CONFIG_SND_VERBOSE_PRINTK is not set
>> # CONFIG_SND_DEBUG is not set
>> CONFIG_SND_VMASTER=3Dy
>> CONFIG_SND_DMA_SGBUF=3Dy
>> CONFIG_SND_SEQUENCER=3Dy
>> CONFIG_SND_SEQ_DUMMY=3Dy
>> # CONFIG_SND_SEQ_HRTIMER_DEFAULT is not set
>> CONFIG_SND_SEQ_MIDI_EVENT=3Dy
>> CONFIG_SND_SEQ_MIDI=3Dy
>> CONFIG_SND_SEQ_VIRMIDI=3Dy
>> # CONFIG_SND_OPL3_LIB_SEQ is not set
>> # CONFIG_SND_OPL4_LIB_SEQ is not set
>> CONFIG_SND_VX_LIB=3Dy
>> CONFIG_SND_AC97_CODEC=3Dy
>> CONFIG_SND_DRIVERS=3Dy
>> CONFIG_SND_PCSP=3Dy
>> # CONFIG_SND_DUMMY is not set
>> CONFIG_SND_ALOOP=3Dy
>> CONFIG_SND_VIRMIDI=3Dy
>> # CONFIG_SND_MTPAV is not set
>> CONFIG_SND_MTS64=3Dy
>> # CONFIG_SND_SERIAL_U16550 is not set
>> # CONFIG_SND_MPU401 is not set
>> # CONFIG_SND_PORTMAN2X4 is not set
>> # CONFIG_SND_AC97_POWER_SAVE is not set
>> CONFIG_SND_PCI=3Dy
>> # CONFIG_SND_AD1889 is not set
>> # CONFIG_SND_ALS4000 is not set
>> # CONFIG_SND_ASIHPI is not set
>> # CONFIG_SND_ATIIXP is not set
>> # CONFIG_SND_ATIIXP_MODEM is not set
>> # CONFIG_SND_AU8810 is not set
>> # CONFIG_SND_AU8820 is not set
>> # CONFIG_SND_AU8830 is not set
>> # CONFIG_SND_AW2 is not set
>> # CONFIG_SND_BT87X is not set
>> # CONFIG_SND_CA0106 is not set
>> # CONFIG_SND_CMIPCI is not set
>> # CONFIG_SND_OXYGEN is not set
>> # CONFIG_SND_CS4281 is not set
>> # CONFIG_SND_CS46XX is not set
>> # CONFIG_SND_CS5530 is not set
>> # CONFIG_SND_CS5535AUDIO is not set
>> # CONFIG_SND_CTXFI is not set
>> # CONFIG_SND_DARLA20 is not set
>> # CONFIG_SND_GINA20 is not set
>> # CONFIG_SND_LAYLA20 is not set
>> # CONFIG_SND_DARLA24 is not set
>> # CONFIG_SND_GINA24 is not set
>> # CONFIG_SND_LAYLA24 is not set
>> # CONFIG_SND_MONA is not set
>> # CONFIG_SND_MIA is not set
>> # CONFIG_SND_ECHO3G is not set
>> # CONFIG_SND_INDIGO is not set
>> # CONFIG_SND_INDIGOIO is not set
>> # CONFIG_SND_INDIGODJ is not set
>> # CONFIG_SND_INDIGOIOX is not set
>> # CONFIG_SND_INDIGODJX is not set
>> # CONFIG_SND_EMU10K1_SEQ is not set
>> # CONFIG_SND_ENS1370 is not set
>> # CONFIG_SND_ENS1371 is not set
>> # CONFIG_SND_FM801 is not set
>> # CONFIG_SND_HDSP is not set
>> # CONFIG_SND_HDSPM is not set
>> # CONFIG_SND_ICE1724 is not set
>> # CONFIG_SND_INTEL8X0 is not set
>> # CONFIG_SND_INTEL8X0M is not set
>> # CONFIG_SND_KORG1212 is not set
>> # CONFIG_SND_LOLA is not set
>> # CONFIG_SND_LX6464ES is not set
>> # CONFIG_SND_MIXART is not set
>> # CONFIG_SND_NM256 is not set
>> # CONFIG_SND_PCXHR is not set
>> # CONFIG_SND_RIPTIDE is not set
>> # CONFIG_SND_RME32 is not set
>> # CONFIG_SND_RME96 is not set
>> # CONFIG_SND_RME9652 is not set
>> # CONFIG_SND_SE6X is not set
>> # CONFIG_SND_VIA82XX is not set
>> # CONFIG_SND_VIA82XX_MODEM is not set
>> # CONFIG_SND_VIRTUOSO is not set
>> # CONFIG_SND_VX222 is not set
>> # CONFIG_SND_YMFPCI is not set
>>
>> #
>> # HD-Audio
>> #
>> # CONFIG_SND_HDA_INTEL is not set
>> CONFIG_SND_HDA_PREALLOC_SIZE=3D64
>> CONFIG_SND_PCMCIA=3Dy
>> CONFIG_SND_VXPOCKET=3Dy
>> CONFIG_SND_PDAUDIOCF=3Dy
>> CONFIG_SND_SOC=3Dy
>> CONFIG_SND_SOC_AC97_BUS=3Dy
>> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
>> CONFIG_SND_SOC_COMPRESS=3Dy
>> CONFIG_SND_SOC_ACPI=3Dy
>> # CONFIG_SND_SOC_AMD_ACP is not set
>> CONFIG_SND_ATMEL_SOC=3Dy
>> # CONFIG_SND_DESIGNWARE_I2S is not set
>>
>> #
>> # SoC Audio for Freescale CPUs
>> #
>>
>> #
>> # Common SoC Audio options for Freescale CPUs:
>> #
>> CONFIG_SND_SOC_FSL_ASRC=3Dy
>> CONFIG_SND_SOC_FSL_SAI=3Dy
>> CONFIG_SND_SOC_FSL_SSI=3Dy
>> CONFIG_SND_SOC_FSL_SPDIF=3Dy
>> # CONFIG_SND_SOC_FSL_ESAI is not set
>> CONFIG_SND_SOC_IMX_AUDMUX=3Dy
>> CONFIG_SND_I2S_HI6210_I2S=3Dy
>> # CONFIG_SND_SOC_IMG is not set
>> CONFIG_SND_SOC_INTEL_COMMON=3Dy
>> CONFIG_SND_SOC_INTEL_SST=3Dy
>> CONFIG_SND_SOC_INTEL_SST_FIRMWARE=3Dy
>> CONFIG_SND_SOC_INTEL_SST_ACPI=3Dy
>> CONFIG_SND_SOC_ACPI_INTEL_MATCH=3Dy
>> CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=3Dy
>> CONFIG_SND_SOC_INTEL_HASWELL=3Dy
>> # CONFIG_SND_SOC_INTEL_BAYTRAIL is not set
>> CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=3Dy
>> # CONFIG_SND_SOC_INTEL_SKYLAKE is not set
>> CONFIG_SND_SOC_INTEL_MACH=3Dy
>> # CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH is not set
>> # CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH is not set
>>
>> #
>> # STMicroelectronics STM32 SOC audio support
>> #
>> # CONFIG_SND_SOC_XTFPGA_I2S is not set
>> # CONFIG_ZX_TDM is not set
>> CONFIG_SND_SOC_I2C_AND_SPI=3Dy
>>
>> #
>> # CODEC drivers
>> #
>> CONFIG_SND_SOC_AC97_CODEC=3Dy
>> CONFIG_SND_SOC_ADAU1701=3Dy
>> # CONFIG_SND_SOC_ADAU1761_I2C is not set
>> CONFIG_SND_SOC_ADAU7002=3Dy
>> # CONFIG_SND_SOC_AK4554 is not set
>> CONFIG_SND_SOC_AK4613=3Dy
>> CONFIG_SND_SOC_AK4642=3Dy
>> CONFIG_SND_SOC_AK5386=3Dy
>> CONFIG_SND_SOC_ALC5623=3Dy
>> # CONFIG_SND_SOC_BT_SCO is not set
>> CONFIG_SND_SOC_CS35L32=3Dy
>> CONFIG_SND_SOC_CS35L33=3Dy
>> # CONFIG_SND_SOC_CS35L34 is not set
>> CONFIG_SND_SOC_CS35L35=3Dy
>> CONFIG_SND_SOC_CS42L42=3Dy
>> CONFIG_SND_SOC_CS42L51=3Dy
>> CONFIG_SND_SOC_CS42L51_I2C=3Dy
>> CONFIG_SND_SOC_CS42L52=3Dy
>> # CONFIG_SND_SOC_CS42L56 is not set
>> # CONFIG_SND_SOC_CS42L73 is not set
>> # CONFIG_SND_SOC_CS4265 is not set
>> CONFIG_SND_SOC_CS4270=3Dy
>> CONFIG_SND_SOC_CS4271=3Dy
>> CONFIG_SND_SOC_CS4271_I2C=3Dy
>> # CONFIG_SND_SOC_CS42XX8_I2C is not set
>> CONFIG_SND_SOC_CS43130=3Dy
>> CONFIG_SND_SOC_CS4349=3Dy
>> CONFIG_SND_SOC_CS53L30=3Dy
>> CONFIG_SND_SOC_DIO2125=3Dy
>> CONFIG_SND_SOC_HDMI_CODEC=3Dy
>> CONFIG_SND_SOC_ES7134=3Dy
>> # CONFIG_SND_SOC_ES8316 is not set
>> CONFIG_SND_SOC_ES8328=3Dy
>> CONFIG_SND_SOC_ES8328_I2C=3Dy
>> CONFIG_SND_SOC_GTM601=3Dy
>> # CONFIG_SND_SOC_INNO_RK3036 is not set
>> CONFIG_SND_SOC_MAX98504=3Dy
>> CONFIG_SND_SOC_MAX98927=3Dy
>> CONFIG_SND_SOC_MAX9860=3Dy
>> CONFIG_SND_SOC_MSM8916_WCD_ANALOG=3Dy
>> CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dy
>> # CONFIG_SND_SOC_PCM1681 is not set
>> CONFIG_SND_SOC_PCM179X=3Dy
>> CONFIG_SND_SOC_PCM179X_I2C=3Dy
>> CONFIG_SND_SOC_PCM3168A=3Dy
>> CONFIG_SND_SOC_PCM3168A_I2C=3Dy
>> CONFIG_SND_SOC_PCM512x=3Dy
>> CONFIG_SND_SOC_PCM512x_I2C=3Dy
>> # CONFIG_SND_SOC_RT5514_SPI_BUILTIN is not set
>> # CONFIG_SND_SOC_RT5616 is not set
>> CONFIG_SND_SOC_RT5631=3Dy
>> # CONFIG_SND_SOC_RT5677_SPI is not set
>> CONFIG_SND_SOC_SGTL5000=3Dy
>> CONFIG_SND_SOC_SIGMADSP=3Dy
>> CONFIG_SND_SOC_SIGMADSP_I2C=3Dy
>> CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dy
>> # CONFIG_SND_SOC_SPDIF is not set
>> # CONFIG_SND_SOC_SSM2602_I2C is not set
>> CONFIG_SND_SOC_SSM4567=3Dy
>> CONFIG_SND_SOC_STA32X=3Dy
>> CONFIG_SND_SOC_STA350=3Dy
>> CONFIG_SND_SOC_STI_SAS=3Dy
>> CONFIG_SND_SOC_TAS2552=3Dy
>> CONFIG_SND_SOC_TAS5086=3Dy
>> CONFIG_SND_SOC_TAS571X=3Dy
>> CONFIG_SND_SOC_TAS5720=3Dy
>> CONFIG_SND_SOC_TFA9879=3Dy
>> # CONFIG_SND_SOC_TLV320AIC23_I2C is not set
>> CONFIG_SND_SOC_TLV320AIC31XX=3Dy
>> # CONFIG_SND_SOC_TLV320AIC3X is not set
>> # CONFIG_SND_SOC_TS3A227E is not set
>> CONFIG_SND_SOC_WM8510=3Dy
>> CONFIG_SND_SOC_WM8523=3Dy
>> CONFIG_SND_SOC_WM8524=3Dy
>> CONFIG_SND_SOC_WM8580=3Dy
>> CONFIG_SND_SOC_WM8711=3Dy
>> # CONFIG_SND_SOC_WM8728 is not set
>> CONFIG_SND_SOC_WM8731=3Dy
>> CONFIG_SND_SOC_WM8737=3Dy
>> CONFIG_SND_SOC_WM8741=3Dy
>> CONFIG_SND_SOC_WM8750=3Dy
>> CONFIG_SND_SOC_WM8753=3Dy
>> CONFIG_SND_SOC_WM8776=3Dy
>> CONFIG_SND_SOC_WM8804=3Dy
>> CONFIG_SND_SOC_WM8804_I2C=3Dy
>> CONFIG_SND_SOC_WM8903=3Dy
>> CONFIG_SND_SOC_WM8960=3Dy
>> CONFIG_SND_SOC_WM8962=3Dy
>> # CONFIG_SND_SOC_WM8974 is not set
>> # CONFIG_SND_SOC_WM8978 is not set
>> # CONFIG_SND_SOC_WM8985 is not set
>> CONFIG_SND_SOC_ZX_AUD96P22=3Dy
>> CONFIG_SND_SOC_NAU8540=3Dy
>> CONFIG_SND_SOC_NAU8810=3Dy
>> CONFIG_SND_SOC_NAU8824=3Dy
>> CONFIG_SND_SOC_TPA6130A2=3Dy
>> CONFIG_SND_SIMPLE_CARD_UTILS=3Dy
>> CONFIG_SND_SIMPLE_CARD=3Dy
>> # CONFIG_SND_SIMPLE_SCU_CARD is not set
>> # CONFIG_SND_AUDIO_GRAPH_CARD is not set
>> # CONFIG_SND_AUDIO_GRAPH_SCU_CARD is not set
>> # CONFIG_SND_X86 is not set
>> CONFIG_AC97_BUS=3Dy
>>
>> #
>> # HID support
>> #
>> # CONFIG_HID is not set
>>
>> #
>> # I2C HID support
>> #
>> # CONFIG_I2C_HID is not set
>> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
>> CONFIG_USB_SUPPORT=3Dy
>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>> # CONFIG_USB is not set
>> CONFIG_USB_PCI=3Dy
>>
>> #
>> # USB port drivers
>> #
>>
>> #
>> # USB Physical Layer drivers
>> #
>> # CONFIG_USB_PHY is not set
>> # CONFIG_NOP_USB_XCEIV is not set
>> # CONFIG_USB_GPIO_VBUS is not set
>> # CONFIG_TAHVO_USB is not set
>> # CONFIG_USB_GADGET is not set
>>
>> #
>> # USB Power Delivery and Type-C drivers
>> #
>> # CONFIG_TYPEC_UCSI is not set
>> # CONFIG_TYPEC_TPS6598X is not set
>> # CONFIG_USB_LED_TRIG is not set
>> # CONFIG_USB_ULPI_BUS is not set
>> # CONFIG_UWB is not set
>> CONFIG_MMC=3Dy
>> # CONFIG_PWRSEQ_EMMC is not set
>> CONFIG_PWRSEQ_SD8787=3Dy
>> # CONFIG_PWRSEQ_SIMPLE is not set
>> CONFIG_MMC_BLOCK=3Dy
>> CONFIG_MMC_BLOCK_MINORS=3D8
>> # CONFIG_SDIO_UART is not set
>> CONFIG_MMC_TEST=3Dy
>>
>> #
>> # MMC/SD/SDIO Host Controller Drivers
>> #
>> CONFIG_MMC_DEBUG=3Dy
>> CONFIG_MMC_SDHCI=3Dy
>> # CONFIG_MMC_SDHCI_PCI is not set
>> # CONFIG_MMC_SDHCI_ACPI is not set
>> CONFIG_MMC_SDHCI_PLTFM=3Dy
>> # CONFIG_MMC_SDHCI_OF_ARASAN is not set
>> CONFIG_MMC_SDHCI_OF_AT91=3Dy
>> CONFIG_MMC_SDHCI_CADENCE=3Dy
>> CONFIG_MMC_SDHCI_F_SDH30=3Dy
>> CONFIG_MMC_WBSD=3Dy
>> # CONFIG_MMC_TIFM_SD is not set
>> # CONFIG_MMC_SDRICOH_CS is not set
>> # CONFIG_MMC_CB710 is not set
>> # CONFIG_MMC_VIA_SDMMC is not set
>> CONFIG_MMC_USDHI6ROL0=3Dy
>> # CONFIG_MMC_TOSHIBA_PCI is not set
>> CONFIG_MMC_MTK=3Dy
>> CONFIG_MMC_SDHCI_XENON=3Dy
>> # CONFIG_MMC_SDHCI_OMAP is not set
>> CONFIG_MEMSTICK=3Dy
>> # CONFIG_MEMSTICK_DEBUG is not set
>>
>> #
>> # MemoryStick drivers
>> #
>> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
>> CONFIG_MSPRO_BLOCK=3Dy
>> # CONFIG_MS_BLOCK is not set
>>
>> #
>> # MemoryStick Host Controller Drivers
>> #
>> # CONFIG_MEMSTICK_TIFM_MS is not set
>> # CONFIG_MEMSTICK_JMICRON_38X is not set
>> # CONFIG_MEMSTICK_R592 is not set
>> CONFIG_NEW_LEDS=3Dy
>> CONFIG_LEDS_CLASS=3Dy
>> CONFIG_LEDS_CLASS_FLASH=3Dy
>> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
>>
>> #
>> # LED drivers
>> #
>> # CONFIG_LEDS_AAT1290 is not set
>> # CONFIG_LEDS_APU is not set
>> CONFIG_LEDS_AS3645A=3Dy
>> CONFIG_LEDS_BCM6328=3Dy
>> CONFIG_LEDS_BCM6358=3Dy
>> CONFIG_LEDS_LM3530=3Dy
>> CONFIG_LEDS_LM3533=3Dy
>> # CONFIG_LEDS_LM3642 is not set
>> # CONFIG_LEDS_NET48XX is not set
>> CONFIG_LEDS_WRAP=3Dy
>> CONFIG_LEDS_PCA9532=3Dy
>> # CONFIG_LEDS_PCA9532_GPIO is not set
>> # CONFIG_LEDS_GPIO is not set
>> # CONFIG_LEDS_LP3944 is not set
>> CONFIG_LEDS_LP3952=3Dy
>> CONFIG_LEDS_LP55XX_COMMON=3Dy
>> # CONFIG_LEDS_LP5521 is not set
>> CONFIG_LEDS_LP5523=3Dy
>> # CONFIG_LEDS_LP5562 is not set
>> CONFIG_LEDS_LP8501=3Dy
>> # CONFIG_LEDS_LP8860 is not set
>> CONFIG_LEDS_CLEVO_MAIL=3Dy
>> # CONFIG_LEDS_PCA955X is not set
>> CONFIG_LEDS_PCA963X=3Dy
>> # CONFIG_LEDS_DA9052 is not set
>> # CONFIG_LEDS_PWM is not set
>> CONFIG_LEDS_BD2802=3Dy
>> # CONFIG_LEDS_INTEL_SS4200 is not set
>> CONFIG_LEDS_LT3593=3Dy
>> CONFIG_LEDS_TCA6507=3Dy
>> # CONFIG_LEDS_TLC591XX is not set
>> CONFIG_LEDS_MAX77693=3Dy
>> CONFIG_LEDS_LM355x=3Dy
>> CONFIG_LEDS_OT200=3Dy
>> CONFIG_LEDS_KTD2692=3Dy
>> CONFIG_LEDS_IS31FL319X=3Dy
>> CONFIG_LEDS_IS31FL32XX=3Dy
>>
>> #
>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_=
THINGM)
>> #
>> # CONFIG_LEDS_BLINKM is not set
>> CONFIG_LEDS_SYSCON=3Dy
>> CONFIG_LEDS_USER=3Dy
>> # CONFIG_LEDS_NIC78BX is not set
>>
>> #
>> # LED Triggers
>> #
>> CONFIG_LEDS_TRIGGERS=3Dy
>> CONFIG_LEDS_TRIGGER_TIMER=3Dy
>> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
>> CONFIG_LEDS_TRIGGER_DISK=3Dy
>> CONFIG_LEDS_TRIGGER_MTD=3Dy
>> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
>> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
>> CONFIG_LEDS_TRIGGER_CPU=3Dy
>> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
>> CONFIG_LEDS_TRIGGER_GPIO=3Dy
>> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
>>
>> #
>> # iptables trigger is under Netfilter config (LED target)
>> #
>> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
>> # CONFIG_LEDS_TRIGGER_CAMERA is not set
>> CONFIG_LEDS_TRIGGER_PANIC=3Dy
>> CONFIG_ACCESSIBILITY=3Dy
>> CONFIG_INFINIBAND=3Dy
>> # CONFIG_INFINIBAND_USER_MAD is not set
>> # CONFIG_INFINIBAND_USER_ACCESS is not set
>> CONFIG_INFINIBAND_ADDR_TRANS=3Dy
>> CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy
>> # CONFIG_INFINIBAND_MTHCA is not set
>> # CONFIG_MLX4_INFINIBAND is not set
>> # CONFIG_INFINIBAND_NES is not set
>> # CONFIG_INFINIBAND_OCRDMA is not set
>> # CONFIG_INFINIBAND_IPOIB is not set
>> CONFIG_INFINIBAND_SRP=3Dy
>> CONFIG_INFINIBAND_SRPT=3Dy
>> CONFIG_INFINIBAND_ISER=3Dy
>> CONFIG_INFINIBAND_ISERT=3Dy
>> # CONFIG_RDMA_RXE is not set
>> # CONFIG_INFINIBAND_BNXT_RE is not set
>> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>> CONFIG_EDAC_SUPPORT=3Dy
>> # CONFIG_EDAC is not set
>> CONFIG_RTC_LIB=3Dy
>> CONFIG_RTC_MC146818_LIB=3Dy
>> # CONFIG_RTC_CLASS is not set
>> CONFIG_DMADEVICES=3Dy
>> # CONFIG_DMADEVICES_DEBUG is not set
>>
>> #
>> # DMA Devices
>> #
>> CONFIG_DMA_ENGINE=3Dy
>> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
>> CONFIG_DMA_ACPI=3Dy
>> CONFIG_DMA_OF=3Dy
>> # CONFIG_ALTERA_MSGDMA is not set
>> CONFIG_FSL_EDMA=3Dy
>> CONFIG_INTEL_IDMA64=3Dy
>> # CONFIG_PCH_DMA is not set
>> CONFIG_QCOM_HIDMA_MGMT=3Dy
>> CONFIG_QCOM_HIDMA=3Dy
>> CONFIG_DW_DMAC_CORE=3Dy
>> # CONFIG_DW_DMAC is not set
>> # CONFIG_DW_DMAC_PCI is not set
>>
>> #
>> # DMA Clients
>> #
>> # CONFIG_ASYNC_TX_DMA is not set
>> # CONFIG_DMATEST is not set
>>
>> #
>> # DMABUF options
>> #
>> CONFIG_SYNC_FILE=3Dy
>> # CONFIG_SW_SYNC is not set
>> # CONFIG_AUXDISPLAY is not set
>> CONFIG_CHARLCD=3Dy
>> CONFIG_PANEL=3Dy
>> CONFIG_PANEL_PARPORT=3D0
>> CONFIG_PANEL_PROFILE=3D5
>> # CONFIG_PANEL_CHANGE_MESSAGE is not set
>> CONFIG_UIO=3Dy
>> # CONFIG_UIO_CIF is not set
>> # CONFIG_UIO_PDRV_GENIRQ is not set
>> CONFIG_UIO_DMEM_GENIRQ=3Dy
>> # CONFIG_UIO_AEC is not set
>> # CONFIG_UIO_SERCOS3 is not set
>> # CONFIG_UIO_PCI_GENERIC is not set
>> # CONFIG_UIO_NETX is not set
>> CONFIG_UIO_PRUSS=3Dy
>> # CONFIG_UIO_MF624 is not set
>> CONFIG_VIRT_DRIVERS=3Dy
>>
>> #
>> # Virtio drivers
>> #
>> # CONFIG_VIRTIO_PCI is not set
>> # CONFIG_VIRTIO_MMIO is not set
>>
>> #
>> # Microsoft Hyper-V guest support
>> #
>> # CONFIG_HYPERV_TSCPAGE is not set
>> CONFIG_STAGING=3Dy
>> # CONFIG_IRDA is not set
>> CONFIG_COMEDI=3Dy
>> CONFIG_COMEDI_DEBUG=3Dy
>> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
>> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
>> # CONFIG_COMEDI_MISC_DRIVERS is not set
>> CONFIG_COMEDI_ISA_DRIVERS=3Dy
>> CONFIG_COMEDI_PCL711=3Dy
>> CONFIG_COMEDI_PCL724=3Dy
>> # CONFIG_COMEDI_PCL726 is not set
>> # CONFIG_COMEDI_PCL730 is not set
>> # CONFIG_COMEDI_PCL812 is not set
>> # CONFIG_COMEDI_PCL816 is not set
>> # CONFIG_COMEDI_PCL818 is not set
>> CONFIG_COMEDI_PCM3724=3Dy
>> # CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
>> # CONFIG_COMEDI_AMPLC_PC236_ISA is not set
>> # CONFIG_COMEDI_AMPLC_PC263_ISA is not set
>> CONFIG_COMEDI_RTI800=3Dy
>> # CONFIG_COMEDI_RTI802 is not set
>> # CONFIG_COMEDI_DAC02 is not set
>> CONFIG_COMEDI_DAS16M1=3Dy
>> CONFIG_COMEDI_DAS08_ISA=3Dy
>> # CONFIG_COMEDI_DAS16 is not set
>> CONFIG_COMEDI_DAS800=3Dy
>> CONFIG_COMEDI_DAS1800=3Dy
>> CONFIG_COMEDI_DAS6402=3Dy
>> # CONFIG_COMEDI_DT2801 is not set
>> CONFIG_COMEDI_DT2811=3Dy
>> CONFIG_COMEDI_DT2814=3Dy
>> CONFIG_COMEDI_DT2815=3Dy
>> # CONFIG_COMEDI_DT2817 is not set
>> CONFIG_COMEDI_DT282X=3Dy
>> CONFIG_COMEDI_DMM32AT=3Dy
>> CONFIG_COMEDI_FL512=3Dy
>> CONFIG_COMEDI_AIO_AIO12_8=3Dy
>> CONFIG_COMEDI_AIO_IIRO_16=3Dy
>> CONFIG_COMEDI_II_PCI20KC=3Dy
>> # CONFIG_COMEDI_C6XDIGIO is not set
>> CONFIG_COMEDI_MPC624=3Dy
>> # CONFIG_COMEDI_ADQ12B is not set
>> CONFIG_COMEDI_NI_AT_A2150=3Dy
>> CONFIG_COMEDI_NI_AT_AO=3Dy
>> CONFIG_COMEDI_NI_ATMIO=3Dy
>> CONFIG_COMEDI_NI_ATMIO16D=3Dy
>> CONFIG_COMEDI_NI_LABPC_ISA=3Dy
>> # CONFIG_COMEDI_PCMAD is not set
>> # CONFIG_COMEDI_PCMDA12 is not set
>> CONFIG_COMEDI_PCMMIO=3Dy
>> CONFIG_COMEDI_PCMUIO=3Dy
>> # CONFIG_COMEDI_MULTIQ3 is not set
>> # CONFIG_COMEDI_S526 is not set
>> # CONFIG_COMEDI_PCI_DRIVERS is not set
>> CONFIG_COMEDI_PCMCIA_DRIVERS=3Dy
>> CONFIG_COMEDI_CB_DAS16_CS=3Dy
>> CONFIG_COMEDI_DAS08_CS=3Dy
>> CONFIG_COMEDI_NI_DAQ_700_CS=3Dy
>> CONFIG_COMEDI_NI_DAQ_DIO24_CS=3Dy
>> # CONFIG_COMEDI_NI_LABPC_CS is not set
>> CONFIG_COMEDI_NI_MIO_CS=3Dy
>> CONFIG_COMEDI_QUATECH_DAQP_CS=3Dy
>> CONFIG_COMEDI_8254=3Dy
>> CONFIG_COMEDI_8255=3Dy
>> # CONFIG_COMEDI_8255_SA is not set
>> # CONFIG_COMEDI_KCOMEDILIB is not set
>> CONFIG_COMEDI_DAS08=3Dy
>> CONFIG_COMEDI_ISADMA=3Dy
>> CONFIG_COMEDI_NI_LABPC=3Dy
>> CONFIG_COMEDI_NI_LABPC_ISADMA=3Dy
>> CONFIG_COMEDI_NI_TIO=3Dy
>> # CONFIG_RTS5208 is not set
>>
>> #
>> # IIO staging drivers
>> #
>>
>> #
>> # Accelerometers
>> #
>>
>> #
>> # Analog to digital converters
>> #
>> # CONFIG_AD7606 is not set
>>
>> #
>> # Analog digital bi-direction converters
>> #
>> CONFIG_ADT7316=3Dy
>> CONFIG_ADT7316_I2C=3Dy
>>
>> #
>> # Capacitance to digital converters
>> #
>> # CONFIG_AD7150 is not set
>> CONFIG_AD7152=3Dy
>> # CONFIG_AD7746 is not set
>>
>> #
>> # Direct Digital Synthesis
>> #
>>
>> #
>> # Digital gyroscope sensors
>> #
>>
>> #
>> # Network Analyzer, Impedance Converters
>> #
>> CONFIG_AD5933=3Dy
>>
>> #
>> # Light sensors
>> #
>> CONFIG_TSL2x7x=3Dy
>>
>> #
>> # Active energy metering IC
>> #
>> CONFIG_ADE7854=3Dy
>> # CONFIG_ADE7854_I2C is not set
>>
>> #
>> # Resolver to digital converters
>> #
>>
>> #
>> # Triggers - standalone
>> #
>> # CONFIG_FB_SM750 is not set
>> # CONFIG_FB_XGI is not set
>>
>> #
>> # Speakup console speech
>> #
>> CONFIG_STAGING_MEDIA=3Dy
>>
>> #
>> # Android
>> #
>> # CONFIG_ASHMEM is not set
>> CONFIG_ION=3Dy
>> # CONFIG_ION_SYSTEM_HEAP is not set
>> CONFIG_ION_CARVEOUT_HEAP=3Dy
>> # CONFIG_ION_CHUNK_HEAP is not set
>> # CONFIG_ION_CMA_HEAP is not set
>> # CONFIG_STAGING_BOARD is not set
>> # CONFIG_DGNC is not set
>> CONFIG_GS_FPGABOOT=3Dy
>> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
>> # CONFIG_MOST is not set
>> # CONFIG_KS7010 is not set
>> CONFIG_GREYBUS=3Dy
>> CONFIG_GREYBUS_AUDIO=3Dy
>> # CONFIG_GREYBUS_BOOTROM is not set
>> CONFIG_GREYBUS_LIGHT=3Dy
>> # CONFIG_GREYBUS_LOG is not set
>> CONFIG_GREYBUS_LOOPBACK=3Dy
>> # CONFIG_GREYBUS_POWER is not set
>> # CONFIG_GREYBUS_RAW is not set
>> # CONFIG_GREYBUS_VIBRATOR is not set
>> CONFIG_GREYBUS_BRIDGED_PHY=3Dy
>> CONFIG_GREYBUS_GPIO=3Dy
>> # CONFIG_GREYBUS_I2C is not set
>> # CONFIG_GREYBUS_PWM is not set
>> CONFIG_GREYBUS_SDIO=3Dy
>> # CONFIG_GREYBUS_UART is not set
>> # CONFIG_CRYPTO_DEV_CCREE is not set
>>
>> #
>> # USB Power Delivery and Type-C drivers
>> #
>> # CONFIG_DRM_VBOXVIDEO is not set
>> # CONFIG_X86_PLATFORM_DEVICES is not set
>> CONFIG_PMC_ATOM=3Dy
>> CONFIG_CHROME_PLATFORMS=3Dy
>> CONFIG_CHROMEOS_LAPTOP=3Dy
>> CONFIG_CHROMEOS_PSTORE=3Dy
>> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
>> CONFIG_CLKDEV_LOOKUP=3Dy
>> CONFIG_HAVE_CLK_PREPARE=3Dy
>> CONFIG_COMMON_CLK=3Dy
>>
>> #
>> # Common Clock Framework
>> #
>> # CONFIG_CLK_HSDK is not set
>> # CONFIG_COMMON_CLK_MAX77686 is not set
>> # CONFIG_COMMON_CLK_SI5351 is not set
>> # CONFIG_COMMON_CLK_SI514 is not set
>> # CONFIG_COMMON_CLK_SI570 is not set
>> # CONFIG_COMMON_CLK_CDCE706 is not set
>> # CONFIG_COMMON_CLK_CDCE925 is not set
>> # CONFIG_COMMON_CLK_CS2000_CP is not set
>> # CONFIG_COMMON_CLK_S2MPS11 is not set
>> # CONFIG_COMMON_CLK_NXP is not set
>> # CONFIG_COMMON_CLK_PALMAS is not set
>> # CONFIG_COMMON_CLK_PWM is not set
>> # CONFIG_COMMON_CLK_PXA is not set
>> # CONFIG_COMMON_CLK_PIC32 is not set
>> # CONFIG_COMMON_CLK_VC5 is not set
>> CONFIG_HWSPINLOCK=3Dy
>>
>> #
>> # Clock Source drivers
>> #
>> CONFIG_CLKSRC_I8253=3Dy
>> CONFIG_CLKEVT_I8253=3Dy
>> CONFIG_I8253_LOCK=3Dy
>> CONFIG_CLKBLD_I8253=3Dy
>> # CONFIG_ATMEL_PIT is not set
>> # CONFIG_SH_TIMER_CMT is not set
>> # CONFIG_SH_TIMER_MTU2 is not set
>> # CONFIG_SH_TIMER_TMU is not set
>> # CONFIG_EM_TIMER_STI is not set
>> CONFIG_MAILBOX=3Dy
>> # CONFIG_PLATFORM_MHU is not set
>> # CONFIG_PCC is not set
>> CONFIG_ALTERA_MBOX=3Dy
>> CONFIG_MAILBOX_TEST=3Dy
>> # CONFIG_IOMMU_SUPPORT is not set
>>
>> #
>> # Remoteproc drivers
>> #
>> # CONFIG_REMOTEPROC is not set
>>
>> #
>> # Rpmsg drivers
>> #
>> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
>> # CONFIG_RPMSG_VIRTIO is not set
>>
>> #
>> # SOC (System On Chip) specific Drivers
>> #
>>
>> #
>> # Amlogic SoC drivers
>> #
>>
>> #
>> # Broadcom SoC drivers
>> #
>>
>> #
>> # i.MX SoC drivers
>> #
>>
>> #
>> # Qualcomm SoC drivers
>> #
>> # CONFIG_SUNXI_SRAM is not set
>> # CONFIG_SOC_TI is not set
>> CONFIG_PM_DEVFREQ=3Dy
>>
>> #
>> # DEVFREQ Governors
>> #
>> # CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is not set
>> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
>> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
>> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
>> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
>>
>> #
>> # DEVFREQ Drivers
>> #
>> # CONFIG_PM_DEVFREQ_EVENT is not set
>> CONFIG_EXTCON=3Dy
>>
>> #
>> # Extcon Device Drivers
>> #
>> CONFIG_EXTCON_ADC_JACK=3Dy
>> CONFIG_EXTCON_GPIO=3Dy
>> # CONFIG_EXTCON_INTEL_INT3496 is not set
>> CONFIG_EXTCON_MAX14577=3Dy
>> # CONFIG_EXTCON_MAX3355 is not set
>> CONFIG_EXTCON_MAX77693=3Dy
>> CONFIG_EXTCON_PALMAS=3Dy
>> # CONFIG_EXTCON_RT8973A is not set
>> # CONFIG_EXTCON_SM5502 is not set
>> # CONFIG_EXTCON_USB_GPIO is not set
>> CONFIG_MEMORY=3Dy
>> CONFIG_IIO=3Dy
>> CONFIG_IIO_BUFFER=3Dy
>> CONFIG_IIO_BUFFER_CB=3Dy
>> CONFIG_IIO_KFIFO_BUF=3Dy
>> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>> CONFIG_IIO_CONFIGFS=3Dy
>> CONFIG_IIO_TRIGGER=3Dy
>> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
>> # CONFIG_IIO_SW_DEVICE is not set
>> CONFIG_IIO_SW_TRIGGER=3Dy
>>
>> #
>> # Accelerometers
>> #
>> CONFIG_ADXL345=3Dy
>> CONFIG_ADXL345_I2C=3Dy
>> # CONFIG_BMA180 is not set
>> # CONFIG_BMC150_ACCEL is not set
>> CONFIG_DA280=3Dy
>> CONFIG_DA311=3Dy
>> CONFIG_DMARD06=3Dy
>> # CONFIG_DMARD09 is not set
>> CONFIG_DMARD10=3Dy
>> CONFIG_IIO_CROS_EC_ACCEL_LEGACY=3Dy
>> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
>> # CONFIG_KXSD9 is not set
>> CONFIG_KXCJK1013=3Dy
>> # CONFIG_MC3230 is not set
>> CONFIG_MMA7455=3Dy
>> CONFIG_MMA7455_I2C=3Dy
>> CONFIG_MMA7660=3Dy
>> # CONFIG_MMA8452 is not set
>> CONFIG_MMA9551_CORE=3Dy
>> CONFIG_MMA9551=3Dy
>> CONFIG_MMA9553=3Dy
>> CONFIG_MXC4005=3Dy
>> CONFIG_MXC6255=3Dy
>> # CONFIG_STK8312 is not set
>> CONFIG_STK8BA50=3Dy
>>
>> #
>> # Analog to digital converters
>> #
>> CONFIG_AD7291=3Dy
>> # CONFIG_AD799X is not set
>> # CONFIG_AXP20X_ADC is not set
>> # CONFIG_AXP288_ADC is not set
>> CONFIG_DA9150_GPADC=3Dy
>> CONFIG_ENVELOPE_DETECTOR=3Dy
>> CONFIG_HX711=3Dy
>> # CONFIG_INA2XX_ADC is not set
>> CONFIG_LTC2471=3Dy
>> CONFIG_LTC2485=3Dy
>> CONFIG_LTC2497=3Dy
>> # CONFIG_MAX1363 is not set
>> CONFIG_MAX9611=3Dy
>> # CONFIG_MCP3422 is not set
>> CONFIG_MEN_Z188_ADC=3Dy
>> CONFIG_NAU7802=3Dy
>> CONFIG_PALMAS_GPADC=3Dy
>> CONFIG_QCOM_VADC_COMMON=3Dy
>> CONFIG_QCOM_SPMI_IADC=3Dy
>> CONFIG_QCOM_SPMI_VADC=3Dy
>> # CONFIG_TI_ADC081C is not set
>> # CONFIG_TI_ADS1015 is not set
>> # CONFIG_TI_AM335X_ADC is not set
>> CONFIG_VF610_ADC=3Dy
>>
>> #
>> # Amplifiers
>> #
>>
>> #
>> # Chemical Sensors
>> #
>> CONFIG_ATLAS_PH_SENSOR=3Dy
>> # CONFIG_CCS811 is not set
>> # CONFIG_IAQCORE is not set
>> CONFIG_VZ89X=3Dy
>>
>> #
>> # Hid Sensor IIO Common
>> #
>> CONFIG_IIO_MS_SENSORS_I2C=3Dy
>>
>> #
>> # SSP Sensor Common
>> #
>> CONFIG_IIO_ST_SENSORS_I2C=3Dy
>> CONFIG_IIO_ST_SENSORS_CORE=3Dy
>>
>> #
>> # Counters
>> #
>>
>> #
>> # Digital to analog converters
>> #
>> CONFIG_AD5064=3Dy
>> CONFIG_AD5380=3Dy
>> # CONFIG_AD5446 is not set
>> CONFIG_AD5592R_BASE=3Dy
>> CONFIG_AD5593R=3Dy
>> # CONFIG_DPOT_DAC is not set
>> CONFIG_DS4424=3Dy
>> # CONFIG_M62332 is not set
>> CONFIG_MAX517=3Dy
>> CONFIG_MAX5821=3Dy
>> CONFIG_MCP4725=3Dy
>> # CONFIG_VF610_DAC is not set
>>
>> #
>> # IIO dummy driver
>> #
>>
>> #
>> # Frequency Synthesizers DDS/PLL
>> #
>>
>> #
>> # Clock Generator/Distribution
>> #
>>
>> #
>> # Phase-Locked Loop (PLL) frequency synthesizers
>> #
>>
>> #
>> # Digital gyroscope sensors
>> #
>> # CONFIG_BMG160 is not set
>> CONFIG_MPU3050=3Dy
>> CONFIG_MPU3050_I2C=3Dy
>> # CONFIG_IIO_ST_GYRO_3AXIS is not set
>> CONFIG_ITG3200=3Dy
>>
>> #
>> # Health Sensors
>> #
>>
>> #
>> # Heart Rate Monitors
>> #
>> CONFIG_AFE4404=3Dy
>> CONFIG_MAX30100=3Dy
>> CONFIG_MAX30102=3Dy
>>
>> #
>> # Humidity sensors
>> #
>> # CONFIG_AM2315 is not set
>> CONFIG_DHT11=3Dy
>> CONFIG_HDC100X=3Dy
>> CONFIG_HTS221=3Dy
>> CONFIG_HTS221_I2C=3Dy
>> CONFIG_HTU21=3Dy
>> CONFIG_SI7005=3Dy
>> CONFIG_SI7020=3Dy
>>
>> #
>> # Inertial measurement units
>> #
>> # CONFIG_BMI160_I2C is not set
>> # CONFIG_KMX61 is not set
>> CONFIG_INV_MPU6050_IIO=3Dy
>> CONFIG_INV_MPU6050_I2C=3Dy
>> # CONFIG_IIO_ST_LSM6DSX is not set
>>
>> #
>> # Light sensors
>> #
>> # CONFIG_ACPI_ALS is not set
>> CONFIG_ADJD_S311=3Dy
>> CONFIG_AL3320A=3Dy
>> # CONFIG_APDS9300 is not set
>> CONFIG_APDS9960=3Dy
>> CONFIG_BH1750=3Dy
>> # CONFIG_BH1780 is not set
>> CONFIG_CM32181=3Dy
>> CONFIG_CM3232=3Dy
>> CONFIG_CM3323=3Dy
>> CONFIG_CM3605=3Dy
>> CONFIG_CM36651=3Dy
>> CONFIG_GP2AP020A00F=3Dy
>> CONFIG_SENSORS_ISL29018=3Dy
>> # CONFIG_SENSORS_ISL29028 is not set
>> # CONFIG_ISL29125 is not set
>> CONFIG_JSA1212=3Dy
>> # CONFIG_RPR0521 is not set
>> # CONFIG_SENSORS_LM3533 is not set
>> CONFIG_LTR501=3Dy
>> CONFIG_MAX44000=3Dy
>> CONFIG_OPT3001=3Dy
>> # CONFIG_PA12203001 is not set
>> # CONFIG_SI1145 is not set
>> CONFIG_STK3310=3Dy
>> # CONFIG_TCS3414 is not set
>> # CONFIG_TCS3472 is not set
>> # CONFIG_SENSORS_TSL2563 is not set
>> CONFIG_TSL2583=3Dy
>> CONFIG_TSL4531=3Dy
>> CONFIG_US5182D=3Dy
>> # CONFIG_VCNL4000 is not set
>> CONFIG_VEML6070=3Dy
>> CONFIG_VL6180=3Dy
>>
>> #
>> # Magnetometer sensors
>> #
>> CONFIG_AK8974=3Dy
>> CONFIG_AK8975=3Dy
>> # CONFIG_AK09911 is not set
>> CONFIG_BMC150_MAGN=3Dy
>> CONFIG_BMC150_MAGN_I2C=3Dy
>> # CONFIG_MAG3110 is not set
>> CONFIG_MMC35240=3Dy
>> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
>> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
>> # CONFIG_SENSORS_HMC5843_I2C is not set
>>
>> #
>> # Multiplexers
>> #
>> # CONFIG_IIO_MUX is not set
>>
>> #
>> # Inclinometer sensors
>> #
>>
>> #
>> # Triggers - standalone
>> #
>> CONFIG_IIO_HRTIMER_TRIGGER=3Dy
>> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
>> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
>> # CONFIG_IIO_SYSFS_TRIGGER is not set
>>
>> #
>> # Digital potentiometers
>> #
>> # CONFIG_DS1803 is not set
>> # CONFIG_MCP4531 is not set
>> CONFIG_TPL0102=3Dy
>>
>> #
>> # Digital potentiostats
>> #
>> CONFIG_LMP91000=3Dy
>>
>> #
>> # Pressure sensors
>> #
>> CONFIG_ABP060MG=3Dy
>> CONFIG_BMP280=3Dy
>> CONFIG_BMP280_I2C=3Dy
>> CONFIG_HP03=3Dy
>> CONFIG_MPL115=3Dy
>> CONFIG_MPL115_I2C=3Dy
>> # CONFIG_MPL3115 is not set
>> CONFIG_MS5611=3Dy
>> CONFIG_MS5611_I2C=3Dy
>> CONFIG_MS5637=3Dy
>> # CONFIG_IIO_ST_PRESS is not set
>> CONFIG_T5403=3Dy
>> CONFIG_HP206C=3Dy
>> # CONFIG_ZPA2326 is not set
>>
>> #
>> # Lightning sensors
>> #
>>
>> #
>> # Proximity and distance sensors
>> #
>> CONFIG_LIDAR_LITE_V2=3Dy
>> CONFIG_RFD77402=3Dy
>> # CONFIG_SRF04 is not set
>> CONFIG_SX9500=3Dy
>> CONFIG_SRF08=3Dy
>>
>> #
>> # Temperature sensors
>> #
>> # CONFIG_MLX90614 is not set
>> CONFIG_TMP006=3Dy
>> CONFIG_TMP007=3Dy
>> CONFIG_TSYS01=3Dy
>> CONFIG_TSYS02D=3Dy
>> # CONFIG_NTB is not set
>> # CONFIG_VME_BUS is not set
>> CONFIG_PWM=3Dy
>> CONFIG_PWM_SYSFS=3Dy
>> CONFIG_PWM_FSL_FTM=3Dy
>> # CONFIG_PWM_LP3943 is not set
>> # CONFIG_PWM_LPSS_PCI is not set
>> # CONFIG_PWM_LPSS_PLATFORM is not set
>> CONFIG_PWM_PCA9685=3Dy
>>
>> #
>> # IRQ chip support
>> #
>> CONFIG_IRQCHIP=3Dy
>> CONFIG_ARM_GIC_MAX_NR=3D1
>> # CONFIG_ARM_GIC_V3_ITS is not set
>> CONFIG_IPACK_BUS=3Dy
>> # CONFIG_BOARD_TPCI200 is not set
>> # CONFIG_SERIAL_IPOCTAL is not set
>> CONFIG_RESET_CONTROLLER=3Dy
>> # CONFIG_RESET_ATH79 is not set
>> # CONFIG_RESET_AXS10X is not set
>> # CONFIG_RESET_BERLIN is not set
>> # CONFIG_RESET_IMX7 is not set
>> # CONFIG_RESET_LANTIQ is not set
>> # CONFIG_RESET_LPC18XX is not set
>> # CONFIG_RESET_MESON is not set
>> # CONFIG_RESET_PISTACHIO is not set
>> # CONFIG_RESET_SIMPLE is not set
>> # CONFIG_RESET_SUNXI is not set
>> # CONFIG_RESET_TI_SYSCON is not set
>> # CONFIG_RESET_ZYNQ is not set
>> # CONFIG_RESET_TEGRA_BPMP is not set
>> # CONFIG_FMC is not set
>>
>> #
>> # PHY Subsystem
>> #
>> CONFIG_GENERIC_PHY=3Dy
>> CONFIG_BCM_KONA_USB2_PHY=3Dy
>> # CONFIG_PHY_PXA_28NM_HSIC is not set
>> CONFIG_PHY_PXA_28NM_USB2=3Dy
>> # CONFIG_PHY_CPCAP_USB is not set
>> CONFIG_POWERCAP=3Dy
>> CONFIG_MCB=3Dy
>> # CONFIG_MCB_PCI is not set
>> # CONFIG_MCB_LPC is not set
>>
>> #
>> # Performance monitor support
>> #
>> CONFIG_RAS=3Dy
>> # CONFIG_THUNDERBOLT is not set
>>
>> #
>> # Android
>> #
>> CONFIG_ANDROID=3Dy
>> CONFIG_ANDROID_BINDER_IPC=3Dy
>> CONFIG_ANDROID_BINDER_DEVICES=3D"binder,hwbinder,vndbinder"
>> # CONFIG_ANDROID_BINDER_IPC_32BIT is not set
>> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
>> CONFIG_DAX=3Dy
>> CONFIG_DEV_DAX=3Dy
>> CONFIG_NVMEM=3Dy
>> # CONFIG_STM is not set
>> # CONFIG_INTEL_TH is not set
>> CONFIG_FPGA=3Dy
>> CONFIG_FPGA_REGION=3Dy
>> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
>> CONFIG_FPGA_BRIDGE=3Dy
>> CONFIG_ALTERA_PR_IP_CORE=3Dy
>> CONFIG_ALTERA_PR_IP_CORE_PLAT=3Dy
>> CONFIG_XILINX_PR_DECOUPLER=3Dy
>>
>> #
>> # FSI support
>> #
>> CONFIG_FSI=3Dy
>> CONFIG_FSI_MASTER_GPIO=3Dy
>> # CONFIG_FSI_MASTER_HUB is not set
>> CONFIG_FSI_SCOM=3Dy
>> CONFIG_PM_OPP=3Dy
>>
>> #
>> # Firmware Drivers
>> #
>> # CONFIG_EDD is not set
>> # CONFIG_FIRMWARE_MEMMAP is not set
>> # CONFIG_DELL_RBU is not set
>> CONFIG_DCDBAS=3Dy
>> CONFIG_DMIID=3Dy
>> # CONFIG_DMI_SYSFS is not set
>> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
>> # CONFIG_ISCSI_IBFT_FIND is not set
>> # CONFIG_FW_CFG_SYSFS is not set
>> # CONFIG_GOOGLE_FIRMWARE is not set
>> # CONFIG_EFI_DEV_PATH_PARSER is not set
>>
>> #
>> # Tegra firmware driver
>> #
>>
>> #
>> # File systems
>> #
>> CONFIG_DCACHE_WORD_ACCESS=3Dy
>> CONFIG_FS_IOMAP=3Dy
>> # CONFIG_EXT2_FS is not set
>> CONFIG_EXT3_FS=3Dy
>> # CONFIG_EXT3_FS_POSIX_ACL is not set
>> # CONFIG_EXT3_FS_SECURITY is not set
>> CONFIG_EXT4_FS=3Dy
>> # CONFIG_EXT4_USE_FOR_EXT2 is not set
>> CONFIG_EXT4_FS_POSIX_ACL=3Dy
>> # CONFIG_EXT4_FS_SECURITY is not set
>> # CONFIG_EXT4_ENCRYPTION is not set
>> # CONFIG_EXT4_DEBUG is not set
>> CONFIG_JBD2=3Dy
>> # CONFIG_JBD2_DEBUG is not set
>> CONFIG_FS_MBCACHE=3Dy
>> CONFIG_REISERFS_FS=3Dy
>> CONFIG_REISERFS_CHECK=3Dy
>> # CONFIG_REISERFS_PROC_INFO is not set
>> CONFIG_REISERFS_FS_XATTR=3Dy
>> CONFIG_REISERFS_FS_POSIX_ACL=3Dy
>> CONFIG_REISERFS_FS_SECURITY=3Dy
>> CONFIG_JFS_FS=3Dy
>> # CONFIG_JFS_POSIX_ACL is not set
>> # CONFIG_JFS_SECURITY is not set
>> CONFIG_JFS_DEBUG=3Dy
>> # CONFIG_JFS_STATISTICS is not set
>> # CONFIG_XFS_FS is not set
>> # CONFIG_GFS2_FS is not set
>> CONFIG_OCFS2_FS=3Dy
>> CONFIG_OCFS2_FS_O2CB=3Dy
>> # CONFIG_OCFS2_FS_USERSPACE_CLUSTER is not set
>> CONFIG_OCFS2_FS_STATS=3Dy
>> # CONFIG_OCFS2_DEBUG_MASKLOG is not set
>> # CONFIG_OCFS2_DEBUG_FS is not set
>> CONFIG_BTRFS_FS=3Dy
>> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
>> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
>> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
>> # CONFIG_BTRFS_DEBUG is not set
>> # CONFIG_BTRFS_ASSERT is not set
>> # CONFIG_BTRFS_FS_REF_VERIFY is not set
>> # CONFIG_NILFS2_FS is not set
>> CONFIG_F2FS_FS=3Dy
>> CONFIG_F2FS_STAT_FS=3Dy
>> CONFIG_F2FS_FS_XATTR=3Dy
>> # CONFIG_F2FS_FS_POSIX_ACL is not set
>> # CONFIG_F2FS_FS_SECURITY is not set
>> # CONFIG_F2FS_CHECK_FS is not set
>> CONFIG_F2FS_FS_ENCRYPTION=3Dy
>> # CONFIG_F2FS_FAULT_INJECTION is not set
>> # CONFIG_FS_DAX is not set
>> CONFIG_FS_POSIX_ACL=3Dy
>> CONFIG_EXPORTFS=3Dy
>> # CONFIG_EXPORTFS_BLOCK_OPS is not set
>> CONFIG_FILE_LOCKING=3Dy
>> CONFIG_MANDATORY_FILE_LOCKING=3Dy
>> CONFIG_FS_ENCRYPTION=3Dy
>> CONFIG_FSNOTIFY=3Dy
>> # CONFIG_DNOTIFY is not set
>> CONFIG_INOTIFY_USER=3Dy
>> # CONFIG_FANOTIFY is not set
>> CONFIG_QUOTA=3Dy
>> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
>> CONFIG_PRINT_QUOTA_WARNING=3Dy
>> CONFIG_QUOTA_DEBUG=3Dy
>> CONFIG_QUOTA_TREE=3Dy
>> CONFIG_QFMT_V1=3Dy
>> # CONFIG_QFMT_V2 is not set
>> CONFIG_QUOTACTL=3Dy
>> # CONFIG_AUTOFS4_FS is not set
>> CONFIG_FUSE_FS=3Dy
>> CONFIG_CUSE=3Dy
>> CONFIG_OVERLAY_FS=3Dy
>> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
>> CONFIG_OVERLAY_FS_INDEX=3Dy
>>
>> #
>> # Caches
>> #
>> CONFIG_FSCACHE=3Dy
>> # CONFIG_FSCACHE_STATS is not set
>> # CONFIG_FSCACHE_HISTOGRAM is not set
>> CONFIG_FSCACHE_DEBUG=3Dy
>> # CONFIG_FSCACHE_OBJECT_LIST is not set
>> CONFIG_CACHEFILES=3Dy
>> # CONFIG_CACHEFILES_DEBUG is not set
>> # CONFIG_CACHEFILES_HISTOGRAM is not set
>>
>> #
>> # CD-ROM/DVD Filesystems
>> #
>> CONFIG_ISO9660_FS=3Dy
>> CONFIG_JOLIET=3Dy
>> CONFIG_ZISOFS=3Dy
>> CONFIG_UDF_FS=3Dy
>> CONFIG_UDF_NLS=3Dy
>>
>> #
>> # DOS/FAT/NT Filesystems
>> #
>> CONFIG_FAT_FS=3Dy
>> # CONFIG_MSDOS_FS is not set
>> CONFIG_VFAT_FS=3Dy
>> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
>> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
>> # CONFIG_FAT_DEFAULT_UTF8 is not set
>> CONFIG_NTFS_FS=3Dy
>> CONFIG_NTFS_DEBUG=3Dy
>> CONFIG_NTFS_RW=3Dy
>>
>> #
>> # Pseudo filesystems
>> #
>> CONFIG_PROC_FS=3Dy
>> # CONFIG_PROC_KCORE is not set
>> CONFIG_PROC_VMCORE=3Dy
>> CONFIG_PROC_SYSCTL=3Dy
>> CONFIG_PROC_PAGE_MONITOR=3Dy
>> CONFIG_PROC_CHILDREN=3Dy
>> CONFIG_KERNFS=3Dy
>> CONFIG_SYSFS=3Dy
>> CONFIG_TMPFS=3Dy
>> # CONFIG_TMPFS_POSIX_ACL is not set
>> # CONFIG_TMPFS_XATTR is not set
>> CONFIG_HUGETLBFS=3Dy
>> CONFIG_HUGETLB_PAGE=3Dy
>> CONFIG_CONFIGFS_FS=3Dy
>> # CONFIG_MISC_FILESYSTEMS is not set
>> # CONFIG_NETWORK_FILESYSTEMS is not set
>> CONFIG_NLS=3Dy
>> CONFIG_NLS_DEFAULT=3D"iso8859-1"
>> CONFIG_NLS_CODEPAGE_437=3Dy
>> CONFIG_NLS_CODEPAGE_737=3Dy
>> CONFIG_NLS_CODEPAGE_775=3Dy
>> CONFIG_NLS_CODEPAGE_850=3Dy
>> # CONFIG_NLS_CODEPAGE_852 is not set
>> CONFIG_NLS_CODEPAGE_855=3Dy
>> CONFIG_NLS_CODEPAGE_857=3Dy
>> # CONFIG_NLS_CODEPAGE_860 is not set
>> # CONFIG_NLS_CODEPAGE_861 is not set
>> # CONFIG_NLS_CODEPAGE_862 is not set
>> # CONFIG_NLS_CODEPAGE_863 is not set
>> CONFIG_NLS_CODEPAGE_864=3Dy
>> CONFIG_NLS_CODEPAGE_865=3Dy
>> # CONFIG_NLS_CODEPAGE_866 is not set
>> CONFIG_NLS_CODEPAGE_869=3Dy
>> # CONFIG_NLS_CODEPAGE_936 is not set
>> CONFIG_NLS_CODEPAGE_950=3Dy
>> # CONFIG_NLS_CODEPAGE_932 is not set
>> CONFIG_NLS_CODEPAGE_949=3Dy
>> # CONFIG_NLS_CODEPAGE_874 is not set
>> # CONFIG_NLS_ISO8859_8 is not set
>> CONFIG_NLS_CODEPAGE_1250=3Dy
>> CONFIG_NLS_CODEPAGE_1251=3Dy
>> CONFIG_NLS_ASCII=3Dy
>> # CONFIG_NLS_ISO8859_1 is not set
>> CONFIG_NLS_ISO8859_2=3Dy
>> # CONFIG_NLS_ISO8859_3 is not set
>> CONFIG_NLS_ISO8859_4=3Dy
>> # CONFIG_NLS_ISO8859_5 is not set
>> CONFIG_NLS_ISO8859_6=3Dy
>> CONFIG_NLS_ISO8859_7=3Dy
>> # CONFIG_NLS_ISO8859_9 is not set
>> CONFIG_NLS_ISO8859_13=3Dy
>> # CONFIG_NLS_ISO8859_14 is not set
>> CONFIG_NLS_ISO8859_15=3Dy
>> CONFIG_NLS_KOI8_R=3Dy
>> CONFIG_NLS_KOI8_U=3Dy
>> # CONFIG_NLS_MAC_ROMAN is not set
>> CONFIG_NLS_MAC_CELTIC=3Dy
>> # CONFIG_NLS_MAC_CENTEURO is not set
>> CONFIG_NLS_MAC_CROATIAN=3Dy
>> CONFIG_NLS_MAC_CYRILLIC=3Dy
>> CONFIG_NLS_MAC_GAELIC=3Dy
>> CONFIG_NLS_MAC_GREEK=3Dy
>> CONFIG_NLS_MAC_ICELAND=3Dy
>> CONFIG_NLS_MAC_INUIT=3Dy
>> CONFIG_NLS_MAC_ROMANIAN=3Dy
>> CONFIG_NLS_MAC_TURKISH=3Dy
>> # CONFIG_NLS_UTF8 is not set
>> CONFIG_DLM=3Dy
>> # CONFIG_DLM_DEBUG is not set
>>
>> #
>> # Kernel hacking
>> #
>> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>>
>> #
>> # printk and dmesg options
>> #
>> CONFIG_PRINTK_TIME=3Dy
>> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>> # CONFIG_BOOT_PRINTK_DELAY is not set
>> CONFIG_DYNAMIC_DEBUG=3Dy
>>
>> #
>> # Compile-time checks and compiler options
>> #
>> CONFIG_DEBUG_INFO=3Dy
>> CONFIG_DEBUG_INFO_REDUCED=3Dy
>> # CONFIG_DEBUG_INFO_SPLIT is not set
>> # CONFIG_DEBUG_INFO_DWARF4 is not set
>> # CONFIG_GDB_SCRIPTS is not set
>> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
>> # CONFIG_ENABLE_MUST_CHECK is not set
>> CONFIG_FRAME_WARN=3D1024
>> CONFIG_STRIP_ASM_SYMS=3Dy
>> # CONFIG_READABLE_ASM is not set
>> CONFIG_UNUSED_SYMBOLS=3Dy
>> CONFIG_PAGE_OWNER=3Dy
>> CONFIG_DEBUG_FS=3Dy
>> CONFIG_HEADERS_CHECK=3Dy
>> # CONFIG_DEBUG_SECTION_MISMATCH is not set
>> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> CONFIG_FRAME_POINTER=3Dy
>> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>> CONFIG_MAGIC_SYSRQ=3Dy
>> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
>> CONFIG_DEBUG_KERNEL=3Dy
>>
>> #
>> # Memory Debugging
>> #
>> CONFIG_PAGE_EXTENSION=3Dy
>> CONFIG_DEBUG_PAGEALLOC=3Dy
>> CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
>> CONFIG_PAGE_POISONING=3Dy
>> # CONFIG_PAGE_POISONING_NO_SANITY is not set
>> CONFIG_PAGE_POISONING_ZERO=3Dy
>> # CONFIG_DEBUG_PAGE_REF is not set
>> # CONFIG_DEBUG_RODATA_TEST is not set
>> # CONFIG_DEBUG_OBJECTS is not set
>> # CONFIG_DEBUG_SLAB is not set
>> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>> # CONFIG_DEBUG_KMEMLEAK is not set
>> # CONFIG_DEBUG_STACK_USAGE is not set
>> CONFIG_DEBUG_VM=3Dy
>> # CONFIG_DEBUG_VM_VMACACHE is not set
>> CONFIG_DEBUG_VM_RB=3Dy
>> # CONFIG_DEBUG_VM_PGFLAGS is not set
>> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
>> # CONFIG_DEBUG_VIRTUAL is not set
>> CONFIG_DEBUG_MEMORY_INIT=3Dy
>> # CONFIG_DEBUG_HIGHMEM is not set
>> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
>> CONFIG_DEBUG_STACKOVERFLOW=3Dy
>> CONFIG_DEBUG_SHIRQ=3Dy
>>
>> #
>> # Debug Lockups and Hangs
>> #
>> CONFIG_LOCKUP_DETECTOR=3Dy
>> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
>> # CONFIG_HARDLOCKUP_DETECTOR is not set
>> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
>> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
>> # CONFIG_DETECT_HUNG_TASK is not set
>> CONFIG_WQ_WATCHDOG=3Dy
>> CONFIG_PANIC_ON_OOPS=3Dy
>> CONFIG_PANIC_ON_OOPS_VALUE=3D1
>> CONFIG_PANIC_TIMEOUT=3D0
>> CONFIG_SCHED_DEBUG=3Dy
>> # CONFIG_SCHED_INFO is not set
>> # CONFIG_SCHEDSTATS is not set
>> CONFIG_SCHED_STACK_END_CHECK=3Dy
>> # CONFIG_DEBUG_TIMEKEEPING is not set
>>
>> #
>> # Lock Debugging (spinlocks, mutexes, etc...)
>> #
>> CONFIG_DEBUG_RT_MUTEXES=3Dy
>> CONFIG_DEBUG_SPINLOCK=3Dy
>> CONFIG_DEBUG_MUTEXES=3Dy
>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
>> CONFIG_DEBUG_LOCK_ALLOC=3Dy
>> CONFIG_PROVE_LOCKING=3Dy
>> CONFIG_LOCKDEP=3Dy
>> CONFIG_LOCK_STAT=3Dy
>> CONFIG_LOCKDEP_CROSSRELEASE=3Dy
>> CONFIG_LOCKDEP_COMPLETIONS=3Dy
>> # CONFIG_BOOTPARAM_LOCKDEP_CROSSRELEASE_FULLSTACK is not set
>> CONFIG_DEBUG_LOCKDEP=3Dy
>> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>> CONFIG_LOCK_TORTURE_TEST=3Dy
>> # CONFIG_WW_MUTEX_SELFTEST is not set
>> CONFIG_TRACE_IRQFLAGS=3Dy
>> CONFIG_STACKTRACE=3Dy
>> CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
>> # CONFIG_DEBUG_KOBJECT is not set
>> CONFIG_DEBUG_BUGVERBOSE=3Dy
>> # CONFIG_DEBUG_LIST is not set
>> # CONFIG_DEBUG_PI_LIST is not set
>> CONFIG_DEBUG_SG=3Dy
>> CONFIG_DEBUG_NOTIFIERS=3Dy
>> # CONFIG_DEBUG_CREDENTIALS is not set
>>
>> #
>> # RCU Debugging
>> #
>> CONFIG_PROVE_RCU=3Dy
>> CONFIG_TORTURE_TEST=3Dy
>> # CONFIG_RCU_PERF_TEST is not set
>> CONFIG_RCU_TORTURE_TEST=3Dy
>> # CONFIG_RCU_TRACE is not set
>> # CONFIG_RCU_EQS_DEBUG is not set
>> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
>> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
>> CONFIG_FAULT_INJECTION=3Dy
>> # CONFIG_FAILSLAB is not set
>> CONFIG_FAIL_PAGE_ALLOC=3Dy
>> # CONFIG_FAIL_MAKE_REQUEST is not set
>> # CONFIG_FAIL_IO_TIMEOUT is not set
>> # CONFIG_FAIL_FUTEX is not set
>> # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
>> # CONFIG_LATENCYTOP is not set
>> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>> CONFIG_NOP_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>> CONFIG_TRACER_MAX_TRACE=3Dy
>> CONFIG_TRACE_CLOCK=3Dy
>> CONFIG_RING_BUFFER=3Dy
>> CONFIG_EVENT_TRACING=3Dy
>> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
>> CONFIG_TRACING=3Dy
>> CONFIG_GENERIC_TRACER=3Dy
>> CONFIG_TRACING_SUPPORT=3Dy
>> CONFIG_FTRACE=3Dy
>> # CONFIG_FUNCTION_TRACER is not set
>> # CONFIG_IRQSOFF_TRACER is not set
>> # CONFIG_SCHED_TRACER is not set
>> CONFIG_HWLAT_TRACER=3Dy
>> # CONFIG_FTRACE_SYSCALLS is not set
>> CONFIG_TRACER_SNAPSHOT=3Dy
>> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
>> CONFIG_TRACE_BRANCH_PROFILING=3Dy
>> # CONFIG_BRANCH_PROFILE_NONE is not set
>> CONFIG_PROFILE_ANNOTATED_BRANCHES=3Dy
>> # CONFIG_PROFILE_ALL_BRANCHES is not set
>> # CONFIG_BRANCH_TRACER is not set
>> # CONFIG_STACK_TRACER is not set
>> CONFIG_BLK_DEV_IO_TRACE=3Dy
>> # CONFIG_UPROBE_EVENTS is not set
>> # CONFIG_PROBE_EVENTS is not set
>> # CONFIG_FTRACE_STARTUP_TEST is not set
>> # CONFIG_MMIOTRACE is not set
>> # CONFIG_HIST_TRIGGERS is not set
>> CONFIG_TRACEPOINT_BENCHMARK=3Dy
>> CONFIG_RING_BUFFER_BENCHMARK=3Dy
>> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
>> CONFIG_TRACE_EVAL_MAP_FILE=3Dy
>> CONFIG_TRACING_EVENTS_GPIO=3Dy
>> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
>> # CONFIG_DMA_API_DEBUG is not set
>>
>> #
>> # Runtime Testing
>> #
>> CONFIG_LKDTM=3Dy
>> # CONFIG_TEST_LIST_SORT is not set
>> CONFIG_TEST_SORT=3Dy
>> # CONFIG_BACKTRACE_SELF_TEST is not set
>> CONFIG_RBTREE_TEST=3Dy
>> CONFIG_INTERVAL_TREE_TEST=3Dy
>> # CONFIG_ATOMIC64_SELFTEST is not set
>> CONFIG_TEST_HEXDUMP=3Dy
>> CONFIG_TEST_STRING_HELPERS=3Dy
>> CONFIG_TEST_KSTRTOX=3Dy
>> # CONFIG_TEST_PRINTF is not set
>> CONFIG_TEST_BITMAP=3Dy
>> CONFIG_TEST_UUID=3Dy
>> # CONFIG_TEST_RHASHTABLE is not set
>> CONFIG_TEST_HASH=3Dy
>> # CONFIG_TEST_FIND_BIT is not set
>> CONFIG_TEST_FIRMWARE=3Dy
>> # CONFIG_TEST_SYSCTL is not set
>> CONFIG_TEST_UDELAY=3Dy
>> # CONFIG_MEMTEST is not set
>> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
>> # CONFIG_SAMPLES is not set
>> CONFIG_HAVE_ARCH_KGDB=3Dy
>> # CONFIG_KGDB is not set
>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>> # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
>> # CONFIG_UBSAN is not set
>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>> CONFIG_X86_VERBOSE_BOOTUP=3Dy
>> # CONFIG_EARLY_PRINTK is not set
>> # CONFIG_X86_PTDUMP_CORE is not set
>> # CONFIG_X86_PTDUMP is not set
>> # CONFIG_DEBUG_WX is not set
>> # CONFIG_DOUBLEFAULT is not set
>> # CONFIG_DEBUG_TLBFLUSH is not set
>> CONFIG_IOMMU_STRESS=3Dy
>> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
>> CONFIG_IO_DELAY_TYPE_0X80=3D0
>> CONFIG_IO_DELAY_TYPE_0XED=3D1
>> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
>> CONFIG_IO_DELAY_TYPE_NONE=3D3
>> CONFIG_IO_DELAY_0X80=3Dy
>> # CONFIG_IO_DELAY_0XED is not set
>> # CONFIG_IO_DELAY_UDELAY is not set
>> # CONFIG_IO_DELAY_NONE is not set
>> CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
>> # CONFIG_DEBUG_BOOT_PARAMS is not set
>> # CONFIG_CPA_DEBUG is not set
>> # CONFIG_OPTIMIZE_INLINING is not set
>> # CONFIG_DEBUG_ENTRY is not set
>> CONFIG_X86_DEBUG_FPU=3Dy
>> # CONFIG_PUNIT_ATOM_DEBUG is not set
>> CONFIG_UNWINDER_FRAME_POINTER=3Dy
>> # CONFIG_UNWINDER_GUESS is not set
>>
>> #
>> # Security options
>> #
>> CONFIG_KEYS=3Dy
>> CONFIG_PERSISTENT_KEYRINGS=3Dy
>> # CONFIG_BIG_KEYS is not set
>> CONFIG_ENCRYPTED_KEYS=3Dy
>> # CONFIG_KEY_DH_OPERATIONS is not set
>> # CONFIG_SECURITY_DMESG_RESTRICT is not set
>> # CONFIG_SECURITY is not set
>> CONFIG_SECURITYFS=3Dy
>> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
>> CONFIG_HARDENED_USERCOPY=3Dy
>> # CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
>> CONFIG_FORTIFY_SOURCE=3Dy
>> # CONFIG_STATIC_USERMODEHELPER is not set
>> CONFIG_DEFAULT_SECURITY_DAC=3Dy
>> CONFIG_DEFAULT_SECURITY=3D""
>> CONFIG_XOR_BLOCKS=3Dy
>> CONFIG_CRYPTO=3Dy
>>
>> #
>> # Crypto core or helper
>> #
>> CONFIG_CRYPTO_ALGAPI=3Dy
>> CONFIG_CRYPTO_ALGAPI2=3Dy
>> CONFIG_CRYPTO_AEAD=3Dy
>> CONFIG_CRYPTO_AEAD2=3Dy
>> CONFIG_CRYPTO_BLKCIPHER=3Dy
>> CONFIG_CRYPTO_BLKCIPHER2=3Dy
>> CONFIG_CRYPTO_HASH=3Dy
>> CONFIG_CRYPTO_HASH2=3Dy
>> CONFIG_CRYPTO_RNG=3Dy
>> CONFIG_CRYPTO_RNG2=3Dy
>> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
>> CONFIG_CRYPTO_AKCIPHER2=3Dy
>> CONFIG_CRYPTO_AKCIPHER=3Dy
>> CONFIG_CRYPTO_KPP2=3Dy
>> CONFIG_CRYPTO_ACOMP2=3Dy
>> CONFIG_CRYPTO_RSA=3Dy
>> # CONFIG_CRYPTO_DH is not set
>> CONFIG_CRYPTO_ECDH=3Dy
>> CONFIG_CRYPTO_MANAGER=3Dy
>> CONFIG_CRYPTO_MANAGER2=3Dy
>> CONFIG_CRYPTO_USER=3Dy
>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>> CONFIG_CRYPTO_GF128MUL=3Dy
>> CONFIG_CRYPTO_NULL=3Dy
>> CONFIG_CRYPTO_NULL2=3Dy
>> CONFIG_CRYPTO_WORKQUEUE=3Dy
>> CONFIG_CRYPTO_CRYPTD=3Dy
>> CONFIG_CRYPTO_MCRYPTD=3Dy
>> CONFIG_CRYPTO_AUTHENC=3Dy
>>
>> #
>> # Authenticated Encryption with Associated Data
>> #
>> # CONFIG_CRYPTO_CCM is not set
>> CONFIG_CRYPTO_GCM=3Dy
>> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
>> CONFIG_CRYPTO_SEQIV=3Dy
>> CONFIG_CRYPTO_ECHAINIV=3Dy
>>
>> #
>> # Block modes
>> #
>> CONFIG_CRYPTO_CBC=3Dy
>> CONFIG_CRYPTO_CTR=3Dy
>> CONFIG_CRYPTO_CTS=3Dy
>> CONFIG_CRYPTO_ECB=3Dy
>> CONFIG_CRYPTO_LRW=3Dy
>> CONFIG_CRYPTO_PCBC=3Dy
>> CONFIG_CRYPTO_XTS=3Dy
>> # CONFIG_CRYPTO_KEYWRAP is not set
>>
>> #
>> # Hash modes
>> #
>> CONFIG_CRYPTO_CMAC=3Dy
>> CONFIG_CRYPTO_HMAC=3Dy
>> CONFIG_CRYPTO_XCBC=3Dy
>> CONFIG_CRYPTO_VMAC=3Dy
>>
>> #
>> # Digest
>> #
>> CONFIG_CRYPTO_CRC32C=3Dy
>> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
>> CONFIG_CRYPTO_CRC32=3Dy
>> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
>> CONFIG_CRYPTO_CRCT10DIF=3Dy
>> CONFIG_CRYPTO_GHASH=3Dy
>> # CONFIG_CRYPTO_POLY1305 is not set
>> # CONFIG_CRYPTO_MD4 is not set
>> CONFIG_CRYPTO_MD5=3Dy
>> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
>> CONFIG_CRYPTO_RMD128=3Dy
>> # CONFIG_CRYPTO_RMD160 is not set
>> CONFIG_CRYPTO_RMD256=3Dy
>> CONFIG_CRYPTO_RMD320=3Dy
>> CONFIG_CRYPTO_SHA1=3Dy
>> CONFIG_CRYPTO_SHA256=3Dy
>> CONFIG_CRYPTO_SHA512=3Dy
>> CONFIG_CRYPTO_SHA3=3Dy
>> CONFIG_CRYPTO_SM3=3Dy
>> # CONFIG_CRYPTO_TGR192 is not set
>> CONFIG_CRYPTO_WP512=3Dy
>>
>> #
>> # Ciphers
>> #
>> CONFIG_CRYPTO_AES=3Dy
>> CONFIG_CRYPTO_AES_TI=3Dy
>> # CONFIG_CRYPTO_AES_586 is not set
>> # CONFIG_CRYPTO_AES_NI_INTEL is not set
>> CONFIG_CRYPTO_ANUBIS=3Dy
>> CONFIG_CRYPTO_ARC4=3Dy
>> CONFIG_CRYPTO_BLOWFISH=3Dy
>> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
>> CONFIG_CRYPTO_CAMELLIA=3Dy
>> CONFIG_CRYPTO_CAST_COMMON=3Dy
>> CONFIG_CRYPTO_CAST5=3Dy
>> CONFIG_CRYPTO_CAST6=3Dy
>> CONFIG_CRYPTO_DES=3Dy
>> CONFIG_CRYPTO_FCRYPT=3Dy
>> CONFIG_CRYPTO_KHAZAD=3Dy
>> CONFIG_CRYPTO_SALSA20=3Dy
>> CONFIG_CRYPTO_SALSA20_586=3Dy
>> CONFIG_CRYPTO_CHACHA20=3Dy
>> CONFIG_CRYPTO_SEED=3Dy
>> CONFIG_CRYPTO_SERPENT=3Dy
>> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
>> CONFIG_CRYPTO_TEA=3Dy
>> # CONFIG_CRYPTO_TWOFISH is not set
>> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
>> CONFIG_CRYPTO_TWOFISH_586=3Dy
>>
>> #
>> # Compression
>> #
>> CONFIG_CRYPTO_DEFLATE=3Dy
>> CONFIG_CRYPTO_LZO=3Dy
>> CONFIG_CRYPTO_842=3Dy
>> # CONFIG_CRYPTO_LZ4 is not set
>> # CONFIG_CRYPTO_LZ4HC is not set
>>
>> #
>> # Random Number Generation
>> #
>> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
>> CONFIG_CRYPTO_DRBG_MENU=3Dy
>> CONFIG_CRYPTO_DRBG_HMAC=3Dy
>> # CONFIG_CRYPTO_DRBG_HASH is not set
>> CONFIG_CRYPTO_DRBG_CTR=3Dy
>> CONFIG_CRYPTO_DRBG=3Dy
>> CONFIG_CRYPTO_JITTERENTROPY=3Dy
>> CONFIG_CRYPTO_USER_API=3Dy
>> CONFIG_CRYPTO_USER_API_HASH=3Dy
>> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
>> # CONFIG_CRYPTO_USER_API_RNG is not set
>> CONFIG_CRYPTO_USER_API_AEAD=3Dy
>> CONFIG_CRYPTO_HASH_INFO=3Dy
>> CONFIG_CRYPTO_HW=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
>> # CONFIG_CRYPTO_DEV_GEODE is not set
>> # CONFIG_CRYPTO_DEV_HIFN_795X is not set
>> # CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
>> # CONFIG_CRYPTO_DEV_CCP is not set
>> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
>> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
>> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
>> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
>> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
>> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
>> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
>> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
>> CONFIG_X509_CERTIFICATE_PARSER=3Dy
>> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
>> # CONFIG_PKCS7_TEST_KEY is not set
>> # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
>>
>> #
>> # Certificates for signature checking
>> #
>> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
>> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
>> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
>> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
>> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
>> CONFIG_HAVE_KVM=3Dy
>> # CONFIG_VIRTUALIZATION is not set
>> CONFIG_BINARY_PRINTF=3Dy
>>
>> #
>> # Library routines
>> #
>> CONFIG_RAID6_PQ=3Dy
>> CONFIG_BITREVERSE=3Dy
>> # CONFIG_HAVE_ARCH_BITREVERSE is not set
>> CONFIG_RATIONAL=3Dy
>> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>> CONFIG_GENERIC_STRNLEN_USER=3Dy
>> CONFIG_GENERIC_NET_UTILS=3Dy
>> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>> CONFIG_GENERIC_PCI_IOMAP=3Dy
>> CONFIG_GENERIC_IOMAP=3Dy
>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>> CONFIG_CRC_CCITT=3Dy
>> CONFIG_CRC16=3Dy
>> CONFIG_CRC_T10DIF=3Dy
>> CONFIG_CRC_ITU_T=3Dy
>> CONFIG_CRC32=3Dy
>> # CONFIG_CRC32_SELFTEST is not set
>> # CONFIG_CRC32_SLICEBY8 is not set
>> # CONFIG_CRC32_SLICEBY4 is not set
>> # CONFIG_CRC32_SARWATE is not set
>> CONFIG_CRC32_BIT=3Dy
>> CONFIG_CRC4=3Dy
>> # CONFIG_CRC7 is not set
>> CONFIG_LIBCRC32C=3Dy
>> CONFIG_CRC8=3Dy
>> CONFIG_XXHASH=3Dy
>> CONFIG_AUDIT_GENERIC=3Dy
>> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
>> CONFIG_RANDOM32_SELFTEST=3Dy
>> CONFIG_842_COMPRESS=3Dy
>> CONFIG_842_DECOMPRESS=3Dy
>> CONFIG_ZLIB_INFLATE=3Dy
>> CONFIG_ZLIB_DEFLATE=3Dy
>> CONFIG_LZO_COMPRESS=3Dy
>> CONFIG_LZO_DECOMPRESS=3Dy
>> CONFIG_LZ4_DECOMPRESS=3Dy
>> CONFIG_ZSTD_COMPRESS=3Dy
>> CONFIG_ZSTD_DECOMPRESS=3Dy
>> CONFIG_XZ_DEC=3Dy
>> CONFIG_XZ_DEC_X86=3Dy
>> # CONFIG_XZ_DEC_POWERPC is not set
>> # CONFIG_XZ_DEC_IA64 is not set
>> CONFIG_XZ_DEC_ARM=3Dy
>> # CONFIG_XZ_DEC_ARMTHUMB is not set
>> CONFIG_XZ_DEC_SPARC=3Dy
>> CONFIG_XZ_DEC_BCJ=3Dy
>> CONFIG_XZ_DEC_TEST=3Dy
>> CONFIG_DECOMPRESS_GZIP=3Dy
>> CONFIG_DECOMPRESS_BZIP2=3Dy
>> CONFIG_DECOMPRESS_LZMA=3Dy
>> CONFIG_DECOMPRESS_LZ4=3Dy
>> CONFIG_GENERIC_ALLOCATOR=3Dy
>> CONFIG_REED_SOLOMON=3Dy
>> CONFIG_REED_SOLOMON_DEC16=3Dy
>> CONFIG_BCH=3Dy
>> CONFIG_BCH_CONST_PARAMS=3Dy
>> CONFIG_INTERVAL_TREE=3Dy
>> CONFIG_RADIX_TREE_MULTIORDER=3Dy
>> CONFIG_ASSOCIATIVE_ARRAY=3Dy
>> CONFIG_HAS_IOMEM=3Dy
>> CONFIG_HAS_IOPORT_MAP=3Dy
>> CONFIG_HAS_DMA=3Dy
>> # CONFIG_DMA_NOOP_OPS is not set
>> # CONFIG_DMA_VIRT_OPS is not set
>> CONFIG_DQL=3Dy
>> CONFIG_GLOB=3Dy
>> CONFIG_GLOB_SELFTEST=3Dy
>> CONFIG_NLATTR=3Dy
>> CONFIG_CLZ_TAB=3Dy
>> CONFIG_CORDIC=3Dy
>> # CONFIG_DDR is not set
>> CONFIG_IRQ_POLL=3Dy
>> CONFIG_MPILIB=3Dy
>> CONFIG_OID_REGISTRY=3Dy
>> # CONFIG_SG_SPLIT is not set
>> CONFIG_SG_POOL=3Dy
>> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
>> CONFIG_STACKDEPOT=3Dy
>> CONFIG_SBITMAP=3Dy
>> CONFIG_PRIME_NUMBERS=3Dy
>> CONFIG_STRING_SELFTEST=3Dy
>

--===============0725081800219306651==--

