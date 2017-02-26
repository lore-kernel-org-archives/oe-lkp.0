Content-Type: multipart/mixed; boundary="===============7243556207477394131=="
MIME-Version: 1.0
From: Daniel Vetter <daniel@ffwll.ch>
To: lkp@lists.01.org
Subject: Re: [drm] bea5b158ff BUG: unable to handle kernel NULL pointer dereference at 0000000000000748
Date: Sun, 26 Feb 2017 22:34:51 +0100
Message-ID: <20170226213451.toyw6fkpeisjhhf6@phenom.ffwll.local>
In-Reply-To: <20170218051047.pglsr4vwelqtrz6z@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7243556207477394131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 01:10:47PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> FYI, this debug patch triggers BUG in DRM subsystem.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit bea5b158ff0da9c7246ff391f754f5f38e34577a
> Author:     Rob Herring <robh@kernel.org>
> AuthorDate: Thu Aug 11 10:20:58 2016 -0500
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Wed Aug 31 15:13:55 2016 +0200

Seems like gfb->base.dev =3D=3D NULL in bochs_fbdev_destroy, which should be
impossible if we don't have a double-free going on somewhere. bochs is not
yet converted to the fancy new refcounting scheme that we have since a few
years (just for the fbdev/fbcon fb), which also means it's pain to trace
this. And no one maintains it really, so I guess not sure this will get
fixed fast :(
-Daniel

> =

>      driver core: add test of driver remove calls during probe
>      =

>      In recent discussions on ksummit-discuss[1], it was suggested to do a
>      sequence of probe, remove, probe for testing driver remove paths. Th=
is
>      adds a kconfig option for said test.
>      =

>      [1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2016=
-August/003459.html
>      =

>      Suggested-by: Arnd Bergmann <arnd@arndb.de>
>      Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>      Signed-off-by: Rob Herring <robh@kernel.org>
>      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =

> +------------------------------------------+------------+------------+---=
---------+
> |                                          | cebf8fd169 | bea5b158ff | b1=
ac883759 |
> +------------------------------------------+------------+------------+---=
---------+
> | boot_successes                           | 62         | 0          | 0 =
         |
> | boot_failures                            | 0          | 22         | 25=
         |
> | BUG:unable_to_handle_kernel              | 0          | 22         | 25=
         |
> | Oops:#[##]                               | 0          | 22         | 25=
         |
> | RIP:__lock_acquire                       | 0          | 22         |   =
         |
> | calltrace:bochs_init                     | 0          | 22         |   =
         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 22         | 25=
         |
> +------------------------------------------+------------+------------+---=
---------+
> =

> [   11.709231] [TTM] Initializing pool allocator
> [   11.710232] [TTM] Initializing DMA pool allocator
> [   11.711503] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.=
0 on minor 1
> [   11.713363] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000748
> [   11.715123] IP: [<ffffffff810e3db3>] __lock_acquire+0x93/0x9a0
> [   11.716586] PGD 0 =

> [   11.717058] Oops: 0000 [#1]
> [   11.717665] CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-rc4-00003-gb=
ea5b15 #1
> [   11.719302] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   11.721518] task: ffff88001d468000 task.stack: ffff88001d470000
> [   11.722839] RIP: 0010:[<ffffffff810e3db3>]  [<ffffffff810e3db3>] __loc=
k_acquire+0x93/0x9a0
> [   11.724845] RSP: 0000:ffff88001d473b60  EFLAGS: 00010097
> [   11.726009] RAX: 0000000000000000 RBX: 0000000000000246 RCX: 000000000=
0000000
> [   11.727563] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
> [   11.729170] RBP: ffff88001d473b90 R08: 0000000000000000 R09: 000000000=
0000000
> [   11.730717] R10: 0000000000000001 R11: 0000000000000000 R12: 000000000=
0000000
> [   11.732328] R13: 0000000000000000 R14: 0000000000000740 R15: ffff88001=
d468000
> [   11.733869] FS:  0000000000000000(0000) GS:ffffffff8202f000(0000) knlG=
S:0000000000000000
> [   11.735624] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   11.736923] CR2: 0000000000000748 CR3: 000000000200c000 CR4: 000000000=
00006b0
> [   11.738498] Stack:
> [   11.738970]  ffff88001d473c08 0000000000000246 ffff88001d468000 ffff88=
0018bb3668
> [   11.740679]  ffffffff82267208 00000000000006d0 ffff88001d473bc8 ffffff=
ff810e4a98
> [   11.742424]  ffffffff813a2a60 ffffffff00000000 0000000000000000 ffff88=
001d468000
> [   11.744238] Call Trace:
> [   11.744830]  [<ffffffff810e4a98>] lock_acquire+0x68/0x90
> [   11.746051]  [<ffffffff813a2a60>] ? drm_mode_object_unregister+0x20/0x=
50
> [   11.747511]  [<ffffffff8190f04a>] mutex_lock_nested+0x6a/0x300
> [   11.748820]  [<ffffffff813a2a60>] ? drm_mode_object_unregister+0x20/0x=
50
> [   11.750276]  [<ffffffff813a2a60>] ? drm_mode_object_unregister+0x20/0x=
50
> [   11.751795]  [<ffffffff810f540e>] ? srcu_barrier+0xe/0x10
> [   11.753061]  [<ffffffff813a2a60>] drm_mode_object_unregister+0x20/0x50
> [   11.754555]  [<ffffffff813a3315>] drm_framebuffer_unregister_private+0=
x15/0x20
> [   11.756244]  [<ffffffff815ef2aa>] bochs_fbdev_fini+0x5a/0x70
> [   11.757528]  [<ffffffff815ee146>] bochs_unload+0x16/0x50
> [   11.758755]  [<ffffffff8139eeaa>] drm_dev_unregister+0x3a/0xc0
> [   11.760100]  [<ffffffff8139ef6f>] drm_put_dev+0x3f/0x50
> [   11.761260]  [<ffffffff815ee090>] bochs_pci_remove+0x10/0x20
> [   11.762557]  [<ffffffff812896c6>] pci_device_remove+0x46/0xb0
> [   11.763909]  [<ffffffff815ff970>] driver_probe_device+0x150/0x300
> [   11.765290]  [<ffffffff815ffb8d>] __driver_attach+0x6d/0x90
> [   11.766551]  [<ffffffff815ffb20>] ? driver_probe_device+0x300/0x300
> [   11.767952]  [<ffffffff815fdb44>] bus_for_each_dev+0x54/0x90
> [   11.769194]  [<ffffffff815ffc89>] driver_attach+0x19/0x20
> [   11.770414]  [<ffffffff815fe576>] bus_add_driver+0xe6/0x200
> [   11.771730]  [<ffffffff81600103>] driver_register+0x83/0xc0
> [   11.773043]  [<ffffffff8128987b>] __pci_register_driver+0x5b/0x60
> [   11.774427]  [<ffffffff823425c3>] ? nouveau_drm_init+0x1cf/0x1cf
> [   11.775757]  [<ffffffff813a029c>] drm_pci_init+0x4c/0xf0
> [   11.776940]  [<ffffffff8139ee58>] ? drm_dev_register+0xb8/0xd0
> [   11.778203]  [<ffffffff823425c3>] ? nouveau_drm_init+0x1cf/0x1cf
> [   11.779537]  [<ffffffff8231370b>] ? do_early_param+0x8f/0x8f
> [   11.780849]  [<ffffffff823425da>] bochs_init+0x17/0x19
> [   11.781978]  [<ffffffff82314052>] do_one_initcall+0x89/0x11a
> [   11.783233]  [<ffffffff8231370b>] ? do_early_param+0x8f/0x8f
> [   11.784497]  [<ffffffff82314262>] kernel_init_freeable+0x17f/0x215
> [   11.785866]  [<ffffffff8190cac9>] kernel_init+0x9/0xf0
> [   11.786990]  [<ffffffff8191351f>] ret_from_fork+0x1f/0x40
> [   11.788216]  [<ffffffff8190cac0>] ? rest_init+0xc0/0xc0
> [   11.789367] Code: 85 93 07 00 00 48 c7 c1 5a 44 d7 81 48 c7 c2 2e 10 d=
7 81 be 92 0c 00 00 48 c7 c7 20 84 d7 81 e8 94 0f fd ff e9 f1 08 00 00 89 f=
0 <49> 8b 44 c6 08 48 85 c0 75 21 31 d2 4c 89 f7 44 89 45 d0 89 4d =

> [   11.794799] RIP  [<ffffffff810e3db3>] __lock_acquire+0x93/0x9a0
> [   11.796299]  RSP <ffff88001d473b60>
> [   11.797093] CR2: 0000000000000748
> [   11.797859] ---[ end trace 103f598e68dbf79f ]---
> [   11.798934] Kernel panic - not syncing: Fatal exception
> =

> git bisect start v4.9 v4.8 --
> git bisect  bad 9fe68cad6e74967b88d0c6aeca7d9cd6b6e91942  # 05:25      0-=
      1  Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/=
git/herbert/crypto-2.6
> git bisect  bad 5fa0eb0b4d4780fbd6d8a09850cc4fd539e9fe65  # 05:35      0-=
      4  Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
> git bisect  bad d8ea757b25ec82687c497fc90aa83f9bcea24b5b  # 05:50      0-=
      1  Merge tag 'xtensa-20161005' of git://github.com/jcmvbkbc/linux-xte=
nsa
> git bisect  bad e6445f52d9c8b0e6557a45fa7d0e8e088d430a8c  # 06:14      0-=
      1  Merge tag 'usb-4.9-rc1' of git://git.kernel.org/pub/scm/linux/kern=
el/git/gregkh/usb
> git bisect good 1a4a2bc460721bc8f91e4c1294d39b38e5af132f  # 06:45     20+=
      0  Merge branch 'x86-asm-for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tip/tip
> git bisect good 49deffe0b0e4c2030696c7a6fd680bacf4761069  # 07:35     20+=
      0  Merge tag 'arc-4.9-rc1' of git://git.kernel.org/pub/scm/linux/kern=
el/git/vgupta/arc
> git bisect good 597f03f9d133e9837d00965016170271d4f87dcf  # 08:15     20+=
      0  Merge branch 'smp-hotplug-for-linus' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/tip/tip
> git bisect  bad 9929780e86854833e649b39b290b5fe921eb1701  # 08:43      0-=
      1  Merge tag 'driver-core-4.9-rc1' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/gregkh/driver-core
> git bisect good 7a53eea1f7b527fd3b6d7ca992914840981afe99  # 08:57     21+=
      1  Merge tag 'char-misc-4.9-rc1' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/gregkh/char-misc
> git bisect  bad 775115c06091fcfa1189a50aca488fa596839617  # 09:29      0-=
      2  drivers/base dmam_declare_coherent_memory leaks
> git bisect  bad 426bc8e789f8ac84270b196191904d347586032f  # 09:40      0-=
      3  base: soc: make it explicitly non-modular
> git bisect  bad bea5b158ff0da9c7246ff391f754f5f38e34577a  # 09:53      0-=
      2  driver core: add test of driver remove calls during probe
> git bisect good cebf8fd16900fdfd58c0028617944f808f97fe50  # 10:04     21+=
      0  driver core: fix race between creating/querying glue dir and its c=
leanup
> # first bad commit: [bea5b158ff0da9c7246ff391f754f5f38e34577a] driver cor=
e: add test of driver remove calls during probe
> git bisect good cebf8fd16900fdfd58c0028617944f808f97fe50  # 10:13     60+=
      0  driver core: fix race between creating/querying glue dir and its c=
leanup
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad bea5b158ff0da9c7246ff391f754f5f38e34577a  # 10:25      0-=
     12  driver core: add test of driver remove calls during probe
> # extra tests on HEAD of linux-devel/devel-spot-201702160837
> git bisect  bad b1ac88375913cf81c56dbf5a2c9b64863f188ee2  # 10:25      0-=
     25  0day head guard for 'devel-spot-201702160837'
> # extra tests on tree/branch linus/master
> git bisect  bad 6dc39c50e4aeb769c8ae06edf2b1a732f3490913  # 10:43      0-=
      1  Merge branch 'for-linus' of git://git.kernel.dk/linux-block
> # extra tests on tree/branch linus/master
> git bisect  bad 6dc39c50e4aeb769c8ae06edf2b1a732f3490913  # 10:43      0-=
      2  Merge branch 'for-linus' of git://git.kernel.dk/linux-block
> # extra tests on tree/branch linux-next/master
> git bisect  bad 4ce4a759a3e221b5265ebd03c2f8888b69a7cf3e  # 11:07      0-=
      1  Add linux-next specific files for 20170217
> =

> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.8.0-rc4 Kernel Configuration
> #
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
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
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
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
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
> CONFIG_KERNEL_LZMA=3Dy
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_FHANDLE=3Dy
> # CONFIG_USELIB is not set
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
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
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
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> # CONFIG_TREE_RCU_TRACE is not set
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_NMI_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> # CONFIG_RT_GROUP_SCHED is not set
> CONFIG_CGROUP_PIDS=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_DEBUG=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_XZ is not set
> CONFIG_RD_LZO=3Dy
> # CONFIG_RD_LZ4 is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_ANON_INODES=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_SHMEM is not set
> # CONFIG_AIO is not set
> # CONFIG_ADVISE_SYSCALLS is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_MEMBARRIER=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # CONFIG_VM_EVENT_COUNTERS is not set
> CONFIG_SLUB_DEBUG=3Dy
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> # CONFIG_PROFILING is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
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
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGIN_CYC_COMPLEXITY=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> # CONFIG_HAVE_ARCH_HASH is not set
> CONFIG_ISA_BUS_API=3Dy
> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> # CONFIG_MODULES is not set
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
> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
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
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> CONFIG_CALGARY_IOMMU=3Dy
> CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D1
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_UP_LATE_INIT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> # CONFIG_VM86 is not set
> # CONFIG_X86_16BIT is not set
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_I8K=3Dy
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> # CONFIG_SPARSEMEM_VMEMMAP is not set
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_NEED_PER_CPU_KM=3Dy
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_FRAME_VECTOR=3Dy
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> # CONFIG_X86_SMAP is not set
> CONFIG_X86_INTEL_MPX=3Dy
> # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> # CONFIG_KEXEC is not set
> # CONFIG_KEXEC_FILE is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_LEGACY_VSYSCALL_NATIVE is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
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
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
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
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Memory power savings
> #
> # CONFIG_I7300_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCI_CNB20LE_QUIRK=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_HT_IRQ=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> =

> #
> # PCI host controller drivers
> #
> # CONFIG_PCIE_DW_PLAT is not set
> CONFIG_ISA_BUS=3Dy
> # CONFIG_ISA_DMA_API is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> # CONFIG_PCMCIA_LOAD_CIS is not set
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> # CONFIG_YENTA_O2 is not set
> CONFIG_YENTA_RICOH=3Dy
> CONFIG_YENTA_TI=3Dy
> # CONFIG_YENTA_TOSHIBA is not set
> # CONFIG_PD6729 is not set
> CONFIG_I82092=3Dy
> CONFIG_PCCARD_NONSTATIC=3Dy
> # CONFIG_RAPIDIO is not set
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_KEYS_COMPAT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_VMD is not set
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_NET_KEY is not set
> # CONFIG_INET is not set
> # CONFIG_NETWORK_SECMARK is not set
> # CONFIG_NET_PTP_CLASSIFY is not set
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_ATM is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> # CONFIG_DNS_RESOLVER is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_HSR is not set
> # CONFIG_SOCK_CGROUP_DATA is not set
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_IRDA is not set
> # CONFIG_BT is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
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
> # CONFIG_NFC is not set
> # CONFIG_LWTUNNEL is not set
> # CONFIG_DST_CACHE is not set
> # CONFIG_NET_DEVLINK is not set
> CONFIG_MAY_USE_DEVLINK=3Dy
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
> CONFIG_FW_LOADER=3Dy
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_FENCE_TRACE is not set
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=3Dy
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_PC_PCMCIA is not set
> # CONFIG_PARPORT_GSC is not set
> CONFIG_PARPORT_AX88796=3Dy
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
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> CONFIG_AD525X_DPOT=3Dy
> # CONFIG_AD525X_DPOT_I2C is not set
> # CONFIG_DUMMY_IRQ is not set
> CONFIG_IBM_ASM=3Dy
> # CONFIG_PHANTOM is not set
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dy
> # CONFIG_TIFM_7XX1 is not set
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dy
> CONFIG_HP_ILO=3Dy
> # CONFIG_APDS9802ALS is not set
> # CONFIG_ISL29003 is not set
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dy
> # CONFIG_SENSORS_BH1780 is not set
> CONFIG_SENSORS_BH1770=3Dy
> # CONFIG_SENSORS_APDS990X is not set
> CONFIG_HMC6352=3Dy
> # CONFIG_DS1682 is not set
> # CONFIG_BMP085_I2C is not set
> # CONFIG_USB_SWITCH_FSA9480 is not set
> # CONFIG_SRAM is not set
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
> CONFIG_EEPROM_AT24=3Dy
> # CONFIG_EEPROM_LEGACY is not set
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_CB710_CORE=3Dy
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dy
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_INTEL_MEI=3Dy
> CONFIG_INTEL_MEI_ME=3Dy
> CONFIG_INTEL_MEI_TXE=3Dy
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC Bus Driver
> #
> CONFIG_INTEL_MIC_BUS=3Dy
> =

> #
> # SCIF Bus Driver
> #
> CONFIG_SCIF_BUS=3Dy
> =

> #
> # VOP Bus Driver
> #
> CONFIG_VOP_BUS=3Dy
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
> CONFIG_VOP=3Dy
> CONFIG_VHOST_RING=3Dy
> # CONFIG_GENWQE is not set
> CONFIG_ECHO=3Dy
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
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
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=3Dy
> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_NETDEVICES is not set
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
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dy
> CONFIG_INPUT_EVDEV=3Dy
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dy
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dy
> CONFIG_KEYBOARD_QT2160=3Dy
> # CONFIG_KEYBOARD_LKKBD is not set
> CONFIG_KEYBOARD_GPIO=3Dy
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> CONFIG_KEYBOARD_TCA6416=3Dy
> # CONFIG_KEYBOARD_TCA8418 is not set
> CONFIG_KEYBOARD_MATRIX=3Dy
> CONFIG_KEYBOARD_LM8323=3Dy
> CONFIG_KEYBOARD_LM8333=3Dy
> CONFIG_KEYBOARD_MAX7359=3Dy
> # CONFIG_KEYBOARD_MCS is not set
> CONFIG_KEYBOARD_MPR121=3Dy
> CONFIG_KEYBOARD_NEWTON=3Dy
> CONFIG_KEYBOARD_OPENCORES=3Dy
> CONFIG_KEYBOARD_SAMSUNG=3Dy
> # CONFIG_KEYBOARD_STOWAWAY is not set
> CONFIG_KEYBOARD_SUNKBD=3Dy
> CONFIG_KEYBOARD_TWL4030=3Dy
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> # CONFIG_RMI4_F30 is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> # CONFIG_SERIO_CT82C710 is not set
> CONFIG_SERIO_PARKBD=3Dy
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> # CONFIG_GAMEPORT_NS558 is not set
> CONFIG_GAMEPORT_L4=3Dy
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
> CONFIG_DEVMEM=3Dy
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
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> # CONFIG_SERIAL_8250_CS is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_FSL is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
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
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_TTY_PRINTK is not set
> CONFIG_PRINTER=3Dy
> # CONFIG_LP_CONSOLE is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_WATCHDOG=3Dy
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> # CONFIG_HW_RANDOM_VIA is not set
> # CONFIG_HW_RANDOM_VIRTIO is not set
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_NVRAM=3Dy
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
> =

> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> # CONFIG_CARDMAN_4000 is not set
> # CONFIG_CARDMAN_4040 is not set
> # CONFIG_MWAVE is not set
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> # CONFIG_TCG_TIS_I2C_INFINEON is not set
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> # CONFIG_TCG_NSC is not set
> CONFIG_TCG_ATMEL=3Dy
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_VTPM_PROXY=3Dy
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> # CONFIG_TELCLOCK is not set
> CONFIG_DEVPORT=3Dy
> CONFIG_XILLYBUS=3Dy
> # CONFIG_XILLYBUS_PCIE is not set
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
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> # CONFIG_I2C_MUX_PCA954x is not set
> CONFIG_I2C_MUX_REG=3Dy
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> CONFIG_I2C_ALI1563=3Dy
> CONFIG_I2C_ALI15X3=3Dy
> CONFIG_I2C_AMD756=3Dy
> # CONFIG_I2C_AMD756_S4882 is not set
> CONFIG_I2C_AMD8111=3Dy
> CONFIG_I2C_I801=3Dy
> # CONFIG_I2C_ISCH is not set
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
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
> # CONFIG_I2C_SCMI is not set
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dy
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_EMEV2=3Dy
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_KEMPLD is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=3Dy
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
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
> # CONFIG_PPS is not set
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
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_LYNXPOINT is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_ZX is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_104_DIO_48E=3Dy
> CONFIG_GPIO_104_IDIO_16=3Dy
> # CONFIG_GPIO_104_IDI_48 is not set
> # CONFIG_GPIO_F7188X is not set
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> # CONFIG_GPIO_WS16C48 is not set
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> # CONFIG_GPIO_ADP5588_IRQ is not set
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dy
> # CONFIG_GPIO_MAX732X_IRQ is not set
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_SX150X is not set
> CONFIG_GPIO_TPIC2810=3Dy
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_CRYSTAL_COVE=3Dy
> CONFIG_GPIO_DA9052=3Dy
> CONFIG_GPIO_DA9055=3Dy
> CONFIG_GPIO_JANZ_TTL=3Dy
> CONFIG_GPIO_KEMPLD=3Dy
> # CONFIG_GPIO_LP3943 is not set
> CONFIG_GPIO_PALMAS=3Dy
> CONFIG_GPIO_TPS65218=3Dy
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_TWL4030=3Dy
> CONFIG_GPIO_TWL6040=3Dy
> CONFIG_GPIO_WM831X=3Dy
> CONFIG_GPIO_WM8350=3Dy
> CONFIG_GPIO_WM8994=3Dy
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> CONFIG_GPIO_ML_IOH=3Dy
> CONFIG_GPIO_RDC321X=3Dy
> =

> #
> # SPI or I2C GPIO expanders
> #
> # CONFIG_GPIO_MCP23S08 is not set
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> # CONFIG_W1_SLAVE_DS2433 is not set
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_BQ27000=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> CONFIG_MAX8925_POWER=3Dy
> CONFIG_WM831X_BACKUP=3Dy
> CONFIG_WM831X_POWER=3Dy
> CONFIG_WM8350_POWER=3Dy
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> # CONFIG_BATTERY_DS2781 is not set
> CONFIG_BATTERY_DS2782=3Dy
> # CONFIG_BATTERY_SBS is not set
> CONFIG_BATTERY_BQ27XXX=3Dy
> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9052=3Dy
> # CONFIG_CHARGER_DA9150 is not set
> CONFIG_BATTERY_DA9150=3Dy
> # CONFIG_AXP288_FUEL_GAUGE is not set
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> # CONFIG_BATTERY_TWL4030_MADC is not set
> CONFIG_BATTERY_RX51=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_TWL4030=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_LP8788 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MAX14577 is not set
> # CONFIG_CHARGER_MAX77693 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_BQ24190=3Dy
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=3Dy
> # CONFIG_CHARGER_BQ25890 is not set
> CONFIG_CHARGER_SMB347=3Dy
> CONFIG_CHARGER_TPS65217=3Dy
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_AXP20X_POWER=3Dy
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_AVS=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dy
> CONFIG_SENSORS_ABITUGURU3=3Dy
> CONFIG_SENSORS_AD7414=3Dy
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> # CONFIG_SENSORS_ADM1026 is not set
> CONFIG_SENSORS_ADM1029=3Dy
> # CONFIG_SENSORS_ADM1031 is not set
> # CONFIG_SENSORS_ADM9240 is not set
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> CONFIG_SENSORS_K8TEMP=3Dy
> CONFIG_SENSORS_K10TEMP=3Dy
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9052_ADC=3Dy
> CONFIG_SENSORS_DA9055=3Dy
> CONFIG_SENSORS_I5K_AMB=3Dy
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> # CONFIG_SENSORS_MC13783_ADC is not set
> CONFIG_SENSORS_FSCHMD=3Dy
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> # CONFIG_SENSORS_HIH6130 is not set
> # CONFIG_SENSORS_IBMAEM is not set
> # CONFIG_SENSORS_IBMPEX is not set
> CONFIG_SENSORS_IIO_HWMON=3Dy
> CONFIG_SENSORS_I5500=3Dy
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=3Dy
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=3Dy
> # CONFIG_SENSORS_LINEAGE is not set
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> # CONFIG_SENSORS_LTC4215 is not set
> CONFIG_SENSORS_LTC4222=3Dy
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dy
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_MAX16065=3Dy
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> # CONFIG_SENSORS_MAX6639 is not set
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_MAX31790=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> # CONFIG_SENSORS_LM92 is not set
> CONFIG_SENSORS_LM93=3Dy
> # CONFIG_SENSORS_LM95234 is not set
> # CONFIG_SENSORS_LM95241 is not set
> CONFIG_SENSORS_LM95245=3Dy
> # CONFIG_SENSORS_PC87360 is not set
> # CONFIG_SENSORS_PC87427 is not set
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NCT7904=3Dy
> # CONFIG_SENSORS_PCF8591 is not set
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> CONFIG_SENSORS_ADM1275=3Dy
> CONFIG_SENSORS_LM25066=3Dy
> # CONFIG_SENSORS_LTC2978 is not set
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX16064=3Dy
> # CONFIG_SENSORS_MAX20751 is not set
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dy
> CONFIG_SENSORS_TPS40422=3Dy
> CONFIG_SENSORS_UCD9000=3Dy
> CONFIG_SENSORS_UCD9200=3Dy
> CONFIG_SENSORS_ZL6100=3Dy
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHT3x=3Dy
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> CONFIG_SENSORS_SCH5636=3Dy
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS1015 is not set
> CONFIG_SENSORS_ADS7828=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> # CONFIG_SENSORS_INA209 is not set
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_INA3221=3Dy
> CONFIG_SENSORS_TC74=3Dy
> CONFIG_SENSORS_THMC50=3Dy
> CONFIG_SENSORS_TMP102=3Dy
> CONFIG_SENSORS_TMP103=3Dy
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_TWL4030_MADC=3Dy
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> # CONFIG_SENSORS_W83795 is not set
> # CONFIG_SENSORS_W83L785TS is not set
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> # CONFIG_SENSORS_WM831X is not set
> CONFIG_SENSORS_WM8350=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INTEL_POWERCLAMP is not set
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> CONFIG_INTEL_PCH_THERMAL=3Dy
> CONFIG_GENERIC_ADC_THERMAL=3Dy
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> # CONFIG_WATCHDOG_SYSFS is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dy
> # CONFIG_DA9052_WATCHDOG is not set
> CONFIG_DA9055_WATCHDOG=3Dy
> # CONFIG_DA9063_WATCHDOG is not set
> # CONFIG_DA9062_WATCHDOG is not set
> # CONFIG_MENF21BMC_WATCHDOG is not set
> # CONFIG_WM831X_WATCHDOG is not set
> # CONFIG_WM8350_WATCHDOG is not set
> CONFIG_XILINX_WATCHDOG=3Dy
> CONFIG_ZIIRAVE_WATCHDOG=3Dy
> CONFIG_CADENCE_WATCHDOG=3Dy
> CONFIG_DW_WATCHDOG=3Dy
> # CONFIG_TWL4030_WATCHDOG is not set
> CONFIG_MAX63XX_WATCHDOG=3Dy
> CONFIG_RETU_WATCHDOG=3Dy
> # CONFIG_ACQUIRE_WDT is not set
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dy
> CONFIG_ALIM7101_WDT=3Dy
> CONFIG_EBC_C384_WDT=3Dy
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> # CONFIG_IBMASR is not set
> CONFIG_WAFER_WDT=3Dy
> # CONFIG_I6300ESB_WDT is not set
> CONFIG_IE6XX_WDT=3Dy
> # CONFIG_ITCO_WDT is not set
> # CONFIG_IT8712F_WDT is not set
> CONFIG_IT87_WDT=3Dy
> CONFIG_HP_WATCHDOG=3Dy
> # CONFIG_KEMPLD_WDT is not set
> # CONFIG_HPWDT_NMI_DECODING is not set
> # CONFIG_SC1200_WDT is not set
> CONFIG_PC87413_WDT=3Dy
> # CONFIG_NV_TCO is not set
> CONFIG_60XX_WDT=3Dy
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dy
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=3Dy
> # CONFIG_W83877F_WDT is not set
> # CONFIG_W83977F_WDT is not set
> CONFIG_MACHZ_WDT=3Dy
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> CONFIG_INTEL_MEI_WDT=3Dy
> # CONFIG_NI903X_WDT is not set
> # CONFIG_MEN_A21_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> # CONFIG_WDTPCI is not set
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> # CONFIG_BCMA is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> # CONFIG_MFD_CROS_EC is not set
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> CONFIG_MFD_DA9055=3Dy
> CONFIG_MFD_DA9062=3Dy
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC=3Dy
> CONFIG_MFD_INTEL_LPSS=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=3Dy
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_RETU=3Dy
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_MFD_RDC321X=3Dy
> # CONFIG_MFD_RTSX_PCI is not set
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_SEC_CORE=3Dy
> CONFIG_MFD_SI476X_CORE=3Dy
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_SMSC is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> CONFIG_MFD_LP3943=3Dy
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_PALMAS=3Dy
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_MFD_TPS65218=3Dy
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_MFD_TWL4030_AUDIO is not set
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dy
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> # CONFIG_MFD_ARIZONA_I2C is not set
> CONFIG_MFD_WM8400=3Dy
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> # CONFIG_REGULATOR is not set
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
> # CONFIG_MEDIA_RC_SUPPORT is not set
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> CONFIG_VIDEO_DEV=3Dy
> # CONFIG_VIDEO_V4L2_SUBDEV_API is not set
> CONFIG_VIDEO_V4L2=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_VIDEO_TUNER=3Dy
> CONFIG_VIDEOBUF_GEN=3Dy
> CONFIG_VIDEOBUF_DMA_SG=3Dy
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_DMA_SG=3Dy
> CONFIG_DVB_CORE=3Dy
> CONFIG_TTPCI_EEPROM=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> # CONFIG_DVB_DYNAMIC_MINORS is not set
> =

> #
> # Media drivers
> #
> CONFIG_MEDIA_PCI_SUPPORT=3Dy
> =

> #
> # Media capture/analog/hybrid TV support
> #
> CONFIG_VIDEO_CX25821=3Dy
> CONFIG_VIDEO_CX25821_ALSA=3Dy
> # CONFIG_VIDEO_SAA7134 is not set
> CONFIG_VIDEO_SAA7164=3Dy
> =

> #
> # Media digital TV PCI Adapters
> #
> CONFIG_DVB_AV7110_IR=3Dy
> CONFIG_DVB_AV7110=3Dy
> # CONFIG_DVB_AV7110_OSD is not set
> CONFIG_DVB_BUDGET_CORE=3Dy
> # CONFIG_DVB_BUDGET is not set
> CONFIG_DVB_BUDGET_AV=3Dy
> # CONFIG_DVB_BUDGET_PATCH is not set
> # CONFIG_DVB_B2C2_FLEXCOP_PCI is not set
> # CONFIG_DVB_PLUTO2 is not set
> CONFIG_DVB_PT1=3Dy
> CONFIG_DVB_PT3=3Dy
> CONFIG_DVB_NGENE=3Dy
> CONFIG_DVB_DDBRIDGE=3Dy
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_SMS_SDIO_DRV=3Dy
> CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> =

> #
> # common driver options
> #
> CONFIG_VIDEO_TVEEPROM=3Dy
> CONFIG_VIDEO_SAA7146=3Dy
> CONFIG_VIDEO_SAA7146_VV=3Dy
> CONFIG_SMS_SIANO_MDTV=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, frontends)
> #
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
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
> # Miscellaneous helper chips
> #
> =

