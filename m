Content-Type: multipart/mixed; boundary="===============2224382154538704676=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm: readahead] 99b902528e: INFO: task trinity-main:404 blocked for more than 120 seconds.
Date: Sun, 28 Feb 2016 11:13:14 -0500
Message-ID: <20160228161314.GB25622@cmpxchg.org>
In-Reply-To: <56d155e6.tdVZAoB6dVUQYW8S%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2224382154538704676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

this patch shouldn't be in any tree I know of. Does your script pick
up patches from the mailing list and applies them automatically?

Thanks,
Johannes

On Sat, Feb 27, 2016 at 03:53:10PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux Johannes-Weiner/mm-readahead-do-not-cap-=
readahead-and-MADV_WILLNEED/20160224-094046
> =

> commit 99b902528e4e49cc02fcbc26cc0a10d0eaa70a3e
> Author:     Johannes Weiner <hannes@cmpxchg.org>
> AuthorDate: Tue Feb 23 17:38:47 2016 -0800
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Wed Feb 24 09:40:49 2016 +0800
> =

>     mm: readahead: do not cap readahead() and MADV_WILLNEED
>     =

>     All readahead is currently capped to a maximum of the device readahead
>     limit, which defaults to 128k. For heuristics-based readahead this
>     makes perfect sense, too, but unfortunately the limit is also applied
>     to the explicit readahead() or madvise(MADV_WILLNEED) syscalls, and
>     128k is an awfully low limit, particularly for bigger machines. It's
>     not unreasonable for a user on a 100G machine to say, read this 1G
>     file, and read it now, I'm going to access the whole thing shortly.
>     =

>     Since both readahead() and MADV_WILLNEED take an explicit length
>     parameter, it seems weird to truncate that request quietly. Just do
>     what the user asked for and leave the limiting to the heuristics.
>     =

>     Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> =

> +--------------------------------------------------+------------+--------=
----+------------+
> |                                                  | 4de8ebeff8 | 99b9025=
28e | 44ec563f74 |
> +--------------------------------------------------+------------+--------=
----+------------+
> | boot_successes                                   | 1919       | 902    =
    | 230        |
> | boot_failures                                    | 4          | 12     =
    | 8          |
> | IP-Config:Auto-configuration_of_network_failed   | 2          | 0      =
    | 4          |
> | BUG:kernel_test_crashed                          | 2          |        =
    |            |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks     | 0          | 3      =
    | 1          |
> | INFO:task_blocked_for_more_than#seconds          | 0          | 12     =
    |            |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 12     =
    | 4          |
> | backtrace:watchdog                               | 0          | 12     =
    | 4          |
> | backtrace:vfs_kern_mount                         | 0          | 0      =
    | 8          |
> | backtrace:mnt_init                               | 0          | 0      =
    | 8          |
> | backtrace:vfs_caches_init                        | 0          | 0      =
    | 8          |
> +--------------------------------------------------+------------+--------=
----+------------+
> =

> error: 'rc.local' exited outside the expected code flow.
> =

>  (t=3D31501 jiffies g=3D353 c=3D352 q=3D12507)
> [  241.872344] INFO: task trinity-main:404 blocked for more than 120 seco=
nds.
> [  241.872344] INFO: task trinity-main:404 blocked for more than 120 seco=
nds.
> [  241.874262]       Not tainted 4.5.0-rc5-00173-g99b9025 #1
> [  241.874262]       Not tainted 4.5.0-rc5-00173-g99b9025 #1
> [  241.875827] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  241.875827] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  241.887914] Kernel panic - not syncing: hung_task: blocked tasks
> [  241.887914] Kernel panic - not syncing: hung_task: blocked tasks
> [  241.889617] CPU: 0 PID: 16 Comm: khungtaskd Not tainted 4.5.0-rc5-0017=
3-g99b9025 #1
> [  241.889617] CPU: 0 PID: 16 Comm: khungtaskd Not tainted 4.5.0-rc5-0017=
3-g99b9025 #1
> [  241.891753]  0000000000000000
> [  241.891753]  0000000000000000 ffff8800101c7d90 ffff8800101c7d90 ffffff=
ff81817ca6 ffffffff81817ca6 ffffffff827c669a ffffffff827c669a
> =

> [  241.893907]  ffff8800101c7e20
> [  241.893907]  ffff8800101c7e20 ffff8800101c7e10 ffff8800101c7e10 ffffff=
ff81248e43 ffffffff81248e43 0000000000000008 0000000000000008
> =

> [  241.910022]  ffff8800101c7e20
> [  241.910022]  ffff8800101c7e20 ffff8800101c7db8 ffff8800101c7db8 ffffff=
ff8181e3b6 ffffffff8181e3b6 0000000000000002 0000000000000002
> =

> [  241.912112] Call Trace:
> [  241.912112] Call Trace:
> [  241.912791]  [<ffffffff81817ca6>] dump_stack+0xea/0x154
> [  241.912791]  [<ffffffff81817ca6>] dump_stack+0xea/0x154
> [  241.914229]  [<ffffffff81248e43>] panic+0x11e/0x325
> [  241.914229]  [<ffffffff81248e43>] panic+0x11e/0x325
> [  241.915629]  [<ffffffff8181e3b6>] ? nmi_trigger_all_cpu_backtrace+0x20=
6/0x530
> [  241.915629]  [<ffffffff8181e3b6>] ? nmi_trigger_all_cpu_backtrace+0x20=
6/0x530
> [  241.938594]  [<ffffffff812237bc>] watchdog+0x67c/0x760
> [  241.938594]  [<ffffffff812237bc>] watchdog+0x67c/0x760
> [  241.940198]  [<ffffffff81223220>] ? watchdog+0xe0/0x760
> [  241.940198]  [<ffffffff81223220>] ? watchdog+0xe0/0x760
> [  241.941826]  [<ffffffff81223140>] ? hung_task_panic+0x20/0x20
> [  241.941826]  [<ffffffff81223140>] ? hung_task_panic+0x20/0x20
> [  241.964754]  [<ffffffff81160aba>] kthread+0x12a/0x160
> [  241.964754]  [<ffffffff81160aba>] kthread+0x12a/0x160
> [  241.966286]  [<ffffffff81160990>] ? __kthread_unpark+0xa0/0xa0
> [  241.966286]  [<ffffffff81160990>] ? __kthread_unpark+0xa0/0xa0
> [  241.967878]  [<ffffffff820d486f>] ret_from_fork+0x3f/0x70
> [  241.967878]  [<ffffffff820d486f>] ret_from_fork+0x3f/0x70
> [  241.969348]  [<ffffffff81160990>] ? __kthread_unpark+0xa0/0xa0
> [  241.969348]  [<ffffffff81160990>] ? __kthread_unpark+0xa0/0xa0
> [  241.982838] Kernel Offset: disabled
> [  241.982838] Kernel Offset: disabled
> =

> =

> git bisect start 44ec563f74e478ccd262b899fc404761bc5c6870 81f70ba233d5f66=
0e1ea5fe23260ee323af5d53a --
> git bisect  bad b9380b78ec52e5f8d842af61766e8e628bc7c845  # 08:00      0-=
      4  Merge 'pci/pci/vpd' into devel-spot-201602240957
> git bisect  bad f510875390c26be8247645f3f6b11fe2a3d5d695  # 08:00      0-=
      6  Merge 'kees/seccomp/tests' into devel-spot-201602240957
> git bisect  bad 165c8f1695d5783fb3abb35c2ba4006115a54da3  # 08:00      0-=
      3  Merge 'kbusch-nvme/master' into devel-spot-201602240957
> git bisect  bad b554db13ba65be39df5672622a4c7df1933712f0  # 08:14    393-=
      3  Merge 'linux-review/Han-Xu/support-gpmi-on-i-MX6UL-7D-and-HW-bitfl=
ip-on-i-MX6QP-7D/20160224-085042' into devel-spot-201602240957
> git bisect  bad 9c5e6420f6f9f861a1b39ddb5db862c5d54cf9bc  # 08:29    134-=
      3  Merge 'linux-review/Johannes-Weiner/mm-readahead-do-not-cap-readah=
ead-and-MADV_WILLNEED/20160224-094046' into devel-spot-201602240957
> git bisect good be8328a7aa06e70d4dedbf434f75df613181ea65  # 09:18    910+=
      2  Merge 'linux-review/Adam-Buchbinder/include-linux-Fix-misspellings=
-in-comments/20160224-094831' into devel-spot-201602240957
> git bisect good e8a91d281358dd8c80fc5c779ef68813ac019ad2  # 10:12    904+=
      2  Merge 'linux-review/Adam-Buchbinder/ext4-Fix-misspellings-in-comme=
nts/20160224-094938' into devel-spot-201602240957
> git bisect good 148f472da5db4d78fcfe61807c18f020eb5bd7fc  # 11:03    903+=
      1  mlxsw: reg: Add the Switch Port Acceptable Frame Types register
> git bisect good 3bd7594e69bd97c962faa6a5ae15dd8c6c082636  # 11:58    904+=
      0  Bluetooth: hci_core: Avoid mixing up req_complete and req_complete=
