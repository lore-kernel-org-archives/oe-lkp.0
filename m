Content-Type: multipart/mixed; boundary="===============0360884482749400023=="
MIME-Version: 1.0
From: Stafford Horne <shorne@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 73bf5ab339 [ 0.303333] kernel BUG at lib/list_debug.c:28!
Date: Mon, 25 Jun 2018 18:29:25 +0900
Message-ID: <CAAfxs76xt3D4r35VH_S_c_ENmmn9q_RoifrJKp=qHxKMzQ38pg@mail.gmail.com>
In-Reply-To: <9904371f-b026-2de5-2085-464ad9dcadf3@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0360884482749400023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I know I really broke this bad.  I'll send the correct patch soon.

On Mon, Jun 25, 2018, 5:22 PM kernel test robot <chenr.fnst@cn.fujitsu.co=
m>
wrote:

>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
>
> https://github.com/0day-ci/linux/commits/Stafford-Horne/Fix-GCC-Wstringop=
-truncation-warnings/20180623-101155
>
> commit 73bf5ab339195fa8827ceef1cbbebefb017d77ee
> Author:     Stafford Horne <shorne@gmail.com>
> AuthorDate: Sat Jun 23 11:07:53 2018 +0900
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Sat Jun 23 10:11:56 2018 +0800
>
>      kobject: Fix -Wstringop-truncation warning
>
>      When compiling with GCC 9.0.0 I am seeing the following warning:
>
>          In function =E2=80=98fill_kobj_path=E2=80=99,
>              inlined from =E2=80=98kobject_get_path=E2=80=99 at lib/kobje=
ct.c:155:2:
>          lib/kobject.c:128:3: warning: =E2=80=98strncpy=E2=80=99 output t=
runcated before
> terminating nul copying as many bytes from a string as its length
> [-Wstringop-truncation]
>             strncpy(path + length, kobject_name(parent), cur);
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          lib/kobject.c: In function =E2=80=98kobject_get_path=E2=80=99:
>          lib/kobject.c:125:13: note: length computed here
>             int cur =3D strlen(kobject_name(parent));
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>      This is pointing out a bug that the strncpy limit is the source
> string not the
>      destination buffer remaining length.  Fix it.
>
>      Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>      Cc: Arnd Bergmann <arnd@arndb.de>
>      Signed-off-by: Stafford Horne <shorne@gmail.com>
>
> 68f72141a4  crypto: Fix -Wstringop-truncation warnings
> 73bf5ab339  kobject: Fix -Wstringop-truncation warning
>
> +------------------------------------------------+------------+----------=
--+
> |                                                | 68f72141a4 | 73bf5ab339
> |
>
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 406        | 4
> |
> | boot_failures                                  | 8          | 140
> |
> | INFO:rcu_preempt_detected_stalls_on_CPUs/tasks | 5          |
> |
> | RIP:_raw_spin_unlock_irqrestore                | 6          |
> |
> | INFO:rcu_preempt_self-detected_stall_on_CPU    | 3          |
> |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks   | 1          |
> |
> | RIP:kmem_cache_free                            | 1          |
> |
> | RIP:lock_acquire                               | 2          |
> |
> | BUG:kernel_hang_in_test_stage                  | 1          | 1
> |
> | RIP:do_nanosleep                               | 1          |
> |
> | RIP:_raw_spin_unlock_irq                       | 1          |
> |
> | general_protection_fault:#[##]                 | 0          | 15
>  |
> | RIP:strcmp                                     | 0          | 36
>  |
> | Kernel_panic-not_syncing:Fatal_exception       | 0          | 138
> |
> | BUG:unable_to_handle_kernel                    | 0          | 107
> |
> | Oops:#[##]                                     | 0          | 111
> |
> | RIP:torture_shuffle                            | 0          | 1
> |
> | RIP:pci_bus_resource_n                         | 0          | 1
> |
> | RIP:print_IO_APICs                             | 0          | 13
>  |
> | RIP:account_kernel_stack                       | 0          | 36
>  |
> | WARNING:at_drivers/tty/tty_io.c:#tty_init_dev  | 0          | 10
>  |
> | RIP:tty_init_dev                               | 0          | 10
>  |
> | kernel_BUG_at_lib/list_debug.c                 | 0          | 12
>  |
> | invalid_opcode:#[##]                           | 0          | 12
>  |
> | RIP:__list_add_valid                           | 0          | 10
>  |
> | WARNING:at_fs/proc/generic.c:#__proc_create    | 0          | 6
> |
> | RIP:__proc_create                              | 0          | 6
> |
> | RIP:check_preempt_wakeup                       | 0          | 5
> |
> | RIP:ioapic_configure_entry                     | 0          | 2
> |
> | RIP:__acpi_match_device                        | 0          | 1
> |
> | RIP:sched_slice                                | 0          | 4
> |
> | RIP:kobj_lookup                                | 0          | 4
> |
> | RIP:__lock_acquire                             | 0          | 5
> |
> | WARNING:at_lib/kobject.c:#kobject_add_internal | 0          | 1
> |
> | RIP:kobject_add_internal                       | 0          | 1
> |
> | RIP:check_poison_obj                           | 0          | 2
> |
> | RIP:io_apic_base                               | 0          | 2
> |
> | RIP:__fput                                     | 0          | 1
> |
> | RIP:serio_disconnect_port                      | 0          | 1
> |
> | RIP:__unix_find_socket_byname                  | 0          | 2
> |
> | RIP:__list_del_entry_valid                     | 0          | 2
> |
> | RIP:_SHUF_DC00                                 | 0          | 1
> |
> | RIP:__schedule                                 | 0          | 1
> |
>
> +------------------------------------------------+------------+----------=
--+
>
> [    0.295898] Next obj: start=3Dffff8800001e3400, len=3D1024
> [    0.296687] 000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> kkkkkkkkkkkkkkkk
> [    0.298003] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> kkkkkkkkkkkkkkkk
> [    0.299271] list_add corruption. prev->next should be next
> (ffff88000003df00), but was ffff8800001e3060. (prev=3Dffff8800001e3060).
> [    0.300055] ------------[ cut here ]------------
> [    0.303333] kernel BUG at lib/list_debug.c:28!
> [    0.303962] invalid opcode: 0000 [#1] PREEMPT SMP PTI
> [    0.304823] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 4.18.0-rc1-00017-g73bf5ab #1
> [    0.306028] RIP: 0010:__list_add_valid+0x3e/0x62
> [    0.306666] Code: c7 c7 f4 d9 bf 81 e8 a8 7b e6 ff 0f 0b 48 8b 32 48 39
> f0 74 17 48 89 d1 48 c7 c7 6d da bf 81 48 89 f2 48 89 c6 e8 89 7b e6 ff
> <0f> 0b 48 39 fa 74 05 48 39 f8 75 14 48 89 fe 48 89 c1 48 c7 c7 bf
> [    0.306666] RSP: 0000:ffffc9000000bdf8 EFLAGS: 00010292
> [    0.306666] RAX: 0000000000000075 RBX: ffff8800001e3058 RCX:
> ffffc9000000bd88
> [    0.306666] RDX: ffffffff810e1b5d RSI: ffffffff81c32a3c RDI:
> 00000000ffffffff
> [    0.306666] RBP: ffffc9000000bdf8 R08: ffff880000052748 R09:
> 00000000ff59a561
> [    0.306666] R10: ffffc9000000bd78 R11: ffffffff81e44c18 R12:
> ffff88000003df00
> [    0.306666] R13: ffff88000003df58 R14: ffff8800001e3060 R15:
> ffff8800001e3060
> [    0.306666] FS:  0000000000000000(0000) GS:ffff88001f800000(0000)
> knlGS:0000000000000000
> [    0.306666] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.306666] CR2: 0000000000000000 CR3: 0000000001e1e001 CR4:
> 00000000000606b0
> [    0.306666] Call Trace:
> [    0.306666]  kobject_add_internal+0xa2/0x209
> [    0.306666]  kset_register+0x26/0x3f
> [    0.306666]  __class_register+0xdc/0x13f
> [    0.306666]  ? gpiolib_debugfs_init+0x24/0x24
> [    0.306666]  gpiolib_sysfs_init+0x1a/0xa2
> [    0.306666]  do_one_initcall+0x60/0x150
> [    0.306666]  kernel_init_freeable+0x212/0x29a
> [    0.306666]  ? rest_init+0x217/0x217
> [    0.306666]  kernel_init+0x9/0xf0
> [    0.306666]  ret_from_fork+0x24/0x30
> [    0.306666] Modules linked in:
> [    0.306685] ---[ end trace df26394cf1119ce3 ]---
> [    0.307441] RIP: 0010:__list_add_valid+0x3e/0x62
>
>                                                            # HH:MM RESULT
> GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 9cdb0f1c2a3a5cfdc9e7704d4e5bbe240e3281c1
> ce397d215ccd07b8ae3f71db689aedb85d56ab40 --
> git bisect  bad 53aa71fb0ea0c6e9d82051921cc0d87d91a41358  # 00:06  B
> 1     1    1   1  Merge
> 'linux-review/Ricardo-Schwarzmeier/tpm-Return-the-actual-size-when-receiv=
ing-an-unsupported-command/20180622-150847'
> into devel-hourly-2018062314
> git bisect  bad 9dc328ab581389435e1490b22016ea78d393202f  # 00:46  B
> 9     1    9   9  Merge
> 'linux-review/Byungchul-Park/sched-deadline-Add-cpudl_maximum_dl-for-bett=
er-readability/20180618-130745'
> into devel-hourly-2018062314
> git bisect good b42aa3bad3a1915bc1821dd570cf13dd6831018c  # 13:31  G
>  65     0    0   0  Merge
> 'linux-review/Krzysztof-Kozlowski/ARC-dts-Remove-leading-0x-from-node-uni=
t-addresses/20180619-031842'
> into devel-hourly-2018062314
> git bisect  bad e7a0bb3ea9adb1f95a8b20ccd2d56d9a5b8af6c8  # 14:18  B
>  20     1   19  19  Merge 'clk-meson/fixes/drivers' into
> devel-hourly-2018062314
> git bisect  bad 86142d1d7bb4fa59324ad66dff44ac56b8ec8a81  # 14:58  B
>  29     1   28  28  Merge 'm68k/m68k-queue' into devel-hourly-2018062314
> git bisect  bad ba91d090c56df4ada4f457f6bb69c3b1f868e596  # 15:47  B
>  13     1   13  13  Merge
> 'linux-review/Palmer-Dabbelt/RISC-V-Don-t-include-irq-riscv-intc-h/201806=
23-072221'
> into devel-hourly-2018062314
> git bisect  bad 5d62d04305d3834a5a6fe161ff8f7b8879ac50a6  # 16:29  B
>  21     2   21  21  Merge
> 'linux-review/Jia-Ju-Bai/kernel-audit_tree-Fix-a-sleep-in-atomic-context-=
bug/20180621-120034'
> into devel-hourly-2018062314
> git bisect  bad f02c2bad68cc8f1192a7533b53a15a373380458d  # 17:07  B
> 4     1    4   4  Merge
> 'linux-review/Marc-Zyngier/KVM-arm-arm64-Drop-resource-size-check-for-GIC=
V-window/20180622-224820'
> into devel-hourly-2018062314
> git bisect  bad 7a6c13605dfd7d1a58b86fcb83a8cc238b2c2844  # 17:56  B
> 7     1    7   7  Merge
> 'linux-review/Stafford-Horne/Fix-GCC-Wstringop-truncation-warnings/201806=
23-101155'
> into devel-hourly-2018062314
> git bisect good 33a50a4fdd22c74553af5f28d7cc77f77d00afe0  # 19:46  G
> 130     0    2   2  Merge 'pinctrl/devel' into devel-hourly-2018062314
> git bisect  bad 73bf5ab339195fa8827ceef1cbbebefb017d77ee  # 19:58  B
> 0     1   15   0  kobject: Fix -Wstringop-truncation warning
> git bisect good 68f72141a4509e7eb841b0cb35172cb3ce03e7f5  # 21:41  G
> 130     0    4   4  crypto: Fix -Wstringop-truncation warnings
> # first bad commit: [73bf5ab339195fa8827ceef1cbbebefb017d77ee] kobject:
> Fix -Wstringop-truncation warning
> git bisect good 68f72141a4509e7eb841b0cb35172cb3ce03e7f5  # 23:14  G
> 390     0    6  10  crypto: Fix -Wstringop-truncation warnings
> # extra tests with debug options
> git bisect  bad 73bf5ab339195fa8827ceef1cbbebefb017d77ee  # 23:32  B
> 5     1    5   5  kobject: Fix -Wstringop-truncation warning
> # extra tests on HEAD of linux-devel/devel-hourly-2018062314
> git bisect  bad 9cdb0f1c2a3a5cfdc9e7704d4e5bbe240e3281c1  # 23:32  B
> 6    29    0 315  0day head guard for 'devel-hourly-2018062314'
> # extra tests on tree/branch
> linux-review/Stafford-Horne/Fix-GCC-Wstringop-truncation-warnings/2018062=
3-101155
> git bisect  bad 73bf5ab339195fa8827ceef1cbbebefb017d77ee  # 23:33  B
> 4    11    0 123  kobject: Fix -Wstringop-truncation warning
> # extra tests with first bad commit reverted
> git bisect good 19703e8176c364768fee9cca6f2716c862f66ba9  # 12:40  G
> 131     0    6   6  Revert "kobject: Fix -Wstringop-truncation warning"
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/lkp                          Intel
> Corporation
>
>
>
> #!/bin/bash
>
> kernel=3D$1
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu Haswell,+smep,+smap
>         -kernel $kernel
>         -m 512
>         -smp 1
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -watchdog-action debug
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         root=3D/dev/ram0
>         hung_task_panic=3D1
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         net.ifnames=3D0
>         printk.devkmsg=3Don
>         panic=3D-1
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         oops=3Dpanic
>         load_ramdisk=3D2
>         prompt_ramdisk=3D0
>         drbd.minor_count=3D8
>         systemd.log_level=3Derr
>         ignore_loglevel
>         console=3Dtty0
>         earlyprintk=3DttyS0,115200
>         console=3DttyS0,115200
>         vga=3Dnormal
>         rw
>         drbd.minor_count=3D8
>         rcuperf.shutdown=3D0
> )
>
> "${kvm[@]}" -append "${append[*]}"
>
> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.18.0-rc1 Kernel Configuration
> #
>
> #
> # Compiler: gcc-5 (Debian 5.5.0-3) 5.4.1 20171010
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
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
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
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D50401
> CONFIG_CLANG_VERSION=3D0
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
>
> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_USELIB=3Dy
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
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
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
>
> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> # CONFIG_NO_HZ_FULL is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
>
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_CPU_ISOLATION is not set
>
> #
> # RCU Subsystem
> #
> CONFIG_PREEMPT_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_BPF=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> CONFIG_RD_XZ=3Dy
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
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
> CONFIG_FHANDLE=3Dy
> # CONFIG_POSIX_TIMERS is not set
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> CONFIG_PCSPKR_PLATFORM=3Dy
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> # CONFIG_EVENTFD is not set
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_RSEQ=3Dy
> CONFIG_DEBUG_RSEQ=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PC104=3Dy
>
> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_COMPAT_BRK=3Dy
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_OPROFILE=3Dm
> # CONFIG_OPROFILE_EVENT_MULTIPLEX is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
> CONFIG_OPTPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
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
> CONFIG_HAVE_CLK=3Dy
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
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_PLUGIN_HOSTCC=3D"g++"
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # CONFIG_GCC_PLUGINS is not set
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
> CONFIG_VMAP_STACK=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> # CONFIG_REFCOUNT_FULL is not set
>
> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> CONFIG_GCOV_FORMAT_4_7=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> CONFIG_MODULE_COMPRESS_XZ=3Dy
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> CONFIG_FREEZER=3Dy
>
> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> CONFIG_GOLDFISH=3Dy
> # CONFIG_RETPOLINE is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> CONFIG_X86_VSMP=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_DEBUG=3Dy
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_QUEUED_LOCK_STAT=3Dy
> CONFIG_XEN=3Dy
> CONFIG_XEN_PV=3Dy
> CONFIG_XEN_PV_SMP=3Dy
> # CONFIG_XEN_DOM0 is not set
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_PVHVM_SMP=3Dy
> CONFIG_XEN_512GB=3Dy
> CONFIG_XEN_SAVE_RESTORE=3Dy
> # CONFIG_XEN_DEBUG_FS is not set
> CONFIG_XEN_PVH=3Dy
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D12
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> # CONFIG_CPU_SUP_INTEL is not set
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> # CONFIG_DMI is not set
> CONFIG_GART_IOMMU=3Dy
> CONFIG_CALGARY_IOMMU=3Dy
> # CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT is not set
> # CONFIG_MAXSMP is not set
> CONFIG_NR_CPUS_RANGE_BEGIN=3D2
> CONFIG_NR_CPUS_RANGE_END=3D512
> CONFIG_NR_CPUS_DEFAULT=3D64
> CONFIG_NR_CPUS=3D64
> # CONFIG_SCHED_SMT is not set
> CONFIG_SCHED_MC=3Dy
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCELOG_LEGACY is not set
> # CONFIG_X86_MCE_INTEL is not set
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dm
>
> #
> # Performance monitoring
> #
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_I8K=3Dm
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> # CONFIG_X86_5LEVEL is not set
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_AMD_MEM_ENCRYPT=3Dy
> CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_NUMA is not set
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
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> # CONFIG_COMPACTION is not set
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> # CONFIG_HWPOISON_INJECT is not set
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> # CONFIG_CLEANCACHE is not set
> # CONFIG_CMA is not set
> # CONFIG_MEM_SOFT_DIRTY is not set
> CONFIG_ZPOOL=3Dm
> CONFIG_ZBUD=3Dm
> CONFIG_Z3FOLD=3Dm
> CONFIG_ZSMALLOC=3Dy
> CONFIG_PGTABLE_MAPPING=3Dy
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
> # CONFIG_PERCPU_STATS is not set
> CONFIG_GUP_BENCHMARK=3Dy
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> # CONFIG_X86_PAT is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
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
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_COMPAT_VDSO is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>
> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_DEBUGGER=3Dy
> CONFIG_ACPI_DEBUGGER_USER=3Dy
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_LPIT=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> CONFIG_ACPI_EC_DEBUGFS=3Dm
> # CONFIG_ACPI_AC is not set
> CONFIG_ACPI_BATTERY=3Dm
> CONFIG_ACPI_BUTTON=3Dm
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dm
> CONFIG_ACPI_TAD=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> # CONFIG_ACPI_PROCESSOR is not set
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_DEBUG=3Dy
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dy
> CONFIG_ACPI_HED=3Dm
> CONFIG_ACPI_CUSTOM_METHOD=3Dy
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> CONFIG_DPTF_POWER=3Dm
> CONFIG_ACPI_EXTLOG=3Dm
> CONFIG_PMIC_OPREGION=3Dy
> # CONFIG_BXT_WC_PMIC_OPREGION is not set
> CONFIG_CHT_DC_TI_PMIC_OPREGION=3Dy
> CONFIG_ACPI_CONFIGFS=3Dm
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_SFI=3Dy
>
> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
>
> #
> # CPU Idle
> #
> # CONFIG_CPU_IDLE is not set
>
> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_XEN=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIEAER_INJECT=3Dy
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEASPM=3Dy
> # CONFIG_PCIEASPM_DEBUG is not set
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_DPC=3Dy
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> # CONFIG_PCI_PF_STUB is not set
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
>
> #
> # PCI controller drivers
> #
>
> #
> # Cadence PCIe controllers support
> #
> # CONFIG_PCIE_CADENCE_HOST is not set
> # CONFIG_PCIE_CADENCE_EP is not set
> CONFIG_PCI_FTPCI100=3Dy
> # CONFIG_PCI_HOST_GENERIC is not set
>
> #
> # DesignWare PCI Core Support
> #
>
> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
> # CONFIG_PCI_EPF_TEST is not set
>
> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # CONFIG_ISA_BUS is not set
> # CONFIG_ISA_DMA_API is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dm
> CONFIG_PCMCIA=3Dm
> CONFIG_PCMCIA_LOAD_CIS=3Dy
> # CONFIG_CARDBUS is not set
>
> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_PD6729 is not set
> CONFIG_I82092=3Dm
> CONFIG_PCCARD_NONSTATIC=3Dy
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
>
> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dm
> CONFIG_COREDUMP=3Dy
> CONFIG_IA32_EMULATION=3Dy
> CONFIG_IA32_AOUT=3Dm
> # CONFIG_X86_X32 is not set
> CONFIG_COMPAT_32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_NET=3Dy
>
> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_TLS is not set
> CONFIG_XFRM=3Dy
> # CONFIG_XFRM_USER is not set
> # CONFIG_XFRM_SUB_POLICY is not set
> # CONFIG_XFRM_MIGRATE is not set
> # CONFIG_XFRM_STATISTICS is not set
> # CONFIG_NET_KEY is not set
> # CONFIG_XDP_SOCKETS is not set
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
> # CONFIG_NET_NCSI is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_JIT is not set
> # CONFIG_BPF_STREAM_PARSER is not set
> CONFIG_NET_FLOW_LIMIT=3Dy
>
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
>
> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_NET_9P is not set
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
>
> #
> # Device Drivers
> #
>
> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> # CONFIG_STANDALONE is not set
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_TEST_ASYNC_DRIVER_PROBE=3Dm
> CONFIG_SYS_HYPERVISOR=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_SPMI=3Dm
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
>
> #
> # Bus devices
> #
> CONFIG_SIMPLE_PM_BUS=3Dm
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_TESTS=3Dm
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_OF_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dm
>
> #
> # Partition parsers
> #
>
> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_OOPS is not set
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
>
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dm
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> # CONFIG_MTD_CFI_NOSWAP is not set
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_LE_BYTE_SWAP=3Dy
> # CONFIG_MTD_CFI_GEOMETRY is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> CONFIG_MTD_OTP=3Dy
> # CONFIG_MTD_CFI_INTELEXT is not set
> CONFIG_MTD_CFI_AMDSTD=3Dy
> CONFIG_MTD_CFI_STAA=3Dm
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dm
> CONFIG_MTD_ABSENT=3Dy
>
> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dm
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> CONFIG_MTD_PHYSMAP_OF=3Dm
> CONFIG_MTD_PHYSMAP_OF_VERSATILE=3Dy
> # CONFIG_MTD_PHYSMAP_OF_GEMINI is not set
> CONFIG_MTD_AMD76XROM=3Dy
> # CONFIG_MTD_ICHXROM is not set
> CONFIG_MTD_ESB2ROM=3Dm
> # CONFIG_MTD_CK804XROM is not set
> CONFIG_MTD_SCB2_FLASH=3Dy
> CONFIG_MTD_NETtel=3Dm
> # CONFIG_MTD_L440GX is not set
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> # CONFIG_MTD_PLATRAM is not set
>
> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dy
> # CONFIG_MTD_PMC551_BUGFIX is not set
> CONFIG_MTD_PMC551_DEBUG=3Dy
> CONFIG_MTD_SLRAM=3Dy
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
>
> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_ONENAND=3Dy
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> # CONFIG_MTD_ONENAND_GENERIC is not set
> # CONFIG_MTD_ONENAND_OTP is not set
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> # CONFIG_MTD_NAND is not set
>
> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # CONFIG_MTD_SPI_NOR is not set
> CONFIG_MTD_UBI=3Dm
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
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
> CONFIG_PARPORT=3Dm
> CONFIG_PARPORT_PC=3Dm
> # CONFIG_PARPORT_SERIAL is not set
> # CONFIG_PARPORT_PC_FIFO is not set
> CONFIG_PARPORT_PC_SUPERIO=3Dy
> CONFIG_PARPORT_PC_PCMCIA=3Dm
> CONFIG_PARPORT_AX88796=3Dm
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
>
> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
>
> #
> # NVME Support
> #
>
> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> CONFIG_AD525X_DPOT=3Dm
> CONFIG_AD525X_DPOT_I2C=3Dm
> # CONFIG_DUMMY_IRQ is not set
> CONFIG_IBM_ASM=3Dm
> CONFIG_PHANTOM=3Dm
> # CONFIG_SGI_IOC4 is not set
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> CONFIG_ICS932S401=3Dm
> CONFIG_ENCLOSURE_SERVICES=3Dy
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dm
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dm
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dm
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dm
> CONFIG_VMWARE_BALLOON=3Dm
> CONFIG_USB_SWITCH_FSA9480=3Dm
> CONFIG_SRAM=3Dy
> # CONFIG_PCI_ENDPOINT_TEST is not set
> CONFIG_MISC_RTSX=3Dm
> CONFIG_C2PORT=3Dm
> # CONFIG_C2PORT_DURAMAR_2150 is not set
>
> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_LEGACY=3Dm
> # CONFIG_EEPROM_MAX6875 is not set
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_IDT_89HPESX=3Dm
> CONFIG_CB710_CORE=3Dy
> CONFIG_CB710_DEBUG=3Dy
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>
> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # CONFIG_SENSORS_LIS3_I2C is not set
>
> #
> # Altera FPGA firmware download module (requires I2C)
> #
> CONFIG_ALTERA_STAPL=3Dm
> CONFIG_INTEL_MEI=3Dm
> CONFIG_INTEL_MEI_ME=3Dm
> # CONFIG_INTEL_MEI_TXE is not set
> CONFIG_VMWARE_VMCI=3Dy
>
> #
> # Intel MIC & related support
> #
>
> #
> # Intel MIC Bus Driver
> #
> CONFIG_INTEL_MIC_BUS=3Dm
>
> #
> # SCIF Bus Driver
> #
> CONFIG_SCIF_BUS=3Dy
>
> #
> # VOP Bus Driver
> #
> CONFIG_VOP_BUS=3Dm
>
> #
> # Intel MIC Host Driver
> #
>
> #
> # Intel MIC Card Driver
> #
>
> #
> # SCIF Driver
> #
> CONFIG_SCIF=3Dy
>
> #
> # Intel MIC Coprocessor State Management (COSM) Drivers
> #
> # CONFIG_MIC_COSM is not set
>
> #
> # VOP Driver
> #
> CONFIG_VOP=3Dm
> CONFIG_VHOST_RING=3Dm
> CONFIG_GENWQE=3Dy
> CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=3D0
> CONFIG_ECHO=3Dm
> CONFIG_MISC_RTSX_PCI=3Dm
> CONFIG_MISC_RTSX_USB=3Dm
> CONFIG_HAVE_IDE=3Dy
>
> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_FUSION is not set
>
> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=3Dy
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NTB_NETDEV is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
>
> #
> # CAIF transport drivers
> #
>
> #
> # Distributed Switch Architecture drivers
> #
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dm
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_PCMCIA_3C574 is not set
> # CONFIG_PCMCIA_3C589 is not set
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
> # CONFIG_PCMCIA_NMCLAN is not set
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
> # CONFIG_NET_VENDOR_AURORA is not set
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
> CONFIG_NET_CADENCE=3Dy
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
> CONFIG_NET_VENDOR_FUJITSU=3Dy
> # CONFIG_PCMCIA_FMVJ18X is not set
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
> CONFIG_NET_VENDOR_EXAR=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
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
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> CONFIG_NET_VENDOR_NI=3Dy
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_PCMCIA_AXNET is not set
> # CONFIG_NE2K_PCI is not set
> # CONFIG_PCMCIA_PCNET is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_PACKET_ENGINE=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_QLGE is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
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
> # CONFIG_PCMCIA_SMC91C92 is not set
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
> CONFIG_NET_VENDOR_XIRCOM=3Dy
> # CONFIG_PCMCIA_XIRC2PS is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
>
> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_USB_NET_DRIVERS=3Dm
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
> # CONFIG_PCMCIA_RAYCS is not set
>
> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> CONFIG_XEN_NETDEV_FRONTEND=3Dy
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_HYPERV_NET is not set
> # CONFIG_NETDEVSIM is not set
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
>
> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> # CONFIG_INPUT_LEDS is not set
> CONFIG_INPUT_FF_MEMLESS=3Dm
> CONFIG_INPUT_POLLDEV=3Dm
> CONFIG_INPUT_SPARSEKMAP=3Dm
> CONFIG_INPUT_MATRIXKMAP=3Dm
>
> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> CONFIG_INPUT_JOYDEV=3Dm
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
>
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADC=3Dm
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dm
> CONFIG_KEYBOARD_QT2160=3Dm
> CONFIG_KEYBOARD_DLINK_DIR685=3Dm
> CONFIG_KEYBOARD_LKKBD=3Dm
> CONFIG_KEYBOARD_GPIO=3Dm
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> CONFIG_KEYBOARD_TCA8418=3Dm
> CONFIG_KEYBOARD_MATRIX=3Dm
> CONFIG_KEYBOARD_LM8323=3Dm
> CONFIG_KEYBOARD_LM8333=3Dm
> CONFIG_KEYBOARD_MAX7359=3Dm
> CONFIG_KEYBOARD_MCS=3Dm
> # CONFIG_KEYBOARD_MPR121 is not set
> CONFIG_KEYBOARD_NEWTON=3Dm
> # CONFIG_KEYBOARD_OPENCORES is not set
> CONFIG_KEYBOARD_SAMSUNG=3Dm
> CONFIG_KEYBOARD_GOLDFISH_EVENTS=3Dm
> CONFIG_KEYBOARD_STOWAWAY=3Dm
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> CONFIG_KEYBOARD_BCM=3Dm
> CONFIG_INPUT_MOUSE=3Dy
> # CONFIG_MOUSE_PS2 is not set
> CONFIG_MOUSE_SERIAL=3Dm
> CONFIG_MOUSE_APPLETOUCH=3Dm
> CONFIG_MOUSE_BCM5974=3Dm
> CONFIG_MOUSE_CYAPA=3Dm
> # CONFIG_MOUSE_ELAN_I2C is not set
> CONFIG_MOUSE_VSXXXAA=3Dm
> CONFIG_MOUSE_GPIO=3Dm
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> CONFIG_MOUSE_SYNAPTICS_USB=3Dm
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> # CONFIG_JOYSTICK_A3D is not set
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> CONFIG_JOYSTICK_GF2K=3Dm
> # CONFIG_JOYSTICK_GRIP is not set
> CONFIG_JOYSTICK_GRIP_MP=3Dm
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dm
> CONFIG_JOYSTICK_SIDEWINDER=3Dm
> CONFIG_JOYSTICK_TMDC=3Dm
> CONFIG_JOYSTICK_IFORCE=3Dm
> CONFIG_JOYSTICK_IFORCE_USB=3Dy
> CONFIG_JOYSTICK_IFORCE_232=3Dy
> CONFIG_JOYSTICK_WARRIOR=3Dm
> CONFIG_JOYSTICK_MAGELLAN=3Dm
> # CONFIG_JOYSTICK_SPACEORB is not set
> CONFIG_JOYSTICK_SPACEBALL=3Dm
> CONFIG_JOYSTICK_STINGER=3Dm
> CONFIG_JOYSTICK_TWIDJOY=3Dm
> CONFIG_JOYSTICK_ZHENHUA=3Dm
> CONFIG_JOYSTICK_DB9=3Dm
> CONFIG_JOYSTICK_GAMECON=3Dm
> # CONFIG_JOYSTICK_TURBOGRAFX is not set
> CONFIG_JOYSTICK_AS5011=3Dm
> # CONFIG_JOYSTICK_JOYDUMP is not set
> # CONFIG_JOYSTICK_XPAD is not set
> CONFIG_JOYSTICK_WALKERA0701=3Dm
> CONFIG_JOYSTICK_PXRC=3Dm
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> CONFIG_TABLET_USB_GTCO=3Dm
> CONFIG_TABLET_USB_HANWANG=3Dm
> CONFIG_TABLET_USB_KBTAB=3Dm
> # CONFIG_TABLET_USB_PEGASUS is not set
> CONFIG_TABLET_SERIAL_WACOM4=3Dm
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM80X_ONKEY=3Dm
> # CONFIG_INPUT_AD714X is not set
> CONFIG_INPUT_ARIZONA_HAPTICS=3Dm
> CONFIG_INPUT_ATMEL_CAPTOUCH=3Dm
> CONFIG_INPUT_BMA150=3Dm
> CONFIG_INPUT_E3X0_BUTTON=3Dm
> # CONFIG_INPUT_PCSPKR is not set
> CONFIG_INPUT_MAX77693_HAPTIC=3Dm
> CONFIG_INPUT_MC13783_PWRBUTTON=3Dm
> CONFIG_INPUT_MMA8450=3Dm
> # CONFIG_INPUT_APANEL is not set
> CONFIG_INPUT_GP2A=3Dm
> CONFIG_INPUT_GPIO_BEEPER=3Dm
> # CONFIG_INPUT_GPIO_DECODER is not set
> CONFIG_INPUT_ATLAS_BTNS=3Dm
> CONFIG_INPUT_ATI_REMOTE2=3Dm
> CONFIG_INPUT_KEYSPAN_REMOTE=3Dm
> # CONFIG_INPUT_KXTJ9 is not set
> CONFIG_INPUT_POWERMATE=3Dm
> # CONFIG_INPUT_YEALINK is not set
> CONFIG_INPUT_CM109=3Dm
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dm
> CONFIG_INPUT_RETU_PWRBUTTON=3Dm
> # CONFIG_INPUT_TPS65218_PWRBUTTON is not set
> CONFIG_INPUT_UINPUT=3Dm
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_PWM_BEEPER=3Dm
> # CONFIG_INPUT_PWM_VIBRA is not set
> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
> CONFIG_INPUT_DA9063_ONKEY=3Dm
> CONFIG_INPUT_ADXL34X=3Dm
> # CONFIG_INPUT_ADXL34X_I2C is not set
> # CONFIG_INPUT_IMS_PCU is not set
> CONFIG_INPUT_CMA3000=3Dm
> CONFIG_INPUT_CMA3000_I2C=3Dm
> CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dm
> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> CONFIG_INPUT_SOC_BUTTON_ARRAY=3Dm
> CONFIG_INPUT_DRV260X_HAPTICS=3Dm
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> CONFIG_INPUT_DRV2667_HAPTICS=3Dm
> CONFIG_RMI4_CORE=3Dm
> # CONFIG_RMI4_I2C is not set
> # CONFIG_RMI4_SMB is not set
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> # CONFIG_RMI4_F34 is not set
> # CONFIG_RMI4_F54 is not set
> # CONFIG_RMI4_F55 is not set
>
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dm
> CONFIG_SERIO_PARKBD=3Dm
> CONFIG_SERIO_PCIPS2=3Dm
> CONFIG_SERIO_LIBPS2=3Dy
> # CONFIG_SERIO_RAW is not set
> CONFIG_SERIO_ALTERA_PS2=3Dm
> CONFIG_SERIO_PS2MULT=3Dm
> CONFIG_SERIO_ARC_PS2=3Dm
> # CONFIG_SERIO_APBPS2 is not set
> CONFIG_HYPERV_KEYBOARD=3Dm
> CONFIG_SERIO_GPIO_PS2=3Dm
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dm
> CONFIG_GAMEPORT_NS558=3Dm
> CONFIG_GAMEPORT_L4=3Dm
> CONFIG_GAMEPORT_EMU10K1=3Dm
> CONFIG_GAMEPORT_FM801=3Dm
>
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
> # CONFIG_GOLDFISH_TTY is not set
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVKMEM is not set
>
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
> # CONFIG_SERIAL_8250_CS is not set
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_ASPEED_VUART is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_8250_MOXA is not set
> # CONFIG_SERIAL_OF_PLATFORM is not set
>
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
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_PRINTER is not set
> # CONFIG_PPDEV is not set
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> CONFIG_HVC_XEN_FRONTEND=3Dy
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SSIF=3Dm
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dm
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> # CONFIG_HW_RANDOM_VIA is not set
> CONFIG_HW_RANDOM_VIRTIO=3Dm
> CONFIG_NVRAM=3Dm
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
>
> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> CONFIG_CARDMAN_4000=3Dm
> # CONFIG_CARDMAN_4040 is not set
> CONFIG_SCR24X=3Dm
> # CONFIG_IPWIRELESS is not set
> # CONFIG_MWAVE is not set
> CONFIG_HPET=3Dy
> # CONFIG_HPET_MMAP is not set
> # CONFIG_HANGCHECK_TIMER is not set
> CONFIG_TCG_TPM=3Dy
> # CONFIG_HW_RANDOM_TPM is not set
> # CONFIG_TCG_TIS is not set
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> # CONFIG_TCG_TIS_I2C_INFINEON is not set
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> # CONFIG_TCG_NSC is not set
> # CONFIG_TCG_ATMEL is not set
> # CONFIG_TCG_INFINEON is not set
> CONFIG_TCG_XEN=3Dy
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_VTPM_PROXY=3Dy
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> # CONFIG_TELCLOCK is not set
> CONFIG_DEVPORT=3Dy
> CONFIG_XILLYBUS=3Dy
> CONFIG_XILLYBUS_OF=3Dm
>
> #
> # I2C support
> #
> CONFIG_I2C=3Dm
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
>
> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dm
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_GPMUX=3Dm
> # CONFIG_I2C_MUX_LTC4306 is not set
> CONFIG_I2C_MUX_PCA9541=3Dm
> CONFIG_I2C_MUX_PCA954x=3Dm
> CONFIG_I2C_MUX_REG=3Dm
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dm
>
> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dm
> CONFIG_I2C_ALGOPCF=3Dm
> CONFIG_I2C_ALGOPCA=3Dm
>
> #
> # I2C Hardware Bus support
> #
>
> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> CONFIG_I2C_ALI1563=3Dm
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dm
> CONFIG_I2C_AMD756_S4882=3Dm
> CONFIG_I2C_AMD8111=3Dm
> CONFIG_I2C_I801=3Dm
> CONFIG_I2C_ISCH=3Dm
> # CONFIG_I2C_ISMT is not set
> CONFIG_I2C_PIIX4=3Dm
> # CONFIG_I2C_NFORCE2 is not set
> CONFIG_I2C_SIS5595=3Dm
> # CONFIG_I2C_SIS630 is not set
> # CONFIG_I2C_SIS96X is not set
> CONFIG_I2C_VIA=3Dm
> CONFIG_I2C_VIAPRO=3Dm
>
> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dm
>
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dm
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> CONFIG_I2C_DESIGNWARE_PCI=3Dm
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> CONFIG_I2C_KEMPLD=3Dm
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dm
> # CONFIG_I2C_RK3X is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dm
>
> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dm
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_PARPORT_LIGHT is not set
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dm
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> CONFIG_I2C_VIPERBOARD=3Dm
>
> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dm
> CONFIG_I2C_CROS_EC_TUNNEL=3Dm
> CONFIG_I2C_STUB=3Dm
> CONFIG_I2C_SLAVE=3Dy
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dm
> # CONFIG_PPS_DEBUG is not set
>
> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dm
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> # CONFIG_PPS_CLIENT_GPIO is not set
>
> #
> # PPS generators support
> #
>
> #
> # PTP clock support
> #
>
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # CONFIG_PINCTRL is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dm
>
> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_74XX_MMIO is not set
> CONFIG_GPIO_ALTERA=3Dy
> CONFIG_GPIO_AMDPT=3Dm
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_FTGPIO010=3Dy
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_GRGPIO=3Dm
> CONFIG_GPIO_HLWD=3Dy
> CONFIG_GPIO_ICH=3Dm
> CONFIG_GPIO_LYNXPOINT=3Dy
> CONFIG_GPIO_MB86S7X=3Dm
> # CONFIG_GPIO_MENZ127 is not set
> CONFIG_GPIO_MOCKUP=3Dm
> # CONFIG_GPIO_SYSCON is not set
> CONFIG_GPIO_VX855=3Dy
> CONFIG_GPIO_XILINX=3Dy
>
> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_104_DIO_48E is not set
> # CONFIG_GPIO_104_IDIO_16 is not set
> CONFIG_GPIO_104_IDI_48=3Dm
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_GPIO_MM=3Dm
> # CONFIG_GPIO_IT87 is not set
> CONFIG_GPIO_SCH=3Dm
> CONFIG_GPIO_SCH311X=3Dm
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dm
>
> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dm
> # CONFIG_GPIO_ADNP is not set
> CONFIG_GPIO_MAX7300=3Dm
> CONFIG_GPIO_MAX732X=3Dm
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCF857X=3Dm
> # CONFIG_GPIO_TPIC2810 is not set
>
> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_BD9571MWV=3Dm
> # CONFIG_GPIO_JANZ_TTL is not set
> CONFIG_GPIO_KEMPLD=3Dm
> CONFIG_GPIO_LP873X=3Dm
> CONFIG_GPIO_TPS65218=3Dm
> # CONFIG_GPIO_TPS65912 is not set
> CONFIG_GPIO_UCB1400=3Dm
> # CONFIG_GPIO_WHISKEY_COVE is not set
> CONFIG_GPIO_WM8994=3Dm
>
> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dm
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> CONFIG_GPIO_PCIE_IDIO_24=3Dm
> CONFIG_GPIO_RDC321X=3Dy
> CONFIG_GPIO_SODAVILLE=3Dy
>
> #
> # USB GPIO expanders
> #
> CONFIG_GPIO_VIPERBOARD=3Dm
> CONFIG_W1=3Dy
>
> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dm
> CONFIG_W1_MASTER_DS2490=3Dm
> # CONFIG_W1_MASTER_DS2482 is not set
> # CONFIG_W1_MASTER_DS1WM is not set
> # CONFIG_W1_MASTER_GPIO is not set
>
> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dm
> CONFIG_W1_SLAVE_SMEM=3Dy
> # CONFIG_W1_SLAVE_DS2405 is not set
> CONFIG_W1_SLAVE_DS2408=3Dm
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2805=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> # CONFIG_W1_SLAVE_DS2433 is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> CONFIG_W1_SLAVE_DS2760=3Dm
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> CONFIG_W1_SLAVE_DS28E17=3Dm
> CONFIG_POWER_AVS=3Dy
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_GPIO is not set
> # CONFIG_POWER_RESET_GPIO_RESTART is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> CONFIG_POWER_RESET_RESTART=3Dy
> # CONFIG_POWER_RESET_SYSCON is not set
> CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
> CONFIG_REBOOT_MODE=3Dm
> CONFIG_SYSCON_REBOOT_MODE=3Dm
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_GENERIC_ADC_BATTERY is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_ACT8945A=3Dm
> CONFIG_BATTERY_DS2760=3Dm
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dm
> # CONFIG_BATTERY_LEGO_EV3 is not set
> CONFIG_BATTERY_SBS=3Dm
> CONFIG_CHARGER_SBS=3Dm
> CONFIG_MANAGER_SBS=3Dm
> CONFIG_BATTERY_BQ27XXX=3Dy
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> # CONFIG_BATTERY_BQ27XXX_HDQ is not set
> CONFIG_CHARGER_DA9150=3Dm
> CONFIG_BATTERY_DA9150=3Dm
> CONFIG_BATTERY_MAX17040=3Dm
> CONFIG_BATTERY_MAX17042=3Dm
> CONFIG_BATTERY_MAX1721X=3Dy
> # CONFIG_CHARGER_ISP1704 is not set
> CONFIG_CHARGER_MAX8903=3Dm
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_LTC3651=3Dm
> CONFIG_CHARGER_MAX14577=3Dm
> # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> CONFIG_CHARGER_MAX77693=3Dm
> CONFIG_CHARGER_BQ2415X=3Dm
> CONFIG_CHARGER_BQ24190=3Dm
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=3Dm
> CONFIG_CHARGER_BQ25890=3Dm
> # CONFIG_CHARGER_SMB347 is not set
> # CONFIG_CHARGER_TPS65217 is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> CONFIG_BATTERY_GOLDFISH=3Dy
> CONFIG_CHARGER_RT9455=3Dm
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
>
> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dm
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> # CONFIG_SENSORS_ADM1031 is not set
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dm
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_ASC7621=3Dm
> # CONFIG_SENSORS_K8TEMP is not set
> CONFIG_SENSORS_K10TEMP=3Dm
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dm
> # CONFIG_SENSORS_ASB100 is not set
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dm
> # CONFIG_SENSORS_DS620 is not set
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dm
> CONFIG_SENSORS_F71882FG=3Dm
> # CONFIG_SENSORS_F75375S is not set
> CONFIG_SENSORS_MC13783_ADC=3Dm
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_FTSTEUTATES=3Dm
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> CONFIG_SENSORS_G762=3Dm
> CONFIG_SENSORS_GPIO_FAN=3Dm
> CONFIG_SENSORS_HIH6130=3Dm
> CONFIG_SENSORS_IBMAEM=3Dm
> # CONFIG_SENSORS_IBMPEX is not set
> # CONFIG_SENSORS_IIO_HWMON is not set
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dm
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=3Dm
> CONFIG_SENSORS_LINEAGE=3Dm
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2990 is not set
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dm
> CONFIG_SENSORS_LTC4222=3Dm
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dm
> CONFIG_SENSORS_LTC4261=3Dm
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> # CONFIG_SENSORS_MAX6621 is not set
> # CONFIG_SENSORS_MAX6639 is not set
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> CONFIG_SENSORS_MAX31790=3Dm
> CONFIG_SENSORS_MCP3021=3Dm
> CONFIG_SENSORS_TC654=3Dm
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dm
> CONFIG_SENSORS_LM63=3Dm
> # CONFIG_SENSORS_LM73 is not set
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=3Dm
> # CONFIG_SENSORS_LM78 is not set
> # CONFIG_SENSORS_LM80 is not set
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dm
> CONFIG_SENSORS_LM87=3Dm
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> CONFIG_SENSORS_LM95234=3Dm
> # CONFIG_SENSORS_LM95241 is not set
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=3Dy
> CONFIG_SENSORS_NCT7802=3Dm
> CONFIG_SENSORS_NCT7904=3Dm
> CONFIG_SENSORS_PCF8591=3Dm
> CONFIG_PMBUS=3Dm
> # CONFIG_SENSORS_PMBUS is not set
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_IBM_CFFPS=3Dm
> CONFIG_SENSORS_IR35221=3Dm
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> CONFIG_SENSORS_LTC3815=3Dm
> # CONFIG_SENSORS_MAX16064 is not set
> CONFIG_SENSORS_MAX20751=3Dm
> CONFIG_SENSORS_MAX31785=3Dm
> # CONFIG_SENSORS_MAX34440 is not set
> CONFIG_SENSORS_MAX8688=3Dm
> CONFIG_SENSORS_TPS40422=3Dm
> CONFIG_SENSORS_TPS53679=3Dm
> CONFIG_SENSORS_UCD9000=3Dm
> CONFIG_SENSORS_UCD9200=3Dm
> # CONFIG_SENSORS_ZL6100 is not set
> CONFIG_SENSORS_PWM_FAN=3Dm
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHTC1=3Dm
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dm
> # CONFIG_SENSORS_EMC1403 is not set
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dm
> # CONFIG_SENSORS_SMSC47M1 is not set
> CONFIG_SENSORS_SMSC47M192=3Dm
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> # CONFIG_SENSORS_SCH5627 is not set
> CONFIG_SENSORS_SCH5636=3Dy
> CONFIG_SENSORS_STTS751=3Dm
> CONFIG_SENSORS_SMM665=3Dm
> CONFIG_SENSORS_ADC128D818=3Dm
> CONFIG_SENSORS_ADS1015=3Dm
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dm
> # CONFIG_SENSORS_INA2XX is not set
> # CONFIG_SENSORS_INA3221 is not set
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=3Dm
> CONFIG_SENSORS_TMP102=3Dm
> CONFIG_SENSORS_TMP103=3Dm
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dm
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dm
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=3Dm
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dm
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dm
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
>
> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dy
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dm
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_OF=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_EMULATION=3Dy
> # CONFIG_QORIQ_THERMAL is not set
> CONFIG_DA9062_THERMAL=3Dm
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dm
>
> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dm
> CONFIG_ACPI_THERMAL_REL=3Dm
> CONFIG_INT3406_THERMAL=3Dm
> # CONFIG_INTEL_BXT_PMIC_THERMAL is not set
> CONFIG_INTEL_PCH_THERMAL=3Dm
> CONFIG_QCOM_SPMI_TEMP_ALARM=3Dm
> CONFIG_GENERIC_ADC_THERMAL=3Dm
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> # CONFIG_WATCHDOG_SYSFS is not set
>
> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dm
> # CONFIG_DA9062_WATCHDOG is not set
> CONFIG_GPIO_WATCHDOG=3Dm
> CONFIG_MENF21BMC_WATCHDOG=3Dm
> # CONFIG_WDAT_WDT is not set
> CONFIG_XILINX_WATCHDOG=3Dy
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> CONFIG_CADENCE_WATCHDOG=3Dy
> # CONFIG_DW_WATCHDOG is not set
> CONFIG_RN5T618_WATCHDOG=3Dm
> # CONFIG_MAX63XX_WATCHDOG is not set
> CONFIG_RETU_WATCHDOG=3Dm
> CONFIG_ACQUIRE_WDT=3Dy
> CONFIG_ADVANTECH_WDT=3Dy
> CONFIG_ALIM1535_WDT=3Dy
> CONFIG_ALIM7101_WDT=3Dy
> CONFIG_EBC_C384_WDT=3Dy
> CONFIG_F71808E_WDT=3Dy
> CONFIG_SP5100_TCO=3Dy
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> CONFIG_IBMASR=3Dy
> CONFIG_WAFER_WDT=3Dy
> CONFIG_I6300ESB_WDT=3Dy
> # CONFIG_IE6XX_WDT is not set
> CONFIG_ITCO_WDT=3Dm
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> CONFIG_IT8712F_WDT=3Dy
> # CONFIG_IT87_WDT is not set
> CONFIG_HP_WATCHDOG=3Dm
> CONFIG_KEMPLD_WDT=3Dm
> CONFIG_HPWDT_NMI_DECODING=3Dy
> CONFIG_SC1200_WDT=3Dy
> CONFIG_PC87413_WDT=3Dm
> CONFIG_NV_TCO=3Dy
> CONFIG_60XX_WDT=3Dm
> CONFIG_CPU5_WDT=3Dy
> CONFIG_SMSC_SCH311X_WDT=3Dm
> CONFIG_SMSC37B787_WDT=3Dy
> CONFIG_VIA_WDT=3Dy
> CONFIG_W83627HF_WDT=3Dy
> # CONFIG_W83877F_WDT is not set
> CONFIG_W83977F_WDT=3Dy
> # CONFIG_MACHZ_WDT is not set
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> CONFIG_INTEL_MEI_WDT=3Dm
> # CONFIG_NI903X_WDT is not set
> CONFIG_NIC7018_WDT=3Dy
> CONFIG_MEN_A21_WDT=3Dm
> CONFIG_XEN_WDT=3Dy
>
> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> CONFIG_WDTPCI=3Dy
>
> #
> # USB-based Watchdog Cards
> #
> # CONFIG_USBPCWATCHDOG is not set
>
> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> CONFIG_SSB_POSSIBLE=3Dy
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> CONFIG_SSB_SILENT=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> CONFIG_SSB_DRIVER_PCICORE=3Dy
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dm
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
>
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_ACT8945A=3Dm
> CONFIG_MFD_ATMEL_FLEXCOM=3Dy
> CONFIG_MFD_ATMEL_HLCDC=3Dm
> # CONFIG_MFD_BCM590XX is not set
> CONFIG_MFD_BD9571MWV=3Dm
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_CROS_EC=3Dy
> # CONFIG_MFD_CROS_EC_I2C is not set
> CONFIG_MFD_CROS_EC_CHARDEV=3Dy
> CONFIG_MFD_DA9062=3Dm
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dm
> # CONFIG_MFD_DLN2 is not set
> CONFIG_MFD_MC13XXX=3Dm
> CONFIG_MFD_MC13XXX_I2C=3Dm
> # CONFIG_MFD_HI6421_PMIC is not set
> CONFIG_HTC_PASIC3=3Dm
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dm
> CONFIG_INTEL_SOC_PMIC_BXTWC=3Dm
> CONFIG_INTEL_SOC_PMIC_CHTDC_TI=3Dm
> CONFIG_MFD_INTEL_LPSS=3Dm
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dm
> CONFIG_MFD_INTEL_LPSS_PCI=3Dm
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dm
> CONFIG_MFD_88PM800=3Dm
> CONFIG_MFD_88PM805=3Dm
> CONFIG_MFD_MAX14577=3Dm
> # CONFIG_MFD_MAX77686 is not set
> CONFIG_MFD_MAX77693=3Dm
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dm
> CONFIG_MFD_VIPERBOARD=3Dm
> CONFIG_MFD_RETU=3Dm
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_UCB1400_CORE=3Dm
> CONFIG_MFD_RDC321X=3Dy
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RK808 is not set
> CONFIG_MFD_RN5T618=3Dm
> CONFIG_MFD_SI476X_CORE=3Dm
> # CONFIG_MFD_SM501 is not set
> # CONFIG_MFD_SKY81452 is not set
> CONFIG_ABX500_CORE=3Dy
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_TI_LMU=3Dm
> CONFIG_TPS6105X=3Dm
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> CONFIG_MFD_TPS65217=3Dm
> CONFIG_MFD_TI_LP873X=3Dm
> # CONFIG_MFD_TI_LP87565 is not set
> CONFIG_MFD_TPS65218=3Dm
> CONFIG_MFD_TPS65912=3Dm
> CONFIG_MFD_TPS65912_I2C=3Dm
> CONFIG_MFD_WL1273_CORE=3Dm
> # CONFIG_MFD_LM3533 is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dm
> CONFIG_MFD_CS47L24=3Dy
> CONFIG_MFD_WM5102=3Dy
> CONFIG_MFD_WM5110=3Dy
> # CONFIG_MFD_WM8997 is not set
> CONFIG_MFD_WM8998=3Dy
> CONFIG_MFD_WM8994=3Dm
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dm
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=3Dm
> CONFIG_REGULATOR_88PM800=3Dm
> # CONFIG_REGULATOR_ACT8865 is not set
> # CONFIG_REGULATOR_ACT8945A is not set
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_ANATOP=3Dm
> CONFIG_REGULATOR_ARIZONA_LDO1=3Dm
> CONFIG_REGULATOR_ARIZONA_MICSUPP=3Dm
> CONFIG_REGULATOR_BD9571MWV=3Dm
> # CONFIG_REGULATOR_DA9062 is not set
> CONFIG_REGULATOR_DA9210=3Dm
> CONFIG_REGULATOR_DA9211=3Dm
> CONFIG_REGULATOR_FAN53555=3Dm
> CONFIG_REGULATOR_GPIO=3Dm
> # CONFIG_REGULATOR_ISL9305 is not set
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LM363X=3Dm
> CONFIG_REGULATOR_LP3971=3Dm
> CONFIG_REGULATOR_LP3972=3Dm
> CONFIG_REGULATOR_LP872X=3Dm
> CONFIG_REGULATOR_LP873X=3Dm
> CONFIG_REGULATOR_LP8755=3Dm
> # CONFIG_REGULATOR_LTC3589 is not set
> CONFIG_REGULATOR_LTC3676=3Dm
> # CONFIG_REGULATOR_MAX14577 is not set
> CONFIG_REGULATOR_MAX1586=3Dm
> CONFIG_REGULATOR_MAX8649=3Dm
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8952=3Dm
> CONFIG_REGULATOR_MAX8973=3Dm
> CONFIG_REGULATOR_MAX77693=3Dm
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> # CONFIG_REGULATOR_MC13783 is not set
> CONFIG_REGULATOR_MC13892=3Dm
> # CONFIG_REGULATOR_MT6311 is not set
> CONFIG_REGULATOR_PFUZE100=3Dm
> CONFIG_REGULATOR_PV88060=3Dm
> # CONFIG_REGULATOR_PV88080 is not set
> CONFIG_REGULATOR_PV88090=3Dm
> CONFIG_REGULATOR_PWM=3Dm
> CONFIG_REGULATOR_QCOM_SPMI=3Dm
> CONFIG_REGULATOR_RN5T618=3Dm
> # CONFIG_REGULATOR_SY8106A is not set
> CONFIG_REGULATOR_TPS51632=3Dm
> CONFIG_REGULATOR_TPS6105X=3Dm
> # CONFIG_REGULATOR_TPS62360 is not set
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=3Dm
> CONFIG_REGULATOR_TPS65132=3Dm
> CONFIG_REGULATOR_TPS65217=3Dm
> # CONFIG_REGULATOR_TPS65218 is not set
> CONFIG_REGULATOR_TPS65912=3Dm
> # CONFIG_REGULATOR_VCTRL is not set
> CONFIG_REGULATOR_WM8994=3Dm
> CONFIG_CEC_CORE=3Dm
> CONFIG_CEC_NOTIFIER=3Dy
> CONFIG_RC_CORE=3Dm
> # CONFIG_RC_MAP is not set
> # CONFIG_LIRC is not set
> CONFIG_RC_DECODERS=3Dy
> # CONFIG_IR_NEC_DECODER is not set
> CONFIG_IR_RC5_DECODER=3Dm
> CONFIG_IR_RC6_DECODER=3Dm
> CONFIG_IR_JVC_DECODER=3Dm
> CONFIG_IR_SONY_DECODER=3Dm
> CONFIG_IR_SANYO_DECODER=3Dm
> CONFIG_IR_SHARP_DECODER=3Dm
> CONFIG_IR_MCE_KBD_DECODER=3Dm
> # CONFIG_IR_XMP_DECODER is not set
> # CONFIG_IR_IMON_DECODER is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=3Dm
> # CONFIG_IR_HIX5HD2 is not set
> # CONFIG_IR_IMON is not set
> CONFIG_IR_IMON_RAW=3Dm
> # CONFIG_IR_MCEUSB is not set
> # CONFIG_IR_ITE_CIR is not set
> CONFIG_IR_FINTEK=3Dm
> # CONFIG_IR_NUVOTON is not set
> CONFIG_IR_REDRAT3=3Dm
> CONFIG_IR_STREAMZAP=3Dm
> CONFIG_IR_WINBOND_CIR=3Dm
> CONFIG_IR_IGORPLUGUSB=3Dm
> CONFIG_IR_IGUANA=3Dm
> CONFIG_IR_TTUSBIR=3Dm
> CONFIG_RC_LOOPBACK=3Dm
> CONFIG_IR_GPIO_CIR=3Dm
> # CONFIG_IR_SERIAL is not set
> # CONFIG_IR_SIR is not set
> CONFIG_MEDIA_SUPPORT=3Dm
>
> #
> # Multimedia core support
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> # CONFIG_MEDIA_CEC_RC is not set
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_VIDEO_DEV=3Dm
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> CONFIG_VIDEO_V4L2=3Dm
> # CONFIG_VIDEO_ADV_DEBUG is not set
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> # CONFIG_V4L2_FLASH_LED_CLASS is not set
>
> #
> # Media drivers
> #
> # CONFIG_MEDIA_USB_SUPPORT is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_CEC_PLATFORM_DRIVERS is not set
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
>
> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_CYPRESS_FIRMWARE=3Dm
>
> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
>
> #
> # Audio decoders, processors and mixers
> #
>
> #
> # RDS decoders
> #
>
> #
> # Video decoders
> #
>
> #
> # Video and audio decoders
> #
>
> #
> # Video encoders
> #
>
> #
> # Camera sensor devices
> #
>
> #
> # Flash devices
> #
>
> #
> # Video improvement chips
> #
>
> #
> # Audio/Video compression chips
> #
>
> #
> # SDR tuner chips
> #
>
> #
> # Miscellaneous helper chips
> #
>
> #
> # Sensors used on soc_camera driver
> #
> CONFIG_MEDIA_TUNER=3Dm
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dm
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
>
> #
> # Tools to develop new frontends
> #
>
> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_INTEL_GTT=3Dm
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> CONFIG_DRM=3Dm
> CONFIG_DRM_MIPI_DSI=3Dy
> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> CONFIG_DRM_DEBUG_SELFTEST=3Dm
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dm
> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> CONFIG_DRM_KMS_CMA_HELPER=3Dy
> CONFIG_DRM_VM=3Dy
> CONFIG_DRM_SCHED=3Dm
>
> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dm
> CONFIG_DRM_I2C_SIL164=3Dm
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> CONFIG_DRM_I2C_NXP_TDA9950=3Dm
> # CONFIG_DRM_RADEON is not set
> CONFIG_DRM_AMDGPU=3Dm
> # CONFIG_DRM_AMDGPU_SI is not set
> # CONFIG_DRM_AMDGPU_CIK is not set
> # CONFIG_DRM_AMDGPU_USERPTR is not set
> # CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set
>
> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_AMD_ACP is not set
>
> #
> # Display Engine Configuration
> #
> # CONFIG_DRM_AMD_DC is not set
>
> #
> # AMD Library routines
> #
> CONFIG_CHASH=3Dm
> CONFIG_CHASH_STATS=3Dy
> CONFIG_CHASH_SELFTEST=3Dy
> CONFIG_DRM_NOUVEAU=3Dm
> CONFIG_NOUVEAU_DEBUG=3D5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> # CONFIG_NOUVEAU_DEBUG_MMU is not set
> # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> CONFIG_DRM_I915=3Dm
> # CONFIG_DRM_I915_ALPHA_SUPPORT is not set
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> # CONFIG_DRM_I915_COMPRESS_ERROR is not set
> CONFIG_DRM_I915_USERPTR=3Dy
> CONFIG_DRM_I915_GVT=3Dy
>
> #
> # drm/i915 Debugging
> #
> # CONFIG_DRM_I915_WERROR is not set
> # CONFIG_DRM_I915_DEBUG is not set
> CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=3Dy
> CO