> #
> # Sensors used on soc_camera driver
> #
> CONFIG_MEDIA_TUNER=3Dy
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2131=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dy
> CONFIG_DVB_STV090x=3Dy
> CONFIG_DVB_STV6110x=3Dy
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dy
> CONFIG_DVB_TDA18271C2DD=3Dy
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_STV0299=3Dy
> CONFIG_DVB_TDA8083=3Dy
> CONFIG_DVB_TDA8261=3Dy
> CONFIG_DVB_VES1X93=3Dy
> CONFIG_DVB_TUA6100=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> CONFIG_DVB_L64781=3Dy
> CONFIG_DVB_TDA1004X=3Dy
> CONFIG_DVB_TDA10048=3Dy
> # CONFIG_DVB_AS102_FE is not set
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
> CONFIG_DVB_LGDT330X=3Dy
> CONFIG_DVB_S5H1411=3Dy
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dy
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dy
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_LNBP21=3Dy
> =

> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
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
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_FBDEV_EMULATION is not set
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> CONFIG_DRM_TTM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_CH7006 is not set
> # CONFIG_DRM_I2C_SIL164 is not set
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> CONFIG_DRM_RADEON=3Dy
> CONFIG_DRM_RADEON_USERPTR=3Dy
> CONFIG_DRM_AMDGPU=3Dy
> CONFIG_DRM_AMDGPU_CIK=3Dy
> CONFIG_DRM_AMDGPU_USERPTR=3Dy
> CONFIG_DRM_AMDGPU_GART_DEBUGFS=3Dy
> # CONFIG_DRM_AMD_POWERPLAY is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_AMD_ACP is not set
> CONFIG_DRM_NOUVEAU=3Dy
> CONFIG_NOUVEAU_DEBUG=3D5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_VGEM=3Dy
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_UDL is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> CONFIG_DRM_CIRRUS_QEMU=3Dy
> # CONFIG_DRM_QXL is not set
> CONFIG_DRM_BOCHS=3Dy
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> CONFIG_FIRMWARE_EDID=3Dy
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
> CONFIG_FB_FOREIGN_ENDIAN=3Dy
> # CONFIG_FB_BOTH_ENDIAN is not set
> # CONFIG_FB_BIG_ENDIAN is not set
> CONFIG_FB_LITTLE_ENDIAN=3Dy
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
> CONFIG_FB_SVGALIB=3Dy
> # CONFIG_FB_MACMODES is not set
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_CIRRUS=3Dy
> CONFIG_FB_PM2=3Dy
> CONFIG_FB_PM2_FIFO_DISCONNECT=3Dy
> CONFIG_FB_CYBER2000=3Dy
> CONFIG_FB_CYBER2000_DDC=3Dy
> # CONFIG_FB_ARC is not set
> CONFIG_FB_ASILIANT=3Dy
> CONFIG_FB_IMSTT=3Dy
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_VESA is not set
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> CONFIG_FB_S1D13XXX=3Dy
> # CONFIG_FB_NVIDIA is not set
> CONFIG_FB_RIVA=3Dy
> # CONFIG_FB_RIVA_I2C is not set
> # CONFIG_FB_RIVA_DEBUG is not set
> CONFIG_FB_RIVA_BACKLIGHT=3Dy
> # CONFIG_FB_I740 is not set
> CONFIG_FB_LE80578=3Dy
> CONFIG_FB_CARILLO_RANCH=3Dy
> CONFIG_FB_MATROX=3Dy
> CONFIG_FB_MATROX_MILLENIUM=3Dy
> # CONFIG_FB_MATROX_MYSTIQUE is not set
> # CONFIG_FB_MATROX_G is not set
> CONFIG_FB_MATROX_I2C=3Dy
> # CONFIG_FB_RADEON is not set
> CONFIG_FB_ATY128=3Dy
> CONFIG_FB_ATY128_BACKLIGHT=3Dy
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> CONFIG_FB_SAVAGE=3Dy
> # CONFIG_FB_SAVAGE_I2C is not set
> # CONFIG_FB_SAVAGE_ACCEL is not set
> CONFIG_FB_SIS=3Dy
> # CONFIG_FB_SIS_300 is not set
> CONFIG_FB_SIS_315=3Dy
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> CONFIG_FB_KYRO=3Dy
> CONFIG_FB_3DFX=3Dy
> CONFIG_FB_3DFX_ACCEL=3Dy
> CONFIG_FB_3DFX_I2C=3Dy
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> CONFIG_FB_ARK=3Dy
> # CONFIG_FB_PM3 is not set
> CONFIG_FB_CARMINE=3Dy
> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> CONFIG_FB_SM501=3Dy
> CONFIG_FB_IBM_GXT4500=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_FB_METRONOME=3Dy
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> # CONFIG_FB_MB862XX_I2C is not set
> CONFIG_FB_BROADSHEET=3Dy
> # CONFIG_FB_AUO_K190X is not set
> # CONFIG_FB_SIMPLE is not set
> CONFIG_FB_SM712=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dy
> # CONFIG_BACKLIGHT_PWM is not set
> # CONFIG_BACKLIGHT_DA903X is not set
> # CONFIG_BACKLIGHT_DA9052 is not set
> # CONFIG_BACKLIGHT_MAX8925 is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_WM831X is not set
> CONFIG_BACKLIGHT_ADP8860=3Dy
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_AAT2870=3Dy
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> # CONFIG_BACKLIGHT_LP855X is not set
> CONFIG_BACKLIGHT_LP8788=3Dy
> CONFIG_BACKLIGHT_PANDORA=3Dy
> CONFIG_BACKLIGHT_TPS65217=3Dy
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> CONFIG_SND=3Dy
> CONFIG_SND_TIMER=3Dy
> CONFIG_SND_PCM=3Dy
> CONFIG_SND_HWDEP=3Dy
> CONFIG_SND_RAWMIDI=3Dy
> CONFIG_SND_SEQUENCER=3Dy
> CONFIG_SND_SEQ_DUMMY=3Dy
> CONFIG_SND_OSSEMUL=3Dy
> CONFIG_SND_MIXER_OSS=3Dy
> # CONFIG_SND_PCM_OSS is not set
> CONFIG_SND_PCM_TIMER=3Dy
> # CONFIG_SND_SEQUENCER_OSS is not set
> CONFIG_SND_HRTIMER=3Dy
> CONFIG_SND_SEQ_HRTIMER_DEFAULT=3Dy
> # CONFIG_SND_DYNAMIC_MINORS is not set
> # CONFIG_SND_SUPPORT_OLD_API is not set
> # CONFIG_SND_PROC_FS is not set
> CONFIG_SND_VERBOSE_PRINTK=3Dy
> CONFIG_SND_DEBUG=3Dy
> CONFIG_SND_DEBUG_VERBOSE=3Dy
> CONFIG_SND_DMA_SGBUF=3Dy
> CONFIG_SND_RAWMIDI_SEQ=3Dy
> # CONFIG_SND_OPL3_LIB_SEQ is not set
> # CONFIG_SND_OPL4_LIB_SEQ is not set
> # CONFIG_SND_SBAWE_SEQ is not set
> # CONFIG_SND_EMU10K1_SEQ is not set
> CONFIG_SND_MPU401_UART=3Dy
> CONFIG_SND_VX_LIB=3Dy
> CONFIG_SND_DRIVERS=3Dy
> CONFIG_SND_PCSP=3Dy
> CONFIG_SND_DUMMY=3Dy
> CONFIG_SND_ALOOP=3Dy
> CONFIG_SND_VIRMIDI=3Dy
> CONFIG_SND_MTPAV=3Dy
> CONFIG_SND_MTS64=3Dy
> CONFIG_SND_SERIAL_U16550=3Dy
> CONFIG_SND_MPU401=3Dy
> CONFIG_SND_PORTMAN2X4=3Dy
> # CONFIG_SND_PCI is not set
> =

