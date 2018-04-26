Content-Type: multipart/mixed; boundary="===============5445529577185841661=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: dbf3fab3be ("EXP rcu: Diagnostics for grace-period hangs"): BUG: spinlock recursion on CPU#0, rcu_torture_wri/37
Date: Thu, 26 Apr 2018 09:11:40 -0700
Message-ID: <20180426161140.GG26088@linux.vnet.ibm.com>
In-Reply-To: <5ae1d539.Yh76fvdjphyAnWpt%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5445529577185841661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2018 at 09:33:45PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu=
/dev
> =

> commit dbf3fab3be00426a8974fdcd6b9c87284327bcda
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Sat Apr 21 20:44:11 2018 -0700
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Mon Apr 23 15:13:42 2018 -0700
> =

>     EXP rcu: Diagnostics for grace-period hangs
>     =

>     This commit causes a splat if RCU is idle and a request for a new gra=
ce
>     period is ignored for more than one second.  This splat normally indi=
cates
>     that some code path asked for a new grace period, but failed to wake =
up
>     the RCU grace-period kthread.
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

Hmmm...  Looks like I added new improved debug code and forgot to
remove the old buggy debug code.  Fixing and will push.

That said, I would only expect false-positive splats from the old
code, not recursive lock acquisitions.

							Thanx, Paul

> 248d0f34b4  Merge branches 'exp.2018.04.20a', 'fixes.2018.04.23b', 'lock.=
2018.04.22a' and 'torture.2018.04.20a' into HEAD
> dbf3fab3be  EXP rcu: Diagnostics for grace-period hangs
> f99435124e  srcu: Fix typos in __call_srcu() header comment
> +-----------------------------------------------------+------------+-----=
-------+------------+
> |                                                     | 248d0f34b4 | dbf3=
fab3be | f99435124e |
> +-----------------------------------------------------+------------+-----=
-------+------------+
> | boot_successes                                      | 71         | 25  =
       | 28         |
> | boot_failures                                       | 0          | 2   =
       | 3          |
> | BUG:spinlock_recursion_on_CPU                       | 0          | 2   =
       | 3          |
> | WARNING:at_kernel/rcu/tree.c:#rcu_process_callbacks | 0          | 2   =
       | 3          |
> | EIP:rcu_process_callbacks                           | 0          | 2   =
       | 3          |
> +-----------------------------------------------------+------------+-----=
-------+------------+
> =

> procd: - watchdog -
> procd: - ubus -
> procd: - init -
> Please press Enter to activate this console.
> [    8.962055] sched: RT throttling activated
> [    8.963771] BUG: spinlock recursion on CPU#0, rcu_torture_wri/37
> [    8.964465]  lock: rcu_preempt_state+0x0/0x400, .magic: dead4ead, .own=
er: rcu_torture_wri/37, .owner_cpu: 0
> [    8.965503] CPU: 0 PID: 37 Comm: rcu_torture_wri Not tainted 4.17.0-rc=
1-00053-gdbf3fab #1
> [    8.966342] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    8.967187] Call Trace:
> [    8.967447]  <SOFTIRQ>
> [    8.967701]  ? show_stack+0x59/0x5f
> [    8.968068]  dump_stack+0x16/0x18
> [    8.968435]  spin_bug+0xaa/0xb5
> [    8.968795]  do_raw_spin_lock+0x98/0xf1
> [    8.969191]  _raw_spin_lock_irqsave+0x3f/0x48
> [    8.969615]  ? rcu_process_callbacks+0x39a/0x636
> [    8.970135]  rcu_process_callbacks+0x39a/0x636
> [    8.970604]  __do_softirq+0x14a/0x376
> [    8.970985]  ? __irqentry_text_end+0x1/0x1
> [    8.971534]  call_on_stack+0x45/0x4b
> [    8.971916]  </SOFTIRQ>
> [    8.972181]  ? irq_exit+0x97/0xb0
> [    8.972533]  ? do_IRQ+0xb4/0xc7
> [    8.972874]  ? common_interrupt+0x3d/0x44
> [    8.973291]  ? dequeue_rt_stack+0xd9/0x308
> [    8.973712]  ? delay_tsc+0x9f/0x102
> [    8.974078]  ? __delay+0xe/0x10
> [    8.974410]  ? __const_udelay+0x2a/0x2c
> [    8.974817]  ? __udelay+0x13/0x15
> [    8.975167]  ? rcu_torture_writer+0x4bf/0x861
> [    8.975655]  ? rcu_torture_pipe_update+0x92/0x92
> [    8.976152]  ? kthread+0x11b/0x120
> [    8.976520]  ? rcu_torture_pipe_update+0x92/0x92
> [    8.977024]  ? kthread_create_worker_on_cpu+0x1c/0x1c
> [    8.977555]  ? ret_from_fork+0x2e/0x38
> [    8.977957] rcu_check_gp_start_stall: g1712 0100 gar:1306 ga:1319 f0x1
> [    8.978631] WARNING: CPU: 0 PID: 37 at kernel/rcu/tree.c:2809 rcu_proc=
ess_callbacks+0x4bc/0x636
> [    8.979856] Modules linked in:
> [    8.980186] CPU: 0 PID: 37 Comm: rcu_torture_wri Not tainted 4.17.0-rc=
1-00053-gdbf3fab #1
> [    8.981022] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    8.981877] EIP: rcu_process_callbacks+0x4bc/0x636
> [    8.982388] EFLAGS: 00010002 CPU: 0
> [    8.982768] EAX: 8e68aa48 EBX: 8e5f7ae0 ECX: 00000000 EDX: 00000001
> [    8.983433] ESI: 00000046 EDI: 8e5f7ee0 EBP: 8d5effc0 ESP: 8d5eff9c
> [    8.984100]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    8.984676] CR0: 80050033 CR2: 08969000 CR3: 0bb8e000 CR4: 00140690
> [    8.985347] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    8.985994] DR6: fffe0ff0 DR7: 00000400
> [    8.986385] Call Trace:
> [    8.986653]  <SOFTIRQ>
> [    8.986919]  __do_softirq+0x14a/0x376
> [    8.987483]  ? __irqentry_text_end+0x1/0x1
> [    8.987939]  call_on_stack+0x45/0x4b
> [    8.988331]  </SOFTIRQ>
> [    8.988606]  ? irq_exit+0x97/0xb0
> [    8.988975]  ? do_IRQ+0xb4/0xc7
> [    8.989320]  ? common_interrupt+0x3d/0x44
> [    8.989747]  ? dequeue_rt_stack+0xd9/0x308
> [    8.990170]  ? delay_tsc+0x9f/0x102
> [    8.990554]  ? __delay+0xe/0x10
> [    8.990906]  ? __const_udelay+0x2a/0x2c
> [    8.991325]  ? __udelay+0x13/0x15
> [    8.991697]  ? rcu_torture_writer+0x4bf/0x861
> [    8.992157]  ? rcu_torture_pipe_update+0x92/0x92
> [    8.992624]  ? kthread+0x11b/0x120
> [    8.992973]  ? rcu_torture_pipe_update+0x92/0x92
> [    8.993462]  ? kthread_create_worker_on_cpu+0x1c/0x1c
> [    8.994025]  ? ret_from_fork+0x2e/0x38
> [    8.994444] Code: 68 f0 43 15 8e 68 ee ca 4f 8e e8 2a bf fe ff 83 c4 2=
8 31 c9 ba 01 00 00 00 6a 01 b8 48 aa 68 8e e8 4a 1f 05 00 ff 05 3c c3 70 8=
e <0f> 0b 6a 01 31 c9 ba 01 00 00 00 b8 30 aa 68 8e e8 2f 1f 05 00 =

> [    8.996551] ---[ end trace 0793264a36c6d984 ]---
> =

> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start f69be56214a6c5c673ff7a41401ee68942782080 6d08b06e67cd117=
f6992c46611dfb4ce267cd71e --
> git bisect  bad 136a8696ddb5c6eb010ddd1768153ab2cd395149  # 09:02  B     =
 0     1   15   0  Merge 'mtd-next/master' into devel-spot-201804251439
> git bisect  bad 0d9392cebc95f50c5d91cf760dc02f2951fe2c79  # 09:22  B     =
 0     1   15   0  Merge 'drm-tip/drm-tip' into devel-spot-201804251439
> git bisect  bad b7c141fcd7887dddff42ab82c5bb7374a1567ee8  # 09:47  B     =
 0     1   15   0  Merge 'linux-review/Luc-Van-Oostenryck/net-hip04-fix-hip=
04_mac_start_xmit-s-return-type/20180425-110549' into devel-spot-2018042514=
39
> git bisect good 062f66528a891ea8a66fd462067db64783d7ed7d  # 10:30  G     =
23     0    0   0  Merge 'ragnatech/renesas/next' into devel-spot-201804251=
439
> git bisect  bad 8085c3d7707470fa44f30f01e4e7447783de9f39  # 11:00  B     =
 0     1   15   0  Merge 'rcu/rcu/dev' into devel-spot-201804251439
