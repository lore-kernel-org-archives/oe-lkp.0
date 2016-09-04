Content-Type: multipart/mixed; boundary="===============5056597553656587387=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [list] 8052ce2d97: WARNING: CPU: 0 PID: 1 at lib/list_debug.c:60 __list_del_entry+0x4d/0x71
Date: Sun, 04 Sep 2016 02:48:51 -0700
Message-ID: <20160904094851.GM3663@linux.vnet.ibm.com>
In-Reply-To: <57cb6c5c.ht1t4TgNR/5nHu0Z%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5056597553656587387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 04, 2016 at 08:35:40AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev=
.2016.08.19a
> commit 8052ce2d9771ab5a818307f3abbaf33bba82a631 ("list: Split list_add() =
debug checking into separate function")
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -m 360M
> =

> caused below changes:

Hello, Kees,

Looks like your change might have actually found a bug.  ;-)

How would you like to handle this?

							Thanx, Paul

> +------------------------------------------------------------+-----------=
-+------------+
> |                                                            | 0a33d912a3=
 | 8052ce2d97 |
> +------------------------------------------------------------+-----------=
-+------------+
> | boot_successes                                             | 0         =
 | 0          |
> | boot_failures                                              | 211       =
 | 18         |
> | WARNING:at_lib/list_debug.c:#__list_del_entry              | 211       =
 | 18         |
> | calltrace:init                                             | 209       =
 | 18         |
> | WARNING:at_lib/list_debug.c:#__list_add                    | 209       =
 |            |
> | calltrace:i8042_init                                       | 209       =
 | 17         |
> | calltrace:SyS_reboot                                       | 192       =
 | 4          |
> | EIP_is_at__mutex_unlock_slowpath                           | 29        =
 |            |
> | Kernel_panic-not_syncing:softlockup:hung_tasks             | 138       =
 |            |
> | BUG:workqueue_lockup-pool_cpus=3D#flags=3D#nice=3D#stuck_for#s   | 56  =
       |            |
> | EIP_is_at_lock_release                                     | 7         =
 |            |
> | EIP_is_at_lock_acquire                                     | 28        =
 |            |
> | EIP_is_at_raw_spin_unlock_irq                              | 30        =
 |            |
> | EIP_is_at_mutex_lock_nested                                | 21        =
 |            |
> | EIP_is_at_lock_is_held                                     | 10        =
 |            |
> | EIP_is_at_device_shutdown                                  | 3         =
 |            |
> | EIP_is_at___might_sleep                                    | 5         =
 |            |
> | EIP_is_at__list_del_entry                                  | 4         =
 | 1          |
> | EIP_is_at_get_device                                       | 1         =
 |            |
> | BUG:unable_to_handle_kernel                                | 7         =
 | 5          |
> | Oops                                                       | 7         =
 | 5          |
> | calltrace:SyS_ipc                                          | 4         =
 | 4          |
> | Kernel_panic-not_syncing:Fatal_exception                   | 7         =
 | 5          |
> | EIP_is_at_pm_runtime_barrier                               | 1         =
 |            |
> | EIP_is_at_lock_acquired                                    | 1         =
 |            |
> | EIP_is_at__might_sleep                                     | 1         =
 |            |
> | BUG:workqueue_lockup-pool_cpus=3D#-#flags=3D#nice=3D#stuck_for#s | 1   =
       |            |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page        | 26        =
 |            |
> | calltrace:mark_rodata_ro                                   | 26        =
 |            |
> | WARNING:at_lib/list_debug.c:#__list_add_valid              | 0         =
 | 17         |
> | calltrace:serio_handle_event                               | 0         =
 | 17         |
> | calltrace:userio_misc_init                                 | 0         =
 | 17         |
> | calltrace:mousedev_init                                    | 0         =
 | 17         |
> | calltrace:evdev_init                                       | 0         =
 | 17         |
> | calltrace:cmos_init                                        | 0         =
 | 17         |
> | calltrace:test_init                                        | 0         =
 | 17         |
> | calltrace:pca_isa_driver_init                              | 0         =
 | 17         |
> | calltrace:vim2m_init                                       | 0         =
 | 17         |
> | calltrace:fm_drv_init                                      | 0         =
 | 17         |
> | calltrace:test_power_init                                  | 0         =
 | 17         |
> | calltrace:raid#_init                                       | 0         =
 | 17         |
> | calltrace:dm_init                                          | 0         =
 | 17         |
> | calltrace:vhci_init                                        | 0         =
 | 17         |
> | calltrace:dcdrbu_init                                      | 0         =
 | 17         |
> | calltrace:dcdbas_init                                      | 0         =
 | 17         |
> | calltrace:uhid_init                                        | 0         =
 | 17         |
> | calltrace:vhost_net_init                                   | 0         =
 | 17         |
> | calltrace:dummy_stm_init                                   | 0         =
 | 17         |
> | calltrace:stm_heartbeat_init                               | 0         =
 | 17         |
> | calltrace:binder_init                                      | 0         =
 | 17         |
> | calltrace:teql_init                                        | 0         =
 | 17         |
> | calltrace:ipip_init                                        | 0         =
 | 17         |
> | calltrace:ipgre_init                                       | 0         =
 | 17         |
> | calltrace:sit_init                                         | 0         =
 | 17         |
> | calltrace:ip6_tunnel_init                                  | 0         =
 | 17         |
> | calltrace:ip6gre_init                                      | 0         =
 | 17         |
> | calltrace:irlan_init                                       | 0         =
 | 17         |
> | calltrace:pm_qos_power_init                                | 0         =
 | 17         |
> | calltrace:ubi_init                                         | 0         =
 | 17         |
> | calltrace:SyS_setsockopt                                   | 0         =
 | 2          |
> | calltrace:SyS_socketcall                                   | 0         =
 | 2          |
> | WARNING:at_include/linux/kref.h:#kobject_get               | 0         =
 | 4          |
> | WARNING:at_kernel/locking/lockdep.c:#__lock_acquire        | 0         =
 | 4          |
> | BUG:kernel_hang_in_test_stage                              | 0         =
 | 4          |
> | calltrace:fw_cfg_sysfs_init                                | 0         =
 | 7          |
> +------------------------------------------------------------+-----------=
-+------------+
> =

> =

> =

> [  152.680291] g_acm_ms usbip-vudc.0: failed to start g_acm_ms: -22
> [  152.689209] usbip-vudc: probe of usbip-vudc.0 failed with error -22
> [  152.698509] ------------[ cut here ]------------
> [  152.709786] WARNING: CPU: 0 PID: 1 at lib/list_debug.c:60 __list_del_e=
ntry+0x4d/0x71
> [  152.722785] list_del corruption. next->prev should be cc0230d4, but wa=
s 6b6b6b6b
> [  152.732828] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc1-00033-=
g8052ce2 #1
> [  152.742576] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [  152.754081]  00000000 00200246 c0033e78 c13c456b c0033ea4 c13e72ac c00=
33e90 c103fd02
> [  152.765720]  0000003c 6b6b6b6b cc0230d4 cc02300c c0033eac c103fd41 000=
00009 00000000
> [  152.776864]  c0033ea4 c1f7bc14 c0033ec0 c0033ecc c13e72ac c1f7bace 000=
0003c c1f7bc14
> [  152.788472] Call Trace:
> [  152.791964]  [<c13c456b>] dump_stack+0x75/0xa9
> [  152.797835]  [<c13e72ac>] ? __list_del_entry+0x4d/0x71
> [  152.804221]  [<c103fd02>] __warn+0xad/0xc4
> [  152.809694]  [<c103fd41>] warn_slowpath_fmt+0x28/0x2d
> [  152.816501]  [<c13e72ac>] __list_del_entry+0x4d/0x71
> [  152.822946]  [<c15027a8>] device_pm_remove+0x2b/0x5a
> [  152.829560]  [<c14f6317>] device_del+0x134/0x19a
> [  152.835558]  [<c14f5c38>] ? dev_set_name+0x14/0x16
> [  152.842135]  [<c14f9d7c>] platform_device_del+0x16/0x5d
> [  152.848909]  [<c2207515>] init+0xe5/0x112
> [  152.854149]  [<c2207430>] ? usbip_host_init+0xe5/0xe5
> [  152.860796]  [<c21cec35>] do_one_initcall+0x7e/0x101
> [  152.867316]  [<c10564b7>] ? parse_args+0x190/0x265
> [  152.873497]  [<c21ced88>] ? kernel_init_freeable+0xd0/0x174
> [  152.880923]  [<c21ceda4>] kernel_init_freeable+0xec/0x174
> [  152.887499]  [<c1be421b>] kernel_init+0x8/0xd0
> [  152.893658]  [<c1bec3ae>] ret_from_kernel_thread+0xe/0x30
> [  152.900759]  [<c1be4213>] ? rest_init+0x111/0x111
> [  152.907334] ---[ end trace 2003739b08d25430 ]---
> [  152.920040] ------------[ cut here ]------------
> =

> =

> =

> =

> =

> =

