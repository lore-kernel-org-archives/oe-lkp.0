Content-Type: multipart/mixed; boundary="===============2868711624559570072=="
MIME-Version: 1.0
From: Baoquan He <bhe@redhat.com>
To: lkp@lists.01.org
Subject: Re: 578bf81653 ("mm/compaction: Fix the incorrect hole in .."): kernel BUG at include/linux/page-flags.h:347!
Date: Thu, 28 May 2020 09:48:56 +0800
Message-ID: <20200528014856.GH26955@MiWiFi-R3L-srv>
In-Reply-To: <5ecede45.wD6Dzc7q3tlxhV8E%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2868711624559570072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/28/20 at 05:40am, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Baoquan-He/mm-page_alloc-c-Add-u=
navailable-ranges-into-memblock/20200522-152727

Thanks for LKP team's effort on testing this and report issue.

The patch mentioned in above link is not deliberate one, so I later
decided to discard it. Please feel free to discard it too from LKP's
test.

Thanks again.

> =

> commit 578bf816539db3f314472bf82a070d39949a7f93
> Author:     Baoquan He <bhe@redhat.com>
> AuthorDate: Fri May 22 15:01:14 2020 +0800
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Fri May 22 15:27:46 2020 +0800
> =

>     mm/compaction: Fix the incorrect hole in fast_isolate_freepages()
>     =

>     On 05/21/20 at 08:18pm, Mike Rapoport wrote:
>     > On Thu, May 21, 2020 at 11:52:25PM +0800, Baoquan He wrote:
>     > > On 05/21/20 at 12:26pm, Mike Rapoport wrote:
>     > > > > For this kind of e820 reserved range, it won't be added to me=
mblock allocator.
>     > > > > However, init_unavailable_mem() will initialize to add them i=
nto node 0,
>     > > > > zone 0. Before that commit, later, memmap_init() will add e82=
0 reserved
>     > > > > ranges into the zone where they are contained, because it can=
 pass
>     > > > > the checking of early_pfn_valid() and early_pfn_in_nid(). In =
this case,
>     > > > > the e820 reserved range where fault page 0x2a800000 is locate=
d is added
>     > > > > into DMA32 zone. After that commit, the e820 reserved rgions =
are kept
>     > > > > in node 0, zone 0, since we iterate over memblock regions to =
iniatialize
>     > > > > in memmap_init() instead, their node and zone won't be change=
d.
>     > > >
>     > > > I wonder why woudn't we add the reserved memory to memblock fro=
m the
>     > > > very beginning...
>     > > > I've tried to undestand why this was not done, but I couldn't f=
ind the
>     > > > reasoning behind that.
>     > >
>     > > I have added some explanation when reply to Mel. Please check tha=
t in
>     > > that thread.
>     >
>     > What I meant was that I've tried to find an explanation in the kern=
el logs
>     > for why the reserved areas are not added to memblock.memory on x86.=
 I
>     > didn't mean that the your patch description lacks this explanation =
:)
>     =

>     Ah, I misunderstood it, sorry about that.
>     =

>     >
>     > > As I said, the unavailable range includes firmware reserved range=
s, and
>     > > holes inside one boot memory section, if that boot memory section=
 haves
>     > > useable memory range, and firmware reserved ranges, and holes. Ad=
ding
>     > > them all into memblock seems a little unreasonable, since they ar=
e never
>     > > used by system in memblock, buddy or high level memory allocator.=
 But I
>     > > can see that adding them into memblock may have the same effect a=
s the
>     > > old code which is beofre your your patchset applied. Let's see if=
 Mel or
>     > > other people have some saying. I pesonally would not suggest doin=
g it
>     > > like this though.
>     >
>     > Adding reserved regions to memblock.memory will not have the same e=
ffect
>     > as the old code. We anyway have to initialize struct page for these
>     > areas, but unlike the old code we don't need to run them by the
>     > early_pfn_in_nid() checks and we still get rid the
>     > CONFIG_NODES_SPAN_OTHER_NODES option.
>     =

>     Hmm, I mean adding them to memblock will let us have the same result,
>     they are added into the node, zone where they should be, and marked as
>     reserved, just as the old code did.
>     =

>     Rethink about this, seems adding them into memblock is doable. But
>     we may not need to add them from e820 reserved range, since that will
>     skip hole range which share the same section with usable range, and m=
ay
>     need to change code in different ARCHes. How about this:
>     =

>     We add them into memblock in init_unavailable_range(), memmap_init() =
will
>     add them into the right node and zone, reserve_bootmem_region() will
>     initialize them and mark them as Reserved.
>     =

>     From d019d0f9e7c958542dfcb142f93d07fcce6c7c22 Mon Sep 17 00:00:00 2001
>     From: Baoquan He <bhe@redhat.com>
>     Date: Fri, 22 May 2020 14:36:13 +0800
>     Subject: [PATCH] mm/page_alloc.c: Add unavailable ranges into memblock
>     =

>     These unavailable ranges shares the same section with the usable range
>     in boot memory, e.g the firmware reserved ranges, and holes.
>     =

>     Previously, they are added into node 0, zone 0 in function
>     init_unavailable_range(), and marked as Reserved. Later, in function
>     memmap_init(), they will be added to appropriate node and zone, where
>     they are covered.
>     =

>     However, after the patchset ("mm: rework free_area_init*() funcitons")
>     is applied, we change to iterate over memblock regions. These unavail=
able
>     ranges are skipped, and the node and zone adjustment won't be done any
>     more as the old code did. This cause a crash in compaction which is t=
riggered
>     by VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn)).
>     =

>     So let's add these unavailable ranges into memblock and reserve them
>     in init_unavailable_range() instead. With this change, they will be a=
dded
>     into appropriate node and zone in memmap_init(), and initialized in
>     reserve_bootmem_region() just like any other memblock reserved region=
s.
>     =

>     Signed-off-by: Baoquan He <bhe@redhat.com>
> =

> 051143e160  Merge tag 'apparmor-pr-2020-05-21' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/jj/linux-apparmor
> 578bf81653  mm/compaction: Fix the incorrect hole in fast_isolate_freepag=
es()
> +------------------------------------------+------------+------------+
> |                                          | 051143e160 | 578bf81653 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 30         | 0          |
> | boot_failures                            | 3          | 11         |
> | BUG:kernel_hang_in_test_stage            | 3          |            |
> | kernel_BUG_at_include/linux/page-flags.h | 0          | 11         |
> | invalid_opcode:#[##]                     | 0          | 11         |
> | RIP:reserve_bootmem_region               | 0          | 11         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 11         |
> +------------------------------------------+------------+------------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> [    0.236049] page:ffffea0000000000 is uninitialized and poisoned
> [    0.236055] raw: ffffffffffffffff ffffea0000000008 ffffea0000000008 ff=
ffffffffffffff
> [    0.238230] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [    0.239227] page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page=
))
> [    0.240237] ------------[ cut here ]------------
> [    0.240933] kernel BUG at include/linux/page-flags.h:347!
> [    0.241752] invalid opcode: 0000 [#1] PREEMPT SMP
> [    0.242468] CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-rc6-00075-g5=
78bf816539db #1
> [    0.243611] RIP: 0010:reserve_bootmem_region+0x51/0x7c
> [    0.244374] Code: fb 38 48 03 3d 3e 50 b4 00 48 8d 47 08 48 89 47 08 4=
8 89 47 10 48 8b 07 0f ba e0 10 73 0e 48 c7 c6 61 1e 50 82 e8 87 92 77 ff <=
0f> 0b 48 8b 47 08 a8 01 75 ea 48 83 3f ff 75 0e 48 c7 c6 31 f5 4f
> [    0.247084] RSP: 0000:ffffffff82803ea0 EFLAGS: 00010046
> [    0.247748] RAX: ffffea0000000000 RBX: 0000000000000000 RCX: 000000000=
0000001
> [    0.248751] RDX: 0000000000000000 RSI: 00000000000000cd RDI: ffffea000=
0000000
> [    0.249873] RBP: 0000000000000010 R08: 000000005fe3b8df R09: 000000000=
0000001
> [    0.250927] R10: 0000000000000000 R11: 0000000000000027 R12: ffffffff8=
2803ec0
> [    0.251993] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [    0.253048] FS:  0000000000000000(0000) GS:ffff88823fa00000(0000) knlG=
S:0000000000000000
> [    0.254257] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.255097] CR2: ffff88823ffff000 CR3: 0000000002811001 CR4: 000000000=
00606b0
> [    0.256145] Call Trace:
> [    0.256517]  memblock_free_all+0x67/0x184
> [    0.257110]  mem_init+0x1b/0x94
> [    0.257579]  start_kernel+0x224/0x52b
> [    0.258128]  secondary_startup_64+0xb6/0xc0
> [    0.258771] Modules linked in:
> [    0.259236] random: get_random_bytes called from init_oops_id+0x22/0x3=
1 with crng_init=3D0
> [    0.259241] ---[ end trace 0000000000000000 ]---
> [    0.261118] RIP: 0010:reserve_bootmem_region+0x51/0x7c
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start b5739fd7f1768f1eee893ed650e2d85eeb48f159 9cb1fd0efd19559=
0b828b9b865421ad345a4a145 --
> git bisect  bad 86b8ba66d7a3c3c10d9a1b535a9fe4acb9e36b99  # 20:39  B     =
 0    11   27   0  Merge 'linux-review/Lubomir-Rintel/mfd-Add-ENE-KB3930-Em=
bedded-Controller-driver/20200521-195853' into devel-hourly-2020052707
> git bisect good ead70718c5e74ea7970bc7fdd2bdaf1290577e81  # 22:23  G     =
10     0    2   2  Merge 'linux-review/Kaitao-Cheng/trace-ftrace-fix-maybe-=
uninitialized-compiler-warning/20200523-235608' into devel-hourly-2020052707
> git bisect  bad 0976d92e93b046d9e126442530156a6cb0a41723  # 22:47  B     =
 0    11   27   0  Merge 'linux-review/Chris-Chiu/platform-x86-asus_wmi-Res=
erve-more-space-for-struct-bias_args/20200522-155459' into devel-hourly-202=
0052707
> git bisect  bad 1cf9b0168f9176ec98b5177aa3f9f84e58e5b1b5  # 23:10  B     =
 0    11   27   0  Merge 'linux-review/Chris-Chiu/ALSA-usb-mixer-volume-qui=
rk-for-ESS-Technology-Asus-USB-DAC/20200526-142854' into devel-hourly-20200=
52707
> git bisect  bad 2927a06ea6f919b7cb3222859f127cf61263e1aa  # 23:53  B     =
 0    11   27   0  Merge 'linux-review/Willem-de-Bruijn/net-check-untrusted=
-gso_size-at-kernel-entry/20200526-030906' into devel-hourly-2020052707
> git bisect  bad e279c91abf7f69abaccddedd6ed97965035b20fc  # 00:14  B     =
 0    11   27   0  Merge 'linux-review/Sudhakar-Panneerselvam/vhost-scsi-no=
tify-TCM-about-the-maximum-sg-entries-supported-per-command/20200523-005407=
' into devel-hourly-2020052707
> git bisect good 0feec94b24871235546cb7852bfefc84e11e4f40  # 02:05  G     =
10     0    1   1  Merge 'linux-review/Dinghao-Liu/dmaengine-sprd-Fix-runti=
me-PM-imbalance-on-error/20200522-145623' into devel-hourly-2020052707
> git bisect good 8b2a3c97d338f651a69177b9f8c148c65a98f6fd  # 02:34  G     =
10     0    0   0  Merge 'skn/soc_custom_attr' into devel-hourly-2020052707
> git bisect  bad f144e69d1ccadb7cfded5782c787f4e1f760fd0c  # 02:59  B     =
 0    11   27   0  Merge 'linux-review/Baoquan-He/mm-page_alloc-c-Add-unava=
ilable-ranges-into-memblock/20200522-152727' into devel-hourly-2020052707
> git bisect  bad 578bf816539db3f314472bf82a070d39949a7f93  # 03:33  B     =
 0    11   27   0  mm/compaction: Fix the incorrect hole in fast_isolate_fr=
eepages()
> # first bad commit: [578bf816539db3f314472bf82a070d39949a7f93] mm/compact=
ion: Fix the incorrect hole in fast_isolate_freepages()
> git bisect good 051143e1602d90ea71887d92363edd539d411de5  # 03:50  G     =
30     0    0   0  Merge tag 'apparmor-pr-2020-05-21' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/jj/linux-apparmor
> # extra tests with debug options
> git bisect  bad 578bf816539db3f314472bf82a070d39949a7f93  # 04:08  B     =
 0    11   27   0  mm/compaction: Fix the incorrect hole in fast_isolate_fr=
eepages()
> # extra tests on head commit of linux-review/Baoquan-He/mm-page_alloc-c-A=
dd-unavailable-ranges-into-memblock/20200522-152727
> git bisect  bad 578bf816539db3f314472bf82a070d39949a7f93  # 04:52  B     =
 0    11   27   0  mm/compaction: Fix the incorrect hole in fast_isolate_fr=
eepages()
> # bad: [578bf816539db3f314472bf82a070d39949a7f93] mm/compaction: Fix the =
incorrect hole in fast_isolate_freepages()
> # extra tests on revert first bad commit
> git bisect good 44dec8343b8e627ae77a3363658e54e3fc41cb7b  # 05:39  G     =
11     0    1   1  Revert "mm/compaction: Fix the incorrect hole in fast_is=
olate_freepages()"
> # good: [44dec8343b8e627ae77a3363658e54e3fc41cb7b] Revert "mm/compaction:=
 Fix the incorrect hole in fast_isolate_freepages()"
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org



> #!/bin/bash
> =

> kernel=3D$1
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep,+smap
> 	-kernel $kernel
> 	-m 8192
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	root=3D/dev/ram0
> 	hung_task_panic=3D1
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> 	console=3Dtty0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	vga=3Dnormal
> 	rw
> 	rcuperf.shutdown=3D0
> 	watchdog_thresh=3D60
> )
> =

> "${kvm[@]}" -append "${append[*]}"


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.7.0-rc6 Kernel Configuration
> #
> =

> #
> # Compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> #
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_LD_VERSION=3D234000000
> CONFIG_CLANG_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
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
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
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
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> CONFIG_CONTEXT_TRACKING_FORCE=3Dy
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> =

> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_PREEMPTION=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> # CONFIG_SCHED_THERMAL_PRESSURE is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FAST_NO_HZ is not set
> # CONFIG_RCU_BOOST is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> # CONFIG_NUMA_BALANCING is not set
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_HUGETLB is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_BPF=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> CONFIG_RD_LZMA=3Dy
> # CONFIG_RD_XZ is not set
> CONFIG_RD_LZO=3Dy
> # CONFIG_RD_LZ4 is not set
> # CONFIG_BOOT_CONFIG is not set
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> # CONFIG_EVENTFD is not set
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_LSM is not set
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> # CONFIG_BPF_JIT_ALWAYS_ON is not set
> CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_DEBUG_RSEQ is not set
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

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
> CONFIG_X86_CPU_RESCTRL=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_VSMP is not set
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> # CONFIG_IOSF_MBI is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_XXL=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> CONFIG_XEN=3Dy
> CONFIG_XEN_PV=3Dy
> CONFIG_XEN_PV_SMP=3Dy
> CONFIG_XEN_DOM0=3Dy
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_PVHVM_SMP=3Dy
> CONFIG_XEN_512GB=3Dy
> CONFIG_XEN_SAVE_RESTORE=3Dy
> CONFIG_XEN_DEBUG_FS=3Dy
> # CONFIG_XEN_PVH is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> # CONFIG_KVM_DEBUG_FS is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
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
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> # CONFIG_GART_IOMMU is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> # CONFIG_SCHED_MC_PRIO is not set
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> # CONFIG_X86_MCE_INTEL is not set
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dy
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> # end of Performance monitoring
> =

> # CONFIG_X86_16BIT is not set
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> # CONFIG_I8K is not set
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_AMD_MEM_ENCRYPT=3Dy
> # CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
> CONFIG_NUMA=3Dy
> CONFIG_AMD_NUMA=3Dy
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NODES_SPAN_OTHER_NODES=3Dy
> # CONFIG_NUMA_EMU is not set
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> # CONFIG_X86_PMEM_LEGACY is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> CONFIG_X86_INTEL_TSX_MODE_AUTO=3Dy
> CONFIG_EFI=3Dy
> # CONFIG_EFI_STUB is not set
> CONFIG_SECCOMP=3Dy
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> # CONFIG_KEXEC is not set
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> # CONFIG_KEXEC_SIG is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_HOTPLUG_CPU=3Dy
> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> # CONFIG_HIBERNATION is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> CONFIG_PM_ADVANCED_DEBUG=3Dy
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_DPM_WATCHDOG is not set
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> # CONFIG_ENERGY_MODEL is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_LPIT=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_TAD is not set
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_BGRT is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_ACPI_NUMA=3Dy
> # CONFIG_ACPI_HMAT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_DPTF_POWER is not set
> # CONFIG_ACPI_EXTLOG is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_SFI=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> # CONFIG_X86_INTEL_PSTATE is not set
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dy
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_XEN=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_ISA_BUS=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # CONFIG_X86_SYSFB is not set
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> # end of Binary Emulations
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> CONFIG_GOOGLE_FIRMWARE=3Dy
> # CONFIG_GOOGLE_COREBOOT_TABLE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> # CONFIG_EFI_VARS is not set
> CONFIG_EFI_ESRT=3Dy
> CONFIG_EFI_RUNTIME_MAP=3Dy
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> # CONFIG_EFI_CAPSULE_LOADER is not set
> # CONFIG_EFI_TEST is not set
> # CONFIG_EFI_RCI2_TABLE is not set
> # CONFIG_EFI_DISABLE_PCI_DMA is not set
> # end of EFI (Extensible Firmware Interface) Support
> =

> CONFIG_EFI_EARLYCON=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM_WERROR=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_KPROBES=3Dy
> # CONFIG_JUMP_LABEL is not set
> CONFIG_OPTPROBES=3Dy
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_UPROBES=3Dy
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
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
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
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> CONFIG_GCOV_FORMAT_4_7=3Dy
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> # CONFIG_BLK_DEV_BSGLIB is not set
> # CONFIG_BLK_DEV_INTEGRITY is not set
> # CONFIG_BLK_DEV_ZONED is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> # CONFIG_BLK_WBT is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # end of Partition Types
> =

> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_PM=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> # CONFIG_IOSCHED_BFQ is not set
> # end of IO Schedulers
> =

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
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_NEED_MULTIPLE_NODES=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_NUMA_KEEP_MEMINFO=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_COMPACTION=3Dy
> # CONFIG_PAGE_REPORTING is not set
> CONFIG_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
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
> # CONFIG_FRONTSWAP is not set
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> # CONFIG_MEM_SOFT_DIRTY is not set
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> # CONFIG_ZONE_DEVICE is not set
> CONFIG_FRAME_VECTOR=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> CONFIG_PERCPU_STATS=3Dy
> CONFIG_GUP_BENCHMARK=3Dy
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> CONFIG_NET_REDIRECT=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_UNIX_DIAG=3Dy
> CONFIG_TLS=3Dm
> # CONFIG_TLS_DEVICE is not set
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dy
> # CONFIG_XFRM_USER is not set
> # CONFIG_XFRM_INTERFACE is not set
> # CONFIG_XFRM_SUB_POLICY is not set
> CONFIG_XFRM_MIGRATE=3Dy
> # CONFIG_XFRM_STATISTICS is not set
> CONFIG_NET_KEY=3Dy
> # CONFIG_NET_KEY_MIGRATE is not set
> CONFIG_XDP_SOCKETS=3Dy
> # CONFIG_XDP_SOCKETS_DIAG is not set
> CONFIG_INET=3Dy
> # CONFIG_IP_MULTICAST is not set
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> # CONFIG_IP_FIB_TRIE_STATS is not set
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> # CONFIG_IP_ROUTE_MULTIPATH is not set
> # CONFIG_IP_ROUTE_VERBOSE is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> CONFIG_NET_IPIP=3Dy
> CONFIG_NET_IPGRE_DEMUX=3Dy
> CONFIG_NET_IP_TUNNEL=3Dy
> CONFIG_NET_IPGRE=3Dy
> # CONFIG_SYN_COOKIES is not set
> CONFIG_NET_IPVTI=3Dy
> CONFIG_NET_UDP_TUNNEL=3Dy
> CONFIG_NET_FOU=3Dy
> CONFIG_NET_FOU_IP_TUNNELS=3Dy
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TUNNEL=3Dy
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
> # CONFIG_IPV6_ILA is not set
> CONFIG_INET6_TUNNEL=3Dy
> CONFIG_IPV6_VTI=3Dy
> CONFIG_IPV6_SIT=3Dm
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dy
> CONFIG_IPV6_GRE=3Dy
> CONFIG_IPV6_FOU=3Dy
> CONFIG_IPV6_FOU_TUNNEL=3Dy
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> # CONFIG_IPV6_MROUTE is not set
> CONFIG_IPV6_SEG6_LWTUNNEL=3Dy
> # CONFIG_IPV6_SEG6_HMAC is not set
> CONFIG_IPV6_SEG6_BPF=3Dy
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_NETLABEL is not set
> CONFIG_MPTCP=3Dy
> CONFIG_MPTCP_IPV6=3Dy
> # CONFIG_MPTCP_HMAC_TEST is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> # CONFIG_BRIDGE_NETFILTER is not set
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dm
> # CONFIG_NETFILTER_NETLINK_ACCT is not set
> # CONFIG_NETFILTER_NETLINK_QUEUE is not set
> # CONFIG_NETFILTER_NETLINK_LOG is not set
> # CONFIG_NETFILTER_NETLINK_OSF is not set
> CONFIG_NF_CONNTRACK=3Dm
> # CONFIG_NF_LOG_NETDEV is not set
> CONFIG_NF_CONNTRACK_MARK=3Dy
> # CONFIG_NF_CONNTRACK_SECMARK is not set
> CONFIG_NF_CONNTRACK_ZONES=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> # CONFIG_NF_CONNTRACK_EVENTS is not set
> # CONFIG_NF_CONNTRACK_TIMEOUT is not set
> # CONFIG_NF_CONNTRACK_TIMESTAMP is not set
> CONFIG_NF_CONNTRACK_LABELS=3Dy
> CONFIG_NF_CT_PROTO_DCCP=3Dy
> CONFIG_NF_CT_PROTO_SCTP=3Dy
> CONFIG_NF_CT_PROTO_UDPLITE=3Dy
> # CONFIG_NF_CONNTRACK_AMANDA is not set
> # CONFIG_NF_CONNTRACK_FTP is not set
> # CONFIG_NF_CONNTRACK_H323 is not set
> # CONFIG_NF_CONNTRACK_IRC is not set
> # CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
> # CONFIG_NF_CONNTRACK_SNMP is not set
> # CONFIG_NF_CONNTRACK_PPTP is not set
> # CONFIG_NF_CONNTRACK_SANE is not set
> # CONFIG_NF_CONNTRACK_SIP is not set
> # CONFIG_NF_CONNTRACK_TFTP is not set
> CONFIG_NF_CT_NETLINK=3Dm
> CONFIG_NF_NAT=3Dm
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_NAT_MASQUERADE=3Dy
> CONFIG_NF_TABLES=3Dm
> CONFIG_NF_TABLES_INET=3Dy
> CONFIG_NF_TABLES_NETDEV=3Dy
> # CONFIG_NFT_NUMGEN is not set
> # CONFIG_NFT_CT is not set
> CONFIG_NFT_FLOW_OFFLOAD=3Dm
> # CONFIG_NFT_COUNTER is not set
> # CONFIG_NFT_CONNLIMIT is not set
> # CONFIG_NFT_LOG is not set
> # CONFIG_NFT_LIMIT is not set
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dm
> CONFIG_NFT_NAT=3Dm
> # CONFIG_NFT_TUNNEL is not set
> CONFIG_NFT_OBJREF=3Dm
> # CONFIG_NFT_QUOTA is not set
> # CONFIG_NFT_REJECT is not set
> # CONFIG_NFT_COMPAT is not set
> # CONFIG_NFT_HASH is not set
> # CONFIG_NFT_XFRM is not set
> # CONFIG_NFT_SOCKET is not set
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> # CONFIG_NFT_SYNPROXY is not set
> # CONFIG_NF_DUP_NETDEV is not set
> # CONFIG_NFT_DUP_NETDEV is not set
> # CONFIG_NFT_FWD_NETDEV is not set
> CONFIG_NF_FLOW_TABLE_INET=3Dm
> CONFIG_NF_FLOW_TABLE=3Dm
> CONFIG_NETFILTER_XTABLES=3Dm
> =

> #
> # Xtables combined modules
> #
> # CONFIG_NETFILTER_XT_MARK is not set
> # CONFIG_NETFILTER_XT_CONNMARK is not set
> =

> #
> # Xtables targets
> #
> # CONFIG_NETFILTER_XT_TARGET_AUDIT is not set
> # CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
> # CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
> # CONFIG_NETFILTER_XT_TARGET_HMARK is not set
> # CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
> # CONFIG_NETFILTER_XT_TARGET_LOG is not set
> # CONFIG_NETFILTER_XT_TARGET_MARK is not set
> CONFIG_NETFILTER_XT_NAT=3Dm
> # CONFIG_NETFILTER_XT_TARGET_NETMAP is not set
> # CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
> # CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
> # CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
> # CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
> # CONFIG_NETFILTER_XT_TARGET_MASQUERADE is not set
> # CONFIG_NETFILTER_XT_TARGET_TEE is not set
> # CONFIG_NETFILTER_XT_TARGET_SECMARK is not set
> # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
> =

> #
> # Xtables matches
> #
> # CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
> # CONFIG_NETFILTER_XT_MATCH_BPF is not set
> # CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
> # CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
> # CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNLABEL is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
> # CONFIG_NETFILTER_XT_MATCH_CPU is not set
> # CONFIG_NETFILTER_XT_MATCH_DCCP is not set
> # CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
> # CONFIG_NETFILTER_XT_MATCH_DSCP is not set
> # CONFIG_NETFILTER_XT_MATCH_ECN is not set
> # CONFIG_NETFILTER_XT_MATCH_ESP is not set
> # CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_HELPER is not set
> # CONFIG_NETFILTER_XT_MATCH_HL is not set
> # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
> # CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> # CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
> # CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_MAC is not set
> # CONFIG_NETFILTER_XT_MATCH_MARK is not set
> # CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
> # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
> # CONFIG_NETFILTER_XT_MATCH_OSF is not set
> # CONFIG_NETFILTER_XT_MATCH_OWNER is not set
> # CONFIG_NETFILTER_XT_MATCH_POLICY is not set
> # CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
> # CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
> # CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
> # CONFIG_NETFILTER_XT_MATCH_REALM is not set
> # CONFIG_NETFILTER_XT_MATCH_RECENT is not set
> # CONFIG_NETFILTER_XT_MATCH_SCTP is not set
> # CONFIG_NETFILTER_XT_MATCH_SOCKET is not set
> # CONFIG_NETFILTER_XT_MATCH_STATE is not set
> # CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
> # CONFIG_NETFILTER_XT_MATCH_STRING is not set
> # CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # end of Core Netfilter Configuration
> =

> # CONFIG_IP_SET is not set
> # CONFIG_IP_VS is not set
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dm
> # CONFIG_NF_SOCKET_IPV4 is not set
> # CONFIG_NF_TPROXY_IPV4 is not set
> CONFIG_NF_TABLES_IPV4=3Dy
> # CONFIG_NFT_DUP_IPV4 is not set
> # CONFIG_NFT_FIB_IPV4 is not set
> # CONFIG_NF_TABLES_ARP is not set
> CONFIG_NF_FLOW_TABLE_IPV4=3Dm
> # CONFIG_NF_DUP_IPV4 is not set
> # CONFIG_NF_LOG_ARP is not set
> # CONFIG_NF_LOG_IPV4 is not set
> # CONFIG_NF_REJECT_IPV4 is not set
> CONFIG_IP_NF_IPTABLES=3Dm
> # CONFIG_IP_NF_MATCH_AH is not set
> # CONFIG_IP_NF_MATCH_ECN is not set
> # CONFIG_IP_NF_MATCH_TTL is not set
> # CONFIG_IP_NF_FILTER is not set
> # CONFIG_IP_NF_TARGET_SYNPROXY is not set
> CONFIG_IP_NF_NAT=3Dm
> # CONFIG_IP_NF_TARGET_MASQUERADE is not set
> # CONFIG_IP_NF_TARGET_NETMAP is not set
> # CONFIG_IP_NF_TARGET_REDIRECT is not set
> # CONFIG_IP_NF_MANGLE is not set
> # CONFIG_IP_NF_RAW is not set
> # CONFIG_IP_NF_SECURITY is not set
> # CONFIG_IP_NF_ARPTABLES is not set
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> # CONFIG_NF_SOCKET_IPV6 is not set
> # CONFIG_NF_TPROXY_IPV6 is not set
> CONFIG_NF_TABLES_IPV6=3Dy
> # CONFIG_NFT_DUP_IPV6 is not set
> # CONFIG_NFT_FIB_IPV6 is not set
> CONFIG_NF_FLOW_TABLE_IPV6=3Dm
> # CONFIG_NF_DUP_IPV6 is not set
> # CONFIG_NF_REJECT_IPV6 is not set
> # CONFIG_NF_LOG_IPV6 is not set
> CONFIG_IP6_NF_IPTABLES=3Dm
> # CONFIG_IP6_NF_MATCH_AH is not set
> # CONFIG_IP6_NF_MATCH_EUI64 is not set
> # CONFIG_IP6_NF_MATCH_FRAG is not set
> # CONFIG_IP6_NF_MATCH_OPTS is not set
> # CONFIG_IP6_NF_MATCH_HL is not set
> # CONFIG_IP6_NF_MATCH_IPV6HEADER is not set
> # CONFIG_IP6_NF_MATCH_MH is not set
> # CONFIG_IP6_NF_MATCH_RT is not set
> # CONFIG_IP6_NF_MATCH_SRH is not set
> # CONFIG_IP6_NF_FILTER is not set
> # CONFIG_IP6_NF_TARGET_SYNPROXY is not set
> # CONFIG_IP6_NF_MANGLE is not set
> # CONFIG_IP6_NF_RAW is not set
> # CONFIG_IP6_NF_SECURITY is not set
> CONFIG_IP6_NF_NAT=3Dm
> # CONFIG_IP6_NF_TARGET_MASQUERADE is not set
> # CONFIG_IP6_NF_TARGET_NPT is not set
> # end of IPv6: Netfilter Configuration
> =

> CONFIG_NF_DEFRAG_IPV6=3Dm
> =

> #
> # DECnet: Netfilter Configuration
> #
> # CONFIG_DECNET_NF_GRABULATOR is not set
> # end of DECnet: Netfilter Configuration
> =

> # CONFIG_NF_TABLES_BRIDGE is not set
> # CONFIG_NF_CONNTRACK_BRIDGE is not set
> # CONFIG_BRIDGE_NF_EBTABLES is not set
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> CONFIG_ATM=3Dy
> # CONFIG_ATM_CLIP is not set
> CONFIG_ATM_LANE=3Dy
> # CONFIG_ATM_MPOA is not set
> # CONFIG_ATM_BR2684 is not set
> # CONFIG_L2TP is not set
> CONFIG_STP=3Dy
> CONFIG_BRIDGE=3Dy
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> # CONFIG_BRIDGE_VLAN_FILTERING is not set
> CONFIG_HAVE_NET_DSA=3Dy
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dy
> # CONFIG_VLAN_8021Q_GVRP is not set
> # CONFIG_VLAN_8021Q_MVRP is not set
> CONFIG_DECNET=3Dy
> # CONFIG_DECNET_ROUTER is not set
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> CONFIG_LAPB=3Dy
> CONFIG_PHONET=3Dy
> # CONFIG_6LOWPAN is not set
> CONFIG_IEEE802154=3Dy
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=3Dy
> # CONFIG_MAC802154 is not set
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> # CONFIG_NET_SCH_CBQ is not set
> # CONFIG_NET_SCH_HTB is not set
> # CONFIG_NET_SCH_HFSC is not set
> # CONFIG_NET_SCH_ATM is not set
> CONFIG_NET_SCH_PRIO=3Dm
> # CONFIG_NET_SCH_MULTIQ is not set
> # CONFIG_NET_SCH_RED is not set
> # CONFIG_NET_SCH_SFB is not set
> # CONFIG_NET_SCH_SFQ is not set
> # CONFIG_NET_SCH_TEQL is not set
> # CONFIG_NET_SCH_TBF is not set
> # CONFIG_NET_SCH_CBS is not set
> CONFIG_NET_SCH_ETF=3Dm
> # CONFIG_NET_SCH_TAPRIO is not set
> # CONFIG_NET_SCH_GRED is not set
> # CONFIG_NET_SCH_DSMARK is not set
> CONFIG_NET_SCH_NETEM=3Dy
> # CONFIG_NET_SCH_DRR is not set
> # CONFIG_NET_SCH_MQPRIO is not set
> # CONFIG_NET_SCH_SKBPRIO is not set
> # CONFIG_NET_SCH_CHOKE is not set
> # CONFIG_NET_SCH_QFQ is not set
> # CONFIG_NET_SCH_CODEL is not set
> # CONFIG_NET_SCH_FQ_CODEL is not set
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dm
> # CONFIG_NET_SCH_HHF is not set
> # CONFIG_NET_SCH_PIE is not set
> CONFIG_NET_SCH_INGRESS=3Dy
> # CONFIG_NET_SCH_PLUG is not set
> CONFIG_NET_SCH_ETS=3Dm
> # CONFIG_NET_SCH_DEFAULT is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> # CONFIG_NET_CLS_BASIC is not set
> # CONFIG_NET_CLS_TCINDEX is not set
> # CONFIG_NET_CLS_ROUTE4 is not set
> CONFIG_NET_CLS_FW=3Dm
> CONFIG_NET_CLS_U32=3Dm
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> # CONFIG_NET_CLS_RSVP is not set
> # CONFIG_NET_CLS_RSVP6 is not set
> # CONFIG_NET_CLS_FLOW is not set
> # CONFIG_NET_CLS_CGROUP is not set
> CONFIG_NET_CLS_BPF=3Dm
> CONFIG_NET_CLS_FLOWER=3Dm
> # CONFIG_NET_CLS_MATCHALL is not set
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dm
> CONFIG_NET_EMATCH_NBYTE=3Dm
> CONFIG_NET_EMATCH_U32=3Dm
> CONFIG_NET_EMATCH_META=3Dm
> CONFIG_NET_EMATCH_TEXT=3Dm
> CONFIG_NET_EMATCH_CANID=3Dm
> CONFIG_NET_EMATCH_IPT=3Dm
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dm
> CONFIG_NET_ACT_GACT=3Dm
> CONFIG_GACT_PROB=3Dy
> CONFIG_NET_ACT_MIRRED=3Dm
> CONFIG_NET_ACT_SAMPLE=3Dm
> CONFIG_NET_ACT_IPT=3Dm
> CONFIG_NET_ACT_NAT=3Dm
> CONFIG_NET_ACT_PEDIT=3Dm
> CONFIG_NET_ACT_SIMP=3Dm
> CONFIG_NET_ACT_SKBEDIT=3Dm
> CONFIG_NET_ACT_CSUM=3Dm
> CONFIG_NET_ACT_MPLS=3Dm
> CONFIG_NET_ACT_VLAN=3Dm
> CONFIG_NET_ACT_BPF=3Dm
> CONFIG_NET_ACT_CONNMARK=3Dm
> CONFIG_NET_ACT_CTINFO=3Dm
> CONFIG_NET_ACT_SKBMOD=3Dm
> CONFIG_NET_ACT_IFE=3Dm
> CONFIG_NET_ACT_TUNNEL_KEY=3Dm
> CONFIG_NET_ACT_CT=3Dm
> CONFIG_NET_IFE_SKBMARK=3Dm
> CONFIG_NET_IFE_SKBPRIO=3Dm
> CONFIG_NET_IFE_SKBTCINDEX=3Dm
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=3Dy
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> CONFIG_NETLINK_DIAG=3Dy
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dm
> CONFIG_MPLS_ROUTING=3Dm
> CONFIG_MPLS_IPTUNNEL=3Dm
> CONFIG_NET_NSH=3Dy
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> CONFIG_NET_L3_MASTER_DEV=3Dy
> # CONFIG_NET_NCSI is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_BPF_JIT=3Dy
> CONFIG_BPF_STREAM_PARSER=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> CONFIG_NET_DROP_MONITOR=3Dy
> # end of Network testing
> # end of Networking options
> =

> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> # CONFIG_AX25 is not set
> CONFIG_CAN=3Dm
> CONFIG_CAN_RAW=3Dm
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dm
> # CONFIG_CAN_J1939 is not set
> =

> #
> # CAN Device Drivers
> #
> # CONFIG_CAN_VCAN is not set
> # CONFIG_CAN_VXCAN is not set
> # CONFIG_CAN_SLCAN is not set
> CONFIG_CAN_DEV=3Dm
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_KVASER_PCIEFD is not set
> # CONFIG_CAN_C_CAN is not set
> # CONFIG_CAN_CC770 is not set
> # CONFIG_CAN_IFI_CANFD is not set
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_PEAK_PCIEFD is not set
> # CONFIG_CAN_SJA1000 is not set
> # CONFIG_CAN_SOFTING is not set
> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dy
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dy
> # CONFIG_BT_RFCOMM_TTY is not set
> CONFIG_BT_BNEP=3Dy
> # CONFIG_BT_BNEP_MC_FILTER is not set
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dy
> # CONFIG_BT_HS is not set
> # CONFIG_BT_LE is not set
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_SELFTEST is not set
> CONFIG_BT_DEBUGFS=3Dy
> =

> #
> # Bluetooth device drivers
> #
> CONFIG_BT_HCIBTSDIO=3Dy
> # CONFIG_BT_HCIUART is not set
> # CONFIG_BT_HCIVHCI is not set
> CONFIG_BT_MRVL=3Dy
> CONFIG_BT_MRVL_SDIO=3Dy
> # CONFIG_BT_MTKSDIO is not set
> # CONFIG_BT_MTKUART is not set
> # end of Bluetooth device drivers
> =

> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_XEN is not set
> # CONFIG_NET_9P_DEBUG is not set
> CONFIG_CAIF=3Dy
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=3Dy
> CONFIG_CAIF_USB=3Dy
> # CONFIG_CEPH_LIB is not set
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=3Dy
> CONFIG_NET_IFE=3Dy
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_NET_DEVLINK=3Dy
> # CONFIG_FAILOVER is not set
> CONFIG_ETHTOOL_NETLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI controller drivers
> #
> =

> #
> # DesignWare PCI Core Support
> #
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
> CONFIG_PCI_EPF_TEST=3Dy
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> =

> CONFIG_PCCARD=3Dy
> # CONFIG_PCMCIA is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_RAPIDIO is not set
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_WANT_DEV_COREDUMP=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_SYS_HYPERVISOR=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_REGMAP_SCCB=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> # CONFIG_CONNECTOR is not set
> # CONFIG_GNSS is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_TESTS is not set
> =

> #
> # Partition parsers
> #
> CONFIG_MTD_AR7_PARTS=3Dy
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> # end of Partition parsers
> =

> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_BLOCK is not set
> # CONFIG_MTD_BLOCK_RO is not set
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
> # CONFIG_INFTL is not set
> # CONFIG_RFD_FTL is not set
> # CONFIG_SSFDC is not set
> # CONFIG_SM_FTL is not set
> CONFIG_MTD_OOPS=3Dy
> # CONFIG_MTD_SWAP is not set
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> # CONFIG_MTD_ABSENT is not set
> # end of RAM/ROM/Flash chip drivers
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> # CONFIG_MTD_PHYSMAP is not set
> CONFIG_MTD_SBC_GXX=3Dy
> # CONFIG_MTD_PCI is not set
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dy
> # end of Mapping drivers for chip access
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> # CONFIG_MTD_BLOCK2MTD is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> # end of Self-contained MTD device drivers
> =

> CONFIG_MTD_ONENAND=3Dy
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> # CONFIG_MTD_ONENAND_OTP is not set
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> # CONFIG_MTD_RAW_NAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # end of LPDDR & LPDDR2 PCM memory drivers
> =

> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> CONFIG_MTD_UBI_FASTMAP=3Dy
> CONFIG_MTD_UBI_GLUEBI=3Dy
> # CONFIG_MTD_UBI_BLOCK is not set
> # CONFIG_MTD_HYPERBUS is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> # CONFIG_PARPORT_PC is not set
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_BLK_DEV_FD is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> CONFIG_ZRAM=3Dm
> # CONFIG_ZRAM_WRITEBACK is not set
> # CONFIG_ZRAM_MEMORY_TRACKING is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_LOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> # CONFIG_XEN_BLKDEV_BACKEND is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_RBD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_NVME_FC is not set
> # CONFIG_NVME_TARGET is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dy
> # CONFIG_SENSORS_TSL2550 is not set
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> CONFIG_SRAM=3Dy
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> # CONFIG_PVPANIC is not set
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_EEPROM_IDT_89HPESX is not set
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> # CONFIG_SENSORS_LIS3_I2C is not set
> CONFIG_ALTERA_STAPL=3Dy
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC & related support
> #
> # CONFIG_INTEL_MIC_BUS is not set
> # CONFIG_SCIF_BUS is not set
> # CONFIG_VOP_BUS is not set
> # end of Intel MIC & related support
> =

> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> # CONFIG_MISC_RTSX_PCI is not set
> # CONFIG_HABANA_AI is not set
> # end of Misc devices
> =

> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_RAID_ATTRS is not set
> # CONFIG_SCSI is not set
> # end of SCSI device support
> =

> # CONFIG_ATA is not set
> # CONFIG_MD is not set
> # CONFIG_TARGET_CORE is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> CONFIG_DUMMY=3Dy
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> CONFIG_IFB=3Dy
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> CONFIG_VXLAN=3Dy
> CONFIG_GENEVE=3Dy
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> CONFIG_MACSEC=3Dy
> # CONFIG_NETCONSOLE is not set
> CONFIG_TUN=3Dm
> # CONFIG_TUN_VNET_CROSS_LE is not set
> CONFIG_VETH=3Dy
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> CONFIG_NET_VRF=3Dy
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> # CONFIG_CAIF_DRIVERS is not set
> =

