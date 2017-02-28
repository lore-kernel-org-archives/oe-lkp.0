Content-Type: multipart/mixed; boundary="===============7620634390966087134=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [usb] bea5b158ff WARNING: CPU: 0 PID: 25 at drivers/usb/core/urb.c:338 usb_submit_urb
Date: Tue, 28 Feb 2017 12:32:55 +0800
Message-ID: <20170228043255.GD9855@yexl-desktop>
In-Reply-To: <20170228014739.GB12307@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7620634390966087134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/28, Ye Xiaolong wrote:
>On 02/27, Peter Chen wrote:
>>On Sun, Feb 26, 2017 at 06:19:59PM +0800, Fengguang Wu wrote:
>>> [Sorry, resend to correct Felipe's email address]
>>> =

>>> Greetings,
>>> =

>>> This debug patch possibly discloses some USB/I2C bugs. Since the USB
>>> warning shows up earlier in dmesg, it might also be the root cause of
>>> the I2C bug. The attached reproduce-* script may help debug them.
>>> =

>>> [    9.260542] hub 1-0:1.0: 1 port detected
>>> [    9.261049] hub 1-0:1.0: USB hub found
>>> [    9.261458] hub 1-0:1.0: 1 port detected
>>> [    9.262388] kobject (cf9188bc): tried to init an initialized object,=
 something is seriously wrong.
>>> [    9.263589] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc4-0000=
3-gbea5b15 #2
>>> [    9.264595] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.9.3-20161025_171302-gandalf 04/01/2014
>>> [    9.265922]  00000000 00000000 c0047db4 c11aec39 cf9188bc c1c1ba9c c=
0047dcc c11b0616
>>> [    9.267073]  c1ab0c68 cf9188bc cf9188b4 cf918868 c0047dd8 c13090ec c=
f9188b4 c0047de4
>>> [    9.268230]  c130a49e ce6a8000 c0047e04 c1402216 ce69300c 00200246 c=
f9188b4 cf918000
>>> [    9.269388] Call Trace:
>>> [    9.269720]  [<c11aec39>] dump_stack+0x58/0x72
>>> [    9.270312]  [<c11b0616>] kobject_init+0x27/0x71
>>> [    9.270929]  [<c13090ec>] device_initialize+0x1b/0xbd
>>> [    9.271599]  [<c130a49e>] device_register+0xb/0x15
>>> [    9.272236]  [<c1402216>] usb_add_gadget_udc_release+0x85/0x215
>>> [    9.273036]  [<c1402403>] usb_add_gadget_udc+0xa/0xc
>>> [    9.273700]  [<c1403f37>] dummy_udc_probe+0x130/0x168
>>> [    9.274377]  [<c130cf05>] platform_drv_probe+0x44/0x80
>>> [    9.275047]  [<c130bef3>] driver_probe_device+0xfe/0x297
>>> [    9.275748]  [<c130c17a>] __device_attach_driver+0x65/0x71
>>> [    9.276481]  [<c130add0>] bus_for_each_drv+0x3a/0x67
>>> [    9.277130]  [<c130bd02>] __device_attach+0x86/0xdb
>>> [    9.277778]  [<c130c115>] ? driver_allows_async_probing+0xc/0xc
>>> [    9.278561]  [<c130c28a>] device_initial_probe+0xd/0xf
>>> [    9.279235]  [<c130af4f>] bus_probe_device+0x25/0x67
>>> [    9.279895]  [<c130a33d>] device_add+0x341/0x497
>>> [    9.280517]  [<c130930f>] ? dev_set_name+0x14/0x16
>>> [    9.281154]  [<c130d4c5>] platform_device_add+0x117/0x161
>>> [    9.281879]  [<c1d18945>] init+0x20d/0x2f4
>>> [    9.282431]  [<c1d18738>] ? usb_udc_init+0x3f/0x3f
>>> [    9.283075]  [<c1cdeba3>] do_one_initcall+0x7e/0xfc
>>> [    9.283725]  [<c1056209>] ? parse_args+0x19b/0x26f
>>> [    9.284362]  [<c1cded68>] ? kernel_init_freeable+0x147/0x1eb
>>> [    9.285100]  [<c1cded84>] kernel_init_freeable+0x163/0x1eb
>>> [    9.285826]  [<c170d049>] kernel_init+0x8/0xd0
>>> [    9.286417]  [<c17122e2>] ret_from_kernel_thread+0xe/0x24
>>> [    9.287118]  [<c170d041>] ? rest_init+0xa5/0xa5
>>> [    9.288532] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at=
 0x60,0x64 irq 1,12
>>> [    9.290663] serio: i8042 KBD port at 0x60,0x64 irq 1
>>> [    9.291372] serio: i8042 AUX port at 0x60,0x64 irq 12
>>> [    9.293351] serio: i8042 KBD port at 0x60,0x64 irq 1
>>> [    9.294031] serio: i8042 AUX port at 0x60,0x64 irq 12
>>
>>Fengguang, thanks for reporting it, I can also reproduce it using
>>unbind/bind interface for dummy_udc. The reason for it is that
>>the memory region of struct usb_gadget at dummy_udc is from the
>>platform data of platform device dummy_udc, so this memory region
>>will not be released after the resources for device dummy_udc are
>>released. The below diff can fix my problem, would you mind testing
>>it:
>
>I've queued jobs to verify your fix, I'll post the result once I get it.

The dummy_udc WARN is gone with this patch for 100+ times of boot tests.

Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>

Thanks,
Xiaolong

>
>Thanks,
>Xiaolong
>>
>>diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/=
dummy_hcd.c
>>index c60abe3..a358cb9 100644
>>--- a/drivers/usb/gadget/udc/dummy_hcd.c
>>+++ b/drivers/usb/gadget/udc/dummy_hcd.c
>>@@ -1031,6 +1031,7 @@ static int dummy_udc_probe(struct platform_device *=
pdev)
>> 	int		rc;
>> =

>> 	dum =3D *((void **)dev_get_platdata(&pdev->dev));
>>+	memzero_explicit(&dum->gadget, sizeof (struct usb_gadget));
>> 	dum->gadget.name =3D gadget_name;
>> 	dum->gadget.ops =3D &dummy_ops;
>> 	dum->gadget.max_speed =3D USB_SPEED_SUPER;
>>
>>
>>Peter
>>> =

>>> The attached dmesg has more follow up errors.
>>> =

>>> git bisect start v4.9 v4.8 --
>>> git bisect  bad 9fe68cad6e74967b88d0c6aeca7d9cd6b6e91942  # 00:43     1=
8-     30  Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/herbert/crypto-2.6
>>> git bisect  bad d8ea757b25ec82687c497fc90aa83f9bcea24b5b  # 01:11      =
4-      6  Merge tag 'xtensa-20161005' of git://github.com/jcmvbkbc/linux-x=
tensa
>>> git bisect  bad e6445f52d9c8b0e6557a45fa7d0e8e088d430a8c  # 01:17      =
6-     11  Merge tag 'usb-4.9-rc1' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/gregkh/usb
>>> git bisect good 1a4a2bc460721bc8f91e4c1294d39b38e5af132f  # 01:32     5=
2+      0  Merge branch 'x86-asm-for-linus' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tip/tip
>>> git bisect good 3ef0a61a467639cf7def299309cd9ea524c3e1c1  # 01:50     5=
2+      0  Merge branch 'x86-boot-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
>>> git bisect  bad e6dce825fba05f447bd22c865e27233182ab3d79  # 02:02     1=
7-     27  Merge tag 'tty-4.9-rc1' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/gregkh/tty
>>> git bisect good 597f03f9d133e9837d00965016170271d4f87dcf  # 02:34     5=
5+      0  Merge branch 'smp-hotplug-for-linus' of git://git.kernel.org/pub=
/scm/linux/kernel/git/tip/tip
>>> git bisect good 7a53eea1f7b527fd3b6d7ca992914840981afe99  # 02:55     5=
1+      0  Merge tag 'char-misc-4.9-rc1' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/gregkh/char-misc
>>> git bisect  bad 9929780e86854833e649b39b290b5fe921eb1701  # 03:03      =
1-      3  Merge tag 'driver-core-4.9-rc1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/gregkh/driver-core
>>> git bisect  bad 2c507e464f791327c94d17a0137f00b4717744fc  # 03:15      =
2-      4  device core: Remove deprecated create_singlethread_workqueue
>>> git bisect  bad 03aca7b260ea2aadf92596d2f57160e4aee8ffb0  # 03:26      =
0-      7  attribute_container: Fix typo
>>> git bisect  bad bea5b158ff0da9c7246ff391f754f5f38e34577a  # 03:41      =
0-      1  driver core: add test of driver remove calls during probe
>>> git bisect good 24ef5f360f22e4408cb49d75755d27d5a21820f7  # 03:57     5=
1+      0  debugfs: remove extra debugfs_create_file_unsafe() declaration
>>> git bisect good cebf8fd16900fdfd58c0028617944f808f97fe50  # 08:29     5=
5+      0  driver core: fix race between creating/querying glue dir and its=
 cleanup
>>> # first bad commit: [bea5b158ff0da9c7246ff391f754f5f38e34577a] driver c=
ore: add test of driver remove calls during probe
>>> git bisect good cebf8fd16900fdfd58c0028617944f808f97fe50  # 11:46    16=
0+      0  driver core: fix race between creating/querying glue dir and its=
 cleanup
>>> # extra tests with CONFIG_DEBUG_INFO_REDUCED
>>> # extra tests on HEAD of linux-devel/devel-spot-201702252217
>>> git bisect  bad b2c7455f59b51a4477df19cd36f18ef4734a860e  # 11:51      =
0-     13  0day head guard for 'devel-spot-201702252217'
>>> # extra tests on tree/branch linus/master
>>> git bisect  bad c4f3f22eddc982d247ffe2a6690c3e4a5c46dd09  # 12:01      =
2-      1  Merge tag 'linux-kselftest-4.11-rc1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/shuah/linux-kselftest
>>> # extra tests on tree/branch linux-next/master
>>> =

>>> ---
>>> 0-DAY kernel test infrastructure                Open Source Technology =
Center
>>> https://lists.01.org/pipermail/lkp                          Intel Corpo=
ration
>>
>>
>>> #!/bin/bash
>>> =

>>> kernel=3D$1
>>> 		initrd=3Dquantal-core-i386.cgz
>>> =

>>> 		wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/r=
aw/master/initrd/$initrd
>>> =

>>> kvm=3D(
>>> 	qemu-system-x86_64
>>> 	-enable-kvm
>>> 	-cpu kvm64
>>> 	-kernel $kernel
>>> 	-initrd $initrd
>>> 	-m 369
>>> 	-smp 2
>>> 	-device e1000,netdev=3Dnet0
>>> 	-netdev user,id=3Dnet0
>>> 	-boot order=3Dnc
>>> 	-no-reboot
>>> 	-watchdog i6300esb
>>> 	-watchdog-action debug
>>> 	-rtc base=3Dlocaltime
>>> 	-serial stdio
>>> 	-display none
>>> 	-monitor null
>>> )
>>> =

>>> append=3D(
>>> 	root=3D/dev/ram0
>>> 	hung_task_panic=3D1
>>> 	debug
>>> 	apic=3Ddebug
>>> 	sysrq_always_enabled
>>> 	rcupdate.rcu_cpu_stall_timeout=3D100
>>> 	net.ifnames=3D0
>>> 	printk.devkmsg=3Don
>>> 	panic=3D-1
>>> 	softlockup_panic=3D1
>>> 	nmi_watchdog=3Dpanic
>>> 	oops=3Dpanic
>>> 	load_ramdisk=3D2
>>> 	prompt_ramdisk=3D0
>>> 	drbd.minor_count=3D8
>>> 	systemd.log_level=3Derr
>>> 	ignore_loglevel
>>> 	earlyprintk=3DttyS0,115200
>>> 	console=3DttyS0,115200
>>> 	console=3Dtty0
>>> 	vga=3Dnormal
>>> 	rw
>>> 	drbd.minor_count=3D8
>>> )
>>> =

>>> "${kvm[@]}" -append "${append[*]}"
>>
>>> #
>>> # Automatically generated file; DO NOT EDIT.
>>> # Linux/i386 4.8.0-rc4 Kernel Configuration
>>> #
>>> # CONFIG_64BIT is not set
>>> CONFIG_X86_32=3Dy
>>> CONFIG_X86=3Dy
>>> CONFIG_INSTRUCTION_DECODER=3Dy
>>> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
>>> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
>>> CONFIG_LOCKDEP_SUPPORT=3Dy
>>> CONFIG_STACKTRACE_SUPPORT=3Dy
>>> CONFIG_MMU=3Dy
>>> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
>>> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
>>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>>> CONFIG_NEED_SG_DMA_LENGTH=3Dy
>>> CONFIG_GENERIC_ISA_DMA=3Dy
>>> CONFIG_GENERIC_BUG=3Dy
>>> CONFIG_GENERIC_HWEIGHT=3Dy
>>> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
>>> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
>>> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>>> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>>> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
>>> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
>>> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
>>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
>>> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
>>> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>>> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
>>> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
>>> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
>>> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>>> CONFIG_X86_32_SMP=3Dy
>>> CONFIG_X86_32_LAZY_GS=3Dy
>>> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>>> CONFIG_FIX_EARLYCON_MEM=3Dy
>>> CONFIG_DEBUG_RODATA=3Dy
>>> CONFIG_PGTABLE_LEVELS=3D2
>>> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>>> CONFIG_IRQ_WORK=3Dy
>>> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
>>> =

>>> #
>>> # General setup
>>> #
>>> CONFIG_INIT_ENV_ARG_LIMIT=3D32
>>> CONFIG_CROSS_COMPILE=3D""
>>> # CONFIG_COMPILE_TEST is not set
>>> CONFIG_LOCALVERSION=3D""
>>> CONFIG_LOCALVERSION_AUTO=3Dy
>>> CONFIG_HAVE_KERNEL_GZIP=3Dy
>>> CONFIG_HAVE_KERNEL_BZIP2=3Dy
>>> CONFIG_HAVE_KERNEL_LZMA=3Dy
>>> CONFIG_HAVE_KERNEL_XZ=3Dy
>>> CONFIG_HAVE_KERNEL_LZO=3Dy
>>> CONFIG_HAVE_KERNEL_LZ4=3Dy
>>> CONFIG_KERNEL_GZIP=3Dy
>>> # CONFIG_KERNEL_BZIP2 is not set
>>> # CONFIG_KERNEL_LZMA is not set
>>> # CONFIG_KERNEL_XZ is not set
>>> # CONFIG_KERNEL_LZO is not set
>>> # CONFIG_KERNEL_LZ4 is not set
>>> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>>> # CONFIG_SYSVIPC is not set
>>> # CONFIG_POSIX_MQUEUE is not set
>>> # CONFIG_CROSS_MEMORY_ATTACH is not set
>>> CONFIG_FHANDLE=3Dy
>>> # CONFIG_USELIB is not set
>>> # CONFIG_AUDIT is not set
>>> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>>> =

>>> #
>>> # IRQ subsystem
>>> #
>>> CONFIG_GENERIC_IRQ_PROBE=3Dy
>>> CONFIG_GENERIC_IRQ_SHOW=3Dy
>>> CONFIG_GENERIC_PENDING_IRQ=3Dy
>>> CONFIG_GENERIC_IRQ_CHIP=3Dy
>>> CONFIG_IRQ_DOMAIN=3Dy
>>> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>>> # CONFIG_IRQ_DOMAIN_DEBUG is not set
>>> CONFIG_IRQ_FORCED_THREADING=3Dy
>>> CONFIG_SPARSE_IRQ=3Dy
>>> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>>> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
>>> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
>>> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
>>> CONFIG_GENERIC_CLOCKEVENTS=3Dy
>>> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
>>> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
>>> CONFIG_GENERIC_CMOS_UPDATE=3Dy
>>> =

>>> #
>>> # Timers subsystem
>>> #
>>> CONFIG_TICK_ONESHOT=3Dy
>>> CONFIG_NO_HZ_COMMON=3Dy
>>> # CONFIG_HZ_PERIODIC is not set
>>> CONFIG_NO_HZ_IDLE=3Dy
>>> CONFIG_NO_HZ=3Dy
>>> CONFIG_HIGH_RES_TIMERS=3Dy
>>> =

>>> #
>>> # CPU/Task time and stats accounting
>>> #
>>> CONFIG_TICK_CPU_ACCOUNTING=3Dy
>>> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
>>> CONFIG_BSD_PROCESS_ACCT=3Dy
>>> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
>>> # CONFIG_TASKSTATS is not set
>>> =

>>> #
>>> # RCU Subsystem
>>> #
>>> CONFIG_TREE_RCU=3Dy
>>> # CONFIG_RCU_EXPERT is not set
>>> CONFIG_SRCU=3Dy
>>> CONFIG_TASKS_RCU=3Dy
>>> CONFIG_RCU_STALL_COMMON=3Dy
>>> CONFIG_TREE_RCU_TRACE=3Dy
>>> # CONFIG_RCU_EXPEDITE_BOOT is not set
>>> CONFIG_BUILD_BIN2C=3Dy
>>> CONFIG_IKCONFIG=3Dy
>>> CONFIG_IKCONFIG_PROC=3Dy
>>> CONFIG_LOG_BUF_SHIFT=3D17
>>> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
>>> CONFIG_NMI_LOG_BUF_SHIFT=3D13
>>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>>> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>>> CONFIG_CGROUPS=3Dy
>>> CONFIG_PAGE_COUNTER=3Dy
>>> # CONFIG_MEMCG is not set
>>> CONFIG_CGROUP_SCHED=3Dy
>>> CONFIG_FAIR_GROUP_SCHED=3Dy
>>> CONFIG_CFS_BANDWIDTH=3Dy
>>> CONFIG_RT_GROUP_SCHED=3Dy
>>> CONFIG_CGROUP_PIDS=3Dy
>>> # CONFIG_CGROUP_FREEZER is not set
>>> CONFIG_CGROUP_HUGETLB=3Dy
>>> CONFIG_CPUSETS=3Dy
>>> # CONFIG_PROC_PID_CPUSET is not set
>>> CONFIG_CGROUP_DEVICE=3Dy
>>> # CONFIG_CGROUP_CPUACCT is not set
>>> CONFIG_CGROUP_PERF=3Dy
>>> CONFIG_CGROUP_DEBUG=3Dy
>>> # CONFIG_CHECKPOINT_RESTORE is not set
>>> CONFIG_NAMESPACES=3Dy
>>> # CONFIG_UTS_NS is not set
>>> CONFIG_USER_NS=3Dy
>>> CONFIG_PID_NS=3Dy
>>> CONFIG_NET_NS=3Dy
>>> CONFIG_SCHED_AUTOGROUP=3Dy
>>> # CONFIG_SYSFS_DEPRECATED is not set
>>> # CONFIG_RELAY is not set
>>> CONFIG_BLK_DEV_INITRD=3Dy
>>> CONFIG_INITRAMFS_SOURCE=3D""
>>> CONFIG_RD_GZIP=3Dy
>>> CONFIG_RD_BZIP2=3Dy
>>> CONFIG_RD_LZMA=3Dy
>>> # CONFIG_RD_XZ is not set
>>> CONFIG_RD_LZO=3Dy
>>> # CONFIG_RD_LZ4 is not set
>>> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
>>> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>>> CONFIG_SYSCTL=3Dy
>>> CONFIG_ANON_INODES=3Dy
>>> CONFIG_HAVE_UID16=3Dy
>>> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>>> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>>> CONFIG_BPF=3Dy
>>> CONFIG_EXPERT=3Dy
>>> CONFIG_UID16=3Dy
>>> CONFIG_MULTIUSER=3Dy
>>> CONFIG_SGETMASK_SYSCALL=3Dy
>>> # CONFIG_SYSFS_SYSCALL is not set
>>> # CONFIG_SYSCTL_SYSCALL is not set
>>> CONFIG_KALLSYMS=3Dy
>>> CONFIG_KALLSYMS_ALL=3Dy
>>> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
>>> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>>> CONFIG_PRINTK=3Dy
>>> CONFIG_PRINTK_NMI=3Dy
>>> CONFIG_BUG=3Dy
>>> # CONFIG_ELF_CORE is not set
>>> CONFIG_PCSPKR_PLATFORM=3Dy
>>> CONFIG_BASE_FULL=3Dy
>>> CONFIG_FUTEX=3Dy
>>> CONFIG_EPOLL=3Dy
>>> CONFIG_SIGNALFD=3Dy
>>> CONFIG_TIMERFD=3Dy
>>> CONFIG_EVENTFD=3Dy
>>> # CONFIG_BPF_SYSCALL is not set
>>> CONFIG_SHMEM=3Dy
>>> # CONFIG_AIO is not set
>>> # CONFIG_ADVISE_SYSCALLS is not set
>>> # CONFIG_USERFAULTFD is not set
>>> CONFIG_PCI_QUIRKS=3Dy
>>> # CONFIG_MEMBARRIER is not set
>>> CONFIG_EMBEDDED=3Dy
>>> CONFIG_HAVE_PERF_EVENTS=3Dy
>>> =

>>> #
>>> # Kernel Performance Events And Counters
>>> #
>>> CONFIG_PERF_EVENTS=3Dy
>>> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>>> CONFIG_VM_EVENT_COUNTERS=3Dy
>>> # CONFIG_COMPAT_BRK is not set
>>> CONFIG_SLAB=3Dy
>>> # CONFIG_SLUB is not set
>>> # CONFIG_SLOB is not set
>>> # CONFIG_SLAB_FREELIST_RANDOM is not set
>>> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
>>> # CONFIG_PROFILING is not set
>>> CONFIG_KEXEC_CORE=3Dy
>>> CONFIG_HAVE_OPROFILE=3Dy
>>> CONFIG_OPROFILE_NMI_TIMER=3Dy
>>> # CONFIG_JUMP_LABEL is not set
>>> # CONFIG_UPROBES is not set
>>> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
>>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>>> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>>> CONFIG_HAVE_IOREMAP_PROT=3Dy
>>> CONFIG_HAVE_KPROBES=3Dy
>>> CONFIG_HAVE_KRETPROBES=3Dy
>>> CONFIG_HAVE_OPTPROBES=3Dy
>>> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>>> CONFIG_HAVE_NMI=3Dy
>>> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>>> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>>> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>>> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>>> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>>> CONFIG_HAVE_CLK=3Dy
>>> CONFIG_HAVE_DMA_API_DEBUG=3Dy
>>> CONFIG_HAVE_HW_BREAKPOINT=3Dy
>>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>>> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>>> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>>> CONFIG_HAVE_PERF_REGS=3Dy
>>> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>>> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>>> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>>> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>>> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
>>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>>> CONFIG_SECCOMP_FILTER=3Dy
>>> CONFIG_HAVE_GCC_PLUGINS=3Dy
>>> CONFIG_GCC_PLUGINS=3Dy
>>> # CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
>>> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
>>> # CONFIG_CC_STACKPROTECTOR is not set
>>> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
>>> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
>>> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
>>> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>>> CONFIG_MODULES_USE_ELF_REL=3Dy
>>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>>> CONFIG_HAVE_EXIT_THREAD=3Dy
>>> CONFIG_ARCH_MMAP_RND_BITS=3D8
>>> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>>> # CONFIG_HAVE_ARCH_HASH is not set
>>> CONFIG_ISA_BUS_API=3Dy
>>> CONFIG_CLONE_BACKWARDS=3Dy
>>> CONFIG_OLD_SIGSUSPEND3=3Dy
>>> CONFIG_OLD_SIGACTION=3Dy
>>> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
>>> =

>>> #
>>> # GCOV-based kernel profiling
>>> #
>>> # CONFIG_GCOV_KERNEL is not set
>>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>>> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
>>> CONFIG_SLABINFO=3Dy
>>> CONFIG_RT_MUTEXES=3Dy
>>> CONFIG_BASE_SMALL=3D0
>>> # CONFIG_MODULES is not set
>>> CONFIG_MODULES_TREE_LOOKUP=3Dy
>>> # CONFIG_BLOCK is not set
>>> CONFIG_PADATA=3Dy
>>> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
>>> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>>> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
>>> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
>>> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>>> CONFIG_QUEUED_SPINLOCKS=3Dy
>>> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>>> CONFIG_QUEUED_RWLOCKS=3Dy
>>> CONFIG_FREEZER=3Dy
>>> =

>>> #
>>> # Processor type and features
>>> #
>>> # CONFIG_ZONE_DMA is not set
>>> CONFIG_SMP=3Dy
>>> CONFIG_X86_FEATURE_NAMES=3Dy
>>> # CONFIG_X86_FAST_FEATURE_TESTS is not set
>>> CONFIG_X86_MPPARSE=3Dy
>>> # CONFIG_X86_BIGSMP is not set
>>> CONFIG_GOLDFISH=3Dy
>>> # CONFIG_X86_EXTENDED_PLATFORM is not set
>>> CONFIG_X86_INTEL_LPSS=3Dy
>>> CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
>>> CONFIG_IOSF_MBI=3Dy
>>> # CONFIG_IOSF_MBI_DEBUG is not set
>>> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
>>> # CONFIG_X86_32_IRIS is not set
>>> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>>> CONFIG_HYPERVISOR_GUEST=3Dy
>>> CONFIG_PARAVIRT=3Dy
>>> # CONFIG_PARAVIRT_DEBUG is not set
>>> # CONFIG_PARAVIRT_SPINLOCKS is not set
>>> CONFIG_KVM_GUEST=3Dy
>>> # CONFIG_KVM_DEBUG_FS is not set
>>> # CONFIG_LGUEST_GUEST is not set
>>> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>>> CONFIG_PARAVIRT_CLOCK=3Dy
>>> CONFIG_NO_BOOTMEM=3Dy
>>> # CONFIG_M486 is not set
>>> # CONFIG_M586 is not set
>>> # CONFIG_M586TSC is not set
>>> # CONFIG_M586MMX is not set
>>> # CONFIG_M686 is not set
>>> # CONFIG_MPENTIUMII is not set
>>> # CONFIG_MPENTIUMIII is not set
>>> # CONFIG_MPENTIUMM is not set
>>> # CONFIG_MPENTIUM4 is not set
>>> # CONFIG_MK6 is not set
>>> # CONFIG_MK7 is not set
>>> # CONFIG_MK8 is not set
>>> # CONFIG_MCRUSOE is not set
>>> CONFIG_MEFFICEON=3Dy
>>> # CONFIG_MWINCHIPC6 is not set
>>> # CONFIG_MWINCHIP3D is not set
>>> # CONFIG_MELAN is not set
>>> # CONFIG_MGEODEGX1 is not set
>>> # CONFIG_MGEODE_LX is not set
>>> # CONFIG_MCYRIXIII is not set
>>> # CONFIG_MVIAC3_2 is not set
>>> # CONFIG_MVIAC7 is not set
>>> # CONFIG_MCORE2 is not set
>>> # CONFIG_MATOM is not set
>>> CONFIG_X86_GENERIC=3Dy
>>> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
>>> CONFIG_X86_L1_CACHE_SHIFT=3D6
>>> CONFIG_X86_INTEL_USERCOPY=3Dy
>>> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
>>> CONFIG_X86_TSC=3Dy
>>> CONFIG_X86_CMOV=3Dy
>>> CONFIG_X86_MINIMUM_CPU_FAMILY=3D4
>>> CONFIG_X86_DEBUGCTLMSR=3Dy
>>> # CONFIG_PROCESSOR_SELECT is not set
>>> CONFIG_CPU_SUP_INTEL=3Dy
>>> CONFIG_CPU_SUP_CYRIX_32=3Dy
>>> CONFIG_CPU_SUP_AMD=3Dy
>>> CONFIG_CPU_SUP_CENTAUR=3Dy
>>> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
>>> CONFIG_CPU_SUP_UMC_32=3Dy
>>> CONFIG_HPET_TIMER=3Dy
>>> CONFIG_HPET_EMULATE_RTC=3Dy
>>> CONFIG_DMI=3Dy
>>> CONFIG_NR_CPUS=3D8
>>> # CONFIG_SCHED_SMT is not set
>>> # CONFIG_SCHED_MC is not set
>>> CONFIG_PREEMPT_NONE=3Dy
>>> # CONFIG_PREEMPT_VOLUNTARY is not set
>>> # CONFIG_PREEMPT is not set
>>> CONFIG_PREEMPT_COUNT=3Dy
>>> CONFIG_X86_LOCAL_APIC=3Dy
>>> CONFIG_X86_IO_APIC=3Dy
>>> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
>>> CONFIG_X86_MCE=3Dy
>>> # CONFIG_X86_MCE_INTEL is not set
>>> CONFIG_X86_MCE_AMD=3Dy
>>> CONFIG_X86_ANCIENT_MCE=3Dy
>>> CONFIG_X86_MCE_THRESHOLD=3Dy
>>> CONFIG_X86_MCE_INJECT=3Dy
>>> =

>>> #
>>> # Performance monitoring
>>> #
>>> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
>>> # CONFIG_PERF_EVENTS_INTEL_RAPL is not set
>>> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
>>> # CONFIG_PERF_EVENTS_AMD_POWER is not set
>>> # CONFIG_X86_LEGACY_VM86 is not set
>>> # CONFIG_VM86 is not set
>>> # CONFIG_TOSHIBA is not set
>>> CONFIG_I8K=3Dy
>>> CONFIG_X86_REBOOTFIXUPS=3Dy
>>> CONFIG_MICROCODE=3Dy
>>> # CONFIG_MICROCODE_INTEL is not set
>>> CONFIG_MICROCODE_AMD=3Dy
>>> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
>>> CONFIG_X86_MSR=3Dy
>>> # CONFIG_X86_CPUID is not set
>>> CONFIG_NOHIGHMEM=3Dy
>>> # CONFIG_HIGHMEM4G is not set
>>> # CONFIG_HIGHMEM64G is not set
>>> CONFIG_VMSPLIT_3G=3Dy
>>> # CONFIG_VMSPLIT_3G_OPT is not set
>>> # CONFIG_VMSPLIT_2G is not set
>>> # CONFIG_VMSPLIT_2G_OPT is not set
>>> # CONFIG_VMSPLIT_1G is not set
>>> CONFIG_PAGE_OFFSET=3D0xC0000000
>>> # CONFIG_X86_PAE is not set
>>> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
>>> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>>> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>>> CONFIG_ILLEGAL_POINTER_VALUE=3D0
>>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>>> CONFIG_FLATMEM_MANUAL=3Dy
>>> # CONFIG_SPARSEMEM_MANUAL is not set
>>> CONFIG_FLATMEM=3Dy
>>> CONFIG_FLAT_NODE_MEM_MAP=3Dy
>>> CONFIG_SPARSEMEM_STATIC=3Dy
>>> CONFIG_HAVE_MEMBLOCK=3Dy
>>> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>>> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>>> CONFIG_MEMORY_ISOLATION=3Dy
>>> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
>>> CONFIG_SPLIT_PTLOCK_CPUS=3D4
>>> CONFIG_COMPACTION=3Dy
>>> CONFIG_MIGRATION=3Dy
>>> # CONFIG_PHYS_ADDR_T_64BIT is not set
>>> CONFIG_VIRT_TO_BUS=3Dy
>>> # CONFIG_KSM is not set
>>> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>>> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
>>> CONFIG_MEMORY_FAILURE=3Dy
>>> # CONFIG_HWPOISON_INJECT is not set
>>> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>>> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
>>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
>>> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
>>> CONFIG_CLEANCACHE=3Dy
>>> # CONFIG_CMA is not set
>>> CONFIG_ZPOOL=3Dy
>>> # CONFIG_ZBUD is not set
>>> CONFIG_Z3FOLD=3Dy
>>> # CONFIG_ZSMALLOC is not set
>>> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>>> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
>>> # CONFIG_IDLE_PAGE_TRACKING is not set
>>> CONFIG_FRAME_VECTOR=3Dy
>>> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
>>> CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
>>> CONFIG_X86_RESERVE_LOW=3D64
>>> # CONFIG_MTRR is not set
>>> # CONFIG_ARCH_RANDOM is not set
>>> # CONFIG_X86_SMAP is not set
>>> # CONFIG_X86_INTEL_MPX is not set
>>> # CONFIG_EFI is not set
>>> CONFIG_SECCOMP=3Dy
>>> # CONFIG_HZ_100 is not set
>>> # CONFIG_HZ_250 is not set
>>> CONFIG_HZ_300=3Dy
>>> # CONFIG_HZ_1000 is not set
>>> CONFIG_HZ=3D300
>>> CONFIG_SCHED_HRTICK=3Dy
>>> CONFIG_KEXEC=3Dy
>>> CONFIG_PHYSICAL_START=3D0x1000000
>>> # CONFIG_RELOCATABLE is not set
>>> CONFIG_PHYSICAL_ALIGN=3D0x200000
>>> CONFIG_HOTPLUG_CPU=3Dy
>>> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
>>> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
>>> CONFIG_COMPAT_VDSO=3Dy
>>> # CONFIG_CMDLINE_BOOL is not set
>>> # CONFIG_MODIFY_LDT_SYSCALL is not set
>>> =

>>> #
>>> # Power management and ACPI options
>>> #
>>> CONFIG_SUSPEND=3Dy
>>> CONFIG_SUSPEND_FREEZER=3Dy
>>> CONFIG_SUSPEND_SKIP_SYNC=3Dy
>>> CONFIG_PM_SLEEP=3Dy
>>> CONFIG_PM_SLEEP_SMP=3Dy
>>> CONFIG_PM_AUTOSLEEP=3Dy
>>> # CONFIG_PM_WAKELOCKS is not set
>>> CONFIG_PM=3Dy
>>> # CONFIG_PM_DEBUG is not set
>>> CONFIG_PM_OPP=3Dy
>>> CONFIG_PM_CLK=3Dy
>>> CONFIG_PM_GENERIC_DOMAINS=3Dy
>>> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
>>> CONFIG_PM_GENERIC_DOMAINS_SLEEP=3Dy
>>> CONFIG_PM_GENERIC_DOMAINS_OF=3Dy
>>> CONFIG_ACPI=3Dy
>>> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>>> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>>> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
>>> CONFIG_ACPI_DEBUGGER=3Dy
>>> CONFIG_ACPI_DEBUGGER_USER=3Dy
>>> CONFIG_ACPI_SLEEP=3Dy
>>> # CONFIG_ACPI_PROCFS_POWER is not set
>>> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>>> # CONFIG_ACPI_EC_DEBUGFS is not set
>>> # CONFIG_ACPI_AC is not set
>>> CONFIG_ACPI_BATTERY=3Dy
>>> CONFIG_ACPI_BUTTON=3Dy
>>> CONFIG_ACPI_VIDEO=3Dy
>>> # CONFIG_ACPI_FAN is not set
>>> # CONFIG_ACPI_DOCK is not set
>>> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>>> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
>>> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>>> CONFIG_ACPI_PROCESSOR=3Dy
>>> # CONFIG_ACPI_IPMI is not set
>>> CONFIG_ACPI_HOTPLUG_CPU=3Dy
>>> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dy
>>> CONFIG_ACPI_THERMAL=3Dy
>>> # CONFIG_ACPI_CUSTOM_DSDT is not set
>>> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
>>> # CONFIG_ACPI_TABLE_UPGRADE is not set
>>> CONFIG_ACPI_DEBUG=3Dy
>>> # CONFIG_ACPI_PCI_SLOT is not set
>>> CONFIG_X86_PM_TIMER=3Dy
>>> CONFIG_ACPI_CONTAINER=3Dy
>>> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
>>> # CONFIG_ACPI_SBS is not set
>>> # CONFIG_ACPI_HED is not set
>>> CONFIG_ACPI_CUSTOM_METHOD=3Dy
>>> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
>>> CONFIG_HAVE_ACPI_APEI=3Dy
>>> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>>> CONFIG_ACPI_APEI=3Dy
>>> # CONFIG_ACPI_APEI_GHES is not set
>>> # CONFIG_ACPI_APEI_MEMORY_FAILURE is not set
>>> CONFIG_ACPI_APEI_EINJ=3Dy
>>> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
>>> CONFIG_DPTF_POWER=3Dy
>>> CONFIG_ACPI_EXTLOG=3Dy
>>> # CONFIG_PMIC_OPREGION is not set
>>> CONFIG_ACPI_CONFIGFS=3Dy
>>> CONFIG_SFI=3Dy
>>> CONFIG_X86_APM_BOOT=3Dy
>>> CONFIG_APM=3Dy
>>> # CONFIG_APM_IGNORE_USER_SUSPEND is not set
>>> CONFIG_APM_DO_ENABLE=3Dy
>>> # CONFIG_APM_CPU_IDLE is not set
>>> CONFIG_APM_DISPLAY_BLANK=3Dy
>>> # CONFIG_APM_ALLOW_INTS is not set
>>> =

>>> #
>>> # CPU Frequency scaling
>>> #
>>> CONFIG_CPU_FREQ=3Dy
>>> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
>>> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
>>> CONFIG_CPU_FREQ_STAT=3Dy
>>> # CONFIG_CPU_FREQ_STAT_DETAILS is not set
>>> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>>> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
>>> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
>>> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
>>> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
>>> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
>>> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>>> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
>>> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
>>> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
>>> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
>>> # CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set
>>> =

>>> #
>>> # CPU frequency scaling drivers
>>> #
>>> CONFIG_CPUFREQ_DT=3Dy
>>> CONFIG_CPUFREQ_DT_PLATDEV=3Dy
>>> # CONFIG_X86_INTEL_PSTATE is not set
>>> CONFIG_X86_PCC_CPUFREQ=3Dy
>>> CONFIG_X86_ACPI_CPUFREQ=3Dy
>>> # CONFIG_X86_ACPI_CPUFREQ_CPB is not set
>>> CONFIG_X86_POWERNOW_K6=3Dy
>>> CONFIG_X86_POWERNOW_K7=3Dy
>>> CONFIG_X86_POWERNOW_K7_ACPI=3Dy
>>> CONFIG_X86_POWERNOW_K8=3Dy
>>> # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
>>> CONFIG_X86_GX_SUSPMOD=3Dy
>>> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
>>> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
>>> CONFIG_X86_SPEEDSTEP_ICH=3Dy
>>> CONFIG_X86_SPEEDSTEP_SMI=3Dy
>>> CONFIG_X86_P4_CLOCKMOD=3Dy
>>> CONFIG_X86_CPUFREQ_NFORCE2=3Dy
>>> CONFIG_X86_LONGRUN=3Dy
>>> CONFIG_X86_LONGHAUL=3Dy
>>> CONFIG_X86_E_POWERSAVER=3Dy
>>> =

>>> #
>>> # shared options
>>> #
>>> CONFIG_X86_SPEEDSTEP_LIB=3Dy
>>> # CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is not set
>>> =

>>> #
>>> # CPU Idle
>>> #
>>> CONFIG_CPU_IDLE=3Dy
>>> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
>>> CONFIG_CPU_IDLE_GOV_MENU=3Dy
>>> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
>>> CONFIG_INTEL_IDLE=3Dy
>>> =

>>> #
>>> # Bus options (PCI etc.)
>>> #
>>> CONFIG_PCI=3Dy
>>> # CONFIG_PCI_GOBIOS is not set
>>> # CONFIG_PCI_GOMMCONFIG is not set
>>> # CONFIG_PCI_GODIRECT is not set
>>> # CONFIG_PCI_GOOLPC is not set
>>> CONFIG_PCI_GOANY=3Dy
>>> CONFIG_PCI_BIOS=3Dy
>>> CONFIG_PCI_DIRECT=3Dy
>>> CONFIG_PCI_MMCONFIG=3Dy
>>> CONFIG_PCI_OLPC=3Dy
>>> CONFIG_PCI_DOMAINS=3Dy
>>> CONFIG_PCI_CNB20LE_QUIRK=3Dy
>>> CONFIG_PCIEPORTBUS=3Dy
>>> # CONFIG_HOTPLUG_PCI_PCIE is not set
>>> # CONFIG_PCIEAER is not set
>>> # CONFIG_PCIEASPM is not set
>>> CONFIG_PCIE_PME=3Dy
>>> # CONFIG_PCIE_DPC is not set
>>> # CONFIG_PCI_MSI is not set
>>> # CONFIG_PCI_DEBUG is not set
>>> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
>>> # CONFIG_PCI_STUB is not set
>>> # CONFIG_HT_IRQ is not set
>>> # CONFIG_PCI_IOV is not set
>>> # CONFIG_PCI_PRI is not set
>>> # CONFIG_PCI_PASID is not set
>>> CONFIG_PCI_LABEL=3Dy
>>> CONFIG_HOTPLUG_PCI=3Dy
>>> CONFIG_HOTPLUG_PCI_COMPAQ=3Dy
>>> # CONFIG_HOTPLUG_PCI_COMPAQ_NVRAM is not set
>>> CONFIG_HOTPLUG_PCI_IBM=3Dy
>>> # CONFIG_HOTPLUG_PCI_ACPI is not set
>>> CONFIG_HOTPLUG_PCI_CPCI=3Dy
>>> # CONFIG_HOTPLUG_PCI_CPCI_ZT5550 is not set
>>> CONFIG_HOTPLUG_PCI_CPCI_GENERIC=3Dy
>>> CONFIG_HOTPLUG_PCI_SHPC=3Dy
>>> =

>>> #
>>> # PCI host controller drivers
>>> #
>>> CONFIG_ISA_BUS=3Dy
>>> CONFIG_ISA_DMA_API=3Dy
>>> CONFIG_ISA=3Dy
>>> # CONFIG_EISA is not set
>>> CONFIG_SCx200=3Dy
>>> CONFIG_SCx200HR_TIMER=3Dy
>>> CONFIG_OLPC=3Dy
>>> # CONFIG_OLPC_XO1_PM is not set
>>> CONFIG_OLPC_XO15_SCI=3Dy
>>> CONFIG_ALIX=3Dy
>>> # CONFIG_NET5501 is not set
>>> # CONFIG_GEOS is not set
>>> CONFIG_AMD_NB=3Dy
>>> # CONFIG_PCCARD is not set
>>> # CONFIG_RAPIDIO is not set
>>> # CONFIG_X86_SYSFB is not set
>>> =

>>> #
>>> # Executable file formats / Emulations
>>> #
>>> CONFIG_BINFMT_ELF=3Dy
>>> CONFIG_ELFCORE=3Dy
>>> CONFIG_BINFMT_SCRIPT=3Dy
>>> CONFIG_HAVE_AOUT=3Dy
>>> # CONFIG_BINFMT_AOUT is not set
>>> CONFIG_BINFMT_MISC=3Dy
>>> CONFIG_COREDUMP=3Dy
>>> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
>>> CONFIG_PMC_ATOM=3Dy
>>> CONFIG_NET=3Dy
>>> =

>>> #
>>> # Networking options
>>> #
>>> # CONFIG_PACKET is not set
>>> CONFIG_UNIX=3Dy
>>> # CONFIG_UNIX_DIAG is not set
>>> # CONFIG_NET_KEY is not set
>>> # CONFIG_INET is not set
>>> # CONFIG_NETWORK_SECMARK is not set
>>> # CONFIG_NET_PTP_CLASSIFY is not set
>>> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
>>> # CONFIG_NETFILTER is not set
>>> # CONFIG_ATM is not set
>>> # CONFIG_BRIDGE is not set
>>> # CONFIG_VLAN_8021Q is not set
>>> # CONFIG_DECNET is not set
>>> # CONFIG_LLC2 is not set
>>> # CONFIG_IPX is not set
>>> # CONFIG_ATALK is not set
>>> # CONFIG_X25 is not set
>>> # CONFIG_LAPB is not set
>>> # CONFIG_PHONET is not set
>>> # CONFIG_IEEE802154 is not set
>>> # CONFIG_NET_SCHED is not set
>>> # CONFIG_DCB is not set
>>> # CONFIG_BATMAN_ADV is not set
>>> # CONFIG_VSOCKETS is not set
>>> # CONFIG_NETLINK_DIAG is not set
>>> # CONFIG_MPLS is not set
>>> # CONFIG_HSR is not set
>>> CONFIG_RPS=3Dy
>>> CONFIG_RFS_ACCEL=3Dy
>>> CONFIG_XPS=3Dy
>>> # CONFIG_SOCK_CGROUP_DATA is not set
>>> # CONFIG_CGROUP_NET_PRIO is not set
>>> # CONFIG_CGROUP_NET_CLASSID is not set
>>> CONFIG_NET_RX_BUSY_POLL=3Dy
>>> CONFIG_BQL=3Dy
>>> CONFIG_NET_FLOW_LIMIT=3Dy
>>> =

>>> #
>>> # Network testing
>>> #
>>> # CONFIG_HAMRADIO is not set
>>> # CONFIG_CAN is not set
>>> # CONFIG_IRDA is not set
>>> # CONFIG_BT is not set
>>> CONFIG_WIRELESS=3Dy
>>> # CONFIG_CFG80211 is not set
>>> # CONFIG_LIB80211 is not set
>>> =

>>> #
>>> # CFG80211 needs to be enabled for MAC80211
>>> #
>>> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
>>> # CONFIG_WIMAX is not set
>>> # CONFIG_RFKILL is not set
>>> # CONFIG_RFKILL_REGULATOR is not set
>>> # CONFIG_NET_9P is not set
>>> # CONFIG_CAIF is not set
>>> # CONFIG_NFC is not set
>>> # CONFIG_LWTUNNEL is not set
>>> # CONFIG_DST_CACHE is not set
>>> # CONFIG_NET_DEVLINK is not set
>>> CONFIG_MAY_USE_DEVLINK=3Dy
>>> =

>>> #
>>> # Device Drivers
>>> #
>>> =

>>> #
>>> # Generic Driver Options
>>> #
>>> CONFIG_UEVENT_HELPER=3Dy
>>> CONFIG_UEVENT_HELPER_PATH=3D""
>>> CONFIG_DEVTMPFS=3Dy
>>> CONFIG_DEVTMPFS_MOUNT=3Dy
>>> CONFIG_STANDALONE=3Dy
>>> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>>> CONFIG_FW_LOADER=3Dy
>>> # CONFIG_FIRMWARE_IN_KERNEL is not set
>>> CONFIG_EXTRA_FIRMWARE=3D""
>>> CONFIG_FW_LOADER_USER_HELPER=3Dy
>>> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
>>> CONFIG_ALLOW_DEV_COREDUMP=3Dy
>>> # CONFIG_DEBUG_DRIVER is not set
>>> CONFIG_DEBUG_DEVRES=3Dy
>>> CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy
>>> # CONFIG_SYS_HYPERVISOR is not set
>>> # CONFIG_GENERIC_CPU_DEVICES is not set
>>> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>>> CONFIG_REGMAP=3Dy
>>> CONFIG_REGMAP_I2C=3Dy
>>> CONFIG_REGMAP_SPMI=3Dy
>>> CONFIG_REGMAP_MMIO=3Dy
>>> CONFIG_REGMAP_IRQ=3Dy
>>> CONFIG_DMA_SHARED_BUFFER=3Dy
>>> # CONFIG_FENCE_TRACE is not set
>>> =

>>> #
>>> # Bus devices
>>> #
>>> # CONFIG_CONNECTOR is not set
>>> CONFIG_MTD=3Dy
>>> CONFIG_MTD_REDBOOT_PARTS=3Dy
>>> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
>>> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
>>> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
>>> CONFIG_MTD_CMDLINE_PARTS=3Dy
>>> CONFIG_MTD_OF_PARTS=3Dy
>>> CONFIG_MTD_AR7_PARTS=3Dy
>>> =

>>> #
>>> # User Modules And Translation Layers
>>> #
>>> CONFIG_MTD_OOPS=3Dy
>>> CONFIG_MTD_PARTITIONED_MASTER=3Dy
>>> =

>>> #
>>> # RAM/ROM/Flash chip drivers
>>> #
>>> CONFIG_MTD_CFI=3Dy
>>> CONFIG_MTD_JEDECPROBE=3Dy
>>> CONFIG_MTD_GEN_PROBE=3Dy
>>> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
>>> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>>> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>>> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
>>> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
>>> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
>>> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
>>> CONFIG_MTD_CFI_I1=3Dy
>>> CONFIG_MTD_CFI_I2=3Dy
>>> # CONFIG_MTD_CFI_I4 is not set
>>> # CONFIG_MTD_CFI_I8 is not set
>>> # CONFIG_MTD_CFI_INTELEXT is not set
>>> CONFIG_MTD_CFI_AMDSTD=3Dy
>>> # CONFIG_MTD_CFI_STAA is not set
>>> CONFIG_MTD_CFI_UTIL=3Dy
>>> CONFIG_MTD_RAM=3Dy
>>> # CONFIG_MTD_ROM is not set
>>> CONFIG_MTD_ABSENT=3Dy
>>> =

>>> #
>>> # Mapping drivers for chip access
>>> #
>>> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
>>> # CONFIG_MTD_PHYSMAP is not set
>>> # CONFIG_MTD_PHYSMAP_OF is not set
>>> CONFIG_MTD_SCx200_DOCFLASH=3Dy
>>> # CONFIG_MTD_AMD76XROM is not set
>>> # CONFIG_MTD_ICHXROM is not set
>>> CONFIG_MTD_ESB2ROM=3Dy
>>> # CONFIG_MTD_CK804XROM is not set
>>> # CONFIG_MTD_SCB2_FLASH is not set
>>> # CONFIG_MTD_NETtel is not set
>>> CONFIG_MTD_L440GX=3Dy
>>> # CONFIG_MTD_PCI is not set
>>> CONFIG_MTD_GPIO_ADDR=3Dy
>>> CONFIG_MTD_INTEL_VR_NOR=3Dy
>>> CONFIG_MTD_PLATRAM=3Dy
>>> CONFIG_MTD_LATCH_ADDR=3Dy
>>> =

>>> #
>>> # Self-contained MTD device drivers
>>> #
>>> CONFIG_MTD_PMC551=3Dy
>>> CONFIG_MTD_PMC551_BUGFIX=3Dy
>>> # CONFIG_MTD_PMC551_DEBUG is not set
>>> CONFIG_MTD_SLRAM=3Dy
>>> CONFIG_MTD_PHRAM=3Dy
>>> CONFIG_MTD_MTDRAM=3Dy
>>> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
>>> CONFIG_MTDRAM_ERASE_SIZE=3D128
>>> =

>>> #
>>> # Disk-On-Chip Device Drivers
>>> #
>>> CONFIG_MTD_DOCG3=3Dy
>>> CONFIG_BCH_CONST_M=3D14
>>> CONFIG_BCH_CONST_T=3D4
>>> CONFIG_MTD_NAND_ECC=3Dy
>>> # CONFIG_MTD_NAND_ECC_SMC is not set
>>> CONFIG_MTD_NAND=3Dy
>>> # CONFIG_MTD_NAND_ECC_BCH is not set
>>> CONFIG_MTD_SM_COMMON=3Dy
>>> CONFIG_MTD_NAND_DENALI=3Dy
>>> CONFIG_MTD_NAND_DENALI_PCI=3Dy
>>> CONFIG_MTD_NAND_DENALI_DT=3Dy
>>> CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR=3D0xFF108018
>>> # CONFIG_MTD_NAND_GPIO is not set
>>> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
>>> CONFIG_MTD_NAND_IDS=3Dy
>>> CONFIG_MTD_NAND_RICOH=3Dy
>>> CONFIG_MTD_NAND_DISKONCHIP=3Dy
>>> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
>>> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
>>> # CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
>>> CONFIG_MTD_NAND_DOCG4=3Dy
>>> CONFIG_MTD_NAND_CAFE=3Dy
>>> # CONFIG_MTD_NAND_CS553X is not set
>>> CONFIG_MTD_NAND_NANDSIM=3Dy
>>> CONFIG_MTD_NAND_PLATFORM=3Dy
>>> CONFIG_MTD_NAND_HISI504=3Dy
>>> # CONFIG_MTD_NAND_MTK is not set
>>> CONFIG_MTD_ONENAND=3Dy
>>> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
>>> CONFIG_MTD_ONENAND_GENERIC=3Dy
>>> # CONFIG_MTD_ONENAND_OTP is not set
>>> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
>>> =

>>> #
>>> # LPDDR & LPDDR2 PCM memory drivers
>>> #
>>> CONFIG_MTD_LPDDR=3Dy
>>> CONFIG_MTD_QINFO_PROBE=3Dy
>>> CONFIG_MTD_SPI_NOR=3Dy
>>> CONFIG_MTD_MT81xx_NOR=3Dy
>>> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
>>> CONFIG_MTD_UBI=3Dy
>>> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
>>> CONFIG_MTD_UBI_BEB_LIMIT=3D20
>>> CONFIG_MTD_UBI_FASTMAP=3Dy
>>> CONFIG_MTD_UBI_GLUEBI=3Dy
>>> CONFIG_DTC=3Dy
>>> CONFIG_OF=3Dy
>>> CONFIG_OF_UNITTEST=3Dy
>>> CONFIG_OF_FLATTREE=3Dy
>>> CONFIG_OF_EARLY_FLATTREE=3Dy
>>> CONFIG_OF_PROMTREE=3Dy
>>> CONFIG_OF_DYNAMIC=3Dy
>>> CONFIG_OF_ADDRESS=3Dy
>>> CONFIG_OF_ADDRESS_PCI=3Dy
>>> CONFIG_OF_IRQ=3Dy
>>> CONFIG_OF_PCI=3Dy
>>> CONFIG_OF_PCI_IRQ=3Dy
>>> CONFIG_OF_MTD=3Dy
>>> CONFIG_OF_RESOLVE=3Dy
>>> CONFIG_OF_OVERLAY=3Dy
>>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>>> # CONFIG_PARPORT is not set
>>> CONFIG_PNP=3Dy
>>> CONFIG_PNP_DEBUG_MESSAGES=3Dy
>>> =

>>> #
>>> # Protocols
>>> #
>>> CONFIG_ISAPNP=3Dy
>>> # CONFIG_PNPBIOS is not set
>>> CONFIG_PNPACPI=3Dy
>>> =

>>> #
>>> # Misc devices
>>> #
>>> CONFIG_SENSORS_LIS3LV02D=3Dy
>>> CONFIG_AD525X_DPOT=3Dy
>>> CONFIG_AD525X_DPOT_I2C=3Dy
>>> # CONFIG_DUMMY_IRQ is not set
>>> # CONFIG_IBM_ASM is not set
>>> CONFIG_PHANTOM=3Dy
>>> # CONFIG_SGI_IOC4 is not set
>>> CONFIG_TIFM_CORE=3Dy
>>> CONFIG_TIFM_7XX1=3Dy
>>> CONFIG_ICS932S401=3Dy
>>> CONFIG_ENCLOSURE_SERVICES=3Dy
>>> CONFIG_CS5535_MFGPT=3Dy
>>> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
>>> CONFIG_CS5535_CLOCK_EVENT_SRC=3Dy
>>> CONFIG_HP_ILO=3Dy
>>> CONFIG_APDS9802ALS=3Dy
>>> CONFIG_ISL29003=3Dy
>>> CONFIG_ISL29020=3Dy
>>> # CONFIG_SENSORS_TSL2550 is not set
>>> # CONFIG_SENSORS_BH1780 is not set
>>> # CONFIG_SENSORS_BH1770 is not set
>>> # CONFIG_SENSORS_APDS990X is not set
>>> CONFIG_HMC6352=3Dy
>>> CONFIG_DS1682=3Dy
>>> CONFIG_VMWARE_BALLOON=3Dy
>>> # CONFIG_BMP085_I2C is not set
>>> # CONFIG_PCH_PHUB is not set
>>> CONFIG_USB_SWITCH_FSA9480=3Dy
>>> CONFIG_SRAM=3Dy
>>> # CONFIG_C2PORT is not set
>>> =

>>> #
>>> # EEPROM support
>>> #
>>> # CONFIG_EEPROM_AT24 is not set
>>> CONFIG_EEPROM_LEGACY=3Dy
>>> # CONFIG_EEPROM_MAX6875 is not set
>>> CONFIG_EEPROM_93CX6=3Dy
>>> CONFIG_CB710_CORE=3Dy
>>> CONFIG_CB710_DEBUG=3Dy
>>> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>>> =

>>> #
>>> # Texas Instruments shared transport line discipline
>>> #
>>> # CONFIG_TI_ST is not set
>>> CONFIG_SENSORS_LIS3_I2C=3Dy
>>> =

>>> #
>>> # Altera FPGA firmware download module
>>> #
>>> CONFIG_ALTERA_STAPL=3Dy
>>> CONFIG_INTEL_MEI=3Dy
>>> CONFIG_INTEL_MEI_ME=3Dy
>>> CONFIG_INTEL_MEI_TXE=3Dy
>>> CONFIG_VMWARE_VMCI=3Dy
>>> =

>>> #
>>> # Intel MIC Bus Driver
>>> #
>>> =

>>> #
>>> # SCIF Bus Driver
>>> #
>>> =

>>> #
>>> # VOP Bus Driver
>>> #
>>> =

>>> #
>>> # Intel MIC Host Driver
>>> #
>>> =

>>> #
>>> # Intel MIC Card Driver
>>> #
>>> =

>>> #
>>> # SCIF Driver
>>> #
>>> =

>>> #
>>> # Intel MIC Coprocessor State Management (COSM) Drivers
>>> #
>>> =

>>> #
>>> # VOP Driver
>>> #
>>> # CONFIG_ECHO is not set
>>> # CONFIG_CXL_BASE is not set
>>> # CONFIG_CXL_AFU_DRIVER_OPS is not set
>>> CONFIG_HAVE_IDE=3Dy
>>> =

>>> #
>>> # SCSI device support
>>> #
>>> CONFIG_SCSI_MOD=3Dy
>>> # CONFIG_SCSI_DMA is not set
>>> # CONFIG_SCSI_NETLINK is not set
>>> CONFIG_FUSION=3Dy
>>> CONFIG_FUSION_MAX_SGE=3D128
>>> # CONFIG_FUSION_LOGGING is not set
>>> =

>>> #
>>> # IEEE 1394 (FireWire) support
>>> #
>>> CONFIG_FIREWIRE=3Dy
>>> CONFIG_FIREWIRE_OHCI=3Dy
>>> CONFIG_FIREWIRE_NOSY=3Dy
>>> # CONFIG_MACINTOSH_DRIVERS is not set
>>> # CONFIG_NETDEVICES is not set
>>> =

>>> #
>>> # Input device support
>>> #
>>> CONFIG_INPUT=3Dy
>>> CONFIG_INPUT_LEDS=3Dy
>>> CONFIG_INPUT_FF_MEMLESS=3Dy
>>> CONFIG_INPUT_POLLDEV=3Dy
>>> CONFIG_INPUT_SPARSEKMAP=3Dy
>>> CONFIG_INPUT_MATRIXKMAP=3Dy
>>> =

>>> #
>>> # Userland interfaces
>>> #
>>> CONFIG_INPUT_MOUSEDEV=3Dy
>>> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
>>> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
>>> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
>>> CONFIG_INPUT_JOYDEV=3Dy
>>> # CONFIG_INPUT_EVDEV is not set
>>> # CONFIG_INPUT_EVBUG is not set
>>> =

>>> #
>>> # Input Device Drivers
>>> #
>>> CONFIG_INPUT_KEYBOARD=3Dy
>>> # CONFIG_KEYBOARD_ADP5520 is not set
>>> # CONFIG_KEYBOARD_ADP5588 is not set
>>> # CONFIG_KEYBOARD_ADP5589 is not set
>>> CONFIG_KEYBOARD_ATKBD=3Dy
>>> # CONFIG_KEYBOARD_QT1070 is not set
>>> # CONFIG_KEYBOARD_QT2160 is not set
>>> # CONFIG_KEYBOARD_LKKBD is not set
>>> # CONFIG_KEYBOARD_GPIO is not set
>>> # CONFIG_KEYBOARD_GPIO_POLLED is not set
>>> # CONFIG_KEYBOARD_TCA6416 is not set
>>> # CONFIG_KEYBOARD_TCA8418 is not set
>>> # CONFIG_KEYBOARD_MATRIX is not set
>>> # CONFIG_KEYBOARD_LM8323 is not set
>>> # CONFIG_KEYBOARD_LM8333 is not set
>>> # CONFIG_KEYBOARD_MAX7359 is not set
>>> # CONFIG_KEYBOARD_MCS is not set
>>> # CONFIG_KEYBOARD_MPR121 is not set
>>> # CONFIG_KEYBOARD_NEWTON is not set
>>> # CONFIG_KEYBOARD_OPENCORES is not set
>>> # CONFIG_KEYBOARD_SAMSUNG is not set
>>> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
>>> # CONFIG_KEYBOARD_STOWAWAY is not set
>>> # CONFIG_KEYBOARD_SUNKBD is not set
>>> # CONFIG_KEYBOARD_OMAP4 is not set
>>> # CONFIG_KEYBOARD_TC3589X is not set
>>> # CONFIG_KEYBOARD_TWL4030 is not set
>>> # CONFIG_KEYBOARD_XTKBD is not set
>>> # CONFIG_KEYBOARD_CROS_EC is not set
>>> # CONFIG_KEYBOARD_CAP11XX is not set
>>> # CONFIG_KEYBOARD_BCM is not set
>>> # CONFIG_INPUT_MOUSE is not set
>>> CONFIG_INPUT_JOYSTICK=3Dy
>>> CONFIG_JOYSTICK_ANALOG=3Dy
>>> CONFIG_JOYSTICK_A3D=3Dy
>>> # CONFIG_JOYSTICK_ADI is not set
>>> CONFIG_JOYSTICK_COBRA=3Dy
>>> CONFIG_JOYSTICK_GF2K=3Dy
>>> CONFIG_JOYSTICK_GRIP=3Dy
>>> CONFIG_JOYSTICK_GRIP_MP=3Dy
>>> CONFIG_JOYSTICK_GUILLEMOT=3Dy
>>> CONFIG_JOYSTICK_INTERACT=3Dy
>>> CONFIG_JOYSTICK_SIDEWINDER=3Dy
>>> CONFIG_JOYSTICK_TMDC=3Dy
>>> CONFIG_JOYSTICK_IFORCE=3Dy
>>> CONFIG_JOYSTICK_IFORCE_USB=3Dy
>>> # CONFIG_JOYSTICK_IFORCE_232 is not set
>>> # CONFIG_JOYSTICK_WARRIOR is not set
>>> CONFIG_JOYSTICK_MAGELLAN=3Dy
>>> CONFIG_JOYSTICK_SPACEORB=3Dy
>>> CONFIG_JOYSTICK_SPACEBALL=3Dy
>>> CONFIG_JOYSTICK_STINGER=3Dy
>>> CONFIG_JOYSTICK_TWIDJOY=3Dy
>>> CONFIG_JOYSTICK_ZHENHUA=3Dy
>>> # CONFIG_JOYSTICK_AS5011 is not set
>>> CONFIG_JOYSTICK_JOYDUMP=3Dy
>>> CONFIG_JOYSTICK_XPAD=3Dy
>>> CONFIG_JOYSTICK_XPAD_FF=3Dy
>>> CONFIG_JOYSTICK_XPAD_LEDS=3Dy
>>> CONFIG_INPUT_TABLET=3Dy
>>> # CONFIG_TABLET_USB_ACECAD is not set
>>> # CONFIG_TABLET_USB_AIPTEK is not set
>>> CONFIG_TABLET_USB_GTCO=3Dy
>>> CONFIG_TABLET_USB_HANWANG=3Dy
>>> CONFIG_TABLET_USB_KBTAB=3Dy
>>> CONFIG_TABLET_USB_PEGASUS=3Dy
>>> # CONFIG_TABLET_SERIAL_WACOM4 is not set
>>> # CONFIG_INPUT_TOUCHSCREEN is not set
>>> CONFIG_INPUT_MISC=3Dy
>>> CONFIG_INPUT_88PM80X_ONKEY=3Dy
>>> CONFIG_INPUT_AD714X=3Dy
>>> # CONFIG_INPUT_AD714X_I2C is not set
>>> CONFIG_INPUT_ARIZONA_HAPTICS=3Dy
>>> CONFIG_INPUT_ATMEL_CAPTOUCH=3Dy
>>> # CONFIG_INPUT_BMA150 is not set
>>> CONFIG_INPUT_E3X0_BUTTON=3Dy
>>> # CONFIG_INPUT_PCSPKR is not set
>>> # CONFIG_INPUT_MC13783_PWRBUTTON is not set
>>> CONFIG_INPUT_MMA8450=3Dy
>>> # CONFIG_INPUT_MPU3050 is not set
>>> CONFIG_INPUT_APANEL=3Dy
>>> CONFIG_INPUT_GP2A=3Dy
>>> CONFIG_INPUT_GPIO_BEEPER=3Dy
>>> CONFIG_INPUT_GPIO_TILT_POLLED=3Dy
>>> CONFIG_INPUT_WISTRON_BTNS=3Dy
>>> CONFIG_INPUT_ATLAS_BTNS=3Dy
>>> # CONFIG_INPUT_ATI_REMOTE2 is not set
>>> CONFIG_INPUT_KEYSPAN_REMOTE=3Dy
>>> # CONFIG_INPUT_KXTJ9 is not set
>>> CONFIG_INPUT_POWERMATE=3Dy
>>> CONFIG_INPUT_YEALINK=3Dy
>>> CONFIG_INPUT_CM109=3Dy
>>> CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
>>> CONFIG_INPUT_RETU_PWRBUTTON=3Dy
>>> CONFIG_INPUT_TPS65218_PWRBUTTON=3Dy
>>> CONFIG_INPUT_AXP20X_PEK=3Dy
>>> CONFIG_INPUT_TWL4030_PWRBUTTON=3Dy
>>> # CONFIG_INPUT_TWL4030_VIBRA is not set
>>> # CONFIG_INPUT_TWL6040_VIBRA is not set
>>> CONFIG_INPUT_UINPUT=3Dy
>>> CONFIG_INPUT_PCF8574=3Dy
>>> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
>>> CONFIG_INPUT_DA9052_ONKEY=3Dy
>>> CONFIG_INPUT_DA9055_ONKEY=3Dy
>>> # CONFIG_INPUT_DA9063_ONKEY is not set
>>> CONFIG_INPUT_ADXL34X=3Dy
>>> CONFIG_INPUT_ADXL34X_I2C=3Dy
>>> CONFIG_INPUT_IMS_PCU=3Dy
>>> CONFIG_INPUT_CMA3000=3Dy
>>> # CONFIG_INPUT_CMA3000_I2C is not set
>>> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
>>> # CONFIG_INPUT_DRV260X_HAPTICS is not set
>>> CONFIG_INPUT_DRV2665_HAPTICS=3Dy
>>> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
>>> CONFIG_RMI4_CORE=3Dy
>>> # CONFIG_RMI4_I2C is not set
>>> CONFIG_RMI4_2D_SENSOR=3Dy
>>> CONFIG_RMI4_F11=3Dy
>>> # CONFIG_RMI4_F12 is not set
>>> # CONFIG_RMI4_F30 is not set
>>> =

>>> #
>>> # Hardware I/O ports
>>> #
>>> CONFIG_SERIO=3Dy
>>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>>> CONFIG_SERIO_I8042=3Dy
>>> CONFIG_SERIO_SERPORT=3Dy
>>> # CONFIG_SERIO_CT82C710 is not set
>>> CONFIG_SERIO_PCIPS2=3Dy
>>> CONFIG_SERIO_LIBPS2=3Dy
>>> # CONFIG_SERIO_RAW is not set
>>> # CONFIG_SERIO_ALTERA_PS2 is not set
>>> # CONFIG_SERIO_PS2MULT is not set
>>> CONFIG_SERIO_ARC_PS2=3Dy
>>> # CONFIG_SERIO_APBPS2 is not set
>>> # CONFIG_SERIO_OLPC_APSP is not set
>>> CONFIG_HYPERV_KEYBOARD=3Dy
>>> CONFIG_USERIO=3Dy
>>> CONFIG_GAMEPORT=3Dy
>>> CONFIG_GAMEPORT_NS558=3Dy
>>> CONFIG_GAMEPORT_L4=3Dy
>>> # CONFIG_GAMEPORT_EMU10K1 is not set
>>> # CONFIG_GAMEPORT_FM801 is not set
>>> =

>>> #
>>> # Character devices
>>> #
>>> CONFIG_TTY=3Dy
>>> # CONFIG_VT is not set
>>> CONFIG_UNIX98_PTYS=3Dy
>>> CONFIG_LEGACY_PTYS=3Dy
>>> CONFIG_LEGACY_PTY_COUNT=3D256
>>> CONFIG_SERIAL_NONSTANDARD=3Dy
>>> # CONFIG_ROCKETPORT is not set
>>> CONFIG_CYCLADES=3Dy
>>> # CONFIG_CYZ_INTR is not set
>>> CONFIG_MOXA_INTELLIO=3Dy
>>> CONFIG_MOXA_SMARTIO=3Dy
>>> CONFIG_SYNCLINK=3Dy
>>> CONFIG_SYNCLINKMP=3Dy
>>> # CONFIG_SYNCLINK_GT is not set
>>> # CONFIG_NOZOMI is not set
>>> CONFIG_ISI=3Dy
>>> CONFIG_N_HDLC=3Dy
>>> # CONFIG_N_GSM is not set
>>> # CONFIG_TRACE_SINK is not set
>>> # CONFIG_GOLDFISH_TTY is not set
>>> CONFIG_DEVMEM=3Dy
>>> CONFIG_DEVKMEM=3Dy
>>> =

>>> #
>>> # Serial drivers
>>> #
>>> CONFIG_SERIAL_EARLYCON=3Dy
>>> CONFIG_SERIAL_8250=3Dy
>>> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>>> CONFIG_SERIAL_8250_PNP=3Dy
>>> # CONFIG_SERIAL_8250_FINTEK is not set
>>> CONFIG_SERIAL_8250_CONSOLE=3Dy
>>> CONFIG_SERIAL_8250_PCI=3Dy
>>> CONFIG_SERIAL_8250_NR_UARTS=3D4
>>> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>>> # CONFIG_SERIAL_8250_EXTENDED is not set
>>> # CONFIG_SERIAL_8250_FSL is not set
>>> # CONFIG_SERIAL_8250_DW is not set
>>> CONFIG_SERIAL_8250_RT288X=3Dy
>>> CONFIG_SERIAL_8250_MID=3Dy
>>> CONFIG_SERIAL_8250_MOXA=3Dy
>>> CONFIG_SERIAL_OF_PLATFORM=3Dy
>>> =

>>> #
>>> # Non-8250 serial port support
>>> #
>>> # CONFIG_SERIAL_UARTLITE is not set
>>> CONFIG_SERIAL_CORE=3Dy
>>> CONFIG_SERIAL_CORE_CONSOLE=3Dy
>>> CONFIG_SERIAL_JSM=3Dy
>>> CONFIG_SERIAL_SCCNXP=3Dy
>>> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
>>> CONFIG_SERIAL_SC16IS7XX=3Dy
>>> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
>>> CONFIG_SERIAL_TIMBERDALE=3Dy
>>> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
>>> CONFIG_SERIAL_ALTERA_UART=3Dy
>>> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
>>> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
>>> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
>>> # CONFIG_SERIAL_PCH_UART is not set
>>> CONFIG_SERIAL_XILINX_PS_UART=3Dy
>>> CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
>>> # CONFIG_SERIAL_ARC is not set
>>> CONFIG_SERIAL_RP2=3Dy
>>> CONFIG_SERIAL_RP2_NR_UARTS=3D32
>>> # CONFIG_SERIAL_FSL_LPUART is not set
>>> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
>>> CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=3Dy
>>> # CONFIG_SERIAL_MEN_Z135 is not set
>>> CONFIG_SERIAL_MCTRL_GPIO=3Dy
>>> CONFIG_TTY_PRINTK=3Dy
>>> # CONFIG_VIRTIO_CONSOLE is not set
>>> CONFIG_IPMI_HANDLER=3Dy
>>> CONFIG_IPMI_PANIC_EVENT=3Dy
>>> # CONFIG_IPMI_PANIC_STRING is not set
>>> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
>>> CONFIG_IPMI_SI=3Dy
>>> CONFIG_IPMI_SSIF=3Dy
>>> # CONFIG_IPMI_WATCHDOG is not set
>>> CONFIG_IPMI_POWEROFF=3Dy
>>> CONFIG_HW_RANDOM=3Dy
>>> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
>>> # CONFIG_HW_RANDOM_INTEL is not set
>>> # CONFIG_HW_RANDOM_AMD is not set
>>> CONFIG_HW_RANDOM_GEODE=3Dy
>>> CONFIG_HW_RANDOM_VIA=3Dy
>>> CONFIG_HW_RANDOM_VIRTIO=3Dy
>>> CONFIG_NVRAM=3Dy
>>> # CONFIG_DTLK is not set
>>> CONFIG_R3964=3Dy
>>> CONFIG_APPLICOM=3Dy
>>> # CONFIG_SONYPI is not set
>>> CONFIG_MWAVE=3Dy
>>> CONFIG_SCx200_GPIO=3Dy
>>> CONFIG_PC8736x_GPIO=3Dy
>>> CONFIG_NSC_GPIO=3Dy
>>> CONFIG_HPET=3Dy
>>> CONFIG_HPET_MMAP=3Dy
>>> CONFIG_HPET_MMAP_DEFAULT=3Dy
>>> CONFIG_HANGCHECK_TIMER=3Dy
>>> # CONFIG_TCG_TPM is not set
>>> # CONFIG_TELCLOCK is not set
>>> CONFIG_DEVPORT=3Dy
>>> # CONFIG_XILLYBUS is not set
>>> =

>>> #
>>> # I2C support
>>> #
>>> CONFIG_I2C=3Dy
>>> # CONFIG_ACPI_I2C_OPREGION is not set
>>> CONFIG_I2C_BOARDINFO=3Dy
>>> # CONFIG_I2C_COMPAT is not set
>>> CONFIG_I2C_CHARDEV=3Dy
>>> CONFIG_I2C_MUX=3Dy
>>> =

>>> #
>>> # Multiplexer I2C Chip support
>>> #
>>> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
>>> CONFIG_I2C_MUX_GPIO=3Dy
>>> CONFIG_I2C_MUX_PCA9541=3Dy
>>> # CONFIG_I2C_MUX_PCA954x is not set
>>> CONFIG_I2C_MUX_PINCTRL=3Dy
>>> CONFIG_I2C_MUX_REG=3Dy
>>> CONFIG_I2C_DEMUX_PINCTRL=3Dy
>>> # CONFIG_I2C_HELPER_AUTO is not set
>>> CONFIG_I2C_SMBUS=3Dy
>>> =

>>> #
>>> # I2C Algorithms
>>> #
>>> CONFIG_I2C_ALGOBIT=3Dy
>>> CONFIG_I2C_ALGOPCF=3Dy
>>> CONFIG_I2C_ALGOPCA=3Dy
>>> =

>>> #
>>> # I2C Hardware Bus support
>>> #
>>> =

>>> #
>>> # PC SMBus host controller drivers
>>> #
>>> CONFIG_I2C_ALI1535=3Dy
>>> CONFIG_I2C_ALI1563=3Dy
>>> # CONFIG_I2C_ALI15X3 is not set
>>> # CONFIG_I2C_AMD756 is not set
>>> # CONFIG_I2C_AMD8111 is not set
>>> CONFIG_I2C_I801=3Dy
>>> CONFIG_I2C_ISCH=3Dy
>>> CONFIG_I2C_ISMT=3Dy
>>> # CONFIG_I2C_PIIX4 is not set
>>> CONFIG_I2C_NFORCE2=3Dy
>>> CONFIG_I2C_NFORCE2_S4985=3Dy
>>> # CONFIG_I2C_SIS5595 is not set
>>> CONFIG_I2C_SIS630=3Dy
>>> CONFIG_I2C_SIS96X=3Dy
>>> CONFIG_I2C_VIA=3Dy
>>> CONFIG_I2C_VIAPRO=3Dy
>>> =

>>> #
>>> # ACPI drivers
>>> #
>>> CONFIG_I2C_SCMI=3Dy
>>> =

>>> #
>>> # I2C system bus drivers (mostly embedded / system-on-chip)
>>> #
>>> CONFIG_I2C_CBUS_GPIO=3Dy
>>> CONFIG_I2C_DESIGNWARE_CORE=3Dy
>>> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
>>> CONFIG_I2C_DESIGNWARE_PCI=3Dy
>>> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
>>> # CONFIG_I2C_EG20T is not set
>>> # CONFIG_I2C_EMEV2 is not set
>>> CONFIG_I2C_GPIO=3Dy
>>> CONFIG_I2C_OCORES=3Dy
>>> CONFIG_I2C_PCA_PLATFORM=3Dy
>>> CONFIG_I2C_PXA=3Dy
>>> CONFIG_I2C_PXA_PCI=3Dy
>>> CONFIG_I2C_RK3X=3Dy
>>> CONFIG_I2C_SIMTEC=3Dy
>>> # CONFIG_I2C_XILINX is not set
>>> =

>>> #
>>> # External I2C/SMBus adapter drivers
>>> #
>>> # CONFIG_I2C_DIOLAN_U2C is not set
>>> CONFIG_I2C_DLN2=3Dy
>>> CONFIG_I2C_PARPORT_LIGHT=3Dy
>>> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
>>> CONFIG_I2C_TAOS_EVM=3Dy
>>> CONFIG_I2C_TINY_USB=3Dy
>>> CONFIG_I2C_VIPERBOARD=3Dy
>>> =

>>> #
>>> # Other I2C/SMBus bus drivers
>>> #
>>> CONFIG_I2C_PCA_ISA=3Dy
>>> # CONFIG_I2C_CROS_EC_TUNNEL is not set
>>> # CONFIG_SCx200_ACB is not set
>>> # CONFIG_I2C_SLAVE is not set
>>> # CONFIG_I2C_DEBUG_CORE is not set
>>> # CONFIG_I2C_DEBUG_ALGO is not set
>>> # CONFIG_I2C_DEBUG_BUS is not set
>>> # CONFIG_SPI is not set
>>> CONFIG_SPMI=3Dy
>>> CONFIG_HSI=3Dy
>>> CONFIG_HSI_BOARDINFO=3Dy
>>> =

>>> #
>>> # HSI controllers
>>> #
>>> =

>>> #
>>> # HSI clients
>>> #
>>> CONFIG_HSI_CHAR=3Dy
>>> =

>>> #
>>> # PPS support
>>> #
>>> CONFIG_PPS=3Dy
>>> # CONFIG_PPS_DEBUG is not set
>>> =

>>> #
>>> # PPS clients support
>>> #
>>> CONFIG_PPS_CLIENT_KTIMER=3Dy
>>> # CONFIG_PPS_CLIENT_LDISC is not set
>>> # CONFIG_PPS_CLIENT_GPIO is not set
>>> =

>>> #
>>> # PPS generators support
>>> #
>>> =

>>> #
>>> # PTP clock support
>>> #
>>> # CONFIG_PTP_1588_CLOCK is not set
>>> =

>>> #
>>> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
>>> #
>>> # CONFIG_PTP_1588_CLOCK_PCH is not set
>>> CONFIG_PINCTRL=3Dy
>>> =

>>> #
>>> # Pin controllers
>>> #
>>> CONFIG_PINMUX=3Dy
>>> CONFIG_PINCONF=3Dy
>>> CONFIG_GENERIC_PINCONF=3Dy
>>> # CONFIG_DEBUG_PINCTRL is not set
>>> CONFIG_PINCTRL_AS3722=3Dy
>>> CONFIG_PINCTRL_AMD=3Dy
>>> CONFIG_PINCTRL_SINGLE=3Dy
>>> CONFIG_PINCTRL_BAYTRAIL=3Dy
>>> CONFIG_PINCTRL_CHERRYVIEW=3Dy
>>> CONFIG_PINCTRL_INTEL=3Dy
>>> CONFIG_PINCTRL_BROXTON=3Dy
>>> CONFIG_PINCTRL_SUNRISEPOINT=3Dy
>>> CONFIG_GPIOLIB=3Dy
>>> CONFIG_GPIO_DEVRES=3Dy
>>> CONFIG_OF_GPIO=3Dy
>>> CONFIG_GPIO_ACPI=3Dy
>>> CONFIG_GPIOLIB_IRQCHIP=3Dy
>>> CONFIG_DEBUG_GPIO=3Dy
>>> CONFIG_GPIO_SYSFS=3Dy
>>> CONFIG_GPIO_GENERIC=3Dy
>>> =

>>> #
>>> # Memory mapped GPIO drivers
>>> #
>>> # CONFIG_GPIO_74XX_MMIO is not set
>>> # CONFIG_GPIO_ALTERA is not set
>>> # CONFIG_GPIO_AMDPT is not set
>>> CONFIG_GPIO_DWAPB=3Dy
>>> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
>>> CONFIG_GPIO_GRGPIO=3Dy
>>> CONFIG_GPIO_ICH=3Dy
>>> CONFIG_GPIO_LYNXPOINT=3Dy
>>> CONFIG_GPIO_MENZ127=3Dy
>>> CONFIG_GPIO_SYSCON=3Dy
>>> CONFIG_GPIO_VX855=3Dy
>>> CONFIG_GPIO_XILINX=3Dy
>>> # CONFIG_GPIO_ZX is not set
>>> =

>>> #
>>> # Port-mapped I/O GPIO drivers
>>> #
>>> # CONFIG_GPIO_104_DIO_48E is not set
>>> CONFIG_GPIO_104_IDIO_16=3Dy
>>> # CONFIG_GPIO_104_IDI_48 is not set
>>> CONFIG_GPIO_F7188X=3Dy
>>> CONFIG_GPIO_IT87=3Dy
>>> CONFIG_GPIO_SCH=3Dy
>>> # CONFIG_GPIO_SCH311X is not set
>>> CONFIG_GPIO_WS16C48=3Dy
>>> =

>>> #
>>> # I2C GPIO expanders
>>> #
>>> # CONFIG_GPIO_ADP5588 is not set
>>> CONFIG_GPIO_ADNP=3Dy
>>> # CONFIG_GPIO_MAX7300 is not set
>>> CONFIG_GPIO_MAX732X=3Dy
>>> # CONFIG_GPIO_MAX732X_IRQ is not set
>>> CONFIG_GPIO_PCA953X=3Dy
>>> CONFIG_GPIO_PCA953X_IRQ=3Dy
>>> # CONFIG_GPIO_PCF857X is not set
>>> # CONFIG_GPIO_SX150X is not set
>>> CONFIG_GPIO_TPIC2810=3Dy
>>> =

>>> #
>>> # MFD GPIO expanders
>>> #
>>> CONFIG_GPIO_ADP5520=3Dy
>>> # CONFIG_GPIO_ARIZONA is not set
>>> CONFIG_GPIO_CRYSTAL_COVE=3Dy
>>> # CONFIG_GPIO_CS5535 is not set
>>> CONFIG_GPIO_DA9052=3Dy
>>> # CONFIG_GPIO_DA9055 is not set
>>> CONFIG_GPIO_DLN2=3Dy
>>> CONFIG_GPIO_JANZ_TTL=3Dy
>>> # CONFIG_GPIO_TC3589X is not set
>>> CONFIG_GPIO_TIMBERDALE=3Dy
>>> CONFIG_GPIO_TPS65086=3Dy
>>> # CONFIG_GPIO_TPS65218 is not set
>>> CONFIG_GPIO_TWL4030=3Dy
>>> CONFIG_GPIO_TWL6040=3Dy
>>> CONFIG_GPIO_UCB1400=3Dy
>>> # CONFIG_GPIO_WM8350 is not set
>>> # CONFIG_GPIO_WM8994 is not set
>>> =

>>> #
>>> # PCI GPIO expanders
>>> #
>>> CONFIG_GPIO_AMD8111=3Dy
>>> CONFIG_GPIO_BT8XX=3Dy
>>> CONFIG_GPIO_ML_IOH=3Dy
>>> CONFIG_GPIO_PCH=3Dy
>>> # CONFIG_GPIO_RDC321X is not set
>>> # CONFIG_GPIO_SODAVILLE is not set
>>> =

>>> #
>>> # SPI or I2C GPIO expanders
>>> #
>>> CONFIG_GPIO_MCP23S08=3Dy
>>> =

>>> #
>>> # USB GPIO expanders
>>> #
>>> CONFIG_GPIO_VIPERBOARD=3Dy
>>> CONFIG_W1=3Dy
>>> =

>>> #
>>> # 1-wire Bus Masters
>>> #
>>> # CONFIG_W1_MASTER_MATROX is not set
>>> CONFIG_W1_MASTER_DS2490=3Dy
>>> # CONFIG_W1_MASTER_DS2482 is not set
>>> CONFIG_W1_MASTER_DS1WM=3Dy
>>> CONFIG_W1_MASTER_GPIO=3Dy
>>> =

>>> #
>>> # 1-wire Slaves
>>> #
>>> CONFIG_W1_SLAVE_THERM=3Dy
>>> CONFIG_W1_SLAVE_SMEM=3Dy
>>> CONFIG_W1_SLAVE_DS2408=3Dy
>>> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
>>> CONFIG_W1_SLAVE_DS2413=3Dy
>>> # CONFIG_W1_SLAVE_DS2406 is not set
>>> CONFIG_W1_SLAVE_DS2423=3Dy
>>> CONFIG_W1_SLAVE_DS2431=3Dy
>>> # CONFIG_W1_SLAVE_DS2433 is not set
>>> # CONFIG_W1_SLAVE_DS2760 is not set
>>> # CONFIG_W1_SLAVE_DS2780 is not set
>>> # CONFIG_W1_SLAVE_DS2781 is not set
>>> CONFIG_W1_SLAVE_DS28E04=3Dy
>>> CONFIG_W1_SLAVE_BQ27000=3Dy
>>> CONFIG_POWER_SUPPLY=3Dy
>>> # CONFIG_POWER_SUPPLY_DEBUG is not set
>>> CONFIG_PDA_POWER=3Dy
>>> CONFIG_GENERIC_ADC_BATTERY=3Dy
>>> CONFIG_WM8350_POWER=3Dy
>>> # CONFIG_TEST_POWER is not set
>>> # CONFIG_BATTERY_DS2780 is not set
>>> # CONFIG_BATTERY_DS2781 is not set
>>> # CONFIG_BATTERY_DS2782 is not set
>>> CONFIG_BATTERY_OLPC=3Dy
>>> # CONFIG_BATTERY_SBS is not set
>>> # CONFIG_BATTERY_BQ27XXX is not set
>>> CONFIG_BATTERY_DA9052=3Dy
>>> # CONFIG_AXP288_CHARGER is not set
>>> CONFIG_AXP288_FUEL_GAUGE=3Dy
>>> CONFIG_BATTERY_MAX17040=3Dy
>>> # CONFIG_BATTERY_MAX17042 is not set
>>> # CONFIG_BATTERY_TWL4030_MADC is not set
>>> CONFIG_BATTERY_RX51=3Dy
>>> CONFIG_CHARGER_ISP1704=3Dy
>>> CONFIG_CHARGER_MAX8903=3Dy
>>> CONFIG_CHARGER_TWL4030=3Dy
>>> CONFIG_CHARGER_LP8727=3Dy
>>> CONFIG_CHARGER_LP8788=3Dy
>>> CONFIG_CHARGER_GPIO=3Dy
>>> # CONFIG_CHARGER_MANAGER is not set
>>> CONFIG_CHARGER_MAX14577=3Dy
>>> # CONFIG_CHARGER_MAX77693 is not set
>>> CONFIG_CHARGER_MAX8998=3Dy
>>> CONFIG_CHARGER_BQ2415X=3Dy
>>> CONFIG_CHARGER_BQ24190=3Dy
>>> CONFIG_CHARGER_BQ24257=3Dy
>>> CONFIG_CHARGER_BQ24735=3Dy
>>> CONFIG_CHARGER_BQ25890=3Dy
>>> CONFIG_CHARGER_SMB347=3Dy
>>> CONFIG_CHARGER_TPS65090=3Dy
>>> # CONFIG_CHARGER_TPS65217 is not set
>>> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
>>> CONFIG_BATTERY_GOLDFISH=3Dy
>>> CONFIG_CHARGER_RT9455=3Dy
>>> CONFIG_AXP20X_POWER=3Dy
>>> # CONFIG_POWER_RESET is not set
>>> # CONFIG_POWER_AVS is not set
>>> CONFIG_HWMON=3Dy
>>> CONFIG_HWMON_VID=3Dy
>>> CONFIG_HWMON_DEBUG_CHIP=3Dy
>>> =

>>> #
>>> # Native drivers
>>> #
>>> CONFIG_SENSORS_ABITUGURU=3Dy
>>> CONFIG_SENSORS_ABITUGURU3=3Dy
>>> CONFIG_SENSORS_AD7414=3Dy
>>> # CONFIG_SENSORS_AD7418 is not set
>>> # CONFIG_SENSORS_ADM1021 is not set
>>> # CONFIG_SENSORS_ADM1025 is not set
>>> CONFIG_SENSORS_ADM1026=3Dy
>>> CONFIG_SENSORS_ADM1029=3Dy
>>> CONFIG_SENSORS_ADM1031=3Dy
>>> CONFIG_SENSORS_ADM9240=3Dy
>>> CONFIG_SENSORS_ADT7X10=3Dy
>>> CONFIG_SENSORS_ADT7410=3Dy
>>> # CONFIG_SENSORS_ADT7411 is not set
>>> # CONFIG_SENSORS_ADT7462 is not set
>>> CONFIG_SENSORS_ADT7470=3Dy
>>> CONFIG_SENSORS_ADT7475=3Dy
>>> CONFIG_SENSORS_ASC7621=3Dy
>>> CONFIG_SENSORS_K8TEMP=3Dy
>>> # CONFIG_SENSORS_K10TEMP is not set
>>> CONFIG_SENSORS_FAM15H_POWER=3Dy
>>> # CONFIG_SENSORS_APPLESMC is not set
>>> CONFIG_SENSORS_ARM_SCPI=3Dy
>>> # CONFIG_SENSORS_ASB100 is not set
>>> CONFIG_SENSORS_ATXP1=3Dy
>>> CONFIG_SENSORS_DS620=3Dy
>>> # CONFIG_SENSORS_DS1621 is not set
>>> CONFIG_SENSORS_DELL_SMM=3Dy
>>> CONFIG_SENSORS_DA9052_ADC=3Dy
>>> CONFIG_SENSORS_DA9055=3Dy
>>> CONFIG_SENSORS_I5K_AMB=3Dy
>>> CONFIG_SENSORS_F71805F=3Dy
>>> CONFIG_SENSORS_F71882FG=3Dy
>>> # CONFIG_SENSORS_F75375S is not set
>>> CONFIG_SENSORS_MC13783_ADC=3Dy
>>> # CONFIG_SENSORS_FSCHMD is not set
>>> CONFIG_SENSORS_FTSTEUTATES=3Dy
>>> CONFIG_SENSORS_GL518SM=3Dy
>>> # CONFIG_SENSORS_GL520SM is not set
>>> CONFIG_SENSORS_G760A=3Dy
>>> CONFIG_SENSORS_G762=3Dy
>>> # CONFIG_SENSORS_GPIO_FAN is not set
>>> CONFIG_SENSORS_HIH6130=3Dy
>>> CONFIG_SENSORS_IBMAEM=3Dy
>>> # CONFIG_SENSORS_IBMPEX is not set
>>> CONFIG_SENSORS_IIO_HWMON=3Dy
>>> CONFIG_SENSORS_I5500=3Dy
>>> # CONFIG_SENSORS_CORETEMP is not set
>>> CONFIG_SENSORS_IT87=3Dy
>>> CONFIG_SENSORS_JC42=3Dy
>>> CONFIG_SENSORS_POWR1220=3Dy
>>> CONFIG_SENSORS_LINEAGE=3Dy
>>> CONFIG_SENSORS_LTC2945=3Dy
>>> CONFIG_SENSORS_LTC2990=3Dy
>>> # CONFIG_SENSORS_LTC4151 is not set
>>> CONFIG_SENSORS_LTC4215=3Dy
>>> CONFIG_SENSORS_LTC4222=3Dy
>>> CONFIG_SENSORS_LTC4245=3Dy
>>> CONFIG_SENSORS_LTC4260=3Dy
>>> CONFIG_SENSORS_LTC4261=3Dy
>>> CONFIG_SENSORS_MAX16065=3Dy
>>> CONFIG_SENSORS_MAX1619=3Dy
>>> # CONFIG_SENSORS_MAX1668 is not set
>>> # CONFIG_SENSORS_MAX197 is not set
>>> CONFIG_SENSORS_MAX6639=3Dy
>>> CONFIG_SENSORS_MAX6642=3Dy
>>> CONFIG_SENSORS_MAX6650=3Dy
>>> CONFIG_SENSORS_MAX6697=3Dy
>>> CONFIG_SENSORS_MAX31790=3Dy
>>> CONFIG_SENSORS_MCP3021=3Dy
>>> # CONFIG_SENSORS_LM63 is not set
>>> CONFIG_SENSORS_LM73=3Dy
>>> CONFIG_SENSORS_LM75=3Dy
>>> CONFIG_SENSORS_LM77=3Dy
>>> CONFIG_SENSORS_LM78=3Dy
>>> CONFIG_SENSORS_LM80=3Dy
>>> CONFIG_SENSORS_LM83=3Dy
>>> CONFIG_SENSORS_LM85=3Dy
>>> # CONFIG_SENSORS_LM87 is not set
>>> CONFIG_SENSORS_LM90=3Dy
>>> CONFIG_SENSORS_LM92=3Dy
>>> CONFIG_SENSORS_LM93=3Dy
>>> CONFIG_SENSORS_LM95234=3Dy
>>> CONFIG_SENSORS_LM95241=3Dy
>>> # CONFIG_SENSORS_LM95245 is not set
>>> CONFIG_SENSORS_PC87360=3Dy
>>> CONFIG_SENSORS_PC87427=3Dy
>>> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
>>> CONFIG_SENSORS_NCT6683=3Dy
>>> # CONFIG_SENSORS_NCT6775 is not set
>>> CONFIG_SENSORS_NCT7802=3Dy
>>> # CONFIG_SENSORS_NCT7904 is not set
>>> CONFIG_SENSORS_PCF8591=3Dy
>>> # CONFIG_PMBUS is not set
>>> # CONFIG_SENSORS_SHT15 is not set
>>> CONFIG_SENSORS_SHT21=3Dy
>>> CONFIG_SENSORS_SHT3x=3Dy
>>> CONFIG_SENSORS_SHTC1=3Dy
>>> # CONFIG_SENSORS_SIS5595 is not set
>>> CONFIG_SENSORS_DME1737=3Dy
>>> CONFIG_SENSORS_EMC1403=3Dy
>>> # CONFIG_SENSORS_EMC2103 is not set
>>> CONFIG_SENSORS_EMC6W201=3Dy
>>> # CONFIG_SENSORS_SMSC47M1 is not set
>>> # CONFIG_SENSORS_SMSC47M192 is not set
>>> CONFIG_SENSORS_SMSC47B397=3Dy
>>> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
>>> CONFIG_SENSORS_SCH5627=3Dy
>>> CONFIG_SENSORS_SCH5636=3Dy
>>> # CONFIG_SENSORS_SMM665 is not set
>>> CONFIG_SENSORS_ADC128D818=3Dy
>>> CONFIG_SENSORS_ADS1015=3Dy
>>> # CONFIG_SENSORS_ADS7828 is not set
>>> CONFIG_SENSORS_AMC6821=3Dy
>>> # CONFIG_SENSORS_INA209 is not set
>>> CONFIG_SENSORS_INA2XX=3Dy
>>> CONFIG_SENSORS_INA3221=3Dy
>>> # CONFIG_SENSORS_TC74 is not set
>>> CONFIG_SENSORS_THMC50=3Dy
>>> # CONFIG_SENSORS_TMP102 is not set
>>> # CONFIG_SENSORS_TMP103 is not set
>>> CONFIG_SENSORS_TMP401=3Dy
>>> # CONFIG_SENSORS_TMP421 is not set
>>> CONFIG_SENSORS_TWL4030_MADC=3Dy
>>> # CONFIG_SENSORS_VIA_CPUTEMP is not set
>>> CONFIG_SENSORS_VIA686A=3Dy
>>> CONFIG_SENSORS_VT1211=3Dy
>>> # CONFIG_SENSORS_VT8231 is not set
>>> CONFIG_SENSORS_W83781D=3Dy
>>> CONFIG_SENSORS_W83791D=3Dy
>>> CONFIG_SENSORS_W83792D=3Dy
>>> CONFIG_SENSORS_W83793=3Dy
>>> CONFIG_SENSORS_W83795=3Dy
>>> CONFIG_SENSORS_W83795_FANCTRL=3Dy
>>> CONFIG_SENSORS_W83L785TS=3Dy
>>> CONFIG_SENSORS_W83L786NG=3Dy
>>> CONFIG_SENSORS_W83627HF=3Dy
>>> # CONFIG_SENSORS_W83627EHF is not set
>>> CONFIG_SENSORS_WM8350=3Dy
>>> =

>>> #
>>> # ACPI drivers
>>> #
>>> CONFIG_SENSORS_ACPI_POWER=3Dy
>>> CONFIG_SENSORS_ATK0110=3Dy
>>> CONFIG_THERMAL=3Dy
>>> CONFIG_THERMAL_HWMON=3Dy
>>> # CONFIG_THERMAL_OF is not set
>>> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
>>> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
>>> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
>>> CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=3Dy
>>> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
>>> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
>>> # CONFIG_THERMAL_GOV_STEP_WISE is not set
>>> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
>>> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
>>> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
>>> # CONFIG_CLOCK_THERMAL is not set
>>> # CONFIG_DEVFREQ_THERMAL is not set
>>> CONFIG_THERMAL_EMULATION=3Dy
>>> # CONFIG_INTEL_POWERCLAMP is not set
>>> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
>>> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
>>> =

>>> #
>>> # ACPI INT340X thermal drivers
>>> #
>>> # CONFIG_INT340X_THERMAL is not set
>>> # CONFIG_INTEL_PCH_THERMAL is not set
>>> CONFIG_QCOM_SPMI_TEMP_ALARM=3Dy
>>> # CONFIG_GENERIC_ADC_THERMAL is not set
>>> CONFIG_WATCHDOG=3Dy
>>> CONFIG_WATCHDOG_CORE=3Dy
>>> # CONFIG_WATCHDOG_NOWAYOUT is not set
>>> # CONFIG_WATCHDOG_SYSFS is not set
>>> =

>>> #
>>> # Watchdog Device Drivers
>>> #
>>> CONFIG_SOFT_WATCHDOG=3Dy
>>> CONFIG_DA9052_WATCHDOG=3Dy
>>> # CONFIG_DA9055_WATCHDOG is not set
>>> # CONFIG_DA9063_WATCHDOG is not set
>>> CONFIG_GPIO_WATCHDOG=3Dy
>>> # CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
>>> CONFIG_WM8350_WATCHDOG=3Dy
>>> CONFIG_XILINX_WATCHDOG=3Dy
>>> CONFIG_ZIIRAVE_WATCHDOG=3Dy
>>> CONFIG_CADENCE_WATCHDOG=3Dy
>>> # CONFIG_DW_WATCHDOG is not set
>>> CONFIG_TWL4030_WATCHDOG=3Dy
>>> CONFIG_MAX63XX_WATCHDOG=3Dy
>>> # CONFIG_RETU_WATCHDOG is not set
>>> CONFIG_ACQUIRE_WDT=3Dy
>>> CONFIG_ADVANTECH_WDT=3Dy
>>> # CONFIG_ALIM1535_WDT is not set
>>> # CONFIG_ALIM7101_WDT is not set
>>> CONFIG_EBC_C384_WDT=3Dy
>>> # CONFIG_F71808E_WDT is not set
>>> # CONFIG_SP5100_TCO is not set
>>> # CONFIG_GEODE_WDT is not set
>>> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
>>> # CONFIG_EUROTECH_WDT is not set
>>> # CONFIG_IB700_WDT is not set
>>> # CONFIG_IBMASR is not set
>>> CONFIG_WAFER_WDT=3Dy
>>> # CONFIG_I6300ESB_WDT is not set
>>> CONFIG_IE6XX_WDT=3Dy
>>> CONFIG_ITCO_WDT=3Dy
>>> # CONFIG_ITCO_VENDOR_SUPPORT is not set
>>> # CONFIG_IT8712F_WDT is not set
>>> # CONFIG_IT87_WDT is not set
>>> CONFIG_HP_WATCHDOG=3Dy
>>> # CONFIG_HPWDT_NMI_DECODING is not set
>>> CONFIG_SC1200_WDT=3Dy
>>> # CONFIG_SCx200_WDT is not set
>>> CONFIG_PC87413_WDT=3Dy
>>> # CONFIG_NV_TCO is not set
>>> CONFIG_60XX_WDT=3Dy
>>> CONFIG_SBC8360_WDT=3Dy
>>> CONFIG_SBC7240_WDT=3Dy
>>> # CONFIG_CPU5_WDT is not set
>>> # CONFIG_SMSC_SCH311X_WDT is not set
>>> CONFIG_SMSC37B787_WDT=3Dy
>>> # CONFIG_VIA_WDT is not set
>>> # CONFIG_W83627HF_WDT is not set
>>> CONFIG_W83877F_WDT=3Dy
>>> CONFIG_W83977F_WDT=3Dy
>>> CONFIG_MACHZ_WDT=3Dy
>>> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
>>> CONFIG_INTEL_MEI_WDT=3Dy
>>> # CONFIG_NI903X_WDT is not set
>>> CONFIG_MEN_A21_WDT=3Dy
>>> =

>>> #
>>> # ISA-based Watchdog Cards
>>> #
>>> CONFIG_PCWATCHDOG=3Dy
>>> CONFIG_MIXCOMWD=3Dy
>>> # CONFIG_WDT is not set
>>> =

>>> #
>>> # PCI-based Watchdog Cards
>>> #
>>> CONFIG_PCIPCWATCHDOG=3Dy
>>> CONFIG_WDTPCI=3Dy
>>> =

>>> #
>>> # USB-based Watchdog Cards
>>> #
>>> CONFIG_USBPCWATCHDOG=3Dy
>>> CONFIG_SSB_POSSIBLE=3Dy
>>> =

>>> #
>>> # Sonics Silicon Backplane
>>> #
>>> CONFIG_SSB=3Dy
>>> CONFIG_SSB_SPROM=3Dy
>>> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
>>> CONFIG_SSB_PCIHOST=3Dy
>>> # CONFIG_SSB_B43_PCI_BRIDGE is not set
>>> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
>>> CONFIG_SSB_SDIOHOST=3Dy
>>> CONFIG_SSB_SILENT=3Dy
>>> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
>>> CONFIG_SSB_DRIVER_PCICORE=3Dy
>>> CONFIG_SSB_DRIVER_GPIO=3Dy
>>> CONFIG_BCMA_POSSIBLE=3Dy
>>> =

>>> #
>>> # Broadcom specific AMBA
>>> #
>>> # CONFIG_BCMA is not set
>>> =

>>> #
>>> # Multifunction device drivers
>>> #
>>> CONFIG_MFD_CORE=3Dy
>>> CONFIG_MFD_CS5535=3Dy
>>> # CONFIG_MFD_ACT8945A is not set
>>> CONFIG_MFD_AS3711=3Dy
>>> CONFIG_MFD_AS3722=3Dy
>>> CONFIG_PMIC_ADP5520=3Dy
>>> # CONFIG_MFD_AAT2870_CORE is not set
>>> CONFIG_MFD_ATMEL_FLEXCOM=3Dy
>>> CONFIG_MFD_ATMEL_HLCDC=3Dy
>>> CONFIG_MFD_BCM590XX=3Dy
>>> CONFIG_MFD_AXP20X=3Dy
>>> CONFIG_MFD_AXP20X_I2C=3Dy
>>> CONFIG_MFD_CROS_EC=3Dy
>>> # CONFIG_MFD_CROS_EC_I2C is not set
>>> # CONFIG_PMIC_DA903X is not set
>>> CONFIG_PMIC_DA9052=3Dy
>>> CONFIG_MFD_DA9052_I2C=3Dy
>>> CONFIG_MFD_DA9055=3Dy
>>> # CONFIG_MFD_DA9062 is not set
>>> CONFIG_MFD_DA9063=3Dy
>>> # CONFIG_MFD_DA9150 is not set
>>> CONFIG_MFD_DLN2=3Dy
>>> CONFIG_MFD_MC13XXX=3Dy
>>> CONFIG_MFD_MC13XXX_I2C=3Dy
>>> CONFIG_MFD_HI6421_PMIC=3Dy
>>> CONFIG_HTC_PASIC3=3Dy
>>> # CONFIG_HTC_I2CPLD is not set
>>> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
>>> CONFIG_LPC_ICH=3Dy
>>> CONFIG_LPC_SCH=3Dy
>>> CONFIG_INTEL_SOC_PMIC=3Dy
>>> CONFIG_MFD_INTEL_LPSS=3Dy
>>> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
>>> # CONFIG_MFD_INTEL_LPSS_PCI is not set
>>> CONFIG_MFD_JANZ_CMODIO=3Dy
>>> # CONFIG_MFD_KEMPLD is not set
>>> CONFIG_MFD_88PM800=3Dy
>>> CONFIG_MFD_88PM805=3Dy
>>> # CONFIG_MFD_88PM860X is not set
>>> CONFIG_MFD_MAX14577=3Dy
>>> # CONFIG_MFD_MAX77620 is not set
>>> # CONFIG_MFD_MAX77686 is not set
>>> CONFIG_MFD_MAX77693=3Dy
>>> # CONFIG_MFD_MAX77843 is not set
>>> CONFIG_MFD_MAX8907=3Dy
>>> # CONFIG_MFD_MAX8925 is not set
>>> # CONFIG_MFD_MAX8997 is not set
>>> CONFIG_MFD_MAX8998=3Dy
>>> CONFIG_MFD_MT6397=3Dy
>>> # CONFIG_MFD_MENF21BMC is not set
>>> CONFIG_MFD_VIPERBOARD=3Dy
>>> CONFIG_MFD_RETU=3Dy
>>> # CONFIG_MFD_PCF50633 is not set
>>> CONFIG_UCB1400_CORE=3Dy
>>> # CONFIG_MFD_RDC321X is not set
>>> CONFIG_MFD_RTSX_PCI=3Dy
>>> # CONFIG_MFD_RT5033 is not set
>>> # CONFIG_MFD_RTSX_USB is not set
>>> # CONFIG_MFD_RC5T583 is not set
>>> CONFIG_MFD_RK808=3Dy
>>> # CONFIG_MFD_RN5T618 is not set
>>> CONFIG_MFD_SEC_CORE=3Dy
>>> CONFIG_MFD_SI476X_CORE=3Dy
>>> CONFIG_MFD_SM501=3Dy
>>> CONFIG_MFD_SM501_GPIO=3Dy
>>> CONFIG_MFD_SKY81452=3Dy
>>> CONFIG_MFD_SMSC=3Dy
>>> # CONFIG_ABX500_CORE is not set
>>> # CONFIG_MFD_STMPE is not set
>>> CONFIG_MFD_SYSCON=3Dy
>>> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
>>> # CONFIG_MFD_LP3943 is not set
>>> CONFIG_MFD_LP8788=3Dy
>>> # CONFIG_MFD_PALMAS is not set
>>> CONFIG_TPS6105X=3Dy
>>> # CONFIG_TPS65010 is not set
>>> CONFIG_TPS6507X=3Dy
>>> CONFIG_MFD_TPS65086=3Dy
>>> CONFIG_MFD_TPS65090=3Dy
>>> CONFIG_MFD_TPS65217=3Dy
>>> CONFIG_MFD_TPS65218=3Dy
>>> # CONFIG_MFD_TPS6586X is not set
>>> # CONFIG_MFD_TPS65910 is not set
>>> # CONFIG_MFD_TPS65912_I2C is not set
>>> CONFIG_MFD_TPS80031=3Dy
>>> CONFIG_TWL4030_CORE=3Dy
>>> CONFIG_MFD_TWL4030_AUDIO=3Dy
>>> CONFIG_TWL6040_CORE=3Dy
>>> CONFIG_MFD_WL1273_CORE=3Dy
>>> CONFIG_MFD_LM3533=3Dy
>>> CONFIG_MFD_TIMBERDALE=3Dy
>>> CONFIG_MFD_TC3589X=3Dy
>>> # CONFIG_MFD_TMIO is not set
>>> CONFIG_MFD_VX855=3Dy
>>> CONFIG_MFD_ARIZONA=3Dy
>>> CONFIG_MFD_ARIZONA_I2C=3Dy
>>> # CONFIG_MFD_CS47L24 is not set
>>> # CONFIG_MFD_WM5102 is not set
>>> CONFIG_MFD_WM5110=3Dy
>>> # CONFIG_MFD_WM8997 is not set
>>> CONFIG_MFD_WM8998=3Dy
>>> # CONFIG_MFD_WM8400 is not set
>>> # CONFIG_MFD_WM831X_I2C is not set
>>> CONFIG_MFD_WM8350=3Dy
>>> CONFIG_MFD_WM8350_I2C=3Dy
>>> CONFIG_MFD_WM8994=3Dy
>>> CONFIG_REGULATOR=3Dy
>>> # CONFIG_REGULATOR_DEBUG is not set
>>> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
>>> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
>>> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
>>> CONFIG_REGULATOR_88PM800=3Dy
>>> CONFIG_REGULATOR_ACT8865=3Dy
>>> CONFIG_REGULATOR_AD5398=3Dy
>>> CONFIG_REGULATOR_ANATOP=3Dy
>>> CONFIG_REGULATOR_ARIZONA=3Dy
>>> CONFIG_REGULATOR_AS3711=3Dy
>>> # CONFIG_REGULATOR_AS3722 is not set
>>> CONFIG_REGULATOR_AXP20X=3Dy
>>> CONFIG_REGULATOR_BCM590XX=3Dy
>>> CONFIG_REGULATOR_DA9052=3Dy
>>> # CONFIG_REGULATOR_DA9055 is not set
>>> CONFIG_REGULATOR_DA9063=3Dy
>>> # CONFIG_REGULATOR_DA9210 is not set
>>> CONFIG_REGULATOR_DA9211=3Dy
>>> CONFIG_REGULATOR_FAN53555=3Dy
>>> CONFIG_REGULATOR_GPIO=3Dy
>>> CONFIG_REGULATOR_HI6421=3Dy
>>> CONFIG_REGULATOR_ISL9305=3Dy
>>> # CONFIG_REGULATOR_ISL6271A is not set
>>> CONFIG_REGULATOR_LP3971=3Dy
>>> # CONFIG_REGULATOR_LP3972 is not set
>>> # CONFIG_REGULATOR_LP872X is not set
>>> CONFIG_REGULATOR_LP8755=3Dy
>>> CONFIG_REGULATOR_LP8788=3Dy
>>> # CONFIG_REGULATOR_LTC3589 is not set
>>> # CONFIG_REGULATOR_MAX14577 is not set
>>> CONFIG_REGULATOR_MAX1586=3Dy
>>> # CONFIG_REGULATOR_MAX8649 is not set
>>> # CONFIG_REGULATOR_MAX8660 is not set
>>> # CONFIG_REGULATOR_MAX8907 is not set
>>> # CONFIG_REGULATOR_MAX8952 is not set
>>> CONFIG_REGULATOR_MAX8998=3Dy
>>> CONFIG_REGULATOR_MAX77693=3Dy
>>> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
>>> CONFIG_REGULATOR_MC13783=3Dy
>>> # CONFIG_REGULATOR_MC13892 is not set
>>> # CONFIG_REGULATOR_MT6311 is not set
>>> # CONFIG_REGULATOR_MT6323 is not set
>>> CONFIG_REGULATOR_MT6397=3Dy
>>> # CONFIG_REGULATOR_PFUZE100 is not set
>>> CONFIG_REGULATOR_PV88060=3Dy
>>> CONFIG_REGULATOR_PV88080=3Dy
>>> # CONFIG_REGULATOR_PV88090 is not set
>>> CONFIG_REGULATOR_QCOM_SPMI=3Dy
>>> # CONFIG_REGULATOR_RK808 is not set
>>> # CONFIG_REGULATOR_S2MPA01 is not set
>>> # CONFIG_REGULATOR_S2MPS11 is not set
>>> CONFIG_REGULATOR_S5M8767=3Dy
>>> CONFIG_REGULATOR_SKY81452=3Dy
>>> CONFIG_REGULATOR_TPS51632=3Dy
>>> # CONFIG_REGULATOR_TPS6105X is not set
>>> CONFIG_REGULATOR_TPS62360=3Dy
>>> CONFIG_REGULATOR_TPS65023=3Dy
>>> # CONFIG_REGULATOR_TPS6507X is not set
>>> CONFIG_REGULATOR_TPS65086=3Dy
>>> CONFIG_REGULATOR_TPS65090=3Dy
>>> CONFIG_REGULATOR_TPS65217=3Dy
>>> CONFIG_REGULATOR_TPS65218=3Dy
>>> # CONFIG_REGULATOR_TPS80031 is not set
>>> CONFIG_REGULATOR_TWL4030=3Dy
>>> CONFIG_REGULATOR_WM8350=3Dy
>>> CONFIG_REGULATOR_WM8994=3Dy
>>> CONFIG_MEDIA_SUPPORT=3Dy
>>> =

>>> #
>>> # Multimedia core support
>>> #
>>> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
>>> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
>>> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
>>> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
>>> # CONFIG_MEDIA_SDR_SUPPORT is not set
>>> # CONFIG_MEDIA_RC_SUPPORT is not set
>>> # CONFIG_MEDIA_CONTROLLER is not set
>>> CONFIG_VIDEO_DEV=3Dy
>>> CONFIG_VIDEO_V4L2=3Dy
>>> CONFIG_VIDEO_ADV_DEBUG=3Dy
>>> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
>>> # CONFIG_VIDEO_PCI_SKELETON is not set
>>> CONFIG_VIDEO_TUNER=3Dy
>>> CONFIG_VIDEOBUF_GEN=3Dy
>>> CONFIG_VIDEOBUF_DMA_SG=3Dy
>>> CONFIG_VIDEOBUF2_CORE=3Dy
>>> CONFIG_VIDEOBUF2_MEMOPS=3Dy
>>> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
>>> CONFIG_VIDEOBUF2_DMA_SG=3Dy
>>> # CONFIG_TTPCI_EEPROM is not set
>>> =

>>> #
>>> # Media drivers
>>> #
>>> CONFIG_MEDIA_USB_SUPPORT=3Dy
>>> =

>>> #
>>> # Analog TV USB devices
>>> #
>>> CONFIG_VIDEO_PVRUSB2=3Dy
>>> # CONFIG_VIDEO_PVRUSB2_SYSFS is not set
>>> CONFIG_VIDEO_HDPVR=3Dy
>>> CONFIG_VIDEO_USBVISION=3Dy
>>> # CONFIG_VIDEO_STK1160_COMMON is not set
>>> # CONFIG_VIDEO_GO7007 is not set
>>> =

>>> #
>>> # Analog/digital TV USB devices
>>> #
>>> =

>>> #
>>> # Webcam, TV (analog/digital) USB devices
>>> #
>>> # CONFIG_VIDEO_EM28XX is not set
>>> CONFIG_MEDIA_PCI_SUPPORT=3Dy
>>> =

>>> #
>>> # Media capture/analog TV support
>>> #
>>> CONFIG_VIDEO_HEXIUM_GEMINI=3Dy
>>> # CONFIG_VIDEO_HEXIUM_ORION is not set
>>> CONFIG_VIDEO_MXB=3Dy
>>> CONFIG_VIDEO_DT3155=3Dy
>>> =

>>> #
>>> # Media capture/analog/hybrid TV support
>>> #
>>> CONFIG_VIDEO_CX25821=3Dy
>>> CONFIG_VIDEO_CX25821_ALSA=3Dy
>>> CONFIG_VIDEO_SAA7134=3Dy
>>> # CONFIG_VIDEO_SAA7134_ALSA is not set
>>> =

>>> #
>>> # Supported MMC/SDIO adapters
>>> #
>>> CONFIG_RADIO_ADAPTERS=3Dy
>>> CONFIG_RADIO_SI470X=3Dy
>>> CONFIG_USB_SI470X=3Dy
>>> # CONFIG_RADIO_SI4713 is not set
>>> CONFIG_RADIO_SI476X=3Dy
>>> # CONFIG_USB_MR800 is not set
>>> # CONFIG_USB_DSBR is not set
>>> # CONFIG_RADIO_MAXIRADIO is not set
>>> # CONFIG_RADIO_SHARK is not set
>>> CONFIG_RADIO_SHARK2=3Dy
>>> CONFIG_USB_KEENE=3Dy
>>> CONFIG_USB_RAREMONO=3Dy
>>> CONFIG_USB_MA901=3Dy
>>> CONFIG_RADIO_TEA5764=3Dy
>>> # CONFIG_RADIO_TEA5764_XTAL is not set
>>> CONFIG_RADIO_SAA7706H=3Dy
>>> CONFIG_RADIO_TEF6862=3Dy
>>> CONFIG_RADIO_TIMBERDALE=3Dy
>>> CONFIG_RADIO_WL1273=3Dy
>>> =

>>> #
>>> # Texas Instruments WL128x FM driver (ST based)
>>> #
>>> CONFIG_V4L_RADIO_ISA_DRIVERS=3Dy
>>> CONFIG_RADIO_ISA=3Dy
>>> CONFIG_RADIO_CADET=3Dy
>>> # CONFIG_RADIO_RTRACK is not set
>>> # CONFIG_RADIO_RTRACK2 is not set
>>> CONFIG_RADIO_AZTECH=3Dy
>>> CONFIG_RADIO_AZTECH_PORT=3D350
>>> CONFIG_RADIO_GEMTEK=3Dy
>>> CONFIG_RADIO_GEMTEK_PORT=3D34c
>>> # CONFIG_RADIO_GEMTEK_PROBE is not set
>>> CONFIG_RADIO_MIROPCM20=3Dy
>>> CONFIG_RADIO_SF16FMI=3Dy
>>> # CONFIG_RADIO_SF16FMR2 is not set
>>> CONFIG_RADIO_TERRATEC=3Dy
>>> # CONFIG_RADIO_TRUST is not set
>>> CONFIG_RADIO_TYPHOON=3Dy
>>> CONFIG_RADIO_TYPHOON_PORT=3D316
>>> CONFIG_RADIO_TYPHOON_MUTEFREQ=3D87500
>>> CONFIG_RADIO_ZOLTRIX=3Dy
>>> CONFIG_RADIO_ZOLTRIX_PORT=3D20c
>>> CONFIG_VIDEO_CX2341X=3Dy
>>> CONFIG_VIDEO_TVEEPROM=3Dy
>>> # CONFIG_CYPRESS_FIRMWARE is not set
>>> CONFIG_VIDEO_SAA7146=3Dy
>>> CONFIG_VIDEO_SAA7146_VV=3Dy
>>> =

>>> #
>>> # Media ancillary drivers (tuners, sensors, i2c, frontends)
>>> #
>>> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
>>> =

>>> #
>>> # Encoders, decoders, sensors and other helper chips
>>> #
>>> =

>>> #
>>> # Audio decoders, processors and mixers
>>> #
>>> # CONFIG_VIDEO_TVAUDIO is not set
>>> CONFIG_VIDEO_TDA7432=3Dy
>>> CONFIG_VIDEO_TDA9840=3Dy
>>> CONFIG_VIDEO_TEA6415C=3Dy
>>> CONFIG_VIDEO_TEA6420=3Dy
>>> CONFIG_VIDEO_MSP3400=3Dy
>>> # CONFIG_VIDEO_CS3308 is not set
>>> CONFIG_VIDEO_CS5345=3Dy
>>> CONFIG_VIDEO_CS53L32A=3Dy
>>> CONFIG_VIDEO_TLV320AIC23B=3Dy
>>> CONFIG_VIDEO_UDA1342=3Dy
>>> CONFIG_VIDEO_WM8775=3Dy
>>> CONFIG_VIDEO_WM8739=3Dy
>>> CONFIG_VIDEO_VP27SMPX=3Dy
>>> CONFIG_VIDEO_SONY_BTF_MPX=3Dy
>>> =

>>> #
>>> # RDS decoders
>>> #
>>> # CONFIG_VIDEO_SAA6588 is not set
>>> =

>>> #
>>> # Video decoders
>>> #
>>> # CONFIG_VIDEO_ADV7183 is not set
>>> CONFIG_VIDEO_BT819=3Dy
>>> CONFIG_VIDEO_BT856=3Dy
>>> CONFIG_VIDEO_BT866=3Dy
>>> CONFIG_VIDEO_KS0127=3Dy
>>> CONFIG_VIDEO_ML86V7667=3Dy
>>> # CONFIG_VIDEO_SAA7110 is not set
>>> CONFIG_VIDEO_SAA711X=3Dy
>>> # CONFIG_VIDEO_TVP514X is not set
>>> CONFIG_VIDEO_TVP5150=3Dy
>>> CONFIG_VIDEO_TVP7002=3Dy
>>> CONFIG_VIDEO_TW2804=3Dy
>>> CONFIG_VIDEO_TW9903=3Dy
>>> # CONFIG_VIDEO_TW9906 is not set
>>> CONFIG_VIDEO_VPX3220=3Dy
>>> =

>>> #
>>> # Video and audio decoders
>>> #
>>> # CONFIG_VIDEO_SAA717X is not set
>>> CONFIG_VIDEO_CX25840=3Dy
>>> =

>>> #
>>> # Video encoders
>>> #
>>> # CONFIG_VIDEO_SAA7127 is not set
>>> CONFIG_VIDEO_SAA7185=3Dy
>>> CONFIG_VIDEO_ADV7170=3Dy
>>> CONFIG_VIDEO_ADV7175=3Dy
>>> # CONFIG_VIDEO_ADV7343 is not set
>>> # CONFIG_VIDEO_ADV7393 is not set
>>> # CONFIG_VIDEO_AK881X is not set
>>> # CONFIG_VIDEO_THS8200 is not set
>>> =

>>> #
>>> # Camera sensor devices
>>> #
>>> =

>>> #
>>> # Flash devices
>>> #
>>> =

>>> #
>>> # Video improvement chips
>>> #
>>> CONFIG_VIDEO_UPD64031A=3Dy
>>> CONFIG_VIDEO_UPD64083=3Dy
>>> =

>>> #
>>> # Audio/Video compression chips
>>> #
>>> CONFIG_VIDEO_SAA6752HS=3Dy
>>> =

>>> #
>>> # Miscellaneous helper chips
>>> #
>>> # CONFIG_VIDEO_THS7303 is not set
>>> # CONFIG_VIDEO_M52790 is not set
>>> =

>>> #
>>> # Sensors used on soc_camera driver
>>> #
>>> CONFIG_MEDIA_TUNER=3Dy
>>> =

>>> #
>>> # Customize TV tuners
>>> #
>>> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
>>> CONFIG_MEDIA_TUNER_TDA8290=3Dy
>>> CONFIG_MEDIA_TUNER_TDA827X=3Dy
>>> CONFIG_MEDIA_TUNER_TDA18271=3Dy
>>> CONFIG_MEDIA_TUNER_TDA9887=3Dy
>>> CONFIG_MEDIA_TUNER_TEA5761=3Dy
>>> CONFIG_MEDIA_TUNER_TEA5767=3Dy
>>> # CONFIG_MEDIA_TUNER_MT20XX is not set
>>> CONFIG_MEDIA_TUNER_MT2060=3Dy
>>> CONFIG_MEDIA_TUNER_MT2063=3Dy
>>> # CONFIG_MEDIA_TUNER_MT2266 is not set
>>> CONFIG_MEDIA_TUNER_MT2131=3Dy
>>> # CONFIG_MEDIA_TUNER_QT1010 is not set
>>> CONFIG_MEDIA_TUNER_XC2028=3Dy
>>> # CONFIG_MEDIA_TUNER_XC5000 is not set
>>> # CONFIG_MEDIA_TUNER_XC4000 is not set
>>> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
>>> CONFIG_MEDIA_TUNER_MXL5007T=3Dy
>>> CONFIG_MEDIA_TUNER_MC44S803=3Dy
>>> # CONFIG_MEDIA_TUNER_MAX2165 is not set
>>> CONFIG_MEDIA_TUNER_TDA18218=3Dy
>>> # CONFIG_MEDIA_TUNER_FC0011 is not set
>>> CONFIG_MEDIA_TUNER_FC0012=3Dy
>>> CONFIG_MEDIA_TUNER_FC0013=3Dy
>>> # CONFIG_MEDIA_TUNER_TDA18212 is not set
>>> CONFIG_MEDIA_TUNER_E4000=3Dy
>>> CONFIG_MEDIA_TUNER_FC2580=3Dy
>>> CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
>>> CONFIG_MEDIA_TUNER_TUA9001=3Dy
>>> # CONFIG_MEDIA_TUNER_SI2157 is not set
>>> CONFIG_MEDIA_TUNER_IT913X=3Dy
>>> CONFIG_MEDIA_TUNER_R820T=3Dy
>>> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
>>> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
>>> =

>>> #
>>> # Customise DVB Frontends
>>> #
>>> CONFIG_DVB_AU8522=3Dy
>>> CONFIG_DVB_AU8522_V4L=3Dy
>>> CONFIG_DVB_TUNER_DIB0070=3Dy
>>> CONFIG_DVB_TUNER_DIB0090=3Dy
>>> =

>>> #
>>> # Tools to develop new frontends
>>> #
>>> # CONFIG_DVB_DUMMY_FE is not set
>>> =

>>> #
>>> # Graphics support
>>> #
>>> # CONFIG_AGP is not set
>>> # CONFIG_VGA_ARB is not set
>>> # CONFIG_VGA_SWITCHEROO is not set
>>> # CONFIG_DRM is not set
>>> =

>>> #
>>> # ACP (Audio CoProcessor) Configuration
>>> #
>>> =

>>> #
>>> # Frame buffer Devices
>>> #
>>> CONFIG_FB=3Dy
>>> # CONFIG_FIRMWARE_EDID is not set
>>> CONFIG_FB_CMDLINE=3Dy
>>> CONFIG_FB_NOTIFY=3Dy
>>> CONFIG_FB_DDC=3Dy
>>> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
>>> CONFIG_FB_CFB_FILLRECT=3Dy
>>> CONFIG_FB_CFB_COPYAREA=3Dy
>>> CONFIG_FB_CFB_IMAGEBLIT=3Dy
>>> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
>>> CONFIG_FB_SYS_FILLRECT=3Dy
>>> CONFIG_FB_SYS_COPYAREA=3Dy
>>> CONFIG_FB_SYS_IMAGEBLIT=3Dy
>>> # CONFIG_FB_FOREIGN_ENDIAN is not set
>>> CONFIG_FB_SYS_FOPS=3Dy
>>> CONFIG_FB_DEFERRED_IO=3Dy
>>> CONFIG_FB_HECUBA=3Dy
>>> CONFIG_FB_SVGALIB=3Dy
>>> # CONFIG_FB_MACMODES is not set
>>> # CONFIG_FB_BACKLIGHT is not set
>>> CONFIG_FB_MODE_HELPERS=3Dy
>>> CONFIG_FB_TILEBLITTING=3Dy
>>> =

>>> #
>>> # Frame buffer hardware drivers
>>> #
>>> CONFIG_FB_CIRRUS=3Dy
>>> CONFIG_FB_PM2=3Dy
>>> CONFIG_FB_PM2_FIFO_DISCONNECT=3Dy
>>> CONFIG_FB_CYBER2000=3Dy
>>> CONFIG_FB_CYBER2000_DDC=3Dy
>>> CONFIG_FB_ARC=3Dy
>>> # CONFIG_FB_ASILIANT is not set
>>> # CONFIG_FB_IMSTT is not set
>>> # CONFIG_FB_VGA16 is not set
>>> # CONFIG_FB_VESA is not set
>>> CONFIG_FB_N411=3Dy
>>> CONFIG_FB_HGA=3Dy
>>> CONFIG_FB_OPENCORES=3Dy
>>> # CONFIG_FB_S1D13XXX is not set
>>> CONFIG_FB_NVIDIA=3Dy
>>> CONFIG_FB_NVIDIA_I2C=3Dy
>>> # CONFIG_FB_NVIDIA_DEBUG is not set
>>> # CONFIG_FB_NVIDIA_BACKLIGHT is not set
>>> CONFIG_FB_RIVA=3Dy
>>> CONFIG_FB_RIVA_I2C=3Dy
>>> CONFIG_FB_RIVA_DEBUG=3Dy
>>> # CONFIG_FB_RIVA_BACKLIGHT is not set
>>> CONFIG_FB_I740=3Dy
>>> CONFIG_FB_LE80578=3Dy
>>> CONFIG_FB_CARILLO_RANCH=3Dy
>>> CONFIG_FB_MATROX=3Dy
>>> CONFIG_FB_MATROX_MILLENIUM=3Dy
>>> CONFIG_FB_MATROX_MYSTIQUE=3Dy
>>> CONFIG_FB_MATROX_G=3Dy
>>> CONFIG_FB_MATROX_I2C=3Dy
>>> # CONFIG_FB_MATROX_MAVEN is not set
>>> # CONFIG_FB_RADEON is not set
>>> # CONFIG_FB_ATY128 is not set
>>> CONFIG_FB_ATY=3Dy
>>> # CONFIG_FB_ATY_CT is not set
>>> CONFIG_FB_ATY_GX=3Dy
>>> # CONFIG_FB_ATY_BACKLIGHT is not set
>>> # CONFIG_FB_S3 is not set
>>> CONFIG_FB_SAVAGE=3Dy
>>> CONFIG_FB_SAVAGE_I2C=3Dy
>>> # CONFIG_FB_SAVAGE_ACCEL is not set
>>> # CONFIG_FB_SIS is not set
>>> # CONFIG_FB_VIA is not set
>>> CONFIG_FB_NEOMAGIC=3Dy
>>> # CONFIG_FB_KYRO is not set
>>> # CONFIG_FB_3DFX is not set
>>> CONFIG_FB_VOODOO1=3Dy
>>> # CONFIG_FB_VT8623 is not set
>>> CONFIG_FB_TRIDENT=3Dy
>>> CONFIG_FB_ARK=3Dy
>>> # CONFIG_FB_PM3 is not set
>>> CONFIG_FB_CARMINE=3Dy
>>> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
>>> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
>>> CONFIG_FB_GEODE=3Dy
>>> # CONFIG_FB_GEODE_LX is not set
>>> # CONFIG_FB_GEODE_GX is not set
>>> # CONFIG_FB_GEODE_GX1 is not set
>>> # CONFIG_FB_SM501 is not set
>>> CONFIG_FB_SMSCUFX=3Dy
>>> # CONFIG_FB_UDL is not set
>>> CONFIG_FB_IBM_GXT4500=3Dy
>>> CONFIG_FB_GOLDFISH=3Dy
>>> CONFIG_FB_VIRTUAL=3Dy
>>> # CONFIG_FB_METRONOME is not set
>>> CONFIG_FB_MB862XX=3Dy
>>> CONFIG_FB_MB862XX_PCI_GDC=3Dy
>>> # CONFIG_FB_MB862XX_I2C is not set
>>> # CONFIG_FB_BROADSHEET is not set
>>> CONFIG_FB_AUO_K190X=3Dy
>>> CONFIG_FB_AUO_K1900=3Dy
>>> # CONFIG_FB_AUO_K1901 is not set
>>> CONFIG_FB_HYPERV=3Dy
>>> # CONFIG_FB_SIMPLE is not set
>>> # CONFIG_FB_SSD1307 is not set
>>> # CONFIG_FB_SM712 is not set
>>> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>>> CONFIG_LCD_CLASS_DEVICE=3Dy
>>> # CONFIG_LCD_PLATFORM is not set
>>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>>> # CONFIG_BACKLIGHT_GENERIC is not set
>>> CONFIG_BACKLIGHT_LM3533=3Dy
>>> # CONFIG_BACKLIGHT_CARILLO_RANCH is not set
>>> CONFIG_BACKLIGHT_DA9052=3Dy
>>> CONFIG_BACKLIGHT_APPLE=3Dy
>>> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
>>> CONFIG_BACKLIGHT_SAHARA=3Dy
>>> # CONFIG_BACKLIGHT_ADP5520 is not set
>>> # CONFIG_BACKLIGHT_ADP8860 is not set
>>> CONFIG_BACKLIGHT_ADP8870=3Dy
>>> # CONFIG_BACKLIGHT_LM3639 is not set
>>> CONFIG_BACKLIGHT_PANDORA=3Dy
>>> # CONFIG_BACKLIGHT_SKY81452 is not set
>>> # CONFIG_BACKLIGHT_TPS65217 is not set
>>> CONFIG_BACKLIGHT_AS3711=3Dy
>>> # CONFIG_BACKLIGHT_GPIO is not set
>>> CONFIG_BACKLIGHT_LV5207LP=3Dy
>>> # CONFIG_BACKLIGHT_BD6107 is not set
>>> CONFIG_VGASTATE=3Dy
>>> CONFIG_HDMI=3Dy
>>> # CONFIG_LOGO is not set
>>> CONFIG_SOUND=3Dy
>>> CONFIG_SOUND_OSS_CORE=3Dy
>>> CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
>>> CONFIG_SND=3Dy
>>> CONFIG_SND_TIMER=3Dy
>>> CONFIG_SND_PCM=3Dy
>>> CONFIG_SND_PCM_ELD=3Dy
>>> CONFIG_SND_DMAENGINE_PCM=3Dy
>>> CONFIG_SND_HWDEP=3Dy
>>> CONFIG_SND_RAWMIDI=3Dy
>>> CONFIG_SND_COMPRESS_OFFLOAD=3Dy
>>> CONFIG_SND_JACK=3Dy
>>> CONFIG_SND_JACK_INPUT_DEV=3Dy
>>> # CONFIG_SND_SEQUENCER is not set
>>> CONFIG_SND_OSSEMUL=3Dy
>>> CONFIG_SND_MIXER_OSS=3Dy
>>> # CONFIG_SND_PCM_OSS is not set
>>> # CONFIG_SND_PCM_TIMER is not set
>>> # CONFIG_SND_HRTIMER is not set
>>> CONFIG_SND_DYNAMIC_MINORS=3Dy
>>> CONFIG_SND_MAX_CARDS=3D32
>>> # CONFIG_SND_SUPPORT_OLD_API is not set
>>> CONFIG_SND_PROC_FS=3Dy
>>> CONFIG_SND_VERBOSE_PROCFS=3Dy
>>> CONFIG_SND_VERBOSE_PRINTK=3Dy
>>> CONFIG_SND_DEBUG=3Dy
>>> CONFIG_SND_DEBUG_VERBOSE=3Dy
>>> # CONFIG_SND_PCM_XRUN_DEBUG is not set
>>> CONFIG_SND_VMASTER=3Dy
>>> CONFIG_SND_DMA_SGBUF=3Dy
>>> # CONFIG_SND_RAWMIDI_SEQ is not set
>>> # CONFIG_SND_OPL3_LIB_SEQ is not set
>>> # CONFIG_SND_OPL4_LIB_SEQ is not set
>>> # CONFIG_SND_SBAWE_SEQ is not set
>>> # CONFIG_SND_EMU10K1_SEQ is not set
>>> CONFIG_SND_MPU401_UART=3Dy
>>> CONFIG_SND_OPL3_LIB=3Dy
>>> CONFIG_SND_OPL4_LIB=3Dy
>>> CONFIG_SND_AC97_CODEC=3Dy
>>> CONFIG_SND_DRIVERS=3Dy
>>> CONFIG_SND_PCSP=3Dy
>>> # CONFIG_SND_DUMMY is not set
>>> CONFIG_SND_ALOOP=3Dy
>>> CONFIG_SND_MTPAV=3Dy
>>> # CONFIG_SND_SERIAL_U16550 is not set
>>> CONFIG_SND_MPU401=3Dy
>>> CONFIG_SND_AC97_POWER_SAVE=3Dy
>>> CONFIG_SND_AC97_POWER_SAVE_DEFAULT=3D0
>>> CONFIG_SND_WSS_LIB=3Dy
>>> CONFIG_SND_SB_COMMON=3Dy
>>> CONFIG_SND_SB8_DSP=3Dy
>>> CONFIG_SND_SB16_DSP=3Dy
>>> CONFIG_SND_ISA=3Dy
>>> CONFIG_SND_ADLIB=3Dy
>>> CONFIG_SND_AD1816A=3Dy
>>> CONFIG_SND_AD1848=3Dy
>>> CONFIG_SND_ALS100=3Dy
>>> # CONFIG_SND_AZT1605 is not set
>>> CONFIG_SND_AZT2316=3Dy
>>> # CONFIG_SND_AZT2320 is not set
>>> CONFIG_SND_CMI8328=3Dy
>>> CONFIG_SND_CMI8330=3Dy
>>> # CONFIG_SND_CS4231 is not set
>>> # CONFIG_SND_CS4236 is not set
>>> CONFIG_SND_ES1688=3Dy
>>> CONFIG_SND_ES18XX=3Dy
>>> CONFIG_SND_SC6000=3Dy
>>> CONFIG_SND_GUSCLASSIC=3Dy
>>> CONFIG_SND_GUSEXTREME=3Dy
>>> CONFIG_SND_GUSMAX=3Dy
>>> # CONFIG_SND_INTERWAVE is not set
>>> # CONFIG_SND_INTERWAVE_STB is not set
>>> CONFIG_SND_JAZZ16=3Dy
>>> CONFIG_SND_OPL3SA2=3Dy
>>> CONFIG_SND_OPTI92X_AD1848=3Dy
>>> CONFIG_SND_OPTI92X_CS4231=3Dy
>>> CONFIG_SND_OPTI93X=3Dy
>>> CONFIG_SND_MIRO=3Dy
>>> CONFIG_SND_SB8=3Dy
>>> # CONFIG_SND_SB16 is not set
>>> CONFIG_SND_SBAWE=3Dy
>>> # CONFIG_SND_SB16_CSP is not set
>>> # CONFIG_SND_SSCAPE is not set
>>> CONFIG_SND_WAVEFRONT=3Dy
>>> # CONFIG_SND_MSND_PINNACLE is not set
>>> CONFIG_SND_MSND_CLASSIC=3Dy
>>> # CONFIG_SND_PCI is not set
>>> =

>>> #
>>> # HD-Audio
>>> #
>>> CONFIG_SND_HDA_CORE=3Dy
>>> CONFIG_SND_HDA_DSP_LOADER=3Dy
>>> CONFIG_SND_HDA_EXT_CORE=3Dy
>>> CONFIG_SND_HDA_PREALLOC_SIZE=3D64
>>> # CONFIG_SND_USB is not set
>>> CONFIG_SND_FIREWIRE=3Dy
>>> CONFIG_SND_FIREWIRE_LIB=3Dy
>>> CONFIG_SND_DICE=3Dy
>>> CONFIG_SND_OXFW=3Dy
>>> CONFIG_SND_ISIGHT=3Dy
>>> # CONFIG_SND_FIREWORKS is not set
>>> # CONFIG_SND_BEBOB is not set
>>> CONFIG_SND_FIREWIRE_DIGI00X=3Dy
>>> # CONFIG_SND_FIREWIRE_TASCAM is not set
>>> CONFIG_SND_SOC=3Dy
>>> CONFIG_SND_SOC_AC97_BUS=3Dy
>>> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
>>> CONFIG_SND_SOC_COMPRESS=3Dy
>>> CONFIG_SND_SOC_TOPOLOGY=3Dy
>>> CONFIG_SND_SOC_AMD_ACP=3Dy
>>> # CONFIG_SND_ATMEL_SOC is not set
>>> # CONFIG_SND_DESIGNWARE_I2S is not set
>>> =

>>> #
>>> # SoC Audio for Freescale CPUs
>>> #
>>> =

>>> #
>>> # Common SoC Audio options for Freescale CPUs:
>>> #
>>> CONFIG_SND_SOC_FSL_ASRC=3Dy
>>> CONFIG_SND_SOC_FSL_SAI=3Dy
>>> CONFIG_SND_SOC_FSL_SSI=3Dy
>>> CONFIG_SND_SOC_FSL_SPDIF=3Dy
>>> # CONFIG_SND_SOC_FSL_ESAI is not set
>>> # CONFIG_SND_SOC_IMX_AUDMUX is not set
>>> CONFIG_SND_SOC_IMG=3Dy
>>> # CONFIG_SND_SOC_IMG_I2S_IN is not set
>>> CONFIG_SND_SOC_IMG_I2S_OUT=3Dy
>>> # CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
>>> # CONFIG_SND_SOC_IMG_SPDIF_IN is not set
>>> CONFIG_SND_SOC_IMG_SPDIF_OUT=3Dy
>>> # CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
>>> CONFIG_SND_SST_MFLD_PLATFORM=3Dy
>>> CONFIG_SND_SST_IPC=3Dy
>>> CONFIG_SND_SST_IPC_ACPI=3Dy
>>> CONFIG_SND_SOC_INTEL_SST=3Dy
>>> CONFIG_SND_SOC_INTEL_SST_ACPI=3Dy
>>> CONFIG_SND_SOC_INTEL_SST_MATCH=3Dy
>>> CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH=3Dy
>>> CONFIG_SND_SOC_INTEL_BXT_RT298_MACH=3Dy
>>> CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH=3Dy
>>> # CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH is not set
>>> CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH=3Dy
>>> # CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH is not set
>>> # CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH is not set
>>> CONFIG_SND_SOC_INTEL_SKYLAKE=3Dy
>>> CONFIG_SND_SOC_INTEL_SKL_RT286_MACH=3Dy
>>> CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH=3Dy
>>> # CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH is not set
>>> =

>>> #
>>> # Allwinner SoC Audio support
>>> #
>>> # CONFIG_SND_SUN4I_CODEC is not set
>>> # CONFIG_SND_SUN4I_I2S is not set
>>> # CONFIG_SND_SUN4I_SPDIF is not set
>>> CONFIG_SND_SOC_XTFPGA_I2S=3Dy
>>> CONFIG_SND_SOC_I2C_AND_SPI=3Dy
>>> =

>>> #
>>> # CODEC drivers
>>> #
>>> CONFIG_SND_SOC_AC97_CODEC=3Dy
>>> CONFIG_SND_SOC_ADAU1701=3Dy
>>> CONFIG_SND_SOC_ADAU7002=3Dy
>>> CONFIG_SND_SOC_AK4554=3Dy
>>> # CONFIG_SND_SOC_AK4613 is not set
>>> CONFIG_SND_SOC_AK4642=3Dy
>>> # CONFIG_SND_SOC_AK5386 is not set
>>> CONFIG_SND_SOC_ALC5623=3Dy
>>> CONFIG_SND_SOC_BT_SCO=3Dy
>>> # CONFIG_SND_SOC_CS35L32 is not set
>>> CONFIG_SND_SOC_CS35L33=3Dy
>>> CONFIG_SND_SOC_CS42L51=3Dy
>>> CONFIG_SND_SOC_CS42L51_I2C=3Dy
>>> # CONFIG_SND_SOC_CS42L52 is not set
>>> CONFIG_SND_SOC_CS42L56=3Dy
>>> CONFIG_SND_SOC_CS42L73=3Dy
>>> CONFIG_SND_SOC_CS4265=3Dy
>>> CONFIG_SND_SOC_CS4270=3Dy
>>> # CONFIG_SND_SOC_CS4271_I2C is not set
>>> # CONFIG_SND_SOC_CS42XX8_I2C is not set
>>> # CONFIG_SND_SOC_CS4349 is not set
>>> CONFIG_SND_SOC_CS53L30=3Dy
>>> CONFIG_SND_SOC_DA7219=3Dy
>>> CONFIG_SND_SOC_DMIC=3Dy
>>> CONFIG_SND_SOC_ES8328=3Dy
>>> CONFIG_SND_SOC_GTM601=3Dy
>>> CONFIG_SND_SOC_HDAC_HDMI=3Dy
>>> # CONFIG_SND_SOC_INNO_RK3036 is not set
>>> CONFIG_SND_SOC_MAX98357A=3Dy
>>> # CONFIG_SND_SOC_MAX98504 is not set
>>> CONFIG_SND_SOC_MAX9860=3Dy
>>> # CONFIG_SND_SOC_PCM1681 is not set
>>> CONFIG_SND_SOC_PCM179X=3Dy
>>> CONFIG_SND_SOC_PCM179X_I2C=3Dy
>>> CONFIG_SND_SOC_PCM3168A=3Dy
>>> CONFIG_SND_SOC_PCM3168A_I2C=3Dy
>>> CONFIG_SND_SOC_PCM512x=3Dy
>>> CONFIG_SND_SOC_PCM512x_I2C=3Dy
>>> CONFIG_SND_SOC_RL6231=3Dy
>>> CONFIG_SND_SOC_RL6347A=3Dy
>>> CONFIG_SND_SOC_RT286=3Dy
>>> CONFIG_SND_SOC_RT298=3Dy
>>> CONFIG_SND_SOC_RT5616=3Dy
>>> CONFIG_SND_SOC_RT5631=3Dy
>>> CONFIG_SND_SOC_RT5640=3Dy
>>> CONFIG_SND_SOC_RT5670=3Dy
>>> # CONFIG_SND_SOC_RT5677_SPI is not set
>>> CONFIG_SND_SOC_SGTL5000=3Dy
>>> CONFIG_SND_SOC_SI476X=3Dy
>>> CONFIG_SND_SOC_SIGMADSP=3Dy
>>> CONFIG_SND_SOC_SIGMADSP_I2C=3Dy
>>> CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dy
>>> # CONFIG_SND_SOC_SPDIF is not set
>>> # CONFIG_SND_SOC_SSM2602_I2C is not set
>>> CONFIG_SND_SOC_SSM4567=3Dy
>>> # CONFIG_SND_SOC_STA32X is not set
>>> # CONFIG_SND_SOC_STA350 is not set
>>> CONFIG_SND_SOC_STI_SAS=3Dy
>>> CONFIG_SND_SOC_TAS2552=3Dy
>>> CONFIG_SND_SOC_TAS5086=3Dy
>>> # CONFIG_SND_SOC_TAS571X is not set
>>> CONFIG_SND_SOC_TAS5720=3Dy
>>> CONFIG_SND_SOC_TFA9879=3Dy
>>> CONFIG_SND_SOC_TLV320AIC23=3Dy
>>> CONFIG_SND_SOC_TLV320AIC23_I2C=3Dy
>>> CONFIG_SND_SOC_TLV320AIC31XX=3Dy
>>> CONFIG_SND_SOC_TLV320AIC3X=3Dy
>>> CONFIG_SND_SOC_TS3A227E=3Dy
>>> CONFIG_SND_SOC_WM8510=3Dy
>>> CONFIG_SND_SOC_WM8523=3Dy
>>> # CONFIG_SND_SOC_WM8580 is not set
>>> CONFIG_SND_SOC_WM8711=3Dy
>>> CONFIG_SND_SOC_WM8728=3Dy
>>> # CONFIG_SND_SOC_WM8731 is not set
>>> CONFIG_SND_SOC_WM8737=3Dy
>>> # CONFIG_SND_SOC_WM8741 is not set
>>> CONFIG_SND_SOC_WM8750=3Dy
>>> CONFIG_SND_SOC_WM8753=3Dy
>>> CONFIG_SND_SOC_WM8776=3Dy
>>> # CONFIG_SND_SOC_WM8804_I2C is not set
>>> # CONFIG_SND_SOC_WM8903 is not set
>>> CONFIG_SND_SOC_WM8960=3Dy
>>> CONFIG_SND_SOC_WM8962=3Dy
>>> # CONFIG_SND_SOC_WM8974 is not set
>>> CONFIG_SND_SOC_WM8978=3Dy
>>> CONFIG_SND_SOC_WM8985=3Dy
>>> CONFIG_SND_SOC_NAU8825=3Dy
>>> CONFIG_SND_SOC_TPA6130A2=3Dy
>>> # CONFIG_SND_SIMPLE_CARD is not set
>>> # CONFIG_SOUND_PRIME is not set
>>> CONFIG_AC97_BUS=3Dy
>>> =

>>> #
>>> # HID support
>>> #
>>> CONFIG_HID=3Dy
>>> CONFIG_HID_BATTERY_STRENGTH=3Dy
>>> # CONFIG_HIDRAW is not set
>>> CONFIG_UHID=3Dy
>>> CONFIG_HID_GENERIC=3Dy
>>> =

>>> #
>>> # Special HID drivers
>>> #
>>> # CONFIG_HID_A4TECH is not set
>>> CONFIG_HID_ACRUX=3Dy
>>> # CONFIG_HID_ACRUX_FF is not set
>>> # CONFIG_HID_APPLE is not set
>>> CONFIG_HID_APPLEIR=3Dy
>>> # CONFIG_HID_AUREAL is not set
>>> # CONFIG_HID_BELKIN is not set
>>> # CONFIG_HID_BETOP_FF is not set
>>> CONFIG_HID_CHERRY=3Dy
>>> CONFIG_HID_CHICONY=3Dy
>>> # CONFIG_HID_CORSAIR is not set
>>> # CONFIG_HID_PRODIKEYS is not set
>>> CONFIG_HID_CMEDIA=3Dy
>>> CONFIG_HID_CP2112=3Dy
>>> # CONFIG_HID_CYPRESS is not set
>>> CONFIG_HID_DRAGONRISE=3Dy
>>> # CONFIG_DRAGONRISE_FF is not set
>>> # CONFIG_HID_EMS_FF is not set
>>> CONFIG_HID_ELECOM=3Dy
>>> CONFIG_HID_ELO=3Dy
>>> CONFIG_HID_EZKEY=3Dy
>>> CONFIG_HID_GEMBIRD=3Dy
>>> # CONFIG_HID_GFRM is not set
>>> CONFIG_HID_HOLTEK=3Dy
>>> CONFIG_HOLTEK_FF=3Dy
>>> # CONFIG_HID_GT683R is not set
>>> # CONFIG_HID_KEYTOUCH is not set
>>> CONFIG_HID_KYE=3Dy
>>> CONFIG_HID_UCLOGIC=3Dy
>>> CONFIG_HID_WALTOP=3Dy
>>> # CONFIG_HID_GYRATION is not set
>>> # CONFIG_HID_ICADE is not set
>>> CONFIG_HID_TWINHAN=3Dy
>>> # CONFIG_HID_KENSINGTON is not set
>>> CONFIG_HID_LCPOWER=3Dy
>>> # CONFIG_HID_LED is not set
>>> CONFIG_HID_LENOVO=3Dy
>>> CONFIG_HID_LOGITECH=3Dy
>>> CONFIG_HID_LOGITECH_HIDPP=3Dy
>>> CONFIG_LOGITECH_FF=3Dy
>>> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
>>> # CONFIG_LOGIG940_FF is not set
>>> # CONFIG_LOGIWHEELS_FF is not set
>>> CONFIG_HID_MAGICMOUSE=3Dy
>>> # CONFIG_HID_MICROSOFT is not set
>>> CONFIG_HID_MONTEREY=3Dy
>>> # CONFIG_HID_MULTITOUCH is not set
>>> # CONFIG_HID_NTRIG is not set
>>> # CONFIG_HID_ORTEK is not set
>>> CONFIG_HID_PANTHERLORD=3Dy
>>> CONFIG_PANTHERLORD_FF=3Dy
>>> CONFIG_HID_PENMOUNT=3Dy
>>> CONFIG_HID_PETALYNX=3Dy
>>> CONFIG_HID_PICOLCD=3Dy
>>> # CONFIG_HID_PICOLCD_FB is not set
>>> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
>>> CONFIG_HID_PICOLCD_LCD=3Dy
>>> # CONFIG_HID_PICOLCD_LEDS is not set
>>> CONFIG_HID_PLANTRONICS=3Dy
>>> CONFIG_HID_PRIMAX=3Dy
>>> # CONFIG_HID_ROCCAT is not set
>>> # CONFIG_HID_SAITEK is not set
>>> CONFIG_HID_SAMSUNG=3Dy
>>> CONFIG_HID_SONY=3Dy
>>> CONFIG_SONY_FF=3Dy
>>> CONFIG_HID_SPEEDLINK=3Dy
>>> CONFIG_HID_STEELSERIES=3Dy
>>> CONFIG_HID_SUNPLUS=3Dy
>>> CONFIG_HID_RMI=3Dy
>>> CONFIG_HID_GREENASIA=3Dy
>>> CONFIG_GREENASIA_FF=3Dy
>>> # CONFIG_HID_HYPERV_MOUSE is not set
>>> CONFIG_HID_SMARTJOYPLUS=3Dy
>>> # CONFIG_SMARTJOYPLUS_FF is not set
>>> # CONFIG_HID_TIVO is not set
>>> # CONFIG_HID_TOPSEED is not set
>>> # CONFIG_HID_THINGM is not set
>>> CONFIG_HID_THRUSTMASTER=3Dy
>>> # CONFIG_THRUSTMASTER_FF is not set
>>> CONFIG_HID_WACOM=3Dy
>>> CONFIG_HID_WIIMOTE=3Dy
>>> # CONFIG_HID_XINMO is not set
>>> CONFIG_HID_ZEROPLUS=3Dy
>>> CONFIG_ZEROPLUS_FF=3Dy
>>> CONFIG_HID_ZYDACRON=3Dy
>>> CONFIG_HID_SENSOR_HUB=3Dy
>>> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
>>> # CONFIG_HID_ALPS is not set
>>> =

>>> #
>>> # USB HID support
>>> #
>>> CONFIG_USB_HID=3Dy
>>> # CONFIG_HID_PID is not set
>>> CONFIG_USB_HIDDEV=3Dy
>>> =

>>> #
>>> # I2C HID support
>>> #
>>> # CONFIG_I2C_HID is not set
>>> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
>>> CONFIG_USB_SUPPORT=3Dy
>>> CONFIG_USB_COMMON=3Dy
>>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>>> CONFIG_USB=3Dy
>>> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
>>> =

>>> #
>>> # Miscellaneous USB options
>>> #
>>> # CONFIG_USB_DEFAULT_PERSIST is not set
>>> CONFIG_USB_DYNAMIC_MINORS=3Dy
>>> CONFIG_USB_OTG=3Dy
>>> # CONFIG_USB_OTG_WHITELIST is not set
>>> CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
>>> CONFIG_USB_OTG_FSM=3Dy
>>> CONFIG_USB_ULPI_BUS=3Dy
>>> # CONFIG_USB_MON is not set
>>> CONFIG_USB_WUSB=3Dy
>>> CONFIG_USB_WUSB_CBAF=3Dy
>>> CONFIG_USB_WUSB_CBAF_DEBUG=3Dy
>>> =

>>> #
>>> # USB Host Controller Drivers
>>> #
>>> # CONFIG_USB_C67X00_HCD is not set
>>> CONFIG_USB_XHCI_HCD=3Dy
>>> CONFIG_USB_XHCI_PCI=3Dy
>>> CONFIG_USB_XHCI_PLATFORM=3Dy
>>> CONFIG_USB_EHCI_HCD=3Dy
>>> # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
>>> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
>>> CONFIG_USB_EHCI_PCI=3Dy
>>> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>>> # CONFIG_USB_OXU210HP_HCD is not set
>>> # CONFIG_USB_ISP116X_HCD is not set
>>> # CONFIG_USB_ISP1362_HCD is not set
>>> # CONFIG_USB_FOTG210_HCD is not set
>>> # CONFIG_USB_OHCI_HCD is not set
>>> CONFIG_USB_UHCI_HCD=3Dy
>>> CONFIG_USB_SL811_HCD=3Dy
>>> # CONFIG_USB_SL811_HCD_ISO is not set
>>> CONFIG_USB_R8A66597_HCD=3Dy
>>> CONFIG_USB_WHCI_HCD=3Dy
>>> CONFIG_USB_HWA_HCD=3Dy
>>> CONFIG_USB_HCD_SSB=3Dy
>>> # CONFIG_USB_HCD_TEST_MODE is not set
>>> =

>>> #
>>> # USB Device Class drivers
>>> #
>>> CONFIG_USB_ACM=3Dy
>>> # CONFIG_USB_PRINTER is not set
>>> # CONFIG_USB_WDM is not set
>>> # CONFIG_USB_TMC is not set
>>> =

>>> #
>>> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
>>> #
>>> =

>>> #
>>> # also be needed; see USB_STORAGE Help for more info
>>> #
>>> =

>>> #
>>> # USB Imaging devices
>>> #
>>> CONFIG_USB_MDC800=3Dy
>>> # CONFIG_USBIP_CORE is not set
>>> # CONFIG_USB_MUSB_HDRC is not set
>>> CONFIG_USB_DWC3=3Dy
>>> CONFIG_USB_DWC3_ULPI=3Dy
>>> # CONFIG_USB_DWC3_HOST is not set
>>> CONFIG_USB_DWC3_GADGET=3Dy
>>> # CONFIG_USB_DWC3_DUAL_ROLE is not set
>>> =

>>> #
>>> # Platform Glue Driver Support
>>> #
>>> CONFIG_USB_DWC3_PCI=3Dy
>>> # CONFIG_USB_DWC3_OF_SIMPLE is not set
>>> # CONFIG_USB_DWC2 is not set
>>> # CONFIG_USB_CHIPIDEA is not set
>>> # CONFIG_USB_ISP1760 is not set
>>> =

>>> #
>>> # USB port drivers
>>> #
>>> # CONFIG_USB_SERIAL is not set
>>> =

>>> #
>>> # USB Miscellaneous drivers
>>> #
>>> # CONFIG_USB_EMI62 is not set
>>> # CONFIG_USB_EMI26 is not set
>>> CONFIG_USB_ADUTUX=3Dy
>>> CONFIG_USB_SEVSEG=3Dy
>>> # CONFIG_USB_RIO500 is not set
>>> CONFIG_USB_LEGOTOWER=3Dy
>>> # CONFIG_USB_LCD is not set
>>> CONFIG_USB_CYPRESS_CY7C63=3Dy
>>> # CONFIG_USB_CYTHERM is not set
>>> CONFIG_USB_IDMOUSE=3Dy
>>> # CONFIG_USB_FTDI_ELAN is not set
>>> CONFIG_USB_APPLEDISPLAY=3Dy
>>> CONFIG_USB_SISUSBVGA=3Dy
>>> # CONFIG_USB_LD is not set
>>> # CONFIG_USB_TRANCEVIBRATOR is not set
>>> CONFIG_USB_IOWARRIOR=3Dy
>>> # CONFIG_USB_TEST is not set
>>> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
>>> # CONFIG_USB_ISIGHTFW is not set
>>> CONFIG_USB_YUREX=3Dy
>>> CONFIG_USB_EZUSB_FX2=3Dy
>>> CONFIG_USB_HSIC_USB3503=3Dy
>>> # CONFIG_USB_LINK_LAYER_TEST is not set
>>> CONFIG_USB_CHAOSKEY=3Dy
>>> CONFIG_UCSI=3Dy
>>> =

>>> #
>>> # USB Physical Layer drivers
>>> #
>>> CONFIG_USB_PHY=3Dy
>>> CONFIG_NOP_USB_XCEIV=3Dy
>>> CONFIG_USB_GPIO_VBUS=3Dy
>>> # CONFIG_TAHVO_USB is not set
>>> CONFIG_USB_ISP1301=3Dy
>>> CONFIG_USB_GADGET=3Dy
>>> # CONFIG_USB_GADGET_DEBUG is not set
>>> # CONFIG_USB_GADGET_DEBUG_FILES is not set
>>> # CONFIG_USB_GADGET_DEBUG_FS is not set
>>> CONFIG_USB_GADGET_VBUS_DRAW=3D2
>>> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
>>> =

>>> #
>>> # USB Peripheral Controller
>>> #
>>> CONFIG_USB_FUSB300=3Dy
>>> CONFIG_USB_FOTG210_UDC=3Dy
>>> CONFIG_USB_GR_UDC=3Dy
>>> CONFIG_USB_R8A66597=3Dy
>>> CONFIG_USB_PXA27X=3Dy
>>> CONFIG_USB_MV_UDC=3Dy
>>> # CONFIG_USB_MV_U3D is not set
>>> CONFIG_USB_M66592=3Dy
>>> CONFIG_USB_BDC_UDC=3Dy
>>> =

>>> #
>>> # Platform Support
>>> #
>>> CONFIG_USB_BDC_PCI=3Dy
>>> CONFIG_USB_AMD5536UDC=3Dy
>>> CONFIG_USB_NET2272=3Dy
>>> CONFIG_USB_NET2272_DMA=3Dy
>>> CONFIG_USB_NET2280=3Dy
>>> # CONFIG_USB_GOKU is not set
>>> CONFIG_USB_EG20T=3Dy
>>> # CONFIG_USB_GADGET_XILINX is not set
>>> CONFIG_USB_DUMMY_HCD=3Dy
>>> CONFIG_USB_LIBCOMPOSITE=3Dy
>>> CONFIG_USB_U_SERIAL=3Dy
>>> # CONFIG_USB_CONFIGFS is not set
>>> # CONFIG_USB_ZERO is not set
>>> # CONFIG_USB_AUDIO is not set
>>> # CONFIG_USB_ETH is not set
>>> # CONFIG_USB_G_NCM is not set
>>> # CONFIG_USB_GADGETFS is not set
>>> # CONFIG_USB_FUNCTIONFS is not set
>>> # CONFIG_USB_G_SERIAL is not set
>>> # CONFIG_USB_MIDI_GADGET is not set
>>> # CONFIG_USB_G_PRINTER is not set
>>> # CONFIG_USB_CDC_COMPOSITE is not set
>>> # CONFIG_USB_G_HID is not set
>>> CONFIG_USB_G_DBGP=3Dy
>>> # CONFIG_USB_G_DBGP_PRINTK is not set
>>> CONFIG_USB_G_DBGP_SERIAL=3Dy
>>> # CONFIG_USB_G_WEBCAM is not set
>>> # CONFIG_USB_LED_TRIG is not set
>>> CONFIG_UWB=3Dy
>>> CONFIG_UWB_HWA=3Dy
>>> CONFIG_UWB_WHCI=3Dy
>>> # CONFIG_UWB_I1480U is not set
>>> CONFIG_MMC=3Dy
>>> CONFIG_MMC_DEBUG=3Dy
>>> CONFIG_PWRSEQ_EMMC=3Dy
>>> CONFIG_PWRSEQ_SIMPLE=3Dy
>>> =

>>> #
>>> # MMC/SD/SDIO Card Drivers
>>> #
>>> CONFIG_SDIO_UART=3Dy
>>> # CONFIG_MMC_TEST is not set
>>> =

>>> #
>>> # MMC/SD/SDIO Host Controller Drivers
>>> #
>>> CONFIG_MMC_SDHCI=3Dy
>>> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
>>> CONFIG_MMC_SDHCI_PCI=3Dy
>>> # CONFIG_MMC_RICOH_MMC is not set
>>> # CONFIG_MMC_SDHCI_ACPI is not set
>>> CONFIG_MMC_SDHCI_PLTFM=3Dy
>>> CONFIG_MMC_SDHCI_OF_ARASAN=3Dy
>>> CONFIG_MMC_SDHCI_OF_AT91=3Dy
>>> CONFIG_MMC_SDHCI_F_SDH30=3Dy
>>> CONFIG_MMC_WBSD=3Dy
>>> CONFIG_MMC_TIFM_SD=3Dy
>>> # CONFIG_MMC_GOLDFISH is not set
>>> CONFIG_MMC_CB710=3Dy
>>> # CONFIG_MMC_VIA_SDMMC is not set
>>> # CONFIG_MMC_VUB300 is not set
>>> CONFIG_MMC_USHC=3Dy
>>> CONFIG_MMC_USDHI6ROL0=3Dy
>>> CONFIG_MMC_REALTEK_PCI=3Dy
>>> CONFIG_MMC_TOSHIBA_PCI=3Dy
>>> # CONFIG_MMC_MTK is not set
>>> # CONFIG_MEMSTICK is not set
>>> CONFIG_NEW_LEDS=3Dy
>>> CONFIG_LEDS_CLASS=3Dy
>>> CONFIG_LEDS_CLASS_FLASH=3Dy
>>> =

>>> #
>>> # LED drivers
>>> #
>>> # CONFIG_LEDS_AAT1290 is not set
>>> CONFIG_LEDS_BCM6328=3Dy
>>> CONFIG_LEDS_BCM6358=3Dy
>>> CONFIG_LEDS_LM3530=3Dy
>>> # CONFIG_LEDS_LM3533 is not set
>>> # CONFIG_LEDS_LM3642 is not set
>>> # CONFIG_LEDS_NET48XX is not set
>>> CONFIG_LEDS_WRAP=3Dy
>>> CONFIG_LEDS_PCA9532=3Dy
>>> # CONFIG_LEDS_PCA9532_GPIO is not set
>>> CONFIG_LEDS_GPIO=3Dy
>>> CONFIG_LEDS_LP3944=3Dy
>>> CONFIG_LEDS_LP3952=3Dy
>>> CONFIG_LEDS_LP55XX_COMMON=3Dy
>>> CONFIG_LEDS_LP5521=3Dy
>>> CONFIG_LEDS_LP5523=3Dy
>>> CONFIG_LEDS_LP5562=3Dy
>>> # CONFIG_LEDS_LP8501 is not set
>>> CONFIG_LEDS_LP8788=3Dy
>>> CONFIG_LEDS_LP8860=3Dy
>>> # CONFIG_LEDS_CLEVO_MAIL is not set
>>> # CONFIG_LEDS_PCA955X is not set
>>> CONFIG_LEDS_PCA963X=3Dy
>>> # CONFIG_LEDS_WM8350 is not set
>>> CONFIG_LEDS_DA9052=3Dy
>>> # CONFIG_LEDS_REGULATOR is not set
>>> # CONFIG_LEDS_BD2802 is not set
>>> # CONFIG_LEDS_INTEL_SS4200 is not set
>>> CONFIG_LEDS_LT3593=3Dy
>>> # CONFIG_LEDS_ADP5520 is not set
>>> # CONFIG_LEDS_MC13783 is not set
>>> # CONFIG_LEDS_TCA6507 is not set
>>> CONFIG_LEDS_TLC591XX=3Dy
>>> CONFIG_LEDS_MAX77693=3Dy
>>> CONFIG_LEDS_LM355x=3Dy
>>> # CONFIG_LEDS_OT200 is not set
>>> # CONFIG_LEDS_KTD2692 is not set
>>> CONFIG_LEDS_IS31FL32XX=3Dy
>>> =

>>> #
>>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
>>> #
>>> CONFIG_LEDS_BLINKM=3Dy
>>> CONFIG_LEDS_SYSCON=3Dy
>>> =

>>> #
>>> # LED Triggers
>>> #
>>> CONFIG_LEDS_TRIGGERS=3Dy
>>> # CONFIG_LEDS_TRIGGER_TIMER is not set
>>> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
>>> # CONFIG_LEDS_TRIGGER_MTD is not set
>>> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
>>> # CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
>>> # CONFIG_LEDS_TRIGGER_CPU is not set
>>> # CONFIG_LEDS_TRIGGER_GPIO is not set
>>> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
>>> =

>>> #
>>> # iptables trigger is under Netfilter config (LED target)
>>> #
>>> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
>>> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
>>> CONFIG_LEDS_TRIGGER_PANIC=3Dy
>>> # CONFIG_ACCESSIBILITY is not set
>>> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>>> CONFIG_EDAC_SUPPORT=3Dy
>>> CONFIG_EDAC=3Dy
>>> CONFIG_EDAC_LEGACY_SYSFS=3Dy
>>> # CONFIG_EDAC_DEBUG is not set
>>> CONFIG_EDAC_DECODE_MCE=3Dy
>>> # CONFIG_EDAC_MM_EDAC is not set
>>> CONFIG_RTC_LIB=3Dy
>>> CONFIG_RTC_MC146818_LIB=3Dy
>>> CONFIG_RTC_CLASS=3Dy
>>> CONFIG_RTC_HCTOSYS=3Dy
>>> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
>>> # CONFIG_RTC_SYSTOHC is not set
>>> CONFIG_RTC_DEBUG=3Dy
>>> =

>>> #
>>> # RTC interfaces
>>> #
>>> CONFIG_RTC_INTF_SYSFS=3Dy
>>> CONFIG_RTC_INTF_PROC=3Dy
>>> # CONFIG_RTC_INTF_DEV is not set
>>> CONFIG_RTC_DRV_TEST=3Dy
>>> =

>>> #
>>> # I2C RTC drivers
>>> #
>>> CONFIG_RTC_DRV_88PM80X=3Dy
>>> CONFIG_RTC_DRV_ABB5ZES3=3Dy
>>> CONFIG_RTC_DRV_ABX80X=3Dy
>>> CONFIG_RTC_DRV_AS3722=3Dy
>>> CONFIG_RTC_DRV_DS1307=3Dy
>>> CONFIG_RTC_DRV_DS1307_HWMON=3Dy
>>> CONFIG_RTC_DRV_DS1374=3Dy
>>> # CONFIG_RTC_DRV_DS1374_WDT is not set
>>> CONFIG_RTC_DRV_DS1672=3Dy
>>> # CONFIG_RTC_DRV_HYM8563 is not set
>>> # CONFIG_RTC_DRV_LP8788 is not set
>>> CONFIG_RTC_DRV_MAX6900=3Dy
>>> CONFIG_RTC_DRV_MAX8907=3Dy
>>> CONFIG_RTC_DRV_MAX8998=3Dy
>>> CONFIG_RTC_DRV_RK808=3Dy
>>> # CONFIG_RTC_DRV_RS5C372 is not set
>>> # CONFIG_RTC_DRV_ISL1208 is not set
>>> CONFIG_RTC_DRV_ISL12022=3Dy
>>> # CONFIG_RTC_DRV_ISL12057 is not set
>>> CONFIG_RTC_DRV_X1205=3Dy
>>> # CONFIG_RTC_DRV_PCF8523 is not set
>>> CONFIG_RTC_DRV_PCF85063=3Dy
>>> # CONFIG_RTC_DRV_PCF8563 is not set
>>> # CONFIG_RTC_DRV_PCF8583 is not set
>>> # CONFIG_RTC_DRV_M41T80 is not set
>>> # CONFIG_RTC_DRV_BQ32K is not set
>>> CONFIG_RTC_DRV_TWL4030=3Dy
>>> CONFIG_RTC_DRV_TPS80031=3Dy
>>> # CONFIG_RTC_DRV_S35390A is not set
>>> # CONFIG_RTC_DRV_FM3130 is not set
>>> # CONFIG_RTC_DRV_RX8010 is not set
>>> CONFIG_RTC_DRV_RX8581=3Dy
>>> CONFIG_RTC_DRV_RX8025=3Dy
>>> # CONFIG_RTC_DRV_EM3027 is not set
>>> CONFIG_RTC_DRV_RV8803=3Dy
>>> CONFIG_RTC_DRV_S5M=3Dy
>>> =

>>> #
>>> # SPI RTC drivers
>>> #
>>> CONFIG_RTC_I2C_AND_SPI=3Dy
>>> =

>>> #
>>> # SPI and I2C RTC drivers
>>> #
>>> CONFIG_RTC_DRV_DS3232=3Dy
>>> # CONFIG_RTC_DRV_PCF2127 is not set
>>> # CONFIG_RTC_DRV_RV3029C2 is not set
>>> =

>>> #
>>> # Platform RTC drivers
>>> #
>>> CONFIG_RTC_DRV_CMOS=3Dy
>>> CONFIG_RTC_DRV_DS1286=3Dy
>>> CONFIG_RTC_DRV_DS1511=3Dy
>>> CONFIG_RTC_DRV_DS1553=3Dy
>>> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
>>> # CONFIG_RTC_DRV_DS1685 is not set
>>> # CONFIG_RTC_DRV_DS1689 is not set
>>> # CONFIG_RTC_DRV_DS17285 is not set
>>> # CONFIG_RTC_DRV_DS17485 is not set
>>> CONFIG_RTC_DRV_DS17885=3Dy
>>> # CONFIG_RTC_DS1685_PROC_REGS is not set
>>> # CONFIG_RTC_DS1685_SYSFS_REGS is not set
>>> CONFIG_RTC_DRV_DS1742=3Dy
>>> CONFIG_RTC_DRV_DS2404=3Dy
>>> # CONFIG_RTC_DRV_DA9052 is not set
>>> # CONFIG_RTC_DRV_DA9055 is not set
>>> CONFIG_RTC_DRV_DA9063=3Dy
>>> # CONFIG_RTC_DRV_STK17TA8 is not set
>>> CONFIG_RTC_DRV_M48T86=3Dy
>>> CONFIG_RTC_DRV_M48T35=3Dy
>>> CONFIG_RTC_DRV_M48T59=3Dy
>>> CONFIG_RTC_DRV_MSM6242=3Dy
>>> # CONFIG_RTC_DRV_BQ4802 is not set
>>> # CONFIG_RTC_DRV_RP5C01 is not set
>>> CONFIG_RTC_DRV_V3020=3Dy
>>> # CONFIG_RTC_DRV_WM8350 is not set
>>> # CONFIG_RTC_DRV_ZYNQMP is not set
>>> =

>>> #
>>> # on-CPU RTC drivers
>>> #
>>> # CONFIG_RTC_DRV_MC13XXX is not set
>>> CONFIG_RTC_DRV_SNVS=3Dy
>>> CONFIG_RTC_DRV_MT6397=3Dy
>>> =

>>> #
>>> # HID Sensor RTC drivers
>>> #
>>> CONFIG_RTC_DRV_HID_SENSOR_TIME=3Dy
>>> # CONFIG_DMADEVICES is not set
>>> =

>>> #
>>> # DMABUF options
>>> #
>>> # CONFIG_SYNC_FILE is not set
>>> CONFIG_AUXDISPLAY=3Dy
>>> CONFIG_UIO=3Dy
>>> CONFIG_UIO_CIF=3Dy
>>> CONFIG_UIO_PDRV_GENIRQ=3Dy
>>> CONFIG_UIO_DMEM_GENIRQ=3Dy
>>> # CONFIG_UIO_AEC is not set
>>> CONFIG_UIO_SERCOS3=3Dy
>>> # CONFIG_UIO_PCI_GENERIC is not set
>>> CONFIG_UIO_NETX=3Dy
>>> # CONFIG_UIO_PRUSS is not set
>>> # CONFIG_UIO_MF624 is not set
>>> # CONFIG_VIRT_DRIVERS is not set
>>> CONFIG_VIRTIO=3Dy
>>> =

>>> #
>>> # Virtio drivers
>>> #
>>> # CONFIG_VIRTIO_PCI is not set
>>> # CONFIG_VIRTIO_BALLOON is not set
>>> CONFIG_VIRTIO_INPUT=3Dy
>>> CONFIG_VIRTIO_MMIO=3Dy
>>> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
>>> =

>>> #
>>> # Microsoft Hyper-V guest support
>>> #
>>> CONFIG_HYPERV=3Dy
>>> # CONFIG_HYPERV_BALLOON is not set
>>> CONFIG_STAGING=3Dy
>>> # CONFIG_SLICOSS is not set
>>> # CONFIG_FB_OLPC_DCON is not set
>>> =

>>> #
>>> # IIO staging drivers
>>> #
>>> =

>>> #
>>> # Accelerometers
>>> #
>>> =

>>> #
>>> # Analog to digital converters
>>> #
>>> CONFIG_AD7606=3Dy
>>> # CONFIG_AD7606_IFACE_PARALLEL is not set
>>> =

>>> #
>>> # Analog digital bi-direction converters
>>> #
>>> CONFIG_ADT7316=3Dy
>>> # CONFIG_ADT7316_I2C is not set
>>> =

>>> #
>>> # Capacitance to digital converters
>>> #
>>> CONFIG_AD7150=3Dy
>>> # CONFIG_AD7152 is not set
>>> # CONFIG_AD7746 is not set
>>> =

>>> #
>>> # Direct Digital Synthesis
>>> #
>>> =

>>> #
>>> # Digital gyroscope sensors
>>> #
>>> =

>>> #
>>> # Network Analyzer, Impedance Converters
>>> #
>>> # CONFIG_AD5933 is not set
>>> =

>>> #
>>> # Light sensors
>>> #
>>> # CONFIG_SENSORS_ISL29018 is not set
>>> CONFIG_SENSORS_ISL29028=3Dy
>>> CONFIG_TSL2583=3Dy
>>> # CONFIG_TSL2x7x is not set
>>> =

>>> #
>>> # Active energy metering IC
>>> #
>>> CONFIG_ADE7854=3Dy
>>> CONFIG_ADE7854_I2C=3Dy
>>> =

>>> #
>>> # Resolver to digital converters
>>> #
>>> =

>>> #
>>> # Triggers - standalone
>>> #
>>> CONFIG_FB_SM750=3Dy
>>> # CONFIG_FB_XGI is not set
>>> =

>>> #
>>> # Speakup console speech
>>> #
>>> CONFIG_STAGING_MEDIA=3Dy
>>> CONFIG_I2C_BCM2048=3Dy
>>> # CONFIG_MEDIA_CEC is not set
>>> # CONFIG_VIDEO_TW686X_KH is not set
>>> =

>>> #
>>> # Android
>>> #
>>> CONFIG_ASHMEM=3Dy
>>> CONFIG_ANDROID_LOW_MEMORY_KILLER=3Dy
>>> # CONFIG_ION is not set
>>> # CONFIG_STAGING_BOARD is not set
>>> # CONFIG_FIREWIRE_SERIAL is not set
>>> CONFIG_GOLDFISH_AUDIO=3Dy
>>> CONFIG_MTD_GOLDFISH_NAND=3Dy
>>> # CONFIG_DGNC is not set
>>> # CONFIG_GS_FPGABOOT is not set
>>> CONFIG_COMMON_CLK_XLNX_CLKWZRD=3Dy
>>> CONFIG_MOST=3Dy
>>> CONFIG_MOSTCORE=3Dy
>>> # CONFIG_AIM_CDEV is not set
>>> # CONFIG_AIM_NETWORK is not set
>>> CONFIG_AIM_SOUND=3Dy
>>> CONFIG_AIM_V4L2=3Dy
>>> CONFIG_HDM_I2C=3Dy
>>> # CONFIG_HDM_USB is not set
>>> # CONFIG_KS7010 is not set
>>> # CONFIG_X86_PLATFORM_DEVICES is not set
>>> CONFIG_GOLDFISH_BUS=3Dy
>>> # CONFIG_GOLDFISH_PIPE is not set
>>> CONFIG_CHROME_PLATFORMS=3Dy
>>> # CONFIG_CHROMEOS_LAPTOP is not set
>>> CONFIG_CHROMEOS_PSTORE=3Dy
>>> CONFIG_CROS_EC_CHARDEV=3Dy
>>> CONFIG_CROS_EC_LPC=3Dy
>>> CONFIG_CROS_EC_PROTO=3Dy
>>> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
>>> CONFIG_CLKDEV_LOOKUP=3Dy
>>> CONFIG_HAVE_CLK_PREPARE=3Dy
>>> CONFIG_COMMON_CLK=3Dy
>>> =

>>> #
>>> # Common Clock Framework
>>> #
>>> CONFIG_COMMON_CLK_RK808=3Dy
>>> CONFIG_COMMON_CLK_SCPI=3Dy
>>> CONFIG_COMMON_CLK_SI5351=3Dy
>>> CONFIG_COMMON_CLK_SI514=3Dy
>>> # CONFIG_COMMON_CLK_SI570 is not set
>>> CONFIG_COMMON_CLK_CDCE706=3Dy
>>> # CONFIG_COMMON_CLK_CDCE925 is not set
>>> # CONFIG_COMMON_CLK_CS2000_CP is not set
>>> CONFIG_COMMON_CLK_S2MPS11=3Dy
>>> CONFIG_CLK_TWL6040=3Dy
>>> # CONFIG_COMMON_CLK_NXP is not set
>>> # CONFIG_COMMON_CLK_PXA is not set
>>> # CONFIG_COMMON_CLK_PIC32 is not set
>>> # CONFIG_SUNXI_CCU is not set
>>> =

>>> #
>>> # Hardware Spinlock drivers
>>> #
>>> =

>>> #
>>> # Clock Source drivers
>>> #
>>> CONFIG_CLKSRC_I8253=3Dy
>>> CONFIG_CLKEVT_I8253=3Dy
>>> CONFIG_I8253_LOCK=3Dy
>>> CONFIG_CLKBLD_I8253=3Dy
>>> # CONFIG_ATMEL_PIT is not set
>>> # CONFIG_SH_TIMER_CMT is not set
>>> # CONFIG_SH_TIMER_MTU2 is not set
>>> # CONFIG_SH_TIMER_TMU is not set
>>> # CONFIG_EM_TIMER_STI is not set
>>> CONFIG_MAILBOX=3Dy
>>> # CONFIG_PCC is not set
>>> # CONFIG_ALTERA_MBOX is not set
>>> # CONFIG_MAILBOX_TEST is not set
>>> CONFIG_IOMMU_SUPPORT=3Dy
>>> =

>>> #
>>> # Generic IOMMU Pagetable Support
>>> #
>>> =

>>> #
>>> # Remoteproc drivers
>>> #
>>> # CONFIG_STE_MODEM_RPROC is not set
>>> =

>>> #
>>> # Rpmsg drivers
>>> #
>>> =

>>> #
>>> # SOC (System On Chip) specific Drivers
>>> #
>>> =

>>> #
>>> # Broadcom SoC drivers
>>> #
>>> # CONFIG_SUNXI_SRAM is not set
>>> # CONFIG_SOC_TI is not set
>>> CONFIG_PM_DEVFREQ=3Dy
>>> =

>>> #
>>> # DEVFREQ Governors
>>> #
>>> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
>>> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
>>> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
>>> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
>>> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
>>> =

>>> #
>>> # DEVFREQ Drivers
>>> #
>>> CONFIG_PM_DEVFREQ_EVENT=3Dy
>>> CONFIG_EXTCON=3Dy
>>> =

>>> #
>>> # Extcon Device Drivers
>>> #
>>> CONFIG_EXTCON_ADC_JACK=3Dy
>>> CONFIG_EXTCON_ARIZONA=3Dy
>>> CONFIG_EXTCON_AXP288=3Dy
>>> CONFIG_EXTCON_GPIO=3Dy
>>> CONFIG_EXTCON_MAX14577=3Dy
>>> CONFIG_EXTCON_MAX3355=3Dy
>>> CONFIG_EXTCON_MAX77693=3Dy
>>> # CONFIG_EXTCON_RT8973A is not set
>>> CONFIG_EXTCON_SM5502=3Dy
>>> # CONFIG_EXTCON_USB_GPIO is not set
>>> # CONFIG_MEMORY is not set
>>> CONFIG_IIO=3Dy
>>> CONFIG_IIO_BUFFER=3Dy
>>> CONFIG_IIO_BUFFER_CB=3Dy
>>> CONFIG_IIO_KFIFO_BUF=3Dy
>>> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>>> CONFIG_IIO_CONFIGFS=3Dy
>>> CONFIG_IIO_TRIGGER=3Dy
>>> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
>>> CONFIG_IIO_SW_DEVICE=3Dy
>>> # CONFIG_IIO_SW_TRIGGER is not set
>>> =

>>> #
>>> # Accelerometers
>>> #
>>> # CONFIG_BMA180 is not set
>>> CONFIG_BMC150_ACCEL=3Dy
>>> CONFIG_BMC150_ACCEL_I2C=3Dy
>>> # CONFIG_HID_SENSOR_ACCEL_3D is not set
>>> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
>>> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
>>> # CONFIG_KXCJK1013 is not set
>>> CONFIG_MMA7455=3Dy
>>> CONFIG_MMA7455_I2C=3Dy
>>> # CONFIG_MMA7660 is not set
>>> CONFIG_MMA8452=3Dy
>>> CONFIG_MMA9551_CORE=3Dy
>>> # CONFIG_MMA9551 is not set
>>> CONFIG_MMA9553=3Dy
>>> # CONFIG_MXC4005 is not set
>>> CONFIG_MXC6255=3Dy
>>> CONFIG_STK8312=3Dy
>>> CONFIG_STK8BA50=3Dy
>>> =

>>> #
>>> # Analog to digital converters
>>> #
>>> CONFIG_AD7291=3Dy
>>> CONFIG_AD799X=3Dy
>>> CONFIG_AXP288_ADC=3Dy
>>> CONFIG_CC10001_ADC=3Dy
>>> CONFIG_LP8788_ADC=3Dy
>>> # CONFIG_MAX1363 is not set
>>> CONFIG_MCP3422=3Dy
>>> CONFIG_MEN_Z188_ADC=3Dy
>>> # CONFIG_NAU7802 is not set
>>> # CONFIG_QCOM_SPMI_IADC is not set
>>> CONFIG_QCOM_SPMI_VADC=3Dy
>>> CONFIG_TI_ADC081C=3Dy
>>> # CONFIG_TI_AM335X_ADC is not set
>>> CONFIG_TWL4030_MADC=3Dy
>>> CONFIG_TWL6030_GPADC=3Dy
>>> CONFIG_VF610_ADC=3Dy
>>> CONFIG_VIPERBOARD_ADC=3Dy
>>> =

>>> #
>>> # Amplifiers
>>> #
>>> =

>>> #
>>> # Chemical Sensors
>>> #
>>> CONFIG_ATLAS_PH_SENSOR=3Dy
>>> # CONFIG_IAQCORE is not set
>>> CONFIG_VZ89X=3Dy
>>> =

>>> #
>>> # Hid Sensor IIO Common
>>> #
>>> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
>>> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
>>> CONFIG_IIO_MS_SENSORS_I2C=3Dy
>>> =

>>> #
>>> # SSP Sensor Common
>>> #
>>> CONFIG_IIO_ST_SENSORS_I2C=3Dy
>>> CONFIG_IIO_ST_SENSORS_CORE=3Dy
>>> =

>>> #
>>> # Digital to analog converters
>>> #
>>> # CONFIG_AD5064 is not set
>>> # CONFIG_AD5380 is not set
>>> CONFIG_AD5446=3Dy
>>> CONFIG_AD5592R_BASE=3Dy
>>> CONFIG_AD5593R=3Dy
>>> # CONFIG_M62332 is not set
>>> CONFIG_MAX517=3Dy
>>> # CONFIG_MAX5821 is not set
>>> CONFIG_MCP4725=3Dy
>>> CONFIG_STX104=3Dy
>>> CONFIG_VF610_DAC=3Dy
>>> =

>>> #
>>> # IIO dummy driver
>>> #
>>> CONFIG_IIO_SIMPLE_DUMMY=3Dy
>>> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
>>> # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
>>> =

>>> #
>>> # Frequency Synthesizers DDS/PLL
>>> #
>>> =

>>> #
>>> # Clock Generator/Distribution
>>> #
>>> =

>>> #
>>> # Phase-Locked Loop (PLL) frequency synthesizers
>>> #
>>> =

>>> #
>>> # Digital gyroscope sensors
>>> #
>>> # CONFIG_BMG160 is not set
>>> # CONFIG_HID_SENSOR_GYRO_3D is not set
>>> # CONFIG_IIO_ST_GYRO_3AXIS is not set
>>> CONFIG_ITG3200=3Dy
>>> =

>>> #
>>> # Health Sensors
>>> #
>>> =

>>> #
>>> # Heart Rate Monitors
>>> #
>>> CONFIG_AFE4404=3Dy
>>> CONFIG_MAX30100=3Dy
>>> =

>>> #
>>> # Humidity sensors
>>> #
>>> CONFIG_AM2315=3Dy
>>> # CONFIG_DHT11 is not set
>>> # CONFIG_HDC100X is not set
>>> CONFIG_HTU21=3Dy
>>> # CONFIG_SI7005 is not set
>>> CONFIG_SI7020=3Dy
>>> =

>>> #
>>> # Inertial measurement units
>>> #
>>> # CONFIG_BMI160_I2C is not set
>>> CONFIG_KMX61=3Dy
>>> CONFIG_INV_MPU6050_IIO=3Dy
>>> CONFIG_INV_MPU6050_I2C=3Dy
>>> =

>>> #
>>> # Light sensors
>>> #
>>> CONFIG_ACPI_ALS=3Dy
>>> CONFIG_ADJD_S311=3Dy
>>> # CONFIG_AL3320A is not set
>>> CONFIG_APDS9300=3Dy
>>> # CONFIG_APDS9960 is not set
>>> CONFIG_BH1750=3Dy
>>> # CONFIG_BH1780 is not set
>>> # CONFIG_CM32181 is not set
>>> CONFIG_CM3232=3Dy
>>> # CONFIG_CM3323 is not set
>>> CONFIG_CM36651=3Dy
>>> CONFIG_GP2AP020A00F=3Dy
>>> CONFIG_ISL29125=3Dy
>>> # CONFIG_HID_SENSOR_ALS is not set
>>> # CONFIG_HID_SENSOR_PROX is not set
>>> CONFIG_JSA1212=3Dy
>>> CONFIG_RPR0521=3Dy
>>> # CONFIG_SENSORS_LM3533 is not set
>>> CONFIG_LTR501=3Dy
>>> # CONFIG_MAX44000 is not set
>>> # CONFIG_OPT3001 is not set
>>> # CONFIG_PA12203001 is not set
>>> CONFIG_STK3310=3Dy
>>> # CONFIG_TCS3414 is not set
>>> # CONFIG_TCS3472 is not set
>>> CONFIG_SENSORS_TSL2563=3Dy
>>> CONFIG_TSL4531=3Dy
>>> CONFIG_US5182D=3Dy
>>> CONFIG_VCNL4000=3Dy
>>> # CONFIG_VEML6070 is not set
>>> =

>>> #
>>> # Magnetometer sensors
>>> #
>>> CONFIG_AK8975=3Dy
>>> CONFIG_AK09911=3Dy
>>> CONFIG_BMC150_MAGN=3Dy
>>> CONFIG_BMC150_MAGN_I2C=3Dy
>>> # CONFIG_MAG3110 is not set
>>> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dy
>>> CONFIG_MMC35240=3Dy
>>> # CONFIG_IIO_ST_MAGN_3AXIS is not set
>>> CONFIG_SENSORS_HMC5843=3Dy
>>> CONFIG_SENSORS_HMC5843_I2C=3Dy
>>> =

>>> #
>>> # Inclinometer sensors
>>> #
>>> # CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
>>> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dy
>>> =

>>> #
>>> # Triggers - standalone
>>> #
>>> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
>>> CONFIG_IIO_SYSFS_TRIGGER=3Dy
>>> =

>>> #
>>> # Digital potentiometers
>>> #
>>> CONFIG_DS1803=3Dy
>>> # CONFIG_MCP4531 is not set
>>> CONFIG_TPL0102=3Dy
>>> =

>>> #
>>> # Pressure sensors
>>> #
>>> # CONFIG_BMP280 is not set
>>> CONFIG_HID_SENSOR_PRESS=3Dy
>>> # CONFIG_HP03 is not set
>>> CONFIG_MPL115=3Dy
>>> CONFIG_MPL115_I2C=3Dy
>>> CONFIG_MPL3115=3Dy
>>> CONFIG_MS5611=3Dy
>>> # CONFIG_MS5611_I2C is not set
>>> CONFIG_MS5637=3Dy
>>> # CONFIG_IIO_ST_PRESS is not set
>>> # CONFIG_T5403 is not set
>>> CONFIG_HP206C=3Dy
>>> =

>>> #
>>> # Lightning sensors
>>> #
>>> =

>>> #
>>> # Proximity sensors
>>> #
>>> # CONFIG_LIDAR_LITE_V2 is not set
>>> CONFIG_SX9500=3Dy
>>> =

>>> #
>>> # Temperature sensors
>>> #
>>> CONFIG_MLX90614=3Dy
>>> # CONFIG_TMP006 is not set
>>> CONFIG_TSYS01=3Dy
>>> CONFIG_TSYS02D=3Dy
>>> CONFIG_NTB=3Dy
>>> CONFIG_NTB_PINGPONG=3Dy
>>> CONFIG_NTB_TOOL=3Dy
>>> CONFIG_NTB_PERF=3Dy
>>> CONFIG_NTB_TRANSPORT=3Dy
>>> # CONFIG_VME_BUS is not set
>>> # CONFIG_PWM is not set
>>> CONFIG_IRQCHIP=3Dy
>>> CONFIG_ARM_GIC_MAX_NR=3D1
>>> # CONFIG_IPACK_BUS is not set
>>> # CONFIG_RESET_CONTROLLER is not set
>>> CONFIG_FMC=3Dy
>>> # CONFIG_FMC_FAKEDEV is not set
>>> CONFIG_FMC_TRIVIAL=3Dy
>>> CONFIG_FMC_WRITE_EEPROM=3Dy
>>> # CONFIG_FMC_CHARDEV is not set
>>> =

>>> #
>>> # PHY Subsystem
>>> #
>>> CONFIG_GENERIC_PHY=3Dy
>>> CONFIG_PHY_PXA_28NM_HSIC=3Dy
>>> CONFIG_PHY_PXA_28NM_USB2=3Dy
>>> CONFIG_BCM_KONA_USB2_PHY=3Dy
>>> CONFIG_PHY_TUSB1210=3Dy
>>> # CONFIG_POWERCAP is not set
>>> CONFIG_MCB=3Dy
>>> CONFIG_MCB_PCI=3Dy
>>> =

>>> #
>>> # Performance monitor support
>>> #
>>> CONFIG_RAS=3Dy
>>> CONFIG_MCE_AMD_INJ=3Dy
>>> CONFIG_THUNDERBOLT=3Dy
>>> =

>>> #
>>> # Android
>>> #
>>> CONFIG_ANDROID=3Dy
>>> CONFIG_ANDROID_BINDER_IPC=3Dy
>>> CONFIG_ANDROID_BINDER_IPC_32BIT=3Dy
>>> # CONFIG_DEV_DAX is not set
>>> CONFIG_NVMEM=3Dy
>>> CONFIG_STM=3Dy
>>> CONFIG_STM_DUMMY=3Dy
>>> CONFIG_STM_SOURCE_CONSOLE=3Dy
>>> # CONFIG_STM_SOURCE_HEARTBEAT is not set
>>> # CONFIG_INTEL_TH is not set
>>> =

>>> #
>>> # FPGA Configuration Support
>>> #
>>> CONFIG_FPGA=3Dy
>>> # CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
>>> =

>>> #
>>> # Firmware Drivers
>>> #
>>> CONFIG_ARM_SCPI_PROTOCOL=3Dy
>>> CONFIG_ARM_SCPI_POWER_DOMAIN=3Dy
>>> CONFIG_EDD=3Dy
>>> CONFIG_EDD_OFF=3Dy
>>> CONFIG_FIRMWARE_MEMMAP=3Dy
>>> # CONFIG_DELL_RBU is not set
>>> CONFIG_DCDBAS=3Dy
>>> CONFIG_DMIID=3Dy
>>> CONFIG_DMI_SYSFS=3Dy
>>> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
>>> CONFIG_ISCSI_IBFT_FIND=3Dy
>>> CONFIG_FW_CFG_SYSFS=3Dy
>>> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
>>> CONFIG_GOOGLE_FIRMWARE=3Dy
>>> =

>>> #
>>> # Google Firmware Drivers
>>> #
>>> CONFIG_GOOGLE_MEMCONSOLE=3Dy
>>> CONFIG_UEFI_CPER=3Dy
>>> =

>>> #
>>> # File systems
>>> #
>>> CONFIG_DCACHE_WORD_ACCESS=3Dy
>>> CONFIG_FS_POSIX_ACL=3Dy
>>> CONFIG_EXPORTFS=3Dy
>>> # CONFIG_EXPORTFS_BLOCK_OPS is not set
>>> CONFIG_FILE_LOCKING=3Dy
>>> CONFIG_MANDATORY_FILE_LOCKING=3Dy
>>> CONFIG_FSNOTIFY=3Dy
>>> CONFIG_DNOTIFY=3Dy
>>> CONFIG_INOTIFY_USER=3Dy
>>> # CONFIG_FANOTIFY is not set
>>> CONFIG_QUOTA=3Dy
>>> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
>>> CONFIG_PRINT_QUOTA_WARNING=3Dy
>>> # CONFIG_QUOTA_DEBUG is not set
>>> CONFIG_QUOTA_TREE=3Dy
>>> # CONFIG_QFMT_V1 is not set
>>> CONFIG_QFMT_V2=3Dy
>>> CONFIG_QUOTACTL=3Dy
>>> # CONFIG_AUTOFS4_FS is not set
>>> CONFIG_FUSE_FS=3Dy
>>> CONFIG_CUSE=3Dy
>>> CONFIG_OVERLAY_FS=3Dy
>>> =

>>> #
>>> # Caches
>>> #
>>> CONFIG_FSCACHE=3Dy
>>> # CONFIG_FSCACHE_STATS is not set
>>> # CONFIG_FSCACHE_HISTOGRAM is not set
>>> CONFIG_FSCACHE_DEBUG=3Dy
>>> # CONFIG_FSCACHE_OBJECT_LIST is not set
>>> =

>>> #
>>> # Pseudo filesystems
>>> #
>>> CONFIG_PROC_FS=3Dy
>>> # CONFIG_PROC_KCORE is not set
>>> CONFIG_PROC_SYSCTL=3Dy
>>> CONFIG_PROC_PAGE_MONITOR=3Dy
>>> CONFIG_PROC_CHILDREN=3Dy
>>> CONFIG_KERNFS=3Dy
>>> CONFIG_SYSFS=3Dy
>>> CONFIG_TMPFS=3Dy
>>> # CONFIG_TMPFS_POSIX_ACL is not set
>>> # CONFIG_TMPFS_XATTR is not set
>>> CONFIG_HUGETLBFS=3Dy
>>> CONFIG_HUGETLB_PAGE=3Dy
>>> CONFIG_CONFIGFS_FS=3Dy
>>> CONFIG_MISC_FILESYSTEMS=3Dy
>>> CONFIG_ORANGEFS_FS=3Dy
>>> CONFIG_JFFS2_FS=3Dy
>>> CONFIG_JFFS2_FS_DEBUG=3D0
>>> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
>>> CONFIG_JFFS2_FS_WBUF_VERIFY=3Dy
>>> # CONFIG_JFFS2_SUMMARY is not set
>>> # CONFIG_JFFS2_FS_XATTR is not set
>>> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
>>> CONFIG_JFFS2_ZLIB=3Dy
>>> # CONFIG_JFFS2_LZO is not set
>>> CONFIG_JFFS2_RTIME=3Dy
>>> CONFIG_JFFS2_RUBIN=3Dy
>>> CONFIG_JFFS2_CMODE_NONE=3Dy
>>> # CONFIG_JFFS2_CMODE_PRIORITY is not set
>>> # CONFIG_JFFS2_CMODE_SIZE is not set
>>> # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
>>> # CONFIG_UBIFS_FS is not set
>>> # CONFIG_LOGFS is not set
>>> CONFIG_ROMFS_FS=3Dy
>>> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
>>> CONFIG_ROMFS_ON_MTD=3Dy
>>> CONFIG_PSTORE=3Dy
>>> # CONFIG_PSTORE_ZLIB_COMPRESS is not set
>>> # CONFIG_PSTORE_LZO_COMPRESS is not set
>>> CONFIG_PSTORE_LZ4_COMPRESS=3Dy
>>> CONFIG_PSTORE_CONSOLE=3Dy
>>> # CONFIG_PSTORE_PMSG is not set
>>> # CONFIG_PSTORE_RAM is not set
>>> CONFIG_NETWORK_FILESYSTEMS=3Dy
>>> CONFIG_NLS=3Dy
>>> CONFIG_NLS_DEFAULT=3D"iso8859-1"
>>> CONFIG_NLS_CODEPAGE_437=3Dy
>>> # CONFIG_NLS_CODEPAGE_737 is not set
>>> CONFIG_NLS_CODEPAGE_775=3Dy
>>> # CONFIG_NLS_CODEPAGE_850 is not set
>>> # CONFIG_NLS_CODEPAGE_852 is not set
>>> CONFIG_NLS_CODEPAGE_855=3Dy
>>> CONFIG_NLS_CODEPAGE_857=3Dy
>>> CONFIG_NLS_CODEPAGE_860=3Dy
>>> CONFIG_NLS_CODEPAGE_861=3Dy
>>> CONFIG_NLS_CODEPAGE_862=3Dy
>>> # CONFIG_NLS_CODEPAGE_863 is not set
>>> CONFIG_NLS_CODEPAGE_864=3Dy
>>> CONFIG_NLS_CODEPAGE_865=3Dy
>>> CONFIG_NLS_CODEPAGE_866=3Dy
>>> CONFIG_NLS_CODEPAGE_869=3Dy
>>> CONFIG_NLS_CODEPAGE_936=3Dy
>>> CONFIG_NLS_CODEPAGE_950=3Dy
>>> CONFIG_NLS_CODEPAGE_932=3Dy
>>> CONFIG_NLS_CODEPAGE_949=3Dy
>>> # CONFIG_NLS_CODEPAGE_874 is not set
>>> CONFIG_NLS_ISO8859_8=3Dy
>>> CONFIG_NLS_CODEPAGE_1250=3Dy
>>> CONFIG_NLS_CODEPAGE_1251=3Dy
>>> CONFIG_NLS_ASCII=3Dy
>>> CONFIG_NLS_ISO8859_1=3Dy
>>> CONFIG_NLS_ISO8859_2=3Dy
>>> # CONFIG_NLS_ISO8859_3 is not set
>>> CONFIG_NLS_ISO8859_4=3Dy
>>> # CONFIG_NLS_ISO8859_5 is not set
>>> CONFIG_NLS_ISO8859_6=3Dy
>>> CONFIG_NLS_ISO8859_7=3Dy
>>> CONFIG_NLS_ISO8859_9=3Dy
>>> CONFIG_NLS_ISO8859_13=3Dy
>>> # CONFIG_NLS_ISO8859_14 is not set
>>> CONFIG_NLS_ISO8859_15=3Dy
>>> CONFIG_NLS_KOI8_R=3Dy
>>> # CONFIG_NLS_KOI8_U is not set
>>> CONFIG_NLS_MAC_ROMAN=3Dy
>>> # CONFIG_NLS_MAC_CELTIC is not set
>>> # CONFIG_NLS_MAC_CENTEURO is not set
>>> # CONFIG_NLS_MAC_CROATIAN is not set
>>> CONFIG_NLS_MAC_CYRILLIC=3Dy
>>> CONFIG_NLS_MAC_GAELIC=3Dy
>>> # CONFIG_NLS_MAC_GREEK is not set
>>> CONFIG_NLS_MAC_ICELAND=3Dy
>>> CONFIG_NLS_MAC_INUIT=3Dy
>>> CONFIG_NLS_MAC_ROMANIAN=3Dy
>>> CONFIG_NLS_MAC_TURKISH=3Dy
>>> # CONFIG_NLS_UTF8 is not set
>>> =

>>> #
>>> # Kernel hacking
>>> #
>>> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>>> =

>>> #
>>> # printk and dmesg options
>>> #
>>> CONFIG_PRINTK_TIME=3Dy
>>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>>> # CONFIG_BOOT_PRINTK_DELAY is not set
>>> # CONFIG_DYNAMIC_DEBUG is not set
>>> =

>>> #
>>> # Compile-time checks and compiler options
>>> #
>>> # CONFIG_DEBUG_INFO is not set
>>> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
>>> CONFIG_ENABLE_MUST_CHECK=3Dy
>>> CONFIG_FRAME_WARN=3D2048
>>> # CONFIG_STRIP_ASM_SYMS is not set
>>> CONFIG_READABLE_ASM=3Dy
>>> CONFIG_UNUSED_SYMBOLS=3Dy
>>> CONFIG_PAGE_OWNER=3Dy
>>> CONFIG_DEBUG_FS=3Dy
>>> CONFIG_HEADERS_CHECK=3Dy
>>> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
>>> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>>> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
>>> CONFIG_FRAME_POINTER=3Dy
>>> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
>>> CONFIG_MAGIC_SYSRQ=3Dy
>>> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>>> CONFIG_DEBUG_KERNEL=3Dy
>>> =

>>> #
>>> # Memory Debugging
>>> #
>>> CONFIG_PAGE_EXTENSION=3Dy
>>> CONFIG_DEBUG_PAGEALLOC=3Dy
>>> CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
>>> # CONFIG_PAGE_POISONING is not set
>>> # CONFIG_DEBUG_OBJECTS is not set
>>> # CONFIG_DEBUG_SLAB is not set
>>> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>>> # CONFIG_DEBUG_KMEMLEAK is not set
>>> CONFIG_DEBUG_STACK_USAGE=3Dy
>>> # CONFIG_DEBUG_VM is not set
>>> CONFIG_DEBUG_VIRTUAL=3Dy
>>> CONFIG_DEBUG_MEMORY_INIT=3Dy
>>> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
>>> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
>>> CONFIG_DEBUG_STACKOVERFLOW=3Dy
>>> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
>>> CONFIG_DEBUG_SHIRQ=3Dy
>>> =

>>> #
>>> # Debug Lockups and Hangs
>>> #
>>> CONFIG_LOCKUP_DETECTOR=3Dy
>>> CONFIG_HARDLOCKUP_DETECTOR=3Dy
>>> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
>>> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
>>> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
>>> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
>>> # CONFIG_DETECT_HUNG_TASK is not set
>>> # CONFIG_WQ_WATCHDOG is not set
>>> CONFIG_PANIC_ON_OOPS=3Dy
>>> CONFIG_PANIC_ON_OOPS_VALUE=3D1
>>> CONFIG_PANIC_TIMEOUT=3D0
>>> CONFIG_SCHED_DEBUG=3Dy
>>> # CONFIG_SCHED_INFO is not set
>>> # CONFIG_SCHEDSTATS is not set
>>> CONFIG_SCHED_STACK_END_CHECK=3Dy
>>> # CONFIG_DEBUG_TIMEKEEPING is not set
>>> # CONFIG_TIMER_STATS is not set
>>> =

>>> #
>>> # Lock Debugging (spinlocks, mutexes, etc...)
>>> #
>>> # CONFIG_DEBUG_RT_MUTEXES is not set
>>> CONFIG_DEBUG_SPINLOCK=3Dy
>>> CONFIG_DEBUG_MUTEXES=3Dy
>>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
>>> CONFIG_DEBUG_LOCK_ALLOC=3Dy
>>> # CONFIG_PROVE_LOCKING is not set
>>> CONFIG_LOCKDEP=3Dy
>>> CONFIG_LOCK_STAT=3Dy
>>> CONFIG_DEBUG_LOCKDEP=3Dy
>>> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>>> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>>> CONFIG_LOCK_TORTURE_TEST=3Dy
>>> CONFIG_STACKTRACE=3Dy
>>> # CONFIG_DEBUG_KOBJECT is not set
>>> CONFIG_DEBUG_BUGVERBOSE=3Dy
>>> # CONFIG_DEBUG_LIST is not set
>>> # CONFIG_DEBUG_PI_LIST is not set
>>> # CONFIG_DEBUG_SG is not set
>>> CONFIG_DEBUG_NOTIFIERS=3Dy
>>> CONFIG_DEBUG_CREDENTIALS=3Dy
>>> =

>>> #
>>> # RCU Debugging
>>> #
>>> # CONFIG_PROVE_RCU is not set
>>> # CONFIG_SPARSE_RCU_POINTER is not set
>>> CONFIG_TORTURE_TEST=3Dy
>>> # CONFIG_RCU_PERF_TEST is not set
>>> CONFIG_RCU_TORTURE_TEST=3Dy
>>> CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT=3Dy
>>> CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT_DELAY=3D3
>>> CONFIG_RCU_TORTURE_TEST_SLOW_INIT=3Dy
>>> CONFIG_RCU_TORTURE_TEST_SLOW_INIT_DELAY=3D3
>>> CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP=3Dy
>>> CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP_DELAY=3D3
>>> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
>>> CONFIG_RCU_TRACE=3Dy
>>> # CONFIG_RCU_EQS_DEBUG is not set
>>> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>>> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
>>> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
>>> # CONFIG_FAULT_INJECTION is not set
>>> # CONFIG_LATENCYTOP is not set
>>> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
>>> # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
>>> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>>> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>>> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
>>> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>>> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>>> CONFIG_TRACE_CLOCK=3Dy
>>> CONFIG_TRACING_SUPPORT=3Dy
>>> # CONFIG_FTRACE is not set
>>> =

>>> #
>>> # Runtime Testing
>>> #
>>> # CONFIG_TEST_LIST_SORT is not set
>>> # CONFIG_BACKTRACE_SELF_TEST is not set
>>> CONFIG_RBTREE_TEST=3Dy
>>> # CONFIG_ATOMIC64_SELFTEST is not set
>>> CONFIG_TEST_HEXDUMP=3Dy
>>> CONFIG_TEST_STRING_HELPERS=3Dy
>>> # CONFIG_TEST_KSTRTOX is not set
>>> CONFIG_TEST_PRINTF=3Dy
>>> CONFIG_TEST_BITMAP=3Dy
>>> CONFIG_TEST_UUID=3Dy
>>> CONFIG_TEST_RHASHTABLE=3Dy
>>> # CONFIG_TEST_HASH is not set
>>> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
>>> CONFIG_BUILD_DOCSRC=3Dy
>>> # CONFIG_DMA_API_DEBUG is not set
>>> CONFIG_TEST_FIRMWARE=3Dy
>>> # CONFIG_TEST_UDELAY is not set
>>> CONFIG_MEMTEST=3Dy
>>> # CONFIG_SAMPLES is not set
>>> CONFIG_HAVE_ARCH_KGDB=3Dy
>>> # CONFIG_KGDB is not set
>>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>>> # CONFIG_UBSAN is not set
>>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>>> CONFIG_STRICT_DEVMEM=3Dy
>>> CONFIG_IO_STRICT_DEVMEM=3Dy
>>> CONFIG_X86_VERBOSE_BOOTUP=3Dy
>>> # CONFIG_EARLY_PRINTK is not set
>>> CONFIG_X86_PTDUMP_CORE=3Dy
>>> CONFIG_X86_PTDUMP=3Dy
>>> # CONFIG_DEBUG_RODATA_TEST is not set
>>> # CONFIG_DEBUG_WX is not set
>>> # CONFIG_DOUBLEFAULT is not set
>>> # CONFIG_DEBUG_TLBFLUSH is not set
>>> # CONFIG_IOMMU_STRESS is not set
>>> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
>>> CONFIG_IO_DELAY_TYPE_0X80=3D0
>>> CONFIG_IO_DELAY_TYPE_0XED=3D1
>>> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
>>> CONFIG_IO_DELAY_TYPE_NONE=3D3
>>> # CONFIG_IO_DELAY_0X80 is not set
>>> CONFIG_IO_DELAY_0XED=3Dy
>>> # CONFIG_IO_DELAY_UDELAY is not set
>>> # CONFIG_IO_DELAY_NONE is not set
>>> CONFIG_DEFAULT_IO_DELAY_TYPE=3D1
>>> # CONFIG_DEBUG_BOOT_PARAMS is not set
>>> # CONFIG_CPA_DEBUG is not set
>>> # CONFIG_OPTIMIZE_INLINING is not set
>>> CONFIG_DEBUG_ENTRY=3Dy
>>> # CONFIG_DEBUG_NMI_SELFTEST is not set
>>> # CONFIG_X86_DEBUG_FPU is not set
>>> CONFIG_PUNIT_ATOM_DEBUG=3Dy
>>> =

>>> #
>>> # Security options
>>> #
>>> # CONFIG_KEYS is not set
>>> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
>>> CONFIG_SECURITY=3Dy
>>> # CONFIG_SECURITYFS is not set
>>> # CONFIG_SECURITY_NETWORK is not set
>>> CONFIG_SECURITY_PATH=3Dy
>>> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
>>> CONFIG_HAVE_ARCH_HARDENED_USERCOPY=3Dy
>>> # CONFIG_HARDENED_USERCOPY is not set
>>> # CONFIG_SECURITY_TOMOYO is not set
>>> # CONFIG_SECURITY_APPARMOR is not set
>>> # CONFIG_SECURITY_YAMA is not set
>>> CONFIG_INTEGRITY=3Dy
>>> # CONFIG_IMA is not set
>>> # CONFIG_EVM is not set
>>> CONFIG_DEFAULT_SECURITY_DAC=3Dy
>>> CONFIG_DEFAULT_SECURITY=3D""
>>> CONFIG_CRYPTO=3Dy
>>> =

>>> #
>>> # Crypto core or helper
>>> #
>>> CONFIG_CRYPTO_ALGAPI=3Dy
>>> CONFIG_CRYPTO_ALGAPI2=3Dy
>>> CONFIG_CRYPTO_AEAD=3Dy
>>> CONFIG_CRYPTO_AEAD2=3Dy
>>> CONFIG_CRYPTO_BLKCIPHER=3Dy
>>> CONFIG_CRYPTO_BLKCIPHER2=3Dy
>>> CONFIG_CRYPTO_HASH=3Dy
>>> CONFIG_CRYPTO_HASH2=3Dy
>>> CONFIG_CRYPTO_RNG=3Dy
>>> CONFIG_CRYPTO_RNG2=3Dy
>>> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
>>> CONFIG_CRYPTO_AKCIPHER2=3Dy
>>> CONFIG_CRYPTO_KPP2=3Dy
>>> # CONFIG_CRYPTO_RSA is not set
>>> # CONFIG_CRYPTO_DH is not set
>>> CONFIG_CRYPTO_ECDH=3Dy
>>> CONFIG_CRYPTO_MANAGER=3Dy
>>> CONFIG_CRYPTO_MANAGER2=3Dy
>>> # CONFIG_CRYPTO_USER is not set
>>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>>> CONFIG_CRYPTO_GF128MUL=3Dy
>>> CONFIG_CRYPTO_NULL=3Dy
>>> CONFIG_CRYPTO_NULL2=3Dy
>>> CONFIG_CRYPTO_PCRYPT=3Dy
>>> CONFIG_CRYPTO_WORKQUEUE=3Dy
>>> CONFIG_CRYPTO_CRYPTD=3Dy
>>> # CONFIG_CRYPTO_MCRYPTD is not set
>>> CONFIG_CRYPTO_AUTHENC=3Dy
>>> CONFIG_CRYPTO_ABLK_HELPER=3Dy
>>> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
>>> =

>>> #
>>> # Authenticated Encryption with Associated Data
>>> #
>>> CONFIG_CRYPTO_CCM=3Dy
>>> CONFIG_CRYPTO_GCM=3Dy
>>> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
>>> CONFIG_CRYPTO_SEQIV=3Dy
>>> CONFIG_CRYPTO_ECHAINIV=3Dy
>>> =

>>> #
>>> # Block modes
>>> #
>>> CONFIG_CRYPTO_CBC=3Dy
>>> CONFIG_CRYPTO_CTR=3Dy
>>> CONFIG_CRYPTO_CTS=3Dy
>>> # CONFIG_CRYPTO_ECB is not set
>>> CONFIG_CRYPTO_LRW=3Dy
>>> # CONFIG_CRYPTO_PCBC is not set
>>> CONFIG_CRYPTO_XTS=3Dy
>>> CONFIG_CRYPTO_KEYWRAP=3Dy
>>> =

>>> #
>>> # Hash modes
>>> #
>>> CONFIG_CRYPTO_CMAC=3Dy
>>> CONFIG_CRYPTO_HMAC=3Dy
>>> # CONFIG_CRYPTO_XCBC is not set
>>> CONFIG_CRYPTO_VMAC=3Dy
>>> =

>>> #
>>> # Digest
>>> #
>>> # CONFIG_CRYPTO_CRC32C is not set
>>> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
>>> CONFIG_CRYPTO_CRC32=3Dy
>>> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
>>> CONFIG_CRYPTO_CRCT10DIF=3Dy
>>> CONFIG_CRYPTO_GHASH=3Dy
>>> CONFIG_CRYPTO_POLY1305=3Dy
>>> CONFIG_CRYPTO_MD4=3Dy
>>> # CONFIG_CRYPTO_MD5 is not set
>>> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
>>> CONFIG_CRYPTO_RMD128=3Dy
>>> # CONFIG_CRYPTO_RMD160 is not set
>>> # CONFIG_CRYPTO_RMD256 is not set
>>> CONFIG_CRYPTO_RMD320=3Dy
>>> CONFIG_CRYPTO_SHA1=3Dy
>>> CONFIG_CRYPTO_SHA256=3Dy
>>> CONFIG_CRYPTO_SHA512=3Dy
>>> CONFIG_CRYPTO_SHA3=3Dy
>>> # CONFIG_CRYPTO_TGR192 is not set
>>> CONFIG_CRYPTO_WP512=3Dy
>>> =

>>> #
>>> # Ciphers
>>> #
>>> CONFIG_CRYPTO_AES=3Dy
>>> CONFIG_CRYPTO_AES_586=3Dy
>>> # CONFIG_CRYPTO_AES_NI_INTEL is not set
>>> # CONFIG_CRYPTO_ANUBIS is not set
>>> # CONFIG_CRYPTO_ARC4 is not set
>>> CONFIG_CRYPTO_BLOWFISH=3Dy
>>> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
>>> CONFIG_CRYPTO_CAMELLIA=3Dy
>>> CONFIG_CRYPTO_CAST_COMMON=3Dy
>>> CONFIG_CRYPTO_CAST5=3Dy
>>> CONFIG_CRYPTO_CAST6=3Dy
>>> CONFIG_CRYPTO_DES=3Dy
>>> CONFIG_CRYPTO_FCRYPT=3Dy
>>> CONFIG_CRYPTO_KHAZAD=3Dy
>>> CONFIG_CRYPTO_SALSA20=3Dy
>>> CONFIG_CRYPTO_SALSA20_586=3Dy
>>> CONFIG_CRYPTO_CHACHA20=3Dy
>>> # CONFIG_CRYPTO_SEED is not set
>>> CONFIG_CRYPTO_SERPENT=3Dy
>>> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
>>> CONFIG_CRYPTO_TEA=3Dy
>>> CONFIG_CRYPTO_TWOFISH=3Dy
>>> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
>>> CONFIG_CRYPTO_TWOFISH_586=3Dy
>>> =

>>> #
>>> # Compression
>>> #
>>> CONFIG_CRYPTO_DEFLATE=3Dy
>>> CONFIG_CRYPTO_LZO=3Dy
>>> # CONFIG_CRYPTO_842 is not set
>>> # CONFIG_CRYPTO_LZ4 is not set
>>> # CONFIG_CRYPTO_LZ4HC is not set
>>> =

>>> #
>>> # Random Number Generation
>>> #
>>> # CONFIG_CRYPTO_ANSI_CPRNG is not set
>>> CONFIG_CRYPTO_DRBG_MENU=3Dy
>>> CONFIG_CRYPTO_DRBG_HMAC=3Dy
>>> CONFIG_CRYPTO_DRBG_HASH=3Dy
>>> # CONFIG_CRYPTO_DRBG_CTR is not set
>>> CONFIG_CRYPTO_DRBG=3Dy
>>> CONFIG_CRYPTO_JITTERENTROPY=3Dy
>>> # CONFIG_CRYPTO_USER_API_HASH is not set
>>> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
>>> # CONFIG_CRYPTO_USER_API_RNG is not set
>>> # CONFIG_CRYPTO_USER_API_AEAD is not set
>>> # CONFIG_CRYPTO_HW is not set
>>> =

>>> #
>>> # Certificates for signature checking
>>> #
>>> CONFIG_HAVE_KVM=3Dy
>>> # CONFIG_VIRTUALIZATION is not set
>>> # CONFIG_BINARY_PRINTF is not set
>>> =

>>> #
>>> # Library routines
>>> #
>>> CONFIG_BITREVERSE=3Dy
>>> # CONFIG_HAVE_ARCH_BITREVERSE is not set
>>> CONFIG_RATIONAL=3Dy
>>> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>>> CONFIG_GENERIC_STRNLEN_USER=3Dy
>>> CONFIG_GENERIC_NET_UTILS=3Dy
>>> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>>> CONFIG_GENERIC_PCI_IOMAP=3Dy
>>> CONFIG_GENERIC_IOMAP=3Dy
>>> CONFIG_GENERIC_IO=3Dy
>>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>>> CONFIG_CRC_CCITT=3Dy
>>> CONFIG_CRC16=3Dy
>>> CONFIG_CRC_T10DIF=3Dy
>>> CONFIG_CRC_ITU_T=3Dy
>>> CONFIG_CRC32=3Dy
>>> CONFIG_CRC32_SELFTEST=3Dy
>>> CONFIG_CRC32_SLICEBY8=3Dy
>>> # CONFIG_CRC32_SLICEBY4 is not set
>>> # CONFIG_CRC32_SARWATE is not set
>>> # CONFIG_CRC32_BIT is not set
>>> # CONFIG_CRC7 is not set
>>> # CONFIG_LIBCRC32C is not set
>>> CONFIG_CRC8=3Dy
>>> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
>>> CONFIG_RANDOM32_SELFTEST=3Dy
>>> CONFIG_ZLIB_INFLATE=3Dy
>>> CONFIG_ZLIB_DEFLATE=3Dy
>>> CONFIG_LZO_COMPRESS=3Dy
>>> CONFIG_LZO_DECOMPRESS=3Dy
>>> CONFIG_LZ4_COMPRESS=3Dy
>>> CONFIG_LZ4_DECOMPRESS=3Dy
>>> CONFIG_XZ_DEC=3Dy
>>> # CONFIG_XZ_DEC_X86 is not set
>>> CONFIG_XZ_DEC_POWERPC=3Dy
>>> # CONFIG_XZ_DEC_IA64 is not set
>>> # CONFIG_XZ_DEC_ARM is not set
>>> # CONFIG_XZ_DEC_ARMTHUMB is not set
>>> CONFIG_XZ_DEC_SPARC=3Dy
>>> CONFIG_XZ_DEC_BCJ=3Dy
>>> CONFIG_XZ_DEC_TEST=3Dy
>>> CONFIG_DECOMPRESS_GZIP=3Dy
>>> CONFIG_DECOMPRESS_BZIP2=3Dy
>>> CONFIG_DECOMPRESS_LZMA=3Dy
>>> CONFIG_DECOMPRESS_LZO=3Dy
>>> CONFIG_GENERIC_ALLOCATOR=3Dy
>>> CONFIG_REED_SOLOMON=3Dy
>>> CONFIG_REED_SOLOMON_DEC16=3Dy
>>> CONFIG_BCH=3Dy
>>> CONFIG_BCH_CONST_PARAMS=3Dy
>>> CONFIG_RADIX_TREE_MULTIORDER=3Dy
>>> CONFIG_HAS_IOMEM=3Dy
>>> CONFIG_HAS_IOPORT_MAP=3Dy
>>> CONFIG_HAS_DMA=3Dy
>>> CONFIG_CHECK_SIGNATURE=3Dy
>>> # CONFIG_CPUMASK_OFFSTACK is not set
>>> CONFIG_CPU_RMAP=3Dy
>>> CONFIG_DQL=3Dy
>>> CONFIG_NLATTR=3Dy
>>> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
>>> # CONFIG_CORDIC is not set
>>> # CONFIG_DDR is not set
>>> # CONFIG_IRQ_POLL is not set
>>> CONFIG_LIBFDT=3Dy
>>> # CONFIG_SG_SPLIT is not set
>>> # CONFIG_SG_POOL is not set
>>> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
>>> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
>>> CONFIG_STACKDEPOT=3Dy
>>
>>
>>-- =

>>
>>Best Regards,
>>Peter Chen
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============7620634390966087134==--