> git bisect good ef47f8fd67dad7871aa5c2979cfc9b66a2a5d6ca  # 11:39  G     =
23     0    0   0  Merge 'linux-review/Luc-Van-Oostenryck/drm-bridge-tc3587=
67-fix-mode_valid-s-return-type/20180425-132300' into devel-spot-2018042514=
39
> git bisect good 0cd41702fe20899eb78b01b2465b6fbaebda3ee0  # 12:28  G     =
23     0    0   0  Merge 'linux-review/Luc-Van-Oostenryck/cpufreq-fix-speed=
step_detect_processor-s-return-type/20180425-131056' into devel-spot-201804=
251439
> git bisect good ededed6dc29990b12cdb9afe14550462b25e0f25  # 13:19  G     =
22     0    0   0  Merge 'ipsec-next/testing' into devel-spot-201804251439
> git bisect good 43814c5e2872d6e8143d786aa227b99c21e5de57  # 14:09  G     =
22     0    0   0  rcu: Update list of rcu_future_grace_period() trace even=
ts
> git bisect good e3edb22ec0a752028be53334d95678f41b6fd331  # 15:03  G     =
23     0    0   0  EXP: rcu: Add debugging info to other assertion
> git bisect good 8cb3fdd44ba0b86867e598f91cf3f2644b5aca7b  # 15:48  G     =
23     0    0   0  torture: Make kvm-find-errors.sh find build warnings
> git bisect good 248d0f34b437b3dfb306583c3c0421cbcb63c765  # 16:39  G     =
23     0    0   0  Merge branches 'exp.2018.04.20a', 'fixes.2018.04.23b', '=
lock.2018.04.22a' and 'torture.2018.04.20a' into HEAD
> git bisect  bad 78a977fe6c64129c8441420250e661a5532f3067  # 17:15  B     =
 0     1   15   0  rcu: Make rcu_gp_cleanup() write only once to ->gp_flags
> git bisect  bad dbf3fab3be00426a8974fdcd6b9c87284327bcda  # 18:16  B     =
 0     1   15   0  EXP rcu: Diagnostics for grace-period hangs
> # first bad commit: [dbf3fab3be00426a8974fdcd6b9c87284327bcda] EXP rcu: D=
iagnostics for grace-period hangs
> git bisect good 248d0f34b437b3dfb306583c3c0421cbcb63c765  # 18:22  G     =
67     0    0   0  Merge branches 'exp.2018.04.20a', 'fixes.2018.04.23b', '=
lock.2018.04.22a' and 'torture.2018.04.20a' into HEAD
> # extra tests with debug options
> git bisect  bad dbf3fab3be00426a8974fdcd6b9c87284327bcda  # 18:52  B     =
 0     3   17   0  EXP rcu: Diagnostics for grace-period hangs
> # extra tests on HEAD of linux-devel/devel-spot-201804251439
> git bisect  bad f69be56214a6c5c673ff7a41401ee68942782080  # 18:53  B     =
 9    11    0   0  0day head guard for 'devel-spot-201804251439'
> # extra tests on tree/branch rcu/rcu/dev
> git bisect  bad f99435124e4a8806a7947cfbda821fff024894fb  # 19:35  B     =
 0     1   15   0  srcu: Fix typos in __call_srcu() header comment
> # extra tests with first bad commit reverted
> git bisect good 90661528d61c6fd83ddf293de2b9bbf9285a887f  # 21:33  G     =
23     0    0   0  Revert "EXP rcu: Diagnostics for grace-period hangs"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion


> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dopenwrt-trinity-i386.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/openwrt/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep
> 	-kernel $kernel
> 	-initrd $initrd
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
> # Linux/i386 4.17.0-rc1 Kernel Configuration
> #
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
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D2
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
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
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
> CONFIG_BSD_PROCESS_ACCT=3Dy
> # CONFIG_BSD_PROCESS_ACCT_V3 is not set
> # CONFIG_TASKSTATS is not set
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
> CONFIG_RCU_BOOST=3Dy
> CONFIG_RCU_BOOST_DELAY=3D500
> CONFIG_RCU_NOCB_CPU=3Dy
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=3Dy
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> # CONFIG_USER_NS is not set
> CONFIG_PID_NS=3Dy
> CONFIG_NET_NS=3Dy
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_UID16=3Dy
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
> # CONFIG_MEMBARRIER is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_SYSCALL is not set
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_OPROFILE=3Dy
> # CONFIG_OPROFILE_EVENT_MULTIPLEX is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
> CONFIG_OPTPROBES=3Dy
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
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
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # CONFIG_GCC_PLUGINS is not set
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_CC_STACKPROTECTOR_AUTO=3Dy
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
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
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
> CONFIG_GCOV_FORMAT_AUTODETECT=3Dy
> # CONFIG_GCOV_FORMAT_3_4 is not set
> # CONFIG_GCOV_FORMAT_4_7 is not set
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_GOLDFISH=3Dy
> CONFIG_RETPOLINE=3Dy
> CONFIG_INTEL_RDT=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> # CONFIG_IOSF_MBI is not set
> CONFIG_X86_RDC321X=3Dy
> CONFIG_X86_32_IRIS=3Dy
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
> # CONFIG_M586MMX is not set
> CONFIG_M686=3Dy
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
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D6
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> # CONFIG_CPU_SUP_TRANSMETA_32 is not set
> # CONFIG_CPU_SUP_UMC_32 is not set
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> CONFIG_NR_CPUS_RANGE_END=3D1
> CONFIG_NR_CPUS_DEFAULT=3D1
> CONFIG_NR_CPUS=3D1
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_X86_UP_APIC is not set
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> # CONFIG_X86_LEGACY_VM86 is not set
> CONFIG_TOSHIBA=3Dy
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
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=3Dy
> CONFIG_FLAT_NODE_MEM_MAP=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_BALLOON_COMPACTION is not set
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> CONFIG_NEED_PER_CPU_KM=3Dy
> # CONFIG_CLEANCACHE is not set
> # CONFIG_CMA is not set
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> CONFIG_ZSMALLOC=3Dm
> CONFIG_PGTABLE_MAPPING=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> # CONFIG_PERCPU_STATS is not set
> CONFIG_GUP_BENCHMARK=3Dy
> CONFIG_HIGHPTE=3Dy
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> # CONFIG_X86_SMAP is not set
> # CONFIG_X86_INTEL_UMIP is not set
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> # CONFIG_KEXEC is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_DPM_WATCHDOG=3Dy
> CONFIG_DPM_WATCHDOG_TIMEOUT=3D120
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
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
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> # CONFIG_ACPI_CONTAINER is not set
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
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> # CONFIG_CPU_FREQ_GOV_USERSPACE is not set
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> # CONFIG_X86_POWERNOW_K6 is not set
> # CONFIG_X86_POWERNOW_K7 is not set
> # CONFIG_X86_GX_SUSPMOD is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> CONFIG_X86_SPEEDSTEP_ICH=3Dm
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> # CONFIG_X86_P4_CLOCKMOD is not set
> CONFIG_X86_CPUFREQ_NFORCE2=3Dy
> CONFIG_X86_LONGRUN=3Dm
> # CONFIG_X86_LONGHAUL is not set
> # CONFIG_X86_E_POWERSAVER is not set
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dm
> # CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is not set
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> # CONFIG_CPU_IDLE_GOV_MENU is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> # CONFIG_PCI_GOBIOS is not set
> # CONFIG_PCI_GOMMCONFIG is not set
> # CONFIG_PCI_GODIRECT is not set
> CONFIG_PCI_GOANY=3Dy
> CONFIG_PCI_BIOS=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_PCIEPORTBUS is not set
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
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=3Dy
> # CONFIG_ISA is not set
> CONFIG_SCx200=3Dm
> CONFIG_SCx200HR_TIMER=3Dm
> # CONFIG_OLPC is not set
> CONFIG_ALIX=3Dy
> CONFIG_NET5501=3Dy
> CONFIG_GEOS=3Dy
> CONFIG_AMD_NB=3Dy
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_HAVE_AOUT=3Dy
> CONFIG_BINFMT_AOUT=3Dm
> CONFIG_BINFMT_MISC=3Dm
> # CONFIG_COREDUMP is not set
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
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
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
> CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> CONFIG_INET6_XFRM_MODE_BEET=3Dy
> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> # CONFIG_IPV6_TUNNEL is not set
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
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
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
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_WANT_DEV_COREDUMP=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> CONFIG_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
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
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dm
> =

