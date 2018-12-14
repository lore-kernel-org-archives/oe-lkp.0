Content-Type: multipart/mixed; boundary="===============5183808576967903512=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: 78c14bb41e ("mm: allocate vmalloc metadata in one allocation"): BUG: KASAN: double-free or invalid-free in iounmap
Date: Fri, 14 Dec 2018 00:41:11 +0000
Message-ID: <20181214004105.GA20398@tower.DHCP.thefacebook.com>
In-Reply-To: <5c125807./HgRgpbCj9N6D/Oa%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5183808576967903512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

#syz test: git://github.com/rgushchin/linux.git vmalloc

On Thu, Dec 13, 2018 at 09:00:55PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/rgushchin/linux.git vmalloc
> =

> commit 78c14bb41efaf1d4c783ad199adb342269287f9c
> Author:     Roman Gushchin <guro@fb.com>
> AuthorDate: Wed Dec 12 13:24:00 2018 -0800
> Commit:     Roman Gushchin <guro@fb.com>
> CommitDate: Wed Dec 12 18:48:38 2018 -0800
> =

>     mm: allocate vmalloc metadata in one allocation
>     =

>     Currently any vmalloc() call leads to at least 3 metadata allocations:
>     1) struct vm_struct
>     2) struct vm_area
>     3) struct vm_struct->pages array
>     =

>     Especially for small allocations (e.g. 4 pages for kernel stacks,
>     which seems to be one of the main vmalloc() usage these days),
>     it creates some measurable overhead.
>     =

>     vm_struct->pages array has the almost same lifetime as vm_struct,
>     and vm_area has a similar, but is freed lazily. So, it's perfectly
>     possible to squeeze all 3 allocations into one:
>       [ struct vm_struct | struct vm_area | pages array ]
>     =

>     This also slightly simplifies error handling (e.g. fewer ENOMEM
>     handling points).
>     =

>     On my setup it saves up to 4% cpu on allocation of 1000000 4-pages
>     areas.
>     =

>     Signed-off-by: Roman Gushchin <guro@fb.com>
> =

> 875f4ddab4  mm: separate memory allocation and actual work in alloc_vmap_=
area()
> 78c14bb41e  mm: allocate vmalloc metadata in one allocation
> 0a00ffbfba  mm: show number of vmalloc pages in /proc/meminfo
> +----------------------------------------------------+------------+------=
------+------------+
> |                                                    | 875f4ddab4 | 78c14=
bb41e | 0a00ffbfba |
> +----------------------------------------------------+------------+------=
------+------------+
> | boot_successes                                     | 33         | 0    =
      | 0          |
> | boot_failures                                      | 2          | 15   =
      | 11         |
> | BUG:kernel_hang_in_boot-around-mounting-root_stage | 2          |      =
      |            |
> | BUG:KASAN:double-free_or_invalid-free_in_i         | 0          | 15   =
      | 11         |
> +----------------------------------------------------+------------+------=
------+------------+
> =

> [   41.664980] String selftests succeeded
> [   41.684524] glob: 64 self-tests passed, 0 failed
> [   41.758871] no IO addresses supplied
> [   41.818628] hgafb: HGA card not detected.
> [   41.831205] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   41.834120] BUG: KASAN: double-free or invalid-free in iounmap+0xd7/0x=
e0
> [   41.834120] =

> [   41.834120] CPU: 0 PID: 1 Comm: swapper Tainted: G                T 4.=
20.0-rc6-00029-g78c14bb #1
> [   41.834120] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   41.834120] Call Trace:
> [   41.834120]  dump_stack+0x19/0x25
> [   41.834120]  print_address_description+0x78/0x260
> [   41.834120]  ? iounmap+0xd7/0xe0
> [   41.834120]  kasan_report_invalid_free+0x55/0x80
> [   41.834120]  ? iounmap+0xd7/0xe0
> [   41.834120]  __kasan_slab_free+0xc4/0x170
> [   41.834120]  ? iounmap+0xd7/0xe0
> [   41.834120]  kasan_slab_free+0xe/0x10
> [   41.834120]  kfree+0xd5/0x190
> [   41.834120]  iounmap+0xd7/0xe0
> [   41.834120]  hgafb_probe+0x492/0x530
> [   41.834120]  platform_drv_probe+0x5b/0xa0
> [   41.834120]  really_probe+0x1f3/0x410
> [   41.834120]  driver_probe_device+0xb3/0xd0
> [   41.834120]  __device_attach_driver+0x100/0x120
> [   41.834120]  ? __driver_attach+0x130/0x130
> [   41.834120]  bus_for_each_drv+0xde/0x150
> [   41.834120]  ? bus_rescan_devices+0x20/0x20
> [   41.834120]  ? kasan_check_write+0x14/0x20
> [   41.834120]  __device_attach+0x10e/0x190
> [   41.834120]  ? device_bind_driver+0x70/0x70
> [   41.834120]  ? kfree+0xd5/0x190
> [   41.834120]  ? kobject_uevent_env+0x65f/0x6c0
> [   41.834120]  device_initial_probe+0xe/0x10
> [   41.834120]  bus_probe_device+0x63/0x120
> [   41.834120]  device_add+0x6b3/0xa30
> [   41.834120]  ? get_device_parent+0x2e0/0x2e0
> [   41.834120]  ? __lockdep_init_map+0x17a/0x2b0
> [   41.834120]  platform_device_add+0x22f/0x2f0
> [   41.834120]  platform_device_register_full+0x19e/0x210
> [   41.834120]  hgafb_init+0xfb/0x17d
> [   41.834120]  ? n411_init+0x178/0x178
> [   41.834120]  do_one_initcall+0xbc/0x1d0
> [   41.834120]  ? initcall_blacklisted+0x120/0x120
> [   41.834120]  kernel_init_freeable+0x1fc/0x344
> [   41.834120]  ? rest_init+0x130/0x130
> [   41.834120]  kernel_init+0xe/0x110
> [   41.834120]  ? rest_init+0x130/0x130
> [   41.834120]  ret_from_fork+0x1f/0x30
> [   41.834120] =

> [   41.834120] Allocated by task 1:
> [   41.834120]  save_stack+0x46/0xd0
> [   41.834120]  kasan_kmalloc+0xb5/0xd0
> [   41.834120]  __kmalloc+0x199/0x1b0
> [   41.834120]  __get_vm_area_node+0x2bc/0x2e0
> [   41.834120]  get_vm_area_caller+0x31/0x40
> [   41.834120]  __ioremap_caller+0x30e/0x470
> [   41.834120]  ioremap_nocache+0x12/0x20
> [   41.834120]  hgafb_probe+0x2a/0x530
> [   41.834120]  platform_drv_probe+0x5b/0xa0
> [   41.834120]  really_probe+0x1f3/0x410
> [   41.834120]  driver_probe_device+0xb3/0xd0
> [   41.834120]  __device_attach_driver+0x100/0x120
> [   41.834120]  bus_for_each_drv+0xde/0x150
> [   41.834120]  __device_attach+0x10e/0x190
> [   41.834120]  device_initial_probe+0xe/0x10
> [   41.834120]  bus_probe_device+0x63/0x120
> [   41.834120]  device_add+0x6b3/0xa30
> [   41.834120]  platform_device_add+0x22f/0x2f0
> [   41.834120]  platform_device_register_full+0x19e/0x210
> [   41.834120]  hgafb_init+0xfb/0x17d
> [   41.834120]  do_one_initcall+0xbc/0x1d0
> [   41.834120]  kernel_init_freeable+0x1fc/0x344
> [   41.834120]  kernel_init+0xe/0x110
> [   41.834120]  ret_from_fork+0x1f/0x30
> [   41.834120] =

> [   41.834120] Freed by task 0:
> [   41.834120] (stack is not available)
> [   41.834120] =

> [   41.834120] The buggy address belongs to the object at ffff888017d14aa8
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 330c90e4ac910684ce2dc261a768327d5a4ee45e 40e020c129cfc99=
1e8ab4736d2665351ffd1468d --
> git bisect  bad 95014bac3a554ffc861d7f86bcd9d225ee35a135  # 15:06  B     =
 0     1   16   0  Merge 'linux-review/Rob-Herring/kbuild-Add-support-for-D=
T-binding-schema-checks/20181211-102256' into devel-hourly-2018121311
> git bisect  bad f45f512afaaf4380cd16634c5f19ae6822c0c351  # 15:37  B     =
 0     3   19   1  Merge 'dm/for-next' into devel-hourly-2018121311
> git bisect  bad a54c8a515f6b70ac5f6c9a98f65f8907936cb7ae  # 16:07  B     =
 0     2   17   0  Merge 'ceph-client/testing' into devel-hourly-2018121311
> git bisect  bad 758ab3753262a4a984d0121f8cf5c7a9691ff86e  # 16:30  B     =
 0    11   26   0  Merge 'renesas/arm64-dt-for-v4.22' into devel-hourly-201=
8121311
> git bisect  bad 4aeaec8b07d2e465f84a1ccc050cc567cb8224b3  # 16:48  B     =
 0     5   20   0  Merge 'jkirsher-net-queue/40GbE' into devel-hourly-20181=
21311
> git bisect good 623327692c7229b0de99b18b3395ede30d571685  # 17:15  G     =
11     0    0   0  Merge 'sschmidt-wpan/ieee802154-for-davem-2018-12-11' in=
to devel-hourly-2018121311
> git bisect good 8d712c7d56118c73bc6674f47fad2a3408b71108  # 17:39  G     =
11     0    1   1  Merge 'renesas-drivers/topic/scif-pio-fallback-v3' into =
devel-hourly-2018121311
> git bisect good 6c4ed7908199d26245e4894dc597913e94ac8335  # 18:03  G     =
11     0    0   0  Merge 'shawnguo/imx/drivers' into devel-hourly-2018121311
> git bisect  bad f2f98537f55ae82c4f888eac7d03a5673b59d47b  # 18:23  B     =
 0     2   17   0  Merge 'rgushchin/vmalloc' into devel-hourly-2018121311
> git bisect good 875f4ddab4704ddc8226c4b509f742f365e55c69  # 18:49  G     =
11     0    0   0  mm: separate memory allocation and actual work in alloc_=
vmap_area()
> git bisect  bad f5f4f80ff73a2abe40cd3eb06e518c17de41d931  # 19:06  B     =
 0    11   26   0  mm: show number of vmalloc pages in /proc/meminfo
> git bisect  bad 78c14bb41efaf1d4c783ad199adb342269287f9c  # 19:25  B     =
 0    10   25   0  mm: allocate vmalloc metadata in one allocation
> # first bad commit: [78c14bb41efaf1d4c783ad199adb342269287f9c] mm: alloca=
te vmalloc metadata in one allocation
> git bisect good 875f4ddab4704ddc8226c4b509f742f365e55c69  # 19:30  G     =
31     0    0   2  mm: separate memory allocation and actual work in alloc_=
vmap_area()
> # extra tests with debug options
> git bisect  bad 78c14bb41efaf1d4c783ad199adb342269287f9c  # 19:52  B     =
 0     8   23   0  mm: allocate vmalloc metadata in one allocation
> # extra tests on HEAD of linux-devel/devel-hourly-2018121311
> git bisect  bad 330c90e4ac910684ce2dc261a768327d5a4ee45e  # 19:52  B     =
 0    19   37   0  0day head guard for 'devel-hourly-2018121311'
> # extra tests on tree/branch rgushchin/vmalloc
> git bisect  bad 0a00ffbfba46bbb39821759cc89843cafcee8504  # 20:19  B     =
 0     4   19   0  mm: show number of vmalloc pages in /proc/meminfo
> # extra tests with first bad commit reverted
> git bisect good 7c3e4cdeeccadc1a0da976b6ca51d30e60badaf7  # 20:59  G     =
11     0    0   0  Revert "mm: allocate vmalloc metadata in one allocation"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_piper=
mail_lkp&d=3DDwICAg&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3DjJYgtDM7QT-W-Fz_d29HYQ&m=
=3DeOR0caU83ev0A7bNgBEDwM3jBbsm24u6V64WS_TlIVE&s=3DksY5loZbP6u68FxtBr1UVhSf=
EO199EE8_XtI8QtRWVY&e=3D                          Intel Corporation



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
> 	-cpu Haswell,+smep,+smap
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 512
> 	-smp 2
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
> # Linux/x86_64 4.20.0-rc6 Kernel Configuration
> #
> =

> #
> # Compiler: gcc-6 (Debian 6.4.0-9) 6.4.0 20171026
> #
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D60400
> CONFIG_CLANG_VERSION=3D0
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
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
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
> # CONFIG_SWAP is not set
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
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
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
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
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TINY_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> # CONFIG_MEMCG is not set
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_DEBUG_BLK_CGROUP=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> # CONFIG_RT_GROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_HUGETLB=3Dy
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> # CONFIG_IPC_NS is not set
> # CONFIG_USER_NS is not set
> # CONFIG_PID_NS is not set
> CONFIG_NET_NS=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> # CONFIG_RD_LZ4 is not set
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
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> CONFIG_PROFILING=3Dy
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
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
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
> CONFIG_KASAN_SHADOW_OFFSET=3D0xdffffc0000000000
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> # CONFIG_RETPOLINE is not set
> CONFIG_INTEL_RDT=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> # CONFIG_IOSF_MBI is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
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
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> # CONFIG_CALGARY_IOMMU is not set
> CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> CONFIG_NR_CPUS_RANGE_END=3D1
> CONFIG_NR_CPUS_DEFAULT=3D1
> CONFIG_NR_CPUS=3D1
> CONFIG_UP_LATE_INIT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCELOG_LEGACY is not set
> # CONFIG_X86_MCE_INTEL is not set
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> # CONFIG_X86_MCE_INJECT is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_I8K=3Dy
> # CONFIG_MICROCODE is not set
> # CONFIG_X86_MSR is not set
> # CONFIG_X86_CPUID is not set
> # CONFIG_X86_5LEVEL is not set
> CONFIG_X86_CPA_STATISTICS=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> # CONFIG_AMD_MEM_ENCRYPT is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> # CONFIG_X86_PMEM_LEGACY is not set
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_INTEL_UMIP=3Dy
> CONFIG_X86_INTEL_MPX=3Dy
> # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
> # CONFIG_EFI is not set
> CONFIG_SECCOMP=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> CONFIG_HZ_300=3Dy
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D300
> # CONFIG_KEXEC is not set
> # CONFIG_KEXEC_FILE is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_COMPAT_VDSO=3Dy
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> # CONFIG_PM is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
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
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_DPTF_POWER is not set
> # CONFIG_ACPI_EXTLOG is not set
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
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> CONFIG_INTEL_IDLE=3Dy
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
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
> # PCI controller drivers
> #
> =

