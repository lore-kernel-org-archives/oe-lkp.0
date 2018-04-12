Content-Type: multipart/mixed; boundary="===============1660449782127602218=="
MIME-Version: 1.0
From: Boqun Feng <boqun.feng@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 9ddf3ebd04 [ 0.004000] BUG: scheduling while atomic: swapper/0/0x00000002
Date: Thu, 12 Apr 2018 12:57:07 +0800
Message-ID: <20180412045706.6tneupzzmux5ucmv@tardis>
In-Reply-To: <20180412014710.xeeaa5sa4ndbcf6o@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1660449782127602218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

 (Cc Paul and Peter)

On Thu, Apr 12, 2018 at 09:47:10AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git arr-rfc-v=
6-rc1
> =

> commit 9ddf3ebd041d33b9de0e63a81e933774787c29d3
> Author:     Boqun Feng <boqun.feng@gmail.com>
> AuthorDate: Wed Apr 11 18:29:34 2018 +0800
> Commit:     Boqun Feng <boqun.feng@gmail.com>
> CommitDate: Wed Apr 11 19:58:05 2018 +0800
> =

>     lockdep/selftest: Add a test case for SRCU
>     =

>     Since we now could detect deadlock cases for sleepable RCU, a self te=
st
>     case is added. More other complex scenarios may be added later to
>     srcu_tests().
>     =

>     Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>     Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> =

> 4f30fa8872  rcu: Equip sleepable RCU with lockdep dependency graph checks
> 9ddf3ebd04  lockdep/selftest: Add a test case for SRCU
> +------------------------------------------------------+------------+----=
--------+
> |                                                      | 4f30fa8872 | 9dd=
f3ebd04 |
> +------------------------------------------------------+------------+----=
--------+
> | boot_successes                                       | 22         | 0  =
        |
> | boot_failures                                        | 0          | 15 =
        |
> | BUG:scheduling_while_atomic                          | 0          | 15 =
        |
> | WARNING:at_kernel/locking/lockdep.c:#lock_release    | 0          | 15 =
        |
> | EIP:lock_release                                     | 0          | 15 =
        |
> | WARNING:at_kernel/locking/lockdep.c:#lock_unpin_lock | 0          | 15 =
        |
> | EIP:lock_unpin_lock                                  | 0          | 15 =
        |
> +------------------------------------------------------+------------+----=
--------+
> =

> [    0.004000]   --------------------------------------------------------=
------------------
> [    0.004000]   | SRCU tests |
> [    0.004000]   ---------------
> [    0.004000]          ABBA read-sync/read-sync:
> [    0.004000] workqueue: round-robin CPU selection forced, expect perfor=
mance impact
> [    0.004000] BUG: scheduling while atomic: swapper/0/0x00000002
> [    0.004000] 1 lock held by swapper/0:
> [    0.004000]  #0:  (&srcu_A){.+.+}, at: [<(ptrval)>] srcu_ABBA+0x0/0x100
> [    0.004000] Modules linked in:
> [    0.004000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.16.0-00020-g9ddf=
3eb #1
> [    0.004000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.004000] Call Trace:
> [    0.004000]  dump_stack+0x16/0x19
> [    0.004000]  __schedule_bug+0x67/0x90
> [    0.004000]  __schedule+0x4ac/0x580
> [    0.004000]  ? sched_clock+0x9/0x10
> [    0.004000]  schedule+0x2d/0x80
> [    0.004000]  schedule_timeout+0x155/0x1f0
> [    0.004000]  ? mark_held_locks+0x74/0xa0
> [    0.004000]  ? _raw_spin_unlock_irq+0x22/0x40
> [    0.004000]  ? trace_hardirqs_on_caller+0xca/0x1d0
> [    0.004000]  wait_for_common+0xff/0x1b0
> [    0.004000]  ? wake_up_q+0x60/0x60
> [    0.004000]  wait_for_completion+0x12/0x20
> [    0.004000]  synchronize_srcu+0x83/0xa0
> [    0.004000]  ? srcu_drive_gp+0x140/0x140
> [    0.004000]  ? rcu_read_lock_held+0x50/0x50
> [    0.004000]  ? wait_for_common+0x3b/0x1b0
> [    0.004000]  ? ww_test_normal+0x270/0x270
> [    0.004000]  srcu_ABBA+0x5b/0x100
> [    0.004000]  ? ww_test_normal+0x270/0x270
> [    0.004000]  dotest+0x2b/0x572
> [    0.004000]  locking_selftest+0x29b6/0x2a50
> [    0.004000]  start_kernel+0x321/0x47a
> [    0.004000]  i386_start_kernel+0xb5/0xcd
> [    0.004000]  startup_32_smp+0x164/0x168

So we met this problem because:

a)	all the lock selftest cases are called with preemption off,
	because locking_selftest() is called in start_kernel() with
	preemption off. (Note that the preemption off is actually fine
	for the selftest because the whole selftest is single-threaded,
	so all the acquisitions of locks will succeed in fast path, so
	no block. And if we hit a self deadlock, which will trigger a
	real block, the lockdep should report it, and we skip to the
	next test case with preempt count recoverd)