> #
> # Partition parsers
> #
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_OOPS=3Dy
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
> CONFIG_MTD_CFI_BE_BYTE_SWAP=3Dy
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> # CONFIG_MTD_CFI_GEOMETRY is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_OTP is not set
> CONFIG_MTD_CFI_INTELEXT=3Dy
> # CONFIG_MTD_CFI_AMDSTD is not set
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dm
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dm
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> CONFIG_MTD_SCx200_DOCFLASH=3Dm
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dm
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
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> CONFIG_MTD_ONENAND=3Dy
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> CONFIG_MTD_ONENAND_OTP=3Dy
> CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> CONFIG_MTD_NAND_ECC=3Dm
> CONFIG_MTD_NAND_ECC_SMC=3Dy
> CONFIG_MTD_NAND=3Dm
> # CONFIG_MTD_NAND_ECC_BCH is not set
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> CONFIG_MTD_NAND_GPIO=3Dm
> # CONFIG_MTD_NAND_RICOH is not set
> CONFIG_MTD_NAND_DISKONCHIP=3Dm
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> CONFIG_MTD_NAND_DOCG4=3Dm
> # CONFIG_MTD_NAND_CAFE is not set
> CONFIG_MTD_NAND_CS553X=3Dm
> CONFIG_MTD_NAND_NANDSIM=3Dm
> # CONFIG_MTD_NAND_PLATFORM is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # CONFIG_MTD_SPI_NOR is not set
> CONFIG_MTD_UBI=3Dm
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> CONFIG_MTD_UBI_FASTMAP=3Dy
> CONFIG_MTD_UBI_GLUEBI=3Dm
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> # CONFIG_PARPORT is not set
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
> CONFIG_AD525X_DPOT=3Dm
> CONFIG_AD525X_DPOT_I2C=3Dm
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dm
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> # CONFIG_ISL29003 is not set
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> # CONFIG_SENSORS_APDS990X is not set
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dy
> # CONFIG_PCH_PHUB is not set
> # CONFIG_USB_SWITCH_FSA9480 is not set
> CONFIG_SRAM=3Dy
> # CONFIG_PCI_ENDPOINT_TEST is not set
> CONFIG_MISC_RTSX=3Dm
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> CONFIG_EEPROM_LEGACY=3Dm
> # CONFIG_EEPROM_MAX6875 is not set
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_EEPROM_IDT_89HPESX is not set
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # CONFIG_SENSORS_LIS3_I2C is not set
> # CONFIG_ALTERA_STAPL is not set
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
> # CONFIG_MISC_RTSX_PCI is not set
> CONFIG_MISC_RTSX_USB=3Dm
> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
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
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
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
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
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
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> CONFIG_NET_VENDOR_NI=3Dy
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
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
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
> # CONFIG_NETDEVSIM is not set
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_POLLDEV is not set
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
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
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
> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> CONFIG_SERIO_ALTERA_PS2=3Dm
> CONFIG_SERIO_PS2MULT=3Dm
> CONFIG_SERIO_ARC_PS2=3Dm
> # CONFIG_SERIO_GPIO_PS2 is not set
> CONFIG_USERIO=3Dm
> CONFIG_GAMEPORT=3Dm
> CONFIG_GAMEPORT_NS558=3Dm
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
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> # CONFIG_GOLDFISH_TTY is not set
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVKMEM is not set
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
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_8250_MOXA is not set
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
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> CONFIG_SERIAL_DEV_BUS=3Dy
> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PROC_INTERFACE=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SSIF=3Dm
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dy
> CONFIG_HW_RANDOM=3Dm
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> CONFIG_HW_RANDOM_INTEL=3Dm
> CONFIG_HW_RANDOM_AMD=3Dm
> CONFIG_HW_RANDOM_GEODE=3Dm
> # CONFIG_HW_RANDOM_VIA is not set
> CONFIG_HW_RANDOM_VIRTIO=3Dm
> CONFIG_NVRAM=3Dy
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> # CONFIG_MWAVE is not set
> # CONFIG_SCx200_GPIO is not set
> CONFIG_PC8736x_GPIO=3Dm
> CONFIG_NSC_GPIO=3Dm
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dm
> CONFIG_TCG_TIS=3Dm
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_VTPM_PROXY=3Dm
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> CONFIG_TELCLOCK=3Dy
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
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_LTC4306=3Dm
> CONFIG_I2C_MUX_PCA9541=3Dm
> CONFIG_I2C_MUX_PCA954x=3Dm
> CONFIG_I2C_MUX_REG=3Dm
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dm
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCF=3Dy
> CONFIG_I2C_ALGOPCA=3Dm
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
> CONFIG_I2C_CBUS_GPIO=3Dm
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EG20T is not set
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_GPIO=3Dm
> CONFIG_I2C_GPIO_FAULT_INJECTOR=3Dy
> CONFIG_I2C_KEMPLD=3Dm
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dm
> CONFIG_I2C_SIMTEC=3Dy
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dm
> CONFIG_I2C_PARPORT_LIGHT=3Dm
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dm
> # CONFIG_I2C_TAOS_EVM is not set
> CONFIG_I2C_TINY_USB=3Dy
> CONFIG_I2C_VIPERBOARD=3Dm
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_SCx200_ACB is not set
> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> CONFIG_HSI=3Dm
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=3Dm
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> CONFIG_NTP_PPS=3Dy
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dm
> # CONFIG_PPS_CLIENT_LDISC is not set
> # CONFIG_PPS_CLIENT_GPIO is not set
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
> # CONFIG_PINCTRL is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_LYNXPOINT is not set
> CONFIG_GPIO_MB86S7X=3Dm
> # CONFIG_GPIO_MOCKUP is not set
> # CONFIG_GPIO_VX855 is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_IT87=3Dm
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_WINBOND is not set
> CONFIG_GPIO_WS16C48=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> CONFIG_GPIO_ADP5588_IRQ=3Dy
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> # CONFIG_GPIO_PCF857X is not set
> CONFIG_GPIO_TPIC2810=3Dm
> =

> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_BD9571MWV=3Dm
> # CONFIG_GPIO_DA9055 is not set
> CONFIG_GPIO_KEMPLD=3Dm
> CONFIG_GPIO_LP3943=3Dm
> # CONFIG_GPIO_LP873X is not set
> # CONFIG_GPIO_PALMAS is not set
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS65912=3Dm
> # CONFIG_GPIO_TWL4030 is not set
> CONFIG_GPIO_WM831X=3Dm
> CONFIG_GPIO_WM8994=3Dm
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
> =

> #
> # USB GPIO expanders
> #
> CONFIG_GPIO_VIPERBOARD=3Dm
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=3Dm
> CONFIG_W1_MASTER_DS2482=3Dm
> # CONFIG_W1_MASTER_DS1WM is not set
> CONFIG_W1_MASTER_GPIO=3Dm
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2405=3Dy
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dm
> CONFIG_W1_SLAVE_DS2423=3Dm
> CONFIG_W1_SLAVE_DS2805=3Dy
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dm
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> CONFIG_W1_SLAVE_DS2438=3Dy
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> # CONFIG_W1_SLAVE_DS2781 is not set
> CONFIG_W1_SLAVE_DS28E04=3Dm
> # CONFIG_W1_SLAVE_DS28E17 is not set
> CONFIG_POWER_AVS=3Dy
> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_PDA_POWER is not set
> # CONFIG_WM831X_BACKUP is not set
> # CONFIG_WM831X_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_BATTERY_88PM860X is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> # CONFIG_MANAGER_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_BATTERY_DA9030 is not set
> # CONFIG_BATTERY_DA9150 is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_BATTERY_MAX1721X is not set
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_LTC3651 is not set
> # CONFIG_CHARGER_MAX14577 is not set
> # CONFIG_CHARGER_MAX77693 is not set
> # CONFIG_CHARGER_MAX8997 is not set
> # CONFIG_CHARGER_MAX8998 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_SMB347 is not set
> # CONFIG_CHARGER_TPS65090 is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_HWMON=3Dm
> CONFIG_HWMON_VID=3Dm
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dm
> CONFIG_SENSORS_ABITUGURU3=3Dm
> CONFIG_SENSORS_AD7414=3Dm
> # CONFIG_SENSORS_AD7418 is not set
> CONFIG_SENSORS_ADM1021=3Dm
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dm
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> # CONFIG_SENSORS_ADT7475 is not set
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dm
> CONFIG_SENSORS_ASPEED=3Dm
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> # CONFIG_SENSORS_DA9055 is not set
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_MC13783_ADC=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> CONFIG_SENSORS_G762=3Dm
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dm
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dm
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dm
> CONFIG_SENSORS_POWR1220=3Dm
> CONFIG_SENSORS_LINEAGE=3Dm
> CONFIG_SENSORS_LTC2945=3Dm
> CONFIG_SENSORS_LTC2990=3Dm
> # CONFIG_SENSORS_LTC4151 is not set
> CONFIG_SENSORS_LTC4215=3Dm
> CONFIG_SENSORS_LTC4222=3Dm
> CONFIG_SENSORS_LTC4245=3Dm
> CONFIG_SENSORS_LTC4260=3Dm
> CONFIG_SENSORS_LTC4261=3Dm
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> CONFIG_SENSORS_MAX6621=3Dm
> # CONFIG_SENSORS_MAX6639 is not set
> # CONFIG_SENSORS_MAX6642 is not set
> # CONFIG_SENSORS_MAX6650 is not set
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_MAX31790=3Dm
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_TC654 is not set
> CONFIG_SENSORS_LM63=3Dm
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dm
> CONFIG_SENSORS_LM85=3Dm
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> # CONFIG_SENSORS_LM93 is not set
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> CONFIG_SENSORS_NCT6683=3Dm
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT7802=3Dm
> # CONFIG_SENSORS_NCT7904 is not set
> # CONFIG_SENSORS_PCF8591 is not set
> CONFIG_PMBUS=3Dm
> CONFIG_SENSORS_PMBUS=3Dm
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_IBM_CFFPS=3Dm
> CONFIG_SENSORS_IR35221=3Dm
> CONFIG_SENSORS_LM25066=3Dm
> # CONFIG_SENSORS_LTC2978 is not set
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX16064=3Dm
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> CONFIG_SENSORS_MAX34440=3Dm
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_TPS40422=3Dm
> CONFIG_SENSORS_TPS53679=3Dm
> # CONFIG_SENSORS_UCD9000 is not set
> CONFIG_SENSORS_UCD9200=3Dm
> CONFIG_SENSORS_ZL6100=3Dm
> CONFIG_SENSORS_SHT15=3Dm
> CONFIG_SENSORS_SHT21=3Dm
> CONFIG_SENSORS_SHT3x=3Dm
> CONFIG_SENSORS_SHTC1=3Dm
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dm
> CONFIG_SENSORS_EMC1403=3Dm
> CONFIG_SENSORS_EMC2103=3Dm
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dm
> CONFIG_SENSORS_SMSC47M192=3Dm
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> # CONFIG_SENSORS_SCH5627 is not set
> CONFIG_SENSORS_SCH5636=3Dm
> CONFIG_SENSORS_STTS751=3Dm
> CONFIG_SENSORS_SMM665=3Dm
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS1015=3Dm
> CONFIG_SENSORS_ADS7828=3Dm
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dm
> # CONFIG_SENSORS_INA2XX is not set
> # CONFIG_SENSORS_INA3221 is not set
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=3Dm
> CONFIG_SENSORS_TMP102=3Dm
> CONFIG_SENSORS_TMP103=3Dm
> CONFIG_SENSORS_TMP108=3Dm
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dm
> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dm
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83773G is not set
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=3Dm
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dm
> CONFIG_SENSORS_WM831X=3Dm
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_STATISTICS=3Dy
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_INTEL_POWERCLAMP=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> CONFIG_WATCHDOG_SYSFS=3Dy
> =

> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> # CONFIG_DA9055_WATCHDOG is not set
> CONFIG_DA9063_WATCHDOG=3Dm
> # CONFIG_WDAT_WDT is not set
> CONFIG_WM831X_WATCHDOG=3Dm
> CONFIG_XILINX_WATCHDOG=3Dm
> CONFIG_ZIIRAVE_WATCHDOG=3Dm
> CONFIG_CADENCE_WATCHDOG=3Dy
> CONFIG_DW_WATCHDOG=3Dm
> # CONFIG_TWL4030_WATCHDOG is not set
> CONFIG_MAX63XX_WATCHDOG=3Dm
> # CONFIG_ACQUIRE_WDT is not set
> CONFIG_ADVANTECH_WDT=3Dm
> # CONFIG_ALIM1535_WDT is not set
> # CONFIG_ALIM7101_WDT is not set
> # CONFIG_EBC_C384_WDT is not set
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dm
> CONFIG_IBMASR=3Dm
> CONFIG_WAFER_WDT=3Dm
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_IE6XX_WDT is not set
> # CONFIG_ITCO_WDT is not set
> # CONFIG_IT8712F_WDT is not set
> CONFIG_IT87_WDT=3Dy
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_KEMPLD_WDT=3Dm
> CONFIG_SC1200_WDT=3Dy
> # CONFIG_SCx200_WDT is not set
> CONFIG_PC87413_WDT=3Dm
> # CONFIG_NV_TCO is not set
> # CONFIG_RDC321X_WDT is not set
> # CONFIG_60XX_WDT is not set
> CONFIG_SBC8360_WDT=3Dy
> # CONFIG_SBC7240_WDT is not set
> CONFIG_CPU5_WDT=3Dm
> CONFIG_SMSC_SCH311X_WDT=3Dy
> CONFIG_SMSC37B787_WDT=3Dm
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=3Dm
> # CONFIG_W83877F_WDT is not set
> CONFIG_W83977F_WDT=3Dm
> CONFIG_MACHZ_WDT=3Dm
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> # CONFIG_NI903X_WDT is not set
> # CONFIG_NIC7018_WDT is not set
> CONFIG_MEN_A21_WDT=3Dy
> =

> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> # CONFIG_WDTPCI is not set
> =

> #
> # USB-based Watchdog Cards
> #
> CONFIG_USBPCWATCHDOG=3Dm
> =

> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> CONFIG_SSB_POSSIBLE=3Dy
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
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
> # CONFIG_MFD_CS5535 is not set
> CONFIG_MFD_AS3711=3Dy
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dm
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_CROS_EC is not set
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dm
> CONFIG_MFD_DA9150=3Dm
> # CONFIG_MFD_DLN2 is not set
> CONFIG_MFD_MC13XXX=3Dm
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
> CONFIG_MFD_88PM800=3Dm
> # CONFIG_MFD_88PM805 is not set
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> CONFIG_MFD_MAX77693=3Dm
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dm
> # CONFIG_MFD_MAX8925 is not set
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_MT6397=3Dy
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_MFD_VIPERBOARD=3Dy
> # CONFIG_MFD_RETU is not set
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_UCB1400_CORE is not set
> # CONFIG_MFD_RDC321X is not set
> CONFIG_MFD_RT5033=3Dy
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SEC_CORE is not set
> CONFIG_MFD_SI476X_CORE=3Dm
> # CONFIG_MFD_SM501 is not set
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_SMSC is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dm
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_TI_LMU=3Dy
> CONFIG_MFD_PALMAS=3Dy
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dm
> CONFIG_MFD_TPS65086=3Dm
> CONFIG_MFD_TPS65090=3Dy
> # CONFIG_MFD_TPS68470 is not set
> CONFIG_MFD_TI_LP873X=3Dm
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dm
> CONFIG_MFD_TPS65912_I2C=3Dm
> # CONFIG_MFD_TPS80031 is not set
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_MFD_TWL4030_AUDIO is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> CONFIG_MFD_LM3533=3Dm
> # CONFIG_MFD_TIMBERDALE is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dm
> # CONFIG_MFD_CS47L24 is not set
> # CONFIG_MFD_WM5102 is not set
> CONFIG_MFD_WM5110=3Dy
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=3Dy
> CONFIG_MFD_WM8400=3Dy
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dm
> # CONFIG_RAVE_SP_CORE is not set
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=3Dy
> CONFIG_REGULATOR_88PM800=3Dm
> CONFIG_REGULATOR_88PM8607=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_ANATOP=3Dy
> # CONFIG_REGULATOR_ARIZONA_LDO1 is not set
> CONFIG_REGULATOR_ARIZONA_MICSUPP=3Dm
> # CONFIG_REGULATOR_AS3711 is not set
> # CONFIG_REGULATOR_BCM590XX is not set
> # CONFIG_REGULATOR_BD9571MWV is not set
> CONFIG_REGULATOR_DA903X=3Dy
> CONFIG_REGULATOR_DA9055=3Dm
> # CONFIG_REGULATOR_DA9063 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> # CONFIG_REGULATOR_FAN53555 is not set
> CONFIG_REGULATOR_GPIO=3Dm
> CONFIG_REGULATOR_ISL9305=3Dm
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LP3971=3Dm
> CONFIG_REGULATOR_LP3972=3Dm
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP8788=3Dm
> CONFIG_REGULATOR_LTC3589=3Dy
> CONFIG_REGULATOR_LTC3676=3Dy
> # CONFIG_REGULATOR_MAX14577 is not set
> CONFIG_REGULATOR_MAX1586=3Dy
> # CONFIG_REGULATOR_MAX8649 is not set
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8907=3Dm
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX8997=3Dy
> CONFIG_REGULATOR_MAX8998=3Dm
> CONFIG_REGULATOR_MAX77693=3Dm
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> CONFIG_REGULATOR_MC13783=3Dm
> CONFIG_REGULATOR_MC13892=3Dm
> CONFIG_REGULATOR_MT6311=3Dm
> # CONFIG_REGULATOR_MT6323 is not set
> # CONFIG_REGULATOR_MT6397 is not set
> # CONFIG_REGULATOR_PALMAS is not set
> CONFIG_REGULATOR_PFUZE100=3Dy
> # CONFIG_REGULATOR_PV88060 is not set
> CONFIG_REGULATOR_PV88080=3Dm
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_RT5033=3Dm
> CONFIG_REGULATOR_TPS51632=3Dm
> CONFIG_REGULATOR_TPS62360=3Dm
> CONFIG_REGULATOR_TPS65023=3Dy
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dm
> CONFIG_REGULATOR_TPS65090=3Dy
> # CONFIG_REGULATOR_TPS65132 is not set
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_TWL4030=3Dm
> CONFIG_REGULATOR_WM831X=3Dy
> # CONFIG_REGULATOR_WM8400 is not set
> # CONFIG_REGULATOR_WM8994 is not set
> # CONFIG_RC_CORE is not set
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
> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> # CONFIG_DRM_DEBUG_MM is not set
> CONFIG_DRM_DEBUG_MM_SELFTEST=3Dm
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
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
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_VGEM is not set
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_UDL is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> # CONFIG_DRM_HISI_HIBMC is not set
> # CONFIG_DRM_TINYDRM is not set
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> # CONFIG_FB is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dm
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> # CONFIG_BACKLIGHT_LM3533 is not set
> CONFIG_BACKLIGHT_DA903X=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dm
> # CONFIG_BACKLIGHT_WM831X is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dm
> CONFIG_BACKLIGHT_88PM860X=3Dm
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_PANDORA=3Dy
> CONFIG_BACKLIGHT_AS3711=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dm
> CONFIG_HDMI=3Dy
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> CONFIG_SND=3Dm
> CONFIG_SND_TIMER=3Dm
> CONFIG_SND_PCM=3Dm
> CONFIG_SND_DMAENGINE_PCM=3Dm
> CONFIG_SND_HWDEP=3Dm
> CONFIG_SND_SEQ_DEVICE=3Dm
> CONFIG_SND_RAWMIDI=3Dm
> CONFIG_SND_JACK=3Dy
> CONFIG_SND_JACK_INPUT_DEV=3Dy
> CONFIG_SND_OSSEMUL=3Dy
> # CONFIG_SND_MIXER_OSS is not set
> CONFIG_SND_PCM_OSS=3Dm
> CONFIG_SND_PCM_OSS_PLUGINS=3Dy
> # CONFIG_SND_PCM_TIMER is not set
> # CONFIG_SND_HRTIMER is not set
> # CONFIG_SND_DYNAMIC_MINORS is not set
> CONFIG_SND_SUPPORT_OLD_API=3Dy
> CONFIG_SND_PROC_FS=3Dy
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> # CONFIG_SND_VERBOSE_PRINTK is not set
> # CONFIG_SND_DEBUG is not set
> CONFIG_SND_VMASTER=3Dy
> CONFIG_SND_DMA_SGBUF=3Dy
> CONFIG_SND_SEQUENCER=3Dm
> CONFIG_SND_SEQ_DUMMY=3Dm
> CONFIG_SND_SEQUENCER_OSS=3Dm
> CONFIG_SND_SEQ_MIDI_EVENT=3Dm
> CONFIG_SND_SEQ_MIDI=3Dm
> CONFIG_SND_AC97_CODEC=3Dm
> # CONFIG_SND_DRIVERS is not set
> CONFIG_SND_PCI=3Dy
> # CONFIG_SND_AD1889 is not set
> # CONFIG_SND_ALS300 is not set
> # CONFIG_SND_ALS4000 is not set
> # CONFIG_SND_ALI5451 is not set
> # CONFIG_SND_ASIHPI is not set
> # CONFIG_SND_ATIIXP is not set
> # CONFIG_SND_ATIIXP_MODEM is not set
> # CONFIG_SND_AU8810 is not set
> # CONFIG_SND_AU8820 is not set
> # CONFIG_SND_AU8830 is not set
> # CONFIG_SND_AW2 is not set
> # CONFIG_SND_AZT3328 is not set
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
> # CONFIG_SND_EMU10K1 is not set
> # CONFIG_SND_EMU10K1X is not set
> # CONFIG_SND_ENS1370 is not set
> # CONFIG_SND_ENS1371 is not set
> # CONFIG_SND_ES1938 is not set
> # CONFIG_SND_ES1968 is not set
> # CONFIG_SND_FM801 is not set
> # CONFIG_SND_HDSP is not set
> # CONFIG_SND_HDSPM is not set
> # CONFIG_SND_ICE1712 is not set
> # CONFIG_SND_ICE1724 is not set
> # CONFIG_SND_INTEL8X0 is not set
> # CONFIG_SND_INTEL8X0M is not set
> # CONFIG_SND_KORG1212 is not set
> # CONFIG_SND_LOLA is not set
> # CONFIG_SND_LX6464ES is not set
> # CONFIG_SND_MAESTRO3 is not set
> # CONFIG_SND_MIXART is not set
> # CONFIG_SND_NM256 is not set
> # CONFIG_SND_PCXHR is not set
> # CONFIG_SND_RIPTIDE is not set
> # CONFIG_SND_RME32 is not set
> # CONFIG_SND_RME96 is not set
> # CONFIG_SND_RME9652 is not set
> # CONFIG_SND_SE6X is not set
> # CONFIG_SND_SIS7019 is not set
> # CONFIG_SND_SONICVIBES is not set
> # CONFIG_SND_TRIDENT is not set
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
> CONFIG_SND_USB=3Dy
> CONFIG_SND_USB_AUDIO=3Dm
> CONFIG_SND_USB_UA101=3Dm
> CONFIG_SND_USB_USX2Y=3Dm
> CONFIG_SND_USB_CAIAQ=3Dm
> # CONFIG_SND_USB_CAIAQ_INPUT is not set
> # CONFIG_SND_USB_US122L is not set
> CONFIG_SND_USB_6FIRE=3Dm
> CONFIG_SND_USB_HIFACE=3Dm
> CONFIG_SND_BCD2000=3Dm
> CONFIG_SND_USB_LINE6=3Dm
> CONFIG_SND_USB_POD=3Dm
> # CONFIG_SND_USB_PODHD is not set
> CONFIG_SND_USB_TONEPORT=3Dm
> CONFIG_SND_USB_VARIAX=3Dm
> CONFIG_SND_SOC=3Dm
> CONFIG_SND_SOC_AC97_BUS=3Dy
> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> CONFIG_SND_SOC_AMD_ACP=3Dm
> # CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH is not set
> CONFIG_SND_SOC_AMD_CZ_RT5645_MACH=3Dm
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
> CONFIG_SND_SOC_IMX_AUDMUX=3Dm
> CONFIG_SND_I2S_HI6210_I2S=3Dm
> CONFIG_SND_SOC_IMG=3Dy
> # CONFIG_SND_SOC_IMG_I2S_IN is not set
> # CONFIG_SND_SOC_IMG_I2S_OUT is not set
> CONFIG_SND_SOC_IMG_PARALLEL_OUT=3Dm
> CONFIG_SND_SOC_IMG_SPDIF_IN=3Dm
> # CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
> CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=3Dm
> CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=3Dy
> # CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI is not set
> # CONFIG_SND_SST_ATOM_HIFI2_PLATFORM is not set
> # CONFIG_SND_SOC_INTEL_SKYLAKE is not set
> CONFIG_SND_SOC_INTEL_MACH=3Dy
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
> CONFIG_SND_SOC_ADAU1701=3Dm
> # CONFIG_SND_SOC_ADAU1761_I2C is not set
> # CONFIG_SND_SOC_ADAU7002 is not set
> CONFIG_SND_SOC_AK4458=3Dm
> # CONFIG_SND_SOC_AK4554 is not set
> CONFIG_SND_SOC_AK4613=3Dm
> CONFIG_SND_SOC_AK4642=3Dm
> CONFIG_SND_SOC_AK5386=3Dm
> CONFIG_SND_SOC_AK5558=3Dm
> CONFIG_SND_SOC_ALC5623=3Dm
> # CONFIG_SND_SOC_BD28623 is not set
> CONFIG_SND_SOC_BT_SCO=3Dm
> CONFIG_SND_SOC_CS35L32=3Dm
> CONFIG_SND_SOC_CS35L33=3Dm
> CONFIG_SND_SOC_CS35L34=3Dm
> CONFIG_SND_SOC_CS35L35=3Dm
> CONFIG_SND_SOC_CS42L42=3Dm
> # CONFIG_SND_SOC_CS42L51_I2C is not set
> # CONFIG_SND_SOC_CS42L52 is not set
> # CONFIG_SND_SOC_CS42L56 is not set
> CONFIG_SND_SOC_CS42L73=3Dm
> # CONFIG_SND_SOC_CS4265 is not set
> # CONFIG_SND_SOC_CS4270 is not set
> CONFIG_SND_SOC_CS4271=3Dm
> CONFIG_SND_SOC_CS4271_I2C=3Dm
> # CONFIG_SND_SOC_CS42XX8_I2C is not set
> CONFIG_SND_SOC_CS43130=3Dm
> CONFIG_SND_SOC_CS4349=3Dm
> CONFIG_SND_SOC_CS53L30=3Dm
> # CONFIG_SND_SOC_DIO2125 is not set
> CONFIG_SND_SOC_ES7134=3Dm
> CONFIG_SND_SOC_ES8316=3Dm
> # CONFIG_SND_SOC_ES8328_I2C is not set
> CONFIG_SND_SOC_GTM601=3Dm
> CONFIG_SND_SOC_INNO_RK3036=3Dm
> # CONFIG_SND_SOC_MAX98504 is not set
> CONFIG_SND_SOC_MAX9867=3Dm
> CONFIG_SND_SOC_MAX98927=3Dm
> CONFIG_SND_SOC_MAX98373=3Dm
> # CONFIG_SND_SOC_MAX9860 is not set
> CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dm
> CONFIG_SND_SOC_PCM1681=3Dm
> CONFIG_SND_SOC_PCM1789=3Dm
> CONFIG_SND_SOC_PCM1789_I2C=3Dm
> # CONFIG_SND_SOC_PCM179X_I2C is not set
> # CONFIG_SND_SOC_PCM186X_I2C is not set
> # CONFIG_SND_SOC_PCM3168A_I2C is not set
> CONFIG_SND_SOC_PCM512x=3Dm
> CONFIG_SND_SOC_PCM512x_I2C=3Dm
> CONFIG_SND_SOC_RL6231=3Dm
> CONFIG_SND_SOC_RT5616=3Dm
> CONFIG_SND_SOC_RT5631=3Dm
> CONFIG_SND_SOC_RT5645=3Dm
> CONFIG_SND_SOC_SGTL5000=3Dm
> CONFIG_SND_SOC_SIGMADSP=3Dm
> CONFIG_SND_SOC_SIGMADSP_I2C=3Dm
> CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dm
> # CONFIG_SND_SOC_SPDIF is not set
> # CONFIG_SND_SOC_SSM2602_I2C is not set
> CONFIG_SND_SOC_SSM4567=3Dm
> CONFIG_SND_SOC_STA32X=3Dm
> CONFIG_SND_SOC_STA350=3Dm
> CONFIG_SND_SOC_STI_SAS=3Dm
> # CONFIG_SND_SOC_TAS2552 is not set
> CONFIG_SND_SOC_TAS5086=3Dm
> # CONFIG_SND_SOC_TAS571X is not set
> CONFIG_SND_SOC_TAS5720=3Dm
> CONFIG_SND_SOC_TAS6424=3Dm
> # CONFIG_SND_SOC_TDA7419 is not set
> CONFIG_SND_SOC_TFA9879=3Dm
> # CONFIG_SND_SOC_TLV320AIC23_I2C is not set
> CONFIG_SND_SOC_TLV320AIC31XX=3Dm
> # CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
> # CONFIG_SND_SOC_TLV320AIC3X is not set
> # CONFIG_SND_SOC_TS3A227E is not set
> CONFIG_SND_SOC_TSCS42XX=3Dm
> CONFIG_SND_SOC_WM8510=3Dm
> CONFIG_SND_SOC_WM8523=3Dm
> CONFIG_SND_SOC_WM8524=3Dm
> CONFIG_SND_SOC_WM8580=3Dm
> CONFIG_SND_SOC_WM8711=3Dm
> # CONFIG_SND_SOC_WM8728 is not set
> CONFIG_SND_SOC_WM8731=3Dm
> CONFIG_SND_SOC_WM8737=3Dm
> # CONFIG_SND_SOC_WM8741 is not set
> # CONFIG_SND_SOC_WM8750 is not set
> # CONFIG_SND_SOC_WM8753 is not set
> CONFIG_SND_SOC_WM8776=3Dm
> CONFIG_SND_SOC_WM8804=3Dm
> CONFIG_SND_SOC_WM8804_I2C=3Dm
> CONFIG_SND_SOC_WM8903=3Dm
> # CONFIG_SND_SOC_WM8960 is not set
> # CONFIG_SND_SOC_WM8962 is not set
> CONFIG_SND_SOC_WM8974=3Dm
> CONFIG_SND_SOC_WM8978=3Dm
> CONFIG_SND_SOC_WM8985=3Dm
> CONFIG_SND_SOC_ZX_AUD96P22=3Dm
> CONFIG_SND_SOC_MAX9759=3Dm
> CONFIG_SND_SOC_NAU8540=3Dm
> # CONFIG_SND_SOC_NAU8810 is not set
> CONFIG_SND_SOC_NAU8824=3Dm
> CONFIG_SND_SOC_TPA6130A2=3Dm
> # CONFIG_SND_SIMPLE_CARD is not set
> CONFIG_SND_X86=3Dy
> CONFIG_AC97_BUS=3Dm
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
> # CONFIG_HID_ACCUTOUCH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_APPLEIR is not set
> # CONFIG_HID_ASUS is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_CORSAIR is not set
> # CONFIG_HID_PRODIKEYS is not set
> # CONFIG_HID_CMEDIA is not set
> # CONFIG_HID_CYPRESS is not set
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELAN is not set
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_ELO is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> # CONFIG_HID_GFRM is not set
> # CONFIG_HID_HOLTEK is not set
> # CONFIG_HID_GOOGLE_HAMMER is not set
> # CONFIG_HID_GT683R is not set
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> # CONFIG_HID_UCLOGIC is not set
> # CONFIG_HID_WALTOP is not set
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
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> # CONFIG_HID_MULTITOUCH is not set
> # CONFIG_HID_NTI is not set
> # CONFIG_HID_NTRIG is not set
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PENMOUNT is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_RETRODE is not set
> # CONFIG_HID_ROCCAT is not set
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> # CONFIG_HID_SONY is not set
> # CONFIG_HID_SPEEDLINK is not set
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
> # CONFIG_HID_WACOM is not set
> # CONFIG_HID_WIIMOTE is not set
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_PCI=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> CONFIG_USB_DYNAMIC_MINORS=3Dy
> # CONFIG_USB_OTG is not set
> CONFIG_USB_OTG_WHITELIST=3Dy
> # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> CONFIG_USB_MON=3Dy
> CONFIG_USB_WUSB=3Dm
> # CONFIG_USB_WUSB_CBAF is not set
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> # CONFIG_USB_XHCI_HCD is not set
> # CONFIG_USB_EHCI_HCD is not set
> CONFIG_USB_OXU210HP_HCD=3Dy
> CONFIG_USB_ISP116X_HCD=3Dy
> # CONFIG_USB_FOTG210_HCD is not set
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> CONFIG_USB_OHCI_HCD_SSB=3Dy
> CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> # CONFIG_USB_UHCI_HCD is not set
> CONFIG_USB_SL811_HCD=3Dm
> CONFIG_USB_SL811_HCD_ISO=3Dy
> CONFIG_USB_R8A66597_HCD=3Dm
> # CONFIG_USB_WHCI_HCD is not set
> CONFIG_USB_HWA_HCD=3Dm
> CONFIG_USB_HCD_SSB=3Dy
> # CONFIG_USB_HCD_TEST_MODE is not set
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
> # CONFIG_USB_MDC800 is not set
> # CONFIG_USBIP_CORE is not set
> CONFIG_USB_MUSB_HDRC=3Dy
> CONFIG_USB_MUSB_HOST=3Dy
> =

