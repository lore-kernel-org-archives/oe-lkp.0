Content-Type: multipart/mixed; boundary="===============6432101327479897300=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] e12c5dd1e8: 32-bit relocation outside of kernel!
Date: Fri, 27 May 2016 09:16:54 +0800
Message-ID: <20160527011654.GA28252@wfg-t540p.sh.intel.com>
In-Reply-To: <20160527011423.GA27239@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6432101327479897300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

btw, this boot error cannot be confirmed in the current branch HEAD
due to a build error:

arch/x86/include/asm/pgtable.h:740:25: error: 'init_level4_pgt' undeclared =
(first use in this function)

Thanks,
Fengguang

On Fri, May 27, 2016 at 09:14:23AM +0800, Fengguang Wu wrote:
> Hi kees,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git kaslr/memo=
ry
> =

> commit e12c5dd1e88502517d2723587e6cb955a5b24a25
> Author:     Kees Cook <keescook@chromium.org>
> AuthorDate: Mon May 9 10:57:32 2016 -0700
> Commit:     Kees Cook <keescook@chromium.org>
> CommitDate: Fri May 20 20:25:09 2016 -0700
> =

>     x86/KASLR: Add physical address randomization >4G
>     =

>     This patch exchanges the prior slots[] array for the new slot_areas[]
>     array, and lifts the limitation of KERNEL_IMAGE_SIZE on the physical
>     address offset for 64-bit. As before, process_e820_entry() walks
>     memory and populates slot_areas[], splitting on any detected mem_avoid
>     collisions.
>     =

>     Finally, since the slots[] array and its associated functions are not
>     needed any more, so they are removed.
>     =

>     Based on earlier patches by Baoquan He.
>     =

>     Cc: Baoquan He <bhe@redhat.com>
>     Signed-off-by: Kees Cook <keescook@chromium.org>
>     ---
>     This patch is pretty noisy due to the indentation change in the
>     e820 walker. I couldn't find a cleaner way to do this that didn't
>     make the final code LESS readable, unfortunately. So, the diff is
>     ugly, but I think the results are clean.
> =

> +------------------------------------------------------------------+-----=
-------+------------+------------+
> |                                                                  | 4239=
d106bd | e12c5dd1e8 | 55d0d5ab24 |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> | boot_successes                                                   | 1178=
       | 180        | 50         |
> | boot_failures                                                    | 42  =
       | 130        | 29         |
> | BUG:unable_to_handle_kernel                                      | 32  =
       | 6          | 2          |
> | Oops                                                             | 36  =
       | 8          | 2          |
> | EIP_is_at_perf_prepare_sample                                    | 36  =
       | 8          | 2          |
> | Kernel_panic-not_syncing:Fatal_exception                         | 21  =
       | 7          |            |
> | backtrace:iterate_dir                                            | 11  =
       | 3          |            |
> | backtrace:SyS_getdents64                                         | 12  =
       | 3          |            |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 6 =
         | 1          |            |
> | Mem-Info                                                         | 6   =
       | 1          | 1          |
> | Out_of_memory:Kill_process                                       | 6   =
       | 1          |            |
> | page_allocation_failure:order:#,mode:#(GFP_HIGHUSER_MOVABLE)     | 2   =
       | 1          |            |
> | warn_alloc_failed+0x                                             | 2   =
       | 1          | 1          |
> | backtrace:_do_fork                                               | 5   =
       | 1          |            |
> | backtrace:SyS_clone                                              | 5   =
       | 1          |            |
> | backtrace:__mm_populate                                          | 2   =
       | 1          |            |
> | backtrace:SyS_mlockall                                           | 2   =
       | 1          |            |
> | page_allocation_failure:order:#,mode:#(GFP_KERNEL|__GFP_NORETRY) | 1   =
       | 0          | 1          |
> | backtrace:sock_setsockopt                                        | 2   =
       |            |            |
> | backtrace:SyS_setsockopt                                         | 2   =
       |            |            |
> | backtrace:SyS_socketcall                                         | 2   =
       |            |            |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt            | 15  =
       | 1          | 2          |
> | Oops:#[##ed_to_execute'/]PREEMPT_SMP_DEBUG_PAGEALLOC             | 1   =
       |            |            |
> | backtrace:trace_apic_timer_interrupt                             | 1   =
       |            |            |
> | backtrace:vfs_fstatat                                            | 7   =
       | 2          | 1          |
> | backtrace:SyS_fstatat64                                          | 8   =
       | 2          | 1          |
> | backtrace:cp_new_stat64                                          | 1   =
       |            |            |
> | BUG:kernel_early-boot_crashed_Decompressing_Linux...Parsing_ELF  | 0   =
       | 47         | 14         |
> | BUG:kernel_early-boot_crashed_Decompressing_Linux                | 0   =
       | 16         | 4          |
> | BUG:kernel_early-boot_hang_Decompressing_Linux                   | 0   =
       | 19         | 2          |
> | BUG:kernel_early-boot_hang_Decompressing_Linux...Parsing_ELF     | 0   =
       | 10         |            |
> | BUG:kernel_boot_hang                                             | 0   =
       | 26         | 4          |
> | bit_relocation_outside_of_kernel                                 | 0   =
       | 6          | 2          |
> | System_halted                                                    | 0   =
       | 10         | 2          |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 0   =
       | 1          |            |
> | BUG:kernel_boot_crashed                                          | 0   =
       | 3          | 2          |
> | backtrace:ring_buffer_consumer_thread                            | 0   =
       | 0          | 1          |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> =

> =

> Decompressing Linux... Parsing ELF... Performing relocations... =

> =

> 32-bit relocation outside of kernel!
> =

> =

>  -- System halted
> Elapsed time: 440
> BUG: kernel boot hang
> Linux version 4.6.0-07139-ge12c5dd #1
> Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,115200 systemd.log_=
level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_=
timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dp=
anic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dt=
ty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-queue/kvm/i3=
86-randconfig-c0-05212049/linux-devel:devel-spot-201605212023:e12c5dd1e8850=
2517d2723587e6cb955a5b24a25:bisect-linux-9/.vmlinuz-e12c5dd1e88502517d27235=
87e6cb955a5b24a25-20160521233903-232-vp branch=3Dlinux-devel/devel-spot-201=
605212023 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-c0-05212049/gcc-6/e12c5dd=
1e88502517d2723587e6cb955a5b24a25/vmlinuz-4.6.0-07139-ge12c5dd drbd.minor_c=
ount=3D8
> qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel /pkg/linu=
x/i386-randconfig-c0-05212049/gcc-6/e12c5dd1e88502517d2723587e6cb955a5b24a2=
5/vmlinuz-4.6.0-07139-ge12c5dd -append 'hung_task_panic=3D1 earlyprintk=3Dt=
tyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled=
 rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_w=
atchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3D=
ttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuil=
d-tests/run-queue/kvm/i386-randconfig-c0-05212049/linux-devel:devel-spot-20=
1605212023:e12c5dd1e88502517d2723587e6cb955a5b24a25:bisect-linux-9/.vmlinuz=
-e12c5dd1e88502517d2723587e6cb955a5b24a25-20160521233903-232-vp branch=3Dli=
nux-devel/devel-spot-201605212023 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-c=
0-05212049/gcc-6/e12c5dd1e88502517d2723587e6cb955a5b24a25/vmlinuz-4.6.0-071=
39-ge12c5dd drbd.minor_count=3D8'  -initrd /osimage/yocto/yocto-minimal-i38=
6.cgz -m 256 -smp 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boo=
t order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive fil=
e=3D/fs/sdh1/disk0-yocto-vp-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sd=
h1/disk1-yocto-vp-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/disk2-y=
octo-vp-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/disk3-yocto-vp-1,=
media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/disk4-yocto-vp-1,media=3Ddi=
sk,if=3Dvirtio -drive file=3D/fs/sdh1/disk5-yocto-vp-1,media=3Ddisk,if=3Dvi=
rtio -drive file=3D/fs/sdh1/disk6-yocto-vp-1,media=3Ddisk,if=3Dvirtio -pidf=
ile /dev/shm/kboot/pid-yocto-vp-1 -serial file:/dev/shm/kboot/serial-yocto-=
vp-1 -daemonize -display none -monitor null =

> =

> git bisect start 55d0d5ab240cfe172cc650fa3f6258b54c5b43b5 2dcd0af568b0cf5=
83645c8a317dd12e344b1c72a --
> git bisect  bad 8fe184983f4d1eda146f2c755952ebd3615177c8  # 22:16    281-=
    114  Merge 'ak/perf/disassembler-1' into devel-spot-201605212023
> git bisect  bad b636a37bfb997cc1bfd21d7c8384483ae8e99299  # 22:30    260-=
    131  Merge 'kees/kbuild/no-android' into devel-spot-201605212023
> git bisect good f775335ec7d8c0e7f8fb0c96980021a8f67e925c  # 22:49    305+=
      9  Merge 'kees/nak/proc-r' into devel-spot-201605212023
> git bisect good 1843001560bc48bd94a9b115f3f22f44f29ca12c  # 23:06    308+=
     12  Merge 'kees/kaslr/weak-symbols' into devel-spot-201605212023
> git bisect  bad f44d5a44acfc16e3ba362fabe0a0a4a741e57913  # 23:21    290-=
    113  Merge 'kees/kaslr/memory' into devel-spot-201605212023
> git bisect good e19043ca4914e263cbb5093f453ce025376b3c5c  # 23:31    302+=
     13  Merge 'kees/kaslr/relocs' into devel-spot-201605212023
> git bisect  bad e12c5dd1e88502517d2723587e6cb955a5b24a25  # 23:47    292-=
    117  x86/KASLR: Add physical address randomization >4G
> git bisect good d268ed7754e142e8030f7584796b2c53363785c9  # 00:12    309+=
     31  x86/KASLR: Clarify identity map interface
> git bisect good 4239d106bdc0bdd6a46e1d70cf7c59dd5515ac00  # 00:30    302+=
      9  x86/KASLR: Randomize virtual address separately
> # first bad commit: [e12c5dd1e88502517d2723587e6cb955a5b24a25] x86/KASLR:=
 Add physical address randomization >4G
> git bisect good 4239d106bdc0bdd6a46e1d70cf7c59dd5515ac00  # 00:57    918+=
     42  x86/KASLR: Randomize virtual address separately