_skb
> git bisect good d856626d3b051a3ad7139ba59463b692c131f844  # 12:36    905+=
      0  Merge tag 'linux-can-fixes-for-4.5-20160221' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/mkl/linux-can
> git bisect good dea08e604408d0303e2332896c5fdd8c1f7d79a2  # 12:56    905+=
      0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
> git bisect good 2cfec6a2f989d5c921ba11a329ff8ea986702b9b  # 13:19    910+=
      0  xen/pcifront: Report the errors better.
> git bisect good 6e22c8366416251a3d88ba6c92d13d595089f0ed  # 13:35    907+=
      0  tracing, kasan: Silence Kasan warning in check_stack of stack_trac=
er
> git bisect good 692b8c663cbaf892d10106fbca543b4bbc3202ad  # 13:53    910+=
      2  Merge tag 'for-linus-4.5-rc5-tag' of git://git.kernel.org/pub/scm/=
linux/kernel/git/xen/tip
> git bisect  bad 99b902528e4e49cc02fcbc26cc0a10d0eaa70a3e  # 14:08    326-=
      1  mm: readahead: do not cap readahead() and MADV_WILLNEED
> git bisect good 4de8ebeff8ddefaceeb7fc6a9b1a514fc9624509  # 14:21    909+=
      4  Merge tag 'trace-fixes-v4.5-rc5' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rostedt/linux-trace
> # first bad commit: [99b902528e4e49cc02fcbc26cc0a10d0eaa70a3e] mm: readah=
ead: do not cap readahead() and MADV_WILLNEED
> git bisect good 4de8ebeff8ddefaceeb7fc6a9b1a514fc9624509  # 14:38   1010+=
      4  Merge tag 'trace-fixes-v4.5-rc5' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rostedt/linux-trace
> # extra tests with DEBUG_INFO
> git bisect  bad 99b902528e4e49cc02fcbc26cc0a10d0eaa70a3e  # 14:56    314-=
      1  mm: readahead: do not cap readahead() and MADV_WILLNEED
> # extra tests on HEAD of linux-devel/devel-spot-201602240957
> git bisect  bad 44ec563f74e478ccd262b899fc404761bc5c6870  # 14:56      0-=
      8  0day head guard for 'devel-spot-201602240957'
> # extra tests on tree/branch linux-review/Johannes-Weiner/mm-readahead-do=
-not-cap-readahead-and-MADV_WILLNEED/20160224-094046
> git bisect  bad 99b902528e4e49cc02fcbc26cc0a10d0eaa70a3e  # 14:56      0-=
     12  mm: readahead: do not cap readahead() and MADV_WILLNEED
> # extra tests with first bad commit reverted
> git bisect good 19cfcdf584ce1f947c98be262ece8575438982a9  # 15:21   1010+=
      1  Revert "mm: readahead: do not cap readahead() and MADV_WILLNEED"
> # extra tests on tree/branch linus/master
> git bisect good 29a9faa641857425af76e44f2fab22db53032401  # 15:37   1010+=
      5  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/sage/ceph-client
> # extra tests on tree/branch linux-next/master
> git bisect good 4639ea604f53d9804b19ec75d13648c8be3698da  # 15:53   1006+=
      7  Add linux-next specific files for 20160226
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu kvm64
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 300
> 	-smp 2
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
> # Linux/x86_64 4.5.0-rc5 Kernel Configuration
> #
> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
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
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-rdi -fcall-saved-rsi -fcall-sa=
ved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -=
fcall-saved-r11"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> =

> #
> # General setup
> #
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
> # CONFIG_SWAP is not set
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
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
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
> # CONFIG_NO_HZ_FULL is not set
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> CONFIG_TASKSTATS=3Dy
> CONFIG_TASK_DELAY_ACCT=3Dy
> # CONFIG_TASK_XACCT is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> # CONFIG_TASKS_RCU is not set
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FAST_NO_HZ is not set
> CONFIG_TREE_RCU_TRACE=3Dy
> CONFIG_RCU_KTHREAD_PRIO=3D0
> # CONFIG_RCU_NOCB_CPU is not set
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> # CONFIG_IKCONFIG_PROC is not set
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_DEBUG_BLK_CGROUP=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_HUGETLB is not set
> # CONFIG_CPUSETS is not set
> CONFIG_CGROUP_DEVICE=3Dy
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
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> # CONFIG_SYSFS_SYSCALL is not set
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
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
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PERF_USE_VMALLOC=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_COMPAT_BRK=3Dy
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> CONFIG_PROFILING=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_OPROFILE=3Dy
> CONFIG_OPROFILE_EVENT_MULTIPLEX=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_JUMP_LABEL is not set
> # CONFIG_UPROBES is not set
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_USER_RETURN_NOTIFIER=3Dy
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
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
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
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_FORMAT_AUTODETECT is not set
> CONFIG_GCOV_FORMAT_3_4=3Dy
> # CONFIG_GCOV_FORMAT_4_7 is not set
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> # CONFIG_MODULES is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> # CONFIG_BLK_DEV_INTEGRITY is not set
> # CONFIG_BLK_DEV_THROTTLING is not set
> CONFIG_BLK_CMDLINE_PARSER=3Dy
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> CONFIG_ACORN_PARTITION=3Dy
> CONFIG_ACORN_PARTITION_CUMANA=3Dy
> CONFIG_ACORN_PARTITION_EESOX=3Dy
> # CONFIG_ACORN_PARTITION_ICS is not set
> # CONFIG_ACORN_PARTITION_ADFS is not set
> # CONFIG_ACORN_PARTITION_POWERTEC is not set
> CONFIG_ACORN_PARTITION_RISCIX=3Dy
> CONFIG_AIX_PARTITION=3Dy
> # CONFIG_OSF_PARTITION is not set
> CONFIG_AMIGA_PARTITION=3Dy
> CONFIG_ATARI_PARTITION=3Dy
> CONFIG_MAC_PARTITION=3Dy
> # CONFIG_MSDOS_PARTITION is not set
> CONFIG_LDM_PARTITION=3Dy
> CONFIG_LDM_DEBUG=3Dy
> # CONFIG_SGI_PARTITION is not set
> CONFIG_ULTRIX_PARTITION=3Dy
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> # CONFIG_EFI_PARTITION is not set
> CONFIG_SYSV68_PARTITION=3Dy
> CONFIG_CMDLINE_PARTITION=3Dy
> CONFIG_BLOCK_COMPAT=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> CONFIG_CFQ_GROUP_IOSCHED=3Dy
> # CONFIG_DEFAULT_DEADLINE is not set
> # CONFIG_DEFAULT_CFQ is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
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
> # CONFIG_DMI is not set
> # CONFIG_GART_IOMMU is not set
> # CONFIG_CALGARY_IOMMU is not set
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> # CONFIG_MAXSMP is not set
> CONFIG_NR_CPUS=3D64
> CONFIG_SCHED_SMT=3Dy
> # CONFIG_SCHED_MC is not set
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCE_INTEL is not set
> # CONFIG_X86_MCE_AMD is not set
> CONFIG_X86_MCE_INJECT=3Dy
> # CONFIG_VM86 is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_I8K=3Dy
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_NUMA is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTREMOVE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_MEMORY_FAILURE is not set
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> # CONFIG_CLEANCACHE is not set
> # CONFIG_CMA is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_FRAME_VECTOR=3Dy
> # CONFIG_X86_PMEM_LEGACY is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_INTEL_MPX is not set
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> CONFIG_HZ_300=3Dy
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D300
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> # CONFIG_KEXEC_FILE is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_LEGACY_VSYSCALL_NATIVE is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> # CONFIG_SUSPEND_SKIP_SYNC is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
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
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_EXTLOG is not set
> # CONFIG_PMIC_OPREGION is not set
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
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> CONFIG_INTEL_IDLE=3Dy
> =

