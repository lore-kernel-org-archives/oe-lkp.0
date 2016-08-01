Content-Type: multipart/mixed; boundary="===============3584356779745666276=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [blk-core] [ 26.071841] BUG: unable to handle kernel NULL pointer dereference at 000000000000005f
Date: Mon, 01 Aug 2016 10:07:16 +0800
Message-ID: <20160801020716.GA1298@wfg-t540p.sh.intel.com>
In-Reply-To: <20160801020442.GA57768@MinfeideMacBook-Pro.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============3584356779745666276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2016 at 10:04:42AM +0800, Minfei Huang wrote:
>On 08/01/16 at 09:34P, Fengguang Wu wrote:
>> Hi Minfei,
>>
>> It seems your patch discloses another bug.
>
>Hi, Fengguang.
>
>Yes, As I talked it with Xiaolong, I will try to post a patch to fix it
>in floppy driver.

OK, thank you, Minfei!

Thanks,
Fengguang

>> https://github.com/0day-ci/linux Minfei-Huang/blk-core-Fix-the-bad-IO-du=
ring-checking-bio/20160728-182758
>>
>> commit ee5c4fef9f2ef03ee8f283a5b24192df00e17f0f
>> Author:     Minfei Huang <mnghuan@gmail.com>
>> AuthorDate: Thu Jul 28 18:19:44 2016 +0800
>> Commit:     0day robot <fengguang.wu@intel.com>
>> CommitDate: Thu Jul 28 18:28:00 2016 +0800
>>
>>      blk-core: Fix the bad IO during checking bio
>>
>>      We will handle IO as a bad IO, if its range exceeds the disk's capa=
city
>>      in function bio_check_eod. Also we should catch the corner case if
>>      inode->i_size is set to 0 during disabling disk.
>>
>>      Fix the coming IO as a bad IO as well, if inode->i_size is set to 0.
>>
>>      Signed-off-by: Minfei Huang <mnghuan@gmail.com>
>>      Signed-off-by: Minfei Huang <minfei.hmf@alibaba-inc.com>
>>
>> +-----------------------------------------------------------+-----------=
-+------------+-------------+
>> |                                                           | b013517951=
 | ee5c4fef9f | v4.7_072909 |
>> +-----------------------------------------------------------+-----------=
-+------------+-------------+
>> | boot_successes                                            | 4         =
 | 59         | 1           |
>> | boot_failures                                             | 174       =
 | 2          | 20          |
>> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 174     =
   |            |             |
>> | BUG:unable_to_handle_kernel                               | 0         =
 | 2          | 18          |
>> | Oops                                                      | 0         =
 | 2          | 18          |
>> | RIP:__wake_up_common                                      | 0         =
 | 2          | 18          |
>> | Kernel_panic-not_syncing:Fatal_exception                  | 0         =
 | 2          | 18          |
>> | backtrace:do_sys_open                                     | 0         =
 | 2          | 5           |
>> | backtrace:SyS_open                                        | 0         =
 | 2          | 5           |
>> | backtrace:compat_SyS_mount                                | 0         =
 | 0          | 2           |
>> | IP-Config:Auto-configuration_of_network_failed            | 0         =
 | 0          | 2           |
>> | backtrace:SyS_mount                                       | 0         =
 | 0          | 11          |
>> +-----------------------------------------------------------+-----------=
-+------------+-------------+
>>
>> [   26.066057] attempt to access beyond end of device
>> [   26.068089] fd0: rw=3D0, want=3D8, limit=3D0
>> [   26.069839] floppy: error -5 while reading block 0
>> [   26.071841] BUG: unable to handle kernel NULL pointer dereference at =
000000000000005f
>> [   26.075498] IP: [<ffffffff810c4a54>] __wake_up_common+0x24/0x80
>> [   26.077909] PGD b0f1067 PUD b1d9067 PMD 0
>> [   26.080023] Oops: 0000 [#1] PREEMPT
>> [   26.081644] CPU: 0 PID: 413 Comm: trinity-main Not tainted 4.7.0-rc2-=
00241-gee5c4fe #1
>> [   26.085048] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS Debian-1.8.2-1 04/01/2014
>> [   26.104977] task: ffff88000ac79580 ti: ffff880011b4c000 task.ti: ffff=
880011b4c000
>> [   26.108267] RIP: 0010:[<ffffffff810c4a54>]  [<ffffffff810c4a54>] __wa=
ke_up_common+0x24/0x80
>> [   26.111912] RSP: 0018:ffff880011b4f8e0  EFLAGS: 00010082
>> [   26.114013] RAX: ffff88000ac79580 RBX: ffff880011b4fa90 RCX: 00000000=
00000000
>> [   26.116583] RDX: 000000000000005f RSI: 0000000000000003 RDI: ffff8800=
11b4fa98
>> [   26.119156] RBP: ffff880011b4f918 R08: 0000000000000000 R09: 00000000=
00000000
>> [   26.121714] R10: ffff880011b4f940 R11: 0000000000000cf8 R12: ffff8800=
11b4fa98
>> [   26.124281] R13: ffff8800126040c0 R14: 0000000000000000 R15: 00000000=
00000003
>> [   26.126834] FS:  00007f994bb4f700(0000) GS:ffffffff8222c000(0000) knl=
GS:0000000000000000
>> [   26.130280] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   26.132499] CR2: 000000000000005f CR3: 0000000011aa9000 CR4: 00000000=
000006f0
>> [   26.135084] Stack:
>> [   26.136327]  00000001810ced4a 0000000000000000 ffff880011b4fa90 00000=
00000000202
>> [   26.140082]  ffff8800126040c0 0000000000000000 ffff8800126040c0 ffff8=
80011b4f928
>> [   26.143777]  ffffffff810c4d5e ffff880011b4f948 ffffffff810c57bb ffff8=
80011b4fa88
>> [   26.147469] Call Trace:
>> [   26.148842]  [<ffffffff810c4d5e>] __wake_up_locked+0xe/0x10
>> [   26.151035]  [<ffffffff810c57bb>] complete+0x3b/0x70
>> [   26.153050]  [<ffffffff81646cde>] floppy_rb0_cb+0x1e/0x50
>> [   26.155181]  [<ffffffff8149d6b0>] bio_endio+0x50/0x60
>> [   26.157208]  [<ffffffff8149f4cb>] generic_make_request_checks+0x13b/0=
x260
>> [   26.159699]  [<ffffffff814a13ef>] generic_make_request+0x1f/0x1d0
>> [   26.162008]  [<ffffffff814a1602>] submit_bio+0x62/0x130
>> [   26.164104]  [<ffffffff81646dd5>] __floppy_read_block_0+0xc5/0x140
>> [   26.166408]  [<ffffffff81646cc0>] ? floppy_cmos_show+0x30/0x30
>> [   26.168649]  [<ffffffff81649516>] floppy_revalidate+0x216/0x250
>> [   26.170922]  [<ffffffff8119abd7>] check_disk_change+0x57/0x70
>> [   26.173123]  [<ffffffff816471aa>] floppy_open+0x19a/0x3d0
>> [   26.175253]  [<ffffffff8119a075>] __blkdev_get+0xa5/0x380
>> [   26.177366]  [<ffffffff811988b0>] ? blkdev_get_block+0x20/0x20
>> [   26.179587]  [<ffffffff8119a46d>] blkdev_get+0x11d/0x360
>> [   26.181684]  [<ffffffff8117f2d3>] ? unlock_new_inode+0x43/0x80
>> [   26.184158]  [<ffffffff8119999f>] ? bdget+0x11f/0x140
>> [   26.186406]  [<ffffffff8119a6b0>] ? blkdev_get+0x360/0x360
>> [   26.188783]  [<ffffffff8119a706>] blkdev_open+0x56/0x70
>> [   26.190923]  [<ffffffff81161e30>] do_dentry_open+0x1b0/0x2b0
>> [   26.193268]  [<ffffffff8116309b>] vfs_open+0x4b/0x60
>> [   26.195290]  [<ffffffff811715b0>] path_openat+0x810/0x12f0
>> [   26.197419]  [<ffffffff81170d3c>] ? filename_lookup+0xac/0x110
>> [   26.199662]  [<ffffffff81172b17>] do_filp_open+0x77/0xd0
>> [   26.201758]  [<ffffffff810c0e63>] ? __might_sleep+0x43/0x80
>> [   26.203937]  [<ffffffff811634e1>] do_sys_open+0x111/0x1f0
>> [   26.206066]  [<ffffffff811635d9>] SyS_open+0x19/0x20
>> [   26.208107]  [<ffffffff81ad1633>] entry_SYSCALL_64_fastpath+0x1e/0xa8
>> [   26.210486] Code: 1f 84 00 00 00 00 00 55 48 89 e5 41 57 41 56 41 55 =
41 54 41 89 f7 53 49 89 fc 41 89 ce 48 83 ec 10 89 55 cc 48 8b 17 4c 89 45 =
d0 <48> 8b 32 48 39 d7 48 8d 42 e8 4c 8d 6e e8 75 05 eb 38 49 89 d5
>> [   26.224423] RIP  [<ffffffff810c4a54>] __wake_up_common+0x24/0x80
>> [   26.226803]  RSP <ffff880011b4f8e0>
>> [   26.228431] CR2: 000000000000005f
>> [   26.230029] ---[ end trace 98aeaa7a55e70358 ]---
>> [   26.231949] Kernel panic - not syncing: Fatal exception
>>
>> git bisect start 928b83cee4f252d8003ee591c436e5414ffa9a24 523d939ef98fd7=
12632d93a5a2b588e477a7565e --
>> git bisect good 75b3e42de358cee6ae2f2dcb9a4b4c245c93e1c7  # 08:48     22=
+      2  Merge 'linux-review/Bhaktipriya-Shridhar/usb-host-u132-hcd-Remove=
-deprecated-create_singlethread_workqueue/20160727-172301' into devel-hourl=
y-2016072909
>> git bisect good 3a7d6780fa9998d1519965a09c15d02da9485656  # 08:58     22=
+     24  Merge 'linux-review/Trond-Myklebust/More-layoutreturn-nits/201607=
23-035950' into devel-hourly-2016072909
>> git bisect good 735ea11fd623dc66b81de7e23723ae8c4f32c426  # 09:10     21=
+     22  Merge 'linux-review/Florian-Fainelli/net-nb8800-Fix-SKB-leak-in-n=
b8800_receive/20160716-074658' into devel-hourly-2016072909
>> git bisect good 4c9d6fc0b16bfe6594b08675fb0910aba6838b57  # 11:41     22=
+      9  Merge 'linux-review/Vivien-Didelot/net-bridge-br_set_ageing_time-=
takes-a-clock_t/20160723-130207' into devel-hourly-2016072909
>> git bisect good af28c17d615b8806c9fd44a150ddc720d3f6d2ee  # 16:26     22=
+      9  Merge 'linux-review/Bob-Copeland/ath9k-fix-misleading-indent/2016=
0725-060628' into devel-hourly-2016072909
>> git bisect  bad 0692d159217ecc7a5ba7c7793a23dda68b93f085  # 16:43      0=
-     22  Merge 'linux-review/Tetsuo-Handa/netfilter-x_tables-fix-kmemcheck=
-warning/20160724-154742' into devel-hourly-2016072909
>> git bisect  bad eb22add4042fc07be7406027d1c80e4a7be26aa6  # 16:50      0=
-     23  Merge 'linux-review/Arnd-Bergmann/net-ncsi-avoid-maybe-uninitiali=
zed-warning/20160724-050641' into devel-hourly-2016072909
>> git bisect good ae00336f2186c6fa0e49b28b1f9678402a699624  # 16:56     22=
+      2  Merge 'linux-review/Toke-H-iland-J-rgensen/mac80211-Keep-CoDel-st=
ats-per-txq-export-them-in-debugfs/20160725-052722' into devel-hourly-20160=
72909
>> git bisect good 62e6a36fdb12d844c6654cfb6518dbdf6ac9614e  # 17:00     22=
+     22  Merge 'linux-review/Michal-Kazior/ath10k-silence-firmware-file-pr=
obing-warnings/20160725-052522' into devel-hourly-2016072909
>> git bisect  bad 51d4759525223ec7ad43ed3768e7e9ed7fe59b7f  # 21:53     18=
-      5  Merge 'linux-review/Minfei-Huang/blk-core-Fix-the-bad-IO-during-c=
hecking-bio/20160728-182758' into devel-hourly-2016072909
>> git bisect  bad ee5c4fef9f2ef03ee8f283a5b24192df00e17f0f  # 23:38      0=
-      1  blk-core: Fix the bad IO during checking bio
>> # first bad commit: [ee5c4fef9f2ef03ee8f283a5b24192df00e17f0f] blk-core:=
 Fix the bad IO during checking bio
