Content-Type: multipart/mixed; boundary="===============0139365419845951333=="
MIME-Version: 1.0
From: Michal Marek <mmarek@suse.com>
To: lkp@lists.01.org
Subject: Re: 867853145c: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Mon, 23 May 2016 10:10:55 +0200
Message-ID: <5742BB0F.3010002@suse.com>
In-Reply-To: <573f8733.ksLR4voDAPkeXAYG%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0139365419845951333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2016-05-20 23:52, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 867853145cea25491054ef067ff8af8946f37e2d
> Merge: 4bf284b 2441e78
> Author:     Michal Marek <mmarek@suse.com>
> AuthorDate: Tue Apr 26 13:20:18 2016 +0200
> Commit:     Michal Marek <mmarek@suse.com>
> CommitDate: Tue Apr 26 13:20:18 2016 +0200
> =

>     Merge branch 'kbuild/kbuild' into kbuild/for-next

Adding Nicolas to CC, because this is the merge commit of the
CONFIG_TRIM_UNUSED_KSYMS series.


> =

> +------------------------------------------+------------+------------+---=
---------+------------+
> |                                          | 4bf284b277 | 2441e78b19 | 86=
7853145c | f490734437 |
> +------------------------------------------+------------+------------+---=
---------+------------+
> | boot_successes                           | 63         | 63         | 0 =
         | 0          |
> | boot_failures                            | 0          | 0          | 22=
         | 13         |
> | BUG:unable_to_handle_kernel              | 0          | 0          | 22=
         | 13         |
> | Oops                                     | 0          | 0          | 22=
         | 13         |
> | RIP:strcpy                               | 0          | 0          | 22=
         | 13         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 0          | 22=
         | 13         |
> | backtrace:of_unittest                    | 0          | 0          | 22=
         | 13         |
> | backtrace:kernel_init_freeable           | 0          | 0          | 22=
         | 13         |
> +------------------------------------------+------------+------------+---=
---------+------------+
> =

> [   24.609622] hd: no drives specified - use hd=3Dcyl,head,sectors on ker=
nel command line
> [   24.611486] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
> [   24.612525] EDD information not available.
> [   24.614384] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [   24.615776] IP: [<ffffffff817f158b>] strcpy+0xb/0x50
> [   24.616700] PGD 0 =