--===============0360884482749400023==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkhlbGxvLDxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9
ImF1dG8iPkkga25vdyBJIHJlYWxseSBicm9rZSB0aGlzIGJhZC7CoCBJJiMzOTtsbCBzZW5kIHRo
ZSBjb3JyZWN0IHBhdGNoIHNvb24uPC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1
b3RlIj48ZGl2IGRpcj0ibHRyIj5PbiBNb24sIEp1biAyNSwgMjAxOCwgNToyMiBQTSBrZXJuZWwg
dGVzdCByb2JvdCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNoZW5yLmZuc3RAY24uZnVqaXRzdS5jb20i
PmNoZW5yLmZuc3RAY24uZnVqaXRzdS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGJyPgpHcmVldGluZ3MsPGJy
Pgo8YnI+CjBkYXkga2VybmVsIHRlc3Rpbmcgcm9ib3QgZ290IHRoZSBiZWxvdyBkbWVzZyBhbmQg
dGhlIGZpcnN0IGJhZCBjb21taXQgaXM8YnI+Cjxicj4KPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tLzBkYXktY2kvbGludXgvY29tbWl0cy9TdGFmZm9yZC1Ib3JuZS9GaXgtR0NDLVdzdHJpbmdv
cC10cnVuY2F0aW9uLXdhcm5pbmdzLzIwMTgwNjIzLTEwMTE1NSIgcmVsPSJub3JlZmVycmVyIG5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51
eC9jb21taXRzL1N0YWZmb3JkLUhvcm5lL0ZpeC1HQ0MtV3N0cmluZ29wLXRydW5jYXRpb24td2Fy
bmluZ3MvMjAxODA2MjMtMTAxMTU1PC9hPjxicj4KPGJyPgpjb21taXQgNzNiZjVhYjMzOTE5NWZh
ODgyN2NlZWYxY2JiZWJlZmIwMTdkNzdlZTxicj4KQXV0aG9yOsKgIMKgIMKgU3RhZmZvcmQgSG9y
bmUgJmx0OzxhIGhyZWY9Im1haWx0bzpzaG9ybmVAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayIg
cmVsPSJub3JlZmVycmVyIj5zaG9ybmVAZ21haWwuY29tPC9hPiZndDs8YnI+CkF1dGhvckRhdGU6
IFNhdCBKdW4gMjMgMTE6MDc6NTMgMjAxOCArMDkwMDxicj4KQ29tbWl0OsKgIMKgIMKgMGRheSBy
b2JvdCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxrcEBpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIiBy
ZWw9Im5vcmVmZXJyZXIiPmxrcEBpbnRlbC5jb208L2E+Jmd0Ozxicj4KQ29tbWl0RGF0ZTogU2F0
IEp1biAyMyAxMDoxMTo1NiAyMDE4ICswODAwPGJyPgo8YnI+CsKgIMKgIMKga29iamVjdDogRml4
IC1Xc3RyaW5nb3AtdHJ1bmNhdGlvbiB3YXJuaW5nPGJyPgo8YnI+CsKgIMKgIMKgV2hlbiBjb21w
aWxpbmcgd2l0aCBHQ0MgOS4wLjAgSSBhbSBzZWVpbmcgdGhlIGZvbGxvd2luZyB3YXJuaW5nOjxi
cj4KPGJyPgrCoCDCoCDCoCDCoCDCoEluIGZ1bmN0aW9uIOKAmGZpbGxfa29ial9wYXRo4oCZLDxi
cj4KwqAgwqAgwqAgwqAgwqAgwqAgwqBpbmxpbmVkIGZyb20g4oCYa29iamVjdF9nZXRfcGF0aOKA
mSBhdCBsaWIva29iamVjdC5jOjE1NToyOjxicj4KwqAgwqAgwqAgwqAgwqBsaWIva29iamVjdC5j
OjEyODozOiB3YXJuaW5nOiDigJhzdHJuY3B54oCZIG91dHB1dCB0cnVuY2F0ZWQgYmVmb3JlIHRl
cm1pbmF0aW5nIG51bCBjb3B5aW5nIGFzIG1hbnkgYnl0ZXMgZnJvbSBhIHN0cmluZyBhcyBpdHMg
bGVuZ3RoIFstV3N0cmluZ29wLXRydW5jYXRpb25dPGJyPgrCoCDCoCDCoCDCoCDCoCDCoCBzdHJu
Y3B5KHBhdGggKyBsZW5ndGgsIGtvYmplY3RfbmFtZShwYXJlbnQpLCBjdXIpOzxicj4KwqAgwqAg
wqAgwqAgwqAgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fjxicj4KwqAgwqAgwqAgwqAgwqBsaWIva29iamVjdC5jOiBJbiBmdW5jdGlvbiDigJhrb2Jq
ZWN0X2dldF9wYXRo4oCZOjxicj4KwqAgwqAgwqAgwqAgwqBsaWIva29iamVjdC5jOjEyNToxMzog
bm90ZTogbGVuZ3RoIGNvbXB1dGVkIGhlcmU8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIGludCBjdXIg
PSBzdHJsZW4oa29iamVjdF9uYW1lKHBhcmVudCkpOzxicj4KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fjxicj4KPGJyPgrCoCDCoCDC
oFRoaXMgaXMgcG9pbnRpbmcgb3V0IGEgYnVnIHRoYXQgdGhlIHN0cm5jcHkgbGltaXQgaXMgdGhl
IHNvdXJjZSBzdHJpbmcgbm90IHRoZTxicj4KwqAgwqAgwqBkZXN0aW5hdGlvbiBidWZmZXIgcmVt
YWluaW5nIGxlbmd0aC7CoCBGaXggaXQuPGJyPgo8YnI+CsKgIMKgIMKgQ2M6IEdyZWcgS3JvYWgt
SGFydG1hbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIiB0
YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5ncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
ZzwvYT4mZ3Q7PGJyPgrCoCDCoCDCoENjOiBBcm5kIEJlcmdtYW5uICZsdDs8YSBocmVmPSJtYWls
dG86YXJuZEBhcm5kYi5kZSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+YXJuZEBh
cm5kYi5kZTwvYT4mZ3Q7PGJyPgrCoCDCoCDCoFNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5l
ICZsdDs8YSBocmVmPSJtYWlsdG86c2hvcm5lQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJl
bD0ibm9yZWZlcnJlciI+c2hvcm5lQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgo8YnI+CjY4ZjcyMTQx
YTTCoCBjcnlwdG86IEZpeCAtV3N0cmluZ29wLXRydW5jYXRpb24gd2FybmluZ3M8YnI+CjczYmY1
YWIzMznCoCBrb2JqZWN0OiBGaXggLVdzdHJpbmdvcC10cnVuY2F0aW9uIHdhcm5pbmc8YnI+Cist
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLSs8YnI+CnzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDY4ZjcyMTQxYTQgfCA3M2Jm
NWFiMzM5IHw8YnI+CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSs8YnI+CnwgYm9vdF9zdWNjZXNzZXPCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgNDA2wqAgwqAg
wqAgwqAgfCA0wqAgwqAgwqAgwqAgwqAgfDxicj4KfCBib290X2ZhaWx1cmVzwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCA4wqAgwqAgwqAgwqAgwqAg
fCAxNDDCoCDCoCDCoCDCoCB8PGJyPgp8IElORk86cmN1X3ByZWVtcHRfZGV0ZWN0ZWRfc3RhbGxz
X29uX0NQVXMvdGFza3MgfCA1wqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+
CnwgUklQOl9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHwgNsKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IElORk86cmN1X3By
ZWVtcHRfc2VsZi1kZXRlY3RlZF9zdGFsbF9vbl9DUFXCoCDCoCB8IDPCoCDCoCDCoCDCoCDCoCB8
wqAgwqAgwqAgwqAgwqAgwqAgfDxicj4KfCBJTkZPOnJjdV9zY2hlZF9kZXRlY3RlZF9zdGFsbHNf
b25fQ1BVcy90YXNrc8KgIMKgfCAxwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIHw8
YnI+CnwgUklQOmttZW1fY2FjaGVfZnJlZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHwgMcKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IFJJ
UDpsb2NrX2FjcXVpcmXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHwgMsKgIMKgIMKgIMKgIMKgIHzCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IEJVRzprZXJu
ZWxfaGFuZ19pbl90ZXN0X3N0YWdlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAxwqAgwqAg
wqAgwqAgwqAgfCAxwqAgwqAgwqAgwqAgwqAgfDxicj4KfCBSSVA6ZG9fbmFub3NsZWVwwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDHCoCDCoCDCoCDCoCDC
oCB8wqAgwqAgwqAgwqAgwqAgwqAgfDxicj4KfCBSSVA6X3Jhd19zcGluX3VubG9ja19pcnHCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMcKgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCDCoCB8PGJyPgp8IGdlbmVyYWxfcHJvdGVjdGlvbl9mYXVsdDojWyMjXcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCAxNcKgIMKgIMKgIMKgIMKgfDxi
cj4KfCBSSVA6c3RyY21wwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8IDDCoCDCoCDCoCDCoCDCoCB8IDM2wqAgwqAgwqAgwqAgwqB8PGJyPgp8
IEtlcm5lbF9wYW5pYy1ub3Rfc3luY2luZzpGYXRhbF9leGNlcHRpb27CoCDCoCDCoCDCoHwgMMKg
IMKgIMKgIMKgIMKgIHwgMTM4wqAgwqAgwqAgwqAgfDxicj4KfCBCVUc6dW5hYmxlX3RvX2hhbmRs
ZV9rZXJuZWzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDDCoCDCoCDCoCDCoCDCoCB8
IDEwN8KgIMKgIMKgIMKgIHw8YnI+CnwgT29wczojWyMjXcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCAxMTHC
oCDCoCDCoCDCoCB8PGJyPgp8IFJJUDp0b3J0dXJlX3NodWZmbGXCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDDCoCDCoCDCoCDCoCDCoCB8IDHCoCDCoCDCoCDCoCDC
oCB8PGJyPgp8IFJJUDpwY2lfYnVzX3Jlc291cmNlX27CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgMcKgIMKgIMKgIMKgIMKgIHw8YnI+Cnwg
UklQOnByaW50X0lPX0FQSUNzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB8IDDCoCDCoCDCoCDCoCDCoCB8IDEzwqAgwqAgwqAgwqAgwqB8PGJyPgp8IFJJUDphY2Nv
dW50X2tlcm5lbF9zdGFja8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAg
wqAgwqAgwqAgwqAgfCAzNsKgIMKgIMKgIMKgIMKgfDxicj4KfCBXQVJOSU5HOmF0X2RyaXZlcnMv
dHR5L3R0eV9pby5jOiN0dHlfaW5pdF9kZXbCoCB8IDDCoCDCoCDCoCDCoCDCoCB8IDEwwqAgwqAg
wqAgwqAgwqB8PGJyPgp8IFJJUDp0dHlfaW5pdF9kZXbCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgMTDCoCDCoCDCoCDCoCDC
oHw8YnI+Cnwga2VybmVsX0JVR19hdF9saWIvbGlzdF9kZWJ1Zy5jwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8IDDCoCDCoCDCoCDCoCDCoCB8IDEywqAgwqAgwqAgwqAgwqB8PGJyPgp8IGludmFs
aWRfb3Bjb2RlOiNbIyNdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
IDDCoCDCoCDCoCDCoCDCoCB8IDEywqAgwqAgwqAgwqAgwqB8PGJyPgp8IFJJUDpfX2xpc3RfYWRk
X3ZhbGlkwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDDCoCDCoCDC
oCDCoCDCoCB8IDEwwqAgwqAgwqAgwqAgwqB8PGJyPgp8IFdBUk5JTkc6YXRfZnMvcHJvYy9nZW5l
cmljLmM6I19fcHJvY19jcmVhdGXCoCDCoCB8IDDCoCDCoCDCoCDCoCDCoCB8IDbCoCDCoCDCoCDC
oCDCoCB8PGJyPgp8IFJJUDpfX3Byb2NfY3JlYXRlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfCAwwqAgwqAgwqAgwqAgwqAgfCA2wqAgwqAgwqAgwqAgwqAgfDxi
cj4KfCBSSVA6Y2hlY2tfcHJlZW1wdF93YWtldXDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgNcKgIMKgIMKgIMKgIMKgIHw8YnI+CnwgUklQOmlv
YXBpY19jb25maWd1cmVfZW50cnnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMMKg
IMKgIMKgIMKgIMKgIHwgMsKgIMKgIMKgIMKgIMKgIHw8YnI+CnwgUklQOl9fYWNwaV9tYXRjaF9k
ZXZpY2XCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDDCoCDCoCDCoCDCoCDC
oCB8IDHCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IFJJUDpzY2hlZF9zbGljZcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgMMKgIMKgIMKgIMKgIMKgIHwgNMKg
IMKgIMKgIMKgIMKgIHw8YnI+CnwgUklQOmtvYmpfbG9va3VwwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAwwqAgwqAgwqAgwqAgwqAgfCA0wqAgwqAgwqAg
wqAgwqAgfDxicj4KfCBSSVA6X19sb2NrX2FjcXVpcmXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgNcKgIMKgIMKgIMKgIMKgIHw8
YnI+CnwgV0FSTklORzphdF9saWIva29iamVjdC5jOiNrb2JqZWN0X2FkZF9pbnRlcm5hbCB8IDDC
oCDCoCDCoCDCoCDCoCB8IDHCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IFJJUDprb2JqZWN0X2FkZF9p
bnRlcm5hbMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAg
wqAgfCAxwqAgwqAgwqAgwqAgwqAgfDxicj4KfCBSSVA6Y2hlY2tfcG9pc29uX29iasKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCAywqAg
wqAgwqAgwqAgwqAgfDxicj4KfCBSSVA6aW9fYXBpY19iYXNlwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDDCoCDCoCDCoCDCoCDCoCB8IDLCoCDCoCDCoCDC
oCDCoCB8PGJyPgp8IFJJUDpfX2ZwdXTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgMcKgIMKgIMKgIMKgIMKg
IHw8YnI+CnwgUklQOnNlcmlvX2Rpc2Nvbm5lY3RfcG9ydMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHwgMMKgIMKgIMKgIMKgIMKgIHwgMcKgIMKgIMKgIMKgIMKgIHw8YnI+CnwgUklQ
Ol9fdW5peF9maW5kX3NvY2tldF9ieW5hbWXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDDC
oCDCoCDCoCDCoCDCoCB8IDLCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IFJJUDpfX2xpc3RfZGVsX2Vu
dHJ5X3ZhbGlkwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDDCoCDCoCDCoCDCoCDC
oCB8IDLCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IFJJUDpfU0hVRl9EQzAwwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDDCoCDCoCDCoCDCoCDCoCB8IDHC
oCDCoCDCoCDCoCDCoCB8PGJyPgp8IFJJUDpfX3NjaGVkdWxlwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDDCoCDCoCDCoCDCoCDCoCB8IDHCoCDCoCDC
oCDCoCDCoCB8PGJyPgorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rPGJyPgo8YnI+ClvCoCDCoCAwLjI5NTg5
OF0gTmV4dCBvYmo6IHN0YXJ0PWZmZmY4ODAwMDAxZTM0MDAsIGxlbj0xMDI0PGJyPgpbwqAgwqAg
MC4yOTY2ODddIDAwMDogNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIg
NmIgNmLCoCBra2tra2tra2tra2tra2trPGJyPgpbwqAgwqAgMC4yOTgwMDNdIDAxMDogNmIgNmIg
NmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmIgNmLCoCBra2tra2tra2tra2tr
a2trPGJyPgpbwqAgwqAgMC4yOTkyNzFdIGxpc3RfYWRkIGNvcnJ1cHRpb24uIHByZXYtJmd0O25l
eHQgc2hvdWxkIGJlIG5leHQgKGZmZmY4ODAwMDAwM2RmMDApLCBidXQgd2FzIGZmZmY4ODAwMDAx
ZTMwNjAuIChwcmV2PWZmZmY4ODAwMDAxZTMwNjApLjxicj4KW8KgIMKgIDAuMzAwMDU1XSAtLS0t
LS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS08YnI+ClvCoCDCoCAwLjMwMzMzM10ga2Vy
bmVsIEJVRyBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjI4ITxicj4KW8KgIMKgIDAuMzAzOTYyXSBpbnZh
bGlkIG9wY29kZTogMDAwMCBbIzFdIFBSRUVNUFQgU01QIFBUSTxicj4KW8KgIMKgIDAuMzA0ODIz
XSBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA0LjE4LjAtcmMxLTAw
MDE3LWc3M2JmNWFiICMxPGJyPgpbwqAgwqAgMC4zMDYwMjhdIFJJUDogMDAxMDpfX2xpc3RfYWRk
X3ZhbGlkKzB4M2UvMHg2Mjxicj4KW8KgIMKgIDAuMzA2NjY2XSBDb2RlOiBjNyBjNyBmNCBkOSBi
ZiA4MSBlOCBhOCA3YiBlNiBmZiAwZiAwYiA0OCA4YiAzMiA0OCAzOSBmMCA3NCAxNyA0OCA4OSBk
MSA0OCBjNyBjNyA2ZCBkYSBiZiA4MSA0OCA4OSBmMiA0OCA4OSBjNiBlOCA4OSA3YiBlNiBmZiAm
bHQ7MGYmZ3Q7IDBiIDQ4IDM5IGZhIDc0IDA1IDQ4IDM5IGY4IDc1IDE0IDQ4IDg5IGZlIDQ4IDg5
IGMxIDQ4IGM3IGM3IGJmPGJyPgpbwqAgwqAgMC4zMDY2NjZdIFJTUDogMDAwMDpmZmZmYzkwMDAw
MDBiZGY4IEVGTEFHUzogMDAwMTAyOTI8YnI+ClvCoCDCoCAwLjMwNjY2Nl0gUkFYOiAwMDAwMDAw
MDAwMDAwMDc1IFJCWDogZmZmZjg4MDAwMDFlMzA1OCBSQ1g6IGZmZmZjOTAwMDAwMGJkODg8YnI+
ClvCoCDCoCAwLjMwNjY2Nl0gUkRYOiBmZmZmZmZmZjgxMGUxYjVkIFJTSTogZmZmZmZmZmY4MWMz
MmEzYyBSREk6IDAwMDAwMDAwZmZmZmZmZmY8YnI+ClvCoCDCoCAwLjMwNjY2Nl0gUkJQOiBmZmZm
YzkwMDAwMDBiZGY4IFIwODogZmZmZjg4MDAwMDA1Mjc0OCBSMDk6IDAwMDAwMDAwZmY1OWE1NjE8
YnI+ClvCoCDCoCAwLjMwNjY2Nl0gUjEwOiBmZmZmYzkwMDAwMDBiZDc4IFIxMTogZmZmZmZmZmY4
MWU0NGMxOCBSMTI6IGZmZmY4ODAwMDAwM2RmMDA8YnI+ClvCoCDCoCAwLjMwNjY2Nl0gUjEzOiBm
ZmZmODgwMDAwMDNkZjU4IFIxNDogZmZmZjg4MDAwMDFlMzA2MCBSMTU6IGZmZmY4ODAwMDAxZTMw
NjA8YnI+ClvCoCDCoCAwLjMwNjY2Nl0gRlM6wqAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpm
ZmZmODgwMDFmODAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDA8YnI+ClvCoCDCoCAw
LjMwNjY2Nl0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAw
MzM8YnI+ClvCoCDCoCAwLjMwNjY2Nl0gQ1IyOiAwMDAwMDAwMDAwMDAwMDAwIENSMzogMDAwMDAw
MDAwMWUxZTAwMSBDUjQ6IDAwMDAwMDAwMDAwNjA2YjA8YnI+ClvCoCDCoCAwLjMwNjY2Nl0gQ2Fs
bCBUcmFjZTo8YnI+ClvCoCDCoCAwLjMwNjY2Nl3CoCBrb2JqZWN0X2FkZF9pbnRlcm5hbCsweGEy
LzB4MjA5PGJyPgpbwqAgwqAgMC4zMDY2NjZdwqAga3NldF9yZWdpc3RlcisweDI2LzB4M2Y8YnI+
ClvCoCDCoCAwLjMwNjY2Nl3CoCBfX2NsYXNzX3JlZ2lzdGVyKzB4ZGMvMHgxM2Y8YnI+ClvCoCDC
oCAwLjMwNjY2Nl3CoCA/IGdwaW9saWJfZGVidWdmc19pbml0KzB4MjQvMHgyNDxicj4KW8KgIMKg
IDAuMzA2NjY2XcKgIGdwaW9saWJfc3lzZnNfaW5pdCsweDFhLzB4YTI8YnI+ClvCoCDCoCAwLjMw
NjY2Nl3CoCBkb19vbmVfaW5pdGNhbGwrMHg2MC8weDE1MDxicj4KW8KgIMKgIDAuMzA2NjY2XcKg
IGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MjEyLzB4MjlhPGJyPgpbwqAgwqAgMC4zMDY2NjZdwqAg
PyByZXN0X2luaXQrMHgyMTcvMHgyMTc8YnI+ClvCoCDCoCAwLjMwNjY2Nl3CoCBrZXJuZWxfaW5p
dCsweDkvMHhmMDxicj4KW8KgIMKgIDAuMzA2NjY2XcKgIHJldF9mcm9tX2ZvcmsrMHgyNC8weDMw
PGJyPgpbwqAgwqAgMC4zMDY2NjZdIE1vZHVsZXMgbGlua2VkIGluOjxicj4KW8KgIMKgIDAuMzA2
Njg1XSAtLS1bIGVuZCB0cmFjZSBkZjI2Mzk0Y2YxMTE5Y2UzIF0tLS08YnI+ClvCoCDCoCAwLjMw
NzQ0MV0gUklQOiAwMDEwOl9fbGlzdF9hZGRfdmFsaWQrMHgzZS8weDYyPGJyPgo8YnI+CsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIyBISDpNTSBSRVNVTFQgR09PRCBCQUQgR09PRF9C
VVRfRElSVFkgRElSVFlfTk9UX0JBRDxicj4KZ2l0IGJpc2VjdCBzdGFydCA5Y2RiMGYxYzJhM2E1
Y2ZkYzllNzcwNGQ0ZTViYmUyNDBlMzI4MWMxIGNlMzk3ZDIxNWNjZDA3YjhhZTNmNzFkYjY4OWFl
ZGI4NWQ1NmFiNDAgLS08YnI+CmdpdCBiaXNlY3TCoCBiYWQgNTNhYTcxZmIwZWEwYzZlOWQ4MjA1
MTkyMWNjMGQ4N2Q5MWE0MTM1OMKgICMgMDA6MDbCoCBCwqAgwqAgwqAgMcKgIMKgIMKgMcKgIMKg
IDHCoCDCoDHCoCBNZXJnZSAmIzM5O2xpbnV4LXJldmlldy9SaWNhcmRvLVNjaHdhcnptZWllci90
cG0tUmV0dXJuLXRoZS1hY3R1YWwtc2l6ZS13aGVuLXJlY2VpdmluZy1hbi11bnN1cHBvcnRlZC1j
b21tYW5kLzIwMTgwNjIyLTE1MDg0NyYjMzk7IGludG8gZGV2ZWwtaG91cmx5LTIwMTgwNjIzMTQ8
YnI+CmdpdCBiaXNlY3TCoCBiYWQgOWRjMzI4YWI1ODEzODk0MzVlMTQ5MGIyMjAxNmVhNzhkMzkz
MjAyZsKgICMgMDA6NDbCoCBCwqAgwqAgwqAgOcKgIMKgIMKgMcKgIMKgIDnCoCDCoDnCoCBNZXJn
ZSAmIzM5O2xpbnV4LXJldmlldy9CeXVuZ2NodWwtUGFyay9zY2hlZC1kZWFkbGluZS1BZGQtY3B1
ZGxfbWF4aW11bV9kbC1mb3ItYmV0dGVyLXJlYWRhYmlsaXR5LzIwMTgwNjE4LTEzMDc0NSYjMzk7
IGludG8gZGV2ZWwtaG91cmx5LTIwMTgwNjIzMTQ8YnI+CmdpdCBiaXNlY3QgZ29vZCBiNDJhYTNi
YWQzYTE5MTViYzE4MjFkZDU3MGNmMTNkZDY4MzEwMThjwqAgIyAxMzozMcKgIEfCoCDCoCDCoDY1
wqAgwqAgwqAwwqAgwqAgMMKgIMKgMMKgIE1lcmdlICYjMzk7bGludXgtcmV2aWV3L0tyenlzenRv
Zi1Lb3psb3dza2kvQVJDLWR0cy1SZW1vdmUtbGVhZGluZy0weC1mcm9tLW5vZGUtdW5pdC1hZGRy
ZXNzZXMvMjAxODA2MTktMDMxODQyJiMzOTsgaW50byBkZXZlbC1ob3VybHktMjAxODA2MjMxNDxi
cj4KZ2l0IGJpc2VjdMKgIGJhZCBlN2EwYmIzZWE5YWRiMWY5NWE4YjIwY2NkMmQ1NmQ5YTViOGFm
NmM4wqAgIyAxNDoxOMKgIELCoCDCoCDCoDIwwqAgwqAgwqAxwqAgwqAxOcKgIDE5wqAgTWVyZ2Ug
JiMzOTtjbGstbWVzb24vZml4ZXMvZHJpdmVycyYjMzk7IGludG8gZGV2ZWwtaG91cmx5LTIwMTgw
NjIzMTQ8YnI+CmdpdCBiaXNlY3TCoCBiYWQgODYxNDJkMWQ3YmI0ZmE1OTMyNGFkNjZkZmY0NGFj
NTZiOGVjOGE4McKgICMgMTQ6NTjCoCBCwqAgwqAgwqAyOcKgIMKgIMKgMcKgIMKgMjjCoCAyOMKg
IE1lcmdlICYjMzk7bTY4ay9tNjhrLXF1ZXVlJiMzOTsgaW50byBkZXZlbC1ob3VybHktMjAxODA2
MjMxNDxicj4KZ2l0IGJpc2VjdMKgIGJhZCBiYTkxZDA5MGM1NmRmNGFkYTRmNDU3ZjZiYjY5YzNi
MWY4NjhlNTk2wqAgIyAxNTo0N8KgIELCoCDCoCDCoDEzwqAgwqAgwqAxwqAgwqAxM8KgIDEzwqAg
TWVyZ2UgJiMzOTtsaW51eC1yZXZpZXcvUGFsbWVyLURhYmJlbHQvUklTQy1WLURvbi10LWluY2x1
ZGUtaXJxLXJpc2N2LWludGMtaC8yMDE4MDYyMy0wNzIyMjEmIzM5OyBpbnRvIGRldmVsLWhvdXJs
eS0yMDE4MDYyMzE0PGJyPgpnaXQgYmlzZWN0wqAgYmFkIDVkNjJkMDQzMDVkMzgzNGE1YTZmZTE2
MWZmOGY3Yjg4NzlhYzUwYTbCoCAjIDE2OjI5wqAgQsKgIMKgIMKgMjHCoCDCoCDCoDLCoCDCoDIx
wqAgMjHCoCBNZXJnZSAmIzM5O2xpbnV4LXJldmlldy9KaWEtSnUtQmFpL2tlcm5lbC1hdWRpdF90
cmVlLUZpeC1hLXNsZWVwLWluLWF0b21pYy1jb250ZXh0LWJ1Zy8yMDE4MDYyMS0xMjAwMzQmIzM5
OyBpbnRvIGRldmVsLWhvdXJseS0yMDE4MDYyMzE0PGJyPgpnaXQgYmlzZWN0wqAgYmFkIGYwMmMy
YmFkNjhjYzhmMTE5MmE3NTMzYjUzYTE1YTM3MzM4MDQ1OGTCoCAjIDE3OjA3wqAgQsKgIMKgIMKg
IDTCoCDCoCDCoDHCoCDCoCA0wqAgwqA0wqAgTWVyZ2UgJiMzOTtsaW51eC1yZXZpZXcvTWFyYy1a
eW5naWVyL0tWTS1hcm0tYXJtNjQtRHJvcC1yZXNvdXJjZS1zaXplLWNoZWNrLWZvci1HSUNWLXdp
bmRvdy8yMDE4MDYyMi0yMjQ4MjAmIzM5OyBpbnRvIGRldmVsLWhvdXJseS0yMDE4MDYyMzE0PGJy
PgpnaXQgYmlzZWN0wqAgYmFkIDdhNmMxMzYwNWRmZDdkMWE1OGI4NmZjYjgzYThjYzIzOGIyYzI4
NDTCoCAjIDE3OjU2wqAgQsKgIMKgIMKgIDfCoCDCoCDCoDHCoCDCoCA3wqAgwqA3wqAgTWVyZ2Ug
JiMzOTtsaW51eC1yZXZpZXcvU3RhZmZvcmQtSG9ybmUvRml4LUdDQy1Xc3RyaW5nb3AtdHJ1bmNh
dGlvbi13YXJuaW5ncy8yMDE4MDYyMy0xMDExNTUmIzM5OyBpbnRvIGRldmVsLWhvdXJseS0yMDE4
MDYyMzE0PGJyPgpnaXQgYmlzZWN0IGdvb2QgMzNhNTBhNGZkZDIyYzc0NTUzYWY1ZjI4ZDdjYzc3
Zjc3ZDAwYWZlMMKgICMgMTk6NDbCoCBHwqAgwqAgMTMwwqAgwqAgwqAwwqAgwqAgMsKgIMKgMsKg
IE1lcmdlICYjMzk7cGluY3RybC9kZXZlbCYjMzk7IGludG8gZGV2ZWwtaG91cmx5LTIwMTgwNjIz
MTQ8YnI+CmdpdCBiaXNlY3TCoCBiYWQgNzNiZjVhYjMzOTE5NWZhODgyN2NlZWYxY2JiZWJlZmIw
MTdkNzdlZcKgICMgMTk6NTjCoCBCwqAgwqAgwqAgMMKgIMKgIMKgMcKgIMKgMTXCoCDCoDDCoCBr
b2JqZWN0OiBGaXggLVdzdHJpbmdvcC10cnVuY2F0aW9uIHdhcm5pbmc8YnI+CmdpdCBiaXNlY3Qg
Z29vZCA2OGY3MjE0MWE0NTA5ZTdlYjg0MWIwY2IzNTE3MmNiM2NlMDNlN2Y1wqAgIyAyMTo0McKg
IEfCoCDCoCAxMzDCoCDCoCDCoDDCoCDCoCA0wqAgwqA0wqAgY3J5cHRvOiBGaXggLVdzdHJpbmdv
cC10cnVuY2F0aW9uIHdhcm5pbmdzPGJyPgojIGZpcnN0IGJhZCBjb21taXQ6IFs3M2JmNWFiMzM5
MTk1ZmE4ODI3Y2VlZjFjYmJlYmVmYjAxN2Q3N2VlXSBrb2JqZWN0OiBGaXggLVdzdHJpbmdvcC10
cnVuY2F0aW9uIHdhcm5pbmc8YnI+CmdpdCBiaXNlY3QgZ29vZCA2OGY3MjE0MWE0NTA5ZTdlYjg0
MWIwY2IzNTE3MmNiM2NlMDNlN2Y1wqAgIyAyMzoxNMKgIEfCoCDCoCAzOTDCoCDCoCDCoDDCoCDC
oCA2wqAgMTDCoCBjcnlwdG86IEZpeCAtV3N0cmluZ29wLXRydW5jYXRpb24gd2FybmluZ3M8YnI+
CiMgZXh0cmEgdGVzdHMgd2l0aCBkZWJ1ZyBvcHRpb25zPGJyPgpnaXQgYmlzZWN0wqAgYmFkIDcz
YmY1YWIzMzkxOTVmYTg4MjdjZWVmMWNiYmViZWZiMDE3ZDc3ZWXCoCAjIDIzOjMywqAgQsKgIMKg
IMKgIDXCoCDCoCDCoDHCoCDCoCA1wqAgwqA1wqAga29iamVjdDogRml4IC1Xc3RyaW5nb3AtdHJ1
bmNhdGlvbiB3YXJuaW5nPGJyPgojIGV4dHJhIHRlc3RzIG9uIEhFQUQgb2YgbGludXgtZGV2ZWwv
ZGV2ZWwtaG91cmx5LTIwMTgwNjIzMTQ8YnI+CmdpdCBiaXNlY3TCoCBiYWQgOWNkYjBmMWMyYTNh
NWNmZGM5ZTc3MDRkNGU1YmJlMjQwZTMyODFjMcKgICMgMjM6MzLCoCBCwqAgwqAgwqAgNsKgIMKg
IDI5wqAgwqAgMCAzMTXCoCAwZGF5IGhlYWQgZ3VhcmQgZm9yICYjMzk7ZGV2ZWwtaG91cmx5LTIw
MTgwNjIzMTQmIzM5Ozxicj4KIyBleHRyYSB0ZXN0cyBvbiB0cmVlL2JyYW5jaCBsaW51eC1yZXZp
ZXcvU3RhZmZvcmQtSG9ybmUvRml4LUdDQy1Xc3RyaW5nb3AtdHJ1bmNhdGlvbi13YXJuaW5ncy8y
MDE4MDYyMy0xMDExNTU8YnI+CmdpdCBiaXNlY3TCoCBiYWQgNzNiZjVhYjMzOTE5NWZhODgyN2Nl
ZWYxY2JiZWJlZmIwMTdkNzdlZcKgICMgMjM6MzPCoCBCwqAgwqAgwqAgNMKgIMKgIDExwqAgwqAg
MCAxMjPCoCBrb2JqZWN0OiBGaXggLVdzdHJpbmdvcC10cnVuY2F0aW9uIHdhcm5pbmc8YnI+CiMg
ZXh0cmEgdGVzdHMgd2l0aCBmaXJzdCBiYWQgY29tbWl0IHJldmVydGVkPGJyPgpnaXQgYmlzZWN0
IGdvb2QgMTk3MDNlODE3NmMzNjQ3NjhmZWU5Y2NhNmYyNzE2Yzg2MmY2NmJhOcKgICMgMTI6NDDC
oCBHwqAgwqAgMTMxwqAgwqAgwqAwwqAgwqAgNsKgIMKgNsKgIFJldmVydCAmcXVvdDtrb2JqZWN0
OiBGaXggLVdzdHJpbmdvcC10cnVuY2F0aW9uIHdhcm5pbmcmcXVvdDs8YnI+Cjxicj4KLS0tPGJy
PgowLURBWSBrZXJuZWwgdGVzdCBpbmZyYXN0cnVjdHVyZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyPGJyPgo8YSBocmVmPSJodHRwczovL2xpc3Rz
LjAxLm9yZy9waXBlcm1haWwvbGtwIiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9sa3A8L2E+wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgSW50ZWwgQ29ycG9yYXRpb248YnI+Cjxicj4K
PGJyPgo8YnI+CiMhL2Jpbi9iYXNoPGJyPgo8YnI+Cmtlcm5lbD0kMTxicj4KPGJyPgprdm09KDxi
cj4KwqAgwqAgwqAgwqAgcWVtdS1zeXN0ZW0teDg2XzY0PGJyPgrCoCDCoCDCoCDCoCAtZW5hYmxl
LWt2bTxicj4KwqAgwqAgwqAgwqAgLWNwdSBIYXN3ZWxsLCtzbWVwLCtzbWFwPGJyPgrCoCDCoCDC
oCDCoCAta2VybmVsICRrZXJuZWw8YnI+CsKgIMKgIMKgIMKgIC1tIDUxMjxicj4KwqAgwqAgwqAg
wqAgLXNtcCAxPGJyPgrCoCDCoCDCoCDCoCAtZGV2aWNlIGUxMDAwLG5ldGRldj1uZXQwPGJyPgrC
oCDCoCDCoCDCoCAtbmV0ZGV2IHVzZXIsaWQ9bmV0MDxicj4KwqAgwqAgwqAgwqAgLWJvb3Qgb3Jk
ZXI9bmM8YnI+CsKgIMKgIMKgIMKgIC1uby1yZWJvb3Q8YnI+CsKgIMKgIMKgIMKgIC13YXRjaGRv
ZyBpNjMwMGVzYjxicj4KwqAgwqAgwqAgwqAgLXdhdGNoZG9nLWFjdGlvbiBkZWJ1Zzxicj4KwqAg
wqAgwqAgwqAgLXJ0YyBiYXNlPWxvY2FsdGltZTxicj4KwqAgwqAgwqAgwqAgLXNlcmlhbCBzdGRp
bzxicj4KwqAgwqAgwqAgwqAgLWRpc3BsYXkgbm9uZTxicj4KwqAgwqAgwqAgwqAgLW1vbml0b3Ig
bnVsbDxicj4KKTxicj4KPGJyPgphcHBlbmQ9KDxicj4KwqAgwqAgwqAgwqAgcm9vdD0vZGV2L3Jh
bTA8YnI+CsKgIMKgIMKgIMKgIGh1bmdfdGFza19wYW5pYz0xPGJyPgrCoCDCoCDCoCDCoCBkZWJ1
Zzxicj4KwqAgwqAgwqAgwqAgYXBpYz1kZWJ1Zzxicj4KwqAgwqAgwqAgwqAgc3lzcnFfYWx3YXlz
X2VuYWJsZWQ8YnI+CsKgIMKgIMKgIMKgIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0x
MDA8YnI+CsKgIMKgIMKgIMKgIG5ldC5pZm5hbWVzPTA8YnI+CsKgIMKgIMKgIMKgIHByaW50ay5k
ZXZrbXNnPW9uPGJyPgrCoCDCoCDCoCDCoCBwYW5pYz0tMTxicj4KwqAgwqAgwqAgwqAgc29mdGxv
Y2t1cF9wYW5pYz0xPGJyPgrCoCDCoCDCoCDCoCBubWlfd2F0Y2hkb2c9cGFuaWM8YnI+CsKgIMKg
IMKgIMKgIG9vcHM9cGFuaWM8YnI+CsKgIMKgIMKgIMKgIGxvYWRfcmFtZGlzaz0yPGJyPgrCoCDC
oCDCoCDCoCBwcm9tcHRfcmFtZGlzaz0wPGJyPgrCoCDCoCDCoCDCoCBkcmJkLm1pbm9yX2NvdW50
PTg8YnI+CsKgIMKgIMKgIMKgIHN5c3RlbWQubG9nX2xldmVsPWVycjxicj4KwqAgwqAgwqAgwqAg
aWdub3JlX2xvZ2xldmVsPGJyPgrCoCDCoCDCoCDCoCBjb25zb2xlPXR0eTA8YnI+CsKgIMKgIMKg
IMKgIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMDxicj4KwqAgwqAgwqAgwqAgY29uc29sZT10dHlT
MCwxMTUyMDA8YnI+CsKgIMKgIMKgIMKgIHZnYT1ub3JtYWw8YnI+CsKgIMKgIMKgIMKgIHJ3PGJy
PgrCoCDCoCDCoCDCoCBkcmJkLm1pbm9yX2NvdW50PTg8YnI+CsKgIMKgIMKgIMKgIHJjdXBlcmYu
c2h1dGRvd249MDxicj4KKTxicj4KPGJyPgomcXVvdDske2t2bVtAXX0mcXVvdDsgLWFwcGVuZCAm
cXVvdDske2FwcGVuZFsqXX0mcXVvdDs8YnI+Cjxicj4KIzxicj4KIyBBdXRvbWF0aWNhbGx5IGdl
bmVyYXRlZCBmaWxlOyBETyBOT1QgRURJVC48YnI+CiMgTGludXgveDg2XzY0IDQuMTguMC1yYzEg
S2VybmVsIENvbmZpZ3VyYXRpb248YnI+CiM8YnI+Cjxicj4KIzxicj4KIyBDb21waWxlcjogZ2Nj
LTUgKERlYmlhbiA1LjUuMC0zKSA1LjQuMSAyMDE3MTAxMDxicj4KIzxicj4KQ09ORklHXzY0QklU
PXk8YnI+CkNPTkZJR19YODZfNjQ9eTxicj4KQ09ORklHX1g4Nj15PGJyPgpDT05GSUdfSU5TVFJV
Q1RJT05fREVDT0RFUj15PGJyPgpDT05GSUdfT1VUUFVUX0ZPUk1BVD0mcXVvdDtlbGY2NC14ODYt
NjQmcXVvdDs8YnI+CkNPTkZJR19BUkNIX0RFRkNPTkZJRz0mcXVvdDthcmNoL3g4Ni9jb25maWdz
L3g4Nl82NF9kZWZjb25maWcmcXVvdDs8YnI+CkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eTxicj4K
Q09ORklHX1NUQUNLVFJBQ0VfU1VQUE9SVD15PGJyPgpDT05GSUdfTU1VPXk8YnI+CkNPTkZJR19B
UkNIX01NQVBfUk5EX0JJVFNfTUlOPTI4PGJyPgpDT05GSUdfQVJDSF9NTUFQX1JORF9CSVRTX01B
WD0zMjxicj4KQ09ORklHX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFNfTUlOPTg8YnI+CkNPTkZJ
R19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTX01BWD0xNjxicj4KQ09ORklHX0dFTkVSSUNfQlVH
PXk8YnI+CkNPTkZJR19HRU5FUklDX0JVR19SRUxBVElWRV9QT0lOVEVSUz15PGJyPgpDT05GSUdf
R0VORVJJQ19IV0VJR0hUPXk8YnI+CkNPTkZJR19SV1NFTV9YQ0hHQUREX0FMR09SSVRITT15PGJy
PgpDT05GSUdfR0VORVJJQ19DQUxJQlJBVEVfREVMQVk9eTxicj4KQ09ORklHX0FSQ0hfSEFTX0NQ
VV9SRUxBWD15PGJyPgpDT05GSUdfQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFPXk8YnI+CkNPTkZJ
R19BUkNIX0hBU19GSUxURVJfUEdQUk9UPXk8YnI+CkNPTkZJR19IQVZFX1NFVFVQX1BFUl9DUFVf
QVJFQT15PGJyPgpDT05GSUdfTkVFRF9QRVJfQ1BVX0VNQkVEX0ZJUlNUX0NIVU5LPXk8YnI+CkNP
TkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSz15PGJyPgpDT05GSUdfQVJDSF9ISUJF
Uk5BVElPTl9QT1NTSUJMRT15PGJyPgpDT05GSUdfQVJDSF9TVVNQRU5EX1BPU1NJQkxFPXk8YnI+
CkNPTkZJR19BUkNIX1dBTlRfSFVHRV9QTURfU0hBUkU9eTxicj4KQ09ORklHX0FSQ0hfV0FOVF9H
RU5FUkFMX0hVR0VUTEI9eTxicj4KQ09ORklHX1pPTkVfRE1BMzI9eTxicj4KQ09ORklHX0FVRElU
X0FSQ0g9eTxicj4KQ09ORklHX0FSQ0hfU1VQUE9SVFNfT1BUSU1JWkVEX0lOTElOSU5HPXk8YnI+
CkNPTkZJR19BUkNIX1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQz15PGJyPgpDT05GSUdfWDg2XzY0
X1NNUD15PGJyPgpDT05GSUdfQVJDSF9TVVBQT1JUU19VUFJPQkVTPXk8YnI+CkNPTkZJR19GSVhf
RUFSTFlDT05fTUVNPXk8YnI+CkNPTkZJR19EWU5BTUlDX1BIWVNJQ0FMX01BU0s9eTxicj4KQ09O
RklHX1BHVEFCTEVfTEVWRUxTPTQ8YnI+CkNPTkZJR19DQ19JU19HQ0M9eTxicj4KQ09ORklHX0dD
Q19WRVJTSU9OPTUwNDAxPGJyPgpDT05GSUdfQ0xBTkdfVkVSU0lPTj0wPGJyPgpDT05GSUdfQ09O
U1RSVUNUT1JTPXk8YnI+CkNPTkZJR19JUlFfV09SSz15PGJyPgpDT05GSUdfQlVJTERUSU1FX0VY
VEFCTEVfU09SVD15PGJyPgpDT05GSUdfVEhSRUFEX0lORk9fSU5fVEFTSz15PGJyPgo8YnI+CiM8
YnI+CiMgR2VuZXJhbCBzZXR1cDxicj4KIzxicj4KQ09ORklHX0lOSVRfRU5WX0FSR19MSU1JVD0z
Mjxicj4KIyBDT05GSUdfQ09NUElMRV9URVNUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19MT0NBTFZF
UlNJT049JnF1b3Q7JnF1b3Q7PGJyPgpDT05GSUdfTE9DQUxWRVJTSU9OX0FVVE89eTxicj4KQ09O
RklHX0hBVkVfS0VSTkVMX0daSVA9eTxicj4KQ09ORklHX0hBVkVfS0VSTkVMX0JaSVAyPXk8YnI+
CkNPTkZJR19IQVZFX0tFUk5FTF9MWk1BPXk8YnI+CkNPTkZJR19IQVZFX0tFUk5FTF9YWj15PGJy
PgpDT05GSUdfSEFWRV9LRVJORUxfTFpPPXk8YnI+CkNPTkZJR19IQVZFX0tFUk5FTF9MWjQ9eTxi
cj4KQ09ORklHX0tFUk5FTF9HWklQPXk8YnI+CiMgQ09ORklHX0tFUk5FTF9CWklQMiBpcyBub3Qg
c2V0PGJyPgojIENPTkZJR19LRVJORUxfTFpNQSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19LRVJO
RUxfWFogaXMgbm90IHNldDxicj4KIyBDT05GSUdfS0VSTkVMX0xaTyBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19LRVJORUxfTFo0IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ERUZBVUxUX0hPU1ROQU1F
PSZxdW90Oyhub25lKSZxdW90Ozxicj4KIyBDT05GSUdfU1lTVklQQyBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19QT1NJWF9NUVVFVUUgaXMgbm90IHNldDxicj4KIyBDT05GSUdfQ1JPU1NfTUVNT1JZ
X0FUVEFDSCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfVVNFTElCPXk8YnI+CiMgQ09ORklHX0FVRElU
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19IQVZFX0FSQ0hfQVVESVRTWVNDQUxMPXk8YnI+Cjxicj4K
Izxicj4KIyBJUlEgc3Vic3lzdGVtPGJyPgojPGJyPgpDT05GSUdfR0VORVJJQ19JUlFfUFJPQkU9
eTxicj4KQ09ORklHX0dFTkVSSUNfSVJRX1NIT1c9eTxicj4KQ09ORklHX0dFTkVSSUNfSVJRX0VG
RkVDVElWRV9BRkZfTUFTSz15PGJyPgpDT05GSUdfR0VORVJJQ19QRU5ESU5HX0lSUT15PGJyPgpD
T05GSUdfR0VORVJJQ19JUlFfTUlHUkFUSU9OPXk8YnI+CkNPTkZJR19HRU5FUklDX0lSUV9DSElQ
PXk8YnI+CkNPTkZJR19JUlFfRE9NQUlOPXk8YnI+CkNPTkZJR19JUlFfU0lNPXk8YnI+CkNPTkZJ
R19JUlFfRE9NQUlOX0hJRVJBUkNIWT15PGJyPgpDT05GSUdfR0VORVJJQ19JUlFfTUFUUklYX0FM
TE9DQVRPUj15PGJyPgpDT05GSUdfR0VORVJJQ19JUlFfUkVTRVJWQVRJT05fTU9ERT15PGJyPgpD
T05GSUdfSVJRX0ZPUkNFRF9USFJFQURJTkc9eTxicj4KQ09ORklHX1NQQVJTRV9JUlE9eTxicj4K
IyBDT05GSUdfR0VORVJJQ19JUlFfREVCVUdGUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfQ0xPQ0tT
T1VSQ0VfV0FUQ0hET0c9eTxicj4KQ09ORklHX0FSQ0hfQ0xPQ0tTT1VSQ0VfREFUQT15PGJyPgpD
T05GSUdfQ0xPQ0tTT1VSQ0VfVkFMSURBVEVfTEFTVF9DWUNMRT15PGJyPgpDT05GSUdfR0VORVJJ
Q19USU1FX1ZTWVNDQUxMPXk8YnI+CkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTPXk8YnI+CkNP
TkZJR19HRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVD15PGJyPgpDT05GSUdfR0VORVJJQ19D
TE9DS0VWRU5UU19NSU5fQURKVVNUPXk8YnI+CkNPTkZJR19HRU5FUklDX0NNT1NfVVBEQVRFPXk8
YnI+Cjxicj4KIzxicj4KIyBUaW1lcnMgc3Vic3lzdGVtPGJyPgojPGJyPgpDT05GSUdfVElDS19P
TkVTSE9UPXk8YnI+CkNPTkZJR19OT19IWl9DT01NT049eTxicj4KIyBDT05GSUdfSFpfUEVSSU9E
SUMgaXMgbm90IHNldDxicj4KQ09ORklHX05PX0haX0lETEU9eTxicj4KIyBDT05GSUdfTk9fSFpf
RlVMTCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTk9fSFo9eTxicj4KQ09ORklHX0hJR0hfUkVTX1RJ
TUVSUz15PGJyPgo8YnI+CiM8YnI+CiMgQ1BVL1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGlu
Zzxicj4KIzxicj4KQ09ORklHX1RJQ0tfQ1BVX0FDQ09VTlRJTkc9eTxicj4KIyBDT05GSUdfVklS
VF9DUFVfQUNDT1VOVElOR19HRU4gaXMgbm90IHNldDxicj4KQ09ORklHX0lSUV9USU1FX0FDQ09V
TlRJTkc9eTxicj4KIyBDT05GSUdfQlNEX1BST0NFU1NfQUNDVCBpcyBub3Qgc2V0PGJyPgojIENP
TkZJR19UQVNLU1RBVFMgaXMgbm90IHNldDxicj4KIyBDT05GSUdfQ1BVX0lTT0xBVElPTiBpcyBu
b3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgUkNVIFN1YnN5c3RlbTxicj4KIzxicj4KQ09ORklHX1BS
RUVNUFRfUkNVPXk8YnI+CiMgQ09ORklHX1JDVV9FWFBFUlQgaXMgbm90IHNldDxicj4KQ09ORklH
X1NSQ1U9eTxicj4KQ09ORklHX1RSRUVfU1JDVT15PGJyPgpDT05GSUdfVEFTS1NfUkNVPXk8YnI+
CkNPTkZJR19SQ1VfU1RBTExfQ09NTU9OPXk8YnI+CkNPTkZJR19SQ1VfTkVFRF9TRUdDQkxJU1Q9
eTxicj4KQ09ORklHX0JVSUxEX0JJTjJDPXk8YnI+CkNPTkZJR19JS0NPTkZJRz15PGJyPgpDT05G
SUdfSUtDT05GSUdfUFJPQz15PGJyPgpDT05GSUdfTE9HX0JVRl9TSElGVD0yMDxicj4KQ09ORklH
X0xPR19DUFVfTUFYX0JVRl9TSElGVD0xMjxicj4KQ09ORklHX1BSSU5US19TQUZFX0xPR19CVUZf
U0hJRlQ9MTM8YnI+CkNPTkZJR19IQVZFX1VOU1RBQkxFX1NDSEVEX0NMT0NLPXk8YnI+CkNPTkZJ
R19BUkNIX1NVUFBPUlRTX05VTUFfQkFMQU5DSU5HPXk8YnI+CkNPTkZJR19BUkNIX1dBTlRfQkFU
Q0hFRF9VTk1BUF9UTEJfRkxVU0g9eTxicj4KQ09ORklHX0FSQ0hfU1VQUE9SVFNfSU5UMTI4PXk8
YnI+CkNPTkZJR19DR1JPVVBTPXk8YnI+CiMgQ09ORklHX01FTUNHIGlzIG5vdCBzZXQ8YnI+CkNP
TkZJR19DR1JPVVBfU0NIRUQ9eTxicj4KQ09ORklHX0ZBSVJfR1JPVVBfU0NIRUQ9eTxicj4KIyBD
T05GSUdfQ0ZTX0JBTkRXSURUSCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUlRfR1JPVVBfU0NIRUQ9
eTxicj4KIyBDT05GSUdfQ0dST1VQX1BJRFMgaXMgbm90IHNldDxicj4KQ09ORklHX0NHUk9VUF9S
RE1BPXk8YnI+CkNPTkZJR19DR1JPVVBfRlJFRVpFUj15PGJyPgpDT05GSUdfQ1BVU0VUUz15PGJy
PgpDT05GSUdfUFJPQ19QSURfQ1BVU0VUPXk8YnI+CiMgQ09ORklHX0NHUk9VUF9ERVZJQ0UgaXMg
bm90IHNldDxicj4KIyBDT05GSUdfQ0dST1VQX0NQVUFDQ1QgaXMgbm90IHNldDxicj4KQ09ORklH
X0NHUk9VUF9QRVJGPXk8YnI+CkNPTkZJR19DR1JPVVBfQlBGPXk8YnI+CkNPTkZJR19DR1JPVVBf
REVCVUc9eTxicj4KQ09ORklHX1NPQ0tfQ0dST1VQX0RBVEE9eTxicj4KIyBDT05GSUdfTkFNRVNQ
QUNFUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0NIRURfQVVUT0dST1VQPXk8YnI+CiMgQ09ORklH
X1NZU0ZTX0RFUFJFQ0FURUQgaXMgbm90IHNldDxicj4KQ09ORklHX1JFTEFZPXk8YnI+CkNPTkZJ
R19CTEtfREVWX0lOSVRSRD15PGJyPgpDT05GSUdfSU5JVFJBTUZTX1NPVVJDRT0mcXVvdDsmcXVv
dDs8YnI+CkNPTkZJR19SRF9HWklQPXk8YnI+CiMgQ09ORklHX1JEX0JaSVAyIGlzIG5vdCBzZXQ8
YnI+CiMgQ09ORklHX1JEX0xaTUEgaXMgbm90IHNldDxicj4KQ09ORklHX1JEX1haPXk8YnI+CiMg
Q09ORklHX1JEX0xaTyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19SRF9MWjQgaXMgbm90IHNldDxi
cj4KIyBDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQ8YnI+CkNP
TkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRT15PGJyPgpDT05GSUdfU1lTQ1RMPXk8YnI+CkNPTkZJ
R19BTk9OX0lOT0RFUz15PGJyPgpDT05GSUdfSEFWRV9VSUQxNj15PGJyPgpDT05GSUdfU1lTQ1RM
X0VYQ0VQVElPTl9UUkFDRT15PGJyPgpDT05GSUdfSEFWRV9QQ1NQS1JfUExBVEZPUk09eTxicj4K
Q09ORklHX0JQRj15PGJyPgpDT05GSUdfRVhQRVJUPXk8YnI+CkNPTkZJR19VSUQxNj15PGJyPgpD
T05GSUdfTVVMVElVU0VSPXk8YnI+CiMgQ09ORklHX1NHRVRNQVNLX1NZU0NBTEwgaXMgbm90IHNl
dDxicj4KIyBDT05GSUdfU1lTRlNfU1lTQ0FMTCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TWVND
VExfU1lTQ0FMTCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfRkhBTkRMRT15PGJyPgojIENPTkZJR19Q
T1NJWF9USU1FUlMgaXMgbm90IHNldDxicj4KQ09ORklHX1BSSU5USz15PGJyPgpDT05GSUdfUFJJ
TlRLX05NST15PGJyPgpDT05GSUdfQlVHPXk8YnI+CiMgQ09ORklHX0VMRl9DT1JFIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19QQ1NQS1JfUExBVEZPUk09eTxicj4KIyBDT05GSUdfQkFTRV9GVUxMIGlz
IG5vdCBzZXQ8YnI+CkNPTkZJR19GVVRFWD15PGJyPgpDT05GSUdfRlVURVhfUEk9eTxicj4KQ09O
RklHX0VQT0xMPXk8YnI+CkNPTkZJR19TSUdOQUxGRD15PGJyPgpDT05GSUdfVElNRVJGRD15PGJy
PgojIENPTkZJR19FVkVOVEZEIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TSE1FTT15PGJyPgpDT05G
SUdfQUlPPXk8YnI+CkNPTkZJR19BRFZJU0VfU1lTQ0FMTFM9eTxicj4KQ09ORklHX01FTUJBUlJJ
RVI9eTxicj4KQ09ORklHX0NIRUNLUE9JTlRfUkVTVE9SRT15PGJyPgpDT05GSUdfS0FMTFNZTVM9
eTxicj4KQ09ORklHX0tBTExTWU1TX0FMTD15PGJyPgpDT05GSUdfS0FMTFNZTVNfQUJTT0xVVEVf
UEVSQ1BVPXk8YnI+CkNPTkZJR19LQUxMU1lNU19CQVNFX1JFTEFUSVZFPXk8YnI+CkNPTkZJR19C
UEZfU1lTQ0FMTD15PGJyPgpDT05GSUdfVVNFUkZBVUxURkQ9eTxicj4KQ09ORklHX0FSQ0hfSEFT
X01FTUJBUlJJRVJfU1lOQ19DT1JFPXk8YnI+CkNPTkZJR19SU0VRPXk8YnI+CkNPTkZJR19ERUJV
R19SU0VRPXk8YnI+CiMgQ09ORklHX0VNQkVEREVEIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19IQVZF
X1BFUkZfRVZFTlRTPXk8YnI+CkNPTkZJR19QQzEwND15PGJyPgo8YnI+CiM8YnI+CiMgS2VybmVs
IFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnM8YnI+CiM8YnI+CkNPTkZJR19QRVJGX0VW
RU5UUz15PGJyPgojIENPTkZJR19ERUJVR19QRVJGX1VTRV9WTUFMTE9DIGlzIG5vdCBzZXQ8YnI+
CkNPTkZJR19WTV9FVkVOVF9DT1VOVEVSUz15PGJyPgpDT05GSUdfQ09NUEFUX0JSSz15PGJyPgpD
T05GSUdfU0xBQj15PGJyPgojIENPTkZJR19TTFVCIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NM
T0IgaXMgbm90IHNldDxicj4KIyBDT05GSUdfU0xBQl9NRVJHRV9ERUZBVUxUIGlzIG5vdCBzZXQ8
YnI+CkNPTkZJR19TTEFCX0ZSRUVMSVNUX1JBTkRPTT15PGJyPgpDT05GSUdfUFJPRklMSU5HPXk8
YnI+CkNPTkZJR19DUkFTSF9DT1JFPXk8YnI+CkNPTkZJR19LRVhFQ19DT1JFPXk8YnI+CkNPTkZJ
R19PUFJPRklMRT1tPGJyPgojIENPTkZJR19PUFJPRklMRV9FVkVOVF9NVUxUSVBMRVggaXMgbm90
IHNldDxicj4KQ09ORklHX0hBVkVfT1BST0ZJTEU9eTxicj4KQ09ORklHX09QUk9GSUxFX05NSV9U
SU1FUj15PGJyPgpDT05GSUdfS1BST0JFUz15PGJyPgpDT05GSUdfSlVNUF9MQUJFTD15PGJyPgpD
T05GSUdfU1RBVElDX0tFWVNfU0VMRlRFU1Q9eTxicj4KQ09ORklHX09QVFBST0JFUz15PGJyPgpD
T05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUz15PGJyPgpDT05GSUdfQVJDSF9V
U0VfQlVJTFRJTl9CU1dBUD15PGJyPgpDT05GSUdfS1JFVFBST0JFUz15PGJyPgpDT05GSUdfSEFW
RV9JT1JFTUFQX1BST1Q9eTxicj4KQ09ORklHX0hBVkVfS1BST0JFUz15PGJyPgpDT05GSUdfSEFW
RV9LUkVUUFJPQkVTPXk8YnI+CkNPTkZJR19IQVZFX09QVFBST0JFUz15PGJyPgpDT05GSUdfSEFW
RV9LUFJPQkVTX09OX0ZUUkFDRT15PGJyPgpDT05GSUdfSEFWRV9GVU5DVElPTl9FUlJPUl9JTkpF
Q1RJT049eTxicj4KQ09ORklHX0hBVkVfTk1JPXk8YnI+CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VI
T09LPXk8YnI+CkNPTkZJR19IQVZFX0RNQV9DT05USUdVT1VTPXk8YnI+CkNPTkZJR19HRU5FUklD
X1NNUF9JRExFX1RIUkVBRD15PGJyPgpDT05GSUdfQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0U9eTxi
cj4KQ09ORklHX0FSQ0hfSEFTX1NFVF9NRU1PUlk9eTxicj4KQ09ORklHX0hBVkVfQVJDSF9USFJF
QURfU1RSVUNUX1dISVRFTElTVD15PGJyPgpDT05GSUdfQVJDSF9XQU5UU19EWU5BTUlDX1RBU0tf
U1RSVUNUPXk8YnI+CkNPTkZJR19IQVZFX1JFR1NfQU5EX1NUQUNLX0FDQ0VTU19BUEk9eTxicj4K
Q09ORklHX0hBVkVfUlNFUT15PGJyPgpDT05GSUdfSEFWRV9DTEs9eTxicj4KQ09ORklHX0hBVkVf
SFdfQlJFQUtQT0lOVD15PGJyPgpDT05GSUdfSEFWRV9NSVhFRF9CUkVBS1BPSU5UU19SRUdTPXk8
YnI+CkNPTkZJR19IQVZFX1VTRVJfUkVUVVJOX05PVElGSUVSPXk8YnI+CkNPTkZJR19IQVZFX1BF
UkZfRVZFTlRTX05NST15PGJyPgpDT05GSUdfSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkY9
eTxicj4KQ09ORklHX0hBVkVfUEVSRl9SRUdTPXk8YnI+CkNPTkZJR19IQVZFX1BFUkZfVVNFUl9T
VEFDS19EVU1QPXk8YnI+CkNPTkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15PGJyPgpDT05GSUdf
SEFWRV9SQ1VfVEFCTEVfRlJFRT15PGJyPgpDT05GSUdfQVJDSF9IQVZFX05NSV9TQUZFX0NNUFhD
SEc9eTxicj4KQ09ORklHX0hBVkVfQ01QWENIR19MT0NBTD15PGJyPgpDT05GSUdfSEFWRV9DTVBY
Q0hHX0RPVUJMRT15PGJyPgpDT05GSUdfQVJDSF9XQU5UX0NPTVBBVF9JUENfUEFSU0VfVkVSU0lP
Tj15PGJyPgpDT05GSUdfQVJDSF9XQU5UX09MRF9DT01QQVRfSVBDPXk8YnI+CkNPTkZJR19IQVZF
X0FSQ0hfU0VDQ09NUF9GSUxURVI9eTxicj4KQ09ORklHX1BMVUdJTl9IT1NUQ0M9JnF1b3Q7Zysr
JnF1b3Q7PGJyPgpDT05GSUdfSEFWRV9HQ0NfUExVR0lOUz15PGJyPgojIENPTkZJR19HQ0NfUExV
R0lOUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSEFWRV9TVEFDS1BST1RFQ1RPUj15PGJyPgpDT05G
SUdfQ0NfSEFTX1NUQUNLUFJPVEVDVE9SX05PTkU9eTxicj4KIyBDT05GSUdfU1RBQ0tQUk9URUNU
T1IgaXMgbm90IHNldDxicj4KQ09ORklHX0hBVkVfQVJDSF9XSVRISU5fU1RBQ0tfRlJBTUVTPXk8
YnI+CkNPTkZJR19IQVZFX0NPTlRFWFRfVFJBQ0tJTkc9eTxicj4KQ09ORklHX0hBVkVfVklSVF9D
UFVfQUNDT1VOVElOR19HRU49eTxicj4KQ09ORklHX0hBVkVfSVJRX1RJTUVfQUNDT1VOVElORz15
PGJyPgpDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFPXk8YnI+CkNPTkZJR19I
QVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVEPXk8YnI+CkNPTkZJR19IQVZFX0FSQ0hf
SFVHRV9WTUFQPXk8YnI+CkNPTkZJR19IQVZFX0FSQ0hfU09GVF9ESVJUWT15PGJyPgpDT05GSUdf
SEFWRV9NT0RfQVJDSF9TUEVDSUZJQz15PGJyPgpDT05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTEE9
eTxicj4KQ09ORklHX0hBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLPXk8YnI+CkNPTkZJR19BUkNI
X0hBU19FTEZfUkFORE9NSVpFPXk8YnI+CkNPTkZJR19IQVZFX0FSQ0hfTU1BUF9STkRfQklUUz15
PGJyPgpDT05GSUdfSEFWRV9FWElUX1RIUkVBRD15PGJyPgpDT05GSUdfQVJDSF9NTUFQX1JORF9C
SVRTPTI4PGJyPgpDT05GSUdfSEFWRV9BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTPXk8YnI+CkNP
TkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTPTg8YnI+CkNPTkZJR19IQVZFX0FSQ0hfQ09N
UEFUX01NQVBfQkFTRVM9eTxicj4KQ09ORklHX0hBVkVfQ09QWV9USFJFQURfVExTPXk8YnI+CkNP
TkZJR19IQVZFX1NUQUNLX1ZBTElEQVRJT049eTxicj4KQ09ORklHX0lTQV9CVVNfQVBJPXk8YnI+
CkNPTkZJR19PTERfU0lHU1VTUEVORDM9eTxicj4KQ09ORklHX0NPTVBBVF9PTERfU0lHQUNUSU9O
PXk8YnI+CkNPTkZJR19DT01QQVRfMzJCSVRfVElNRT15PGJyPgpDT05GSUdfSEFWRV9BUkNIX1ZN
QVBfU1RBQ0s9eTxicj4KQ09ORklHX1ZNQVBfU1RBQ0s9eTxicj4KQ09ORklHX0FSQ0hfSEFTX1NU
UklDVF9LRVJORUxfUldYPXk8YnI+CkNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWD15PGJyPgpDT05G
SUdfQVJDSF9IQVNfU1RSSUNUX01PRFVMRV9SV1g9eTxicj4KQ09ORklHX1NUUklDVF9NT0RVTEVf
UldYPXk8YnI+CkNPTkZJR19BUkNIX0hBU19SRUZDT1VOVD15PGJyPgojIENPTkZJR19SRUZDT1VO
VF9GVUxMIGlzIG5vdCBzZXQ8YnI+Cjxicj4KIzxicj4KIyBHQ09WLWJhc2VkIGtlcm5lbCBwcm9m
aWxpbmc8YnI+CiM8YnI+CkNPTkZJR19HQ09WX0tFUk5FTD15PGJyPgpDT05GSUdfQVJDSF9IQVNf
R0NPVl9QUk9GSUxFX0FMTD15PGJyPgojIENPTkZJR19HQ09WX1BST0ZJTEVfQUxMIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19HQ09WX0ZPUk1BVF80Xzc9eTxicj4KQ09ORklHX1JUX01VVEVYRVM9eTxi
cj4KQ09ORklHX0JBU0VfU01BTEw9MTxicj4KQ09ORklHX01PRFVMRVM9eTxicj4KQ09ORklHX01P
RFVMRV9GT1JDRV9MT0FEPXk8YnI+CkNPTkZJR19NT0RVTEVfVU5MT0FEPXk8YnI+CiMgQ09ORklH
X01PRFVMRV9GT1JDRV9VTkxPQUQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTU9EVkVSU0lPTlMg
aXMgbm90IHNldDxicj4KIyBDT05GSUdfTU9EVUxFX1NSQ1ZFUlNJT05fQUxMIGlzIG5vdCBzZXQ8
YnI+CiMgQ09ORklHX01PRFVMRV9TSUcgaXMgbm90IHNldDxicj4KQ09ORklHX01PRFVMRV9DT01Q
UkVTUz15PGJyPgojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUCBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfTU9EVUxFX0NPTVBSRVNTX1haPXk8YnI+CiMgQ09ORklHX1RSSU1fVU5VU0VEX0tTWU1T
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NT0RVTEVTX1RSRUVfTE9PS1VQPXk8YnI+CiMgQ09ORklH
X0JMT0NLIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QQURBVEE9eTxicj4KQ09ORklHX0FTTjE9eTxi
cj4KQ09ORklHX1VOSU5MSU5FX1NQSU5fVU5MT0NLPXk8YnI+CkNPTkZJR19BUkNIX1NVUFBPUlRT
X0FUT01JQ19STVc9eTxicj4KQ09ORklHX01VVEVYX1NQSU5fT05fT1dORVI9eTxicj4KQ09ORklH
X1JXU0VNX1NQSU5fT05fT1dORVI9eTxicj4KQ09ORklHX0xPQ0tfU1BJTl9PTl9PV05FUj15PGJy
PgpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLUz15PGJyPgpDT05GSUdfUVVFVUVEX1NQ
SU5MT0NLUz15PGJyPgpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1M9eTxicj4KQ09ORklH
X1FVRVVFRF9SV0xPQ0tTPXk8YnI+CkNPTkZJR19BUkNIX0hBU19TWU5DX0NPUkVfQkVGT1JFX1VT
RVJNT0RFPXk8YnI+CkNPTkZJR19BUkNIX0hBU19TWVNDQUxMX1dSQVBQRVI9eTxicj4KQ09ORklH
X0NDX0hBU19TQU5FX1NUQUNLUFJPVEVDVE9SPXk8YnI+CkNPTkZJR19GUkVFWkVSPXk8YnI+Cjxi
cj4KIzxicj4KIyBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXM8YnI+CiM8YnI+CiMgQ09ORklH
X1pPTkVfRE1BIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TTVA9eTxicj4KQ09ORklHX1g4Nl9GRUFU
VVJFX05BTUVTPXk8YnI+CiMgQ09ORklHX1g4Nl9YMkFQSUMgaXMgbm90IHNldDxicj4KQ09ORklH
X1g4Nl9NUFBBUlNFPXk8YnI+CkNPTkZJR19HT0xERklTSD15PGJyPgojIENPTkZJR19SRVRQT0xJ
TkUgaXMgbm90IHNldDxicj4KQ09ORklHX1g4Nl9FWFRFTkRFRF9QTEFURk9STT15PGJyPgpDT05G
SUdfWDg2X1ZTTVA9eTxicj4KIyBDT05GSUdfWDg2X0dPTERGSVNIIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX1g4Nl9JTlRFTF9NSUQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfWDg2X0lOVEVMX0xQ
U1MgaXMgbm90IHNldDxicj4KIyBDT05GSUdfWDg2X0FNRF9QTEFURk9STV9ERVZJQ0UgaXMgbm90
IHNldDxicj4KQ09ORklHX0lPU0ZfTUJJPXk8YnI+CkNPTkZJR19JT1NGX01CSV9ERUJVRz15PGJy
PgpDT05GSUdfWDg2X1NVUFBPUlRTX01FTU9SWV9GQUlMVVJFPXk8YnI+CiMgQ09ORklHX1NDSEVE
X09NSVRfRlJBTUVfUE9JTlRFUiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSFlQRVJWSVNPUl9HVUVT
VD15PGJyPgpDT05GSUdfUEFSQVZJUlQ9eTxicj4KQ09ORklHX1BBUkFWSVJUX0RFQlVHPXk8YnI+
CkNPTkZJR19QQVJBVklSVF9TUElOTE9DS1M9eTxicj4KQ09ORklHX1FVRVVFRF9MT0NLX1NUQVQ9
eTxicj4KQ09ORklHX1hFTj15PGJyPgpDT05GSUdfWEVOX1BWPXk8YnI+CkNPTkZJR19YRU5fUFZf
U01QPXk8YnI+CiMgQ09ORklHX1hFTl9ET00wIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19YRU5fUFZI
Vk09eTxicj4KQ09ORklHX1hFTl9QVkhWTV9TTVA9eTxicj4KQ09ORklHX1hFTl81MTJHQj15PGJy
PgpDT05GSUdfWEVOX1NBVkVfUkVTVE9SRT15PGJyPgojIENPTkZJR19YRU5fREVCVUdfRlMgaXMg
bm90IHNldDxicj4KQ09ORklHX1hFTl9QVkg9eTxicj4KQ09ORklHX0tWTV9HVUVTVD15PGJyPgoj
IENPTkZJR19LVk1fREVCVUdfRlMgaXMgbm90IHNldDxicj4KQ09ORklHX1BBUkFWSVJUX1RJTUVf
QUNDT1VOVElORz15PGJyPgpDT05GSUdfUEFSQVZJUlRfQ0xPQ0s9eTxicj4KIyBDT05GSUdfSkFJ
TEhPVVNFX0dVRVNUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19OT19CT09UTUVNPXk8YnI+CiMgQ09O
RklHX01LOCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19NUFNDIGlzIG5vdCBzZXQ8YnI+CiMgQ09O
RklHX01DT1JFMiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19NQVRPTSBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfR0VORVJJQ19DUFU9eTxicj4KQ09ORklHX1g4Nl9JTlRFUk5PREVfQ0FDSEVfU0hJRlQ9
MTI8YnI+CkNPTkZJR19YODZfTDFfQ0FDSEVfU0hJRlQ9Njxicj4KQ09ORklHX1g4Nl9UU0M9eTxi
cj4KQ09ORklHX1g4Nl9DTVBYQ0hHNjQ9eTxicj4KQ09ORklHX1g4Nl9DTU9WPXk8YnI+CkNPTkZJ
R19YODZfTUlOSU1VTV9DUFVfRkFNSUxZPTY0PGJyPgpDT05GSUdfWDg2X0RFQlVHQ1RMTVNSPXk8
YnI+CkNPTkZJR19QUk9DRVNTT1JfU0VMRUNUPXk8YnI+CiMgQ09ORklHX0NQVV9TVVBfSU5URUwg
aXMgbm90IHNldDxicj4KQ09ORklHX0NQVV9TVVBfQU1EPXk8YnI+CkNPTkZJR19DUFVfU1VQX0NF
TlRBVVI9eTxicj4KQ09ORklHX0hQRVRfVElNRVI9eTxicj4KQ09ORklHX0hQRVRfRU1VTEFURV9S
VEM9eTxicj4KIyBDT05GSUdfRE1JIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19HQVJUX0lPTU1VPXk8
YnI+CkNPTkZJR19DQUxHQVJZX0lPTU1VPXk8YnI+CiMgQ09ORklHX0NBTEdBUllfSU9NTVVfRU5B
QkxFRF9CWV9ERUZBVUxUIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX01BWFNNUCBpcyBub3Qgc2V0
PGJyPgpDT05GSUdfTlJfQ1BVU19SQU5HRV9CRUdJTj0yPGJyPgpDT05GSUdfTlJfQ1BVU19SQU5H
RV9FTkQ9NTEyPGJyPgpDT05GSUdfTlJfQ1BVU19ERUZBVUxUPTY0PGJyPgpDT05GSUdfTlJfQ1BV
Uz02NDxicj4KIyBDT05GSUdfU0NIRURfU01UIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TQ0hFRF9N
Qz15PGJyPgojIENPTkZJR19QUkVFTVBUX05PTkUgaXMgbm90IHNldDxicj4KIyBDT05GSUdfUFJF
RU1QVF9WT0xVTlRBUlkgaXMgbm90IHNldDxicj4KQ09ORklHX1BSRUVNUFQ9eTxicj4KQ09ORklH
X1BSRUVNUFRfQ09VTlQ9eTxicj4KQ09ORklHX1g4Nl9MT0NBTF9BUElDPXk8YnI+CkNPTkZJR19Y
ODZfSU9fQVBJQz15PGJyPgojIENPTkZJR19YODZfUkVST1VURV9GT1JfQlJPS0VOX0JPT1RfSVJR
UyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfWDg2X01DRT15PGJyPgojIENPTkZJR19YODZfTUNFTE9H
X0xFR0FDWSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19YODZfTUNFX0lOVEVMIGlzIG5vdCBzZXQ8
YnI+CkNPTkZJR19YODZfTUNFX0FNRD15PGJyPgpDT05GSUdfWDg2X01DRV9USFJFU0hPTEQ9eTxi
cj4KQ09ORklHX1g4Nl9NQ0VfSU5KRUNUPW08YnI+Cjxicj4KIzxicj4KIyBQZXJmb3JtYW5jZSBt
b25pdG9yaW5nPGJyPgojPGJyPgojIENPTkZJR19QRVJGX0VWRU5UU19BTURfUE9XRVIgaXMgbm90
IHNldDxicj4KQ09ORklHX1g4Nl8xNkJJVD15PGJyPgpDT05GSUdfWDg2X0VTUEZJWDY0PXk8YnI+
CkNPTkZJR19YODZfVlNZU0NBTExfRU1VTEFUSU9OPXk8YnI+CkNPTkZJR19JOEs9bTxicj4KIyBD
T05GSUdfTUlDUk9DT0RFIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19YODZfTVNSPXk8YnI+CkNPTkZJ
R19YODZfQ1BVSUQ9eTxicj4KIyBDT05GSUdfWDg2XzVMRVZFTCBpcyBub3Qgc2V0PGJyPgpDT05G
SUdfWDg2X0RJUkVDVF9HQlBBR0VTPXk8YnI+CkNPTkZJR19BUkNIX0hBU19NRU1fRU5DUllQVD15
PGJyPgpDT05GSUdfQU1EX01FTV9FTkNSWVBUPXk8YnI+CkNPTkZJR19BTURfTUVNX0VOQ1JZUFRf
QUNUSVZFX0JZX0RFRkFVTFQ9eTxicj4KQ09ORklHX0FSQ0hfVVNFX01FTVJFTUFQX1BST1Q9eTxi
cj4KIyBDT05GSUdfTlVNQSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5B
QkxFPXk8YnI+CkNPTkZJR19BUkNIX1NQQVJTRU1FTV9ERUZBVUxUPXk8YnI+CkNPTkZJR19BUkNI
X1NFTEVDVF9NRU1PUllfTU9ERUw9eTxicj4KQ09ORklHX0lMTEVHQUxfUE9JTlRFUl9WQUxVRT0w
eGRlYWQwMDAwMDAwMDAwMDA8YnI+CkNPTkZJR19TRUxFQ1RfTUVNT1JZX01PREVMPXk8YnI+CkNP
TkZJR19TUEFSU0VNRU1fTUFOVUFMPXk8YnI+CkNPTkZJR19TUEFSU0VNRU09eTxicj4KQ09ORklH
X0hBVkVfTUVNT1JZX1BSRVNFTlQ9eTxicj4KQ09ORklHX1NQQVJTRU1FTV9FWFRSRU1FPXk8YnI+
CkNPTkZJR19TUEFSU0VNRU1fVk1FTU1BUF9FTkFCTEU9eTxicj4KQ09ORklHX1NQQVJTRU1FTV9B
TExPQ19NRU1fTUFQX1RPR0VUSEVSPXk8YnI+CkNPTkZJR19TUEFSU0VNRU1fVk1FTU1BUD15PGJy
PgpDT05GSUdfSEFWRV9NRU1CTE9DSz15PGJyPgpDT05GSUdfSEFWRV9NRU1CTE9DS19OT0RFX01B
UD15PGJyPgpDT05GSUdfSEFWRV9HRU5FUklDX0dVUD15PGJyPgpDT05GSUdfQVJDSF9ESVNDQVJE
X01FTUJMT0NLPXk8YnI+CkNPTkZJR19NRU1PUllfSVNPTEFUSU9OPXk8YnI+CiMgQ09ORklHX01F
TU9SWV9IT1RQTFVHIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TUExJVF9QVExPQ0tfQ1BVUz00PGJy
PgpDT05GSUdfQVJDSF9FTkFCTEVfU1BMSVRfUE1EX1BUTE9DSz15PGJyPgojIENPTkZJR19DT01Q
QUNUSU9OIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QSFlTX0FERFJfVF82NEJJVD15PGJyPgpDT05G
SUdfVklSVF9UT19CVVM9eTxicj4KQ09ORklHX01NVV9OT1RJRklFUj15PGJyPgojIENPTkZJR19L
U00gaXMgbm90IHNldDxicj4KQ09ORklHX0RFRkFVTFRfTU1BUF9NSU5fQUREUj00MDk2PGJyPgpD
T05GSUdfQVJDSF9TVVBQT1JUU19NRU1PUllfRkFJTFVSRT15PGJyPgpDT05GSUdfTUVNT1JZX0ZB
SUxVUkU9eTxicj4KIyBDT05GSUdfSFdQT0lTT05fSU5KRUNUIGlzIG5vdCBzZXQ8YnI+CiMgQ09O
RklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19BUkNIX1dBTlRT
X1RIUF9TV0FQPXk8YnI+CiMgQ09ORklHX0NMRUFOQ0FDSEUgaXMgbm90IHNldDxicj4KIyBDT05G
SUdfQ01BIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX01FTV9TT0ZUX0RJUlRZIGlzIG5vdCBzZXQ8
YnI+CkNPTkZJR19aUE9PTD1tPGJyPgpDT05GSUdfWkJVRD1tPGJyPgpDT05GSUdfWjNGT0xEPW08
YnI+CkNPTkZJR19aU01BTExPQz15PGJyPgpDT05GSUdfUEdUQUJMRV9NQVBQSU5HPXk8YnI+CiMg
Q09ORklHX1pTTUFMTE9DX1NUQVQgaXMgbm90IHNldDxicj4KQ09ORklHX0dFTkVSSUNfRUFSTFlf
SU9SRU1BUD15PGJyPgojIENPTkZJR19ERUZFUlJFRF9TVFJVQ1RfUEFHRV9JTklUIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19JRExFX1BBR0VfVFJBQ0tJTkc9eTxicj4KQ09ORklHX0FSQ0hfSEFTX1pP
TkVfREVWSUNFPXk8YnI+CiMgQ09ORklHX1BFUkNQVV9TVEFUUyBpcyBub3Qgc2V0PGJyPgpDT05G
SUdfR1VQX0JFTkNITUFSSz15PGJyPgpDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUw9eTxicj4K
IyBDT05GSUdfWDg2X0NIRUNLX0JJT1NfQ09SUlVQVElPTiBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
WDg2X1JFU0VSVkVfTE9XPTY0PGJyPgpDT05GSUdfTVRSUj15PGJyPgpDT05GSUdfTVRSUl9TQU5J
VElaRVI9eTxicj4KQ09ORklHX01UUlJfU0FOSVRJWkVSX0VOQUJMRV9ERUZBVUxUPTA8YnI+CkNP
TkZJR19NVFJSX1NBTklUSVpFUl9TUEFSRV9SRUdfTlJfREVGQVVMVD0xPGJyPgojIENPTkZJR19Y
ODZfUEFUIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0FSQ0hfUkFORE9NIGlzIG5vdCBzZXQ8YnI+
CkNPTkZJR19YODZfU01BUD15PGJyPgojIENPTkZJR19FRkkgaXMgbm90IHNldDxicj4KIyBDT05G
SUdfU0VDQ09NUCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19IWl8xMDAgaXMgbm90IHNldDxicj4K
IyBDT05GSUdfSFpfMjUwIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19IWl8zMDA9eTxicj4KIyBDT05G
SUdfSFpfMTAwMCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSFo9MzAwPGJyPgpDT05GSUdfU0NIRURf
SFJUSUNLPXk8YnI+CkNPTkZJR19LRVhFQz15PGJyPgojIENPTkZJR19LRVhFQ19GSUxFIGlzIG5v
dCBzZXQ8YnI+CiMgQ09ORklHX0NSQVNIX0RVTVAgaXMgbm90IHNldDxicj4KQ09ORklHX1BIWVNJ
Q0FMX1NUQVJUPTB4MTAwMDAwMDxicj4KQ09ORklHX1JFTE9DQVRBQkxFPXk8YnI+CiMgQ09ORklH
X1JBTkRPTUlaRV9CQVNFIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QSFlTSUNBTF9BTElHTj0weDIw
MDAwMDxicj4KQ09ORklHX0hPVFBMVUdfQ1BVPXk8YnI+CkNPTkZJR19CT09UUEFSQU1fSE9UUExV
R19DUFUwPXk8YnI+CkNPTkZJR19ERUJVR19IT1RQTFVHX0NQVTA9eTxicj4KIyBDT05GSUdfQ09N
UEFUX1ZEU08gaXMgbm90IHNldDxicj4KQ09ORklHX0xFR0FDWV9WU1lTQ0FMTF9FTVVMQVRFPXk8
YnI+CiMgQ09ORklHX0xFR0FDWV9WU1lTQ0FMTF9OT05FIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklH
X0NNRExJTkVfQk9PTCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTU9ESUZZX0xEVF9TWVNDQUxMPXk8
YnI+CkNPTkZJR19IQVZFX0xJVkVQQVRDSD15PGJyPgpDT05GSUdfQVJDSF9IQVNfQUREX1BBR0VT
PXk8YnI+CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllfSE9UUExVRz15PGJyPgo8YnI+CiM8YnI+
CiMgUG93ZXIgbWFuYWdlbWVudCBhbmQgQUNQSSBvcHRpb25zPGJyPgojPGJyPgojIENPTkZJR19T
VVNQRU5EIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ISUJFUk5BVEVfQ0FMTEJBQ0tTPXk8YnI+CkNP
TkZJR19QTV9TTEVFUD15PGJyPgpDT05GSUdfUE1fU0xFRVBfU01QPXk8YnI+CkNPTkZJR19QTV9B
VVRPU0xFRVA9eTxicj4KIyBDT05GSUdfUE1fV0FLRUxPQ0tTIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19QTT15PGJyPgojIENPTkZJR19QTV9ERUJVRyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUE1fQ0xL
PXk8YnI+CiMgQ09ORklHX1dRX1BPV0VSX0VGRklDSUVOVF9ERUZBVUxUIGlzIG5vdCBzZXQ8YnI+
CkNPTkZJR19BQ1BJPXk8YnI+CkNPTkZJR19BQ1BJX0xFR0FDWV9UQUJMRVNfTE9PS1VQPXk8YnI+
CkNPTkZJR19BUkNIX01JR0hUX0hBVkVfQUNQSV9QREM9eTxicj4KQ09ORklHX0FDUElfU1lTVEVN
X1BPV0VSX1NUQVRFU19TVVBQT1JUPXk8YnI+CkNPTkZJR19BQ1BJX0RFQlVHR0VSPXk8YnI+CkNP
TkZJR19BQ1BJX0RFQlVHR0VSX1VTRVI9eTxicj4KQ09ORklHX0FDUElfU1BDUl9UQUJMRT15PGJy
PgpDT05GSUdfQUNQSV9MUElUPXk8YnI+CiMgQ09ORklHX0FDUElfUFJPQ0ZTX1BPV0VSIGlzIG5v
dCBzZXQ8YnI+CiMgQ09ORklHX0FDUElfUkVWX09WRVJSSURFX1BPU1NJQkxFIGlzIG5vdCBzZXQ8
YnI+CkNPTkZJR19BQ1BJX0VDX0RFQlVHRlM9bTxicj4KIyBDT05GSUdfQUNQSV9BQyBpcyBub3Qg
c2V0PGJyPgpDT05GSUdfQUNQSV9CQVRURVJZPW08YnI+CkNPTkZJR19BQ1BJX0JVVFRPTj1tPGJy
PgpDT05GSUdfQUNQSV9WSURFTz1tPGJyPgpDT05GSUdfQUNQSV9GQU49bTxicj4KQ09ORklHX0FD
UElfVEFEPXk8YnI+CiMgQ09ORklHX0FDUElfRE9DSyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfQUNQ
SV9QUk9DRVNTT1JfQ1NUQVRFPXk8YnI+CiMgQ09ORklHX0FDUElfUFJPQ0VTU09SIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19BQ1BJX0lQTUk9bTxicj4KQ09ORklHX0FDUElfQ1VTVE9NX0RTRFRfRklM
RT0mcXVvdDsmcXVvdDs8YnI+CkNPTkZJR19BUkNIX0hBU19BQ1BJX1RBQkxFX1VQR1JBREU9eTxi
cj4KQ09ORklHX0FDUElfVEFCTEVfVVBHUkFERT15PGJyPgpDT05GSUdfQUNQSV9ERUJVRz15PGJy
PgojIENPTkZJR19BQ1BJX1BDSV9TTE9UIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19BQ1BJX0NPTlRB
SU5FUj15PGJyPgpDT05GSUdfQUNQSV9IT1RQTFVHX0lPQVBJQz15PGJyPgpDT05GSUdfQUNQSV9T
QlM9eTxicj4KQ09ORklHX0FDUElfSEVEPW08YnI+CkNPTkZJR19BQ1BJX0NVU1RPTV9NRVRIT0Q9
eTxicj4KIyBDT05GSUdfQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkgaXMgbm90IHNldDxicj4K
Q09ORklHX0hBVkVfQUNQSV9BUEVJPXk8YnI+CkNPTkZJR19IQVZFX0FDUElfQVBFSV9OTUk9eTxi
cj4KIyBDT05GSUdfQUNQSV9BUEVJIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19EUFRGX1BPV0VSPW08
YnI+CkNPTkZJR19BQ1BJX0VYVExPRz1tPGJyPgpDT05GSUdfUE1JQ19PUFJFR0lPTj15PGJyPgoj
IENPTkZJR19CWFRfV0NfUE1JQ19PUFJFR0lPTiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfQ0hUX0RD
X1RJX1BNSUNfT1BSRUdJT049eTxicj4KQ09ORklHX0FDUElfQ09ORklHRlM9bTxicj4KQ09ORklH
X1g4Nl9QTV9USU1FUj15PGJyPgpDT05GSUdfU0ZJPXk8YnI+Cjxicj4KIzxicj4KIyBDUFUgRnJl
cXVlbmN5IHNjYWxpbmc8YnI+CiM8YnI+CiMgQ09ORklHX0NQVV9GUkVRIGlzIG5vdCBzZXQ8YnI+
Cjxicj4KIzxicj4KIyBDUFUgSWRsZTxicj4KIzxicj4KIyBDT05GSUdfQ1BVX0lETEUgaXMgbm90
IHNldDxicj4KPGJyPgojPGJyPgojIEJ1cyBvcHRpb25zIChQQ0kgZXRjLik8YnI+CiM8YnI+CkNP
TkZJR19QQ0k9eTxicj4KQ09ORklHX1BDSV9ESVJFQ1Q9eTxicj4KIyBDT05GSUdfUENJX01NQ09O
RklHIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QQ0lfWEVOPXk8YnI+CkNPTkZJR19QQ0lfRE9NQUlO
Uz15PGJyPgojIENPTkZJR19QQ0lfQ05CMjBMRV9RVUlSSyBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
UENJRVBPUlRCVVM9eTxicj4KQ09ORklHX1BDSUVBRVI9eTxicj4KQ09ORklHX1BDSUVBRVJfSU5K
RUNUPXk8YnI+CkNPTkZJR19QQ0lFX0VDUkM9eTxicj4KQ09ORklHX1BDSUVBU1BNPXk8YnI+CiMg
Q09ORklHX1BDSUVBU1BNX0RFQlVHIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QQ0lFQVNQTV9ERUZB
VUxUPXk8YnI+CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSU0FWRSBpcyBub3Qgc2V0PGJyPgojIENP
TkZJR19QQ0lFQVNQTV9QT1dFUl9TVVBFUlNBVkUgaXMgbm90IHNldDxicj4KIyBDT05GSUdfUENJ
RUFTUE1fUEVSRk9STUFOQ0UgaXMgbm90IHNldDxicj4KQ09ORklHX1BDSUVfUE1FPXk8YnI+CkNP
TkZJR19QQ0lFX0RQQz15PGJyPgojIENPTkZJR19QQ0lFX1BUTSBpcyBub3Qgc2V0PGJyPgojIENP
TkZJR19QQ0lfTVNJIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QQ0lfUVVJUktTPXk8YnI+CiMgQ09O
RklHX1BDSV9ERUJVRyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19QQ0lfUkVBTExPQ19FTkFCTEVf
QVVUTyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUENJX1NUVUI9eTxicj4KIyBDT05GSUdfUENJX1BG
X1NUVUIgaXMgbm90IHNldDxicj4KQ09ORklHX1hFTl9QQ0lERVZfRlJPTlRFTkQ9eTxicj4KQ09O
RklHX1BDSV9BVFM9eTxicj4KQ09ORklHX1BDSV9MT0NLTEVTU19DT05GSUc9eTxicj4KQ09ORklH
X1BDSV9JT1Y9eTxicj4KIyBDT05GSUdfUENJX1BSSSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19Q
Q0lfUEFTSUQgaXMgbm90IHNldDxicj4KQ09ORklHX1BDSV9MQUJFTD15PGJyPgojIENPTkZJR19I
T1RQTFVHX1BDSSBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgUENJIGNvbnRyb2xsZXIgZHJp
dmVyczxicj4KIzxicj4KPGJyPgojPGJyPgojIENhZGVuY2UgUENJZSBjb250cm9sbGVycyBzdXBw
b3J0PGJyPgojPGJyPgojIENPTkZJR19QQ0lFX0NBREVOQ0VfSE9TVCBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19QQ0lFX0NBREVOQ0VfRVAgaXMgbm90IHNldDxicj4KQ09ORklHX1BDSV9GVFBDSTEw
MD15PGJyPgojIENPTkZJR19QQ0lfSE9TVF9HRU5FUklDIGlzIG5vdCBzZXQ8YnI+Cjxicj4KIzxi
cj4KIyBEZXNpZ25XYXJlIFBDSSBDb3JlIFN1cHBvcnQ8YnI+CiM8YnI+Cjxicj4KIzxicj4KIyBQ
Q0kgRW5kcG9pbnQ8YnI+CiM8YnI+CkNPTkZJR19QQ0lfRU5EUE9JTlQ9eTxicj4KQ09ORklHX1BD
SV9FTkRQT0lOVF9DT05GSUdGUz15PGJyPgojIENPTkZJR19QQ0lfRVBGX1RFU1QgaXMgbm90IHNl
dDxicj4KPGJyPgojPGJyPgojIFBDSSBzd2l0Y2ggY29udHJvbGxlciBkcml2ZXJzPGJyPgojPGJy
PgojIENPTkZJR19QQ0lfU1dfU1dJVENIVEVDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0lTQV9C
VVMgaXMgbm90IHNldDxicj4KIyBDT05GSUdfSVNBX0RNQV9BUEkgaXMgbm90IHNldDxicj4KQ09O
RklHX0FNRF9OQj15PGJyPgpDT05GSUdfUENDQVJEPW08YnI+CkNPTkZJR19QQ01DSUE9bTxicj4K
Q09ORklHX1BDTUNJQV9MT0FEX0NJUz15PGJyPgojIENPTkZJR19DQVJEQlVTIGlzIG5vdCBzZXQ8
YnI+Cjxicj4KIzxicj4KIyBQQy1jYXJkIGJyaWRnZXM8YnI+CiM8YnI+CiMgQ09ORklHX1lFTlRB
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1BENjcyOSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSTgy
MDkyPW08YnI+CkNPTkZJR19QQ0NBUkRfTk9OU1RBVElDPXk8YnI+CiMgQ09ORklHX1JBUElESU8g
aXMgbm90IHNldDxicj4KQ09ORklHX1g4Nl9TWVNGQj15PGJyPgo8YnI+CiM8YnI+CiMgRXhlY3V0
YWJsZSBmaWxlIGZvcm1hdHMgLyBFbXVsYXRpb25zPGJyPgojPGJyPgpDT05GSUdfQklORk1UX0VM
Rj15PGJyPgpDT05GSUdfQ09NUEFUX0JJTkZNVF9FTEY9eTxicj4KQ09ORklHX0VMRkNPUkU9eTxi
cj4KQ09ORklHX0JJTkZNVF9TQ1JJUFQ9eTxicj4KQ09ORklHX0JJTkZNVF9NSVNDPW08YnI+CkNP
TkZJR19DT1JFRFVNUD15PGJyPgpDT05GSUdfSUEzMl9FTVVMQVRJT049eTxicj4KQ09ORklHX0lB
MzJfQU9VVD1tPGJyPgojIENPTkZJR19YODZfWDMyIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19DT01Q
QVRfMzI9eTxicj4KQ09ORklHX0NPTVBBVD15PGJyPgpDT05GSUdfQ09NUEFUX0ZPUl9VNjRfQUxJ
R05NRU5UPXk8YnI+CkNPTkZJR19YODZfREVWX0RNQV9PUFM9eTxicj4KQ09ORklHX05FVD15PGJy
Pgo8YnI+CiM8YnI+CiMgTmV0d29ya2luZyBvcHRpb25zPGJyPgojPGJyPgojIENPTkZJR19QQUNL
RVQgaXMgbm90IHNldDxicj4KQ09ORklHX1VOSVg9eTxicj4KIyBDT05GSUdfVU5JWF9ESUFHIGlz
IG5vdCBzZXQ8YnI+CiMgQ09ORklHX1RMUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfWEZSTT15PGJy
PgojIENPTkZJR19YRlJNX1VTRVIgaXMgbm90IHNldDxicj4KIyBDT05GSUdfWEZSTV9TVUJfUE9M
SUNZIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1hGUk1fTUlHUkFURSBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19YRlJNX1NUQVRJU1RJQ1MgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTkVUX0tFWSBp
cyBub3Qgc2V0PGJyPgojIENPTkZJR19YRFBfU09DS0VUUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
SU5FVD15PGJyPgojIENPTkZJR19JUF9NVUxUSUNBU1QgaXMgbm90IHNldDxicj4KIyBDT05GSUdf
SVBfQURWQU5DRURfUk9VVEVSIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JUF9QTlA9eTxicj4KQ09O
RklHX0lQX1BOUF9ESENQPXk8YnI+CiMgQ09ORklHX0lQX1BOUF9CT09UUCBpcyBub3Qgc2V0PGJy
PgojIENPTkZJR19JUF9QTlBfUkFSUCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19ORVRfSVBJUCBp
cyBub3Qgc2V0PGJyPgojIENPTkZJR19ORVRfSVBHUkVfREVNVVggaXMgbm90IHNldDxicj4KQ09O
RklHX05FVF9JUF9UVU5ORUw9eTxicj4KIyBDT05GSUdfU1lOX0NPT0tJRVMgaXMgbm90IHNldDxi
cj4KIyBDT05GSUdfTkVUX0lQVlRJIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05FVF9GT1UgaXMg
bm90IHNldDxicj4KIyBDT05GSUdfTkVUX0ZPVV9JUF9UVU5ORUxTIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX0lORVRfQUggaXMgbm90IHNldDxicj4KIyBDT05GSUdfSU5FVF9FU1AgaXMgbm90IHNl
dDxicj4KIyBDT05GSUdfSU5FVF9JUENPTVAgaXMgbm90IHNldDxicj4KQ09ORklHX0lORVRfVFVO
TkVMPXk8YnI+CkNPTkZJR19JTkVUX1hGUk1fTU9ERV9UUkFOU1BPUlQ9eTxicj4KQ09ORklHX0lO
RVRfWEZSTV9NT0RFX1RVTk5FTD15PGJyPgpDT05GSUdfSU5FVF9YRlJNX01PREVfQkVFVD15PGJy
PgpDT05GSUdfSU5FVF9ESUFHPXk8YnI+CkNPTkZJR19JTkVUX1RDUF9ESUFHPXk8YnI+CiMgQ09O
RklHX0lORVRfVURQX0RJQUcgaXMgbm90IHNldDxicj4KIyBDT05GSUdfSU5FVF9SQVdfRElBRyBp
cyBub3Qgc2V0PGJyPgojIENPTkZJR19JTkVUX0RJQUdfREVTVFJPWSBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19UQ1BfQ09OR19BRFZBTkNFRCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfVENQX0NPTkdf
Q1VCSUM9eTxicj4KQ09ORklHX0RFRkFVTFRfVENQX0NPTkc9JnF1b3Q7Y3ViaWMmcXVvdDs8YnI+
CiMgQ09ORklHX1RDUF9NRDVTSUcgaXMgbm90IHNldDxicj4KQ09ORklHX0lQVjY9eTxicj4KIyBD
T05GSUdfSVBWNl9ST1VURVJfUFJFRiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JUFY2X09QVElN
SVNUSUNfREFEIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0lORVQ2X0FIIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX0lORVQ2X0VTUCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JTkVUNl9JUENPTVAg
aXMgbm90IHNldDxicj4KIyBDT05GSUdfSVBWNl9NSVA2IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19J
TkVUNl9YRlJNX01PREVfVFJBTlNQT1JUPXk8YnI+CkNPTkZJR19JTkVUNl9YRlJNX01PREVfVFVO
TkVMPXk8YnI+CkNPTkZJR19JTkVUNl9YRlJNX01PREVfQkVFVD15PGJyPgojIENPTkZJR19JTkVU
Nl9YRlJNX01PREVfUk9VVEVPUFRJTUlaQVRJT04gaXMgbm90IHNldDxicj4KIyBDT05GSUdfSVBW
Nl9WVEkgaXMgbm90IHNldDxicj4KQ09ORklHX0lQVjZfU0lUPXk8YnI+CiMgQ09ORklHX0lQVjZf
U0lUXzZSRCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSVBWNl9ORElTQ19OT0RFVFlQRT15PGJyPgoj
IENPTkZJR19JUFY2X1RVTk5FTCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JUFY2X01VTFRJUExF
X1RBQkxFUyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JUFY2X01ST1VURSBpcyBub3Qgc2V0PGJy
PgojIENPTkZJR19JUFY2X1NFRzZfTFdUVU5ORUwgaXMgbm90IHNldDxicj4KIyBDT05GSUdfSVBW
Nl9TRUc2X0hNQUMgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTkVUV09SS19TRUNNQVJLIGlzIG5v
dCBzZXQ8YnI+CiMgQ09ORklHX05FVFdPUktfUEhZX1RJTUVTVEFNUElORyBpcyBub3Qgc2V0PGJy
PgojIENPTkZJR19ORVRGSUxURVIgaXMgbm90IHNldDxicj4KIyBDT05GSUdfQlBGSUxURVIgaXMg
bm90IHNldDxicj4KIyBDT05GSUdfSVBfRENDUCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JUF9T
Q1RQIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1JEUyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19U
SVBDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0FUTSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19M
MlRQIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0JSSURHRSBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
SEFWRV9ORVRfRFNBPXk8YnI+CiMgQ09ORklHX05FVF9EU0EgaXMgbm90IHNldDxicj4KIyBDT05G
SUdfVkxBTl84MDIxUSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19ERUNORVQgaXMgbm90IHNldDxi
cj4KIyBDT05GSUdfTExDMiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19BVEFMSyBpcyBub3Qgc2V0
PGJyPgojIENPTkZJR19YMjUgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTEFQQiBpcyBub3Qgc2V0
PGJyPgojIENPTkZJR19QSE9ORVQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfNkxPV1BBTiBpcyBu
b3Qgc2V0PGJyPgojIENPTkZJR19JRUVFODAyMTU0IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05F
VF9TQ0hFRCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19EQ0IgaXMgbm90IHNldDxicj4KQ09ORklH
X0ROU19SRVNPTFZFUj1tPGJyPgojIENPTkZJR19CQVRNQU5fQURWIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX09QRU5WU1dJVENIIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1ZTT0NLRVRTIGlzIG5v
dCBzZXQ8YnI+CiMgQ09ORklHX05FVExJTktfRElBRyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19N
UExTIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05FVF9OU0ggaXMgbm90IHNldDxicj4KIyBDT05G
SUdfSFNSIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05FVF9TV0lUQ0hERVYgaXMgbm90IHNldDxi
cj4KIyBDT05GSUdfTkVUX0wzX01BU1RFUl9ERVYgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTkVU
X05DU0kgaXMgbm90IHNldDxicj4KQ09ORklHX1JQUz15PGJyPgpDT05GSUdfUkZTX0FDQ0VMPXk8
YnI+CkNPTkZJR19YUFM9eTxicj4KIyBDT05GSUdfQ0dST1VQX05FVF9QUklPIGlzIG5vdCBzZXQ8
YnI+CiMgQ09ORklHX0NHUk9VUF9ORVRfQ0xBU1NJRCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVU
X1JYX0JVU1lfUE9MTD15PGJyPgpDT05GSUdfQlFMPXk8YnI+CiMgQ09ORklHX0JQRl9KSVQgaXMg
bm90IHNldDxicj4KIyBDT05GSUdfQlBGX1NUUkVBTV9QQVJTRVIgaXMgbm90IHNldDxicj4KQ09O
RklHX05FVF9GTE9XX0xJTUlUPXk8YnI+Cjxicj4KIzxicj4KIyBOZXR3b3JrIHRlc3Rpbmc8YnI+
CiM8YnI+CiMgQ09ORklHX05FVF9QS1RHRU4gaXMgbm90IHNldDxicj4KIyBDT05GSUdfSEFNUkFE
SU8gaXMgbm90IHNldDxicj4KIyBDT05GSUdfQ0FOIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0JU
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0FGX1JYUlBDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklH
X0FGX0tDTSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfV0lSRUxFU1M9eTxicj4KIyBDT05GSUdfQ0ZH
ODAyMTEgaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIENGRzgwMjExIG5lZWRzIHRvIGJlIGVu
YWJsZWQgZm9yIE1BQzgwMjExPGJyPgojPGJyPgpDT05GSUdfTUFDODAyMTFfU1RBX0hBU0hfTUFY
X1NJWkU9MDxicj4KIyBDT05GSUdfV0lNQVggaXMgbm90IHNldDxicj4KIyBDT05GSUdfUkZLSUxM
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05FVF85UCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19D
QUlGIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0NFUEhfTElCIGlzIG5vdCBzZXQ8YnI+CiMgQ09O
RklHX05GQyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19QU0FNUExFIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX05FVF9JRkUgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTFdUVU5ORUwgaXMgbm90IHNl
dDxicj4KQ09ORklHX0RTVF9DQUNIRT15PGJyPgpDT05GSUdfR1JPX0NFTExTPXk8YnI+CiMgQ09O
RklHX05FVF9ERVZMSU5LIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NQVlfVVNFX0RFVkxJTks9eTxi
cj4KIyBDT05GSUdfRkFJTE9WRVIgaXMgbm90IHNldDxicj4KQ09ORklHX0hBVkVfRUJQRl9KSVQ9
eTxicj4KPGJyPgojPGJyPgojIERldmljZSBEcml2ZXJzPGJyPgojPGJyPgo8YnI+CiM8YnI+CiMg
R2VuZXJpYyBEcml2ZXIgT3B0aW9uczxicj4KIzxicj4KIyBDT05GSUdfVUVWRU5UX0hFTFBFUiBp
cyBub3Qgc2V0PGJyPgpDT05GSUdfREVWVE1QRlM9eTxicj4KIyBDT05GSUdfREVWVE1QRlNfTU9V
TlQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfU1RBTkRBTE9ORSBpcyBub3Qgc2V0PGJyPgojIENP
TkZJR19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEIGlzIG5vdCBzZXQ8YnI+Cjxicj4KIzxicj4KIyBG
aXJtd2FyZSBsb2FkZXI8YnI+CiM8YnI+CkNPTkZJR19GV19MT0FERVI9eTxicj4KQ09ORklHX0VY
VFJBX0ZJUk1XQVJFPSZxdW90OyZxdW90Ozxicj4KQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBF
Uj15PGJyPgpDT05GSUdfRldfTE9BREVSX1VTRVJfSEVMUEVSX0ZBTExCQUNLPXk8YnI+CkNPTkZJ
R19BTExPV19ERVZfQ09SRURVTVA9eTxicj4KIyBDT05GSUdfREVCVUdfRFJJVkVSIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19ERUJVR19ERVZSRVM9eTxicj4KIyBDT05GSUdfREVCVUdfVEVTVF9EUklW
RVJfUkVNT1ZFIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19URVNUX0FTWU5DX0RSSVZFUl9QUk9CRT1t
PGJyPgpDT05GSUdfU1lTX0hZUEVSVklTT1I9eTxicj4KQ09ORklHX0dFTkVSSUNfQ1BVX0FVVE9Q
Uk9CRT15PGJyPgpDT05GSUdfR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTPXk8YnI+CkNPTkZJ
R19SRUdNQVA9eTxicj4KQ09ORklHX1JFR01BUF9JMkM9bTxicj4KQ09ORklHX1JFR01BUF9TUE1J
PW08YnI+CkNPTkZJR19SRUdNQVBfVzE9eTxicj4KQ09ORklHX1JFR01BUF9NTUlPPXk8YnI+CkNP
TkZJR19SRUdNQVBfSVJRPXk8YnI+CkNPTkZJR19ETUFfU0hBUkVEX0JVRkZFUj15PGJyPgpDT05G
SUdfRE1BX0ZFTkNFX1RSQUNFPXk8YnI+Cjxicj4KIzxicj4KIyBCdXMgZGV2aWNlczxicj4KIzxi
cj4KQ09ORklHX1NJTVBMRV9QTV9CVVM9bTxicj4KIyBDT05GSUdfQ09OTkVDVE9SIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19NVEQ9eTxicj4KQ09ORklHX01URF9URVNUUz1tPGJyPgpDT05GSUdfTVRE
X1JFREJPT1RfUEFSVFM9eTxicj4KQ09ORklHX01URF9SRURCT09UX0RJUkVDVE9SWV9CTE9DSz0t
MTxicj4KQ09ORklHX01URF9SRURCT09UX1BBUlRTX1VOQUxMT0NBVEVEPXk8YnI+CkNPTkZJR19N
VERfUkVEQk9PVF9QQVJUU19SRUFET05MWT15PGJyPgpDT05GSUdfTVREX0NNRExJTkVfUEFSVFM9
eTxicj4KQ09ORklHX01URF9PRl9QQVJUUz15PGJyPgpDT05GSUdfTVREX0FSN19QQVJUUz1tPGJy
Pgo8YnI+CiM8YnI+CiMgUGFydGl0aW9uIHBhcnNlcnM8YnI+CiM8YnI+Cjxicj4KIzxicj4KIyBV
c2VyIE1vZHVsZXMgQW5kIFRyYW5zbGF0aW9uIExheWVyczxicj4KIzxicj4KIyBDT05GSUdfTVRE
X09PUFMgaXMgbm90IHNldDxicj4KQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI9eTxicj4K
PGJyPgojPGJyPgojIFJBTS9ST00vRmxhc2ggY2hpcCBkcml2ZXJzPGJyPgojPGJyPgpDT05GSUdf
TVREX0NGST1tPGJyPgpDT05GSUdfTVREX0pFREVDUFJPQkU9eTxicj4KQ09ORklHX01URF9HRU5f
UFJPQkU9eTxicj4KQ09ORklHX01URF9DRklfQURWX09QVElPTlM9eTxicj4KIyBDT05GSUdfTVRE
X0NGSV9OT1NXQVAgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTVREX0NGSV9CRV9CWVRFX1NXQVAg
aXMgbm90IHNldDxicj4KQ09ORklHX01URF9DRklfTEVfQllURV9TV0FQPXk8YnI+CiMgQ09ORklH
X01URF9DRklfR0VPTUVUUlkgaXMgbm90IHNldDxicj4KQ09ORklHX01URF9NQVBfQkFOS19XSURU
SF8xPXk8YnI+CkNPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfMj15PGJyPgpDT05GSUdfTVREX01B
UF9CQU5LX1dJRFRIXzQ9eTxicj4KQ09ORklHX01URF9DRklfSTE9eTxicj4KQ09ORklHX01URF9D
RklfSTI9eTxicj4KQ09ORklHX01URF9PVFA9eTxicj4KIyBDT05GSUdfTVREX0NGSV9JTlRFTEVY
VCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTVREX0NGSV9BTURTVEQ9eTxicj4KQ09ORklHX01URF9D
RklfU1RBQT1tPGJyPgpDT05GSUdfTVREX0NGSV9VVElMPXk8YnI+CkNPTkZJR19NVERfUkFNPXk8
YnI+CkNPTkZJR19NVERfUk9NPW08YnI+CkNPTkZJR19NVERfQUJTRU5UPXk8YnI+Cjxicj4KIzxi
cj4KIyBNYXBwaW5nIGRyaXZlcnMgZm9yIGNoaXAgYWNjZXNzPGJyPgojPGJyPgojIENPTkZJR19N
VERfQ09NUExFWF9NQVBQSU5HUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTVREX1BIWVNNQVA9bTxi
cj4KIyBDT05GSUdfTVREX1BIWVNNQVBfQ09NUEFUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NVERf
UEhZU01BUF9PRj1tPGJyPgpDT05GSUdfTVREX1BIWVNNQVBfT0ZfVkVSU0FUSUxFPXk8YnI+CiMg
Q09ORklHX01URF9QSFlTTUFQX09GX0dFTUlOSSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTVREX0FN
RDc2WFJPTT15PGJyPgojIENPTkZJR19NVERfSUNIWFJPTSBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
TVREX0VTQjJST009bTxicj4KIyBDT05GSUdfTVREX0NLODA0WFJPTSBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfTVREX1NDQjJfRkxBU0g9eTxicj4KQ09ORklHX01URF9ORVR0ZWw9bTxicj4KIyBDT05G
SUdfTVREX0w0NDBHWCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTVREX0lOVEVMX1ZSX05PUj15PGJy
PgojIENPTkZJR19NVERfUExBVFJBTSBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgU2VsZi1j
b250YWluZWQgTVREIGRldmljZSBkcml2ZXJzPGJyPgojPGJyPgpDT05GSUdfTVREX1BNQzU1MT15
PGJyPgojIENPTkZJR19NVERfUE1DNTUxX0JVR0ZJWCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTVRE
X1BNQzU1MV9ERUJVRz15PGJyPgpDT05GSUdfTVREX1NMUkFNPXk8YnI+CkNPTkZJR19NVERfUEhS
QU09eTxicj4KQ09ORklHX01URF9NVERSQU09eTxicj4KQ09ORklHX01URFJBTV9UT1RBTF9TSVpF
PTQwOTY8YnI+CkNPTkZJR19NVERSQU1fRVJBU0VfU0laRT0xMjg8YnI+Cjxicj4KIzxicj4KIyBE
aXNrLU9uLUNoaXAgRGV2aWNlIERyaXZlcnM8YnI+CiM8YnI+CiMgQ09ORklHX01URF9ET0NHMyBp
cyBub3Qgc2V0PGJyPgpDT05GSUdfTVREX09ORU5BTkQ9eTxicj4KIyBDT05GSUdfTVREX09ORU5B
TkRfVkVSSUZZX1dSSVRFIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX01URF9PTkVOQU5EX0dFTkVS
SUMgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTVREX09ORU5BTkRfT1RQIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX01URF9PTkVOQU5EXzJYX1BST0dSQU0gaXMgbm90IHNldDxicj4KIyBDT05GSUdf
TVREX05BTkQgaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIExQRERSICZhbXA7IExQRERSMiBQ
Q00gbWVtb3J5IGRyaXZlcnM8YnI+CiM8YnI+CkNPTkZJR19NVERfTFBERFI9eTxicj4KQ09ORklH
X01URF9RSU5GT19QUk9CRT15PGJyPgojIENPTkZJR19NVERfU1BJX05PUiBpcyBub3Qgc2V0PGJy
PgpDT05GSUdfTVREX1VCST1tPGJyPgpDT05GSUdfTVREX1VCSV9XTF9USFJFU0hPTEQ9NDA5Njxi
cj4KQ09ORklHX01URF9VQklfQkVCX0xJTUlUPTIwPGJyPgojIENPTkZJR19NVERfVUJJX0ZBU1RN
QVAgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTVREX1VCSV9HTFVFQkkgaXMgbm90IHNldDxicj4K
Q09ORklHX0RUQz15PGJyPgpDT05GSUdfT0Y9eTxicj4KIyBDT05GSUdfT0ZfVU5JVFRFU1QgaXMg
bm90IHNldDxicj4KQ09ORklHX09GX0ZMQVRUUkVFPXk8YnI+CkNPTkZJR19PRl9LT0JKPXk8YnI+
CkNPTkZJR19PRl9EWU5BTUlDPXk8YnI+CkNPTkZJR19PRl9BRERSRVNTPXk8YnI+CkNPTkZJR19P
Rl9JUlE9eTxicj4KQ09ORklHX09GX05FVD15PGJyPgpDT05GSUdfT0ZfUkVTT0xWRT15PGJyPgpD
T05GSUdfT0ZfT1ZFUkxBWT15PGJyPgpDT05GSUdfQVJDSF9NSUdIVF9IQVZFX1BDX1BBUlBPUlQ9
eTxicj4KQ09ORklHX1BBUlBPUlQ9bTxicj4KQ09ORklHX1BBUlBPUlRfUEM9bTxicj4KIyBDT05G
SUdfUEFSUE9SVF9TRVJJQUwgaXMgbm90IHNldDxicj4KIyBDT05GSUdfUEFSUE9SVF9QQ19GSUZP
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QQVJQT1JUX1BDX1NVUEVSSU89eTxicj4KQ09ORklHX1BB
UlBPUlRfUENfUENNQ0lBPW08YnI+CkNPTkZJR19QQVJQT1JUX0FYODg3OTY9bTxicj4KIyBDT05G
SUdfUEFSUE9SVF8xMjg0IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19QQVJQT1JUX05PVF9QQz15PGJy
PgpDT05GSUdfUE5QPXk8YnI+CiMgQ09ORklHX1BOUF9ERUJVR19NRVNTQUdFUyBpcyBub3Qgc2V0
PGJyPgo8YnI+CiM8YnI+CiMgUHJvdG9jb2xzPGJyPgojPGJyPgpDT05GSUdfUE5QQUNQST15PGJy
Pgo8YnI+CiM8YnI+CiMgTlZNRSBTdXBwb3J0PGJyPgojPGJyPgo8YnI+CiM8YnI+CiMgTWlzYyBk
ZXZpY2VzPGJyPgojPGJyPgpDT05GSUdfU0VOU09SU19MSVMzTFYwMkQ9bTxicj4KQ09ORklHX0FE
NTI1WF9EUE9UPW08YnI+CkNPTkZJR19BRDUyNVhfRFBPVF9JMkM9bTxicj4KIyBDT05GSUdfRFVN
TVlfSVJRIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JQk1fQVNNPW08YnI+CkNPTkZJR19QSEFOVE9N
PW08YnI+CiMgQ09ORklHX1NHSV9JT0M0IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19USUZNX0NPUkU9
bTxicj4KQ09ORklHX1RJRk1fN1hYMT1tPGJyPgpDT05GSUdfSUNTOTMyUzQwMT1tPGJyPgpDT05G
SUdfRU5DTE9TVVJFX1NFUlZJQ0VTPXk8YnI+CkNPTkZJR19IUF9JTE89eTxicj4KQ09ORklHX0FQ
RFM5ODAyQUxTPW08YnI+CiMgQ09ORklHX0lTTDI5MDAzIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19J
U0wyOTAyMD1tPGJyPgpDT05GSUdfU0VOU09SU19UU0wyNTUwPW08YnI+CiMgQ09ORklHX1NFTlNP
UlNfQkgxNzcwIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0FQRFM5OTBYPW08YnI+CiMg
Q09ORklHX0hNQzYzNTIgaXMgbm90IHNldDxicj4KQ09ORklHX0RTMTY4Mj1tPGJyPgpDT05GSUdf
Vk1XQVJFX0JBTExPT049bTxicj4KQ09ORklHX1VTQl9TV0lUQ0hfRlNBOTQ4MD1tPGJyPgpDT05G
SUdfU1JBTT15PGJyPgojIENPTkZJR19QQ0lfRU5EUE9JTlRfVEVTVCBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfTUlTQ19SVFNYPW08YnI+CkNPTkZJR19DMlBPUlQ9bTxicj4KIyBDT05GSUdfQzJQT1JU
X0RVUkFNQVJfMjE1MCBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgRUVQUk9NIHN1cHBvcnQ8
YnI+CiM8YnI+CiMgQ09ORklHX0VFUFJPTV9BVDI0IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19FRVBS
T01fTEVHQUNZPW08YnI+CiMgQ09ORklHX0VFUFJPTV9NQVg2ODc1IGlzIG5vdCBzZXQ8YnI+CkNP
TkZJR19FRVBST01fOTNDWDY9eTxicj4KQ09ORklHX0VFUFJPTV9JRFRfODlIUEVTWD1tPGJyPgpD
T05GSUdfQ0I3MTBfQ09SRT15PGJyPgpDT05GSUdfQ0I3MTBfREVCVUc9eTxicj4KQ09ORklHX0NC
NzEwX0RFQlVHX0FTU1VNUFRJT05TPXk8YnI+Cjxicj4KIzxicj4KIyBUZXhhcyBJbnN0cnVtZW50
cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZTxicj4KIzxicj4KIyBDT05GSUdfVElf
U1QgaXMgbm90IHNldDxicj4KIyBDT05GSUdfU0VOU09SU19MSVMzX0kyQyBpcyBub3Qgc2V0PGJy
Pgo8YnI+CiM8YnI+CiMgQWx0ZXJhIEZQR0EgZmlybXdhcmUgZG93bmxvYWQgbW9kdWxlIChyZXF1
aXJlcyBJMkMpPGJyPgojPGJyPgpDT05GSUdfQUxURVJBX1NUQVBMPW08YnI+CkNPTkZJR19JTlRF
TF9NRUk9bTxicj4KQ09ORklHX0lOVEVMX01FSV9NRT1tPGJyPgojIENPTkZJR19JTlRFTF9NRUlf
VFhFIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19WTVdBUkVfVk1DST15PGJyPgo8YnI+CiM8YnI+CiMg
SW50ZWwgTUlDICZhbXA7IHJlbGF0ZWQgc3VwcG9ydDxicj4KIzxicj4KPGJyPgojPGJyPgojIElu
dGVsIE1JQyBCdXMgRHJpdmVyPGJyPgojPGJyPgpDT05GSUdfSU5URUxfTUlDX0JVUz1tPGJyPgo8
YnI+CiM8YnI+CiMgU0NJRiBCdXMgRHJpdmVyPGJyPgojPGJyPgpDT05GSUdfU0NJRl9CVVM9eTxi
cj4KPGJyPgojPGJyPgojIFZPUCBCdXMgRHJpdmVyPGJyPgojPGJyPgpDT05GSUdfVk9QX0JVUz1t
PGJyPgo8YnI+CiM8YnI+CiMgSW50ZWwgTUlDIEhvc3QgRHJpdmVyPGJyPgojPGJyPgo8YnI+CiM8
YnI+CiMgSW50ZWwgTUlDIENhcmQgRHJpdmVyPGJyPgojPGJyPgo8YnI+CiM8YnI+CiMgU0NJRiBE
cml2ZXI8YnI+CiM8YnI+CkNPTkZJR19TQ0lGPXk8YnI+Cjxicj4KIzxicj4KIyBJbnRlbCBNSUMg
Q29wcm9jZXNzb3IgU3RhdGUgTWFuYWdlbWVudCAoQ09TTSkgRHJpdmVyczxicj4KIzxicj4KIyBD
T05GSUdfTUlDX0NPU00gaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIFZPUCBEcml2ZXI8YnI+
CiM8YnI+CkNPTkZJR19WT1A9bTxicj4KQ09ORklHX1ZIT1NUX1JJTkc9bTxicj4KQ09ORklHX0dF
TldRRT15PGJyPgpDT05GSUdfR0VOV1FFX1BMQVRGT1JNX0VSUk9SX1JFQ09WRVJZPTA8YnI+CkNP
TkZJR19FQ0hPPW08YnI+CkNPTkZJR19NSVNDX1JUU1hfUENJPW08YnI+CkNPTkZJR19NSVNDX1JU
U1hfVVNCPW08YnI+CkNPTkZJR19IQVZFX0lERT15PGJyPgo8YnI+CiM8YnI+CiMgU0NTSSBkZXZp
Y2Ugc3VwcG9ydDxicj4KIzxicj4KQ09ORklHX1NDU0lfTU9EPXk8YnI+CiMgQ09ORklHX0ZVU0lP
TiBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgSUVFRSAxMzk0IChGaXJlV2lyZSkgc3VwcG9y
dDxicj4KIzxicj4KIyBDT05GSUdfRklSRVdJUkUgaXMgbm90IHNldDxicj4KQ09ORklHX0ZJUkVX
SVJFX05PU1k9eTxicj4KIyBDT05GSUdfTUFDSU5UT1NIX0RSSVZFUlMgaXMgbm90IHNldDxicj4K
Q09ORklHX05FVERFVklDRVM9eTxicj4KQ09ORklHX05FVF9DT1JFPXk8YnI+CiMgQ09ORklHX0JP
TkRJTkcgaXMgbm90IHNldDxicj4KIyBDT05GSUdfRFVNTVkgaXMgbm90IHNldDxicj4KIyBDT05G
SUdfRVFVQUxJWkVSIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05FVF9URUFNIGlzIG5vdCBzZXQ8
YnI+CiMgQ09ORklHX01BQ1ZMQU4gaXMgbm90IHNldDxicj4KIyBDT05GSUdfVlhMQU4gaXMgbm90
IHNldDxicj4KIyBDT05GSUdfTUFDU0VDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05FVENPTlNP
TEUgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTlRCX05FVERFViBpcyBub3Qgc2V0PGJyPgojIENP
TkZJR19UVU4gaXMgbm90IHNldDxicj4KIyBDT05GSUdfVFVOX1ZORVRfQ1JPU1NfTEUgaXMgbm90
IHNldDxicj4KIyBDT05GSUdfVkVUSCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19WSVJUSU9fTkVU
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05MTU9OIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0FS
Q05FVCBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgQ0FJRiB0cmFuc3BvcnQgZHJpdmVyczxi
cj4KIzxicj4KPGJyPgojPGJyPgojIERpc3RyaWJ1dGVkIFN3aXRjaCBBcmNoaXRlY3R1cmUgZHJp
dmVyczxicj4KIzxicj4KQ09ORklHX0VUSEVSTkVUPXk8YnI+CkNPTkZJR19NRElPPW08YnI+CkNP
TkZJR19ORVRfVkVORE9SXzNDT009eTxicj4KIyBDT05GSUdfUENNQ0lBXzNDNTc0IGlzIG5vdCBz
ZXQ8YnI+CiMgQ09ORklHX1BDTUNJQV8zQzU4OSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19WT1JU
RVggaXMgbm90IHNldDxicj4KIyBDT05GSUdfVFlQSE9PTiBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
TkVUX1ZFTkRPUl9BREFQVEVDPXk8YnI+CiMgQ09ORklHX0FEQVBURUNfU1RBUkZJUkUgaXMgbm90
IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfQUdFUkU9eTxicj4KIyBDT05GSUdfRVQxMzFYIGlz
IG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0FMQUNSSVRFQ0g9eTxicj4KIyBDT05GSUdf
U0xJQ09TUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9BTFRFT049eTxicj4KIyBD
T05GSUdfQUNFTklDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0FMVEVSQV9UU0UgaXMgbm90IHNl
dDxicj4KQ09ORklHX05FVF9WRU5ET1JfQU1BWk9OPXk8YnI+CkNPTkZJR19ORVRfVkVORE9SX0FN
RD15PGJyPgojIENPTkZJR19BTUQ4MTExX0VUSCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19QQ05F
VDMyIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1BDTUNJQV9OTUNMQU4gaXMgbm90IHNldDxicj4K
IyBDT05GSUdfQU1EX1hHQkUgaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfQVFVQU5U
SUE9eTxicj4KIyBDT05GSUdfQVFUSU9OIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9S
X0FSQz15PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9BVEhFUk9TPXk8YnI+CiMgQ09ORklHX0FUTDIg
aXMgbm90IHNldDxicj4KIyBDT05GSUdfQVRMMSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19BVEwx
RSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19BVEwxQyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19B
TFggaXMgbm90IHNldDxicj4KIyBDT05GSUdfTkVUX1ZFTkRPUl9BVVJPUkEgaXMgbm90IHNldDxi
cj4KQ09ORklHX05FVF9WRU5ET1JfQlJPQURDT009eTxicj4KIyBDT05GSUdfQjQ0IGlzIG5vdCBz
ZXQ8YnI+CiMgQ09ORklHX0JDTUdFTkVUIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0JOWDIgaXMg
bm90IHNldDxicj4KIyBDT05GSUdfQ05JQyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19USUdPTjMg
aXMgbm90IHNldDxicj4KIyBDT05GSUdfQk5YMlggaXMgbm90IHNldDxicj4KIyBDT05GSUdfU1lT
VEVNUE9SVCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19CTlhUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19ORVRfVkVORE9SX0JST0NBREU9eTxicj4KIyBDT05GSUdfQk5BIGlzIG5vdCBzZXQ8YnI+CkNP
TkZJR19ORVRfQ0FERU5DRT15PGJyPgojIENPTkZJR19NQUNCIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19ORVRfVkVORE9SX0NBVklVTT15PGJyPgojIENPTkZJR19USFVOREVSX05JQ19QRiBpcyBub3Qg
c2V0PGJyPgojIENPTkZJR19USFVOREVSX05JQ19WRiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19U
SFVOREVSX05JQ19CR1ggaXMgbm90IHNldDxicj4KIyBDT05GSUdfVEhVTkRFUl9OSUNfUkdYIGlz
IG5vdCBzZXQ8YnI+CkNPTkZJR19DQVZJVU1fUFRQPXk8YnI+CiMgQ09ORklHX0xJUVVJRElPIGlz
IG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0NIRUxTSU89eTxicj4KIyBDT05GSUdfQ0hF
TFNJT19UMSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19DSEVMU0lPX1QzIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX0NIRUxTSU9fVDQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfQ0hFTFNJT19UNFZG
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0NJU0NPPXk8YnI+CiMgQ09ORklHX0VO
SUMgaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfQ09SVElOQT15PGJyPgojIENPTkZJ
R19HRU1JTklfRVRIRVJORVQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfQ1hfRUNBVCBpcyBub3Qg
c2V0PGJyPgojIENPTkZJR19ETkVUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0RF
Qz15PGJyPgojIENPTkZJR19ORVRfVFVMSVAgaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5E
T1JfRExJTks9eTxicj4KIyBDT05GSUdfREwySyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TVU5E
QU5DRSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9FTVVMRVg9eTxicj4KIyBDT05G
SUdfQkUyTkVUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0VaQ0hJUD15PGJyPgoj
IENPTkZJR19FWkNISVBfTlBTX01BTkFHRU1FTlRfRU5FVCBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
TkVUX1ZFTkRPUl9GVUpJVFNVPXk8YnI+CiMgQ09ORklHX1BDTUNJQV9GTVZKMThYIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0hQPXk8YnI+CiMgQ09ORklHX0hQMTAwIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0hVQVdFST15PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9J
ODI1WFg9eTxicj4KQ09ORklHX05FVF9WRU5ET1JfSU5URUw9eTxicj4KIyBDT05GSUdfRTEwMCBp
cyBub3Qgc2V0PGJyPgpDT05GSUdfRTEwMDA9eTxicj4KQ09ORklHX0UxMDAwRT1tPGJyPgpDT05G
SUdfRTEwMDBFX0hXVFM9eTxicj4KQ09ORklHX0lHQj1tPGJyPgpDT05GSUdfSUdCX0hXTU9OPXk8
YnI+CiMgQ09ORklHX0lHQlZGIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0lYR0IgaXMgbm90IHNl
dDxicj4KQ09ORklHX0lYR0JFPW08YnI+CkNPTkZJR19JWEdCRV9IV01PTj15PGJyPgojIENPTkZJ
R19JNDBFIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX0VYQVI9eTxicj4KIyBDT05G
SUdfUzJJTyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19WWEdFIGlzIG5vdCBzZXQ8YnI+CiMgQ09O
RklHX0pNRSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9NQVJWRUxMPXk8YnI+CiMg
Q09ORklHX01WTURJTyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TS0dFIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX1NLWTIgaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfTUVMTEFOT1g9
eTxicj4KIyBDT05GSUdfTUxYNF9FTiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19NTFg1X0NPUkUg
aXMgbm90IHNldDxicj4KIyBDT05GSUdfTUxYU1dfQ09SRSBpcyBub3Qgc2V0PGJyPgojIENPTkZJ
R19NTFhGVyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9NSUNSRUw9eTxicj4KIyBD
T05GSUdfS1M4ODUxX01MTCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19LU1o4ODRYX1BDSSBpcyBu
b3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9NSUNST1NFTUk9eTxicj4KQ09ORklHX05FVF9W
RU5ET1JfTVlSST15PGJyPgojIENPTkZJR19NWVJJMTBHRSBpcyBub3Qgc2V0PGJyPgojIENPTkZJ
R19GRUFMTlggaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfTkFUU0VNST15PGJyPgoj
IENPTkZJR19OQVRTRU1JIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05TODM4MjAgaXMgbm90IHNl
dDxicj4KQ09ORklHX05FVF9WRU5ET1JfTkVUUk9OT01FPXk8YnI+CkNPTkZJR19ORVRfVkVORE9S
X05JPXk8YnI+CkNPTkZJR19ORVRfVkVORE9SXzgzOTA9eTxicj4KIyBDT05GSUdfUENNQ0lBX0FY
TkVUIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX05FMktfUENJIGlzIG5vdCBzZXQ8YnI+CiMgQ09O
RklHX1BDTUNJQV9QQ05FVCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9OVklESUE9
eTxicj4KIyBDT05GSUdfRk9SQ0VERVRIIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9S
X09LST15PGJyPgojIENPTkZJR19FVEhPQyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1BBQ0tF
VF9FTkdJTkU9eTxicj4KIyBDT05GSUdfSEFNQUNISSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19Z
RUxMT1dGSU4gaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfUUxPR0lDPXk8YnI+CiMg
Q09ORklHX1FMQTNYWFggaXMgbm90IHNldDxicj4KIyBDT05GSUdfUUxDTklDIGlzIG5vdCBzZXQ8
YnI+CiMgQ09ORklHX1FMR0UgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTkVUWEVOX05JQyBpcyBu
b3Qgc2V0PGJyPgojIENPTkZJR19RRUQgaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1Jf
UVVBTENPTU09eTxicj4KIyBDT05GSUdfUUNPTV9FTUFDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklH
X1JNTkVUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX1JEQz15PGJyPgojIENPTkZJ
R19SNjA0MCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9SRUFMVEVLPXk8YnI+CiMg
Q09ORklHX0FUUCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR184MTM5Q1AgaXMgbm90IHNldDxicj4K
IyBDT05GSUdfODEzOVRPTyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19SODE2OSBpcyBub3Qgc2V0
PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9SRU5FU0FTPXk8YnI+CkNPTkZJR19ORVRfVkVORE9SX1JP
Q0tFUj15PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HPXk8YnI+CiMgQ09ORklHX1NYR0JF
X0VUSCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9TRUVRPXk8YnI+CkNPTkZJR19O
RVRfVkVORE9SX1NPTEFSRkxBUkU9eTxicj4KIyBDT05GSUdfU0ZDIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX1NGQ19GQUxDT04gaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfU0lMQU49
eTxicj4KIyBDT05GSUdfU0M5MjAzMSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9T
SVM9eTxicj4KIyBDT05GSUdfU0lTOTAwIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NJUzE5MCBp
cyBub3Qgc2V0PGJyPgpDT05GSUdfTkVUX1ZFTkRPUl9TTVNDPXk8YnI+CiMgQ09ORklHX1BDTUNJ
QV9TTUM5MUM5MiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19FUElDMTAwIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX1NNU0M5MTFYIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NNU0M5NDIwIGlzIG5v
dCBzZXQ8YnI+CkNPTkZJR19ORVRfVkVORE9SX1NPQ0lPTkVYVD15PGJyPgpDT05GSUdfTkVUX1ZF
TkRPUl9TVE1JQ1JPPXk8YnI+CiMgQ09ORklHX1NUTU1BQ19FVEggaXMgbm90IHNldDxicj4KQ09O
RklHX05FVF9WRU5ET1JfU1VOPXk8YnI+CiMgQ09ORklHX0hBUFBZTUVBTCBpcyBub3Qgc2V0PGJy
PgojIENPTkZJR19TVU5HRU0gaXMgbm90IHNldDxicj4KIyBDT05GSUdfQ0FTU0lOSSBpcyBub3Qg
c2V0PGJyPgojIENPTkZJR19OSVUgaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfU1lO
T1BTWVM9eTxicj4KIyBDT05GSUdfRFdDX1hMR01BQyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTkVU
X1ZFTkRPUl9URUhVVEk9eTxicj4KIyBDT05GSUdfVEVIVVRJIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19ORVRfVkVORE9SX1RJPXk8YnI+CiMgQ09ORklHX1RJX0NQU1dfQUxFIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX1RMQU4gaXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfVklBPXk8YnI+
CiMgQ09ORklHX1ZJQV9SSElORSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19WSUFfVkVMT0NJVFkg
aXMgbm90IHNldDxicj4KQ09ORklHX05FVF9WRU5ET1JfV0laTkVUPXk8YnI+CiMgQ09ORklHX1dJ
Wk5FVF9XNTEwMCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19XSVpORVRfVzUzMDAgaXMgbm90IHNl
dDxicj4KQ09ORklHX05FVF9WRU5ET1JfWElSQ09NPXk8YnI+CiMgQ09ORklHX1BDTUNJQV9YSVJD
MlBTIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0ZEREkgaXMgbm90IHNldDxicj4KIyBDT05GSUdf
SElQUEkgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTkVUX1NCMTAwMCBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19NRElPX0RFVklDRSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19QSFlMSUIgaXMgbm90
IHNldDxicj4KIyBDT05GSUdfUExJUCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19QUFAgaXMgbm90
IHNldDxicj4KIyBDT05GSUdfU0xJUCBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgSG9zdC1z
aWRlIFVTQiBzdXBwb3J0IGlzIG5lZWRlZCBmb3IgVVNCIE5ldHdvcmsgQWRhcHRlciBzdXBwb3J0
PGJyPgojPGJyPgpDT05GSUdfVVNCX05FVF9EUklWRVJTPW08YnI+CiMgQ09ORklHX1VTQl9DQVRD
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1VTQl9LQVdFVEggaXMgbm90IHNldDxicj4KIyBDT05G
SUdfVVNCX1BFR0FTVVMgaXMgbm90IHNldDxicj4KIyBDT05GSUdfVVNCX1JUTDgxNTAgaXMgbm90
IHNldDxicj4KIyBDT05GSUdfVVNCX1JUTDgxNTIgaXMgbm90IHNldDxicj4KIyBDT05GSUdfVVNC
X0xBTjc4WFggaXMgbm90IHNldDxicj4KIyBDT05GSUdfVVNCX1VTQk5FVCBpcyBub3Qgc2V0PGJy
PgojIENPTkZJR19VU0JfSVBIRVRIIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19XTEFOPXk8YnI+CiMg
Q09ORklHX1dJUkVMRVNTX1dEUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfV0xBTl9WRU5ET1JfQURN
VEVLPXk8YnI+CkNPTkZJR19XTEFOX1ZFTkRPUl9BVEg9eTxicj4KIyBDT05GSUdfQVRIX0RFQlVH
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0FUSDVLX1BDSSBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
V0xBTl9WRU5ET1JfQVRNRUw9eTxicj4KQ09ORklHX1dMQU5fVkVORE9SX0JST0FEQ09NPXk8YnI+
CkNPTkZJR19XTEFOX1ZFTkRPUl9DSVNDTz15PGJyPgpDT05GSUdfV0xBTl9WRU5ET1JfSU5URUw9
eTxicj4KQ09ORklHX1dMQU5fVkVORE9SX0lOVEVSU0lMPXk8YnI+CiMgQ09ORklHX0hPU1RBUCBp
cyBub3Qgc2V0PGJyPgojIENPTkZJR19QUklTTTU0IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19XTEFO
X1ZFTkRPUl9NQVJWRUxMPXk8YnI+CkNPTkZJR19XTEFOX1ZFTkRPUl9NRURJQVRFSz15PGJyPgpD
T05GSUdfV0xBTl9WRU5ET1JfUkFMSU5LPXk8YnI+CkNPTkZJR19XTEFOX1ZFTkRPUl9SRUFMVEVL
PXk8YnI+CkNPTkZJR19XTEFOX1ZFTkRPUl9SU0k9eTxicj4KQ09ORklHX1dMQU5fVkVORE9SX1NU
PXk8YnI+CkNPTkZJR19XTEFOX1ZFTkRPUl9UST15PGJyPgpDT05GSUdfV0xBTl9WRU5ET1JfWllE
QVM9eTxicj4KQ09ORklHX1dMQU5fVkVORE9SX1FVQU5URU5OQT15PGJyPgojIENPTkZJR19QQ01D
SUFfUkFZQ1MgaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIEVuYWJsZSBXaU1BWCAoTmV0d29y
a2luZyBvcHRpb25zKSB0byBzZWUgdGhlIFdpTUFYIGRyaXZlcnM8YnI+CiM8YnI+CiMgQ09ORklH
X1dBTiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfWEVOX05FVERFVl9GUk9OVEVORD15PGJyPgojIENP
TkZJR19WTVhORVQzIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0ZVSklUU1VfRVMgaXMgbm90IHNl
dDxicj4KIyBDT05GSUdfSFlQRVJWX05FVCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19ORVRERVZT
SU0gaXMgbm90IHNldDxicj4KIyBDT05GSUdfTkVUX0ZBSUxPVkVSIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX0lTRE4gaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIElucHV0IGRldmljZSBzdXBw
b3J0PGJyPgojPGJyPgpDT05GSUdfSU5QVVQ9eTxicj4KIyBDT05GSUdfSU5QVVRfTEVEUyBpcyBu
b3Qgc2V0PGJyPgpDT05GSUdfSU5QVVRfRkZfTUVNTEVTUz1tPGJyPgpDT05GSUdfSU5QVVRfUE9M
TERFVj1tPGJyPgpDT05GSUdfSU5QVVRfU1BBUlNFS01BUD1tPGJyPgpDT05GSUdfSU5QVVRfTUFU
UklYS01BUD1tPGJyPgo8YnI+CiM8YnI+CiMgVXNlcmxhbmQgaW50ZXJmYWNlczxicj4KIzxicj4K
IyBDT05GSUdfSU5QVVRfTU9VU0VERVYgaXMgbm90IHNldDxicj4KQ09ORklHX0lOUFVUX0pPWURF
Vj1tPGJyPgojIENPTkZJR19JTlBVVF9FVkRFViBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JTlBV
VF9FVkJVRyBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgSW5wdXQgRGV2aWNlIERyaXZlcnM8
YnI+CiM8YnI+CkNPTkZJR19JTlBVVF9LRVlCT0FSRD15PGJyPgpDT05GSUdfS0VZQk9BUkRfQURD
PW08YnI+CiMgQ09ORklHX0tFWUJPQVJEX0FEUDU1ODggaXMgbm90IHNldDxicj4KIyBDT05GSUdf
S0VZQk9BUkRfQURQNTU4OSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfS0VZQk9BUkRfQVRLQkQ9eTxi
cj4KQ09ORklHX0tFWUJPQVJEX1FUMTA3MD1tPGJyPgpDT05GSUdfS0VZQk9BUkRfUVQyMTYwPW08
YnI+CkNPTkZJR19LRVlCT0FSRF9ETElOS19ESVI2ODU9bTxicj4KQ09ORklHX0tFWUJPQVJEX0xL
S0JEPW08YnI+CkNPTkZJR19LRVlCT0FSRF9HUElPPW08YnI+CiMgQ09ORklHX0tFWUJPQVJEX0dQ
SU9fUE9MTEVEIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0tFWUJPQVJEX1RDQTY0MTYgaXMgbm90
IHNldDxicj4KQ09ORklHX0tFWUJPQVJEX1RDQTg0MTg9bTxicj4KQ09ORklHX0tFWUJPQVJEX01B
VFJJWD1tPGJyPgpDT05GSUdfS0VZQk9BUkRfTE04MzIzPW08YnI+CkNPTkZJR19LRVlCT0FSRF9M
TTgzMzM9bTxicj4KQ09ORklHX0tFWUJPQVJEX01BWDczNTk9bTxicj4KQ09ORklHX0tFWUJPQVJE
X01DUz1tPGJyPgojIENPTkZJR19LRVlCT0FSRF9NUFIxMjEgaXMgbm90IHNldDxicj4KQ09ORklH
X0tFWUJPQVJEX05FV1RPTj1tPGJyPgojIENPTkZJR19LRVlCT0FSRF9PUEVOQ09SRVMgaXMgbm90
IHNldDxicj4KQ09ORklHX0tFWUJPQVJEX1NBTVNVTkc9bTxicj4KQ09ORklHX0tFWUJPQVJEX0dP
TERGSVNIX0VWRU5UUz1tPGJyPgpDT05GSUdfS0VZQk9BUkRfU1RPV0FXQVk9bTxicj4KIyBDT05G
SUdfS0VZQk9BUkRfU1VOS0JEIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0tFWUJPQVJEX09NQVA0
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0tFWUJPQVJEX1RNMl9UT1VDSEtFWSBpcyBub3Qgc2V0
PGJyPgojIENPTkZJR19LRVlCT0FSRF9YVEtCRCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19LRVlC
T0FSRF9DUk9TX0VDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0tFWUJPQVJEX0NBUDExWFggaXMg
bm90IHNldDxicj4KQ09ORklHX0tFWUJPQVJEX0JDTT1tPGJyPgpDT05GSUdfSU5QVVRfTU9VU0U9
eTxicj4KIyBDT05GSUdfTU9VU0VfUFMyIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NT1VTRV9TRVJJ
QUw9bTxicj4KQ09ORklHX01PVVNFX0FQUExFVE9VQ0g9bTxicj4KQ09ORklHX01PVVNFX0JDTTU5
NzQ9bTxicj4KQ09ORklHX01PVVNFX0NZQVBBPW08YnI+CiMgQ09ORklHX01PVVNFX0VMQU5fSTJD
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NT1VTRV9WU1hYWEFBPW08YnI+CkNPTkZJR19NT1VTRV9H
UElPPW08YnI+CkNPTkZJR19NT1VTRV9TWU5BUFRJQ1NfSTJDPW08YnI+CkNPTkZJR19NT1VTRV9T
WU5BUFRJQ1NfVVNCPW08YnI+CkNPTkZJR19JTlBVVF9KT1lTVElDSz15PGJyPgojIENPTkZJR19K
T1lTVElDS19BTkFMT0cgaXMgbm90IHNldDxicj4KIyBDT05GSUdfSk9ZU1RJQ0tfQTNEIGlzIG5v
dCBzZXQ8YnI+CiMgQ09ORklHX0pPWVNUSUNLX0FESSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19K
T1lTVElDS19DT0JSQSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSk9ZU1RJQ0tfR0YySz1tPGJyPgoj
IENPTkZJR19KT1lTVElDS19HUklQIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19KT1lTVElDS19HUklQ
X01QPW08YnI+CiMgQ09ORklHX0pPWVNUSUNLX0dVSUxMRU1PVCBpcyBub3Qgc2V0PGJyPgpDT05G
SUdfSk9ZU1RJQ0tfSU5URVJBQ1Q9bTxicj4KQ09ORklHX0pPWVNUSUNLX1NJREVXSU5ERVI9bTxi
cj4KQ09ORklHX0pPWVNUSUNLX1RNREM9bTxicj4KQ09ORklHX0pPWVNUSUNLX0lGT1JDRT1tPGJy
PgpDT05GSUdfSk9ZU1RJQ0tfSUZPUkNFX1VTQj15PGJyPgpDT05GSUdfSk9ZU1RJQ0tfSUZPUkNF
XzIzMj15PGJyPgpDT05GSUdfSk9ZU1RJQ0tfV0FSUklPUj1tPGJyPgpDT05GSUdfSk9ZU1RJQ0tf
TUFHRUxMQU49bTxicj4KIyBDT05GSUdfSk9ZU1RJQ0tfU1BBQ0VPUkIgaXMgbm90IHNldDxicj4K
Q09ORklHX0pPWVNUSUNLX1NQQUNFQkFMTD1tPGJyPgpDT05GSUdfSk9ZU1RJQ0tfU1RJTkdFUj1t
PGJyPgpDT05GSUdfSk9ZU1RJQ0tfVFdJREpPWT1tPGJyPgpDT05GSUdfSk9ZU1RJQ0tfWkhFTkhV
QT1tPGJyPgpDT05GSUdfSk9ZU1RJQ0tfREI5PW08YnI+CkNPTkZJR19KT1lTVElDS19HQU1FQ09O
PW08YnI+CiMgQ09ORklHX0pPWVNUSUNLX1RVUkJPR1JBRlggaXMgbm90IHNldDxicj4KQ09ORklH
X0pPWVNUSUNLX0FTNTAxMT1tPGJyPgojIENPTkZJR19KT1lTVElDS19KT1lEVU1QIGlzIG5vdCBz
ZXQ8YnI+CiMgQ09ORklHX0pPWVNUSUNLX1hQQUQgaXMgbm90IHNldDxicj4KQ09ORklHX0pPWVNU
SUNLX1dBTEtFUkEwNzAxPW08YnI+CkNPTkZJR19KT1lTVElDS19QWFJDPW08YnI+CkNPTkZJR19J
TlBVVF9UQUJMRVQ9eTxicj4KIyBDT05GSUdfVEFCTEVUX1VTQl9BQ0VDQUQgaXMgbm90IHNldDxi
cj4KIyBDT05GSUdfVEFCTEVUX1VTQl9BSVBURUsgaXMgbm90IHNldDxicj4KQ09ORklHX1RBQkxF
VF9VU0JfR1RDTz1tPGJyPgpDT05GSUdfVEFCTEVUX1VTQl9IQU5XQU5HPW08YnI+CkNPTkZJR19U
QUJMRVRfVVNCX0tCVEFCPW08YnI+CiMgQ09ORklHX1RBQkxFVF9VU0JfUEVHQVNVUyBpcyBub3Qg
c2V0PGJyPgpDT05GSUdfVEFCTEVUX1NFUklBTF9XQUNPTTQ9bTxicj4KIyBDT05GSUdfSU5QVVRf
VE9VQ0hTQ1JFRU4gaXMgbm90IHNldDxicj4KQ09ORklHX0lOUFVUX01JU0M9eTxicj4KQ09ORklH
X0lOUFVUXzg4UE04MFhfT05LRVk9bTxicj4KIyBDT05GSUdfSU5QVVRfQUQ3MTRYIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19JTlBVVF9BUklaT05BX0hBUFRJQ1M9bTxicj4KQ09ORklHX0lOUFVUX0FU
TUVMX0NBUFRPVUNIPW08YnI+CkNPTkZJR19JTlBVVF9CTUExNTA9bTxicj4KQ09ORklHX0lOUFVU
X0UzWDBfQlVUVE9OPW08YnI+CiMgQ09ORklHX0lOUFVUX1BDU1BLUiBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfSU5QVVRfTUFYNzc2OTNfSEFQVElDPW08YnI+CkNPTkZJR19JTlBVVF9NQzEzNzgzX1BX
UkJVVFRPTj1tPGJyPgpDT05GSUdfSU5QVVRfTU1BODQ1MD1tPGJyPgojIENPTkZJR19JTlBVVF9B
UEFORUwgaXMgbm90IHNldDxicj4KQ09ORklHX0lOUFVUX0dQMkE9bTxicj4KQ09ORklHX0lOUFVU
X0dQSU9fQkVFUEVSPW08YnI+CiMgQ09ORklHX0lOUFVUX0dQSU9fREVDT0RFUiBpcyBub3Qgc2V0
PGJyPgpDT05GSUdfSU5QVVRfQVRMQVNfQlROUz1tPGJyPgpDT05GSUdfSU5QVVRfQVRJX1JFTU9U
RTI9bTxicj4KQ09ORklHX0lOUFVUX0tFWVNQQU5fUkVNT1RFPW08YnI+CiMgQ09ORklHX0lOUFVU
X0tYVEo5IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JTlBVVF9QT1dFUk1BVEU9bTxicj4KIyBDT05G
SUdfSU5QVVRfWUVBTElOSyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSU5QVVRfQ00xMDk9bTxicj4K
Q09ORklHX0lOUFVUX1JFR1VMQVRPUl9IQVBUSUM9bTxicj4KQ09ORklHX0lOUFVUX1JFVFVfUFdS
QlVUVE9OPW08YnI+CiMgQ09ORklHX0lOUFVUX1RQUzY1MjE4X1BXUkJVVFRPTiBpcyBub3Qgc2V0
PGJyPgpDT05GSUdfSU5QVVRfVUlOUFVUPW08YnI+CiMgQ09ORklHX0lOUFVUX1BDRjg1NzQgaXMg
bm90IHNldDxicj4KQ09ORklHX0lOUFVUX1BXTV9CRUVQRVI9bTxicj4KIyBDT05GSUdfSU5QVVRf
UFdNX1ZJQlJBIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0lOUFVUX0dQSU9fUk9UQVJZX0VOQ09E
RVIgaXMgbm90IHNldDxicj4KQ09ORklHX0lOUFVUX0RBOTA2M19PTktFWT1tPGJyPgpDT05GSUdf
SU5QVVRfQURYTDM0WD1tPGJyPgojIENPTkZJR19JTlBVVF9BRFhMMzRYX0kyQyBpcyBub3Qgc2V0
PGJyPgojIENPTkZJR19JTlBVVF9JTVNfUENVIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JTlBVVF9D
TUEzMDAwPW08YnI+CkNPTkZJR19JTlBVVF9DTUEzMDAwX0kyQz1tPGJyPgpDT05GSUdfSU5QVVRf
WEVOX0tCRERFVl9GUk9OVEVORD1tPGJyPgojIENPTkZJR19JTlBVVF9JREVBUEFEX1NMSURFQkFS
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JTlBVVF9TT0NfQlVUVE9OX0FSUkFZPW08YnI+CkNPTkZJ
R19JTlBVVF9EUlYyNjBYX0hBUFRJQ1M9bTxicj4KIyBDT05GSUdfSU5QVVRfRFJWMjY2NV9IQVBU
SUNTIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JTlBVVF9EUlYyNjY3X0hBUFRJQ1M9bTxicj4KQ09O
RklHX1JNSTRfQ09SRT1tPGJyPgojIENPTkZJR19STUk0X0kyQyBpcyBub3Qgc2V0PGJyPgojIENP
TkZJR19STUk0X1NNQiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUk1JNF9GMDM9eTxicj4KQ09ORklH
X1JNSTRfRjAzX1NFUklPPW08YnI+CkNPTkZJR19STUk0XzJEX1NFTlNPUj15PGJyPgpDT05GSUdf
Uk1JNF9GMTE9eTxicj4KQ09ORklHX1JNSTRfRjEyPXk8YnI+CkNPTkZJR19STUk0X0YzMD15PGJy
PgojIENPTkZJR19STUk0X0YzNCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19STUk0X0Y1NCBpcyBu
b3Qgc2V0PGJyPgojIENPTkZJR19STUk0X0Y1NSBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMg
SGFyZHdhcmUgSS9PIHBvcnRzPGJyPgojPGJyPgpDT05GSUdfU0VSSU89eTxicj4KQ09ORklHX0FS
Q0hfTUlHSFRfSEFWRV9QQ19TRVJJTz15PGJyPgpDT05GSUdfU0VSSU9fSTgwNDI9eTxicj4KQ09O
RklHX1NFUklPX1NFUlBPUlQ9eTxicj4KQ09ORklHX1NFUklPX0NUODJDNzEwPW08YnI+CkNPTkZJ
R19TRVJJT19QQVJLQkQ9bTxicj4KQ09ORklHX1NFUklPX1BDSVBTMj1tPGJyPgpDT05GSUdfU0VS
SU9fTElCUFMyPXk8YnI+CiMgQ09ORklHX1NFUklPX1JBVyBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
U0VSSU9fQUxURVJBX1BTMj1tPGJyPgpDT05GSUdfU0VSSU9fUFMyTVVMVD1tPGJyPgpDT05GSUdf
U0VSSU9fQVJDX1BTMj1tPGJyPgojIENPTkZJR19TRVJJT19BUEJQUzIgaXMgbm90IHNldDxicj4K
Q09ORklHX0hZUEVSVl9LRVlCT0FSRD1tPGJyPgpDT05GSUdfU0VSSU9fR1BJT19QUzI9bTxicj4K
IyBDT05GSUdfVVNFUklPIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19HQU1FUE9SVD1tPGJyPgpDT05G
SUdfR0FNRVBPUlRfTlM1NTg9bTxicj4KQ09ORklHX0dBTUVQT1JUX0w0PW08YnI+CkNPTkZJR19H
QU1FUE9SVF9FTVUxMEsxPW08YnI+CkNPTkZJR19HQU1FUE9SVF9GTTgwMT1tPGJyPgo8YnI+CiM8
YnI+CiMgQ2hhcmFjdGVyIGRldmljZXM8YnI+CiM8YnI+CkNPTkZJR19UVFk9eTxicj4KIyBDT05G
SUdfVlQgaXMgbm90IHNldDxicj4KQ09ORklHX1VOSVg5OF9QVFlTPXk8YnI+CkNPTkZJR19MRUdB
Q1lfUFRZUz15PGJyPgpDT05GSUdfTEVHQUNZX1BUWV9DT1VOVD0yNTY8YnI+CiMgQ09ORklHX1NF
UklBTF9OT05TVEFOREFSRCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19OT1pPTUkgaXMgbm90IHNl
dDxicj4KIyBDT05GSUdfTl9HU00gaXMgbm90IHNldDxicj4KIyBDT05GSUdfVFJBQ0VfU0lOSyBp
cyBub3Qgc2V0PGJyPgojIENPTkZJR19HT0xERklTSF9UVFkgaXMgbm90IHNldDxicj4KIyBDT05G
SUdfREVWTUVNIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0RFVktNRU0gaXMgbm90IHNldDxicj4K
PGJyPgojPGJyPgojIFNlcmlhbCBkcml2ZXJzPGJyPgojPGJyPgpDT05GSUdfU0VSSUFMX0VBUkxZ
Q09OPXk8YnI+CkNPTkZJR19TRVJJQUxfODI1MD15PGJyPgpDT05GSUdfU0VSSUFMXzgyNTBfREVQ
UkVDQVRFRF9PUFRJT05TPXk8YnI+CkNPTkZJR19TRVJJQUxfODI1MF9QTlA9eTxicj4KIyBDT05G
SUdfU0VSSUFMXzgyNTBfRklOVEVLIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRVJJQUxfODI1MF9D
T05TT0xFPXk8YnI+CkNPTkZJR19TRVJJQUxfODI1MF9QQ0k9eTxicj4KQ09ORklHX1NFUklBTF84
MjUwX0VYQVI9eTxicj4KIyBDT05GSUdfU0VSSUFMXzgyNTBfQ1MgaXMgbm90IHNldDxicj4KIyBD
T05GSUdfU0VSSUFMXzgyNTBfTUVOX01DQiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0VSSUFMXzgy
NTBfTlJfVUFSVFM9NDxicj4KQ09ORklHX1NFUklBTF84MjUwX1JVTlRJTUVfVUFSVFM9NDxicj4K
IyBDT05GSUdfU0VSSUFMXzgyNTBfRVhURU5ERUQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfU0VS
SUFMXzgyNTBfQVNQRUVEX1ZVQVJUIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NFUklBTF84MjUw
X0RXIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NFUklBTF84MjUwX1JUMjg4WCBpcyBub3Qgc2V0
PGJyPgpDT05GSUdfU0VSSUFMXzgyNTBfTFBTUz15PGJyPgpDT05GSUdfU0VSSUFMXzgyNTBfTUlE
PXk8YnI+CiMgQ09ORklHX1NFUklBTF84MjUwX01PWEEgaXMgbm90IHNldDxicj4KIyBDT05GSUdf
U0VSSUFMX09GX1BMQVRGT1JNIGlzIG5vdCBzZXQ8YnI+Cjxicj4KIzxicj4KIyBOb24tODI1MCBz
ZXJpYWwgcG9ydCBzdXBwb3J0PGJyPgojPGJyPgojIENPTkZJR19TRVJJQUxfVUFSVExJVEUgaXMg
bm90IHNldDxicj4KQ09ORklHX1NFUklBTF9DT1JFPXk8YnI+CkNPTkZJR19TRVJJQUxfQ09SRV9D
T05TT0xFPXk8YnI+CiMgQ09ORklHX1NFUklBTF9KU00gaXMgbm90IHNldDxicj4KIyBDT05GSUdf
U0VSSUFMX1NDQ05YUCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TRVJJQUxfU0MxNklTN1hYIGlz
IG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NFUklBTF9BTFRFUkFfSlRBR1VBUlQgaXMgbm90IHNldDxi
cj4KIyBDT05GSUdfU0VSSUFMX0FMVEVSQV9VQVJUIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NF
UklBTF9YSUxJTlhfUFNfVUFSVCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TRVJJQUxfQVJDIGlz
IG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NFUklBTF9SUDIgaXMgbm90IHNldDxicj4KIyBDT05GSUdf
U0VSSUFMX0ZTTF9MUFVBUlQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfU0VSSUFMX0NPTkVYQU5U
X0RJR0lDT0xPUiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TRVJJQUxfTUVOX1oxMzUgaXMgbm90
IHNldDxicj4KIyBDT05GSUdfU0VSSUFMX0RFVl9CVVMgaXMgbm90IHNldDxicj4KIyBDT05GSUdf
VFRZX1BSSU5USyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19QUklOVEVSIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX1BQREVWIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19IVkNfRFJJVkVSPXk8YnI+CkNP
TkZJR19IVkNfSVJRPXk8YnI+CkNPTkZJR19IVkNfWEVOPXk8YnI+CkNPTkZJR19IVkNfWEVOX0ZS
T05URU5EPXk8YnI+CiMgQ09ORklHX1ZJUlRJT19DT05TT0xFIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19JUE1JX0hBTkRMRVI9bTxicj4KQ09ORklHX0lQTUlfUEFOSUNfRVZFTlQ9eTxicj4KQ09ORklH
X0lQTUlfUEFOSUNfU1RSSU5HPXk8YnI+CiMgQ09ORklHX0lQTUlfREVWSUNFX0lOVEVSRkFDRSBp
cyBub3Qgc2V0PGJyPgpDT05GSUdfSVBNSV9TST1tPGJyPgpDT05GSUdfSVBNSV9TU0lGPW08YnI+
CkNPTkZJR19JUE1JX1dBVENIRE9HPW08YnI+CkNPTkZJR19JUE1JX1BPV0VST0ZGPW08YnI+CkNP
TkZJR19IV19SQU5ET009eTxicj4KIyBDT05GSUdfSFdfUkFORE9NX1RJTUVSSU9NRU0gaXMgbm90
IHNldDxicj4KQ09ORklHX0hXX1JBTkRPTV9JTlRFTD15PGJyPgpDT05GSUdfSFdfUkFORE9NX0FN
RD15PGJyPgojIENPTkZJR19IV19SQU5ET01fVklBIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19IV19S
QU5ET01fVklSVElPPW08YnI+CkNPTkZJR19OVlJBTT1tPGJyPgojIENPTkZJR19SMzk2NCBpcyBu
b3Qgc2V0PGJyPgojIENPTkZJR19BUFBMSUNPTSBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMg
UENNQ0lBIGNoYXJhY3RlciBkZXZpY2VzPGJyPgojPGJyPgojIENPTkZJR19TWU5DTElOS19DUyBp
cyBub3Qgc2V0PGJyPgpDT05GSUdfQ0FSRE1BTl80MDAwPW08YnI+CiMgQ09ORklHX0NBUkRNQU5f
NDA0MCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0NSMjRYPW08YnI+CiMgQ09ORklHX0lQV0lSRUxF
U1MgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTVdBVkUgaXMgbm90IHNldDxicj4KQ09ORklHX0hQ
RVQ9eTxicj4KIyBDT05GSUdfSFBFVF9NTUFQIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0hBTkdD
SEVDS19USU1FUiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfVENHX1RQTT15PGJyPgojIENPTkZJR19I
V19SQU5ET01fVFBNIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1RDR19USVMgaXMgbm90IHNldDxi
cj4KQ09ORklHX1RDR19USVNfSTJDX0FUTUVMPW08YnI+CiMgQ09ORklHX1RDR19USVNfSTJDX0lO
RklORU9OIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19UQ0dfVElTX0kyQ19OVVZPVE9OPW08YnI+CiMg
Q09ORklHX1RDR19OU0MgaXMgbm90IHNldDxicj4KIyBDT05GSUdfVENHX0FUTUVMIGlzIG5vdCBz
ZXQ8YnI+CiMgQ09ORklHX1RDR19JTkZJTkVPTiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfVENHX1hF
Tj15PGJyPgojIENPTkZJR19UQ0dfQ1JCIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19UQ0dfVlRQTV9Q
Uk9YWT15PGJyPgpDT05GSUdfVENHX1RJU19TVDMzWlAyND1tPGJyPgpDT05GSUdfVENHX1RJU19T
VDMzWlAyNF9JMkM9bTxicj4KIyBDT05GSUdfVEVMQ0xPQ0sgaXMgbm90IHNldDxicj4KQ09ORklH
X0RFVlBPUlQ9eTxicj4KQ09ORklHX1hJTExZQlVTPXk8YnI+CkNPTkZJR19YSUxMWUJVU19PRj1t
PGJyPgo8YnI+CiM8YnI+CiMgSTJDIHN1cHBvcnQ8YnI+CiM8YnI+CkNPTkZJR19JMkM9bTxicj4K
Q09ORklHX0kyQ19CT0FSRElORk89eTxicj4KQ09ORklHX0kyQ19DT01QQVQ9eTxicj4KQ09ORklH
X0kyQ19DSEFSREVWPW08YnI+CkNPTkZJR19JMkNfTVVYPW08YnI+Cjxicj4KIzxicj4KIyBNdWx0
aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0PGJyPgojPGJyPgpDT05GSUdfSTJDX0FSQl9HUElPX0NI
QUxMRU5HRT1tPGJyPgojIENPTkZJR19JMkNfTVVYX0dQSU8gaXMgbm90IHNldDxicj4KQ09ORklH
X0kyQ19NVVhfR1BNVVg9bTxicj4KIyBDT05GSUdfSTJDX01VWF9MVEM0MzA2IGlzIG5vdCBzZXQ8
YnI+CkNPTkZJR19JMkNfTVVYX1BDQTk1NDE9bTxicj4KQ09ORklHX0kyQ19NVVhfUENBOTU0eD1t
PGJyPgpDT05GSUdfSTJDX01VWF9SRUc9bTxicj4KQ09ORklHX0kyQ19NVVhfTUxYQ1BMRD1tPGJy
PgojIENPTkZJR19JMkNfSEVMUEVSX0FVVE8gaXMgbm90IHNldDxicj4KQ09ORklHX0kyQ19TTUJV
Uz1tPGJyPgo8YnI+CiM8YnI+CiMgSTJDIEFsZ29yaXRobXM8YnI+CiM8YnI+CkNPTkZJR19JMkNf
QUxHT0JJVD1tPGJyPgpDT05GSUdfSTJDX0FMR09QQ0Y9bTxicj4KQ09ORklHX0kyQ19BTEdPUENB
PW08YnI+Cjxicj4KIzxicj4KIyBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQ8YnI+CiM8YnI+Cjxi
cj4KIzxicj4KIyBQQyBTTUJ1cyBob3N0IGNvbnRyb2xsZXIgZHJpdmVyczxicj4KIzxicj4KIyBD
T05GSUdfSTJDX0FMSTE1MzUgaXMgbm90IHNldDxicj4KQ09ORklHX0kyQ19BTEkxNTYzPW08YnI+
CiMgQ09ORklHX0kyQ19BTEkxNVgzIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JMkNfQU1ENzU2PW08
YnI+CkNPTkZJR19JMkNfQU1ENzU2X1M0ODgyPW08YnI+CkNPTkZJR19JMkNfQU1EODExMT1tPGJy
PgpDT05GSUdfSTJDX0k4MDE9bTxicj4KQ09ORklHX0kyQ19JU0NIPW08YnI+CiMgQ09ORklHX0ky
Q19JU01UIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JMkNfUElJWDQ9bTxicj4KIyBDT05GSUdfSTJD
X05GT1JDRTIgaXMgbm90IHNldDxicj4KQ09ORklHX0kyQ19TSVM1NTk1PW08YnI+CiMgQ09ORklH
X0kyQ19TSVM2MzAgaXMgbm90IHNldDxicj4KIyBDT05GSUdfSTJDX1NJUzk2WCBpcyBub3Qgc2V0
PGJyPgpDT05GSUdfSTJDX1ZJQT1tPGJyPgpDT05GSUdfSTJDX1ZJQVBSTz1tPGJyPgo8YnI+CiM8
YnI+CiMgQUNQSSBkcml2ZXJzPGJyPgojPGJyPgpDT05GSUdfSTJDX1NDTUk9bTxicj4KPGJyPgoj
PGJyPgojIEkyQyBzeXN0ZW0gYnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5c3RlbS1v
bi1jaGlwKTxicj4KIzxicj4KQ09ORklHX0kyQ19DQlVTX0dQSU89bTxicj4KQ09ORklHX0kyQ19E
RVNJR05XQVJFX0NPUkU9bTxicj4KQ09ORklHX0kyQ19ERVNJR05XQVJFX1BMQVRGT1JNPW08YnI+
CkNPTkZJR19JMkNfREVTSUdOV0FSRV9TTEFWRT15PGJyPgpDT05GSUdfSTJDX0RFU0lHTldBUkVf
UENJPW08YnI+CiMgQ09ORklHX0kyQ19ERVNJR05XQVJFX0JBWVRSQUlMIGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX0kyQ19FTUVWMiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JMkNfR1BJTyBpcyBu
b3Qgc2V0PGJyPgpDT05GSUdfSTJDX0tFTVBMRD1tPGJyPgpDT05GSUdfSTJDX09DT1JFUz1tPGJy
PgpDT05GSUdfSTJDX1BDQV9QTEFURk9STT1tPGJyPgojIENPTkZJR19JMkNfUkszWCBpcyBub3Qg
c2V0PGJyPgojIENPTkZJR19JMkNfU0lNVEVDIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JMkNfWElM
SU5YPW08YnI+Cjxicj4KIzxicj4KIyBFeHRlcm5hbCBJMkMvU01CdXMgYWRhcHRlciBkcml2ZXJz
PGJyPgojPGJyPgpDT05GSUdfSTJDX0RJT0xBTl9VMkM9bTxicj4KQ09ORklHX0kyQ19QQVJQT1JU
PW08YnI+CiMgQ09ORklHX0kyQ19QQVJQT1JUX0xJR0hUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19J
MkNfUk9CT1RGVVpaX09TSUY9bTxicj4KIyBDT05GSUdfSTJDX1RBT1NfRVZNIGlzIG5vdCBzZXQ8
YnI+CiMgQ09ORklHX0kyQ19USU5ZX1VTQiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSTJDX1ZJUEVS
Qk9BUkQ9bTxicj4KPGJyPgojPGJyPgojIE90aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVyczxicj4K
Izxicj4KQ09ORklHX0kyQ19NTFhDUExEPW08YnI+CkNPTkZJR19JMkNfQ1JPU19FQ19UVU5ORUw9
bTxicj4KQ09ORklHX0kyQ19TVFVCPW08YnI+CkNPTkZJR19JMkNfU0xBVkU9eTxicj4KIyBDT05G
SUdfSTJDX1NMQVZFX0VFUFJPTSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JMkNfREVCVUdfQ09S
RSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19JMkNfREVCVUdfQlVTIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NQSSBpcyBub3Qg
c2V0PGJyPgpDT05GSUdfU1BNST15PGJyPgojIENPTkZJR19IU0kgaXMgbm90IHNldDxicj4KQ09O
RklHX1BQUz1tPGJyPgojIENPTkZJR19QUFNfREVCVUcgaXMgbm90IHNldDxicj4KPGJyPgojPGJy
PgojIFBQUyBjbGllbnRzIHN1cHBvcnQ8YnI+CiM8YnI+CkNPTkZJR19QUFNfQ0xJRU5UX0tUSU1F
Uj1tPGJyPgojIENPTkZJR19QUFNfQ0xJRU5UX0xESVNDIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19Q
UFNfQ0xJRU5UX1BBUlBPUlQ9bTxicj4KIyBDT05GSUdfUFBTX0NMSUVOVF9HUElPIGlzIG5vdCBz
ZXQ8YnI+Cjxicj4KIzxicj4KIyBQUFMgZ2VuZXJhdG9ycyBzdXBwb3J0PGJyPgojPGJyPgo8YnI+
CiM8YnI+CiMgUFRQIGNsb2NrIHN1cHBvcnQ8YnI+CiM8YnI+Cjxicj4KIzxicj4KIyBFbmFibGUg
UEhZTElCIGFuZCBORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgdG8gc2VlIHRoZSBhZGRpdGlvbmFs
IGNsb2Nrcy48YnI+CiM8YnI+CiMgQ09ORklHX1BJTkNUUkwgaXMgbm90IHNldDxicj4KQ09ORklH
X0dQSU9MSUI9eTxicj4KQ09ORklHX0dQSU9MSUJfRkFTVFBBVEhfTElNSVQ9NTEyPGJyPgpDT05G
SUdfT0ZfR1BJTz15PGJyPgpDT05GSUdfR1BJT19BQ1BJPXk8YnI+CkNPTkZJR19HUElPTElCX0lS
UUNISVA9eTxicj4KIyBDT05GSUdfREVCVUdfR1BJTyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfR1BJ
T19TWVNGUz15PGJyPgpDT05GSUdfR1BJT19HRU5FUklDPXk8YnI+CkNPTkZJR19HUElPX01BWDcz
MFg9bTxicj4KPGJyPgojPGJyPgojIE1lbW9yeSBtYXBwZWQgR1BJTyBkcml2ZXJzPGJyPgojPGJy
PgojIENPTkZJR19HUElPXzc0WFhfTU1JTyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfR1BJT19BTFRF
UkE9eTxicj4KQ09ORklHX0dQSU9fQU1EUFQ9bTxicj4KQ09ORklHX0dQSU9fRFdBUEI9eTxicj4K
IyBDT05GSUdfR1BJT19FWEFSIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19HUElPX0ZUR1BJTzAxMD15
PGJyPgojIENPTkZJR19HUElPX0dFTkVSSUNfUExBVEZPUk0gaXMgbm90IHNldDxicj4KQ09ORklH
X0dQSU9fR1JHUElPPW08YnI+CkNPTkZJR19HUElPX0hMV0Q9eTxicj4KQ09ORklHX0dQSU9fSUNI
PW08YnI+CkNPTkZJR19HUElPX0xZTlhQT0lOVD15PGJyPgpDT05GSUdfR1BJT19NQjg2UzdYPW08
YnI+CiMgQ09ORklHX0dQSU9fTUVOWjEyNyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfR1BJT19NT0NL
VVA9bTxicj4KIyBDT05GSUdfR1BJT19TWVNDT04gaXMgbm90IHNldDxicj4KQ09ORklHX0dQSU9f
Vlg4NTU9eTxicj4KQ09ORklHX0dQSU9fWElMSU5YPXk8YnI+Cjxicj4KIzxicj4KIyBQb3J0LW1h
cHBlZCBJL08gR1BJTyBkcml2ZXJzPGJyPgojPGJyPgojIENPTkZJR19HUElPXzEwNF9ESU9fNDhF
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0dQSU9fMTA0X0lESU9fMTYgaXMgbm90IHNldDxicj4K
Q09ORklHX0dQSU9fMTA0X0lESV80OD1tPGJyPgojIENPTkZJR19HUElPX0Y3MTg4WCBpcyBub3Qg
c2V0PGJyPgpDT05GSUdfR1BJT19HUElPX01NPW08YnI+CiMgQ09ORklHX0dQSU9fSVQ4NyBpcyBu
b3Qgc2V0PGJyPgpDT05GSUdfR1BJT19TQ0g9bTxicj4KQ09ORklHX0dQSU9fU0NIMzExWD1tPGJy
PgpDT05GSUdfR1BJT19XSU5CT05EPXk8YnI+CkNPTkZJR19HUElPX1dTMTZDNDg9bTxicj4KPGJy
PgojPGJyPgojIEkyQyBHUElPIGV4cGFuZGVyczxicj4KIzxicj4KQ09ORklHX0dQSU9fQURQNTU4
OD1tPGJyPgojIENPTkZJR19HUElPX0FETlAgaXMgbm90IHNldDxicj4KQ09ORklHX0dQSU9fTUFY
NzMwMD1tPGJyPgpDT05GSUdfR1BJT19NQVg3MzJYPW08YnI+CiMgQ09ORklHX0dQSU9fUENBOTUz
WCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfR1BJT19QQ0Y4NTdYPW08YnI+CiMgQ09ORklHX0dQSU9f
VFBJQzI4MTAgaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIE1GRCBHUElPIGV4cGFuZGVyczxi
cj4KIzxicj4KQ09ORklHX0dQSU9fQVJJWk9OQT15PGJyPgpDT05GSUdfR1BJT19CRDk1NzFNV1Y9
bTxicj4KIyBDT05GSUdfR1BJT19KQU5aX1RUTCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfR1BJT19L
RU1QTEQ9bTxicj4KQ09ORklHX0dQSU9fTFA4NzNYPW08YnI+CkNPTkZJR19HUElPX1RQUzY1MjE4
PW08YnI+CiMgQ09ORklHX0dQSU9fVFBTNjU5MTIgaXMgbm90IHNldDxicj4KQ09ORklHX0dQSU9f
VUNCMTQwMD1tPGJyPgojIENPTkZJR19HUElPX1dISVNLRVlfQ09WRSBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfR1BJT19XTTg5OTQ9bTxicj4KPGJyPgojPGJyPgojIFBDSSBHUElPIGV4cGFuZGVyczxi
cj4KIzxicj4KQ09ORklHX0dQSU9fQU1EODExMT1tPGJyPgojIENPTkZJR19HUElPX0JUOFhYIGlz
IG5vdCBzZXQ8YnI+CiMgQ09ORklHX0dQSU9fTUxfSU9IIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklH
X0dQSU9fUENJX0lESU9fMTYgaXMgbm90IHNldDxicj4KQ09ORklHX0dQSU9fUENJRV9JRElPXzI0
PW08YnI+CkNPTkZJR19HUElPX1JEQzMyMVg9eTxicj4KQ09ORklHX0dQSU9fU09EQVZJTExFPXk8
YnI+Cjxicj4KIzxicj4KIyBVU0IgR1BJTyBleHBhbmRlcnM8YnI+CiM8YnI+CkNPTkZJR19HUElP
X1ZJUEVSQk9BUkQ9bTxicj4KQ09ORklHX1cxPXk8YnI+Cjxicj4KIzxicj4KIyAxLXdpcmUgQnVz
IE1hc3RlcnM8YnI+CiM8YnI+CkNPTkZJR19XMV9NQVNURVJfTUFUUk9YPW08YnI+CkNPTkZJR19X
MV9NQVNURVJfRFMyNDkwPW08YnI+CiMgQ09ORklHX1cxX01BU1RFUl9EUzI0ODIgaXMgbm90IHNl
dDxicj4KIyBDT05GSUdfVzFfTUFTVEVSX0RTMVdNIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1cx
X01BU1RFUl9HUElPIGlzIG5vdCBzZXQ8YnI+Cjxicj4KIzxicj4KIyAxLXdpcmUgU2xhdmVzPGJy
PgojPGJyPgpDT05GSUdfVzFfU0xBVkVfVEhFUk09bTxicj4KQ09ORklHX1cxX1NMQVZFX1NNRU09
eTxicj4KIyBDT05GSUdfVzFfU0xBVkVfRFMyNDA1IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19XMV9T
TEFWRV9EUzI0MDg9bTxicj4KQ09ORklHX1cxX1NMQVZFX0RTMjQwOF9SRUFEQkFDSz15PGJyPgoj
IENPTkZJR19XMV9TTEFWRV9EUzI0MTMgaXMgbm90IHNldDxicj4KQ09ORklHX1cxX1NMQVZFX0RT
MjQwNj15PGJyPgpDT05GSUdfVzFfU0xBVkVfRFMyNDIzPXk8YnI+CkNPTkZJR19XMV9TTEFWRV9E
UzI4MDU9eTxicj4KQ09ORklHX1cxX1NMQVZFX0RTMjQzMT15PGJyPgojIENPTkZJR19XMV9TTEFW
RV9EUzI0MzMgaXMgbm90IHNldDxicj4KQ09ORklHX1cxX1NMQVZFX0RTMjQzOD15PGJyPgpDT05G
SUdfVzFfU0xBVkVfRFMyNzYwPW08YnI+CkNPTkZJR19XMV9TTEFWRV9EUzI3ODA9eTxicj4KQ09O
RklHX1cxX1NMQVZFX0RTMjc4MT15PGJyPgojIENPTkZJR19XMV9TTEFWRV9EUzI4RTA0IGlzIG5v
dCBzZXQ8YnI+CkNPTkZJR19XMV9TTEFWRV9EUzI4RTE3PW08YnI+CkNPTkZJR19QT1dFUl9BVlM9
eTxicj4KQ09ORklHX1BPV0VSX1JFU0VUPXk8YnI+CiMgQ09ORklHX1BPV0VSX1JFU0VUX0dQSU8g
aXMgbm90IHNldDxicj4KIyBDT05GSUdfUE9XRVJfUkVTRVRfR1BJT19SRVNUQVJUIGlzIG5vdCBz
ZXQ8YnI+CiMgQ09ORklHX1BPV0VSX1JFU0VUX0xUQzI5NTIgaXMgbm90IHNldDxicj4KQ09ORklH
X1BPV0VSX1JFU0VUX1JFU1RBUlQ9eTxicj4KIyBDT05GSUdfUE9XRVJfUkVTRVRfU1lTQ09OIGlz
IG5vdCBzZXQ8YnI+CkNPTkZJR19QT1dFUl9SRVNFVF9TWVNDT05fUE9XRVJPRkY9eTxicj4KQ09O
RklHX1JFQk9PVF9NT0RFPW08YnI+CkNPTkZJR19TWVNDT05fUkVCT09UX01PREU9bTxicj4KQ09O
RklHX1BPV0VSX1NVUFBMWT15PGJyPgpDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHPXk8YnI+CiMg
Q09ORklHX1BEQV9QT1dFUiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19HRU5FUklDX0FEQ19CQVRU
RVJZIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1RFU1RfUE9XRVIgaXMgbm90IHNldDxicj4KQ09O
RklHX0JBVFRFUllfQUNUODk0NUE9bTxicj4KQ09ORklHX0JBVFRFUllfRFMyNzYwPW08YnI+CkNP
TkZJR19CQVRURVJZX0RTMjc4MD15PGJyPgpDT05GSUdfQkFUVEVSWV9EUzI3ODE9eTxicj4KQ09O
RklHX0JBVFRFUllfRFMyNzgyPW08YnI+CiMgQ09ORklHX0JBVFRFUllfTEVHT19FVjMgaXMgbm90
IHNldDxicj4KQ09ORklHX0JBVFRFUllfU0JTPW08YnI+CkNPTkZJR19DSEFSR0VSX1NCUz1tPGJy
PgpDT05GSUdfTUFOQUdFUl9TQlM9bTxicj4KQ09ORklHX0JBVFRFUllfQlEyN1hYWD15PGJyPgoj
IENPTkZJR19CQVRURVJZX0JRMjdYWFhfSTJDIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0JBVFRF
UllfQlEyN1hYWF9IRFEgaXMgbm90IHNldDxicj4KQ09ORklHX0NIQVJHRVJfREE5MTUwPW08YnI+
CkNPTkZJR19CQVRURVJZX0RBOTE1MD1tPGJyPgpDT05GSUdfQkFUVEVSWV9NQVgxNzA0MD1tPGJy
PgpDT05GSUdfQkFUVEVSWV9NQVgxNzA0Mj1tPGJyPgpDT05GSUdfQkFUVEVSWV9NQVgxNzIxWD15
PGJyPgojIENPTkZJR19DSEFSR0VSX0lTUDE3MDQgaXMgbm90IHNldDxicj4KQ09ORklHX0NIQVJH
RVJfTUFYODkwMz1tPGJyPgojIENPTkZJR19DSEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19DSEFSR0VSX0dQSU8gaXMgbm90IHNldDxicj4KQ09ORklHX0NIQVJHRVJfTUFOQUdF
Uj15PGJyPgpDT05GSUdfQ0hBUkdFUl9MVEMzNjUxPW08YnI+CkNPTkZJR19DSEFSR0VSX01BWDE0
NTc3PW08YnI+CiMgQ09ORklHX0NIQVJHRVJfREVURUNUT1JfTUFYMTQ2NTYgaXMgbm90IHNldDxi
cj4KQ09ORklHX0NIQVJHRVJfTUFYNzc2OTM9bTxicj4KQ09ORklHX0NIQVJHRVJfQlEyNDE1WD1t
PGJyPgpDT05GSUdfQ0hBUkdFUl9CUTI0MTkwPW08YnI+CiMgQ09ORklHX0NIQVJHRVJfQlEyNDI1
NyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfQ0hBUkdFUl9CUTI0NzM1PW08YnI+CkNPTkZJR19DSEFS
R0VSX0JRMjU4OTA9bTxicj4KIyBDT05GSUdfQ0hBUkdFUl9TTUIzNDcgaXMgbm90IHNldDxicj4K
IyBDT05GSUdfQ0hBUkdFUl9UUFM2NTIxNyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19CQVRURVJZ
X0dBVUdFX0xUQzI5NDEgaXMgbm90IHNldDxicj4KQ09ORklHX0JBVFRFUllfR09MREZJU0g9eTxi
cj4KQ09ORklHX0NIQVJHRVJfUlQ5NDU1PW08YnI+CkNPTkZJR19IV01PTj15PGJyPgpDT05GSUdf
SFdNT05fVklEPXk8YnI+CkNPTkZJR19IV01PTl9ERUJVR19DSElQPXk8YnI+Cjxicj4KIzxicj4K
IyBOYXRpdmUgZHJpdmVyczxicj4KIzxicj4KIyBDT05GSUdfU0VOU09SU19BRDc0MTQgaXMgbm90
IHNldDxicj4KQ09ORklHX1NFTlNPUlNfQUQ3NDE4PW08YnI+CkNPTkZJR19TRU5TT1JTX0FETTEw
MjE9bTxicj4KQ09ORklHX1NFTlNPUlNfQURNMTAyNT1tPGJyPgpDT05GSUdfU0VOU09SU19BRE0x
MDI2PW08YnI+CkNPTkZJR19TRU5TT1JTX0FETTEwMjk9bTxicj4KIyBDT05GSUdfU0VOU09SU19B
RE0xMDMxIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0FETTkyNDA9bTxicj4KQ09ORklH
X1NFTlNPUlNfQURUN1gxMD1tPGJyPgpDT05GSUdfU0VOU09SU19BRFQ3NDEwPW08YnI+CkNPTkZJ
R19TRU5TT1JTX0FEVDc0MTE9bTxicj4KQ09ORklHX1NFTlNPUlNfQURUNzQ2Mj1tPGJyPgpDT05G
SUdfU0VOU09SU19BRFQ3NDcwPW08YnI+CiMgQ09ORklHX1NFTlNPUlNfQURUNzQ3NSBpcyBub3Qg
c2V0PGJyPgpDT05GSUdfU0VOU09SU19BU0M3NjIxPW08YnI+CiMgQ09ORklHX1NFTlNPUlNfSzhU
RU1QIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0sxMFRFTVA9bTxicj4KIyBDT05GSUdf
U0VOU09SU19GQU0xNUhfUE9XRVIgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNfQVBQTEVT
TUM9bTxicj4KIyBDT05GSUdfU0VOU09SU19BU0IxMDAgaXMgbm90IHNldDxicj4KIyBDT05GSUdf
U0VOU09SU19BU1BFRUQgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNfQVRYUDE9bTxicj4K
IyBDT05GSUdfU0VOU09SU19EUzYyMCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0VOU09SU19EUzE2
MjE9bTxicj4KQ09ORklHX1NFTlNPUlNfREVMTF9TTU09bTxicj4KIyBDT05GSUdfU0VOU09SU19J
NUtfQU1CIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0Y3MTgwNUY9bTxicj4KQ09ORklH
X1NFTlNPUlNfRjcxODgyRkc9bTxicj4KIyBDT05GSUdfU0VOU09SU19GNzUzNzVTIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19TRU5TT1JTX01DMTM3ODNfQURDPW08YnI+CiMgQ09ORklHX1NFTlNPUlNf
RlNDSE1EIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0ZUU1RFVVRBVEVTPW08YnI+CkNP
TkZJR19TRU5TT1JTX0dMNTE4U009bTxicj4KQ09ORklHX1NFTlNPUlNfR0w1MjBTTT1tPGJyPgpD
T05GSUdfU0VOU09SU19HNzYwQT1tPGJyPgpDT05GSUdfU0VOU09SU19HNzYyPW08YnI+CkNPTkZJ
R19TRU5TT1JTX0dQSU9fRkFOPW08YnI+CkNPTkZJR19TRU5TT1JTX0hJSDYxMzA9bTxicj4KQ09O
RklHX1NFTlNPUlNfSUJNQUVNPW08YnI+CiMgQ09ORklHX1NFTlNPUlNfSUJNUEVYIGlzIG5vdCBz
ZXQ8YnI+CiMgQ09ORklHX1NFTlNPUlNfSUlPX0hXTU9OIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklH
X1NFTlNPUlNfSTU1MDAgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNfQ09SRVRFTVA9eTxi
cj4KQ09ORklHX1NFTlNPUlNfSVQ4Nz1tPGJyPgojIENPTkZJR19TRU5TT1JTX0pDNDIgaXMgbm90
IHNldDxicj4KQ09ORklHX1NFTlNPUlNfUE9XUjEyMjA9bTxicj4KQ09ORklHX1NFTlNPUlNfTElO
RUFHRT1tPGJyPgojIENPTkZJR19TRU5TT1JTX0xUQzI5NDUgaXMgbm90IHNldDxicj4KIyBDT05G
SUdfU0VOU09SU19MVEMyOTkwIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0xUQzQxNTE9
bTxicj4KQ09ORklHX1NFTlNPUlNfTFRDNDIxNT1tPGJyPgpDT05GSUdfU0VOU09SU19MVEM0MjIy
PW08YnI+CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI0NSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0VO
U09SU19MVEM0MjYwPW08YnI+CkNPTkZJR19TRU5TT1JTX0xUQzQyNjE9bTxicj4KQ09ORklHX1NF
TlNPUlNfTUFYMTYwNjU9bTxicj4KQ09ORklHX1NFTlNPUlNfTUFYMTYxOT1tPGJyPgpDT05GSUdf
U0VOU09SU19NQVgxNjY4PW08YnI+CkNPTkZJR19TRU5TT1JTX01BWDE5Nz1tPGJyPgojIENPTkZJ
R19TRU5TT1JTX01BWDY2MjEgaXMgbm90IHNldDxicj4KIyBDT05GSUdfU0VOU09SU19NQVg2NjM5
IGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX1NFTlNPUlNfTUFYNjY0MiBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfU0VOU09SU19NQVg2NjUwPW08YnI+CkNPTkZJR19TRU5TT1JTX01BWDY2OTc9bTxicj4K
Q09ORklHX1NFTlNPUlNfTUFYMzE3OTA9bTxicj4KQ09ORklHX1NFTlNPUlNfTUNQMzAyMT1tPGJy
PgpDT05GSUdfU0VOU09SU19UQzY1ND1tPGJyPgpDT05GSUdfU0VOU09SU19NRU5GMjFCTUNfSFdN
T049bTxicj4KQ09ORklHX1NFTlNPUlNfTE02Mz1tPGJyPgojIENPTkZJR19TRU5TT1JTX0xNNzMg
aXMgbm90IHNldDxicj4KIyBDT05GSUdfU0VOU09SU19MTTc1IGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19TRU5TT1JTX0xNNzc9bTxicj4KIyBDT05GSUdfU0VOU09SU19MTTc4IGlzIG5vdCBzZXQ8YnI+
CiMgQ09ORklHX1NFTlNPUlNfTE04MCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TRU5TT1JTX0xN
ODMgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNfTE04NT1tPGJyPgpDT05GSUdfU0VOU09S
U19MTTg3PW08YnI+CiMgQ09ORklHX1NFTlNPUlNfTE05MCBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
U0VOU09SU19MTTkyPW08YnI+CkNPTkZJR19TRU5TT1JTX0xNOTM9bTxicj4KQ09ORklHX1NFTlNP
UlNfTE05NTIzND1tPGJyPgojIENPTkZJR19TRU5TT1JTX0xNOTUyNDEgaXMgbm90IHNldDxicj4K
IyBDT05GSUdfU0VOU09SU19MTTk1MjQ1IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX1BD
ODczNjA9eTxicj4KQ09ORklHX1NFTlNPUlNfUEM4NzQyNz1tPGJyPgpDT05GSUdfU0VOU09SU19O
VENfVEhFUk1JU1RPUj1tPGJyPgojIENPTkZJR19TRU5TT1JTX05DVDY2ODMgaXMgbm90IHNldDxi
cj4KQ09ORklHX1NFTlNPUlNfTkNUNjc3NT15PGJyPgpDT05GSUdfU0VOU09SU19OQ1Q3ODAyPW08
YnI+CkNPTkZJR19TRU5TT1JTX05DVDc5MDQ9bTxicj4KQ09ORklHX1NFTlNPUlNfUENGODU5MT1t
PGJyPgpDT05GSUdfUE1CVVM9bTxicj4KIyBDT05GSUdfU0VOU09SU19QTUJVUyBpcyBub3Qgc2V0
PGJyPgojIENPTkZJR19TRU5TT1JTX0FETTEyNzUgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNP
UlNfSUJNX0NGRlBTPW08YnI+CkNPTkZJR19TRU5TT1JTX0lSMzUyMjE9bTxicj4KQ09ORklHX1NF
TlNPUlNfTE0yNTA2Nj1tPGJyPgpDT05GSUdfU0VOU09SU19MVEMyOTc4PW08YnI+CiMgQ09ORklH
X1NFTlNPUlNfTFRDMjk3OF9SRUdVTEFUT1IgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNf
TFRDMzgxNT1tPGJyPgojIENPTkZJR19TRU5TT1JTX01BWDE2MDY0IGlzIG5vdCBzZXQ8YnI+CkNP
TkZJR19TRU5TT1JTX01BWDIwNzUxPW08YnI+CkNPTkZJR19TRU5TT1JTX01BWDMxNzg1PW08YnI+
CiMgQ09ORklHX1NFTlNPUlNfTUFYMzQ0NDAgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNf
TUFYODY4OD1tPGJyPgpDT05GSUdfU0VOU09SU19UUFM0MDQyMj1tPGJyPgpDT05GSUdfU0VOU09S
U19UUFM1MzY3OT1tPGJyPgpDT05GSUdfU0VOU09SU19VQ0Q5MDAwPW08YnI+CkNPTkZJR19TRU5T
T1JTX1VDRDkyMDA9bTxicj4KIyBDT05GSUdfU0VOU09SU19aTDYxMDAgaXMgbm90IHNldDxicj4K
Q09ORklHX1NFTlNPUlNfUFdNX0ZBTj1tPGJyPgojIENPTkZJR19TRU5TT1JTX1NIVDE1IGlzIG5v
dCBzZXQ8YnI+CiMgQ09ORklHX1NFTlNPUlNfU0hUMjEgaXMgbm90IHNldDxicj4KIyBDT05GSUdf
U0VOU09SU19TSFQzeCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0VOU09SU19TSFRDMT1tPGJyPgoj
IENPTkZJR19TRU5TT1JTX1NJUzU1OTUgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNfRE1F
MTczNz1tPGJyPgojIENPTkZJR19TRU5TT1JTX0VNQzE0MDMgaXMgbm90IHNldDxicj4KIyBDT05G
SUdfU0VOU09SU19FTUMyMTAzIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0VNQzZXMjAx
PW08YnI+CiMgQ09ORklHX1NFTlNPUlNfU01TQzQ3TTEgaXMgbm90IHNldDxicj4KQ09ORklHX1NF
TlNPUlNfU01TQzQ3TTE5Mj1tPGJyPgpDT05GSUdfU0VOU09SU19TTVNDNDdCMzk3PXk8YnI+CkNP
TkZJR19TRU5TT1JTX1NDSDU2WFhfQ09NTU9OPXk8YnI+CiMgQ09ORklHX1NFTlNPUlNfU0NINTYy
NyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0VOU09SU19TQ0g1NjM2PXk8YnI+CkNPTkZJR19TRU5T
T1JTX1NUVFM3NTE9bTxicj4KQ09ORklHX1NFTlNPUlNfU01NNjY1PW08YnI+CkNPTkZJR19TRU5T
T1JTX0FEQzEyOEQ4MTg9bTxicj4KQ09ORklHX1NFTlNPUlNfQURTMTAxNT1tPGJyPgojIENPTkZJ
R19TRU5TT1JTX0FEUzc4MjggaXMgbm90IHNldDxicj4KIyBDT05GSUdfU0VOU09SU19BTUM2ODIx
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX0lOQTIwOT1tPGJyPgojIENPTkZJR19TRU5T
T1JTX0lOQTJYWCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19TRU5TT1JTX0lOQTMyMjEgaXMgbm90
IHNldDxicj4KIyBDT05GSUdfU0VOU09SU19UQzc0IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5T
T1JTX1RITUM1MD1tPGJyPgpDT05GSUdfU0VOU09SU19UTVAxMDI9bTxicj4KQ09ORklHX1NFTlNP
UlNfVE1QMTAzPW08YnI+CiMgQ09ORklHX1NFTlNPUlNfVE1QMTA4IGlzIG5vdCBzZXQ8YnI+CkNP
TkZJR19TRU5TT1JTX1RNUDQwMT1tPGJyPgojIENPTkZJR19TRU5TT1JTX1RNUDQyMSBpcyBub3Qg
c2V0PGJyPgpDT05GSUdfU0VOU09SU19WSUFfQ1BVVEVNUD15PGJyPgojIENPTkZJR19TRU5TT1JT
X1ZJQTY4NkEgaXMgbm90IHNldDxicj4KQ09ORklHX1NFTlNPUlNfVlQxMjExPW08YnI+CiMgQ09O
RklHX1NFTlNPUlNfVlQ4MjMxIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX1c4Mzc3M0c9
bTxicj4KQ09ORklHX1NFTlNPUlNfVzgzNzgxRD1tPGJyPgpDT05GSUdfU0VOU09SU19XODM3OTFE
PW08YnI+CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkyRCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0VO
U09SU19XODM3OTM9bTxicj4KIyBDT05GSUdfU0VOU09SU19XODM3OTUgaXMgbm90IHNldDxicj4K
Q09ORklHX1NFTlNPUlNfVzgzTDc4NVRTPW08YnI+CiMgQ09ORklHX1NFTlNPUlNfVzgzTDc4Nk5H
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19TRU5TT1JTX1c4MzYyN0hGPXk8YnI+CiMgQ09ORklHX1NF
TlNPUlNfVzgzNjI3RUhGIGlzIG5vdCBzZXQ8YnI+Cjxicj4KIzxicj4KIyBBQ1BJIGRyaXZlcnM8
YnI+CiM8YnI+CkNPTkZJR19TRU5TT1JTX0FDUElfUE9XRVI9eTxicj4KIyBDT05GSUdfU0VOU09S
U19BVEswMTEwIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19USEVSTUFMPW08YnI+CiMgQ09ORklHX1RI
RVJNQUxfU1RBVElTVElDUyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfVEhFUk1BTF9FTUVSR0VOQ1lf
UE9XRVJPRkZfREVMQVlfTVM9MDxicj4KQ09ORklHX1RIRVJNQUxfSFdNT049eTxicj4KQ09ORklH
X1RIRVJNQUxfT0Y9eTxicj4KQ09ORklHX1RIRVJNQUxfV1JJVEFCTEVfVFJJUFM9eTxicj4KIyBD
T05GSUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9TVEVQX1dJU0UgaXMgbm90IHNldDxicj4KQ09ORklH
X1RIRVJNQUxfREVGQVVMVF9HT1ZfRkFJUl9TSEFSRT15PGJyPgojIENPTkZJR19USEVSTUFMX0RF
RkFVTFRfR09WX1VTRVJfU1BBQ0UgaXMgbm90IHNldDxicj4KIyBDT05GSUdfVEhFUk1BTF9ERUZB
VUxUX0dPVl9QT1dFUl9BTExPQ0FUT1IgaXMgbm90IHNldDxicj4KQ09ORklHX1RIRVJNQUxfR09W
X0ZBSVJfU0hBUkU9eTxicj4KIyBDT05GSUdfVEhFUk1BTF9HT1ZfU1RFUF9XSVNFIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19USEVSTUFMX0dPVl9CQU5HX0JBTkc9eTxicj4KQ09ORklHX1RIRVJNQUxf
R09WX1VTRVJfU1BBQ0U9eTxicj4KIyBDT05GSUdfVEhFUk1BTF9HT1ZfUE9XRVJfQUxMT0NBVE9S
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19USEVSTUFMX0VNVUxBVElPTj15PGJyPgojIENPTkZJR19R
T1JJUV9USEVSTUFMIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19EQTkwNjJfVEhFUk1BTD1tPGJyPgpD
T05GSUdfSU5URUxfU09DX0RUU19JT1NGX0NPUkU9bTxicj4KQ09ORklHX0lOVEVMX1NPQ19EVFNf
VEhFUk1BTD1tPGJyPgo8YnI+CiM8YnI+CiMgQUNQSSBJTlQzNDBYIHRoZXJtYWwgZHJpdmVyczxi
cj4KIzxicj4KQ09ORklHX0lOVDM0MFhfVEhFUk1BTD1tPGJyPgpDT05GSUdfQUNQSV9USEVSTUFM
X1JFTD1tPGJyPgpDT05GSUdfSU5UMzQwNl9USEVSTUFMPW08YnI+CiMgQ09ORklHX0lOVEVMX0JY
VF9QTUlDX1RIRVJNQUwgaXMgbm90IHNldDxicj4KQ09ORklHX0lOVEVMX1BDSF9USEVSTUFMPW08
YnI+CkNPTkZJR19RQ09NX1NQTUlfVEVNUF9BTEFSTT1tPGJyPgpDT05GSUdfR0VORVJJQ19BRENf
VEhFUk1BTD1tPGJyPgpDT05GSUdfV0FUQ0hET0c9eTxicj4KQ09ORklHX1dBVENIRE9HX0NPUkU9
eTxicj4KQ09ORklHX1dBVENIRE9HX05PV0FZT1VUPXk8YnI+CkNPTkZJR19XQVRDSERPR19IQU5E
TEVfQk9PVF9FTkFCTEVEPXk8YnI+CiMgQ09ORklHX1dBVENIRE9HX1NZU0ZTIGlzIG5vdCBzZXQ8
YnI+Cjxicj4KIzxicj4KIyBXYXRjaGRvZyBEZXZpY2UgRHJpdmVyczxicj4KIzxicj4KQ09ORklH
X1NPRlRfV0FUQ0hET0c9bTxicj4KIyBDT05GSUdfREE5MDYyX1dBVENIRE9HIGlzIG5vdCBzZXQ8
YnI+CkNPTkZJR19HUElPX1dBVENIRE9HPW08YnI+CkNPTkZJR19NRU5GMjFCTUNfV0FUQ0hET0c9
bTxicj4KIyBDT05GSUdfV0RBVF9XRFQgaXMgbm90IHNldDxicj4KQ09ORklHX1hJTElOWF9XQVRD
SERPRz15PGJyPgojIENPTkZJR19aSUlSQVZFX1dBVENIRE9HIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19DQURFTkNFX1dBVENIRE9HPXk8YnI+CiMgQ09ORklHX0RXX1dBVENIRE9HIGlzIG5vdCBzZXQ8
YnI+CkNPTkZJR19STjVUNjE4X1dBVENIRE9HPW08YnI+CiMgQ09ORklHX01BWDYzWFhfV0FUQ0hE
T0cgaXMgbm90IHNldDxicj4KQ09ORklHX1JFVFVfV0FUQ0hET0c9bTxicj4KQ09ORklHX0FDUVVJ
UkVfV0RUPXk8YnI+CkNPTkZJR19BRFZBTlRFQ0hfV0RUPXk8YnI+CkNPTkZJR19BTElNMTUzNV9X
RFQ9eTxicj4KQ09ORklHX0FMSU03MTAxX1dEVD15PGJyPgpDT05GSUdfRUJDX0MzODRfV0RUPXk8
YnI+CkNPTkZJR19GNzE4MDhFX1dEVD15PGJyPgpDT05GSUdfU1A1MTAwX1RDTz15PGJyPgojIENP
TkZJR19TQkNfRklUUEMyX1dBVENIRE9HIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0VVUk9URUNI
X1dEVCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSUI3MDBfV0RUPXk8YnI+CkNPTkZJR19JQk1BU1I9
eTxicj4KQ09ORklHX1dBRkVSX1dEVD15PGJyPgpDT05GSUdfSTYzMDBFU0JfV0RUPXk8YnI+CiMg
Q09ORklHX0lFNlhYX1dEVCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfSVRDT19XRFQ9bTxicj4KQ09O
RklHX0lUQ09fVkVORE9SX1NVUFBPUlQ9eTxicj4KQ09ORklHX0lUODcxMkZfV0RUPXk8YnI+CiMg
Q09ORklHX0lUODdfV0RUIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19IUF9XQVRDSERPRz1tPGJyPgpD
T05GSUdfS0VNUExEX1dEVD1tPGJyPgpDT05GSUdfSFBXRFRfTk1JX0RFQ09ESU5HPXk8YnI+CkNP
TkZJR19TQzEyMDBfV0RUPXk8YnI+CkNPTkZJR19QQzg3NDEzX1dEVD1tPGJyPgpDT05GSUdfTlZf
VENPPXk8YnI+CkNPTkZJR182MFhYX1dEVD1tPGJyPgpDT05GSUdfQ1BVNV9XRFQ9eTxicj4KQ09O
RklHX1NNU0NfU0NIMzExWF9XRFQ9bTxicj4KQ09ORklHX1NNU0MzN0I3ODdfV0RUPXk8YnI+CkNP
TkZJR19WSUFfV0RUPXk8YnI+CkNPTkZJR19XODM2MjdIRl9XRFQ9eTxicj4KIyBDT05GSUdfVzgz
ODc3Rl9XRFQgaXMgbm90IHNldDxicj4KQ09ORklHX1c4Mzk3N0ZfV0RUPXk8YnI+CiMgQ09ORklH
X01BQ0haX1dEVCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU0JDX0VQWF9DM19XQVRDSERPRz15PGJy
PgpDT05GSUdfSU5URUxfTUVJX1dEVD1tPGJyPgojIENPTkZJR19OSTkwM1hfV0RUIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19OSUM3MDE4X1dEVD15PGJyPgpDT05GSUdfTUVOX0EyMV9XRFQ9bTxicj4K
Q09ORklHX1hFTl9XRFQ9eTxicj4KPGJyPgojPGJyPgojIFBDSS1iYXNlZCBXYXRjaGRvZyBDYXJk
czxicj4KIzxicj4KIyBDT05GSUdfUENJUENXQVRDSERPRyBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
V0RUUENJPXk8YnI+Cjxicj4KIzxicj4KIyBVU0ItYmFzZWQgV2F0Y2hkb2cgQ2FyZHM8YnI+CiM8
YnI+CiMgQ09ORklHX1VTQlBDV0FUQ0hET0cgaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIFdh
dGNoZG9nIFByZXRpbWVvdXQgR292ZXJub3JzPGJyPgojPGJyPgojIENPTkZJR19XQVRDSERPR19Q
UkVUSU1FT1VUX0dPViBpcyBub3Qgc2V0PGJyPgpDT05GSUdfU1NCX1BPU1NJQkxFPXk8YnI+CkNP
TkZJR19TU0I9eTxicj4KQ09ORklHX1NTQl9TUFJPTT15PGJyPgpDT05GSUdfU1NCX1BDSUhPU1Rf
UE9TU0lCTEU9eTxicj4KQ09ORklHX1NTQl9QQ0lIT1NUPXk8YnI+CkNPTkZJR19TU0JfU0lMRU5U
PXk8YnI+CkNPTkZJR19TU0JfRFJJVkVSX1BDSUNPUkVfUE9TU0lCTEU9eTxicj4KQ09ORklHX1NT
Ql9EUklWRVJfUENJQ09SRT15PGJyPgpDT05GSUdfU1NCX0RSSVZFUl9HUElPPXk8YnI+CkNPTkZJ
R19CQ01BX1BPU1NJQkxFPXk8YnI+CkNPTkZJR19CQ01BPW08YnI+CkNPTkZJR19CQ01BX0hPU1Rf
UENJX1BPU1NJQkxFPXk8YnI+CiMgQ09ORklHX0JDTUFfSE9TVF9QQ0kgaXMgbm90IHNldDxicj4K
IyBDT05GSUdfQkNNQV9IT1NUX1NPQyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfQkNNQV9EUklWRVJf
UENJPXk8YnI+CiMgQ09ORklHX0JDTUFfRFJJVkVSX0dNQUNfQ01OIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX0JDTUFfRFJJVkVSX0dQSU8gaXMgbm90IHNldDxicj4KIyBDT05GSUdfQkNNQV9ERUJV
RyBpcyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVy
czxicj4KIzxicj4KQ09ORklHX01GRF9DT1JFPXk8YnI+CkNPTkZJR19NRkRfQUNUODk0NUE9bTxi
cj4KQ09ORklHX01GRF9BVE1FTF9GTEVYQ09NPXk8YnI+CkNPTkZJR19NRkRfQVRNRUxfSExDREM9
bTxicj4KIyBDT05GSUdfTUZEX0JDTTU5MFhYIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NRkRfQkQ5
NTcxTVdWPW08YnI+CiMgQ09ORklHX01GRF9BWFAyMFhfSTJDIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19NRkRfQ1JPU19FQz15PGJyPgojIENPTkZJR19NRkRfQ1JPU19FQ19JMkMgaXMgbm90IHNldDxi
cj4KQ09ORklHX01GRF9DUk9TX0VDX0NIQVJERVY9eTxicj4KQ09ORklHX01GRF9EQTkwNjI9bTxi
cj4KIyBDT05GSUdfTUZEX0RBOTA2MyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTUZEX0RBOTE1MD1t
PGJyPgojIENPTkZJR19NRkRfRExOMiBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTUZEX01DMTNYWFg9
bTxicj4KQ09ORklHX01GRF9NQzEzWFhYX0kyQz1tPGJyPgojIENPTkZJR19NRkRfSEk2NDIxX1BN
SUMgaXMgbm90IHNldDxicj4KQ09ORklHX0hUQ19QQVNJQzM9bTxicj4KIyBDT05GSUdfTUZEX0lO
VEVMX1FVQVJLX0kyQ19HUElPIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19MUENfSUNIPXk8YnI+CkNP
TkZJR19MUENfU0NIPW08YnI+CkNPTkZJR19JTlRFTF9TT0NfUE1JQ19CWFRXQz1tPGJyPgpDT05G
SUdfSU5URUxfU09DX1BNSUNfQ0hURENfVEk9bTxicj4KQ09ORklHX01GRF9JTlRFTF9MUFNTPW08
YnI+CkNPTkZJR19NRkRfSU5URUxfTFBTU19BQ1BJPW08YnI+CkNPTkZJR19NRkRfSU5URUxfTFBT
U19QQ0k9bTxicj4KQ09ORklHX01GRF9KQU5aX0NNT0RJTz15PGJyPgpDT05GSUdfTUZEX0tFTVBM
RD1tPGJyPgpDT05GSUdfTUZEXzg4UE04MDA9bTxicj4KQ09ORklHX01GRF84OFBNODA1PW08YnI+
CkNPTkZJR19NRkRfTUFYMTQ1Nzc9bTxicj4KIyBDT05GSUdfTUZEX01BWDc3Njg2IGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19NRkRfTUFYNzc2OTM9bTxicj4KIyBDT05GSUdfTUZEX01BWDg5MDcgaXMg
bm90IHNldDxicj4KIyBDT05GSUdfTUZEX01UNjM5NyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTUZE
X01FTkYyMUJNQz1tPGJyPgpDT05GSUdfTUZEX1ZJUEVSQk9BUkQ9bTxicj4KQ09ORklHX01GRF9S
RVRVPW08YnI+CiMgQ09ORklHX01GRF9QQ0Y1MDYzMyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfVUNC
MTQwMF9DT1JFPW08YnI+CkNPTkZJR19NRkRfUkRDMzIxWD15PGJyPgojIENPTkZJR19NRkRfUlQ1
MDMzIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX01GRF9SSzgwOCBpcyBub3Qgc2V0PGJyPgpDT05G
SUdfTUZEX1JONVQ2MTg9bTxicj4KQ09ORklHX01GRF9TSTQ3NlhfQ09SRT1tPGJyPgojIENPTkZJ
R19NRkRfU001MDEgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5vdCBz
ZXQ8YnI+CkNPTkZJR19BQlg1MDBfQ09SRT15PGJyPgpDT05GSUdfTUZEX1NZU0NPTj15PGJyPgoj
IENPTkZJR19NRkRfVElfQU0zMzVYX1RTQ0FEQyBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19NRkRf
TFAzOTQzIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NRkRfVElfTE1VPW08YnI+CkNPTkZJR19UUFM2
MTA1WD1tPGJyPgojIENPTkZJR19UUFM2NTAxMCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19UUFM2
NTA3WCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19NRkRfVFBTNjUwODYgaXMgbm90IHNldDxicj4K
Q09ORklHX01GRF9UUFM2NTIxNz1tPGJyPgpDT05GSUdfTUZEX1RJX0xQODczWD1tPGJyPgojIENP
TkZJR19NRkRfVElfTFA4NzU2NSBpcyBub3Qgc2V0PGJyPgpDT05GSUdfTUZEX1RQUzY1MjE4PW08
YnI+CkNPTkZJR19NRkRfVFBTNjU5MTI9bTxicj4KQ09ORklHX01GRF9UUFM2NTkxMl9JMkM9bTxi
cj4KQ09ORklHX01GRF9XTDEyNzNfQ09SRT1tPGJyPgojIENPTkZJR19NRkRfTE0zNTMzIGlzIG5v
dCBzZXQ8YnI+CkNPTkZJR19NRkRfVlg4NTU9eTxicj4KQ09ORklHX01GRF9BUklaT05BPXk8YnI+
CkNPTkZJR19NRkRfQVJJWk9OQV9JMkM9bTxicj4KQ09ORklHX01GRF9DUzQ3TDI0PXk8YnI+CkNP
TkZJR19NRkRfV001MTAyPXk8YnI+CkNPTkZJR19NRkRfV001MTEwPXk8YnI+CiMgQ09ORklHX01G
RF9XTTg5OTcgaXMgbm90IHNldDxicj4KQ09ORklHX01GRF9XTTg5OTg9eTxicj4KQ09ORklHX01G
RF9XTTg5OTQ9bTxicj4KQ09ORklHX1JFR1VMQVRPUj15PGJyPgpDT05GSUdfUkVHVUxBVE9SX0RF
QlVHPXk8YnI+CkNPTkZJR19SRUdVTEFUT1JfRklYRURfVk9MVEFHRT1tPGJyPgojIENPTkZJR19S
RUdVTEFUT1JfVklSVFVBTF9DT05TVU1FUiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19SRUdVTEFU
T1JfVVNFUlNQQUNFX0NPTlNVTUVSIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19SRUdVTEFUT1JfODhQ
Rzg2WD1tPGJyPgpDT05GSUdfUkVHVUxBVE9SXzg4UE04MDA9bTxicj4KIyBDT05GSUdfUkVHVUxB
VE9SX0FDVDg4NjUgaXMgbm90IHNldDxicj4KIyBDT05GSUdfUkVHVUxBVE9SX0FDVDg5NDVBIGlz
IG5vdCBzZXQ8YnI+CiMgQ09ORklHX1JFR1VMQVRPUl9BRDUzOTggaXMgbm90IHNldDxicj4KQ09O
RklHX1JFR1VMQVRPUl9BTkFUT1A9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9BUklaT05BX0xETzE9
bTxicj4KQ09ORklHX1JFR1VMQVRPUl9BUklaT05BX01JQ1NVUFA9bTxicj4KQ09ORklHX1JFR1VM
QVRPUl9CRDk1NzFNV1Y9bTxicj4KIyBDT05GSUdfUkVHVUxBVE9SX0RBOTA2MiBpcyBub3Qgc2V0
PGJyPgpDT05GSUdfUkVHVUxBVE9SX0RBOTIxMD1tPGJyPgpDT05GSUdfUkVHVUxBVE9SX0RBOTIx
MT1tPGJyPgpDT05GSUdfUkVHVUxBVE9SX0ZBTjUzNTU1PW08YnI+CkNPTkZJR19SRUdVTEFUT1Jf
R1BJTz1tPGJyPgojIENPTkZJR19SRUdVTEFUT1JfSVNMOTMwNSBpcyBub3Qgc2V0PGJyPgojIENP
TkZJR19SRUdVTEFUT1JfSVNMNjI3MUEgaXMgbm90IHNldDxicj4KQ09ORklHX1JFR1VMQVRPUl9M
TTM2M1g9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9MUDM5NzE9bTxicj4KQ09ORklHX1JFR1VMQVRP
Ul9MUDM5NzI9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9MUDg3Mlg9bTxicj4KQ09ORklHX1JFR1VM
QVRPUl9MUDg3M1g9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9MUDg3NTU9bTxicj4KIyBDT05GSUdf
UkVHVUxBVE9SX0xUQzM1ODkgaXMgbm90IHNldDxicj4KQ09ORklHX1JFR1VMQVRPUl9MVEMzNjc2
PW08YnI+CiMgQ09ORklHX1JFR1VMQVRPUl9NQVgxNDU3NyBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
UkVHVUxBVE9SX01BWDE1ODY9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9NQVg4NjQ5PW08YnI+CiMg
Q09ORklHX1JFR1VMQVRPUl9NQVg4NjYwIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19SRUdVTEFUT1Jf
TUFYODk1Mj1tPGJyPgpDT05GSUdfUkVHVUxBVE9SX01BWDg5NzM9bTxicj4KQ09ORklHX1JFR1VM
QVRPUl9NQVg3NzY5Mz1tPGJyPgpDT05GSUdfUkVHVUxBVE9SX01DMTNYWFhfQ09SRT1tPGJyPgoj
IENPTkZJR19SRUdVTEFUT1JfTUMxMzc4MyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUkVHVUxBVE9S
X01DMTM4OTI9bTxicj4KIyBDT05GSUdfUkVHVUxBVE9SX01UNjMxMSBpcyBub3Qgc2V0PGJyPgpD
T05GSUdfUkVHVUxBVE9SX1BGVVpFMTAwPW08YnI+CkNPTkZJR19SRUdVTEFUT1JfUFY4ODA2MD1t
PGJyPgojIENPTkZJR19SRUdVTEFUT1JfUFY4ODA4MCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUkVH
VUxBVE9SX1BWODgwOTA9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9QV009bTxicj4KQ09ORklHX1JF
R1VMQVRPUl9RQ09NX1NQTUk9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9STjVUNjE4PW08YnI+CiMg
Q09ORklHX1JFR1VMQVRPUl9TWTgxMDZBIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19SRUdVTEFUT1Jf
VFBTNTE2MzI9bTxicj4KQ09ORklHX1JFR1VMQVRPUl9UUFM2MTA1WD1tPGJyPgojIENPTkZJR19S
RUdVTEFUT1JfVFBTNjIzNjAgaXMgbm90IHNldDxicj4KIyBDT05GSUdfUkVHVUxBVE9SX1RQUzY1
MDIzIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19SRUdVTEFUT1JfVFBTNjUwN1g9bTxicj4KQ09ORklH
X1JFR1VMQVRPUl9UUFM2NTEzMj1tPGJyPgpDT05GSUdfUkVHVUxBVE9SX1RQUzY1MjE3PW08YnI+
CiMgQ09ORklHX1JFR1VMQVRPUl9UUFM2NTIxOCBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUkVHVUxB
VE9SX1RQUzY1OTEyPW08YnI+CiMgQ09ORklHX1JFR1VMQVRPUl9WQ1RSTCBpcyBub3Qgc2V0PGJy
PgpDT05GSUdfUkVHVUxBVE9SX1dNODk5ND1tPGJyPgpDT05GSUdfQ0VDX0NPUkU9bTxicj4KQ09O
RklHX0NFQ19OT1RJRklFUj15PGJyPgpDT05GSUdfUkNfQ09SRT1tPGJyPgojIENPTkZJR19SQ19N
QVAgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTElSQyBpcyBub3Qgc2V0PGJyPgpDT05GSUdfUkNf
REVDT0RFUlM9eTxicj4KIyBDT05GSUdfSVJfTkVDX0RFQ09ERVIgaXMgbm90IHNldDxicj4KQ09O
RklHX0lSX1JDNV9ERUNPREVSPW08YnI+CkNPTkZJR19JUl9SQzZfREVDT0RFUj1tPGJyPgpDT05G
SUdfSVJfSlZDX0RFQ09ERVI9bTxicj4KQ09ORklHX0lSX1NPTllfREVDT0RFUj1tPGJyPgpDT05G
SUdfSVJfU0FOWU9fREVDT0RFUj1tPGJyPgpDT05GSUdfSVJfU0hBUlBfREVDT0RFUj1tPGJyPgpD
T05GSUdfSVJfTUNFX0tCRF9ERUNPREVSPW08YnI+CiMgQ09ORklHX0lSX1hNUF9ERUNPREVSIGlz
IG5vdCBzZXQ8YnI+CiMgQ09ORklHX0lSX0lNT05fREVDT0RFUiBpcyBub3Qgc2V0PGJyPgpDT05G
SUdfUkNfREVWSUNFUz15PGJyPgojIENPTkZJR19SQ19BVElfUkVNT1RFIGlzIG5vdCBzZXQ8YnI+
CkNPTkZJR19JUl9FTkU9bTxicj4KIyBDT05GSUdfSVJfSElYNUhEMiBpcyBub3Qgc2V0PGJyPgoj
IENPTkZJR19JUl9JTU9OIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JUl9JTU9OX1JBVz1tPGJyPgoj
IENPTkZJR19JUl9NQ0VVU0IgaXMgbm90IHNldDxicj4KIyBDT05GSUdfSVJfSVRFX0NJUiBpcyBu
b3Qgc2V0PGJyPgpDT05GSUdfSVJfRklOVEVLPW08YnI+CiMgQ09ORklHX0lSX05VVk9UT04gaXMg
bm90IHNldDxicj4KQ09ORklHX0lSX1JFRFJBVDM9bTxicj4KQ09ORklHX0lSX1NUUkVBTVpBUD1t
PGJyPgpDT05GSUdfSVJfV0lOQk9ORF9DSVI9bTxicj4KQ09ORklHX0lSX0lHT1JQTFVHVVNCPW08
YnI+CkNPTkZJR19JUl9JR1VBTkE9bTxicj4KQ09ORklHX0lSX1RUVVNCSVI9bTxicj4KQ09ORklH
X1JDX0xPT1BCQUNLPW08YnI+CkNPTkZJR19JUl9HUElPX0NJUj1tPGJyPgojIENPTkZJR19JUl9T
RVJJQUwgaXMgbm90IHNldDxicj4KIyBDT05GSUdfSVJfU0lSIGlzIG5vdCBzZXQ8YnI+CkNPTkZJ
R19NRURJQV9TVVBQT1JUPW08YnI+Cjxicj4KIzxicj4KIyBNdWx0aW1lZGlhIGNvcmUgc3VwcG9y
dDxicj4KIzxicj4KIyBDT05GSUdfTUVESUFfQ0FNRVJBX1NVUFBPUlQgaXMgbm90IHNldDxicj4K
Q09ORklHX01FRElBX0FOQUxPR19UVl9TVVBQT1JUPXk8YnI+CiMgQ09ORklHX01FRElBX0RJR0lU
QUxfVFZfU1VQUE9SVCBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19NRURJQV9SQURJT19TVVBQT1JU
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19NRURJQV9TRFJfU1VQUE9SVD15PGJyPgpDT05GSUdfTUVE
SUFfQ0VDX1NVUFBPUlQ9eTxicj4KIyBDT05GSUdfTUVESUFfQ0VDX1JDIGlzIG5vdCBzZXQ8YnI+
CkNPTkZJR19NRURJQV9DT05UUk9MTEVSPXk8YnI+CkNPTkZJR19WSURFT19ERVY9bTxicj4KQ09O
RklHX1ZJREVPX1Y0TDJfU1VCREVWX0FQST15PGJyPgpDT05GSUdfVklERU9fVjRMMj1tPGJyPgoj
IENPTkZJR19WSURFT19BRFZfREVCVUcgaXMgbm90IHNldDxicj4KQ09ORklHX1ZJREVPX0ZJWEVE
X01JTk9SX1JBTkdFUz15PGJyPgojIENPTkZJR19WNEwyX0ZMQVNIX0xFRF9DTEFTUyBpcyBub3Qg
c2V0PGJyPgo8YnI+CiM8YnI+CiMgTWVkaWEgZHJpdmVyczxicj4KIzxicj4KIyBDT05GSUdfTUVE
SUFfVVNCX1NVUFBPUlQgaXMgbm90IHNldDxicj4KIyBDT05GSUdfTUVESUFfUENJX1NVUFBPUlQg
aXMgbm90IHNldDxicj4KIyBDT05GSUdfQ0VDX1BMQVRGT1JNX0RSSVZFUlMgaXMgbm90IHNldDxi
cj4KIyBDT05GSUdfU0RSX1BMQVRGT1JNX0RSSVZFUlMgaXMgbm90IHNldDxicj4KPGJyPgojPGJy
PgojIFN1cHBvcnRlZCBNTUMvU0RJTyBhZGFwdGVyczxicj4KIzxicj4KQ09ORklHX0NZUFJFU1Nf
RklSTVdBUkU9bTxicj4KPGJyPgojPGJyPgojIE1lZGlhIGFuY2lsbGFyeSBkcml2ZXJzICh0dW5l
cnMsIHNlbnNvcnMsIGkyYywgc3BpLCBmcm9udGVuZHMpPGJyPgojPGJyPgpDT05GSUdfTUVESUFf
U1VCRFJWX0FVVE9TRUxFQ1Q9eTxicj4KQ09ORklHX01FRElBX0FUVEFDSD15PGJyPgpDT05GSUdf
VklERU9fSVJfSTJDPW08YnI+Cjxicj4KIzxicj4KIyBBdWRpbyBkZWNvZGVycywgcHJvY2Vzc29y
cyBhbmQgbWl4ZXJzPGJyPgojPGJyPgo8YnI+CiM8YnI+CiMgUkRTIGRlY29kZXJzPGJyPgojPGJy
Pgo8YnI+CiM8YnI+CiMgVmlkZW8gZGVjb2RlcnM8YnI+CiM8YnI+Cjxicj4KIzxicj4KIyBWaWRl
byBhbmQgYXVkaW8gZGVjb2RlcnM8YnI+CiM8YnI+Cjxicj4KIzxicj4KIyBWaWRlbyBlbmNvZGVy
czxicj4KIzxicj4KPGJyPgojPGJyPgojIENhbWVyYSBzZW5zb3IgZGV2aWNlczxicj4KIzxicj4K
PGJyPgojPGJyPgojIEZsYXNoIGRldmljZXM8YnI+CiM8YnI+Cjxicj4KIzxicj4KIyBWaWRlbyBp
bXByb3ZlbWVudCBjaGlwczxicj4KIzxicj4KPGJyPgojPGJyPgojIEF1ZGlvL1ZpZGVvIGNvbXBy
ZXNzaW9uIGNoaXBzPGJyPgojPGJyPgo8YnI+CiM8YnI+CiMgU0RSIHR1bmVyIGNoaXBzPGJyPgoj
PGJyPgo8YnI+CiM8YnI+CiMgTWlzY2VsbGFuZW91cyBoZWxwZXIgY2hpcHM8YnI+CiM8YnI+Cjxi
cj4KIzxicj4KIyBTZW5zb3JzIHVzZWQgb24gc29jX2NhbWVyYSBkcml2ZXI8YnI+CiM8YnI+CkNP
TkZJR19NRURJQV9UVU5FUj1tPGJyPgpDT05GSUdfTUVESUFfVFVORVJfU0lNUExFPW08YnI+CkNP
TkZJR19NRURJQV9UVU5FUl9UREE4MjkwPW08YnI+CkNPTkZJR19NRURJQV9UVU5FUl9UREE4MjdY
PW08YnI+CkNPTkZJR19NRURJQV9UVU5FUl9UREExODI3MT1tPGJyPgpDT05GSUdfTUVESUFfVFVO
RVJfVERBOTg4Nz1tPGJyPgpDT05GSUdfTUVESUFfVFVORVJfTVQyMFhYPW08YnI+CkNPTkZJR19N
RURJQV9UVU5FUl9YQzIwMjg9bTxicj4KQ09ORklHX01FRElBX1RVTkVSX1hDNTAwMD1tPGJyPgpD
T05GSUdfTUVESUFfVFVORVJfWEM0MDAwPW08YnI+CkNPTkZJR19NRURJQV9UVU5FUl9NQzQ0Uzgw
Mz1tPGJyPgo8YnI+CiM8YnI+CiMgVG9vbHMgdG8gZGV2ZWxvcCBuZXcgZnJvbnRlbmRzPGJyPgoj
PGJyPgo8YnI+CiM8YnI+CiMgR3JhcGhpY3Mgc3VwcG9ydDxicj4KIzxicj4KIyBDT05GSUdfQUdQ
IGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19JTlRFTF9HVFQ9bTxicj4KQ09ORklHX1ZHQV9BUkI9eTxi
cj4KQ09ORklHX1ZHQV9BUkJfTUFYX0dQVVM9MTY8YnI+CkNPTkZJR19WR0FfU1dJVENIRVJPTz15
PGJyPgpDT05GSUdfRFJNPW08YnI+CkNPTkZJR19EUk1fTUlQSV9EU0k9eTxicj4KIyBDT05GSUdf
RFJNX0RQX0FVWF9DSEFSREVWIGlzIG5vdCBzZXQ8YnI+CkNPTkZJR19EUk1fREVCVUdfU0VMRlRF
U1Q9bTxicj4KQ09ORklHX0RSTV9LTVNfSEVMUEVSPW08YnI+CkNPTkZJR19EUk1fS01TX0ZCX0hF
TFBFUj15PGJyPgojIENPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9OIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX0RSTV9MT0FEX0VESURfRklSTVdBUkUgaXMgbm90IHNldDxicj4KQ09ORklHX0RSTV9U
VE09bTxicj4KQ09ORklHX0RSTV9HRU1fQ01BX0hFTFBFUj15PGJyPgpDT05GSUdfRFJNX0tNU19D
TUFfSEVMUEVSPXk8YnI+CkNPTkZJR19EUk1fVk09eTxicj4KQ09ORklHX0RSTV9TQ0hFRD1tPGJy
Pgo8YnI+CiM8YnI+CiMgSTJDIGVuY29kZXIgb3IgaGVscGVyIGNoaXBzPGJyPgojPGJyPgpDT05G
SUdfRFJNX0kyQ19DSDcwMDY9bTxicj4KQ09ORklHX0RSTV9JMkNfU0lMMTY0PW08YnI+CiMgQ09O
RklHX0RSTV9JMkNfTlhQX1REQTk5OFggaXMgbm90IHNldDxicj4KQ09ORklHX0RSTV9JMkNfTlhQ
X1REQTk5NTA9bTxicj4KIyBDT05GSUdfRFJNX1JBREVPTiBpcyBub3Qgc2V0PGJyPgpDT05GSUdf
RFJNX0FNREdQVT1tPGJyPgojIENPTkZJR19EUk1fQU1ER1BVX1NJIGlzIG5vdCBzZXQ8YnI+CiMg
Q09ORklHX0RSTV9BTURHUFVfQ0lLIGlzIG5vdCBzZXQ8YnI+CiMgQ09ORklHX0RSTV9BTURHUFVf
VVNFUlBUUiBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19EUk1fQU1ER1BVX0dBUlRfREVCVUdGUyBp
cyBub3Qgc2V0PGJyPgo8YnI+CiM8YnI+CiMgQUNQIChBdWRpbyBDb1Byb2Nlc3NvcikgQ29uZmln
dXJhdGlvbjxicj4KIzxicj4KIyBDT05GSUdfRFJNX0FNRF9BQ1AgaXMgbm90IHNldDxicj4KPGJy
PgojPGJyPgojIERpc3BsYXkgRW5naW5lIENvbmZpZ3VyYXRpb248YnI+CiM8YnI+CiMgQ09ORklH
X0RSTV9BTURfREMgaXMgbm90IHNldDxicj4KPGJyPgojPGJyPgojIEFNRCBMaWJyYXJ5IHJvdXRp
bmVzPGJyPgojPGJyPgpDT05GSUdfQ0hBU0g9bTxicj4KQ09ORklHX0NIQVNIX1NUQVRTPXk8YnI+
CkNPTkZJR19DSEFTSF9TRUxGVEVTVD15PGJyPgpDT05GSUdfRFJNX05PVVZFQVU9bTxicj4KQ09O
RklHX05PVVZFQVVfREVCVUc9NTxicj4KQ09ORklHX05PVVZFQVVfREVCVUdfREVGQVVMVD0zPGJy
PgojIENPTkZJR19OT1VWRUFVX0RFQlVHX01NVSBpcyBub3Qgc2V0PGJyPgojIENPTkZJR19EUk1f
Tk9VVkVBVV9CQUNLTElHSFQgaXMgbm90IHNldDxicj4KQ09ORklHX0RSTV9JOTE1PW08YnI+CiMg
Q09ORklHX0RSTV9JOTE1X0FMUEhBX1NVUFBPUlQgaXMgbm90IHNldDxicj4KQ09ORklHX0RSTV9J
OTE1X0NBUFRVUkVfRVJST1I9eTxicj4KIyBDT05GSUdfRFJNX0k5MTVfQ09NUFJFU1NfRVJST1Ig
aXMgbm90IHNldDxicj4KQ09ORklHX0RSTV9JOTE1X1VTRVJQVFI9eTxicj4KQ09ORklHX0RSTV9J
OTE1X0dWVD15PGJyPgo8YnI+CiM8YnI+CiMgZHJtL2k5MTUgRGVidWdnaW5nPGJyPgojPGJyPgoj
IENPTkZJR19EUk1fSTkxNV9XRVJST1IgaXMgbm90IHNldDxicj4KIyBDT05GSUdfRFJNX0k5MTVf
REVCVUcgaXMgbm90IHNldDxicj4KQ09ORklHX0RSTV9JOTE1X1NXX0ZFTkNFX0RFQlVHX09CSkVD
VFM9eTxicj4KQ088L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============0360884482749400023==--