> #
> # Platform Glue Layer
> #
> =

> #
> # MUSB DMA mode
> #
> # CONFIG_MUSB_PIO_ONLY is not set
> CONFIG_USB_DWC3=3Dy
> CONFIG_USB_DWC3_ULPI=3Dy
> CONFIG_USB_DWC3_HOST=3Dy
> =

> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_PCI=3Dy
> CONFIG_USB_DWC2=3Dy
> CONFIG_USB_DWC2_HOST=3Dy
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> # CONFIG_USB_DWC2_PCI is not set
> # CONFIG_USB_DWC2_DEBUG is not set
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> # CONFIG_USB_CHIPIDEA is not set
> CONFIG_USB_ISP1760=3Dy
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1760_HOST_ROLE=3Dy
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_SERIAL is not set
> =

> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> CONFIG_USB_EMI26=3Dy
> # CONFIG_USB_ADUTUX is not set
> CONFIG_USB_SEVSEG=3Dm
> CONFIG_USB_RIO500=3Dm
> CONFIG_USB_LEGOTOWER=3Dm
> CONFIG_USB_LCD=3Dm
> CONFIG_USB_CYPRESS_CY7C63=3Dy
> # CONFIG_USB_CYTHERM is not set
> # CONFIG_USB_IDMOUSE is not set
> # CONFIG_USB_FTDI_ELAN is not set
> CONFIG_USB_APPLEDISPLAY=3Dy
> CONFIG_USB_SISUSBVGA=3Dy
> CONFIG_USB_LD=3Dm
> # CONFIG_USB_TRANCEVIBRATOR is not set
> CONFIG_USB_IOWARRIOR=3Dy
> # CONFIG_USB_TEST is not set
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dm
> CONFIG_USB_ISIGHTFW=3Dm
> CONFIG_USB_YUREX=3Dy
> CONFIG_USB_EZUSB_FX2=3Dm
> # CONFIG_USB_HUB_USB251XB is not set
> CONFIG_USB_HSIC_USB3503=3Dy
> CONFIG_USB_HSIC_USB4604=3Dy
> CONFIG_USB_LINK_LAYER_TEST=3Dy
> CONFIG_USB_CHAOSKEY=3Dm
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_ISP1301 is not set
> CONFIG_USB_GADGET=3Dm
> # CONFIG_USB_GADGET_DEBUG is not set
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> CONFIG_USB_GADGET_DEBUG_FS=3Dy
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> =

> #
> # USB Peripheral Controller
> #
> CONFIG_USB_FUSB300=3Dm
> CONFIG_USB_FOTG210_UDC=3Dm
> CONFIG_USB_GR_UDC=3Dm
> CONFIG_USB_R8A66597=3Dm
> # CONFIG_USB_PXA27X is not set
> CONFIG_USB_MV_UDC=3Dm
> CONFIG_USB_MV_U3D=3Dm
> CONFIG_USB_M66592=3Dm
> CONFIG_USB_BDC_UDC=3Dm
> =