> #
> # Distributed Switch Architecture drivers
> #
> # end of Distributed Switch Architecture drivers
> =

> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
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
> CONFIG_NET_VENDOR_AURORA=3Dy
> # CONFIG_AURORA_NB8800 is not set
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
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> # CONFIG_LIQUIDIO is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
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
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_I40E is not set
> # CONFIG_IGC is not set
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
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
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
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
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
> =

> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dy
> CONFIG_XEN_NETDEV_FRONTEND=3Dy
> # CONFIG_XEN_NETDEV_BACKEND is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> CONFIG_NETDEVSIM=3Dm
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
> CONFIG_NVM=3Dy
> # CONFIG_NVM_PBLK is not set
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
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
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
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> CONFIG_JOYSTICK_ANALOG=3Dy
> CONFIG_JOYSTICK_A3D=3Dy
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> CONFIG_JOYSTICK_GF2K=3Dy
> CONFIG_JOYSTICK_GRIP=3Dy
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dy
> # CONFIG_JOYSTICK_IFORCE is not set
> CONFIG_JOYSTICK_WARRIOR=3Dy
> # CONFIG_JOYSTICK_MAGELLAN is not set
> # CONFIG_JOYSTICK_SPACEORB is not set
> # CONFIG_JOYSTICK_SPACEBALL is not set
> CONFIG_JOYSTICK_STINGER=3Dy
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> # CONFIG_JOYSTICK_DB9 is not set
> # CONFIG_JOYSTICK_GAMECON is not set
> CONFIG_JOYSTICK_TURBOGRAFX=3Dy
> # CONFIG_JOYSTICK_AS5011 is not set
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> # CONFIG_JOYSTICK_XPAD is not set
> # CONFIG_JOYSTICK_PXRC is not set
> # CONFIG_JOYSTICK_FSIA6B is not set
> # CONFIG_INPUT_TABLET is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> # CONFIG_TOUCHSCREEN_88PM860X is not set
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> # CONFIG_TOUCHSCREEN_AD7879_I2C is not set
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> # CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
> # CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> # CONFIG_TOUCHSCREEN_BU21029 is not set
> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
> CONFIG_TOUCHSCREEN_DA9034=3Dy
> # CONFIG_TOUCHSCREEN_DA9052 is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> # CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
> # CONFIG_TOUCHSCREEN_EETI is not set
> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> # CONFIG_TOUCHSCREEN_EXC3000 is not set
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> CONFIG_TOUCHSCREEN_GOODIX=3Dy
> # CONFIG_TOUCHSCREEN_HIDEEP is not set
> # CONFIG_TOUCHSCREEN_ILI210X is not set
> # CONFIG_TOUCHSCREEN_S6SY761 is not set
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_EKTF2127=3Dy
> CONFIG_TOUCHSCREEN_ELAN=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dy
> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> # CONFIG_TOUCHSCREEN_MAX11801 is not set
> # CONFIG_TOUCHSCREEN_MCS5000 is not set
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> # CONFIG_TOUCHSCREEN_INEXIO is not set
> # CONFIG_TOUCHSCREEN_MK712 is not set
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> # CONFIG_TOUCHSCREEN_TI_AM335X_TSC is not set
> # CONFIG_TOUCHSCREEN_PIXCIR is not set
> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> # CONFIG_TOUCHSCREEN_MC13783 is not set
> # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> CONFIG_TOUCHSCREEN_TSC2004=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> # CONFIG_TOUCHSCREEN_RM_TS is not set
> CONFIG_TOUCHSCREEN_SILEAD=3Dy
> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
> CONFIG_TOUCHSCREEN_ST1232=3Dy
> # CONFIG_TOUCHSCREEN_STMFTS is not set
> CONFIG_TOUCHSCREEN_SX8654=3Dy
> # CONFIG_TOUCHSCREEN_TPS6507X is not set
> CONFIG_TOUCHSCREEN_ZET6223=3Dy
> # CONFIG_TOUCHSCREEN_ZFORCE is not set
> # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> # CONFIG_TOUCHSCREEN_IQS5XX is not set
> # CONFIG_INPUT_MISC is not set
> # CONFIG_RMI4_CORE is not set
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
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_GPIO_PS2=3Dy
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> CONFIG_SERIAL_8250_DWLIB=3Dy
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
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
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_GOLDFISH_TTY is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> # CONFIG_TRACE_SINK is not set
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> CONFIG_HVC_XEN_FRONTEND=3Dy
> CONFIG_SERIAL_DEV_BUS=3Dy
> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_PRINTER is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_IPMB_DEVICE_INTERFACE is not set
> # CONFIG_HW_RANDOM is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_DEVMEM=3Dy
> CONFIG_DEVKMEM=3Dy
> CONFIG_NVRAM=3Dy
> # CONFIG_RAW_DRIVER is not set
> CONFIG_DEVPORT=3Dy
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_XEN is not set
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_VTPM_PROXY=3Dy
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> CONFIG_TELCLOCK=3Dy
> # CONFIG_XILLYBUS is not set
> # end of Character devices
> =

> # CONFIG_RANDOM_TRUST_CPU is not set
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
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
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_LTC4306=3Dy
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=3Dy
> CONFIG_I2C_MUX_REG=3Dy
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> =

> CONFIG_I2C_HELPER_AUTO=3Dy
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
> # CONFIG_I2C_AMD_MP2 is not set
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> # CONFIG_I2C_ISMT is not set
> # CONFIG_I2C_PIIX4 is not set
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_NVIDIA_GPU is not set
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
> # CONFIG_I2C_CBUS_GPIO is not set
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_MLXCPLD is not set
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
> # CONFIG_HSI is not set
> # CONFIG_PPS is not set
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> =

> # CONFIG_PINCTRL is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> # CONFIG_GPIO_ICH is not set
> CONFIG_GPIO_MB86S7X=3Dy
> CONFIG_GPIO_MENZ127=3Dy
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_XILINX is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> # CONFIG_GPIO_WINBOND is not set
> CONFIG_GPIO_WS16C48=3Dy
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> CONFIG_GPIO_MAX7300=3Dy
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCF857X=3Dy
> CONFIG_GPIO_TPIC2810=3Dy
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=3Dy
> CONFIG_GPIO_BD9571MWV=3Dy
> CONFIG_GPIO_DA9052=3Dy
> CONFIG_GPIO_LP3943=3Dy
> CONFIG_GPIO_LP873X=3Dy
> CONFIG_GPIO_RC5T583=3Dy
> CONFIG_GPIO_TPS65086=3Dy
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_TWL4030=3Dy
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> =

> CONFIG_GPIO_MOCKUP=3Dy
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> # CONFIG_W1_MASTER_DS2482 is not set
> # CONFIG_W1_MASTER_DS1WM is not set
> CONFIG_W1_MASTER_GPIO=3Dy
> # CONFIG_W1_MASTER_SGI is not set
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> # CONFIG_W1_SLAVE_DS2405 is not set
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> # CONFIG_W1_SLAVE_DS2805 is not set
> # CONFIG_W1_SLAVE_DS2430 is not set
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> # CONFIG_W1_SLAVE_DS250X is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
> =

> # CONFIG_POWER_AVS is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=3Dy
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_DS2760 is not set
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_CHARGER_SBS=3Dy
> # CONFIG_MANAGER_SBS is not set
> CONFIG_BATTERY_BQ27XXX=3Dy
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dy
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9052=3Dy
> CONFIG_BATTERY_DA9150=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> CONFIG_BATTERY_MAX1721X=3Dy
> CONFIG_CHARGER_88PM860X=3Dy
> CONFIG_CHARGER_PCF50633=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_MAX14577 is not set
> CONFIG_CHARGER_MAX8998=3Dy
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> CONFIG_CHARGER_TPS65090=3Dy
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_GOLDFISH=3Dy
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dy
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dy
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ASPEED is not set
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dy
> # CONFIG_SENSORS_DS1621 is not set
> # CONFIG_SENSORS_DELL_SMM is not set
> CONFIG_SENSORS_DA9052_ADC=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> # CONFIG_SENSORS_F71882FG is not set
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> # CONFIG_SENSORS_GL520SM is not set
> CONFIG_SENSORS_G760A=3Dy
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_I5500 is not set
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LTC2945=3Dy
> # CONFIG_SENSORS_LTC2947_I2C is not set
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_TC654=3Dy
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> # CONFIG_SENSORS_LM85 is not set
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
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
> # CONFIG_SENSORS_NPCM7XX is not set
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> # CONFIG_SENSORS_PMBUS is not set
> CONFIG_SENSORS_ADM1275=3Dy
> # CONFIG_SENSORS_BEL_PFE is not set
> CONFIG_SENSORS_IBM_CFFPS=3Dy
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> CONFIG_SENSORS_IR35221=3Dy
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX16064=3Dy
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> # CONFIG_SENSORS_MAX34440 is not set
> CONFIG_SENSORS_MAX8688=3Dy
> # CONFIG_SENSORS_PXE1610 is not set
> CONFIG_SENSORS_TPS40422=3Dy
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dy
> # CONFIG_SENSORS_UCD9200 is not set
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=3Dy
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_STTS751=3Dy
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_INA3221=3Dy
> CONFIG_SENSORS_TC74=3Dy
> CONFIG_SENSORS_THMC50=3Dy
> # CONFIG_SENSORS_TMP102 is not set
> # CONFIG_SENSORS_TMP103 is not set
> CONFIG_SENSORS_TMP108=3Dy
> CONFIG_SENSORS_TMP401=3Dy
> # CONFIG_SENSORS_TMP421 is not set
> # CONFIG_SENSORS_TMP513 is not set
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83773G is not set
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> # CONFIG_THERMAL_HWMON is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_CLOCK_THERMAL is not set
> CONFIG_DEVFREQ_THERMAL=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> =

> # CONFIG_INTEL_PCH_THERMAL is not set
> # end of Intel thermal drivers
> =

> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> # CONFIG_BCMA_SFLASH is not set
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dy
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> # CONFIG_MFD_MADERA is not set
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_IQS62X is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77693 is not set
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> CONFIG_PCF50633_GPIO=3Dy
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> # CONFIG_MFD_SMSC is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_TI_LMU=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TI_LP873X=3Dy
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TQMX86 is not set
> # CONFIG_MFD_VX855 is not set
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_RAVE_SP_CORE is not set
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> # CONFIG_REGULATOR_88PG86X is not set
> CONFIG_REGULATOR_88PM800=3Dy
> CONFIG_REGULATOR_88PM8607=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_AXP20X=3Dy
> # CONFIG_REGULATOR_BCM590XX is not set
> # CONFIG_REGULATOR_BD9571MWV is not set
> CONFIG_REGULATOR_DA903X=3Dy
> # CONFIG_REGULATOR_DA9052 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LP3971=3Dy
> # CONFIG_REGULATOR_LP3972 is not set
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP8788=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_LTC3676 is not set
> CONFIG_REGULATOR_MAX14577=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> # CONFIG_REGULATOR_MAX8907 is not set
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX8998=3Dy
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> CONFIG_REGULATOR_MC13892=3Dy
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MT6311=3Dy
> # CONFIG_REGULATOR_PCF50633 is not set
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> # CONFIG_REGULATOR_PV88090 is not set
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> CONFIG_REGULATOR_RC5T583=3Dy
> # CONFIG_REGULATOR_S2MPA01 is not set
> CONFIG_REGULATOR_S2MPS11=3Dy
> CONFIG_REGULATOR_S5M8767=3Dy
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_SLG51000 is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dy
> # CONFIG_REGULATOR_TPS65090 is not set
> # CONFIG_REGULATOR_TPS65132 is not set
> CONFIG_REGULATOR_TPS65910=3Dy
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_TPS80031=3Dy
> CONFIG_REGULATOR_TWL4030=3Dy
> CONFIG_CEC_CORE=3Dy
> CONFIG_RC_CORE=3Dm
> CONFIG_RC_MAP=3Dm
> CONFIG_LIRC=3Dy
> CONFIG_RC_DECODERS=3Dy
> # CONFIG_IR_NEC_DECODER is not set
> # CONFIG_IR_RC5_DECODER is not set
> # CONFIG_IR_RC6_DECODER is not set
> # CONFIG_IR_JVC_DECODER is not set
> # CONFIG_IR_SONY_DECODER is not set
> # CONFIG_IR_SANYO_DECODER is not set
> CONFIG_IR_SHARP_DECODER=3Dm
> # CONFIG_IR_MCE_KBD_DECODER is not set
> # CONFIG_IR_XMP_DECODER is not set
> CONFIG_IR_IMON_DECODER=3Dm
> # CONFIG_IR_RCMM_DECODER is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> # CONFIG_IR_ENE is not set
> # CONFIG_IR_IMON is not set
> # CONFIG_IR_IMON_RAW is not set
> # CONFIG_IR_MCEUSB is not set
> # CONFIG_IR_ITE_CIR is not set
> # CONFIG_IR_FINTEK is not set
> # CONFIG_IR_NUVOTON is not set
> # CONFIG_IR_REDRAT3 is not set
> # CONFIG_IR_STREAMZAP is not set
> # CONFIG_IR_WINBOND_CIR is not set
> # CONFIG_IR_IGORPLUGUSB is not set
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> CONFIG_RC_LOOPBACK=3Dm
> # CONFIG_IR_SERIAL is not set
> # CONFIG_IR_SIR is not set
> # CONFIG_RC_XBOX_DVD is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> CONFIG_VIDEO_V4L2=3Dy
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> # CONFIG_VIDEO_PCI_SKELETON is not set
> CONFIG_V4L2_MEM2MEM_DEV=3Dy
> CONFIG_V4L2_FWNODE=3Dy
> CONFIG_DVB_CORE=3Dy
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_V4L_PLATFORM_DRIVERS=3Dy
> # CONFIG_VIDEO_CAFE_CCIC is not set
> # CONFIG_VIDEO_CADENCE is not set
> # CONFIG_VIDEO_ASPEED is not set
> CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> CONFIG_VIDEO_MEM2MEM_DEINTERLACE=3Dy
> CONFIG_VIDEO_SH_VEU=3Dy
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> CONFIG_SDR_PLATFORM_DRIVERS=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> # CONFIG_SMS_SDIO_DRV is not set
> # CONFIG_RADIO_ADAPTERS is not set
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_V4L2=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # I2C Encoders, decoders, sensors and other helper chips
> #
> =

> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_TVAUDIO=3Dy
> CONFIG_VIDEO_TDA7432=3Dy
> CONFIG_VIDEO_TDA9840=3Dy
> CONFIG_VIDEO_TEA6415C=3Dy
> # CONFIG_VIDEO_TEA6420 is not set
> CONFIG_VIDEO_MSP3400=3Dy
> CONFIG_VIDEO_CS3308=3Dy
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> CONFIG_VIDEO_UDA1342=3Dy
> # CONFIG_VIDEO_WM8775 is not set
> CONFIG_VIDEO_WM8739=3Dy
> # CONFIG_VIDEO_VP27SMPX is not set
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
> CONFIG_VIDEO_ADV7180=3Dy
> CONFIG_VIDEO_ADV7183=3Dy
> CONFIG_VIDEO_ADV7604=3Dy
> CONFIG_VIDEO_ADV7604_CEC=3Dy
> # CONFIG_VIDEO_ADV7842 is not set
> CONFIG_VIDEO_BT819=3Dy
> CONFIG_VIDEO_BT856=3Dy
> # CONFIG_VIDEO_BT866 is not set
> CONFIG_VIDEO_KS0127=3Dy
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> CONFIG_VIDEO_SAA711X=3Dy
> # CONFIG_VIDEO_TC358743 is not set
> CONFIG_VIDEO_TVP514X=3Dy
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_TVP7002 is not set
> # CONFIG_VIDEO_TW2804 is not set
> # CONFIG_VIDEO_TW9903 is not set
> CONFIG_VIDEO_TW9906=3Dy
> # CONFIG_VIDEO_TW9910 is not set
> CONFIG_VIDEO_VPX3220=3Dy
> =

> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_SAA717X is not set
> CONFIG_VIDEO_CX25840=3Dy
> =

> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> # CONFIG_VIDEO_SAA7185 is not set
> CONFIG_VIDEO_ADV7170=3Dy
> # CONFIG_VIDEO_ADV7175 is not set
> # CONFIG_VIDEO_ADV7343 is not set
> CONFIG_VIDEO_ADV7393=3Dy
> CONFIG_VIDEO_ADV7511=3Dy
> CONFIG_VIDEO_ADV7511_CEC=3Dy
> # CONFIG_VIDEO_AD9389B is not set
> CONFIG_VIDEO_AK881X=3Dy
> CONFIG_VIDEO_THS8200=3Dy
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_APTINA_PLL=3Dy
> # CONFIG_VIDEO_HI556 is not set
> # CONFIG_VIDEO_IMX214 is not set
> # CONFIG_VIDEO_IMX219 is not set
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> # CONFIG_VIDEO_IMX290 is not set
> # CONFIG_VIDEO_IMX319 is not set
> # CONFIG_VIDEO_IMX355 is not set
> # CONFIG_VIDEO_OV2640 is not set
> # CONFIG_VIDEO_OV2659 is not set
> # CONFIG_VIDEO_OV2680 is not set
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV5647 is not set
> CONFIG_VIDEO_OV6650=3Dy
> # CONFIG_VIDEO_OV5670 is not set
> # CONFIG_VIDEO_OV5675 is not set
> # CONFIG_VIDEO_OV5695 is not set
> # CONFIG_VIDEO_OV7251 is not set
> # CONFIG_VIDEO_OV772X is not set
> CONFIG_VIDEO_OV7640=3Dy
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_OV7740 is not set
> # CONFIG_VIDEO_OV8856 is not set
> # CONFIG_VIDEO_OV9640 is not set
> CONFIG_VIDEO_OV9650=3Dy
> CONFIG_VIDEO_OV13858=3Dy
> CONFIG_VIDEO_VS6624=3Dy
> # CONFIG_VIDEO_MT9M001 is not set
> CONFIG_VIDEO_MT9M032=3Dy
> CONFIG_VIDEO_MT9M111=3Dy
> CONFIG_VIDEO_MT9P031=3Dy
> # CONFIG_VIDEO_MT9T001 is not set
> # CONFIG_VIDEO_MT9T112 is not set
> CONFIG_VIDEO_MT9V011=3Dy
> CONFIG_VIDEO_MT9V032=3Dy
> # CONFIG_VIDEO_MT9V111 is not set
> CONFIG_VIDEO_SR030PC30=3Dy
> CONFIG_VIDEO_NOON010PC30=3Dy
> CONFIG_VIDEO_M5MOLS=3Dy
> # CONFIG_VIDEO_RJ54N1 is not set
> CONFIG_VIDEO_S5K6AA=3Dy
> # CONFIG_VIDEO_S5K6A3 is not set
> CONFIG_VIDEO_S5K4ECGX=3Dy
> # CONFIG_VIDEO_S5K5BAF is not set
> # CONFIG_VIDEO_SMIAPP is not set
> CONFIG_VIDEO_ET8EK8=3Dy
> =

> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> # CONFIG_VIDEO_AK7375 is not set
> # CONFIG_VIDEO_DW9714 is not set
> # CONFIG_VIDEO_DW9807_VCM is not set
> =

> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=3Dy
> CONFIG_VIDEO_LM3560=3Dy
> CONFIG_VIDEO_LM3646=3Dy
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
> # SDR tuner chips
> #
> CONFIG_SDR_MAX2175=3Dy
> =

> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_THS7303=3Dy
> CONFIG_VIDEO_M52790=3Dy
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # end of I2C Encoders, decoders, sensors and other helper chips
> =

> #
> # SPI helper chips
> #
> # end of SPI helper chips
> =

> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA18250=3Dm
> # CONFIG_MEDIA_TUNER_TDA8290 is not set
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> # CONFIG_MEDIA_TUNER_TEA5761 is not set
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
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
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> # CONFIG_MEDIA_TUNER_FC0012 is not set
> # CONFIG_MEDIA_TUNER_FC0013 is not set
> CONFIG_MEDIA_TUNER_TDA18212=3Dy
> CONFIG_MEDIA_TUNER_E4000=3Dy
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
> # CONFIG_MEDIA_TUNER_TUA9001 is not set
> # CONFIG_MEDIA_TUNER_SI2157 is not set
> # CONFIG_MEDIA_TUNER_IT913X is not set
> CONFIG_MEDIA_TUNER_R820T=3Dy
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dy
> CONFIG_DVB_STB6100=3Dy
> # CONFIG_DVB_STV090x is not set
> CONFIG_DVB_STV0910=3Dy
> # CONFIG_DVB_STV6110x is not set
> # CONFIG_DVB_STV6111 is not set
> # CONFIG_DVB_MXL5XX is not set
> # CONFIG_DVB_M88DS3103 is not set
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dy
> CONFIG_DVB_TDA18271C2DD=3Dy
> CONFIG_DVB_SI2165=3Dy
> CONFIG_DVB_MN88472=3Dy
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
> # CONFIG_DVB_S5H1420 is not set
> CONFIG_DVB_STV0288=3Dy
> # CONFIG_DVB_STB6000 is not set
> # CONFIG_DVB_STV0299 is not set
> CONFIG_DVB_STV6110=3Dy
> CONFIG_DVB_STV0900=3Dy
> CONFIG_DVB_TDA8083=3Dy
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=3Dy
> # CONFIG_DVB_VES1X93 is not set
> # CONFIG_DVB_TUNER_ITD1000 is not set
> CONFIG_DVB_TUNER_CX24113=3Dy
> CONFIG_DVB_TDA826X=3Dy
> CONFIG_DVB_TUA6100=3Dy
> CONFIG_DVB_CX24116=3Dy
> CONFIG_DVB_CX24117=3Dy
> CONFIG_DVB_CX24120=3Dy
> # CONFIG_DVB_SI21XX is not set
> # CONFIG_DVB_TS2020 is not set
> CONFIG_DVB_DS3000=3Dy
> CONFIG_DVB_MB86A16=3Dy
> CONFIG_DVB_TDA10071=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> CONFIG_DVB_SP887X=3Dy
> CONFIG_DVB_CX22700=3Dy
> CONFIG_DVB_CX22702=3Dy
> # CONFIG_DVB_S5H1432 is not set
> CONFIG_DVB_DRXD=3Dy
> # CONFIG_DVB_L64781 is not set
> CONFIG_DVB_TDA1004X=3Dy
> CONFIG_DVB_NXT6000=3Dy
> CONFIG_DVB_MT352=3Dy
> CONFIG_DVB_ZL10353=3Dy
> # CONFIG_DVB_DIB3000MB is not set
> # CONFIG_DVB_DIB3000MC is not set
> # CONFIG_DVB_DIB7000M is not set
> CONFIG_DVB_DIB7000P=3Dy
> CONFIG_DVB_DIB9000=3Dy
> CONFIG_DVB_TDA10048=3Dy
> # CONFIG_DVB_AF9013 is not set
> CONFIG_DVB_EC100=3Dy
> # CONFIG_DVB_STV0367 is not set
> CONFIG_DVB_CXD2820R=3Dy
> CONFIG_DVB_CXD2841ER=3Dy
> # CONFIG_DVB_RTL2830 is not set
> CONFIG_DVB_RTL2832=3Dy
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_ZD1301_DEMOD=3Dy
> =

> #
> # DVB-C (cable) frontends
> #
> # CONFIG_DVB_VES1820 is not set
> CONFIG_DVB_TDA10021=3Dy
> # CONFIG_DVB_TDA10023 is not set
> # CONFIG_DVB_STV0297 is not set
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dy
> # CONFIG_DVB_OR51211 is not set
> CONFIG_DVB_OR51132=3Dy
> CONFIG_DVB_BCM3510=3Dy
> # CONFIG_DVB_LGDT330X is not set
> CONFIG_DVB_LGDT3305=3Dy
> CONFIG_DVB_LGDT3306A=3Dy
> CONFIG_DVB_LG2160=3Dy
> # CONFIG_DVB_S5H1409 is not set
> CONFIG_DVB_AU8522=3Dy
> CONFIG_DVB_AU8522_DTV=3Dy
> CONFIG_DVB_AU8522_V4L=3Dy
> # CONFIG_DVB_S5H1411 is not set
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
> CONFIG_DVB_TC90522=3Dy
> CONFIG_DVB_MN88443X=3Dm
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dy
> CONFIG_DVB_TUNER_DIB0070=3Dy
> CONFIG_DVB_TUNER_DIB0090=3Dy
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dy
> CONFIG_DVB_LNBH25=3Dy
> CONFIG_DVB_LNBH29=3Dm
> # CONFIG_DVB_LNBP21 is not set
> CONFIG_DVB_LNBP22=3Dy
> CONFIG_DVB_ISL6405=3Dy
> # CONFIG_DVB_ISL6421 is not set
> CONFIG_DVB_ISL6423=3Dy
> # CONFIG_DVB_A8293 is not set
> CONFIG_DVB_LGS8GL5=3Dy
> # CONFIG_DVB_LGS8GXX is not set
> CONFIG_DVB_ATBM8830=3Dy
> # CONFIG_DVB_TDA665x is not set
> CONFIG_DVB_IX2505V=3Dy
> CONFIG_DVB_M88RS2000=3Dy
> # CONFIG_DVB_AF9033 is not set
> CONFIG_DVB_HORUS3A=3Dy
> # CONFIG_DVB_ASCOT2E is not set
> # CONFIG_DVB_HELENE is not set
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=3Dm
> CONFIG_DVB_SP2=3Dy
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dy
> # end of Customise DVB Frontends
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
> CONFIG_DRM_DEBUG_MM=3Dy
> CONFIG_DRM_DEBUG_SELFTEST=3Dm
> CONFIG_DRM_KMS_HELPER=3Dy
> # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_VM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> CONFIG_DRM_VGEM=3Dy
> # CONFIG_DRM_VKMS is not set
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> CONFIG_DRM_ANALOGIX_DP=3Dy
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> # CONFIG_DRM_XEN is not set
> # CONFIG_DRM_VBOXVIDEO is not set
> CONFIG_DRM_LEGACY=3Dy
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_EXPORT_FOR_TESTS=3Dy
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
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
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_EFI is not set
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
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
> CONFIG_FB_SM501=3Dy
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_GOLDFISH=3Dy
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_XEN_FBDEV_FRONTEND is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_SIMPLE=3Dy
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> # CONFIG_LCD_PLATFORM is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> # CONFIG_BACKLIGHT_LM3533 is not set
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_DA9052=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_ADP5520=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_88PM860X=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> # CONFIG_BACKLIGHT_PANDORA is not set
> # CONFIG_BACKLIGHT_SKY81452 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # end of Graphics support
> =

> CONFIG_SOUND=3Dy
> # CONFIG_SND is not set
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
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dy
> CONFIG_HID_ACRUX_FF=3Dy
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_ASUS is not set
> CONFIG_HID_AUREAL=3Dy
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> CONFIG_HID_CMEDIA=3Dy
> # CONFIG_HID_CYPRESS is not set
> CONFIG_HID_DRAGONRISE=3Dy
> CONFIG_DRAGONRISE_FF=3Dy
> CONFIG_HID_EMS_FF=3Dy
> # CONFIG_HID_ELECOM is not set
> CONFIG_HID_EZKEY=3Dy
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dy
> # CONFIG_HID_GLORIOUS is not set
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_VIEWSONIC is not set
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> CONFIG_HID_ITE=3Dy
> # CONFIG_HID_JABRA is not set
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dy
> CONFIG_HID_LOGITECH=3Dy
> CONFIG_HID_LOGITECH_HIDPP=3Dy
> CONFIG_LOGITECH_FF=3Dy
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> CONFIG_LOGIG940_FF=3Dy
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MALTRON is not set
> CONFIG_HID_MAYFLASH=3Dy
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> # CONFIG_HID_MULTITOUCH is not set
> # CONFIG_HID_NTI is not set
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> CONFIG_HID_PETALYNX=3Dy
> CONFIG_HID_PICOLCD=3Dy
> # CONFIG_HID_PICOLCD_FB is not set
> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
> # CONFIG_HID_PICOLCD_LCD is not set
> # CONFIG_HID_PICOLCD_LEDS is not set
> CONFIG_HID_PLANTRONICS=3Dy
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_SAITEK=3Dy
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SPEEDLINK=3Dy
> # CONFIG_HID_STEAM is not set
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> CONFIG_HID_GREENASIA=3Dy
> # CONFIG_GREENASIA_FF is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> CONFIG_THRUSTMASTER_FF=3Dy
> # CONFIG_HID_UDRAW_PS3 is not set
> CONFIG_HID_WIIMOTE=3Dy
> # CONFIG_HID_XINMO is not set
> CONFIG_HID_ZEROPLUS=3Dy
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> # CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
> CONFIG_HID_ALPS=3Dy
> # end of Special HID drivers
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> # end of I2C HID support
> =

> #
> # Intel ISH HID support
> #
> # CONFIG_INTEL_ISH_HID is not set
> # end of Intel ISH HID support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> # CONFIG_TYPEC is not set
> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dy
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> # CONFIG_SDIO_UART is not set
> CONFIG_MMC_TEST=3Dy
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> CONFIG_MMC_WBSD=3Dy
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_GOLDFISH is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_USDHI6ROL0=3Dy
> # CONFIG_MMC_CQHCI is not set
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> CONFIG_MMC_MTK=3Dy
> CONFIG_MMC_SDHCI_XENON=3Dy
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> # CONFIG_MSPRO_BLOCK is not set
> # CONFIG_MS_BLOCK is not set
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3532 is not set
> CONFIG_LEDS_LM3533=3Dy
> CONFIG_LEDS_LM3642=3Dy
> CONFIG_LEDS_PCA9532=3Dy
> CONFIG_LEDS_PCA9532_GPIO=3Dy
> CONFIG_LEDS_GPIO=3Dy
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP3952=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> # CONFIG_LEDS_LP8788 is not set
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> # CONFIG_LEDS_PCA963X is not set
> CONFIG_LEDS_DA903X=3Dy
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dy
> # CONFIG_LEDS_ADP5520 is not set
> # CONFIG_LEDS_MC13783 is not set
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dy
> # CONFIG_LEDS_LM355x is not set
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=3Dy
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> CONFIG_LEDS_TPS6105X=3Dy
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_DECODE_MCE=3Dy
> # CONFIG_EDAC_AMD64 is not set
> # CONFIG_EDAC_E752X is not set
> # CONFIG_EDAC_I82975X is not set
> # CONFIG_EDAC_I3000 is not set
> # CONFIG_EDAC_I3200 is not set
> # CONFIG_EDAC_IE31200 is not set
> # CONFIG_EDAC_X38 is not set
> # CONFIG_EDAC_I5400 is not set
> # CONFIG_EDAC_I5000 is not set
> # CONFIG_EDAC_I5100 is not set
> # CONFIG_EDAC_I7300 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
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
> CONFIG_ALTERA_MSGDMA=3Dy
> # CONFIG_INTEL_IDMA64 is not set
> # CONFIG_INTEL_IDXD is not set
> # CONFIG_INTEL_IOATDMA is not set
> # CONFIG_PLX_DMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> CONFIG_QCOM_HIDMA=3Dy
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> # CONFIG_DW_DMAC_PCI is not set
> CONFIG_HSU_DMA=3Dy
> # CONFIG_SF_PDMA is not set
> =

> #
> # DMA Clients
> #
> # CONFIG_ASYNC_TX_DMA is not set
> # CONFIG_DMATEST is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> # CONFIG_HD44780 is not set
> CONFIG_IMG_ASCII_LCD=3Dy
> CONFIG_PARPORT_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=3Dy
> CONFIG_PANEL=3Dy
> CONFIG_CHARLCD=3Dy
> # CONFIG_UIO is not set
> CONFIG_VIRT_DRIVERS=3Dy
> # CONFIG_VBOXGUEST is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_BALLOON is not set
> CONFIG_VIRTIO_INPUT=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> # CONFIG_VDPA is not set
> CONFIG_VHOST_DPN=3Dy
> CONFIG_VHOST_MENU=3Dy
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> #
> # Xen driver support
> #
> CONFIG_XEN_BALLOON=3Dy
> # CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not set
> CONFIG_XEN_SCRUB_PAGES_DEFAULT=3Dy
> CONFIG_XEN_DEV_EVTCHN=3Dy
> CONFIG_XEN_BACKEND=3Dy
> CONFIG_XENFS=3Dy
> # CONFIG_XEN_COMPAT_XENFS is not set
> CONFIG_XEN_SYS_HYPERVISOR=3Dy
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> CONFIG_XEN_GNTDEV=3Dy
> CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
> # CONFIG_XEN_GRANT_DMA_ALLOC is not set
> CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_PCIDEV_BACKEND=3Dm
> # CONFIG_XEN_PVCALLS_FRONTEND is not set
> # CONFIG_XEN_PVCALLS_BACKEND is not set
> CONFIG_XEN_PRIVCMD=3Dy
> CONFIG_XEN_ACPI_PROCESSOR=3Dm
> # CONFIG_XEN_MCE_LOG is not set
> CONFIG_XEN_HAVE_PVMMU=3Dy
> CONFIG_XEN_EFI=3Dy
> CONFIG_XEN_AUTO_XLATE=3Dy
> CONFIG_XEN_ACPI=3Dy
> CONFIG_XEN_SYMS=3Dy
> CONFIG_XEN_HAVE_VPMU=3Dy
> # end of Xen driver support
> =

> CONFIG_GREYBUS=3Dy
> CONFIG_STAGING=3Dy
> CONFIG_COMEDI=3Dy
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> # CONFIG_COMEDI_MISC_DRIVERS is not set
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> # CONFIG_COMEDI_PCL711 is not set
> CONFIG_COMEDI_PCL724=3Dy
> CONFIG_COMEDI_PCL726=3Dy
> # CONFIG_COMEDI_PCL730 is not set
> CONFIG_COMEDI_PCL812=3Dy
> CONFIG_COMEDI_PCL816=3Dy
> # CONFIG_COMEDI_PCL818 is not set
> # CONFIG_COMEDI_PCM3724 is not set
> # CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
> CONFIG_COMEDI_AMPLC_PC236_ISA=3Dy
> # CONFIG_COMEDI_AMPLC_PC263_ISA is not set
> # CONFIG_COMEDI_RTI800 is not set
> CONFIG_COMEDI_RTI802=3Dy
> # CONFIG_COMEDI_DAC02 is not set
> CONFIG_COMEDI_DAS16M1=3Dy
> # CONFIG_COMEDI_DAS08_ISA is not set
> CONFIG_COMEDI_DAS16=3Dy
> # CONFIG_COMEDI_DAS800 is not set
> CONFIG_COMEDI_DAS1800=3Dy
> CONFIG_COMEDI_DAS6402=3Dy
> # CONFIG_COMEDI_DT2801 is not set
> # CONFIG_COMEDI_DT2811 is not set
> # CONFIG_COMEDI_DT2814 is not set
> CONFIG_COMEDI_DT2815=3Dy
> # CONFIG_COMEDI_DT2817 is not set
> # CONFIG_COMEDI_DT282X is not set
> # CONFIG_COMEDI_DMM32AT is not set
> # CONFIG_COMEDI_FL512 is not set
> CONFIG_COMEDI_AIO_AIO12_8=3Dy
> CONFIG_COMEDI_AIO_IIRO_16=3Dy
> CONFIG_COMEDI_II_PCI20KC=3Dy
> CONFIG_COMEDI_C6XDIGIO=3Dy
> CONFIG_COMEDI_MPC624=3Dy
> CONFIG_COMEDI_ADQ12B=3Dy
> # CONFIG_COMEDI_NI_AT_A2150 is not set
> CONFIG_COMEDI_NI_AT_AO=3Dy
> CONFIG_COMEDI_NI_ATMIO=3Dy
> CONFIG_COMEDI_NI_ATMIO16D=3Dy
> CONFIG_COMEDI_NI_LABPC_ISA=3Dy
> CONFIG_COMEDI_PCMAD=3Dy
> CONFIG_COMEDI_PCMDA12=3Dy
> CONFIG_COMEDI_PCMMIO=3Dy
> CONFIG_COMEDI_PCMUIO=3Dy
> CONFIG_COMEDI_MULTIQ3=3Dy
> CONFIG_COMEDI_S526=3Dy
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dy
> CONFIG_COMEDI_KCOMEDILIB=3Dy
> CONFIG_COMEDI_AMPLC_PC236=3Dy
> CONFIG_COMEDI_ISADMA=3Dy
> CONFIG_COMEDI_NI_LABPC=3Dy
> CONFIG_COMEDI_NI_LABPC_ISADMA=3Dy
> CONFIG_COMEDI_NI_TIO=3Dy
> CONFIG_COMEDI_NI_ROUTING=3Dy
> # CONFIG_RTLLIB is not set
> # CONFIG_FB_SM750 is not set
> =

> #
> # Speakup console speech
> #
> # end of Speakup console speech
> =

> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> CONFIG_ASHMEM=3Dy
> CONFIG_ION=3Dy
> CONFIG_ION_SYSTEM_HEAP=3Dy
> # end of Android
> =

> # CONFIG_GOLDFISH_AUDIO is not set
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_MOST_COMPONENTS is not set
> # CONFIG_KS7010 is not set
> CONFIG_GREYBUS_AUDIO=3Dy
> # CONFIG_GREYBUS_BOOTROM is not set
> # CONFIG_GREYBUS_HID is not set
> # CONFIG_GREYBUS_LIGHT is not set
> CONFIG_GREYBUS_LOG=3Dy
> CONFIG_GREYBUS_LOOPBACK=3Dy
> # CONFIG_GREYBUS_POWER is not set
> CONFIG_GREYBUS_RAW=3Dy
> CONFIG_GREYBUS_VIBRATOR=3Dy
> # CONFIG_GREYBUS_BRIDGED_PHY is not set
> =

> #
> # Gasket devices
> #
> # CONFIG_STAGING_GASKET_FRAMEWORK is not set
> # end of Gasket devices
> =

> # CONFIG_FIELDBUS_DEV is not set
> # CONFIG_QLGE is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACPI_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_ASUS_WIRELESS is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_DELL_SMBIOS is not set
> CONFIG_DELL_RBU=3Dy
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_IBM_RTL is not set
> CONFIG_SENSORS_HDAPS=3Dy
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_INT0002_VGPIO is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SYSTEM76_ACPI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> # CONFIG_MLX_PLATFORM is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> =

> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> =

> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_INTEL_PMC_IPC is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_GOLDFISH_PIPE=3Dy
> # CONFIG_MFD_CROS_EC is not set
> # CONFIG_CHROME_PLATFORMS is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> # end of Common Clock Framework
> =

> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # end of Clock Source drivers
> =

> # CONFIG_MAILBOX is not set
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_AMD_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> =

> # CONFIG_SOUNDWIRE is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Aspeed SoC drivers
> #
> # end of Aspeed SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # CONFIG_XILINX_VCU is not set
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
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
> # CONFIG_EXTCON_AXP288 is not set
> # CONFIG_EXTCON_FSA9480 is not set
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> CONFIG_EXTCON_MAX14577=3Dy
> CONFIG_EXTCON_MAX3355=3Dy
> CONFIG_EXTCON_MAX77843=3Dy
> # CONFIG_EXTCON_PTN5150 is not set
> CONFIG_EXTCON_RT8973A=3Dy
> CONFIG_EXTCON_SM5502=3Dy
> # CONFIG_EXTCON_USB_GPIO is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> # end of IRQ chip support
> =

> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> # CONFIG_PHY_INTEL_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> # CONFIG_IDLE_INJECT is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> # CONFIG_MCB_LPC is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> CONFIG_RAS_CEC=3Dy
> # CONFIG_RAS_CEC_DEBUG is not set
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> # CONFIG_ANDROID_BINDERFS is not set
> CONFIG_ANDROID_BINDER_DEVICES=3D"binder,hwbinder,vndbinder"
> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> # end of Android
> =

