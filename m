Content-Type: multipart/mixed; boundary="===============2475179835637318238=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 8704baab9b: WARNING: CPU: 0 PID: 30 at kernel/rcu/rcuperf.c:363 rcu_perf_writer
Date: Sat, 21 May 2016 22:24:22 -0700
Message-ID: <20160522052422.GJ3528@linux.vnet.ibm.com>
In-Reply-To: <57411b10.mFvG0+AgcrMXGtcj%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2475179835637318238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 22, 2016 at 10:36:00AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 8704baab9bc848b58c129fed6b591bb84ec02f41
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Thu Dec 31 18:33:22 2015 -0800
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Thu Mar 31 13:37:38 2016 -0700
> =

>     rcutorture: Add RCU grace-period performance tests
>     =

>     This commit adds a new rcuperf module that carries out simple perform=
ance
>     tests of RCU grace periods.
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

???

This commit adds a default-n performance-test module.  I don't believe
that this would result in boot failures.  False bisection?

							Thanx, Paul

> +-------------------------------------------------------+------------+---=
---------+------------+
> |                                                       | 291783b8ad | 87=
04baab9b | ce82e4a05f |
> +-------------------------------------------------------+------------+---=
---------+------------+
> | boot_successes                                        | 57         | 0 =
         | 0          |
> | boot_failures                                         | 6          | 22=
         | 13         |
> | BUG:unable_to_handle_kernel                           | 6          | 22=
         |            |
> | Oops                                                  | 6          | 22=
         |            |
> | EIP_is_at_get_perf_callchain                          | 6          |   =
         |            |
> | Kernel_panic-not_syncing:Fatal_exception              | 5          | 22=
         |            |
> | backtrace:acpi_get_cpuid                              | 6          | 22=
         | 13         |
> | backtrace:early_init_pdc                              | 6          | 22=
         | 13         |
> | backtrace:acpi_early_processor_set_pdc                | 6          | 22=
         | 13         |
> | backtrace:acpi_init                                   | 6          | 22=
         | 13         |
> | backtrace:kernel_init_freeable                        | 6          | 22=
         | 13         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 1          |   =
         |            |
> | backtrace:vfs_fstatat                                 | 2          |   =
         |            |
> | backtrace:SyS_fstatat64                               | 2          |   =
         |            |
> | backtrace:SYSC_socketcall                             | 2          |   =
         |            |
> | backtrace:SyS_socketcall                              | 2          | 0 =
         | 6          |
> | WARNING:at_kernel/rcu/rcuperf.c:#rcu_perf_writer      | 0          | 22=
         | 13         |
> | BUG:spinlock_bad_magic_on_CPU                         | 0          | 22=
         |            |
> | BUG:spinlock_lockup_suspected_on_CPU                  | 0          | 22=
         |            |
> | EIP_is_at__wake_up_common                             | 0          | 22=
         |            |
> | backtrace:rcu_perf_writer                             | 0          | 22=
         | 13         |
> | backtrace:sock_setsockopt                             | 0          | 0 =
         | 6          |
> | backtrace:rht_deferred_worker                         | 0          | 0 =
         | 3          |
> +-------------------------------------------------------+------------+---=
---------+------------+
> =

> [    1.054065] CPU: 0 PID: 1 Comm: swapper Not tainted 4.6.0-rc1-00005-g8=
704baa #3
> [    1.054065] CPU: 0 PID: 1 Comm: swapper Not tainted 4.6.0-rc1-00005-g8=
704baa #3
> [    1.062485]  ffffffff
> [    1.062485]  ffffffff cf03bc70 cf03bc70 cf03bc50 cf03bc50 c15192fc c15=
192fc cf03bc5c cf03bc5c c157a45b c157a45b c1ed4940 c1ed4940 cf03bcac cf03bc=
ac
> =

> [    1.064620]  c157aa41
> [    1.064620]  c157aa41 c1bba04c c1bba04c cf03bc74 cf03bc74 c1ed4958 c1e=
d4958 00000202 00000202 c100312d c100312d cf03bc80 cf03bc80 c10ab3fb c10ab3=
fb
> =

> [    1.066740]  cf03bc90
> [    1.066740]  cf03bc90 00000203 00000203 cf0a8634 cf0a8634 00000382 000=
00382 cf03bcc4 cf03bcc4 c11a701a c11a701a 00000010 00000010 eb0e29d5 eb0e29=
d5
> =

> [    1.068833] Call Trace:
> [    1.068833] Call Trace:
> [    1.072825]  [<c15192fc>] dump_stack+0x16/0x1a
> [    1.072825]  [<c15192fc>] dump_stack+0x16/0x1a
> [    1.073958]  [<c157a45b>] ubsan_epilogue+0xb/0x40
> [    1.073958]  [<c157a45b>] ubsan_epilogue+0xb/0x40
> [    1.075151]  [<c157aa41>] __ubsan_handle_out_of_bounds+0x61/0x80
> [    1.075151]  [<c157aa41>] __ubsan_handle_out_of_bounds+0x61/0x80
> [    1.080046]  [<c100312d>] ? allocate_fake_cpuc+0x7d/0x90
> [    1.080046]  [<c100312d>] ? allocate_fake_cpuc+0x7d/0x90
> [    1.081379]  [<c10ab3fb>] ? trace_hardirqs_on+0xb/0x10
> [    1.081379]  [<c10ab3fb>] ? trace_hardirqs_on+0xb/0x10
> [    1.086052]  [<c11a701a>] ? slob_free+0x15a/0xa00
> [    1.086052]  [<c11a701a>] ? slob_free+0x15a/0xa00
> [    1.087383]  [<c15c74a1>] acpi_ds_create_operand+0x20b/0x294
> [    1.087383]  [<c15c74a1>] acpi_ds_create_operand+0x20b/0x294
> [    1.088807]  [<c11a78fd>] ? __kmem_cache_free+0x3d/0x60
> [    1.088807]  [<c11a78fd>] ? __kmem_cache_free+0x3d/0x60
> [    1.095377]  [<c15c7621>] acpi_ds_create_operands+0xf7/0x139
> [    1.095377]  [<c15c7621>] acpi_ds_create_operands+0xf7/0x139
> [    1.096857]  [<c15b35cb>] ? acpi_os_release_object+0x8/0xc
> [    1.096857]  [<c15b35cb>] ? acpi_os_release_object+0x8/0xc
> [    1.098240]  [<c15e8151>] ? acpi_ut_delete_generic_state+0x13/0x15
> [    1.098240]  [<c15e8151>] ? acpi_ut_delete_generic_state+0x13/0x15
> [    1.103056]  [<c15de983>] ? acpi_ps_pop_scope+0xb4/0x109
> [    1.103056]  [<c15de983>] ? acpi_ps_pop_scope+0xb4/0x109
> [    1.104415]  [<c15c7bea>] acpi_ds_exec_end_op+0xe2/0x4b5
> [    1.104415]  [<c15c7bea>] acpi_ds_exec_end_op+0xe2/0x4b5
> [    1.105758]  [<c15dd795>] acpi_ps_parse_loop+0x62a/0x67b
> [    1.105758]  [<c15dd795>] acpi_ps_parse_loop+0x62a/0x67b
> [    1.111694]  [<c15e4efd>] ? acpi_ut_remove_reference+0x25/0x28
> [    1.111694]  [<c15e4efd>] ? acpi_ut_remove_reference+0x25/0x28
> [    1.115077]  [<c15c5740>] ? acpi_ds_call_control_method+0x12e/0x193
> [    1.115077]  [<c15c5740>] ? acpi_ds_call_control_method+0x12e/0x193
> [    1.116701]  [<c15de5aa>] acpi_ps_parse_aml+0x95/0x280
> [    1.116701]  [<c15de5aa>] acpi_ps_parse_aml+0x95/0x280
> [    1.118003]  [<c15defbe>] acpi_ps_execute_method+0x1a8/0x1d8
> [    1.118003]  [<c15defbe>] acpi_ps_execute_method+0x1a8/0x1d8
> [    1.122790]  [<c15d82ec>] acpi_ns_evaluate+0x1ee/0x265
> [    1.122790]  [<c15d82ec>] acpi_ns_evaluate+0x1ee/0x265
> [    1.124103]  [<c11a6da7>] ? __kmalloc+0x87/0xc0
> [    1.124103]  [<c11a6da7>] ? __kmalloc+0x87/0xc0
> [    1.125252]  [<c15db7b8>] acpi_evaluate_object+0x106/0x1fc
> [    1.125252]  [<c15db7b8>] acpi_evaluate_object+0x106/0x1fc
> [    1.130015]  [<c104e5a5>] ? __phys_addr+0x45/0xe0
> [    1.130015]  [<c104e5a5>] ? __phys_addr+0x45/0xe0
> [    1.131213]  [<c15bbbaa>] acpi_get_phys_id+0x32/0x1e2
> [    1.131213]  [<c15bbbaa>] acpi_get_phys_id+0x32/0x1e2
> [    1.132498]  [<c15bbd85>] acpi_get_cpuid+0xb/0x15
> [    1.132498]  [<c15bbd85>] acpi_get_cpuid+0xb/0x15
> [    1.139651]  [<c20acdd7>] early_init_pdc+0x81/0x95
> [    1.139651]  [<c20acdd7>] early_init_pdc+0x81/0x95
> [    1.140858]  [<c15db5b5>] acpi_ns_walk_namespace+0xe0/0x1b0
> [    1.140858]  [<c15db5b5>] acpi_ns_walk_namespace+0xe0/0x1b0
> [    1.142265]  [<c15db983>] acpi_walk_namespace+0x76/0xa0
> [    1.142265]  [<c15db983>] acpi_walk_namespace+0x76/0xa0
> [    1.147523]  [<c20acd56>] ? acpi_processor_init+0x1e/0x1e
> [    1.147523]  [<c20acd56>] ? acpi_processor_init+0x1e/0x1e
> [    1.148887]  [<c20ac671>] ? acpi_sleep_proc_init+0x23/0x23
> [    1.148887]  [<c20ac671>] ? acpi_sleep_proc_init+0x23/0x23
> [    1.151511]  [<c20ace09>] acpi_early_processor_set_pdc+0x1e/0x36
> [    1.151511]  [<c20ace09>] acpi_early_processor_set_pdc+0x1e/0x36
> [    1.154926]  [<c20acd56>] ? acpi_processor_init+0x1e/0x1e
> [    1.154926]  [<c20acd56>] ? acpi_processor_init+0x1e/0x1e
> [    1.158862]  [<c20ac790>] acpi_init+0x11f/0x24d
> [    1.158862]  [<c20ac790>] acpi_init+0x11f/0x24d
> [    1.160046]  [<c20ac671>] ? acpi_sleep_proc_init+0x23/0x23
> [    1.160046]  [<c20ac671>] ? acpi_sleep_proc_init+0x23/0x23
> [    1.161436]  [<c100046c>] do_one_initcall+0xbc/0x280
> [    1.161436]  [<c100046c>] do_one_initcall+0xbc/0x280
> [    1.165551]  [<c20ac671>] ? acpi_sleep_proc_init+0x23/0x23
> [    1.165551]  [<c20ac671>] ? acpi_sleep_proc_init+0x23/0x23
> [    1.167510]  [<c10887be>] ? parse_args+0x1ce/0x5e0
> [    1.167510]  [<c10887be>] ? parse_args+0x1ce/0x5e0
> [    1.168729]  [<c20860b4>] kernel_init_freeable+0x2a6/0x330
> [    1.168729]  [<c20860b4>] kernel_init_freeable+0x2a6/0x330
> [    1.173486]  [<c19a5989>] kernel_init+0x9/0x100
> [    1.173486]  [<c19a5989>] kernel_init+0x9/0x100
> [    1.174646]  [<c19af048>] ret_from_kernel_thread+0x20/0x34
> [    1.174646]  [<c19af048>] ret_from_kernel_thread+0x20/0x34
> [    1.179417]  [<c19a5980>] ? rest_init+0x140/0x140
> [    1.179417]  [<c19a5980>] ? rest_init+0x140/0x140
> [    1.180614] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    1.180614] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    1.187188] ACPI: Interpreter enabled
> =