> # extra tests on HEAD of linux-devel/devel-spot-201605212023
> git bisect  bad 55d0d5ab240cfe172cc650fa3f6258b54c5b43b5  # 00:57      0-=
     29  0day head guard for 'devel-spot-201605212023'
> # extra tests on tree/branch kees/kaslr/memory
> # extra tests on tree/branch linus/master
> git bisect good 5469dc270cd44c451590d40c031e6a71c1f637e8  # 02:22    901+=
    901  Merge branch 'akpm' (patches from Andrew)
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
> # Linux/i386 4.6.0 Kernel Configuration
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
> CONFIG_X86_32_SMP=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_PGTABLE_LEVELS=3D2
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
> CONFIG_KERNEL_BZIP2=3Dy
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SWAP is not set
> CONFIG_SYSVIPC=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_USELIB=3Dy
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
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
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_PREEMPT_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> # CONFIG_TASKS_RCU is not set
> CONFIG_RCU_STALL_COMMON=3Dy
> # CONFIG_TREE_RCU_TRACE is not set
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> # CONFIG_IKCONFIG_PROC is not set
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> # CONFIG_BLK_CGROUP is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> CONFIG_IPC_NS=3Dy
> CONFIG_USER_NS=3Dy
> # CONFIG_PID_NS is not set
> CONFIG_NET_NS=3Dy
> CONFIG_SCHED_AUTOGROUP=3Dy
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
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> # CONFIG_UID16 is not set
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> # CONFIG_EVENTFD is not set
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_SHMEM=3Dy
> # CONFIG_AIO is not set
> CONFIG_ADVISE_SYSCALLS=3Dy
> # CONFIG_USERFAULTFD is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_MEMBARRIER is not set
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
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
> CONFIG_UPROBES=3Dy
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
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_FORMAT_AUTODETECT is not set
> CONFIG_GCOV_FORMAT_3_4=3Dy
> # CONFIG_GCOV_FORMAT_4_7 is not set
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> # CONFIG_MODULES is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> # CONFIG_LBDAF is not set
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> # CONFIG_BLK_DEV_INTEGRITY is not set
> CONFIG_BLK_CMDLINE_PARSER=3Dy
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> # CONFIG_AIX_PARTITION is not set
> CONFIG_OSF_PARTITION=3Dy
> # CONFIG_AMIGA_PARTITION is not set
> CONFIG_ATARI_PARTITION=3Dy
> # CONFIG_MAC_PARTITION is not set
> # CONFIG_MSDOS_PARTITION is not set
> CONFIG_LDM_PARTITION=3Dy
> CONFIG_LDM_DEBUG=3Dy
> # CONFIG_SGI_PARTITION is not set
> CONFIG_ULTRIX_PARTITION=3Dy
> CONFIG_SUN_PARTITION=3Dy
> # CONFIG_KARMA_PARTITION is not set
> # CONFIG_EFI_PARTITION is not set
> # CONFIG_SYSV68_PARTITION is not set
> # CONFIG_CMDLINE_PARTITION is not set
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> # CONFIG_DEFAULT_DEADLINE is not set
> # CONFIG_DEFAULT_CFQ is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> # CONFIG_FREEZER is not set
> =

> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
> # CONFIG_X86_MPPARSE is not set
> CONFIG_X86_BIGSMP=3Dy
> # CONFIG_GOLDFISH is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_X86_32_IRIS is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_DEBUG=3Dy
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_KVM_DEBUG_FS=3Dy
> # CONFIG_LGUEST_GUEST is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
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
> # CONFIG_X86_GENERIC is not set
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D5
> CONFIG_X86_L1_CACHE_SHIFT=3D5
> # CONFIG_X86_PPRO_FENCE is not set
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> CONFIG_X86_DEBUGCTLMSR=3Dy
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_CPU_SUP_UMC_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_NR_CPUS=3D32
> # CONFIG_SCHED_SMT is not set
> CONFIG_SCHED_MC=3Dy
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> # CONFIG_X86_LEGACY_VM86 is not set
> # CONFIG_VM86 is not set
> # CONFIG_TOSHIBA is not set
> CONFIG_I8K=3Dy
> # CONFIG_X86_REBOOTFIXUPS is not set
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_NOHIGHMEM=3Dy
> # CONFIG_HIGHMEM4G is not set
> # CONFIG_HIGHMEM64G is not set
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_3G_OPT is not set
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_2G_OPT is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> # CONFIG_X86_PAE is not set
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
> CONFIG_MEMORY_ISOLATION=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> # CONFIG_PHYS_ADDR_T_64BIT is not set
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_CLEANCACHE=3Dy
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> CONFIG_CMA_DEBUGFS=3Dy
> CONFIG_CMA_AREAS=3D7
> # CONFIG_ZPOOL is not set
> CONFIG_ZBUD=3Dy
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_FRAME_VECTOR=3Dy
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_INTEL_MPX is not set
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> # CONFIG_SCHED_HRTICK is not set
> # CONFIG_KEXEC is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_HOTPLUG_CPU is not set
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
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
> CONFIG_ACPI_EC_DEBUGFS=3Dy
> # CONFIG_ACPI_AC is not set
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_DOCK=3Dy
> # CONFIG_ACPI_PROCESSOR is not set
> CONFIG_ACPI_IPMI=3Dy
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> # CONFIG_ACPI_CONTAINER is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dy
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> CONFIG_ACPI_REDUCED_HARDWARE_ONLY=3Dy
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> CONFIG_ACPI_APEI_PCIEAER=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dy
> # CONFIG_ACPI_APEI_ERST_DEBUG is not set
> CONFIG_PMIC_OPREGION=3Dy
> CONFIG_SFI=3Dy
> =

> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> =