> #
> # Memory power savings
> #
> CONFIG_I7300_IDLE_IOAT_CHANNEL=3Dy
> CONFIG_I7300_IDLE=3Dy
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_HT_IRQ=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> # CONFIG_ISA_DMA_API is not set
> CONFIG_AMD_NB=3Dy
> # CONFIG_PCCARD is not set
> # CONFIG_HOTPLUG_PCI is not set
> # CONFIG_RAPIDIO is not set
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> # CONFIG_COREDUMP is not set
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_KEYS_COMPAT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_PMC_ATOM=3Dy
> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> CONFIG_PACKET_DIAG=3Dy
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_NET_KEY is not set
> # CONFIG_INET is not set
> # CONFIG_NETWORK_SECMARK is not set
> CONFIG_NET_PTP_CLASSIFY=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_DEBUG=3Dy
> # CONFIG_NETFILTER_ADVANCED is not set
> CONFIG_ATM=3Dy
> # CONFIG_ATM_LANE is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> CONFIG_IPX=3Dy
> # CONFIG_IPX_INTERN is not set
> # CONFIG_ATALK is not set
> CONFIG_X25=3Dy
> # CONFIG_LAPB is not set
> CONFIG_PHONET=3Dy
> CONFIG_IEEE802154=3Dy
> CONFIG_IEEE802154_NL802154_EXPERIMENTAL=3Dy
> CONFIG_IEEE802154_SOCKET=3Dy
> # CONFIG_MAC802154 is not set
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> # CONFIG_NET_SCH_CBQ is not set
> CONFIG_NET_SCH_HTB=3Dy
> CONFIG_NET_SCH_HFSC=3Dy
> CONFIG_NET_SCH_ATM=3Dy
> # CONFIG_NET_SCH_PRIO is not set
> CONFIG_NET_SCH_MULTIQ=3Dy
> # CONFIG_NET_SCH_RED is not set
> CONFIG_NET_SCH_SFB=3Dy
> CONFIG_NET_SCH_SFQ=3Dy
> CONFIG_NET_SCH_TEQL=3Dy
> CONFIG_NET_SCH_TBF=3Dy
> CONFIG_NET_SCH_GRED=3Dy
> CONFIG_NET_SCH_DSMARK=3Dy
> CONFIG_NET_SCH_NETEM=3Dy
> # CONFIG_NET_SCH_DRR is not set
> # CONFIG_NET_SCH_MQPRIO is not set
> CONFIG_NET_SCH_CHOKE=3Dy
> # CONFIG_NET_SCH_QFQ is not set
> CONFIG_NET_SCH_CODEL=3Dy
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> CONFIG_NET_SCH_FQ=3Dy
> # CONFIG_NET_SCH_HHF is not set
> CONFIG_NET_SCH_PIE=3Dy
> CONFIG_NET_SCH_INGRESS=3Dy
> CONFIG_NET_SCH_PLUG=3Dy
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> # CONFIG_NET_CLS_BASIC is not set
> CONFIG_NET_CLS_TCINDEX=3Dy
> CONFIG_NET_CLS_FW=3Dy
> CONFIG_NET_CLS_U32=3Dy
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dy
> CONFIG_NET_CLS_RSVP6=3Dy
> CONFIG_NET_CLS_FLOW=3Dy
> # CONFIG_NET_CLS_CGROUP is not set
> CONFIG_NET_CLS_BPF=3Dy
> # CONFIG_NET_CLS_FLOWER is not set
> # CONFIG_NET_EMATCH is not set
> CONFIG_NET_CLS_ACT=3Dy
> # CONFIG_NET_ACT_POLICE is not set
> CONFIG_NET_ACT_GACT=3Dy
> # CONFIG_GACT_PROB is not set
> CONFIG_NET_ACT_MIRRED=3Dy
> CONFIG_NET_ACT_NAT=3Dy
> # CONFIG_NET_ACT_PEDIT is not set
> CONFIG_NET_ACT_SIMP=3Dy
> CONFIG_NET_ACT_SKBEDIT=3Dy
> # CONFIG_NET_ACT_VLAN is not set
> CONFIG_NET_ACT_BPF=3Dy
> # CONFIG_NET_CLS_IND is not set
> CONFIG_NET_SCH_FIFO=3Dy
> # CONFIG_DCB is not set
> # CONFIG_DNS_RESOLVER is not set
> CONFIG_BATMAN_ADV=3Dy
> # CONFIG_BATMAN_ADV_NC is not set
> CONFIG_BATMAN_ADV_MCAST=3Dy
> CONFIG_BATMAN_ADV_DEBUG=3Dy
> CONFIG_VSOCKETS=3Dy
> CONFIG_NETLINK_MMAP=3Dy
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_HSR is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_HAMRADIO is not set
> CONFIG_CAN=3Dy
> CONFIG_CAN_RAW=3Dy
> CONFIG_CAN_BCM=3Dy
> CONFIG_CAN_GW=3Dy
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dy
> # CONFIG_CAN_SLCAN is not set
> CONFIG_CAN_DEV=3Dy
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_LEDS is not set
> CONFIG_CAN_SJA1000=3Dy
> CONFIG_CAN_SJA1000_ISA=3Dy
> # CONFIG_CAN_SJA1000_PLATFORM is not set
> # CONFIG_CAN_EMS_PCI is not set
> # CONFIG_CAN_PEAK_PCI is not set
> # CONFIG_CAN_KVASER_PCI is not set
> # CONFIG_CAN_PLX_PCI is not set
> # CONFIG_CAN_C_CAN is not set
> CONFIG_CAN_M_CAN=3Dy
> # CONFIG_CAN_CC770 is not set
> =

> #
> # CAN SPI interfaces
> #
> CONFIG_CAN_MCP251X=3Dy
> CONFIG_CAN_SOFTING=3Dy
> # CONFIG_CAN_DEBUG_DEVICES is not set
> CONFIG_IRDA=3Dy
> =

> #
> # IrDA protocols
> #
> CONFIG_IRLAN=3Dy
> # CONFIG_IRCOMM is not set
> # CONFIG_IRDA_ULTRA is not set
> =

> #
> # IrDA options
> #
> CONFIG_IRDA_CACHE_LAST_LSAP=3Dy
> # CONFIG_IRDA_FAST_RR is not set
> # CONFIG_IRDA_DEBUG is not set
> =

> #
> # Infrared-port device drivers
> #
> =

> #
> # SIR device drivers
> #
> # CONFIG_IRTTY_SIR is not set
> =

> #
> # Dongle support
> #
> =

> #
> # FIR device drivers
> #
> # CONFIG_VLSI_FIR is not set
> CONFIG_BT=3Dy
> # CONFIG_BT_BREDR is not set
> CONFIG_BT_LE=3Dy
> CONFIG_BT_SELFTEST=3Dy
> CONFIG_BT_SELFTEST_ECDH=3Dy
> CONFIG_BT_SELFTEST_SMP=3Dy
> # CONFIG_BT_DEBUGFS is not set
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIUART is not set
> CONFIG_BT_HCIVHCI=3Dy
> CONFIG_BT_MRVL=3Dy
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> # CONFIG_LIB80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> # CONFIG_RFKILL_INPUT is not set
> CONFIG_RFKILL_REGULATOR=3Dy
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> CONFIG_NET_9P_DEBUG=3Dy
> CONFIG_CAIF=3Dy
> CONFIG_CAIF_DEBUG=3Dy
> CONFIG_CAIF_NETDEV=3Dy
> CONFIG_CAIF_USB=3Dy
> CONFIG_NFC=3Dy
> CONFIG_NFC_DIGITAL=3Dy
> # CONFIG_NFC_NCI is not set
> CONFIG_NFC_HCI=3Dy
> # CONFIG_NFC_SHDLC is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_TRF7970A=3Dy
> CONFIG_NFC_SIM=3Dy
> # CONFIG_NFC_ST95HF is not set
> # CONFIG_LWTUNNEL is not set
> CONFIG_HAVE_BPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> # CONFIG_STANDALONE is not set
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> CONFIG_FW_LOADER=3Dy
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_FENCE_TRACE=3Dy
> =

> #
> # Bus devices
> #
> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> # CONFIG_PARPORT_SERIAL is not set
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_GSC is not set
> CONFIG_PARPORT_AX88796=3Dy
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
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> # CONFIG_BLK_DEV_LOOP is not set
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_OSD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_HD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> # CONFIG_BLK_DEV_NVME is not set
> =