> git bisect start ce82e4a05fa751f5af6ddfe2bd120f0020099104 2dcd0af568b0cf5=
83645c8a317dd12e344b1c72a --
> git bisect good e5ebef3c782fea8f8a9c6e11e1f16601ba543c2a  # 08:54     22+=
      0  Merge 'jkirsher-next-queue/dev-queue' into devel-catchup-201605220=
757
> git bisect  bad 78a17208ca3379e972d5c6d5696d22992781c93b  # 09:00      0-=
      3  Merge 'rcu/dev.2016.05.18a' into devel-catchup-201605220757
> git bisect good 261ccfd569fda81e8892e9ecfb9fbd1e7fb5416e  # 09:05     22+=
      0  Merge 'linux-nvdimm/libnvdimm-for-next' into devel-catchup-2016052=
20757
> git bisect  bad d9dce51c9b77b803348c787165a884b6e11011f0  # 09:10      0-=
      2  Merge tag 'regulator-v4.7' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/broonie/regulator
> git bisect  bad cf6ed9a6682d3f171cf9550d4bbe0ef31b768a7e  # 09:16      0-=
      1  Merge branch 'ras-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect good 0b3c2264ae30ed692fd1ffd2b84c5fbdf737cb0d  # 09:21     22+=
      1  perf symbols: Fix kallsyms perf test on ppc64le
> git bisect  bad 49817c33433a3cd6f320b13699e6746cc39b453b  # 09:25      0-=
      1  Merge branch 'efi-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect  bad 41ed943d855c3fa2bf6fecc33250b294bd568b7a  # 09:30      0-=
      1  Merge branch 'for-mingo' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/paulmck/linux-rcu into core/rcu
> git bisect  bad a54062c0d95921d4fb0edc8d268021bf387e6c75  # 09:34      0-=
      8  rcutorture: Add boot-time adjustment of leaf fanout
> git bisect  bad df37e66bfdbb57e8cae7dbf39a0c66b1b8701338  # 09:39      0-=
     22  rcutorture: Add rcuperf holdoff boot parameter to reduce interfere=
nce
> git bisect  bad bdea9e347783c2724997db7c5d5b45a301e2dc90  # 09:46      0-=
      1  rcutorture: Documentation for rcuperf kernel parameters
> git bisect good fd35be623a1534bde57029c429b206d6c22a1ef6  # 09:55     22+=
      0  rcutorture: Update scripting to accommodate rcuperf
> git bisect good 291783b8ad77a83a6fdf91d55eee7f1ad72ed4d1  # 10:07     20+=
      0  rcutorture: Expedited-GP batch progress access to torturing
> git bisect  bad 8704baab9bc848b58c129fed6b591bb84ec02f41  # 10:14      0-=
      7  rcutorture: Add RCU grace-period performance tests
> # first bad commit: [8704baab9bc848b58c129fed6b591bb84ec02f41] rcutorture=
: Add RCU grace-period performance tests
> git bisect good 291783b8ad77a83a6fdf91d55eee7f1ad72ed4d1  # 10:18     63+=
      6  rcutorture: Expedited-GP batch progress access to torturing
> # extra tests with DEBUG_INFO
> git bisect  bad 8704baab9bc848b58c129fed6b591bb84ec02f41  # 10:25      0-=
      3  rcutorture: Add RCU grace-period performance tests
> # extra tests on HEAD of linux-devel/devel-catchup-201605220757
> git bisect  bad ce82e4a05fa751f5af6ddfe2bd120f0020099104  # 10:25      0-=
     13  0day head guard for 'devel-catchup-201605220757'
> # extra tests on tree/branch linus/master
> # extra tests on tree/branch linus/master
> # extra tests on tree/branch linux-next/master
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dyocto-minimal-i386.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep,+smap
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 256
> 	-smp 1
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )
> =

> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	systemd.log_level=3Derr
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 4.6.0-rc1 Kernel Configuration
> #
> # CONFIG_64BIT is not set
> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
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
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_PGTABLE_LEVELS=3D3
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
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
> # CONFIG_KERNEL_LZO is not set
> CONFIG_KERNEL_LZ4=3Dy
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_FHANDLE=3Dy
> # CONFIG_USELIB is not set
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
> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
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
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> # CONFIG_TICK_CPU_ACCOUNTING is not set
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
> CONFIG_TASKS_RCU=3Dy
> # CONFIG_RCU_STALL_COMMON is not set
> # CONFIG_TREE_RCU_TRACE is not set
> CONFIG_RCU_KTHREAD_PRIO=3D0
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> # CONFIG_IKCONFIG_PROC is not set
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> # CONFIG_MEMCG_SWAP is not set
> CONFIG_BLK_CGROUP=3Dy
> # CONFIG_DEBUG_BLK_CGROUP is not set
> CONFIG_CGROUP_WRITEBACK=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> # CONFIG_RT_GROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_FREEZER is not set
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> CONFIG_RD_XZ=3Dy
> # CONFIG_RD_LZO is not set
> CONFIG_RD_LZ4=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
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
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_SHMEM is not set
> CONFIG_AIO=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_USERFAULTFD=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> CONFIG_PROFILING=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_OPROFILE=3Dm
> # CONFIG_OPROFILE_EVENT_MULTIPLEX is not set
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
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> CONFIG_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> CONFIG_CC_STACKPROTECTOR_REGULAR=3Dy
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D8
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> # CONFIG_MODULE_UNLOAD is not set
> CONFIG_MODVERSIONS=3Dy
> CONFIG_MODULE_SRCVERSION_ALL=3Dy
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS=3Dy
> CONFIG_MODULE_COMPRESS_GZIP=3Dy
> # CONFIG_MODULE_COMPRESS_XZ is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_LBDAF=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> # CONFIG_BLK_DEV_THROTTLING is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> CONFIG_AIX_PARTITION=3Dy
> CONFIG_OSF_PARTITION=3Dy
> CONFIG_AMIGA_PARTITION=3Dy
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> # CONFIG_BSD_DISKLABEL is not set
> CONFIG_MINIX_SUBPARTITION=3Dy
> # CONFIG_SOLARIS_X86_PARTITION is not set
> # CONFIG_UNIXWARE_DISKLABEL is not set
> # CONFIG_LDM_PARTITION is not set
> # CONFIG_SGI_PARTITION is not set
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # CONFIG_SYSV68_PARTITION is not set
> # CONFIG_CMDLINE_PARTITION is not set
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> # CONFIG_CFQ_GROUP_IOSCHED is not set
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_CFQ=3Dy
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"cfq"
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
> CONFIG_GOLDFISH=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> # CONFIG_IOSF_MBI is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_X86_32_IRIS=3Dm
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_LGUEST_GUEST is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> # CONFIG_MPENTIUMII is not set
> # CONFIG_MPENTIUMIII is not set
> # CONFIG_MPENTIUMM is not set
> # CONFIG_MPENTIUM4 is not set
> # CONFIG_MK6 is not set
> # CONFIG_MK7 is not set
> # CONFIG_MK8 is not set
> CONFIG_MCRUSOE=3Dy
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
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_CPU_SUP_UMC_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D1
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_X86_UP_APIC is not set
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_ANCIENT_MCE=3Dy
> # CONFIG_X86_MCE_INJECT is not set
> CONFIG_X86_LEGACY_VM86=3Dy
> CONFIG_VM86=3Dy
> # CONFIG_X86_16BIT is not set
> CONFIG_TOSHIBA=3Dy
> CONFIG_I8K=3Dm
> CONFIG_X86_REBOOTFIXUPS=3Dy
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> CONFIG_MICROCODE_AMD=3Dy
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dm
> # CONFIG_X86_CPUID is not set
> # CONFIG_NOHIGHMEM is not set
> # CONFIG_HIGHMEM4G is not set
> CONFIG_HIGHMEM64G=3Dy
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_HIGHMEM=3Dy
> CONFIG_X86_PAE=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
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
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> # CONFIG_BOUNCE is not set
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_MEMORY_FAILURE is not set
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_NEED_PER_CPU_KM=3Dy
> # CONFIG_CLEANCACHE is not set
> CONFIG_FRONTSWAP=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZSWAP=3Dy
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> CONFIG_X86_PMEM_LEGACY=3Dy
> # CONFIG_HIGHPTE is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MATH_EMULATION=3Dy
> # CONFIG_MTRR is not set
> CONFIG_ARCH_RANDOM=3Dy
> # CONFIG_X86_SMAP is not set
> CONFIG_X86_INTEL_MPX=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> CONFIG_HZ_300=3Dy
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D300
> # CONFIG_SCHED_HRTICK is not set
> CONFIG_KEXEC=3Dy
> # CONFIG_CRASH_DUMP is not set
> # CONFIG_KEXEC_JUMP is not set
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
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SLEEP=3Dy
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
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> # CONFIG_ACPI_CONTAINER is not set
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_SFI is not set
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dm
> CONFIG_APM_IGNORE_USER_SUSPEND=3Dy
> CONFIG_APM_DO_ENABLE=3Dy
> # CONFIG_APM_CPU_IDLE is not set
> CONFIG_APM_DISPLAY_BLANK=3Dy
> CONFIG_APM_ALLOW_INTS=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> # CONFIG_CPU_FREQ_STAT is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> # CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> # CONFIG_X86_INTEL_PSTATE is not set
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> CONFIG_X86_POWERNOW_K6=3Dm
> CONFIG_X86_POWERNOW_K7=3Dm
> CONFIG_X86_POWERNOW_K7_ACPI=3Dy
> # CONFIG_X86_GX_SUSPMOD is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> # CONFIG_X86_SPEEDSTEP_ICH is not set
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> CONFIG_X86_P4_CLOCKMOD=3Dm
> CONFIG_X86_CPUFREQ_NFORCE2=3Dy
> CONFIG_X86_LONGRUN=3Dm
> # CONFIG_X86_LONGHAUL is not set
> # CONFIG_X86_E_POWERSAVER is not set
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dm
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
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI host controller drivers
> #
> # CONFIG_PCIE_DW_PLAT is not set
> CONFIG_ISA_DMA_API=3Dy
> # CONFIG_ISA is not set
> CONFIG_SCx200=3Dm
> CONFIG_SCx200HR_TIMER=3Dm
> CONFIG_ALIX=3Dy
> # CONFIG_NET5501 is not set
> CONFIG_PCCARD=3Dm
> # CONFIG_PCMCIA is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_RAPIDIO is not set
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_HAVE_AOUT=3Dy
> # CONFIG_BINFMT_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> # CONFIG_COREDUMP is not set
> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> CONFIG_PMC_ATOM=3Dy
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_DIAG=3Dm
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dm
> CONFIG_XFRM_SUB_POLICY=3Dy
> CONFIG_XFRM_MIGRATE=3Dy
> CONFIG_NET_KEY=3Dm
> # CONFIG_NET_KEY_MIGRATE is not set
> # CONFIG_INET is not set
> # CONFIG_NETWORK_SECMARK is not set
> CONFIG_NET_PTP_CLASSIFY=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> CONFIG_NETFILTER=3Dy
> # CONFIG_NETFILTER_DEBUG is not set
> CONFIG_NETFILTER_ADVANCED=3Dy
> =

> #
> # DECnet: Netfilter Configuration
> #
> CONFIG_DECNET_NF_GRABULATOR=3Dm
> # CONFIG_ATM is not set
> CONFIG_STP=3Dy
> CONFIG_MRP=3Dy
> CONFIG_BRIDGE=3Dy
> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> CONFIG_HAVE_NET_DSA=3Dy
> CONFIG_VLAN_8021Q=3Dy
> # CONFIG_VLAN_8021Q_GVRP is not set
> CONFIG_VLAN_8021Q_MVRP=3Dy
> CONFIG_DECNET=3Dy
> # CONFIG_DECNET_ROUTER is not set
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> CONFIG_IPX=3Dy
> # CONFIG_IPX_INTERN is not set
> # CONFIG_ATALK is not set
> CONFIG_X25=3Dy
> # CONFIG_LAPB is not set
> CONFIG_PHONET=3Dm
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=3Dm
> CONFIG_BATMAN_ADV=3Dm
> # CONFIG_BATMAN_ADV_BATMAN_V is not set
> CONFIG_BATMAN_ADV_NC=3Dy
> CONFIG_BATMAN_ADV_MCAST=3Dy
> # CONFIG_BATMAN_ADV_DEBUG is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> CONFIG_MPLS_ROUTING=3Dy
> CONFIG_MPLS_IPTUNNEL=3Dm
> # CONFIG_HSR is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> =