> #
> # CPU Idle
> #
> # CONFIG_CPU_IDLE is not set
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
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
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEAER_INJECT=3Dy
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEBUG=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> # CONFIG_PCIE_DPC is not set
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
> CONFIG_PCI_STUB=3Dy
> CONFIG_HT_IRQ=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI host controller drivers
> #
> CONFIG_PCIE_DW_PLAT=3Dy
> CONFIG_PCIE_DW=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_SCx200=3Dy
> CONFIG_SCx200HR_TIMER=3Dy
> # CONFIG_OLPC is not set
> # CONFIG_ALIX is not set
> # CONFIG_NET5501 is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> CONFIG_PCMCIA_LOAD_CIS=3Dy
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> CONFIG_YENTA_O2=3Dy
> # CONFIG_YENTA_RICOH is not set
> # CONFIG_YENTA_TI is not set
> CONFIG_YENTA_TOSHIBA=3Dy
> CONFIG_PD6729=3Dy
> # CONFIG_I82092 is not set
> # CONFIG_I82365 is not set
> # CONFIG_TCIC is not set
> CONFIG_PCMCIA_PROBE=3Dy
> CONFIG_PCCARD_NONSTATIC=3Dy
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
> CONFIG_VMD=3Dy
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
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_HSR is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_SOCK_CGROUP_DATA is not set
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
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
> # CONFIG_RFKILL_REGULATOR is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_NFC is not set
> # CONFIG_LWTUNNEL is not set
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
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_FENCE_TRACE is not set
> CONFIG_DMA_CMA=3Dy
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D0
> CONFIG_CMA_SIZE_PERCENTAGE=3D0
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> CONFIG_CMA_SIZE_SEL_MIN=3Dy
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=3D8
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> # CONFIG_MTD_BLOCK is not set
> CONFIG_MTD_BLOCK_RO=3Dy
> CONFIG_FTL=3Dy
> # CONFIG_NFTL is not set
> CONFIG_INFTL=3Dy
> # CONFIG_RFD_FTL is not set
> CONFIG_SSFDC=3Dy
> CONFIG_SM_FTL=3Dy
> # CONFIG_MTD_OOPS is not set
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> # CONFIG_MTD_ROM is not set
> CONFIG_MTD_ABSENT=3Dy
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> CONFIG_MTD_SBC_GXX=3Dy
> # CONFIG_MTD_AMD76XROM is not set
> # CONFIG_MTD_ICHXROM is not set
> CONFIG_MTD_ESB2ROM=3Dy
> CONFIG_MTD_CK804XROM=3Dy
> CONFIG_MTD_SCB2_FLASH=3Dy
> # CONFIG_MTD_NETtel is not set
> # CONFIG_MTD_L440GX is not set
> CONFIG_MTD_PCI=3Dy
> CONFIG_MTD_PCMCIA=3Dy
> # CONFIG_MTD_PCMCIA_ANONYMOUS is not set
> CONFIG_MTD_GPIO_ADDR=3Dy
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> CONFIG_MTD_PLATRAM=3Dy
> CONFIG_MTD_LATCH_ADDR=3Dy
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dy
> CONFIG_MTD_PMC551_BUGFIX=3Dy
> # CONFIG_MTD_PMC551_DEBUG is not set
> CONFIG_MTD_SLRAM=3Dy
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> CONFIG_MTDRAM_ABS_POS=3D0
> # CONFIG_MTD_BLOCK2MTD is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SMC=3Dy
> CONFIG_MTD_NAND=3Dy
> CONFIG_MTD_NAND_BCH=3Dy
> CONFIG_MTD_NAND_ECC_BCH=3Dy
> CONFIG_MTD_SM_COMMON=3Dy
> CONFIG_MTD_NAND_DENALI=3Dy
> CONFIG_MTD_NAND_DENALI_PCI=3Dy
> CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR=3D0xFF108018
> CONFIG_MTD_NAND_GPIO=3Dy
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_IDS=3Dy
> CONFIG_MTD_NAND_RICOH=3Dy
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
> # CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
> CONFIG_MTD_NAND_DOCG4=3Dy
> CONFIG_MTD_NAND_CAFE=3Dy
> CONFIG_MTD_NAND_CS553X=3Dy
> # CONFIG_MTD_NAND_NANDSIM is not set
> CONFIG_MTD_NAND_PLATFORM=3Dy
> CONFIG_MTD_NAND_HISI504=3Dy
> # CONFIG_MTD_ONENAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> CONFIG_MTD_SPI_NOR=3Dy
> # CONFIG_MTD_MT81xx_NOR is not set
> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> CONFIG_MTD_UBI_FASTMAP=3Dy
> CONFIG_MTD_UBI_GLUEBI=3Dy
> CONFIG_MTD_UBI_BLOCK=3Dy
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_ISAPNP=3Dy
> # CONFIG_PNPBIOS is not set
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_BLK_DEV_FD is not set
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
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_HD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> CONFIG_NVME_CORE=3Dy
> CONFIG_BLK_DEV_NVME=3Dy
> # CONFIG_BLK_DEV_NVME_SCSI is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dy
> CONFIG_IBM_ASM=3Dy
> CONFIG_PHANTOM=3Dy
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dy
> CONFIG_ICS932S401=3Dy
> CONFIG_ENCLOSURE_SERVICES=3Dy
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dy
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dy
> # CONFIG_SENSORS_TSL2550 is not set
> CONFIG_SENSORS_BH1780=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> # CONFIG_SENSORS_APDS990X is not set
> CONFIG_HMC6352=3Dy
> # CONFIG_DS1682 is not set
> CONFIG_BMP085=3Dy
> CONFIG_BMP085_I2C=3Dy
> # CONFIG_PCH_PHUB is not set
> # CONFIG_USB_SWITCH_FSA9480 is not set
> CONFIG_SRAM=3Dy
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
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_RAID_ATTRS is not set
> # CONFIG_SCSI is not set
> # CONFIG_SCSI_DMA is not set
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_ATA is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> # CONFIG_MD_AUTODETECT is not set
> CONFIG_MD_LINEAR=3Dy
> CONFIG_MD_RAID0=3Dy
> CONFIG_MD_RAID1=3Dy
> CONFIG_MD_RAID10=3Dy
> CONFIG_MD_RAID456=3Dy
> CONFIG_MD_MULTIPATH=3Dy
> CONFIG_MD_FAULTY=3Dy
> CONFIG_BCACHE=3Dy
> # CONFIG_BCACHE_DEBUG is not set
> CONFIG_BCACHE_CLOSURES_DEBUG=3Dy
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dy
> CONFIG_DM_MQ_DEFAULT=3Dy
> CONFIG_DM_DEBUG=3Dy
> CONFIG_DM_BUFIO=3Dy
> CONFIG_DM_DEBUG_BLOCK_STACK_TRACING=3Dy
> CONFIG_DM_BIO_PRISON=3Dy
> CONFIG_DM_PERSISTENT_DATA=3Dy
> CONFIG_DM_CRYPT=3Dy
> CONFIG_DM_SNAPSHOT=3Dy
> CONFIG_DM_THIN_PROVISIONING=3Dy
> CONFIG_DM_CACHE=3Dy
> # CONFIG_DM_CACHE_SMQ is not set
> # CONFIG_DM_CACHE_CLEANER is not set
> # CONFIG_DM_ERA is not set
> CONFIG_DM_MIRROR=3Dy
> # CONFIG_DM_LOG_USERSPACE is not set
> CONFIG_DM_RAID=3Dy
> CONFIG_DM_ZERO=3Dy
> # CONFIG_DM_MULTIPATH is not set
> CONFIG_DM_DELAY=3Dy
> CONFIG_DM_UEVENT=3Dy
> CONFIG_DM_FLAKEY=3Dy
> CONFIG_DM_VERITY=3Dy
> CONFIG_DM_VERITY_FEC=3Dy
> # CONFIG_DM_SWITCH is not set
> CONFIG_DM_LOG_WRITES=3Dy
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> # CONFIG_FIREWIRE_OHCI is not set
> CONFIG_FIREWIRE_NOSY=3Dy
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> CONFIG_NVM=3Dy
> # CONFIG_NVM_DEBUG is not set
> CONFIG_NVM_GENNVM=3Dy
> CONFIG_NVM_RRPC=3Dy
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
> # CONFIG_INPUT_MOUSEDEV is not set
> CONFIG_INPUT_JOYDEV=3Dy
> CONFIG_INPUT_EVDEV=3Dy
> CONFIG_INPUT_EVBUG=3Dy
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
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> CONFIG_TABLET_USB_ACECAD=3Dy
> CONFIG_TABLET_USB_AIPTEK=3Dy
> CONFIG_TABLET_USB_GTCO=3Dy
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> # CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
> CONFIG_TOUCHSCREEN_DA9034=3Dy
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> CONFIG_TOUCHSCREEN_EETI=3Dy
> # CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
> # CONFIG_TOUCHSCREEN_FT6236 is not set
> # CONFIG_TOUCHSCREEN_FUJITSU is not set
> CONFIG_TOUCHSCREEN_GOODIX=3Dy
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> # CONFIG_TOUCHSCREEN_GUNZE is not set
> CONFIG_TOUCHSCREEN_ELAN=3Dy
> # CONFIG_TOUCHSCREEN_ELO is not set
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> CONFIG_TOUCHSCREEN_MAX11801=3Dy
> # CONFIG_TOUCHSCREEN_MCS5000 is not set
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> CONFIG_TOUCHSCREEN_MK712=3Dy
> CONFIG_TOUCHSCREEN_HTCPEN=3Dy
> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
> # CONFIG_TOUCHSCREEN_WM831X is not set
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> CONFIG_TOUCHSCREEN_MC13783=3Dy
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> # CONFIG_TOUCHSCREEN_TSC2004 is not set
> CONFIG_TOUCHSCREEN_TSC2007=3Dy
> CONFIG_TOUCHSCREEN_ST1232=3Dy
> CONFIG_TOUCHSCREEN_SUR40=3Dy
> CONFIG_TOUCHSCREEN_SX8654=3Dy
> # CONFIG_TOUCHSCREEN_TPS6507X is not set
> # CONFIG_TOUCHSCREEN_ZFORCE is not set
> # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> # CONFIG_RMI4_F11 is not set
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> CONFIG_GAMEPORT_EMU10K1=3Dy
> CONFIG_GAMEPORT_FM801=3Dy
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> # CONFIG_UNIX98_PTYS is not set
> # CONFIG_LEGACY_PTYS is not set
> # CONFIG_SERIAL_NONSTANDARD is not set
> CONFIG_NOZOMI=3Dy
> # CONFIG_N_GSM is not set
> CONFIG_TRACE_ROUTER=3Dy
> CONFIG_TRACE_SINK=3Dy
> CONFIG_DEVMEM=3Dy
> CONFIG_DEVKMEM=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> # CONFIG_SERIAL_8250_PNP is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> # CONFIG_SERIAL_8250_DMA is not set
> # CONFIG_SERIAL_8250_PCI is not set
> # CONFIG_SERIAL_8250_CS is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> # CONFIG_SERIAL_8250_FOURPORT is not set
> CONFIG_SERIAL_8250_ACCENT=3Dy
> # CONFIG_SERIAL_8250_BOCA is not set
> # CONFIG_SERIAL_8250_EXAR_ST16C554 is not set
> # CONFIG_SERIAL_8250_HUB6 is not set
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> CONFIG_SERIAL_8250_RSA=3Dy
> # CONFIG_SERIAL_8250_FSL is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_FINTEK=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_8250_MOXA is not set
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_UARTLITE=3Dy
> CONFIG_SERIAL_UARTLITE_CONSOLE=3Dy
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_PCH_UART=3Dy
> CONFIG_SERIAL_PCH_UART_CONSOLE=3Dy
> CONFIG_SERIAL_ARC=3Dy
> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> CONFIG_SERIAL_FSL_LPUART=3Dy
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> CONFIG_SERIAL_MVEBU_UART=3Dy
> # CONFIG_SERIAL_MVEBU_CONSOLE is not set
> CONFIG_TTY_PRINTK=3Dy
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> # CONFIG_IPMI_SI_PROBE_DEFAULTS is not set
> # CONFIG_IPMI_SSIF is not set
> CONFIG_IPMI_WATCHDOG=3Dy
> CONFIG_IPMI_POWEROFF=3Dy
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> # CONFIG_HW_RANDOM_INTEL is not set
> # CONFIG_HW_RANDOM_AMD is not set
> # CONFIG_HW_RANDOM_GEODE is not set
> # CONFIG_HW_RANDOM_VIA is not set
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_HW_RANDOM_TPM is not set
> # CONFIG_NVRAM is not set
> CONFIG_DTLK=3Dy
> CONFIG_R3964=3Dy
> CONFIG_APPLICOM=3Dy
> CONFIG_SONYPI=3Dy
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dy
> CONFIG_CARDMAN_4000=3Dy
> CONFIG_CARDMAN_4040=3Dy
> CONFIG_MWAVE=3Dy
> CONFIG_SCx200_GPIO=3Dy
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> # CONFIG_TCG_TIS is not set
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> CONFIG_TCG_INFINEON=3Dy
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> # CONFIG_TELCLOCK is not set
> CONFIG_DEVPORT=3Dy
> CONFIG_XILLYBUS=3Dy
> CONFIG_XILLYBUS_PCIE=3Dy
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> CONFIG_I2C_MUX_PCA954x=3Dy
> # CONFIG_I2C_MUX_PINCTRL is not set
> CONFIG_I2C_MUX_REG=3Dy
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCF=3Dy
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
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=3Dy
> # CONFIG_I2C_I801 is not set
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> # CONFIG_I2C_SIS96X is not set
> CONFIG_I2C_VIA=3Dy
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
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> # CONFIG_I2C_EG20T is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> CONFIG_I2C_KEMPLD=3Dy
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dy
> # CONFIG_I2C_DLN2 is not set
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> CONFIG_I2C_TAOS_EVM=3Dy
> # CONFIG_I2C_TINY_USB is not set
> CONFIG_I2C_VIPERBOARD=3Dy
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_PCA_ISA=3Dy
> CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> # CONFIG_SCx200_ACB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
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
> # CONFIG_NTP_PPS is not set
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dy
> CONFIG_PPS_CLIENT_LDISC=3Dy
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
> CONFIG_PINCTRL=3Dy
> =