> #
> # HD-Audio
> #
> CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> CONFIG_SND_PCMCIA=3Dy
> CONFIG_SND_VXPOCKET=3Dy
> CONFIG_SND_PDAUDIOCF=3Dy
> # CONFIG_SND_SOC is not set
> # CONFIG_SOUND_PRIME is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dy
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> CONFIG_HID_ACRUX=3Dy
> CONFIG_HID_ACRUX_FF=3Dy
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_AUREAL=3Dy
> # CONFIG_HID_BELKIN is not set
> CONFIG_HID_CHERRY=3Dy
> CONFIG_HID_CHICONY=3Dy
> # CONFIG_HID_PRODIKEYS is not set
> CONFIG_HID_CMEDIA=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> CONFIG_DRAGONRISE_FF=3Dy
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dy
> CONFIG_HID_KEYTOUCH=3Dy
> # CONFIG_HID_KYE is not set
> CONFIG_HID_WALTOP=3Dy
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dy
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MICROSOFT is not set
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_ORTEK=3Dy
> CONFIG_HID_PANTHERLORD=3Dy
> CONFIG_PANTHERLORD_FF=3Dy
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dy
> CONFIG_HID_PICOLCD_FB=3Dy
> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
> # CONFIG_HID_PICOLCD_LCD is not set
> # CONFIG_HID_PICOLCD_LEDS is not set
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_SAITEK=3Dy
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> # CONFIG_HID_SUNPLUS is not set
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_SMARTJOYPLUS=3Dy
> # CONFIG_SMARTJOYPLUS_FF is not set
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> # CONFIG_THRUSTMASTER_FF is not set
> # CONFIG_HID_WACOM is not set
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dy
> CONFIG_HID_ZEROPLUS=3Dy
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
> CONFIG_HID_ALPS=3Dy
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
> CONFIG_UWB=3Dy
> # CONFIG_UWB_WHCI is not set
> CONFIG_MMC=3Dy
> # CONFIG_MMC_DEBUG is not set
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> # CONFIG_SDIO_UART is not set
> CONFIG_MMC_TEST=3Dy
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_SDHCI=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> # CONFIG_MMC_SDHCI_PLTFM is not set
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_SDRICOH_CS=3Dy
> CONFIG_MMC_CB710=3Dy
> CONFIG_MMC_VIA_SDMMC=3Dy
> CONFIG_MMC_USDHI6ROL0=3Dy
> # CONFIG_MMC_TOSHIBA_PCI is not set
> CONFIG_MMC_MTK=3Dy
> CONFIG_MEMSTICK=3Dy
> # CONFIG_MEMSTICK_DEBUG is not set
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
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_LM3530 is not set
> CONFIG_LEDS_LM3642=3Dy
> CONFIG_LEDS_PCA9532=3Dy
> # CONFIG_LEDS_PCA9532_GPIO is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> CONFIG_LEDS_LP8788=3Dy
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dy
> CONFIG_LEDS_PCA955X=3Dy
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_WM831X_STATUS is not set
> CONFIG_LEDS_WM8350=3Dy
> CONFIG_LEDS_DA903X=3Dy
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_PWM=3Dy
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_INTEL_SS4200=3Dy
> # CONFIG_LEDS_LT3593 is not set
> # CONFIG_LEDS_MC13783 is not set
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dy
> CONFIG_LEDS_MAX8997=3Dy
> CONFIG_LEDS_LM355x=3Dy
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> CONFIG_ACCESSIBILITY=3Dy
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
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
> CONFIG_INTEL_IDMA64=3Dy
> # CONFIG_INTEL_IOATDMA is not set
> CONFIG_INTEL_MIC_X100_DMA=3Dy
> # CONFIG_QCOM_HIDMA_MGMT is not set
> CONFIG_QCOM_HIDMA=3Dy
> # CONFIG_DW_DMAC is not set
> # CONFIG_DW_DMAC_PCI is not set
> CONFIG_HSU_DMA=3Dy
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_UIO is not set
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_INPUT=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
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
> CONFIG_AD7606_IFACE_PARALLEL=3Dy
> =

