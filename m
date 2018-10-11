Content-Type: multipart/mixed; boundary="===============4151744138439538089=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 66d04f05ae ("rcutorture: Recover from OOM during .."): WARNING: CPU: 0 PID: 629 at kernel/rcu/rcutorture.c:1845 rcutorture_oom_notify
Date: Thu, 11 Oct 2018 12:50:56 +0800
Message-ID: <fb0e5e91-405a-d23b-181d-c9a3d7701901@intel.com>
In-Reply-To: <20181010020614.GZ2674@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4151744138439538089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/10/2018 10:06 AM, Paul E. McKenney wrote:
> On Wed, Oct 10, 2018 at 08:04:05AM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
>>
>> commit 66d04f05ae273302dc7269897d8a5d71583d3d2b
>> Author:     Paul E. McKenney <paulmck@linux.ibm.com>
>> AuthorDate: Fri Oct 5 09:09:49 2018 -0700
>> Commit:     Paul E. McKenney <paulmck@linux.ibm.com>
>> CommitDate: Fri Oct 5 09:09:49 2018 -0700
>>
>>      rcutorture: Recover from OOM during forward-progress tests
>>      =

>>      This commit causes the OOM handler to do rcu_barrier() calls and to
>>      free up forward-progress callbacks in order to recover from OOM eve=
nts.
>>      The current test is terminated, but subsequent forward-progress tes=
ts can
>>      proceed.  This allows a long test to result in multiple forward-pro=
gress
>>      failures, greatly reducing the required testing time.
>>      =

>>      Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> This is another expected forward-progress problem (especially given small
> memory) that can be avoided using the rcutorture.fwd_progress=3D0 kernel
> boot parameter.
>
> 							Thanx, Paul
Thanks for your reminding, could you please remind us to enable it when =

it's ok to test.

Best Regards,
Rong Chen

>> 7d173f648b  rcutorture: Print forward-progress test age upon failure
>> 66d04f05ae  rcutorture: Recover from OOM during forward-progress tests
>> beb068b311  rcu: Adjust the comment of function rcu_is_watching
>> +-----------------------------------------------------------+-----------=
-+------------+------------+
>> |                                                           | 7d173f648b=
 | 66d04f05ae | beb068b311 |
>> +-----------------------------------------------------------+-----------=
-+------------+------------+
>> | boot_successes                                            | 60        =
 | 19         | 49         |
>> | boot_failures                                             | 0         =
 | 13         | 8          |
>> | WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_oom_notify | 0         =
 | 13         | 8          |
>> | EIP:rcutorture_oom_notify                                 | 0         =
 | 13         | 8          |
>> | invoked_oom-killer:gfp_mask=3D0x                            | 0       =
   | 1          |            |
>> | Mem-Info                                                  | 0         =
 | 1          |            |
>> +-----------------------------------------------------------+-----------=
-+------------+------------+
>>
>> [  109.253209] trinity-c1 (551) used greatest stack depth: 6484 bytes le=
ft
>> [  110.277070] trinity-c3 (549) used greatest stack depth: 6396 bytes le=
ft
>> [  111.273253] trinity-c0 (550) used greatest stack depth: 6356 bytes le=
ft
>> [  114.415191] ------------[ cut here ]------------
>> [  114.415767] rcutorture_oom_notify invoked upon OOM during forward-pro=
gress testing.
>> [  114.416971] WARNING: CPU: 0 PID: 629 at kernel/rcu/rcutorture.c:1845 =
rcutorture_oom_notify+0x1a/0xc0
>> [  114.418270] CPU: 0 PID: 629 Comm: trinity-c0 Not tainted 4.19.0-rc1-0=
0192-g66d04f0 #1
>> [  114.419629] EIP: rcutorture_oom_notify+0x1a/0xc0
>> [  114.420339] Code: 04 00 eb 86 8d b6 00 00 00 00 8d bf 00 00 00 00 3e =
8d 74 26 00 55 89 e5 53 68 a8 2b 57 c8 68 0c a4 8a c8 89 cb e8 46 eb f9 ff =
<0f> 0b e8 8f e3 ff ff a1 80 e9 9f c8 8b 15 c4 2c d6 c8 83 c0 01 d1
>> [  114.422548] EAX: 00000047 EBX: c77ffc50 ECX: 00000001 EDX: c78b4a71
>> [  114.423420] ESI: ffffffff EDI: 00000000 EBP: c77ffc08 ESP: c77ffbfc
>> [  114.424446] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 0001=
0292
>> [  114.425550] CR0: 80050033 CR2: 00000001 CR3: 07000000 CR4: 001406b0
>> [  114.426575] DR0: b62e9000 DR1: 00000000 DR2: 00000000 DR3: 00000000
>> [  114.427661] DR6: ffff0ff0 DR7: 00000600
>> [  114.428344] Call Trace:
>> [  114.428792]  notifier_call_chain+0x4e/0x70
>> [  114.429504]  blocking_notifier_call_chain+0x3b/0x50
>> [  114.430353]  out_of_memory+0xef/0x330
>> [  114.431005]  __alloc_pages_nodemask+0xd94/0xe30
>> [  114.431797]  shmem_alloc_and_acct_page+0x63/0x1c0
>> [  114.432667]  ? __radix_tree_insert+0x2e/0x1b0
>> [  114.433200]  ? radix_tree_lookup_slot+0x11/0x20
>> [  114.433945]  ? find_get_entry+0x29/0x170
>> [  114.434383]  ? find_lock_entry+0x1b/0xc0
>> [  114.434845]  shmem_getpage_gfp+0xc4/0x8f0
>> [  114.435365]  ? perf_log_itrace_start+0x100/0x100
>> [  114.435899]  ? perf_iterate_sb+0x11d/0x1b0
>> [  114.436353]  ? trace_hardirqs_on+0x30/0xf0
>> [  114.436832]  ? finish_task_switch+0x67/0x200
>> [  114.437305]  ? _raw_spin_unlock_irq+0x12/0x30
>> [  114.437811]  ? finish_task_switch+0x67/0x200
>> [  114.438286]  ? __schedule+0x1a4/0x5b0
>> [  114.438721]  ? __might_sleep+0x33/0x80
>> [  114.439141]  shmem_fallocate+0x374/0x530
>> [  114.439598]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
>> [  114.440156]  ? perf_syscall_enter+0x140/0x140
>> [  114.440977]  vfs_fallocate+0x13c/0x2b0
>> [  114.441589]  ? trace_hardirqs_on+0x30/0xf0
>> [  114.442054]  ? vfs_fallocate+0x13c/0x2b0
>> [  114.442505]  ksys_fallocate+0x30/0x60
>> [  114.442925]  sys_fallocate+0x1f/0x30
>> [  114.443325]  do_fast_syscall_32+0x8e/0x1d0
>> [  114.443802]  entry_SYSENTER_32+0x7e/0xe4
>> [  114.444239] EIP: 0xb7fd3cf9
>> [  114.444570] Code: 08 8b 80 5c cd ff ff 85 d2 74 02 89 02 5d c3 8b 04 =
24 c3 8b 0c 24 c3 8b 1c 24 c3 8b 3c 24 c3 90 90 51 52 55 89 e5 0f 34 cd 80 =
<5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
>> [  114.446636] EAX: ffffffda EBX: 00000009 ECX: 00000000 EDX: 00000004
>> [  114.447329] ESI: 00000001 EDI: 00000010 EBP: 0000006a ESP: bfeff9dc
>> [  114.448039] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 0000=
0292
>> [  114.448807] ---[ end trace a7e89623cc33e42f ]---
>> [  114.449343] rcu_torture_fwd_cb_hist: Callback-invocation histogram (d=
uration 11415 jiffies): 1s: 0
>>
>>                                                            # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start 43f06bc962a8438c9fc1966548cb6ffa4322582f 0238df646e6224=
016a45505d2c111a24669ebe21 --
>> git bisect  bad 8f2076f9fc41f9e33e9dcd16f91f8e6d5095f050  # 03:07  B    =
  0     1   15   0  Merge 'kraxel/drm-edid-stdvga' into devel-hourly-201810=
0922
>> git bisect  bad a77f2afdda972ef3ec1496e37973dd1fdde1f0a9  # 03:21  B    =
  1     4    0   0  Merge 'hverkuil-media/for-v4.20f' into devel-hourly-201=
8100922
>> git bisect good f5e5a065466c52fb8d970c2191231f0b3e6778d7  # 03:42  G    =
 28     0    9   9  Merge 'linux-review/Malathi-Gottam/media-venus-add-supp=
ort-for-USERPTR-to-queue/20181009-212742' into devel-hourly-2018100922
>> git bisect  bad 50b657a1c0a7804418581568525fe5c5cd354176  # 03:57  B    =
  0     2   16   0  Merge 'linux-review/Rodrigo-Siqueira/drm-drm_vblank-Cha=
nge-EINVAL-by-the-correct-errno/20181009-062450' into devel-hourly-20181009=
22
>> git bisect good f319227fb9ae47fad230ea4c03c572bb03dcd4c0  # 04:14  G    =
 28     0    3   3  Merge 'xlnx/zynqmp/soc' into devel-hourly-2018100922
>> git bisect  bad ba7f143440550afc53f7a6d7163b82a486834d5b  # 04:26  B    =
  2     6    0   0  Merge 'hch-misc/fore200e-cleanup' into devel-hourly-201=
8100922
>> git bisect good e717c1d2df6082b6b02157707cd723ed0a513984  # 04:45  G    =
 28     0    9   9  Merge 'linux-review/Joel-Fernandes-Google/docs-rcu-Make=
-reader-aware-of-rcu_dereference_protected/20181009-122649' into devel-hour=
ly-2018100922
>> git bisect good eddf9dff5852bf434f856ce22a795b6a8b2000d0  # 05:00  G    =
 28     0   10  10  Merge 'linux-review/kvm-owner-vger-kernel-org/KVM-remov=
e-the-writable-page-for-read-fault-case-in-hva_to_pfn_slow/20181009-050131'=
 into devel-hourly-2018100922
>> git bisect  bad e66c6b04e7d4772812f8144334dc497fea790293  # 05:12  B    =
  0     1   15   0  Merge 'rcu/dev.2018.10.06a' into devel-hourly-2018100922
>> git bisect good 4e3df4af486b7dba19d7d8d32a72d48927a401bc  # 05:31  G    =
 27     0   12  12  rcutorture: Dump grace-period diagnostics upon forward-=
progress OOM
>> git bisect  bad 6525ccad581ef57ae19f4d2ab99930a4077c683f  # 05:44  B    =
  0     2    0   0  scsi: Replace spin_is_locked() with lockdep
>> git bisect good 9dc4ef685b2750095261b6b3106313be39caad95  # 06:13  G    =
 28     0    7   7  rcutorture: Print time since GP end upon forward-progre=
ss failure
>> git bisect  bad 0e3ec087dc3fe605166feda3f20a8bef18f91e07  # 06:30  B    =
  0     2   16   0  hv_balloon: Replace spin_is_locked() with lockdep
>> git bisect  bad 66d04f05ae273302dc7269897d8a5d71583d3d2b  # 06:46  B    =
  0     2   16   0  rcutorture: Recover from OOM during forward-progress te=
sts
>> git bisect good 7d173f648b525fd78b91977cae650b59187a9a6b  # 06:58  G    =
 28     0    9   9  rcutorture: Print forward-progress test age upon failure
>> # first bad commit: [66d04f05ae273302dc7269897d8a5d71583d3d2b] rcutortur=
e: Recover from OOM during forward-progress tests
>> git bisect good 7d173f648b525fd78b91977cae650b59187a9a6b  # 07:04  G    =
 82     0   23  32  rcutorture: Print forward-progress test age upon failure
>> # extra tests with debug options
>> git bisect  bad 66d04f05ae273302dc7269897d8a5d71583d3d2b  # 07:26  B    =
  0     2   16   0  rcutorture: Recover from OOM during forward-progress te=
sts
>> # extra tests on HEAD of linux-devel/devel-hourly-2018100922
>> git bisect  bad 43f06bc962a8438c9fc1966548cb6ffa4322582f  # 07:26  B    =
 10     3    0   0  0day head guard for 'devel-hourly-2018100922'
>> # extra tests on tree/branch rcu/dev
>> git bisect  bad beb068b311ad84ca262afe8e7757f2c0eb1f2b6e  # 07:46  B    =
  0     2   16   0  rcu: Adjust the comment of function rcu_is_watching
>> # extra tests with first bad commit reverted
>> git bisect good 61ee5a094fd28bd0d3fee2e0790892f2d29d6f0c  # 08:02  G    =
 28     0    9   9  Revert "rcutorture: Recover from OOM during forward-pro=