> # CONFIG_LIBNVDIMM is not set
> CONFIG_DAX=3Dy
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_SPMI_SDAM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dy
> # CONFIG_STM_PROTO_BASIC is not set
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dy
> CONFIG_STM_SOURCE_CONSOLE=3Dy
> # CONFIG_STM_SOURCE_HEARTBEAT is not set
> # CONFIG_STM_SOURCE_FTRACE is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dy
> # CONFIG_INTEL_TH_STH is not set
> # CONFIG_INTEL_TH_MSU is not set
> # CONFIG_INTEL_TH_PTI is not set
> CONFIG_INTEL_TH_DEBUG=3Dy
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_TEE is not set
> CONFIG_PM_OPP=3Dy
> # CONFIG_UNISYS_VISORBUS is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> # CONFIG_INTERCONNECT is not set
> # CONFIG_COUNTER is not set
> CONFIG_MOST=3Dy
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=3Dy
> # CONFIG_EXT2_FS is not set
> # CONFIG_EXT3_FS is not set
> # CONFIG_EXT4_FS is not set
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dm
> # CONFIG_XFS_QUOTA is not set
> # CONFIG_XFS_POSIX_ACL is not set
> # CONFIG_XFS_RT is not set
> # CONFIG_XFS_ONLINE_SCRUB is not set
> # CONFIG_XFS_WARN is not set
> # CONFIG_XFS_DEBUG is not set
> # CONFIG_GFS2_FS is not set
> # CONFIG_OCFS2_FS is not set
> CONFIG_BTRFS_FS=3Dm
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> # CONFIG_NILFS2_FS is not set
> # CONFIG_F2FS_FS is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_ENCRYPTION_ALGS=3Dy
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QFMT_V1=3Dy
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_QUOTACTL_COMPAT=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_VIRTIO_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> # CONFIG_UDF_FS is not set
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> # CONFIG_MSDOS_FS is not set
> # CONFIG_VFAT_FS is not set
> # CONFIG_EXFAT_FS is not set
> # CONFIG_NTFS_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_PROC_CPU_RESCTRL=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> # CONFIG_JFFS2_FS is not set
> CONFIG_UBIFS_FS=3Dy
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> CONFIG_UBIFS_FS_ZSTD=3Dy
> CONFIG_UBIFS_ATIME_SUPPORT=3Dy
> CONFIG_UBIFS_FS_XATTR=3Dy
> # CONFIG_UBIFS_FS_SECURITY is not set
> # CONFIG_UBIFS_FS_AUTHENTICATION is not set
> # CONFIG_CRAMFS is not set
> # CONFIG_SQUASHFS is not set
> # CONFIG_VXFS_FS is not set
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_QNX6FS_FS is not set
> CONFIG_ROMFS_FS=3Dy
> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> CONFIG_ROMFS_ON_MTD=3Dy
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> CONFIG_PSTORE_CONSOLE=3Dy
> CONFIG_PSTORE_PMSG=3Dy
> # CONFIG_PSTORE_FTRACE is not set
> CONFIG_PSTORE_RAM=3Dm
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> # CONFIG_EROFS_FS is not set
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> # CONFIG_NLS_KOI8_R is not set
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> # CONFIG_NLS_MAC_GREEK is not set
> CONFIG_NLS_MAC_ICELAND=3Dy
> # CONFIG_NLS_MAC_INUIT is not set
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> # CONFIG_NLS_MAC_TURKISH is not set
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_DLM is not set
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_BIG_KEYS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_PAGE_TABLE_ISOLATION is not set
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> # CONFIG_HARDENED_USERCOPY is not set
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SELINUX is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_HASH=3Dy
> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> # CONFIG_SECURITY_LOADPIN is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_INTEGRITY is not set
> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,=
smack,tomoyo,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dm
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> CONFIG_CRYPTO_ENGINE=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> # CONFIG_CRYPTO_ECRDSA is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> # CONFIG_CRYPTO_CURVE25519_X86 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> # CONFIG_CRYPTO_ECHAINIV is not set
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> # CONFIG_CRYPTO_CFB is not set
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> # CONFIG_CRYPTO_ESSIV is not set
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> # CONFIG_CRYPTO_VMAC is not set
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_XXHASH=3Dm
> CONFIG_CRYPTO_BLAKE2B=3Dm
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> # CONFIG_CRYPTO_SM3 is not set
> # CONFIG_CRYPTO_STREEBOG is not set
> CONFIG_CRYPTO_TGR192=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> # CONFIG_CRYPTO_ARC4 is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> # CONFIG_CRYPTO_SM4 is not set
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
> CONFIG_CRYPTO_ZSTD=3Dy
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
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_HW=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK is not set
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dm
> CONFIG_RAID6_PQ_BENCHMARK=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_PRIME_NUMBERS=3Dm
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=3Dy
> # CONFIG_CRC64 is not set
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> # CONFIG_XZ_DEC is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_BCH=3Dy
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_TEXTSEARCH=3Dy
> CONFIG_TEXTSEARCH_KMP=3Dm
> CONFIG_TEXTSEARCH_BM=3Dm
> CONFIG_TEXTSEARCH_FSM=3Dm
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=3Dy
> CONFIG_SWIOTLB=3Dy
> # CONFIG_DMA_CMA is not set
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_AUTOSELECT=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_UACCESS_MCSAFE=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_SBITMAP=3Dy
> # CONFIG_STRING_SELFTEST is not set
> # end of Library routines
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_TRAP is not set
> CONFIG_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_MISC=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> # CONFIG_TEST_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_OWNER=3Dy
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_DEBUG_SLAB=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> CONFIG_DEBUG_KMEMLEAK=3Dy
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=3D16000
> # CONFIG_DEBUG_KMEMLEAK_TEST is not set
> # CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=3Dy
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> # CONFIG_DEBUG_VM_RB is not set
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dm
> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_KASAN_STACK=3D1
> # end of Memory Debugging
> =

> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> CONFIG_DEBUG_PREEMPT=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_WW_MUTEX_SELFTEST=3Dm
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PLIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # end of Debug kernel data structures
> =

> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_LIST is not set
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_PERF_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_STACK_TRACER=3Dy
> CONFIG_TRACE_PREEMPT_TOGGLE=3Dy
> # CONFIG_PREEMPTIRQ_EVENTS is not set
> CONFIG_IRQSOFF_TRACER=3Dy
> CONFIG_PREEMPT_TRACER=3Dy
> CONFIG_SCHED_TRACER=3Dy
> # CONFIG_HWLAT_TRACER is not set
> # CONFIG_MMIOTRACE is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_BLK_DEV_IO_TRACE is not set
> CONFIG_KPROBE_EVENTS=3Dy
> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> # CONFIG_BPF_KPROBE_OVERRIDE is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> # CONFIG_RING_BUFFER_BENCHMARK is not set
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> # CONFIG_GCOV_PROFILE_FTRACE is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> CONFIG_PREEMPTIRQ_DELAY_TEST=3Dm
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_SAMPLES=3Dy
> # CONFIG_SAMPLE_TRACE_EVENTS is not set
> CONFIG_SAMPLE_TRACE_PRINTK=3Dm
> CONFIG_SAMPLE_FTRACE_DIRECT=3Dm
> # CONFIG_SAMPLE_TRACE_ARRAY is not set
> # CONFIG_SAMPLE_KOBJECT is not set
> # CONFIG_SAMPLE_KPROBES is not set
> # CONFIG_SAMPLE_HW_BREAKPOINT is not set
> # CONFIG_SAMPLE_KFIFO is not set
> # CONFIG_SAMPLE_LIVEPATCH is not set
> # CONFIG_SAMPLE_CONFIGFS is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> # CONFIG_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> # CONFIG_EFI_PGT_DUMP is not set
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_FPU=3Dy
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_KCOV=3Dy
> # CONFIG_KCOV_ENABLE_COMPARISONS is not set
> # CONFIG_KCOV_INSTRUMENT_ALL is not set
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> CONFIG_LKDTM=3Dy
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_SORT is not set
> # CONFIG_KPROBES_SANITY_TEST is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> CONFIG_TEST_STRSCPY=3Dm
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=3Dm
> CONFIG_TEST_BITMAP=3Dm
> # CONFIG_TEST_BITFIELD is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_IDA is not set
> CONFIG_TEST_LKM=3Dm
> CONFIG_TEST_VMALLOC=3Dm
> CONFIG_TEST_USER_COPY=3Dm
> CONFIG_TEST_BPF=3Dm
> CONFIG_TEST_BLACKHOLE_DEV=3Dm
> # CONFIG_FIND_BIT_BENCHMARK is not set
> CONFIG_TEST_FIRMWARE=3Dy
> CONFIG_TEST_SYSCTL=3Dy
> # CONFIG_TEST_UDELAY is not set
> CONFIG_TEST_STATIC_KEYS=3Dm
> CONFIG_TEST_KMOD=3Dm
> # CONFIG_TEST_MEMCAT_P is not set
> CONFIG_TEST_LIVEPATCH=3Dm
> # CONFIG_TEST_STACKINIT is not set
> # CONFIG_TEST_MEMINIT is not set
> CONFIG_MEMTEST=3Dy
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.7.0-rc6 Kernel Configuration
> #
> =

> #
> # Compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> #
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_LD_VERSION=3D234000000
> CONFIG_CLANG_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
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
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
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
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> CONFIG_CONTEXT_TRACKING_FORCE=3Dy
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> =

> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_PREEMPTION=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> # CONFIG_SCHED_THERMAL_PRESSURE is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FAST_NO_HZ is not set
> # CONFIG_RCU_BOOST is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> # CONFIG_NUMA_BALANCING is not set
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_HUGETLB is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_BPF=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> CONFIG_RD_LZMA=3Dy
> # CONFIG_RD_XZ is not set
> CONFIG_RD_LZO=3Dy
> # CONFIG_RD_LZ4 is not set
> # CONFIG_BOOT_CONFIG is not set
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> # CONFIG_EVENTFD is not set
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_LSM is not set
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> # CONFIG_BPF_JIT_ALWAYS_ON is not set
> CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_DEBUG_RSEQ is not set
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

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
> CONFIG_X86_CPU_RESCTRL=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_VSMP is not set
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> # CONFIG_IOSF_MBI is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_XXL=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> CONFIG_XEN=3Dy
> CONFIG_XEN_PV=3Dy
> CONFIG_XEN_PV_SMP=3Dy
> CONFIG_XEN_DOM0=3Dy
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_PVHVM_SMP=3Dy
> CONFIG_XEN_512GB=3Dy
> CONFIG_XEN_SAVE_RESTORE=3Dy
> CONFIG_XEN_DEBUG_FS=3Dy
> # CONFIG_XEN_PVH is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> # CONFIG_KVM_DEBUG_FS is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
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
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> # CONFIG_GART_IOMMU is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> # CONFIG_SCHED_MC_PRIO is not set
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> # CONFIG_X86_MCE_INTEL is not set
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dy
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> # end of Performance monitoring
> =

> # CONFIG_X86_16BIT is not set
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> # CONFIG_I8K is not set
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_AMD_MEM_ENCRYPT=3Dy
> # CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
> CONFIG_NUMA=3Dy
> CONFIG_AMD_NUMA=3Dy
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NODES_SPAN_OTHER_NODES=3Dy
> # CONFIG_NUMA_EMU is not set
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> # CONFIG_X86_PMEM_LEGACY is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> CONFIG_X86_INTEL_TSX_MODE_AUTO=3Dy
> CONFIG_EFI=3Dy
> # CONFIG_EFI_STUB is not set
> CONFIG_SECCOMP=3Dy
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> # CONFIG_KEXEC is not set
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> # CONFIG_KEXEC_SIG is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_HOTPLUG_CPU=3Dy
> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> # CONFIG_HIBERNATION is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> CONFIG_PM_ADVANCED_DEBUG=3Dy
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_DPM_WATCHDOG is not set
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> # CONFIG_ENERGY_MODEL is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_LPIT=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_TAD is not set
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_BGRT is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_ACPI_NUMA=3Dy
> # CONFIG_ACPI_HMAT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_DPTF_POWER is not set
> # CONFIG_ACPI_EXTLOG is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_SFI=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> # CONFIG_X86_INTEL_PSTATE is not set
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dy
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_XEN=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_ISA_BUS=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # CONFIG_X86_SYSFB is not set
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> # end of Binary Emulations
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> CONFIG_GOOGLE_FIRMWARE=3Dy
> # CONFIG_GOOGLE_COREBOOT_TABLE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> # CONFIG_EFI_VARS is not set
> CONFIG_EFI_ESRT=3Dy
> CONFIG_EFI_RUNTIME_MAP=3Dy
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> # CONFIG_EFI_CAPSULE_LOADER is not set
> # CONFIG_EFI_TEST is not set
> # CONFIG_EFI_RCI2_TABLE is not set
> # CONFIG_EFI_DISABLE_PCI_DMA is not set
> # end of EFI (Extensible Firmware Interface) Support
> =

> CONFIG_EFI_EARLYCON=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM_WERROR=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_KPROBES=3Dy
> # CONFIG_JUMP_LABEL is not set
> CONFIG_OPTPROBES=3Dy
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_UPROBES=3Dy
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
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
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
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> CONFIG_GCOV_FORMAT_4_7=3Dy
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> # CONFIG_BLK_DEV_BSGLIB is not set
> # CONFIG_BLK_DEV_INTEGRITY is not set
> # CONFIG_BLK_DEV_ZONED is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> # CONFIG_BLK_WBT is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # end of Partition Types
> =

> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_PM=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> # CONFIG_IOSCHED_BFQ is not set
> # end of IO Schedulers
> =

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
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_NEED_MULTIPLE_NODES=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_NUMA_KEEP_MEMINFO=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_COMPACTION=3Dy
> # CONFIG_PAGE_REPORTING is not set
> CONFIG_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
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
> # CONFIG_FRONTSWAP is not set
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> # CONFIG_MEM_SOFT_DIRTY is not set
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> # CONFIG_ZSMALLOC_STAT is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> # CONFIG_ZONE_DEVICE is not set
> CONFIG_FRAME_VECTOR=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> CONFIG_PERCPU_STATS=3Dy
> CONFIG_GUP_BENCHMARK=3Dy
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> CONFIG_NET_REDIRECT=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_UNIX_DIAG=3Dy
> CONFIG_TLS=3Dm
> # CONFIG_TLS_DEVICE is not set
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dy
> # CONFIG_XFRM_USER is not set
> # CONFIG_XFRM_INTERFACE is not set
> # CONFIG_XFRM_SUB_POLICY is not set
> CONFIG_XFRM_MIGRATE=3Dy
> # CONFIG_XFRM_STATISTICS is not set
> CONFIG_NET_KEY=3Dy
> # CONFIG_NET_KEY_MIGRATE is not set
> CONFIG_XDP_SOCKETS=3Dy
> # CONFIG_XDP_SOCKETS_DIAG is not set
> CONFIG_INET=3Dy
> # CONFIG_IP_MULTICAST is not set
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> # CONFIG_IP_FIB_TRIE_STATS is not set
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> # CONFIG_IP_ROUTE_MULTIPATH is not set
> # CONFIG_IP_ROUTE_VERBOSE is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> CONFIG_NET_IPIP=3Dy
> CONFIG_NET_IPGRE_DEMUX=3Dy
> CONFIG_NET_IP_TUNNEL=3Dy
> CONFIG_NET_IPGRE=3Dy
> # CONFIG_SYN_COOKIES is not set
> CONFIG_NET_IPVTI=3Dy
> CONFIG_NET_UDP_TUNNEL=3Dy
> CONFIG_NET_FOU=3Dy
> CONFIG_NET_FOU_IP_TUNNELS=3Dy
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TUNNEL=3Dy
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
> # CONFIG_IPV6_ILA is not set
> CONFIG_INET6_TUNNEL=3Dy
> CONFIG_IPV6_VTI=3Dy
> CONFIG_IPV6_SIT=3Dm
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dy
> CONFIG_IPV6_GRE=3Dy
> CONFIG_IPV6_FOU=3Dy
> CONFIG_IPV6_FOU_TUNNEL=3Dy
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> # CONFIG_IPV6_MROUTE is not set
> CONFIG_IPV6_SEG6_LWTUNNEL=3Dy
> # CONFIG_IPV6_SEG6_HMAC is not set
> CONFIG_IPV6_SEG6_BPF=3Dy
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_NETLABEL is not set
> CONFIG_MPTCP=3Dy
> CONFIG_MPTCP_IPV6=3Dy
> # CONFIG_MPTCP_HMAC_TEST is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> # CONFIG_BRIDGE_NETFILTER is not set
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dm
> # CONFIG_NETFILTER_NETLINK_ACCT is not set
> # CONFIG_NETFILTER_NETLINK_QUEUE is not set
> # CONFIG_NETFILTER_NETLINK_LOG is not set
> # CONFIG_NETFILTER_NETLINK_OSF is not set
> CONFIG_NF_CONNTRACK=3Dm
> # CONFIG_NF_LOG_NETDEV is not set
> CONFIG_NF_CONNTRACK_MARK=3Dy
> # CONFIG_NF_CONNTRACK_SECMARK is not set
> CONFIG_NF_CONNTRACK_ZONES=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> # CONFIG_NF_CONNTRACK_EVENTS is not set
> # CONFIG_NF_CONNTRACK_TIMEOUT is not set
> # CONFIG_NF_CONNTRACK_TIMESTAMP is not set
> CONFIG_NF_CONNTRACK_LABELS=3Dy
> CONFIG_NF_CT_PROTO_DCCP=3Dy
> CONFIG_NF_CT_PROTO_SCTP=3Dy
> CONFIG_NF_CT_PROTO_UDPLITE=3Dy
> # CONFIG_NF_CONNTRACK_AMANDA is not set
> # CONFIG_NF_CONNTRACK_FTP is not set
> # CONFIG_NF_CONNTRACK_H323 is not set
> # CONFIG_NF_CONNTRACK_IRC is not set
> # CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
> # CONFIG_NF_CONNTRACK_SNMP is not set
> # CONFIG_NF_CONNTRACK_PPTP is not set
> # CONFIG_NF_CONNTRACK_SANE is not set
> # CONFIG_NF_CONNTRACK_SIP is not set
> # CONFIG_NF_CONNTRACK_TFTP is not set
> CONFIG_NF_CT_NETLINK=3Dm
> CONFIG_NF_NAT=3Dm
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_NAT_MASQUERADE=3Dy
> CONFIG_NF_TABLES=3Dm
> CONFIG_NF_TABLES_INET=3Dy
> CONFIG_NF_TABLES_NETDEV=3Dy
> # CONFIG_NFT_NUMGEN is not set
> # CONFIG_NFT_CT is not set
> CONFIG_NFT_FLOW_OFFLOAD=3Dm
> # CONFIG_NFT_COUNTER is not set
> # CONFIG_NFT_CONNLIMIT is not set
> # CONFIG_NFT_LOG is not set
> # CONFIG_NFT_LIMIT is not set
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dm
> CONFIG_NFT_NAT=3Dm
> # CONFIG_NFT_TUNNEL is not set
> CONFIG_NFT_OBJREF=3Dm
> # CONFIG_NFT_QUOTA is not set
> # CONFIG_NFT_REJECT is not set
> # CONFIG_NFT_COMPAT is not set
> # CONFIG_NFT_HASH is not set
> # CONFIG_NFT_XFRM is not set
> # CONFIG_NFT_SOCKET is not set
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> # CONFIG_NFT_SYNPROXY is not set
> # CONFIG_NF_DUP_NETDEV is not set
> # CONFIG_NFT_DUP_NETDEV is not set
> # CONFIG_NFT_FWD_NETDEV is not set
> CONFIG_NF_FLOW_TABLE_INET=3Dm
> CONFIG_NF_FLOW_TABLE=3Dm
> CONFIG_NETFILTER_XTABLES=3Dm
> =

> #
> # Xtables combined modules
> #
> # CONFIG_NETFILTER_XT_MARK is not set
> # CONFIG_NETFILTER_XT_CONNMARK is not set
> =

> #
> # Xtables targets
> #
> # CONFIG_NETFILTER_XT_TARGET_AUDIT is not set
> # CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
> # CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
> # CONFIG_NETFILTER_XT_TARGET_HMARK is not set
> # CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
> # CONFIG_NETFILTER_XT_TARGET_LOG is not set
> # CONFIG_NETFILTER_XT_TARGET_MARK is not set
> CONFIG_NETFILTER_XT_NAT=3Dm
> # CONFIG_NETFILTER_XT_TARGET_NETMAP is not set
> # CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
> # CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
> # CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
> # CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
> # CONFIG_NETFILTER_XT_TARGET_MASQUERADE is not set
> # CONFIG_NETFILTER_XT_TARGET_TEE is not set
> # CONFIG_NETFILTER_XT_TARGET_SECMARK is not set
> # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
> =

> #
> # Xtables matches
> #
> # CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
> # CONFIG_NETFILTER_XT_MATCH_BPF is not set
> # CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
> # CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
> # CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNLABEL is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
> # CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
> # CONFIG_NETFILTER_XT_MATCH_CPU is not set
> # CONFIG_NETFILTER_XT_MATCH_DCCP is not set
> # CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
> # CONFIG_NETFILTER_XT_MATCH_DSCP is not set
> # CONFIG_NETFILTER_XT_MATCH_ECN is not set
> # CONFIG_NETFILTER_XT_MATCH_ESP is not set
> # CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_HELPER is not set
> # CONFIG_NETFILTER_XT_MATCH_HL is not set
> # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
> # CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> # CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
> # CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_MAC is not set
> # CONFIG_NETFILTER_XT_MATCH_MARK is not set
> # CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
> # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
> # CONFIG_NETFILTER_XT_MATCH_OSF is not set
> # CONFIG_NETFILTER_XT_MATCH_OWNER is not set
> # CONFIG_NETFILTER_XT_MATCH_POLICY is not set
> # CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
> # CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
> # CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
> # CONFIG_NETFILTER_XT_MATCH_REALM is not set
> # CONFIG_NETFILTER_XT_MATCH_RECENT is not set
> # CONFIG_NETFILTER_XT_MATCH_SCTP is not set
> # CONFIG_NETFILTER_XT_MATCH_SOCKET is not set
> # CONFIG_NETFILTER_XT_MATCH_STATE is not set
> # CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
> # CONFIG_NETFILTER_XT_MATCH_STRING is not set
> # CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # end of Core Netfilter Configuration
> =