> #
> # Misc devices
> #
> # CONFIG_SENSORS_LIS3LV02D is not set
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> # CONFIG_ICS932S401 is not set
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> # CONFIG_SENSORS_BH1780 is not set
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dy
> CONFIG_TI_DAC7512=3Dy
> # CONFIG_BMP085_I2C is not set
> # CONFIG_BMP085_SPI is not set
> CONFIG_USB_SWITCH_FSA9480=3Dy
> CONFIG_LATTICE_ECP3_CONFIG=3Dy
> CONFIG_SRAM=3Dy
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
> # CONFIG_EEPROM_93CX6 is not set
> # CONFIG_EEPROM_93XX46 is not set
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_SENSORS_LIS3_I2C is not set
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dy
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
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
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_KERNEL_API is not set
> # CONFIG_CXL_EEH is not set
> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_RAID_ATTRS is not set
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_NETLINK=3Dy
> CONFIG_SCSI_MQ_DEFAULT=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> # CONFIG_BLK_DEV_SD is not set
> # CONFIG_CHR_DEV_ST is not set
> CONFIG_CHR_DEV_OSST=3Dy
> CONFIG_BLK_DEV_SR=3Dy
> # CONFIG_BLK_DEV_SR_VENDOR is not set
> CONFIG_CHR_DEV_SG=3Dy
> CONFIG_CHR_DEV_SCH=3Dy
> CONFIG_SCSI_CONSTANTS=3Dy
> # CONFIG_SCSI_LOGGING is not set
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> CONFIG_SCSI_FC_ATTRS=3Dy
> # CONFIG_SCSI_ISCSI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=3Dy
> CONFIG_SCSI_SAS_LIBSAS=3Dy
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> CONFIG_SCSI_SRP_ATTRS=3Dy
> CONFIG_SCSI_LOWLEVEL=3Dy
> CONFIG_ISCSI_BOOT_SYSFS=3Dy
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
> CONFIG_SCSI_UFSHCD=3Dy
> # CONFIG_SCSI_UFSHCD_PCI is not set
> CONFIG_SCSI_UFSHCD_PLATFORM=3Dy
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_VMWARE_PVSCSI is not set
> CONFIG_LIBFC=3Dy
> # CONFIG_LIBFCOE is not set
> # CONFIG_SCSI_SNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_FUTURE_DOMAIN is not set
> # CONFIG_SCSI_ISCI is not set
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> CONFIG_SCSI_PPA=3Dy
> CONFIG_SCSI_IMM=3Dy
> CONFIG_SCSI_IZIP_EPP16=3Dy
> CONFIG_SCSI_IZIP_SLOW_CTR=3Dy
> # CONFIG_SCSI_STEX is not set
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLA_FC is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_LPFC is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> # CONFIG_SCSI_DEBUG is not set
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_BFA_FC is not set
> CONFIG_SCSI_VIRTIO=3Dy
> # CONFIG_SCSI_CHELSIO_FCOE is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> CONFIG_SCSI_DH_ALUA=3Dy
> CONFIG_SCSI_OSD_INITIATOR=3Dy
> CONFIG_SCSI_OSD_ULD=3Dy
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> CONFIG_SCSI_OSD_DEBUG=3Dy
> # CONFIG_ATA is not set
> # CONFIG_MD is not set
> CONFIG_TARGET_CORE=3Dy
> # CONFIG_TCM_IBLOCK is not set
> # CONFIG_TCM_FILEIO is not set
> # CONFIG_TCM_PSCSI is not set
> # CONFIG_TCM_USER2 is not set
> CONFIG_LOOPBACK_TARGET=3Dy
> CONFIG_TCM_FC=3Dy
> CONFIG_ISCSI_TARGET=3Dy
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> CONFIG_VHOST_NET=3Dy
> CONFIG_VHOST_RING=3Dy
> CONFIG_VHOST=3Dy
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> # CONFIG_NVM is not set
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
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> # CONFIG_MOUSE_PS2_CYPRESS is not set
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dy
> CONFIG_MOUSE_ELAN_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> CONFIG_MOUSE_VSXXXAA=3Dy
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> # CONFIG_JOYSTICK_A3D is not set
> CONFIG_JOYSTICK_ADI=3Dy
> CONFIG_JOYSTICK_COBRA=3Dy
> CONFIG_JOYSTICK_GF2K=3Dy
> # CONFIG_JOYSTICK_GRIP is not set
> # CONFIG_JOYSTICK_GRIP_MP is not set
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dy
> CONFIG_JOYSTICK_IFORCE=3Dy
> # CONFIG_JOYSTICK_IFORCE_232 is not set
> # CONFIG_JOYSTICK_WARRIOR is not set
> CONFIG_JOYSTICK_MAGELLAN=3Dy
> CONFIG_JOYSTICK_SPACEORB=3Dy
> CONFIG_JOYSTICK_SPACEBALL=3Dy
> # CONFIG_JOYSTICK_STINGER is not set
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> CONFIG_JOYSTICK_DB9=3Dy
> CONFIG_JOYSTICK_GAMECON=3Dy
> CONFIG_JOYSTICK_TURBOGRAFX=3Dy
> # CONFIG_JOYSTICK_AS5011 is not set
> # CONFIG_JOYSTICK_JOYDUMP is not set
> # CONFIG_JOYSTICK_XPAD is not set
> CONFIG_JOYSTICK_WALKERA0701=3Dy
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> # CONFIG_INPUT_AD714X is not set
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_E3X0_BUTTON=3Dy
> CONFIG_INPUT_MC13783_PWRBUTTON=3Dy
> # CONFIG_INPUT_MMA8450 is not set
> # CONFIG_INPUT_MPU3050 is not set
> # CONFIG_INPUT_APANEL is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dy
> CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> # CONFIG_INPUT_RETU_PWRBUTTON is not set
> CONFIG_INPUT_TPS65218_PWRBUTTON=3Dy
> CONFIG_INPUT_TWL6040_VIBRA=3Dy
> # CONFIG_INPUT_UINPUT is not set
> # CONFIG_INPUT_PALMAS_PWRBUTTON is not set
> CONFIG_INPUT_PCF8574=3Dy
> # CONFIG_INPUT_DA9052_ONKEY is not set
> CONFIG_INPUT_DA9063_ONKEY=3Dy
> CONFIG_INPUT_WM831X_ON=3Dy
> CONFIG_INPUT_ADXL34X=3Dy
> CONFIG_INPUT_ADXL34X_I2C=3Dy
> CONFIG_INPUT_ADXL34X_SPI=3Dy
> CONFIG_INPUT_CMA3000=3Dy
> CONFIG_INPUT_CMA3000_I2C=3Dy
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
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
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
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
> # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
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
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_FSL is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> # CONFIG_SERIAL_8250_MID is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
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
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_PRINTER is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SI_PROBE_DEFAULTS=3Dy
> CONFIG_IPMI_SSIF=3Dy
> # CONFIG_IPMI_WATCHDOG is not set
> CONFIG_IPMI_POWEROFF=3Dy
> # CONFIG_HW_RANDOM is not set
> CONFIG_NVRAM=3Dy
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> CONFIG_TCG_NSC=3Dy
> # CONFIG_TCG_ATMEL is not set
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
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
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dy
> # CONFIG_I2C_MUX is not set
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
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
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_KEMPLD is not set
> CONFIG_I2C_OCORES=3Dy
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
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
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> CONFIG_SPI=3Dy
> CONFIG_SPI_DEBUG=3Dy
> CONFIG_SPI_MASTER=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> CONFIG_SPI_BITBANG=3Dy
> # CONFIG_SPI_BUTTERFLY is not set
> CONFIG_SPI_CADENCE=3Dy
> CONFIG_SPI_LM70_LLP=3Dy
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_PXA2XX_PCI is not set
> CONFIG_SPI_SC18IS602=3Dy
> CONFIG_SPI_XCOMM=3Dy
> CONFIG_SPI_XILINX=3Dy
> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> CONFIG_SPI_DESIGNWARE=3Dy
> # CONFIG_SPI_DW_PCI is not set
> # CONFIG_SPI_DW_MMIO is not set
> =

> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=3Dy
> CONFIG_SPI_TLE62X0=3Dy
> # CONFIG_SPMI is not set
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=3Dy
> =

