Content-Type: multipart/mixed; boundary="===============4765418220212121248=="
MIME-Version: 1.0
From: Darrick J. Wong <darrick.wong@oracle.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 63db7c815b: XFS: Assertion failed: spin_is_locked(&bp->b_lock), file: fs/xfs/xfs_buf.c, line: 120
Date: Tue, 06 Jun 2017 15:01:52 -0700
Message-ID: <20170606220152.GG5196@birch.djwong.org>
In-Reply-To: <20170606214026.GA60185@bfoster.bfoster>
List-Id: <oe-lkp.lists.linux.dev>

--===============4765418220212121248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2017 at 05:40:27PM -0400, Brian Foster wrote:
> cc linux-xfs
> =

> On Wed, Jun 07, 2017 at 02:06:07AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > commit 63db7c815bc0997c29e484d2409684fdd9fcd93b
> > Author:     Brian Foster <bfoster@redhat.com>
> > AuthorDate: Wed May 31 08:22:52 2017 -0700
> > Commit:     Darrick J. Wong <darrick.wong@oracle.com>
> > CommitDate: Wed May 31 08:22:52 2017 -0700
> > =

> >     xfs: use ->b_state to fix buffer I/O accounting release race
> >     =

> >     We've had user reports of unmount hangs in xfs_wait_buftarg() that
> >     analysis shows is due to btp->bt_io_count =3D=3D -1. bt_io_count
> >     represents the count of in-flight asynchronous buffers and thus
> >     should always be >=3D 0. xfs_wait_buftarg() waits for this value to
> >     stabilize to zero in order to ensure that all untracked (with
> >     respect to the lru) buffers have completed I/O processing before
> >     unmount proceeds to tear down in-core data structures.
> >     =

> >     The value of -1 implies an I/O accounting decrement race. Indeed,
> >     the fact that xfs_buf_ioacct_dec() is called from xfs_buf_rele()
> >     (where the buffer lock is no longer held) means that bp->b_flags can
> >     be updated from an unsafe context. While a user-level reproducer is
> >     currently not available, some intrusive hacks to run racing buffer
> >     lookups/ioacct/releases from multiple threads was used to
> >     successfully manufacture this problem.
> >     =

> >     Existing callers do not expect to acquire the buffer lock from
> >     xfs_buf_rele(). Therefore, we can not safely update ->b_flags from
> >     this context. It turns out that we already have separate buffer
> >     state bits and associated serialization for dealing with buffer LRU
> >     state in the form of ->b_state and ->b_lock. Therefore, replace the
> >     _XBF_IN_FLIGHT flag with a ->b_state variant, update the I/O
> >     accounting wrappers appropriately and make sure they are used with
> >     the correct locking. This ensures that buffer in-flight state can be
> >     modified at buffer release time without racing with modifications
> >     from a buffer lock holder.
> >     =