> # CONFIG_IP_SET is not set
> # CONFIG_IP_VS is not set
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dm
> # CONFIG_NF_SOCKET_IPV4 is not set
> # CONFIG_NF_TPROXY_IPV4 is not set
> CONFIG_NF_TABLES_IPV4=3Dy
> # CONFIG_NFT_DUP_IPV4 is not set
> # CONFIG_NFT_FIB_IPV4 is not set
> # CONFIG_NF_TABLES_ARP is not set
> CONFIG_NF_FLOW_TABLE_IPV4=3Dm
> # CONFIG_NF_DUP_IPV4 is not set
> # CONFIG_NF_LOG_ARP is not set
> # CONFIG_NF_LOG_IPV4 is not set
> # CONFIG_NF_REJECT_IPV4 is not set
> CONFIG_IP_NF_IPTABLES=3Dm
> # CONFIG_IP_NF_MATCH_AH is not set
> # CONFIG_IP_NF_MATCH_ECN is not set
> # CONFIG_IP_NF_MATCH_TTL is not set
> # CONFIG_IP_NF_FILTER is not set
> # CONFIG_IP_NF_TARGET_SYNPROXY is not set
> CONFIG_IP_NF_NAT=3Dm
> # CONFIG_IP_NF_TARGET_MASQUERADE is not set
> # CONFIG_IP_NF_TARGET_NETMAP is not set
> # CONFIG_IP_NF_TARGET_REDIRECT is not set
> # CONFIG_IP_NF_MANGLE is not set
> # CONFIG_IP_NF_RAW is not set
> # CONFIG_IP_NF_SECURITY is not set
> # CONFIG_IP_NF_ARPTABLES is not set
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> # CONFIG_NF_SOCKET_IPV6 is not set
> # CONFIG_NF_TPROXY_IPV6 is not set
> CONFIG_NF_TABLES_IPV6=3Dy
> # CONFIG_NFT_DUP_IPV6 is not set
> # CONFIG_NFT_FIB_IPV6 is not set
> CONFIG_NF_FLOW_TABLE_IPV6=3Dm
> # CONFIG_NF_DUP_IPV6 is not set
> # CONFIG_NF_REJECT_IPV6 is not set
> # CONFIG_NF_LOG_IPV6 is not set
> CONFIG_IP6_NF_IPTABLES=3Dm
> # CONFIG_IP6_NF_MATCH_AH is not set
> # CONFIG_IP6_NF_MATCH_EUI64 is not set
> # CONFIG_IP6_NF_MATCH_FRAG is not set
> # CONFIG_IP6_NF_MATCH_OPTS is not set
> # CONFIG_IP6_NF_MATCH_HL is not set
> # CONFIG_IP6_NF_MATCH_IPV6HEADER is not set
> # CONFIG_IP6_NF_MATCH_MH is not set
> # CONFIG_IP6_NF_MATCH_RT is not set
> # CONFIG_IP6_NF_MATCH_SRH is not set
> # CONFIG_IP6_NF_FILTER is not set
> # CONFIG_IP6_NF_TARGET_SYNPROXY is not set
> # CONFIG_IP6_NF_MANGLE is not set
> # CONFIG_IP6_NF_RAW is not set
> # CONFIG_IP6_NF_SECURITY is not set
> CONFIG_IP6_NF_NAT=3Dm
> # CONFIG_IP6_NF_TARGET_MASQUERADE is not set
> # CONFIG_IP6_NF_TARGET_NPT is not set
> # end of IPv6: Netfilter Configuration
> =

> CONFIG_NF_DEFRAG_IPV6=3Dm
> =

> #
> # DECnet: Netfilter Configuration
> #
> # CONFIG_DECNET_NF_GRABULATOR is not set
> # end of DECnet: Netfilter Configuration
> =

> # CONFIG_NF_TABLES_BRIDGE is not set
> # CONFIG_NF_CONNTRACK_BRIDGE is not set
> # CONFIG_BRIDGE_NF_EBTABLES is not set
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> CONFIG_ATM=3Dy
> # CONFIG_ATM_CLIP is not set
> CONFIG_ATM_LANE=3Dy
> # CONFIG_ATM_MPOA is not set
> # CONFIG_ATM_BR2684 is not set
> # CONFIG_L2TP is not set
> CONFIG_STP=3Dy
> CONFIG_BRIDGE=3Dy
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> # CONFIG_BRIDGE_VLAN_FILTERING is not set
> CONFIG_HAVE_NET_DSA=3Dy
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dy
> # CONFIG_VLAN_8021Q_GVRP is not set
> # CONFIG_VLAN_8021Q_MVRP is not set
> CONFIG_DECNET=3Dy
> # CONFIG_DECNET_ROUTER is not set
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> CONFIG_LAPB=3Dy
> CONFIG_PHONET=3Dy
> # CONFIG_6LOWPAN is not set
> CONFIG_IEEE802154=3Dy
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=3Dy
> # CONFIG_MAC802154 is not set
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> # CONFIG_NET_SCH_CBQ is not set
> # CONFIG_NET_SCH_HTB is not set
> # CONFIG_NET_SCH_HFSC is not set
> # CONFIG_NET_SCH_ATM is not set
> CONFIG_NET_SCH_PRIO=3Dm
> # CONFIG_NET_SCH_MULTIQ is not set
> # CONFIG_NET_SCH_RED is not set
> # CONFIG_NET_SCH_SFB is not set
> # CONFIG_NET_SCH_SFQ is not set
> # CONFIG_NET_SCH_TEQL is not set
> # CONFIG_NET_SCH_TBF is not set
> # CONFIG_NET_SCH_CBS is not set
> CONFIG_NET_SCH_ETF=3Dm
> # CONFIG_NET_SCH_TAPRIO is not set
> # CONFIG_NET_SCH_GRED is not set
> # CONFIG_NET_SCH_DSMARK is not set
> CONFIG_NET_SCH_NETEM=3Dy
> # CONFIG_NET_SCH_DRR is not set
> # CONFIG_NET_SCH_MQPRIO is not set
> # CONFIG_NET_SCH_SKBPRIO is not set
> # CONFIG_NET_SCH_CHOKE is not set
> # CONFIG_NET_SCH_QFQ is not set
> # CONFIG_NET_SCH_CODEL is not set
> # CONFIG_NET_SCH_FQ_CODEL is not set
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dm
> # CONFIG_NET_SCH_HHF is not set
> # CONFIG_NET_SCH_PIE is not set
> CONFIG_NET_SCH_INGRESS=3Dy
> # CONFIG_NET_SCH_PLUG is not set
> CONFIG_NET_SCH_ETS=3Dm
> # CONFIG_NET_SCH_DEFAULT is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> # CONFIG_NET_CLS_BASIC is not set
> # CONFIG_NET_CLS_TCINDEX is not set
> # CONFIG_NET_CLS_ROUTE4 is not set
> CONFIG_NET_CLS_FW=3Dm
> CONFIG_NET_CLS_U32=3Dm
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> # CONFIG_NET_CLS_RSVP is not set
> # CONFIG_NET_CLS_RSVP6 is not set
> # CONFIG_NET_CLS_FLOW is not set
> # CONFIG_NET_CLS_CGROUP is not set
> CONFIG_NET_CLS_BPF=3Dm
> CONFIG_NET_CLS_FLOWER=3Dm
> # CONFIG_NET_CLS_MATCHALL is not set
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dm
> CONFIG_NET_EMATCH_NBYTE=3Dm
> CONFIG_NET_EMATCH_U32=3Dm
> CONFIG_NET_EMATCH_META=3Dm
> CONFIG_NET_EMATCH_TEXT=3Dm
> CONFIG_NET_EMATCH_CANID=3Dm
> CONFIG_NET_EMATCH_IPT=3Dm
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dm
> CONFIG_NET_ACT_GACT=3Dm
> CONFIG_GACT_PROB=3Dy
> CONFIG_NET_ACT_MIRRED=3Dm
> CONFIG_NET_ACT_SAMPLE=3Dm
> CONFIG_NET_ACT_IPT=3Dm
> CONFIG_NET_ACT_NAT=3Dm
> CONFIG_NET_ACT_PEDIT=3Dm
> CONFIG_NET_ACT_SIMP=3Dm
> CONFIG_NET_ACT_SKBEDIT=3Dm
> CONFIG_NET_ACT_CSUM=3Dm
> CONFIG_NET_ACT_MPLS=3Dm
> CONFIG_NET_ACT_VLAN=3Dm
> CONFIG_NET_ACT_BPF=3Dm
> CONFIG_NET_ACT_CONNMARK=3Dm
> CONFIG_NET_ACT_CTINFO=3Dm
> CONFIG_NET_ACT_SKBMOD=3Dm
> CONFIG_NET_ACT_IFE=3Dm
> CONFIG_NET_ACT_TUNNEL_KEY=3Dm
> CONFIG_NET_ACT_CT=3Dm
> CONFIG_NET_IFE_SKBMARK=3Dm
> CONFIG_NET_IFE_SKBPRIO=3Dm
> CONFIG_NET_IFE_SKBTCINDEX=3Dm
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=3Dy
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> CONFIG_NETLINK_DIAG=3Dy
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dm
> CONFIG_MPLS_ROUTING=3Dm
> CONFIG_MPLS_IPTUNNEL=3Dm
> CONFIG_NET_NSH=3Dy
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> CONFIG_NET_L3_MASTER_DEV=3Dy
> # CONFIG_NET_NCSI is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_BPF_JIT=3Dy
> CONFIG_BPF_STREAM_PARSER=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> CONFIG_NET_DROP_MONITOR=3Dy
> # end of Network testing
> # end of Networking options
> =

> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> # CONFIG_AX25 is not set
> CONFIG_CAN=3Dm
> CONFIG_CAN_RAW=3Dm
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dm
> # CONFIG_CAN_J1939 is not set
> =

> #
> # CAN Device Drivers
> #
> # CONFIG_CAN_VCAN is not set
> # CONFIG_CAN_VXCAN is not set
> # CONFIG_CAN_SLCAN is not set
> CONFIG_CAN_DEV=3Dm
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_KVASER_PCIEFD is not set
> # CONFIG_CAN_C_CAN is not set
> # CONFIG_CAN_CC770 is not set
> # CONFIG_CAN_IFI_CANFD is not set
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_PEAK_PCIEFD is not set
> # CONFIG_CAN_SJA1000 is not set
> # CONFIG_CAN_SOFTING is not set
> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dy
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dy
> # CONFIG_BT_RFCOMM_TTY is not set
> CONFIG_BT_BNEP=3Dy
> # CONFIG_BT_BNEP_MC_FILTER is not set
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dy
> # CONFIG_BT_HS is not set
> # CONFIG_BT_LE is not set
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_SELFTEST is not set
> CONFIG_BT_DEBUGFS=3Dy
> =

> #
> # Bluetooth device drivers
> #
> CONFIG_BT_HCIBTSDIO=3Dy
> # CONFIG_BT_HCIUART is not set
> # CONFIG_BT_HCIVHCI is not set
> CONFIG_BT_MRVL=3Dy
> CONFIG_BT_MRVL_SDIO=3Dy
> # CONFIG_BT_MTKSDIO is not set
> # CONFIG_BT_MTKUART is not set
> # end of Bluetooth device drivers
> =

> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_XEN is not set
> # CONFIG_NET_9P_DEBUG is not set
> CONFIG_CAIF=3Dy
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=3Dy
> CONFIG_CAIF_USB=3Dy
> # CONFIG_CEPH_LIB is not set
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=3Dy
> CONFIG_NET_IFE=3Dy
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_NET_DEVLINK=3Dy
> # CONFIG_FAILOVER is not set
> CONFIG_ETHTOOL_NETLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI controller drivers
> #
> =

> #
> # DesignWare PCI Core Support
> #
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
> CONFIG_PCI_EPF_TEST=3Dy
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> =

> CONFIG_PCCARD=3Dy
> # CONFIG_PCMCIA is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_RAPIDIO is not set
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_WANT_DEV_COREDUMP=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_SYS_HYPERVISOR=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_REGMAP_SCCB=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> # CONFIG_CONNECTOR is not set
> # CONFIG_GNSS is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_TESTS is not set
> =

> #
> # Partition parsers
> #
> CONFIG_MTD_AR7_PARTS=3Dy
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> # end of Partition parsers
> =

> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_BLOCK is not set
> # CONFIG_MTD_BLOCK_RO is not set
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
> # CONFIG_INFTL is not set
> # CONFIG_RFD_FTL is not set
> # CONFIG_SSFDC is not set
> # CONFIG_SM_FTL is not set
> CONFIG_MTD_OOPS=3Dy
> # CONFIG_MTD_SWAP is not set
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> # CONFIG_MTD_ABSENT is not set
> # end of RAM/ROM/Flash chip drivers
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> # CONFIG_MTD_PHYSMAP is not set
> CONFIG_MTD_SBC_GXX=3Dy
> # CONFIG_MTD_PCI is not set
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dy
> # end of Mapping drivers for chip access
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> # CONFIG_MTD_BLOCK2MTD is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> # end of Self-contained MTD device drivers
> =

> CONFIG_MTD_ONENAND=3Dy
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> # CONFIG_MTD_ONENAND_OTP is not set
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> # CONFIG_MTD_RAW_NAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # end of LPDDR & LPDDR2 PCM memory drivers
> =

> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> CONFIG_MTD_UBI_FASTMAP=3Dy
> CONFIG_MTD_UBI_GLUEBI=3Dy
> # CONFIG_MTD_UBI_BLOCK is not set
> # CONFIG_MTD_HYPERBUS is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> # CONFIG_PARPORT_PC is not set
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_BLK_DEV_FD is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> CONFIG_ZRAM=3Dm
> # CONFIG_ZRAM_WRITEBACK is not set
> # CONFIG_ZRAM_MEMORY_TRACKING is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_LOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> # CONFIG_XEN_BLKDEV_BACKEND is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_RBD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_NVME_FC is not set
> # CONFIG_NVME_TARGET is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dy
> # CONFIG_SENSORS_TSL2550 is not set
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> CONFIG_SRAM=3Dy
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> # CONFIG_PVPANIC is not set
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_EEPROM_IDT_89HPESX is not set
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> # CONFIG_SENSORS_LIS3_I2C is not set
> CONFIG_ALTERA_STAPL=3Dy
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC & related support
> #
> # CONFIG_INTEL_MIC_BUS is not set
> # CONFIG_SCIF_BUS is not set
> # CONFIG_VOP_BUS is not set
> # end of Intel MIC & related support
> =

> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> # CONFIG_MISC_RTSX_PCI is not set
> # CONFIG_HABANA_AI is not set
> # end of Misc devices
> =

> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_RAID_ATTRS is not set
> # CONFIG_SCSI is not set
> # end of SCSI device support
> =

> # CONFIG_ATA is not set
> # CONFIG_MD is not set
> # CONFIG_TARGET_CORE is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> CONFIG_DUMMY=3Dy
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> CONFIG_IFB=3Dy
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> CONFIG_VXLAN=3Dy
> CONFIG_GENEVE=3Dy
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> CONFIG_MACSEC=3Dy
> # CONFIG_NETCONSOLE is not set
> CONFIG_TUN=3Dm
> # CONFIG_TUN_VNET_CROSS_LE is not set
> CONFIG_VETH=3Dy
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> CONFIG_NET_VRF=3Dy
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> # CONFIG_CAIF_DRIVERS is not set
> =

> #
> # Distributed Switch Architecture drivers
> #
> # end of Distributed Switch Architecture drivers
> =

> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
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
> CONFIG_NET_VENDOR_AURORA=3Dy
> # CONFIG_AURORA_NB8800 is not set
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
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> # CONFIG_LIQUIDIO is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
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
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_I40E is not set
> # CONFIG_IGC is not set
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
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
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
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
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
> =

> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dy
> CONFIG_XEN_NETDEV_FRONTEND=3Dy
> # CONFIG_XEN_NETDEV_BACKEND is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> CONFIG_NETDEVSIM=3Dm
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
> CONFIG_NVM=3Dy
> # CONFIG_NVM_PBLK is not set
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
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
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
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> CONFIG_JOYSTICK_ANALOG=3Dy
> CONFIG_JOYSTICK_A3D=3Dy
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> CONFIG_JOYSTICK_GF2K=3Dy
> CONFIG_JOYSTICK_GRIP=3Dy
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dy
> # CONFIG_JOYSTICK_IFORCE is not set
> CONFIG_JOYSTICK_WARRIOR=3Dy
> # CONFIG_JOYSTICK_MAGELLAN is not set
> # CONFIG_JOYSTICK_SPACEORB is not set
> # CONFIG_JOYSTICK_SPACEBALL is not set
> CONFIG_JOYSTICK_STINGER=3Dy
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> # CONFIG_JOYSTICK_DB9 is not set
> # CONFIG_JOYSTICK_GAMECON is not set
> CONFIG_JOYSTICK_TURBOGRAFX=3Dy
> # CONFIG_JOYSTICK_AS5011 is not set
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> # CONFIG_JOYSTICK_XPAD is not set
> # CONFIG_JOYSTICK_PXRC is not set
> # CONFIG_JOYSTICK_FSIA6B is not set
> # CONFIG_INPUT_TABLET is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> # CONFIG_TOUCHSCREEN_88PM860X is not set
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> # CONFIG_TOUCHSCREEN_AD7879_I2C is not set
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> # CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
> # CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> # CONFIG_TOUCHSCREEN_BU21029 is not set
> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
> CONFIG_TOUCHSCREEN_DA9034=3Dy
> # CONFIG_TOUCHSCREEN_DA9052 is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> # CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
> # CONFIG_TOUCHSCREEN_EETI is not set
> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> # CONFIG_TOUCHSCREEN_EXC3000 is not set
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> CONFIG_TOUCHSCREEN_GOODIX=3Dy
> # CONFIG_TOUCHSCREEN_HIDEEP is not set
> # CONFIG_TOUCHSCREEN_ILI210X is not set
> # CONFIG_TOUCHSCREEN_S6SY761 is not set
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_EKTF2127=3Dy
> CONFIG_TOUCHSCREEN_ELAN=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dy
> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> # CONFIG_TOUCHSCREEN_MAX11801 is not set
> # CONFIG_TOUCHSCREEN_MCS5000 is not set
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> # CONFIG_TOUCHSCREEN_INEXIO is not set
> # CONFIG_TOUCHSCREEN_MK712 is not set
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> # CONFIG_TOUCHSCREEN_TI_AM335X_TSC is not set
> # CONFIG_TOUCHSCREEN_PIXCIR is not set
> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> # CONFIG_TOUCHSCREEN_MC13783 is not set
> # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> CONFIG_TOUCHSCREEN_TSC2004=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> # CONFIG_TOUCHSCREEN_RM_TS is not set
> CONFIG_TOUCHSCREEN_SILEAD=3Dy
> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
> CONFIG_TOUCHSCREEN_ST1232=3Dy
> # CONFIG_TOUCHSCREEN_STMFTS is not set
> CONFIG_TOUCHSCREEN_SX8654=3Dy
> # CONFIG_TOUCHSCREEN_TPS6507X is not set
> CONFIG_TOUCHSCREEN_ZET6223=3Dy
> # CONFIG_TOUCHSCREEN_ZFORCE is not set
> # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> # CONFIG_TOUCHSCREEN_IQS5XX is not set
> # CONFIG_INPUT_MISC is not set
> # CONFIG_RMI4_CORE is not set
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
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_GPIO_PS2=3Dy
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> CONFIG_SERIAL_8250_DWLIB=3Dy
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
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
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_GOLDFISH_TTY is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> # CONFIG_TRACE_SINK is not set
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> CONFIG_HVC_XEN_FRONTEND=3Dy
> CONFIG_SERIAL_DEV_BUS=3Dy
> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_PRINTER is not set
> # CONFIG_PPDEV is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_IPMB_DEVICE_INTERFACE is not set
> # CONFIG_HW_RANDOM is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_DEVMEM=3Dy
> CONFIG_DEVKMEM=3Dy
> CONFIG_NVRAM=3Dy
> # CONFIG_RAW_DRIVER is not set
> CONFIG_DEVPORT=3Dy
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_XEN is not set
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_VTPM_PROXY=3Dy
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> CONFIG_TELCLOCK=3Dy
> # CONFIG_XILLYBUS is not set
> # end of Character devices
> =

> # CONFIG_RANDOM_TRUST_CPU is not set
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
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
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_LTC4306=3Dy
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=3Dy
> CONFIG_I2C_MUX_REG=3Dy
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> =

> CONFIG_I2C_HELPER_AUTO=3Dy
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
> # CONFIG_I2C_AMD_MP2 is not set
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> # CONFIG_I2C_ISMT is not set
> # CONFIG_I2C_PIIX4 is not set
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_NVIDIA_GPU is not set
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
> # CONFIG_I2C_CBUS_GPIO is not set
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_MLXCPLD is not set
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
> # CONFIG_HSI is not set
> # CONFIG_PPS is not set
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> =

> # CONFIG_PINCTRL is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> # CONFIG_GPIO_ICH is not set
> CONFIG_GPIO_MB86S7X=3Dy
> CONFIG_GPIO_MENZ127=3Dy
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_XILINX is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> # CONFIG_GPIO_WINBOND is not set
> CONFIG_GPIO_WS16C48=3Dy
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> CONFIG_GPIO_MAX7300=3Dy
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCF857X=3Dy
> CONFIG_GPIO_TPIC2810=3Dy
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=3Dy
> CONFIG_GPIO_BD9571MWV=3Dy
> CONFIG_GPIO_DA9052=3Dy
> CONFIG_GPIO_LP3943=3Dy
> CONFIG_GPIO_LP873X=3Dy
> CONFIG_GPIO_RC5T583=3Dy
> CONFIG_GPIO_TPS65086=3Dy
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_TWL4030=3Dy
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> =

> CONFIG_GPIO_MOCKUP=3Dy
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> # CONFIG_W1_MASTER_DS2482 is not set
> # CONFIG_W1_MASTER_DS1WM is not set
> CONFIG_W1_MASTER_GPIO=3Dy
> # CONFIG_W1_MASTER_SGI is not set
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> # CONFIG_W1_SLAVE_DS2405 is not set
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> # CONFIG_W1_SLAVE_DS2805 is not set
> # CONFIG_W1_SLAVE_DS2430 is not set
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> # CONFIG_W1_SLAVE_DS250X is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
> =