> #
> # PPS support
> #
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> CONFIG_NTP_PPS=3Dy
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_PARPORT=3Dy
> CONFIG_PPS_CLIENT_GPIO=3Dy
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
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> # CONFIG_GPIOLIB is not set
> CONFIG_W1=3Dy
> CONFIG_W1_CON=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2760=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> # CONFIG_W1_SLAVE_BQ27000 is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> # CONFIG_WM831X_BACKUP is not set
> # CONFIG_WM831X_POWER is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_DS2760=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> CONFIG_BATTERY_BQ27XXX=3Dy
> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9052=3Dy
> # CONFIG_CHARGER_DA9150 is not set
> CONFIG_BATTERY_DA9150=3Dy
> CONFIG_BATTERY_MAX17040=3Dy
> CONFIG_BATTERY_MAX17042=3Dy
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_LP8788=3Dy
> CONFIG_CHARGER_MANAGER=3Dy
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_SMB347=3Dy
> # CONFIG_CHARGER_TPS65217 is not set
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_RT5033=3Dy
> # CONFIG_POWER_RESET is not set
> # CONFIG_POWER_AVS is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7314=3Dy
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> # CONFIG_SENSORS_ADM1021 is not set
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dy
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> # CONFIG_SENSORS_ADT7411 is not set
> # CONFIG_SENSORS_ADT7462 is not set
> # CONFIG_SENSORS_ADT7470 is not set
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> CONFIG_SENSORS_ASB100=3Dy
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9052_ADC=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> # CONFIG_SENSORS_F75375S is not set
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_IBMAEM is not set
> # CONFIG_SENSORS_IBMPEX is not set
> CONFIG_SENSORS_IIO_HWMON=3Dy
> # CONFIG_SENSORS_I5500 is not set
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=3Dy
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=3Dy
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> CONFIG_SENSORS_MAX1111=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dy
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX6639 is not set
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_MAX31790=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_ADCXX=3Dy
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM70=3Dy
> # CONFIG_SENSORS_LM73 is not set
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=3Dy
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=3Dy
> # CONFIG_SENSORS_LM95241 is not set
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dy
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_NCT7904=3Dy
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_PMBUS is not set
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> # CONFIG_SENSORS_SCH5627 is not set
> CONFIG_SENSORS_SCH5636=3Dy
> # CONFIG_SENSORS_SMM665 is not set
> CONFIG_SENSORS_ADC128D818=3Dy
> CONFIG_SENSORS_ADS1015=3Dy
> CONFIG_SENSORS_ADS7828=3Dy
> # CONFIG_SENSORS_ADS7871 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> CONFIG_SENSORS_TMP103=3Dy
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83781D is not set
> # CONFIG_SENSORS_W83791D is not set
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dy
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> # CONFIG_SENSORS_W83627HF is not set
> # CONFIG_SENSORS_W83627EHF is not set
> CONFIG_SENSORS_WM831X=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INTEL_POWERCLAMP is not set
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> # CONFIG_INT340X_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
> CONFIG_WATCHDOG_SYSFS=3Dy
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dy
> CONFIG_DA9052_WATCHDOG=3Dy
> # CONFIG_DA9062_WATCHDOG is not set
> CONFIG_MENF21BMC_WATCHDOG=3Dy
> CONFIG_WM831X_WATCHDOG=3Dy
> CONFIG_XILINX_WATCHDOG=3Dy
> CONFIG_ZIIRAVE_WATCHDOG=3Dy
> CONFIG_CADENCE_WATCHDOG=3Dy
> # CONFIG_DW_WATCHDOG is not set
> CONFIG_MAX63XX_WATCHDOG=3Dy
> CONFIG_RETU_WATCHDOG=3Dy
> CONFIG_ACQUIRE_WDT=3Dy
> # CONFIG_ADVANTECH_WDT is not set
> # CONFIG_ALIM1535_WDT is not set
> # CONFIG_ALIM7101_WDT is not set
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> CONFIG_IBMASR=3Dy
> CONFIG_WAFER_WDT=3Dy
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_IE6XX_WDT is not set
> # CONFIG_ITCO_WDT is not set
> # CONFIG_IT8712F_WDT is not set
> CONFIG_IT87_WDT=3Dy
> # CONFIG_HP_WATCHDOG is not set
> # CONFIG_KEMPLD_WDT is not set
> CONFIG_SC1200_WDT=3Dy
> # CONFIG_PC87413_WDT is not set
> # CONFIG_NV_TCO is not set
> CONFIG_60XX_WDT=3Dy
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dy
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=3Dy
> # CONFIG_W83877F_WDT is not set
> CONFIG_W83977F_WDT=3Dy
> # CONFIG_MACHZ_WDT is not set
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> CONFIG_BCM7038_WDT=3Dy
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
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> # CONFIG_SSB_B43_PCI_BRIDGE is not set
> CONFIG_SSB_SILENT=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
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
> CONFIG_MFD_AS3711=3Dy
> CONFIG_PMIC_ADP5520=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> # CONFIG_MFD_AXP20X is not set
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dy
> CONFIG_MFD_CROS_EC_SPI=3Dy
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_SPI=3Dy
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9062=3Dy
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_HTC_PASIC3=3Dy
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dy
> # CONFIG_EZX_PCAP is not set
> CONFIG_MFD_RETU=3Dy
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RT5033=3Dy
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_RN5T618 is not set
> CONFIG_MFD_SEC_CORE=3Dy
> CONFIG_MFD_SI476X_CORE=3Dy
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> CONFIG_ABX500_CORE=3Dy
> CONFIG_AB3100_CORE=3Dy
> CONFIG_AB3100_OTP=3Dy
> # CONFIG_MFD_SYSCON is not set
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dy
> CONFIG_TPS6507X=3Dy
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_MFD_TPS65218=3Dy
> CONFIG_MFD_TPS6586X=3Dy
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> CONFIG_TWL6040_CORE=3Dy
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_ARIZONA_SPI is not set
> CONFIG_MFD_WM8400=3Dy
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_AD5398=3Dy
> # CONFIG_REGULATOR_AB3100 is not set
> CONFIG_REGULATOR_AS3711=3Dy
> CONFIG_REGULATOR_BCM590XX=3Dy
> # CONFIG_REGULATOR_DA903X is not set
> CONFIG_REGULATOR_DA9052=3Dy
> CONFIG_REGULATOR_DA9062=3Dy
> CONFIG_REGULATOR_DA9210=3Dy
> # CONFIG_REGULATOR_DA9211 is not set
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LP3971=3Dy
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LP8788=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8973=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> CONFIG_REGULATOR_MC13892=3Dy
> # CONFIG_REGULATOR_MT6311 is not set
> # CONFIG_REGULATOR_MT6397 is not set
> # CONFIG_REGULATOR_PALMAS is not set
> CONFIG_REGULATOR_PFUZE100=3Dy
> # CONFIG_REGULATOR_PV88060 is not set
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_RT5033=3Dy
> # CONFIG_REGULATOR_S2MPA01 is not set
> CONFIG_REGULATOR_S2MPS11=3Dy
> # CONFIG_REGULATOR_S5M8767 is not set
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_TPS51632 is not set
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dy
> CONFIG_REGULATOR_TPS6507X=3Dy
> CONFIG_REGULATOR_TPS65217=3Dy
> CONFIG_REGULATOR_TPS6524X=3Dy
> CONFIG_REGULATOR_TPS6586X=3Dy
> CONFIG_REGULATOR_WM831X=3Dy
> CONFIG_REGULATOR_WM8400=3Dy
> CONFIG_REGULATOR_WM8994=3Dy
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> # CONFIG_MEDIA_RC_SUPPORT is not set
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> CONFIG_VIDEO_DEV=3Dy
> # CONFIG_VIDEO_V4L2_SUBDEV_API is not set
> CONFIG_VIDEO_V4L2=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> # CONFIG_VIDEO_PCI_SKELETON is not set
> CONFIG_V4L2_MEM2MEM_DEV=3Dy
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> CONFIG_DVB_CORE=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> CONFIG_DVB_MAX_ADAPTERS=3D8
> # CONFIG_DVB_DYNAMIC_MINORS is not set
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> CONFIG_VIDEO_MEM2MEM_DEINTERLACE=3Dy
> CONFIG_VIDEO_SH_VEU=3Dy
> CONFIG_V4L_TEST_DRIVERS=3Dy
> # CONFIG_VIDEO_VIVID is not set
> CONFIG_VIDEO_VIM2M=3Dy
> CONFIG_DVB_PLATFORM_DRIVERS=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, frontends)
> #
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> =

> #
> # Encoders, decoders, sensors and other helper chips
> #
> =

> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_TVAUDIO=3Dy
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> CONFIG_VIDEO_TEA6415C=3Dy
> # CONFIG_VIDEO_TEA6420 is not set
> CONFIG_VIDEO_MSP3400=3Dy
> CONFIG_VIDEO_CS3308=3Dy
> CONFIG_VIDEO_CS5345=3Dy
> CONFIG_VIDEO_CS53L32A=3Dy
> CONFIG_VIDEO_TLV320AIC23B=3Dy
> # CONFIG_VIDEO_UDA1342 is not set
> CONFIG_VIDEO_WM8775=3Dy
> CONFIG_VIDEO_WM8739=3Dy
> CONFIG_VIDEO_VP27SMPX=3Dy
> CONFIG_VIDEO_SONY_BTF_MPX=3Dy
> =

> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=3Dy
> =

> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7183=3Dy
> CONFIG_VIDEO_BT819=3Dy
> CONFIG_VIDEO_BT856=3Dy
> CONFIG_VIDEO_BT866=3Dy
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_ML86V7667 is not set
> CONFIG_VIDEO_SAA7110=3Dy
> # CONFIG_VIDEO_SAA711X is not set
> CONFIG_VIDEO_TVP514X=3Dy
> CONFIG_VIDEO_TVP5150=3Dy
> CONFIG_VIDEO_TVP7002=3Dy
> CONFIG_VIDEO_TW2804=3Dy
> CONFIG_VIDEO_TW9903=3Dy
> CONFIG_VIDEO_TW9906=3Dy
> CONFIG_VIDEO_VPX3220=3Dy
> =

> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=3Dy
> CONFIG_VIDEO_CX25840=3Dy
> =

> #
> # Video encoders
> #
> CONFIG_VIDEO_SAA7127=3Dy
> CONFIG_VIDEO_SAA7185=3Dy
> CONFIG_VIDEO_ADV7170=3Dy
> CONFIG_VIDEO_ADV7175=3Dy
> CONFIG_VIDEO_ADV7343=3Dy
> CONFIG_VIDEO_ADV7393=3Dy
> CONFIG_VIDEO_AK881X=3Dy
> CONFIG_VIDEO_THS8200=3Dy
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_OV2659=3Dy
> # CONFIG_VIDEO_OV7640 is not set
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_VS6624 is not set
> # CONFIG_VIDEO_MT9V011 is not set
> CONFIG_VIDEO_SR030PC30=3Dy
> =

> #
> # Flash devices
> #
> # CONFIG_VIDEO_ADP1653 is not set
> # CONFIG_VIDEO_AS3645A is not set
> # CONFIG_VIDEO_LM3560 is not set
> # CONFIG_VIDEO_LM3646 is not set
> =

> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=3Dy
> CONFIG_VIDEO_UPD64083=3Dy
> =

> #
> # Audio/Video compression chips
> #
> # CONFIG_VIDEO_SAA6752HS is not set
> =

> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_THS7303 is not set
> CONFIG_VIDEO_M52790=3Dy
> =