> #
> # Cadence PCIe controllers support
> #
> # CONFIG_PCIE_CADENCE_HOST is not set
> # CONFIG_PCI_FTPCI100 is not set
> # CONFIG_PCI_HOST_GENERIC is not set
> # CONFIG_PCIE_XILINX is not set
> =

> #
> # DesignWare PCI Core Support
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
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Binary Emulations
> #
> CONFIG_IA32_EMULATION=3Dy
> # CONFIG_IA32_AOUT is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT_32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dm
> CONFIG_EDD_OFF=3Dy
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DMIID=3Dy
> # CONFIG_DMI_SYSFS is not set
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_FW_CFG_SYSFS is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> # CONFIG_GOOGLE_SMI is not set
> CONFIG_GOOGLE_COREBOOT_TABLE=3Dm
> CONFIG_GOOGLE_MEMCONSOLE=3Dm
> # CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
> CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT=3Dm
> CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=3Dm
> # CONFIG_GOOGLE_VPD is not set
> =

> #
> # Tegra firmware driver
> #
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_VHOST_NET is not set
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> =

> #
> # General architecture-dependent options
> #
> CONFIG_OPROFILE=3Dm
> # CONFIG_OPROFILE_EVENT_MULTIPLEX is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
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
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
> CONFIG_HAVE_RCU_TABLE_INVALIDATE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> # CONFIG_STACKPROTECTOR is not set
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
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_COMPAT_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> CONFIG_REFCOUNT_FULL=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> CONFIG_GCOV_FORMAT_4_7=3Dy
> CONFIG_PLUGIN_HOSTCC=3D"g++"
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGIN_LATENT_ENTROPY=3Dy
> CONFIG_GCC_PLUGIN_STRUCTLEAK=3Dy
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
> CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy
> # CONFIG_GCC_PLUGIN_RANDSTRUCT_PERFORMANCE is not set
> # CONFIG_GCC_PLUGIN_STACKLEAK is not set
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> # CONFIG_MODULE_UNLOAD is not set
> CONFIG_MODVERSIONS=3Dy
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> # CONFIG_BLK_DEV_INTEGRITY is not set
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_DEV_THROTTLING=3Dy
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> CONFIG_BLK_WBT=3Dy
> CONFIG_BLK_CGROUP_IOLATENCY=3Dy
> # CONFIG_BLK_WBT_SQ is not set
> # CONFIG_BLK_WBT_MQ is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> CONFIG_ACORN_PARTITION=3Dy
> CONFIG_ACORN_PARTITION_CUMANA=3Dy
> CONFIG_ACORN_PARTITION_EESOX=3Dy
> CONFIG_ACORN_PARTITION_ICS=3Dy
> # CONFIG_ACORN_PARTITION_ADFS is not set
> # CONFIG_ACORN_PARTITION_POWERTEC is not set
> # CONFIG_ACORN_PARTITION_RISCIX is not set
> CONFIG_AIX_PARTITION=3Dy
> CONFIG_OSF_PARTITION=3Dy
> # CONFIG_AMIGA_PARTITION is not set
> # CONFIG_ATARI_PARTITION is not set
> # CONFIG_MAC_PARTITION is not set
> # CONFIG_MSDOS_PARTITION is not set
> CONFIG_LDM_PARTITION=3Dy
> CONFIG_LDM_DEBUG=3Dy
> # CONFIG_SGI_PARTITION is not set
> # CONFIG_ULTRIX_PARTITION is not set
> # CONFIG_SUN_PARTITION is not set
> CONFIG_KARMA_PARTITION=3Dy
> # CONFIG_EFI_PARTITION is not set
> CONFIG_SYSV68_PARTITION=3Dy
> # CONFIG_CMDLINE_PARTITION is not set
> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dm
> CONFIG_IOSCHED_CFQ=3Dm
> # CONFIG_CFQ_GROUP_IOSCHED is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> # CONFIG_IOSCHED_BFQ is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
> # CONFIG_MEMORY_HOTREMOVE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> CONFIG_HWPOISON_INJECT=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> CONFIG_NEED_PER_CPU_KM=3Dy
> CONFIG_CLEANCACHE=3Dy
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> CONFIG_ZSMALLOC=3Dm
> CONFIG_PGTABLE_MAPPING=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
> CONFIG_FRAME_VECTOR=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_PERCPU_STATS=3Dy
> # CONFIG_GUP_BENCHMARK is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
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
> # CONFIG_XFRM_INTERFACE is not set
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
> # CONFIG_BPFILTER is not set
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
> # CONFIG_BPF_JIT is not set
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
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_DEBUG is not set
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
> # CONFIG_FAILOVER is not set
> CONFIG_HAVE_EBPF_JIT=3Dy
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
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> CONFIG_WANT_DEV_COREDUMP=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> CONFIG_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_TEST_ASYNC_DRIVER_PROBE=3Dm
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPMI=3Dm
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # CONFIG_DMA_CMA is not set
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> # CONFIG_GNSS is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_TESTS=3Dm
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_OF_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # Partition parsers
> #
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> # CONFIG_FTL is not set
> CONFIG_NFTL=3Dm
> CONFIG_NFTL_RW=3Dy
> CONFIG_INFTL=3Dm
> CONFIG_RFD_FTL=3Dy
> CONFIG_SSFDC=3Dm
> CONFIG_SM_FTL=3Dy
> # CONFIG_MTD_OOPS is not set
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
> CONFIG_MTD_JEDECPROBE=3Dm
> CONFIG_MTD_GEN_PROBE=3Dm
> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> CONFIG_MTD_CFI_NOSWAP=3Dy
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_GEOMETRY=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_8=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_16=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_32=3Dy
> # CONFIG_MTD_CFI_I1 is not set
> # CONFIG_MTD_CFI_I2 is not set
> CONFIG_MTD_CFI_I4=3Dy
> CONFIG_MTD_CFI_I8=3Dy
> CONFIG_MTD_OTP=3Dy
> # CONFIG_MTD_CFI_INTELEXT is not set
> CONFIG_MTD_CFI_AMDSTD=3Dm
> CONFIG_MTD_CFI_STAA=3Dm
> CONFIG_MTD_CFI_UTIL=3Dm
> CONFIG_MTD_RAM=3Dy
> # CONFIG_MTD_ROM is not set
> CONFIG_MTD_ABSENT=3Dm
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> CONFIG_MTD_PHYSMAP=3Dm
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> CONFIG_MTD_PHYSMAP_OF=3Dy
> CONFIG_MTD_PHYSMAP_OF_VERSATILE=3Dy
> CONFIG_MTD_PHYSMAP_OF_GEMINI=3Dy
> # CONFIG_MTD_AMD76XROM is not set
> CONFIG_MTD_ICHXROM=3Dm
> # CONFIG_MTD_ESB2ROM is not set
> # CONFIG_MTD_CK804XROM is not set
> # CONFIG_MTD_SCB2_FLASH is not set
> CONFIG_MTD_NETtel=3Dm
> CONFIG_MTD_L440GX=3Dm
> # CONFIG_MTD_PCI is not set
> # CONFIG_MTD_GPIO_ADDR is not set
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dy
> # CONFIG_MTD_LATCH_ADDR is not set
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> CONFIG_MTD_SLRAM=3Dm
> CONFIG_MTD_PHRAM=3Dm
> # CONFIG_MTD_MTDRAM is not set
> CONFIG_MTD_BLOCK2MTD=3Dm
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> CONFIG_MTD_ONENAND=3Dm
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> CONFIG_MTD_ONENAND_GENERIC=3Dm
> CONFIG_MTD_ONENAND_OTP=3Dy
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SMC=3Dy
> CONFIG_MTD_NAND=3Dm
> # CONFIG_MTD_NAND_ECC_BCH is not set
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> # CONFIG_MTD_NAND_DENALI_DT is not set
> # CONFIG_MTD_NAND_GPIO is not set
> # CONFIG_MTD_NAND_RICOH is not set
> CONFIG_MTD_NAND_DISKONCHIP=3Dm
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> # CONFIG_MTD_NAND_CAFE is not set
> CONFIG_MTD_NAND_NANDSIM=3Dm
> CONFIG_MTD_NAND_PLATFORM=3Dm
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> CONFIG_MTD_SPI_NOR=3Dm
> CONFIG_MTD_MT81xx_NOR=3Dm
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> CONFIG_SPI_INTEL_SPI=3Dm
> # CONFIG_SPI_INTEL_SPI_PCI is not set
> CONFIG_SPI_INTEL_SPI_PLATFORM=3Dm
> CONFIG_MTD_UBI=3Dm
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_MTD_UBI_BLOCK is not set
> CONFIG_DTC=3Dy
> CONFIG_OF=3Dy
> CONFIG_OF_UNITTEST=3Dy
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_EARLY_FLATTREE=3Dy
> CONFIG_OF_KOBJ=3Dy
> CONFIG_OF_DYNAMIC=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_RESOLVE=3Dy
> CONFIG_OF_OVERLAY=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dm
> # CONFIG_PARPORT_SERIAL is not set
> # CONFIG_PARPORT_PC_FIFO is not set
> CONFIG_PARPORT_PC_SUPERIO=3Dy
> # CONFIG_PARPORT_AX88796 is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> CONFIG_BLK_DEV_FD=3Dy
> CONFIG_CDROM=3Dm
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_DEV_UMEM is not set
> CONFIG_BLK_DEV_LOOP=3Dm
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> CONFIG_BLK_DEV_RAM=3Dy
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D4096
> CONFIG_CDROM_PKTCDVD=3Dm
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> CONFIG_CDROM_PKTCDVD_WCACHE=3Dy
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_VIRTIO_BLK=3Dy
> # CONFIG_VIRTIO_BLK_SCSI is not set
> # CONFIG_BLK_DEV_RBD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dm
> # CONFIG_BLK_DEV_NVME is not set
> CONFIG_NVME_MULTIPATH=3Dy
> CONFIG_NVME_FABRICS=3Dm
> CONFIG_NVME_FC=3Dm
> # CONFIG_NVME_TARGET is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> CONFIG_DUMMY_IRQ=3Dm
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dy
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dm
> # CONFIG_DS1682 is not set
> CONFIG_USB_SWITCH_FSA9480=3Dm
> CONFIG_SRAM=3Dy
> # CONFIG_PCI_ENDPOINT_TEST is not set
> CONFIG_MISC_RTSX=3Dm
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dm
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_EEPROM_IDT_89HPESX is not set
> CONFIG_EEPROM_EE1004=3Dm
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
> CONFIG_ECHO=3Dy
> # CONFIG_MISC_RTSX_PCI is not set
> CONFIG_MISC_RTSX_USB=3Dm
> CONFIG_HAVE_IDE=3Dy
> CONFIG_IDE=3Dm
> =

> #
> # Please see Documentation/ide/ide.txt for help/info on IDE drives
> #
> CONFIG_IDE_ATAPI=3Dy
> CONFIG_BLK_DEV_IDE_SATA=3Dy
> CONFIG_IDE_GD=3Dm
> # CONFIG_IDE_GD_ATA is not set
> # CONFIG_IDE_GD_ATAPI is not set
> CONFIG_BLK_DEV_IDECD=3Dm
> CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS=3Dy
> CONFIG_BLK_DEV_IDETAPE=3Dm
> # CONFIG_BLK_DEV_IDEACPI is not set
> CONFIG_IDE_TASK_IOCTL=3Dy
> # CONFIG_IDE_PROC_FS is not set
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
> # CONFIG_BLK_DEV_HPT366 is not set
> # CONFIG_BLK_DEV_JMICRON is not set
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
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_MQ_DEFAULT=3Dy
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
> CONFIG_CHR_DEV_SG=3Dy
> # CONFIG_CHR_DEV_SCH is not set
> # CONFIG_SCSI_ENCLOSURE is not set
> # CONFIG_SCSI_CONSTANTS is not set
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> # CONFIG_SCSI_FC_ATTRS is not set
> # CONFIG_SCSI_ISCSI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=3Dy
> # CONFIG_SCSI_SAS_LIBSAS is not set
> # CONFIG_SCSI_SRP_ATTRS is not set
> CONFIG_SCSI_LOWLEVEL=3Dy
> # CONFIG_ISCSI_TCP is not set
> # CONFIG_ISCSI_BOOT_SYSFS is not set
> # CONFIG_SCSI_CXGB3_ISCSI is not set
> # CONFIG_SCSI_CXGB4_ISCSI is not set
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> # CONFIG_SCSI_MVSAS is not set
> # CONFIG_SCSI_MVUMI is not set
> # CONFIG_SCSI_DPT_I2O is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> # CONFIG_SCSI_ESAS2R is not set
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> # CONFIG_SCSI_MPT3SAS is not set
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_SMARTPQI is not set
> CONFIG_SCSI_UFSHCD=3Dm
> # CONFIG_SCSI_UFSHCD_PCI is not set
> CONFIG_SCSI_UFSHCD_PLATFORM=3Dm
> CONFIG_SCSI_UFS_DWC_TC_PLATFORM=3Dm
> # CONFIG_SCSI_UFS_BSG is not set
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_SCSI_BUSLOGIC is not set
> # CONFIG_SCSI_MYRB is not set
> # CONFIG_SCSI_MYRS is not set
> # CONFIG_VMWARE_PVSCSI is not set
> # CONFIG_SCSI_SNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_GDTH is not set
> # CONFIG_SCSI_ISCI is not set
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> # CONFIG_SCSI_PPA is not set
> CONFIG_SCSI_IMM=3Dm
> # CONFIG_SCSI_IZIP_EPP16 is not set
> # CONFIG_SCSI_IZIP_SLOW_CTR is not set
> # CONFIG_SCSI_STEX is not set
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> # CONFIG_SCSI_IPR is not set
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> CONFIG_SCSI_DEBUG=3Dm
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_VIRTIO is not set
> # CONFIG_SCSI_DH is not set
> CONFIG_SCSI_OSD_INITIATOR=3Dm
> # CONFIG_SCSI_OSD_ULD is not set
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> CONFIG_SCSI_OSD_DEBUG=3Dy
> CONFIG_ATA=3Dm
> # CONFIG_ATA_VERBOSE_ERROR is not set
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_PMP is not set
> =

