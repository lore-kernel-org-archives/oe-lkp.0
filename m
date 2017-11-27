Content-Type: multipart/mixed; boundary="===============8955934451373028400=="
MIME-Version: 1.0
From: Fengguang Wu <wfg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 5b190d43c8 ("Convert IDR to use xarray"): genirq: Flags mismatch irq 4. 00000000 (ttyS0) vs. 00000000 (sir_ir)
Date: Mon, 27 Nov 2017 09:07:54 +0800
Message-ID: <20171127010753.efcydehtsisaqa7o@wfg-t540p.sh.intel.com>
In-Reply-To: <5a1b103b.4wwo/CRzqutY5YTu%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8955934451373028400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry the genirq flags mismatch is actually old error. The new ones
are

 +-------------------------------------------------------+------------+----=
--------+
 | WARNING:at_kernel/rcu/tree.c:#rcu_process_callbacks   | 0          | 10 =
        |
 | RIP:rcu_process_callbacks                             | 0          | 10 =
        |
 | RIP:rb_move_tail                                      | 0          | 1  =
        |
 | BUG:unable_to_handle_kernel                           | 0          | 17 =
        |
 | Oops:#[##]                                            | 0          | 17 =
        |
 | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 17 =
        |
 | RIP:ring_buffer_consumer_thread                       | 0          | 1  =
        |
 | BUG:kernel_hang_in_test_stage                         | 0          | 1  =
        |
 | RIP:native_safe_halt                                  | 0          | 2  =
        |
 | RIP:migration_cpu_stop                                | 0          | 1  =
        |
 +-------------------------------------------------------+------------+----=
--------+

Thanks,
Fengguang

On Mon, Nov 27, 2017 at 03:04:27AM +0800, kernel test robot wrote:
>Greetings,
>
>0day kernel testing robot got the below dmesg and the first bad commit is
>
>git://git.infradead.org/users/willy/linux-dax.git xarray-2017-11-20
>
>commit 5b190d43c8ff6611f8eb7a1d5b3b0bb6fb1173a7
>Author:     Matthew Wilcox <mawilcox@microsoft.com>
>AuthorDate: Fri Nov 17 08:21:15 2017 -0500
>Commit:     Matthew Wilcox <mawilcox@microsoft.com>
>CommitDate: Sat Nov 25 21:34:28 2017 -0500
>
>    Convert IDR to use xarray
>
>    The one thing the IDR can do which the XArray cannot is allocate an
>    entry and store a NULL pointer there.  The radix tree was modified to
>    have this ability, but it added a lot of complexity.  Instead, we
>    introduce the 'Skip entry', which will read back from the XArray as
>    NULL through the normal API and will be skipped when iterating, but
>    will keep a slot allocated.  The only way to store a skip entry in the
>    xarray is through the advanced API, so unaware users should be
>    unaffected by it.
>
>    The idr_for_each_entry_ul() iterator becomes an alias for xa_for_each(=
),
>    so we drop the idr_get_next_ul() function as it has no users.
>
>    The exported IDR API was a weird mix of GPL-only and general symbols;
>    I converted them all to GPL as there was no way to use the IDR API
>    without being GPL.
>
>    Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>
>
>931d938bbb  xarray: Add xas_find_any / xas_next_any
>5b190d43c8  Convert IDR to use xarray
>+-------------------------------------------------------+------------+----=
--------+
>|                                                       | 931d938bbb | 5b1=
90d43c8 |
>+-------------------------------------------------------+------------+----=
--------+
>| boot_successes                                        | 1          | 0  =
        |
>| boot_failures                                         | 156        | 42 =
        |
>| genirq:Flags_mismatch_irq##(ttyS0)vs.#(sir_ir)        | 156        | 42 =
        |
>| INFO:rcu_sched_self-detected_stall_on_CPU             | 9          | 1  =
        |
>| RIP:__do_softirq                                      | 9          |    =
        |
>| RIP:mutex_spin_on_owner                               | 1          |    =
        |
>| INFO:task_blocked_for_more_than#seconds               | 9          | 1  =
        |
>| RIP:io_serial_in                                      | 5          | 1  =
        |
>| Kernel_panic-not_syncing:hung_task:blocked_tasks      | 9          | 1  =
        |
>| RIP:_raw_spin_unlock_irqrestore                       | 7          | 2  =
        |
>| RIP:io_serial_out                                     | 2          | 1  =
        |
>| RIP:sir_interrupt                                     | 1          |    =
        |
>| RIP:__fentry                                          | 1          |    =
        |
>| RIP:queued_spin_lock_slowpath                         | 1          |    =
        |
>| WARNING:at_kernel/rcu/tree.c:#rcu_process_callbacks   | 0          | 10 =
        |
>| RIP:rcu_process_callbacks                             | 0          | 10 =
        |
>| RIP:rb_move_tail                                      | 0          | 1  =
        |
>| BUG:unable_to_handle_kernel                           | 0          | 17 =
        |
>| Oops:#[##]                                            | 0          | 17 =
        |
>| Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 17 =
        |
>| RIP:ring_buffer_consumer_thread                       | 0          | 1  =
        |
>| BUG:kernel_hang_in_test_stage                         | 0          | 1  =
        |
>| RIP:native_safe_halt                                  | 0          | 2  =
        |
>| RIP:migration_cpu_stop                                | 0          | 1  =
        |
>+-------------------------------------------------------+------------+----=
--------+
>
>[   54.878532] raid6test: test_disks(61, 63): faila=3D 61(D)  failb=3D 63(=
Q)  OK
>[   54.880659] raid6test: test_disks(62, 63): faila=3D 62(P)  failb=3D 63(=
Q)  OK
>[   54.882338] raid6test:
>[   54.882914] raid6test: complete (2429 tests, 0 failures)
>[   54.892704] BIOS EDD facility v0.16 2004-Jun-25, 6 devices found
>[   54.896144] genirq: Flags mismatch irq 4. 00000000 (ttyS0) vs. 00000000=
 (sir_ir)
>[   54.898808] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.14.0-13459-g5b1=
90d4 #1
>[   54.900209] sir_ir sir_ir.0: Trapped in interrupt
>[   54.902070] Call Trace:
>[   54.902883]  dump_stack+0x5c/0x86
>[   54.903779]  __setup_irq+0x627/0x670
>[   54.904745]  request_threaded_irq+0xfa/0x160
>[   54.905927]  univ8250_setup_irq+0x253/0x290
>[   54.907086]  serial8250_do_startup+0x19c/0x6f0
>[   54.908306]  uart_startup+0x79/0x160
>[   54.909428]  tty_port_open+0x7b/0xd0
>[   54.910313]  ? _raw_spin_unlock+0xa/0x20
>[   54.911279]  uart_open+0x37/0x50
>[   54.912134]  tty_open+0xf6/0x450
>[   54.912907]  chrdev_open+0x86/0x1a0
>[   54.913648]  ? exact_lock+0x20/0x20
>[   54.914398]  do_dentry_open+0x1b1/0x2c0
>[   54.915442]  path_openat+0x292/0x1060
>[   54.916273]  ? idr_alloc_cyclic+0x32/0x70
>[   54.917449]  ? kernfs_activate+0x61/0x90
>[   54.918408]  ? mutex_unlock+0x5/0x30
>[   54.919240]  ? kernfs_add_one+0xe4/0x130
>[   54.920176]  do_filp_open+0x99/0x110
>[   54.921200]  ? __phys_addr_symbol+0x5/0x30
>[   54.922278]  ? __check_object_size+0x165/0x360
>[   54.923461]  ? class_dev_iter_next+0x2c/0x40
>[   54.924589]  ? __alloc_fd+0xaf/0x160
>[   54.925593]  ? set_debug_rodata+0x11/0x11
>[   54.926669]  ? do_sys_open+0x12e/0x210
>[   54.927639]  ? do_filp_open+0x5/0x110
>[   54.928635]  do_sys_open+0x12e/0x210
>[   54.929679]  ? set_debug_rodata+0x11/0x11
>[   54.930816]  kernel_init_freeable+0x197/0x1f9
>[   54.932002]  ? rest_init+0xd0/0xd0
>[   54.932908]  kernel_init+0xa/0x100
>[   54.933861]  ret_from_fork+0x1f/0x30
>[   54.935346] debug: unmapping init [mem 0xffffffff940e0000-0xffffffff942=
2efff]
>[   54.938535] sir_ir sir_ir.0: Trapped in interrupt
>[   54.940245] Write protecting the kernel read-only data: 26624k
>[   55.001075] debug: unmapping init [mem 0xffff893449346000-0xffff8934493=
fffff]
>[   55.003032] debug: unmapping init [mem 0xffff893449a2e000-0xffff893449b=
fffff]
>[   55.008331] x86/mm: Checked W+X mappings: passed, no W+X pages found.
>[   55.009923] rodata_test: all tests were successful
>[   55.103038] process 1 (init) attempted a POSIX timer syscall while CONF=
IG_POSIX_TIMERS is not set
>[   55.135733] sir_ir sir_ir.0: Trapped in interrupt
>[   55.137209] genirq: Flags mismatch irq 4. 00000000 (ttyS0) vs. 00000000=
 (sir_ir)
>[   55.139122] CPU: 0 PID: 205 Comm: init Not tainted 4.14.0-13459-g5b190d=
4 #1
>[   55.140970] Call Trace:
>[   55.141655]  dump_stack+0x5c/0x86
>[   55.142515]  __setup_irq+0x627/0x670
>[   55.143419]  request_threaded_irq+0xfa/0x160
>[   55.144523]  univ8250_setup_irq+0x253/0x290
>[   55.145654]  serial8250_do_startup+0x19c/0x6f0
>[   55.146837]  uart_startup+0x79/0x160
>[   55.147919]  tty_port_open+0x7b/0xd0
>[   55.148892]  ? _raw_spin_unlock+0xa/0x20
>[   55.149909]  uart_open+0x37/0x50
>[   55.150757]  tty_open+0xf6/0x450
>[   55.151633]  chrdev_open+0x86/0x1a0
>[   55.152550]  ? exact_lock+0x20/0x20
>[   55.153440]  do_dentry_open+0x1b1/0x2c0
>[   55.154582]  path_openat+0x292/0x1060
>[   55.155571]  ? up_read+0x5/0x20
>[   55.156369]  ? __do_page_fault+0x1b6/0x430
>[   55.157386]  do_filp_open+0x99/0x110
>[   55.158352]  ? __alloc_fd+0xaf/0x160
>[   55.159279]  ? do_sys_open+0x12e/0x210
>[   55.160310]  ? do_filp_open+0x5/0x110
>[   55.161342]  do_sys_open+0x12e/0x210
>[   55.162327]  entry_SYSCALL_64_fastpath+0x1a/0x7d
>[   55.163554] RIP: 0033:0x7fe52d3f0570
>[   55.164575] RSP: 002b:00007ffeba05f498 EFLAGS: 00000246 ORIG_RAX: 00000=
00000000002
>[   55.166323] RAX: ffffffffffffffda RBX: 00005653bc3e7130 RCX: 00007fe52d=
3f0570
>[   55.168208] RDX: 00005653bc3e25f0 RSI: 0000000000000102 RDI: 00005653bc=
1cdda5
>[   55.170035] RBP: 00005653bc410280 R08: 00007fe52d5f9260 R09: 00007fe52d=
e7e700
>[   55.171854] R10: 00007fe52de7e9d0 R11: 0000000000000246 R12: 0000000000=
000008
>[   55.173641] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000=
000000
>[   56.096708] init: Failed to create pty - disabling logging for job
>[   56.098618] init: Temporary process spawn error: No such file or direct=
ory
>[   57.059319] init: Failed to create pty - disabling logging for job
>
>                                                          # HH:MM RESULT G=
OOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>git bisect start fe59b1d7a92f68f0965ab9385150f6d40b43d641 bebc6082da0a9f5d=
47a1ea2edc099bf671058bd4 --
>git bisect  bad 740764f1a4902f8dfcf8ad8387a6225b3457c7db  # 21:03  B      =
6     1    6   6  Merge 'tip/master' into devel-spot-201711261755
>git bisect good 1f1dc9c36a37e3cc8c5c49bbf00ce9fb81401d69  # 21:28  G     1=
7     0   17  17  Merge 'linux-review/Vaibhav-Jain/powerpc-Avoid-signed-to-=
unsigned-conversion-in-set_thread_tidr/20171126-121943' into devel-spot-201=
711261755
>git bisect  bad c101842631f9a83c47d8f998d7390322bca07599  # 21:49  B     1=
5     3   15  15  Merge 'dax/xarray-2017-11-20' into devel-spot-201711261755
>git bisect good b283cf4732e45df336775b25396beda09ab70c91  # 22:23  G     3=
6     0   35  35  Merge 'ps3/master' into devel-spot-201711261755
>git bisect good 2e7d2b7c65b34a303d82b137fb17b4a8c620849a  # 22:56  G     3=
8     0   38  38  Merge 'nf/master' into devel-spot-201711261755
>git bisect good bdc69fab90a7bdcdb600a69024965aa5b1c3e0a6  # 23:23  G     3=
5     0   35  35  Merge 'nf-next/master' into devel-spot-201711261755
>git bisect good 4c199228624babef5419f733c40d37e7d5d82ee3  # 23:45  G     3=
8     0   38  38  xarray: Change definition of sibling entries
>git bisect good 35b00dc70d3fbb6c630de9356527bd54bab10b73  # 00:30  G     3=
6     0   36  38  xarray: Add xa_get_entries and xa_get_tagged
>git bisect  bad 62ec30e35a938484560399ad0f5f47fd304df1ab  # 01:01  B      =
0     1   14   0  ida: Convert to using xarray
>git bisect good 8ad3af7ad6def88fc84e43122ce6f0ae82fdcecb  # 01:30  G     3=
6     0   36  39  xarray: Add xas_prev_any
>git bisect  bad 5b190d43c8ff6611f8eb7a1d5b3b0bb6fb1173a7  # 01:49  B      =
1     1    1   1  Convert IDR to use xarray
>git bisect good 931d938bbb66a2309a5087d7dbdbce11f3931826  # 02:16  G     3=
7     0   37  38  xarray: Add xas_find_any / xas_next_any
># first bad commit: [5b190d43c8ff6611f8eb7a1d5b3b0bb6fb1173a7] Convert IDR=
 to use xarray
>git bisect good 931d938bbb66a2309a5087d7dbdbce11f3931826  # 02:53  G    10=
8     0  107 148  xarray: Add xas_find_any / xas_next_any
>
>---
>0-DAY kernel test infrastructure                Open Source Technology Cen=
ter
>https://lists.01.org/pipermail/lkp                          Intel Corporat=
ion



>#!/bin/bash
>
>kernel=3D$1
>initrd=3Dquantal-core-x86_64.cgz
>
>wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/ma=
ster/quantal/$initrd
>
>kvm=3D(
>	qemu-system-x86_64
>	-enable-kvm
>	-cpu kvm64
>	-kernel $kernel
>	-initrd $initrd
>	-m 512
>	-smp 2
>	-device e1000,netdev=3Dnet0
>	-netdev user,id=3Dnet0
>	-boot order=3Dnc
>	-no-reboot
>	-watchdog i6300esb
>	-watchdog-action debug
>	-rtc base=3Dlocaltime
>	-serial stdio
>	-display none
>	-monitor null
>)
>
>append=3D(
>	root=3D/dev/ram0
>	hung_task_panic=3D1
>	debug
>	apic=3Ddebug
>	sysrq_always_enabled
>	rcupdate.rcu_cpu_stall_timeout=3D100
>	net.ifnames=3D0
>	printk.devkmsg=3Don
>	panic=3D-1
>	softlockup_panic=3D1
>	nmi_watchdog=3Dpanic
>	oops=3Dpanic
>	load_ramdisk=3D2
>	prompt_ramdisk=3D0
>	drbd.minor_count=3D8
>	systemd.log_level=3Derr
>	ignore_loglevel
>	console=3Dtty0
>	earlyprintk=3DttyS0,115200
>	console=3DttyS0,115200
>	vga=3Dnormal
>	rw
>	drbd.minor_count=3D8
>)
>
>"${kvm[@]}" -append "${append[*]}"

