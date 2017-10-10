Content-Type: multipart/mixed; boundary="===============4986704715472948069=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: ce07a9415f ("locking/lockdep: Make check_prev_add() able to .."): BUG: unable to handle kernel NULL pointer dereference at 00000020
Date: Tue, 10 Oct 2017 13:42:25 +0900
Message-ID: <20171010044224.GA3323@X58A-UD3R>
In-Reply-To: <20171003093237.psrmuh7gfz7v5qb5@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4986704715472948069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 11:32:37AM +0200, Ingo Molnar wrote:
> =

> Any progress with fixing this crash?
> =

> I'll have to revert this commit otherwise.

I am sorry for late. It was the biggest traditional holiday until
yesterday. I will reply it in another thread.

Thank you.

> Thanks,
> =

> 	Ingo
> =

> * kernel test robot <fengguang.wu@intel.com> wrote:
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > commit ce07a9415f266e181a0a33033a5f7138760240a4
> > Author:     Byungchul Park <byungchul.park@lge.com>
> > AuthorDate: Mon Aug 7 16:12:51 2017 +0900
> > Commit:     Ingo Molnar <mingo@kernel.org>
> > CommitDate: Thu Aug 10 12:29:06 2017 +0200
> > =

> >     locking/lockdep: Make check_prev_add() able to handle external stac=
k_trace
> >     =

> >     Currently, a space for stack_trace is pinned in check_prev_add(), t=
hat
> >     makes us not able to use external stack_trace. The simplest way to
> >     achieve it is to pass an external stack_trace as an argument.
> >     =

> >     A more suitable solution is to pass a callback additionally along w=
ith
> >     a stack_trace so that callers can decide the way to save or whether=
 to
> >     save. Actually crossrelease needs to do other than saving a stack_t=
race.
> >     So pass a stack_trace and callback to handle it, to check_prev_add(=
).
> >     =

> >     Signed-off-by: Byungchul Park <byungchul.park@lge.com>
> >     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >     Cc: Linus Torvalds <torvalds@linux-foundation.org>
> >     Cc: Peter Zijlstra <peterz@infradead.org>
> >     Cc: Thomas Gleixner <tglx@linutronix.de>
> >     Cc: akpm(a)linux-foundation.org
> >     Cc: boqun.feng(a)gmail.com
> >     Cc: kernel-team(a)lge.com
> >     Cc: kirill(a)shutemov.name
> >     Cc: npiggin(a)gmail.com
> >     Cc: walken(a)google.com
> >     Cc: willy(a)infradead.org
> >     Link: http://lkml.kernel.org/r/1502089981-21272-5-git-send-email-by=
ungchul.park(a)lge.com
> >     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > =

> > 70911fdc95  locking/lockdep: Change the meaning of check_prev_add()'s r=
eturn value
> > ce07a9415f  locking/lockdep: Make check_prev_add() able to handle exter=
nal stack_trace
> > 74d83ec2b7  Merge tag 'platform-drivers-x86-v4.14-2' of git://git.infra=
dead.org/linux-platform-drivers-x86
> > 1418b85217  Add linux-next specific files for 20170929
> > +-------------------------------------------------------+------------+-=
-----------+------------+---------------+
> > |                                                       | 70911fdc95 | =
ce07a9415f | 74d83ec2b7 | next-20170929 |
> > +-------------------------------------------------------+------------+-=
-----------+------------+---------------+
> > | boot_successes                                        | 516        | =
129        | 167        | 479           |
> > | boot_failures                                         | 0          | =
6          | 43         | 146           |
> > | BUG:unable_to_handle_kernel                           | 0          | =
6          | 24         | 42            |
> > | Oops:#[##]                                            | 0          | =
6          | 24         | 42            |
> > | EIP:iput                                              | 0          | =
5          |            |               |
> > | Kernel_panic-not_syncing:Fatal_exception              | 0          | =
6          | 1          |               |
> > | EIP:do_raw_spin_trylock                               | 0          | =
1          | 1          |               |
> > | WARNING:kernel_stack                                  | 0          | =
0          | 20         | 110           |
> > | EIP:update_stack_state                                | 0          | =
0          | 23         | 42            |
> > | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | =
0          | 23         | 42            |
> > | invoked_oom-killer:gfp_mask=3D0x                        | 0          =
| 0          | 0          | 16            |
> > | Mem-Info                                              | 0          | =
0          | 0          | 16            |
> > | EIP:clear_user                                        | 0          | =
0          | 0          | 2             |
> > | EIP:copy_page_to_iter                                 | 0          | =
0          | 0          | 1             |
> > +-------------------------------------------------------+------------+-=
-----------+------------+---------------+
> > =

> > procd: Instance odhcpd::instance1 s in a crash loop 6 crashes, 0 second=
s since last crash
> > procd: Instance uhttpd::instance1 s in a crash loop 6 crashes, 0 second=
s since last crash
> > procd: Instance dnsmasq::instance1 s in a crash loop 6 crashes, 0 secon=
ds since last crash
> > [  187.661000] Writes:  Total: 2  Max/Min: 0/0   Fail: 0 =

> > procd: - shutdown -
> > [  220.353842] BUG: unable to handle kernel NULL pointer dereference at=
 00000020
> > [  220.354946] IP: iput+0x544/0x650
> > [  220.355441] *pde =3D 00000000 =

> > [  220.355444] =