> #
> # Analog digital bi-direction converters
> #
> CONFIG_ADT7316=3Dy
> # CONFIG_ADT7316_I2C is not set
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dy
> # CONFIG_AD7152 is not set
> CONFIG_AD7746=3Dy
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
> CONFIG_AD5933=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=3Dy
> CONFIG_TSL2583=3Dy
> CONFIG_TSL2x7x=3Dy
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=3Dy
> # CONFIG_ADE7854_I2C is not set
> =

> #
> # Resolver to digital converters
> #
> =

> #
> # Triggers - standalone
> #
> CONFIG_FB_SM750=3Dy
> CONFIG_FB_XGI=3Dy
> =

> #
> # Speakup console speech
> #
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID_LOW_MEMORY_KILLER=3Dy
> # CONFIG_SW_SYNC is not set
> CONFIG_ION=3Dy
> CONFIG_ION_TEST=3Dy
> # CONFIG_ION_DUMMY is not set
> # CONFIG_DGNC is not set
> CONFIG_GS_FPGABOOT=3Dy
> CONFIG_CRYPTO_SKEIN=3Dy
> # CONFIG_UNISYSSPAR is not set
> CONFIG_MOST=3Dy
> CONFIG_MOSTCORE=3Dy
> # CONFIG_AIM_CDEV is not set
> # CONFIG_AIM_NETWORK is not set
> # CONFIG_AIM_SOUND is not set
> # CONFIG_AIM_V4L2 is not set
> CONFIG_HDM_I2C=3Dy
> # CONFIG_KS7010 is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACER_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ALIENWARE_WMI is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_DELL_SMBIOS is not set
> # CONFIG_DELL_WMI_AIO is not set
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_HP_WMI is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> CONFIG_SENSORS_HDAPS=3Dy
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_EEEPC_LAPTOP is not set
> # CONFIG_ASUS_WMI is not set
> # CONFIG_ASUS_WIRELESS is not set
> CONFIG_ACPI_WMI=3Dy
> # CONFIG_MSI_WMI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_ACPI_TOSHIBA is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_PMC_CORE is not set
> CONFIG_IBM_RTL=3Dy
> # CONFIG_SAMSUNG_LAPTOP is not set
> CONFIG_MXM_WMI=3Dy
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_PVPANIC is not set
> # CONFIG_INTEL_PMC_IPC is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> CONFIG_INTEL_PUNIT_IPC=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> CONFIG_COMMON_CLK_WM831X=3Dy
> CONFIG_COMMON_CLK_SI5351=3Dy
> CONFIG_COMMON_CLK_CDCE706=3Dy
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> # CONFIG_CLK_TWL6040 is not set
> # CONFIG_COMMON_CLK_NXP is not set
> # CONFIG_COMMON_CLK_PALMAS is not set
> CONFIG_COMMON_CLK_PWM=3Dy
> # CONFIG_COMMON_CLK_PXA is not set
> # CONFIG_COMMON_CLK_PIC32 is not set
> # CONFIG_SUNXI_CCU is not set
> =