> Thanks,
> Kernel Test Robot

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 4.8.0-rc1 Kernel Configuration
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
> CONFIG_X86_32_SMP=3Dy
> CONFIG_X86_32_LAZY_GS=3Dy
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
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
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
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
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
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_TREE_RCU_TRACE=3Dy
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_NMI_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> CONFIG_BLK_CGROUP=3Dy
> # CONFIG_DEBUG_BLK_CGROUP is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_FREEZER=3Dy
> # CONFIG_CGROUP_HUGETLB is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> CONFIG_CGROUP_PERF=3Dy
> # CONFIG_CGROUP_DEBUG is not set
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
> CONFIG_SYSFS_SYSCALL=3Dy
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> # CONFIG_SHMEM is not set
> # CONFIG_AIO is not set
> CONFIG_ADVISE_SYSCALLS=3Dy
> # CONFIG_USERFAULTFD is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_MEMBARRIER is not set
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
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> CONFIG_PROFILING=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_OPROFILE=3Dy
> # CONFIG_OPROFILE_EVENT_MULTIPLEX is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
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
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # CONFIG_GCC_PLUGINS is not set
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D8
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> # CONFIG_HAVE_ARCH_HASH is not set
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> # CONFIG_MODULES is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> # CONFIG_LBDAF is not set
> # CONFIG_BLK_DEV_BSG is not set
> # CONFIG_BLK_DEV_BSGLIB is not set
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_THROTTLING=3Dy
> CONFIG_BLK_CMDLINE_PARSER=3Dy
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> # CONFIG_IOSCHED_CFQ is not set
> CONFIG_DEFAULT_DEADLINE=3Dy
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"deadline"
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
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
> # CONFIG_ZONE_DMA is not set
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_FAST_FEATURE_TESTS is not set
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_X86_BIGSMP is not set
> CONFIG_GOLDFISH=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_32_IRIS=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
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
> # CONFIG_MCRUSOE is not set
> # CONFIG_MEFFICEON is not set
> # CONFIG_MWINCHIPC6 is not set
> # CONFIG_MWINCHIP3D is not set
> CONFIG_MELAN=3Dy
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
> CONFIG_X86_ALIGNMENT_16=3Dy
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
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
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D8
> # CONFIG_SCHED_SMT is not set
> # CONFIG_SCHED_MC is not set
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
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
> CONFIG_NEED_NODE_MEMMAP_SIZE=3Dy
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_FLATMEM_MANUAL is not set
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_BALLOON_COMPACTION is not set
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> # CONFIG_BOUNCE is not set
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> # CONFIG_CLEANCACHE is not set
> CONFIG_FRONTSWAP=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZSWAP=3Dy
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_FRAME_VECTOR=3Dy
> # CONFIG_X86_PMEM_LEGACY is not set
> CONFIG_HIGHPTE=3Dy
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
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
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_SUSPEND_SKIP_SYNC=3Dy
> # CONFIG_HIBERNATION is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> CONFIG_PM_ADVANCED_DEBUG=3Dy
> # CONFIG_PM_TEST_SUSPEND is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> CONFIG_DPM_WATCHDOG=3Dy
> CONFIG_DPM_WATCHDOG_TIMEOUT=3D60
> # CONFIG_PM_TRACE_RTC is not set
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
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
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_DPTF_POWER is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_SFI=3Dy
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dy
> CONFIG_APM_IGNORE_USER_SUSPEND=3Dy
> CONFIG_APM_DO_ENABLE=3Dy
> # CONFIG_APM_CPU_IDLE is not set
> # CONFIG_APM_DISPLAY_BLANK is not set
> # CONFIG_APM_ALLOW_INTS is not set
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
> CONFIG_INTEL_IDLE=3Dy
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
> CONFIG_HT_IRQ=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI host controller drivers
> #
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> # CONFIG_EISA is not set
> # CONFIG_SCx200 is not set
> CONFIG_ALIX=3Dy
> CONFIG_NET5501=3Dy
> # CONFIG_GEOS is not set
> # CONFIG_TS5500 is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> # CONFIG_PCMCIA_LOAD_CIS is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_PD6729 is not set
> # CONFIG_I82092 is not set
> CONFIG_I82365=3Dy
> CONFIG_TCIC=3Dy
> CONFIG_PCMCIA_PROBE=3Dy
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
> CONFIG_HAVE_AOUT=3Dy
> # CONFIG_BINFMT_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> CONFIG_PMC_ATOM=3Dy
> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> # CONFIG_PACKET_DIAG is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dy
> CONFIG_XFRM_SUB_POLICY=3Dy
> CONFIG_XFRM_MIGRATE=3Dy
> # CONFIG_XFRM_STATISTICS is not set
> CONFIG_XFRM_IPCOMP=3Dy
> CONFIG_NET_KEY=3Dy
> # CONFIG_NET_KEY_MIGRATE is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> CONFIG_IP_PNP_BOOTP=3Dy
> CONFIG_IP_PNP_RARP=3Dy
> CONFIG_NET_IPIP=3Dy
> CONFIG_NET_IPGRE_DEMUX=3Dy
> CONFIG_NET_IP_TUNNEL=3Dy
> CONFIG_NET_IPGRE=3Dy
> # CONFIG_NET_IPGRE_BROADCAST is not set
> CONFIG_IP_MROUTE=3Dy
> CONFIG_IP_PIMSM_V1=3Dy
> CONFIG_IP_PIMSM_V2=3Dy
> # CONFIG_SYN_COOKIES is not set
> CONFIG_NET_UDP_TUNNEL=3Dy
> CONFIG_NET_FOU=3Dy
> CONFIG_NET_FOU_IP_TUNNELS=3Dy
> CONFIG_INET_AH=3Dy
> CONFIG_INET_ESP=3Dy
> CONFIG_INET_IPCOMP=3Dy
> CONFIG_INET_XFRM_TUNNEL=3Dy
> CONFIG_INET_TUNNEL=3Dy
> # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> # CONFIG_INET_XFRM_MODE_TUNNEL is not set
> # CONFIG_INET_XFRM_MODE_BEET is not set
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> # CONFIG_INET_UDP_DIAG is not set
> CONFIG_INET_DIAG_DESTROY=3Dy
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> CONFIG_TCP_MD5SIG=3Dy
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> CONFIG_IPV6_ROUTE_INFO=3Dy
> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> CONFIG_INET6_AH=3Dy
> CONFIG_INET6_ESP=3Dy
> # CONFIG_INET6_IPCOMP is not set
> CONFIG_IPV6_MIP6=3Dy
> # CONFIG_IPV6_ILA is not set
> # CONFIG_INET6_XFRM_TUNNEL is not set
> CONFIG_INET6_TUNNEL=3Dy
> # CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> # CONFIG_INET6_XFRM_MODE_BEET is not set
> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dy
> CONFIG_IPV6_GRE=3Dy
> CONFIG_IPV6_FOU=3Dy
> CONFIG_IPV6_FOU_TUNNEL=3Dy
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> CONFIG_IPV6_MROUTE=3Dy
> # CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
> CONFIG_IPV6_PIMSM_V2=3Dy
> # CONFIG_NETWORK_SECMARK is not set
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> CONFIG_NETFILTER=3Dy
> # CONFIG_NETFILTER_DEBUG is not set
> # CONFIG_NETFILTER_ADVANCED is not set
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dy
> CONFIG_NETFILTER_NETLINK_LOG=3Dy
> CONFIG_NF_CONNTRACK=3Dy
> CONFIG_NF_LOG_COMMON=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> CONFIG_NF_CONNTRACK_FTP=3Dy
> CONFIG_NF_CONNTRACK_IRC=3Dy
> # CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
> CONFIG_NF_CONNTRACK_SIP=3Dy
> CONFIG_NF_CT_NETLINK=3Dy
> # CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
> CONFIG_NF_NAT=3Dy
> CONFIG_NF_NAT_NEEDED=3Dy
> # CONFIG_NF_NAT_AMANDA is not set
> CONFIG_NF_NAT_FTP=3Dy
> CONFIG_NF_NAT_IRC=3Dy
> CONFIG_NF_NAT_SIP=3Dy
> # CONFIG_NF_NAT_TFTP is not set
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_TABLES=3Dy
> # CONFIG_NF_TABLES_INET is not set
> # CONFIG_NF_TABLES_NETDEV is not set
> CONFIG_NFT_EXTHDR=3Dy
> CONFIG_NFT_META=3Dy
> CONFIG_NFT_CT=3Dy
> CONFIG_NFT_RBTREE=3Dy
> CONFIG_NFT_HASH=3Dy
> CONFIG_NFT_COUNTER=3Dy
> CONFIG_NFT_LOG=3Dy
> CONFIG_NFT_LIMIT=3Dy
> # CONFIG_NFT_MASQ is not set
> CONFIG_NFT_REDIR=3Dy
> CONFIG_NFT_NAT=3Dy
> CONFIG_NFT_REJECT=3Dy
> CONFIG_NFT_COMPAT=3Dy
> CONFIG_NETFILTER_XTABLES=3Dy
> =

> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=3Dy
> =

> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_LOG=3Dy
> CONFIG_NETFILTER_XT_NAT=3Dy
> CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dy
> CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dy
> CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dy
> # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
> =

> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dy
> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dy
> # CONFIG_NETFILTER_XT_MATCH_POLICY is not set
> # CONFIG_NETFILTER_XT_MATCH_STATE is not set
> CONFIG_IP_SET=3Dy
> CONFIG_IP_SET_MAX=3D256
> CONFIG_IP_SET_BITMAP_IP=3Dy
> # CONFIG_IP_SET_BITMAP_IPMAC is not set
> CONFIG_IP_SET_BITMAP_PORT=3Dy
> CONFIG_IP_SET_HASH_IP=3Dy
> CONFIG_IP_SET_HASH_IPMARK=3Dy
> CONFIG_IP_SET_HASH_IPPORT=3Dy
> # CONFIG_IP_SET_HASH_IPPORTIP is not set
> CONFIG_IP_SET_HASH_IPPORTNET=3Dy
> CONFIG_IP_SET_HASH_MAC=3Dy
> CONFIG_IP_SET_HASH_NETPORTNET=3Dy
> CONFIG_IP_SET_HASH_NET=3Dy
> CONFIG_IP_SET_HASH_NETNET=3Dy
> CONFIG_IP_SET_HASH_NETPORT=3Dy
> # CONFIG_IP_SET_HASH_NETIFACE is not set
> CONFIG_IP_SET_LIST_SET=3Dy
> CONFIG_IP_VS=3Dy
> # CONFIG_IP_VS_IPV6 is not set
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=3D12
> =

> #
> # IPVS transport protocol load balancing support
> #
> # CONFIG_IP_VS_PROTO_TCP is not set
> # CONFIG_IP_VS_PROTO_UDP is not set
> CONFIG_IP_VS_PROTO_AH_ESP=3Dy
> # CONFIG_IP_VS_PROTO_ESP is not set
> CONFIG_IP_VS_PROTO_AH=3Dy
> CONFIG_IP_VS_PROTO_SCTP=3Dy
> =

> #
> # IPVS scheduler
> #
> # CONFIG_IP_VS_RR is not set
> CONFIG_IP_VS_WRR=3Dy
> CONFIG_IP_VS_LC=3Dy
> # CONFIG_IP_VS_WLC is not set
> CONFIG_IP_VS_FO=3Dy
> # CONFIG_IP_VS_OVF is not set
> CONFIG_IP_VS_LBLC=3Dy
> CONFIG_IP_VS_LBLCR=3Dy
> # CONFIG_IP_VS_DH is not set
> CONFIG_IP_VS_SH=3Dy
> CONFIG_IP_VS_SED=3Dy
> CONFIG_IP_VS_NQ=3Dy
> =

> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=3D8
> =

> #
> # IPVS application helper
> #
> CONFIG_IP_VS_NFCT=3Dy
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dy
> CONFIG_NF_CONNTRACK_IPV4=3Dy
> CONFIG_NF_CONNTRACK_PROC_COMPAT=3Dy
> CONFIG_NF_TABLES_IPV4=3Dy
> # CONFIG_NFT_CHAIN_ROUTE_IPV4 is not set
> CONFIG_NFT_REJECT_IPV4=3Dy
> CONFIG_NFT_DUP_IPV4=3Dy
> CONFIG_NF_TABLES_ARP=3Dy
> CONFIG_NF_DUP_IPV4=3Dy
> # CONFIG_NF_LOG_ARP is not set
> CONFIG_NF_LOG_IPV4=3Dy
> CONFIG_NF_REJECT_IPV4=3Dy
> CONFIG_NF_NAT_IPV4=3Dy
> CONFIG_NFT_CHAIN_NAT_IPV4=3Dy
> # CONFIG_NF_NAT_MASQUERADE_IPV4 is not set
> CONFIG_NFT_REDIR_IPV4=3Dy
> # CONFIG_NF_NAT_PPTP is not set
> # CONFIG_NF_NAT_H323 is not set
> # CONFIG_IP_NF_IPTABLES is not set
> =

> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV6=3Dy
> CONFIG_NF_CONNTRACK_IPV6=3Dy
> CONFIG_NF_TABLES_IPV6=3Dy
> CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dy
> CONFIG_NFT_REJECT_IPV6=3Dy
> # CONFIG_NFT_DUP_IPV6 is not set
> # CONFIG_NF_DUP_IPV6 is not set
> CONFIG_NF_REJECT_IPV6=3Dy
> CONFIG_NF_LOG_IPV6=3Dy
> CONFIG_IP6_NF_IPTABLES=3Dy
> # CONFIG_IP6_NF_MATCH_IPV6HEADER is not set
> CONFIG_IP6_NF_FILTER=3Dy
> CONFIG_IP6_NF_TARGET_REJECT=3Dy
> # CONFIG_IP6_NF_MANGLE is not set
> # CONFIG_IP6_NF_RAW is not set
> CONFIG_IP_DCCP=3Dy
> CONFIG_INET_DCCP_DIAG=3Dy
> =

> #
> # DCCP CCIDs Configuration
> #
> CONFIG_IP_DCCP_CCID2_DEBUG=3Dy
> # CONFIG_IP_DCCP_CCID3 is not set
> =

