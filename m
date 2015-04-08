Content-Type: multipart/mixed; boundary="===============4990997825841288169=="
MIME-Version: 1.0
From: Chris Metcalf <cmetcalf@ezchip.com>
To: lkp@lists.01.org
Subject: Re: [watchdog] WARNING: CPU: 0 PID: 1 at mm/memblock.c:1151 memblock_virt_alloc_internal()
Date: Wed, 08 Apr 2015 11:24:36 -0400
Message-ID: <55254834.7090300@ezchip.com>
In-Reply-To: <20150408033000.GA30602@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4990997825841288169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks!  Already fixed in the next version, which is on LKML waiting to be
picked up; the old version has been removed from the tile tree.

On 04/07/2015 11:30 PM, Fengguang Wu wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> commit e164ade07b215cc33da6831734140f0aa0615d0a
> Author:     Chris Metcalf <cmetcalf@ezchip.com>
> AuthorDate: Thu Apr 2 13:25:32 2015 -0400
> Commit:     Chris Metcalf <cmetcalf@ezchip.com>
> CommitDate: Mon Apr 6 12:35:02 2015 -0400
>
>      watchdog: add watchdog_exclude sysctl to assist nohz
>      =

>      Change the default behavior of watchdog so it only runs on the
>      housekeeping cores when nohz_full is enabled at build and boot time.
>      =

>      Allow modifying the set of cores the watchdog is currently running
>      on with a new kernel.watchdog_exclude sysctl.
>      =

>      Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>
>
> +----------------------------------------------------------+------------+=
------------+---------------+
> |                                                          | a578fc8f8d |=
 e164ade07b | next-20150407 |
> +----------------------------------------------------------+------------+=
------------+---------------+
> | boot_successes                                           | 0          |=
 0          | 0             |
> | boot_failures                                            | 80         |=
 20         | 12            |
> | WARNING:at_lib/debugobjects.c:#__debug_object_init()     | 80         |=
            |               |
> | page_allocation_failure:order:#,mode                     | 80         |=
            |               |
> | Out_of_memory:Kill_process                               | 33         |=
            |               |
> | backtrace:__debug_object_init                            | 80         |=
            |               |
> | backtrace:warn_slowpath_null                             | 80         |=
            |               |
> | backtrace:debug_object_init                              | 80         |=
            |               |
> | backtrace:__init_work                                    | 80         |=
            |               |
> | backtrace:rhashtable_init                                | 80         |=
            |               |
> | backtrace:test_rht_init                                  | 80         |=
            |               |
> | backtrace:kernel_init_freeable                           | 80         |=
 20         | 12            |
> | backtrace:btrfs_test_extent_io                           | 80         |=
            |               |
> | backtrace:init_btrfs_fs                                  | 80         |=
            |               |
> | WARNING:at_mm/memblock.c:#memblock_virt_alloc_internal() | 0          |=
 20         | 12            |
> | BUG:KASan:user-memory-access_on_address(null)            | 0          |=
 20         | 12            |
> | BUG:unable_to_handle_kernel                              | 0          |=
 20         | 12            |
> | Oops                                                     | 0          |=
 20         | 12            |
> | RIP:__bitmap_empty                                       | 0          |=
 20         |               |
> | Kernel_panic-not_syncing:Fatal_exception                 | 0          |=
 20         | 12            |
> | backtrace:alloc_bootmem_cpumask_var                      | 0          |=
 20         | 12            |
> | backtrace:lockup_detector_init                           | 0          |=
 20         | 12            |
> | backtrace:__bitmap_empty                                 | 0          |=
 20         |               |
> | RIP:find_first_bit                                       | 0          |=
 0          | 12            |
> | backtrace:find_first_bit                                 | 0          |=
 0          | 12            |
> +----------------------------------------------------------+------------+=
------------+---------------+
>
> [    0.177042] smpboot: CPU0: Intel Common KVM processor (fam: 0f, model:=
 06, stepping: 01)