> #
> # Hardware Spinlock drivers
> #
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
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
> =

> #
> # Broadcom SoC drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> CONFIG_SOC_TI=3Dy
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_MAX14577 is not set
> CONFIG_EXTCON_MAX3355=3Dy
> # CONFIG_EXTCON_MAX77693 is not set
> # CONFIG_EXTCON_MAX8997 is not set
> # CONFIG_EXTCON_PALMAS is not set
> # CONFIG_EXTCON_RT8973A is not set
> # CONFIG_EXTCON_SM5502 is not set
> CONFIG_EXTCON_USB_GPIO=3Dy
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> CONFIG_IIO_SW_TRIGGER=3Dy
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dy
> # CONFIG_BMC150_ACCEL is not set
> # CONFIG_HID_SENSOR_ACCEL_3D is not set
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
> CONFIG_KXCJK1013=3Dy
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7660=3Dy
> CONFIG_MMA8452=3Dy
> CONFIG_MMA9551_CORE=3Dy
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=3Dy
> CONFIG_MXC4005=3Dy
> CONFIG_MXC6255=3Dy
> CONFIG_STK8312=3Dy
> CONFIG_STK8BA50=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD7291=3Dy
> CONFIG_AD799X=3Dy
> CONFIG_AXP288_ADC=3Dy
> CONFIG_DA9150_GPADC=3Dy
> CONFIG_LP8788_ADC=3Dy
> CONFIG_MAX1363=3Dy
> CONFIG_MCP3422=3Dy
> CONFIG_NAU7802=3Dy
> CONFIG_PALMAS_GPADC=3Dy
> CONFIG_TI_ADC081C=3Dy
> # CONFIG_TI_ADS1015 is not set
> CONFIG_TWL4030_MADC=3Dy
> CONFIG_TWL6030_GPADC=3Dy
> =