> # CONFIG_POWER_AVS is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=3Dy
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_DS2760 is not set
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_CHARGER_SBS=3Dy
> # CONFIG_MANAGER_SBS is not set
> CONFIG_BATTERY_BQ27XXX=3Dy
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dy
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9052=3Dy
> CONFIG_BATTERY_DA9150=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> CONFIG_BATTERY_MAX1721X=3Dy
> CONFIG_CHARGER_88PM860X=3Dy
> CONFIG_CHARGER_PCF50633=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_MAX14577 is not set
> CONFIG_CHARGER_MAX8998=3Dy
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> CONFIG_CHARGER_TPS65090=3Dy
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_GOLDFISH=3Dy
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dy
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dy
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ASPEED is not set
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dy
> # CONFIG_SENSORS_DS1621 is not set
> # CONFIG_SENSORS_DELL_SMM is not set
> CONFIG_SENSORS_DA9052_ADC=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> # CONFIG_SENSORS_F71882FG is not set
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> # CONFIG_SENSORS_GL520SM is not set
> CONFIG_SENSORS_G760A=3Dy
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_I5500 is not set
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LTC2945=3Dy
> # CONFIG_SENSORS_LTC2947_I2C is not set
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_TC654=3Dy
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> # CONFIG_SENSORS_LM85 is not set
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
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
> # CONFIG_SENSORS_NPCM7XX is not set
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> # CONFIG_SENSORS_PMBUS is not set
> CONFIG_SENSORS_ADM1275=3Dy
> # CONFIG_SENSORS_BEL_PFE is not set
> CONFIG_SENSORS_IBM_CFFPS=3Dy
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> CONFIG_SENSORS_IR35221=3Dy
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX16064=3Dy
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> # CONFIG_SENSORS_MAX34440 is not set
> CONFIG_SENSORS_MAX8688=3Dy
> # CONFIG_SENSORS_PXE1610 is not set
> CONFIG_SENSORS_TPS40422=3Dy
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dy
> # CONFIG_SENSORS_UCD9200 is not set
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=3Dy
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_STTS751=3Dy
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_INA3221=3Dy
> CONFIG_SENSORS_TC74=3Dy
> CONFIG_SENSORS_THMC50=3Dy
> # CONFIG_SENSORS_TMP102 is not set
> # CONFIG_SENSORS_TMP103 is not set
> CONFIG_SENSORS_TMP108=3Dy
> CONFIG_SENSORS_TMP401=3Dy
> # CONFIG_SENSORS_TMP421 is not set
> # CONFIG_SENSORS_TMP513 is not set
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83773G is not set
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> # CONFIG_THERMAL_HWMON is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_CLOCK_THERMAL is not set
> CONFIG_DEVFREQ_THERMAL=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> =

> # CONFIG_INTEL_PCH_THERMAL is not set
> # end of Intel thermal drivers
> =

> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> # CONFIG_BCMA_SFLASH is not set
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dy
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> # CONFIG_MFD_MADERA is not set
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_IQS62X is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77693 is not set
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> CONFIG_PCF50633_GPIO=3Dy
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> # CONFIG_MFD_SMSC is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_TI_LMU=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TI_LP873X=3Dy
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TQMX86 is not set
> # CONFIG_MFD_VX855 is not set
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_RAVE_SP_CORE is not set
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> # CONFIG_REGULATOR_88PG86X is not set
> CONFIG_REGULATOR_88PM800=3Dy
> CONFIG_REGULATOR_88PM8607=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_AXP20X=3Dy
> # CONFIG_REGULATOR_BCM590XX is not set
> # CONFIG_REGULATOR_BD9571MWV is not set
> CONFIG_REGULATOR_DA903X=3Dy
> # CONFIG_REGULATOR_DA9052 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LP3971=3Dy
> # CONFIG_REGULATOR_LP3972 is not set
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP8788=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_LTC3676 is not set
> CONFIG_REGULATOR_MAX14577=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> # CONFIG_REGULATOR_MAX8907 is not set
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX8998=3Dy
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> CONFIG_REGULATOR_MC13892=3Dy
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MT6311=3Dy
> # CONFIG_REGULATOR_PCF50633 is not set
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> # CONFIG_REGULATOR_PV88090 is not set
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> CONFIG_REGULATOR_RC5T583=3Dy
> # CONFIG_REGULATOR_S2MPA01 is not set
> CONFIG_REGULATOR_S2MPS11=3Dy
> CONFIG_REGULATOR_S5M8767=3Dy
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_SLG51000 is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dy
> # CONFIG_REGULATOR_TPS65090 is not set
> # CONFIG_REGULATOR_TPS65132 is not set
> CONFIG_REGULATOR_TPS65910=3Dy
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_TPS80031=3Dy
> CONFIG_REGULATOR_TWL4030=3Dy
> CONFIG_CEC_CORE=3Dy
> CONFIG_RC_CORE=3Dm
> CONFIG_RC_MAP=3Dm
> CONFIG_LIRC=3Dy
> CONFIG_RC_DECODERS=3Dy
> # CONFIG_IR_NEC_DECODER is not set
> # CONFIG_IR_RC5_DECODER is not set
> # CONFIG_IR_RC6_DECODER is not set
> # CONFIG_IR_JVC_DECODER is not set
> # CONFIG_IR_SONY_DECODER is not set
> # CONFIG_IR_SANYO_DECODER is not set
> CONFIG_IR_SHARP_DECODER=3Dm
> # CONFIG_IR_MCE_KBD_DECODER is not set
> # CONFIG_IR_XMP_DECODER is not set
> CONFIG_IR_IMON_DECODER=3Dm
> # CONFIG_IR_RCMM_DECODER is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> # CONFIG_IR_ENE is not set
> # CONFIG_IR_IMON is not set
> # CONFIG_IR_IMON_RAW is not set
> # CONFIG_IR_MCEUSB is not set
> # CONFIG_IR_ITE_CIR is not set
> # CONFIG_IR_FINTEK is not set
> # CONFIG_IR_NUVOTON is not set
> # CONFIG_IR_REDRAT3 is not set
> # CONFIG_IR_STREAMZAP is not set
> # CONFIG_IR_WINBOND_CIR is not set
> # CONFIG_IR_IGORPLUGUSB is not set
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> CONFIG_RC_LOOPBACK=3Dm
> # CONFIG_IR_SERIAL is not set
> # CONFIG_IR_SIR is not set
> # CONFIG_RC_XBOX_DVD is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> CONFIG_VIDEO_V4L2=3Dy
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> # CONFIG_VIDEO_PCI_SKELETON is not set
> CONFIG_V4L2_MEM2MEM_DEV=3Dy
> CONFIG_V4L2_FWNODE=3Dy
> CONFIG_DVB_CORE=3Dy
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_V4L_PLATFORM_DRIVERS=3Dy
> # CONFIG_VIDEO_CAFE_CCIC is not set
> # CONFIG_VIDEO_CADENCE is not set
> # CONFIG_VIDEO_ASPEED is not set
> CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> CONFIG_VIDEO_MEM2MEM_DEINTERLACE=3Dy
> CONFIG_VIDEO_SH_VEU=3Dy
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> CONFIG_SDR_PLATFORM_DRIVERS=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> # CONFIG_SMS_SDIO_DRV is not set
> # CONFIG_RADIO_ADAPTERS is not set
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_V4L2=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # I2C Encoders, decoders, sensors and other helper chips
> #
> =

> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_TVAUDIO=3Dy
> CONFIG_VIDEO_TDA7432=3Dy
> CONFIG_VIDEO_TDA9840=3Dy
> CONFIG_VIDEO_TEA6415C=3Dy
> # CONFIG_VIDEO_TEA6420 is not set
> CONFIG_VIDEO_MSP3400=3Dy
> CONFIG_VIDEO_CS3308=3Dy
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> CONFIG_VIDEO_UDA1342=3Dy
> # CONFIG_VIDEO_WM8775 is not set
> CONFIG_VIDEO_WM8739=3Dy
> # CONFIG_VIDEO_VP27SMPX is not set
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
> CONFIG_VIDEO_ADV7180=3Dy
> CONFIG_VIDEO_ADV7183=3Dy
> CONFIG_VIDEO_ADV7604=3Dy
> CONFIG_VIDEO_ADV7604_CEC=3Dy
> # CONFIG_VIDEO_ADV7842 is not set
> CONFIG_VIDEO_BT819=3Dy
> CONFIG_VIDEO_BT856=3Dy
> # CONFIG_VIDEO_BT866 is not set
> CONFIG_VIDEO_KS0127=3Dy
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> CONFIG_VIDEO_SAA711X=3Dy
> # CONFIG_VIDEO_TC358743 is not set
> CONFIG_VIDEO_TVP514X=3Dy
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_TVP7002 is not set
> # CONFIG_VIDEO_TW2804 is not set
> # CONFIG_VIDEO_TW9903 is not set
> CONFIG_VIDEO_TW9906=3Dy
> # CONFIG_VIDEO_TW9910 is not set
> CONFIG_VIDEO_VPX3220=3Dy
> =

> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_SAA717X is not set
> CONFIG_VIDEO_CX25840=3Dy
> =

> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> # CONFIG_VIDEO_SAA7185 is not set
> CONFIG_VIDEO_ADV7170=3Dy
> # CONFIG_VIDEO_ADV7175 is not set
> # CONFIG_VIDEO_ADV7343 is not set
> CONFIG_VIDEO_ADV7393=3Dy
> CONFIG_VIDEO_ADV7511=3Dy
> CONFIG_VIDEO_ADV7511_CEC=3Dy
> # CONFIG_VIDEO_AD9389B is not set
> CONFIG_VIDEO_AK881X=3Dy
> CONFIG_VIDEO_THS8200=3Dy
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_APTINA_PLL=3Dy
> # CONFIG_VIDEO_HI556 is not set
> # CONFIG_VIDEO_IMX214 is not set
> # CONFIG_VIDEO_IMX219 is not set
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> # CONFIG_VIDEO_IMX290 is not set
> # CONFIG_VIDEO_IMX319 is not set
> # CONFIG_VIDEO_IMX355 is not set
> # CONFIG_VIDEO_OV2640 is not set
> # CONFIG_VIDEO_OV2659 is not set
> # CONFIG_VIDEO_OV2680 is not set
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV5647 is not set
> CONFIG_VIDEO_OV6650=3Dy
> # CONFIG_VIDEO_OV5670 is not set
> # CONFIG_VIDEO_OV5675 is not set
> # CONFIG_VIDEO_OV5695 is not set
> # CONFIG_VIDEO_OV7251 is not set
> # CONFIG_VIDEO_OV772X is not set
> CONFIG_VIDEO_OV7640=3Dy
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_OV7740 is not set
> # CONFIG_VIDEO_OV8856 is not set
> # CONFIG_VIDEO_OV9640 is not set
> CONFIG_VIDEO_OV9650=3Dy
> CONFIG_VIDEO_OV13858=3Dy
> CONFIG_VIDEO_VS6624=3Dy
> # CONFIG_VIDEO_MT9M001 is not set
> CONFIG_VIDEO_MT9M032=3Dy
> CONFIG_VIDEO_MT9M111=3Dy
> CONFIG_VIDEO_MT9P031=3Dy
> # CONFIG_VIDEO_MT9T001 is not set
> # CONFIG_VIDEO_MT9T112 is not set
> CONFIG_VIDEO_MT9V011=3Dy
> CONFIG_VIDEO_MT9V032=3Dy
> # CONFIG_VIDEO_MT9V111 is not set
> CONFIG_VIDEO_SR030PC30=3Dy
> CONFIG_VIDEO_NOON010PC30=3Dy
> CONFIG_VIDEO_M5MOLS=3Dy
> # CONFIG_VIDEO_RJ54N1 is not set
> CONFIG_VIDEO_S5K6AA=3Dy
> # CONFIG_VIDEO_S5K6A3 is not set
> CONFIG_VIDEO_S5K4ECGX=3Dy
> # CONFIG_VIDEO_S5K5BAF is not set
> # CONFIG_VIDEO_SMIAPP is not set
> CONFIG_VIDEO_ET8EK8=3Dy
> =

> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> # CONFIG_VIDEO_AK7375 is not set
> # CONFIG_VIDEO_DW9714 is not set
> # CONFIG_VIDEO_DW9807_VCM is not set
> =

> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=3Dy
> CONFIG_VIDEO_LM3560=3Dy
> CONFIG_VIDEO_LM3646=3Dy
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
> # SDR tuner chips
> #
> CONFIG_SDR_MAX2175=3Dy
> =

> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_THS7303=3Dy
> CONFIG_VIDEO_M52790=3Dy
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # end of I2C Encoders, decoders, sensors and other helper chips
> =

> #
> # SPI helper chips
> #
> # end of SPI helper chips
> =

> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA18250=3Dm
> # CONFIG_MEDIA_TUNER_TDA8290 is not set
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> # CONFIG_MEDIA_TUNER_TEA5761 is not set
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
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
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> # CONFIG_MEDIA_TUNER_FC0012 is not set
> # CONFIG_MEDIA_TUNER_FC0013 is not set
> CONFIG_MEDIA_TUNER_TDA18212=3Dy
> CONFIG_MEDIA_TUNER_E4000=3Dy
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
> # CONFIG_MEDIA_TUNER_TUA9001 is not set
> # CONFIG_MEDIA_TUNER_SI2157 is not set
> # CONFIG_MEDIA_TUNER_IT913X is not set
> CONFIG_MEDIA_TUNER_R820T=3Dy
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dy
> CONFIG_DVB_STB6100=3Dy
> # CONFIG_DVB_STV090x is not set
> CONFIG_DVB_STV0910=3Dy
> # CONFIG_DVB_STV6110x is not set
> # CONFIG_DVB_STV6111 is not set
> # CONFIG_DVB_MXL5XX is not set
> # CONFIG_DVB_M88DS3103 is not set
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dy
> CONFIG_DVB_TDA18271C2DD=3Dy
> CONFIG_DVB_SI2165=3Dy
> CONFIG_DVB_MN88472=3Dy
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
> # CONFIG_DVB_S5H1420 is not set
> CONFIG_DVB_STV0288=3Dy
> # CONFIG_DVB_STB6000 is not set
> # CONFIG_DVB_STV0299 is not set
> CONFIG_DVB_STV6110=3Dy
> CONFIG_DVB_STV0900=3Dy
> CONFIG_DVB_TDA8083=3Dy
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=3Dy
> # CONFIG_DVB_VES1X93 is not set
> # CONFIG_DVB_TUNER_ITD1000 is not set
> CONFIG_DVB_TUNER_CX24113=3Dy
> CONFIG_DVB_TDA826X=3Dy
> CONFIG_DVB_TUA6100=3Dy
> CONFIG_DVB_CX24116=3Dy
> CONFIG_DVB_CX24117=3Dy
> CONFIG_DVB_CX24120=3Dy
> # CONFIG_DVB_SI21XX is not set
> # CONFIG_DVB_TS2020 is not set
> CONFIG_DVB_DS3000=3Dy
> CONFIG_DVB_MB86A16=3Dy
> CONFIG_DVB_TDA10071=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> CONFIG_DVB_SP887X=3Dy
> CONFIG_DVB_CX22700=3Dy
> CONFIG_DVB_CX22702=3Dy
> # CONFIG_DVB_S5H1432 is not set
> CONFIG_DVB_DRXD=3Dy
> # CONFIG_DVB_L64781 is not set
> CONFIG_DVB_TDA1004X=3Dy
> CONFIG_DVB_NXT6000=3Dy
> CONFIG_DVB_MT352=3Dy
> CONFIG_DVB_ZL10353=3Dy
> # CONFIG_DVB_DIB3000MB is not set
> # CONFIG_DVB_DIB3000MC is not set
> # CONFIG_DVB_DIB7000M is not set
> CONFIG_DVB_DIB7000P=3Dy
> CONFIG_DVB_DIB9000=3Dy
> CONFIG_DVB_TDA10048=3Dy
> # CONFIG_DVB_AF9013 is not set
> CONFIG_DVB_EC100=3Dy
> # CONFIG_DVB_STV0367 is not set
> CONFIG_DVB_CXD2820R=3Dy
> CONFIG_DVB_CXD2841ER=3Dy
> # CONFIG_DVB_RTL2830 is not set
> CONFIG_DVB_RTL2832=3Dy
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_ZD1301_DEMOD=3Dy
> =

> #
> # DVB-C (cable) frontends
> #
> # CONFIG_DVB_VES1820 is not set
> CONFIG_DVB_TDA10021=3Dy
> # CONFIG_DVB_TDA10023 is not set
> # CONFIG_DVB_STV0297 is not set
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dy
> # CONFIG_DVB_OR51211 is not set
> CONFIG_DVB_OR51132=3Dy
> CONFIG_DVB_BCM3510=3Dy
> # CONFIG_DVB_LGDT330X is not set
> CONFIG_DVB_LGDT3305=3Dy
> CONFIG_DVB_LGDT3306A=3Dy
> CONFIG_DVB_LG2160=3Dy
> # CONFIG_DVB_S5H1409 is not set
> CONFIG_DVB_AU8522=3Dy
> CONFIG_DVB_AU8522_DTV=3Dy
> CONFIG_DVB_AU8522_V4L=3Dy
> # CONFIG_DVB_S5H1411 is not set
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
> CONFIG_DVB_TC90522=3Dy
> CONFIG_DVB_MN88443X=3Dm
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dy
> CONFIG_DVB_TUNER_DIB0070=3Dy
> CONFIG_DVB_TUNER_DIB0090=3Dy
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dy
> CONFIG_DVB_LNBH25=3Dy
> CONFIG_DVB_LNBH29=3Dm
> # CONFIG_DVB_LNBP21 is not set
> CONFIG_DVB_LNBP22=3Dy
> CONFIG_DVB_ISL6405=3Dy
> # CONFIG_DVB_ISL6421 is not set
> CONFIG_DVB_ISL6423=3Dy
> # CONFIG_DVB_A8293 is not set
> CONFIG_DVB_LGS8GL5=3Dy
> # CONFIG_DVB_LGS8GXX is not set
> CONFIG_DVB_ATBM8830=3Dy
> # CONFIG_DVB_TDA665x is not set
> CONFIG_DVB_IX2505V=3Dy
> CONFIG_DVB_M88RS2000=3Dy
> # CONFIG_DVB_AF9033 is not set
> CONFIG_DVB_HORUS3A=3Dy
> # CONFIG_DVB_ASCOT2E is not set
> # CONFIG_DVB_HELENE is not set
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=3Dm
> CONFIG_DVB_SP2=3Dy
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dy
> # end of Customise DVB Frontends
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
> CONFIG_DRM_DEBUG_MM=3Dy
> CONFIG_DRM_DEBUG_SELFTEST=3Dm
> CONFIG_DRM_KMS_HELPER=3Dy
> # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_VM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> CONFIG_DRM_VGEM=3Dy
> # CONFIG_DRM_VKMS is not set
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> CONFIG_DRM_ANALOGIX_DP=3Dy
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> # CONFIG_DRM_XEN is not set
> # CONFIG_DRM_VBOXVIDEO is not set
> CONFIG_DRM_LEGACY=3Dy
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_EXPORT_FOR_TESTS=3Dy
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
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
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_EFI is not set
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
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
> CONFIG_FB_SM501=3Dy
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_GOLDFISH=3Dy
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_XEN_FBDEV_FRONTEND is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_SIMPLE=3Dy
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> # CONFIG_LCD_PLATFORM is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> # CONFIG_BACKLIGHT_LM3533 is not set
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_DA9052=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_ADP5520=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_88PM860X=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> # CONFIG_BACKLIGHT_PANDORA is not set
> # CONFIG_BACKLIGHT_SKY81452 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # end of Graphics support
> =

> CONFIG_SOUND=3Dy
> # CONFIG_SND is not set
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
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dy
> CONFIG_HID_ACRUX_FF=3Dy
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_ASUS is not set
> CONFIG_HID_AUREAL=3Dy
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> CONFIG_HID_CMEDIA=3Dy
> # CONFIG_HID_CYPRESS is not set
> CONFIG_HID_DRAGONRISE=3Dy
> CONFIG_DRAGONRISE_FF=3Dy
> CONFIG_HID_EMS_FF=3Dy
> # CONFIG_HID_ELECOM is not set
> CONFIG_HID_EZKEY=3Dy
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dy
> # CONFIG_HID_GLORIOUS is not set
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_VIEWSONIC is not set
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> CONFIG_HID_ITE=3Dy
> # CONFIG_HID_JABRA is not set
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dy
> CONFIG_HID_LOGITECH=3Dy
> CONFIG_HID_LOGITECH_HIDPP=3Dy
> CONFIG_LOGITECH_FF=3Dy
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> CONFIG_LOGIG940_FF=3Dy
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MALTRON is not set
> CONFIG_HID_MAYFLASH=3Dy
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> # CONFIG_HID_MULTITOUCH is not set
> # CONFIG_HID_NTI is not set
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> CONFIG_HID_PETALYNX=3Dy
> CONFIG_HID_PICOLCD=3Dy
> # CONFIG_HID_PICOLCD_FB is not set
> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
> # CONFIG_HID_PICOLCD_LCD is not set
> # CONFIG_HID_PICOLCD_LEDS is not set
> CONFIG_HID_PLANTRONICS=3Dy
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_SAITEK=3Dy
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SPEEDLINK=3Dy
> # CONFIG_HID_STEAM is not set
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> CONFIG_HID_GREENASIA=3Dy
> # CONFIG_GREENASIA_FF is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> CONFIG_THRUSTMASTER_FF=3Dy
> # CONFIG_HID_UDRAW_PS3 is not set
> CONFIG_HID_WIIMOTE=3Dy
> # CONFIG_HID_XINMO is not set
> CONFIG_HID_ZEROPLUS=3Dy
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> # CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
> CONFIG_HID_ALPS=3Dy
> # end of Special HID drivers
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> # end of I2C HID support
> =