> #
> # DCCP Kernel Hacking
> #
> CONFIG_IP_DCCP_DEBUG=3Dy
> CONFIG_IP_SCTP=3Dy
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dy
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dy
> # CONFIG_TIPC_MEDIA_UDP is not set
> CONFIG_ATM=3Dy
> CONFIG_ATM_CLIP=3Dy
> CONFIG_ATM_CLIP_NO_ICMP=3Dy
> # CONFIG_ATM_LANE is not set
> CONFIG_ATM_BR2684=3Dy
> # CONFIG_ATM_BR2684_IPFILTER is not set
> # CONFIG_L2TP is not set
> CONFIG_STP=3Dy
> CONFIG_GARP=3Dy
> # CONFIG_BRIDGE is not set
> CONFIG_VLAN_8021Q=3Dy
> CONFIG_VLAN_8021Q_GVRP=3Dy
> # CONFIG_VLAN_8021Q_MVRP is not set
> CONFIG_DECNET=3Dy
> CONFIG_DECNET_ROUTER=3Dy
> CONFIG_LLC=3Dy
> # CONFIG_LLC2 is not set
> CONFIG_IPX=3Dy
> CONFIG_IPX_INTERN=3Dy
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> CONFIG_PHONET=3Dy
> CONFIG_6LOWPAN=3Dy
> CONFIG_6LOWPAN_DEBUGFS=3Dy
> # CONFIG_6LOWPAN_NHC is not set
> CONFIG_IEEE802154=3Dy
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> # CONFIG_IEEE802154_SOCKET is not set
> # CONFIG_IEEE802154_6LOWPAN is not set
> # CONFIG_MAC802154 is not set
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dy
> CONFIG_NET_SCH_HTB=3Dy
> CONFIG_NET_SCH_HFSC=3Dy
> # CONFIG_NET_SCH_ATM is not set
> CONFIG_NET_SCH_PRIO=3Dy
> CONFIG_NET_SCH_MULTIQ=3Dy
> # CONFIG_NET_SCH_RED is not set
> CONFIG_NET_SCH_SFB=3Dy
> CONFIG_NET_SCH_SFQ=3Dy
> CONFIG_NET_SCH_TEQL=3Dy
> # CONFIG_NET_SCH_TBF is not set
> # CONFIG_NET_SCH_GRED is not set
> # CONFIG_NET_SCH_DSMARK is not set
> CONFIG_NET_SCH_NETEM=3Dy
> CONFIG_NET_SCH_DRR=3Dy
> # CONFIG_NET_SCH_MQPRIO is not set
> CONFIG_NET_SCH_CHOKE=3Dy
> CONFIG_NET_SCH_QFQ=3Dy
> # CONFIG_NET_SCH_CODEL is not set
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> CONFIG_NET_SCH_FQ=3Dy
> CONFIG_NET_SCH_HHF=3Dy
> CONFIG_NET_SCH_PIE=3Dy
> CONFIG_NET_SCH_INGRESS=3Dy
> # CONFIG_NET_SCH_PLUG is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dy
> CONFIG_NET_CLS_TCINDEX=3Dy
> # CONFIG_NET_CLS_ROUTE4 is not set
> CONFIG_NET_CLS_FW=3Dy
> CONFIG_NET_CLS_U32=3Dy
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dy
> # CONFIG_NET_CLS_RSVP6 is not set
> # CONFIG_NET_CLS_FLOW is not set
> CONFIG_NET_CLS_CGROUP=3Dy
> CONFIG_NET_CLS_BPF=3Dy
> # CONFIG_NET_CLS_FLOWER is not set
> CONFIG_NET_CLS_MATCHALL=3Dy
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dy
> CONFIG_NET_EMATCH_NBYTE=3Dy
> # CONFIG_NET_EMATCH_U32 is not set
> CONFIG_NET_EMATCH_META=3Dy
> # CONFIG_NET_EMATCH_TEXT is not set
> CONFIG_NET_EMATCH_IPSET=3Dy
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dy
> CONFIG_NET_ACT_GACT=3Dy
> CONFIG_GACT_PROB=3Dy
> # CONFIG_NET_ACT_MIRRED is not set
> # CONFIG_NET_ACT_NAT is not set
> # CONFIG_NET_ACT_PEDIT is not set
> CONFIG_NET_ACT_SIMP=3Dy
> # CONFIG_NET_ACT_SKBEDIT is not set
> CONFIG_NET_ACT_CSUM=3Dy
> # CONFIG_NET_ACT_VLAN is not set
> CONFIG_NET_ACT_BPF=3Dy
> CONFIG_NET_ACT_IFE=3Dy
> # CONFIG_NET_IFE_SKBMARK is not set
> CONFIG_NET_IFE_SKBPRIO=3Dy
> # CONFIG_NET_CLS_IND is not set
> CONFIG_NET_SCH_FIFO=3Dy
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=3Dy
> CONFIG_BATMAN_ADV=3Dy
> # CONFIG_BATMAN_ADV_BATMAN_V is not set
> # CONFIG_BATMAN_ADV_BLA is not set
> CONFIG_BATMAN_ADV_DAT=3Dy
> # CONFIG_BATMAN_ADV_NC is not set
> # CONFIG_BATMAN_ADV_MCAST is not set
> CONFIG_BATMAN_ADV_DEBUG=3Dy
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> CONFIG_NETLINK_DIAG=3Dy
> # CONFIG_MPLS is not set
> CONFIG_HSR=3Dy
> # CONFIG_NET_SWITCHDEV is not set
> CONFIG_NET_L3_MASTER_DEV=3Dy
> CONFIG_NET_NCSI=3Dy
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
> # CONFIG_NET_PKTGEN is not set
> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> # CONFIG_AX25 is not set
> # CONFIG_CAN is not set
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
> CONFIG_IRTTY_SIR=3Dy
> =

> #
> # Dongle support
> #
> # CONFIG_DONGLE is not set
> CONFIG_KINGSUN_DONGLE=3Dy
> CONFIG_KSDAZZLE_DONGLE=3Dy
> # CONFIG_KS959_DONGLE is not set
> =

> #
> # FIR device drivers
> #
> CONFIG_USB_IRDA=3Dy
> CONFIG_SIGMATEL_FIR=3Dy
> CONFIG_NSC_FIR=3Dy
> CONFIG_WINBOND_FIR=3Dy
> # CONFIG_TOSHIBA_FIR is not set
> # CONFIG_SMC_IRCC_FIR is not set
> # CONFIG_ALI_FIR is not set
> # CONFIG_VLSI_FIR is not set
> CONFIG_VIA_FIR=3Dy
> CONFIG_MCS_FIR=3Dy
> CONFIG_BT=3Dy
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dy
> CONFIG_BT_RFCOMM_TTY=3Dy
> CONFIG_BT_BNEP=3Dy
> # CONFIG_BT_BNEP_MC_FILTER is not set
> # CONFIG_BT_BNEP_PROTO_FILTER is not set
> CONFIG_BT_HIDP=3Dy
> # CONFIG_BT_HS is not set
> CONFIG_BT_LE=3Dy
> CONFIG_BT_6LOWPAN=3Dy
> CONFIG_BT_LEDS=3Dy
> CONFIG_BT_SELFTEST=3Dy
> # CONFIG_BT_SELFTEST_ECDH is not set
> CONFIG_BT_SELFTEST_SMP=3Dy
> CONFIG_BT_DEBUGFS=3Dy
> =

> #
> # Bluetooth device drivers
> #
> CONFIG_BT_INTEL=3Dy
> CONFIG_BT_HCIBTUSB=3Dy
> # CONFIG_BT_HCIBTUSB_BCM is not set
> # CONFIG_BT_HCIBTUSB_RTL is not set
> # CONFIG_BT_HCIBTSDIO is not set
> # CONFIG_BT_HCIUART is not set
> # CONFIG_BT_HCIBCM203X is not set
> # CONFIG_BT_HCIBFUSB is not set
> CONFIG_BT_HCIDTL1=3Dy
> # CONFIG_BT_HCIBT3C is not set
> CONFIG_BT_HCIBLUECARD=3Dy
> # CONFIG_BT_HCIBTUART is not set
> CONFIG_BT_HCIVHCI=3Dy
> # CONFIG_BT_MRVL is not set
> CONFIG_BT_ATH3K=3Dy
> CONFIG_BT_WILINK=3Dy
> CONFIG_AF_RXRPC=3Dy
> CONFIG_AF_RXRPC_DEBUG=3Dy
> # CONFIG_RXKAD is not set
> CONFIG_AF_KCM=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> CONFIG_WIRELESS_EXT=3Dy
> CONFIG_WEXT_CORE=3Dy
> CONFIG_WEXT_PROC=3Dy
> CONFIG_WEXT_PRIV=3Dy
> CONFIG_CFG80211=3Dy
> CONFIG_NL80211_TESTMODE=3Dy
> CONFIG_CFG80211_DEVELOPER_WARNINGS=3Dy
> CONFIG_CFG80211_CERTIFICATION_ONUS=3Dy
> # CONFIG_CFG80211_REG_CELLULAR_HINTS is not set
> CONFIG_CFG80211_REG_RELAX_NO_IR=3Dy
> # CONFIG_CFG80211_DEFAULT_PS is not set
> CONFIG_CFG80211_DEBUGFS=3Dy
> # CONFIG_CFG80211_INTERNAL_REGDB is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> # CONFIG_CFG80211_WEXT is not set
> # CONFIG_LIB80211 is not set
> CONFIG_MAC80211=3Dy
> # CONFIG_MAC80211_RC_MINSTREL is not set
> CONFIG_MAC80211_RC_DEFAULT=3D""
> =

> #
> # Some wireless drivers require a rate control algorithm
> #
> CONFIG_MAC80211_MESH=3Dy
> # CONFIG_MAC80211_LEDS is not set
> # CONFIG_MAC80211_DEBUGFS is not set
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> CONFIG_MAC80211_DEBUG_MENU=3Dy
> CONFIG_MAC80211_NOINLINE=3Dy
> # CONFIG_MAC80211_VERBOSE_DEBUG is not set
> # CONFIG_MAC80211_MLME_DEBUG is not set
> # CONFIG_MAC80211_STA_DEBUG is not set
> CONFIG_MAC80211_HT_DEBUG=3Dy
> # CONFIG_MAC80211_OCB_DEBUG is not set
> CONFIG_MAC80211_IBSS_DEBUG=3Dy
> CONFIG_MAC80211_PS_DEBUG=3Dy
> CONFIG_MAC80211_MPL_DEBUG=3Dy
> CONFIG_MAC80211_MPATH_DEBUG=3Dy
> # CONFIG_MAC80211_MHWMP_DEBUG is not set
> CONFIG_MAC80211_MESH_SYNC_DEBUG=3Dy
> # CONFIG_MAC80211_MESH_CSA_DEBUG is not set
> CONFIG_MAC80211_MESH_PS_DEBUG=3Dy
> CONFIG_MAC80211_TDLS_DEBUG=3Dy
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> # CONFIG_RFKILL_INPUT is not set
> CONFIG_RFKILL_REGULATOR=3Dy
> CONFIG_RFKILL_GPIO=3Dy
> # CONFIG_NET_9P is not set
> CONFIG_CAIF=3Dy
> CONFIG_CAIF_DEBUG=3Dy
> # CONFIG_CAIF_NETDEV is not set
> CONFIG_CAIF_USB=3Dy
> CONFIG_CEPH_LIB=3Dy
> CONFIG_CEPH_LIB_PRETTYDEBUG=3Dy
> CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> CONFIG_NFC=3Dy
> CONFIG_NFC_DIGITAL=3Dy
> CONFIG_NFC_NCI=3Dy
> CONFIG_NFC_NCI_UART=3Dy
> # CONFIG_NFC_HCI is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_WILINK=3Dy
> CONFIG_NFC_SIM=3Dy
> CONFIG_NFC_PORT100=3Dy
> CONFIG_NFC_FDP=3Dy
> # CONFIG_NFC_FDP_I2C is not set
> CONFIG_NFC_PN533=3Dy
> # CONFIG_NFC_PN533_USB is not set
> CONFIG_NFC_PN533_I2C=3Dy
> CONFIG_NFC_MRVL=3Dy
> CONFIG_NFC_MRVL_USB=3Dy
> CONFIG_NFC_MRVL_UART=3Dy
> CONFIG_NFC_MRVL_I2C=3Dy
> # CONFIG_NFC_ST_NCI_I2C is not set
> CONFIG_NFC_NXP_NCI=3Dy
> # CONFIG_NFC_NXP_NCI_I2C is not set
> # CONFIG_NFC_S3FWRN5_I2C is not set
> CONFIG_LWTUNNEL=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_NET_DEVLINK=3Dy
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
> CONFIG_FENCE_TRACE=3Dy
> =