> #
> # Amplifiers
> #
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dy
> # CONFIG_IAQCORE is not set
> # CONFIG_VZ89X is not set
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # SSP Sensor Common
> #
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> # CONFIG_AD5064 is not set
> # CONFIG_AD5380 is not set
> CONFIG_AD5446=3Dy
> # CONFIG_AD5593R is not set
> # CONFIG_M62332 is not set
> CONFIG_MAX517=3Dy
> # CONFIG_MCP4725 is not set
> CONFIG_STX104=3Dy
> =

> #
> # IIO dummy driver
> #
> CONFIG_IIO_DUMMY_EVGEN=3Dy
> CONFIG_IIO_SIMPLE_DUMMY=3Dy
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
> CONFIG_BMG160=3Dy
> CONFIG_BMG160_I2C=3Dy
> CONFIG_HID_SENSOR_GYRO_3D=3Dy
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
> =

> #
> # Humidity sensors
> #
> CONFIG_AM2315=3Dy
> CONFIG_DHT11=3Dy
> # CONFIG_HDC100X is not set
> CONFIG_HTU21=3Dy
> CONFIG_SI7005=3Dy
> # CONFIG_SI7020 is not set
> =

> #
> # Inertial measurement units
> #
> # CONFIG_BMI160_I2C is not set
> # CONFIG_KMX61 is not set
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_INV_MPU6050_I2C=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dy
> CONFIG_AL3320A=3Dy
> CONFIG_APDS9300=3Dy
> # CONFIG_APDS9960 is not set
> # CONFIG_BH1750 is not set
> CONFIG_BH1780=3Dy
> CONFIG_CM32181=3Dy
> # CONFIG_CM3232 is not set
> # CONFIG_CM3323 is not set
> # CONFIG_CM36651 is not set
> # CONFIG_GP2AP020A00F is not set
> # CONFIG_ISL29125 is not set
> CONFIG_HID_SENSOR_ALS=3Dy
> CONFIG_HID_SENSOR_PROX=3Dy
> # CONFIG_JSA1212 is not set
> # CONFIG_RPR0521 is not set
> CONFIG_LTR501=3Dy
> # CONFIG_MAX44000 is not set
> CONFIG_OPT3001=3Dy
> CONFIG_PA12203001=3Dy
> # CONFIG_STK3310 is not set
> # CONFIG_TCS3414 is not set
> CONFIG_TCS3472=3Dy
> # CONFIG_SENSORS_TSL2563 is not set
> # CONFIG_TSL4531 is not set
> # CONFIG_US5182D is not set
> CONFIG_VCNL4000=3Dy
> CONFIG_VEML6070=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> # CONFIG_AK09911 is not set
> CONFIG_BMC150_MAGN=3Dy
> CONFIG_BMC150_MAGN_I2C=3Dy
> # CONFIG_MAG3110 is not set
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dy
> CONFIG_MMC35240=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> =