> #
> # Network testing
> #
> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> # CONFIG_AX25 is not set
> CONFIG_CAN=3Dy
> CONFIG_CAN_RAW=3Dy
> CONFIG_CAN_BCM=3Dm
> # CONFIG_CAN_GW is not set
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dm
> CONFIG_CAN_SLCAN=3Dy
> CONFIG_CAN_DEV=3Dy
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_LEDS is not set
> # CONFIG_CAN_GRCAN is not set
> # CONFIG_PCH_CAN is not set
> CONFIG_CAN_C_CAN=3Dm
> # CONFIG_CAN_C_CAN_PLATFORM is not set
> # CONFIG_CAN_C_CAN_PCI is not set
> CONFIG_CAN_CC770=3Dy
> CONFIG_CAN_CC770_ISA=3Dy
> CONFIG_CAN_CC770_PLATFORM=3Dy
> CONFIG_CAN_IFI_CANFD=3Dm
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_SJA1000 is not set
> CONFIG_CAN_SOFTING=3Dm
> # CONFIG_CAN_DEBUG_DEVICES is not set
> # CONFIG_IRDA is not set
> CONFIG_BT=3Dm
> # CONFIG_BT_BREDR is not set
> CONFIG_BT_LE=3Dy
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_SELFTEST is not set
> CONFIG_BT_DEBUGFS=3Dy
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIBTSDIO is not set
> # CONFIG_BT_HCIUART is not set
> CONFIG_BT_HCIVHCI=3Dm
> # CONFIG_BT_MRVL is not set
> CONFIG_WIRELESS=3Dy
> CONFIG_WIRELESS_EXT=3Dy
> CONFIG_WEXT_CORE=3Dy
> CONFIG_WEXT_PROC=3Dy
> CONFIG_WEXT_SPY=3Dy
> CONFIG_CFG80211=3Dm
> # CONFIG_NL80211_TESTMODE is not set
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> # CONFIG_CFG80211_CERTIFICATION_ONUS is not set
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> # CONFIG_CFG80211_INTERNAL_REGDB is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> CONFIG_CFG80211_WEXT=3Dy
> CONFIG_LIB80211=3Dm
> CONFIG_LIB80211_DEBUG=3Dy
> CONFIG_MAC80211=3Dm
> # CONFIG_MAC80211_RC_MINSTREL is not set
> CONFIG_MAC80211_RC_DEFAULT=3D""
> =

> #
> # Some wireless drivers require a rate control algorithm
> #
> # CONFIG_MAC80211_MESH is not set
> CONFIG_MAC80211_LEDS=3Dy
> # CONFIG_MAC80211_DEBUGFS is not set
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> # CONFIG_MAC80211_DEBUG_MENU is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_WIMAX=3Dm
> CONFIG_WIMAX_DEBUG_LEVEL=3D8
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> CONFIG_RFKILL_REGULATOR=3Dm
> # CONFIG_RFKILL_GPIO is not set
> # CONFIG_NET_9P is not set
> CONFIG_CAIF=3Dy
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=3Dm
> CONFIG_CAIF_USB=3Dy
> CONFIG_NFC=3Dy
> # CONFIG_NFC_DIGITAL is not set
> # CONFIG_NFC_NCI is not set
> CONFIG_NFC_HCI=3Dy
> # CONFIG_NFC_SHDLC is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_SIM=3Dm
> CONFIG_LWTUNNEL=3Dy
> # CONFIG_DST_CACHE is not set
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
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_FENCE_TRACE is not set
> =

> #
> # Bus devices
> #
> CONFIG_CONNECTOR=3Dy
> # CONFIG_PROC_EVENTS is not set
> # CONFIG_MTD is not set
> CONFIG_DTC=3Dy
> CONFIG_OF=3Dy
> CONFIG_OF_UNITTEST=3Dy
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_EARLY_FLATTREE=3Dy
> CONFIG_OF_DYNAMIC=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_ADDRESS_PCI=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_MDIO=3Dy
> CONFIG_OF_PCI=3Dy
> CONFIG_OF_PCI_IRQ=3Dy
> CONFIG_OF_RESOLVE=3Dy
> CONFIG_OF_OVERLAY=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dm
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=3Dy
> CONFIG_PARPORT_PC_SUPERIO=3Dy
> # CONFIG_PARPORT_GSC is not set
> # CONFIG_PARPORT_AX88796 is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dy
> CONFIG_BLK_DEV_FD=3Dm
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> CONFIG_BLK_DEV_LOOP=3Dy
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> CONFIG_BLK_DEV_CRYPTOLOOP=3Dy
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> CONFIG_BLK_DEV_NBD=3Dm
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> CONFIG_ATA_OVER_ETH=3Dm
> CONFIG_BLK_DEV_HD=3Dy
> # CONFIG_BLK_DEV_RSXX is not set
> # CONFIG_BLK_DEV_NVME is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dm
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dm
> CONFIG_ENCLOSURE_SERVICES=3Dy
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dm
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dm
> CONFIG_SENSORS_BH1780=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> # CONFIG_SENSORS_APDS990X is not set
> CONFIG_HMC6352=3Dm
> # CONFIG_DS1682 is not set
> CONFIG_BMP085=3Dm
> CONFIG_BMP085_I2C=3Dm
> # CONFIG_PCH_PHUB is not set
> CONFIG_USB_SWITCH_FSA9480=3Dm
> CONFIG_SRAM=3Dy
> CONFIG_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> # CONFIG_EEPROM_LEGACY is not set
> CONFIG_EEPROM_MAX6875=3Dm
> # CONFIG_EEPROM_93CX6 is not set
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dm
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dm
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
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
> # CONFIG_CXL_KERNEL_API is not set
> # CONFIG_CXL_EEH is not set
> CONFIG_HAVE_IDE=3Dy
> CONFIG_IDE=3Dm
> =

> #
> # Please see Documentation/ide/ide.txt for help/info on IDE drives
> #
> CONFIG_IDE_ATAPI=3Dy
> CONFIG_BLK_DEV_IDE_SATA=3Dy
> # CONFIG_IDE_GD is not set
> # CONFIG_BLK_DEV_DELKIN is not set
> CONFIG_BLK_DEV_IDECD=3Dm
> # CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS is not set
> CONFIG_BLK_DEV_IDETAPE=3Dm
> # CONFIG_BLK_DEV_IDEACPI is not set
> # CONFIG_IDE_TASK_IOCTL is not set
> CONFIG_IDE_PROC_FS=3Dy
> =

> #
> # IDE chipset support/bugfixes
> #
> CONFIG_IDE_GENERIC=3Dm
> CONFIG_BLK_DEV_PLATFORM=3Dm
> # CONFIG_BLK_DEV_CMD640 is not set
> # CONFIG_BLK_DEV_IDEPNP is not set
> =

> #
> # PCI IDE chipsets support
> #
> # CONFIG_BLK_DEV_GENERIC is not set
> # CONFIG_BLK_DEV_OPTI621 is not set
> # CONFIG_BLK_DEV_RZ1000 is not set
> # CONFIG_BLK_DEV_AEC62XX is not set
> # CONFIG_BLK_DEV_ALI15X3 is not set
> # CONFIG_BLK_DEV_AMD74XX is not set
> # CONFIG_BLK_DEV_ATIIXP is not set
> # CONFIG_BLK_DEV_CMD64X is not set
> # CONFIG_BLK_DEV_TRIFLEX is not set
> # CONFIG_BLK_DEV_CS5520 is not set
> # CONFIG_BLK_DEV_CS5530 is not set
> # CONFIG_BLK_DEV_CS5535 is not set
> # CONFIG_BLK_DEV_CS5536 is not set
> # CONFIG_BLK_DEV_HPT366 is not set
> # CONFIG_BLK_DEV_JMICRON is not set
> # CONFIG_BLK_DEV_SC1200 is not set
> # CONFIG_BLK_DEV_PIIX is not set
> # CONFIG_BLK_DEV_IT8172 is not set
> # CONFIG_BLK_DEV_IT8213 is not set
> # CONFIG_BLK_DEV_IT821X is not set
> # CONFIG_BLK_DEV_NS87415 is not set
> # CONFIG_BLK_DEV_PDC202XX_OLD is not set
> # CONFIG_BLK_DEV_PDC202XX_NEW is not set
> # CONFIG_BLK_DEV_SVWKS is not set
> # CONFIG_BLK_DEV_SIIMAGE is not set
> # CONFIG_BLK_DEV_SIS5513 is not set
> # CONFIG_BLK_DEV_SLC90E66 is not set
> # CONFIG_BLK_DEV_TRM290 is not set
> # CONFIG_BLK_DEV_VIA82CXXX is not set
> # CONFIG_BLK_DEV_TC86C001 is not set
> # CONFIG_BLK_DEV_IDEDMA is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_NETLINK=3Dy
> # CONFIG_SCSI_MQ_DEFAULT is not set
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> CONFIG_CHR_DEV_ST=3Dm
> CONFIG_CHR_DEV_OSST=3Dy
> CONFIG_BLK_DEV_SR=3Dm
> # CONFIG_BLK_DEV_SR_VENDOR is not set
> CONFIG_CHR_DEV_SG=3Dm
> # CONFIG_CHR_DEV_SCH is not set
> CONFIG_SCSI_ENCLOSURE=3Dm
> # CONFIG_SCSI_CONSTANTS is not set
> # CONFIG_SCSI_LOGGING is not set
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> CONFIG_SCSI_FC_ATTRS=3Dy
> CONFIG_SCSI_ISCSI_ATTRS=3Dy
> CONFIG_SCSI_SAS_ATTRS=3Dm
> # CONFIG_SCSI_SAS_LIBSAS is not set
> CONFIG_SCSI_SRP_ATTRS=3Dm
> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_DH is not set
> # CONFIG_SCSI_OSD_INITIATOR is not set
> CONFIG_ATA=3Dy
> # CONFIG_ATA_NONSTANDARD is not set
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> # CONFIG_SATA_PMP is not set
> =

> #
> # Controllers with non-SFF native interface
> #
> # CONFIG_SATA_AHCI is not set
> CONFIG_SATA_AHCI_PLATFORM=3Dm
> # CONFIG_AHCI_CEVA is not set
> CONFIG_AHCI_QORIQ=3Dm
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> # CONFIG_ATA_SFF is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dm
> # CONFIG_MD_LINEAR is not set
> # CONFIG_MD_RAID0 is not set
> # CONFIG_MD_RAID1 is not set
> CONFIG_MD_RAID10=3Dm
> # CONFIG_MD_RAID456 is not set
> CONFIG_MD_MULTIPATH=3Dm
> # CONFIG_MD_FAULTY is not set
> # CONFIG_BCACHE is not set
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dy
> CONFIG_DM_MQ_DEFAULT=3Dy
> # CONFIG_DM_DEBUG is not set
> CONFIG_DM_BUFIO=3Dy
> # CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
> CONFIG_DM_BIO_PRISON=3Dy
> CONFIG_DM_PERSISTENT_DATA=3Dy
> CONFIG_DM_CRYPT=3Dy
> # CONFIG_DM_SNAPSHOT is not set
> CONFIG_DM_THIN_PROVISIONING=3Dy
> CONFIG_DM_CACHE=3Dm
> # CONFIG_DM_CACHE_SMQ is not set
> # CONFIG_DM_CACHE_CLEANER is not set
> CONFIG_DM_ERA=3Dm
> CONFIG_DM_MIRROR=3Dm
> # CONFIG_DM_LOG_USERSPACE is not set
> # CONFIG_DM_RAID is not set
> CONFIG_DM_ZERO=3Dy
> # CONFIG_DM_MULTIPATH is not set
> CONFIG_DM_DELAY=3Dy
> CONFIG_DM_UEVENT=3Dy
> CONFIG_DM_FLAKEY=3Dy
> CONFIG_DM_VERITY=3Dm
> CONFIG_DM_VERITY_FEC=3Dy
> # CONFIG_DM_SWITCH is not set
> CONFIG_DM_LOG_WRITES=3Dy
> CONFIG_TARGET_CORE=3Dy
> CONFIG_TCM_IBLOCK=3Dy
> CONFIG_TCM_FILEIO=3Dy
> # CONFIG_TCM_PSCSI is not set
> # CONFIG_TCM_USER2 is not set
> CONFIG_LOOPBACK_TARGET=3Dy
> CONFIG_ISCSI_TARGET=3Dy
> CONFIG_SBP_TARGET=3Dm
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dm
> # CONFIG_FIREWIRE_OHCI is not set
> CONFIG_FIREWIRE_SBP2=3Dm
> # CONFIG_FIREWIRE_NOSY is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> CONFIG_NET_CORE=3Dy
> CONFIG_DUMMY=3Dy
> CONFIG_EQUALIZER=3Dm
> # CONFIG_NET_FC is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_MACSEC is not set
> CONFIG_NETCONSOLE=3Dy
> # CONFIG_NETCONSOLE_DYNAMIC is not set
> CONFIG_NETPOLL=3Dy
> CONFIG_NET_POLL_CONTROLLER=3Dy
> CONFIG_TUN_VNET_CROSS_LE=3Dy
> CONFIG_VETH=3Dm
> CONFIG_NLMON=3Dm
> # CONFIG_ARCNET is not set
> =