> > [  220.356100] Oops: 0000 [#1] PREEMPT SMP
> > [  220.356647] CPU: 0 PID: 29697 Comm: umount Not tainted 4.13.0-rc4-00=
169-gce07a941 #627
> > [  220.357790] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.9.3-20161025_171302-gandalf 04/01/2014
> > [  220.359217] task: c0a0ba00 task.stack: c0a1e000
> > [  220.359881] EIP: iput+0x544/0x650
> > [  220.360384] EFLAGS: 00010246 CPU: 0
> > [  220.360900] EAX: 00000001 EBX: c0100218 ECX: 00000000 EDX: 00000000
> > [  220.361778] ESI: 00000000 EDI: 00000000 EBP: c0a1fdd8 ESP: c0a1fdc0
> > [  220.362689]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
> > [  220.363502] CR0: 80050033 CR2: 00000020 CR3: 10a03000 CR4: 00000690
> > [  220.364427] Call Trace:
> > [  220.364816]  dentry_unlink_inode+0x176/0x180
> > [  220.365449]  ? preempt_count_sub+0x1c5/0x2e0
> > [  220.366092]  __dentry_kill+0x207/0x330
> > [  220.366663]  shrink_dentry_list+0x5df/0x610
> > [  220.367311]  shrink_dcache_parent+0x65/0x80
> > [  220.367939]  do_one_tree+0x13/0x40
> > [  220.368449]  shrink_dcache_for_umount+0x84/0xe0
> > [  220.369132]  generic_shutdown_super+0x3e/0x1b0
> > [  220.369823]  kill_anon_super+0x11/0x20
> > [  220.370382]  kernfs_kill_sb+0x6c/0x80
> > [  220.370912]  sysfs_kill_sb+0x1a/0x30
> > [  220.371450]  deactivate_locked_super+0x4c/0x80
> > [  220.372109]  deactivate_super+0x100/0x110
> > [  220.372701]  cleanup_mnt+0xc0/0xe0
> > [  220.373206]  __cleanup_mnt+0x10/0x20
> > [  220.373716]  task_work_run+0x7f/0xa0
> > [  220.374255]  exit_to_usermode_loop+0x100/0x16f
> > [  220.374908]  do_int80_syscall_32+0x27f/0x2e0
> > [  220.375514]  entry_INT80_32+0x2f/0x2f
> > [  220.376046] EIP: 0xa7f34a69
> > [  220.376478] EFLAGS: 00000292 CPU: 0
> > [  220.376993] EAX: 00000000 EBX: 080960f0 ECX: a7f76ff4 EDX: 080960d0
> > [  220.377904] ESI: 080960d0 EDI: 080960f0 EBP: afe22258 ESP: afe22208
> > [  220.378773]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
> > [  220.379565] Code: b5 20 56 3c b7 0f 84 64 fe ff ff e9 6b fe ff ff 8d=
 b4 26 00 00 00 00 8b 7b 1c c1 ee 03 31 c9 83 05 ac 56 3c b7 01 83 e6 01 89=
 f2 <8b> 47 20 89 45 ec b8 c0 1f 30 b7 c7 04 24 00 00 00 00 e8 15 89
> > [  220.382358] EIP: iput+0x544/0x650 SS:ESP: 0068:c0a1fdc0
> > [  220.383125] CR2: 0000000000000020
> > [  220.383597] ---[ end trace 0bfc95b7cf7c8ea4 ]---
> > [  220.384273] Kernel panic - not syncing: Fatal exception
> > =

> >                                                           # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> > git bisect start 988e175b9df683ac8c465fca60d64dbe9e4dd81e 520eccdfe1875=
91a51ea9ab4c1a024ae4d0f68d9 --
> > git bisect good d68e68e5fb7134427c6d79c58beaaf869543f3f7  # 08:24  G   =
  19     0    0   0  IB/hfi1: Fix whitespace alignment issue for MAD
> > git bisect good 64b19e1323e96c34af7ca90d1954e70890c7a98e  # 08:44  G   =
  19     0    0   0  IB/core: Export ioctl enum types to user-space
> > git bisect good 1993519be8bc86342687c61d8d11c3ade62b3b84  # 09:16  G   =
  19     0    0   0  bnxt_re: Fix memory leak in FRMR path
> > git bisect  bad e930b4d8a52067c773d9cd6f6bdd7d4ddc99563f  # 09:28  B   =
  10     2    1   1  RDMA/hns: remove redundant assignment to variable j
> > git bisect  bad 0ff4b7e6db6db3341a99a3f0afb5eb8927feb8ab  # 10:05  B   =
  16     3    4   4  Merge branch 'vnic' into k.o/for-next
> > git bisect  bad 7ae6f2a3d552dc01c4423c0cdede1daa9fd07991  # 10:20  B   =
   0     1   14   0  Merge branch 'qedr' into k.o/for-next
> > git bisect good 89aaca54ba60e91f02c1c168fbef5d71f71a6d43  # 10:55  G   =
  55     0    0   2  bnxt_re: Don't issue cmd to delete GID for QP1 GID ent=
ry before the QP is destroyed
> > git bisect  bad 0d9c2ff1c9f7f8b339fc42ac9763b28c71f1c115  # 11:19  B   =
  19     1    2   3  Merge tag 'v4.14-rc2' into k.o/for-next
> > git bisect  bad aae3dbb4776e7916b6cd442d00159bea27a695c1  # 11:41  B   =
   1     1    0   0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/da=
vem/net-next
> > git bisect  bad 04759194dc447ff0b9ef35bc641ce3bb076c2930  # 12:19  B   =
  52     1    5   5  Merge tag 'arm64-upstream' of git://git.kernel.org/pub=
/scm/linux/kernel/git/arm64/linux
> > git bisect good 735f463af70e9601881ec879961ec42aef051733  # 13:15  G   =
 177     0    0   5  Merge tag 'drm-intel-next-2017-08-18' of git://anongit=
.freedesktop.org/git/drm-intel into drm-next
> > git bisect good 0081a0ce809b611c1f37da5d6ae5bc8027ffd1c4  # 13:15  G   =
 309     0    0   1  Merge branch 'core-rcu-for-linus' of git://git.kernel.=
org/pub/scm/linux/kernel/git/tip/tip
> > git bisect  bad 5f82e71a001d14824a7728ad9e49f6aea420f161  # 13:15  B   =
  42     5    0  13  Merge branch 'locking-core-for-linus' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect good 475fb533fb7d3dcf009a434f9b9ea238b93f4cb8  # 13:56  G   =
 180     0    0   3  perf evsel: Fix buffer overflow while freeing events
> > git bisect good b0c79f49c343cda8954b3322984c32f258ca4ccb  # 15:32  G   =
 174     0    0   0  Merge branch 'x86-asm-for-linus' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip
> > git bisect  bad 0c2364791343e4b04cd1f097ff2abc2799062448  # 15:46  B   =
  11     1    4   6  Merge branch 'x86/asm' into locking/core
> > git bisect good a9668cd6ee288c4838bc668880ac085be551cac2  # 16:27  G   =
 175     0    0   6  locking: Remove smp_mb__before_spinlock()
> > git bisect  bad cd8084f91c02c1afd256a39aa833bff737631304  # 16:45  B   =
  32     1    3   6  locking/lockdep: Apply crossrelease to completions
> > git bisect good 70911fdc9576f4eeb3986689a1c9a778a4a4aacb  # 17:42  G   =
 174     0    0   0  locking/lockdep: Change the meaning of check_prev_add(=
)'s return value
> > git bisect  bad 23f873d8f9526ed7e49a1a02a45f8afb9ae5fb84  # 17:51  B   =
   0     1   14   0  locking/lockdep: Detect and handle hist_lock ring buff=
er overwrite
> > git bisect  bad b09be676e0ff25bd6d2e7637e26d349f9109ad75  # 17:52  B   =
  54    10    0  11  locking/lockdep: Implement the 'crossrelease' feature
> > git bisect  bad ce07a9415f266e181a0a33033a5f7138760240a4  # 17:52  B   =
  71     6    0   0  locking/lockdep: Make check_prev_add() able to handle =
external stack_trace
> > # first bad commit: [ce07a9415f266e181a0a33033a5f7138760240a4] locking/=
lockdep: Make check_prev_add() able to handle external stack_trace
> > git bisect good 70911fdc9576f4eeb3986689a1c9a778a4a4aacb  # 21:42  G   =
 512     0    0   0  locking/lockdep: Change the meaning of check_prev_add(=
)'s return value
> > # extra tests on HEAD of dledford/k.o/for-next
> > git bisect  bad 988e175b9df683ac8c465fca60d64dbe9e4dd81e  # 21:43  B   =
   6     5    0   3  RDMA/hns: Fix calltrace for sleeping in atomic
> > # extra tests on tree/branch linus/master
> > git bisect  bad 74d83ec2b73457449918c315e40622c03a3659a6  # 21:43  B   =
 163    24    0  19  Merge tag 'platform-drivers-x86-v4.14-2' of git://git.=
infradead.org/linux-platform-drivers-x86
> > # extra tests on tree/branch linux-next/master
> > git bisect  bad 1418b852174ad50b3cb4738b8801626aefdc0bd9  # 21:44  B   =
 472    42    0 104  Add linux-next specific files for 20170929
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
> > initrd=3Dopenwrt-trinity-i386.cgz
> > =

> > wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw=
/master/initrd/$initrd
> > =

> > kvm=3D(
> > 	qemu-system-x86_64
> > 	-enable-kvm
> > 	-kernel $kernel
> > 	-initrd $initrd
> > 	-m 296
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
> > 	console=3Dtty0
> > 	earlyprintk=3DttyS0,115200
> > 	console=3DttyS0,115200
> > 	vga=3Dnormal
> > 	rw
> > 	drbd.minor_count=3D8
> > )
> > =

> > "${kvm[@]}" -append "${append[*]}"
> =

> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/i386 4.13.0-rc4 Kernel Configuration
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
> > CONFIG_X86_32_SMP=3Dy
> > CONFIG_X86_32_LAZY_GS=3Dy
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_PGTABLE_LEVELS=3D2
> > CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> > CONFIG_THREAD_INFO_IN_TASK=3Dy
> > =

> > #
> > # General setup
> > #
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
> > CONFIG_KERNEL_LZO=3Dy
> > # CONFIG_KERNEL_LZ4 is not set
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
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
> > CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> > CONFIG_GENERIC_PENDING_IRQ=3Dy
> > CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> > CONFIG_GENERIC_IRQ_CHIP=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> > # CONFIG_IRQ_DOMAIN_DEBUG is not set
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > =

> > #
> > # Timers subsystem
> > #
> > CONFIG_HZ_PERIODIC=3Dy
> > # CONFIG_NO_HZ_IDLE is not set
> > # CONFIG_NO_HZ is not set
> > # CONFIG_HIGH_RES_TIMERS is not set
> > =

> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_TICK_CPU_ACCOUNTING=3Dy
> > # CONFIG_IRQ_TIME_ACCOUNTING is not set
> > CONFIG_BSD_PROCESS_ACCT=3Dy
> > CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> > # CONFIG_TASKSTATS is not set
> > =

> > #
> > # RCU Subsystem
> > #
> > CONFIG_PREEMPT_RCU=3Dy
> > CONFIG_RCU_EXPERT=3Dy
> > CONFIG_SRCU=3Dy
> > CONFIG_TREE_SRCU=3Dy
> > CONFIG_TASKS_RCU=3Dy
> > CONFIG_RCU_STALL_COMMON=3Dy
> > CONFIG_RCU_NEED_SEGCBLIST=3Dy
> > CONFIG_RCU_FANOUT=3D32
> > CONFIG_RCU_FANOUT_LEAF=3D16
> > # CONFIG_RCU_BOOST is not set
> > # CONFIG_RCU_NOCB_CPU is not set
> > CONFIG_BUILD_BIN2C=3Dy
> > CONFIG_IKCONFIG=3Dy
> > CONFIG_IKCONFIG_PROC=3Dy
> > CONFIG_LOG_BUF_SHIFT=3D17
> > CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> > CONFIG_CGROUPS=3Dy
> > CONFIG_PAGE_COUNTER=3Dy
> > CONFIG_MEMCG=3Dy
> > CONFIG_CGROUP_SCHED=3Dy
> > CONFIG_FAIR_GROUP_SCHED=3Dy
> > CONFIG_CFS_BANDWIDTH=3Dy
> > CONFIG_RT_GROUP_SCHED=3Dy
> > # CONFIG_CGROUP_PIDS is not set
> > CONFIG_CGROUP_RDMA=3Dy
> > # CONFIG_CGROUP_FREEZER is not set
> > # CONFIG_CGROUP_HUGETLB is not set
> > # CONFIG_CPUSETS is not set
> > # CONFIG_CGROUP_DEVICE is not set
> > # CONFIG_CGROUP_CPUACCT is not set
> > # CONFIG_CGROUP_PERF is not set
> > CONFIG_CGROUP_DEBUG=3Dy
> > # CONFIG_SOCK_CGROUP_DATA is not set
> > CONFIG_CHECKPOINT_RESTORE=3Dy
> > # CONFIG_NAMESPACES is not set
> > CONFIG_SCHED_AUTOGROUP=3Dy
> > # CONFIG_SYSFS_DEPRECATED is not set
> > CONFIG_RELAY=3Dy
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > CONFIG_RD_BZIP2=3Dy
> > CONFIG_RD_LZMA=3Dy
> > # CONFIG_RD_XZ is not set
> > CONFIG_RD_LZO=3Dy
> > CONFIG_RD_LZ4=3Dy
> > CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> > # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> > CONFIG_SYSCTL=3Dy
> > CONFIG_ANON_INODES=3Dy
> > CONFIG_HAVE_UID16=3Dy
> > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > CONFIG_BPF=3Dy
> > CONFIG_EXPERT=3Dy
> > # CONFIG_UID16 is not set
> > CONFIG_MULTIUSER=3Dy
> > CONFIG_SGETMASK_SYSCALL=3Dy
> > # CONFIG_SYSFS_SYSCALL is not set
> > CONFIG_SYSCTL_SYSCALL=3Dy
> > CONFIG_POSIX_TIMERS=3Dy
> > CONFIG_KALLSYMS=3Dy
> > CONFIG_KALLSYMS_ALL=3Dy
> > # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > CONFIG_PRINTK=3Dy
> > CONFIG_PRINTK_NMI=3Dy
> > CONFIG_BUG=3Dy
> > # CONFIG_PCSPKR_PLATFORM is not set
> > CONFIG_BASE_FULL=3Dy
> > CONFIG_FUTEX=3Dy
> > CONFIG_FUTEX_PI=3Dy
> > CONFIG_EPOLL=3Dy
> > CONFIG_SIGNALFD=3Dy
> > CONFIG_TIMERFD=3Dy
> > CONFIG_EVENTFD=3Dy
> > # CONFIG_BPF_SYSCALL is not set
> > CONFIG_SHMEM=3Dy
> > # CONFIG_AIO is not set
> > CONFIG_ADVISE_SYSCALLS=3Dy
> > # CONFIG_USERFAULTFD is not set
> > CONFIG_PCI_QUIRKS=3Dy
> > CONFIG_MEMBARRIER=3Dy
> > CONFIG_EMBEDDED=3Dy
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> > CONFIG_PERF_USE_VMALLOC=3Dy
> > # CONFIG_PC104 is not set
> > =

> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> > # CONFIG_VM_EVENT_COUNTERS is not set
> > CONFIG_SLUB_DEBUG=3Dy
> > CONFIG_SLUB_MEMCG_SYSFS_ON=3Dy
> > CONFIG_COMPAT_BRK=3Dy
> > # CONFIG_SLAB is not set
> > CONFIG_SLUB=3Dy
> > # CONFIG_SLOB is not set
> > # CONFIG_SLAB_MERGE_DEFAULT is not set
> > # CONFIG_SLAB_FREELIST_RANDOM is not set
> > # CONFIG_SLUB_CPU_PARTIAL is not set
> > # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> > CONFIG_PROFILING=3Dy
> > CONFIG_TRACEPOINTS=3Dy
> > # CONFIG_OPROFILE is not set
> > CONFIG_HAVE_OPROFILE=3Dy
> > CONFIG_OPROFILE_NMI_TIMER=3Dy
> > # CONFIG_JUMP_LABEL is not set
> > CONFIG_UPROBES=3Dy
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
> > CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_CLK=3Dy
> > CONFIG_HAVE_DMA_API_DEBUG=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
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
> > # CONFIG_CC_STACKPROTECTOR is not set
> > CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> > # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> > # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> > CONFIG_THIN_ARCHIVES=3Dy
> > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
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
> > # CONFIG_REFCOUNT_FULL is not set
> > =

> > #
> > # GCOV-based kernel profiling
> > #
> > # CONFIG_GCOV_KERNEL is not set
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> > CONFIG_SLABINFO=3Dy
> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D0
> > # CONFIG_MODULES is not set
> > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > # CONFIG_BLOCK is not set
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> > CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> > CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > CONFIG_QUEUED_SPINLOCKS=3Dy
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > CONFIG_QUEUED_RWLOCKS=3Dy
> > # CONFIG_FREEZER is not set
> > =

> > #
> > # Processor type and features
> > #
> > CONFIG_ZONE_DMA=3Dy
> > CONFIG_SMP=3Dy
> > CONFIG_X86_FEATURE_NAMES=3Dy
> > # CONFIG_X86_FAST_FEATURE_TESTS is not set
> > CONFIG_X86_MPPARSE=3Dy
> > # CONFIG_X86_BIGSMP is not set
> > CONFIG_GOLDFISH=3Dy
> > CONFIG_X86_EXTENDED_PLATFORM=3Dy
> > # CONFIG_X86_GOLDFISH is not set
> > # CONFIG_X86_INTEL_MID is not set
> > # CONFIG_X86_INTEL_QUARK is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > # CONFIG_IOSF_MBI is not set
> > # CONFIG_X86_RDC321X is not set
> > CONFIG_X86_32_NON_STANDARD=3Dy
> > CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> > # CONFIG_STA2X11 is not set
> > CONFIG_X86_32_IRIS=3Dy
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > CONFIG_HYPERVISOR_GUEST=3Dy
> > CONFIG_PARAVIRT=3Dy
> > # CONFIG_PARAVIRT_DEBUG is not set
> > # CONFIG_PARAVIRT_SPINLOCKS is not set
> > CONFIG_KVM_GUEST=3Dy
> > # CONFIG_KVM_DEBUG_FS is not set
> > # CONFIG_LGUEST_GUEST is not set
> > # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> > CONFIG_PARAVIRT_CLOCK=3Dy
> > CONFIG_NO_BOOTMEM=3Dy
> > # CONFIG_M486 is not set
> > # CONFIG_M586 is not set
> > # CONFIG_M586TSC is not set
> > # CONFIG_M586MMX is not set
> > # CONFIG_M686 is not set
> > # CONFIG_MPENTIUMII is not set
> > # CONFIG_MPENTIUMIII is not set
> > # CONFIG_MPENTIUMM is not set
> > # CONFIG_MPENTIUM4 is not set
> > # CONFIG_MK6 is not set
> > # CONFIG_MK7 is not set
> > # CONFIG_MK8 is not set
> > CONFIG_MCRUSOE=3Dy
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
> > CONFIG_X86_GENERIC=3Dy
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > CONFIG_X86_INTEL_USERCOPY=3Dy
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_CMOV=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D4
> > CONFIG_X86_DEBUGCTLMSR=3Dy
> > CONFIG_PROCESSOR_SELECT=3Dy
> > # CONFIG_CPU_SUP_INTEL is not set
> > # CONFIG_CPU_SUP_CYRIX_32 is not set
> > CONFIG_CPU_SUP_AMD=3Dy
> > # CONFIG_CPU_SUP_CENTAUR is not set
> > # CONFIG_CPU_SUP_TRANSMETA_32 is not set
> > # CONFIG_CPU_SUP_UMC_32 is not set
> > CONFIG_HPET_TIMER=3Dy
> > CONFIG_DMI=3Dy
> > CONFIG_NR_CPUS=3D8
> > # CONFIG_SCHED_SMT is not set
> > # CONFIG_SCHED_MC is not set
> > # CONFIG_PREEMPT_NONE is not set
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > CONFIG_PREEMPT=3Dy
> > CONFIG_PREEMPT_COUNT=3Dy
> > CONFIG_X86_LOCAL_APIC=3Dy
> > CONFIG_X86_IO_APIC=3Dy
> > # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> > CONFIG_X86_MCE=3Dy
> > # CONFIG_X86_MCELOG_LEGACY is not set
> > # CONFIG_X86_MCE_INTEL is not set
> > CONFIG_X86_MCE_AMD=3Dy
> > CONFIG_X86_ANCIENT_MCE=3Dy
> > CONFIG_X86_MCE_THRESHOLD=3Dy
> > CONFIG_X86_MCE_INJECT=3Dy
> > =

> > #
> > # Performance monitoring
> > #
> > CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> > CONFIG_X86_LEGACY_VM86=3Dy
> > CONFIG_VM86=3Dy
> > # CONFIG_X86_16BIT is not set
> > # CONFIG_TOSHIBA is not set
> > CONFIG_I8K=3Dy
> > CONFIG_X86_REBOOTFIXUPS=3Dy
> > CONFIG_MICROCODE=3Dy
> > # CONFIG_MICROCODE_INTEL is not set
> > # CONFIG_MICROCODE_AMD is not set
> > CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> > CONFIG_X86_MSR=3Dy
> > CONFIG_X86_CPUID=3Dy
> > # CONFIG_NOHIGHMEM is not set
> > CONFIG_HIGHMEM4G=3Dy
> > # CONFIG_HIGHMEM64G is not set
> > # CONFIG_VMSPLIT_3G is not set
> > CONFIG_VMSPLIT_3G_OPT=3Dy
> > # CONFIG_VMSPLIT_2G is not set
> > # CONFIG_VMSPLIT_2G_OPT is not set
> > # CONFIG_VMSPLIT_1G is not set
> > CONFIG_PAGE_OFFSET=3D0xB0000000
> > CONFIG_HIGHMEM=3Dy
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
> > CONFIG_HAVE_GENERIC_GUP=3Dy
> > CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> > CONFIG_MEMORY_ISOLATION=3Dy
> > # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > # CONFIG_COMPACTION is not set
> > CONFIG_MIGRATION=3Dy
> > # CONFIG_PHYS_ADDR_T_64BIT is not set
> > CONFIG_VIRT_TO_BUS=3Dy
> > CONFIG_KSM=3Dy
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> > # CONFIG_MEMORY_FAILURE is not set
> > # CONFIG_TRANSPARENT_HUGEPAGE is not set
> > # CONFIG_ARCH_WANTS_THP_SWAP is not set
> > CONFIG_CLEANCACHE=3Dy
> > CONFIG_CMA=3Dy
> > CONFIG_CMA_DEBUG=3Dy
> > CONFIG_CMA_DEBUGFS=3Dy
> > CONFIG_CMA_AREAS=3D7
> > # CONFIG_ZPOOL is not set
> > CONFIG_ZBUD=3Dy
> > CONFIG_ZSMALLOC=3Dy
> > CONFIG_PGTABLE_MAPPING=3Dy
> > CONFIG_ZSMALLOC_STAT=3Dy
> > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> > CONFIG_IDLE_PAGE_TRACKING=3Dy
> > # CONFIG_PERCPU_STATS is not set
> > CONFIG_HIGHPTE=3Dy
> > CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> > # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> > CONFIG_X86_RESERVE_LOW=3D64
> > CONFIG_MATH_EMULATION=3Dy
> > CONFIG_MTRR=3Dy
> > CONFIG_MTRR_SANITIZER=3Dy
> > CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> > CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> > CONFIG_X86_PAT=3Dy
> > CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> > # CONFIG_ARCH_RANDOM is not set
> > CONFIG_X86_SMAP=3Dy
> > # CONFIG_EFI is not set
> > CONFIG_SECCOMP=3Dy
> > CONFIG_HZ_100=3Dy
> > # CONFIG_HZ_250 is not set
> > # CONFIG_HZ_300 is not set
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=3D100
> > # CONFIG_SCHED_HRTICK is not set
> > # CONFIG_KEXEC is not set
> > # CONFIG_CRASH_DUMP is not set
> > CONFIG_PHYSICAL_START=3D0x1000000
> > CONFIG_RELOCATABLE=3Dy
> > CONFIG_RANDOMIZE_BASE=3Dy
> > CONFIG_X86_NEED_RELOCS=3Dy
> > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > # CONFIG_HOTPLUG_CPU is not set
> > CONFIG_COMPAT_VDSO=3Dy
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_MODIFY_LDT_SYSCALL=3Dy
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > =

> > #
> > # Power management and ACPI options
> > #
> > # CONFIG_SUSPEND is not set
> > CONFIG_PM=3Dy
> > # CONFIG_PM_DEBUG is not set
> > CONFIG_PM_CLK=3Dy
> > CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
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
> > # CONFIG_ACPI_VIDEO is not set
> > CONFIG_ACPI_FAN=3Dy
> > # CONFIG_ACPI_DOCK is not set
> > CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> > CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> > CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> > CONFIG_ACPI_PROCESSOR=3Dy
> > # CONFIG_ACPI_IPMI is not set
> > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > CONFIG_ACPI_THERMAL=3Dy
> > CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> > # CONFIG_ACPI_CUSTOM_DSDT is not set
> > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > # CONFIG_ACPI_DEBUG is not set
> > # CONFIG_ACPI_PCI_SLOT is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > # CONFIG_ACPI_CONTAINER is not set
> > CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> > # CONFIG_ACPI_SBS is not set
> > # CONFIG_ACPI_HED is not set
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> > CONFIG_HAVE_ACPI_APEI=3Dy
> > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > # CONFIG_ACPI_APEI is not set
> > # CONFIG_DPTF_POWER is not set
> > # CONFIG_ACPI_EXTLOG is not set
> > # CONFIG_PMIC_OPREGION is not set
> > # CONFIG_ACPI_CONFIGFS is not set
> > # CONFIG_SFI is not set
> > =

> > #
> > # CPU Frequency scaling
> > #
> > CONFIG_CPU_FREQ=3Dy
> > CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> > CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> > CONFIG_CPU_FREQ_STAT=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> > CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> > # CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set
> > =

> > #
> > # CPU frequency scaling drivers
> > #
> > # CONFIG_CPUFREQ_DT is not set
> > CONFIG_X86_INTEL_PSTATE=3Dy
> > # CONFIG_X86_PCC_CPUFREQ is not set
> > # CONFIG_X86_ACPI_CPUFREQ is not set
> > # CONFIG_X86_POWERNOW_K6 is not set
> > CONFIG_X86_POWERNOW_K7=3Dy
> > CONFIG_X86_POWERNOW_K7_ACPI=3Dy
> > # CONFIG_X86_GX_SUSPMOD is not set
> > CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
> > CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> > # CONFIG_X86_SPEEDSTEP_ICH is not set
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
> > # CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is not set
> > =

> > #
> > # CPU Idle
> > #
> > CONFIG_CPU_IDLE=3Dy
> > CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> > # CONFIG_CPU_IDLE_GOV_MENU is not set
> > # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> > =

> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI=3Dy
> > # CONFIG_PCI_GOBIOS is not set
> > # CONFIG_PCI_GOMMCONFIG is not set
> > # CONFIG_PCI_GODIRECT is not set
> > # CONFIG_PCI_GOOLPC is not set
> > CONFIG_PCI_GOANY=3Dy
> > CONFIG_PCI_BIOS=3Dy
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_MMCONFIG=3Dy
> > CONFIG_PCI_OLPC=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > # CONFIG_PCI_CNB20LE_QUIRK is not set
> > # CONFIG_PCIEPORTBUS is not set
> > # CONFIG_PCI_MSI is not set
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> > # CONFIG_PCI_STUB is not set
> > CONFIG_HT_IRQ=3Dy
> > CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> > # CONFIG_PCI_IOV is not set
> > # CONFIG_PCI_PRI is not set
> > # CONFIG_PCI_PASID is not set
> > CONFIG_PCI_LABEL=3Dy
> > # CONFIG_HOTPLUG_PCI is not set
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
> > # CONFIG_PCI_SW_SWITCHTEC is not set
> > # CONFIG_ISA_BUS is not set
> > CONFIG_ISA_DMA_API=3Dy
> > # CONFIG_ISA is not set
> > CONFIG_SCx200=3Dy
> > # CONFIG_SCx200HR_TIMER is not set
> > CONFIG_OLPC=3Dy
> > # CONFIG_OLPC_XO15_SCI is not set
> > CONFIG_ALIX=3Dy
> > # CONFIG_NET5501 is not set
> > CONFIG_GEOS=3Dy
> > CONFIG_AMD_NB=3Dy
> > # CONFIG_PCCARD is not set
> > # CONFIG_RAPIDIO is not set
> > CONFIG_X86_SYSFB=3Dy
> > =

> > #
> > # Executable file formats / Emulations
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_ELFCORE=3Dy
> > CONFIG_BINFMT_SCRIPT=3Dy
> > CONFIG_HAVE_AOUT=3Dy
> > CONFIG_BINFMT_AOUT=3Dy
> > CONFIG_BINFMT_MISC=3Dy
> > # CONFIG_COREDUMP is not set
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
> > CONFIG_RPS=3Dy
> > CONFIG_RFS_ACCEL=3Dy
> > CONFIG_XPS=3Dy
> > # CONFIG_CGROUP_NET_PRIO is not set
> > # CONFIG_CGROUP_NET_CLASSID is not set
> > CONFIG_NET_RX_BUSY_POLL=3Dy
> > CONFIG_BQL=3Dy
> > CONFIG_NET_FLOW_LIMIT=3Dy
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
> > # CONFIG_UEVENT_HELPER is not set
> > CONFIG_DEVTMPFS=3Dy
> > # CONFIG_DEVTMPFS_MOUNT is not set
> > # CONFIG_STANDALONE is not set
> > CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> > CONFIG_FW_LOADER=3Dy
> > CONFIG_FIRMWARE_IN_KERNEL=3Dy
> > CONFIG_EXTRA_FIRMWARE=3D""
> > CONFIG_FW_LOADER_USER_HELPER=3Dy
> > # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > # CONFIG_DEBUG_DRIVER is not set
> > # CONFIG_DEBUG_DEVRES is not set
> > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > # CONFIG_SYS_HYPERVISOR is not set
> > # CONFIG_GENERIC_CPU_DEVICES is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > CONFIG_REGMAP=3Dy
> > CONFIG_REGMAP_I2C=3Dy
> > CONFIG_REGMAP_SPI=3Dy
> > CONFIG_REGMAP_MMIO=3Dy
> > CONFIG_REGMAP_IRQ=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > CONFIG_DMA_FENCE_TRACE=3Dy
> > # CONFIG_DMA_CMA is not set
> > =

> > #
> > # Bus devices
> > #
> > CONFIG_SIMPLE_PM_BUS=3Dy
> > # CONFIG_CONNECTOR is not set
> > # CONFIG_MTD is not set
> > CONFIG_DTC=3Dy
> > CONFIG_OF=3Dy
> > CONFIG_OF_UNITTEST=3Dy
> > CONFIG_OF_FLATTREE=3Dy
> > CONFIG_OF_EARLY_FLATTREE=3Dy
> > CONFIG_OF_PROMTREE=3Dy
> > CONFIG_OF_DYNAMIC=3Dy
> > CONFIG_OF_ADDRESS=3Dy
> > CONFIG_OF_ADDRESS_PCI=3Dy
> > CONFIG_OF_IRQ=3Dy
> > CONFIG_OF_PCI=3Dy
> > CONFIG_OF_PCI_IRQ=3Dy
> > CONFIG_OF_RESOLVE=3Dy
> > CONFIG_OF_OVERLAY=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > CONFIG_PARPORT=3Dy
> > CONFIG_PARPORT_PC=3Dy
> > # CONFIG_PARPORT_SERIAL is not set
> > CONFIG_PARPORT_PC_FIFO=3Dy
> > CONFIG_PARPORT_PC_SUPERIO=3Dy
> > # CONFIG_PARPORT_GSC is not set
> > CONFIG_PARPORT_AX88796=3Dy
> > # CONFIG_PARPORT_1284 is not set
> > CONFIG_PARPORT_NOT_PC=3Dy
> > CONFIG_PNP=3Dy
> > CONFIG_PNP_DEBUG_MESSAGES=3Dy
> > =

> > #
> > # Protocols
> > #
> > CONFIG_PNPACPI=3Dy
> > =

> > #
> > # Misc devices
> > #
> > CONFIG_SENSORS_LIS3LV02D=3Dy
> > # CONFIG_AD525X_DPOT is not set
> > CONFIG_DUMMY_IRQ=3Dy
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_SGI_IOC4 is not set
> > # CONFIG_TIFM_CORE is not set
> > # CONFIG_ICS932S401 is not set
> > CONFIG_ENCLOSURE_SERVICES=3Dy
> > # CONFIG_HP_ILO is not set
> > # CONFIG_APDS9802ALS is not set
> > # CONFIG_ISL29003 is not set
> > CONFIG_ISL29020=3Dy
> > CONFIG_SENSORS_TSL2550=3Dy
> > CONFIG_SENSORS_BH1770=3Dy
> > # CONFIG_SENSORS_APDS990X is not set
> > # CONFIG_HMC6352 is not set
> > CONFIG_DS1682=3Dy
> > CONFIG_TI_DAC7512=3Dy
> > # CONFIG_PCH_PHUB is not set
> > CONFIG_USB_SWITCH_FSA9480=3Dy
> > # CONFIG_LATTICE_ECP3_CONFIG is not set
> > # CONFIG_SRAM is not set
> > # CONFIG_PCI_ENDPOINT_TEST is not set
> > # CONFIG_C2PORT is not set
> > =

> > #
> > # EEPROM support
> > #
> > CONFIG_EEPROM_AT24=3Dy
> > # CONFIG_EEPROM_AT25 is not set
> > # CONFIG_EEPROM_LEGACY is not set
> > CONFIG_EEPROM_MAX6875=3Dy
> > CONFIG_EEPROM_93CX6=3Dy
> > # CONFIG_EEPROM_93XX46 is not set
> > # CONFIG_EEPROM_IDT_89HPESX is not set
> > # CONFIG_CB710_CORE is not set
> > =

> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # CONFIG_TI_ST is not set
> > CONFIG_SENSORS_LIS3_I2C=3Dy
> > =

> > #
> > # Altera FPGA firmware download module
> > #
> > CONFIG_ALTERA_STAPL=3Dy
> > # CONFIG_INTEL_MEI is not set
> > # CONFIG_INTEL_MEI_ME is not set
> > # CONFIG_INTEL_MEI_TXE is not set
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
> > # CONFIG_CXL_LIB is not set
> > CONFIG_HAVE_IDE=3Dy
> > =

> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dy
> > # CONFIG_SCSI_DMA is not set
> > # CONFIG_SCSI_NETLINK is not set
> > # CONFIG_FUSION is not set
> > =

> > #
> > # IEEE 1394 (FireWire) support
> > #
> > # CONFIG_FIREWIRE is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > # CONFIG_MACINTOSH_DRIVERS is not set
> > # CONFIG_NETDEVICES is not set
> > =

> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > CONFIG_INPUT_LEDS=3Dy
> > CONFIG_INPUT_FF_MEMLESS=3Dy
> > CONFIG_INPUT_POLLDEV=3Dy
> > CONFIG_INPUT_SPARSEKMAP=3Dy
> > # CONFIG_INPUT_MATRIXKMAP is not set
> > =

> > #
> > # Userland interfaces
> > #
> > CONFIG_INPUT_MOUSEDEV=3Dy
> > # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > CONFIG_INPUT_JOYDEV=3Dy
> > # CONFIG_INPUT_EVDEV is not set
> > CONFIG_INPUT_EVBUG=3Dy
> > =

> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > # CONFIG_KEYBOARD_ADP5589 is not set
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_QT1070 is not set
> > # CONFIG_KEYBOARD_QT2160 is not set
> > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
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
> > # CONFIG_KEYBOARD_OMAP4 is not set
> > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_KEYBOARD_CROS_EC is not set
> > # CONFIG_KEYBOARD_CAP11XX is not set
> > # CONFIG_KEYBOARD_BCM is not set
> > CONFIG_INPUT_MOUSE=3Dy
> > # CONFIG_MOUSE_PS2 is not set
> > CONFIG_MOUSE_SERIAL=3Dy
> > CONFIG_MOUSE_APPLETOUCH=3Dy
> > CONFIG_MOUSE_BCM5974=3Dy
> > CONFIG_MOUSE_CYAPA=3Dy
> > # CONFIG_MOUSE_ELAN_I2C is not set
> > CONFIG_MOUSE_VSXXXAA=3Dy
> > CONFIG_MOUSE_GPIO=3Dy
> > # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> > # CONFIG_MOUSE_SYNAPTICS_USB is not set
> > CONFIG_INPUT_JOYSTICK=3Dy
> > CONFIG_JOYSTICK_ANALOG=3Dy
> > CONFIG_JOYSTICK_A3D=3Dy
> > CONFIG_JOYSTICK_ADI=3Dy
> > CONFIG_JOYSTICK_COBRA=3Dy
> > # CONFIG_JOYSTICK_GF2K is not set
> > CONFIG_JOYSTICK_GRIP=3Dy
> > CONFIG_JOYSTICK_GRIP_MP=3Dy
> > CONFIG_JOYSTICK_GUILLEMOT=3Dy
> > # CONFIG_JOYSTICK_INTERACT is not set
> > # CONFIG_JOYSTICK_SIDEWINDER is not set
> > CONFIG_JOYSTICK_TMDC=3Dy
> > CONFIG_JOYSTICK_IFORCE=3Dy
> > # CONFIG_JOYSTICK_IFORCE_USB is not set
> > # CONFIG_JOYSTICK_IFORCE_232 is not set
> > CONFIG_JOYSTICK_WARRIOR=3Dy
> > # CONFIG_JOYSTICK_MAGELLAN is not set
> > # CONFIG_JOYSTICK_SPACEORB is not set
> > CONFIG_JOYSTICK_SPACEBALL=3Dy
> > # CONFIG_JOYSTICK_STINGER is not set
> > CONFIG_JOYSTICK_TWIDJOY=3Dy
> > CONFIG_JOYSTICK_ZHENHUA=3Dy
> > # CONFIG_JOYSTICK_DB9 is not set
> > CONFIG_JOYSTICK_GAMECON=3Dy
> > CONFIG_JOYSTICK_TURBOGRAFX=3Dy
> > CONFIG_JOYSTICK_AS5011=3Dy
> > CONFIG_JOYSTICK_JOYDUMP=3Dy
> > CONFIG_JOYSTICK_XPAD=3Dy
> > CONFIG_JOYSTICK_XPAD_FF=3Dy
> > CONFIG_JOYSTICK_XPAD_LEDS=3Dy
> > # CONFIG_JOYSTICK_PSXPAD_SPI is not set
> > CONFIG_INPUT_TABLET=3Dy
> > # CONFIG_TABLET_USB_ACECAD is not set
> > # CONFIG_TABLET_USB_AIPTEK is not set
> > CONFIG_TABLET_USB_GTCO=3Dy
> > CONFIG_TABLET_USB_HANWANG=3Dy
> > CONFIG_TABLET_USB_KBTAB=3Dy
> > CONFIG_TABLET_USB_PEGASUS=3Dy
> > CONFIG_TABLET_SERIAL_WACOM4=3Dy
> > CONFIG_INPUT_TOUCHSCREEN=3Dy
> > CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> > CONFIG_TOUCHSCREEN_88PM860X=3Dy
> > CONFIG_TOUCHSCREEN_ADS7846=3Dy
> > CONFIG_TOUCHSCREEN_AD7877=3Dy
> > CONFIG_TOUCHSCREEN_AD7879=3Dy
> > # CONFIG_TOUCHSCREEN_AD7879_I2C is not set
> > CONFIG_TOUCHSCREEN_AD7879_SPI=3Dy
> > CONFIG_TOUCHSCREEN_AR1021_I2C=3Dy
> > # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
> > # CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
> > CONFIG_TOUCHSCREEN_BU21013=3Dy
> > # CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
> > CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> > CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> > CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dy
> > CONFIG_TOUCHSCREEN_CYTTSP_SPI=3Dy
> > CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> > CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
> > CONFIG_TOUCHSCREEN_CYTTSP4_SPI=3Dy
> > # CONFIG_TOUCHSCREEN_DA9034 is not set
> > CONFIG_TOUCHSCREEN_DA9052=3Dy
> > CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> > CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> > CONFIG_TOUCHSCREEN_EETI=3Dy
> > CONFIG_TOUCHSCREEN_EGALAX=3Dy
> > # CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
> > CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> > CONFIG_TOUCHSCREEN_GOODIX=3Dy
> > # CONFIG_TOUCHSCREEN_ILI210X is not set
> > # CONFIG_TOUCHSCREEN_GUNZE is not set
> > # CONFIG_TOUCHSCREEN_EKTF2127 is not set
> > CONFIG_TOUCHSCREEN_ELAN=3Dy
> > # CONFIG_TOUCHSCREEN_ELO is not set
> > CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> > CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> > # CONFIG_TOUCHSCREEN_MAX11801 is not set
> > CONFIG_TOUCHSCREEN_MCS5000=3Dy
> > CONFIG_TOUCHSCREEN_MMS114=3Dy
> > # CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
> > CONFIG_TOUCHSCREEN_MTOUCH=3Dy
> > CONFIG_TOUCHSCREEN_IMX6UL_TSC=3Dy
> > # CONFIG_TOUCHSCREEN_INEXIO is not set
> > # CONFIG_TOUCHSCREEN_MK712 is not set
> > CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> > # CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
> > CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> > # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> > CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
> > CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> > # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
> > # CONFIG_TOUCHSCREEN_WM831X is not set
> > # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> > CONFIG_TOUCHSCREEN_MC13783=3Dy
> > CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> > CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> > CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> > # CONFIG_TOUCHSCREEN_TSC2004 is not set
> > CONFIG_TOUCHSCREEN_TSC2005=3Dy
> > CONFIG_TOUCHSCREEN_TSC2007=3Dy
> > CONFIG_TOUCHSCREEN_PCAP=3Dy
> > CONFIG_TOUCHSCREEN_RM_TS=3Dy
> > # CONFIG_TOUCHSCREEN_SILEAD is not set
> > # CONFIG_TOUCHSCREEN_SIS_I2C is not set
> > CONFIG_TOUCHSCREEN_ST1232=3Dy
> > # CONFIG_TOUCHSCREEN_STMFTS is not set
> > CONFIG_TOUCHSCREEN_SURFACE3_SPI=3Dy
> > # CONFIG_TOUCHSCREEN_SX8654 is not set
> > CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> > CONFIG_TOUCHSCREEN_ZET6223=3Dy
> > CONFIG_TOUCHSCREEN_ZFORCE=3Dy
> > # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> > # CONFIG_INPUT_MISC is not set
> > # CONFIG_RMI4_CORE is not set
> > =

> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > CONFIG_SERIO_SERPORT=3Dy
> > # CONFIG_SERIO_CT82C710 is not set
> > CONFIG_SERIO_PARKBD=3Dy
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=3Dy
> > CONFIG_SERIO_RAW=3Dy
> > CONFIG_SERIO_ALTERA_PS2=3Dy
> > CONFIG_SERIO_PS2MULT=3Dy
> > CONFIG_SERIO_ARC_PS2=3Dy
> > CONFIG_SERIO_APBPS2=3Dy
> > CONFIG_SERIO_OLPC_APSP=3Dy
> > CONFIG_USERIO=3Dy
> > CONFIG_GAMEPORT=3Dy
> > CONFIG_GAMEPORT_NS558=3Dy
> > CONFIG_GAMEPORT_L4=3Dy
> > # CONFIG_GAMEPORT_EMU10K1 is not set
> > # CONFIG_GAMEPORT_FM801 is not set
> > =

> > #
> > # Character devices
> > #
> > CONFIG_TTY=3Dy
> > # CONFIG_VT is not set
> > CONFIG_UNIX98_PTYS=3Dy
> > CONFIG_LEGACY_PTYS=3Dy
> > CONFIG_LEGACY_PTY_COUNT=3D256
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_NOZOMI is not set
> > # CONFIG_N_GSM is not set
> > # CONFIG_TRACE_SINK is not set
> > # CONFIG_GOLDFISH_TTY is not set
> > CONFIG_DEVMEM=3Dy
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
> > CONFIG_SERIAL_8250_PCI=3Dy
> > CONFIG_SERIAL_8250_EXAR=3Dy
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > # CONFIG_SERIAL_8250_EXTENDED is not set
> > # CONFIG_SERIAL_8250_ASPEED_VUART is not set
> > # CONFIG_SERIAL_8250_FSL is not set
> > # CONFIG_SERIAL_8250_DW is not set
> > # CONFIG_SERIAL_8250_RT288X is not set
> > CONFIG_SERIAL_8250_LPSS=3Dy
> > CONFIG_SERIAL_8250_MID=3Dy
> > # CONFIG_SERIAL_8250_MOXA is not set
> > # CONFIG_SERIAL_OF_PLATFORM is not set
> > =

> > #
> > # Non-8250 serial port support
> > #
> > # CONFIG_SERIAL_MAX3100 is not set
> > # CONFIG_SERIAL_MAX310X is not set
> > # CONFIG_SERIAL_UARTLITE is not set
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > # CONFIG_SERIAL_JSM is not set
> > # CONFIG_SERIAL_SCCNXP is not set
> > # CONFIG_SERIAL_SC16IS7XX is not set
> > # CONFIG_SERIAL_TIMBERDALE is not set
> > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > # CONFIG_SERIAL_ALTERA_UART is not set
> > # CONFIG_SERIAL_IFX6X60 is not set
> > # CONFIG_SERIAL_PCH_UART is not set
> > # CONFIG_SERIAL_XILINX_PS_UART is not set
> > # CONFIG_SERIAL_ARC is not set
> > # CONFIG_SERIAL_RP2 is not set
> > # CONFIG_SERIAL_FSL_LPUART is not set
> > # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> > # CONFIG_SERIAL_MEN_Z135 is not set
> > # CONFIG_SERIAL_DEV_BUS is not set
> > # CONFIG_TTY_PRINTK is not set
> > CONFIG_PRINTER=3Dy
> > # CONFIG_LP_CONSOLE is not set
> > # CONFIG_PPDEV is not set
> > CONFIG_IPMI_HANDLER=3Dy
> > CONFIG_IPMI_DMI_DECODE=3Dy
> > CONFIG_IPMI_PANIC_EVENT=3Dy
> > # CONFIG_IPMI_PANIC_STRING is not set
> > # CONFIG_IPMI_DEVICE_INTERFACE is not set
> > CONFIG_IPMI_SI=3Dy
> > CONFIG_IPMI_SSIF=3Dy
> > CONFIG_IPMI_WATCHDOG=3Dy
> > CONFIG_IPMI_POWEROFF=3Dy
> > # CONFIG_HW_RANDOM is not set
> > CONFIG_NVRAM=3Dy
> > # CONFIG_R3964 is not set
> > # CONFIG_APPLICOM is not set
> > # CONFIG_SONYPI is not set
> > # CONFIG_MWAVE is not set
> > CONFIG_SCx200_GPIO=3Dy
> > CONFIG_PC8736x_GPIO=3Dy
> > CONFIG_NSC_GPIO=3Dy
> > # CONFIG_HPET is not set
> > CONFIG_HANGCHECK_TIMER=3Dy
> > CONFIG_TCG_TPM=3Dy
> > CONFIG_TCG_TIS_CORE=3Dy
> > # CONFIG_TCG_TIS is not set
> > CONFIG_TCG_TIS_SPI=3Dy
> > # CONFIG_TCG_TIS_I2C_ATMEL is not set
> > # CONFIG_TCG_TIS_I2C_INFINEON is not set
> > # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> > CONFIG_TCG_NSC=3Dy
> > # CONFIG_TCG_ATMEL is not set
> > # CONFIG_TCG_INFINEON is not set
> > # CONFIG_TCG_CRB is not set
> > # CONFIG_TCG_VTPM_PROXY is not set
> > # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> > # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> > CONFIG_TELCLOCK=3Dy
> > CONFIG_DEVPORT=3Dy
> > CONFIG_XILLYBUS=3Dy
> > CONFIG_XILLYBUS_OF=3Dy
> > =

> > #
> > # I2C support
> > #
> > CONFIG_I2C=3Dy
> > CONFIG_ACPI_I2C_OPREGION=3Dy
> > CONFIG_I2C_BOARDINFO=3Dy
> > CONFIG_I2C_COMPAT=3Dy
> > CONFIG_I2C_CHARDEV=3Dy
> > CONFIG_I2C_MUX=3Dy
> > =

> > #
> > # Multiplexer I2C Chip support
> > #
> > # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> > # CONFIG_I2C_MUX_GPIO is not set
> > CONFIG_I2C_MUX_GPMUX=3Dy
> > CONFIG_I2C_MUX_LTC4306=3Dy
> > # CONFIG_I2C_MUX_PCA9541 is not set
> > # CONFIG_I2C_MUX_PCA954x is not set
> > CONFIG_I2C_MUX_REG=3Dy
> > # CONFIG_I2C_MUX_MLXCPLD is not set
> > CONFIG_I2C_HELPER_AUTO=3Dy
> > CONFIG_I2C_ALGOBIT=3Dy
> > =

> > #
> > # I2C Hardware Bus support
> > #
> > =

> > #
> > # PC SMBus host controller drivers
> > #
> > # CONFIG_I2C_ALI1535 is not set
> > # CONFIG_I2C_ALI1563 is not set
> > # CONFIG_I2C_ALI15X3 is not set
> > # CONFIG_I2C_AMD756 is not set
> > # CONFIG_I2C_AMD8111 is not set
> > # CONFIG_I2C_I801 is not set
> > # CONFIG_I2C_ISCH is not set
> > # CONFIG_I2C_ISMT is not set
> > # CONFIG_I2C_PIIX4 is not set
> > # CONFIG_I2C_NFORCE2 is not set
> > # CONFIG_I2C_SIS5595 is not set
> > # CONFIG_I2C_SIS630 is not set
> > # CONFIG_I2C_SIS96X is not set
> > # CONFIG_I2C_VIA is not set
> > # CONFIG_I2C_VIAPRO is not set
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_I2C_SCMI is not set
> > =

> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > CONFIG_I2C_CBUS_GPIO=3Dy
> > CONFIG_I2C_DESIGNWARE_CORE=3Dy
> > CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> > # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > # CONFIG_I2C_EG20T is not set
> > # CONFIG_I2C_EMEV2 is not set
> > # CONFIG_I2C_GPIO is not set
> > # CONFIG_I2C_KEMPLD is not set
> > CONFIG_I2C_OCORES=3Dy
> > # CONFIG_I2C_PCA_PLATFORM is not set
> > # CONFIG_I2C_PXA is not set
> > # CONFIG_I2C_PXA_PCI is not set
> > # CONFIG_I2C_RK3X is not set
> > CONFIG_I2C_SIMTEC=3Dy
> > # CONFIG_I2C_XILINX is not set
> > =

> > #
> > # External I2C/SMBus adapter drivers
> > #
> > # CONFIG_I2C_DIOLAN_U2C is not set
> > # CONFIG_I2C_PARPORT is not set
> > # CONFIG_I2C_PARPORT_LIGHT is not set
> > # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> > # CONFIG_I2C_TAOS_EVM is not set
> > CONFIG_I2C_TINY_USB=3Dy
> > CONFIG_I2C_VIPERBOARD=3Dy
> > =

> > #
> > # Other I2C/SMBus bus drivers
> > #
> > CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> > # CONFIG_SCx200_ACB is not set
> > # CONFIG_I2C_SLAVE is not set
> > # CONFIG_I2C_DEBUG_CORE is not set
> > # CONFIG_I2C_DEBUG_ALGO is not set
> > # CONFIG_I2C_DEBUG_BUS is not set
> > CONFIG_SPI=3Dy
> > CONFIG_SPI_DEBUG=3Dy
> > CONFIG_SPI_MASTER=3Dy
> > =

> > #
> > # SPI Master Controller Drivers
> > #
> > CONFIG_SPI_ALTERA=3Dy
> > CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> > CONFIG_SPI_BITBANG=3Dy
> > # CONFIG_SPI_BUTTERFLY is not set
> > CONFIG_SPI_CADENCE=3Dy
> > CONFIG_SPI_DESIGNWARE=3Dy
> > # CONFIG_SPI_DW_PCI is not set
> > # CONFIG_SPI_DW_MMIO is not set
> > CONFIG_SPI_GPIO=3Dy
> > CONFIG_SPI_LM70_LLP=3Dy
> > # CONFIG_SPI_FSL_SPI is not set
> > # CONFIG_SPI_OC_TINY is not set
> > # CONFIG_SPI_PXA2XX is not set
> > # CONFIG_SPI_PXA2XX_PCI is not set
> > CONFIG_SPI_ROCKCHIP=3Dy
> > CONFIG_SPI_SC18IS602=3Dy
> > # CONFIG_SPI_TOPCLIFF_PCH is not set
> > CONFIG_SPI_XCOMM=3Dy
> > CONFIG_SPI_XILINX=3Dy
> > CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> > =

> > #
> > # SPI Protocol Masters
> > #
> > CONFIG_SPI_SPIDEV=3Dy
> > CONFIG_SPI_TLE62X0=3Dy
> > # CONFIG_SPI_SLAVE is not set
> > CONFIG_SPMI=3Dy
> > # CONFIG_HSI is not set
> > CONFIG_PPS=3Dy
> > # CONFIG_PPS_DEBUG is not set
> > CONFIG_NTP_PPS=3Dy
> > =

> > #
> > # PPS clients support
> > #
> > CONFIG_PPS_CLIENT_KTIMER=3Dy
> > # CONFIG_PPS_CLIENT_LDISC is not set
> > # CONFIG_PPS_CLIENT_PARPORT is not set
> > CONFIG_PPS_CLIENT_GPIO=3Dy
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
> > CONFIG_OF_GPIO=3Dy
> > CONFIG_GPIO_ACPI=3Dy
> > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > CONFIG_DEBUG_GPIO=3Dy
> > # CONFIG_GPIO_SYSFS is not set
> > CONFIG_GPIO_GENERIC=3Dy
> > =

> > #
> > # Memory mapped GPIO drivers
> > #
> > CONFIG_GPIO_74XX_MMIO=3Dy
> > CONFIG_GPIO_ALTERA=3Dy
> > # CONFIG_GPIO_AMDPT is not set
> > # CONFIG_GPIO_AXP209 is not set
> > CONFIG_GPIO_DWAPB=3Dy
> > # CONFIG_GPIO_EXAR is not set
> > # CONFIG_GPIO_FTGPIO010 is not set
> > CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> > # CONFIG_GPIO_GRGPIO is not set
> > # CONFIG_GPIO_ICH is not set
> > # CONFIG_GPIO_LYNXPOINT is not set
> > # CONFIG_GPIO_MENZ127 is not set
> > # CONFIG_GPIO_MOCKUP is not set
> > # CONFIG_GPIO_SYSCON is not set
> > # CONFIG_GPIO_VX855 is not set
> > CONFIG_GPIO_XILINX=3Dy
> > =

> > #
> > # Port-mapped I/O GPIO drivers
> > #
> > CONFIG_GPIO_F7188X=3Dy
> > # CONFIG_GPIO_IT87 is not set
> > # CONFIG_GPIO_SCH is not set
> > # CONFIG_GPIO_SCH311X is not set
> > =

> > #
> > # I2C GPIO expanders
> > #
> > CONFIG_GPIO_ADP5588=3Dy
> > # CONFIG_GPIO_ADP5588_IRQ is not set
> > # CONFIG_GPIO_ADNP is not set
> > # CONFIG_GPIO_MAX7300 is not set
> > CONFIG_GPIO_MAX732X=3Dy
> > CONFIG_GPIO_MAX732X_IRQ=3Dy
> > CONFIG_GPIO_PCA953X=3Dy
> > # CONFIG_GPIO_PCA953X_IRQ is not set
> > CONFIG_GPIO_PCF857X=3Dy
> > # CONFIG_GPIO_TPIC2810 is not set
> > =

> > #
> > # MFD GPIO expanders
> > #
> > # CONFIG_GPIO_ARIZONA is not set
> > CONFIG_GPIO_DA9052=3Dy
> > CONFIG_GPIO_DA9055=3Dy
> > CONFIG_GPIO_KEMPLD=3Dy
> > CONFIG_GPIO_LP3943=3Dy
> > CONFIG_GPIO_LP873X=3Dy
> > CONFIG_GPIO_LP87565=3Dy
> > CONFIG_GPIO_MAX77620=3Dy
> > CONFIG_GPIO_RC5T583=3Dy
> > CONFIG_GPIO_TPS65086=3Dy
> > # CONFIG_GPIO_TPS65218 is not set
> > # CONFIG_GPIO_TPS65910 is not set
> > CONFIG_GPIO_TPS65912=3Dy
> > # CONFIG_GPIO_WM831X is not set
> > # CONFIG_GPIO_WM8994 is not set
> > =

> > #
> > # PCI GPIO expanders
> > #
> > # CONFIG_GPIO_AMD8111 is not set
> > # CONFIG_GPIO_BT8XX is not set
> > # CONFIG_GPIO_ML_IOH is not set
> > # CONFIG_GPIO_PCH is not set
> > # CONFIG_GPIO_PCI_IDIO_16 is not set
> > # CONFIG_GPIO_RDC321X is not set
> > # CONFIG_GPIO_SODAVILLE is not set
> > =

> > #
> > # SPI GPIO expanders
> > #
> > CONFIG_GPIO_74X164=3Dy
> > # CONFIG_GPIO_MAX7301 is not set
> > # CONFIG_GPIO_MC33880 is not set
> > # CONFIG_GPIO_PISOSR is not set
> > CONFIG_GPIO_XRA1403=3Dy
> > =

> > #
> > # USB GPIO expanders
> > #
> > CONFIG_GPIO_VIPERBOARD=3Dy
> > CONFIG_W1=3Dy
> > =

> > #
> > # 1-wire Bus Masters
> > #
> > # CONFIG_W1_MASTER_MATROX is not set
> > CONFIG_W1_MASTER_DS2490=3Dy
> > # CONFIG_W1_MASTER_DS2482 is not set
> > CONFIG_W1_MASTER_DS1WM=3Dy
> > CONFIG_W1_MASTER_GPIO=3Dy
> > =

> > #
> > # 1-wire Slaves
> > #
> > CONFIG_W1_SLAVE_THERM=3Dy
> > # CONFIG_W1_SLAVE_SMEM is not set
> > # CONFIG_W1_SLAVE_DS2405 is not set
> > CONFIG_W1_SLAVE_DS2408=3Dy
> > CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> > CONFIG_W1_SLAVE_DS2413=3Dy
> > CONFIG_W1_SLAVE_DS2406=3Dy
> > CONFIG_W1_SLAVE_DS2423=3Dy
> > CONFIG_W1_SLAVE_DS2431=3Dy
> > # CONFIG_W1_SLAVE_DS2433 is not set
> > CONFIG_W1_SLAVE_DS2438=3Dy
> > # CONFIG_W1_SLAVE_DS2760 is not set
> > # CONFIG_W1_SLAVE_DS2780 is not set
> > CONFIG_W1_SLAVE_DS2781=3Dy
> > CONFIG_W1_SLAVE_DS28E04=3Dy
> > # CONFIG_W1_SLAVE_BQ27000 is not set
> > # CONFIG_POWER_AVS is not set
> > CONFIG_POWER_RESET=3Dy
> > # CONFIG_POWER_RESET_AS3722 is not set
> > CONFIG_POWER_RESET_GPIO=3Dy
> > CONFIG_POWER_RESET_GPIO_RESTART=3Dy
> > CONFIG_POWER_RESET_LTC2952=3Dy
> > CONFIG_POWER_RESET_RESTART=3Dy
> > CONFIG_POWER_RESET_SYSCON=3Dy
> > # CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
> > # CONFIG_SYSCON_REBOOT_MODE is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > CONFIG_POWER_SUPPLY_DEBUG=3Dy
> > # CONFIG_PDA_POWER is not set
> > # CONFIG_WM831X_BACKUP is not set
> > CONFIG_WM831X_POWER=3Dy
> > # CONFIG_TEST_POWER is not set
> > # CONFIG_BATTERY_88PM860X is not set
> > # CONFIG_BATTERY_ACT8945A is not set
> > # CONFIG_BATTERY_DS2780 is not set
> > CONFIG_BATTERY_DS2781=3Dy
> > CONFIG_BATTERY_DS2782=3Dy
> > CONFIG_BATTERY_OLPC=3Dy
> > CONFIG_BATTERY_SBS=3Dy
> > CONFIG_CHARGER_SBS=3Dy
> > # CONFIG_BATTERY_BQ27XXX is not set
> > # CONFIG_BATTERY_DA9030 is not set
> > # CONFIG_BATTERY_DA9052 is not set
> > # CONFIG_AXP288_CHARGER is not set
> > CONFIG_BATTERY_MAX17040=3Dy
> > # CONFIG_BATTERY_MAX17042 is not set
> > CONFIG_CHARGER_PCF50633=3Dy
> > CONFIG_CHARGER_ISP1704=3Dy
> > CONFIG_CHARGER_MAX8903=3Dy
> > CONFIG_CHARGER_LP8727=3Dy
> > CONFIG_CHARGER_GPIO=3Dy
> > # CONFIG_CHARGER_MANAGER is not set
> > CONFIG_CHARGER_LTC3651=3Dy
> > # CONFIG_CHARGER_MAX14577 is not set
> > # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> > CONFIG_CHARGER_MAX77693=3Dy
> > # CONFIG_CHARGER_MAX8997 is not set
> > # CONFIG_CHARGER_BQ2415X is not set
> > CONFIG_CHARGER_BQ24190=3Dy
> > CONFIG_CHARGER_BQ24257=3Dy
> > # CONFIG_CHARGER_BQ24735 is not set
> > # CONFIG_CHARGER_BQ25890 is not set
> > CONFIG_CHARGER_SMB347=3Dy
> > # CONFIG_CHARGER_TPS65090 is not set
> > CONFIG_CHARGER_TPS65217=3Dy
> > # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> > CONFIG_BATTERY_GOLDFISH=3Dy
> > # CONFIG_BATTERY_RT5033 is not set
> > CONFIG_CHARGER_RT9455=3Dy
> > CONFIG_HWMON=3Dy
> > CONFIG_HWMON_VID=3Dy
> > # CONFIG_HWMON_DEBUG_CHIP is not set
> > =

> > #
> > # Native drivers
> > #
> > # CONFIG_SENSORS_ABITUGURU is not set
> > CONFIG_SENSORS_ABITUGURU3=3Dy
> > CONFIG_SENSORS_AD7314=3Dy
> > CONFIG_SENSORS_AD7414=3Dy
> > CONFIG_SENSORS_AD7418=3Dy
> > CONFIG_SENSORS_ADM1021=3Dy
> > CONFIG_SENSORS_ADM1025=3Dy
> > CONFIG_SENSORS_ADM1026=3Dy
> > # CONFIG_SENSORS_ADM1029 is not set
> > # CONFIG_SENSORS_ADM1031 is not set
> > CONFIG_SENSORS_ADM9240=3Dy
> > CONFIG_SENSORS_ADT7X10=3Dy
> > CONFIG_SENSORS_ADT7310=3Dy
> > CONFIG_SENSORS_ADT7410=3Dy
> > # CONFIG_SENSORS_ADT7411 is not set
> > CONFIG_SENSORS_ADT7462=3Dy
> > # CONFIG_SENSORS_ADT7470 is not set
> > CONFIG_SENSORS_ADT7475=3Dy
> > CONFIG_SENSORS_ASC7621=3Dy
> > # CONFIG_SENSORS_K8TEMP is not set
> > # CONFIG_SENSORS_K10TEMP is not set
> > # CONFIG_SENSORS_FAM15H_POWER is not set
> > CONFIG_SENSORS_APPLESMC=3Dy
> > CONFIG_SENSORS_ASB100=3Dy
> > CONFIG_SENSORS_ASPEED=3Dy
> > # CONFIG_SENSORS_ATXP1 is not set
> > # CONFIG_SENSORS_DS620 is not set
> > CONFIG_SENSORS_DS1621=3Dy
> > CONFIG_SENSORS_DELL_SMM=3Dy
> > # CONFIG_SENSORS_DA9052_ADC is not set
> > # CONFIG_SENSORS_DA9055 is not set
> > # CONFIG_SENSORS_I5K_AMB is not set
> > # CONFIG_SENSORS_F71805F is not set
> > CONFIG_SENSORS_F71882FG=3Dy
> > # CONFIG_SENSORS_F75375S is not set
> > # CONFIG_SENSORS_MC13783_ADC is not set
> > CONFIG_SENSORS_FSCHMD=3Dy
> > # CONFIG_SENSORS_GL518SM is not set
> > CONFIG_SENSORS_GL520SM=3Dy
> > CONFIG_SENSORS_G760A=3Dy
> > CONFIG_SENSORS_G762=3Dy
> > CONFIG_SENSORS_GPIO_FAN=3Dy
> > CONFIG_SENSORS_HIH6130=3Dy
> > CONFIG_SENSORS_IBMAEM=3Dy
> > # CONFIG_SENSORS_IBMPEX is not set
> > # CONFIG_SENSORS_I5500 is not set
> > CONFIG_SENSORS_CORETEMP=3Dy
> > CONFIG_SENSORS_IT87=3Dy
> > # CONFIG_SENSORS_JC42 is not set
> > # CONFIG_SENSORS_POWR1220 is not set
> > CONFIG_SENSORS_LINEAGE=3Dy
> > CONFIG_SENSORS_LTC2945=3Dy
> > CONFIG_SENSORS_LTC2990=3Dy
> > CONFIG_SENSORS_LTC4151=3Dy
> > CONFIG_SENSORS_LTC4215=3Dy
> > CONFIG_SENSORS_LTC4222=3Dy
> > # CONFIG_SENSORS_LTC4245 is not set
> > # CONFIG_SENSORS_LTC4260 is not set
> > # CONFIG_SENSORS_LTC4261 is not set
> > CONFIG_SENSORS_MAX1111=3Dy
> > # CONFIG_SENSORS_MAX16065 is not set
> > CONFIG_SENSORS_MAX1619=3Dy
> > CONFIG_SENSORS_MAX1668=3Dy
> > # CONFIG_SENSORS_MAX197 is not set
> > CONFIG_SENSORS_MAX31722=3Dy
> > CONFIG_SENSORS_MAX6639=3Dy
> > CONFIG_SENSORS_MAX6642=3Dy
> > # CONFIG_SENSORS_MAX6650 is not set
> > # CONFIG_SENSORS_MAX6697 is not set
> > CONFIG_SENSORS_MAX31790=3Dy
> > # CONFIG_SENSORS_MCP3021 is not set
> > # CONFIG_SENSORS_TC654 is not set
> > CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> > # CONFIG_SENSORS_ADCXX is not set
> > CONFIG_SENSORS_LM63=3Dy
> > CONFIG_SENSORS_LM70=3Dy
> > CONFIG_SENSORS_LM73=3Dy
> > CONFIG_SENSORS_LM75=3Dy
> > CONFIG_SENSORS_LM77=3Dy
> > CONFIG_SENSORS_LM78=3Dy
> > # CONFIG_SENSORS_LM80 is not set
> > CONFIG_SENSORS_LM83=3Dy
> > CONFIG_SENSORS_LM85=3Dy
> > # CONFIG_SENSORS_LM87 is not set
> > # CONFIG_SENSORS_LM90 is not set
> > CONFIG_SENSORS_LM92=3Dy
> > CONFIG_SENSORS_LM93=3Dy
> > # CONFIG_SENSORS_LM95234 is not set
> > CONFIG_SENSORS_LM95241=3Dy
> > CONFIG_SENSORS_LM95245=3Dy
> > CONFIG_SENSORS_PC87360=3Dy
> > CONFIG_SENSORS_PC87427=3Dy
> > CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> > CONFIG_SENSORS_NCT6683=3Dy
> > # CONFIG_SENSORS_NCT6775 is not set
> > CONFIG_SENSORS_NCT7802=3Dy
> > # CONFIG_SENSORS_NCT7904 is not set
> > CONFIG_SENSORS_PCF8591=3Dy
> > # CONFIG_PMBUS is not set
> > CONFIG_SENSORS_PWM_FAN=3Dy
> > # CONFIG_SENSORS_SHT15 is not set
> > CONFIG_SENSORS_SHT21=3Dy
> > CONFIG_SENSORS_SHT3x=3Dy
> > # CONFIG_SENSORS_SHTC1 is not set
> > # CONFIG_SENSORS_SIS5595 is not set
> > CONFIG_SENSORS_DME1737=3Dy
> > CONFIG_SENSORS_EMC1403=3Dy
> > # CONFIG_SENSORS_EMC2103 is not set
> > # CONFIG_SENSORS_EMC6W201 is not set
> > CONFIG_SENSORS_SMSC47M1=3Dy
> > # CONFIG_SENSORS_SMSC47M192 is not set
> > CONFIG_SENSORS_SMSC47B397=3Dy
> > # CONFIG_SENSORS_SCH56XX_COMMON is not set
> > # CONFIG_SENSORS_STTS751 is not set
> > CONFIG_SENSORS_SMM665=3Dy
> > CONFIG_SENSORS_ADC128D818=3Dy
> > CONFIG_SENSORS_ADS1015=3Dy
> > CONFIG_SENSORS_ADS7828=3Dy
> > CONFIG_SENSORS_ADS7871=3Dy
> > # CONFIG_SENSORS_AMC6821 is not set
> > # CONFIG_SENSORS_INA209 is not set
> > CONFIG_SENSORS_INA2XX=3Dy
> > CONFIG_SENSORS_INA3221=3Dy
> > # CONFIG_SENSORS_TC74 is not set
> > CONFIG_SENSORS_THMC50=3Dy
> > CONFIG_SENSORS_TMP102=3Dy
> > # CONFIG_SENSORS_TMP103 is not set
> > CONFIG_SENSORS_TMP108=3Dy
> > CONFIG_SENSORS_TMP401=3Dy
> > CONFIG_SENSORS_TMP421=3Dy
> > CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> > # CONFIG_SENSORS_VIA686A is not set
> > # CONFIG_SENSORS_VT1211 is not set
> > # CONFIG_SENSORS_VT8231 is not set
> > CONFIG_SENSORS_W83781D=3Dy
> > CONFIG_SENSORS_W83791D=3Dy
> > # CONFIG_SENSORS_W83792D is not set
> > CONFIG_SENSORS_W83793=3Dy
> > # CONFIG_SENSORS_W83795 is not set
> > CONFIG_SENSORS_W83L785TS=3Dy
> > CONFIG_SENSORS_W83L786NG=3Dy
> > # CONFIG_SENSORS_W83627HF is not set
> > CONFIG_SENSORS_W83627EHF=3Dy
> > # CONFIG_SENSORS_WM831X is not set
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_SENSORS_ACPI_POWER is not set
> > # CONFIG_SENSORS_ATK0110 is not set
> > CONFIG_THERMAL=3Dy
> > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> > # CONFIG_THERMAL_HWMON is not set
> > CONFIG_THERMAL_OF=3Dy
> > # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> > CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_GOV_BANG_BANG is not set
> > # CONFIG_THERMAL_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> > # CONFIG_CPU_THERMAL is not set
> > # CONFIG_THERMAL_EMULATION is not set
> > CONFIG_MAX77620_THERMAL=3Dy
> > # CONFIG_QORIQ_THERMAL is not set
> > CONFIG_DA9062_THERMAL=3Dy
> > # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> > =

> > #
> > # ACPI INT340X thermal drivers
> > #
> > # CONFIG_INT340X_THERMAL is not set
> > # CONFIG_INTEL_PCH_THERMAL is not set
> > # CONFIG_WATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=3Dy
> > =

> > #
> > # Sonics Silicon Backplane
> > #
> > CONFIG_SSB=3Dy
> > CONFIG_SSB_SPROM=3Dy
> > CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> > CONFIG_SSB_PCIHOST=3Dy
> > # CONFIG_SSB_B43_PCI_BRIDGE is not set
> > CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> > CONFIG_SSB_SDIOHOST=3Dy
> > # CONFIG_SSB_SILENT is not set
> > # CONFIG_SSB_DEBUG is not set
> > CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> > # CONFIG_SSB_DRIVER_PCICORE is not set
> > CONFIG_SSB_DRIVER_GPIO=3Dy
> > CONFIG_BCMA_POSSIBLE=3Dy
> > =

> > #
> > # Broadcom specific AMBA
> > #
> > CONFIG_BCMA=3Dy
> > CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > CONFIG_BCMA_HOST_PCI=3Dy
> > CONFIG_BCMA_HOST_SOC=3Dy
> > CONFIG_BCMA_DRIVER_PCI=3Dy
> > CONFIG_BCMA_SFLASH=3Dy
> > CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> > CONFIG_BCMA_DRIVER_GPIO=3Dy
> > # CONFIG_BCMA_DEBUG is not set
> > =

> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dy
> > # CONFIG_MFD_CS5535 is not set
> > CONFIG_MFD_ACT8945A=3Dy
> > CONFIG_MFD_AS3711=3Dy
> > CONFIG_MFD_AS3722=3Dy
> > # CONFIG_PMIC_ADP5520 is not set
> > # CONFIG_MFD_AAT2870_CORE is not set
> > # CONFIG_MFD_ATMEL_FLEXCOM is not set
> > CONFIG_MFD_ATMEL_HLCDC=3Dy
> > CONFIG_MFD_BCM590XX=3Dy
> > CONFIG_MFD_AXP20X=3Dy
> > CONFIG_MFD_AXP20X_I2C=3Dy
> > CONFIG_MFD_CROS_EC=3Dy
> > # CONFIG_MFD_CROS_EC_I2C is not set
> > CONFIG_MFD_CROS_EC_SPI=3Dy
> > CONFIG_PMIC_DA903X=3Dy
> > CONFIG_PMIC_DA9052=3Dy
> > CONFIG_MFD_DA9052_SPI=3Dy
> > # CONFIG_MFD_DA9052_I2C is not set
> > CONFIG_MFD_DA9055=3Dy
> > CONFIG_MFD_DA9062=3Dy
> > # CONFIG_MFD_DA9063 is not set
> > # CONFIG_MFD_DA9150 is not set
> > # CONFIG_MFD_DLN2 is not set
> > CONFIG_MFD_MC13XXX=3Dy
> > CONFIG_MFD_MC13XXX_SPI=3Dy
> > # CONFIG_MFD_MC13XXX_I2C is not set
> > # CONFIG_MFD_HI6421_PMIC is not set
> > CONFIG_HTC_PASIC3=3Dy
> > # CONFIG_HTC_I2CPLD is not set
> > # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_LPC_SCH is not set
> > # CONFIG_INTEL_SOC_PMIC is not set
> > # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> > # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> > # CONFIG_MFD_INTEL_LPSS_PCI is not set
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > CONFIG_MFD_KEMPLD=3Dy
> > CONFIG_MFD_88PM800=3Dy
> > # CONFIG_MFD_88PM805 is not set
> > CONFIG_MFD_88PM860X=3Dy
> > CONFIG_MFD_MAX14577=3Dy
> > CONFIG_MFD_MAX77620=3Dy
> > # CONFIG_MFD_MAX77686 is not set
> > CONFIG_MFD_MAX77693=3Dy
> > CONFIG_MFD_MAX77843=3Dy
> > CONFIG_MFD_MAX8907=3Dy
> > # CONFIG_MFD_MAX8925 is not set
> > CONFIG_MFD_MAX8997=3Dy
> > # CONFIG_MFD_MAX8998 is not set
> > CONFIG_MFD_MT6397=3Dy
> > CONFIG_MFD_MENF21BMC=3Dy
> > CONFIG_EZX_PCAP=3Dy
> > CONFIG_MFD_CPCAP=3Dy
> > CONFIG_MFD_VIPERBOARD=3Dy
> > CONFIG_MFD_RETU=3Dy
> > CONFIG_MFD_PCF50633=3Dy
> > # CONFIG_PCF50633_ADC is not set
> > CONFIG_PCF50633_GPIO=3Dy
> > # CONFIG_MFD_RDC321X is not set
> > # CONFIG_MFD_RTSX_PCI is not set
> > CONFIG_MFD_RT5033=3Dy
> > CONFIG_MFD_RTSX_USB=3Dy
> > CONFIG_MFD_RC5T583=3Dy
> > CONFIG_MFD_RK808=3Dy
> > CONFIG_MFD_RN5T618=3Dy
> > # CONFIG_MFD_SEC_CORE is not set
> > # CONFIG_MFD_SI476X_CORE is not set
> > CONFIG_MFD_SM501=3Dy
> > # CONFIG_MFD_SM501_GPIO is not set
> > CONFIG_MFD_SKY81452=3Dy
> > # CONFIG_MFD_SMSC is not set
> > # CONFIG_ABX500_CORE is not set
> > # CONFIG_MFD_STMPE is not set
> > CONFIG_MFD_SYSCON=3Dy
> > CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> > CONFIG_MFD_LP3943=3Dy
> > CONFIG_MFD_LP8788=3Dy
> > # CONFIG_MFD_TI_LMU is not set
> > # CONFIG_MFD_PALMAS is not set
> > CONFIG_TPS6105X=3Dy
> > # CONFIG_TPS65010 is not set
> > CONFIG_TPS6507X=3Dy
> > CONFIG_MFD_TPS65086=3Dy
> > CONFIG_MFD_TPS65090=3Dy
> > CONFIG_MFD_TPS65217=3Dy
> > CONFIG_MFD_TI_LP873X=3Dy
> > CONFIG_MFD_TI_LP87565=3Dy
> > CONFIG_MFD_TPS65218=3Dy
> > # CONFIG_MFD_TPS6586X is not set
> > CONFIG_MFD_TPS65910=3Dy
> > CONFIG_MFD_TPS65912=3Dy
> > CONFIG_MFD_TPS65912_I2C=3Dy
> > CONFIG_MFD_TPS65912_SPI=3Dy
> > CONFIG_MFD_TPS80031=3Dy
> > # CONFIG_TWL4030_CORE is not set
> > # CONFIG_TWL6040_CORE is not set
> > CONFIG_MFD_WL1273_CORE=3Dy
> > CONFIG_MFD_LM3533=3Dy
> > # CONFIG_MFD_TIMBERDALE is not set
> > # CONFIG_MFD_TC3589X is not set
> > # CONFIG_MFD_TMIO is not set
> > # CONFIG_MFD_VX855 is not set
> > CONFIG_MFD_ARIZONA=3Dy
> > CONFIG_MFD_ARIZONA_I2C=3Dy
> > CONFIG_MFD_ARIZONA_SPI=3Dy
> > # CONFIG_MFD_CS47L24 is not set
> > CONFIG_MFD_WM5102=3Dy
> > CONFIG_MFD_WM5110=3Dy
> > CONFIG_MFD_WM8997=3Dy
> > CONFIG_MFD_WM8998=3Dy
> > CONFIG_MFD_WM8400=3Dy
> > CONFIG_MFD_WM831X=3Dy
> > CONFIG_MFD_WM831X_I2C=3Dy
> > CONFIG_MFD_WM831X_SPI=3Dy
> > # CONFIG_MFD_WM8350_I2C is not set
> > CONFIG_MFD_WM8994=3Dy
> > CONFIG_REGULATOR=3Dy
> > CONFIG_REGULATOR_DEBUG=3Dy
> > CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> > # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> > # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> > CONFIG_REGULATOR_88PM800=3Dy
> > CONFIG_REGULATOR_88PM8607=3Dy
> > CONFIG_REGULATOR_ACT8865=3Dy
> > CONFIG_REGULATOR_ACT8945A=3Dy
> > # CONFIG_REGULATOR_AD5398 is not set
> > CONFIG_REGULATOR_ANATOP=3Dy
> > # CONFIG_REGULATOR_AS3711 is not set
> > # CONFIG_REGULATOR_AS3722 is not set
> > CONFIG_REGULATOR_AXP20X=3Dy
> > CONFIG_REGULATOR_BCM590XX=3Dy
> > # CONFIG_REGULATOR_CPCAP is not set
> > CONFIG_REGULATOR_DA903X=3Dy
> > CONFIG_REGULATOR_DA9052=3Dy
> > # CONFIG_REGULATOR_DA9055 is not set
> > CONFIG_REGULATOR_DA9062=3Dy
> > CONFIG_REGULATOR_DA9210=3Dy
> > CONFIG_REGULATOR_DA9211=3Dy
> > CONFIG_REGULATOR_FAN53555=3Dy
> > CONFIG_REGULATOR_GPIO=3Dy
> > CONFIG_REGULATOR_ISL9305=3Dy
> > CONFIG_REGULATOR_ISL6271A=3Dy
> > CONFIG_REGULATOR_LP3971=3Dy
> > CONFIG_REGULATOR_LP3972=3Dy
> > CONFIG_REGULATOR_LP872X=3Dy
> > CONFIG_REGULATOR_LP873X=3Dy
> > CONFIG_REGULATOR_LP8755=3Dy
> > # CONFIG_REGULATOR_LP87565 is not set
> > # CONFIG_REGULATOR_LP8788 is not set
> > CONFIG_REGULATOR_LTC3589=3Dy
> > CONFIG_REGULATOR_LTC3676=3Dy
> > CONFIG_REGULATOR_MAX14577=3Dy
> > # CONFIG_REGULATOR_MAX1586 is not set
> > CONFIG_REGULATOR_MAX77620=3Dy
> > # CONFIG_REGULATOR_MAX8649 is not set
> > CONFIG_REGULATOR_MAX8660=3Dy
> > CONFIG_REGULATOR_MAX8907=3Dy
> > CONFIG_REGULATOR_MAX8952=3Dy
> > CONFIG_REGULATOR_MAX8973=3Dy
> > CONFIG_REGULATOR_MAX8997=3Dy
> > CONFIG_REGULATOR_MAX77693=3Dy
> > CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> > CONFIG_REGULATOR_MC13783=3Dy
> > # CONFIG_REGULATOR_MC13892 is not set
> > CONFIG_REGULATOR_MT6311=3Dy
> > # CONFIG_REGULATOR_MT6323 is not set
> > CONFIG_REGULATOR_MT6397=3Dy
> > CONFIG_REGULATOR_PCAP=3Dy
> > # CONFIG_REGULATOR_PCF50633 is not set
> > CONFIG_REGULATOR_PFUZE100=3Dy
> > CONFIG_REGULATOR_PV88060=3Dy
> > CONFIG_REGULATOR_PV88080=3Dy
> > # CONFIG_REGULATOR_PV88090 is not set
> > CONFIG_REGULATOR_PWM=3Dy
> > CONFIG_REGULATOR_QCOM_SPMI=3Dy
> > CONFIG_REGULATOR_RC5T583=3Dy
> > # CONFIG_REGULATOR_RK808 is not set
> > CONFIG_REGULATOR_RN5T618=3Dy
> > CONFIG_REGULATOR_RT5033=3Dy
> > CONFIG_REGULATOR_SKY81452=3Dy
> > CONFIG_REGULATOR_TPS51632=3Dy
> > # CONFIG_REGULATOR_TPS6105X is not set
> > CONFIG_REGULATOR_TPS62360=3Dy
> > # CONFIG_REGULATOR_TPS65023 is not set
> > CONFIG_REGULATOR_TPS6507X=3Dy
> > # CONFIG_REGULATOR_TPS65086 is not set
> > CONFIG_REGULATOR_TPS65090=3Dy
> > CONFIG_REGULATOR_TPS65132=3Dy
> > CONFIG_REGULATOR_TPS65217=3Dy
> > CONFIG_REGULATOR_TPS65218=3Dy
> > # CONFIG_REGULATOR_TPS6524X is not set
> > CONFIG_REGULATOR_TPS65910=3Dy
> > # CONFIG_REGULATOR_TPS65912 is not set
> > CONFIG_REGULATOR_TPS80031=3Dy
> > # CONFIG_REGULATOR_VCTRL is not set
> > CONFIG_REGULATOR_WM831X=3Dy
> > CONFIG_REGULATOR_WM8400=3Dy
> > CONFIG_REGULATOR_WM8994=3Dy
> > # CONFIG_MEDIA_SUPPORT is not set
> > =

> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=3D16
> > # CONFIG_VGA_SWITCHEROO is not set
> > CONFIG_DRM=3Dy
> > # CONFIG_DRM_DP_AUX_CHARDEV is not set
> > # CONFIG_DRM_DEBUG_MM is not set
> > CONFIG_DRM_DEBUG_MM_SELFTEST=3Dy
> > CONFIG_DRM_KMS_HELPER=3Dy
> > CONFIG_DRM_KMS_FB_HELPER=3Dy
> > CONFIG_DRM_FBDEV_EMULATION=3Dy
> > CONFIG_DRM_FBDEV_OVERALLOC=3D100
> > CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> > CONFIG_DRM_GEM_CMA_HELPER=3Dy
> > CONFIG_DRM_KMS_CMA_HELPER=3Dy
> > =

> > #
> > # I2C encoder or helper chips
> > #
> > CONFIG_DRM_I2C_CH7006=3Dy
> > # CONFIG_DRM_I2C_SIL164 is not set
> > CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> > # CONFIG_DRM_RADEON is not set
> > # CONFIG_DRM_AMDGPU is not set
> > =

> > #
> > # ACP (Audio CoProcessor) Configuration
> > #
> > # CONFIG_DRM_NOUVEAU is not set
> > # CONFIG_DRM_I915 is not set
> > # CONFIG_DRM_VGEM is not set
> > # CONFIG_DRM_VMWGFX is not set
> > # CONFIG_DRM_GMA500 is not set
> > # CONFIG_DRM_UDL is not set
> > # CONFIG_DRM_AST is not set
> > # CONFIG_DRM_MGAG200 is not set
> > # CONFIG_DRM_CIRRUS_QEMU is not set
> > CONFIG_DRM_RCAR_DW_HDMI=3Dy
> > # CONFIG_DRM_QXL is not set
> > # CONFIG_DRM_BOCHS is not set
> > CONFIG_DRM_PANEL=3Dy
> > =

> > #
> > # Display Panels
> > #
> > CONFIG_DRM_PANEL_LVDS=3Dy
> > CONFIG_DRM_PANEL_SIMPLE=3Dy
> > # CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
> > CONFIG_DRM_PANEL_LG_LG4573=3Dy
> > # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
> > # CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
> > CONFIG_DRM_BRIDGE=3Dy
> > CONFIG_DRM_PANEL_BRIDGE=3Dy
> > =

> > #
> > # Display Interface Bridges
> > #
> > CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> > # CONFIG_DRM_DUMB_VGA_DAC is not set
> > CONFIG_DRM_LVDS_ENCODER=3Dy
> > CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=3Dy
> > CONFIG_DRM_NXP_PTN3460=3Dy
> > # CONFIG_DRM_PARADE_PS8622 is not set
> > CONFIG_DRM_SIL_SII8620=3Dy
> > CONFIG_DRM_SII902X=3Dy
> > CONFIG_DRM_TOSHIBA_TC358767=3Dy
> > # CONFIG_DRM_TI_TFP410 is not set
> > # CONFIG_DRM_I2C_ADV7511 is not set
> > CONFIG_DRM_DW_HDMI=3Dy
> > CONFIG_DRM_ARCPGU=3Dy
> > # CONFIG_DRM_HISI_HIBMC is not set
> > # CONFIG_DRM_MXSFB is not set
> > CONFIG_DRM_TINYDRM=3Dy
> > CONFIG_TINYDRM_MIPI_DBI=3Dy
> > CONFIG_TINYDRM_MI0283QT=3Dy
> > # CONFIG_DRM_LEGACY is not set
> > CONFIG_DRM_LIB_RANDOM=3Dy
> > =

> > #
> > # Frame buffer Devices
> > #
> > CONFIG_FB=3Dy
> > CONFIG_FIRMWARE_EDID=3Dy
> > CONFIG_FB_CMDLINE=3Dy
> > CONFIG_FB_NOTIFY=3Dy
> > # CONFIG_FB_DDC is not set
> > CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> > CONFIG_FB_CFB_FILLRECT=3Dy
> > CONFIG_FB_CFB_COPYAREA=3Dy
> > CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> > CONFIG_FB_SYS_FILLRECT=3Dy
> > CONFIG_FB_SYS_COPYAREA=3Dy
> > CONFIG_FB_SYS_IMAGEBLIT=3Dy
> > # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> > # CONFIG_FB_FOREIGN_ENDIAN is not set
> > CONFIG_FB_SYS_FOPS=3Dy
> > CONFIG_FB_DEFERRED_IO=3Dy
> > CONFIG_FB_HECUBA=3Dy
> > # CONFIG_FB_SVGALIB is not set
> > # CONFIG_FB_MACMODES is not set
> > # CONFIG_FB_BACKLIGHT is not set
> > CONFIG_FB_MODE_HELPERS=3Dy
> > # CONFIG_FB_TILEBLITTING is not set
> > =

> > #
> > # Frame buffer hardware drivers
> > #
> > # CONFIG_FB_CIRRUS is not set
> > # CONFIG_FB_PM2 is not set
> > # CONFIG_FB_CYBER2000 is not set
> > # CONFIG_FB_ARC is not set
> > # CONFIG_FB_ASILIANT is not set
> > # CONFIG_FB_IMSTT is not set
> > # CONFIG_FB_VGA16 is not set
> > CONFIG_FB_VESA=3Dy
> > CONFIG_FB_N411=3Dy
> > # CONFIG_FB_HGA is not set
> > CONFIG_FB_OPENCORES=3Dy
> > # CONFIG_FB_S1D13XXX is not set
> > # CONFIG_FB_NVIDIA is not set
> > # CONFIG_FB_RIVA is not set
> > # CONFIG_FB_I740 is not set
> > # CONFIG_FB_LE80578 is not set
> > # CONFIG_FB_MATROX is not set
> > # CONFIG_FB_RADEON is not set
> > # CONFIG_FB_ATY128 is not set
> > # CONFIG_FB_ATY is not set
> > # CONFIG_FB_S3 is not set
> > # CONFIG_FB_SAVAGE is not set
> > # CONFIG_FB_SIS is not set
> > # CONFIG_FB_VIA is not set
> > # CONFIG_FB_NEOMAGIC is not set
> > # CONFIG_FB_KYRO is not set
> > # CONFIG_FB_3DFX is not set
> > # CONFIG_FB_VOODOO1 is not set
> > # CONFIG_FB_VT8623 is not set
> > # CONFIG_FB_TRIDENT is not set
> > # CONFIG_FB_ARK is not set
> > # CONFIG_FB_PM3 is not set
> > # CONFIG_FB_CARMINE is not set
> > # CONFIG_FB_GEODE is not set
> > CONFIG_FB_SM501=3Dy
> > # CONFIG_FB_SMSCUFX is not set
> > CONFIG_FB_UDL=3Dy
> > CONFIG_FB_IBM_GXT4500=3Dy
> > # CONFIG_FB_GOLDFISH is not set
> > CONFIG_FB_VIRTUAL=3Dy
> > CONFIG_FB_METRONOME=3Dy
> > # CONFIG_FB_MB862XX is not set
> > CONFIG_FB_BROADSHEET=3Dy
> > CONFIG_FB_AUO_K190X=3Dy
> > CONFIG_FB_AUO_K1900=3Dy
> > CONFIG_FB_AUO_K1901=3Dy
> > # CONFIG_FB_SIMPLE is not set
> > # CONFIG_FB_SSD1307 is not set
> > # CONFIG_FB_SM712 is not set
> > CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> > CONFIG_LCD_CLASS_DEVICE=3Dy
> > CONFIG_LCD_L4F00242T03=3Dy
> > # CONFIG_LCD_LMS283GF05 is not set
> > # CONFIG_LCD_LTV350QV is not set
> > # CONFIG_LCD_ILI922X is not set
> > CONFIG_LCD_ILI9320=3Dy
> > # CONFIG_LCD_TDO24M is not set
> > CONFIG_LCD_VGG2432A4=3Dy
> > CONFIG_LCD_PLATFORM=3Dy
> > CONFIG_LCD_S6E63M0=3Dy
> > # CONFIG_LCD_LD9040 is not set
> > # CONFIG_LCD_AMS369FG06 is not set
> > CONFIG_LCD_LMS501KF03=3Dy
> > CONFIG_LCD_HX8357=3Dy
> > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> > CONFIG_BACKLIGHT_GENERIC=3Dy
> > CONFIG_BACKLIGHT_LM3533=3Dy
> > CONFIG_BACKLIGHT_PWM=3Dy
> > CONFIG_BACKLIGHT_DA903X=3Dy
> > # CONFIG_BACKLIGHT_DA9052 is not set
> > # CONFIG_BACKLIGHT_APPLE is not set
> > CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> > CONFIG_BACKLIGHT_SAHARA=3Dy
> > CONFIG_BACKLIGHT_WM831X=3Dy
> > CONFIG_BACKLIGHT_ADP8860=3Dy
> > CONFIG_BACKLIGHT_ADP8870=3Dy
> > CONFIG_BACKLIGHT_88PM860X=3Dy
> > CONFIG_BACKLIGHT_PCF50633=3Dy
> > CONFIG_BACKLIGHT_LM3630A=3Dy
> > CONFIG_BACKLIGHT_LM3639=3Dy
> > CONFIG_BACKLIGHT_LP855X=3Dy
> > CONFIG_BACKLIGHT_LP8788=3Dy
> > CONFIG_BACKLIGHT_SKY81452=3Dy
> > CONFIG_BACKLIGHT_TPS65217=3Dy
> > CONFIG_BACKLIGHT_AS3711=3Dy
> > CONFIG_BACKLIGHT_GPIO=3Dy
> > CONFIG_BACKLIGHT_LV5207LP=3Dy
> > CONFIG_BACKLIGHT_BD6107=3Dy
> > CONFIG_BACKLIGHT_ARCXCNN=3Dy
> > # CONFIG_VGASTATE is not set
> > CONFIG_VIDEOMODE_HELPERS=3Dy
> > CONFIG_HDMI=3Dy
> > # CONFIG_LOGO is not set
> > CONFIG_SOUND=3Dy
> > # CONFIG_SOUND_OSS_CORE is not set
> > # CONFIG_SND is not set
> > =

> > #
> > # HID support
> > #
> > CONFIG_HID=3Dy
> > CONFIG_HID_BATTERY_STRENGTH=3Dy
> > CONFIG_HIDRAW=3Dy
> > CONFIG_UHID=3Dy
> > # CONFIG_HID_GENERIC is not set
> > =

> > #
> > # Special HID drivers
> > #
> > CONFIG_HID_A4TECH=3Dy
> > CONFIG_HID_ACRUX=3Dy
> > # CONFIG_HID_ACRUX_FF is not set
> > # CONFIG_HID_APPLE is not set
> > # CONFIG_HID_ASUS is not set
> > CONFIG_HID_AUREAL=3Dy
> > CONFIG_HID_BELKIN=3Dy
> > # CONFIG_HID_CHERRY is not set
> > # CONFIG_HID_CHICONY is not set
> > CONFIG_HID_CORSAIR=3Dy
> > CONFIG_HID_CMEDIA=3Dy
> > CONFIG_HID_CYPRESS=3Dy
> > CONFIG_HID_DRAGONRISE=3Dy
> > CONFIG_DRAGONRISE_FF=3Dy
> > CONFIG_HID_EMS_FF=3Dy
> > CONFIG_HID_ELECOM=3Dy
> > CONFIG_HID_EZKEY=3Dy
> > CONFIG_HID_GEMBIRD=3Dy
> > CONFIG_HID_GFRM=3Dy
> > CONFIG_HID_KEYTOUCH=3Dy
> > CONFIG_HID_KYE=3Dy
> > # CONFIG_HID_WALTOP is not set
> > # CONFIG_HID_GYRATION is not set
> > # CONFIG_HID_ICADE is not set
> > CONFIG_HID_ITE=3Dy
> > CONFIG_HID_TWINHAN=3Dy
> > CONFIG_HID_KENSINGTON=3Dy
> > CONFIG_HID_LCPOWER=3Dy
> > CONFIG_HID_LED=3Dy
> > CONFIG_HID_LENOVO=3Dy
> > # CONFIG_HID_LOGITECH is not set
> > # CONFIG_HID_MAGICMOUSE is not set
> > # CONFIG_HID_MAYFLASH is not set
> > CONFIG_HID_MICROSOFT=3Dy
> > # CONFIG_HID_MONTEREY is not set
> > CONFIG_HID_MULTITOUCH=3Dy
> > # CONFIG_HID_NTI is not set
> > # CONFIG_HID_ORTEK is not set
> > CONFIG_HID_PANTHERLORD=3Dy
> > CONFIG_PANTHERLORD_FF=3Dy
> > CONFIG_HID_PETALYNX=3Dy
> > CONFIG_HID_PICOLCD=3Dy
> > # CONFIG_HID_PICOLCD_FB is not set
> > CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> > CONFIG_HID_PICOLCD_LCD=3Dy
> > # CONFIG_HID_PICOLCD_LEDS is not set
> > # CONFIG_HID_PLANTRONICS is not set
> > CONFIG_HID_PRIMAX=3Dy
> > CONFIG_HID_SAITEK=3Dy
> > # CONFIG_HID_SAMSUNG is not set
> > # CONFIG_HID_SPEEDLINK is not set
> > CONFIG_HID_STEELSERIES=3Dy
> > CONFIG_HID_SUNPLUS=3Dy
> > # CONFIG_HID_RMI is not set
> > CONFIG_HID_GREENASIA=3Dy
> > # CONFIG_GREENASIA_FF is not set
> > CONFIG_HID_SMARTJOYPLUS=3Dy
> > CONFIG_SMARTJOYPLUS_FF=3Dy
> > # CONFIG_HID_TIVO is not set
> > CONFIG_HID_TOPSEED=3Dy
> > # CONFIG_HID_THINGM is not set
> > CONFIG_HID_THRUSTMASTER=3Dy
> > CONFIG_THRUSTMASTER_FF=3Dy
> > CONFIG_HID_UDRAW_PS3=3Dy
> > # CONFIG_HID_WACOM is not set
> > CONFIG_HID_WIIMOTE=3Dy
> > CONFIG_HID_XINMO=3Dy
> > # CONFIG_HID_ZEROPLUS is not set
> > # CONFIG_HID_ZYDACRON is not set
> > # CONFIG_HID_SENSOR_HUB is not set
> > CONFIG_HID_ALPS=3Dy
> > =

> > #
> > # USB HID support
> > #
> > # CONFIG_USB_HID is not set
> > CONFIG_HID_PID=3Dy
> > =

> > #
> > # USB HID Boot Protocol drivers
> > #
> > CONFIG_USB_KBD=3Dy
> > CONFIG_USB_MOUSE=3Dy
> > =

> > #
> > # I2C HID support
> > #
> > CONFIG_I2C_HID=3Dy
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_COMMON=3Dy
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > CONFIG_USB=3Dy
> > CONFIG_USB_PCI=3Dy
> > CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> > =

> > #
> > # Miscellaneous USB options
> > #
> > CONFIG_USB_DEFAULT_PERSIST=3Dy
> > CONFIG_USB_DYNAMIC_MINORS=3Dy
> > # CONFIG_USB_OTG is not set
> > CONFIG_USB_OTG_WHITELIST=3Dy
> > CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
> > # CONFIG_USB_MON is not set
> > CONFIG_USB_WUSB=3Dy
> > CONFIG_USB_WUSB_CBAF=3Dy
> > # CONFIG_USB_WUSB_CBAF_DEBUG is not set
> > =

> > #
> > # USB Host Controller Drivers
> > #
> > CONFIG_USB_C67X00_HCD=3Dy
> > # CONFIG_USB_XHCI_HCD is not set
> > CONFIG_USB_EHCI_HCD=3Dy
> > # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
> > # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> > CONFIG_USB_EHCI_PCI=3Dy
> > CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> > # CONFIG_USB_OXU210HP_HCD is not set
> > CONFIG_USB_ISP116X_HCD=3Dy
> > CONFIG_USB_ISP1362_HCD=3Dy
> > CONFIG_USB_FOTG210_HCD=3Dy
> > # CONFIG_USB_MAX3421_HCD is not set
> > CONFIG_USB_OHCI_HCD=3Dy
> > CONFIG_USB_OHCI_HCD_PCI=3Dy
> > # CONFIG_USB_OHCI_HCD_SSB is not set
> > CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> > # CONFIG_USB_UHCI_HCD is not set
> > # CONFIG_USB_U132_HCD is not set
> > # CONFIG_USB_SL811_HCD is not set
> > CONFIG_USB_R8A66597_HCD=3Dy
> > # CONFIG_USB_WHCI_HCD is not set
> > # CONFIG_USB_HWA_HCD is not set
> > CONFIG_USB_HCD_BCMA=3Dy
> > CONFIG_USB_HCD_SSB=3Dy
> > CONFIG_USB_HCD_TEST_MODE=3Dy
> > =

> > #
> > # USB Device Class drivers
> > #
> > # CONFIG_USB_ACM is not set
> > # CONFIG_USB_PRINTER is not set
> > CONFIG_USB_WDM=3Dy
> > # CONFIG_USB_TMC is not set
> > =

> > #
> > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > #
> > =

> > #
> > # also be needed; see USB_STORAGE Help for more info
> > #
> > =

> > #
> > # USB Imaging devices
> > #
> > CONFIG_USB_MDC800=3Dy
> > # CONFIG_USBIP_CORE is not set
> > # CONFIG_USB_MUSB_HDRC is not set
> > CONFIG_USB_DWC3=3Dy
> > CONFIG_USB_DWC3_ULPI=3Dy
> > CONFIG_USB_DWC3_HOST=3Dy
> > =

> > #
> > # Platform Glue Driver Support
> > #
> > CONFIG_USB_DWC3_PCI=3Dy
> > CONFIG_USB_DWC3_OF_SIMPLE=3Dy
> > CONFIG_USB_DWC2=3Dy
> > CONFIG_USB_DWC2_HOST=3Dy
> > =

> > #
> > # Gadget/Dual-role mode requires USB Gadget support to be enabled
> > #
> > # CONFIG_USB_DWC2_PCI is not set
> > # CONFIG_USB_DWC2_DEBUG is not set
> > CONFIG_USB_DWC2_TRACK_MISSED_SOFS=3Dy
> > CONFIG_USB_CHIPIDEA=3Dy
> > CONFIG_USB_CHIPIDEA_OF=3Dy
> > CONFIG_USB_CHIPIDEA_PCI=3Dy
> > # CONFIG_USB_CHIPIDEA_HOST is not set
> > # CONFIG_USB_CHIPIDEA_ULPI is not set
> > # CONFIG_USB_ISP1760 is not set
> > =

> > #
> > # USB port drivers
> > #
> > CONFIG_USB_USS720=3Dy
> > # CONFIG_USB_SERIAL is not set
> > =

> > #
> > # USB Miscellaneous drivers
> > #
> > CONFIG_USB_EMI62=3Dy
> > # CONFIG_USB_EMI26 is not set
> > CONFIG_USB_ADUTUX=3Dy
> > CONFIG_USB_SEVSEG=3Dy
> > CONFIG_USB_RIO500=3Dy
> > CONFIG_USB_LEGOTOWER=3Dy
> > CONFIG_USB_LCD=3Dy
> > # CONFIG_USB_CYPRESS_CY7C63 is not set
> > CONFIG_USB_CYTHERM=3Dy
> > # CONFIG_USB_IDMOUSE is not set
> > CONFIG_USB_FTDI_ELAN=3Dy
> > CONFIG_USB_APPLEDISPLAY=3Dy
> > CONFIG_USB_SISUSBVGA=3Dy
> > CONFIG_USB_LD=3Dy
> > # CONFIG_USB_TRANCEVIBRATOR is not set
> > CONFIG_USB_IOWARRIOR=3Dy
> > CONFIG_USB_TEST=3Dy
> > CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
> > CONFIG_USB_ISIGHTFW=3Dy
> > CONFIG_USB_YUREX=3Dy
> > CONFIG_USB_EZUSB_FX2=3Dy
> > CONFIG_USB_HUB_USB251XB=3Dy
> > CONFIG_USB_HSIC_USB3503=3Dy
> > CONFIG_USB_HSIC_USB4604=3Dy
> > CONFIG_USB_LINK_LAYER_TEST=3Dy
> > =

> > #
> > # USB Physical Layer drivers
> > #
> > CONFIG_USB_PHY=3Dy
> > CONFIG_NOP_USB_XCEIV=3Dy
> > CONFIG_USB_GPIO_VBUS=3Dy
> > # CONFIG_TAHVO_USB is not set
> > CONFIG_USB_ISP1301=3Dy
> > # CONFIG_USB_GADGET is not set
> > =

> > #
> > # USB Power Delivery and Type-C drivers
> > #
> > # CONFIG_TYPEC_UCSI is not set
> > CONFIG_USB_ULPI_BUS=3Dy
> > CONFIG_UWB=3Dy
> > CONFIG_UWB_HWA=3Dy
> > # CONFIG_UWB_WHCI is not set
> > # CONFIG_UWB_I1480U is not set
> > CONFIG_MMC=3Dy
> > CONFIG_MMC_DEBUG=3Dy
> > CONFIG_PWRSEQ_EMMC=3Dy
> > CONFIG_PWRSEQ_SIMPLE=3Dy
> > # CONFIG_SDIO_UART is not set
> > CONFIG_MMC_TEST=3Dy
> > =

> > #
> > # MMC/SD/SDIO Host Controller Drivers
> > #
> > CONFIG_MMC_SDHCI=3Dy
> > # CONFIG_MMC_SDHCI_PCI is not set
> > # CONFIG_MMC_SDHCI_ACPI is not set
> > # CONFIG_MMC_SDHCI_PLTFM is not set
> > CONFIG_MMC_WBSD=3Dy
> > # CONFIG_MMC_TIFM_SD is not set
> > CONFIG_MMC_GOLDFISH=3Dy
> > # CONFIG_MMC_CB710 is not set
> > # CONFIG_MMC_VIA_SDMMC is not set
> > CONFIG_MMC_VUB300=3Dy
> > # CONFIG_MMC_USHC is not set
> > CONFIG_MMC_USDHI6ROL0=3Dy
> > # CONFIG_MMC_REALTEK_USB is not set
> > # CONFIG_MMC_TOSHIBA_PCI is not set
> > CONFIG_MMC_MTK=3Dy
> > CONFIG_MEMSTICK=3Dy
> > CONFIG_MEMSTICK_DEBUG=3Dy
> > =

> > #
> > # MemoryStick drivers
> > #
> > CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> > =

> > #
> > # MemoryStick Host Controller Drivers
> > #
> > # CONFIG_MEMSTICK_TIFM_MS is not set
> > # CONFIG_MEMSTICK_JMICRON_38X is not set
> > # CONFIG_MEMSTICK_R592 is not set
> > CONFIG_MEMSTICK_REALTEK_USB=3Dy
> > CONFIG_NEW_LEDS=3Dy
> > CONFIG_LEDS_CLASS=3Dy
> > # CONFIG_LEDS_CLASS_FLASH is not set
> > CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> > =

> > #
> > # LED drivers
> > #
> > # CONFIG_LEDS_88PM860X is not set
> > CONFIG_LEDS_BCM6328=3Dy
> > # CONFIG_LEDS_BCM6358 is not set
> > CONFIG_LEDS_CPCAP=3Dy
> > CONFIG_LEDS_LM3530=3Dy
> > CONFIG_LEDS_LM3533=3Dy
> > CONFIG_LEDS_LM3642=3Dy
> > CONFIG_LEDS_MT6323=3Dy
> > # CONFIG_LEDS_NET48XX is not set
> > CONFIG_LEDS_WRAP=3Dy
> > CONFIG_LEDS_PCA9532=3Dy
> > CONFIG_LEDS_PCA9532_GPIO=3Dy
> > CONFIG_LEDS_GPIO=3Dy
> > CONFIG_LEDS_LP3944=3Dy
> > CONFIG_LEDS_LP3952=3Dy
> > CONFIG_LEDS_LP55XX_COMMON=3Dy
> > CONFIG_LEDS_LP5521=3Dy
> > # CONFIG_LEDS_LP5523 is not set
> > # CONFIG_LEDS_LP5562 is not set
> > CONFIG_LEDS_LP8501=3Dy
> > CONFIG_LEDS_LP8788=3Dy
> > # CONFIG_LEDS_LP8860 is not set
> > CONFIG_LEDS_CLEVO_MAIL=3Dy
> > # CONFIG_LEDS_PCA955X is not set
> > CONFIG_LEDS_PCA963X=3Dy
> > # CONFIG_LEDS_WM831X_STATUS is not set
> > # CONFIG_LEDS_DA903X is not set
> > # CONFIG_LEDS_DA9052 is not set
> > CONFIG_LEDS_DAC124S085=3Dy
> > CONFIG_LEDS_PWM=3Dy
> > # CONFIG_LEDS_REGULATOR is not set
> > # CONFIG_LEDS_BD2802 is not set
> > # CONFIG_LEDS_INTEL_SS4200 is not set
> > CONFIG_LEDS_LT3593=3Dy
> > # CONFIG_LEDS_MC13783 is not set
> > # CONFIG_LEDS_TCA6507 is not set
> > CONFIG_LEDS_TLC591XX=3Dy
> > # CONFIG_LEDS_MAX8997 is not set
> > CONFIG_LEDS_LM355x=3Dy
> > CONFIG_LEDS_OT200=3Dy
> > CONFIG_LEDS_MENF21BMC=3Dy
> > CONFIG_LEDS_IS31FL319X=3Dy
> > CONFIG_LEDS_IS31FL32XX=3Dy
> > =

> > #
> > # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
> > #
> > # CONFIG_LEDS_BLINKM is not set
> > CONFIG_LEDS_SYSCON=3Dy
> > CONFIG_LEDS_USER=3Dy
> > # CONFIG_LEDS_NIC78BX is not set
> > =

> > #
> > # LED Triggers
> > #
> > # CONFIG_LEDS_TRIGGERS is not set
> > # CONFIG_ACCESSIBILITY is not set
> > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > CONFIG_EDAC_SUPPORT=3Dy
> > CONFIG_EDAC=3Dy
> > CONFIG_EDAC_LEGACY_SYSFS=3Dy
> > CONFIG_EDAC_DEBUG=3Dy
> > CONFIG_EDAC_DECODE_MCE=3Dy
> > # CONFIG_EDAC_AMD64 is not set
> > # CONFIG_EDAC_AMD76X is not set
> > # CONFIG_EDAC_E7XXX is not set
> > # CONFIG_EDAC_E752X is not set
> > # CONFIG_EDAC_I82875P is not set
> > # CONFIG_EDAC_I82975X is not set
> > # CONFIG_EDAC_I3000 is not set
> > # CONFIG_EDAC_I3200 is not set
> > # CONFIG_EDAC_IE31200 is not set
> > # CONFIG_EDAC_X38 is not set
> > # CONFIG_EDAC_I5400 is not set
> > # CONFIG_EDAC_I82860 is not set
> > # CONFIG_EDAC_R82600 is not set
> > # CONFIG_EDAC_I5000 is not set
> > # CONFIG_EDAC_I5100 is not set
> > # CONFIG_EDAC_I7300 is not set
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
> > CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> > CONFIG_DMA_ACPI=3Dy
> > CONFIG_DMA_OF=3Dy
> > CONFIG_FSL_EDMA=3Dy
> > # CONFIG_INTEL_IDMA64 is not set
> > # CONFIG_PCH_DMA is not set
> > CONFIG_QCOM_HIDMA_MGMT=3Dy
> > CONFIG_QCOM_HIDMA=3Dy
> > CONFIG_DW_DMAC_CORE=3Dy
> > CONFIG_DW_DMAC=3Dy
> > # CONFIG_DW_DMAC_PCI is not set
> > CONFIG_HSU_DMA=3Dy
> > =

> > #
> > # DMA Clients
> > #
> > # CONFIG_ASYNC_TX_DMA is not set
> > # CONFIG_DMATEST is not set
> > =

> > #
> > # DMABUF options
> > #
> > CONFIG_SYNC_FILE=3Dy
> > # CONFIG_SW_SYNC is not set
> > CONFIG_AUXDISPLAY=3Dy
> > CONFIG_CHARLCD=3Dy
> > CONFIG_HD44780=3Dy
> > CONFIG_KS0108=3Dy
> > CONFIG_KS0108_PORT=3D0x378
> > CONFIG_KS0108_DELAY=3D2
> > CONFIG_CFAG12864B=3Dy
> > CONFIG_CFAG12864B_RATE=3D20
> > # CONFIG_IMG_ASCII_LCD is not set
> > # CONFIG_HT16K33 is not set
> > CONFIG_PANEL=3Dy
> > CONFIG_PANEL_PARPORT=3D0
> > CONFIG_PANEL_PROFILE=3D5
> > # CONFIG_PANEL_CHANGE_MESSAGE is not set
> > CONFIG_UIO=3Dy
> > # CONFIG_UIO_CIF is not set
> > CONFIG_UIO_PDRV_GENIRQ=3Dy
> > # CONFIG_UIO_DMEM_GENIRQ is not set
> > # CONFIG_UIO_AEC is not set
> > # CONFIG_UIO_SERCOS3 is not set
> > # CONFIG_UIO_PCI_GENERIC is not set
> > # CONFIG_UIO_NETX is not set
> > CONFIG_UIO_PRUSS=3Dy
> > # CONFIG_UIO_MF624 is not set
> > CONFIG_VIRT_DRIVERS=3Dy
> > =

> > #
> > # Virtio drivers
> > #
> > # CONFIG_VIRTIO_PCI is not set
> > # CONFIG_VIRTIO_MMIO is not set
> > =

> > #
> > # Microsoft Hyper-V guest support
> > #
> > # CONFIG_HYPERV is not set
> > # CONFIG_HYPERV_TSCPAGE is not set
> > # CONFIG_STAGING is not set
> > CONFIG_X86_PLATFORM_DEVICES=3Dy
> > # CONFIG_ACERHDF is not set
> > # CONFIG_ASUS_LAPTOP is not set
> > CONFIG_DELL_SMBIOS=3Dy
> > CONFIG_DELL_LAPTOP=3Dy
> > # CONFIG_DELL_SMO8800 is not set
> > # CONFIG_FUJITSU_LAPTOP is not set
> > # CONFIG_FUJITSU_TABLET is not set
> > # CONFIG_HP_ACCEL is not set
> > # CONFIG_HP_WIRELESS is not set
> > # CONFIG_PANASONIC_LAPTOP is not set
> > # CONFIG_THINKPAD_ACPI is not set
> > # CONFIG_SENSORS_HDAPS is not set
> > # CONFIG_INTEL_MENLOW is not set
> > # CONFIG_ASUS_WIRELESS is not set
> > # CONFIG_ACPI_WMI is not set
> > # CONFIG_TOPSTAR_LAPTOP is not set
> > # CONFIG_TOSHIBA_BT_RFKILL is not set
> > # CONFIG_TOSHIBA_HAPS is not set
> > # CONFIG_ACPI_CMPC is not set
> > # CONFIG_INTEL_CHT_INT33FE is not set
> > # CONFIG_INTEL_INT0002_VGPIO is not set
> > # CONFIG_INTEL_HID_EVENT is not set
> > # CONFIG_INTEL_VBTN is not set
> > # CONFIG_INTEL_IPS is not set
> > # CONFIG_INTEL_PMC_CORE is not set
> > # CONFIG_IBM_RTL is not set
> > # CONFIG_XO15_EBOOK is not set
> > CONFIG_SAMSUNG_LAPTOP=3Dy
> > # CONFIG_SAMSUNG_Q10 is not set
> > # CONFIG_APPLE_GMUX is not set
> > # CONFIG_INTEL_RST is not set
> > # CONFIG_INTEL_SMARTCONNECT is not set
> > # CONFIG_PVPANIC is not set
> > # CONFIG_INTEL_PMC_IPC is not set
> > # CONFIG_SURFACE_PRO3_BUTTON is not set
> > # CONFIG_INTEL_PUNIT_IPC is not set
> > # CONFIG_MLX_CPLD_PLATFORM is not set
> > CONFIG_PMC_ATOM=3Dy
> > CONFIG_GOLDFISH_BUS=3Dy
> > CONFIG_GOLDFISH_PIPE=3Dy
> > CONFIG_CHROME_PLATFORMS=3Dy
> > # CONFIG_CHROMEOS_LAPTOP is not set
> > CONFIG_CHROMEOS_PSTORE=3Dy
> > CONFIG_CROS_EC_CHARDEV=3Dy
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
> > # CONFIG_COMMON_CLK_WM831X is not set
> > # CONFIG_COMMON_CLK_MAX77686 is not set
> > # CONFIG_COMMON_CLK_RK808 is not set
> > # CONFIG_COMMON_CLK_SI5351 is not set
> > # CONFIG_COMMON_CLK_SI514 is not set
> > # CONFIG_COMMON_CLK_SI570 is not set
> > # CONFIG_COMMON_CLK_CDCE706 is not set
> > # CONFIG_COMMON_CLK_CDCE925 is not set
> > # CONFIG_COMMON_CLK_CS2000_CP is not set
> > # CONFIG_COMMON_CLK_NXP is not set
> > # CONFIG_COMMON_CLK_PWM is not set
> > # CONFIG_COMMON_CLK_PXA is not set
> > # CONFIG_COMMON_CLK_PIC32 is not set
> > # CONFIG_COMMON_CLK_VC5 is not set
> > CONFIG_HWSPINLOCK=3Dy
> > =

> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKSRC_I8253=3Dy
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > # CONFIG_ATMEL_PIT is not set
> > # CONFIG_SH_TIMER_CMT is not set
> > # CONFIG_SH_TIMER_MTU2 is not set
> > # CONFIG_SH_TIMER_TMU is not set
> > # CONFIG_EM_TIMER_STI is not set
> > CONFIG_MAILBOX=3Dy
> > CONFIG_PLATFORM_MHU=3Dy
> > # CONFIG_PCC is not set
> > CONFIG_ALTERA_MBOX=3Dy
> > # CONFIG_MAILBOX_TEST is not set
> > CONFIG_IOMMU_SUPPORT=3Dy
> > =

> > #
> > # Generic IOMMU Pagetable Support
> > #
> > =

> > #
> > # Remoteproc drivers
> > #
> > # CONFIG_REMOTEPROC is not set
> > =

> > #
> > # Rpmsg drivers
> > #
> > CONFIG_RPMSG=3Dy
> > # CONFIG_RPMSG_CHAR is not set
> > CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
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
> > CONFIG_PM_DEVFREQ=3Dy
> > =

> > #
> > # DEVFREQ Governors
> > #
> > CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> > CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> > # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> > CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> > # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> > =

> > #
> > # DEVFREQ Drivers
> > #
> > # CONFIG_PM_DEVFREQ_EVENT is not set
> > CONFIG_EXTCON=3Dy
> > =

> > #
> > # Extcon Device Drivers
> > #
> > CONFIG_EXTCON_AXP288=3Dy
> > CONFIG_EXTCON_GPIO=3Dy
> > # CONFIG_EXTCON_INTEL_INT3496 is not set
> > CONFIG_EXTCON_MAX14577=3Dy
> > CONFIG_EXTCON_MAX3355=3Dy
> > CONFIG_EXTCON_MAX77693=3Dy
> > CONFIG_EXTCON_MAX77843=3Dy
> > CONFIG_EXTCON_MAX8997=3Dy
> > CONFIG_EXTCON_RT8973A=3Dy
> > # CONFIG_EXTCON_SM5502 is not set
> > # CONFIG_EXTCON_USB_GPIO is not set
> > CONFIG_MEMORY=3Dy
> > # CONFIG_IIO is not set
> > # CONFIG_NTB is not set
> > # CONFIG_VME_BUS is not set
> > CONFIG_PWM=3Dy
> > CONFIG_PWM_SYSFS=3Dy
> > # CONFIG_PWM_ATMEL_HLCDC_PWM is not set
> > CONFIG_PWM_CROS_EC=3Dy
> > # CONFIG_PWM_FSL_FTM is not set
> > CONFIG_PWM_LP3943=3Dy
> > # CONFIG_PWM_LPSS_PCI is not set
> > # CONFIG_PWM_LPSS_PLATFORM is not set
> > CONFIG_PWM_PCA9685=3Dy
> > CONFIG_IRQCHIP=3Dy
> > CONFIG_ARM_GIC_MAX_NR=3D1
> > CONFIG_IPACK_BUS=3Dy
> > # CONFIG_BOARD_TPCI200 is not set
> > # CONFIG_SERIAL_IPOCTAL is not set
> > CONFIG_RESET_CONTROLLER=3Dy
> > # CONFIG_RESET_ATH79 is not set
> > # CONFIG_RESET_BERLIN is not set
> > # CONFIG_RESET_GEMINI is not set
> > # CONFIG_RESET_IMX7 is not set
> > # CONFIG_RESET_LPC18XX is not set
> > # CONFIG_RESET_MESON is not set
> > # CONFIG_RESET_PISTACHIO is not set
> > # CONFIG_RESET_SOCFPGA is not set
> > # CONFIG_RESET_STM32 is not set
> > # CONFIG_RESET_SUNXI is not set
> > CONFIG_RESET_TI_SYSCON=3Dy
> > # CONFIG_RESET_ZYNQ is not set
> > # CONFIG_RESET_TEGRA_BPMP is not set
> > CONFIG_FMC=3Dy
> > CONFIG_FMC_FAKEDEV=3Dy
> > CONFIG_FMC_TRIVIAL=3Dy
> > CONFIG_FMC_WRITE_EEPROM=3Dy
> > # CONFIG_FMC_CHARDEV is not set
> > =

> > #
> > # PHY Subsystem
> > #
> > CONFIG_GENERIC_PHY=3Dy
> > # CONFIG_BCM_KONA_USB2_PHY is not set
> > CONFIG_PHY_PXA_28NM_HSIC=3Dy
> > CONFIG_PHY_PXA_28NM_USB2=3Dy
> > CONFIG_PHY_QCOM_USB_HS=3Dy
> > # CONFIG_PHY_QCOM_USB_HSIC is not set
> > # CONFIG_PHY_SAMSUNG_USB2 is not set
> > # CONFIG_PHY_TUSB1210 is not set
> > # CONFIG_POWERCAP is not set
> > CONFIG_MCB=3Dy
> > # CONFIG_MCB_PCI is not set
> > # CONFIG_MCB_LPC is not set
> > =

> > #
> > # Performance monitor support
> > #
> > CONFIG_RAS=3Dy
> > # CONFIG_THUNDERBOLT is not set
> > =

> > #
> > # Android
> > #
> > # CONFIG_ANDROID is not set
> > CONFIG_DAX=3Dy
> > CONFIG_NVMEM=3Dy
> > CONFIG_STM=3Dy
> > CONFIG_STM_DUMMY=3Dy
> > CONFIG_STM_SOURCE_CONSOLE=3Dy
> > # CONFIG_STM_SOURCE_HEARTBEAT is not set
> > # CONFIG_STM_SOURCE_FTRACE is not set
> > # CONFIG_INTEL_TH is not set
> > =

> > #
> > # FPGA Configuration Support
> > #
> > CONFIG_FPGA=3Dy
> > # CONFIG_FPGA_REGION is not set
> > CONFIG_FPGA_MGR_ICE40_SPI=3Dy
> > CONFIG_FPGA_MGR_XILINX_SPI=3Dy
> > CONFIG_FPGA_BRIDGE=3Dy
> > # CONFIG_ALTERA_PR_IP_CORE is not set
> > CONFIG_XILINX_PR_DECOUPLER=3Dy
> > =

> > #
> > # FSI support
> > #
> > # CONFIG_FSI is not set
> > CONFIG_MULTIPLEXER=3Dy
> > =

> > #
> > # Multiplexer drivers
> > #
> > CONFIG_MUX_ADG792A=3Dy
> > # CONFIG_MUX_GPIO is not set
> > CONFIG_MUX_MMIO=3Dy
> > =

> > #
> > # Firmware Drivers
> > #
> > # CONFIG_EDD is not set
> > # CONFIG_FIRMWARE_MEMMAP is not set
> > CONFIG_DELL_RBU=3Dy
> > CONFIG_DCDBAS=3Dy
> > # CONFIG_DMIID is not set
> > CONFIG_DMI_SYSFS=3Dy
> > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> > # CONFIG_ISCSI_IBFT_FIND is not set
> > # CONFIG_FW_CFG_SYSFS is not set
> > CONFIG_GOOGLE_FIRMWARE=3Dy
> > CONFIG_GOOGLE_COREBOOT_TABLE=3Dy
> > # CONFIG_GOOGLE_COREBOOT_TABLE_ACPI is not set
> > CONFIG_GOOGLE_COREBOOT_TABLE_OF=3Dy
> > CONFIG_GOOGLE_MEMCONSOLE=3Dy
> > # CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
> > CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=3Dy
> > CONFIG_GOOGLE_VPD=3Dy
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
> > CONFIG_FS_POSIX_ACL=3Dy
> > CONFIG_EXPORTFS=3Dy
> > # CONFIG_EXPORTFS_BLOCK_OPS is not set
> > CONFIG_FILE_LOCKING=3Dy
> > # CONFIG_MANDATORY_FILE_LOCKING is not set
> > CONFIG_FS_ENCRYPTION=3Dy
> > CONFIG_FSNOTIFY=3Dy
> > CONFIG_DNOTIFY=3Dy
> > CONFIG_INOTIFY_USER=3Dy
> > # CONFIG_FANOTIFY is not set
> > CONFIG_QUOTA=3Dy
> > # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> > # CONFIG_PRINT_QUOTA_WARNING is not set
> > CONFIG_QUOTA_DEBUG=3Dy
> > CONFIG_QUOTA_TREE=3Dy
> > CONFIG_QFMT_V1=3Dy
> > CONFIG_QFMT_V2=3Dy
> > CONFIG_QUOTACTL=3Dy
> > CONFIG_AUTOFS4_FS=3Dy
> > # CONFIG_FUSE_FS is not set
> > CONFIG_OVERLAY_FS=3Dy
> > # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> > # CONFIG_OVERLAY_FS_INDEX is not set
> > =

> > #
> > # Caches
> > #
> > CONFIG_FSCACHE=3Dy
> > CONFIG_FSCACHE_STATS=3Dy
> > CONFIG_FSCACHE_HISTOGRAM=3Dy
> > CONFIG_FSCACHE_DEBUG=3Dy
> > # CONFIG_FSCACHE_OBJECT_LIST is not set
> > =

> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=3Dy
> > # CONFIG_PROC_KCORE is not set
> > CONFIG_PROC_SYSCTL=3Dy
> > # CONFIG_PROC_PAGE_MONITOR is not set
> > CONFIG_PROC_CHILDREN=3Dy
> > CONFIG_KERNFS=3Dy
> > CONFIG_SYSFS=3Dy
> > CONFIG_TMPFS=3Dy
> > # CONFIG_TMPFS_POSIX_ACL is not set
> > # CONFIG_TMPFS_XATTR is not set
> > CONFIG_HUGETLBFS=3Dy
> > CONFIG_HUGETLB_PAGE=3Dy
> > CONFIG_CONFIGFS_FS=3Dy
> > CONFIG_MISC_FILESYSTEMS=3Dy
> > CONFIG_ORANGEFS_FS=3Dy
> > # CONFIG_ECRYPT_FS is not set
> > # CONFIG_PSTORE is not set
> > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=3Dy
> > # CONFIG_NLS_CODEPAGE_737 is not set
> > # CONFIG_NLS_CODEPAGE_775 is not set
> > CONFIG_NLS_CODEPAGE_850=3Dy
> > # CONFIG_NLS_CODEPAGE_852 is not set
> > CONFIG_NLS_CODEPAGE_855=3Dy
> > CONFIG_NLS_CODEPAGE_857=3Dy
> > # CONFIG_NLS_CODEPAGE_860 is not set
> > CONFIG_NLS_CODEPAGE_861=3Dy
> > # CONFIG_NLS_CODEPAGE_862 is not set
> > # CONFIG_NLS_CODEPAGE_863 is not set
> > CONFIG_NLS_CODEPAGE_864=3Dy
> > # CONFIG_NLS_CODEPAGE_865 is not set
> > CONFIG_NLS_CODEPAGE_866=3Dy
> > CONFIG_NLS_CODEPAGE_869=3Dy
> > CONFIG_NLS_CODEPAGE_936=3Dy
> > CONFIG_NLS_CODEPAGE_950=3Dy
> > CONFIG_NLS_CODEPAGE_932=3Dy
> > # CONFIG_NLS_CODEPAGE_949 is not set
> > CONFIG_NLS_CODEPAGE_874=3Dy
> > CONFIG_NLS_ISO8859_8=3Dy
> > CONFIG_NLS_CODEPAGE_1250=3Dy
> > # CONFIG_NLS_CODEPAGE_1251 is not set
> > # CONFIG_NLS_ASCII is not set
> > # CONFIG_NLS_ISO8859_1 is not set
> > CONFIG_NLS_ISO8859_2=3Dy
> > CONFIG_NLS_ISO8859_3=3Dy
> > CONFIG_NLS_ISO8859_4=3Dy
> > CONFIG_NLS_ISO8859_5=3Dy
> > CONFIG_NLS_ISO8859_6=3Dy
> > CONFIG_NLS_ISO8859_7=3Dy
> > CONFIG_NLS_ISO8859_9=3Dy
> > # CONFIG_NLS_ISO8859_13 is not set
> > # CONFIG_NLS_ISO8859_14 is not set
> > CONFIG_NLS_ISO8859_15=3Dy
> > CONFIG_NLS_KOI8_R=3Dy
> > CONFIG_NLS_KOI8_U=3Dy
> > CONFIG_NLS_MAC_ROMAN=3Dy
> > CONFIG_NLS_MAC_CELTIC=3Dy
> > # CONFIG_NLS_MAC_CENTEURO is not set
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > CONFIG_NLS_MAC_CYRILLIC=3Dy
> > # CONFIG_NLS_MAC_GAELIC is not set
> > CONFIG_NLS_MAC_GREEK=3Dy
> > CONFIG_NLS_MAC_ICELAND=3Dy
> > CONFIG_NLS_MAC_INUIT=3Dy
> > CONFIG_NLS_MAC_ROMANIAN=3Dy
> > CONFIG_NLS_MAC_TURKISH=3Dy
> > CONFIG_NLS_UTF8=3Dy
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
> > CONFIG_READABLE_ASM=3Dy
> > # CONFIG_UNUSED_SYMBOLS is not set
> > CONFIG_PAGE_OWNER=3Dy
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
> > # CONFIG_PAGE_POISONING is not set
> > # CONFIG_DEBUG_PAGE_REF is not set
> > # CONFIG_DEBUG_RODATA_TEST is not set
> > # CONFIG_DEBUG_OBJECTS is not set
> > # CONFIG_SLUB_DEBUG_ON is not set
> > CONFIG_SLUB_STATS=3Dy
> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > CONFIG_DEBUG_VM=3Dy
> > # CONFIG_DEBUG_VM_VMACACHE is not set
> > # CONFIG_DEBUG_VM_RB is not set
> > # CONFIG_DEBUG_VM_PGFLAGS is not set
> > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > # CONFIG_DEBUG_VIRTUAL is not set
> > CONFIG_DEBUG_MEMORY_INIT=3Dy
> > CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> > CONFIG_DEBUG_HIGHMEM=3Dy
> > CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> > CONFIG_DEBUG_STACKOVERFLOW=3Dy
> > CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> > CONFIG_DEBUG_SHIRQ=3Dy
> > =

> > #
> > # Debug Lockups and Hangs
> > #
> > CONFIG_LOCKUP_DETECTOR=3Dy
> > CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > # CONFIG_HARDLOCKUP_DETECTOR is not set
> > # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> > CONFIG_DETECT_HUNG_TASK=3Dy
> > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> > # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> > CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> > # CONFIG_WQ_WATCHDOG is not set
> > CONFIG_PANIC_ON_OOPS=3Dy
> > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > CONFIG_PANIC_TIMEOUT=3D0
> > # CONFIG_SCHED_DEBUG is not set
> > # CONFIG_SCHED_INFO is not set
> > # CONFIG_SCHEDSTATS is not set
> > CONFIG_SCHED_STACK_END_CHECK=3Dy
> > CONFIG_DEBUG_TIMEKEEPING=3Dy
> > CONFIG_DEBUG_PREEMPT=3Dy
> > =

> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > CONFIG_DEBUG_RT_MUTEXES=3Dy
> > CONFIG_DEBUG_SPINLOCK=3Dy
> > CONFIG_DEBUG_MUTEXES=3Dy
> > # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> > CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > CONFIG_PROVE_LOCKING=3Dy
> > CONFIG_LOCKDEP=3Dy
> > # CONFIG_LOCK_STAT is not set
> > CONFIG_DEBUG_LOCKDEP=3Dy
> > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> > CONFIG_LOCK_TORTURE_TEST=3Dy
> > # CONFIG_WW_MUTEX_SELFTEST is not set
> > CONFIG_TRACE_IRQFLAGS=3Dy
> > CONFIG_STACKTRACE=3Dy
> > CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> > # CONFIG_DEBUG_KOBJECT is not set
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > CONFIG_DEBUG_LIST=3Dy
> > CONFIG_DEBUG_PI_LIST=3Dy
> > # CONFIG_DEBUG_SG is not set
> > # CONFIG_DEBUG_NOTIFIERS is not set
> > CONFIG_DEBUG_CREDENTIALS=3Dy
> > =

> > #
> > # RCU Debugging
> > #
> > CONFIG_PROVE_RCU=3Dy
> > CONFIG_TORTURE_TEST=3Dy
> > # CONFIG_RCU_PERF_TEST is not set
> > # CONFIG_RCU_TORTURE_TEST is not set
> > CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> > # CONFIG_RCU_TRACE is not set
> > CONFIG_RCU_EQS_DEBUG=3Dy
> > CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> > CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> > # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
> > CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=3Dy
> > # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
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
> > CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_IRQSOFF_TRACER=3Dy
> > CONFIG_PREEMPT_TRACER=3Dy
> > CONFIG_SCHED_TRACER=3Dy
> > CONFIG_HWLAT_TRACER=3Dy
> > CONFIG_FTRACE_SYSCALLS=3Dy
> > CONFIG_TRACER_SNAPSHOT=3Dy
> > CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> > CONFIG_TRACE_BRANCH_PROFILING=3Dy
> > # CONFIG_BRANCH_PROFILE_NONE is not set
> > # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> > CONFIG_PROFILE_ALL_BRANCHES=3Dy
> > # CONFIG_BRANCH_TRACER is not set
> > # CONFIG_STACK_TRACER is not set
> > CONFIG_UPROBE_EVENTS=3Dy
> > CONFIG_PROBE_EVENTS=3Dy
> > # CONFIG_DYNAMIC_FTRACE is not set
> > CONFIG_FUNCTION_PROFILER=3Dy
> > # CONFIG_FTRACE_STARTUP_TEST is not set
> > # CONFIG_MMIOTRACE is not set
> > # CONFIG_HIST_TRIGGERS is not set
> > # CONFIG_TRACEPOINT_BENCHMARK is not set
> > CONFIG_RING_BUFFER_BENCHMARK=3Dy
> > # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> > CONFIG_TRACE_EVAL_MAP_FILE=3Dy
> > CONFIG_TRACING_EVENTS_GPIO=3Dy
> > =

> > #
> > # Runtime Testing
> > #
> > CONFIG_TEST_LIST_SORT=3Dy
> > CONFIG_TEST_SORT=3Dy
> > # CONFIG_BACKTRACE_SELF_TEST is not set
> > # CONFIG_RBTREE_TEST is not set
> > CONFIG_INTERVAL_TREE_TEST=3Dy
> > CONFIG_ATOMIC64_SELFTEST=3Dy
> > CONFIG_TEST_HEXDUMP=3Dy
> > CONFIG_TEST_STRING_HELPERS=3Dy
> > CONFIG_TEST_KSTRTOX=3Dy
> > CONFIG_TEST_PRINTF=3Dy
> > CONFIG_TEST_BITMAP=3Dy
> > # CONFIG_TEST_UUID is not set
> > CONFIG_TEST_RHASHTABLE=3Dy
> > CONFIG_TEST_HASH=3Dy
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > # CONFIG_DMA_API_DEBUG is not set
> > CONFIG_TEST_FIRMWARE=3Dy
> > CONFIG_TEST_SYSCTL=3Dy
> > # CONFIG_TEST_UDELAY is not set
> > CONFIG_MEMTEST=3Dy
> > # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> > # CONFIG_UBSAN is not set
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> > CONFIG_STRICT_DEVMEM=3Dy
> > CONFIG_IO_STRICT_DEVMEM=3Dy
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > # CONFIG_EARLY_PRINTK is not set
> > CONFIG_X86_PTDUMP_CORE=3Dy
> > CONFIG_X86_PTDUMP=3Dy
> > CONFIG_DEBUG_WX=3Dy
> > CONFIG_DOUBLEFAULT=3Dy
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > # CONFIG_IOMMU_STRESS is not set
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > CONFIG_IO_DELAY_TYPE_0X80=3D0
> > CONFIG_IO_DELAY_TYPE_0XED=3D1
> > CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> > CONFIG_IO_DELAY_TYPE_NONE=3D3
> > # CONFIG_IO_DELAY_0X80 is not set
> > # CONFIG_IO_DELAY_0XED is not set
> > CONFIG_IO_DELAY_UDELAY=3Dy
> > # CONFIG_IO_DELAY_NONE is not set
> > CONFIG_DEFAULT_IO_DELAY_TYPE=3D2
> > # CONFIG_DEBUG_BOOT_PARAMS is not set
> > # CONFIG_CPA_DEBUG is not set
> > CONFIG_OPTIMIZE_INLINING=3Dy
> > # CONFIG_DEBUG_ENTRY is not set
> > # CONFIG_DEBUG_NMI_SELFTEST is not set
> > CONFIG_X86_DEBUG_FPU=3Dy
> > # CONFIG_PUNIT_ATOM_DEBUG is not set
> > =

> > #
> > # Security options
> > #
> > CONFIG_KEYS=3Dy
> > # CONFIG_PERSISTENT_KEYRINGS is not set
> > CONFIG_BIG_KEYS=3Dy
> > CONFIG_TRUSTED_KEYS=3Dy
> > CONFIG_ENCRYPTED_KEYS=3Dy
> > CONFIG_KEY_DH_OPERATIONS=3Dy
> > CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> > # CONFIG_SECURITY is not set
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> > # CONFIG_HARDENED_USERCOPY is not set
> > # CONFIG_FORTIFY_SOURCE is not set
> > # CONFIG_STATIC_USERMODEHELPER is not set
> > CONFIG_DEFAULT_SECURITY_DAC=3Dy
> > CONFIG_DEFAULT_SECURITY=3D""
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
> > # CONFIG_CRYPTO_RSA is not set
> > CONFIG_CRYPTO_DH=3Dy
> > # CONFIG_CRYPTO_ECDH is not set
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > # CONFIG_CRYPTO_USER is not set
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > CONFIG_CRYPTO_GF128MUL=3Dy
> > CONFIG_CRYPTO_NULL=3Dy
> > CONFIG_CRYPTO_NULL2=3Dy
> > # CONFIG_CRYPTO_PCRYPT is not set
> > CONFIG_CRYPTO_WORKQUEUE=3Dy
> > CONFIG_CRYPTO_CRYPTD=3Dy
> > # CONFIG_CRYPTO_MCRYPTD is not set
> > CONFIG_CRYPTO_AUTHENC=3Dy
> > CONFIG_CRYPTO_ABLK_HELPER=3Dy
> > CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> > =

> > #
> > # Authenticated Encryption with Associated Data
> > #
> > # CONFIG_CRYPTO_CCM is not set
> > # CONFIG_CRYPTO_GCM is not set
> > CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> > CONFIG_CRYPTO_SEQIV=3Dy
> > CONFIG_CRYPTO_ECHAINIV=3Dy
> > =

> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=3Dy
> > CONFIG_CRYPTO_CTR=3Dy
> > CONFIG_CRYPTO_CTS=3Dy
> > CONFIG_CRYPTO_ECB=3Dy
> > CONFIG_CRYPTO_LRW=3Dy
> > CONFIG_CRYPTO_PCBC=3Dy
> > CONFIG_CRYPTO_XTS=3Dy
> > # CONFIG_CRYPTO_KEYWRAP is not set
> > =

> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=3Dy
> > CONFIG_CRYPTO_HMAC=3Dy
> > CONFIG_CRYPTO_XCBC=3Dy
> > # CONFIG_CRYPTO_VMAC is not set
> > =

> > #
> > # Digest
> > #
> > # CONFIG_CRYPTO_CRC32C is not set
> > CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> > CONFIG_CRYPTO_CRC32=3Dy
> > # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> > # CONFIG_CRYPTO_CRCT10DIF is not set
> > CONFIG_CRYPTO_GHASH=3Dy
> > CONFIG_CRYPTO_POLY1305=3Dy
> > CONFIG_CRYPTO_MD4=3Dy
> > # CONFIG_CRYPTO_MD5 is not set
> > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > CONFIG_CRYPTO_RMD128=3Dy
> > CONFIG_CRYPTO_RMD160=3Dy
> > CONFIG_CRYPTO_RMD256=3Dy
> > CONFIG_CRYPTO_RMD320=3Dy
> > CONFIG_CRYPTO_SHA1=3Dy
> > CONFIG_CRYPTO_SHA256=3Dy
> > CONFIG_CRYPTO_SHA512=3Dy
> > CONFIG_CRYPTO_SHA3=3Dy
> > CONFIG_CRYPTO_TGR192=3Dy
> > # CONFIG_CRYPTO_WP512 is not set
> > =

> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=3Dy
> > CONFIG_CRYPTO_AES_TI=3Dy
> > # CONFIG_CRYPTO_AES_586 is not set
> > # CONFIG_CRYPTO_AES_NI_INTEL is not set
> > CONFIG_CRYPTO_ANUBIS=3Dy
> > CONFIG_CRYPTO_ARC4=3Dy
> > # CONFIG_CRYPTO_BLOWFISH is not set
> > CONFIG_CRYPTO_CAMELLIA=3Dy
> > CONFIG_CRYPTO_CAST_COMMON=3Dy
> > CONFIG_CRYPTO_CAST5=3Dy
> > CONFIG_CRYPTO_CAST6=3Dy
> > CONFIG_CRYPTO_DES=3Dy
> > # CONFIG_CRYPTO_FCRYPT is not set
> > # CONFIG_CRYPTO_KHAZAD is not set
> > # CONFIG_CRYPTO_SALSA20 is not set
> > CONFIG_CRYPTO_SALSA20_586=3Dy
> > CONFIG_CRYPTO_CHACHA20=3Dy
> > # CONFIG_CRYPTO_SEED is not set
> > CONFIG_CRYPTO_SERPENT=3Dy
> > CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> > CONFIG_CRYPTO_TEA=3Dy
> > # CONFIG_CRYPTO_TWOFISH is not set
> > CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> > CONFIG_CRYPTO_TWOFISH_586=3Dy
> > =

> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=3Dy
> > CONFIG_CRYPTO_LZO=3Dy
> > # CONFIG_CRYPTO_842 is not set
> > CONFIG_CRYPTO_LZ4=3Dy
> > CONFIG_CRYPTO_LZ4HC=3Dy
> > =

> > #
> > # Random Number Generation
> > #
> > # CONFIG_CRYPTO_ANSI_CPRNG is not set
> > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > # CONFIG_CRYPTO_DRBG_HASH is not set
> > CONFIG_CRYPTO_DRBG_CTR=3Dy
> > CONFIG_CRYPTO_DRBG=3Dy
> > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > # CONFIG_CRYPTO_USER_API_HASH is not set
> > # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> > # CONFIG_CRYPTO_USER_API_RNG is not set
> > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > CONFIG_CRYPTO_HASH_INFO=3Dy
> > CONFIG_CRYPTO_HW=3Dy
> > CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> > # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
> > CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
> > # CONFIG_CRYPTO_DEV_GEODE is not set
> > # CONFIG_CRYPTO_DEV_HIFN_795X is not set
> > # CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
> > # CONFIG_CRYPTO_DEV_CCP is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > # CONFIG_X509_CERTIFICATE_PARSER is not set
> > =

> > #
> > # Certificates for signature checking
> > #
> > # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> > CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> > CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> > CONFIG_HAVE_KVM=3Dy
> > # CONFIG_VIRTUALIZATION is not set
> > CONFIG_BINARY_PRINTF=3Dy
> > =

> > #
> > # Library routines
> > #
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
> > # CONFIG_CRC_T10DIF is not set
> > CONFIG_CRC_ITU_T=3Dy
> > CONFIG_CRC32=3Dy
> > CONFIG_CRC32_SELFTEST=3Dy
> > # CONFIG_CRC32_SLICEBY8 is not set
> > # CONFIG_CRC32_SLICEBY4 is not set
> > # CONFIG_CRC32_SARWATE is not set
> > CONFIG_CRC32_BIT=3Dy
> > # CONFIG_CRC4 is not set
> > # CONFIG_CRC7 is not set
> > # CONFIG_LIBCRC32C is not set
> > CONFIG_CRC8=3Dy
> > # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> > CONFIG_RANDOM32_SELFTEST=3Dy
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dy
> > CONFIG_LZO_COMPRESS=3Dy
> > CONFIG_LZO_DECOMPRESS=3Dy
> > CONFIG_LZ4_COMPRESS=3Dy
> > CONFIG_LZ4HC_COMPRESS=3Dy
> > CONFIG_LZ4_DECOMPRESS=3Dy
> > # CONFIG_XZ_DEC is not set
> > # CONFIG_XZ_DEC_BCJ is not set
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_DECOMPRESS_BZIP2=3Dy
> > CONFIG_DECOMPRESS_LZMA=3Dy
> > CONFIG_DECOMPRESS_LZO=3Dy
> > CONFIG_DECOMPRESS_LZ4=3Dy
> > CONFIG_GENERIC_ALLOCATOR=3Dy
> > CONFIG_INTERVAL_TREE=3Dy
> > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT_MAP=3Dy
> > CONFIG_HAS_DMA=3Dy
> > # CONFIG_DMA_NOOP_OPS is not set
> > # CONFIG_DMA_VIRT_OPS is not set
> > CONFIG_CPUMASK_OFFSTACK=3Dy
> > CONFIG_CPU_RMAP=3Dy
> > CONFIG_DQL=3Dy
> > CONFIG_GLOB=3Dy
> > CONFIG_GLOB_SELFTEST=3Dy
> > CONFIG_NLATTR=3Dy
> > CONFIG_CLZ_TAB=3Dy
> > CONFIG_CORDIC=3Dy
> > CONFIG_DDR=3Dy
> > # CONFIG_IRQ_POLL is not set
> > CONFIG_MPILIB=3Dy
> > CONFIG_LIBFDT=3Dy
> > # CONFIG_SG_SPLIT is not set
> > # CONFIG_SG_POOL is not set
> > CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> > CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
> > CONFIG_STACKDEPOT=3Dy
> > CONFIG_PRIME_NUMBERS=3Dy

--===============4986704715472948069==--