> #
> # Inclinometer sensors
> #
> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dy
> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dy
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> # CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
> CONFIG_IIO_SYSFS_TRIGGER=3Dy
> =

> #
> # Digital potentiometers
> #
> # CONFIG_DS1803 is not set
> CONFIG_MCP4531=3Dy
> # CONFIG_TPL0102 is not set
> =

> #
> # Pressure sensors
> #
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> CONFIG_HID_SENSOR_PRESS=3Dy
> CONFIG_HP03=3Dy
> # CONFIG_MPL115_I2C is not set
> # CONFIG_MPL3115 is not set
> CONFIG_MS5611=3Dy
> CONFIG_MS5611_I2C=3Dy
> CONFIG_MS5637=3Dy
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> CONFIG_T5403=3Dy
> # CONFIG_HP206C is not set
> =

> #
> # Lightning sensors
> #
> =

> #
> # Proximity sensors
> #
> CONFIG_LIDAR_LITE_V2=3Dy
> CONFIG_SX9500=3Dy
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dy
> # CONFIG_TMP006 is not set
> CONFIG_TSYS01=3Dy
> # CONFIG_TSYS02D is not set
> CONFIG_NTB=3Dy
> # CONFIG_NTB_AMD is not set
> # CONFIG_NTB_INTEL is not set
> CONFIG_NTB_PINGPONG=3Dy
> CONFIG_NTB_TOOL=3Dy
> CONFIG_NTB_PERF=3Dy
> # CONFIG_NTB_TRANSPORT is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_CRC=3Dy
> CONFIG_PWM_LP3943=3Dy
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dy
> CONFIG_PWM_TWL=3Dy
> # CONFIG_PWM_TWL_LED is not set
> CONFIG_ARM_GIC_MAX_NR=3D1
> CONFIG_IPACK_BUS=3Dy
> CONFIG_BOARD_TPCI200=3Dy
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_TI_SYSCON_RESET=3Dy
> CONFIG_FMC=3Dy
> # CONFIG_FMC_FAKEDEV is not set
> CONFIG_FMC_TRIVIAL=3Dy
> CONFIG_FMC_WRITE_EEPROM=3Dy
> # CONFIG_FMC_CHARDEV is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> CONFIG_RAS=3Dy
> CONFIG_THUNDERBOLT=3Dy
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> # CONFIG_ANDROID_BINDER_IPC is not set
> CONFIG_NVMEM=3Dy
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> CONFIG_INTEL_TH_GTH=3Dy
> # CONFIG_INTEL_TH_MSU is not set
> # CONFIG_INTEL_TH_PTI is not set
> CONFIG_INTEL_TH_DEBUG=3Dy
> =