> #
> # Pin controllers
> #
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_AMD is not set
> # CONFIG_PINCTRL_BAYTRAIL is not set
> CONFIG_PINCTRL_CHERRYVIEW=3Dy
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_BROXTON=3Dy
> CONFIG_PINCTRL_SUNRISEPOINT=3Dy
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_AMDPT=3Dy
> CONFIG_GPIO_DWAPB=3Dy
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> # CONFIG_GPIO_ICH is not set
> CONFIG_GPIO_LYNXPOINT=3Dy
> # CONFIG_GPIO_MENZ127 is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_ZX is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_104_DIO_48E=3Dy
> CONFIG_GPIO_104_IDIO_16=3Dy
> CONFIG_GPIO_104_IDI_48=3Dy
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_IT87=3Dy
> CONFIG_GPIO_SCH=3Dy
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> CONFIG_GPIO_ADP5588_IRQ=3Dy
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dy
> CONFIG_GPIO_MAX732X_IRQ=3Dy
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCF857X=3Dy
> # CONFIG_GPIO_SX150X is not set
> CONFIG_GPIO_TPIC2810=3Dy
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dy
> # CONFIG_GPIO_DA9055 is not set
> CONFIG_GPIO_DLN2=3Dy
> CONFIG_GPIO_KEMPLD=3Dy
> CONFIG_GPIO_PALMAS=3Dy
> # CONFIG_GPIO_TIMBERDALE is not set
> CONFIG_GPIO_TPS6586X=3Dy
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_TWL4030=3Dy
> CONFIG_GPIO_TWL6040=3Dy
> CONFIG_GPIO_WM831X=3Dy
> CONFIG_GPIO_WM8350=3Dy
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_INTEL_MID is not set
> CONFIG_GPIO_ML_IOH=3Dy
> CONFIG_GPIO_PCH=3Dy
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI or I2C GPIO expanders
> #
> CONFIG_GPIO_MCP23S08=3Dy
> =

> #
> # USB GPIO expanders
> #
> # CONFIG_GPIO_VIPERBOARD is not set
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> # CONFIG_W1_SLAVE_DS2781 is not set
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_BQ27000=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_MAX8925_POWER=3Dy
> CONFIG_WM831X_BACKUP=3Dy
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_WM8350_POWER is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_DS2780=3Dy
> # CONFIG_BATTERY_DS2781 is not set
> CONFIG_BATTERY_DS2782=3Dy
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9150=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> CONFIG_CHARGER_ISP1704=3Dy
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> CONFIG_CHARGER_GPIO=3Dy
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_MAX77693=3Dy
> CONFIG_CHARGER_BQ2415X=3Dy
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> CONFIG_CHARGER_TPS65090=3Dy
> CONFIG_CHARGER_TPS65217=3Dy
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_RESTART=3Dy
> CONFIG_POWER_AVS=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7414=3Dy
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dy
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> # CONFIG_SENSORS_ASB100 is not set
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9055=3Dy
> CONFIG_SENSORS_I5K_AMB=3Dy
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> # CONFIG_SENSORS_F75375S is not set
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> # CONFIG_SENSORS_GL518SM is not set
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC2990=3Dy
> # CONFIG_SENSORS_LTC4151 is not set
> CONFIG_SENSORS_LTC4215=3Dy
> CONFIG_SENSORS_LTC4222=3Dy
> # CONFIG_SENSORS_LTC4245 is not set
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dy
> CONFIG_SENSORS_MAX16065=3Dy
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> # CONFIG_SENSORS_MAX197 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dy
> # CONFIG_SENSORS_LM77 is not set
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> # CONFIG_SENSORS_LM92 is not set
> # CONFIG_SENSORS_LM93 is not set
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dy
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NCT7904 is not set
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_PMBUS is not set
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=3Dy
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SIS5595=3Dy
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=3Dy
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> # CONFIG_SENSORS_SMM665 is not set
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS1015 is not set
> CONFIG_SENSORS_ADS7828=3Dy
> CONFIG_SENSORS_AMC6821=3Dy
> # CONFIG_SENSORS_INA209 is not set
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> # CONFIG_SENSORS_TMP103 is not set
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> CONFIG_SENSORS_W83793=3Dy
> CONFIG_SENSORS_W83795=3Dy
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> CONFIG_SENSORS_W83L785TS=3Dy
> # CONFIG_SENSORS_W83L786NG is not set
> # CONFIG_SENSORS_W83627HF is not set
> CONFIG_SENSORS_W83627EHF=3Dy
> CONFIG_SENSORS_WM831X=3Dy
> # CONFIG_SENSORS_WM8350 is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dy
> CONFIG_SENSORS_ATK0110=3Dy
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
> CONFIG_INTEL_POWERCLAMP=3Dy
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
> # CONFIG_INT3406_THERMAL is not set
> CONFIG_INTEL_PCH_THERMAL=3Dy
> # CONFIG_WATCHDOG is not set
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
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
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
> # CONFIG_MFD_CS5535 is not set
> CONFIG_MFD_AS3711=3Dy
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=3Dy
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dy
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9062 is not set
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_DLN2=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> # CONFIG_LPC_ICH is not set
> CONFIG_LPC_SCH=3Dy
> # CONFIG_INTEL_SOC_PMIC is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_VIPERBOARD=3Dy
> CONFIG_MFD_RETU=3Dy
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_MFD_RDC321X=3Dy
> CONFIG_MFD_RTSX_PCI=3Dy
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RTSX_USB=3Dy
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_RN5T618 is not set
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SKY81452=3Dy
> # CONFIG_MFD_SMSC is not set
> CONFIG_ABX500_CORE=3Dy
> # CONFIG_AB3100_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> # CONFIG_MFD_TPS65086 is not set
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS65217=3Dy
> # CONFIG_MFD_TPS65218 is not set
> CONFIG_MFD_TPS6586X=3Dy
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS80031 is not set
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_MFD_TWL4030_AUDIO is not set
> CONFIG_TWL6040_CORE=3Dy
> # CONFIG_MFD_WL1273_CORE is not set
> CONFIG_MFD_LM3533=3Dy
> CONFIG_MFD_TIMBERDALE=3Dy
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> # CONFIG_MFD_CS47L24 is not set
> # CONFIG_MFD_WM5102 is not set
> CONFIG_MFD_WM5110=3Dy
> CONFIG_MFD_WM8997=3Dy
> CONFIG_MFD_WM8998=3Dy
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> # CONFIG_MFD_WM8994 is not set
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> CONFIG_REGULATOR_88PM800=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_ANATOP=3Dy
> CONFIG_REGULATOR_AAT2870=3Dy
> # CONFIG_REGULATOR_AS3711 is not set
> CONFIG_REGULATOR_DA903X=3Dy
> # CONFIG_REGULATOR_DA9055 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=3Dy
> CONFIG_REGULATOR_MAX8660=3Dy
> # CONFIG_REGULATOR_MAX8907 is not set
> CONFIG_REGULATOR_MAX8925=3Dy
> CONFIG_REGULATOR_MAX8952=3Dy
> # CONFIG_REGULATOR_MAX8997 is not set
> # CONFIG_REGULATOR_MAX8998 is not set
> # CONFIG_REGULATOR_MAX77693 is not set
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> # CONFIG_REGULATOR_MC13783 is not set
> CONFIG_REGULATOR_MC13892=3Dy
> # CONFIG_REGULATOR_MT6311 is not set
> # CONFIG_REGULATOR_MT6397 is not set
> CONFIG_REGULATOR_PALMAS=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PV88060=3Dy
> # CONFIG_REGULATOR_PV88080 is not set
> CONFIG_REGULATOR_PV88090=3Dy
> # CONFIG_REGULATOR_PWM is not set
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> # CONFIG_REGULATOR_RT5033 is not set
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_TPS51632 is not set
> CONFIG_REGULATOR_TPS6105X=3Dy
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=3Dy
> CONFIG_REGULATOR_TPS6507X=3Dy
> CONFIG_REGULATOR_TPS65090=3Dy
> # CONFIG_REGULATOR_TPS65217 is not set
> CONFIG_REGULATOR_TPS6586X=3Dy
> # CONFIG_REGULATOR_TPS65912 is not set
> # CONFIG_REGULATOR_TWL4030 is not set
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8350=3Dy
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_RC_SUPPORT=3Dy
> CONFIG_MEDIA_CONTROLLER=3Dy
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> CONFIG_VIDEO_DEV=3Dy
> # CONFIG_VIDEO_V4L2_SUBDEV_API is not set
> CONFIG_VIDEO_V4L2=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> CONFIG_VIDEOBUF2_DMA_SG=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> =

> #
> # Media drivers
> #
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dy
> CONFIG_RC_DECODERS=3Dy
> CONFIG_LIRC=3Dy
> CONFIG_IR_LIRC_CODEC=3Dy
> CONFIG_IR_NEC_DECODER=3Dy
> # CONFIG_IR_RC5_DECODER is not set
> CONFIG_IR_RC6_DECODER=3Dy
> CONFIG_IR_JVC_DECODER=3Dy
> CONFIG_IR_SONY_DECODER=3Dy
> CONFIG_IR_SANYO_DECODER=3Dy
> CONFIG_IR_SHARP_DECODER=3Dy
> CONFIG_IR_MCE_KBD_DECODER=3Dy
> CONFIG_IR_XMP_DECODER=3Dy
> # CONFIG_RC_DEVICES is not set
> CONFIG_MEDIA_USB_SUPPORT=3Dy
> =