>#
># Automatically generated file; DO NOT EDIT.
># Linux/x86_64 4.14.0 Kernel Configuration
>#
>CONFIG_64BIT=3Dy
>CONFIG_X86_64=3Dy
>CONFIG_X86=3Dy
>CONFIG_INSTRUCTION_DECODER=3Dy
>CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
>CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
>CONFIG_LOCKDEP_SUPPORT=3Dy
>CONFIG_STACKTRACE_SUPPORT=3Dy
>CONFIG_MMU=3Dy
>CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
>CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>CONFIG_NEED_DMA_MAP_STATE=3Dy
>CONFIG_NEED_SG_DMA_LENGTH=3Dy
>CONFIG_GENERIC_BUG=3Dy
>CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
>CONFIG_GENERIC_HWEIGHT=3Dy
>CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
>CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
>CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
>CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
>CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
>CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
>CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
>CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
>CONFIG_ZONE_DMA32=3Dy
>CONFIG_AUDIT_ARCH=3Dy
>CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
>CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>CONFIG_X86_64_SMP=3Dy
>CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>CONFIG_FIX_EARLYCON_MEM=3Dy
>CONFIG_PGTABLE_LEVELS=3D4
>CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>CONFIG_CONSTRUCTORS=3Dy
>CONFIG_IRQ_WORK=3Dy
>CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
>CONFIG_THREAD_INFO_IN_TASK=3Dy
>
>#
># General setup
>#
>CONFIG_INIT_ENV_ARG_LIMIT=3D32
>CONFIG_CROSS_COMPILE=3D""
># CONFIG_COMPILE_TEST is not set
>CONFIG_LOCALVERSION=3D""
>CONFIG_LOCALVERSION_AUTO=3Dy
>CONFIG_HAVE_KERNEL_GZIP=3Dy
>CONFIG_HAVE_KERNEL_BZIP2=3Dy
>CONFIG_HAVE_KERNEL_LZMA=3Dy
>CONFIG_HAVE_KERNEL_XZ=3Dy
>CONFIG_HAVE_KERNEL_LZO=3Dy
>CONFIG_HAVE_KERNEL_LZ4=3Dy
>CONFIG_KERNEL_GZIP=3Dy
># CONFIG_KERNEL_BZIP2 is not set
># CONFIG_KERNEL_LZMA is not set
># CONFIG_KERNEL_XZ is not set
># CONFIG_KERNEL_LZO is not set
># CONFIG_KERNEL_LZ4 is not set
>CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>CONFIG_SWAP=3Dy
># CONFIG_SYSVIPC is not set
># CONFIG_POSIX_MQUEUE is not set
># CONFIG_CROSS_MEMORY_ATTACH is not set
># CONFIG_USELIB is not set
># CONFIG_AUDIT is not set
>CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>
>#
># IRQ subsystem
>#
>CONFIG_GENERIC_IRQ_PROBE=3Dy
>CONFIG_GENERIC_IRQ_SHOW=3Dy
>CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
>CONFIG_GENERIC_PENDING_IRQ=3Dy
>CONFIG_GENERIC_IRQ_MIGRATION=3Dy
>CONFIG_GENERIC_IRQ_CHIP=3Dy
>CONFIG_IRQ_DOMAIN=3Dy
>CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>CONFIG_GENERIC_MSI_IRQ=3Dy
>CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
>CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
>CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
>CONFIG_IRQ_DOMAIN_DEBUG=3Dy
>CONFIG_IRQ_FORCED_THREADING=3Dy
>CONFIG_SPARSE_IRQ=3Dy
>CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
>CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
>CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
>CONFIG_GENERIC_TIME_VSYSCALL=3Dy
>CONFIG_GENERIC_CLOCKEVENTS=3Dy
>CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
>CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
>CONFIG_GENERIC_CMOS_UPDATE=3Dy
>
>#
># Timers subsystem
>#
>CONFIG_TICK_ONESHOT=3Dy
>CONFIG_HZ_PERIODIC=3Dy
># CONFIG_NO_HZ_IDLE is not set
># CONFIG_NO_HZ_FULL is not set
># CONFIG_NO_HZ is not set
>CONFIG_HIGH_RES_TIMERS=3Dy
>
>#
># CPU/Task time and stats accounting
>#
>CONFIG_TICK_CPU_ACCOUNTING=3Dy
># CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
># CONFIG_IRQ_TIME_ACCOUNTING is not set
># CONFIG_BSD_PROCESS_ACCT is not set
># CONFIG_TASKSTATS is not set
># CONFIG_CPU_ISOLATION is not set
>
>#
># RCU Subsystem
>#
>CONFIG_TREE_RCU=3Dy
># CONFIG_RCU_EXPERT is not set
>CONFIG_SRCU=3Dy
>CONFIG_TREE_SRCU=3Dy
>CONFIG_TASKS_RCU=3Dy
>CONFIG_RCU_STALL_COMMON=3Dy
>CONFIG_RCU_NEED_SEGCBLIST=3Dy
>CONFIG_BUILD_BIN2C=3Dy
>CONFIG_IKCONFIG=3Dy
>CONFIG_IKCONFIG_PROC=3Dy
>CONFIG_LOG_BUF_SHIFT=3D20
>CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
>CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
>CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
>CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>CONFIG_ARCH_SUPPORTS_INT128=3Dy
>CONFIG_CGROUPS=3Dy
>CONFIG_PAGE_COUNTER=3Dy
>CONFIG_MEMCG=3Dy
>CONFIG_MEMCG_SWAP=3Dy
>CONFIG_MEMCG_SWAP_ENABLED=3Dy
># CONFIG_BLK_CGROUP is not set
>CONFIG_CGROUP_SCHED=3Dy
>CONFIG_FAIR_GROUP_SCHED=3Dy
># CONFIG_CFS_BANDWIDTH is not set
># CONFIG_RT_GROUP_SCHED is not set
># CONFIG_CGROUP_PIDS is not set
>CONFIG_CGROUP_RDMA=3Dy
># CONFIG_CGROUP_FREEZER is not set
>CONFIG_CPUSETS=3Dy
># CONFIG_PROC_PID_CPUSET is not set
># CONFIG_CGROUP_DEVICE is not set
># CONFIG_CGROUP_CPUACCT is not set
>CONFIG_CGROUP_PERF=3Dy
># CONFIG_CGROUP_BPF is not set
># CONFIG_CGROUP_DEBUG is not set
># CONFIG_SOCK_CGROUP_DATA is not set
># CONFIG_NAMESPACES is not set
>CONFIG_SCHED_AUTOGROUP=3Dy
># CONFIG_SYSFS_DEPRECATED is not set
>CONFIG_RELAY=3Dy
>CONFIG_BLK_DEV_INITRD=3Dy
>CONFIG_INITRAMFS_SOURCE=3D""
>CONFIG_RD_GZIP=3Dy
>CONFIG_RD_BZIP2=3Dy
>CONFIG_RD_LZMA=3Dy
>CONFIG_RD_XZ=3Dy
>CONFIG_RD_LZO=3Dy
>CONFIG_RD_LZ4=3Dy
>CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
># CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>CONFIG_ANON_INODES=3Dy
>CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>CONFIG_BPF=3Dy
>CONFIG_EXPERT=3Dy
>CONFIG_MULTIUSER=3Dy
>CONFIG_SGETMASK_SYSCALL=3Dy
>CONFIG_SYSFS_SYSCALL=3Dy
>CONFIG_FHANDLE=3Dy
># CONFIG_POSIX_TIMERS is not set
>CONFIG_PRINTK=3Dy
>CONFIG_PRINTK_NMI=3Dy
>CONFIG_BUG=3Dy
># CONFIG_ELF_CORE is not set
>CONFIG_PCSPKR_PLATFORM=3Dy
># CONFIG_BASE_FULL is not set
>CONFIG_FUTEX=3Dy
>CONFIG_FUTEX_PI=3Dy
>CONFIG_EPOLL=3Dy
>CONFIG_SIGNALFD=3Dy
>CONFIG_TIMERFD=3Dy
>CONFIG_EVENTFD=3Dy
>CONFIG_SHMEM=3Dy
>CONFIG_AIO=3Dy
>CONFIG_ADVISE_SYSCALLS=3Dy
># CONFIG_MEMBARRIER is not set
>CONFIG_CHECKPOINT_RESTORE=3Dy
>CONFIG_KALLSYMS=3Dy
># CONFIG_KALLSYMS_ALL is not set
>CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
>CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>CONFIG_BPF_SYSCALL=3Dy
>CONFIG_USERFAULTFD=3Dy
>CONFIG_EMBEDDED=3Dy
>CONFIG_HAVE_PERF_EVENTS=3Dy
>CONFIG_PERF_USE_VMALLOC=3Dy
># CONFIG_PC104 is not set
>
>#
># Kernel Performance Events And Counters
>#
>CONFIG_PERF_EVENTS=3Dy
>CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
>CONFIG_VM_EVENT_COUNTERS=3Dy
>CONFIG_COMPAT_BRK=3Dy
>CONFIG_SLAB=3Dy
># CONFIG_SLUB is not set
># CONFIG_SLOB is not set
># CONFIG_SLAB_MERGE_DEFAULT is not set
>CONFIG_SLAB_FREELIST_RANDOM=3Dy
>CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
>CONFIG_PROFILING=3Dy
>CONFIG_TRACEPOINTS=3Dy
>CONFIG_OPROFILE=3Dy
>CONFIG_OPROFILE_EVENT_MULTIPLEX=3Dy
>CONFIG_HAVE_OPROFILE=3Dy
>CONFIG_OPROFILE_NMI_TIMER=3Dy
># CONFIG_JUMP_LABEL is not set
>CONFIG_UPROBES=3Dy
># CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
>CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>CONFIG_HAVE_IOREMAP_PROT=3Dy
>CONFIG_HAVE_KPROBES=3Dy
>CONFIG_HAVE_KRETPROBES=3Dy
>CONFIG_HAVE_OPTPROBES=3Dy
>CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>CONFIG_HAVE_NMI=3Dy
>CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
>CONFIG_ARCH_HAS_SET_MEMORY=3Dy
>CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>CONFIG_HAVE_CLK=3Dy
>CONFIG_HAVE_DMA_API_DEBUG=3Dy
>CONFIG_HAVE_HW_BREAKPOINT=3Dy
>CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
>CONFIG_HAVE_PERF_REGS=3Dy
>CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>CONFIG_HAVE_RCU_TABLE_FREE=3Dy
>CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>CONFIG_SECCOMP_FILTER=3Dy
>CONFIG_HAVE_GCC_PLUGINS=3Dy
># CONFIG_GCC_PLUGINS is not set
>CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
>CONFIG_CC_STACKPROTECTOR=3Dy
># CONFIG_CC_STACKPROTECTOR_NONE is not set
># CONFIG_CC_STACKPROTECTOR_REGULAR is not set
>CONFIG_CC_STACKPROTECTOR_STRONG=3Dy
>CONFIG_THIN_ARCHIVES=3Dy
>CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>CONFIG_HAVE_CONTEXT_TRACKING=3Dy
>CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
>CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
>CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
>CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
>CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
>CONFIG_MODULES_USE_ELF_RELA=3Dy
>CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
>CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>CONFIG_HAVE_EXIT_THREAD=3Dy
>CONFIG_ARCH_MMAP_RND_BITS=3D28
>CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>CONFIG_HAVE_STACK_VALIDATION=3Dy
># CONFIG_HAVE_ARCH_HASH is not set
>CONFIG_ISA_BUS_API=3Dy
># CONFIG_CPU_NO_EFFICIENT_FFS is not set
>CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
># CONFIG_VMAP_STACK is not set
># CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
># CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
>CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
>CONFIG_STRICT_KERNEL_RWX=3Dy
>CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
>CONFIG_ARCH_HAS_REFCOUNT=3Dy
>CONFIG_REFCOUNT_FULL=3Dy
>
>#
># GCOV-based kernel profiling
>#
>CONFIG_GCOV_KERNEL=3Dy
>CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
># CONFIG_GCOV_PROFILE_ALL is not set
># CONFIG_GCOV_FORMAT_AUTODETECT is not set
>CONFIG_GCOV_FORMAT_3_4=3Dy
># CONFIG_GCOV_FORMAT_4_7 is not set
># CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
>CONFIG_RT_MUTEXES=3Dy
>CONFIG_BASE_SMALL=3D1
># CONFIG_MODULES is not set
>CONFIG_MODULES_TREE_LOOKUP=3Dy
>CONFIG_BLOCK=3Dy
>CONFIG_BLK_SCSI_REQUEST=3Dy
>CONFIG_BLK_DEV_BSG=3Dy
># CONFIG_BLK_DEV_BSGLIB is not set
>CONFIG_BLK_DEV_INTEGRITY=3Dy
># CONFIG_BLK_DEV_ZONED is not set
>CONFIG_BLK_CMDLINE_PARSER=3Dy
># CONFIG_BLK_WBT is not set
># CONFIG_BLK_DEBUG_FS is not set
># CONFIG_BLK_SED_OPAL is not set
>
>#
># Partition Types
>#
>CONFIG_PARTITION_ADVANCED=3Dy
># CONFIG_ACORN_PARTITION is not set
>CONFIG_AIX_PARTITION=3Dy
>CONFIG_OSF_PARTITION=3Dy
>CONFIG_AMIGA_PARTITION=3Dy
># CONFIG_ATARI_PARTITION is not set
>CONFIG_MAC_PARTITION=3Dy
># CONFIG_MSDOS_PARTITION is not set
>CONFIG_LDM_PARTITION=3Dy
># CONFIG_LDM_DEBUG is not set
># CONFIG_SGI_PARTITION is not set
>CONFIG_ULTRIX_PARTITION=3Dy
>CONFIG_SUN_PARTITION=3Dy
>CONFIG_KARMA_PARTITION=3Dy
># CONFIG_EFI_PARTITION is not set
>CONFIG_SYSV68_PARTITION=3Dy
># CONFIG_CMDLINE_PARTITION is not set
>CONFIG_BLK_MQ_PCI=3Dy
>CONFIG_BLK_MQ_VIRTIO=3Dy
>
>#
># IO Schedulers
>#
>CONFIG_IOSCHED_NOOP=3Dy
>CONFIG_IOSCHED_DEADLINE=3Dy
>CONFIG_IOSCHED_CFQ=3Dy
># CONFIG_DEFAULT_DEADLINE is not set
># CONFIG_DEFAULT_CFQ is not set
>CONFIG_DEFAULT_NOOP=3Dy
>CONFIG_DEFAULT_IOSCHED=3D"noop"
>CONFIG_MQ_IOSCHED_DEADLINE=3Dy
>CONFIG_MQ_IOSCHED_KYBER=3Dy
>CONFIG_IOSCHED_BFQ=3Dy
>CONFIG_ASN1=3Dy
>CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
>CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
>CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
>CONFIG_LOCK_SPIN_ON_OWNER=3Dy
>CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>CONFIG_QUEUED_SPINLOCKS=3Dy
>CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>CONFIG_QUEUED_RWLOCKS=3Dy
># CONFIG_FREEZER is not set
>
>#
># Processor type and features
>#
>CONFIG_ZONE_DMA=3Dy
>CONFIG_SMP=3Dy
>CONFIG_X86_FEATURE_NAMES=3Dy
>CONFIG_X86_FAST_FEATURE_TESTS=3Dy
># CONFIG_X86_X2APIC is not set
># CONFIG_X86_MPPARSE is not set
># CONFIG_GOLDFISH is not set
>CONFIG_X86_EXTENDED_PLATFORM=3Dy
># CONFIG_X86_VSMP is not set
># CONFIG_X86_GOLDFISH is not set
># CONFIG_X86_INTEL_MID is not set
># CONFIG_X86_INTEL_LPSS is not set
># CONFIG_X86_AMD_PLATFORM_DEVICE is not set
>CONFIG_IOSF_MBI=3Dy
># CONFIG_IOSF_MBI_DEBUG is not set
># CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>CONFIG_HYPERVISOR_GUEST=3Dy
>CONFIG_PARAVIRT=3Dy
># CONFIG_PARAVIRT_DEBUG is not set
># CONFIG_PARAVIRT_SPINLOCKS is not set
># CONFIG_XEN is not set
>CONFIG_KVM_GUEST=3Dy
># CONFIG_KVM_DEBUG_FS is not set
># CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>CONFIG_PARAVIRT_CLOCK=3Dy
>CONFIG_NO_BOOTMEM=3Dy
># CONFIG_MK8 is not set
># CONFIG_MPSC is not set
># CONFIG_MCORE2 is not set
># CONFIG_MATOM is not set
>CONFIG_GENERIC_CPU=3Dy
>CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
>CONFIG_X86_L1_CACHE_SHIFT=3D6
>CONFIG_X86_TSC=3Dy
>CONFIG_X86_CMPXCHG64=3Dy
>CONFIG_X86_CMOV=3Dy
>CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
>CONFIG_X86_DEBUGCTLMSR=3Dy
>CONFIG_PROCESSOR_SELECT=3Dy
># CONFIG_CPU_SUP_INTEL is not set
># CONFIG_CPU_SUP_AMD is not set
># CONFIG_CPU_SUP_CENTAUR is not set
>CONFIG_HPET_TIMER=3Dy
># CONFIG_DMI is not set
># CONFIG_CALGARY_IOMMU is not set
>CONFIG_SWIOTLB=3Dy
>CONFIG_IOMMU_HELPER=3Dy
>CONFIG_MAXSMP=3Dy
>CONFIG_NR_CPUS=3D8192
># CONFIG_SCHED_SMT is not set
># CONFIG_SCHED_MC is not set
>CONFIG_PREEMPT_NONE=3Dy
># CONFIG_PREEMPT_VOLUNTARY is not set
># CONFIG_PREEMPT is not set
>CONFIG_PREEMPT_COUNT=3Dy
>CONFIG_X86_LOCAL_APIC=3Dy
>CONFIG_X86_IO_APIC=3Dy
># CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
># CONFIG_X86_MCE is not set
>
>#
># Performance monitoring
>#
># CONFIG_VM86 is not set
># CONFIG_X86_16BIT is not set
>CONFIG_X86_VSYSCALL_EMULATION=3Dy
>CONFIG_I8K=3Dy
>CONFIG_X86_MSR=3Dy
>CONFIG_X86_CPUID=3Dy
># CONFIG_X86_5LEVEL is not set
>CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
>CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
>CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
># CONFIG_NUMA is not set
>CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
>CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
>CONFIG_SELECT_MEMORY_MODEL=3Dy
>CONFIG_SPARSEMEM_MANUAL=3Dy
>CONFIG_SPARSEMEM=3Dy
>CONFIG_HAVE_MEMORY_PRESENT=3Dy
>CONFIG_SPARSEMEM_EXTREME=3Dy
>CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
>CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
>CONFIG_SPARSEMEM_VMEMMAP=3Dy
>CONFIG_HAVE_MEMBLOCK=3Dy
>CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>CONFIG_HAVE_GENERIC_GUP=3Dy
>CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>CONFIG_MEMORY_ISOLATION=3Dy
># CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
># CONFIG_MEMORY_HOTPLUG is not set
>CONFIG_SPLIT_PTLOCK_CPUS=3D4
>CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
>CONFIG_MEMORY_BALLOON=3Dy
>CONFIG_BALLOON_COMPACTION=3Dy
>CONFIG_COMPACTION=3Dy
>CONFIG_MIGRATION=3Dy
>CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
>CONFIG_PHYS_ADDR_T_64BIT=3Dy
># CONFIG_BOUNCE is not set
>CONFIG_VIRT_TO_BUS=3Dy
>CONFIG_MMU_NOTIFIER=3Dy
>CONFIG_KSM=3Dy
>CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
># CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
>CONFIG_ARCH_WANTS_THP_SWAP=3Dy
>CONFIG_THP_SWAP=3Dy
>CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
># CONFIG_CLEANCACHE is not set
># CONFIG_FRONTSWAP is not set
>CONFIG_CMA=3Dy
># CONFIG_CMA_DEBUG is not set
>CONFIG_CMA_DEBUGFS=3Dy
>CONFIG_CMA_AREAS=3D7
># CONFIG_MEM_SOFT_DIRTY is not set
># CONFIG_ZPOOL is not set
>CONFIG_ZBUD=3Dy
># CONFIG_ZSMALLOC is not set
>CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
>CONFIG_IDLE_PAGE_TRACKING=3Dy
>CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
>CONFIG_PERCPU_STATS=3Dy
># CONFIG_GUP_BENCHMARK is not set
>CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
>CONFIG_X86_PMEM_LEGACY=3Dy
>CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
># CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
>CONFIG_X86_RESERVE_LOW=3D64
>CONFIG_MTRR=3Dy
># CONFIG_MTRR_SANITIZER is not set
># CONFIG_X86_PAT is not set
>CONFIG_ARCH_RANDOM=3Dy
># CONFIG_X86_SMAP is not set
># CONFIG_EFI is not set
>CONFIG_SECCOMP=3Dy
># CONFIG_HZ_100 is not set
>CONFIG_HZ_250=3Dy
># CONFIG_HZ_300 is not set
># CONFIG_HZ_1000 is not set
>CONFIG_HZ=3D250
>CONFIG_SCHED_HRTICK=3Dy
># CONFIG_KEXEC is not set
># CONFIG_KEXEC_FILE is not set
>CONFIG_CRASH_DUMP=3Dy
>CONFIG_PHYSICAL_START=3D0x1000000
>CONFIG_RELOCATABLE=3Dy
>CONFIG_RANDOMIZE_BASE=3Dy
>CONFIG_X86_NEED_RELOCS=3Dy
>CONFIG_PHYSICAL_ALIGN=3D0x200000
>CONFIG_RANDOMIZE_MEMORY=3Dy
>CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0x0
># CONFIG_HOTPLUG_CPU is not set
># CONFIG_LEGACY_VSYSCALL_NATIVE is not set
>CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
># CONFIG_LEGACY_VSYSCALL_NONE is not set
># CONFIG_CMDLINE_BOOL is not set
>CONFIG_MODIFY_LDT_SYSCALL=3Dy
>CONFIG_HAVE_LIVEPATCH=3Dy
>CONFIG_ARCH_HAS_ADD_PAGES=3Dy
>CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>
>#
># Power management and ACPI options
>#
># CONFIG_SUSPEND is not set
># CONFIG_HIBERNATION is not set
>CONFIG_PM=3Dy
># CONFIG_PM_DEBUG is not set
>CONFIG_PM_CLK=3Dy
>CONFIG_PM_GENERIC_DOMAINS=3Dy
>CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
>CONFIG_PM_GENERIC_DOMAINS_OF=3Dy
>CONFIG_ACPI=3Dy
>CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
># CONFIG_ACPI_DEBUGGER is not set
>CONFIG_ACPI_LPIT=3Dy
># CONFIG_ACPI_PROCFS_POWER is not set
>CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
># CONFIG_ACPI_EC_DEBUGFS is not set
>CONFIG_ACPI_AC=3Dy
>CONFIG_ACPI_BATTERY=3Dy
>CONFIG_ACPI_BUTTON=3Dy
>CONFIG_ACPI_VIDEO=3Dy
>CONFIG_ACPI_FAN=3Dy
># CONFIG_ACPI_DOCK is not set
>CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
>CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>CONFIG_ACPI_PROCESSOR=3Dy
># CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
>CONFIG_ACPI_THERMAL=3Dy
># CONFIG_ACPI_CUSTOM_DSDT is not set
>CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
>CONFIG_ACPI_TABLE_UPGRADE=3Dy
># CONFIG_ACPI_DEBUG is not set
># CONFIG_ACPI_PCI_SLOT is not set
>CONFIG_X86_PM_TIMER=3Dy
># CONFIG_ACPI_CONTAINER is not set
>CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
># CONFIG_ACPI_SBS is not set
># CONFIG_ACPI_HED is not set
># CONFIG_ACPI_CUSTOM_METHOD is not set
># CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
># CONFIG_ACPI_NFIT is not set
>CONFIG_HAVE_ACPI_APEI=3Dy
>CONFIG_HAVE_ACPI_APEI_NMI=3Dy
># CONFIG_ACPI_APEI is not set
># CONFIG_DPTF_POWER is not set
># CONFIG_PMIC_OPREGION is not set
># CONFIG_ACPI_CONFIGFS is not set
>CONFIG_SFI=3Dy
>
>#
># CPU Frequency scaling
>#
>CONFIG_CPU_FREQ=3Dy
>CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
>CONFIG_CPU_FREQ_GOV_COMMON=3Dy
># CONFIG_CPU_FREQ_STAT is not set
># CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
># CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
># CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
># CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
>CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
># CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
>CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
>CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
># CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
>CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
>CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
>
>#
># CPU frequency scaling drivers
>#
>CONFIG_CPUFREQ_DT=3Dy
>CONFIG_CPUFREQ_DT_PLATDEV=3Dy
># CONFIG_X86_INTEL_PSTATE is not set
># CONFIG_X86_PCC_CPUFREQ is not set
># CONFIG_X86_ACPI_CPUFREQ is not set
># CONFIG_X86_SPEEDSTEP_CENTRINO is not set
>CONFIG_X86_P4_CLOCKMOD=3Dy
>
>#
># shared options
>#
>CONFIG_X86_SPEEDSTEP_LIB=3Dy
>
>#
># CPU Idle
>#
>CONFIG_CPU_IDLE=3Dy
>CONFIG_CPU_IDLE_GOV_LADDER=3Dy
># CONFIG_CPU_IDLE_GOV_MENU is not set
># CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
>
>#
># Bus options (PCI etc.)
>#
>CONFIG_PCI=3Dy
>CONFIG_PCI_DIRECT=3Dy
># CONFIG_PCI_MMCONFIG is not set
>CONFIG_PCI_DOMAINS=3Dy
>CONFIG_PCI_CNB20LE_QUIRK=3Dy
>CONFIG_PCIEPORTBUS=3Dy
>CONFIG_HOTPLUG_PCI_PCIE=3Dy
>CONFIG_PCIEAER=3Dy
># CONFIG_PCIE_ECRC is not set
>CONFIG_PCIEAER_INJECT=3Dy
># CONFIG_PCIEASPM is not set
>CONFIG_PCIE_PME=3Dy
># CONFIG_PCIE_DPC is not set
>CONFIG_PCIE_PTM=3Dy
>CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
>CONFIG_PCI_MSI=3Dy
>CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
>CONFIG_PCI_QUIRKS=3Dy
># CONFIG_PCI_DEBUG is not set
>CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
>CONFIG_PCI_STUB=3Dy
># CONFIG_HT_IRQ is not set
>CONFIG_PCI_ATS=3Dy
>CONFIG_PCI_LOCKLESS_CONFIG=3Dy
>CONFIG_PCI_IOV=3Dy
># CONFIG_PCI_PRI is not set
># CONFIG_PCI_PASID is not set
>CONFIG_PCI_LABEL=3Dy
>CONFIG_HOTPLUG_PCI=3Dy
># CONFIG_HOTPLUG_PCI_ACPI is not set
>CONFIG_HOTPLUG_PCI_CPCI=3Dy
>CONFIG_HOTPLUG_PCI_CPCI_ZT5550=3Dy
>CONFIG_HOTPLUG_PCI_CPCI_GENERIC=3Dy
>CONFIG_HOTPLUG_PCI_SHPC=3Dy
>
>#
># DesignWare PCI Core Support
>#
># CONFIG_PCIE_DW_PLAT is not set
>
>#
># PCI host controller drivers
>#
># CONFIG_VMD is not set
>
>#
># PCI Endpoint
>#
>CONFIG_PCI_ENDPOINT=3Dy
># CONFIG_PCI_ENDPOINT_CONFIGFS is not set
># CONFIG_PCI_EPF_TEST is not set
>
>#
># PCI switch controller drivers
>#
># CONFIG_PCI_SW_SWITCHTEC is not set
>CONFIG_ISA_BUS=3Dy
># CONFIG_ISA_DMA_API is not set
>CONFIG_PCCARD=3Dy
># CONFIG_PCMCIA is not set
>CONFIG_CARDBUS=3Dy
>
>#
># PC-card bridges
>#
>CONFIG_YENTA=3Dy
># CONFIG_YENTA_O2 is not set
># CONFIG_YENTA_RICOH is not set
># CONFIG_YENTA_TI is not set
>CONFIG_YENTA_TOSHIBA=3Dy
># CONFIG_RAPIDIO is not set
># CONFIG_X86_SYSFB is not set
>
>#
># Executable file formats / Emulations
>#
>CONFIG_BINFMT_ELF=3Dy
>CONFIG_ELFCORE=3Dy
>CONFIG_BINFMT_SCRIPT=3Dy
># CONFIG_HAVE_AOUT is not set
>CONFIG_BINFMT_MISC=3Dy
>CONFIG_COREDUMP=3Dy
># CONFIG_IA32_EMULATION is not set
># CONFIG_X86_X32 is not set
>CONFIG_X86_DEV_DMA_OPS=3Dy
>CONFIG_NET=3Dy
>
>#
># Networking options
>#
># CONFIG_PACKET is not set
>CONFIG_UNIX=3Dy
># CONFIG_UNIX_DIAG is not set
># CONFIG_NET_KEY is not set
># CONFIG_INET is not set
># CONFIG_NETWORK_SECMARK is not set
># CONFIG_NET_PTP_CLASSIFY is not set
># CONFIG_NETWORK_PHY_TIMESTAMPING is not set
># CONFIG_NETFILTER is not set
># CONFIG_ATM is not set
># CONFIG_BRIDGE is not set
># CONFIG_VLAN_8021Q is not set
># CONFIG_DECNET is not set
># CONFIG_LLC2 is not set
># CONFIG_IPX is not set
># CONFIG_ATALK is not set
># CONFIG_X25 is not set
># CONFIG_LAPB is not set
># CONFIG_PHONET is not set
># CONFIG_IEEE802154 is not set
># CONFIG_NET_SCHED is not set
># CONFIG_DCB is not set
># CONFIG_DNS_RESOLVER is not set
># CONFIG_BATMAN_ADV is not set
># CONFIG_VSOCKETS is not set
># CONFIG_NETLINK_DIAG is not set
># CONFIG_MPLS is not set
># CONFIG_NET_NSH is not set
># CONFIG_HSR is not set
>CONFIG_RPS=3Dy
>CONFIG_RFS_ACCEL=3Dy
>CONFIG_XPS=3Dy
># CONFIG_CGROUP_NET_PRIO is not set
># CONFIG_CGROUP_NET_CLASSID is not set
>CONFIG_NET_RX_BUSY_POLL=3Dy
>CONFIG_BQL=3Dy
># CONFIG_BPF_STREAM_PARSER is not set
>CONFIG_NET_FLOW_LIMIT=3Dy
>
>#
># Network testing
>#
># CONFIG_HAMRADIO is not set
># CONFIG_CAN is not set
># CONFIG_BT is not set
># CONFIG_STREAM_PARSER is not set
>CONFIG_WIRELESS=3Dy
># CONFIG_CFG80211 is not set
>CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
>CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
># CONFIG_LIB80211 is not set
>
>#
># CFG80211 needs to be enabled for MAC80211
>#
>CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
># CONFIG_WIMAX is not set
># CONFIG_RFKILL is not set
># CONFIG_NET_9P is not set
># CONFIG_CAIF is not set
># CONFIG_NFC is not set
># CONFIG_PSAMPLE is not set
># CONFIG_NET_IFE is not set
># CONFIG_LWTUNNEL is not set
># CONFIG_DST_CACHE is not set
># CONFIG_GRO_CELLS is not set
># CONFIG_NET_DEVLINK is not set
>CONFIG_MAY_USE_DEVLINK=3Dy
>CONFIG_HAVE_EBPF_JIT=3Dy
>
>#
># Device Drivers
>#
>
>#
># Generic Driver Options
>#
># CONFIG_UEVENT_HELPER is not set
>CONFIG_DEVTMPFS=3Dy
>CONFIG_DEVTMPFS_MOUNT=3Dy
>CONFIG_STANDALONE=3Dy
># CONFIG_PREVENT_FIRMWARE_BUILD is not set
>CONFIG_FW_LOADER=3Dy
>CONFIG_FIRMWARE_IN_KERNEL=3Dy
>CONFIG_EXTRA_FIRMWARE=3D""
>CONFIG_FW_LOADER_USER_HELPER=3Dy
>CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
>CONFIG_ALLOW_DEV_COREDUMP=3Dy
># CONFIG_DEBUG_DRIVER is not set
># CONFIG_DEBUG_DEVRES is not set
># CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
># CONFIG_SYS_HYPERVISOR is not set
># CONFIG_GENERIC_CPU_DEVICES is not set
>CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>CONFIG_REGMAP=3Dy
>CONFIG_REGMAP_I2C=3Dy
>CONFIG_REGMAP_MMIO=3Dy
>CONFIG_REGMAP_IRQ=3Dy
>CONFIG_REGMAP_HWSPINLOCK=3Dy
>CONFIG_DMA_SHARED_BUFFER=3Dy
>CONFIG_DMA_FENCE_TRACE=3Dy
># CONFIG_DMA_CMA is not set
>
>#
># Bus devices
>#
># CONFIG_SIMPLE_PM_BUS is not set
># CONFIG_CONNECTOR is not set
>CONFIG_MTD=3Dy
>CONFIG_MTD_REDBOOT_PARTS=3Dy
>CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
># CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
>CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
>CONFIG_MTD_CMDLINE_PARTS=3Dy
># CONFIG_MTD_OF_PARTS is not set
># CONFIG_MTD_AR7_PARTS is not set
>
>#
># Partition parsers
>#
>
>#
># User Modules And Translation Layers
>#
>CONFIG_MTD_BLKDEVS=3Dy
># CONFIG_MTD_BLOCK is not set
>CONFIG_MTD_BLOCK_RO=3Dy
># CONFIG_FTL is not set
># CONFIG_NFTL is not set
>CONFIG_INFTL=3Dy
>CONFIG_RFD_FTL=3Dy
>CONFIG_SSFDC=3Dy
>CONFIG_SM_FTL=3Dy
># CONFIG_MTD_OOPS is not set
>CONFIG_MTD_SWAP=3Dy
>CONFIG_MTD_PARTITIONED_MASTER=3Dy
>
>#
># RAM/ROM/Flash chip drivers
>#
>CONFIG_MTD_CFI=3Dy
>CONFIG_MTD_JEDECPROBE=3Dy
>CONFIG_MTD_GEN_PROBE=3Dy
># CONFIG_MTD_CFI_ADV_OPTIONS is not set
>CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
># CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
># CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
># CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
>CONFIG_MTD_CFI_I1=3Dy
>CONFIG_MTD_CFI_I2=3Dy
># CONFIG_MTD_CFI_I4 is not set
># CONFIG_MTD_CFI_I8 is not set
>CONFIG_MTD_CFI_INTELEXT=3Dy
># CONFIG_MTD_CFI_AMDSTD is not set
>CONFIG_MTD_CFI_STAA=3Dy
>CONFIG_MTD_CFI_UTIL=3Dy
>CONFIG_MTD_RAM=3Dy
>CONFIG_MTD_ROM=3Dy
># CONFIG_MTD_ABSENT is not set
>
>#
># Mapping drivers for chip access
>#
>CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
>CONFIG_MTD_PHYSMAP=3Dy
>CONFIG_MTD_PHYSMAP_COMPAT=3Dy
>CONFIG_MTD_PHYSMAP_START=3D0x8000000
>CONFIG_MTD_PHYSMAP_LEN=3D0
>CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
>CONFIG_MTD_PHYSMAP_OF=3Dy
>CONFIG_MTD_PHYSMAP_OF_VERSATILE=3Dy
>CONFIG_MTD_PHYSMAP_OF_GEMINI=3Dy
>CONFIG_MTD_SBC_GXX=3Dy
>CONFIG_MTD_AMD76XROM=3Dy
># CONFIG_MTD_ICHXROM is not set
>CONFIG_MTD_ESB2ROM=3Dy
>CONFIG_MTD_CK804XROM=3Dy
>CONFIG_MTD_SCB2_FLASH=3Dy
># CONFIG_MTD_NETtel is not set
>CONFIG_MTD_L440GX=3Dy
>CONFIG_MTD_PCI=3Dy
># CONFIG_MTD_GPIO_ADDR is not set
># CONFIG_MTD_INTEL_VR_NOR is not set
>CONFIG_MTD_PLATRAM=3Dy
>CONFIG_MTD_LATCH_ADDR=3Dy
>
>#
># Self-contained MTD device drivers
>#
>CONFIG_MTD_PMC551=3Dy
>CONFIG_MTD_PMC551_BUGFIX=3Dy
># CONFIG_MTD_PMC551_DEBUG is not set
># CONFIG_MTD_SLRAM is not set
># CONFIG_MTD_PHRAM is not set
>CONFIG_MTD_MTDRAM=3Dy
>CONFIG_MTDRAM_TOTAL_SIZE=3D4096
>CONFIG_MTDRAM_ERASE_SIZE=3D128
>CONFIG_MTD_BLOCK2MTD=3Dy
>
>#
># Disk-On-Chip Device Drivers
>#
>CONFIG_MTD_DOCG3=3Dy
>CONFIG_BCH_CONST_M=3D14
>CONFIG_BCH_CONST_T=3D4
>CONFIG_MTD_NAND_ECC=3Dy
># CONFIG_MTD_NAND_ECC_SMC is not set
>CONFIG_MTD_NAND=3Dy
># CONFIG_MTD_NAND_ECC_BCH is not set
># CONFIG_MTD_SM_COMMON is not set
>CONFIG_MTD_NAND_DENALI=3Dy
>CONFIG_MTD_NAND_DENALI_PCI=3Dy
># CONFIG_MTD_NAND_DENALI_DT is not set
>CONFIG_MTD_NAND_GPIO=3Dy
># CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
># CONFIG_MTD_NAND_RICOH is not set
># CONFIG_MTD_NAND_DISKONCHIP is not set
>CONFIG_MTD_NAND_DOCG4=3Dy
>CONFIG_MTD_NAND_CAFE=3Dy
>CONFIG_MTD_NAND_NANDSIM=3Dy
>CONFIG_MTD_NAND_PLATFORM=3Dy
># CONFIG_MTD_ONENAND is not set
>
>#
># LPDDR & LPDDR2 PCM memory drivers
>#
>CONFIG_MTD_LPDDR=3Dy
>CONFIG_MTD_QINFO_PROBE=3Dy
>CONFIG_MTD_SPI_NOR=3Dy
>CONFIG_MTD_MT81xx_NOR=3Dy
>CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
>CONFIG_SPI_INTEL_SPI=3Dy
>CONFIG_SPI_INTEL_SPI_PCI=3Dy
># CONFIG_SPI_INTEL_SPI_PLATFORM is not set
>CONFIG_MTD_UBI=3Dy
>CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
>CONFIG_MTD_UBI_BEB_LIMIT=3D20
>CONFIG_MTD_UBI_FASTMAP=3Dy
>CONFIG_MTD_UBI_GLUEBI=3Dy
>CONFIG_MTD_UBI_BLOCK=3Dy
>CONFIG_OF=3Dy
># CONFIG_OF_UNITTEST is not set
>CONFIG_OF_KOBJ=3Dy
>CONFIG_OF_DYNAMIC=3Dy
>CONFIG_OF_ADDRESS=3Dy
>CONFIG_OF_ADDRESS_PCI=3Dy
>CONFIG_OF_IRQ=3Dy
>CONFIG_OF_PCI=3Dy
>CONFIG_OF_PCI_IRQ=3Dy
>CONFIG_OF_RESOLVE=3Dy
>CONFIG_OF_OVERLAY=3Dy
>CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>CONFIG_PARPORT=3Dy
>CONFIG_PARPORT_PC=3Dy
># CONFIG_PARPORT_SERIAL is not set
># CONFIG_PARPORT_PC_FIFO is not set
>CONFIG_PARPORT_PC_SUPERIO=3Dy
># CONFIG_PARPORT_GSC is not set
># CONFIG_PARPORT_AX88796 is not set
># CONFIG_PARPORT_1284 is not set
>CONFIG_PNP=3Dy
>CONFIG_PNP_DEBUG_MESSAGES=3Dy
>
>#
># Protocols
>#
>CONFIG_PNPACPI=3Dy
>CONFIG_BLK_DEV=3Dy
>CONFIG_BLK_DEV_NULL_BLK=3Dy
>CONFIG_CDROM=3Dy
># CONFIG_PARIDE is not set
># CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
># CONFIG_BLK_DEV_DAC960 is not set
># CONFIG_BLK_DEV_UMEM is not set
># CONFIG_BLK_DEV_COW_COMMON is not set
># CONFIG_BLK_DEV_LOOP is not set
>
>#
># DRBD disabled because PROC_FS or INET not selected
>#
># CONFIG_BLK_DEV_NBD is not set
>CONFIG_BLK_DEV_SKD=3Dy
>CONFIG_BLK_DEV_SX8=3Dy
>CONFIG_BLK_DEV_RAM=3Dy
>CONFIG_BLK_DEV_RAM_COUNT=3D16
>CONFIG_BLK_DEV_RAM_SIZE=3D4096
>CONFIG_CDROM_PKTCDVD=3Dy
>CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
>CONFIG_CDROM_PKTCDVD_WCACHE=3Dy
># CONFIG_ATA_OVER_ETH is not set
>CONFIG_VIRTIO_BLK=3Dy
># CONFIG_VIRTIO_BLK_SCSI is not set
>CONFIG_BLK_DEV_RSXX=3Dy
>
>#
># NVME Support
>#
>CONFIG_NVME_CORE=3Dy
># CONFIG_BLK_DEV_NVME is not set
># CONFIG_NVME_MULTIPATH is not set
>CONFIG_NVME_FABRICS=3Dy
>CONFIG_NVME_FC=3Dy
>CONFIG_NVME_TARGET=3Dy
>CONFIG_NVME_TARGET_LOOP=3Dy
># CONFIG_NVME_TARGET_FC is not set
>
>#
># Misc devices
>#
>CONFIG_SENSORS_LIS3LV02D=3Dy
># CONFIG_AD525X_DPOT is not set
>CONFIG_DUMMY_IRQ=3Dy
>CONFIG_IBM_ASM=3Dy
># CONFIG_PHANTOM is not set
>CONFIG_SGI_IOC4=3Dy
># CONFIG_TIFM_CORE is not set
>CONFIG_ICS932S401=3Dy
># CONFIG_ENCLOSURE_SERVICES is not set
>CONFIG_HP_ILO=3Dy
># CONFIG_APDS9802ALS is not set
>CONFIG_ISL29003=3Dy
># CONFIG_ISL29020 is not set
># CONFIG_SENSORS_TSL2550 is not set
>CONFIG_SENSORS_BH1770=3Dy
>CONFIG_SENSORS_APDS990X=3Dy
># CONFIG_HMC6352 is not set
># CONFIG_DS1682 is not set
># CONFIG_VMWARE_BALLOON is not set
>CONFIG_USB_SWITCH_FSA9480=3Dy
>CONFIG_SRAM=3Dy
>CONFIG_PCI_ENDPOINT_TEST=3Dy
>CONFIG_C2PORT=3Dy
>CONFIG_C2PORT_DURAMAR_2150=3Dy
>
>#
># EEPROM support
>#
>CONFIG_EEPROM_AT24=3Dy
>CONFIG_EEPROM_LEGACY=3Dy
>CONFIG_EEPROM_MAX6875=3Dy
>CONFIG_EEPROM_93CX6=3Dy
>CONFIG_EEPROM_IDT_89HPESX=3Dy
>CONFIG_CB710_CORE=3Dy
>CONFIG_CB710_DEBUG=3Dy
>CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>
>#
># Texas Instruments shared transport line discipline
>#
># CONFIG_TI_ST is not set
>CONFIG_SENSORS_LIS3_I2C=3Dy
>CONFIG_ALTERA_STAPL=3Dy
>CONFIG_INTEL_MEI=3Dy
>CONFIG_INTEL_MEI_ME=3Dy
>CONFIG_INTEL_MEI_TXE=3Dy
>CONFIG_VMWARE_VMCI=3Dy
>
>#
># Intel MIC & related support
>#
>
>#
># Intel MIC Bus Driver
>#
># CONFIG_INTEL_MIC_BUS is not set
>
>#
># SCIF Bus Driver
>#
>CONFIG_SCIF_BUS=3Dy
>
>#
># VOP Bus Driver
>#
>CONFIG_VOP_BUS=3Dy
>
>#
># Intel MIC Host Driver
>#
>
>#
># Intel MIC Card Driver
>#
>
>#
># SCIF Driver
>#
># CONFIG_SCIF is not set
>
>#
># Intel MIC Coprocessor State Management (COSM) Drivers
>#
>
>#
># VOP Driver
>#
># CONFIG_VOP is not set
>CONFIG_GENWQE=3Dy
>CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=3D0
>CONFIG_ECHO=3Dy
># CONFIG_CXL_BASE is not set
># CONFIG_CXL_AFU_DRIVER_OPS is not set
># CONFIG_CXL_LIB is not set
>CONFIG_HAVE_IDE=3Dy
># CONFIG_IDE is not set
>
>#
># SCSI device support
>#
>CONFIG_SCSI_MOD=3Dy
>CONFIG_RAID_ATTRS=3Dy
># CONFIG_SCSI is not set
># CONFIG_SCSI_DMA is not set
># CONFIG_SCSI_NETLINK is not set
># CONFIG_ATA is not set
>CONFIG_MD=3Dy
>CONFIG_BLK_DEV_MD=3Dy
># CONFIG_MD_AUTODETECT is not set
>CONFIG_MD_LINEAR=3Dy
>CONFIG_MD_RAID0=3Dy
>CONFIG_MD_RAID1=3Dy
>CONFIG_MD_RAID10=3Dy
>CONFIG_MD_RAID456=3Dy
># CONFIG_MD_MULTIPATH is not set
># CONFIG_MD_FAULTY is not set
>CONFIG_BCACHE=3Dy
>CONFIG_BCACHE_DEBUG=3Dy
>CONFIG_BCACHE_CLOSURES_DEBUG=3Dy
>CONFIG_BLK_DEV_DM_BUILTIN=3Dy
>CONFIG_BLK_DEV_DM=3Dy
># CONFIG_DM_MQ_DEFAULT is not set
>CONFIG_DM_DEBUG=3Dy
>CONFIG_DM_BUFIO=3Dy
># CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
>CONFIG_DM_BIO_PRISON=3Dy
>CONFIG_DM_PERSISTENT_DATA=3Dy
>CONFIG_DM_CRYPT=3Dy
># CONFIG_DM_SNAPSHOT is not set
># CONFIG_DM_THIN_PROVISIONING is not set
>CONFIG_DM_CACHE=3Dy
># CONFIG_DM_CACHE_SMQ is not set
># CONFIG_DM_ERA is not set
>CONFIG_DM_MIRROR=3Dy
># CONFIG_DM_LOG_USERSPACE is not set
>CONFIG_DM_RAID=3Dy
>CONFIG_DM_ZERO=3Dy
>CONFIG_DM_MULTIPATH=3Dy
>CONFIG_DM_MULTIPATH_QL=3Dy
>CONFIG_DM_MULTIPATH_ST=3Dy
>CONFIG_DM_DELAY=3Dy
>CONFIG_DM_UEVENT=3Dy
># CONFIG_DM_FLAKEY is not set
>CONFIG_DM_VERITY=3Dy
>CONFIG_DM_VERITY_FEC=3Dy
>CONFIG_DM_SWITCH=3Dy
># CONFIG_DM_LOG_WRITES is not set
>CONFIG_DM_INTEGRITY=3Dy
>CONFIG_FUSION=3Dy
>CONFIG_FUSION_MAX_SGE=3D128
>CONFIG_FUSION_LOGGING=3Dy
>
>#
># IEEE 1394 (FireWire) support
>#
># CONFIG_FIREWIRE is not set
>CONFIG_FIREWIRE_NOSY=3Dy
># CONFIG_MACINTOSH_DRIVERS is not set
># CONFIG_NETDEVICES is not set
># CONFIG_NVM is not set
>
>#
># Input device support
>#
>CONFIG_INPUT=3Dy
># CONFIG_INPUT_LEDS is not set
>CONFIG_INPUT_FF_MEMLESS=3Dy
>CONFIG_INPUT_POLLDEV=3Dy
># CONFIG_INPUT_SPARSEKMAP is not set
># CONFIG_INPUT_MATRIXKMAP is not set
>
>#
># Userland interfaces
>#
>CONFIG_INPUT_MOUSEDEV=3Dy
>CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
>CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
>CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
>CONFIG_INPUT_JOYDEV=3Dy
># CONFIG_INPUT_EVDEV is not set
>CONFIG_INPUT_EVBUG=3Dy
>
>#
># Input Device Drivers
>#
>CONFIG_INPUT_KEYBOARD=3Dy
># CONFIG_KEYBOARD_ADC is not set
># CONFIG_KEYBOARD_ADP5520 is not set
># CONFIG_KEYBOARD_ADP5588 is not set
># CONFIG_KEYBOARD_ADP5589 is not set
>CONFIG_KEYBOARD_ATKBD=3Dy
># CONFIG_KEYBOARD_QT1070 is not set
># CONFIG_KEYBOARD_QT2160 is not set
># CONFIG_KEYBOARD_DLINK_DIR685 is not set
># CONFIG_KEYBOARD_LKKBD is not set
># CONFIG_KEYBOARD_GPIO is not set
># CONFIG_KEYBOARD_GPIO_POLLED is not set
># CONFIG_KEYBOARD_TCA6416 is not set
># CONFIG_KEYBOARD_TCA8418 is not set
># CONFIG_KEYBOARD_MATRIX is not set
># CONFIG_KEYBOARD_LM8323 is not set
># CONFIG_KEYBOARD_LM8333 is not set
># CONFIG_KEYBOARD_MAX7359 is not set
># CONFIG_KEYBOARD_MCS is not set
># CONFIG_KEYBOARD_MPR121 is not set
># CONFIG_KEYBOARD_NEWTON is not set
># CONFIG_KEYBOARD_OPENCORES is not set
># CONFIG_KEYBOARD_SAMSUNG is not set
># CONFIG_KEYBOARD_STOWAWAY is not set
># CONFIG_KEYBOARD_SUNKBD is not set
># CONFIG_KEYBOARD_OMAP4 is not set
># CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
># CONFIG_KEYBOARD_XTKBD is not set
># CONFIG_KEYBOARD_CAP11XX is not set
># CONFIG_KEYBOARD_BCM is not set
>CONFIG_INPUT_MOUSE=3Dy
># CONFIG_MOUSE_PS2 is not set
>CONFIG_MOUSE_SERIAL=3Dy
># CONFIG_MOUSE_APPLETOUCH is not set
># CONFIG_MOUSE_BCM5974 is not set
>CONFIG_MOUSE_CYAPA=3Dy
>CONFIG_MOUSE_ELAN_I2C=3Dy
>CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
>CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
>CONFIG_MOUSE_VSXXXAA=3Dy
>CONFIG_MOUSE_GPIO=3Dy
># CONFIG_MOUSE_SYNAPTICS_I2C is not set
># CONFIG_MOUSE_SYNAPTICS_USB is not set
>CONFIG_INPUT_JOYSTICK=3Dy
>CONFIG_JOYSTICK_ANALOG=3Dy
>CONFIG_JOYSTICK_A3D=3Dy
>CONFIG_JOYSTICK_ADI=3Dy
>CONFIG_JOYSTICK_COBRA=3Dy
>CONFIG_JOYSTICK_GF2K=3Dy
>CONFIG_JOYSTICK_GRIP=3Dy
># CONFIG_JOYSTICK_GRIP_MP is not set
>CONFIG_JOYSTICK_GUILLEMOT=3Dy
>CONFIG_JOYSTICK_INTERACT=3Dy
># CONFIG_JOYSTICK_SIDEWINDER is not set
>CONFIG_JOYSTICK_TMDC=3Dy
># CONFIG_JOYSTICK_IFORCE is not set
># CONFIG_JOYSTICK_WARRIOR is not set
>CONFIG_JOYSTICK_MAGELLAN=3Dy
># CONFIG_JOYSTICK_SPACEORB is not set
>CONFIG_JOYSTICK_SPACEBALL=3Dy
>CONFIG_JOYSTICK_STINGER=3Dy
>CONFIG_JOYSTICK_TWIDJOY=3Dy
># CONFIG_JOYSTICK_ZHENHUA is not set
>CONFIG_JOYSTICK_DB9=3Dy
>CONFIG_JOYSTICK_GAMECON=3Dy
>CONFIG_JOYSTICK_TURBOGRAFX=3Dy
>CONFIG_JOYSTICK_AS5011=3Dy
>CONFIG_JOYSTICK_JOYDUMP=3Dy
># CONFIG_JOYSTICK_XPAD is not set
>CONFIG_JOYSTICK_WALKERA0701=3Dy
>CONFIG_INPUT_TABLET=3Dy
># CONFIG_TABLET_USB_ACECAD is not set
># CONFIG_TABLET_USB_AIPTEK is not set
># CONFIG_TABLET_USB_HANWANG is not set
># CONFIG_TABLET_USB_KBTAB is not set
># CONFIG_TABLET_USB_PEGASUS is not set
>CONFIG_TABLET_SERIAL_WACOM4=3Dy
>CONFIG_INPUT_TOUCHSCREEN=3Dy
>CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
>CONFIG_TOUCHSCREEN_88PM860X=3Dy
>CONFIG_TOUCHSCREEN_AD7879=3Dy
>CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
>CONFIG_TOUCHSCREEN_AR1021_I2C=3Dy
>CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
># CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
>CONFIG_TOUCHSCREEN_BU21013=3Dy
>CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=3Dy
>CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
># CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
># CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
>CONFIG_TOUCHSCREEN_DA9034=3Dy
>CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
>CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
>CONFIG_TOUCHSCREEN_EETI=3Dy
>CONFIG_TOUCHSCREEN_EGALAX=3Dy
># CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
># CONFIG_TOUCHSCREEN_EXC3000 is not set
>CONFIG_TOUCHSCREEN_FUJITSU=3Dy
>CONFIG_TOUCHSCREEN_GOODIX=3Dy
># CONFIG_TOUCHSCREEN_HIDEEP is not set
># CONFIG_TOUCHSCREEN_ILI210X is not set
># CONFIG_TOUCHSCREEN_S6SY761 is not set
>CONFIG_TOUCHSCREEN_GUNZE=3Dy
>CONFIG_TOUCHSCREEN_EKTF2127=3Dy
>CONFIG_TOUCHSCREEN_ELAN=3Dy
>CONFIG_TOUCHSCREEN_ELO=3Dy
>CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
>CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
>CONFIG_TOUCHSCREEN_MAX11801=3Dy
># CONFIG_TOUCHSCREEN_MCS5000 is not set
>CONFIG_TOUCHSCREEN_MMS114=3Dy
>CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
>CONFIG_TOUCHSCREEN_MTOUCH=3Dy
># CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
>CONFIG_TOUCHSCREEN_INEXIO=3Dy
>CONFIG_TOUCHSCREEN_MK712=3Dy
>CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
>CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
>CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
>CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
>CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
># CONFIG_TOUCHSCREEN_PIXCIR is not set
># CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
># CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
># CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
># CONFIG_TOUCHSCREEN_TSC_SERIO is not set
>CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
>CONFIG_TOUCHSCREEN_TSC2004=3Dy
># CONFIG_TOUCHSCREEN_TSC2007 is not set
>CONFIG_TOUCHSCREEN_RM_TS=3Dy
># CONFIG_TOUCHSCREEN_SILEAD is not set
>CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
>CONFIG_TOUCHSCREEN_ST1232=3Dy
>CONFIG_TOUCHSCREEN_STMFTS=3Dy
>CONFIG_TOUCHSCREEN_SX8654=3Dy
>CONFIG_TOUCHSCREEN_TPS6507X=3Dy
>CONFIG_TOUCHSCREEN_ZET6223=3Dy
>CONFIG_TOUCHSCREEN_ZFORCE=3Dy
># CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
>CONFIG_INPUT_MISC=3Dy
>CONFIG_INPUT_88PM860X_ONKEY=3Dy
># CONFIG_INPUT_88PM80X_ONKEY is not set
>CONFIG_INPUT_AD714X=3Dy
># CONFIG_INPUT_AD714X_I2C is not set
>CONFIG_INPUT_ATMEL_CAPTOUCH=3Dy
># CONFIG_INPUT_BMA150 is not set
>CONFIG_INPUT_E3X0_BUTTON=3Dy
>CONFIG_INPUT_PCSPKR=3Dy
>CONFIG_INPUT_MAX77693_HAPTIC=3Dy
>CONFIG_INPUT_MAX8925_ONKEY=3Dy
># CONFIG_INPUT_MAX8997_HAPTIC is not set
># CONFIG_INPUT_MMA8450 is not set
>CONFIG_INPUT_APANEL=3Dy
>CONFIG_INPUT_GP2A=3Dy
>CONFIG_INPUT_GPIO_BEEPER=3Dy
>CONFIG_INPUT_GPIO_TILT_POLLED=3Dy
># CONFIG_INPUT_GPIO_DECODER is not set
># CONFIG_INPUT_ATLAS_BTNS is not set
># CONFIG_INPUT_ATI_REMOTE2 is not set
># CONFIG_INPUT_KEYSPAN_REMOTE is not set
>CONFIG_INPUT_KXTJ9=3Dy
>CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
># CONFIG_INPUT_POWERMATE is not set
># CONFIG_INPUT_YEALINK is not set
># CONFIG_INPUT_CM109 is not set
># CONFIG_INPUT_REGULATOR_HAPTIC is not set
>CONFIG_INPUT_RETU_PWRBUTTON=3Dy
>CONFIG_INPUT_UINPUT=3Dy
>CONFIG_INPUT_PALMAS_PWRBUTTON=3Dy
>CONFIG_INPUT_PCF8574=3Dy
># CONFIG_INPUT_PWM_BEEPER is not set
>CONFIG_INPUT_PWM_VIBRA=3Dy
>CONFIG_INPUT_RK805_PWRKEY=3Dy
>CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
># CONFIG_INPUT_DA9063_ONKEY is not set
>CONFIG_INPUT_ADXL34X=3Dy
>CONFIG_INPUT_ADXL34X_I2C=3Dy
># CONFIG_INPUT_CMA3000 is not set
># CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
>CONFIG_INPUT_DRV260X_HAPTICS=3Dy
># CONFIG_INPUT_DRV2665_HAPTICS is not set
>CONFIG_INPUT_DRV2667_HAPTICS=3Dy
>CONFIG_RMI4_CORE=3Dy
>CONFIG_RMI4_I2C=3Dy
># CONFIG_RMI4_SMB is not set
>CONFIG_RMI4_F03=3Dy
>CONFIG_RMI4_F03_SERIO=3Dy
>CONFIG_RMI4_2D_SENSOR=3Dy
>CONFIG_RMI4_F11=3Dy
>CONFIG_RMI4_F12=3Dy
>CONFIG_RMI4_F30=3Dy
>CONFIG_RMI4_F34=3Dy
>CONFIG_RMI4_F55=3Dy
>
>#
># Hardware I/O ports
>#
>CONFIG_SERIO=3Dy
>CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>CONFIG_SERIO_I8042=3Dy
>CONFIG_SERIO_SERPORT=3Dy
># CONFIG_SERIO_CT82C710 is not set
>CONFIG_SERIO_PARKBD=3Dy
>CONFIG_SERIO_PCIPS2=3Dy
>CONFIG_SERIO_LIBPS2=3Dy
>CONFIG_SERIO_RAW=3Dy
># CONFIG_SERIO_ALTERA_PS2 is not set
>CONFIG_SERIO_PS2MULT=3Dy
>CONFIG_SERIO_ARC_PS2=3Dy
>CONFIG_SERIO_APBPS2=3Dy
>CONFIG_SERIO_GPIO_PS2=3Dy
>CONFIG_USERIO=3Dy
>CONFIG_GAMEPORT=3Dy
>CONFIG_GAMEPORT_NS558=3Dy
># CONFIG_GAMEPORT_L4 is not set
>CONFIG_GAMEPORT_EMU10K1=3Dy
># CONFIG_GAMEPORT_FM801 is not set
>
>#
># Character devices
>#
>CONFIG_TTY=3Dy
># CONFIG_VT is not set
>CONFIG_UNIX98_PTYS=3Dy
># CONFIG_LEGACY_PTYS is not set
>CONFIG_SERIAL_NONSTANDARD=3Dy
># CONFIG_ROCKETPORT is not set
>CONFIG_CYCLADES=3Dy
>CONFIG_CYZ_INTR=3Dy
>CONFIG_MOXA_INTELLIO=3Dy
>CONFIG_MOXA_SMARTIO=3Dy
># CONFIG_SYNCLINKMP is not set
>CONFIG_SYNCLINK_GT=3Dy
>CONFIG_NOZOMI=3Dy
>CONFIG_ISI=3Dy
>CONFIG_N_HDLC=3Dy
># CONFIG_N_GSM is not set
># CONFIG_TRACE_ROUTER is not set
>CONFIG_TRACE_SINK=3Dy
>CONFIG_DEVMEM=3Dy
>CONFIG_DEVKMEM=3Dy
>
>#
># Serial drivers
>#
>CONFIG_SERIAL_EARLYCON=3Dy
>CONFIG_SERIAL_8250=3Dy
>CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
>CONFIG_SERIAL_8250_PNP=3Dy
># CONFIG_SERIAL_8250_FINTEK is not set
>CONFIG_SERIAL_8250_CONSOLE=3Dy
>CONFIG_SERIAL_8250_PCI=3Dy
>CONFIG_SERIAL_8250_EXAR=3Dy
># CONFIG_SERIAL_8250_MEN_MCB is not set
>CONFIG_SERIAL_8250_NR_UARTS=3D4
>CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
># CONFIG_SERIAL_8250_EXTENDED is not set
># CONFIG_SERIAL_8250_ASPEED_VUART is not set
># CONFIG_SERIAL_8250_FSL is not set
># CONFIG_SERIAL_8250_DW is not set
># CONFIG_SERIAL_8250_RT288X is not set
>CONFIG_SERIAL_8250_LPSS=3Dy
>CONFIG_SERIAL_8250_MID=3Dy
># CONFIG_SERIAL_8250_MOXA is not set
># CONFIG_SERIAL_OF_PLATFORM is not set
>
>#
># Non-8250 serial port support
>#
>CONFIG_SERIAL_UARTLITE=3Dy
># CONFIG_SERIAL_UARTLITE_CONSOLE is not set
>CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
>CONFIG_SERIAL_CORE=3Dy
>CONFIG_SERIAL_CORE_CONSOLE=3Dy
>CONFIG_SERIAL_JSM=3Dy
># CONFIG_SERIAL_SCCNXP is not set
>CONFIG_SERIAL_SC16IS7XX=3Dy
># CONFIG_SERIAL_SC16IS7XX_I2C is not set
># CONFIG_SERIAL_ALTERA_JTAGUART is not set
>CONFIG_SERIAL_ALTERA_UART=3Dy
>CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
>CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
>CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
># CONFIG_SERIAL_XILINX_PS_UART is not set
>CONFIG_SERIAL_ARC=3Dy
>CONFIG_SERIAL_ARC_CONSOLE=3Dy
>CONFIG_SERIAL_ARC_NR_PORTS=3D1
>CONFIG_SERIAL_RP2=3Dy
>CONFIG_SERIAL_RP2_NR_UARTS=3D32
># CONFIG_SERIAL_FSL_LPUART is not set
># CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
># CONFIG_SERIAL_MEN_Z135 is not set
># CONFIG_SERIAL_DEV_BUS is not set
>CONFIG_TTY_PRINTK=3Dy
># CONFIG_PRINTER is not set
>CONFIG_PPDEV=3Dy
>CONFIG_HVC_DRIVER=3Dy
>CONFIG_VIRTIO_CONSOLE=3Dy
># CONFIG_IPMI_HANDLER is not set
>CONFIG_HW_RANDOM=3Dy
>CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
>CONFIG_HW_RANDOM_INTEL=3Dy
>CONFIG_HW_RANDOM_AMD=3Dy
>CONFIG_HW_RANDOM_VIA=3Dy
>CONFIG_HW_RANDOM_VIRTIO=3Dy
># CONFIG_HW_RANDOM_TPM is not set
># CONFIG_NVRAM is not set
># CONFIG_R3964 is not set
>CONFIG_APPLICOM=3Dy
># CONFIG_MWAVE is not set
>CONFIG_RAW_DRIVER=3Dy
>CONFIG_MAX_RAW_DEVS=3D256
># CONFIG_HPET is not set
>CONFIG_HANGCHECK_TIMER=3Dy
>CONFIG_TCG_TPM=3Dy
>CONFIG_TCG_TIS_CORE=3Dy
>CONFIG_TCG_TIS=3Dy
># CONFIG_TCG_TIS_I2C_ATMEL is not set
># CONFIG_TCG_TIS_I2C_INFINEON is not set
># CONFIG_TCG_TIS_I2C_NUVOTON is not set
>CONFIG_TCG_NSC=3Dy
>CONFIG_TCG_ATMEL=3Dy
># CONFIG_TCG_INFINEON is not set
># CONFIG_TCG_CRB is not set
>CONFIG_TCG_VTPM_PROXY=3Dy
>CONFIG_TCG_TIS_ST33ZP24=3Dy
>CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
># CONFIG_TELCLOCK is not set
># CONFIG_DEVPORT is not set
>CONFIG_XILLYBUS=3Dy
>CONFIG_XILLYBUS_PCIE=3Dy
>CONFIG_XILLYBUS_OF=3Dy
>
>#
># I2C support
>#
>CONFIG_I2C=3Dy
>CONFIG_ACPI_I2C_OPREGION=3Dy
>CONFIG_I2C_BOARDINFO=3Dy
>CONFIG_I2C_COMPAT=3Dy
>CONFIG_I2C_CHARDEV=3Dy
>CONFIG_I2C_MUX=3Dy
>
>#
># Multiplexer I2C Chip support
>#
>CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
>CONFIG_I2C_MUX_GPIO=3Dy
># CONFIG_I2C_MUX_GPMUX is not set
># CONFIG_I2C_MUX_LTC4306 is not set
>CONFIG_I2C_MUX_PCA9541=3Dy
>CONFIG_I2C_MUX_PCA954x=3Dy
># CONFIG_I2C_MUX_REG is not set
>CONFIG_I2C_MUX_MLXCPLD=3Dy
># CONFIG_I2C_HELPER_AUTO is not set
>CONFIG_I2C_SMBUS=3Dy
>
>#
># I2C Algorithms
>#
>CONFIG_I2C_ALGOBIT=3Dy
># CONFIG_I2C_ALGOPCF is not set
>CONFIG_I2C_ALGOPCA=3Dy
>
>#
># I2C Hardware Bus support
>#
>
>#
># PC SMBus host controller drivers
>#
># CONFIG_I2C_ALI1535 is not set
># CONFIG_I2C_ALI1563 is not set
>CONFIG_I2C_ALI15X3=3Dy
># CONFIG_I2C_AMD756 is not set
>CONFIG_I2C_AMD8111=3Dy
>CONFIG_I2C_I801=3Dy
>CONFIG_I2C_ISCH=3Dy
>CONFIG_I2C_ISMT=3Dy
># CONFIG_I2C_PIIX4 is not set
>CONFIG_I2C_NFORCE2=3Dy
>CONFIG_I2C_NFORCE2_S4985=3Dy
>CONFIG_I2C_SIS5595=3Dy
># CONFIG_I2C_SIS630 is not set
>CONFIG_I2C_SIS96X=3Dy
>CONFIG_I2C_VIA=3Dy
>CONFIG_I2C_VIAPRO=3Dy
>
>#
># ACPI drivers
>#
># CONFIG_I2C_SCMI is not set
>
>#
># I2C system bus drivers (mostly embedded / system-on-chip)
>#
>CONFIG_I2C_CBUS_GPIO=3Dy
>CONFIG_I2C_DESIGNWARE_CORE=3Dy
>CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
>CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
># CONFIG_I2C_DESIGNWARE_PCI is not set
># CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
># CONFIG_I2C_EMEV2 is not set
>CONFIG_I2C_GPIO=3Dy
># CONFIG_I2C_KEMPLD is not set
>CONFIG_I2C_OCORES=3Dy
>CONFIG_I2C_PCA_PLATFORM=3Dy
># CONFIG_I2C_PXA_PCI is not set
>CONFIG_I2C_RK3X=3Dy
># CONFIG_I2C_SIMTEC is not set
>CONFIG_I2C_XILINX=3Dy
>
>#
># External I2C/SMBus adapter drivers
>#
>CONFIG_I2C_PARPORT=3Dy
>CONFIG_I2C_PARPORT_LIGHT=3Dy
># CONFIG_I2C_TAOS_EVM is not set
>
>#
># Other I2C/SMBus bus drivers
>#
># CONFIG_I2C_MLXCPLD is not set
>CONFIG_I2C_SLAVE=3Dy
>CONFIG_I2C_SLAVE_EEPROM=3Dy
># CONFIG_I2C_DEBUG_CORE is not set
># CONFIG_I2C_DEBUG_ALGO is not set
># CONFIG_I2C_DEBUG_BUS is not set
># CONFIG_SPI is not set
># CONFIG_SPMI is not set
># CONFIG_HSI is not set
>CONFIG_PPS=3Dy
># CONFIG_PPS_DEBUG is not set
># CONFIG_NTP_PPS is not set
>
>#
># PPS clients support
>#
># CONFIG_PPS_CLIENT_KTIMER is not set
>CONFIG_PPS_CLIENT_LDISC=3Dy
># CONFIG_PPS_CLIENT_PARPORT is not set
># CONFIG_PPS_CLIENT_GPIO is not set
>
>#
># PPS generators support
>#
>
>#
># PTP clock support
>#
>
>#
># Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
>#
># CONFIG_PINCTRL is not set
>CONFIG_GPIOLIB=3Dy
>CONFIG_OF_GPIO=3Dy
>CONFIG_GPIO_ACPI=3Dy
>CONFIG_GPIOLIB_IRQCHIP=3Dy
>CONFIG_DEBUG_GPIO=3Dy
>CONFIG_GPIO_SYSFS=3Dy
>CONFIG_GPIO_GENERIC=3Dy
>
>#
># Memory mapped GPIO drivers
>#
>CONFIG_GPIO_74XX_MMIO=3Dy
># CONFIG_GPIO_ALTERA is not set
># CONFIG_GPIO_AMDPT is not set
>CONFIG_GPIO_DWAPB=3Dy
># CONFIG_GPIO_EXAR is not set
># CONFIG_GPIO_FTGPIO010 is not set
># CONFIG_GPIO_GENERIC_PLATFORM is not set
>CONFIG_GPIO_GRGPIO=3Dy
>CONFIG_GPIO_ICH=3Dy
># CONFIG_GPIO_LYNXPOINT is not set
># CONFIG_GPIO_MB86S7X is not set
># CONFIG_GPIO_MENZ127 is not set
># CONFIG_GPIO_MOCKUP is not set
>CONFIG_GPIO_SYSCON=3Dy
># CONFIG_GPIO_VX855 is not set
>CONFIG_GPIO_XILINX=3Dy
>
>#
># Port-mapped I/O GPIO drivers
>#
># CONFIG_GPIO_F7188X is not set
>CONFIG_GPIO_IT87=3Dy
># CONFIG_GPIO_SCH is not set
># CONFIG_GPIO_SCH311X is not set
>CONFIG_GPIO_WS16C48=3Dy
>
>#
># I2C GPIO expanders
>#
>CONFIG_GPIO_ADP5588=3Dy
>CONFIG_GPIO_ADP5588_IRQ=3Dy
># CONFIG_GPIO_ADNP is not set
># CONFIG_GPIO_MAX7300 is not set
>CONFIG_GPIO_MAX732X=3Dy
># CONFIG_GPIO_MAX732X_IRQ is not set
>CONFIG_GPIO_PCA953X=3Dy
># CONFIG_GPIO_PCA953X_IRQ is not set
># CONFIG_GPIO_PCF857X is not set
># CONFIG_GPIO_TPIC2810 is not set
>
>#
># MFD GPIO expanders
>#
>CONFIG_GPIO_ADP5520=3Dy
>CONFIG_GPIO_ARIZONA=3Dy
>CONFIG_GPIO_BD9571MWV=3Dy
>CONFIG_GPIO_KEMPLD=3Dy
>CONFIG_GPIO_LP3943=3Dy
>CONFIG_GPIO_LP87565=3Dy
>CONFIG_GPIO_PALMAS=3Dy
># CONFIG_GPIO_TPS65086 is not set
>CONFIG_GPIO_TPS65910=3Dy
>CONFIG_GPIO_TPS65912=3Dy
># CONFIG_GPIO_WM8994 is not set
>
>#
># PCI GPIO expanders
>#
>CONFIG_GPIO_AMD8111=3Dy
>CONFIG_GPIO_BT8XX=3Dy
>CONFIG_GPIO_ML_IOH=3Dy
># CONFIG_GPIO_PCI_IDIO_16 is not set
>CONFIG_GPIO_RDC321X=3Dy
>CONFIG_GPIO_SODAVILLE=3Dy
>CONFIG_W1=3Dy
>
>#
># 1-wire Bus Masters
>#
>CONFIG_W1_MASTER_MATROX=3Dy
># CONFIG_W1_MASTER_DS2482 is not set
>CONFIG_W1_MASTER_DS1WM=3Dy
># CONFIG_W1_MASTER_GPIO is not set
>
>#
># 1-wire Slaves
>#
>CONFIG_W1_SLAVE_THERM=3Dy
>CONFIG_W1_SLAVE_SMEM=3Dy
>CONFIG_W1_SLAVE_DS2405=3Dy
># CONFIG_W1_SLAVE_DS2408 is not set
>CONFIG_W1_SLAVE_DS2413=3Dy
>CONFIG_W1_SLAVE_DS2406=3Dy
>CONFIG_W1_SLAVE_DS2423=3Dy
>CONFIG_W1_SLAVE_DS2805=3Dy
>CONFIG_W1_SLAVE_DS2431=3Dy
>CONFIG_W1_SLAVE_DS2433=3Dy
># CONFIG_W1_SLAVE_DS2433_CRC is not set
># CONFIG_W1_SLAVE_DS2438 is not set
>CONFIG_W1_SLAVE_DS2760=3Dy
>CONFIG_W1_SLAVE_DS2780=3Dy
>CONFIG_W1_SLAVE_DS2781=3Dy
># CONFIG_W1_SLAVE_DS28E04 is not set
># CONFIG_W1_SLAVE_DS28E17 is not set
>CONFIG_POWER_AVS=3Dy
># CONFIG_POWER_RESET is not set
>CONFIG_POWER_SUPPLY=3Dy
># CONFIG_POWER_SUPPLY_DEBUG is not set
>CONFIG_PDA_POWER=3Dy
>CONFIG_GENERIC_ADC_BATTERY=3Dy
>CONFIG_MAX8925_POWER=3Dy
># CONFIG_TEST_POWER is not set
>CONFIG_BATTERY_88PM860X=3Dy
>CONFIG_BATTERY_ACT8945A=3Dy
>CONFIG_BATTERY_DS2760=3Dy
># CONFIG_BATTERY_DS2780 is not set
>CONFIG_BATTERY_DS2781=3Dy
>CONFIG_BATTERY_DS2782=3Dy
>CONFIG_BATTERY_LEGO_EV3=3Dy
>CONFIG_BATTERY_SBS=3Dy
># CONFIG_CHARGER_SBS is not set
># CONFIG_MANAGER_SBS is not set
># CONFIG_BATTERY_BQ27XXX is not set
>CONFIG_BATTERY_DA9030=3Dy
>CONFIG_BATTERY_MAX17040=3Dy
>CONFIG_BATTERY_MAX17042=3Dy
># CONFIG_BATTERY_MAX1721X is not set
>CONFIG_CHARGER_88PM860X=3Dy
>CONFIG_CHARGER_MAX8903=3Dy
>CONFIG_CHARGER_LP8727=3Dy
># CONFIG_CHARGER_GPIO is not set
># CONFIG_CHARGER_MANAGER is not set
>CONFIG_CHARGER_LTC3651=3Dy
>CONFIG_CHARGER_MAX14577=3Dy
>CONFIG_CHARGER_DETECTOR_MAX14656=3Dy
>CONFIG_CHARGER_MAX77693=3Dy
>CONFIG_CHARGER_MAX8997=3Dy
>CONFIG_CHARGER_BQ2415X=3Dy
>CONFIG_CHARGER_BQ24190=3Dy
># CONFIG_CHARGER_BQ24257 is not set
>CONFIG_CHARGER_BQ24735=3Dy
># CONFIG_CHARGER_BQ25890 is not set
># CONFIG_CHARGER_SMB347 is not set
>CONFIG_BATTERY_GAUGE_LTC2941=3Dy
>CONFIG_BATTERY_RT5033=3Dy
>CONFIG_CHARGER_RT9455=3Dy
>CONFIG_HWMON=3Dy
>CONFIG_HWMON_VID=3Dy
># CONFIG_HWMON_DEBUG_CHIP is not set
>
>#
># Native drivers
>#
>CONFIG_SENSORS_AD7414=3Dy
>CONFIG_SENSORS_AD7418=3Dy
># CONFIG_SENSORS_ADM1021 is not set
>CONFIG_SENSORS_ADM1025=3Dy
>CONFIG_SENSORS_ADM1026=3Dy
>CONFIG_SENSORS_ADM1029=3Dy
># CONFIG_SENSORS_ADM1031 is not set
>CONFIG_SENSORS_ADM9240=3Dy
>CONFIG_SENSORS_ADT7X10=3Dy
>CONFIG_SENSORS_ADT7410=3Dy
>CONFIG_SENSORS_ADT7411=3Dy
>CONFIG_SENSORS_ADT7462=3Dy
>CONFIG_SENSORS_ADT7470=3Dy
>CONFIG_SENSORS_ADT7475=3Dy
># CONFIG_SENSORS_ASC7621 is not set
>CONFIG_SENSORS_K8TEMP=3Dy
>CONFIG_SENSORS_K10TEMP=3Dy
>CONFIG_SENSORS_APPLESMC=3Dy
># CONFIG_SENSORS_ASB100 is not set
>CONFIG_SENSORS_ASPEED=3Dy
>CONFIG_SENSORS_ATXP1=3Dy
>CONFIG_SENSORS_DS620=3Dy
>CONFIG_SENSORS_DS1621=3Dy
>CONFIG_SENSORS_DELL_SMM=3Dy
>CONFIG_SENSORS_I5K_AMB=3Dy
># CONFIG_SENSORS_F71805F is not set
>CONFIG_SENSORS_F71882FG=3Dy
>CONFIG_SENSORS_F75375S=3Dy
>CONFIG_SENSORS_FSCHMD=3Dy
>CONFIG_SENSORS_FTSTEUTATES=3Dy
>CONFIG_SENSORS_GL518SM=3Dy
>CONFIG_SENSORS_GL520SM=3Dy
>CONFIG_SENSORS_G760A=3Dy
>CONFIG_SENSORS_G762=3Dy
>CONFIG_SENSORS_GPIO_FAN=3Dy
>CONFIG_SENSORS_HIH6130=3Dy
>CONFIG_SENSORS_IIO_HWMON=3Dy
># CONFIG_SENSORS_I5500 is not set
>CONFIG_SENSORS_CORETEMP=3Dy
>CONFIG_SENSORS_IT87=3Dy
># CONFIG_SENSORS_JC42 is not set
>CONFIG_SENSORS_POWR1220=3Dy
>CONFIG_SENSORS_LINEAGE=3Dy
>CONFIG_SENSORS_LTC2945=3Dy
># CONFIG_SENSORS_LTC2990 is not set
>CONFIG_SENSORS_LTC4151=3Dy
>CONFIG_SENSORS_LTC4215=3Dy
>CONFIG_SENSORS_LTC4222=3Dy
># CONFIG_SENSORS_LTC4245 is not set
>CONFIG_SENSORS_LTC4260=3Dy
>CONFIG_SENSORS_LTC4261=3Dy
>CONFIG_SENSORS_MAX16065=3Dy
>CONFIG_SENSORS_MAX1619=3Dy
>CONFIG_SENSORS_MAX1668=3Dy
>CONFIG_SENSORS_MAX197=3Dy
># CONFIG_SENSORS_MAX6621 is not set
># CONFIG_SENSORS_MAX6639 is not set
>CONFIG_SENSORS_MAX6642=3Dy
># CONFIG_SENSORS_MAX6650 is not set
>CONFIG_SENSORS_MAX6697=3Dy
>CONFIG_SENSORS_MAX31790=3Dy
>CONFIG_SENSORS_MCP3021=3Dy
>CONFIG_SENSORS_TC654=3Dy
>CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
># CONFIG_SENSORS_LM63 is not set
># CONFIG_SENSORS_LM73 is not set
>CONFIG_SENSORS_LM75=3Dy
># CONFIG_SENSORS_LM77 is not set
>CONFIG_SENSORS_LM78=3Dy
># CONFIG_SENSORS_LM80 is not set
>CONFIG_SENSORS_LM83=3Dy
>CONFIG_SENSORS_LM85=3Dy
>CONFIG_SENSORS_LM87=3Dy
>CONFIG_SENSORS_LM90=3Dy
>CONFIG_SENSORS_LM92=3Dy
>CONFIG_SENSORS_LM93=3Dy
># CONFIG_SENSORS_LM95234 is not set
>CONFIG_SENSORS_LM95241=3Dy
>CONFIG_SENSORS_LM95245=3Dy
>CONFIG_SENSORS_PC87360=3Dy
># CONFIG_SENSORS_PC87427 is not set
>CONFIG_SENSORS_NTC_THERMISTOR=3Dy
>CONFIG_SENSORS_NCT6683=3Dy
>CONFIG_SENSORS_NCT6775=3Dy
>CONFIG_SENSORS_NCT7802=3Dy
># CONFIG_SENSORS_NCT7904 is not set
>CONFIG_SENSORS_PCF8591=3Dy
>CONFIG_PMBUS=3Dy
># CONFIG_SENSORS_PMBUS is not set
># CONFIG_SENSORS_ADM1275 is not set
># CONFIG_SENSORS_IBM_CFFPS is not set
># CONFIG_SENSORS_IR35221 is not set
>CONFIG_SENSORS_LM25066=3Dy
># CONFIG_SENSORS_LTC2978 is not set
>CONFIG_SENSORS_LTC3815=3Dy
>CONFIG_SENSORS_MAX16064=3Dy
># CONFIG_SENSORS_MAX20751 is not set
># CONFIG_SENSORS_MAX31785 is not set
>CONFIG_SENSORS_MAX34440=3Dy
>CONFIG_SENSORS_MAX8688=3Dy
>CONFIG_SENSORS_TPS40422=3Dy
># CONFIG_SENSORS_TPS53679 is not set
># CONFIG_SENSORS_UCD9000 is not set
>CONFIG_SENSORS_UCD9200=3Dy
># CONFIG_SENSORS_ZL6100 is not set
>CONFIG_SENSORS_PWM_FAN=3Dy
>CONFIG_SENSORS_SHT15=3Dy
># CONFIG_SENSORS_SHT21 is not set
>CONFIG_SENSORS_SHT3x=3Dy
>CONFIG_SENSORS_SHTC1=3Dy
># CONFIG_SENSORS_SIS5595 is not set
>CONFIG_SENSORS_DME1737=3Dy
># CONFIG_SENSORS_EMC1403 is not set
># CONFIG_SENSORS_EMC2103 is not set
>CONFIG_SENSORS_EMC6W201=3Dy
>CONFIG_SENSORS_SMSC47M1=3Dy
>CONFIG_SENSORS_SMSC47M192=3Dy
># CONFIG_SENSORS_SMSC47B397 is not set
>CONFIG_SENSORS_SCH56XX_COMMON=3Dy
>CONFIG_SENSORS_SCH5627=3Dy
># CONFIG_SENSORS_SCH5636 is not set
># CONFIG_SENSORS_STTS751 is not set
>CONFIG_SENSORS_SMM665=3Dy
># CONFIG_SENSORS_ADC128D818 is not set
>CONFIG_SENSORS_ADS1015=3Dy
># CONFIG_SENSORS_ADS7828 is not set
>CONFIG_SENSORS_AMC6821=3Dy
>CONFIG_SENSORS_INA209=3Dy
>CONFIG_SENSORS_INA2XX=3Dy
>CONFIG_SENSORS_INA3221=3Dy
>CONFIG_SENSORS_TC74=3Dy
>CONFIG_SENSORS_THMC50=3Dy
>CONFIG_SENSORS_TMP102=3Dy
>CONFIG_SENSORS_TMP103=3Dy
>CONFIG_SENSORS_TMP108=3Dy
># CONFIG_SENSORS_TMP401 is not set
>CONFIG_SENSORS_TMP421=3Dy
>CONFIG_SENSORS_VIA_CPUTEMP=3Dy
># CONFIG_SENSORS_VIA686A is not set
>CONFIG_SENSORS_VT1211=3Dy
># CONFIG_SENSORS_VT8231 is not set
>CONFIG_SENSORS_W83781D=3Dy
># CONFIG_SENSORS_W83791D is not set
># CONFIG_SENSORS_W83792D is not set
>CONFIG_SENSORS_W83793=3Dy
># CONFIG_SENSORS_W83795 is not set
>CONFIG_SENSORS_W83L785TS=3Dy
># CONFIG_SENSORS_W83L786NG is not set
>CONFIG_SENSORS_W83627HF=3Dy
>CONFIG_SENSORS_W83627EHF=3Dy
>
>#
># ACPI drivers
>#
># CONFIG_SENSORS_ACPI_POWER is not set
># CONFIG_SENSORS_ATK0110 is not set
>CONFIG_THERMAL=3Dy
>CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
># CONFIG_THERMAL_HWMON is not set
>CONFIG_THERMAL_OF=3Dy
>CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
># CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
># CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
># CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
>CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
>CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
>CONFIG_THERMAL_GOV_STEP_WISE=3Dy
># CONFIG_THERMAL_GOV_BANG_BANG is not set
># CONFIG_THERMAL_GOV_USER_SPACE is not set
>CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
># CONFIG_CPU_THERMAL is not set
># CONFIG_CLOCK_THERMAL is not set
>CONFIG_THERMAL_EMULATION=3Dy
># CONFIG_QORIQ_THERMAL is not set
>CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
>CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
>
>#
># ACPI INT340X thermal drivers
>#
># CONFIG_INT340X_THERMAL is not set
># CONFIG_INTEL_PCH_THERMAL is not set
>CONFIG_GENERIC_ADC_THERMAL=3Dy
>CONFIG_WATCHDOG=3Dy
>CONFIG_WATCHDOG_CORE=3Dy
>CONFIG_WATCHDOG_NOWAYOUT=3Dy
># CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
># CONFIG_WATCHDOG_SYSFS is not set
>
>#
># Watchdog Device Drivers
>#
># CONFIG_SOFT_WATCHDOG is not set
>CONFIG_DA9063_WATCHDOG=3Dy
># CONFIG_GPIO_WATCHDOG is not set
># CONFIG_MENF21BMC_WATCHDOG is not set
># CONFIG_WDAT_WDT is not set
>CONFIG_XILINX_WATCHDOG=3Dy
>CONFIG_ZIIRAVE_WATCHDOG=3Dy
>CONFIG_CADENCE_WATCHDOG=3Dy
># CONFIG_DW_WATCHDOG is not set
># CONFIG_RN5T618_WATCHDOG is not set
>CONFIG_MAX63XX_WATCHDOG=3Dy
>CONFIG_RETU_WATCHDOG=3Dy
>CONFIG_ACQUIRE_WDT=3Dy
># CONFIG_ADVANTECH_WDT is not set
>CONFIG_ALIM1535_WDT=3Dy
># CONFIG_ALIM7101_WDT is not set
>CONFIG_EBC_C384_WDT=3Dy
># CONFIG_F71808E_WDT is not set
># CONFIG_SP5100_TCO is not set
>CONFIG_SBC_FITPC2_WATCHDOG=3Dy
># CONFIG_EUROTECH_WDT is not set
>CONFIG_IB700_WDT=3Dy
># CONFIG_IBMASR is not set
># CONFIG_WAFER_WDT is not set
>CONFIG_I6300ESB_WDT=3Dy
># CONFIG_IE6XX_WDT is not set
>CONFIG_ITCO_WDT=3Dy
>CONFIG_ITCO_VENDOR_SUPPORT=3Dy
>CONFIG_IT8712F_WDT=3Dy
>CONFIG_IT87_WDT=3Dy
>CONFIG_HP_WATCHDOG=3Dy
>CONFIG_KEMPLD_WDT=3Dy
>CONFIG_HPWDT_NMI_DECODING=3Dy
># CONFIG_SC1200_WDT is not set
>CONFIG_PC87413_WDT=3Dy
>CONFIG_NV_TCO=3Dy
>CONFIG_60XX_WDT=3Dy
>CONFIG_CPU5_WDT=3Dy
># CONFIG_SMSC_SCH311X_WDT is not set
># CONFIG_SMSC37B787_WDT is not set
># CONFIG_VIA_WDT is not set
>CONFIG_W83627HF_WDT=3Dy
># CONFIG_W83877F_WDT is not set
>CONFIG_W83977F_WDT=3Dy
>CONFIG_MACHZ_WDT=3Dy
>CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
>CONFIG_INTEL_MEI_WDT=3Dy
># CONFIG_NI903X_WDT is not set
># CONFIG_NIC7018_WDT is not set
>CONFIG_MEN_A21_WDT=3Dy
>
>#
># PCI-based Watchdog Cards
>#
>CONFIG_PCIPCWATCHDOG=3Dy
># CONFIG_WDTPCI is not set
>
>#
># Watchdog Pretimeout Governors
>#
>CONFIG_WATCHDOG_PRETIMEOUT_GOV=3Dy
># CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
>CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=3Dy
># CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
>CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dy
>CONFIG_SSB_POSSIBLE=3Dy
>
>#
># Sonics Silicon Backplane
>#
># CONFIG_SSB is not set
>CONFIG_BCMA_POSSIBLE=3Dy
>CONFIG_BCMA=3Dy
>CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
># CONFIG_BCMA_HOST_PCI is not set
>CONFIG_BCMA_HOST_SOC=3Dy
>CONFIG_BCMA_DRIVER_PCI=3Dy
># CONFIG_BCMA_SFLASH is not set
>CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
>CONFIG_BCMA_DRIVER_GPIO=3Dy
># CONFIG_BCMA_DEBUG is not set
>
>#
># Multifunction device drivers
>#
>CONFIG_MFD_CORE=3Dy
>CONFIG_MFD_ACT8945A=3Dy
># CONFIG_MFD_AS3711 is not set
>CONFIG_MFD_AS3722=3Dy
>CONFIG_PMIC_ADP5520=3Dy
># CONFIG_MFD_AAT2870_CORE is not set
>CONFIG_MFD_ATMEL_FLEXCOM=3Dy
># CONFIG_MFD_ATMEL_HLCDC is not set
># CONFIG_MFD_BCM590XX is not set
>CONFIG_MFD_BD9571MWV=3Dy
># CONFIG_MFD_AXP20X_I2C is not set
># CONFIG_MFD_CROS_EC is not set
>CONFIG_PMIC_DA903X=3Dy
># CONFIG_MFD_DA9052_I2C is not set
># CONFIG_MFD_DA9055 is not set
># CONFIG_MFD_DA9062 is not set
>CONFIG_MFD_DA9063=3Dy
># CONFIG_MFD_DA9150 is not set
># CONFIG_MFD_MC13XXX_I2C is not set
>CONFIG_MFD_HI6421_PMIC=3Dy
>CONFIG_HTC_PASIC3=3Dy
>CONFIG_HTC_I2CPLD=3Dy
>CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
>CONFIG_LPC_ICH=3Dy
>CONFIG_LPC_SCH=3Dy
># CONFIG_INTEL_SOC_PMIC is not set
># CONFIG_INTEL_SOC_PMIC_CHTWC is not set
># CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
># CONFIG_MFD_INTEL_LPSS_ACPI is not set
># CONFIG_MFD_INTEL_LPSS_PCI is not set
># CONFIG_MFD_JANZ_CMODIO is not set
>CONFIG_MFD_KEMPLD=3Dy
>CONFIG_MFD_88PM800=3Dy
>CONFIG_MFD_88PM805=3Dy
>CONFIG_MFD_88PM860X=3Dy
>CONFIG_MFD_MAX14577=3Dy
># CONFIG_MFD_MAX77620 is not set
>CONFIG_MFD_MAX77686=3Dy
>CONFIG_MFD_MAX77693=3Dy
># CONFIG_MFD_MAX77843 is not set
># CONFIG_MFD_MAX8907 is not set
>CONFIG_MFD_MAX8925=3Dy
>CONFIG_MFD_MAX8997=3Dy
>CONFIG_MFD_MAX8998=3Dy
># CONFIG_MFD_MT6397 is not set
>CONFIG_MFD_MENF21BMC=3Dy
>CONFIG_MFD_RETU=3Dy
># CONFIG_MFD_PCF50633 is not set
>CONFIG_MFD_RDC321X=3Dy
>CONFIG_MFD_RTSX_PCI=3Dy
>CONFIG_MFD_RT5033=3Dy
># CONFIG_MFD_RC5T583 is not set
>CONFIG_MFD_RK808=3Dy
>CONFIG_MFD_RN5T618=3Dy
># CONFIG_MFD_SEC_CORE is not set
>CONFIG_MFD_SI476X_CORE=3Dy
>CONFIG_MFD_SM501=3Dy
># CONFIG_MFD_SM501_GPIO is not set
>CONFIG_MFD_SKY81452=3Dy
># CONFIG_MFD_SMSC is not set
># CONFIG_ABX500_CORE is not set
># CONFIG_MFD_STMPE is not set
>CONFIG_MFD_SYSCON=3Dy
>CONFIG_MFD_TI_AM335X_TSCADC=3Dy
>CONFIG_MFD_LP3943=3Dy
># CONFIG_MFD_LP8788 is not set
>CONFIG_MFD_TI_LMU=3Dy
>CONFIG_MFD_PALMAS=3Dy
>CONFIG_TPS6105X=3Dy
># CONFIG_TPS65010 is not set
>CONFIG_TPS6507X=3Dy
>CONFIG_MFD_TPS65086=3Dy
># CONFIG_MFD_TPS65090 is not set
># CONFIG_MFD_TPS65217 is not set
># CONFIG_MFD_TPS68470 is not set
># CONFIG_MFD_TI_LP873X is not set
>CONFIG_MFD_TI_LP87565=3Dy
># CONFIG_MFD_TPS65218 is not set
># CONFIG_MFD_TPS6586X is not set
>CONFIG_MFD_TPS65910=3Dy
>CONFIG_MFD_TPS65912=3Dy
>CONFIG_MFD_TPS65912_I2C=3Dy
>CONFIG_MFD_TPS80031=3Dy
># CONFIG_TWL4030_CORE is not set
># CONFIG_TWL6040_CORE is not set
># CONFIG_MFD_WL1273_CORE is not set
># CONFIG_MFD_LM3533 is not set
># CONFIG_MFD_TC3589X is not set
># CONFIG_MFD_TMIO is not set
>CONFIG_MFD_VX855=3Dy
>CONFIG_MFD_ARIZONA=3Dy
>CONFIG_MFD_ARIZONA_I2C=3Dy
># CONFIG_MFD_CS47L24 is not set
>CONFIG_MFD_WM5102=3Dy
># CONFIG_MFD_WM5110 is not set
># CONFIG_MFD_WM8997 is not set
># CONFIG_MFD_WM8998 is not set
># CONFIG_MFD_WM8400 is not set
># CONFIG_MFD_WM831X_I2C is not set
># CONFIG_MFD_WM8350_I2C is not set
>CONFIG_MFD_WM8994=3Dy
>CONFIG_REGULATOR=3Dy
>CONFIG_REGULATOR_DEBUG=3Dy
>CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
>CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
># CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
># CONFIG_REGULATOR_88PM800 is not set
>CONFIG_REGULATOR_88PM8607=3Dy
># CONFIG_REGULATOR_ACT8865 is not set
># CONFIG_REGULATOR_ACT8945A is not set
># CONFIG_REGULATOR_AD5398 is not set
># CONFIG_REGULATOR_ANATOP is not set
>CONFIG_REGULATOR_AS3722=3Dy
># CONFIG_REGULATOR_BD9571MWV is not set
>CONFIG_REGULATOR_DA903X=3Dy
>CONFIG_REGULATOR_DA9063=3Dy
>CONFIG_REGULATOR_DA9210=3Dy
>CONFIG_REGULATOR_DA9211=3Dy
># CONFIG_REGULATOR_FAN53555 is not set
>CONFIG_REGULATOR_GPIO=3Dy
># CONFIG_REGULATOR_HI6421 is not set
>CONFIG_REGULATOR_HI6421V530=3Dy
>CONFIG_REGULATOR_ISL9305=3Dy
>CONFIG_REGULATOR_ISL6271A=3Dy
># CONFIG_REGULATOR_LM363X is not set
>CONFIG_REGULATOR_LP3971=3Dy
>CONFIG_REGULATOR_LP3972=3Dy
># CONFIG_REGULATOR_LP872X is not set
># CONFIG_REGULATOR_LP8755 is not set
>CONFIG_REGULATOR_LP87565=3Dy
>CONFIG_REGULATOR_LTC3589=3Dy
>CONFIG_REGULATOR_LTC3676=3Dy
>CONFIG_REGULATOR_MAX14577=3Dy
>CONFIG_REGULATOR_MAX1586=3Dy
>CONFIG_REGULATOR_MAX8649=3Dy
># CONFIG_REGULATOR_MAX8660 is not set
># CONFIG_REGULATOR_MAX8925 is not set
>CONFIG_REGULATOR_MAX8952=3Dy
>CONFIG_REGULATOR_MAX8973=3Dy
>CONFIG_REGULATOR_MAX8997=3Dy
># CONFIG_REGULATOR_MAX8998 is not set
>CONFIG_REGULATOR_MAX77686=3Dy
>CONFIG_REGULATOR_MAX77693=3Dy
>CONFIG_REGULATOR_MAX77802=3Dy
># CONFIG_REGULATOR_MT6311 is not set
>CONFIG_REGULATOR_PALMAS=3Dy
>CONFIG_REGULATOR_PFUZE100=3Dy
>CONFIG_REGULATOR_PV88060=3Dy
># CONFIG_REGULATOR_PV88080 is not set
>CONFIG_REGULATOR_PV88090=3Dy
># CONFIG_REGULATOR_PWM is not set
>CONFIG_REGULATOR_RK808=3Dy
># CONFIG_REGULATOR_RN5T618 is not set
>CONFIG_REGULATOR_RT5033=3Dy
>CONFIG_REGULATOR_SKY81452=3Dy
>CONFIG_REGULATOR_TPS51632=3Dy
>CONFIG_REGULATOR_TPS6105X=3Dy
>CONFIG_REGULATOR_TPS62360=3Dy
>CONFIG_REGULATOR_TPS65023=3Dy
>CONFIG_REGULATOR_TPS6507X=3Dy
>CONFIG_REGULATOR_TPS65086=3Dy
>CONFIG_REGULATOR_TPS65132=3Dy
># CONFIG_REGULATOR_TPS65910 is not set
>CONFIG_REGULATOR_TPS65912=3Dy
>CONFIG_REGULATOR_TPS80031=3Dy
># CONFIG_REGULATOR_VCTRL is not set
>CONFIG_REGULATOR_WM8994=3Dy
>CONFIG_RC_CORE=3Dy
>CONFIG_RC_MAP=3Dy
># CONFIG_RC_DECODERS is not set
>CONFIG_RC_DEVICES=3Dy
># CONFIG_RC_ATI_REMOTE is not set
># CONFIG_IR_ENE is not set
>CONFIG_IR_HIX5HD2=3Dy
># CONFIG_IR_IMON is not set
># CONFIG_IR_MCEUSB is not set
># CONFIG_IR_ITE_CIR is not set
># CONFIG_IR_FINTEK is not set
># CONFIG_IR_NUVOTON is not set
># CONFIG_IR_REDRAT3 is not set
># CONFIG_IR_STREAMZAP is not set
># CONFIG_IR_WINBOND_CIR is not set
># CONFIG_IR_IGORPLUGUSB is not set
># CONFIG_IR_IGUANA is not set
># CONFIG_IR_TTUSBIR is not set
>CONFIG_RC_LOOPBACK=3Dy
># CONFIG_IR_GPIO_CIR is not set
>CONFIG_IR_SERIAL=3Dy
>CONFIG_IR_SERIAL_TRANSMITTER=3Dy
>CONFIG_IR_SIR=3Dy
># CONFIG_MEDIA_SUPPORT is not set
>
>#
># Graphics support
>#
># CONFIG_AGP is not set
>CONFIG_INTEL_GTT=3Dy
>CONFIG_VGA_ARB=3Dy
>CONFIG_VGA_ARB_MAX_GPUS=3D16
># CONFIG_VGA_SWITCHEROO is not set
>CONFIG_DRM=3Dy
>CONFIG_DRM_MIPI_DSI=3Dy
>CONFIG_DRM_DP_AUX_CHARDEV=3Dy
>CONFIG_DRM_DEBUG_MM=3Dy
>CONFIG_DRM_DEBUG_MM_SELFTEST=3Dy
>CONFIG_DRM_KMS_HELPER=3Dy
>CONFIG_DRM_KMS_FB_HELPER=3Dy
>CONFIG_DRM_FBDEV_EMULATION=3Dy
>CONFIG_DRM_FBDEV_OVERALLOC=3D100
># CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
>CONFIG_DRM_TTM=3Dy
>CONFIG_DRM_GEM_CMA_HELPER=3Dy
>CONFIG_DRM_KMS_CMA_HELPER=3Dy
>CONFIG_DRM_VM=3Dy
>
>#
># I2C encoder or helper chips
>#
>CONFIG_DRM_I2C_CH7006=3Dy
>CONFIG_DRM_I2C_SIL164=3Dy
>CONFIG_DRM_I2C_NXP_TDA998X=3Dy
>CONFIG_DRM_RADEON=3Dy
>CONFIG_DRM_RADEON_USERPTR=3Dy
>CONFIG_DRM_AMDGPU=3Dy
>CONFIG_DRM_AMDGPU_SI=3Dy
>CONFIG_DRM_AMDGPU_CIK=3Dy
>CONFIG_DRM_AMDGPU_USERPTR=3Dy
># CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set
>
>#
># ACP (Audio CoProcessor) Configuration
>#
>CONFIG_DRM_AMD_ACP=3Dy
>
>#
># Display Engine Configuration
>#
>CONFIG_DRM_AMD_DC=3Dy
># CONFIG_DRM_AMD_DC_PRE_VEGA is not set
># CONFIG_DRM_AMD_DC_FBC is not set
># CONFIG_DRM_AMD_DC_DCN1_0 is not set
># CONFIG_DEBUG_KERNEL_DC is not set
>
>#
># AMD Library routines
>#
>CONFIG_CHASH=3Dy
># CONFIG_CHASH_STATS is not set
># CONFIG_CHASH_SELFTEST is not set
>CONFIG_DRM_NOUVEAU=3Dy
>CONFIG_NOUVEAU_DEBUG=3D5
>CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
># CONFIG_NOUVEAU_DEBUG_MMU is not set
>CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
>CONFIG_DRM_I915=3Dy
># CONFIG_DRM_I915_ALPHA_SUPPORT is not set
>CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
># CONFIG_DRM_I915_COMPRESS_ERROR is not set
># CONFIG_DRM_I915_USERPTR is not set
># CONFIG_DRM_I915_GVT is not set
>
>#
># drm/i915 Debugging
>#
># CONFIG_DRM_I915_WERROR is not set
>CONFIG_DRM_I915_DEBUG=3Dy
>CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=3Dy
>CONFIG_DRM_I915_SW_FENCE_CHECK_DAG=3Dy
>CONFIG_DRM_I915_SELFTEST=3Dy
>CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS=3Dy
>CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=3Dy
>CONFIG_DRM_VGEM=3Dy
># CONFIG_DRM_VMWGFX is not set
>CONFIG_DRM_GMA500=3Dy
># CONFIG_DRM_GMA600 is not set
># CONFIG_DRM_GMA3600 is not set
># CONFIG_DRM_UDL is not set
>CONFIG_DRM_AST=3Dy
># CONFIG_DRM_MGAG200 is not set
>CONFIG_DRM_CIRRUS_QEMU=3Dy
>CONFIG_DRM_RCAR_DW_HDMI=3Dy
>CONFIG_DRM_QXL=3Dy
># CONFIG_DRM_BOCHS is not set
># CONFIG_DRM_VIRTIO_GPU is not set
>CONFIG_DRM_PANEL=3Dy
>
>#
># Display Panels
>#
># CONFIG_DRM_PANEL_LVDS is not set
># CONFIG_DRM_PANEL_SIMPLE is not set
>CONFIG_DRM_PANEL_INNOLUX_P079ZCA=3Dy
># CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
># CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
># CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
># CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
>CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dy
># CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
>CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=3Dy
># CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
>CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=3Dy
>CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dy
>CONFIG_DRM_BRIDGE=3Dy
>CONFIG_DRM_PANEL_BRIDGE=3Dy
>
>#
># Display Interface Bridges
>#
>CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
># CONFIG_DRM_DUMB_VGA_DAC is not set
>CONFIG_DRM_LVDS_ENCODER=3Dy
>CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=3Dy
>CONFIG_DRM_NXP_PTN3460=3Dy
>CONFIG_DRM_PARADE_PS8622=3Dy
># CONFIG_DRM_SIL_SII8620 is not set
>CONFIG_DRM_SII902X=3Dy
># CONFIG_DRM_SII9234 is not set
># CONFIG_DRM_TOSHIBA_TC358767 is not set
>CONFIG_DRM_TI_TFP410=3Dy
># CONFIG_DRM_I2C_ADV7511 is not set
>CONFIG_DRM_DW_HDMI=3Dy
># CONFIG_DRM_DW_HDMI_CEC is not set
>CONFIG_DRM_ARCPGU=3Dy
>CONFIG_DRM_HISI_HIBMC=3Dy
>CONFIG_DRM_MXS=3Dy
>CONFIG_DRM_MXSFB=3Dy
>CONFIG_DRM_TINYDRM=3Dy
>CONFIG_DRM_LEGACY=3Dy
>CONFIG_DRM_TDFX=3Dy
>CONFIG_DRM_R128=3Dy
>CONFIG_DRM_MGA=3Dy
># CONFIG_DRM_VIA is not set
>CONFIG_DRM_SAVAGE=3Dy
>CONFIG_DRM_LIB_RANDOM=3Dy
>
>#
># Frame buffer Devices
>#
>CONFIG_FB=3Dy
>CONFIG_FIRMWARE_EDID=3Dy
>CONFIG_FB_CMDLINE=3Dy
>CONFIG_FB_NOTIFY=3Dy
>CONFIG_FB_DDC=3Dy
>CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
>CONFIG_FB_CFB_FILLRECT=3Dy
>CONFIG_FB_CFB_COPYAREA=3Dy
>CONFIG_FB_CFB_IMAGEBLIT=3Dy
># CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
>CONFIG_FB_SYS_FILLRECT=3Dy
>CONFIG_FB_SYS_COPYAREA=3Dy
>CONFIG_FB_SYS_IMAGEBLIT=3Dy
># CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
>CONFIG_FB_FOREIGN_ENDIAN=3Dy
>CONFIG_FB_BOTH_ENDIAN=3Dy
># CONFIG_FB_BIG_ENDIAN is not set
># CONFIG_FB_LITTLE_ENDIAN is not set
>CONFIG_FB_SYS_FOPS=3Dy
>CONFIG_FB_DEFERRED_IO=3Dy
>CONFIG_FB_HECUBA=3Dy
>CONFIG_FB_SVGALIB=3Dy
># CONFIG_FB_MACMODES is not set
>CONFIG_FB_BACKLIGHT=3Dy
>CONFIG_FB_MODE_HELPERS=3Dy
>CONFIG_FB_TILEBLITTING=3Dy
>
>#
># Frame buffer hardware drivers
>#
># CONFIG_FB_CIRRUS is not set
># CONFIG_FB_PM2 is not set
># CONFIG_FB_CYBER2000 is not set
>CONFIG_FB_ARC=3Dy
>CONFIG_FB_ASILIANT=3Dy
># CONFIG_FB_IMSTT is not set
># CONFIG_FB_VGA16 is not set
># CONFIG_FB_VESA is not set
>CONFIG_FB_N411=3Dy
>CONFIG_FB_HGA=3Dy
>CONFIG_FB_OPENCORES=3Dy
>CONFIG_FB_S1D13XXX=3Dy
>CONFIG_FB_NVIDIA=3Dy
>CONFIG_FB_NVIDIA_I2C=3Dy
>CONFIG_FB_NVIDIA_DEBUG=3Dy
># CONFIG_FB_NVIDIA_BACKLIGHT is not set
>CONFIG_FB_RIVA=3Dy
>CONFIG_FB_RIVA_I2C=3Dy
># CONFIG_FB_RIVA_DEBUG is not set
>CONFIG_FB_RIVA_BACKLIGHT=3Dy
>CONFIG_FB_I740=3Dy
>CONFIG_FB_LE80578=3Dy
>CONFIG_FB_CARILLO_RANCH=3Dy
>CONFIG_FB_MATROX=3Dy
>CONFIG_FB_MATROX_MILLENIUM=3Dy
># CONFIG_FB_MATROX_MYSTIQUE is not set
># CONFIG_FB_MATROX_G is not set
># CONFIG_FB_MATROX_I2C is not set
>CONFIG_FB_RADEON=3Dy
>CONFIG_FB_RADEON_I2C=3Dy
>CONFIG_FB_RADEON_BACKLIGHT=3Dy
>CONFIG_FB_RADEON_DEBUG=3Dy
>CONFIG_FB_ATY128=3Dy
>CONFIG_FB_ATY128_BACKLIGHT=3Dy
>CONFIG_FB_ATY=3Dy
># CONFIG_FB_ATY_CT is not set
>CONFIG_FB_ATY_GX=3Dy
>CONFIG_FB_ATY_BACKLIGHT=3Dy
>CONFIG_FB_S3=3Dy
>CONFIG_FB_S3_DDC=3Dy
># CONFIG_FB_SAVAGE is not set
>CONFIG_FB_SIS=3Dy
>CONFIG_FB_SIS_300=3Dy
>CONFIG_FB_SIS_315=3Dy
># CONFIG_FB_VIA is not set
>CONFIG_FB_NEOMAGIC=3Dy
>CONFIG_FB_KYRO=3Dy
>CONFIG_FB_3DFX=3Dy
>CONFIG_FB_3DFX_ACCEL=3Dy
>CONFIG_FB_3DFX_I2C=3Dy
>CONFIG_FB_VOODOO1=3Dy
># CONFIG_FB_VT8623 is not set
>CONFIG_FB_TRIDENT=3Dy
>CONFIG_FB_ARK=3Dy
># CONFIG_FB_PM3 is not set
>CONFIG_FB_CARMINE=3Dy
># CONFIG_FB_CARMINE_DRAM_EVAL is not set
>CONFIG_CARMINE_DRAM_CUSTOM=3Dy
># CONFIG_FB_SM501 is not set
># CONFIG_FB_IBM_GXT4500 is not set
># CONFIG_FB_VIRTUAL is not set
>CONFIG_FB_METRONOME=3Dy
># CONFIG_FB_MB862XX is not set
>CONFIG_FB_BROADSHEET=3Dy
>CONFIG_FB_AUO_K190X=3Dy
>CONFIG_FB_AUO_K1900=3Dy
># CONFIG_FB_AUO_K1901 is not set
># CONFIG_FB_SIMPLE is not set
>CONFIG_FB_SSD1307=3Dy
>CONFIG_FB_SM712=3Dy
>CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>CONFIG_LCD_CLASS_DEVICE=3Dy
>CONFIG_LCD_PLATFORM=3Dy
>CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>CONFIG_BACKLIGHT_GENERIC=3Dy
>CONFIG_BACKLIGHT_CARILLO_RANCH=3Dy
>CONFIG_BACKLIGHT_PWM=3Dy
>CONFIG_BACKLIGHT_DA903X=3Dy
>CONFIG_BACKLIGHT_MAX8925=3Dy
># CONFIG_BACKLIGHT_APPLE is not set
>CONFIG_BACKLIGHT_PM8941_WLED=3Dy
>CONFIG_BACKLIGHT_SAHARA=3Dy
>CONFIG_BACKLIGHT_ADP5520=3Dy
># CONFIG_BACKLIGHT_ADP8860 is not set
># CONFIG_BACKLIGHT_ADP8870 is not set
>CONFIG_BACKLIGHT_88PM860X=3Dy
>CONFIG_BACKLIGHT_LM3630A=3Dy
>CONFIG_BACKLIGHT_LM3639=3Dy
>CONFIG_BACKLIGHT_LP855X=3Dy
>CONFIG_BACKLIGHT_SKY81452=3Dy
># CONFIG_BACKLIGHT_GPIO is not set
>CONFIG_BACKLIGHT_LV5207LP=3Dy
>CONFIG_BACKLIGHT_BD6107=3Dy
># CONFIG_BACKLIGHT_ARCXCNN is not set
>CONFIG_VGASTATE=3Dy
>CONFIG_VIDEOMODE_HELPERS=3Dy
>CONFIG_HDMI=3Dy
># CONFIG_LOGO is not set
># CONFIG_SOUND is not set
>
>#
># HID support
>#
>CONFIG_HID=3Dy
>CONFIG_HID_BATTERY_STRENGTH=3Dy
># CONFIG_HIDRAW is not set
>CONFIG_UHID=3Dy
>CONFIG_HID_GENERIC=3Dy
>
>#
># Special HID drivers
>#
>CONFIG_HID_A4TECH=3Dy
>CONFIG_HID_ACRUX=3Dy
>CONFIG_HID_ACRUX_FF=3Dy
>CONFIG_HID_APPLE=3Dy
>CONFIG_HID_ASUS=3Dy
>CONFIG_HID_AUREAL=3Dy
># CONFIG_HID_BELKIN is not set
>CONFIG_HID_CHERRY=3Dy
>CONFIG_HID_CHICONY=3Dy
>CONFIG_HID_CMEDIA=3Dy
># CONFIG_HID_CYPRESS is not set
>CONFIG_HID_DRAGONRISE=3Dy
># CONFIG_DRAGONRISE_FF is not set
>CONFIG_HID_EMS_FF=3Dy
>CONFIG_HID_ELECOM=3Dy
># CONFIG_HID_EZKEY is not set
># CONFIG_HID_GEMBIRD is not set
>CONFIG_HID_GFRM=3Dy
>CONFIG_HID_KEYTOUCH=3Dy
>CONFIG_HID_KYE=3Dy
># CONFIG_HID_WALTOP is not set
># CONFIG_HID_GYRATION is not set
>CONFIG_HID_ICADE=3Dy
>CONFIG_HID_ITE=3Dy
>CONFIG_HID_TWINHAN=3Dy
>CONFIG_HID_KENSINGTON=3Dy
># CONFIG_HID_LCPOWER is not set
>CONFIG_HID_LED=3Dy
># CONFIG_HID_LENOVO is not set
>CONFIG_HID_LOGITECH=3Dy
># CONFIG_HID_LOGITECH_HIDPP is not set
>CONFIG_LOGITECH_FF=3Dy
># CONFIG_LOGIRUMBLEPAD2_FF is not set
># CONFIG_LOGIG940_FF is not set
># CONFIG_LOGIWHEELS_FF is not set
># CONFIG_HID_MAGICMOUSE is not set
>CONFIG_HID_MAYFLASH=3Dy
>CONFIG_HID_MICROSOFT=3Dy
>CONFIG_HID_MONTEREY=3Dy
># CONFIG_HID_MULTITOUCH is not set
># CONFIG_HID_NTI is not set
># CONFIG_HID_ORTEK is not set
>CONFIG_HID_PANTHERLORD=3Dy
>CONFIG_PANTHERLORD_FF=3Dy
>CONFIG_HID_PETALYNX=3Dy
>CONFIG_HID_PICOLCD=3Dy
>CONFIG_HID_PICOLCD_FB=3Dy
>CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
>CONFIG_HID_PICOLCD_LCD=3Dy
># CONFIG_HID_PICOLCD_LEDS is not set
>CONFIG_HID_PICOLCD_CIR=3Dy
># CONFIG_HID_PLANTRONICS is not set
># CONFIG_HID_PRIMAX is not set
>CONFIG_HID_SAITEK=3Dy
>CONFIG_HID_SAMSUNG=3Dy
># CONFIG_HID_SPEEDLINK is not set
># CONFIG_HID_STEELSERIES is not set
>CONFIG_HID_SUNPLUS=3Dy
>CONFIG_HID_RMI=3Dy
>CONFIG_HID_GREENASIA=3Dy
># CONFIG_GREENASIA_FF is not set
>CONFIG_HID_SMARTJOYPLUS=3Dy
># CONFIG_SMARTJOYPLUS_FF is not set
>CONFIG_HID_TIVO=3Dy
>CONFIG_HID_TOPSEED=3Dy
>CONFIG_HID_THINGM=3Dy
># CONFIG_HID_THRUSTMASTER is not set
>CONFIG_HID_UDRAW_PS3=3Dy
>CONFIG_HID_WIIMOTE=3Dy
>CONFIG_HID_XINMO=3Dy
>CONFIG_HID_ZEROPLUS=3Dy
># CONFIG_ZEROPLUS_FF is not set
>CONFIG_HID_ZYDACRON=3Dy
># CONFIG_HID_SENSOR_HUB is not set
>CONFIG_HID_ALPS=3Dy
>
>#
># I2C HID support
>#
># CONFIG_I2C_HID is not set
>
>#
># Intel ISH HID support
>#
># CONFIG_INTEL_ISH_HID is not set
>CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
>CONFIG_USB_SUPPORT=3Dy
>CONFIG_USB_ARCH_HAS_HCD=3Dy
># CONFIG_USB is not set
>CONFIG_USB_PCI=3Dy
>
>#
># USB port drivers
>#
>
>#
># USB Physical Layer drivers
>#
># CONFIG_USB_PHY is not set
># CONFIG_NOP_USB_XCEIV is not set
># CONFIG_USB_GPIO_VBUS is not set
># CONFIG_TAHVO_USB is not set
># CONFIG_USB_GADGET is not set
>
>#
># USB Power Delivery and Type-C drivers
>#
># CONFIG_TYPEC_UCSI is not set
># CONFIG_TYPEC_TPS6598X is not set
># CONFIG_USB_ULPI_BUS is not set
># CONFIG_UWB is not set
>CONFIG_MMC=3Dy
># CONFIG_PWRSEQ_EMMC is not set
>CONFIG_PWRSEQ_SIMPLE=3Dy
>CONFIG_MMC_BLOCK=3Dy
>CONFIG_MMC_BLOCK_MINORS=3D8
>CONFIG_SDIO_UART=3Dy
>CONFIG_MMC_TEST=3Dy
>
>#
># MMC/SD/SDIO Host Controller Drivers
>#
># CONFIG_MMC_DEBUG is not set
># CONFIG_MMC_SDHCI is not set
># CONFIG_MMC_TIFM_SD is not set
># CONFIG_MMC_CB710 is not set
># CONFIG_MMC_VIA_SDMMC is not set
>CONFIG_MMC_USDHI6ROL0=3Dy
>CONFIG_MMC_REALTEK_PCI=3Dy
>CONFIG_MMC_TOSHIBA_PCI=3Dy
>CONFIG_MMC_MTK=3Dy
>CONFIG_MEMSTICK=3Dy
>CONFIG_MEMSTICK_DEBUG=3Dy
>
>#
># MemoryStick drivers
>#
># CONFIG_MEMSTICK_UNSAFE_RESUME is not set
># CONFIG_MSPRO_BLOCK is not set
>CONFIG_MS_BLOCK=3Dy
>
>#
># MemoryStick Host Controller Drivers
>#
># CONFIG_MEMSTICK_TIFM_MS is not set
>CONFIG_MEMSTICK_JMICRON_38X=3Dy
># CONFIG_MEMSTICK_R592 is not set
># CONFIG_MEMSTICK_REALTEK_PCI is not set
>CONFIG_NEW_LEDS=3Dy
>CONFIG_LEDS_CLASS=3Dy
>CONFIG_LEDS_CLASS_FLASH=3Dy
># CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
>
>#
># LED drivers
>#
>CONFIG_LEDS_88PM860X=3Dy
>CONFIG_LEDS_AS3645A=3Dy
># CONFIG_LEDS_BCM6328 is not set
>CONFIG_LEDS_BCM6358=3Dy
># CONFIG_LEDS_LM3530 is not set
>CONFIG_LEDS_LM3642=3Dy
># CONFIG_LEDS_PCA9532 is not set
>CONFIG_LEDS_GPIO=3Dy
># CONFIG_LEDS_LP3944 is not set
>CONFIG_LEDS_LP3952=3Dy
>CONFIG_LEDS_LP55XX_COMMON=3Dy
># CONFIG_LEDS_LP5521 is not set
># CONFIG_LEDS_LP5523 is not set
>CONFIG_LEDS_LP5562=3Dy
># CONFIG_LEDS_LP8501 is not set
>CONFIG_LEDS_LP8860=3Dy
>CONFIG_LEDS_PCA955X=3Dy
># CONFIG_LEDS_PCA955X_GPIO is not set
>CONFIG_LEDS_PCA963X=3Dy
>CONFIG_LEDS_DA903X=3Dy
>CONFIG_LEDS_PWM=3Dy
>CONFIG_LEDS_REGULATOR=3Dy
># CONFIG_LEDS_BD2802 is not set
>CONFIG_LEDS_LT3593=3Dy
># CONFIG_LEDS_ADP5520 is not set
>CONFIG_LEDS_TCA6507=3Dy
>CONFIG_LEDS_TLC591XX=3Dy
>CONFIG_LEDS_MAX77693=3Dy
>CONFIG_LEDS_MAX8997=3Dy
># CONFIG_LEDS_LM355x is not set
># CONFIG_LEDS_MENF21BMC is not set
>CONFIG_LEDS_KTD2692=3Dy
>CONFIG_LEDS_IS31FL319X=3Dy
>CONFIG_LEDS_IS31FL32XX=3Dy
>
>#
># LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_TH=
INGM)
>#
>CONFIG_LEDS_BLINKM=3Dy
>CONFIG_LEDS_SYSCON=3Dy
>CONFIG_LEDS_USER=3Dy
># CONFIG_LEDS_NIC78BX is not set
>
>#
># LED Triggers
>#
># CONFIG_LEDS_TRIGGERS is not set
>CONFIG_ACCESSIBILITY=3Dy
>CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>CONFIG_EDAC_SUPPORT=3Dy
># CONFIG_EDAC is not set
>CONFIG_RTC_LIB=3Dy
>CONFIG_RTC_MC146818_LIB=3Dy
># CONFIG_RTC_CLASS is not set
># CONFIG_DMADEVICES is not set
>
>#
># DMABUF options
>#
>CONFIG_SYNC_FILE=3Dy
>CONFIG_SW_SYNC=3Dy
># CONFIG_AUXDISPLAY is not set
>CONFIG_CHARLCD=3Dy
>CONFIG_PANEL=3Dy
>CONFIG_PANEL_PARPORT=3D0
>CONFIG_PANEL_PROFILE=3D5
># CONFIG_PANEL_CHANGE_MESSAGE is not set
>CONFIG_UIO=3Dy
># CONFIG_UIO_CIF is not set
>CONFIG_UIO_PDRV_GENIRQ=3Dy
>CONFIG_UIO_DMEM_GENIRQ=3Dy
># CONFIG_UIO_AEC is not set
>CONFIG_UIO_SERCOS3=3Dy
>CONFIG_UIO_PCI_GENERIC=3Dy
>CONFIG_UIO_NETX=3Dy
># CONFIG_UIO_PRUSS is not set
>CONFIG_UIO_MF624=3Dy
>CONFIG_VIRT_DRIVERS=3Dy
>CONFIG_VIRTIO=3Dy
>
>#
># Virtio drivers
>#
># CONFIG_VIRTIO_PCI is not set
>CONFIG_VIRTIO_BALLOON=3Dy
># CONFIG_VIRTIO_INPUT is not set
>CONFIG_VIRTIO_MMIO=3Dy
># CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
>
>#
># Microsoft Hyper-V guest support
>#
># CONFIG_HYPERV is not set
># CONFIG_HYPERV_TSCPAGE is not set
># CONFIG_STAGING is not set
>CONFIG_X86_PLATFORM_DEVICES=3Dy
># CONFIG_ACER_WMI is not set
># CONFIG_ACERHDF is not set
># CONFIG_ALIENWARE_WMI is not set
># CONFIG_ASUS_LAPTOP is not set
># CONFIG_DELL_SMBIOS_WMI is not set
># CONFIG_DELL_SMBIOS_SMM is not set
># CONFIG_DELL_WMI_AIO is not set
># CONFIG_DELL_WMI_LED is not set
># CONFIG_DELL_SMO8800 is not set
># CONFIG_FUJITSU_LAPTOP is not set
># CONFIG_FUJITSU_TABLET is not set
># CONFIG_HP_ACCEL is not set
># CONFIG_HP_WIRELESS is not set
># CONFIG_HP_WMI is not set
># CONFIG_PANASONIC_LAPTOP is not set
># CONFIG_THINKPAD_ACPI is not set
># CONFIG_SENSORS_HDAPS is not set
># CONFIG_INTEL_MENLOW is not set
># CONFIG_EEEPC_LAPTOP is not set
># CONFIG_ASUS_WMI is not set
># CONFIG_ASUS_WIRELESS is not set
>CONFIG_ACPI_WMI=3Dy
>CONFIG_WMI_BMOF=3Dy
># CONFIG_INTEL_WMI_THUNDERBOLT is not set
># CONFIG_MSI_WMI is not set
># CONFIG_PEAQ_WMI is not set
># CONFIG_TOPSTAR_LAPTOP is not set
># CONFIG_ACPI_TOSHIBA is not set
># CONFIG_TOSHIBA_BT_RFKILL is not set
># CONFIG_TOSHIBA_HAPS is not set
># CONFIG_TOSHIBA_WMI is not set
># CONFIG_ACPI_CMPC is not set
># CONFIG_INTEL_CHT_INT33FE is not set
># CONFIG_INTEL_INT0002_VGPIO is not set
># CONFIG_INTEL_HID_EVENT is not set
># CONFIG_INTEL_VBTN is not set
># CONFIG_INTEL_IPS is not set
># CONFIG_INTEL_PMC_CORE is not set
># CONFIG_IBM_RTL is not set
># CONFIG_SAMSUNG_LAPTOP is not set
>CONFIG_MXM_WMI=3Dy
># CONFIG_SAMSUNG_Q10 is not set
># CONFIG_APPLE_GMUX is not set
># CONFIG_INTEL_RST is not set
># CONFIG_INTEL_SMARTCONNECT is not set
># CONFIG_PVPANIC is not set
># CONFIG_INTEL_PMC_IPC is not set
># CONFIG_SURFACE_PRO3_BUTTON is not set
># CONFIG_INTEL_PUNIT_IPC is not set
># CONFIG_MLX_PLATFORM is not set
># CONFIG_MLX_CPLD_PLATFORM is not set
>CONFIG_PMC_ATOM=3Dy
># CONFIG_CHROME_PLATFORMS is not set
>CONFIG_CLKDEV_LOOKUP=3Dy
>CONFIG_HAVE_CLK_PREPARE=3Dy
>CONFIG_COMMON_CLK=3Dy
>
>#
># Common Clock Framework
>#
># CONFIG_CLK_HSDK is not set
># CONFIG_COMMON_CLK_MAX77686 is not set
># CONFIG_COMMON_CLK_RK808 is not set
># CONFIG_COMMON_CLK_SI5351 is not set
>CONFIG_COMMON_CLK_SI514=3Dy
># CONFIG_COMMON_CLK_SI570 is not set
># CONFIG_COMMON_CLK_CDCE706 is not set
>CONFIG_COMMON_CLK_CDCE925=3Dy
>CONFIG_COMMON_CLK_CS2000_CP=3Dy
># CONFIG_COMMON_CLK_NXP is not set
>CONFIG_COMMON_CLK_PALMAS=3Dy
># CONFIG_COMMON_CLK_PWM is not set
># CONFIG_COMMON_CLK_PXA is not set
># CONFIG_COMMON_CLK_PIC32 is not set
>CONFIG_COMMON_CLK_VC5=3Dy
>CONFIG_HWSPINLOCK=3Dy
>
>#
># Clock Source drivers
>#
>CONFIG_CLKEVT_I8253=3Dy
>CONFIG_I8253_LOCK=3Dy
>CONFIG_CLKBLD_I8253=3Dy
># CONFIG_ATMEL_PIT is not set
># CONFIG_SH_TIMER_CMT is not set
># CONFIG_SH_TIMER_MTU2 is not set
># CONFIG_SH_TIMER_TMU is not set
># CONFIG_EM_TIMER_STI is not set
># CONFIG_MAILBOX is not set
>CONFIG_IOMMU_SUPPORT=3Dy
>
>#
># Generic IOMMU Pagetable Support
>#
># CONFIG_AMD_IOMMU is not set
># CONFIG_INTEL_IOMMU is not set
># CONFIG_IRQ_REMAP is not set
>
>#
># Remoteproc drivers
>#
># CONFIG_REMOTEPROC is not set
>
>#
># Rpmsg drivers
>#
># CONFIG_RPMSG_VIRTIO is not set
>
>#
># SOC (System On Chip) specific Drivers
>#
>
>#
># Amlogic SoC drivers
>#
>
>#
># Broadcom SoC drivers
>#
>
>#
># i.MX SoC drivers
>#
>
>#
># Qualcomm SoC drivers
>#
># CONFIG_SUNXI_SRAM is not set
># CONFIG_SOC_TI is not set
># CONFIG_PM_DEVFREQ is not set
>CONFIG_EXTCON=3Dy
>
>#
># Extcon Device Drivers
>#
># CONFIG_EXTCON_ADC_JACK is not set
>CONFIG_EXTCON_GPIO=3Dy
># CONFIG_EXTCON_INTEL_INT3496 is not set
>CONFIG_EXTCON_MAX14577=3Dy
>CONFIG_EXTCON_MAX3355=3Dy
>CONFIG_EXTCON_MAX77693=3Dy
>CONFIG_EXTCON_MAX8997=3Dy
>CONFIG_EXTCON_PALMAS=3Dy
># CONFIG_EXTCON_RT8973A is not set
># CONFIG_EXTCON_SM5502 is not set
>CONFIG_EXTCON_USB_GPIO=3Dy
>CONFIG_MEMORY=3Dy
>CONFIG_IIO=3Dy
>CONFIG_IIO_BUFFER=3Dy
># CONFIG_IIO_BUFFER_CB is not set
>CONFIG_IIO_KFIFO_BUF=3Dy
>CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>CONFIG_IIO_CONFIGFS=3Dy
>CONFIG_IIO_TRIGGER=3Dy
>CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
># CONFIG_IIO_SW_DEVICE is not set
>CONFIG_IIO_SW_TRIGGER=3Dy
>
>#
># Accelerometers
>#
>CONFIG_BMA180=3Dy
>CONFIG_BMC150_ACCEL=3Dy
>CONFIG_BMC150_ACCEL_I2C=3Dy
># CONFIG_DA280 is not set
># CONFIG_DA311 is not set
>CONFIG_DMARD06=3Dy
>CONFIG_DMARD09=3Dy
>CONFIG_DMARD10=3Dy
># CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
># CONFIG_KXSD9 is not set
>CONFIG_KXCJK1013=3Dy
># CONFIG_MC3230 is not set
>CONFIG_MMA7455=3Dy
>CONFIG_MMA7455_I2C=3Dy
>CONFIG_MMA7660=3Dy
># CONFIG_MMA8452 is not set
>CONFIG_MMA9551_CORE=3Dy
>CONFIG_MMA9551=3Dy
>CONFIG_MMA9553=3Dy
>CONFIG_MXC4005=3Dy
>CONFIG_MXC6255=3Dy
>CONFIG_STK8312=3Dy
>CONFIG_STK8BA50=3Dy
>
>#
># Analog to digital converters
>#
>CONFIG_AD7291=3Dy
>CONFIG_AD799X=3Dy
>CONFIG_CC10001_ADC=3Dy
>CONFIG_ENVELOPE_DETECTOR=3Dy
>CONFIG_HX711=3Dy
>CONFIG_LTC2471=3Dy
>CONFIG_LTC2485=3Dy
>CONFIG_LTC2497=3Dy
>CONFIG_MAX1363=3Dy
>CONFIG_MAX9611=3Dy
>CONFIG_MCP3422=3Dy
>CONFIG_MEN_Z188_ADC=3Dy
>CONFIG_NAU7802=3Dy
># CONFIG_PALMAS_GPADC is not set
>CONFIG_TI_ADC081C=3Dy
>CONFIG_TI_AM335X_ADC=3Dy
># CONFIG_VF610_ADC is not set
>
>#
># Amplifiers
>#
>
>#
># Chemical Sensors
>#
>CONFIG_ATLAS_PH_SENSOR=3Dy
>CONFIG_CCS811=3Dy
>CONFIG_IAQCORE=3Dy
># CONFIG_VZ89X is not set
>
>#
># Hid Sensor IIO Common
>#
>CONFIG_IIO_MS_SENSORS_I2C=3Dy
>
>#
># SSP Sensor Common
>#
>CONFIG_IIO_ST_SENSORS_I2C=3Dy
>CONFIG_IIO_ST_SENSORS_CORE=3Dy
>
>#
># Counters
>#
>
>#
># Digital to analog converters
>#
>CONFIG_AD5064=3Dy
># CONFIG_AD5380 is not set
># CONFIG_AD5446 is not set
>CONFIG_AD5592R_BASE=3Dy
>CONFIG_AD5593R=3Dy
># CONFIG_CIO_DAC is not set
>CONFIG_DPOT_DAC=3Dy
># CONFIG_DS4424 is not set
>CONFIG_M62332=3Dy
># CONFIG_MAX517 is not set
>CONFIG_MAX5821=3Dy
>CONFIG_MCP4725=3Dy
># CONFIG_VF610_DAC is not set
>
>#
># IIO dummy driver
>#
>
>#
># Frequency Synthesizers DDS/PLL
>#
>
>#
># Clock Generator/Distribution
>#
>
>#
># Phase-Locked Loop (PLL) frequency synthesizers
>#
>
>#
># Digital gyroscope sensors
>#
># CONFIG_BMG160 is not set
>CONFIG_MPU3050=3Dy
>CONFIG_MPU3050_I2C=3Dy
>CONFIG_IIO_ST_GYRO_3AXIS=3Dy
>CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
># CONFIG_ITG3200 is not set
>
>#
># Health Sensors
>#
>
>#
># Heart Rate Monitors
>#
>CONFIG_AFE4404=3Dy
># CONFIG_MAX30100 is not set
>CONFIG_MAX30102=3Dy
>
>#
># Humidity sensors
>#
>CONFIG_AM2315=3Dy
>CONFIG_DHT11=3Dy
>CONFIG_HDC100X=3Dy
>CONFIG_HTS221=3Dy
>CONFIG_HTS221_I2C=3Dy
>CONFIG_HTU21=3Dy
># CONFIG_SI7005 is not set
># CONFIG_SI7020 is not set
>
>#
># Inertial measurement units
>#
>CONFIG_BMI160=3Dy
>CONFIG_BMI160_I2C=3Dy
>CONFIG_KMX61=3Dy
># CONFIG_INV_MPU6050_I2C is not set
>CONFIG_IIO_ST_LSM6DSX=3Dy
>CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
>
>#
># Light sensors
>#
># CONFIG_ACPI_ALS is not set
>CONFIG_ADJD_S311=3Dy
># CONFIG_AL3320A is not set
>CONFIG_APDS9300=3Dy
>CONFIG_APDS9960=3Dy
># CONFIG_BH1750 is not set
>CONFIG_BH1780=3Dy
>CONFIG_CM32181=3Dy
># CONFIG_CM3232 is not set
>CONFIG_CM3323=3Dy
>CONFIG_CM3605=3Dy
>CONFIG_CM36651=3Dy
># CONFIG_GP2AP020A00F is not set
>CONFIG_SENSORS_ISL29018=3Dy
>CONFIG_SENSORS_ISL29028=3Dy
>CONFIG_ISL29125=3Dy
>CONFIG_JSA1212=3Dy
>CONFIG_RPR0521=3Dy
># CONFIG_LTR501 is not set
># CONFIG_MAX44000 is not set
>CONFIG_OPT3001=3Dy
># CONFIG_PA12203001 is not set
>CONFIG_SI1145=3Dy
>CONFIG_STK3310=3Dy
># CONFIG_TCS3414 is not set
># CONFIG_TCS3472 is not set
>CONFIG_SENSORS_TSL2563=3Dy
>CONFIG_TSL2583=3Dy
>CONFIG_TSL4531=3Dy
>CONFIG_US5182D=3Dy
>CONFIG_VCNL4000=3Dy
># CONFIG_VEML6070 is not set
>CONFIG_VL6180=3Dy
>
>#
># Magnetometer sensors
>#
>CONFIG_AK8974=3Dy
>CONFIG_AK8975=3Dy
>CONFIG_AK09911=3Dy
># CONFIG_BMC150_MAGN_I2C is not set
>CONFIG_MAG3110=3Dy
>CONFIG_MMC35240=3Dy
># CONFIG_IIO_ST_MAGN_3AXIS is not set
># CONFIG_SENSORS_HMC5843_I2C is not set
>
>#
># Multiplexers
>#
># CONFIG_IIO_MUX is not set
>
>#
># Inclinometer sensors
>#
>
>#
># Triggers - standalone
>#
># CONFIG_IIO_HRTIMER_TRIGGER is not set
>CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
># CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
>CONFIG_IIO_SYSFS_TRIGGER=3Dy
>
>#
># Digital potentiometers
>#
># CONFIG_DS1803 is not set
># CONFIG_MCP4531 is not set
>CONFIG_TPL0102=3Dy
>
>#
># Digital potentiostats
>#
># CONFIG_LMP91000 is not set
>
>#
># Pressure sensors
>#
>CONFIG_ABP060MG=3Dy
>CONFIG_BMP280=3Dy
>CONFIG_BMP280_I2C=3Dy
>CONFIG_HP03=3Dy
>CONFIG_MPL115=3Dy
>CONFIG_MPL115_I2C=3Dy
>CONFIG_MPL3115=3Dy
>CONFIG_MS5611=3Dy
># CONFIG_MS5611_I2C is not set
>CONFIG_MS5637=3Dy
>CONFIG_IIO_ST_PRESS=3Dy
>CONFIG_IIO_ST_PRESS_I2C=3Dy
>CONFIG_T5403=3Dy
># CONFIG_HP206C is not set
>CONFIG_ZPA2326=3Dy
>CONFIG_ZPA2326_I2C=3Dy
>
>#
># Lightning sensors
>#
>
>#
># Proximity and distance sensors
>#
>CONFIG_LIDAR_LITE_V2=3Dy
># CONFIG_RFD77402 is not set
># CONFIG_SRF04 is not set
>CONFIG_SX9500=3Dy
>CONFIG_SRF08=3Dy
>
>#
># Temperature sensors
>#
>CONFIG_MLX90614=3Dy
># CONFIG_TMP006 is not set
># CONFIG_TMP007 is not set
># CONFIG_TSYS01 is not set
>CONFIG_TSYS02D=3Dy
>CONFIG_NTB=3Dy
>CONFIG_NTB_AMD=3Dy
>CONFIG_NTB_IDT=3Dy
># CONFIG_NTB_INTEL is not set
># CONFIG_NTB_SWITCHTEC is not set
># CONFIG_NTB_PINGPONG is not set
>CONFIG_NTB_TOOL=3Dy
>CONFIG_NTB_PERF=3Dy
># CONFIG_NTB_TRANSPORT is not set
># CONFIG_VME_BUS is not set
>CONFIG_PWM=3Dy
>CONFIG_PWM_SYSFS=3Dy
>CONFIG_PWM_FSL_FTM=3Dy
>CONFIG_PWM_LP3943=3Dy
>CONFIG_PWM_LPSS=3Dy
>CONFIG_PWM_LPSS_PCI=3Dy
># CONFIG_PWM_LPSS_PLATFORM is not set
>CONFIG_PWM_PCA9685=3Dy
>
>#
># IRQ chip support
>#
>CONFIG_IRQCHIP=3Dy
>CONFIG_ARM_GIC_MAX_NR=3D1
>CONFIG_IPACK_BUS=3Dy
>CONFIG_BOARD_TPCI200=3Dy
># CONFIG_SERIAL_IPOCTAL is not set
>CONFIG_RESET_CONTROLLER=3Dy
># CONFIG_RESET_ATH79 is not set
># CONFIG_RESET_AXS10X is not set
># CONFIG_RESET_BERLIN is not set
># CONFIG_RESET_IMX7 is not set
># CONFIG_RESET_LANTIQ is not set
># CONFIG_RESET_LPC18XX is not set
># CONFIG_RESET_MESON is not set
># CONFIG_RESET_PISTACHIO is not set
># CONFIG_RESET_SIMPLE is not set
># CONFIG_RESET_SUNXI is not set
>CONFIG_RESET_TI_SYSCON=3Dy
># CONFIG_RESET_ZYNQ is not set
># CONFIG_RESET_TEGRA_BPMP is not set
># CONFIG_FMC is not set
>
>#
># PHY Subsystem
>#
>CONFIG_GENERIC_PHY=3Dy
>CONFIG_BCM_KONA_USB2_PHY=3Dy
>CONFIG_PHY_PXA_28NM_HSIC=3Dy
>CONFIG_PHY_PXA_28NM_USB2=3Dy
># CONFIG_PHY_CPCAP_USB is not set
># CONFIG_POWERCAP is not set
>CONFIG_MCB=3Dy
># CONFIG_MCB_PCI is not set
># CONFIG_MCB_LPC is not set
>
>#
># Performance monitor support
>#
>CONFIG_RAS=3Dy
>CONFIG_THUNDERBOLT=3Dy
>
>#
># Android
>#
>CONFIG_ANDROID=3Dy
>CONFIG_ANDROID_BINDER_IPC=3Dy
>CONFIG_ANDROID_BINDER_DEVICES=3D"binder,hwbinder,vndbinder"
>CONFIG_ANDROID_BINDER_IPC_SELFTEST=3Dy
>CONFIG_LIBNVDIMM=3Dy
># CONFIG_BLK_DEV_PMEM is not set
>CONFIG_ND_BLK=3Dy
># CONFIG_BTT is not set
>CONFIG_DAX=3Dy
># CONFIG_DEV_DAX is not set
>CONFIG_NVMEM=3Dy
>CONFIG_STM=3Dy
>CONFIG_STM_DUMMY=3Dy
>CONFIG_STM_SOURCE_CONSOLE=3Dy
>CONFIG_STM_SOURCE_HEARTBEAT=3Dy
>CONFIG_STM_SOURCE_FTRACE=3Dy
>CONFIG_INTEL_TH=3Dy
>CONFIG_INTEL_TH_PCI=3Dy
># CONFIG_INTEL_TH_GTH is not set
>CONFIG_INTEL_TH_STH=3Dy
>CONFIG_INTEL_TH_MSU=3Dy
># CONFIG_INTEL_TH_PTI is not set
>CONFIG_INTEL_TH_DEBUG=3Dy
>CONFIG_FPGA=3Dy
># CONFIG_FPGA_REGION is not set
># CONFIG_FPGA_MGR_ALTERA_CVP is not set
>CONFIG_FPGA_BRIDGE=3Dy
>CONFIG_ALTERA_PR_IP_CORE=3Dy
>CONFIG_ALTERA_PR_IP_CORE_PLAT=3Dy
>CONFIG_XILINX_PR_DECOUPLER=3Dy
>
>#
># FSI support
>#
>CONFIG_FSI=3Dy
># CONFIG_FSI_MASTER_GPIO is not set
>CONFIG_FSI_MASTER_HUB=3Dy
>CONFIG_FSI_SCOM=3Dy
>CONFIG_PM_OPP=3Dy
>
>#
># Firmware Drivers
>#
>CONFIG_EDD=3Dy
># CONFIG_EDD_OFF is not set
>CONFIG_FIRMWARE_MEMMAP=3Dy
># CONFIG_DELL_RBU is not set
>CONFIG_DCDBAS=3Dy
># CONFIG_ISCSI_IBFT_FIND is not set
>CONFIG_FW_CFG_SYSFS=3Dy
># CONFIG_FW_CFG_SYSFS_CMDLINE is not set
>CONFIG_GOOGLE_FIRMWARE=3Dy
>CONFIG_GOOGLE_COREBOOT_TABLE=3Dy
># CONFIG_GOOGLE_COREBOOT_TABLE_ACPI is not set
>CONFIG_GOOGLE_COREBOOT_TABLE_OF=3Dy
>CONFIG_GOOGLE_MEMCONSOLE=3Dy
>CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=3Dy
># CONFIG_GOOGLE_VPD is not set
># CONFIG_EFI_DEV_PATH_PARSER is not set
>
>#
># Tegra firmware driver
>#
>
>#
># File systems
>#
>CONFIG_DCACHE_WORD_ACCESS=3Dy
>CONFIG_FS_IOMAP=3Dy
>CONFIG_EXT2_FS=3Dy
>CONFIG_EXT2_FS_XATTR=3Dy
># CONFIG_EXT2_FS_POSIX_ACL is not set
># CONFIG_EXT2_FS_SECURITY is not set
>CONFIG_EXT3_FS=3Dy
>CONFIG_EXT3_FS_POSIX_ACL=3Dy
>CONFIG_EXT3_FS_SECURITY=3Dy
>CONFIG_EXT4_FS=3Dy
>CONFIG_EXT4_FS_POSIX_ACL=3Dy
>CONFIG_EXT4_FS_SECURITY=3Dy
>CONFIG_EXT4_ENCRYPTION=3Dy
>CONFIG_EXT4_FS_ENCRYPTION=3Dy
># CONFIG_EXT4_DEBUG is not set
>CONFIG_JBD2=3Dy
># CONFIG_JBD2_DEBUG is not set
>CONFIG_FS_MBCACHE=3Dy
># CONFIG_REISERFS_FS is not set
>CONFIG_JFS_FS=3Dy
>CONFIG_JFS_POSIX_ACL=3Dy
>CONFIG_JFS_SECURITY=3Dy
># CONFIG_JFS_DEBUG is not set
># CONFIG_JFS_STATISTICS is not set
>CONFIG_XFS_FS=3Dy
># CONFIG_XFS_QUOTA is not set
>CONFIG_XFS_POSIX_ACL=3Dy
># CONFIG_XFS_RT is not set
># CONFIG_XFS_ONLINE_SCRUB is not set
># CONFIG_XFS_WARN is not set
># CONFIG_XFS_DEBUG is not set
># CONFIG_GFS2_FS is not set
># CONFIG_OCFS2_FS is not set
>CONFIG_BTRFS_FS=3Dy
>CONFIG_BTRFS_FS_POSIX_ACL=3Dy
># CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
># CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
># CONFIG_BTRFS_DEBUG is not set
>CONFIG_BTRFS_ASSERT=3Dy
># CONFIG_BTRFS_FS_REF_VERIFY is not set
>CONFIG_NILFS2_FS=3Dy
>CONFIG_F2FS_FS=3Dy
>CONFIG_F2FS_STAT_FS=3Dy
>CONFIG_F2FS_FS_XATTR=3Dy
>CONFIG_F2FS_FS_POSIX_ACL=3Dy
># CONFIG_F2FS_FS_SECURITY is not set
># CONFIG_F2FS_CHECK_FS is not set
># CONFIG_F2FS_FS_ENCRYPTION is not set
>CONFIG_F2FS_IO_TRACE=3Dy
># CONFIG_F2FS_FAULT_INJECTION is not set
>CONFIG_FS_DAX=3Dy
>CONFIG_FS_POSIX_ACL=3Dy
>CONFIG_EXPORTFS=3Dy
># CONFIG_EXPORTFS_BLOCK_OPS is not set
>CONFIG_FILE_LOCKING=3Dy
>CONFIG_MANDATORY_FILE_LOCKING=3Dy
>CONFIG_FS_ENCRYPTION=3Dy
>CONFIG_FSNOTIFY=3Dy
>CONFIG_DNOTIFY=3Dy
>CONFIG_INOTIFY_USER=3Dy
># CONFIG_FANOTIFY is not set
># CONFIG_QUOTA is not set
># CONFIG_QUOTACTL is not set
>CONFIG_AUTOFS4_FS=3Dy
>CONFIG_FUSE_FS=3Dy
>CONFIG_CUSE=3Dy
>CONFIG_OVERLAY_FS=3Dy
>CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
># CONFIG_OVERLAY_FS_INDEX is not set
>
>#
># Caches
>#
># CONFIG_FSCACHE is not set
>
>#
># CD-ROM/DVD Filesystems
>#
>CONFIG_ISO9660_FS=3Dy
>CONFIG_JOLIET=3Dy
>CONFIG_ZISOFS=3Dy
>CONFIG_UDF_FS=3Dy
>CONFIG_UDF_NLS=3Dy
>
>#
># DOS/FAT/NT Filesystems
>#
>CONFIG_FAT_FS=3Dy
>CONFIG_MSDOS_FS=3Dy
>CONFIG_VFAT_FS=3Dy
>CONFIG_FAT_DEFAULT_CODEPAGE=3D437
>CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
>CONFIG_FAT_DEFAULT_UTF8=3Dy
>CONFIG_NTFS_FS=3Dy
>CONFIG_NTFS_DEBUG=3Dy
>CONFIG_NTFS_RW=3Dy
>
>#
># Pseudo filesystems
>#
>CONFIG_PROC_FS=3Dy
># CONFIG_PROC_KCORE is not set
># CONFIG_PROC_VMCORE is not set
># CONFIG_PROC_SYSCTL is not set
># CONFIG_PROC_PAGE_MONITOR is not set
>CONFIG_PROC_CHILDREN=3Dy
>CONFIG_KERNFS=3Dy
>CONFIG_SYSFS=3Dy
>CONFIG_TMPFS=3Dy
># CONFIG_TMPFS_POSIX_ACL is not set
>CONFIG_TMPFS_XATTR=3Dy
># CONFIG_HUGETLBFS is not set
># CONFIG_HUGETLB_PAGE is not set
>CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
>CONFIG_CONFIGFS_FS=3Dy
>CONFIG_MISC_FILESYSTEMS=3Dy
># CONFIG_ORANGEFS_FS is not set
>CONFIG_ADFS_FS=3Dy
># CONFIG_ADFS_FS_RW is not set
># CONFIG_AFFS_FS is not set
>CONFIG_ECRYPT_FS=3Dy
># CONFIG_ECRYPT_FS_MESSAGING is not set
>CONFIG_HFS_FS=3Dy
>CONFIG_HFSPLUS_FS=3Dy
>CONFIG_HFSPLUS_FS_POSIX_ACL=3Dy
>CONFIG_BEFS_FS=3Dy
>CONFIG_BEFS_DEBUG=3Dy
># CONFIG_BFS_FS is not set
># CONFIG_EFS_FS is not set
>CONFIG_JFFS2_FS=3Dy
>CONFIG_JFFS2_FS_DEBUG=3D0
>CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
>CONFIG_JFFS2_FS_WBUF_VERIFY=3Dy
>CONFIG_JFFS2_SUMMARY=3Dy
>CONFIG_JFFS2_FS_XATTR=3Dy
>CONFIG_JFFS2_FS_POSIX_ACL=3Dy
>CONFIG_JFFS2_FS_SECURITY=3Dy
>CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
># CONFIG_JFFS2_ZLIB is not set
># CONFIG_JFFS2_LZO is not set
># CONFIG_JFFS2_RTIME is not set
># CONFIG_JFFS2_RUBIN is not set
># CONFIG_JFFS2_CMODE_NONE is not set
># CONFIG_JFFS2_CMODE_PRIORITY is not set
># CONFIG_JFFS2_CMODE_SIZE is not set
>CONFIG_JFFS2_CMODE_FAVOURLZO=3Dy
>CONFIG_UBIFS_FS=3Dy
># CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
>CONFIG_UBIFS_FS_LZO=3Dy
>CONFIG_UBIFS_FS_ZLIB=3Dy
># CONFIG_UBIFS_ATIME_SUPPORT is not set
># CONFIG_UBIFS_FS_ENCRYPTION is not set
>CONFIG_UBIFS_FS_SECURITY=3Dy
>CONFIG_CRAMFS=3Dy
>CONFIG_CRAMFS_BLOCKDEV=3Dy
># CONFIG_CRAMFS_MTD is not set
>CONFIG_SQUASHFS=3Dy
># CONFIG_SQUASHFS_FILE_CACHE is not set
>CONFIG_SQUASHFS_FILE_DIRECT=3Dy
>CONFIG_SQUASHFS_DECOMP_SINGLE=3Dy
># CONFIG_SQUASHFS_DECOMP_MULTI is not set
># CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
># CONFIG_SQUASHFS_XATTR is not set
># CONFIG_SQUASHFS_ZLIB is not set
># CONFIG_SQUASHFS_LZ4 is not set
># CONFIG_SQUASHFS_LZO is not set
>CONFIG_SQUASHFS_XZ=3Dy
>CONFIG_SQUASHFS_ZSTD=3Dy
># CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
># CONFIG_SQUASHFS_EMBEDDED is not set
>CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
>CONFIG_VXFS_FS=3Dy
># CONFIG_MINIX_FS is not set
>CONFIG_OMFS_FS=3Dy
>CONFIG_HPFS_FS=3Dy
># CONFIG_QNX4FS_FS is not set
># CONFIG_QNX6FS_FS is not set
>CONFIG_ROMFS_FS=3Dy
># CONFIG_ROMFS_BACKED_BY_BLOCK is not set
># CONFIG_ROMFS_BACKED_BY_MTD is not set
>CONFIG_ROMFS_BACKED_BY_BOTH=3Dy
>CONFIG_ROMFS_ON_BLOCK=3Dy
>CONFIG_ROMFS_ON_MTD=3Dy
>CONFIG_PSTORE=3Dy
># CONFIG_PSTORE_ZLIB_COMPRESS is not set
>CONFIG_PSTORE_LZO_COMPRESS=3Dy
># CONFIG_PSTORE_LZ4_COMPRESS is not set
>CONFIG_PSTORE_CONSOLE=3Dy
>CONFIG_PSTORE_PMSG=3Dy
># CONFIG_PSTORE_FTRACE is not set
>CONFIG_PSTORE_RAM=3Dy
># CONFIG_SYSV_FS is not set
>CONFIG_UFS_FS=3Dy
># CONFIG_UFS_FS_WRITE is not set
># CONFIG_UFS_DEBUG is not set
>CONFIG_NETWORK_FILESYSTEMS=3Dy
>CONFIG_NLS=3Dy
>CONFIG_NLS_DEFAULT=3D"iso8859-1"
>CONFIG_NLS_CODEPAGE_437=3Dy
># CONFIG_NLS_CODEPAGE_737 is not set
># CONFIG_NLS_CODEPAGE_775 is not set
># CONFIG_NLS_CODEPAGE_850 is not set
>CONFIG_NLS_CODEPAGE_852=3Dy
>CONFIG_NLS_CODEPAGE_855=3Dy
>CONFIG_NLS_CODEPAGE_857=3Dy
>CONFIG_NLS_CODEPAGE_860=3Dy
># CONFIG_NLS_CODEPAGE_861 is not set
>CONFIG_NLS_CODEPAGE_862=3Dy
># CONFIG_NLS_CODEPAGE_863 is not set
>CONFIG_NLS_CODEPAGE_864=3Dy
>CONFIG_NLS_CODEPAGE_865=3Dy
># CONFIG_NLS_CODEPAGE_866 is not set
># CONFIG_NLS_CODEPAGE_869 is not set
># CONFIG_NLS_CODEPAGE_936 is not set
>CONFIG_NLS_CODEPAGE_950=3Dy
>CONFIG_NLS_CODEPAGE_932=3Dy
>CONFIG_NLS_CODEPAGE_949=3Dy
># CONFIG_NLS_CODEPAGE_874 is not set
># CONFIG_NLS_ISO8859_8 is not set
>CONFIG_NLS_CODEPAGE_1250=3Dy
>CONFIG_NLS_CODEPAGE_1251=3Dy
># CONFIG_NLS_ASCII is not set
>CONFIG_NLS_ISO8859_1=3Dy
># CONFIG_NLS_ISO8859_2 is not set
>CONFIG_NLS_ISO8859_3=3Dy
>CONFIG_NLS_ISO8859_4=3Dy
>CONFIG_NLS_ISO8859_5=3Dy
>CONFIG_NLS_ISO8859_6=3Dy
>CONFIG_NLS_ISO8859_7=3Dy
>CONFIG_NLS_ISO8859_9=3Dy
>CONFIG_NLS_ISO8859_13=3Dy
>CONFIG_NLS_ISO8859_14=3Dy
>CONFIG_NLS_ISO8859_15=3Dy
>CONFIG_NLS_KOI8_R=3Dy
>CONFIG_NLS_KOI8_U=3Dy
># CONFIG_NLS_MAC_ROMAN is not set
>CONFIG_NLS_MAC_CELTIC=3Dy
># CONFIG_NLS_MAC_CENTEURO is not set
>CONFIG_NLS_MAC_CROATIAN=3Dy
>CONFIG_NLS_MAC_CYRILLIC=3Dy
>CONFIG_NLS_MAC_GAELIC=3Dy
>CONFIG_NLS_MAC_GREEK=3Dy
># CONFIG_NLS_MAC_ICELAND is not set
>CONFIG_NLS_MAC_INUIT=3Dy
>CONFIG_NLS_MAC_ROMANIAN=3Dy
>CONFIG_NLS_MAC_TURKISH=3Dy
>CONFIG_NLS_UTF8=3Dy
>
>#
># Kernel hacking
>#
>CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>
>#
># printk and dmesg options
>#
>CONFIG_PRINTK_TIME=3Dy
>CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
>CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>CONFIG_BOOT_PRINTK_DELAY=3Dy
>CONFIG_DYNAMIC_DEBUG=3Dy
>
>#
># Compile-time checks and compiler options
>#
>CONFIG_DEBUG_INFO=3Dy
>CONFIG_DEBUG_INFO_REDUCED=3Dy
># CONFIG_DEBUG_INFO_SPLIT is not set
># CONFIG_DEBUG_INFO_DWARF4 is not set
># CONFIG_GDB_SCRIPTS is not set
>CONFIG_ENABLE_WARN_DEPRECATED=3Dy
># CONFIG_ENABLE_MUST_CHECK is not set
>CONFIG_FRAME_WARN=3D2048
># CONFIG_STRIP_ASM_SYMS is not set
># CONFIG_READABLE_ASM is not set
># CONFIG_UNUSED_SYMBOLS is not set
>CONFIG_PAGE_OWNER=3Dy
>CONFIG_DEBUG_FS=3Dy
>CONFIG_HEADERS_CHECK=3Dy
>CONFIG_DEBUG_SECTION_MISMATCH=3Dy
>CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
>CONFIG_STACK_VALIDATION=3Dy
># CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>CONFIG_MAGIC_SYSRQ=3Dy
>CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
>CONFIG_DEBUG_KERNEL=3Dy
>
>#
># Memory Debugging
>#
>CONFIG_PAGE_EXTENSION=3Dy
>CONFIG_DEBUG_PAGEALLOC=3Dy
>CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
># CONFIG_PAGE_POISONING is not set
>CONFIG_DEBUG_PAGE_REF=3Dy
>CONFIG_DEBUG_RODATA_TEST=3Dy
>CONFIG_DEBUG_OBJECTS=3Dy
># CONFIG_DEBUG_OBJECTS_SELFTEST is not set
>CONFIG_DEBUG_OBJECTS_FREE=3Dy
>CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
>CONFIG_DEBUG_OBJECTS_WORK=3Dy
># CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
># CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
>CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
># CONFIG_DEBUG_SLAB is not set
>CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
># CONFIG_DEBUG_KMEMLEAK is not set
># CONFIG_DEBUG_STACK_USAGE is not set
># CONFIG_DEBUG_VM is not set
>CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
>CONFIG_DEBUG_VIRTUAL=3Dy
>CONFIG_DEBUG_MEMORY_INIT=3Dy
>CONFIG_DEBUG_PER_CPU_MAPS=3Dy
>CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
># CONFIG_DEBUG_STACKOVERFLOW is not set
>CONFIG_HAVE_ARCH_KASAN=3Dy
># CONFIG_KASAN is not set
>CONFIG_ARCH_HAS_KCOV=3Dy
># CONFIG_KCOV is not set
>CONFIG_DEBUG_SHIRQ=3Dy
>
>#
># Debug Lockups and Hangs
>#
>CONFIG_LOCKUP_DETECTOR=3Dy
>CONFIG_SOFTLOCKUP_DETECTOR=3Dy
>CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
>CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
>CONFIG_HARDLOCKUP_DETECTOR=3Dy
>CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
>CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
>CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
>CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
>CONFIG_DETECT_HUNG_TASK=3Dy
>CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
>CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
>CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
>CONFIG_WQ_WATCHDOG=3Dy
>CONFIG_PANIC_ON_OOPS=3Dy
>CONFIG_PANIC_ON_OOPS_VALUE=3D1
>CONFIG_PANIC_TIMEOUT=3D0
>CONFIG_SCHED_DEBUG=3Dy
>CONFIG_SCHED_INFO=3Dy
>CONFIG_SCHEDSTATS=3Dy
>CONFIG_SCHED_STACK_END_CHECK=3Dy
># CONFIG_DEBUG_TIMEKEEPING is not set
>
>#
># Lock Debugging (spinlocks, mutexes, etc...)
>#
>CONFIG_DEBUG_RT_MUTEXES=3Dy
>CONFIG_DEBUG_SPINLOCK=3Dy
># CONFIG_DEBUG_MUTEXES is not set
># CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
># CONFIG_DEBUG_LOCK_ALLOC is not set
># CONFIG_PROVE_LOCKING is not set
># CONFIG_LOCK_STAT is not set
>CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
># CONFIG_LOCK_TORTURE_TEST is not set
>CONFIG_WW_MUTEX_SELFTEST=3Dy
>CONFIG_STACKTRACE=3Dy
>CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
># CONFIG_DEBUG_KOBJECT is not set
># CONFIG_DEBUG_KOBJECT_RELEASE is not set
>CONFIG_DEBUG_BUGVERBOSE=3Dy
>CONFIG_DEBUG_LIST=3Dy
># CONFIG_DEBUG_PI_LIST is not set
>CONFIG_DEBUG_SG=3Dy
>CONFIG_DEBUG_NOTIFIERS=3Dy
># CONFIG_DEBUG_CREDENTIALS is not set
>
>#
># RCU Debugging
>#
># CONFIG_PROVE_RCU is not set
>CONFIG_TORTURE_TEST=3Dy
># CONFIG_RCU_PERF_TEST is not set
>CONFIG_RCU_TORTURE_TEST=3Dy
>CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
>CONFIG_RCU_TRACE=3Dy
>CONFIG_RCU_EQS_DEBUG=3Dy
># CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
># CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
>CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
>CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
># CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
># CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
>CONFIG_FAULT_INJECTION=3Dy
>CONFIG_FAILSLAB=3Dy
>CONFIG_FAIL_PAGE_ALLOC=3Dy
>CONFIG_FAIL_MAKE_REQUEST=3Dy
># CONFIG_FAIL_IO_TIMEOUT is not set
># CONFIG_FAIL_FUTEX is not set
># CONFIG_FAULT_INJECTION_DEBUG_FS is not set
># CONFIG_LATENCYTOP is not set
>CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>CONFIG_NOP_TRACER=3Dy
>CONFIG_HAVE_FUNCTION_TRACER=3Dy
>CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>CONFIG_HAVE_FENTRY=3Dy
>CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>CONFIG_TRACER_MAX_TRACE=3Dy
>CONFIG_TRACE_CLOCK=3Dy
>CONFIG_RING_BUFFER=3Dy
>CONFIG_EVENT_TRACING=3Dy
>CONFIG_CONTEXT_SWITCH_TRACER=3Dy
>CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
>CONFIG_TRACING=3Dy
>CONFIG_GENERIC_TRACER=3Dy
>CONFIG_TRACING_SUPPORT=3Dy
>CONFIG_FTRACE=3Dy
>CONFIG_FUNCTION_TRACER=3Dy
>CONFIG_FUNCTION_GRAPH_TRACER=3Dy
># CONFIG_PREEMPTIRQ_EVENTS is not set
># CONFIG_IRQSOFF_TRACER is not set
>CONFIG_SCHED_TRACER=3Dy
># CONFIG_HWLAT_TRACER is not set
># CONFIG_FTRACE_SYSCALLS is not set
>CONFIG_TRACER_SNAPSHOT=3Dy
># CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
>CONFIG_BRANCH_PROFILE_NONE=3Dy
># CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
># CONFIG_PROFILE_ALL_BRANCHES is not set
># CONFIG_STACK_TRACER is not set
># CONFIG_BLK_DEV_IO_TRACE is not set
>CONFIG_UPROBE_EVENTS=3Dy
>CONFIG_BPF_EVENTS=3Dy
>CONFIG_PROBE_EVENTS=3Dy
># CONFIG_DYNAMIC_FTRACE is not set
>CONFIG_FUNCTION_PROFILER=3Dy
># CONFIG_FTRACE_STARTUP_TEST is not set
>CONFIG_MMIOTRACE=3Dy
># CONFIG_HIST_TRIGGERS is not set
>CONFIG_TRACEPOINT_BENCHMARK=3Dy
>CONFIG_RING_BUFFER_BENCHMARK=3Dy
># CONFIG_RING_BUFFER_STARTUP_TEST is not set
>CONFIG_TRACE_EVAL_MAP_FILE=3Dy
># CONFIG_TRACING_EVENTS_GPIO is not set
>CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
># CONFIG_DMA_API_DEBUG is not set
>
>#
># Runtime Testing
>#
>CONFIG_LKDTM=3Dy
># CONFIG_TEST_LIST_SORT is not set
>CONFIG_TEST_SORT=3Dy
># CONFIG_BACKTRACE_SELF_TEST is not set
>CONFIG_RBTREE_TEST=3Dy
>CONFIG_INTERVAL_TREE_TEST=3Dy
>CONFIG_ATOMIC64_SELFTEST=3Dy
>CONFIG_ASYNC_RAID6_TEST=3Dy
># CONFIG_TEST_HEXDUMP is not set
>CONFIG_TEST_STRING_HELPERS=3Dy
>CONFIG_TEST_KSTRTOX=3Dy
>CONFIG_TEST_PRINTF=3Dy
>CONFIG_TEST_BITMAP=3Dy
># CONFIG_TEST_UUID is not set
>CONFIG_TEST_RHASHTABLE=3Dy
>CONFIG_TEST_HASH=3Dy
># CONFIG_TEST_FIND_BIT is not set
>CONFIG_TEST_FIRMWARE=3Dy
>CONFIG_TEST_UDELAY=3Dy
># CONFIG_TEST_DEBUG_VIRTUAL is not set
># CONFIG_MEMTEST is not set
>CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
># CONFIG_SAMPLES is not set
>CONFIG_HAVE_ARCH_KGDB=3Dy
># CONFIG_KGDB is not set
>CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
># CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
># CONFIG_UBSAN is not set
>CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>CONFIG_STRICT_DEVMEM=3Dy
>CONFIG_IO_STRICT_DEVMEM=3Dy
>CONFIG_X86_VERBOSE_BOOTUP=3Dy
># CONFIG_EARLY_PRINTK is not set
>CONFIG_X86_PTDUMP_CORE=3Dy
>CONFIG_X86_PTDUMP=3Dy
>CONFIG_DEBUG_WX=3Dy
># CONFIG_DOUBLEFAULT is not set
># CONFIG_DEBUG_TLBFLUSH is not set
># CONFIG_IOMMU_STRESS is not set
>CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
>CONFIG_IO_DELAY_TYPE_0X80=3D0
>CONFIG_IO_DELAY_TYPE_0XED=3D1
>CONFIG_IO_DELAY_TYPE_UDELAY=3D2
>CONFIG_IO_DELAY_TYPE_NONE=3D3
># CONFIG_IO_DELAY_0X80 is not set
>CONFIG_IO_DELAY_0XED=3Dy
># CONFIG_IO_DELAY_UDELAY is not set
># CONFIG_IO_DELAY_NONE is not set
>CONFIG_DEFAULT_IO_DELAY_TYPE=3D1
># CONFIG_DEBUG_BOOT_PARAMS is not set
># CONFIG_CPA_DEBUG is not set
>CONFIG_OPTIMIZE_INLINING=3Dy
>CONFIG_DEBUG_ENTRY=3Dy
># CONFIG_DEBUG_NMI_SELFTEST is not set
>CONFIG_X86_DEBUG_FPU=3Dy
># CONFIG_PUNIT_ATOM_DEBUG is not set
>CONFIG_UNWINDER_ORC=3Dy
># CONFIG_UNWINDER_FRAME_POINTER is not set
># CONFIG_UNWINDER_GUESS is not set
>
>#
># Security options
>#
>CONFIG_KEYS=3Dy
>CONFIG_PERSISTENT_KEYRINGS=3Dy
>CONFIG_BIG_KEYS=3Dy
>CONFIG_TRUSTED_KEYS=3Dy
>CONFIG_ENCRYPTED_KEYS=3Dy
>CONFIG_KEY_DH_OPERATIONS=3Dy
>CONFIG_SECURITY_DMESG_RESTRICT=3Dy
># CONFIG_SECURITY is not set
>CONFIG_SECURITYFS=3Dy
>CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
>CONFIG_HARDENED_USERCOPY=3Dy
>CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy
># CONFIG_FORTIFY_SOURCE is not set
>CONFIG_STATIC_USERMODEHELPER=3Dy
>CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
>CONFIG_DEFAULT_SECURITY_DAC=3Dy
>CONFIG_DEFAULT_SECURITY=3D""
>CONFIG_XOR_BLOCKS=3Dy
>CONFIG_ASYNC_CORE=3Dy
>CONFIG_ASYNC_MEMCPY=3Dy
>CONFIG_ASYNC_XOR=3Dy
>CONFIG_ASYNC_PQ=3Dy
>CONFIG_ASYNC_RAID6_RECOV=3Dy
>CONFIG_CRYPTO=3Dy
>
>#
># Crypto core or helper
>#
>CONFIG_CRYPTO_ALGAPI=3Dy
>CONFIG_CRYPTO_ALGAPI2=3Dy
>CONFIG_CRYPTO_AEAD=3Dy
>CONFIG_CRYPTO_AEAD2=3Dy
>CONFIG_CRYPTO_BLKCIPHER=3Dy
>CONFIG_CRYPTO_BLKCIPHER2=3Dy
>CONFIG_CRYPTO_HASH=3Dy
>CONFIG_CRYPTO_HASH2=3Dy
>CONFIG_CRYPTO_RNG=3Dy
>CONFIG_CRYPTO_RNG2=3Dy
>CONFIG_CRYPTO_RNG_DEFAULT=3Dy
>CONFIG_CRYPTO_AKCIPHER2=3Dy
>CONFIG_CRYPTO_AKCIPHER=3Dy
>CONFIG_CRYPTO_KPP2=3Dy
>CONFIG_CRYPTO_KPP=3Dy
>CONFIG_CRYPTO_ACOMP2=3Dy
>CONFIG_CRYPTO_RSA=3Dy
>CONFIG_CRYPTO_DH=3Dy
>CONFIG_CRYPTO_ECDH=3Dy
>CONFIG_CRYPTO_MANAGER=3Dy
>CONFIG_CRYPTO_MANAGER2=3Dy
># CONFIG_CRYPTO_USER is not set
>CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>CONFIG_CRYPTO_GF128MUL=3Dy
>CONFIG_CRYPTO_NULL=3Dy
>CONFIG_CRYPTO_NULL2=3Dy
># CONFIG_CRYPTO_PCRYPT is not set
>CONFIG_CRYPTO_WORKQUEUE=3Dy
>CONFIG_CRYPTO_CRYPTD=3Dy
>CONFIG_CRYPTO_MCRYPTD=3Dy
>CONFIG_CRYPTO_AUTHENC=3Dy
>CONFIG_CRYPTO_ABLK_HELPER=3Dy
>CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
>
>#
># Authenticated Encryption with Associated Data
>#
>CONFIG_CRYPTO_CCM=3Dy
>CONFIG_CRYPTO_GCM=3Dy
># CONFIG_CRYPTO_CHACHA20POLY1305 is not set
>CONFIG_CRYPTO_SEQIV=3Dy
>CONFIG_CRYPTO_ECHAINIV=3Dy
>
>#
># Block modes
>#
>CONFIG_CRYPTO_CBC=3Dy
>CONFIG_CRYPTO_CTR=3Dy
>CONFIG_CRYPTO_CTS=3Dy
>CONFIG_CRYPTO_ECB=3Dy
>CONFIG_CRYPTO_LRW=3Dy
>CONFIG_CRYPTO_PCBC=3Dy
>CONFIG_CRYPTO_XTS=3Dy
>CONFIG_CRYPTO_KEYWRAP=3Dy
>
>#
># Hash modes
>#
># CONFIG_CRYPTO_CMAC is not set
>CONFIG_CRYPTO_HMAC=3Dy
># CONFIG_CRYPTO_XCBC is not set
>CONFIG_CRYPTO_VMAC=3Dy
>
>#
># Digest
>#
>CONFIG_CRYPTO_CRC32C=3Dy
># CONFIG_CRYPTO_CRC32C_INTEL is not set
>CONFIG_CRYPTO_CRC32=3Dy
>CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
>CONFIG_CRYPTO_CRCT10DIF=3Dy
># CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
>CONFIG_CRYPTO_GHASH=3Dy
>CONFIG_CRYPTO_POLY1305=3Dy
>CONFIG_CRYPTO_POLY1305_X86_64=3Dy
># CONFIG_CRYPTO_MD4 is not set
>CONFIG_CRYPTO_MD5=3Dy
>CONFIG_CRYPTO_MICHAEL_MIC=3Dy
>CONFIG_CRYPTO_RMD128=3Dy
># CONFIG_CRYPTO_RMD160 is not set
>CONFIG_CRYPTO_RMD256=3Dy
># CONFIG_CRYPTO_RMD320 is not set
>CONFIG_CRYPTO_SHA1=3Dy
># CONFIG_CRYPTO_SHA1_SSSE3 is not set
>CONFIG_CRYPTO_SHA256_SSSE3=3Dy
>CONFIG_CRYPTO_SHA512_SSSE3=3Dy
>CONFIG_CRYPTO_SHA1_MB=3Dy
># CONFIG_CRYPTO_SHA256_MB is not set
>CONFIG_CRYPTO_SHA512_MB=3Dy
>CONFIG_CRYPTO_SHA256=3Dy
>CONFIG_CRYPTO_SHA512=3Dy
>CONFIG_CRYPTO_SHA3=3Dy
># CONFIG_CRYPTO_SM3 is not set
>CONFIG_CRYPTO_TGR192=3Dy
>CONFIG_CRYPTO_WP512=3Dy
># CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
>
>#
># Ciphers
>#
>CONFIG_CRYPTO_AES=3Dy
># CONFIG_CRYPTO_AES_TI is not set
># CONFIG_CRYPTO_AES_X86_64 is not set
># CONFIG_CRYPTO_AES_NI_INTEL is not set
>CONFIG_CRYPTO_ANUBIS=3Dy
># CONFIG_CRYPTO_ARC4 is not set
>CONFIG_CRYPTO_BLOWFISH=3Dy
>CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
>CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
>CONFIG_CRYPTO_CAMELLIA=3Dy
>CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
>CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
>CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
>CONFIG_CRYPTO_CAST_COMMON=3Dy
>CONFIG_CRYPTO_CAST5=3Dy
>CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
>CONFIG_CRYPTO_CAST6=3Dy
>CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
>CONFIG_CRYPTO_DES=3Dy
># CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
>CONFIG_CRYPTO_FCRYPT=3Dy
># CONFIG_CRYPTO_KHAZAD is not set
># CONFIG_CRYPTO_SALSA20 is not set
>CONFIG_CRYPTO_SALSA20_X86_64=3Dy
>CONFIG_CRYPTO_CHACHA20=3Dy
>CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
>CONFIG_CRYPTO_SEED=3Dy
>CONFIG_CRYPTO_SERPENT=3Dy
>CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
>CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
>CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
>CONFIG_CRYPTO_TEA=3Dy
>CONFIG_CRYPTO_TWOFISH=3Dy
>CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
>CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
># CONFIG_CRYPTO_TWOFISH_X86_64_3WAY is not set
># CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
>
>#
># Compression
>#
>CONFIG_CRYPTO_DEFLATE=3Dy
>CONFIG_CRYPTO_LZO=3Dy
># CONFIG_CRYPTO_842 is not set
>CONFIG_CRYPTO_LZ4=3Dy
>CONFIG_CRYPTO_LZ4HC=3Dy
>
>#
># Random Number Generation
>#
>CONFIG_CRYPTO_ANSI_CPRNG=3Dy
>CONFIG_CRYPTO_DRBG_MENU=3Dy
>CONFIG_CRYPTO_DRBG_HMAC=3Dy
># CONFIG_CRYPTO_DRBG_HASH is not set
>CONFIG_CRYPTO_DRBG_CTR=3Dy
>CONFIG_CRYPTO_DRBG=3Dy
>CONFIG_CRYPTO_JITTERENTROPY=3Dy
># CONFIG_CRYPTO_USER_API_HASH is not set
># CONFIG_CRYPTO_USER_API_SKCIPHER is not set
># CONFIG_CRYPTO_USER_API_RNG is not set
># CONFIG_CRYPTO_USER_API_AEAD is not set
>CONFIG_CRYPTO_HASH_INFO=3Dy
>CONFIG_CRYPTO_HW=3Dy
>CONFIG_CRYPTO_DEV_PADLOCK=3Dy
>CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
>CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
># CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
># CONFIG_CRYPTO_DEV_CCP is not set
>CONFIG_CRYPTO_DEV_QAT=3Dy
># CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
>CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dy
>CONFIG_CRYPTO_DEV_QAT_C62X=3Dy
>CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dy
>CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dy
># CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
>CONFIG_CRYPTO_DEV_NITROX=3Dy
>CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dy
># CONFIG_CRYPTO_DEV_VIRTIO is not set
>CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
>CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
>CONFIG_X509_CERTIFICATE_PARSER=3Dy
>CONFIG_PKCS7_MESSAGE_PARSER=3Dy
># CONFIG_PKCS7_TEST_KEY is not set
># CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
>
>#
># Certificates for signature checking
>#
>CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
>CONFIG_SYSTEM_TRUSTED_KEYS=3D""
># CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
># CONFIG_SECONDARY_TRUSTED_KEYRING is not set
>CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
>CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
>CONFIG_HAVE_KVM=3Dy
>CONFIG_VIRTUALIZATION=3Dy
># CONFIG_KVM is not set
># CONFIG_VHOST_NET is not set
>CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
>CONFIG_BINARY_PRINTF=3Dy
>
>#
># Library routines
>#
>CONFIG_RAID6_PQ=3Dy
>CONFIG_BITREVERSE=3Dy
># CONFIG_HAVE_ARCH_BITREVERSE is not set
>CONFIG_RATIONAL=3Dy
>CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>CONFIG_GENERIC_STRNLEN_USER=3Dy
>CONFIG_GENERIC_NET_UTILS=3Dy
>CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>CONFIG_GENERIC_PCI_IOMAP=3Dy
>CONFIG_GENERIC_IOMAP=3Dy
>CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
>CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
># CONFIG_CRC_CCITT is not set
>CONFIG_CRC16=3Dy
>CONFIG_CRC_T10DIF=3Dy
>CONFIG_CRC_ITU_T=3Dy
>CONFIG_CRC32=3Dy
>CONFIG_CRC32_SELFTEST=3Dy
># CONFIG_CRC32_SLICEBY8 is not set
>CONFIG_CRC32_SLICEBY4=3Dy
># CONFIG_CRC32_SARWATE is not set
># CONFIG_CRC32_BIT is not set
>CONFIG_CRC4=3Dy
># CONFIG_CRC7 is not set
>CONFIG_LIBCRC32C=3Dy
>CONFIG_CRC8=3Dy
>CONFIG_XXHASH=3Dy
># CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
>CONFIG_RANDOM32_SELFTEST=3Dy
>CONFIG_ZLIB_INFLATE=3Dy
>CONFIG_ZLIB_DEFLATE=3Dy
>CONFIG_LZO_COMPRESS=3Dy
>CONFIG_LZO_DECOMPRESS=3Dy
>CONFIG_LZ4_COMPRESS=3Dy
>CONFIG_LZ4HC_COMPRESS=3Dy
>CONFIG_LZ4_DECOMPRESS=3Dy
>CONFIG_ZSTD_COMPRESS=3Dy
>CONFIG_ZSTD_DECOMPRESS=3Dy
>CONFIG_XZ_DEC=3Dy
># CONFIG_XZ_DEC_X86 is not set
># CONFIG_XZ_DEC_POWERPC is not set
># CONFIG_XZ_DEC_IA64 is not set
># CONFIG_XZ_DEC_ARM is not set
>CONFIG_XZ_DEC_ARMTHUMB=3Dy
># CONFIG_XZ_DEC_SPARC is not set
>CONFIG_XZ_DEC_BCJ=3Dy
>CONFIG_XZ_DEC_TEST=3Dy
>CONFIG_DECOMPRESS_GZIP=3Dy
>CONFIG_DECOMPRESS_BZIP2=3Dy
>CONFIG_DECOMPRESS_LZMA=3Dy
>CONFIG_DECOMPRESS_XZ=3Dy
>CONFIG_DECOMPRESS_LZO=3Dy
>CONFIG_DECOMPRESS_LZ4=3Dy
>CONFIG_GENERIC_ALLOCATOR=3Dy
>CONFIG_REED_SOLOMON=3Dy
>CONFIG_REED_SOLOMON_ENC8=3Dy
>CONFIG_REED_SOLOMON_DEC8=3Dy
>CONFIG_REED_SOLOMON_DEC16=3Dy
>CONFIG_BCH=3Dy
>CONFIG_BCH_CONST_PARAMS=3Dy
>CONFIG_INTERVAL_TREE=3Dy
>CONFIG_RADIX_TREE_MULTIORDER=3Dy
>CONFIG_ASSOCIATIVE_ARRAY=3Dy
>CONFIG_HAS_IOMEM=3Dy
>CONFIG_HAS_IOPORT_MAP=3Dy
>CONFIG_HAS_DMA=3Dy
># CONFIG_DMA_NOOP_OPS is not set
># CONFIG_DMA_VIRT_OPS is not set
>CONFIG_CHECK_SIGNATURE=3Dy
>CONFIG_CPUMASK_OFFSTACK=3Dy
>CONFIG_CPU_RMAP=3Dy
>CONFIG_DQL=3Dy
>CONFIG_GLOB=3Dy
>CONFIG_GLOB_SELFTEST=3Dy
>CONFIG_NLATTR=3Dy
>CONFIG_CLZ_TAB=3Dy
>CONFIG_CORDIC=3Dy
>CONFIG_DDR=3Dy
># CONFIG_IRQ_POLL is not set
>CONFIG_MPILIB=3Dy
>CONFIG_OID_REGISTRY=3Dy
># CONFIG_SG_SPLIT is not set
>CONFIG_SG_POOL=3Dy
>CONFIG_ARCH_HAS_SG_CHAIN=3Dy
>CONFIG_ARCH_HAS_PMEM_API=3Dy
>CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
>CONFIG_STACKDEPOT=3Dy
>CONFIG_SBITMAP=3Dy
>CONFIG_PRIME_NUMBERS=3Dy
># CONFIG_STRING_SELFTEST is not set


--===============8955934451373028400==--

