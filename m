Content-Type: multipart/mixed; boundary="===============0541993906151830182=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [srcu] 2ce62cbf3e: kobject(#):tried_to_init_an_initialized_object, something_is_seriously_wrong
Date: Mon, 24 Jun 2019 17:57:48 +0800
Message-ID: <b70f4f76-fbd9-84ff-2c63-b5efb62cd131@intel.com>
In-Reply-To: <20190620200123.GU26519@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0541993906151830182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/21/19 4:01 AM, Paul E. McKenney wrote:
> On Sun, May 05, 2019 at 02:38:56PM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 2ce62cbf3ebf647d3ef3640969b81e8b0b9466ad ("srcu: Allocate per-CP=
U data for DEFINE_SRCU() in modules")
>> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev.2=
019.04.28a
>>
>> in testcase: locktorture
>> with following parameters:
>>
>> 	runtime: 300s
>> 	test: cpuhotplug
>>
>> test-description: This torture test consists of creating a number of ker=
nel threads which acquire the lock and hold it for specific amount of time,=
 thus simulating different critical region behaviors.
>> test-url: https://www.kernel.org/doc/Documentation/locking/locktorture.t=
xt
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 2G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> +-----------------------------------------------------------------------=
------+------------+------------+
>> |                                                                       =
      | dccea1a8c4 | 2ce62cbf3e |
>> +-----------------------------------------------------------------------=
------+------------+------------+
>> | boot_successes                                                        =
      | 6          | 0          |
>> | boot_failures                                                         =
      | 4          | 10         |
>> | BUG:kernel_reboot-without-warning_in_test_stage                       =
      | 4          |            |
>> | kobject(#):tried_to_init_an_initialized_object,something_is_seriously_=
wrong | 0          | 10         |
>> | general_protection_fault:#[##]                                        =
      | 0          | 1          |
>> | RIP:string                                                            =
      | 0          | 1          |
>> | Kernel_panic-not_syncing:Fatal_exception                              =
      | 0          | 1          |
>> | BUG:kernel_hang_in_test_stage                                         =
      | 0          | 1          |
>> +-----------------------------------------------------------------------=
------+------------+------------+
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> [   23.381931] [TTM] Finalizing DMA pool allocator
>> LKP: HOSTNAME vm-snb-2G-162, MAC 52:54:00:12:34:56, kernel 5.1.0-rc1-001=
02-g2ce62cb 1, serial console /dev/ttyS0
>> [   23.407428] [TTM] Zone  kernel: Used memory at exit: 0 kiB
>> [   23.441178] [drm] Found bochs VGA, ID 0xb0c0.
>> [   23.442080] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfe=
bf0000.
>> [   23.482582] kobject ((____ptrval____)): tried to init an initialized =
object, something is seriously wrong.
>> [   23.484087] CPU: 0 PID: 348 Comm: systemd-udevd Not tainted 5.1.0-rc1=
-00102-g2ce62cb #1
>> [   23.485247] Call Trace:
>> [   23.485633]  dump_stack+0x6c/0x8f
>> [   23.486173]  kobject_init+0x45/0xa5
>> [   23.486748]  kobject_init_and_add+0x3d/0xa6
>> [   23.487541]  ? __module_address+0x8b/0xac
>> [   23.488122]  ? is_module_address+0x10/0x1f
>> [   23.488729]  ? static_obj+0x32/0x4a
>> [   23.489236]  ? 0xffffffffa00ef000
>> [   23.489781]  ttm_mem_global_init+0xb6/0x319 [ttm]
>> [   23.490525]  ? vprintk_func+0xd1/0xda
>> [   23.491139]  ? drm_dbg+0x7e/0x8b [drm]
>> [   23.491714]  ? printk+0x53/0x5b
>> [   23.492176]  ttm_bo_device_init+0x68/0x2c3 [ttm]
>> [   23.492913]  bochs_mm_init+0x40/0xa8 [bochs_drm]
>> [   23.493761]  bochs_pci_probe+0x117/0x17f [bochs_drm]
>> [   23.494837]  local_pci_probe+0x47/0x9d
>> [   23.495594]  pci_device_probe+0x17f/0x1cd
>> [   23.496443]  ? pci_device_remove+0xcf/0xcf
>> [   23.497255]  really_probe+0x255/0x584
>> [   23.498033]  ? pm_runtime_put_noidle+0x1c/0x1f
>> [   23.498958]  driver_probe_device+0x128/0x176
>> [   23.499834]  device_driver_attach+0x4e/0x6a
>> [   23.500737]  __driver_attach+0x170/0x182
>> [   23.501538]  ? device_driver_attach+0x6a/0x6a
>> [   23.502398]  bus_for_each_dev+0x9d/0xc5
>> [   23.503143]  driver_attach+0x22/0x25
>> [   23.503848]  bus_add_driver+0x157/0x240
>> [   23.504622]  driver_register+0xe4/0x131
>> [   23.505361]  __pci_register_driver+0x78/0x7f
>> [   23.506189]  bochs_init+0x62/0x1000 [bochs_drm]
>> [   23.507075]  ? 0xffffffffa012e000
>> [   23.507921]  do_one_initcall+0x7f/0x17f
>> [   23.508785]  ? cache_alloc_debugcheck_after+0x4b/0x148
>> [   23.509793]  ? do_init_module+0x21/0x3b1
>> [   23.510569]  ? kmem_cache_alloc+0x9b/0xbb
>> [   23.511393]  do_init_module+0x5a/0x3b1
>> [   23.512133]  load_module+0x11c6/0x1786
>> [   23.512878]  ? vfs_read+0xf3/0x102
>> [   23.519413]  ? allow_write_access+0x27/0x2a
>> [   23.520276]  ? kernel_read_file+0x17f/0x191
>> [   23.521214]  __do_sys_finit_module+0xb5/0xc5
>> [   23.522138]  ? __do_sys_finit_module+0xb5/0xc5
>> [   23.523121]  __x64_sys_finit_module+0x15/0x17
>> [   23.524236]  do_syscall_64+0x1a0/0x1bd
>> [   23.525042]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [   23.526078] RIP: 0033:0x7f1b0a25a229
>> [   23.526845] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 =
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 =
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3f 4c 2b 00 f7 d8 64 89 01 48
>> [   23.530673] RSP: 002b:00007ffd8ca3e9f8 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000139
>> [   23.532210] RAX: ffffffffffffffda RBX: 0000559388c5d5a0 RCX: 00007f1b=
0a25a229
>> [   23.533655] RDX: 0000000000000000 RSI: 00007f1b0ab73265 RDI: 00000000=
00000014
>> [   23.535344] RBP: 00007f1b0ab73265 R08: 0000000000000000 R09: 00007ffd=
8ca3ef70
>> [   23.536799] R10: 0000000000000014 R11: 0000000000000246 R12: 00000000=
00000000
>> [   23.538252] R13: 0000559388c5cb30 R14: 0000000000020000 R15: 00005593=
8884ecbc
>> [   23.539976] [TTM] Zone  kernel: Available graphics memory: 1007378 kiB
>> [   23.541308] [TTM] Zone  kernel: Available graphics memory: 1007378 kiB
>> [   23.542643] [TTM] Initializing pool allocator
>> [   23.543570] [TTM] Initializing DMA pool allocator
>> [   23.544623] kobject ((____ptrval____)): tried to init an initialized =
object, something is seriously wrong.
>> [   23.546549] CPU: 0 PID: 348 Comm: systemd-udevd Not tainted 5.1.0-rc1=
-00102-g2ce62cb #1
>> [   23.548159] Call Trace:
>> [   23.548694]  dump_stack+0x6c/0x8f
>> [   23.549389]  kobject_init+0x45/0xa5
>> [   23.550098]  kobject_init_and_add+0x3d/0xa6
>> [   23.550961]  ? alloc_pages_current+0xcb/0xdb
>> [   23.551860]  ttm_bo_device_init+0x156/0x2c3 [ttm]
>> [   23.552850]  bochs_mm_init+0x40/0xa8 [bochs_drm]
>> [   23.553817]  bochs_pci_probe+0x117/0x17f [bochs_drm]
>> [   23.554945]  local_pci_probe+0x47/0x9d
>> [   23.555560] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700,=
 revision 0
>> [   23.566712]  pci_device_probe+0x17f/0x1cd
>> [   23.566721]  ? pci_device_remove+0xcf/0xcf
>> [   23.566732]  really_probe+0x255/0x584
>> [   23.576323]  ? pm_runtime_put_noidle+0x1c/0x1f
>> [   23.577326]  driver_probe_device+0x128/0x176
>> [   23.578213]  device_driver_attach+0x4e/0x6a
>> [   23.581556]  __driver_attach+0x170/0x182
>> [   23.582294]  ? device_driver_attach+0x6a/0x6a
>> [   23.583115]  bus_for_each_dev+0x9d/0xc5
>> [   23.583852]  driver_attach+0x22/0x25
>> [   23.584553]  bus_add_driver+0x157/0x240
>> [   23.585292]  driver_register+0xe4/0x131
>> [   23.586166]  __pci_register_driver+0x78/0x7f
>> [   23.586987]  bochs_init+0x62/0x1000 [bochs_drm]
>> [   23.587839]  ? 0xffffffffa012e000
>> [   23.588481]  do_one_initcall+0x7f/0x17f
>> [   23.589209]  ? cache_alloc_debugcheck_after+0x4b/0x148
>> [   23.590167]  ? do_init_module+0x21/0x3b1
>> [   23.590913]  ? kmem_cache_alloc+0x9b/0xbb
>> [   23.591676]  do_init_module+0x5a/0x3b1
>> [   23.592395]  load_module+0x11c6/0x1786
>> [   23.593109]  ? vfs_read+0xf3/0x102
>> [   23.593740]  ? allow_write_access+0x27/0x2a
>> [   23.594511]  ? kernel_read_file+0x17f/0x191
>> [   23.595269]  __do_sys_finit_module+0xb5/0xc5
>> [   23.596054]  ? __do_sys_finit_module+0xb5/0xc5
>> [   23.596865]  __x64_sys_finit_module+0x15/0x17
>> [   23.597656]  do_syscall_64+0x1a0/0x1bd
>> [   23.598345]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [   23.599297] RIP: 0033:0x7f1b0a25a229
>> [   23.599976] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 =
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 =
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3f 4c 2b 00 f7 d8 64 89 01 48
>> [   23.603530] RSP: 002b:00007ffd8ca3e9f8 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000139
>> [   23.604925] RAX: ffffffffffffffda RBX: 0000559388c5d5a0 RCX: 00007f1b=
0a25a229
>> [   23.606369] RDX: 0000000000000000 RSI: 00007f1b0ab73265 RDI: 00000000=
00000014
>> [   23.607728] RBP: 00007f1b0ab73265 R08: 0000000000000000 R09: 00007ffd=
8ca3ef70
>> [   23.609066] R10: 0000000000000014 R11: 0000000000000246 R12: 00000000=
00000000
>> [   23.612060] R13: 0000559388c5cb30 R14: 0000000000020000 R15: 00005593=
8884ecbc
>> [   23.625106] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02=
.0 on minor 0
>> [   23.830835] Probing IDE interface ide1...
>> [   23.949174] input: ImExPS/2 Generic Explorer Mouse as /devices/platfo=
rm/i8042/serio1/input/input6
>>
>>
>> To reproduce:
>>
>>          # build kernel
>> 	cd linux
>> 	cp config-5.1.0-rc1-00102-g2ce62cb .config
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
>>
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>> 	bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is att=
ached in this email
> I couldn't see how that commit could result in this problem, so
> I eventually tried out your reproducer above.
>
> This doesn't reproduce for me, but it does complain about not being able
> to mount a 9P filesystem.  So I modified the .config to include
> CONFIG_9P_FS=3Dy.  This resulted in complaints about 9p/virtfs_mount,
> so I enabled the other three CONFIG_9P_FS-related Kconfig options.
> Which did not help.  And it turns out that numerous additional Kconfig
> options are required, courtesy of the usual web search, culminating
> in CONFIG_VIRTIO_PCI=3Dy.
>
> And then it won't reproduce.
>
> OK, so I am running the -rcu tree's current "dev" branch, so why not
> try the current version of the commit called out above?  Which is:
> fe15b50cdeee ("srcu: Allocate per-CPU data for DEFINE_SRCU() in modules")
>
> And it won't reproduce there, either.
>
> So, is this still happening at your end?

Hi Paul,

I rebuilt the kernel and the problem is gone. I think it's a false positive.

My sincere apologies for the inconvenience.

Best Regards,
Rong Chen


>
> 							Thanx, Paul
>
>> Thanks,
>> lkp
>>
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86_64 5.1.0-rc1 Kernel Configuration
>> #
>>
>> #
>> # Compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
>> #
>> CONFIG_CC_IS_GCC=3Dy
>> CONFIG_GCC_VERSION=3D70300
>> CONFIG_CLANG_VERSION=3D0
>> CONFIG_CC_HAS_ASM_GOTO=3Dy
>> CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=3Dy
>> CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED=3Dy
>> CONFIG_IRQ_WORK=3Dy
>> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
>> CONFIG_THREAD_INFO_IN_TASK=3Dy
>>
>> #
>> # General setup
>> #
>> CONFIG_INIT_ENV_ARG_LIMIT=3D32
>> # CONFIG_COMPILE_TEST is not set
>> CONFIG_LOCALVERSION=3D""
>> CONFIG_LOCALVERSION_AUTO=3Dy
>> CONFIG_BUILD_SALT=3D""
>> CONFIG_HAVE_KERNEL_GZIP=3Dy
>> CONFIG_HAVE_KERNEL_BZIP2=3Dy
>> CONFIG_HAVE_KERNEL_LZMA=3Dy
>> CONFIG_HAVE_KERNEL_XZ=3Dy
>> CONFIG_HAVE_KERNEL_LZO=3Dy
>> CONFIG_HAVE_KERNEL_LZ4=3Dy
>> # CONFIG_KERNEL_GZIP is not set
>> # CONFIG_KERNEL_BZIP2 is not set
>> # CONFIG_KERNEL_LZMA is not set
>> CONFIG_KERNEL_XZ=3Dy
>> # CONFIG_KERNEL_LZO is not set
>> # CONFIG_KERNEL_LZ4 is not set
>> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>> CONFIG_SWAP=3Dy
>> # CONFIG_SYSVIPC is not set
>> CONFIG_POSIX_MQUEUE=3Dy
>> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
>> CONFIG_CROSS_MEMORY_ATTACH=3Dy
>> CONFIG_USELIB=3Dy
>> CONFIG_AUDIT=3Dy
>> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>> CONFIG_AUDITSYSCALL=3Dy
>>
>> #
>> # IRQ subsystem
>> #
>> CONFIG_GENERIC_IRQ_PROBE=3Dy
>> CONFIG_GENERIC_IRQ_SHOW=3Dy
>> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
>> CONFIG_GENERIC_PENDING_IRQ=3Dy
>> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
>> CONFIG_GENERIC_IRQ_CHIP=3Dy
>> CONFIG_IRQ_DOMAIN=3Dy
>> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
>> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
>> CONFIG_IRQ_FORCED_THREADING=3Dy
>> CONFIG_SPARSE_IRQ=3Dy
>> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
>> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
>> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
>> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
>> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
>> CONFIG_GENERIC_CMOS_UPDATE=3Dy
>>
>> #
>> # Timers subsystem
>> #
>> CONFIG_TICK_ONESHOT=3Dy
>> CONFIG_NO_HZ_COMMON=3Dy
>> # CONFIG_HZ_PERIODIC is not set
>> # CONFIG_NO_HZ_IDLE is not set
>> CONFIG_NO_HZ_FULL=3Dy
>> CONFIG_CONTEXT_TRACKING=3Dy
>> CONFIG_CONTEXT_TRACKING_FORCE=3Dy
>> CONFIG_NO_HZ=3Dy
>> # CONFIG_HIGH_RES_TIMERS is not set
>> CONFIG_PREEMPT_NONE=3Dy
>> # CONFIG_PREEMPT_VOLUNTARY is not set
>> # CONFIG_PREEMPT is not set
>> CONFIG_PREEMPT_COUNT=3Dy
>>
>> #
>> # CPU/Task time and stats accounting
>> #
>> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
>> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
>> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
>> # CONFIG_BSD_PROCESS_ACCT is not set
>> # CONFIG_TASKSTATS is not set
>> # CONFIG_PSI is not set
>> CONFIG_CPU_ISOLATION=3Dy
>>
>> #
>> # RCU Subsystem
>> #
>> CONFIG_TREE_RCU=3Dy
>> # CONFIG_RCU_EXPERT is not set
>> CONFIG_SRCU=3Dy
>> CONFIG_TREE_SRCU=3Dy
>> CONFIG_TASKS_RCU=3Dy
>> CONFIG_RCU_STALL_COMMON=3Dy
>> CONFIG_RCU_NEED_SEGCBLIST=3Dy
>> CONFIG_RCU_NOCB_CPU=3Dy
>> CONFIG_BUILD_BIN2C=3Dy
>> CONFIG_IKCONFIG=3Dy
>> CONFIG_IKCONFIG_PROC=3Dy
>> CONFIG_LOG_BUF_SHIFT=3D20
>> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
>> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
>> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>> CONFIG_ARCH_SUPPORTS_INT128=3Dy
>> # CONFIG_NUMA_BALANCING is not set
>> CONFIG_CGROUPS=3Dy
>> # CONFIG_MEMCG is not set
>> # CONFIG_BLK_CGROUP is not set
>> CONFIG_CGROUP_SCHED=3Dy
>> CONFIG_FAIR_GROUP_SCHED=3Dy
>> CONFIG_CFS_BANDWIDTH=3Dy
>> CONFIG_RT_GROUP_SCHED=3Dy
>> # CONFIG_CGROUP_PIDS is not set
>> # CONFIG_CGROUP_RDMA is not set
>> CONFIG_CGROUP_FREEZER=3Dy
>> # CONFIG_CPUSETS is not set
>> CONFIG_CGROUP_DEVICE=3Dy
>> # CONFIG_CGROUP_CPUACCT is not set
>> # CONFIG_CGROUP_PERF is not set
>> CONFIG_CGROUP_DEBUG=3Dy
>> # CONFIG_NAMESPACES is not set
>> CONFIG_CHECKPOINT_RESTORE=3Dy
>> CONFIG_SCHED_AUTOGROUP=3Dy
>> # CONFIG_SYSFS_DEPRECATED is not set
>> CONFIG_RELAY=3Dy
>> CONFIG_BLK_DEV_INITRD=3Dy
>> CONFIG_INITRAMFS_SOURCE=3D""
>> CONFIG_RD_GZIP=3Dy
>> CONFIG_RD_BZIP2=3Dy
>> # CONFIG_RD_LZMA is not set
>> CONFIG_RD_XZ=3Dy
>> CONFIG_RD_LZO=3Dy
>> # CONFIG_RD_LZ4 is not set
>> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
>> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>> CONFIG_SYSCTL=3Dy
>> CONFIG_ANON_INODES=3Dy
>> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>> CONFIG_BPF=3Dy
>> CONFIG_EXPERT=3Dy
>> CONFIG_MULTIUSER=3Dy
>> CONFIG_SGETMASK_SYSCALL=3Dy
>> CONFIG_SYSFS_SYSCALL=3Dy
>> # CONFIG_SYSCTL_SYSCALL is not set
>> CONFIG_FHANDLE=3Dy
>> CONFIG_POSIX_TIMERS=3Dy
>> CONFIG_PRINTK=3Dy
>> CONFIG_PRINTK_NMI=3Dy
>> CONFIG_BUG=3Dy
>> # CONFIG_ELF_CORE is not set
>> # CONFIG_PCSPKR_PLATFORM is not set
>> CONFIG_BASE_FULL=3Dy
>> CONFIG_FUTEX=3Dy
>> CONFIG_FUTEX_PI=3Dy
>> CONFIG_EPOLL=3Dy
>> CONFIG_SIGNALFD=3Dy
>> CONFIG_TIMERFD=3Dy
>> # CONFIG_EVENTFD is not set
>> CONFIG_SHMEM=3Dy
>> # CONFIG_AIO is not set
>> CONFIG_IO_URING=3Dy
>> # CONFIG_ADVISE_SYSCALLS is not set
>> CONFIG_MEMBARRIER=3Dy
>> CONFIG_KALLSYMS=3Dy
>> CONFIG_KALLSYMS_ALL=3Dy
>> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
>> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>> # CONFIG_BPF_SYSCALL is not set
>> # CONFIG_USERFAULTFD is not set
>> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
>> # CONFIG_RSEQ is not set
>> CONFIG_EMBEDDED=3Dy
>> CONFIG_HAVE_PERF_EVENTS=3Dy
>> # CONFIG_PC104 is not set
>>
>> #
>> # Kernel Performance Events And Counters
>> #
>> CONFIG_PERF_EVENTS=3Dy
>> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>> # CONFIG_VM_EVENT_COUNTERS is not set
>> # CONFIG_COMPAT_BRK is not set
>> CONFIG_SLAB=3Dy
>> # CONFIG_SLUB is not set
>> # CONFIG_SLOB is not set
>> CONFIG_SLAB_MERGE_DEFAULT=3Dy
>> # CONFIG_SLAB_FREELIST_RANDOM is not set
>> # CONFIG_PROFILING is not set
>> CONFIG_64BIT=3Dy
>> CONFIG_X86_64=3Dy
>> CONFIG_X86=3Dy
>> CONFIG_INSTRUCTION_DECODER=3Dy
>> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
>> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
>> CONFIG_LOCKDEP_SUPPORT=3Dy
>> CONFIG_STACKTRACE_SUPPORT=3Dy
>> CONFIG_MMU=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
>> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>> CONFIG_GENERIC_BUG=3Dy
>> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
>> CONFIG_GENERIC_HWEIGHT=3Dy
>> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
>> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
>> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
>> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
>> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
>> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
>> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
>> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
>> CONFIG_ZONE_DMA32=3Dy
>> CONFIG_AUDIT_ARCH=3Dy
>> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
>> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>> CONFIG_X86_64_SMP=3Dy
>> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>> CONFIG_FIX_EARLYCON_MEM=3Dy
>> CONFIG_PGTABLE_LEVELS=3D4
>> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
>>
>> #
>> # Processor type and features
>> #
>> CONFIG_ZONE_DMA=3Dy
>> CONFIG_SMP=3Dy
>> CONFIG_X86_FEATURE_NAMES=3Dy
>> CONFIG_X86_X2APIC=3Dy
>> # CONFIG_X86_MPPARSE is not set
>> # CONFIG_GOLDFISH is not set
>> CONFIG_RETPOLINE=3Dy
>> # CONFIG_X86_CPU_RESCTRL is not set
>> CONFIG_X86_EXTENDED_PLATFORM=3Dy
>> # CONFIG_X86_NUMACHIP is not set
>> CONFIG_X86_VSMP=3Dy
>> # CONFIG_X86_GOLDFISH is not set
>> # CONFIG_X86_INTEL_MID is not set
>> # CONFIG_X86_INTEL_LPSS is not set
>> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
>> CONFIG_IOSF_MBI=3Dy
>> # CONFIG_IOSF_MBI_DEBUG is not set
>> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
>> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>> CONFIG_HYPERVISOR_GUEST=3Dy
>> CONFIG_PARAVIRT=3Dy
>> # CONFIG_PARAVIRT_DEBUG is not set
>> CONFIG_PARAVIRT_SPINLOCKS=3Dy
>> # CONFIG_QUEUED_LOCK_STAT is not set
>> # CONFIG_XEN is not set
>> CONFIG_KVM_GUEST=3Dy
>> # CONFIG_PVH is not set
>> # CONFIG_KVM_DEBUG_FS is not set
>> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
>> CONFIG_PARAVIRT_CLOCK=3Dy
>> CONFIG_JAILHOUSE_GUEST=3Dy
>> # CONFIG_MK8 is not set
>> # CONFIG_MPSC is not set
>> # CONFIG_MCORE2 is not set
>> # CONFIG_MATOM is not set
>> CONFIG_GENERIC_CPU=3Dy
>> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D12
>> CONFIG_X86_L1_CACHE_SHIFT=3D6
>> CONFIG_X86_TSC=3Dy
>> CONFIG_X86_CMPXCHG64=3Dy
>> CONFIG_X86_CMOV=3Dy
>> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
>> CONFIG_X86_DEBUGCTLMSR=3Dy
>> # CONFIG_PROCESSOR_SELECT is not set
>> CONFIG_CPU_SUP_INTEL=3Dy
>> CONFIG_CPU_SUP_AMD=3Dy
>> CONFIG_CPU_SUP_HYGON=3Dy
>> CONFIG_CPU_SUP_CENTAUR=3Dy
>> CONFIG_HPET_TIMER=3Dy
>> # CONFIG_DMI is not set
>> CONFIG_GART_IOMMU=3Dy
>> # CONFIG_CALGARY_IOMMU is not set
>> CONFIG_MAXSMP=3Dy
>> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
>> CONFIG_NR_CPUS_RANGE_END=3D8192
>> CONFIG_NR_CPUS_DEFAULT=3D8192
>> CONFIG_NR_CPUS=3D8192
>> CONFIG_SCHED_SMT=3Dy
>> # CONFIG_SCHED_MC is not set
>> CONFIG_X86_LOCAL_APIC=3Dy
>> CONFIG_X86_IO_APIC=3Dy
>> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
>> CONFIG_X86_MCE=3Dy
>> CONFIG_X86_MCELOG_LEGACY=3Dy
>> # CONFIG_X86_MCE_INTEL is not set
>> CONFIG_X86_MCE_AMD=3Dy
>> CONFIG_X86_MCE_THRESHOLD=3Dy
>> CONFIG_X86_MCE_INJECT=3Dm
>>
>> #
>> # Performance monitoring
>> #
>> # CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
>> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
>> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
>> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
>> CONFIG_X86_VSYSCALL_EMULATION=3Dy
>> CONFIG_I8K=3Dm
>> # CONFIG_MICROCODE is not set
>> CONFIG_X86_MSR=3Dy
>> CONFIG_X86_CPUID=3Dm
>> # CONFIG_X86_5LEVEL is not set
>> CONFIG_X86_DIRECT_GBPAGES=3Dy
>> # CONFIG_X86_CPA_STATISTICS is not set
>> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
>> # CONFIG_AMD_MEM_ENCRYPT is not set
>> CONFIG_NUMA=3Dy
>> CONFIG_AMD_NUMA=3Dy
>> CONFIG_X86_64_ACPI_NUMA=3Dy
>> CONFIG_NODES_SPAN_OTHER_NODES=3Dy
>> CONFIG_NUMA_EMU=3Dy
>> CONFIG_NODES_SHIFT=3D10
>> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
>> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_ARCH_MEMORY_PROBE=3Dy
>> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
>> # CONFIG_X86_PMEM_LEGACY is not set
>> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
>> CONFIG_X86_RESERVE_LOW=3D64
>> CONFIG_MTRR=3Dy
>> # CONFIG_MTRR_SANITIZER is not set
>> # CONFIG_X86_PAT is not set
>> # CONFIG_ARCH_RANDOM is not set
>> # CONFIG_X86_SMAP is not set
>> # CONFIG_X86_INTEL_UMIP is not set
>> CONFIG_X86_INTEL_MPX=3Dy
>> # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
>> # CONFIG_EFI is not set
>> CONFIG_SECCOMP=3Dy
>> # CONFIG_HZ_100 is not set
>> # CONFIG_HZ_250 is not set
>> CONFIG_HZ_300=3Dy
>> # CONFIG_HZ_1000 is not set
>> CONFIG_HZ=3D300
>> # CONFIG_KEXEC is not set
>> # CONFIG_KEXEC_FILE is not set
>> CONFIG_CRASH_DUMP=3Dy
>> CONFIG_PHYSICAL_START=3D0x1000000
>> CONFIG_RELOCATABLE=3Dy
>> # CONFIG_RANDOMIZE_BASE is not set
>> CONFIG_PHYSICAL_ALIGN=3D0x200000
>> CONFIG_HOTPLUG_CPU=3Dy
>> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
>> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
>> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
>> # CONFIG_LEGACY_VSYSCALL_NONE is not set
>> # CONFIG_CMDLINE_BOOL is not set
>> # CONFIG_MODIFY_LDT_SYSCALL is not set
>> CONFIG_HAVE_LIVEPATCH=3Dy
>> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
>> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
>> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
>> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
>>
>> #
>> # Power management and ACPI options
>> #
>> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
>> # CONFIG_SUSPEND is not set
>> CONFIG_HIBERNATE_CALLBACKS=3Dy
>> CONFIG_HIBERNATION=3Dy
>> CONFIG_PM_STD_PARTITION=3D""
>> CONFIG_PM_SLEEP=3Dy
>> CONFIG_PM_SLEEP_SMP=3Dy
>> # CONFIG_PM_AUTOSLEEP is not set
>> CONFIG_PM_WAKELOCKS=3Dy
>> CONFIG_PM_WAKELOCKS_LIMIT=3D100
>> # CONFIG_PM_WAKELOCKS_GC is not set
>> CONFIG_PM=3Dy
>> CONFIG_PM_DEBUG=3Dy
>> CONFIG_PM_ADVANCED_DEBUG=3Dy
>> CONFIG_PM_SLEEP_DEBUG=3Dy
>> # CONFIG_PM_TRACE_RTC is not set
>> CONFIG_PM_CLK=3Dy
>> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
>> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
>> CONFIG_ACPI=3Dy
>> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
>> # CONFIG_ACPI_DEBUGGER is not set
>> CONFIG_ACPI_SPCR_TABLE=3Dy
>> CONFIG_ACPI_LPIT=3Dy
>> CONFIG_ACPI_SLEEP=3Dy
>> # CONFIG_ACPI_PROCFS_POWER is not set
>> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>> # CONFIG_ACPI_EC_DEBUGFS is not set
>> CONFIG_ACPI_AC=3Dy
>> CONFIG_ACPI_BATTERY=3Dy
>> CONFIG_ACPI_BUTTON=3Dy
>> CONFIG_ACPI_VIDEO=3Dm
>> CONFIG_ACPI_FAN=3Dy
>> # CONFIG_ACPI_TAD is not set
>> # CONFIG_ACPI_DOCK is not set
>> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
>> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>> CONFIG_ACPI_PROCESSOR=3Dy
>> # CONFIG_ACPI_IPMI is not set
>> CONFIG_ACPI_HOTPLUG_CPU=3Dy
>> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
>> CONFIG_ACPI_THERMAL=3Dy
>> CONFIG_ACPI_NUMA=3Dy
>> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
>> CONFIG_ACPI_TABLE_UPGRADE=3Dy
>> # CONFIG_ACPI_DEBUG is not set
>> # CONFIG_ACPI_PCI_SLOT is not set
>> CONFIG_ACPI_CONTAINER=3Dy
>> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
>> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
>> # CONFIG_ACPI_SBS is not set
>> # CONFIG_ACPI_HED is not set
>> # CONFIG_ACPI_CUSTOM_METHOD is not set
>> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
>> # CONFIG_ACPI_NFIT is not set
>> CONFIG_HAVE_ACPI_APEI=3Dy
>> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>> # CONFIG_ACPI_APEI is not set
>> # CONFIG_DPTF_POWER is not set
>> # CONFIG_PMIC_OPREGION is not set
>> # CONFIG_ACPI_CONFIGFS is not set
>> CONFIG_X86_PM_TIMER=3Dy
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
>> # CONFIG_CPU_IDLE_GOV_TEO is not set
>> # CONFIG_INTEL_IDLE is not set
>>
>> #
>> # Bus options (PCI etc.)
>> #
>> CONFIG_PCI_DIRECT=3Dy
>> CONFIG_PCI_MMCONFIG=3Dy
>> CONFIG_MMCONF_FAM10H=3Dy
>> # CONFIG_PCI_CNB20LE_QUIRK is not set
>> CONFIG_ISA_BUS=3Dy
>> # CONFIG_ISA_DMA_API is not set
>> CONFIG_AMD_NB=3Dy
>> CONFIG_X86_SYSFB=3Dy
>>
>> #
>> # Binary Emulations
>> #
>> # CONFIG_IA32_EMULATION is not set
>> # CONFIG_X86_X32 is not set
>> CONFIG_X86_DEV_DMA_OPS=3Dy
>> CONFIG_HAVE_GENERIC_GUP=3Dy
>>
>> #
>> # Firmware Drivers
>> #
>> CONFIG_EDD=3Dy
>> CONFIG_EDD_OFF=3Dy
>> CONFIG_FIRMWARE_MEMMAP=3Dy
>> # CONFIG_ISCSI_IBFT_FIND is not set
>> CONFIG_FW_CFG_SYSFS=3Dm
>> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
>> CONFIG_GOOGLE_FIRMWARE=3Dy
>> # CONFIG_GOOGLE_COREBOOT_TABLE is not set
>> CONFIG_EFI_EARLYCON=3Dy
>>
>> #
>> # Tegra firmware driver
>> #
>> CONFIG_HAVE_KVM=3Dy
>> CONFIG_VIRTUALIZATION=3Dy
>> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
>>
>> #
>> # General architecture-dependent options
>> #
>> CONFIG_HOTPLUG_SMT=3Dy
>> CONFIG_HAVE_OPROFILE=3Dy
>> CONFIG_OPROFILE_NMI_TIMER=3Dy
>> # CONFIG_KPROBES is not set
>> # CONFIG_JUMP_LABEL is not set
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>> CONFIG_HAVE_IOREMAP_PROT=3Dy
>> CONFIG_HAVE_KPROBES=3Dy
>> CONFIG_HAVE_KRETPROBES=3Dy
>> CONFIG_HAVE_OPTPROBES=3Dy
>> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
>> CONFIG_HAVE_NMI=3Dy
>> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
>> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
>> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
>> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>> CONFIG_HAVE_RSEQ=3Dy
>> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
>> CONFIG_HAVE_CLK=3Dy
>> CONFIG_HAVE_HW_BREAKPOINT=3Dy
>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HAVE_PERF_REGS=3Dy
>> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
>> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
>> CONFIG_HAVE_RCU_TABLE_INVALIDATE=3Dy
>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>> CONFIG_SECCOMP_FILTER=3Dy
>> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
>> CONFIG_HAVE_STACKPROTECTOR=3Dy
>> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
>> # CONFIG_STACKPROTECTOR is not set
>> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
>> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_MOVE_PMD=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
>> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
>> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
>> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
>> CONFIG_MODULES_USE_ELF_RELA=3Dy
>> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>> CONFIG_HAVE_EXIT_THREAD=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS=3D28
>> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>> CONFIG_HAVE_STACK_VALIDATION=3Dy
>> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
>> CONFIG_ISA_BUS_API=3Dy
>> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
>> # CONFIG_VMAP_STACK is not set
>> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
>> CONFIG_STRICT_KERNEL_RWX=3Dy
>> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
>> CONFIG_STRICT_MODULE_RWX=3Dy
>> CONFIG_ARCH_HAS_REFCOUNT=3Dy
>> # CONFIG_REFCOUNT_FULL is not set
>> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
>> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
>>
>> #
>> # GCOV-based kernel profiling
>> #
>> # CONFIG_GCOV_KERNEL is not set
>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>> CONFIG_PLUGIN_HOSTCC=3D"g++"
>> CONFIG_HAVE_GCC_PLUGINS=3Dy
>> CONFIG_GCC_PLUGINS=3Dy
>> # CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
>> CONFIG_GCC_PLUGIN_LATENT_ENTROPY=3Dy
>> # CONFIG_GCC_PLUGIN_STRUCTLEAK is not set
>> # CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
>> # CONFIG_GCC_PLUGIN_STACKLEAK is not set
>> CONFIG_RT_MUTEXES=3Dy
>> CONFIG_BASE_SMALL=3D0
>> CONFIG_MODULES=3Dy
>> # CONFIG_MODULE_FORCE_LOAD is not set
>> # CONFIG_MODULE_UNLOAD is not set
>> # CONFIG_MODVERSIONS is not set
>> # CONFIG_MODULE_SRCVERSION_ALL is not set
>> # CONFIG_MODULE_SIG is not set
>> # CONFIG_MODULE_COMPRESS is not set
>> # CONFIG_TRIM_UNUSED_KSYMS is not set
>> CONFIG_MODULES_TREE_LOOKUP=3Dy
>> CONFIG_BLOCK=3Dy
>> CONFIG_BLK_SCSI_REQUEST=3Dy
>> CONFIG_BLK_DEV_BSG=3Dy
>> CONFIG_BLK_DEV_BSGLIB=3Dy
>> CONFIG_BLK_DEV_INTEGRITY=3Dy
>> # CONFIG_BLK_DEV_ZONED is not set
>> # CONFIG_BLK_CMDLINE_PARSER is not set
>> CONFIG_BLK_WBT=3Dy
>> CONFIG_BLK_WBT_MQ=3Dy
>> CONFIG_BLK_DEBUG_FS=3Dy
>> CONFIG_BLK_SED_OPAL=3Dy
>>
>> #
>> # Partition Types
>> #
>> # CONFIG_PARTITION_ADVANCED is not set
>> CONFIG_MSDOS_PARTITION=3Dy
>> CONFIG_EFI_PARTITION=3Dy
>> CONFIG_BLK_MQ_PCI=3Dy
>> CONFIG_BLK_MQ_VIRTIO=3Dy
>> CONFIG_BLK_PM=3Dy
>>
>> #
>> # IO Schedulers
>> #
>> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
>> # CONFIG_MQ_IOSCHED_KYBER is not set
>> CONFIG_IOSCHED_BFQ=3Dm
>> CONFIG_PADATA=3Dy
>> CONFIG_ASN1=3Dy
>> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
>> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
>> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
>> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
>> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>> CONFIG_QUEUED_SPINLOCKS=3Dy
>> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>> CONFIG_QUEUED_RWLOCKS=3Dy
>> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
>> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
>> CONFIG_FREEZER=3Dy
>>
>> #
>> # Executable file formats
>> #
>> CONFIG_BINFMT_ELF=3Dy
>> CONFIG_ELFCORE=3Dy
>> CONFIG_BINFMT_SCRIPT=3Dy
>> # CONFIG_BINFMT_MISC is not set
>> CONFIG_COREDUMP=3Dy
>>
>> #
>> # Memory Management options
>> #
>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_SPARSEMEM_MANUAL=3Dy
>> CONFIG_SPARSEMEM=3Dy
>> CONFIG_NEED_MULTIPLE_NODES=3Dy
>> CONFIG_HAVE_MEMORY_PRESENT=3Dy
>> CONFIG_SPARSEMEM_EXTREME=3Dy
>> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
>> # CONFIG_SPARSEMEM_VMEMMAP is not set
>> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>> CONFIG_MEMORY_ISOLATION=3Dy
>> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
>> CONFIG_MEMORY_HOTPLUG=3Dy
>> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
>> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
>> CONFIG_MEMORY_HOTREMOVE=3Dy
>> CONFIG_SPLIT_PTLOCK_CPUS=3D4
>> CONFIG_COMPACTION=3Dy
>> CONFIG_MIGRATION=3Dy
>> CONFIG_PHYS_ADDR_T_64BIT=3Dy
>> CONFIG_BOUNCE=3Dy
>> CONFIG_VIRT_TO_BUS=3Dy
>> CONFIG_MMU_NOTIFIER=3Dy
>> # CONFIG_KSM is not set
>> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
>> CONFIG_MEMORY_FAILURE=3Dy
>> # CONFIG_HWPOISON_INJECT is not set
>> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
>> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
>> CONFIG_THP_SWAP=3Dy
>> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
>> # CONFIG_CLEANCACHE is not set
>> CONFIG_FRONTSWAP=3Dy
>> # CONFIG_CMA is not set
>> # CONFIG_MEM_SOFT_DIRTY is not set
>> # CONFIG_ZSWAP is not set
>> # CONFIG_ZPOOL is not set
>> CONFIG_ZBUD=3Dy
>> # CONFIG_ZSMALLOC is not set
>> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
>> CONFIG_IDLE_PAGE_TRACKING=3Dy
>> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
>> CONFIG_FRAME_VECTOR=3Dy
>> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
>> # CONFIG_PERCPU_STATS is not set
>> CONFIG_GUP_BENCHMARK=3Dy
>> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
>> CONFIG_NET=3Dy
>> CONFIG_NET_INGRESS=3Dy
>> CONFIG_SKB_EXTENSIONS=3Dy
>>
>> #
>> # Networking options
>> #
>> CONFIG_PACKET=3Dy
>> CONFIG_PACKET_DIAG=3Dm
>> CONFIG_UNIX=3Dy
>> CONFIG_UNIX_SCM=3Dy
>> # CONFIG_UNIX_DIAG is not set
>> # CONFIG_TLS is not set
>> CONFIG_XFRM=3Dy
>> CONFIG_XFRM_ALGO=3Dy
>> # CONFIG_XFRM_USER is not set
>> # CONFIG_XFRM_INTERFACE is not set
>> # CONFIG_XFRM_SUB_POLICY is not set
>> CONFIG_XFRM_MIGRATE=3Dy
>> # CONFIG_XFRM_STATISTICS is not set
>> CONFIG_NET_KEY=3Dy
>> # CONFIG_NET_KEY_MIGRATE is not set
>> CONFIG_INET=3Dy
>> # CONFIG_IP_MULTICAST is not set
>> # CONFIG_IP_ADVANCED_ROUTER is not set
>> CONFIG_IP_PNP=3Dy
>> CONFIG_IP_PNP_DHCP=3Dy
>> # CONFIG_IP_PNP_BOOTP is not set
>> # CONFIG_IP_PNP_RARP is not set
>> # CONFIG_NET_IPIP is not set
>> # CONFIG_NET_IPGRE_DEMUX is not set
>> CONFIG_NET_IP_TUNNEL=3Dy
>> # CONFIG_SYN_COOKIES is not set
>> # CONFIG_NET_IPVTI is not set
>> # CONFIG_NET_FOU is not set
>> # CONFIG_NET_FOU_IP_TUNNELS is not set
>> # CONFIG_INET_AH is not set
>> # CONFIG_INET_ESP is not set
>> # CONFIG_INET_IPCOMP is not set
>> CONFIG_INET_TUNNEL=3Dy
>> CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
>> CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
>> CONFIG_INET_XFRM_MODE_BEET=3Dy
>> CONFIG_INET_DIAG=3Dy
>> CONFIG_INET_TCP_DIAG=3Dy
>> # CONFIG_INET_UDP_DIAG is not set
>> # CONFIG_INET_RAW_DIAG is not set
>> # CONFIG_INET_DIAG_DESTROY is not set
>> # CONFIG_TCP_CONG_ADVANCED is not set
>> CONFIG_TCP_CONG_CUBIC=3Dy
>> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
>> # CONFIG_TCP_MD5SIG is not set
>> CONFIG_IPV6=3Dy
>> # CONFIG_IPV6_ROUTER_PREF is not set
>> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
>> # CONFIG_INET6_AH is not set
>> # CONFIG_INET6_ESP is not set
>> # CONFIG_INET6_IPCOMP is not set
>> # CONFIG_IPV6_MIP6 is not set
>> # CONFIG_IPV6_ILA is not set
>> CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
>> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
>> CONFIG_INET6_XFRM_MODE_BEET=3Dy
>> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
>> # CONFIG_IPV6_VTI is not set
>> CONFIG_IPV6_SIT=3Dy
>> # CONFIG_IPV6_SIT_6RD is not set
>> CONFIG_IPV6_NDISC_NODETYPE=3Dy
>> # CONFIG_IPV6_TUNNEL is not set
>> # CONFIG_IPV6_MULTIPLE_TABLES is not set
>> # CONFIG_IPV6_MROUTE is not set
>> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
>> # CONFIG_IPV6_SEG6_HMAC is not set
>> CONFIG_NETWORK_SECMARK=3Dy
>> CONFIG_NET_PTP_CLASSIFY=3Dy
>> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
>> CONFIG_NETFILTER=3Dy
>> # CONFIG_NETFILTER_ADVANCED is not set
>>
>> #
>> # Core Netfilter Configuration
>> #
>> CONFIG_NETFILTER_INGRESS=3Dy
>> CONFIG_NETFILTER_NETLINK=3Dm
>> CONFIG_NETFILTER_NETLINK_LOG=3Dm
>> CONFIG_NF_CONNTRACK=3Dm
>> CONFIG_NF_LOG_COMMON=3Dm
>> # CONFIG_NF_LOG_NETDEV is not set
>> CONFIG_NF_CONNTRACK_SECMARK=3Dy
>> CONFIG_NF_CONNTRACK_PROCFS=3Dy
>> # CONFIG_NF_CONNTRACK_LABELS is not set
>> CONFIG_NF_CONNTRACK_FTP=3Dm
>> CONFIG_NF_CONNTRACK_IRC=3Dm
>> # CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
>> CONFIG_NF_CONNTRACK_SIP=3Dm
>> CONFIG_NF_CT_NETLINK=3Dm
>> # CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
>> CONFIG_NF_NAT=3Dm
>> CONFIG_NF_NAT_NEEDED=3Dy
>> CONFIG_NF_NAT_FTP=3Dm
>> CONFIG_NF_NAT_IRC=3Dm
>> CONFIG_NF_NAT_SIP=3Dm
>> CONFIG_NF_NAT_MASQUERADE=3Dy
>> # CONFIG_NF_TABLES is not set
>> CONFIG_NETFILTER_XTABLES=3Dm
>>
>> #
>> # Xtables combined modules
>> #
>> CONFIG_NETFILTER_XT_MARK=3Dm
>>
>> #
>> # Xtables targets
>> #
>> CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
>> CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
>> CONFIG_NETFILTER_XT_NAT=3Dm
>> # CONFIG_NETFILTER_XT_TARGET_NETMAP is not set
>> CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
>> # CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
>> CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
>> CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
>>
>> #
>> # Xtables matches
>> #
>> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
>> CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
>> CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
>> # CONFIG_IP_SET is not set
>> # CONFIG_IP_VS is not set
>>
>> #
>> # IP: Netfilter Configuration
>> #
>> CONFIG_NF_DEFRAG_IPV4=3Dm
>> # CONFIG_NF_SOCKET_IPV4 is not set
>> # CONFIG_NF_TPROXY_IPV4 is not set
>> # CONFIG_NF_DUP_IPV4 is not set
>> CONFIG_NF_LOG_ARP=3Dm
>> CONFIG_NF_LOG_IPV4=3Dm
>> CONFIG_NF_REJECT_IPV4=3Dm
>> CONFIG_IP_NF_IPTABLES=3Dm
>> CONFIG_IP_NF_FILTER=3Dm
>> CONFIG_IP_NF_TARGET_REJECT=3Dm
>> CONFIG_IP_NF_NAT=3Dm
>> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>> CONFIG_IP_NF_MANGLE=3Dm
>> # CONFIG_IP_NF_RAW is not set
>>
>> #
>> # IPv6: Netfilter Configuration
>> #
>> # CONFIG_NF_SOCKET_IPV6 is not set
>> # CONFIG_NF_TPROXY_IPV6 is not set
>> # CONFIG_NF_DUP_IPV6 is not set
>> CONFIG_NF_REJECT_IPV6=3Dm
>> CONFIG_NF_LOG_IPV6=3Dm
>> CONFIG_IP6_NF_IPTABLES=3Dm
>> CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
>> CONFIG_IP6_NF_FILTER=3Dm
>> CONFIG_IP6_NF_TARGET_REJECT=3Dm
>> CONFIG_IP6_NF_MANGLE=3Dm
>> # CONFIG_IP6_NF_RAW is not set
>> CONFIG_NF_DEFRAG_IPV6=3Dm
>> # CONFIG_BRIDGE_NF_EBTABLES is not set
>> # CONFIG_BPFILTER is not set
>> # CONFIG_IP_DCCP is not set
>> # CONFIG_IP_SCTP is not set
>> # CONFIG_RDS is not set
>> # CONFIG_TIPC is not set
>> # CONFIG_ATM is not set
>> # CONFIG_L2TP is not set
>> CONFIG_STP=3Dy
>> CONFIG_BRIDGE=3Dy
>> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
>> CONFIG_HAVE_NET_DSA=3Dy
>> # CONFIG_NET_DSA is not set
>> # CONFIG_VLAN_8021Q is not set
>> CONFIG_DECNET=3Dm
>> CONFIG_DECNET_ROUTER=3Dy
>> CONFIG_LLC=3Dy
>> CONFIG_LLC2=3Dy
>> CONFIG_ATALK=3Dy
>> CONFIG_DEV_APPLETALK=3Dm
>> CONFIG_IPDDP=3Dm
>> # CONFIG_IPDDP_ENCAP is not set
>> CONFIG_X25=3Dy
>> CONFIG_LAPB=3Dy
>> CONFIG_PHONET=3Dm
>> # CONFIG_6LOWPAN is not set
>> # CONFIG_IEEE802154 is not set
>> # CONFIG_NET_SCHED is not set
>> CONFIG_DCB=3Dy
>> CONFIG_DNS_RESOLVER=3Dm
>> # CONFIG_BATMAN_ADV is not set
>> # CONFIG_OPENVSWITCH is not set
>> # CONFIG_VSOCKETS is not set
>> # CONFIG_NETLINK_DIAG is not set
>> # CONFIG_MPLS is not set
>> # CONFIG_NET_NSH is not set
>> CONFIG_HSR=3Dm
>> # CONFIG_NET_SWITCHDEV is not set
>> # CONFIG_NET_L3_MASTER_DEV is not set
>> # CONFIG_NET_NCSI is not set
>> CONFIG_RPS=3Dy
>> CONFIG_RFS_ACCEL=3Dy
>> CONFIG_XPS=3Dy
>> # CONFIG_CGROUP_NET_PRIO is not set
>> # CONFIG_CGROUP_NET_CLASSID is not set
>> CONFIG_NET_RX_BUSY_POLL=3Dy
>> CONFIG_BQL=3Dy
>> # CONFIG_BPF_JIT is not set
>> CONFIG_NET_FLOW_LIMIT=3Dy
>>
>> #
>> # Network testing
>> #
>> # CONFIG_NET_PKTGEN is not set
>> # CONFIG_HAMRADIO is not set
>> # CONFIG_CAN is not set
>> # CONFIG_BT is not set
>> # CONFIG_AF_RXRPC is not set
>> # CONFIG_AF_KCM is not set
>> CONFIG_FIB_RULES=3Dy
>> # CONFIG_WIRELESS is not set
>> CONFIG_WIMAX=3Dy
>> CONFIG_WIMAX_DEBUG_LEVEL=3D8
>> # CONFIG_RFKILL is not set
>> CONFIG_NET_9P=3Dy
>> CONFIG_NET_9P_VIRTIO=3Dy
>> # CONFIG_NET_9P_DEBUG is not set
>> # CONFIG_CAIF is not set
>> # CONFIG_CEPH_LIB is not set
>> CONFIG_NFC=3Dm
>> # CONFIG_NFC_DIGITAL is not set
>> # CONFIG_NFC_NCI is not set
>> # CONFIG_NFC_HCI is not set
>>
>> #
>> # Near Field Communication (NFC) devices
>> #
>> CONFIG_NFC_PN533=3Dm
>> CONFIG_NFC_PN533_I2C=3Dm
>> CONFIG_PSAMPLE=3Dy
>> # CONFIG_NET_IFE is not set
>> CONFIG_LWTUNNEL=3Dy
>> # CONFIG_LWTUNNEL_BPF is not set
>> CONFIG_DST_CACHE=3Dy
>> CONFIG_GRO_CELLS=3Dy
>> CONFIG_NET_DEVLINK=3Dy
>> CONFIG_FAILOVER=3Dy
>> CONFIG_HAVE_EBPF_JIT=3Dy
>>
>> #
>> # Device Drivers
>> #
>> CONFIG_HAVE_EISA=3Dy
>> # CONFIG_EISA is not set
>> CONFIG_HAVE_PCI=3Dy
>> CONFIG_PCI=3Dy
>> CONFIG_PCI_DOMAINS=3Dy
>> # CONFIG_PCIEPORTBUS is not set
>> # CONFIG_PCI_MSI is not set
>> CONFIG_PCI_QUIRKS=3Dy
>> # CONFIG_PCI_DEBUG is not set
>> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
>> CONFIG_PCI_STUB=3Dm
>> CONFIG_PCI_PF_STUB=3Dm
>> CONFIG_PCI_ATS=3Dy
>> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
>> CONFIG_PCI_IOV=3Dy
>> # CONFIG_PCI_PRI is not set
>> # CONFIG_PCI_PASID is not set
>> CONFIG_PCI_LABEL=3Dy
>> CONFIG_HOTPLUG_PCI=3Dy
>> # CONFIG_HOTPLUG_PCI_ACPI is not set
>> # CONFIG_HOTPLUG_PCI_CPCI is not set
>> CONFIG_HOTPLUG_PCI_SHPC=3Dy
>>
>> #
>> # PCI controller drivers
>> #
>>
>> #
>> # Cadence PCIe controllers support
>> #
>>
>> #
>> # DesignWare PCI Core Support
>> #
>>
>> #
>> # PCI Endpoint
>> #
>> CONFIG_PCI_ENDPOINT=3Dy
>> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
>> CONFIG_PCI_EPF_TEST=3Dm
>>
>> #
>> # PCI switch controller drivers
>> #
>> CONFIG_PCI_SW_SWITCHTEC=3Dy
>> # CONFIG_PCCARD is not set
>> CONFIG_RAPIDIO=3Dm
>> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
>> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
>> CONFIG_RAPIDIO_DMA_ENGINE=3Dy
>> # CONFIG_RAPIDIO_DEBUG is not set
>> CONFIG_RAPIDIO_ENUM_BASIC=3Dm
>> CONFIG_RAPIDIO_CHMAN=3Dm
>> # CONFIG_RAPIDIO_MPORT_CDEV is not set
>>
>> #
>> # RapidIO Switch drivers
>> #
>> CONFIG_RAPIDIO_TSI57X=3Dm
>> # CONFIG_RAPIDIO_CPS_XX is not set
>> CONFIG_RAPIDIO_TSI568=3Dm
>> CONFIG_RAPIDIO_CPS_GEN2=3Dm
>> CONFIG_RAPIDIO_RXS_GEN3=3Dm
>>
>> #
>> # Generic Driver Options
>> #
>> CONFIG_UEVENT_HELPER=3Dy
>> CONFIG_UEVENT_HELPER_PATH=3D""
>> CONFIG_DEVTMPFS=3Dy
>> # CONFIG_DEVTMPFS_MOUNT is not set
>> CONFIG_STANDALONE=3Dy
>> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
>>
>> #
>> # Firmware loader
>> #
>> CONFIG_FW_LOADER=3Dy
>> CONFIG_EXTRA_FIRMWARE=3D""
>> CONFIG_FW_LOADER_USER_HELPER=3Dy
>> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
>> CONFIG_WANT_DEV_COREDUMP=3Dy
>> # CONFIG_ALLOW_DEV_COREDUMP is not set
>> # CONFIG_DEBUG_DRIVER is not set
>> # CONFIG_DEBUG_DEVRES is not set
>> CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy
>> CONFIG_TEST_ASYNC_DRIVER_PROBE=3Dm
>> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
>> CONFIG_REGMAP=3Dy
>> CONFIG_REGMAP_I2C=3Dy
>> CONFIG_REGMAP_W1=3Dm
>> CONFIG_REGMAP_MMIO=3Dy
>> CONFIG_REGMAP_IRQ=3Dy
>> CONFIG_DMA_SHARED_BUFFER=3Dy
>> # CONFIG_DMA_FENCE_TRACE is not set
>>
>> #
>> # Bus devices
>> #
>> CONFIG_CONNECTOR=3Dy
>> # CONFIG_PROC_EVENTS is not set
>> # CONFIG_GNSS is not set
>> CONFIG_MTD=3Dm
>> # CONFIG_MTD_TESTS is not set
>> CONFIG_MTD_CMDLINE_PARTS=3Dm
>> CONFIG_MTD_AR7_PARTS=3Dm
>>
>> #
>> # Partition parsers
>> #
>> CONFIG_MTD_REDBOOT_PARTS=3Dm
>> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
>> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
>> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
>>
>> #
>> # User Modules And Translation Layers
>> #
>> CONFIG_MTD_BLKDEVS=3Dm
>> # CONFIG_MTD_BLOCK is not set
>> CONFIG_MTD_BLOCK_RO=3Dm
>> CONFIG_FTL=3Dm
>> CONFIG_NFTL=3Dm
>> CONFIG_NFTL_RW=3Dy
>> # CONFIG_INFTL is not set
>> CONFIG_RFD_FTL=3Dm
>> # CONFIG_SSFDC is not set
>> # CONFIG_SM_FTL is not set
>> CONFIG_MTD_OOPS=3Dm
>> CONFIG_MTD_SWAP=3Dm
>> # CONFIG_MTD_PARTITIONED_MASTER is not set
>>
>> #
>> # RAM/ROM/Flash chip drivers
>> #
>> CONFIG_MTD_CFI=3Dm
>> CONFIG_MTD_JEDECPROBE=3Dm
>> CONFIG_MTD_GEN_PROBE=3Dm
>> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
>> # CONFIG_MTD_CFI_NOSWAP is not set
>> CONFIG_MTD_CFI_BE_BYTE_SWAP=3Dy
>> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
>> # CONFIG_MTD_CFI_GEOMETRY is not set
>> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
>> CONFIG_MTD_CFI_I1=3Dy
>> CONFIG_MTD_CFI_I2=3Dy
>> CONFIG_MTD_OTP=3Dy
>> CONFIG_MTD_CFI_INTELEXT=3Dm
>> CONFIG_MTD_CFI_AMDSTD=3Dm
>> CONFIG_MTD_CFI_STAA=3Dm
>> CONFIG_MTD_CFI_UTIL=3Dm
>> CONFIG_MTD_RAM=3Dm
>> CONFIG_MTD_ROM=3Dm
>> CONFIG_MTD_ABSENT=3Dm
>>
>> #
>> # Mapping drivers for chip access
>> #
>> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
>> CONFIG_MTD_PHYSMAP=3Dm
>> # CONFIG_MTD_PHYSMAP_COMPAT is not set
>> # CONFIG_MTD_AMD76XROM is not set
>> CONFIG_MTD_ICHXROM=3Dm
>> # CONFIG_MTD_ESB2ROM is not set
>> CONFIG_MTD_CK804XROM=3Dm
>> # CONFIG_MTD_SCB2_FLASH is not set
>> CONFIG_MTD_NETtel=3Dm
>> CONFIG_MTD_L440GX=3Dm
>> CONFIG_MTD_INTEL_VR_NOR=3Dm
>> CONFIG_MTD_PLATRAM=3Dm
>>
>> #
>> # Self-contained MTD device drivers
>> #
>> # CONFIG_MTD_PMC551 is not set
>> # CONFIG_MTD_SLRAM is not set
>> # CONFIG_MTD_PHRAM is not set
>> # CONFIG_MTD_MTDRAM is not set
>> CONFIG_MTD_BLOCK2MTD=3Dm
>>
>> #
>> # Disk-On-Chip Device Drivers
>> #
>> # CONFIG_MTD_DOCG3 is not set
>> CONFIG_MTD_ONENAND=3Dm
>> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
>> # CONFIG_MTD_ONENAND_GENERIC is not set
>> CONFIG_MTD_ONENAND_OTP=3Dy
>> CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
>> # CONFIG_MTD_NAND is not set
>>
>> #
>> # LPDDR & LPDDR2 PCM memory drivers
>> #
>> # CONFIG_MTD_LPDDR is not set
>> CONFIG_MTD_SPI_NOR=3Dm
>> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
>> # CONFIG_SPI_MTK_QUADSPI is not set
>> CONFIG_SPI_INTEL_SPI=3Dm
>> CONFIG_SPI_INTEL_SPI_PCI=3Dm
>> # CONFIG_SPI_INTEL_SPI_PLATFORM is not set
>> CONFIG_MTD_UBI=3Dm
>> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
>> CONFIG_MTD_UBI_BEB_LIMIT=3D20
>> # CONFIG_MTD_UBI_FASTMAP is not set
>> CONFIG_MTD_UBI_GLUEBI=3Dm
>> # CONFIG_MTD_UBI_BLOCK is not set
>> # CONFIG_OF is not set
>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>> CONFIG_PARPORT=3Dy
>> CONFIG_PARPORT_PC=3Dy
>> # CONFIG_PARPORT_SERIAL is not set
>> # CONFIG_PARPORT_PC_FIFO is not set
>> # CONFIG_PARPORT_PC_SUPERIO is not set
>> CONFIG_PARPORT_AX88796=3Dy
>> CONFIG_PARPORT_1284=3Dy
>> CONFIG_PARPORT_NOT_PC=3Dy
>> CONFIG_PNP=3Dy
>> CONFIG_PNP_DEBUG_MESSAGES=3Dy
>>
>> #
>> # Protocols
>> #
>> CONFIG_PNPACPI=3Dy
>> CONFIG_BLK_DEV=3Dy
>> # CONFIG_BLK_DEV_NULL_BLK is not set
>> # CONFIG_PARIDE is not set
>> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
>> # CONFIG_BLK_DEV_UMEM is not set
>> # CONFIG_BLK_DEV_LOOP is not set
>> # CONFIG_BLK_DEV_DRBD is not set
>> # CONFIG_BLK_DEV_NBD is not set
>> # CONFIG_BLK_DEV_SKD is not set
>> # CONFIG_BLK_DEV_SX8 is not set
>> # CONFIG_BLK_DEV_RAM is not set
>> # CONFIG_CDROM_PKTCDVD is not set
>> # CONFIG_ATA_OVER_ETH is not set
>> # CONFIG_VIRTIO_BLK is not set
>> # CONFIG_BLK_DEV_RBD is not set
>> # CONFIG_BLK_DEV_RSXX is not set
>>
>> #
>> # NVME Support
>> #
>> CONFIG_NVME_CORE=3Dy
>> CONFIG_BLK_DEV_NVME=3Dy
>> CONFIG_NVME_MULTIPATH=3Dy
>> CONFIG_NVME_FABRICS=3Dy
>> CONFIG_NVME_FC=3Dm
>> # CONFIG_NVME_TCP is not set
>> CONFIG_NVME_TARGET=3Dy
>> CONFIG_NVME_TARGET_LOOP=3Dy
>> CONFIG_NVME_TARGET_FC=3Dy
>> # CONFIG_NVME_TARGET_FCLOOP is not set
>> # CONFIG_NVME_TARGET_TCP is not set
>>
>> #
>> # Misc devices
>> #
>> CONFIG_AD525X_DPOT=3Dy
>> CONFIG_AD525X_DPOT_I2C=3Dy
>> # CONFIG_DUMMY_IRQ is not set
>> CONFIG_IBM_ASM=3Dm
>> CONFIG_PHANTOM=3Dy
>> CONFIG_SGI_IOC4=3Dy
>> CONFIG_TIFM_CORE=3Dy
>> CONFIG_TIFM_7XX1=3Dy
>> CONFIG_ICS932S401=3Dy
>> CONFIG_ENCLOSURE_SERVICES=3Dy
>> # CONFIG_HP_ILO is not set
>> CONFIG_APDS9802ALS=3Dm
>> CONFIG_ISL29003=3Dm
>> CONFIG_ISL29020=3Dm
>> CONFIG_SENSORS_TSL2550=3Dm
>> # CONFIG_SENSORS_BH1770 is not set
>> CONFIG_SENSORS_APDS990X=3Dm
>> # CONFIG_HMC6352 is not set
>> # CONFIG_DS1682 is not set
>> CONFIG_VMWARE_BALLOON=3Dy
>> CONFIG_USB_SWITCH_FSA9480=3Dm
>> CONFIG_SRAM=3Dy
>> # CONFIG_PCI_ENDPOINT_TEST is not set
>> CONFIG_MISC_RTSX=3Dy
>> # CONFIG_PVPANIC is not set
>> # CONFIG_C2PORT is not set
>>
>> #
>> # EEPROM support
>> #
>> # CONFIG_EEPROM_AT24 is not set
>> CONFIG_EEPROM_LEGACY=3Dy
>> CONFIG_EEPROM_MAX6875=3Dy
>> CONFIG_EEPROM_93CX6=3Dm
>> CONFIG_EEPROM_IDT_89HPESX=3Dy
>> # CONFIG_EEPROM_EE1004 is not set
>> CONFIG_CB710_CORE=3Dy
>> # CONFIG_CB710_DEBUG is not set
>> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>>
>> #
>> # Texas Instruments shared transport line discipline
>> #
>> # CONFIG_TI_ST is not set
>> # CONFIG_SENSORS_LIS3_I2C is not set
>> CONFIG_ALTERA_STAPL=3Dm
>> CONFIG_INTEL_MEI=3Dy
>> CONFIG_INTEL_MEI_ME=3Dy
>> CONFIG_INTEL_MEI_TXE=3Dm
>> # CONFIG_INTEL_MEI_HDCP is not set
>> CONFIG_VMWARE_VMCI=3Dy
>>
>> #
>> # Intel MIC & related support
>> #
>>
>> #
>> # Intel MIC Bus Driver
>> #
>> CONFIG_INTEL_MIC_BUS=3Dy
>>
>> #
>> # SCIF Bus Driver
>> #
>> # CONFIG_SCIF_BUS is not set
>>
>> #
>> # VOP Bus Driver
>> #
>> # CONFIG_VOP_BUS is not set
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
>> CONFIG_GENWQE=3Dy
>> CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=3D0
>> CONFIG_ECHO=3Dm
>> # CONFIG_MISC_ALCOR_PCI is not set
>> CONFIG_MISC_RTSX_PCI=3Dy
>> # CONFIG_HABANA_AI is not set
>> CONFIG_HAVE_IDE=3Dy
>> CONFIG_IDE=3Dm
>>
>> #
>> # Please see Documentation/ide/ide.txt for help/info on IDE drives
>> #
>> CONFIG_IDE_XFER_MODE=3Dy
>> CONFIG_IDE_TIMINGS=3Dy
>> CONFIG_IDE_ATAPI=3Dy
>> CONFIG_BLK_DEV_IDE_SATA=3Dy
>> # CONFIG_IDE_GD is not set
>> # CONFIG_BLK_DEV_IDECD is not set
>> CONFIG_BLK_DEV_IDETAPE=3Dm
>> # CONFIG_BLK_DEV_IDEACPI is not set
>> CONFIG_IDE_TASK_IOCTL=3Dy
>> CONFIG_IDE_PROC_FS=3Dy
>>
>> #
>> # IDE chipset support/bugfixes
>> #
>> CONFIG_IDE_GENERIC=3Dm
>> # CONFIG_BLK_DEV_PLATFORM is not set
>> CONFIG_BLK_DEV_CMD640=3Dm
>> # CONFIG_BLK_DEV_CMD640_ENHANCED is not set
>> # CONFIG_BLK_DEV_IDEPNP is not set
>> CONFIG_BLK_DEV_IDEDMA_SFF=3Dy
>>
>> #
>> # PCI IDE chipsets support
>> #
>> CONFIG_BLK_DEV_IDEPCI=3Dy
>> # CONFIG_BLK_DEV_OFFBOARD is not set
>> CONFIG_BLK_DEV_GENERIC=3Dm
>> CONFIG_BLK_DEV_OPTI621=3Dm
>> CONFIG_BLK_DEV_RZ1000=3Dm
>> CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
>> CONFIG_BLK_DEV_AEC62XX=3Dm
>> # CONFIG_BLK_DEV_ALI15X3 is not set
>> CONFIG_BLK_DEV_AMD74XX=3Dm
>> CONFIG_BLK_DEV_ATIIXP=3Dm
>> CONFIG_BLK_DEV_CMD64X=3Dm
>> # CONFIG_BLK_DEV_TRIFLEX is not set
>> # CONFIG_BLK_DEV_HPT366 is not set
>> CONFIG_BLK_DEV_JMICRON=3Dm
>> CONFIG_BLK_DEV_PIIX=3Dm
>> # CONFIG_BLK_DEV_IT8172 is not set
>> CONFIG_BLK_DEV_IT8213=3Dm
>> CONFIG_BLK_DEV_IT821X=3Dm
>> CONFIG_BLK_DEV_NS87415=3Dm
>> # CONFIG_BLK_DEV_PDC202XX_OLD is not set
>> CONFIG_BLK_DEV_PDC202XX_NEW=3Dm
>> # CONFIG_BLK_DEV_SVWKS is not set
>> CONFIG_BLK_DEV_SIIMAGE=3Dm
>> CONFIG_BLK_DEV_SIS5513=3Dm
>> CONFIG_BLK_DEV_SLC90E66=3Dm
>> # CONFIG_BLK_DEV_TRM290 is not set
>> CONFIG_BLK_DEV_VIA82CXXX=3Dm
>> # CONFIG_BLK_DEV_TC86C001 is not set
>> CONFIG_BLK_DEV_IDEDMA=3Dy
>>
>> #
>> # SCSI device support
>> #
>> CONFIG_SCSI_MOD=3Dy
>> CONFIG_RAID_ATTRS=3Dy
>> CONFIG_SCSI=3Dy
>> CONFIG_SCSI_DMA=3Dy
>> CONFIG_SCSI_PROC_FS=3Dy
>>
>> #
>> # SCSI support type (disk, tape, CD-ROM)
>> #
>> # CONFIG_BLK_DEV_SD is not set
>> CONFIG_CHR_DEV_ST=3Dm
>> CONFIG_CHR_DEV_OSST=3Dy
>> # CONFIG_BLK_DEV_SR is not set
>> CONFIG_CHR_DEV_SG=3Dm
>> CONFIG_CHR_DEV_SCH=3Dm
>> # CONFIG_SCSI_ENCLOSURE is not set
>> CONFIG_SCSI_CONSTANTS=3Dy
>> CONFIG_SCSI_LOGGING=3Dy
>> CONFIG_SCSI_SCAN_ASYNC=3Dy
>>
>> #
>> # SCSI Transports
>> #
>> CONFIG_SCSI_SPI_ATTRS=3Dy
>> # CONFIG_SCSI_FC_ATTRS is not set
>> CONFIG_SCSI_ISCSI_ATTRS=3Dy
>> CONFIG_SCSI_SAS_ATTRS=3Dy
>> CONFIG_SCSI_SAS_LIBSAS=3Dy
>> # CONFIG_SCSI_SAS_HOST_SMP is not set
>> # CONFIG_SCSI_SRP_ATTRS is not set
>> CONFIG_SCSI_LOWLEVEL=3Dy
>> # CONFIG_ISCSI_TCP is not set
>> CONFIG_ISCSI_BOOT_SYSFS=3Dy
>> # CONFIG_SCSI_CXGB3_ISCSI is not set
>> # CONFIG_SCSI_CXGB4_ISCSI is not set
>> # CONFIG_SCSI_BNX2_ISCSI is not set
>> CONFIG_BE2ISCSI=3Dy
>> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
>> # CONFIG_SCSI_HPSA is not set
>> CONFIG_SCSI_3W_9XXX=3Dy
>> CONFIG_SCSI_3W_SAS=3Dy
>> CONFIG_SCSI_ACARD=3Dy
>> # CONFIG_SCSI_AACRAID is not set
>> # CONFIG_SCSI_AIC7XXX is not set
>> CONFIG_SCSI_AIC79XX=3Dy
>> CONFIG_AIC79XX_CMDS_PER_DEVICE=3D32
>> CONFIG_AIC79XX_RESET_DELAY_MS=3D5000
>> CONFIG_AIC79XX_DEBUG_ENABLE=3Dy
>> CONFIG_AIC79XX_DEBUG_MASK=3D0
>> CONFIG_AIC79XX_REG_PRETTY_PRINT=3Dy
>> CONFIG_SCSI_AIC94XX=3Dy
>> # CONFIG_AIC94XX_DEBUG is not set
>> CONFIG_SCSI_MVSAS=3Dm
>> CONFIG_SCSI_MVSAS_DEBUG=3Dy
>> CONFIG_SCSI_MVSAS_TASKLET=3Dy
>> CONFIG_SCSI_MVUMI=3Dm
>> CONFIG_SCSI_DPT_I2O=3Dm
>> CONFIG_SCSI_ADVANSYS=3Dy
>> CONFIG_SCSI_ARCMSR=3Dm
>> CONFIG_SCSI_ESAS2R=3Dm
>> # CONFIG_MEGARAID_NEWGEN is not set
>> CONFIG_MEGARAID_LEGACY=3Dy
>> # CONFIG_MEGARAID_SAS is not set
>> CONFIG_SCSI_MPT3SAS=3Dy
>> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
>> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
>> # CONFIG_SCSI_MPT2SAS is not set
>> # CONFIG_SCSI_SMARTPQI is not set
>> CONFIG_SCSI_UFSHCD=3Dy
>> CONFIG_SCSI_UFSHCD_PCI=3Dm
>> CONFIG_SCSI_UFS_DWC_TC_PCI=3Dm
>> CONFIG_SCSI_UFSHCD_PLATFORM=3Dm
>> # CONFIG_SCSI_UFS_CDNS_PLATFORM is not set
>> # CONFIG_SCSI_UFS_DWC_TC_PLATFORM is not set
>> # CONFIG_SCSI_UFS_BSG is not set
>> CONFIG_SCSI_HPTIOP=3Dm
>> # CONFIG_SCSI_MYRB is not set
>> # CONFIG_SCSI_MYRS is not set
>> # CONFIG_VMWARE_PVSCSI is not set
>> CONFIG_SCSI_SNIC=3Dy
>> CONFIG_SCSI_SNIC_DEBUG_FS=3Dy
>> CONFIG_SCSI_DMX3191D=3Dm
>> # CONFIG_SCSI_GDTH is not set
>> CONFIG_SCSI_ISCI=3Dm
>> # CONFIG_SCSI_IPS is not set
>> # CONFIG_SCSI_INITIO is not set
>> CONFIG_SCSI_INIA100=3Dm
>> CONFIG_SCSI_PPA=3Dy
>> CONFIG_SCSI_IMM=3Dm
>> # CONFIG_SCSI_IZIP_EPP16 is not set
>> CONFIG_SCSI_IZIP_SLOW_CTR=3Dy
>> CONFIG_SCSI_STEX=3Dy
>> # CONFIG_SCSI_SYM53C8XX_2 is not set
>> CONFIG_SCSI_QLOGIC_1280=3Dy
>> CONFIG_SCSI_QLA_ISCSI=3Dy
>> # CONFIG_SCSI_DC395x is not set
>> # CONFIG_SCSI_AM53C974 is not set
>> # CONFIG_SCSI_WD719X is not set
>> # CONFIG_SCSI_DEBUG is not set
>> CONFIG_SCSI_PMCRAID=3Dy
>> CONFIG_SCSI_PM8001=3Dm
>> CONFIG_SCSI_VIRTIO=3Dm
>> CONFIG_SCSI_DH=3Dy
>> CONFIG_SCSI_DH_RDAC=3Dy
>> # CONFIG_SCSI_DH_HP_SW is not set
>> CONFIG_SCSI_DH_EMC=3Dm
>> # CONFIG_SCSI_DH_ALUA is not set
>> # CONFIG_ATA is not set
>> CONFIG_MD=3Dy
>> CONFIG_BLK_DEV_MD=3Dy
>> CONFIG_MD_AUTODETECT=3Dy
>> # CONFIG_MD_LINEAR is not set
>> # CONFIG_MD_RAID0 is not set
>> # CONFIG_MD_RAID1 is not set
>> CONFIG_MD_RAID10=3Dy
>> # CONFIG_MD_RAID456 is not set
>> # CONFIG_MD_MULTIPATH is not set
>> # CONFIG_MD_FAULTY is not set
>> # CONFIG_BCACHE is not set
>> # CONFIG_BLK_DEV_DM is not set
>> CONFIG_TARGET_CORE=3Dm
>> CONFIG_TCM_IBLOCK=3Dm
>> CONFIG_TCM_FILEIO=3Dm
>> CONFIG_TCM_PSCSI=3Dm
>> CONFIG_TCM_USER2=3Dm
>> CONFIG_LOOPBACK_TARGET=3Dm
>> CONFIG_ISCSI_TARGET=3Dm
>> CONFIG_SBP_TARGET=3Dm
>> # CONFIG_FUSION is not set
>>
>> #
>> # IEEE 1394 (FireWire) support
>> #
>> CONFIG_FIREWIRE=3Dm
>> # CONFIG_FIREWIRE_OHCI is not set
>> CONFIG_FIREWIRE_SBP2=3Dm
>> # CONFIG_FIREWIRE_NET is not set
>> CONFIG_FIREWIRE_NOSY=3Dm
>> # CONFIG_MACINTOSH_DRIVERS is not set
>> CONFIG_NETDEVICES=3Dy
>> CONFIG_NET_CORE=3Dy
>> # CONFIG_BONDING is not set
>> # CONFIG_DUMMY is not set
>> CONFIG_EQUALIZER=3Dm
>> CONFIG_NET_FC=3Dy
>> CONFIG_NET_TEAM=3Dy
>> CONFIG_NET_TEAM_MODE_BROADCAST=3Dm
>> # CONFIG_NET_TEAM_MODE_ROUNDROBIN is not set
>> # CONFIG_NET_TEAM_MODE_RANDOM is not set
>> # CONFIG_NET_TEAM_MODE_ACTIVEBACKUP is not set
>> CONFIG_NET_TEAM_MODE_LOADBALANCE=3Dm
>> # CONFIG_MACVLAN is not set
>> # CONFIG_IPVLAN is not set
>> # CONFIG_VXLAN is not set
>> # CONFIG_GENEVE is not set
>> # CONFIG_MACSEC is not set
>> CONFIG_NETCONSOLE=3Dm
>> # CONFIG_NETCONSOLE_DYNAMIC is not set
>> CONFIG_NETPOLL=3Dy
>> CONFIG_NET_POLL_CONTROLLER=3Dy
>> # CONFIG_NTB_NETDEV is not set
>> CONFIG_RIONET=3Dm
>> CONFIG_RIONET_TX_SIZE=3D128
>> CONFIG_RIONET_RX_SIZE=3D128
>> # CONFIG_TUN is not set
>> # CONFIG_TUN_VNET_CROSS_LE is not set
>> # CONFIG_VETH is not set
>> CONFIG_VIRTIO_NET=3Dm
>> # CONFIG_NLMON is not set
>> CONFIG_ARCNET=3Dm
>> CONFIG_ARCNET_1201=3Dm
>> CONFIG_ARCNET_1051=3Dm
>> CONFIG_ARCNET_RAW=3Dm
>> CONFIG_ARCNET_CAP=3Dm
>> CONFIG_ARCNET_COM90xx=3Dm
>> CONFIG_ARCNET_COM90xxIO=3Dm
>> CONFIG_ARCNET_RIM_I=3Dm
>> # CONFIG_ARCNET_COM20020 is not set
>>
>> #
>> # CAIF transport drivers
>> #
>>
>> #
>> # Distributed Switch Architecture drivers
>> #
>> CONFIG_ETHERNET=3Dy
>> CONFIG_NET_VENDOR_3COM=3Dy
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
>> # CONFIG_AMD_XGBE is not set
>> CONFIG_NET_VENDOR_AQUANTIA=3Dy
>> # CONFIG_AQTION is not set
>> CONFIG_NET_VENDOR_ARC=3Dy
>> CONFIG_NET_VENDOR_ATHEROS=3Dy
>> # CONFIG_ATL2 is not set
>> # CONFIG_ATL1 is not set
>> # CONFIG_ATL1E is not set
>> # CONFIG_ATL1C is not set
>> # CONFIG_ALX is not set
>> CONFIG_NET_VENDOR_AURORA=3Dy
>> # CONFIG_AURORA_NB8800 is not set
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
>> CONFIG_NET_VENDOR_CADENCE=3Dy
>> # CONFIG_MACB is not set
>> CONFIG_NET_VENDOR_CAVIUM=3Dy
>> # CONFIG_THUNDER_NIC_PF is not set
>> # CONFIG_THUNDER_NIC_VF is not set
>> # CONFIG_THUNDER_NIC_BGX is not set
>> # CONFIG_THUNDER_NIC_RGX is not set
>> CONFIG_CAVIUM_PTP=3Dy
>> # CONFIG_LIQUIDIO is not set
>> CONFIG_NET_VENDOR_CHELSIO=3Dy
>> # CONFIG_CHELSIO_T1 is not set
>> # CONFIG_CHELSIO_T3 is not set
>> # CONFIG_CHELSIO_T4 is not set
>> # CONFIG_CHELSIO_T4VF is not set
>> CONFIG_NET_VENDOR_CISCO=3Dy
>> # CONFIG_ENIC is not set
>> CONFIG_NET_VENDOR_CORTINA=3Dy
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
>> CONFIG_NET_VENDOR_HP=3Dy
>> # CONFIG_HP100 is not set
>> CONFIG_NET_VENDOR_HUAWEI=3Dy
>> CONFIG_NET_VENDOR_I825XX=3Dy
>> CONFIG_NET_VENDOR_INTEL=3Dy
>> # CONFIG_E100 is not set
>> CONFIG_E1000=3Dy
>> # CONFIG_E1000E is not set
>> # CONFIG_IGB is not set
>> # CONFIG_IGBVF is not set
>> # CONFIG_IXGB is not set
>> # CONFIG_IXGBE is not set
>> # CONFIG_I40E is not set
>> # CONFIG_IGC is not set
>> # CONFIG_JME is not set
>> CONFIG_NET_VENDOR_MARVELL=3Dy
>> # CONFIG_MVMDIO is not set
>> # CONFIG_SKGE is not set
>> # CONFIG_SKY2 is not set
>> CONFIG_NET_VENDOR_MELLANOX=3Dy
>> # CONFIG_MLX4_EN is not set
>> # CONFIG_MLX5_CORE is not set
>> # CONFIG_MLXSW_CORE is not set
>> # CONFIG_MLXFW is not set
>> CONFIG_NET_VENDOR_MICREL=3Dy
>> # CONFIG_KS8842 is not set
>> # CONFIG_KS8851_MLL is not set
>> # CONFIG_KSZ884X_PCI is not set
>> CONFIG_NET_VENDOR_MICROCHIP=3Dy
>> # CONFIG_LAN743X is not set
>> CONFIG_NET_VENDOR_MICROSEMI=3Dy
>> CONFIG_NET_VENDOR_MYRI=3Dy
>> # CONFIG_MYRI10GE is not set
>> # CONFIG_FEALNX is not set
>> CONFIG_NET_VENDOR_NATSEMI=3Dy
>> # CONFIG_NATSEMI is not set
>> # CONFIG_NS83820 is not set
>> CONFIG_NET_VENDOR_NETERION=3Dy
>> # CONFIG_S2IO is not set
>> # CONFIG_VXGE is not set
>> CONFIG_NET_VENDOR_NETRONOME=3Dy
>> CONFIG_NET_VENDOR_NI=3Dy
>> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
>> CONFIG_NET_VENDOR_8390=3Dy
>> # CONFIG_NE2K_PCI is not set
>> CONFIG_NET_VENDOR_NVIDIA=3Dy
>> # CONFIG_FORCEDETH is not set
>> CONFIG_NET_VENDOR_OKI=3Dy
>> # CONFIG_ETHOC is not set
>> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
>> # CONFIG_HAMACHI is not set
>> # CONFIG_YELLOWFIN is not set
>> CONFIG_NET_VENDOR_QLOGIC=3Dy
>> # CONFIG_QLA3XXX is not set
>> # CONFIG_QLCNIC is not set
>> # CONFIG_QLGE is not set
>> # CONFIG_NETXEN_NIC is not set
>> # CONFIG_QED is not set
>> CONFIG_NET_VENDOR_QUALCOMM=3Dy
>> # CONFIG_QCOM_EMAC is not set
>> # CONFIG_RMNET is not set
>> CONFIG_NET_VENDOR_RDC=3Dy
>> # CONFIG_R6040 is not set
>> CONFIG_NET_VENDOR_REALTEK=3Dy
>> # CONFIG_ATP is not set
>> # CONFIG_8139CP is not set
>> # CONFIG_8139TOO is not set
>> # CONFIG_R8169 is not set
>> CONFIG_NET_VENDOR_RENESAS=3Dy
>> CONFIG_NET_VENDOR_ROCKER=3Dy
>> CONFIG_NET_VENDOR_SAMSUNG=3Dy
>> # CONFIG_SXGBE_ETH is not set
>> CONFIG_NET_VENDOR_SEEQ=3Dy
>> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
>> # CONFIG_SFC is not set
>> # CONFIG_SFC_FALCON is not set
>> CONFIG_NET_VENDOR_SILAN=3Dy
>> # CONFIG_SC92031 is not set
>> CONFIG_NET_VENDOR_SIS=3Dy
>> # CONFIG_SIS900 is not set
>> # CONFIG_SIS190 is not set
>> CONFIG_NET_VENDOR_SMSC=3Dy
>> # CONFIG_EPIC100 is not set
>> # CONFIG_SMSC911X is not set
>> # CONFIG_SMSC9420 is not set
>> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
>> CONFIG_NET_VENDOR_STMICRO=3Dy
>> # CONFIG_STMMAC_ETH is not set
>> CONFIG_NET_VENDOR_SUN=3Dy
>> # CONFIG_HAPPYMEAL is not set
>> # CONFIG_SUNGEM is not set
>> # CONFIG_CASSINI is not set
>> # CONFIG_NIU is not set
>> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
>> # CONFIG_DWC_XLGMAC is not set
>> CONFIG_NET_VENDOR_TEHUTI=3Dy
>> # CONFIG_TEHUTI is not set
>> CONFIG_NET_VENDOR_TI=3Dy
>> # CONFIG_TI_CPSW_PHY_SEL is not set
>> # CONFIG_TI_CPSW_ALE is not set
>> # CONFIG_TLAN is not set
>> CONFIG_NET_VENDOR_VIA=3Dy
>> # CONFIG_VIA_RHINE is not set
>> # CONFIG_VIA_VELOCITY is not set
>> CONFIG_NET_VENDOR_WIZNET=3Dy
>> # CONFIG_WIZNET_W5100 is not set
>> # CONFIG_WIZNET_W5300 is not set
>> CONFIG_FDDI=3Dm
>> CONFIG_DEFXX=3Dm
>> CONFIG_DEFXX_MMIO=3Dy
>> CONFIG_SKFP=3Dm
>> # CONFIG_HIPPI is not set
>> # CONFIG_NET_SB1000 is not set
>> CONFIG_MDIO_DEVICE=3Dy
>> CONFIG_MDIO_BUS=3Dy
>> # CONFIG_MDIO_BCM_UNIMAC is not set
>> # CONFIG_MDIO_BITBANG is not set
>> CONFIG_MDIO_CAVIUM=3Dm
>> CONFIG_MDIO_MSCC_MIIM=3Dm
>> CONFIG_MDIO_THUNDER=3Dm
>> CONFIG_PHYLIB=3Dy
>> CONFIG_SWPHY=3Dy
>> # CONFIG_LED_TRIGGER_PHY is not set
>>
>> #
>> # MII PHY device drivers
>> #
>> CONFIG_AMD_PHY=3Dm
>> # CONFIG_AQUANTIA_PHY is not set
>> CONFIG_ASIX_PHY=3Dm
>> CONFIG_AT803X_PHY=3Dy
>> CONFIG_BCM7XXX_PHY=3Dm
>> # CONFIG_BCM87XX_PHY is not set
>> CONFIG_BCM_NET_PHYLIB=3Dm
>> CONFIG_BROADCOM_PHY=3Dm
>> CONFIG_CICADA_PHY=3Dy
>> CONFIG_CORTINA_PHY=3Dm
>> CONFIG_DAVICOM_PHY=3Dm
>> # CONFIG_DP83822_PHY is not set
>> CONFIG_DP83TC811_PHY=3Dy
>> # CONFIG_DP83848_PHY is not set
>> # CONFIG_DP83867_PHY is not set
>> CONFIG_FIXED_PHY=3Dm
>> # CONFIG_ICPLUS_PHY is not set
>> CONFIG_INTEL_XWAY_PHY=3Dm
>> CONFIG_LSI_ET1011C_PHY=3Dm
>> CONFIG_LXT_PHY=3Dm
>> CONFIG_MARVELL_PHY=3Dy
>> CONFIG_MARVELL_10G_PHY=3Dy
>> # CONFIG_MICREL_PHY is not set
>> CONFIG_MICROCHIP_PHY=3Dm
>> # CONFIG_MICROCHIP_T1_PHY is not set
>> # CONFIG_MICROSEMI_PHY is not set
>> CONFIG_NATIONAL_PHY=3Dm
>> CONFIG_QSEMI_PHY=3Dy
>> CONFIG_REALTEK_PHY=3Dy
>> CONFIG_RENESAS_PHY=3Dm
>> CONFIG_ROCKCHIP_PHY=3Dy
>> # CONFIG_SMSC_PHY is not set
>> # CONFIG_STE10XP is not set
>> CONFIG_TERANETICS_PHY=3Dm
>> CONFIG_VITESSE_PHY=3Dm
>> CONFIG_XILINX_GMII2RGMII=3Dm
>> CONFIG_PLIP=3Dm
>> CONFIG_PPP=3Dm
>> CONFIG_PPP_BSDCOMP=3Dm
>> CONFIG_PPP_DEFLATE=3Dm
>> CONFIG_PPP_FILTER=3Dy
>> CONFIG_PPP_MPPE=3Dm
>> CONFIG_PPP_MULTILINK=3Dy
>> # CONFIG_PPPOE is not set
>> # CONFIG_PPP_ASYNC is not set
>> # CONFIG_PPP_SYNC_TTY is not set
>> # CONFIG_SLIP is not set
>> CONFIG_SLHC=3Dm
>>
>> #
>> # Host-side USB support is needed for USB Network Adapter support
>> #
>> # CONFIG_WLAN is not set
>>
>> #
>> # WiMAX Wireless Broadband devices
>> #
>>
>> #
>> # Enable USB support to see WiMAX USB drivers
>> #
>> # CONFIG_WAN is not set
>> # CONFIG_VMXNET3 is not set
>> # CONFIG_FUJITSU_ES is not set
>> # CONFIG_THUNDERBOLT_NET is not set
>> # CONFIG_NETDEVSIM is not set
>> CONFIG_NET_FAILOVER=3Dy
>> # CONFIG_ISDN is not set
>> CONFIG_NVM=3Dy
>> # CONFIG_NVM_PBLK is not set
>>
>> #
>> # Input device support
>> #
>> CONFIG_INPUT=3Dy
>> CONFIG_INPUT_LEDS=3Dm
>> CONFIG_INPUT_FF_MEMLESS=3Dm
>> CONFIG_INPUT_POLLDEV=3Dy
>> # CONFIG_INPUT_SPARSEKMAP is not set
>> CONFIG_INPUT_MATRIXKMAP=3Dy
>>
>> #
>> # Userland interfaces
>> #
>> CONFIG_INPUT_MOUSEDEV=3Dm
>> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
>> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
>> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
>> CONFIG_INPUT_JOYDEV=3Dm
>> # CONFIG_INPUT_EVDEV is not set
>> CONFIG_INPUT_EVBUG=3Dy
>>
>> #
>> # Input Device Drivers
>> #
>> CONFIG_INPUT_KEYBOARD=3Dy
>> # CONFIG_KEYBOARD_ADC is not set
>> # CONFIG_KEYBOARD_ADP5588 is not set
>> # CONFIG_KEYBOARD_ADP5589 is not set
>> CONFIG_KEYBOARD_ATKBD=3Dy
>> # CONFIG_KEYBOARD_QT1070 is not set
>> # CONFIG_KEYBOARD_QT2160 is not set
>> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
>> # CONFIG_KEYBOARD_LKKBD is not set
>> # CONFIG_KEYBOARD_GPIO is not set
>> # CONFIG_KEYBOARD_GPIO_POLLED is not set
>> # CONFIG_KEYBOARD_TCA6416 is not set
>> # CONFIG_KEYBOARD_TCA8418 is not set
>> # CONFIG_KEYBOARD_MATRIX is not set
>> # CONFIG_KEYBOARD_LM8323 is not set
>> # CONFIG_KEYBOARD_LM8333 is not set
>> # CONFIG_KEYBOARD_MAX7359 is not set
>> # CONFIG_KEYBOARD_MCS is not set
>> # CONFIG_KEYBOARD_MPR121 is not set
>> # CONFIG_KEYBOARD_NEWTON is not set
>> # CONFIG_KEYBOARD_OPENCORES is not set
>> # CONFIG_KEYBOARD_SAMSUNG is not set
>> # CONFIG_KEYBOARD_STOWAWAY is not set
>> # CONFIG_KEYBOARD_SUNKBD is not set
>> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
>> # CONFIG_KEYBOARD_XTKBD is not set
>> # CONFIG_KEYBOARD_MTK_PMIC is not set
>> CONFIG_INPUT_MOUSE=3Dy
>> CONFIG_MOUSE_PS2=3Dm
>> CONFIG_MOUSE_PS2_ALPS=3Dy
>> CONFIG_MOUSE_PS2_BYD=3Dy
>> # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
>> # CONFIG_MOUSE_PS2_SYNAPTICS is not set
>> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
>> # CONFIG_MOUSE_PS2_CYPRESS is not set
>> # CONFIG_MOUSE_PS2_TRACKPOINT is not set
>> # CONFIG_MOUSE_PS2_ELANTECH is not set
>> CONFIG_MOUSE_PS2_SENTELIC=3Dy
>> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
>> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
>> # CONFIG_MOUSE_PS2_VMMOUSE is not set
>> CONFIG_MOUSE_PS2_SMBUS=3Dy
>> # CONFIG_MOUSE_SERIAL is not set
>> # CONFIG_MOUSE_APPLETOUCH is not set
>> # CONFIG_MOUSE_BCM5974 is not set
>> CONFIG_MOUSE_CYAPA=3Dy
>> CONFIG_MOUSE_ELAN_I2C=3Dy
>> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
>> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
>> CONFIG_MOUSE_VSXXXAA=3Dm
>> CONFIG_MOUSE_GPIO=3Dy
>> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
>> # CONFIG_MOUSE_SYNAPTICS_USB is not set
>> CONFIG_INPUT_JOYSTICK=3Dy
>> # CONFIG_JOYSTICK_ANALOG is not set
>> # CONFIG_JOYSTICK_A3D is not set
>> # CONFIG_JOYSTICK_ADI is not set
>> CONFIG_JOYSTICK_COBRA=3Dm
>> CONFIG_JOYSTICK_GF2K=3Dm
>> # CONFIG_JOYSTICK_GRIP is not set
>> CONFIG_JOYSTICK_GRIP_MP=3Dm
>> CONFIG_JOYSTICK_GUILLEMOT=3Dm
>> # CONFIG_JOYSTICK_INTERACT is not set
>> CONFIG_JOYSTICK_SIDEWINDER=3Dy
>> CONFIG_JOYSTICK_TMDC=3Dm
>> CONFIG_JOYSTICK_IFORCE=3Dm
>> # CONFIG_JOYSTICK_IFORCE_232 is not set
>> CONFIG_JOYSTICK_WARRIOR=3Dy
>> # CONFIG_JOYSTICK_MAGELLAN is not set
>> # CONFIG_JOYSTICK_SPACEORB is not set
>> CONFIG_JOYSTICK_SPACEBALL=3Dy
>> CONFIG_JOYSTICK_STINGER=3Dm
>> CONFIG_JOYSTICK_TWIDJOY=3Dm
>> # CONFIG_JOYSTICK_ZHENHUA is not set
>> # CONFIG_JOYSTICK_DB9 is not set
>> # CONFIG_JOYSTICK_GAMECON is not set
>> CONFIG_JOYSTICK_TURBOGRAFX=3Dm
>> CONFIG_JOYSTICK_AS5011=3Dy
>> CONFIG_JOYSTICK_JOYDUMP=3Dm
>> # CONFIG_JOYSTICK_XPAD is not set
>> # CONFIG_JOYSTICK_PXRC is not set
>> CONFIG_INPUT_TABLET=3Dy
>> # CONFIG_TABLET_USB_ACECAD is not set
>> # CONFIG_TABLET_USB_AIPTEK is not set
>> # CONFIG_TABLET_USB_HANWANG is not set
>> # CONFIG_TABLET_USB_KBTAB is not set
>> # CONFIG_TABLET_USB_PEGASUS is not set
>> CONFIG_TABLET_SERIAL_WACOM4=3Dy
>> CONFIG_INPUT_TOUCHSCREEN=3Dy
>> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
>> CONFIG_TOUCHSCREEN_88PM860X=3Dm
>> CONFIG_TOUCHSCREEN_AD7879=3Dm
>> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dm
>> CONFIG_TOUCHSCREEN_ADC=3Dm
>> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
>> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dm
>> CONFIG_TOUCHSCREEN_BU21013=3Dy
>> # CONFIG_TOUCHSCREEN_BU21029 is not set
>> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
>> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dm
>> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dm
>> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dm
>> # CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
>> CONFIG_TOUCHSCREEN_DA9034=3Dm
>> CONFIG_TOUCHSCREEN_DYNAPRO=3Dm
>> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
>> CONFIG_TOUCHSCREEN_EETI=3Dm
>> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dm
>> CONFIG_TOUCHSCREEN_EXC3000=3Dm
>> CONFIG_TOUCHSCREEN_FUJITSU=3Dm
>> # CONFIG_TOUCHSCREEN_GOODIX is not set
>> CONFIG_TOUCHSCREEN_HIDEEP=3Dm
>> CONFIG_TOUCHSCREEN_ILI210X=3Dy
>> CONFIG_TOUCHSCREEN_S6SY761=3Dy
>> CONFIG_TOUCHSCREEN_GUNZE=3Dy
>> # CONFIG_TOUCHSCREEN_EKTF2127 is not set
>> CONFIG_TOUCHSCREEN_ELAN=3Dm
>> CONFIG_TOUCHSCREEN_ELO=3Dm
>> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
>> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
>> CONFIG_TOUCHSCREEN_MAX11801=3Dy
>> # CONFIG_TOUCHSCREEN_MCS5000 is not set
>> CONFIG_TOUCHSCREEN_MMS114=3Dm
>> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dm
>> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
>> CONFIG_TOUCHSCREEN_INEXIO=3Dy
>> CONFIG_TOUCHSCREEN_MK712=3Dm
>> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
>> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dm
>> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
>> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dm
>> CONFIG_TOUCHSCREEN_PIXCIR=3Dm
>> # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
>> CONFIG_TOUCHSCREEN_WM831X=3Dy
>> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
>> CONFIG_TOUCHSCREEN_MC13783=3Dy
>> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
>> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dm
>> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dm
>> CONFIG_TOUCHSCREEN_TSC2004=3Dm
>> CONFIG_TOUCHSCREEN_TSC2007=3Dm
>> CONFIG_TOUCHSCREEN_TSC2007_IIO=3Dy
>> # CONFIG_TOUCHSCREEN_RM_TS is not set
>> CONFIG_TOUCHSCREEN_SILEAD=3Dm
>> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
>> CONFIG_TOUCHSCREEN_ST1232=3Dm
>> CONFIG_TOUCHSCREEN_STMFTS=3Dm
>> # CONFIG_TOUCHSCREEN_SX8654 is not set
>> # CONFIG_TOUCHSCREEN_TPS6507X is not set
>> CONFIG_TOUCHSCREEN_ZET6223=3Dy
>> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
>> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dm
>> CONFIG_INPUT_MISC=3Dy
>> # CONFIG_INPUT_88PM860X_ONKEY is not set
>> CONFIG_INPUT_AD714X=3Dm
>> # CONFIG_INPUT_AD714X_I2C is not set
>> # CONFIG_INPUT_BMA150 is not set
>> # CONFIG_INPUT_E3X0_BUTTON is not set
>> # CONFIG_INPUT_MSM_VIBRATOR is not set
>> CONFIG_INPUT_MC13783_PWRBUTTON=3Dy
>> CONFIG_INPUT_MMA8450=3Dm
>> CONFIG_INPUT_APANEL=3Dm
>> CONFIG_INPUT_GP2A=3Dy
>> CONFIG_INPUT_GPIO_BEEPER=3Dm
>> # CONFIG_INPUT_GPIO_DECODER is not set
>> # CONFIG_INPUT_ATLAS_BTNS is not set
>> # CONFIG_INPUT_ATI_REMOTE2 is not set
>> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
>> CONFIG_INPUT_KXTJ9=3Dm
>> # CONFIG_INPUT_KXTJ9_POLLED_MODE is not set
>> # CONFIG_INPUT_POWERMATE is not set
>> # CONFIG_INPUT_YEALINK is not set
>> # CONFIG_INPUT_CM109 is not set
>> CONFIG_INPUT_UINPUT=3Dy
>> CONFIG_INPUT_PALMAS_PWRBUTTON=3Dy
>> CONFIG_INPUT_PCF50633_PMU=3Dm
>> CONFIG_INPUT_PCF8574=3Dm
>> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
>> # CONFIG_INPUT_DA9055_ONKEY is not set
>> CONFIG_INPUT_DA9063_ONKEY=3Dm
>> CONFIG_INPUT_WM831X_ON=3Dy
>> CONFIG_INPUT_ADXL34X=3Dm
>> CONFIG_INPUT_ADXL34X_I2C=3Dm
>> CONFIG_INPUT_CMA3000=3Dy
>> CONFIG_INPUT_CMA3000_I2C=3Dy
>> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
>> CONFIG_INPUT_DRV260X_HAPTICS=3Dm
>> # CONFIG_INPUT_DRV2665_HAPTICS is not set
>> CONFIG_INPUT_DRV2667_HAPTICS=3Dm
>> CONFIG_INPUT_RAVE_SP_PWRBUTTON=3Dm
>> # CONFIG_RMI4_CORE is not set
>>
>> #
>> # Hardware I/O ports
>> #
>> CONFIG_SERIO=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>> CONFIG_SERIO_I8042=3Dy
>> CONFIG_SERIO_SERPORT=3Dy
>> # CONFIG_SERIO_CT82C710 is not set
>> # CONFIG_SERIO_PARKBD is not set
>> CONFIG_SERIO_PCIPS2=3Dm
>> CONFIG_SERIO_LIBPS2=3Dy
>> CONFIG_SERIO_RAW=3Dm
>> CONFIG_SERIO_ALTERA_PS2=3Dm
>> CONFIG_SERIO_PS2MULT=3Dy
>> # CONFIG_SERIO_ARC_PS2 is not set
>> # CONFIG_SERIO_OLPC_APSP is not set
>> # CONFIG_SERIO_GPIO_PS2 is not set
>> CONFIG_USERIO=3Dm
>> CONFIG_GAMEPORT=3Dy
>> CONFIG_GAMEPORT_NS558=3Dm
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
>> CONFIG_LEGACY_PTYS=3Dy
>> CONFIG_LEGACY_PTY_COUNT=3D256
>> # CONFIG_SERIAL_NONSTANDARD is not set
>> # CONFIG_NOZOMI is not set
>> # CONFIG_N_GSM is not set
>> # CONFIG_TRACE_SINK is not set
>> CONFIG_LDISC_AUTOLOAD=3Dy
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
>> # CONFIG_SERIAL_8250_FINTEK is not set
>> CONFIG_SERIAL_8250_CONSOLE=3Dy
>> CONFIG_SERIAL_8250_DMA=3Dy
>> CONFIG_SERIAL_8250_PCI=3Dy
>> CONFIG_SERIAL_8250_EXAR=3Dy
>> # CONFIG_SERIAL_8250_MEN_MCB is not set
>> CONFIG_SERIAL_8250_NR_UARTS=3D4
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>> # CONFIG_SERIAL_8250_EXTENDED is not set
>> # CONFIG_SERIAL_8250_DW is not set
>> # CONFIG_SERIAL_8250_RT288X is not set
>> CONFIG_SERIAL_8250_LPSS=3Dy
>> CONFIG_SERIAL_8250_MID=3Dy
>> # CONFIG_SERIAL_8250_MOXA is not set
>>
>> #
>> # Non-8250 serial port support
>> #
>> # CONFIG_SERIAL_UARTLITE is not set
>> CONFIG_SERIAL_CORE=3Dy
>> CONFIG_SERIAL_CORE_CONSOLE=3Dy
>> # CONFIG_SERIAL_JSM is not set
>> # CONFIG_SERIAL_SCCNXP is not set
>> # CONFIG_SERIAL_SC16IS7XX is not set
>> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
>> # CONFIG_SERIAL_ALTERA_UART is not set
>> # CONFIG_SERIAL_ARC is not set
>> # CONFIG_SERIAL_RP2 is not set
>> # CONFIG_SERIAL_FSL_LPUART is not set
>> # CONFIG_SERIAL_MEN_Z135 is not set
>> CONFIG_SERIAL_DEV_BUS=3Dy
>> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
>> # CONFIG_TTY_PRINTK is not set
>> CONFIG_PRINTER=3Dm
>> CONFIG_LP_CONSOLE=3Dy
>> # CONFIG_PPDEV is not set
>> # CONFIG_VIRTIO_CONSOLE is not set
>> CONFIG_IPMI_HANDLER=3Dm
>> CONFIG_IPMI_PLAT_DATA=3Dy
>> # CONFIG_IPMI_PANIC_EVENT is not set
>> # CONFIG_IPMI_DEVICE_INTERFACE is not set
>> CONFIG_IPMI_SI=3Dm
>> # CONFIG_IPMI_SSIF is not set
>> # CONFIG_IPMI_WATCHDOG is not set
>> # CONFIG_IPMI_POWEROFF is not set
>> CONFIG_HW_RANDOM=3Dm
>> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
>> # CONFIG_HW_RANDOM_INTEL is not set
>> # CONFIG_HW_RANDOM_AMD is not set
>> CONFIG_HW_RANDOM_VIA=3Dm
>> # CONFIG_HW_RANDOM_VIRTIO is not set
>> CONFIG_NVRAM=3Dm
>> # CONFIG_R3964 is not set
>> CONFIG_APPLICOM=3Dm
>> # CONFIG_MWAVE is not set
>> CONFIG_RAW_DRIVER=3Dy
>> CONFIG_MAX_RAW_DEVS=3D256
>> # CONFIG_HPET is not set
>> CONFIG_HANGCHECK_TIMER=3Dm
>> CONFIG_TCG_TPM=3Dm
>> # CONFIG_HW_RANDOM_TPM is not set
>> CONFIG_TCG_TIS_CORE=3Dm
>> CONFIG_TCG_TIS=3Dm
>> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
>> # CONFIG_TCG_TIS_I2C_INFINEON is not set
>> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
>> CONFIG_TCG_NSC=3Dm
>> # CONFIG_TCG_ATMEL is not set
>> # CONFIG_TCG_INFINEON is not set
>> # CONFIG_TCG_CRB is not set
>> # CONFIG_TCG_VTPM_PROXY is not set
>> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
>> # CONFIG_TELCLOCK is not set
>> # CONFIG_DEVPORT is not set
>> CONFIG_XILLYBUS=3Dm
>> # CONFIG_RANDOM_TRUST_CPU is not set
>>
>> #
>> # I2C support
>> #
>> CONFIG_I2C=3Dy
>> CONFIG_ACPI_I2C_OPREGION=3Dy
>> CONFIG_I2C_BOARDINFO=3Dy
>> # CONFIG_I2C_COMPAT is not set
>> # CONFIG_I2C_CHARDEV is not set
>> CONFIG_I2C_MUX=3Dm
>>
>> #
>> # Multiplexer I2C Chip support
>> #
>> CONFIG_I2C_MUX_GPIO=3Dm
>> # CONFIG_I2C_MUX_LTC4306 is not set
>> CONFIG_I2C_MUX_PCA9541=3Dm
>> # CONFIG_I2C_MUX_PCA954x is not set
>> # CONFIG_I2C_MUX_REG is not set
>> CONFIG_I2C_MUX_MLXCPLD=3Dm
>> # CONFIG_I2C_HELPER_AUTO is not set
>> CONFIG_I2C_SMBUS=3Dy
>>
>> #
>> # I2C Algorithms
>> #
>> CONFIG_I2C_ALGOBIT=3Dy
>> CONFIG_I2C_ALGOPCF=3Dy
>> CONFIG_I2C_ALGOPCA=3Dy
>>
>> #
>> # I2C Hardware Bus support
>> #
>>
>> #
>> # PC SMBus host controller drivers
>> #
>> # CONFIG_I2C_ALI1535 is not set
>> CONFIG_I2C_ALI1563=3Dy
>> CONFIG_I2C_ALI15X3=3Dy
>> CONFIG_I2C_AMD756=3Dy
>> CONFIG_I2C_AMD756_S4882=3Dy
>> CONFIG_I2C_AMD8111=3Dm
>> CONFIG_I2C_I801=3Dy
>> # CONFIG_I2C_ISCH is not set
>> CONFIG_I2C_ISMT=3Dm
>> CONFIG_I2C_PIIX4=3Dm
>> # CONFIG_I2C_NFORCE2 is not set
>> # CONFIG_I2C_NVIDIA_GPU is not set
>> # CONFIG_I2C_SIS5595 is not set
>> # CONFIG_I2C_SIS630 is not set
>> # CONFIG_I2C_SIS96X is not set
>> CONFIG_I2C_VIA=3Dm
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
>> CONFIG_I2C_CBUS_GPIO=3Dy
>> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
>> # CONFIG_I2C_DESIGNWARE_PCI is not set
>> CONFIG_I2C_EMEV2=3Dm
>> CONFIG_I2C_GPIO=3Dy
>> CONFIG_I2C_GPIO_FAULT_INJECTOR=3Dy
>> # CONFIG_I2C_KEMPLD is not set
>> CONFIG_I2C_OCORES=3Dm
>> CONFIG_I2C_PCA_PLATFORM=3Dm
>> # CONFIG_I2C_SIMTEC is not set
>> CONFIG_I2C_XILINX=3Dm
>>
>> #
>> # External I2C/SMBus adapter drivers
>> #
>> CONFIG_I2C_PARPORT=3Dy
>> CONFIG_I2C_PARPORT_LIGHT=3Dm
>> # CONFIG_I2C_TAOS_EVM is not set
>>
>> #
>> # Other I2C/SMBus bus drivers
>> #
>> CONFIG_I2C_MLXCPLD=3Dm
>> CONFIG_I2C_STUB=3Dm
>> CONFIG_I2C_SLAVE=3Dy
>> CONFIG_I2C_SLAVE_EEPROM=3Dm
>> # CONFIG_I2C_DEBUG_CORE is not set
>> # CONFIG_I2C_DEBUG_ALGO is not set
>> # CONFIG_I2C_DEBUG_BUS is not set
>> # CONFIG_I3C is not set
>> # CONFIG_SPI is not set
>> CONFIG_SPMI=3Dm
>> CONFIG_HSI=3Dm
>> CONFIG_HSI_BOARDINFO=3Dy
>>
>> #
>> # HSI controllers
>> #
>>
>> #
>> # HSI clients
>> #
>> CONFIG_HSI_CHAR=3Dm
>> CONFIG_PPS=3Dy
>> # CONFIG_PPS_DEBUG is not set
>>
>> #
>> # PPS clients support
>> #
>> # CONFIG_PPS_CLIENT_KTIMER is not set
>> # CONFIG_PPS_CLIENT_LDISC is not set
>> # CONFIG_PPS_CLIENT_PARPORT is not set
>> # CONFIG_PPS_CLIENT_GPIO is not set
>>
>> #
>> # PPS generators support
>> #
>>
>> #
>> # PTP clock support
>> #
>> CONFIG_PTP_1588_CLOCK=3Dy
>> CONFIG_DP83640_PHY=3Dm
>> CONFIG_PTP_1588_CLOCK_KVM=3Dm
>> CONFIG_PINCTRL=3Dy
>> CONFIG_PINMUX=3Dy
>> CONFIG_PINCONF=3Dy
>> CONFIG_GENERIC_PINCONF=3Dy
>> # CONFIG_DEBUG_PINCTRL is not set
>> CONFIG_PINCTRL_AMD=3Dy
>> CONFIG_PINCTRL_MCP23S08=3Dy
>> CONFIG_PINCTRL_SX150X=3Dy
>> # CONFIG_PINCTRL_BAYTRAIL is not set
>> # CONFIG_PINCTRL_CHERRYVIEW is not set
>> # CONFIG_PINCTRL_BROXTON is not set
>> # CONFIG_PINCTRL_CANNONLAKE is not set
>> # CONFIG_PINCTRL_CEDARFORK is not set
>> # CONFIG_PINCTRL_DENVERTON is not set
>> # CONFIG_PINCTRL_GEMINILAKE is not set
>> # CONFIG_PINCTRL_ICELAKE is not set
>> # CONFIG_PINCTRL_LEWISBURG is not set
>> # CONFIG_PINCTRL_SUNRISEPOINT is not set
>> CONFIG_PINCTRL_MADERA=3Dm
>> CONFIG_PINCTRL_CS47L35=3Dy
>> CONFIG_PINCTRL_CS47L90=3Dy
>> CONFIG_GPIOLIB=3Dy
>> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
>> CONFIG_GPIO_ACPI=3Dy
>> CONFIG_GPIOLIB_IRQCHIP=3Dy
>> CONFIG_DEBUG_GPIO=3Dy
>> CONFIG_GPIO_SYSFS=3Dy
>> CONFIG_GPIO_GENERIC=3Dy
>>
>> #
>> # Memory mapped GPIO drivers
>> #
>> # CONFIG_GPIO_AMDPT is not set
>> # CONFIG_GPIO_DWAPB is not set
>> # CONFIG_GPIO_EXAR is not set
>> # CONFIG_GPIO_GENERIC_PLATFORM is not set
>> # CONFIG_GPIO_ICH is not set
>> # CONFIG_GPIO_LYNXPOINT is not set
>> # CONFIG_GPIO_MB86S7X is not set
>> CONFIG_GPIO_MENZ127=3Dy
>> # CONFIG_GPIO_MOCKUP is not set
>> # CONFIG_GPIO_SIOX is not set
>> # CONFIG_GPIO_VX855 is not set
>> # CONFIG_GPIO_AMD_FCH is not set
>>
>> #
>> # Port-mapped I/O GPIO drivers
>> #
>> CONFIG_GPIO_F7188X=3Dy
>> # CONFIG_GPIO_IT87 is not set
>> CONFIG_GPIO_SCH=3Dy
>> CONFIG_GPIO_SCH311X=3Dm
>> CONFIG_GPIO_WINBOND=3Dm
>> # CONFIG_GPIO_WS16C48 is not set
>>
>> #
>> # I2C GPIO expanders
>> #
>> # CONFIG_GPIO_ADP5588 is not set
>> # CONFIG_GPIO_MAX7300 is not set
>> CONFIG_GPIO_MAX732X=3Dm
>> CONFIG_GPIO_PCA953X=3Dm
>> CONFIG_GPIO_PCF857X=3Dy
>> # CONFIG_GPIO_TPIC2810 is not set
>>
>> #
>> # MFD GPIO expanders
>> #
>> CONFIG_GPIO_ARIZONA=3Dy
>> # CONFIG_GPIO_DA9055 is not set
>> CONFIG_GPIO_KEMPLD=3Dm
>> CONFIG_GPIO_LP3943=3Dy
>> CONFIG_GPIO_LP873X=3Dy
>> CONFIG_GPIO_MADERA=3Dm
>> CONFIG_GPIO_PALMAS=3Dy
>> CONFIG_GPIO_TPS65086=3Dm
>> CONFIG_GPIO_WM831X=3Dm
>> # CONFIG_GPIO_WM8994 is not set
>>
>> #
>> # PCI GPIO expanders
>> #
>> CONFIG_GPIO_AMD8111=3Dy
>> CONFIG_GPIO_BT8XX=3Dm
>> CONFIG_GPIO_ML_IOH=3Dy
>> CONFIG_GPIO_PCI_IDIO_16=3Dm
>> CONFIG_GPIO_PCIE_IDIO_24=3Dy
>> CONFIG_GPIO_RDC321X=3Dm
>> CONFIG_W1=3Dm
>> # CONFIG_W1_CON is not set
>>
>> #
>> # 1-wire Bus Masters
>> #
>> # CONFIG_W1_MASTER_MATROX is not set
>> CONFIG_W1_MASTER_DS2482=3Dm
>> CONFIG_W1_MASTER_DS1WM=3Dm
>> CONFIG_W1_MASTER_GPIO=3Dm
>>
>> #
>> # 1-wire Slaves
>> #
>> CONFIG_W1_SLAVE_THERM=3Dm
>> # CONFIG_W1_SLAVE_SMEM is not set
>> CONFIG_W1_SLAVE_DS2405=3Dm
>> CONFIG_W1_SLAVE_DS2408=3Dm
>> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
>> CONFIG_W1_SLAVE_DS2413=3Dm
>> CONFIG_W1_SLAVE_DS2406=3Dm
>> CONFIG_W1_SLAVE_DS2423=3Dm
>> # CONFIG_W1_SLAVE_DS2805 is not set
>> CONFIG_W1_SLAVE_DS2431=3Dm
>> # CONFIG_W1_SLAVE_DS2433 is not set
>> CONFIG_W1_SLAVE_DS2438=3Dm
>> CONFIG_W1_SLAVE_DS2780=3Dm
>> # CONFIG_W1_SLAVE_DS2781 is not set
>> CONFIG_W1_SLAVE_DS28E04=3Dm
>> CONFIG_W1_SLAVE_DS28E17=3Dm
>> # CONFIG_POWER_AVS is not set
>> # CONFIG_POWER_RESET is not set
>> CONFIG_POWER_SUPPLY=3Dy
>> # CONFIG_POWER_SUPPLY_DEBUG is not set
>> # CONFIG_PDA_POWER is not set
>> # CONFIG_GENERIC_ADC_BATTERY is not set
>> CONFIG_WM831X_BACKUP=3Dm
>> CONFIG_WM831X_POWER=3Dy
>> # CONFIG_TEST_POWER is not set
>> CONFIG_BATTERY_88PM860X=3Dy
>> CONFIG_CHARGER_ADP5061=3Dm
>> # CONFIG_BATTERY_DS2760 is not set
>> CONFIG_BATTERY_DS2780=3Dm
>> # CONFIG_BATTERY_DS2781 is not set
>> CONFIG_BATTERY_DS2782=3Dy
>> CONFIG_BATTERY_SBS=3Dm
>> # CONFIG_CHARGER_SBS is not set
>> CONFIG_MANAGER_SBS=3Dm
>> # CONFIG_BATTERY_BQ27XXX is not set
>> CONFIG_BATTERY_DA9030=3Dm
>> CONFIG_BATTERY_DA9150=3Dm
>> # CONFIG_BATTERY_MAX17040 is not set
>> # CONFIG_BATTERY_MAX17042 is not set
>> CONFIG_BATTERY_MAX1721X=3Dm
>> # CONFIG_CHARGER_88PM860X is not set
>> CONFIG_CHARGER_PCF50633=3Dm
>> # CONFIG_CHARGER_MAX8903 is not set
>> CONFIG_CHARGER_LP8727=3Dm
>> # CONFIG_CHARGER_LP8788 is not set
>> CONFIG_CHARGER_GPIO=3Dy
>> CONFIG_CHARGER_LTC3651=3Dy
>> # CONFIG_CHARGER_MAX77693 is not set
>> # CONFIG_CHARGER_BQ2415X is not set
>> CONFIG_CHARGER_BQ24190=3Dm
>> CONFIG_CHARGER_BQ24257=3Dm
>> CONFIG_CHARGER_BQ24735=3Dy
>> # CONFIG_CHARGER_BQ25890 is not set
>> CONFIG_CHARGER_SMB347=3Dm
>> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
>> # CONFIG_CHARGER_RT9455 is not set
>> CONFIG_HWMON=3Dm
>> CONFIG_HWMON_VID=3Dm
>> CONFIG_HWMON_DEBUG_CHIP=3Dy
>>
>> #
>> # Native drivers
>> #
>> CONFIG_SENSORS_AD7414=3Dm
>> CONFIG_SENSORS_AD7418=3Dm
>> CONFIG_SENSORS_ADM1021=3Dm
>> # CONFIG_SENSORS_ADM1025 is not set
>> CONFIG_SENSORS_ADM1026=3Dm
>> CONFIG_SENSORS_ADM1029=3Dm
>> CONFIG_SENSORS_ADM1031=3Dm
>> # CONFIG_SENSORS_ADM9240 is not set
>> # CONFIG_SENSORS_ADT7410 is not set
>> # CONFIG_SENSORS_ADT7411 is not set
>> CONFIG_SENSORS_ADT7462=3Dm
>> # CONFIG_SENSORS_ADT7470 is not set
>> # CONFIG_SENSORS_ADT7475 is not set
>> CONFIG_SENSORS_ASC7621=3Dm
>> CONFIG_SENSORS_K8TEMP=3Dm
>> # CONFIG_SENSORS_K10TEMP is not set
>> CONFIG_SENSORS_FAM15H_POWER=3Dm
>> CONFIG_SENSORS_APPLESMC=3Dm
>> CONFIG_SENSORS_ASB100=3Dm
>> # CONFIG_SENSORS_ASPEED is not set
>> # CONFIG_SENSORS_ATXP1 is not set
>> CONFIG_SENSORS_DS620=3Dm
>> CONFIG_SENSORS_DS1621=3Dm
>> CONFIG_SENSORS_DELL_SMM=3Dm
>> CONFIG_SENSORS_DA9055=3Dm
>> CONFIG_SENSORS_I5K_AMB=3Dm
>> CONFIG_SENSORS_F71805F=3Dm
>> # CONFIG_SENSORS_F71882FG is not set
>> # CONFIG_SENSORS_F75375S is not set
>> # CONFIG_SENSORS_MC13783_ADC is not set
>> CONFIG_SENSORS_FSCHMD=3Dm
>> CONFIG_SENSORS_GL518SM=3Dm
>> CONFIG_SENSORS_GL520SM=3Dm
>> CONFIG_SENSORS_G760A=3Dm
>> # CONFIG_SENSORS_G762 is not set
>> # CONFIG_SENSORS_HIH6130 is not set
>> # CONFIG_SENSORS_IBMAEM is not set
>> CONFIG_SENSORS_IBMPEX=3Dm
>> CONFIG_SENSORS_IIO_HWMON=3Dm
>> # CONFIG_SENSORS_I5500 is not set
>> CONFIG_SENSORS_CORETEMP=3Dm
>> CONFIG_SENSORS_IT87=3Dm
>> # CONFIG_SENSORS_JC42 is not set
>> CONFIG_SENSORS_POWR1220=3Dm
>> # CONFIG_SENSORS_LINEAGE is not set
>> CONFIG_SENSORS_LTC2945=3Dm
>> # CONFIG_SENSORS_LTC2990 is not set
>> # CONFIG_SENSORS_LTC4151 is not set
>> CONFIG_SENSORS_LTC4215=3Dm
>> # CONFIG_SENSORS_LTC4222 is not set
>> CONFIG_SENSORS_LTC4245=3Dm
>> # CONFIG_SENSORS_LTC4260 is not set
>> CONFIG_SENSORS_LTC4261=3Dm
>> CONFIG_SENSORS_MAX16065=3Dm
>> # CONFIG_SENSORS_MAX1619 is not set
>> CONFIG_SENSORS_MAX1668=3Dm
>> CONFIG_SENSORS_MAX197=3Dm
>> # CONFIG_SENSORS_MAX6621 is not set
>> CONFIG_SENSORS_MAX6639=3Dm
>> # CONFIG_SENSORS_MAX6642 is not set
>> CONFIG_SENSORS_MAX6650=3Dm
>> # CONFIG_SENSORS_MAX6697 is not set
>> CONFIG_SENSORS_MAX31790=3Dm
>> # CONFIG_SENSORS_MCP3021 is not set
>> # CONFIG_SENSORS_MLXREG_FAN is not set
>> CONFIG_SENSORS_TC654=3Dm
>> CONFIG_SENSORS_MENF21BMC_HWMON=3Dm
>> CONFIG_SENSORS_LM63=3Dm
>> CONFIG_SENSORS_LM73=3Dm
>> CONFIG_SENSORS_LM75=3Dm
>> CONFIG_SENSORS_LM77=3Dm
>> # CONFIG_SENSORS_LM78 is not set
>> CONFIG_SENSORS_LM80=3Dm
>> CONFIG_SENSORS_LM83=3Dm
>> CONFIG_SENSORS_LM85=3Dm
>> CONFIG_SENSORS_LM87=3Dm
>> CONFIG_SENSORS_LM90=3Dm
>> CONFIG_SENSORS_LM92=3Dm
>> CONFIG_SENSORS_LM93=3Dm
>> # CONFIG_SENSORS_LM95234 is not set
>> CONFIG_SENSORS_LM95241=3Dm
>> CONFIG_SENSORS_LM95245=3Dm
>> # CONFIG_SENSORS_PC87360 is not set
>> CONFIG_SENSORS_PC87427=3Dm
>> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
>> # CONFIG_SENSORS_NCT6683 is not set
>> # CONFIG_SENSORS_NCT6775 is not set
>> CONFIG_SENSORS_NCT7802=3Dm
>> # CONFIG_SENSORS_NCT7904 is not set
>> CONFIG_SENSORS_NPCM7XX=3Dm
>> # CONFIG_SENSORS_OCC_P8_I2C is not set
>> CONFIG_SENSORS_PCF8591=3Dm
>> CONFIG_PMBUS=3Dm
>> # CONFIG_SENSORS_PMBUS is not set
>> CONFIG_SENSORS_ADM1275=3Dm
>> # CONFIG_SENSORS_IBM_CFFPS is not set
>> # CONFIG_SENSORS_IR35221 is not set
>> CONFIG_SENSORS_LM25066=3Dm
>> CONFIG_SENSORS_LTC2978=3Dm
>> # CONFIG_SENSORS_LTC3815 is not set
>> CONFIG_SENSORS_MAX16064=3Dm
>> # CONFIG_SENSORS_MAX20751 is not set
>> # CONFIG_SENSORS_MAX31785 is not set
>> CONFIG_SENSORS_MAX34440=3Dm
>> # CONFIG_SENSORS_MAX8688 is not set
>> CONFIG_SENSORS_TPS40422=3Dm
>> CONFIG_SENSORS_TPS53679=3Dm
>> CONFIG_SENSORS_UCD9000=3Dm
>> CONFIG_SENSORS_UCD9200=3Dm
>> CONFIG_SENSORS_ZL6100=3Dm
>> CONFIG_SENSORS_SHT15=3Dm
>> CONFIG_SENSORS_SHT21=3Dm
>> # CONFIG_SENSORS_SHT3x is not set
>> # CONFIG_SENSORS_SHTC1 is not set
>> CONFIG_SENSORS_SIS5595=3Dm
>> # CONFIG_SENSORS_DME1737 is not set
>> # CONFIG_SENSORS_EMC1403 is not set
>> # CONFIG_SENSORS_EMC2103 is not set
>> CONFIG_SENSORS_EMC6W201=3Dm
>> # CONFIG_SENSORS_SMSC47M1 is not set
>> # CONFIG_SENSORS_SMSC47M192 is not set
>> CONFIG_SENSORS_SMSC47B397=3Dm
>> CONFIG_SENSORS_STTS751=3Dm
>> CONFIG_SENSORS_SMM665=3Dm
>> CONFIG_SENSORS_ADC128D818=3Dm
>> CONFIG_SENSORS_ADS1015=3Dm
>> CONFIG_SENSORS_ADS7828=3Dm
>> CONFIG_SENSORS_AMC6821=3Dm
>> CONFIG_SENSORS_INA209=3Dm
>> CONFIG_SENSORS_INA2XX=3Dm
>> CONFIG_SENSORS_INA3221=3Dm
>> # CONFIG_SENSORS_TC74 is not set
>> CONFIG_SENSORS_THMC50=3Dm
>> CONFIG_SENSORS_TMP102=3Dm
>> CONFIG_SENSORS_TMP103=3Dm
>> CONFIG_SENSORS_TMP108=3Dm
>> # CONFIG_SENSORS_TMP401 is not set
>> # CONFIG_SENSORS_TMP421 is not set
>> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
>> CONFIG_SENSORS_VIA686A=3Dm
>> CONFIG_SENSORS_VT1211=3Dm
>> # CONFIG_SENSORS_VT8231 is not set
>> CONFIG_SENSORS_W83773G=3Dm
>> CONFIG_SENSORS_W83781D=3Dm
>> # CONFIG_SENSORS_W83791D is not set
>> # CONFIG_SENSORS_W83792D is not set
>> # CONFIG_SENSORS_W83793 is not set
>> CONFIG_SENSORS_W83795=3Dm
>> CONFIG_SENSORS_W83795_FANCTRL=3Dy
>> CONFIG_SENSORS_W83L785TS=3Dm
>> # CONFIG_SENSORS_W83L786NG is not set
>> CONFIG_SENSORS_W83627HF=3Dm
>> # CONFIG_SENSORS_W83627EHF is not set
>> CONFIG_SENSORS_WM831X=3Dm
>>
>> #
>> # ACPI drivers
>> #
>> # CONFIG_SENSORS_ACPI_POWER is not set
>> # CONFIG_SENSORS_ATK0110 is not set
>> CONFIG_THERMAL=3Dy
>> # CONFIG_THERMAL_STATISTICS is not set
>> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
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
>>
>> #
>> # Intel thermal drivers
>> #
>> # CONFIG_INTEL_POWERCLAMP is not set
>> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
>>
>> #
>> # ACPI INT340X thermal drivers
>> #
>> # CONFIG_INT340X_THERMAL is not set
>> # CONFIG_INTEL_PCH_THERMAL is not set
>> # CONFIG_GENERIC_ADC_THERMAL is not set
>> # CONFIG_WATCHDOG is not set
>> CONFIG_SSB_POSSIBLE=3Dy
>> CONFIG_SSB=3Dm
>> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
>> # CONFIG_SSB_PCIHOST is not set
>> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
>> CONFIG_SSB_SDIOHOST=3Dy
>> CONFIG_SSB_DRIVER_GPIO=3Dy
>> CONFIG_BCMA_POSSIBLE=3Dy
>> # CONFIG_BCMA is not set
>>
>> #
>> # Multifunction device drivers
>> #
>> CONFIG_MFD_CORE=3Dy
>> # CONFIG_MFD_AS3711 is not set
>> # CONFIG_PMIC_ADP5520 is not set
>> # CONFIG_MFD_AAT2870_CORE is not set
>> CONFIG_MFD_BCM590XX=3Dy
>> # CONFIG_MFD_BD9571MWV is not set
>> # CONFIG_MFD_AXP20X_I2C is not set
>> # CONFIG_MFD_CROS_EC is not set
>> CONFIG_MFD_MADERA=3Dm
>> CONFIG_MFD_MADERA_I2C=3Dm
>> CONFIG_MFD_CS47L35=3Dy
>> # CONFIG_MFD_CS47L85 is not set
>> CONFIG_MFD_CS47L90=3Dy
>> CONFIG_PMIC_DA903X=3Dy
>> # CONFIG_MFD_DA9052_I2C is not set
>> CONFIG_MFD_DA9055=3Dy
>> CONFIG_MFD_DA9062=3Dm
>> CONFIG_MFD_DA9063=3Dm
>> CONFIG_MFD_DA9150=3Dy
>> CONFIG_MFD_MC13XXX=3Dy
>> CONFIG_MFD_MC13XXX_I2C=3Dy
>> # CONFIG_HTC_PASIC3 is not set
>> # CONFIG_HTC_I2CPLD is not set
>> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
>> # CONFIG_LPC_ICH is not set
>> CONFIG_LPC_SCH=3Dy
>> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
>> CONFIG_MFD_INTEL_LPSS=3Dm
>> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
>> CONFIG_MFD_INTEL_LPSS_PCI=3Dm
>> # CONFIG_MFD_JANZ_CMODIO is not set
>> CONFIG_MFD_KEMPLD=3Dy
>> # CONFIG_MFD_88PM800 is not set
>> # CONFIG_MFD_88PM805 is not set
>> CONFIG_MFD_88PM860X=3Dy
>> # CONFIG_MFD_MAX14577 is not set
>> CONFIG_MFD_MAX77693=3Dy
>> # CONFIG_MFD_MAX77843 is not set
>> CONFIG_MFD_MAX8907=3Dm
>> # CONFIG_MFD_MAX8925 is not set
>> # CONFIG_MFD_MAX8997 is not set
>> CONFIG_MFD_MAX8998=3Dy
>> CONFIG_MFD_MT6397=3Dy
>> CONFIG_MFD_MENF21BMC=3Dm
>> # CONFIG_MFD_RETU is not set
>> CONFIG_MFD_PCF50633=3Dm
>> CONFIG_PCF50633_ADC=3Dm
>> # CONFIG_PCF50633_GPIO is not set
>> CONFIG_MFD_RDC321X=3Dy
>> # CONFIG_MFD_RT5033 is not set
>> # CONFIG_MFD_RC5T583 is not set
>> # CONFIG_MFD_SEC_CORE is not set
>> # CONFIG_MFD_SI476X_CORE is not set
>> # CONFIG_MFD_SM501 is not set
>> # CONFIG_MFD_SKY81452 is not set
>> # CONFIG_MFD_SMSC is not set
>> CONFIG_ABX500_CORE=3Dy
>> CONFIG_AB3100_CORE=3Dy
>> CONFIG_AB3100_OTP=3Dm
>> CONFIG_MFD_SYSCON=3Dy
>> # CONFIG_MFD_TI_AM335X_TSCADC is not set
>> CONFIG_MFD_LP3943=3Dy
>> CONFIG_MFD_LP8788=3Dy
>> # CONFIG_MFD_TI_LMU is not set
>> CONFIG_MFD_PALMAS=3Dy
>> # CONFIG_TPS6105X is not set
>> # CONFIG_TPS65010 is not set
>> # CONFIG_TPS6507X is not set
>> CONFIG_MFD_TPS65086=3Dm
>> # CONFIG_MFD_TPS65090 is not set
>> CONFIG_MFD_TI_LP873X=3Dy
>> # CONFIG_MFD_TPS6586X is not set
>> # CONFIG_MFD_TPS65910 is not set
>> # CONFIG_MFD_TPS65912_I2C is not set
>> # CONFIG_MFD_TPS80031 is not set
>> # CONFIG_TWL4030_CORE is not set
>> # CONFIG_TWL6040_CORE is not set
>> # CONFIG_MFD_WL1273_CORE is not set
>> # CONFIG_MFD_LM3533 is not set
>> # CONFIG_MFD_TQMX86 is not set
>> CONFIG_MFD_VX855=3Dm
>> CONFIG_MFD_ARIZONA=3Dy
>> CONFIG_MFD_ARIZONA_I2C=3Dm
>> CONFIG_MFD_CS47L24=3Dy
>> CONFIG_MFD_WM5102=3Dy
>> # CONFIG_MFD_WM5110 is not set
>> CONFIG_MFD_WM8997=3Dy
>> CONFIG_MFD_WM8998=3Dy
>> # CONFIG_MFD_WM8400 is not set
>> CONFIG_MFD_WM831X=3Dy
>> CONFIG_MFD_WM831X_I2C=3Dy
>> # CONFIG_MFD_WM8350_I2C is not set
>> CONFIG_MFD_WM8994=3Dm
>> CONFIG_RAVE_SP_CORE=3Dm
>> # CONFIG_REGULATOR is not set
>> CONFIG_RC_CORE=3Dm
>> CONFIG_RC_MAP=3Dm
>> CONFIG_LIRC=3Dy
>> CONFIG_RC_DECODERS=3Dy
>> CONFIG_IR_NEC_DECODER=3Dm
>> CONFIG_IR_RC5_DECODER=3Dm
>> CONFIG_IR_RC6_DECODER=3Dm
>> CONFIG_IR_JVC_DECODER=3Dm
>> # CONFIG_IR_SONY_DECODER is not set
>> CONFIG_IR_SANYO_DECODER=3Dm
>> CONFIG_IR_SHARP_DECODER=3Dm
>> # CONFIG_IR_MCE_KBD_DECODER is not set
>> CONFIG_IR_XMP_DECODER=3Dm
>> # CONFIG_IR_IMON_DECODER is not set
>> # CONFIG_IR_RCMM_DECODER is not set
>> # CONFIG_RC_DEVICES is not set
>> CONFIG_MEDIA_SUPPORT=3Dm
>>
>> #
>> # Multimedia core support
>> #
>> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
>> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
>> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
>> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
>> # CONFIG_MEDIA_SDR_SUPPORT is not set
>> CONFIG_MEDIA_CEC_SUPPORT=3Dy
>> # CONFIG_MEDIA_CONTROLLER is not set
>> CONFIG_VIDEO_DEV=3Dm
>> CONFIG_VIDEO_V4L2=3Dm
>> # CONFIG_VIDEO_ADV_DEBUG is not set
>> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>> CONFIG_VIDEO_TUNER=3Dm
>> CONFIG_V4L2_MEM2MEM_DEV=3Dm
>> CONFIG_V4L2_FWNODE=3Dm
>> CONFIG_VIDEOBUF_GEN=3Dm
>> CONFIG_VIDEOBUF_DMA_SG=3Dm
>> CONFIG_DVB_CORE=3Dm
>> CONFIG_DVB_MMAP=3Dy
>> CONFIG_DVB_NET=3Dy
>> CONFIG_DVB_MAX_ADAPTERS=3D16
>> # CONFIG_DVB_DYNAMIC_MINORS is not set
>> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
>> CONFIG_DVB_ULE_DEBUG=3Dy
>>
>> #
>> # Media drivers
>> #
>> CONFIG_MEDIA_PCI_SUPPORT=3Dy
>>
>> #
>> # Media capture support
>> #
>> CONFIG_VIDEO_TW5864=3Dm
>> # CONFIG_VIDEO_TW68 is not set
>>
>> #
>> # Media capture/analog/hybrid TV support
>> #
>> # CONFIG_VIDEO_CX18 is not set
>> CONFIG_VIDEO_CX25821=3Dm
>> CONFIG_VIDEO_CX88=3Dm
>> CONFIG_VIDEO_CX88_BLACKBIRD=3Dm
>> CONFIG_VIDEO_CX88_DVB=3Dm
>> CONFIG_VIDEO_CX88_ENABLE_VP3054=3Dy
>> CONFIG_VIDEO_CX88_VP3054=3Dm
>> CONFIG_VIDEO_CX88_MPEG=3Dm
>> # CONFIG_VIDEO_BT848 is not set
>> CONFIG_VIDEO_SAA7134=3Dm
>> CONFIG_VIDEO_SAA7134_RC=3Dy
>> CONFIG_VIDEO_SAA7134_DVB=3Dm
>> CONFIG_VIDEO_SAA7164=3Dm
>>
>> #
>> # Media digital TV PCI Adapters
>> #
>> # CONFIG_DVB_AV7110 is not set
>> # CONFIG_DVB_BUDGET_CORE is not set
>> # CONFIG_DVB_B2C2_FLEXCOP_PCI is not set
>> # CONFIG_DVB_PLUTO2 is not set
>> # CONFIG_DVB_DM1105 is not set
>> # CONFIG_DVB_PT1 is not set
>> CONFIG_DVB_PT3=3Dm
>> CONFIG_MANTIS_CORE=3Dm
>> # CONFIG_DVB_MANTIS is not set
>> CONFIG_DVB_HOPPER=3Dm
>> # CONFIG_DVB_NGENE is not set
>> CONFIG_DVB_DDBRIDGE=3Dm
>> CONFIG_DVB_SMIPCIE=3Dm
>> CONFIG_V4L_PLATFORM_DRIVERS=3Dy
>> CONFIG_VIDEO_CAFE_CCIC=3Dm
>> CONFIG_VIDEO_VIA_CAMERA=3Dm
>> CONFIG_VIDEO_CADENCE=3Dy
>> # CONFIG_VIDEO_ASPEED is not set
>> CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
>> CONFIG_VIDEO_MEM2MEM_DEINTERLACE=3Dm
>> CONFIG_VIDEO_SH_VEU=3Dm
>> CONFIG_V4L_TEST_DRIVERS=3Dy
>> # CONFIG_VIDEO_VIVID is not set
>> CONFIG_VIDEO_VIM2M=3Dm
>> # CONFIG_VIDEO_VICODEC is not set
>> CONFIG_DVB_PLATFORM_DRIVERS=3Dy
>> CONFIG_CEC_PLATFORM_DRIVERS=3Dy
>>
>> #
>> # Supported MMC/SDIO adapters
>> #
>> CONFIG_SMS_SDIO_DRV=3Dm
>> # CONFIG_RADIO_ADAPTERS is not set
>>
>> #
>> # Supported FireWire (IEEE 1394) Adapters
>> #
>> CONFIG_DVB_FIREDTV=3Dm
>> CONFIG_DVB_FIREDTV_INPUT=3Dy
>> CONFIG_MEDIA_COMMON_OPTIONS=3Dy
>>
>> #
>> # common driver options
>> #
>> CONFIG_VIDEO_CX2341X=3Dm
>> CONFIG_VIDEO_TVEEPROM=3Dm
>> CONFIG_VIDEOBUF2_CORE=3Dm
>> CONFIG_VIDEOBUF2_V4L2=3Dm
>> CONFIG_VIDEOBUF2_MEMOPS=3Dm
>> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dm
>> CONFIG_VIDEOBUF2_VMALLOC=3Dm
>> CONFIG_VIDEOBUF2_DMA_SG=3Dm
>> CONFIG_VIDEOBUF2_DVB=3Dm
>> CONFIG_SMS_SIANO_MDTV=3Dm
>> # CONFIG_SMS_SIANO_RC is not set
>>
>> #
>> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
>> #
>> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
>> CONFIG_MEDIA_ATTACH=3Dy
>> CONFIG_VIDEO_IR_I2C=3Dm
>>
>> #
>> # Audio decoders, processors and mixers
>> #
>> CONFIG_VIDEO_WM8775=3Dm
>>
>> #
>> # RDS decoders
>> #
>> CONFIG_VIDEO_SAA6588=3Dm
>>
>> #
>> # Video decoders
>> #
>>
>> #
>> # Video and audio decoders
>> #
>>
>> #
>> # Video encoders
>> #
>>
>> #
>> # Camera sensor devices
>> #
>> CONFIG_VIDEO_OV7670=3Dm
>>
>> #
>> # Flash devices
>> #
>>
>> #
>> # Video improvement chips
>> #
>>
>> #
>> # Audio/Video compression chips
>> #
>> CONFIG_VIDEO_SAA6752HS=3Dm
>>
>> #
>> # SDR tuner chips
>> #
>>
>> #
>> # Miscellaneous helper chips
>> #
>> CONFIG_MEDIA_TUNER=3Dm
>> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
>> CONFIG_MEDIA_TUNER_TDA8290=3Dm
>> CONFIG_MEDIA_TUNER_TDA827X=3Dm
>> CONFIG_MEDIA_TUNER_TDA18271=3Dm
>> CONFIG_MEDIA_TUNER_TDA9887=3Dm
>> CONFIG_MEDIA_TUNER_TEA5761=3Dm
>> CONFIG_MEDIA_TUNER_TEA5767=3Dm
>> CONFIG_MEDIA_TUNER_MT20XX=3Dm
>> CONFIG_MEDIA_TUNER_XC2028=3Dm
>> CONFIG_MEDIA_TUNER_XC5000=3Dm
>> CONFIG_MEDIA_TUNER_XC4000=3Dm
>> CONFIG_MEDIA_TUNER_MC44S803=3Dm
>> CONFIG_MEDIA_TUNER_TDA18212=3Dm
>> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
>> CONFIG_MEDIA_TUNER_SI2157=3Dm
>> CONFIG_MEDIA_TUNER_MXL301RF=3Dm
>> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
>>
>> #
>> # Multistandard (satellite) frontends
>> #
>> CONFIG_DVB_STB6100=3Dm
>> CONFIG_DVB_STV090x=3Dm
>> CONFIG_DVB_STV0910=3Dm
>> CONFIG_DVB_STV6110x=3Dm
>> CONFIG_DVB_STV6111=3Dm
>> CONFIG_DVB_MXL5XX=3Dm
>> CONFIG_DVB_M88DS3103=3Dm
>>
>> #
>> # Multistandard (cable + terrestrial) frontends
>> #
>> CONFIG_DVB_DRXK=3Dm
>> CONFIG_DVB_TDA18271C2DD=3Dm
>>
>> #
>> # DVB-S (satellite) frontends
>> #
>> CONFIG_DVB_CX24123=3Dm
>> CONFIG_DVB_MT312=3Dm
>> CONFIG_DVB_ZL10036=3Dm
>> CONFIG_DVB_ZL10039=3Dm
>> CONFIG_DVB_STV0288=3Dm
>> CONFIG_DVB_STB6000=3Dm
>> CONFIG_DVB_STV0299=3Dm
>> CONFIG_DVB_STV0900=3Dm
>> CONFIG_DVB_TDA10086=3Dm
>> CONFIG_DVB_TDA826X=3Dm
>> CONFIG_DVB_CX24116=3Dm
>> CONFIG_DVB_TS2020=3Dm
>> CONFIG_DVB_DS3000=3Dm
>>
>> #
>> # DVB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_CX22702=3Dm
>> CONFIG_DVB_TDA1004X=3Dm
>> CONFIG_DVB_MT352=3Dm
>> CONFIG_DVB_ZL10353=3Dm
>> CONFIG_DVB_TDA10048=3Dm
>> CONFIG_DVB_STV0367=3Dm
>> CONFIG_DVB_CXD2841ER=3Dm
>> CONFIG_DVB_SI2168=3Dm
>>
>> #
>> # DVB-C (cable) frontends
>> #
>>
>> #
>> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
>> #
>> CONFIG_DVB_NXT200X=3Dm
>> CONFIG_DVB_OR51132=3Dm
>> CONFIG_DVB_LGDT330X=3Dm
>> CONFIG_DVB_LGDT3305=3Dm
>> CONFIG_DVB_S5H1411=3Dm
>>
>> #
>> # ISDB-T (terrestrial) frontends
>> #
>>
>> #
>> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_TC90522=3Dm
>>
>> #
>> # Digital terrestrial only tuners/PLL
>> #
>> CONFIG_DVB_PLL=3Dm
>>
>> #
>> # SEC control devices for DVB-S
>> #
>> CONFIG_DVB_LNBH25=3Dm
>> CONFIG_DVB_LNBP21=3Dm
>> CONFIG_DVB_ISL6405=3Dm
>> CONFIG_DVB_ISL6421=3Dm
>>
>> #
>> # Common Interface (EN50221) controller drivers
>> #
>> CONFIG_DVB_CXD2099=3Dm
>>
>> #
>> # Tools to develop new frontends
>> #
>> CONFIG_DVB_DUMMY_FE=3Dm
>>
>> #
>> # Graphics support
>> #
>> # CONFIG_AGP is not set
>> CONFIG_INTEL_GTT=3Dm
>> # CONFIG_VGA_ARB is not set
>> # CONFIG_VGA_SWITCHEROO is not set
>> CONFIG_DRM=3Dm
>> CONFIG_DRM_MIPI_DSI=3Dy
>> # CONFIG_DRM_DP_AUX_CHARDEV is not set
>> # CONFIG_DRM_DEBUG_SELFTEST is not set
>> CONFIG_DRM_KMS_HELPER=3Dm
>> # CONFIG_DRM_FBDEV_EMULATION is not set
>> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
>> # CONFIG_DRM_DP_CEC is not set
>> CONFIG_DRM_TTM=3Dm
>> CONFIG_DRM_GEM_CMA_HELPER=3Dy
>> CONFIG_DRM_KMS_CMA_HELPER=3Dy
>> CONFIG_DRM_VM=3Dy
>>
>> #
>> # I2C encoder or helper chips
>> #
>> CONFIG_DRM_I2C_CH7006=3Dm
>> CONFIG_DRM_I2C_SIL164=3Dm
>> # CONFIG_DRM_I2C_NXP_TDA998X is not set
>> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
>>
>> #
>> # ARM devices
>> #
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
>> # CONFIG_DRM_NOUVEAU is not set
>> CONFIG_DRM_I915=3Dm
>> CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
>> # CONFIG_DRM_I915_CAPTURE_ERROR is not set
>> CONFIG_DRM_I915_USERPTR=3Dy
>> # CONFIG_DRM_I915_GVT is not set
>>
>> #
>> # drm/i915 Debugging
>> #
>> # CONFIG_DRM_I915_WERROR is not set
>> # CONFIG_DRM_I915_DEBUG is not set
>> CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=3Dy
>> CONFIG_DRM_I915_SW_FENCE_CHECK_DAG=3Dy
>> CONFIG_DRM_I915_DEBUG_GUC=3Dy
>> # CONFIG_DRM_I915_SELFTEST is not set
>> # CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
>> CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=3Dy
>> # CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
>> CONFIG_DRM_VGEM=3Dm
>> CONFIG_DRM_VKMS=3Dm
>> # CONFIG_DRM_VMWGFX is not set
>> # CONFIG_DRM_GMA500 is not set
>> # CONFIG_DRM_UDL is not set
>> CONFIG_DRM_AST=3Dm
>> CONFIG_DRM_MGAG200=3Dm
>> # CONFIG_DRM_CIRRUS_QEMU is not set
>> CONFIG_DRM_QXL=3Dm
>> CONFIG_DRM_BOCHS=3Dm
>> # CONFIG_DRM_VIRTIO_GPU is not set
>> CONFIG_DRM_PANEL=3Dy
>>
>> #
>> # Display Panels
>> #
>> CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=3Dm
>> CONFIG_DRM_BRIDGE=3Dy
>> CONFIG_DRM_PANEL_BRIDGE=3Dy
>>
>> #
>> # Display Interface Bridges
>> #
>> CONFIG_DRM_ANALOGIX_ANX78XX=3Dm
>> # CONFIG_DRM_ETNAVIV is not set
>> # CONFIG_DRM_HISI_HIBMC is not set
>> CONFIG_DRM_TINYDRM=3Dm
>> CONFIG_DRM_LEGACY=3Dy
>> CONFIG_DRM_TDFX=3Dm
>> # CONFIG_DRM_R128 is not set
>> CONFIG_DRM_MGA=3Dm
>> CONFIG_DRM_VIA=3Dm
>> CONFIG_DRM_SAVAGE=3Dm
>> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dm
>>
>> #
>> # Frame buffer Devices
>> #
>> CONFIG_FB_CMDLINE=3Dy
>> CONFIG_FB_NOTIFY=3Dy
>> CONFIG_FB=3Dm
>> # CONFIG_FIRMWARE_EDID is not set
>> CONFIG_FB_DDC=3Dm
>> CONFIG_FB_CFB_FILLRECT=3Dm
>> CONFIG_FB_CFB_COPYAREA=3Dm
>> CONFIG_FB_CFB_IMAGEBLIT=3Dm
>> CONFIG_FB_SYS_FILLRECT=3Dm
>> CONFIG_FB_SYS_COPYAREA=3Dm
>> CONFIG_FB_SYS_IMAGEBLIT=3Dm
>> CONFIG_FB_FOREIGN_ENDIAN=3Dy
>> # CONFIG_FB_BOTH_ENDIAN is not set
>> # CONFIG_FB_BIG_ENDIAN is not set
>> CONFIG_FB_LITTLE_ENDIAN=3Dy
>> CONFIG_FB_SYS_FOPS=3Dm
>> CONFIG_FB_DEFERRED_IO=3Dy
>> CONFIG_FB_HECUBA=3Dm
>> CONFIG_FB_SVGALIB=3Dm
>> CONFIG_FB_BACKLIGHT=3Dm
>> CONFIG_FB_MODE_HELPERS=3Dy
>> CONFIG_FB_TILEBLITTING=3Dy
>>
>> #
>> # Frame buffer hardware drivers
>> #
>> # CONFIG_FB_CIRRUS is not set
>> # CONFIG_FB_PM2 is not set
>> # CONFIG_FB_CYBER2000 is not set
>> # CONFIG_FB_ARC is not set
>> # CONFIG_FB_VGA16 is not set
>> CONFIG_FB_UVESA=3Dm
>> CONFIG_FB_N411=3Dm
>> # CONFIG_FB_HGA is not set
>> CONFIG_FB_OPENCORES=3Dm
>> CONFIG_FB_S1D13XXX=3Dm
>> CONFIG_FB_NVIDIA=3Dm
>> CONFIG_FB_NVIDIA_I2C=3Dy
>> CONFIG_FB_NVIDIA_DEBUG=3Dy
>> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
>> # CONFIG_FB_RIVA is not set
>> # CONFIG_FB_I740 is not set
>> CONFIG_FB_LE80578=3Dm
>> # CONFIG_FB_CARILLO_RANCH is not set
>> CONFIG_FB_MATROX=3Dm
>> # CONFIG_FB_MATROX_MILLENIUM is not set
>> # CONFIG_FB_MATROX_MYSTIQUE is not set
>> CONFIG_FB_MATROX_G=3Dy
>> CONFIG_FB_MATROX_I2C=3Dm
>> # CONFIG_FB_MATROX_MAVEN is not set
>> CONFIG_FB_RADEON=3Dm
>> CONFIG_FB_RADEON_I2C=3Dy
>> CONFIG_FB_RADEON_BACKLIGHT=3Dy
>> # CONFIG_FB_RADEON_DEBUG is not set
>> CONFIG_FB_ATY128=3Dm
>> # CONFIG_FB_ATY128_BACKLIGHT is not set
>> # CONFIG_FB_ATY is not set
>> CONFIG_FB_S3=3Dm
>> # CONFIG_FB_S3_DDC is not set
>> # CONFIG_FB_SAVAGE is not set
>> CONFIG_FB_SIS=3Dm
>> # CONFIG_FB_SIS_300 is not set
>> CONFIG_FB_SIS_315=3Dy
>> CONFIG_FB_VIA=3Dm
>> # CONFIG_FB_VIA_DIRECT_PROCFS is not set
>> CONFIG_FB_VIA_X_COMPATIBILITY=3Dy
>> CONFIG_FB_NEOMAGIC=3Dm
>> CONFIG_FB_KYRO=3Dm
>> CONFIG_FB_3DFX=3Dm
>> CONFIG_FB_3DFX_ACCEL=3Dy
>> CONFIG_FB_3DFX_I2C=3Dy
>> CONFIG_FB_VOODOO1=3Dm
>> CONFIG_FB_VT8623=3Dm
>> # CONFIG_FB_TRIDENT is not set
>> # CONFIG_FB_ARK is not set
>> # CONFIG_FB_PM3 is not set
>> CONFIG_FB_CARMINE=3Dm
>> CONFIG_FB_CARMINE_DRAM_EVAL=3Dy
>> # CONFIG_CARMINE_DRAM_CUSTOM is not set
>> CONFIG_FB_IBM_GXT4500=3Dm
>> # CONFIG_FB_VIRTUAL is not set
>> CONFIG_FB_METRONOME=3Dm
>> CONFIG_FB_MB862XX=3Dm
>> CONFIG_FB_MB862XX_PCI_GDC=3Dy
>> # CONFIG_FB_MB862XX_I2C is not set
>> CONFIG_FB_SM712=3Dm
>> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>> CONFIG_LCD_CLASS_DEVICE=3Dm
>> CONFIG_LCD_PLATFORM=3Dm
>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> # CONFIG_BACKLIGHT_GENERIC is not set
>> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dm
>> # CONFIG_BACKLIGHT_DA903X is not set
>> # CONFIG_BACKLIGHT_APPLE is not set
>> # CONFIG_BACKLIGHT_PM8941_WLED is not set
>> CONFIG_BACKLIGHT_SAHARA=3Dm
>> # CONFIG_BACKLIGHT_WM831X is not set
>> CONFIG_BACKLIGHT_ADP8860=3Dm
>> CONFIG_BACKLIGHT_ADP8870=3Dy
>> CONFIG_BACKLIGHT_88PM860X=3Dm
>> CONFIG_BACKLIGHT_PCF50633=3Dm
>> CONFIG_BACKLIGHT_LM3639=3Dy
>> CONFIG_BACKLIGHT_GPIO=3Dm
>> CONFIG_BACKLIGHT_LV5207LP=3Dy
>> # CONFIG_BACKLIGHT_BD6107 is not set
>> CONFIG_BACKLIGHT_ARCXCNN=3Dy
>> # CONFIG_BACKLIGHT_RAVE_SP is not set
>> CONFIG_VGASTATE=3Dm
>> CONFIG_HDMI=3Dy
>> CONFIG_LOGO=3Dy
>> CONFIG_LOGO_LINUX_MONO=3Dy
>> # CONFIG_LOGO_LINUX_VGA16 is not set
>> CONFIG_LOGO_LINUX_CLUT224=3Dy
>> # CONFIG_SOUND is not set
>>
>> #
>> # HID support
>> #
>> CONFIG_HID=3Dm
>> CONFIG_HID_BATTERY_STRENGTH=3Dy
>> # CONFIG_HIDRAW is not set
>> # CONFIG_UHID is not set
>> # CONFIG_HID_GENERIC is not set
>>
>> #
>> # Special HID drivers
>> #
>> # CONFIG_HID_A4TECH is not set
>> CONFIG_HID_ACRUX=3Dm
>> CONFIG_HID_ACRUX_FF=3Dy
>> CONFIG_HID_APPLE=3Dm
>> CONFIG_HID_ASUS=3Dm
>> # CONFIG_HID_AUREAL is not set
>> CONFIG_HID_BELKIN=3Dm
>> CONFIG_HID_CHERRY=3Dm
>> CONFIG_HID_CHICONY=3Dm
>> CONFIG_HID_COUGAR=3Dm
>> CONFIG_HID_CMEDIA=3Dm
>> CONFIG_HID_CYPRESS=3Dm
>> CONFIG_HID_DRAGONRISE=3Dm
>> CONFIG_DRAGONRISE_FF=3Dy
>> CONFIG_HID_EMS_FF=3Dm
>> CONFIG_HID_ELECOM=3Dm
>> # CONFIG_HID_EZKEY is not set
>> CONFIG_HID_GEMBIRD=3Dm
>> # CONFIG_HID_GFRM is not set
>> CONFIG_HID_KEYTOUCH=3Dm
>> CONFIG_HID_KYE=3Dm
>> CONFIG_HID_WALTOP=3Dm
>> # CONFIG_HID_VIEWSONIC is not set
>> CONFIG_HID_GYRATION=3Dm
>> CONFIG_HID_ICADE=3Dm
>> CONFIG_HID_ITE=3Dm
>> # CONFIG_HID_JABRA is not set
>> CONFIG_HID_TWINHAN=3Dm
>> CONFIG_HID_KENSINGTON=3Dm
>> CONFIG_HID_LCPOWER=3Dm
>> CONFIG_HID_LED=3Dm
>> # CONFIG_HID_LENOVO is not set
>> CONFIG_HID_LOGITECH=3Dm
>> # CONFIG_HID_LOGITECH_HIDPP is not set
>> CONFIG_LOGITECH_FF=3Dy
>> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
>> # CONFIG_LOGIG940_FF is not set
>> CONFIG_LOGIWHEELS_FF=3Dy
>> # CONFIG_HID_MAGICMOUSE is not set
>> # CONFIG_HID_MALTRON is not set
>> # CONFIG_HID_MAYFLASH is not set
>> # CONFIG_HID_REDRAGON is not set
>> # CONFIG_HID_MICROSOFT is not set
>> CONFIG_HID_MONTEREY=3Dm
>> CONFIG_HID_MULTITOUCH=3Dm
>> # CONFIG_HID_NTI is not set
>> # CONFIG_HID_ORTEK is not set
>> CONFIG_HID_PANTHERLORD=3Dm
>> CONFIG_PANTHERLORD_FF=3Dy
>> # CONFIG_HID_PETALYNX is not set
>> CONFIG_HID_PICOLCD=3Dm
>> # CONFIG_HID_PICOLCD_FB is not set
>> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
>> CONFIG_HID_PICOLCD_LCD=3Dy
>> CONFIG_HID_PICOLCD_LEDS=3Dy
>> CONFIG_HID_PICOLCD_CIR=3Dy
>> CONFIG_HID_PLANTRONICS=3Dm
>> CONFIG_HID_PRIMAX=3Dm
>> # CONFIG_HID_SAITEK is not set
>> CONFIG_HID_SAMSUNG=3Dm
>> CONFIG_HID_SPEEDLINK=3Dm
>> CONFIG_HID_STEAM=3Dm
>> # CONFIG_HID_STEELSERIES is not set
>> CONFIG_HID_SUNPLUS=3Dm
>> # CONFIG_HID_RMI is not set
>> CONFIG_HID_GREENASIA=3Dm
>> # CONFIG_GREENASIA_FF is not set
>> CONFIG_HID_SMARTJOYPLUS=3Dm
>> CONFIG_SMARTJOYPLUS_FF=3Dy
>> # CONFIG_HID_TIVO is not set
>> CONFIG_HID_TOPSEED=3Dm
>> # CONFIG_HID_THINGM is not set
>> CONFIG_HID_THRUSTMASTER=3Dm
>> CONFIG_THRUSTMASTER_FF=3Dy
>> # CONFIG_HID_UDRAW_PS3 is not set
>> CONFIG_HID_WIIMOTE=3Dm
>> CONFIG_HID_XINMO=3Dm
>> CONFIG_HID_ZEROPLUS=3Dm
>> CONFIG_ZEROPLUS_FF=3Dy
>> CONFIG_HID_ZYDACRON=3Dm
>> CONFIG_HID_SENSOR_HUB=3Dm
>> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
>> CONFIG_HID_ALPS=3Dm
>>
>> #
>> # I2C HID support
>> #
>> CONFIG_I2C_HID=3Dm
>>
>> #
>> # Intel ISH HID support
>> #
>> # CONFIG_INTEL_ISH_HID is not set
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
>> # CONFIG_NOP_USB_XCEIV is not set
>> # CONFIG_USB_GPIO_VBUS is not set
>> # CONFIG_USB_GADGET is not set
>> # CONFIG_TYPEC is not set
>> # CONFIG_USB_ROLE_SWITCH is not set
>> # CONFIG_USB_LED_TRIG is not set
>> # CONFIG_USB_ULPI_BUS is not set
>> CONFIG_UWB=3Dy
>> CONFIG_UWB_WHCI=3Dm
>> CONFIG_MMC=3Dy
>> # CONFIG_MMC_BLOCK is not set
>> # CONFIG_SDIO_UART is not set
>> # CONFIG_MMC_TEST is not set
>>
>> #
>> # MMC/SD/SDIO Host Controller Drivers
>> #
>> CONFIG_MMC_DEBUG=3Dy
>> CONFIG_MMC_SDHCI=3Dm
>> CONFIG_MMC_SDHCI_PCI=3Dm
>> CONFIG_MMC_RICOH_MMC=3Dy
>> # CONFIG_MMC_SDHCI_ACPI is not set
>> # CONFIG_MMC_SDHCI_PLTFM is not set
>> CONFIG_MMC_TIFM_SD=3Dy
>> # CONFIG_MMC_CB710 is not set
>> CONFIG_MMC_VIA_SDMMC=3Dm
>> CONFIG_MMC_USDHI6ROL0=3Dy
>> CONFIG_MMC_REALTEK_PCI=3Dm
>> CONFIG_MMC_CQHCI=3Dm
>> CONFIG_MMC_TOSHIBA_PCI=3Dy
>> CONFIG_MMC_MTK=3Dy
>> CONFIG_MEMSTICK=3Dy
>> # CONFIG_MEMSTICK_DEBUG is not set
>>
>> #
>> # MemoryStick drivers
>> #
>> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
>> CONFIG_MSPRO_BLOCK=3Dy
>> CONFIG_MS_BLOCK=3Dy
>>
>> #
>> # MemoryStick Host Controller Drivers
>> #
>> CONFIG_MEMSTICK_TIFM_MS=3Dm
>> CONFIG_MEMSTICK_JMICRON_38X=3Dy
>> CONFIG_MEMSTICK_R592=3Dm
>> CONFIG_MEMSTICK_REALTEK_PCI=3Dm
>> CONFIG_NEW_LEDS=3Dy
>> CONFIG_LEDS_CLASS=3Dy
>> # CONFIG_LEDS_CLASS_FLASH is not set
>> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
>>
>> #
>> # LED drivers
>> #
>> # CONFIG_LEDS_88PM860X is not set
>> CONFIG_LEDS_LM3530=3Dm
>> # CONFIG_LEDS_LM3642 is not set
>> CONFIG_LEDS_MT6323=3Dy
>> CONFIG_LEDS_PCA9532=3Dm
>> # CONFIG_LEDS_PCA9532_GPIO is not set
>> # CONFIG_LEDS_GPIO is not set
>> CONFIG_LEDS_LP3944=3Dm
>> CONFIG_LEDS_LP3952=3Dm
>> CONFIG_LEDS_LP55XX_COMMON=3Dy
>> # CONFIG_LEDS_LP5521 is not set
>> CONFIG_LEDS_LP5523=3Dm
>> # CONFIG_LEDS_LP5562 is not set
>> CONFIG_LEDS_LP8501=3Dy
>> # CONFIG_LEDS_LP8788 is not set
>> # CONFIG_LEDS_PCA955X is not set
>> CONFIG_LEDS_PCA963X=3Dy
>> # CONFIG_LEDS_WM831X_STATUS is not set
>> CONFIG_LEDS_DA903X=3Dy
>> CONFIG_LEDS_BD2802=3Dm
>> # CONFIG_LEDS_LT3593 is not set
>> CONFIG_LEDS_MC13783=3Dm
>> # CONFIG_LEDS_TCA6507 is not set
>> # CONFIG_LEDS_TLC591XX is not set
>> # CONFIG_LEDS_LM355x is not set
>> CONFIG_LEDS_MENF21BMC=3Dm
>>
>> #
>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_=
THINGM)
>> #
>> # CONFIG_LEDS_BLINKM is not set
>> # CONFIG_LEDS_MLXREG is not set
>> # CONFIG_LEDS_USER is not set
>> # CONFIG_LEDS_NIC78BX is not set
>>
>> #
>> # LED Triggers
>> #
>> CONFIG_LEDS_TRIGGERS=3Dy
>> # CONFIG_LEDS_TRIGGER_TIMER is not set
>> # CONFIG_LEDS_TRIGGER_ONESHOT is not set
>> CONFIG_LEDS_TRIGGER_MTD=3Dy
>> # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
>> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
>> CONFIG_LEDS_TRIGGER_CPU=3Dy
>> CONFIG_LEDS_TRIGGER_ACTIVITY=3Dy
>> # CONFIG_LEDS_TRIGGER_GPIO is not set
>> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
>>
>> #
>> # iptables trigger is under Netfilter config (LED target)
>> #
>> # CONFIG_LEDS_TRIGGER_TRANSIENT is not set
>> # CONFIG_LEDS_TRIGGER_CAMERA is not set
>> # CONFIG_LEDS_TRIGGER_PANIC is not set
>> CONFIG_LEDS_TRIGGER_NETDEV=3Dm
>> # CONFIG_LEDS_TRIGGER_PATTERN is not set
>> # CONFIG_LEDS_TRIGGER_AUDIO is not set
>> # CONFIG_ACCESSIBILITY is not set
>> # CONFIG_INFINIBAND is not set
>> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>> CONFIG_EDAC_SUPPORT=3Dy
>> # CONFIG_EDAC is not set
>> CONFIG_RTC_LIB=3Dy
>> CONFIG_RTC_MC146818_LIB=3Dy
>> # CONFIG_RTC_CLASS is not set
>> CONFIG_DMADEVICES=3Dy
>> CONFIG_DMADEVICES_DEBUG=3Dy
>> # CONFIG_DMADEVICES_VDEBUG is not set
>>
>> #
>> # DMA Devices
>> #
>> CONFIG_DMA_ENGINE=3Dy
>> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
>> CONFIG_DMA_ACPI=3Dy
>> # CONFIG_ALTERA_MSGDMA is not set
>> CONFIG_INTEL_IDMA64=3Dy
>> # CONFIG_INTEL_IOATDMA is not set
>> CONFIG_INTEL_MIC_X100_DMA=3Dy
>> # CONFIG_QCOM_HIDMA_MGMT is not set
>> CONFIG_QCOM_HIDMA=3Dy
>> CONFIG_DW_DMAC_CORE=3Dy
>> CONFIG_DW_DMAC=3Dm
>> # CONFIG_DW_DMAC_PCI is not set
>> CONFIG_HSU_DMA=3Dy
>>
>> #
>> # DMA Clients
>> #
>> CONFIG_ASYNC_TX_DMA=3Dy
>> # CONFIG_DMATEST is not set
>>
>> #
>> # DMABUF options
>> #
>> CONFIG_SYNC_FILE=3Dy
>> # CONFIG_SW_SYNC is not set
>> # CONFIG_UDMABUF is not set
>> # CONFIG_AUXDISPLAY is not set
>> # CONFIG_PANEL is not set
>> CONFIG_UIO=3Dm
>> CONFIG_UIO_CIF=3Dm
>> # CONFIG_UIO_PDRV_GENIRQ is not set
>> # CONFIG_UIO_DMEM_GENIRQ is not set
>> CONFIG_UIO_AEC=3Dm
>> CONFIG_UIO_SERCOS3=3Dm
>> CONFIG_UIO_PCI_GENERIC=3Dm
>> CONFIG_UIO_NETX=3Dm
>> CONFIG_UIO_PRUSS=3Dm
>> # CONFIG_UIO_MF624 is not set
>> # CONFIG_VIRT_DRIVERS is not set
>> CONFIG_VIRTIO=3Dy
>> # CONFIG_VIRTIO_MENU is not set
>>
>> #
>> # Microsoft Hyper-V guest support
>> #
>> # CONFIG_HYPERV is not set
>> CONFIG_STAGING=3Dy
>> CONFIG_COMEDI=3Dy
>> # CONFIG_COMEDI_DEBUG is not set
>> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
>> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
>> # CONFIG_COMEDI_MISC_DRIVERS is not set
>> CONFIG_COMEDI_ISA_DRIVERS=3Dy
>> CONFIG_COMEDI_PCL711=3Dm
>> # CONFIG_COMEDI_PCL724 is not set
>> # CONFIG_COMEDI_PCL726 is not set
>> CONFIG_COMEDI_PCL730=3Dy
>> CONFIG_COMEDI_PCL812=3Dm
>> CONFIG_COMEDI_PCL816=3Dy
>> # CONFIG_COMEDI_PCL818 is not set
>> # CONFIG_COMEDI_PCM3724 is not set
>> CONFIG_COMEDI_AMPLC_DIO200_ISA=3Dy
>> CONFIG_COMEDI_AMPLC_PC236_ISA=3Dy
>> CONFIG_COMEDI_AMPLC_PC263_ISA=3Dy
>> CONFIG_COMEDI_RTI800=3Dy
>> CONFIG_COMEDI_RTI802=3Dy
>> CONFIG_COMEDI_DAC02=3Dm
>> CONFIG_COMEDI_DAS16M1=3Dy
>> # CONFIG_COMEDI_DAS08_ISA is not set
>> # CONFIG_COMEDI_DAS16 is not set
>> CONFIG_COMEDI_DAS800=3Dy
>> # CONFIG_COMEDI_DAS1800 is not set
>> CONFIG_COMEDI_DAS6402=3Dm
>> # CONFIG_COMEDI_DT2801 is not set
>> # CONFIG_COMEDI_DT2811 is not set
>> # CONFIG_COMEDI_DT2814 is not set
>> # CONFIG_COMEDI_DT2815 is not set
>> # CONFIG_COMEDI_DT2817 is not set
>> CONFIG_COMEDI_DT282X=3Dy
>> # CONFIG_COMEDI_DMM32AT is not set
>> CONFIG_COMEDI_FL512=3Dy
>> CONFIG_COMEDI_AIO_AIO12_8=3Dm
>> CONFIG_COMEDI_AIO_IIRO_16=3Dy
>> CONFIG_COMEDI_II_PCI20KC=3Dm
>> # CONFIG_COMEDI_C6XDIGIO is not set
>> CONFIG_COMEDI_MPC624=3Dm
>> CONFIG_COMEDI_ADQ12B=3Dm
>> CONFIG_COMEDI_NI_AT_A2150=3Dy
>> CONFIG_COMEDI_NI_AT_AO=3Dy
>> CONFIG_COMEDI_NI_ATMIO=3Dm
>> CONFIG_COMEDI_NI_ATMIO16D=3Dy
>> CONFIG_COMEDI_NI_LABPC_ISA=3Dm
>> # CONFIG_COMEDI_PCMAD is not set
>> CONFIG_COMEDI_PCMDA12=3Dm
>> CONFIG_COMEDI_PCMMIO=3Dm
>> CONFIG_COMEDI_PCMUIO=3Dy
>> CONFIG_COMEDI_MULTIQ3=3Dm
>> # CONFIG_COMEDI_S526 is not set
>> CONFIG_COMEDI_PCI_DRIVERS=3Dm
>> CONFIG_COMEDI_8255_PCI=3Dm
>> CONFIG_COMEDI_ADDI_WATCHDOG=3Dm
>> # CONFIG_COMEDI_ADDI_APCI_1032 is not set
>> CONFIG_COMEDI_ADDI_APCI_1500=3Dm
>> # CONFIG_COMEDI_ADDI_APCI_1516 is not set
>> # CONFIG_COMEDI_ADDI_APCI_1564 is not set
>> CONFIG_COMEDI_ADDI_APCI_16XX=3Dm
>> CONFIG_COMEDI_ADDI_APCI_2032=3Dm
>> CONFIG_COMEDI_ADDI_APCI_2200=3Dm
>> # CONFIG_COMEDI_ADDI_APCI_3120 is not set
>> # CONFIG_COMEDI_ADDI_APCI_3501 is not set
>> # CONFIG_COMEDI_ADDI_APCI_3XXX is not set
>> # CONFIG_COMEDI_ADL_PCI6208 is not set
>> # CONFIG_COMEDI_ADL_PCI7X3X is not set
>> CONFIG_COMEDI_ADL_PCI8164=3Dm
>> # CONFIG_COMEDI_ADL_PCI9111 is not set
>> CONFIG_COMEDI_ADL_PCI9118=3Dm
>> # CONFIG_COMEDI_ADV_PCI1710 is not set
>> CONFIG_COMEDI_ADV_PCI1720=3Dm
>> CONFIG_COMEDI_ADV_PCI1723=3Dm
>> CONFIG_COMEDI_ADV_PCI1724=3Dm
>> CONFIG_COMEDI_ADV_PCI1760=3Dm
>> CONFIG_COMEDI_ADV_PCI_DIO=3Dm
>> # CONFIG_COMEDI_AMPLC_DIO200_PCI is not set
>> CONFIG_COMEDI_AMPLC_PC236_PCI=3Dm
>> CONFIG_COMEDI_AMPLC_PC263_PCI=3Dm
>> # CONFIG_COMEDI_AMPLC_PCI224 is not set
>> CONFIG_COMEDI_AMPLC_PCI230=3Dm
>> # CONFIG_COMEDI_CONTEC_PCI_DIO is not set
>> CONFIG_COMEDI_DAS08_PCI=3Dm
>> # CONFIG_COMEDI_DT3000 is not set
>> # CONFIG_COMEDI_DYNA_PCI10XX is not set
>> CONFIG_COMEDI_GSC_HPDI=3Dm
>> CONFIG_COMEDI_MF6X4=3Dm
>> CONFIG_COMEDI_ICP_MULTI=3Dm
>> # CONFIG_COMEDI_DAQBOARD2000 is not set
>> # CONFIG_COMEDI_JR3_PCI is not set
>> CONFIG_COMEDI_KE_COUNTER=3Dm
>> CONFIG_COMEDI_CB_PCIDAS64=3Dm
>> # CONFIG_COMEDI_CB_PCIDAS is not set
>> CONFIG_COMEDI_CB_PCIDDA=3Dm
>> CONFIG_COMEDI_CB_PCIMDAS=3Dm
>> # CONFIG_COMEDI_CB_PCIMDDA is not set
>> # CONFIG_COMEDI_ME4000 is not set
>> # CONFIG_COMEDI_ME_DAQ is not set
>> CONFIG_COMEDI_NI_6527=3Dm
>> CONFIG_COMEDI_NI_65XX=3Dm
>> CONFIG_COMEDI_NI_660X=3Dm
>> # CONFIG_COMEDI_NI_670X is not set
>> # CONFIG_COMEDI_NI_LABPC_PCI is not set
>> CONFIG_COMEDI_NI_PCIDIO=3Dm
>> CONFIG_COMEDI_NI_PCIMIO=3Dm
>> CONFIG_COMEDI_RTD520=3Dm
>> # CONFIG_COMEDI_S626 is not set
>> CONFIG_COMEDI_MITE=3Dm
>> CONFIG_COMEDI_NI_TIOCMD=3Dm
>> CONFIG_COMEDI_8254=3Dy
>> CONFIG_COMEDI_8255=3Dy
>> # CONFIG_COMEDI_8255_SA is not set
>> CONFIG_COMEDI_KCOMEDILIB=3Dm
>> CONFIG_COMEDI_AMPLC_DIO200=3Dy
>> CONFIG_COMEDI_AMPLC_PC236=3Dy
>> CONFIG_COMEDI_DAS08=3Dm
>> CONFIG_COMEDI_NI_LABPC=3Dm
>> CONFIG_COMEDI_NI_TIO=3Dm
>> CONFIG_COMEDI_NI_ROUTING=3Dm
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
>>
>> #
>> # Analog digital bi-direction converters
>> #
>> CONFIG_ADT7316=3Dy
>> # CONFIG_ADT7316_I2C is not set
>>
>> #
>> # Capacitance to digital converters
>> #
>> CONFIG_AD7150=3Dy
>> # CONFIG_AD7746 is not set
>>
>> #
>> # Direct Digital Synthesis
>> #
>>
>> #
>> # Network Analyzer, Impedance Converters
>> #
>> CONFIG_AD5933=3Dy
>>
>> #
>> # Active energy metering IC
>> #
>> CONFIG_ADE7854=3Dm
>> # CONFIG_ADE7854_I2C is not set
>>
>> #
>> # Resolver to digital converters
>> #
>> CONFIG_FB_SM750=3Dm
>>
>> #
>> # Speakup console speech
>> #
>> # CONFIG_STAGING_MEDIA is not set
>>
>> #
>> # Android
>> #
>> # CONFIG_FIREWIRE_SERIAL is not set
>> CONFIG_GS_FPGABOOT=3Dy
>> # CONFIG_UNISYSSPAR is not set
>> CONFIG_MOST=3Dm
>> CONFIG_MOST_CDEV=3Dm
>> # CONFIG_MOST_NET is not set
>> # CONFIG_MOST_VIDEO is not set
>> CONFIG_MOST_I2C=3Dm
>> # CONFIG_GREYBUS is not set
>> CONFIG_DRM_VBOXVIDEO=3Dm
>>
>> #
>> # Gasket devices
>> #
>> CONFIG_STAGING_GASKET_FRAMEWORK=3Dy
>> CONFIG_STAGING_APEX_DRIVER=3Dm
>> CONFIG_XIL_AXIS_FIFO=3Dm
>> CONFIG_EROFS_FS=3Dm
>> CONFIG_EROFS_FS_DEBUG=3Dy
>> CONFIG_EROFS_FS_XATTR=3Dy
>> CONFIG_EROFS_FS_POSIX_ACL=3Dy
>> CONFIG_EROFS_FS_SECURITY=3Dy
>> # CONFIG_EROFS_FS_USE_VM_MAP_RAM is not set
>> # CONFIG_EROFS_FAULT_INJECTION is not set
>> CONFIG_EROFS_FS_IO_MAX_RETRIES=3D5
>> CONFIG_EROFS_FS_ZIP=3Dy
>> CONFIG_EROFS_FS_CLUSTER_PAGE_LIMIT=3D1
>> CONFIG_EROFS_FS_ZIP_NO_CACHE=3Dy
>> # CONFIG_EROFS_FS_ZIP_CACHE_UNIPOLAR is not set
>> # CONFIG_EROFS_FS_ZIP_CACHE_BIPOLAR is not set
>> CONFIG_X86_PLATFORM_DEVICES=3Dy
>> # CONFIG_ACER_WIRELESS is not set
>> # CONFIG_ACERHDF is not set
>> # CONFIG_ASUS_LAPTOP is not set
>> CONFIG_DCDBAS=3Dy
>> # CONFIG_DELL_SMBIOS is not set
>> # CONFIG_DELL_SMO8800 is not set
>> # CONFIG_DELL_RBU is not set
>> # CONFIG_FUJITSU_LAPTOP is not set
>> # CONFIG_FUJITSU_TABLET is not set
>> # CONFIG_GPD_POCKET_FAN is not set
>> # CONFIG_HP_ACCEL is not set
>> # CONFIG_HP_WIRELESS is not set
>> # CONFIG_PANASONIC_LAPTOP is not set
>> # CONFIG_THINKPAD_ACPI is not set
>> CONFIG_SENSORS_HDAPS=3Dm
>> # CONFIG_INTEL_MENLOW is not set
>> # CONFIG_EEEPC_LAPTOP is not set
>> # CONFIG_ASUS_WIRELESS is not set
>> # CONFIG_ACPI_WMI is not set
>> # CONFIG_TOPSTAR_LAPTOP is not set
>> # CONFIG_TOSHIBA_BT_RFKILL is not set
>> # CONFIG_TOSHIBA_HAPS is not set
>> # CONFIG_ACPI_CMPC is not set
>> # CONFIG_INTEL_INT0002_VGPIO is not set
>> # CONFIG_INTEL_HID_EVENT is not set
>> # CONFIG_INTEL_VBTN is not set
>> # CONFIG_INTEL_IPS is not set
>> CONFIG_INTEL_PMC_CORE=3Dy
>> # CONFIG_IBM_RTL is not set
>> CONFIG_SAMSUNG_LAPTOP=3Dm
>> # CONFIG_SAMSUNG_Q10 is not set
>> # CONFIG_APPLE_GMUX is not set
>> # CONFIG_INTEL_RST is not set
>> # CONFIG_INTEL_SMARTCONNECT is not set
>> # CONFIG_INTEL_PMC_IPC is not set
>> # CONFIG_SURFACE_PRO3_BUTTON is not set
>> # CONFIG_INTEL_PUNIT_IPC is not set
>> CONFIG_MLX_PLATFORM=3Dm
>> # CONFIG_I2C_MULTI_INSTANTIATE is not set
>> CONFIG_INTEL_ATOMISP2_PM=3Dy
>> # CONFIG_PCENGINES_APU2 is not set
>> CONFIG_PMC_ATOM=3Dy
>> CONFIG_CHROME_PLATFORMS=3Dy
>> CONFIG_CHROMEOS_PSTORE=3Dy
>> # CONFIG_CHROMEOS_TBMC is not set
>> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
>> CONFIG_MELLANOX_PLATFORM=3Dy
>> CONFIG_MLXREG_HOTPLUG=3Dm
>> CONFIG_MLXREG_IO=3Dm
>> CONFIG_CLKDEV_LOOKUP=3Dy
>> CONFIG_HAVE_CLK_PREPARE=3Dy
>> CONFIG_COMMON_CLK=3Dy
>>
>> #
>> # Common Clock Framework
>> #
>> # CONFIG_COMMON_CLK_WM831X is not set
>> CONFIG_COMMON_CLK_MAX9485=3Dm
>> CONFIG_COMMON_CLK_SI5351=3Dy
>> CONFIG_COMMON_CLK_SI544=3Dm
>> CONFIG_COMMON_CLK_CDCE706=3Dm
>> # CONFIG_COMMON_CLK_CS2000_CP is not set
>> CONFIG_COMMON_CLK_PALMAS=3Dm
>> CONFIG_HWSPINLOCK=3Dy
>>
>> #
>> # Clock Source drivers
>> #
>> CONFIG_CLKEVT_I8253=3Dy
>> CONFIG_CLKBLD_I8253=3Dy
>> CONFIG_MAILBOX=3Dy
>> # CONFIG_PCC is not set
>> # CONFIG_ALTERA_MBOX is not set
>> CONFIG_IOMMU_SUPPORT=3Dy
>>
>> #
>> # Generic IOMMU Pagetable Support
>> #
>> # CONFIG_IOMMU_DEBUGFS is not set
>> # CONFIG_AMD_IOMMU is not set
>>
>> #
>> # Remoteproc drivers
>> #
>> CONFIG_REMOTEPROC=3Dy
>>
>> #
>> # Rpmsg drivers
>> #
>> CONFIG_RPMSG=3Dy
>> # CONFIG_RPMSG_CHAR is not set
>> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
>> CONFIG_RPMSG_VIRTIO=3Dy
>> CONFIG_SOUNDWIRE=3Dy
>>
>> #
>> # SoundWire Devices
>> #
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
>> # NXP/Freescale QorIQ SoC drivers
>> #
>>
>> #
>> # i.MX SoC drivers
>> #
>>
>> #
>> # Qualcomm SoC drivers
>> #
>> CONFIG_SOC_TI=3Dy
>>
>> #
>> # Xilinx SoC drivers
>> #
>> CONFIG_XILINX_VCU=3Dm
>> CONFIG_PM_DEVFREQ=3Dy
>>
>> #
>> # DEVFREQ Governors
>> #
>> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
>> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
>> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dm
>> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
>> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
>>
>> #
>> # DEVFREQ Drivers
>> #
>> CONFIG_PM_DEVFREQ_EVENT=3Dy
>> CONFIG_EXTCON=3Dy
>>
>> #
>> # Extcon Device Drivers
>> #
>> CONFIG_EXTCON_ADC_JACK=3Dm
>> CONFIG_EXTCON_GPIO=3Dy
>> # CONFIG_EXTCON_INTEL_INT3496 is not set
>> # CONFIG_EXTCON_MAX3355 is not set
>> # CONFIG_EXTCON_MAX77693 is not set
>> CONFIG_EXTCON_PALMAS=3Dm
>> # CONFIG_EXTCON_PTN5150 is not set
>> # CONFIG_EXTCON_RT8973A is not set
>> # CONFIG_EXTCON_SM5502 is not set
>> CONFIG_EXTCON_USB_GPIO=3Dy
>> # CONFIG_MEMORY is not set
>> CONFIG_IIO=3Dy
>> CONFIG_IIO_BUFFER=3Dy
>> CONFIG_IIO_BUFFER_CB=3Dm
>> # CONFIG_IIO_BUFFER_HW_CONSUMER is not set
>> CONFIG_IIO_KFIFO_BUF=3Dy
>> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>> CONFIG_IIO_CONFIGFS=3Dy
>> CONFIG_IIO_TRIGGER=3Dy
>> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
>> # CONFIG_IIO_SW_DEVICE is not set
>> # CONFIG_IIO_SW_TRIGGER is not set
>>
>> #
>> # Accelerometers
>> #
>> # CONFIG_ADXL372_I2C is not set
>> CONFIG_BMA180=3Dy
>> CONFIG_BMC150_ACCEL=3Dm
>> CONFIG_BMC150_ACCEL_I2C=3Dm
>> # CONFIG_DA280 is not set
>> # CONFIG_DA311 is not set
>> CONFIG_DMARD09=3Dm
>> # CONFIG_DMARD10 is not set
>> CONFIG_HID_SENSOR_ACCEL_3D=3Dm
>> # CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
>> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
>> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
>> # CONFIG_KXSD9 is not set
>> # CONFIG_KXCJK1013 is not set
>> CONFIG_MC3230=3Dy
>> CONFIG_MMA7455=3Dm
>> CONFIG_MMA7455_I2C=3Dm
>> # CONFIG_MMA7660 is not set
>> CONFIG_MMA8452=3Dy
>> CONFIG_MMA9551_CORE=3Dy
>> CONFIG_MMA9551=3Dm
>> CONFIG_MMA9553=3Dy
>> CONFIG_MXC4005=3Dm
>> # CONFIG_MXC6255 is not set
>> # CONFIG_STK8312 is not set
>> CONFIG_STK8BA50=3Dm
>>
>> #
>> # Analog to digital converters
>> #
>> CONFIG_AD7291=3Dy
>> CONFIG_AD7606=3Dm
>> CONFIG_AD7606_IFACE_PARALLEL=3Dm
>> CONFIG_AD799X=3Dm
>> # CONFIG_DA9150_GPADC is not set
>> # CONFIG_HX711 is not set
>> CONFIG_INA2XX_ADC=3Dm
>> CONFIG_LP8788_ADC=3Dy
>> CONFIG_LTC2471=3Dy
>> CONFIG_LTC2485=3Dy
>> # CONFIG_LTC2497 is not set
>> CONFIG_MAX1363=3Dy
>> CONFIG_MAX9611=3Dm
>> CONFIG_MCP3422=3Dm
>> CONFIG_MEN_Z188_ADC=3Dm
>> CONFIG_NAU7802=3Dy
>> # CONFIG_PALMAS_GPADC is not set
>> # CONFIG_QCOM_SPMI_IADC is not set
>> # CONFIG_QCOM_SPMI_VADC is not set
>> # CONFIG_QCOM_SPMI_ADC5 is not set
>> CONFIG_TI_ADC081C=3Dy
>> CONFIG_TI_ADS1015=3Dm
>>
>> #
>> # Analog Front Ends
>> #
>>
>> #
>> # Amplifiers
>> #
>>
>> #
>> # Chemical Sensors
>> #
>> CONFIG_ATLAS_PH_SENSOR=3Dy
>> CONFIG_BME680=3Dy
>> CONFIG_BME680_I2C=3Dy
>> CONFIG_CCS811=3Dm
>> CONFIG_IAQCORE=3Dm
>> # CONFIG_PMS7003 is not set
>> # CONFIG_SPS30 is not set
>> CONFIG_VZ89X=3Dm
>>
>> #
>> # Hid Sensor IIO Common
>> #
>> CONFIG_HID_SENSOR_IIO_COMMON=3Dm
>> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dm
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
>> CONFIG_AD5064=3Dm
>> CONFIG_AD5380=3Dm
>> CONFIG_AD5446=3Dm
>> CONFIG_AD5592R_BASE=3Dy
>> CONFIG_AD5593R=3Dy
>> CONFIG_AD5686=3Dm
>> CONFIG_AD5696_I2C=3Dm
>> CONFIG_CIO_DAC=3Dm
>> CONFIG_DS4424=3Dy
>> CONFIG_M62332=3Dm
>> CONFIG_MAX517=3Dm
>> CONFIG_MCP4725=3Dm
>> # CONFIG_TI_DAC5571 is not set
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
>> CONFIG_BMG160=3Dm
>> CONFIG_BMG160_I2C=3Dm
>> # CONFIG_HID_SENSOR_GYRO_3D is not set
>> # CONFIG_MPU3050_I2C is not set
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
>> # CONFIG_AFE4404 is not set
>> CONFIG_MAX30100=3Dm
>> CONFIG_MAX30102=3Dm
>>
>> #
>> # Humidity sensors
>> #
>> CONFIG_AM2315=3Dm
>> CONFIG_DHT11=3Dm
>> # CONFIG_HDC100X is not set
>> # CONFIG_HID_SENSOR_HUMIDITY is not set
>> # CONFIG_HTS221 is not set
>> CONFIG_HTU21=3Dy
>> CONFIG_SI7005=3Dy
>> CONFIG_SI7020=3Dy
>>
>> #
>> # Inertial measurement units
>> #
>> CONFIG_BMI160=3Dy
>> CONFIG_BMI160_I2C=3Dy
>> CONFIG_KMX61=3Dm
>> CONFIG_INV_MPU6050_IIO=3Dm
>> CONFIG_INV_MPU6050_I2C=3Dm
>> # CONFIG_IIO_ST_LSM6DSX is not set
>>
>> #
>> # Light sensors
>> #
>> # CONFIG_ACPI_ALS is not set
>> CONFIG_ADJD_S311=3Dy
>> CONFIG_AL3320A=3Dm
>> CONFIG_APDS9300=3Dm
>> CONFIG_APDS9960=3Dm
>> # CONFIG_BH1750 is not set
>> CONFIG_BH1780=3Dy
>> CONFIG_CM32181=3Dm
>> CONFIG_CM3232=3Dy
>> CONFIG_CM3323=3Dm
>> # CONFIG_CM36651 is not set
>> CONFIG_GP2AP020A00F=3Dm
>> # CONFIG_SENSORS_ISL29018 is not set
>> CONFIG_SENSORS_ISL29028=3Dm
>> # CONFIG_ISL29125 is not set
>> CONFIG_HID_SENSOR_ALS=3Dm
>> # CONFIG_HID_SENSOR_PROX is not set
>> # CONFIG_JSA1212 is not set
>> CONFIG_RPR0521=3Dy
>> CONFIG_LTR501=3Dy
>> CONFIG_LV0104CS=3Dy
>> CONFIG_MAX44000=3Dm
>> # CONFIG_MAX44009 is not set
>> CONFIG_OPT3001=3Dm
>> # CONFIG_PA12203001 is not set
>> CONFIG_SI1133=3Dy
>> CONFIG_SI1145=3Dy
>> CONFIG_STK3310=3Dm
>> CONFIG_ST_UVIS25=3Dm
>> CONFIG_ST_UVIS25_I2C=3Dm
>> CONFIG_TCS3414=3Dy
>> CONFIG_TCS3472=3Dy
>> # CONFIG_SENSORS_TSL2563 is not set
>> CONFIG_TSL2583=3Dy
>> CONFIG_TSL2772=3Dm
>> CONFIG_TSL4531=3Dm
>> # CONFIG_US5182D is not set
>> CONFIG_VCNL4000=3Dm
>> # CONFIG_VCNL4035 is not set
>> CONFIG_VEML6070=3Dm
>> CONFIG_VL6180=3Dm
>> # CONFIG_ZOPT2201 is not set
>>
>> #
>> # Magnetometer sensors
>> #
>> CONFIG_AK8975=3Dm
>> # CONFIG_AK09911 is not set
>> CONFIG_BMC150_MAGN=3Dm
>> CONFIG_BMC150_MAGN_I2C=3Dm
>> # CONFIG_MAG3110 is not set
>> # CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
>> CONFIG_MMC35240=3Dm
>> # CONFIG_IIO_ST_MAGN_3AXIS is not set
>> CONFIG_SENSORS_HMC5843=3Dy
>> CONFIG_SENSORS_HMC5843_I2C=3Dy
>> # CONFIG_SENSORS_RM3100_I2C is not set
>>
>> #
>> # Multiplexers
>> #
>>
>> #
>> # Inclinometer sensors
>> #
>> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dm
>> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dm
>>
>> #
>> # Triggers - standalone
>> #
>> CONFIG_IIO_INTERRUPT_TRIGGER=3Dm
>> # CONFIG_IIO_SYSFS_TRIGGER is not set
>>
>> #
>> # Digital potentiometers
>> #
>> # CONFIG_AD5272 is not set
>> # CONFIG_DS1803 is not set
>> # CONFIG_MCP4018 is not set
>> # CONFIG_MCP4531 is not set
>> CONFIG_TPL0102=3Dm
>>
>> #
>> # Digital potentiostats
>> #
>> # CONFIG_LMP91000 is not set
>>
>> #
>> # Pressure sensors
>> #
>> CONFIG_ABP060MG=3Dm
>> CONFIG_BMP280=3Dy
>> CONFIG_BMP280_I2C=3Dy
>> CONFIG_HID_SENSOR_PRESS=3Dm
>> CONFIG_HP03=3Dy
>> # CONFIG_MPL115_I2C is not set
>> # CONFIG_MPL3115 is not set
>> # CONFIG_MS5611 is not set
>> # CONFIG_MS5637 is not set
>> CONFIG_IIO_ST_PRESS=3Dm
>> CONFIG_IIO_ST_PRESS_I2C=3Dm
>> CONFIG_T5403=3Dm
>> # CONFIG_HP206C is not set
>> CONFIG_ZPA2326=3Dm
>> CONFIG_ZPA2326_I2C=3Dm
>>
>> #
>> # Lightning sensors
>> #
>>
>> #
>> # Proximity and distance sensors
>> #
>> CONFIG_ISL29501=3Dm
>> CONFIG_LIDAR_LITE_V2=3Dm
>> CONFIG_RFD77402=3Dm
>> # CONFIG_SRF04 is not set
>> CONFIG_SX9500=3Dy
>> CONFIG_SRF08=3Dm
>> # CONFIG_VL53L0X_I2C is not set
>>
>> #
>> # Resolver to digital converters
>> #
>>
>> #
>> # Temperature sensors
>> #
>> CONFIG_HID_SENSOR_TEMP=3Dm
>> CONFIG_MLX90614=3Dy
>> CONFIG_MLX90632=3Dy
>> CONFIG_TMP006=3Dm
>> CONFIG_TMP007=3Dy
>> CONFIG_TSYS01=3Dy
>> CONFIG_TSYS02D=3Dm
>> CONFIG_NTB=3Dy
>> # CONFIG_NTB_AMD is not set
>> # CONFIG_NTB_IDT is not set
>> CONFIG_NTB_INTEL=3Dy
>> CONFIG_NTB_SWITCHTEC=3Dy
>> CONFIG_NTB_PINGPONG=3Dm
>> CONFIG_NTB_TOOL=3Dy
>> CONFIG_NTB_PERF=3Dy
>> CONFIG_NTB_TRANSPORT=3Dy
>> CONFIG_VME_BUS=3Dy
>>
>> #
>> # VME Bridge Drivers
>> #
>> CONFIG_VME_CA91CX42=3Dy
>> CONFIG_VME_TSI148=3Dy
>> # CONFIG_VME_FAKE is not set
>>
>> #
>> # VME Board Drivers
>> #
>> CONFIG_VMIVME_7805=3Dm
>>
>> #
>> # VME Device Drivers
>> #
>> CONFIG_VME_USER=3Dy
>> # CONFIG_PWM is not set
>>
>> #
>> # IRQ chip support
>> #
>> CONFIG_ARM_GIC_MAX_NR=3D1
>> CONFIG_MADERA_IRQ=3Dm
>> CONFIG_IPACK_BUS=3Dy
>> CONFIG_BOARD_TPCI200=3Dm
>> # CONFIG_SERIAL_IPOCTAL is not set
>> CONFIG_RESET_CONTROLLER=3Dy
>> # CONFIG_RESET_TI_SYSCON is not set
>> CONFIG_FMC=3Dm
>> # CONFIG_FMC_FAKEDEV is not set
>> CONFIG_FMC_TRIVIAL=3Dm
>> CONFIG_FMC_WRITE_EEPROM=3Dm
>> # CONFIG_FMC_CHARDEV is not set
>>
>> #
>> # PHY Subsystem
>> #
>> CONFIG_GENERIC_PHY=3Dy
>> # CONFIG_BCM_KONA_USB2_PHY is not set
>> CONFIG_PHY_PXA_28NM_HSIC=3Dm
>> # CONFIG_PHY_PXA_28NM_USB2 is not set
>> # CONFIG_PHY_CPCAP_USB is not set
>> CONFIG_POWERCAP=3Dy
>> CONFIG_INTEL_RAPL=3Dm
>> # CONFIG_IDLE_INJECT is not set
>> CONFIG_MCB=3Dy
>> CONFIG_MCB_PCI=3Dm
>> CONFIG_MCB_LPC=3Dy
>>
>> #
>> # Performance monitor support
>> #
>> CONFIG_RAS=3Dy
>> # CONFIG_RAS_CEC is not set
>> CONFIG_THUNDERBOLT=3Dy
>>
>> #
>> # Android
>> #
>> # CONFIG_ANDROID is not set
>> # CONFIG_LIBNVDIMM is not set
>> CONFIG_DAX=3Dm
>> CONFIG_DEV_DAX=3Dm
>> CONFIG_DEV_DAX_KMEM=3Dm
>> CONFIG_NVMEM=3Dy
>> CONFIG_RAVE_SP_EEPROM=3Dm
>>
>> #
>> # HW tracing support
>> #
>> CONFIG_STM=3Dy
>> # CONFIG_STM_PROTO_BASIC is not set
>> # CONFIG_STM_PROTO_SYS_T is not set
>> CONFIG_STM_DUMMY=3Dm
>> CONFIG_STM_SOURCE_CONSOLE=3Dm
>> # CONFIG_STM_SOURCE_HEARTBEAT is not set
>> CONFIG_INTEL_TH=3Dy
>> # CONFIG_INTEL_TH_PCI is not set
>> # CONFIG_INTEL_TH_ACPI is not set
>> CONFIG_INTEL_TH_GTH=3Dy
>> CONFIG_INTEL_TH_STH=3Dy
>> CONFIG_INTEL_TH_MSU=3Dm
>> CONFIG_INTEL_TH_PTI=3Dm
>> # CONFIG_INTEL_TH_DEBUG is not set
>> CONFIG_FPGA=3Dy
>> CONFIG_ALTERA_PR_IP_CORE=3Dm
>> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
>> CONFIG_FPGA_BRIDGE=3Dy
>> # CONFIG_ALTERA_FREEZE_BRIDGE is not set
>> CONFIG_XILINX_PR_DECOUPLER=3Dy
>> CONFIG_FPGA_REGION=3Dm
>> CONFIG_FPGA_DFL=3Dm
>> CONFIG_FPGA_DFL_FME=3Dm
>> # CONFIG_FPGA_DFL_FME_MGR is not set
>> CONFIG_FPGA_DFL_FME_BRIDGE=3Dm
>> CONFIG_FPGA_DFL_FME_REGION=3Dm
>> # CONFIG_FPGA_DFL_AFU is not set
>> CONFIG_FPGA_DFL_PCI=3Dm
>> CONFIG_PM_OPP=3Dy
>> # CONFIG_UNISYS_VISORBUS is not set
>> CONFIG_SIOX=3Dy
>> CONFIG_SIOX_BUS_GPIO=3Dm
>> # CONFIG_SLIMBUS is not set
>> # CONFIG_INTERCONNECT is not set
>>
>> #
>> # File systems
>> #
>> CONFIG_DCACHE_WORD_ACCESS=3Dy
>> CONFIG_VALIDATE_FS_PARSER=3Dy
>> CONFIG_FS_IOMAP=3Dy
>> # CONFIG_EXT2_FS is not set
>> CONFIG_EXT3_FS=3Dy
>> # CONFIG_EXT3_FS_POSIX_ACL is not set
>> CONFIG_EXT3_FS_SECURITY=3Dy
>> CONFIG_EXT4_FS=3Dy
>> CONFIG_EXT4_USE_FOR_EXT2=3Dy
>> # CONFIG_EXT4_FS_POSIX_ACL is not set
>> CONFIG_EXT4_FS_SECURITY=3Dy
>> # CONFIG_EXT4_DEBUG is not set
>> CONFIG_JBD2=3Dy
>> CONFIG_JBD2_DEBUG=3Dy
>> CONFIG_FS_MBCACHE=3Dy
>> # CONFIG_REISERFS_FS is not set
>> # CONFIG_JFS_FS is not set
>> CONFIG_XFS_FS=3Dm
>> CONFIG_XFS_QUOTA=3Dy
>> CONFIG_XFS_POSIX_ACL=3Dy
>> CONFIG_XFS_RT=3Dy
>> # CONFIG_XFS_ONLINE_SCRUB is not set
>> CONFIG_XFS_WARN=3Dy
>> # CONFIG_XFS_DEBUG is not set
>> CONFIG_GFS2_FS=3Dm
>> # CONFIG_OCFS2_FS is not set
>> CONFIG_BTRFS_FS=3Dy
>> # CONFIG_BTRFS_FS_POSIX_ACL is not set
>> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
>> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
>> # CONFIG_BTRFS_DEBUG is not set
>> # CONFIG_BTRFS_ASSERT is not set
>> CONFIG_BTRFS_FS_REF_VERIFY=3Dy
>> CONFIG_NILFS2_FS=3Dy
>> CONFIG_F2FS_FS=3Dy
>> # CONFIG_F2FS_STAT_FS is not set
>> CONFIG_F2FS_FS_XATTR=3Dy
>> # CONFIG_F2FS_FS_POSIX_ACL is not set
>> CONFIG_F2FS_FS_SECURITY=3Dy
>> CONFIG_F2FS_CHECK_FS=3Dy
>> # CONFIG_F2FS_FAULT_INJECTION is not set
>> # CONFIG_FS_DAX is not set
>> CONFIG_FS_POSIX_ACL=3Dy
>> CONFIG_EXPORTFS=3Dy
>> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
>> CONFIG_FILE_LOCKING=3Dy
>> CONFIG_MANDATORY_FILE_LOCKING=3Dy
>> CONFIG_FS_ENCRYPTION=3Dy
>> CONFIG_FSNOTIFY=3Dy
>> CONFIG_DNOTIFY=3Dy
>> CONFIG_INOTIFY_USER=3Dy
>> # CONFIG_FANOTIFY is not set
>> # CONFIG_QUOTA is not set
>> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
>> CONFIG_QUOTACTL=3Dy
>> CONFIG_AUTOFS4_FS=3Dm
>> CONFIG_AUTOFS_FS=3Dm
>> # CONFIG_FUSE_FS is not set
>> CONFIG_OVERLAY_FS=3Dy
>> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
>> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
>> # CONFIG_OVERLAY_FS_INDEX is not set
>> CONFIG_OVERLAY_FS_XINO_AUTO=3Dy
>> # CONFIG_OVERLAY_FS_METACOPY is not set
>>
>> #
>> # Caches
>> #
>> CONFIG_FSCACHE=3Dy
>> # CONFIG_FSCACHE_STATS is not set
>> # CONFIG_FSCACHE_HISTOGRAM is not set
>> # CONFIG_FSCACHE_DEBUG is not set
>> # CONFIG_FSCACHE_OBJECT_LIST is not set
>> CONFIG_CACHEFILES=3Dy
>> # CONFIG_CACHEFILES_DEBUG is not set
>> # CONFIG_CACHEFILES_HISTOGRAM is not set
>>
>> #
>> # CD-ROM/DVD Filesystems
>> #
>> CONFIG_ISO9660_FS=3Dm
>> CONFIG_JOLIET=3Dy
>> # CONFIG_ZISOFS is not set
>> CONFIG_UDF_FS=3Dm
>>
>> #
>> # DOS/FAT/NT Filesystems
>> #
>> CONFIG_FAT_FS=3Dm
>> CONFIG_MSDOS_FS=3Dm
>> # CONFIG_VFAT_FS is not set
>> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
>> # CONFIG_NTFS_FS is not set
>>
>> #
>> # Pseudo filesystems
>> #
>> CONFIG_PROC_FS=3Dy
>> # CONFIG_PROC_KCORE is not set
>> CONFIG_PROC_VMCORE=3Dy
>> # CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
>> CONFIG_PROC_SYSCTL=3Dy
>> CONFIG_PROC_PAGE_MONITOR=3Dy
>> CONFIG_PROC_CHILDREN=3Dy
>> CONFIG_KERNFS=3Dy
>> CONFIG_SYSFS=3Dy
>> CONFIG_TMPFS=3Dy
>> CONFIG_TMPFS_POSIX_ACL=3Dy
>> CONFIG_TMPFS_XATTR=3Dy
>> # CONFIG_HUGETLBFS is not set
>> CONFIG_MEMFD_CREATE=3Dy
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
>> CONFIG_CONFIGFS_FS=3Dy
>> # CONFIG_MISC_FILESYSTEMS is not set
>> CONFIG_NETWORK_FILESYSTEMS=3Dy
>> CONFIG_NFS_FS=3Dy
>> CONFIG_NFS_V2=3Dy
>> CONFIG_NFS_V3=3Dy
>> # CONFIG_NFS_V3_ACL is not set
>> CONFIG_NFS_V4=3Dm
>> # CONFIG_NFS_SWAP is not set
>> # CONFIG_NFS_V4_1 is not set
>> # CONFIG_ROOT_NFS is not set
>> # CONFIG_NFS_FSCACHE is not set
>> # CONFIG_NFS_USE_LEGACY_DNS is not set
>> CONFIG_NFS_USE_KERNEL_DNS=3Dy
>> # CONFIG_NFSD is not set
>> CONFIG_GRACE_PERIOD=3Dy
>> CONFIG_LOCKD=3Dy
>> CONFIG_LOCKD_V4=3Dy
>> CONFIG_NFS_COMMON=3Dy
>> CONFIG_SUNRPC=3Dy
>> CONFIG_SUNRPC_GSS=3Dy
>> CONFIG_RPCSEC_GSS_KRB5=3Dy
>> # CONFIG_CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
>> # CONFIG_SUNRPC_DEBUG is not set
>> # CONFIG_CEPH_FS is not set
>> CONFIG_CIFS=3Dm
>> # CONFIG_CIFS_STATS2 is not set
>> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
>> # CONFIG_CIFS_WEAK_PW_HASH is not set
>> # CONFIG_CIFS_UPCALL is not set
>> # CONFIG_CIFS_XATTR is not set
>> CONFIG_CIFS_DEBUG=3Dy
>> # CONFIG_CIFS_DEBUG2 is not set
>> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
>> # CONFIG_CIFS_DFS_UPCALL is not set
>> # CONFIG_CIFS_FSCACHE is not set
>> # CONFIG_CODA_FS is not set
>> # CONFIG_AFS_FS is not set
>> # CONFIG_9P_FS is not set
>> CONFIG_NLS=3Dy
>> CONFIG_NLS_DEFAULT=3D"iso8859-1"
>> # CONFIG_NLS_CODEPAGE_437 is not set
>> CONFIG_NLS_CODEPAGE_737=3Dm
>> # CONFIG_NLS_CODEPAGE_775 is not set
>> CONFIG_NLS_CODEPAGE_850=3Dm
>> # CONFIG_NLS_CODEPAGE_852 is not set
>> CONFIG_NLS_CODEPAGE_855=3Dy
>> CONFIG_NLS_CODEPAGE_857=3Dm
>> CONFIG_NLS_CODEPAGE_860=3Dy
>> CONFIG_NLS_CODEPAGE_861=3Dm
>> CONFIG_NLS_CODEPAGE_862=3Dy
>> # CONFIG_NLS_CODEPAGE_863 is not set
>> # CONFIG_NLS_CODEPAGE_864 is not set
>> # CONFIG_NLS_CODEPAGE_865 is not set
>> # CONFIG_NLS_CODEPAGE_866 is not set
>> CONFIG_NLS_CODEPAGE_869=3Dm
>> # CONFIG_NLS_CODEPAGE_936 is not set
>> CONFIG_NLS_CODEPAGE_950=3Dy
>> CONFIG_NLS_CODEPAGE_932=3Dm
>> CONFIG_NLS_CODEPAGE_949=3Dy
>> CONFIG_NLS_CODEPAGE_874=3Dm
>> CONFIG_NLS_ISO8859_8=3Dm
>> # CONFIG_NLS_CODEPAGE_1250 is not set
>> CONFIG_NLS_CODEPAGE_1251=3Dm
>> CONFIG_NLS_ASCII=3Dy
>> CONFIG_NLS_ISO8859_1=3Dy
>> CONFIG_NLS_ISO8859_2=3Dm
>> CONFIG_NLS_ISO8859_3=3Dy
>> # CONFIG_NLS_ISO8859_4 is not set
>> CONFIG_NLS_ISO8859_5=3Dm
>> # CONFIG_NLS_ISO8859_6 is not set
>> # CONFIG_NLS_ISO8859_7 is not set
>> # CONFIG_NLS_ISO8859_9 is not set
>> CONFIG_NLS_ISO8859_13=3Dm
>> # CONFIG_NLS_ISO8859_14 is not set
>> CONFIG_NLS_ISO8859_15=3Dm
>> # CONFIG_NLS_KOI8_R is not set
>> CONFIG_NLS_KOI8_U=3Dy
>> # CONFIG_NLS_MAC_ROMAN is not set
>> # CONFIG_NLS_MAC_CELTIC is not set
>> CONFIG_NLS_MAC_CENTEURO=3Dm
>> CONFIG_NLS_MAC_CROATIAN=3Dy
>> # CONFIG_NLS_MAC_CYRILLIC is not set
>> # CONFIG_NLS_MAC_GAELIC is not set
>> # CONFIG_NLS_MAC_GREEK is not set
>> CONFIG_NLS_MAC_ICELAND=3Dy
>> CONFIG_NLS_MAC_INUIT=3Dm
>> CONFIG_NLS_MAC_ROMANIAN=3Dy
>> CONFIG_NLS_MAC_TURKISH=3Dm
>> CONFIG_NLS_UTF8=3Dm
>> # CONFIG_DLM is not set
>>
>> #
>> # Security options
>> #
>> CONFIG_KEYS=3Dy
>> # CONFIG_PERSISTENT_KEYRINGS is not set
>> CONFIG_BIG_KEYS=3Dy
>> CONFIG_TRUSTED_KEYS=3Dm
>> CONFIG_ENCRYPTED_KEYS=3Dy
>> # CONFIG_KEY_DH_OPERATIONS is not set
>> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
>> # CONFIG_SECURITY is not set
>> CONFIG_SECURITYFS=3Dy
>> CONFIG_PAGE_TABLE_ISOLATION=3Dy
>> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
>> # CONFIG_HARDENED_USERCOPY is not set
>> # CONFIG_FORTIFY_SOURCE is not set
>> CONFIG_STATIC_USERMODEHELPER=3Dy
>> CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
>> CONFIG_LSM=3D"yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,appa=
rmor"
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
>> CONFIG_CRYPTO_KPP=3Dy
>> CONFIG_CRYPTO_ACOMP2=3Dy
>> CONFIG_CRYPTO_RSA=3Dy
>> CONFIG_CRYPTO_DH=3Dy
>> CONFIG_CRYPTO_ECDH=3Dm
>> CONFIG_CRYPTO_MANAGER=3Dy
>> CONFIG_CRYPTO_MANAGER2=3Dy
>> CONFIG_CRYPTO_USER=3Dy
>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>> CONFIG_CRYPTO_GF128MUL=3Dy
>> CONFIG_CRYPTO_NULL=3Dy
>> CONFIG_CRYPTO_NULL2=3Dy
>> CONFIG_CRYPTO_PCRYPT=3Dm
>> CONFIG_CRYPTO_WORKQUEUE=3Dy
>> CONFIG_CRYPTO_CRYPTD=3Dy
>> CONFIG_CRYPTO_AUTHENC=3Dy
>> # CONFIG_CRYPTO_TEST is not set
>> CONFIG_CRYPTO_SIMD=3Dy
>> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
>> CONFIG_CRYPTO_ENGINE=3Dm
>>
>> #
>> # Authenticated Encryption with Associated Data
>> #
>> CONFIG_CRYPTO_CCM=3Dm
>> CONFIG_CRYPTO_GCM=3Dy
>> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
>> CONFIG_CRYPTO_AEGIS128=3Dm
>> CONFIG_CRYPTO_AEGIS128L=3Dy
>> CONFIG_CRYPTO_AEGIS256=3Dy
>> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
>> CONFIG_CRYPTO_AEGIS128L_AESNI_SSE2=3Dy
>> CONFIG_CRYPTO_AEGIS256_AESNI_SSE2=3Dm
>> # CONFIG_CRYPTO_MORUS640 is not set
>> CONFIG_CRYPTO_MORUS640_GLUE=3Dy
>> CONFIG_CRYPTO_MORUS640_SSE2=3Dy
>> # CONFIG_CRYPTO_MORUS1280 is not set
>> CONFIG_CRYPTO_MORUS1280_GLUE=3Dy
>> CONFIG_CRYPTO_MORUS1280_SSE2=3Dm
>> CONFIG_CRYPTO_MORUS1280_AVX2=3Dy
>> CONFIG_CRYPTO_SEQIV=3Dy
>> # CONFIG_CRYPTO_ECHAINIV is not set
>>
>> #
>> # Block modes
>> #
>> CONFIG_CRYPTO_CBC=3Dy
>> CONFIG_CRYPTO_CFB=3Dm
>> CONFIG_CRYPTO_CTR=3Dy
>> CONFIG_CRYPTO_CTS=3Dy
>> CONFIG_CRYPTO_ECB=3Dy
>> CONFIG_CRYPTO_LRW=3Dy
>> # CONFIG_CRYPTO_OFB is not set
>> CONFIG_CRYPTO_PCBC=3Dm
>> CONFIG_CRYPTO_XTS=3Dy
>> # CONFIG_CRYPTO_KEYWRAP is not set
>> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
>> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
>> # CONFIG_CRYPTO_ADIANTUM is not set
>>
>> #
>> # Hash modes
>> #
>> CONFIG_CRYPTO_CMAC=3Dy
>> CONFIG_CRYPTO_HMAC=3Dy
>> CONFIG_CRYPTO_XCBC=3Dm
>> CONFIG_CRYPTO_VMAC=3Dy
>>
>> #
>> # Digest
>> #
>> CONFIG_CRYPTO_CRC32C=3Dy
>> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
>> CONFIG_CRYPTO_CRC32=3Dy
>> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
>> CONFIG_CRYPTO_CRCT10DIF=3Dy
>> # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
>> CONFIG_CRYPTO_GHASH=3Dy
>> CONFIG_CRYPTO_POLY1305=3Dm
>> # CONFIG_CRYPTO_POLY1305_X86_64 is not set
>> CONFIG_CRYPTO_MD4=3Dm
>> CONFIG_CRYPTO_MD5=3Dy
>> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
>> # CONFIG_CRYPTO_RMD128 is not set
>> CONFIG_CRYPTO_RMD160=3Dy
>> CONFIG_CRYPTO_RMD256=3Dm
>> CONFIG_CRYPTO_RMD320=3Dy
>> CONFIG_CRYPTO_SHA1=3Dy
>> # CONFIG_CRYPTO_SHA1_SSSE3 is not set
>> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
>> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
>> CONFIG_CRYPTO_SHA256=3Dy
>> CONFIG_CRYPTO_SHA512=3Dy
>> CONFIG_CRYPTO_SHA3=3Dm
>> CONFIG_CRYPTO_SM3=3Dm
>> # CONFIG_CRYPTO_STREEBOG is not set
>> CONFIG_CRYPTO_TGR192=3Dm
>> CONFIG_CRYPTO_WP512=3Dm
>> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
>>
>> #
>> # Ciphers
>> #
>> CONFIG_CRYPTO_AES=3Dy
>> # CONFIG_CRYPTO_AES_TI is not set
>> CONFIG_CRYPTO_AES_X86_64=3Dy
>> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
>> CONFIG_CRYPTO_ANUBIS=3Dm
>> CONFIG_CRYPTO_ARC4=3Dy
>> # CONFIG_CRYPTO_BLOWFISH is not set
>> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
>> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
>> # CONFIG_CRYPTO_CAMELLIA is not set
>> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
>> CONFIG_CRYPTO_CAST_COMMON=3Dy
>> CONFIG_CRYPTO_CAST5=3Dy
>> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
>> # CONFIG_CRYPTO_CAST6 is not set
>> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
>> CONFIG_CRYPTO_DES=3Dy
>> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
>> CONFIG_CRYPTO_FCRYPT=3Dm
>> CONFIG_CRYPTO_KHAZAD=3Dm
>> # CONFIG_CRYPTO_SALSA20 is not set
>> CONFIG_CRYPTO_CHACHA20=3Dm
>> CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
>> CONFIG_CRYPTO_SEED=3Dy
>> # CONFIG_CRYPTO_SERPENT is not set
>> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
>> # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
>> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
>> # CONFIG_CRYPTO_SM4 is not set
>> # CONFIG_CRYPTO_TEA is not set
>> CONFIG_CRYPTO_TWOFISH=3Dm
>> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
>> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
>> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
>> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
>>
>> #
>> # Compression
>> #
>> CONFIG_CRYPTO_DEFLATE=3Dm
>> # CONFIG_CRYPTO_LZO is not set
>> CONFIG_CRYPTO_842=3Dm
>> # CONFIG_CRYPTO_LZ4 is not set
>> # CONFIG_CRYPTO_LZ4HC is not set
>> CONFIG_CRYPTO_ZSTD=3Dm
>>
>> #
>> # Random Number Generation
>> #
>> # CONFIG_CRYPTO_ANSI_CPRNG is not set
>> CONFIG_CRYPTO_DRBG_MENU=3Dy
>> CONFIG_CRYPTO_DRBG_HMAC=3Dy
>> # CONFIG_CRYPTO_DRBG_HASH is not set
>> # CONFIG_CRYPTO_DRBG_CTR is not set
>> CONFIG_CRYPTO_DRBG=3Dy
>> CONFIG_CRYPTO_JITTERENTROPY=3Dy
>> CONFIG_CRYPTO_USER_API=3Dm
>> # CONFIG_CRYPTO_USER_API_HASH is not set
>> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
>> CONFIG_CRYPTO_USER_API_RNG=3Dm
>> # CONFIG_CRYPTO_USER_API_AEAD is not set
>> # CONFIG_CRYPTO_STATS is not set
>> CONFIG_CRYPTO_HASH_INFO=3Dy
>> CONFIG_CRYPTO_HW=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
>> # CONFIG_CRYPTO_DEV_CCP is not set
>> CONFIG_CRYPTO_DEV_QAT=3Dy
>> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
>> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
>> CONFIG_CRYPTO_DEV_QAT_C62X=3Dy
>> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
>> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dy
>> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
>> CONFIG_CRYPTO_DEV_VIRTIO=3Dm
>> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
>> # CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE is not set
>> # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
>>
>> #
>> # Certificates for signature checking
>> #
>> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
>> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
>> CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
>> CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
>> CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
>> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
>> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
>>
>> #
>> # Library routines
>> #
>> CONFIG_RAID6_PQ=3Dy
>> CONFIG_RAID6_PQ_BENCHMARK=3Dy
>> CONFIG_BITREVERSE=3Dy
>> CONFIG_RATIONAL=3Dy
>> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>> CONFIG_GENERIC_STRNLEN_USER=3Dy
>> CONFIG_GENERIC_NET_UTILS=3Dy
>> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>> CONFIG_GENERIC_PCI_IOMAP=3Dy
>> CONFIG_GENERIC_IOMAP=3Dy
>> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>> CONFIG_CRC_CCITT=3Dm
>> CONFIG_CRC16=3Dy
>> CONFIG_CRC_T10DIF=3Dy
>> CONFIG_CRC_ITU_T=3Dy
>> CONFIG_CRC32=3Dy
>> CONFIG_CRC32_SELFTEST=3Dm
>> CONFIG_CRC32_SLICEBY8=3Dy
>> # CONFIG_CRC32_SLICEBY4 is not set
>> # CONFIG_CRC32_SARWATE is not set
>> # CONFIG_CRC32_BIT is not set
>> # CONFIG_CRC64 is not set
>> CONFIG_CRC4=3Dy
>> CONFIG_CRC7=3Dm
>> CONFIG_LIBCRC32C=3Dy
>> # CONFIG_CRC8 is not set
>> CONFIG_XXHASH=3Dy
>> # CONFIG_RANDOM32_SELFTEST is not set
>> CONFIG_842_COMPRESS=3Dm
>> CONFIG_842_DECOMPRESS=3Dm
>> CONFIG_ZLIB_INFLATE=3Dy
>> CONFIG_ZLIB_DEFLATE=3Dy
>> CONFIG_LZO_COMPRESS=3Dy
>> CONFIG_LZO_DECOMPRESS=3Dy
>> CONFIG_LZ4_DECOMPRESS=3Dm
>> CONFIG_ZSTD_COMPRESS=3Dy
>> CONFIG_ZSTD_DECOMPRESS=3Dy
>> CONFIG_XZ_DEC=3Dy
>> CONFIG_XZ_DEC_X86=3Dy
>> CONFIG_XZ_DEC_POWERPC=3Dy
>> CONFIG_XZ_DEC_IA64=3Dy
>> CONFIG_XZ_DEC_ARM=3Dy
>> CONFIG_XZ_DEC_ARMTHUMB=3Dy
>> # CONFIG_XZ_DEC_SPARC is not set
>> CONFIG_XZ_DEC_BCJ=3Dy
>> CONFIG_XZ_DEC_TEST=3Dm
>> CONFIG_DECOMPRESS_GZIP=3Dy
>> CONFIG_DECOMPRESS_BZIP2=3Dy
>> CONFIG_DECOMPRESS_XZ=3Dy
>> CONFIG_DECOMPRESS_LZO=3Dy
>> CONFIG_GENERIC_ALLOCATOR=3Dy
>> CONFIG_INTERVAL_TREE=3Dy
>> CONFIG_XARRAY_MULTI=3Dy
>> CONFIG_ASSOCIATIVE_ARRAY=3Dy
>> CONFIG_HAS_IOMEM=3Dy
>> CONFIG_HAS_IOPORT_MAP=3Dy
>> CONFIG_HAS_DMA=3Dy
>> CONFIG_NEED_SG_DMA_LENGTH=3Dy
>> CONFIG_NEED_DMA_MAP_STATE=3Dy
>> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
>> CONFIG_SWIOTLB=3Dy
>> # CONFIG_DMA_API_DEBUG is not set
>> CONFIG_SGL_ALLOC=3Dy
>> CONFIG_IOMMU_HELPER=3Dy
>> CONFIG_CHECK_SIGNATURE=3Dy
>> CONFIG_CPUMASK_OFFSTACK=3Dy
>> CONFIG_CPU_RMAP=3Dy
>> CONFIG_DQL=3Dy
>> CONFIG_NLATTR=3Dy
>> CONFIG_CLZ_TAB=3Dy
>> # CONFIG_CORDIC is not set
>> # CONFIG_DDR is not set
>> CONFIG_IRQ_POLL=3Dy
>> CONFIG_MPILIB=3Dy
>> CONFIG_OID_REGISTRY=3Dy
>> CONFIG_FONT_SUPPORT=3Dy
>> CONFIG_FONT_8x16=3Dy
>> CONFIG_FONT_AUTOSELECT=3Dy
>> CONFIG_SG_POOL=3Dy
>> CONFIG_ARCH_HAS_PMEM_API=3Dy
>> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
>> CONFIG_ARCH_HAS_UACCESS_MCSAFE=3Dy
>> CONFIG_STACKDEPOT=3Dy
>> CONFIG_SBITMAP=3Dy
>> # CONFIG_STRING_SELFTEST is not set
>>
>> #
>> # Kernel hacking
>> #
>>
>> #
>> # printk and dmesg options
>> #
>> CONFIG_PRINTK_TIME=3Dy
>> # CONFIG_PRINTK_CALLER is not set
>> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
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
>> CONFIG_ENABLE_MUST_CHECK=3Dy
>> CONFIG_FRAME_WARN=3D2048
>> # CONFIG_STRIP_ASM_SYMS is not set
>> # CONFIG_READABLE_ASM is not set
>> # CONFIG_UNUSED_SYMBOLS is not set
>> CONFIG_DEBUG_FS=3Dy
>> CONFIG_HEADERS_CHECK=3Dy
>> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
>> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> CONFIG_FRAME_POINTER=3Dy
>> CONFIG_STACK_VALIDATION=3Dy
>> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>> CONFIG_MAGIC_SYSRQ=3Dy
>> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
>> CONFIG_DEBUG_KERNEL=3Dy
>>
>> #
>> # Memory Debugging
>> #
>> CONFIG_PAGE_EXTENSION=3Dy
>> # CONFIG_DEBUG_PAGEALLOC is not set
>> CONFIG_PAGE_OWNER=3Dy
>> CONFIG_PAGE_POISONING=3Dy
>> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
>> CONFIG_PAGE_POISONING_ZERO=3Dy
>> # CONFIG_DEBUG_RODATA_TEST is not set
>> CONFIG_DEBUG_OBJECTS=3Dy
>> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
>> # CONFIG_DEBUG_OBJECTS_FREE is not set
>> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
>> CONFIG_DEBUG_OBJECTS_WORK=3Dy
>> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
>> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
>> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
>> CONFIG_DEBUG_SLAB=3Dy
>> # CONFIG_DEBUG_SLAB_LEAK is not set
>> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>> # CONFIG_DEBUG_KMEMLEAK is not set
>> CONFIG_DEBUG_STACK_USAGE=3Dy
>> # CONFIG_DEBUG_VM is not set
>> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
>> CONFIG_DEBUG_VIRTUAL=3Dy
>> CONFIG_DEBUG_MEMORY_INIT=3Dy
>> CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dy
>> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
>> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
>> CONFIG_DEBUG_STACKOVERFLOW=3Dy
>> CONFIG_HAVE_ARCH_KASAN=3Dy
>> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
>> CONFIG_KASAN_STACK=3D1
>> CONFIG_ARCH_HAS_KCOV=3Dy
>> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
>> CONFIG_KCOV=3Dy
>> CONFIG_KCOV_INSTRUMENT_ALL=3Dy
>> # CONFIG_DEBUG_SHIRQ is not set
>>
>> #
>> # Debug Lockups and Hangs
>> #
>> CONFIG_LOCKUP_DETECTOR=3Dy
>> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
>> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
>> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
>> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
>> CONFIG_HARDLOCKUP_DETECTOR=3Dy
>> # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
>> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
>> # CONFIG_DETECT_HUNG_TASK is not set
>> # CONFIG_WQ_WATCHDOG is not set
>> CONFIG_PANIC_ON_OOPS=3Dy
>> CONFIG_PANIC_ON_OOPS_VALUE=3D1
>> CONFIG_PANIC_TIMEOUT=3D0
>> CONFIG_SCHED_DEBUG=3Dy
>> # CONFIG_SCHEDSTATS is not set
>> CONFIG_SCHED_STACK_END_CHECK=3Dy
>> # CONFIG_DEBUG_TIMEKEEPING is not set
>>
>> #
>> # Lock Debugging (spinlocks, mutexes, etc...)
>> #
>> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
>> # CONFIG_PROVE_LOCKING is not set
>> # CONFIG_LOCK_STAT is not set
>> CONFIG_DEBUG_RT_MUTEXES=3Dy
>> CONFIG_DEBUG_SPINLOCK=3Dy
>> CONFIG_DEBUG_MUTEXES=3Dy
>> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
>> # CONFIG_DEBUG_RWSEMS is not set
>> CONFIG_DEBUG_LOCK_ALLOC=3Dy
>> CONFIG_LOCKDEP=3Dy
>> # CONFIG_DEBUG_LOCKDEP is not set
>> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
>> CONFIG_LOCK_TORTURE_TEST=3Dm
>> CONFIG_WW_MUTEX_SELFTEST=3Dy
>> CONFIG_STACKTRACE=3Dy
>> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
>> # CONFIG_DEBUG_KOBJECT is not set
>> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
>> CONFIG_DEBUG_BUGVERBOSE=3Dy
>> CONFIG_DEBUG_LIST=3Dy
>> # CONFIG_DEBUG_PI_LIST is not set
>> CONFIG_DEBUG_SG=3Dy
>> CONFIG_DEBUG_NOTIFIERS=3Dy
>> CONFIG_DEBUG_CREDENTIALS=3Dy
>>
>> #
>> # RCU Debugging
>> #
>> CONFIG_TORTURE_TEST=3Dm
>> CONFIG_RCU_PERF_TEST=3Dm
>> CONFIG_RCU_TORTURE_TEST=3Dm
>> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
>> # CONFIG_RCU_TRACE is not set
>> # CONFIG_RCU_EQS_DEBUG is not set
>> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
>> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
>> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
>> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm
>> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
>> # CONFIG_FAULT_INJECTION is not set
>> # CONFIG_LATENCYTOP is not set
>> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>> CONFIG_HAVE_FENTRY=3Dy
>> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>> CONFIG_TRACING_SUPPORT=3Dy
>> # CONFIG_FTRACE is not set
>> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
>> CONFIG_RUNTIME_TESTING_MENU=3Dy
>> # CONFIG_LKDTM is not set
>> # CONFIG_TEST_LIST_SORT is not set
>> # CONFIG_TEST_SORT is not set
>> # CONFIG_BACKTRACE_SELF_TEST is not set
>> # CONFIG_RBTREE_TEST is not set
>> # CONFIG_INTERVAL_TREE_TEST is not set
>> # CONFIG_PERCPU_TEST is not set
>> CONFIG_ATOMIC64_SELFTEST=3Dm
>> # CONFIG_TEST_HEXDUMP is not set
>> # CONFIG_TEST_STRING_HELPERS is not set
>> # CONFIG_TEST_KSTRTOX is not set
>> CONFIG_TEST_PRINTF=3Dm
>> CONFIG_TEST_BITMAP=3Dy
>> # CONFIG_TEST_BITFIELD is not set
>> # CONFIG_TEST_UUID is not set
>> # CONFIG_TEST_XARRAY is not set
>> # CONFIG_TEST_OVERFLOW is not set
>> # CONFIG_TEST_RHASHTABLE is not set
>> # CONFIG_TEST_HASH is not set
>> # CONFIG_TEST_IDA is not set
>> # CONFIG_TEST_LKM is not set
>> # CONFIG_TEST_VMALLOC is not set
>> CONFIG_TEST_USER_COPY=3Dm
>> # CONFIG_TEST_BPF is not set
>> # CONFIG_FIND_BIT_BENCHMARK is not set
>> CONFIG_TEST_FIRMWARE=3Dy
>> # CONFIG_TEST_SYSCTL is not set
>> # CONFIG_TEST_UDELAY is not set
>> CONFIG_TEST_STATIC_KEYS=3Dm
>> # CONFIG_TEST_KMOD is not set
>> # CONFIG_TEST_DEBUG_VIRTUAL is not set
>> # CONFIG_TEST_MEMCAT_P is not set
>> # CONFIG_TEST_STACKINIT is not set
>> # CONFIG_MEMTEST is not set
>> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
>> # CONFIG_SAMPLES is not set
>> CONFIG_HAVE_ARCH_KGDB=3Dy
>> # CONFIG_KGDB is not set
>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>> # CONFIG_UBSAN is not set
>> CONFIG_UBSAN_ALIGNMENT=3Dy
>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>> CONFIG_X86_VERBOSE_BOOTUP=3Dy
>> # CONFIG_EARLY_PRINTK is not set
>> CONFIG_X86_PTDUMP_CORE=3Dy
>> # CONFIG_X86_PTDUMP is not set
>> CONFIG_DEBUG_WX=3Dy
>> # CONFIG_DOUBLEFAULT is not set
>> CONFIG_DEBUG_TLBFLUSH=3Dy
>> # CONFIG_IOMMU_DEBUG is not set
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
>> CONFIG_OPTIMIZE_INLINING=3Dy
>> CONFIG_DEBUG_ENTRY=3Dy
>> CONFIG_DEBUG_NMI_SELFTEST=3Dy
>> CONFIG_X86_DEBUG_FPU=3Dy
>> CONFIG_PUNIT_ATOM_DEBUG=3Dy
>> # CONFIG_UNWINDER_ORC is not set
>> CONFIG_UNWINDER_FRAME_POINTER=3Dy
>> #!/bin/sh
>>
>> export_top_env()
>> {
>> 	export suite=3D'locktorture'
>> 	export testcase=3D'locktorture'
>> 	export category=3D'functional'
>> 	export need_modules=3Dtrue
>> 	export need_memory=3D'300MB'
>> 	export runtime=3D300
>> 	export job_origin=3D'/lkp/lkp/src/allot/rand/vm-snb-2G/locktorture.yaml'
>> 	export queue_cmdline_keys=3D'branch
>> commit'
>> 	export queue=3D'validate'
>> 	export testbox=3D'vm-snb-2G-162'
>> 	export tbox_group=3D'vm-snb-2G'
>> 	export branch=3D'rcu/dev.2019.04.24b'
>> 	export commit=3D'2ce62cbf3ebf647d3ef3640969b81e8b0b9466ad'
>> 	export kconfig=3D'x86_64-randconfig-g2-201917'
>> 	export repeat_to=3D4
>> 	export submit_id=3D'5ccc63700b9a93ab86cd6a57'
>> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-2G-162/locktorture-300s-c=
puhotplug-debian-x86_64-2018-04-03.cgz-2ce62cbf3e-20190503-43910-y0r3er-3.y=
aml'
>> 	export id=3D'3b0ec78be026fe5e9064bcc7b5eb38d5dacdf042'
>> 	export queuer_version=3D'/lkp/lkp/.src-20190430-194821'
>> 	export arch=3D'x86_64'
>> 	export need_kconfig=3D'CONFIG_LOCK_TORTURE_TEST=3Dm
>> CONFIG_KVM_GUEST=3Dy'
>> 	export ssh_base_port=3D23108
>> 	export compiler=3D'gcc-7'
>> 	export rootfs=3D'debian-x86_64-2018-04-03.cgz'
>> 	export enqueue_time=3D'2019-05-03 23:51:17 +0800'
>> 	export _id=3D'5ccc63750b9a93ab86cd6a58'
>> 	export _rt=3D'/result/locktorture/300s-cpuhotplug/vm-snb-2G/debian-x86_=
64-2018-04-03.cgz/x86_64-randconfig-g2-201917/gcc-7/2ce62cbf3ebf647d3ef3640=
969b81e8b0b9466ad'
>> 	export user=3D'lkp'
>> 	export result_root=3D'/result/locktorture/300s-cpuhotplug/vm-snb-2G/deb=
ian-x86_64-2018-04-03.cgz/x86_64-randconfig-g2-201917/gcc-7/2ce62cbf3ebf647=
d3ef3640969b81e8b0b9466ad/3'
>> 	export scheduler_version=3D'/lkp/lkp/.src-20190430-194821'
>> 	export LKP_SERVER=3D'inn'
>> 	export max_uptime=3D1500
>> 	export initrd=3D'/osimage/debian/debian-x86_64-2018-04-03.cgz'
>> 	export bootloader_append=3D'root=3D/dev/ram0
>> user=3Dlkp
>> job=3D/lkp/jobs/scheduled/vm-snb-2G-162/locktorture-300s-cpuhotplug-debi=
an-x86_64-2018-04-03.cgz-2ce62cbf3e-20190503-43910-y0r3er-3.yaml
>> ARCH=3Dx86_64
>> kconfig=3Dx86_64-randconfig-g2-201917
>> branch=3Drcu/dev.2019.04.24b
>> commit=3D2ce62cbf3ebf647d3ef3640969b81e8b0b9466ad
>> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-g2-201917/gcc-7/2ce62cbf3ebf64=
7d3ef3640969b81e8b0b9466ad/vmlinuz-5.1.0-rc1-00102-g2ce62cb
>> max_uptime=3D1500
>> RESULT_ROOT=3D/result/locktorture/300s-cpuhotplug/vm-snb-2G/debian-x86_6=
4-2018-04-03.cgz/x86_64-randconfig-g2-201917/gcc-7/2ce62cbf3ebf647d3ef36409=
69b81e8b0b9466ad/3
>> LKP_SERVER=3Dinn
>> debug
>> apic=3Ddebug
>> sysrq_always_enabled
>> rcupdate.rcu_cpu_stall_timeout=3D100
>> net.ifnames=3D0
>> printk.devkmsg=3Don
>> panic=3D-1
>> softlockup_panic=3D1
>> nmi_watchdog=3Dpanic
>> oops=3Dpanic
>> load_ramdisk=3D2
>> prompt_ramdisk=3D0
>> drbd.minor_count=3D8
>> systemd.log_level=3Derr
>> ignore_loglevel
>> console=3Dtty0
>> earlyprintk=3DttyS0,115200
>> console=3DttyS0,115200
>> vga=3Dnormal
>> rw'
>> 	export modules_initrd=3D'/pkg/linux/x86_64-randconfig-g2-201917/gcc-7/2=
ce62cbf3ebf647d3ef3640969b81e8b0b9466ad/modules.cgz'
>> 	export bm_initrd=3D'/osimage/deps/debian-x86_64-2018-04-03.cgz/run-ipco=
nfig_2018-04-03.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/lkp_2019-04-=
24.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/rsync-rootfs_2018-04-03.c=
gz'
>> 	export lkp_initrd=3D'/lkp/lkp/lkp-x86_64.cgz'
>> 	export site=3D'inn'
>> 	export LKP_CGI_PORT=3D80
>> 	export LKP_CIFS_PORT=3D139
>> 	export schedule_notify_address=3D
>> 	export model=3D'qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
>> 	export nr_cpu=3D2
>> 	export memory=3D'2G'
>> 	export hdd_partitions=3D'/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /=
dev/vdf'
>> 	export swap_partitions=3D'/dev/vdg'
>> 	export vm_tbox_group=3D'vm-snb-2G'
>> 	export nr_vm=3D220
>> 	export vm_base_id=3D1201
>> 	export kernel=3D'/pkg/linux/x86_64-randconfig-g2-201917/gcc-7/2ce62cbf3=
ebf647d3ef3640969b81e8b0b9466ad/vmlinuz-5.1.0-rc1-00102-g2ce62cb'
>> 	export dequeue_time=3D'2019-05-03 23:51:51 +0800'
>> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-2G-162/locktorture-300s=
-cpuhotplug-debian-x86_64-2018-04-03.cgz-2ce62cbf3e-20190503-43910-y0r3er-3=
.cgz'
>>
>> 	[ -n "$LKP_SRC" ] ||
>> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
>> }
>>
>> run_job()
>> {
>> 	echo $$ > $TMP/run-job.pid
>>
>> 	. $LKP_SRC/lib/http.sh
>> 	. $LKP_SRC/lib/job.sh
>> 	. $LKP_SRC/lib/env.sh
>>
>> 	export_top_env
>>
>> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
>> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
>> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
>> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
>> 	run_monitor $LKP_SRC/monitors/plain/watchdog
>>
>> 	run_test test=3D'cpuhotplug' $LKP_SRC/tests/wrapper locktorture
>> }
>>
>> extract_stats()
>> {
>> 	export stats_part_begin=3D
>> 	export stats_part_end=3D
>>
>> 	$LKP_SRC/stats/wrapper locktorture
>> 	$LKP_SRC/stats/wrapper kmsg
>> 	$LKP_SRC/stats/wrapper meminfo
>>
>> 	$LKP_SRC/stats/wrapper time locktorture.time
>> 	$LKP_SRC/stats/wrapper dmesg
>> 	$LKP_SRC/stats/wrapper kmsg
>> 	$LKP_SRC/stats/wrapper last_state
>> 	$LKP_SRC/stats/wrapper stderr
>> 	$LKP_SRC/stats/wrapper time
>> }
>>
>> "$@"
>
>> 2019-05-03 15:52:48 modprobe locktorture onoff_interval=3D3 onoff_holdof=
f=3D30
>> 2019-05-03 15:52:48 sleep 300
>> 2019-05-03 15:57:48 rmmod locktorture
>> [   30.518614] spin_lock-torture:--- Start of test [debug]: nwriters_str=
ess=3D4 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=
=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D3 onoff_holdoff=3D30
>> [   30.522260] spin_lock-torture: Creating torture_onoff task
>> [   30.540748] spin_lock-torture: Creating torture_shuffle task
>> [   30.541983] spin_lock-torture: torture_onoff task started
>> [   30.543097] spin_lock-torture: torture_onoff begin holdoff
>> [   30.553921] spin_lock-torture: Creating torture_stutter task
>> [   30.553923] spin_lock-torture: torture_shuffle task started
>> [   30.567268] spin_lock-torture: torture_stutter task started
>> [   30.568650] spin_lock-torture: Creating lock_torture_writer task
>> [   30.573910] spin_lock-torture: Creating lock_torture_writer task
>> [   30.573917] spin_lock-torture: lock_torture_writer task started
>> [   30.583907] spin_lock-torture: Creating lock_torture_writer task
>> [   30.585367] spin_lock-torture: lock_torture_writer task started
>> [   30.593950] spin_lock-torture: Creating lock_torture_writer task
>> [   30.593961] spin_lock-torture: lock_torture_writer task started
>> [   30.603926] spin_lock-torture: Creating lock_torture_stats task
>> [   30.605317] spin_lock-torture: lock_torture_writer task started
>> [   30.613950] spin_lock-torture: lock_torture_stats task started
>> [   61.860597] spin_lock-torture: torture_onoff end holdoff

--===============0541993906151830182==--