> #
> # Webcam devices
> #
> CONFIG_USB_VIDEO_CLASS=3Dy
> CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
> CONFIG_USB_GSPCA=3Dy
> # CONFIG_USB_M5602 is not set
> # CONFIG_USB_STV06XX is not set
> # CONFIG_USB_GL860 is not set
> CONFIG_USB_GSPCA_BENQ=3Dy
> # CONFIG_USB_GSPCA_CONEX is not set
> CONFIG_USB_GSPCA_CPIA1=3Dy
> # CONFIG_USB_GSPCA_DTCS033 is not set
> CONFIG_USB_GSPCA_ETOMS=3Dy
> CONFIG_USB_GSPCA_FINEPIX=3Dy
> CONFIG_USB_GSPCA_JEILINJ=3Dy
> CONFIG_USB_GSPCA_JL2005BCD=3Dy
> CONFIG_USB_GSPCA_KINECT=3Dy
> CONFIG_USB_GSPCA_KONICA=3Dy
> CONFIG_USB_GSPCA_MARS=3Dy
> CONFIG_USB_GSPCA_MR97310A=3Dy
> CONFIG_USB_GSPCA_NW80X=3Dy
> CONFIG_USB_GSPCA_OV519=3Dy
> CONFIG_USB_GSPCA_OV534=3Dy
> CONFIG_USB_GSPCA_OV534_9=3Dy
> # CONFIG_USB_GSPCA_PAC207 is not set
> # CONFIG_USB_GSPCA_PAC7302 is not set
> # CONFIG_USB_GSPCA_PAC7311 is not set
> # CONFIG_USB_GSPCA_SE401 is not set
> CONFIG_USB_GSPCA_SN9C2028=3Dy
> CONFIG_USB_GSPCA_SN9C20X=3Dy
> CONFIG_USB_GSPCA_SONIXB=3Dy
> CONFIG_USB_GSPCA_SONIXJ=3Dy
> # CONFIG_USB_GSPCA_SPCA500 is not set
> CONFIG_USB_GSPCA_SPCA501=3Dy
> # CONFIG_USB_GSPCA_SPCA505 is not set
> CONFIG_USB_GSPCA_SPCA506=3Dy
> CONFIG_USB_GSPCA_SPCA508=3Dy
> CONFIG_USB_GSPCA_SPCA561=3Dy
> CONFIG_USB_GSPCA_SPCA1528=3Dy
> CONFIG_USB_GSPCA_SQ905=3Dy
> # CONFIG_USB_GSPCA_SQ905C is not set
> # CONFIG_USB_GSPCA_SQ930X is not set
> # CONFIG_USB_GSPCA_STK014 is not set
> # CONFIG_USB_GSPCA_STK1135 is not set
> CONFIG_USB_GSPCA_STV0680=3Dy
> CONFIG_USB_GSPCA_SUNPLUS=3Dy
> # CONFIG_USB_GSPCA_T613 is not set
> # CONFIG_USB_GSPCA_TOPRO is not set
> CONFIG_USB_GSPCA_TOUPTEK=3Dy
> # CONFIG_USB_GSPCA_TV8532 is not set
> # CONFIG_USB_GSPCA_VC032X is not set
> # CONFIG_USB_GSPCA_VICAM is not set
> # CONFIG_USB_GSPCA_XIRLINK_CIT is not set
> # CONFIG_USB_GSPCA_ZC3XX is not set
> CONFIG_USB_PWC=3Dy
> # CONFIG_USB_PWC_DEBUG is not set
> CONFIG_USB_PWC_INPUT_EVDEV=3Dy
> # CONFIG_VIDEO_CPIA2 is not set
> # CONFIG_USB_ZR364XX is not set
> # CONFIG_USB_STKWEBCAM is not set
> CONFIG_USB_S2255=3Dy
> =

> #
> # Analog TV USB devices
> #
> # CONFIG_VIDEO_PVRUSB2 is not set
> CONFIG_VIDEO_HDPVR=3Dy
> # CONFIG_VIDEO_USBVISION is not set
> CONFIG_VIDEO_STK1160_COMMON=3Dy
> CONFIG_VIDEO_STK1160=3Dy
> =

> #
> # Analog/digital TV USB devices
> #
> # CONFIG_VIDEO_CX231XX is not set
> # CONFIG_VIDEO_TM6000 is not set
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
> # CONFIG_USB_HACKRF is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_RADIO_ADAPTERS=3Dy
> CONFIG_RADIO_TEA575X=3Dy
> CONFIG_RADIO_SI470X=3Dy
> # CONFIG_USB_SI470X is not set
> # CONFIG_I2C_SI470X is not set
> # CONFIG_RADIO_SI4713 is not set
> # CONFIG_USB_MR800 is not set
> CONFIG_USB_DSBR=3Dy
> CONFIG_RADIO_MAXIRADIO=3Dy
> # CONFIG_RADIO_SHARK is not set
> # CONFIG_RADIO_SHARK2 is not set
> CONFIG_USB_KEENE=3Dy
> # CONFIG_USB_RAREMONO is not set
> CONFIG_USB_MA901=3Dy
> CONFIG_RADIO_TEA5764=3Dy
> # CONFIG_RADIO_TEA5764_XTAL is not set
> CONFIG_RADIO_SAA7706H=3Dy
> CONFIG_RADIO_TEF6862=3Dy
> # CONFIG_RADIO_TIMBERDALE is not set
> # CONFIG_RADIO_WL1273 is not set
> =

> #
> # Texas Instruments WL128x FM driver (ST based)
> #
> CONFIG_V4L_RADIO_ISA_DRIVERS=3Dy
> CONFIG_RADIO_ISA=3Dy
> CONFIG_RADIO_CADET=3Dy
> # CONFIG_RADIO_RTRACK is not set
> CONFIG_RADIO_RTRACK2=3Dy
> CONFIG_RADIO_RTRACK2_PORT=3D30c
> # CONFIG_RADIO_AZTECH is not set
> CONFIG_RADIO_GEMTEK=3Dy
> CONFIG_RADIO_GEMTEK_PORT=3D34c
> # CONFIG_RADIO_GEMTEK_PROBE is not set
> CONFIG_RADIO_SF16FMI=3Dy
> CONFIG_RADIO_SF16FMR2=3Dy
> CONFIG_RADIO_TERRATEC=3Dy
> CONFIG_RADIO_TRUST=3Dy
> CONFIG_RADIO_TRUST_PORT=3D350
> # CONFIG_RADIO_TYPHOON is not set
> # CONFIG_RADIO_ZOLTRIX is not set
> CONFIG_CYPRESS_FIRMWARE=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, frontends)
> #
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> CONFIG_VIDEO_IR_I2C=3Dy
> =

> #
> # Encoders, decoders, sensors and other helper chips
> #
> =

> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> # CONFIG_VIDEO_TDA7432 is not set
> CONFIG_VIDEO_TDA9840=3Dy
> # CONFIG_VIDEO_TEA6415C is not set
> CONFIG_VIDEO_TEA6420=3Dy
> # CONFIG_VIDEO_MSP3400 is not set
> # CONFIG_VIDEO_CS3308 is not set
> CONFIG_VIDEO_CS5345=3Dy
> CONFIG_VIDEO_CS53L32A=3Dy
> CONFIG_VIDEO_TLV320AIC23B=3Dy
> CONFIG_VIDEO_UDA1342=3Dy
> # CONFIG_VIDEO_WM8775 is not set
> # CONFIG_VIDEO_WM8739 is not set
> CONFIG_VIDEO_VP27SMPX=3Dy
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> =

> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=3Dy
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7183 is not set
> CONFIG_VIDEO_BT819=3Dy
> CONFIG_VIDEO_BT856=3Dy
> # CONFIG_VIDEO_BT866 is not set
> CONFIG_VIDEO_KS0127=3Dy
> CONFIG_VIDEO_ML86V7667=3Dy
> # CONFIG_VIDEO_SAA7110 is not set
> CONFIG_VIDEO_SAA711X=3Dy
> CONFIG_VIDEO_TVP514X=3Dy
> # CONFIG_VIDEO_TVP5150 is not set
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
> # CONFIG_VIDEO_SAA7185 is not set
> CONFIG_VIDEO_ADV7170=3Dy
> # CONFIG_VIDEO_ADV7175 is not set
> CONFIG_VIDEO_ADV7343=3Dy
> CONFIG_VIDEO_ADV7393=3Dy
> CONFIG_VIDEO_AK881X=3Dy
> CONFIG_VIDEO_THS8200=3Dy
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_OV2659=3Dy
> CONFIG_VIDEO_OV7640=3Dy
> CONFIG_VIDEO_OV7670=3Dy
> # CONFIG_VIDEO_VS6624 is not set
> CONFIG_VIDEO_MT9V011=3Dy
> # CONFIG_VIDEO_SR030PC30 is not set
> =

> #
> # Flash devices
> #
> # CONFIG_VIDEO_ADP1653 is not set
> CONFIG_VIDEO_AS3645A=3Dy
> CONFIG_VIDEO_LM3560=3Dy
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
> CONFIG_VIDEO_SAA6752HS=3Dy
> =

> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_THS7303=3Dy
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
> # CONFIG_MEDIA_TUNER_TEA5761 is not set
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
> CONFIG_MEDIA_TUNER_MT2063=3Dy
> # CONFIG_MEDIA_TUNER_MT2266 is not set
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> CONFIG_MEDIA_TUNER_QT1010=3Dy
> # CONFIG_MEDIA_TUNER_XC2028 is not set
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> # CONFIG_MEDIA_TUNER_XC4000 is not set
> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> CONFIG_MEDIA_TUNER_MXL5007T=3Dy
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> # CONFIG_MEDIA_TUNER_MAX2165 is not set
> CONFIG_MEDIA_TUNER_TDA18218=3Dy
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> CONFIG_MEDIA_TUNER_FC0012=3Dy
> CONFIG_MEDIA_TUNER_FC0013=3Dy
> # CONFIG_MEDIA_TUNER_TDA18212 is not set
> CONFIG_MEDIA_TUNER_E4000=3Dy
> # CONFIG_MEDIA_TUNER_FC2580 is not set
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
> CONFIG_MEDIA_TUNER_TUA9001=3Dy
> # CONFIG_MEDIA_TUNER_SI2157 is not set
> # CONFIG_MEDIA_TUNER_IT913X is not set
> CONFIG_MEDIA_TUNER_R820T=3Dy
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
> =