> #
> # Controllers with non-SFF native interface
> #
> # CONFIG_SATA_AHCI is not set
> CONFIG_SATA_AHCI_PLATFORM=3Dm
> CONFIG_AHCI_CEVA=3Dm
> CONFIG_AHCI_QORIQ=3Dm
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> # CONFIG_ATA_SFF is not set
> # CONFIG_MD is not set
> # CONFIG_TARGET_CORE is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> # CONFIG_FIREWIRE_OHCI is not set
> CONFIG_FIREWIRE_SBP2=3Dm
> # CONFIG_FIREWIRE_NET is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
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
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_AURORA=3Dy
> # CONFIG_AURORA_NB8800 is not set
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
> # CONFIG_GEMINI_ETHERNET is not set
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
> CONFIG_NET_VENDOR_HP=3Dy
> # CONFIG_HP100 is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> CONFIG_NET_VENDOR_I825XX=3Dy
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
> # CONFIG_IGC is not set
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
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
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
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_QLGE is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCA7000_UART is not set
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
> # CONFIG_TI_CPSW_ALE is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
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
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
> # CONFIG_NVM is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dm
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dm
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dy
> CONFIG_INPUT_EVBUG=3Dm
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADC=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dm
> CONFIG_KEYBOARD_ADP5589=3Dm
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dy
> CONFIG_KEYBOARD_QT2160=3Dm
> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
> CONFIG_KEYBOARD_LKKBD=3Dy
> CONFIG_KEYBOARD_GPIO=3Dy
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> # CONFIG_KEYBOARD_TCA6416 is not set
> CONFIG_KEYBOARD_TCA8418=3Dm
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> CONFIG_KEYBOARD_MCS=3Dm
> CONFIG_KEYBOARD_MPR121=3Dm
> CONFIG_KEYBOARD_NEWTON=3Dm
> CONFIG_KEYBOARD_OPENCORES=3Dm
> # CONFIG_KEYBOARD_SAMSUNG is not set
> CONFIG_KEYBOARD_STOWAWAY=3Dy
> CONFIG_KEYBOARD_SUNKBD=3Dy
> CONFIG_KEYBOARD_OMAP4=3Dy
> CONFIG_KEYBOARD_TC3589X=3Dm
> CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
> CONFIG_KEYBOARD_XTKBD=3Dy
> CONFIG_KEYBOARD_CAP11XX=3Dm
> # CONFIG_KEYBOARD_BCM is not set
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> CONFIG_JOYSTICK_A3D=3Dm
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> CONFIG_JOYSTICK_GF2K=3Dy
> # CONFIG_JOYSTICK_GRIP is not set
> # CONFIG_JOYSTICK_GRIP_MP is not set
> CONFIG_JOYSTICK_GUILLEMOT=3Dy
> CONFIG_JOYSTICK_INTERACT=3Dm
> # CONFIG_JOYSTICK_SIDEWINDER is not set
> # CONFIG_JOYSTICK_TMDC is not set
> CONFIG_JOYSTICK_IFORCE=3Dy
> # CONFIG_JOYSTICK_IFORCE_USB is not set
> # CONFIG_JOYSTICK_IFORCE_232 is not set
> CONFIG_JOYSTICK_WARRIOR=3Dy
> CONFIG_JOYSTICK_MAGELLAN=3Dm
> CONFIG_JOYSTICK_SPACEORB=3Dy
> CONFIG_JOYSTICK_SPACEBALL=3Dy
> CONFIG_JOYSTICK_STINGER=3Dy
> # CONFIG_JOYSTICK_TWIDJOY is not set
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> CONFIG_JOYSTICK_DB9=3Dm
> # CONFIG_JOYSTICK_GAMECON is not set
> # CONFIG_JOYSTICK_TURBOGRAFX is not set
> CONFIG_JOYSTICK_AS5011=3Dm
> CONFIG_JOYSTICK_JOYDUMP=3Dm
> CONFIG_JOYSTICK_XPAD=3Dm
> CONFIG_JOYSTICK_XPAD_FF=3Dy
> CONFIG_JOYSTICK_XPAD_LEDS=3Dy
> CONFIG_JOYSTICK_PXRC=3Dy
> CONFIG_INPUT_TABLET=3Dy
> CONFIG_TABLET_USB_ACECAD=3Dy
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_GTCO is not set
> CONFIG_TABLET_USB_HANWANG=3Dm
> CONFIG_TABLET_USB_KBTAB=3Dm
> # CONFIG_TABLET_USB_PEGASUS is not set
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> # CONFIG_INPUT_88PM80X_ONKEY is not set
> CONFIG_INPUT_AD714X=3Dy
> # CONFIG_INPUT_AD714X_I2C is not set
> CONFIG_INPUT_ATMEL_CAPTOUCH=3Dy
> CONFIG_INPUT_BMA150=3Dm
> CONFIG_INPUT_E3X0_BUTTON=3Dm
> CONFIG_INPUT_PCSPKR=3Dm
> CONFIG_INPUT_MAX77693_HAPTIC=3Dy
> CONFIG_INPUT_MAX8925_ONKEY=3Dy
> CONFIG_INPUT_MAX8997_HAPTIC=3Dm
> # CONFIG_INPUT_MC13783_PWRBUTTON is not set
> CONFIG_INPUT_MMA8450=3Dy
> CONFIG_INPUT_APANEL=3Dy
> CONFIG_INPUT_GP2A=3Dy
> CONFIG_INPUT_GPIO_BEEPER=3Dm
> # CONFIG_INPUT_GPIO_DECODER is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> CONFIG_INPUT_ATI_REMOTE2=3Dm
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dm
> # CONFIG_INPUT_KXTJ9_POLLED_MODE is not set
> CONFIG_INPUT_POWERMATE=3Dm
> # CONFIG_INPUT_YEALINK is not set
> CONFIG_INPUT_CM109=3Dm
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dm
> CONFIG_INPUT_RETU_PWRBUTTON=3Dm
> CONFIG_INPUT_TPS65218_PWRBUTTON=3Dy
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PCF50633_PMU is not set
> CONFIG_INPUT_PCF8574=3Dm
> CONFIG_INPUT_PWM_BEEPER=3Dy
> # CONFIG_INPUT_PWM_VIBRA is not set
> CONFIG_INPUT_RK805_PWRKEY=3Dm
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
> CONFIG_INPUT_DA9052_ONKEY=3Dy
> CONFIG_INPUT_DA9063_ONKEY=3Dm
> CONFIG_INPUT_ADXL34X=3Dy
> # CONFIG_INPUT_ADXL34X_I2C is not set
> CONFIG_INPUT_IMS_PCU=3Dy
> CONFIG_INPUT_CMA3000=3Dm
> CONFIG_INPUT_CMA3000_I2C=3Dm
> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> # CONFIG_INPUT_SOC_BUTTON_ARRAY is not set
> CONFIG_INPUT_DRV260X_HAPTICS=3Dm
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> # CONFIG_INPUT_RAVE_SP_PWRBUTTON is not set
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dm
> CONFIG_RMI4_SMB=3Dm
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> CONFIG_RMI4_F34=3Dy
> CONFIG_RMI4_F54=3Dy
> CONFIG_RMI4_F55=3Dy
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
> # CONFIG_SERIO_RAW is not set
> CONFIG_SERIO_ALTERA_PS2=3Dm
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dm
> # CONFIG_SERIO_APBPS2 is not set
> CONFIG_SERIO_GPIO_PS2=3Dm
> CONFIG_USERIO=3Dm
> CONFIG_GAMEPORT=3Dy
> # CONFIG_GAMEPORT_NS558 is not set
> CONFIG_GAMEPORT_L4=3Dm
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
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
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_ROUTER is not set
> CONFIG_TRACE_SINK=3Dm
> # CONFIG_DEVMEM is not set
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
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> CONFIG_SERIAL_8250_ASPEED_VUART=3Dm
> CONFIG_SERIAL_8250_DW=3Dm
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_8250_MOXA is not set
> CONFIG_SERIAL_OF_PLATFORM=3Dm
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> CONFIG_SERIAL_SCCNXP=3Dm
> CONFIG_SERIAL_SC16IS7XX=3Dm
> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> CONFIG_SERIAL_XILINX_PS_UART=3Dy
> CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dm
> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dm
> CONFIG_SERIAL_MEN_Z135=3Dm
> CONFIG_SERIAL_DEV_BUS=3Dm
> # CONFIG_PRINTER is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dy
> # CONFIG_IPMI_SSIF is not set
> # CONFIG_IPMI_WATCHDOG is not set
> CONFIG_IPMI_POWEROFF=3Dy
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> CONFIG_NVRAM=3Dm
> CONFIG_R3964=3Dm
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_RAW_DRIVER=3Dm
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dm
> # CONFIG_TCG_TPM is not set
> # CONFIG_TELCLOCK is not set
> CONFIG_DEVPORT=3Dy
> CONFIG_XILLYBUS=3Dm
> # CONFIG_XILLYBUS_OF is not set
> # CONFIG_RANDOM_TRUST_CPU is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_GPMUX=3Dm
> # CONFIG_I2C_MUX_LTC4306 is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=3Dy
> CONFIG_I2C_MUX_PINCTRL=3Dy
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_DEMUX_PINCTRL=3Dy
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
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
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_GPIO=3Dm
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dm
> # CONFIG_I2C_RK3X is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> CONFIG_I2C_DLN2=3Dm
> CONFIG_I2C_PARPORT=3Dy
> CONFIG_I2C_PARPORT_LIGHT=3Dm
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> CONFIG_I2C_TAOS_EVM=3Dy
> CONFIG_I2C_TINY_USB=3Dm
> CONFIG_I2C_VIPERBOARD=3Dy
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_MLXCPLD is not set
> CONFIG_I2C_STUB=3Dm
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dm
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> # CONFIG_NTP_PPS is not set
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dm
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
> CONFIG_PTP_1588_CLOCK=3Dy
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_PTP_1588_CLOCK_KVM=3Dy
> CONFIG_PINCTRL=3Dy
> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_AS3722 is not set
> CONFIG_PINCTRL_AMD=3Dm
> CONFIG_PINCTRL_MCP23S08=3Dy
> CONFIG_PINCTRL_SINGLE=3Dm
> CONFIG_PINCTRL_SX150X=3Dy
> CONFIG_PINCTRL_RK805=3Dm
> # CONFIG_PINCTRL_BAYTRAIL is not set
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_BROXTON is not set
> # CONFIG_PINCTRL_CANNONLAKE is not set
> # CONFIG_PINCTRL_CEDARFORK is not set
> # CONFIG_PINCTRL_DENVERTON is not set
> # CONFIG_PINCTRL_GEMINILAKE is not set
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_LEWISBURG is not set
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> CONFIG_PINCTRL_MADERA=3Dy
> CONFIG_PINCTRL_CS47L35=3Dy
> CONFIG_PINCTRL_CS47L90=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=3Dy
> CONFIG_GPIO_ALTERA=3Dm
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dm
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_FTGPIO010 is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> # CONFIG_GPIO_GRGPIO is not set
> CONFIG_GPIO_HLWD=3Dm
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_LYNXPOINT is not set
> CONFIG_GPIO_MB86S7X=3Dy
> # CONFIG_GPIO_MENZ127 is not set
> CONFIG_GPIO_MOCKUP=3Dm
> CONFIG_GPIO_SIOX=3Dy
> # CONFIG_GPIO_SYSCON is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_XILINX is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> CONFIG_GPIO_WINBOND=3Dm
> CONFIG_GPIO_WS16C48=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dm
> # CONFIG_GPIO_ADNP is not set
> CONFIG_GPIO_MAX7300=3Dy
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> # CONFIG_GPIO_PCF857X is not set
> CONFIG_GPIO_TPIC2810=3Dm
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dm
> # CONFIG_GPIO_BD9571MWV is not set
> CONFIG_GPIO_DA9052=3Dy
> CONFIG_GPIO_DLN2=3Dm
> CONFIG_GPIO_MADERA=3Dm
> # CONFIG_GPIO_RC5T583 is not set
> CONFIG_GPIO_TC3589X=3Dy
> # CONFIG_GPIO_TPS65086 is not set
> # CONFIG_GPIO_TPS65218 is not set
> CONFIG_GPIO_TPS65912=3Dm
> CONFIG_GPIO_WM8350=3Dm
> # CONFIG_GPIO_WM8994 is not set
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
> # CONFIG_W1_MASTER_MATROX is not set
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
> # CONFIG_W1_SLAVE_DS2405 is not set
> # CONFIG_W1_SLAVE_DS2408 is not set
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dm
> # CONFIG_W1_SLAVE_DS2423 is not set
> # CONFIG_W1_SLAVE_DS2805 is not set
> CONFIG_W1_SLAVE_DS2431=3Dm
> CONFIG_W1_SLAVE_DS2433=3Dm
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> # CONFIG_W1_SLAVE_DS2438 is not set
> CONFIG_W1_SLAVE_DS2780=3Dm
> CONFIG_W1_SLAVE_DS2781=3Dm
> CONFIG_W1_SLAVE_DS28E04=3Dm
> CONFIG_W1_SLAVE_DS28E17=3Dm
> # CONFIG_POWER_AVS is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_AS3722 is not set
> CONFIG_POWER_RESET_GPIO=3Dy
> # CONFIG_POWER_RESET_GPIO_RESTART is not set
> CONFIG_POWER_RESET_LTC2952=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> # CONFIG_POWER_RESET_SYSCON is not set
> # CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
> # CONFIG_SYSCON_REBOOT_MODE is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> CONFIG_PDA_POWER=3Dm
> CONFIG_GENERIC_ADC_BATTERY=3Dm
> # CONFIG_MAX8925_POWER is not set
> CONFIG_WM8350_POWER=3Dm
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> CONFIG_BATTERY_LEGO_EV3=3Dy
> CONFIG_BATTERY_SBS=3Dm
> # CONFIG_CHARGER_SBS is not set
> CONFIG_MANAGER_SBS=3Dm
> CONFIG_BATTERY_BQ27XXX=3Dm
> CONFIG_BATTERY_BQ27XXX_I2C=3Dm
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dm
> CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=3Dy
> # CONFIG_BATTERY_DA9030 is not set
> CONFIG_BATTERY_DA9052=3Dy
> CONFIG_CHARGER_DA9150=3Dm
> CONFIG_BATTERY_DA9150=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> # CONFIG_BATTERY_MAX1721X is not set
> CONFIG_CHARGER_PCF50633=3Dm
> CONFIG_CHARGER_ISP1704=3Dm
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_LTC3651=3Dm
> CONFIG_CHARGER_DETECTOR_MAX14656=3Dm
> CONFIG_CHARGER_MAX77693=3Dy
> CONFIG_CHARGER_MAX8997=3Dm
> CONFIG_CHARGER_BQ2415X=3Dm
> CONFIG_CHARGER_BQ24190=3Dm
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ25890=3Dm
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_CHARGER_TPS65217=3Dm
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_RT5033=3Dy
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> CONFIG_SENSORS_ABITUGURU3=3Dm
> CONFIG_SENSORS_AD7414=3Dy
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dm
> # CONFIG_SENSORS_ADM1026 is not set
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dy
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dm
> # CONFIG_SENSORS_ASB100 is not set
> CONFIG_SENSORS_ASPEED=3Dy
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> # CONFIG_SENSORS_DA9052_ADC is not set
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_MC13783_ADC=3Dm
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_FTSTEUTATES=3Dy
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> # CONFIG_SENSORS_G760A is not set
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_GPIO_FAN=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dy
> # CONFIG_SENSORS_IIO_HWMON is not set
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dm
> CONFIG_SENSORS_IT87=3Dm
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dm
> # CONFIG_SENSORS_LINEAGE is not set
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2990 is not set
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dm
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dy
> CONFIG_SENSORS_MAX6621=3Dm
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dm
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=3Dm
> CONFIG_SENSORS_MLXREG_FAN=3Dy
> CONFIG_SENSORS_TC654=3Dm
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> # CONFIG_SENSORS_LM63 is not set
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dm
> # CONFIG_SENSORS_LM77 is not set
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dy
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dm
> # CONFIG_SENSORS_LM95234 is not set
> # CONFIG_SENSORS_LM95241 is not set
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NCT7904 is not set
> CONFIG_SENSORS_NPCM7XX=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dm
> # CONFIG_SENSORS_PMBUS is not set
> # CONFIG_SENSORS_ADM1275 is not set
> # CONFIG_SENSORS_IBM_CFFPS is not set
> # CONFIG_SENSORS_IR35221 is not set
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX16064=3Dm
> CONFIG_SENSORS_MAX20751=3Dm
> CONFIG_SENSORS_MAX31785=3Dm
> CONFIG_SENSORS_MAX34440=3Dm
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_TPS40422=3Dm
> CONFIG_SENSORS_TPS53679=3Dm
> CONFIG_SENSORS_UCD9000=3Dm
> # CONFIG_SENSORS_UCD9200 is not set
> CONFIG_SENSORS_ZL6100=3Dm
> CONFIG_SENSORS_PWM_FAN=3Dy
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHT3x=3Dm
> CONFIG_SENSORS_SHTC1=3Dm
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dm
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dm
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dm
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=3Dm
> # CONFIG_SENSORS_SCH5627 is not set
> # CONFIG_SENSORS_SCH5636 is not set
> # CONFIG_SENSORS_STTS751 is not set
> CONFIG_SENSORS_SMM665=3Dm
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS1015=3Dm
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dm
> CONFIG_SENSORS_INA3221=3Dy
> CONFIG_SENSORS_TC74=3Dy
> CONFIG_SENSORS_THMC50=3Dy
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP103=3Dy
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dm
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=3Dy
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dm
> # CONFIG_SENSORS_W83627EHF is not set
> CONFIG_SENSORS_WM8350=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_STATISTICS=3Dy
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_OF=3Dy
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> # CONFIG_CLOCK_THERMAL is not set
> CONFIG_DEVFREQ_THERMAL=3Dy
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_QORIQ_THERMAL=3Dy
> CONFIG_DA9062_THERMAL=3Dm
> CONFIG_INTEL_POWERCLAMP=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
> CONFIG_QCOM_SPMI_TEMP_ALARM=3Dm
> # CONFIG_GENERIC_ADC_THERMAL is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> CONFIG_WATCHDOG_SYSFS=3Dy
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dm
> # CONFIG_DA9052_WATCHDOG is not set
> # CONFIG_DA9062_WATCHDOG is not set
> CONFIG_GPIO_WATCHDOG=3Dy
> # CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
> CONFIG_MENF21BMC_WATCHDOG=3Dm
> CONFIG_MENZ069_WATCHDOG=3Dy
> # CONFIG_WDAT_WDT is not set
> # CONFIG_WM8350_WATCHDOG is not set
> # CONFIG_XILINX_WATCHDOG is not set
> CONFIG_ZIIRAVE_WATCHDOG=3Dm
> CONFIG_RAVE_SP_WATCHDOG=3Dm
> CONFIG_CADENCE_WATCHDOG=3Dy
> # CONFIG_DW_WATCHDOG is not set
> CONFIG_MAX63XX_WATCHDOG=3Dm
> CONFIG_RETU_WATCHDOG=3Dy
> CONFIG_ACQUIRE_WDT=3Dm
> # CONFIG_ADVANTECH_WDT is not set
> # CONFIG_ALIM1535_WDT is not set
> # CONFIG_ALIM7101_WDT is not set
> CONFIG_EBC_C384_WDT=3Dm
> CONFIG_F71808E_WDT=3Dm
> # CONFIG_SP5100_TCO is not set
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> # CONFIG_IB700_WDT is not set
> CONFIG_IBMASR=3Dy
> # CONFIG_WAFER_WDT is not set
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_IE6XX_WDT is not set
> # CONFIG_ITCO_WDT is not set
> CONFIG_IT8712F_WDT=3Dm
> # CONFIG_IT87_WDT is not set
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_SC1200_WDT=3Dy
> CONFIG_PC87413_WDT=3Dy
> # CONFIG_NV_TCO is not set
> CONFIG_60XX_WDT=3Dy
> CONFIG_CPU5_WDT=3Dy
> CONFIG_SMSC_SCH311X_WDT=3Dm
> CONFIG_SMSC37B787_WDT=3Dy
> # CONFIG_VIA_WDT is not set
> # CONFIG_W83627HF_WDT is not set
> CONFIG_W83877F_WDT=3Dm
> # CONFIG_W83977F_WDT is not set
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
> CONFIG_USBPCWATCHDOG=3Dy
> =

> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> CONFIG_SSB_POSSIBLE=3Dy
> CONFIG_SSB=3Dm
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> CONFIG_SSB_SDIOHOST=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dm
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> CONFIG_BCMA_DEBUG=3Dy
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_ACT8945A is not set
> CONFIG_MFD_AS3711=3Dy
> CONFIG_MFD_AS3722=3Dy
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_AT91_USART is not set
> CONFIG_MFD_ATMEL_FLEXCOM=3Dm
> CONFIG_MFD_ATMEL_HLCDC=3Dm
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dy
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_CROS_EC is not set
> CONFIG_MFD_MADERA=3Dy
> # CONFIG_MFD_MADERA_I2C is not set
> CONFIG_MFD_CS47L35=3Dy
> # CONFIG_MFD_CS47L85 is not set
> CONFIG_MFD_CS47L90=3Dy
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9062=3Dy
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_DLN2=3Dm
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_MFD_HI6421_PMIC=3Dm
> # CONFIG_HTC_PASIC3 is not set
> CONFIG_HTC_I2CPLD=3Dy
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> CONFIG_MFD_88PM800=3Dm
> CONFIG_MFD_88PM805=3Dm
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77620 is not set
> CONFIG_MFD_MAX77686=3Dm
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_VIPERBOARD=3Dy
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dm
> CONFIG_PCF50633_ADC=3Dm
> CONFIG_PCF50633_GPIO=3Dm
> # CONFIG_MFD_RDC321X is not set
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_RK808=3Dm
> # CONFIG_MFD_RN5T618 is not set
> CONFIG_MFD_SEC_CORE=3Dm
> CONFIG_MFD_SI476X_CORE=3Dm
> # CONFIG_MFD_SM501 is not set
> # CONFIG_MFD_SKY81452 is not set
> CONFIG_MFD_SMSC=3Dy
> # CONFIG_ABX500_CORE is not set
> # CONFIG_MFD_STMPE is not set
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_LP8788=3Dy
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dm
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dm
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dm
> # CONFIG_MFD_TPS68470 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TI_LP87565 is not set
> CONFIG_MFD_TPS65218=3Dy
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dm
> CONFIG_MFD_TPS65912_I2C=3Dm
> CONFIG_MFD_TPS80031=3Dy
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> CONFIG_MFD_TC3589X=3Dy
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_CS47L24=3Dy
> CONFIG_MFD_WM5102=3Dy
> CONFIG_MFD_WM5110=3Dy
> CONFIG_MFD_WM8997=3Dy
> # CONFIG_MFD_WM8998 is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> CONFIG_MFD_ROHM_BD718XX=3Dm
> CONFIG_RAVE_SP_CORE=3Dm
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dm
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dm
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dm
> # CONFIG_REGULATOR_88PG86X is not set
> CONFIG_REGULATOR_88PM800=3Dm
> CONFIG_REGULATOR_ACT8865=3Dy
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_ANATOP=3Dm
> # CONFIG_REGULATOR_AS3711 is not set
> CONFIG_REGULATOR_AS3722=3Dm
> # CONFIG_REGULATOR_BCM590XX is not set
> CONFIG_REGULATOR_BD718XX=3Dm
> # CONFIG_REGULATOR_BD9571MWV is not set
> # CONFIG_REGULATOR_DA903X is not set
> # CONFIG_REGULATOR_DA9052 is not set
> CONFIG_REGULATOR_DA9062=3Dm
> CONFIG_REGULATOR_DA9210=3Dm
> # CONFIG_REGULATOR_DA9211 is not set
> CONFIG_REGULATOR_FAN53555=3Dm
> CONFIG_REGULATOR_GPIO=3Dm
> # CONFIG_REGULATOR_HI6421 is not set
> # CONFIG_REGULATOR_HI6421V530 is not set
> # CONFIG_REGULATOR_ISL9305 is not set
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dm
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LP8788=3Dm
> CONFIG_REGULATOR_LTC3589=3Dy
> CONFIG_REGULATOR_LTC3676=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8907=3Dm
> CONFIG_REGULATOR_MAX8925=3Dm
> # CONFIG_REGULATOR_MAX8952 is not set
> # CONFIG_REGULATOR_MAX8973 is not set
> CONFIG_REGULATOR_MAX8997=3Dm
> # CONFIG_REGULATOR_MAX77686 is not set
> # CONFIG_REGULATOR_MAX77693 is not set
> CONFIG_REGULATOR_MAX77802=3Dm
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> CONFIG_REGULATOR_MC13783=3Dm
> # CONFIG_REGULATOR_MC13892 is not set
> CONFIG_REGULATOR_MT6311=3Dy
> CONFIG_REGULATOR_PCF50633=3Dm
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dy
> # CONFIG_REGULATOR_PV88080 is not set
> # CONFIG_REGULATOR_PV88090 is not set
> CONFIG_REGULATOR_PWM=3Dy
> CONFIG_REGULATOR_QCOM_SPMI=3Dm
> # CONFIG_REGULATOR_RC5T583 is not set
> CONFIG_REGULATOR_RK808=3Dm
> CONFIG_REGULATOR_RT5033=3Dm
> # CONFIG_REGULATOR_S2MPA01 is not set
> CONFIG_REGULATOR_S2MPS11=3Dm
> # CONFIG_REGULATOR_S5M8767 is not set
> CONFIG_REGULATOR_SY8106A=3Dm
> CONFIG_REGULATOR_TPS51632=3Dm
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dm
> CONFIG_REGULATOR_TPS6507X=3Dm
> CONFIG_REGULATOR_TPS65086=3Dm
> CONFIG_REGULATOR_TPS65132=3Dm
> CONFIG_REGULATOR_TPS65217=3Dm
> CONFIG_REGULATOR_TPS65218=3Dy
> CONFIG_REGULATOR_TPS65912=3Dm
> CONFIG_REGULATOR_TPS80031=3Dm
> CONFIG_REGULATOR_VCTRL=3Dy
> # CONFIG_REGULATOR_WM8350 is not set
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dy
> # CONFIG_LIRC is not set
> # CONFIG_RC_DECODERS is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=3Dm
> CONFIG_IR_HIX5HD2=3Dm
> CONFIG_IR_IMON=3Dm
> CONFIG_IR_IMON_RAW=3Dm
> CONFIG_IR_MCEUSB=3Dm
> CONFIG_IR_ITE_CIR=3Dy
> CONFIG_IR_FINTEK=3Dm
> # CONFIG_IR_NUVOTON is not set
> CONFIG_IR_REDRAT3=3Dm
> CONFIG_IR_STREAMZAP=3Dy
> CONFIG_IR_WINBOND_CIR=3Dy
> # CONFIG_IR_IGORPLUGUSB is not set
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> CONFIG_RC_LOOPBACK=3Dy
> CONFIG_IR_GPIO_CIR=3Dy
> CONFIG_IR_SERIAL=3Dy
> CONFIG_IR_SERIAL_TRANSMITTER=3Dy
> # CONFIG_IR_SIR is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> # CONFIG_MEDIA_CONTROLLER is not set
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_VIDEO_V4L2=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> CONFIG_VIDEO_TUNER=3Dy
> CONFIG_VIDEOBUF_GEN=3Dy
> CONFIG_VIDEOBUF_VMALLOC=3Dy
> CONFIG_DVB_CORE=3Dy
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> CONFIG_TTPCI_EEPROM=3Dm
> CONFIG_DVB_MAX_ADAPTERS=3D16
> # CONFIG_DVB_DYNAMIC_MINORS is not set
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> CONFIG_DVB_ULE_DEBUG=3Dy
> =

> #
> # Media drivers
> #
> CONFIG_MEDIA_USB_SUPPORT=3Dy
> =

> #
> # Analog/digital TV USB devices
> #
> CONFIG_VIDEO_AU0828=3Dm
> CONFIG_VIDEO_AU0828_V4L2=3Dy
> # CONFIG_VIDEO_AU0828_RC is not set
> # CONFIG_VIDEO_CX231XX is not set
> CONFIG_VIDEO_TM6000=3Dy
> CONFIG_VIDEO_TM6000_DVB=3Dm
> =