> #
> # Bus devices
> #
> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> CONFIG_MTD=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> # CONFIG_FTL is not set
> CONFIG_NFTL=3Dy
> CONFIG_NFTL_RW=3Dy
> # CONFIG_INFTL is not set
> CONFIG_RFD_FTL=3Dy
> # CONFIG_SSFDC is not set
> CONFIG_SM_FTL=3Dy
> # CONFIG_MTD_OOPS is not set
> CONFIG_MTD_SWAP=3Dy
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_GEN_PROBE=3Dy
> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> # CONFIG_MTD_CFI_NOSWAP is not set
> CONFIG_MTD_CFI_BE_BYTE_SWAP=3Dy
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_GEOMETRY=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_8=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> # CONFIG_MTD_CFI_I2 is not set
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> CONFIG_MTD_OTP=3Dy
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> # CONFIG_MTD_RAM is not set
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dy
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dy
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> # CONFIG_MTD_SC520CDP is not set
> # CONFIG_MTD_NETSC520 is not set
> # CONFIG_MTD_INTEL_VR_NOR is not set
> # CONFIG_MTD_PLATRAM is not set
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> CONFIG_MTD_SLRAM=3Dy
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> # CONFIG_MTD_BLOCK2MTD is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SMC=3Dy
> CONFIG_MTD_NAND=3Dy
> # CONFIG_MTD_NAND_ECC_BCH is not set
> # CONFIG_MTD_SM_COMMON is not set
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> CONFIG_MTD_NAND_GPIO=3Dy
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_IDS=3Dy
> # CONFIG_MTD_NAND_RICOH is not set
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> CONFIG_MTD_NAND_DOCG4=3Dy
> # CONFIG_MTD_NAND_CAFE is not set
> # CONFIG_MTD_NAND_CS553X is not set
> CONFIG_MTD_NAND_NANDSIM=3Dy
> # CONFIG_MTD_NAND_PLATFORM is not set
> # CONFIG_MTD_NAND_HISI504 is not set
> CONFIG_MTD_NAND_MTK=3Dy
> CONFIG_MTD_ONENAND=3Dy
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> CONFIG_MTD_ONENAND_OTP=3Dy
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> # CONFIG_MTD_SPI_NOR is not set
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> CONFIG_MTD_UBI_BLOCK=3Dy
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=3Dy
> CONFIG_PARPORT_PC_SUPERIO=3Dy
> CONFIG_PARPORT_PC_PCMCIA=3Dy
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
> # CONFIG_ISAPNP is not set
> # CONFIG_PNPBIOS is not set
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_BLK_DEV_FD is not set
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> # CONFIG_BLK_DEV_LOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_HD is not set
> # CONFIG_BLK_DEV_RBD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_NVME_TARGET is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> CONFIG_AD525X_DPOT=3Dy
> # CONFIG_AD525X_DPOT_I2C is not set
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dy
> CONFIG_ENCLOSURE_SERVICES=3Dy
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> # CONFIG_ISL29003 is not set
> # CONFIG_ISL29020 is not set
> # CONFIG_SENSORS_TSL2550 is not set
> # CONFIG_SENSORS_BH1780 is not set
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> # CONFIG_DS1682 is not set
> CONFIG_BMP085=3Dy
> CONFIG_BMP085_I2C=3Dy
> # CONFIG_PCH_PHUB is not set
> CONFIG_USB_SWITCH_FSA9480=3Dy
> # CONFIG_SRAM is not set
> # CONFIG_PANEL is not set
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_LEGACY=3Dy
> # CONFIG_EEPROM_MAX6875 is not set
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> CONFIG_TI_ST=3Dy
> CONFIG_SENSORS_LIS3_I2C=3Dy
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
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
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
> # CONFIG_MD_LINEAR is not set
> # CONFIG_MD_RAID0 is not set
> CONFIG_MD_RAID1=3Dy
> # CONFIG_MD_RAID10 is not set
> CONFIG_MD_RAID456=3Dy
> CONFIG_MD_MULTIPATH=3Dy
> CONFIG_MD_FAULTY=3Dy
> CONFIG_MD_CLUSTER=3Dy
> CONFIG_BCACHE=3Dy
> CONFIG_BCACHE_DEBUG=3Dy
> CONFIG_BCACHE_CLOSURES_DEBUG=3Dy
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dy
> CONFIG_DM_MQ_DEFAULT=3Dy
> CONFIG_DM_DEBUG=3Dy
> CONFIG_DM_BUFIO=3Dy
> # CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
> # CONFIG_DM_CRYPT is not set
> CONFIG_DM_SNAPSHOT=3Dy
> # CONFIG_DM_THIN_PROVISIONING is not set
> # CONFIG_DM_CACHE is not set
> # CONFIG_DM_ERA is not set
> # CONFIG_DM_MIRROR is not set
> # CONFIG_DM_RAID is not set
> CONFIG_DM_ZERO=3Dy
> # CONFIG_DM_MULTIPATH is not set
> CONFIG_DM_DELAY=3Dy
> # CONFIG_DM_UEVENT is not set
> # CONFIG_DM_FLAKEY is not set
> CONFIG_DM_VERITY=3Dy
> CONFIG_DM_VERITY_FEC=3Dy
> # CONFIG_DM_SWITCH is not set
> # CONFIG_DM_LOG_WRITES is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> # CONFIG_FIREWIRE_OHCI is not set
> CONFIG_FIREWIRE_NET=3Dy
> # CONFIG_FIREWIRE_NOSY is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> # CONFIG_NVM is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> # CONFIG_INPUT_LEDS is not set
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> # CONFIG_INPUT_SPARSEKMAP is not set
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
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
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> # CONFIG_MOUSE_PS2_CYPRESS is not set
> # CONFIG_MOUSE_PS2_LIFEBOOK is not set
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
> # CONFIG_MOUSE_PS2_FOCALTECH is not set
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> # CONFIG_MOUSE_SERIAL is not set
> CONFIG_MOUSE_APPLETOUCH=3Dy
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> CONFIG_MOUSE_ELAN_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> CONFIG_MOUSE_INPORT=3Dy
> # CONFIG_MOUSE_ATIXL is not set
> # CONFIG_MOUSE_LOGIBM is not set
> # CONFIG_MOUSE_PC110PAD is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> CONFIG_MOUSE_GPIO=3Dy
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> CONFIG_MOUSE_SYNAPTICS_USB=3Dy
> CONFIG_INPUT_JOYSTICK=3Dy
> CONFIG_JOYSTICK_ANALOG=3Dy
> # CONFIG_JOYSTICK_A3D is not set
> CONFIG_JOYSTICK_ADI=3Dy
> # CONFIG_JOYSTICK_COBRA is not set
> CONFIG_JOYSTICK_GF2K=3Dy
> # CONFIG_JOYSTICK_GRIP is not set
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> # CONFIG_JOYSTICK_TMDC is not set
> CONFIG_JOYSTICK_IFORCE=3Dy
> CONFIG_JOYSTICK_IFORCE_USB=3Dy
> # CONFIG_JOYSTICK_IFORCE_232 is not set
> CONFIG_JOYSTICK_WARRIOR=3Dy
> CONFIG_JOYSTICK_MAGELLAN=3Dy
> CONFIG_JOYSTICK_SPACEORB=3Dy
> # CONFIG_JOYSTICK_SPACEBALL is not set
> CONFIG_JOYSTICK_STINGER=3Dy
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> # CONFIG_JOYSTICK_DB9 is not set
> CONFIG_JOYSTICK_GAMECON=3Dy
> CONFIG_JOYSTICK_TURBOGRAFX=3Dy
> # CONFIG_JOYSTICK_AS5011 is not set
> # CONFIG_JOYSTICK_JOYDUMP is not set
> CONFIG_JOYSTICK_XPAD=3Dy
> CONFIG_JOYSTICK_XPAD_FF=3Dy
> # CONFIG_JOYSTICK_XPAD_LEDS is not set
> # CONFIG_INPUT_TABLET is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> # CONFIG_TOUCHSCREEN_88PM860X is not set
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> # CONFIG_TOUCHSCREEN_AD7879_I2C is not set
> # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> # CONFIG_TOUCHSCREEN_EETI is not set
> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> CONFIG_TOUCHSCREEN_FT6236=3Dy
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> # CONFIG_TOUCHSCREEN_GOODIX is not set
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_ELAN=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dy
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> # CONFIG_TOUCHSCREEN_WACOM_I2C is not set
> # CONFIG_TOUCHSCREEN_MAX11801 is not set
> # CONFIG_TOUCHSCREEN_MCS5000 is not set
> CONFIG_TOUCHSCREEN_MMS114=3Dy
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> CONFIG_TOUCHSCREEN_MK712=3Dy
> CONFIG_TOUCHSCREEN_HTCPEN=3Dy
> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
> CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dy
> CONFIG_TOUCHSCREEN_MC13783=3Dy
> # CONFIG_TOUCHSCREEN_USB_EGALAX is not set
> CONFIG_TOUCHSCREEN_USB_PANJIT=3Dy
> # CONFIG_TOUCHSCREEN_USB_3M is not set
> # CONFIG_TOUCHSCREEN_USB_ITM is not set
> CONFIG_TOUCHSCREEN_USB_ETURBO=3Dy
> # CONFIG_TOUCHSCREEN_USB_GUNZE is not set
> CONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy
> # CONFIG_TOUCHSCREEN_USB_IRTOUCH is not set
> # CONFIG_TOUCHSCREEN_USB_IDEALTEK is not set
> # CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH is not set
> # CONFIG_TOUCHSCREEN_USB_GOTOP is not set
> # CONFIG_TOUCHSCREEN_USB_JASTEC is not set
> CONFIG_TOUCHSCREEN_USB_ELO=3Dy
> # CONFIG_TOUCHSCREEN_USB_E2I is not set
> # CONFIG_TOUCHSCREEN_USB_ZYTRONIC is not set
> CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=3Dy
> # CONFIG_TOUCHSCREEN_USB_NEXIO is not set
> # CONFIG_TOUCHSCREEN_USB_EASYTOUCH is not set
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> CONFIG_TOUCHSCREEN_TSC2004=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> # CONFIG_TOUCHSCREEN_RM_TS is not set
> # CONFIG_TOUCHSCREEN_SILEAD is not set
> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
> # CONFIG_TOUCHSCREEN_ST1232 is not set
> CONFIG_TOUCHSCREEN_SUR40=3Dy
> # CONFIG_TOUCHSCREEN_SX8654 is not set
> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
> # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=3Dy
> # CONFIG_RMI4_I2C is not set
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
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
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
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
> CONFIG_SERIAL_NONSTANDARD=3Dy
> CONFIG_ROCKETPORT=3Dy
> CONFIG_CYCLADES=3Dy
> # CONFIG_CYZ_INTR is not set
> CONFIG_MOXA_INTELLIO=3Dy
> CONFIG_MOXA_SMARTIO=3Dy
> # CONFIG_SYNCLINK is not set
> # CONFIG_SYNCLINKMP is not set
> # CONFIG_SYNCLINK_GT is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_ISI is not set
> CONFIG_N_HDLC=3Dy
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> CONFIG_GOLDFISH_TTY=3Dy
> CONFIG_DEVMEM=3Dy
> CONFIG_DEVKMEM=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> CONFIG_SERIAL_8250_FINTEK=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_CS=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_FSL is not set
> # CONFIG_SERIAL_8250_DW is not set
> CONFIG_SERIAL_8250_RT288X=3Dy
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
> CONFIG_SERIAL_SC16IS7XX=3Dy
> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> CONFIG_SERIAL_TIMBERDALE=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_PCH_UART is not set
> CONFIG_SERIAL_ARC=3Dy
> # CONFIG_SERIAL_ARC_CONSOLE is not set
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dy
> CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_TTY_PRINTK=3Dy
> CONFIG_PRINTER=3Dy
> # CONFIG_LP_CONSOLE is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_WATCHDOG=3Dy
> CONFIG_IPMI_POWEROFF=3Dy
> # CONFIG_HW_RANDOM is not set
> CONFIG_NVRAM=3Dy
> CONFIG_DTLK=3Dy
> CONFIG_R3964=3Dy
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dy
> CONFIG_CARDMAN_4000=3Dy
> # CONFIG_CARDMAN_4040 is not set
> CONFIG_MWAVE=3Dy
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> # CONFIG_TCG_TPM is not set
> # CONFIG_TELCLOCK is not set
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
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=3Dy
> # CONFIG_I2C_MUX_REG is not set
> # CONFIG_I2C_HELPER_AUTO is not set
> # CONFIG_I2C_SMBUS is not set
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
> CONFIG_I2C_CBUS_GPIO=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EG20T is not set
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_KEMPLD is not set
> CONFIG_I2C_OCORES=3Dy
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> # CONFIG_I2C_PARPORT is not set
> # CONFIG_I2C_PARPORT_LIGHT is not set
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> # CONFIG_I2C_TAOS_EVM is not set
> CONFIG_I2C_TINY_USB=3Dy
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_PCA_ISA=3Dy
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> # CONFIG_SCx200_ACB is not set
> # CONFIG_I2C_SLAVE is not set
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
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> # CONFIG_NTP_PPS is not set
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_LDISC=3Dy
> CONFIG_PPS_CLIENT_PARPORT=3Dy
> # CONFIG_PPS_CLIENT_GPIO is not set
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
> # CONFIG_PTP_1588_CLOCK_PCH is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
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
> CONFIG_GPIO_104_IDI_48=3Dy
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_IT87=3Dy
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> # CONFIG_GPIO_WS16C48 is not set
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> CONFIG_GPIO_ADP5588_IRQ=3Dy
> CONFIG_GPIO_MAX7300=3Dy
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> CONFIG_GPIO_PCF857X=3Dy
> CONFIG_GPIO_SX150X=3Dy
> CONFIG_GPIO_TPIC2810=3Dy
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_CRYSTAL_COVE=3Dy
> CONFIG_GPIO_KEMPLD=3Dy
> CONFIG_GPIO_LP3943=3Dy
> CONFIG_GPIO_PALMAS=3Dy
> # CONFIG_GPIO_RC5T583 is not set
> CONFIG_GPIO_TPS65086=3Dy
> CONFIG_GPIO_TPS65218=3Dy
> CONFIG_GPIO_TPS6586X=3Dy
> # CONFIG_GPIO_TPS65912 is not set
> CONFIG_GPIO_WM8994=3Dy
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCH is not set
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
> CONFIG_W1=3Dy
> CONFIG_W1_CON=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=3Dy
> # CONFIG_W1_MASTER_DS2482 is not set
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> # CONFIG_W1_SLAVE_BQ27000 is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> CONFIG_PDA_POWER=3Dy
> CONFIG_MAX8925_POWER=3Dy
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_88PM860X=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_BATTERY_BQ27XXX=3Dy
> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
> CONFIG_BATTERY_DA9150=3Dy
> CONFIG_BATTERY_MAX17040=3Dy
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_CHARGER_88PM860X=3Dy
> CONFIG_CHARGER_PCF50633=3Dy
> CONFIG_CHARGER_ISP1704=3Dy
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_MAX77693 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> CONFIG_CHARGER_BQ24257=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> # CONFIG_CHARGER_TPS65090 is not set
> CONFIG_CHARGER_TPS65217=3Dy
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> CONFIG_BATTERY_GOLDFISH=3Dy
> # CONFIG_BATTERY_RT5033 is not set
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_AXP20X_POWER=3Dy
> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_RESTART=3Dy
> # CONFIG_POWER_AVS is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> # CONFIG_SENSORS_ABITUGURU3 is not set
> CONFIG_SENSORS_AD7414=3Dy
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dy
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> # CONFIG_SENSORS_ADT7470 is not set
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> # CONFIG_SENSORS_ASB100 is not set
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DELL_SMM=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> # CONFIG_SENSORS_MC13783_ADC is not set
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> # CONFIG_SENSORS_GPIO_FAN is not set
> CONFIG_SENSORS_HIH6130=3Dy
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> CONFIG_SENSORS_LINEAGE=3Dy
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> # CONFIG_SENSORS_LTC4215 is not set
> CONFIG_SENSORS_LTC4222=3Dy
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> # CONFIG_SENSORS_MAX6650 is not set
> # CONFIG_SENSORS_MAX6697 is not set
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dy
> # CONFIG_SENSORS_LM77 is not set
> CONFIG_SENSORS_LM78=3Dy
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NCT7904=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> # CONFIG_PMBUS is not set
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHT3x=3Dy
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> # CONFIG_SENSORS_SMSC47B397 is not set
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS1015 is not set
> CONFIG_SENSORS_ADS7828=3Dy
> CONFIG_SENSORS_AMC6821=3Dy
> # CONFIG_SENSORS_INA209 is not set
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_INA3221=3Dy
> # CONFIG_SENSORS_TC74 is not set
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> CONFIG_SENSORS_TMP103=3Dy
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dy
> # CONFIG_SENSORS_W83795 is not set
> # CONFIG_SENSORS_W83L785TS is not set
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
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
> CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_INTEL_POWERCLAMP=3Dy
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
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
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCMCIAHOST is not set
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> CONFIG_SSB_SDIOHOST=3Dy
> # CONFIG_SSB_SILENT is not set
> CONFIG_SSB_DEBUG=3Dy
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
> CONFIG_BCMA_SFLASH=3Dy
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_CS5535 is not set
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dy
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9062=3Dy
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dy
> # CONFIG_MFD_DLN2 is not set
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> CONFIG_INTEL_SOC_PMIC=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> # CONFIG_MFD_MAX14577 is not set
> CONFIG_MFD_MAX77693=3Dy
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6397=3Dy
> # CONFIG_MFD_MENF21BMC is not set
> # CONFIG_MFD_VIPERBOARD is not set
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> CONFIG_PCF50633_GPIO=3Dy
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RTSX_USB=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> CONFIG_MFD_SI476X_CORE=3Dy
> CONFIG_MFD_SM501=3Dy
> # CONFIG_MFD_SM501_GPIO is not set
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_MFD_TPS65218=3Dy
> CONFIG_MFD_TPS6586X=3Dy
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TIMBERDALE is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_CS47L24=3Dy
> # CONFIG_MFD_WM5102 is not set
> CONFIG_MFD_WM5110=3Dy
> # CONFIG_MFD_WM8997 is not set
> # CONFIG_MFD_WM8998 is not set
> CONFIG_MFD_WM8400=3Dy
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> # CONFIG_REGULATOR_88PM800 is not set
> CONFIG_REGULATOR_88PM8607=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_ANATOP=3Dy
> # CONFIG_REGULATOR_AXP20X is not set
> CONFIG_REGULATOR_BCM590XX=3Dy
> CONFIG_REGULATOR_DA9062=3Dy
> CONFIG_REGULATOR_DA9210=3Dy
> # CONFIG_REGULATOR_DA9211 is not set
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dy
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP8788=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> CONFIG_REGULATOR_MAX8660=3Dy
> CONFIG_REGULATOR_MAX8907=3Dy
> # CONFIG_REGULATOR_MAX8925 is not set
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> # CONFIG_REGULATOR_MC13892 is not set
> CONFIG_REGULATOR_MT6311=3Dy
> CONFIG_REGULATOR_MT6323=3Dy
> CONFIG_REGULATOR_MT6397=3Dy
> # CONFIG_REGULATOR_PALMAS is not set
> CONFIG_REGULATOR_PCF50633=3Dy
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> CONFIG_REGULATOR_PV88090=3Dy
> CONFIG_REGULATOR_PWM=3Dy
> # CONFIG_REGULATOR_RC5T583 is not set
> CONFIG_REGULATOR_RT5033=3Dy
> # CONFIG_REGULATOR_S2MPA01 is not set
> # CONFIG_REGULATOR_S2MPS11 is not set
> CONFIG_REGULATOR_S5M8767=3Dy
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_TPS51632 is not set
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dy
> CONFIG_REGULATOR_TPS6507X=3Dy
> CONFIG_REGULATOR_TPS65086=3Dy
> CONFIG_REGULATOR_TPS65090=3Dy
> CONFIG_REGULATOR_TPS65217=3Dy
> CONFIG_REGULATOR_TPS6586X=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
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
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_RC_SUPPORT=3Dy
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> CONFIG_VIDEO_DEV=3Dy
> # CONFIG_VIDEO_V4L2_SUBDEV_API is not set
> CONFIG_VIDEO_V4L2=3Dy
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_VIDEO_TUNER=3Dy
> CONFIG_V4L2_MEM2MEM_DEV=3Dy
> CONFIG_VIDEOBUF_GEN=3Dy
> CONFIG_VIDEOBUF_VMALLOC=3Dy
> CONFIG_VIDEOBUF_DVB=3Dy
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> CONFIG_VIDEOBUF2_DMA_SG=3Dy
> CONFIG_DVB_CORE=3Dy
> CONFIG_DVB_NET=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> CONFIG_DVB_MAX_ADAPTERS=3D8
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> =