> #
> # CAIF transport drivers
> #
> # CONFIG_CAIF_TTY is not set
> CONFIG_CAIF_SPI_SLAVE=3Dm
> CONFIG_CAIF_SPI_SYNC=3Dy
> # CONFIG_CAIF_HSI is not set
> # CONFIG_CAIF_VIRTIO is not set
> CONFIG_VHOST_NET=3Dy
> CONFIG_VHOST_SCSI=3Dm
> CONFIG_VHOST_RING=3Dy
> CONFIG_VHOST=3Dy
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> =

> #
> # Distributed Switch Architecture drivers
> #
> # CONFIG_NET_DSA_MV88E6XXX is not set
> # CONFIG_NET_DSA_MV88E6XXX_NEED_PPU is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dm
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> CONFIG_ALTERA_TSE=3Dm
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_ARC_EMAC_CORE=3Dm
> # CONFIG_ARC_EMAC is not set
> CONFIG_EMAC_ROCKCHIP=3Dm
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_AURORA=3Dy
> CONFIG_AURORA_NB8800=3Dy
> # CONFIG_NET_CADENCE is not set
> # CONFIG_NET_VENDOR_BROADCOM is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
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
> # CONFIG_NET_VENDOR_EZCHIP is not set
> CONFIG_NET_VENDOR_EXAR=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_HP=3Dy
> # CONFIG_HP100 is not set
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dm
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
> # CONFIG_MVNETA_BM is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX4_CORE is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> CONFIG_KS8842=3Dy
> CONFIG_KS8851_MLL=3Dm
> # CONFIG_KSZ884X_PCI is not set
> # CONFIG_FEALNX is not set
> # CONFIG_NET_VENDOR_NATSEMI is not set
> # CONFIG_NET_VENDOR_NETRONOME is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_PCH_GBE is not set
> CONFIG_ETHOC=3Dy
> CONFIG_NET_PACKET_ENGINE=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_QLGE is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> # CONFIG_NET_VENDOR_QUALCOMM is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> # CONFIG_NET_VENDOR_ROCKER is not set
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> CONFIG_SXGBE_ETH=3Dm
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> # CONFIG_SFC is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> # CONFIG_NET_VENDOR_STMICRO is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_SYNOPSYS_DWC_ETH_QOS is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_ALE is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> CONFIG_VIA_RHINE=3Dy
> # CONFIG_VIA_RHINE_MMIO is not set
> CONFIG_VIA_VELOCITY=3Dm
> # CONFIG_NET_VENDOR_WIZNET is not set
> # CONFIG_FDDI is not set
> # CONFIG_NET_SB1000 is not set
> CONFIG_PHYLIB=3Dy
> =

> #
> # MII PHY device drivers
> #
> CONFIG_AQUANTIA_PHY=3Dm
> CONFIG_AT803X_PHY=3Dm
> # CONFIG_AMD_PHY is not set
> CONFIG_MARVELL_PHY=3Dy
> # CONFIG_DAVICOM_PHY is not set
> CONFIG_QSEMI_PHY=3Dy
> CONFIG_LXT_PHY=3Dy
> CONFIG_CICADA_PHY=3Dm
> # CONFIG_VITESSE_PHY is not set
> CONFIG_TERANETICS_PHY=3Dm
> CONFIG_SMSC_PHY=3Dm
> CONFIG_BCM_NET_PHYLIB=3Dm
> # CONFIG_BROADCOM_PHY is not set
> CONFIG_BCM7XXX_PHY=3Dm
> CONFIG_BCM87XX_PHY=3Dy
> # CONFIG_ICPLUS_PHY is not set
> CONFIG_REALTEK_PHY=3Dy
> CONFIG_NATIONAL_PHY=3Dm
> # CONFIG_STE10XP is not set
> CONFIG_LSI_ET1011C_PHY=3Dm
> # CONFIG_MICREL_PHY is not set
> CONFIG_DP83848_PHY=3Dm
> CONFIG_DP83867_PHY=3Dy
> CONFIG_MICROCHIP_PHY=3Dm
> # CONFIG_FIXED_PHY is not set
> CONFIG_MDIO_BITBANG=3Dm
> # CONFIG_MDIO_GPIO is not set
> CONFIG_MDIO_BUS_MUX=3Dy
> CONFIG_MDIO_BUS_MUX_GPIO=3Dy
> CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
> CONFIG_MDIO_BCM_UNIMAC=3Dm
> CONFIG_PLIP=3Dm
> CONFIG_PPP=3Dm
> CONFIG_PPP_BSDCOMP=3Dm
> CONFIG_PPP_DEFLATE=3Dm
> # CONFIG_PPP_FILTER is not set
> CONFIG_PPP_MPPE=3Dm
> # CONFIG_PPP_MULTILINK is not set
> CONFIG_PPPOE=3Dm
> # CONFIG_PPP_ASYNC is not set
> CONFIG_PPP_SYNC_TTY=3Dm
> # CONFIG_SLIP is not set
> CONFIG_SLHC=3Dm
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_WLAN=3Dy
> # CONFIG_WLAN_VENDOR_ADMTEK is not set
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K is not set
> # CONFIG_ATH5K_PCI is not set
> # CONFIG_ATH9K is not set
> CONFIG_ATH6KL=3Dm
> CONFIG_ATH6KL_SDIO=3Dm
> CONFIG_ATH6KL_DEBUG=3Dy
> # CONFIG_WIL6210 is not set
> # CONFIG_ATH10K is not set
> # CONFIG_WCN36XX is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> # CONFIG_ATMEL is not set
> # CONFIG_WLAN_VENDOR_BROADCOM is not set
> # CONFIG_WLAN_VENDOR_CISCO is not set
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> # CONFIG_IPW2100 is not set
> # CONFIG_IPW2200 is not set
> # CONFIG_IWL4965 is not set
> # CONFIG_IWL3945 is not set
> # CONFIG_IWLWIFI is not set
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> # CONFIG_HERMES is not set
> CONFIG_P54_COMMON=3Dm
> # CONFIG_P54_PCI is not set
> CONFIG_P54_LEDS=3Dy
> # CONFIG_PRISM54 is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> CONFIG_LIBERTAS=3Dm
> CONFIG_LIBERTAS_SDIO=3Dm
> CONFIG_LIBERTAS_DEBUG=3Dy
> # CONFIG_LIBERTAS_MESH is not set
> CONFIG_LIBERTAS_THINFIRM=3Dm
> # CONFIG_LIBERTAS_THINFIRM_DEBUG is not set
> # CONFIG_MWIFIEX is not set
> # CONFIG_MWL8K is not set
> # CONFIG_WLAN_VENDOR_MEDIATEK is not set
> # CONFIG_WLAN_VENDOR_RALINK is not set
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> # CONFIG_RTL8180 is not set
> CONFIG_RTL_CARDS=3Dm
> # CONFIG_RTL8192CE is not set
> # CONFIG_RTL8192SE is not set
> # CONFIG_RTL8192DE is not set
> # CONFIG_RTL8723AE is not set
> # CONFIG_RTL8723BE is not set
> # CONFIG_RTL8188EE is not set
> # CONFIG_RTL8192EE is not set
> # CONFIG_RTL8821AE is not set
> CONFIG_WLAN_VENDOR_RSI=3Dy
> CONFIG_RSI_91X=3Dm
> CONFIG_RSI_DEBUGFS=3Dy
> CONFIG_RSI_SDIO=3Dm
> # CONFIG_WLAN_VENDOR_ST is not set
> # CONFIG_WLAN_VENDOR_TI is not set
> # CONFIG_WLAN_VENDOR_ZYDAS is not set
> CONFIG_MAC80211_HWSIM=3Dm
> =

> #
> # WiMAX Wireless Broadband devices
> #
> =

> #
> # Enable USB support to see WiMAX USB drivers
> #
> CONFIG_WAN=3Dy
> # CONFIG_LANMEDIA is not set
> CONFIG_HDLC=3Dm
> # CONFIG_HDLC_RAW is not set
> CONFIG_HDLC_RAW_ETH=3Dm
> CONFIG_HDLC_CISCO=3Dm
> # CONFIG_HDLC_FR is not set
> CONFIG_HDLC_PPP=3Dm
> =