> #
> # Digital TV USB devices
> #
> CONFIG_DVB_USB=3Dy
> CONFIG_DVB_USB_DEBUG=3Dy
> CONFIG_DVB_USB_DIB3000MC=3Dy
> CONFIG_DVB_USB_A800=3Dy
> CONFIG_DVB_USB_DIBUSB_MB=3Dy
> # CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
> CONFIG_DVB_USB_DIBUSB_MC=3Dm
> CONFIG_DVB_USB_DIB0700=3Dy
> CONFIG_DVB_USB_UMT_010=3Dy
> CONFIG_DVB_USB_CXUSB=3Dm
> CONFIG_DVB_USB_M920X=3Dm
> # CONFIG_DVB_USB_DIGITV is not set
> CONFIG_DVB_USB_VP7045=3Dm
> CONFIG_DVB_USB_VP702X=3Dy
> # CONFIG_DVB_USB_GP8PSK is not set
> CONFIG_DVB_USB_NOVA_T_USB2=3Dy
> CONFIG_DVB_USB_TTUSB2=3Dm
> # CONFIG_DVB_USB_DTT200U is not set
> CONFIG_DVB_USB_OPERA1=3Dy
> CONFIG_DVB_USB_AF9005=3Dm
> # CONFIG_DVB_USB_AF9005_REMOTE is not set
> CONFIG_DVB_USB_PCTV452E=3Dm
> CONFIG_DVB_USB_DW2102=3Dm
> CONFIG_DVB_USB_CINERGY_T2=3Dy
> CONFIG_DVB_USB_DTV5100=3Dm
> CONFIG_DVB_USB_AZ6027=3Dy
> CONFIG_DVB_USB_TECHNISAT_USB2=3Dm
> CONFIG_DVB_USB_V2=3Dy
> CONFIG_DVB_USB_AF9015=3Dy
> CONFIG_DVB_USB_AF9035=3Dy
> CONFIG_DVB_USB_ANYSEE=3Dy
> CONFIG_DVB_USB_AU6610=3Dy
> CONFIG_DVB_USB_AZ6007=3Dm
> CONFIG_DVB_USB_CE6230=3Dm
> # CONFIG_DVB_USB_EC168 is not set
> # CONFIG_DVB_USB_GL861 is not set
> CONFIG_DVB_USB_LME2510=3Dm
> CONFIG_DVB_USB_MXL111SF=3Dy
> CONFIG_DVB_USB_RTL28XXU=3Dy
> CONFIG_DVB_USB_DVBSKY=3Dm
> CONFIG_DVB_USB_ZD1301=3Dy
> # CONFIG_DVB_TTUSB_BUDGET is not set
> # CONFIG_DVB_TTUSB_DEC is not set
> CONFIG_SMS_USB_DRV=3Dm
> CONFIG_DVB_B2C2_FLEXCOP_USB=3Dm
> # CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
> CONFIG_DVB_AS102=3Dm
> =

> #
> # Webcam, TV (analog/digital) USB devices
> #
> # CONFIG_VIDEO_EM28XX is not set
> =

> #
> # Software defined radio USB devices
> #
> CONFIG_USB_AIRSPY=3Dy
> CONFIG_USB_HACKRF=3Dy
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> CONFIG_SDR_PLATFORM_DRIVERS=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_SMS_SDIO_DRV=3Dm
> =

> #
> # Supported FireWire (IEEE 1394) Adapters
> #
> CONFIG_DVB_FIREDTV=3Dy
> CONFIG_DVB_FIREDTV_INPUT=3Dy
> CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> =

> #
> # common driver options
> #
> CONFIG_VIDEO_TVEEPROM=3Dy
> CONFIG_CYPRESS_FIRMWARE=3Dy
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_V4L2=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> CONFIG_DVB_B2C2_FLEXCOP=3Dm
> CONFIG_SMS_SIANO_MDTV=3Dm
> CONFIG_SMS_SIANO_RC=3Dy
> # CONFIG_SMS_SIANO_DEBUGFS is not set
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dy
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
> CONFIG_MEDIA_TUNER=3Dy
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA18250=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
> CONFIG_MEDIA_TUNER_MT2063=3Dm
> CONFIG_MEDIA_TUNER_MT2266=3Dy
> CONFIG_MEDIA_TUNER_QT1010=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> CONFIG_MEDIA_TUNER_MXL5007T=3Dy
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> CONFIG_MEDIA_TUNER_TDA18218=3Dy
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> CONFIG_MEDIA_TUNER_FC0012=3Dy
> CONFIG_MEDIA_TUNER_FC0013=3Dy
> CONFIG_MEDIA_TUNER_TDA18212=3Dy
> CONFIG_MEDIA_TUNER_E4000=3Dy
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> CONFIG_MEDIA_TUNER_TUA9001=3Dy
> CONFIG_MEDIA_TUNER_SI2157=3Dy
> CONFIG_MEDIA_TUNER_IT913X=3Dy
> CONFIG_MEDIA_TUNER_R820T=3Dy
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dy
> CONFIG_DVB_STB6100=3Dy
> CONFIG_DVB_STV090x=3Dm
> CONFIG_DVB_STV6110x=3Dm
> CONFIG_DVB_M88DS3103=3Dm
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dm
> CONFIG_DVB_MN88472=3Dy
> CONFIG_DVB_MN88473=3Dy
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24123=3Dm
> CONFIG_DVB_MT312=3Dm
> CONFIG_DVB_ZL10039=3Dm
> CONFIG_DVB_S5H1420=3Dm
> CONFIG_DVB_STV0288=3Dm
> CONFIG_DVB_STB6000=3Dm
> CONFIG_DVB_STV0299=3Dy
> CONFIG_DVB_STV6110=3Dy
> CONFIG_DVB_STV0900=3Dy
> CONFIG_DVB_TDA10086=3Dm
> CONFIG_DVB_TUNER_ITD1000=3Dm
> CONFIG_DVB_TUNER_CX24113=3Dm
> CONFIG_DVB_TDA826X=3Dm
> CONFIG_DVB_CX24116=3Dy
> CONFIG_DVB_CX24120=3Dm
> CONFIG_DVB_SI21XX=3Dm
> CONFIG_DVB_TS2020=3Dm
> CONFIG_DVB_DS3000=3Dm
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_CX22702=3Dm
> CONFIG_DVB_TDA1004X=3Dm
> CONFIG_DVB_MT352=3Dy
> CONFIG_DVB_ZL10353=3Dy
> CONFIG_DVB_DIB3000MB=3Dy
> CONFIG_DVB_DIB3000MC=3Dy
> CONFIG_DVB_DIB7000M=3Dy
> CONFIG_DVB_DIB7000P=3Dy
> CONFIG_DVB_TDA10048=3Dm
> CONFIG_DVB_AF9013=3Dy
> CONFIG_DVB_CXD2820R=3Dy
> CONFIG_DVB_RTL2830=3Dy
> CONFIG_DVB_RTL2832=3Dy
> CONFIG_DVB_RTL2832_SDR=3Dy
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_AS102_FE=3Dm
> CONFIG_DVB_ZD1301_DEMOD=3Dy
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_TDA10023=3Dy
> CONFIG_DVB_STV0297=3Dm
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dm
> CONFIG_DVB_BCM3510=3Dm
> CONFIG_DVB_LGDT330X=3Dm
> CONFIG_DVB_LGDT3305=3Dy
> CONFIG_DVB_LG2160=3Dy
> CONFIG_DVB_AU8522=3Dm
> CONFIG_DVB_AU8522_DTV=3Dm
> CONFIG_DVB_AU8522_V4L=3Dm
> CONFIG_DVB_S5H1411=3Dy
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_DIB8000=3Dy
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dy
> CONFIG_DVB_TUNER_DIB0070=3Dy
> CONFIG_DVB_TUNER_DIB0090=3Dy
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_LNBP21=3Dm
> CONFIG_DVB_LNBP22=3Dm
> CONFIG_DVB_ISL6421=3Dm
> CONFIG_DVB_ISL6423=3Dy
> CONFIG_DVB_LGS8GXX=3Dm
> CONFIG_DVB_ATBM8830=3Dm
> CONFIG_DVB_IX2505V=3Dm
> CONFIG_DVB_M88RS2000=3Dm
> CONFIG_DVB_AF9033=3Dy
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_SP2=3Dm
> =

> #
> # Tools to develop new frontends
> #
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> # CONFIG_DRM is not set
> # CONFIG_DRM_DP_CEC is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> =

> #
> # AMD Library routines
> #
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> CONFIG_FIRMWARE_EDID=3Dy
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
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> CONFIG_FB_ARC=3Dm
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_VESA is not set
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> # CONFIG_FB_OPENCORES is not set
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
> # CONFIG_FB_SMSCUFX is not set
> CONFIG_FB_UDL=3Dy
> CONFIG_FB_IBM_GXT4500=3Dm
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_SIMPLE=3Dy
> # CONFIG_FB_SSD1307 is not set
> # CONFIG_FB_SM712 is not set
> # CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> CONFIG_VGACON_SOFT_SCROLLBACK=3Dy
> CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=3D64
> CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT=3Dy
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> CONFIG_LOGO_LINUX_VGA16=3Dy
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dm
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dm
> CONFIG_HID_GENERIC=3Dm
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> CONFIG_HID_ACRUX=3Dm
> CONFIG_HID_ACRUX_FF=3Dy
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_ASUS is not set
> CONFIG_HID_AUREAL=3Dm
> # CONFIG_HID_BELKIN is not set
> CONFIG_HID_CHERRY=3Dm
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_CORSAIR is not set
> CONFIG_HID_COUGAR=3Dm
> CONFIG_HID_CMEDIA=3Dm
> # CONFIG_HID_CYPRESS is not set
> CONFIG_HID_DRAGONRISE=3Dm
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> CONFIG_HID_ELECOM=3Dm
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dm
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> CONFIG_HID_WALTOP=3Dm
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=3Dm
> CONFIG_HID_ITE=3Dm
> # CONFIG_HID_JABRA is not set
> CONFIG_HID_TWINHAN=3Dm
> CONFIG_HID_KENSINGTON=3Dm
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dm
> CONFIG_HID_LENOVO=3Dm
> CONFIG_HID_LOGITECH=3Dm
> # CONFIG_HID_LOGITECH_DJ is not set
> CONFIG_HID_LOGITECH_HIDPP=3Dm
> # CONFIG_LOGITECH_FF is not set
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> CONFIG_LOGIWHEELS_FF=3Dy
> CONFIG_HID_MAGICMOUSE=3Dm
> CONFIG_HID_MAYFLASH=3Dm
> CONFIG_HID_REDRAGON=3Dm
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> CONFIG_HID_MULTITOUCH=3Dm
> CONFIG_HID_NTI=3Dm
> # CONFIG_HID_ORTEK is not set
> CONFIG_HID_PANTHERLORD=3Dm
> CONFIG_PANTHERLORD_FF=3Dy
> CONFIG_HID_PETALYNX=3Dm
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> # CONFIG_HID_PRIMAX is not set
> CONFIG_HID_SAITEK=3Dm
> # CONFIG_HID_SAMSUNG is not set
> # CONFIG_HID_SPEEDLINK is not set
> CONFIG_HID_STEAM=3Dm
> CONFIG_HID_STEELSERIES=3Dm
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
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dm
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> =

> #
> # USB HID support
> #
> # CONFIG_USB_HID is not set
> # CONFIG_HID_PID is not set
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
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
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> # CONFIG_USB_OTG_WHITELIST is not set
> CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dm
> CONFIG_USB_MON=3Dm
> CONFIG_USB_WUSB=3Dm
> CONFIG_USB_WUSB_CBAF=3Dy
> CONFIG_USB_WUSB_CBAF_DEBUG=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> # CONFIG_USB_XHCI_HCD is not set
> CONFIG_USB_EHCI_HCD=3Dm
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> CONFIG_USB_EHCI_PCI=3Dm
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dm
> # CONFIG_USB_OXU210HP_HCD is not set
> CONFIG_USB_ISP116X_HCD=3Dm
> CONFIG_USB_FOTG210_HCD=3Dy
> # CONFIG_USB_OHCI_HCD is not set
> # CONFIG_USB_UHCI_HCD is not set
> CONFIG_USB_SL811_HCD=3Dy
> CONFIG_USB_SL811_HCD_ISO=3Dy
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_WHCI_HCD is not set
> CONFIG_USB_HWA_HCD=3Dm
> CONFIG_USB_HCD_BCMA=3Dm
> CONFIG_USB_HCD_SSB=3Dm
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dm
> CONFIG_USB_PRINTER=3Dm
> CONFIG_USB_WDM=3Dy
> CONFIG_USB_TMC=3Dy
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=3Dy
> # CONFIG_USB_STORAGE_DEBUG is not set
> CONFIG_USB_STORAGE_REALTEK=3Dm
> # CONFIG_USB_STORAGE_DATAFAB is not set
> CONFIG_USB_STORAGE_FREECOM=3Dm
> CONFIG_USB_STORAGE_ISD200=3Dm
> CONFIG_USB_STORAGE_USBAT=3Dm
> # CONFIG_USB_STORAGE_SDDR09 is not set
> CONFIG_USB_STORAGE_SDDR55=3Dm
> CONFIG_USB_STORAGE_JUMPSHOT=3Dy
> CONFIG_USB_STORAGE_ALAUDA=3Dm
> # CONFIG_USB_STORAGE_ONETOUCH is not set
> # CONFIG_USB_STORAGE_KARMA is not set
> CONFIG_USB_STORAGE_CYPRESS_ATACB=3Dm
> CONFIG_USB_STORAGE_ENE_UB6250=3Dm
> CONFIG_USB_UAS=3Dy
> =

> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=3Dm
> CONFIG_USB_MICROTEK=3Dm
> # CONFIG_USBIP_CORE is not set
> CONFIG_USB_MUSB_HDRC=3Dm
> CONFIG_USB_MUSB_HOST=3Dy
> # CONFIG_USB_MUSB_GADGET is not set
> # CONFIG_USB_MUSB_DUAL_ROLE is not set
> =

> #
> # Platform Glue Layer
> #
> =

> #
> # MUSB DMA mode
> #
> CONFIG_MUSB_PIO_ONLY=3Dy
> CONFIG_USB_DWC3=3Dy
> CONFIG_USB_DWC3_HOST=3Dy
> =

> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_PCI=3Dy
> CONFIG_USB_DWC3_HAPS=3Dy
> CONFIG_USB_DWC3_OF_SIMPLE=3Dy
> # CONFIG_USB_DWC2 is not set
> CONFIG_USB_CHIPIDEA=3Dm
> CONFIG_USB_CHIPIDEA_OF=3Dm
> CONFIG_USB_CHIPIDEA_PCI=3Dm
> # CONFIG_USB_CHIPIDEA_UDC is not set
> CONFIG_USB_CHIPIDEA_HOST=3Dy
> CONFIG_USB_ISP1760=3Dy
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1760_HOST_ROLE=3Dy
> =