> [   24.617128] Oops: 0000 [#1] PREEMPT =

> [   24.617819] CPU: 0 PID: 1 Comm: swapper Not tainted 4.6.0-qxl-06423-gb=
ac2892 #2
> [   24.619079] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   24.620591] task: ffff8800002bc000 ti: ffff880000330000 task.ti: ffff8=
80000330000
> [   24.621943] RIP: 0010:[<ffffffff817f158b>]  [<ffffffff817f158b>] strcp=
y+0xb/0x50
> [   24.623264] RSP: 0000:ffff8800003339d8  EFLAGS: 00010297
> [   24.624181] RAX: ffff88000c4600a8 RBX: ffff88000c4600a8 RCX: 000000000=
0000000
> [   24.625395] RDX: 000000000000a2a1 RSI: 0000000000000000 RDI: ffff88000=
c4600a8
> [   24.626623] RBP: ffff880000333d80 R08: 0000000000000001 R09: ffff88000=
c460000
> [   24.627847] R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff8=
2aa7620
> [   24.629062] R13: ffff88000c4600a8 R14: ffff880000333e08 R15: ffff88000=
c4600aa
> [   24.630281] FS:  0000000000000000(0000) GS:ffffffff8264a000(0000) knlG=
S:0000000000000000
> [   24.631651] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   24.632635] CR2: 0000000000000000 CR3: 000000000260c000 CR4: 000000000=
00006f0
> [   24.633856] Stack:
> [   24.634218]  ffff880000333d80 ffffffff81d5722a 0000000000011c48 ffff88=
0000333e08
> [   24.635584]  000000010fcc5390 0000000000000000 ffffffff824d0a08 ffff88=
000c1d9e98
> [   24.636954]  0000000000000001 0000000000011b20 ffff88000c460000 ffff88=
000c460000
> [   24.638323] Call Trace:
> [   24.638764]  [<ffffffff81d5722a>] ? unflatten_dt_nodes+0x8da/0xb90
> [   24.639836]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> [   24.640932]  [<ffffffff81250a04>] ? get_page_from_freelist+0x4f4/0x15b0
> [   24.642068]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> [   24.643190]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> [   24.644310]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> [   24.645405]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> [   24.646525]  [<ffffffff812517fb>] ? get_page_from_freelist+0x12eb/0x15=
b0
> [   24.647679]  [<ffffffff811fe300>] ? disable_branch_tracing+0x50/0x70
> [   24.648776]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> [   24.649864]  [<ffffffff81251e33>] ? __alloc_pages_nodemask+0x373/0x15c0
> [   24.651059]  [<ffffffff8181e3a3>] ? check_preemption_disabled+0x53/0x1=
90
> [   24.652208]  [<ffffffff8114d571>] ? __lock_acquire+0x261/0xf20
> [   24.653311]  [<ffffffff811fe396>] ? ftrace_likely_update+0x56/0x2b0
> [   24.654445]  [<ffffffff81d56817>] ? kernel_tree_alloc+0x27/0x40
> [   24.655469]  [<ffffffff812b6ed5>] ? __kmalloc+0x145/0x460
> [   24.656433]  [<ffffffff81d575b9>] __unflatten_device_tree+0xd9/0x160
> [   24.657583]  [<ffffffff81d57a8f>] of_fdt_unflatten_tree+0x4f/0x80
> [   24.658764]  [<ffffffff82be25ac>] of_unittest+0xd1/0x259b
> [   24.659769]  [<ffffffff82be24db>] ? of_unittest_platform_populate+0x58=
7/0x587
> [   24.661029]  [<ffffffff82b559dc>] do_one_initcall+0x1b1/0x302
> [   24.662060]  [<ffffffff82b55d30>] kernel_init_freeable+0x203/0x32d
> [   24.663164]  [<ffffffff81ea2c90>] kernel_init+0x20/0x240
> [   24.664106]  [<ffffffff81eb02cf>] ret_from_fork+0x1f/0x40
> [   24.665048]  [<ffffffff81ea2c70>] ? rest_init+0x130/0x130
> [   24.665987] Code: 17 02 01 8d 52 20 0f b6 d2 39 d0 74 b0 29 d0 48 83 0=
5 39 79 17 02 01 5d c3 0f 1f 80 00 00 00 00 48 8b 15 41 79 17 02 55 48 89 f=
8 <0f> b6 0e 48 89 e5 49 89 d0 49 f7 d8 4c 01 c6 49 01 f8 84 c9 88 =

> [   24.670987] RIP  [<ffffffff817f158b>] strcpy+0xb/0x50
> [   24.671893]  RSP <ffff8800003339d8>
> [   24.672500] CR2: 0000000000000000
> [   24.673093] ---[ end trace ac4a8162da5e779d ]---
> [   24.673893] Kernel panic - not syncing: Fatal exception
> =

> git bisect start f490734437e838c49921e7a8ec1a887d36b0cb14 2dcd0af568b0cf5=
83645c8a317dd12e344b1c72a --
> git bisect  bad 4e3ac701d37537f47cf4e8c051634fd6ae0ea524  # 03:36      0-=
      4  Merge 'linux-review/Bin-Liu/musb-fixes-for-v4-7-rc1/20160509-21581=
9' into devel-hourly-2016051702
> git bisect  bad da756d10374b4339984e25c053526bab5279a05c  # 03:44      0-=
      5  Merge 'linux-review/Stephen-Boyd/msm_serial-cleanups/20160512-0907=
00' into devel-hourly-2016051702
> git bisect good 8965cdd2b81e431c78fa9ad7f15f14e4485cc39c  # 03:56     18+=
      0  Merge 'kees/seccomp/tests' into devel-hourly-2016051702
> git bisect  bad 453eba1192c10d54bc4f1db55ef32233c495e8fa  # 04:01      0-=
      1  Merge 'linux-review/Peter-Rosin/ASoC-MAX9860-new-driver/20160513-1=