> #
> # X.25/LAPB support is disabled
> #
> # CONFIG_PCI200SYN is not set
> # CONFIG_WANXL is not set
> # CONFIG_PC300TOO is not set
> # CONFIG_FARSYNC is not set
> # CONFIG_DSCC4 is not set
> CONFIG_DLCI=3Dm
> CONFIG_DLCI_MAX=3D8
> CONFIG_SBNI=3Dy
> CONFIG_SBNI_MULTILINE=3Dy
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_ISDN is not set
> CONFIG_NVM=3Dy
> CONFIG_NVM_DEBUG=3Dy
> # CONFIG_NVM_GENNVM is not set
> # CONFIG_NVM_RRPC is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> # CONFIG_INPUT_LEDS is not set
> CONFIG_INPUT_FF_MEMLESS=3Dm
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dm
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dm
> # CONFIG_INPUT_EVDEV is not set
> CONFIG_INPUT_EVBUG=3Dm
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
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> CONFIG_INPUT_MOUSE=3Dy
> # CONFIG_MOUSE_PS2 is not set
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> CONFIG_MOUSE_ELAN_I2C=3Dm
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
> CONFIG_MOUSE_VSXXXAA=3Dy
> CONFIG_MOUSE_GPIO=3Dy
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> CONFIG_TABLET_SERIAL_WACOM4=3Dm
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM80X_ONKEY=3Dm
> CONFIG_INPUT_AD714X=3Dm
> CONFIG_INPUT_AD714X_I2C=3Dm
> # CONFIG_INPUT_ARIZONA_HAPTICS is not set
> CONFIG_INPUT_BMA150=3Dm
> CONFIG_INPUT_E3X0_BUTTON=3Dm
> CONFIG_INPUT_MC13783_PWRBUTTON=3Dm
> CONFIG_INPUT_MMA8450=3Dm
> CONFIG_INPUT_MPU3050=3Dm
> CONFIG_INPUT_APANEL=3Dm
> CONFIG_INPUT_GP2A=3Dm
> CONFIG_INPUT_GPIO_BEEPER=3Dm
> CONFIG_INPUT_GPIO_TILT_POLLED=3Dy
> # CONFIG_INPUT_WISTRON_BTNS is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> # CONFIG_INPUT_KXTJ9 is not set
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dm
> CONFIG_INPUT_RETU_PWRBUTTON=3Dm
> # CONFIG_INPUT_AXP20X_PEK is not set
> CONFIG_INPUT_UINPUT=3Dm
> CONFIG_INPUT_PCF8574=3Dm
> CONFIG_INPUT_PWM_BEEPER=3Dy
> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
> CONFIG_INPUT_DA9063_ONKEY=3Dm
> # CONFIG_INPUT_ADXL34X is not set
> CONFIG_INPUT_CMA3000=3Dm
> CONFIG_INPUT_CMA3000_I2C=3Dm
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dm
> # CONFIG_INPUT_DRV260X_HAPTICS is not set
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> # CONFIG_INPUT_DRV2667_HAPTICS is not set
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
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dm
> CONFIG_SERIO_ARC_PS2=3Dm
> # CONFIG_SERIO_APBPS2 is not set
> CONFIG_USERIO=3Dm
> CONFIG_GAMEPORT=3Dm
> CONFIG_GAMEPORT_NS558=3Dm
> CONFIG_GAMEPORT_L4=3Dm
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_ROCKETPORT is not set
> # CONFIG_CYCLADES is not set
> # CONFIG_MOXA_INTELLIO is not set
> # CONFIG_MOXA_SMARTIO is not set
> # CONFIG_SYNCLINK is not set
> # CONFIG_SYNCLINKMP is not set
> # CONFIG_SYNCLINK_GT is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_ISI is not set
> # CONFIG_N_HDLC is not set
> CONFIG_N_GSM=3Dm
> # CONFIG_TRACE_ROUTER is not set
> CONFIG_TRACE_SINK=3Dy
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
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> # CONFIG_SERIAL_8250_MANY_PORTS is not set
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> # CONFIG_SERIAL_8250_RSA is not set
> # CONFIG_SERIAL_8250_FSL is not set
> CONFIG_SERIAL_8250_DW=3Dm
> # CONFIG_SERIAL_8250_FINTEK is not set
> # CONFIG_SERIAL_8250_MID is not set
> # CONFIG_SERIAL_8250_MOXA is not set
> CONFIG_SERIAL_OF_PLATFORM=3Dm
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_UARTLITE=3Dm
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> CONFIG_SERIAL_SCCNXP=3Dy
> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> # CONFIG_SERIAL_PCH_UART is not set
> CONFIG_SERIAL_XILINX_PS_UART=3Dm
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dy
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> CONFIG_SERIAL_MVEBU_UART=3Dy
> # CONFIG_SERIAL_MVEBU_CONSOLE is not set
> CONFIG_TTY_PRINTK=3Dm
> CONFIG_PRINTER=3Dy
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=3Dm
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_HW_RANDOM is not set
> # CONFIG_NVRAM is not set
> CONFIG_R3964=3Dy
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> # CONFIG_MWAVE is not set
> CONFIG_SCx200_GPIO=3Dm
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dm
> CONFIG_TCG_TPM=3Dm
> # CONFIG_TCG_TIS is not set
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> # CONFIG_TCG_NSC is not set
> CONFIG_TCG_ATMEL=3Dm
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> # CONFIG_TELCLOCK is not set
> CONFIG_DEVPORT=3Dy
> CONFIG_XILLYBUS=3Dy
> CONFIG_XILLYBUS_OF=3Dy
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dm
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> CONFIG_I2C_MUX_GPIO=3Dm
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=3Dm
> CONFIG_I2C_MUX_REG=3Dm
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dm
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dm
> CONFIG_I2C_ALGOPCF=3Dm
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
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EG20T is not set
> CONFIG_I2C_GPIO=3Dm
> CONFIG_I2C_KEMPLD=3Dm
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dm
> # CONFIG_I2C_PXA is not set
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dm
> CONFIG_I2C_XILINX=3Dm
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_PARPORT_LIGHT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_SCx200_ACB is not set
> CONFIG_I2C_STUB=3Dm
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dm
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> =

> #
> # PPS support
> #
> CONFIG_PPS=3Dm
> # CONFIG_PPS_DEBUG is not set
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
> CONFIG_PTP_1588_CLOCK=3Dm
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_PTP_1588_CLOCK_PCH=3Dm
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dm
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=3Dm
> # CONFIG_GPIO_ALTERA is not set
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_GRGPIO=3Dy
> # CONFIG_GPIO_ICH is not set
> CONFIG_GPIO_LYNXPOINT=3Dy
> # CONFIG_GPIO_MENZ127 is not set
> # CONFIG_GPIO_SYSCON is not set
> # CONFIG_GPIO_VX855 is not set
> CONFIG_GPIO_XILINX=3Dm
> CONFIG_GPIO_ZX=3Dy
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_104_DIO_48E is not set
> # CONFIG_GPIO_104_IDIO_16 is not set
> CONFIG_GPIO_104_IDI_48=3Dm
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_IT87=3Dy
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> # CONFIG_GPIO_WS16C48 is not set
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> CONFIG_GPIO_ADNP=3Dm
> CONFIG_GPIO_MAX7300=3Dm
> CONFIG_GPIO_MAX732X=3Dm
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCF857X=3Dm
> CONFIG_GPIO_TPIC2810=3Dm
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_KEMPLD=3Dy
> # CONFIG_GPIO_LP3943 is not set
> CONFIG_GPIO_TPS65086=3Dm
> # CONFIG_GPIO_TPS65912 is not set
> # CONFIG_GPIO_UCB1400 is not set
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_INTEL_MID is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCH is not set
> # CONFIG_GPIO_RDC321X is not set
> # CONFIG_GPIO_SODAVILLE is not set
> =

> #
> # SPI or I2C GPIO expanders
> #
> # CONFIG_GPIO_MCP23S08 is not set
> CONFIG_W1=3Dy
> # CONFIG_W1_CON is not set
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2482=3Dm
> CONFIG_W1_MASTER_DS1WM=3Dy
> # CONFIG_W1_MASTER_GPIO is not set
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dm
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dm
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2760=3Dm
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dm
> # CONFIG_W1_SLAVE_DS28E04 is not set
> CONFIG_W1_SLAVE_BQ27000=3Dm
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_PDA_POWER is not set
> CONFIG_GENERIC_ADC_BATTERY=3Dm
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_ACT8945A=3Dm
> CONFIG_BATTERY_DS2760=3Dm
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dm
> CONFIG_BATTERY_DS2782=3Dm
> CONFIG_BATTERY_SBS=3Dm
> CONFIG_BATTERY_BQ27XXX=3Dm
> CONFIG_BATTERY_BQ27XXX_I2C=3Dm
> CONFIG_AXP288_FUEL_GAUGE=3Dm
> CONFIG_BATTERY_MAX17040=3Dm
> CONFIG_BATTERY_MAX17042=3Dm
> CONFIG_CHARGER_MAX8903=3Dy
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_BQ2415X=3Dm
> CONFIG_CHARGER_BQ24190=3Dm
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=3Dm
> CONFIG_CHARGER_BQ25890=3Dm
> CONFIG_CHARGER_SMB347=3Dm
> # CONFIG_CHARGER_TPS65217 is not set
> CONFIG_BATTERY_GAUGE_LTC2941=3Dm
> CONFIG_BATTERY_GOLDFISH=3Dm
> # CONFIG_BATTERY_RT5033 is not set
> CONFIG_CHARGER_RT9455=3Dm
> CONFIG_AXP20X_POWER=3Dm
> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_AVS=3Dy
> CONFIG_HWMON=3Dm
> CONFIG_HWMON_VID=3Dm
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7414=3Dm
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM9240 is not set
> # CONFIG_SENSORS_ADT7410 is not set
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> CONFIG_SENSORS_ADT7475=3Dm
> CONFIG_SENSORS_ASC7621=3Dm
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> # CONFIG_SENSORS_ASB100 is not set
> # CONFIG_SENSORS_ATXP1 is not set
> # CONFIG_SENSORS_DS620 is not set
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dm
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_MC13783_ADC=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> CONFIG_SENSORS_G762=3Dm
> CONFIG_SENSORS_GPIO_FAN=3Dm
> CONFIG_SENSORS_HIH6130=3Dm
> CONFIG_SENSORS_IIO_HWMON=3Dm
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dm
> CONFIG_SENSORS_IT87=3Dm
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=3Dm
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dm
> # CONFIG_SENSORS_LTC2990 is not set
> # CONFIG_SENSORS_LTC4151 is not set
> CONFIG_SENSORS_LTC4215=3Dm
> CONFIG_SENSORS_LTC4222=3Dm
> CONFIG_SENSORS_LTC4245=3Dm
> CONFIG_SENSORS_LTC4260=3Dm
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> CONFIG_SENSORS_MAX6639=3Dm
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> CONFIG_SENSORS_MAX31790=3Dm
> # CONFIG_SENSORS_MCP3021 is not set
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dm
> CONFIG_SENSORS_LM63=3Dm
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dm
> # CONFIG_SENSORS_LM83 is not set
> # CONFIG_SENSORS_LM85 is not set
> CONFIG_SENSORS_LM87=3Dm
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=3Dm
> # CONFIG_SENSORS_LM95241 is not set
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dm
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> CONFIG_SENSORS_NCT6683=3Dm
> CONFIG_SENSORS_NCT6775=3Dm
> CONFIG_SENSORS_NCT7802=3Dm
> CONFIG_SENSORS_NCT7904=3Dm
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_PMBUS is not set
> # CONFIG_SENSORS_PWM_FAN is not set
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=3Dm
> # CONFIG_SENSORS_SHTC1 is not set
> # CONFIG_SENSORS_SIS5595 is not set
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dm
> CONFIG_SENSORS_EMC6W201=3Dm
> # CONFIG_SENSORS_SMSC47M1 is not set
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=3Dm
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> CONFIG_SENSORS_SMM665=3Dm
> CONFIG_SENSORS_ADC128D818=3Dm
> # CONFIG_SENSORS_ADS1015 is not set
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> # CONFIG_SENSORS_INA209 is not set
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_TC74=3Dm
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dm
> CONFIG_SENSORS_TMP103=3Dm
> # CONFIG_SENSORS_TMP401 is not set
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dm
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=3Dm
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dm
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_OF=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_CPU_THERMAL is not set
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_INTEL_POWERCLAMP=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> # CONFIG_INT340X_THERMAL is not set
> CONFIG_INTEL_PCH_THERMAL=3Dm
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> # CONFIG_SSB_B43_PCI_BRIDGE is not set
> CONFIG_SSB_SILENT=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_CS5535 is not set
> CONFIG_MFD_ACT8945A=3Dm
> # CONFIG_MFD_ATMEL_FLEXCOM is not set
> # CONFIG_MFD_ATMEL_HLCDC is not set
> CONFIG_MFD_BCM590XX=3Dm
> CONFIG_MFD_AXP20X=3Dm
> CONFIG_MFD_AXP20X_I2C=3Dm
> # CONFIG_MFD_CROS_EC is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dm
> # CONFIG_MFD_DA9150 is not set
> CONFIG_MFD_MC13XXX=3Dm
> CONFIG_MFD_MC13XXX_I2C=3Dm
> CONFIG_MFD_HI6421_PMIC=3Dm
> CONFIG_HTC_PASIC3=3Dm
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dm
> # CONFIG_MFD_88PM805 is not set
> CONFIG_MFD_MAX77686=3Dm
> CONFIG_MFD_MAX8907=3Dm
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dm
> CONFIG_MFD_RETU=3Dm
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_UCB1400_CORE=3Dm
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RT5033=3Dm
> CONFIG_MFD_RK808=3Dm
> CONFIG_MFD_RN5T618=3Dm
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> # CONFIG_MFD_SM501_GPIO is not set
> CONFIG_MFD_SKY81452=3Dm
> CONFIG_ABX500_CORE=3Dy
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> CONFIG_MFD_LP3943=3Dm
> CONFIG_TPS6105X=3Dm
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> CONFIG_MFD_TPS65086=3Dm
> CONFIG_MFD_TPS65217=3Dm
> # CONFIG_MFD_TPS65218 is not set
> CONFIG_MFD_TPS65912=3Dm
> CONFIG_MFD_TPS65912_I2C=3Dm
> CONFIG_MFD_WL1273_CORE=3Dm
> CONFIG_MFD_LM3533=3Dm
> # CONFIG_MFD_TIMBERDALE is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dm
> # CONFIG_MFD_CS47L24 is not set
> CONFIG_MFD_WM5102=3Dy
> # CONFIG_MFD_WM5110 is not set
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=3Dy
> # CONFIG_MFD_WM8994 is not set
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dm
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PM800=3Dm
> CONFIG_REGULATOR_ACT8865=3Dm
> # CONFIG_REGULATOR_ACT8945A is not set
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_ANATOP=3Dy
> CONFIG_REGULATOR_ARIZONA=3Dm
> CONFIG_REGULATOR_AXP20X=3Dm
> # CONFIG_REGULATOR_BCM590XX is not set
> # CONFIG_REGULATOR_DA9063 is not set
> CONFIG_REGULATOR_DA9210=3Dm
> CONFIG_REGULATOR_DA9211=3Dm
> # CONFIG_REGULATOR_FAN53555 is not set
> CONFIG_REGULATOR_GPIO=3Dm
> # CONFIG_REGULATOR_HI6421 is not set
> CONFIG_REGULATOR_ISL9305=3Dm
> CONFIG_REGULATOR_ISL6271A=3Dm
> # CONFIG_REGULATOR_LP3971 is not set
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=3Dm
> CONFIG_REGULATOR_LP8755=3Dm
> # CONFIG_REGULATOR_LTC3589 is not set
> CONFIG_REGULATOR_MAX1586=3Dm
> CONFIG_REGULATOR_MAX8649=3Dm
> CONFIG_REGULATOR_MAX8660=3Dm
> CONFIG_REGULATOR_MAX8907=3Dm
> CONFIG_REGULATOR_MAX8952=3Dm
> CONFIG_REGULATOR_MAX8973=3Dm
> # CONFIG_REGULATOR_MAX77686 is not set
> CONFIG_REGULATOR_MAX77802=3Dm
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> CONFIG_REGULATOR_MC13783=3Dm
> CONFIG_REGULATOR_MC13892=3Dm
> # CONFIG_REGULATOR_MT6311 is not set
> # CONFIG_REGULATOR_MT6397 is not set
> CONFIG_REGULATOR_PFUZE100=3Dm
> CONFIG_REGULATOR_PV88060=3Dm
> CONFIG_REGULATOR_PV88090=3Dm
> CONFIG_REGULATOR_PWM=3Dy
> CONFIG_REGULATOR_RK808=3Dm
> CONFIG_REGULATOR_RN5T618=3Dm
> CONFIG_REGULATOR_RT5033=3Dm
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_TPS51632=3Dm
> CONFIG_REGULATOR_TPS6105X=3Dm
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=3Dm
> CONFIG_REGULATOR_TPS6507X=3Dm
> # CONFIG_REGULATOR_TPS65086 is not set
> # CONFIG_REGULATOR_TPS65217 is not set
> # CONFIG_REGULATOR_TPS65912 is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dm
> CONFIG_DRM_MIPI_DSI=3Dy
> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_ADV7511=3Dm
> CONFIG_DRM_I2C_CH7006=3Dm
> # CONFIG_DRM_I2C_SIL164 is not set
> CONFIG_DRM_I2C_NXP_TDA998X=3Dm
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> =