> #
> # USB port drivers
> #
> CONFIG_USB_USS720=3Dy
> CONFIG_USB_SERIAL=3Dy
> # CONFIG_USB_SERIAL_CONSOLE is not set
> # CONFIG_USB_SERIAL_GENERIC is not set
> # CONFIG_USB_SERIAL_SIMPLE is not set
> CONFIG_USB_SERIAL_AIRCABLE=3Dy
> CONFIG_USB_SERIAL_ARK3116=3Dm
> # CONFIG_USB_SERIAL_BELKIN is not set
> CONFIG_USB_SERIAL_CH341=3Dy
> CONFIG_USB_SERIAL_WHITEHEAT=3Dm
> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> # CONFIG_USB_SERIAL_CP210X is not set
> CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
> CONFIG_USB_SERIAL_EMPEG=3Dy
> CONFIG_USB_SERIAL_FTDI_SIO=3Dy
> # CONFIG_USB_SERIAL_VISOR is not set
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> CONFIG_USB_SERIAL_EDGEPORT=3Dy
> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> # CONFIG_USB_SERIAL_F81232 is not set
> CONFIG_USB_SERIAL_F8153X=3Dy
> CONFIG_USB_SERIAL_GARMIN=3Dy
> # CONFIG_USB_SERIAL_IPW is not set
> # CONFIG_USB_SERIAL_IUU is not set
> CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
> CONFIG_USB_SERIAL_KEYSPAN=3Dy
> CONFIG_USB_SERIAL_KLSI=3Dy
> CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
> CONFIG_USB_SERIAL_MCT_U232=3Dm
> CONFIG_USB_SERIAL_METRO=3Dm
> CONFIG_USB_SERIAL_MOS7720=3Dm
> CONFIG_USB_SERIAL_MOS7715_PARPORT=3Dy
> # CONFIG_USB_SERIAL_MOS7840 is not set
> CONFIG_USB_SERIAL_MXUPORT=3Dm
> CONFIG_USB_SERIAL_NAVMAN=3Dy
> CONFIG_USB_SERIAL_PL2303=3Dm
> CONFIG_USB_SERIAL_OTI6858=3Dy
> CONFIG_USB_SERIAL_QCAUX=3Dm
> CONFIG_USB_SERIAL_QUALCOMM=3Dm
> CONFIG_USB_SERIAL_SPCP8X5=3Dy
> CONFIG_USB_SERIAL_SAFE=3Dy
> # CONFIG_USB_SERIAL_SAFE_PADDED is not set
> CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
> CONFIG_USB_SERIAL_SYMBOL=3Dy
> # CONFIG_USB_SERIAL_TI is not set
> CONFIG_USB_SERIAL_CYBERJACK=3Dy
> CONFIG_USB_SERIAL_XIRCOM=3Dm
> CONFIG_USB_SERIAL_WWAN=3Dy
> CONFIG_USB_SERIAL_OPTION=3Dy
> CONFIG_USB_SERIAL_OMNINET=3Dy
> # CONFIG_USB_SERIAL_OPTICON is not set
> CONFIG_USB_SERIAL_XSENS_MT=3Dy
> # CONFIG_USB_SERIAL_WISHBONE is not set
> CONFIG_USB_SERIAL_SSU100=3Dm
> # CONFIG_USB_SERIAL_QT2 is not set
> CONFIG_USB_SERIAL_UPD78F0730=3Dm
> # CONFIG_USB_SERIAL_DEBUG is not set
> =

> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dy
> CONFIG_USB_EMI26=3Dy
> CONFIG_USB_ADUTUX=3Dy
> # CONFIG_USB_SEVSEG is not set
> CONFIG_USB_RIO500=3Dm
> # CONFIG_USB_LEGOTOWER is not set
> CONFIG_USB_LCD=3Dm
> CONFIG_USB_CYPRESS_CY7C63=3Dm
> CONFIG_USB_CYTHERM=3Dy
> CONFIG_USB_IDMOUSE=3Dy
> # CONFIG_USB_FTDI_ELAN is not set
> # CONFIG_USB_APPLEDISPLAY is not set
> CONFIG_USB_SISUSBVGA=3Dm
> # CONFIG_USB_SISUSBVGA_CON is not set
> CONFIG_USB_LD=3Dm
> CONFIG_USB_TRANCEVIBRATOR=3Dy
> CONFIG_USB_IOWARRIOR=3Dy
> # CONFIG_USB_TEST is not set
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dm
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> CONFIG_USB_EZUSB_FX2=3Dy
> # CONFIG_USB_HUB_USB251XB is not set
> # CONFIG_USB_HSIC_USB3503 is not set
> CONFIG_USB_HSIC_USB4604=3Dm
> # CONFIG_USB_LINK_LAYER_TEST is not set
> # CONFIG_USB_CHAOSKEY is not set
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dm
> CONFIG_USB_GPIO_VBUS=3Dm
> # CONFIG_TAHVO_USB is not set
> CONFIG_USB_ISP1301=3Dm
> CONFIG_USB_GADGET=3Dm
> # CONFIG_USB_GADGET_DEBUG is not set
> CONFIG_USB_GADGET_DEBUG_FILES=3Dy
> # CONFIG_USB_GADGET_DEBUG_FS is not set
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> =

> #
> # USB Peripheral Controller
> #
> CONFIG_USB_FOTG210_UDC=3Dm
> # CONFIG_USB_GR_UDC is not set
> CONFIG_USB_R8A66597=3Dm
> # CONFIG_USB_PXA27X is not set
> CONFIG_USB_MV_UDC=3Dm
> CONFIG_USB_MV_U3D=3Dm
> CONFIG_USB_SNP_CORE=3Dm
> CONFIG_USB_SNP_UDC_PLAT=3Dm
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
> CONFIG_USB_GADGET_XILINX=3Dm
> CONFIG_USB_DUMMY_HCD=3Dm
> # CONFIG_USB_CONFIGFS is not set
> CONFIG_TYPEC=3Dy
> CONFIG_TYPEC_TCPM=3Dm
> CONFIG_TYPEC_TCPCI=3Dm
> CONFIG_TYPEC_RT1711H=3Dm
> CONFIG_TYPEC_FUSB302=3Dm
> CONFIG_TYPEC_UCSI=3Dy
> CONFIG_UCSI_CCG=3Dy
> # CONFIG_UCSI_ACPI is not set
> CONFIG_TYPEC_TPS6598X=3Dm
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> CONFIG_TYPEC_MUX_PI3USB30532=3Dm
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> CONFIG_TYPEC_DP_ALTMODE=3Dm
> # CONFIG_USB_ROLES_INTEL_XHCI is not set
> CONFIG_USB_LED_TRIG=3Dy
> CONFIG_USB_ULPI_BUS=3Dm
> CONFIG_USB_ROLE_SWITCH=3Dm
> CONFIG_UWB=3Dm
> CONFIG_UWB_HWA=3Dm
> # CONFIG_UWB_WHCI is not set
> CONFIG_UWB_I1480U=3Dm
> CONFIG_MMC=3Dm
> CONFIG_PWRSEQ_EMMC=3Dm
> CONFIG_PWRSEQ_SIMPLE=3Dm
> CONFIG_MMC_BLOCK=3Dm
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_SDIO_UART=3Dm
> CONFIG_MMC_TEST=3Dm
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_SDHCI is not set
> CONFIG_MMC_WBSD=3Dm
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_VUB300=3Dm
> CONFIG_MMC_USHC=3Dm
> # CONFIG_MMC_USDHI6ROL0 is not set
> CONFIG_MMC_REALTEK_USB=3Dm
> CONFIG_MMC_CQHCI=3Dm
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> # CONFIG_MSPRO_BLOCK is not set
> CONFIG_MS_BLOCK=3Dm
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
> CONFIG_LEDS_CLASS_FLASH=3Dy
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_AAT1290=3Dm
> # CONFIG_LEDS_AN30259A is not set
> # CONFIG_LEDS_APU is not set
> CONFIG_LEDS_AS3645A=3Dy
> CONFIG_LEDS_BCM6328=3Dm
> CONFIG_LEDS_BCM6358=3Dy
> # CONFIG_LEDS_LM3530 is not set
> # CONFIG_LEDS_LM3642 is not set
> # CONFIG_LEDS_LM3692X is not set
> CONFIG_LEDS_LM3601X=3Dm
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dm
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dm
> CONFIG_LEDS_LP5523=3Dy
> # CONFIG_LEDS_LP5562 is not set
> # CONFIG_LEDS_LP8501 is not set
> CONFIG_LEDS_LP8788=3Dy
> CONFIG_LEDS_LP8860=3Dm
> # CONFIG_LEDS_CLEVO_MAIL is not set
> CONFIG_LEDS_PCA955X=3Dm
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_WM8350 is not set
> CONFIG_LEDS_DA903X=3Dy
> # CONFIG_LEDS_DA9052 is not set
> # CONFIG_LEDS_PWM is not set
> # CONFIG_LEDS_REGULATOR is not set
> CONFIG_LEDS_BD2802=3Dm
> # CONFIG_LEDS_INTEL_SS4200 is not set
> CONFIG_LEDS_LT3593=3Dm
> CONFIG_LEDS_MC13783=3Dm
> CONFIG_LEDS_TCA6507=3Dm
> # CONFIG_LEDS_TLC591XX is not set
> CONFIG_LEDS_MAX77693=3Dm
> CONFIG_LEDS_MAX8997=3Dm
> CONFIG_LEDS_LM355x=3Dm
> CONFIG_LEDS_MENF21BMC=3Dy
> # CONFIG_LEDS_KTD2692 is not set
> # CONFIG_LEDS_IS31FL319X is not set
> CONFIG_LEDS_IS31FL32XX=3Dm
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> # CONFIG_LEDS_SYSCON is not set
> CONFIG_LEDS_MLXCPLD=3Dy
> # CONFIG_LEDS_MLXREG is not set
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> CONFIG_LEDS_TRIGGER_DISK=3Dy
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> # CONFIG_LEDS_TRIGGER_CPU is not set
> CONFIG_LEDS_TRIGGER_ACTIVITY=3Dm
> CONFIG_LEDS_TRIGGER_GPIO=3Dm
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> # CONFIG_LEDS_TRIGGER_NETDEV is not set
> CONFIG_LEDS_TRIGGER_PATTERN=3Dm
> CONFIG_ACCESSIBILITY=3Dy
> CONFIG_A11Y_BRAILLE_CONSOLE=3Dy
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dm
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_DECODE_MCE=3Dm
> # CONFIG_EDAC_AMD64 is not set
> # CONFIG_EDAC_E752X is not set
> # CONFIG_EDAC_I82975X is not set
> # CONFIG_EDAC_I3000 is not set
> # CONFIG_EDAC_I3200 is not set
> # CONFIG_EDAC_IE31200 is not set
> # CONFIG_EDAC_X38 is not set
> # CONFIG_EDAC_I5400 is not set
> # CONFIG_EDAC_I5000 is not set
> # CONFIG_EDAC_I5100 is not set
> # CONFIG_EDAC_I7300 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_SYSTOHC is not set
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
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM80X=3Dm
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABX80X is not set
> CONFIG_RTC_DRV_AS3722=3Dm
> CONFIG_RTC_DRV_DS1307=3Dy
> CONFIG_RTC_DRV_DS1307_CENTURY=3Dy
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dm
> CONFIG_RTC_DRV_HYM8563=3Dy
> CONFIG_RTC_DRV_LP8788=3Dy
> CONFIG_RTC_DRV_MAX6900=3Dm
> # CONFIG_RTC_DRV_MAX8907 is not set
> # CONFIG_RTC_DRV_MAX8925 is not set
> CONFIG_RTC_DRV_MAX8997=3Dm
> CONFIG_RTC_DRV_MAX77686=3Dm
> CONFIG_RTC_DRV_RK808=3Dm
> CONFIG_RTC_DRV_RS5C372=3Dm
> # CONFIG_RTC_DRV_ISL1208 is not set
> # CONFIG_RTC_DRV_ISL12022 is not set
> # CONFIG_RTC_DRV_ISL12026 is not set
> CONFIG_RTC_DRV_X1205=3Dy
> CONFIG_RTC_DRV_PCF8523=3Dm
> # CONFIG_RTC_DRV_PCF85063 is not set
> # CONFIG_RTC_DRV_PCF85363 is not set
> CONFIG_RTC_DRV_PCF8563=3Dm
> # CONFIG_RTC_DRV_PCF8583 is not set
> # CONFIG_RTC_DRV_M41T80 is not set
> CONFIG_RTC_DRV_BQ32K=3Dy
> CONFIG_RTC_DRV_TPS80031=3Dy
> CONFIG_RTC_DRV_RC5T583=3Dy
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=3Dm
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dy
> CONFIG_RTC_DRV_RX8025=3Dy
> CONFIG_RTC_DRV_EM3027=3Dy
> # CONFIG_RTC_DRV_RV8803 is not set
> # CONFIG_RTC_DRV_S5M is not set
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dm
> CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> CONFIG_RTC_DRV_PCF2127=3Dm
> CONFIG_RTC_DRV_RV3029C2=3Dm
> CONFIG_RTC_DRV_RV3029_HWMON=3Dy
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> CONFIG_RTC_DRV_DS1286=3Dy
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dm
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_DS2404=3Dm
> CONFIG_RTC_DRV_DA9052=3Dy
> CONFIG_RTC_DRV_DA9063=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dm
> CONFIG_RTC_DRV_M48T86=3Dm
> # CONFIG_RTC_DRV_M48T35 is not set
> CONFIG_RTC_DRV_M48T59=3Dy
> CONFIG_RTC_DRV_MSM6242=3Dm
> CONFIG_RTC_DRV_BQ4802=3Dm
> CONFIG_RTC_DRV_RP5C01=3Dy
> CONFIG_RTC_DRV_V3020=3Dy
> # CONFIG_RTC_DRV_WM8350 is not set
> CONFIG_RTC_DRV_PCF50633=3Dm
> CONFIG_RTC_DRV_ZYNQMP=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_FTRTC010=3Dm
> # CONFIG_RTC_DRV_MC13XXX is not set
> CONFIG_RTC_DRV_SNVS=3Dy
> # CONFIG_RTC_DRV_R7301 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> CONFIG_UDMABUF=3Dy
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> # CONFIG_UIO is not set
> CONFIG_VIRT_DRIVERS=3Dy
> # CONFIG_VBOXGUEST is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_INPUT=3Dy
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> CONFIG_STAGING=3Dy
> CONFIG_COMEDI=3Dy
> CONFIG_COMEDI_DEBUG=3Dy
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> # CONFIG_COMEDI_MISC_DRIVERS is not set
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> CONFIG_COMEDI_PCL711=3Dy
> CONFIG_COMEDI_PCL724=3Dy
> # CONFIG_COMEDI_PCL726 is not set
> CONFIG_COMEDI_PCL730=3Dm
> CONFIG_COMEDI_PCL812=3Dm
> CONFIG_COMEDI_PCL816=3Dy
> # CONFIG_COMEDI_PCL818 is not set
> # CONFIG_COMEDI_PCM3724 is not set
> CONFIG_COMEDI_AMPLC_DIO200_ISA=3Dm
> CONFIG_COMEDI_AMPLC_PC236_ISA=3Dy
> CONFIG_COMEDI_AMPLC_PC263_ISA=3Dy
> CONFIG_COMEDI_RTI800=3Dm
> # CONFIG_COMEDI_RTI802 is not set
> CONFIG_COMEDI_DAC02=3Dy
> CONFIG_COMEDI_DAS16M1=3Dy
> CONFIG_COMEDI_DAS08_ISA=3Dm
> # CONFIG_COMEDI_DAS16 is not set
> CONFIG_COMEDI_DAS800=3Dy
> # CONFIG_COMEDI_DAS1800 is not set
> CONFIG_COMEDI_DAS6402=3Dm
> # CONFIG_COMEDI_DT2801 is not set
> # CONFIG_COMEDI_DT2811 is not set
> # CONFIG_COMEDI_DT2814 is not set
> # CONFIG_COMEDI_DT2815 is not set
> # CONFIG_COMEDI_DT2817 is not set
> CONFIG_COMEDI_DT282X=3Dm
> CONFIG_COMEDI_DMM32AT=3Dm
> # CONFIG_COMEDI_FL512 is not set
> # CONFIG_COMEDI_AIO_AIO12_8 is not set
> CONFIG_COMEDI_AIO_IIRO_16=3Dy
> CONFIG_COMEDI_II_PCI20KC=3Dy
> CONFIG_COMEDI_C6XDIGIO=3Dm
> # CONFIG_COMEDI_MPC624 is not set
> CONFIG_COMEDI_ADQ12B=3Dm
> # CONFIG_COMEDI_NI_AT_A2150 is not set
> CONFIG_COMEDI_NI_AT_AO=3Dy
> CONFIG_COMEDI_NI_ATMIO=3Dy
> # CONFIG_COMEDI_NI_ATMIO16D is not set
> CONFIG_COMEDI_NI_LABPC_ISA=3Dm
> # CONFIG_COMEDI_PCMAD is not set
> CONFIG_COMEDI_PCMDA12=3Dm
> CONFIG_COMEDI_PCMMIO=3Dm
> CONFIG_COMEDI_PCMUIO=3Dy
> # CONFIG_COMEDI_MULTIQ3 is not set
> CONFIG_COMEDI_S526=3Dy
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_USB_DRIVERS=3Dm
> CONFIG_COMEDI_DT9812=3Dm
> CONFIG_COMEDI_NI_USB6501=3Dm
> CONFIG_COMEDI_USBDUX=3Dm
> CONFIG_COMEDI_USBDUXFAST=3Dm
> CONFIG_COMEDI_USBDUXSIGMA=3Dm
> CONFIG_COMEDI_VMK80XX=3Dm
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> # CONFIG_COMEDI_8255_SA is not set
> CONFIG_COMEDI_KCOMEDILIB=3Dm
> CONFIG_COMEDI_AMPLC_DIO200=3Dm
> CONFIG_COMEDI_AMPLC_PC236=3Dy
> CONFIG_COMEDI_DAS08=3Dm
> CONFIG_COMEDI_ISADMA=3Dy
> CONFIG_COMEDI_NI_LABPC=3Dm
> CONFIG_COMEDI_NI_LABPC_ISADMA=3Dm
> CONFIG_COMEDI_NI_TIO=3Dy
> CONFIG_COMEDI_NI_ROUTING=3Dy
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_R8712U is not set
> # CONFIG_RTS5208 is not set
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
> CONFIG_AD7606=3Dy
> CONFIG_AD7606_IFACE_PARALLEL=3Dm
> =

> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dy
> CONFIG_AD7152=3Dm
> CONFIG_AD7746=3Dy
> =

> #
> # Direct Digital Synthesis
> #
> =

> #
> # Network Analyzer, Impedance Converters
> #
> # CONFIG_AD5933 is not set
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=3Dm
> CONFIG_ADE7854_I2C=3Dm
> =

> #
> # Resolver to digital converters
> #
> # CONFIG_FB_SM750 is not set
> # CONFIG_FB_XGI is not set
> =

> #
> # Speakup console speech
> #
> CONFIG_SPEAKUP=3Dy
> # CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
> CONFIG_SPEAKUP_SYNTH_APOLLO=3Dm
> CONFIG_SPEAKUP_SYNTH_AUDPTR=3Dy
> CONFIG_SPEAKUP_SYNTH_BNS=3Dm
> CONFIG_SPEAKUP_SYNTH_DECTLK=3Dm
> CONFIG_SPEAKUP_SYNTH_DECEXT=3Dm
> CONFIG_SPEAKUP_SYNTH_LTLK=3Dy
> CONFIG_SPEAKUP_SYNTH_SOFT=3Dm
> CONFIG_SPEAKUP_SYNTH_SPKOUT=3Dy
> # CONFIG_SPEAKUP_SYNTH_TXPRT is not set
> CONFIG_SPEAKUP_SYNTH_DUMMY=3Dy
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> # CONFIG_STAGING_BOARD is not set
> # CONFIG_LTE_GDM724X is not set
> CONFIG_FIREWIRE_SERIAL=3Dy
> CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
> CONFIG_FWTTY_MAX_CARD_PORTS=3D32
> # CONFIG_GS_FPGABOOT is not set
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
> CONFIG_MOST=3Dy
> CONFIG_MOST_CDEV=3Dm
> # CONFIG_MOST_NET is not set
> # CONFIG_MOST_VIDEO is not set
> # CONFIG_MOST_DIM2 is not set
> # CONFIG_MOST_I2C is not set
> # CONFIG_MOST_USB is not set
> # CONFIG_KS7010 is not set
> CONFIG_GREYBUS=3Dm
> CONFIG_GREYBUS_ES2=3Dm
> CONFIG_GREYBUS_BOOTROM=3Dm
> # CONFIG_GREYBUS_HID is not set
> CONFIG_GREYBUS_LIGHT=3Dm
> CONFIG_GREYBUS_LOG=3Dm
> # CONFIG_GREYBUS_LOOPBACK is not set
> CONFIG_GREYBUS_POWER=3Dm
> # CONFIG_GREYBUS_RAW is not set
> # CONFIG_GREYBUS_VIBRATOR is not set
> # CONFIG_GREYBUS_BRIDGED_PHY is not set
> CONFIG_MTK_MMC=3Dm
> CONFIG_MTK_AEE_KDUMP=3Dy
> # CONFIG_MTK_MMC_CD_POLL is not set
> =

> #
> # Gasket devices
> #
> # CONFIG_STAGING_GASKET_FRAMEWORK is not set
> CONFIG_XIL_AXIS_FIFO=3Dm
> # CONFIG_EROFS_FS is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_ACERHDF is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_DELL_SMBIOS is not set
> # CONFIG_DELL_SMO8800 is not set
> CONFIG_DELL_RBU=3Dy
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_ACPI_WMI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_INTEL_INT0002_VGPIO is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_IBM_RTL is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_PVPANIC is not set
> # CONFIG_INTEL_PMC_IPC is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> # CONFIG_SURFACE_3_BUTTON is not set
> CONFIG_INTEL_PUNIT_IPC=3Dm
> CONFIG_MLX_PLATFORM=3Dm
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> CONFIG_MELLANOX_PLATFORM=3Dy
> CONFIG_MLXREG_HOTPLUG=3Dy
> CONFIG_MLXREG_IO=3Dm
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> # CONFIG_CLK_HSDK is not set
> # CONFIG_COMMON_CLK_MAX77686 is not set
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_RK808 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI514 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_SI570 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CDCE925 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_COMMON_CLK_VC5 is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> CONFIG_MAILBOX=3Dy
> CONFIG_PLATFORM_MHU=3Dy
> # CONFIG_PCC is not set
> CONFIG_ALTERA_MBOX=3Dm
> CONFIG_MAILBOX_TEST=3Dm
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
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> # CONFIG_RPMSG_VIRTIO is not set
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
> # NXP/Freescale QorIQ SoC drivers
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
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dm
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dm
> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> CONFIG_DEVFREQ_GOV_PASSIVE=3Dm
> =

> #
> # DEVFREQ Drivers
> #
> CONFIG_PM_DEVFREQ_EVENT=3Dy
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_ADC_JACK=3Dy
> CONFIG_EXTCON_GPIO=3Dm
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> CONFIG_EXTCON_MAX3355=3Dy
> CONFIG_EXTCON_MAX77693=3Dm
> CONFIG_EXTCON_MAX8997=3Dy
> # CONFIG_EXTCON_RT8973A is not set
> CONFIG_EXTCON_SM5502=3Dm
> # CONFIG_EXTCON_USB_GPIO is not set
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dm
> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dm
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> # CONFIG_IIO_SW_DEVICE is not set
> CONFIG_IIO_SW_TRIGGER=3Dy
> =

> #
> # Accelerometers
> #
> CONFIG_ADXL372=3Dy
> CONFIG_ADXL372_I2C=3Dy
> CONFIG_BMA180=3Dm
> CONFIG_BMC150_ACCEL=3Dm
> CONFIG_BMC150_ACCEL_I2C=3Dm
> CONFIG_DA280=3Dm
> # CONFIG_DA311 is not set
> CONFIG_DMARD06=3Dm
> # CONFIG_DMARD09 is not set
> # CONFIG_DMARD10 is not set
> CONFIG_IIO_CROS_EC_ACCEL_LEGACY=3Dm
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dm
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dm
> # CONFIG_KXSD9 is not set
> CONFIG_KXCJK1013=3Dm
> CONFIG_MC3230=3Dm
> CONFIG_MMA7455=3Dy
> CONFIG_MMA7455_I2C=3Dy
> # CONFIG_MMA7660 is not set
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=3Dy
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=3Dy
> # CONFIG_MXC4005 is not set
> # CONFIG_MXC6255 is not set
> CONFIG_STK8312=3Dy
> CONFIG_STK8BA50=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD7291=3Dm
> # CONFIG_AD799X is not set
> # CONFIG_CC10001_ADC is not set
> CONFIG_DA9150_GPADC=3Dm
> CONFIG_DLN2_ADC=3Dm
> CONFIG_ENVELOPE_DETECTOR=3Dy
> CONFIG_HX711=3Dy
> CONFIG_INA2XX_ADC=3Dm
> # CONFIG_LP8788_ADC is not set
> CONFIG_LTC2471=3Dm
> CONFIG_LTC2485=3Dm
> # CONFIG_LTC2497 is not set
> CONFIG_MAX1363=3Dm
> CONFIG_MAX9611=3Dm
> # CONFIG_MCP3422 is not set
> CONFIG_MEN_Z188_ADC=3Dy
> CONFIG_NAU7802=3Dy
> CONFIG_QCOM_VADC_COMMON=3Dm
> CONFIG_QCOM_SPMI_IADC=3Dm
> CONFIG_QCOM_SPMI_VADC=3Dm
> # CONFIG_QCOM_SPMI_ADC5 is not set
> CONFIG_SD_ADC_MODULATOR=3Dy
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_ADS1015=3Dm
> # CONFIG_VF610_ADC is not set
> CONFIG_VIPERBOARD_ADC=3Dy
> =

> #
> # Analog Front Ends
> #
> CONFIG_IIO_RESCALE=3Dm
> =

> #
> # Amplifiers
> #
> =

> #
> # Chemical Sensors
> #
> # CONFIG_ATLAS_PH_SENSOR is not set
> CONFIG_BME680=3Dy
> CONFIG_BME680_I2C=3Dy
> CONFIG_CCS811=3Dy
> CONFIG_IAQCORE=3Dm
> # CONFIG_VZ89X is not set
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # SSP Sensor Common
> #
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Counters
> #
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dy
> CONFIG_AD5380=3Dm
> CONFIG_AD5446=3Dy
> # CONFIG_AD5593R is not set
> # CONFIG_AD5696_I2C is not set
> CONFIG_DPOT_DAC=3Dy
> # CONFIG_DS4424 is not set
> CONFIG_M62332=3Dy
> # CONFIG_MAX517 is not set
> CONFIG_MAX5821=3Dm
> CONFIG_MCP4725=3Dm
> CONFIG_TI_DAC5571=3Dy
> # CONFIG_VF610_DAC is not set
> =

> #
> # IIO dummy driver
> #
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
> # CONFIG_BMG160 is not set
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=3Dy
> CONFIG_MAX30100=3Dy
> CONFIG_MAX30102=3Dm
> =

> #
> # Humidity sensors
> #
> # CONFIG_AM2315 is not set
> CONFIG_DHT11=3Dy
> # CONFIG_HDC100X is not set
> CONFIG_HTS221=3Dy
> CONFIG_HTS221_I2C=3Dy
> CONFIG_HTU21=3Dm
> # CONFIG_SI7005 is not set
> CONFIG_SI7020=3Dm
> =