and

b)	we do a schedule() in srcu_ABBA() because we call
	synchronize_srcu(), note that SMP=3Dn, so means we hit this for
	tiny SRCU. And I don't think we have a similar problem for tree
	SRCU.

So the problem is basically caused by an unconditional
wait_for_completion() in tiny SRCU, which I think could be fixed by
adding the rcu_scheduler_state check as the same for tree SRCU, like:

	diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
	index bc89cb48d800..21f4765ef8ee 100644
	--- a/kernel/rcu/srcutiny.c
	+++ b/kernel/rcu/srcutiny.c
	@@ -190,6 +190,9 @@ void synchronize_srcu(struct srcu_struct *sp)
	 =

		srcu_lock_sync(&sp->dep_map);
	 =

	+	if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
	+		return;
	+
		init_rcu_head_on_stack(&rs.head);
		init_completion(&rs.completion);
		call_srcu(sp, &rs.head, wakeme_after_rcu);

I think this not only fixes the problem here, but also is the right way
to do because for tiny SRCU, synchronize_srcu() should be a no-op if
rcu scheduler is inactive, right?

Thoughts?

Regards,
Boqun


> [    0.004000] ------------[ cut here ]------------
> [    0.004000] releasing a pinned lock
> [    0.004000] WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:3961 lo=
ck_release+0x294/0x2d0
> [    0.004000] Modules linked in:
> [    0.004000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W        4.1=
6.0-00020-g9ddf3eb #1
> [    0.004000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.004000] EIP: lock_release+0x294/0x2d0
> [    0.004000] EFLAGS: 00210096 CPU: 0
> [    0.004000] EAX: 00000017 EBX: c1d4f4c0 ECX: c1d4f4c0 EDX: 00000120
> [    0.004000] ESI: 00000002 EDI: c1d4f684 EBP: c1d41db4 ESP: c1d41d88
> [    0.004000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    0.004000] CR0: 80050033 CR2: ffffffff CR3: 02002000 CR4: 000406b0
> [    0.004000] Call Trace:
> [    0.004000]  ? dequeue_task_idle+0xe/0x30
> [    0.004000]  _raw_spin_unlock_irq+0x16/0x40
> [    0.004000]  dequeue_task_idle+0xe/0x30
> [    0.004000]  deactivate_task+0x3e/0x60
> [    0.004000]  __schedule+0x2af/0x580
> [    0.004000]  ? sched_clock+0x9/0x10
> [    0.004000]  schedule+0x2d/0x80
> [    0.004000]  schedule_timeout+0x155/0x1f0
> [    0.004000]  ? mark_held_locks+0x74/0xa0
> [    0.004000]  ? _raw_spin_unlock_irq+0x22/0x40
> [    0.004000]  ? trace_hardirqs_on_caller+0xca/0x1d0
> [    0.004000]  wait_for_common+0xff/0x1b0
> [    0.004000]  ? wake_up_q+0x60/0x60
> [    0.004000]  wait_for_completion+0x12/0x20
> [    0.004000]  synchronize_srcu+0x83/0xa0
> [    0.004000]  ? srcu_drive_gp+0x140/0x140
> [    0.004000]  ? rcu_read_lock_held+0x50/0x50
> [    0.004000]  ? wait_for_common+0x3b/0x1b0
> [    0.004000]  ? ww_test_normal+0x270/0x270
> [    0.004000]  srcu_ABBA+0x5b/0x100
> [    0.004000]  ? ww_test_normal+0x270/0x270
> [    0.004000]  dotest+0x2b/0x572
> [    0.004000]  locking_selftest+0x29b6/0x2a50
> [    0.004000]  start_kernel+0x321/0x47a
> [    0.004000]  i386_start_kernel+0xb5/0xcd
> [    0.004000]  startup_32_smp+0x164/0x168
> [    0.004000] Code: 04 d3 c1 c2 c1 c7 04 24 77 f6 c0 c1 e8 16 bf fc ff 0=
f 0b 8b 45 dc e9 49 ff ff ff 8d 74 26 00 c7 04 24 14 cd c1 c1 e8 fc be fc f=
f <0f> 0b e9 06 fe ff ff 89 c1 c1 e1 04 c1 e0 08 29 c8 05 b0 a5 41
> [    0.004000] ---[ end trace bb6731d7f8bef4b6 ]---
> [    0.004000] bad: scheduling from the idle thread!
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 731a8d48294ebee3dfa007533ff133a157364c39 0adb32858b0bddf=
4ada5f364a84ed60b196dbcda --
> git bisect good 151cfecc709cae8004857cf4d3969de64b99dfc3  # 01:09  G     =
11     0    7   7  Merge 'linux-review/Jia-Ju-Bai/net-samsung-sxgbe-Replace=
-mdelay-with-usleep_range-in-sxgbe_sw_reset/20180411-225900' into devel-cat=
chup-201804112323
> git bisect  bad 0b02457602420fd0e2c34b05eec23c86f9296779  # 01:21  B     =
 0    11   25   0  Merge 'powerpc/merge' into devel-catchup-201804112323
> git bisect  bad 795173a818d1d584db3d94871f1d3ad39894b4cf  # 01:46  B     =
 0    11   29   4  Merge 'linux-review/Xin-Long/sctp-do-not-check-port-in-s=
ctp_inet6_cmp_addr/20180411-223639' into devel-catchup-201804112323
> git bisect  bad 2a0a68336ae9a14f92fa549cd371b085d2b81974  # 01:58  B     =
 0     8   25   3  Merge 'boqun/arr-rfc-v6-rc1' into devel-catchup-20180411=
2323
> git bisect good 4d9461b4080f42b26e61adfa1478ad8160e9b52f  # 02:16  G     =
11     0    4   4  lockdep: Adjust check_redundant() for recursive read cha=
nge
> git bisect good 51d4cdb55dfa83318c3e5f34d13ec5d7cffc9b11  # 02:28  G     =
10     0   10  10  lockdep/selftest: Unleash irq_read_recursion2 and add mo=
re
> git bisect good 6120c8e00676b55c51721bd1c5c6e4fe004bb1b2  # 02:40  G     =
11     0    1   1  MAINTAINERS: Add myself as a LOCKING PRIMITIVES reviewer
> git bisect  bad 9ddf3ebd041d33b9de0e63a81e933774787c29d3  # 02:52  B     =
 0    11   27   2  lockdep/selftest: Add a test case for SRCU
> git bisect good 4f30fa88728f28578e29e43cc7a78a29635d9981  # 03:12  G     =
11     0    6   6  rcu: Equip sleepable RCU with lockdep dependency graph c=
hecks
> # first bad commit: [9ddf3ebd041d33b9de0e63a81e933774787c29d3] lockdep/se=
lftest: Add a test case for SRCU
> git bisect good 4f30fa88728f28578e29e43cc7a78a29635d9981  # 03:15  G     =
30     0   12  18  rcu: Equip sleepable RCU with lockdep dependency graph c=
hecks
> # extra tests with debug options
> git bisect  bad 9ddf3ebd041d33b9de0e63a81e933774787c29d3  # 03:29  B     =
 0     1   15   0  lockdep/selftest: Add a test case for SRCU
> # extra tests on HEAD of linux-devel/devel-catchup-201804112323
> git bisect  bad 731a8d48294ebee3dfa007533ff133a157364c39  # 03:34  B     =
 0   455  472   0  0day head guard for 'devel-catchup-201804112323'
> # extra tests on tree/branch boqun/arr-rfc-v6-rc1
> git bisect  bad 9ddf3ebd041d33b9de0e63a81e933774787c29d3  # 03:36  B     =
 0    15   29   0  lockdep/selftest: Add a test case for SRCU
> # extra tests with first bad commit reverted
> git bisect good c7e1c792bddecd67873582dc6c3c7a6883ead09c  # 03:49  G     =
10     0    7   7  Revert "lockdep/selftest: Add a test case for SRCU"
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
> 	-cpu Haswell,+smep,+smap
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
> # Linux/i386 4.16.0 Kernel Configuration
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
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D3
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
> # CONFIG_KERNEL_XZ is not set
> CONFIG_KERNEL_LZO=3Dy
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_USELIB=3Dy
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> CONFIG_AUDIT_WATCH=3Dy
> CONFIG_AUDIT_TREE=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
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
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TINY_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> # CONFIG_RCU_STALL_COMMON is not set
> # CONFIG_RCU_NEED_SEGCBLIST is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_HUGETLB is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_BPF is not set
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_SOCK_CGROUP_DATA is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> # CONFIG_IPC_NS is not set
> # CONFIG_USER_NS is not set
> # CONFIG_PID_NS is not set
> # CONFIG_NET_NS is not set
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
> # CONFIG_EXPERT is not set
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
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
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_MEMBARRIER=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PC104=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> CONFIG_SLAB_FREELIST_HARDENED=3Dy
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> CONFIG_PROFILING=3Dy
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_OPROFILE=3Dy
> CONFIG_OPROFILE_EVENT_MULTIPLEX=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
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
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGIN_LATENT_ENTROPY=3Dy
> CONFIG_GCC_PLUGIN_STRUCTLEAK=3Dy
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
> CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy
> CONFIG_GCC_PLUGIN_RANDSTRUCT_PERFORMANCE=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> CONFIG_CC_STACKPROTECTOR_STRONG=3Dy
> # CONFIG_CC_STACKPROTECTOR_AUTO is not set
> CONFIG_THIN_ARCHIVES=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D8
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> # CONFIG_HAVE_ARCH_HASH is not set
> # CONFIG_ISA_BUS_API is not set
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
> CONFIG_ARCH_HAS_PHYS_TO_DMA=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> # CONFIG_REFCOUNT_FULL is not set
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> # CONFIG_MODULE_UNLOAD is not set
> CONFIG_MODVERSIONS=3Dy
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> CONFIG_MODULE_COMPRESS_XZ=3Dy
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> # CONFIG_LBDAF is not set
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_ZONED=3Dy
> # CONFIG_BLK_CMDLINE_PARSER is not set
> CONFIG_BLK_WBT=3Dy
> CONFIG_BLK_WBT_SQ=3Dy
> # CONFIG_BLK_WBT_MQ is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> CONFIG_BLK_SED_OPAL=3Dy
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_AMIGA_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> # CONFIG_IOSCHED_CFQ is not set
> CONFIG_DEFAULT_DEADLINE=3Dy
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"deadline"
> CONFIG_MQ_IOSCHED_DEADLINE=3Dm
> # CONFIG_MQ_IOSCHED_KYBER is not set
> # CONFIG_IOSCHED_BFQ is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> # CONFIG_FREEZER is not set
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> CONFIG_INTEL_RDT=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
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
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> CONFIG_MPENTIUMII=3Dy
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
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D6
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> CONFIG_NR_CPUS_RANGE_END=3D1
> CONFIG_NR_CPUS_DEFAULT=3D1
> CONFIG_NR_CPUS=3D1
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
[...]

--===============1660449782127602218==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVqNUlvc1FUUHo4
WFUxd1JIU1hub3c3VUgrcmdGQWxyTzV4OEFDZ2tRU1hub3c3VUgKK3JpSHJnZ0FvSG9JMktFTnlx
VnBxbGNRL0JkN0I1OWVvTlE0cExxcWhoamgyMXdoY3N2alVscmt4S0lEVk9WVQpzaVZHUHBraEhN
R1AwUnFCMlRFMlk4YlZ1OGpkUmJlYWZXcldzTzEvVWZNZWx0NVZ5TkhsTGRlRVRLUWxJK0txCmY4
djcyRDhMK09hOWoxYzIvbmVzRWJMWWhtakRmYWYrWldydkNNL1FtdWMvaXJ3d2d0WDQyTW9PTERm
Q1NxR3oKMmNUR2FBalBWdmJHM2ZmZjRERzVHZ1QxRGtQQU55VzlyUE1ubCttZk5MUkFsSUpGNTd6
bHFyZVRPMjdiaGNzQwo2WEdOQzFmNjluZmtvZTZUNk1LQit4NEh2VUtPYkNoSGlBVHNOU0hENmdp
RCtxNXlFZWFHV0x5Q0dKWWV1SlhHCkt6RUFsbFo1clMyaVZieVp4SkE1bDFGM2JEQjRZUT09Cj1L
MmZjCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1660449782127602218==--