> #
> # Sensors used on soc_camera driver
> #
> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> CONFIG_MEDIA_TUNER_TEA5761=3Dy
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MSI001=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> # CONFIG_MEDIA_TUNER_MT2060 is not set
> CONFIG_MEDIA_TUNER_MT2063=3Dy
> CONFIG_MEDIA_TUNER_MT2266=3Dy
> CONFIG_MEDIA_TUNER_MT2131=3Dy
> CONFIG_MEDIA_TUNER_QT1010=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> CONFIG_MEDIA_TUNER_MXL5007T=3Dy
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> CONFIG_MEDIA_TUNER_MAX2165=3Dy
> CONFIG_MEDIA_TUNER_TDA18218=3Dy
> # CONFIG_MEDIA_TUNER_FC0011 is not set
> # CONFIG_MEDIA_TUNER_FC0012 is not set
> CONFIG_MEDIA_TUNER_FC0013=3Dy
> CONFIG_MEDIA_TUNER_TDA18212=3Dy
> CONFIG_MEDIA_TUNER_E4000=3Dy
> # CONFIG_MEDIA_TUNER_FC2580 is not set
> # CONFIG_MEDIA_TUNER_M88RS6000T is not set
> # CONFIG_MEDIA_TUNER_TUA9001 is not set
> # CONFIG_MEDIA_TUNER_SI2157 is not set
> # CONFIG_MEDIA_TUNER_IT913X is not set
> # CONFIG_MEDIA_TUNER_R820T is not set
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dy
> # CONFIG_DVB_STB6100 is not set
> CONFIG_DVB_STV090x=3Dy
> # CONFIG_DVB_STV6110x is not set
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dy
> CONFIG_DVB_TDA18271C2DD=3Dy
> # CONFIG_DVB_SI2165 is not set
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dy
> CONFIG_DVB_CX24123=3Dy
> CONFIG_DVB_MT312=3Dy
> # CONFIG_DVB_ZL10036 is not set
> CONFIG_DVB_ZL10039=3Dy
> # CONFIG_DVB_S5H1420 is not set
> CONFIG_DVB_STV0288=3Dy
> CONFIG_DVB_STB6000=3Dy
> # CONFIG_DVB_STV0299 is not set
> # CONFIG_DVB_STV6110 is not set
> # CONFIG_DVB_STV0900 is not set
> CONFIG_DVB_TDA8083=3Dy
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=3Dy
> CONFIG_DVB_VES1X93=3Dy
> CONFIG_DVB_TUNER_ITD1000=3Dy
> CONFIG_DVB_TUNER_CX24113=3Dy
> CONFIG_DVB_TDA826X=3Dy
> # CONFIG_DVB_TUA6100 is not set
> CONFIG_DVB_CX24116=3Dy
> # CONFIG_DVB_CX24117 is not set
> # CONFIG_DVB_CX24120 is not set
> # CONFIG_DVB_SI21XX is not set
> CONFIG_DVB_TS2020=3Dy
> # CONFIG_DVB_DS3000 is not set
> CONFIG_DVB_MB86A16=3Dy
> # CONFIG_DVB_TDA10071 is not set
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> # CONFIG_DVB_SP887X is not set
> # CONFIG_DVB_CX22700 is not set
> CONFIG_DVB_CX22702=3Dy
> CONFIG_DVB_S5H1432=3Dy
> CONFIG_DVB_DRXD=3Dy
> # CONFIG_DVB_L64781 is not set
> # CONFIG_DVB_TDA1004X is not set
> # CONFIG_DVB_NXT6000 is not set
> CONFIG_DVB_MT352=3Dy
> CONFIG_DVB_ZL10353=3Dy
> CONFIG_DVB_DIB3000MB=3Dy
> CONFIG_DVB_DIB3000MC=3Dy
> CONFIG_DVB_DIB7000M=3Dy
> CONFIG_DVB_DIB7000P=3Dy
> CONFIG_DVB_DIB9000=3Dy
> # CONFIG_DVB_TDA10048 is not set
> CONFIG_DVB_AF9013=3Dy
> CONFIG_DVB_EC100=3Dy
> # CONFIG_DVB_HD29L2 is not set
> CONFIG_DVB_STV0367=3Dy
> CONFIG_DVB_CXD2820R=3Dy
> CONFIG_DVB_CXD2841ER=3Dy
> # CONFIG_DVB_AS102_FE is not set
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dy
> CONFIG_DVB_TDA10021=3Dy
> CONFIG_DVB_TDA10023=3Dy
> # CONFIG_DVB_STV0297 is not set
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
> # CONFIG_DVB_AU8522_DTV is not set
> # CONFIG_DVB_AU8522_V4L is not set
> # CONFIG_DVB_S5H1411 is not set
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_S921 is not set
> CONFIG_DVB_DIB8000=3Dy
> CONFIG_DVB_MB86A20S=3Dy
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dy
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> # CONFIG_DVB_PLL is not set
> # CONFIG_DVB_TUNER_DIB0070 is not set
> CONFIG_DVB_TUNER_DIB0090=3Dy
> =

> #
> # SEC control devices for DVB-S
> #
> # CONFIG_DVB_DRX39XYJ is not set
> CONFIG_DVB_LNBH25=3Dy
> CONFIG_DVB_LNBP21=3Dy
> CONFIG_DVB_LNBP22=3Dy
> CONFIG_DVB_ISL6405=3Dy
> CONFIG_DVB_ISL6421=3Dy
> # CONFIG_DVB_ISL6423 is not set
> # CONFIG_DVB_A8293 is not set
> # CONFIG_DVB_SP2 is not set
> CONFIG_DVB_LGS8GL5=3Dy
> CONFIG_DVB_LGS8GXX=3Dy
> CONFIG_DVB_ATBM8830=3Dy
> CONFIG_DVB_TDA665x=3Dy
> CONFIG_DVB_IX2505V=3Dy
> # CONFIG_DVB_M88RS2000 is not set
> CONFIG_DVB_AF9033=3Dy
> CONFIG_DVB_HORUS3A=3Dy
> # CONFIG_DVB_ASCOT2E is not set
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dy
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_ADV7511 is not set
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
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
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> CONFIG_DRM_VIRTIO_GPU=3Dy
> CONFIG_DRM_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> # CONFIG_FB_DDC is not set
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
> # CONFIG_FB_SVGALIB is not set
> # CONFIG_FB_MACMODES is not set
> # CONFIG_FB_BACKLIGHT is not set
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
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_UVESA=3Dy
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> CONFIG_FB_S1D13XXX=3Dy
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
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> # CONFIG_FB_VIRTUAL is not set
> CONFIG_FB_METRONOME=3Dy
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_AUO_K190X=3Dy
> CONFIG_FB_AUO_K1900=3Dy
> CONFIG_FB_AUO_K1901=3Dy
> CONFIG_FB_SIMPLE=3Dy
> # CONFIG_FB_SM712 is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_DA9052=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_WM831X=3Dy
> CONFIG_BACKLIGHT_ADP5520=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_SKY81452=3Dy
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_AS3711=3Dy
> # CONFIG_BACKLIGHT_LV5207LP is not set
> CONFIG_BACKLIGHT_BD6107=3Dy
> # CONFIG_VGASTATE is not set
> CONFIG_HDMI=3Dy
> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
> # CONFIG_SND is not set
> CONFIG_SOUND_PRIME=3Dy
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dy
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_CHICONY=3Dy
> # CONFIG_HID_CYPRESS is not set
> # CONFIG_HID_DRAGONRISE is not set
> CONFIG_HID_EMS_FF=3Dy
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dy
> # CONFIG_HID_KEYTOUCH is not set
> CONFIG_HID_KYE=3Dy
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LENOVO=3Dy
> CONFIG_HID_LOGITECH=3Dy
> # CONFIG_HID_LOGITECH_HIDPP is not set
> # CONFIG_LOGITECH_FF is not set
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
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
> CONFIG_HID_PICOLCD_LEDS=3Dy
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_SAITEK=3Dy
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> # CONFIG_HID_RMI is not set
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_SMARTJOYPLUS=3Dy
> CONFIG_SMARTJOYPLUS_FF=3Dy
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> # CONFIG_HID_THINGM is not set
> # CONFIG_HID_THRUSTMASTER is not set
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dy
> CONFIG_HID_XINMO=3Dy
> CONFIG_HID_ZEROPLUS=3Dy
> CONFIG_ZEROPLUS_FF=3Dy
> CONFIG_HID_ZYDACRON=3Dy
> # CONFIG_HID_SENSOR_HUB is not set
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dy
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
> # CONFIG_TAHVO_USB is not set
> # CONFIG_USB_GADGET is not set
> CONFIG_UWB=3Dy
> # CONFIG_UWB_WHCI is not set
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_LM3530 is not set
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_PCA9532=3Dy
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> CONFIG_LEDS_LP8788=3Dy
> CONFIG_LEDS_LP8860=3Dy
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA963X=3Dy
> # CONFIG_LEDS_WM831X_STATUS is not set
> # CONFIG_LEDS_DA903X is not set
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_DAC124S085=3Dy
> # CONFIG_LEDS_REGULATOR is not set
> CONFIG_LEDS_BD2802=3Dy
> CONFIG_LEDS_ADP5520=3Dy
> CONFIG_LEDS_MC13783=3Dy
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_LM355x is not set
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
> CONFIG_LEDS_TRIGGERS=3Dy
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> CONFIG_LEDS_TRIGGER_CPU=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> CONFIG_ACCESSIBILITY=3Dy
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
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
> CONFIG_INTEL_IDMA64=3Dy
> # CONFIG_INTEL_IOATDMA is not set
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> # CONFIG_DW_DMAC_PCI is not set
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> # CONFIG_DMATEST is not set
> CONFIG_AUXDISPLAY=3Dy
> # CONFIG_KS0108 is not set
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dy
> # CONFIG_UIO_MF624 is not set
> CONFIG_IRQ_BYPASS_MANAGER=3Dy
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_BALLOON is not set
> CONFIG_VIRTIO_INPUT=3Dy
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_RTS5208 is not set
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> # CONFIG_ADIS16201 is not set
> CONFIG_ADIS16203=3Dy
> CONFIG_ADIS16204=3Dy
> CONFIG_ADIS16209=3Dy
> CONFIG_ADIS16220=3Dy
> CONFIG_ADIS16240=3Dy
> CONFIG_SCA3000=3Dy
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7192 is not set
> CONFIG_AD7280=3Dy
> =