> #
> # Intel ISH HID support
> #
> # CONFIG_INTEL_ISH_HID is not set
> # end of Intel ISH HID support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> # CONFIG_TYPEC is not set
> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dy
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> # CONFIG_SDIO_UART is not set
> CONFIG_MMC_TEST=3Dy
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> CONFIG_MMC_WBSD=3Dy
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_GOLDFISH is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_USDHI6ROL0=3Dy
> # CONFIG_MMC_CQHCI is not set
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> CONFIG_MMC_MTK=3Dy
> CONFIG_MMC_SDHCI_XENON=3Dy
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> # CONFIG_MSPRO_BLOCK is not set
> # CONFIG_MS_BLOCK is not set
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3532 is not set
> CONFIG_LEDS_LM3533=3Dy
> CONFIG_LEDS_LM3642=3Dy
> CONFIG_LEDS_PCA9532=3Dy
> CONFIG_LEDS_PCA9532_GPIO=3Dy
> CONFIG_LEDS_GPIO=3Dy
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP3952=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> # CONFIG_LEDS_LP8788 is not set
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> # CONFIG_LEDS_PCA963X is not set
> CONFIG_LEDS_DA903X=3Dy
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dy
> # CONFIG_LEDS_ADP5520 is not set
> # CONFIG_LEDS_MC13783 is not set
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dy
> # CONFIG_LEDS_LM355x is not set
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=3Dy
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> CONFIG_LEDS_TPS6105X=3Dy
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_DECODE_MCE=3Dy
> # CONFIG_EDAC_AMD64 is not set
> # CONFIG_EDAC_E752X is not set
> # CONFIG_EDAC_I82975X is not set
> # CONFIG_EDAC_I3000 is not set
> # CONFIG_EDAC_I3200 is not set
> # CONFIG_EDAC_IE31200 is not set
> # CONFIG_EDAC_X38 is not set
> # CONFIG_EDAC_I5400 is not set
> # CONFIG_EDAC_I5000 is not set
> # CONFIG_EDAC_I5100 is not set
> # CONFIG_EDAC_I7300 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
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
> CONFIG_ALTERA_MSGDMA=3Dy
> # CONFIG_INTEL_IDMA64 is not set
> # CONFIG_INTEL_IDXD is not set
> # CONFIG_INTEL_IOATDMA is not set
> # CONFIG_PLX_DMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> CONFIG_QCOM_HIDMA=3Dy
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> # CONFIG_DW_DMAC_PCI is not set
> CONFIG_HSU_DMA=3Dy
> # CONFIG_SF_PDMA is not set
> =

> #
> # DMA Clients
> #
> # CONFIG_ASYNC_TX_DMA is not set
> # CONFIG_DMATEST is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> # CONFIG_HD44780 is not set
> CONFIG_IMG_ASCII_LCD=3Dy
> CONFIG_PARPORT_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=3Dy
> CONFIG_PANEL=3Dy
> CONFIG_CHARLCD=3Dy
> # CONFIG_UIO is not set
> CONFIG_VIRT_DRIVERS=3Dy
> # CONFIG_VBOXGUEST is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_BALLOON is not set
> CONFIG_VIRTIO_INPUT=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> # CONFIG_VDPA is not set
> CONFIG_VHOST_DPN=3Dy
> CONFIG_VHOST_MENU=3Dy
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> #
> # Xen driver support
> #
> CONFIG_XEN_BALLOON=3Dy
> # CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not set
> CONFIG_XEN_SCRUB_PAGES_DEFAULT=3Dy
> CONFIG_XEN_DEV_EVTCHN=3Dy
> CONFIG_XEN_BACKEND=3Dy
> CONFIG_XENFS=3Dy
> # CONFIG_XEN_COMPAT_XENFS is not set
> CONFIG_XEN_SYS_HYPERVISOR=3Dy
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> CONFIG_XEN_GNTDEV=3Dy
> CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
> # CONFIG_XEN_GRANT_DMA_ALLOC is not set
> CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_PCIDEV_BACKEND=3Dm
> # CONFIG_XEN_PVCALLS_FRONTEND is not set
> # CONFIG_XEN_PVCALLS_BACKEND is not set
> CONFIG_XEN_PRIVCMD=3Dy
> CONFIG_XEN_ACPI_PROCESSOR=3Dm
> # CONFIG_XEN_MCE_LOG is not set
> CONFIG_XEN_HAVE_PVMMU=3Dy
> CONFIG_XEN_EFI=3Dy
> CONFIG_XEN_AUTO_XLATE=3Dy
> CONFIG_XEN_ACPI=3Dy
> CONFIG_XEN_SYMS=3Dy
> CONFIG_XEN_HAVE_VPMU=3Dy
> # end of Xen driver support
> =

> CONFIG_GREYBUS=3Dy
> CONFIG_STAGING=3Dy
> CONFIG_COMEDI=3Dy
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> # CONFIG_COMEDI_MISC_DRIVERS is not set
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> # CONFIG_COMEDI_PCL711 is not set
> CONFIG_COMEDI_PCL724=3Dy
> CONFIG_COMEDI_PCL726=3Dy
> # CONFIG_COMEDI_PCL730 is not set
> CONFIG_COMEDI_PCL812=3Dy
> CONFIG_COMEDI_PCL816=3Dy
> # CONFIG_COMEDI_PCL818 is not set
> # CONFIG_COMEDI_PCM3724 is not set
> # CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
> CONFIG_COMEDI_AMPLC_PC236_ISA=3Dy
> # CONFIG_COMEDI_AMPLC_PC263_ISA is not set
> # CONFIG_COMEDI_RTI800 is not set
> CONFIG_COMEDI_RTI802=3Dy
> # CONFIG_COMEDI_DAC02 is not set
> CONFIG_COMEDI_DAS16M1=3Dy
> # CONFIG_COMEDI_DAS08_ISA is not set
> CONFIG_COMEDI_DAS16=3Dy
> # CONFIG_COMEDI_DAS800 is not set
> CONFIG_COMEDI_DAS1800=3Dy
> CONFIG_COMEDI_DAS6402=3Dy
> # CONFIG_COMEDI_DT2801 is not set
> # CONFIG_COMEDI_DT2811 is not set
> # CONFIG_COMEDI_DT2814 is not set
> CONFIG_COMEDI_DT2815=3Dy
> # CONFIG_COMEDI_DT2817 is not set
> # CONFIG_COMEDI_DT282X is not set
> # CONFIG_COMEDI_DMM32AT is not set
> # CONFIG_COMEDI_FL512 is not set
> CONFIG_COMEDI_AIO_AIO12_8=3Dy
> CONFIG_COMEDI_AIO_IIRO_16=3Dy
> CONFIG_COMEDI_II_PCI20KC=3Dy
> CONFIG_COMEDI_C6XDIGIO=3Dy
> CONFIG_COMEDI_MPC624=3Dy
> CONFIG_COMEDI_ADQ12B=3Dy
> # CONFIG_COMEDI_NI_AT_A2150 is not set
> CONFIG_COMEDI_NI_AT_AO=3Dy
> CONFIG_COMEDI_NI_ATMIO=3Dy
> CONFIG_COMEDI_NI_ATMIO16D=3Dy
> CONFIG_COMEDI_NI_LABPC_ISA=3Dy
> CONFIG_COMEDI_PCMAD=3Dy
> CONFIG_COMEDI_PCMDA12=3Dy
> CONFIG_COMEDI_PCMMIO=3Dy
> CONFIG_COMEDI_PCMUIO=3Dy
> CONFIG_COMEDI_MULTIQ3=3Dy
> CONFIG_COMEDI_S526=3Dy
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dy
> CONFIG_COMEDI_KCOMEDILIB=3Dy
> CONFIG_COMEDI_AMPLC_PC236=3Dy
> CONFIG_COMEDI_ISADMA=3Dy
> CONFIG_COMEDI_NI_LABPC=3Dy
> CONFIG_COMEDI_NI_LABPC_ISADMA=3Dy
> CONFIG_COMEDI_NI_TIO=3Dy
> CONFIG_COMEDI_NI_ROUTING=3Dy
> # CONFIG_RTLLIB is not set
> # CONFIG_FB_SM750 is not set
> =

> #
> # Speakup console speech
> #
> # end of Speakup console speech
> =

> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> CONFIG_ASHMEM=3Dy
> CONFIG_ION=3Dy
> CONFIG_ION_SYSTEM_HEAP=3Dy
> # end of Android
> =

> # CONFIG_GOLDFISH_AUDIO is not set
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_MOST_COMPONENTS is not set
> # CONFIG_KS7010 is not set
> CONFIG_GREYBUS_AUDIO=3Dy
> # CONFIG_GREYBUS_BOOTROM is not set
> # CONFIG_GREYBUS_HID is not set
> # CONFIG_GREYBUS_LIGHT is not set
> CONFIG_GREYBUS_LOG=3Dy
> CONFIG_GREYBUS_LOOPBACK=3Dy
> # CONFIG_GREYBUS_POWER is not set
> CONFIG_GREYBUS_RAW=3Dy
> CONFIG_GREYBUS_VIBRATOR=3Dy
> # CONFIG_GREYBUS_BRIDGED_PHY is not set
> =

> #
> # Gasket devices
> #
> # CONFIG_STAGING_GASKET_FRAMEWORK is not set
> # end of Gasket devices
> =

> # CONFIG_FIELDBUS_DEV is not set
> # CONFIG_QLGE is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACPI_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_ASUS_WIRELESS is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_DELL_SMBIOS is not set
> CONFIG_DELL_RBU=3Dy
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_IBM_RTL is not set
> CONFIG_SENSORS_HDAPS=3Dy
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_INT0002_VGPIO is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SYSTEM76_ACPI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> # CONFIG_MLX_PLATFORM is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> =

> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> =

> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_INTEL_PMC_IPC is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_GOLDFISH_PIPE=3Dy
> # CONFIG_MFD_CROS_EC is not set
> # CONFIG_CHROME_PLATFORMS is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> # end of Common Clock Framework
> =

> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # end of Clock Source drivers
> =

> # CONFIG_MAILBOX is not set
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_AMD_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> =

> # CONFIG_SOUNDWIRE is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Aspeed SoC drivers
> #
> # end of Aspeed SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # CONFIG_XILINX_VCU is not set
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
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
> # CONFIG_EXTCON_AXP288 is not set
> # CONFIG_EXTCON_FSA9480 is not set
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> CONFIG_EXTCON_MAX14577=3Dy
> CONFIG_EXTCON_MAX3355=3Dy
> CONFIG_EXTCON_MAX77843=3Dy
> # CONFIG_EXTCON_PTN5150 is not set
> CONFIG_EXTCON_RT8973A=3Dy
> CONFIG_EXTCON_SM5502=3Dy
> # CONFIG_EXTCON_USB_GPIO is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> # end of IRQ chip support
> =

> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> # CONFIG_PHY_INTEL_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> # CONFIG_IDLE_INJECT is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> # CONFIG_MCB_LPC is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> CONFIG_RAS_CEC=3Dy
> # CONFIG_RAS_CEC_DEBUG is not set
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> # CONFIG_ANDROID_BINDERFS is not set
> CONFIG_ANDROID_BINDER_DEVICES=3D"binder,hwbinder,vndbinder"
> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> # end of Android
> =

> # CONFIG_LIBNVDIMM is not set
> CONFIG_DAX=3Dy
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_SPMI_SDAM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dy
> # CONFIG_STM_PROTO_BASIC is not set
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dy
> CONFIG_STM_SOURCE_CONSOLE=3Dy
> # CONFIG_STM_SOURCE_HEARTBEAT is not set
> # CONFIG_STM_SOURCE_FTRACE is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dy
> # CONFIG_INTEL_TH_STH is not set
> # CONFIG_INTEL_TH_MSU is not set
> # CONFIG_INTEL_TH_PTI is not set
> CONFIG_INTEL_TH_DEBUG=3Dy
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_TEE is not set
> CONFIG_PM_OPP=3Dy
> # CONFIG_UNISYS_VISORBUS is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> # CONFIG_INTERCONNECT is not set
> # CONFIG_COUNTER is not set
> CONFIG_MOST=3Dy
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=3Dy
> # CONFIG_EXT2_FS is not set
> # CONFIG_EXT3_FS is not set
> # CONFIG_EXT4_FS is not set
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dm
> # CONFIG_XFS_QUOTA is not set
> # CONFIG_XFS_POSIX_ACL is not set
> # CONFIG_XFS_RT is not set
> # CONFIG_XFS_ONLINE_SCRUB is not set
> # CONFIG_XFS_WARN is not set
> # CONFIG_XFS_DEBUG is not set
> # CONFIG_GFS2_FS is not set
> # CONFIG_OCFS2_FS is not set
> CONFIG_BTRFS_FS=3Dm
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> # CONFIG_NILFS2_FS is not set
> # CONFIG_F2FS_FS is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_ENCRYPTION_ALGS=3Dy
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QFMT_V1=3Dy
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_QUOTACTL_COMPAT=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_VIRTIO_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> # CONFIG_UDF_FS is not set
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> # CONFIG_MSDOS_FS is not set
> # CONFIG_VFAT_FS is not set
> # CONFIG_EXFAT_FS is not set
> # CONFIG_NTFS_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_PROC_CPU_RESCTRL=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> # CONFIG_JFFS2_FS is not set
> CONFIG_UBIFS_FS=3Dy
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> CONFIG_UBIFS_FS_ZSTD=3Dy
> CONFIG_UBIFS_ATIME_SUPPORT=3Dy
> CONFIG_UBIFS_FS_XATTR=3Dy
> # CONFIG_UBIFS_FS_SECURITY is not set
> # CONFIG_UBIFS_FS_AUTHENTICATION is not set
> # CONFIG_CRAMFS is not set
> # CONFIG_SQUASHFS is not set
> # CONFIG_VXFS_FS is not set
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_QNX6FS_FS is not set
> CONFIG_ROMFS_FS=3Dy
> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> CONFIG_ROMFS_ON_MTD=3Dy
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> CONFIG_PSTORE_CONSOLE=3Dy
> CONFIG_PSTORE_PMSG=3Dy
> # CONFIG_PSTORE_FTRACE is not set
> CONFIG_PSTORE_RAM=3Dm
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> # CONFIG_EROFS_FS is not set
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> # CONFIG_NLS_KOI8_R is not set
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> # CONFIG_NLS_MAC_GREEK is not set
> CONFIG_NLS_MAC_ICELAND=3Dy
> # CONFIG_NLS_MAC_INUIT is not set
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> # CONFIG_NLS_MAC_TURKISH is not set
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_DLM is not set
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_BIG_KEYS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_PAGE_TABLE_ISOLATION is not set
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> # CONFIG_HARDENED_USERCOPY is not set
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SELINUX is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_HASH=3Dy
> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> # CONFIG_SECURITY_LOADPIN is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_INTEGRITY is not set
> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,=
smack,tomoyo,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dm
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> CONFIG_CRYPTO_ENGINE=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> # CONFIG_CRYPTO_ECRDSA is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> # CONFIG_CRYPTO_CURVE25519_X86 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> # CONFIG_CRYPTO_ECHAINIV is not set
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> # CONFIG_CRYPTO_CFB is not set
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> # CONFIG_CRYPTO_ESSIV is not set
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> # CONFIG_CRYPTO_VMAC is not set
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_XXHASH=3Dm
> CONFIG_CRYPTO_BLAKE2B=3Dm
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> # CONFIG_CRYPTO_SM3 is not set
> # CONFIG_CRYPTO_STREEBOG is not set
> CONFIG_CRYPTO_TGR192=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> # CONFIG_CRYPTO_ARC4 is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> # CONFIG_CRYPTO_SM4 is not set
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
> CONFIG_CRYPTO_ZSTD=3Dy
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
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_HW=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK is not set
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dm
> CONFIG_RAID6_PQ_BENCHMARK=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_PRIME_NUMBERS=3Dm
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=3Dy
> # CONFIG_CRC64 is not set
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> # CONFIG_XZ_DEC is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_BCH=3Dy
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_TEXTSEARCH=3Dy
> CONFIG_TEXTSEARCH_KMP=3Dm
> CONFIG_TEXTSEARCH_BM=3Dm
> CONFIG_TEXTSEARCH_FSM=3Dm
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=3Dy
> CONFIG_SWIOTLB=3Dy
> # CONFIG_DMA_CMA is not set
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_AUTOSELECT=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_UACCESS_MCSAFE=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_SBITMAP=3Dy
> # CONFIG_STRING_SELFTEST is not set
> # end of Library routines
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_TRAP is not set
> CONFIG_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_MISC=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> # CONFIG_TEST_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_OWNER=3Dy
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> # CONFIG_DEBUG_OBJECTS_FREE is not set
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_DEBUG_SLAB=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> CONFIG_DEBUG_KMEMLEAK=3Dy
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=3D16000
> # CONFIG_DEBUG_KMEMLEAK_TEST is not set
> # CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=3Dy
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> # CONFIG_DEBUG_VM_RB is not set
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dm
> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_KASAN_STACK=3D1
> # end of Memory Debugging
> =

> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> CONFIG_DEBUG_PREEMPT=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_WW_MUTEX_SELFTEST=3Dm
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PLIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # end of Debug kernel data structures
> =

> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_LIST is not set
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_PERF_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_STACK_TRACER=3Dy
> CONFIG_TRACE_PREEMPT_TOGGLE=3Dy
> # CONFIG_PREEMPTIRQ_EVENTS is not set
> CONFIG_IRQSOFF_TRACER=3Dy
> CONFIG_PREEMPT_TRACER=3Dy
> CONFIG_SCHED_TRACER=3Dy
> # CONFIG_HWLAT_TRACER is not set
> # CONFIG_MMIOTRACE is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_BLK_DEV_IO_TRACE is not set
> CONFIG_KPROBE_EVENTS=3Dy
> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> # CONFIG_BPF_KPROBE_OVERRIDE is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> # CONFIG_RING_BUFFER_BENCHMARK is not set
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> # CONFIG_GCOV_PROFILE_FTRACE is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> CONFIG_PREEMPTIRQ_DELAY_TEST=3Dm
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_SAMPLES=3Dy
> # CONFIG_SAMPLE_TRACE_EVENTS is not set
> CONFIG_SAMPLE_TRACE_PRINTK=3Dm
> CONFIG_SAMPLE_FTRACE_DIRECT=3Dm
> # CONFIG_SAMPLE_TRACE_ARRAY is not set
> # CONFIG_SAMPLE_KOBJECT is not set
> # CONFIG_SAMPLE_KPROBES is not set
> # CONFIG_SAMPLE_HW_BREAKPOINT is not set
> # CONFIG_SAMPLE_KFIFO is not set
> # CONFIG_SAMPLE_LIVEPATCH is not set
> # CONFIG_SAMPLE_CONFIGFS is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> # CONFIG_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> # CONFIG_EFI_PGT_DUMP is not set
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_FPU=3Dy
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_KCOV=3Dy
> # CONFIG_KCOV_ENABLE_COMPARISONS is not set
> # CONFIG_KCOV_INSTRUMENT_ALL is not set
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> CONFIG_LKDTM=3Dy
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_SORT is not set
> # CONFIG_KPROBES_SANITY_TEST is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> CONFIG_TEST_STRSCPY=3Dm
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=3Dm
> CONFIG_TEST_BITMAP=3Dm
> # CONFIG_TEST_BITFIELD is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_IDA is not set
> CONFIG_TEST_LKM=3Dm
> CONFIG_TEST_VMALLOC=3Dm
> CONFIG_TEST_USER_COPY=3Dm
> CONFIG_TEST_BPF=3Dm
> CONFIG_TEST_BLACKHOLE_DEV=3Dm
> # CONFIG_FIND_BIT_BENCHMARK is not set
> CONFIG_TEST_FIRMWARE=3Dy
> CONFIG_TEST_SYSCTL=3Dy
> # CONFIG_TEST_UDELAY is not set
> CONFIG_TEST_STATIC_KEYS=3Dm
> CONFIG_TEST_KMOD=3Dm
> # CONFIG_TEST_MEMCAT_P is not set
> CONFIG_TEST_LIVEPATCH=3Dm
> # CONFIG_TEST_STACKINIT is not set
> # CONFIG_TEST_MEMINIT is not set
> CONFIG_MEMTEST=3Dy
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

--===============2868711624559570072==--

