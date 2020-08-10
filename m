Content-Type: multipart/mixed; boundary="===============4347513556932326425=="
MIME-Version: 1.0
From: Michael S. Tsirkin <mst@redhat.com>
To: lkp@lists.01.org
Subject: Re: [vdpasim] 0ea9ee430e: INFO:trying_to_register_non-static_key
Date: Mon, 10 Aug 2020 08:47:57 -0400
Message-ID: <20200810084720-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200810025516.GG1538@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4347513556932326425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2020 at 10:55:16AM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 0ea9ee430e74b16c6b17e70757d1c26d8d140e1f ("vdpasim: protect concu=
rrent access to iommu iotlb")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------------------------------+------------+------------+
> |                                        | 6234f80574 | 0ea9ee430e |
> +----------------------------------------+------------+------------+
> | boot_successes                         | 7          | 0          |
> | boot_failures                          | 0          | 12         |
> | INFO:trying_to_register_non-static_key | 0          | 12         |
> +----------------------------------------+------------+------------+
> =


OK, that is because the lock here is not initialized properly.
Sending a patch now.
Thanks!

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [    3.762722] INFO: trying to register non-static key.
> [    3.762830] the code is fine but needs lockdep annotation.
> [    3.762830] turning off the locking correctness validator.
> [    3.762830] CPU: 0 PID: 1 Comm: swapper Not tainted 5.8.0-00043-g0ea9e=
e430e74b #1
> [    3.762830] Call Trace:
> [    3.762830]  dump_stack+0x1b/0x1e
> [    3.762830]  register_lock_class+0x597/0x5a0
> [    3.762830]  ? sched_clock_cpu+0xd5/0xf0
> [    3.762830]  __lock_acquire+0x36/0x4f0
> [    3.762830]  lock_acquire+0x3e/0x70
> [    3.762830]  ? vdpasim_set_status+0x142/0x190
> [    3.762830]  _raw_spin_lock+0x28/0x70
> [    3.762830]  ? vdpasim_set_status+0x142/0x190
> [    3.762830]  vdpasim_set_status+0x142/0x190
> [    3.762830]  virtio_vdpa_reset+0x20/0x30
> [    3.762830]  register_virtio_device+0x72/0xe0
> [    3.762830]  virtio_vdpa_probe+0x9f/0xe0
> [    3.762830]  vdpa_dev_probe+0x18/0x30
> [    3.762830]  really_probe+0xd5/0x270
> [    3.762830]  driver_probe_device+0x44/0xa0
> [    3.762830]  __device_attach_driver+0x54/0x80
> [    3.762830]  ? driver_allows_async_probing+0x50/0x50
> [    3.762830]  bus_for_each_drv+0x4e/0x80
> [    3.762830]  __device_attach+0xa7/0x100
> [    3.762830]  ? driver_allows_async_probing+0x50/0x50
> [    3.762830]  device_initial_probe+0xd/0x10
> [    3.762830]  bus_probe_device+0x6f/0x80
> [    3.762830]  device_add+0x31a/0x6a0
> [    3.762830]  ? virtio_vdpa_driver_init+0x11/0x11
> [    3.762830]  vdpa_register_device+0x8/0x10
> [    3.762830]  vdpasim_dev_init+0x12d/0x15e
> [    3.762830]  ? virtio_vdpa_driver_init+0x11/0x11
> [    3.762830]  do_one_initcall+0x36/0x130
> [    3.762830]  ? parse_args+0x100/0x270
> [    3.762830]  ? do_initcalls+0x78/0xc0
> [    3.762830]  do_initcalls+0x9d/0xc0
> [    3.762830]  kernel_init_freeable+0x77/0xc1
> [    3.762830]  ? rest_init+0xf9/0xf9
> [    3.762830]  kernel_init+0x8/0xe7
> [    3.762830]  ret_from_fork+0x1c/0x28
> [    3.786853] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    3.787487] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    3.788823] 00:06: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D 115200=
) is a 16550A
> [    3.795236] MOXA Intellio family driver version 6.0k
> [    3.795613] SyncLink GT
> [    3.795786] SyncLink GT, tty major#234
> [    3.796108] SyncLink GT no devices found
> [    3.796418] SyncLink MultiPort driver $Revision: 4.38 $
> [    3.800879] SyncLink MultiPort driver $Revision: 4.38 $, tty major#511
> [    3.801358] SyncLink serial driver $Revision: 4.38 $
> [    3.805478] SyncLink serial driver $Revision: 4.38 $, tty major#510
> [    3.806029] sonypi: Sony Programmable I/O Controller Driver v1.26.
> [    3.806473] toshiba: not a supported Toshiba laptop
> [    3.806891] scx200_gpio: no SCx200 gpio present
> [    3.807200] nsc_gpio initializing
> [    3.807434] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> [    3.807784] smapi::smapi_init, ERROR invalid usSmapiID
> [    3.808132] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI =
is not available on this machine
> [    3.808750] mwave: mwavedd::mwave_init: Error: Failed to initialize bo=
ard data
> [    3.809234] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    3.809653] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    3.810557] random: get_random_u32 called from test_drm_mm_init+0x13/0=
xab with crng_init=3D0
> [    3.810559] drm_mm: Testing DRM range manger (struct drm_mm), with ran=
dom_seed=3D0x63ffe4ab max_iterations=3D8192 max_prime=3D128
> [    3.811865] drm_mm: igt_sanitycheck - ok!
> [    3.812159] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
> [    3.812595] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
> [    3.813068] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
> [    3.813508] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
> [    3.813970] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
> [    3.814415] igt_debug total: 4096, used 2048 free 2048
> [   50.319538] [drm] amdgpu kernel modesetting enabled.
> [   50.320388] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
> [   50.321024] [drm] Found bochs VGA, ID 0xb0c0.
> [   50.321327] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfeb=
f0000.
> [   50.321889] [TTM] Zone  kernel: Available graphics memory: 915974 KiB
> [   50.322331] [TTM] Initializing pool allocator
> [   50.322634] [TTM] Initializing DMA pool allocator
> [   50.323136] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.=
0 on minor 1
> [   50.324697] bochs-drm 0000:00:02.0: fb0: bochs-drmdrmfb frame buffer d=
evice
> [   50.326243] usbcore: registered new interface driver gm12u320
> [   50.326745] dummy-irq: no IRQ given.  Use irq=3DN
> [   50.327085] Phantom Linux Driver, version n0.9.8, init OK
> [   50.327476] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [   50.328024] c2port c2port0: C2 port uc added
> [   50.328312] c2port c2port0: uc flash has 30 blocks x 512 bytes (15360 =
bytes total)
> [   50.328958] Guest personality initialized and is inactive
> [   50.329355] VMCI host device registered (name=3Dvmci, major=3D10, mino=
r=3D60)
> [   50.329795] Initialized host personality
> [   50.330115] usbcore: registered new interface driver rtsx_usb
> [   50.330802] usbcore: registered new interface driver viperboard
> [   50.331237] usbcore: registered new interface driver dln2
> [   50.331667] dma-buf: Running sanitycheck
> [   50.331951] dma-buf: Running dma_fence
> [   50.332204] sizeof(dma_fence)=3D44
> [   50.332428] dma-buf: Running dma_fence/sanitycheck
> [   50.332751] dma-buf: Running dma_fence/test_signaling
> [   50.333091] dma-buf: Running dma_fence/test_add_callback
> [   50.333446] dma-buf: Running dma_fence/test_late_add_callback
> [   50.333833] dma-buf: Running dma_fence/test_rm_callback
> [   50.334182] dma-buf: Running dma_fence/test_late_rm_callback
> [   50.334559] dma-buf: Running dma_fence/test_status
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.8.0-00043-g0ea9ee430e74b .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> Rong Chen
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 5.8.0 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-15) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_LD_VERSION=3D235000000
> CONFIG_CLANG_VERSION=3D0
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
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
> CONFIG_KERNEL_BZIP2=3Dy
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> CONFIG_WATCH_QUEUE=3Dy
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
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
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
> =

> #
> # Timers subsystem
> #
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> =

> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_PREEMPTION=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> CONFIG_PSI=3Dy
> CONFIG_PSI_DEFAULT_DISABLED=3Dy
> # end of CPU/Task time and stats accounting
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> # end of RCU Subsystem
> =

> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_IKHEADERS=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # end of Scheduler features
> =

> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_KMEM=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> CONFIG_CGROUP_DEVICE=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> CONFIG_TIME_NS=3Dy
> CONFIG_IPC_NS=3Dy
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
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_XZ is not set
> # CONFIG_RD_LZO is not set
> CONFIG_RD_LZ4=3Dy
> CONFIG_BOOT_CONFIG=3Dy
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> # CONFIG_UID16 is not set
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> # CONFIG_AIO is not set
> CONFIG_IO_URING=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> # CONFIG_RSEQ is not set
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
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> # CONFIG_PROFILING is not set
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
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_32_LAZY_GS=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D3
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> # CONFIG_X86_CPU_RESCTRL is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_X86_32_IRIS=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_XEN is not set
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
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_CPU_SUP_UMC_32=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> CONFIG_NR_CPUS_RANGE_END=3D1
> CONFIG_NR_CPUS_DEFAULT=3D1
> CONFIG_NR_CPUS=3D1
> CONFIG_UP_LATE_INIT=3Dy
> CONFIG_X86_UP_APIC=3Dy
> CONFIG_X86_UP_IOAPIC=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> # CONFIG_X86_MCE_INTEL is not set
> # CONFIG_X86_MCE_AMD is not set
> CONFIG_X86_ANCIENT_MCE=3Dy
> # CONFIG_X86_MCE_INJECT is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> # end of Performance monitoring
> =

> CONFIG_X86_LEGACY_VM86=3Dy
> CONFIG_VM86=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_TOSHIBA=3Dy
> # CONFIG_I8K is not set
> # CONFIG_X86_REBOOTFIXUPS is not set
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dy
> # CONFIG_X86_CPUID is not set
> CONFIG_NOHIGHMEM=3Dy
> # CONFIG_HIGHMEM4G is not set
> # CONFIG_HIGHMEM64G is not set
> # CONFIG_VMSPLIT_3G is not set
> CONFIG_VMSPLIT_2G=3Dy
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0x80000000
> CONFIG_X86_PAE=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> # CONFIG_ARCH_RANDOM is not set
> # CONFIG_X86_SMAP is not set
> CONFIG_X86_UMIP=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> CONFIG_X86_INTEL_TSX_MODE_AUTO=3Dy
> # CONFIG_EFI is not set
> CONFIG_SECCOMP=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> # CONFIG_KEXEC is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_COMPAT_VDSO=3Dy
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
> # end of Processor type and features
> =

> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
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
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_TEST_SUSPEND=3Dy
> CONFIG_PM_SLEEP_DEBUG=3Dy
> CONFIG_PM_TRACE=3Dy
> CONFIG_PM_TRACE_RTC=3Dy
> CONFIG_PM_CLK=3Dy
> CONFIG_PM_GENERIC_DOMAINS=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_PM_GENERIC_DOMAINS_SLEEP=3Dy
> CONFIG_PM_GENERIC_DOMAINS_OF=3Dy
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_TAD is not set
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> # CONFIG_ACPI_CONTAINER is not set
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
> # CONFIG_APM is not set
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
> # CONFIG_CPU_IDLE_GOV_MENU is not set
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_GOBIOS=3Dy
> # CONFIG_PCI_GOMMCONFIG is not set
> # CONFIG_PCI_GODIRECT is not set
> # CONFIG_PCI_GOANY is not set
> CONFIG_PCI_BIOS=3Dy
> CONFIG_PCI_CNB20LE_QUIRK=3Dy
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> CONFIG_SCx200=3Dy
> CONFIG_SCx200HR_TIMER=3Dy
> CONFIG_ALIX=3Dy
> # CONFIG_NET5501 is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_X86_SYSFB=3Dy
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
> # CONFIG_EDD is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_FW_CFG_SYSFS is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> CONFIG_GOOGLE_COREBOOT_TABLE=3Dy
> CONFIG_GOOGLE_MEMCONSOLE=3Dy
> CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT=3Dy
> CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=3Dy
> # CONFIG_GOOGLE_VPD is not set
> CONFIG_EFI_EARLYCON=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_KPROBES is not set
> # CONFIG_JUMP_LABEL is not set
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
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
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
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> # CONFIG_STACKPROTECTOR is not set
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
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
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> CONFIG_LOCK_EVENT_COUNTS=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
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
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
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
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=3Dy
> CONFIG_FLAT_NODE_MEM_MAP=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_BALLOON_COMPACTION is not set
> CONFIG_COMPACTION=3Dy
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_MEMORY_FAILURE is not set
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_NEED_PER_CPU_KM=3Dy
> CONFIG_CLEANCACHE=3Dy
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> CONFIG_ZPOOL=3Dy
> # CONFIG_ZBUD is not set
> # CONFIG_Z3FOLD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_HMM_MIRROR=3Dy
> CONFIG_FRAME_VECTOR=3Dy
> CONFIG_PERCPU_STATS=3Dy
> CONFIG_GUP_BENCHMARK=3Dy
> CONFIG_GUP_GET_PTE_LOW_HIGH=3Dy
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_MAPPING_DIRTY_HELPERS=3Dy
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_TLS is not set
> # CONFIG_XFRM_USER is not set
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
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_NETLABEL is not set
> # CONFIG_MPTCP is not set
> # CONFIG_NETWORK_SECMARK is not set
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
> # CONFIG_QRTR is not set
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
> # end of Network testing
> # end of Networking options
> =

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
> # CONFIG_FAILOVER is not set
> CONFIG_ETHTOOL_NETLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> CONFIG_EISA=3Dy
> CONFIG_EISA_VLB_PRIMING=3Dy
> CONFIG_EISA_PCI_EISA=3Dy
> CONFIG_EISA_VIRTUAL_ROOT=3Dy
> # CONFIG_EISA_NAMES is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=3Dy
> # CONFIG_PCIEASPM_DEFAULT is not set
> # CONFIG_PCIEASPM_POWERSAVE is not set
> CONFIG_PCIEASPM_POWER_SUPERSAVE=3Dy
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PTM=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> # CONFIG_PCI_PF_STUB is not set
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_ECAM=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_COMPAQ=3Dy
> # CONFIG_HOTPLUG_PCI_COMPAQ_NVRAM is not set
> CONFIG_HOTPLUG_PCI_IBM=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> CONFIG_HOTPLUG_PCI_CPCI=3Dy
> CONFIG_HOTPLUG_PCI_CPCI_ZT5550=3Dy
> CONFIG_HOTPLUG_PCI_CPCI_GENERIC=3Dy
> # CONFIG_HOTPLUG_PCI_SHPC is not set
> =

> #
> # PCI controller drivers
> #
> CONFIG_PCI_FTPCI100=3Dy
> CONFIG_PCI_HOST_COMMON=3Dy
> CONFIG_PCI_HOST_GENERIC=3Dy
> # CONFIG_PCIE_XILINX is not set
> =

> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=3Dy
> CONFIG_PCIE_DW_HOST=3Dy
> # CONFIG_PCIE_DW_PLAT_HOST is not set
> # CONFIG_PCIE_INTEL_GW is not set
> CONFIG_PCI_MESON=3Dy
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
> CONFIG_PCIE_CADENCE=3Dy
> CONFIG_PCIE_CADENCE_HOST=3Dy
> CONFIG_PCIE_CADENCE_PLAT=3Dy
> CONFIG_PCIE_CADENCE_PLAT_HOST=3Dy
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
> CONFIG_PCI_SW_SWITCHTEC=3Dy
> # end of PCI switch controller drivers
> =

> CONFIG_PCCARD=3Dy
> # CONFIG_PCMCIA is not set
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> CONFIG_PCMCIA_PROBE=3Dy
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
> # CONFIG_RAPIDIO_DMA_ENGINE is not set
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
> # CONFIG_RAPIDIO_CHMAN is not set
> CONFIG_RAPIDIO_MPORT_CDEV=3Dy
> =