> [    0.179108] Performance Events: unsupported Netburst CPU model 6 no PM=
U driver, software events only.
> [    0.187261] ------------[ cut here ]------------
> [    0.188011] WARNING: CPU: 0 PID: 1 at mm/memblock.c:1151 memblock_virt=
_alloc_internal+0x7e/0x149()
> [    0.189008] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.0.0-rc1-00012-=
ge164ade #11
> [    0.190005] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.191005]  ffffffff82459271 ffff88000db9fd98 ffffffff81ff9f0e 000000=
0080000000
> [    0.193004]  0000000000000000 ffff88000db9fde8 ffffffff8112a2b8 fffffb=
fff04e2930
> [    0.195004]  ffffffff82a3ba79 ffff88000db9fdd8 0000000000000000 000000=
0000000400
> [    0.197004] Call Trace:
> [    0.198011]  [<ffffffff81ff9f0e>] dump_stack+0x4f/0x7b
> [    0.199009]  [<ffffffff8112a2b8>] warn_slowpath_common+0xba/0xd8
> [    0.200009]  [<ffffffff82a3ba79>] ? memblock_virt_alloc_internal+0x7e/=
0x149
> [    0.201008]  [<ffffffff8112a398>] warn_slowpath_null+0x1a/0x1c
> [    0.202008]  [<ffffffff82a3ba79>] memblock_virt_alloc_internal+0x7e/0x=
149
> [    0.203008]  [<ffffffff82a3bcb1>] memblock_virt_alloc_try_nid+0x5f/0x9c
> [    0.204009]  [<ffffffff82a54a7c>] alloc_bootmem_cpumask_var+0x1e/0x31
> [    0.205008]  [<ffffffff82a3064a>] lockup_detector_init+0x2e/0xf8
> [    0.206009]  [<ffffffff82a054b8>] kernel_init_freeable+0xd0/0x249
> [    0.207008]  [<ffffffff81fefc84>] ? rest_init+0xd5/0xd5
> [    0.208007]  [<ffffffff81fefc95>] kernel_init+0x11/0xef
> [    0.209007]  [<ffffffff81fefc84>] ? rest_init+0xd5/0xd5
> [    0.210009]  [<ffffffff8200cabc>] ret_from_fork+0x7c/0xb0
> [    0.211008]  [<ffffffff81fefc84>] ? rest_init+0xd5/0xd5
> [    0.212024] ---[ end trace 2aec86b663049736 ]---
> [    0.213023] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> git bisect start 44bf159dfed5558083f97d792cb4bebdbcbf3061 f22e6e847115abc=
3a0e2ad7bb18d243d42275af1 --
> git bisect  bad f2557a9d44457b444ec69b3691fc0c1571ddf087  # 00:55      0-=
     20  Merge remote-tracking branch 'drm-panel/drm/panel/for-next'
> git bisect  bad f01054f7e15e9114def6e7441abf6c37e6fa6f21  # 00:57      0-=
     20  Merge remote-tracking branch 'tile/master'
> git bisect good e5a6058af54727023a6e1765fd167ca4ae1782eb  # 01:01     20+=
     20  Merge remote-tracking branch 'samsung/for-next'
> git bisect good 2800a1cd484a2eca221bd09837c47a2485ea0cd1  # 01:08     20+=
     20  Merge remote-tracking branch 'm68k/for-next'
> git bisect good a07a71a1637fa160946455268e15b3a3973320fa  # 01:18     20+=
     20  Merge remote-tracking branch 'parisc-hd/for-next'
> git bisect good 5fbccbbac0e2fb3fcb3564ac40834380866acfa4  # 01:21     20+=
     20  Merge remote-tracking branch 'powerpc-mpe/next'
> git bisect good 144523fada84074c56325c63ecb7cb3e672740d7  # 01:24     20+=
     20  Merge remote-tracking branch 'fsl/next'
> git bisect good 1e961dafe183e63830e8b973afbb44bdf9e52f2a  # 01:27     20+=
     20  Merge remote-tracking branch 's390/features'
> git bisect good f46c8d1e94b46ad0b22bd0a9d6d62d64aa9c7926  # 01:32     20+=
     20  nohz: add tick_nohz_full_clear_cpus() and _set_cpus() APIs
> git bisect good 16125f97cfdeb4e093e18c59da14eafbb4040786  # 01:36     20+=
     20  tile: ftrace: fix function_graph tracer issues
> git bisect good a578fc8f8db52a5832c5e6ff819ff28fb9729789  # 01:39     20+=
     20  smpboot: allow excluding cpus from the smpboot threads
> git bisect  bad e164ade07b215cc33da6831734140f0aa0615d0a  # 01:42      0-=
     20  watchdog: add watchdog_exclude sysctl to assist nohz
> # first bad commit: [e164ade07b215cc33da6831734140f0aa0615d0a] watchdog: =
add watchdog_exclude sysctl to assist nohz
> git bisect good a578fc8f8db52a5832c5e6ff819ff28fb9729789  # 01:49     60+=
     80  smpboot: allow excluding cpus from the smpboot threads
> # extra tests with DEBUG_INFO
> # extra tests on HEAD of next/master
> git bisect  bad 44bf159dfed5558083f97d792cb4bebdbcbf3061  # 01:53      0-=
     12  Add linux-next specific files for 20150407
> # extra tests on tree/branch next/master
> git bisect  bad 44bf159dfed5558083f97d792cb4bebdbcbf3061  # 01:53      0-=
     12  Add linux-next specific files for 20150407
> # extra tests on tree/branch linus/master
> git bisect good f22e6e847115abc3a0e2ad7bb18d243d42275af1  # 01:56     60+=
     82  Linux 4.0-rc7
> # extra tests on tree/branch next/master
> git bisect  bad 44bf159dfed5558083f97d792cb4bebdbcbf3061  # 01:56      0-=
     12  Add linux-next specific files for 20150407
>
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
>
> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu kvm64
> 	-kernel $kernel
> 	-m 300
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
>
> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	rd.udev.log-priority=3Derr
> 	systemd.log_target=3Djournal
> 	systemd.log_level=3Dwarning
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
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> Thanks,
> Fengguang

-- =

Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com


--===============4990997825841288169==--