> #
> # Customise DVB Frontends
> #
> CONFIG_DVB_AU8522=3Dy
> CONFIG_DVB_AU8522_V4L=3Dy
> CONFIG_DVB_TUNER_DIB0070=3Dy
> CONFIG_DVB_TUNER_DIB0090=3Dy
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dy
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_ALI=3Dy
> CONFIG_AGP_ATI=3Dy
> CONFIG_AGP_AMD=3Dy
> CONFIG_AGP_AMD64=3Dy
> CONFIG_AGP_INTEL=3Dy
> CONFIG_AGP_NVIDIA=3Dy
> CONFIG_AGP_SIS=3Dy
> CONFIG_AGP_SWORKS=3Dy
> CONFIG_AGP_VIA=3Dy
> # CONFIG_AGP_EFFICEON is not set
> CONFIG_INTEL_GTT=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dy
> CONFIG_DRM_MIPI_DSI=3Dy
> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_ADV7511=3Dy
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> # CONFIG_DRM_TDFX is not set
> CONFIG_DRM_R128=3Dy
> CONFIG_DRM_RADEON=3Dy
> # CONFIG_DRM_RADEON_USERPTR is not set
> # CONFIG_DRM_AMDGPU is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_AMD_ACP is not set
> CONFIG_DRM_NOUVEAU=3Dy
> CONFIG_NOUVEAU_DEBUG=3D5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
> CONFIG_DRM_I915=3Dy
> # CONFIG_DRM_I915_PRELIMINARY_HW_SUPPORT is not set
> # CONFIG_DRM_I915_USERPTR is not set
> # CONFIG_DRM_MGA is not set
> CONFIG_DRM_SIS=3Dy
> CONFIG_DRM_VIA=3Dy
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_VGEM=3Dy
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dy
> # CONFIG_DRM_GMA600 is not set
> CONFIG_DRM_GMA3600=3Dy
> CONFIG_DRM_UDL=3Dy
> CONFIG_DRM_AST=3Dy
> # CONFIG_DRM_MGAG200 is not set
> CONFIG_DRM_CIRRUS_QEMU=3Dy
> CONFIG_DRM_QXL=3Dy
> # CONFIG_DRM_BOCHS is not set
> CONFIG_DRM_VIRTIO_GPU=3Dy
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
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
> CONFIG_FB_BOTH_ENDIAN=3Dy
> # CONFIG_FB_BIG_ENDIAN is not set
> # CONFIG_FB_LITTLE_ENDIAN is not set
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
> # CONFIG_FB_CIRRUS is not set
> CONFIG_FB_PM2=3Dy
> CONFIG_FB_PM2_FIFO_DISCONNECT=3Dy
> CONFIG_FB_CYBER2000=3Dy
> # CONFIG_FB_CYBER2000_DDC is not set
> # CONFIG_FB_ARC is not set
> CONFIG_FB_ASILIANT=3Dy
> CONFIG_FB_IMSTT=3Dy
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> # CONFIG_FB_S1D13XXX is not set
> CONFIG_FB_NVIDIA=3Dy
> CONFIG_FB_NVIDIA_I2C=3Dy
> # CONFIG_FB_NVIDIA_DEBUG is not set
> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> CONFIG_FB_RIVA=3Dy
> CONFIG_FB_RIVA_I2C=3Dy
> # CONFIG_FB_RIVA_DEBUG is not set
> # CONFIG_FB_RIVA_BACKLIGHT is not set
> CONFIG_FB_I740=3Dy
> # CONFIG_FB_I810 is not set
> CONFIG_FB_LE80578=3Dy
> CONFIG_FB_CARILLO_RANCH=3Dy
> CONFIG_FB_MATROX=3Dy
> # CONFIG_FB_MATROX_MILLENIUM is not set
> CONFIG_FB_MATROX_MYSTIQUE=3Dy
> # CONFIG_FB_MATROX_G is not set
> # CONFIG_FB_MATROX_I2C is not set
> # CONFIG_FB_RADEON is not set
> CONFIG_FB_ATY128=3Dy
> # CONFIG_FB_ATY128_BACKLIGHT is not set
> # CONFIG_FB_ATY is not set
> CONFIG_FB_S3=3Dy
> # CONFIG_FB_S3_DDC is not set
> CONFIG_FB_SAVAGE=3Dy
> CONFIG_FB_SAVAGE_I2C=3Dy
> # CONFIG_FB_SAVAGE_ACCEL is not set
> CONFIG_FB_SIS=3Dy
> CONFIG_FB_SIS_300=3Dy
> # CONFIG_FB_SIS_315 is not set
> CONFIG_FB_VIA=3Dy
> CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
> # CONFIG_FB_VIA_X_COMPATIBILITY is not set
> # CONFIG_FB_NEOMAGIC is not set
> CONFIG_FB_KYRO=3Dy
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> CONFIG_FB_VT8623=3Dy
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> CONFIG_FB_PM3=3Dy
> CONFIG_FB_CARMINE=3Dy
> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> # CONFIG_FB_GEODE is not set
> CONFIG_FB_SMSCUFX=3Dy
> CONFIG_FB_UDL=3Dy
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_FB_METRONOME=3Dy
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> CONFIG_FB_MB862XX_I2C=3Dy
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_AUO_K190X=3Dy
> # CONFIG_FB_AUO_K1900 is not set
> CONFIG_FB_AUO_K1901=3Dy
> CONFIG_FB_SIMPLE=3Dy
> CONFIG_FB_SM712=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> # CONFIG_LCD_PLATFORM is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> CONFIG_BACKLIGHT_LM3533=3Dy
> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dy
> CONFIG_BACKLIGHT_PWM=3Dy
> # CONFIG_BACKLIGHT_DA903X is not set
> CONFIG_BACKLIGHT_MAX8925=3Dy
> CONFIG_BACKLIGHT_APPLE=3Dy
> # CONFIG_BACKLIGHT_PM8941_WLED is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_WM831X=3Dy
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_AAT2870=3Dy
> CONFIG_BACKLIGHT_LM3630A=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> # CONFIG_BACKLIGHT_LP855X is not set
> # CONFIG_BACKLIGHT_PANDORA is not set
> CONFIG_BACKLIGHT_SKY81452=3Dy
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_AS3711=3Dy
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dy
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dy
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dy
> # CONFIG_HID_APPLEIR is not set
> # CONFIG_HID_ASUS is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_CHICONY=3Dy
> # CONFIG_HID_CORSAIR is not set
> # CONFIG_HID_CMEDIA is not set
> CONFIG_HID_CP2112=3Dy
> CONFIG_HID_CYPRESS=3Dy
> # CONFIG_HID_DRAGONRISE is not set
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_ELO=3Dy
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dy
> CONFIG_HID_HOLTEK=3Dy
> CONFIG_HOLTEK_FF=3Dy
> # CONFIG_HID_GT683R is not set
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> CONFIG_HID_UCLOGIC=3Dy
> # CONFIG_HID_WALTOP is not set
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LENOVO=3Dy
> CONFIG_HID_LOGITECH=3Dy
> CONFIG_HID_LOGITECH_DJ=3Dy
> CONFIG_HID_LOGITECH_HIDPP=3Dy
> CONFIG_LOGITECH_FF=3Dy
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> CONFIG_LOGIG940_FF=3Dy
> # CONFIG_LOGIWHEELS_FF is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_NTRIG=3Dy
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> CONFIG_HID_PENMOUNT=3Dy
> CONFIG_HID_PETALYNX=3Dy
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_ROCCAT=3Dy
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SONY=3Dy
> # CONFIG_SONY_FF is not set
> # CONFIG_HID_SPEEDLINK is not set
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dy
> # CONFIG_HID_GREENASIA is not set
> CONFIG_HID_SMARTJOYPLUS=3Dy
> CONFIG_SMARTJOYPLUS_FF=3Dy
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> # CONFIG_HID_THRUSTMASTER is not set
> # CONFIG_HID_WACOM is not set
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dy
> CONFIG_HID_ZEROPLUS=3Dy
> # CONFIG_ZEROPLUS_FF is not set
> # CONFIG_HID_ZYDACRON is not set
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> CONFIG_HID_PID=3Dy
> # CONFIG_USB_HIDDEV is not set
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dy
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> CONFIG_USB_DYNAMIC_MINORS=3Dy
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_WHITELIST is not set
> CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
> CONFIG_USB_ULPI_BUS=3Dy
> CONFIG_USB_MON=3Dy
> CONFIG_USB_WUSB=3Dy
> CONFIG_USB_WUSB_CBAF=3Dy
> # CONFIG_USB_WUSB_CBAF_DEBUG is not set
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> CONFIG_USB_XHCI_HCD=3Dy
> CONFIG_USB_XHCI_PCI=3Dy
> CONFIG_USB_XHCI_PLATFORM=3Dy
> # CONFIG_USB_EHCI_HCD is not set
> CONFIG_USB_OXU210HP_HCD=3Dy
> # CONFIG_USB_ISP116X_HCD is not set
> CONFIG_USB_ISP1362_HCD=3Dy
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_OHCI_HCD is not set
> CONFIG_USB_UHCI_HCD=3Dy
> CONFIG_USB_U132_HCD=3Dy
> CONFIG_USB_SL811_HCD=3Dy
> # CONFIG_USB_SL811_HCD_ISO is not set
> CONFIG_USB_SL811_CS=3Dy
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_WHCI_HCD is not set
> CONFIG_USB_HWA_HCD=3Dy
> CONFIG_USB_HCD_BCMA=3Dy
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dy
> CONFIG_USB_PRINTER=3Dy
> # CONFIG_USB_WDM is not set
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
> # CONFIG_USB_MUSB_HOST is not set
> # CONFIG_USB_MUSB_GADGET is not set
> CONFIG_USB_MUSB_DUAL_ROLE=3Dy
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
> # CONFIG_USB_DWC3_ULPI is not set
> # CONFIG_USB_DWC3_HOST is not set
> # CONFIG_USB_DWC3_GADGET is not set
> CONFIG_USB_DWC3_DUAL_ROLE=3Dy
> =

> #
> # Platform Glue Driver Support
> #
> # CONFIG_USB_DWC3_PCI is not set
> CONFIG_USB_DWC2=3Dy
> # CONFIG_USB_DWC2_HOST is not set
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> CONFIG_USB_DWC2_PERIPHERAL=3Dy
> # CONFIG_USB_DWC2_DUAL_ROLE is not set
> CONFIG_USB_DWC2_PCI=3Dy
> CONFIG_USB_DWC2_DEBUG=3Dy
> CONFIG_USB_DWC2_VERBOSE=3Dy
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> CONFIG_USB_DWC2_DEBUG_PERIODIC=3Dy
> # CONFIG_USB_CHIPIDEA is not set
> CONFIG_USB_ISP1760=3Dy
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1761_UDC=3Dy
> # CONFIG_USB_ISP1760_HOST_ROLE is not set
> # CONFIG_USB_ISP1760_GADGET_ROLE is not set
> CONFIG_USB_ISP1760_DUAL_ROLE=3Dy
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
> CONFIG_USB_ADUTUX=3Dy
> CONFIG_USB_SEVSEG=3Dy
> CONFIG_USB_RIO500=3Dy
> CONFIG_USB_LEGOTOWER=3Dy
> CONFIG_USB_LCD=3Dy
> CONFIG_USB_LED=3Dy
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> CONFIG_USB_CYTHERM=3Dy
> CONFIG_USB_IDMOUSE=3Dy
> CONFIG_USB_FTDI_ELAN=3Dy
> CONFIG_USB_APPLEDISPLAY=3Dy
> # CONFIG_USB_SISUSBVGA is not set
> CONFIG_USB_LD=3Dy
> # CONFIG_USB_TRANCEVIBRATOR is not set
> CONFIG_USB_IOWARRIOR=3Dy
> CONFIG_USB_TEST=3Dy
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> CONFIG_USB_ISIGHTFW=3Dy
> # CONFIG_USB_YUREX is not set
> CONFIG_USB_EZUSB_FX2=3Dy
> CONFIG_USB_HSIC_USB3503=3Dy
> # CONFIG_USB_LINK_LAYER_TEST is not set
> CONFIG_USB_CHAOSKEY=3Dy
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> CONFIG_USB_GPIO_VBUS=3Dy
> CONFIG_TAHVO_USB=3Dy
> CONFIG_TAHVO_USB_HOST_BY_DEFAULT=3Dy
> # CONFIG_USB_ISP1301 is not set
> CONFIG_USB_GADGET=3Dy
> CONFIG_USB_GADGET_DEBUG=3Dy
> # CONFIG_USB_GADGET_VERBOSE is not set
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> # CONFIG_USB_GADGET_DEBUG_FS is not set
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> =

