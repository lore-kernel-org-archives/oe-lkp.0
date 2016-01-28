Content-Type: multipart/mixed; boundary="===============0314132832125626124=="
MIME-Version: 1.0
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: lkp@lists.01.org
Subject: Re: [slab] a1fd55538c: WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:2601 trace_hardirqs_on_caller()
Date: Thu, 28 Jan 2016 18:47:49 +0100
Message-ID: <20160128184749.7bdee246@redhat.com>
In-Reply-To: <56aa2b47.MwdlkrzZ08oDKqh8%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0314132832125626124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

I cannot reproduce below problem... have enabled all kind of debugging
and also lockdep.

Can I get a version of the .config file used?

--Jesper


On Thu, 28 Jan 2016 22:52:55 +0800 kernel test robot <fengguang.wu@intel.=
com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit a1fd55538cae9f411059c9b067a3d48c41aa876b
> Author:     Jesper Dangaard Brouer <brouer@redhat.com>
> AuthorDate: Thu Jan 28 09:47:16 2016 +1100
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Thu Jan 28 09:47:16 2016 +1100
> =

>     slab: use slab_pre_alloc_hook in SLAB allocator shared with SLUB
>     =

>     Deduplicate code in SLAB allocator functions slab_alloc() and
>     slab_alloc_node() by using the slab_pre_alloc_hook() call, which is n=
ow
>     shared between SLUB and SLAB.
>     =

>     Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
>     Cc: Christoph Lameter <cl@linux.com>
>     Cc: Pekka Enberg <penberg@kernel.org>
>     Cc: David Rientjes <rientjes@google.com>
>     Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>     Cc: Vladimir Davydov <vdavydov@virtuozzo.com>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> =

> +-----------------------------------------------------------------+------=
------+------------+---------------+
> |                                                                 | 074b6=
f53c3 | a1fd55538c | next-20160128 |
> +-----------------------------------------------------------------+------=
------+------------+---------------+
> | boot_successes                                                  | 40   =
      | 0          | 0             |
> | boot_failures                                                   | 52   =
      | 26         | 19            |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D       | 52 =
        | 26         | 14            |
> | WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_on_caller() | 0    =
      | 26         | 19            |
> | backtrace:pcpu_mem_zalloc                                       | 0    =
      | 26         | 19            |
> | backtrace:percpu_init_late                                      | 0    =
      | 26         | 19            |
> | IP-Config:Auto-configuration_of_network_failed                  | 0    =
      | 0          | 2             |
> +-----------------------------------------------------------------+------=
------+------------+---------------+
> =

> [    0.000000] Inode-cache hash table entries: 16384 (order: 5, 131072 by=
tes)
> [    0.000000] Memory: 194224K/261624K available (10816K kernel code, 506=
0K rwdata, 6628K rodata, 988K init, 33076K bss, 67400K reserved, 0K cma-res=
erved)
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:2601 tr=
ace_hardirqs_on_caller+0x341/0x380()
> [    0.000000] DEBUG_LOCKS_WARN_ON(unlikely(early_boot_irqs_disabled))
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.5.0-rc1-00069-ga=
1fd555 #1
> [    0.000000]  ffffffff82403dd8 ffffffff82403d90 ffffffff813b937d ffffff=
ff82403dc8
> [    0.000000]  ffffffff810eb4d3 ffffffff812617cc 0000000000000001 ffff88=
000fcc50a8
> [    0.000000]  ffff8800000984c0 00000000024000c0 ffffffff82403e28 ffffff=
ff810eb5c7
> [    0.000000] Call Trace:
> [    0.000000]  [<ffffffff813b937d>] dump_stack+0x27/0x3a
> [    0.000000]  [<ffffffff810eb4d3>] warn_slowpath_common+0xa3/0x100
> [    0.000000]  [<ffffffff812617cc>] ? cache_alloc_refill+0x7ac/0x910
> [    0.000000]  [<ffffffff810eb5c7>] warn_slowpath_fmt+0x57/0x70
> [    0.000000]  [<ffffffff81143e61>] trace_hardirqs_on_caller+0x341/0x380
> [    0.000000]  [<ffffffff81143ebd>] trace_hardirqs_on+0x1d/0x30
> [    0.000000]  [<ffffffff812617cc>] cache_alloc_refill+0x7ac/0x910
> [    0.000000]  [<ffffffff8121df6a>] ? pcpu_mem_zalloc+0x5a/0xc0
> [    0.000000]  [<ffffffff81261fce>] __kmalloc+0x24e/0x440
> [    0.000000]  [<ffffffff8121df6a>] pcpu_mem_zalloc+0x5a/0xc0
> [    0.000000]  [<ffffffff829213aa>] percpu_init_late+0x4d/0xbb
> [    0.000000]  [<ffffffff828f41c9>] start_kernel+0x30b/0x6e1
> [    0.000000]  [<ffffffff828f3120>] ? early_idt_handler_array+0x120/0x120
> [    0.000000]  [<ffffffff828f332f>] x86_64_start_reservations+0x46/0x4f
> [    0.000000]  [<ffffffff828f34d4>] x86_64_start_kernel+0x19c/0x1b2
> [    0.000000] ---[ end trace cb88537fdc8fa200 ]---
> [    0.000000] Running RCU self tests
> =