> #
> # RapidIO Switch drivers
> #
> # CONFIG_RAPIDIO_TSI57X is not set
> CONFIG_RAPIDIO_CPS_XX=3Dy
> CONFIG_RAPIDIO_TSI568=3Dy
> CONFIG_RAPIDIO_CPS_GEN2=3Dy
> CONFIG_RAPIDIO_RXS_GEN3=3Dy
> # end of RapidIO Switch drivers
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
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_FW_LOADER_COMPRESS=3Dy
> # CONFIG_FW_CACHE is not set
> # end of Firmware loader
> =

> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SLIMBUS=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> CONFIG_MOXTET=3Dy
> CONFIG_SIMPLE_PM_BUS=3Dy
> CONFIG_MHI_BUS=3Dy
> # end of Bus devices
> =

> # CONFIG_CONNECTOR is not set
> # CONFIG_GNSS is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_TESTS is not set
> =

> #
> # Partition parsers
> #
> # CONFIG_MTD_AR7_PARTS is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> # CONFIG_MTD_OF_PARTS is not set
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # end of Partition parsers
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
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dy
> # end of RAM/ROM/Flash chip drivers
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
> CONFIG_MTD_PHYSMAP_OF=3Dy
> # CONFIG_MTD_PHYSMAP_VERSATILE is not set
> # CONFIG_MTD_PHYSMAP_GEMINI is not set
> CONFIG_MTD_SCx200_DOCFLASH=3Dy
> CONFIG_MTD_AMD76XROM=3Dy
> CONFIG_MTD_ICHXROM=3Dy
> CONFIG_MTD_ESB2ROM=3Dy
> CONFIG_MTD_CK804XROM=3Dy
> # CONFIG_MTD_SCB2_FLASH is not set
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dy
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dy
> # end of Mapping drivers for chip access
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> CONFIG_MTD_DATAFLASH=3Dy
> CONFIG_MTD_DATAFLASH_WRITE_VERIFY=3Dy
> # CONFIG_MTD_DATAFLASH_OTP is not set
> CONFIG_MTD_MCHP23K256=3Dy
> CONFIG_MTD_SST25L=3Dy
> CONFIG_MTD_SLRAM=3Dy
> CONFIG_MTD_PHRAM=3Dy
> # CONFIG_MTD_MTDRAM is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> # end of Self-contained MTD device drivers
> =

> CONFIG_MTD_NAND_CORE=3Dy
> CONFIG_MTD_ONENAND=3Dy
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> CONFIG_MTD_ONENAND_OTP=3Dy
> CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> # CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
> CONFIG_MTD_RAW_NAND=3Dy
> CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> =

> #
> # Raw/parallel NAND flash controllers
> #
> CONFIG_MTD_NAND_DENALI=3Dy
> CONFIG_MTD_NAND_DENALI_PCI=3Dy
> CONFIG_MTD_NAND_DENALI_DT=3Dy
> # CONFIG_MTD_NAND_CAFE is not set
> CONFIG_MTD_NAND_CS553X=3Dy
> CONFIG_MTD_NAND_MXIC=3Dy
> CONFIG_MTD_NAND_GPIO=3Dy
> # CONFIG_MTD_NAND_PLATFORM is not set
> # CONFIG_MTD_NAND_CADENCE is not set
> CONFIG_MTD_NAND_ARASAN=3Dy
> =

> #
> # Misc
> #
> CONFIG_MTD_SM_COMMON=3Dy
> CONFIG_MTD_NAND_NANDSIM=3Dy
> CONFIG_MTD_NAND_RICOH=3Dy
> # CONFIG_MTD_NAND_DISKONCHIP is not set
> CONFIG_MTD_SPI_NAND=3Dy
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # end of LPDDR & LPDDR2 PCM memory drivers
> =

> CONFIG_MTD_SPI_NOR=3Dy
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> CONFIG_SPI_INTEL_SPI=3Dy
> CONFIG_SPI_INTEL_SPI_PCI=3Dy
> CONFIG_SPI_INTEL_SPI_PLATFORM=3Dy
> # CONFIG_MTD_UBI is not set
> # CONFIG_MTD_HYPERBUS is not set
> CONFIG_DTC=3Dy
> CONFIG_OF=3Dy
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_FLATTREE=3Dy
> CONFIG_OF_KOBJ=3Dy
> CONFIG_OF_DYNAMIC=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_RESOLVE=3Dy
> CONFIG_OF_OVERLAY=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_ISAPNP=3Dy
> CONFIG_PNPBIOS=3Dy
> # CONFIG_PNPBIOS_PROC_FS is not set
> CONFIG_PNPACPI=3Dy
> =

> #
> # NVME Support
> #
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> CONFIG_AD525X_DPOT_SPI=3Dy
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> CONFIG_PHANTOM=3Dy
> CONFIG_TIFM_CORE=3Dy
> # CONFIG_TIFM_7XX1 is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> CONFIG_CS5535_MFGPT=3Dy
> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> # CONFIG_CS5535_CLOCK_EVENT_SRC is not set
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dy
> # CONFIG_SENSORS_BH1770 is not set
> # CONFIG_SENSORS_APDS990X is not set
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dy
> CONFIG_PCH_PHUB=3Dy
> CONFIG_LATTICE_ECP3_CONFIG=3Dy
> CONFIG_SRAM=3Dy
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dy
> # CONFIG_PVPANIC is not set
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_AT25=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_93XX46=3Dy
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> CONFIG_EEPROM_EE1004=3Dy
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dy
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dy
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_INTEL_MEI=3Dy
> CONFIG_INTEL_MEI_ME=3Dy
> CONFIG_INTEL_MEI_TXE=3Dy
> # CONFIG_INTEL_MEI_HDCP is not set
> CONFIG_VMWARE_VMCI=3Dy
> =

> #
> # Intel MIC & related support
> #
> # CONFIG_VOP_BUS is not set
> # end of Intel MIC & related support
> =

> CONFIG_ECHO=3Dy
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=3Dy
> CONFIG_MISC_RTSX_USB=3Dy
> CONFIG_HABANA_AI=3Dy
> CONFIG_UACCE=3Dy
> # end of Misc devices
> =

> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # end of SCSI device support
> =

> CONFIG_FUSION=3Dy
> CONFIG_FUSION_MAX_SGE=3D128
> # CONFIG_FUSION_LOGGING is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
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
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NTB_NETDEV is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
> =

> #
> # Distributed Switch Architecture drivers
> #
> # end of Distributed Switch Architecture drivers
> =

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
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CIRRUS=3Dy
> # CONFIG_CS89x0 is not set
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
> # CONFIG_PCH_GBE is not set
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
> # CONFIG_QCA7000_SPI is not set
> # CONFIG_QCA7000_UART is not set
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
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
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_MICREL_KS8995MA is not set
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
> # CONFIG_USB4_NET is not set
> # CONFIG_NETDEVSIM is not set
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dy
> # CONFIG_INPUT_EVDEV is not set
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dy
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1050=3Dy
> CONFIG_KEYBOARD_QT1070=3Dy
> CONFIG_KEYBOARD_QT2160=3Dy
> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
> # CONFIG_KEYBOARD_LKKBD is not set
> CONFIG_KEYBOARD_GPIO=3Dy
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dy
> CONFIG_KEYBOARD_TCA8418=3Dy
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> CONFIG_KEYBOARD_MAX7359=3Dy
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dy
> CONFIG_KEYBOARD_NEWTON=3Dy
> CONFIG_KEYBOARD_OPENCORES=3Dy
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> CONFIG_KEYBOARD_SUNKBD=3Dy
> CONFIG_KEYBOARD_STMPE=3Dy
> CONFIG_KEYBOARD_OMAP4=3Dy
> CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
> CONFIG_KEYBOARD_TWL4030=3Dy
> CONFIG_KEYBOARD_XTKBD=3Dy
> CONFIG_KEYBOARD_CROS_EC=3Dy
> # CONFIG_KEYBOARD_CAP11XX is not set
> CONFIG_KEYBOARD_BCM=3Dy
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> CONFIG_JOYSTICK_A3D=3Dy
> # CONFIG_JOYSTICK_ADI is not set
> CONFIG_JOYSTICK_COBRA=3Dy
> CONFIG_JOYSTICK_GF2K=3Dy
> # CONFIG_JOYSTICK_GRIP is not set
> # CONFIG_JOYSTICK_GRIP_MP is not set
> CONFIG_JOYSTICK_GUILLEMOT=3Dy
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dy
> # CONFIG_JOYSTICK_IFORCE is not set
> # CONFIG_JOYSTICK_WARRIOR is not set
> # CONFIG_JOYSTICK_MAGELLAN is not set
> CONFIG_JOYSTICK_SPACEORB=3Dy
> CONFIG_JOYSTICK_SPACEBALL=3Dy
> CONFIG_JOYSTICK_STINGER=3Dy
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> CONFIG_JOYSTICK_AS5011=3Dy
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> # CONFIG_JOYSTICK_XPAD is not set
> CONFIG_JOYSTICK_PSXPAD_SPI=3Dy
> # CONFIG_JOYSTICK_PSXPAD_SPI_FF is not set
> # CONFIG_JOYSTICK_PXRC is not set
> # CONFIG_JOYSTICK_FSIA6B is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_AD714X=3Dy
> CONFIG_INPUT_AD714X_I2C=3Dy
> CONFIG_INPUT_AD714X_SPI=3Dy
> # CONFIG_INPUT_ATMEL_CAPTOUCH is not set
> CONFIG_INPUT_BMA150=3Dy
> # CONFIG_INPUT_E3X0_BUTTON is not set
> CONFIG_INPUT_MAX77693_HAPTIC=3Dy
> CONFIG_INPUT_MAX8997_HAPTIC=3Dy
> # CONFIG_INPUT_MC13783_PWRBUTTON is not set
> CONFIG_INPUT_MMA8450=3Dy
> CONFIG_INPUT_APANEL=3Dy
> CONFIG_INPUT_GPIO_BEEPER=3Dy
> CONFIG_INPUT_GPIO_DECODER=3Dy
> CONFIG_INPUT_GPIO_VIBRA=3Dy
> CONFIG_INPUT_CPCAP_PWRBUTTON=3Dy
> CONFIG_INPUT_WISTRON_BTNS=3Dy
> # CONFIG_INPUT_ATLAS_BTNS is not set
> CONFIG_INPUT_ATI_REMOTE2=3Dy
> CONFIG_INPUT_KEYSPAN_REMOTE=3Dy
> CONFIG_INPUT_KXTJ9=3Dy
> CONFIG_INPUT_POWERMATE=3Dy
> CONFIG_INPUT_YEALINK=3Dy
> CONFIG_INPUT_CM109=3Dy
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> # CONFIG_INPUT_RETU_PWRBUTTON is not set
> CONFIG_INPUT_TPS65218_PWRBUTTON=3Dy
> # CONFIG_INPUT_TWL4030_PWRBUTTON is not set
> CONFIG_INPUT_TWL4030_VIBRA=3Dy
> # CONFIG_INPUT_TWL6040_VIBRA is not set
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PALMAS_PWRBUTTON is not set
> # CONFIG_INPUT_PCF50633_PMU is not set
> CONFIG_INPUT_PCF8574=3Dy
> # CONFIG_INPUT_PWM_BEEPER is not set
> # CONFIG_INPUT_PWM_VIBRA is not set
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
> CONFIG_INPUT_DA9052_ONKEY=3Dy
> CONFIG_INPUT_DA9063_ONKEY=3Dy
> CONFIG_INPUT_PCAP=3Dy
> # CONFIG_INPUT_ADXL34X is not set
> CONFIG_INPUT_IMS_PCU=3Dy
> CONFIG_INPUT_IQS269A=3Dy
> CONFIG_INPUT_CMA3000=3Dy
> # CONFIG_INPUT_CMA3000_I2C is not set
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
> # CONFIG_INPUT_SOC_BUTTON_ARRAY is not set
> # CONFIG_INPUT_DRV260X_HAPTICS is not set
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> CONFIG_INPUT_STPMIC1_ONKEY=3Dy
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dy
> # CONFIG_RMI4_SPI is not set
> # CONFIG_RMI4_SMB is not set
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> # CONFIG_RMI4_F34 is not set
> # CONFIG_RMI4_F54 is not set
> # CONFIG_RMI4_F55 is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_SERIO_APBPS2=3Dy
> CONFIG_SERIO_GPIO_PS2=3Dy
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> # CONFIG_GAMEPORT_L4 is not set
> CONFIG_GAMEPORT_EMU10K1=3Dy
> CONFIG_GAMEPORT_FM801=3Dy
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
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> CONFIG_SERIAL_8250_FOURPORT=3Dy
> CONFIG_SERIAL_8250_ACCENT=3Dy
> CONFIG_SERIAL_8250_ASPEED_VUART=3Dy
> # CONFIG_SERIAL_8250_BOCA is not set
> CONFIG_SERIAL_8250_EXAR_ST16C554=3Dy
> CONFIG_SERIAL_8250_HUB6=3Dy
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> # CONFIG_SERIAL_8250_RSA is not set
> # CONFIG_SERIAL_8250_DW is not set
> CONFIG_SERIAL_8250_RT288X=3Dy
> # CONFIG_SERIAL_8250_LPSS is not set
> CONFIG_SERIAL_8250_MID=3Dy
> CONFIG_SERIAL_OF_PLATFORM=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> CONFIG_SERIAL_MAX310X=3Dy
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> CONFIG_SERIAL_SIFIVE=3Dy
> # CONFIG_SERIAL_SIFIVE_CONSOLE is not set
> CONFIG_SERIAL_LANTIQ=3Dy
> CONFIG_SERIAL_LANTIQ_CONSOLE=3Dy
> CONFIG_SERIAL_SCCNXP=3Dy
> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_IFX6X60 is not set
> CONFIG_SERIAL_PCH_UART=3Dy
> # CONFIG_SERIAL_PCH_UART_CONSOLE is not set
> CONFIG_SERIAL_XILINX_PS_UART=3Dy
> CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
> CONFIG_SERIAL_ARC=3Dy
> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> CONFIG_SERIAL_FSL_LPUART=3Dy
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
> CONFIG_SERIAL_SPRD=3Dy
> # CONFIG_SERIAL_SPRD_CONSOLE is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_ROCKETPORT is not set
> # CONFIG_CYCLADES is not set
> CONFIG_MOXA_INTELLIO=3Dy
> # CONFIG_MOXA_SMARTIO is not set
> CONFIG_SYNCLINK=3Dy
> CONFIG_SYNCLINKMP=3Dy
> CONFIG_SYNCLINK_GT=3Dy
> # CONFIG_ISI is not set
> # CONFIG_N_HDLC is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> CONFIG_TRACE_ROUTER=3Dy
> CONFIG_TRACE_SINK=3Dy
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_SERIAL_DEV_BUS=3Dy
> # CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> CONFIG_TTY_PRINTK=3Dy
> CONFIG_TTY_PRINTK_LEVEL=3D6
> CONFIG_VIRTIO_CONSOLE=3Dy
> # CONFIG_IPMI_HANDLER is not set
> CONFIG_IPMB_DEVICE_INTERFACE=3Dy
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> # CONFIG_HW_RANDOM_INTEL is not set
> CONFIG_HW_RANDOM_AMD=3Dy
> # CONFIG_HW_RANDOM_GEODE is not set
> CONFIG_HW_RANDOM_VIA=3Dy
> # CONFIG_HW_RANDOM_VIRTIO is not set
> CONFIG_HW_RANDOM_CCTRNG=3Dy
> # CONFIG_DTLK is not set
> # CONFIG_APPLICOM is not set
> CONFIG_SONYPI=3Dy
> CONFIG_MWAVE=3Dy
> CONFIG_SCx200_GPIO=3Dy
> # CONFIG_PC8736x_GPIO is not set
> CONFIG_NSC_GPIO=3Dy
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVKMEM is not set
> # CONFIG_NVRAM is not set
> CONFIG_DEVPORT=3Dy
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_SPI is not set
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> # CONFIG_TCG_NSC is not set
> # CONFIG_TCG_ATMEL is not set
> CONFIG_TCG_INFINEON=3Dy
> CONFIG_TCG_CRB=3Dy
> CONFIG_TCG_VTPM_PROXY=3Dy
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> CONFIG_TCG_TIS_ST33ZP24_SPI=3Dy
> CONFIG_TELCLOCK=3Dy
> # CONFIG_XILLYBUS is not set
> # end of Character devices
> =

> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_GPMUX=3Dy
> CONFIG_I2C_MUX_LTC4306=3Dy
> # CONFIG_I2C_MUX_PCA9541 is not set
> # CONFIG_I2C_MUX_PCA954x is not set
> CONFIG_I2C_MUX_PINCTRL=3Dy
> CONFIG_I2C_MUX_REG=3Dy
> CONFIG_I2C_DEMUX_PINCTRL=3Dy
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> =

> # CONFIG_I2C_HELPER_AUTO is not set
> # CONFIG_I2C_SMBUS is not set
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
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
> CONFIG_I2C_ALI1535=3Dy
> CONFIG_I2C_ALI1563=3Dy
> CONFIG_I2C_ALI15X3=3Dy
> CONFIG_I2C_AMD756=3Dy
> # CONFIG_I2C_AMD756_S4882 is not set
> CONFIG_I2C_AMD8111=3Dy
> # CONFIG_I2C_AMD_MP2 is not set
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> CONFIG_I2C_NFORCE2=3Dy
> # CONFIG_I2C_NFORCE2_S4985 is not set
> CONFIG_I2C_NVIDIA_GPU=3Dy
> CONFIG_I2C_SIS5595=3Dy
> CONFIG_I2C_SIS630=3Dy
> # CONFIG_I2C_SIS96X is not set
> CONFIG_I2C_VIA=3Dy
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
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> # CONFIG_I2C_EG20T is not set
> CONFIG_I2C_EMEV2=3Dy
> # CONFIG_I2C_GPIO is not set
> CONFIG_I2C_OCORES=3Dy
> CONFIG_I2C_PCA_PLATFORM=3Dy
> CONFIG_I2C_PXA=3Dy
> CONFIG_I2C_PXA_PCI=3Dy
> # CONFIG_I2C_RK3X is not set
> CONFIG_I2C_SIMTEC=3Dy
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dy
> # CONFIG_I2C_DLN2 is not set
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> CONFIG_I2C_TAOS_EVM=3Dy
> # CONFIG_I2C_TINY_USB is not set
> # CONFIG_I2C_VIPERBOARD is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_ELEKTOR=3Dy
> # CONFIG_I2C_PCA_ISA is not set
> CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> # CONFIG_SCx200_ACB is not set
> CONFIG_I2C_FSI=3Dy
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> CONFIG_SPI=3Dy
> CONFIG_SPI_DEBUG=3Dy
> CONFIG_SPI_MASTER=3Dy
> CONFIG_SPI_MEM=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> CONFIG_SPI_BITBANG=3Dy
> # CONFIG_SPI_CADENCE is not set
> CONFIG_SPI_DESIGNWARE=3Dy
> # CONFIG_SPI_DW_DMA is not set
> CONFIG_SPI_DW_PCI=3Dy
> CONFIG_SPI_DW_MMIO=3Dy
> CONFIG_SPI_DLN2=3Dy
> # CONFIG_SPI_FSI is not set
> CONFIG_SPI_NXP_FLEXSPI=3Dy
> CONFIG_SPI_GPIO=3Dy
> CONFIG_SPI_FSL_LIB=3Dy
> CONFIG_SPI_FSL_SPI=3Dy
> CONFIG_SPI_OC_TINY=3Dy
> # CONFIG_SPI_PXA2XX is not set
> CONFIG_SPI_ROCKCHIP=3Dy
> # CONFIG_SPI_SC18IS602 is not set
> CONFIG_SPI_SIFIVE=3Dy
> CONFIG_SPI_MXIC=3Dy
> CONFIG_SPI_TOPCLIFF_PCH=3Dy
> CONFIG_SPI_XCOMM=3Dy
> CONFIG_SPI_XILINX=3Dy
> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
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
> CONFIG_SPI_SPIDEV=3Dy
> # CONFIG_SPI_LOOPBACK_TEST is not set
> # CONFIG_SPI_TLE62X0 is not set
> CONFIG_SPI_SLAVE=3Dy
> CONFIG_SPI_SLAVE_TIME=3Dy
> CONFIG_SPI_SLAVE_SYSTEM_CONTROL=3Dy
> CONFIG_SPMI=3Dy
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> CONFIG_NTP_PPS=3Dy
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dy
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_GPIO=3Dy
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # CONFIG_PTP_1588_CLOCK_PCH is not set
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_AMD is not set
> # CONFIG_PINCTRL_DA9062 is not set
> # CONFIG_PINCTRL_MCP23S08 is not set
> CONFIG_PINCTRL_SINGLE=3Dy
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_STMFX=3Dy
> CONFIG_PINCTRL_PALMAS=3Dy
> # CONFIG_PINCTRL_OCELOT is not set
> # CONFIG_PINCTRL_BAYTRAIL is not set
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> # CONFIG_PINCTRL_BROXTON is not set
> # CONFIG_PINCTRL_CANNONLAKE is not set
> # CONFIG_PINCTRL_CEDARFORK is not set
> # CONFIG_PINCTRL_DENVERTON is not set
> # CONFIG_PINCTRL_GEMINILAKE is not set
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> # CONFIG_PINCTRL_LEWISBURG is not set
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> # CONFIG_PINCTRL_TIGERLAKE is not set
> CONFIG_PINCTRL_EQUILIBRIUM=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_OF_GPIO=3Dy
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
> CONFIG_GPIO_74XX_MMIO=3Dy
> CONFIG_GPIO_ALTERA=3Dy
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_CADENCE=3Dy
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_FTGPIO010 is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_GRGPIO=3Dy
> CONFIG_GPIO_HLWD=3Dy
> CONFIG_GPIO_ICH=3Dy
> CONFIG_GPIO_LOGICVC=3Dy
> CONFIG_GPIO_MB86S7X=3Dy
> CONFIG_GPIO_SAMA5D2_PIOBU=3Dy
> # CONFIG_GPIO_SIFIVE is not set
> # CONFIG_GPIO_SIOX is not set
> CONFIG_GPIO_SYSCON=3Dy
> CONFIG_GPIO_VX855=3Dy
> # CONFIG_GPIO_WCD934X is not set
> CONFIG_GPIO_XILINX=3Dy
> CONFIG_GPIO_AMD_FCH=3Dy
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_IT87=3Dy
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> CONFIG_GPIO_ADP5588_IRQ=3Dy
> # CONFIG_GPIO_ADNP is not set
> # CONFIG_GPIO_GW_PLD is not set
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dy
> CONFIG_GPIO_MAX732X_IRQ=3Dy
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCF857X=3Dy
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_BD70528=3Dy
> CONFIG_GPIO_BD71828=3Dy
> CONFIG_GPIO_CS5535=3Dy
> CONFIG_GPIO_DA9052=3Dy
> # CONFIG_GPIO_DLN2 is not set
> CONFIG_GPIO_JANZ_TTL=3Dy
> CONFIG_GPIO_LP3943=3Dy
> CONFIG_GPIO_LP873X=3Dy
> CONFIG_GPIO_PALMAS=3Dy
> CONFIG_GPIO_RC5T583=3Dy
> CONFIG_GPIO_STMPE=3Dy
> CONFIG_GPIO_TIMBERDALE=3Dy
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS6586X=3Dy
> # CONFIG_GPIO_TPS65910 is not set
> # CONFIG_GPIO_TPS65912 is not set
> # CONFIG_GPIO_TQMX86 is not set
> CONFIG_GPIO_TWL4030=3Dy
> # CONFIG_GPIO_TWL6040 is not set
> CONFIG_GPIO_WM8350=3Dy
> CONFIG_GPIO_WM8994=3Dy
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> CONFIG_GPIO_ML_IOH=3Dy
> CONFIG_GPIO_PCH=3Dy
> CONFIG_GPIO_PCI_IDIO_16=3Dy
> CONFIG_GPIO_PCIE_IDIO_24=3Dy
> CONFIG_GPIO_RDC321X=3Dy
> # CONFIG_GPIO_SODAVILLE is not set
> # end of PCI GPIO expanders
> =

> #
> # SPI GPIO expanders
> #
> # CONFIG_GPIO_74X164 is not set
> CONFIG_GPIO_MAX3191X=3Dy
> CONFIG_GPIO_MAX7301=3Dy
> # CONFIG_GPIO_MC33880 is not set
> CONFIG_GPIO_PISOSR=3Dy
> CONFIG_GPIO_XRA1403=3Dy
> CONFIG_GPIO_MOXTET=3Dy
> # end of SPI GPIO expanders
> =

> #
> # USB GPIO expanders
> #
> # CONFIG_GPIO_VIPERBOARD is not set
> # end of USB GPIO expanders
> =

> # CONFIG_GPIO_AGGREGATOR is not set
> # CONFIG_GPIO_MOCKUP is not set
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> # CONFIG_W1_MASTER_DS2490 is not set
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> # CONFIG_W1_MASTER_GPIO is not set
> CONFIG_W1_MASTER_SGI=3Dy
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> # CONFIG_W1_SLAVE_SMEM is not set
> # CONFIG_W1_SLAVE_DS2405 is not set
> CONFIG_W1_SLAVE_DS2408=3Dy
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> CONFIG_W1_SLAVE_DS2805=3Dy
> CONFIG_W1_SLAVE_DS2430=3Dy
> # CONFIG_W1_SLAVE_DS2431 is not set
> # CONFIG_W1_SLAVE_DS2433 is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> # CONFIG_W1_SLAVE_DS250X is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_DS28E17=3Dy
> # end of 1-wire Slaves
> =

> CONFIG_POWER_AVS=3Dy
> # CONFIG_QCOM_CPR is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_GPIO is not set
> # CONFIG_POWER_RESET_GPIO_RESTART is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_RESET_SYSCON=3Dy
> CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
> CONFIG_REBOOT_MODE=3Dy
> CONFIG_SYSCON_REBOOT_MODE=3Dy
> # CONFIG_NVMEM_REBOOT_MODE is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> # CONFIG_POWER_SUPPLY_HWMON is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_WM8350_POWER=3Dy
> # CONFIG_TEST_POWER is not set
> CONFIG_CHARGER_ADP5061=3Dy
> CONFIG_BATTERY_CW2015=3Dy
> CONFIG_BATTERY_DS2760=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> # CONFIG_BATTERY_SBS is not set
> CONFIG_CHARGER_SBS=3Dy
> # CONFIG_MANAGER_SBS is not set
> CONFIG_BATTERY_BQ27XXX=3Dy
> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
> # CONFIG_BATTERY_BQ27XXX_HDQ is not set
> CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=3Dy
> CONFIG_BATTERY_DA9052=3Dy
> # CONFIG_BATTERY_DA9150 is not set
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> # CONFIG_BATTERY_MAX1721X is not set
> CONFIG_CHARGER_PCF50633=3Dy
> CONFIG_CHARGER_ISP1704=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_GPIO=3Dy
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_LT3651=3Dy
> CONFIG_CHARGER_MAX14577=3Dy
> CONFIG_CHARGER_DETECTOR_MAX14656=3Dy
> CONFIG_CHARGER_MAX77693=3Dy
> # CONFIG_CHARGER_MAX8997 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> CONFIG_CHARGER_BQ24257=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> # CONFIG_CHARGER_TPS65217 is not set
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_RT5033=3Dy
> CONFIG_CHARGER_RT9455=3Dy
> # CONFIG_CHARGER_CROS_USBPD is not set
> CONFIG_CHARGER_UCS1002=3Dy
> # CONFIG_CHARGER_BD70528 is not set
> CONFIG_CHARGER_BD99954=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7314=3Dy
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM1177=3Dy
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_AS370=3Dy
> # CONFIG_SENSORS_ASC7621 is not set
> CONFIG_SENSORS_AXI_FAN_CONTROL=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_AMD_ENERGY=3Dy
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> CONFIG_SENSORS_ASPEED=3Dy
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> # CONFIG_SENSORS_DELL_SMM is not set
> # CONFIG_SENSORS_DA9052_ADC is not set
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_GSC=3Dy
> # CONFIG_SENSORS_MC13783_ADC is not set
> CONFIG_SENSORS_FSCHMD=3Dy
> # CONFIG_SENSORS_GL518SM is not set
> # CONFIG_SENSORS_GL520SM is not set
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=3Dy
> # CONFIG_SENSORS_LINEAGE is not set
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC2947=3Dy
> CONFIG_SENSORS_LTC2947_I2C=3Dy
> CONFIG_SENSORS_LTC2947_SPI=3Dy
> # CONFIG_SENSORS_LTC2990 is not set
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dy
> CONFIG_SENSORS_MAX1111=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> # CONFIG_SENSORS_MAX1668 is not set
> CONFIG_SENSORS_MAX197=3Dy
> # CONFIG_SENSORS_MAX31722 is not set
> CONFIG_SENSORS_MAX31730=3Dy
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_MLXREG_FAN=3Dy
> CONFIG_SENSORS_TC654=3Dy
> CONFIG_SENSORS_ADCXX=3Dy
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM70=3Dy
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> # CONFIG_SENSORS_LM92 is not set
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> # CONFIG_SENSORS_LM95241 is not set
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dy
> # CONFIG_SENSORS_PC87427 is not set
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> # CONFIG_SENSORS_NCT6683 is not set
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NPCM7XX=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_BEL_PFE=3Dy
> CONFIG_SENSORS_IBM_CFFPS=3Dy
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> CONFIG_SENSORS_IR35221=3Dy
> CONFIG_SENSORS_IR38064=3Dy
> CONFIG_SENSORS_IRPS5401=3Dy
> CONFIG_SENSORS_ISL68137=3Dy
> # CONFIG_SENSORS_LM25066 is not set
> # CONFIG_SENSORS_LTC2978 is not set
> CONFIG_SENSORS_LTC3815=3Dy
> CONFIG_SENSORS_MAX16064=3Dy
> CONFIG_SENSORS_MAX16601=3Dy
> CONFIG_SENSORS_MAX20730=3Dy
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> # CONFIG_SENSORS_MAX34440 is not set
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_PXE1610=3Dy
> # CONFIG_SENSORS_TPS40422 is not set
> # CONFIG_SENSORS_TPS53679 is not set
> # CONFIG_SENSORS_UCD9000 is not set
> CONFIG_SENSORS_UCD9200=3Dy
> CONFIG_SENSORS_XDPE122=3Dy
> # CONFIG_SENSORS_ZL6100 is not set
> # CONFIG_SENSORS_PWM_FAN is not set
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHT3x=3Dy
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_STTS751=3Dy
> # CONFIG_SENSORS_SMM665 is not set
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_ADS7871=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> # CONFIG_SENSORS_INA3221 is not set
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP103=3Dy
> CONFIG_SENSORS_TMP108=3Dy
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dy
> # CONFIG_SENSORS_TMP513 is not set
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83773G=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> # CONFIG_SENSORS_WM8350 is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_OF=3Dy
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_CPU_THERMAL is not set
> CONFIG_CLOCK_THERMAL=3Dy
> # CONFIG_DEVFREQ_THERMAL is not set
> # CONFIG_THERMAL_EMULATION is not set
> CONFIG_THERMAL_MMIO=3Dy
> CONFIG_DA9062_THERMAL=3Dy
> =

> #
> # Intel thermal drivers
> #
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> =

> # CONFIG_INTEL_PCH_THERMAL is not set
> # end of Intel thermal drivers
> =