> #
> # Platform Support
> #
> CONFIG_USB_BDC_PCI=3Dm
> # CONFIG_USB_AMD5536UDC is not set
> CONFIG_USB_NET2272=3Dm
> CONFIG_USB_NET2272_DMA=3Dy
> # CONFIG_USB_NET2280 is not set
> # CONFIG_USB_GOKU is not set
> # CONFIG_USB_EG20T is not set
> # CONFIG_USB_DUMMY_HCD is not set
> # CONFIG_USB_CONFIGFS is not set
> CONFIG_TYPEC=3Dm
> CONFIG_TYPEC_TCPM=3Dm
> # CONFIG_TYPEC_FUSB302 is not set
> CONFIG_TYPEC_UCSI=3Dm
> # CONFIG_UCSI_ACPI is not set
> CONFIG_TYPEC_TPS6598X=3Dm
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # CONFIG_USB_ROLES_INTEL_XHCI is not set
> CONFIG_USB_ULPI_BUS=3Dy
> CONFIG_USB_ROLE_SWITCH=3Dm
> CONFIG_UWB=3Dm
> CONFIG_UWB_HWA=3Dm
> # CONFIG_UWB_WHCI is not set
> CONFIG_UWB_I1480U=3Dm
> # CONFIG_MMC is not set
> CONFIG_MEMSTICK=3Dm
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_MEMSTICK_REALTEK_USB=3Dm
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dm
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> # CONFIG_LEDS_APU is not set
> CONFIG_LEDS_AS3645A=3Dm
> CONFIG_LEDS_LM3530=3Dm
> CONFIG_LEDS_LM3533=3Dm
> CONFIG_LEDS_LM3642=3Dm
> CONFIG_LEDS_MT6323=3Dm
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dy
> # CONFIG_LEDS_LP3944 is not set
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dm
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dm
> CONFIG_LEDS_LP8788=3Dm
> CONFIG_LEDS_CLEVO_MAIL=3Dm
> CONFIG_LEDS_PCA955X=3Dm
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=3Dm
> CONFIG_LEDS_WM831X_STATUS=3Dy
> # CONFIG_LEDS_DA903X is not set
> # CONFIG_LEDS_REGULATOR is not set
> CONFIG_LEDS_BD2802=3Dm
> # CONFIG_LEDS_INTEL_SS4200 is not set
> # CONFIG_LEDS_LT3593 is not set
> # CONFIG_LEDS_MC13783 is not set
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=3Dm
> CONFIG_LEDS_MAX8997=3Dy
> CONFIG_LEDS_LM355x=3Dy
> CONFIG_LEDS_OT200=3Dm
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> CONFIG_LEDS_MLXCPLD=3Dy
> CONFIG_LEDS_MLXREG=3Dy
> # CONFIG_LEDS_USER is not set
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
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> CONFIG_RTC_SYSTOHC=3Dy
> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> CONFIG_RTC_DEBUG=3Dy
> # CONFIG_RTC_NVMEM is not set
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
> CONFIG_RTC_DRV_TEST=3Dy
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM860X=3Dm
> CONFIG_RTC_DRV_88PM80X=3Dm
> CONFIG_RTC_DRV_ABB5ZES3=3Dm
> CONFIG_RTC_DRV_ABX80X=3Dy
> # CONFIG_RTC_DRV_DS1307 is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dy
> # CONFIG_RTC_DRV_LP8788 is not set
> CONFIG_RTC_DRV_MAX6900=3Dm
> CONFIG_RTC_DRV_MAX8907=3Dm
> CONFIG_RTC_DRV_MAX8998=3Dm
> # CONFIG_RTC_DRV_MAX8997 is not set
> # CONFIG_RTC_DRV_RS5C372 is not set
> # CONFIG_RTC_DRV_ISL1208 is not set
> CONFIG_RTC_DRV_ISL12022=3Dy
> CONFIG_RTC_DRV_X1205=3Dm
> CONFIG_RTC_DRV_PCF8523=3Dm
> CONFIG_RTC_DRV_PCF85063=3Dm
> CONFIG_RTC_DRV_PCF85363=3Dy
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dm
> # CONFIG_RTC_DRV_M41T80 is not set
> CONFIG_RTC_DRV_BQ32K=3Dm
> CONFIG_RTC_DRV_PALMAS=3Dm
> CONFIG_RTC_DRV_S35390A=3Dm
> CONFIG_RTC_DRV_FM3130=3Dy
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dy
> # CONFIG_RTC_DRV_RX8025 is not set
> CONFIG_RTC_DRV_EM3027=3Dy
> # CONFIG_RTC_DRV_RV8803 is not set
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> # CONFIG_RTC_DRV_DS3232 is not set
> # CONFIG_RTC_DRV_PCF2127 is not set
> # CONFIG_RTC_DRV_RV3029C2 is not set
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> # CONFIG_RTC_DRV_DS1286 is not set
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dy
> CONFIG_RTC_DRV_DS1685_FAMILY=3Dm
> # CONFIG_RTC_DRV_DS1685 is not set
> # CONFIG_RTC_DRV_DS1689 is not set
> # CONFIG_RTC_DRV_DS17285 is not set
> # CONFIG_RTC_DRV_DS17485 is not set
> CONFIG_RTC_DRV_DS17885=3Dy
> # CONFIG_RTC_DS1685_PROC_REGS is not set
> CONFIG_RTC_DS1685_SYSFS_REGS=3Dy
> CONFIG_RTC_DRV_DS1742=3Dy
> # CONFIG_RTC_DRV_DS2404 is not set
> CONFIG_RTC_DRV_DA9055=3Dm
> # CONFIG_RTC_DRV_DA9063 is not set
> CONFIG_RTC_DRV_STK17TA8=3Dy
> CONFIG_RTC_DRV_M48T86=3Dy
> # CONFIG_RTC_DRV_M48T35 is not set
> CONFIG_RTC_DRV_M48T59=3Dy
> # CONFIG_RTC_DRV_MSM6242 is not set
> CONFIG_RTC_DRV_BQ4802=3Dm
> # CONFIG_RTC_DRV_RP5C01 is not set
> CONFIG_RTC_DRV_V3020=3Dm
> # CONFIG_RTC_DRV_WM831X is not set
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_FTRTC010=3Dm
> CONFIG_RTC_DRV_MC13XXX=3Dm
> # CONFIG_RTC_DRV_MT6397 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_AUXDISPLAY is not set
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dm
> # CONFIG_UIO_MF624 is not set
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> # CONFIG_VIRTIO_INPUT is not set
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_STAGING=3Dy
> # CONFIG_IPX is not set
> # CONFIG_NCP_FS is not set
> CONFIG_COMEDI=3Dm
> CONFIG_COMEDI_DEBUG=3Dy
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> CONFIG_COMEDI_MISC_DRIVERS=3Dy
> CONFIG_COMEDI_BOND=3Dm
> # CONFIG_COMEDI_TEST is not set
> CONFIG_COMEDI_PARPORT=3Dm
> # CONFIG_COMEDI_SERIAL2002 is not set
> # CONFIG_COMEDI_SSV_DNP is not set
> # CONFIG_COMEDI_ISA_DRIVERS is not set
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_USB_DRIVERS=3Dm
> CONFIG_COMEDI_DT9812=3Dm
> # CONFIG_COMEDI_NI_USB6501 is not set
> CONFIG_COMEDI_USBDUX=3Dm
> CONFIG_COMEDI_USBDUXFAST=3Dm
> # CONFIG_COMEDI_USBDUXSIGMA is not set
> CONFIG_COMEDI_VMK80XX=3Dm
> CONFIG_COMEDI_8255=3Dm
> CONFIG_COMEDI_8255_SA=3Dm
> CONFIG_COMEDI_KCOMEDILIB=3Dm
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_R8712U is not set
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
> # CONFIG_GOLDFISH_AUDIO is not set
> # CONFIG_MTD_GOLDFISH_NAND is not set
> # CONFIG_LNET is not set
> # CONFIG_DGNC is not set
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_MOST is not set
> CONFIG_GREYBUS=3Dm
> CONFIG_GREYBUS_ES2=3Dm
> CONFIG_GREYBUS_AUDIO=3Dm
> CONFIG_GREYBUS_BOOTROM=3Dm
> # CONFIG_GREYBUS_HID is not set
> CONFIG_GREYBUS_LIGHT=3Dm
> CONFIG_GREYBUS_LOG=3Dm
> # CONFIG_GREYBUS_LOOPBACK is not set
> # CONFIG_GREYBUS_POWER is not set
> CONFIG_GREYBUS_RAW=3Dm
> CONFIG_GREYBUS_VIBRATOR=3Dm
> CONFIG_GREYBUS_BRIDGED_PHY=3Dm
> # CONFIG_GREYBUS_GPIO is not set
> # CONFIG_GREYBUS_I2C is not set
> # CONFIG_GREYBUS_UART is not set
> CONFIG_GREYBUS_USB=3Dm
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> CONFIG_TYPEC_TCPCI=3Dm
> # CONFIG_DRM_VBOXVIDEO is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ASUS_LAPTOP is not set
> CONFIG_DELL_SMBIOS=3Dy
> # CONFIG_DELL_LAPTOP is not set
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_ACPI_WMI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_INTEL_CHT_INT33FE is not set
> # CONFIG_INTEL_INT0002_VGPIO is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_IBM_RTL is not set
> CONFIG_SAMSUNG_LAPTOP=3Dy
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_PVPANIC is not set
> # CONFIG_INTEL_PMC_IPC is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> CONFIG_INTEL_PUNIT_IPC=3Dm
> CONFIG_MLX_PLATFORM=3Dm
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_GOLDFISH_BUS is not set
> CONFIG_GOLDFISH_PIPE=3Dm
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_LAPTOP is not set
> # CONFIG_CHROMEOS_PSTORE is not set
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
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_PALMAS is not set
> # CONFIG_HWSPINLOCK is not set
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> # CONFIG_RPMSG_CHAR is not set
> CONFIG_RPMSG_VIRTIO=3Dy
> # CONFIG_SOUNDWIRE is not set
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
> CONFIG_SOC_TI=3Dy
> =