> #
> # Inertial measurement units
> #
> # CONFIG_BMI160_I2C is not set
> CONFIG_KMX61=3Dm
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_INV_MPU6050_I2C=3Dy
> CONFIG_IIO_ST_LSM6DSX=3Dy
> CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dy
> CONFIG_AL3320A=3Dy
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=3Dm
> CONFIG_BH1750=3Dy
> # CONFIG_BH1780 is not set
> # CONFIG_CM32181 is not set
> # CONFIG_CM3232 is not set
> # CONFIG_CM3323 is not set
> CONFIG_CM3605=3Dy
> # CONFIG_CM36651 is not set
> CONFIG_GP2AP020A00F=3Dm
> CONFIG_SENSORS_ISL29018=3Dy
> # CONFIG_SENSORS_ISL29028 is not set
> # CONFIG_ISL29125 is not set
> # CONFIG_JSA1212 is not set
> CONFIG_RPR0521=3Dy
> CONFIG_LTR501=3Dm
> # CONFIG_LV0104CS is not set
> # CONFIG_MAX44000 is not set
> # CONFIG_OPT3001 is not set
> # CONFIG_PA12203001 is not set
> CONFIG_SI1133=3Dy
> # CONFIG_SI1145 is not set
> CONFIG_STK3310=3Dm
> # CONFIG_ST_UVIS25 is not set
> CONFIG_TCS3414=3Dm
> CONFIG_TCS3472=3Dm
> # CONFIG_SENSORS_TSL2563 is not set
> CONFIG_TSL2583=3Dy
> CONFIG_TSL2772=3Dy
> # CONFIG_TSL4531 is not set
> # CONFIG_US5182D is not set
> CONFIG_VCNL4000=3Dm
> CONFIG_VEML6070=3Dm
> CONFIG_VL6180=3Dy
> CONFIG_ZOPT2201=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8974=3Dy
> CONFIG_AK8975=3Dm
> # CONFIG_AK09911 is not set
> CONFIG_BMC150_MAGN=3Dm
> CONFIG_BMC150_MAGN_I2C=3Dm
> # CONFIG_MAG3110 is not set
> # CONFIG_MMC35240 is not set
> # CONFIG_IIO_ST_MAGN_3AXIS is not set
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> =

> #
> # Multiplexers
> #
> CONFIG_IIO_MUX=3Dm
> =

> #
> # Inclinometer sensors
> #
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> =

> #
> # Digital potentiometers
> #
> CONFIG_AD5272=3Dm
> CONFIG_DS1803=3Dy
> CONFIG_MCP4018=3Dm
> CONFIG_MCP4531=3Dm
> # CONFIG_TPL0102 is not set
> =

> #
> # Digital potentiostats
> #
> # CONFIG_LMP91000 is not set
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dy
> CONFIG_BMP280=3Dm
> CONFIG_BMP280_I2C=3Dm
> CONFIG_HP03=3Dm
> CONFIG_MPL115=3Dm
> CONFIG_MPL115_I2C=3Dm
> CONFIG_MPL3115=3Dm
> CONFIG_MS5611=3Dy
> CONFIG_MS5611_I2C=3Dy
> CONFIG_MS5637=3Dy
> CONFIG_IIO_ST_PRESS=3Dm
> CONFIG_IIO_ST_PRESS_I2C=3Dm
> CONFIG_T5403=3Dy
> CONFIG_HP206C=3Dm
> # CONFIG_ZPA2326 is not set
> =

> #
> # Lightning sensors
> #
> =

> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=3Dm
> CONFIG_LIDAR_LITE_V2=3Dy
> CONFIG_RFD77402=3Dy
> CONFIG_SRF04=3Dm
> CONFIG_SX9500=3Dy
> # CONFIG_SRF08 is not set
> CONFIG_VL53L0X_I2C=3Dy
> =

> #
> # Resolver to digital converters
> #
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dy
> CONFIG_MLX90632=3Dm
> CONFIG_TMP006=3Dy
> CONFIG_TMP007=3Dy
> CONFIG_TSYS01=3Dy
> CONFIG_TSYS02D=3Dy
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_ATMEL_HLCDC_PWM is not set
> # CONFIG_PWM_FSL_FTM is not set
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dy
> =

> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=3Dy
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_IPACK_BUS is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_TI_SYSCON=3Dm
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> CONFIG_FMC_TRIVIAL=3Dm
> # CONFIG_FMC_WRITE_EEPROM is not set
> CONFIG_FMC_CHARDEV=3Dm
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dm
> # CONFIG_PHY_CADENCE_DP is not set
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> CONFIG_PHY_CPCAP_USB=3Dm
> CONFIG_PHY_MAPPHONE_MDM6600=3Dy
> # CONFIG_PHY_OCELOT_SERDES is not set
> CONFIG_PHY_QCOM_USB_HS=3Dm
> # CONFIG_PHY_QCOM_USB_HSIC is not set
> CONFIG_PHY_TUSB1210=3Dm
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> CONFIG_MCB_LPC=3Dm
> =

> #
> # Performance monitor support
> #
> CONFIG_RAS=3Dy
> # CONFIG_RAS_CEC is not set
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> CONFIG_LIBNVDIMM=3Dm
> # CONFIG_BLK_DEV_PMEM is not set
> CONFIG_ND_BLK=3Dm
> CONFIG_ND_CLAIM=3Dy
> CONFIG_ND_BTT=3Dm
> CONFIG_BTT=3Dy
> # CONFIG_OF_PMEM is not set
> # CONFIG_DAX is not set
> CONFIG_NVMEM=3Dy
> CONFIG_RAVE_SP_EEPROM=3Dm
> =

> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dm
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dm
> CONFIG_INTEL_TH_MSU=3Dm
> CONFIG_INTEL_TH_PTI=3Dm
> CONFIG_INTEL_TH_DEBUG=3Dy
> CONFIG_FPGA=3Dy
> CONFIG_ALTERA_PR_IP_CORE=3Dy
> # CONFIG_ALTERA_PR_IP_CORE_PLAT is not set
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_BRIDGE=3Dy
> CONFIG_XILINX_PR_DECOUPLER=3Dm
> CONFIG_FPGA_REGION=3Dy
> # CONFIG_OF_FPGA_REGION is not set
> CONFIG_FPGA_DFL=3Dy
> CONFIG_FPGA_DFL_FME=3Dy
> # CONFIG_FPGA_DFL_FME_MGR is not set
> CONFIG_FPGA_DFL_FME_BRIDGE=3Dy
> CONFIG_FPGA_DFL_FME_REGION=3Dm
> # CONFIG_FPGA_DFL_AFU is not set
> # CONFIG_FPGA_DFL_PCI is not set
> # CONFIG_FSI is not set
> CONFIG_MULTIPLEXER=3Dm
> =

> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=3Dm
> CONFIG_MUX_GPIO=3Dm
> CONFIG_MUX_MMIO=3Dm
> CONFIG_PM_OPP=3Dy
> # CONFIG_UNISYS_VISORBUS is not set
> CONFIG_SIOX=3Dy
> CONFIG_SIOX_BUS_GPIO=3Dy
> CONFIG_SLIMBUS=3Dy
> CONFIG_SLIM_QCOM_CTRL=3Dy
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_FS_IOMAP=3Dy
> # CONFIG_EXT2_FS is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> # CONFIG_EXT4_USE_FOR_EXT2 is not set
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> CONFIG_EXT4_ENCRYPTION=3Dy
> CONFIG_EXT4_FS_ENCRYPTION=3Dy
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> CONFIG_JFS_FS=3Dm
> # CONFIG_JFS_POSIX_ACL is not set
> # CONFIG_JFS_SECURITY is not set
> # CONFIG_JFS_DEBUG is not set
> CONFIG_JFS_STATISTICS=3Dy
> # CONFIG_XFS_FS is not set
> # CONFIG_GFS2_FS is not set
> # CONFIG_OCFS2_FS is not set
> CONFIG_BTRFS_FS=3Dy
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> CONFIG_BTRFS_DEBUG=3Dy
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> CONFIG_NILFS2_FS=3Dm
> CONFIG_F2FS_FS=3Dy
> CONFIG_F2FS_STAT_FS=3Dy
> # CONFIG_F2FS_FS_XATTR is not set
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FAULT_INJECTION is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS4_FS=3Dm
> CONFIG_AUTOFS_FS=3Dm
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> # CONFIG_JOLIET is not set
> # CONFIG_ZISOFS is not set
> # CONFIG_UDF_FS is not set
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> CONFIG_MSDOS_FS=3Dy
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> CONFIG_NTFS_FS=3Dy
> CONFIG_NTFS_DEBUG=3Dy
> # CONFIG_NTFS_RW is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
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
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> # CONFIG_SUNRPC_DEBUG is not set
> # CONFIG_CEPH_FS is not set
> CONFIG_CIFS=3Dm
> # CONFIG_CIFS_STATS2 is not set
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> # CONFIG_CIFS_WEAK_PW_HASH is not set
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dm
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dm
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dm
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> CONFIG_NLS_CODEPAGE_936=3Dm
> # CONFIG_NLS_CODEPAGE_950 is not set
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dm
> # CONFIG_NLS_CODEPAGE_1251 is not set
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dm
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dy
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dm
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> # CONFIG_NLS_ISO8859_15 is not set
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dm
> # CONFIG_NLS_MAC_INUIT is not set
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> # CONFIG_NLS_UTF8 is not set
> # CONFIG_DLM is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_KEYS_COMPAT=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> # CONFIG_ENCRYPTED_KEYS is not set
> # CONFIG_KEY_DH_OPERATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> # CONFIG_SECURITYFS is not set
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_PAGE_TABLE_ISOLATION is not set
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> # CONFIG_HARDENED_USERCOPY_FALLBACK is not set
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_LOADPIN=3Dy
> CONFIG_SECURITY_LOADPIN_ENFORCE=3Dy
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_INTEGRITY is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
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
> # CONFIG_CRYPTO_DH is not set
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> # CONFIG_CRYPTO_GF128MUL is not set
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> # CONFIG_CRYPTO_GCM is not set
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> CONFIG_CRYPTO_AEGIS128=3Dm
> CONFIG_CRYPTO_AEGIS128L=3Dm
> # CONFIG_CRYPTO_AEGIS256 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> # CONFIG_CRYPTO_AEGIS128L_AESNI_SSE2 is not set
> CONFIG_CRYPTO_AEGIS256_AESNI_SSE2=3Dm
> CONFIG_CRYPTO_MORUS640=3Dm
> CONFIG_CRYPTO_MORUS640_GLUE=3Dm
> CONFIG_CRYPTO_MORUS640_SSE2=3Dm
> CONFIG_CRYPTO_MORUS1280=3Dy
> CONFIG_CRYPTO_MORUS1280_GLUE=3Dm
> CONFIG_CRYPTO_MORUS1280_SSE2=3Dm
> CONFIG_CRYPTO_MORUS1280_AVX2=3Dm
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dm
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> # CONFIG_CRYPTO_LRW is not set
> CONFIG_CRYPTO_OFB=3Dy
> CONFIG_CRYPTO_PCBC=3Dm
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dy
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dm
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> # CONFIG_CRYPTO_GHASH is not set
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> # CONFIG_CRYPTO_RMD320 is not set
> # CONFIG_CRYPTO_SHA1 is not set
> # CONFIG_CRYPTO_SHA1_SSSE3 is not set
> CONFIG_CRYPTO_SHA256_SSSE3=3Dm
> CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dm
> # CONFIG_CRYPTO_SM3 is not set
> CONFIG_CRYPTO_TGR192=3Dm
> CONFIG_CRYPTO_WP512=3Dm
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dm
> CONFIG_CRYPTO_AES_X86_64=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> CONFIG_CRYPTO_ANUBIS=3Dm
> CONFIG_CRYPTO_ARC4=3Dm
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dm
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dm
> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
> CONFIG_CRYPTO_SM4=3Dy
> CONFIG_CRYPTO_TEA=3Dm
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
> =

> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> CONFIG_CRYPTO_LZO=3Dm
> CONFIG_CRYPTO_842=3Dm
> CONFIG_CRYPTO_LZ4=3Dm
> # CONFIG_CRYPTO_LZ4HC is not set
> CONFIG_CRYPTO_ZSTD=3Dm
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
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dm
> # CONFIG_X509_CERTIFICATE_PARSER is not set
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dm
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dy
> CONFIG_BITREVERSE=3Dy
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
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dm
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=3Dy
> CONFIG_CRC64=3Dy
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dm
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=3Dm
> CONFIG_842_DECOMPRESS=3Dm
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dm
> CONFIG_LZ4_DECOMPRESS=3Dm
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_XARRAY_MULTI=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_DMA_DIRECT_OPS=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_DDR=3Dy
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_LIBFDT=3Dy
> CONFIG_OID_REGISTRY=3Dm
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONTS=3Dy
> # CONFIG_FONT_8x8 is not set
> CONFIG_FONT_8x16=3Dy
> # CONFIG_FONT_6x11 is not set
> # CONFIG_FONT_7x14 is not set
> # CONFIG_FONT_PEARL_8x8 is not set
> CONFIG_FONT_ACORN_8x8=3Dy
> CONFIG_FONT_MINI_4x6=3Dy
> # CONFIG_FONT_6x10 is not set
> # CONFIG_FONT_10x18 is not set
> # CONFIG_FONT_SUN8x16 is not set
> # CONFIG_FONT_SUN12x22 is not set
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_UACCESS_MCSAFE=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_SBITMAP=3Dy
> CONFIG_STRING_SELFTEST=3Dy
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
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
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D8192
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_READABLE_ASM=3Dy
> # CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_STACK_VALIDATION is not set
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
> # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
> # CONFIG_PAGE_POISONING_ZERO is not set
> CONFIG_DEBUG_RODATA_TEST=3Dy
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SLUB_DEBUG_ON=3Dy
> CONFIG_SLUB_STATS=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_DEBUG_VM is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_KASAN=3Dy
> # CONFIG_KASAN_EXTRA is not set
> CONFIG_KASAN_OUTLINE=3Dy
> # CONFIG_KASAN_INLINE is not set
> CONFIG_TEST_KASAN=3Dm
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> # CONFIG_KCOV is not set
> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Lockups and Hangs
> #
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> # CONFIG_SCHED_DEBUG is not set
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> # CONFIG_PROVE_LOCKING is not set
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dm
> CONFIG_WW_MUTEX_SELFTEST=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PI_LIST is not set
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_TORTURE_TEST=3Dm
> CONFIG_RCU_PERF_TEST=3Dm
> CONFIG_RCU_TORTURE_TEST=3Dm
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FAULT_INJECTION=3Dy
> # CONFIG_FAILSLAB is not set
> CONFIG_FAIL_PAGE_ALLOC=3Dy
> CONFIG_FAIL_MAKE_REQUEST=3Dy
> # CONFIG_FAIL_IO_TIMEOUT is not set
> # CONFIG_FAIL_FUTEX is not set
> # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
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
> CONFIG_RING_BUFFER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
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
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> # CONFIG_TEST_UBSAN is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> CONFIG_X86_PTDUMP_CORE=3Dy
> CONFIG_X86_PTDUMP=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
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
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> CONFIG_OPTIMIZE_INLINING=3Dy
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_FPU=3Dy
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> # CONFIG_UNWINDER_ORC is not set
> CONFIG_UNWINDER_FRAME_POINTER=3Dy


--===============5183808576967903512==--