> #
> # ACP Configuration
> #
> # CONFIG_DRM_AMD_ACP is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> # CONFIG_DRM_VGEM is not set
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_UDL is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> CONFIG_DRM_PANEL_SIMPLE=3Dm
> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=3Dm
> CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=3Dm
> # CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dm
> CONFIG_DRM_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_NXP_PTN3460=3Dm
> CONFIG_DRM_PARADE_PS8622=3Dm
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dm
> CONFIG_FIRMWARE_EDID=3Dy
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> # CONFIG_FB_DDC is not set
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dm
> CONFIG_FB_CFB_COPYAREA=3Dm
> CONFIG_FB_CFB_IMAGEBLIT=3Dm
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dm
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dm
> # CONFIG_FB_SVGALIB is not set
> # CONFIG_FB_MACMODES is not set
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
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_UVESA=3Dm
> CONFIG_FB_N411=3Dm
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_OPENCORES is not set
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
> # CONFIG_FB_GEODE is not set
> CONFIG_FB_SM501=3Dm
> CONFIG_FB_IBM_GXT4500=3Dm
> CONFIG_FB_GOLDFISH=3Dm
> CONFIG_FB_VIRTUAL=3Dm
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_BROADSHEET=3Dm
> # CONFIG_FB_AUO_K190X is not set
> CONFIG_FB_SSD1307=3Dm
> # CONFIG_FB_SM712 is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dm
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dm
> # CONFIG_BACKLIGHT_LM3533 is not set
> CONFIG_BACKLIGHT_PWM=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_ADP8860=3Dm
> CONFIG_BACKLIGHT_ADP8870=3Dm
> CONFIG_BACKLIGHT_LM3630A=3Dm
> # CONFIG_BACKLIGHT_LM3639 is not set
> # CONFIG_BACKLIGHT_LP855X is not set
> CONFIG_BACKLIGHT_SKY81452=3Dm
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_GPIO=3Dm
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_VGASTATE is not set
> CONFIG_VIDEOMODE_HELPERS=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> CONFIG_SND=3Dy
> CONFIG_SND_TIMER=3Dy
> CONFIG_SND_PCM=3Dm
> CONFIG_SND_DMAENGINE_PCM=3Dm
> CONFIG_SND_HWDEP=3Dm
> CONFIG_SND_RAWMIDI=3Dm
> CONFIG_SND_COMPRESS_OFFLOAD=3Dm
> CONFIG_SND_JACK=3Dy
> CONFIG_SND_JACK_INPUT_DEV=3Dy
> CONFIG_SND_SEQUENCER=3Dy
> CONFIG_SND_SEQ_DUMMY=3Dm
> CONFIG_SND_OSSEMUL=3Dy
> CONFIG_SND_MIXER_OSS=3Dy
> # CONFIG_SND_PCM_OSS is not set
> CONFIG_SND_PCM_TIMER=3Dy
> # CONFIG_SND_SEQUENCER_OSS is not set
> # CONFIG_SND_DYNAMIC_MINORS is not set
> CONFIG_SND_SUPPORT_OLD_API=3Dy
> CONFIG_SND_PROC_FS=3Dy
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> CONFIG_SND_VERBOSE_PRINTK=3Dy
> # CONFIG_SND_DEBUG is not set
> CONFIG_SND_VMASTER=3Dy
> CONFIG_SND_DMA_SGBUF=3Dy
> CONFIG_SND_RAWMIDI_SEQ=3Dm
> # CONFIG_SND_OPL3_LIB_SEQ is not set
> # CONFIG_SND_OPL4_LIB_SEQ is not set
> # CONFIG_SND_SBAWE_SEQ is not set
> # CONFIG_SND_EMU10K1_SEQ is not set
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
> CONFIG_SND_FIREWIRE=3Dy
> CONFIG_SND_FIREWIRE_LIB=3Dm
> CONFIG_SND_DICE=3Dm
> CONFIG_SND_OXFW=3Dm
> # CONFIG_SND_ISIGHT is not set
> # CONFIG_SND_FIREWORKS is not set
> CONFIG_SND_BEBOB=3Dm
> CONFIG_SND_FIREWIRE_DIGI00X=3Dm
> # CONFIG_SND_FIREWIRE_TASCAM is not set
> CONFIG_SND_SOC=3Dm
> CONFIG_SND_SOC_AC97_BUS=3Dy
> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> CONFIG_SND_SOC_COMPRESS=3Dy
> CONFIG_SND_SOC_AMD_ACP=3Dm
> CONFIG_SND_ATMEL_SOC=3Dm
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
> # CONFIG_SND_SOC_IMG is not set
> CONFIG_SND_SST_MFLD_PLATFORM=3Dm
> CONFIG_SND_SST_IPC=3Dm
> CONFIG_SND_SST_IPC_ACPI=3Dm
> CONFIG_SND_SOC_INTEL_SST=3Dm
> CONFIG_SND_SOC_INTEL_SST_ACPI=3Dm
> CONFIG_SND_SOC_INTEL_SST_MATCH=3Dm
> # CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH is not set
> CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH=3Dm
> # CONFIG_SND_SOC_INTEL_SKL_RT286_MACH is not set
> =

> #
> # Allwinner SoC Audio support
> #
> CONFIG_SND_SUN4I_CODEC=3Dm
> CONFIG_SND_SUN4I_SPDIF=3Dm
> # CONFIG_SND_SOC_XTFPGA_I2S is not set
> CONFIG_SND_SOC_I2C_AND_SPI=3Dm
> =

> #
> # CODEC drivers
> #
> CONFIG_SND_SOC_AC97_CODEC=3Dm
> CONFIG_SND_SOC_ADAU1701=3Dm
> CONFIG_SND_SOC_AK4554=3Dm
> CONFIG_SND_SOC_AK4613=3Dm
> CONFIG_SND_SOC_AK4642=3Dm
> CONFIG_SND_SOC_AK5386=3Dm
> CONFIG_SND_SOC_ALC5623=3Dm
> CONFIG_SND_SOC_CS35L32=3Dm
> CONFIG_SND_SOC_CS42L51=3Dm
> CONFIG_SND_SOC_CS42L51_I2C=3Dm
> CONFIG_SND_SOC_CS42L52=3Dm
> CONFIG_SND_SOC_CS42L56=3Dm
> CONFIG_SND_SOC_CS42L73=3Dm
> CONFIG_SND_SOC_CS4265=3Dm
> CONFIG_SND_SOC_CS4270=3Dm
> CONFIG_SND_SOC_CS4271=3Dm
> CONFIG_SND_SOC_CS4271_I2C=3Dm
> CONFIG_SND_SOC_CS42XX8=3Dm
> CONFIG_SND_SOC_CS42XX8_I2C=3Dm
> CONFIG_SND_SOC_CS4349=3Dm
> CONFIG_SND_SOC_ES8328=3Dm
> CONFIG_SND_SOC_GTM601=3Dm
> CONFIG_SND_SOC_INNO_RK3036=3Dm
> CONFIG_SND_SOC_PCM1681=3Dm
> CONFIG_SND_SOC_PCM179X=3Dm
> CONFIG_SND_SOC_PCM179X_I2C=3Dm
> CONFIG_SND_SOC_PCM3168A=3Dm
> CONFIG_SND_SOC_PCM3168A_I2C=3Dm
> CONFIG_SND_SOC_PCM512x=3Dm
> CONFIG_SND_SOC_PCM512x_I2C=3Dm
> CONFIG_SND_SOC_RL6231=3Dm
> CONFIG_SND_SOC_RT5616=3Dm
> CONFIG_SND_SOC_RT5631=3Dm
> CONFIG_SND_SOC_RT5651=3Dm
> # CONFIG_SND_SOC_RT5677_SPI is not set
> CONFIG_SND_SOC_SGTL5000=3Dm
> CONFIG_SND_SOC_SIGMADSP=3Dm
> CONFIG_SND_SOC_SIGMADSP_I2C=3Dm
> CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dm
> CONFIG_SND_SOC_SPDIF=3Dm
> CONFIG_SND_SOC_SSM2602=3Dm
> CONFIG_SND_SOC_SSM2602_I2C=3Dm
> CONFIG_SND_SOC_SSM4567=3Dm
> CONFIG_SND_SOC_STA32X=3Dm
> CONFIG_SND_SOC_STA350=3Dm
> CONFIG_SND_SOC_STI_SAS=3Dm
> CONFIG_SND_SOC_TAS2552=3Dm
> CONFIG_SND_SOC_TAS5086=3Dm
> CONFIG_SND_SOC_TAS571X=3Dm
> CONFIG_SND_SOC_TFA9879=3Dm
> CONFIG_SND_SOC_TLV320AIC23=3Dm
> CONFIG_SND_SOC_TLV320AIC23_I2C=3Dm
> CONFIG_SND_SOC_TLV320AIC31XX=3Dm
> CONFIG_SND_SOC_TLV320AIC3X=3Dm
> CONFIG_SND_SOC_TS3A227E=3Dm
> CONFIG_SND_SOC_WM8510=3Dm
> CONFIG_SND_SOC_WM8523=3Dm
> CONFIG_SND_SOC_WM8580=3Dm
> CONFIG_SND_SOC_WM8711=3Dm
> CONFIG_SND_SOC_WM8728=3Dm
> CONFIG_SND_SOC_WM8731=3Dm
> CONFIG_SND_SOC_WM8737=3Dm
> CONFIG_SND_SOC_WM8741=3Dm
> CONFIG_SND_SOC_WM8750=3Dm
> CONFIG_SND_SOC_WM8753=3Dm
> CONFIG_SND_SOC_WM8776=3Dm
> CONFIG_SND_SOC_WM8804=3Dm
> CONFIG_SND_SOC_WM8804_I2C=3Dm
> CONFIG_SND_SOC_WM8903=3Dm
> CONFIG_SND_SOC_WM8962=3Dm
> CONFIG_SND_SOC_WM8974=3Dm
> CONFIG_SND_SOC_WM8978=3Dm
> CONFIG_SND_SOC_TPA6130A2=3Dm
> # CONFIG_SND_SIMPLE_CARD is not set
> CONFIG_SOUND_PRIME=3Dm
> CONFIG_SOUND_OSS=3Dm
> # CONFIG_SOUND_TRACEINIT is not set
> # CONFIG_SOUND_DMAP is not set
> CONFIG_SOUND_VMIDI=3Dm
> # CONFIG_SOUND_TRIX is not set
> CONFIG_SOUND_MSS=3Dm
> CONFIG_SOUND_MPU401=3Dm
> CONFIG_SOUND_PAS=3Dm
> CONFIG_SOUND_PSS=3Dm
> CONFIG_PSS_MIXER=3Dy
> # CONFIG_PSS_HAVE_BOOT is not set
> CONFIG_SOUND_SB=3Dm
> CONFIG_SOUND_YM3812=3Dm
> # CONFIG_SOUND_UART6850 is not set
> CONFIG_SOUND_AEDSP16=3Dm
> CONFIG_SC6600=3Dy
> CONFIG_SC6600_JOY=3Dy
> CONFIG_SC6600_CDROM=3D4
> CONFIG_SC6600_CDROMBASE=3D0
> # CONFIG_SOUND_KAHLUA is not set
> CONFIG_AC97_BUS=3Dm
> =