> # CONFIG_TI_SOC_THERMAL is not set
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> # CONFIG_SSB_SDIOHOST is not set
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> CONFIG_SSB_DRIVER_PCICORE=3Dy
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_SFLASH=3Dy
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> # CONFIG_MFD_ACT8945A is not set
> CONFIG_MFD_AS3711=3Dy
> # CONFIG_MFD_AS3722 is not set
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_ATMEL_FLEXCOM=3Dy
> CONFIG_MFD_ATMEL_HLCDC=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> # CONFIG_MFD_BD9571MWV is not set
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_CROS_EC_DEV=3Dy
> # CONFIG_MFD_MADERA is not set
> # CONFIG_PMIC_DA903X is not set
> CONFIG_PMIC_DA9052=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> CONFIG_MFD_DA9052_I2C=3Dy
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9062=3Dy
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_DLN2=3Dy
> CONFIG_MFD_GATEWORKS_GSC=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_MFD_MP2629 is not set
> CONFIG_MFD_HI6421_PMIC=3Dy
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> # CONFIG_MFD_IQS62X is not set
> CONFIG_MFD_JANZ_CMODIO=3Dy
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77620 is not set
> # CONFIG_MFD_MAX77650 is not set
> CONFIG_MFD_MAX77686=3Dy
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> CONFIG_MFD_MAX8997=3Dy
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6360=3Dy
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_EZX_PCAP=3Dy
> CONFIG_MFD_CPCAP=3Dy
> CONFIG_MFD_VIPERBOARD=3Dy
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> CONFIG_PCF50633_GPIO=3Dy
> CONFIG_MFD_RDC321X=3Dy
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RC5T583=3Dy
> # CONFIG_MFD_RK808 is not set
> # CONFIG_MFD_RN5T618 is not set
> CONFIG_MFD_SEC_CORE=3Dy
> # CONFIG_MFD_SI476X_CORE is not set
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> CONFIG_ABX500_CORE=3Dy
> # CONFIG_AB3100_CORE is not set
> CONFIG_MFD_STMPE=3Dy
> =

> #
> # STMicroelectronics STMPE Interface Drivers
> #
> CONFIG_STMPE_I2C=3Dy
> # CONFIG_STMPE_SPI is not set
> # end of STMicroelectronics STMPE Interface Drivers
> =

> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> CONFIG_MFD_PALMAS=3Dy
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dy
> # CONFIG_MFD_TPS68470 is not set
> CONFIG_MFD_TI_LP873X=3Dy
> # CONFIG_MFD_TI_LP87565 is not set
> # CONFIG_MFD_TPS65218 is not set
> CONFIG_MFD_TPS6586X=3Dy
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS65912_SPI is not set
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> CONFIG_TWL6040_CORE=3Dy
> # CONFIG_MFD_WL1273_CORE is not set
> CONFIG_MFD_LM3533=3Dy
> CONFIG_MFD_TIMBERDALE=3Dy
> # CONFIG_MFD_TC3589X is not set
> CONFIG_MFD_TQMX86=3Dy
> CONFIG_MFD_VX855=3Dy
> # CONFIG_MFD_LOCHNAGAR is not set
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_ARIZONA_SPI is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> # CONFIG_MFD_ROHM_BD718XX is not set
> CONFIG_MFD_ROHM_BD70528=3Dy
> CONFIG_MFD_ROHM_BD71828=3Dy
> CONFIG_MFD_STPMIC1=3Dy
> CONFIG_MFD_STMFX=3Dy
> CONFIG_MFD_WCD934X=3Dy
> # CONFIG_RAVE_SP_CORE is not set
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> # CONFIG_REGULATOR_FIXED_VOLTAGE is not set
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> # CONFIG_REGULATOR_88PG86X is not set
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> # CONFIG_REGULATOR_AAT2870 is not set
> CONFIG_REGULATOR_AS3711=3Dy
> CONFIG_REGULATOR_BCM590XX=3Dy
> CONFIG_REGULATOR_BD70528=3Dy
> # CONFIG_REGULATOR_BD71828 is not set
> # CONFIG_REGULATOR_CPCAP is not set
> CONFIG_REGULATOR_DA9052=3Dy
> CONFIG_REGULATOR_DA9062=3Dy
> CONFIG_REGULATOR_DA9063=3Dy
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_HI6421=3Dy
> CONFIG_REGULATOR_HI6421V530=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dy
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP873X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> CONFIG_REGULATOR_LTC3676=3Dy
> # CONFIG_REGULATOR_MAX14577 is not set
> CONFIG_REGULATOR_MAX1586=3Dy
> # CONFIG_REGULATOR_MAX8649 is not set
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8973=3Dy
> CONFIG_REGULATOR_MAX8997=3Dy
> CONFIG_REGULATOR_MAX77686=3Dy
> # CONFIG_REGULATOR_MAX77693 is not set
> CONFIG_REGULATOR_MAX77802=3Dy
> # CONFIG_REGULATOR_MAX77826 is not set
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> CONFIG_REGULATOR_MC13892=3Dy
> # CONFIG_REGULATOR_MCP16502 is not set
> CONFIG_REGULATOR_MP5416=3Dy
> CONFIG_REGULATOR_MP8859=3Dy
> CONFIG_REGULATOR_MP886X=3Dy
> CONFIG_REGULATOR_MPQ7920=3Dy
> CONFIG_REGULATOR_MT6311=3Dy
> # CONFIG_REGULATOR_PALMAS is not set
> CONFIG_REGULATOR_PCAP=3Dy
> # CONFIG_REGULATOR_PCF50633 is not set
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_PWM=3Dy
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> CONFIG_REGULATOR_RC5T583=3Dy
> CONFIG_REGULATOR_RT5033=3Dy
> # CONFIG_REGULATOR_S2MPA01 is not set
> # CONFIG_REGULATOR_S2MPS11 is not set
> CONFIG_REGULATOR_S5M8767=3Dy
> CONFIG_REGULATOR_SKY81452=3Dy
> CONFIG_REGULATOR_SLG51000=3Dy
> CONFIG_REGULATOR_STPMIC1=3Dy
> CONFIG_REGULATOR_SY8106A=3Dy
> # CONFIG_REGULATOR_SY8824X is not set
> # CONFIG_REGULATOR_TPS51632 is not set
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=3Dy
> CONFIG_REGULATOR_TPS6507X=3Dy
> # CONFIG_REGULATOR_TPS65086 is not set
> CONFIG_REGULATOR_TPS65132=3Dy
> # CONFIG_REGULATOR_TPS65217 is not set
> CONFIG_REGULATOR_TPS6524X=3Dy
> CONFIG_REGULATOR_TPS6586X=3Dy
> CONFIG_REGULATOR_TPS65910=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
> CONFIG_REGULATOR_TPS80031=3Dy
> CONFIG_REGULATOR_TWL4030=3Dy
> CONFIG_REGULATOR_VCTRL=3Dy
> CONFIG_REGULATOR_WM8350=3Dy
> CONFIG_REGULATOR_WM8994=3Dy
> # CONFIG_RC_CORE is not set
> CONFIG_CEC_CORE=3Dy
> CONFIG_CEC_NOTIFIER=3Dy
> CONFIG_CEC_PIN=3Dy
> # CONFIG_CEC_PIN_ERROR_INJ is not set
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> # CONFIG_CEC_CROS_EC is not set
> CONFIG_CEC_GPIO=3Dy
> CONFIG_USB_PULSE8_CEC=3Dy
> CONFIG_USB_RAINSHADOW_CEC=3Dy
> CONFIG_MEDIA_SUPPORT=3Dy
> CONFIG_MEDIA_SUPPORT_FILTER=3Dy
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> =

> #
> # Media device types
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> # CONFIG_MEDIA_PLATFORM_SUPPORT is not set
> # CONFIG_MEDIA_TEST_SUPPORT is not set
> # end of Media device types
> =

> CONFIG_VIDEO_DEV=3Dy
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_DVB_CORE=3Dy
> =

> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2=3Dy
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_V4L2_FLASH_LED_CLASS=3Dy
> CONFIG_V4L2_FWNODE=3Dy
> # end of Video4Linux options
> =

> #
> # Media controller options
> #
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> # end of Media controller options
> =

> #
> # Digital TV options
> #
> CONFIG_DVB_MMAP=3Dy
> CONFIG_DVB_NET=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> # CONFIG_DVB_DYNAMIC_MINORS is not set
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> CONFIG_DVB_ULE_DEBUG=3Dy
> # end of Digital TV options
> =

> #
> # Media drivers
> #
> =

> #
> # Drivers filtered as selected at 'Filter media drivers'
> #
> # CONFIG_MEDIA_USB_SUPPORT is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_RADIO_ADAPTERS is not set
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_V4L2=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> CONFIG_VIDEOBUF2_DMA_SG=3Dy
> # end of Media drivers
> =

> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=3Dy
> =

> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_TVAUDIO=3Dy
> CONFIG_VIDEO_TDA7432=3Dy
> CONFIG_VIDEO_TDA9840=3Dy
> CONFIG_VIDEO_TEA6415C=3Dy
> CONFIG_VIDEO_TEA6420=3Dy
> CONFIG_VIDEO_MSP3400=3Dy
> CONFIG_VIDEO_CS3308=3Dy
> CONFIG_VIDEO_CS5345=3Dy
> # CONFIG_VIDEO_CS53L32A is not set
> CONFIG_VIDEO_TLV320AIC23B=3Dy
> CONFIG_VIDEO_UDA1342=3Dy
> CONFIG_VIDEO_WM8775=3Dy
> CONFIG_VIDEO_WM8739=3Dy
> CONFIG_VIDEO_VP27SMPX=3Dy
> CONFIG_VIDEO_SONY_BTF_MPX=3Dy
> # end of Audio decoders, processors and mixers
> =

> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=3Dy
> # end of RDS decoders
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7180 is not set
> # CONFIG_VIDEO_ADV7183 is not set
> CONFIG_VIDEO_ADV748X=3Dy
> CONFIG_VIDEO_ADV7604=3Dy
> CONFIG_VIDEO_ADV7604_CEC=3Dy
> CONFIG_VIDEO_ADV7842=3Dy
> CONFIG_VIDEO_ADV7842_CEC=3Dy
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> CONFIG_VIDEO_BT866=3Dy
> CONFIG_VIDEO_KS0127=3Dy
> CONFIG_VIDEO_ML86V7667=3Dy
> # CONFIG_VIDEO_SAA7110 is not set
> CONFIG_VIDEO_SAA711X=3Dy
> # CONFIG_VIDEO_TC358743 is not set
> CONFIG_VIDEO_TVP514X=3Dy
> # CONFIG_VIDEO_TVP5150 is not set
> CONFIG_VIDEO_TVP7002=3Dy
> # CONFIG_VIDEO_TW2804 is not set
> CONFIG_VIDEO_TW9903=3Dy
> CONFIG_VIDEO_TW9906=3Dy
> # CONFIG_VIDEO_TW9910 is not set
> # CONFIG_VIDEO_VPX3220 is not set
> =

> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=3Dy
> CONFIG_VIDEO_CX25840=3Dy
> # end of Video decoders
> =

> #
> # Video encoders
> #
> CONFIG_VIDEO_SAA7127=3Dy
> CONFIG_VIDEO_SAA7185=3Dy
> # CONFIG_VIDEO_ADV7170 is not set
> CONFIG_VIDEO_ADV7175=3Dy
> CONFIG_VIDEO_ADV7343=3Dy
> CONFIG_VIDEO_ADV7393=3Dy
> CONFIG_VIDEO_AD9389B=3Dy
> # CONFIG_VIDEO_AK881X is not set
> # CONFIG_VIDEO_THS8200 is not set
> # end of Video encoders
> =

> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=3Dy
> # CONFIG_VIDEO_UPD64083 is not set
> # end of Video improvement chips
> =

> #
> # Audio/Video compression chips
> #
> CONFIG_VIDEO_SAA6752HS=3Dy
> # end of Audio/Video compression chips
> =

> #
> # SDR tuner chips
> #
> # end of SDR tuner chips
> =

> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_THS7303=3Dy
> CONFIG_VIDEO_M52790=3Dy
> CONFIG_VIDEO_I2C=3Dy
> CONFIG_VIDEO_ST_MIPID02=3Dy
> # end of Miscellaneous helper chips
> =

> #
> # SPI helper chips
> #
> CONFIG_VIDEO_GS1662=3Dy
> # end of SPI helper chips
> =

> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=3Dy
> # end of Media SPI Adapters
> =

> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA18250=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> CONFIG_MEDIA_TUNER_TEA5761=3Dy
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MSI001=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
> # CONFIG_MEDIA_TUNER_MT2063 is not set
> # CONFIG_MEDIA_TUNER_MT2266 is not set
> CONFIG_MEDIA_TUNER_MT2131=3Dy
> # CONFIG_MEDIA_TUNER_QT1010 is not set
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> # CONFIG_MEDIA_TUNER_MXL5005S is not set
> CONFIG_MEDIA_TUNER_MXL5007T=3Dy
> # CONFIG_MEDIA_TUNER_MC44S803 is not set
> CONFIG_MEDIA_TUNER_MAX2165=3Dy
> CONFIG_MEDIA_TUNER_TDA18218=3Dy
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> CONFIG_MEDIA_TUNER_FC0012=3Dy
> CONFIG_MEDIA_TUNER_FC0013=3Dy
> CONFIG_MEDIA_TUNER_TDA18212=3Dy
> # CONFIG_MEDIA_TUNER_E4000 is not set
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
> CONFIG_MEDIA_TUNER_TUA9001=3Dy
> CONFIG_MEDIA_TUNER_SI2157=3Dy
> # CONFIG_MEDIA_TUNER_IT913X is not set
> # CONFIG_MEDIA_TUNER_R820T is not set
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
> # CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> # CONFIG_DVB_STB0899 is not set
> CONFIG_DVB_STB6100=3Dy
> CONFIG_DVB_STV090x=3Dy
> # CONFIG_DVB_STV0910 is not set
> # CONFIG_DVB_STV6110x is not set
> # CONFIG_DVB_STV6111 is not set
> # CONFIG_DVB_MXL5XX is not set
> CONFIG_DVB_M88DS3103=3Dy
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dy
> CONFIG_DVB_TDA18271C2DD=3Dy
> # CONFIG_DVB_SI2165 is not set
> CONFIG_DVB_MN88472=3Dy
> CONFIG_DVB_MN88473=3Dy
> =