> git bisect start 888c8375131656144c1605071eab2eb6ac49abc3 92e963f50fc7404=
1b5e9e744c330dca48e04f08d --
> git bisect good f664e02a71d85691fc33f116bae3eb7f0debd194  # 17:19     17+=
     13  Merge remote-tracking branch 'kbuild/for-next'
> git bisect good c7173552fb5efc15dd092d3a90b5d6ad0f3d9421  # 17:35     17+=
      2  Merge remote-tracking branch 'audit/next'
> git bisect good bd605d2e3cc724606fa7c0fd3d5d90276f07e979  # 17:47     17+=
      2  Merge remote-tracking branch 'extcon/extcon-next'
> git bisect good 108776431802ced1ca8ba38a9765ef81c48513de  # 18:06     17+=
      5  Merge remote-tracking branch 'llvmlinux/for-next'
> git bisect good 56f1389517d2470a8abdb661c97d6ef640ca8cf3  # 18:30     17+=
      3  Merge remote-tracking branch 'coresight/next'
> git bisect  bad 3cb196d8ee7f94b78c3d609bb91f5b175b3841d8  # 19:17      0-=
      8  Merge branch 'akpm-current/current'
> git bisect good 49d5623e2407b26b532ca24f49d778b5b6fedb22  # 19:48     22+=
      0  Merge remote-tracking branch 'rtc/rtc-next'
> git bisect  bad 8ccfb34d7450299714a9a590a764934397a818c6  # 20:06      0-=
     22  mm: filemap: avoid unnecessary calls to lock_page when waiting for=
 IO to complete during a read
> git bisect good d9dc8f2de4f863bef9a303b2cbae0bbd1c9dfceb  # 20:32     22+=
     22  ocfs2: add feature document for online file check
> git bisect  bad ebea6ceb9754b02bcab987af96c64782c665aa91  # 20:56      0-=
     18  mm/slab: remove object status buffer for DEBUG_SLAB_LEAK
> git bisect  bad 24d88722c03b13ef63b3b631f81454a63ac26cc4  # 21:06      0-=
     22  mm: kmemcheck skip object if slab allocation failed
> git bisect good 1fc2d06fe0cfca10e571e2e444a4a37693495502  # 21:26     22+=
     22  ocfs2/dlm: move lock to the tail of grant queue while doing in-pla=
ce convert
> git bisect good 3355ee84b3d96c7c30923d0bba228b0b7aa380d2  # 21:33     21+=
      8  slub: cleanup code for kmem cgroup support to kmem_cache_free_bulk
> git bisect good 074b6f53c320a81e975c0b5dd79daa5e78a711ba  # 21:39     22+=
     24  mm: fault-inject take over bootstrap kmem_cache check
> git bisect  bad a1fd55538cae9f411059c9b067a3d48c41aa876b  # 21:49      0-=
     26  slab: use slab_pre_alloc_hook in SLAB allocator shared with SLUB
> # first bad commit: [a1fd55538cae9f411059c9b067a3d48c41aa876b] slab: use =
slab_pre_alloc_hook in SLAB allocator shared with SLUB
> git bisect good 074b6f53c320a81e975c0b5dd79daa5e78a711ba  # 21:53     66+=
     52  mm: fault-inject take over bootstrap kmem_cache check
> # extra tests with DEBUG_INFO
> git bisect  bad a1fd55538cae9f411059c9b067a3d48c41aa876b  # 22:00      0-=
     36  slab: use slab_pre_alloc_hook in SLAB allocator shared with SLUB
> # extra tests on HEAD of linux-next/master
> git bisect  bad 888c8375131656144c1605071eab2eb6ac49abc3  # 22:00      0-=
     19  Add linux-next specific files for 20160128
> # extra tests on tree/branch linux-next/master
> git bisect  bad 888c8375131656144c1605071eab2eb6ac49abc3  # 22:00      0-=
     19  Add linux-next specific files for 20160128
> # extra tests with first bad commit reverted
> git bisect good fea4cd9180f321dd12ec9a7932a9bfb32bfaf4c4  # 22:32     66+=
     30  Revert "slab: use slab_pre_alloc_hook in SLAB allocator shared wit=
h SLUB"
> # extra tests on tree/branch linus/master
> git bisect good 03c21cb775a313f1ff19be59c5d02df3e3526471  # 22:52     65+=
     67  Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel=
/git/mst/vhost
> # extra tests on tree/branch linux-next/master
> git bisect  bad 888c8375131656144c1605071eab2eb6ac49abc3  # 22:52      0-=
     19  Add linux-next specific files for 20160128
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dyocto-minimal-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep,+smap
> 	-kernel $kernel
> 	-initrd $initrd
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



-- =

Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer

--===============0314132832125626124==--