53018' into devel-hourly-2016051702
> git bisect  bad 543fae0bdb5f86713751e26164004db86e0056d3  # 04:06      0-=
      7  Merge 'kees/seccomp/report' into devel-hourly-2016051702
> git bisect good 77095d88c3a76ca12237b7301e06c76689848d2f  # 04:15     21+=
      4  Merge 'kees/kbuild/no-android' into devel-hourly-2016051702
> git bisect good 84c6298d7612e34a64de0e98b6b8d06fe026615b  # 04:26     22+=
      0  Merge 'linux-review/Alexey-Brodkin/arc-axs103_smp-Fix-CPU-frequenc=
y-to-100MHz-for-dual-core/20160516-180145' into devel-hourly-2016051702
> git bisect  bad 4c61a3729f14604d1e20bcd8c3ad991b6f13096f  # 04:31      0-=
      8  Merge 'omap/for-next' into devel-hourly-2016051702
> git bisect  bad bac28921a3bc1ad30ca816288e11db0437ecf297  # 04:35      0-=
      1  Merge 'linux-review/Vineet-Gupta/scripts-bloat-o-meter-print-perce=
nt-change/20160513-152445' into devel-hourly-2016051702
> git bisect  bad 867853145cea25491054ef067ff8af8946f37e2d  # 04:41      0-=
      3  Merge branch 'kbuild/kbuild' into kbuild/for-next
> git bisect good fe69b420d39d307cfe2cba875dc1dbf668877198  # 04:48     21+=
      0  kbuild: mark help target as PHONY
> git bisect good ba79d401f1aee52186ff09607e9405cfb805307d  # 04:56     20+=
      0  kbuild: fix call to adjust_autoksyms.sh when output directory spec=
ified
> git bisect good 27c3bffd230abd0a598586aed0fe0ba7b61e0e2e  # 05:04     21+=
      0  kbuild/mkspec: support 'update-bootloader'-based systems
> git bisect good 4bf284b27780335e827a1e39262ff664db6e548c  # 05:12     21+=
      0  Merge branch 'kbuild/misc' into kbuild/for-next
> git bisect good 2441e78b19192cd9ea1ce93027a5732a2117f026  # 05:19     22+=
      0  kbuild: better abstract vmlinux sequential prerequisites

This is strange, because the diff between the good kbuild/kbuild branch
and the bad kbuild/for-next branch is just a few coccinelle patches and
a fix for make rpm:
$ git --no-pager diff --stat 2441e78b1919 867853145cea
 scripts/coccinelle/api/setup_timer.cocci       |   4 +-
 scripts/coccinelle/misc/compare_const_fl.cocci | 171
-------------------------
 scripts/package/mkspec                         |   5 +
 3 files changed, 7 insertions(+), 173 deletions(-)

Michal


> # first bad commit: [867853145cea25491054ef067ff8af8946f37e2d] Merge bran=
ch 'kbuild/kbuild' into kbuild/for-next
> git bisect good 4bf284b27780335e827a1e39262ff664db6e548c  # 05:22     61+=
      0  Merge branch 'kbuild/misc' into kbuild/for-next
> git bisect good 2441e78b19192cd9ea1ce93027a5732a2117f026  # 05:26     61+=
      0  kbuild: better abstract vmlinux sequential prerequisites
> # extra tests with DEBUG_INFO
> git bisect good 867853145cea25491054ef067ff8af8946f37e2d  # 05:36     66+=
      0  Merge branch 'kbuild/kbuild' into kbuild/for-next
> # extra tests on HEAD of linux-devel/devel-hourly-2016051702
> git bisect  bad f490734437e838c49921e7a8ec1a887d36b0cb14  # 05:36      0-=
     13  0day head guard for 'devel-hourly-2016051702'
> # extra tests on tree/branch linux-next/master
> # extra tests on tree/branch linus/master
> git bisect good 6eb59af580dcffc6f6982ac8ef6d27a1a5f26b27  # 05:47     63+=
      0  Merge tag 'mfd-for-linus-4.7' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/lee/mfd
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
> initrd=3Dyocto-minimal-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
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
> =



--===============0139365419845951333==--