> #
> # FPGA Configuration Support
> #
> CONFIG_FPGA=3Dy
> # CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
> =

> #
> # Firmware Drivers
> #
> # CONFIG_EDD is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_DMIID is not set
> # CONFIG_DMI_SYSFS is not set
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_FW_CFG_SYSFS is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
> #
> CONFIG_GOOGLE_MEMCONSOLE=3Dy
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_FS_POSIX_ACL is not set
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_MANDATORY_FILE_LOCKING is not set
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTACTL is not set
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> CONFIG_OVERLAY_FS=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> CONFIG_FSCACHE_DEBUG=3Dy
> CONFIG_FSCACHE_OBJECT_LIST=3Dy
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_VMCORE=3Dy
> # CONFIG_PROC_SYSCTL is not set
> # CONFIG_PROC_PAGE_MONITOR is not set
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> CONFIG_PSTORE=3Dy
> # CONFIG_PSTORE_ZLIB_COMPRESS is not set
> CONFIG_PSTORE_LZO_COMPRESS=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> CONFIG_PSTORE_CONSOLE=3Dy
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_RAM=3Dy
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=3Dy
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=3Dy
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> # CONFIG_NLS_CODEPAGE_863 is not set
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dy
> # CONFIG_NLS_CODEPAGE_866 is not set
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> CONFIG_NLS_ISO8859_8=3Dy
> CONFIG_NLS_CODEPAGE_1250=3Dy
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> # CONFIG_NLS_ISO8859_4 is not set
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=3Dy
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> # CONFIG_NLS_MAC_TURKISH is not set
> # CONFIG_NLS_UTF8 is not set
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
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D2048
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_READABLE_ASM=3Dy
> # CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_STACK_VALIDATION is not set
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_POISONING is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_DEBUG_VM is not set
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_KMEMCHECK is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> # CONFIG_KCOV is not set
> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> CONFIG_WQ_WATCHDOG=3Dy
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> CONFIG_DEBUG_TIMEKEEPING=3Dy
> CONFIG_TIMER_STATS=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> # CONFIG_PROVE_LOCKING is not set
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PI_LIST is not set
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> # CONFIG_PROVE_RCU is not set
> # CONFIG_SPARSE_RCU_POINTER is not set
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_PERF_TEST is not set
> CONFIG_RCU_TORTURE_TEST=3Dy
> CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT=3Dy
> CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT_DELAY=3D3
> CONFIG_RCU_TORTURE_TEST_SLOW_INIT=3Dy
> CONFIG_RCU_TORTURE_TEST_SLOW_INIT_DELAY=3D3
> CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP=3Dy
> CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP_DELAY=3D3
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_LATENCYTOP=3Dy
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
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> =

> #
> # Runtime Testing
> #
> CONFIG_TEST_LIST_SORT=3Dy
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> CONFIG_TEST_STRING_HELPERS=3Dy
> CONFIG_TEST_KSTRTOX=3Dy
> CONFIG_TEST_PRINTF=3Dy
> CONFIG_TEST_BITMAP=3Dy
> CONFIG_TEST_UUID=3Dy
> CONFIG_TEST_RHASHTABLE=3Dy
> CONFIG_TEST_HASH=3Dy
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_TEST_FIRMWARE=3Dy
> CONFIG_TEST_UDELAY=3Dy
> CONFIG_MEMTEST=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
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
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_OPTIMIZE_INLINING is not set
> # CONFIG_DEBUG_ENTRY is not set
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HAVE_ARCH_HARDENED_USERCOPY=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_YAMA is not set
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> # CONFIG_IMA_TEMPLATE is not set
> # CONFIG_IMA_NG_TEMPLATE is not set
> CONFIG_IMA_SIG_TEMPLATE=3Dy
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-sig"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> CONFIG_IMA_WRITE_POLICY=3Dy
> CONFIG_IMA_READ_POLICY=3Dy
> CONFIG_IMA_APPRAISE=3Dy
> CONFIG_EVM=3Dy
> # CONFIG_EVM_ATTR_FSUUID is not set
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
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> # CONFIG_CRYPTO_CCM is not set
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
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> =

> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> # CONFIG_CRYPTO_POLY1305_X86_64 is not set
> # CONFIG_CRYPTO_MD4 is not set
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> # CONFIG_CRYPTO_RMD128 is not set
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA1_MB=3Dy
> CONFIG_CRYPTO_SHA256_MB=3Dy
> CONFIG_CRYPTO_SHA512_MB=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> # CONFIG_CRYPTO_TGR192 is not set
> # CONFIG_CRYPTO_WP512 is not set
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_KHAZAD=3Dy
> # CONFIG_CRYPTO_SALSA20 is not set
> CONFIG_CRYPTO_SALSA20_X86_64=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
> # CONFIG_CRYPTO_TEA is not set
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
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
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
> CONFIG_CRYPTO_DEV_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_DD=3Dy
> CONFIG_CRYPTO_DEV_CCP_CRYPTO=3Dy
> CONFIG_CRYPTO_DEV_QAT=3Dy
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dy
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dy
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dy
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_KVM is not set
> # CONFIG_VHOST_NET is not set
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
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
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> # CONFIG_CRC_T10DIF is not set
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=3Dy
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> # CONFIG_XZ_DEC is not set
> # CONFIG_XZ_DEC_BCJ is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_DDR=3Dy
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> # CONFIG_SG_SPLIT is not set
> # CONFIG_SG_POOL is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
> CONFIG_STACKDEPOT=3Dy

> _______________________________________________
> dri-devel mailing list
> dri-devel(a)lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

--===============7243556207477394131==--