> #
> # Xilinx SoC drivers
> #
> CONFIG_XILINX_VCU=3Dm
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dm
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ARIZONA is not set
> CONFIG_EXTCON_GPIO=3Dm
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> # CONFIG_EXTCON_MAX14577 is not set
> CONFIG_EXTCON_MAX3355=3Dm
> # CONFIG_EXTCON_MAX77693 is not set
> CONFIG_EXTCON_MAX77843=3Dm
> # CONFIG_EXTCON_MAX8997 is not set
> CONFIG_EXTCON_PALMAS=3Dm
> # CONFIG_EXTCON_RT8973A is not set
> CONFIG_EXTCON_SM5502=3Dm
> # CONFIG_EXTCON_USB_GPIO is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_ARM_GIC_MAX_NR=3D1
> CONFIG_IPACK_BUS=3Dm
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_TI_SYSCON=3Dm
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> CONFIG_FMC_TRIVIAL=3Dm
> CONFIG_FMC_WRITE_EEPROM=3Dy
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dm
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_QCOM_USB_HS is not set
> # CONFIG_PHY_QCOM_USB_HSIC is not set
> CONFIG_PHY_SAMSUNG_USB2=3Dm
> # CONFIG_PHY_TUSB1210 is not set
> CONFIG_POWERCAP=3Dy
> # CONFIG_MCB is not set
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
> =

> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dm
> CONFIG_INTEL_TH_MSU=3Dm
> CONFIG_INTEL_TH_PTI=3Dm
> # CONFIG_INTEL_TH_DEBUG is not set
> CONFIG_FPGA=3Dy
> CONFIG_ALTERA_PR_IP_CORE=3Dy
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_BRIDGE=3Dy
> # CONFIG_XILINX_PR_DECOUPLER is not set
> # CONFIG_FPGA_REGION is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> # CONFIG_DELL_RBU is not set
> # CONFIG_DCDBAS is not set
> # CONFIG_DMIID is not set
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> CONFIG_FW_CFG_SYSFS=3Dm
> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> # CONFIG_GOOGLE_COREBOOT_TABLE_ACPI is not set
> # CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
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
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS4_FS=3Dm
> CONFIG_FUSE_FS=3Dy
> # CONFIG_CUSE is not set
> CONFIG_OVERLAY_FS=3Dm
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> # CONFIG_OVERLAY_FS_INDEX is not set
> CONFIG_OVERLAY_FS_XINO_AUTO=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dm
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
> # CONFIG_CONFIGFS_FS is not set
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> # CONFIG_ECRYPT_FS is not set
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> # CONFIG_JFFS2_SUMMARY is not set
> CONFIG_JFFS2_FS_XATTR=3Dy
> # CONFIG_JFFS2_FS_POSIX_ACL is not set
> CONFIG_JFFS2_FS_SECURITY=3Dy
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> CONFIG_JFFS2_RTIME=3Dy
> CONFIG_UBIFS_FS=3Dm
> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> CONFIG_UBIFS_ATIME_SUPPORT=3Dy
> CONFIG_UBIFS_FS_SECURITY=3Dy
> CONFIG_CRAMFS=3Dy
> CONFIG_CRAMFS_MTD=3Dy
> CONFIG_ROMFS_FS=3Dm
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> CONFIG_ROMFS_ON_MTD=3Dy
> CONFIG_PSTORE=3Dm
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dm
> CONFIG_PSTORE_LZO_COMPRESS=3Dm
> CONFIG_PSTORE_LZ4_COMPRESS=3Dm
> CONFIG_PSTORE_LZ4HC_COMPRESS=3Dm
> CONFIG_PSTORE_842_COMPRESS=3Dy
> CONFIG_PSTORE_COMPRESS=3Dy
> # CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_LZO_COMPRESS_DEFAULT=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"lzo"
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_FTRACE=3Dy
> CONFIG_PSTORE_RAM=3Dm
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V2=3Dy
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dy
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
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dm
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dm
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=3Dm
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> # CONFIG_NLS_CODEPAGE_866 is not set
> CONFIG_NLS_CODEPAGE_869=3Dy
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dm
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dm
> # CONFIG_NLS_CODEPAGE_874 is not set
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dm
> CONFIG_NLS_ASCII=3Dm
> CONFIG_NLS_ISO8859_1=3Dy
> # CONFIG_NLS_ISO8859_2 is not set
> # CONFIG_NLS_ISO8859_3 is not set
> CONFIG_NLS_ISO8859_4=3Dm
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dm
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dm
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dm
> # CONFIG_NLS_MAC_GREEK is not set
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dm
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dm
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
> CONFIG_DEBUG_INFO_DWARF4=3Dy
> # CONFIG_GDB_SCRIPTS is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_FRAME_POINTER=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
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
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
> # CONFIG_PAGE_POISONING_ZERO is not set
> CONFIG_DEBUG_PAGE_REF=3Dy
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_DEBUG_VM is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_DEBUG_HIGHMEM=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
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
> # CONFIG_SCHEDSTATS is not set
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> CONFIG_DEBUG_TIMEKEEPING=3Dy
> # CONFIG_DEBUG_PREEMPT is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dm
> # CONFIG_WW_MUTEX_SELFTEST is not set
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PI_LIST is not set
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_PERF_TEST=3Dm
> CONFIG_RCU_TORTURE_TEST=3Dy
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_EQS_DEBUG=3Dy
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_PREEMPTIRQ_EVENTS=3Dy
> # CONFIG_IRQSOFF_TRACER is not set
> # CONFIG_PREEMPT_TRACER is not set
> # CONFIG_SCHED_TRACER is not set
> CONFIG_HWLAT_TRACER=3Dy
> # CONFIG_FTRACE_SYSCALLS is not set
> # CONFIG_TRACER_SNAPSHOT is not set
> CONFIG_TRACE_BRANCH_PROFILING=3Dy
> # CONFIG_BRANCH_PROFILE_NONE is not set
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_PROFILE_ALL_BRANCHES=3Dy
> CONFIG_TRACING_BRANCHES=3Dy
> CONFIG_BRANCH_TRACER=3Dy
> # CONFIG_STACK_TRACER is not set
> # CONFIG_KPROBE_EVENTS is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_MMIOTRACE is not set
> CONFIG_TRACING_MAP=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dy
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> CONFIG_TRACING_EVENTS_GPIO=3Dy
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_RUNTIME_TESTING_MENU is not set
> CONFIG_MEMTEST=3Dy
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> # CONFIG_UBSAN_NULL is not set
> CONFIG_TEST_UBSAN=3Dm
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> CONFIG_X86_PTDUMP_CORE=3Dy
> CONFIG_X86_PTDUMP=3Dm
> CONFIG_DEBUG_WX=3Dy
> CONFIG_DOUBLEFAULT=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
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
> CONFIG_OPTIMIZE_INLINING=3Dy
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> # CONFIG_TRUSTED_KEYS is not set
> CONFIG_ENCRYPTED_KEYS=3Dm
> CONFIG_KEY_DH_OPERATIONS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> # CONFIG_SECURITY_PATH is not set
> # CONFIG_FORTIFY_SOURCE is not set
> # CONFIG_STATIC_USERMODEHELPER is not set
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
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> # CONFIG_CRYPTO_AUTHENC is not set
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> CONFIG_CRYPTO_ENGINE=3Dm
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> # CONFIG_CRYPTO_GCM is not set
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> # CONFIG_CRYPTO_ECHAINIV is not set
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dm
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dm
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dm
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dm
> CONFIG_CRYPTO_GHASH=3Dm
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> CONFIG_CRYPTO_RMD128=3Dm
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> # CONFIG_CRYPTO_SHA512 is not set
> CONFIG_CRYPTO_SHA3=3Dm
> CONFIG_CRYPTO_SM3=3Dm
> CONFIG_CRYPTO_TGR192=3Dm
> CONFIG_CRYPTO_WP512=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> CONFIG_CRYPTO_AES_586=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dm
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dm
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dm
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_KHAZAD=3Dm
> CONFIG_CRYPTO_SALSA20=3Dm
> CONFIG_CRYPTO_SALSA20_586=3Dm
> CONFIG_CRYPTO_CHACHA20=3Dm
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> CONFIG_CRYPTO_SM4=3Dm
> # CONFIG_CRYPTO_SPECK is not set
> CONFIG_CRYPTO_TEA=3Dm
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dm
> CONFIG_CRYPTO_LZO=3Dm
> CONFIG_CRYPTO_842=3Dm
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dm
> =

> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
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
> # CONFIG_CRYPTO_DEV_HIFN_795X is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> CONFIG_CRYPTO_DEV_VIRTIO=3Dm
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
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
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_VHOST_NET is not set
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> # CONFIG_CRC_CCITT is not set
> CONFIG_CRC16=3Dm
> CONFIG_CRC_T10DIF=3Dm
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC4 is not set
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dm
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=3Dm
> CONFIG_842_DECOMPRESS=3Dm
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dm
> CONFIG_LZO_DECOMPRESS=3Dm
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dm
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> # CONFIG_XZ_DEC_IA64 is not set
> # CONFIG_XZ_DEC_ARM is not set
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_RADIX_TREE_MULTIORDER=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_DMA_DIRECT_OPS=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dm
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dm
> # CONFIG_DDR is not set
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_PRIME_NUMBERS=3Dm
> CONFIG_STRING_SELFTEST=3Dy


--===============5445529577185841661==--