> #
> # USB Peripheral Controller
> #
> CONFIG_USB_FUSB300=3Dy
> # CONFIG_USB_FOTG210_UDC is not set
> # CONFIG_USB_GR_UDC is not set
> CONFIG_USB_R8A66597=3Dy
> CONFIG_USB_PXA27X=3Dy
> CONFIG_USB_MV_UDC=3Dy
> CONFIG_USB_MV_U3D=3Dy
> # CONFIG_USB_M66592 is not set
> CONFIG_USB_BDC_UDC=3Dy
> =

> #
> # Platform Support
> #
> # CONFIG_USB_BDC_PCI is not set
> # CONFIG_USB_AMD5536UDC is not set
> CONFIG_USB_NET2272=3Dy
> # CONFIG_USB_NET2272_DMA is not set
> # CONFIG_USB_NET2280 is not set
> CONFIG_USB_GOKU=3Dy
> # CONFIG_USB_EG20T is not set
> CONFIG_USB_DUMMY_HCD=3Dy
> CONFIG_USB_LIBCOMPOSITE=3Dy
> CONFIG_USB_F_ACM=3Dy
> CONFIG_USB_U_SERIAL=3Dy
> CONFIG_USB_F_OBEX=3Dy
> CONFIG_USB_F_FS=3Dy
> CONFIG_USB_F_PRINTER=3Dy
> CONFIG_USB_CONFIGFS=3Dy
> # CONFIG_USB_CONFIGFS_SERIAL is not set
> CONFIG_USB_CONFIGFS_ACM=3Dy
> CONFIG_USB_CONFIGFS_OBEX=3Dy
> # CONFIG_USB_CONFIGFS_NCM is not set
> # CONFIG_USB_CONFIGFS_ECM is not set
> # CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
> # CONFIG_USB_CONFIGFS_RNDIS is not set
> # CONFIG_USB_CONFIGFS_EEM is not set
> # CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
> # CONFIG_USB_CONFIGFS_F_LB_SS is not set
> CONFIG_USB_CONFIGFS_F_FS=3Dy
> # CONFIG_USB_CONFIGFS_F_HID is not set
> # CONFIG_USB_CONFIGFS_F_UVC is not set
> CONFIG_USB_CONFIGFS_F_PRINTER=3Dy
> # CONFIG_USB_ZERO is not set
> # CONFIG_USB_ETH is not set
> # CONFIG_USB_G_NCM is not set
> # CONFIG_USB_GADGETFS is not set
> # CONFIG_USB_FUNCTIONFS is not set
> # CONFIG_USB_MASS_STORAGE is not set
> # CONFIG_USB_G_SERIAL is not set
> # CONFIG_USB_G_PRINTER is not set
> # CONFIG_USB_CDC_COMPOSITE is not set
> # CONFIG_USB_G_ACM_MS is not set
> # CONFIG_USB_G_MULTI is not set
> # CONFIG_USB_G_HID is not set
> # CONFIG_USB_G_DBGP is not set
> # CONFIG_USB_G_WEBCAM is not set
> # CONFIG_USB_LED_TRIG is not set
> CONFIG_UWB=3Dy
> CONFIG_UWB_HWA=3Dy
> CONFIG_UWB_WHCI=3Dy
> CONFIG_UWB_I1480U=3Dy
> CONFIG_MMC=3Dy
> CONFIG_MMC_DEBUG=3Dy
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_MMC_BLOCK_BOUNCE=3Dy
> # CONFIG_SDIO_UART is not set
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_SDHCI is not set
> CONFIG_MMC_WBSD=3Dy
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_SDRICOH_CS=3Dy
> CONFIG_MMC_CB710=3Dy
> CONFIG_MMC_VIA_SDMMC=3Dy
> # CONFIG_MMC_VUB300 is not set
> CONFIG_MMC_USHC=3Dy
> # CONFIG_MMC_USDHI6ROL0 is not set
> # CONFIG_MMC_REALTEK_PCI is not set
> CONFIG_MMC_REALTEK_USB=3Dy
> CONFIG_MMC_TOSHIBA_PCI=3Dy
> # CONFIG_MMC_MTK is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3533 is not set
> CONFIG_LEDS_LM3642=3Dy
> CONFIG_LEDS_NET48XX=3Dy
> # CONFIG_LEDS_WRAP is not set
> CONFIG_LEDS_PCA9532=3Dy
> CONFIG_LEDS_PCA9532_GPIO=3Dy
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> # CONFIG_LEDS_LP5523 is not set
> # CONFIG_LEDS_LP5562 is not set
> # CONFIG_LEDS_LP8501 is not set
> CONFIG_LEDS_LP8860=3Dy
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA963X=3Dy
> CONFIG_LEDS_WM831X_STATUS=3Dy
> # CONFIG_LEDS_WM8350 is not set
> # CONFIG_LEDS_DA903X is not set
> CONFIG_LEDS_PWM=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dy
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_MC13783=3Dy
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=3Dy
> # CONFIG_LEDS_MAX8997 is not set
> CONFIG_LEDS_LM355x=3Dy
> # CONFIG_LEDS_OT200 is not set
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> # CONFIG_LEDS_TRIGGER_CPU is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
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
> # CONFIG_PCH_DMA is not set
> CONFIG_TIMB_DMA=3Dy
> # CONFIG_QCOM_HIDMA_MGMT is not set
> CONFIG_QCOM_HIDMA=3Dy
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> CONFIG_DW_DMAC_PCI=3Dy
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dy
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_UIO is not set
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> # CONFIG_VIRTIO_BALLOON is not set
> CONFIG_VIRTIO_INPUT=3Dy
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACER_WMI=3Dy
> CONFIG_ACERHDF=3Dy
> # CONFIG_ALIENWARE_WMI is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_DELL_SMBIOS is not set
> CONFIG_DELL_WMI_AIO=3Dy
> CONFIG_DELL_SMO8800=3Dy
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> CONFIG_TC1100_WMI=3Dy
> CONFIG_HP_ACCEL=3Dy
> CONFIG_HP_WIRELESS=3Dy
> CONFIG_HP_WMI=3Dy
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> CONFIG_SENSORS_HDAPS=3Dy
> CONFIG_ASUS_WIRELESS=3Dy
> CONFIG_ACPI_WMI=3Dy
> CONFIG_MSI_WMI=3Dy
> # CONFIG_TOPSTAR_LAPTOP is not set
> CONFIG_ACPI_TOSHIBA=3Dy
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> CONFIG_ACPI_CMPC=3Dy
> # CONFIG_INTEL_HID_EVENT is not set
> CONFIG_INTEL_IPS=3Dy
> CONFIG_IBM_RTL=3Dy
> CONFIG_SAMSUNG_LAPTOP=3Dy
> CONFIG_MXM_WMI=3Dy
> CONFIG_SAMSUNG_Q10=3Dy
> CONFIG_APPLE_GMUX=3Dy
> # CONFIG_INTEL_RST is not set
> CONFIG_INTEL_SMARTCONNECT=3Dy
> # CONFIG_PVPANIC is not set
> CONFIG_INTEL_PMC_IPC=3Dy
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_PSTORE is not set
> # CONFIG_CROS_EC_CHARDEV is not set
> CONFIG_CROS_EC_LPC=3Dy
> CONFIG_CROS_EC_PROTO=3Dy
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
> CONFIG_CLK_TWL6040=3Dy
> # CONFIG_COMMON_CLK_NXP is not set
> CONFIG_COMMON_CLK_PALMAS=3Dy
> CONFIG_COMMON_CLK_PWM=3Dy
> # CONFIG_COMMON_CLK_PXA is not set
> # CONFIG_COMMON_CLK_PIC32 is not set
> # CONFIG_COMMON_CLK_OXNAS is not set
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
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> CONFIG_MAILBOX=3Dy
> CONFIG_PCC=3Dy
> CONFIG_ALTERA_MBOX=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
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
> CONFIG_SOC_TI=3Dy
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> =

> #
> # DEVFREQ Drivers
> #
> # CONFIG_PM_DEVFREQ_EVENT is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_GPIO is not set
> # CONFIG_EXTCON_MAX3355 is not set
> CONFIG_EXTCON_MAX77693=3Dy
> # CONFIG_EXTCON_MAX8997 is not set
> # CONFIG_EXTCON_PALMAS is not set
> # CONFIG_EXTCON_RT8973A is not set
> CONFIG_EXTCON_SM5502=3Dy
> CONFIG_EXTCON_USB_GPIO=3Dy
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dy
> CONFIG_NTB_PINGPONG=3Dy
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> # CONFIG_NTB_TRANSPORT is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_LPSS=3Dy
> CONFIG_PWM_LPSS_PCI=3Dy
> CONFIG_PWM_LPSS_PLATFORM=3Dy
> # CONFIG_PWM_PCA9685 is not set
> CONFIG_PWM_TWL=3Dy
> # CONFIG_PWM_TWL_LED is not set
> CONFIG_ARM_GIC_MAX_NR=3D1
> CONFIG_IPACK_BUS=3Dy
> CONFIG_BOARD_TPCI200=3Dy
> CONFIG_SERIAL_IPOCTAL=3Dy
> # CONFIG_RESET_CONTROLLER is not set
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> # CONFIG_FMC_TRIVIAL is not set
> CONFIG_FMC_WRITE_EEPROM=3Dy
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> CONFIG_PHY_SAMSUNG_USB2=3Dy
> # CONFIG_PHY_EXYNOS4210_USB2 is not set
> # CONFIG_PHY_EXYNOS4X12_USB2 is not set
> # CONFIG_PHY_EXYNOS5250_USB2 is not set
> # CONFIG_PHY_TUSB1210 is not set
> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL=3Dy
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
> CONFIG_ANDROID=3Dy
> # CONFIG_ANDROID_BINDER_IPC is not set
> CONFIG_NVMEM=3Dy
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dy
> CONFIG_INTEL_TH_PCI=3Dy
> CONFIG_INTEL_TH_GTH=3Dy
> CONFIG_INTEL_TH_MSU=3Dy
> CONFIG_INTEL_TH_PTI=3Dy
> CONFIG_INTEL_TH_DEBUG=3Dy
> =