gress tests"
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation
>
>
>> #!/bin/bash
>>
>> kernel=3D$1
>> initrd=3Dyocto-trinity-i386.cgz
>>
>> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/=
master/yocto/$initrd
>>
>> kvm=3D(
>> 	qemu-system-x86_64
>> 	-enable-kvm
>> 	-cpu Haswell,+smep,+smap
>> 	-kernel $kernel
>> 	-initrd $initrd
>> 	-m 256
>> 	-smp 1
>> 	-device e1000,netdev=3Dnet0
>> 	-netdev user,id=3Dnet0
>> 	-boot order=3Dnc
>> 	-no-reboot
>> 	-watchdog i6300esb
>> 	-watchdog-action debug
>> 	-rtc base=3Dlocaltime
>> 	-serial stdio
>> 	-display none
>> 	-monitor null
>> )
>>
>> append=3D(
>> 	root=3D/dev/ram0
>> 	hung_task_panic=3D1
>> 	debug
>> 	apic=3Ddebug
>> 	sysrq_always_enabled
>> 	rcupdate.rcu_cpu_stall_timeout=3D100
>> 	net.ifnames=3D0
>> 	printk.devkmsg=3Don
>> 	panic=3D-1
>> 	softlockup_panic=3D1
>> 	nmi_watchdog=3Dpanic
>> 	oops=3Dpanic
>> 	load_ramdisk=3D2
>> 	prompt_ramdisk=3D0
>> 	drbd.minor_count=3D8
>> 	systemd.log_level=3Derr
>> 	ignore_loglevel
>> 	console=3Dtty0
>> 	earlyprintk=3DttyS0,115200
>> 	console=3DttyS0,115200
>> 	vga=3Dnormal
>> 	rw
>> 	drbd.minor_count=3D8
>> 	rcuperf.shutdown=3D0
>> )
>>
>> "${kvm[@]}" -append "${append[*]}"
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/i386 4.19.0-rc1 Kernel Configuration
>> #
>>
>> #
>> # Compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
>> #
>> CONFIG_CC_IS_GCC=3Dy
>> CONFIG_GCC_VERSION=3D70300
>> CONFIG_CLANG_VERSION=3D0
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
>> # CONFIG_KERNEL_XZ is not set
>> CONFIG_KERNEL_LZO=3Dy
>> # CONFIG_KERNEL_LZ4 is not set
>> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>> # CONFIG_SYSVIPC is not set
>> # CONFIG_POSIX_MQUEUE is not set
>> CONFIG_CROSS_MEMORY_ATTACH=3Dy
>> CONFIG_USELIB=3Dy
>> # CONFIG_AUDIT is not set
>> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
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
>> CONFIG_IRQ_SIM=3Dy
>> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>> CONFIG_GENERIC_MSI_IRQ=3Dy
>> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
>> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
>> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
>> CONFIG_IRQ_FORCED_THREADING=3Dy
>> CONFIG_SPARSE_IRQ=3Dy
>> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
>> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
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
>> CONFIG_HZ_PERIODIC=3Dy
>> # CONFIG_NO_HZ_IDLE is not set
>> # CONFIG_NO_HZ is not set
>> # CONFIG_HIGH_RES_TIMERS is not set
>> CONFIG_PREEMPT_NONE=3Dy
>> # CONFIG_PREEMPT_VOLUNTARY is not set
>> # CONFIG_PREEMPT is not set
>> CONFIG_PREEMPT_COUNT=3Dy
>>
>> #
>> # CPU/Task time and stats accounting
>> #
>> CONFIG_TICK_CPU_ACCOUNTING=3Dy
>> # CONFIG_IRQ_TIME_ACCOUNTING is not set
>> # CONFIG_BSD_PROCESS_ACCT is not set
>> # CONFIG_TASKSTATS is not set
>> CONFIG_CPU_ISOLATION=3Dy
>>
>> #
>> # RCU Subsystem
>> #
>> CONFIG_TREE_RCU=3Dy
>> CONFIG_RCU_EXPERT=3Dy
>> CONFIG_SRCU=3Dy
>> CONFIG_TREE_SRCU=3Dy
>> CONFIG_TASKS_RCU=3Dy
>> CONFIG_RCU_STALL_COMMON=3Dy
>> CONFIG_RCU_NEED_SEGCBLIST=3Dy
>> CONFIG_RCU_FANOUT=3D32
>> CONFIG_RCU_FANOUT_LEAF=3D16
>> # CONFIG_RCU_NOCB_CPU is not set
>> CONFIG_BUILD_BIN2C=3Dy
>> CONFIG_IKCONFIG=3Dy
>> CONFIG_IKCONFIG_PROC=3Dy
>> CONFIG_LOG_BUF_SHIFT=3D20
>> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
>> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>> CONFIG_CGROUPS=3Dy
>> # CONFIG_MEMCG is not set
>> CONFIG_CGROUP_SCHED=3Dy
>> CONFIG_FAIR_GROUP_SCHED=3Dy
>> # CONFIG_CFS_BANDWIDTH is not set
>> CONFIG_RT_GROUP_SCHED=3Dy
>> # CONFIG_CGROUP_PIDS is not set
>> CONFIG_CGROUP_RDMA=3Dy
>> # CONFIG_CGROUP_FREEZER is not set
>> CONFIG_CPUSETS=3Dy
>> # CONFIG_PROC_PID_CPUSET is not set
>> # CONFIG_CGROUP_DEVICE is not set
>> # CONFIG_CGROUP_CPUACCT is not set
>> CONFIG_CGROUP_PERF=3Dy
>> # CONFIG_CGROUP_BPF is not set
>> # CONFIG_CGROUP_DEBUG is not set
>> # CONFIG_NAMESPACES is not set
>> # CONFIG_CHECKPOINT_RESTORE is not set
>> CONFIG_SCHED_AUTOGROUP=3Dy
>> # CONFIG_SYSFS_DEPRECATED is not set
>> CONFIG_RELAY=3Dy
>> CONFIG_BLK_DEV_INITRD=3Dy
>> CONFIG_INITRAMFS_SOURCE=3D""
>> CONFIG_RD_GZIP=3Dy
>> CONFIG_RD_BZIP2=3Dy
>> CONFIG_RD_LZMA=3Dy
>> CONFIG_RD_XZ=3Dy
>> CONFIG_RD_LZO=3Dy
>> CONFIG_RD_LZ4=3Dy
>> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
>> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>> CONFIG_SYSCTL=3Dy
>> CONFIG_ANON_INODES=3Dy
>> CONFIG_HAVE_UID16=3Dy
>> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>> CONFIG_BPF=3Dy
>> CONFIG_EXPERT=3Dy
>> CONFIG_UID16=3Dy
>> CONFIG_MULTIUSER=3Dy
>> CONFIG_SGETMASK_SYSCALL=3Dy
>> # CONFIG_SYSFS_SYSCALL is not set
>> # CONFIG_SYSCTL_SYSCALL is not set
>> CONFIG_FHANDLE=3Dy
>> CONFIG_POSIX_TIMERS=3Dy
>> CONFIG_PRINTK=3Dy
>> CONFIG_PRINTK_NMI=3Dy
>> CONFIG_BUG=3Dy
>> CONFIG_ELF_CORE=3Dy
>> # CONFIG_PCSPKR_PLATFORM is not set
>> # CONFIG_BASE_FULL is not set
>> CONFIG_FUTEX=3Dy
>> CONFIG_FUTEX_PI=3Dy
>> CONFIG_EPOLL=3Dy
>> CONFIG_SIGNALFD=3Dy
>> CONFIG_TIMERFD=3Dy
>> # CONFIG_EVENTFD is not set
>> CONFIG_SHMEM=3Dy
>> CONFIG_AIO=3Dy
>> # CONFIG_ADVISE_SYSCALLS is not set
>> CONFIG_MEMBARRIER=3Dy
>> CONFIG_KALLSYMS=3Dy
>> # CONFIG_KALLSYMS_ALL is not set
>> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>> CONFIG_BPF_SYSCALL=3Dy
>> # CONFIG_USERFAULTFD is not set
>> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
>> CONFIG_RSEQ=3Dy
>> # CONFIG_DEBUG_RSEQ is not set
>> # CONFIG_EMBEDDED is not set
>> CONFIG_HAVE_PERF_EVENTS=3Dy
>> CONFIG_PERF_USE_VMALLOC=3Dy
>> # CONFIG_PC104 is not set
>>
>> #
>> # Kernel Performance Events And Counters
>> #
>> CONFIG_PERF_EVENTS=3Dy
>> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
>> CONFIG_VM_EVENT_COUNTERS=3Dy
>> CONFIG_COMPAT_BRK=3Dy
>> # CONFIG_SLAB is not set
>> # CONFIG_SLUB is not set
>> CONFIG_SLOB=3Dy
>> # CONFIG_SLAB_MERGE_DEFAULT is not set
>> # CONFIG_PROFILING is not set
>> CONFIG_TRACEPOINTS=3Dy
>> CONFIG_X86_32=3Dy
>> CONFIG_X86=3Dy
>> CONFIG_INSTRUCTION_DECODER=3Dy
>> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
>> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
>> CONFIG_LOCKDEP_SUPPORT=3Dy
>> CONFIG_STACKTRACE_SUPPORT=3Dy
>> CONFIG_MMU=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
>> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>> CONFIG_GENERIC_ISA_DMA=3Dy
>> CONFIG_GENERIC_BUG=3Dy
>> CONFIG_GENERIC_HWEIGHT=3Dy
>> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
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
>> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
>> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>> CONFIG_X86_32_SMP=3Dy
>> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>> CONFIG_FIX_EARLYCON_MEM=3Dy
>> CONFIG_PGTABLE_LEVELS=3D3
>> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
>>
>> #
>> # Processor type and features
>> #
>> # CONFIG_ZONE_DMA is not set
>> CONFIG_SMP=3Dy
>> CONFIG_X86_FEATURE_NAMES=3Dy
>> # CONFIG_X86_MPPARSE is not set
>> CONFIG_GOLDFISH=3Dy
>> # CONFIG_RETPOLINE is not set
>> CONFIG_INTEL_RDT=3Dy
>> CONFIG_X86_BIGSMP=3Dy
>> # CONFIG_X86_EXTENDED_PLATFORM is not set
>> # CONFIG_X86_INTEL_LPSS is not set
>> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
>> CONFIG_IOSF_MBI=3Dy
>> CONFIG_IOSF_MBI_DEBUG=3Dy
>> # CONFIG_X86_32_IRIS is not set
>> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>> CONFIG_HYPERVISOR_GUEST=3Dy
>> CONFIG_PARAVIRT=3Dy
>> # CONFIG_PARAVIRT_DEBUG is not set
>> CONFIG_PARAVIRT_SPINLOCKS=3Dy
>> # CONFIG_QUEUED_LOCK_STAT is not set
>> CONFIG_XEN=3Dy
>> CONFIG_XEN_PV=3Dy
>> CONFIG_XEN_PV_SMP=3Dy
>> CONFIG_XEN_DOM0=3Dy
>> # CONFIG_XEN_PVHVM is not set
>> CONFIG_XEN_SAVE_RESTORE=3Dy
>> # CONFIG_XEN_DEBUG_FS is not set
>> CONFIG_KVM_GUEST=3Dy
>> CONFIG_KVM_DEBUG_FS=3Dy
>> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>> CONFIG_PARAVIRT_CLOCK=3Dy
>> CONFIG_NO_BOOTMEM=3Dy
>> # CONFIG_M486 is not set
>> # CONFIG_M586 is not set
>> # CONFIG_M586TSC is not set
>> # CONFIG_M586MMX is not set
>> # CONFIG_M686 is not set
>> # CONFIG_MPENTIUMII is not set
>> # CONFIG_MPENTIUMIII is not set
>> CONFIG_MPENTIUMM=3Dy
>> # CONFIG_MPENTIUM4 is not set
>> # CONFIG_MK6 is not set
>> # CONFIG_MK7 is not set
>> # CONFIG_MK8 is not set
>> # CONFIG_MCRUSOE is not set
>> # CONFIG_MEFFICEON is not set
>> # CONFIG_MWINCHIPC6 is not set
>> # CONFIG_MWINCHIP3D is not set
>> # CONFIG_MELAN is not set
>> # CONFIG_MGEODEGX1 is not set
>> # CONFIG_MGEODE_LX is not set
>> # CONFIG_MCYRIXIII is not set
>> # CONFIG_MVIAC3_2 is not set
>> # CONFIG_MVIAC7 is not set
>> # CONFIG_MCORE2 is not set
>> # CONFIG_MATOM is not set
>> CONFIG_X86_GENERIC=3Dy
>> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
>> CONFIG_X86_L1_CACHE_SHIFT=3D6
>> CONFIG_X86_INTEL_USERCOPY=3Dy
>> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
>> CONFIG_X86_TSC=3Dy
>> CONFIG_X86_CMPXCHG64=3Dy
>> CONFIG_X86_CMOV=3Dy
>> CONFIG_X86_MINIMUM_CPU_FAMILY=3D6
>> CONFIG_X86_DEBUGCTLMSR=3Dy
>> # CONFIG_PROCESSOR_SELECT is not set
>> CONFIG_CPU_SUP_INTEL=3Dy
>> CONFIG_CPU_SUP_CYRIX_32=3Dy
>> CONFIG_CPU_SUP_AMD=3Dy
>> CONFIG_CPU_SUP_CENTAUR=3Dy
>> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
>> CONFIG_CPU_SUP_UMC_32=3Dy
>> CONFIG_HPET_TIMER=3Dy
>> CONFIG_HPET_EMULATE_RTC=3Dy
>> # CONFIG_DMI is not set
>> CONFIG_NR_CPUS_RANGE_BEGIN=3D2
>> CONFIG_NR_CPUS_RANGE_END=3D64
>> CONFIG_NR_CPUS_DEFAULT=3D32
>> CONFIG_NR_CPUS=3D32
>> # CONFIG_SCHED_SMT is not set
>> # CONFIG_SCHED_MC is not set
>> CONFIG_X86_LOCAL_APIC=3Dy
>> CONFIG_X86_IO_APIC=3Dy
>> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
>> # CONFIG_X86_MCE is not set
>>
>> #
>> # Performance monitoring
>> #
>> # CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
>> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
>> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
>> # CONFIG_PERF_EVENTS_AMD_POWER is not set
>> # CONFIG_X86_LEGACY_VM86 is not set
>> # CONFIG_X86_16BIT is not set
>> CONFIG_TOSHIBA=3Dy
>> # CONFIG_I8K is not set
>> CONFIG_X86_REBOOTFIXUPS=3Dy
>> CONFIG_MICROCODE=3Dy
>> CONFIG_MICROCODE_INTEL=3Dy
>> # CONFIG_MICROCODE_AMD is not set
>> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
>> CONFIG_X86_MSR=3Dy
>> # CONFIG_X86_CPUID is not set
>> # CONFIG_NOHIGHMEM is not set
>> # CONFIG_HIGHMEM4G is not set
>> CONFIG_HIGHMEM64G=3Dy
>> CONFIG_VMSPLIT_3G=3Dy
>> # CONFIG_VMSPLIT_2G is not set
>> # CONFIG_VMSPLIT_1G is not set
>> CONFIG_PAGE_OFFSET=3D0xC0000000
>> CONFIG_HIGHMEM=3Dy
>> CONFIG_X86_PAE=3Dy
>> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
>> # CONFIG_NUMA is not set
>> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
>> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_ILLEGAL_POINTER_VALUE=3D0
>> CONFIG_HIGHPTE=3Dy
>> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
>> CONFIG_X86_RESERVE_LOW=3D64
>> CONFIG_MATH_EMULATION=3Dy
>> # CONFIG_MTRR is not set
>> # CONFIG_ARCH_RANDOM is not set
>> # CONFIG_X86_SMAP is not set
>> CONFIG_X86_INTEL_UMIP=3Dy
>> # CONFIG_EFI is not set
>> # CONFIG_SECCOMP is not set
>> # CONFIG_HZ_100 is not set
>> CONFIG_HZ_250=3Dy
>> # CONFIG_HZ_300 is not set
>> # CONFIG_HZ_1000 is not set
>> CONFIG_HZ=3D250
>> # CONFIG_KEXEC is not set
>> # CONFIG_CRASH_DUMP is not set
>> CONFIG_PHYSICAL_START=3D0x1000000
>> CONFIG_RELOCATABLE=3Dy
>> CONFIG_RANDOMIZE_BASE=3Dy
>> CONFIG_X86_NEED_RELOCS=3Dy
>> CONFIG_PHYSICAL_ALIGN=3D0x200000
>> CONFIG_HOTPLUG_CPU=3Dy
>> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
>> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
>> # CONFIG_COMPAT_VDSO is not set
>> # CONFIG_CMDLINE_BOOL is not set
>> CONFIG_MODIFY_LDT_SYSCALL=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
>> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
>>
>> #
>> # Power management and ACPI options
>> #
>> CONFIG_SUSPEND=3Dy
>> CONFIG_SUSPEND_FREEZER=3Dy
>> # CONFIG_SUSPEND_SKIP_SYNC is not set
>> CONFIG_HIBERNATE_CALLBACKS=3Dy
>> CONFIG_PM_SLEEP=3Dy
>> CONFIG_PM_SLEEP_SMP=3Dy
>> # CONFIG_PM_AUTOSLEEP is not set
>> # CONFIG_PM_WAKELOCKS is not set
>> CONFIG_PM=3Dy
>> CONFIG_PM_DEBUG=3Dy
>> CONFIG_PM_ADVANCED_DEBUG=3Dy
>> # CONFIG_PM_TEST_SUSPEND is not set
>> CONFIG_PM_SLEEP_DEBUG=3Dy
>> # CONFIG_DPM_WATCHDOG is not set
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
>> CONFIG_ACPI_SLEEP=3Dy
>> # CONFIG_ACPI_PROCFS_POWER is not set
>> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>> # CONFIG_ACPI_EC_DEBUGFS is not set
>> CONFIG_ACPI_AC=3Dy
>> CONFIG_ACPI_BATTERY=3Dy
>> CONFIG_ACPI_BUTTON=3Dy
>> CONFIG_ACPI_VIDEO=3Dy
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
>> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
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
>> CONFIG_HAVE_ACPI_APEI=3Dy
>> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>> # CONFIG_ACPI_APEI is not set
>> # CONFIG_DPTF_POWER is not set
>> # CONFIG_PMIC_OPREGION is not set
>> # CONFIG_ACPI_CONFIGFS is not set
>> CONFIG_X86_PM_TIMER=3Dy
>> CONFIG_SFI=3Dy
>> CONFIG_X86_APM_BOOT=3Dy
>> CONFIG_APM=3Dy
>> CONFIG_APM_IGNORE_USER_SUSPEND=3Dy
>> # CONFIG_APM_DO_ENABLE is not set
>> # CONFIG_APM_CPU_IDLE is not set
>> CONFIG_APM_DISPLAY_BLANK=3Dy
>> # CONFIG_APM_ALLOW_INTS is not set
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
>> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
>> # CONFIG_CPU_IDLE_GOV_MENU is not set
>> # CONFIG_INTEL_IDLE is not set
>>
>> #
>> # Bus options (PCI etc.)
>> #
>> CONFIG_PCI=3Dy
>> # CONFIG_PCI_GOBIOS is not set
>> CONFIG_PCI_GOMMCONFIG=3Dy
>> # CONFIG_PCI_GODIRECT is not set
>> # CONFIG_PCI_GOANY is not set
>> CONFIG_PCI_DIRECT=3Dy
>> CONFIG_PCI_MMCONFIG=3Dy
>> CONFIG_PCI_XEN=3Dy
>> CONFIG_PCI_DOMAINS=3Dy
>> CONFIG_PCI_CNB20LE_QUIRK=3Dy
>> # CONFIG_PCIEPORTBUS is not set
>> CONFIG_PCI_MSI=3Dy
>> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
>> CONFIG_PCI_QUIRKS=3Dy
>> # CONFIG_PCI_DEBUG is not set
>> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
>> # CONFIG_PCI_STUB is not set
>> # CONFIG_PCI_PF_STUB is not set
>> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
>> CONFIG_PCI_ATS=3Dy
>> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
>> CONFIG_PCI_IOV=3Dy
>> CONFIG_PCI_PRI=3Dy
>> CONFIG_PCI_PASID=3Dy
>> CONFIG_PCI_LABEL=3Dy
>> CONFIG_HOTPLUG_PCI=3Dy
>> # CONFIG_HOTPLUG_PCI_ACPI is not set
>> # CONFIG_HOTPLUG_PCI_CPCI is not set
>> # CONFIG_HOTPLUG_PCI_SHPC is not set
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
>> CONFIG_PCIE_DW=3Dy
>> CONFIG_PCIE_DW_EP=3Dy
>> CONFIG_PCIE_DW_PLAT=3Dy
>> # CONFIG_PCIE_DW_PLAT_HOST is not set
>> CONFIG_PCIE_DW_PLAT_EP=3Dy
>>
>> #
>> # PCI Endpoint
>> #
>> CONFIG_PCI_ENDPOINT=3Dy
>> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
>> CONFIG_PCI_EPF_TEST=3Dy
>>
>> #
>> # PCI switch controller drivers
>> #
>> CONFIG_PCI_SW_SWITCHTEC=3Dy
>> CONFIG_ISA_BUS=3Dy
>> CONFIG_ISA_DMA_API=3Dy
>> CONFIG_ISA=3Dy
>> CONFIG_EISA=3Dy
>> # CONFIG_EISA_VLB_PRIMING is not set
>> # CONFIG_EISA_PCI_EISA is not set
>> # CONFIG_EISA_VIRTUAL_ROOT is not set
>> # CONFIG_EISA_NAMES is not set
>> # CONFIG_SCx200 is not set
>> # CONFIG_ALIX is not set
>> # CONFIG_NET5501 is not set
>> CONFIG_AMD_NB=3Dy
>> CONFIG_PCCARD=3Dy
>> CONFIG_PCMCIA=3Dy
>> CONFIG_PCMCIA_LOAD_CIS=3Dy
>> CONFIG_CARDBUS=3Dy
>>
>> #
>> # PC-card bridges
>> #
>> CONFIG_YENTA=3Dy
>> # CONFIG_YENTA_O2 is not set
>> CONFIG_YENTA_RICOH=3Dy
>> CONFIG_YENTA_TI=3Dy
>> CONFIG_YENTA_ENE_TUNE=3Dy
>> CONFIG_YENTA_TOSHIBA=3Dy
>> # CONFIG_PD6729 is not set
>> # CONFIG_I82092 is not set
>> CONFIG_I82365=3Dy
>> CONFIG_TCIC=3Dy
>> CONFIG_PCMCIA_PROBE=3Dy
>> CONFIG_PCCARD_NONSTATIC=3Dy
>> CONFIG_RAPIDIO=3Dy
>> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
>> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
>> CONFIG_RAPIDIO_DMA_ENGINE=3Dy
>> CONFIG_RAPIDIO_DEBUG=3Dy
>> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
>> CONFIG_RAPIDIO_CHMAN=3Dy
>> # CONFIG_RAPIDIO_MPORT_CDEV is not set
>>
>> #
>> # RapidIO Switch drivers
>> #
>> CONFIG_RAPIDIO_TSI57X=3Dy
>> CONFIG_RAPIDIO_CPS_XX=3Dy
>> CONFIG_RAPIDIO_TSI568=3Dy
>> # CONFIG_RAPIDIO_CPS_GEN2 is not set
>> CONFIG_RAPIDIO_RXS_GEN3=3Dy
>> CONFIG_X86_SYSFB=3Dy
>>
>> #
>> # Binary Emulations
>> #
>> CONFIG_COMPAT_32=3Dy
>> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
>> CONFIG_HAVE_GENERIC_GUP=3Dy
>>
>> #
>> # Firmware Drivers
>> #
>> CONFIG_EDD=3Dy
>> CONFIG_EDD_OFF=3Dy
>> # CONFIG_FIRMWARE_MEMMAP is not set
>> # CONFIG_DELL_RBU is not set
>> CONFIG_DCDBAS=3Dy
>> # CONFIG_ISCSI_IBFT_FIND is not set
>> # CONFIG_FW_CFG_SYSFS is not set
>> # CONFIG_GOOGLE_FIRMWARE is not set
>>
>> #
>> # Tegra firmware driver
>> #
>> CONFIG_HAVE_KVM=3Dy
>> # CONFIG_VIRTUALIZATION is not set
>>
>> #
>> # General architecture-dependent options
>> #
>> CONFIG_HOTPLUG_SMT=3Dy
>> CONFIG_HAVE_OPROFILE=3Dy
>> CONFIG_OPROFILE_NMI_TIMER=3Dy
>> CONFIG_JUMP_LABEL=3Dy
>> # CONFIG_STATIC_KEYS_SELFTEST is not set
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
>> CONFIG_HAVE_CLK=3Dy
>> CONFIG_HAVE_HW_BREAKPOINT=3Dy
>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HAVE_PERF_REGS=3Dy
>> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
>> CONFIG_HAVE_RCU_TABLE_INVALIDATE=3Dy
>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>> CONFIG_HAVE_STACKPROTECTOR=3Dy
>> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
>> CONFIG_STACKPROTECTOR=3Dy
>> # CONFIG_STACKPROTECTOR_STRONG is not set
>> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
>> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
>> CONFIG_MODULES_USE_ELF_REL=3Dy
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>> CONFIG_HAVE_EXIT_THREAD=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS=3D8
>> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>> CONFIG_ISA_BUS_API=3Dy
>> CONFIG_CLONE_BACKWARDS=3Dy
>> CONFIG_OLD_SIGSUSPEND3=3Dy
>> CONFIG_OLD_SIGACTION=3Dy
>> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
>> CONFIG_STRICT_KERNEL_RWX=3Dy
>> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
>> CONFIG_ARCH_HAS_REFCOUNT=3Dy
>> CONFIG_REFCOUNT_FULL=3Dy
>> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
>>
>> #
>> # GCOV-based kernel profiling
>> #
>> # CONFIG_GCOV_KERNEL is not set
>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>> CONFIG_PLUGIN_HOSTCC=3D"g++"
>> CONFIG_HAVE_GCC_PLUGINS=3Dy
>> # CONFIG_GCC_PLUGINS is not set
>> CONFIG_RT_MUTEXES=3Dy
>> CONFIG_BASE_SMALL=3D1
>> # CONFIG_MODULES is not set
>> CONFIG_MODULES_TREE_LOOKUP=3Dy
>> # CONFIG_BLOCK is not set
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
>> CONFIG_FREEZER=3Dy
>>
>> #
>> # Executable file formats
>> #
>> CONFIG_BINFMT_ELF=3Dy
>> CONFIG_ELFCORE=3Dy
>> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
>> CONFIG_BINFMT_SCRIPT=3Dy
>> CONFIG_HAVE_AOUT=3Dy
>> CONFIG_BINFMT_AOUT=3Dy
>> CONFIG_BINFMT_MISC=3Dy
>> CONFIG_COREDUMP=3Dy
>>
>> #
>> # Memory Management options
>> #
>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>> # CONFIG_FLATMEM_MANUAL is not set
>> CONFIG_SPARSEMEM_MANUAL=3Dy
>> CONFIG_SPARSEMEM=3Dy
>> CONFIG_HAVE_MEMORY_PRESENT=3Dy
>> CONFIG_SPARSEMEM_STATIC=3Dy
>> CONFIG_HAVE_MEMBLOCK=3Dy
>> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>> CONFIG_MEMORY_HOTPLUG=3Dy
>> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
>> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
>> # CONFIG_MEMORY_HOTREMOVE is not set
>> CONFIG_SPLIT_PTLOCK_CPUS=3D4
>> CONFIG_COMPACTION=3Dy
>> CONFIG_MIGRATION=3Dy
>> CONFIG_PHYS_ADDR_T_64BIT=3Dy
>> CONFIG_VIRT_TO_BUS=3Dy
>> CONFIG_MMU_NOTIFIER=3Dy
>> # CONFIG_KSM is not set
>> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
>> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
>> CONFIG_CLEANCACHE=3Dy
>> # CONFIG_CMA is not set
>> CONFIG_ZPOOL=3Dy
>> CONFIG_ZBUD=3Dy
>> # CONFIG_Z3FOLD is not set
>> # CONFIG_ZSMALLOC is not set
>> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
>> CONFIG_IDLE_PAGE_TRACKING=3Dy
>> # CONFIG_PERCPU_STATS is not set
>> CONFIG_GUP_BENCHMARK=3Dy
>> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
>> CONFIG_NET=3Dy
>>
>> #
>> # Networking options
>> #
>> # CONFIG_PACKET is not set
>> CONFIG_UNIX=3Dy
>> # CONFIG_UNIX_DIAG is not set
>> # CONFIG_TLS is not set
>> CONFIG_XFRM=3Dy
>> # CONFIG_XFRM_USER is not set
>> # CONFIG_XFRM_INTERFACE is not set
>> # CONFIG_XFRM_SUB_POLICY is not set
>> # CONFIG_XFRM_MIGRATE is not set
>> # CONFIG_XFRM_STATISTICS is not set
>> # CONFIG_NET_KEY is not set
>> # CONFIG_XDP_SOCKETS is not set
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
>> # CONFIG_NETWORK_SECMARK is not set
>> CONFIG_NET_PTP_CLASSIFY=3Dy
>> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
>> # CONFIG_NETFILTER is not set
>> # CONFIG_BPFILTER is not set
>> # CONFIG_IP_DCCP is not set
>> # CONFIG_IP_SCTP is not set
>> # CONFIG_RDS is not set
>> # CONFIG_TIPC is not set
>> # CONFIG_ATM is not set
>> # CONFIG_L2TP is not set
>> # CONFIG_BRIDGE is not set
>> CONFIG_HAVE_NET_DSA=3Dy
>> # CONFIG_NET_DSA is not set
>> # CONFIG_VLAN_8021Q is not set
>> # CONFIG_DECNET is not set
>> # CONFIG_LLC2 is not set
>> # CONFIG_ATALK is not set
>> # CONFIG_X25 is not set
>> # CONFIG_LAPB is not set
>> # CONFIG_PHONET is not set
>> # CONFIG_6LOWPAN is not set
>> # CONFIG_IEEE802154 is not set
>> # CONFIG_NET_SCHED is not set
>> # CONFIG_DCB is not set
>> CONFIG_DNS_RESOLVER=3Dy
>> # CONFIG_BATMAN_ADV is not set
>> # CONFIG_OPENVSWITCH is not set
>> # CONFIG_VSOCKETS is not set
>> # CONFIG_NETLINK_DIAG is not set
>> # CONFIG_MPLS is not set
>> # CONFIG_NET_NSH is not set
>> # CONFIG_HSR is not set
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
>> # CONFIG_BPF_STREAM_PARSER is not set
>> CONFIG_NET_FLOW_LIMIT=3Dy
>>
>> #
>> # Network testing
>> #
>> # CONFIG_NET_PKTGEN is not set
>> # CONFIG_NET_DROP_MONITOR is not set
>> # CONFIG_HAMRADIO is not set
>> # CONFIG_CAN is not set
>> # CONFIG_BT is not set
>> # CONFIG_AF_RXRPC is not set
>> # CONFIG_AF_KCM is not set
>> CONFIG_WIRELESS=3Dy
>> # CONFIG_CFG80211 is not set
>>
>> #
>> # CFG80211 needs to be enabled for MAC80211
>> #
>> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
>> # CONFIG_WIMAX is not set
>> # CONFIG_RFKILL is not set
>> CONFIG_NET_9P=3Dy
>> CONFIG_NET_9P_VIRTIO=3Dy
>> # CONFIG_NET_9P_XEN is not set
>> # CONFIG_NET_9P_DEBUG is not set
>> # CONFIG_CAIF is not set
>> # CONFIG_CEPH_LIB is not set
>> # CONFIG_NFC is not set
>> # CONFIG_PSAMPLE is not set
>> # CONFIG_NET_IFE is not set
>> # CONFIG_LWTUNNEL is not set
>> CONFIG_DST_CACHE=3Dy
>> CONFIG_GRO_CELLS=3Dy
>> # CONFIG_NET_DEVLINK is not set
>> CONFIG_MAY_USE_DEVLINK=3Dy
>> # CONFIG_FAILOVER is not set
>> CONFIG_HAVE_EBPF_JIT=3Dy
>>
>> #
>> # Device Drivers
>> #
>>
>> #
>> # Generic Driver Options
>> #
>> # CONFIG_UEVENT_HELPER is not set
>> CONFIG_DEVTMPFS=3Dy
>> # CONFIG_DEVTMPFS_MOUNT is not set
>> # CONFIG_STANDALONE is not set
>> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>>
>> #
>> # Firmware loader
>> #
>> CONFIG_FW_LOADER=3Dy
>> CONFIG_EXTRA_FIRMWARE=3D""
>> CONFIG_FW_LOADER_USER_HELPER=3Dy
>> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
>> CONFIG_WANT_DEV_COREDUMP=3Dy
>> CONFIG_ALLOW_DEV_COREDUMP=3Dy
>> CONFIG_DEV_COREDUMP=3Dy
>> # CONFIG_DEBUG_DRIVER is not set
>> CONFIG_DEBUG_DEVRES=3Dy
>> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
>> CONFIG_SYS_HYPERVISOR=3Dy
>> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
>> CONFIG_REGMAP=3Dy
>> CONFIG_REGMAP_I2C=3Dy
>> CONFIG_REGMAP_SPI=3Dy
>> CONFIG_REGMAP_SPMI=3Dy
>> CONFIG_REGMAP_W1=3Dy
>> CONFIG_REGMAP_MMIO=3Dy
>> CONFIG_REGMAP_IRQ=3Dy
>> CONFIG_DMA_SHARED_BUFFER=3Dy
>> # CONFIG_DMA_FENCE_TRACE is not set
>>
>> #
>> # Bus devices
>> #
>> # CONFIG_CONNECTOR is not set
>> CONFIG_GNSS=3Dy
>> CONFIG_GNSS_SIRF_SERIAL=3Dy
>> # CONFIG_GNSS_UBX_SERIAL is not set
>> # CONFIG_MTD is not set
>> # CONFIG_OF is not set
>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>> # CONFIG_PARPORT is not set
>> CONFIG_PNP=3Dy
>> CONFIG_PNP_DEBUG_MESSAGES=3Dy
>>
>> #
>> # Protocols
>> #
>> CONFIG_ISAPNP=3Dy
>> CONFIG_PNPBIOS=3Dy
>> # CONFIG_PNPBIOS_PROC_FS is not set
>> CONFIG_PNPACPI=3Dy
>>
>> #
>> # NVME Support
>> #
>>
>> #
>> # Misc devices
>> #
>> CONFIG_SENSORS_LIS3LV02D=3Dy
>> # CONFIG_AD525X_DPOT is not set
>> # CONFIG_DUMMY_IRQ is not set
>> # CONFIG_IBM_ASM is not set
>> CONFIG_PHANTOM=3Dy
>> # CONFIG_SGI_IOC4 is not set
>> CONFIG_TIFM_CORE=3Dy
>> # CONFIG_TIFM_7XX1 is not set
>> CONFIG_ICS932S401=3Dy
>> CONFIG_ENCLOSURE_SERVICES=3Dy
>> CONFIG_CS5535_MFGPT=3Dy
>> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
>> CONFIG_CS5535_CLOCK_EVENT_SRC=3Dy
>> # CONFIG_HP_ILO is not set
>> CONFIG_APDS9802ALS=3Dy
>> CONFIG_ISL29003=3Dy
>> # CONFIG_ISL29020 is not set
>> # CONFIG_SENSORS_TSL2550 is not set
>> # CONFIG_SENSORS_BH1770 is not set
>> CONFIG_SENSORS_APDS990X=3Dy
>> CONFIG_HMC6352=3Dy
>> CONFIG_DS1682=3Dy
>> CONFIG_VMWARE_BALLOON=3Dy
>> CONFIG_PCH_PHUB=3Dy
>> # CONFIG_USB_SWITCH_FSA9480 is not set
>> # CONFIG_LATTICE_ECP3_CONFIG is not set
>> CONFIG_SRAM=3Dy
>> CONFIG_PCI_ENDPOINT_TEST=3Dy
>> CONFIG_MISC_RTSX=3Dy
>> CONFIG_C2PORT=3Dy
>> # CONFIG_C2PORT_DURAMAR_2150 is not set
>>
>> #
>> # EEPROM support
>> #
>> CONFIG_EEPROM_AT24=3Dy
>> CONFIG_EEPROM_AT25=3Dy
>> CONFIG_EEPROM_LEGACY=3Dy
>> # CONFIG_EEPROM_MAX6875 is not set
>> # CONFIG_EEPROM_93CX6 is not set
>> # CONFIG_EEPROM_93XX46 is not set
>> # CONFIG_EEPROM_IDT_89HPESX is not set
>> CONFIG_CB710_CORE=3Dy
>> CONFIG_CB710_DEBUG=3Dy
>> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>>
>> #
>> # Texas Instruments shared transport line discipline
>> #
>> # CONFIG_TI_ST is not set
>> CONFIG_SENSORS_LIS3_I2C=3Dy
>> CONFIG_ALTERA_STAPL=3Dy
>> CONFIG_INTEL_MEI=3Dy
>> # CONFIG_INTEL_MEI_ME is not set
>> CONFIG_INTEL_MEI_TXE=3Dy
>> CONFIG_VMWARE_VMCI=3Dy
>>
>> #
>> # Intel MIC & related support
>> #
>>
>> #
>> # Intel MIC Bus Driver
>> #
>>
>> #
>> # SCIF Bus Driver
>> #
>>
>> #
>> # VOP Bus Driver
>> #
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
>> CONFIG_ECHO=3Dy
>> CONFIG_MISC_RTSX_PCI=3Dy
>> # CONFIG_MISC_RTSX_USB is not set
>> CONFIG_HAVE_IDE=3Dy
>>
>> #
>> # SCSI device support
>> #
>> CONFIG_SCSI_MOD=3Dy
>> # CONFIG_FUSION is not set
>>
>> #
>> # IEEE 1394 (FireWire) support
>> #
>> # CONFIG_FIREWIRE is not set
>> CONFIG_FIREWIRE_NOSY=3Dy
>> CONFIG_MACINTOSH_DRIVERS=3Dy
>> # CONFIG_MAC_EMUMOUSEBTN is not set
>> CONFIG_NETDEVICES=3Dy
>> CONFIG_NET_CORE=3Dy
>> # CONFIG_BONDING is not set
>> # CONFIG_DUMMY is not set
>> # CONFIG_EQUALIZER is not set
>> # CONFIG_NET_TEAM is not set
>> # CONFIG_MACVLAN is not set
>> # CONFIG_VXLAN is not set
>> # CONFIG_MACSEC is not set
>> # CONFIG_NETCONSOLE is not set
>> # CONFIG_NTB_NETDEV is not set
>> # CONFIG_RIONET is not set
>> # CONFIG_TUN is not set
>> # CONFIG_TUN_VNET_CROSS_LE is not set
>> # CONFIG_VETH is not set
>> # CONFIG_VIRTIO_NET is not set
>> # CONFIG_NLMON is not set
>> # CONFIG_ARCNET is not set
>>
>> #
>> # CAIF transport drivers
>> #
>>
>> #
>> # Distributed Switch Architecture drivers
>> #
>> CONFIG_ETHERNET=3Dy
>> CONFIG_MDIO=3Dy
>> CONFIG_NET_VENDOR_3COM=3Dy
>> # CONFIG_EL3 is not set
>> # CONFIG_3C515 is not set
>> # CONFIG_PCMCIA_3C574 is not set
>> # CONFIG_PCMCIA_3C589 is not set
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
>> # CONFIG_ENA_ETHERNET is not set
>> CONFIG_NET_VENDOR_AMD=3Dy
>> # CONFIG_AMD8111_ETH is not set
>> # CONFIG_LANCE is not set
>> # CONFIG_PCNET32 is not set
>> # CONFIG_PCMCIA_NMCLAN is not set
>> # CONFIG_NI65 is not set
>> # CONFIG_AMD_XGBE is not set
>> CONFIG_NET_VENDOR_AQUANTIA=3Dy
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
>> CONFIG_NET_VENDOR_CHELSIO=3Dy
>> # CONFIG_CHELSIO_T1 is not set
>> # CONFIG_CHELSIO_T3 is not set
>> # CONFIG_CHELSIO_T4 is not set
>> # CONFIG_CHELSIO_T4VF is not set
>> CONFIG_NET_VENDOR_CIRRUS=3Dy
>> # CONFIG_CS89x0 is not set
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
>> CONFIG_NET_VENDOR_FUJITSU=3Dy
>> # CONFIG_PCMCIA_FMVJ18X is not set
>> CONFIG_NET_VENDOR_HP=3Dy
>> # CONFIG_HP100 is not set
>> CONFIG_NET_VENDOR_HUAWEI=3Dy
>> # CONFIG_HINIC is not set
>> CONFIG_NET_VENDOR_I825XX=3Dy
>> CONFIG_NET_VENDOR_INTEL=3Dy
>> # CONFIG_E100 is not set
>> CONFIG_E1000=3Dy
>> CONFIG_E1000E=3Dy
>> CONFIG_E1000E_HWTS=3Dy
>> CONFIG_IGB=3Dy
>> CONFIG_IGB_HWMON=3Dy
>> # CONFIG_IGBVF is not set
>> # CONFIG_IXGB is not set
>> CONFIG_IXGBE=3Dy
>> CONFIG_IXGBE_HWMON=3Dy
>> # CONFIG_IXGBEVF is not set
>> # CONFIG_I40E is not set
>> # CONFIG_I40EVF is not set
>> # CONFIG_ICE is not set
>> # CONFIG_FM10K is not set
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
>> # CONFIG_KS8851 is not set
>> # CONFIG_KS8851_MLL is not set
>> # CONFIG_KSZ884X_PCI is not set
>> CONFIG_NET_VENDOR_MICROCHIP=3Dy
>> # CONFIG_ENC28J60 is not set
>> # CONFIG_ENCX24J600 is not set
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
>> # CONFIG_NFP is not set
>> CONFIG_NET_VENDOR_NI=3Dy
>> CONFIG_NET_VENDOR_8390=3Dy
>> # CONFIG_PCMCIA_AXNET is not set
>> # CONFIG_NE2000 is not set
>> # CONFIG_NE2K_PCI is not set
>> # CONFIG_PCMCIA_PCNET is not set
>> # CONFIG_ULTRA is not set
>> # CONFIG_WD80x3 is not set
>> CONFIG_NET_VENDOR_NVIDIA=3Dy
>> # CONFIG_FORCEDETH is not set
>> CONFIG_NET_VENDOR_OKI=3Dy
>> # CONFIG_PCH_GBE is not set
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
>> # CONFIG_SMC9194 is not set
>> # CONFIG_PCMCIA_SMC91C92 is not set
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
>> # CONFIG_TI_CPSW_ALE is not set
>> # CONFIG_TLAN is not set
>> CONFIG_NET_VENDOR_VIA=3Dy
>> # CONFIG_VIA_RHINE is not set
>> # CONFIG_VIA_VELOCITY is not set
>> CONFIG_NET_VENDOR_WIZNET=3Dy
>> # CONFIG_WIZNET_W5100 is not set
>> # CONFIG_WIZNET_W5300 is not set
>> CONFIG_NET_VENDOR_XIRCOM=3Dy
>> # CONFIG_PCMCIA_XIRC2PS is not set
>> # CONFIG_FDDI is not set
>> # CONFIG_HIPPI is not set
>> # CONFIG_NET_SB1000 is not set
>> # CONFIG_MDIO_DEVICE is not set
>> # CONFIG_PHYLIB is not set
>> # CONFIG_MICREL_KS8995MA is not set
>> # CONFIG_PPP is not set
>> # CONFIG_SLIP is not set
>> CONFIG_USB_NET_DRIVERS=3Dy
>> # CONFIG_USB_CATC is not set
>> # CONFIG_USB_KAWETH is not set
>> # CONFIG_USB_PEGASUS is not set
>> # CONFIG_USB_RTL8150 is not set
>> # CONFIG_USB_RTL8152 is not set
>> # CONFIG_USB_LAN78XX is not set
>> # CONFIG_USB_USBNET is not set
>> # CONFIG_USB_IPHETH is not set
>> CONFIG_WLAN=3Dy
>> # CONFIG_WIRELESS_WDS is not set
>> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
>> CONFIG_WLAN_VENDOR_ATH=3Dy
>> # CONFIG_ATH_DEBUG is not set
>> # CONFIG_ATH5K_PCI is not set
>> CONFIG_WLAN_VENDOR_ATMEL=3Dy
>> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
>> CONFIG_WLAN_VENDOR_CISCO=3Dy
>> CONFIG_WLAN_VENDOR_INTEL=3Dy
>> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
>> # CONFIG_HOSTAP is not set
>> # CONFIG_PRISM54 is not set
>> CONFIG_WLAN_VENDOR_MARVELL=3Dy
>> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
>> CONFIG_WLAN_VENDOR_RALINK=3Dy
>> CONFIG_WLAN_VENDOR_REALTEK=3Dy
>> CONFIG_WLAN_VENDOR_RSI=3Dy
>> CONFIG_WLAN_VENDOR_ST=3Dy
>> CONFIG_WLAN_VENDOR_TI=3Dy
>> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
>> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
>> # CONFIG_PCMCIA_RAYCS is not set
>>
>> #
>> # Enable WiMAX (Networking options) to see the WiMAX drivers
>> #
>> # CONFIG_WAN is not set
>> CONFIG_XEN_NETDEV_FRONTEND=3Dy
>> # CONFIG_XEN_NETDEV_BACKEND is not set
>> # CONFIG_VMXNET3 is not set
>> # CONFIG_FUJITSU_ES is not set
>> # CONFIG_THUNDERBOLT_NET is not set
>> # CONFIG_NETDEVSIM is not set
>> # CONFIG_NET_FAILOVER is not set
>> # CONFIG_ISDN is not set
>>
>> #
>> # Input device support
>> #
>> CONFIG_INPUT=3Dy
>> CONFIG_INPUT_LEDS=3Dy
>> CONFIG_INPUT_FF_MEMLESS=3Dy
>> CONFIG_INPUT_POLLDEV=3Dy
>> # CONFIG_INPUT_SPARSEKMAP is not set
>> CONFIG_INPUT_MATRIXKMAP=3Dy
>>
>> #
>> # Userland interfaces
>> #
>> # CONFIG_INPUT_MOUSEDEV is not set
>> CONFIG_INPUT_JOYDEV=3Dy
>> CONFIG_INPUT_EVDEV=3Dy
>> CONFIG_INPUT_EVBUG=3Dy
>>
>> #
>> # Input Device Drivers
>> #
>> CONFIG_INPUT_KEYBOARD=3Dy
>> CONFIG_KEYBOARD_ADC=3Dy
>> CONFIG_KEYBOARD_ADP5588=3Dy
>> CONFIG_KEYBOARD_ADP5589=3Dy
>> CONFIG_KEYBOARD_ATKBD=3Dy
>> CONFIG_KEYBOARD_QT1070=3Dy
>> # CONFIG_KEYBOARD_QT2160 is not set
>> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
>> CONFIG_KEYBOARD_LKKBD=3Dy
>> CONFIG_KEYBOARD_GPIO=3Dy
>> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
>> # CONFIG_KEYBOARD_TCA6416 is not set
>> # CONFIG_KEYBOARD_TCA8418 is not set
>> CONFIG_KEYBOARD_MATRIX=3Dy
>> # CONFIG_KEYBOARD_LM8323 is not set
>> # CONFIG_KEYBOARD_LM8333 is not set
>> # CONFIG_KEYBOARD_MAX7359 is not set
>> CONFIG_KEYBOARD_MCS=3Dy
>> # CONFIG_KEYBOARD_MPR121 is not set
>> # CONFIG_KEYBOARD_NEWTON is not set
>> # CONFIG_KEYBOARD_OPENCORES is not set
>> CONFIG_KEYBOARD_SAMSUNG=3Dy
>> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
>> CONFIG_KEYBOARD_STOWAWAY=3Dy
>> CONFIG_KEYBOARD_SUNKBD=3Dy
>> CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
>> CONFIG_KEYBOARD_TWL4030=3Dy
>> CONFIG_KEYBOARD_XTKBD=3Dy
>> CONFIG_KEYBOARD_CROS_EC=3Dy
>> # CONFIG_KEYBOARD_MTK_PMIC is not set
>> CONFIG_INPUT_MOUSE=3Dy
>> # CONFIG_MOUSE_PS2 is not set
>> CONFIG_MOUSE_SERIAL=3Dy
>> CONFIG_MOUSE_APPLETOUCH=3Dy
>> CONFIG_MOUSE_BCM5974=3Dy
>> CONFIG_MOUSE_CYAPA=3Dy
>> # CONFIG_MOUSE_ELAN_I2C is not set
>> # CONFIG_MOUSE_INPORT is not set
>> CONFIG_MOUSE_LOGIBM=3Dy
>> # CONFIG_MOUSE_PC110PAD is not set
>> CONFIG_MOUSE_VSXXXAA=3Dy
>> # CONFIG_MOUSE_GPIO is not set
>> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
>> CONFIG_MOUSE_SYNAPTICS_USB=3Dy
>> # CONFIG_INPUT_JOYSTICK is not set
>> CONFIG_INPUT_TABLET=3Dy
>> CONFIG_TABLET_USB_ACECAD=3Dy
>> CONFIG_TABLET_USB_AIPTEK=3Dy
>> # CONFIG_TABLET_USB_GTCO is not set
>> CONFIG_TABLET_USB_HANWANG=3Dy
>> CONFIG_TABLET_USB_KBTAB=3Dy
>> CONFIG_TABLET_USB_PEGASUS=3Dy
>> # CONFIG_TABLET_SERIAL_WACOM4 is not set
>> CONFIG_INPUT_TOUCHSCREEN=3Dy
>> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
>> # CONFIG_TOUCHSCREEN_ADS7846 is not set
>> CONFIG_TOUCHSCREEN_AD7877=3Dy
>> CONFIG_TOUCHSCREEN_AD7879=3Dy
>> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
>> # CONFIG_TOUCHSCREEN_AD7879_SPI is not set
>> # CONFIG_TOUCHSCREEN_ADC is not set
>> # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
>> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
>> CONFIG_TOUCHSCREEN_BU21013=3Dy
>> # CONFIG_TOUCHSCREEN_BU21029 is not set
>> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
>> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
>> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
>> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
>> # CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
>> CONFIG_TOUCHSCREEN_CYTTSP4_SPI=3Dy
>> # CONFIG_TOUCHSCREEN_DA9034 is not set
>> CONFIG_TOUCHSCREEN_DA9052=3Dy
>> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
>> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
>> CONFIG_TOUCHSCREEN_EETI=3Dy
>> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
>> CONFIG_TOUCHSCREEN_EXC3000=3Dy
>> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
>> # CONFIG_TOUCHSCREEN_GOODIX is not set
>> CONFIG_TOUCHSCREEN_HIDEEP=3Dy
>> CONFIG_TOUCHSCREEN_ILI210X=3Dy
>> # CONFIG_TOUCHSCREEN_S6SY761 is not set
>> CONFIG_TOUCHSCREEN_GUNZE=3Dy
>> # CONFIG_TOUCHSCREEN_EKTF2127 is not set
>> CONFIG_TOUCHSCREEN_ELAN=3Dy
>> CONFIG_TOUCHSCREEN_ELO=3Dy
>> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
>> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
>> CONFIG_TOUCHSCREEN_MAX11801=3Dy
>> CONFIG_TOUCHSCREEN_MCS5000=3Dy
>> CONFIG_TOUCHSCREEN_MMS114=3Dy
>> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
>> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
>> CONFIG_TOUCHSCREEN_INEXIO=3Dy
>> # CONFIG_TOUCHSCREEN_MK712 is not set
>> CONFIG_TOUCHSCREEN_HTCPEN=3Dy
>> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
>> # CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
>> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
>> # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
>> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
>> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
>> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
>> CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dy
>> CONFIG_TOUCHSCREEN_MC13783=3Dy
>> # CONFIG_TOUCHSCREEN_USB_EGALAX is not set
>> # CONFIG_TOUCHSCREEN_USB_PANJIT is not set
>> CONFIG_TOUCHSCREEN_USB_3M=3Dy
>> CONFIG_TOUCHSCREEN_USB_ITM=3Dy
>> # CONFIG_TOUCHSCREEN_USB_ETURBO is not set
>> # CONFIG_TOUCHSCREEN_USB_GUNZE is not set
>> CONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy
>> # CONFIG_TOUCHSCREEN_USB_IRTOUCH is not set
>> # CONFIG_TOUCHSCREEN_USB_IDEALTEK is not set
>> CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=3Dy
>> # CONFIG_TOUCHSCREEN_USB_GOTOP is not set
>> CONFIG_TOUCHSCREEN_USB_JASTEC=3Dy
>> # CONFIG_TOUCHSCREEN_USB_ELO is not set
>> CONFIG_TOUCHSCREEN_USB_E2I=3Dy
>> CONFIG_TOUCHSCREEN_USB_ZYTRONIC=3Dy
>> # CONFIG_TOUCHSCREEN_USB_ETT_TC45USB is not set
>> # CONFIG_TOUCHSCREEN_USB_NEXIO is not set
>> CONFIG_TOUCHSCREEN_USB_EASYTOUCH=3Dy
>> # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
>> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
>> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
>> # CONFIG_TOUCHSCREEN_TSC2004 is not set
>> CONFIG_TOUCHSCREEN_TSC2005=3Dy
>> # CONFIG_TOUCHSCREEN_TSC2007 is not set
>> CONFIG_TOUCHSCREEN_RM_TS=3Dy
>> CONFIG_TOUCHSCREEN_SILEAD=3Dy
>> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
>> CONFIG_TOUCHSCREEN_ST1232=3Dy
>> CONFIG_TOUCHSCREEN_STMFTS=3Dy
>> CONFIG_TOUCHSCREEN_SURFACE3_SPI=3Dy
>> CONFIG_TOUCHSCREEN_SX8654=3Dy
>> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
>> CONFIG_TOUCHSCREEN_ZET6223=3Dy
>> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
>> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dy
>> CONFIG_INPUT_MISC=3Dy
>> # CONFIG_INPUT_88PM80X_ONKEY is not set
>> # CONFIG_INPUT_AD714X is not set
>> CONFIG_INPUT_BMA150=3Dy
>> CONFIG_INPUT_E3X0_BUTTON=3Dy
>> CONFIG_INPUT_MAX77693_HAPTIC=3Dy
>> CONFIG_INPUT_MC13783_PWRBUTTON=3Dy
>> CONFIG_INPUT_MMA8450=3Dy
>> # CONFIG_INPUT_APANEL is not set
>> CONFIG_INPUT_GP2A=3Dy
>> CONFIG_INPUT_GPIO_BEEPER=3Dy
>> CONFIG_INPUT_GPIO_DECODER=3Dy
>> # CONFIG_INPUT_WISTRON_BTNS is not set
>> # CONFIG_INPUT_ATLAS_BTNS is not set
>> CONFIG_INPUT_ATI_REMOTE2=3Dy
>> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
>> CONFIG_INPUT_KXTJ9=3Dy
>> # CONFIG_INPUT_KXTJ9_POLLED_MODE is not set
>> # CONFIG_INPUT_POWERMATE is not set
>> CONFIG_INPUT_YEALINK=3Dy
>> CONFIG_INPUT_CM109=3Dy
>> CONFIG_INPUT_RETU_PWRBUTTON=3Dy
>> # CONFIG_INPUT_AXP20X_PEK is not set
>> CONFIG_INPUT_TWL4030_PWRBUTTON=3Dy
>> CONFIG_INPUT_TWL4030_VIBRA=3Dy
>> CONFIG_INPUT_UINPUT=3Dy
>> # CONFIG_INPUT_PCF8574 is not set
>> CONFIG_INPUT_PWM_BEEPER=3Dy
>> CONFIG_INPUT_PWM_VIBRA=3Dy
>> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
>> CONFIG_INPUT_DA9052_ONKEY=3Dy
>> # CONFIG_INPUT_DA9055_ONKEY is not set
>> CONFIG_INPUT_DA9063_ONKEY=3Dy
>> CONFIG_INPUT_ADXL34X=3Dy
>> CONFIG_INPUT_ADXL34X_I2C=3Dy
>> CONFIG_INPUT_ADXL34X_SPI=3Dy
>> # CONFIG_INPUT_IMS_PCU is not set
>> CONFIG_INPUT_CMA3000=3Dy
>> # CONFIG_INPUT_CMA3000_I2C is not set
>> # CONFIG_INPUT_XEN_KBDDEV_FRONTEND is not set
>> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
>> CONFIG_INPUT_SOC_BUTTON_ARRAY=3Dy
>> CONFIG_INPUT_DRV260X_HAPTICS=3Dy
>> CONFIG_INPUT_DRV2665_HAPTICS=3Dy
>> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
>> # CONFIG_INPUT_RAVE_SP_PWRBUTTON is not set
>> CONFIG_RMI4_CORE=3Dy
>> CONFIG_RMI4_I2C=3Dy
>> # CONFIG_RMI4_SPI is not set
>> CONFIG_RMI4_SMB=3Dy
>> CONFIG_RMI4_F03=3Dy
>> CONFIG_RMI4_F03_SERIO=3Dy
>> CONFIG_RMI4_2D_SENSOR=3Dy
>> CONFIG_RMI4_F11=3Dy
>> CONFIG_RMI4_F12=3Dy
>> CONFIG_RMI4_F30=3Dy
>> CONFIG_RMI4_F34=3Dy
>> CONFIG_RMI4_F55=3Dy
>>
>> #
>> # Hardware I/O ports
>> #
>> CONFIG_SERIO=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>> CONFIG_SERIO_I8042=3Dy
>> CONFIG_SERIO_SERPORT=3Dy
>> # CONFIG_SERIO_CT82C710 is not set
>> # CONFIG_SERIO_PCIPS2 is not set
>> CONFIG_SERIO_LIBPS2=3Dy
>> # CONFIG_SERIO_RAW is not set
>> CONFIG_SERIO_ALTERA_PS2=3Dy
>> # CONFIG_SERIO_PS2MULT is not set
>> CONFIG_SERIO_ARC_PS2=3Dy
>> # CONFIG_SERIO_GPIO_PS2 is not set
>> CONFIG_USERIO=3Dy
>> CONFIG_GAMEPORT=3Dy
>> CONFIG_GAMEPORT_NS558=3Dy
>> CONFIG_GAMEPORT_L4=3Dy
>> CONFIG_GAMEPORT_EMU10K1=3Dy
>> CONFIG_GAMEPORT_FM801=3Dy
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
>> # CONFIG_GOLDFISH_TTY is not set
>> CONFIG_DEVMEM=3Dy
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
>> # CONFIG_SERIAL_8250_CS is not set
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
>> # CONFIG_SERIAL_MAX3100 is not set
>> # CONFIG_SERIAL_MAX310X is not set
>> # CONFIG_SERIAL_UARTLITE is not set
>> CONFIG_SERIAL_CORE=3Dy
>> CONFIG_SERIAL_CORE_CONSOLE=3Dy
>> # CONFIG_SERIAL_JSM is not set
>> # CONFIG_SERIAL_SCCNXP is not set
>> # CONFIG_SERIAL_SC16IS7XX is not set
>> # CONFIG_SERIAL_TIMBERDALE is not set
>> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
>> # CONFIG_SERIAL_ALTERA_UART is not set
>> # CONFIG_SERIAL_IFX6X60 is not set
>> # CONFIG_SERIAL_PCH_UART is not set
>> # CONFIG_SERIAL_ARC is not set
>> # CONFIG_SERIAL_RP2 is not set
>> # CONFIG_SERIAL_FSL_LPUART is not set
>> # CONFIG_SERIAL_MEN_Z135 is not set
>> CONFIG_SERIAL_DEV_BUS=3Dy
>> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
>> # CONFIG_TTY_PRINTK is not set
>> CONFIG_HVC_DRIVER=3Dy
>> CONFIG_HVC_IRQ=3Dy
>> CONFIG_HVC_XEN=3Dy
>> CONFIG_HVC_XEN_FRONTEND=3Dy
>> # CONFIG_VIRTIO_CONSOLE is not set
>> CONFIG_IPMI_HANDLER=3Dy
>> CONFIG_IPMI_PANIC_EVENT=3Dy
>> CONFIG_IPMI_PANIC_STRING=3Dy
>> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
>> # CONFIG_IPMI_SI is not set
>> # CONFIG_IPMI_SSIF is not set
>> CONFIG_IPMI_WATCHDOG=3Dy
>> CONFIG_IPMI_POWEROFF=3Dy
>> CONFIG_HW_RANDOM=3Dy
>> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
>> # CONFIG_HW_RANDOM_INTEL is not set
>> CONFIG_HW_RANDOM_AMD=3Dy
>> CONFIG_HW_RANDOM_GEODE=3Dy
>> # CONFIG_HW_RANDOM_VIA is not set
>> # CONFIG_HW_RANDOM_VIRTIO is not set
>> # CONFIG_NVRAM is not set
>> CONFIG_DTLK=3Dy
>> # CONFIG_R3964 is not set
>> CONFIG_APPLICOM=3Dy
>> # CONFIG_SONYPI is not set
>>
>> #
>> # PCMCIA character devices
>> #
>> # CONFIG_SYNCLINK_CS is not set
>> CONFIG_CARDMAN_4000=3Dy
>> CONFIG_CARDMAN_4040=3Dy
>> # CONFIG_SCR24X is not set
>> # CONFIG_IPWIRELESS is not set
>> # CONFIG_MWAVE is not set
>> CONFIG_PC8736x_GPIO=3Dy
>> CONFIG_NSC_GPIO=3Dy
>> # CONFIG_HPET is not set
>> CONFIG_HANGCHECK_TIMER=3Dy
>> # CONFIG_TCG_TPM is not set
>> CONFIG_TELCLOCK=3Dy
>> # CONFIG_DEVPORT is not set
>> CONFIG_XILLYBUS=3Dy
>> CONFIG_XILLYBUS_PCIE=3Dy
>> CONFIG_RANDOM_TRUST_CPU=3Dy
>>
>> #
>> # I2C support
>> #
>> CONFIG_I2C=3Dy
>> CONFIG_ACPI_I2C_OPREGION=3Dy
>> CONFIG_I2C_BOARDINFO=3Dy
>> CONFIG_I2C_COMPAT=3Dy
>> CONFIG_I2C_CHARDEV=3Dy
>> CONFIG_I2C_MUX=3Dy
>>
>> #
>> # Multiplexer I2C Chip support
>> #
>> CONFIG_I2C_MUX_GPIO=3Dy
>> CONFIG_I2C_MUX_LTC4306=3Dy
>> CONFIG_I2C_MUX_PCA9541=3Dy
>> CONFIG_I2C_MUX_PCA954x=3Dy
>> CONFIG_I2C_MUX_REG=3Dy
>> CONFIG_I2C_MUX_MLXCPLD=3Dy
>> CONFIG_I2C_HELPER_AUTO=3Dy
>> CONFIG_I2C_SMBUS=3Dy
>> CONFIG_I2C_ALGOBIT=3Dy
>> CONFIG_I2C_ALGOPCA=3Dy
>>
>> #
>> # I2C Hardware Bus support
>> #
>>
>> #
>> # PC SMBus host controller drivers
>> #
>> CONFIG_I2C_ALI1535=3Dy
>> CONFIG_I2C_ALI1563=3Dy
>> CONFIG_I2C_ALI15X3=3Dy
>> CONFIG_I2C_AMD756=3Dy
>> CONFIG_I2C_AMD756_S4882=3Dy
>> CONFIG_I2C_AMD8111=3Dy
>> CONFIG_I2C_I801=3Dy
>> CONFIG_I2C_ISCH=3Dy
>> CONFIG_I2C_ISMT=3Dy
>> CONFIG_I2C_PIIX4=3Dy
>> CONFIG_I2C_NFORCE2=3Dy
>> # CONFIG_I2C_NFORCE2_S4985 is not set
>> # CONFIG_I2C_SIS5595 is not set
>> # CONFIG_I2C_SIS630 is not set
>> CONFIG_I2C_SIS96X=3Dy
>> # CONFIG_I2C_VIA is not set
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
>> # CONFIG_I2C_CBUS_GPIO is not set
>> CONFIG_I2C_DESIGNWARE_CORE=3Dy
>> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
>> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
>> CONFIG_I2C_DESIGNWARE_PCI=3Dy
>> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
>> # CONFIG_I2C_EG20T is not set
>> # CONFIG_I2C_EMEV2 is not set
>> # CONFIG_I2C_GPIO is not set
>> # CONFIG_I2C_KEMPLD is not set
>> CONFIG_I2C_OCORES=3Dy
>> CONFIG_I2C_PCA_PLATFORM=3Dy
>> # CONFIG_I2C_SIMTEC is not set
>> # CONFIG_I2C_XILINX is not set
>>
>> #
>> # External I2C/SMBus adapter drivers
>> #
>> CONFIG_I2C_DIOLAN_U2C=3Dy
>> # CONFIG_I2C_DLN2 is not set
>> CONFIG_I2C_PARPORT_LIGHT=3Dy
>> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
>> # CONFIG_I2C_TAOS_EVM is not set
>> CONFIG_I2C_TINY_USB=3Dy
>> CONFIG_I2C_VIPERBOARD=3Dy
>>
>> #
>> # Other I2C/SMBus bus drivers
>> #
>> # CONFIG_I2C_PCA_ISA is not set
>> CONFIG_I2C_CROS_EC_TUNNEL=3Dy
>> # CONFIG_SCx200_ACB is not set
>> CONFIG_I2C_SLAVE=3Dy
>> CONFIG_I2C_SLAVE_EEPROM=3Dy
>> # CONFIG_I2C_DEBUG_CORE is not set
>> # CONFIG_I2C_DEBUG_ALGO is not set
>> # CONFIG_I2C_DEBUG_BUS is not set
>> CONFIG_SPI=3Dy
>> CONFIG_SPI_DEBUG=3Dy
>> CONFIG_SPI_MASTER=3Dy
>> CONFIG_SPI_MEM=3Dy
>>
>> #
>> # SPI Master Controller Drivers
>> #
>> CONFIG_SPI_ALTERA=3Dy
>> # CONFIG_SPI_AXI_SPI_ENGINE is not set
>> CONFIG_SPI_BITBANG=3Dy
>> CONFIG_SPI_CADENCE=3Dy
>> CONFIG_SPI_DESIGNWARE=3Dy
>> # CONFIG_SPI_DW_PCI is not set
>> # CONFIG_SPI_DW_MMIO is not set
>> # CONFIG_SPI_DLN2 is not set
>> # CONFIG_SPI_GPIO is not set
>> CONFIG_SPI_OC_TINY=3Dy
>> # CONFIG_SPI_PXA2XX is not set
>> # CONFIG_SPI_ROCKCHIP is not set
>> CONFIG_SPI_SC18IS602=3Dy
>> CONFIG_SPI_TOPCLIFF_PCH=3Dy
>> CONFIG_SPI_XCOMM=3Dy
>> CONFIG_SPI_XILINX=3Dy
>> # CONFIG_SPI_ZYNQMP_GQSPI is not set
>>
>> #
>> # SPI Protocol Masters
>> #
>> CONFIG_SPI_SPIDEV=3Dy
>> CONFIG_SPI_TLE62X0=3Dy
>> # CONFIG_SPI_SLAVE is not set
>> CONFIG_SPMI=3Dy
>> # CONFIG_HSI is not set
>> CONFIG_PPS=3Dy
>> # CONFIG_PPS_DEBUG is not set
>> # CONFIG_NTP_PPS is not set
>>
>> #
>> # PPS clients support
>> #
>> # CONFIG_PPS_CLIENT_KTIMER is not set
>> # CONFIG_PPS_CLIENT_LDISC is not set
>> CONFIG_PPS_CLIENT_GPIO=3Dy
>>
>> #
>> # PPS generators support
>> #
>>
>> #
>> # PTP clock support
>> #
>> CONFIG_PTP_1588_CLOCK=3Dy
>>
>> #
>> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clock=
s.
>> #
>> # CONFIG_PTP_1588_CLOCK_PCH is not set
>> CONFIG_PTP_1588_CLOCK_KVM=3Dy
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
>> CONFIG_PINCTRL_MADERA=3Dy
>> CONFIG_PINCTRL_CS47L85=3Dy
>> CONFIG_GPIOLIB=3Dy
>> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
>> CONFIG_GPIO_ACPI=3Dy
>> CONFIG_GPIOLIB_IRQCHIP=3Dy
>> # CONFIG_DEBUG_GPIO is not set
>> CONFIG_GPIO_SYSFS=3Dy
>> CONFIG_GPIO_GENERIC=3Dy
>> CONFIG_GPIO_MAX730X=3Dy
>>
>> #
>> # Memory mapped GPIO drivers
>> #
>> # CONFIG_GPIO_AMDPT is not set
>> # CONFIG_GPIO_DWAPB is not set
>> # CONFIG_GPIO_EXAR is not set
>> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
>> CONFIG_GPIO_ICH=3Dy
>> # CONFIG_GPIO_LYNXPOINT is not set
>> # CONFIG_GPIO_MB86S7X is not set
>> CONFIG_GPIO_MENZ127=3Dy
>> CONFIG_GPIO_MOCKUP=3Dy
>> # CONFIG_GPIO_VX855 is not set
>>
>> #
>> # Port-mapped I/O GPIO drivers
>> #
>> CONFIG_GPIO_F7188X=3Dy
>> # CONFIG_GPIO_IT87 is not set
>> CONFIG_GPIO_SCH=3Dy
>> CONFIG_GPIO_SCH311X=3Dy
>> CONFIG_GPIO_WINBOND=3Dy
>> # CONFIG_GPIO_WS16C48 is not set
>>
>> #
>> # I2C GPIO expanders
>> #
>> CONFIG_GPIO_ADP5588=3Dy
>> CONFIG_GPIO_ADP5588_IRQ=3Dy
>> CONFIG_GPIO_MAX7300=3Dy
>> CONFIG_GPIO_MAX732X=3Dy
>> CONFIG_GPIO_MAX732X_IRQ=3Dy
>> # CONFIG_GPIO_PCA953X is not set
>> # CONFIG_GPIO_PCF857X is not set
>> CONFIG_GPIO_TPIC2810=3Dy
>>
>> #
>> # MFD GPIO expanders
>> #
>> # CONFIG_GPIO_ARIZONA is not set
>> # CONFIG_GPIO_BD9571MWV is not set
>> # CONFIG_GPIO_CS5535 is not set
>> CONFIG_GPIO_DA9052=3Dy
>> CONFIG_GPIO_DA9055=3Dy
>> CONFIG_GPIO_DLN2=3Dy
>> # CONFIG_GPIO_JANZ_TTL is not set
>> CONFIG_GPIO_KEMPLD=3Dy
>> # CONFIG_GPIO_MADERA is not set
>> # CONFIG_GPIO_TPS65086 is not set
>> # CONFIG_GPIO_TPS65912 is not set
>> CONFIG_GPIO_TWL4030=3Dy
>>
>> #
>> # PCI GPIO expanders
>> #
>> CONFIG_GPIO_AMD8111=3Dy
>> CONFIG_GPIO_BT8XX=3Dy
>> CONFIG_GPIO_ML_IOH=3Dy
>> # CONFIG_GPIO_PCH is not set
>> CONFIG_GPIO_PCI_IDIO_16=3Dy
>> CONFIG_GPIO_PCIE_IDIO_24=3Dy
>> # CONFIG_GPIO_RDC321X is not set
>>
>> #
>> # SPI GPIO expanders
>> #
>> # CONFIG_GPIO_MAX3191X is not set
>> # CONFIG_GPIO_MAX7301 is not set
>> CONFIG_GPIO_MC33880=3Dy
>> # CONFIG_GPIO_PISOSR is not set
>> CONFIG_GPIO_XRA1403=3Dy
>>
>> #
>> # USB GPIO expanders
>> #
>> CONFIG_GPIO_VIPERBOARD=3Dy
>> CONFIG_W1=3Dy
>>
>> #
>> # 1-wire Bus Masters
>> #
>> CONFIG_W1_MASTER_MATROX=3Dy
>> CONFIG_W1_MASTER_DS2490=3Dy
>> CONFIG_W1_MASTER_DS2482=3Dy
>> # CONFIG_W1_MASTER_DS1WM is not set
>> CONFIG_W1_MASTER_GPIO=3Dy
>>
>> #
>> # 1-wire Slaves
>> #
>> # CONFIG_W1_SLAVE_THERM is not set
>> # CONFIG_W1_SLAVE_SMEM is not set
>> # CONFIG_W1_SLAVE_DS2405 is not set
>> # CONFIG_W1_SLAVE_DS2408 is not set
>> # CONFIG_W1_SLAVE_DS2413 is not set
>> # CONFIG_W1_SLAVE_DS2406 is not set
>> CONFIG_W1_SLAVE_DS2423=3Dy
>> CONFIG_W1_SLAVE_DS2805=3Dy
>> # CONFIG_W1_SLAVE_DS2431 is not set
>> # CONFIG_W1_SLAVE_DS2433 is not set
>> CONFIG_W1_SLAVE_DS2438=3Dy
>> CONFIG_W1_SLAVE_DS2780=3Dy
>> CONFIG_W1_SLAVE_DS2781=3Dy
>> # CONFIG_W1_SLAVE_DS28E04 is not set
>> CONFIG_W1_SLAVE_DS28E17=3Dy
>> # CONFIG_POWER_AVS is not set
>> # CONFIG_POWER_RESET is not set
>> CONFIG_POWER_SUPPLY=3Dy
>> CONFIG_POWER_SUPPLY_DEBUG=3Dy
>> CONFIG_PDA_POWER=3Dy
>> CONFIG_GENERIC_ADC_BATTERY=3Dy
>> # CONFIG_TEST_POWER is not set
>> # CONFIG_CHARGER_ADP5061 is not set
>> CONFIG_BATTERY_DS2760=3Dy
>> CONFIG_BATTERY_DS2780=3Dy
>> CONFIG_BATTERY_DS2781=3Dy
>> CONFIG_BATTERY_DS2782=3Dy
>> # CONFIG_BATTERY_SBS is not set
>> CONFIG_CHARGER_SBS=3Dy
>> # CONFIG_MANAGER_SBS is not set
>> CONFIG_BATTERY_BQ27XXX=3Dy
>> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
>> # CONFIG_BATTERY_BQ27XXX_HDQ is not set
>> CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=3Dy
>> CONFIG_BATTERY_DA9030=3Dy
>> # CONFIG_BATTERY_DA9052 is not set
>> CONFIG_CHARGER_DA9150=3Dy
>> CONFIG_BATTERY_DA9150=3Dy
>> CONFIG_CHARGER_AXP20X=3Dy
>> CONFIG_BATTERY_AXP20X=3Dy
>> # CONFIG_AXP20X_POWER is not set
>> CONFIG_AXP288_FUEL_GAUGE=3Dy
>> # CONFIG_BATTERY_MAX17040 is not set
>> CONFIG_BATTERY_MAX17042=3Dy
>> CONFIG_BATTERY_MAX1721X=3Dy
>> # CONFIG_BATTERY_TWL4030_MADC is not set
>> CONFIG_BATTERY_RX51=3Dy
>> # CONFIG_CHARGER_ISP1704 is not set
>> # CONFIG_CHARGER_MAX8903 is not set
>> # CONFIG_CHARGER_TWL4030 is not set
>> CONFIG_CHARGER_LP8727=3Dy
>> CONFIG_CHARGER_GPIO=3Dy
>> CONFIG_CHARGER_LTC3651=3Dy
>> CONFIG_CHARGER_MAX14577=3Dy
>> CONFIG_CHARGER_MAX77693=3Dy
>> CONFIG_CHARGER_BQ2415X=3Dy
>> CONFIG_CHARGER_BQ24190=3Dy
>> # CONFIG_CHARGER_BQ24257 is not set
>> CONFIG_CHARGER_BQ24735=3Dy
>> # CONFIG_CHARGER_BQ25890 is not set
>> CONFIG_CHARGER_SMB347=3Dy
>> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
>> # CONFIG_BATTERY_GOLDFISH is not set
>> CONFIG_BATTERY_RT5033=3Dy
>> CONFIG_CHARGER_RT9455=3Dy
>> # CONFIG_CHARGER_CROS_USBPD is not set
>> CONFIG_HWMON=3Dy
>> CONFIG_HWMON_VID=3Dy
>> # CONFIG_HWMON_DEBUG_CHIP is not set
>>
>> #
>> # Native drivers
>> #
>> CONFIG_SENSORS_AD7314=3Dy
>> CONFIG_SENSORS_AD7414=3Dy
>> CONFIG_SENSORS_AD7418=3Dy
>> CONFIG_SENSORS_ADM1021=3Dy
>> CONFIG_SENSORS_ADM1025=3Dy
>> CONFIG_SENSORS_ADM1026=3Dy
>> # CONFIG_SENSORS_ADM1029 is not set
>> # CONFIG_SENSORS_ADM1031 is not set
>> CONFIG_SENSORS_ADM9240=3Dy
>> # CONFIG_SENSORS_ADT7310 is not set
>> # CONFIG_SENSORS_ADT7410 is not set
>> CONFIG_SENSORS_ADT7411=3Dy
>> CONFIG_SENSORS_ADT7462=3Dy
>> # CONFIG_SENSORS_ADT7470 is not set
>> # CONFIG_SENSORS_ADT7475 is not set
>> # CONFIG_SENSORS_ASC7621 is not set
>> CONFIG_SENSORS_K8TEMP=3Dy
>> # CONFIG_SENSORS_K10TEMP is not set
>> CONFIG_SENSORS_FAM15H_POWER=3Dy
>> # CONFIG_SENSORS_APPLESMC is not set
>> CONFIG_SENSORS_ASB100=3Dy
>> # CONFIG_SENSORS_ASPEED is not set
>> CONFIG_SENSORS_ATXP1=3Dy
>> # CONFIG_SENSORS_DS620 is not set
>> CONFIG_SENSORS_DS1621=3Dy
>> CONFIG_SENSORS_DELL_SMM=3Dy
>> CONFIG_SENSORS_DA9052_ADC=3Dy
>> CONFIG_SENSORS_DA9055=3Dy
>> CONFIG_SENSORS_I5K_AMB=3Dy
>> CONFIG_SENSORS_F71805F=3Dy
>> CONFIG_SENSORS_F71882FG=3Dy
>> CONFIG_SENSORS_F75375S=3Dy
>> CONFIG_SENSORS_MC13783_ADC=3Dy
>> CONFIG_SENSORS_FSCHMD=3Dy
>> CONFIG_SENSORS_FTSTEUTATES=3Dy
>> # CONFIG_SENSORS_GL518SM is not set
>> CONFIG_SENSORS_GL520SM=3Dy
>> CONFIG_SENSORS_G760A=3Dy
>> # CONFIG_SENSORS_G762 is not set
>> # CONFIG_SENSORS_HIH6130 is not set
>> # CONFIG_SENSORS_IBMAEM is not set
>> # CONFIG_SENSORS_IBMPEX is not set
>> CONFIG_SENSORS_IIO_HWMON=3Dy
>> CONFIG_SENSORS_I5500=3Dy
>> CONFIG_SENSORS_CORETEMP=3Dy
>> CONFIG_SENSORS_IT87=3Dy
>> CONFIG_SENSORS_JC42=3Dy
>> CONFIG_SENSORS_POWR1220=3Dy
>> # CONFIG_SENSORS_LINEAGE is not set
>> CONFIG_SENSORS_LTC2945=3Dy
>> CONFIG_SENSORS_LTC2990=3Dy
>> # CONFIG_SENSORS_LTC4151 is not set
>> # CONFIG_SENSORS_LTC4215 is not set
>> CONFIG_SENSORS_LTC4222=3Dy
>> CONFIG_SENSORS_LTC4245=3Dy
>> CONFIG_SENSORS_LTC4260=3Dy
>> CONFIG_SENSORS_LTC4261=3Dy
>> CONFIG_SENSORS_MAX1111=3Dy
>> CONFIG_SENSORS_MAX16065=3Dy
>> # CONFIG_SENSORS_MAX1619 is not set
>> CONFIG_SENSORS_MAX1668=3Dy
>> CONFIG_SENSORS_MAX197=3Dy
>> # CONFIG_SENSORS_MAX31722 is not set
>> CONFIG_SENSORS_MAX6621=3Dy
>> CONFIG_SENSORS_MAX6639=3Dy
>> CONFIG_SENSORS_MAX6642=3Dy
>> CONFIG_SENSORS_MAX6650=3Dy
>> CONFIG_SENSORS_MAX6697=3Dy
>> CONFIG_SENSORS_MAX31790=3Dy
>> CONFIG_SENSORS_MCP3021=3Dy
>> # CONFIG_SENSORS_MLXREG_FAN is not set
>> CONFIG_SENSORS_TC654=3Dy
>> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
>> # CONFIG_SENSORS_ADCXX is not set
>> CONFIG_SENSORS_LM63=3Dy
>> CONFIG_SENSORS_LM70=3Dy
>> CONFIG_SENSORS_LM73=3Dy
>> CONFIG_SENSORS_LM75=3Dy
>> CONFIG_SENSORS_LM77=3Dy
>> CONFIG_SENSORS_LM78=3Dy
>> CONFIG_SENSORS_LM80=3Dy
>> CONFIG_SENSORS_LM83=3Dy
>> CONFIG_SENSORS_LM85=3Dy
>> CONFIG_SENSORS_LM87=3Dy
>> # CONFIG_SENSORS_LM90 is not set
>> CONFIG_SENSORS_LM92=3Dy
>> CONFIG_SENSORS_LM93=3Dy
>> CONFIG_SENSORS_LM95234=3Dy
>> CONFIG_SENSORS_LM95241=3Dy
>> CONFIG_SENSORS_LM95245=3Dy
>> CONFIG_SENSORS_PC87360=3Dy
>> # CONFIG_SENSORS_PC87427 is not set
>> # CONFIG_SENSORS_NTC_THERMISTOR is not set
>> CONFIG_SENSORS_NCT6683=3Dy
>> CONFIG_SENSORS_NCT6775=3Dy
>> CONFIG_SENSORS_NCT7802=3Dy
>> CONFIG_SENSORS_NCT7904=3Dy
>> # CONFIG_SENSORS_NPCM7XX is not set
>> # CONFIG_SENSORS_PCF8591 is not set
>> CONFIG_PMBUS=3Dy
>> CONFIG_SENSORS_PMBUS=3Dy
>> CONFIG_SENSORS_ADM1275=3Dy
>> # CONFIG_SENSORS_IBM_CFFPS is not set
>> CONFIG_SENSORS_IR35221=3Dy
>> CONFIG_SENSORS_LM25066=3Dy
>> CONFIG_SENSORS_LTC2978=3Dy
>> CONFIG_SENSORS_LTC3815=3Dy
>> CONFIG_SENSORS_MAX16064=3Dy
>> # CONFIG_SENSORS_MAX20751 is not set
>> CONFIG_SENSORS_MAX31785=3Dy
>> # CONFIG_SENSORS_MAX34440 is not set
>> CONFIG_SENSORS_MAX8688=3Dy
>> # CONFIG_SENSORS_TPS40422 is not set
>> CONFIG_SENSORS_TPS53679=3Dy
>> CONFIG_SENSORS_UCD9000=3Dy
>> CONFIG_SENSORS_UCD9200=3Dy
>> CONFIG_SENSORS_ZL6100=3Dy
>> # CONFIG_SENSORS_SHT15 is not set
>> CONFIG_SENSORS_SHT21=3Dy
>> CONFIG_SENSORS_SHT3x=3Dy
>> CONFIG_SENSORS_SHTC1=3Dy
>> CONFIG_SENSORS_SIS5595=3Dy
>> CONFIG_SENSORS_DME1737=3Dy
>> CONFIG_SENSORS_EMC1403=3Dy
>> CONFIG_SENSORS_EMC2103=3Dy
>> # CONFIG_SENSORS_EMC6W201 is not set
>> # CONFIG_SENSORS_SMSC47M1 is not set
>> CONFIG_SENSORS_SMSC47M192=3Dy
>> CONFIG_SENSORS_SMSC47B397=3Dy
>> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
>> CONFIG_SENSORS_SCH5627=3Dy
>> # CONFIG_SENSORS_SCH5636 is not set
>> CONFIG_SENSORS_STTS751=3Dy
>> CONFIG_SENSORS_SMM665=3Dy
>> # CONFIG_SENSORS_ADC128D818 is not set
>> CONFIG_SENSORS_ADS1015=3Dy
>> CONFIG_SENSORS_ADS7828=3Dy
>> CONFIG_SENSORS_ADS7871=3Dy
>> CONFIG_SENSORS_AMC6821=3Dy
>> CONFIG_SENSORS_INA209=3Dy
>> CONFIG_SENSORS_INA2XX=3Dy
>> # CONFIG_SENSORS_INA3221 is not set
>> CONFIG_SENSORS_TC74=3Dy
>> # CONFIG_SENSORS_THMC50 is not set
>> CONFIG_SENSORS_TMP102=3Dy
>> CONFIG_SENSORS_TMP103=3Dy
>> CONFIG_SENSORS_TMP108=3Dy
>> CONFIG_SENSORS_TMP401=3Dy
>> CONFIG_SENSORS_TMP421=3Dy
>> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
>> CONFIG_SENSORS_VIA686A=3Dy
>> CONFIG_SENSORS_VT1211=3Dy
>> # CONFIG_SENSORS_VT8231 is not set
>> CONFIG_SENSORS_W83773G=3Dy
>> # CONFIG_SENSORS_W83781D is not set
>> CONFIG_SENSORS_W83791D=3Dy
>> CONFIG_SENSORS_W83792D=3Dy
>> CONFIG_SENSORS_W83793=3Dy
>> CONFIG_SENSORS_W83795=3Dy
>> CONFIG_SENSORS_W83795_FANCTRL=3Dy
>> # CONFIG_SENSORS_W83L785TS is not set
>> CONFIG_SENSORS_W83L786NG=3Dy
>> CONFIG_SENSORS_W83627HF=3Dy
>> CONFIG_SENSORS_W83627EHF=3Dy
>>
>> #
>> # ACPI drivers
>> #
>> # CONFIG_SENSORS_ACPI_POWER is not set
>> # CONFIG_SENSORS_ATK0110 is not set
>> CONFIG_THERMAL=3Dy
>> CONFIG_THERMAL_STATISTICS=3Dy
>> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
>> # CONFIG_THERMAL_HWMON is not set
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
>> CONFIG_THERMAL_EMULATION=3Dy
>> # CONFIG_INTEL_POWERCLAMP is not set
>> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
>>
>> #
>> # ACPI INT340X thermal drivers
>> #
>> # CONFIG_INT340X_THERMAL is not set
>> CONFIG_INTEL_PCH_THERMAL=3Dy
>> # CONFIG_GENERIC_ADC_THERMAL is not set
>> CONFIG_WATCHDOG=3Dy
>> CONFIG_WATCHDOG_CORE=3Dy
>> # CONFIG_WATCHDOG_NOWAYOUT is not set
>> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
>> # CONFIG_WATCHDOG_SYSFS is not set
>>
>> #
>> # Watchdog Device Drivers
>> #
>> CONFIG_SOFT_WATCHDOG=3Dy
>> # CONFIG_DA9052_WATCHDOG is not set
>> # CONFIG_DA9055_WATCHDOG is not set
>> CONFIG_DA9062_WATCHDOG=3Dy
>> # CONFIG_MENF21BMC_WATCHDOG is not set
>> CONFIG_MENZ069_WATCHDOG=3Dy
>> # CONFIG_WDAT_WDT is not set
>> CONFIG_XILINX_WATCHDOG=3Dy
>> CONFIG_ZIIRAVE_WATCHDOG=3Dy
>> # CONFIG_RAVE_SP_WATCHDOG is not set
>> # CONFIG_CADENCE_WATCHDOG is not set
>> # CONFIG_DW_WATCHDOG is not set
>> CONFIG_TWL4030_WATCHDOG=3Dy
>> CONFIG_MAX63XX_WATCHDOG=3Dy
>> CONFIG_RETU_WATCHDOG=3Dy
>> # CONFIG_ACQUIRE_WDT is not set
>> # CONFIG_ADVANTECH_WDT is not set
>> CONFIG_ALIM1535_WDT=3Dy
>> CONFIG_ALIM7101_WDT=3Dy
>> # CONFIG_EBC_C384_WDT is not set
>> # CONFIG_F71808E_WDT is not set
>> CONFIG_SP5100_TCO=3Dy
>> # CONFIG_GEODE_WDT is not set
>> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
>> # CONFIG_EUROTECH_WDT is not set
>> CONFIG_IB700_WDT=3Dy
>> CONFIG_IBMASR=3Dy
>> # CONFIG_WAFER_WDT is not set
>> CONFIG_I6300ESB_WDT=3Dy
>> # CONFIG_IE6XX_WDT is not set
>> CONFIG_ITCO_WDT=3Dy
>> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
>> CONFIG_IT8712F_WDT=3Dy
>> CONFIG_IT87_WDT=3Dy
>> # CONFIG_HP_WATCHDOG is not set
>> # CONFIG_KEMPLD_WDT is not set
>> CONFIG_SC1200_WDT=3Dy
>> # CONFIG_PC87413_WDT is not set
>> CONFIG_NV_TCO=3Dy
>> # CONFIG_60XX_WDT is not set
>> CONFIG_SBC8360_WDT=3Dy
>> CONFIG_SBC7240_WDT=3Dy
>> # CONFIG_CPU5_WDT is not set
>> CONFIG_SMSC_SCH311X_WDT=3Dy
>> CONFIG_SMSC37B787_WDT=3Dy
>> CONFIG_VIA_WDT=3Dy
>> CONFIG_W83627HF_WDT=3Dy
>> # CONFIG_W83877F_WDT is not set
>> CONFIG_W83977F_WDT=3Dy
>> CONFIG_MACHZ_WDT=3Dy
>> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
>> CONFIG_INTEL_MEI_WDT=3Dy
>> # CONFIG_NI903X_WDT is not set
>> # CONFIG_NIC7018_WDT is not set
>> CONFIG_MEN_A21_WDT=3Dy
>> # CONFIG_XEN_WDT is not set
>>
>> #
>> # ISA-based Watchdog Cards
>> #
>> CONFIG_PCWATCHDOG=3Dy
>> CONFIG_MIXCOMWD=3Dy
>> # CONFIG_WDT is not set
>>
>> #
>> # PCI-based Watchdog Cards
>> #
>> CONFIG_PCIPCWATCHDOG=3Dy
>> CONFIG_WDTPCI=3Dy
>>
>> #
>> # USB-based Watchdog Cards
>> #
>> # CONFIG_USBPCWATCHDOG is not set
>>
>> #
>> # Watchdog Pretimeout Governors
>> #
>> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
>> CONFIG_SSB_POSSIBLE=3Dy
>> CONFIG_SSB=3Dy
>> CONFIG_SSB_SPROM=3Dy
>> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
>> CONFIG_SSB_PCIHOST=3Dy
>> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
>> # CONFIG_SSB_PCMCIAHOST is not set
>> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
>> # CONFIG_SSB_SDIOHOST is not set
>> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
>> CONFIG_SSB_DRIVER_PCICORE=3Dy
>> # CONFIG_SSB_DRIVER_GPIO is not set
>> CONFIG_BCMA_POSSIBLE=3Dy
>> CONFIG_BCMA=3Dy
>> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
>> # CONFIG_BCMA_HOST_PCI is not set
>> CONFIG_BCMA_HOST_SOC=3Dy
>> CONFIG_BCMA_DRIVER_PCI=3Dy
>> CONFIG_BCMA_SFLASH=3Dy
>> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
>> # CONFIG_BCMA_DRIVER_GPIO is not set
>> # CONFIG_BCMA_DEBUG is not set
>>
>> #
>> # Multifunction device drivers
>> #
>> CONFIG_MFD_CORE=3Dy
>> CONFIG_MFD_CS5535=3Dy
>> # CONFIG_MFD_AS3711 is not set
>> # CONFIG_PMIC_ADP5520 is not set
>> CONFIG_MFD_AAT2870_CORE=3Dy
>> CONFIG_MFD_BCM590XX=3Dy
>> CONFIG_MFD_BD9571MWV=3Dy
>> CONFIG_MFD_AXP20X=3Dy
>> CONFIG_MFD_AXP20X_I2C=3Dy
>> CONFIG_MFD_CROS_EC=3Dy
>> # CONFIG_MFD_CROS_EC_CHARDEV is not set
>> CONFIG_MFD_MADERA=3Dy
>> CONFIG_MFD_MADERA_I2C=3Dy
>> CONFIG_MFD_MADERA_SPI=3Dy
>> # CONFIG_MFD_CS47L35 is not set
>> CONFIG_MFD_CS47L85=3Dy
>> # CONFIG_MFD_CS47L90 is not set
>> CONFIG_PMIC_DA903X=3Dy
>> CONFIG_PMIC_DA9052=3Dy
>> # CONFIG_MFD_DA9052_SPI is not set
>> CONFIG_MFD_DA9052_I2C=3Dy
>> CONFIG_MFD_DA9055=3Dy
>> CONFIG_MFD_DA9062=3Dy
>> # CONFIG_MFD_DA9063 is not set
>> CONFIG_MFD_DA9150=3Dy
>> CONFIG_MFD_DLN2=3Dy
>> CONFIG_MFD_MC13XXX=3Dy
>> CONFIG_MFD_MC13XXX_SPI=3Dy
>> CONFIG_MFD_MC13XXX_I2C=3Dy
>> # CONFIG_HTC_PASIC3 is not set
>> # CONFIG_HTC_I2CPLD is not set
>> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
>> CONFIG_LPC_ICH=3Dy
>> CONFIG_LPC_SCH=3Dy
>> # CONFIG_INTEL_SOC_PMIC is not set
>> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
>> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
>> CONFIG_MFD_INTEL_LPSS=3Dy
>> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
>> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
>> CONFIG_MFD_JANZ_CMODIO=3Dy
>> CONFIG_MFD_KEMPLD=3Dy
>> CONFIG_MFD_88PM800=3Dy
>> CONFIG_MFD_88PM805=3Dy
>> # CONFIG_MFD_88PM860X is not set
>> CONFIG_MFD_MAX14577=3Dy
>> CONFIG_MFD_MAX77693=3Dy
>> CONFIG_MFD_MAX77843=3Dy
>> CONFIG_MFD_MAX8907=3Dy
>> # CONFIG_MFD_MAX8925 is not set
>> # CONFIG_MFD_MAX8997 is not set
>> CONFIG_MFD_MAX8998=3Dy
>> CONFIG_MFD_MT6397=3Dy
>> CONFIG_MFD_MENF21BMC=3Dy
>> # CONFIG_EZX_PCAP is not set
>> CONFIG_MFD_VIPERBOARD=3Dy
>> CONFIG_MFD_RETU=3Dy
>> # CONFIG_MFD_PCF50633 is not set
>> CONFIG_MFD_RDC321X=3Dy
>> CONFIG_MFD_RT5033=3Dy
>> # CONFIG_MFD_RC5T583 is not set
>> # CONFIG_MFD_SEC_CORE is not set
>> # CONFIG_MFD_SI476X_CORE is not set
>> CONFIG_MFD_SM501=3Dy
>> CONFIG_MFD_SM501_GPIO=3Dy
>> CONFIG_MFD_SKY81452=3Dy
>> # CONFIG_MFD_SMSC is not set
>> # CONFIG_ABX500_CORE is not set
>> CONFIG_MFD_SYSCON=3Dy
>> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
>> # CONFIG_MFD_LP3943 is not set
>> # CONFIG_MFD_LP8788 is not set
>> # CONFIG_MFD_TI_LMU is not set
>> # CONFIG_MFD_PALMAS is not set
>> # CONFIG_TPS6105X is not set
>> # CONFIG_TPS65010 is not set
>> CONFIG_TPS6507X=3Dy
>> CONFIG_MFD_TPS65086=3Dy
>> # CONFIG_MFD_TPS65090 is not set
>> # CONFIG_MFD_TPS68470 is not set
>> # CONFIG_MFD_TI_LP873X is not set
>> # CONFIG_MFD_TPS6586X is not set
>> # CONFIG_MFD_TPS65910 is not set
>> CONFIG_MFD_TPS65912=3Dy
>> CONFIG_MFD_TPS65912_I2C=3Dy
>> # CONFIG_MFD_TPS65912_SPI is not set
>> CONFIG_MFD_TPS80031=3Dy
>> CONFIG_TWL4030_CORE=3Dy
>> CONFIG_MFD_TWL4030_AUDIO=3Dy
>> # CONFIG_TWL6040_CORE is not set
>> CONFIG_MFD_WL1273_CORE=3Dy
>> # CONFIG_MFD_LM3533 is not set
>> # CONFIG_MFD_TIMBERDALE is not set
>> # CONFIG_MFD_VX855 is not set
>> CONFIG_MFD_ARIZONA=3Dy
>> CONFIG_MFD_ARIZONA_I2C=3Dy
>> CONFIG_MFD_ARIZONA_SPI=3Dy
>> # CONFIG_MFD_CS47L24 is not set
>> CONFIG_MFD_WM5102=3Dy
>> CONFIG_MFD_WM5110=3Dy
>> CONFIG_MFD_WM8997=3Dy
>> # CONFIG_MFD_WM8998 is not set
>> # CONFIG_MFD_WM8400 is not set
>> # CONFIG_MFD_WM831X_I2C is not set
>> # CONFIG_MFD_WM831X_SPI is not set
>> # CONFIG_MFD_WM8350_I2C is not set
>> # CONFIG_MFD_WM8994 is not set
>> CONFIG_RAVE_SP_CORE=3Dy
>> # CONFIG_REGULATOR is not set
>> CONFIG_CEC_CORE=3Dy
>> CONFIG_RC_CORE=3Dy
>> # CONFIG_RC_MAP is not set
>> # CONFIG_LIRC is not set
>> CONFIG_RC_DECODERS=3Dy
>> CONFIG_IR_NEC_DECODER=3Dy
>> # CONFIG_IR_RC5_DECODER is not set
>> CONFIG_IR_RC6_DECODER=3Dy
>> CONFIG_IR_JVC_DECODER=3Dy
>> # CONFIG_IR_SONY_DECODER is not set
>> # CONFIG_IR_SANYO_DECODER is not set
>> # CONFIG_IR_SHARP_DECODER is not set
>> # CONFIG_IR_MCE_KBD_DECODER is not set
>> CONFIG_IR_XMP_DECODER=3Dy
>> CONFIG_IR_IMON_DECODER=3Dy
>> # CONFIG_RC_DEVICES is not set
>> # CONFIG_MEDIA_SUPPORT is not set
>>
>> #
>> # Graphics support
>> #
>> CONFIG_AGP=3Dy
>> # CONFIG_AGP_ALI is not set
>> # CONFIG_AGP_ATI is not set
>> CONFIG_AGP_AMD=3Dy
>> # CONFIG_AGP_AMD64 is not set
>> CONFIG_AGP_INTEL=3Dy
>> # CONFIG_AGP_NVIDIA is not set
>> # CONFIG_AGP_SIS is not set
>> # CONFIG_AGP_SWORKS is not set
>> CONFIG_AGP_VIA=3Dy
>> # CONFIG_AGP_EFFICEON is not set
>> CONFIG_INTEL_GTT=3Dy
>> CONFIG_VGA_ARB=3Dy
>> CONFIG_VGA_ARB_MAX_GPUS=3D16
>> # CONFIG_VGA_SWITCHEROO is not set
>> CONFIG_DRM=3Dy
>> CONFIG_DRM_MIPI_DSI=3Dy
>> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
>> CONFIG_DRM_DEBUG_MM=3Dy
>> CONFIG_DRM_DEBUG_SELFTEST=3Dy
>> CONFIG_DRM_KMS_HELPER=3Dy
>> CONFIG_DRM_KMS_FB_HELPER=3Dy
>> CONFIG_DRM_FBDEV_EMULATION=3Dy
>> CONFIG_DRM_FBDEV_OVERALLOC=3D100
>> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
>> CONFIG_DRM_DP_CEC=3Dy
>> CONFIG_DRM_TTM=3Dy
>> CONFIG_DRM_VM=3Dy
>>
>> #
>> # I2C encoder or helper chips
>> #
>> # CONFIG_DRM_I2C_CH7006 is not set
>> CONFIG_DRM_I2C_SIL164=3Dy
>> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
>> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
>> CONFIG_DRM_RADEON=3Dy
>> CONFIG_DRM_RADEON_USERPTR=3Dy
>> # CONFIG_DRM_AMDGPU is not set
>>
>> #
>> # ACP (Audio CoProcessor) Configuration
>> #
>>
>> #
>> # AMD Library routines
>> #
>> CONFIG_DRM_NOUVEAU=3Dy
>> CONFIG_NOUVEAU_DEBUG=3D5
>> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
>> # CONFIG_NOUVEAU_DEBUG_MMU is not set
>> # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
>> CONFIG_DRM_I915=3Dy
>> # CONFIG_DRM_I915_ALPHA_SUPPORT is not set
>> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
>> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
>> CONFIG_DRM_I915_USERPTR=3Dy
>>
>> #
>> # drm/i915 Debugging
>> #
>> # CONFIG_DRM_I915_WERROR is not set
>> CONFIG_DRM_I915_DEBUG=3Dy
>> CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=3Dy
>> CONFIG_DRM_I915_SW_FENCE_CHECK_DAG=3Dy
>> CONFIG_DRM_I915_DEBUG_GUC=3Dy
>> CONFIG_DRM_I915_SELFTEST=3Dy
>> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS=3Dy
>> CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=3Dy
>> CONFIG_DRM_VGEM=3Dy
>> CONFIG_DRM_VKMS=3Dy
>> CONFIG_DRM_VMWGFX=3Dy
>> # CONFIG_DRM_VMWGFX_FBCON is not set
>> CONFIG_DRM_GMA500=3Dy
>> # CONFIG_DRM_GMA600 is not set
>> # CONFIG_DRM_GMA3600 is not set
>> CONFIG_DRM_UDL=3Dy
>> CONFIG_DRM_AST=3Dy
>> CONFIG_DRM_MGAG200=3Dy
>> CONFIG_DRM_CIRRUS_QEMU=3Dy
>> CONFIG_DRM_QXL=3Dy
>> CONFIG_DRM_BOCHS=3Dy
>> # CONFIG_DRM_VIRTIO_GPU is not set
>> CONFIG_DRM_PANEL=3Dy
>>
>> #
>> # Display Panels
>> #
>> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
>> CONFIG_DRM_BRIDGE=3Dy
>> CONFIG_DRM_PANEL_BRIDGE=3Dy
>>
>> #
>> # Display Interface Bridges
>> #
>> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
>> CONFIG_DRM_HISI_HIBMC=3Dy
>> # CONFIG_DRM_TINYDRM is not set
>> # CONFIG_DRM_XEN is not set
>> # CONFIG_DRM_LEGACY is not set
>> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
>> CONFIG_DRM_LIB_RANDOM=3Dy
>>
>> #
>> # Frame buffer Devices
>> #
>> CONFIG_FB=3Dy
>> CONFIG_FIRMWARE_EDID=3Dy
>> CONFIG_FB_CMDLINE=3Dy
>> CONFIG_FB_NOTIFY=3Dy
>> CONFIG_FB_DDC=3Dy
>> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
>> CONFIG_FB_CFB_FILLRECT=3Dy
>> CONFIG_FB_CFB_COPYAREA=3Dy
>> CONFIG_FB_CFB_IMAGEBLIT=3Dy
>> CONFIG_FB_SYS_FILLRECT=3Dy
>> CONFIG_FB_SYS_COPYAREA=3Dy
>> CONFIG_FB_SYS_IMAGEBLIT=3Dy
>> # CONFIG_FB_FOREIGN_ENDIAN is not set
>> CONFIG_FB_SYS_FOPS=3Dy
>> CONFIG_FB_DEFERRED_IO=3Dy
>> CONFIG_FB_HECUBA=3Dy
>> CONFIG_FB_SVGALIB=3Dy
>> CONFIG_FB_BACKLIGHT=3Dy
>> CONFIG_FB_MODE_HELPERS=3Dy
>> CONFIG_FB_TILEBLITTING=3Dy
>>
>> #
>> # Frame buffer hardware drivers
>> #
>> CONFIG_FB_CIRRUS=3Dy
>> CONFIG_FB_PM2=3Dy
>> # CONFIG_FB_PM2_FIFO_DISCONNECT is not set
>> # CONFIG_FB_CYBER2000 is not set
>> # CONFIG_FB_ARC is not set
>> CONFIG_FB_ASILIANT=3Dy
>> CONFIG_FB_IMSTT=3Dy
>> # CONFIG_FB_VGA16 is not set
>> CONFIG_FB_VESA=3Dy
>> CONFIG_FB_N411=3Dy
>> CONFIG_FB_HGA=3Dy
>> CONFIG_FB_OPENCORES=3Dy
>> CONFIG_FB_S1D13XXX=3Dy
>> # CONFIG_FB_NVIDIA is not set
>> CONFIG_FB_RIVA=3Dy
>> # CONFIG_FB_RIVA_I2C is not set
>> # CONFIG_FB_RIVA_DEBUG is not set
>> CONFIG_FB_RIVA_BACKLIGHT=3Dy
>> # CONFIG_FB_I740 is not set
>> CONFIG_FB_I810=3Dy
>> CONFIG_FB_I810_GTF=3Dy
>> CONFIG_FB_I810_I2C=3Dy
>> CONFIG_FB_LE80578=3Dy
>> CONFIG_FB_CARILLO_RANCH=3Dy
>> # CONFIG_FB_MATROX is not set
>> CONFIG_FB_RADEON=3Dy
>> # CONFIG_FB_RADEON_I2C is not set
>> CONFIG_FB_RADEON_BACKLIGHT=3Dy
>> # CONFIG_FB_RADEON_DEBUG is not set
>> # CONFIG_FB_ATY128 is not set
>> CONFIG_FB_ATY=3Dy
>> CONFIG_FB_ATY_CT=3Dy
>> # CONFIG_FB_ATY_GENERIC_LCD is not set
>> CONFIG_FB_ATY_GX=3Dy
>> CONFIG_FB_ATY_BACKLIGHT=3Dy
>> # CONFIG_FB_S3 is not set
>> CONFIG_FB_SAVAGE=3Dy
>> # CONFIG_FB_SAVAGE_I2C is not set
>> CONFIG_FB_SAVAGE_ACCEL=3Dy
>> CONFIG_FB_SIS=3Dy
>> # CONFIG_FB_SIS_300 is not set
>> CONFIG_FB_SIS_315=3Dy
>> CONFIG_FB_VIA=3Dy
>> CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
>> CONFIG_FB_VIA_X_COMPATIBILITY=3Dy
>> # CONFIG_FB_NEOMAGIC is not set
>> # CONFIG_FB_KYRO is not set
>> # CONFIG_FB_3DFX is not set
>> CONFIG_FB_VOODOO1=3Dy
>> CONFIG_FB_VT8623=3Dy
>> CONFIG_FB_TRIDENT=3Dy
>> CONFIG_FB_ARK=3Dy
>> # CONFIG_FB_PM3 is not set
>> CONFIG_FB_CARMINE=3Dy
>> CONFIG_FB_CARMINE_DRAM_EVAL=3Dy
>> # CONFIG_CARMINE_DRAM_CUSTOM is not set
>> # CONFIG_FB_GEODE is not set
>> CONFIG_FB_SM501=3Dy
>> CONFIG_FB_SMSCUFX=3Dy
>> CONFIG_FB_UDL=3Dy
>> CONFIG_FB_IBM_GXT4500=3Dy
>> CONFIG_FB_GOLDFISH=3Dy
>> CONFIG_FB_VIRTUAL=3Dy
>> CONFIG_XEN_FBDEV_FRONTEND=3Dy
>> CONFIG_FB_METRONOME=3Dy
>> CONFIG_FB_MB862XX=3Dy
>> CONFIG_FB_MB862XX_PCI_GDC=3Dy
>> CONFIG_FB_MB862XX_I2C=3Dy
>> CONFIG_FB_BROADSHEET=3Dy
>> CONFIG_FB_SIMPLE=3Dy
>> CONFIG_FB_SM712=3Dy
>> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>> CONFIG_LCD_CLASS_DEVICE=3Dy
>> CONFIG_LCD_L4F00242T03=3Dy
>> # CONFIG_LCD_LMS283GF05 is not set
>> # CONFIG_LCD_LTV350QV is not set
>> CONFIG_LCD_ILI922X=3Dy
>> # CONFIG_LCD_ILI9320 is not set
>> # CONFIG_LCD_TDO24M is not set
>> # CONFIG_LCD_VGG2432A4 is not set
>> CONFIG_LCD_PLATFORM=3Dy
>> CONFIG_LCD_S6E63M0=3Dy
>> CONFIG_LCD_LD9040=3Dy
>> # CONFIG_LCD_AMS369FG06 is not set
>> CONFIG_LCD_LMS501KF03=3Dy
>> CONFIG_LCD_HX8357=3Dy
>> # CONFIG_LCD_OTM3225A is not set
>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> CONFIG_BACKLIGHT_GENERIC=3Dy
>> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dy
>> CONFIG_BACKLIGHT_PWM=3Dy
>> CONFIG_BACKLIGHT_DA903X=3Dy
>> # CONFIG_BACKLIGHT_DA9052 is not set
>> # CONFIG_BACKLIGHT_APPLE is not set
>> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
>> CONFIG_BACKLIGHT_SAHARA=3Dy
>> # CONFIG_BACKLIGHT_ADP8860 is not set
>> # CONFIG_BACKLIGHT_ADP8870 is not set
>> CONFIG_BACKLIGHT_AAT2870=3Dy
>> CONFIG_BACKLIGHT_LM3630A=3Dy
>> CONFIG_BACKLIGHT_LM3639=3Dy
>> CONFIG_BACKLIGHT_LP855X=3Dy
>> CONFIG_BACKLIGHT_PANDORA=3Dy
>> # CONFIG_BACKLIGHT_SKY81452 is not set
>> CONFIG_BACKLIGHT_GPIO=3Dy
>> CONFIG_BACKLIGHT_LV5207LP=3Dy
>> CONFIG_BACKLIGHT_BD6107=3Dy
>> CONFIG_BACKLIGHT_ARCXCNN=3Dy
>> # CONFIG_BACKLIGHT_RAVE_SP is not set
>> CONFIG_VGASTATE=3Dy
>> CONFIG_HDMI=3Dy
>> CONFIG_LOGO=3Dy
>> # CONFIG_LOGO_LINUX_MONO is not set
>> CONFIG_LOGO_LINUX_VGA16=3Dy
>> # CONFIG_LOGO_LINUX_CLUT224 is not set
>> CONFIG_SOUND=3Dy
>> # CONFIG_SND is not set
>>
>> #
>> # HID support
>> #
>> CONFIG_HID=3Dy
>> # CONFIG_HID_BATTERY_STRENGTH is not set
>> # CONFIG_HIDRAW is not set
>> CONFIG_UHID=3Dy
>> CONFIG_HID_GENERIC=3Dy
>>
>> #
>> # Special HID drivers
>> #
>> CONFIG_HID_A4TECH=3Dy
>> # CONFIG_HID_ACRUX is not set
>> CONFIG_HID_APPLE=3Dy
>> # CONFIG_HID_ASUS is not set
>> CONFIG_HID_AUREAL=3Dy
>> CONFIG_HID_BELKIN=3Dy
>> CONFIG_HID_CHERRY=3Dy
>> CONFIG_HID_CHICONY=3Dy
>> CONFIG_HID_CORSAIR=3Dy
>> # CONFIG_HID_COUGAR is not set
>> CONFIG_HID_CMEDIA=3Dy
>> CONFIG_HID_CYPRESS=3Dy
>> CONFIG_HID_DRAGONRISE=3Dy
>> # CONFIG_DRAGONRISE_FF is not set
>> # CONFIG_HID_EMS_FF is not set
>> CONFIG_HID_ELECOM=3Dy
>> CONFIG_HID_EZKEY=3Dy
>> # CONFIG_HID_GEMBIRD is not set
>> # CONFIG_HID_GFRM is not set
>> # CONFIG_HID_KEYTOUCH is not set
>> # CONFIG_HID_KYE is not set
>> # CONFIG_HID_WALTOP is not set
>> CONFIG_HID_GYRATION=3Dy
>> # CONFIG_HID_ICADE is not set
>> CONFIG_HID_ITE=3Dy
>> CONFIG_HID_JABRA=3Dy
>> # CONFIG_HID_TWINHAN is not set
>> CONFIG_HID_KENSINGTON=3Dy
>> # CONFIG_HID_LCPOWER is not set
>> CONFIG_HID_LED=3Dy
>> CONFIG_HID_LENOVO=3Dy
>> CONFIG_HID_LOGITECH=3Dy
>> # CONFIG_HID_LOGITECH_HIDPP is not set
>> CONFIG_LOGITECH_FF=3Dy
>> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
>> # CONFIG_LOGIG940_FF is not set
>> # CONFIG_LOGIWHEELS_FF is not set
>> CONFIG_HID_MAGICMOUSE=3Dy
>> CONFIG_HID_MAYFLASH=3Dy
>> # CONFIG_HID_REDRAGON is not set
>> # CONFIG_HID_MICROSOFT is not set
>> # CONFIG_HID_MONTEREY is not set
>> CONFIG_HID_MULTITOUCH=3Dy
>> CONFIG_HID_NTI=3Dy
>> CONFIG_HID_ORTEK=3Dy
>> CONFIG_HID_PANTHERLORD=3Dy
>> CONFIG_PANTHERLORD_FF=3Dy
>> # CONFIG_HID_PETALYNX is not set
>> # CONFIG_HID_PICOLCD is not set
>> CONFIG_HID_PLANTRONICS=3Dy
>> # CONFIG_HID_PRIMAX is not set
>> # CONFIG_HID_SAITEK is not set
>> # CONFIG_HID_SAMSUNG is not set
>> CONFIG_HID_SPEEDLINK=3Dy
>> CONFIG_HID_STEAM=3Dy
>> CONFIG_HID_STEELSERIES=3Dy
>> # CONFIG_HID_SUNPLUS is not set
>> CONFIG_HID_RMI=3Dy
>> CONFIG_HID_GREENASIA=3Dy
>> # CONFIG_GREENASIA_FF is not set
>> # CONFIG_HID_SMARTJOYPLUS is not set
>> CONFIG_HID_TIVO=3Dy
>> CONFIG_HID_TOPSEED=3Dy
>> CONFIG_HID_THINGM=3Dy
>> CONFIG_HID_THRUSTMASTER=3Dy
>> CONFIG_THRUSTMASTER_FF=3Dy
>> CONFIG_HID_UDRAW_PS3=3Dy
>> CONFIG_HID_WIIMOTE=3Dy
>> CONFIG_HID_XINMO=3Dy
>> CONFIG_HID_ZEROPLUS=3Dy
>> # CONFIG_ZEROPLUS_FF is not set
>> # CONFIG_HID_ZYDACRON is not set
>> CONFIG_HID_SENSOR_HUB=3Dy
>> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
>> CONFIG_HID_ALPS=3Dy
>>
>> #
>> # USB HID support
>> #
>> # CONFIG_USB_HID is not set
>> # CONFIG_HID_PID is not set
>>
>> #
>> # USB HID Boot Protocol drivers
>> #
>> CONFIG_USB_KBD=3Dy
>> CONFIG_USB_MOUSE=3Dy
>>
>> #
>> # I2C HID support
>> #
>> # CONFIG_I2C_HID is not set
>> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
>> CONFIG_USB_SUPPORT=3Dy
>> CONFIG_USB_COMMON=3Dy
>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>> CONFIG_USB=3Dy
>> CONFIG_USB_PCI=3Dy
>> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
>>
>> #
>> # Miscellaneous USB options
>> #
>> CONFIG_USB_DEFAULT_PERSIST=3Dy
>> # CONFIG_USB_DYNAMIC_MINORS is not set
>> CONFIG_USB_OTG=3Dy
>> CONFIG_USB_OTG_WHITELIST=3Dy
>> CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
>> CONFIG_USB_OTG_FSM=3Dy
>> # CONFIG_USB_MON is not set
>> CONFIG_USB_WUSB_CBAF=3Dy
>> # CONFIG_USB_WUSB_CBAF_DEBUG is not set
>>
>> #
>> # USB Host Controller Drivers
>> #
>> CONFIG_USB_C67X00_HCD=3Dy
>> CONFIG_USB_XHCI_HCD=3Dy
>> # CONFIG_USB_XHCI_DBGCAP is not set
>> CONFIG_USB_XHCI_PCI=3Dy
>> CONFIG_USB_XHCI_PLATFORM=3Dy
>> CONFIG_USB_EHCI_HCD=3Dy
>> # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
>> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
>> CONFIG_USB_EHCI_PCI=3Dy
>> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>> CONFIG_USB_OXU210HP_HCD=3Dy
>> CONFIG_USB_ISP116X_HCD=3Dy
>> # CONFIG_USB_FOTG210_HCD is not set
>> CONFIG_USB_MAX3421_HCD=3Dy
>> CONFIG_USB_OHCI_HCD=3Dy
>> CONFIG_USB_OHCI_HCD_PCI=3Dy
>> # CONFIG_USB_OHCI_HCD_SSB is not set
>> CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
>> CONFIG_USB_UHCI_HCD=3Dy
>> CONFIG_USB_U132_HCD=3Dy
>> CONFIG_USB_SL811_HCD=3Dy
>> CONFIG_USB_SL811_HCD_ISO=3Dy
>> # CONFIG_USB_SL811_CS is not set
>> # CONFIG_USB_R8A66597_HCD is not set
>> CONFIG_USB_HCD_BCMA=3Dy
>> # CONFIG_USB_HCD_SSB is not set
>> # CONFIG_USB_HCD_TEST_MODE is not set
>>
>> #
>> # USB Device Class drivers
>> #
>> # CONFIG_USB_ACM is not set
>> CONFIG_USB_PRINTER=3Dy
>> CONFIG_USB_WDM=3Dy
>> # CONFIG_USB_TMC is not set
>>
>> #
>> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
>> #
>>
>> #
>> # also be needed; see USB_STORAGE Help for more info
>> #
>>
>> #
>> # USB Imaging devices
>> #
>> # CONFIG_USB_MDC800 is not set
>> # CONFIG_USBIP_CORE is not set
>> CONFIG_USB_MUSB_HDRC=3Dy
>> CONFIG_USB_MUSB_HOST=3Dy
>>
>> #
>> # Platform Glue Layer
>> #
>>
>> #
>> # MUSB DMA mode
>> #
>> # CONFIG_MUSB_PIO_ONLY is not set
>> # CONFIG_USB_DWC3 is not set
>> # CONFIG_USB_DWC2 is not set
>> # CONFIG_USB_CHIPIDEA is not set
>> CONFIG_USB_ISP1760=3Dy
>> CONFIG_USB_ISP1760_HCD=3Dy
>> CONFIG_USB_ISP1760_HOST_ROLE=3Dy
>>
>> #
>> # USB port drivers
>> #
>> # CONFIG_USB_SERIAL is not set
>>
>> #
>> # USB Miscellaneous drivers
>> #
>> # CONFIG_USB_EMI62 is not set
>> CONFIG_USB_EMI26=3Dy
>> CONFIG_USB_ADUTUX=3Dy
>> CONFIG_USB_SEVSEG=3Dy
>> # CONFIG_USB_RIO500 is not set
>> CONFIG_USB_LEGOTOWER=3Dy
>> CONFIG_USB_LCD=3Dy
>> CONFIG_USB_CYPRESS_CY7C63=3Dy
>> CONFIG_USB_CYTHERM=3Dy
>> CONFIG_USB_IDMOUSE=3Dy
>> CONFIG_USB_FTDI_ELAN=3Dy
>> CONFIG_USB_APPLEDISPLAY=3Dy
>> CONFIG_USB_SISUSBVGA=3Dy
>> CONFIG_USB_LD=3Dy
>> CONFIG_USB_TRANCEVIBRATOR=3Dy
>> CONFIG_USB_IOWARRIOR=3Dy
>> # CONFIG_USB_TEST is not set
>> CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
>> CONFIG_USB_ISIGHTFW=3Dy
>> # CONFIG_USB_YUREX is not set
>> CONFIG_USB_EZUSB_FX2=3Dy
>> CONFIG_USB_HUB_USB251XB=3Dy
>> # CONFIG_USB_HSIC_USB3503 is not set
>> CONFIG_USB_HSIC_USB4604=3Dy
>> # CONFIG_USB_LINK_LAYER_TEST is not set
>> CONFIG_USB_CHAOSKEY=3Dy
>>
>> #
>> # USB Physical Layer drivers
>> #
>> CONFIG_USB_PHY=3Dy
>> # CONFIG_NOP_USB_XCEIV is not set
>> CONFIG_USB_GPIO_VBUS=3Dy
>> CONFIG_TAHVO_USB=3Dy
>> # CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
>> # CONFIG_USB_ISP1301 is not set
>> # CONFIG_USB_GADGET is not set
>> CONFIG_TYPEC=3Dy
>> CONFIG_TYPEC_TCPM=3Dy
>> CONFIG_TYPEC_TCPCI=3Dy
>> CONFIG_TYPEC_RT1711H=3Dy
>> CONFIG_TYPEC_FUSB302=3Dy
>> CONFIG_TYPEC_UCSI=3Dy
>> # CONFIG_UCSI_ACPI is not set
>> CONFIG_TYPEC_TPS6598X=3Dy
>>
>> #
>> # USB Type-C Multiplexer/DeMultiplexer Switch support
>> #
>> CONFIG_TYPEC_MUX_PI3USB30532=3Dy
>>
>> #
>> # USB Type-C Alternate Mode drivers
>> #
>> CONFIG_TYPEC_DP_ALTMODE=3Dy
>> # CONFIG_USB_ROLES_INTEL_XHCI is not set
>> CONFIG_USB_ULPI_BUS=3Dy
>> CONFIG_USB_ROLE_SWITCH=3Dy
>> # CONFIG_UWB is not set
>> CONFIG_MMC=3Dy
>> # CONFIG_SDIO_UART is not set
>> CONFIG_MMC_TEST=3Dy
>>
>> #
>> # MMC/SD/SDIO Host Controller Drivers
>> #
>> CONFIG_MMC_DEBUG=3Dy
>> # CONFIG_MMC_SDHCI is not set
>> CONFIG_MMC_WBSD=3Dy
>> # CONFIG_MMC_TIFM_SD is not set
>> CONFIG_MMC_GOLDFISH=3Dy
>> CONFIG_MMC_SPI=3Dy
>> CONFIG_MMC_SDRICOH_CS=3Dy
>> CONFIG_MMC_CB710=3Dy
>> # CONFIG_MMC_VIA_SDMMC is not set
>> CONFIG_MMC_VUB300=3Dy
>> # CONFIG_MMC_USHC is not set
>> CONFIG_MMC_USDHI6ROL0=3Dy
>> CONFIG_MMC_REALTEK_PCI=3Dy
>> CONFIG_MMC_CQHCI=3Dy
>> # CONFIG_MMC_TOSHIBA_PCI is not set
>> CONFIG_MMC_MTK=3Dy
>> CONFIG_MEMSTICK=3Dy
>> CONFIG_MEMSTICK_DEBUG=3Dy
>>
>> #
>> # MemoryStick drivers
>> #
>> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
>>
>> #
>> # MemoryStick Host Controller Drivers
>> #
>> CONFIG_MEMSTICK_TIFM_MS=3Dy
>> # CONFIG_MEMSTICK_JMICRON_38X is not set
>> CONFIG_MEMSTICK_R592=3Dy
>> # CONFIG_MEMSTICK_REALTEK_PCI is not set
>> CONFIG_NEW_LEDS=3Dy
>> CONFIG_LEDS_CLASS=3Dy
>> CONFIG_LEDS_CLASS_FLASH=3Dy
>> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
>>
>> #
>> # LED drivers
>> #
>> CONFIG_LEDS_AS3645A=3Dy
>> CONFIG_LEDS_LM3530=3Dy
>> CONFIG_LEDS_LM3642=3Dy
>> CONFIG_LEDS_LM3601X=3Dy
>> # CONFIG_LEDS_MT6323 is not set
>> CONFIG_LEDS_PCA9532=3Dy
>> # CONFIG_LEDS_PCA9532_GPIO is not set
>> CONFIG_LEDS_GPIO=3Dy
>> # CONFIG_LEDS_LP3944 is not set
>> CONFIG_LEDS_LP3952=3Dy
>> CONFIG_LEDS_LP55XX_COMMON=3Dy
>> CONFIG_LEDS_LP5521=3Dy
>> CONFIG_LEDS_LP5523=3Dy
>> CONFIG_LEDS_LP5562=3Dy
>> CONFIG_LEDS_LP8501=3Dy
>> # CONFIG_LEDS_PCA955X is not set
>> # CONFIG_LEDS_PCA963X is not set
>> CONFIG_LEDS_DA903X=3Dy
>> CONFIG_LEDS_DA9052=3Dy
>> # CONFIG_LEDS_DAC124S085 is not set
>> CONFIG_LEDS_PWM=3Dy
>> # CONFIG_LEDS_BD2802 is not set
>> # CONFIG_LEDS_LT3593 is not set
>> # CONFIG_LEDS_MC13783 is not set
>> # CONFIG_LEDS_TCA6507 is not set
>> # CONFIG_LEDS_TLC591XX is not set
>> CONFIG_LEDS_LM355x=3Dy
>> CONFIG_LEDS_OT200=3Dy
>> CONFIG_LEDS_MENF21BMC=3Dy
>>
>> #
>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_=
THINGM)
>> #
>> CONFIG_LEDS_BLINKM=3Dy
>> CONFIG_LEDS_MLXREG=3Dy
>> CONFIG_LEDS_USER=3Dy
>> # CONFIG_LEDS_NIC78BX is not set
>>
>> #
>> # LED Triggers
>> #
>> # CONFIG_LEDS_TRIGGERS is not set
>> # CONFIG_ACCESSIBILITY is not set
>> # CONFIG_INFINIBAND is not set
>> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>> CONFIG_EDAC_SUPPORT=3Dy
>> # CONFIG_EDAC is not set
>> CONFIG_RTC_LIB=3Dy
>> CONFIG_RTC_MC146818_LIB=3Dy
>> CONFIG_RTC_CLASS=3Dy
>> CONFIG_RTC_HCTOSYS=3Dy
>> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
>> CONFIG_RTC_SYSTOHC=3Dy
>> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
>> CONFIG_RTC_DEBUG=3Dy
>> # CONFIG_RTC_NVMEM is not set
>>
>> #
>> # RTC interfaces
>> #
>> # CONFIG_RTC_INTF_SYSFS is not set
>> CONFIG_RTC_INTF_PROC=3Dy
>> # CONFIG_RTC_INTF_DEV is not set
>> # CONFIG_RTC_DRV_TEST is not set
>>
>> #
>> # I2C RTC drivers
>> #
>> CONFIG_RTC_DRV_88PM80X=3Dy
>> CONFIG_RTC_DRV_ABB5ZES3=3Dy
>> CONFIG_RTC_DRV_ABX80X=3Dy
>> CONFIG_RTC_DRV_DS1307=3Dy
>> CONFIG_RTC_DRV_DS1307_CENTURY=3Dy
>> CONFIG_RTC_DRV_DS1374=3Dy
>> CONFIG_RTC_DRV_DS1374_WDT=3Dy
>> CONFIG_RTC_DRV_DS1672=3Dy
>> CONFIG_RTC_DRV_MAX6900=3Dy
>> CONFIG_RTC_DRV_MAX8907=3Dy
>> # CONFIG_RTC_DRV_MAX8998 is not set
>> # CONFIG_RTC_DRV_RS5C372 is not set
>> # CONFIG_RTC_DRV_ISL1208 is not set
>> CONFIG_RTC_DRV_ISL12022=3Dy
>> CONFIG_RTC_DRV_X1205=3Dy
>> CONFIG_RTC_DRV_PCF8523=3Dy
>> CONFIG_RTC_DRV_PCF85063=3Dy
>> CONFIG_RTC_DRV_PCF85363=3Dy
>> CONFIG_RTC_DRV_PCF8563=3Dy
>> # CONFIG_RTC_DRV_PCF8583 is not set
>> CONFIG_RTC_DRV_M41T80=3Dy
>> # CONFIG_RTC_DRV_M41T80_WDT is not set
>> CONFIG_RTC_DRV_BQ32K=3Dy
>> # CONFIG_RTC_DRV_TPS80031 is not set
>> CONFIG_RTC_DRV_S35390A=3Dy
>> CONFIG_RTC_DRV_FM3130=3Dy
>> CONFIG_RTC_DRV_RX8010=3Dy
>> CONFIG_RTC_DRV_RX8581=3Dy
>> # CONFIG_RTC_DRV_RX8025 is not set
>> CONFIG_RTC_DRV_EM3027=3Dy
>> CONFIG_RTC_DRV_RV8803=3Dy
>>
>> #
>> # SPI RTC drivers
>> #
>> CONFIG_RTC_DRV_M41T93=3Dy
>> CONFIG_RTC_DRV_M41T94=3Dy
>> CONFIG_RTC_DRV_DS1302=3Dy
>> CONFIG_RTC_DRV_DS1305=3Dy
>> # CONFIG_RTC_DRV_DS1343 is not set
>> CONFIG_RTC_DRV_DS1347=3Dy
>> CONFIG_RTC_DRV_DS1390=3Dy
>> # CONFIG_RTC_DRV_MAX6916 is not set
>> CONFIG_RTC_DRV_R9701=3Dy
>> CONFIG_RTC_DRV_RX4581=3Dy
>> CONFIG_RTC_DRV_RX6110=3Dy
>> CONFIG_RTC_DRV_RS5C348=3Dy
>> CONFIG_RTC_DRV_MAX6902=3Dy
>> CONFIG_RTC_DRV_PCF2123=3Dy
>> CONFIG_RTC_DRV_MCP795=3Dy
>> CONFIG_RTC_I2C_AND_SPI=3Dy
>>
>> #
>> # SPI and I2C RTC drivers
>> #
>> CONFIG_RTC_DRV_DS3232=3Dy
>> # CONFIG_RTC_DRV_DS3232_HWMON is not set
>> # CONFIG_RTC_DRV_PCF2127 is not set
>> # CONFIG_RTC_DRV_RV3029C2 is not set
>>
>> #
>> # Platform RTC drivers
>> #
>> CONFIG_RTC_DRV_CMOS=3Dy
>> # CONFIG_RTC_DRV_DS1286 is not set
>> CONFIG_RTC_DRV_DS1511=3Dy
>> CONFIG_RTC_DRV_DS1553=3Dy
>> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
>> # CONFIG_RTC_DRV_DS1685 is not set
>> # CONFIG_RTC_DRV_DS1689 is not set
>> CONFIG_RTC_DRV_DS17285=3Dy
>> # CONFIG_RTC_DRV_DS17485 is not set
>> # CONFIG_RTC_DRV_DS17885 is not set
>> # CONFIG_RTC_DS1685_PROC_REGS is not set
>> # CONFIG_RTC_DRV_DS1742 is not set
>> # CONFIG_RTC_DRV_DS2404 is not set
>> CONFIG_RTC_DRV_DA9052=3Dy
>> CONFIG_RTC_DRV_DA9055=3Dy
>> # CONFIG_RTC_DRV_DA9063 is not set
>> # CONFIG_RTC_DRV_STK17TA8 is not set
>> CONFIG_RTC_DRV_M48T86=3Dy
>> # CONFIG_RTC_DRV_M48T35 is not set
>> # CONFIG_RTC_DRV_M48T59 is not set
>> # CONFIG_RTC_DRV_MSM6242 is not set
>> CONFIG_RTC_DRV_BQ4802=3Dy
>> CONFIG_RTC_DRV_RP5C01=3Dy
>> # CONFIG_RTC_DRV_V3020 is not set
>> # CONFIG_RTC_DRV_CROS_EC is not set
>>
>> #
>> # on-CPU RTC drivers
>> #
>> # CONFIG_RTC_DRV_FTRTC010 is not set
>> # CONFIG_RTC_DRV_MC13XXX is not set
>> CONFIG_RTC_DRV_MT6397=3Dy
>>
>> #
>> # HID Sensor RTC drivers
>> #
>> CONFIG_DMADEVICES=3Dy
>> CONFIG_DMADEVICES_DEBUG=3Dy
>> CONFIG_DMADEVICES_VDEBUG=3Dy
>>
>> #
>> # DMA Devices
>> #
>> CONFIG_DMA_ENGINE=3Dy
>> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
>> CONFIG_DMA_ACPI=3Dy
>> # CONFIG_ALTERA_MSGDMA is not set
>> CONFIG_INTEL_IDMA64=3Dy
>> CONFIG_PCH_DMA=3Dy
>> # CONFIG_QCOM_HIDMA_MGMT is not set
>> CONFIG_QCOM_HIDMA=3Dy
>> CONFIG_DW_DMAC_CORE=3Dy
>> CONFIG_DW_DMAC=3Dy
>> CONFIG_DW_DMAC_PCI=3Dy
>> CONFIG_HSU_DMA=3Dy
>>
>> #
>> # DMA Clients
>> #
>> # CONFIG_ASYNC_TX_DMA is not set
>> CONFIG_DMATEST=3Dy
>> CONFIG_DMA_ENGINE_RAID=3Dy
>>
>> #
>> # DMABUF options
>> #
>> CONFIG_SYNC_FILE=3Dy
>> CONFIG_SW_SYNC=3Dy
>> # CONFIG_AUXDISPLAY is not set
>> # CONFIG_UIO is not set
>> CONFIG_VIRT_DRIVERS=3Dy
>> CONFIG_VBOXGUEST=3Dy
>> CONFIG_VIRTIO=3Dy
>> CONFIG_VIRTIO_MENU=3Dy
>> # CONFIG_VIRTIO_PCI is not set
>> # CONFIG_VIRTIO_BALLOON is not set
>> CONFIG_VIRTIO_INPUT=3Dy
>> # CONFIG_VIRTIO_MMIO is not set
>>
>> #
>> # Microsoft Hyper-V guest support
>> #
>> # CONFIG_HYPERV is not set
>>
>> #
>> # Xen driver support
>> #
>> # CONFIG_XEN_BALLOON is not set
>> # CONFIG_XEN_DEV_EVTCHN is not set
>> CONFIG_XEN_BACKEND=3Dy
>> # CONFIG_XENFS is not set
>> CONFIG_XEN_SYS_HYPERVISOR=3Dy
>> CONFIG_XEN_XENBUS_FRONTEND=3Dy
>> # CONFIG_XEN_GNTDEV is not set
>> # CONFIG_XEN_GRANT_DEV_ALLOC is not set
>> # CONFIG_XEN_GRANT_DMA_ALLOC is not set
>> CONFIG_SWIOTLB_XEN=3Dy
>> CONFIG_XEN_TMEM=3Dy
>> CONFIG_XEN_PCIDEV_BACKEND=3Dy
>> # CONFIG_XEN_PVCALLS_FRONTEND is not set
>> # CONFIG_XEN_PVCALLS_BACKEND is not set
>> CONFIG_XEN_PRIVCMD=3Dy
>> CONFIG_XEN_HAVE_PVMMU=3Dy
>> CONFIG_XEN_ACPI=3Dy
>> CONFIG_XEN_HAVE_VPMU=3Dy
>> CONFIG_STAGING=3Dy
>> # CONFIG_COMEDI is not set
>> # CONFIG_R8712U is not set
>>
>> #
>> # IIO staging drivers
>> #
>>
>> #
>> # Accelerometers
>> #
>> # CONFIG_ADIS16203 is not set
>> # CONFIG_ADIS16240 is not set
>>
>> #
>> # Analog to digital converters
>> #
>> # CONFIG_AD7606 is not set
>> CONFIG_AD7780=3Dy
>> # CONFIG_AD7816 is not set
>> # CONFIG_AD7192 is not set
>> CONFIG_AD7280=3Dy
>>
>> #
>> # Analog digital bi-direction converters
>> #
>> CONFIG_ADT7316=3Dy
>> CONFIG_ADT7316_SPI=3Dy
>> # CONFIG_ADT7316_I2C is not set
>>
>> #
>> # Capacitance to digital converters
>> #
>> CONFIG_AD7150=3Dy
>> # CONFIG_AD7152 is not set
>> # CONFIG_AD7746 is not set
>>
>> #
>> # Direct Digital Synthesis
>> #
>> # CONFIG_AD9832 is not set
>> CONFIG_AD9834=3Dy
>>
>> #
>> # Network Analyzer, Impedance Converters
>> #
>> CONFIG_AD5933=3Dy
>>
>> #
>> # Active energy metering IC
>> #
>> CONFIG_ADE7854=3Dy
>> CONFIG_ADE7854_I2C=3Dy
>> CONFIG_ADE7854_SPI=3Dy
>>
>> #
>> # Resolver to digital converters
>> #
>> # CONFIG_AD2S90 is not set
>> CONFIG_AD2S1210=3Dy
>> CONFIG_FB_SM750=3Dy
>> # CONFIG_FB_XGI is not set
>>
>> #
>> # Speakup console speech
>> #
>> CONFIG_STAGING_MEDIA=3Dy
>>
>> #
>> # Android
>> #
>> CONFIG_GOLDFISH_AUDIO=3Dy
>> # CONFIG_DGNC is not set
>> # CONFIG_GS_FPGABOOT is not set
>> CONFIG_UNISYSSPAR=3Dy
>> CONFIG_FB_TFT=3Dy
>> CONFIG_FB_TFT_AGM1264K_FL=3Dy
>> CONFIG_FB_TFT_BD663474=3Dy
>> # CONFIG_FB_TFT_HX8340BN is not set
>> CONFIG_FB_TFT_HX8347D=3Dy
>> CONFIG_FB_TFT_HX8353D=3Dy
>> # CONFIG_FB_TFT_HX8357D is not set
>> CONFIG_FB_TFT_ILI9163=3Dy
>> CONFIG_FB_TFT_ILI9320=3Dy
>> CONFIG_FB_TFT_ILI9325=3Dy
>> CONFIG_FB_TFT_ILI9340=3Dy
>> CONFIG_FB_TFT_ILI9341=3Dy
>> CONFIG_FB_TFT_ILI9481=3Dy
>> # CONFIG_FB_TFT_ILI9486 is not set
>> CONFIG_FB_TFT_PCD8544=3Dy
>> CONFIG_FB_TFT_RA8875=3Dy
>> CONFIG_FB_TFT_S6D02A1=3Dy
>> CONFIG_FB_TFT_S6D1121=3Dy
>> CONFIG_FB_TFT_SH1106=3Dy
>> CONFIG_FB_TFT_SSD1289=3Dy
>> CONFIG_FB_TFT_SSD1305=3Dy
>> CONFIG_FB_TFT_SSD1306=3Dy
>> CONFIG_FB_TFT_SSD1331=3Dy
>> # CONFIG_FB_TFT_SSD1351 is not set
>> # CONFIG_FB_TFT_ST7735R is not set
>> CONFIG_FB_TFT_ST7789V=3Dy
>> CONFIG_FB_TFT_TINYLCD=3Dy
>> # CONFIG_FB_TFT_TLS8204 is not set
>> CONFIG_FB_TFT_UC1611=3Dy
>> # CONFIG_FB_TFT_UC1701 is not set
>> # CONFIG_FB_TFT_UPD161704 is not set
>> # CONFIG_FB_TFT_WATTEROTT is not set
>> CONFIG_FB_FLEX=3Dy
>> # CONFIG_FB_TFT_FBTFT_DEVICE is not set
>> CONFIG_MOST=3Dy
>> # CONFIG_MOST_CDEV is not set
>> # CONFIG_MOST_NET is not set
>> CONFIG_MOST_I2C=3Dy
>> # CONFIG_MOST_USB is not set
>> # CONFIG_KS7010 is not set
>> # CONFIG_GREYBUS is not set
>> CONFIG_DRM_VBOXVIDEO=3Dy
>> CONFIG_PI433=3Dy
>> # CONFIG_MTK_MMC is not set
>>
>> #
>> # Gasket devices
>> #
>> CONFIG_XIL_AXIS_FIFO=3Dy
>> CONFIG_X86_PLATFORM_DEVICES=3Dy
>> # CONFIG_ACER_WMI is not set
>> # CONFIG_ACER_WIRELESS is not set
>> # CONFIG_ACERHDF is not set
>> # CONFIG_ALIENWARE_WMI is not set
>> # CONFIG_ASUS_LAPTOP is not set
>> # CONFIG_DELL_SMBIOS is not set
>> # CONFIG_DELL_WMI_AIO is not set
>> # CONFIG_DELL_WMI_LED is not set
>> # CONFIG_DELL_SMO8800 is not set
>> # CONFIG_FUJITSU_LAPTOP is not set
>> # CONFIG_FUJITSU_TABLET is not set
>> # CONFIG_GPD_POCKET_FAN is not set
>> # CONFIG_TC1100_WMI is not set
>> # CONFIG_HP_ACCEL is not set
>> # CONFIG_HP_WIRELESS is not set
>> # CONFIG_HP_WMI is not set
>> # CONFIG_PANASONIC_LAPTOP is not set
>> # CONFIG_THINKPAD_ACPI is not set
>> # CONFIG_SENSORS_HDAPS is not set
>> # CONFIG_INTEL_MENLOW is not set
>> # CONFIG_EEEPC_LAPTOP is not set
>> # CONFIG_ASUS_WMI is not set
>> # CONFIG_ASUS_WIRELESS is not set
>> CONFIG_ACPI_WMI=3Dy
>> CONFIG_WMI_BMOF=3Dy
>> # CONFIG_INTEL_WMI_THUNDERBOLT is not set
>> # CONFIG_MSI_WMI is not set
>> # CONFIG_PEAQ_WMI is not set
>> # CONFIG_TOPSTAR_LAPTOP is not set
>> # CONFIG_ACPI_TOSHIBA is not set
>> # CONFIG_TOSHIBA_BT_RFKILL is not set
>> # CONFIG_TOSHIBA_HAPS is not set
>> # CONFIG_TOSHIBA_WMI is not set
>> # CONFIG_ACPI_CMPC is not set
>> # CONFIG_INTEL_INT0002_VGPIO is not set
>> # CONFIG_INTEL_HID_EVENT is not set
>> # CONFIG_INTEL_VBTN is not set
>> # CONFIG_INTEL_IPS is not set
>> # CONFIG_INTEL_PMC_CORE is not set
>> # CONFIG_IBM_RTL is not set
>> # CONFIG_SAMSUNG_LAPTOP is not set
>> CONFIG_MXM_WMI=3Dy
>> # CONFIG_SAMSUNG_Q10 is not set
>> # CONFIG_APPLE_GMUX is not set
>> # CONFIG_INTEL_RST is not set
>> # CONFIG_INTEL_SMARTCONNECT is not set
>> # CONFIG_PVPANIC is not set
>> # CONFIG_INTEL_PMC_IPC is not set
>> # CONFIG_SURFACE_PRO3_BUTTON is not set
>> # CONFIG_SURFACE_3_BUTTON is not set
>> # CONFIG_INTEL_PUNIT_IPC is not set
>> # CONFIG_MLX_PLATFORM is not set
>> # CONFIG_I2C_MULTI_INSTANTIATE is not set
>> CONFIG_PMC_ATOM=3Dy
>> CONFIG_GOLDFISH_PIPE=3Dy
>> CONFIG_CHROME_PLATFORMS=3Dy
>> # CONFIG_CHROMEOS_PSTORE is not set
>> # CONFIG_CHROMEOS_TBMC is not set
>> CONFIG_CROS_EC_I2C=3Dy
>> CONFIG_CROS_EC_SPI=3Dy
>> # CONFIG_CROS_EC_LPC is not set
>> CONFIG_CROS_EC_PROTO=3Dy
>> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
>> CONFIG_MELLANOX_PLATFORM=3Dy
>> CONFIG_MLXREG_HOTPLUG=3Dy
>> # CONFIG_MLXREG_IO is not set
>> CONFIG_CLKDEV_LOOKUP=3Dy
>> CONFIG_HAVE_CLK_PREPARE=3Dy
>> CONFIG_COMMON_CLK=3Dy
>>
>> #
>> # Common Clock Framework
>> #
>> CONFIG_COMMON_CLK_MAX9485=3Dy
>> # CONFIG_COMMON_CLK_SI5351 is not set
>> CONFIG_COMMON_CLK_SI544=3Dy
>> CONFIG_COMMON_CLK_CDCE706=3Dy
>> CONFIG_COMMON_CLK_CS2000_CP=3Dy
>> CONFIG_COMMON_CLK_PWM=3Dy
>> # CONFIG_HWSPINLOCK is not set
>>
>> #
>> # Clock Source drivers
>> #
>> CONFIG_CLKSRC_I8253=3Dy
>> CONFIG_CLKEVT_I8253=3Dy
>> CONFIG_CLKBLD_I8253=3Dy
>> # CONFIG_MAILBOX is not set
>> CONFIG_IOMMU_SUPPORT=3Dy
>>
>> #
>> # Generic IOMMU Pagetable Support
>> #
>> # CONFIG_IOMMU_DEBUGFS is not set
>> # CONFIG_INTEL_IOMMU is not set
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
>> # CONFIG_SOC_TI is not set
>>
>> #
>> # Xilinx SoC drivers
>> #
>> CONFIG_XILINX_VCU=3Dy
>> CONFIG_PM_DEVFREQ=3Dy
>>
>> #
>> # DEVFREQ Governors
>> #
>> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
>> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
>> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
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
>> CONFIG_EXTCON_ADC_JACK=3Dy
>> # CONFIG_EXTCON_AXP288 is not set
>> # CONFIG_EXTCON_GPIO is not set
>> # CONFIG_EXTCON_INTEL_INT3496 is not set
>> CONFIG_EXTCON_MAX14577=3Dy
>> # CONFIG_EXTCON_MAX3355 is not set
>> CONFIG_EXTCON_MAX77693=3Dy
>> CONFIG_EXTCON_MAX77843=3Dy
>> CONFIG_EXTCON_RT8973A=3Dy
>> CONFIG_EXTCON_SM5502=3Dy
>> # CONFIG_EXTCON_USB_GPIO is not set
>> CONFIG_EXTCON_USBC_CROS_EC=3Dy
>> CONFIG_MEMORY=3Dy
>> CONFIG_IIO=3Dy
>> CONFIG_IIO_BUFFER=3Dy
>> CONFIG_IIO_BUFFER_CB=3Dy
>> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
>> CONFIG_IIO_KFIFO_BUF=3Dy
>> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>> CONFIG_IIO_CONFIGFS=3Dy
>> CONFIG_IIO_TRIGGER=3Dy
>> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
>> # CONFIG_IIO_SW_DEVICE is not set
>> CONFIG_IIO_SW_TRIGGER=3Dy
>> CONFIG_IIO_TRIGGERED_EVENT=3Dy
>>
>> #
>> # Accelerometers
>> #
>> CONFIG_ADIS16201=3Dy
>> CONFIG_ADIS16209=3Dy
>> CONFIG_BMA180=3Dy
>> # CONFIG_BMA220 is not set
>> CONFIG_BMC150_ACCEL=3Dy
>> CONFIG_BMC150_ACCEL_I2C=3Dy
>> CONFIG_BMC150_ACCEL_SPI=3Dy
>> # CONFIG_DA280 is not set
>> CONFIG_DA311=3Dy
>> CONFIG_DMARD09=3Dy
>> CONFIG_DMARD10=3Dy
>> CONFIG_HID_SENSOR_ACCEL_3D=3Dy
>> CONFIG_IIO_CROS_EC_ACCEL_LEGACY=3Dy
>> CONFIG_KXSD9=3Dy
>> CONFIG_KXSD9_SPI=3Dy
>> # CONFIG_KXSD9_I2C is not set
>> CONFIG_KXCJK1013=3Dy
>> CONFIG_MC3230=3Dy
>> CONFIG_MMA7455=3Dy
>> # CONFIG_MMA7455_I2C is not set
>> CONFIG_MMA7455_SPI=3Dy
>> CONFIG_MMA7660=3Dy
>> # CONFIG_MMA8452 is not set
>> CONFIG_MMA9551_CORE=3Dy
>> CONFIG_MMA9551=3Dy
>> # CONFIG_MMA9553 is not set
>> CONFIG_MXC4005=3Dy
>> CONFIG_MXC6255=3Dy
>> # CONFIG_SCA3000 is not set
>> CONFIG_STK8312=3Dy
>> # CONFIG_STK8BA50 is not set
>>
>> #
>> # Analog to digital converters
>> #
>> CONFIG_AD_SIGMA_DELTA=3Dy
>> CONFIG_AD7266=3Dy
>> CONFIG_AD7291=3Dy
>> CONFIG_AD7298=3Dy
>> CONFIG_AD7476=3Dy
>> CONFIG_AD7766=3Dy
>> CONFIG_AD7791=3Dy
>> # CONFIG_AD7793 is not set
>> CONFIG_AD7887=3Dy
>> CONFIG_AD7923=3Dy
>> # CONFIG_AD799X is not set
>> CONFIG_AXP20X_ADC=3Dy
>> CONFIG_AXP288_ADC=3Dy
>> CONFIG_DA9150_GPADC=3Dy
>> CONFIG_DLN2_ADC=3Dy
>> CONFIG_HI8435=3Dy
>> CONFIG_HX711=3Dy
>> # CONFIG_LTC2471 is not set
>> CONFIG_LTC2485=3Dy
>> CONFIG_LTC2497=3Dy
>> CONFIG_MAX1027=3Dy
>> CONFIG_MAX11100=3Dy
>> CONFIG_MAX1118=3Dy
>> CONFIG_MAX1363=3Dy
>> CONFIG_MAX9611=3Dy
>> CONFIG_MCP320X=3Dy
>> CONFIG_MCP3422=3Dy
>> # CONFIG_MEN_Z188_ADC is not set
>> # CONFIG_NAU7802 is not set
>> CONFIG_QCOM_VADC_COMMON=3Dy
>> CONFIG_QCOM_SPMI_IADC=3Dy
>> CONFIG_QCOM_SPMI_VADC=3Dy
>> CONFIG_TI_ADC081C=3Dy
>> CONFIG_TI_ADC0832=3Dy
>> CONFIG_TI_ADC084S021=3Dy
>> CONFIG_TI_ADC12138=3Dy
>> CONFIG_TI_ADC108S102=3Dy
>> CONFIG_TI_ADC128S052=3Dy
>> CONFIG_TI_ADC161S626=3Dy
>> CONFIG_TI_ADS7950=3Dy
>> CONFIG_TI_AM335X_ADC=3Dy
>> CONFIG_TI_TLC4541=3Dy
>> CONFIG_TWL4030_MADC=3Dy
>> # CONFIG_TWL6030_GPADC is not set
>> CONFIG_VIPERBOARD_ADC=3Dy
>>
>> #
>> # Analog Front Ends
>> #
>>
>> #
>> # Amplifiers
>> #
>> # CONFIG_AD8366 is not set
>>
>> #
>> # Chemical Sensors
>> #
>> CONFIG_ATLAS_PH_SENSOR=3Dy
>> # CONFIG_BME680 is not set
>> # CONFIG_CCS811 is not set
>> CONFIG_IAQCORE=3Dy
>> CONFIG_VZ89X=3Dy
>> CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dy
>> CONFIG_IIO_CROS_EC_SENSORS=3Dy
>>
>> #
>> # Hid Sensor IIO Common
>> #
>> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
>> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
>> CONFIG_IIO_MS_SENSORS_I2C=3Dy
>>
>> #
>> # SSP Sensor Common
>> #
>> CONFIG_IIO_SSP_SENSORS_COMMONS=3Dy
>> CONFIG_IIO_SSP_SENSORHUB=3Dy
>> CONFIG_IIO_ST_SENSORS_I2C=3Dy
>> CONFIG_IIO_ST_SENSORS_SPI=3Dy
>> CONFIG_IIO_ST_SENSORS_CORE=3Dy
>>
>> #
>> # Counters
>> #
>>
>> #
>> # Digital to analog converters
>> #
>> CONFIG_AD5064=3Dy
>> # CONFIG_AD5360 is not set
>> CONFIG_AD5380=3Dy
>> CONFIG_AD5421=3Dy
>> # CONFIG_AD5446 is not set
>> CONFIG_AD5449=3Dy
>> CONFIG_AD5592R_BASE=3Dy
>> CONFIG_AD5592R=3Dy
>> CONFIG_AD5593R=3Dy
>> CONFIG_AD5504=3Dy
>> # CONFIG_AD5624R_SPI is not set
>> # CONFIG_LTC2632 is not set
>> CONFIG_AD5686=3Dy
>> CONFIG_AD5686_SPI=3Dy
>> CONFIG_AD5696_I2C=3Dy
>> # CONFIG_AD5755 is not set
>> # CONFIG_AD5758 is not set
>> # CONFIG_AD5761 is not set
>> CONFIG_AD5764=3Dy
>> CONFIG_AD5791=3Dy
>> CONFIG_AD7303=3Dy
>> # CONFIG_CIO_DAC is not set
>> # CONFIG_AD8801 is not set
>> CONFIG_DS4424=3Dy
>> # CONFIG_M62332 is not set
>> # CONFIG_MAX517 is not set
>> # CONFIG_MCP4725 is not set
>> CONFIG_MCP4922=3Dy
>> CONFIG_TI_DAC082S085=3Dy
>> CONFIG_TI_DAC5571=3Dy
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
>> CONFIG_AD9523=3Dy
>>
>> #
>> # Phase-Locked Loop (PLL) frequency synthesizers
>> #
>> # CONFIG_ADF4350 is not set
>>
>> #
>> # Digital gyroscope sensors
>> #
>> CONFIG_ADIS16080=3Dy
>> CONFIG_ADIS16130=3Dy
>> CONFIG_ADIS16136=3Dy
>> CONFIG_ADIS16260=3Dy
>> # CONFIG_ADXRS450 is not set
>> # CONFIG_BMG160 is not set
>> CONFIG_HID_SENSOR_GYRO_3D=3Dy
>> CONFIG_MPU3050=3Dy
>> CONFIG_MPU3050_I2C=3Dy
>> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
>> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
>> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
>> CONFIG_ITG3200=3Dy
>>
>> #
>> # Health Sensors
>> #
>>
>> #
>> # Heart Rate Monitors
>> #
>> CONFIG_AFE4403=3Dy
>> CONFIG_AFE4404=3Dy
>> # CONFIG_MAX30100 is not set
>> CONFIG_MAX30102=3Dy
>>
>> #
>> # Humidity sensors
>> #
>> CONFIG_AM2315=3Dy
>> # CONFIG_DHT11 is not set
>> # CONFIG_HDC100X is not set
>> CONFIG_HID_SENSOR_HUMIDITY=3Dy
>> CONFIG_HTS221=3Dy
>> CONFIG_HTS221_I2C=3Dy
>> CONFIG_HTS221_SPI=3Dy
>> CONFIG_HTU21=3Dy
>> CONFIG_SI7005=3Dy
>> CONFIG_SI7020=3Dy
>>
>> #
>> # Inertial measurement units
>> #
>> CONFIG_ADIS16400=3Dy
>> CONFIG_ADIS16480=3Dy
>> CONFIG_BMI160=3Dy
>> CONFIG_BMI160_I2C=3Dy
>> # CONFIG_BMI160_SPI is not set
>> CONFIG_KMX61=3Dy
>> CONFIG_INV_MPU6050_IIO=3Dy
>> CONFIG_INV_MPU6050_I2C=3Dy
>> CONFIG_INV_MPU6050_SPI=3Dy
>> CONFIG_IIO_ST_LSM6DSX=3Dy
>> CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
>> CONFIG_IIO_ST_LSM6DSX_SPI=3Dy
>> CONFIG_IIO_ADIS_LIB=3Dy
>> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
>>
>> #
>> # Light sensors
>> #
>> # CONFIG_ACPI_ALS is not set
>> CONFIG_ADJD_S311=3Dy
>> CONFIG_AL3320A=3Dy
>> CONFIG_APDS9300=3Dy
>> CONFIG_APDS9960=3Dy
>> CONFIG_BH1750=3Dy
>> # CONFIG_BH1780 is not set
>> CONFIG_CM32181=3Dy
>> # CONFIG_CM3232 is not set
>> CONFIG_CM3323=3Dy
>> CONFIG_CM36651=3Dy
>> CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dy
>> # CONFIG_GP2AP020A00F is not set
>> CONFIG_SENSORS_ISL29018=3Dy
>> CONFIG_SENSORS_ISL29028=3Dy
>> # CONFIG_ISL29125 is not set
>> CONFIG_HID_SENSOR_ALS=3Dy
>> CONFIG_HID_SENSOR_PROX=3Dy
>> CONFIG_JSA1212=3Dy
>> # CONFIG_RPR0521 is not set
>> CONFIG_LTR501=3Dy
>> CONFIG_LV0104CS=3Dy
>> # CONFIG_MAX44000 is not set
>> CONFIG_OPT3001=3Dy
>> CONFIG_PA12203001=3Dy
>> # CONFIG_SI1133 is not set
>> CONFIG_SI1145=3Dy
>> CONFIG_STK3310=3Dy
>> CONFIG_ST_UVIS25=3Dy
>> CONFIG_ST_UVIS25_I2C=3Dy
>> CONFIG_ST_UVIS25_SPI=3Dy
>> CONFIG_TCS3414=3Dy
>> CONFIG_TCS3472=3Dy
>> CONFIG_SENSORS_TSL2563=3Dy
>> CONFIG_TSL2583=3Dy
>> CONFIG_TSL2772=3Dy
>> CONFIG_TSL4531=3Dy
>> # CONFIG_US5182D is not set
>> CONFIG_VCNL4000=3Dy
>> CONFIG_VEML6070=3Dy
>> CONFIG_VL6180=3Dy
>> CONFIG_ZOPT2201=3Dy
>>
>> #
>> # Magnetometer sensors
>> #
>> CONFIG_AK8975=3Dy
>> # CONFIG_AK09911 is not set
>> CONFIG_BMC150_MAGN=3Dy
>> CONFIG_BMC150_MAGN_I2C=3Dy
>> CONFIG_BMC150_MAGN_SPI=3Dy
>> # CONFIG_MAG3110 is not set
>> # CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
>> CONFIG_MMC35240=3Dy
>> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
>> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
>> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
>> CONFIG_SENSORS_HMC5843=3Dy
>> CONFIG_SENSORS_HMC5843_I2C=3Dy
>> CONFIG_SENSORS_HMC5843_SPI=3Dy
>>
>> #
>> # Multiplexers
>> #
>>
>> #
>> # Inclinometer sensors
>> #
>> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dy
>> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dy
>>
>> #
>> # Triggers - standalone
>> #
>> CONFIG_IIO_HRTIMER_TRIGGER=3Dy
>> # CONFIG_IIO_INTERRUPT_TRIGGER is not set
>> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
>> # CONFIG_IIO_SYSFS_TRIGGER is not set
>>
>> #
>> # Digital potentiometers
>> #
>> CONFIG_AD5272=3Dy
>> CONFIG_DS1803=3Dy
>> CONFIG_MAX5481=3Dy
>> # CONFIG_MAX5487 is not set
>> CONFIG_MCP4018=3Dy
>> CONFIG_MCP4131=3Dy
>> # CONFIG_MCP4531 is not set
>> CONFIG_TPL0102=3Dy
>>
>> #
>> # Digital potentiostats
>> #
>> CONFIG_LMP91000=3Dy
>>
>> #
>> # Pressure sensors
>> #
>> CONFIG_ABP060MG=3Dy
>> CONFIG_BMP280=3Dy
>> CONFIG_BMP280_I2C=3Dy
>> CONFIG_BMP280_SPI=3Dy
>> CONFIG_IIO_CROS_EC_BARO=3Dy
>> CONFIG_HID_SENSOR_PRESS=3Dy
>> # CONFIG_HP03 is not set
>> CONFIG_MPL115=3Dy
>> CONFIG_MPL115_I2C=3Dy
>> CONFIG_MPL115_SPI=3Dy
>> # CONFIG_MPL3115 is not set
>> CONFIG_MS5611=3Dy
>> CONFIG_MS5611_I2C=3Dy
>> CONFIG_MS5611_SPI=3Dy
>> CONFIG_MS5637=3Dy
>> # CONFIG_IIO_ST_PRESS is not set
>> # CONFIG_T5403 is not set
>> # CONFIG_HP206C is not set
>> # CONFIG_ZPA2326 is not set
>>
>> #
>> # Lightning sensors
>> #
>> CONFIG_AS3935=3Dy
>>
>> #
>> # Proximity and distance sensors
>> #
>> CONFIG_ISL29501=3Dy
>> CONFIG_LIDAR_LITE_V2=3Dy
>> # CONFIG_RFD77402 is not set
>> CONFIG_SRF04=3Dy
>> CONFIG_SX9500=3Dy
>> # CONFIG_SRF08 is not set
>>
>> #
>> # Resolver to digital converters
>> #
>> # CONFIG_AD2S1200 is not set
>>
>> #
>> # Temperature sensors
>> #
>> # CONFIG_MAXIM_THERMOCOUPLE is not set
>> CONFIG_HID_SENSOR_TEMP=3Dy
>> CONFIG_MLX90614=3Dy
>> # CONFIG_MLX90632 is not set
>> CONFIG_TMP006=3Dy
>> CONFIG_TMP007=3Dy
>> CONFIG_TSYS01=3Dy
>> CONFIG_TSYS02D=3Dy
>> CONFIG_NTB=3Dy
>> CONFIG_NTB_IDT=3Dy
>> # CONFIG_NTB_SWITCHTEC is not set
>> CONFIG_NTB_PINGPONG=3Dy
>> # CONFIG_NTB_TOOL is not set
>> CONFIG_NTB_PERF=3Dy
>> CONFIG_NTB_TRANSPORT=3Dy
>> # CONFIG_VME_BUS is not set
>> CONFIG_PWM=3Dy
>> CONFIG_PWM_SYSFS=3Dy
>> CONFIG_PWM_CROS_EC=3Dy
>> CONFIG_PWM_LPSS=3Dy
>> CONFIG_PWM_LPSS_PCI=3Dy
>> # CONFIG_PWM_LPSS_PLATFORM is not set
>> # CONFIG_PWM_PCA9685 is not set
>> CONFIG_PWM_TWL=3Dy
>> # CONFIG_PWM_TWL_LED is not set
>>
>> #
>> # IRQ chip support
>> #
>> CONFIG_ARM_GIC_MAX_NR=3D1
>> # CONFIG_IPACK_BUS is not set
>> CONFIG_RESET_CONTROLLER=3Dy
>> CONFIG_RESET_TI_SYSCON=3Dy
>> CONFIG_FMC=3Dy
>> CONFIG_FMC_FAKEDEV=3Dy
>> CONFIG_FMC_TRIVIAL=3Dy
>> CONFIG_FMC_WRITE_EEPROM=3Dy
>> # CONFIG_FMC_CHARDEV is not set
>>
>> #
>> # PHY Subsystem
>> #
>> CONFIG_GENERIC_PHY=3Dy
>> CONFIG_BCM_KONA_USB2_PHY=3Dy
>> CONFIG_PHY_PXA_28NM_HSIC=3Dy
>> CONFIG_PHY_PXA_28NM_USB2=3Dy
>> # CONFIG_PHY_CPCAP_USB is not set
>> CONFIG_PHY_QCOM_USB_HS=3Dy
>> CONFIG_PHY_QCOM_USB_HSIC=3Dy
>> CONFIG_PHY_TUSB1210=3Dy
>> # CONFIG_POWERCAP is not set
>> CONFIG_MCB=3Dy
>> CONFIG_MCB_PCI=3Dy
>> CONFIG_MCB_LPC=3Dy
>>
>> #
>> # Performance monitor support
>> #
>> CONFIG_RAS=3Dy
>> CONFIG_THUNDERBOLT=3Dy
>>
>> #
>> # Android
>> #
>> # CONFIG_ANDROID is not set
>> CONFIG_DAX=3Dy
>> CONFIG_DEV_DAX=3Dy
>> CONFIG_NVMEM=3Dy
>> CONFIG_RAVE_SP_EEPROM=3Dy
>>
>> #
>> # HW tracing support
>> #
>> # CONFIG_STM is not set
>> CONFIG_INTEL_TH=3Dy
>> CONFIG_INTEL_TH_PCI=3Dy
>> # CONFIG_INTEL_TH_ACPI is not set
>> CONFIG_INTEL_TH_GTH=3Dy
>> CONFIG_INTEL_TH_MSU=3Dy
>> CONFIG_INTEL_TH_PTI=3Dy
>> CONFIG_INTEL_TH_DEBUG=3Dy
>> # CONFIG_FPGA is not set
>> CONFIG_PM_OPP=3Dy
>> CONFIG_SIOX=3Dy
>> # CONFIG_SIOX_BUS_GPIO is not set
>> CONFIG_SLIMBUS=3Dy
>> # CONFIG_SLIM_QCOM_CTRL is not set
>>
>> #
>> # File systems
>> #
>> CONFIG_DCACHE_WORD_ACCESS=3Dy
>> CONFIG_FS_POSIX_ACL=3Dy
>> CONFIG_EXPORTFS=3Dy
>> # CONFIG_EXPORTFS_BLOCK_OPS is not set
>> CONFIG_FILE_LOCKING=3Dy
>> CONFIG_MANDATORY_FILE_LOCKING=3Dy
>> CONFIG_FS_ENCRYPTION=3Dy
>> CONFIG_FSNOTIFY=3Dy
>> # CONFIG_DNOTIFY is not set
>> CONFIG_INOTIFY_USER=3Dy
>> CONFIG_FANOTIFY=3Dy
>> # CONFIG_QUOTA is not set
>> # CONFIG_AUTOFS4_FS is not set
>> # CONFIG_AUTOFS_FS is not set
>> CONFIG_FUSE_FS=3Dy
>> # CONFIG_CUSE is not set
>> # CONFIG_OVERLAY_FS is not set
>>
>> #
>> # Caches
>> #
>> # CONFIG_FSCACHE is not set
>>
>> #
>> # Pseudo filesystems
>> #
>> CONFIG_PROC_FS=3Dy
>> # CONFIG_PROC_KCORE is not set
>> CONFIG_PROC_SYSCTL=3Dy
>> CONFIG_PROC_PAGE_MONITOR=3Dy
>> # CONFIG_PROC_CHILDREN is not set
>> CONFIG_KERNFS=3Dy
>> CONFIG_SYSFS=3Dy
>> CONFIG_TMPFS=3Dy
>> # CONFIG_TMPFS_POSIX_ACL is not set
>> CONFIG_TMPFS_XATTR=3Dy
>> # CONFIG_HUGETLBFS is not set
>> CONFIG_MEMFD_CREATE=3Dy
>> CONFIG_CONFIGFS_FS=3Dy
>> CONFIG_MISC_FILESYSTEMS=3Dy
>> CONFIG_ORANGEFS_FS=3Dy
>> CONFIG_ECRYPT_FS=3Dy
>> # CONFIG_ECRYPT_FS_MESSAGING is not set
>> # CONFIG_CRAMFS is not set
>> CONFIG_PSTORE=3Dy
>> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
>> CONFIG_PSTORE_LZO_COMPRESS=3Dy
>> # CONFIG_PSTORE_LZ4_COMPRESS is not set
>> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
>> # CONFIG_PSTORE_842_COMPRESS is not set
>> CONFIG_PSTORE_ZSTD_COMPRESS=3Dy
>> CONFIG_PSTORE_COMPRESS=3Dy
>> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
>> # CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
>> # CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
>> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
>> CONFIG_PSTORE_CONSOLE=3Dy
>> CONFIG_PSTORE_PMSG=3Dy
>> CONFIG_PSTORE_FTRACE=3Dy
>> # CONFIG_PSTORE_RAM is not set
>> CONFIG_NETWORK_FILESYSTEMS=3Dy
>> CONFIG_NFS_FS=3Dy
>> CONFIG_NFS_V2=3Dy
>> CONFIG_NFS_V3=3Dy
>> # CONFIG_NFS_V3_ACL is not set
>> CONFIG_NFS_V4=3Dy
>> # CONFIG_NFS_SWAP is not set
>> # CONFIG_NFS_V4_1 is not set
>> # CONFIG_ROOT_NFS is not set
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
>> # CONFIG_SUNRPC_DEBUG is not set
>> # CONFIG_CEPH_FS is not set
>> CONFIG_CIFS=3Dy
>> # CONFIG_CIFS_STATS2 is not set
>> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
>> # CONFIG_CIFS_WEAK_PW_HASH is not set
>> # CONFIG_CIFS_UPCALL is not set
>> # CONFIG_CIFS_XATTR is not set
>> CONFIG_CIFS_DEBUG=3Dy
>> # CONFIG_CIFS_DEBUG2 is not set
>> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
>> # CONFIG_CIFS_DFS_UPCALL is not set
>> # CONFIG_CODA_FS is not set
>> # CONFIG_AFS_FS is not set
>> # CONFIG_9P_FS is not set
>> CONFIG_NLS=3Dy
>> CONFIG_NLS_DEFAULT=3D"iso8859-1"
>> CONFIG_NLS_CODEPAGE_437=3Dy
>> CONFIG_NLS_CODEPAGE_737=3Dy
>> CONFIG_NLS_CODEPAGE_775=3Dy
>> CONFIG_NLS_CODEPAGE_850=3Dy
>> # CONFIG_NLS_CODEPAGE_852 is not set
>> # CONFIG_NLS_CODEPAGE_855 is not set
>> CONFIG_NLS_CODEPAGE_857=3Dy
>> CONFIG_NLS_CODEPAGE_860=3Dy
>> CONFIG_NLS_CODEPAGE_861=3Dy
>> CONFIG_NLS_CODEPAGE_862=3Dy
>> CONFIG_NLS_CODEPAGE_863=3Dy
>> CONFIG_NLS_CODEPAGE_864=3Dy
>> # CONFIG_NLS_CODEPAGE_865 is not set
>> # CONFIG_NLS_CODEPAGE_866 is not set
>> CONFIG_NLS_CODEPAGE_869=3Dy
>> CONFIG_NLS_CODEPAGE_936=3Dy
>> CONFIG_NLS_CODEPAGE_950=3Dy
>> CONFIG_NLS_CODEPAGE_932=3Dy
>> # CONFIG_NLS_CODEPAGE_949 is not set
>> # CONFIG_NLS_CODEPAGE_874 is not set
>> CONFIG_NLS_ISO8859_8=3Dy
>> CONFIG_NLS_CODEPAGE_1250=3Dy
>> CONFIG_NLS_CODEPAGE_1251=3Dy
>> CONFIG_NLS_ASCII=3Dy
>> CONFIG_NLS_ISO8859_1=3Dy
>> CONFIG_NLS_ISO8859_2=3Dy
>> CONFIG_NLS_ISO8859_3=3Dy
>> CONFIG_NLS_ISO8859_4=3Dy
>> # CONFIG_NLS_ISO8859_5 is not set
>> CONFIG_NLS_ISO8859_6=3Dy
>> CONFIG_NLS_ISO8859_7=3Dy
>> # CONFIG_NLS_ISO8859_9 is not set
>> CONFIG_NLS_ISO8859_13=3Dy
>> # CONFIG_NLS_ISO8859_14 is not set
>> # CONFIG_NLS_ISO8859_15 is not set
>> CONFIG_NLS_KOI8_R=3Dy
>> CONFIG_NLS_KOI8_U=3Dy
>> CONFIG_NLS_MAC_ROMAN=3Dy
>> CONFIG_NLS_MAC_CELTIC=3Dy
>> # CONFIG_NLS_MAC_CENTEURO is not set
>> CONFIG_NLS_MAC_CROATIAN=3Dy
>> # CONFIG_NLS_MAC_CYRILLIC is not set
>> # CONFIG_NLS_MAC_GAELIC is not set
>> # CONFIG_NLS_MAC_GREEK is not set
>> # CONFIG_NLS_MAC_ICELAND is not set
>> CONFIG_NLS_MAC_INUIT=3Dy
>> CONFIG_NLS_MAC_ROMANIAN=3Dy
>> CONFIG_NLS_MAC_TURKISH=3Dy
>> # CONFIG_NLS_UTF8 is not set
>> # CONFIG_DLM is not set
>>
>> #
>> # Security options
>> #
>> CONFIG_KEYS=3Dy
>> # CONFIG_PERSISTENT_KEYRINGS is not set
>> # CONFIG_BIG_KEYS is not set
>> CONFIG_ENCRYPTED_KEYS=3Dy
>> CONFIG_KEY_DH_OPERATIONS=3Dy
>> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
>> # CONFIG_SECURITY is not set
>> # CONFIG_SECURITYFS is not set
>> CONFIG_PAGE_TABLE_ISOLATION=3Dy
>> # CONFIG_FORTIFY_SOURCE is not set
>> # CONFIG_STATIC_USERMODEHELPER is not set
>> CONFIG_DEFAULT_SECURITY_DAC=3Dy
>> CONFIG_DEFAULT_SECURITY=3D""
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
>> # CONFIG_CRYPTO_RSA is not set
>> CONFIG_CRYPTO_DH=3Dy
>> # CONFIG_CRYPTO_ECDH is not set
>> CONFIG_CRYPTO_MANAGER=3Dy
>> CONFIG_CRYPTO_MANAGER2=3Dy
>> # CONFIG_CRYPTO_USER is not set
>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>> CONFIG_CRYPTO_GF128MUL=3Dy
>> CONFIG_CRYPTO_NULL=3Dy
>> CONFIG_CRYPTO_NULL2=3Dy
>> # CONFIG_CRYPTO_PCRYPT is not set
>> CONFIG_CRYPTO_WORKQUEUE=3Dy
>> CONFIG_CRYPTO_CRYPTD=3Dy
>> CONFIG_CRYPTO_MCRYPTD=3Dy
>> CONFIG_CRYPTO_AUTHENC=3Dy
>> CONFIG_CRYPTO_SIMD=3Dy
>> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
>>
>> #
>> # Authenticated Encryption with Associated Data
>> #
>> CONFIG_CRYPTO_CCM=3Dy
>> CONFIG_CRYPTO_GCM=3Dy
>> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
>> CONFIG_CRYPTO_AEGIS128=3Dy
>> CONFIG_CRYPTO_AEGIS128L=3Dy
>> CONFIG_CRYPTO_AEGIS256=3Dy
>> CONFIG_CRYPTO_MORUS640=3Dy
>> # CONFIG_CRYPTO_MORUS1280 is not set
>> CONFIG_CRYPTO_SEQIV=3Dy
>> CONFIG_CRYPTO_ECHAINIV=3Dy
>>
>> #
>> # Block modes
>> #
>> CONFIG_CRYPTO_CBC=3Dy
>> CONFIG_CRYPTO_CFB=3Dy
>> CONFIG_CRYPTO_CTR=3Dy
>> CONFIG_CRYPTO_CTS=3Dy
>> CONFIG_CRYPTO_ECB=3Dy
>> CONFIG_CRYPTO_LRW=3Dy
>> # CONFIG_CRYPTO_PCBC is not set
>> CONFIG_CRYPTO_XTS=3Dy
>> CONFIG_CRYPTO_KEYWRAP=3Dy
>>
>> #
>> # Hash modes
>> #
>> CONFIG_CRYPTO_CMAC=3Dy
>> CONFIG_CRYPTO_HMAC=3Dy
>> CONFIG_CRYPTO_XCBC=3Dy
>> # CONFIG_CRYPTO_VMAC is not set
>>
>> #
>> # Digest
>> #
>> CONFIG_CRYPTO_CRC32C=3Dy
>> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
>> CONFIG_CRYPTO_CRC32=3Dy
>> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
>> # CONFIG_CRYPTO_CRCT10DIF is not set
>> CONFIG_CRYPTO_GHASH=3Dy
>> # CONFIG_CRYPTO_POLY1305 is not set
>> CONFIG_CRYPTO_MD4=3Dy
>> CONFIG_CRYPTO_MD5=3Dy
>> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
>> CONFIG_CRYPTO_RMD128=3Dy
>> CONFIG_CRYPTO_RMD160=3Dy
>> CONFIG_CRYPTO_RMD256=3Dy
>> CONFIG_CRYPTO_RMD320=3Dy
>> CONFIG_CRYPTO_SHA1=3Dy
>> CONFIG_CRYPTO_SHA256=3Dy
>> CONFIG_CRYPTO_SHA512=3Dy
>> CONFIG_CRYPTO_SHA3=3Dy
>> CONFIG_CRYPTO_SM3=3Dy
>> # CONFIG_CRYPTO_TGR192 is not set
>> CONFIG_CRYPTO_WP512=3Dy
>>
>> #
>> # Ciphers
>> #
>> CONFIG_CRYPTO_AES=3Dy
>> CONFIG_CRYPTO_AES_TI=3Dy
>> CONFIG_CRYPTO_AES_586=3Dy
>> # CONFIG_CRYPTO_AES_NI_INTEL is not set
>> # CONFIG_CRYPTO_ANUBIS is not set
>> CONFIG_CRYPTO_ARC4=3Dy
>> # CONFIG_CRYPTO_BLOWFISH is not set
>> # CONFIG_CRYPTO_CAMELLIA is not set
>> CONFIG_CRYPTO_CAST_COMMON=3Dy
>> # CONFIG_CRYPTO_CAST5 is not set
>> CONFIG_CRYPTO_CAST6=3Dy
>> CONFIG_CRYPTO_DES=3Dy
>> # CONFIG_CRYPTO_FCRYPT is not set
>> # CONFIG_CRYPTO_KHAZAD is not set
>> CONFIG_CRYPTO_SALSA20=3Dy
>> # CONFIG_CRYPTO_CHACHA20 is not set
>> CONFIG_CRYPTO_SEED=3Dy
>> CONFIG_CRYPTO_SERPENT=3Dy
>> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
>> # CONFIG_CRYPTO_SM4 is not set
>> # CONFIG_CRYPTO_SPECK is not set
>> CONFIG_CRYPTO_TEA=3Dy
>> CONFIG_CRYPTO_TWOFISH=3Dy
>> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
>> # CONFIG_CRYPTO_TWOFISH_586 is not set
>>
>> #
>> # Compression
>> #
>> CONFIG_CRYPTO_DEFLATE=3Dy
>> CONFIG_CRYPTO_LZO=3Dy
>> CONFIG_CRYPTO_842=3Dy
>> # CONFIG_CRYPTO_LZ4 is not set
>> # CONFIG_CRYPTO_LZ4HC is not set
>> CONFIG_CRYPTO_ZSTD=3Dy
>>
>> #
>> # Random Number Generation
>> #
>> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
>> CONFIG_CRYPTO_DRBG_MENU=3Dy
>> CONFIG_CRYPTO_DRBG_HMAC=3Dy
>> CONFIG_CRYPTO_DRBG_HASH=3Dy
>> CONFIG_CRYPTO_DRBG_CTR=3Dy
>> CONFIG_CRYPTO_DRBG=3Dy
>> CONFIG_CRYPTO_JITTERENTROPY=3Dy
>> # CONFIG_CRYPTO_USER_API_HASH is not set
>> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
>> # CONFIG_CRYPTO_USER_API_RNG is not set
>> # CONFIG_CRYPTO_USER_API_AEAD is not set
>> CONFIG_CRYPTO_HASH_INFO=3Dy
>> CONFIG_CRYPTO_HW=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
>> # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
>> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
>> CONFIG_CRYPTO_DEV_GEODE=3Dy
>> CONFIG_CRYPTO_DEV_CCP=3Dy
>> # CONFIG_CRYPTO_DEV_CCP_DD is not set
>> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
>> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
>> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
>> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
>> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
>> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
>> # CONFIG_CRYPTO_DEV_VIRTIO is not set
>> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
>> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
>> CONFIG_X509_CERTIFICATE_PARSER=3Dy
>> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
>>
>> #
>> # Certificates for signature checking
>> #
>> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
>> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
>> CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
>> CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
>> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
>> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
>> CONFIG_BINARY_PRINTF=3Dy
>>
>> #
>> # Library routines
>> #
>> CONFIG_BITREVERSE=3Dy
>> CONFIG_RATIONAL=3Dy
>> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>> CONFIG_GENERIC_STRNLEN_USER=3Dy
>> CONFIG_GENERIC_NET_UTILS=3Dy
>> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>> CONFIG_GENERIC_PCI_IOMAP=3Dy
>> CONFIG_GENERIC_IOMAP=3Dy
>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>> CONFIG_CRC_CCITT=3Dy
>> CONFIG_CRC16=3Dy
>> # CONFIG_CRC_T10DIF is not set
>> CONFIG_CRC_ITU_T=3Dy
>> CONFIG_CRC32=3Dy
>> CONFIG_CRC32_SELFTEST=3Dy
>> CONFIG_CRC32_SLICEBY8=3Dy
>> # CONFIG_CRC32_SLICEBY4 is not set
>> # CONFIG_CRC32_SARWATE is not set
>> # CONFIG_CRC32_BIT is not set
>> CONFIG_CRC64=3Dy
>> CONFIG_CRC4=3Dy
>> CONFIG_CRC7=3Dy
>> CONFIG_LIBCRC32C=3Dy
>> CONFIG_CRC8=3Dy
>> CONFIG_XXHASH=3Dy
>> CONFIG_RANDOM32_SELFTEST=3Dy
>> CONFIG_842_COMPRESS=3Dy
>> CONFIG_842_DECOMPRESS=3Dy
>> CONFIG_ZLIB_INFLATE=3Dy
>> CONFIG_ZLIB_DEFLATE=3Dy
>> CONFIG_LZO_COMPRESS=3Dy
>> CONFIG_LZO_DECOMPRESS=3Dy
>> CONFIG_LZ4_DECOMPRESS=3Dy
>> CONFIG_ZSTD_COMPRESS=3Dy
>> CONFIG_ZSTD_DECOMPRESS=3Dy
>> CONFIG_XZ_DEC=3Dy
>> CONFIG_XZ_DEC_X86=3Dy
>> CONFIG_XZ_DEC_POWERPC=3Dy
>> CONFIG_XZ_DEC_IA64=3Dy
>> CONFIG_XZ_DEC_ARM=3Dy
>> CONFIG_XZ_DEC_ARMTHUMB=3Dy
>> CONFIG_XZ_DEC_SPARC=3Dy
>> CONFIG_XZ_DEC_BCJ=3Dy
>> # CONFIG_XZ_DEC_TEST is not set
>> CONFIG_DECOMPRESS_GZIP=3Dy
>> CONFIG_DECOMPRESS_BZIP2=3Dy
>> CONFIG_DECOMPRESS_LZMA=3Dy
>> CONFIG_DECOMPRESS_XZ=3Dy
>> CONFIG_DECOMPRESS_LZO=3Dy
>> CONFIG_DECOMPRESS_LZ4=3Dy
>> CONFIG_GENERIC_ALLOCATOR=3Dy
>> CONFIG_INTERVAL_TREE=3Dy
>> CONFIG_RADIX_TREE_MULTIORDER=3Dy
>> CONFIG_ASSOCIATIVE_ARRAY=3Dy
>> CONFIG_HAS_IOMEM=3Dy
>> CONFIG_HAS_IOPORT_MAP=3Dy
>> CONFIG_HAS_DMA=3Dy
>> CONFIG_NEED_SG_DMA_LENGTH=3Dy
>> CONFIG_NEED_DMA_MAP_STATE=3Dy
>> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
>> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
>> CONFIG_DMA_DIRECT_OPS=3Dy
>> CONFIG_SWIOTLB=3Dy
>> CONFIG_SGL_ALLOC=3Dy
>> # CONFIG_CPUMASK_OFFSTACK is not set
>> CONFIG_CPU_RMAP=3Dy
>> CONFIG_DQL=3Dy
>> CONFIG_GLOB=3Dy
>> CONFIG_GLOB_SELFTEST=3Dy
>> CONFIG_NLATTR=3Dy
>> CONFIG_CLZ_TAB=3Dy
>> CONFIG_CORDIC=3Dy
>> CONFIG_DDR=3Dy
>> # CONFIG_IRQ_POLL is not set
>> CONFIG_MPILIB=3Dy
>> CONFIG_OID_REGISTRY=3Dy
>> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
>> CONFIG_STACKDEPOT=3Dy
>> CONFIG_PRIME_NUMBERS=3Dy
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
>> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>> # CONFIG_BOOT_PRINTK_DELAY is not set
>> # CONFIG_DYNAMIC_DEBUG is not set
>>
>> #
>> # Compile-time checks and compiler options
>> #
>> CONFIG_DEBUG_INFO=3Dy
>> CONFIG_DEBUG_INFO_REDUCED=3Dy
>> # CONFIG_DEBUG_INFO_SPLIT is not set
>> # CONFIG_DEBUG_INFO_DWARF4 is not set
>> # CONFIG_GDB_SCRIPTS is not set
>> # CONFIG_ENABLE_MUST_CHECK is not set
>> CONFIG_FRAME_WARN=3D1024
>> # CONFIG_STRIP_ASM_SYMS is not set
>> # CONFIG_READABLE_ASM is not set
>> CONFIG_UNUSED_SYMBOLS=3Dy
>> # CONFIG_PAGE_OWNER is not set
>> CONFIG_DEBUG_FS=3Dy
>> CONFIG_HEADERS_CHECK=3Dy
>> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
>> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> CONFIG_FRAME_POINTER=3Dy
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
>> # CONFIG_PAGE_POISONING is not set
>> CONFIG_DEBUG_PAGE_REF=3Dy
>> # CONFIG_DEBUG_RODATA_TEST is not set
>> CONFIG_DEBUG_OBJECTS=3Dy
>> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
>> # CONFIG_DEBUG_OBJECTS_FREE is not set
>> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
>> # CONFIG_DEBUG_OBJECTS_WORK is not set
>> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
>> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
>> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
>> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>> # CONFIG_DEBUG_KMEMLEAK is not set
>> CONFIG_DEBUG_STACK_USAGE=3Dy
>> # CONFIG_DEBUG_VM is not set
>> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
>> CONFIG_DEBUG_VIRTUAL=3Dy
>> CONFIG_DEBUG_MEMORY_INIT=3Dy
>> CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dy
>> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
>> # CONFIG_DEBUG_HIGHMEM is not set
>> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
>> CONFIG_DEBUG_STACKOVERFLOW=3Dy
>> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
>> CONFIG_DEBUG_SHIRQ=3Dy
>>
>> #
>> # Debug Lockups and Hangs
>> #
>> # CONFIG_SOFTLOCKUP_DETECTOR is not set
>> # CONFIG_HARDLOCKUP_DETECTOR is not set
>> # CONFIG_DETECT_HUNG_TASK is not set
>> # CONFIG_WQ_WATCHDOG is not set
>> # CONFIG_PANIC_ON_OOPS is not set
>> CONFIG_PANIC_ON_OOPS_VALUE=3D0
>> CONFIG_PANIC_TIMEOUT=3D0
>> CONFIG_SCHED_DEBUG=3Dy
>> # CONFIG_SCHEDSTATS is not set
>> # CONFIG_SCHED_STACK_END_CHECK is not set
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
>> # CONFIG_DEBUG_MUTEXES is not set
>> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
>> # CONFIG_DEBUG_RWSEMS is not set
>> # CONFIG_DEBUG_LOCK_ALLOC is not set
>> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>> # CONFIG_LOCK_TORTURE_TEST is not set
>> CONFIG_WW_MUTEX_SELFTEST=3Dy
>> CONFIG_TRACE_IRQFLAGS=3Dy
>> CONFIG_STACKTRACE=3Dy
>> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
>> # CONFIG_DEBUG_KOBJECT is not set
>> CONFIG_DEBUG_BUGVERBOSE=3Dy
>> CONFIG_DEBUG_LIST=3Dy
>> CONFIG_DEBUG_PI_LIST=3Dy
>> CONFIG_DEBUG_SG=3Dy
>> # CONFIG_DEBUG_NOTIFIERS is not set
>> CONFIG_DEBUG_CREDENTIALS=3Dy
>>
>> #
>> # RCU Debugging
>> #
>> CONFIG_TORTURE_TEST=3Dy
>> # CONFIG_RCU_PERF_TEST is not set
>> CONFIG_RCU_TORTURE_TEST=3Dy
>> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
>> CONFIG_RCU_TRACE=3Dy
>> CONFIG_RCU_EQS_DEBUG=3Dy
>> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
>> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
>> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
>> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
>> CONFIG_FAULT_INJECTION=3Dy
>> CONFIG_FAIL_PAGE_ALLOC=3Dy
>> CONFIG_FAIL_FUTEX=3Dy
>> # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
>> # CONFIG_LATENCYTOP is not set
>> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>> CONFIG_NOP_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>> CONFIG_HAVE_FENTRY=3Dy
>> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>> CONFIG_TRACER_MAX_TRACE=3Dy
>> CONFIG_TRACE_CLOCK=3Dy
>> CONFIG_RING_BUFFER=3Dy
>> CONFIG_EVENT_TRACING=3Dy
>> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
>> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
>> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
>> CONFIG_TRACING=3Dy
>> CONFIG_GENERIC_TRACER=3Dy
>> CONFIG_TRACING_SUPPORT=3Dy
>> CONFIG_FTRACE=3Dy
>> CONFIG_FUNCTION_TRACER=3Dy
>> # CONFIG_FUNCTION_GRAPH_TRACER is not set
>> CONFIG_PREEMPTIRQ_EVENTS=3Dy
>> CONFIG_IRQSOFF_TRACER=3Dy
>> # CONFIG_SCHED_TRACER is not set
>> CONFIG_HWLAT_TRACER=3Dy
>> CONFIG_FTRACE_SYSCALLS=3Dy
>> CONFIG_TRACER_SNAPSHOT=3Dy
>> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
>> CONFIG_BRANCH_PROFILE_NONE=3Dy
>> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
>> # CONFIG_PROFILE_ALL_BRANCHES is not set
>> CONFIG_STACK_TRACER=3Dy
>> # CONFIG_UPROBE_EVENTS is not set
>> CONFIG_DYNAMIC_FTRACE=3Dy
>> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> # CONFIG_FUNCTION_PROFILER is not set
>> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
>> # CONFIG_FTRACE_STARTUP_TEST is not set
>> CONFIG_MMIOTRACE=3Dy
>> CONFIG_TRACING_MAP=3Dy
>> CONFIG_HIST_TRIGGERS=3Dy
>> CONFIG_TRACEPOINT_BENCHMARK=3Dy
>> CONFIG_RING_BUFFER_BENCHMARK=3Dy
>> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
>> # CONFIG_TRACE_EVAL_MAP_FILE is not set
>> # CONFIG_TRACING_EVENTS_GPIO is not set
>> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
>> # CONFIG_DMA_API_DEBUG is not set
>> # CONFIG_RUNTIME_TESTING_MENU is not set
>> CONFIG_MEMTEST=3Dy
>> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
>> # CONFIG_SAMPLES is not set
>> CONFIG_HAVE_ARCH_KGDB=3Dy
>> # CONFIG_KGDB is not set
>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>> CONFIG_UBSAN=3Dy
>> # CONFIG_UBSAN_SANITIZE_ALL is not set
>> # CONFIG_UBSAN_ALIGNMENT is not set
>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>> # CONFIG_STRICT_DEVMEM is not set
>> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>> CONFIG_X86_VERBOSE_BOOTUP=3Dy
>> CONFIG_EARLY_PRINTK=3Dy
>> # CONFIG_EARLY_PRINTK_DBGP is not set
>> # CONFIG_EARLY_PRINTK_USB_XDBC is not set
>> # CONFIG_X86_PTDUMP is not set
>> # CONFIG_DEBUG_WX is not set
>> CONFIG_DOUBLEFAULT=3Dy
>> # CONFIG_DEBUG_TLBFLUSH is not set
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
>> CONFIG_DEBUG_BOOT_PARAMS=3Dy
>> # CONFIG_CPA_DEBUG is not set
>> # CONFIG_OPTIMIZE_INLINING is not set
>> CONFIG_DEBUG_ENTRY=3Dy
>> # CONFIG_DEBUG_NMI_SELFTEST is not set
>> # CONFIG_X86_DEBUG_FPU is not set
>> CONFIG_PUNIT_ATOM_DEBUG=3Dy
>> CONFIG_UNWINDER_FRAME_POINTER=3Dy


--===============4151744138439538089==--

