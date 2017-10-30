Content-Type: multipart/mixed; boundary="===============6743836696163270312=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: 492b95e597 ("rcuperf: Set more user-friendly defaults"): WARNING: CPU: 0 PID: 1 at arch/x86/kernel/smp.c:128 native_smp_send_reschedule
Date: Mon, 30 Oct 2017 10:40:25 -0700
Message-ID: <20171030174025.GX3659@linux.vnet.ibm.com>
In-Reply-To: <20171025055340.4fasozevomaq7u3i@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6743836696163270312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2017 at 07:53:40AM +0200, Fengguang Wu wrote:
> Hi Paul,
> =

> On Tue, Oct 24, 2017 at 06:25:13AM -0700, Paul E. McKenney wrote:
> >On Tue, Oct 24, 2017 at 04:49:52AM +0200, Fengguang Wu wrote:
> >>Greetings,
> >>
> >>0day kernel testing robot got the below dmesg and the first bad commit =
is
> >>
> >>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> >>
> >>commit 492b95e59735998312f678d77a2d5fe20af6b0b9
> >>Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >>AuthorDate: Fri Apr 21 16:09:15 2017 -0700
> >>Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >>CommitDate: Thu Jun 8 08:25:31 2017 -0700
> >>
> >>     rcuperf: Set more user-friendly defaults
> >>
> >>     Common-case use of rcuperf must set rcuperf.nreaders=3D0 and if no=
t built
> >>     as a module, rcuperf.shutdown.  This commit therefore sets the def=
ault
> >>     for rcuperf.nreaders to zero and sets the default for rcuperf.shut=
down
> >>     to zero if rcuperf is built as a module and to one otherwise.
> >>
> >>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> >I don't believe that this commit has anything to do with this, however,
> >this failure is rare, so bisection is unlikely to find anything.  I do
> >have a pair of commits that fix this in -rcu:
> >
> >a54daabfde1a ("sched: Stop resched_cpu() from sending IPIs to offline CP=
Us")
> >e600277461ed ("sched: Stop switched_to_rt() from sending IPIs to offline=
 CPUs")
> >
> >Do these two commits prevent the problem on your systems?
> =

> Yeah the problem does not show up in rcu/dev HEAD fe368e2596 ("rcu:
> Add comment giving debug strategy for double call_rcu()"). However
> there are some kernel hang/reboots in early boot stage:

I was tempted to push those two commits to 4.14, except that the
other failures you are seeing would not be helped by them.

But if you are seeing them elsewhere, please let me know.

							Thanx, Paul

> early console in setup code
> Probing EDD (edd=3Doff to disable)... ok
> early console in extract_kernel
> input_data: 0x00000000045f9276
> input_len: 0x0000000000a2a66d
> output: 0x0000000001000000
> output_len: 0x0000000002362830
> kernel_total_size: 0x0000000004043000
> =

> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> =

> Elapsed time: 10
> BUG: kernel reboot-without-warning in boot stage
> Linux version 4.14.0-rc4-00054-gfe368e2 #1
> Command line: root=3D/dev/ram0 hung_task_panic=3D1 debug apic=3Ddebug sys=
rq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 prin=
tk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=
=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.l=
og_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 co=
nsole=3DttyS0,115200 vga=3Dnormal rw link=3D/kbuild-tests/run-queue/kvm/x86=
_64-randconfig-a0-10221140/rcu:rcu:dev:fe368e2596a235ca15af01ebf203fca0594e=
01ea/.vmlinuz-fe368e2596a235ca15af01ebf203fca0594e01ea-20171024225823-78:qu=
antal-intel12-27 branch=3Drcu/rcu/dev BOOT_IMAGE=3D/pkg/linux/x86_64-randco=
nfig-a0-10221140/gcc-6/fe368e2596a235ca15af01ebf203fca0594e01ea/vmlinuz-4.1=
4.0-rc4-00054-gfe368e2 drbd.minor_count=3D8
> =

> I'll try bisecting that error.
> =

> Thanks,
> Fengguang
> =

> >>3ddf20c953  srcu: Shrink Tiny SRCU a bit more
> >>492b95e597  rcuperf: Set more user-friendly defaults
> >>bb176f6709  Linux 4.14-rc6
> >>36ef71cae3  Add linux-next specific files for 20171018
> >>+--------------------------------------------------------------+-------=
-----+------------+-----------+---------------+
> >>|                                                              | 3ddf20=
c953 | 492b95e597 | v4.14-rc6 | next-20171018 |
> >>+--------------------------------------------------------------+-------=
-----+------------+-----------+---------------+
> >>| boot_successes                                               | 910   =
     | 21         | 199       | 60            |
> >>| boot_failures                                                | 0     =
     | 9          | 111       | 21            |
> >>| WARNING:at_arch/x86/kernel/smp.c:#native_smp_send_reschedule | 0     =
     | 9          | 111       | 21            |
> >>+--------------------------------------------------------------+-------=
-----+------------+-----------+---------------+
> >>
> >>[   29.173654] augmented rbtree testing
> >>[   32.263469]  -> 83223 cycles
> >>[   32.540332] gpio_it87: no device
> >>[   32.541422] sched: Unexpected reschedule of offline CPU#1!
> >>[   32.542355] ------------[ cut here ]------------
> >>[   32.543057] WARNING: CPU: 0 PID: 1 at arch/x86/kernel/smp.c:128 nati=
ve_smp_send_reschedule+0x83/0xbb
> >>[   32.544646] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.0-rc4-000=
28-g492b95e #1
> >>[   32.545397] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
> >>[   32.546381] task: ffff88001e2e0000 task.stack: ffff88001e2e8000
> >>[   32.547031] RIP: 0010:native_smp_send_reschedule+0x83/0xbb
> >>[   32.547642] RSP: 0000:ffff88001e2ebca0 EFLAGS: 00010086
> >>[   32.548225] RAX: 000000000000002e RBX: 0000000000000003 RCX: 0000000=
000000000
> >>[   32.548989] RDX: 0000002e00000001 RSI: 0000000000000000 RDI: 0000000=
000000096
> >>[   32.550034] RBP: ffff88001e2ebcb8 R08: 0000000000000003 R09: 0000000=
000000000
> >>[   32.551039] R10: ffff88001e2e0758 R11: 0000000000021001 R12: 0000000=
000000001
> >>[   32.551996] R13: 0000000000000000 R14: ffff88001e380000 R15: ffff880=
01e500000
> >>[   32.552727] FS:  0000000000000000(0000) GS:ffff88001e400000(0000) kn=
lGS:0000000000000000
> >>[   32.553585] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>[   32.554227] CR2: 0000000000000000 CR3: 000000000260f000 CR4: 0000000=
0000006b0
> >>[   32.555288] Call Trace:
> >>[   32.555687]  smp_send_reschedule+0xa/0xc
> >>[   32.556313]  try_to_wake_up+0x27e/0x2e4
> >>[   32.556870]  wake_up_process+0x15/0x17
> >>[   32.557374]  wake_up_worker+0x5f/0x6a
> >>[   32.557982]  pwq_adjust_max_active+0x154/0x191
> >>[   32.558444]  link_pwq+0xc3/0x10a
> >>[   32.558828]  __alloc_workqueue_key+0x325/0x695
> >>[   32.559288]  ? ftrace_likely_update+0x78/0x81
> >>[   32.559810]  ? pci_epf_init+0x52/0x52
> >>[   32.560222]  ? do_early_param+0xfd/0xfd
> >>[   32.560643]  pci_epf_test_init+0x30/0x7c
> >>[   32.561063]  ? pci_epf_init+0x52/0x52
> >>[   32.561431]  do_one_initcall+0xbc/0x1f7
> >>[   32.562099]  ? do_early_param+0xfd/0xfd
> >>[   32.562760]  kernel_init_freeable+0x13f/0x233
> >>[   32.563497]  ? rest_init+0xd6/0xd6
> >>[   32.564046]  kernel_init+0x14/0x1c5
> >>[   32.564565]  ? rest_init+0xd6/0xd6
> >>[   32.564987]  ret_from_fork+0x2a/0x40
> >>[   32.565345] Code: 00 00 31 d2 be 01 00 00 00 48 c7 c7 88 40 7d 82 e8=
 8c 48 18 00 44 89 e6 48 c7 c7 5a 68 3d 82 48 ff 05 70 78 87 01 e8 45 a5 1b=
 00 <0f> ff b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 58 40 7d 82
> >>[   32.568020] ---[ end trace 6590e27884081b3a ]---
> >>[   32.570056] VIA Graphics Integration Chipset framebuffer 2.4 initial=
izing
> >>
> >>                                                           # HH:MM RESU=
LT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> >>git bisect start v4.13 v4.12 --
> >>git bisect  bad 63a86362130f4c17eaa57f3ef5171ec43111a54e  # 14:39  B   =
  16     1    0   6  Merge tag 'pm-4.13-rc2' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/rafael/linux-pm
> >>git bisect  bad 090a81d8766e21d33ab3e4d24e6c8e5eedf086dd  # 14:44  B   =
  11     5    0   7  Merge branch 'for-spi' of git://git.kernel.org/pub/scm=
/linux/kernel/git/viro/vfs
> >>git bisect  bad 3bad2f1c676581d01e7645eb03e9b27e28b0a92e  # 16:22  B   =
  45     2    7  13  Merge branch 'work.misc-set_fs' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/viro/vfs
> >>git bisect  bad 362f6729cbb1d6bbab59e069f19441b0622ff7ec  # 16:27  B   =
  20     1    0   5  Merge tag 'usb-4.13-rc1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/gregkh/usb
> >>git bisect  bad 6553698be05983056f5561cef6aaee0cc6afe7a0  # 16:28  B   =
  17     1    0  10  Merge branch 'x86-cleanups-for-linus' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip
> >>git bisect  bad 892ad5acca0b2ddb514fae63fa4686bf726d2471  # 16:33  B   =
  21     2    0   5  Merge branch 'locking-core-for-linus' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip
> >>git bisect good 26d3a77d2cb3cb31bbaa2de37b7a4e6375f204ee  # 19:02  G   =
 155     0    0   0  Merge tag 'edac_for_4.13' of git://git.kernel.org/pub/=
scm/linux/kernel/git/bp/bp
> >>git bisect  bad 330e9e46253cbfab178450c976aa90ef0f3ae940  # 19:02  B   =
  21     3    0   4  Merge branch 'core-rcu-for-linus' of git://git.kernel.=
org/pub/scm/linux/kernel/git/tip/tip
> >>git bisect good e94693f797400b9f424c69e1da9381e4846762fe  # 19:46  G   =
 155     0    0   0  Merge branch 'core-objtool-for-linus' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip
> >>git bisect  bad 511324e462a12ea8be1a7e5fc63a992134db80d7  # 19:48  B   =
  18     1    0   9  rcu: Use RCU_NOCB_WAKE rather than RCU_NOGP_WAKE
> >>git bisect good 59ca3f9fef599cc6da7975d2261ab3bb86a6ac6b  # 20:21  G   =
 155     0    0   0  rcuperf: Add the ability to test tiny RCU flavors
> >>git bisect  bad 59d80fd8351b7b9a5dc7bbfa8bc4ca19f6ff3dad  # 21:22  B   =
  61     1    5  11  rcu: Print out rcupdate.c non-default boot-time settin=
gs
> >>git bisect  bad b562b85c3a8c395d49aca6a46b321299d6e49ff1  # 21:27  B   =
  15     5    0  10  srcu-cbmc: Use /usr/bin/awk instead of /bin/awk
> >>git bisect good 41f364819fbfc092462e3c85283fa887c8159387  # 22:22  G   =
 310     0    0   0  rcutorture: Reduce CPUs dedicated to testing Classic S=
RCU
> >>git bisect  bad 492b95e59735998312f678d77a2d5fe20af6b0b9  # 22:22  B   =
  21     1    0   9  rcuperf: Set more user-friendly defaults
> >>git bisect good 3ddf20c953520203c42dbed1f091ed52080e1cd2  # 22:56  G   =
 305     0    0   0  srcu: Shrink Tiny SRCU a bit more
> >># first bad commit: [492b95e59735998312f678d77a2d5fe20af6b0b9] rcuperf:=
 Set more user-friendly defaults
> >>git bisect good 3ddf20c953520203c42dbed1f091ed52080e1cd2  # 01:01  G   =
 910     0    0   0  srcu: Shrink Tiny SRCU a bit more
> >># extra tests on HEAD of linux-next/master
> >>git bisect  bad 36ef71cae353f88fd6e095e2aaa3e5953af1685d  # 01:02  B   =
  29    15    0   6  Add linux-next specific files for 20171018
> >># extra tests on tree/branch linus/master
> >>git bisect  bad bb176f67090ca54869fc1262c913aa69d2ede070  # 01:56  B   =
  19     2    5   5  Linux 4.14-rc6
> >># extra tests with first bad commit reverted
> >>git bisect good 00425bff9132ab95f35cc901571adfd591d29df6  # 06:20  G   =
 303     0    0   0  Revert "rcuperf: Set more user-friendly defaults"
> >># extra tests on tree/branch linux-next/master
> >>git bisect  bad 36ef71cae353f88fd6e095e2aaa3e5953af1685d  # 06:22  B   =
  29    15    0   6  Add linux-next specific files for 20171018
> >>
> >>---
> >>0-DAY kernel test infrastructure                Open Source Technology =
Center
> >>https://lists.01.org/pipermail/lkp                          Intel Corpo=
ration
> >
> >
> >>#!/bin/bash
> >>
> >>kernel=3D$1
> >>initrd=3Dquantal-core-x86_64.cgz
> >>
> >>wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw=
/master/initrd/$initrd
> >>
> >>kvm=3D(
> >>	qemu-system-x86_64
> >>	-enable-kvm
> >>	-cpu kvm64
> >>	-kernel $kernel
> >>	-initrd $initrd
> >>	-m 512
> >>	-smp 2
> >>	-device e1000,netdev=3Dnet0
> >>	-netdev user,id=3Dnet0
> >>	-boot order=3Dnc
> >>	-no-reboot
> >>	-watchdog i6300esb
> >>	-watchdog-action debug
> >>	-rtc base=3Dlocaltime
> >>	-serial stdio
> >>	-display none
> >>	-monitor null
> >>)
> >>
> >>append=3D(
> >>	root=3D/dev/ram0
> >>	hung_task_panic=3D1
> >>	debug
> >>	apic=3Ddebug
> >>	sysrq_always_enabled
> >>	rcupdate.rcu_cpu_stall_timeout=3D100
> >>	net.ifnames=3D0
> >>	printk.devkmsg=3Don
> >>	panic=3D-1
> >>	softlockup_panic=3D1
> >>	nmi_watchdog=3Dpanic
> >>	oops=3Dpanic
> >>	load_ramdisk=3D2
> >>	prompt_ramdisk=3D0
> >>	drbd.minor_count=3D8
> >>	systemd.log_level=3Derr
> >>	ignore_loglevel
> >>	console=3Dtty0
> >>	earlyprintk=3DttyS0,115200
> >>	console=3DttyS0,115200
> >>	vga=3Dnormal
> >>	rw
> >>	drbd.minor_count=3D8
> >>)
> >>
> >>"${kvm[@]}" -append "${append[*]}"
> >
> >>#
> >># Automatically generated file; DO NOT EDIT.
> >># Linux/x86_64 4.12.0-rc4 Kernel Configuration
> >>#
> >>CONFIG_64BIT=3Dy
> >>CONFIG_X86_64=3Dy
> >>CONFIG_X86=3Dy
> >>CONFIG_INSTRUCTION_DECODER=3Dy
> >>CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> >>CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> >>CONFIG_LOCKDEP_SUPPORT=3Dy
> >>CONFIG_STACKTRACE_SUPPORT=3Dy
> >>CONFIG_MMU=3Dy
> >>CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> >>CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> >>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> >>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> >>CONFIG_NEED_DMA_MAP_STATE=3Dy
> >>CONFIG_NEED_SG_DMA_LENGTH=3Dy
> >>CONFIG_GENERIC_BUG=3Dy
> >>CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> >>CONFIG_GENERIC_HWEIGHT=3Dy
> >>CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> >>CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> >>CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> >>CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> >>CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> >>CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> >>CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> >>CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> >>CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> >>CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> >>CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> >>CONFIG_ZONE_DMA32=3Dy
> >>CONFIG_AUDIT_ARCH=3Dy
> >>CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> >>CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> >>CONFIG_X86_64_SMP=3Dy
> >>CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> >>CONFIG_FIX_EARLYCON_MEM=3Dy
> >>CONFIG_PGTABLE_LEVELS=3D4
> >>CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> >>CONFIG_IRQ_WORK=3Dy
> >>CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> >>CONFIG_THREAD_INFO_IN_TASK=3Dy
> >>
> >>#
> >># General setup
> >>#
> >>CONFIG_INIT_ENV_ARG_LIMIT=3D32
> >>CONFIG_CROSS_COMPILE=3D""
> >># CONFIG_COMPILE_TEST is not set
> >>CONFIG_LOCALVERSION=3D""
> >>CONFIG_LOCALVERSION_AUTO=3Dy
> >>CONFIG_HAVE_KERNEL_GZIP=3Dy
> >>CONFIG_HAVE_KERNEL_BZIP2=3Dy
> >>CONFIG_HAVE_KERNEL_LZMA=3Dy
> >>CONFIG_HAVE_KERNEL_XZ=3Dy
> >>CONFIG_HAVE_KERNEL_LZO=3Dy
> >>CONFIG_HAVE_KERNEL_LZ4=3Dy
> >>CONFIG_KERNEL_GZIP=3Dy
> >># CONFIG_KERNEL_BZIP2 is not set
> >># CONFIG_KERNEL_LZMA is not set
> >># CONFIG_KERNEL_XZ is not set
> >># CONFIG_KERNEL_LZO is not set
> >># CONFIG_KERNEL_LZ4 is not set
> >>CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> >>CONFIG_SYSVIPC=3Dy
> >>CONFIG_SYSVIPC_SYSCTL=3Dy
> >># CONFIG_POSIX_MQUEUE is not set
> >>CONFIG_CROSS_MEMORY_ATTACH=3Dy
> >>CONFIG_FHANDLE=3Dy
> >>CONFIG_USELIB=3Dy
> >># CONFIG_AUDIT is not set
> >>CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> >>
> >>#
> >># IRQ subsystem
> >>#
> >>CONFIG_GENERIC_IRQ_PROBE=3Dy
> >>CONFIG_GENERIC_IRQ_SHOW=3Dy
> >>CONFIG_GENERIC_PENDING_IRQ=3Dy
> >>CONFIG_IRQ_DOMAIN=3Dy
> >>CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> >>CONFIG_GENERIC_MSI_IRQ=3Dy
> >>CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> >>CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> >>CONFIG_IRQ_FORCED_THREADING=3Dy
> >>CONFIG_SPARSE_IRQ=3Dy
> >>CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> >>CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> >>CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> >>CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> >>CONFIG_GENERIC_CLOCKEVENTS=3Dy
> >>CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> >>CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> >>CONFIG_GENERIC_CMOS_UPDATE=3Dy
> >>
> >>#
> >># Timers subsystem
> >>#
> >>CONFIG_HZ_PERIODIC=3Dy
> >># CONFIG_NO_HZ_IDLE is not set
> >># CONFIG_NO_HZ_FULL is not set
> >># CONFIG_NO_HZ is not set
> >># CONFIG_HIGH_RES_TIMERS is not set
> >>
> >>#
> >># CPU/Task time and stats accounting
> >>#
> >>CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> >># CONFIG_TICK_CPU_ACCOUNTING is not set
> >>CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> >>CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> >># CONFIG_BSD_PROCESS_ACCT is not set
> >># CONFIG_TASKSTATS is not set
> >>
> >>#
> >># RCU Subsystem
> >>#
> >>CONFIG_TREE_RCU=3Dy
> >>CONFIG_RCU_EXPERT=3Dy
> >>CONFIG_SRCU=3Dy
> >># CONFIG_CLASSIC_SRCU is not set
> >>CONFIG_TREE_SRCU=3Dy
> >>CONFIG_TASKS_RCU=3Dy
> >>CONFIG_RCU_STALL_COMMON=3Dy
> >>CONFIG_RCU_NEED_SEGCBLIST=3Dy
> >>CONFIG_CONTEXT_TRACKING=3Dy
> >>CONFIG_CONTEXT_TRACKING_FORCE=3Dy
> >>CONFIG_RCU_FANOUT=3D64
> >>CONFIG_RCU_FANOUT_LEAF=3D16
> >>CONFIG_TREE_RCU_TRACE=3Dy
> >>CONFIG_RCU_KTHREAD_PRIO=3D0
> >>CONFIG_RCU_NOCB_CPU=3Dy
> >>CONFIG_RCU_NOCB_CPU_NONE=3Dy
> >># CONFIG_RCU_NOCB_CPU_ZERO is not set
> >># CONFIG_RCU_NOCB_CPU_ALL is not set
> >>CONFIG_BUILD_BIN2C=3Dy
> >>CONFIG_IKCONFIG=3Dy
> >>CONFIG_IKCONFIG_PROC=3Dy
> >>CONFIG_LOG_BUF_SHIFT=3D17
> >>CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> >>CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> >>CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> >>CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> >>CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> >>CONFIG_ARCH_SUPPORTS_INT128=3Dy
> >>CONFIG_CGROUPS=3Dy
> >># CONFIG_MEMCG is not set
> >># CONFIG_CGROUP_SCHED is not set
> >># CONFIG_CGROUP_PIDS is not set
> >># CONFIG_CGROUP_RDMA is not set
> >># CONFIG_CGROUP_FREEZER is not set
> >># CONFIG_CGROUP_HUGETLB is not set
> >># CONFIG_CPUSETS is not set
> >>CONFIG_CGROUP_DEVICE=3Dy
> >># CONFIG_CGROUP_CPUACCT is not set
> >># CONFIG_CGROUP_PERF is not set
> >>CONFIG_CGROUP_DEBUG=3Dy
> >># CONFIG_SOCK_CGROUP_DATA is not set
> >>CONFIG_CHECKPOINT_RESTORE=3Dy
> >># CONFIG_NAMESPACES is not set
> >># CONFIG_SCHED_AUTOGROUP is not set
> >># CONFIG_SYSFS_DEPRECATED is not set
> >># CONFIG_RELAY is not set
> >>CONFIG_BLK_DEV_INITRD=3Dy
> >>CONFIG_INITRAMFS_SOURCE=3D""
> >>CONFIG_RD_GZIP=3Dy
> >># CONFIG_RD_BZIP2 is not set
> >>CONFIG_RD_LZMA=3Dy
> >>CONFIG_RD_XZ=3Dy
> >>CONFIG_RD_LZO=3Dy
> >># CONFIG_RD_LZ4 is not set
> >># CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> >>CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> >>CONFIG_SYSCTL=3Dy
> >>CONFIG_ANON_INODES=3Dy
> >>CONFIG_HAVE_UID16=3Dy
> >>CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> >>CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> >>CONFIG_BPF=3Dy
> >>CONFIG_EXPERT=3Dy
> >>CONFIG_UID16=3Dy
> >>CONFIG_MULTIUSER=3Dy
> >>CONFIG_SGETMASK_SYSCALL=3Dy
> >># CONFIG_SYSFS_SYSCALL is not set
> >># CONFIG_SYSCTL_SYSCALL is not set
> >>CONFIG_POSIX_TIMERS=3Dy
> >>CONFIG_KALLSYMS=3Dy
> >>CONFIG_KALLSYMS_ALL=3Dy
> >>CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> >>CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> >>CONFIG_PRINTK=3Dy
> >>CONFIG_PRINTK_NMI=3Dy
> >>CONFIG_BUG=3Dy
> >>CONFIG_PCSPKR_PLATFORM=3Dy
> >>CONFIG_BASE_FULL=3Dy
> >>CONFIG_FUTEX=3Dy
> >>CONFIG_EPOLL=3Dy
> >>CONFIG_SIGNALFD=3Dy
> >>CONFIG_TIMERFD=3Dy
> >># CONFIG_EVENTFD is not set
> >># CONFIG_BPF_SYSCALL is not set
> >>CONFIG_SHMEM=3Dy
> >>CONFIG_AIO=3Dy
> >># CONFIG_ADVISE_SYSCALLS is not set
> >># CONFIG_USERFAULTFD is not set
> >>CONFIG_PCI_QUIRKS=3Dy
> >># CONFIG_MEMBARRIER is not set
> >>CONFIG_EMBEDDED=3Dy
> >>CONFIG_HAVE_PERF_EVENTS=3Dy
> >>CONFIG_PC104=3Dy
> >>
> >>#
> >># Kernel Performance Events And Counters
> >>#
> >>CONFIG_PERF_EVENTS=3Dy
> >># CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> >>CONFIG_VM_EVENT_COUNTERS=3Dy
> >># CONFIG_SLUB_DEBUG is not set
> >>CONFIG_COMPAT_BRK=3Dy
> >># CONFIG_SLAB is not set
> >>CONFIG_SLUB=3Dy
> >># CONFIG_SLOB is not set
> >># CONFIG_SLAB_FREELIST_RANDOM is not set
> >>CONFIG_SLUB_CPU_PARTIAL=3Dy
> >># CONFIG_SYSTEM_DATA_VERIFICATION is not set
> >># CONFIG_PROFILING is not set
> >>CONFIG_TRACEPOINTS=3Dy
> >>CONFIG_CRASH_CORE=3Dy
> >>CONFIG_KEXEC_CORE=3Dy
> >>CONFIG_HAVE_OPROFILE=3Dy
> >>CONFIG_OPROFILE_NMI_TIMER=3Dy
> >># CONFIG_JUMP_LABEL is not set
> >># CONFIG_UPROBES is not set
> >># CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> >>CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> >>CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> >>CONFIG_HAVE_IOREMAP_PROT=3Dy
> >>CONFIG_HAVE_KPROBES=3Dy
> >>CONFIG_HAVE_KRETPROBES=3Dy
> >>CONFIG_HAVE_OPTPROBES=3Dy
> >>CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> >>CONFIG_HAVE_NMI=3Dy
> >>CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> >>CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> >>CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> >>CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> >>CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> >>CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> >>CONFIG_HAVE_CLK=3Dy
> >>CONFIG_HAVE_DMA_API_DEBUG=3Dy
> >>CONFIG_HAVE_HW_BREAKPOINT=3Dy
> >>CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> >>CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> >>CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> >>CONFIG_HAVE_PERF_REGS=3Dy
> >>CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> >>CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> >>CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> >>CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> >>CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> >>CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> >>CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> >>CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> >>CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> >>CONFIG_SECCOMP_FILTER=3Dy
> >>CONFIG_HAVE_GCC_PLUGINS=3Dy
> >>CONFIG_GCC_PLUGINS=3Dy
> >># CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
> >>CONFIG_GCC_PLUGIN_SANCOV=3Dy
> >># CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> >># CONFIG_GCC_PLUGIN_STRUCTLEAK is not set
> >>CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> >># CONFIG_CC_STACKPROTECTOR is not set
> >>CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> >># CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> >># CONFIG_CC_STACKPROTECTOR_STRONG is not set
> >>CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> >>CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> >>CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> >>CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> >>CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> >>CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> >>CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> >>CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> >>CONFIG_MODULES_USE_ELF_RELA=3Dy
> >>CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> >>CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> >>CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> >>CONFIG_HAVE_EXIT_THREAD=3Dy
> >>CONFIG_ARCH_MMAP_RND_BITS=3D28
> >>CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> >>CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> >>CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> >>CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> >>CONFIG_HAVE_STACK_VALIDATION=3Dy
> >>CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> >># CONFIG_HAVE_ARCH_HASH is not set
> >># CONFIG_ISA_BUS_API is not set
> >>CONFIG_OLD_SIGSUSPEND3=3Dy
> >>CONFIG_COMPAT_OLD_SIGACTION=3Dy
> >># CONFIG_CPU_NO_EFFICIENT_FFS is not set
> >>CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> >># CONFIG_VMAP_STACK is not set
> >># CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> >># CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> >>CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> >>CONFIG_STRICT_KERNEL_RWX=3Dy
> >>CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> >>
> >>#
> >># GCOV-based kernel profiling
> >>#
> >># CONFIG_GCOV_KERNEL is not set
> >>CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> >># CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> >>CONFIG_RT_MUTEXES=3Dy
> >>CONFIG_BASE_SMALL=3D0
> >># CONFIG_MODULES is not set
> >>CONFIG_MODULES_TREE_LOOKUP=3Dy
> >># CONFIG_BLOCK is not set
> >>CONFIG_ASN1=3Dy
> >>CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> >>CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> >>CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> >>CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> >>CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> >>CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> >>CONFIG_QUEUED_SPINLOCKS=3Dy
> >>CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> >>CONFIG_QUEUED_RWLOCKS=3Dy
> >>CONFIG_FREEZER=3Dy
> >>
> >>#
> >># Processor type and features
> >>#
> >>CONFIG_ZONE_DMA=3Dy
> >>CONFIG_SMP=3Dy
> >>CONFIG_X86_FEATURE_NAMES=3Dy
> >># CONFIG_X86_FAST_FEATURE_TESTS is not set
> >>CONFIG_X86_X2APIC=3Dy
> >># CONFIG_X86_MPPARSE is not set
> >>CONFIG_GOLDFISH=3Dy
> >># CONFIG_INTEL_RDT_A is not set
> >># CONFIG_X86_EXTENDED_PLATFORM is not set
> >># CONFIG_X86_INTEL_LPSS is not set
> >># CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> >>CONFIG_IOSF_MBI=3Dy
> >># CONFIG_IOSF_MBI_DEBUG is not set
> >># CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> >>CONFIG_HYPERVISOR_GUEST=3Dy
> >>CONFIG_PARAVIRT=3Dy
> >># CONFIG_PARAVIRT_DEBUG is not set
> >># CONFIG_PARAVIRT_SPINLOCKS is not set
> >># CONFIG_XEN is not set
> >>CONFIG_KVM_GUEST=3Dy
> >># CONFIG_KVM_DEBUG_FS is not set
> >># CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> >>CONFIG_PARAVIRT_CLOCK=3Dy
> >>CONFIG_NO_BOOTMEM=3Dy
> >># CONFIG_MK8 is not set
> >># CONFIG_MPSC is not set
> >># CONFIG_MCORE2 is not set
> >># CONFIG_MATOM is not set
> >>CONFIG_GENERIC_CPU=3Dy
> >>CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> >>CONFIG_X86_L1_CACHE_SHIFT=3D6
> >>CONFIG_X86_TSC=3Dy
> >>CONFIG_X86_CMPXCHG64=3Dy
> >>CONFIG_X86_CMOV=3Dy
> >>CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> >>CONFIG_X86_DEBUGCTLMSR=3Dy
> >># CONFIG_PROCESSOR_SELECT is not set
> >>CONFIG_CPU_SUP_INTEL=3Dy
> >>CONFIG_CPU_SUP_AMD=3Dy
> >>CONFIG_CPU_SUP_CENTAUR=3Dy
> >>CONFIG_HPET_TIMER=3Dy
> >>CONFIG_HPET_EMULATE_RTC=3Dy
> >>CONFIG_DMI=3Dy
> >>CONFIG_GART_IOMMU=3Dy
> >>CONFIG_CALGARY_IOMMU=3Dy
> >># CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT is not set
> >>CONFIG_SWIOTLB=3Dy
> >>CONFIG_IOMMU_HELPER=3Dy
> >># CONFIG_MAXSMP is not set
> >>CONFIG_NR_CPUS=3D64
> >># CONFIG_SCHED_SMT is not set
> >># CONFIG_SCHED_MC is not set
> >># CONFIG_PREEMPT_NONE is not set
> >>CONFIG_PREEMPT_VOLUNTARY=3Dy
> >># CONFIG_PREEMPT is not set
> >>CONFIG_PREEMPT_COUNT=3Dy
> >>CONFIG_X86_LOCAL_APIC=3Dy
> >>CONFIG_X86_IO_APIC=3Dy
> >>CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> >># CONFIG_X86_MCE is not set
> >>
> >>#
> >># Performance monitoring
> >>#
> >>CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> >>CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> >>CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> >>CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> >># CONFIG_VM86 is not set
> >>CONFIG_X86_VSYSCALL_EMULATION=3Dy
> >>CONFIG_I8K=3Dy
> >># CONFIG_MICROCODE is not set
> >>CONFIG_X86_MSR=3Dy
> >># CONFIG_X86_CPUID is not set
> >>CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> >>CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> >>CONFIG_NUMA=3Dy
> >>CONFIG_AMD_NUMA=3Dy
> >># CONFIG_X86_64_ACPI_NUMA is not set
> >># CONFIG_NUMA_EMU is not set
> >>CONFIG_NODES_SHIFT=3D6
> >>CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> >>CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> >>CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> >>CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> >>CONFIG_SELECT_MEMORY_MODEL=3Dy
> >>CONFIG_SPARSEMEM_MANUAL=3Dy
> >>CONFIG_SPARSEMEM=3Dy
> >>CONFIG_NEED_MULTIPLE_NODES=3Dy
> >>CONFIG_HAVE_MEMORY_PRESENT=3Dy
> >>CONFIG_SPARSEMEM_EXTREME=3Dy
> >>CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> >>CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> >># CONFIG_SPARSEMEM_VMEMMAP is not set
> >>CONFIG_HAVE_MEMBLOCK=3Dy
> >>CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> >>CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> >># CONFIG_MOVABLE_NODE is not set
> >># CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> >># CONFIG_MEMORY_HOTPLUG is not set
> >>CONFIG_SPLIT_PTLOCK_CPUS=3D4
> >>CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> >>CONFIG_MEMORY_BALLOON=3Dy
> >># CONFIG_COMPACTION is not set
> >># CONFIG_MIGRATION is not set
> >>CONFIG_PHYS_ADDR_T_64BIT=3Dy
> >>CONFIG_VIRT_TO_BUS=3Dy
> >># CONFIG_KSM is not set
> >>CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> >># CONFIG_TRANSPARENT_HUGEPAGE is not set
> >># CONFIG_CLEANCACHE is not set
> >># CONFIG_CMA is not set
> >># CONFIG_MEM_SOFT_DIRTY is not set
> >># CONFIG_ZPOOL is not set
> >>CONFIG_ZBUD=3Dy
> >># CONFIG_ZSMALLOC is not set
> >>CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> >>CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> >># CONFIG_IDLE_PAGE_TRACKING is not set
> >>CONFIG_FRAME_VECTOR=3Dy
> >># CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> >>CONFIG_X86_RESERVE_LOW=3D64
> >># CONFIG_MTRR is not set
> >>CONFIG_ARCH_RANDOM=3Dy
> >>CONFIG_X86_SMAP=3Dy
> >>CONFIG_X86_INTEL_MPX=3Dy
> >># CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
> >>CONFIG_EFI=3Dy
> >># CONFIG_EFI_STUB is not set
> >>CONFIG_SECCOMP=3Dy
> >># CONFIG_HZ_100 is not set
> >>CONFIG_HZ_250=3Dy
> >># CONFIG_HZ_300 is not set
> >># CONFIG_HZ_1000 is not set
> >>CONFIG_HZ=3D250
> >># CONFIG_SCHED_HRTICK is not set
> >>CONFIG_KEXEC=3Dy
> >># CONFIG_KEXEC_FILE is not set
> >># CONFIG_CRASH_DUMP is not set
> >>CONFIG_PHYSICAL_START=3D0x1000000
> >>CONFIG_RELOCATABLE=3Dy
> >># CONFIG_RANDOMIZE_BASE is not set
> >>CONFIG_PHYSICAL_ALIGN=3D0x200000
> >>CONFIG_HOTPLUG_CPU=3Dy
> >># CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> >>CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> >># CONFIG_COMPAT_VDSO is not set
> >># CONFIG_LEGACY_VSYSCALL_NATIVE is not set
> >>CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> >># CONFIG_LEGACY_VSYSCALL_NONE is not set
> >># CONFIG_CMDLINE_BOOL is not set
> >># CONFIG_MODIFY_LDT_SYSCALL is not set
> >>CONFIG_HAVE_LIVEPATCH=3Dy
> >>CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> >>CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> >>
> >>#
> >># Power management and ACPI options
> >>#
> >>CONFIG_SUSPEND=3Dy
> >>CONFIG_SUSPEND_FREEZER=3Dy
> >>CONFIG_SUSPEND_SKIP_SYNC=3Dy
> >>CONFIG_PM_SLEEP=3Dy
> >>CONFIG_PM_SLEEP_SMP=3Dy
> >>CONFIG_PM_AUTOSLEEP=3Dy
> >>CONFIG_PM_WAKELOCKS=3Dy
> >>CONFIG_PM_WAKELOCKS_LIMIT=3D100
> >># CONFIG_PM_WAKELOCKS_GC is not set
> >>CONFIG_PM=3Dy
> >># CONFIG_PM_DEBUG is not set
> >>CONFIG_PM_CLK=3Dy
> >># CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> >>CONFIG_ACPI=3Dy
> >>CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> >>CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> >>CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> >># CONFIG_ACPI_DEBUGGER is not set
> >>CONFIG_ACPI_SLEEP=3Dy
> >># CONFIG_ACPI_PROCFS_POWER is not set
> >>CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> >>CONFIG_ACPI_EC_DEBUGFS=3Dy
> >># CONFIG_ACPI_AC is not set
> >>CONFIG_ACPI_BATTERY=3Dy
> >>CONFIG_ACPI_BUTTON=3Dy
> >>CONFIG_ACPI_VIDEO=3Dy
> >>CONFIG_ACPI_FAN=3Dy
> >># CONFIG_ACPI_DOCK is not set
> >>CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> >>CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> >>CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> >>CONFIG_ACPI_PROCESSOR=3Dy
> >># CONFIG_ACPI_IPMI is not set
> >>CONFIG_ACPI_HOTPLUG_CPU=3Dy
> >>CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dy
> >>CONFIG_ACPI_THERMAL=3Dy
> >>CONFIG_ACPI_NUMA=3Dy
> >># CONFIG_ACPI_CUSTOM_DSDT is not set
> >>CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> >># CONFIG_ACPI_TABLE_UPGRADE is not set
> >>CONFIG_ACPI_DEBUG=3Dy
> >># CONFIG_ACPI_PCI_SLOT is not set
> >>CONFIG_X86_PM_TIMER=3Dy
> >>CONFIG_ACPI_CONTAINER=3Dy
> >>CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> >># CONFIG_ACPI_SBS is not set
> >>CONFIG_ACPI_HED=3Dy
> >>CONFIG_ACPI_CUSTOM_METHOD=3Dy
> >>CONFIG_ACPI_BGRT=3Dy
> >>CONFIG_ACPI_REDUCED_HARDWARE_ONLY=3Dy
> >>CONFIG_HAVE_ACPI_APEI=3Dy
> >>CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> >>CONFIG_ACPI_APEI=3Dy
> >>CONFIG_ACPI_APEI_GHES=3Dy
> >>CONFIG_ACPI_APEI_EINJ=3Dy
> >># CONFIG_ACPI_APEI_ERST_DEBUG is not set
> >>CONFIG_DPTF_POWER=3Dy
> >># CONFIG_PMIC_OPREGION is not set
> >>CONFIG_ACPI_CONFIGFS=3Dy
> >>CONFIG_SFI=3Dy
> >>
> >>#
> >># CPU Frequency scaling
> >>#
> >>CONFIG_CPU_FREQ=3Dy
> >>CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> >>CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> >>CONFIG_CPU_FREQ_STAT=3Dy
> >># CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> >># CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> >># CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> >># CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> >>CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
> >># CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> >>CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> >>CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> >>CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> >>CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> >>CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> >>CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> >>
> >>#
> >># CPU frequency scaling drivers
> >>#
> >>CONFIG_X86_INTEL_PSTATE=3Dy
> >>CONFIG_X86_PCC_CPUFREQ=3Dy
> >># CONFIG_X86_ACPI_CPUFREQ is not set
> >># CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> >>CONFIG_X86_P4_CLOCKMOD=3Dy
> >>
> >>#
> >># shared options
> >>#
> >>CONFIG_X86_SPEEDSTEP_LIB=3Dy
> >>
> >>#
> >># CPU Idle
> >>#
> >>CONFIG_CPU_IDLE=3Dy
> >>CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> >># CONFIG_CPU_IDLE_GOV_MENU is not set
> >># CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> >># CONFIG_INTEL_IDLE is not set
> >>
> >>#
> >># Bus options (PCI etc.)
> >>#
> >>CONFIG_PCI=3Dy
> >>CONFIG_PCI_DIRECT=3Dy
> >># CONFIG_PCI_MMCONFIG is not set
> >>CONFIG_PCI_DOMAINS=3Dy
> >>CONFIG_PCI_CNB20LE_QUIRK=3Dy
> >>CONFIG_PCIEPORTBUS=3Dy
> >># CONFIG_PCIEAER is not set
> >># CONFIG_PCIEASPM is not set
> >>CONFIG_PCIE_PME=3Dy
> >>CONFIG_PCIE_DPC=3Dy
> >>CONFIG_PCIE_PTM=3Dy
> >>CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> >>CONFIG_PCI_MSI=3Dy
> >>CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> >># CONFIG_PCI_DEBUG is not set
> >># CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> >>CONFIG_PCI_STUB=3Dy
> >># CONFIG_HT_IRQ is not set
> >>CONFIG_PCI_ATS=3Dy
> >># CONFIG_PCI_IOV is not set
> >># CONFIG_PCI_PRI is not set
> >>CONFIG_PCI_PASID=3Dy
> >>CONFIG_PCI_LABEL=3Dy
> >># CONFIG_HOTPLUG_PCI is not set
> >>
> >>#
> >># DesignWare PCI Core Support
> >>#
> >># CONFIG_PCIE_DW_PLAT is not set
> >>
> >>#
> >># PCI host controller drivers
> >>#
> >># CONFIG_VMD is not set
> >>
> >>#
> >># PCI Endpoint
> >>#
> >>CONFIG_PCI_ENDPOINT=3Dy
> >># CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> >>CONFIG_PCI_EPF_TEST=3Dy
> >>
> >>#
> >># PCI switch controller drivers
> >>#
> >># CONFIG_PCI_SW_SWITCHTEC is not set
> >># CONFIG_ISA_BUS is not set
> >># CONFIG_ISA_DMA_API is not set
> >>CONFIG_AMD_NB=3Dy
> >>CONFIG_PCCARD=3Dy
> >>CONFIG_PCMCIA=3Dy
> >># CONFIG_PCMCIA_LOAD_CIS is not set
> >># CONFIG_CARDBUS is not set
> >>
> >>#
> >># PC-card bridges
> >>#
> >># CONFIG_YENTA is not set
> >>CONFIG_PD6729=3Dy
> >>CONFIG_I82092=3Dy
> >>CONFIG_PCCARD_NONSTATIC=3Dy
> >># CONFIG_RAPIDIO is not set
> >># CONFIG_X86_SYSFB is not set
> >>
> >>#
> >># Executable file formats / Emulations
> >>#
> >>CONFIG_BINFMT_ELF=3Dy
> >>CONFIG_COMPAT_BINFMT_ELF=3Dy
> >>CONFIG_ELFCORE=3Dy
> >>CONFIG_BINFMT_SCRIPT=3Dy
> >># CONFIG_HAVE_AOUT is not set
> >>CONFIG_BINFMT_MISC=3Dy
> >># CONFIG_COREDUMP is not set
> >>CONFIG_IA32_EMULATION=3Dy
> >>CONFIG_IA32_AOUT=3Dy
> >># CONFIG_X86_X32 is not set
> >>CONFIG_COMPAT_32=3Dy
> >>CONFIG_COMPAT=3Dy
> >>CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> >>CONFIG_SYSVIPC_COMPAT=3Dy
> >>CONFIG_X86_DEV_DMA_OPS=3Dy
> >>CONFIG_NET=3Dy
> >>
> >>#
> >># Networking options
> >>#
> >># CONFIG_PACKET is not set
> >>CONFIG_UNIX=3Dy
> >># CONFIG_UNIX_DIAG is not set
> >># CONFIG_NET_KEY is not set
> >># CONFIG_INET is not set
> >># CONFIG_NETWORK_SECMARK is not set
> >># CONFIG_NET_PTP_CLASSIFY is not set
> >># CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> >># CONFIG_NETFILTER is not set
> >># CONFIG_ATM is not set
> >># CONFIG_BRIDGE is not set
> >># CONFIG_VLAN_8021Q is not set
> >># CONFIG_DECNET is not set
> >># CONFIG_LLC2 is not set
> >># CONFIG_IPX is not set
> >># CONFIG_ATALK is not set
> >># CONFIG_X25 is not set
> >># CONFIG_LAPB is not set
> >># CONFIG_PHONET is not set
> >># CONFIG_IEEE802154 is not set
> >># CONFIG_NET_SCHED is not set
> >># CONFIG_DCB is not set
> >># CONFIG_BATMAN_ADV is not set
> >># CONFIG_VSOCKETS is not set
> >># CONFIG_NETLINK_DIAG is not set
> >># CONFIG_MPLS is not set
> >># CONFIG_HSR is not set
> >>CONFIG_RPS=3Dy
> >>CONFIG_RFS_ACCEL=3Dy
> >>CONFIG_XPS=3Dy
> >># CONFIG_CGROUP_NET_PRIO is not set
> >># CONFIG_CGROUP_NET_CLASSID is not set
> >>CONFIG_NET_RX_BUSY_POLL=3Dy
> >>CONFIG_BQL=3Dy
> >>CONFIG_NET_FLOW_LIMIT=3Dy
> >>
> >>#
> >># Network testing
> >>#
> >># CONFIG_HAMRADIO is not set
> >># CONFIG_CAN is not set
> >># CONFIG_IRDA is not set
> >># CONFIG_BT is not set
> >># CONFIG_STREAM_PARSER is not set
> >>CONFIG_WIRELESS=3Dy
> >># CONFIG_CFG80211 is not set
> >># CONFIG_LIB80211 is not set
> >>
> >>#
> >># CFG80211 needs to be enabled for MAC80211
> >>#
> >>CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> >># CONFIG_WIMAX is not set
> >># CONFIG_RFKILL is not set
> >># CONFIG_NET_9P is not set
> >># CONFIG_CAIF is not set
> >># CONFIG_NFC is not set
> >># CONFIG_PSAMPLE is not set
> >># CONFIG_NET_IFE is not set
> >># CONFIG_LWTUNNEL is not set
> >># CONFIG_DST_CACHE is not set
> >># CONFIG_GRO_CELLS is not set
> >># CONFIG_NET_DEVLINK is not set
> >>CONFIG_MAY_USE_DEVLINK=3Dy
> >>CONFIG_HAVE_EBPF_JIT=3Dy
> >>
> >>#
> >># Device Drivers
> >>#
> >>
> >>#
> >># Generic Driver Options
> >>#
> >># CONFIG_UEVENT_HELPER is not set
> >>CONFIG_DEVTMPFS=3Dy
> >># CONFIG_DEVTMPFS_MOUNT is not set
> >>CONFIG_STANDALONE=3Dy
> >>CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> >>CONFIG_FW_LOADER=3Dy
> >># CONFIG_FIRMWARE_IN_KERNEL is not set
> >>CONFIG_EXTRA_FIRMWARE=3D""
> >>CONFIG_FW_LOADER_USER_HELPER=3Dy
> >>CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> >># CONFIG_ALLOW_DEV_COREDUMP is not set
> >># CONFIG_DEBUG_DRIVER is not set
> >>CONFIG_DEBUG_DEVRES=3Dy
> >># CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> >># CONFIG_SYS_HYPERVISOR is not set
> >># CONFIG_GENERIC_CPU_DEVICES is not set
> >>CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> >>CONFIG_REGMAP=3Dy
> >>CONFIG_REGMAP_I2C=3Dy
> >>CONFIG_REGMAP_SPI=3Dy
> >>CONFIG_REGMAP_MMIO=3Dy
> >>CONFIG_REGMAP_IRQ=3Dy
> >>CONFIG_DMA_SHARED_BUFFER=3Dy
> >># CONFIG_DMA_FENCE_TRACE is not set
> >>
> >>#
> >># Bus devices
> >>#
> >># CONFIG_CONNECTOR is not set
> >>CONFIG_MTD=3Dy
> >>CONFIG_MTD_REDBOOT_PARTS=3Dy
> >>CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> >># CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> >># CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> >># CONFIG_MTD_CMDLINE_PARTS is not set
> >>CONFIG_MTD_AR7_PARTS=3Dy
> >>
> >>#
> >># User Modules And Translation Layers
> >>#
> >># CONFIG_MTD_OOPS is not set
> >># CONFIG_MTD_PARTITIONED_MASTER is not set
> >>
> >>#
> >># RAM/ROM/Flash chip drivers
> >>#
> >>CONFIG_MTD_CFI=3Dy
> >>CONFIG_MTD_JEDECPROBE=3Dy
> >>CONFIG_MTD_GEN_PROBE=3Dy
> >># CONFIG_MTD_CFI_ADV_OPTIONS is not set
> >>CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> >>CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> >>CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> >># CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> >># CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> >># CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> >>CONFIG_MTD_CFI_I1=3Dy
> >>CONFIG_MTD_CFI_I2=3Dy
> >># CONFIG_MTD_CFI_I4 is not set
> >># CONFIG_MTD_CFI_I8 is not set
> >># CONFIG_MTD_CFI_INTELEXT is not set
> >>CONFIG_MTD_CFI_AMDSTD=3Dy
> >># CONFIG_MTD_CFI_STAA is not set
> >>CONFIG_MTD_CFI_UTIL=3Dy
> >>CONFIG_MTD_RAM=3Dy
> >>CONFIG_MTD_ROM=3Dy
> >>CONFIG_MTD_ABSENT=3Dy
> >>
> >>#
> >># Mapping drivers for chip access
> >>#
> >># CONFIG_MTD_COMPLEX_MAPPINGS is not set
> >># CONFIG_MTD_PHYSMAP is not set
> >>CONFIG_MTD_AMD76XROM=3Dy
> >>CONFIG_MTD_ICHXROM=3Dy
> >>CONFIG_MTD_ESB2ROM=3Dy
> >>CONFIG_MTD_CK804XROM=3Dy
> >># CONFIG_MTD_SCB2_FLASH is not set
> >># CONFIG_MTD_NETtel is not set
> >># CONFIG_MTD_L440GX is not set
> >># CONFIG_MTD_INTEL_VR_NOR is not set
> >>CONFIG_MTD_PLATRAM=3Dy
> >>
> >>#
> >># Self-contained MTD device drivers
> >>#
> >>CONFIG_MTD_PMC551=3Dy
> >># CONFIG_MTD_PMC551_BUGFIX is not set
> >># CONFIG_MTD_PMC551_DEBUG is not set
> >>CONFIG_MTD_DATAFLASH=3Dy
> >>CONFIG_MTD_DATAFLASH_WRITE_VERIFY=3Dy
> >>CONFIG_MTD_DATAFLASH_OTP=3Dy
> >># CONFIG_MTD_M25P80 is not set
> >>CONFIG_MTD_SST25L=3Dy
> >>CONFIG_MTD_SLRAM=3Dy
> >># CONFIG_MTD_PHRAM is not set
> >>CONFIG_MTD_MTDRAM=3Dy
> >>CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> >>CONFIG_MTDRAM_ERASE_SIZE=3D128
> >>
> >>#
> >># Disk-On-Chip Device Drivers
> >>#
> >>CONFIG_MTD_DOCG3=3Dy
> >>CONFIG_BCH_CONST_M=3D14
> >>CONFIG_BCH_CONST_T=3D4
> >>CONFIG_MTD_NAND_ECC=3Dy
> >># CONFIG_MTD_NAND_ECC_SMC is not set
> >>CONFIG_MTD_NAND=3Dy
> >># CONFIG_MTD_NAND_ECC_BCH is not set
> >>CONFIG_MTD_SM_COMMON=3Dy
> >>CONFIG_MTD_NAND_DENALI=3Dy
> >>CONFIG_MTD_NAND_DENALI_PCI=3Dy
> >>CONFIG_MTD_NAND_GPIO=3Dy
> >># CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> >>CONFIG_MTD_NAND_RICOH=3Dy
> >># CONFIG_MTD_NAND_DISKONCHIP is not set
> >>CONFIG_MTD_NAND_DOCG4=3Dy
> >>CONFIG_MTD_NAND_CAFE=3Dy
> >>CONFIG_MTD_NAND_NANDSIM=3Dy
> >># CONFIG_MTD_NAND_PLATFORM is not set
> >># CONFIG_MTD_NAND_HISI504 is not set
> >># CONFIG_MTD_NAND_MTK is not set
> >>CONFIG_MTD_ONENAND=3Dy
> >>CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> >>CONFIG_MTD_ONENAND_GENERIC=3Dy
> >>CONFIG_MTD_ONENAND_OTP=3Dy
> >># CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> >>
> >>#
> >># LPDDR & LPDDR2 PCM memory drivers
> >>#
> >># CONFIG_MTD_LPDDR is not set
> >>CONFIG_MTD_SPI_NOR=3Dy
> >># CONFIG_MTD_MT81xx_NOR is not set
> >>CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> >># CONFIG_SPI_INTEL_SPI_PLATFORM is not set
> >># CONFIG_MTD_UBI is not set
> >># CONFIG_OF is not set
> >>CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> >>CONFIG_PARPORT=3Dy
> >># CONFIG_PARPORT_PC is not set
> >># CONFIG_PARPORT_GSC is not set
> >>CONFIG_PARPORT_AX88796=3Dy
> >>CONFIG_PARPORT_1284=3Dy
> >>CONFIG_PARPORT_NOT_PC=3Dy
> >>CONFIG_PNP=3Dy
> >>CONFIG_PNP_DEBUG_MESSAGES=3Dy
> >>
> >>#
> >># Protocols
> >>#
> >>CONFIG_PNPACPI=3Dy
> >>
> >>#
> >># Misc devices
> >>#
> >>CONFIG_SENSORS_LIS3LV02D=3Dy
> >># CONFIG_AD525X_DPOT is not set
> >>CONFIG_DUMMY_IRQ=3Dy
> >>CONFIG_IBM_ASM=3Dy
> >># CONFIG_PHANTOM is not set
> >># CONFIG_SGI_IOC4 is not set
> >># CONFIG_TIFM_CORE is not set
> >>CONFIG_ICS932S401=3Dy
> >>CONFIG_ENCLOSURE_SERVICES=3Dy
> >>CONFIG_HP_ILO=3Dy
> >>CONFIG_APDS9802ALS=3Dy
> >>CONFIG_ISL29003=3Dy
> >>CONFIG_ISL29020=3Dy
> >>CONFIG_SENSORS_TSL2550=3Dy
> >>CONFIG_SENSORS_BH1770=3Dy
> >>CONFIG_SENSORS_APDS990X=3Dy
> >>CONFIG_HMC6352=3Dy
> >>CONFIG_DS1682=3Dy
> >># CONFIG_TI_DAC7512 is not set
> >># CONFIG_USB_SWITCH_FSA9480 is not set
> >>CONFIG_LATTICE_ECP3_CONFIG=3Dy
> >>CONFIG_SRAM=3Dy
> >># CONFIG_PCI_ENDPOINT_TEST is not set
> >>CONFIG_C2PORT=3Dy
> >>CONFIG_C2PORT_DURAMAR_2150=3Dy
> >>
> >>#
> >># EEPROM support
> >>#
> >>CONFIG_EEPROM_AT24=3Dy
> >>CONFIG_EEPROM_AT25=3Dy
> >># CONFIG_EEPROM_LEGACY is not set
> >>CONFIG_EEPROM_MAX6875=3Dy
> >>CONFIG_EEPROM_93CX6=3Dy
> >>CONFIG_EEPROM_93XX46=3Dy
> >>CONFIG_EEPROM_IDT_89HPESX=3Dy
> >># CONFIG_CB710_CORE is not set
> >>
> >>#
> >># Texas Instruments shared transport line discipline
> >>#
> >># CONFIG_TI_ST is not set
> >>CONFIG_SENSORS_LIS3_I2C=3Dy
> >>
> >>#
> >># Altera FPGA firmware download module
> >>#
> >># CONFIG_ALTERA_STAPL is not set
> >>CONFIG_INTEL_MEI=3Dy
> >>CONFIG_INTEL_MEI_ME=3Dy
> >>CONFIG_INTEL_MEI_TXE=3Dy
> >># CONFIG_VMWARE_VMCI is not set
> >>
> >>#
> >># Intel MIC Bus Driver
> >>#
> >>CONFIG_INTEL_MIC_BUS=3Dy
> >>
> >>#
> >># SCIF Bus Driver
> >>#
> >>CONFIG_SCIF_BUS=3Dy
> >>
> >>#
> >># VOP Bus Driver
> >>#
> >>CONFIG_VOP_BUS=3Dy
> >>
> >>#
> >># Intel MIC Host Driver
> >>#
> >>
> >>#
> >># Intel MIC Card Driver
> >>#
> >>
> >>#
> >># SCIF Driver
> >>#
> >># CONFIG_SCIF is not set
> >>
> >>#
> >># Intel MIC Coprocessor State Management (COSM) Drivers
> >>#
> >>
> >>#
> >># VOP Driver
> >>#
> >>CONFIG_VOP=3Dy
> >>CONFIG_VHOST_RING=3Dy
> >>CONFIG_GENWQE=3Dy
> >>CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=3D0
> >># CONFIG_ECHO is not set
> >># CONFIG_CXL_BASE is not set
> >># CONFIG_CXL_AFU_DRIVER_OPS is not set
> >>CONFIG_HAVE_IDE=3Dy
> >>
> >>#
> >># SCSI device support
> >>#
> >>CONFIG_SCSI_MOD=3Dy
> >># CONFIG_SCSI_DMA is not set
> >># CONFIG_SCSI_NETLINK is not set
> >># CONFIG_FUSION is not set
> >>
> >>#
> >># IEEE 1394 (FireWire) support
> >>#
> >># CONFIG_FIREWIRE is not set
> >>CONFIG_FIREWIRE_NOSY=3Dy
> >># CONFIG_MACINTOSH_DRIVERS is not set
> >># CONFIG_NETDEVICES is not set
> >>
> >>#
> >># Input device support
> >>#
> >>CONFIG_INPUT=3Dy
> >># CONFIG_INPUT_LEDS is not set
> >>CONFIG_INPUT_FF_MEMLESS=3Dy
> >>CONFIG_INPUT_POLLDEV=3Dy
> >>CONFIG_INPUT_SPARSEKMAP=3Dy
> >># CONFIG_INPUT_MATRIXKMAP is not set
> >>
> >>#
> >># Userland interfaces
> >>#
> >>CONFIG_INPUT_MOUSEDEV=3Dy
> >>CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> >>CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> >>CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> >>CONFIG_INPUT_JOYDEV=3Dy
> >># CONFIG_INPUT_EVDEV is not set
> >>CONFIG_INPUT_EVBUG=3Dy
> >>
> >>#
> >># Input Device Drivers
> >>#
> >>CONFIG_INPUT_KEYBOARD=3Dy
> >># CONFIG_KEYBOARD_ADC is not set
> >># CONFIG_KEYBOARD_ADP5520 is not set
> >># CONFIG_KEYBOARD_ADP5588 is not set
> >># CONFIG_KEYBOARD_ADP5589 is not set
> >>CONFIG_KEYBOARD_ATKBD=3Dy
> >># CONFIG_KEYBOARD_QT1070 is not set
> >># CONFIG_KEYBOARD_QT2160 is not set
> >># CONFIG_KEYBOARD_LKKBD is not set
> >># CONFIG_KEYBOARD_GPIO is not set
> >># CONFIG_KEYBOARD_GPIO_POLLED is not set
> >># CONFIG_KEYBOARD_TCA6416 is not set
> >># CONFIG_KEYBOARD_TCA8418 is not set
> >># CONFIG_KEYBOARD_MATRIX is not set
> >># CONFIG_KEYBOARD_LM8323 is not set
> >># CONFIG_KEYBOARD_LM8333 is not set
> >># CONFIG_KEYBOARD_MAX7359 is not set
> >># CONFIG_KEYBOARD_MCS is not set
> >># CONFIG_KEYBOARD_MPR121 is not set
> >># CONFIG_KEYBOARD_NEWTON is not set
> >># CONFIG_KEYBOARD_OPENCORES is not set
> >># CONFIG_KEYBOARD_SAMSUNG is not set
> >># CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> >># CONFIG_KEYBOARD_STOWAWAY is not set
> >># CONFIG_KEYBOARD_SUNKBD is not set
> >># CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> >># CONFIG_KEYBOARD_TWL4030 is not set
> >># CONFIG_KEYBOARD_XTKBD is not set
> >># CONFIG_KEYBOARD_CROS_EC is not set
> >># CONFIG_INPUT_MOUSE is not set
> >># CONFIG_INPUT_JOYSTICK is not set
> >>CONFIG_INPUT_TABLET=3Dy
> >># CONFIG_TABLET_USB_ACECAD is not set
> >># CONFIG_TABLET_USB_AIPTEK is not set
> >># CONFIG_TABLET_USB_HANWANG is not set
> >># CONFIG_TABLET_USB_KBTAB is not set
> >># CONFIG_TABLET_USB_PEGASUS is not set
> >>CONFIG_TABLET_SERIAL_WACOM4=3Dy
> >># CONFIG_INPUT_TOUCHSCREEN is not set
> >>CONFIG_INPUT_MISC=3Dy
> >>CONFIG_INPUT_88PM860X_ONKEY=3Dy
> >>CONFIG_INPUT_88PM80X_ONKEY=3Dy
> >># CONFIG_INPUT_AD714X is not set
> >>CONFIG_INPUT_BMA150=3Dy
> >># CONFIG_INPUT_E3X0_BUTTON is not set
> >>CONFIG_INPUT_PCSPKR=3Dy
> >>CONFIG_INPUT_MAX77693_HAPTIC=3Dy
> >>CONFIG_INPUT_MC13783_PWRBUTTON=3Dy
> >># CONFIG_INPUT_MMA8450 is not set
> >>CONFIG_INPUT_APANEL=3Dy
> >>CONFIG_INPUT_GP2A=3Dy
> >>CONFIG_INPUT_GPIO_BEEPER=3Dy
> >>CONFIG_INPUT_GPIO_TILT_POLLED=3Dy
> >>CONFIG_INPUT_GPIO_DECODER=3Dy
> >># CONFIG_INPUT_ATLAS_BTNS is not set
> >># CONFIG_INPUT_ATI_REMOTE2 is not set
> >># CONFIG_INPUT_KEYSPAN_REMOTE is not set
> >>CONFIG_INPUT_KXTJ9=3Dy
> >>CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
> >># CONFIG_INPUT_POWERMATE is not set
> >># CONFIG_INPUT_YEALINK is not set
> >># CONFIG_INPUT_CM109 is not set
> >>CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> >># CONFIG_INPUT_RETU_PWRBUTTON is not set
> >>CONFIG_INPUT_TPS65218_PWRBUTTON=3Dy
> >># CONFIG_INPUT_AXP20X_PEK is not set
> >>CONFIG_INPUT_TWL4030_PWRBUTTON=3Dy
> >># CONFIG_INPUT_TWL4030_VIBRA is not set
> >># CONFIG_INPUT_TWL6040_VIBRA is not set
> >># CONFIG_INPUT_UINPUT is not set
> >>CONFIG_INPUT_PCF50633_PMU=3Dy
> >>CONFIG_INPUT_PCF8574=3Dy
> >># CONFIG_INPUT_PWM_BEEPER is not set
> >># CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
> >># CONFIG_INPUT_DA9052_ONKEY is not set
> >>CONFIG_INPUT_DA9055_ONKEY=3Dy
> >># CONFIG_INPUT_DA9063_ONKEY is not set
> >>CONFIG_INPUT_ADXL34X=3Dy
> >># CONFIG_INPUT_ADXL34X_I2C is not set
> >># CONFIG_INPUT_ADXL34X_SPI is not set
> >>CONFIG_INPUT_CMA3000=3Dy
> >>CONFIG_INPUT_CMA3000_I2C=3Dy
> >># CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> >># CONFIG_INPUT_DRV260X_HAPTICS is not set
> >>CONFIG_INPUT_DRV2665_HAPTICS=3Dy
> >>CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> >>CONFIG_RMI4_CORE=3Dy
> >># CONFIG_RMI4_I2C is not set
> >>CONFIG_RMI4_SPI=3Dy
> >># CONFIG_RMI4_SMB is not set
> >>CONFIG_RMI4_F03=3Dy
> >>CONFIG_RMI4_F03_SERIO=3Dy
> >>CONFIG_RMI4_2D_SENSOR=3Dy
> >>CONFIG_RMI4_F11=3Dy
> >>CONFIG_RMI4_F12=3Dy
> >># CONFIG_RMI4_F30 is not set
> >>CONFIG_RMI4_F34=3Dy
> >># CONFIG_RMI4_F54 is not set
> >># CONFIG_RMI4_F55 is not set
> >>
> >>#
> >># Hardware I/O ports
> >>#
> >>CONFIG_SERIO=3Dy
> >>CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> >>CONFIG_SERIO_I8042=3Dy
> >>CONFIG_SERIO_SERPORT=3Dy
> >>CONFIG_SERIO_CT82C710=3Dy
> >>CONFIG_SERIO_PARKBD=3Dy
> >># CONFIG_SERIO_PCIPS2 is not set
> >>CONFIG_SERIO_LIBPS2=3Dy
> >>CONFIG_SERIO_RAW=3Dy
> >># CONFIG_SERIO_ALTERA_PS2 is not set
> >>CONFIG_SERIO_PS2MULT=3Dy
> >># CONFIG_SERIO_ARC_PS2 is not set
> >>CONFIG_USERIO=3Dy
> >># CONFIG_GAMEPORT is not set
> >>
> >>#
> >># Character devices
> >>#
> >>CONFIG_TTY=3Dy
> >># CONFIG_VT is not set
> >>CONFIG_UNIX98_PTYS=3Dy
> >>CONFIG_LEGACY_PTYS=3Dy
> >>CONFIG_LEGACY_PTY_COUNT=3D256
> >>CONFIG_SERIAL_NONSTANDARD=3Dy
> >>CONFIG_ROCKETPORT=3Dy
> >>CONFIG_CYCLADES=3Dy
> >># CONFIG_CYZ_INTR is not set
> >># CONFIG_MOXA_INTELLIO is not set
> >># CONFIG_MOXA_SMARTIO is not set
> >>CONFIG_SYNCLINKMP=3Dy
> >>CONFIG_SYNCLINK_GT=3Dy
> >>CONFIG_NOZOMI=3Dy
> >>CONFIG_ISI=3Dy
> >># CONFIG_N_HDLC is not set
> >># CONFIG_N_GSM is not set
> >># CONFIG_TRACE_ROUTER is not set
> >>CONFIG_TRACE_SINK=3Dy
> >>CONFIG_GOLDFISH_TTY=3Dy
> >># CONFIG_DEVMEM is not set
> >>CONFIG_DEVKMEM=3Dy
> >>
> >>#
> >># Serial drivers
> >>#
> >>CONFIG_SERIAL_EARLYCON=3Dy
> >>CONFIG_SERIAL_8250=3Dy
> >># CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> >># CONFIG_SERIAL_8250_PNP is not set
> >># CONFIG_SERIAL_8250_FINTEK is not set
> >>CONFIG_SERIAL_8250_CONSOLE=3Dy
> >># CONFIG_SERIAL_8250_PCI is not set
> >># CONFIG_SERIAL_8250_CS is not set
> >>CONFIG_SERIAL_8250_NR_UARTS=3D4
> >>CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> >>CONFIG_SERIAL_8250_EXTENDED=3Dy
> >>CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> >>CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> >># CONFIG_SERIAL_8250_DETECT_IRQ is not set
> >>CONFIG_SERIAL_8250_RSA=3Dy
> >># CONFIG_SERIAL_8250_FSL is not set
> >>CONFIG_SERIAL_8250_DW=3Dy
> >>CONFIG_SERIAL_8250_RT288X=3Dy
> >># CONFIG_SERIAL_8250_LPSS is not set
> >>CONFIG_SERIAL_8250_MID=3Dy
> >>CONFIG_SERIAL_8250_MOXA=3Dy
> >>
> >>#
> >># Non-8250 serial port support
> >>#
> >>CONFIG_SERIAL_MAX3100=3Dy
> >>CONFIG_SERIAL_MAX310X=3Dy
> >>CONFIG_SERIAL_UARTLITE=3Dy
> >># CONFIG_SERIAL_UARTLITE_CONSOLE is not set
> >>CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
> >>CONFIG_SERIAL_CORE=3Dy
> >>CONFIG_SERIAL_CORE_CONSOLE=3Dy
> >>CONFIG_SERIAL_JSM=3Dy
> >>CONFIG_SERIAL_SCCNXP=3Dy
> >># CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> >>CONFIG_SERIAL_SC16IS7XX_CORE=3Dy
> >>CONFIG_SERIAL_SC16IS7XX=3Dy
> >>CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
> >># CONFIG_SERIAL_SC16IS7XX_SPI is not set
> >>CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> >># CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> >>CONFIG_SERIAL_ALTERA_UART=3Dy
> >>CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> >>CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> >>CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> >>CONFIG_SERIAL_IFX6X60=3Dy
> >>CONFIG_SERIAL_ARC=3Dy
> >>CONFIG_SERIAL_ARC_CONSOLE=3Dy
> >>CONFIG_SERIAL_ARC_NR_PORTS=3D1
> >>CONFIG_SERIAL_RP2=3Dy
> >>CONFIG_SERIAL_RP2_NR_UARTS=3D32
> >>CONFIG_SERIAL_FSL_LPUART=3Dy
> >># CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> >>CONFIG_SERIAL_MEN_Z135=3Dy
> >>CONFIG_SERIAL_DEV_BUS=3Dy
> >># CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> >>CONFIG_TTY_PRINTK=3Dy
> >># CONFIG_PRINTER is not set
> >># CONFIG_PPDEV is not set
> >>CONFIG_HVC_DRIVER=3Dy
> >>CONFIG_VIRTIO_CONSOLE=3Dy
> >>CONFIG_IPMI_HANDLER=3Dy
> >># CONFIG_IPMI_PANIC_EVENT is not set
> >>CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> >>CONFIG_IPMI_SI=3Dy
> >># CONFIG_IPMI_SSIF is not set
> >>CONFIG_IPMI_WATCHDOG=3Dy
> >># CONFIG_IPMI_POWEROFF is not set
> >>CONFIG_HW_RANDOM=3Dy
> >>CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> >>CONFIG_HW_RANDOM_INTEL=3Dy
> >>CONFIG_HW_RANDOM_AMD=3Dy
> >># CONFIG_HW_RANDOM_VIA is not set
> >>CONFIG_HW_RANDOM_VIRTIO=3Dy
> >>CONFIG_HW_RANDOM_TPM=3Dy
> >>CONFIG_NVRAM=3Dy
> >># CONFIG_R3964 is not set
> >># CONFIG_APPLICOM is not set
> >>
> >>#
> >># PCMCIA character devices
> >>#
> >>CONFIG_SYNCLINK_CS=3Dy
> >>CONFIG_CARDMAN_4000=3Dy
> >>CONFIG_CARDMAN_4040=3Dy
> >>CONFIG_SCR24X=3Dy
> >># CONFIG_MWAVE is not set
> >># CONFIG_HPET is not set
> >>CONFIG_HANGCHECK_TIMER=3Dy
> >>CONFIG_TCG_TPM=3Dy
> >># CONFIG_TCG_TIS is not set
> >># CONFIG_TCG_TIS_SPI is not set
> >>CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> >>CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> >>CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> >>CONFIG_TCG_NSC=3Dy
> >># CONFIG_TCG_ATMEL is not set
> >>CONFIG_TCG_INFINEON=3Dy
> >>CONFIG_TCG_CRB=3Dy
> >>CONFIG_TCG_VTPM_PROXY=3Dy
> >>CONFIG_TCG_TIS_ST33ZP24=3Dy
> >>CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> >>CONFIG_TCG_TIS_ST33ZP24_SPI=3Dy
> >># CONFIG_TELCLOCK is not set
> >>CONFIG_DEVPORT=3Dy
> >># CONFIG_XILLYBUS is not set
> >>
> >>#
> >># I2C support
> >>#
> >>CONFIG_I2C=3Dy
> >>CONFIG_ACPI_I2C_OPREGION=3Dy
> >>CONFIG_I2C_BOARDINFO=3Dy
> >>CONFIG_I2C_COMPAT=3Dy
> >># CONFIG_I2C_CHARDEV is not set
> >>CONFIG_I2C_MUX=3Dy
> >>
> >>#
> >># Multiplexer I2C Chip support
> >>#
> >># CONFIG_I2C_MUX_GPIO is not set
> >>CONFIG_I2C_MUX_LTC4306=3Dy
> >>CONFIG_I2C_MUX_PCA9541=3Dy
> >>CONFIG_I2C_MUX_PCA954x=3Dy
> >>CONFIG_I2C_MUX_REG=3Dy
> >># CONFIG_I2C_MUX_MLXCPLD is not set
> >># CONFIG_I2C_HELPER_AUTO is not set
> >>CONFIG_I2C_SMBUS=3Dy
> >>
> >>#
> >># I2C Algorithms
> >>#
> >>CONFIG_I2C_ALGOBIT=3Dy
> >>CONFIG_I2C_ALGOPCF=3Dy
> >>CONFIG_I2C_ALGOPCA=3Dy
> >>
> >>#
> >># I2C Hardware Bus support
> >>#
> >>
> >>#
> >># PC SMBus host controller drivers
> >>#
> >>CONFIG_I2C_ALI1535=3Dy
> >>CONFIG_I2C_ALI1563=3Dy
> >>CONFIG_I2C_ALI15X3=3Dy
> >>CONFIG_I2C_AMD756=3Dy
> >>CONFIG_I2C_AMD756_S4882=3Dy
> >># CONFIG_I2C_AMD8111 is not set
> >># CONFIG_I2C_I801 is not set
> >>CONFIG_I2C_ISCH=3Dy
> >>CONFIG_I2C_ISMT=3Dy
> >>CONFIG_I2C_PIIX4=3Dy
> >># CONFIG_I2C_NFORCE2 is not set
> >># CONFIG_I2C_SIS5595 is not set
> >># CONFIG_I2C_SIS630 is not set
> >>CONFIG_I2C_SIS96X=3Dy
> >># CONFIG_I2C_VIA is not set
> >>CONFIG_I2C_VIAPRO=3Dy
> >>
> >>#
> >># ACPI drivers
> >>#
> >>CONFIG_I2C_SCMI=3Dy
> >>
> >>#
> >># I2C system bus drivers (mostly embedded / system-on-chip)
> >>#
> >>CONFIG_I2C_CBUS_GPIO=3Dy
> >>CONFIG_I2C_DESIGNWARE_CORE=3Dy
> >>CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> >># CONFIG_I2C_DESIGNWARE_PCI is not set
> >># CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> >>CONFIG_I2C_EMEV2=3Dy
> >># CONFIG_I2C_GPIO is not set
> >>CONFIG_I2C_KEMPLD=3Dy
> >>CONFIG_I2C_OCORES=3Dy
> >>CONFIG_I2C_PCA_PLATFORM=3Dy
> >># CONFIG_I2C_PXA_PCI is not set
> >>CONFIG_I2C_SIMTEC=3Dy
> >>CONFIG_I2C_XILINX=3Dy
> >>
> >>#
> >># External I2C/SMBus adapter drivers
> >>#
> >>CONFIG_I2C_PARPORT=3Dy
> >>CONFIG_I2C_PARPORT_LIGHT=3Dy
> >># CONFIG_I2C_TAOS_EVM is not set
> >>
> >>#
> >># Other I2C/SMBus bus drivers
> >>#
> >>CONFIG_I2C_MLXCPLD=3Dy
> >>CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> >>CONFIG_I2C_SLAVE=3Dy
> >>CONFIG_I2C_SLAVE_EEPROM=3Dy
> >># CONFIG_I2C_DEBUG_CORE is not set
> >># CONFIG_I2C_DEBUG_ALGO is not set
> >># CONFIG_I2C_DEBUG_BUS is not set
> >>CONFIG_SPI=3Dy
> >># CONFIG_SPI_DEBUG is not set
> >>CONFIG_SPI_MASTER=3Dy
> >>
> >>#
> >># SPI Master Controller Drivers
> >>#
> >>CONFIG_SPI_ALTERA=3Dy
> >>CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> >>CONFIG_SPI_BITBANG=3Dy
> >>CONFIG_SPI_BUTTERFLY=3Dy
> >>CONFIG_SPI_CADENCE=3Dy
> >>CONFIG_SPI_DESIGNWARE=3Dy
> >># CONFIG_SPI_DW_PCI is not set
> >>CONFIG_SPI_DW_MMIO=3Dy
> >>CONFIG_SPI_GPIO=3Dy
> >>CONFIG_SPI_LM70_LLP=3Dy
> >># CONFIG_SPI_OC_TINY is not set
> >>CONFIG_SPI_PXA2XX=3Dy
> >>CONFIG_SPI_PXA2XX_PCI=3Dy
> >>CONFIG_SPI_ROCKCHIP=3Dy
> >>CONFIG_SPI_SC18IS602=3Dy
> >>CONFIG_SPI_XCOMM=3Dy
> >># CONFIG_SPI_XILINX is not set
> >># CONFIG_SPI_ZYNQMP_GQSPI is not set
> >>
> >>#
> >># SPI Protocol Masters
> >>#
> >>CONFIG_SPI_SPIDEV=3Dy
> >>CONFIG_SPI_TLE62X0=3Dy
> >># CONFIG_SPMI is not set
> >>CONFIG_HSI=3Dy
> >>CONFIG_HSI_BOARDINFO=3Dy
> >>
> >>#
> >># HSI controllers
> >>#
> >>
> >>#
> >># HSI clients
> >>#
> >># CONFIG_HSI_CHAR is not set
> >>
> >>#
> >># PPS support
> >>#
> >>CONFIG_PPS=3Dy
> >># CONFIG_PPS_DEBUG is not set
> >>CONFIG_NTP_PPS=3Dy
> >>
> >>#
> >># PPS clients support
> >>#
> >># CONFIG_PPS_CLIENT_KTIMER is not set
> >># CONFIG_PPS_CLIENT_LDISC is not set
> >># CONFIG_PPS_CLIENT_PARPORT is not set
> >># CONFIG_PPS_CLIENT_GPIO is not set
> >>
> >>#
> >># PPS generators support
> >>#
> >>
> >>#
> >># PTP clock support
> >>#
> >># CONFIG_PTP_1588_CLOCK is not set
> >>
> >>#
> >># Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
> >>#
> >>CONFIG_GPIOLIB=3Dy
> >>CONFIG_GPIO_ACPI=3Dy
> >>CONFIG_GPIOLIB_IRQCHIP=3Dy
> >>CONFIG_DEBUG_GPIO=3Dy
> >>CONFIG_GPIO_SYSFS=3Dy
> >>CONFIG_GPIO_GENERIC=3Dy
> >>CONFIG_GPIO_MAX730X=3Dy
> >>
> >>#
> >># Memory mapped GPIO drivers
> >>#
> >>CONFIG_GPIO_AMDPT=3Dy
> >>CONFIG_GPIO_AXP209=3Dy
> >># CONFIG_GPIO_DWAPB is not set
> >>CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> >>CONFIG_GPIO_ICH=3Dy
> >>CONFIG_GPIO_LYNXPOINT=3Dy
> >>CONFIG_GPIO_MENZ127=3Dy
> >># CONFIG_GPIO_MOCKUP is not set
> >>CONFIG_GPIO_VX855=3Dy
> >>
> >>#
> >># Port-mapped I/O GPIO drivers
> >>#
> >>CONFIG_GPIO_F7188X=3Dy
> >>CONFIG_GPIO_IT87=3Dy
> >># CONFIG_GPIO_SCH is not set
> >>CONFIG_GPIO_SCH311X=3Dy
> >>
> >>#
> >># I2C GPIO expanders
> >>#
> >># CONFIG_GPIO_ADP5588 is not set
> >>CONFIG_GPIO_MAX7300=3Dy
> >>CONFIG_GPIO_MAX732X=3Dy
> >>CONFIG_GPIO_MAX732X_IRQ=3Dy
> >># CONFIG_GPIO_PCA953X is not set
> >>CONFIG_GPIO_PCF857X=3Dy
> >># CONFIG_GPIO_TPIC2810 is not set
> >>
> >>#
> >># MFD GPIO expanders
> >>#
> >>CONFIG_GPIO_ADP5520=3Dy
> >>CONFIG_GPIO_ARIZONA=3Dy
> >># CONFIG_GPIO_DA9052 is not set
> >>CONFIG_GPIO_DA9055=3Dy
> >>CONFIG_GPIO_JANZ_TTL=3Dy
> >># CONFIG_GPIO_KEMPLD is not set
> >># CONFIG_GPIO_LP873X is not set
> >>CONFIG_GPIO_RC5T583=3Dy
> >># CONFIG_GPIO_TPS65218 is not set
> >># CONFIG_GPIO_TPS65912 is not set
> >>CONFIG_GPIO_TWL4030=3Dy
> >>CONFIG_GPIO_TWL6040=3Dy
> >>CONFIG_GPIO_WM8350=3Dy
> >># CONFIG_GPIO_WM8994 is not set
> >>
> >>#
> >># PCI GPIO expanders
> >>#
> >>CONFIG_GPIO_AMD8111=3Dy
> >># CONFIG_GPIO_BT8XX is not set
> >># CONFIG_GPIO_ML_IOH is not set
> >>CONFIG_GPIO_PCI_IDIO_16=3Dy
> >>CONFIG_GPIO_RDC321X=3Dy
> >>
> >>#
> >># SPI GPIO expanders
> >>#
> >>CONFIG_GPIO_MAX7301=3Dy
> >># CONFIG_GPIO_MC33880 is not set
> >># CONFIG_GPIO_PISOSR is not set
> >>
> >>#
> >># SPI or I2C GPIO expanders
> >>#
> >>CONFIG_W1=3Dy
> >>
> >>#
> >># 1-wire Bus Masters
> >>#
> >>CONFIG_W1_MASTER_MATROX=3Dy
> >># CONFIG_W1_MASTER_DS2482 is not set
> >># CONFIG_W1_MASTER_DS1WM is not set
> >># CONFIG_W1_MASTER_GPIO is not set
> >>
> >>#
> >># 1-wire Slaves
> >>#
> >>CONFIG_W1_SLAVE_THERM=3Dy
> >># CONFIG_W1_SLAVE_SMEM is not set
> >># CONFIG_W1_SLAVE_DS2405 is not set
> >># CONFIG_W1_SLAVE_DS2408 is not set
> >>CONFIG_W1_SLAVE_DS2413=3Dy
> >># CONFIG_W1_SLAVE_DS2406 is not set
> >># CONFIG_W1_SLAVE_DS2423 is not set
> >># CONFIG_W1_SLAVE_DS2431 is not set
> >>CONFIG_W1_SLAVE_DS2433=3Dy
> >>CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> >>CONFIG_W1_SLAVE_DS2438=3Dy
> >>CONFIG_W1_SLAVE_DS2760=3Dy
> >>CONFIG_W1_SLAVE_DS2780=3Dy
> >>CONFIG_W1_SLAVE_DS2781=3Dy
> >>CONFIG_W1_SLAVE_DS28E04=3Dy
> >># CONFIG_W1_SLAVE_BQ27000 is not set
> >>CONFIG_POWER_AVS=3Dy
> >>CONFIG_POWER_RESET=3Dy
> >>CONFIG_POWER_RESET_RESTART=3Dy
> >>CONFIG_POWER_SUPPLY=3Dy
> >># CONFIG_POWER_SUPPLY_DEBUG is not set
> >># CONFIG_PDA_POWER is not set
> >>CONFIG_GENERIC_ADC_BATTERY=3Dy
> >>CONFIG_WM8350_POWER=3Dy
> >># CONFIG_TEST_POWER is not set
> >>CONFIG_BATTERY_88PM860X=3Dy
> >>CONFIG_BATTERY_DS2760=3Dy
> >># CONFIG_BATTERY_DS2780 is not set
> >># CONFIG_BATTERY_DS2781 is not set
> >># CONFIG_BATTERY_DS2782 is not set
> >>CONFIG_BATTERY_SBS=3Dy
> >>CONFIG_CHARGER_SBS=3Dy
> >>CONFIG_BATTERY_BQ27XXX=3Dy
> >># CONFIG_BATTERY_BQ27XXX_I2C is not set
> >>CONFIG_BATTERY_DA9030=3Dy
> >>CONFIG_BATTERY_DA9052=3Dy
> >># CONFIG_CHARGER_DA9150 is not set
> >>CONFIG_BATTERY_DA9150=3Dy
> >># CONFIG_CHARGER_AXP20X is not set
> >>CONFIG_BATTERY_AXP20X=3Dy
> >>CONFIG_AXP20X_POWER=3Dy
> >>CONFIG_AXP288_FUEL_GAUGE=3Dy
> >>CONFIG_BATTERY_MAX17040=3Dy
> >>CONFIG_BATTERY_MAX17042=3Dy
> >>CONFIG_BATTERY_TWL4030_MADC=3Dy
> >>CONFIG_CHARGER_88PM860X=3Dy
> >>CONFIG_CHARGER_PCF50633=3Dy
> >>CONFIG_BATTERY_RX51=3Dy
> >>CONFIG_CHARGER_MAX8903=3Dy
> >>CONFIG_CHARGER_TWL4030=3Dy
> >>CONFIG_CHARGER_LP8727=3Dy
> >>CONFIG_CHARGER_GPIO=3Dy
> >>CONFIG_CHARGER_MANAGER=3Dy
> >>CONFIG_CHARGER_MAX77693=3Dy
> >># CONFIG_CHARGER_BQ2415X is not set
> >>CONFIG_CHARGER_BQ24190=3Dy
> >># CONFIG_CHARGER_BQ24257 is not set
> >># CONFIG_CHARGER_BQ24735 is not set
> >>CONFIG_CHARGER_BQ25890=3Dy
> >>CONFIG_CHARGER_SMB347=3Dy
> >>CONFIG_CHARGER_TPS65217=3Dy
> >>CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> >>CONFIG_BATTERY_GOLDFISH=3Dy
> >>CONFIG_BATTERY_RT5033=3Dy
> >>CONFIG_CHARGER_RT9455=3Dy
> >>CONFIG_HWMON=3Dy
> >>CONFIG_HWMON_VID=3Dy
> >># CONFIG_HWMON_DEBUG_CHIP is not set
> >>
> >>#
> >># Native drivers
> >>#
> >>CONFIG_SENSORS_ABITUGURU=3Dy
> >>CONFIG_SENSORS_ABITUGURU3=3Dy
> >>CONFIG_SENSORS_AD7314=3Dy
> >># CONFIG_SENSORS_AD7414 is not set
> >># CONFIG_SENSORS_AD7418 is not set
> >>CONFIG_SENSORS_ADM1021=3Dy
> >># CONFIG_SENSORS_ADM1025 is not set
> >># CONFIG_SENSORS_ADM1026 is not set
> >># CONFIG_SENSORS_ADM1029 is not set
> >>CONFIG_SENSORS_ADM1031=3Dy
> >>CONFIG_SENSORS_ADM9240=3Dy
> >>CONFIG_SENSORS_ADT7X10=3Dy
> >>CONFIG_SENSORS_ADT7310=3Dy
> >>CONFIG_SENSORS_ADT7410=3Dy
> >>CONFIG_SENSORS_ADT7411=3Dy
> >>CONFIG_SENSORS_ADT7462=3Dy
> >># CONFIG_SENSORS_ADT7470 is not set
> >># CONFIG_SENSORS_ADT7475 is not set
> >># CONFIG_SENSORS_ASC7621 is not set
> >>CONFIG_SENSORS_K8TEMP=3Dy
> >>CONFIG_SENSORS_K10TEMP=3Dy
> >>CONFIG_SENSORS_FAM15H_POWER=3Dy
> >># CONFIG_SENSORS_APPLESMC is not set
> >>CONFIG_SENSORS_ASB100=3Dy
> >>CONFIG_SENSORS_ASPEED=3Dy
> >># CONFIG_SENSORS_ATXP1 is not set
> >># CONFIG_SENSORS_DS620 is not set
> >># CONFIG_SENSORS_DS1621 is not set
> >>CONFIG_SENSORS_DELL_SMM=3Dy
> >># CONFIG_SENSORS_DA9052_ADC is not set
> >>CONFIG_SENSORS_DA9055=3Dy
> >># CONFIG_SENSORS_I5K_AMB is not set
> >>CONFIG_SENSORS_F71805F=3Dy
> >>CONFIG_SENSORS_F71882FG=3Dy
> >>CONFIG_SENSORS_F75375S=3Dy
> >># CONFIG_SENSORS_MC13783_ADC is not set
> >>CONFIG_SENSORS_FSCHMD=3Dy
> >>CONFIG_SENSORS_GL518SM=3Dy
> >>CONFIG_SENSORS_GL520SM=3Dy
> >># CONFIG_SENSORS_G760A is not set
> >>CONFIG_SENSORS_G762=3Dy
> >># CONFIG_SENSORS_GPIO_FAN is not set
> >>CONFIG_SENSORS_HIH6130=3Dy
> >>CONFIG_SENSORS_IBMAEM=3Dy
> >>CONFIG_SENSORS_IBMPEX=3Dy
> >># CONFIG_SENSORS_IIO_HWMON is not set
> >>CONFIG_SENSORS_I5500=3Dy
> >>CONFIG_SENSORS_CORETEMP=3Dy
> >>CONFIG_SENSORS_IT87=3Dy
> >>CONFIG_SENSORS_JC42=3Dy
> >>CONFIG_SENSORS_POWR1220=3Dy
> >>CONFIG_SENSORS_LINEAGE=3Dy
> >>CONFIG_SENSORS_LTC2945=3Dy
> >>CONFIG_SENSORS_LTC2990=3Dy
> >>CONFIG_SENSORS_LTC4151=3Dy
> >># CONFIG_SENSORS_LTC4215 is not set
> >>CONFIG_SENSORS_LTC4222=3Dy
> >>CONFIG_SENSORS_LTC4245=3Dy
> >># CONFIG_SENSORS_LTC4260 is not set
> >>CONFIG_SENSORS_LTC4261=3Dy
> >>CONFIG_SENSORS_MAX1111=3Dy
> >>CONFIG_SENSORS_MAX16065=3Dy
> >>CONFIG_SENSORS_MAX1619=3Dy
> >>CONFIG_SENSORS_MAX1668=3Dy
> >># CONFIG_SENSORS_MAX197 is not set
> >># CONFIG_SENSORS_MAX31722 is not set
> >># CONFIG_SENSORS_MAX6639 is not set
> >>CONFIG_SENSORS_MAX6642=3Dy
> >>CONFIG_SENSORS_MAX6650=3Dy
> >>CONFIG_SENSORS_MAX6697=3Dy
> >>CONFIG_SENSORS_MAX31790=3Dy
> >># CONFIG_SENSORS_MCP3021 is not set
> >># CONFIG_SENSORS_TC654 is not set
> >>CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> >>CONFIG_SENSORS_ADCXX=3Dy
> >>CONFIG_SENSORS_LM63=3Dy
> >>CONFIG_SENSORS_LM70=3Dy
> >>CONFIG_SENSORS_LM73=3Dy
> >># CONFIG_SENSORS_LM75 is not set
> >>CONFIG_SENSORS_LM77=3Dy
> >># CONFIG_SENSORS_LM78 is not set
> >>CONFIG_SENSORS_LM80=3Dy
> >># CONFIG_SENSORS_LM83 is not set
> >>CONFIG_SENSORS_LM85=3Dy
> >>CONFIG_SENSORS_LM87=3Dy
> >>CONFIG_SENSORS_LM90=3Dy
> >># CONFIG_SENSORS_LM92 is not set
> >>CONFIG_SENSORS_LM93=3Dy
> >># CONFIG_SENSORS_LM95234 is not set
> >>CONFIG_SENSORS_LM95241=3Dy
> >>CONFIG_SENSORS_LM95245=3Dy
> >>CONFIG_SENSORS_PC87360=3Dy
> >>CONFIG_SENSORS_PC87427=3Dy
> >>CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> >># CONFIG_SENSORS_NCT6683 is not set
> >># CONFIG_SENSORS_NCT6775 is not set
> >>CONFIG_SENSORS_NCT7802=3Dy
> >>CONFIG_SENSORS_NCT7904=3Dy
> >>CONFIG_SENSORS_PCF8591=3Dy
> >>CONFIG_PMBUS=3Dy
> >>CONFIG_SENSORS_PMBUS=3Dy
> >># CONFIG_SENSORS_ADM1275 is not set
> >># CONFIG_SENSORS_LM25066 is not set
> >>CONFIG_SENSORS_LTC2978=3Dy
> >>CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> >>CONFIG_SENSORS_LTC3815=3Dy
> >>CONFIG_SENSORS_MAX16064=3Dy
> >>CONFIG_SENSORS_MAX20751=3Dy
> >># CONFIG_SENSORS_MAX34440 is not set
> >>CONFIG_SENSORS_MAX8688=3Dy
> >>CONFIG_SENSORS_TPS40422=3Dy
> >># CONFIG_SENSORS_UCD9000 is not set
> >># CONFIG_SENSORS_UCD9200 is not set
> >># CONFIG_SENSORS_ZL6100 is not set
> >>CONFIG_SENSORS_SHT15=3Dy
> >>CONFIG_SENSORS_SHT21=3Dy
> >>CONFIG_SENSORS_SHT3x=3Dy
> >># CONFIG_SENSORS_SHTC1 is not set
> >>CONFIG_SENSORS_SIS5595=3Dy
> >>CONFIG_SENSORS_DME1737=3Dy
> >># CONFIG_SENSORS_EMC1403 is not set
> >>CONFIG_SENSORS_EMC2103=3Dy
> >>CONFIG_SENSORS_EMC6W201=3Dy
> >>CONFIG_SENSORS_SMSC47M1=3Dy
> >>CONFIG_SENSORS_SMSC47M192=3Dy
> >>CONFIG_SENSORS_SMSC47B397=3Dy
> >># CONFIG_SENSORS_SCH56XX_COMMON is not set
> >># CONFIG_SENSORS_STTS751 is not set
> >>CONFIG_SENSORS_SMM665=3Dy
> >>CONFIG_SENSORS_ADC128D818=3Dy
> >>CONFIG_SENSORS_ADS1015=3Dy
> >>CONFIG_SENSORS_ADS7828=3Dy
> >>CONFIG_SENSORS_ADS7871=3Dy
> >>CONFIG_SENSORS_AMC6821=3Dy
> >>CONFIG_SENSORS_INA209=3Dy
> >>CONFIG_SENSORS_INA2XX=3Dy
> >># CONFIG_SENSORS_INA3221 is not set
> >>CONFIG_SENSORS_TC74=3Dy
> >>CONFIG_SENSORS_THMC50=3Dy
> >>CONFIG_SENSORS_TMP102=3Dy
> >>CONFIG_SENSORS_TMP103=3Dy
> >>CONFIG_SENSORS_TMP108=3Dy
> >># CONFIG_SENSORS_TMP401 is not set
> >>CONFIG_SENSORS_TMP421=3Dy
> >>CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> >>CONFIG_SENSORS_VIA686A=3Dy
> >># CONFIG_SENSORS_VT1211 is not set
> >>CONFIG_SENSORS_VT8231=3Dy
> >>CONFIG_SENSORS_W83781D=3Dy
> >># CONFIG_SENSORS_W83791D is not set
> >>CONFIG_SENSORS_W83792D=3Dy
> >>CONFIG_SENSORS_W83793=3Dy
> >>CONFIG_SENSORS_W83795=3Dy
> >>CONFIG_SENSORS_W83795_FANCTRL=3Dy
> >>CONFIG_SENSORS_W83L785TS=3Dy
> >>CONFIG_SENSORS_W83L786NG=3Dy
> >>CONFIG_SENSORS_W83627HF=3Dy
> >>CONFIG_SENSORS_W83627EHF=3Dy
> >>CONFIG_SENSORS_WM8350=3Dy
> >>
> >>#
> >># ACPI drivers
> >>#
> >>CONFIG_SENSORS_ACPI_POWER=3Dy
> >>CONFIG_SENSORS_ATK0110=3Dy
> >>CONFIG_THERMAL=3Dy
> >>CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> >>CONFIG_THERMAL_HWMON=3Dy
> >>CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> >># CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> >># CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> >>CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=3Dy
> >># CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> >># CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> >>CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> >>CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> >>CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> >>CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> >>CONFIG_THERMAL_EMULATION=3Dy
> >>CONFIG_INTEL_POWERCLAMP=3Dy
> >>CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> >>CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> >>
> >>#
> >># ACPI INT340X thermal drivers
> >>#
> >>CONFIG_INT340X_THERMAL=3Dy
> >>CONFIG_ACPI_THERMAL_REL=3Dy
> >># CONFIG_INT3406_THERMAL is not set
> >>CONFIG_INTEL_PCH_THERMAL=3Dy
> >># CONFIG_GENERIC_ADC_THERMAL is not set
> >># CONFIG_WATCHDOG is not set
> >>CONFIG_SSB_POSSIBLE=3Dy
> >>
> >>#
> >># Sonics Silicon Backplane
> >>#
> >>CONFIG_SSB=3Dy
> >>CONFIG_SSB_SPROM=3Dy
> >>CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> >>CONFIG_SSB_PCIHOST=3Dy
> >># CONFIG_SSB_B43_PCI_BRIDGE is not set
> >>CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> >>CONFIG_SSB_PCMCIAHOST=3Dy
> >>CONFIG_SSB_SILENT=3Dy
> >>CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> >># CONFIG_SSB_DRIVER_PCICORE is not set
> >># CONFIG_SSB_DRIVER_GPIO is not set
> >>CONFIG_BCMA_POSSIBLE=3Dy
> >>
> >>#
> >># Broadcom specific AMBA
> >>#
> >>CONFIG_BCMA=3Dy
> >>CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> >># CONFIG_BCMA_HOST_PCI is not set
> >>CONFIG_BCMA_HOST_SOC=3Dy
> >># CONFIG_BCMA_DRIVER_PCI is not set
> >># CONFIG_BCMA_SFLASH is not set
> >>CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> >>CONFIG_BCMA_DRIVER_GPIO=3Dy
> >># CONFIG_BCMA_DEBUG is not set
> >>
> >>#
> >># Multifunction device drivers
> >>#
> >>CONFIG_MFD_CORE=3Dy
> >>CONFIG_MFD_AS3711=3Dy
> >>CONFIG_PMIC_ADP5520=3Dy
> >>CONFIG_MFD_AAT2870_CORE=3Dy
> >>CONFIG_MFD_BCM590XX=3Dy
> >>CONFIG_MFD_AXP20X=3Dy
> >>CONFIG_MFD_AXP20X_I2C=3Dy
> >>CONFIG_MFD_CROS_EC=3Dy
> >>CONFIG_MFD_CROS_EC_I2C=3Dy
> >>CONFIG_MFD_CROS_EC_SPI=3Dy
> >>CONFIG_PMIC_DA903X=3Dy
> >>CONFIG_PMIC_DA9052=3Dy
> >>CONFIG_MFD_DA9052_SPI=3Dy
> >>CONFIG_MFD_DA9052_I2C=3Dy
> >>CONFIG_MFD_DA9055=3Dy
> >>CONFIG_MFD_DA9062=3Dy
> >># CONFIG_MFD_DA9063 is not set
> >>CONFIG_MFD_DA9150=3Dy
> >>CONFIG_MFD_MC13XXX=3Dy
> >>CONFIG_MFD_MC13XXX_SPI=3Dy
> >>CONFIG_MFD_MC13XXX_I2C=3Dy
> >>CONFIG_HTC_PASIC3=3Dy
> >># CONFIG_HTC_I2CPLD is not set
> >># CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> >>CONFIG_LPC_ICH=3Dy
> >>CONFIG_LPC_SCH=3Dy
> >># CONFIG_INTEL_SOC_PMIC is not set
> >># CONFIG_INTEL_SOC_PMIC_BXTWC is not set
> >>CONFIG_MFD_INTEL_LPSS=3Dy
> >># CONFIG_MFD_INTEL_LPSS_ACPI is not set
> >>CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> >>CONFIG_MFD_JANZ_CMODIO=3Dy
> >>CONFIG_MFD_KEMPLD=3Dy
> >>CONFIG_MFD_88PM800=3Dy
> >># CONFIG_MFD_88PM805 is not set
> >>CONFIG_MFD_88PM860X=3Dy
> >># CONFIG_MFD_MAX14577 is not set
> >>CONFIG_MFD_MAX77693=3Dy
> >># CONFIG_MFD_MAX77843 is not set
> >>CONFIG_MFD_MAX8907=3Dy
> >># CONFIG_MFD_MAX8925 is not set
> >># CONFIG_MFD_MAX8997 is not set
> >>CONFIG_MFD_MAX8998=3Dy
> >>CONFIG_MFD_MT6397=3Dy
> >>CONFIG_MFD_MENF21BMC=3Dy
> >># CONFIG_EZX_PCAP is not set
> >>CONFIG_MFD_RETU=3Dy
> >>CONFIG_MFD_PCF50633=3Dy
> >># CONFIG_PCF50633_ADC is not set
> >># CONFIG_PCF50633_GPIO is not set
> >>CONFIG_MFD_RDC321X=3Dy
> >># CONFIG_MFD_RTSX_PCI is not set
> >>CONFIG_MFD_RT5033=3Dy
> >>CONFIG_MFD_RC5T583=3Dy
> >>CONFIG_MFD_SEC_CORE=3Dy
> >>CONFIG_MFD_SI476X_CORE=3Dy
> >>CONFIG_MFD_SM501=3Dy
> >># CONFIG_MFD_SM501_GPIO is not set
> >>CONFIG_MFD_SKY81452=3Dy
> >>CONFIG_MFD_SMSC=3Dy
> >>CONFIG_ABX500_CORE=3Dy
> >>CONFIG_AB3100_CORE=3Dy
> >># CONFIG_AB3100_OTP is not set
> >>CONFIG_MFD_SYSCON=3Dy
> >>CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> >># CONFIG_MFD_LP3943 is not set
> >># CONFIG_MFD_LP8788 is not set
> >>CONFIG_MFD_TI_LMU=3Dy
> >># CONFIG_MFD_PALMAS is not set
> >>CONFIG_TPS6105X=3Dy
> >># CONFIG_TPS65010 is not set
> >>CONFIG_TPS6507X=3Dy
> >># CONFIG_MFD_TPS65086 is not set
> >># CONFIG_MFD_TPS65090 is not set
> >>CONFIG_MFD_TPS65217=3Dy
> >>CONFIG_MFD_TI_LP873X=3Dy
> >>CONFIG_MFD_TPS65218=3Dy
> >># CONFIG_MFD_TPS6586X is not set
> >># CONFIG_MFD_TPS65910 is not set
> >>CONFIG_MFD_TPS65912=3Dy
> >>CONFIG_MFD_TPS65912_I2C=3Dy
> >># CONFIG_MFD_TPS65912_SPI is not set
> >># CONFIG_MFD_TPS80031 is not set
> >>CONFIG_TWL4030_CORE=3Dy
> >>CONFIG_MFD_TWL4030_AUDIO=3Dy
> >>CONFIG_TWL6040_CORE=3Dy
> >># CONFIG_MFD_WL1273_CORE is not set
> >>CONFIG_MFD_LM3533=3Dy
> >># CONFIG_MFD_TMIO is not set
> >>CONFIG_MFD_VX855=3Dy
> >>CONFIG_MFD_ARIZONA=3Dy
> >># CONFIG_MFD_ARIZONA_I2C is not set
> >>CONFIG_MFD_ARIZONA_SPI=3Dy
> >>CONFIG_MFD_CS47L24=3Dy
> >>CONFIG_MFD_WM5102=3Dy
> >>CONFIG_MFD_WM5110=3Dy
> >># CONFIG_MFD_WM8997 is not set
> >>CONFIG_MFD_WM8998=3Dy
> >># CONFIG_MFD_WM8400 is not set
> >># CONFIG_MFD_WM831X_I2C is not set
> >># CONFIG_MFD_WM831X_SPI is not set
> >>CONFIG_MFD_WM8350=3Dy
> >>CONFIG_MFD_WM8350_I2C=3Dy
> >>CONFIG_MFD_WM8994=3Dy
> >>CONFIG_REGULATOR=3Dy
> >># CONFIG_REGULATOR_DEBUG is not set
> >>CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> >>CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> >># CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> >>CONFIG_REGULATOR_88PM800=3Dy
> >>CONFIG_REGULATOR_88PM8607=3Dy
> >>CONFIG_REGULATOR_ACT8865=3Dy
> >>CONFIG_REGULATOR_AD5398=3Dy
> >>CONFIG_REGULATOR_ANATOP=3Dy
> >>CONFIG_REGULATOR_AAT2870=3Dy
> >>CONFIG_REGULATOR_AB3100=3Dy
> >>CONFIG_REGULATOR_AS3711=3Dy
> >>CONFIG_REGULATOR_AXP20X=3Dy
> >># CONFIG_REGULATOR_BCM590XX is not set
> >>CONFIG_REGULATOR_DA903X=3Dy
> >>CONFIG_REGULATOR_DA9052=3Dy
> >>CONFIG_REGULATOR_DA9055=3Dy
> >># CONFIG_REGULATOR_DA9062 is not set
> >># CONFIG_REGULATOR_DA9210 is not set
> >>CONFIG_REGULATOR_DA9211=3Dy
> >>CONFIG_REGULATOR_FAN53555=3Dy
> >>CONFIG_REGULATOR_GPIO=3Dy
> >># CONFIG_REGULATOR_ISL9305 is not set
> >>CONFIG_REGULATOR_ISL6271A=3Dy
> >># CONFIG_REGULATOR_LM363X is not set
> >># CONFIG_REGULATOR_LP3971 is not set
> >>CONFIG_REGULATOR_LP3972=3Dy
> >>CONFIG_REGULATOR_LP872X=3Dy
> >>CONFIG_REGULATOR_LP8755=3Dy
> >>CONFIG_REGULATOR_LTC3589=3Dy
> >>CONFIG_REGULATOR_LTC3676=3Dy
> >>CONFIG_REGULATOR_MAX1586=3Dy
> >>CONFIG_REGULATOR_MAX8649=3Dy
> >>CONFIG_REGULATOR_MAX8660=3Dy
> >>CONFIG_REGULATOR_MAX8907=3Dy
> >>CONFIG_REGULATOR_MAX8952=3Dy
> >># CONFIG_REGULATOR_MAX8998 is not set
> >># CONFIG_REGULATOR_MAX77693 is not set
> >>CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> >># CONFIG_REGULATOR_MC13783 is not set
> >>CONFIG_REGULATOR_MC13892=3Dy
> >>CONFIG_REGULATOR_MT6311=3Dy
> >># CONFIG_REGULATOR_MT6323 is not set
> >># CONFIG_REGULATOR_MT6397 is not set
> >>CONFIG_REGULATOR_PCF50633=3Dy
> >>CONFIG_REGULATOR_PFUZE100=3Dy
> >># CONFIG_REGULATOR_PV88060 is not set
> >># CONFIG_REGULATOR_PV88080 is not set
> >># CONFIG_REGULATOR_PV88090 is not set
> >># CONFIG_REGULATOR_PWM is not set
> >>CONFIG_REGULATOR_RC5T583=3Dy
> >>CONFIG_REGULATOR_RT5033=3Dy
> >># CONFIG_REGULATOR_S2MPA01 is not set
> >>CONFIG_REGULATOR_S2MPS11=3Dy
> >>CONFIG_REGULATOR_S5M8767=3Dy
> >>CONFIG_REGULATOR_SKY81452=3Dy
> >>CONFIG_REGULATOR_TPS51632=3Dy
> >>CONFIG_REGULATOR_TPS6105X=3Dy
> >>CONFIG_REGULATOR_TPS62360=3Dy
> >>CONFIG_REGULATOR_TPS65023=3Dy
> >># CONFIG_REGULATOR_TPS6507X is not set
> >>CONFIG_REGULATOR_TPS65132=3Dy
> >>CONFIG_REGULATOR_TPS65217=3Dy
> >>CONFIG_REGULATOR_TPS6524X=3Dy
> >># CONFIG_REGULATOR_TPS65912 is not set
> >>CONFIG_REGULATOR_TWL4030=3Dy
> >>CONFIG_REGULATOR_WM8350=3Dy
> >>CONFIG_REGULATOR_WM8994=3Dy
> >>CONFIG_MEDIA_SUPPORT=3Dy
> >>
> >>#
> >># Multimedia core support
> >>#
> >>CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> >>CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> >># CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> >>CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> >>CONFIG_MEDIA_SDR_SUPPORT=3Dy
> >># CONFIG_MEDIA_RC_SUPPORT is not set
> >>CONFIG_MEDIA_CEC_SUPPORT=3Dy
> >>CONFIG_CEC_CORE=3Dy
> >># CONFIG_MEDIA_CEC_DEBUG is not set
> >>CONFIG_MEDIA_CONTROLLER=3Dy
> >>CONFIG_VIDEO_DEV=3Dy
> >>CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> >>CONFIG_VIDEO_V4L2=3Dy
> >># CONFIG_VIDEO_ADV_DEBUG is not set
> >># CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> >>CONFIG_VIDEO_PCI_SKELETON=3Dy
> >>CONFIG_V4L2_MEM2MEM_DEV=3Dy
> >>CONFIG_V4L2_FLASH_LED_CLASS=3Dy
> >>CONFIG_VIDEOBUF2_CORE=3Dy
> >>CONFIG_VIDEOBUF2_MEMOPS=3Dy
> >>CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
> >>CONFIG_VIDEOBUF2_VMALLOC=3Dy
> >>CONFIG_VIDEOBUF2_DMA_SG=3Dy
> >># CONFIG_TTPCI_EEPROM is not set
> >>
> >>#
> >># Media drivers
> >>#
> >># CONFIG_MEDIA_PCI_SUPPORT is not set
> >>CONFIG_V4L_PLATFORM_DRIVERS=3Dy
> >>CONFIG_VIDEO_CAFE_CCIC=3Dy
> >># CONFIG_VIDEO_VIA_CAMERA is not set
> >>CONFIG_SOC_CAMERA=3Dy
> >># CONFIG_SOC_CAMERA_PLATFORM is not set
> >>CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> >>CONFIG_VIDEO_SH_VEU=3Dy
> >>CONFIG_V4L_TEST_DRIVERS=3Dy
> >>CONFIG_VIDEO_VIMC=3Dy
> >># CONFIG_VIDEO_VIVID is not set
> >>CONFIG_VIDEO_VIM2M=3Dy
> >># CONFIG_CEC_PLATFORM_DRIVERS is not set
> >>
> >>#
> >># Supported MMC/SDIO adapters
> >>#
> >># CONFIG_RADIO_ADAPTERS is not set
> >>
> >>#
> >># Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> >>#
> >># CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> >>
> >>#
> >># I2C Encoders, decoders, sensors and other helper chips
> >>#
> >>
> >>#
> >># Audio decoders, processors and mixers
> >>#
> >>CONFIG_VIDEO_TVAUDIO=3Dy
> >>CONFIG_VIDEO_TDA7432=3Dy
> >>CONFIG_VIDEO_TDA9840=3Dy
> >>CONFIG_VIDEO_TEA6415C=3Dy
> >>CONFIG_VIDEO_TEA6420=3Dy
> >># CONFIG_VIDEO_MSP3400 is not set
> >>CONFIG_VIDEO_CS3308=3Dy
> >>CONFIG_VIDEO_CS5345=3Dy
> >>CONFIG_VIDEO_CS53L32A=3Dy
> >>CONFIG_VIDEO_TLV320AIC23B=3Dy
> >>CONFIG_VIDEO_UDA1342=3Dy
> >>CONFIG_VIDEO_WM8775=3Dy
> >># CONFIG_VIDEO_WM8739 is not set
> >>CONFIG_VIDEO_VP27SMPX=3Dy
> >>CONFIG_VIDEO_SONY_BTF_MPX=3Dy
> >>
> >>#
> >># RDS decoders
> >>#
> >>CONFIG_VIDEO_SAA6588=3Dy
> >>
> >>#
> >># Video decoders
> >>#
> >># CONFIG_VIDEO_ADV7180 is not set
> >>CONFIG_VIDEO_ADV7183=3Dy
> >># CONFIG_VIDEO_ADV7604 is not set
> >>CONFIG_VIDEO_ADV7842=3Dy
> >># CONFIG_VIDEO_ADV7842_CEC is not set
> >># CONFIG_VIDEO_BT819 is not set
> >>CONFIG_VIDEO_BT856=3Dy
> >>CONFIG_VIDEO_BT866=3Dy
> >># CONFIG_VIDEO_KS0127 is not set
> >>CONFIG_VIDEO_ML86V7667=3Dy
> >>CONFIG_VIDEO_AD5820=3Dy
> >>CONFIG_VIDEO_SAA7110=3Dy
> >># CONFIG_VIDEO_SAA711X is not set
> >>CONFIG_VIDEO_TC358743=3Dy
> >># CONFIG_VIDEO_TVP514X is not set
> >># CONFIG_VIDEO_TVP5150 is not set
> >>CONFIG_VIDEO_TVP7002=3Dy
> >># CONFIG_VIDEO_TW2804 is not set
> >>CONFIG_VIDEO_TW9903=3Dy
> >># CONFIG_VIDEO_TW9906 is not set
> >>CONFIG_VIDEO_VPX3220=3Dy
> >>
> >>#
> >># Video and audio decoders
> >>#
> >># CONFIG_VIDEO_SAA717X is not set
> >># CONFIG_VIDEO_CX25840 is not set
> >>
> >>#
> >># Video encoders
> >>#
> >>CONFIG_VIDEO_SAA7127=3Dy
> >>CONFIG_VIDEO_SAA7185=3Dy
> >>CONFIG_VIDEO_ADV7170=3Dy
> >># CONFIG_VIDEO_ADV7175 is not set
> >>CONFIG_VIDEO_ADV7343=3Dy
> >>CONFIG_VIDEO_ADV7393=3Dy
> >># CONFIG_VIDEO_ADV7511 is not set
> >>CONFIG_VIDEO_AD9389B=3Dy
> >># CONFIG_VIDEO_AK881X is not set
> >>CONFIG_VIDEO_THS8200=3Dy
> >>
> >>#
> >># Camera sensor devices
> >>#
> >>CONFIG_VIDEO_APTINA_PLL=3Dy
> >>CONFIG_VIDEO_SMIAPP_PLL=3Dy
> >># CONFIG_VIDEO_OV2640 is not set
> >>CONFIG_VIDEO_OV2659=3Dy
> >>CONFIG_VIDEO_OV5647=3Dy
> >>CONFIG_VIDEO_OV7640=3Dy
> >>CONFIG_VIDEO_OV7670=3Dy
> >>CONFIG_VIDEO_OV9650=3Dy
> >>CONFIG_VIDEO_VS6624=3Dy
> >>CONFIG_VIDEO_MT9M032=3Dy
> >>CONFIG_VIDEO_MT9M111=3Dy
> >># CONFIG_VIDEO_MT9P031 is not set
> >>CONFIG_VIDEO_MT9T001=3Dy
> >>CONFIG_VIDEO_MT9V011=3Dy
> >>CONFIG_VIDEO_MT9V032=3Dy
> >># CONFIG_VIDEO_SR030PC30 is not set
> >>CONFIG_VIDEO_NOON010PC30=3Dy
> >>CONFIG_VIDEO_M5MOLS=3Dy
> >># CONFIG_VIDEO_S5K6AA is not set
> >>CONFIG_VIDEO_S5K6A3=3Dy
> >>CONFIG_VIDEO_S5K4ECGX=3Dy
> >>CONFIG_VIDEO_S5K5BAF=3Dy
> >>CONFIG_VIDEO_SMIAPP=3Dy
> >>CONFIG_VIDEO_ET8EK8=3Dy
> >>CONFIG_VIDEO_S5C73M3=3Dy
> >>
> >>#
> >># Flash devices
> >>#
> >>CONFIG_VIDEO_ADP1653=3Dy
> >>CONFIG_VIDEO_AS3645A=3Dy
> >>CONFIG_VIDEO_LM3560=3Dy
> >>CONFIG_VIDEO_LM3646=3Dy
> >>
> >>#
> >># Video improvement chips
> >>#
> >># CONFIG_VIDEO_UPD64031A is not set
> >>CONFIG_VIDEO_UPD64083=3Dy
> >>
> >>#
> >># Audio/Video compression chips
> >>#
> >>CONFIG_VIDEO_SAA6752HS=3Dy
> >>
> >>#
> >># Miscellaneous helper chips
> >>#
> >>CONFIG_VIDEO_THS7303=3Dy
> >>CONFIG_VIDEO_M52790=3Dy
> >>
> >>#
> >># Sensors used on soc_camera driver
> >>#
> >>
> >>#
> >># soc_camera sensor drivers
> >>#
> >># CONFIG_SOC_CAMERA_IMX074 is not set
> >>CONFIG_SOC_CAMERA_MT9M001=3Dy
> >># CONFIG_SOC_CAMERA_MT9M111 is not set
> >>CONFIG_SOC_CAMERA_MT9T031=3Dy
> >># CONFIG_SOC_CAMERA_MT9T112 is not set
> >># CONFIG_SOC_CAMERA_MT9V022 is not set
> >>CONFIG_SOC_CAMERA_OV5642=3Dy
> >># CONFIG_SOC_CAMERA_OV6650 is not set
> >># CONFIG_SOC_CAMERA_OV772X is not set
> >>CONFIG_SOC_CAMERA_OV9640=3Dy
> >># CONFIG_SOC_CAMERA_OV9740 is not set
> >>CONFIG_SOC_CAMERA_RJ54N1=3Dy
> >># CONFIG_SOC_CAMERA_TW9910 is not set
> >>
> >>#
> >># SPI helper chips
> >>#
> >>CONFIG_VIDEO_GS1662=3Dy
> >>CONFIG_MEDIA_TUNER=3Dy
> >>
> >>#
> >># Customize TV tuners
> >>#
> >># CONFIG_MEDIA_TUNER_SIMPLE is not set
> >>CONFIG_MEDIA_TUNER_TDA8290=3Dy
> >>CONFIG_MEDIA_TUNER_TDA827X=3Dy
> >>CONFIG_MEDIA_TUNER_TDA18271=3Dy
> >>CONFIG_MEDIA_TUNER_TDA9887=3Dy
> >>CONFIG_MEDIA_TUNER_TEA5761=3Dy
> >>CONFIG_MEDIA_TUNER_TEA5767=3Dy
> >>CONFIG_MEDIA_TUNER_MSI001=3Dy
> >>CONFIG_MEDIA_TUNER_MT20XX=3Dy
> >>CONFIG_MEDIA_TUNER_MT2060=3Dy
> >>CONFIG_MEDIA_TUNER_MT2063=3Dy
> >># CONFIG_MEDIA_TUNER_MT2266 is not set
> >>CONFIG_MEDIA_TUNER_MT2131=3Dy
> >>CONFIG_MEDIA_TUNER_QT1010=3Dy
> >># CONFIG_MEDIA_TUNER_XC2028 is not set
> >># CONFIG_MEDIA_TUNER_XC5000 is not set
> >>CONFIG_MEDIA_TUNER_XC4000=3Dy
> >>CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> >>CONFIG_MEDIA_TUNER_MXL5007T=3Dy
> >># CONFIG_MEDIA_TUNER_MC44S803 is not set
> >>CONFIG_MEDIA_TUNER_MAX2165=3Dy
> >>CONFIG_MEDIA_TUNER_TDA18218=3Dy
> >># CONFIG_MEDIA_TUNER_FC0011 is not set
> >># CONFIG_MEDIA_TUNER_FC0012 is not set
> >>CONFIG_MEDIA_TUNER_FC0013=3Dy
> >>CONFIG_MEDIA_TUNER_TDA18212=3Dy
> >># CONFIG_MEDIA_TUNER_E4000 is not set
> >>CONFIG_MEDIA_TUNER_FC2580=3Dy
> >>CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
> >># CONFIG_MEDIA_TUNER_TUA9001 is not set
> >># CONFIG_MEDIA_TUNER_SI2157 is not set
> >># CONFIG_MEDIA_TUNER_IT913X is not set
> >>CONFIG_MEDIA_TUNER_R820T=3Dy
> >># CONFIG_MEDIA_TUNER_MXL301RF is not set
> >>CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
> >>
> >>#
> >># Customise DVB Frontends
> >>#
> >>
> >>#
> >># Tools to develop new frontends
> >>#
> >>
> >>#
> >># Graphics support
> >>#
> >>CONFIG_AGP=3Dy
> >>CONFIG_AGP_AMD64=3Dy
> >>CONFIG_AGP_INTEL=3Dy
> >>CONFIG_AGP_SIS=3Dy
> >>CONFIG_AGP_VIA=3Dy
> >>CONFIG_INTEL_GTT=3Dy
> >>CONFIG_VGA_ARB=3Dy
> >>CONFIG_VGA_ARB_MAX_GPUS=3D16
> >># CONFIG_VGA_SWITCHEROO is not set
> >># CONFIG_DRM is not set
> >>
> >>#
> >># ACP (Audio CoProcessor) Configuration
> >>#
> >># CONFIG_DRM_LIB_RANDOM is not set
> >>
> >>#
> >># Frame buffer Devices
> >>#
> >>CONFIG_FB=3Dy
> >># CONFIG_FIRMWARE_EDID is not set
> >>CONFIG_FB_CMDLINE=3Dy
> >>CONFIG_FB_NOTIFY=3Dy
> >>CONFIG_FB_DDC=3Dy
> >>CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> >>CONFIG_FB_CFB_FILLRECT=3Dy
> >>CONFIG_FB_CFB_COPYAREA=3Dy
> >>CONFIG_FB_CFB_IMAGEBLIT=3Dy
> >># CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> >>CONFIG_FB_SYS_FILLRECT=3Dy
> >>CONFIG_FB_SYS_COPYAREA=3Dy
> >>CONFIG_FB_SYS_IMAGEBLIT=3Dy
> >># CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> >># CONFIG_FB_FOREIGN_ENDIAN is not set
> >>CONFIG_FB_SYS_FOPS=3Dy
> >>CONFIG_FB_DEFERRED_IO=3Dy
> >>CONFIG_FB_HECUBA=3Dy
> >>CONFIG_FB_SVGALIB=3Dy
> >># CONFIG_FB_MACMODES is not set
> >>CONFIG_FB_BACKLIGHT=3Dy
> >>CONFIG_FB_MODE_HELPERS=3Dy
> >>CONFIG_FB_TILEBLITTING=3Dy
> >>
> >>#
> >># Frame buffer hardware drivers
> >>#
> >># CONFIG_FB_CIRRUS is not set
> >># CONFIG_FB_PM2 is not set
> >># CONFIG_FB_CYBER2000 is not set
> >>CONFIG_FB_ARC=3Dy
> >>CONFIG_FB_ASILIANT=3Dy
> >>CONFIG_FB_IMSTT=3Dy
> >># CONFIG_FB_VGA16 is not set
> >># CONFIG_FB_VESA is not set
> >># CONFIG_FB_EFI is not set
> >>CONFIG_FB_N411=3Dy
> >># CONFIG_FB_HGA is not set
> >>CONFIG_FB_OPENCORES=3Dy
> >>CONFIG_FB_S1D13XXX=3Dy
> >>CONFIG_FB_NVIDIA=3Dy
> >>CONFIG_FB_NVIDIA_I2C=3Dy
> >># CONFIG_FB_NVIDIA_DEBUG is not set
> >># CONFIG_FB_NVIDIA_BACKLIGHT is not set
> >># CONFIG_FB_RIVA is not set
> >># CONFIG_FB_I740 is not set
> >># CONFIG_FB_LE80578 is not set
> >>CONFIG_FB_INTEL=3Dy
> >>CONFIG_FB_INTEL_DEBUG=3Dy
> >>CONFIG_FB_INTEL_I2C=3Dy
> >>CONFIG_FB_MATROX=3Dy
> >># CONFIG_FB_MATROX_MILLENIUM is not set
> >>CONFIG_FB_MATROX_MYSTIQUE=3Dy
> >>CONFIG_FB_MATROX_G=3Dy
> >>CONFIG_FB_MATROX_I2C=3Dy
> >># CONFIG_FB_MATROX_MAVEN is not set
> >>CONFIG_FB_RADEON=3Dy
> >># CONFIG_FB_RADEON_I2C is not set
> >># CONFIG_FB_RADEON_BACKLIGHT is not set
> >># CONFIG_FB_RADEON_DEBUG is not set
> >>CONFIG_FB_ATY128=3Dy
> >># CONFIG_FB_ATY128_BACKLIGHT is not set
> >>CONFIG_FB_ATY=3Dy
> >>CONFIG_FB_ATY_CT=3Dy
> >># CONFIG_FB_ATY_GENERIC_LCD is not set
> >>CONFIG_FB_ATY_GX=3Dy
> >>CONFIG_FB_ATY_BACKLIGHT=3Dy
> >># CONFIG_FB_S3 is not set
> >>CONFIG_FB_SAVAGE=3Dy
> >># CONFIG_FB_SAVAGE_I2C is not set
> >># CONFIG_FB_SAVAGE_ACCEL is not set
> >>CONFIG_FB_SIS=3Dy
> >># CONFIG_FB_SIS_300 is not set
> >>CONFIG_FB_SIS_315=3Dy
> >>CONFIG_FB_VIA=3Dy
> >>CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
> >>CONFIG_FB_VIA_X_COMPATIBILITY=3Dy
> >># CONFIG_FB_NEOMAGIC is not set
> >># CONFIG_FB_KYRO is not set
> >>CONFIG_FB_3DFX=3Dy
> >>CONFIG_FB_3DFX_ACCEL=3Dy
> >># CONFIG_FB_3DFX_I2C is not set
> >>CONFIG_FB_VOODOO1=3Dy
> >># CONFIG_FB_VT8623 is not set
> >>CONFIG_FB_TRIDENT=3Dy
> >>CONFIG_FB_ARK=3Dy
> >>CONFIG_FB_PM3=3Dy
> >>CONFIG_FB_CARMINE=3Dy
> >>CONFIG_FB_CARMINE_DRAM_EVAL=3Dy
> >># CONFIG_CARMINE_DRAM_CUSTOM is not set
> >>CONFIG_FB_SM501=3Dy
> >># CONFIG_FB_IBM_GXT4500 is not set
> >>CONFIG_FB_GOLDFISH=3Dy
> >># CONFIG_FB_VIRTUAL is not set
> >>CONFIG_FB_METRONOME=3Dy
> >>CONFIG_FB_MB862XX=3Dy
> >>CONFIG_FB_MB862XX_PCI_GDC=3Dy
> >>CONFIG_FB_MB862XX_I2C=3Dy
> >># CONFIG_FB_BROADSHEET is not set
> >>CONFIG_FB_AUO_K190X=3Dy
> >>CONFIG_FB_AUO_K1900=3Dy
> >># CONFIG_FB_AUO_K1901 is not set
> >># CONFIG_FB_SIMPLE is not set
> >># CONFIG_FB_SM712 is not set
> >>CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> >>CONFIG_LCD_CLASS_DEVICE=3Dy
> >># CONFIG_LCD_L4F00242T03 is not set
> >>CONFIG_LCD_LMS283GF05=3Dy
> >>CONFIG_LCD_LTV350QV=3Dy
> >># CONFIG_LCD_ILI922X is not set
> >>CONFIG_LCD_ILI9320=3Dy
> >># CONFIG_LCD_TDO24M is not set
> >>CONFIG_LCD_VGG2432A4=3Dy
> >>CONFIG_LCD_PLATFORM=3Dy
> >>CONFIG_LCD_S6E63M0=3Dy
> >>CONFIG_LCD_LD9040=3Dy
> >># CONFIG_LCD_AMS369FG06 is not set
> >>CONFIG_LCD_LMS501KF03=3Dy
> >># CONFIG_LCD_HX8357 is not set
> >>CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> >>CONFIG_BACKLIGHT_GENERIC=3Dy
> >>CONFIG_BACKLIGHT_LM3533=3Dy
> >>CONFIG_BACKLIGHT_PWM=3Dy
> >>CONFIG_BACKLIGHT_DA903X=3Dy
> >>CONFIG_BACKLIGHT_DA9052=3Dy
> >># CONFIG_BACKLIGHT_APPLE is not set
> >># CONFIG_BACKLIGHT_PM8941_WLED is not set
> >>CONFIG_BACKLIGHT_SAHARA=3Dy
> >># CONFIG_BACKLIGHT_ADP5520 is not set
> >># CONFIG_BACKLIGHT_ADP8860 is not set
> >>CONFIG_BACKLIGHT_ADP8870=3Dy
> >>CONFIG_BACKLIGHT_88PM860X=3Dy
> >>CONFIG_BACKLIGHT_PCF50633=3Dy
> >># CONFIG_BACKLIGHT_AAT2870 is not set
> >>CONFIG_BACKLIGHT_LM3630A=3Dy
> >># CONFIG_BACKLIGHT_LM3639 is not set
> >>CONFIG_BACKLIGHT_LP855X=3Dy
> >>CONFIG_BACKLIGHT_PANDORA=3Dy
> >>CONFIG_BACKLIGHT_SKY81452=3Dy
> >>CONFIG_BACKLIGHT_TPS65217=3Dy
> >>CONFIG_BACKLIGHT_AS3711=3Dy
> >>CONFIG_BACKLIGHT_GPIO=3Dy
> >>CONFIG_BACKLIGHT_LV5207LP=3Dy
> >># CONFIG_BACKLIGHT_BD6107 is not set
> >>CONFIG_BACKLIGHT_ARCXCNN=3Dy
> >>CONFIG_VGASTATE=3Dy
> >>CONFIG_HDMI=3Dy
> >># CONFIG_LOGO is not set
> >>CONFIG_SOUND=3Dy
> >># CONFIG_SOUND_OSS_CORE is not set
> >># CONFIG_SND is not set
> >>
> >>#
> >># HID support
> >>#
> >>CONFIG_HID=3Dy
> >># CONFIG_HID_BATTERY_STRENGTH is not set
> >># CONFIG_HIDRAW is not set
> >>CONFIG_UHID=3Dy
> >>CONFIG_HID_GENERIC=3Dy
> >>
> >>#
> >># Special HID drivers
> >>#
> >>CONFIG_HID_A4TECH=3Dy
> >># CONFIG_HID_ACRUX is not set
> >>CONFIG_HID_APPLE=3Dy
> >>CONFIG_HID_ASUS=3Dy
> >>CONFIG_HID_AUREAL=3Dy
> >>CONFIG_HID_BELKIN=3Dy
> >>CONFIG_HID_CHERRY=3Dy
> >>CONFIG_HID_CHICONY=3Dy
> >>CONFIG_HID_CMEDIA=3Dy
> >>CONFIG_HID_CYPRESS=3Dy
> >>CONFIG_HID_DRAGONRISE=3Dy
> >># CONFIG_DRAGONRISE_FF is not set
> >># CONFIG_HID_EMS_FF is not set
> >>CONFIG_HID_ELECOM=3Dy
> >># CONFIG_HID_EZKEY is not set
> >>CONFIG_HID_GEMBIRD=3Dy
> >># CONFIG_HID_GFRM is not set
> >># CONFIG_HID_KEYTOUCH is not set
> >>CONFIG_HID_KYE=3Dy
> >>CONFIG_HID_WALTOP=3Dy
> >># CONFIG_HID_GYRATION is not set
> >># CONFIG_HID_ICADE is not set
> >>CONFIG_HID_TWINHAN=3Dy
> >>CONFIG_HID_KENSINGTON=3Dy
> >>CONFIG_HID_LCPOWER=3Dy
> >>CONFIG_HID_LED=3Dy
> >># CONFIG_HID_LENOVO is not set
> >># CONFIG_HID_LOGITECH is not set
> >>CONFIG_HID_MAGICMOUSE=3Dy
> >>CONFIG_HID_MAYFLASH=3Dy
> >>CONFIG_HID_MICROSOFT=3Dy
> >>CONFIG_HID_MONTEREY=3Dy
> >>CONFIG_HID_MULTITOUCH=3Dy
> >>CONFIG_HID_NTI=3Dy
> >>CONFIG_HID_ORTEK=3Dy
> >># CONFIG_HID_PANTHERLORD is not set
> >># CONFIG_HID_PETALYNX is not set
> >># CONFIG_HID_PICOLCD is not set
> >># CONFIG_HID_PLANTRONICS is not set
> >>CONFIG_HID_PRIMAX=3Dy
> >>CONFIG_HID_SAITEK=3Dy
> >>CONFIG_HID_SAMSUNG=3Dy
> >>CONFIG_HID_SPEEDLINK=3Dy
> >>CONFIG_HID_STEELSERIES=3Dy
> >>CONFIG_HID_SUNPLUS=3Dy
> >># CONFIG_HID_RMI is not set
> >># CONFIG_HID_GREENASIA is not set
> >>CONFIG_HID_SMARTJOYPLUS=3Dy
> >>CONFIG_SMARTJOYPLUS_FF=3Dy
> >>CONFIG_HID_TIVO=3Dy
> >># CONFIG_HID_TOPSEED is not set
> >># CONFIG_HID_THINGM is not set
> >>CONFIG_HID_THRUSTMASTER=3Dy
> >># CONFIG_THRUSTMASTER_FF is not set
> >>CONFIG_HID_UDRAW_PS3=3Dy
> >># CONFIG_HID_WACOM is not set
> >>CONFIG_HID_WIIMOTE=3Dy
> >>CONFIG_HID_XINMO=3Dy
> >>CONFIG_HID_ZEROPLUS=3Dy
> >>CONFIG_ZEROPLUS_FF=3Dy
> >>CONFIG_HID_ZYDACRON=3Dy
> >>CONFIG_HID_SENSOR_HUB=3Dy
> >>CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
> >>CONFIG_HID_ALPS=3Dy
> >>
> >>#
> >># I2C HID support
> >>#
> >>CONFIG_I2C_HID=3Dy
> >>
> >>#
> >># Intel ISH HID support
> >>#
> >># CONFIG_INTEL_ISH_HID is not set
> >>CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> >>CONFIG_USB_SUPPORT=3Dy
> >>CONFIG_USB_ARCH_HAS_HCD=3Dy
> >># CONFIG_USB is not set
> >>CONFIG_USB_PCI=3Dy
> >>
> >>#
> >># USB port drivers
> >>#
> >>
> >>#
> >># USB Physical Layer drivers
> >>#
> >># CONFIG_USB_PHY is not set
> >># CONFIG_NOP_USB_XCEIV is not set
> >># CONFIG_USB_GPIO_VBUS is not set
> >># CONFIG_TAHVO_USB is not set
> >># CONFIG_USB_GADGET is not set
> >>
> >>#
> >># USB Power Delivery and Type-C drivers
> >>#
> >># CONFIG_USB_LED_TRIG is not set
> >># CONFIG_USB_ULPI_BUS is not set
> >>CONFIG_UWB=3Dy
> >>CONFIG_UWB_WHCI=3Dy
> >># CONFIG_MMC is not set
> >># CONFIG_MEMSTICK is not set
> >>CONFIG_NEW_LEDS=3Dy
> >>CONFIG_LEDS_CLASS=3Dy
> >>CONFIG_LEDS_CLASS_FLASH=3Dy
> >># CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> >>
> >>#
> >># LED drivers
> >>#
> >>CONFIG_LEDS_88PM860X=3Dy
> >>CONFIG_LEDS_LM3530=3Dy
> >># CONFIG_LEDS_LM3533 is not set
> >>CONFIG_LEDS_LM3642=3Dy
> >>CONFIG_LEDS_MT6323=3Dy
> >>CONFIG_LEDS_PCA9532=3Dy
> >># CONFIG_LEDS_PCA9532_GPIO is not set
> >># CONFIG_LEDS_GPIO is not set
> >># CONFIG_LEDS_LP3944 is not set
> >>CONFIG_LEDS_LP3952=3Dy
> >>CONFIG_LEDS_LP55XX_COMMON=3Dy
> >>CONFIG_LEDS_LP5521=3Dy
> >># CONFIG_LEDS_LP5523 is not set
> >>CONFIG_LEDS_LP5562=3Dy
> >>CONFIG_LEDS_LP8501=3Dy
> >># CONFIG_LEDS_LP8860 is not set
> >># CONFIG_LEDS_CLEVO_MAIL is not set
> >>CONFIG_LEDS_PCA955X=3Dy
> >>CONFIG_LEDS_PCA963X=3Dy
> >>CONFIG_LEDS_WM8350=3Dy
> >>CONFIG_LEDS_DA903X=3Dy
> >>CONFIG_LEDS_DA9052=3Dy
> >># CONFIG_LEDS_DAC124S085 is not set
> >># CONFIG_LEDS_PWM is not set
> >># CONFIG_LEDS_REGULATOR is not set
> >>CONFIG_LEDS_BD2802=3Dy
> >># CONFIG_LEDS_INTEL_SS4200 is not set
> >>CONFIG_LEDS_LT3593=3Dy
> >>CONFIG_LEDS_ADP5520=3Dy
> >>CONFIG_LEDS_MC13783=3Dy
> >>CONFIG_LEDS_TCA6507=3Dy
> >>CONFIG_LEDS_TLC591XX=3Dy
> >># CONFIG_LEDS_LM355x is not set
> >>CONFIG_LEDS_MENF21BMC=3Dy
> >>
> >>#
> >># LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
> >>#
> >># CONFIG_LEDS_BLINKM is not set
> >>CONFIG_LEDS_MLXCPLD=3Dy
> >># CONFIG_LEDS_USER is not set
> >>CONFIG_LEDS_NIC78BX=3Dy
> >>
> >>#
> >># LED Triggers
> >>#
> >>CONFIG_LEDS_TRIGGERS=3Dy
> >># CONFIG_LEDS_TRIGGER_TIMER is not set
> >>CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> >>CONFIG_LEDS_TRIGGER_MTD=3Dy
> >>CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> >>CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> >>CONFIG_LEDS_TRIGGER_CPU=3Dy
> >>CONFIG_LEDS_TRIGGER_GPIO=3Dy
> >>CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> >>
> >>#
> >># iptables trigger is under Netfilter config (LED target)
> >>#
> >>CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> >>CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> >># CONFIG_LEDS_TRIGGER_PANIC is not set
> >>CONFIG_ACCESSIBILITY=3Dy
> >>CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> >>CONFIG_EDAC_SUPPORT=3Dy
> >>CONFIG_RTC_LIB=3Dy
> >>CONFIG_RTC_MC146818_LIB=3Dy
> >>CONFIG_RTC_CLASS=3Dy
> >># CONFIG_RTC_HCTOSYS is not set
> >># CONFIG_RTC_SYSTOHC is not set
> >># CONFIG_RTC_DEBUG is not set
> >>
> >>#
> >># RTC interfaces
> >>#
> >># CONFIG_RTC_INTF_SYSFS is not set
> >>CONFIG_RTC_INTF_PROC=3Dy
> >>CONFIG_RTC_INTF_DEV=3Dy
> >># CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> >># CONFIG_RTC_DRV_TEST is not set
> >>
> >>#
> >># I2C RTC drivers
> >>#
> >>CONFIG_RTC_DRV_88PM860X=3Dy
> >>CONFIG_RTC_DRV_88PM80X=3Dy
> >># CONFIG_RTC_DRV_ABB5ZES3 is not set
> >>CONFIG_RTC_DRV_ABX80X=3Dy
> >>CONFIG_RTC_DRV_DS1307=3Dy
> >>CONFIG_RTC_DRV_DS1307_HWMON=3Dy
> >># CONFIG_RTC_DRV_DS1307_CENTURY is not set
> >>CONFIG_RTC_DRV_DS1374=3Dy
> >># CONFIG_RTC_DRV_DS1374_WDT is not set
> >>CONFIG_RTC_DRV_DS1672=3Dy
> >>CONFIG_RTC_DRV_MAX6900=3Dy
> >>CONFIG_RTC_DRV_MAX8907=3Dy
> >># CONFIG_RTC_DRV_MAX8998 is not set
> >>CONFIG_RTC_DRV_RS5C372=3Dy
> >># CONFIG_RTC_DRV_ISL1208 is not set
> >>CONFIG_RTC_DRV_ISL12022=3Dy
> >>CONFIG_RTC_DRV_X1205=3Dy
> >>CONFIG_RTC_DRV_PCF8523=3Dy
> >>CONFIG_RTC_DRV_PCF85063=3Dy
> >># CONFIG_RTC_DRV_PCF8563 is not set
> >># CONFIG_RTC_DRV_PCF8583 is not set
> >>CONFIG_RTC_DRV_M41T80=3Dy
> >># CONFIG_RTC_DRV_M41T80_WDT is not set
> >># CONFIG_RTC_DRV_BQ32K is not set
> >>CONFIG_RTC_DRV_RC5T583=3Dy
> >># CONFIG_RTC_DRV_S35390A is not set
> >>CONFIG_RTC_DRV_FM3130=3Dy
> >># CONFIG_RTC_DRV_RX8010 is not set
> >>CONFIG_RTC_DRV_RX8581=3Dy
> >># CONFIG_RTC_DRV_RX8025 is not set
> >>CONFIG_RTC_DRV_EM3027=3Dy
> >># CONFIG_RTC_DRV_RV8803 is not set
> >>CONFIG_RTC_DRV_S5M=3Dy
> >>
> >>#
> >># SPI RTC drivers
> >>#
> >>CONFIG_RTC_DRV_M41T93=3Dy
> >># CONFIG_RTC_DRV_M41T94 is not set
> >># CONFIG_RTC_DRV_DS1302 is not set
> >>CONFIG_RTC_DRV_DS1305=3Dy
> >># CONFIG_RTC_DRV_DS1343 is not set
> >>CONFIG_RTC_DRV_DS1347=3Dy
> >>CONFIG_RTC_DRV_DS1390=3Dy
> >>CONFIG_RTC_DRV_MAX6916=3Dy
> >>CONFIG_RTC_DRV_R9701=3Dy
> >>CONFIG_RTC_DRV_RX4581=3Dy
> >>CONFIG_RTC_DRV_RX6110=3Dy
> >># CONFIG_RTC_DRV_RS5C348 is not set
> >>CONFIG_RTC_DRV_MAX6902=3Dy
> >>CONFIG_RTC_DRV_PCF2123=3Dy
> >>CONFIG_RTC_DRV_MCP795=3Dy
> >>CONFIG_RTC_I2C_AND_SPI=3Dy
> >>
> >>#
> >># SPI and I2C RTC drivers
> >>#
> >># CONFIG_RTC_DRV_DS3232 is not set
> >>CONFIG_RTC_DRV_PCF2127=3Dy
> >>CONFIG_RTC_DRV_RV3029C2=3Dy
> >># CONFIG_RTC_DRV_RV3029_HWMON is not set
> >>
> >>#
> >># Platform RTC drivers
> >>#
> >>CONFIG_RTC_DRV_CMOS=3Dy
> >>CONFIG_RTC_DRV_DS1286=3Dy
> >>CONFIG_RTC_DRV_DS1511=3Dy
> >># CONFIG_RTC_DRV_DS1553 is not set
> >>CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
> >># CONFIG_RTC_DRV_DS1685 is not set
> >># CONFIG_RTC_DRV_DS1689 is not set
> >>CONFIG_RTC_DRV_DS17285=3Dy
> >># CONFIG_RTC_DRV_DS17485 is not set
> >># CONFIG_RTC_DRV_DS17885 is not set
> >># CONFIG_RTC_DS1685_PROC_REGS is not set
> >>CONFIG_RTC_DS1685_SYSFS_REGS=3Dy
> >>CONFIG_RTC_DRV_DS1742=3Dy
> >>CONFIG_RTC_DRV_DS2404=3Dy
> >># CONFIG_RTC_DRV_DA9052 is not set
> >># CONFIG_RTC_DRV_DA9055 is not set
> >>CONFIG_RTC_DRV_DA9063=3Dy
> >># CONFIG_RTC_DRV_STK17TA8 is not set
> >># CONFIG_RTC_DRV_M48T86 is not set
> >>CONFIG_RTC_DRV_M48T35=3Dy
> >>CONFIG_RTC_DRV_M48T59=3Dy
> >># CONFIG_RTC_DRV_MSM6242 is not set
> >>CONFIG_RTC_DRV_BQ4802=3Dy
> >>CONFIG_RTC_DRV_RP5C01=3Dy
> >>CONFIG_RTC_DRV_V3020=3Dy
> >>CONFIG_RTC_DRV_WM8350=3Dy
> >># CONFIG_RTC_DRV_PCF50633 is not set
> >>CONFIG_RTC_DRV_AB3100=3Dy
> >>
> >>#
> >># on-CPU RTC drivers
> >>#
> >># CONFIG_RTC_DRV_MC13XXX is not set
> >>CONFIG_RTC_DRV_MT6397=3Dy
> >>
> >>#
> >># HID Sensor RTC drivers
> >>#
> >># CONFIG_DMADEVICES is not set
> >>
> >>#
> >># DMABUF options
> >>#
> >># CONFIG_SYNC_FILE is not set
> >>CONFIG_AUXDISPLAY=3Dy
> >>CONFIG_CHARLCD=3Dy
> >>CONFIG_HD44780=3Dy
> >># CONFIG_IMG_ASCII_LCD is not set
> >># CONFIG_PANEL is not set
> >># CONFIG_UIO is not set
> >>CONFIG_VIRT_DRIVERS=3Dy
> >>CONFIG_VIRTIO=3Dy
> >>
> >>#
> >># Virtio drivers
> >>#
> >>CONFIG_VIRTIO_PCI=3Dy
> >># CONFIG_VIRTIO_PCI_LEGACY is not set
> >>CONFIG_VIRTIO_BALLOON=3Dy
> >>CONFIG_VIRTIO_INPUT=3Dy
> >>CONFIG_VIRTIO_MMIO=3Dy
> >>CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> >>
> >>#
> >># Microsoft Hyper-V guest support
> >>#
> >># CONFIG_HYPERV is not set
> >># CONFIG_HYPERV_TSCPAGE is not set
> >>CONFIG_STAGING=3Dy
> >>CONFIG_COMEDI=3Dy
> >>CONFIG_COMEDI_DEBUG=3Dy
> >>CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> >>CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> >># CONFIG_COMEDI_MISC_DRIVERS is not set
> >># CONFIG_COMEDI_ISA_DRIVERS is not set
> >># CONFIG_COMEDI_PCI_DRIVERS is not set
> >>CONFIG_COMEDI_PCMCIA_DRIVERS=3Dy
> >>CONFIG_COMEDI_CB_DAS16_CS=3Dy
> >>CONFIG_COMEDI_DAS08_CS=3Dy
> >># CONFIG_COMEDI_NI_DAQ_700_CS is not set
> >>CONFIG_COMEDI_NI_DAQ_DIO24_CS=3Dy
> >>CONFIG_COMEDI_NI_LABPC_CS=3Dy
> >># CONFIG_COMEDI_NI_MIO_CS is not set
> >># CONFIG_COMEDI_QUATECH_DAQP_CS is not set
> >>CONFIG_COMEDI_8254=3Dy
> >>CONFIG_COMEDI_8255=3Dy
> >>CONFIG_COMEDI_8255_SA=3Dy
> >>CONFIG_COMEDI_KCOMEDILIB=3Dy
> >>CONFIG_COMEDI_DAS08=3Dy
> >>CONFIG_COMEDI_NI_LABPC=3Dy
> >>
> >>#
> >># IIO staging drivers
> >>#
> >>
> >>#
> >># Accelerometers
> >>#
> >># CONFIG_ADIS16201 is not set
> >>CONFIG_ADIS16203=3Dy
> >># CONFIG_ADIS16209 is not set
> >>CONFIG_ADIS16240=3Dy
> >>
> >>#
> >># Analog to digital converters
> >>#
> >># CONFIG_AD7606 is not set
> >>CONFIG_AD7780=3Dy
> >># CONFIG_AD7816 is not set
> >>CONFIG_AD7192=3Dy
> >>CONFIG_AD7280=3Dy
> >>
> >>#
> >># Analog digital bi-direction converters
> >>#
> >>CONFIG_ADT7316=3Dy
> >>CONFIG_ADT7316_SPI=3Dy
> >># CONFIG_ADT7316_I2C is not set
> >>
> >>#
> >># Capacitance to digital converters
> >>#
> >>CONFIG_AD7150=3Dy
> >>CONFIG_AD7152=3Dy
> >>CONFIG_AD7746=3Dy
> >>
> >>#
> >># Direct Digital Synthesis
> >>#
> >>CONFIG_AD9832=3Dy
> >>CONFIG_AD9834=3Dy
> >>
> >>#
> >># Digital gyroscope sensors
> >>#
> >># CONFIG_ADIS16060 is not set
> >>
> >>#
> >># Network Analyzer, Impedance Converters
> >>#
> >>CONFIG_AD5933=3Dy
> >>
> >>#
> >># Light sensors
> >>#
> >>CONFIG_SENSORS_ISL29028=3Dy
> >>CONFIG_TSL2x7x=3Dy
> >>
> >>#
> >># Active energy metering IC
> >>#
> >># CONFIG_ADE7753 is not set
> >>CONFIG_ADE7754=3Dy
> >># CONFIG_ADE7758 is not set
> >>CONFIG_ADE7759=3Dy
> >>CONFIG_ADE7854=3Dy
> >>CONFIG_ADE7854_I2C=3Dy
> >>CONFIG_ADE7854_SPI=3Dy
> >>
> >>#
> >># Resolver to digital converters
> >>#
> >># CONFIG_AD2S90 is not set
> >># CONFIG_AD2S1200 is not set
> >>CONFIG_AD2S1210=3Dy
> >>
> >>#
> >># Triggers - standalone
> >>#
> >># CONFIG_FB_SM750 is not set
> >>CONFIG_FB_XGI=3Dy
> >>
> >>#
> >># Speakup console speech
> >>#
> >># CONFIG_STAGING_MEDIA is not set
> >>
> >>#
> >># Android
> >>#
> >>CONFIG_GOLDFISH_AUDIO=3Dy
> >># CONFIG_MTD_GOLDFISH_NAND is not set
> >># CONFIG_MTD_SPINAND_MT29F is not set
> >>CONFIG_DGNC=3Dy
> >>CONFIG_GS_FPGABOOT=3Dy
> >>CONFIG_CRYPTO_SKEIN=3Dy
> >>CONFIG_UNISYSSPAR=3Dy
> >>CONFIG_UNISYS_VISORBUS=3Dy
> >># CONFIG_UNISYS_VISORNIC is not set
> >># CONFIG_UNISYS_VISORINPUT is not set
> >>CONFIG_FB_TFT=3Dy
> >># CONFIG_FB_TFT_AGM1264K_FL is not set
> >>CONFIG_FB_TFT_BD663474=3Dy
> >>CONFIG_FB_TFT_HX8340BN=3Dy
> >># CONFIG_FB_TFT_HX8347D is not set
> >>CONFIG_FB_TFT_HX8353D=3Dy
> >># CONFIG_FB_TFT_HX8357D is not set
> >># CONFIG_FB_TFT_ILI9163 is not set
> >>CONFIG_FB_TFT_ILI9320=3Dy
> >>CONFIG_FB_TFT_ILI9325=3Dy
> >>CONFIG_FB_TFT_ILI9340=3Dy
> >>CONFIG_FB_TFT_ILI9341=3Dy
> >>CONFIG_FB_TFT_ILI9481=3Dy
> >>CONFIG_FB_TFT_ILI9486=3Dy
> >>CONFIG_FB_TFT_PCD8544=3Dy
> >>CONFIG_FB_TFT_RA8875=3Dy
> >>CONFIG_FB_TFT_S6D02A1=3Dy
> >>CONFIG_FB_TFT_S6D1121=3Dy
> >>CONFIG_FB_TFT_SH1106=3Dy
> >>CONFIG_FB_TFT_SSD1289=3Dy
> >>CONFIG_FB_TFT_SSD1305=3Dy
> >>CONFIG_FB_TFT_SSD1306=3Dy
> >>CONFIG_FB_TFT_SSD1325=3Dy
> >>CONFIG_FB_TFT_SSD1331=3Dy
> >>CONFIG_FB_TFT_SSD1351=3Dy
> >>CONFIG_FB_TFT_ST7735R=3Dy
> >>CONFIG_FB_TFT_ST7789V=3Dy
> >>CONFIG_FB_TFT_TINYLCD=3Dy
> >>CONFIG_FB_TFT_TLS8204=3Dy
> >># CONFIG_FB_TFT_UC1611 is not set
> >># CONFIG_FB_TFT_UC1701 is not set
> >>CONFIG_FB_TFT_UPD161704=3Dy
> >># CONFIG_FB_TFT_WATTEROTT is not set
> >>CONFIG_FB_FLEX=3Dy
> >>CONFIG_FB_TFT_FBTFT_DEVICE=3Dy
> >># CONFIG_MOST is not set
> >># CONFIG_GREYBUS is not set
> >>
> >>#
> >># USB Power Delivery and Type-C drivers
> >>#
> >>CONFIG_X86_PLATFORM_DEVICES=3Dy
> >># CONFIG_ACER_WMI is not set
> >>CONFIG_ACERHDF=3Dy
> >>CONFIG_ALIENWARE_WMI=3Dy
> >>CONFIG_ASUS_LAPTOP=3Dy
> >>CONFIG_DELL_SMBIOS=3Dy
> >># CONFIG_DELL_LAPTOP is not set
> >>CONFIG_DELL_WMI=3Dy
> >>CONFIG_DELL_WMI_AIO=3Dy
> >>CONFIG_DELL_WMI_LED=3Dy
> >># CONFIG_DELL_SMO8800 is not set
> >># CONFIG_FUJITSU_LAPTOP is not set
> >># CONFIG_FUJITSU_TABLET is not set
> >># CONFIG_HP_ACCEL is not set
> >>CONFIG_HP_WIRELESS=3Dy
> >>CONFIG_HP_WMI=3Dy
> >>CONFIG_PANASONIC_LAPTOP=3Dy
> >>CONFIG_SURFACE3_WMI=3Dy
> >>CONFIG_THINKPAD_ACPI=3Dy
> >>CONFIG_THINKPAD_ACPI_DEBUGFACILITIES=3Dy
> >>CONFIG_THINKPAD_ACPI_DEBUG=3Dy
> >># CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
> >>CONFIG_THINKPAD_ACPI_VIDEO=3Dy
> >># CONFIG_THINKPAD_ACPI_HOTKEY_POLL is not set
> >># CONFIG_SENSORS_HDAPS is not set
> >>CONFIG_INTEL_MENLOW=3Dy
> >># CONFIG_ASUS_WIRELESS is not set
> >>CONFIG_ACPI_WMI=3Dy
> >>CONFIG_MSI_WMI=3Dy
> >># CONFIG_TOPSTAR_LAPTOP is not set
> >>CONFIG_ACPI_TOSHIBA=3Dy
> >>CONFIG_TOSHIBA_BT_RFKILL=3Dy
> >>CONFIG_TOSHIBA_HAPS=3Dy
> >>CONFIG_TOSHIBA_WMI=3Dy
> >>CONFIG_ACPI_CMPC=3Dy
> >># CONFIG_INTEL_CHT_INT33FE is not set
> >># CONFIG_INTEL_HID_EVENT is not set
> >>CONFIG_INTEL_VBTN=3Dy
> >>CONFIG_INTEL_IPS=3Dy
> >>CONFIG_INTEL_PMC_CORE=3Dy
> >># CONFIG_IBM_RTL is not set
> >>CONFIG_SAMSUNG_LAPTOP=3Dy
> >>CONFIG_MXM_WMI=3Dy
> >>CONFIG_SAMSUNG_Q10=3Dy
> >>CONFIG_APPLE_GMUX=3Dy
> >>CONFIG_INTEL_RST=3Dy
> >>CONFIG_INTEL_SMARTCONNECT=3Dy
> >># CONFIG_PVPANIC is not set
> >>CONFIG_INTEL_PMC_IPC=3Dy
> >>CONFIG_SURFACE_PRO3_BUTTON=3Dy
> >>CONFIG_INTEL_PUNIT_IPC=3Dy
> >>CONFIG_INTEL_TELEMETRY=3Dy
> >>CONFIG_MLX_PLATFORM=3Dy
> >>CONFIG_MLX_CPLD_PLATFORM=3Dy
> >>CONFIG_PMC_ATOM=3Dy
> >>CONFIG_GOLDFISH_BUS=3Dy
> >># CONFIG_GOLDFISH_PIPE is not set
> >>CONFIG_CHROME_PLATFORMS=3Dy
> >># CONFIG_CHROMEOS_LAPTOP is not set
> >>CONFIG_CHROMEOS_PSTORE=3Dy
> >>CONFIG_CROS_EC_CHARDEV=3Dy
> >># CONFIG_CROS_EC_LPC is not set
> >>CONFIG_CROS_EC_PROTO=3Dy
> >>CONFIG_CROS_KBD_LED_BACKLIGHT=3Dy
> >>CONFIG_CLKDEV_LOOKUP=3Dy
> >>CONFIG_HAVE_CLK_PREPARE=3Dy
> >>CONFIG_COMMON_CLK=3Dy
> >>
> >>#
> >># Common Clock Framework
> >>#
> >># CONFIG_COMMON_CLK_SI5351 is not set
> >># CONFIG_COMMON_CLK_CDCE706 is not set
> >>CONFIG_COMMON_CLK_CS2000_CP=3Dy
> >>CONFIG_COMMON_CLK_S2MPS11=3Dy
> >># CONFIG_CLK_TWL6040 is not set
> >># CONFIG_COMMON_CLK_NXP is not set
> >># CONFIG_COMMON_CLK_PWM is not set
> >># CONFIG_COMMON_CLK_PXA is not set
> >># CONFIG_COMMON_CLK_PIC32 is not set
> >>
> >>#
> >># Hardware Spinlock drivers
> >>#
> >>
> >>#
> >># Clock Source drivers
> >>#
> >>CONFIG_CLKEVT_I8253=3Dy
> >>CONFIG_I8253_LOCK=3Dy
> >>CONFIG_CLKBLD_I8253=3Dy
> >># CONFIG_ATMEL_PIT is not set
> >># CONFIG_SH_TIMER_CMT is not set
> >># CONFIG_SH_TIMER_MTU2 is not set
> >># CONFIG_SH_TIMER_TMU is not set
> >># CONFIG_EM_TIMER_STI is not set
> >>CONFIG_MAILBOX=3Dy
> >># CONFIG_PCC is not set
> >>CONFIG_ALTERA_MBOX=3Dy
> >>CONFIG_IOMMU_SUPPORT=3Dy
> >>
> >>#
> >># Generic IOMMU Pagetable Support
> >>#
> >># CONFIG_AMD_IOMMU is not set
> >>CONFIG_DMAR_TABLE=3Dy
> >># CONFIG_INTEL_IOMMU is not set
> >>CONFIG_IRQ_REMAP=3Dy
> >>
> >>#
> >># Remoteproc drivers
> >>#
> >>CONFIG_REMOTEPROC=3Dy
> >>
> >>#
> >># Rpmsg drivers
> >>#
> >>
> >>#
> >># SOC (System On Chip) specific Drivers
> >>#
> >>
> >>#
> >># Broadcom SoC drivers
> >>#
> >>
> >>#
> >># i.MX SoC drivers
> >>#
> >># CONFIG_SUNXI_SRAM is not set
> >>CONFIG_SOC_TI=3Dy
> >># CONFIG_SOC_ZTE is not set
> >># CONFIG_PM_DEVFREQ is not set
> >>CONFIG_EXTCON=3Dy
> >>
> >>#
> >># Extcon Device Drivers
> >>#
> >>CONFIG_EXTCON_ADC_JACK=3Dy
> >>CONFIG_EXTCON_GPIO=3Dy
> >>CONFIG_EXTCON_INTEL_INT3496=3Dy
> >>CONFIG_EXTCON_MAX3355=3Dy
> >>CONFIG_EXTCON_MAX77693=3Dy
> >># CONFIG_EXTCON_QCOM_SPMI_MISC is not set
> >>CONFIG_EXTCON_RT8973A=3Dy
> >>CONFIG_EXTCON_SM5502=3Dy
> >>CONFIG_EXTCON_USB_GPIO=3Dy
> >>CONFIG_MEMORY=3Dy
> >>CONFIG_IIO=3Dy
> >>CONFIG_IIO_BUFFER=3Dy
> >>CONFIG_IIO_BUFFER_CB=3Dy
> >>CONFIG_IIO_KFIFO_BUF=3Dy
> >>CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> >>CONFIG_IIO_CONFIGFS=3Dy
> >>CONFIG_IIO_TRIGGER=3Dy
> >>CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> >>CONFIG_IIO_SW_DEVICE=3Dy
> >># CONFIG_IIO_SW_TRIGGER is not set
> >>CONFIG_IIO_TRIGGERED_EVENT=3Dy
> >>
> >>#
> >># Accelerometers
> >>#
> >># CONFIG_BMA180 is not set
> >>CONFIG_BMA220=3Dy
> >>CONFIG_BMC150_ACCEL=3Dy
> >>CONFIG_BMC150_ACCEL_I2C=3Dy
> >>CONFIG_BMC150_ACCEL_SPI=3Dy
> >>CONFIG_DA280=3Dy
> >># CONFIG_DA311 is not set
> >># CONFIG_DMARD09 is not set
> >>CONFIG_DMARD10=3Dy
> >># CONFIG_HID_SENSOR_ACCEL_3D is not set
> >>CONFIG_KXSD9=3Dy
> >># CONFIG_KXSD9_SPI is not set
> >>CONFIG_KXSD9_I2C=3Dy
> >>CONFIG_KXCJK1013=3Dy
> >>CONFIG_MC3230=3Dy
> >># CONFIG_MMA7455_I2C is not set
> >># CONFIG_MMA7455_SPI is not set
> >># CONFIG_MMA7660 is not set
> >>CONFIG_MMA8452=3Dy
> >>CONFIG_MMA9551_CORE=3Dy
> >>CONFIG_MMA9551=3Dy
> >># CONFIG_MMA9553 is not set
> >>CONFIG_MXC4005=3Dy
> >># CONFIG_MXC6255 is not set
> >>CONFIG_SCA3000=3Dy
> >>CONFIG_STK8312=3Dy
> >>CONFIG_STK8BA50=3Dy
> >>
> >>#
> >># Analog to digital converters
> >>#
> >>CONFIG_AD_SIGMA_DELTA=3Dy
> >>CONFIG_AD7266=3Dy
> >># CONFIG_AD7291 is not set
> >>CONFIG_AD7298=3Dy
> >>CONFIG_AD7476=3Dy
> >># CONFIG_AD7766 is not set
> >>CONFIG_AD7791=3Dy
> >># CONFIG_AD7793 is not set
> >>CONFIG_AD7887=3Dy
> >># CONFIG_AD7923 is not set
> >># CONFIG_AD799X is not set
> >>CONFIG_AXP20X_ADC=3Dy
> >># CONFIG_AXP288_ADC is not set
> >># CONFIG_CC10001_ADC is not set
> >>CONFIG_DA9150_GPADC=3Dy
> >>CONFIG_HI8435=3Dy
> >># CONFIG_HX711 is not set
> >>CONFIG_LTC2485=3Dy
> >># CONFIG_LTC2497 is not set
> >>CONFIG_MAX1027=3Dy
> >># CONFIG_MAX11100 is not set
> >>CONFIG_MAX1118=3Dy
> >># CONFIG_MAX1363 is not set
> >>CONFIG_MAX9611=3Dy
> >>CONFIG_MCP320X=3Dy
> >>CONFIG_MCP3422=3Dy
> >>CONFIG_MEN_Z188_ADC=3Dy
> >>CONFIG_NAU7802=3Dy
> >>CONFIG_TI_ADC081C=3Dy
> >>CONFIG_TI_ADC0832=3Dy
> >># CONFIG_TI_ADC12138 is not set
> >>CONFIG_TI_ADC128S052=3Dy
> >># CONFIG_TI_ADC161S626 is not set
> >>CONFIG_TI_ADS7950=3Dy
> >>CONFIG_TI_AM335X_ADC=3Dy
> >>CONFIG_TI_TLC4541=3Dy
> >>CONFIG_TWL4030_MADC=3Dy
> >>CONFIG_TWL6030_GPADC=3Dy
> >>
> >>#
> >># Amplifiers
> >>#
> >>CONFIG_AD8366=3Dy
> >>
> >>#
> >># Chemical Sensors
> >>#
> >># CONFIG_ATLAS_PH_SENSOR is not set
> >>CONFIG_IAQCORE=3Dy
> >>CONFIG_VZ89X=3Dy
> >>CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dy
> >># CONFIG_IIO_CROS_EC_SENSORS is not set
> >>
> >>#
> >># Hid Sensor IIO Common
> >>#
> >>CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> >>CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> >>CONFIG_IIO_MS_SENSORS_I2C=3Dy
> >>
> >>#
> >># SSP Sensor Common
> >>#
> >># CONFIG_IIO_SSP_SENSORS_COMMONS is not set
> >>CONFIG_IIO_SSP_SENSORHUB=3Dy
> >>CONFIG_IIO_ST_SENSORS_I2C=3Dy
> >>CONFIG_IIO_ST_SENSORS_SPI=3Dy
> >>CONFIG_IIO_ST_SENSORS_CORE=3Dy
> >>
> >>#
> >># Counters
> >>#
> >>
> >>#
> >># Digital to analog converters
> >>#
> >>CONFIG_AD5064=3Dy
> >>CONFIG_AD5360=3Dy
> >>CONFIG_AD5380=3Dy
> >>CONFIG_AD5421=3Dy
> >>CONFIG_AD5446=3Dy
> >>CONFIG_AD5449=3Dy
> >>CONFIG_AD5592R_BASE=3Dy
> >>CONFIG_AD5592R=3Dy
> >>CONFIG_AD5593R=3Dy
> >># CONFIG_AD5504 is not set
> >># CONFIG_AD5624R_SPI is not set
> >>CONFIG_LTC2632=3Dy
> >>CONFIG_AD5686=3Dy
> >>CONFIG_AD5755=3Dy
> >>CONFIG_AD5761=3Dy
> >>CONFIG_AD5764=3Dy
> >>CONFIG_AD5791=3Dy
> >>CONFIG_AD7303=3Dy
> >>CONFIG_AD8801=3Dy
> >>CONFIG_M62332=3Dy
> >>CONFIG_MAX517=3Dy
> >># CONFIG_MCP4725 is not set
> >>CONFIG_MCP4922=3Dy
> >>
> >>#
> >># IIO dummy driver
> >>#
> >>CONFIG_IIO_SIMPLE_DUMMY=3Dy
> >># CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> >>CONFIG_IIO_SIMPLE_DUMMY_BUFFER=3Dy
> >>
> >>#
> >># Frequency Synthesizers DDS/PLL
> >>#
> >>
> >>#
> >># Clock Generator/Distribution
> >>#
> >>CONFIG_AD9523=3Dy
> >>
> >>#
> >># Phase-Locked Loop (PLL) frequency synthesizers
> >>#
> >>CONFIG_ADF4350=3Dy
> >>
> >>#
> >># Digital gyroscope sensors
> >>#
> >>CONFIG_ADIS16080=3Dy
> >># CONFIG_ADIS16130 is not set
> >># CONFIG_ADIS16136 is not set
> >>CONFIG_ADIS16260=3Dy
> >>CONFIG_ADXRS450=3Dy
> >>CONFIG_BMG160=3Dy
> >>CONFIG_BMG160_I2C=3Dy
> >>CONFIG_BMG160_SPI=3Dy
> >>CONFIG_HID_SENSOR_GYRO_3D=3Dy
> >>CONFIG_MPU3050=3Dy
> >>CONFIG_MPU3050_I2C=3Dy
> >># CONFIG_IIO_ST_GYRO_3AXIS is not set
> >># CONFIG_ITG3200 is not set
> >>
> >>#
> >># Health Sensors
> >>#
> >>
> >>#
> >># Heart Rate Monitors
> >>#
> >>CONFIG_AFE4403=3Dy
> >># CONFIG_AFE4404 is not set
> >># CONFIG_MAX30100 is not set
> >># CONFIG_MAX30102 is not set
> >>
> >>#
> >># Humidity sensors
> >>#
> >>CONFIG_AM2315=3Dy
> >>CONFIG_DHT11=3Dy
> >>CONFIG_HDC100X=3Dy
> >># CONFIG_HID_SENSOR_HUMIDITY is not set
> >>CONFIG_HTS221=3Dy
> >>CONFIG_HTS221_I2C=3Dy
> >>CONFIG_HTS221_SPI=3Dy
> >># CONFIG_HTU21 is not set
> >>CONFIG_SI7005=3Dy
> >># CONFIG_SI7020 is not set
> >>
> >>#
> >># Inertial measurement units
> >>#
> >>CONFIG_ADIS16400=3Dy
> >>CONFIG_ADIS16480=3Dy
> >>CONFIG_BMI160=3Dy
> >>CONFIG_BMI160_I2C=3Dy
> >>CONFIG_BMI160_SPI=3Dy
> >>CONFIG_KMX61=3Dy
> >>CONFIG_INV_MPU6050_IIO=3Dy
> >>CONFIG_INV_MPU6050_I2C=3Dy
> >>CONFIG_INV_MPU6050_SPI=3Dy
> >>CONFIG_IIO_ST_LSM6DSX=3Dy
> >>CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
> >>CONFIG_IIO_ST_LSM6DSX_SPI=3Dy
> >>CONFIG_IIO_ADIS_LIB=3Dy
> >>CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> >>
> >>#
> >># Light sensors
> >>#
> >>CONFIG_ACPI_ALS=3Dy
> >># CONFIG_ADJD_S311 is not set
> >>CONFIG_AL3320A=3Dy
> >>CONFIG_APDS9300=3Dy
> >>CONFIG_APDS9960=3Dy
> >># CONFIG_BH1750 is not set
> >>CONFIG_BH1780=3Dy
> >>CONFIG_CM32181=3Dy
> >># CONFIG_CM3232 is not set
> >># CONFIG_CM3323 is not set
> >># CONFIG_CM36651 is not set
> >>CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dy
> >>CONFIG_GP2AP020A00F=3Dy
> >>CONFIG_SENSORS_ISL29018=3Dy
> >>CONFIG_ISL29125=3Dy
> >>CONFIG_HID_SENSOR_ALS=3Dy
> >>CONFIG_HID_SENSOR_PROX=3Dy
> >># CONFIG_JSA1212 is not set
> >>CONFIG_RPR0521=3Dy
> >># CONFIG_SENSORS_LM3533 is not set
> >>CONFIG_LTR501=3Dy
> >># CONFIG_MAX44000 is not set
> >>CONFIG_OPT3001=3Dy
> >>CONFIG_PA12203001=3Dy
> >>CONFIG_SI1145=3Dy
> >>CONFIG_STK3310=3Dy
> >>CONFIG_TCS3414=3Dy
> >>CONFIG_TCS3472=3Dy
> >># CONFIG_SENSORS_TSL2563 is not set
> >># CONFIG_TSL2583 is not set
> >>CONFIG_TSL4531=3Dy
> >>CONFIG_US5182D=3Dy
> >>CONFIG_VCNL4000=3Dy
> >>CONFIG_VEML6070=3Dy
> >>CONFIG_VL6180=3Dy
> >>
> >>#
> >># Magnetometer sensors
> >>#
> >>CONFIG_AK8975=3Dy
> >># CONFIG_AK09911 is not set
> >>CONFIG_BMC150_MAGN=3Dy
> >>CONFIG_BMC150_MAGN_I2C=3Dy
> >>CONFIG_BMC150_MAGN_SPI=3Dy
> >>CONFIG_MAG3110=3Dy
> >># CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
> >># CONFIG_MMC35240 is not set
> >>CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> >>CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> >>CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> >># CONFIG_SENSORS_HMC5843_I2C is not set
> >># CONFIG_SENSORS_HMC5843_SPI is not set
> >>
> >>#
> >># Inclinometer sensors
> >>#
> >>CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dy
> >># CONFIG_HID_SENSOR_DEVICE_ROTATION is not set
> >>
> >>#
> >># Triggers - standalone
> >>#
> >>CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> >># CONFIG_IIO_SYSFS_TRIGGER is not set
> >>
> >>#
> >># Digital potentiometers
> >>#
> >>CONFIG_DS1803=3Dy
> >>CONFIG_MAX5481=3Dy
> >>CONFIG_MAX5487=3Dy
> >>CONFIG_MCP4131=3Dy
> >>CONFIG_MCP4531=3Dy
> >>CONFIG_TPL0102=3Dy
> >>
> >>#
> >># Digital potentiostats
> >>#
> >>CONFIG_LMP91000=3Dy
> >>
> >>#
> >># Pressure sensors
> >>#
> >># CONFIG_ABP060MG is not set
> >>CONFIG_BMP280=3Dy
> >>CONFIG_BMP280_I2C=3Dy
> >>CONFIG_BMP280_SPI=3Dy
> >>CONFIG_IIO_CROS_EC_BARO=3Dy
> >># CONFIG_HID_SENSOR_PRESS is not set
> >>CONFIG_HP03=3Dy
> >>CONFIG_MPL115=3Dy
> >>CONFIG_MPL115_I2C=3Dy
> >>CONFIG_MPL115_SPI=3Dy
> >># CONFIG_MPL3115 is not set
> >>CONFIG_MS5611=3Dy
> >># CONFIG_MS5611_I2C is not set
> >># CONFIG_MS5611_SPI is not set
> >>CONFIG_MS5637=3Dy
> >>CONFIG_IIO_ST_PRESS=3Dy
> >>CONFIG_IIO_ST_PRESS_I2C=3Dy
> >>CONFIG_IIO_ST_PRESS_SPI=3Dy
> >>CONFIG_T5403=3Dy
> >>CONFIG_HP206C=3Dy
> >>CONFIG_ZPA2326=3Dy
> >>CONFIG_ZPA2326_I2C=3Dy
> >>CONFIG_ZPA2326_SPI=3Dy
> >>
> >>#
> >># Lightning sensors
> >>#
> >>CONFIG_AS3935=3Dy
> >>
> >>#
> >># Proximity and distance sensors
> >>#
> >>CONFIG_LIDAR_LITE_V2=3Dy
> >>CONFIG_SRF04=3Dy
> >># CONFIG_SX9500 is not set
> >># CONFIG_SRF08 is not set
> >>
> >>#
> >># Temperature sensors
> >>#
> >>CONFIG_MAXIM_THERMOCOUPLE=3Dy
> >>CONFIG_HID_SENSOR_TEMP=3Dy
> >># CONFIG_MLX90614 is not set
> >>CONFIG_TMP006=3Dy
> >>CONFIG_TMP007=3Dy
> >>CONFIG_TSYS01=3Dy
> >>CONFIG_TSYS02D=3Dy
> >>CONFIG_NTB=3Dy
> >>CONFIG_NTB_AMD=3Dy
> >>CONFIG_NTB_INTEL=3Dy
> >>CONFIG_NTB_PINGPONG=3Dy
> >>CONFIG_NTB_TOOL=3Dy
> >>CONFIG_NTB_PERF=3Dy
> >>CONFIG_NTB_TRANSPORT=3Dy
> >># CONFIG_VME_BUS is not set
> >>CONFIG_PWM=3Dy
> >>CONFIG_PWM_SYSFS=3Dy
> >># CONFIG_PWM_CROS_EC is not set
> >>CONFIG_PWM_LPSS=3Dy
> >>CONFIG_PWM_LPSS_PCI=3Dy
> >># CONFIG_PWM_LPSS_PLATFORM is not set
> >>CONFIG_PWM_PCA9685=3Dy
> >>CONFIG_PWM_TWL=3Dy
> >>CONFIG_PWM_TWL_LED=3Dy
> >>CONFIG_ARM_GIC_MAX_NR=3D1
> >>CONFIG_IPACK_BUS=3Dy
> >># CONFIG_BOARD_TPCI200 is not set
> >>CONFIG_SERIAL_IPOCTAL=3Dy
> >>CONFIG_RESET_CONTROLLER=3Dy
> >># CONFIG_RESET_ATH79 is not set
> >># CONFIG_RESET_BERLIN is not set
> >># CONFIG_RESET_IMX7 is not set
> >># CONFIG_RESET_LPC18XX is not set
> >># CONFIG_RESET_MESON is not set
> >># CONFIG_RESET_PISTACHIO is not set
> >># CONFIG_RESET_SOCFPGA is not set
> >># CONFIG_RESET_STM32 is not set
> >># CONFIG_RESET_SUNXI is not set
> >># CONFIG_TI_SYSCON_RESET is not set
> >># CONFIG_RESET_ZYNQ is not set
> >># CONFIG_RESET_TEGRA_BPMP is not set
> >>CONFIG_FMC=3Dy
> >># CONFIG_FMC_FAKEDEV is not set
> >>CONFIG_FMC_TRIVIAL=3Dy
> >>CONFIG_FMC_WRITE_EEPROM=3Dy
> >>CONFIG_FMC_CHARDEV=3Dy
> >>
> >>#
> >># PHY Subsystem
> >>#
> >>CONFIG_GENERIC_PHY=3Dy
> >>CONFIG_PHY_PXA_28NM_HSIC=3Dy
> >>CONFIG_PHY_PXA_28NM_USB2=3Dy
> >>CONFIG_BCM_KONA_USB2_PHY=3Dy
> >>CONFIG_POWERCAP=3Dy
> >>CONFIG_INTEL_RAPL=3Dy
> >>CONFIG_MCB=3Dy
> >>CONFIG_MCB_PCI=3Dy
> >>CONFIG_MCB_LPC=3Dy
> >>
> >>#
> >># Performance monitor support
> >>#
> >># CONFIG_RAS is not set
> >>CONFIG_THUNDERBOLT=3Dy
> >>
> >>#
> >># Android
> >>#
> >># CONFIG_ANDROID is not set
> >>CONFIG_DAX=3Dy
> >>CONFIG_NVMEM=3Dy
> >>CONFIG_STM=3Dy
> >>CONFIG_STM_DUMMY=3Dy
> >>CONFIG_STM_SOURCE_CONSOLE=3Dy
> >># CONFIG_STM_SOURCE_HEARTBEAT is not set
> >>CONFIG_STM_SOURCE_FTRACE=3Dy
> >>CONFIG_INTEL_TH=3Dy
> >># CONFIG_INTEL_TH_PCI is not set
> >>CONFIG_INTEL_TH_GTH=3Dy
> >>CONFIG_INTEL_TH_STH=3Dy
> >># CONFIG_INTEL_TH_MSU is not set
> >>CONFIG_INTEL_TH_PTI=3Dy
> >>CONFIG_INTEL_TH_DEBUG=3Dy
> >>
> >>#
> >># FPGA Configuration Support
> >>#
> >>CONFIG_FPGA=3Dy
> >>CONFIG_FPGA_MGR_XILINX_SPI=3Dy
> >>CONFIG_ALTERA_PR_IP_CORE=3Dy
> >>
> >>#
> >># FSI support
> >>#
> >>CONFIG_FSI=3Dy
> >>
> >>#
> >># Firmware Drivers
> >>#
> >>CONFIG_EDD=3Dy
> >># CONFIG_EDD_OFF is not set
> >>CONFIG_FIRMWARE_MEMMAP=3Dy
> >>CONFIG_DELL_RBU=3Dy
> >>CONFIG_DCDBAS=3Dy
> >># CONFIG_DMIID is not set
> >>CONFIG_DMI_SYSFS=3Dy
> >>CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> >>CONFIG_ISCSI_IBFT_FIND=3Dy
> >>CONFIG_FW_CFG_SYSFS=3Dy
> >>CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> >>CONFIG_GOOGLE_FIRMWARE=3Dy
> >># CONFIG_GOOGLE_SMI is not set
> >>CONFIG_GOOGLE_COREBOOT_TABLE=3Dy
> >>CONFIG_GOOGLE_COREBOOT_TABLE_ACPI=3Dy
> >>CONFIG_GOOGLE_MEMCONSOLE=3Dy
> >># CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
> >>CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=3Dy
> >>CONFIG_GOOGLE_VPD=3Dy
> >>
> >>#
> >># EFI (Extensible Firmware Interface) Support
> >>#
> >>CONFIG_EFI_VARS=3Dy
> >>CONFIG_EFI_ESRT=3Dy
> >># CONFIG_EFI_VARS_PSTORE is not set
> >># CONFIG_EFI_RUNTIME_MAP is not set
> >># CONFIG_EFI_FAKE_MEMMAP is not set
> >>CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> >>CONFIG_EFI_BOOTLOADER_CONTROL=3Dy
> >>CONFIG_EFI_CAPSULE_LOADER=3Dy
> >>CONFIG_EFI_TEST=3Dy
> >>CONFIG_UEFI_CPER=3Dy
> >># CONFIG_EFI_DEV_PATH_PARSER is not set
> >>
> >>#
> >># Tegra firmware driver
> >>#
> >>
> >>#
> >># File systems
> >>#
> >>CONFIG_DCACHE_WORD_ACCESS=3Dy
> >># CONFIG_FS_POSIX_ACL is not set
> >>CONFIG_EXPORTFS=3Dy
> >># CONFIG_EXPORTFS_BLOCK_OPS is not set
> >>CONFIG_FILE_LOCKING=3Dy
> >>CONFIG_MANDATORY_FILE_LOCKING=3Dy
> >># CONFIG_FS_ENCRYPTION is not set
> >>CONFIG_FSNOTIFY=3Dy
> >>CONFIG_DNOTIFY=3Dy
> >>CONFIG_INOTIFY_USER=3Dy
> >># CONFIG_FANOTIFY is not set
> >>CONFIG_QUOTA=3Dy
> >># CONFIG_QUOTA_NETLINK_INTERFACE is not set
> >># CONFIG_PRINT_QUOTA_WARNING is not set
> >># CONFIG_QUOTA_DEBUG is not set
> >>CONFIG_QFMT_V1=3Dy
> >># CONFIG_QFMT_V2 is not set
> >>CONFIG_QUOTACTL=3Dy
> >>CONFIG_QUOTACTL_COMPAT=3Dy
> >>CONFIG_AUTOFS4_FS=3Dy
> >># CONFIG_FUSE_FS is not set
> >>CONFIG_OVERLAY_FS=3Dy
> >>CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> >>
> >>#
> >># Caches
> >>#
> >># CONFIG_FSCACHE is not set
> >>
> >>#
> >># Pseudo filesystems
> >>#
> >>CONFIG_PROC_FS=3Dy
> >># CONFIG_PROC_KCORE is not set
> >>CONFIG_PROC_SYSCTL=3Dy
> >>CONFIG_PROC_PAGE_MONITOR=3Dy
> >>CONFIG_PROC_CHILDREN=3Dy
> >>CONFIG_KERNFS=3Dy
> >>CONFIG_SYSFS=3Dy
> >>CONFIG_TMPFS=3Dy
> >># CONFIG_TMPFS_POSIX_ACL is not set
> >># CONFIG_TMPFS_XATTR is not set
> >>CONFIG_HUGETLBFS=3Dy
> >>CONFIG_HUGETLB_PAGE=3Dy
> >>CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> >>CONFIG_CONFIGFS_FS=3Dy
> >>CONFIG_EFIVAR_FS=3Dy
> >>CONFIG_MISC_FILESYSTEMS=3Dy
> >># CONFIG_ORANGEFS_FS is not set
> >>CONFIG_JFFS2_FS=3Dy
> >>CONFIG_JFFS2_FS_DEBUG=3D0
> >># CONFIG_JFFS2_FS_WRITEBUFFER is not set
> >>CONFIG_JFFS2_SUMMARY=3Dy
> >># CONFIG_JFFS2_FS_XATTR is not set
> >>CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> >># CONFIG_JFFS2_ZLIB is not set
> >>CONFIG_JFFS2_LZO=3Dy
> >>CONFIG_JFFS2_RTIME=3Dy
> >># CONFIG_JFFS2_RUBIN is not set
> >>CONFIG_JFFS2_CMODE_NONE=3Dy
> >># CONFIG_JFFS2_CMODE_PRIORITY is not set
> >># CONFIG_JFFS2_CMODE_SIZE is not set
> >># CONFIG_JFFS2_CMODE_FAVOURLZO is not set
> >>CONFIG_ROMFS_FS=3Dy
> >>CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> >>CONFIG_ROMFS_ON_MTD=3Dy
> >>CONFIG_PSTORE=3Dy
> >># CONFIG_PSTORE_ZLIB_COMPRESS is not set
> >># CONFIG_PSTORE_LZO_COMPRESS is not set
> >>CONFIG_PSTORE_LZ4_COMPRESS=3Dy
> >>CONFIG_PSTORE_CONSOLE=3Dy
> >>CONFIG_PSTORE_PMSG=3Dy
> >>CONFIG_PSTORE_FTRACE=3Dy
> >>CONFIG_PSTORE_RAM=3Dy
> >>CONFIG_NETWORK_FILESYSTEMS=3Dy
> >>CONFIG_NLS=3Dy
> >>CONFIG_NLS_DEFAULT=3D"iso8859-1"
> >>CONFIG_NLS_CODEPAGE_437=3Dy
> >># CONFIG_NLS_CODEPAGE_737 is not set
> >>CONFIG_NLS_CODEPAGE_775=3Dy
> >>CONFIG_NLS_CODEPAGE_850=3Dy
> >>CONFIG_NLS_CODEPAGE_852=3Dy
> >>CONFIG_NLS_CODEPAGE_855=3Dy
> >># CONFIG_NLS_CODEPAGE_857 is not set
> >>CONFIG_NLS_CODEPAGE_860=3Dy
> >>CONFIG_NLS_CODEPAGE_861=3Dy
> >># CONFIG_NLS_CODEPAGE_862 is not set
> >>CONFIG_NLS_CODEPAGE_863=3Dy
> >>CONFIG_NLS_CODEPAGE_864=3Dy
> >>CONFIG_NLS_CODEPAGE_865=3Dy
> >>CONFIG_NLS_CODEPAGE_866=3Dy
> >>CONFIG_NLS_CODEPAGE_869=3Dy
> >># CONFIG_NLS_CODEPAGE_936 is not set
> >>CONFIG_NLS_CODEPAGE_950=3Dy
> >>CONFIG_NLS_CODEPAGE_932=3Dy
> >># CONFIG_NLS_CODEPAGE_949 is not set
> >># CONFIG_NLS_CODEPAGE_874 is not set
> >># CONFIG_NLS_ISO8859_8 is not set
> >>CONFIG_NLS_CODEPAGE_1250=3Dy
> >>CONFIG_NLS_CODEPAGE_1251=3Dy
> >># CONFIG_NLS_ASCII is not set
> >># CONFIG_NLS_ISO8859_1 is not set
> >>CONFIG_NLS_ISO8859_2=3Dy
> >>CONFIG_NLS_ISO8859_3=3Dy
> >>CONFIG_NLS_ISO8859_4=3Dy
> >>CONFIG_NLS_ISO8859_5=3Dy
> >># CONFIG_NLS_ISO8859_6 is not set
> >># CONFIG_NLS_ISO8859_7 is not set
> >># CONFIG_NLS_ISO8859_9 is not set
> >>CONFIG_NLS_ISO8859_13=3Dy
> >># CONFIG_NLS_ISO8859_14 is not set
> >># CONFIG_NLS_ISO8859_15 is not set
> >># CONFIG_NLS_KOI8_R is not set
> >>CONFIG_NLS_KOI8_U=3Dy
> >># CONFIG_NLS_MAC_ROMAN is not set
> >>CONFIG_NLS_MAC_CELTIC=3Dy
> >>CONFIG_NLS_MAC_CENTEURO=3Dy
> >># CONFIG_NLS_MAC_CROATIAN is not set
> >># CONFIG_NLS_MAC_CYRILLIC is not set
> >># CONFIG_NLS_MAC_GAELIC is not set
> >>CONFIG_NLS_MAC_GREEK=3Dy
> >>CONFIG_NLS_MAC_ICELAND=3Dy
> >># CONFIG_NLS_MAC_INUIT is not set
> >>CONFIG_NLS_MAC_ROMANIAN=3Dy
> >># CONFIG_NLS_MAC_TURKISH is not set
> >># CONFIG_NLS_UTF8 is not set
> >>
> >>#
> >># Kernel hacking
> >>#
> >>CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> >>
> >>#
> >># printk and dmesg options
> >>#
> >>CONFIG_PRINTK_TIME=3Dy
> >>CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> >>CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> >>CONFIG_BOOT_PRINTK_DELAY=3Dy
> >>CONFIG_DYNAMIC_DEBUG=3Dy
> >>
> >>#
> >># Compile-time checks and compiler options
> >>#
> >># CONFIG_DEBUG_INFO is not set
> >>CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> >># CONFIG_ENABLE_MUST_CHECK is not set
> >>CONFIG_FRAME_WARN=3D2048
> >># CONFIG_STRIP_ASM_SYMS is not set
> >>CONFIG_READABLE_ASM=3Dy
> >>CONFIG_UNUSED_SYMBOLS=3Dy
> >>CONFIG_PAGE_OWNER=3Dy
> >>CONFIG_DEBUG_FS=3Dy
> >>CONFIG_HEADERS_CHECK=3Dy
> >># CONFIG_DEBUG_SECTION_MISMATCH is not set
> >># CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> >>CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> >>CONFIG_FRAME_POINTER=3Dy
> >>CONFIG_STACK_VALIDATION=3Dy
> >># CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> >>CONFIG_MAGIC_SYSRQ=3Dy
> >>CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> >>CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> >>CONFIG_DEBUG_KERNEL=3Dy
> >>
> >>#
> >># Memory Debugging
> >>#
> >>CONFIG_PAGE_EXTENSION=3Dy
> >>CONFIG_DEBUG_PAGEALLOC=3Dy
> >>CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
> >>CONFIG_PAGE_POISONING=3Dy
> >># CONFIG_PAGE_POISONING_NO_SANITY is not set
> >># CONFIG_PAGE_POISONING_ZERO is not set
> >>CONFIG_DEBUG_PAGE_REF=3Dy
> >># CONFIG_DEBUG_RODATA_TEST is not set
> >># CONFIG_DEBUG_OBJECTS is not set
> >># CONFIG_SLUB_STATS is not set
> >>CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> >># CONFIG_DEBUG_KMEMLEAK is not set
> >># CONFIG_DEBUG_STACK_USAGE is not set
> >>CONFIG_DEBUG_VM=3Dy
> >># CONFIG_DEBUG_VM_VMACACHE is not set
> >># CONFIG_DEBUG_VM_RB is not set
> >>CONFIG_DEBUG_VM_PGFLAGS=3Dy
> >>CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> >># CONFIG_DEBUG_VIRTUAL is not set
> >>CONFIG_DEBUG_MEMORY_INIT=3Dy
> >>CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> >>CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> >>CONFIG_DEBUG_STACKOVERFLOW=3Dy
> >>CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> >>CONFIG_ARCH_HAS_KCOV=3Dy
> >>CONFIG_KCOV=3Dy
> >>CONFIG_KCOV_INSTRUMENT_ALL=3Dy
> >># CONFIG_DEBUG_SHIRQ is not set
> >>
> >>#
> >># Debug Lockups and Hangs
> >>#
> >>CONFIG_LOCKUP_DETECTOR=3Dy
> >>CONFIG_HARDLOCKUP_DETECTOR=3Dy
> >># CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> >>CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
> >># CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> >>CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> >># CONFIG_DETECT_HUNG_TASK is not set
> >># CONFIG_WQ_WATCHDOG is not set
> >>CONFIG_PANIC_ON_OOPS=3Dy
> >>CONFIG_PANIC_ON_OOPS_VALUE=3D1
> >>CONFIG_PANIC_TIMEOUT=3D0
> >>CONFIG_SCHED_DEBUG=3Dy
> >># CONFIG_SCHED_INFO is not set
> >># CONFIG_SCHEDSTATS is not set
> >>CONFIG_SCHED_STACK_END_CHECK=3Dy
> >># CONFIG_DEBUG_TIMEKEEPING is not set
> >>
> >>#
> >># Lock Debugging (spinlocks, mutexes, etc...)
> >>#
> >>CONFIG_DEBUG_RT_MUTEXES=3Dy
> >>CONFIG_DEBUG_SPINLOCK=3Dy
> >>CONFIG_DEBUG_MUTEXES=3Dy
> >># CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> >>CONFIG_DEBUG_LOCK_ALLOC=3Dy
> >># CONFIG_PROVE_LOCKING is not set
> >>CONFIG_LOCKDEP=3Dy
> >># CONFIG_LOCK_STAT is not set
> >>CONFIG_DEBUG_LOCKDEP=3Dy
> >>CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> >>CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> >># CONFIG_LOCK_TORTURE_TEST is not set
> >>CONFIG_WW_MUTEX_SELFTEST=3Dy
> >>CONFIG_TRACE_IRQFLAGS=3Dy
> >>CONFIG_STACKTRACE=3Dy
> >># CONFIG_DEBUG_KOBJECT is not set
> >>CONFIG_DEBUG_BUGVERBOSE=3Dy
> >>CONFIG_DEBUG_LIST=3Dy
> >># CONFIG_DEBUG_PI_LIST is not set
> >># CONFIG_DEBUG_SG is not set
> >>CONFIG_DEBUG_NOTIFIERS=3Dy
> >># CONFIG_DEBUG_CREDENTIALS is not set
> >>
> >>#
> >># RCU Debugging
> >>#
> >># CONFIG_PROVE_RCU is not set
> >># CONFIG_SPARSE_RCU_POINTER is not set
> >>CONFIG_TORTURE_TEST=3Dy
> >>CONFIG_RCU_PERF_TEST=3Dy
> >># CONFIG_RCU_TORTURE_TEST is not set
> >>CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> >>CONFIG_RCU_TRACE=3Dy
> >>CONFIG_RCU_EQS_DEBUG=3Dy
> >># CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> >>CONFIG_CPU_HOTPLUG_STATE_CONTROL=3Dy
> >># CONFIG_NOTIFIER_ERROR_INJECTION is not set
> >>CONFIG_FAULT_INJECTION=3Dy
> >>CONFIG_FAILSLAB=3Dy
> >>CONFIG_FAIL_PAGE_ALLOC=3Dy
> >># CONFIG_FAIL_FUTEX is not set
> >>CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> >># CONFIG_LATENCYTOP is not set
> >>CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> >>CONFIG_NOP_TRACER=3Dy
> >>CONFIG_HAVE_FUNCTION_TRACER=3Dy
> >>CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> >>CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> >>CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> >>CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> >>CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> >>CONFIG_HAVE_FENTRY=3Dy
> >>CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> >>CONFIG_TRACER_MAX_TRACE=3Dy
> >>CONFIG_TRACE_CLOCK=3Dy
> >>CONFIG_RING_BUFFER=3Dy
> >>CONFIG_EVENT_TRACING=3Dy
> >>CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> >>CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> >>CONFIG_TRACING=3Dy
> >>CONFIG_GENERIC_TRACER=3Dy
> >>CONFIG_TRACING_SUPPORT=3Dy
> >>CONFIG_FTRACE=3Dy
> >>CONFIG_FUNCTION_TRACER=3Dy
> >># CONFIG_FUNCTION_GRAPH_TRACER is not set
> >>CONFIG_IRQSOFF_TRACER=3Dy
> >># CONFIG_SCHED_TRACER is not set
> >># CONFIG_HWLAT_TRACER is not set
> >># CONFIG_FTRACE_SYSCALLS is not set
> >>CONFIG_TRACER_SNAPSHOT=3Dy
> >>CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> >>CONFIG_TRACE_BRANCH_PROFILING=3Dy
> >># CONFIG_BRANCH_PROFILE_NONE is not set
> >># CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> >>CONFIG_PROFILE_ALL_BRANCHES=3Dy
> >># CONFIG_BRANCH_TRACER is not set
> >>CONFIG_STACK_TRACER=3Dy
> >># CONFIG_UPROBE_EVENTS is not set
> >># CONFIG_PROBE_EVENTS is not set
> >># CONFIG_DYNAMIC_FTRACE is not set
> >># CONFIG_FUNCTION_PROFILER is not set
> >># CONFIG_FTRACE_STARTUP_TEST is not set
> >># CONFIG_MMIOTRACE is not set
> >>CONFIG_TRACING_MAP=3Dy
> >>CONFIG_HIST_TRIGGERS=3Dy
> >>CONFIG_TRACEPOINT_BENCHMARK=3Dy
> >>CONFIG_RING_BUFFER_BENCHMARK=3Dy
> >># CONFIG_RING_BUFFER_STARTUP_TEST is not set
> >># CONFIG_TRACE_ENUM_MAP_FILE is not set
> >># CONFIG_TRACING_EVENTS_GPIO is not set
> >>
> >>#
> >># Runtime Testing
> >>#
> >># CONFIG_TEST_LIST_SORT is not set
> >>CONFIG_TEST_SORT=3Dy
> >># CONFIG_BACKTRACE_SELF_TEST is not set
> >>CONFIG_RBTREE_TEST=3Dy
> >># CONFIG_ATOMIC64_SELFTEST is not set
> >>CONFIG_TEST_HEXDUMP=3Dy
> >>CONFIG_TEST_STRING_HELPERS=3Dy
> >>CONFIG_TEST_KSTRTOX=3Dy
> >>CONFIG_TEST_PRINTF=3Dy
> >># CONFIG_TEST_BITMAP is not set
> >># CONFIG_TEST_UUID is not set
> >>CONFIG_TEST_RHASHTABLE=3Dy
> >>CONFIG_TEST_HASH=3Dy
> >># CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> >># CONFIG_DMA_API_DEBUG is not set
> >>CONFIG_TEST_FIRMWARE=3Dy
> >>CONFIG_TEST_UDELAY=3Dy
> >># CONFIG_MEMTEST is not set
> >>CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> >># CONFIG_SAMPLES is not set
> >>CONFIG_HAVE_ARCH_KGDB=3Dy
> >># CONFIG_KGDB is not set
> >>CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> >># CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> >>CONFIG_UBSAN=3Dy
> >># CONFIG_UBSAN_SANITIZE_ALL is not set
> >># CONFIG_UBSAN_ALIGNMENT is not set
> >># CONFIG_UBSAN_NULL is not set
> >>CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> >>CONFIG_EARLY_PRINTK_USB=3Dy
> >>CONFIG_X86_VERBOSE_BOOTUP=3Dy
> >>CONFIG_EARLY_PRINTK=3Dy
> >>CONFIG_EARLY_PRINTK_DBGP=3Dy
> >>CONFIG_EARLY_PRINTK_EFI=3Dy
> >># CONFIG_EARLY_PRINTK_USB_XDBC is not set
> >>CONFIG_X86_PTDUMP_CORE=3Dy
> >>CONFIG_X86_PTDUMP=3Dy
> >>CONFIG_EFI_PGT_DUMP=3Dy
> >># CONFIG_DEBUG_WX is not set
> >># CONFIG_DOUBLEFAULT is not set
> >># CONFIG_DEBUG_TLBFLUSH is not set
> >># CONFIG_IOMMU_DEBUG is not set
> >>CONFIG_IOMMU_STRESS=3Dy
> >>CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> >>CONFIG_IO_DELAY_TYPE_0X80=3D0
> >>CONFIG_IO_DELAY_TYPE_0XED=3D1
> >>CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> >>CONFIG_IO_DELAY_TYPE_NONE=3D3
> >># CONFIG_IO_DELAY_0X80 is not set
> >>CONFIG_IO_DELAY_0XED=3Dy
> >># CONFIG_IO_DELAY_UDELAY is not set
> >># CONFIG_IO_DELAY_NONE is not set
> >>CONFIG_DEFAULT_IO_DELAY_TYPE=3D1
> >>CONFIG_DEBUG_BOOT_PARAMS=3Dy
> >># CONFIG_CPA_DEBUG is not set
> >>CONFIG_OPTIMIZE_INLINING=3Dy
> >># CONFIG_DEBUG_ENTRY is not set
> >># CONFIG_DEBUG_NMI_SELFTEST is not set
> >># CONFIG_X86_DEBUG_FPU is not set
> >>CONFIG_PUNIT_ATOM_DEBUG=3Dy
> >>
> >>#
> >># Security options
> >>#
> >># CONFIG_KEYS is not set
> >># CONFIG_SECURITY_DMESG_RESTRICT is not set
> >># CONFIG_SECURITY is not set
> >>CONFIG_SECURITYFS=3Dy
> >>CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> >># CONFIG_HARDENED_USERCOPY is not set
> >>CONFIG_STATIC_USERMODEHELPER=3Dy
> >>CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> >>CONFIG_DEFAULT_SECURITY_DAC=3Dy
> >>CONFIG_DEFAULT_SECURITY=3D""
> >>CONFIG_CRYPTO=3Dy
> >>
> >>#
> >># Crypto core or helper
> >>#
> >>CONFIG_CRYPTO_ALGAPI=3Dy
> >>CONFIG_CRYPTO_ALGAPI2=3Dy
> >>CONFIG_CRYPTO_AEAD=3Dy
> >>CONFIG_CRYPTO_AEAD2=3Dy
> >>CONFIG_CRYPTO_BLKCIPHER=3Dy
> >>CONFIG_CRYPTO_BLKCIPHER2=3Dy
> >>CONFIG_CRYPTO_HASH=3Dy
> >>CONFIG_CRYPTO_HASH2=3Dy
> >>CONFIG_CRYPTO_RNG=3Dy
> >>CONFIG_CRYPTO_RNG2=3Dy
> >>CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> >>CONFIG_CRYPTO_AKCIPHER2=3Dy
> >>CONFIG_CRYPTO_AKCIPHER=3Dy
> >>CONFIG_CRYPTO_KPP2=3Dy
> >>CONFIG_CRYPTO_ACOMP2=3Dy
> >>CONFIG_CRYPTO_RSA=3Dy
> >># CONFIG_CRYPTO_DH is not set
> >># CONFIG_CRYPTO_ECDH is not set
> >>CONFIG_CRYPTO_MANAGER=3Dy
> >>CONFIG_CRYPTO_MANAGER2=3Dy
> >># CONFIG_CRYPTO_USER is not set
> >>CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> >>CONFIG_CRYPTO_GF128MUL=3Dy
> >>CONFIG_CRYPTO_NULL=3Dy
> >>CONFIG_CRYPTO_NULL2=3Dy
> >># CONFIG_CRYPTO_PCRYPT is not set
> >>CONFIG_CRYPTO_WORKQUEUE=3Dy
> >>CONFIG_CRYPTO_CRYPTD=3Dy
> >>CONFIG_CRYPTO_MCRYPTD=3Dy
> >>CONFIG_CRYPTO_AUTHENC=3Dy
> >>CONFIG_CRYPTO_ABLK_HELPER=3Dy
> >>CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> >>
> >>#
> >># Authenticated Encryption with Associated Data
> >>#
> >>CONFIG_CRYPTO_CCM=3Dy
> >>CONFIG_CRYPTO_GCM=3Dy
> >>CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> >>CONFIG_CRYPTO_SEQIV=3Dy
> >>CONFIG_CRYPTO_ECHAINIV=3Dy
> >>
> >>#
> >># Block modes
> >>#
> >>CONFIG_CRYPTO_CBC=3Dy
> >>CONFIG_CRYPTO_CTR=3Dy
> >>CONFIG_CRYPTO_CTS=3Dy
> >>CONFIG_CRYPTO_ECB=3Dy
> >>CONFIG_CRYPTO_LRW=3Dy
> >>CONFIG_CRYPTO_PCBC=3Dy
> >>CONFIG_CRYPTO_XTS=3Dy
> >># CONFIG_CRYPTO_KEYWRAP is not set
> >>
> >>#
> >># Hash modes
> >>#
> >>CONFIG_CRYPTO_CMAC=3Dy
> >>CONFIG_CRYPTO_HMAC=3Dy
> >># CONFIG_CRYPTO_XCBC is not set
> >># CONFIG_CRYPTO_VMAC is not set
> >>
> >>#
> >># Digest
> >>#
> >>CONFIG_CRYPTO_CRC32C=3Dy
> >>CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> >>CONFIG_CRYPTO_CRC32=3Dy
> >>CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> >>CONFIG_CRYPTO_CRCT10DIF=3Dy
> >>CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dy
> >>CONFIG_CRYPTO_GHASH=3Dy
> >>CONFIG_CRYPTO_POLY1305=3Dy
> >>CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> >>CONFIG_CRYPTO_MD4=3Dy
> >># CONFIG_CRYPTO_MD5 is not set
> >>CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> >># CONFIG_CRYPTO_RMD128 is not set
> >>CONFIG_CRYPTO_RMD160=3Dy
> >>CONFIG_CRYPTO_RMD256=3Dy
> >>CONFIG_CRYPTO_RMD320=3Dy
> >>CONFIG_CRYPTO_SHA1=3Dy
> >># CONFIG_CRYPTO_SHA1_SSSE3 is not set
> >>CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> >># CONFIG_CRYPTO_SHA512_SSSE3 is not set
> >>CONFIG_CRYPTO_SHA1_MB=3Dy
> >>CONFIG_CRYPTO_SHA256_MB=3Dy
> >># CONFIG_CRYPTO_SHA512_MB is not set
> >>CONFIG_CRYPTO_SHA256=3Dy
> >># CONFIG_CRYPTO_SHA512 is not set
> >># CONFIG_CRYPTO_SHA3 is not set
> >>CONFIG_CRYPTO_TGR192=3Dy
> >># CONFIG_CRYPTO_WP512 is not set
> >>CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> >>
> >>#
> >># Ciphers
> >>#
> >>CONFIG_CRYPTO_AES=3Dy
> >># CONFIG_CRYPTO_AES_TI is not set
> >># CONFIG_CRYPTO_AES_X86_64 is not set
> >># CONFIG_CRYPTO_AES_NI_INTEL is not set
> >>CONFIG_CRYPTO_ANUBIS=3Dy
> >>CONFIG_CRYPTO_ARC4=3Dy
> >>CONFIG_CRYPTO_BLOWFISH=3Dy
> >>CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> >># CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> >>CONFIG_CRYPTO_CAMELLIA=3Dy
> >>CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> >>CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> >>CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
> >>CONFIG_CRYPTO_CAST_COMMON=3Dy
> >>CONFIG_CRYPTO_CAST5=3Dy
> >>CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> >>CONFIG_CRYPTO_CAST6=3Dy
> >>CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> >>CONFIG_CRYPTO_DES=3Dy
> >>CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> >># CONFIG_CRYPTO_FCRYPT is not set
> >># CONFIG_CRYPTO_KHAZAD is not set
> >>CONFIG_CRYPTO_SALSA20=3Dy
> >>CONFIG_CRYPTO_SALSA20_X86_64=3Dy
> >>CONFIG_CRYPTO_CHACHA20=3Dy
> >>CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
> >>CONFIG_CRYPTO_SEED=3Dy
> >>CONFIG_CRYPTO_SERPENT=3Dy
> >>CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> >>CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> >>CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
> >>CONFIG_CRYPTO_TEA=3Dy
> >>CONFIG_CRYPTO_TWOFISH=3Dy
> >>CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> >>CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> >>CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> >>CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> >>
> >>#
> >># Compression
> >>#
> >># CONFIG_CRYPTO_DEFLATE is not set
> >>CONFIG_CRYPTO_LZO=3Dy
> >># CONFIG_CRYPTO_842 is not set
> >># CONFIG_CRYPTO_LZ4 is not set
> >>CONFIG_CRYPTO_LZ4HC=3Dy
> >>
> >>#
> >># Random Number Generation
> >>#
> >># CONFIG_CRYPTO_ANSI_CPRNG is not set
> >>CONFIG_CRYPTO_DRBG_MENU=3Dy
> >>CONFIG_CRYPTO_DRBG_HMAC=3Dy
> >># CONFIG_CRYPTO_DRBG_HASH is not set
> >># CONFIG_CRYPTO_DRBG_CTR is not set
> >>CONFIG_CRYPTO_DRBG=3Dy
> >>CONFIG_CRYPTO_JITTERENTROPY=3Dy
> >># CONFIG_CRYPTO_USER_API_HASH is not set
> >># CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> >># CONFIG_CRYPTO_USER_API_RNG is not set
> >># CONFIG_CRYPTO_USER_API_AEAD is not set
> >>CONFIG_CRYPTO_HASH_INFO=3Dy
> >># CONFIG_CRYPTO_HW is not set
> >>
> >>#
> >># Certificates for signature checking
> >>#
> >>CONFIG_HAVE_KVM=3Dy
> >>CONFIG_VIRTUALIZATION=3Dy
> >># CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> >>CONFIG_BINARY_PRINTF=3Dy
> >>
> >>#
> >># Library routines
> >>#
> >>CONFIG_BITREVERSE=3Dy
> >># CONFIG_HAVE_ARCH_BITREVERSE is not set
> >>CONFIG_RATIONAL=3Dy
> >>CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> >>CONFIG_GENERIC_STRNLEN_USER=3Dy
> >>CONFIG_GENERIC_NET_UTILS=3Dy
> >>CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> >>CONFIG_GENERIC_PCI_IOMAP=3Dy
> >>CONFIG_GENERIC_IOMAP=3Dy
> >>CONFIG_GENERIC_IO=3Dy
> >>CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> >>CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> >># CONFIG_CRC_CCITT is not set
> >>CONFIG_CRC16=3Dy
> >>CONFIG_CRC_T10DIF=3Dy
> >>CONFIG_CRC_ITU_T=3Dy
> >>CONFIG_CRC32=3Dy
> >># CONFIG_CRC32_SELFTEST is not set
> >># CONFIG_CRC32_SLICEBY8 is not set
> >># CONFIG_CRC32_SLICEBY4 is not set
> >># CONFIG_CRC32_SARWATE is not set
> >>CONFIG_CRC32_BIT=3Dy
> >># CONFIG_CRC7 is not set
> >># CONFIG_LIBCRC32C is not set
> >>CONFIG_CRC8=3Dy
> >># CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> >>CONFIG_RANDOM32_SELFTEST=3Dy
> >>CONFIG_ZLIB_INFLATE=3Dy
> >>CONFIG_LZO_COMPRESS=3Dy
> >>CONFIG_LZO_DECOMPRESS=3Dy
> >>CONFIG_LZ4_COMPRESS=3Dy
> >>CONFIG_LZ4HC_COMPRESS=3Dy
> >>CONFIG_LZ4_DECOMPRESS=3Dy
> >>CONFIG_XZ_DEC=3Dy
> >>CONFIG_XZ_DEC_X86=3Dy
> >># CONFIG_XZ_DEC_POWERPC is not set
> >># CONFIG_XZ_DEC_IA64 is not set
> >># CONFIG_XZ_DEC_ARM is not set
> >>CONFIG_XZ_DEC_ARMTHUMB=3Dy
> >>CONFIG_XZ_DEC_SPARC=3Dy
> >>CONFIG_XZ_DEC_BCJ=3Dy
> >>CONFIG_XZ_DEC_TEST=3Dy
> >>CONFIG_DECOMPRESS_GZIP=3Dy
> >>CONFIG_DECOMPRESS_LZMA=3Dy
> >>CONFIG_DECOMPRESS_XZ=3Dy
> >>CONFIG_DECOMPRESS_LZO=3Dy
> >>CONFIG_GENERIC_ALLOCATOR=3Dy
> >>CONFIG_REED_SOLOMON=3Dy
> >>CONFIG_REED_SOLOMON_ENC8=3Dy
> >>CONFIG_REED_SOLOMON_DEC8=3Dy
> >>CONFIG_REED_SOLOMON_DEC16=3Dy
> >>CONFIG_BCH=3Dy
> >>CONFIG_BCH_CONST_PARAMS=3Dy
> >>CONFIG_HAS_IOMEM=3Dy
> >>CONFIG_HAS_IOPORT_MAP=3Dy
> >>CONFIG_HAS_DMA=3Dy
> >># CONFIG_DMA_NOOP_OPS is not set
> >># CONFIG_DMA_VIRT_OPS is not set
> >>CONFIG_CHECK_SIGNATURE=3Dy
> >># CONFIG_CPUMASK_OFFSTACK is not set
> >>CONFIG_CPU_RMAP=3Dy
> >>CONFIG_DQL=3Dy
> >>CONFIG_GLOB=3Dy
> >>CONFIG_GLOB_SELFTEST=3Dy
> >>CONFIG_NLATTR=3Dy
> >>CONFIG_CLZ_TAB=3Dy
> >>CONFIG_CORDIC=3Dy
> >>CONFIG_DDR=3Dy
> >># CONFIG_IRQ_POLL is not set
> >>CONFIG_MPILIB=3Dy
> >>CONFIG_UCS2_STRING=3Dy
> >>CONFIG_FONT_SUPPORT=3Dy
> >>CONFIG_FONT_8x16=3Dy
> >>CONFIG_FONT_AUTOSELECT=3Dy
> >># CONFIG_SG_SPLIT is not set
> >># CONFIG_SG_POOL is not set
> >>CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> >>CONFIG_ARCH_HAS_PMEM_API=3Dy
> >>CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
> >>CONFIG_STACKDEPOT=3Dy
> >
> =



--===============6743836696163270312==--