> >     Fixes: 9c7504aa72b6 ("xfs: track and serialize in-flight async buff=
ers against unmount")
> >     Cc: <stable@vger.kernel.org> # v4.8+
> >     Signed-off-by: Brian Foster <bfoster@redhat.com>
> >     Reviewed-by: Nikolay Borisov <nborisov@suse.com>
> >     Tested-by: Libor Pechacek <lpechacek@suse.com>
> >     Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> >     Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > =

> > a54fba8f5a  xfs: Move handling of missing page into one place in xfs_fi=
nd_get_desired_pgoff()
> > 63db7c815b  xfs: use ->b_state to fix buffer I/O accounting release race
> > ba7b2387ad  Merge branch 'for-4.12-fixes' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/tj/cgroup
> > 19ce14199a  Add linux-next specific files for 20170606
> > +------------------------------------------+------------+------------+-=
-----------+---------------+
> > |                                          | a54fba8f5a | 63db7c815b | =
ba7b2387ad | next-20170606 |
> > +------------------------------------------+------------+------------+-=
-----------+---------------+
> > | boot_successes                           | 37         | 4          | =
8          | 10            |
> > | boot_failures                            | 0          | 11         | =
11         | 11            |
> > | Assertion_failed                         | 0          | 11         | =
11         | 11            |
> > | kernel_BUG_at_fs/xfs/xfs_message.c       | 0          | 11         | =
11         | 11            |
> > | invalid_opcode:#[##]                     | 0          | 11         | =
11         | 11            |
> > | EIP:assfail                              | 0          | 11         | =
11         | 11            |
> > | Kernel_panic-not_syncing:Fatal_exception | 0          | 11         | =
11         | 11            |
> > +------------------------------------------+------------+------------+-=
-----------+---------------+
> > =

> > [    7.938397] rodata_test: all tests were successful
> > [    8.869407] qnx6: unable to read the first superblock
> > [    8.934965] qnx6: unable to read the first superblock
> > [    8.952962] qnx6: unable to read the first superblock
> > [    8.955407] qnx6: unable to read the first superblock
> > [    9.006193] XFS: Assertion failed: spin_is_locked(&bp->b_lock), file=
: fs/xfs/xfs_buf.c, line: 120
> > [    9.006207] ------------[ cut here ]------------
> =

> AFAICT, this appears to be due to spin_is_locked() being hardcoded to
> return 0 on !CONFIG_SMP kernels. XFS uses spin_is_locked() in assert
> checks in a few different spots. This patch adds one to the buffer
> release path, which happens to be triggered on mount (perhaps due to the
> release/re-read of the superblock buffer).
> =

> Without this assert, a similar pre-existing assert triggers on a simple
> mount/umount cycle of an XFS filesystem, so I'm a bit curious why this
> one triggers a test failure where one didn't trigger before. Perhaps
> this test is attempting to mount a non-XFS device and that's where we've
> invoked the buffer release path..?
> =

> Anyways, I wouldn't necessarily consider this purely a problem with the
> patch above. The problem is basically a spurious assert failure. It will
> never occur on production (!CONFIG_XFS_WARN && !CONFIG_XFS_DEBUG)
> kernels or CONFIG_SMP kernels and otherwise shouldn't cause any
> functional problems.
> =

> As far as fixing this goes, the simplest approach seems to be to include
> an IS_ENABLED(CONFIG_SMP) check in the few asserts that use
> spin_is_locked(). Before I send a patch, do XFS folks have any other
> opinions or ideas?

Ugh, why didn't I catch this on the UP build...

...oh, because CONFIG_XFS_DEBUG=3Dn.  Sorry about that. :(

What you propose sounds fine to me.  I guess we don't have very many
developers with uniprocessor machines nowadays.

--D

> =

> Brian
> =

> > [    9.006208] kernel BUG at fs/xfs/xfs_message.c:113!
> > [    9.006210] invalid opcode: 0000 [#1] PREEMPT
> > [    9.006211] Modules linked in:
> > [    9.006215] CPU: 0 PID: 398 Comm: mount Not tainted 4.12.0-rc1-00012=
-g63db7c8 #1
> > [    9.006216] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.9.3-20161025_171302-gandalf 04/01/2014
> > [    9.006218] task: cc445a40 task.stack: cc596000
> > [    9.006223] EIP: assfail+0x17/0x19
> > [    9.006225] EFLAGS: 00010282 CPU: 0
> > [    9.006226] EAX: ffffffea EBX: cc46b3e8 ECX: c7a68e9f EDX: c7aa464a
> > [    9.006227] ESI: cc46b3c0 EDI: cc46b3e8 EBP: cc597e40 ESP: cc597e2c
> > [    9.006229]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> > [    9.006230] CR0: 80050033 CR2: b776c000 CR3: 0c4aa820 CR4: 00140630
> > [    9.006234] Call Trace:
> > [    9.006238]  xfs_buf_rele+0xdd/0x63f
> > [    9.006240]  ? xfs_buf_unlock+0x71/0xc3
> > [    9.006243]  xfs_readsb+0x1b8/0x1c2
> > [    9.006246]  xfs_fs_fill_super+0x21f/0x435
> > [    9.006250]  mount_bdev+0x137/0x182
> > [    9.006253]  xfs_fs_mount+0x15/0x17
> > [    9.006255]  ? xfs_finish_flags+0x114/0x114
> > [    9.006257]  mount_fs+0x17/0xf8
> > [    9.006260]  vfs_kern_mount+0x51/0x13c
> > [    9.006263]  do_mount+0x857/0xad1
> > [    9.006266]  SyS_mount+0xac/0xd0
> > [    9.006269]  do_int80_syscall_32+0x6c/0x102
> > [    9.006274]  entry_INT80_32+0x31/0x31
> > [    9.006275] EIP: 0x47f46fee
> > [    9.006276] EFLAGS: 00000282 CPU: 0
> > [    9.006277] EAX: ffffffda EBX: bfe3fe9d ECX: bfe3fea6 EDX: 080d36d0
> > [    9.006279] ESI: 00008010 EDI: 00000000 EBP: 00000000 ESP: bfe3f7a0
> > [    9.006280]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
> > [    9.006282] Code: 00 00 00 6a 01 b8 10 3f be c7 e8 89 bb e3 ff 83 c4=
 1c c9 c3 55 89 e5 e8 6b 38 db ff 51 52 50 68 ac 46 aa c7 6a 00 e8 85 fc ff=
 ff <0f> 0b 55 89 e5 e8 52 38 db ff b9 01 00 00 00 6a 01 52 ba 9b 61
> > [    9.006312] EIP: assfail+0x17/0x19 SS:ESP: 0068:cc597e2c
> > [    9.006314] ---[ end trace b5abbbc5416845ea ]---
> > [    9.006315] Kernel panic - not syncing: Fatal exception
> > =

> >                                                           # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> > git bisect start 3c2993b8c6143d8a5793746a54eba8f86f95240f v4.11 --
> > git bisect good 29250d301b0c75ef142b51eebee6b7403cc79624  # 22:42  G   =
  11     0    0   0  Merge tag 'trace-v4.12-3' of git://git.kernel.org/pub/=
scm/linux/kernel/git/rostedt/linux-trace
> > git bisect good 334a023ee50997b45ffb8fbcc8bc875519040aac  # 22:56  G   =
  11     0    0   0  Clean up x86 unsafe_get/put_user() type handling
> > git bisect good b0f5a8f32e8bbdaae1abb8abe2d3cbafaba57e08  # 23:07  G   =
  11     0    0   0  kthread: fix boot hang (regression) on MIPS/OpenRISC
> > git bisect good 6f37fa4364a1099b59f73d1a71538895fd2ef975  # 23:18  G   =
  11     0    0   0  Merge tag 'md/4.12-rc4' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/shli/md
> > git bisect  bad cc54874055c007cd599138a394d1f039e4e0764b  # 23:31  B   =
   0     8   20   0  Merge tag 'for-linus-20170602' of git://git.infradead.=
org/linux-mtd
> > git bisect  bad e6e6d074369c839e84071c3b056adf20ead8da6e  # 23:47  B   =
   0    11   23   0  Merge tag 'xfs-4.12-fixes-3' of git://git.kernel.org/p=
ub/scm/fs/xfs/xfs-linux
> > git bisect good 65d03328aace31043be98f807f6e20332cdb19c8  # 00:04  G   =
  11     0    0   0  Merge tag 'ceph-for-4.12-rc4' of git://github.com/ceph=
/ceph-client
> > git bisect good b939c51445f0542e80a8f910014c418d04b5de6e  # 00:24  G   =
  10     0    0   0  Merge tag 'arm64-fixes' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/arm64/linux
> > git bisect  bad 63db7c815bc0997c29e484d2409684fdd9fcd93b  # 00:37  B   =
   0    11   23   0  xfs: use ->b_state to fix buffer I/O accounting releas=
e race
> > # first bad commit: [63db7c815bc0997c29e484d2409684fdd9fcd93b] xfs: use=
 ->b_state to fix buffer I/O accounting release race
> > git bisect good a54fba8f5a0dc36161cacdf2aa90f007f702ec1a  # 00:51  G   =
  30     0    0   0  xfs: Move handling of missing page into one place in x=
fs_find_get_desired_pgoff()
> > # extra tests with CONFIG_DEBUG_INFO_REDUCED
> > git bisect  bad 63db7c815bc0997c29e484d2409684fdd9fcd93b  # 01:01  B   =
   0    11   23   0  xfs: use ->b_state to fix buffer I/O accounting releas=
e race
> > # extra tests on HEAD of linux-devel/devel-spot-201706062120
> > git bisect  bad 231575479432f3449f51bb810d5b8b116f81557b  # 01:01  B   =
   0    13   28   0  0day head guard for 'devel-spot-201706062120'
> > # extra tests on tree/branch linus/master
> > git bisect  bad ba7b2387ad239a519041f2a2d35a1902bdd03dfb  # 01:17  B   =
   0     3   15   0  Merge branch 'for-4.12-fixes' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tj/cgroup
> > # extra tests with first bad commit reverted
> > git bisect good a22863108b531d27f722d99567c102340e7a4153  # 01:35  G   =
  11     0    0   0  Revert "xfs: use ->b_state to fix buffer I/O accountin=
g release race"
> > # extra tests on tree/branch linux-next/master
> > git bisect  bad 19ce14199afdacb1621ccc681d1ba5938efad8b3  # 02:05  B   =
   0    11   24   0  Add linux-next specific files for 20170606
> > =

> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology =
Center
> > https://lists.01.org/pipermail/lkp                          Intel Corpo=
ration
> =

> =

> > #!/bin/bash
> > =

> > kernel=3D$1
> > initrd=3Dyocto-trinity-i386.cgz
> > =

> > wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw=
/master/initrd/$initrd
> > =

> > kvm=3D(
> > 	qemu-system-x86_64
> > 	-enable-kvm
> > 	-cpu Haswell,+smep,+smap
> > 	-kernel $kernel
> > 	-initrd $initrd
> > 	-m 256
> > 	-smp 1
> > 	-device e1000,netdev=3Dnet0
> > 	-netdev user,id=3Dnet0
> > 	-boot order=3Dnc
> > 	-no-reboot
> > 	-watchdog i6300esb
> > 	-watchdog-action debug
> > 	-rtc base=3Dlocaltime
> > 	-serial stdio
> > 	-display none
> > 	-monitor null
> > )
> > =

> > append=3D(
> > 	root=3D/dev/ram0
> > 	hung_task_panic=3D1
> > 	debug
> > 	apic=3Ddebug
> > 	sysrq_always_enabled
> > 	rcupdate.rcu_cpu_stall_timeout=3D100
> > 	net.ifnames=3D0
> > 	printk.devkmsg=3Don
> > 	panic=3D-1
> > 	softlockup_panic=3D1
> > 	nmi_watchdog=3Dpanic
> > 	oops=3Dpanic
> > 	load_ramdisk=3D2
> > 	prompt_ramdisk=3D0
> > 	drbd.minor_count=3D8
> > 	systemd.log_level=3Derr
> > 	ignore_loglevel
> > 	earlyprintk=3DttyS0,115200
> > 	console=3DttyS0,115200
> > 	console=3Dtty0
> > 	vga=3Dnormal
> > 	rw
> > 	drbd.minor_count=3D8
> > )
> > =

> > "${kvm[@]}" -append "${append[*]}"
> =

> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/i386 4.12.0-rc1 Kernel Configuration
> > #
> > # CONFIG_64BIT is not set
> > CONFIG_X86_32=3Dy
> > CONFIG_X86=3Dy
> > CONFIG_INSTRUCTION_DECODER=3Dy
> > CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> > CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> > CONFIG_LOCKDEP_SUPPORT=3Dy
> > CONFIG_STACKTRACE_SUPPORT=3Dy
> > CONFIG_MMU=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> > CONFIG_NEED_DMA_MAP_STATE=3Dy
> > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > CONFIG_GENERIC_ISA_DMA=3Dy
> > CONFIG_GENERIC_BUG=3Dy
> > CONFIG_GENERIC_HWEIGHT=3Dy
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_PGTABLE_LEVELS=3D3
> > CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> > CONFIG_CONSTRUCTORS=3Dy
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> > CONFIG_THREAD_INFO_IN_TASK=3Dy
> > =

> > #
> > # General setup
> > #
> > CONFIG_BROKEN_ON_SMP=3Dy
> > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > CONFIG_CROSS_COMPILE=3D""
> > # CONFIG_COMPILE_TEST is not set
> > CONFIG_LOCALVERSION=3D""
> > CONFIG_LOCALVERSION_AUTO=3Dy
> > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > CONFIG_HAVE_KERNEL_XZ=3Dy
> > CONFIG_HAVE_KERNEL_LZO=3Dy
> > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > # CONFIG_KERNEL_LZMA is not set
> > # CONFIG_KERNEL_XZ is not set
> > # CONFIG_KERNEL_LZO is not set
> > CONFIG_KERNEL_LZ4=3Dy
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > CONFIG_SWAP=3Dy
> > # CONFIG_SYSVIPC is not set
> > # CONFIG_POSIX_MQUEUE is not set
> > CONFIG_CROSS_MEMORY_ATTACH=3Dy
> > CONFIG_FHANDLE=3Dy
> > # CONFIG_USELIB is not set
> > # CONFIG_AUDIT is not set
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > =

> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > CONFIG_GENERIC_IRQ_CHIP=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > =

> > #
> > # Timers subsystem
> > #
> > CONFIG_TICK_ONESHOT=3Dy
> > CONFIG_NO_HZ_COMMON=3Dy
> > # CONFIG_HZ_PERIODIC is not set
> > CONFIG_NO_HZ_IDLE=3Dy
> > CONFIG_NO_HZ=3Dy
> > CONFIG_HIGH_RES_TIMERS=3Dy
> > =

> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_TICK_CPU_ACCOUNTING=3Dy
> > CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_BSD_PROCESS_ACCT=3Dy
> > # CONFIG_BSD_PROCESS_ACCT_V3 is not set
> > # CONFIG_TASKSTATS is not set
> > =

> > #
> > # RCU Subsystem
> > #
> > CONFIG_PREEMPT_RCU=3Dy
> > # CONFIG_RCU_EXPERT is not set
> > CONFIG_SRCU=3Dy
> > CONFIG_TREE_SRCU=3Dy
> > CONFIG_TASKS_RCU=3Dy
> > CONFIG_RCU_STALL_COMMON=3Dy
> > CONFIG_RCU_NEED_SEGCBLIST=3Dy
> > # CONFIG_TREE_RCU_TRACE is not set
> > CONFIG_BUILD_BIN2C=3Dy
> > CONFIG_IKCONFIG=3Dy
> > CONFIG_IKCONFIG_PROC=3Dy
> > CONFIG_LOG_BUF_SHIFT=3D17
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > CONFIG_CGROUPS=3Dy
> > # CONFIG_MEMCG is not set
> > # CONFIG_BLK_CGROUP is not set
> > # CONFIG_CGROUP_SCHED is not set
> > # CONFIG_CGROUP_PIDS is not set
> > # CONFIG_CGROUP_RDMA is not set
> > # CONFIG_CGROUP_FREEZER is not set
> > # CONFIG_CGROUP_HUGETLB is not set
> > # CONFIG_CPUSETS is not set
> > # CONFIG_CGROUP_DEVICE is not set
> > # CONFIG_CGROUP_CPUACCT is not set
> > # CONFIG_CGROUP_PERF is not set
> > # CONFIG_CGROUP_BPF is not set
> > # CONFIG_CGROUP_DEBUG is not set
> > # CONFIG_SOCK_CGROUP_DATA is not set
> > # CONFIG_CHECKPOINT_RESTORE is not set
> > CONFIG_NAMESPACES=3Dy
> > CONFIG_UTS_NS=3Dy
> > # CONFIG_USER_NS is not set
> > # CONFIG_PID_NS is not set
> > CONFIG_NET_NS=3Dy
> > # CONFIG_SCHED_AUTOGROUP is not set
> > # CONFIG_SYSFS_DEPRECATED is not set
> > CONFIG_RELAY=3Dy
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > # CONFIG_RD_BZIP2 is not set
> > CONFIG_RD_LZMA=3Dy
> > # CONFIG_RD_XZ is not set
> > # CONFIG_RD_LZO is not set
> > # CONFIG_RD_LZ4 is not set
> > CONFIG_INITRAMFS_COMPRESSION=3D".gz"
> > # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> > CONFIG_SYSCTL=3Dy
> > CONFIG_ANON_INODES=3Dy
> > CONFIG_HAVE_UID16=3Dy
> > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > CONFIG_BPF=3Dy
> > # CONFIG_EXPERT is not set
> > CONFIG_UID16=3Dy
> > CONFIG_MULTIUSER=3Dy
> > CONFIG_SGETMASK_SYSCALL=3Dy
> > CONFIG_SYSFS_SYSCALL=3Dy
> > # CONFIG_SYSCTL_SYSCALL is not set
> > CONFIG_POSIX_TIMERS=3Dy
> > CONFIG_KALLSYMS=3Dy
> > # CONFIG_KALLSYMS_ALL is not set
> > # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > CONFIG_PRINTK=3Dy
> > CONFIG_PRINTK_NMI=3Dy
> > CONFIG_BUG=3Dy
> > CONFIG_ELF_CORE=3Dy
> > CONFIG_PCSPKR_PLATFORM=3Dy
> > CONFIG_BASE_FULL=3Dy
> > CONFIG_FUTEX=3Dy
> > CONFIG_EPOLL=3Dy
> > CONFIG_SIGNALFD=3Dy
> > CONFIG_TIMERFD=3Dy
> > CONFIG_EVENTFD=3Dy
> > CONFIG_BPF_SYSCALL=3Dy
> > CONFIG_SHMEM=3Dy
> > CONFIG_AIO=3Dy
> > CONFIG_ADVISE_SYSCALLS=3Dy
> > # CONFIG_USERFAULTFD is not set
> > CONFIG_PCI_QUIRKS=3Dy
> > CONFIG_MEMBARRIER=3Dy
> > # CONFIG_EMBEDDED is not set
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> > # CONFIG_PC104 is not set
> > =

> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > CONFIG_VM_EVENT_COUNTERS=3Dy
> > CONFIG_SLUB_DEBUG=3Dy
> > CONFIG_COMPAT_BRK=3Dy
> > # CONFIG_SLAB is not set
> > CONFIG_SLUB=3Dy
> > CONFIG_SLAB_FREELIST_RANDOM=3Dy
> > # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> > CONFIG_PROFILING=3Dy
> > CONFIG_TRACEPOINTS=3Dy
> > # CONFIG_OPROFILE is not set
> > CONFIG_HAVE_OPROFILE=3Dy
> > CONFIG_OPROFILE_NMI_TIMER=3Dy
> > # CONFIG_KPROBES is not set
> > # CONFIG_JUMP_LABEL is not set
> > # CONFIG_UPROBES is not set
> > # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > CONFIG_HAVE_KPROBES=3Dy
> > CONFIG_HAVE_KRETPROBES=3Dy
> > CONFIG_HAVE_OPTPROBES=3Dy
> > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > CONFIG_HAVE_NMI=3Dy
> > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_CLK=3Dy
> > CONFIG_HAVE_DMA_API_DEBUG=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_PERF_REGS=3Dy
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > CONFIG_SECCOMP_FILTER=3Dy
> > CONFIG_HAVE_GCC_PLUGINS=3Dy
> > # CONFIG_GCC_PLUGINS is not set
> > CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> > CONFIG_CC_STACKPROTECTOR=3Dy
> > # CONFIG_CC_STACKPROTECTOR_NONE is not set
> > CONFIG_CC_STACKPROTECTOR_REGULAR=3Dy
> > # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> > CONFIG_MODULES_USE_ELF_REL=3Dy
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> > CONFIG_HAVE_EXIT_THREAD=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS=3D8
> > CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> > # CONFIG_HAVE_ARCH_HASH is not set
> > # CONFIG_ISA_BUS_API is not set
> > CONFIG_CLONE_BACKWARDS=3Dy
> > CONFIG_OLD_SIGSUSPEND3=3Dy
> > CONFIG_OLD_SIGACTION=3Dy
> > # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> > # CONFIG_HAVE_ARCH_VMAP_STACK is not set
> > # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> > # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> > CONFIG_STRICT_KERNEL_RWX=3Dy
> > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> > CONFIG_STRICT_MODULE_RWX=3Dy
> > =

> > #
> > # GCOV-based kernel profiling
> > #
> > CONFIG_GCOV_KERNEL=3Dy
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > # CONFIG_GCOV_PROFILE_ALL is not set
> > # CONFIG_GCOV_FORMAT_AUTODETECT is not set
> > CONFIG_GCOV_FORMAT_3_4=3Dy
> > # CONFIG_GCOV_FORMAT_4_7 is not set
> > CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> > CONFIG_SLABINFO=3Dy
> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D0
> > CONFIG_MODULES=3Dy
> > CONFIG_MODULE_FORCE_LOAD=3Dy
> > # CONFIG_MODULE_UNLOAD is not set
> > # CONFIG_MODVERSIONS is not set
> > # CONFIG_MODULE_SRCVERSION_ALL is not set
> > # CONFIG_MODULE_SIG is not set
> > # CONFIG_MODULE_COMPRESS is not set
> > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > CONFIG_BLOCK=3Dy
> > CONFIG_LBDAF=3Dy
> > CONFIG_BLK_SCSI_REQUEST=3Dy
> > CONFIG_BLK_DEV_BSG=3Dy
> > # CONFIG_BLK_DEV_BSGLIB is not set
> > # CONFIG_BLK_DEV_INTEGRITY is not set
> > CONFIG_BLK_DEV_ZONED=3Dy
> > CONFIG_BLK_CMDLINE_PARSER=3Dy
> > # CONFIG_BLK_WBT is not set
> > # CONFIG_BLK_DEBUG_FS is not set
> > CONFIG_BLK_SED_OPAL=3Dy
> > =

> > #
> > # Partition Types
> > #
> > # CONFIG_PARTITION_ADVANCED is not set
> > CONFIG_AMIGA_PARTITION=3Dy
> > CONFIG_MSDOS_PARTITION=3Dy
> > CONFIG_EFI_PARTITION=3Dy
> > CONFIG_BLK_MQ_PCI=3Dy
> > CONFIG_BLK_MQ_VIRTIO=3Dy
> > =

> > #
> > # IO Schedulers
> > #
> > CONFIG_IOSCHED_NOOP=3Dy
> > CONFIG_IOSCHED_DEADLINE=3Dm
> > CONFIG_IOSCHED_CFQ=3Dy
> > CONFIG_DEFAULT_CFQ=3Dy
> > # CONFIG_DEFAULT_NOOP is not set
> > CONFIG_DEFAULT_IOSCHED=3D"cfq"
> > CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> > CONFIG_MQ_IOSCHED_KYBER=3Dm
> > CONFIG_IOSCHED_BFQ=3Dy
> > CONFIG_ASN1=3Dy
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > # CONFIG_FREEZER is not set
> > =

> > #
> > # Processor type and features
> > #
> > CONFIG_ZONE_DMA=3Dy
> > # CONFIG_SMP is not set
> > CONFIG_X86_FEATURE_NAMES=3Dy
> > CONFIG_X86_FAST_FEATURE_TESTS=3Dy
> > CONFIG_GOLDFISH=3Dy
> > # CONFIG_INTEL_RDT_A is not set
> > CONFIG_X86_EXTENDED_PLATFORM=3Dy
> > # CONFIG_X86_GOLDFISH is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > CONFIG_IOSF_MBI=3Dm
> > # CONFIG_IOSF_MBI_DEBUG is not set
> > CONFIG_X86_RDC321X=3Dy
> > CONFIG_X86_32_IRIS=3Dm
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > CONFIG_HYPERVISOR_GUEST=3Dy
> > CONFIG_PARAVIRT=3Dy
> > # CONFIG_PARAVIRT_DEBUG is not set
> > CONFIG_KVM_GUEST=3Dy
> > CONFIG_KVM_DEBUG_FS=3Dy
> > CONFIG_LGUEST_GUEST=3Dy
> > CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> > CONFIG_PARAVIRT_CLOCK=3Dy
> > CONFIG_NO_BOOTMEM=3Dy
> > # CONFIG_M486 is not set
> > # CONFIG_M586 is not set
> > # CONFIG_M586TSC is not set
> > # CONFIG_M586MMX is not set
> > CONFIG_M686=3Dy
> > # CONFIG_MPENTIUMII is not set
> > # CONFIG_MPENTIUMIII is not set
> > # CONFIG_MPENTIUMM is not set
> > # CONFIG_MPENTIUM4 is not set
> > # CONFIG_MK6 is not set
> > # CONFIG_MK7 is not set
> > # CONFIG_MK8 is not set
> > # CONFIG_MCRUSOE is not set
> > # CONFIG_MEFFICEON is not set
> > # CONFIG_MWINCHIPC6 is not set
> > # CONFIG_MWINCHIP3D is not set
> > # CONFIG_MELAN is not set
> > # CONFIG_MGEODEGX1 is not set
> > # CONFIG_MGEODE_LX is not set
> > # CONFIG_MCYRIXIII is not set
> > # CONFIG_MVIAC3_2 is not set
> > # CONFIG_MVIAC7 is not set
> > # CONFIG_MCORE2 is not set
> > # CONFIG_MATOM is not set
> > # CONFIG_X86_GENERIC is not set
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D5
> > CONFIG_X86_L1_CACHE_SHIFT=3D5
> > # CONFIG_X86_PPRO_FENCE is not set
> > CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_CMPXCHG64=3Dy
> > CONFIG_X86_CMOV=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> > CONFIG_X86_DEBUGCTLMSR=3Dy
> > CONFIG_CPU_SUP_INTEL=3Dy
> > CONFIG_CPU_SUP_AMD=3Dy
> > CONFIG_CPU_SUP_CENTAUR=3Dy
> > CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> > CONFIG_HPET_TIMER=3Dy
> > CONFIG_DMI=3Dy
> > CONFIG_SWIOTLB=3Dy
> > CONFIG_IOMMU_HELPER=3Dy
> > CONFIG_NR_CPUS=3D1
> > # CONFIG_PREEMPT_NONE is not set
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > CONFIG_PREEMPT=3Dy
> > CONFIG_PREEMPT_COUNT=3Dy
> > # CONFIG_X86_UP_APIC is not set
> > # CONFIG_X86_MCE is not set
> > =

> > #
> > # Performance monitoring
> > #
> > # CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
> > CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> > # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> > # CONFIG_PERF_EVENTS_AMD_POWER is not set
> > # CONFIG_X86_LEGACY_VM86 is not set
> > # CONFIG_VM86 is not set
> > CONFIG_X86_16BIT=3Dy
> > CONFIG_X86_ESPFIX32=3Dy
> > CONFIG_TOSHIBA=3Dy
> > CONFIG_I8K=3Dm
> > CONFIG_X86_REBOOTFIXUPS=3Dy
> > CONFIG_MICROCODE=3Dy
> > # CONFIG_MICROCODE_INTEL is not set
> > CONFIG_MICROCODE_AMD=3Dy
> > CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> > # CONFIG_X86_MSR is not set
> > # CONFIG_X86_CPUID is not set
> > # CONFIG_NOHIGHMEM is not set
> > # CONFIG_HIGHMEM4G is not set
> > CONFIG_HIGHMEM64G=3Dy
> > CONFIG_PAGE_OFFSET=3D0xC0000000
> > CONFIG_HIGHMEM=3Dy
> > CONFIG_X86_PAE=3Dy
> > CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> > CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> > CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_ILLEGAL_POINTER_VALUE=3D0
> > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_FLATMEM_MANUAL=3Dy
> > # CONFIG_SPARSEMEM_MANUAL is not set
> > CONFIG_FLATMEM=3Dy
> > CONFIG_FLAT_NODE_MEM_MAP=3Dy
> > CONFIG_SPARSEMEM_STATIC=3Dy
> > CONFIG_HAVE_MEMBLOCK=3Dy
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> > CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> > CONFIG_MEMORY_ISOLATION=3Dy
> > # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> > CONFIG_COMPACTION=3Dy
> > CONFIG_MIGRATION=3Dy
> > CONFIG_PHYS_ADDR_T_64BIT=3Dy
> > # CONFIG_BOUNCE is not set
> > CONFIG_VIRT_TO_BUS=3Dy
> > CONFIG_MMU_NOTIFIER=3Dy
> > CONFIG_KSM=3Dy
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> > # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> > CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> > CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> > CONFIG_NEED_PER_CPU_KM=3Dy
> > CONFIG_CLEANCACHE=3Dy
> > # CONFIG_FRONTSWAP is not set
> > CONFIG_CMA=3Dy
> > # CONFIG_CMA_DEBUG is not set
> > CONFIG_CMA_DEBUGFS=3Dy
> > CONFIG_CMA_AREAS=3D7
> > CONFIG_ZPOOL=3Dy
> > # CONFIG_ZBUD is not set
> > CONFIG_Z3FOLD=3Dy
> > # CONFIG_ZSMALLOC is not set
> > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> > # CONFIG_IDLE_PAGE_TRACKING is not set
> > CONFIG_FRAME_VECTOR=3Dy
> > CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> > CONFIG_X86_PMEM_LEGACY=3Dy
> > # CONFIG_HIGHPTE is not set
> > CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> > CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
> > CONFIG_X86_RESERVE_LOW=3D64
> > CONFIG_MATH_EMULATION=3Dy
> > CONFIG_MTRR=3Dy
> > CONFIG_MTRR_SANITIZER=3Dy
> > CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> > CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> > CONFIG_X86_PAT=3Dy
> > CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> > CONFIG_ARCH_RANDOM=3Dy
> > CONFIG_X86_SMAP=3Dy
> > CONFIG_X86_INTEL_MPX=3Dy
> > # CONFIG_EFI is not set
> > CONFIG_SECCOMP=3Dy
> > # CONFIG_HZ_100 is not set
> > # CONFIG_HZ_250 is not set
> > # CONFIG_HZ_300 is not set
> > CONFIG_HZ_1000=3Dy
> > CONFIG_HZ=3D1000
> > CONFIG_SCHED_HRTICK=3Dy
> > # CONFIG_KEXEC is not set
> > # CONFIG_CRASH_DUMP is not set
> > CONFIG_PHYSICAL_START=3D0x1000000
> > CONFIG_RELOCATABLE=3Dy
> > CONFIG_RANDOMIZE_BASE=3Dy
> > CONFIG_X86_NEED_RELOCS=3Dy
> > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > # CONFIG_COMPAT_VDSO is not set
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_MODIFY_LDT_SYSCALL=3Dy
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > =

> > #
> > # Power management and ACPI options
> > #
> > # CONFIG_SUSPEND is not set
> > # CONFIG_HIBERNATION is not set
> > CONFIG_PM=3Dy
> > # CONFIG_PM_DEBUG is not set
> > CONFIG_PM_CLK=3Dy
> > # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > # CONFIG_ACPI_DEBUGGER is not set
> > # CONFIG_ACPI_PROCFS_POWER is not set
> > CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > CONFIG_ACPI_AC=3Dy
> > CONFIG_ACPI_BATTERY=3Dy
> > CONFIG_ACPI_BUTTON=3Dy
> > CONFIG_ACPI_VIDEO=3Dm
> > CONFIG_ACPI_FAN=3Dy
> > # CONFIG_ACPI_DOCK is not set
> > CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> > CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> > CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> > CONFIG_ACPI_PROCESSOR=3Dy
> > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > CONFIG_ACPI_THERMAL=3Dy
> > # CONFIG_ACPI_CUSTOM_DSDT is not set
> > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > # CONFIG_ACPI_DEBUG is not set
> > # CONFIG_ACPI_PCI_SLOT is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > # CONFIG_ACPI_CONTAINER is not set
> > # CONFIG_ACPI_SBS is not set
> > # CONFIG_ACPI_HED is not set
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> > # CONFIG_ACPI_NFIT is not set
> > CONFIG_HAVE_ACPI_APEI=3Dy
> > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > # CONFIG_ACPI_APEI is not set
> > # CONFIG_DPTF_POWER is not set
> > # CONFIG_PMIC_OPREGION is not set
> > # CONFIG_ACPI_CONFIGFS is not set
> > CONFIG_SFI=3Dy
> > =

> > #
> > # CPU Frequency scaling
> > #
> > CONFIG_CPU_FREQ=3Dy
> > CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> > CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> > # CONFIG_CPU_FREQ_STAT is not set
> > CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> > CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
> > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
> > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
> > =

> > #
> > # CPU frequency scaling drivers
> > #
> > CONFIG_X86_INTEL_PSTATE=3Dy
> > # CONFIG_X86_PCC_CPUFREQ is not set
> > # CONFIG_X86_ACPI_CPUFREQ is not set
> > # CONFIG_X86_POWERNOW_K6 is not set
> > # CONFIG_X86_POWERNOW_K7 is not set
> > # CONFIG_X86_GX_SUSPMOD is not set
> > CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
> > CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> > CONFIG_X86_SPEEDSTEP_ICH=3Dy
> > CONFIG_X86_SPEEDSTEP_SMI=3Dy
> > CONFIG_X86_P4_CLOCKMOD=3Dy
> > # CONFIG_X86_CPUFREQ_NFORCE2 is not set
> > # CONFIG_X86_LONGRUN is not set
> > # CONFIG_X86_LONGHAUL is not set
> > # CONFIG_X86_E_POWERSAVER is not set
> > =

> > #
> > # shared options
> > #
> > CONFIG_X86_SPEEDSTEP_LIB=3Dy
> > CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=3Dy
> > =

> > #
> > # CPU Idle
> > #
> > CONFIG_CPU_IDLE=3Dy
> > # CONFIG_CPU_IDLE_GOV_LADDER is not set
> > CONFIG_CPU_IDLE_GOV_MENU=3Dy
> > # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> > # CONFIG_INTEL_IDLE is not set
> > =

> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI=3Dy
> > # CONFIG_PCI_GOBIOS is not set
> > # CONFIG_PCI_GOMMCONFIG is not set
> > CONFIG_PCI_GODIRECT=3Dy
> > # CONFIG_PCI_GOANY is not set
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > CONFIG_PCIEPORTBUS=3Dy
> > # CONFIG_HOTPLUG_PCI_PCIE is not set
> > CONFIG_PCIEAER=3Dy
> > # CONFIG_PCIE_ECRC is not set
> > CONFIG_PCIEAER_INJECT=3Dm
> > CONFIG_PCIEASPM=3Dy
> > CONFIG_PCIEASPM_DEBUG=3Dy
> > # CONFIG_PCIEASPM_DEFAULT is not set
> > CONFIG_PCIEASPM_POWERSAVE=3Dy
> > # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> > # CONFIG_PCIEASPM_PERFORMANCE is not set
> > CONFIG_PCIE_PME=3Dy
> > CONFIG_PCIE_DPC=3Dy
> > # CONFIG_PCIE_PTM is not set
> > CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> > # CONFIG_PCI_MSI is not set
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> > # CONFIG_PCI_STUB is not set
> > CONFIG_PCI_ATS=3Dy
> > CONFIG_PCI_IOV=3Dy
> > # CONFIG_PCI_PRI is not set
> > CONFIG_PCI_PASID=3Dy
> > CONFIG_PCI_LABEL=3Dy
> > CONFIG_HOTPLUG_PCI=3Dy
> > # CONFIG_HOTPLUG_PCI_ACPI is not set
> > # CONFIG_HOTPLUG_PCI_CPCI is not set
> > CONFIG_HOTPLUG_PCI_SHPC=3Dy
> > =

> > #
> > # DesignWare PCI Core Support
> > #
> > =

> > #
> > # PCI host controller drivers
> > #
> > =

> > #
> > # PCI Endpoint
> > #
> > # CONFIG_PCI_ENDPOINT is not set
> > =

> > #
> > # PCI switch controller drivers
> > #
> > CONFIG_PCI_SW_SWITCHTEC=3Dy
> > CONFIG_ISA_DMA_API=3Dy
> > # CONFIG_ISA is not set
> > CONFIG_SCx200=3Dy
> > CONFIG_SCx200HR_TIMER=3Dm
> > CONFIG_ALIX=3Dy
> > CONFIG_NET5501=3Dy
> > CONFIG_GEOS=3Dy
> > CONFIG_AMD_NB=3Dy
> > CONFIG_PCCARD=3Dy
> > CONFIG_PCMCIA=3Dy
> > # CONFIG_PCMCIA_LOAD_CIS is not set
> > CONFIG_CARDBUS=3Dy
> > =

> > #
> > # PC-card bridges
> > #
> > # CONFIG_YENTA is not set
> > CONFIG_PD6729=3Dm
> > CONFIG_I82092=3Dm
> > CONFIG_PCCARD_NONSTATIC=3Dy
> > CONFIG_RAPIDIO=3Dm
> > CONFIG_RAPIDIO_TSI721=3Dm
> > CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> > CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
> > # CONFIG_RAPIDIO_DMA_ENGINE is not set
> > CONFIG_RAPIDIO_DEBUG=3Dy
> > CONFIG_RAPIDIO_ENUM_BASIC=3Dm
> > # CONFIG_RAPIDIO_CHMAN is not set
> > CONFIG_RAPIDIO_MPORT_CDEV=3Dm
> > =

> > #
> > # RapidIO Switch drivers
> > #
> > # CONFIG_RAPIDIO_TSI57X is not set
> > CONFIG_RAPIDIO_CPS_XX=3Dm
> > CONFIG_RAPIDIO_TSI568=3Dm
> > CONFIG_RAPIDIO_CPS_GEN2=3Dm
> > # CONFIG_RAPIDIO_RXS_GEN3 is not set
> > CONFIG_X86_SYSFB=3Dy
> > =

> > #
> > # Executable file formats / Emulations
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_ELFCORE=3Dy
> > CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> > CONFIG_BINFMT_SCRIPT=3Dy
> > CONFIG_HAVE_AOUT=3Dy
> > CONFIG_BINFMT_AOUT=3Dm
> > CONFIG_BINFMT_MISC=3Dy
> > CONFIG_COREDUMP=3Dy
> > CONFIG_COMPAT_32=3Dy
> > CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> > CONFIG_NET=3Dy
> > =

> > #
> > # Networking options
> > #
> > # CONFIG_PACKET is not set
> > CONFIG_UNIX=3Dy
> > # CONFIG_UNIX_DIAG is not set
> > # CONFIG_NET_KEY is not set
> > # CONFIG_INET is not set
> > # CONFIG_NETWORK_SECMARK is not set
> > # CONFIG_NET_PTP_CLASSIFY is not set
> > # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> > # CONFIG_NETFILTER is not set
> > # CONFIG_ATM is not set
> > # CONFIG_BRIDGE is not set
> > # CONFIG_VLAN_8021Q is not set
> > # CONFIG_DECNET is not set
> > # CONFIG_LLC2 is not set
> > # CONFIG_IPX is not set
> > # CONFIG_ATALK is not set
> > # CONFIG_X25 is not set
> > # CONFIG_LAPB is not set
> > # CONFIG_PHONET is not set
> > # CONFIG_IEEE802154 is not set
> > # CONFIG_NET_SCHED is not set
> > # CONFIG_DCB is not set
> > # CONFIG_DNS_RESOLVER is not set
> > # CONFIG_BATMAN_ADV is not set
> > # CONFIG_VSOCKETS is not set
> > # CONFIG_NETLINK_DIAG is not set
> > # CONFIG_MPLS is not set
> > # CONFIG_HSR is not set
> > # CONFIG_CGROUP_NET_PRIO is not set
> > # CONFIG_CGROUP_NET_CLASSID is not set
> > CONFIG_NET_RX_BUSY_POLL=3Dy
> > CONFIG_BQL=3Dy
> > =

> > #
> > # Network testing
> > #
> > # CONFIG_HAMRADIO is not set
> > # CONFIG_CAN is not set
> > # CONFIG_IRDA is not set
> > # CONFIG_BT is not set
> > # CONFIG_STREAM_PARSER is not set
> > CONFIG_WIRELESS=3Dy
> > # CONFIG_CFG80211 is not set
> > # CONFIG_LIB80211 is not set
> > =

> > #
> > # CFG80211 needs to be enabled for MAC80211
> > #
> > CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> > # CONFIG_WIMAX is not set
> > # CONFIG_RFKILL is not set
> > # CONFIG_NET_9P is not set
> > # CONFIG_CAIF is not set
> > # CONFIG_NFC is not set
> > # CONFIG_PSAMPLE is not set
> > # CONFIG_NET_IFE is not set
> > # CONFIG_LWTUNNEL is not set
> > # CONFIG_DST_CACHE is not set
> > # CONFIG_GRO_CELLS is not set
> > # CONFIG_NET_DEVLINK is not set
> > CONFIG_MAY_USE_DEVLINK=3Dy
> > =

> > #
> > # Device Drivers
> > #
> > =

> > #
> > # Generic Driver Options
> > #
> > CONFIG_UEVENT_HELPER=3Dy
> > CONFIG_UEVENT_HELPER_PATH=3D""
> > CONFIG_DEVTMPFS=3Dy
> > CONFIG_DEVTMPFS_MOUNT=3Dy
> > CONFIG_STANDALONE=3Dy
> > # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> > CONFIG_FW_LOADER=3Dy
> > CONFIG_FIRMWARE_IN_KERNEL=3Dy
> > CONFIG_EXTRA_FIRMWARE=3D""
> > CONFIG_FW_LOADER_USER_HELPER=3Dy
> > # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > # CONFIG_DEBUG_DRIVER is not set
> > # CONFIG_DEBUG_DEVRES is not set
> > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> > # CONFIG_SYS_HYPERVISOR is not set
> > # CONFIG_GENERIC_CPU_DEVICES is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > CONFIG_REGMAP=3Dy
> > CONFIG_REGMAP_I2C=3Dm
> > CONFIG_REGMAP_SPI=3Dy
> > CONFIG_REGMAP_SPMI=3Dm
> > CONFIG_REGMAP_MMIO=3Dy
> > CONFIG_REGMAP_IRQ=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > # CONFIG_DMA_FENCE_TRACE is not set
> > # CONFIG_DMA_CMA is not set
> > =

> > #
> > # Bus devices
> > #
> > # CONFIG_CONNECTOR is not set
> > # CONFIG_MTD is not set
> > # CONFIG_OF is not set
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > CONFIG_PARPORT=3Dy
> > # CONFIG_PARPORT_PC is not set
> > # CONFIG_PARPORT_GSC is not set
> > # CONFIG_PARPORT_AX88796 is not set
> > # CONFIG_PARPORT_1284 is not set
> > CONFIG_PNP=3Dy
> > CONFIG_PNP_DEBUG_MESSAGES=3Dy
> > =

> > #
> > # Protocols
> > #
> > CONFIG_PNPACPI=3Dy
> > CONFIG_BLK_DEV=3Dy
> > # CONFIG_BLK_DEV_NULL_BLK is not set
> > CONFIG_BLK_DEV_FD=3Dy
> > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > CONFIG_BLK_CPQ_CISS_DA=3Dy
> > CONFIG_BLK_DEV_DAC960=3Dm
> > CONFIG_BLK_DEV_UMEM=3Dy
> > # CONFIG_BLK_DEV_COW_COMMON is not set
> > CONFIG_BLK_DEV_LOOP=3Dy
> > CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> > # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> > =

> > #
> > # DRBD disabled because PROC_FS or INET not selected
> > #
> > # CONFIG_BLK_DEV_NBD is not set
> > CONFIG_BLK_DEV_SX8=3Dm
> > CONFIG_BLK_DEV_RAM=3Dm
> > CONFIG_BLK_DEV_RAM_COUNT=3D16
> > CONFIG_BLK_DEV_RAM_SIZE=3D4096
> > CONFIG_BLK_DEV_RAM_DAX=3Dy
> > # CONFIG_CDROM_PKTCDVD is not set
> > # CONFIG_ATA_OVER_ETH is not set
> > CONFIG_VIRTIO_BLK=3Dy
> > # CONFIG_VIRTIO_BLK_SCSI is not set
> > CONFIG_BLK_DEV_RSXX=3Dy
> > CONFIG_NVME_CORE=3Dy
> > CONFIG_BLK_DEV_NVME=3Dy
> > # CONFIG_BLK_DEV_NVME_SCSI is not set
> > CONFIG_NVME_FABRICS=3Dy
> > # CONFIG_NVME_FC is not set
> > CONFIG_NVME_TARGET=3Dy
> > CONFIG_NVME_TARGET_LOOP=3Dy
> > # CONFIG_NVME_TARGET_FC is not set
> > =

> > #
> > # Misc devices
> > #
> > # CONFIG_SENSORS_LIS3LV02D is not set
> > # CONFIG_AD525X_DPOT is not set
> > CONFIG_DUMMY_IRQ=3Dy
> > CONFIG_IBM_ASM=3Dm
> > CONFIG_PHANTOM=3Dm
> > # CONFIG_SGI_IOC4 is not set
> > CONFIG_TIFM_CORE=3Dm
> > # CONFIG_TIFM_7XX1 is not set
> > # CONFIG_ICS932S401 is not set
> > # CONFIG_ENCLOSURE_SERVICES is not set
> > CONFIG_CS5535_MFGPT=3Dm
> > CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> > CONFIG_CS5535_CLOCK_EVENT_SRC=3Dm
> > # CONFIG_HP_ILO is not set
> > # CONFIG_APDS9802ALS is not set
> > CONFIG_ISL29003=3Dm
> > CONFIG_ISL29020=3Dm
> > CONFIG_SENSORS_TSL2550=3Dm
> > CONFIG_SENSORS_BH1770=3Dm
> > # CONFIG_SENSORS_APDS990X is not set
> > CONFIG_HMC6352=3Dm
> > # CONFIG_DS1682 is not set
> > CONFIG_TI_DAC7512=3Dm
> > CONFIG_PCH_PHUB=3Dy
> > CONFIG_USB_SWITCH_FSA9480=3Dm
> > # CONFIG_LATTICE_ECP3_CONFIG is not set
> > # CONFIG_SRAM is not set
> > # CONFIG_PCI_ENDPOINT_TEST is not set
> > CONFIG_C2PORT=3Dm
> > # CONFIG_C2PORT_DURAMAR_2150 is not set
> > =

> > #
> > # EEPROM support
> > #
> > # CONFIG_EEPROM_AT24 is not set
> > CONFIG_EEPROM_AT25=3Dm
> > # CONFIG_EEPROM_LEGACY is not set
> > # CONFIG_EEPROM_MAX6875 is not set
> > CONFIG_EEPROM_93CX6=3Dy
> > CONFIG_EEPROM_93XX46=3Dm
> > CONFIG_EEPROM_IDT_89HPESX=3Dm
> > CONFIG_CB710_CORE=3Dy
> > # CONFIG_CB710_DEBUG is not set
> > CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> > =

> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # CONFIG_TI_ST is not set
> > # CONFIG_SENSORS_LIS3_I2C is not set
> > =

> > #
> > # Altera FPGA firmware download module
> > #
> > CONFIG_ALTERA_STAPL=3Dm
> > CONFIG_INTEL_MEI=3Dy
> > CONFIG_INTEL_MEI_ME=3Dy
> > CONFIG_INTEL_MEI_TXE=3Dm
> > # CONFIG_VMWARE_VMCI is not set
> > =

> > #
> > # Intel MIC Bus Driver
> > #
> > =

> > #
> > # SCIF Bus Driver
> > #
> > =

> > #
> > # VOP Bus Driver
> > #
> > =

> > #
> > # Intel MIC Host Driver
> > #
> > =

> > #
> > # Intel MIC Card Driver
> > #
> > =

> > #
> > # SCIF Driver
> > #
> > =

> > #
> > # Intel MIC Coprocessor State Management (COSM) Drivers
> > #
> > =

> > #
> > # VOP Driver
> > #
> > CONFIG_ECHO=3Dy
> > # CONFIG_CXL_BASE is not set
> > # CONFIG_CXL_AFU_DRIVER_OPS is not set
> > CONFIG_HAVE_IDE=3Dy
> > CONFIG_IDE=3Dm
> > =

> > #
> > # Please see Documentation/ide/ide.txt for help/info on IDE drives
> > #
> > CONFIG_IDE_XFER_MODE=3Dy
> > CONFIG_IDE_TIMINGS=3Dy
> > CONFIG_IDE_ATAPI=3Dy
> > # CONFIG_BLK_DEV_IDE_SATA is not set
> > CONFIG_IDE_GD=3Dm
> > # CONFIG_IDE_GD_ATA is not set
> > CONFIG_IDE_GD_ATAPI=3Dy
> > CONFIG_BLK_DEV_IDECS=3Dm
> > # CONFIG_BLK_DEV_DELKIN is not set
> > CONFIG_BLK_DEV_IDECD=3Dm
> > CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS=3Dy
> > # CONFIG_BLK_DEV_IDETAPE is not set
> > # CONFIG_BLK_DEV_IDEACPI is not set
> > # CONFIG_IDE_TASK_IOCTL is not set
> > CONFIG_IDE_PROC_FS=3Dy
> > =

> > #
> > # IDE chipset support/bugfixes
> > #
> > # CONFIG_IDE_GENERIC is not set
> > CONFIG_BLK_DEV_PLATFORM=3Dm
> > CONFIG_BLK_DEV_CMD640=3Dm
> > CONFIG_BLK_DEV_CMD640_ENHANCED=3Dy
> > # CONFIG_BLK_DEV_IDEPNP is not set
> > CONFIG_BLK_DEV_IDEDMA_SFF=3Dy
> > =

> > #
> > # PCI IDE chipsets support
> > #
> > CONFIG_BLK_DEV_IDEPCI=3Dy
> > # CONFIG_BLK_DEV_OFFBOARD is not set
> > CONFIG_BLK_DEV_GENERIC=3Dm
> > CONFIG_BLK_DEV_OPTI621=3Dm
> > CONFIG_BLK_DEV_RZ1000=3Dm
> > CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
> > CONFIG_BLK_DEV_AEC62XX=3Dm
> > CONFIG_BLK_DEV_ALI15X3=3Dm
> > CONFIG_BLK_DEV_AMD74XX=3Dm
> > # CONFIG_BLK_DEV_ATIIXP is not set
> > CONFIG_BLK_DEV_CMD64X=3Dm
> > # CONFIG_BLK_DEV_TRIFLEX is not set
> > CONFIG_BLK_DEV_CS5520=3Dm
> > CONFIG_BLK_DEV_CS5530=3Dm
> > CONFIG_BLK_DEV_CS5535=3Dm
> > # CONFIG_BLK_DEV_CS5536 is not set
> > CONFIG_BLK_DEV_HPT366=3Dm
> > # CONFIG_BLK_DEV_JMICRON is not set
> > CONFIG_BLK_DEV_SC1200=3Dm
> > CONFIG_BLK_DEV_PIIX=3Dm
> > # CONFIG_BLK_DEV_IT8172 is not set
> > CONFIG_BLK_DEV_IT8213=3Dm
> > # CONFIG_BLK_DEV_IT821X is not set
> > CONFIG_BLK_DEV_NS87415=3Dm
> > CONFIG_BLK_DEV_PDC202XX_OLD=3Dm
> > CONFIG_BLK_DEV_PDC202XX_NEW=3Dm
> > # CONFIG_BLK_DEV_SVWKS is not set
> > CONFIG_BLK_DEV_SIIMAGE=3Dm
> > CONFIG_BLK_DEV_SIS5513=3Dm
> > CONFIG_BLK_DEV_SLC90E66=3Dm
> > # CONFIG_BLK_DEV_TRM290 is not set
> > CONFIG_BLK_DEV_VIA82CXXX=3Dm
> > # CONFIG_BLK_DEV_TC86C001 is not set
> > CONFIG_BLK_DEV_IDEDMA=3Dy
> > =

> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dm
> > CONFIG_RAID_ATTRS=3Dm
> > CONFIG_SCSI=3Dm
> > CONFIG_SCSI_DMA=3Dy
> > # CONFIG_SCSI_NETLINK is not set
> > CONFIG_SCSI_MQ_DEFAULT=3Dy
> > CONFIG_SCSI_PROC_FS=3Dy
> > =

> > #
> > # SCSI support type (disk, tape, CD-ROM)
> > #
> > CONFIG_BLK_DEV_SD=3Dm
> > CONFIG_CHR_DEV_ST=3Dm
> > CONFIG_CHR_DEV_OSST=3Dm
> > CONFIG_BLK_DEV_SR=3Dm
> > # CONFIG_BLK_DEV_SR_VENDOR is not set
> > CONFIG_CHR_DEV_SG=3Dm
> > CONFIG_CHR_DEV_SCH=3Dm
> > CONFIG_SCSI_CONSTANTS=3Dy
> > # CONFIG_SCSI_LOGGING is not set
> > # CONFIG_SCSI_SCAN_ASYNC is not set
> > =

> > #
> > # SCSI Transports
> > #
> > CONFIG_SCSI_SPI_ATTRS=3Dm
> > # CONFIG_SCSI_FC_ATTRS is not set
> > # CONFIG_SCSI_ISCSI_ATTRS is not set
> > CONFIG_SCSI_SAS_ATTRS=3Dm
> > # CONFIG_SCSI_SAS_LIBSAS is not set
> > CONFIG_SCSI_SRP_ATTRS=3Dm
> > # CONFIG_SCSI_LOWLEVEL is not set
> > CONFIG_SCSI_LOWLEVEL_PCMCIA=3Dy
> > CONFIG_PCMCIA_AHA152X=3Dm
> > CONFIG_PCMCIA_FDOMAIN=3Dm
> > CONFIG_PCMCIA_NINJA_SCSI=3Dm
> > # CONFIG_PCMCIA_QLOGIC is not set
> > # CONFIG_PCMCIA_SYM53C500 is not set
> > # CONFIG_SCSI_DH is not set
> > CONFIG_SCSI_OSD_INITIATOR=3Dm
> > CONFIG_SCSI_OSD_ULD=3Dm
> > CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> > # CONFIG_SCSI_OSD_DEBUG is not set
> > CONFIG_ATA=3Dm
> > # CONFIG_ATA_NONSTANDARD is not set
> > CONFIG_ATA_VERBOSE_ERROR=3Dy
> > CONFIG_ATA_ACPI=3Dy
> > # CONFIG_SATA_ZPODD is not set
> > CONFIG_SATA_PMP=3Dy
> > =

> > #
> > # Controllers with non-SFF native interface
> > #
> > # CONFIG_SATA_AHCI is not set
> > CONFIG_SATA_AHCI_PLATFORM=3Dm
> > CONFIG_SATA_INIC162X=3Dm
> > CONFIG_SATA_ACARD_AHCI=3Dm
> > CONFIG_SATA_SIL24=3Dm
> > CONFIG_ATA_SFF=3Dy
> > =

> > #
> > # SFF controllers with custom DMA interface
> > #
> > CONFIG_PDC_ADMA=3Dm
> > CONFIG_SATA_QSTOR=3Dm
> > # CONFIG_SATA_SX4 is not set
> > # CONFIG_ATA_BMDMA is not set
> > =

> > #
> > # PIO-only SFF controllers
> > #
> > CONFIG_PATA_CMD640_PCI=3Dm
> > CONFIG_PATA_MPIIX=3Dm
> > CONFIG_PATA_NS87410=3Dm
> > CONFIG_PATA_OPTI=3Dm
> > CONFIG_PATA_PCMCIA=3Dm
> > CONFIG_PATA_RZ1000=3Dm
> > =

> > #
> > # Generic fallback / legacy drivers
> > #
> > CONFIG_PATA_LEGACY=3Dm
> > CONFIG_MD=3Dy
> > CONFIG_BLK_DEV_MD=3Dy
> > CONFIG_MD_AUTODETECT=3Dy
> > # CONFIG_MD_LINEAR is not set
> > CONFIG_MD_RAID0=3Dm
> > CONFIG_MD_RAID1=3Dm
> > CONFIG_MD_RAID10=3Dm
> > CONFIG_MD_RAID456=3Dm
> > # CONFIG_MD_MULTIPATH is not set
> > CONFIG_MD_FAULTY=3Dm
> > # CONFIG_BCACHE is not set
> > CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> > CONFIG_BLK_DEV_DM=3Dm
> > CONFIG_DM_MQ_DEFAULT=3Dy
> > # CONFIG_DM_DEBUG is not set
> > CONFIG_DM_BUFIO=3Dm
> > CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=3Dy
> > # CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
> > CONFIG_DM_BIO_PRISON=3Dm
> > CONFIG_DM_PERSISTENT_DATA=3Dm
> > # CONFIG_DM_CRYPT is not set
> > CONFIG_DM_SNAPSHOT=3Dm
> > # CONFIG_DM_THIN_PROVISIONING is not set
> > CONFIG_DM_CACHE=3Dm
> > CONFIG_DM_CACHE_SMQ=3Dm
> > CONFIG_DM_ERA=3Dm
> > # CONFIG_DM_MIRROR is not set
> > CONFIG_DM_RAID=3Dm
> > # CONFIG_DM_ZERO is not set
> > # CONFIG_DM_MULTIPATH is not set
> > # CONFIG_DM_DELAY is not set
> > # CONFIG_DM_UEVENT is not set
> > # CONFIG_DM_FLAKEY is not set
> > CONFIG_DM_VERITY=3Dm
> > # CONFIG_DM_VERITY_FEC is not set
> > CONFIG_DM_SWITCH=3Dm
> > CONFIG_DM_LOG_WRITES=3Dm
> > # CONFIG_DM_INTEGRITY is not set
> > # CONFIG_TARGET_CORE is not set
> > # CONFIG_FUSION is not set
> > =

> > #
> > # IEEE 1394 (FireWire) support
> > #
> > CONFIG_FIREWIRE=3Dm
> > CONFIG_FIREWIRE_OHCI=3Dm
> > CONFIG_FIREWIRE_SBP2=3Dm
> > # CONFIG_FIREWIRE_NOSY is not set
> > # CONFIG_MACINTOSH_DRIVERS is not set
> > # CONFIG_NETDEVICES is not set
> > CONFIG_NVM=3Dy
> > # CONFIG_NVM_DEBUG is not set
> > CONFIG_NVM_RRPC=3Dy
> > CONFIG_NVM_PBLK=3Dy
> > =

> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > CONFIG_INPUT_LEDS=3Dm
> > CONFIG_INPUT_FF_MEMLESS=3Dm
> > CONFIG_INPUT_POLLDEV=3Dy
> > # CONFIG_INPUT_SPARSEKMAP is not set
> > CONFIG_INPUT_MATRIXKMAP=3Dm
> > =

> > #
> > # Userland interfaces
> > #
> > CONFIG_INPUT_MOUSEDEV=3Dm
> > # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > CONFIG_INPUT_JOYDEV=3Dm
> > CONFIG_INPUT_EVDEV=3Dy
> > CONFIG_INPUT_EVBUG=3Dm
> > =

> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > # CONFIG_KEYBOARD_ADC is not set
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > # CONFIG_KEYBOARD_ADP5589 is not set
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_QT1070 is not set
> > # CONFIG_KEYBOARD_QT2160 is not set
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_GPIO is not set
> > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > # CONFIG_KEYBOARD_TCA6416 is not set
> > # CONFIG_KEYBOARD_TCA8418 is not set
> > # CONFIG_KEYBOARD_MATRIX is not set
> > # CONFIG_KEYBOARD_LM8323 is not set
> > # CONFIG_KEYBOARD_LM8333 is not set
> > # CONFIG_KEYBOARD_MAX7359 is not set
> > # CONFIG_KEYBOARD_MCS is not set
> > # CONFIG_KEYBOARD_MPR121 is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_SAMSUNG is not set
> > # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_KEYBOARD_CROS_EC is not set
> > # CONFIG_INPUT_MOUSE is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > # CONFIG_INPUT_TABLET is not set
> > # CONFIG_INPUT_TOUCHSCREEN is not set
> > # CONFIG_INPUT_MISC is not set
> > # CONFIG_RMI4_CORE is not set
> > =

> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > CONFIG_SERIO_SERPORT=3Dm
> > CONFIG_SERIO_CT82C710=3Dm
> > CONFIG_SERIO_PARKBD=3Dm
> > CONFIG_SERIO_PCIPS2=3Dm
> > CONFIG_SERIO_LIBPS2=3Dy
> > CONFIG_SERIO_RAW=3Dm
> > CONFIG_SERIO_ALTERA_PS2=3Dm
> > CONFIG_SERIO_PS2MULT=3Dm
> > CONFIG_SERIO_ARC_PS2=3Dm
> > CONFIG_USERIO=3Dm
> > # CONFIG_GAMEPORT is not set
> > =

> > #
> > # Character devices
> > #
> > CONFIG_TTY=3Dy
> > CONFIG_VT=3Dy
> > CONFIG_CONSOLE_TRANSLATIONS=3Dy
> > CONFIG_VT_CONSOLE=3Dy
> > CONFIG_HW_CONSOLE=3Dy
> > CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> > CONFIG_UNIX98_PTYS=3Dy
> > CONFIG_LEGACY_PTYS=3Dy
> > CONFIG_LEGACY_PTY_COUNT=3D256
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_NOZOMI is not set
> > # CONFIG_N_GSM is not set
> > CONFIG_TRACE_ROUTER=3Dm
> > CONFIG_TRACE_SINK=3Dm
> > CONFIG_GOLDFISH_TTY=3Dm
> > # CONFIG_DEVMEM is not set
> > # CONFIG_DEVKMEM is not set
> > =

> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=3Dy
> > CONFIG_SERIAL_8250=3Dy
> > CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> > CONFIG_SERIAL_8250_PNP=3Dy
> > # CONFIG_SERIAL_8250_FINTEK is not set
> > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > CONFIG_SERIAL_8250_DMA=3Dy
> > CONFIG_SERIAL_8250_PCI=3Dm
> > # CONFIG_SERIAL_8250_EXAR is not set
> > CONFIG_SERIAL_8250_CS=3Dy
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > CONFIG_SERIAL_8250_EXTENDED=3Dy
> > CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> > # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> > CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> > # CONFIG_SERIAL_8250_RSA is not set
> > # CONFIG_SERIAL_8250_FSL is not set
> > # CONFIG_SERIAL_8250_DW is not set
> > CONFIG_SERIAL_8250_RT288X=3Dy
> > CONFIG_SERIAL_8250_LPSS=3Dy
> > CONFIG_SERIAL_8250_MID=3Dm
> > CONFIG_SERIAL_8250_MOXA=3Dm
> > =

> > #
> > # Non-8250 serial port support
> > #
> > CONFIG_SERIAL_MAX3100=3Dy
> > CONFIG_SERIAL_MAX310X=3Dy
> > CONFIG_SERIAL_UARTLITE=3Dm
> > CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > CONFIG_SERIAL_JSM=3Dy
> > # CONFIG_SERIAL_SCCNXP is not set
> > CONFIG_SERIAL_SC16IS7XX=3Dm
> > # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> > # CONFIG_SERIAL_SC16IS7XX_SPI is not set
> > CONFIG_SERIAL_TIMBERDALE=3Dm
> > CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> > CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> > CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
> > CONFIG_SERIAL_ALTERA_UART=3Dy
> > CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> > CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> > CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> > CONFIG_SERIAL_IFX6X60=3Dm
> > CONFIG_SERIAL_PCH_UART=3Dy
> > CONFIG_SERIAL_PCH_UART_CONSOLE=3Dy
> > CONFIG_SERIAL_ARC=3Dm
> > CONFIG_SERIAL_ARC_NR_PORTS=3D1
> > CONFIG_SERIAL_RP2=3Dy
> > CONFIG_SERIAL_RP2_NR_UARTS=3D32
> > CONFIG_SERIAL_FSL_LPUART=3Dm
> > CONFIG_SERIAL_DEV_BUS=3Dm
> > CONFIG_PRINTER=3Dm
> > CONFIG_LP_CONSOLE=3Dy
> > CONFIG_PPDEV=3Dy
> > CONFIG_HVC_DRIVER=3Dy
> > CONFIG_VIRTIO_CONSOLE=3Dy
> > # CONFIG_IPMI_HANDLER is not set
> > CONFIG_HW_RANDOM=3Dy
> > CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> > # CONFIG_HW_RANDOM_INTEL is not set
> > CONFIG_HW_RANDOM_AMD=3Dm
> > CONFIG_HW_RANDOM_GEODE=3Dm
> > CONFIG_HW_RANDOM_VIA=3Dy
> > # CONFIG_HW_RANDOM_VIRTIO is not set
> > CONFIG_NVRAM=3Dm
> > # CONFIG_R3964 is not set
> > CONFIG_APPLICOM=3Dm
> > CONFIG_SONYPI=3Dm
> > =

> > #
> > # PCMCIA character devices
> > #
> > CONFIG_SYNCLINK_CS=3Dm
> > CONFIG_CARDMAN_4000=3Dm
> > CONFIG_CARDMAN_4040=3Dm
> > CONFIG_SCR24X=3Dy
> > # CONFIG_MWAVE is not set
> > CONFIG_SCx200_GPIO=3Dm
> > CONFIG_PC8736x_GPIO=3Dy
> > CONFIG_NSC_GPIO=3Dy
> > CONFIG_RAW_DRIVER=3Dy
> > CONFIG_MAX_RAW_DEVS=3D256
> > # CONFIG_HPET is not set
> > # CONFIG_HANGCHECK_TIMER is not set
> > # CONFIG_TCG_TPM is not set
> > CONFIG_TELCLOCK=3Dy
> > CONFIG_DEVPORT=3Dy
> > CONFIG_XILLYBUS=3Dm
> > =

> > #
> > # I2C support
> > #
> > CONFIG_I2C=3Dm
> > CONFIG_I2C_BOARDINFO=3Dy
> > # CONFIG_I2C_COMPAT is not set
> > CONFIG_I2C_CHARDEV=3Dm
> > CONFIG_I2C_MUX=3Dm
> > =

> > #
> > # Multiplexer I2C Chip support
> > #
> > CONFIG_I2C_MUX_GPIO=3Dm
> > CONFIG_I2C_MUX_LTC4306=3Dm
> > # CONFIG_I2C_MUX_PCA9541 is not set
> > CONFIG_I2C_MUX_PCA954x=3Dm
> > # CONFIG_I2C_MUX_REG is not set
> > # CONFIG_I2C_MUX_MLXCPLD is not set
> > # CONFIG_I2C_HELPER_AUTO is not set
> > CONFIG_I2C_SMBUS=3Dm
> > =

> > #
> > # I2C Algorithms
> > #
> > CONFIG_I2C_ALGOBIT=3Dm
> > # CONFIG_I2C_ALGOPCF is not set
> > CONFIG_I2C_ALGOPCA=3Dm
> > =

> > #
> > # I2C Hardware Bus support
> > #
> > =

> > #
> > # PC SMBus host controller drivers
> > #
> > CONFIG_I2C_ALI1535=3Dm
> > # CONFIG_I2C_ALI1563 is not set
> > CONFIG_I2C_ALI15X3=3Dm
> > CONFIG_I2C_AMD756=3Dm
> > CONFIG_I2C_AMD756_S4882=3Dm
> > # CONFIG_I2C_AMD8111 is not set
> > CONFIG_I2C_I801=3Dm
> > CONFIG_I2C_ISCH=3Dm
> > CONFIG_I2C_ISMT=3Dm
> > # CONFIG_I2C_PIIX4 is not set
> > CONFIG_I2C_NFORCE2=3Dm
> > CONFIG_I2C_NFORCE2_S4985=3Dm
> > CONFIG_I2C_SIS5595=3Dm
> > CONFIG_I2C_SIS630=3Dm
> > CONFIG_I2C_SIS96X=3Dm
> > CONFIG_I2C_VIA=3Dm
> > CONFIG_I2C_VIAPRO=3Dm
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_I2C_SCMI is not set
> > =

> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > CONFIG_I2C_CBUS_GPIO=3Dm
> > CONFIG_I2C_DESIGNWARE_CORE=3Dm
> > CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> > CONFIG_I2C_DESIGNWARE_PCI=3Dm
> > # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> > CONFIG_I2C_EG20T=3Dm
> > # CONFIG_I2C_EMEV2 is not set
> > # CONFIG_I2C_GPIO is not set
> > # CONFIG_I2C_KEMPLD is not set
> > # CONFIG_I2C_OCORES is not set
> > CONFIG_I2C_PCA_PLATFORM=3Dm
> > # CONFIG_I2C_PXA_PCI is not set
> > CONFIG_I2C_SIMTEC=3Dm
> > CONFIG_I2C_XILINX=3Dm
> > =

> > #
> > # External I2C/SMBus adapter drivers
> > #
> > CONFIG_I2C_PARPORT=3Dm
> > CONFIG_I2C_PARPORT_LIGHT=3Dm
> > CONFIG_I2C_TAOS_EVM=3Dm
> > =

> > #
> > # Other I2C/SMBus bus drivers
> > #
> > # CONFIG_I2C_CROS_EC_TUNNEL is not set
> > CONFIG_SCx200_ACB=3Dm
> > CONFIG_I2C_STUB=3Dm
> > CONFIG_I2C_SLAVE=3Dy
> > CONFIG_I2C_SLAVE_EEPROM=3Dm
> > # CONFIG_I2C_DEBUG_CORE is not set
> > # CONFIG_I2C_DEBUG_ALGO is not set
> > # CONFIG_I2C_DEBUG_BUS is not set
> > CONFIG_SPI=3Dy
> > # CONFIG_SPI_DEBUG is not set
> > CONFIG_SPI_MASTER=3Dy
> > =

> > #
> > # SPI Master Controller Drivers
> > #
> > CONFIG_SPI_ALTERA=3Dm
> > CONFIG_SPI_AXI_SPI_ENGINE=3Dm
> > CONFIG_SPI_BITBANG=3Dy
> > CONFIG_SPI_BUTTERFLY=3Dm
> > CONFIG_SPI_CADENCE=3Dm
> > CONFIG_SPI_DESIGNWARE=3Dm
> > # CONFIG_SPI_DW_PCI is not set
> > CONFIG_SPI_DW_MMIO=3Dm
> > # CONFIG_SPI_GPIO is not set
> > # CONFIG_SPI_LM70_LLP is not set
> > CONFIG_SPI_OC_TINY=3Dm
> > CONFIG_SPI_PXA2XX=3Dy
> > CONFIG_SPI_PXA2XX_PCI=3Dy
> > # CONFIG_SPI_ROCKCHIP is not set
> > # CONFIG_SPI_SC18IS602 is not set
> > CONFIG_SPI_TOPCLIFF_PCH=3Dy
> > CONFIG_SPI_XCOMM=3Dm
> > # CONFIG_SPI_XILINX is not set
> > CONFIG_SPI_ZYNQMP_GQSPI=3Dm
> > =

> > #
> > # SPI Protocol Masters
> > #
> > CONFIG_SPI_SPIDEV=3Dy
> > # CONFIG_SPI_LOOPBACK_TEST is not set
> > # CONFIG_SPI_TLE62X0 is not set
> > CONFIG_SPMI=3Dm
> > CONFIG_HSI=3Dm
> > CONFIG_HSI_BOARDINFO=3Dy
> > =

> > #
> > # HSI controllers
> > #
> > =

> > #
> > # HSI clients
> > #
> > # CONFIG_HSI_CHAR is not set
> > =

> > #
> > # PPS support
> > #
> > # CONFIG_PPS is not set
> > =

> > #
> > # PPS generators support
> > #
> > =

> > #
> > # PTP clock support
> > #
> > # CONFIG_PTP_1588_CLOCK is not set
> > =

> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
> > #
> > # CONFIG_PTP_1588_CLOCK_PCH is not set
> > CONFIG_GPIOLIB=3Dy
> > CONFIG_GPIO_ACPI=3Dy
> > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > # CONFIG_DEBUG_GPIO is not set
> > CONFIG_GPIO_SYSFS=3Dy
> > CONFIG_GPIO_GENERIC=3Dy
> > CONFIG_GPIO_MAX730X=3Dm
> > =

> > #
> > # Memory mapped GPIO drivers
> > #
> > # CONFIG_GPIO_AMDPT is not set
> > CONFIG_GPIO_DWAPB=3Dy
> > CONFIG_GPIO_GENERIC_PLATFORM=3Dm
> > CONFIG_GPIO_ICH=3Dm
> > # CONFIG_GPIO_LYNXPOINT is not set
> > # CONFIG_GPIO_MOCKUP is not set
> > CONFIG_GPIO_VX855=3Dy
> > =

> > #
> > # Port-mapped I/O GPIO drivers
> > #
> > CONFIG_GPIO_F7188X=3Dm
> > CONFIG_GPIO_IT87=3Dy
> > # CONFIG_GPIO_SCH is not set
> > CONFIG_GPIO_SCH311X=3Dy
> > =

> > #
> > # I2C GPIO expanders
> > #
> > # CONFIG_GPIO_ADP5588 is not set
> > # CONFIG_GPIO_MAX7300 is not set
> > # CONFIG_GPIO_MAX732X is not set
> > CONFIG_GPIO_PCA953X=3Dm
> > CONFIG_GPIO_PCF857X=3Dm
> > CONFIG_GPIO_TPIC2810=3Dm
> > =

> > #
> > # MFD GPIO expanders
> > #
> > CONFIG_GPIO_CS5535=3Dm
> > # CONFIG_GPIO_DA9052 is not set
> > # CONFIG_GPIO_JANZ_TTL is not set
> > CONFIG_GPIO_KEMPLD=3Dm
> > CONFIG_GPIO_LP873X=3Dm
> > CONFIG_GPIO_TPS65218=3Dm
> > # CONFIG_GPIO_TPS65912 is not set
> > CONFIG_GPIO_UCB1400=3Dm
> > CONFIG_GPIO_WM8994=3Dm
> > =

> > #
> > # PCI GPIO expanders
> > #
> > CONFIG_GPIO_AMD8111=3Dy
> > CONFIG_GPIO_BT8XX=3Dy
> > CONFIG_GPIO_ML_IOH=3Dm
> > CONFIG_GPIO_PCH=3Dy
> > CONFIG_GPIO_PCI_IDIO_16=3Dy
> > CONFIG_GPIO_RDC321X=3Dy
> > =

> > #
> > # SPI GPIO expanders
> > #
> > CONFIG_GPIO_MAX7301=3Dm
> > CONFIG_GPIO_MC33880=3Dm
> > # CONFIG_GPIO_PISOSR is not set
> > =

> > #
> > # SPI or I2C GPIO expanders
> > #
> > CONFIG_W1=3Dy
> > =

> > #
> > # 1-wire Bus Masters
> > #
> > # CONFIG_W1_MASTER_MATROX is not set
> > CONFIG_W1_MASTER_DS2482=3Dm
> > CONFIG_W1_MASTER_DS1WM=3Dy
> > CONFIG_W1_MASTER_GPIO=3Dy
> > =

> > #
> > # 1-wire Slaves
> > #
> > CONFIG_W1_SLAVE_THERM=3Dm
> > CONFIG_W1_SLAVE_SMEM=3Dm
> > CONFIG_W1_SLAVE_DS2405=3Dy
> > CONFIG_W1_SLAVE_DS2408=3Dy
> > CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> > CONFIG_W1_SLAVE_DS2413=3Dm
> > CONFIG_W1_SLAVE_DS2406=3Dy
> > # CONFIG_W1_SLAVE_DS2423 is not set
> > CONFIG_W1_SLAVE_DS2431=3Dy
> > # CONFIG_W1_SLAVE_DS2433 is not set
> > # CONFIG_W1_SLAVE_DS2438 is not set
> > CONFIG_W1_SLAVE_DS2760=3Dm
> > CONFIG_W1_SLAVE_DS2780=3Dy
> > # CONFIG_W1_SLAVE_DS2781 is not set
> > CONFIG_W1_SLAVE_DS28E04=3Dy
> > # CONFIG_W1_SLAVE_BQ27000 is not set
> > CONFIG_POWER_AVS=3Dy
> > CONFIG_POWER_RESET=3Dy
> > # CONFIG_POWER_RESET_RESTART is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > # CONFIG_POWER_SUPPLY_DEBUG is not set
> > CONFIG_PDA_POWER=3Dy
> > # CONFIG_GENERIC_ADC_BATTERY is not set
> > CONFIG_TEST_POWER=3Dy
> > CONFIG_BATTERY_DS2760=3Dm
> > # CONFIG_BATTERY_DS2780 is not set
> > # CONFIG_BATTERY_DS2781 is not set
> > CONFIG_BATTERY_DS2782=3Dm
> > CONFIG_BATTERY_SBS=3Dm
> > CONFIG_CHARGER_SBS=3Dm
> > # CONFIG_BATTERY_BQ27XXX is not set
> > CONFIG_BATTERY_DA9052=3Dy
> > CONFIG_BATTERY_MAX17040=3Dm
> > CONFIG_BATTERY_MAX17042=3Dm
> > CONFIG_CHARGER_PCF50633=3Dm
> > CONFIG_CHARGER_MAX8903=3Dy
> > # CONFIG_CHARGER_LP8727 is not set
> > CONFIG_CHARGER_GPIO=3Dy
> > # CONFIG_CHARGER_MAX14577 is not set
> > CONFIG_CHARGER_BQ2415X=3Dm
> > CONFIG_CHARGER_BQ24257=3Dm
> > # CONFIG_CHARGER_BQ24735 is not set
> > # CONFIG_CHARGER_BQ25890 is not set
> > # CONFIG_CHARGER_SMB347 is not set
> > CONFIG_CHARGER_TPS65217=3Dm
> > CONFIG_BATTERY_GAUGE_LTC2941=3Dm
> > CONFIG_BATTERY_GOLDFISH=3Dm
> > CONFIG_BATTERY_RT5033=3Dm
> > CONFIG_CHARGER_RT9455=3Dm
> > CONFIG_HWMON=3Dm
> > CONFIG_HWMON_VID=3Dm
> > # CONFIG_HWMON_DEBUG_CHIP is not set
> > =

> > #
> > # Native drivers
> > #
> > # CONFIG_SENSORS_ABITUGURU is not set
> > CONFIG_SENSORS_ABITUGURU3=3Dm
> > CONFIG_SENSORS_AD7314=3Dm
> > # CONFIG_SENSORS_AD7414 is not set
> > CONFIG_SENSORS_AD7418=3Dm
> > CONFIG_SENSORS_ADM1021=3Dm
> > CONFIG_SENSORS_ADM1025=3Dm
> > CONFIG_SENSORS_ADM1026=3Dm
> > CONFIG_SENSORS_ADM1029=3Dm
> > CONFIG_SENSORS_ADM1031=3Dm
> > CONFIG_SENSORS_ADM9240=3Dm
> > CONFIG_SENSORS_ADT7X10=3Dm
> > CONFIG_SENSORS_ADT7310=3Dm
> > CONFIG_SENSORS_ADT7410=3Dm
> > CONFIG_SENSORS_ADT7411=3Dm
> > CONFIG_SENSORS_ADT7462=3Dm
> > CONFIG_SENSORS_ADT7470=3Dm
> > # CONFIG_SENSORS_ADT7475 is not set
> > # CONFIG_SENSORS_ASC7621 is not set
> > CONFIG_SENSORS_K8TEMP=3Dm
> > # CONFIG_SENSORS_K10TEMP is not set
> > CONFIG_SENSORS_FAM15H_POWER=3Dm
> > # CONFIG_SENSORS_APPLESMC is not set
> > CONFIG_SENSORS_ASB100=3Dm
> > CONFIG_SENSORS_ASPEED=3Dm
> > CONFIG_SENSORS_ATXP1=3Dm
> > CONFIG_SENSORS_DS620=3Dm
> > CONFIG_SENSORS_DS1621=3Dm
> > CONFIG_SENSORS_DELL_SMM=3Dm
> > CONFIG_SENSORS_DA9052_ADC=3Dm
> > CONFIG_SENSORS_I5K_AMB=3Dm
> > CONFIG_SENSORS_F71805F=3Dm
> > CONFIG_SENSORS_F71882FG=3Dm
> > CONFIG_SENSORS_F75375S=3Dm
> > CONFIG_SENSORS_MC13783_ADC=3Dm
> > CONFIG_SENSORS_FSCHMD=3Dm
> > # CONFIG_SENSORS_GL518SM is not set
> > CONFIG_SENSORS_GL520SM=3Dm
> > # CONFIG_SENSORS_G760A is not set
> > CONFIG_SENSORS_G762=3Dm
> > CONFIG_SENSORS_GPIO_FAN=3Dm
> > # CONFIG_SENSORS_HIH6130 is not set
> > # CONFIG_SENSORS_IIO_HWMON is not set
> > # CONFIG_SENSORS_I5500 is not set
> > # CONFIG_SENSORS_CORETEMP is not set
> > CONFIG_SENSORS_IT87=3Dm
> > # CONFIG_SENSORS_JC42 is not set
> > CONFIG_SENSORS_POWR1220=3Dm
> > # CONFIG_SENSORS_LINEAGE is not set
> > CONFIG_SENSORS_LTC2945=3Dm
> > CONFIG_SENSORS_LTC2990=3Dm
> > CONFIG_SENSORS_LTC4151=3Dm
> > CONFIG_SENSORS_LTC4215=3Dm
> > # CONFIG_SENSORS_LTC4222 is not set
> > CONFIG_SENSORS_LTC4245=3Dm
> > # CONFIG_SENSORS_LTC4260 is not set
> > CONFIG_SENSORS_LTC4261=3Dm
> > CONFIG_SENSORS_MAX1111=3Dm
> > CONFIG_SENSORS_MAX16065=3Dm
> > # CONFIG_SENSORS_MAX1619 is not set
> > CONFIG_SENSORS_MAX1668=3Dm
> > # CONFIG_SENSORS_MAX197 is not set
> > CONFIG_SENSORS_MAX31722=3Dm
> > CONFIG_SENSORS_MAX6639=3Dm
> > # CONFIG_SENSORS_MAX6642 is not set
> > CONFIG_SENSORS_MAX6650=3Dm
> > CONFIG_SENSORS_MAX6697=3Dm
> > CONFIG_SENSORS_MAX31790=3Dm
> > # CONFIG_SENSORS_MCP3021 is not set
> > CONFIG_SENSORS_TC654=3Dm
> > CONFIG_SENSORS_ADCXX=3Dm
> > CONFIG_SENSORS_LM63=3Dm
> > # CONFIG_SENSORS_LM70 is not set
> > CONFIG_SENSORS_LM73=3Dm
> > CONFIG_SENSORS_LM75=3Dm
> > CONFIG_SENSORS_LM77=3Dm
> > CONFIG_SENSORS_LM78=3Dm
> > CONFIG_SENSORS_LM80=3Dm
> > # CONFIG_SENSORS_LM83 is not set
> > # CONFIG_SENSORS_LM85 is not set
> > CONFIG_SENSORS_LM87=3Dm
> > CONFIG_SENSORS_LM90=3Dm
> > CONFIG_SENSORS_LM92=3Dm
> > # CONFIG_SENSORS_LM93 is not set
> > CONFIG_SENSORS_LM95234=3Dm
> > CONFIG_SENSORS_LM95241=3Dm
> > CONFIG_SENSORS_LM95245=3Dm
> > CONFIG_SENSORS_PC87360=3Dm
> > CONFIG_SENSORS_PC87427=3Dm
> > # CONFIG_SENSORS_NTC_THERMISTOR is not set
> > CONFIG_SENSORS_NCT6683=3Dm
> > CONFIG_SENSORS_NCT6775=3Dm
> > CONFIG_SENSORS_NCT7802=3Dm
> > CONFIG_SENSORS_NCT7904=3Dm
> > CONFIG_SENSORS_PCF8591=3Dm
> > # CONFIG_PMBUS is not set
> > CONFIG_SENSORS_SHT15=3Dm
> > CONFIG_SENSORS_SHT21=3Dm
> > CONFIG_SENSORS_SHT3x=3Dm
> > CONFIG_SENSORS_SHTC1=3Dm
> > # CONFIG_SENSORS_SIS5595 is not set
> > # CONFIG_SENSORS_DME1737 is not set
> > # CONFIG_SENSORS_EMC1403 is not set
> > CONFIG_SENSORS_EMC2103=3Dm
> > CONFIG_SENSORS_EMC6W201=3Dm
> > CONFIG_SENSORS_SMSC47M1=3Dm
> > # CONFIG_SENSORS_SMSC47M192 is not set
> > CONFIG_SENSORS_SMSC47B397=3Dm
> > # CONFIG_SENSORS_SCH56XX_COMMON is not set
> > CONFIG_SENSORS_STTS751=3Dm
> > CONFIG_SENSORS_SMM665=3Dm
> > # CONFIG_SENSORS_ADC128D818 is not set
> > CONFIG_SENSORS_ADS1015=3Dm
> > CONFIG_SENSORS_ADS7828=3Dm
> > # CONFIG_SENSORS_ADS7871 is not set
> > CONFIG_SENSORS_AMC6821=3Dm
> > # CONFIG_SENSORS_INA209 is not set
> > # CONFIG_SENSORS_INA2XX is not set
> > CONFIG_SENSORS_INA3221=3Dm
> > # CONFIG_SENSORS_TC74 is not set
> > # CONFIG_SENSORS_THMC50 is not set
> > # CONFIG_SENSORS_TMP102 is not set
> > CONFIG_SENSORS_TMP103=3Dm
> > # CONFIG_SENSORS_TMP108 is not set
> > CONFIG_SENSORS_TMP401=3Dm
> > CONFIG_SENSORS_TMP421=3Dm
> > # CONFIG_SENSORS_VIA_CPUTEMP is not set
> > CONFIG_SENSORS_VIA686A=3Dm
> > # CONFIG_SENSORS_VT1211 is not set
> > # CONFIG_SENSORS_VT8231 is not set
> > # CONFIG_SENSORS_W83781D is not set
> > CONFIG_SENSORS_W83791D=3Dm
> > # CONFIG_SENSORS_W83792D is not set
> > CONFIG_SENSORS_W83793=3Dm
> > CONFIG_SENSORS_W83795=3Dm
> > CONFIG_SENSORS_W83795_FANCTRL=3Dy
> > # CONFIG_SENSORS_W83L785TS is not set
> > # CONFIG_SENSORS_W83L786NG is not set
> > CONFIG_SENSORS_W83627HF=3Dm
> > CONFIG_SENSORS_W83627EHF=3Dm
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_SENSORS_ACPI_POWER is not set
> > # CONFIG_SENSORS_ATK0110 is not set
> > CONFIG_THERMAL=3Dy
> > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> > CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> > # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> > # CONFIG_THERMAL_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> > CONFIG_THERMAL_EMULATION=3Dy
> > CONFIG_INTEL_POWERCLAMP=3Dm
> > CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
> > CONFIG_INTEL_SOC_DTS_THERMAL=3Dm
> > =

> > #
> > # ACPI INT340X thermal drivers
> > #
> > # CONFIG_INT340X_THERMAL is not set
> > CONFIG_INTEL_PCH_THERMAL=3Dm
> > # CONFIG_GENERIC_ADC_THERMAL is not set
> > # CONFIG_WATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=3Dy
> > =

> > #
> > # Sonics Silicon Backplane
> > #
> > # CONFIG_SSB is not set
> > CONFIG_BCMA_POSSIBLE=3Dy
> > =

> > #
> > # Broadcom specific AMBA
> > #
> > # CONFIG_BCMA is not set
> > =

> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dy
> > CONFIG_MFD_CS5535=3Dm
> > # CONFIG_MFD_BCM590XX is not set
> > # CONFIG_MFD_AXP20X_I2C is not set
> > CONFIG_MFD_CROS_EC=3Dm
> > CONFIG_MFD_CROS_EC_I2C=3Dm
> > CONFIG_MFD_CROS_EC_SPI=3Dm
> > CONFIG_PMIC_DA9052=3Dy
> > CONFIG_MFD_DA9052_SPI=3Dy
> > CONFIG_MFD_DA9062=3Dm
> > # CONFIG_MFD_DA9063 is not set
> > # CONFIG_MFD_DA9150 is not set
> > CONFIG_MFD_MC13XXX=3Dm
> > CONFIG_MFD_MC13XXX_SPI=3Dm
> > CONFIG_MFD_MC13XXX_I2C=3Dm
> > # CONFIG_HTC_PASIC3 is not set
> > CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dm
> > CONFIG_LPC_ICH=3Dm
> > CONFIG_LPC_SCH=3Dy
> > CONFIG_MFD_INTEL_LPSS=3Dy
> > # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> > CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> > CONFIG_MFD_JANZ_CMODIO=3Dm
> > CONFIG_MFD_KEMPLD=3Dm
> > # CONFIG_MFD_88PM800 is not set
> > # CONFIG_MFD_88PM805 is not set
> > CONFIG_MFD_MAX14577=3Dm
> > # CONFIG_MFD_MAX77693 is not set
> > CONFIG_MFD_MAX8907=3Dm
> > # CONFIG_MFD_MT6397 is not set
> > # CONFIG_MFD_MENF21BMC is not set
> > # CONFIG_EZX_PCAP is not set
> > # CONFIG_MFD_RETU is not set
> > CONFIG_MFD_PCF50633=3Dm
> > # CONFIG_PCF50633_ADC is not set
> > CONFIG_PCF50633_GPIO=3Dm
> > CONFIG_UCB1400_CORE=3Dm
> > CONFIG_MFD_RDC321X=3Dy
> > CONFIG_MFD_RTSX_PCI=3Dm
> > CONFIG_MFD_RT5033=3Dm
> > CONFIG_MFD_SI476X_CORE=3Dm
> > CONFIG_MFD_SM501=3Dm
> > CONFIG_MFD_SM501_GPIO=3Dy
> > CONFIG_MFD_SKY81452=3Dm
> > # CONFIG_ABX500_CORE is not set
> > CONFIG_MFD_SYSCON=3Dy
> > # CONFIG_MFD_TI_AM335X_TSCADC is not set
> > # CONFIG_MFD_LP3943 is not set
> > CONFIG_MFD_TI_LMU=3Dm
> > # CONFIG_TPS6105X is not set
> > # CONFIG_TPS65010 is not set
> > # CONFIG_TPS6507X is not set
> > # CONFIG_MFD_TPS65086 is not set
> > CONFIG_MFD_TPS65217=3Dm
> > CONFIG_MFD_TI_LP873X=3Dm
> > CONFIG_MFD_TPS65218=3Dm
> > CONFIG_MFD_TPS65912=3Dy
> > CONFIG_MFD_TPS65912_I2C=3Dm
> > CONFIG_MFD_TPS65912_SPI=3Dy
> > CONFIG_MFD_WL1273_CORE=3Dm
> > CONFIG_MFD_LM3533=3Dm
> > # CONFIG_MFD_TIMBERDALE is not set
> > # CONFIG_MFD_TMIO is not set
> > CONFIG_MFD_VX855=3Dy
> > # CONFIG_MFD_ARIZONA_I2C is not set
> > # CONFIG_MFD_ARIZONA_SPI is not set
> > # CONFIG_MFD_WM831X_SPI is not set
> > CONFIG_MFD_WM8994=3Dm
> > # CONFIG_REGULATOR is not set
> > CONFIG_MEDIA_SUPPORT=3Dm
> > =

> > #
> > # Multimedia core support
> > #
> > CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> > # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> > # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> > CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> > # CONFIG_MEDIA_SDR_SUPPORT is not set
> > CONFIG_MEDIA_RC_SUPPORT=3Dy
> > CONFIG_MEDIA_CEC_SUPPORT=3Dy
> > CONFIG_CEC_CORE=3Dm
> > CONFIG_MEDIA_CEC_RC=3Dy
> > CONFIG_MEDIA_CEC_DEBUG=3Dy
> > CONFIG_MEDIA_CONTROLLER=3Dy
> > CONFIG_VIDEO_DEV=3Dm
> > # CONFIG_VIDEO_V4L2_SUBDEV_API is not set
> > CONFIG_VIDEO_V4L2=3Dm
> > CONFIG_VIDEO_ADV_DEBUG=3Dy
> > # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> > # CONFIG_VIDEO_PCI_SKELETON is not set
> > CONFIG_V4L2_MEM2MEM_DEV=3Dm
> > CONFIG_VIDEOBUF2_CORE=3Dm
> > CONFIG_VIDEOBUF2_MEMOPS=3Dm
> > CONFIG_VIDEOBUF2_DMA_CONTIG=3Dm
> > CONFIG_VIDEOBUF2_VMALLOC=3Dm
> > # CONFIG_TTPCI_EEPROM is not set
> > =

> > #
> > # Media drivers
> > #
> > CONFIG_RC_CORE=3Dm
> > CONFIG_RC_MAP=3Dm
> > CONFIG_RC_DECODERS=3Dy
> > CONFIG_LIRC=3Dm
> > CONFIG_IR_LIRC_CODEC=3Dm
> > # CONFIG_IR_NEC_DECODER is not set
> > CONFIG_IR_RC5_DECODER=3Dm
> > # CONFIG_IR_RC6_DECODER is not set
> > CONFIG_IR_JVC_DECODER=3Dm
> > CONFIG_IR_SONY_DECODER=3Dm
> > # CONFIG_IR_SANYO_DECODER is not set
> > CONFIG_IR_SHARP_DECODER=3Dm
> > # CONFIG_IR_MCE_KBD_DECODER is not set
> > CONFIG_IR_XMP_DECODER=3Dm
> > CONFIG_RC_DEVICES=3Dy
> > # CONFIG_RC_ATI_REMOTE is not set
> > # CONFIG_IR_ENE is not set
> > CONFIG_IR_HIX5HD2=3Dm
> > # CONFIG_IR_IMON is not set
> > # CONFIG_IR_MCEUSB is not set
> > # CONFIG_IR_ITE_CIR is not set
> > # CONFIG_IR_FINTEK is not set
> > # CONFIG_IR_NUVOTON is not set
> > # CONFIG_IR_REDRAT3 is not set
> > CONFIG_IR_SPI=3Dm
> > # CONFIG_IR_STREAMZAP is not set
> > # CONFIG_IR_WINBOND_CIR is not set
> > # CONFIG_IR_IGORPLUGUSB is not set
> > # CONFIG_IR_IGUANA is not set
> > # CONFIG_IR_TTUSBIR is not set
> > CONFIG_RC_LOOPBACK=3Dm
> > # CONFIG_IR_GPIO_CIR is not set
> > CONFIG_IR_SERIAL=3Dm
> > CONFIG_IR_SERIAL_TRANSMITTER=3Dy
> > CONFIG_IR_SIR=3Dm
> > # CONFIG_MEDIA_PCI_SUPPORT is not set
> > # CONFIG_V4L_PLATFORM_DRIVERS is not set
> > # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> > CONFIG_V4L_TEST_DRIVERS=3Dy
> > CONFIG_VIDEO_VIVID=3Dm
> > # CONFIG_VIDEO_VIVID_CEC is not set
> > CONFIG_VIDEO_VIVID_MAX_DEVS=3D64
> > CONFIG_VIDEO_VIM2M=3Dm
> > # CONFIG_CEC_PLATFORM_DRIVERS is not set
> > =

> > #
> > # Supported MMC/SDIO adapters
> > #
> > # CONFIG_RADIO_ADAPTERS is not set
> > CONFIG_VIDEO_V4L2_TPG=3Dm
> > =

> > #
> > # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> > #
> > CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> > CONFIG_MEDIA_ATTACH=3Dy
> > CONFIG_VIDEO_IR_I2C=3Dm
> > =

> > #
> > # Audio decoders, processors and mixers
> > #
> > =

> > #
> > # RDS decoders
> > #
> > =

> > #
> > # Video decoders
> > #
> > =

> > #
> > # Video and audio decoders
> > #
> > =

> > #
> > # Video encoders
> > #
> > =

> > #
> > # Camera sensor devices
> > #
> > =

> > #
> > # Flash devices
> > #
> > =

> > #
> > # Video improvement chips
> > #
> > =

> > #
> > # Audio/Video compression chips
> > #
> > =

> > #
> > # Miscellaneous helper chips
> > #
> > =

> > #
> > # Sensors used on soc_camera driver
> > #
> > CONFIG_MEDIA_TUNER=3Dm
> > CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> > CONFIG_MEDIA_TUNER_TDA8290=3Dm
> > CONFIG_MEDIA_TUNER_TDA827X=3Dm
> > CONFIG_MEDIA_TUNER_TDA18271=3Dm
> > CONFIG_MEDIA_TUNER_TDA9887=3Dm
> > CONFIG_MEDIA_TUNER_TEA5761=3Dm
> > CONFIG_MEDIA_TUNER_TEA5767=3Dm
> > CONFIG_MEDIA_TUNER_MT20XX=3Dm
> > CONFIG_MEDIA_TUNER_XC2028=3Dm
> > CONFIG_MEDIA_TUNER_XC5000=3Dm
> > CONFIG_MEDIA_TUNER_XC4000=3Dm
> > CONFIG_MEDIA_TUNER_MC44S803=3Dm
> > =

> > #
> > # Tools to develop new frontends
> > #
> > =

> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_INTEL_GTT=3Dm
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=3D16
> > # CONFIG_VGA_SWITCHEROO is not set
> > CONFIG_DRM=3Dm
> > CONFIG_DRM_MIPI_DSI=3Dy
> > # CONFIG_DRM_DP_AUX_CHARDEV is not set
> > # CONFIG_DRM_DEBUG_MM_SELFTEST is not set
> > CONFIG_DRM_KMS_HELPER=3Dm
> > CONFIG_DRM_KMS_FB_HELPER=3Dy
> > CONFIG_DRM_FBDEV_EMULATION=3Dy
> > CONFIG_DRM_FBDEV_OVERALLOC=3D100
> > # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> > CONFIG_DRM_TTM=3Dm
> > CONFIG_DRM_VM=3Dy
> > =

> > #
> > # I2C encoder or helper chips
> > #
> > # CONFIG_DRM_I2C_CH7006 is not set
> > # CONFIG_DRM_I2C_SIL164 is not set
> > CONFIG_DRM_I2C_NXP_TDA998X=3Dm
> > CONFIG_DRM_RADEON=3Dm
> > # CONFIG_DRM_RADEON_USERPTR is not set
> > CONFIG_DRM_AMDGPU=3Dm
> > CONFIG_DRM_AMDGPU_SI=3Dy
> > CONFIG_DRM_AMDGPU_CIK=3Dy
> > # CONFIG_DRM_AMDGPU_USERPTR is not set
> > CONFIG_DRM_AMDGPU_GART_DEBUGFS=3Dy
> > =

> > #
> > # ACP (Audio CoProcessor) Configuration
> > #
> > # CONFIG_DRM_AMD_ACP is not set
> > CONFIG_DRM_NOUVEAU=3Dm
> > CONFIG_NOUVEAU_DEBUG=3D5
> > CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> > CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
> > CONFIG_DRM_I915=3Dm
> > # CONFIG_DRM_I915_ALPHA_SUPPORT is not set
> > CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> > # CONFIG_DRM_I915_COMPRESS_ERROR is not set
> > CONFIG_DRM_I915_USERPTR=3Dy
> > CONFIG_DRM_VGEM=3Dm
> > CONFIG_DRM_VMWGFX=3Dm
> > # CONFIG_DRM_VMWGFX_FBCON is not set
> > CONFIG_DRM_GMA500=3Dm
> > # CONFIG_DRM_GMA600 is not set
> > CONFIG_DRM_GMA3600=3Dy
> > # CONFIG_DRM_UDL is not set
> > # CONFIG_DRM_AST is not set
> > CONFIG_DRM_MGAG200=3Dm
> > # CONFIG_DRM_CIRRUS_QEMU is not set
> > CONFIG_DRM_QXL=3Dm
> > CONFIG_DRM_BOCHS=3Dm
> > CONFIG_DRM_VIRTIO_GPU=3Dm
> > CONFIG_DRM_PANEL=3Dy
> > =

> > #
> > # Display Panels
> > #
> > CONFIG_DRM_BRIDGE=3Dy
> > =

> > #
> > # Display Interface Bridges
> > #
> > # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> > CONFIG_DRM_HISI_HIBMC=3Dm
> > # CONFIG_DRM_TINYDRM is not set
> > CONFIG_DRM_LEGACY=3Dy
> > CONFIG_DRM_TDFX=3Dm
> > CONFIG_DRM_R128=3Dm
> > CONFIG_DRM_MGA=3Dm
> > # CONFIG_DRM_VIA is not set
> > # CONFIG_DRM_SAVAGE is not set
> > # CONFIG_DRM_LIB_RANDOM is not set
> > =

> > #
> > # Frame buffer Devices
> > #
> > CONFIG_FB=3Dm
> > # CONFIG_FIRMWARE_EDID is not set
> > CONFIG_FB_CMDLINE=3Dy
> > CONFIG_FB_NOTIFY=3Dy
> > CONFIG_FB_DDC=3Dm
> > # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> > CONFIG_FB_CFB_FILLRECT=3Dm
> > CONFIG_FB_CFB_COPYAREA=3Dm
> > CONFIG_FB_CFB_IMAGEBLIT=3Dm
> > # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> > CONFIG_FB_SYS_FILLRECT=3Dm
> > CONFIG_FB_SYS_COPYAREA=3Dm
> > CONFIG_FB_SYS_IMAGEBLIT=3Dm
> > # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> > # CONFIG_FB_FOREIGN_ENDIAN is not set
> > CONFIG_FB_SYS_FOPS=3Dm
> > CONFIG_FB_DEFERRED_IO=3Dy
> > CONFIG_FB_HECUBA=3Dm
> > CONFIG_FB_SVGALIB=3Dm
> > # CONFIG_FB_MACMODES is not set
> > CONFIG_FB_BACKLIGHT=3Dy
> > CONFIG_FB_MODE_HELPERS=3Dy
> > CONFIG_FB_TILEBLITTING=3Dy
> > =

> > #
> > # Frame buffer hardware drivers
> > #
> > CONFIG_FB_CIRRUS=3Dm
> > # CONFIG_FB_PM2 is not set
> > CONFIG_FB_CYBER2000=3Dm
> > # CONFIG_FB_CYBER2000_DDC is not set
> > CONFIG_FB_ARC=3Dm
> > # CONFIG_FB_VGA16 is not set
> > CONFIG_FB_N411=3Dm
> > # CONFIG_FB_HGA is not set
> > CONFIG_FB_OPENCORES=3Dm
> > # CONFIG_FB_S1D13XXX is not set
> > # CONFIG_FB_NVIDIA is not set
> > CONFIG_FB_RIVA=3Dm
> > CONFIG_FB_RIVA_I2C=3Dy
> > # CONFIG_FB_RIVA_DEBUG is not set
> > CONFIG_FB_RIVA_BACKLIGHT=3Dy
> > CONFIG_FB_I740=3Dm
> > # CONFIG_FB_LE80578 is not set
> > # CONFIG_FB_MATROX is not set
> > CONFIG_FB_RADEON=3Dm
> > CONFIG_FB_RADEON_I2C=3Dy
> > # CONFIG_FB_RADEON_BACKLIGHT is not set
> > # CONFIG_FB_RADEON_DEBUG is not set
> > # CONFIG_FB_ATY128 is not set
> > # CONFIG_FB_ATY is not set
> > CONFIG_FB_S3=3Dm
> > # CONFIG_FB_S3_DDC is not set
> > # CONFIG_FB_SAVAGE is not set
> > CONFIG_FB_SIS=3Dm
> > # CONFIG_FB_SIS_300 is not set
> > CONFIG_FB_SIS_315=3Dy
> > CONFIG_FB_VIA=3Dm
> > CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
> > CONFIG_FB_VIA_X_COMPATIBILITY=3Dy
> > # CONFIG_FB_NEOMAGIC is not set
> > CONFIG_FB_KYRO=3Dm
> > CONFIG_FB_3DFX=3Dm
> > CONFIG_FB_3DFX_ACCEL=3Dy
> > CONFIG_FB_3DFX_I2C=3Dy
> > CONFIG_FB_VOODOO1=3Dm
> > CONFIG_FB_VT8623=3Dm
> > CONFIG_FB_TRIDENT=3Dm
> > CONFIG_FB_ARK=3Dm
> > CONFIG_FB_PM3=3Dm
> > CONFIG_FB_CARMINE=3Dm
> > CONFIG_FB_CARMINE_DRAM_EVAL=3Dy
> > # CONFIG_CARMINE_DRAM_CUSTOM is not set
> > # CONFIG_FB_GEODE is not set
> > CONFIG_FB_SM501=3Dm
> > # CONFIG_FB_IBM_GXT4500 is not set
> > CONFIG_FB_GOLDFISH=3Dm
> > CONFIG_FB_VIRTUAL=3Dm
> > CONFIG_FB_METRONOME=3Dm
> > CONFIG_FB_MB862XX=3Dm
> > CONFIG_FB_MB862XX_PCI_GDC=3Dy
> > CONFIG_FB_MB862XX_I2C=3Dy
> > # CONFIG_FB_BROADSHEET is not set
> > CONFIG_FB_AUO_K190X=3Dm
> > CONFIG_FB_AUO_K1900=3Dm
> > CONFIG_FB_AUO_K1901=3Dm
> > # CONFIG_FB_SM712 is not set
> > CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> > CONFIG_LCD_CLASS_DEVICE=3Dy
> > CONFIG_LCD_L4F00242T03=3Dy
> > CONFIG_LCD_LMS283GF05=3Dy
> > CONFIG_LCD_LTV350QV=3Dm
> > CONFIG_LCD_ILI922X=3Dm
> > CONFIG_LCD_ILI9320=3Dm
> > # CONFIG_LCD_TDO24M is not set
> > CONFIG_LCD_VGG2432A4=3Dm
> > # CONFIG_LCD_PLATFORM is not set
> > # CONFIG_LCD_S6E63M0 is not set
> > CONFIG_LCD_LD9040=3Dm
> > CONFIG_LCD_AMS369FG06=3Dm
> > CONFIG_LCD_LMS501KF03=3Dy
> > CONFIG_LCD_HX8357=3Dy
> > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm
> > # CONFIG_BACKLIGHT_GENERIC is not set
> > # CONFIG_BACKLIGHT_LM3533 is not set
> > # CONFIG_BACKLIGHT_DA9052 is not set
> > # CONFIG_BACKLIGHT_APPLE is not set
> > CONFIG_BACKLIGHT_PM8941_WLED=3Dm
> > CONFIG_BACKLIGHT_SAHARA=3Dm
> > CONFIG_BACKLIGHT_ADP8860=3Dm
> > # CONFIG_BACKLIGHT_ADP8870 is not set
> > CONFIG_BACKLIGHT_PCF50633=3Dm
> > # CONFIG_BACKLIGHT_LM3639 is not set
> > CONFIG_BACKLIGHT_OT200=3Dm
> > CONFIG_BACKLIGHT_SKY81452=3Dm
> > CONFIG_BACKLIGHT_TPS65217=3Dm
> > # CONFIG_BACKLIGHT_GPIO is not set
> > # CONFIG_BACKLIGHT_LV5207LP is not set
> > CONFIG_BACKLIGHT_BD6107=3Dm
> > # CONFIG_BACKLIGHT_ARCXCNN is not set
> > CONFIG_VGASTATE=3Dm
> > CONFIG_HDMI=3Dy
> > =

> > #
> > # Console display driver support
> > #
> > CONFIG_VGA_CONSOLE=3Dy
> > CONFIG_VGACON_SOFT_SCROLLBACK=3Dy
> > CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=3D64
> > CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT=3Dy
> > CONFIG_DUMMY_CONSOLE=3Dy
> > CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> > CONFIG_DUMMY_CONSOLE_ROWS=3D25
> > CONFIG_FRAMEBUFFER_CONSOLE=3Dm
> > CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> > CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> > CONFIG_LOGO=3Dy
> > # CONFIG_LOGO_LINUX_MONO is not set
> > # CONFIG_LOGO_LINUX_VGA16 is not set
> > # CONFIG_LOGO_LINUX_CLUT224 is not set
> > CONFIG_SOUND=3Dy
> > CONFIG_SOUND_OSS_CORE=3Dy
> > # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> > CONFIG_SND=3Dm
> > CONFIG_SND_TIMER=3Dm
> > CONFIG_SND_PCM=3Dm
> > CONFIG_SND_PCM_ELD=3Dy
> > CONFIG_SND_PCM_IEC958=3Dy
> > CONFIG_SND_DMAENGINE_PCM=3Dm
> > CONFIG_SND_HWDEP=3Dm
> > CONFIG_SND_RAWMIDI=3Dm
> > CONFIG_SND_JACK=3Dy
> > CONFIG_SND_JACK_INPUT_DEV=3Dy
> > # CONFIG_SND_SEQUENCER is not set
> > CONFIG_SND_OSSEMUL=3Dy
> > # CONFIG_SND_MIXER_OSS is not set
> > CONFIG_SND_PCM_OSS=3Dm
> > # CONFIG_SND_PCM_OSS_PLUGINS is not set
> > CONFIG_SND_PCM_TIMER=3Dy
> > # CONFIG_SND_HRTIMER is not set
> > # CONFIG_SND_DYNAMIC_MINORS is not set
> > CONFIG_SND_SUPPORT_OLD_API=3Dy
> > CONFIG_SND_PROC_FS=3Dy
> > # CONFIG_SND_VERBOSE_PROCFS is not set
> > CONFIG_SND_VERBOSE_PRINTK=3Dy
> > CONFIG_SND_DEBUG=3Dy
> > CONFIG_SND_DEBUG_VERBOSE=3Dy
> > CONFIG_SND_VMASTER=3Dy
> > CONFIG_SND_DMA_SGBUF=3Dy
> > # CONFIG_SND_RAWMIDI_SEQ is not set
> > # CONFIG_SND_OPL3_LIB_SEQ is not set
> > # CONFIG_SND_OPL4_LIB_SEQ is not set
> > # CONFIG_SND_SBAWE_SEQ is not set
> > # CONFIG_SND_EMU10K1_SEQ is not set
> > CONFIG_SND_MPU401_UART=3Dm
> > CONFIG_SND_OPL3_LIB=3Dm
> > CONFIG_SND_VX_LIB=3Dm
> > CONFIG_SND_AC97_CODEC=3Dm
> > CONFIG_SND_DRIVERS=3Dy
> > CONFIG_SND_PCSP=3Dm
> > # CONFIG_SND_DUMMY is not set
> > # CONFIG_SND_ALOOP is not set
> > # CONFIG_SND_MTPAV is not set
> > CONFIG_SND_MTS64=3Dm
> > CONFIG_SND_SERIAL_U16550=3Dm
> > # CONFIG_SND_MPU401 is not set
> > CONFIG_SND_PORTMAN2X4=3Dm
> > # CONFIG_SND_AC97_POWER_SAVE is not set
> > CONFIG_SND_SB_COMMON=3Dm
> > CONFIG_SND_SB16_DSP=3Dm
> > CONFIG_SND_PCI=3Dy
> > CONFIG_SND_AD1889=3Dm
> > # CONFIG_SND_ALS300 is not set
> > CONFIG_SND_ALS4000=3Dm
> > CONFIG_SND_ALI5451=3Dm
> > CONFIG_SND_ASIHPI=3Dm
> > CONFIG_SND_ATIIXP=3Dm
> > CONFIG_SND_ATIIXP_MODEM=3Dm
> > CONFIG_SND_AU8810=3Dm
> > CONFIG_SND_AU8820=3Dm
> > CONFIG_SND_AU8830=3Dm
> > CONFIG_SND_AW2=3Dm
> > CONFIG_SND_AZT3328=3Dm
> > CONFIG_SND_BT87X=3Dm
> > # CONFIG_SND_BT87X_OVERCLOCK is not set
> > CONFIG_SND_CA0106=3Dm
> > CONFIG_SND_CMIPCI=3Dm
> > CONFIG_SND_OXYGEN_LIB=3Dm
> > CONFIG_SND_OXYGEN=3Dm
> > CONFIG_SND_CS4281=3Dm
> > # CONFIG_SND_CS46XX is not set
> > CONFIG_SND_CS5530=3Dm
> > CONFIG_SND_CS5535AUDIO=3Dm
> > # CONFIG_SND_CTXFI is not set
> > CONFIG_SND_DARLA20=3Dm
> > CONFIG_SND_GINA20=3Dm
> > CONFIG_SND_LAYLA20=3Dm
> > CONFIG_SND_DARLA24=3Dm
> > CONFIG_SND_GINA24=3Dm
> > CONFIG_SND_LAYLA24=3Dm
> > CONFIG_SND_MONA=3Dm
> > CONFIG_SND_MIA=3Dm
> > CONFIG_SND_ECHO3G=3Dm
> > CONFIG_SND_INDIGO=3Dm
> > # CONFIG_SND_INDIGOIO is not set
> > CONFIG_SND_INDIGODJ=3Dm
> > CONFIG_SND_INDIGOIOX=3Dm
> > CONFIG_SND_INDIGODJX=3Dm
> > CONFIG_SND_EMU10K1=3Dm
> > # CONFIG_SND_EMU10K1X is not set
> > # CONFIG_SND_ENS1370 is not set
> > CONFIG_SND_ENS1371=3Dm
> > # CONFIG_SND_ES1938 is not set
> > # CONFIG_SND_ES1968 is not set
> > # CONFIG_SND_FM801 is not set
> > CONFIG_SND_HDSP=3Dm
> > CONFIG_SND_HDSPM=3Dm
> > CONFIG_SND_ICE1712=3Dm
> > CONFIG_SND_ICE1724=3Dm
> > CONFIG_SND_INTEL8X0=3Dm
> > # CONFIG_SND_INTEL8X0M is not set
> > CONFIG_SND_KORG1212=3Dm
> > CONFIG_SND_LOLA=3Dm
> > # CONFIG_SND_LX6464ES is not set
> > CONFIG_SND_MAESTRO3=3Dm
> > # CONFIG_SND_MAESTRO3_INPUT is not set
> > CONFIG_SND_MIXART=3Dm
> > CONFIG_SND_NM256=3Dm
> > # CONFIG_SND_PCXHR is not set
> > # CONFIG_SND_RIPTIDE is not set
> > # CONFIG_SND_RME32 is not set
> > # CONFIG_SND_RME96 is not set
> > # CONFIG_SND_RME9652 is not set
> > # CONFIG_SND_SIS7019 is not set
> > CONFIG_SND_SONICVIBES=3Dm
> > # CONFIG_SND_TRIDENT is not set
> > # CONFIG_SND_VIA82XX is not set
> > CONFIG_SND_VIA82XX_MODEM=3Dm
> > # CONFIG_SND_VIRTUOSO is not set
> > CONFIG_SND_VX222=3Dm
> > CONFIG_SND_YMFPCI=3Dm
> > =

> > #
> > # HD-Audio
> > #
> > # CONFIG_SND_HDA_INTEL is not set
> > CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> > CONFIG_SND_SPI=3Dy
> > # CONFIG_SND_FIREWIRE is not set
> > CONFIG_SND_PCMCIA=3Dy
> > CONFIG_SND_VXPOCKET=3Dm
> > CONFIG_SND_PDAUDIOCF=3Dm
> > CONFIG_SND_SOC=3Dm
> > CONFIG_SND_SOC_AC97_BUS=3Dy
> > CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> > CONFIG_SND_SOC_AMD_ACP=3Dm
> > # CONFIG_SND_ATMEL_SOC is not set
> > # CONFIG_SND_DESIGNWARE_I2S is not set
> > =

> > #
> > # SoC Audio for Freescale CPUs
> > #
> > =

> > #
> > # Common SoC Audio options for Freescale CPUs:
> > #
> > CONFIG_SND_SOC_FSL_ASRC=3Dm
> > CONFIG_SND_SOC_FSL_SAI=3Dm
> > # CONFIG_SND_SOC_FSL_SSI is not set
> > # CONFIG_SND_SOC_FSL_SPDIF is not set
> > CONFIG_SND_SOC_FSL_ESAI=3Dm
> > # CONFIG_SND_SOC_IMX_AUDMUX is not set
> > # CONFIG_SND_I2S_HI6210_I2S is not set
> > CONFIG_SND_SOC_IMG=3Dy
> > CONFIG_SND_SOC_IMG_I2S_IN=3Dm
> > CONFIG_SND_SOC_IMG_I2S_OUT=3Dm
> > # CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
> > CONFIG_SND_SOC_IMG_SPDIF_IN=3Dm
> > CONFIG_SND_SOC_IMG_SPDIF_OUT=3Dm
> > CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=3Dm
> > # CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH is not set
> > # CONFIG_SND_SOC_INTEL_BXT_RT298_MACH is not set
> > # CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH is not set
> > # CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH is not set
> > # CONFIG_SND_SOC_INTEL_SKL_RT286_MACH is not set
> > CONFIG_SND_SOC_XTFPGA_I2S=3Dm
> > # CONFIG_ZX_TDM is not set
> > CONFIG_SND_SOC_I2C_AND_SPI=3Dm
> > =

> > #
> > # CODEC drivers
> > #
> > CONFIG_SND_SOC_AC97_CODEC=3Dm
> > CONFIG_SND_SOC_ADAU_UTILS=3Dm
> > CONFIG_SND_SOC_ADAU1701=3Dm
> > CONFIG_SND_SOC_ADAU17X1=3Dm
> > CONFIG_SND_SOC_ADAU1761=3Dm
> > CONFIG_SND_SOC_ADAU1761_I2C=3Dm
> > CONFIG_SND_SOC_ADAU1761_SPI=3Dm
> > CONFIG_SND_SOC_ADAU7002=3Dm
> > CONFIG_SND_SOC_AK4104=3Dm
> > CONFIG_SND_SOC_AK4554=3Dm
> > CONFIG_SND_SOC_AK4613=3Dm
> > CONFIG_SND_SOC_AK4642=3Dm
> > CONFIG_SND_SOC_AK5386=3Dm
> > CONFIG_SND_SOC_ALC5623=3Dm
> > CONFIG_SND_SOC_BT_SCO=3Dm
> > CONFIG_SND_SOC_CS35L32=3Dm
> > CONFIG_SND_SOC_CS35L33=3Dm
> > CONFIG_SND_SOC_CS35L34=3Dm
> > CONFIG_SND_SOC_CS35L35=3Dm
> > CONFIG_SND_SOC_CS42L42=3Dm
> > CONFIG_SND_SOC_CS42L51=3Dm
> > CONFIG_SND_SOC_CS42L51_I2C=3Dm
> > CONFIG_SND_SOC_CS42L52=3Dm
> > CONFIG_SND_SOC_CS42L56=3Dm
> > CONFIG_SND_SOC_CS42L73=3Dm
> > CONFIG_SND_SOC_CS4265=3Dm
> > CONFIG_SND_SOC_CS4270=3Dm
> > CONFIG_SND_SOC_CS4271=3Dm
> > CONFIG_SND_SOC_CS4271_I2C=3Dm
> > CONFIG_SND_SOC_CS4271_SPI=3Dm
> > CONFIG_SND_SOC_CS42XX8=3Dm
> > CONFIG_SND_SOC_CS42XX8_I2C=3Dm
> > CONFIG_SND_SOC_CS4349=3Dm
> > CONFIG_SND_SOC_CS53L30=3Dm
> > CONFIG_SND_SOC_DIO2125=3Dm
> > CONFIG_SND_SOC_HDMI_CODEC=3Dm
> > CONFIG_SND_SOC_ES7134=3Dm
> > CONFIG_SND_SOC_ES8328=3Dm
> > CONFIG_SND_SOC_ES8328_I2C=3Dm
> > CONFIG_SND_SOC_ES8328_SPI=3Dm
> > CONFIG_SND_SOC_GTM601=3Dm
> > CONFIG_SND_SOC_INNO_RK3036=3Dm
> > CONFIG_SND_SOC_MAX98504=3Dm
> > CONFIG_SND_SOC_MAX98927=3Dm
> > CONFIG_SND_SOC_MAX9860=3Dm
> > # CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
> > CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dm
> > CONFIG_SND_SOC_PCM1681=3Dm
> > CONFIG_SND_SOC_PCM179X=3Dm
> > CONFIG_SND_SOC_PCM179X_I2C=3Dm
> > CONFIG_SND_SOC_PCM179X_SPI=3Dm
> > CONFIG_SND_SOC_PCM3168A=3Dm
> > CONFIG_SND_SOC_PCM3168A_I2C=3Dm
> > CONFIG_SND_SOC_PCM3168A_SPI=3Dm
> > CONFIG_SND_SOC_PCM512x=3Dm
> > CONFIG_SND_SOC_PCM512x_I2C=3Dm
> > CONFIG_SND_SOC_PCM512x_SPI=3Dm
> > CONFIG_SND_SOC_RL6231=3Dm
> > CONFIG_SND_SOC_RT5616=3Dm
> > CONFIG_SND_SOC_RT5631=3Dm
> > # CONFIG_SND_SOC_RT5677_SPI is not set
> > CONFIG_SND_SOC_SGTL5000=3Dm
> > CONFIG_SND_SOC_SIGMADSP=3Dm
> > CONFIG_SND_SOC_SIGMADSP_I2C=3Dm
> > CONFIG_SND_SOC_SIGMADSP_REGMAP=3Dm
> > CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dm
> > CONFIG_SND_SOC_SPDIF=3Dm
> > CONFIG_SND_SOC_SSM2602=3Dm
> > CONFIG_SND_SOC_SSM2602_SPI=3Dm
> > CONFIG_SND_SOC_SSM2602_I2C=3Dm
> > CONFIG_SND_SOC_SSM4567=3Dm
> > CONFIG_SND_SOC_STA32X=3Dm
> > CONFIG_SND_SOC_STA350=3Dm
> > CONFIG_SND_SOC_STI_SAS=3Dm
> > CONFIG_SND_SOC_TAS2552=3Dm
> > CONFIG_SND_SOC_TAS5086=3Dm
> > CONFIG_SND_SOC_TAS571X=3Dm
> > CONFIG_SND_SOC_TAS5720=3Dm
> > CONFIG_SND_SOC_TFA9879=3Dm
> > CONFIG_SND_SOC_TLV320AIC23=3Dm
> > CONFIG_SND_SOC_TLV320AIC23_I2C=3Dm
> > CONFIG_SND_SOC_TLV320AIC23_SPI=3Dm
> > CONFIG_SND_SOC_TLV320AIC31XX=3Dm
> > CONFIG_SND_SOC_TLV320AIC3X=3Dm
> > CONFIG_SND_SOC_TS3A227E=3Dm
> > CONFIG_SND_SOC_WM8510=3Dm
> > CONFIG_SND_SOC_WM8523=3Dm
> > CONFIG_SND_SOC_WM8580=3Dm
> > CONFIG_SND_SOC_WM8711=3Dm
> > CONFIG_SND_SOC_WM8728=3Dm
> > CONFIG_SND_SOC_WM8731=3Dm
> > CONFIG_SND_SOC_WM8737=3Dm
> > CONFIG_SND_SOC_WM8741=3Dm
> > CONFIG_SND_SOC_WM8750=3Dm
> > CONFIG_SND_SOC_WM8753=3Dm
> > CONFIG_SND_SOC_WM8770=3Dm
> > CONFIG_SND_SOC_WM8776=3Dm
> > CONFIG_SND_SOC_WM8804=3Dm
> > CONFIG_SND_SOC_WM8804_I2C=3Dm
> > CONFIG_SND_SOC_WM8804_SPI=3Dm
> > CONFIG_SND_SOC_WM8903=3Dm
> > CONFIG_SND_SOC_WM8960=3Dm
> > CONFIG_SND_SOC_WM8962=3Dm
> > CONFIG_SND_SOC_WM8974=3Dm
> > CONFIG_SND_SOC_WM8978=3Dm
> > CONFIG_SND_SOC_WM8985=3Dm
> > CONFIG_SND_SOC_NAU8540=3Dm
> > CONFIG_SND_SOC_NAU8810=3Dm
> > CONFIG_SND_SOC_NAU8824=3Dm
> > CONFIG_SND_SOC_TPA6130A2=3Dm
> > CONFIG_SND_SIMPLE_CARD_UTILS=3Dm
> > CONFIG_SND_SIMPLE_CARD=3Dm
> > CONFIG_SND_X86=3Dy
> > CONFIG_HDMI_LPE_AUDIO=3Dm
> > CONFIG_AC97_BUS=3Dm
> > =

> > #
> > # HID support
> > #
> > CONFIG_HID=3Dm
> > # CONFIG_HID_BATTERY_STRENGTH is not set
> > CONFIG_HIDRAW=3Dy
> > CONFIG_UHID=3Dm
> > # CONFIG_HID_GENERIC is not set
> > =

> > #
> > # Special HID drivers
> > #
> > # CONFIG_HID_A4TECH is not set
> > CONFIG_HID_ACRUX=3Dm
> > # CONFIG_HID_ACRUX_FF is not set
> > CONFIG_HID_APPLE=3Dm
> > # CONFIG_HID_ASUS is not set
> > CONFIG_HID_AUREAL=3Dm
> > CONFIG_HID_BELKIN=3Dm
> > CONFIG_HID_CHERRY=3Dm
> > CONFIG_HID_CHICONY=3Dm
> > CONFIG_HID_PRODIKEYS=3Dm
> > CONFIG_HID_CMEDIA=3Dm
> > CONFIG_HID_CYPRESS=3Dm
> > # CONFIG_HID_DRAGONRISE is not set
> > CONFIG_HID_EMS_FF=3Dm
> > CONFIG_HID_ELECOM=3Dm
> > CONFIG_HID_EZKEY=3Dm
> > CONFIG_HID_GEMBIRD=3Dm
> > # CONFIG_HID_GFRM is not set
> > CONFIG_HID_KEYTOUCH=3Dm
> > CONFIG_HID_KYE=3Dm
> > CONFIG_HID_WALTOP=3Dm
> > CONFIG_HID_GYRATION=3Dm
> > # CONFIG_HID_ICADE is not set
> > # CONFIG_HID_TWINHAN is not set
> > CONFIG_HID_KENSINGTON=3Dm
> > # CONFIG_HID_LCPOWER is not set
> > CONFIG_HID_LED=3Dm
> > # CONFIG_HID_LENOVO is not set
> > # CONFIG_HID_LOGITECH is not set
> > # CONFIG_HID_MAGICMOUSE is not set
> > CONFIG_HID_MAYFLASH=3Dm
> > CONFIG_HID_MICROSOFT=3Dm
> > # CONFIG_HID_MONTEREY is not set
> > CONFIG_HID_MULTITOUCH=3Dm
> > # CONFIG_HID_NTI is not set
> > CONFIG_HID_ORTEK=3Dm
> > CONFIG_HID_PANTHERLORD=3Dm
> > CONFIG_PANTHERLORD_FF=3Dy
> > CONFIG_HID_PETALYNX=3Dm
> > # CONFIG_HID_PICOLCD is not set
> > CONFIG_HID_PLANTRONICS=3Dm
> > CONFIG_HID_PRIMAX=3Dm
> > CONFIG_HID_SAITEK=3Dm
> > CONFIG_HID_SAMSUNG=3Dm
> > CONFIG_HID_SPEEDLINK=3Dm
> > CONFIG_HID_STEELSERIES=3Dm
> > CONFIG_HID_SUNPLUS=3Dm
> > # CONFIG_HID_RMI is not set
> > CONFIG_HID_GREENASIA=3Dm
> > CONFIG_GREENASIA_FF=3Dy
> > # CONFIG_HID_SMARTJOYPLUS is not set
> > CONFIG_HID_TIVO=3Dm
> > CONFIG_HID_TOPSEED=3Dm
> > CONFIG_HID_THINGM=3Dm
> > # CONFIG_HID_THRUSTMASTER is not set
> > CONFIG_HID_UDRAW_PS3=3Dm
> > # CONFIG_HID_WACOM is not set
> > CONFIG_HID_WIIMOTE=3Dm
> > CONFIG_HID_XINMO=3Dm
> > CONFIG_HID_ZEROPLUS=3Dm
> > CONFIG_ZEROPLUS_FF=3Dy
> > CONFIG_HID_ZYDACRON=3Dm
> > # CONFIG_HID_SENSOR_HUB is not set
> > # CONFIG_HID_ALPS is not set
> > =

> > #
> > # I2C HID support
> > #
> > CONFIG_I2C_HID=3Dm
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > # CONFIG_USB is not set
> > CONFIG_USB_PCI=3Dy
> > =

> > #
> > # USB port drivers
> > #
> > =

> > #
> > # USB Physical Layer drivers
> > #
> > # CONFIG_USB_PHY is not set
> > # CONFIG_NOP_USB_XCEIV is not set
> > # CONFIG_USB_GPIO_VBUS is not set
> > # CONFIG_USB_GADGET is not set
> > =

> > #
> > # USB Power Delivery and Type-C drivers
> > #
> > # CONFIG_USB_LED_TRIG is not set
> > # CONFIG_USB_ULPI_BUS is not set
> > CONFIG_UWB=3Dm
> > CONFIG_UWB_WHCI=3Dm
> > CONFIG_MMC=3Dm
> > # CONFIG_MMC_DEBUG is not set
> > # CONFIG_MMC_BLOCK is not set
> > # CONFIG_SDIO_UART is not set
> > CONFIG_MMC_TEST=3Dm
> > =

> > #
> > # MMC/SD/SDIO Host Controller Drivers
> > #
> > # CONFIG_MMC_SDHCI is not set
> > CONFIG_MMC_WBSD=3Dm
> > # CONFIG_MMC_TIFM_SD is not set
> > CONFIG_MMC_GOLDFISH=3Dm
> > # CONFIG_MMC_SDRICOH_CS is not set
> > # CONFIG_MMC_CB710 is not set
> > # CONFIG_MMC_VIA_SDMMC is not set
> > CONFIG_MMC_USDHI6ROL0=3Dm
> > CONFIG_MMC_REALTEK_PCI=3Dm
> > CONFIG_MMC_TOSHIBA_PCI=3Dm
> > CONFIG_MMC_MTK=3Dm
> > # CONFIG_MEMSTICK is not set
> > CONFIG_NEW_LEDS=3Dy
> > CONFIG_LEDS_CLASS=3Dm
> > CONFIG_LEDS_CLASS_FLASH=3Dm
> > # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> > =

> > #
> > # LED drivers
> > #
> > CONFIG_LEDS_LM3530=3Dm
> > # CONFIG_LEDS_LM3533 is not set
> > CONFIG_LEDS_LM3642=3Dm
> > CONFIG_LEDS_NET48XX=3Dm
> > # CONFIG_LEDS_WRAP is not set
> > CONFIG_LEDS_PCA9532=3Dm
> > # CONFIG_LEDS_PCA9532_GPIO is not set
> > # CONFIG_LEDS_GPIO is not set
> > CONFIG_LEDS_LP3944=3Dm
> > CONFIG_LEDS_LP3952=3Dm
> > CONFIG_LEDS_LP55XX_COMMON=3Dm
> > CONFIG_LEDS_LP5521=3Dm
> > CONFIG_LEDS_LP5523=3Dm
> > # CONFIG_LEDS_LP5562 is not set
> > CONFIG_LEDS_LP8501=3Dm
> > # CONFIG_LEDS_LP8860 is not set
> > CONFIG_LEDS_CLEVO_MAIL=3Dm
> > CONFIG_LEDS_PCA955X=3Dm
> > CONFIG_LEDS_PCA963X=3Dm
> > CONFIG_LEDS_DA9052=3Dm
> > # CONFIG_LEDS_DAC124S085 is not set
> > CONFIG_LEDS_BD2802=3Dm
> > # CONFIG_LEDS_INTEL_SS4200 is not set
> > CONFIG_LEDS_LT3593=3Dm
> > # CONFIG_LEDS_MC13783 is not set
> > CONFIG_LEDS_TCA6507=3Dm
> > # CONFIG_LEDS_TLC591XX is not set
> > # CONFIG_LEDS_LM355x is not set
> > CONFIG_LEDS_OT200=3Dm
> > =

> > #
> > # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
> > #
> > # CONFIG_LEDS_BLINKM is not set
> > CONFIG_LEDS_USER=3Dm
> > # CONFIG_LEDS_NIC78BX is not set
> > =

> > #
> > # LED Triggers
> > #
> > CONFIG_LEDS_TRIGGERS=3Dy
> > # CONFIG_LEDS_TRIGGER_TIMER is not set
> > # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> > # CONFIG_LEDS_TRIGGER_DISK is not set
> > # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> > # CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
> > # CONFIG_LEDS_TRIGGER_CPU is not set
> > CONFIG_LEDS_TRIGGER_GPIO=3Dy
> > CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> > =

> > #
> > # iptables trigger is under Netfilter config (LED target)
> > #
> > CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> > # CONFIG_LEDS_TRIGGER_CAMERA is not set
> > # CONFIG_LEDS_TRIGGER_PANIC is not set
> > CONFIG_ACCESSIBILITY=3Dy
> > CONFIG_A11Y_BRAILLE_CONSOLE=3Dy
> > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > CONFIG_EDAC_SUPPORT=3Dy
> > # CONFIG_EDAC is not set
> > CONFIG_RTC_LIB=3Dy
> > CONFIG_RTC_MC146818_LIB=3Dy
> > # CONFIG_RTC_CLASS is not set
> > CONFIG_DMADEVICES=3Dy
> > # CONFIG_DMADEVICES_DEBUG is not set
> > =

> > #
> > # DMA Devices
> > #
> > CONFIG_DMA_ENGINE=3Dy
> > CONFIG_DMA_VIRTUAL_CHANNELS=3Dm
> > CONFIG_DMA_ACPI=3Dy
> > CONFIG_INTEL_IDMA64=3Dm
> > # CONFIG_PCH_DMA is not set
> > CONFIG_QCOM_HIDMA_MGMT=3Dm
> > CONFIG_QCOM_HIDMA=3Dy
> > CONFIG_DW_DMAC_CORE=3Dy
> > CONFIG_DW_DMAC=3Dy
> > # CONFIG_DW_DMAC_PCI is not set
> > CONFIG_HSU_DMA=3Dm
> > =

> > #
> > # DMA Clients
> > #
> > CONFIG_ASYNC_TX_DMA=3Dy
> > CONFIG_DMATEST=3Dy
> > CONFIG_DMA_ENGINE_RAID=3Dy
> > =

> > #
> > # DMABUF options
> > #
> > CONFIG_SYNC_FILE=3Dy
> > # CONFIG_SW_SYNC is not set
> > CONFIG_AUXDISPLAY=3Dy
> > CONFIG_CHARLCD=3Dm
> > # CONFIG_HD44780 is not set
> > CONFIG_IMG_ASCII_LCD=3Dy
> > CONFIG_PANEL=3Dm
> > CONFIG_PANEL_PARPORT=3D0
> > CONFIG_PANEL_PROFILE=3D5
> > CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> > CONFIG_PANEL_BOOT_MESSAGE=3D""
> > CONFIG_UIO=3Dy
> > CONFIG_UIO_CIF=3Dm
> > CONFIG_UIO_PDRV_GENIRQ=3Dy
> > CONFIG_UIO_DMEM_GENIRQ=3Dm
> > CONFIG_UIO_AEC=3Dm
> > CONFIG_UIO_SERCOS3=3Dy
> > CONFIG_UIO_PCI_GENERIC=3Dy
> > CONFIG_UIO_NETX=3Dm
> > # CONFIG_UIO_PRUSS is not set
> > # CONFIG_UIO_MF624 is not set
> > # CONFIG_VIRT_DRIVERS is not set
> > CONFIG_VIRTIO=3Dy
> > =

> > #
> > # Virtio drivers
> > #
> > CONFIG_VIRTIO_PCI=3Dy
> > # CONFIG_VIRTIO_PCI_LEGACY is not set
> > # CONFIG_VIRTIO_BALLOON is not set
> > CONFIG_VIRTIO_INPUT=3Dy
> > # CONFIG_VIRTIO_MMIO is not set
> > =

> > #
> > # Microsoft Hyper-V guest support
> > #
> > # CONFIG_HYPERV_TSCPAGE is not set
> > # CONFIG_STAGING is not set
> > CONFIG_X86_PLATFORM_DEVICES=3Dy
> > # CONFIG_ACER_WMI is not set
> > # CONFIG_ACERHDF is not set
> > # CONFIG_ALIENWARE_WMI is not set
> > # CONFIG_ASUS_LAPTOP is not set
> > CONFIG_DELL_SMBIOS=3Dm
> > CONFIG_DELL_LAPTOP=3Dm
> > # CONFIG_DELL_WMI is not set
> > # CONFIG_DELL_WMI_AIO is not set
> > # CONFIG_DELL_WMI_LED is not set
> > # CONFIG_DELL_SMO8800 is not set
> > # CONFIG_FUJITSU_LAPTOP is not set
> > # CONFIG_FUJITSU_TABLET is not set
> > # CONFIG_TC1100_WMI is not set
> > # CONFIG_HP_ACCEL is not set
> > # CONFIG_HP_WIRELESS is not set
> > # CONFIG_HP_WMI is not set
> > # CONFIG_PANASONIC_LAPTOP is not set
> > # CONFIG_SURFACE3_WMI is not set
> > # CONFIG_THINKPAD_ACPI is not set
> > CONFIG_SENSORS_HDAPS=3Dy
> > # CONFIG_INTEL_MENLOW is not set
> > # CONFIG_EEEPC_LAPTOP is not set
> > # CONFIG_ASUS_WMI is not set
> > # CONFIG_ASUS_WIRELESS is not set
> > CONFIG_ACPI_WMI=3Dm
> > # CONFIG_MSI_WMI is not set
> > # CONFIG_TOPSTAR_LAPTOP is not set
> > # CONFIG_ACPI_TOSHIBA is not set
> > # CONFIG_TOSHIBA_BT_RFKILL is not set
> > # CONFIG_TOSHIBA_HAPS is not set
> > # CONFIG_TOSHIBA_WMI is not set
> > # CONFIG_ACPI_CMPC is not set
> > # CONFIG_INTEL_CHT_INT33FE is not set
> > # CONFIG_INTEL_HID_EVENT is not set
> > # CONFIG_INTEL_VBTN is not set
> > # CONFIG_INTEL_IPS is not set
> > # CONFIG_INTEL_PMC_CORE is not set
> > CONFIG_IBM_RTL=3Dy
> > CONFIG_SAMSUNG_LAPTOP=3Dm
> > CONFIG_MXM_WMI=3Dm
> > # CONFIG_SAMSUNG_Q10 is not set
> > # CONFIG_APPLE_GMUX is not set
> > # CONFIG_INTEL_RST is not set
> > # CONFIG_INTEL_SMARTCONNECT is not set
> > # CONFIG_PVPANIC is not set
> > # CONFIG_INTEL_PMC_IPC is not set
> > # CONFIG_SURFACE_PRO3_BUTTON is not set
> > CONFIG_INTEL_PUNIT_IPC=3Dm
> > CONFIG_MLX_CPLD_PLATFORM=3Dm
> > CONFIG_PMC_ATOM=3Dy
> > # CONFIG_GOLDFISH_BUS is not set
> > CONFIG_GOLDFISH_PIPE=3Dy
> > CONFIG_CHROME_PLATFORMS=3Dy
> > CONFIG_CHROMEOS_LAPTOP=3Dm
> > CONFIG_CHROMEOS_PSTORE=3Dy
> > CONFIG_CROS_EC_CHARDEV=3Dm
> > # CONFIG_CROS_EC_LPC is not set
> > CONFIG_CROS_EC_PROTO=3Dy
> > # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> > CONFIG_CLKDEV_LOOKUP=3Dy
> > CONFIG_HAVE_CLK_PREPARE=3Dy
> > CONFIG_COMMON_CLK=3Dy
> > =

> > #
> > # Common Clock Framework
> > #
> > CONFIG_COMMON_CLK_SI5351=3Dm
> > CONFIG_COMMON_CLK_CDCE706=3Dm
> > CONFIG_COMMON_CLK_CS2000_CP=3Dm
> > # CONFIG_COMMON_CLK_NXP is not set
> > # CONFIG_COMMON_CLK_PXA is not set
> > # CONFIG_COMMON_CLK_PIC32 is not set
> > =

> > #
> > # Hardware Spinlock drivers
> > #
> > =

> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKSRC_I8253=3Dy
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_I8253_LOCK=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > # CONFIG_ATMEL_PIT is not set
> > # CONFIG_SH_TIMER_CMT is not set
> > # CONFIG_SH_TIMER_MTU2 is not set
> > # CONFIG_SH_TIMER_TMU is not set
> > # CONFIG_EM_TIMER_STI is not set
> > CONFIG_MAILBOX=3Dy
> > # CONFIG_PCC is not set
> > CONFIG_ALTERA_MBOX=3Dm
> > # CONFIG_IOMMU_SUPPORT is not set
> > =

> > #
> > # Remoteproc drivers
> > #
> > CONFIG_REMOTEPROC=3Dy
> > =

> > #
> > # Rpmsg drivers
> > #
> > =

> > #
> > # SOC (System On Chip) specific Drivers
> > #
> > =

> > #
> > # Broadcom SoC drivers
> > #
> > =

> > #
> > # i.MX SoC drivers
> > #
> > # CONFIG_SUNXI_SRAM is not set
> > # CONFIG_SOC_TI is not set
> > CONFIG_SOC_ZTE=3Dy
> > # CONFIG_PM_DEVFREQ is not set
> > # CONFIG_EXTCON is not set
> > # CONFIG_MEMORY is not set
> > CONFIG_IIO=3Dy
> > CONFIG_IIO_BUFFER=3Dy
> > CONFIG_IIO_BUFFER_CB=3Dm
> > CONFIG_IIO_KFIFO_BUF=3Dy
> > CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> > CONFIG_IIO_CONFIGFS=3Dy
> > CONFIG_IIO_TRIGGER=3Dy
> > CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> > CONFIG_IIO_SW_DEVICE=3Dy
> > CONFIG_IIO_SW_TRIGGER=3Dm
> > =

> > #
> > # Accelerometers
> > #
> > CONFIG_ADXL345=3Dm
> > # CONFIG_ADXL345_I2C is not set
> > CONFIG_ADXL345_SPI=3Dm
> > CONFIG_BMA180=3Dm
> > CONFIG_BMA220=3Dm
> > CONFIG_BMC150_ACCEL=3Dm
> > CONFIG_BMC150_ACCEL_I2C=3Dm
> > CONFIG_BMC150_ACCEL_SPI=3Dm
> > CONFIG_DA280=3Dm
> > # CONFIG_DA311 is not set
> > CONFIG_DMARD09=3Dm
> > CONFIG_DMARD10=3Dm
> > CONFIG_IIO_ST_ACCEL_3AXIS=3Dm
> > CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dm
> > CONFIG_IIO_ST_ACCEL_SPI_3AXIS=3Dm
> > # CONFIG_KXSD9 is not set
> > CONFIG_KXCJK1013=3Dm
> > CONFIG_MC3230=3Dm
> > CONFIG_MMA7455=3Dy
> > # CONFIG_MMA7455_I2C is not set
> > CONFIG_MMA7455_SPI=3Dy
> > CONFIG_MMA7660=3Dm
> > CONFIG_MMA8452=3Dm
> > # CONFIG_MMA9551 is not set
> > # CONFIG_MMA9553 is not set
> > # CONFIG_MXC4005 is not set
> > CONFIG_MXC6255=3Dm
> > # CONFIG_SCA3000 is not set
> > CONFIG_STK8312=3Dm
> > CONFIG_STK8BA50=3Dm
> > =

> > #
> > # Analog to digital converters
> > #
> > CONFIG_AD_SIGMA_DELTA=3Dy
> > # CONFIG_AD7266 is not set
> > CONFIG_AD7291=3Dm
> > # CONFIG_AD7298 is not set
> > # CONFIG_AD7476 is not set
> > CONFIG_AD7766=3Dm
> > CONFIG_AD7791=3Dy
> > CONFIG_AD7793=3Dy
> > CONFIG_AD7887=3Dy
> > # CONFIG_AD7923 is not set
> > CONFIG_AD799X=3Dm
> > # CONFIG_HI8435 is not set
> > CONFIG_HX711=3Dm
> > # CONFIG_INA2XX_ADC is not set
> > CONFIG_LTC2485=3Dm
> > CONFIG_LTC2497=3Dm
> > CONFIG_MAX1027=3Dm
> > # CONFIG_MAX11100 is not set
> > CONFIG_MAX1118=3Dm
> > CONFIG_MAX1363=3Dm
> > # CONFIG_MAX9611 is not set
> > CONFIG_MCP320X=3Dy
> > # CONFIG_MCP3422 is not set
> > CONFIG_NAU7802=3Dm
> > CONFIG_QCOM_VADC_COMMON=3Dm
> > CONFIG_QCOM_SPMI_IADC=3Dm
> > CONFIG_QCOM_SPMI_VADC=3Dm
> > # CONFIG_TI_ADC081C is not set
> > CONFIG_TI_ADC0832=3Dm
> > CONFIG_TI_ADC12138=3Dm
> > CONFIG_TI_ADC128S052=3Dy
> > CONFIG_TI_ADC161S626=3Dy
> > CONFIG_TI_ADS1015=3Dm
> > # CONFIG_TI_ADS7950 is not set
> > CONFIG_TI_TLC4541=3Dm
> > =

> > #
> > # Amplifiers
> > #
> > CONFIG_AD8366=3Dm
> > =

> > #
> > # Chemical Sensors
> > #
> > CONFIG_ATLAS_PH_SENSOR=3Dm
> > CONFIG_IAQCORE=3Dm
> > CONFIG_VZ89X=3Dm
> > # CONFIG_IIO_CROS_EC_SENSORS_CORE is not set
> > =

> > #
> > # Hid Sensor IIO Common
> > #
> > CONFIG_IIO_MS_SENSORS_I2C=3Dm
> > =

> > #
> > # SSP Sensor Common
> > #
> > # CONFIG_IIO_SSP_SENSORHUB is not set
> > CONFIG_IIO_ST_SENSORS_I2C=3Dm
> > CONFIG_IIO_ST_SENSORS_SPI=3Dy
> > CONFIG_IIO_ST_SENSORS_CORE=3Dy
> > =

> > #
> > # Counters
> > #
> > =

> > #
> > # Digital to analog converters
> > #
> > CONFIG_AD5064=3Dm
> > CONFIG_AD5360=3Dm
> > CONFIG_AD5380=3Dm
> > CONFIG_AD5421=3Dm
> > CONFIG_AD5446=3Dm
> > CONFIG_AD5449=3Dm
> > CONFIG_AD5592R_BASE=3Dm
> > # CONFIG_AD5592R is not set
> > CONFIG_AD5593R=3Dm
> > CONFIG_AD5504=3Dm
> > CONFIG_AD5624R_SPI=3Dy
> > CONFIG_LTC2632=3Dm
> > CONFIG_AD5686=3Dy
> > CONFIG_AD5755=3Dm
> > CONFIG_AD5761=3Dy
> > # CONFIG_AD5764 is not set
> > # CONFIG_AD5791 is not set
> > CONFIG_AD7303=3Dm
> > # CONFIG_AD8801 is not set
> > CONFIG_M62332=3Dm
> > CONFIG_MAX517=3Dm
> > # CONFIG_MCP4725 is not set
> > CONFIG_MCP4922=3Dm
> > =

> > #
> > # IIO dummy driver
> > #
> > CONFIG_IIO_SIMPLE_DUMMY=3Dy
> > # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> > CONFIG_IIO_SIMPLE_DUMMY_BUFFER=3Dy
> > =

> > #
> > # Frequency Synthesizers DDS/PLL
> > #
> > =

> > #
> > # Clock Generator/Distribution
> > #
> > CONFIG_AD9523=3Dm
> > =

> > #
> > # Phase-Locked Loop (PLL) frequency synthesizers
> > #
> > CONFIG_ADF4350=3Dy
> > =

> > #
> > # Digital gyroscope sensors
> > #
> > CONFIG_ADIS16080=3Dm
> > # CONFIG_ADIS16130 is not set
> > CONFIG_ADIS16136=3Dy
> > # CONFIG_ADIS16260 is not set
> > # CONFIG_ADXRS450 is not set
> > # CONFIG_BMG160 is not set
> > # CONFIG_MPU3050_I2C is not set
> > CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> > CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dm
> > CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> > # CONFIG_ITG3200 is not set
> > =

> > #
> > # Health Sensors
> > #
> > =

> > #
> > # Heart Rate Monitors
> > #
> > CONFIG_AFE4403=3Dy
> > # CONFIG_AFE4404 is not set
> > # CONFIG_MAX30100 is not set
> > CONFIG_MAX30102=3Dm
> > =

> > #
> > # Humidity sensors
> > #
> > # CONFIG_AM2315 is not set
> > CONFIG_DHT11=3Dm
> > CONFIG_HDC100X=3Dm
> > # CONFIG_HTS221 is not set
> > # CONFIG_HTU21 is not set
> > CONFIG_SI7005=3Dm
> > # CONFIG_SI7020 is not set
> > =

> > #
> > # Inertial measurement units
> > #
> > # CONFIG_ADIS16400 is not set
> > # CONFIG_ADIS16480 is not set
> > CONFIG_BMI160=3Dm
> > CONFIG_BMI160_I2C=3Dm
> > # CONFIG_BMI160_SPI is not set
> > CONFIG_KMX61=3Dm
> > CONFIG_INV_MPU6050_IIO=3Dy
> > # CONFIG_INV_MPU6050_I2C is not set
> > CONFIG_INV_MPU6050_SPI=3Dy
> > # CONFIG_IIO_ST_LSM6DSX is not set
> > CONFIG_IIO_ADIS_LIB=3Dy
> > CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> > =

> > #
> > # Light sensors
> > #
> > # CONFIG_ACPI_ALS is not set
> > CONFIG_ADJD_S311=3Dm
> > CONFIG_AL3320A=3Dm
> > # CONFIG_APDS9300 is not set
> > CONFIG_APDS9960=3Dm
> > CONFIG_BH1750=3Dm
> > CONFIG_BH1780=3Dm
> > CONFIG_CM32181=3Dm
> > CONFIG_CM3232=3Dm
> > # CONFIG_CM3323 is not set
> > CONFIG_CM36651=3Dm
> > # CONFIG_GP2AP020A00F is not set
> > CONFIG_SENSORS_ISL29018=3Dm
> > CONFIG_ISL29125=3Dm
> > CONFIG_JSA1212=3Dm
> > # CONFIG_RPR0521 is not set
> > # CONFIG_SENSORS_LM3533 is not set
> > # CONFIG_LTR501 is not set
> > CONFIG_MAX44000=3Dm
> > CONFIG_OPT3001=3Dm
> > CONFIG_PA12203001=3Dm
> > CONFIG_SI1145=3Dm
> > CONFIG_STK3310=3Dm
> > # CONFIG_TCS3414 is not set
> > CONFIG_TCS3472=3Dm
> > CONFIG_SENSORS_TSL2563=3Dm
> > CONFIG_TSL2583=3Dm
> > CONFIG_TSL4531=3Dm
> > CONFIG_US5182D=3Dm
> > CONFIG_VCNL4000=3Dm
> > # CONFIG_VEML6070 is not set
> > CONFIG_VL6180=3Dm
> > =

> > #
> > # Magnetometer sensors
> > #
> > CONFIG_AK8975=3Dm
> > # CONFIG_AK09911 is not set
> > CONFIG_BMC150_MAGN=3Dm
> > CONFIG_BMC150_MAGN_I2C=3Dm
> > CONFIG_BMC150_MAGN_SPI=3Dm
> > # CONFIG_MAG3110 is not set
> > CONFIG_MMC35240=3Dm
> > CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> > CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dm
> > CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> > CONFIG_SENSORS_HMC5843=3Dm
> > CONFIG_SENSORS_HMC5843_I2C=3Dm
> > CONFIG_SENSORS_HMC5843_SPI=3Dm
> > =

> > #
> > # Inclinometer sensors
> > #
> > =

> > #
> > # Triggers - standalone
> > #
> > CONFIG_IIO_HRTIMER_TRIGGER=3Dm
> > CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> > CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dm
> > # CONFIG_IIO_SYSFS_TRIGGER is not set
> > =

> > #
> > # Digital potentiometers
> > #
> > # CONFIG_DS1803 is not set
> > # CONFIG_MAX5481 is not set
> > CONFIG_MAX5487=3Dm
> > CONFIG_MCP4131=3Dm
> > CONFIG_MCP4531=3Dm
> > CONFIG_TPL0102=3Dm
> > =

> > #
> > # Digital potentiostats
> > #
> > # CONFIG_LMP91000 is not set
> > =

> > #
> > # Pressure sensors
> > #
> > CONFIG_ABP060MG=3Dm
> > # CONFIG_BMP280 is not set
> > # CONFIG_HP03 is not set
> > CONFIG_MPL115=3Dm
> > CONFIG_MPL115_I2C=3Dm
> > # CONFIG_MPL115_SPI is not set
> > CONFIG_MPL3115=3Dm
> > CONFIG_MS5611=3Dy
> > CONFIG_MS5611_I2C=3Dm
> > # CONFIG_MS5611_SPI is not set
> > CONFIG_MS5637=3Dm
> > CONFIG_IIO_ST_PRESS=3Dy
> > CONFIG_IIO_ST_PRESS_I2C=3Dm
> > CONFIG_IIO_ST_PRESS_SPI=3Dy
> > CONFIG_T5403=3Dm
> > CONFIG_HP206C=3Dm
> > CONFIG_ZPA2326=3Dy
> > CONFIG_ZPA2326_I2C=3Dm
> > CONFIG_ZPA2326_SPI=3Dy
> > =

> > #
> > # Lightning sensors
> > #
> > # CONFIG_AS3935 is not set
> > =

> > #
> > # Proximity and distance sensors
> > #
> > # CONFIG_LIDAR_LITE_V2 is not set
> > # CONFIG_SRF04 is not set
> > # CONFIG_SX9500 is not set
> > # CONFIG_SRF08 is not set
> > =

> > #
> > # Temperature sensors
> > #
> > CONFIG_MAXIM_THERMOCOUPLE=3Dy
> > CONFIG_MLX90614=3Dm
> > CONFIG_TMP006=3Dm
> > CONFIG_TMP007=3Dm
> > CONFIG_TSYS01=3Dm
> > # CONFIG_TSYS02D is not set
> > # CONFIG_NTB is not set
> > # CONFIG_VME_BUS is not set
> > # CONFIG_PWM is not set
> > CONFIG_ARM_GIC_MAX_NR=3D1
> > # CONFIG_IPACK_BUS is not set
> > CONFIG_RESET_CONTROLLER=3Dy
> > # CONFIG_RESET_ATH79 is not set
> > # CONFIG_RESET_BERLIN is not set
> > # CONFIG_RESET_IMX7 is not set
> > # CONFIG_RESET_LPC18XX is not set
> > # CONFIG_RESET_MESON is not set
> > # CONFIG_RESET_PISTACHIO is not set
> > # CONFIG_RESET_SOCFPGA is not set
> > # CONFIG_RESET_STM32 is not set
> > # CONFIG_RESET_SUNXI is not set
> > CONFIG_TI_SYSCON_RESET=3Dy
> > # CONFIG_RESET_ZYNQ is not set
> > # CONFIG_RESET_TEGRA_BPMP is not set
> > CONFIG_FMC=3Dy
> > # CONFIG_FMC_FAKEDEV is not set
> > CONFIG_FMC_TRIVIAL=3Dm
> > # CONFIG_FMC_WRITE_EEPROM is not set
> > # CONFIG_FMC_CHARDEV is not set
> > =

> > #
> > # PHY Subsystem
> > #
> > CONFIG_GENERIC_PHY=3Dy
> > CONFIG_PHY_PXA_28NM_HSIC=3Dy
> > CONFIG_PHY_PXA_28NM_USB2=3Dy
> > CONFIG_BCM_KONA_USB2_PHY=3Dm
> > # CONFIG_POWERCAP is not set
> > # CONFIG_MCB is not set
> > =

> > #
> > # Performance monitor support
> > #
> > CONFIG_RAS=3Dy
> > CONFIG_THUNDERBOLT=3Dy
> > =

> > #
> > # Android
> > #
> > # CONFIG_ANDROID is not set
> > CONFIG_LIBNVDIMM=3Dy
> > CONFIG_BLK_DEV_PMEM=3Dm
> > # CONFIG_ND_BLK is not set
> > CONFIG_ND_CLAIM=3Dy
> > CONFIG_ND_BTT=3Dm
> > CONFIG_BTT=3Dy
> > CONFIG_DAX=3Dy
> > CONFIG_DEV_DAX=3Dy
> > CONFIG_NVMEM=3Dy
> > # CONFIG_STM is not set
> > CONFIG_INTEL_TH=3Dm
> > # CONFIG_INTEL_TH_PCI is not set
> > CONFIG_INTEL_TH_GTH=3Dm
> > CONFIG_INTEL_TH_MSU=3Dm
> > # CONFIG_INTEL_TH_PTI is not set
> > # CONFIG_INTEL_TH_DEBUG is not set
> > =

> > #
> > # FPGA Configuration Support
> > #
> > CONFIG_FPGA=3Dy
> > CONFIG_FPGA_MGR_XILINX_SPI=3Dm
> > # CONFIG_ALTERA_PR_IP_CORE is not set
> > =

> > #
> > # FSI support
> > #
> > CONFIG_FSI=3Dy
> > # CONFIG_TEE is not set
> > =

> > #
> > # Firmware Drivers
> > #
> > CONFIG_EDD=3Dm
> > # CONFIG_EDD_OFF is not set
> > CONFIG_FIRMWARE_MEMMAP=3Dy
> > CONFIG_DELL_RBU=3Dy
> > CONFIG_DCDBAS=3Dm
> > CONFIG_DMIID=3Dy
> > CONFIG_DMI_SYSFS=3Dm
> > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> > # CONFIG_ISCSI_IBFT_FIND is not set
> > CONFIG_FW_CFG_SYSFS=3Dy
> > CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> > CONFIG_GOOGLE_FIRMWARE=3Dy
> > # CONFIG_GOOGLE_COREBOOT_TABLE_ACPI is not set
> > # CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
> > # CONFIG_EFI_DEV_PATH_PARSER is not set
> > =

> > #
> > # Tegra firmware driver
> > #
> > =

> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > CONFIG_FS_IOMAP=3Dy
> > CONFIG_EXT2_FS=3Dm
> > # CONFIG_EXT2_FS_XATTR is not set
> > # CONFIG_EXT3_FS is not set
> > # CONFIG_EXT4_FS is not set
> > # CONFIG_REISERFS_FS is not set
> > CONFIG_JFS_FS=3Dm
> > # CONFIG_JFS_POSIX_ACL is not set
> > # CONFIG_JFS_SECURITY is not set
> > # CONFIG_JFS_DEBUG is not set
> > # CONFIG_JFS_STATISTICS is not set
> > CONFIG_XFS_FS=3Dy
> > # CONFIG_XFS_QUOTA is not set
> > CONFIG_XFS_POSIX_ACL=3Dy
> > CONFIG_XFS_RT=3Dy
> > CONFIG_XFS_DEBUG=3Dy
> > CONFIG_GFS2_FS=3Dy
> > # CONFIG_OCFS2_FS is not set
> > # CONFIG_BTRFS_FS is not set
> > CONFIG_NILFS2_FS=3Dm
> > # CONFIG_F2FS_FS is not set
> > CONFIG_FS_DAX=3Dy
> > CONFIG_FS_POSIX_ACL=3Dy
> > CONFIG_EXPORTFS=3Dy
> > CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> > CONFIG_FILE_LOCKING=3Dy
> > CONFIG_MANDATORY_FILE_LOCKING=3Dy
> > CONFIG_FS_ENCRYPTION=3Dm
> > CONFIG_FSNOTIFY=3Dy
> > # CONFIG_DNOTIFY is not set
> > CONFIG_INOTIFY_USER=3Dy
> > # CONFIG_FANOTIFY is not set
> > # CONFIG_QUOTA is not set
> > # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> > CONFIG_QUOTACTL=3Dy
> > # CONFIG_AUTOFS4_FS is not set
> > # CONFIG_FUSE_FS is not set
> > CONFIG_OVERLAY_FS=3Dm
> > CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> > =

> > #
> > # Caches
> > #
> > CONFIG_FSCACHE=3Dm
> > # CONFIG_FSCACHE_STATS is not set
> > # CONFIG_FSCACHE_HISTOGRAM is not set
> > CONFIG_FSCACHE_DEBUG=3Dy
> > CONFIG_FSCACHE_OBJECT_LIST=3Dy
> > # CONFIG_CACHEFILES is not set
> > =

> > #
> > # CD-ROM/DVD Filesystems
> > #
> > CONFIG_ISO9660_FS=3Dy
> > # CONFIG_JOLIET is not set
> > # CONFIG_ZISOFS is not set
> > CONFIG_UDF_FS=3Dy
> > CONFIG_UDF_NLS=3Dy
> > =

> > #
> > # DOS/FAT/NT Filesystems
> > #
> > # CONFIG_MSDOS_FS is not set
> > # CONFIG_VFAT_FS is not set
> > CONFIG_NTFS_FS=3Dy
> > CONFIG_NTFS_DEBUG=3Dy
> > # CONFIG_NTFS_RW is not set
> > =

> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=3Dy
> > CONFIG_PROC_KCORE=3Dy
> > CONFIG_PROC_SYSCTL=3Dy
> > CONFIG_PROC_PAGE_MONITOR=3Dy
> > # CONFIG_PROC_CHILDREN is not set
> > CONFIG_KERNFS=3Dy
> > CONFIG_SYSFS=3Dy
> > CONFIG_TMPFS=3Dy
> > CONFIG_TMPFS_POSIX_ACL=3Dy
> > CONFIG_TMPFS_XATTR=3Dy
> > CONFIG_HUGETLBFS=3Dy
> > CONFIG_HUGETLB_PAGE=3Dy
> > CONFIG_CONFIGFS_FS=3Dy
> > CONFIG_MISC_FILESYSTEMS=3Dy
> > CONFIG_ORANGEFS_FS=3Dy
> > CONFIG_ADFS_FS=3Dy
> > CONFIG_ADFS_FS_RW=3Dy
> > CONFIG_AFFS_FS=3Dy
> > # CONFIG_ECRYPT_FS is not set
> > CONFIG_HFS_FS=3Dy
> > # CONFIG_HFSPLUS_FS is not set
> > CONFIG_BEFS_FS=3Dm
> > CONFIG_BEFS_DEBUG=3Dy
> > # CONFIG_BFS_FS is not set
> > CONFIG_EFS_FS=3Dy
> > # CONFIG_CRAMFS is not set
> > # CONFIG_SQUASHFS is not set
> > CONFIG_VXFS_FS=3Dm
> > CONFIG_MINIX_FS=3Dy
> > # CONFIG_OMFS_FS is not set
> > CONFIG_HPFS_FS=3Dm
> > # CONFIG_QNX4FS_FS is not set
> > CONFIG_QNX6FS_FS=3Dy
> > # CONFIG_QNX6FS_DEBUG is not set
> > # CONFIG_ROMFS_FS is not set
> > CONFIG_PSTORE=3Dm
> > # CONFIG_PSTORE_ZLIB_COMPRESS is not set
> > # CONFIG_PSTORE_LZO_COMPRESS is not set
> > CONFIG_PSTORE_LZ4_COMPRESS=3Dy
> > # CONFIG_PSTORE_CONSOLE is not set
> > CONFIG_PSTORE_PMSG=3Dy
> > # CONFIG_PSTORE_FTRACE is not set
> > CONFIG_PSTORE_RAM=3Dm
> > CONFIG_SYSV_FS=3Dm
> > CONFIG_UFS_FS=3Dm
> > CONFIG_UFS_FS_WRITE=3Dy
> > CONFIG_UFS_DEBUG=3Dy
> > CONFIG_EXOFS_FS=3Dm
> > # CONFIG_EXOFS_DEBUG is not set
> > CONFIG_ORE=3Dm
> > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=3Dm
> > CONFIG_NLS_CODEPAGE_737=3Dy
> > CONFIG_NLS_CODEPAGE_775=3Dy
> > # CONFIG_NLS_CODEPAGE_850 is not set
> > CONFIG_NLS_CODEPAGE_852=3Dm
> > CONFIG_NLS_CODEPAGE_855=3Dm
> > CONFIG_NLS_CODEPAGE_857=3Dm
> > # CONFIG_NLS_CODEPAGE_860 is not set
> > CONFIG_NLS_CODEPAGE_861=3Dm
> > CONFIG_NLS_CODEPAGE_862=3Dm
> > # CONFIG_NLS_CODEPAGE_863 is not set
> > CONFIG_NLS_CODEPAGE_864=3Dm
> > CONFIG_NLS_CODEPAGE_865=3Dy
> > CONFIG_NLS_CODEPAGE_866=3Dm
> > # CONFIG_NLS_CODEPAGE_869 is not set
> > CONFIG_NLS_CODEPAGE_936=3Dm
> > CONFIG_NLS_CODEPAGE_950=3Dm
> > CONFIG_NLS_CODEPAGE_932=3Dm
> > CONFIG_NLS_CODEPAGE_949=3Dm
> > # CONFIG_NLS_CODEPAGE_874 is not set
> > # CONFIG_NLS_ISO8859_8 is not set
> > CONFIG_NLS_CODEPAGE_1250=3Dm
> > CONFIG_NLS_CODEPAGE_1251=3Dy
> > # CONFIG_NLS_ASCII is not set
> > CONFIG_NLS_ISO8859_1=3Dm
> > CONFIG_NLS_ISO8859_2=3Dm
> > CONFIG_NLS_ISO8859_3=3Dm
> > CONFIG_NLS_ISO8859_4=3Dm
> > # CONFIG_NLS_ISO8859_5 is not set
> > CONFIG_NLS_ISO8859_6=3Dm
> > # CONFIG_NLS_ISO8859_7 is not set
> > CONFIG_NLS_ISO8859_9=3Dy
> > CONFIG_NLS_ISO8859_13=3Dy
> > # CONFIG_NLS_ISO8859_14 is not set
> > CONFIG_NLS_ISO8859_15=3Dy
> > # CONFIG_NLS_KOI8_R is not set
> > CONFIG_NLS_KOI8_U=3Dy
> > # CONFIG_NLS_MAC_ROMAN is not set
> > CONFIG_NLS_MAC_CELTIC=3Dy
> > CONFIG_NLS_MAC_CENTEURO=3Dy
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > CONFIG_NLS_MAC_CYRILLIC=3Dy
> > CONFIG_NLS_MAC_GAELIC=3Dm
> > # CONFIG_NLS_MAC_GREEK is not set
> > CONFIG_NLS_MAC_ICELAND=3Dy
> > CONFIG_NLS_MAC_INUIT=3Dm
> > CONFIG_NLS_MAC_ROMANIAN=3Dy
> > CONFIG_NLS_MAC_TURKISH=3Dy
> > CONFIG_NLS_UTF8=3Dm
> > =

> > #
> > # Kernel hacking
> > #
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > =

> > #
> > # printk and dmesg options
> > #
> > CONFIG_PRINTK_TIME=3Dy
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > # CONFIG_DYNAMIC_DEBUG is not set
> > =

> > #
> > # Compile-time checks and compiler options
> > #
> > # CONFIG_DEBUG_INFO is not set
> > CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> > CONFIG_ENABLE_MUST_CHECK=3Dy
> > CONFIG_FRAME_WARN=3D1024
> > CONFIG_STRIP_ASM_SYMS=3Dy
> > # CONFIG_READABLE_ASM is not set
> > CONFIG_UNUSED_SYMBOLS=3Dy
> > # CONFIG_PAGE_OWNER is not set
> > CONFIG_DEBUG_FS=3Dy
> > CONFIG_HEADERS_CHECK=3Dy
> > CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> > CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> > CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> > CONFIG_FRAME_POINTER=3Dy
> > # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> > CONFIG_MAGIC_SYSRQ=3Dy
> > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> > CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> > CONFIG_DEBUG_KERNEL=3Dy
> > =

> > #
> > # Memory Debugging
> > #
> > CONFIG_PAGE_EXTENSION=3Dy
> > # CONFIG_DEBUG_PAGEALLOC is not set
> > CONFIG_PAGE_POISONING=3Dy
> > # CONFIG_PAGE_POISONING_NO_SANITY is not set
> > # CONFIG_PAGE_POISONING_ZERO is not set
> > # CONFIG_DEBUG_PAGE_REF is not set
> > CONFIG_DEBUG_RODATA_TEST=3Dy
> > # CONFIG_DEBUG_OBJECTS is not set
> > CONFIG_SLUB_DEBUG_ON=3Dy
> > # CONFIG_SLUB_STATS is not set
> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > # CONFIG_DEBUG_VM is not set
> > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > # CONFIG_DEBUG_VIRTUAL is not set
> > CONFIG_DEBUG_MEMORY_INIT=3Dy
> > # CONFIG_DEBUG_HIGHMEM is not set
> > CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> > # CONFIG_DEBUG_STACKOVERFLOW is not set
> > CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> > # CONFIG_DEBUG_SHIRQ is not set
> > =

> > #
> > # Debug Lockups and Hangs
> > #
> > # CONFIG_LOCKUP_DETECTOR is not set
> > # CONFIG_DETECT_HUNG_TASK is not set
> > # CONFIG_WQ_WATCHDOG is not set
> > CONFIG_PANIC_ON_OOPS=3Dy
> > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > CONFIG_PANIC_TIMEOUT=3D0
> > CONFIG_SCHED_DEBUG=3Dy
> > # CONFIG_SCHED_INFO is not set
> > # CONFIG_SCHEDSTATS is not set
> > # CONFIG_SCHED_STACK_END_CHECK is not set
> > # CONFIG_DEBUG_TIMEKEEPING is not set
> > CONFIG_DEBUG_PREEMPT=3Dy
> > =

> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > # CONFIG_DEBUG_RT_MUTEXES is not set
> > # CONFIG_DEBUG_SPINLOCK is not set
> > # CONFIG_DEBUG_MUTEXES is not set
> > # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> > # CONFIG_DEBUG_LOCK_ALLOC is not set
> > # CONFIG_PROVE_LOCKING is not set
> > # CONFIG_LOCK_STAT is not set
> > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > # CONFIG_LOCK_TORTURE_TEST is not set
> > CONFIG_WW_MUTEX_SELFTEST=3Dm
> > CONFIG_STACKTRACE=3Dy
> > # CONFIG_DEBUG_KOBJECT is not set
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > CONFIG_DEBUG_LIST=3Dy
> > # CONFIG_DEBUG_PI_LIST is not set
> > # CONFIG_DEBUG_SG is not set
> > # CONFIG_DEBUG_NOTIFIERS is not set
> > # CONFIG_DEBUG_CREDENTIALS is not set
> > =

> > #
> > # RCU Debugging
> > #
> > # CONFIG_PROVE_RCU is not set
> > CONFIG_SPARSE_RCU_POINTER=3Dy
> > # CONFIG_TORTURE_TEST is not set
> > # CONFIG_RCU_PERF_TEST is not set
> > # CONFIG_RCU_TORTURE_TEST is not set
> > CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> > # CONFIG_RCU_TRACE is not set
> > # CONFIG_RCU_EQS_DEBUG is not set
> > # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> > # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > # CONFIG_FAULT_INJECTION is not set
> > # CONFIG_LATENCYTOP is not set
> > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > CONFIG_NOP_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > CONFIG_TRACER_MAX_TRACE=3Dy
> > CONFIG_TRACE_CLOCK=3Dy
> > CONFIG_RING_BUFFER=3Dy
> > CONFIG_EVENT_TRACING=3Dy
> > CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> > CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> > CONFIG_TRACING=3Dy
> > CONFIG_GENERIC_TRACER=3Dy
> > CONFIG_TRACING_SUPPORT=3Dy
> > CONFIG_FTRACE=3Dy
> > CONFIG_FUNCTION_TRACER=3Dy
> > # CONFIG_IRQSOFF_TRACER is not set
> > # CONFIG_PREEMPT_TRACER is not set
> > CONFIG_SCHED_TRACER=3Dy
> > # CONFIG_HWLAT_TRACER is not set
> > CONFIG_FTRACE_SYSCALLS=3Dy
> > CONFIG_TRACER_SNAPSHOT=3Dy
> > CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> > CONFIG_TRACE_BRANCH_PROFILING=3Dy
> > # CONFIG_BRANCH_PROFILE_NONE is not set
> > CONFIG_PROFILE_ANNOTATED_BRANCHES=3Dy
> > # CONFIG_PROFILE_ALL_BRANCHES is not set
> > CONFIG_TRACING_BRANCHES=3Dy
> > CONFIG_BRANCH_TRACER=3Dy
> > CONFIG_STACK_TRACER=3Dy
> > # CONFIG_BLK_DEV_IO_TRACE is not set
> > # CONFIG_UPROBE_EVENTS is not set
> > # CONFIG_PROBE_EVENTS is not set
> > # CONFIG_DYNAMIC_FTRACE is not set
> > # CONFIG_FUNCTION_PROFILER is not set
> > # CONFIG_FTRACE_STARTUP_TEST is not set
> > # CONFIG_MMIOTRACE is not set
> > # CONFIG_HIST_TRIGGERS is not set
> > # CONFIG_TRACEPOINT_BENCHMARK is not set
> > # CONFIG_RING_BUFFER_BENCHMARK is not set
> > # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> > # CONFIG_TRACE_ENUM_MAP_FILE is not set
> > # CONFIG_TRACING_EVENTS_GPIO is not set
> > =

> > #
> > # Runtime Testing
> > #
> > # CONFIG_LKDTM is not set
> > CONFIG_TEST_LIST_SORT=3Dm
> > CONFIG_TEST_SORT=3Dm
> > # CONFIG_BACKTRACE_SELF_TEST is not set
> > # CONFIG_RBTREE_TEST is not set
> > # CONFIG_INTERVAL_TREE_TEST is not set
> > # CONFIG_PERCPU_TEST is not set
> > CONFIG_ATOMIC64_SELFTEST=3Dy
> > CONFIG_ASYNC_RAID6_TEST=3Dm
> > # CONFIG_TEST_HEXDUMP is not set
> > CONFIG_TEST_STRING_HELPERS=3Dy
> > CONFIG_TEST_KSTRTOX=3Dm
> > CONFIG_TEST_PRINTF=3Dy
> > CONFIG_TEST_BITMAP=3Dm
> > CONFIG_TEST_UUID=3Dm
> > CONFIG_TEST_RHASHTABLE=3Dm
> > CONFIG_TEST_HASH=3Dy
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > # CONFIG_DMA_API_DEBUG is not set
> > # CONFIG_TEST_LKM is not set
> > # CONFIG_TEST_USER_COPY is not set
> > # CONFIG_TEST_BPF is not set
> > # CONFIG_TEST_FIRMWARE is not set
> > CONFIG_TEST_UDELAY=3Dm
> > CONFIG_MEMTEST=3Dy
> > CONFIG_TEST_STATIC_KEYS=3Dm
> > CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> > # CONFIG_UBSAN is not set
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> > CONFIG_EARLY_PRINTK_USB=3Dy
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > CONFIG_EARLY_PRINTK=3Dy
> > # CONFIG_EARLY_PRINTK_DBGP is not set
> > CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> > CONFIG_X86_PTDUMP_CORE=3Dy
> > # CONFIG_X86_PTDUMP is not set
> > CONFIG_DEBUG_WX=3Dy
> > CONFIG_DOUBLEFAULT=3Dy
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > CONFIG_IOMMU_STRESS=3Dy
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > CONFIG_IO_DELAY_TYPE_0X80=3D0
> > CONFIG_IO_DELAY_TYPE_0XED=3D1
> > CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> > CONFIG_IO_DELAY_TYPE_NONE=3D3
> > # CONFIG_IO_DELAY_0X80 is not set
> > CONFIG_IO_DELAY_0XED=3Dy
> > # CONFIG_IO_DELAY_UDELAY is not set
> > # CONFIG_IO_DELAY_NONE is not set
> > CONFIG_DEFAULT_IO_DELAY_TYPE=3D1
> > # CONFIG_DEBUG_BOOT_PARAMS is not set
> > # CONFIG_CPA_DEBUG is not set
> > # CONFIG_OPTIMIZE_INLINING is not set
> > # CONFIG_DEBUG_ENTRY is not set
> > CONFIG_X86_DEBUG_FPU=3Dy
> > CONFIG_PUNIT_ATOM_DEBUG=3Dm
> > =

> > #
> > # Security options
> > #
> > CONFIG_KEYS=3Dy
> > CONFIG_PERSISTENT_KEYRINGS=3Dy
> > # CONFIG_BIG_KEYS is not set
> > CONFIG_ENCRYPTED_KEYS=3Dy
> > CONFIG_KEY_DH_OPERATIONS=3Dy
> > # CONFIG_SECURITY_DMESG_RESTRICT is not set
> > # CONFIG_SECURITY is not set
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> > # CONFIG_HARDENED_USERCOPY is not set
> > CONFIG_STATIC_USERMODEHELPER=3Dy
> > CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> > CONFIG_DEFAULT_SECURITY_DAC=3Dy
> > CONFIG_DEFAULT_SECURITY=3D""
> > CONFIG_XOR_BLOCKS=3Dm
> > CONFIG_ASYNC_CORE=3Dm
> > CONFIG_ASYNC_MEMCPY=3Dm
> > CONFIG_ASYNC_XOR=3Dm
> > CONFIG_ASYNC_PQ=3Dm
> > CONFIG_ASYNC_RAID6_RECOV=3Dm
> > CONFIG_CRYPTO=3Dy
> > =

> > #
> > # Crypto core or helper
> > #
> > CONFIG_CRYPTO_ALGAPI=3Dy
> > CONFIG_CRYPTO_ALGAPI2=3Dy
> > CONFIG_CRYPTO_AEAD=3Dy
> > CONFIG_CRYPTO_AEAD2=3Dy
> > CONFIG_CRYPTO_BLKCIPHER=3Dy
> > CONFIG_CRYPTO_BLKCIPHER2=3Dy
> > CONFIG_CRYPTO_HASH=3Dy
> > CONFIG_CRYPTO_HASH2=3Dy
> > CONFIG_CRYPTO_RNG=3Dy
> > CONFIG_CRYPTO_RNG2=3Dy
> > CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > CONFIG_CRYPTO_AKCIPHER=3Dy
> > CONFIG_CRYPTO_KPP2=3Dy
> > CONFIG_CRYPTO_KPP=3Dy
> > CONFIG_CRYPTO_ACOMP2=3Dy
> > CONFIG_CRYPTO_RSA=3Dy
> > CONFIG_CRYPTO_DH=3Dy
> > CONFIG_CRYPTO_ECDH=3Dy
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > # CONFIG_CRYPTO_USER is not set
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > CONFIG_CRYPTO_GF128MUL=3Dy
> > CONFIG_CRYPTO_NULL=3Dy
> > CONFIG_CRYPTO_NULL2=3Dy
> > CONFIG_CRYPTO_WORKQUEUE=3Dy
> > CONFIG_CRYPTO_CRYPTD=3Dy
> > CONFIG_CRYPTO_MCRYPTD=3Dy
> > CONFIG_CRYPTO_AUTHENC=3Dy
> > CONFIG_CRYPTO_TEST=3Dm
> > CONFIG_CRYPTO_ABLK_HELPER=3Dm
> > CONFIG_CRYPTO_SIMD=3Dm
> > CONFIG_CRYPTO_GLUE_HELPER_X86=3Dm
> > CONFIG_CRYPTO_ENGINE=3Dy
> > =

> > #
> > # Authenticated Encryption with Associated Data
> > #
> > CONFIG_CRYPTO_CCM=3Dy
> > CONFIG_CRYPTO_GCM=3Dy
> > # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> > CONFIG_CRYPTO_SEQIV=3Dy
> > CONFIG_CRYPTO_ECHAINIV=3Dm
> > =

> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=3Dy
> > CONFIG_CRYPTO_CTR=3Dy
> > CONFIG_CRYPTO_CTS=3Dy
> > CONFIG_CRYPTO_ECB=3Dy
> > CONFIG_CRYPTO_LRW=3Dy
> > # CONFIG_CRYPTO_PCBC is not set
> > CONFIG_CRYPTO_XTS=3Dy
> > # CONFIG_CRYPTO_KEYWRAP is not set
> > =

> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=3Dm
> > CONFIG_CRYPTO_HMAC=3Dy
> > CONFIG_CRYPTO_XCBC=3Dm
> > # CONFIG_CRYPTO_VMAC is not set
> > =

> > #
> > # Digest
> > #
> > CONFIG_CRYPTO_CRC32C=3Dy
> > # CONFIG_CRYPTO_CRC32C_INTEL is not set
> > # CONFIG_CRYPTO_CRC32 is not set
> > CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> > CONFIG_CRYPTO_CRCT10DIF=3Dm
> > CONFIG_CRYPTO_GHASH=3Dy
> > CONFIG_CRYPTO_POLY1305=3Dm
> > # CONFIG_CRYPTO_MD4 is not set
> > # CONFIG_CRYPTO_MD5 is not set
> > CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> > # CONFIG_CRYPTO_RMD128 is not set
> > CONFIG_CRYPTO_RMD160=3Dy
> > CONFIG_CRYPTO_RMD256=3Dy
> > CONFIG_CRYPTO_RMD320=3Dy
> > CONFIG_CRYPTO_SHA1=3Dy
> > CONFIG_CRYPTO_SHA256=3Dy
> > CONFIG_CRYPTO_SHA512=3Dy
> > CONFIG_CRYPTO_SHA3=3Dy
> > # CONFIG_CRYPTO_TGR192 is not set
> > CONFIG_CRYPTO_WP512=3Dy
> > =

> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=3Dy
> > CONFIG_CRYPTO_AES_TI=3Dy
> > CONFIG_CRYPTO_AES_586=3Dy
> > CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> > CONFIG_CRYPTO_ANUBIS=3Dy
> > CONFIG_CRYPTO_ARC4=3Dm
> > CONFIG_CRYPTO_BLOWFISH=3Dy
> > CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> > # CONFIG_CRYPTO_CAMELLIA is not set
> > CONFIG_CRYPTO_CAST_COMMON=3Dy
> > # CONFIG_CRYPTO_CAST5 is not set
> > CONFIG_CRYPTO_CAST6=3Dy
> > CONFIG_CRYPTO_DES=3Dy
> > CONFIG_CRYPTO_FCRYPT=3Dm
> > CONFIG_CRYPTO_KHAZAD=3Dm
> > CONFIG_CRYPTO_SALSA20=3Dm
> > CONFIG_CRYPTO_SALSA20_586=3Dy
> > CONFIG_CRYPTO_CHACHA20=3Dy
> > CONFIG_CRYPTO_SEED=3Dy
> > CONFIG_CRYPTO_SERPENT=3Dm
> > CONFIG_CRYPTO_SERPENT_SSE2_586=3Dm
> > # CONFIG_CRYPTO_TEA is not set
> > CONFIG_CRYPTO_TWOFISH=3Dm
> > CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> > CONFIG_CRYPTO_TWOFISH_586=3Dy
> > =

> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=3Dm
> > CONFIG_CRYPTO_LZO=3Dm
> > CONFIG_CRYPTO_842=3Dy
> > CONFIG_CRYPTO_LZ4=3Dm
> > CONFIG_CRYPTO_LZ4HC=3Dy
> > =

> > #
> > # Random Number Generation
> > #
> > CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > # CONFIG_CRYPTO_DRBG_HASH is not set
> > # CONFIG_CRYPTO_DRBG_CTR is not set
> > CONFIG_CRYPTO_DRBG=3Dy
> > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > # CONFIG_CRYPTO_USER_API_HASH is not set
> > # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> > # CONFIG_CRYPTO_USER_API_RNG is not set
> > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > CONFIG_CRYPTO_HASH_INFO=3Dy
> > CONFIG_CRYPTO_HW=3Dy
> > # CONFIG_CRYPTO_DEV_PADLOCK is not set
> > CONFIG_CRYPTO_DEV_GEODE=3Dy
> > # CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
> > CONFIG_CRYPTO_DEV_CCP=3Dy
> > CONFIG_CRYPTO_DEV_CCP_DD=3Dy
> > # CONFIG_CRYPTO_DEV_CCP_CRYPTO is not set
> > CONFIG_CRYPTO_DEV_QAT=3Dy
> > CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dy
> > CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
> > # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> > CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dy
> > CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
> > CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
> > CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > CONFIG_X509_CERTIFICATE_PARSER=3Dm
> > CONFIG_PKCS7_MESSAGE_PARSER=3Dm
> > =

> > #
> > # Certificates for signature checking
> > #
> > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> > # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> > CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> > CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> > CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> > CONFIG_HAVE_KVM=3Dy
> > CONFIG_VIRTUALIZATION=3Dy
> > # CONFIG_KVM is not set
> > # CONFIG_VHOST_NET is not set
> > CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> > CONFIG_LGUEST=3Dy
> > CONFIG_BINARY_PRINTF=3Dy
> > =

> > #
> > # Library routines
> > #
> > CONFIG_RAID6_PQ=3Dm
> > CONFIG_BITREVERSE=3Dy
> > # CONFIG_HAVE_ARCH_BITREVERSE is not set
> > CONFIG_RATIONAL=3Dy
> > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > CONFIG_GENERIC_NET_UTILS=3Dy
> > CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > CONFIG_GENERIC_IOMAP=3Dy
> > CONFIG_GENERIC_IO=3Dy
> > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > # CONFIG_CRC_CCITT is not set
> > CONFIG_CRC16=3Dy
> > CONFIG_CRC_T10DIF=3Dm
> > CONFIG_CRC_ITU_T=3Dy
> > CONFIG_CRC32=3Dy
> > CONFIG_CRC32_SELFTEST=3Dm
> > # CONFIG_CRC32_SLICEBY8 is not set
> > # CONFIG_CRC32_SLICEBY4 is not set
> > CONFIG_CRC32_SARWATE=3Dy
> > # CONFIG_CRC32_BIT is not set
> > CONFIG_CRC7=3Dy
> > CONFIG_LIBCRC32C=3Dy
> > CONFIG_CRC8=3Dm
> > # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> > # CONFIG_RANDOM32_SELFTEST is not set
> > CONFIG_842_COMPRESS=3Dy
> > CONFIG_842_DECOMPRESS=3Dy
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dm
> > CONFIG_LZO_COMPRESS=3Dy
> > CONFIG_LZO_DECOMPRESS=3Dy
> > CONFIG_LZ4_COMPRESS=3Dy
> > CONFIG_LZ4HC_COMPRESS=3Dy
> > CONFIG_LZ4_DECOMPRESS=3Dy
> > CONFIG_XZ_DEC=3Dy
> > CONFIG_XZ_DEC_X86=3Dy
> > CONFIG_XZ_DEC_POWERPC=3Dy
> > CONFIG_XZ_DEC_IA64=3Dy
> > CONFIG_XZ_DEC_ARM=3Dy
> > CONFIG_XZ_DEC_ARMTHUMB=3Dy
> > CONFIG_XZ_DEC_SPARC=3Dy
> > CONFIG_XZ_DEC_BCJ=3Dy
> > CONFIG_XZ_DEC_TEST=3Dm
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_DECOMPRESS_LZMA=3Dy
> > CONFIG_REED_SOLOMON=3Dm
> > CONFIG_REED_SOLOMON_ENC8=3Dy
> > CONFIG_REED_SOLOMON_DEC8=3Dy
> > CONFIG_INTERVAL_TREE=3Dy
> > CONFIG_RADIX_TREE_MULTIORDER=3Dy
> > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT_MAP=3Dy
> > CONFIG_HAS_DMA=3Dy
> > # CONFIG_DMA_NOOP_OPS is not set
> > # CONFIG_DMA_VIRT_OPS is not set
> > CONFIG_CHECK_SIGNATURE=3Dy
> > CONFIG_DQL=3Dy
> > CONFIG_GLOB=3Dy
> > # CONFIG_GLOB_SELFTEST is not set
> > CONFIG_NLATTR=3Dy
> > CONFIG_CLZ_TAB=3Dy
> > # CONFIG_CORDIC is not set
> > # CONFIG_DDR is not set
> > CONFIG_IRQ_POLL=3Dy
> > CONFIG_MPILIB=3Dy
> > CONFIG_OID_REGISTRY=3Dm
> > CONFIG_FONT_SUPPORT=3Dm
> > CONFIG_FONTS=3Dy
> > # CONFIG_FONT_8x8 is not set
> > CONFIG_FONT_8x16=3Dy
> > # CONFIG_FONT_6x11 is not set
> > # CONFIG_FONT_7x14 is not set
> > CONFIG_FONT_PEARL_8x8=3Dy
> > CONFIG_FONT_ACORN_8x8=3Dy
> > CONFIG_FONT_MINI_4x6=3Dy
> > CONFIG_FONT_6x10=3Dy
> > CONFIG_FONT_10x18=3Dy
> > CONFIG_FONT_SUN8x16=3Dy
> > CONFIG_FONT_SUN12x22=3Dy
> > # CONFIG_SG_SPLIT is not set
> > CONFIG_SG_POOL=3Dy
> > CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> > CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
> > CONFIG_SBITMAP=3Dy
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-xfs" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--===============4765418220212121248==--