> #
> # DVB-S (satellite) frontends
> #
> # CONFIG_DVB_CX24110 is not set
> CONFIG_DVB_CX24123=3Dy
> CONFIG_DVB_MT312=3Dy
> CONFIG_DVB_ZL10036=3Dy
> # CONFIG_DVB_ZL10039 is not set
> # CONFIG_DVB_S5H1420 is not set
> CONFIG_DVB_STV0288=3Dy
> CONFIG_DVB_STB6000=3Dy
> # CONFIG_DVB_STV0299 is not set
> # CONFIG_DVB_STV6110 is not set
> # CONFIG_DVB_STV0900 is not set
> CONFIG_DVB_TDA8083=3Dy
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=3Dy
> # CONFIG_DVB_VES1X93 is not set
> CONFIG_DVB_TUNER_ITD1000=3Dy
> CONFIG_DVB_TUNER_CX24113=3Dy
> CONFIG_DVB_TDA826X=3Dy
> CONFIG_DVB_TUA6100=3Dy
> CONFIG_DVB_CX24116=3Dy
> CONFIG_DVB_CX24117=3Dy
> CONFIG_DVB_CX24120=3Dy
> CONFIG_DVB_SI21XX=3Dy
> CONFIG_DVB_TS2020=3Dy
> # CONFIG_DVB_DS3000 is not set
> CONFIG_DVB_MB86A16=3Dy
> CONFIG_DVB_TDA10071=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> CONFIG_DVB_SP887X=3Dy
> CONFIG_DVB_CX22700=3Dy
> # CONFIG_DVB_CX22702 is not set
> CONFIG_DVB_S5H1432=3Dy
> # CONFIG_DVB_DRXD is not set
> CONFIG_DVB_L64781=3Dy
> CONFIG_DVB_TDA1004X=3Dy
> CONFIG_DVB_NXT6000=3Dy
> CONFIG_DVB_MT352=3Dy
> # CONFIG_DVB_ZL10353 is not set
> # CONFIG_DVB_DIB3000MB is not set
> # CONFIG_DVB_DIB3000MC is not set
> # CONFIG_DVB_DIB7000M is not set
> CONFIG_DVB_DIB7000P=3Dy
> CONFIG_DVB_DIB9000=3Dy
> # CONFIG_DVB_TDA10048 is not set
> # CONFIG_DVB_AF9013 is not set
> CONFIG_DVB_EC100=3Dy
> CONFIG_DVB_STV0367=3Dy
> CONFIG_DVB_CXD2820R=3Dy
> CONFIG_DVB_CXD2841ER=3Dy
> CONFIG_DVB_RTL2830=3Dy
> # CONFIG_DVB_RTL2832 is not set
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_ZD1301_DEMOD=3Dy
> # CONFIG_DVB_CXD2880 is not set
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dy
> CONFIG_DVB_TDA10021=3Dy
> CONFIG_DVB_TDA10023=3Dy
> CONFIG_DVB_STV0297=3Dy
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dy
> CONFIG_DVB_OR51211=3Dy
> CONFIG_DVB_OR51132=3Dy
> CONFIG_DVB_BCM3510=3Dy
> CONFIG_DVB_LGDT330X=3Dy
> CONFIG_DVB_LGDT3305=3Dy
> CONFIG_DVB_LGDT3306A=3Dy
> CONFIG_DVB_LG2160=3Dy
> # CONFIG_DVB_S5H1409 is not set
> CONFIG_DVB_AU8522=3Dy
> # CONFIG_DVB_AU8522_DTV is not set
> CONFIG_DVB_AU8522_V4L=3Dy
> CONFIG_DVB_S5H1411=3Dy
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_S921=3Dy
> # CONFIG_DVB_DIB8000 is not set
> CONFIG_DVB_MB86A20S=3Dy
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_TC90522 is not set
> # CONFIG_DVB_MN88443X is not set
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dy
> # CONFIG_DVB_TUNER_DIB0070 is not set
> # CONFIG_DVB_TUNER_DIB0090 is not set
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dy
> CONFIG_DVB_LNBH25=3Dy
> # CONFIG_DVB_LNBH29 is not set
> CONFIG_DVB_LNBP21=3Dy
> # CONFIG_DVB_LNBP22 is not set
> CONFIG_DVB_ISL6405=3Dy
> CONFIG_DVB_ISL6421=3Dy
> CONFIG_DVB_ISL6423=3Dy
> # CONFIG_DVB_A8293 is not set
> CONFIG_DVB_LGS8GL5=3Dy
> # CONFIG_DVB_LGS8GXX is not set
> CONFIG_DVB_ATBM8830=3Dy
> CONFIG_DVB_TDA665x=3Dy
> # CONFIG_DVB_IX2505V is not set
> CONFIG_DVB_M88RS2000=3Dy
> CONFIG_DVB_AF9033=3Dy
> # CONFIG_DVB_HORUS3A is not set
> # CONFIG_DVB_ASCOT2E is not set
> CONFIG_DVB_HELENE=3Dy
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> # CONFIG_DVB_CXD2099 is not set
> CONFIG_DVB_SP2=3Dy
> # end of Customise DVB Frontends
> # end of Media ancillary drivers
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_INTEL_GTT=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dy
> CONFIG_DRM_MIPI_DBI=3Dy
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> CONFIG_DRM_DEBUG_MM=3Dy
> CONFIG_DRM_DEBUG_SELFTEST=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_FBDEV_OVERALLOC=3D100
> CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM=3Dy
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=3Dy
> CONFIG_DRM_TTM_DMA_PAGE_POOL=3Dy
> CONFIG_DRM_VRAM_HELPER=3Dy
> CONFIG_DRM_TTM_HELPER=3Dy
> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> CONFIG_DRM_KMS_CMA_HELPER=3Dy
> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> CONFIG_DRM_SCHED=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> CONFIG_DRM_I2C_NXP_TDA9950=3Dy
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> CONFIG_DRM_KOMEDA=3Dy
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> CONFIG_DRM_AMDGPU=3Dy
> CONFIG_DRM_AMDGPU_SI=3Dy
> CONFIG_DRM_AMDGPU_CIK=3Dy
> CONFIG_DRM_AMDGPU_USERPTR=3Dy
> CONFIG_DRM_AMDGPU_GART_DEBUGFS=3Dy
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> CONFIG_DRM_AMD_ACP=3Dy
> # end of ACP (Audio CoProcessor) Configuration
> =

> #
> # Display Engine Configuration
> #
> CONFIG_DRM_AMD_DC=3Dy
> CONFIG_DRM_AMD_DC_DCN=3Dy
> # CONFIG_DRM_AMD_DC_HDCP is not set
> CONFIG_DEBUG_KERNEL_DC=3Dy
> # end of Display Engine Configuration
> =

> CONFIG_DRM_NOUVEAU=3Dy
> # CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
> CONFIG_NOUVEAU_DEBUG=3D5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> # CONFIG_NOUVEAU_DEBUG_MMU is not set
> CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
> CONFIG_DRM_I915=3Dy
> CONFIG_DRM_I915_FORCE_PROBE=3D""
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> CONFIG_DRM_I915_USERPTR=3Dy
> =

> #
> # drm/i915 Debugging
> #
> # CONFIG_DRM_I915_WERROR is not set
> CONFIG_DRM_I915_DEBUG=3Dy
> CONFIG_DRM_I915_DEBUG_MMIO=3Dy
> CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=3Dy
> # CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
> # CONFIG_DRM_I915_DEBUG_GUC is not set
> CONFIG_DRM_I915_SELFTEST=3Dy
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS=3Dy
> CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=3Dy
> CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dy
> # end of drm/i915 Debugging
> =

> #
> # drm/i915 Profile Guided Optimisation
> #
> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> # end of drm/i915 Profile Guided Optimisation
> =

> CONFIG_DRM_VGEM=3Dy
> # CONFIG_DRM_VKMS is not set
> CONFIG_DRM_VMWGFX=3Dy
> CONFIG_DRM_VMWGFX_FBCON=3Dy
> CONFIG_DRM_GMA500=3Dy
> CONFIG_DRM_GMA600=3Dy
> CONFIG_DRM_GMA3600=3Dy
> # CONFIG_DRM_UDL is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> CONFIG_DRM_RCAR_DW_HDMI=3Dy
> CONFIG_DRM_RCAR_LVDS=3Dy
> # CONFIG_DRM_QXL is not set
> CONFIG_DRM_BOCHS=3Dy
> CONFIG_DRM_VIRTIO_GPU=3Dy
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_ARM_VERSATILE is not set
> CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=3Dy
> CONFIG_DRM_PANEL_BOE_HIMAX8279D=3Dy
> # CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
> CONFIG_DRM_PANEL_LVDS=3Dy
> # CONFIG_DRM_PANEL_SIMPLE is not set
> # CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
> CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=3Dy
> CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=3Dy
> CONFIG_DRM_PANEL_ILITEK_IL9322=3Dy
> CONFIG_DRM_PANEL_ILITEK_ILI9881C=3Dy
> CONFIG_DRM_PANEL_INNOLUX_P079ZCA=3Dy
> CONFIG_DRM_PANEL_JDI_LT070ME05000=3Dy
> CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=3Dy
> CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W=3Dy
> CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829=3Dy
> # CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
> CONFIG_DRM_PANEL_LG_LB035Q02=3Dy
> # CONFIG_DRM_PANEL_LG_LG4573 is not set
> # CONFIG_DRM_PANEL_NEC_NL8048HL11 is not set
> CONFIG_DRM_PANEL_NOVATEK_NT35510=3Dy
> CONFIG_DRM_PANEL_NOVATEK_NT39016=3Dy
> CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=3Dy
> CONFIG_DRM_PANEL_ORISETECH_OTM8009A=3Dy
> CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=3Dy
> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=3Dy
> CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=3Dy
> CONFIG_DRM_PANEL_RAYDIUM_RM67191=3Dy
> CONFIG_DRM_PANEL_RAYDIUM_RM68200=3Dy
> # CONFIG_DRM_PANEL_ROCKTECH_JH057N00900 is not set
> CONFIG_DRM_PANEL_RONBO_RB070D30=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=3Dy
> # CONFIG_DRM_PANEL_SAMSUNG_S6E63M0 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=3Dy
> CONFIG_DRM_PANEL_SEIKO_43WVF1G=3Dy
> CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=3Dy
> # CONFIG_DRM_PANEL_SHARP_LS037V7DW01 is not set
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dy
> # CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
> CONFIG_DRM_PANEL_SITRONIX_ST7789V=3Dy
> CONFIG_DRM_PANEL_SONY_ACX424AKP=3Dy
> CONFIG_DRM_PANEL_SONY_ACX565AKM=3Dy
> CONFIG_DRM_PANEL_TPO_TD028TTEC1=3Dy
> CONFIG_DRM_PANEL_TPO_TD043MTEA1=3Dy
> CONFIG_DRM_PANEL_TPO_TPG110=3Dy
> # CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
> # CONFIG_DRM_PANEL_VISIONOX_RM69299 is not set
> CONFIG_DRM_PANEL_XINPENG_XPP055C272=3Dy
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_CDNS_DSI is not set
> CONFIG_DRM_CHRONTEL_CH7033=3Dy
> CONFIG_DRM_DISPLAY_CONNECTOR=3Dy
> # CONFIG_DRM_LVDS_CODEC is not set
> CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=3Dy
> CONFIG_DRM_NWL_MIPI_DSI=3Dy
> CONFIG_DRM_NXP_PTN3460=3Dy
> CONFIG_DRM_PARADE_PS8622=3Dy
> CONFIG_DRM_PARADE_PS8640=3Dy
> # CONFIG_DRM_SIL_SII8620 is not set
> CONFIG_DRM_SII902X=3Dy
> CONFIG_DRM_SII9234=3Dy
> CONFIG_DRM_SIMPLE_BRIDGE=3Dy
> CONFIG_DRM_THINE_THC63LVD1024=3Dy
> # CONFIG_DRM_TOSHIBA_TC358764 is not set
> CONFIG_DRM_TOSHIBA_TC358767=3Dy
> CONFIG_DRM_TOSHIBA_TC358768=3Dy
> CONFIG_DRM_TI_TFP410=3Dy
> # CONFIG_DRM_TI_SN65DSI86 is not set
> CONFIG_DRM_TI_TPD12S015=3Dy
> CONFIG_DRM_ANALOGIX_ANX6345=3Dy
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> CONFIG_DRM_ANALOGIX_DP=3Dy
> CONFIG_DRM_I2C_ADV7511=3Dy
> # CONFIG_DRM_I2C_ADV7511_CEC is not set
> CONFIG_DRM_DW_HDMI=3Dy
> CONFIG_DRM_DW_HDMI_CEC=3Dy
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> CONFIG_DRM_ARCPGU=3Dy
> CONFIG_DRM_MXS=3Dy
> CONFIG_DRM_MXSFB=3Dy
> # CONFIG_DRM_CIRRUS_QEMU is not set
> CONFIG_DRM_GM12U320=3Dy
> # CONFIG_TINYDRM_HX8357D is not set
> CONFIG_TINYDRM_ILI9225=3Dy
> CONFIG_TINYDRM_ILI9341=3Dy
> CONFIG_TINYDRM_ILI9486=3Dy
> # CONFIG_TINYDRM_MI0283QT is not set
> CONFIG_TINYDRM_REPAPER=3Dy
> # CONFIG_TINYDRM_ST7586 is not set
> CONFIG_TINYDRM_ST7735R=3Dy
> # CONFIG_DRM_VBOXVIDEO is not set
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_EXPORT_FOR_TESTS=3Dy
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> CONFIG_FB_FOREIGN_ENDIAN=3Dy
> # CONFIG_FB_BOTH_ENDIAN is not set
> # CONFIG_FB_BIG_ENDIAN is not set
> CONFIG_FB_LITTLE_ENDIAN=3Dy
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
> CONFIG_FB_SVGALIB=3Dy
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> CONFIG_FB_CYBER2000=3Dy
> CONFIG_FB_CYBER2000_DDC=3Dy
> CONFIG_FB_ARC=3Dy
> CONFIG_FB_ASILIANT=3Dy
> CONFIG_FB_IMSTT=3Dy
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_N411=3Dy
> # CONFIG_FB_HGA is not set
> CONFIG_FB_OPENCORES=3Dy
> CONFIG_FB_S1D13XXX=3Dy
> # CONFIG_FB_NVIDIA is not set
> CONFIG_FB_RIVA=3Dy
> # CONFIG_FB_RIVA_I2C is not set
> # CONFIG_FB_RIVA_DEBUG is not set
> CONFIG_FB_RIVA_BACKLIGHT=3Dy
> CONFIG_FB_I740=3Dy
> CONFIG_FB_LE80578=3Dy
> CONFIG_FB_CARILLO_RANCH=3Dy
> CONFIG_FB_MATROX=3Dy
> CONFIG_FB_MATROX_MILLENIUM=3Dy
> CONFIG_FB_MATROX_MYSTIQUE=3Dy
> # CONFIG_FB_MATROX_G is not set
> # CONFIG_FB_MATROX_I2C is not set
> CONFIG_FB_RADEON=3Dy
> # CONFIG_FB_RADEON_I2C is not set
> # CONFIG_FB_RADEON_BACKLIGHT is not set
> # CONFIG_FB_RADEON_DEBUG is not set
> CONFIG_FB_ATY128=3Dy
> # CONFIG_FB_ATY128_BACKLIGHT is not set
> CONFIG_FB_ATY=3Dy
> # CONFIG_FB_ATY_CT is not set
> CONFIG_FB_ATY_GX=3Dy
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> # CONFIG_FB_S3 is not set
> CONFIG_FB_SAVAGE=3Dy
> # CONFIG_FB_SAVAGE_I2C is not set
> CONFIG_FB_SAVAGE_ACCEL=3Dy
> CONFIG_FB_SIS=3Dy
> CONFIG_FB_SIS_300=3Dy
> CONFIG_FB_SIS_315=3Dy
> # CONFIG_FB_VIA is not set
> CONFIG_FB_NEOMAGIC=3Dy
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> CONFIG_FB_VOODOO1=3Dy
> CONFIG_FB_VT8623=3Dy
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> CONFIG_FB_PM3=3Dy
> CONFIG_FB_CARMINE=3Dy
> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> CONFIG_FB_GEODE=3Dy
> # CONFIG_FB_GEODE_LX is not set
> # CONFIG_FB_GEODE_GX is not set
> # CONFIG_FB_GEODE_GX1 is not set
> CONFIG_FB_SMSCUFX=3Dy
> CONFIG_FB_UDL=3Dy
> CONFIG_FB_IBM_GXT4500=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_FB_METRONOME=3Dy
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_SIMPLE=3Dy
> CONFIG_FB_SSD1307=3Dy
> CONFIG_FB_SM712=3Dy
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_L4F00242T03=3Dy
> CONFIG_LCD_LMS283GF05=3Dy
> CONFIG_LCD_LTV350QV=3Dy
> # CONFIG_LCD_ILI922X is not set
> CONFIG_LCD_ILI9320=3Dy
> CONFIG_LCD_TDO24M=3Dy
> CONFIG_LCD_VGG2432A4=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_LCD_AMS369FG06=3Dy
> CONFIG_LCD_LMS501KF03=3Dy
> CONFIG_LCD_HX8357=3Dy
> CONFIG_LCD_OTM3225A=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> # CONFIG_BACKLIGHT_LM3533 is not set
> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dy
> CONFIG_BACKLIGHT_PWM=3Dy
> # CONFIG_BACKLIGHT_DA9052 is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_QCOM_WLED=3Dy
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> CONFIG_BACKLIGHT_AAT2870=3Dy
> # CONFIG_BACKLIGHT_LM3630A is not set
> CONFIG_BACKLIGHT_LM3639=3Dy
> # CONFIG_BACKLIGHT_LP855X is not set
> CONFIG_BACKLIGHT_OT200=3Dy
> CONFIG_BACKLIGHT_PANDORA=3Dy
> # CONFIG_BACKLIGHT_SKY81452 is not set
> CONFIG_BACKLIGHT_TPS65217=3Dy
> # CONFIG_BACKLIGHT_AS3711 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> CONFIG_BACKLIGHT_LED=3Dy
> # end of Backlight & LCD device support
> =