> #
> # Analog digital bi-direction converters
> #
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dy
> # CONFIG_AD7152 is not set
> # CONFIG_AD7746 is not set
> =

> #
> # Direct Digital Synthesis
> #
> # CONFIG_AD9832 is not set
> CONFIG_AD9834=3Dy
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16060=3Dy
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
> # CONFIG_TSL2583 is not set
> CONFIG_TSL2x7x=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> CONFIG_SENSORS_HMC5843_SPI=3Dy
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7753=3Dy
> # CONFIG_ADE7754 is not set
> CONFIG_ADE7758=3Dy
> CONFIG_ADE7759=3Dy
> CONFIG_ADE7854=3Dy
> # CONFIG_ADE7854_I2C is not set
> # CONFIG_ADE7854_SPI is not set
> =

> #
> # Resolver to digital converters
> #
> # CONFIG_AD2S90 is not set
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
> CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4=3Dy
> CONFIG_STAGING_MEDIA=3Dy
> # CONFIG_DVB_CXD2099 is not set
> # CONFIG_DVB_MN88472 is not set
> CONFIG_DVB_MN88473=3Dy
> =

> #
> # Android
> #
> # CONFIG_DGNC is not set
> # CONFIG_DGAP is not set
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_CRYPTO_SKEIN is not set
> # CONFIG_UNISYSSPAR is not set
> CONFIG_MOST=3Dy
> CONFIG_MOSTCORE=3Dy
> CONFIG_AIM_CDEV=3Dy
> CONFIG_AIM_NETWORK=3Dy
> CONFIG_AIM_V4L2=3Dy
> CONFIG_HDM_DIM2=3Dy
> # CONFIG_HDM_I2C is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> CONFIG_CROS_EC_CHARDEV=3Dy
> CONFIG_CROS_EC_LPC=3Dy
> CONFIG_CROS_EC_PROTO=3Dy
> =

> #
> # Hardware Spinlock drivers
> #
> =

> #
> # Clock Source drivers
> #
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
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # CONFIG_AMD_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> CONFIG_STE_MODEM_RPROC=3Dy
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
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
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
> # CONFIG_EXTCON_ADC_JACK is not set
> CONFIG_EXTCON_PALMAS=3Dy
> # CONFIG_EXTCON_RT8973A is not set
> CONFIG_EXTCON_SM5502=3Dy
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_TRIGGER=3Dy
> CONFIG_IIO_TRIGGERED_EVENT=3Dy
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dy
> # CONFIG_BMC150_ACCEL is not set
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_ACCEL_SPI_3AXIS=3Dy
> CONFIG_KXSD9=3Dy
> # CONFIG_KXCJK1013 is not set
> CONFIG_MMA7455=3Dy
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7455_SPI=3Dy
> CONFIG_MMA8452=3Dy
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> CONFIG_MMA9553=3Dy
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=3Dy
> CONFIG_STK8312=3Dy
> CONFIG_STK8BA50=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> CONFIG_AD7266=3Dy
> CONFIG_AD7291=3Dy
> # CONFIG_AD7298 is not set
> # CONFIG_AD7476 is not set
> # CONFIG_AD7791 is not set
> CONFIG_AD7793=3Dy
> # CONFIG_AD7887 is not set
> CONFIG_AD7923=3Dy
> # CONFIG_AD799X is not set
> CONFIG_DA9150_GPADC=3Dy
> CONFIG_HI8435=3Dy
> CONFIG_LP8788_ADC=3Dy
> CONFIG_MAX1027=3Dy
> # CONFIG_MAX1363 is not set
> # CONFIG_MCP320X is not set
> CONFIG_MCP3422=3Dy
> # CONFIG_MEN_Z188_ADC is not set
> CONFIG_NAU7802=3Dy
> CONFIG_PALMAS_GPADC=3Dy
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_ADC128S052=3Dy
> CONFIG_TI_AM335X_ADC=3Dy
> =

> #
> # Amplifiers
> #
> CONFIG_AD8366=3Dy
> =

> #
> # Chemical Sensors
> #
> CONFIG_IAQCORE=3Dy
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
> CONFIG_IIO_SSP_SENSORS_COMMONS=3Dy
> CONFIG_IIO_SSP_SENSORHUB=3Dy
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_SPI=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> # CONFIG_AD5064 is not set
> CONFIG_AD5360=3Dy
> # CONFIG_AD5380 is not set
> CONFIG_AD5421=3Dy
> # CONFIG_AD5446 is not set
> CONFIG_AD5449=3Dy
> CONFIG_AD5504=3Dy
> # CONFIG_AD5624R_SPI is not set
> CONFIG_AD5686=3Dy
> CONFIG_AD5755=3Dy
> CONFIG_AD5764=3Dy
> # CONFIG_AD5791 is not set
> CONFIG_AD7303=3Dy
> CONFIG_M62332=3Dy
> CONFIG_MAX517=3Dy
> CONFIG_MCP4725=3Dy
> CONFIG_MCP4922=3Dy
> =

> #
> # IIO dummy driver
> #
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> # CONFIG_AD9523 is not set
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # CONFIG_ADF4350 is not set
> =

> #
> # Digital gyroscope sensors
> #
> # CONFIG_ADIS16080 is not set
> CONFIG_ADIS16130=3Dy
> CONFIG_ADIS16136=3Dy
> CONFIG_ADIS16260=3Dy
> CONFIG_ADXRS450=3Dy
> CONFIG_BMG160=3Dy
> CONFIG_BMG160_I2C=3Dy
> CONFIG_BMG160_SPI=3Dy
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> # CONFIG_ITG3200 is not set
> =

> #
> # Health sensors
> #
> CONFIG_MAX30100=3Dy
> =

> #
> # Humidity sensors
> #
> CONFIG_HDC100X=3Dy
> CONFIG_HTU21=3Dy
> CONFIG_SI7005=3Dy
> CONFIG_SI7020=3Dy
> =

> #
> # Inertial measurement units
> #
> CONFIG_ADIS16400=3Dy
> CONFIG_ADIS16480=3Dy
> CONFIG_KMX61=3Dy
> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dy
> CONFIG_AL3320A=3Dy
> CONFIG_APDS9300=3Dy
> # CONFIG_APDS9960 is not set
> CONFIG_BH1750=3Dy
> # CONFIG_CM32181 is not set
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=3Dy
> CONFIG_CM36651=3Dy
> CONFIG_GP2AP020A00F=3Dy
> CONFIG_ISL29125=3Dy
> # CONFIG_JSA1212 is not set
> # CONFIG_RPR0521 is not set
> CONFIG_LTR501=3Dy
> CONFIG_OPT3001=3Dy
> # CONFIG_PA12203001 is not set
> CONFIG_STK3310=3Dy
> CONFIG_TCS3414=3Dy
> CONFIG_TCS3472=3Dy
> # CONFIG_SENSORS_TSL2563 is not set
> CONFIG_TSL4531=3Dy
> CONFIG_US5182D=3Dy
> CONFIG_VCNL4000=3Dy
> =

> #
> # Magnetometer sensors
> #
> # CONFIG_BMC150_MAGN is not set
> CONFIG_MAG3110=3Dy
> CONFIG_MMC35240=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> =

> #
> # Inclinometer sensors
> #
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_HRTIMER_TRIGGER=3Dy
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> =

> #
> # Digital potentiometers
> #
> # CONFIG_MCP4531 is not set
> =