>> git bisect good b013517951a168c4f60a633e3f39185897cd052f  # 23:51    178=
+    174  Merge branch 'for-4.8/core' into for-next
>> # extra tests with CONFIG_DEBUG_INFO_REDUCED
>> git bisect  bad ee5c4fef9f2ef03ee8f283a5b24192df00e17f0f  # 23:56      0=
-     22  blk-core: Fix the bad IO during checking bio
>> # extra tests on HEAD of linux-devel/devel-hourly-2016072909
>> git bisect  bad 928b83cee4f252d8003ee591c436e5414ffa9a24  # 23:56      0=
-     20  0day head guard for 'devel-hourly-2016072909'
>> # extra tests on tree/branch linux-review/Minfei-Huang/blk-core-Fix-the-=
bad-IO-during-checking-bio/20160728-182758
>> git bisect  bad ee5c4fef9f2ef03ee8f283a5b24192df00e17f0f  # 00:01      0=
-      2  blk-core: Fix the bad IO during checking bio
>> # extra tests with first bad commit reverted
>> git bisect good 97cc0ec780ab620f71ab4abc730eca1aa17acd6a  # 00:11    310=
+    182  Revert "blk-core: Fix the bad IO during checking bio"
>> # extra tests on tree/branch linus/master
>> git bisect good 797cee982eef9195736afc5e7f3b8f613c41d19a  # 00:33    300=
+    103  Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoor=
e/audit
>> # extra tests on tree/branch linux-next/master
>> git bisect good d4cef4349fe6295725447473a6f7af6a7d2d7f8d  # 01:58    310=
+    121  Add linux-next specific files for 20160729
>>
>>
>> This script may reproduce the error.
>>
>> ------------------------------------------------------------------------=
----
>> #!/bin/bash
>>
>> kernel=3D$1
>> initrd=3Dquantal-core-x86_64.cgz
>>
>> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/=
master/initrd/$initrd
>>
>> kvm=3D(
>> 	qemu-system-x86_64
>> 	-enable-kvm
>> 	-cpu kvm64
>> 	-kernel $kernel
>> 	-initrd $initrd
>> 	-m 300
>> 	-smp 2
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
>> 	panic=3D-1
>> 	softlockup_panic=3D1
>> 	nmi_watchdog=3Dpanic
>> 	oops=3Dpanic
>> 	load_ramdisk=3D2
>> 	prompt_ramdisk=3D0
>> 	systemd.log_level=3Derr
>> 	ignore_loglevel
>> 	earlyprintk=3DttyS0,115200
>> 	console=3DttyS0,115200
>> 	console=3Dtty0
>> 	vga=3Dnormal
>> 	rw
>> 	drbd.minor_count=3D8
>> )
>>
>> "${kvm[@]}" --append "${append[*]}"
>> ------------------------------------------------------------------------=
----
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation
>
>
>
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86_64 4.7.0-rc2 Kernel Configuration
>> #
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
>> CONFIG_NEED_DMA_MAP_STATE=3Dy
>> CONFIG_NEED_SG_DMA_LENGTH=3Dy
>> CONFIG_GENERIC_ISA_DMA=3Dy
>> CONFIG_GENERIC_BUG=3Dy
>> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
>> CONFIG_GENERIC_HWEIGHT=3Dy
>> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
>> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
>> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
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
>> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-rdi -fcall-saved-rsi -fcall-s=
aved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 =
-fcall-saved-r11"
>> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>> CONFIG_FIX_EARLYCON_MEM=3Dy
>> CONFIG_DEBUG_RODATA=3Dy
>> CONFIG_PGTABLE_LEVELS=3D4
>> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>> CONFIG_IRQ_WORK=3Dy
>> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
>>
>> #
>> # General setup
>> #
>> CONFIG_BROKEN_ON_SMP=3Dy
>> CONFIG_INIT_ENV_ARG_LIMIT=3D32
>> CONFIG_CROSS_COMPILE=3D""
>> # CONFIG_COMPILE_TEST is not set
>> CONFIG_LOCALVERSION=3D""
>> CONFIG_LOCALVERSION_AUTO=3Dy
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
>> # CONFIG_KERNEL_LZO is not set
>> CONFIG_KERNEL_LZ4=3Dy
>> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>> # CONFIG_SWAP is not set
>> CONFIG_SYSVIPC=3Dy
>> CONFIG_SYSVIPC_SYSCTL=3Dy
>> # CONFIG_POSIX_MQUEUE is not set
>> CONFIG_CROSS_MEMORY_ATTACH=3Dy
>> CONFIG_FHANDLE=3Dy
>> CONFIG_USELIB=3Dy
>> # CONFIG_AUDIT is not set
>> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>>
>> #
>> # IRQ subsystem
>> #
>> CONFIG_GENERIC_IRQ_PROBE=3Dy
>> CONFIG_GENERIC_IRQ_SHOW=3Dy
>> CONFIG_IRQ_DOMAIN=3Dy
>> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
>> CONFIG_IRQ_FORCED_THREADING=3Dy
>> CONFIG_SPARSE_IRQ=3Dy
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
>> CONFIG_TICK_ONESHOT=3Dy
>> CONFIG_HZ_PERIODIC=3Dy
>> # CONFIG_NO_HZ_IDLE is not set
>> CONFIG_NO_HZ=3Dy
>> CONFIG_HIGH_RES_TIMERS=3Dy
>>
>> #
>> # CPU/Task time and stats accounting
>> #
>> # CONFIG_TICK_CPU_ACCOUNTING is not set
>> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
>> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_BSD_PROCESS_ACCT=3Dy
>> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
>> # CONFIG_TASKSTATS is not set
>>
>> #
>> # RCU Subsystem
>> #
>> CONFIG_PREEMPT_RCU=3Dy
>> CONFIG_RCU_EXPERT=3Dy
>> CONFIG_SRCU=3Dy
>> # CONFIG_TASKS_RCU is not set
>> CONFIG_RCU_STALL_COMMON=3Dy
>> CONFIG_RCU_FANOUT=3D64
>> CONFIG_RCU_FANOUT_LEAF=3D16
>> # CONFIG_TREE_RCU_TRACE is not set
>> CONFIG_RCU_BOOST=3Dy
>> CONFIG_RCU_KTHREAD_PRIO=3D1
>> CONFIG_RCU_BOOST_DELAY=3D500
>> # CONFIG_RCU_NOCB_CPU is not set
>> # CONFIG_RCU_EXPEDITE_BOOT is not set
>> CONFIG_BUILD_BIN2C=3Dy
>> CONFIG_IKCONFIG=3Dy
>> CONFIG_IKCONFIG_PROC=3Dy
>> CONFIG_LOG_BUF_SHIFT=3D17
>> CONFIG_NMI_LOG_BUF_SHIFT=3D13
>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
>> CONFIG_ARCH_SUPPORTS_INT128=3Dy
>> CONFIG_CGROUPS=3Dy
>> # CONFIG_MEMCG is not set
>> # CONFIG_BLK_CGROUP is not set
>> # CONFIG_CGROUP_SCHED is not set
>> # CONFIG_CGROUP_PIDS is not set
>> # CONFIG_CGROUP_FREEZER is not set
>> # CONFIG_CGROUP_HUGETLB is not set
>> # CONFIG_CPUSETS is not set
>> # CONFIG_CGROUP_DEVICE is not set
>> # CONFIG_CGROUP_CPUACCT is not set
>> # CONFIG_CGROUP_PERF is not set
>> # CONFIG_CGROUP_DEBUG is not set
>> # CONFIG_CHECKPOINT_RESTORE is not set
>> CONFIG_NAMESPACES=3Dy
>> # CONFIG_UTS_NS is not set
>> CONFIG_IPC_NS=3Dy
>> CONFIG_USER_NS=3Dy
>> # CONFIG_PID_NS is not set
>> CONFIG_NET_NS=3Dy
>> # CONFIG_SCHED_AUTOGROUP is not set
>> # CONFIG_SYSFS_DEPRECATED is not set
>> CONFIG_RELAY=3Dy
>> CONFIG_BLK_DEV_INITRD=3Dy
>> CONFIG_INITRAMFS_SOURCE=3D""
>> CONFIG_RD_GZIP=3Dy
>> # CONFIG_RD_BZIP2 is not set
>> # CONFIG_RD_LZMA is not set
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
>> # CONFIG_EXPERT is not set
>> CONFIG_UID16=3Dy
>> CONFIG_MULTIUSER=3Dy
>> CONFIG_SGETMASK_SYSCALL=3Dy
>> CONFIG_SYSFS_SYSCALL=3Dy
>> # CONFIG_SYSCTL_SYSCALL is not set
>> CONFIG_KALLSYMS=3Dy
>> # CONFIG_KALLSYMS_ALL is not set
>> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
>> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>> CONFIG_PRINTK=3Dy
>> CONFIG_PRINTK_NMI=3Dy
>> CONFIG_BUG=3Dy
>> CONFIG_ELF_CORE=3Dy
>> CONFIG_PCSPKR_PLATFORM=3Dy
>> CONFIG_BASE_FULL=3Dy
>> CONFIG_FUTEX=3Dy
>> CONFIG_EPOLL=3Dy
>> CONFIG_SIGNALFD=3Dy
>> CONFIG_TIMERFD=3Dy
>> CONFIG_EVENTFD=3Dy
>> # CONFIG_BPF_SYSCALL is not set
>> CONFIG_SHMEM=3Dy
>> CONFIG_AIO=3Dy
>> CONFIG_ADVISE_SYSCALLS=3Dy
>> # CONFIG_USERFAULTFD is not set
>> CONFIG_PCI_QUIRKS=3Dy
>> CONFIG_MEMBARRIER=3Dy
>> # CONFIG_EMBEDDED is not set
>> CONFIG_HAVE_PERF_EVENTS=3Dy
>>
>> #
>> # Kernel Performance Events And Counters
>> #
>> CONFIG_PERF_EVENTS=3Dy
>> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>> CONFIG_VM_EVENT_COUNTERS=3Dy
>> # CONFIG_COMPAT_BRK is not set
>> CONFIG_SLAB=3Dy
>> # CONFIG_SLUB is not set
>> # CONFIG_SLAB_FREELIST_RANDOM is not set
>> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
>> CONFIG_PROFILING=3Dy
>> CONFIG_KEXEC_CORE=3Dy
>> # CONFIG_OPROFILE is not set
>> CONFIG_HAVE_OPROFILE=3Dy
>> CONFIG_OPROFILE_NMI_TIMER=3Dy
>> CONFIG_JUMP_LABEL=3Dy
>> CONFIG_STATIC_KEYS_SELFTEST=3Dy
>> # CONFIG_UPROBES is not set
>> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>> CONFIG_HAVE_IOREMAP_PROT=3Dy
>> CONFIG_HAVE_KPROBES=3Dy
>> CONFIG_HAVE_KRETPROBES=3Dy
>> CONFIG_HAVE_OPTPROBES=3Dy
>> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>> CONFIG_HAVE_NMI=3Dy
>> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>> CONFIG_HAVE_DMA_API_DEBUG=3Dy
>> CONFIG_HAVE_HW_BREAKPOINT=3Dy
>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>> CONFIG_HAVE_PERF_REGS=3Dy
>> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
>> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>> CONFIG_SECCOMP_FILTER=3Dy
>> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
>> CONFIG_CC_STACKPROTECTOR=3Dy
>> # CONFIG_CC_STACKPROTECTOR_NONE is not set
>> CONFIG_CC_STACKPROTECTOR_REGULAR=3Dy
>> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
>> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
>> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
>> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
>> CONFIG_MODULES_USE_ELF_RELA=3Dy
>> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>> CONFIG_HAVE_EXIT_THREAD=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS=3D28
>> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
>> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>> CONFIG_HAVE_STACK_VALIDATION=3Dy
>> # CONFIG_HAVE_ARCH_HASH is not set
>> CONFIG_OLD_SIGSUSPEND3=3Dy
>> CONFIG_COMPAT_OLD_SIGACTION=3Dy
>> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
>>
>> #
>> # GCOV-based kernel profiling
>> #
>> # CONFIG_GCOV_KERNEL is not set
>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
>> CONFIG_SLABINFO=3Dy
>> CONFIG_RT_MUTEXES=3Dy
>> CONFIG_BASE_SMALL=3D0
>> # CONFIG_MODULES is not set
>> CONFIG_MODULES_TREE_LOOKUP=3Dy
>> CONFIG_BLOCK=3Dy
>> CONFIG_BLK_DEV_BSG=3Dy
>> # CONFIG_BLK_DEV_BSGLIB is not set
>> CONFIG_BLK_DEV_INTEGRITY=3Dy
>> CONFIG_BLK_CMDLINE_PARSER=3Dy
>>
>> #
>> # Partition Types
>> #
>> # CONFIG_PARTITION_ADVANCED is not set
>> CONFIG_AMIGA_PARTITION=3Dy
>> CONFIG_MSDOS_PARTITION=3Dy
>> CONFIG_EFI_PARTITION=3Dy
>> CONFIG_BLOCK_COMPAT=3Dy
>>
>> #
>> # IO Schedulers
>> #
>> CONFIG_IOSCHED_NOOP=3Dy
>> CONFIG_IOSCHED_DEADLINE=3Dy
>> # CONFIG_IOSCHED_CFQ is not set
>> # CONFIG_DEFAULT_DEADLINE is not set
>> CONFIG_DEFAULT_NOOP=3Dy
>> CONFIG_DEFAULT_IOSCHED=3D"noop"
>> CONFIG_ASN1=3Dy
>> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
>> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>> CONFIG_FREEZER=3Dy
>>
>> #
>> # Processor type and features
>> #
>> CONFIG_ZONE_DMA=3Dy
>> # CONFIG_SMP is not set
>> CONFIG_X86_FEATURE_NAMES=3Dy
>> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
>> # CONFIG_X86_X2APIC is not set
>> # CONFIG_X86_MPPARSE is not set
>> # CONFIG_GOLDFISH is not set
>> CONFIG_X86_EXTENDED_PLATFORM=3Dy
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
>> # CONFIG_XEN is not set
>> CONFIG_KVM_GUEST=3Dy
>> # CONFIG_KVM_DEBUG_FS is not set
>> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>> CONFIG_PARAVIRT_CLOCK=3Dy
>> CONFIG_NO_BOOTMEM=3Dy
>> # CONFIG_MK8 is not set
>> # CONFIG_MPSC is not set
>> # CONFIG_MCORE2 is not set
>> # CONFIG_MATOM is not set
>> CONFIG_GENERIC_CPU=3Dy
>> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
>> CONFIG_X86_L1_CACHE_SHIFT=3D6
>> CONFIG_X86_TSC=3Dy
>> CONFIG_X86_CMPXCHG64=3Dy
>> CONFIG_X86_CMOV=3Dy
>> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
>> CONFIG_X86_DEBUGCTLMSR=3Dy
>> CONFIG_CPU_SUP_INTEL=3Dy
>> CONFIG_CPU_SUP_AMD=3Dy
>> CONFIG_CPU_SUP_CENTAUR=3Dy
>> CONFIG_HPET_TIMER=3Dy
>> CONFIG_HPET_EMULATE_RTC=3Dy
>> CONFIG_DMI=3Dy
>> # CONFIG_GART_IOMMU is not set
>> # CONFIG_CALGARY_IOMMU is not set
>> CONFIG_SWIOTLB=3Dy
>> CONFIG_IOMMU_HELPER=3Dy
>> CONFIG_NR_CPUS=3D1
>> # CONFIG_PREEMPT_NONE is not set
>> # CONFIG_PREEMPT_VOLUNTARY is not set
>> CONFIG_PREEMPT=3Dy
>> CONFIG_PREEMPT_COUNT=3Dy
>> CONFIG_UP_LATE_INIT=3Dy
>> CONFIG_X86_LOCAL_APIC=3Dy
>> CONFIG_X86_IO_APIC=3Dy
>> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
>> CONFIG_X86_MCE=3Dy
>> # CONFIG_X86_MCE_INTEL is not set
>> # CONFIG_X86_MCE_AMD is not set
>> # CONFIG_X86_MCE_INJECT is not set
>>
>> #
>> # Performance monitoring
>> #
>> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
>> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
>> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
>> # CONFIG_PERF_EVENTS_AMD_POWER is not set
>> # CONFIG_VM86 is not set
>> CONFIG_X86_16BIT=3Dy
>> CONFIG_X86_ESPFIX64=3Dy
>> CONFIG_X86_VSYSCALL_EMULATION=3Dy
>> # CONFIG_I8K is not set
>> # CONFIG_MICROCODE is not set
>> CONFIG_X86_MSR=3Dy
>> CONFIG_X86_CPUID=3Dy
>> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
>> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
>> CONFIG_X86_DIRECT_GBPAGES=3Dy
>> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
>> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
>> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_SPARSEMEM_MANUAL=3Dy
>> CONFIG_SPARSEMEM=3Dy
>> CONFIG_HAVE_MEMORY_PRESENT=3Dy
>> CONFIG_SPARSEMEM_EXTREME=3Dy
>> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
>> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
>> # CONFIG_SPARSEMEM_VMEMMAP is not set
>> CONFIG_HAVE_MEMBLOCK=3Dy
>> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>> CONFIG_MEMORY_ISOLATION=3Dy
>> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
>> # CONFIG_MEMORY_HOTPLUG is not set
>> CONFIG_SPLIT_PTLOCK_CPUS=3D4
>> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
>> CONFIG_COMPACTION=3Dy
>> CONFIG_MIGRATION=3Dy
>> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
>> CONFIG_PHYS_ADDR_T_64BIT=3Dy
>> # CONFIG_BOUNCE is not set
>> CONFIG_VIRT_TO_BUS=3Dy
>> CONFIG_KSM=3Dy
>> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
>> # CONFIG_MEMORY_FAILURE is not set
>> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
>> CONFIG_NEED_PER_CPU_KM=3Dy
>> # CONFIG_CLEANCACHE is not set
>> CONFIG_CMA=3Dy
>> # CONFIG_CMA_DEBUG is not set
>> # CONFIG_CMA_DEBUGFS is not set
>> CONFIG_CMA_AREAS=3D7
>> CONFIG_ZPOOL=3Dy
>> CONFIG_ZBUD=3Dy
>> CONFIG_Z3FOLD=3Dy
>> # CONFIG_ZSMALLOC is not set
>> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
>> CONFIG_IDLE_PAGE_TRACKING=3Dy
>> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
>> CONFIG_ARCH_HAS_PKEYS=3Dy
>> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
>> CONFIG_X86_PMEM_LEGACY=3Dy
>> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
>> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
>> CONFIG_X86_RESERVE_LOW=3D64
>> CONFIG_MTRR=3Dy
>> # CONFIG_MTRR_SANITIZER is not set
>> CONFIG_X86_PAT=3Dy
>> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
>> CONFIG_ARCH_RANDOM=3Dy
>> CONFIG_X86_SMAP=3Dy
>> CONFIG_X86_INTEL_MPX=3Dy
>> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
>> # CONFIG_EFI is not set
>> CONFIG_SECCOMP=3Dy
>> # CONFIG_HZ_100 is not set
>> # CONFIG_HZ_250 is not set
>> # CONFIG_HZ_300 is not set
>> CONFIG_HZ_1000=3Dy
>> CONFIG_HZ=3D1000
>> CONFIG_SCHED_HRTICK=3Dy
>> CONFIG_KEXEC=3Dy
>> CONFIG_KEXEC_FILE=3Dy
>> # CONFIG_KEXEC_VERIFY_SIG is not set
>> # CONFIG_CRASH_DUMP is not set
>> CONFIG_PHYSICAL_START=3D0x1000000
>> CONFIG_RELOCATABLE=3Dy
>> # CONFIG_RANDOMIZE_BASE is not set
>> CONFIG_PHYSICAL_ALIGN=3D0x200000
>> CONFIG_COMPAT_VDSO=3Dy
>> # CONFIG_LEGACY_VSYSCALL_NATIVE is not set
>> # CONFIG_LEGACY_VSYSCALL_EMULATE is not set
>> CONFIG_LEGACY_VSYSCALL_NONE=3Dy
>> # CONFIG_CMDLINE_BOOL is not set
>> CONFIG_MODIFY_LDT_SYSCALL=3Dy
>> CONFIG_HAVE_LIVEPATCH=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>>
>> #
>> # Power management and ACPI options
>> #
>> CONFIG_SUSPEND=3Dy
>> CONFIG_SUSPEND_FREEZER=3Dy
>> CONFIG_PM_SLEEP=3Dy
>> CONFIG_PM_AUTOSLEEP=3Dy
>> CONFIG_PM_WAKELOCKS=3Dy
>> CONFIG_PM_WAKELOCKS_LIMIT=3D100
>> CONFIG_PM_WAKELOCKS_GC=3Dy
>> CONFIG_PM=3Dy
>> # CONFIG_PM_DEBUG is not set
>> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
>> CONFIG_ACPI=3Dy
>> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
>> # CONFIG_ACPI_DEBUGGER is not set
>> CONFIG_ACPI_SLEEP=3Dy
>> # CONFIG_ACPI_PROCFS_POWER is not set
>> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>> # CONFIG_ACPI_EC_DEBUGFS is not set
>> CONFIG_ACPI_AC=3Dy
>> CONFIG_ACPI_BATTERY=3Dy
>> CONFIG_ACPI_BUTTON=3Dy
>> # CONFIG_ACPI_VIDEO is not set
>> CONFIG_ACPI_FAN=3Dy
>> # CONFIG_ACPI_DOCK is not set
>> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>> CONFIG_ACPI_PROCESSOR=3Dy
>> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
>> CONFIG_ACPI_THERMAL=3Dy
>> # CONFIG_ACPI_CUSTOM_DSDT is not set
>> CONFIG_ACPI_TABLE_UPGRADE=3Dy
>> # CONFIG_ACPI_DEBUG is not set
>> # CONFIG_ACPI_PCI_SLOT is not set
>> CONFIG_X86_PM_TIMER=3Dy
>> # CONFIG_ACPI_CONTAINER is not set
>> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
>> # CONFIG_ACPI_SBS is not set
>> # CONFIG_ACPI_HED is not set
>> # CONFIG_ACPI_CUSTOM_METHOD is not set
>> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
>> # CONFIG_ACPI_NFIT is not set
>> CONFIG_HAVE_ACPI_APEI=3Dy
>> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>> # CONFIG_ACPI_APEI is not set
>> # CONFIG_ACPI_EXTLOG is not set
>> # CONFIG_PMIC_OPREGION is not set
>> CONFIG_SFI=3Dy
>>
>> #
>> # CPU Frequency scaling
>> #
>> CONFIG_CPU_FREQ=3Dy
>> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
>> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
>> CONFIG_CPU_FREQ_STAT=3Dy
>> CONFIG_CPU_FREQ_STAT_DETAILS=3Dy
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>> CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=3Dy
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
>> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
>> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
>> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
>> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
>>
>> #
>> # CPU frequency scaling drivers
>> #
>> # CONFIG_X86_INTEL_PSTATE is not set
>> # CONFIG_X86_PCC_CPUFREQ is not set
>> # CONFIG_X86_ACPI_CPUFREQ is not set
>> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
>> CONFIG_X86_P4_CLOCKMOD=3Dy
>>
>> #
>> # shared options
>> #
>> CONFIG_X86_SPEEDSTEP_LIB=3Dy
>>
>> #
>> # CPU Idle
>> #
>> CONFIG_CPU_IDLE=3Dy
>> # CONFIG_CPU_IDLE_GOV_LADDER is not set
>> CONFIG_CPU_IDLE_GOV_MENU=3Dy
>> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
>> # CONFIG_INTEL_IDLE is not set
>>
>> #
>> # Memory power savings
>> #
>> CONFIG_I7300_IDLE_IOAT_CHANNEL=3Dy
>> CONFIG_I7300_IDLE=3Dy
>>
>> #
>> # Bus options (PCI etc.)
>> #
>> CONFIG_PCI=3Dy
>> CONFIG_PCI_DIRECT=3Dy
>> # CONFIG_PCI_MMCONFIG is not set
>> CONFIG_PCI_DOMAINS=3Dy
>> # CONFIG_PCIEPORTBUS is not set
>> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
>> # CONFIG_PCI_MSI is not set
>> # CONFIG_PCI_DEBUG is not set
>> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
>> # CONFIG_PCI_STUB is not set
>> CONFIG_HT_IRQ=3Dy
>> # CONFIG_PCI_IOV is not set
>> # CONFIG_PCI_PRI is not set
>> # CONFIG_PCI_PASID is not set
>> CONFIG_PCI_LABEL=3Dy
>> # CONFIG_HOTPLUG_PCI is not set
>>
>> #
>> # PCI host controller drivers
>> #
>> # CONFIG_PCIE_DW_PLAT is not set
>> CONFIG_ISA_DMA_API=3Dy
>> CONFIG_AMD_NB=3Dy
>> CONFIG_PCCARD=3Dy
>> CONFIG_PCMCIA=3Dy
>> CONFIG_PCMCIA_LOAD_CIS=3Dy
>> CONFIG_CARDBUS=3Dy
>>
>> #
>> # PC-card bridges
>> #
>> # CONFIG_YENTA is not set
>> # CONFIG_PD6729 is not set
>> # CONFIG_I82092 is not set
>> # CONFIG_RAPIDIO is not set
>> CONFIG_X86_SYSFB=3Dy
>>
>> #
>> # Executable file formats / Emulations
>> #
>> CONFIG_BINFMT_ELF=3Dy
>> CONFIG_COMPAT_BINFMT_ELF=3Dy
>> CONFIG_ELFCORE=3Dy
>> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>> CONFIG_BINFMT_SCRIPT=3Dy
>> # CONFIG_HAVE_AOUT is not set
>> # CONFIG_BINFMT_MISC is not set
>> CONFIG_COREDUMP=3Dy
>> CONFIG_IA32_EMULATION=3Dy
>> # CONFIG_IA32_AOUT is not set
>> CONFIG_X86_X32=3Dy
>> CONFIG_COMPAT=3Dy
>> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
>> CONFIG_SYSVIPC_COMPAT=3Dy
>> CONFIG_KEYS_COMPAT=3Dy
>> CONFIG_X86_DEV_DMA_OPS=3Dy
>> CONFIG_PMC_ATOM=3Dy
>> CONFIG_NET=3Dy
>>
>> #
>> # Networking options
>> #
>> # CONFIG_PACKET is not set
>> CONFIG_UNIX=3Dy
>> # CONFIG_UNIX_DIAG is not set
>> # CONFIG_NET_KEY is not set
>> # CONFIG_INET is not set
>> # CONFIG_NETWORK_SECMARK is not set
>> # CONFIG_NET_PTP_CLASSIFY is not set
>> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
>> # CONFIG_NETFILTER is not set
>> # CONFIG_ATM is not set
>> # CONFIG_BRIDGE is not set
>> # CONFIG_VLAN_8021Q is not set
>> # CONFIG_DECNET is not set
>> # CONFIG_LLC2 is not set
>> # CONFIG_IPX is not set
>> # CONFIG_ATALK is not set
>> # CONFIG_X25 is not set
>> # CONFIG_LAPB is not set
>> # CONFIG_PHONET is not set
>> # CONFIG_IEEE802154 is not set
>> # CONFIG_NET_SCHED is not set
>> # CONFIG_DCB is not set
>> # CONFIG_DNS_RESOLVER is not set
>> # CONFIG_BATMAN_ADV is not set
>> # CONFIG_VSOCKETS is not set
>> # CONFIG_NETLINK_DIAG is not set
>> # CONFIG_MPLS is not set
>> # CONFIG_HSR is not set
>> # CONFIG_SOCK_CGROUP_DATA is not set
>> # CONFIG_CGROUP_NET_PRIO is not set
>> # CONFIG_CGROUP_NET_CLASSID is not set
>> CONFIG_NET_RX_BUSY_POLL=3Dy
>> CONFIG_BQL=3Dy
>>
>> #
>> # Network testing
>> #
>> # CONFIG_HAMRADIO is not set
>> # CONFIG_CAN is not set
>> # CONFIG_IRDA is not set
>> # CONFIG_BT is not set
>> CONFIG_WIRELESS=3Dy
>> # CONFIG_CFG80211 is not set
>> # CONFIG_LIB80211 is not set
>>
>> #
>> # CFG80211 needs to be enabled for MAC80211
>> #
>> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
>> # CONFIG_WIMAX is not set
>> # CONFIG_RFKILL is not set
>> # CONFIG_RFKILL_REGULATOR is not set
>> # CONFIG_NET_9P is not set
>> # CONFIG_CAIF is not set
>> # CONFIG_NFC is not set
>> # CONFIG_LWTUNNEL is not set
>> # CONFIG_DST_CACHE is not set
>> # CONFIG_NET_DEVLINK is not set
>> CONFIG_MAY_USE_DEVLINK=3Dy
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
>> CONFIG_STANDALONE=3Dy
>> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>> CONFIG_FW_LOADER=3Dy
>> # CONFIG_FIRMWARE_IN_KERNEL is not set
>> CONFIG_EXTRA_FIRMWARE=3D""
>> CONFIG_FW_LOADER_USER_HELPER=3Dy
>> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
>> CONFIG_ALLOW_DEV_COREDUMP=3Dy
>> # CONFIG_DEBUG_DRIVER is not set
>> # CONFIG_DEBUG_DEVRES is not set
>> # CONFIG_SYS_HYPERVISOR is not set
>> # CONFIG_GENERIC_CPU_DEVICES is not set
>> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>> CONFIG_REGMAP=3Dy
>> CONFIG_REGMAP_I2C=3Dy
>> CONFIG_REGMAP_SPI=3Dy
>> CONFIG_REGMAP_MMIO=3Dy
>> CONFIG_REGMAP_IRQ=3Dy
>> CONFIG_DMA_SHARED_BUFFER=3Dy
>> CONFIG_FENCE_TRACE=3Dy
>> CONFIG_DMA_CMA=3Dy
>>
>> #
>> # Default contiguous memory area size:
>> #
>> CONFIG_CMA_SIZE_MBYTES=3D0
>> CONFIG_CMA_SIZE_PERCENTAGE=3D0
>> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
>> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
>> CONFIG_CMA_SIZE_SEL_MIN=3Dy
>> # CONFIG_CMA_SIZE_SEL_MAX is not set
>> CONFIG_CMA_ALIGNMENT=3D8
>>
>> #
>> # Bus devices
>> #
>> # CONFIG_CONNECTOR is not set
>> CONFIG_MTD=3Dy
>> # CONFIG_MTD_REDBOOT_PARTS is not set
>> # CONFIG_MTD_CMDLINE_PARTS is not set
>> CONFIG_MTD_OF_PARTS=3Dy
>> CONFIG_MTD_AR7_PARTS=3Dy
>>
>> #
>> # User Modules And Translation Layers
>> #
>> CONFIG_MTD_BLKDEVS=3Dy
>> # CONFIG_MTD_BLOCK is not set
>> # CONFIG_MTD_BLOCK_RO is not set
>> CONFIG_FTL=3Dy
>> CONFIG_NFTL=3Dy
>> CONFIG_NFTL_RW=3Dy
>> CONFIG_INFTL=3Dy
>> # CONFIG_RFD_FTL is not set
>> CONFIG_SSFDC=3Dy
>> # CONFIG_SM_FTL is not set
>> CONFIG_MTD_OOPS=3Dy
>> # CONFIG_MTD_PARTITIONED_MASTER is not set
>>
>> #
>> # RAM/ROM/Flash chip drivers
>> #
>> # CONFIG_MTD_CFI is not set
>> CONFIG_MTD_JEDECPROBE=3Dy
>> CONFIG_MTD_GEN_PROBE=3Dy
>> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
>> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
>> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
>> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
>> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
>> CONFIG_MTD_CFI_I1=3Dy
>> CONFIG_MTD_CFI_I2=3Dy
>> # CONFIG_MTD_CFI_I4 is not set
>> # CONFIG_MTD_CFI_I8 is not set
>> # CONFIG_MTD_CFI_INTELEXT is not set
>> CONFIG_MTD_CFI_AMDSTD=3Dy
>> # CONFIG_MTD_CFI_STAA is not set
>> CONFIG_MTD_CFI_UTIL=3Dy
>> CONFIG_MTD_RAM=3Dy
>> CONFIG_MTD_ROM=3Dy
>> CONFIG_MTD_ABSENT=3Dy
>>
>> #
>> # Mapping drivers for chip access
>> #
>> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
>> # CONFIG_MTD_PHYSMAP is not set
>> CONFIG_MTD_PHYSMAP_OF=3Dy
>> # CONFIG_MTD_PHYSMAP_OF_VERSATILE is not set
>> # CONFIG_MTD_AMD76XROM is not set
>> CONFIG_MTD_ICHXROM=3Dy
>> # CONFIG_MTD_ESB2ROM is not set
>> # CONFIG_MTD_CK804XROM is not set
>> # CONFIG_MTD_SCB2_FLASH is not set
>> # CONFIG_MTD_NETtel is not set
>> CONFIG_MTD_L440GX=3Dy
>> # CONFIG_MTD_PCI is not set
>> CONFIG_MTD_PCMCIA=3Dy
>> CONFIG_MTD_PCMCIA_ANONYMOUS=3Dy
>> CONFIG_MTD_GPIO_ADDR=3Dy
>> # CONFIG_MTD_INTEL_VR_NOR is not set
>> CONFIG_MTD_PLATRAM=3Dy
>> # CONFIG_MTD_LATCH_ADDR is not set
>>
>> #
>> # Self-contained MTD device drivers
>> #
>> # CONFIG_MTD_PMC551 is not set
>> CONFIG_MTD_DATAFLASH=3Dy
>> # CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
>> CONFIG_MTD_DATAFLASH_OTP=3Dy
>> # CONFIG_MTD_M25P80 is not set
>> CONFIG_MTD_SST25L=3Dy
>> CONFIG_MTD_SLRAM=3Dy
>> # CONFIG_MTD_PHRAM is not set
>> CONFIG_MTD_MTDRAM=3Dy
>> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
>> CONFIG_MTDRAM_ERASE_SIZE=3D128
>> CONFIG_MTDRAM_ABS_POS=3D0
>> CONFIG_MTD_BLOCK2MTD=3Dy
>>
>> #
>> # Disk-On-Chip Device Drivers
>> #
>> # CONFIG_MTD_DOCG3 is not set
>> # CONFIG_MTD_NAND is not set
>> # CONFIG_MTD_ONENAND is not set
>>
>> #
>> # LPDDR & LPDDR2 PCM memory drivers
>> #
>> # CONFIG_MTD_LPDDR is not set
>> CONFIG_MTD_SPI_NOR=3Dy
>> # CONFIG_MTD_MT81xx_NOR is not set
>> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
>> CONFIG_MTD_UBI=3Dy
>> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
>> CONFIG_MTD_UBI_BEB_LIMIT=3D20
>> # CONFIG_MTD_UBI_FASTMAP is not set
>> CONFIG_MTD_UBI_GLUEBI=3Dy
>> # CONFIG_MTD_UBI_BLOCK is not set
>> CONFIG_OF=3Dy
>> # CONFIG_OF_UNITTEST is not set
>> CONFIG_OF_DYNAMIC=3Dy
>> CONFIG_OF_ADDRESS=3Dy
>> CONFIG_OF_ADDRESS_PCI=3Dy
>> CONFIG_OF_IRQ=3Dy
>> CONFIG_OF_PCI=3Dy
>> CONFIG_OF_PCI_IRQ=3Dy
>> CONFIG_OF_MTD=3Dy
>> CONFIG_OF_RESOLVE=3Dy
>> CONFIG_OF_OVERLAY=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>> CONFIG_PARPORT=3Dy
>> # CONFIG_PARPORT_PC is not set
>> # CONFIG_PARPORT_GSC is not set
>> # CONFIG_PARPORT_AX88796 is not set
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
>> CONFIG_BLK_DEV_NULL_BLK=3Dy
>> CONFIG_BLK_DEV_FD=3Dy
>> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
>> # CONFIG_BLK_CPQ_CISS_DA is not set
>> # CONFIG_BLK_DEV_DAC960 is not set
>> # CONFIG_BLK_DEV_UMEM is not set
>> # CONFIG_BLK_DEV_COW_COMMON is not set
>> CONFIG_BLK_DEV_LOOP=3Dy
>> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
>> CONFIG_BLK_DEV_CRYPTOLOOP=3Dy
>>
>> #
>> # DRBD disabled because PROC_FS or INET not selected
>> #
>> # CONFIG_BLK_DEV_NBD is not set
>> # CONFIG_BLK_DEV_SKD is not set
>> # CONFIG_BLK_DEV_OSD is not set
>> # CONFIG_BLK_DEV_SX8 is not set
>> # CONFIG_BLK_DEV_RAM is not set
>> CONFIG_CDROM_PKTCDVD=3Dy
>> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
>> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
>> # CONFIG_ATA_OVER_ETH is not set
>> CONFIG_VIRTIO_BLK=3Dy
>> CONFIG_BLK_DEV_HD=3Dy
>> # CONFIG_BLK_DEV_RSXX is not set
>> # CONFIG_BLK_DEV_NVME is not set
>> # CONFIG_NVME_TARGET is not set
>>
>> #
>> # Misc devices
>> #
>> CONFIG_SENSORS_LIS3LV02D=3Dy
>> CONFIG_AD525X_DPOT=3Dy
>> CONFIG_AD525X_DPOT_I2C=3Dy
>> # CONFIG_AD525X_DPOT_SPI is not set
>> CONFIG_DUMMY_IRQ=3Dy
>> # CONFIG_IBM_ASM is not set
>> # CONFIG_PHANTOM is not set
>> # CONFIG_SGI_IOC4 is not set
>> # CONFIG_TIFM_CORE is not set
>> CONFIG_ICS932S401=3Dy
>> CONFIG_ENCLOSURE_SERVICES=3Dy
>> # CONFIG_HP_ILO is not set
>> # CONFIG_APDS9802ALS is not set
>> CONFIG_ISL29003=3Dy
>> CONFIG_ISL29020=3Dy
>> CONFIG_SENSORS_TSL2550=3Dy
>> CONFIG_SENSORS_BH1780=3Dy
>> CONFIG_SENSORS_BH1770=3Dy
>> # CONFIG_SENSORS_APDS990X is not set
>> CONFIG_HMC6352=3Dy
>> # CONFIG_DS1682 is not set
>> # CONFIG_TI_DAC7512 is not set
>> CONFIG_BMP085=3Dy
>> CONFIG_BMP085_I2C=3Dy
>> # CONFIG_BMP085_SPI is not set
>> # CONFIG_USB_SWITCH_FSA9480 is not set
>> # CONFIG_LATTICE_ECP3_CONFIG is not set
>> # CONFIG_SRAM is not set
>> CONFIG_PANEL=3Dy
>> CONFIG_PANEL_PARPORT=3D0
>> CONFIG_PANEL_PROFILE=3D5
>> # CONFIG_PANEL_CHANGE_MESSAGE is not set
>> CONFIG_C2PORT=3Dy
>> # CONFIG_C2PORT_DURAMAR_2150 is not set
>>
>> #
>> # EEPROM support
>> #
>> CONFIG_EEPROM_AT24=3Dy
>> # CONFIG_EEPROM_AT25 is not set
>> # CONFIG_EEPROM_LEGACY is not set
>> CONFIG_EEPROM_MAX6875=3Dy
>> # CONFIG_EEPROM_93CX6 is not set
>> CONFIG_EEPROM_93XX46=3Dy
>> # CONFIG_CB710_CORE is not set
>>
>> #
>> # Texas Instruments shared transport line discipline
>> #
>> # CONFIG_TI_ST is not set
>> CONFIG_SENSORS_LIS3_I2C=3Dy
>>
>> #
>> # Altera FPGA firmware download module
>> #
>> CONFIG_ALTERA_STAPL=3Dy
>> # CONFIG_INTEL_MEI is not set
>> # CONFIG_INTEL_MEI_ME is not set
>> # CONFIG_INTEL_MEI_TXE is not set
>> # CONFIG_VMWARE_VMCI is not set
>>
>> #
>> # Intel MIC Bus Driver
>> #
>> # CONFIG_INTEL_MIC_BUS is not set
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
>> # CONFIG_GENWQE is not set
>> CONFIG_ECHO=3Dy
>> # CONFIG_CXL_BASE is not set
>> # CONFIG_CXL_KERNEL_API is not set
>> # CONFIG_CXL_EEH is not set
>> CONFIG_HAVE_IDE=3Dy
>> CONFIG_IDE=3Dy
>>
>> #
>> # Please see Documentation/ide/ide.txt for help/info on IDE drives
>> #
>> CONFIG_IDE_ATAPI=3Dy
>> # CONFIG_BLK_DEV_IDE_SATA is not set
>> CONFIG_IDE_GD=3Dy
>> # CONFIG_IDE_GD_ATA is not set
>> CONFIG_IDE_GD_ATAPI=3Dy
>> # CONFIG_BLK_DEV_IDECS is not set
>> # CONFIG_BLK_DEV_DELKIN is not set
>> CONFIG_BLK_DEV_IDECD=3Dy
>> CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS=3Dy
>> CONFIG_BLK_DEV_IDETAPE=3Dy
>> # CONFIG_BLK_DEV_IDEACPI is not set
>> # CONFIG_IDE_TASK_IOCTL is not set
>> CONFIG_IDE_PROC_FS=3Dy
>>
>> #
>> # IDE chipset support/bugfixes
>> #
>> CONFIG_IDE_GENERIC=3Dy
>> CONFIG_BLK_DEV_PLATFORM=3Dy
>> # CONFIG_BLK_DEV_CMD640 is not set
>> # CONFIG_BLK_DEV_IDEPNP is not set
>>
>> #
>> # PCI IDE chipsets support
>> #
>> # CONFIG_BLK_DEV_GENERIC is not set
>> # CONFIG_BLK_DEV_OPTI621 is not set
>> # CONFIG_BLK_DEV_RZ1000 is not set
>> # CONFIG_BLK_DEV_AEC62XX is not set
>> # CONFIG_BLK_DEV_ALI15X3 is not set
>> # CONFIG_BLK_DEV_AMD74XX is not set
>> # CONFIG_BLK_DEV_ATIIXP is not set
>> # CONFIG_BLK_DEV_CMD64X is not set
>> # CONFIG_BLK_DEV_TRIFLEX is not set
>> # CONFIG_BLK_DEV_HPT366 is not set
>> # CONFIG_BLK_DEV_JMICRON is not set
>> # CONFIG_BLK_DEV_PIIX is not set
>> # CONFIG_BLK_DEV_IT8172 is not set
>> # CONFIG_BLK_DEV_IT8213 is not set
>> # CONFIG_BLK_DEV_IT821X is not set
>> # CONFIG_BLK_DEV_NS87415 is not set
>> # CONFIG_BLK_DEV_PDC202XX_OLD is not set
>> # CONFIG_BLK_DEV_PDC202XX_NEW is not set
>> # CONFIG_BLK_DEV_SVWKS is not set
>> # CONFIG_BLK_DEV_SIIMAGE is not set
>> # CONFIG_BLK_DEV_SIS5513 is not set
>> # CONFIG_BLK_DEV_SLC90E66 is not set
>> # CONFIG_BLK_DEV_TRM290 is not set
>> # CONFIG_BLK_DEV_VIA82CXXX is not set
>> # CONFIG_BLK_DEV_TC86C001 is not set
>> # CONFIG_BLK_DEV_IDEDMA is not set
>>
>> #
>> # SCSI device support
>> #
>> CONFIG_SCSI_MOD=3Dy
>> CONFIG_RAID_ATTRS=3Dy
>> CONFIG_SCSI=3Dy
>> CONFIG_SCSI_DMA=3Dy
>> # CONFIG_SCSI_NETLINK is not set
>> CONFIG_SCSI_MQ_DEFAULT=3Dy
>> # CONFIG_SCSI_PROC_FS is not set
>>
>> #
>> # SCSI support type (disk, tape, CD-ROM)
>> #
>> CONFIG_BLK_DEV_SD=3Dy
>> CONFIG_CHR_DEV_ST=3Dy
>> CONFIG_CHR_DEV_OSST=3Dy
>> CONFIG_BLK_DEV_SR=3Dy
>> CONFIG_BLK_DEV_SR_VENDOR=3Dy
>> CONFIG_CHR_DEV_SG=3Dy
>> CONFIG_CHR_DEV_SCH=3Dy
>> CONFIG_SCSI_ENCLOSURE=3Dy
>> # CONFIG_SCSI_CONSTANTS is not set
>> # CONFIG_SCSI_LOGGING is not set
>> # CONFIG_SCSI_SCAN_ASYNC is not set
>>
>> #
>> # SCSI Transports
>> #
>> CONFIG_SCSI_SPI_ATTRS=3Dy
>> # CONFIG_SCSI_FC_ATTRS is not set
>> # CONFIG_SCSI_ISCSI_ATTRS is not set
>> CONFIG_SCSI_SAS_ATTRS=3Dy
>> CONFIG_SCSI_SAS_LIBSAS=3Dy
>> # CONFIG_SCSI_SAS_ATA is not set
>> # CONFIG_SCSI_SAS_HOST_SMP is not set
>> CONFIG_SCSI_SRP_ATTRS=3Dy
>> CONFIG_SCSI_LOWLEVEL=3Dy
>> CONFIG_ISCSI_BOOT_SYSFS=3Dy
>> # CONFIG_SCSI_BNX2_ISCSI is not set
>> # CONFIG_BE2ISCSI is not set
>> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
>> # CONFIG_SCSI_HPSA is not set
>> # CONFIG_SCSI_3W_9XXX is not set
>> # CONFIG_SCSI_3W_SAS is not set
>> # CONFIG_SCSI_ACARD is not set
>> # CONFIG_SCSI_AACRAID is not set
>> # CONFIG_SCSI_AIC7XXX is not set
>> # CONFIG_SCSI_AIC79XX is not set
>> # CONFIG_SCSI_AIC94XX is not set
>> # CONFIG_SCSI_MVSAS is not set
>> # CONFIG_SCSI_MVUMI is not set
>> # CONFIG_SCSI_DPT_I2O is not set
>> # CONFIG_SCSI_ADVANSYS is not set
>> # CONFIG_SCSI_ARCMSR is not set
>> # CONFIG_SCSI_ESAS2R is not set
>> # CONFIG_MEGARAID_NEWGEN is not set
>> # CONFIG_MEGARAID_LEGACY is not set
>> # CONFIG_MEGARAID_SAS is not set
>> # CONFIG_SCSI_MPT3SAS is not set
>> # CONFIG_SCSI_MPT2SAS is not set
>> CONFIG_SCSI_UFSHCD=3Dy
>> # CONFIG_SCSI_UFSHCD_PCI is not set
>> CONFIG_SCSI_UFSHCD_PLATFORM=3Dy
>> # CONFIG_SCSI_HPTIOP is not set
>> # CONFIG_SCSI_BUSLOGIC is not set
>> # CONFIG_VMWARE_PVSCSI is not set
>> # CONFIG_SCSI_SNIC is not set
>> # CONFIG_SCSI_DMX3191D is not set
>> # CONFIG_SCSI_EATA is not set
>> # CONFIG_SCSI_FUTURE_DOMAIN is not set
>> # CONFIG_SCSI_GDTH is not set
>> # CONFIG_SCSI_ISCI is not set
>> # CONFIG_SCSI_IPS is not set
>> # CONFIG_SCSI_INITIO is not set
>> # CONFIG_SCSI_INIA100 is not set
>> # CONFIG_SCSI_STEX is not set
>> # CONFIG_SCSI_SYM53C8XX_2 is not set
>> # CONFIG_SCSI_IPR is not set
>> # CONFIG_SCSI_QLOGIC_1280 is not set
>> # CONFIG_SCSI_QLA_ISCSI is not set
>> # CONFIG_SCSI_DC395x is not set
>> # CONFIG_SCSI_AM53C974 is not set
>> # CONFIG_SCSI_WD719X is not set
>> # CONFIG_SCSI_DEBUG is not set
>> # CONFIG_SCSI_PMCRAID is not set
>> # CONFIG_SCSI_PM8001 is not set
>> CONFIG_SCSI_VIRTIO=3Dy
>> # CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
>> # CONFIG_SCSI_DH is not set
>> CONFIG_SCSI_OSD_INITIATOR=3Dy
>> CONFIG_SCSI_OSD_ULD=3Dy
>> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
>> CONFIG_SCSI_OSD_DEBUG=3Dy
>> CONFIG_ATA=3Dy
>> # CONFIG_ATA_NONSTANDARD is not set
>> CONFIG_ATA_VERBOSE_ERROR=3Dy
>> CONFIG_ATA_ACPI=3Dy
>> # CONFIG_SATA_ZPODD is not set
>> CONFIG_SATA_PMP=3Dy
>>
>> #
>> # Controllers with non-SFF native interface
>> #
>> # CONFIG_SATA_AHCI is not set
>> CONFIG_SATA_AHCI_PLATFORM=3Dy
>> # CONFIG_AHCI_CEVA is not set
>> CONFIG_AHCI_QORIQ=3Dy
>> # CONFIG_SATA_INIC162X is not set
>> # CONFIG_SATA_ACARD_AHCI is not set
>> # CONFIG_SATA_SIL24 is not set
>> CONFIG_ATA_SFF=3Dy
>>
>> #
>> # SFF controllers with custom DMA interface
>> #
>> # CONFIG_PDC_ADMA is not set
>> # CONFIG_SATA_QSTOR is not set
>> # CONFIG_SATA_SX4 is not set
>> CONFIG_ATA_BMDMA=3Dy
>>
>> #
>> # SATA SFF controllers with BMDMA
>> #
>> # CONFIG_ATA_PIIX is not set
>> CONFIG_SATA_MV=3Dy
>> # CONFIG_SATA_NV is not set
>> # CONFIG_SATA_PROMISE is not set
>> # CONFIG_SATA_SIL is not set
>> # CONFIG_SATA_SIS is not set
>> # CONFIG_SATA_SVW is not set
>> # CONFIG_SATA_ULI is not set
>> # CONFIG_SATA_VIA is not set
>> # CONFIG_SATA_VITESSE is not set
>>
>> #
>> # PATA SFF controllers with BMDMA
>> #
>> # CONFIG_PATA_ALI is not set
>> # CONFIG_PATA_AMD is not set
>> # CONFIG_PATA_ARTOP is not set
>> # CONFIG_PATA_ATIIXP is not set
>> # CONFIG_PATA_ATP867X is not set
>> # CONFIG_PATA_CMD64X is not set
>> # CONFIG_PATA_CYPRESS is not set
>> # CONFIG_PATA_EFAR is not set
>> # CONFIG_PATA_HPT366 is not set
>> # CONFIG_PATA_HPT37X is not set
>> # CONFIG_PATA_HPT3X2N is not set
>> # CONFIG_PATA_HPT3X3 is not set
>> # CONFIG_PATA_IT8213 is not set
>> # CONFIG_PATA_IT821X is not set
>> # CONFIG_PATA_JMICRON is not set
>> # CONFIG_PATA_MARVELL is not set
>> # CONFIG_PATA_NETCELL is not set
>> # CONFIG_PATA_NINJA32 is not set
>> # CONFIG_PATA_NS87415 is not set
>> # CONFIG_PATA_OLDPIIX is not set
>> # CONFIG_PATA_OPTIDMA is not set
>> # CONFIG_PATA_PDC2027X is not set
>> # CONFIG_PATA_PDC_OLD is not set
>> # CONFIG_PATA_RADISYS is not set
>> # CONFIG_PATA_RDC is not set
>> # CONFIG_PATA_SCH is not set
>> # CONFIG_PATA_SERVERWORKS is not set
>> # CONFIG_PATA_SIL680 is not set
>> # CONFIG_PATA_SIS is not set
>> # CONFIG_PATA_TOSHIBA is not set
>> # CONFIG_PATA_TRIFLEX is not set
>> # CONFIG_PATA_VIA is not set
>> # CONFIG_PATA_WINBOND is not set
>>
>> #
>> # PIO-only SFF controllers
>> #
>> # CONFIG_PATA_CMD640_PCI is not set
>> # CONFIG_PATA_MPIIX is not set
>> # CONFIG_PATA_NS87410 is not set
>> # CONFIG_PATA_OPTI is not set
>> # CONFIG_PATA_PCMCIA is not set
>> # CONFIG_PATA_RZ1000 is not set
>>
>> #
>> # Generic fallback / legacy drivers
>> #
>> # CONFIG_PATA_ACPI is not set
>> # CONFIG_ATA_GENERIC is not set
>> # CONFIG_PATA_LEGACY is not set
>> CONFIG_MD=3Dy
>> CONFIG_BLK_DEV_MD=3Dy
>> # CONFIG_MD_AUTODETECT is not set
>> CONFIG_MD_LINEAR=3Dy
>> # CONFIG_MD_RAID0 is not set
>> # CONFIG_MD_RAID1 is not set
>> CONFIG_MD_RAID10=3Dy
>> CONFIG_MD_RAID456=3Dy
>> CONFIG_MD_MULTIPATH=3Dy
>> # CONFIG_MD_FAULTY is not set
>> CONFIG_BCACHE=3Dy
>> # CONFIG_BCACHE_DEBUG is not set
>> # CONFIG_BCACHE_CLOSURES_DEBUG is not set
>> # CONFIG_BLK_DEV_DM is not set
>> CONFIG_TARGET_CORE=3Dy
>> CONFIG_TCM_IBLOCK=3Dy
>> CONFIG_TCM_FILEIO=3Dy
>> CONFIG_TCM_PSCSI=3Dy
>> # CONFIG_TCM_USER2 is not set
>> CONFIG_LOOPBACK_TARGET=3Dy
>> # CONFIG_ISCSI_TARGET is not set
>> CONFIG_SBP_TARGET=3Dy
>> # CONFIG_FUSION is not set
>>
>> #
>> # IEEE 1394 (FireWire) support
>> #
>> CONFIG_FIREWIRE=3Dy
>> # CONFIG_FIREWIRE_OHCI is not set
>> CONFIG_FIREWIRE_SBP2=3Dy
>> # CONFIG_FIREWIRE_NOSY is not set
>> CONFIG_MACINTOSH_DRIVERS=3Dy
>> CONFIG_MAC_EMUMOUSEBTN=3Dy
>> # CONFIG_NETDEVICES is not set
>> # CONFIG_VHOST_NET is not set
>> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
>> CONFIG_NVM=3Dy
>> # CONFIG_NVM_DEBUG is not set
>> # CONFIG_NVM_GENNVM is not set
>> CONFIG_NVM_RRPC=3Dy
>>
>> #
>> # Input device support
>> #
>> CONFIG_INPUT=3Dy
>> # CONFIG_INPUT_LEDS is not set
>> CONFIG_INPUT_FF_MEMLESS=3Dy
>> CONFIG_INPUT_POLLDEV=3Dy
>> # CONFIG_INPUT_SPARSEKMAP is not set
>> CONFIG_INPUT_MATRIXKMAP=3Dy
>>
>> #
>> # Userland interfaces
>> #
>> CONFIG_INPUT_MOUSEDEV=3Dy
>> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
>> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
>> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
>> CONFIG_INPUT_JOYDEV=3Dy
>> CONFIG_INPUT_EVDEV=3Dy
>> CONFIG_INPUT_EVBUG=3Dy
>>
>> #
>> # Input Device Drivers
>> #
>> CONFIG_INPUT_KEYBOARD=3Dy
>> CONFIG_KEYBOARD_ADP5588=3Dy
>> CONFIG_KEYBOARD_ADP5589=3Dy
>> CONFIG_KEYBOARD_ATKBD=3Dy
>> # CONFIG_KEYBOARD_QT1070 is not set
>> # CONFIG_KEYBOARD_QT2160 is not set
>> CONFIG_KEYBOARD_LKKBD=3Dy
>> CONFIG_KEYBOARD_GPIO=3Dy
>> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
>> CONFIG_KEYBOARD_TCA6416=3Dy
>> # CONFIG_KEYBOARD_TCA8418 is not set
>> # CONFIG_KEYBOARD_MATRIX is not set
>> CONFIG_KEYBOARD_LM8323=3Dy
>> # CONFIG_KEYBOARD_LM8333 is not set
>> CONFIG_KEYBOARD_MAX7359=3Dy
>> CONFIG_KEYBOARD_MCS=3Dy
>> CONFIG_KEYBOARD_MPR121=3Dy
>> # CONFIG_KEYBOARD_NEWTON is not set
>> CONFIG_KEYBOARD_OPENCORES=3Dy
>> CONFIG_KEYBOARD_STOWAWAY=3Dy
>> CONFIG_KEYBOARD_SUNKBD=3Dy
>> CONFIG_KEYBOARD_OMAP4=3Dy
>> # CONFIG_KEYBOARD_XTKBD is not set
>> # CONFIG_KEYBOARD_CROS_EC is not set
>> CONFIG_KEYBOARD_CAP11XX=3Dy
>> CONFIG_INPUT_MOUSE=3Dy
>> # CONFIG_MOUSE_PS2 is not set
>> # CONFIG_MOUSE_SERIAL is not set
>> CONFIG_MOUSE_APPLETOUCH=3Dy
>> CONFIG_MOUSE_BCM5974=3Dy
>> # CONFIG_MOUSE_CYAPA is not set
>> CONFIG_MOUSE_ELAN_I2C=3Dy
>> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
>> # CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
>> # CONFIG_MOUSE_VSXXXAA is not set
>> CONFIG_MOUSE_GPIO=3Dy
>> CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
>> # CONFIG_MOUSE_SYNAPTICS_USB is not set
>> # CONFIG_INPUT_JOYSTICK is not set
>> CONFIG_INPUT_TABLET=3Dy
>> # CONFIG_TABLET_USB_ACECAD is not set
>> CONFIG_TABLET_USB_AIPTEK=3Dy
>> CONFIG_TABLET_USB_GTCO=3Dy
>> CONFIG_TABLET_USB_HANWANG=3Dy
>> CONFIG_TABLET_USB_KBTAB=3Dy
>> # CONFIG_TABLET_SERIAL_WACOM4 is not set
>> CONFIG_INPUT_TOUCHSCREEN=3Dy
>> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
>> CONFIG_TOUCHSCREEN_ADS7846=3Dy
>> # CONFIG_TOUCHSCREEN_AD7877 is not set
>> CONFIG_TOUCHSCREEN_AD7879=3Dy
>> # CONFIG_TOUCHSCREEN_AD7879_I2C is not set
>> # CONFIG_TOUCHSCREEN_AD7879_SPI is not set
>> # CONFIG_TOUCHSCREEN_AR1021_I2C is not set
>> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
>> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
>> # CONFIG_TOUCHSCREEN_BU21013 is not set
>> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
>> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dy
>> # CONFIG_TOUCHSCREEN_CYTTSP_SPI is not set
>> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
>> CONFIG_TOUCHSCREEN_CYTTSP4_SPI=3Dy
>> CONFIG_TOUCHSCREEN_DA9034=3Dy
>> CONFIG_TOUCHSCREEN_DA9052=3Dy
>> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
>> # CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
>> CONFIG_TOUCHSCREEN_EETI=3Dy
>> # CONFIG_TOUCHSCREEN_EGALAX is not set
>> # CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
>> CONFIG_TOUCHSCREEN_FT6236=3Dy
>> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
>> CONFIG_TOUCHSCREEN_GOODIX=3Dy
>> CONFIG_TOUCHSCREEN_ILI210X=3Dy
>> CONFIG_TOUCHSCREEN_GUNZE=3Dy
>> CONFIG_TOUCHSCREEN_ELAN=3Dy
>> # CONFIG_TOUCHSCREEN_ELO is not set
>> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
>> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
>> # CONFIG_TOUCHSCREEN_MAX11801 is not set
>> CONFIG_TOUCHSCREEN_MCS5000=3Dy
>> CONFIG_TOUCHSCREEN_MMS114=3Dy
>> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
>> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
>> # CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
>> CONFIG_TOUCHSCREEN_INEXIO=3Dy
>> # CONFIG_TOUCHSCREEN_MK712 is not set
>> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
>> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
>> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
>> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
>> # CONFIG_TOUCHSCREEN_PIXCIR is not set
>> # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
>> CONFIG_TOUCHSCREEN_WM831X=3Dy
>> CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dy
>> CONFIG_TOUCHSCREEN_MC13783=3Dy
>> CONFIG_TOUCHSCREEN_USB_EGALAX=3Dy
>> CONFIG_TOUCHSCREEN_USB_PANJIT=3Dy
>> CONFIG_TOUCHSCREEN_USB_3M=3Dy
>> CONFIG_TOUCHSCREEN_USB_ITM=3Dy
>> CONFIG_TOUCHSCREEN_USB_ETURBO=3Dy
>> CONFIG_TOUCHSCREEN_USB_GUNZE=3Dy
>> CONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy
>> CONFIG_TOUCHSCREEN_USB_IRTOUCH=3Dy
>> CONFIG_TOUCHSCREEN_USB_IDEALTEK=3Dy
>> CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=3Dy
>> CONFIG_TOUCHSCREEN_USB_GOTOP=3Dy
>> CONFIG_TOUCHSCREEN_USB_JASTEC=3Dy
>> CONFIG_TOUCHSCREEN_USB_ELO=3Dy
>> CONFIG_TOUCHSCREEN_USB_E2I=3Dy
>> CONFIG_TOUCHSCREEN_USB_ZYTRONIC=3Dy
>> CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=3Dy
>> CONFIG_TOUCHSCREEN_USB_NEXIO=3Dy
>> CONFIG_TOUCHSCREEN_USB_EASYTOUCH=3Dy
>> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
>> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
>> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
>> # CONFIG_TOUCHSCREEN_TSC2004 is not set
>> CONFIG_TOUCHSCREEN_TSC2005=3Dy
>> CONFIG_TOUCHSCREEN_TSC2007=3Dy
>> CONFIG_TOUCHSCREEN_ST1232=3Dy
>> # CONFIG_TOUCHSCREEN_SX8654 is not set
>> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
>> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
>> # CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
>> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dy
>> # CONFIG_INPUT_MISC is not set
>> CONFIG_RMI4_CORE=3Dy
>> CONFIG_RMI4_I2C=3Dy
>> CONFIG_RMI4_SPI=3Dy
>> # CONFIG_RMI4_F11 is not set
>> # CONFIG_RMI4_F12 is not set
>> # CONFIG_RMI4_F30 is not set
>>
>> #
>> # Hardware I/O ports
>> #
>> CONFIG_SERIO=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>> CONFIG_SERIO_I8042=3Dy
>> CONFIG_SERIO_SERPORT=3Dy
>> # CONFIG_SERIO_CT82C710 is not set
>> CONFIG_SERIO_PARKBD=3Dy
>> # CONFIG_SERIO_PCIPS2 is not set
>> CONFIG_SERIO_LIBPS2=3Dy
>> # CONFIG_SERIO_RAW is not set
>> CONFIG_SERIO_ALTERA_PS2=3Dy
>> # CONFIG_SERIO_PS2MULT is not set
>> CONFIG_SERIO_ARC_PS2=3Dy
>> CONFIG_SERIO_APBPS2=3Dy
>> CONFIG_USERIO=3Dy
>> CONFIG_GAMEPORT=3Dy
>> CONFIG_GAMEPORT_NS558=3Dy
>> # CONFIG_GAMEPORT_L4 is not set
>> # CONFIG_GAMEPORT_EMU10K1 is not set
>> # CONFIG_GAMEPORT_FM801 is not set
>>
>> #
>> # Character devices
>> #
>> CONFIG_TTY=3Dy
>> CONFIG_VT=3Dy
>> CONFIG_CONSOLE_TRANSLATIONS=3Dy
>> CONFIG_VT_CONSOLE=3Dy
>> CONFIG_VT_CONSOLE_SLEEP=3Dy
>> CONFIG_HW_CONSOLE=3Dy
>> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
>> CONFIG_UNIX98_PTYS=3Dy
>> CONFIG_LEGACY_PTYS=3Dy
>> CONFIG_LEGACY_PTY_COUNT=3D256
>> CONFIG_SERIAL_NONSTANDARD=3Dy
>> # CONFIG_ROCKETPORT is not set
>> # CONFIG_CYCLADES is not set
>> # CONFIG_MOXA_INTELLIO is not set
>> # CONFIG_MOXA_SMARTIO is not set
>> # CONFIG_SYNCLINK is not set
>> # CONFIG_SYNCLINKMP is not set
>> # CONFIG_SYNCLINK_GT is not set
>> # CONFIG_NOZOMI is not set
>> # CONFIG_ISI is not set
>> CONFIG_N_HDLC=3Dy
>> # CONFIG_N_GSM is not set
>> # CONFIG_TRACE_ROUTER is not set
>> CONFIG_TRACE_SINK=3Dy
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
>> CONFIG_SERIAL_8250_FINTEK=3Dy
>> CONFIG_SERIAL_8250_CONSOLE=3Dy
>> CONFIG_SERIAL_8250_PCI=3Dy
>> # CONFIG_SERIAL_8250_CS is not set
>> CONFIG_SERIAL_8250_NR_UARTS=3D4
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>> # CONFIG_SERIAL_8250_EXTENDED is not set
>> # CONFIG_SERIAL_8250_FSL is not set
>> CONFIG_SERIAL_8250_DW=3Dy
>> CONFIG_SERIAL_8250_RT288X=3Dy
>> CONFIG_SERIAL_8250_MID=3Dy
>> # CONFIG_SERIAL_8250_MOXA is not set
>> CONFIG_SERIAL_OF_PLATFORM=3Dy
>>
>> #
>> # Non-8250 serial port support
>> #
>> CONFIG_SERIAL_MAX3100=3Dy
>> CONFIG_SERIAL_MAX310X=3Dy
>> CONFIG_SERIAL_UARTLITE=3Dy
>> # CONFIG_SERIAL_UARTLITE_CONSOLE is not set
>> CONFIG_SERIAL_CORE=3Dy
>> CONFIG_SERIAL_CORE_CONSOLE=3Dy
>> # CONFIG_SERIAL_JSM is not set
>> CONFIG_SERIAL_SCCNXP=3Dy
>> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
>> CONFIG_SERIAL_SC16IS7XX_CORE=3Dy
>> CONFIG_SERIAL_SC16IS7XX=3Dy
>> CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
>> # CONFIG_SERIAL_SC16IS7XX_SPI is not set
>> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
>> # CONFIG_SERIAL_ALTERA_UART is not set
>> # CONFIG_SERIAL_IFX6X60 is not set
>> CONFIG_SERIAL_XILINX_PS_UART=3Dy
>> CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
>> CONFIG_SERIAL_ARC=3Dy
>> # CONFIG_SERIAL_ARC_CONSOLE is not set
>> CONFIG_SERIAL_ARC_NR_PORTS=3D1
>> # CONFIG_SERIAL_RP2 is not set
>> CONFIG_SERIAL_FSL_LPUART=3Dy
>> CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
>> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
>> # CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
>> # CONFIG_SERIAL_MEN_Z135 is not set
>> CONFIG_PRINTER=3Dy
>> # CONFIG_LP_CONSOLE is not set
>> CONFIG_PPDEV=3Dy
>> CONFIG_HVC_DRIVER=3Dy
>> CONFIG_VIRTIO_CONSOLE=3Dy
>> # CONFIG_IPMI_HANDLER is not set
>> CONFIG_HW_RANDOM=3Dy
>> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
>> CONFIG_HW_RANDOM_INTEL=3Dy
>> CONFIG_HW_RANDOM_AMD=3Dy
>> CONFIG_HW_RANDOM_VIA=3Dy
>> CONFIG_HW_RANDOM_VIRTIO=3Dy
>> # CONFIG_NVRAM is not set
>> # CONFIG_R3964 is not set
>> # CONFIG_APPLICOM is not set
>>
>> #
>> # PCMCIA character devices
>> #
>> CONFIG_SYNCLINK_CS=3Dy
>> # CONFIG_CARDMAN_4000 is not set
>> # CONFIG_CARDMAN_4040 is not set
>> # CONFIG_MWAVE is not set
>> CONFIG_RAW_DRIVER=3Dy
>> CONFIG_MAX_RAW_DEVS=3D256
>> # CONFIG_HPET is not set
>> # CONFIG_HANGCHECK_TIMER is not set
>> # CONFIG_TCG_TPM is not set
>> CONFIG_TELCLOCK=3Dy
>> CONFIG_DEVPORT=3Dy
>> CONFIG_XILLYBUS=3Dy
>> CONFIG_XILLYBUS_OF=3Dy
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
>> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
>> # CONFIG_I2C_MUX_GPIO is not set
>> CONFIG_I2C_MUX_PCA9541=3Dy
>> # CONFIG_I2C_MUX_PCA954x is not set
>> CONFIG_I2C_MUX_REG=3Dy
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
>> # CONFIG_I2C_ALI1563 is not set
>> # CONFIG_I2C_ALI15X3 is not set
>> # CONFIG_I2C_AMD756 is not set
>> # CONFIG_I2C_AMD8111 is not set
>> # CONFIG_I2C_I801 is not set
>> # CONFIG_I2C_ISCH is not set
>> # CONFIG_I2C_ISMT is not set
>> # CONFIG_I2C_PIIX4 is not set
>> # CONFIG_I2C_NFORCE2 is not set
>> # CONFIG_I2C_SIS5595 is not set
>> # CONFIG_I2C_SIS630 is not set
>> # CONFIG_I2C_SIS96X is not set
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
>> # CONFIG_I2C_DESIGNWARE_PCI is not set
>> CONFIG_I2C_GPIO=3Dy
>> # CONFIG_I2C_KEMPLD is not set
>> # CONFIG_I2C_OCORES is not set
>> # CONFIG_I2C_PCA_PLATFORM is not set
>> # CONFIG_I2C_PXA_PCI is not set
>> CONFIG_I2C_SIMTEC=3Dy
>> CONFIG_I2C_XILINX=3Dy
>>
>> #
>> # External I2C/SMBus adapter drivers
>> #
>> CONFIG_I2C_DIOLAN_U2C=3Dy
>> # CONFIG_I2C_DLN2 is not set
>> CONFIG_I2C_PARPORT=3Dy
>> CONFIG_I2C_PARPORT_LIGHT=3Dy
>> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
>> CONFIG_I2C_TAOS_EVM=3Dy
>> CONFIG_I2C_TINY_USB=3Dy
>> CONFIG_I2C_VIPERBOARD=3Dy
>>
>> #
>> # Other I2C/SMBus bus drivers
>> #
>> CONFIG_I2C_CROS_EC_TUNNEL=3Dy
>> CONFIG_I2C_SLAVE=3Dy
>> CONFIG_I2C_SLAVE_EEPROM=3Dy
>> # CONFIG_I2C_DEBUG_CORE is not set
>> # CONFIG_I2C_DEBUG_ALGO is not set
>> # CONFIG_I2C_DEBUG_BUS is not set
>> CONFIG_SPI=3Dy
>> # CONFIG_SPI_DEBUG is not set
>> CONFIG_SPI_MASTER=3Dy
>>
>> #
>> # SPI Master Controller Drivers
>> #
>> CONFIG_SPI_ALTERA=3Dy
>> CONFIG_SPI_AXI_SPI_ENGINE=3Dy
>> CONFIG_SPI_BITBANG=3Dy
>> # CONFIG_SPI_BUTTERFLY is not set
>> # CONFIG_SPI_CADENCE is not set
>> CONFIG_SPI_DESIGNWARE=3Dy
>> # CONFIG_SPI_DW_PCI is not set
>> CONFIG_SPI_DW_MMIO=3Dy
>> CONFIG_SPI_DLN2=3Dy
>> CONFIG_SPI_GPIO=3Dy
>> # CONFIG_SPI_LM70_LLP is not set
>> CONFIG_SPI_FSL_LIB=3Dy
>> CONFIG_SPI_FSL_SPI=3Dy
>> CONFIG_SPI_OC_TINY=3Dy
>> # CONFIG_SPI_PXA2XX is not set
>> # CONFIG_SPI_PXA2XX_PCI is not set
>> CONFIG_SPI_ROCKCHIP=3Dy
>> # CONFIG_SPI_SC18IS602 is not set
>> # CONFIG_SPI_XCOMM is not set
>> CONFIG_SPI_XILINX=3Dy
>> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
>>
>> #
>> # SPI Protocol Masters
>> #
>> # CONFIG_SPI_SPIDEV is not set
>> CONFIG_SPI_TLE62X0=3Dy
>> # CONFIG_SPMI is not set
>> CONFIG_HSI=3Dy
>> CONFIG_HSI_BOARDINFO=3Dy
>>
>> #
>> # HSI controllers
>> #
>>
>> #
>> # HSI clients
>> #
>> CONFIG_HSI_CHAR=3Dy
>>
>> #
>> # PPS support
>> #
>> # CONFIG_PPS is not set
>>
>> #
>> # PPS generators support
>> #
>>
>> #
>> # PTP clock support
>> #
>> # CONFIG_PTP_1588_CLOCK is not set
>>
>> #
>> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clock=
s.
>> #
>> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
>> CONFIG_GPIOLIB=3Dy
>> CONFIG_GPIO_DEVRES=3Dy
>> CONFIG_OF_GPIO=3Dy
>> CONFIG_GPIO_ACPI=3Dy
>> CONFIG_GPIOLIB_IRQCHIP=3Dy
>> # CONFIG_DEBUG_GPIO is not set
>> # CONFIG_GPIO_SYSFS is not set
>> CONFIG_GPIO_GENERIC=3Dy
>> CONFIG_GPIO_MAX730X=3Dy
>>
>> #
>> # Memory mapped GPIO drivers
>> #
>> # CONFIG_GPIO_74XX_MMIO is not set
>> CONFIG_GPIO_ALTERA=3Dy
>> # CONFIG_GPIO_AMDPT is not set
>> # CONFIG_GPIO_DWAPB is not set
>> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
>> CONFIG_GPIO_GRGPIO=3Dy
>> # CONFIG_GPIO_ICH is not set
>> # CONFIG_GPIO_LYNXPOINT is not set
>> # CONFIG_GPIO_MENZ127 is not set
>> CONFIG_GPIO_SYSCON=3Dy
>> # CONFIG_GPIO_VX855 is not set
>> # CONFIG_GPIO_XILINX is not set
>> CONFIG_GPIO_ZX=3Dy
>>
>> #
>> # Port-mapped I/O GPIO drivers
>> #
>> # CONFIG_GPIO_F7188X is not set
>> CONFIG_GPIO_IT87=3Dy
>> # CONFIG_GPIO_SCH is not set
>> # CONFIG_GPIO_SCH311X is not set
>>
>> #
>> # I2C GPIO expanders
>> #
>> CONFIG_GPIO_ADP5588=3Dy
>> # CONFIG_GPIO_ADP5588_IRQ is not set
>> CONFIG_GPIO_ADNP=3Dy
>> CONFIG_GPIO_MAX7300=3Dy
>> CONFIG_GPIO_MAX732X=3Dy
>> # CONFIG_GPIO_MAX732X_IRQ is not set
>> CONFIG_GPIO_PCA953X=3Dy
>> # CONFIG_GPIO_PCA953X_IRQ is not set
>> # CONFIG_GPIO_PCF857X is not set
>> CONFIG_GPIO_SX150X=3Dy
>> # CONFIG_GPIO_TPIC2810 is not set
>>
>> #
>> # MFD GPIO expanders
>> #
>> CONFIG_GPIO_ARIZONA=3Dy
>> CONFIG_GPIO_DA9052=3Dy
>> CONFIG_GPIO_DLN2=3Dy
>> CONFIG_GPIO_KEMPLD=3Dy
>> CONFIG_GPIO_TPS65086=3Dy
>> CONFIG_GPIO_TPS65218=3Dy
>> CONFIG_GPIO_TPS65912=3Dy
>> # CONFIG_GPIO_TWL6040 is not set
>> CONFIG_GPIO_WM831X=3Dy
>> CONFIG_GPIO_WM8350=3Dy
>> CONFIG_GPIO_WM8994=3Dy
>>
>> #
>> # PCI GPIO expanders
>> #
>> # CONFIG_GPIO_AMD8111 is not set
>> # CONFIG_GPIO_BT8XX is not set
>> # CONFIG_GPIO_INTEL_MID is not set
>> # CONFIG_GPIO_ML_IOH is not set
>> # CONFIG_GPIO_RDC321X is not set
>> # CONFIG_GPIO_SODAVILLE is not set
>>
>> #
>> # SPI GPIO expanders
>> #
>> # CONFIG_GPIO_74X164 is not set
>> # CONFIG_GPIO_MAX7301 is not set
>> CONFIG_GPIO_MC33880=3Dy
>> # CONFIG_GPIO_PISOSR is not set
>>
>> #
>> # SPI or I2C GPIO expanders
>> #
>> # CONFIG_GPIO_MCP23S08 is not set
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
>> # CONFIG_W1_MASTER_MATROX is not set
>> CONFIG_W1_MASTER_DS2490=3Dy
>> CONFIG_W1_MASTER_DS2482=3Dy
>> CONFIG_W1_MASTER_DS1WM=3Dy
>> CONFIG_W1_MASTER_GPIO=3Dy
>>
>> #
>> # 1-wire Slaves
>> #
>> CONFIG_W1_SLAVE_THERM=3Dy
>> # CONFIG_W1_SLAVE_SMEM is not set
>> # CONFIG_W1_SLAVE_DS2408 is not set
>> CONFIG_W1_SLAVE_DS2413=3Dy
>> # CONFIG_W1_SLAVE_DS2406 is not set
>> CONFIG_W1_SLAVE_DS2423=3Dy
>> # CONFIG_W1_SLAVE_DS2431 is not set
>> CONFIG_W1_SLAVE_DS2433=3Dy
>> # CONFIG_W1_SLAVE_DS2433_CRC is not set
>> CONFIG_W1_SLAVE_DS2760=3Dy
>> CONFIG_W1_SLAVE_DS2780=3Dy
>> # CONFIG_W1_SLAVE_DS2781 is not set
>> CONFIG_W1_SLAVE_DS28E04=3Dy
>> # CONFIG_W1_SLAVE_BQ27000 is not set
>> CONFIG_POWER_SUPPLY=3Dy
>> CONFIG_POWER_SUPPLY_DEBUG=3Dy
>> # CONFIG_PDA_POWER is not set
>> # CONFIG_GENERIC_ADC_BATTERY is not set
>> # CONFIG_WM831X_BACKUP is not set
>> # CONFIG_WM831X_POWER is not set
>> # CONFIG_WM8350_POWER is not set
>> CONFIG_TEST_POWER=3Dy
>> # CONFIG_BATTERY_ACT8945A is not set
>> CONFIG_BATTERY_DS2760=3Dy
>> # CONFIG_BATTERY_DS2780 is not set
>> # CONFIG_BATTERY_DS2781 is not set
>> CONFIG_BATTERY_DS2782=3Dy
>> # CONFIG_BATTERY_SBS is not set
>> CONFIG_BATTERY_BQ27XXX=3Dy
>> # CONFIG_BATTERY_BQ27XXX_I2C is not set
>> CONFIG_BATTERY_DA9030=3Dy
>> CONFIG_BATTERY_DA9052=3Dy
>> # CONFIG_BATTERY_DA9150 is not set
>> CONFIG_AXP288_CHARGER=3Dy
>> CONFIG_AXP288_FUEL_GAUGE=3Dy
>> CONFIG_BATTERY_MAX17040=3Dy
>> CONFIG_BATTERY_MAX17042=3Dy
>> # CONFIG_CHARGER_PCF50633 is not set
>> CONFIG_CHARGER_ISP1704=3Dy
>> # CONFIG_CHARGER_MAX8903 is not set
>> # CONFIG_CHARGER_LP8727 is not set
>> CONFIG_CHARGER_GPIO=3Dy
>> CONFIG_CHARGER_MANAGER=3Dy
>> CONFIG_CHARGER_MAX77693=3Dy
>> # CONFIG_CHARGER_BQ2415X is not set
>> CONFIG_CHARGER_BQ24190=3Dy
>> # CONFIG_CHARGER_BQ24257 is not set
>> CONFIG_CHARGER_BQ24735=3Dy
>> CONFIG_CHARGER_BQ25890=3Dy
>> CONFIG_CHARGER_SMB347=3Dy
>> CONFIG_CHARGER_TPS65090=3Dy
>> CONFIG_CHARGER_TPS65217=3Dy
>> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
>> CONFIG_BATTERY_RT5033=3Dy
>> # CONFIG_CHARGER_RT9455 is not set
>> # CONFIG_AXP20X_POWER is not set
>> CONFIG_POWER_RESET=3Dy
>> # CONFIG_POWER_RESET_AS3722 is not set
>> CONFIG_POWER_RESET_GPIO=3Dy
>> CONFIG_POWER_RESET_GPIO_RESTART=3Dy
>> # CONFIG_POWER_RESET_LTC2952 is not set
>> # CONFIG_POWER_RESET_RESTART is not set
>> CONFIG_POWER_RESET_SYSCON=3Dy
>> # CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
>> CONFIG_POWER_AVS=3Dy
>> CONFIG_HWMON=3Dy
>> CONFIG_HWMON_VID=3Dy
>> # CONFIG_HWMON_DEBUG_CHIP is not set
>>
>> #
>> # Native drivers
>> #
>> # CONFIG_SENSORS_ABITUGURU is not set
>> CONFIG_SENSORS_ABITUGURU3=3Dy
>> CONFIG_SENSORS_AD7314=3Dy
>> CONFIG_SENSORS_AD7414=3Dy
>> # CONFIG_SENSORS_AD7418 is not set
>> CONFIG_SENSORS_ADM1021=3Dy
>> CONFIG_SENSORS_ADM1025=3Dy
>> CONFIG_SENSORS_ADM1026=3Dy
>> CONFIG_SENSORS_ADM1029=3Dy
>> # CONFIG_SENSORS_ADM1031 is not set
>> # CONFIG_SENSORS_ADM9240 is not set
>> CONFIG_SENSORS_ADT7X10=3Dy
>> CONFIG_SENSORS_ADT7310=3Dy
>> CONFIG_SENSORS_ADT7410=3Dy
>> # CONFIG_SENSORS_ADT7411 is not set
>> CONFIG_SENSORS_ADT7462=3Dy
>> CONFIG_SENSORS_ADT7470=3Dy
>> # CONFIG_SENSORS_ADT7475 is not set
>> # CONFIG_SENSORS_ASC7621 is not set
>> # CONFIG_SENSORS_K8TEMP is not set
>> # CONFIG_SENSORS_K10TEMP is not set
>> # CONFIG_SENSORS_FAM15H_POWER is not set
>> CONFIG_SENSORS_APPLESMC=3Dy
>> # CONFIG_SENSORS_ASB100 is not set
>> # CONFIG_SENSORS_ATXP1 is not set
>> # CONFIG_SENSORS_DS620 is not set
>> CONFIG_SENSORS_DS1621=3Dy
>> CONFIG_SENSORS_DELL_SMM=3Dy
>> CONFIG_SENSORS_DA9052_ADC=3Dy
>> # CONFIG_SENSORS_I5K_AMB is not set
>> # CONFIG_SENSORS_F71805F is not set
>> # CONFIG_SENSORS_F71882FG is not set
>> # CONFIG_SENSORS_F75375S is not set
>> # CONFIG_SENSORS_MC13783_ADC is not set
>> CONFIG_SENSORS_FSCHMD=3Dy
>> # CONFIG_SENSORS_GL518SM is not set
>> CONFIG_SENSORS_GL520SM=3Dy
>> CONFIG_SENSORS_G760A=3Dy
>> # CONFIG_SENSORS_G762 is not set
>> CONFIG_SENSORS_GPIO_FAN=3Dy
>> CONFIG_SENSORS_HIH6130=3Dy
>> # CONFIG_SENSORS_IIO_HWMON is not set
>> # CONFIG_SENSORS_I5500 is not set
>> CONFIG_SENSORS_CORETEMP=3Dy
>> CONFIG_SENSORS_IT87=3Dy
>> CONFIG_SENSORS_JC42=3Dy
>> CONFIG_SENSORS_POWR1220=3Dy
>> # CONFIG_SENSORS_LINEAGE is not set
>> # CONFIG_SENSORS_LTC2945 is not set
>> # CONFIG_SENSORS_LTC2990 is not set
>> CONFIG_SENSORS_LTC4151=3Dy
>> CONFIG_SENSORS_LTC4215=3Dy
>> # CONFIG_SENSORS_LTC4222 is not set
>> # CONFIG_SENSORS_LTC4245 is not set
>> # CONFIG_SENSORS_LTC4260 is not set
>> # CONFIG_SENSORS_LTC4261 is not set
>> # CONFIG_SENSORS_MAX1111 is not set
>> # CONFIG_SENSORS_MAX16065 is not set
>> CONFIG_SENSORS_MAX1619=3Dy
>> CONFIG_SENSORS_MAX1668=3Dy
>> CONFIG_SENSORS_MAX197=3Dy
>> # CONFIG_SENSORS_MAX31722 is not set
>> CONFIG_SENSORS_MAX6639=3Dy
>> CONFIG_SENSORS_MAX6642=3Dy
>> CONFIG_SENSORS_MAX6650=3Dy
>> CONFIG_SENSORS_MAX6697=3Dy
>> # CONFIG_SENSORS_MAX31790 is not set
>> CONFIG_SENSORS_MCP3021=3Dy
>> CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
>> CONFIG_SENSORS_ADCXX=3Dy
>> CONFIG_SENSORS_LM63=3Dy
>> CONFIG_SENSORS_LM70=3Dy
>> CONFIG_SENSORS_LM73=3Dy
>> # CONFIG_SENSORS_LM75 is not set
>> CONFIG_SENSORS_LM77=3Dy
>> # CONFIG_SENSORS_LM78 is not set
>> # CONFIG_SENSORS_LM80 is not set
>> CONFIG_SENSORS_LM83=3Dy
>> CONFIG_SENSORS_LM85=3Dy
>> CONFIG_SENSORS_LM87=3Dy
>> # CONFIG_SENSORS_LM90 is not set
>> CONFIG_SENSORS_LM92=3Dy
>> # CONFIG_SENSORS_LM93 is not set
>> CONFIG_SENSORS_LM95234=3Dy
>> CONFIG_SENSORS_LM95241=3Dy
>> CONFIG_SENSORS_LM95245=3Dy
>> CONFIG_SENSORS_PC87360=3Dy
>> CONFIG_SENSORS_PC87427=3Dy
>> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
>> # CONFIG_SENSORS_NCT6683 is not set
>> CONFIG_SENSORS_NCT6775=3Dy
>> CONFIG_SENSORS_NCT7802=3Dy
>> CONFIG_SENSORS_NCT7904=3Dy
>> # CONFIG_SENSORS_PCF8591 is not set
>> # CONFIG_PMBUS is not set
>> CONFIG_SENSORS_SHT15=3Dy
>> # CONFIG_SENSORS_SHT21 is not set
>> CONFIG_SENSORS_SHTC1=3Dy
>> # CONFIG_SENSORS_SIS5595 is not set
>> CONFIG_SENSORS_DME1737=3Dy
>> CONFIG_SENSORS_EMC1403=3Dy
>> # CONFIG_SENSORS_EMC2103 is not set
>> # CONFIG_SENSORS_EMC6W201 is not set
>> CONFIG_SENSORS_SMSC47M1=3Dy
>> # CONFIG_SENSORS_SMSC47M192 is not set
>> CONFIG_SENSORS_SMSC47B397=3Dy
>> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
>> CONFIG_SENSORS_SCH5627=3Dy
>> # CONFIG_SENSORS_SCH5636 is not set
>> # CONFIG_SENSORS_SMM665 is not set
>> CONFIG_SENSORS_ADC128D818=3Dy
>> CONFIG_SENSORS_ADS1015=3Dy
>> CONFIG_SENSORS_ADS7828=3Dy
>> CONFIG_SENSORS_ADS7871=3Dy
>> # CONFIG_SENSORS_AMC6821 is not set
>> CONFIG_SENSORS_INA209=3Dy
>> CONFIG_SENSORS_INA2XX=3Dy
>> CONFIG_SENSORS_TC74=3Dy
>> CONFIG_SENSORS_THMC50=3Dy
>> # CONFIG_SENSORS_TMP102 is not set
>> # CONFIG_SENSORS_TMP103 is not set
>> # CONFIG_SENSORS_TMP401 is not set
>> # CONFIG_SENSORS_TMP421 is not set
>> # CONFIG_SENSORS_VIA_CPUTEMP is not set
>> # CONFIG_SENSORS_VIA686A is not set
>> # CONFIG_SENSORS_VT1211 is not set
>> # CONFIG_SENSORS_VT8231 is not set
>> # CONFIG_SENSORS_W83781D is not set
>> CONFIG_SENSORS_W83791D=3Dy
>> # CONFIG_SENSORS_W83792D is not set
>> CONFIG_SENSORS_W83793=3Dy
>> CONFIG_SENSORS_W83795=3Dy
>> # CONFIG_SENSORS_W83795_FANCTRL is not set
>> CONFIG_SENSORS_W83L785TS=3Dy
>> CONFIG_SENSORS_W83L786NG=3Dy
>> CONFIG_SENSORS_W83627HF=3Dy
>> # CONFIG_SENSORS_W83627EHF is not set
>> CONFIG_SENSORS_WM831X=3Dy
>> # CONFIG_SENSORS_WM8350 is not set
>>
>> #
>> # ACPI drivers
>> #
>> # CONFIG_SENSORS_ACPI_POWER is not set
>> # CONFIG_SENSORS_ATK0110 is not set
>> CONFIG_THERMAL=3Dy
>> # CONFIG_THERMAL_HWMON is not set
>> # CONFIG_THERMAL_OF is not set
>> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
>> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
>> CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=3Dy
>> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
>> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
>> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
>> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
>> # CONFIG_THERMAL_GOV_USER_SPACE is not set
>> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
>> CONFIG_THERMAL_EMULATION=3Dy
>> CONFIG_INTEL_POWERCLAMP=3Dy
>> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
>> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
>>
>> #
>> # ACPI INT340X thermal drivers
>> #
>> # CONFIG_INT340X_THERMAL is not set
>> # CONFIG_INTEL_PCH_THERMAL is not set
>> CONFIG_GENERIC_ADC_THERMAL=3Dy
>> CONFIG_WATCHDOG=3Dy
>> CONFIG_WATCHDOG_CORE=3Dy
>> CONFIG_WATCHDOG_NOWAYOUT=3Dy
>> CONFIG_WATCHDOG_SYSFS=3Dy
>>
>> #
>> # Watchdog Device Drivers
>> #
>> # CONFIG_SOFT_WATCHDOG is not set
>> # CONFIG_DA9052_WATCHDOG is not set
>> CONFIG_DA9063_WATCHDOG=3Dy
>> # CONFIG_DA9062_WATCHDOG is not set
>> # CONFIG_GPIO_WATCHDOG is not set
>> CONFIG_MENF21BMC_WATCHDOG=3Dy
>> # CONFIG_WM831X_WATCHDOG is not set
>> # CONFIG_WM8350_WATCHDOG is not set
>> CONFIG_XILINX_WATCHDOG=3Dy
>> CONFIG_ZIIRAVE_WATCHDOG=3Dy
>> CONFIG_CADENCE_WATCHDOG=3Dy
>> CONFIG_DW_WATCHDOG=3Dy
>> CONFIG_RN5T618_WATCHDOG=3Dy
>> CONFIG_MAX63XX_WATCHDOG=3Dy
>> # CONFIG_RETU_WATCHDOG is not set
>> CONFIG_ACQUIRE_WDT=3Dy
>> CONFIG_ADVANTECH_WDT=3Dy
>> # CONFIG_ALIM1535_WDT is not set
>> # CONFIG_ALIM7101_WDT is not set
>> CONFIG_F71808E_WDT=3Dy
>> # CONFIG_SP5100_TCO is not set
>> # CONFIG_SBC_FITPC2_WATCHDOG is not set
>> # CONFIG_EUROTECH_WDT is not set
>> # CONFIG_IB700_WDT is not set
>> CONFIG_IBMASR=3Dy
>> CONFIG_WAFER_WDT=3Dy
>> # CONFIG_I6300ESB_WDT is not set
>> # CONFIG_IE6XX_WDT is not set
>> # CONFIG_ITCO_WDT is not set
>> # CONFIG_IT8712F_WDT is not set
>> # CONFIG_IT87_WDT is not set
>> # CONFIG_HP_WATCHDOG is not set
>> CONFIG_KEMPLD_WDT=3Dy
>> # CONFIG_SC1200_WDT is not set
>> CONFIG_PC87413_WDT=3Dy
>> # CONFIG_NV_TCO is not set
>> CONFIG_60XX_WDT=3Dy
>> # CONFIG_CPU5_WDT is not set
>> CONFIG_SMSC_SCH311X_WDT=3Dy
>> # CONFIG_SMSC37B787_WDT is not set
>> # CONFIG_VIA_WDT is not set
>> CONFIG_W83627HF_WDT=3Dy
>> # CONFIG_W83877F_WDT is not set
>> CONFIG_W83977F_WDT=3Dy
>> CONFIG_MACHZ_WDT=3Dy
>> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
>> # CONFIG_NI903X_WDT is not set
>> CONFIG_MEN_A21_WDT=3Dy
>>
>> #
>> # PCI-based Watchdog Cards
>> #
>> # CONFIG_PCIPCWATCHDOG is not set
>> # CONFIG_WDTPCI is not set
>>
>> #
>> # USB-based Watchdog Cards
>> #
>> CONFIG_USBPCWATCHDOG=3Dy
>> CONFIG_SSB_POSSIBLE=3Dy
>>
>> #
>> # Sonics Silicon Backplane
>> #
>> CONFIG_SSB=3Dy
>> CONFIG_SSB_SPROM=3Dy
>> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
>> CONFIG_SSB_PCIHOST=3Dy
>> # CONFIG_SSB_B43_PCI_BRIDGE is not set
>> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
>> CONFIG_SSB_PCMCIAHOST=3Dy
>> # CONFIG_SSB_DEBUG is not set
>> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
>> # CONFIG_SSB_DRIVER_PCICORE is not set
>> CONFIG_SSB_DRIVER_GPIO=3Dy
>> CONFIG_BCMA_POSSIBLE=3Dy
>>
>> #
>> # Broadcom specific AMBA
>> #
>> CONFIG_BCMA=3Dy
>> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
>> CONFIG_BCMA_HOST_PCI=3Dy
>> # CONFIG_BCMA_HOST_SOC is not set
>> CONFIG_BCMA_DRIVER_PCI=3Dy
>> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
>> CONFIG_BCMA_DRIVER_GPIO=3Dy
>> # CONFIG_BCMA_DEBUG is not set
>>
>> #
>> # Multifunction device drivers
>> #
>> CONFIG_MFD_CORE=3Dy
>> CONFIG_MFD_ACT8945A=3Dy
>> CONFIG_MFD_AS3711=3Dy
>> CONFIG_MFD_AS3722=3Dy
>> # CONFIG_PMIC_ADP5520 is not set
>> # CONFIG_MFD_AAT2870_CORE is not set
>> CONFIG_MFD_ATMEL_FLEXCOM=3Dy
>> CONFIG_MFD_ATMEL_HLCDC=3Dy
>> CONFIG_MFD_BCM590XX=3Dy
>> CONFIG_MFD_AXP20X=3Dy
>> CONFIG_MFD_AXP20X_I2C=3Dy
>> CONFIG_MFD_CROS_EC=3Dy
>> # CONFIG_MFD_CROS_EC_I2C is not set
>> CONFIG_MFD_CROS_EC_SPI=3Dy
>> CONFIG_PMIC_DA903X=3Dy
>> CONFIG_PMIC_DA9052=3Dy
>> # CONFIG_MFD_DA9052_SPI is not set
>> CONFIG_MFD_DA9052_I2C=3Dy
>> # CONFIG_MFD_DA9055 is not set
>> CONFIG_MFD_DA9062=3Dy
>> CONFIG_MFD_DA9063=3Dy
>> CONFIG_MFD_DA9150=3Dy
>> CONFIG_MFD_DLN2=3Dy
>> CONFIG_MFD_MC13XXX=3Dy
>> # CONFIG_MFD_MC13XXX_SPI is not set
>> CONFIG_MFD_MC13XXX_I2C=3Dy
>> # CONFIG_MFD_HI6421_PMIC is not set
>> # CONFIG_HTC_PASIC3 is not set
>> CONFIG_HTC_I2CPLD=3Dy
>> # CONFIG_LPC_ICH is not set
>> # CONFIG_LPC_SCH is not set
>> # CONFIG_INTEL_SOC_PMIC is not set
>> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
>> # CONFIG_MFD_INTEL_LPSS_PCI is not set
>> # CONFIG_MFD_JANZ_CMODIO is not set
>> CONFIG_MFD_KEMPLD=3Dy
>> CONFIG_MFD_88PM800=3Dy
>> CONFIG_MFD_88PM805=3Dy
>> # CONFIG_MFD_88PM860X is not set
>> # CONFIG_MFD_MAX14577 is not set
>> # CONFIG_MFD_MAX77620 is not set
>> CONFIG_MFD_MAX77686=3Dy
>> CONFIG_MFD_MAX77693=3Dy
>> # CONFIG_MFD_MAX77843 is not set
>> CONFIG_MFD_MAX8907=3Dy
>> # CONFIG_MFD_MAX8925 is not set
>> # CONFIG_MFD_MAX8997 is not set
>> CONFIG_MFD_MAX8998=3Dy
>> CONFIG_MFD_MT6397=3Dy
>> CONFIG_MFD_MENF21BMC=3Dy
>> # CONFIG_EZX_PCAP is not set
>> CONFIG_MFD_VIPERBOARD=3Dy
>> CONFIG_MFD_RETU=3Dy
>> CONFIG_MFD_PCF50633=3Dy
>> CONFIG_PCF50633_ADC=3Dy
>> CONFIG_PCF50633_GPIO=3Dy
>> # CONFIG_MFD_RDC321X is not set
>> # CONFIG_MFD_RTSX_PCI is not set
>> CONFIG_MFD_RT5033=3Dy
>> CONFIG_MFD_RTSX_USB=3Dy
>> # CONFIG_MFD_RC5T583 is not set
>> # CONFIG_MFD_RK808 is not set
>> CONFIG_MFD_RN5T618=3Dy
>> CONFIG_MFD_SEC_CORE=3Dy
>> # CONFIG_MFD_SI476X_CORE is not set
>> # CONFIG_MFD_SM501 is not set
>> CONFIG_MFD_SKY81452=3Dy
>> # CONFIG_MFD_SMSC is not set
>> CONFIG_ABX500_CORE=3Dy
>> CONFIG_AB3100_CORE=3Dy
>> CONFIG_AB3100_OTP=3Dy
>> # CONFIG_MFD_STMPE is not set
>> CONFIG_MFD_SYSCON=3Dy
>> # CONFIG_MFD_TI_AM335X_TSCADC is not set
>> # CONFIG_MFD_LP3943 is not set
>> # CONFIG_MFD_LP8788 is not set
>> # CONFIG_MFD_PALMAS is not set
>> CONFIG_TPS6105X=3Dy
>> # CONFIG_TPS65010 is not set
>> CONFIG_TPS6507X=3Dy
>> CONFIG_MFD_TPS65086=3Dy
>> CONFIG_MFD_TPS65090=3Dy
>> CONFIG_MFD_TPS65217=3Dy
>> CONFIG_MFD_TPS65218=3Dy
>> # CONFIG_MFD_TPS6586X is not set
>> # CONFIG_MFD_TPS65910 is not set
>> CONFIG_MFD_TPS65912=3Dy
>> CONFIG_MFD_TPS65912_I2C=3Dy
>> CONFIG_MFD_TPS65912_SPI=3Dy
>> # CONFIG_MFD_TPS80031 is not set
>> # CONFIG_TWL4030_CORE is not set
>> CONFIG_TWL6040_CORE=3Dy
>> CONFIG_MFD_WL1273_CORE=3Dy
>> CONFIG_MFD_LM3533=3Dy
>> # CONFIG_MFD_TC3589X is not set
>> # CONFIG_MFD_TMIO is not set
>> # CONFIG_MFD_VX855 is not set
>> CONFIG_MFD_ARIZONA=3Dy
>> CONFIG_MFD_ARIZONA_I2C=3Dy
>> CONFIG_MFD_ARIZONA_SPI=3Dy
>> CONFIG_MFD_CS47L24=3Dy
>> # CONFIG_MFD_WM5102 is not set
>> # CONFIG_MFD_WM5110 is not set
>> # CONFIG_MFD_WM8997 is not set
>> CONFIG_MFD_WM8998=3Dy
>> CONFIG_MFD_WM8400=3Dy
>> CONFIG_MFD_WM831X=3Dy
>> CONFIG_MFD_WM831X_I2C=3Dy
>> # CONFIG_MFD_WM831X_SPI is not set
>> CONFIG_MFD_WM8350=3Dy
>> CONFIG_MFD_WM8350_I2C=3Dy
>> CONFIG_MFD_WM8994=3Dy
>> CONFIG_REGULATOR=3Dy
>> # CONFIG_REGULATOR_DEBUG is not set
>> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
>> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
>> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
>> CONFIG_REGULATOR_88PM800=3Dy
>> CONFIG_REGULATOR_ACT8865=3Dy
>> CONFIG_REGULATOR_ACT8945A=3Dy
>> CONFIG_REGULATOR_AD5398=3Dy
>> # CONFIG_REGULATOR_ANATOP is not set
>> CONFIG_REGULATOR_AB3100=3Dy
>> CONFIG_REGULATOR_AS3711=3Dy
>> # CONFIG_REGULATOR_AS3722 is not set
>> CONFIG_REGULATOR_AXP20X=3Dy
>> CONFIG_REGULATOR_BCM590XX=3Dy
>> CONFIG_REGULATOR_DA903X=3Dy
>> CONFIG_REGULATOR_DA9052=3Dy
>> CONFIG_REGULATOR_DA9062=3Dy
>> CONFIG_REGULATOR_DA9063=3Dy
>> CONFIG_REGULATOR_DA9210=3Dy
>> CONFIG_REGULATOR_DA9211=3Dy
>> CONFIG_REGULATOR_FAN53555=3Dy
>> # CONFIG_REGULATOR_GPIO is not set
>> # CONFIG_REGULATOR_ISL9305 is not set
>> CONFIG_REGULATOR_ISL6271A=3Dy
>> # CONFIG_REGULATOR_LP3971 is not set
>> CONFIG_REGULATOR_LP3972=3Dy
>> # CONFIG_REGULATOR_LP872X is not set
>> # CONFIG_REGULATOR_LP8755 is not set
>> CONFIG_REGULATOR_LTC3589=3Dy
>> # CONFIG_REGULATOR_MAX1586 is not set
>> # CONFIG_REGULATOR_MAX8649 is not set
>> CONFIG_REGULATOR_MAX8660=3Dy
>> CONFIG_REGULATOR_MAX8907=3Dy
>> # CONFIG_REGULATOR_MAX8952 is not set
>> # CONFIG_REGULATOR_MAX8998 is not set
>> CONFIG_REGULATOR_MAX77686=3Dy
>> CONFIG_REGULATOR_MAX77693=3Dy
>> CONFIG_REGULATOR_MAX77802=3Dy
>> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
>> # CONFIG_REGULATOR_MC13783 is not set
>> CONFIG_REGULATOR_MC13892=3Dy
>> CONFIG_REGULATOR_MT6311=3Dy
>> CONFIG_REGULATOR_MT6397=3Dy
>> CONFIG_REGULATOR_PCF50633=3Dy
>> CONFIG_REGULATOR_PFUZE100=3Dy
>> CONFIG_REGULATOR_PV88060=3Dy
>> CONFIG_REGULATOR_PV88080=3Dy
>> CONFIG_REGULATOR_PV88090=3Dy
>> CONFIG_REGULATOR_RN5T618=3Dy
>> CONFIG_REGULATOR_RT5033=3Dy
>> CONFIG_REGULATOR_S2MPA01=3Dy
>> # CONFIG_REGULATOR_S2MPS11 is not set
>> # CONFIG_REGULATOR_S5M8767 is not set
>> CONFIG_REGULATOR_SKY81452=3Dy
>> # CONFIG_REGULATOR_TPS51632 is not set
>> CONFIG_REGULATOR_TPS6105X=3Dy
>> CONFIG_REGULATOR_TPS62360=3Dy
>> CONFIG_REGULATOR_TPS65023=3Dy
>> CONFIG_REGULATOR_TPS6507X=3Dy
>> # CONFIG_REGULATOR_TPS65086 is not set
>> CONFIG_REGULATOR_TPS65090=3Dy
>> CONFIG_REGULATOR_TPS65217=3Dy
>> CONFIG_REGULATOR_TPS65218=3Dy
>> CONFIG_REGULATOR_TPS6524X=3Dy
>> # CONFIG_REGULATOR_TPS65912 is not set
>> CONFIG_REGULATOR_WM831X=3Dy
>> CONFIG_REGULATOR_WM8350=3Dy
>> CONFIG_REGULATOR_WM8400=3Dy
>> CONFIG_REGULATOR_WM8994=3Dy
>> CONFIG_MEDIA_SUPPORT=3Dy
>>
>> #
>> # Multimedia core support
>> #
>> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
>> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
>> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
>> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
>> # CONFIG_MEDIA_SDR_SUPPORT is not set
>> # CONFIG_MEDIA_RC_SUPPORT is not set
>> CONFIG_MEDIA_CONTROLLER=3Dy
>> # CONFIG_MEDIA_CONTROLLER_DVB is not set
>> CONFIG_VIDEO_DEV=3Dy
>> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
>> CONFIG_VIDEO_V4L2=3Dy
>> CONFIG_VIDEO_ADV_DEBUG=3Dy
>> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>> # CONFIG_TTPCI_EEPROM is not set
>>
>> #
>> # Media drivers
>> #
>> # CONFIG_MEDIA_USB_SUPPORT is not set
>> # CONFIG_MEDIA_PCI_SUPPORT is not set
>>
>> #
>> # Supported MMC/SDIO adapters
>> #
>> # CONFIG_RADIO_ADAPTERS is not set
>> # CONFIG_CYPRESS_FIRMWARE is not set
>>
>> #
>> # Media ancillary drivers (tuners, sensors, i2c, frontends)
>> #
>> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
>>
>> #
>> # Audio decoders, processors and mixers
>> #
>>
>> #
>> # RDS decoders
>> #
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
>>
>> #
>> # Miscellaneous helper chips
>> #
>>
>> #
>> # Sensors used on soc_camera driver
>> #
>> CONFIG_MEDIA_TUNER=3Dy
>> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
>> CONFIG_MEDIA_TUNER_TDA8290=3Dy
>> CONFIG_MEDIA_TUNER_TDA827X=3Dy
>> CONFIG_MEDIA_TUNER_TDA18271=3Dy
>> CONFIG_MEDIA_TUNER_TDA9887=3Dy
>> CONFIG_MEDIA_TUNER_TEA5761=3Dy
>> CONFIG_MEDIA_TUNER_TEA5767=3Dy
>> CONFIG_MEDIA_TUNER_MT20XX=3Dy
>> CONFIG_MEDIA_TUNER_XC2028=3Dy
>> CONFIG_MEDIA_TUNER_XC5000=3Dy
>> CONFIG_MEDIA_TUNER_XC4000=3Dy
>> CONFIG_MEDIA_TUNER_MC44S803=3Dy
>>
>> #
>> # Tools to develop new frontends
>> #
>> # CONFIG_DVB_DUMMY_FE is not set
>>
>> #
>> # Graphics support
>> #
>> # CONFIG_AGP is not set
>> CONFIG_VGA_ARB=3Dy
>> CONFIG_VGA_ARB_MAX_GPUS=3D16
>> # CONFIG_VGA_SWITCHEROO is not set
>> CONFIG_DRM=3Dy
>> CONFIG_DRM_MIPI_DSI=3Dy
>> # CONFIG_DRM_DP_AUX_CHARDEV is not set
>> CONFIG_DRM_KMS_HELPER=3Dy
>> CONFIG_DRM_KMS_FB_HELPER=3Dy
>> # CONFIG_DRM_FBDEV_EMULATION is not set
>> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
>> CONFIG_DRM_GEM_CMA_HELPER=3Dy
>> CONFIG_DRM_KMS_CMA_HELPER=3Dy
>>
>> #
>> # I2C encoder or helper chips
>> #
>> CONFIG_DRM_I2C_ADV7511=3Dy
>> CONFIG_DRM_I2C_CH7006=3Dy
>> # CONFIG_DRM_I2C_SIL164 is not set
>> # CONFIG_DRM_I2C_NXP_TDA998X is not set
>> # CONFIG_DRM_TDFX is not set
>> # CONFIG_DRM_R128 is not set
>> # CONFIG_DRM_RADEON is not set
>> # CONFIG_DRM_AMDGPU is not set
>>
>> #
>> # ACP (Audio CoProcessor) Configuration
>> #
>> # CONFIG_DRM_NOUVEAU is not set
>> # CONFIG_DRM_I915 is not set
>> # CONFIG_DRM_MGA is not set
>> # CONFIG_DRM_VIA is not set
>> # CONFIG_DRM_SAVAGE is not set
>> # CONFIG_DRM_VGEM is not set
>> # CONFIG_DRM_VMWGFX is not set
>> # CONFIG_DRM_GMA500 is not set
>> CONFIG_DRM_UDL=3Dy
>> # CONFIG_DRM_AST is not set
>> # CONFIG_DRM_MGAG200 is not set
>> # CONFIG_DRM_CIRRUS_QEMU is not set
>> # CONFIG_DRM_QXL is not set
>> # CONFIG_DRM_BOCHS is not set
>> # CONFIG_DRM_VIRTIO_GPU is not set
>> CONFIG_DRM_PANEL=3Dy
>>
>> #
>> # Display Panels
>> #
>> # CONFIG_DRM_PANEL_SIMPLE is not set
>> # CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
>> CONFIG_DRM_PANEL_LG_LG4573=3Dy
>> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=3Dy
>> CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=3Dy
>> # CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
>> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dy
>> CONFIG_DRM_BRIDGE=3Dy
>>
>> #
>> # Display Interface Bridges
>> #
>> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
>> CONFIG_DRM_NXP_PTN3460=3Dy
>> CONFIG_DRM_PARADE_PS8622=3Dy
>> CONFIG_DRM_ARCPGU=3Dy
>>
>> #
>> # Frame buffer Devices
>> #
>> CONFIG_FB=3Dy
>> # CONFIG_FIRMWARE_EDID is not set
>> CONFIG_FB_CMDLINE=3Dy
>> CONFIG_FB_NOTIFY=3Dy
>> # CONFIG_FB_DDC is not set
>> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
>> CONFIG_FB_CFB_FILLRECT=3Dy
>> CONFIG_FB_CFB_COPYAREA=3Dy
>> CONFIG_FB_CFB_IMAGEBLIT=3Dy
>> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
>> CONFIG_FB_SYS_FILLRECT=3Dy
>> CONFIG_FB_SYS_COPYAREA=3Dy
>> CONFIG_FB_SYS_IMAGEBLIT=3Dy
>> CONFIG_FB_FOREIGN_ENDIAN=3Dy
>> # CONFIG_FB_BOTH_ENDIAN is not set
>> CONFIG_FB_BIG_ENDIAN=3Dy
>> # CONFIG_FB_LITTLE_ENDIAN is not set
>> CONFIG_FB_SYS_FOPS=3Dy
>> CONFIG_FB_DEFERRED_IO=3Dy
>> CONFIG_FB_HECUBA=3Dy
>> # CONFIG_FB_SVGALIB is not set
>> # CONFIG_FB_MACMODES is not set
>> CONFIG_FB_BACKLIGHT=3Dy
>> CONFIG_FB_MODE_HELPERS=3Dy
>> # CONFIG_FB_TILEBLITTING is not set
>>
>> #
>> # Frame buffer hardware drivers
>> #
>> # CONFIG_FB_CIRRUS is not set
>> # CONFIG_FB_PM2 is not set
>> # CONFIG_FB_CYBER2000 is not set
>> CONFIG_FB_ARC=3Dy
>> # CONFIG_FB_ASILIANT is not set
>> # CONFIG_FB_IMSTT is not set
>> # CONFIG_FB_VGA16 is not set
>> CONFIG_FB_VESA=3Dy
>> CONFIG_FB_N411=3Dy
>> CONFIG_FB_HGA=3Dy
>> CONFIG_FB_OPENCORES=3Dy
>> CONFIG_FB_S1D13XXX=3Dy
>> # CONFIG_FB_NVIDIA is not set
>> # CONFIG_FB_RIVA is not set
>> # CONFIG_FB_I740 is not set
>> # CONFIG_FB_LE80578 is not set
>> # CONFIG_FB_MATROX is not set
>> # CONFIG_FB_RADEON is not set
>> # CONFIG_FB_ATY128 is not set
>> # CONFIG_FB_ATY is not set
>> # CONFIG_FB_S3 is not set
>> # CONFIG_FB_SAVAGE is not set
>> # CONFIG_FB_SIS is not set
>> # CONFIG_FB_VIA is not set
>> # CONFIG_FB_NEOMAGIC is not set
>> # CONFIG_FB_KYRO is not set
>> # CONFIG_FB_3DFX is not set
>> # CONFIG_FB_VOODOO1 is not set
>> # CONFIG_FB_VT8623 is not set
>> # CONFIG_FB_TRIDENT is not set
>> # CONFIG_FB_ARK is not set
>> # CONFIG_FB_PM3 is not set
>> # CONFIG_FB_CARMINE is not set
>> # CONFIG_FB_SMSCUFX is not set
>> CONFIG_FB_UDL=3Dy
>> # CONFIG_FB_IBM_GXT4500 is not set
>> CONFIG_FB_VIRTUAL=3Dy
>> CONFIG_FB_METRONOME=3Dy
>> # CONFIG_FB_MB862XX is not set
>> # CONFIG_FB_BROADSHEET is not set
>> CONFIG_FB_AUO_K190X=3Dy
>> CONFIG_FB_AUO_K1900=3Dy
>> # CONFIG_FB_AUO_K1901 is not set
>> # CONFIG_FB_SIMPLE is not set
>> # CONFIG_FB_SSD1307 is not set
>> # CONFIG_FB_SM712 is not set
>> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>> CONFIG_LCD_CLASS_DEVICE=3Dy
>> CONFIG_LCD_L4F00242T03=3Dy
>> # CONFIG_LCD_LMS283GF05 is not set
>> CONFIG_LCD_LTV350QV=3Dy
>> # CONFIG_LCD_ILI922X is not set
>> # CONFIG_LCD_ILI9320 is not set
>> CONFIG_LCD_TDO24M=3Dy
>> # CONFIG_LCD_VGG2432A4 is not set
>> CONFIG_LCD_PLATFORM=3Dy
>> CONFIG_LCD_S6E63M0=3Dy
>> CONFIG_LCD_LD9040=3Dy
>> CONFIG_LCD_AMS369FG06=3Dy
>> CONFIG_LCD_LMS501KF03=3Dy
>> # CONFIG_LCD_HX8357 is not set
>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> CONFIG_BACKLIGHT_GENERIC=3Dy
>> CONFIG_BACKLIGHT_LM3533=3Dy
>> # CONFIG_BACKLIGHT_DA903X is not set
>> CONFIG_BACKLIGHT_DA9052=3Dy
>> # CONFIG_BACKLIGHT_APPLE is not set
>> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
>> CONFIG_BACKLIGHT_SAHARA=3Dy
>> CONFIG_BACKLIGHT_WM831X=3Dy
>> # CONFIG_BACKLIGHT_ADP8860 is not set
>> CONFIG_BACKLIGHT_ADP8870=3Dy
>> CONFIG_BACKLIGHT_PCF50633=3Dy
>> CONFIG_BACKLIGHT_LM3639=3Dy
>> CONFIG_BACKLIGHT_SKY81452=3Dy
>> CONFIG_BACKLIGHT_TPS65217=3Dy
>> # CONFIG_BACKLIGHT_AS3711 is not set
>> CONFIG_BACKLIGHT_GPIO=3Dy
>> CONFIG_BACKLIGHT_LV5207LP=3Dy
>> CONFIG_BACKLIGHT_BD6107=3Dy
>> # CONFIG_VGASTATE is not set
>> CONFIG_VIDEOMODE_HELPERS=3Dy
>> CONFIG_HDMI=3Dy
>>
>> #
>> # Console display driver support
>> #
>> CONFIG_VGA_CONSOLE=3Dy
>> CONFIG_VGACON_SOFT_SCROLLBACK=3Dy
>> CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=3D64
>> CONFIG_DUMMY_CONSOLE=3Dy
>> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
>> CONFIG_DUMMY_CONSOLE_ROWS=3D25
>> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
>> # CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
>> CONFIG_LOGO=3Dy
>> # CONFIG_LOGO_LINUX_MONO is not set
>> CONFIG_LOGO_LINUX_VGA16=3Dy
>> # CONFIG_LOGO_LINUX_CLUT224 is not set
>> # CONFIG_SOUND is not set
>>
>> #
>> # HID support
>> #
>> CONFIG_HID=3Dy
>> # CONFIG_HID_BATTERY_STRENGTH is not set
>> CONFIG_HIDRAW=3Dy
>> CONFIG_UHID=3Dy
>> CONFIG_HID_GENERIC=3Dy
>>
>> #
>> # Special HID drivers
>> #
>> CONFIG_HID_A4TECH=3Dy
>> # CONFIG_HID_ACRUX is not set
>> # CONFIG_HID_APPLE is not set
>> # CONFIG_HID_AUREAL is not set
>> CONFIG_HID_BELKIN=3Dy
>> CONFIG_HID_CHERRY=3Dy
>> CONFIG_HID_CHICONY=3Dy
>> # CONFIG_HID_CORSAIR is not set
>> CONFIG_HID_CMEDIA=3Dy
>> CONFIG_HID_CYPRESS=3Dy
>> CONFIG_HID_DRAGONRISE=3Dy
>> CONFIG_DRAGONRISE_FF=3Dy
>> # CONFIG_HID_EMS_FF is not set
>> CONFIG_HID_ELECOM=3Dy
>> # CONFIG_HID_EZKEY is not set
>> CONFIG_HID_GEMBIRD=3Dy
>> CONFIG_HID_GFRM=3Dy
>> # CONFIG_HID_KEYTOUCH is not set
>> # CONFIG_HID_KYE is not set
>> CONFIG_HID_WALTOP=3Dy
>> # CONFIG_HID_GYRATION is not set
>> # CONFIG_HID_ICADE is not set
>> CONFIG_HID_TWINHAN=3Dy
>> # CONFIG_HID_KENSINGTON is not set
>> # CONFIG_HID_LCPOWER is not set
>> CONFIG_HID_LENOVO=3Dy
>> CONFIG_HID_LOGITECH=3Dy
>> CONFIG_HID_LOGITECH_DJ=3Dy
>> CONFIG_HID_LOGITECH_HIDPP=3Dy
>> CONFIG_LOGITECH_FF=3Dy
>> # CONFIG_LOGIRUMBLEPAD2_FF is not set
>> # CONFIG_LOGIG940_FF is not set
>> CONFIG_LOGIWHEELS_FF=3Dy
>> CONFIG_HID_MAGICMOUSE=3Dy
>> # CONFIG_HID_MICROSOFT is not set
>> CONFIG_HID_MONTEREY=3Dy
>> CONFIG_HID_MULTITOUCH=3Dy
>> # CONFIG_HID_ORTEK is not set
>> CONFIG_HID_PANTHERLORD=3Dy
>> # CONFIG_PANTHERLORD_FF is not set
>> # CONFIG_HID_PETALYNX is not set
>> # CONFIG_HID_PICOLCD is not set
>> CONFIG_HID_PLANTRONICS=3Dy
>> # CONFIG_HID_PRIMAX is not set
>> # CONFIG_HID_SAITEK is not set
>> CONFIG_HID_SAMSUNG=3Dy
>> CONFIG_HID_SPEEDLINK=3Dy
>> CONFIG_HID_STEELSERIES=3Dy
>> # CONFIG_HID_SUNPLUS is not set
>> CONFIG_HID_RMI=3Dy
>> CONFIG_HID_GREENASIA=3Dy
>> # CONFIG_GREENASIA_FF is not set
>> CONFIG_HID_SMARTJOYPLUS=3Dy
>> CONFIG_SMARTJOYPLUS_FF=3Dy
>> CONFIG_HID_TIVO=3Dy
>> CONFIG_HID_TOPSEED=3Dy
>> CONFIG_HID_THINGM=3Dy
>> CONFIG_HID_THRUSTMASTER=3Dy
>> CONFIG_THRUSTMASTER_FF=3Dy
>> # CONFIG_HID_WACOM is not set
>> # CONFIG_HID_WIIMOTE is not set
>> CONFIG_HID_XINMO=3Dy
>> CONFIG_HID_ZEROPLUS=3Dy
>> # CONFIG_ZEROPLUS_FF is not set
>> CONFIG_HID_ZYDACRON=3Dy
>> # CONFIG_HID_SENSOR_HUB is not set
>>
>> #
>> # USB HID support
>> #
>> # CONFIG_USB_HID is not set
>> # CONFIG_HID_PID is not set
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
>> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
>>
>> #
>> # Miscellaneous USB options
>> #
>> # CONFIG_USB_DEFAULT_PERSIST is not set
>> CONFIG_USB_DYNAMIC_MINORS=3Dy
>> CONFIG_USB_OTG=3Dy
>> # CONFIG_USB_OTG_WHITELIST is not set
>> CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
>> # CONFIG_USB_OTG_FSM is not set
>> # CONFIG_USB_ULPI_BUS is not set
>> # CONFIG_USB_MON is not set
>> CONFIG_USB_WUSB=3Dy
>> # CONFIG_USB_WUSB_CBAF is not set
>>
>> #
>> # USB Host Controller Drivers
>> #
>> CONFIG_USB_C67X00_HCD=3Dy
>> CONFIG_USB_XHCI_HCD=3Dy
>> CONFIG_USB_XHCI_PCI=3Dy
>> CONFIG_USB_XHCI_PLATFORM=3Dy
>> CONFIG_USB_EHCI_HCD=3Dy
>> # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
>> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
>> CONFIG_USB_EHCI_PCI=3Dy
>> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>> # CONFIG_USB_OXU210HP_HCD is not set
>> CONFIG_USB_ISP116X_HCD=3Dy
>> # CONFIG_USB_ISP1362_HCD is not set
>> CONFIG_USB_FOTG210_HCD=3Dy
>> # CONFIG_USB_MAX3421_HCD is not set
>> CONFIG_USB_OHCI_HCD=3Dy
>> CONFIG_USB_OHCI_HCD_PCI=3Dy
>> # CONFIG_USB_OHCI_HCD_SSB is not set
>> CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
>> # CONFIG_USB_UHCI_HCD is not set
>> # CONFIG_USB_U132_HCD is not set
>> # CONFIG_USB_SL811_HCD is not set
>> CONFIG_USB_R8A66597_HCD=3Dy
>> # CONFIG_USB_WHCI_HCD is not set
>> CONFIG_USB_HWA_HCD=3Dy
>> CONFIG_USB_HCD_BCMA=3Dy
>> CONFIG_USB_HCD_SSB=3Dy
>> CONFIG_USB_HCD_TEST_MODE=3Dy
>>
>> #
>> # USB Device Class drivers
>> #
>> CONFIG_USB_ACM=3Dy
>> # CONFIG_USB_PRINTER is not set
>> CONFIG_USB_WDM=3Dy
>> CONFIG_USB_TMC=3Dy
>>
>> #
>> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
>> #
>>
>> #
>> # also be needed; see USB_STORAGE Help for more info
>> #
>> CONFIG_USB_STORAGE=3Dy
>> CONFIG_USB_STORAGE_DEBUG=3Dy
>> # CONFIG_USB_STORAGE_REALTEK is not set
>> CONFIG_USB_STORAGE_DATAFAB=3Dy
>> CONFIG_USB_STORAGE_FREECOM=3Dy
>> # CONFIG_USB_STORAGE_ISD200 is not set
>> CONFIG_USB_STORAGE_USBAT=3Dy
>> # CONFIG_USB_STORAGE_SDDR09 is not set
>> CONFIG_USB_STORAGE_SDDR55=3Dy
>> # CONFIG_USB_STORAGE_JUMPSHOT is not set
>> CONFIG_USB_STORAGE_ALAUDA=3Dy
>> CONFIG_USB_STORAGE_ONETOUCH=3Dy
>> CONFIG_USB_STORAGE_KARMA=3Dy
>> # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
>> CONFIG_USB_STORAGE_ENE_UB6250=3Dy
>> # CONFIG_USB_UAS is not set
>>
>> #
>> # USB Imaging devices
>> #
>> CONFIG_USB_MDC800=3Dy
>> CONFIG_USB_MICROTEK=3Dy
>> # CONFIG_USBIP_CORE is not set
>> # CONFIG_USB_MUSB_HDRC is not set
>> CONFIG_USB_DWC3=3Dy
>> CONFIG_USB_DWC3_HOST=3Dy
>>
>> #
>> # Platform Glue Driver Support
>> #
>> CONFIG_USB_DWC3_PCI=3Dy
>> CONFIG_USB_DWC2=3Dy
>> CONFIG_USB_DWC2_HOST=3Dy
>>
>> #
>> # Gadget/Dual-role mode requires USB Gadget support to be enabled
>> #
>> # CONFIG_USB_DWC2_PCI is not set
>> # CONFIG_USB_DWC2_DEBUG is not set
>> CONFIG_USB_DWC2_TRACK_MISSED_SOFS=3Dy
>> # CONFIG_USB_CHIPIDEA is not set
>> CONFIG_USB_ISP1760=3Dy
>> CONFIG_USB_ISP1760_HCD=3Dy
>> CONFIG_USB_ISP1760_HOST_ROLE=3Dy
>>
>> #
>> # USB port drivers
>> #
>> CONFIG_USB_USS720=3Dy
>> CONFIG_USB_SERIAL=3Dy
>> CONFIG_USB_SERIAL_CONSOLE=3Dy
>> # CONFIG_USB_SERIAL_GENERIC is not set
>> CONFIG_USB_SERIAL_SIMPLE=3Dy
>> CONFIG_USB_SERIAL_AIRCABLE=3Dy
>> CONFIG_USB_SERIAL_ARK3116=3Dy
>> CONFIG_USB_SERIAL_BELKIN=3Dy
>> # CONFIG_USB_SERIAL_CH341 is not set
>> CONFIG_USB_SERIAL_WHITEHEAT=3Dy
>> CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dy
>> CONFIG_USB_SERIAL_CP210X=3Dy
>> CONFIG_USB_SERIAL_CYPRESS_M8=3Dy
>> CONFIG_USB_SERIAL_EMPEG=3Dy
>> CONFIG_USB_SERIAL_FTDI_SIO=3Dy
>> CONFIG_USB_SERIAL_VISOR=3Dy
>> # CONFIG_USB_SERIAL_IPAQ is not set
>> CONFIG_USB_SERIAL_IR=3Dy
>> CONFIG_USB_SERIAL_EDGEPORT=3Dy
>> CONFIG_USB_SERIAL_EDGEPORT_TI=3Dy
>> CONFIG_USB_SERIAL_F81232=3Dy
>> # CONFIG_USB_SERIAL_GARMIN is not set
>> # CONFIG_USB_SERIAL_IPW is not set
>> CONFIG_USB_SERIAL_IUU=3Dy
>> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
>> CONFIG_USB_SERIAL_KEYSPAN=3Dy
>> CONFIG_USB_SERIAL_KLSI=3Dy
>> CONFIG_USB_SERIAL_KOBIL_SCT=3Dy
>> # CONFIG_USB_SERIAL_MCT_U232 is not set
>> CONFIG_USB_SERIAL_METRO=3Dy
>> CONFIG_USB_SERIAL_MOS7720=3Dy
>> CONFIG_USB_SERIAL_MOS7715_PARPORT=3Dy
>> # CONFIG_USB_SERIAL_MOS7840 is not set
>> CONFIG_USB_SERIAL_MXUPORT=3Dy
>> CONFIG_USB_SERIAL_NAVMAN=3Dy
>> # CONFIG_USB_SERIAL_PL2303 is not set
>> # CONFIG_USB_SERIAL_OTI6858 is not set
>> CONFIG_USB_SERIAL_QCAUX=3Dy
>> # CONFIG_USB_SERIAL_QUALCOMM is not set
>> CONFIG_USB_SERIAL_SPCP8X5=3Dy
>> CONFIG_USB_SERIAL_SAFE=3Dy
>> # CONFIG_USB_SERIAL_SAFE_PADDED is not set
>> CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dy
>> # CONFIG_USB_SERIAL_SYMBOL is not set
>> # CONFIG_USB_SERIAL_TI is not set
>> CONFIG_USB_SERIAL_CYBERJACK=3Dy
>> CONFIG_USB_SERIAL_XIRCOM=3Dy
>> CONFIG_USB_SERIAL_WWAN=3Dy
>> CONFIG_USB_SERIAL_OPTION=3Dy
>> # CONFIG_USB_SERIAL_OMNINET is not set
>> CONFIG_USB_SERIAL_OPTICON=3Dy
>> # CONFIG_USB_SERIAL_XSENS_MT is not set
>> CONFIG_USB_SERIAL_WISHBONE=3Dy
>> CONFIG_USB_SERIAL_SSU100=3Dy
>> CONFIG_USB_SERIAL_QT2=3Dy
>> CONFIG_USB_SERIAL_DEBUG=3Dy
>>
>> #
>> # USB Miscellaneous drivers
>> #
>> # CONFIG_USB_EMI62 is not set
>> # CONFIG_USB_EMI26 is not set
>> CONFIG_USB_ADUTUX=3Dy
>> CONFIG_USB_SEVSEG=3Dy
>> CONFIG_USB_RIO500=3Dy
>> CONFIG_USB_LEGOTOWER=3Dy
>> CONFIG_USB_LCD=3Dy
>> CONFIG_USB_LED=3Dy
>> # CONFIG_USB_CYPRESS_CY7C63 is not set
>> # CONFIG_USB_CYTHERM is not set
>> CONFIG_USB_IDMOUSE=3Dy
>> CONFIG_USB_FTDI_ELAN=3Dy
>> CONFIG_USB_APPLEDISPLAY=3Dy
>> # CONFIG_USB_SISUSBVGA is not set
>> CONFIG_USB_LD=3Dy
>> CONFIG_USB_TRANCEVIBRATOR=3Dy
>> CONFIG_USB_IOWARRIOR=3Dy
>> CONFIG_USB_TEST=3Dy
>> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
>> CONFIG_USB_ISIGHTFW=3Dy
>> # CONFIG_USB_YUREX is not set
>> CONFIG_USB_EZUSB_FX2=3Dy
>> # CONFIG_USB_HSIC_USB3503 is not set
>> CONFIG_USB_LINK_LAYER_TEST=3Dy
>> # CONFIG_USB_CHAOSKEY is not set
>> # CONFIG_UCSI is not set
>>
>> #
>> # USB Physical Layer drivers
>> #
>> CONFIG_USB_PHY=3Dy
>> CONFIG_NOP_USB_XCEIV=3Dy
>> CONFIG_USB_GPIO_VBUS=3Dy
>> # CONFIG_TAHVO_USB is not set
>> # CONFIG_USB_ISP1301 is not set
>> # CONFIG_USB_GADGET is not set
>> CONFIG_UWB=3Dy
>> CONFIG_UWB_HWA=3Dy
>> # CONFIG_UWB_WHCI is not set
>> CONFIG_UWB_I1480U=3Dy
>> # CONFIG_MMC is not set
>> # CONFIG_MEMSTICK is not set
>> CONFIG_NEW_LEDS=3Dy
>> CONFIG_LEDS_CLASS=3Dy
>> # CONFIG_LEDS_CLASS_FLASH is not set
>>
>> #
>> # LED drivers
>> #
>> CONFIG_LEDS_BCM6328=3Dy
>> # CONFIG_LEDS_BCM6358 is not set
>> CONFIG_LEDS_LM3530=3Dy
>> # CONFIG_LEDS_LM3533 is not set
>> CONFIG_LEDS_LM3642=3Dy
>> CONFIG_LEDS_PCA9532=3Dy
>> # CONFIG_LEDS_PCA9532_GPIO is not set
>> CONFIG_LEDS_GPIO=3Dy
>> # CONFIG_LEDS_LP3944 is not set
>> CONFIG_LEDS_LP55XX_COMMON=3Dy
>> CONFIG_LEDS_LP5521=3Dy
>> CONFIG_LEDS_LP5523=3Dy
>> # CONFIG_LEDS_LP5562 is not set
>> # CONFIG_LEDS_LP8501 is not set
>> CONFIG_LEDS_LP8860=3Dy
>> # CONFIG_LEDS_CLEVO_MAIL is not set
>> CONFIG_LEDS_PCA955X=3Dy
>> CONFIG_LEDS_PCA963X=3Dy
>> # CONFIG_LEDS_WM831X_STATUS is not set
>> CONFIG_LEDS_WM8350=3Dy
>> CONFIG_LEDS_DA903X=3Dy
>> CONFIG_LEDS_DA9052=3Dy
>> # CONFIG_LEDS_DAC124S085 is not set
>> CONFIG_LEDS_REGULATOR=3Dy
>> CONFIG_LEDS_BD2802=3Dy
>> # CONFIG_LEDS_INTEL_SS4200 is not set
>> CONFIG_LEDS_LT3593=3Dy
>> CONFIG_LEDS_MC13783=3Dy
>> CONFIG_LEDS_TCA6507=3Dy
>> CONFIG_LEDS_TLC591XX=3Dy
>> # CONFIG_LEDS_LM355x is not set
>> CONFIG_LEDS_MENF21BMC=3Dy
>> CONFIG_LEDS_IS31FL32XX=3Dy
>>
>> #
>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_=
THINGM)
>> #
>> # CONFIG_LEDS_BLINKM is not set
>> # CONFIG_LEDS_SYSCON is not set
>>
>> #
>> # LED Triggers
>> #
>> # CONFIG_LEDS_TRIGGERS is not set
>> CONFIG_ACCESSIBILITY=3Dy
>> CONFIG_A11Y_BRAILLE_CONSOLE=3Dy
>> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>> CONFIG_EDAC_SUPPORT=3Dy
>> # CONFIG_EDAC is not set
>> CONFIG_RTC_LIB=3Dy
>> CONFIG_RTC_CLASS=3Dy
>> # CONFIG_RTC_HCTOSYS is not set
>> CONFIG_RTC_SYSTOHC=3Dy
>> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
>> # CONFIG_RTC_DEBUG is not set
>>
>> #
>> # RTC interfaces
>> #
>> CONFIG_RTC_INTF_SYSFS=3Dy
>> CONFIG_RTC_INTF_PROC=3Dy
>> # CONFIG_RTC_INTF_DEV is not set
>> CONFIG_RTC_DRV_TEST=3Dy
>>
>> #
>> # I2C RTC drivers
>> #
>> # CONFIG_RTC_DRV_88PM80X is not set
>> CONFIG_RTC_DRV_ABB5ZES3=3Dy
>> CONFIG_RTC_DRV_ABX80X=3Dy
>> CONFIG_RTC_DRV_AS3722=3Dy
>> CONFIG_RTC_DRV_DS1307=3Dy
>> CONFIG_RTC_DRV_DS1307_HWMON=3Dy
>> CONFIG_RTC_DRV_DS1374=3Dy
>> # CONFIG_RTC_DRV_DS1374_WDT is not set
>> CONFIG_RTC_DRV_DS1672=3Dy
>> # CONFIG_RTC_DRV_HYM8563 is not set
>> # CONFIG_RTC_DRV_MAX6900 is not set
>> CONFIG_RTC_DRV_MAX8907=3Dy
>> CONFIG_RTC_DRV_MAX8998=3Dy
>> CONFIG_RTC_DRV_MAX77686=3Dy
>> # CONFIG_RTC_DRV_RS5C372 is not set
>> CONFIG_RTC_DRV_ISL1208=3Dy
>> # CONFIG_RTC_DRV_ISL12022 is not set
>> CONFIG_RTC_DRV_ISL12057=3Dy
>> CONFIG_RTC_DRV_X1205=3Dy
>> # CONFIG_RTC_DRV_PCF8523 is not set
>> CONFIG_RTC_DRV_PCF85063=3Dy
>> CONFIG_RTC_DRV_PCF8563=3Dy
>> CONFIG_RTC_DRV_PCF8583=3Dy
>> CONFIG_RTC_DRV_M41T80=3Dy
>> # CONFIG_RTC_DRV_M41T80_WDT is not set
>> CONFIG_RTC_DRV_BQ32K=3Dy
>> CONFIG_RTC_DRV_S35390A=3Dy
>> # CONFIG_RTC_DRV_FM3130 is not set
>> CONFIG_RTC_DRV_RX8010=3Dy
>> # CONFIG_RTC_DRV_RX8581 is not set
>> # CONFIG_RTC_DRV_RX8025 is not set
>> CONFIG_RTC_DRV_EM3027=3Dy
>> CONFIG_RTC_DRV_RV8803=3Dy
>> CONFIG_RTC_DRV_S5M=3Dy
>>
>> #
>> # SPI RTC drivers
>> #
>> CONFIG_RTC_DRV_M41T93=3Dy
>> # CONFIG_RTC_DRV_M41T94 is not set
>> # CONFIG_RTC_DRV_DS1302 is not set
>> CONFIG_RTC_DRV_DS1305=3Dy
>> # CONFIG_RTC_DRV_DS1343 is not set
>> # CONFIG_RTC_DRV_DS1347 is not set
>> CONFIG_RTC_DRV_DS1390=3Dy
>> CONFIG_RTC_DRV_R9701=3Dy
>> # CONFIG_RTC_DRV_RX4581 is not set
>> # CONFIG_RTC_DRV_RX6110 is not set
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
>> CONFIG_RTC_DRV_PCF2127=3Dy
>> # CONFIG_RTC_DRV_RV3029C2 is not set
>>
>> #
>> # Platform RTC drivers
>> #
>> CONFIG_RTC_DRV_CMOS=3Dy
>> # CONFIG_RTC_DRV_DS1286 is not set
>> CONFIG_RTC_DRV_DS1511=3Dy
>> # CONFIG_RTC_DRV_DS1553 is not set
>> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
>> CONFIG_RTC_DRV_DS1685=3Dy
>> # CONFIG_RTC_DRV_DS1689 is not set
>> # CONFIG_RTC_DRV_DS17285 is not set
>> # CONFIG_RTC_DRV_DS17485 is not set
>> # CONFIG_RTC_DRV_DS17885 is not set
>> # CONFIG_RTC_DS1685_PROC_REGS is not set
>> # CONFIG_RTC_DS1685_SYSFS_REGS is not set
>> CONFIG_RTC_DRV_DS1742=3Dy
>> CONFIG_RTC_DRV_DS2404=3Dy
>> CONFIG_RTC_DRV_DA9052=3Dy
>> CONFIG_RTC_DRV_DA9063=3Dy
>> CONFIG_RTC_DRV_STK17TA8=3Dy
>> CONFIG_RTC_DRV_M48T86=3Dy
>> CONFIG_RTC_DRV_M48T35=3Dy
>> CONFIG_RTC_DRV_M48T59=3Dy
>> CONFIG_RTC_DRV_MSM6242=3Dy
>> # CONFIG_RTC_DRV_BQ4802 is not set
>> CONFIG_RTC_DRV_RP5C01=3Dy
>> # CONFIG_RTC_DRV_V3020 is not set
>> CONFIG_RTC_DRV_WM831X=3Dy
>> # CONFIG_RTC_DRV_WM8350 is not set
>> CONFIG_RTC_DRV_PCF50633=3Dy
>> CONFIG_RTC_DRV_AB3100=3Dy
>> CONFIG_RTC_DRV_ZYNQMP=3Dy
>>
>> #
>> # on-CPU RTC drivers
>> #
>> # CONFIG_RTC_DRV_MC13XXX is not set
>> CONFIG_RTC_DRV_SNVS=3Dy
>> CONFIG_RTC_DRV_MT6397=3Dy
>>
>> #
>> # HID Sensor RTC drivers
>> #
>> # CONFIG_DMADEVICES is not set
>>
>> #
>> # DMABUF options
>> #
>> # CONFIG_SYNC_FILE is not set
>> CONFIG_AUXDISPLAY=3Dy
>> CONFIG_UIO=3Dy
>> # CONFIG_UIO_CIF is not set
>> CONFIG_UIO_PDRV_GENIRQ=3Dy
>> CONFIG_UIO_DMEM_GENIRQ=3Dy
>> # CONFIG_UIO_AEC is not set
>> # CONFIG_UIO_SERCOS3 is not set
>> # CONFIG_UIO_PCI_GENERIC is not set
>> # CONFIG_UIO_NETX is not set
>> # CONFIG_UIO_PRUSS is not set
>> # CONFIG_UIO_MF624 is not set
>> # CONFIG_VIRT_DRIVERS is not set
>> CONFIG_VIRTIO=3Dy
>>
>> #
>> # Virtio drivers
>> #
>> # CONFIG_VIRTIO_PCI is not set
>> # CONFIG_VIRTIO_BALLOON is not set
>> # CONFIG_VIRTIO_INPUT is not set
>> CONFIG_VIRTIO_MMIO=3Dy
>> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
>>
>> #
>> # Microsoft Hyper-V guest support
>> #
>> # CONFIG_HYPERV is not set
>> CONFIG_STAGING=3Dy
>> # CONFIG_SLICOSS is not set
>> # CONFIG_RTS5208 is not set
>>
>> #
>> # IIO staging drivers
>> #
>>
>> #
>> # Accelerometers
>> #
>> # CONFIG_ADIS16201 is not set
>> CONFIG_ADIS16203=3Dy
>> CONFIG_ADIS16209=3Dy
>> # CONFIG_ADIS16240 is not set
>> # CONFIG_LIS3L02DQ is not set
>> CONFIG_SCA3000=3Dy
>>
>> #
>> # Analog to digital converters
>> #
>> CONFIG_AD7606=3Dy
>> # CONFIG_AD7606_IFACE_PARALLEL is not set
>> CONFIG_AD7606_IFACE_SPI=3Dy
>> CONFIG_AD7780=3Dy
>> CONFIG_AD7816=3Dy
>> # CONFIG_AD7192 is not set
>> CONFIG_AD7280=3Dy
>>
>> #
>> # Analog digital bi-direction converters
>> #
>> CONFIG_ADT7316=3Dy
>> # CONFIG_ADT7316_SPI is not set
>> # CONFIG_ADT7316_I2C is not set
>>
>> #
>> # Capacitance to digital converters
>> #
>> CONFIG_AD7150=3Dy
>> # CONFIG_AD7152 is not set
>> CONFIG_AD7746=3Dy
>>
>> #
>> # Direct Digital Synthesis
>> #
>> CONFIG_AD9832=3Dy
>> CONFIG_AD9834=3Dy
>>
>> #
>> # Digital gyroscope sensors
>> #
>> # CONFIG_ADIS16060 is not set
>>
>> #
>> # Network Analyzer, Impedance Converters
>> #
>> # CONFIG_AD5933 is not set
>>
>> #
>> # Light sensors
>> #
>> CONFIG_SENSORS_ISL29018=3Dy
>> CONFIG_SENSORS_ISL29028=3Dy
>> CONFIG_TSL2583=3Dy
>> CONFIG_TSL2x7x=3Dy
>>
>> #
>> # Active energy metering IC
>> #
>> CONFIG_ADE7753=3Dy
>> # CONFIG_ADE7754 is not set
>> CONFIG_ADE7758=3Dy
>> CONFIG_ADE7759=3Dy
>> CONFIG_ADE7854=3Dy
>> CONFIG_ADE7854_I2C=3Dy
>> CONFIG_ADE7854_SPI=3Dy
>>
>> #
>> # Resolver to digital converters
>> #
>> CONFIG_AD2S90=3Dy
>> # CONFIG_AD2S1200 is not set
>> # CONFIG_AD2S1210 is not set
>>
>> #
>> # Triggers - standalone
>> #
>> # CONFIG_FB_SM750 is not set
>> # CONFIG_FB_XGI is not set
>>
>> #
>> # Speakup console speech
>> #
>> CONFIG_SPEAKUP=3Dy
>> CONFIG_SPEAKUP_SYNTH_ACNTSA=3Dy
>> # CONFIG_SPEAKUP_SYNTH_APOLLO is not set
>> CONFIG_SPEAKUP_SYNTH_AUDPTR=3Dy
>> CONFIG_SPEAKUP_SYNTH_BNS=3Dy
>> CONFIG_SPEAKUP_SYNTH_DECTLK=3Dy
>> # CONFIG_SPEAKUP_SYNTH_DECEXT is not set
>> # CONFIG_SPEAKUP_SYNTH_LTLK is not set
>> # CONFIG_SPEAKUP_SYNTH_SOFT is not set
>> # CONFIG_SPEAKUP_SYNTH_SPKOUT is not set
>> # CONFIG_SPEAKUP_SYNTH_TXPRT is not set
>> # CONFIG_SPEAKUP_SYNTH_DUMMY is not set
>> CONFIG_STAGING_MEDIA=3Dy
>> # CONFIG_VIDEO_TW686X_KH is not set
>>
>> #
>> # Android
>> #
>> CONFIG_FIREWIRE_SERIAL=3Dy
>> CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
>> CONFIG_FWTTY_MAX_CARD_PORTS=3D32
>> # CONFIG_DGNC is not set
>> CONFIG_GS_FPGABOOT=3Dy
>> CONFIG_CRYPTO_SKEIN=3Dy
>> # CONFIG_UNISYSSPAR is not set
>> CONFIG_FB_TFT=3Dy
>> CONFIG_FB_TFT_AGM1264K_FL=3Dy
>> CONFIG_FB_TFT_BD663474=3Dy
>> CONFIG_FB_TFT_HX8340BN=3Dy
>> # CONFIG_FB_TFT_HX8347D is not set
>> CONFIG_FB_TFT_HX8353D=3Dy
>> CONFIG_FB_TFT_HX8357D=3Dy
>> # CONFIG_FB_TFT_ILI9163 is not set
>> # CONFIG_FB_TFT_ILI9320 is not set
>> CONFIG_FB_TFT_ILI9325=3Dy
>> # CONFIG_FB_TFT_ILI9340 is not set
>> CONFIG_FB_TFT_ILI9341=3Dy
>> # CONFIG_FB_TFT_ILI9481 is not set
>> # CONFIG_FB_TFT_ILI9486 is not set
>> CONFIG_FB_TFT_PCD8544=3Dy
>> # CONFIG_FB_TFT_RA8875 is not set
>> CONFIG_FB_TFT_S6D02A1=3Dy
>> CONFIG_FB_TFT_S6D1121=3Dy
>> # CONFIG_FB_TFT_SSD1289 is not set
>> # CONFIG_FB_TFT_SSD1305 is not set
>> CONFIG_FB_TFT_SSD1306=3Dy
>> # CONFIG_FB_TFT_SSD1325 is not set
>> CONFIG_FB_TFT_SSD1331=3Dy
>> CONFIG_FB_TFT_SSD1351=3Dy
>> # CONFIG_FB_TFT_ST7735R is not set
>> # CONFIG_FB_TFT_ST7789V is not set
>> CONFIG_FB_TFT_TINYLCD=3Dy
>> CONFIG_FB_TFT_TLS8204=3Dy
>> CONFIG_FB_TFT_UC1611=3Dy
>> CONFIG_FB_TFT_UC1701=3Dy
>> CONFIG_FB_TFT_UPD161704=3Dy
>> # CONFIG_FB_TFT_WATTEROTT is not set
>> # CONFIG_FB_FLEX is not set
>> CONFIG_FB_TFT_FBTFT_DEVICE=3Dy
>> CONFIG_MOST=3Dy
>> CONFIG_MOSTCORE=3Dy
>> # CONFIG_AIM_CDEV is not set
>> # CONFIG_AIM_NETWORK is not set
>> # CONFIG_AIM_V4L2 is not set
>> CONFIG_HDM_I2C=3Dy
>> # CONFIG_HDM_USB is not set
>> CONFIG_X86_PLATFORM_DEVICES=3Dy
>> # CONFIG_ACERHDF is not set
>> # CONFIG_ASUS_LAPTOP is not set
>> CONFIG_DELL_SMBIOS=3Dy
>> # CONFIG_DELL_LAPTOP is not set
>> # CONFIG_DELL_SMO8800 is not set
>> # CONFIG_FUJITSU_LAPTOP is not set
>> # CONFIG_FUJITSU_TABLET is not set
>> # CONFIG_HP_ACCEL is not set
>> # CONFIG_HP_WIRELESS is not set
>> # CONFIG_PANASONIC_LAPTOP is not set
>> # CONFIG_THINKPAD_ACPI is not set
>> # CONFIG_SENSORS_HDAPS is not set
>> # CONFIG_INTEL_MENLOW is not set
>> # CONFIG_ASUS_WIRELESS is not set
>> # CONFIG_ACPI_WMI is not set
>> # CONFIG_TOPSTAR_LAPTOP is not set
>> # CONFIG_TOSHIBA_BT_RFKILL is not set
>> # CONFIG_TOSHIBA_HAPS is not set
>> # CONFIG_ACPI_CMPC is not set
>> # CONFIG_INTEL_HID_EVENT is not set
>> # CONFIG_INTEL_IPS is not set
>> # CONFIG_INTEL_PMC_CORE is not set
>> # CONFIG_IBM_RTL is not set
>> # CONFIG_SAMSUNG_LAPTOP is not set
>> # CONFIG_SAMSUNG_Q10 is not set
>> # CONFIG_APPLE_GMUX is not set
>> # CONFIG_INTEL_RST is not set
>> # CONFIG_INTEL_SMARTCONNECT is not set
>> # CONFIG_PVPANIC is not set
>> # CONFIG_INTEL_PMC_IPC is not set
>> # CONFIG_SURFACE_PRO3_BUTTON is not set
>> CONFIG_INTEL_PUNIT_IPC=3Dy
>> CONFIG_CHROME_PLATFORMS=3Dy
>> CONFIG_CHROMEOS_LAPTOP=3Dy
>> CONFIG_CHROMEOS_PSTORE=3Dy
>> CONFIG_CROS_EC_CHARDEV=3Dy
>> CONFIG_CROS_EC_LPC=3Dy
>> CONFIG_CROS_EC_PROTO=3Dy
>> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
>>
>> #
>> # Hardware Spinlock drivers
>> #
>>
>> #
>> # Clock Source drivers
>> #
>> CONFIG_CLKEVT_I8253=3Dy
>> CONFIG_I8253_LOCK=3Dy
>> CONFIG_CLKBLD_I8253=3Dy
>> # CONFIG_ATMEL_PIT is not set
>> # CONFIG_SH_TIMER_CMT is not set
>> # CONFIG_SH_TIMER_MTU2 is not set
>> # CONFIG_SH_TIMER_TMU is not set
>> # CONFIG_EM_TIMER_STI is not set
>> CONFIG_MAILBOX=3Dy
>> # CONFIG_PCC is not set
>> CONFIG_ALTERA_MBOX=3Dy
>> CONFIG_MAILBOX_TEST=3Dy
>> CONFIG_IOMMU_SUPPORT=3Dy
>>
>> #
>> # Generic IOMMU Pagetable Support
>> #
>> # CONFIG_AMD_IOMMU is not set
>>
>> #
>> # Remoteproc drivers
>> #
>> # CONFIG_STE_MODEM_RPROC is not set
>>
>> #
>> # Rpmsg drivers
>> #
>>
>> #
>> # SOC (System On Chip) specific Drivers
>> #
>> # CONFIG_SUNXI_SRAM is not set
>> CONFIG_SOC_TI=3Dy
>> CONFIG_PM_DEVFREQ=3Dy
>>
>> #
>> # DEVFREQ Governors
>> #
>> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
>> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
>> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
>> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
>> # CONFIG_DEVFREQ_GOV_PASSIVE is not set
>>
>> #
>> # DEVFREQ Drivers
>> #
>> # CONFIG_PM_DEVFREQ_EVENT is not set
>> CONFIG_EXTCON=3Dy
>>
>> #
>> # Extcon Device Drivers
>> #
>> CONFIG_EXTCON_ADC_JACK=3Dy
>> CONFIG_EXTCON_AXP288=3Dy
>> # CONFIG_EXTCON_GPIO is not set
>> CONFIG_EXTCON_MAX3355=3Dy
>> CONFIG_EXTCON_MAX77693=3Dy
>> CONFIG_EXTCON_RT8973A=3Dy
>> CONFIG_EXTCON_SM5502=3Dy
>> # CONFIG_EXTCON_USB_GPIO is not set
>> CONFIG_MEMORY=3Dy
>> CONFIG_IIO=3Dy
>> CONFIG_IIO_BUFFER=3Dy
>> CONFIG_IIO_BUFFER_CB=3Dy
>> CONFIG_IIO_KFIFO_BUF=3Dy
>> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
>> CONFIG_IIO_CONFIGFS=3Dy
>> CONFIG_IIO_TRIGGER=3Dy
>> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
>> # CONFIG_IIO_SW_TRIGGER is not set
>>
>> #
>> # Accelerometers
>> #
>> CONFIG_BMA180=3Dy
>> CONFIG_BMC150_ACCEL=3Dy
>> CONFIG_BMC150_ACCEL_I2C=3Dy
>> CONFIG_BMC150_ACCEL_SPI=3Dy
>> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
>> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
>> CONFIG_IIO_ST_ACCEL_SPI_3AXIS=3Dy
>> # CONFIG_KXSD9 is not set
>> CONFIG_KXCJK1013=3Dy
>> CONFIG_MMA7455=3Dy
>> CONFIG_MMA7455_I2C=3Dy
>> CONFIG_MMA7455_SPI=3Dy
>> CONFIG_MMA8452=3Dy
>> CONFIG_MMA9551_CORE=3Dy
>> CONFIG_MMA9551=3Dy
>> CONFIG_MMA9553=3Dy
>> CONFIG_MXC4005=3Dy
>> # CONFIG_MXC6255 is not set
>> # CONFIG_STK8312 is not set
>> CONFIG_STK8BA50=3Dy
>>
>> #
>> # Analog to digital converters
>> #
>> CONFIG_AD_SIGMA_DELTA=3Dy
>> # CONFIG_AD7266 is not set
>> # CONFIG_AD7291 is not set
>> # CONFIG_AD7298 is not set
>> CONFIG_AD7476=3Dy
>> CONFIG_AD7791=3Dy
>> # CONFIG_AD7793 is not set
>> CONFIG_AD7887=3Dy
>> # CONFIG_AD7923 is not set
>> CONFIG_AD799X=3Dy
>> # CONFIG_AXP288_ADC is not set
>> # CONFIG_DA9150_GPADC is not set
>> # CONFIG_HI8435 is not set
>> CONFIG_MAX1027=3Dy
>> # CONFIG_MAX1363 is not set
>> CONFIG_MCP320X=3Dy
>> # CONFIG_MCP3422 is not set
>> CONFIG_MEN_Z188_ADC=3Dy
>> CONFIG_NAU7802=3Dy
>> # CONFIG_TI_ADC081C is not set
>> # CONFIG_TI_ADC0832 is not set
>> CONFIG_TI_ADC128S052=3Dy
>> CONFIG_TI_ADS8688=3Dy
>> CONFIG_VF610_ADC=3Dy
>> CONFIG_VIPERBOARD_ADC=3Dy
>>
>> #
>> # Amplifiers
>> #
>> # CONFIG_AD8366 is not set
>>
>> #
>> # Chemical Sensors
>> #
>> # CONFIG_ATLAS_PH_SENSOR is not set
>> CONFIG_IAQCORE=3Dy
>> CONFIG_VZ89X=3Dy
>>
>> #
>> # Hid Sensor IIO Common
>> #
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
>> # Digital to analog converters
>> #
>> CONFIG_AD5064=3Dy
>> CONFIG_AD5360=3Dy
>> # CONFIG_AD5380 is not set
>> CONFIG_AD5421=3Dy
>> # CONFIG_AD5446 is not set
>> CONFIG_AD5449=3Dy
>> CONFIG_AD5592R_BASE=3Dy
>> # CONFIG_AD5592R is not set
>> CONFIG_AD5593R=3Dy
>> CONFIG_AD5504=3Dy
>> CONFIG_AD5624R_SPI=3Dy
>> CONFIG_AD5686=3Dy
>> CONFIG_AD5755=3Dy
>> # CONFIG_AD5761 is not set
>> CONFIG_AD5764=3Dy
>> CONFIG_AD5791=3Dy
>> CONFIG_AD7303=3Dy
>> # CONFIG_M62332 is not set
>> CONFIG_MAX517=3Dy
>> CONFIG_MAX5821=3Dy
>> # CONFIG_MCP4725 is not set
>> CONFIG_MCP4922=3Dy
>> CONFIG_VF610_DAC=3Dy
>>
>> #
>> # IIO dummy driver
>> #
>> # CONFIG_IIO_SIMPLE_DUMMY is not set
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
>> # CONFIG_ADIS16130 is not set
>> CONFIG_ADIS16136=3Dy
>> CONFIG_ADIS16260=3Dy
>> CONFIG_ADXRS450=3Dy
>> CONFIG_BMG160=3Dy
>> CONFIG_BMG160_I2C=3Dy
>> CONFIG_BMG160_SPI=3Dy
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
>> # CONFIG_AFE4403 is not set
>> CONFIG_AFE4404=3Dy
>> CONFIG_MAX30100=3Dy
>>
>> #
>> # Humidity sensors
>> #
>> # CONFIG_AM2315 is not set
>> CONFIG_DHT11=3Dy
>> # CONFIG_HDC100X is not set
>> CONFIG_HTU21=3Dy
>> CONFIG_SI7005=3Dy
>> CONFIG_SI7020=3Dy
>>
>> #
>> # Inertial measurement units
>> #
>> # CONFIG_ADIS16400 is not set
>> # CONFIG_ADIS16480 is not set
>> CONFIG_BMI160=3Dy
>> CONFIG_BMI160_I2C=3Dy
>> # CONFIG_BMI160_SPI is not set
>> # CONFIG_KMX61 is not set
>> CONFIG_INV_MPU6050_IIO=3Dy
>> # CONFIG_INV_MPU6050_I2C is not set
>> CONFIG_INV_MPU6050_SPI=3Dy
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
>> # CONFIG_APDS9960 is not set
>> # CONFIG_BH1750 is not set
>> CONFIG_CM32181=3Dy
>> CONFIG_CM3232=3Dy
>> CONFIG_CM3323=3Dy
>> # CONFIG_CM36651 is not set
>> CONFIG_GP2AP020A00F=3Dy
>> CONFIG_ISL29125=3Dy
>> CONFIG_JSA1212=3Dy
>> CONFIG_RPR0521=3Dy
>> CONFIG_SENSORS_LM3533=3Dy
>> CONFIG_LTR501=3Dy
>> # CONFIG_MAX44000 is not set
>> # CONFIG_OPT3001 is not set
>> CONFIG_PA12203001=3Dy
>> CONFIG_STK3310=3Dy
>> CONFIG_TCS3414=3Dy
>> # CONFIG_TCS3472 is not set
>> CONFIG_SENSORS_TSL2563=3Dy
>> CONFIG_TSL4531=3Dy
>> # CONFIG_US5182D is not set
>> # CONFIG_VCNL4000 is not set
>> CONFIG_VEML6070=3Dy
>>
>> #
>> # Magnetometer sensors
>> #
>> CONFIG_AK8975=3Dy
>> CONFIG_AK09911=3Dy
>> CONFIG_BMC150_MAGN=3Dy
>> CONFIG_BMC150_MAGN_I2C=3Dy
>> # CONFIG_BMC150_MAGN_SPI is not set
>> # CONFIG_MAG3110 is not set
>> # CONFIG_MMC35240 is not set
>> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
>> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
>> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
>> CONFIG_SENSORS_HMC5843=3Dy
>> CONFIG_SENSORS_HMC5843_I2C=3Dy
>> CONFIG_SENSORS_HMC5843_SPI=3Dy
>>
>> #
>> # Inclinometer sensors
>> #
>>
>> #
>> # Triggers - standalone
>> #
>> # CONFIG_IIO_INTERRUPT_TRIGGER is not set
>> CONFIG_IIO_SYSFS_TRIGGER=3Dy
>>
>> #
>> # Digital potentiometers
>> #
>> # CONFIG_DS1803 is not set
>> CONFIG_MCP4131=3Dy
>> # CONFIG_MCP4531 is not set
>> CONFIG_TPL0102=3Dy
>>
>> #
>> # Pressure sensors
>> #
>> CONFIG_HP03=3Dy
>> CONFIG_MPL115=3Dy
>> # CONFIG_MPL115_I2C is not set
>> CONFIG_MPL115_SPI=3Dy
>> CONFIG_MPL3115=3Dy
>> CONFIG_MS5611=3Dy
>> CONFIG_MS5611_I2C=3Dy
>> # CONFIG_MS5611_SPI is not set
>> CONFIG_MS5637=3Dy
>> CONFIG_IIO_ST_PRESS=3Dy
>> CONFIG_IIO_ST_PRESS_I2C=3Dy
>> CONFIG_IIO_ST_PRESS_SPI=3Dy
>> # CONFIG_T5403 is not set
>> CONFIG_HP206C=3Dy
>>
>> #
>> # Lightning sensors
>> #
>> # CONFIG_AS3935 is not set
>>
>> #
>> # Proximity sensors
>> #
>> CONFIG_LIDAR_LITE_V2=3Dy
>> CONFIG_SX9500=3Dy
>>
>> #
>> # Temperature sensors
>> #
>> CONFIG_MLX90614=3Dy
>> CONFIG_TMP006=3Dy
>> CONFIG_TSYS01=3Dy
>> # CONFIG_TSYS02D is not set
>> # CONFIG_NTB is not set
>> # CONFIG_VME_BUS is not set
>> # CONFIG_PWM is not set
>> CONFIG_IRQCHIP=3Dy
>> CONFIG_ARM_GIC_MAX_NR=3D1
>> CONFIG_IPACK_BUS=3Dy
>> # CONFIG_BOARD_TPCI200 is not set
>> CONFIG_SERIAL_IPOCTAL=3Dy
>> CONFIG_RESET_CONTROLLER=3Dy
>> CONFIG_FMC=3Dy
>> # CONFIG_FMC_FAKEDEV is not set
>> CONFIG_FMC_TRIVIAL=3Dy
>> CONFIG_FMC_WRITE_EEPROM=3Dy
>> CONFIG_FMC_CHARDEV=3Dy
>>
>> #
>> # PHY Subsystem
>> #
>> CONFIG_GENERIC_PHY=3Dy
>> # CONFIG_PHY_PXA_28NM_HSIC is not set
>> # CONFIG_PHY_PXA_28NM_USB2 is not set
>> CONFIG_BCM_KONA_USB2_PHY=3Dy
>> CONFIG_PHY_SAMSUNG_USB2=3Dy
>> # CONFIG_PHY_EXYNOS4210_USB2 is not set
>> # CONFIG_PHY_EXYNOS4X12_USB2 is not set
>> # CONFIG_PHY_EXYNOS5250_USB2 is not set
>> # CONFIG_POWERCAP is not set
>> CONFIG_MCB=3Dy
>> # CONFIG_MCB_PCI is not set
>>
>> #
>> # Performance monitor support
>> #
>> CONFIG_RAS=3Dy
>> # CONFIG_THUNDERBOLT is not set
>>
>> #
>> # Android
>> #
>> # CONFIG_ANDROID is not set
>> CONFIG_LIBNVDIMM=3Dy
>> CONFIG_BLK_DEV_PMEM=3Dy
>> CONFIG_ND_BLK=3Dy
>> # CONFIG_BTT is not set
>> CONFIG_DEV_DAX=3Dy
>> CONFIG_NVMEM=3Dy
>> # CONFIG_STM is not set
>> CONFIG_INTEL_TH=3Dy
>> # CONFIG_INTEL_TH_PCI is not set
>> CONFIG_INTEL_TH_GTH=3Dy
>> CONFIG_INTEL_TH_MSU=3Dy
>> CONFIG_INTEL_TH_PTI=3Dy
>> # CONFIG_INTEL_TH_DEBUG is not set
>>
>> #
>> # FPGA Configuration Support
>> #
>> CONFIG_FPGA=3Dy
>> CONFIG_FPGA_MGR_ZYNQ_FPGA=3Dy
>>
>> #
>> # Firmware Drivers
>> #
>> # CONFIG_EDD is not set
>> CONFIG_FIRMWARE_MEMMAP=3Dy
>> # CONFIG_DELL_RBU is not set
>> CONFIG_DCDBAS=3Dy
>> # CONFIG_DMIID is not set
>> CONFIG_DMI_SYSFS=3Dy
>> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
>> # CONFIG_ISCSI_IBFT_FIND is not set
>> CONFIG_FW_CFG_SYSFS=3Dy
>> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
>> # CONFIG_GOOGLE_FIRMWARE is not set
>>
>> #
>> # File systems
>> #
>> CONFIG_DCACHE_WORD_ACCESS=3Dy
>> # CONFIG_EXT2_FS is not set
>> # CONFIG_EXT3_FS is not set
>> CONFIG_EXT4_FS=3Dy
>> # CONFIG_EXT4_USE_FOR_EXT2 is not set
>> # CONFIG_EXT4_FS_POSIX_ACL is not set
>> # CONFIG_EXT4_FS_SECURITY is not set
>> CONFIG_EXT4_ENCRYPTION=3Dy
>> CONFIG_EXT4_FS_ENCRYPTION=3Dy
>> CONFIG_EXT4_DEBUG=3Dy
>> CONFIG_JBD2=3Dy
>> # CONFIG_JBD2_DEBUG is not set
>> CONFIG_FS_MBCACHE=3Dy
>> CONFIG_REISERFS_FS=3Dy
>> # CONFIG_REISERFS_CHECK is not set
>> # CONFIG_REISERFS_PROC_INFO is not set
>> # CONFIG_REISERFS_FS_XATTR is not set
>> # CONFIG_JFS_FS is not set
>> # CONFIG_XFS_FS is not set
>> CONFIG_GFS2_FS=3Dy
>> # CONFIG_OCFS2_FS is not set
>> CONFIG_BTRFS_FS=3Dy
>> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
>> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
>> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
>> # CONFIG_BTRFS_DEBUG is not set
>> # CONFIG_BTRFS_ASSERT is not set
>> CONFIG_NILFS2_FS=3Dy
>> # CONFIG_F2FS_FS is not set
>> # CONFIG_FS_DAX is not set
>> CONFIG_FS_POSIX_ACL=3Dy
>> CONFIG_EXPORTFS=3Dy
>> CONFIG_FILE_LOCKING=3Dy
>> # CONFIG_MANDATORY_FILE_LOCKING is not set
>> CONFIG_FS_ENCRYPTION=3Dy
>> CONFIG_FSNOTIFY=3Dy
>> # CONFIG_DNOTIFY is not set
>> CONFIG_INOTIFY_USER=3Dy
>> CONFIG_FANOTIFY=3Dy
>> CONFIG_QUOTA=3Dy
>> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
>> CONFIG_PRINT_QUOTA_WARNING=3Dy
>> CONFIG_QUOTA_DEBUG=3Dy
>> CONFIG_QUOTA_TREE=3Dy
>> CONFIG_QFMT_V1=3Dy
>> CONFIG_QFMT_V2=3Dy
>> CONFIG_QUOTACTL=3Dy
>> CONFIG_QUOTACTL_COMPAT=3Dy
>> # CONFIG_AUTOFS4_FS is not set
>> CONFIG_FUSE_FS=3Dy
>> CONFIG_CUSE=3Dy
>> CONFIG_OVERLAY_FS=3Dy
>>
>> #
>> # Caches
>> #
>> # CONFIG_FSCACHE is not set
>>
>> #
>> # CD-ROM/DVD Filesystems
>> #
>> CONFIG_ISO9660_FS=3Dy
>> # CONFIG_JOLIET is not set
>> # CONFIG_ZISOFS is not set
>> # CONFIG_UDF_FS is not set
>>
>> #
>> # DOS/FAT/NT Filesystems
>> #
>> CONFIG_FAT_FS=3Dy
>> CONFIG_MSDOS_FS=3Dy
>> CONFIG_VFAT_FS=3Dy
>> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
>> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
>> # CONFIG_FAT_DEFAULT_UTF8 is not set
>> CONFIG_NTFS_FS=3Dy
>> # CONFIG_NTFS_DEBUG is not set
>> CONFIG_NTFS_RW=3Dy
>>
>> #
>> # Pseudo filesystems
>> #
>> CONFIG_PROC_FS=3Dy
>> CONFIG_PROC_KCORE=3Dy
>> CONFIG_PROC_SYSCTL=3Dy
>> CONFIG_PROC_PAGE_MONITOR=3Dy
>> CONFIG_PROC_CHILDREN=3Dy
>> CONFIG_KERNFS=3Dy
>> CONFIG_SYSFS=3Dy
>> CONFIG_TMPFS=3Dy
>> CONFIG_TMPFS_POSIX_ACL=3Dy
>> CONFIG_TMPFS_XATTR=3Dy
>> CONFIG_HUGETLBFS=3Dy
>> CONFIG_HUGETLB_PAGE=3Dy
>> CONFIG_CONFIGFS_FS=3Dy
>> CONFIG_MISC_FILESYSTEMS=3Dy
>> CONFIG_ORANGEFS_FS=3Dy
>> CONFIG_ADFS_FS=3Dy
>> CONFIG_ADFS_FS_RW=3Dy
>> CONFIG_AFFS_FS=3Dy
>> CONFIG_ECRYPT_FS=3Dy
>> # CONFIG_ECRYPT_FS_MESSAGING is not set
>> CONFIG_HFS_FS=3Dy
>> CONFIG_HFSPLUS_FS=3Dy
>> CONFIG_HFSPLUS_FS_POSIX_ACL=3Dy
>> CONFIG_BEFS_FS=3Dy
>> CONFIG_BEFS_DEBUG=3Dy
>> CONFIG_BFS_FS=3Dy
>> CONFIG_EFS_FS=3Dy
>> # CONFIG_JFFS2_FS is not set
>> CONFIG_UBIFS_FS=3Dy
>> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
>> # CONFIG_UBIFS_FS_LZO is not set
>> # CONFIG_UBIFS_FS_ZLIB is not set
>> CONFIG_UBIFS_ATIME_SUPPORT=3Dy
>> # CONFIG_LOGFS is not set
>> CONFIG_CRAMFS=3Dy
>> # CONFIG_SQUASHFS is not set
>> CONFIG_VXFS_FS=3Dy
>> CONFIG_MINIX_FS=3Dy
>> CONFIG_OMFS_FS=3Dy
>> CONFIG_HPFS_FS=3Dy
>> # CONFIG_QNX4FS_FS is not set
>> CONFIG_QNX6FS_FS=3Dy
>> # CONFIG_QNX6FS_DEBUG is not set
>> CONFIG_ROMFS_FS=3Dy
>> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
>> # CONFIG_ROMFS_BACKED_BY_MTD is not set
>> CONFIG_ROMFS_BACKED_BY_BOTH=3Dy
>> CONFIG_ROMFS_ON_BLOCK=3Dy
>> CONFIG_ROMFS_ON_MTD=3Dy
>> # CONFIG_PSTORE is not set
>> CONFIG_SYSV_FS=3Dy
>> CONFIG_UFS_FS=3Dy
>> # CONFIG_UFS_FS_WRITE is not set
>> CONFIG_UFS_DEBUG=3Dy
>> CONFIG_EXOFS_FS=3Dy
>> # CONFIG_EXOFS_DEBUG is not set
>> CONFIG_ORE=3Dy
>> CONFIG_NETWORK_FILESYSTEMS=3Dy
>> CONFIG_NLS=3Dy
>> CONFIG_NLS_DEFAULT=3D"iso8859-1"
>> # CONFIG_NLS_CODEPAGE_437 is not set
>> # CONFIG_NLS_CODEPAGE_737 is not set
>> CONFIG_NLS_CODEPAGE_775=3Dy
>> CONFIG_NLS_CODEPAGE_850=3Dy
>> CONFIG_NLS_CODEPAGE_852=3Dy
>> # CONFIG_NLS_CODEPAGE_855 is not set
>> CONFIG_NLS_CODEPAGE_857=3Dy
>> # CONFIG_NLS_CODEPAGE_860 is not set
>> CONFIG_NLS_CODEPAGE_861=3Dy
>> CONFIG_NLS_CODEPAGE_862=3Dy
>> CONFIG_NLS_CODEPAGE_863=3Dy
>> CONFIG_NLS_CODEPAGE_864=3Dy
>> CONFIG_NLS_CODEPAGE_865=3Dy
>> CONFIG_NLS_CODEPAGE_866=3Dy
>> CONFIG_NLS_CODEPAGE_869=3Dy
>> # CONFIG_NLS_CODEPAGE_936 is not set
>> CONFIG_NLS_CODEPAGE_950=3Dy
>> CONFIG_NLS_CODEPAGE_932=3Dy
>> CONFIG_NLS_CODEPAGE_949=3Dy
>> # CONFIG_NLS_CODEPAGE_874 is not set
>> CONFIG_NLS_ISO8859_8=3Dy
>> CONFIG_NLS_CODEPAGE_1250=3Dy
>> CONFIG_NLS_CODEPAGE_1251=3Dy
>> CONFIG_NLS_ASCII=3Dy
>> CONFIG_NLS_ISO8859_1=3Dy
>> # CONFIG_NLS_ISO8859_2 is not set
>> CONFIG_NLS_ISO8859_3=3Dy
>> CONFIG_NLS_ISO8859_4=3Dy
>> CONFIG_NLS_ISO8859_5=3Dy
>> CONFIG_NLS_ISO8859_6=3Dy
>> CONFIG_NLS_ISO8859_7=3Dy
>> CONFIG_NLS_ISO8859_9=3Dy
>> CONFIG_NLS_ISO8859_13=3Dy
>> # CONFIG_NLS_ISO8859_14 is not set
>> CONFIG_NLS_ISO8859_15=3Dy
>> # CONFIG_NLS_KOI8_R is not set
>> # CONFIG_NLS_KOI8_U is not set
>> # CONFIG_NLS_MAC_ROMAN is not set
>> CONFIG_NLS_MAC_CELTIC=3Dy
>> CONFIG_NLS_MAC_CENTEURO=3Dy
>> # CONFIG_NLS_MAC_CROATIAN is not set
>> CONFIG_NLS_MAC_CYRILLIC=3Dy
>> CONFIG_NLS_MAC_GAELIC=3Dy
>> # CONFIG_NLS_MAC_GREEK is not set
>> # CONFIG_NLS_MAC_ICELAND is not set
>> # CONFIG_NLS_MAC_INUIT is not set
>> CONFIG_NLS_MAC_ROMANIAN=3Dy
>> CONFIG_NLS_MAC_TURKISH=3Dy
>> CONFIG_NLS_UTF8=3Dy
>>
>> #
>> # Kernel hacking
>> #
>> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>>
>> #
>> # printk and dmesg options
>> #
>> CONFIG_PRINTK_TIME=3Dy
>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>> # CONFIG_BOOT_PRINTK_DELAY is not set
>> # CONFIG_DYNAMIC_DEBUG is not set
>>
>> #
>> # Compile-time checks and compiler options
>> #
>> # CONFIG_DEBUG_INFO is not set
>> # CONFIG_ENABLE_WARN_DEPRECATED is not set
>> CONFIG_ENABLE_MUST_CHECK=3Dy
>> CONFIG_FRAME_WARN=3D2048
>> # CONFIG_STRIP_ASM_SYMS is not set
>> # CONFIG_READABLE_ASM is not set
>> # CONFIG_UNUSED_SYMBOLS is not set
>> # CONFIG_PAGE_OWNER is not set
>> CONFIG_DEBUG_FS=3Dy
>> CONFIG_HEADERS_CHECK=3Dy
>> # CONFIG_DEBUG_SECTION_MISMATCH is not set
>> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
>> CONFIG_FRAME_POINTER=3Dy
>> # CONFIG_STACK_VALIDATION is not set
>> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>> CONFIG_MAGIC_SYSRQ=3Dy
>> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>> CONFIG_DEBUG_KERNEL=3Dy
>>
>> #
>> # Memory Debugging
>> #
>> CONFIG_PAGE_EXTENSION=3Dy
>> # CONFIG_DEBUG_PAGEALLOC is not set
>> # CONFIG_PAGE_POISONING is not set
>> # CONFIG_DEBUG_OBJECTS is not set
>> # CONFIG_DEBUG_SLAB is not set
>> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>> # CONFIG_DEBUG_KMEMLEAK is not set
>> # CONFIG_DEBUG_STACK_USAGE is not set
>> # CONFIG_DEBUG_VM is not set
>> # CONFIG_DEBUG_VIRTUAL is not set
>> CONFIG_DEBUG_MEMORY_INIT=3Dy
>> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
>> # CONFIG_DEBUG_STACKOVERFLOW is not set
>> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
>> # CONFIG_KMEMCHECK is not set
>> CONFIG_ARCH_HAS_KCOV=3Dy
>> # CONFIG_KCOV is not set
>> # CONFIG_DEBUG_SHIRQ is not set
>>
>> #
>> # Debug Lockups and Hangs
>> #
>> # CONFIG_LOCKUP_DETECTOR is not set
>> # CONFIG_DETECT_HUNG_TASK is not set
>> # CONFIG_WQ_WATCHDOG is not set
>> CONFIG_PANIC_ON_OOPS=3Dy
>> CONFIG_PANIC_ON_OOPS_VALUE=3D1
>> CONFIG_PANIC_TIMEOUT=3D0
>> CONFIG_SCHED_DEBUG=3Dy
>> # CONFIG_SCHED_INFO is not set
>> # CONFIG_SCHEDSTATS is not set
>> # CONFIG_SCHED_STACK_END_CHECK is not set
>> CONFIG_DEBUG_TIMEKEEPING=3Dy
>> # CONFIG_TIMER_STATS is not set
>> CONFIG_DEBUG_PREEMPT=3Dy
>>
>> #
>> # Lock Debugging (spinlocks, mutexes, etc...)
>> #
>> # CONFIG_DEBUG_RT_MUTEXES is not set
>> # CONFIG_DEBUG_SPINLOCK is not set
>> # CONFIG_DEBUG_MUTEXES is not set
>> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
>> # CONFIG_DEBUG_LOCK_ALLOC is not set
>> # CONFIG_PROVE_LOCKING is not set
>> # CONFIG_LOCK_STAT is not set
>> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>> # CONFIG_LOCK_TORTURE_TEST is not set
>> # CONFIG_STACKTRACE is not set
>> # CONFIG_DEBUG_KOBJECT is not set
>> CONFIG_DEBUG_BUGVERBOSE=3Dy
>> # CONFIG_DEBUG_LIST is not set
>> # CONFIG_DEBUG_PI_LIST is not set
>> # CONFIG_DEBUG_SG is not set
>> # CONFIG_DEBUG_NOTIFIERS is not set
>> # CONFIG_DEBUG_CREDENTIALS is not set
>>
>> #
>> # RCU Debugging
>> #
>> # CONFIG_PROVE_RCU is not set
>> # CONFIG_SPARSE_RCU_POINTER is not set
>> # CONFIG_TORTURE_TEST is not set
>> # CONFIG_RCU_PERF_TEST is not set
>> # CONFIG_RCU_TORTURE_TEST is not set
>> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
>> # CONFIG_RCU_TRACE is not set
>> # CONFIG_RCU_EQS_DEBUG is not set
>> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
>> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
>> # CONFIG_FAULT_INJECTION is not set
>> # CONFIG_LATENCYTOP is not set
>> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
>> # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
>> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>> CONFIG_HAVE_FENTRY=3Dy
>> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>> CONFIG_TRACING_SUPPORT=3Dy
>> # CONFIG_FTRACE is not set
>>
>> #
>> # Runtime Testing
>> #
>> # CONFIG_LKDTM is not set
>> # CONFIG_TEST_LIST_SORT is not set
>> # CONFIG_BACKTRACE_SELF_TEST is not set
>> # CONFIG_RBTREE_TEST is not set
>> # CONFIG_ATOMIC64_SELFTEST is not set
>> CONFIG_ASYNC_RAID6_TEST=3Dy
>> CONFIG_TEST_HEXDUMP=3Dy
>> CONFIG_TEST_STRING_HELPERS=3Dy
>> # CONFIG_TEST_KSTRTOX is not set
>> CONFIG_TEST_PRINTF=3Dy
>> CONFIG_TEST_BITMAP=3Dy
>> CONFIG_TEST_UUID=3Dy
>> # CONFIG_TEST_RHASHTABLE is not set
>> CONFIG_TEST_HASH=3Dy
>> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
>> CONFIG_BUILD_DOCSRC=3Dy
>> # CONFIG_DMA_API_DEBUG is not set
>> CONFIG_TEST_FIRMWARE=3Dy
>> # CONFIG_TEST_UDELAY is not set
>> CONFIG_MEMTEST=3Dy
>> # CONFIG_SAMPLES is not set
>> CONFIG_HAVE_ARCH_KGDB=3Dy
>> # CONFIG_KGDB is not set
>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>> # CONFIG_UBSAN is not set
>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>> CONFIG_STRICT_DEVMEM=3Dy
>> # CONFIG_IO_STRICT_DEVMEM is not set
>> CONFIG_X86_VERBOSE_BOOTUP=3Dy
>> CONFIG_EARLY_PRINTK=3Dy
>> # CONFIG_EARLY_PRINTK_DBGP is not set
>> CONFIG_X86_PTDUMP_CORE=3Dy
>> # CONFIG_X86_PTDUMP is not set
>> CONFIG_DEBUG_RODATA_TEST=3Dy
>> CONFIG_DEBUG_WX=3Dy
>> CONFIG_DOUBLEFAULT=3Dy
>> # CONFIG_DEBUG_TLBFLUSH is not set
>> CONFIG_IOMMU_STRESS=3Dy
>> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
>> CONFIG_IO_DELAY_TYPE_0X80=3D0
>> CONFIG_IO_DELAY_TYPE_0XED=3D1
>> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
>> CONFIG_IO_DELAY_TYPE_NONE=3D3
>> # CONFIG_IO_DELAY_0X80 is not set
>> # CONFIG_IO_DELAY_0XED is not set
>> # CONFIG_IO_DELAY_UDELAY is not set
>> CONFIG_IO_DELAY_NONE=3Dy
>> CONFIG_DEFAULT_IO_DELAY_TYPE=3D3
>> # CONFIG_DEBUG_BOOT_PARAMS is not set
>> # CONFIG_CPA_DEBUG is not set
>> CONFIG_OPTIMIZE_INLINING=3Dy
>> # CONFIG_DEBUG_ENTRY is not set
>> # CONFIG_DEBUG_NMI_SELFTEST is not set
>> CONFIG_X86_DEBUG_FPU=3Dy
>> CONFIG_PUNIT_ATOM_DEBUG=3Dy
>>
>> #
>> # Security options
>> #
>> CONFIG_KEYS=3Dy
>> CONFIG_PERSISTENT_KEYRINGS=3Dy
>> # CONFIG_BIG_KEYS is not set
>> CONFIG_ENCRYPTED_KEYS=3Dy
>> CONFIG_KEY_DH_OPERATIONS=3Dy
>> # CONFIG_SECURITY_DMESG_RESTRICT is not set
>> # CONFIG_SECURITY is not set
>> # CONFIG_SECURITYFS is not set
>> CONFIG_DEFAULT_SECURITY_DAC=3Dy
>> CONFIG_DEFAULT_SECURITY=3D""
>> CONFIG_XOR_BLOCKS=3Dy
>> CONFIG_ASYNC_CORE=3Dy
>> CONFIG_ASYNC_MEMCPY=3Dy
>> CONFIG_ASYNC_XOR=3Dy
>> CONFIG_ASYNC_PQ=3Dy
>> CONFIG_ASYNC_RAID6_RECOV=3Dy
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
>> CONFIG_CRYPTO_RSA=3Dy
>> CONFIG_CRYPTO_MANAGER=3Dy
>> CONFIG_CRYPTO_MANAGER2=3Dy
>> # CONFIG_CRYPTO_USER is not set
>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>> CONFIG_CRYPTO_GF128MUL=3Dy
>> CONFIG_CRYPTO_NULL=3Dy
>> CONFIG_CRYPTO_NULL2=3Dy
>> CONFIG_CRYPTO_WORKQUEUE=3Dy
>> CONFIG_CRYPTO_CRYPTD=3Dy
>> CONFIG_CRYPTO_MCRYPTD=3Dy
>> CONFIG_CRYPTO_AUTHENC=3Dy
>> CONFIG_CRYPTO_ABLK_HELPER=3Dy
>> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
>>
>> #
>> # Authenticated Encryption with Associated Data
>> #
>> # CONFIG_CRYPTO_CCM is not set
>> CONFIG_CRYPTO_GCM=3Dy
>> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
>> CONFIG_CRYPTO_SEQIV=3Dy
>> CONFIG_CRYPTO_ECHAINIV=3Dy
>>
>> #
>> # Block modes
>> #
>> CONFIG_CRYPTO_CBC=3Dy
>> CONFIG_CRYPTO_CTR=3Dy
>> CONFIG_CRYPTO_CTS=3Dy
>> CONFIG_CRYPTO_ECB=3Dy
>> CONFIG_CRYPTO_LRW=3Dy
>> CONFIG_CRYPTO_PCBC=3Dy
>> CONFIG_CRYPTO_XTS=3Dy
>> CONFIG_CRYPTO_KEYWRAP=3Dy
>>
>> #
>> # Hash modes
>> #
>> # CONFIG_CRYPTO_CMAC is not set
>> CONFIG_CRYPTO_HMAC=3Dy
>> CONFIG_CRYPTO_XCBC=3Dy
>> CONFIG_CRYPTO_VMAC=3Dy
>>
>> #
>> # Digest
>> #
>> CONFIG_CRYPTO_CRC32C=3Dy
>> # CONFIG_CRYPTO_CRC32C_INTEL is not set
>> # CONFIG_CRYPTO_CRC32 is not set
>> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
>> CONFIG_CRYPTO_CRCT10DIF=3Dy
>> # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
>> CONFIG_CRYPTO_GHASH=3Dy
>> CONFIG_CRYPTO_POLY1305=3Dy
>> # CONFIG_CRYPTO_POLY1305_X86_64 is not set
>> # CONFIG_CRYPTO_MD4 is not set
>> CONFIG_CRYPTO_MD5=3Dy
>> # CONFIG_CRYPTO_MICHAEL_MIC is not set
>> CONFIG_CRYPTO_RMD128=3Dy
>> CONFIG_CRYPTO_RMD160=3Dy
>> CONFIG_CRYPTO_RMD256=3Dy
>> CONFIG_CRYPTO_RMD320=3Dy
>> CONFIG_CRYPTO_SHA1=3Dy
>> # CONFIG_CRYPTO_SHA1_SSSE3 is not set
>> # CONFIG_CRYPTO_SHA256_SSSE3 is not set
>> CONFIG_CRYPTO_SHA512_SSSE3=3Dy
>> CONFIG_CRYPTO_SHA1_MB=3Dy
>> CONFIG_CRYPTO_SHA256=3Dy
>> CONFIG_CRYPTO_SHA512=3Dy
>> CONFIG_CRYPTO_TGR192=3Dy
>> # CONFIG_CRYPTO_WP512 is not set
>> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
>>
>> #
>> # Ciphers
>> #
>> CONFIG_CRYPTO_AES=3Dy
>> CONFIG_CRYPTO_AES_X86_64=3Dy
>> # CONFIG_CRYPTO_AES_NI_INTEL is not set
>> CONFIG_CRYPTO_ANUBIS=3Dy
>> CONFIG_CRYPTO_ARC4=3Dy
>> # CONFIG_CRYPTO_BLOWFISH is not set
>> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
>> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
>> CONFIG_CRYPTO_CAMELLIA=3Dy
>> # CONFIG_CRYPTO_CAMELLIA_X86_64 is not set
>> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
>> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
>> CONFIG_CRYPTO_CAST_COMMON=3Dy
>> CONFIG_CRYPTO_CAST5=3Dy
>> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
>> CONFIG_CRYPTO_CAST6=3Dy
>> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
>> CONFIG_CRYPTO_DES=3Dy
>> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
>> # CONFIG_CRYPTO_FCRYPT is not set
>> CONFIG_CRYPTO_KHAZAD=3Dy
>> CONFIG_CRYPTO_SALSA20=3Dy
>> # CONFIG_CRYPTO_SALSA20_X86_64 is not set
>> CONFIG_CRYPTO_CHACHA20=3Dy
>> CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
>> CONFIG_CRYPTO_SEED=3Dy
>> CONFIG_CRYPTO_SERPENT=3Dy
>> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
>> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
>> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
>> CONFIG_CRYPTO_TEA=3Dy
>> CONFIG_CRYPTO_TWOFISH=3Dy
>> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
>> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
>> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
>> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
>>
>> #
>> # Compression
>> #
>> # CONFIG_CRYPTO_DEFLATE is not set
>> # CONFIG_CRYPTO_LZO is not set
>> CONFIG_CRYPTO_842=3Dy
>> CONFIG_CRYPTO_LZ4=3Dy
>> CONFIG_CRYPTO_LZ4HC=3Dy
>>
>> #
>> # Random Number Generation
>> #
>> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
>> CONFIG_CRYPTO_DRBG_MENU=3Dy
>> CONFIG_CRYPTO_DRBG_HMAC=3Dy
>> # CONFIG_CRYPTO_DRBG_HASH is not set
>> # CONFIG_CRYPTO_DRBG_CTR is not set
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
>> # CONFIG_CRYPTO_DEV_CCP is not set
>> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
>> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
>> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
>> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
>> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
>> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
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
>> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
>> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
>> CONFIG_HAVE_KVM=3Dy
>> CONFIG_VIRTUALIZATION=3Dy
>> # CONFIG_KVM is not set
>> # CONFIG_BINARY_PRINTF is not set
>>
>> #
>> # Library routines
>> #
>> CONFIG_RAID6_PQ=3Dy
>> CONFIG_BITREVERSE=3Dy
>> # CONFIG_HAVE_ARCH_BITREVERSE is not set
>> CONFIG_RATIONAL=3Dy
>> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>> CONFIG_GENERIC_STRNLEN_USER=3Dy
>> CONFIG_GENERIC_NET_UTILS=3Dy
>> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>> CONFIG_GENERIC_PCI_IOMAP=3Dy
>> CONFIG_GENERIC_IOMAP=3Dy
>> CONFIG_GENERIC_IO=3Dy
>> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>> CONFIG_CRC_CCITT=3Dy
>> CONFIG_CRC16=3Dy
>> CONFIG_CRC_T10DIF=3Dy
>> CONFIG_CRC_ITU_T=3Dy
>> CONFIG_CRC32=3Dy
>> # CONFIG_CRC32_SELFTEST is not set
>> # CONFIG_CRC32_SLICEBY8 is not set
>> CONFIG_CRC32_SLICEBY4=3Dy
>> # CONFIG_CRC32_SARWATE is not set
>> # CONFIG_CRC32_BIT is not set
>> CONFIG_CRC7=3Dy
>> CONFIG_LIBCRC32C=3Dy
>> # CONFIG_CRC8 is not set
>> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
>> CONFIG_RANDOM32_SELFTEST=3Dy
>> CONFIG_842_COMPRESS=3Dy
>> CONFIG_842_DECOMPRESS=3Dy
>> CONFIG_ZLIB_INFLATE=3Dy
>> CONFIG_ZLIB_DEFLATE=3Dy
>> CONFIG_LZO_COMPRESS=3Dy
>> CONFIG_LZO_DECOMPRESS=3Dy
>> CONFIG_LZ4_COMPRESS=3Dy
>> CONFIG_LZ4HC_COMPRESS=3Dy
>> CONFIG_LZ4_DECOMPRESS=3Dy
>> CONFIG_XZ_DEC=3Dy
>> CONFIG_XZ_DEC_X86=3Dy
>> CONFIG_XZ_DEC_POWERPC=3Dy
>> CONFIG_XZ_DEC_IA64=3Dy
>> CONFIG_XZ_DEC_ARM=3Dy
>> CONFIG_XZ_DEC_ARMTHUMB=3Dy
>> CONFIG_XZ_DEC_SPARC=3Dy
>> CONFIG_XZ_DEC_BCJ=3Dy
>> CONFIG_XZ_DEC_TEST=3Dy
>> CONFIG_DECOMPRESS_GZIP=3Dy
>> CONFIG_DECOMPRESS_XZ=3Dy
>> CONFIG_DECOMPRESS_LZO=3Dy
>> CONFIG_DECOMPRESS_LZ4=3Dy
>> CONFIG_GENERIC_ALLOCATOR=3Dy
>> CONFIG_RADIX_TREE_MULTIORDER=3Dy
>> CONFIG_ASSOCIATIVE_ARRAY=3Dy
>> CONFIG_HAS_IOMEM=3Dy
>> CONFIG_HAS_IOPORT_MAP=3Dy
>> CONFIG_HAS_DMA=3Dy
>> CONFIG_DQL=3Dy
>> CONFIG_GLOB=3Dy
>> # CONFIG_GLOB_SELFTEST is not set
>> CONFIG_NLATTR=3Dy
>> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
>> CONFIG_CLZ_TAB=3Dy
>> # CONFIG_CORDIC is not set
>> # CONFIG_DDR is not set
>> # CONFIG_IRQ_POLL is not set
>> CONFIG_MPILIB=3Dy
>> CONFIG_OID_REGISTRY=3Dy
>> CONFIG_FONT_SUPPORT=3Dy
>> # CONFIG_FONTS is not set
>> CONFIG_FONT_8x8=3Dy
>> CONFIG_FONT_8x16=3Dy
>> # CONFIG_SG_SPLIT is not set
>> CONFIG_SG_POOL=3Dy
>> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
>> CONFIG_ARCH_HAS_PMEM_API=3Dy
>> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy

--===============3584356779745666276==--