> #
> # HID support
> #
> # CONFIG_HID is not set
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_USB_PHY is not set
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # CONFIG_USB_GADGET is not set
> # CONFIG_UWB is not set
> CONFIG_MMC=3Dm
> # CONFIG_MMC_DEBUG is not set
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> # CONFIG_MMC_BLOCK is not set
> CONFIG_SDIO_UART=3Dm
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_SDHCI=3Dm
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dm
> CONFIG_MMC_SDHCI_OF_ARASAN=3Dm
> # CONFIG_MMC_SDHCI_OF_AT91 is not set
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> CONFIG_MMC_WBSD=3Dm
> # CONFIG_MMC_TIFM_SD is not set
> CONFIG_MMC_GOLDFISH=3Dm
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_USDHI6ROL0=3Dm
> # CONFIG_MMC_TOSHIBA_PCI is not set
> CONFIG_MMC_MTK=3Dm
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dm
> CONFIG_LEDS_CLASS_FLASH=3Dm
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_BCM6328 is not set
> CONFIG_LEDS_BCM6358=3Dm
> CONFIG_LEDS_LM3530=3Dm
> # CONFIG_LEDS_LM3533 is not set
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_NET48XX=3Dm
> # CONFIG_LEDS_WRAP is not set
> CONFIG_LEDS_PCA9532=3Dm
> CONFIG_LEDS_PCA9532_GPIO=3Dy
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dm
> CONFIG_LEDS_LP55XX_COMMON=3Dm
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=3Dm
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dm
> CONFIG_LEDS_LP8860=3Dm
> CONFIG_LEDS_PCA955X=3Dm
> # CONFIG_LEDS_PCA963X is not set
> CONFIG_LEDS_PWM=3Dm
> CONFIG_LEDS_REGULATOR=3Dm
> CONFIG_LEDS_BD2802=3Dm
> CONFIG_LEDS_LT3593=3Dm
> # CONFIG_LEDS_MC13783 is not set
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=3Dm
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_OT200 is not set
> CONFIG_LEDS_MENF21BMC=3Dm
> CONFIG_LEDS_KTD2692=3Dm
> # CONFIG_LEDS_IS31FL32XX is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dm
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> # CONFIG_LEDS_TRIGGER_CPU is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dm
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> # CONFIG_LEDS_TRIGGER_TRANSIENT is not set
> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> # CONFIG_RTC_HCTOSYS is not set
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> # CONFIG_RTC_INTF_DEV is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM80X=3Dm
> CONFIG_RTC_DRV_ABB5ZES3=3Dm
> CONFIG_RTC_DRV_ABX80X=3Dm
> # CONFIG_RTC_DRV_DS1307 is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> CONFIG_RTC_DRV_DS1374_WDT=3Dy
> CONFIG_RTC_DRV_DS1672=3Dm
> CONFIG_RTC_DRV_HYM8563=3Dm
> CONFIG_RTC_DRV_MAX6900=3Dm
> # CONFIG_RTC_DRV_MAX8907 is not set
> CONFIG_RTC_DRV_MAX77686=3Dm
> CONFIG_RTC_DRV_RK808=3Dm
> # CONFIG_RTC_DRV_RS5C372 is not set
> # CONFIG_RTC_DRV_ISL1208 is not set
> CONFIG_RTC_DRV_ISL12022=3Dm
> CONFIG_RTC_DRV_ISL12057=3Dm
> # CONFIG_RTC_DRV_X1205 is not set
> CONFIG_RTC_DRV_PCF8523=3Dm
> CONFIG_RTC_DRV_PCF85063=3Dm
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dm
> # CONFIG_RTC_DRV_M41T80 is not set
> CONFIG_RTC_DRV_BQ32K=3Dm
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=3Dm
> CONFIG_RTC_DRV_RX8010=3Dm
> CONFIG_RTC_DRV_RX8581=3Dm
> # CONFIG_RTC_DRV_RX8025 is not set
> # CONFIG_RTC_DRV_EM3027 is not set
> # CONFIG_RTC_DRV_RV3029C2 is not set
> # CONFIG_RTC_DRV_RV8803 is not set
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=3Dm
> =

> #
> # SPI and I2C RTC drivers
> #
> # CONFIG_RTC_DRV_DS3232 is not set
> # CONFIG_RTC_DRV_PCF2127 is not set
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> # CONFIG_RTC_DRV_DS1286 is not set
> # CONFIG_RTC_DRV_DS1511 is not set
> # CONFIG_RTC_DRV_DS1553 is not set
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> # CONFIG_RTC_DRV_DS1742 is not set
> CONFIG_RTC_DRV_DS2404=3Dm
> # CONFIG_RTC_DRV_DA9063 is not set
> # CONFIG_RTC_DRV_STK17TA8 is not set
> # CONFIG_RTC_DRV_M48T86 is not set
> # CONFIG_RTC_DRV_M48T35 is not set
> CONFIG_RTC_DRV_M48T59=3Dy
> CONFIG_RTC_DRV_MSM6242=3Dy
> # CONFIG_RTC_DRV_BQ4802 is not set
> # CONFIG_RTC_DRV_RP5C01 is not set
> # CONFIG_RTC_DRV_V3020 is not set
> CONFIG_RTC_DRV_ZYNQMP=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_MC13XXX=3Dm
> # CONFIG_RTC_DRV_SNVS is not set
> # CONFIG_RTC_DRV_MT6397 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_DMADEVICES=3Dy
> CONFIG_DMADEVICES_DEBUG=3Dy
> CONFIG_DMADEVICES_VDEBUG=3Dy
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> CONFIG_DMA_OF=3Dy
> CONFIG_FSL_EDMA=3Dm
> CONFIG_INTEL_IDMA64=3Dy
> # CONFIG_PCH_DMA is not set
> CONFIG_QCOM_HIDMA_MGMT=3Dm
> CONFIG_QCOM_HIDMA=3Dy
> CONFIG_DW_DMAC_CORE=3Dm
> CONFIG_DW_DMAC=3Dm
> CONFIG_DW_DMAC_PCI=3Dm
> =

> #
> # DMA Clients
> #
> # CONFIG_ASYNC_TX_DMA is not set
> CONFIG_DMATEST=3Dy
> # CONFIG_AUXDISPLAY is not set
> CONFIG_UIO=3Dm
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> CONFIG_UIO_DMEM_GENIRQ=3Dm
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dm
> # CONFIG_UIO_MF624 is not set
> CONFIG_VIRT_DRIVERS=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
> # CONFIG_COMEDI is not set
> CONFIG_RTLLIB=3Dm
> CONFIG_RTLLIB_CRYPTO_CCMP=3Dm
> CONFIG_RTLLIB_CRYPTO_TKIP=3Dm
> # CONFIG_RTLLIB_CRYPTO_WEP is not set
> # CONFIG_RTL8192E is not set
> # CONFIG_RTS5208 is not set
> # CONFIG_VT6655 is not set
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7606 is not set
> =

> #
> # Analog digital bi-direction converters
> #
> CONFIG_ADT7316=3Dm
> CONFIG_ADT7316_I2C=3Dm
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dm
> CONFIG_AD7152=3Dm
> CONFIG_AD7746=3Dm
> =

> #
> # Direct Digital Synthesis
> #
> =

> #
> # Digital gyroscope sensors
> #
> =

> #
> # Network Analyzer, Impedance Converters
> #
> CONFIG_AD5933=3Dm
> =

> #
> # Light sensors
> #
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=3Dm
> CONFIG_TSL2583=3Dm
> CONFIG_TSL2x7x=3Dm
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=3Dm
> # CONFIG_ADE7854_I2C is not set
> =

> #
> # Resolver to digital converters
> #
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
> # CONFIG_FIREWIRE_SERIAL is not set
> CONFIG_GOLDFISH_AUDIO=3Dy
> # CONFIG_DGNC is not set
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_MOST is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> # CONFIG_GOLDFISH_BUS is not set
> CONFIG_GOLDFISH_PIPE=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> =

> #
> # Hardware Spinlock drivers
> #
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> CONFIG_MAILBOX=3Dy
> # CONFIG_PCC is not set
> # CONFIG_ALTERA_MBOX is not set
> CONFIG_MAILBOX_TEST=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_STE_MODEM_RPROC is not set
> =

> #
> # Rpmsg drivers
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> # CONFIG_SOC_TI is not set
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> CONFIG_EXTCON_ARIZONA=3Dm
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_MAX3355 is not set
> CONFIG_EXTCON_RT8973A=3Dm
> CONFIG_EXTCON_SM5502=3Dm
> CONFIG_EXTCON_USB_GPIO=3Dy
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dm
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dm
> CONFIG_IIO_KFIFO_BUF=3Dm
> CONFIG_IIO_TRIGGERED_BUFFER=3Dm
> CONFIG_IIO_CONFIGFS=3Dm
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> # CONFIG_IIO_SW_TRIGGER is not set
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dm
> # CONFIG_BMC150_ACCEL is not set
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dm
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dm
> CONFIG_KXCJK1013=3Dm
> CONFIG_MMA7455=3Dm
> CONFIG_MMA7455_I2C=3Dm
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=3Dm
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=3Dm
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=3Dm
> CONFIG_STK8312=3Dm
> CONFIG_STK8BA50=3Dm
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7291 is not set
> CONFIG_AD799X=3Dm
> # CONFIG_AXP288_ADC is not set
> CONFIG_INA2XX_ADC=3Dm
> CONFIG_MAX1363=3Dm
> CONFIG_MCP3422=3Dm
> CONFIG_MEN_Z188_ADC=3Dm
> CONFIG_NAU7802=3Dm
> CONFIG_TI_ADC081C=3Dm
> # CONFIG_TI_ADS1015 is not set
> CONFIG_VF610_ADC=3Dm
> =

> #
> # Amplifiers
> #
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dm
> CONFIG_IAQCORE=3Dm
> # CONFIG_VZ89X is not set
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_IIO_MS_SENSORS_I2C=3Dm
> =

> #
> # SSP Sensor Common
> #
> CONFIG_IIO_ST_SENSORS_I2C=3Dm
> CONFIG_IIO_ST_SENSORS_CORE=3Dm
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dm
> CONFIG_AD5380=3Dm
> CONFIG_AD5446=3Dm
> CONFIG_M62332=3Dm
> # CONFIG_MAX517 is not set
> CONFIG_MAX5821=3Dm
> # CONFIG_MCP4725 is not set
> CONFIG_VF610_DAC=3Dm
> =