> #
> # Media drivers
> #
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dy
> # CONFIG_RC_DECODERS is not set
> # CONFIG_RC_DEVICES is not set
> CONFIG_MEDIA_USB_SUPPORT=3Dy
> =

> #
> # Webcam devices
> #
> # CONFIG_USB_VIDEO_CLASS is not set
> # CONFIG_USB_GSPCA is not set
> # CONFIG_USB_PWC is not set
> CONFIG_VIDEO_CPIA2=3Dy
> CONFIG_USB_ZR364XX=3Dy
> # CONFIG_USB_STKWEBCAM is not set
> CONFIG_USB_S2255=3Dy
> =

> #
> # Analog TV USB devices
> #
> CONFIG_VIDEO_PVRUSB2=3Dy
> CONFIG_VIDEO_PVRUSB2_SYSFS=3Dy
> CONFIG_VIDEO_PVRUSB2_DVB=3Dy
> CONFIG_VIDEO_PVRUSB2_DEBUGIFC=3Dy
> # CONFIG_VIDEO_HDPVR is not set
> # CONFIG_VIDEO_USBVISION is not set
> # CONFIG_VIDEO_STK1160_COMMON is not set
> =

> #
> # Analog/digital TV USB devices
> #
> CONFIG_VIDEO_AU0828=3Dy
> # CONFIG_VIDEO_AU0828_V4L2 is not set
> CONFIG_VIDEO_AU0828_RC=3Dy
> CONFIG_VIDEO_CX231XX=3Dy
> CONFIG_VIDEO_CX231XX_RC=3Dy
> CONFIG_VIDEO_CX231XX_DVB=3Dy
> CONFIG_VIDEO_TM6000=3Dy
> CONFIG_VIDEO_TM6000_DVB=3Dy
> =

> #
> # Digital TV USB devices
> #
> CONFIG_DVB_USB=3Dy
> # CONFIG_DVB_USB_DEBUG is not set
> CONFIG_DVB_USB_A800=3Dy
> # CONFIG_DVB_USB_DIBUSB_MB is not set
> CONFIG_DVB_USB_DIBUSB_MC=3Dy
> CONFIG_DVB_USB_DIB0700=3Dy
> CONFIG_DVB_USB_UMT_010=3Dy
> CONFIG_DVB_USB_CXUSB=3Dy
> CONFIG_DVB_USB_M920X=3Dy
> CONFIG_DVB_USB_DIGITV=3Dy
> CONFIG_DVB_USB_VP7045=3Dy
> CONFIG_DVB_USB_VP702X=3Dy
> CONFIG_DVB_USB_GP8PSK=3Dy
> CONFIG_DVB_USB_NOVA_T_USB2=3Dy
> CONFIG_DVB_USB_TTUSB2=3Dy
> # CONFIG_DVB_USB_DTT200U is not set
> # CONFIG_DVB_USB_OPERA1 is not set
> CONFIG_DVB_USB_AF9005=3Dy
> CONFIG_DVB_USB_AF9005_REMOTE=3Dy
> # CONFIG_DVB_USB_PCTV452E is not set
> CONFIG_DVB_USB_DW2102=3Dy
> CONFIG_DVB_USB_CINERGY_T2=3Dy
> # CONFIG_DVB_USB_DTV5100 is not set
> CONFIG_DVB_USB_FRIIO=3Dy
> CONFIG_DVB_USB_AZ6027=3Dy
> CONFIG_DVB_USB_TECHNISAT_USB2=3Dy
> CONFIG_DVB_USB_V2=3Dy
> CONFIG_DVB_USB_AF9015=3Dy
> CONFIG_DVB_USB_AF9035=3Dy
> CONFIG_DVB_USB_ANYSEE=3Dy
> CONFIG_DVB_USB_AU6610=3Dy
> CONFIG_DVB_USB_AZ6007=3Dy
> CONFIG_DVB_USB_CE6230=3Dy
> CONFIG_DVB_USB_EC168=3Dy
> # CONFIG_DVB_USB_GL861 is not set
> CONFIG_DVB_USB_LME2510=3Dy
> # CONFIG_DVB_USB_MXL111SF is not set
> # CONFIG_DVB_USB_RTL28XXU is not set
> CONFIG_DVB_USB_DVBSKY=3Dy
> # CONFIG_DVB_TTUSB_BUDGET is not set
> # CONFIG_DVB_TTUSB_DEC is not set
> CONFIG_SMS_USB_DRV=3Dy
> CONFIG_DVB_B2C2_FLEXCOP_USB=3Dy
> CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG=3Dy
> CONFIG_DVB_AS102=3Dy
> =

> #
> # Webcam, TV (analog/digital) USB devices
> #
> CONFIG_VIDEO_EM28XX=3Dy
> CONFIG_VIDEO_EM28XX_V4L2=3Dy
> CONFIG_VIDEO_EM28XX_DVB=3Dy
> CONFIG_VIDEO_EM28XX_RC=3Dy
> =

> #
> # Software defined radio USB devices
> #
> CONFIG_USB_AIRSPY=3Dy
> # CONFIG_USB_HACKRF is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_V4L_PLATFORM_DRIVERS=3Dy
> # CONFIG_VIDEO_CAFE_CCIC is not set
> CONFIG_SOC_CAMERA=3Dy
> # CONFIG_SOC_CAMERA_PLATFORM is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> CONFIG_V4L_TEST_DRIVERS=3Dy
> # CONFIG_VIDEO_VIVID is not set
> CONFIG_VIDEO_VIM2M=3Dy
> CONFIG_DVB_PLATFORM_DRIVERS=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_SMS_SDIO_DRV=3Dy
> CONFIG_RADIO_ADAPTERS=3Dy
> CONFIG_RADIO_TEA575X=3Dy
> CONFIG_RADIO_SI470X=3Dy
> CONFIG_USB_SI470X=3Dy
> # CONFIG_RADIO_SI4713 is not set
> CONFIG_USB_MR800=3Dy
> CONFIG_USB_DSBR=3Dy
> # CONFIG_RADIO_MAXIRADIO is not set
> CONFIG_RADIO_SHARK=3Dy
> CONFIG_RADIO_SHARK2=3Dy
> CONFIG_USB_KEENE=3Dy
> CONFIG_USB_RAREMONO=3Dy
> # CONFIG_USB_MA901 is not set
> # CONFIG_RADIO_TEA5764 is not set
> CONFIG_RADIO_SAA7706H=3Dy
> # CONFIG_RADIO_TEF6862 is not set
> CONFIG_RADIO_WL1273=3Dy
> =

> #
> # Texas Instruments WL128x FM driver (ST based)
> #
> CONFIG_RADIO_WL128X=3Dy
> # CONFIG_V4L_RADIO_ISA_DRIVERS is not set
> =

> #
> # Supported FireWire (IEEE 1394) Adapters
> #
> # CONFIG_DVB_FIREDTV is not set
> CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> =

> #
> # common driver options
> #
> CONFIG_VIDEO_CX2341X=3Dy
> CONFIG_VIDEO_TVEEPROM=3Dy
> CONFIG_CYPRESS_FIRMWARE=3Dy
> CONFIG_DVB_B2C2_FLEXCOP=3Dy
> CONFIG_DVB_B2C2_FLEXCOP_DEBUG=3Dy
> CONFIG_SMS_SIANO_MDTV=3Dy
> # CONFIG_SMS_SIANO_RC is not set
> # CONFIG_SMS_SIANO_DEBUGFS is not set
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
> CONFIG_VIDEO_TDA7432=3Dy
> CONFIG_VIDEO_TDA9840=3Dy
> # CONFIG_VIDEO_TEA6415C is not set
> # CONFIG_VIDEO_TEA6420 is not set
> CONFIG_VIDEO_MSP3400=3Dy
> CONFIG_VIDEO_CS3308=3Dy
> # CONFIG_VIDEO_CS5345 is not set
> CONFIG_VIDEO_CS53L32A=3Dy
> CONFIG_VIDEO_TLV320AIC23B=3Dy
> CONFIG_VIDEO_UDA1342=3Dy
> CONFIG_VIDEO_WM8775=3Dy
> CONFIG_VIDEO_WM8739=3Dy
> CONFIG_VIDEO_VP27SMPX=3Dy
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> =