> CONFIG_VGASTATE=3Dy
> CONFIG_VIDEOMODE_HELPERS=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # end of Graphics support
> =

> CONFIG_SOUND=3Dy
> # CONFIG_SND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dy
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dy
> CONFIG_HID_ACRUX_FF=3Dy
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_AUREAL=3Dy
> CONFIG_HID_BELKIN=3Dy
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_CHICONY=3Dy
> CONFIG_HID_CORSAIR=3Dy
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> CONFIG_HID_CMEDIA=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> CONFIG_DRAGONRISE_FF=3Dy
> # CONFIG_HID_EMS_FF is not set
> CONFIG_HID_ELECOM=3Dy
> # CONFIG_HID_EZKEY is not set
> CONFIG_HID_GEMBIRD=3Dy
> # CONFIG_HID_GFRM is not set
> CONFIG_HID_GLORIOUS=3Dy
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=3Dy
> CONFIG_HID_ITE=3Dy
> CONFIG_HID_JABRA=3Dy
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dy
> CONFIG_HID_LOGITECH=3Dy
> CONFIG_HID_LOGITECH_HIDPP=3Dy
> CONFIG_LOGITECH_FF=3Dy
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> CONFIG_LOGIG940_FF=3Dy
> CONFIG_LOGIWHEELS_FF=3Dy
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MALTRON is not set
> CONFIG_HID_MAYFLASH=3Dy
> CONFIG_HID_REDRAGON=3Dy
> # CONFIG_HID_MICROSOFT is not set
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_NTI=3Dy
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_SAITEK is not set
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SPEEDLINK=3Dy
> # CONFIG_HID_STEAM is not set
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_SMARTJOYPLUS=3Dy
> CONFIG_SMARTJOYPLUS_FF=3Dy
> # CONFIG_HID_TIVO is not set
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> CONFIG_THRUSTMASTER_FF=3Dy
> CONFIG_HID_UDRAW_PS3=3Dy
> # CONFIG_HID_WIIMOTE is not set
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> CONFIG_HID_ZYDACRON=3Dy
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> # end of Special HID drivers
> =

> #
> # USB HID support
> #
> # CONFIG_USB_HID is not set
> CONFIG_HID_PID=3Dy
> =

> #
> # USB HID Boot Protocol drivers
> #
> CONFIG_USB_KBD=3Dy
> CONFIG_USB_MOUSE=3Dy
> # end of USB HID Boot Protocol drivers
> # end of USB HID support
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> # end of I2C HID support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> CONFIG_USB_ULPI_BUS=3Dy
> CONFIG_USB_CONN_GPIO=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> # CONFIG_USB_PCI is not set
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> =

> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> CONFIG_USB_DYNAMIC_MINORS=3Dy
> CONFIG_USB_OTG=3Dy
> # CONFIG_USB_OTG_WHITELIST is not set
> # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> CONFIG_USB_OTG_FSM=3Dy
> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> # CONFIG_USB_MON is not set
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> CONFIG_USB_XHCI_HCD=3Dy
> # CONFIG_USB_XHCI_DBGCAP is not set
> CONFIG_USB_XHCI_PCI_RENESAS=3Dy
> CONFIG_USB_XHCI_PLATFORM=3Dy
> # CONFIG_USB_EHCI_HCD is not set
> # CONFIG_USB_OXU210HP_HCD is not set
> CONFIG_USB_ISP116X_HCD=3Dy
> CONFIG_USB_FOTG210_HCD=3Dy
> # CONFIG_USB_MAX3421_HCD is not set
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_SSB=3Dy
> CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> # CONFIG_USB_U132_HCD is not set
> CONFIG_USB_SL811_HCD=3Dy
> # CONFIG_USB_SL811_HCD_ISO is not set
> # CONFIG_USB_R8A66597_HCD is not set
> CONFIG_USB_HCD_BCMA=3Dy
> CONFIG_USB_HCD_SSB=3Dy
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dy
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
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
> # CONFIG_USB_MDC800 is not set
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_CDNS3 is not set
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
> # CONFIG_USB_DWC3_ULPI is not set
> CONFIG_USB_DWC3_HOST=3Dy
> =

> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_OF_SIMPLE=3Dy
> CONFIG_USB_DWC2=3Dy
> CONFIG_USB_DWC2_HOST=3Dy
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> CONFIG_USB_DWC2_DEBUG=3Dy
> # CONFIG_USB_DWC2_VERBOSE is not set
> CONFIG_USB_DWC2_TRACK_MISSED_SOFS=3Dy
> CONFIG_USB_DWC2_DEBUG_PERIODIC=3Dy
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
> CONFIG_USB_EMI62=3Dy
> CONFIG_USB_EMI26=3Dy
> # CONFIG_USB_ADUTUX is not set
> CONFIG_USB_SEVSEG=3Dy
> # CONFIG_USB_LEGOTOWER is not set
> # CONFIG_USB_LCD is not set
> CONFIG_USB_CYPRESS_CY7C63=3Dy
> # CONFIG_USB_CYTHERM is not set
> # CONFIG_USB_IDMOUSE is not set
> CONFIG_USB_FTDI_ELAN=3Dy
> CONFIG_USB_APPLEDISPLAY=3Dy
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> CONFIG_USB_SISUSBVGA=3Dy
> # CONFIG_USB_LD is not set
> CONFIG_USB_TRANCEVIBRATOR=3Dy
> CONFIG_USB_IOWARRIOR=3Dy
> # CONFIG_USB_TEST is not set
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
> CONFIG_USB_ISIGHTFW=3Dy
> CONFIG_USB_YUREX=3Dy
> CONFIG_USB_EZUSB_FX2=3Dy
> CONFIG_USB_HUB_USB251XB=3Dy
> CONFIG_USB_HSIC_USB3503=3Dy
> CONFIG_USB_HSIC_USB4604=3Dy
> # CONFIG_USB_LINK_LAYER_TEST is not set
> CONFIG_USB_CHAOSKEY=3Dy
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> CONFIG_USB_GPIO_VBUS=3Dy
> # CONFIG_TAHVO_USB is not set
> CONFIG_USB_ISP1301=3Dy
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=3Dy
> CONFIG_TYPEC_TCPM=3Dy
> # CONFIG_TYPEC_TCPCI is not set
> CONFIG_TYPEC_FUSB302=3Dy
> CONFIG_TYPEC_UCSI=3Dy
> CONFIG_UCSI_CCG=3Dy
> # CONFIG_UCSI_ACPI is not set
> CONFIG_TYPEC_HD3SS3220=3Dy
> CONFIG_TYPEC_TPS6598X=3Dy
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> CONFIG_TYPEC_MUX_PI3USB30532=3Dy
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # CONFIG_TYPEC_DP_ALTMODE is not set
> # end of USB Type-C Alternate Mode drivers
> =

> CONFIG_USB_ROLE_SWITCH=3Dy
> # CONFIG_USB_ROLES_INTEL_XHCI is not set
> CONFIG_MMC=3Dy
> CONFIG_PWRSEQ_EMMC=3Dy
> CONFIG_PWRSEQ_SIMPLE=3Dy
> CONFIG_SDIO_UART=3Dy
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dy
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dy
> # CONFIG_MMC_RICOH_MMC is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> CONFIG_MMC_SDHCI_OF_ARASAN=3Dy
> CONFIG_MMC_SDHCI_OF_ASPEED=3Dy
> # CONFIG_MMC_SDHCI_OF_AT91 is not set
> # CONFIG_MMC_SDHCI_OF_DWCMSHC is not set
> CONFIG_MMC_SDHCI_CADENCE=3Dy
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> CONFIG_MMC_SDHCI_MILBEAUT=3Dy
> # CONFIG_MMC_WBSD is not set
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_SPI=3Dy
> CONFIG_MMC_CB710=3Dy
> CONFIG_MMC_VIA_SDMMC=3Dy
> # CONFIG_MMC_VUB300 is not set
> # CONFIG_MMC_USHC is not set
> CONFIG_MMC_USDHI6ROL0=3Dy
> CONFIG_MMC_REALTEK_PCI=3Dy
> CONFIG_MMC_REALTEK_USB=3Dy
> CONFIG_MMC_CQHCI=3Dy
> # CONFIG_MMC_HSQ is not set
> CONFIG_MMC_TOSHIBA_PCI=3Dy
> # CONFIG_MMC_MTK is not set
> CONFIG_MMC_SDHCI_XENON=3Dy
> CONFIG_MMC_SDHCI_OMAP=3Dy
> CONFIG_MMC_SDHCI_AM654=3Dy
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
> CONFIG_MEMSTICK_TIFM_MS=3Dy
> CONFIG_MEMSTICK_JMICRON_38X=3Dy
> CONFIG_MEMSTICK_R592=3Dy
> CONFIG_MEMSTICK_REALTEK_PCI=3Dy
> # CONFIG_MEMSTICK_REALTEK_USB is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_AAT1290 is not set
> CONFIG_LEDS_AN30259A=3Dy
> # CONFIG_LEDS_AS3645A is not set
> # CONFIG_LEDS_AW2013 is not set
> # CONFIG_LEDS_BCM6328 is not set
> # CONFIG_LEDS_BCM6358 is not set
> CONFIG_LEDS_CPCAP=3Dy
> CONFIG_LEDS_CR0014114=3Dy
> # CONFIG_LEDS_EL15203000 is not set
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3532 is not set
> # CONFIG_LEDS_LM3533 is not set
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_LM3692X=3Dy
> CONFIG_LEDS_LM3601X=3Dy
> CONFIG_LEDS_NET48XX=3Dy
> CONFIG_LEDS_WRAP=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP3952=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> # CONFIG_LEDS_LP5523 is not set
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dy
> CONFIG_LEDS_LP8860=3Dy
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> CONFIG_LEDS_PCA963X=3Dy
> CONFIG_LEDS_WM8350=3Dy
> CONFIG_LEDS_DA9052=3Dy
> # CONFIG_LEDS_DAC124S085 is not set
> CONFIG_LEDS_PWM=3Dy
> # CONFIG_LEDS_REGULATOR is not set
> # CONFIG_LEDS_BD2802 is not set
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_MC13783=3Dy
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dy
> CONFIG_LEDS_MAX77693=3Dy
> # CONFIG_LEDS_MAX8997 is not set
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_OT200 is not set
> # CONFIG_LEDS_KTD2692 is not set
> CONFIG_LEDS_IS31FL319X=3Dy
> CONFIG_LEDS_IS31FL32XX=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> CONFIG_LEDS_SYSCON=3Dy
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=3Dy
> # CONFIG_LEDS_NIC78BX is not set
> CONFIG_LEDS_SPI_BYTE=3Dy
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> CONFIG_LEDS_SGM3140=3Dy
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> # CONFIG_RTC_HCTOSYS is not set
> CONFIG_RTC_SYSTOHC=3Dy
> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=3Dy
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_ABB5ZES3=3Dy
> CONFIG_RTC_DRV_ABEOZ9=3Dy
> CONFIG_RTC_DRV_ABX80X=3Dy
> CONFIG_RTC_DRV_DS1307=3Dy
> CONFIG_RTC_DRV_DS1307_CENTURY=3Dy
> CONFIG_RTC_DRV_DS1374=3Dy
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dy
> CONFIG_RTC_DRV_HYM8563=3Dy
> CONFIG_RTC_DRV_MAX6900=3Dy
> CONFIG_RTC_DRV_MAX8997=3Dy
> CONFIG_RTC_DRV_MAX77686=3Dy
> CONFIG_RTC_DRV_RS5C372=3Dy
> # CONFIG_RTC_DRV_ISL1208 is not set
> # CONFIG_RTC_DRV_ISL12022 is not set
> CONFIG_RTC_DRV_ISL12026=3Dy
> # CONFIG_RTC_DRV_X1205 is not set
> # CONFIG_RTC_DRV_PCF8523 is not set
> CONFIG_RTC_DRV_PCF85063=3Dy
> # CONFIG_RTC_DRV_PCF85363 is not set
> # CONFIG_RTC_DRV_PCF8563 is not set
> # CONFIG_RTC_DRV_PCF8583 is not set
> CONFIG_RTC_DRV_M41T80=3Dy
> # CONFIG_RTC_DRV_M41T80_WDT is not set
> CONFIG_RTC_DRV_BD70528=3Dy
> # CONFIG_RTC_DRV_BQ32K is not set
> CONFIG_RTC_DRV_TWL4030=3Dy
> CONFIG_RTC_DRV_PALMAS=3Dy
> CONFIG_RTC_DRV_TPS6586X=3Dy
> CONFIG_RTC_DRV_TPS65910=3Dy
> # CONFIG_RTC_DRV_TPS80031 is not set
> CONFIG_RTC_DRV_RC5T583=3Dy
> CONFIG_RTC_DRV_S35390A=3Dy
> CONFIG_RTC_DRV_FM3130=3Dy
> CONFIG_RTC_DRV_RX8010=3Dy
> CONFIG_RTC_DRV_RX8581=3Dy
> CONFIG_RTC_DRV_RX8025=3Dy
> # CONFIG_RTC_DRV_EM3027 is not set
> # CONFIG_RTC_DRV_RV3028 is not set
> CONFIG_RTC_DRV_RV8803=3Dy
> CONFIG_RTC_DRV_S5M=3Dy
> # CONFIG_RTC_DRV_SD3078 is not set
> =

> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T93 is not set
> CONFIG_RTC_DRV_M41T94=3Dy
> CONFIG_RTC_DRV_DS1302=3Dy
> CONFIG_RTC_DRV_DS1305=3Dy
> # CONFIG_RTC_DRV_DS1343 is not set
> CONFIG_RTC_DRV_DS1347=3Dy
> CONFIG_RTC_DRV_DS1390=3Dy
> CONFIG_RTC_DRV_MAX6916=3Dy
> CONFIG_RTC_DRV_R9701=3Dy
> CONFIG_RTC_DRV_RX4581=3Dy
> CONFIG_RTC_DRV_RX6110=3Dy
> CONFIG_RTC_DRV_RS5C348=3Dy
> CONFIG_RTC_DRV_MAX6902=3Dy
> # CONFIG_RTC_DRV_PCF2123 is not set
> CONFIG_RTC_DRV_MCP795=3Dy
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dy
> # CONFIG_RTC_DRV_DS3232_HWMON is not set
> # CONFIG_RTC_DRV_PCF2127 is not set
> # CONFIG_RTC_DRV_RV3029C2 is not set
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> CONFIG_RTC_DRV_DS1286=3Dy
> CONFIG_RTC_DRV_DS1511=3Dy
> # CONFIG_RTC_DRV_DS1553 is not set
> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
> # CONFIG_RTC_DRV_DS1685 is not set
> # CONFIG_RTC_DRV_DS1689 is not set
> CONFIG_RTC_DRV_DS17285=3Dy
> # CONFIG_RTC_DRV_DS17485 is not set
> # CONFIG_RTC_DRV_DS17885 is not set
> CONFIG_RTC_DRV_DS1742=3Dy
> CONFIG_RTC_DRV_DS2404=3Dy
> CONFIG_RTC_DRV_DA9052=3Dy
> CONFIG_RTC_DRV_DA9063=3Dy
> CONFIG_RTC_DRV_STK17TA8=3Dy
> CONFIG_RTC_DRV_M48T86=3Dy
> CONFIG_RTC_DRV_M48T35=3Dy
> CONFIG_RTC_DRV_M48T59=3Dy
> CONFIG_RTC_DRV_MSM6242=3Dy
> CONFIG_RTC_DRV_BQ4802=3Dy
> CONFIG_RTC_DRV_RP5C01=3Dy
> CONFIG_RTC_DRV_V3020=3Dy
> # CONFIG_RTC_DRV_WM8350 is not set
> # CONFIG_RTC_DRV_PCF50633 is not set
> CONFIG_RTC_DRV_ZYNQMP=3Dy
> CONFIG_RTC_DRV_CROS_EC=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_CADENCE is not set
> # CONFIG_RTC_DRV_FTRTC010 is not set
> CONFIG_RTC_DRV_PCAP=3Dy
> CONFIG_RTC_DRV_MC13XXX=3Dy
> CONFIG_RTC_DRV_R7301=3Dy
> # CONFIG_RTC_DRV_CPCAP is not set
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
> CONFIG_DMABUF_MOVE_NOTIFY=3Dy
> CONFIG_DMABUF_SELFTESTS=3Dy
> # CONFIG_DMABUF_HEAPS is not set
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> CONFIG_HD44780=3Dy
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_HT16K33=3Dy
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> CONFIG_CHARLCD_BL_OFF=3Dy
> # CONFIG_CHARLCD_BL_ON is not set
> # CONFIG_CHARLCD_BL_FLASH is not set
> CONFIG_CHARLCD=3Dy
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> # CONFIG_UIO_DMEM_GENIRQ is not set
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> CONFIG_UIO_PCI_GENERIC=3Dy
> CONFIG_UIO_NETX=3Dy
> CONFIG_UIO_PRUSS=3Dy
> # CONFIG_UIO_MF624 is not set
> CONFIG_VFIO_IOMMU_TYPE1=3Dy
> CONFIG_VFIO=3Dy
> # CONFIG_VFIO_NOIOMMU is not set
> # CONFIG_VFIO_PCI is not set
> CONFIG_VFIO_MDEV=3Dy
> # CONFIG_VFIO_MDEV_DEVICE is not set
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VBOXGUEST=3Dy
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> CONFIG_VIRTIO_VDPA=3Dy
> # CONFIG_VIRTIO_BALLOON is not set
> # CONFIG_VIRTIO_INPUT is not set
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> CONFIG_VDPA=3Dy
> CONFIG_VDPA_SIM=3Dy
> CONFIG_IFCVF=3Dy
> CONFIG_VHOST_IOTLB=3Dy
> CONFIG_VHOST_RING=3Dy
> # CONFIG_VHOST_MENU is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> CONFIG_GREYBUS=3Dy
> CONFIG_GREYBUS_ES2=3Dy
> CONFIG_STAGING=3Dy
> CONFIG_COMEDI=3Dy
> CONFIG_COMEDI_DEBUG=3Dy
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> CONFIG_COMEDI_MISC_DRIVERS=3Dy
> # CONFIG_COMEDI_BOND is not set
> CONFIG_COMEDI_TEST=3Dy
> CONFIG_COMEDI_PARPORT=3Dy
> CONFIG_COMEDI_SSV_DNP=3Dy
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> # CONFIG_COMEDI_PCL711 is not set
> CONFIG_COMEDI_PCL724=3Dy
> CONFIG_COMEDI_PCL726=3Dy
> CONFIG_COMEDI_PCL730=3Dy
> CONFIG_COMEDI_PCL812=3Dy
> CONFIG_COMEDI_PCL816=3Dy
> CONFIG_COMEDI_PCL818=3Dy
> # CONFIG_COMEDI_PCM3724 is not set
> # CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
> # CONFIG_COMEDI_AMPLC_PC236_ISA is not set
> CONFIG_COMEDI_AMPLC_PC263_ISA=3Dy
> # CONFIG_COMEDI_RTI800 is not set
> CONFIG_COMEDI_RTI802=3Dy
> # CONFIG_COMEDI_DAC02 is not set
> CONFIG_COMEDI_DAS16M1=3Dy
> # CONFIG_COMEDI_DAS08_ISA is not set
> CONFIG_COMEDI_DAS16=3Dy
> CONFIG_COMEDI_DAS800=3Dy
> # CONFIG_COMEDI_DAS1800 is not set
> CONFIG_COMEDI_DAS6402=3Dy
> CONFIG_COMEDI_DT2801=3Dy
> # CONFIG_COMEDI_DT2811 is not set
> CONFIG_COMEDI_DT2814=3Dy
> CONFIG_COMEDI_DT2815=3Dy
> CONFIG_COMEDI_DT2817=3Dy
> # CONFIG_COMEDI_DT282X is not set
> # CONFIG_COMEDI_DMM32AT is not set
> CONFIG_COMEDI_FL512=3Dy
> # CONFIG_COMEDI_AIO_AIO12_8 is not set
> # CONFIG_COMEDI_AIO_IIRO_16 is not set
> # CONFIG_COMEDI_II_PCI20KC is not set
> # CONFIG_COMEDI_C6XDIGIO is not set
> # CONFIG_COMEDI_MPC624 is not set
> CONFIG_COMEDI_ADQ12B=3Dy
> # CONFIG_COMEDI_NI_AT_A2150 is not set
> CONFIG_COMEDI_NI_AT_AO=3Dy
> CONFIG_COMEDI_NI_ATMIO=3Dy
> CONFIG_COMEDI_NI_ATMIO16D=3Dy
> # CONFIG_COMEDI_NI_LABPC_ISA is not set
> CONFIG_COMEDI_PCMAD=3Dy
> CONFIG_COMEDI_PCMDA12=3Dy
> CONFIG_COMEDI_PCMMIO=3Dy
> CONFIG_COMEDI_PCMUIO=3Dy
> # CONFIG_COMEDI_MULTIQ3 is not set
> CONFIG_COMEDI_S526=3Dy
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_USB_DRIVERS=3Dy
> CONFIG_COMEDI_DT9812=3Dy
> CONFIG_COMEDI_NI_USB6501=3Dy
> CONFIG_COMEDI_USBDUX=3Dy
> CONFIG_COMEDI_USBDUXFAST=3Dy
> CONFIG_COMEDI_USBDUXSIGMA=3Dy
> CONFIG_COMEDI_VMK80XX=3Dy
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dy
> CONFIG_COMEDI_KCOMEDILIB=3Dy
> CONFIG_COMEDI_ISADMA=3Dy
> CONFIG_COMEDI_NI_TIO=3Dy
> CONFIG_COMEDI_NI_ROUTING=3Dy
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_R8712U is not set
> # CONFIG_FB_SM750 is not set
> =

> #
> # Speakup console speech
> #
> # end of Speakup console speech
> =

> CONFIG_STAGING_MEDIA=3Dy
> CONFIG_VIDEO_IPU3_IMGU=3Dy
> =

> #
> # soc_camera sensor drivers
> #
> =

> #
> # Android
> #
> # end of Android
> =

> CONFIG_STAGING_BOARD=3Dy
> # CONFIG_LTE_GDM724X is not set
> # CONFIG_GS_FPGABOOT is not set
> CONFIG_UNISYSSPAR=3Dy
> CONFIG_COMMON_CLK_XLNX_CLKWZRD=3Dy
> CONFIG_FB_TFT=3Dy
> CONFIG_FB_TFT_AGM1264K_FL=3Dy
> CONFIG_FB_TFT_BD663474=3Dy
> # CONFIG_FB_TFT_HX8340BN is not set
> # CONFIG_FB_TFT_HX8347D is not set
> CONFIG_FB_TFT_HX8353D=3Dy
> # CONFIG_FB_TFT_HX8357D is not set
> # CONFIG_FB_TFT_ILI9163 is not set
> CONFIG_FB_TFT_ILI9320=3Dy
> CONFIG_FB_TFT_ILI9325=3Dy
> # CONFIG_FB_TFT_ILI9340 is not set
> # CONFIG_FB_TFT_ILI9341 is not set
> CONFIG_FB_TFT_ILI9481=3Dy
> CONFIG_FB_TFT_ILI9486=3Dy
> CONFIG_FB_TFT_PCD8544=3Dy
> # CONFIG_FB_TFT_RA8875 is not set
> # CONFIG_FB_TFT_S6D02A1 is not set
> CONFIG_FB_TFT_S6D1121=3Dy
> CONFIG_FB_TFT_SEPS525=3Dy
> CONFIG_FB_TFT_SH1106=3Dy
> CONFIG_FB_TFT_SSD1289=3Dy
> # CONFIG_FB_TFT_SSD1305 is not set
> # CONFIG_FB_TFT_SSD1306 is not set
> CONFIG_FB_TFT_SSD1331=3Dy
> CONFIG_FB_TFT_SSD1351=3Dy
> CONFIG_FB_TFT_ST7735R=3Dy
> CONFIG_FB_TFT_ST7789V=3Dy
> CONFIG_FB_TFT_TINYLCD=3Dy
> CONFIG_FB_TFT_TLS8204=3Dy
> CONFIG_FB_TFT_UC1611=3Dy
> CONFIG_FB_TFT_UC1701=3Dy
> # CONFIG_FB_TFT_UPD161704 is not set
> CONFIG_FB_TFT_WATTEROTT=3Dy
> # CONFIG_KS7010 is not set
> CONFIG_GREYBUS_AUDIO=3Dy
> # CONFIG_GREYBUS_BOOTROM is not set
> CONFIG_GREYBUS_FIRMWARE=3Dy
> CONFIG_GREYBUS_HID=3Dy
> # CONFIG_GREYBUS_LIGHT is not set
> CONFIG_GREYBUS_LOG=3Dy
> CONFIG_GREYBUS_LOOPBACK=3Dy
> CONFIG_GREYBUS_POWER=3Dy
> CONFIG_GREYBUS_RAW=3Dy
> CONFIG_GREYBUS_VIBRATOR=3Dy
> # CONFIG_GREYBUS_BRIDGED_PHY is not set
> CONFIG_PI433=3Dy
> =

> #
> # Gasket devices
> #
> # end of Gasket devices
> =

> # CONFIG_XIL_AXIS_FIFO is not set
> CONFIG_FIELDBUS_DEV=3Dy
> CONFIG_HMS_ANYBUSS_BUS=3Dy
> CONFIG_ARCX_ANYBUS_CONTROLLER=3Dy
> CONFIG_HMS_PROFINET=3Dy
> # CONFIG_KPC2000 is not set
> # CONFIG_QLGE is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACPI_WMI=3Dy
> CONFIG_WMI_BMOF=3Dy
> # CONFIG_ALIENWARE_WMI is not set
> # CONFIG_HUAWEI_WMI is not set
> # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
> # CONFIG_INTEL_WMI_THUNDERBOLT is not set
> CONFIG_MXM_WMI=3Dy
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_XIAOMI_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_ACER_WMI is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_ASUS_WMI is not set
> # CONFIG_EEEPC_LAPTOP is not set
> # CONFIG_DCDBAS is not set
> # CONFIG_DELL_SMBIOS is not set
> # CONFIG_DELL_RBU is not set
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_DELL_WMI_AIO is not set
> # CONFIG_DELL_WMI_LED is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_HP_WMI is not set
> # CONFIG_TC1100_WMI is not set
> # CONFIG_IBM_RTL is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_INTEL_ATOMISP2_PM is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_INT0002_VGPIO is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_SURFACE_3_BUTTON is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> # CONFIG_MSI_WMI is not set
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_LG_LAPTOP is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SYSTEM76_ACPI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> # CONFIG_MLX_PLATFORM is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> # CONFIG_INTEL_SCU_PCI is not set
> # CONFIG_INTEL_SCU_PLATFORM is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> # CONFIG_CHROMEOS_TBMC is not set
> CONFIG_CROS_EC=3Dy
> CONFIG_CROS_EC_I2C=3Dy
> # CONFIG_CROS_EC_RPMSG is not set
> CONFIG_CROS_EC_SPI=3Dy
> # CONFIG_CROS_EC_LPC is not set
> CONFIG_CROS_EC_PROTO=3Dy
> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> CONFIG_CROS_EC_CHARDEV=3Dy
> CONFIG_CROS_EC_LIGHTBAR=3Dy
> CONFIG_CROS_EC_VBC=3Dy
> # CONFIG_CROS_EC_DEBUGFS is not set
> # CONFIG_CROS_EC_SENSORHUB is not set
> CONFIG_CROS_EC_SYSFS=3Dy
> CONFIG_CROS_EC_TYPEC=3Dy
> CONFIG_CROS_USBPD_NOTIFY=3Dy
> CONFIG_MELLANOX_PLATFORM=3Dy
> CONFIG_MLXREG_HOTPLUG=3Dy
> CONFIG_MLXREG_IO=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> CONFIG_COMMON_CLK_MAX77686=3Dy
> CONFIG_COMMON_CLK_MAX9485=3Dy
> CONFIG_COMMON_CLK_SI5341=3Dy
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI514 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> CONFIG_COMMON_CLK_SI570=3Dy
> CONFIG_COMMON_CLK_CDCE706=3Dy
> CONFIG_COMMON_CLK_CDCE925=3Dy
> CONFIG_COMMON_CLK_CS2000_CP=3Dy
> CONFIG_COMMON_CLK_S2MPS11=3Dy
> # CONFIG_CLK_TWL6040 is not set
> # CONFIG_COMMON_CLK_PALMAS is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_COMMON_CLK_VC5 is not set
> CONFIG_COMMON_CLK_BD718XX=3Dy
> # CONFIG_COMMON_CLK_FIXED_MMIO is not set
> # CONFIG_CLK_LGM_CGU is not set
> # CONFIG_HWSPINLOCK is not set
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_MICROCHIP_PIT64B is not set
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> # CONFIG_PLATFORM_MHU is not set
> # CONFIG_PCC is not set
> CONFIG_ALTERA_MBOX=3Dy
> CONFIG_MAILBOX_TEST=3Dy
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> CONFIG_IOMMU_DEBUGFS=3Dy
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_OF_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU is not set
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
> CONFIG_RPMSG_QCOM_GLINK=3Dy
> CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
> CONFIG_RPMSG_VIRTIO=3Dy
> # end of Rpmsg drivers
> =

> CONFIG_SOUNDWIRE=3Dy
> =

> #
> # SoundWire Devices
> #
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
> # Aspeed SoC drivers
> #
> # end of Aspeed SoC drivers
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
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> CONFIG_XILINX_VCU=3Dy
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
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
> # CONFIG_EXTCON_FSA9480 is not set
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> # CONFIG_EXTCON_MAX14577 is not set
> CONFIG_EXTCON_MAX3355=3Dy
> CONFIG_EXTCON_MAX77693=3Dy
> # CONFIG_EXTCON_MAX8997 is not set
> CONFIG_EXTCON_PALMAS=3Dy
> CONFIG_EXTCON_PTN5150=3Dy
> CONFIG_EXTCON_RT8973A=3Dy
> CONFIG_EXTCON_SM5502=3Dy
> CONFIG_EXTCON_USB_GPIO=3Dy
> CONFIG_EXTCON_USBC_CROS_EC=3Dy
> CONFIG_MEMORY=3Dy
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dy
> CONFIG_NTB_MSI=3Dy
> # CONFIG_NTB_IDT is not set
> CONFIG_NTB_SWITCHTEC=3Dy
> CONFIG_NTB_PINGPONG=3Dy
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> CONFIG_NTB_MSI_TEST=3Dy
> CONFIG_NTB_TRANSPORT=3Dy
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_DEBUG is not set
> CONFIG_PWM_ATMEL_HLCDC_PWM=3Dy
> CONFIG_PWM_CROS_EC=3Dy
> CONFIG_PWM_FSL_FTM=3Dy
> CONFIG_PWM_LP3943=3Dy
> CONFIG_PWM_LPSS=3Dy
> CONFIG_PWM_LPSS_PCI=3Dy
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dy
> # CONFIG_PWM_STMPE is not set
> CONFIG_PWM_TWL=3Dy
> CONFIG_PWM_TWL_LED=3Dy
> =

> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=3Dy
> CONFIG_AL_FIC=3Dy
> # end of IRQ chip support
> =

> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> CONFIG_SERIAL_IPOCTAL=3Dy
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_BRCMSTB_RESCAL=3Dy
> # CONFIG_RESET_INTEL_GW is not set
> CONFIG_RESET_TI_SYSCON=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # CONFIG_PHY_CADENCE_TORRENT is not set
> CONFIG_PHY_CADENCE_DPHY=3Dy
> CONFIG_PHY_CADENCE_SIERRA=3Dy
> CONFIG_PHY_CADENCE_SALVO=3Dy
> # CONFIG_PHY_FSL_IMX8MQ_USB is not set
> CONFIG_PHY_MIXEL_MIPI_DPHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> CONFIG_PHY_MAPPHONE_MDM6600=3Dy
> CONFIG_PHY_OCELOT_SERDES=3Dy
> # CONFIG_PHY_QCOM_USB_HS is not set
> CONFIG_PHY_QCOM_USB_HSIC=3Dy
> CONFIG_PHY_SAMSUNG_USB2=3Dy
> # CONFIG_PHY_TUSB1210 is not set
> # CONFIG_PHY_INTEL_COMBO is not set
> # CONFIG_PHY_INTEL_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL_CORE=3Dy
> CONFIG_INTEL_RAPL=3Dy
> # CONFIG_IDLE_INJECT is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> CONFIG_USB4=3Dy
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> CONFIG_DAX=3Dy
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> CONFIG_NVMEM_SPMI_SDAM=3Dy
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dy
> CONFIG_STM_PROTO_BASIC=3Dy
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dy
> CONFIG_STM_SOURCE_CONSOLE=3Dy
> CONFIG_STM_SOURCE_HEARTBEAT=3Dy
> CONFIG_INTEL_TH=3Dy
> CONFIG_INTEL_TH_PCI=3Dy
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dy
> CONFIG_INTEL_TH_STH=3Dy
> CONFIG_INTEL_TH_MSU=3Dy
> # CONFIG_INTEL_TH_PTI is not set
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> CONFIG_FPGA=3Dy
> CONFIG_ALTERA_PR_IP_CORE=3Dy
> CONFIG_ALTERA_PR_IP_CORE_PLAT=3Dy
> CONFIG_FPGA_MGR_ALTERA_PS_SPI=3Dy
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_MGR_XILINX_SPI=3Dy
> CONFIG_FPGA_MGR_ICE40_SPI=3Dy
> CONFIG_FPGA_MGR_MACHXO2_SPI=3Dy
> CONFIG_FPGA_BRIDGE=3Dy
> CONFIG_ALTERA_FREEZE_BRIDGE=3Dy
> CONFIG_XILINX_PR_DECOUPLER=3Dy
> CONFIG_FPGA_REGION=3Dy
> CONFIG_OF_FPGA_REGION=3Dy
> # CONFIG_FPGA_DFL is not set
> CONFIG_FSI=3Dy
> CONFIG_FSI_NEW_DEV_NODE=3Dy
> # CONFIG_FSI_MASTER_GPIO is not set
> # CONFIG_FSI_MASTER_HUB is not set
> CONFIG_FSI_MASTER_ASPEED=3Dy
> # CONFIG_FSI_SCOM is not set
> CONFIG_FSI_SBEFIFO=3Dy
> CONFIG_FSI_OCC=3Dy
> CONFIG_TEE=3Dy
> =

> #
> # TEE drivers
> #
> # end of TEE drivers
> =

> CONFIG_MULTIPLEXER=3Dy
> =

> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=3Dy
> CONFIG_MUX_ADGS1408=3Dy
> CONFIG_MUX_GPIO=3Dy
> CONFIG_MUX_MMIO=3Dy
> # end of Multiplexer drivers
> =

> CONFIG_PM_OPP=3Dy
> CONFIG_SIOX=3Dy
> CONFIG_SIOX_BUS_GPIO=3Dy
> CONFIG_SLIMBUS=3Dy
> # CONFIG_SLIM_QCOM_CTRL is not set
> CONFIG_INTERCONNECT=3Dy
> CONFIG_COUNTER=3Dy
> CONFIG_FTM_QUADDEC=3Dy
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> # CONFIG_FS_ENCRYPTION is not set
> CONFIG_FS_VERITY=3Dy
> # CONFIG_FS_VERITY_DEBUG is not set
> # CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> # CONFIG_QUOTA is not set
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_AUTOFS_FS=3Dy
> # CONFIG_FUSE_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> # end of Caches
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> # CONFIG_HUGETLBFS is not set
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> # end of Pseudo filesystems
> =

> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V2=3Dy
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_FSCACHE is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
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
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> # CONFIG_NLS_CODEPAGE_863 is not set
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> CONFIG_NLS_ISO8859_8=3Dy
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> CONFIG_NLS_ISO8859_4=3Dy
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> # CONFIG_NLS_KOI8_U is not set
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> # CONFIG_NLS_MAC_GAELIC is not set
> # CONFIG_NLS_MAC_GREEK is not set
> CONFIG_NLS_MAC_ICELAND=3Dy
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> # CONFIG_NLS_UTF8 is not set
> # CONFIG_DLM is not set
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_BIG_KEYS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_KEY_DH_OPERATIONS=3Dy
> # CONFIG_KEY_NOTIFICATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
> CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy
> # CONFIG_FORTIFY_SOURCE is not set
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_YAMA is not set
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> CONFIG_IMA_TEMPLATE=3Dy
> # CONFIG_IMA_NG_TEMPLATE is not set
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> # CONFIG_IMA_WRITE_POLICY is not set
> CONFIG_IMA_READ_POLICY=3Dy
> # CONFIG_IMA_APPRAISE is not set
> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
> CONFIG_EVM=3Dy
> CONFIG_EVM_ATTR_FSUUID=3Dy
> # CONFIG_EVM_ADD_XATTRS is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

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
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_ENGINE=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> # CONFIG_CRYPTO_ECDH is not set
> CONFIG_CRYPTO_ECRDSA=3Dy
> # CONFIG_CRYPTO_CURVE25519 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dm
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_SEQIV is not set
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
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_OFB=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> # CONFIG_CRYPTO_KEYWRAP is not set
> CONFIG_CRYPTO_NHPOLY1305=3Dy
> CONFIG_CRYPTO_ADIANTUM=3Dy
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
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> # CONFIG_CRYPTO_XXHASH is not set
> CONFIG_CRYPTO_BLAKE2B=3Dy
> CONFIG_CRYPTO_BLAKE2S=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dm
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_RMD128=3Dy
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> CONFIG_CRYPTO_SM3=3Dy
> CONFIG_CRYPTO_STREEBOG=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> # CONFIG_CRYPTO_WP512 is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> # CONFIG_CRYPTO_ARC4 is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> # CONFIG_CRYPTO_CAST5 is not set
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
> CONFIG_CRYPTO_SM4=3Dy
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> CONFIG_CRYPTO_LZ4=3Dy
> # CONFIG_CRYPTO_LZ4HC is not set
> CONFIG_CRYPTO_ZSTD=3Dy
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> # CONFIG_CRYPTO_DRBG_MENU is not set
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_ARC4=3Dm
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_BLAKE2S=3Dy
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CHACHA=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519=3Dy
> CONFIG_CRYPTO_LIB_DES=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_POLY1305=3Dy
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
> CONFIG_CRYPTO_DEV_GEODE=3Dy
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> CONFIG_CRYPTO_DEV_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_DD=3Dy
> CONFIG_CRYPTO_DEV_QAT=3Dy
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dy
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dy
> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dy
> CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> CONFIG_CRYPTO_DEV_SAFEXCEL=3Dy
> # CONFIG_CRYPTO_DEV_CCREE is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
> CONFIG_TPM_KEY_PARSER=3Dy
> # CONFIG_PKCS7_MESSAGE_PARSER is not set
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> # end of Certificates for signature checking
> =

> #
> # Library routines
> #
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
> # CONFIG_CRC_CCITT is not set
> CONFIG_CRC16=3Dy
> # CONFIG_CRC_T10DIF is not set
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC64 is not set
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dy
> # CONFIG_LIBCRC32C is not set
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> # CONFIG_XZ_DEC_X86 is not set
> # CONFIG_XZ_DEC_POWERPC is not set
> CONFIG_XZ_DEC_IA64=3Dy
> # CONFIG_XZ_DEC_ARM is not set
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_BCH=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_DMA_CMA=3Dy
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_PERCENTAGE=3D0
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> CONFIG_CMA_SIZE_SEL_PERCENTAGE=3Dy
> # CONFIG_CMA_SIZE_SEL_MIN is not set
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=3D8
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_LIBFDT=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_32=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_AUTOSELECT=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_STRING_SELFTEST=3Dy
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
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> # CONFIG_DYNAMIC_DEBUG_CORE is not set
> CONFIG_SYMBOLIC_ERRNAME=3Dy
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
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D8192
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> CONFIG_UBSAN_TRAP=3Dy
> # CONFIG_UBSAN_BOUNDS is not set
> # CONFIG_UBSAN_MISC is not set
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_TEST_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> CONFIG_DEBUG_PAGEALLOC=3Dy
> # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_PAGE_POISONING=3Dy
> # CONFIG_PAGE_POISONING_NO_SANITY is not set
> # CONFIG_PAGE_POISONING_ZERO is not set
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> CONFIG_DEBUG_WX=3Dy
> CONFIG_GENERIC_PTDUMP=3Dy
> CONFIG_PTDUMP_CORE=3Dy
> CONFIG_PTDUMP_DEBUGFS=3Dy
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> # CONFIG_DEBUG_SLAB is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> # CONFIG_DEBUG_VM is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> CONFIG_KASAN_STACK=3D1
> # end of Memory Debugging
> =

> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHEDSTATS is not set
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> CONFIG_DEBUG_PREEMPT=3Dy
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
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> # CONFIG_DEBUG_RWSEMS is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dy
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_STACKTRACE=3Dy
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PLIST is not set
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # end of Debug kernel data structures
> =

> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_PERF_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_EQS_DEBUG=3Dy
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
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
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> CONFIG_IO_DELAY_UDELAY=3Dy
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=3Dy
> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> CONFIG_FAULT_INJECTION=3Dy
> CONFIG_FAILSLAB=3Dy
> CONFIG_FAIL_PAGE_ALLOC=3Dy
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> # CONFIG_FAIL_MMC_REQUEST is not set
> CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> CONFIG_TEST_STRSCPY=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=3Dy
> CONFIG_TEST_BITMAP=3Dy
> # CONFIG_TEST_BITFIELD is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> # CONFIG_TEST_VMALLOC is not set
> # CONFIG_TEST_USER_COPY is not set
> # CONFIG_TEST_BPF is not set
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> CONFIG_TEST_FIRMWARE=3Dy
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_DEBUG_VIRTUAL is not set
> # CONFIG_TEST_MEMCAT_P is not set
> CONFIG_TEST_STACKINIT=3Dy
> # CONFIG_TEST_MEMINIT is not set
> # CONFIG_MEMTEST is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'trinity'
> 	export testcase=3D'trinity'
> 	export category=3D'functional'
> 	export need_memory=3D'300MB'
> 	export runtime=3D300
> 	export job_origin=3D'/lkp-src/allot/rand/vm-snb-i386/trinity.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit
> queue_at_least_once'
> 	export queue=3D'validate'
> 	export testbox=3D'vm-snb-i386-32'
> 	export tbox_group=3D'vm-snb-i386'
> 	export branch=3D'linux-next/master'
> 	export commit=3D'0ea9ee430e74b16c6b17e70757d1c26d8d140e1f'
> 	export kconfig=3D'i386-randconfig-a004-20200809'
> 	export repeat_to=3D4
> 	export nr_vm=3D64
> 	export submit_id=3D'5f3045d53d95e21ff86525eb'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-i386-32/trinity-300s-openw=
rt-i386-generic-20190428.cgz-0ea9ee430e74b16c6b17e70757d1c26d8d140e1f-20200=
810-8184-eltzvs-2.yaml'
> 	export id=3D'ee6befac576ecac6e4f6c9f4d41d9cb47aeb3dd9'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-i386 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'16G'
> 	export hdd_partitions=3D'/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /d=
ev/vdf'
> 	export swap_partitions=3D'/dev/vdg'
> 	export need_kconfig=3D'CONFIG_KVM_GUEST=3Dy'
> 	export ssh_base_port=3D23032
> 	export rootfs=3D'openwrt-i386-generic-20190428.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2020-08-10 02:52:05 +0800'
> 	export _id=3D'5f3045d53d95e21ff86525eb'
> 	export _rt=3D'/result/trinity/300s/vm-snb-i386/openwrt-i386-generic-2019=
0428.cgz/i386-randconfig-a004-20200809/gcc-9/0ea9ee430e74b16c6b17e70757d1c2=
6d8d140e1f'
> 	export user=3D'lkp'
> 	export result_root=3D'/result/trinity/300s/vm-snb-i386/openwrt-i386-gene=
ric-20190428.cgz/i386-randconfig-a004-20200809/gcc-9/0ea9ee430e74b16c6b17e7=
0757d1c26d8d140e1f/3'
> 	export scheduler_version=3D'/lkp/lkp/.src-20200805-150518'
> 	export LKP_SERVER=3D'inn'
> 	export arch=3D'i386'
> 	export max_uptime=3D1500
> 	export initrd=3D'/osimage/openwrt/openwrt-i386-generic-20190428.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/vm-snb-i386-32/trinity-300s-openwrt-i386-generi=
c-20190428.cgz-0ea9ee430e74b16c6b17e70757d1c26d8d140e1f-20200810-8184-eltzv=
s-2.yaml
> ARCH=3Di386
> kconfig=3Di386-randconfig-a004-20200809
> branch=3Dlinux-next/master
> commit=3D0ea9ee430e74b16c6b17e70757d1c26d8d140e1f
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a004-20200809/gcc-9/0ea9ee430e74b=
16c6b17e70757d1c26d8d140e1f/vmlinuz-5.8.0-00043-g0ea9ee430e74b
> max_uptime=3D1500
> RESULT_ROOT=3D/result/trinity/300s/vm-snb-i386/openwrt-i386-generic-20190=
428.cgz/i386-randconfig-a004-20200809/gcc-9/0ea9ee430e74b16c6b17e70757d1c26=
d8d140e1f/3
> LKP_SERVER=3Dinn
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
> 	export modules_initrd=3D'/pkg/linux/i386-randconfig-a004-20200809/gcc-9/=
0ea9ee430e74b16c6b17e70757d1c26d8d140e1f/modules.cgz'
> 	export bm_initrd=3D'/osimage/pkg/openwrt-i386-generic-20190428.cgz/trini=
ty-static-i386-x86_64-f93256fb_2019-08-28.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export schedule_notify_address=3D
> 	export queue_at_least_once=3D1
> 	export kernel=3D'/pkg/linux/i386-randconfig-a004-20200809/gcc-9/0ea9ee43=
0e74b16c6b17e70757d1c26d8d140e1f/vmlinuz-5.8.0-00043-g0ea9ee430e74b'
> 	export dequeue_time=3D'2020-08-10 02:55:39 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-i386-32/trinity-300s-ope=
nwrt-i386-generic-20190428.cgz-0ea9ee430e74b16c6b17e70757d1c26d8d140e1f-202=
00810-8184-eltzvs-2.cgz'
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

> 	run_test $LKP_SRC/tests/wrapper trinity
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper meminfo
> =

> 	$LKP_SRC/stats/wrapper time trinity.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"


> Seeding trinity based on i386-randconfig-a004-20200809
> 2020-08-09 18:56:55 trinity -q -q -l off -s 201168 -x get_robust_list -x =
remap_file_pages -N 999999999 -X
> Trinity 2019.06  Dave Jones <davej@codemonkey.org.uk>
> shm:0x774d9000-0x83c85e14 (4 pages)
> [main] Marking syscall get_robust_list (312) as to be disabled.
> [main] Marking syscall remap_file_pages (257) as to be disabled.
> Error getting nobody pwent (No such file or directory)

--===============4347513556932326425==--