> #
> # IIO dummy driver
> #
> CONFIG_IIO_DUMMY_EVGEN=3Dm
> CONFIG_IIO_SIMPLE_DUMMY=3Dm
> CONFIG_IIO_SIMPLE_DUMMY_EVENTS=3Dy
> # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_BMG160=3Dm
> CONFIG_BMG160_I2C=3Dm
> CONFIG_IIO_ST_GYRO_3AXIS=3Dm
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dm
> CONFIG_ITG3200=3Dm
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=3Dm
> # CONFIG_MAX30100 is not set
> =

> #
> # Humidity sensors
> #
> CONFIG_DHT11=3Dm
> CONFIG_HDC100X=3Dm
> # CONFIG_HTU21 is not set
> CONFIG_SI7005=3Dm
> CONFIG_SI7020=3Dm
> =

> #
> # Inertial measurement units
> #
> CONFIG_KMX61=3Dm
> CONFIG_INV_MPU6050_IIO=3Dm
> CONFIG_INV_MPU6050_I2C=3Dm
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> # CONFIG_ADJD_S311 is not set
> # CONFIG_AL3320A is not set
> # CONFIG_APDS9300 is not set
> # CONFIG_APDS9960 is not set
> CONFIG_BH1750=3Dm
> CONFIG_CM32181=3Dm
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=3Dm
> # CONFIG_CM36651 is not set
> # CONFIG_GP2AP020A00F is not set
> # CONFIG_ISL29125 is not set
> CONFIG_JSA1212=3Dm
> # CONFIG_RPR0521 is not set
> # CONFIG_SENSORS_LM3533 is not set
> CONFIG_LTR501=3Dm
> CONFIG_OPT3001=3Dm
> CONFIG_PA12203001=3Dm
> CONFIG_STK3310=3Dm
> CONFIG_TCS3414=3Dm
> CONFIG_TCS3472=3Dm
> CONFIG_SENSORS_TSL2563=3Dm
> CONFIG_TSL4531=3Dm
> # CONFIG_US5182D is not set
> CONFIG_VCNL4000=3Dm
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dm
> CONFIG_AK09911=3Dm
> # CONFIG_BMC150_MAGN is not set
> # CONFIG_MAG3110 is not set
> # CONFIG_MMC35240 is not set
> CONFIG_IIO_ST_MAGN_3AXIS=3Dm
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dm
> CONFIG_SENSORS_HMC5843=3Dm
> CONFIG_SENSORS_HMC5843_I2C=3Dm
> =

> #
> # Inclinometer sensors
> #
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_INTERRUPT_TRIGGER is not set
> CONFIG_IIO_SYSFS_TRIGGER=3Dm
> =

> #
> # Digital potentiometers
> #
> CONFIG_MCP4531=3Dm
> CONFIG_TPL0102=3Dm
> =

> #
> # Pressure sensors
> #
> CONFIG_BMP280=3Dm
> # CONFIG_MPL115_I2C is not set
> CONFIG_MPL3115=3Dm
> # CONFIG_MS5611 is not set
> CONFIG_MS5637=3Dm
> # CONFIG_IIO_ST_PRESS is not set
> CONFIG_T5403=3Dm
> =

> #
> # Lightning sensors
> #
> =

> #
> # Proximity sensors
> #
> CONFIG_LIDAR_LITE_V2=3Dm
> # CONFIG_SX9500 is not set
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dm
> CONFIG_TMP006=3Dm
> # CONFIG_TSYS01 is not set
> CONFIG_TSYS02D=3Dm
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_FSL_FTM is not set
> CONFIG_PWM_LP3943=3Dm
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dm
> CONFIG_IRQCHIP=3Dy
> CONFIG_ARM_GIC_MAX_NR=3D1
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> # CONFIG_RESET_CONTROLLER is not set
> CONFIG_FMC=3Dm
> CONFIG_FMC_FAKEDEV=3Dm
> CONFIG_FMC_TRIVIAL=3Dm
> CONFIG_FMC_WRITE_EEPROM=3Dm
> CONFIG_FMC_CHARDEV=3Dm
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dm
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_POWERCAP=3Dy
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> =

> #
> # Performance monitor support
> #
> CONFIG_RAS=3Dy
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> CONFIG_LIBNVDIMM=3Dy
> CONFIG_BLK_DEV_PMEM=3Dy
> CONFIG_ND_BLK=3Dm
> # CONFIG_BTT is not set
> CONFIG_NVMEM=3Dm
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_GTH is not set
> CONFIG_INTEL_TH_MSU=3Dy
> CONFIG_INTEL_TH_PTI=3Dy
> # CONFIG_INTEL_TH_DEBUG is not set
> =

> #
> # FPGA Configuration Support
> #
> CONFIG_FPGA=3Dy
> CONFIG_FPGA_MGR_ZYNQ_FPGA=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dm
> # CONFIG_DCDBAS is not set
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_FW_CFG_SYSFS is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
> #
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_EXT2_FS is not set
> CONFIG_EXT3_FS=3Dm
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> CONFIG_EXT3_FS_SECURITY=3Dy
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_USE_FOR_EXT2=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_ENCRYPTION is not set
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> CONFIG_REISERFS_CHECK=3Dy
> # CONFIG_REISERFS_PROC_INFO is not set
> CONFIG_REISERFS_FS_XATTR=3Dy
> CONFIG_REISERFS_FS_POSIX_ACL=3Dy
> # CONFIG_REISERFS_FS_SECURITY is not set
> CONFIG_JFS_FS=3Dy
> # CONFIG_JFS_POSIX_ACL is not set
> # CONFIG_JFS_SECURITY is not set
> # CONFIG_JFS_DEBUG is not set
> CONFIG_JFS_STATISTICS=3Dy
> # CONFIG_XFS_FS is not set
> CONFIG_GFS2_FS=3Dy
> CONFIG_OCFS2_FS=3Dm
> CONFIG_OCFS2_FS_O2CB=3Dm
> CONFIG_OCFS2_FS_STATS=3Dy
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> # CONFIG_OCFS2_DEBUG_FS is not set
> # CONFIG_BTRFS_FS is not set
> CONFIG_NILFS2_FS=3Dm
> CONFIG_F2FS_FS=3Dy
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> # CONFIG_F2FS_FS_SECURITY is not set
> # CONFIG_F2FS_CHECK_FS is not set
> CONFIG_F2FS_FS_ENCRYPTION=3Dy
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> CONFIG_QFMT_V1=3Dm
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dm
> CONFIG_OVERLAY_FS=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dm
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> # CONFIG_CACHEFILES is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> CONFIG_UDF_FS=3Dm
> CONFIG_UDF_NLS=3Dy
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> # CONFIG_MSDOS_FS is not set
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> CONFIG_NTFS_FS=3Dm
> CONFIG_NTFS_DEBUG=3Dy
> CONFIG_NTFS_RW=3Dy
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
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_CONFIGFS_FS=3Dy
> # CONFIG_MISC_FILESYSTEMS is not set
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dm
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> # CONFIG_NLS_CODEPAGE_860 is not set
> # CONFIG_NLS_CODEPAGE_861 is not set
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> CONFIG_NLS_CODEPAGE_866=3Dm
> CONFIG_NLS_CODEPAGE_869=3Dy
> # CONFIG_NLS_CODEPAGE_936 is not set
> # CONFIG_NLS_CODEPAGE_950 is not set
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dy
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> CONFIG_NLS_ISO8859_5=3Dm
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> # CONFIG_NLS_ISO8859_13 is not set
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dy
> # CONFIG_NLS_MAC_CELTIC is not set
> # CONFIG_NLS_MAC_CENTEURO is not set
> # CONFIG_NLS_MAC_CROATIAN is not set
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dy
> # CONFIG_NLS_MAC_GREEK is not set
> # CONFIG_NLS_MAC_ICELAND is not set
> # CONFIG_NLS_MAC_INUIT is not set
> CONFIG_NLS_MAC_ROMANIAN=3Dm
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dy
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
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> CONFIG_DEBUG_PAGEALLOC=3Dy
> # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
> CONFIG_PAGE_POISONING_ZERO=3Dy
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_DEBUG_VM is not set
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_HIGHMEM is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_DEBUG_TIMEKEEPING=3Dy
> # CONFIG_TIMER_STATS is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dm
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # CONFIG_DEBUG_LIST is not set
> CONFIG_DEBUG_PI_LIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_REPEATEDLY is not set
> # CONFIG_SPARSE_RCU_POINTER is not set
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_PERF_TEST=3Dy
> # CONFIG_RCU_PERF_TEST_RUNNABLE is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm
> # CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
> CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_FAULT_INJECTION=3Dy
> # CONFIG_FAIL_PAGE_ALLOC is not set
> CONFIG_FAIL_MAKE_REQUEST=3Dy
> CONFIG_FAIL_IO_TIMEOUT=3Dy
> CONFIG_FAIL_MMC_REQUEST=3Dy
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=3Dy
> # CONFIG_LATENCYTOP is not set
> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> =

> #
> # Runtime Testing
> #
> CONFIG_LKDTM=3Dy
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> CONFIG_RBTREE_TEST=3Dm
> CONFIG_INTERVAL_TREE_TEST=3Dm
> CONFIG_PERCPU_TEST=3Dm
> CONFIG_ATOMIC64_SELFTEST=3Dy
> CONFIG_TEST_HEXDUMP=3Dm
> CONFIG_TEST_STRING_HELPERS=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_BITMAP is not set
> CONFIG_TEST_RHASHTABLE=3Dy
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_TEST_LKM is not set
> CONFIG_TEST_USER_COPY=3Dm
> CONFIG_TEST_BPF=3Dm
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_MEMTEST is not set
> CONFIG_TEST_STATIC_KEYS=3Dm
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> CONFIG_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> # CONFIG_STRICT_DEVMEM is not set
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> CONFIG_X86_PTDUMP_CORE=3Dy
> CONFIG_X86_PTDUMP=3Dy
> # CONFIG_DEBUG_RODATA_TEST is not set
> # CONFIG_DEBUG_WX is not set
> # CONFIG_DEBUG_SET_MODULE_RONX is not set
> # CONFIG_DEBUG_NX_TEST is not set
> CONFIG_DOUBLEFAULT=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_IOMMU_STRESS=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> CONFIG_IO_DELAY_UDELAY=3Dy
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D2
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_OPTIMIZE_INLINING=3Dy
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_PERSISTENT_KEYRINGS is not set
> # CONFIG_TRUSTED_KEYS is not set
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> # CONFIG_SECURITY is not set
> CONFIG_SECURITYFS=3Dy
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
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dm
> CONFIG_CRYPTO_AUTHENC=3Dm
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> # CONFIG_CRYPTO_ECHAINIV is not set
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_PCBC=3Dm
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> CONFIG_CRYPTO_CRC32=3Dy
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dm
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> CONFIG_CRYPTO_RMD128=3Dm
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dm
> CONFIG_CRYPTO_TGR192=3Dm
> CONFIG_CRYPTO_WP512=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dm
> CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> CONFIG_CRYPTO_ANUBIS=3Dm
> CONFIG_CRYPTO_ARC4=3Dm
> CONFIG_CRYPTO_BLOWFISH=3Dm
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dm
> CONFIG_CRYPTO_CAST5=3Dm
> # CONFIG_CRYPTO_CAST6 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dm
> CONFIG_CRYPTO_SALSA20_586=3Dm
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> # CONFIG_CRYPTO_TEA is not set
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> CONFIG_CRYPTO_LZ4=3Dy
> # CONFIG_CRYPTO_LZ4HC is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HW=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK is not set
> # CONFIG_CRYPTO_DEV_GEODE is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_LGUEST is not set
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
> CONFIG_GENERIC_IO=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dm
> CONFIG_AUDIT_GENERIC=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dm
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> # CONFIG_XZ_DEC_X86 is not set
> # CONFIG_XZ_DEC_POWERPC is not set
> # CONFIG_XZ_DEC_IA64 is not set
> # CONFIG_XZ_DEC_ARM is not set
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dm
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> # CONFIG_DDR is not set
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_LIBFDT=3Dy
> # CONFIG_SG_SPLIT is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy


--===============2475179835637318238==--