> #
> # RDS decoders
> #
> # CONFIG_VIDEO_SAA6588 is not set
> =

> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7183=3Dy
> CONFIG_VIDEO_BT819=3Dy
> CONFIG_VIDEO_BT856=3Dy
> # CONFIG_VIDEO_BT866 is not set
> CONFIG_VIDEO_KS0127=3Dy
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> CONFIG_VIDEO_SAA711X=3Dy
> CONFIG_VIDEO_TVP514X=3Dy
> CONFIG_VIDEO_TVP5150=3Dy
> CONFIG_VIDEO_TVP7002=3Dy
> # CONFIG_VIDEO_TW2804 is not set
> CONFIG_VIDEO_TW9903=3Dy
> # CONFIG_VIDEO_TW9906 is not set
> # CONFIG_VIDEO_VPX3220 is not set
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
> # CONFIG_VIDEO_ADV7343 is not set
> CONFIG_VIDEO_ADV7393=3Dy
> CONFIG_VIDEO_AK881X=3Dy
> CONFIG_VIDEO_THS8200=3Dy
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_OV2659=3Dy
> CONFIG_VIDEO_OV7640=3Dy
> # CONFIG_VIDEO_OV7670 is not set
> CONFIG_VIDEO_VS6624=3Dy
> CONFIG_VIDEO_MT9V011=3Dy
> # CONFIG_VIDEO_SR030PC30 is not set
> =

> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=3Dy
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
> # CONFIG_VIDEO_THS7303 is not set
> # CONFIG_VIDEO_M52790 is not set
> =

> #
> # Sensors used on soc_camera driver
> #
> =

> #
> # soc_camera sensor drivers
> #
> CONFIG_SOC_CAMERA_IMX074=3Dy
> CONFIG_SOC_CAMERA_MT9M001=3Dy
> CONFIG_SOC_CAMERA_MT9M111=3Dy
> CONFIG_SOC_CAMERA_MT9T031=3Dy
> # CONFIG_SOC_CAMERA_MT9T112 is not set
> CONFIG_SOC_CAMERA_MT9V022=3Dy
> CONFIG_SOC_CAMERA_OV2640=3Dy
> CONFIG_SOC_CAMERA_OV5642=3Dy
> # CONFIG_SOC_CAMERA_OV6650 is not set
> CONFIG_SOC_CAMERA_OV772X=3Dy
> CONFIG_SOC_CAMERA_OV9640=3Dy
> CONFIG_SOC_CAMERA_OV9740=3Dy
> CONFIG_SOC_CAMERA_RJ54N1=3Dy
> CONFIG_SOC_CAMERA_TW9910=3Dy
> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> # CONFIG_MEDIA_TUNER_SIMPLE is not set
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> # CONFIG_MEDIA_TUNER_TDA9887 is not set
> CONFIG_MEDIA_TUNER_TEA5761=3Dy
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
> # CONFIG_MEDIA_TUNER_MT2063 is not set
> CONFIG_MEDIA_TUNER_MT2266=3Dy
> CONFIG_MEDIA_TUNER_MT2131=3Dy
> CONFIG_MEDIA_TUNER_QT1010=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> # CONFIG_MEDIA_TUNER_MAX2165 is not set
> CONFIG_MEDIA_TUNER_TDA18218=3Dy
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> CONFIG_MEDIA_TUNER_FC0012=3Dy
> CONFIG_MEDIA_TUNER_FC0013=3Dy
> # CONFIG_MEDIA_TUNER_TDA18212 is not set
> # CONFIG_MEDIA_TUNER_E4000 is not set
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> # CONFIG_MEDIA_TUNER_M88RS6000T is not set
> CONFIG_MEDIA_TUNER_TUA9001=3Dy
> # CONFIG_MEDIA_TUNER_SI2157 is not set
> CONFIG_MEDIA_TUNER_IT913X=3Dy
> CONFIG_MEDIA_TUNER_R820T=3Dy
> # CONFIG_MEDIA_TUNER_MXL301RF is not set
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
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
> # CONFIG_DVB_STV090x is not set
> CONFIG_DVB_STV6110x=3Dy
> # CONFIG_DVB_M88DS3103 is not set
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> # CONFIG_DVB_DRXK is not set
> # CONFIG_DVB_TDA18271C2DD is not set
> # CONFIG_DVB_SI2165 is not set
> # CONFIG_DVB_MN88472 is not set
> CONFIG_DVB_MN88473=3Dy
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dy
> CONFIG_DVB_CX24123=3Dy
> # CONFIG_DVB_MT312 is not set
> CONFIG_DVB_ZL10036=3Dy
> CONFIG_DVB_ZL10039=3Dy
> CONFIG_DVB_S5H1420=3Dy
> CONFIG_DVB_STV0288=3Dy
> CONFIG_DVB_STB6000=3Dy
> # CONFIG_DVB_STV0299 is not set
> # CONFIG_DVB_STV6110 is not set
> CONFIG_DVB_STV0900=3Dy
> CONFIG_DVB_TDA8083=3Dy
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=3Dy
> # CONFIG_DVB_VES1X93 is not set
> CONFIG_DVB_TUNER_ITD1000=3Dy
> CONFIG_DVB_TUNER_CX24113=3Dy
> # CONFIG_DVB_TDA826X is not set
> CONFIG_DVB_TUA6100=3Dy
> CONFIG_DVB_CX24116=3Dy
> # CONFIG_DVB_CX24117 is not set
> # CONFIG_DVB_CX24120 is not set
> # CONFIG_DVB_SI21XX is not set
> CONFIG_DVB_TS2020=3Dy
> CONFIG_DVB_DS3000=3Dy
> # CONFIG_DVB_MB86A16 is not set
> CONFIG_DVB_TDA10071=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> # CONFIG_DVB_SP887X is not set
> CONFIG_DVB_CX22700=3Dy
> CONFIG_DVB_CX22702=3Dy
> # CONFIG_DVB_S5H1432 is not set
> CONFIG_DVB_DRXD=3Dy
> # CONFIG_DVB_L64781 is not set
> # CONFIG_DVB_TDA1004X is not set
> # CONFIG_DVB_NXT6000 is not set
> CONFIG_DVB_MT352=3Dy
> CONFIG_DVB_ZL10353=3Dy
> # CONFIG_DVB_DIB3000MB is not set
> CONFIG_DVB_DIB3000MC=3Dy
> CONFIG_DVB_DIB7000M=3Dy
> CONFIG_DVB_DIB7000P=3Dy
> CONFIG_DVB_DIB9000=3Dy
> CONFIG_DVB_TDA10048=3Dy
> CONFIG_DVB_AF9013=3Dy
> CONFIG_DVB_EC100=3Dy
> CONFIG_DVB_HD29L2=3Dy
> CONFIG_DVB_STV0367=3Dy
> CONFIG_DVB_CXD2820R=3Dy
> CONFIG_DVB_CXD2841ER=3Dy
> # CONFIG_DVB_RTL2830 is not set
> CONFIG_DVB_RTL2832=3Dy
> # CONFIG_DVB_RTL2832_SDR is not set
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_AS102_FE=3Dy
> =

> #
> # DVB-C (cable) frontends
> #
> # CONFIG_DVB_VES1820 is not set
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
> # CONFIG_DVB_BCM3510 is not set
> CONFIG_DVB_LGDT330X=3Dy
> # CONFIG_DVB_LGDT3305 is not set
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
> CONFIG_DVB_DIB8000=3Dy
> CONFIG_DVB_MB86A20S=3Dy
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_TC90522 is not set
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
> # CONFIG_DVB_LNBH25 is not set
> # CONFIG_DVB_LNBP21 is not set
> # CONFIG_DVB_LNBP22 is not set
> CONFIG_DVB_ISL6405=3Dy
> CONFIG_DVB_ISL6421=3Dy
> CONFIG_DVB_ISL6423=3Dy
> # CONFIG_DVB_A8293 is not set
> CONFIG_DVB_SP2=3Dy
> CONFIG_DVB_LGS8GL5=3Dy
> CONFIG_DVB_LGS8GXX=3Dy
> CONFIG_DVB_ATBM8830=3Dy
> CONFIG_DVB_TDA665x=3Dy
> CONFIG_DVB_IX2505V=3Dy
> CONFIG_DVB_M88RS2000=3Dy
> CONFIG_DVB_AF9033=3Dy
> # CONFIG_DVB_HORUS3A is not set
> # CONFIG_DVB_ASCOT2E is not set
> # CONFIG_DVB_HELENE is not set
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
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> # CONFIG_DRM_I2C_SIL164 is not set
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
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
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
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
> # CONFIG_FB_HGA is not set
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
> # CONFIG_FB_GEODE is not set
> CONFIG_FB_SM501=3Dy
> CONFIG_FB_SMSCUFX=3Dy
> CONFIG_FB_UDL=3Dy
> CONFIG_FB_IBM_GXT4500=3Dy
> CONFIG_FB_GOLDFISH=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_FB_METRONOME=3Dy
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_AUO_K190X=3Dy
> # CONFIG_FB_AUO_K1900 is not set
> CONFIG_FB_AUO_K1901=3Dy
> CONFIG_FB_SIMPLE=3Dy
> # CONFIG_FB_SM712 is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> CONFIG_BACKLIGHT_LM3533=3Dy
> CONFIG_BACKLIGHT_PWM=3Dy
> # CONFIG_BACKLIGHT_MAX8925 is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_88PM860X=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> CONFIG_BACKLIGHT_LM3630A=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_LP855X=3Dy
> CONFIG_BACKLIGHT_LP8788=3Dy
> # CONFIG_BACKLIGHT_SKY81452 is not set
> CONFIG_BACKLIGHT_TPS65217=3Dy
> # CONFIG_BACKLIGHT_GPIO is not set
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> # CONFIG_VGASTATE is not set
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dy
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> CONFIG_HID_ACRUX=3Dy
> CONFIG_HID_ACRUX_FF=3Dy
> # CONFIG_HID_APPLE is not set
> CONFIG_HID_APPLEIR=3Dy
> # CONFIG_HID_ASUS is not set
> CONFIG_HID_AUREAL=3Dy
> CONFIG_HID_BELKIN=3Dy
> CONFIG_HID_BETOP_FF=3Dy
> CONFIG_HID_CHERRY=3Dy
> # CONFIG_HID_CHICONY is not set
> CONFIG_HID_CORSAIR=3Dy
> CONFIG_HID_CMEDIA=3Dy
> CONFIG_HID_CP2112=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_ELO=3Dy
> # CONFIG_HID_EZKEY is not set
> CONFIG_HID_GEMBIRD=3Dy
> CONFIG_HID_GFRM=3Dy
> CONFIG_HID_HOLTEK=3Dy
> CONFIG_HOLTEK_FF=3Dy
> CONFIG_HID_GT683R=3Dy
> CONFIG_HID_KEYTOUCH=3Dy
> # CONFIG_HID_KYE is not set
> # CONFIG_HID_UCLOGIC is not set
> CONFIG_HID_WALTOP=3Dy
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dy
> CONFIG_HID_LOGITECH=3Dy
> CONFIG_HID_LOGITECH_HIDPP=3Dy
> # CONFIG_LOGITECH_FF is not set
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> # CONFIG_HID_NTRIG is not set
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> CONFIG_HID_PENMOUNT=3Dy
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dy
> # CONFIG_HID_PICOLCD_FB is not set
> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
> CONFIG_HID_PICOLCD_LCD=3Dy
> # CONFIG_HID_PICOLCD_LEDS is not set
> CONFIG_HID_PICOLCD_CIR=3Dy
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_ROCCAT=3Dy
> CONFIG_HID_SAITEK=3Dy
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SONY=3Dy
> CONFIG_SONY_FF=3Dy
> CONFIG_HID_SPEEDLINK=3Dy
> # CONFIG_HID_STEELSERIES is not set
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_SMARTJOYPLUS=3Dy
> CONFIG_SMARTJOYPLUS_FF=3Dy
> # CONFIG_HID_TIVO is not set
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> CONFIG_THRUSTMASTER_FF=3Dy
> # CONFIG_HID_WACOM is not set
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dy
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> CONFIG_HID_ALPS=3Dy
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> # CONFIG_HID_PID is not set
> CONFIG_USB_HIDDEV=3Dy
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
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> =

> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> CONFIG_USB_DYNAMIC_MINORS=3Dy
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_WHITELIST is not set
> # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> # CONFIG_USB_ULPI_BUS is not set
> CONFIG_USB_MON=3Dy
> CONFIG_USB_WUSB_CBAF=3Dy
> CONFIG_USB_WUSB_CBAF_DEBUG=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> # CONFIG_USB_XHCI_HCD is not set
> CONFIG_USB_EHCI_HCD=3Dy
> # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
> # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> CONFIG_USB_EHCI_PCI=3Dy
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> CONFIG_USB_OXU210HP_HCD=3Dy
> CONFIG_USB_ISP116X_HCD=3Dy
> # CONFIG_USB_ISP1362_HCD is not set
> CONFIG_USB_FOTG210_HCD=3Dy
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> # CONFIG_USB_OHCI_HCD_SSB is not set
> CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> # CONFIG_USB_UHCI_HCD is not set
> CONFIG_USB_U132_HCD=3Dy
> # CONFIG_USB_SL811_HCD is not set
> CONFIG_USB_R8A66597_HCD=3Dy
> CONFIG_USB_HCD_BCMA=3Dy
> # CONFIG_USB_HCD_SSB is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> # CONFIG_USB_PRINTER is not set
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
> =

> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=3Dy
> CONFIG_USBIP_CORE=3Dy
> CONFIG_USBIP_VHCI_HCD=3Dy
> CONFIG_USBIP_HOST=3Dy
> CONFIG_USBIP_VUDC=3Dy
> # CONFIG_USBIP_DEBUG is not set
> CONFIG_USB_MUSB_HDRC=3Dy
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
> # CONFIG_MUSB_PIO_ONLY is not set
> # CONFIG_USB_DWC3 is not set
> CONFIG_USB_DWC2=3Dy
> CONFIG_USB_DWC2_HOST=3Dy
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> # CONFIG_USB_DWC2_PERIPHERAL is not set
> # CONFIG_USB_DWC2_DUAL_ROLE is not set
> # CONFIG_USB_DWC2_PCI is not set
> # CONFIG_USB_DWC2_DEBUG is not set
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> # CONFIG_USB_CHIPIDEA is not set
> # CONFIG_USB_ISP1760 is not set
> =

> #
> # USB port drivers
> #
> CONFIG_USB_USS720=3Dy
> CONFIG_USB_SERIAL=3Dy
> CONFIG_USB_SERIAL_CONSOLE=3Dy
> # CONFIG_USB_SERIAL_GENERIC is not set
> CONFIG_USB_SERIAL_SIMPLE=3Dy
> CONFIG_USB_SERIAL_AIRCABLE=3Dy
> # CONFIG_USB_SERIAL_ARK3116 is not set
> CONFIG_USB_SERIAL_BELKIN=3Dy
> CONFIG_USB_SERIAL_CH341=3Dy
> CONFIG_USB_SERIAL_WHITEHEAT=3Dy
> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> # CONFIG_USB_SERIAL_CP210X is not set
> CONFIG_USB_SERIAL_CYPRESS_M8=3Dy
> CONFIG_USB_SERIAL_EMPEG=3Dy
> CONFIG_USB_SERIAL_FTDI_SIO=3Dy
> CONFIG_USB_SERIAL_VISOR=3Dy
> CONFIG_USB_SERIAL_IPAQ=3Dy
> # CONFIG_USB_SERIAL_IR is not set
> CONFIG_USB_SERIAL_EDGEPORT=3Dy
> CONFIG_USB_SERIAL_EDGEPORT_TI=3Dy
> CONFIG_USB_SERIAL_F81232=3Dy
> CONFIG_USB_SERIAL_GARMIN=3Dy
> CONFIG_USB_SERIAL_IPW=3Dy
> CONFIG_USB_SERIAL_IUU=3Dy
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> # CONFIG_USB_SERIAL_KEYSPAN is not set
> CONFIG_USB_SERIAL_KLSI=3Dy
> CONFIG_USB_SERIAL_KOBIL_SCT=3Dy
> # CONFIG_USB_SERIAL_MCT_U232 is not set
> CONFIG_USB_SERIAL_METRO=3Dy
> # CONFIG_USB_SERIAL_MOS7720 is not set
> CONFIG_USB_SERIAL_MOS7840=3Dy
> CONFIG_USB_SERIAL_MXUPORT=3Dy
> CONFIG_USB_SERIAL_NAVMAN=3Dy
> CONFIG_USB_SERIAL_PL2303=3Dy
> CONFIG_USB_SERIAL_OTI6858=3Dy
> CONFIG_USB_SERIAL_QCAUX=3Dy
> CONFIG_USB_SERIAL_QUALCOMM=3Dy
> CONFIG_USB_SERIAL_SPCP8X5=3Dy
> CONFIG_USB_SERIAL_SAFE=3Dy
> CONFIG_USB_SERIAL_SAFE_PADDED=3Dy
> # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> CONFIG_USB_SERIAL_SYMBOL=3Dy
> # CONFIG_USB_SERIAL_TI is not set
> CONFIG_USB_SERIAL_CYBERJACK=3Dy
> CONFIG_USB_SERIAL_XIRCOM=3Dy
> CONFIG_USB_SERIAL_WWAN=3Dy
> # CONFIG_USB_SERIAL_OPTION is not set
> # CONFIG_USB_SERIAL_OMNINET is not set
> CONFIG_USB_SERIAL_OPTICON=3Dy
> # CONFIG_USB_SERIAL_XSENS_MT is not set
> # CONFIG_USB_SERIAL_WISHBONE is not set
> # CONFIG_USB_SERIAL_SSU100 is not set
> CONFIG_USB_SERIAL_QT2=3Dy
> # CONFIG_USB_SERIAL_DEBUG is not set
> =

> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dy
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> CONFIG_USB_RIO500=3Dy
> CONFIG_USB_LEGOTOWER=3Dy
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> CONFIG_USB_CYTHERM=3Dy
> CONFIG_USB_IDMOUSE=3Dy
> CONFIG_USB_FTDI_ELAN=3Dy
> CONFIG_USB_APPLEDISPLAY=3Dy
> CONFIG_USB_SISUSBVGA=3Dy
> # CONFIG_USB_LD is not set
> CONFIG_USB_TRANCEVIBRATOR=3Dy
> # CONFIG_USB_IOWARRIOR is not set
> CONFIG_USB_TEST=3Dy
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> CONFIG_USB_ISIGHTFW=3Dy
> CONFIG_USB_YUREX=3Dy
> CONFIG_USB_EZUSB_FX2=3Dy
> CONFIG_USB_HSIC_USB3503=3Dy
> CONFIG_USB_LINK_LAYER_TEST=3Dy
> # CONFIG_UCSI is not set
> CONFIG_USB_ATM=3Dy
> # CONFIG_USB_SPEEDTOUCH is not set
> CONFIG_USB_CXACRU=3Dy
> # CONFIG_USB_UEAGLEATM is not set
> # CONFIG_USB_XUSBATM is not set
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> # CONFIG_USB_GPIO_VBUS is not set
> CONFIG_USB_ISP1301=3Dy
> CONFIG_USB_GADGET=3Dy
> # CONFIG_USB_GADGET_DEBUG is not set
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> CONFIG_USB_GADGET_DEBUG_FS=3Dy
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> =

> #
> # USB Peripheral Controller
> #
> CONFIG_USB_FOTG210_UDC=3Dy
> CONFIG_USB_GR_UDC=3Dy
> CONFIG_USB_R8A66597=3Dy
> # CONFIG_USB_PXA27X is not set
> CONFIG_USB_MV_UDC=3Dy
> CONFIG_USB_MV_U3D=3Dy
> CONFIG_USB_M66592=3Dy
> CONFIG_USB_BDC_UDC=3Dy
> =

> #
> # Platform Support
> #
> CONFIG_USB_BDC_PCI=3Dy
> # CONFIG_USB_AMD5536UDC is not set
> # CONFIG_USB_NET2272 is not set
> # CONFIG_USB_NET2280 is not set
> # CONFIG_USB_GOKU is not set
> # CONFIG_USB_EG20T is not set
> # CONFIG_USB_DUMMY_HCD is not set
> CONFIG_USB_LIBCOMPOSITE=3Dy
> CONFIG_USB_F_ACM=3Dy
> CONFIG_USB_U_SERIAL=3Dy
> CONFIG_USB_F_MASS_STORAGE=3Dy
> # CONFIG_USB_CONFIGFS is not set
> # CONFIG_USB_ZERO is not set
> # CONFIG_USB_ETH is not set
> # CONFIG_USB_G_NCM is not set
> # CONFIG_USB_GADGETFS is not set
> # CONFIG_USB_FUNCTIONFS is not set
> # CONFIG_USB_MASS_STORAGE is not set
> # CONFIG_USB_G_SERIAL is not set
> # CONFIG_USB_G_PRINTER is not set
> # CONFIG_USB_CDC_COMPOSITE is not set
> # CONFIG_USB_G_NOKIA is not set
> CONFIG_USB_G_ACM_MS=3Dy
> # CONFIG_USB_G_MULTI is not set
> # CONFIG_USB_G_HID is not set
> # CONFIG_USB_G_DBGP is not set
> # CONFIG_USB_G_WEBCAM is not set
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_UWB is not set
> CONFIG_MMC=3Dy
> # CONFIG_MMC_DEBUG is not set
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_MMC_BLOCK_BOUNCE=3Dy
> CONFIG_SDIO_UART=3Dy
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_SDHCI=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> # CONFIG_MMC_SDHCI_PLTFM is not set
> CONFIG_MMC_WBSD=3Dy
> # CONFIG_MMC_TIFM_SD is not set
> CONFIG_MMC_GOLDFISH=3Dy
> # CONFIG_MMC_SDRICOH_CS is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_VUB300=3Dy
> CONFIG_MMC_USHC=3Dy
> CONFIG_MMC_USDHI6ROL0=3Dy
> # CONFIG_MMC_REALTEK_USB is not set
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
> CONFIG_MS_BLOCK=3Dy
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> # CONFIG_MEMSTICK_REALTEK_USB is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_88PM860X is not set
> # CONFIG_LEDS_LM3530 is not set
> CONFIG_LEDS_LM3533=3Dy
> # CONFIG_LEDS_LM3642 is not set
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> CONFIG_LEDS_LP5523=3Dy
> # CONFIG_LEDS_LP5562 is not set
> # CONFIG_LEDS_LP8501 is not set
> CONFIG_LEDS_LP8788=3Dy
> CONFIG_LEDS_LP8860=3Dy
> # CONFIG_LEDS_CLEVO_MAIL is not set
> # CONFIG_LEDS_PCA955X is not set
> CONFIG_LEDS_PCA963X=3Dy
> CONFIG_LEDS_PWM=3Dy
> # CONFIG_LEDS_REGULATOR is not set
> CONFIG_LEDS_BD2802=3Dy
> # CONFIG_LEDS_INTEL_SS4200 is not set
> CONFIG_LEDS_LT3593=3Dy
> CONFIG_LEDS_MC13783=3Dy
> CONFIG_LEDS_TCA6507=3Dy
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_LM355x is not set
> CONFIG_LEDS_OT200=3Dy
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
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> CONFIG_LEDS_TRIGGER_MTD=3Dy
> # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> CONFIG_LEDS_TRIGGER_CPU=3Dy
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> CONFIG_ACCESSIBILITY=3Dy
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> # CONFIG_RTC_INTF_DEV is not set
> CONFIG_RTC_DRV_TEST=3Dy
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM860X=3Dy
> # CONFIG_RTC_DRV_88PM80X is not set
> CONFIG_RTC_DRV_ABB5ZES3=3Dy
> # CONFIG_RTC_DRV_ABX80X is not set
> # CONFIG_RTC_DRV_DS1307 is not set
> CONFIG_RTC_DRV_DS1374=3Dy
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dy
> CONFIG_RTC_DRV_LP8788=3Dy
> CONFIG_RTC_DRV_MAX6900=3Dy
> # CONFIG_RTC_DRV_MAX8907 is not set
> CONFIG_RTC_DRV_MAX8925=3Dy
> CONFIG_RTC_DRV_RS5C372=3Dy
> CONFIG_RTC_DRV_ISL1208=3Dy
> CONFIG_RTC_DRV_ISL12022=3Dy
> CONFIG_RTC_DRV_ISL12057=3Dy
> CONFIG_RTC_DRV_X1205=3Dy
> CONFIG_RTC_DRV_PCF8523=3Dy
> CONFIG_RTC_DRV_PCF85063=3Dy
> # CONFIG_RTC_DRV_PCF8563 is not set
> CONFIG_RTC_DRV_PCF8583=3Dy
> # CONFIG_RTC_DRV_M41T80 is not set
> # CONFIG_RTC_DRV_BQ32K is not set
> CONFIG_RTC_DRV_PALMAS=3Dy
> # CONFIG_RTC_DRV_TPS6586X is not set
> CONFIG_RTC_DRV_RC5T583=3Dy
> CONFIG_RTC_DRV_S35390A=3Dy
> CONFIG_RTC_DRV_FM3130=3Dy
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dy
> CONFIG_RTC_DRV_RX8025=3Dy
> CONFIG_RTC_DRV_EM3027=3Dy
> # CONFIG_RTC_DRV_RV8803 is not set
> CONFIG_RTC_DRV_S5M=3Dy
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dy
> CONFIG_RTC_DRV_PCF2127=3Dy
> # CONFIG_RTC_DRV_RV3029C2 is not set
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> # CONFIG_RTC_DRV_DS1286 is not set
> # CONFIG_RTC_DRV_DS1511 is not set
> CONFIG_RTC_DRV_DS1553=3Dy
> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
> # CONFIG_RTC_DRV_DS1685 is not set
> CONFIG_RTC_DRV_DS1689=3Dy
> # CONFIG_RTC_DRV_DS17285 is not set
> # CONFIG_RTC_DRV_DS17485 is not set
> # CONFIG_RTC_DRV_DS17885 is not set
> # CONFIG_RTC_DS1685_PROC_REGS is not set
> CONFIG_RTC_DS1685_SYSFS_REGS=3Dy
> # CONFIG_RTC_DRV_DS1742 is not set
> # CONFIG_RTC_DRV_DS2404 is not set
> CONFIG_RTC_DRV_DA9063=3Dy
> CONFIG_RTC_DRV_STK17TA8=3Dy
> CONFIG_RTC_DRV_M48T86=3Dy
> CONFIG_RTC_DRV_M48T35=3Dy
> CONFIG_RTC_DRV_M48T59=3Dy
> CONFIG_RTC_DRV_MSM6242=3Dy
> CONFIG_RTC_DRV_BQ4802=3Dy
> # CONFIG_RTC_DRV_RP5C01 is not set
> # CONFIG_RTC_DRV_V3020 is not set
> CONFIG_RTC_DRV_PCF50633=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_MC13XXX=3Dy
> CONFIG_RTC_DRV_MT6397=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> # CONFIG_SYNC_FILE is not set
> # CONFIG_AUXDISPLAY is not set
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> # CONFIG_UIO_DMEM_GENIRQ is not set
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dy
> # CONFIG_UIO_MF624 is not set
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> # CONFIG_VIRTIO_INPUT is not set
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
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
> CONFIG_ANDROID_LOW_MEMORY_KILLER=3Dy
> CONFIG_ION=3Dy
> # CONFIG_ION_TEST is not set
> # CONFIG_ION_DUMMY is not set
> CONFIG_FIREWIRE_SERIAL=3Dy
> CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
> CONFIG_FWTTY_MAX_CARD_PORTS=3D32
> CONFIG_GOLDFISH_AUDIO=3Dy
> # CONFIG_MTD_GOLDFISH_NAND is not set
> # CONFIG_DGNC is not set
> # CONFIG_GS_FPGABOOT is not set
> CONFIG_WILC1000=3Dy
> CONFIG_WILC1000_SDIO=3Dy
> CONFIG_WILC1000_HW_OOB_INTR=3Dy
> # CONFIG_MOST is not set
> CONFIG_KS7010=3Dy
> # CONFIG_X86_PLATFORM_DEVICES is not set
> # CONFIG_GOLDFISH_BUS is not set
> CONFIG_GOLDFISH_PIPE=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_LAPTOP is not set
> CONFIG_CHROMEOS_PSTORE=3Dy
> # CONFIG_CROS_EC_CHARDEV is not set
> CONFIG_CROS_EC_LPC=3Dy
> CONFIG_CROS_EC_PROTO=3Dy
> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
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
> =