> #
> # FPGA Configuration Support
> #
> # CONFIG_FPGA is not set
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dy
> CONFIG_DCDBAS=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
> #
> CONFIG_UEFI_CPER=3Dy
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_EXT2_FS=3Dy
> # CONFIG_EXT2_FS_XATTR is not set
> CONFIG_EXT3_FS=3Dy
> CONFIG_EXT3_FS_POSIX_ACL=3Dy
> # CONFIG_EXT3_FS_SECURITY is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_ENCRYPTION is not set
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> CONFIG_REISERFS_CHECK=3Dy
> CONFIG_REISERFS_PROC_INFO=3Dy
> CONFIG_REISERFS_FS_XATTR=3Dy
> CONFIG_REISERFS_FS_POSIX_ACL=3Dy
> # CONFIG_REISERFS_FS_SECURITY is not set
> CONFIG_JFS_FS=3Dy
> CONFIG_JFS_POSIX_ACL=3Dy
> CONFIG_JFS_SECURITY=3Dy
> # CONFIG_JFS_DEBUG is not set
> CONFIG_JFS_STATISTICS=3Dy
> # CONFIG_OCFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> CONFIG_NILFS2_FS=3Dy
> CONFIG_F2FS_FS=3Dy
> # CONFIG_F2FS_STAT_FS is not set
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> # CONFIG_F2FS_FS_SECURITY is not set
> CONFIG_F2FS_CHECK_FS=3Dy
> # CONFIG_F2FS_FS_ENCRYPTION is not set
> CONFIG_F2FS_IO_TRACE=3Dy
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> # CONFIG_FS_ENCRYPTION is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTACTL is not set
> CONFIG_AUTOFS4_FS=3Dy
> # CONFIG_FUSE_FS is not set
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> CONFIG_FSCACHE_STATS=3Dy
> CONFIG_FSCACHE_HISTOGRAM=3Dy
> CONFIG_FSCACHE_DEBUG=3Dy
> CONFIG_FSCACHE_OBJECT_LIST=3Dy
> CONFIG_CACHEFILES=3Dy
> # CONFIG_CACHEFILES_DEBUG is not set
> CONFIG_CACHEFILES_HISTOGRAM=3Dy
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> CONFIG_JOLIET=3Dy
> # CONFIG_ZISOFS is not set
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
> CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_NTFS_FS=3Dy
> CONFIG_NTFS_DEBUG=3Dy
> # CONFIG_NTFS_RW is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> # CONFIG_PROC_SYSCTL is not set
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ADFS_FS=3Dy
> CONFIG_ADFS_FS_RW=3Dy
> # CONFIG_AFFS_FS is not set
> CONFIG_HFS_FS=3Dy
> # CONFIG_HFSPLUS_FS is not set
> CONFIG_BEFS_FS=3Dy
> # CONFIG_BEFS_DEBUG is not set
> CONFIG_BFS_FS=3Dy
> CONFIG_EFS_FS=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> # CONFIG_JFFS2_SUMMARY is not set
> # CONFIG_JFFS2_FS_XATTR is not set
> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> # CONFIG_JFFS2_ZLIB is not set
> CONFIG_JFFS2_LZO=3Dy
> # CONFIG_JFFS2_RTIME is not set
> CONFIG_JFFS2_RUBIN=3Dy
> # CONFIG_JFFS2_CMODE_NONE is not set
> # CONFIG_JFFS2_CMODE_PRIORITY is not set
> CONFIG_JFFS2_CMODE_SIZE=3Dy
> # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
> # CONFIG_UBIFS_FS is not set
> # CONFIG_LOGFS is not set
> # CONFIG_CRAMFS is not set
> CONFIG_SQUASHFS=3Dy
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> CONFIG_SQUASHFS_DECOMP_MULTI=3Dy
> # CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
> # CONFIG_SQUASHFS_XATTR is not set
> # CONFIG_SQUASHFS_ZLIB is not set
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> CONFIG_SQUASHFS_EMBEDDED=3Dy
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> CONFIG_VXFS_FS=3Dy
> CONFIG_MINIX_FS=3Dy
> CONFIG_OMFS_FS=3Dy
> CONFIG_HPFS_FS=3Dy
> CONFIG_QNX4FS_FS=3Dy
> CONFIG_QNX6FS_FS=3Dy
> CONFIG_QNX6FS_DEBUG=3Dy
> CONFIG_ROMFS_FS=3Dy
> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> CONFIG_ROMFS_ON_MTD=3Dy
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_CONSOLE=3Dy
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_FTRACE=3Dy
> # CONFIG_PSTORE_RAM is not set
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> CONFIG_UFS_FS_WRITE=3Dy
> CONFIG_UFS_DEBUG=3Dy
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> # CONFIG_NLS_CODEPAGE_861 is not set
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
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
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> # CONFIG_NLS_ISO8859_1 is not set
> # CONFIG_NLS_ISO8859_2 is not set
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> # CONFIG_NLS_ISO8859_7 is not set
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> # CONFIG_NLS_KOI8_U is not set
> CONFIG_NLS_MAC_ROMAN=3Dy
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dy
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
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
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> CONFIG_READABLE_ASM=3Dy
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> CONFIG_DEBUG_PAGEALLOC=3Dy
> CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
> # CONFIG_PAGE_POISONING_ZERO is not set
> CONFIG_DEBUG_PAGE_REF=3Dy
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> CONFIG_DEBUG_VM_RB=3Dy
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
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
> # CONFIG_DEBUG_TIMEKEEPING is not set
> # CONFIG_TIMER_STATS is not set
> CONFIG_DEBUG_PREEMPT=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> # CONFIG_PROVE_LOCKING is not set
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> # CONFIG_LOCK_TORTURE_TEST is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # CONFIG_DEBUG_LIST is not set
> # CONFIG_DEBUG_PI_LIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> # CONFIG_PROVE_RCU is not set
> CONFIG_SPARSE_RCU_POINTER=3Dy
> # CONFIG_TORTURE_TEST is not set
> # CONFIG_RCU_PERF_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_EQS_DEBUG=3Dy
> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
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
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_PREEMPT_TRACER=3Dy
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_TRACE_BRANCH_PROFILING=3Dy
> # CONFIG_BRANCH_PROFILE_NONE is not set
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_PROFILE_ALL_BRANCHES=3Dy
> # CONFIG_BRANCH_TRACER is not set
> # CONFIG_STACK_TRACER is not set
> CONFIG_BLK_DEV_IO_TRACE=3Dy
> CONFIG_UPROBE_EVENT=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> CONFIG_MMIOTRACE=3Dy
> # CONFIG_HIST_TRIGGERS is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dy
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_TRACE_ENUM_MAP_FILE is not set
> CONFIG_TRACING_EVENTS_GPIO=3Dy
> =

> #
> # Runtime Testing
> #
> # CONFIG_LKDTM is not set
> CONFIG_TEST_LIST_SORT=3Dy
> # CONFIG_BACKTRACE_SELF_TEST is not set
> CONFIG_RBTREE_TEST=3Dy
> CONFIG_ATOMIC64_SELFTEST=3Dy
> CONFIG_ASYNC_RAID6_TEST=3Dy
> CONFIG_TEST_HEXDUMP=3Dy
> # CONFIG_TEST_STRING_HELPERS is not set
> CONFIG_TEST_KSTRTOX=3Dy
> CONFIG_TEST_PRINTF=3Dy
> # CONFIG_TEST_BITMAP is not set
> CONFIG_TEST_RHASHTABLE=3Dy
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
> # CONFIG_UBSAN is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_IO_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_X86_PTDUMP_CORE is not set
> # CONFIG_X86_PTDUMP is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> # CONFIG_IOMMU_STRESS is not set
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
> CONFIG_DEBUG_ENTRY=3Dy
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> =

> #
> # Security options
> #
> # CONFIG_KEYS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> # CONFIG_SECURITY is not set
> CONFIG_SECURITYFS=3Dy
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_XOR_BLOCKS=3Dy
> CONFIG_ASYNC_CORE=3Dy
> CONFIG_ASYNC_MEMCPY=3Dy
> CONFIG_ASYNC_XOR=3Dy
> CONFIG_ASYNC_PQ=3Dy
> CONFIG_ASYNC_RAID6_RECOV=3Dy
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
> # CONFIG_CRYPTO_RSA is not set
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> # CONFIG_CRYPTO_PCRYPT is not set
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> # CONFIG_CRYPTO_AUTHENC is not set
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
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
> CONFIG_CRYPTO_KEYWRAP=3Dy
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
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> CONFIG_CRYPTO_RMD128=3Dy
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> # CONFIG_CRYPTO_TGR192 is not set
> # CONFIG_CRYPTO_WP512 is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> # CONFIG_CRYPTO_ANUBIS is not set
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> # CONFIG_CRYPTO_CAST5 is not set
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_SALSA20_586=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> CONFIG_CRYPTO_TEA=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
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
> # CONFIG_CRYPTO_HW is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_BINARY_PRINTF=3Dy
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
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> # CONFIG_CRC_CCITT is not set
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
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
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_DDR=3Dy
> # CONFIG_IRQ_POLL is not set
> # CONFIG_SG_SPLIT is not set
> # CONFIG_SG_POOL is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy


--===============6432101327479897300==--