> #
> # Pressure sensors
> #
> CONFIG_BMP280=3Dy
> CONFIG_MPL115=3Dy
> CONFIG_MPL3115=3Dy
> CONFIG_MS5611=3Dy
> # CONFIG_MS5611_I2C is not set
> CONFIG_MS5611_SPI=3Dy
> CONFIG_MS5637=3Dy
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> CONFIG_IIO_ST_PRESS_SPI=3Dy
> CONFIG_T5403=3Dy
> =

> #
> # Lightning sensors
> #
> # CONFIG_AS3935 is not set
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
> # CONFIG_MLX90614 is not set
> CONFIG_TMP006=3Dy
> CONFIG_TSYS01=3Dy
> CONFIG_TSYS02D=3Dy
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_TS4800_IRQ is not set
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> CONFIG_FMC_TRIVIAL=3Dy
> CONFIG_FMC_WRITE_EEPROM=3Dy
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
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
> # CONFIG_LIBNVDIMM is not set
> # CONFIG_NVMEM is not set
> CONFIG_STM=3Dy
> # CONFIG_STM_DUMMY is not set
> CONFIG_STM_SOURCE_CONSOLE=3Dy
> # CONFIG_INTEL_TH is not set
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
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
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
> CONFIG_EXT2_FS=3Dy
> # CONFIG_EXT2_FS_XATTR is not set
> CONFIG_EXT3_FS=3Dy
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> CONFIG_EXT3_FS_SECURITY=3Dy
> CONFIG_EXT4_FS=3Dy
> # CONFIG_EXT4_FS_POSIX_ACL is not set
> CONFIG_EXT4_FS_SECURITY=3Dy
> CONFIG_EXT4_ENCRYPTION=3Dy
> CONFIG_EXT4_FS_ENCRYPTION=3Dy
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dy
> CONFIG_XFS_QUOTA=3Dy
> CONFIG_XFS_POSIX_ACL=3Dy
> CONFIG_XFS_RT=3Dy
> # CONFIG_XFS_WARN is not set
> # CONFIG_XFS_DEBUG is not set
> # CONFIG_GFS2_FS is not set
> CONFIG_OCFS2_FS=3Dy
> CONFIG_OCFS2_FS_O2CB=3Dy
> # CONFIG_OCFS2_FS_STATS is not set
> # CONFIG_OCFS2_DEBUG_MASKLOG is not set
> CONFIG_OCFS2_DEBUG_FS=3Dy
> CONFIG_BTRFS_FS=3Dy
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_F2FS_FS=3Dy
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> # CONFIG_F2FS_FS_SECURITY is not set
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FS_ENCRYPTION is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_MANDATORY_FILE_LOCKING is not set
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> CONFIG_QUOTA_DEBUG=3Dy
> CONFIG_QUOTA_TREE=3Dy
> CONFIG_QFMT_V1=3Dy
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_QUOTACTL_COMPAT=3Dy
> # CONFIG_AUTOFS4_FS is not set
> # CONFIG_FUSE_FS is not set
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> CONFIG_FSCACHE_DEBUG=3Dy
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> CONFIG_CACHEFILES=3Dy
> CONFIG_CACHEFILES_DEBUG=3Dy
> # CONFIG_CACHEFILES_HISTOGRAM is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> # CONFIG_UDF_FS is not set
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> # CONFIG_MSDOS_FS is not set
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> CONFIG_NTFS_FS=3Dy
> CONFIG_NTFS_DEBUG=3Dy
> # CONFIG_NTFS_RW is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_VMCORE=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> CONFIG_ECRYPT_FS=3Dy
> CONFIG_ECRYPT_FS_MESSAGING=3Dy
> CONFIG_HFS_FS=3Dy
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> # CONFIG_LOGFS is not set
> CONFIG_CRAMFS=3Dy
> CONFIG_SQUASHFS=3Dy
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> CONFIG_SQUASHFS_DECOMP_MULTI=3Dy
> # CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
> CONFIG_SQUASHFS_XATTR=3Dy
> # CONFIG_SQUASHFS_ZLIB is not set
> # CONFIG_SQUASHFS_LZ4 is not set
> # CONFIG_SQUASHFS_LZO is not set
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> CONFIG_SQUASHFS_EMBEDDED=3Dy
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> CONFIG_VXFS_FS=3Dy
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> CONFIG_HPFS_FS=3Dy
> # CONFIG_QNX4FS_FS is not set
> CONFIG_QNX6FS_FS=3Dy
> CONFIG_QNX6FS_DEBUG=3Dy
> CONFIG_ROMFS_FS=3Dy
> CONFIG_ROMFS_BACKED_BY_BLOCK=3Dy
> CONFIG_ROMFS_ON_BLOCK=3Dy
> CONFIG_PSTORE=3Dy
> # CONFIG_PSTORE_CONSOLE is not set
> CONFIG_PSTORE_PMSG=3Dy
> # CONFIG_PSTORE_RAM is not set
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> # CONFIG_UFS_FS_WRITE is not set
> # CONFIG_UFS_DEBUG is not set
> CONFIG_EXOFS_FS=3Dy
> # CONFIG_EXOFS_DEBUG is not set
> CONFIG_ORE=3Dy
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> # CONFIG_NLS_CODEPAGE_861 is not set
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dy
> # CONFIG_NLS_CODEPAGE_865 is not set
> CONFIG_NLS_CODEPAGE_866=3Dy
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dy
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dy
> CONFIG_NLS_CODEPAGE_1250=3Dy
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dy
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
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> # CONFIG_DEBUG_SLAB is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_DEBUG_VM is not set
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_KMEMCHECK is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> # CONFIG_WQ_WATCHDOG is not set
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> # CONFIG_SCHEDSTATS is not set
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> CONFIG_DEBUG_TIMEKEEPING=3Dy
> # CONFIG_TIMER_STATS is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # CONFIG_DEBUG_LIST is not set
> CONFIG_DEBUG_PI_LIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> # CONFIG_DEBUG_NOTIFIERS is not set
> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> CONFIG_PROVE_RCU_REPEATEDLY=3Dy
> CONFIG_SPARSE_RCU_POINTER=3Dy
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
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
> CONFIG_HAVE_FENTRY=3Dy
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
> CONFIG_RBTREE_TEST=3Dy
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=3Dy
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_TEST_FIRMWARE=3Dy
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_MEMTEST is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> CONFIG_UBSAN_ALIGNMENT=3Dy
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> # CONFIG_STRICT_DEVMEM is not set
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> CONFIG_X86_PTDUMP_CORE=3Dy
> CONFIG_X86_PTDUMP=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_DEBUG_WX=3Dy
> # CONFIG_DOUBLEFAULT is not set
> CONFIG_DEBUG_TLBFLUSH=3Dy
> # CONFIG_IOMMU_STRESS is not set
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
> # CONFIG_OPTIMIZE_INLINING is not set
> # CONFIG_DEBUG_ENTRY is not set
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> CONFIG_X86_DEBUG_STATIC_CPU_HAS=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> CONFIG_SECURITY_PATH=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_YAMA=3Dy
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> # CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
> # CONFIG_INTEGRITY_AUDIT is not set
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
> CONFIG_EVM=3Dy
> # CONFIG_EVM_ATTR_FSUUID is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_XOR_BLOCKS=3Dy
> CONFIG_ASYNC_CORE=3Dy
> CONFIG_ASYNC_XOR=3Dy
> CONFIG_ASYNC_PQ=3Dy
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
> CONFIG_CRYPTO_PCOMP=3Dy
> CONFIG_CRYPTO_PCOMP2=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> # CONFIG_CRYPTO_RSA is not set
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> # CONFIG_CRYPTO_PCRYPT is not set
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
> # CONFIG_CRYPTO_GCM is not set
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
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
> # CONFIG_CRYPTO_KEYWRAP is not set
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dy
> # CONFIG_CRYPTO_GHASH is not set
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> # CONFIG_CRYPTO_SHA1_SSSE3 is not set
> # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> CONFIG_CRYPTO_SHA512_SSSE3=3Dy
> CONFIG_CRYPTO_SHA1_MB=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> # CONFIG_CRYPTO_TGR192 is not set
> CONFIG_CRYPTO_WP512=3Dy
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> # CONFIG_CRYPTO_SALSA20_X86_64 is not set
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> =

> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> CONFIG_CRYPTO_ZLIB=3Dy
> # CONFIG_CRYPTO_LZO is not set
> CONFIG_CRYPTO_842=3Dy
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dy
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
> CONFIG_CRYPTO_USER_API=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_PUBLIC_KEY_ALGO_RSA=3Dy
> # CONFIG_X509_CERTIFICATE_PARSER is not set
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQFD=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_APIC_ARCHITECTURE=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> CONFIG_KVM_COMPAT=3Dy
> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dy
> CONFIG_KVM_INTEL=3Dy
> # CONFIG_KVM_AMD is not set
> # CONFIG_BINARY_PRINTF is not set
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dy
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
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> # CONFIG_XZ_DEC_X86 is not set
> # CONFIG_XZ_DEC_POWERPC is not set
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> # CONFIG_DDR is not set
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> # CONFIG_SG_SPLIT is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy


--===============2224382154538704676==--