> #
> # Broadcom SoC drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> CONFIG_SOC_TI=3Dy
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
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
> # CONFIG_EXTCON_AXP288 is not set
> # CONFIG_EXTCON_GPIO is not set
> # CONFIG_EXTCON_MAX3355 is not set
> CONFIG_EXTCON_MAX77693=3Dy
> # CONFIG_EXTCON_MAX77843 is not set
> # CONFIG_EXTCON_PALMAS is not set
> # CONFIG_EXTCON_RT8973A is not set
> CONFIG_EXTCON_SM5502=3Dy
> CONFIG_EXTCON_USB_GPIO=3Dy
> CONFIG_MEMORY=3Dy
> # CONFIG_IIO is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_CRC is not set
> # CONFIG_PWM_CROS_EC is not set
> # CONFIG_PWM_LP3943 is not set
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dy
> CONFIG_ARM_GIC_MAX_NR=3D1
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> # CONFIG_RESET_CONTROLLER is not set
> # CONFIG_FMC is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_SAMSUNG_USB2=3Dy
> # CONFIG_PHY_EXYNOS4210_USB2 is not set
> # CONFIG_PHY_EXYNOS4X12_USB2 is not set
> # CONFIG_PHY_EXYNOS5250_USB2 is not set
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
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
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> CONFIG_ANDROID_BINDER_IPC_32BIT=3Dy
> # CONFIG_LIBNVDIMM is not set
> CONFIG_DEV_DAX=3Dy
> # CONFIG_NVMEM is not set
> CONFIG_STM=3Dy
> CONFIG_STM_DUMMY=3Dy
> # CONFIG_STM_SOURCE_CONSOLE is not set
> CONFIG_STM_SOURCE_HEARTBEAT=3Dy
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_GTH is not set
> # CONFIG_INTEL_TH_STH is not set
> # CONFIG_INTEL_TH_MSU is not set
> # CONFIG_INTEL_TH_PTI is not set
> # CONFIG_INTEL_TH_DEBUG is not set
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
> # CONFIG_ARM_SCPI_PROTOCOL is not set
> # CONFIG_EDD is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dy
> CONFIG_DCDBAS=3Dy
> # CONFIG_DMIID is not set
> # CONFIG_DMI_SYSFS is not set
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
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
> CONFIG_EXT2_FS=3Dy
> CONFIG_EXT2_FS_XATTR=3Dy
> CONFIG_EXT2_FS_POSIX_ACL=3Dy
> # CONFIG_EXT2_FS_SECURITY is not set
> CONFIG_EXT3_FS=3Dy
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> # CONFIG_EXT3_FS_SECURITY is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> # CONFIG_EXT4_FS_SECURITY is not set
> # CONFIG_EXT4_ENCRYPTION is not set
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> CONFIG_REISERFS_CHECK=3Dy
> # CONFIG_REISERFS_PROC_INFO is not set
> # CONFIG_REISERFS_FS_XATTR is not set
> # CONFIG_JFS_FS is not set
> CONFIG_OCFS2_FS=3Dy
> CONFIG_OCFS2_FS_O2CB=3Dy
> CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dy
> CONFIG_OCFS2_FS_STATS=3Dy
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> CONFIG_OCFS2_DEBUG_FS=3Dy
> # CONFIG_BTRFS_FS is not set
> CONFIG_NILFS2_FS=3Dy
> CONFIG_F2FS_FS=3Dy
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> # CONFIG_F2FS_FS_POSIX_ACL is not set
> # CONFIG_F2FS_FS_SECURITY is not set
> # CONFIG_F2FS_CHECK_FS is not set
> CONFIG_F2FS_FS_ENCRYPTION=3Dy
> # CONFIG_F2FS_FAULT_INJECTION is not set
> CONFIG_FS_DAX=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> CONFIG_QFMT_V1=3Dy
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
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
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> # CONFIG_CACHEFILES is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> # CONFIG_JOLIET is not set
> CONFIG_ZISOFS=3Dy
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
> CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_NTFS_FS=3Dy
> # CONFIG_NTFS_DEBUG is not set
> CONFIG_NTFS_RW=3Dy
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
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ADFS_FS=3Dy
> CONFIG_ADFS_FS_RW=3Dy
> # CONFIG_AFFS_FS is not set
> # CONFIG_ECRYPT_FS is not set
> CONFIG_HFS_FS=3Dy
> CONFIG_HFSPLUS_FS=3Dy
> CONFIG_HFSPLUS_FS_POSIX_ACL=3Dy
> CONFIG_BEFS_FS=3Dy
> # CONFIG_BEFS_DEBUG is not set
> CONFIG_BFS_FS=3Dy
> CONFIG_EFS_FS=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> CONFIG_JFFS2_FS_WBUF_VERIFY=3Dy
> # CONFIG_JFFS2_SUMMARY is not set
> CONFIG_JFFS2_FS_XATTR=3Dy
> # CONFIG_JFFS2_FS_POSIX_ACL is not set
> # CONFIG_JFFS2_FS_SECURITY is not set
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> # CONFIG_JFFS2_LZO is not set
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> CONFIG_UBIFS_FS=3Dy
> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> # CONFIG_UBIFS_FS_LZO is not set
> # CONFIG_UBIFS_FS_ZLIB is not set
> # CONFIG_UBIFS_ATIME_SUPPORT is not set
> # CONFIG_LOGFS is not set
> CONFIG_CRAMFS=3Dy
> CONFIG_SQUASHFS=3Dy
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> CONFIG_SQUASHFS_DECOMP_SINGLE=3Dy
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
> # CONFIG_SQUASHFS_XATTR is not set
> CONFIG_SQUASHFS_ZLIB=3Dy
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> CONFIG_SQUASHFS_XZ=3Dy
> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> CONFIG_VXFS_FS=3Dy
> CONFIG_MINIX_FS=3Dy
> CONFIG_OMFS_FS=3Dy
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> CONFIG_QNX6FS_FS=3Dy
> # CONFIG_QNX6FS_DEBUG is not set
> CONFIG_ROMFS_FS=3Dy
> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> CONFIG_ROMFS_ON_MTD=3Dy
> CONFIG_PSTORE=3Dy
> # CONFIG_PSTORE_ZLIB_COMPRESS is not set
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> CONFIG_PSTORE_LZ4_COMPRESS=3Dy
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_RAM=3Dy
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> CONFIG_UFS_FS_WRITE=3Dy
> # CONFIG_UFS_DEBUG is not set
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> CONFIG_NLS_CODEPAGE_855=3Dy
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
> # CONFIG_NLS_CODEPAGE_932 is not set
> # CONFIG_NLS_CODEPAGE_949 is not set
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=3Dy
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> CONFIG_NLS_MAC_TURKISH=3Dy
> CONFIG_NLS_UTF8=3Dy
> CONFIG_DLM=3Dy
> CONFIG_DLM_DEBUG=3Dy
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
> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D1024
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_READABLE_ASM=3Dy
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
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_POISONING=3Dy
> # CONFIG_PAGE_POISONING_NO_SANITY is not set
> CONFIG_PAGE_POISONING_ZERO=3Dy
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_DEBUG_SLAB=3Dy
> # CONFIG_DEBUG_SLAB_LEAK is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_DEBUG_HIGHMEM=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Lockups and Hangs
> #
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> # CONFIG_TIMER_STATS is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PI_LIST is not set
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_REPEATEDLY is not set
> CONFIG_SPARSE_RCU_POINTER=3Dy
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
> CONFIG_RCU_EQS_DEBUG=3Dy
> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_CPU_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dy
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
> # CONFIG_ASYNC_RAID6_TEST is not set
> CONFIG_TEST_HEXDUMP=3Dy
> # CONFIG_TEST_STRING_HELPERS is not set
> CONFIG_TEST_KSTRTOX=3Dy
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_BITMAP is not set
> # CONFIG_TEST_UUID is not set
> CONFIG_TEST_RHASHTABLE=3Dy
> # CONFIG_TEST_HASH is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_UDELAY is not set
> CONFIG_MEMTEST=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> # CONFIG_STRICT_DEVMEM is not set
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> CONFIG_X86_PTDUMP_CORE=3Dy
> # CONFIG_X86_PTDUMP is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_DEBUG_WX=3Dy
> CONFIG_DOUBLEFAULT=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_IOMMU_STRESS=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_OPTIMIZE_INLINING is not set
> CONFIG_DEBUG_ENTRY=3Dy
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> # CONFIG_SECURITY is not set
> # CONFIG_SECURITYFS is not set
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
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> # CONFIG_CRYPTO_RSA is not set
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dy
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
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
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
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> # CONFIG_CRYPTO_KHAZAD is not set
> # CONFIG_CRYPTO_SALSA20 is not set
> CONFIG_CRYPTO_SALSA20_586=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
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
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> CONFIG_CRYPTO_HASH_INFO=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
> # CONFIG_CRYPTO_DEV_GEODE is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_VHOST_NET=3Dy
> CONFIG_VHOST=3Dy
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> # CONFIG_LGUEST is not set
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
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=3Dy
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dy
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
> CONFIG_LZ4_COMPRESS=3Dy
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
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_RADIX_TREE_MULTIORDER=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> CONFIG_DDR=3Dy
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> # CONFIG_SG_SPLIT is not set
> # CONFIG_SG_POOL is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
> CONFIG_STACKDEPOT=3Dy



--===============5056597553656587387==--

