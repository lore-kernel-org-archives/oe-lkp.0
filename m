Content-Type: multipart/mixed; boundary="===============1803250773892285241=="
MIME-Version: 1.0
From: David Härdeman <david@hardeman.nu>
To: lkp@lists.01.org
Subject: Re: 8db0604fcd ("lirc_dev: sanitize locking"): WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 sysfs_warn_dup
Date: Fri, 30 Jun 2017 08:42:26 +0000
Message-ID: <58d66bfe3e42339ed850a1bff94bf6b8@hardeman.nu>
In-Reply-To: <20170627031737.4h26k22ruka3x5ks@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1803250773892285241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

June 27, 2017 5:18 AM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:

> Hi David,
> =

> FYI we find a temporal warning in the *middle* of your patchset.

Hi,

thanks for the testing! I've found the bug and I'll submit an updated patch=
 shortly.


> =

> https://github.com/0day-ci/linux/commits/David-H-rdeman/lirc_dev-modernis=
ation/20170626-120627
> =

> commit 8db0604fcd9a6b5efc91f9887e9f8a13c9e7a94c
> Author: David H=C3=A4rdeman <david@hardeman.nu>
> AuthorDate: Sun Jun 25 14:32:00 2017 +0200
> Commit: 0day robot <fengguang.wu@intel.com>
> CommitDate: Mon Jun 26 12:06:37 2017 +0800
> =

> lirc_dev: sanitize locking
> =

> Use the irctl mutex for all device operations and only use lirc_dev_lock =
to
> protect the irctls array. Also, make sure that the device is alive early =
in
> each fops function before doing anything else.
> =

> Since this patch touches nearly every line where the irctl mutex is
> taken/released, it also renames the mutex at the same time (the name
> irctl_lock will be misleading once struct irctl goes away in later
> patches).
> =

> Signed-off-by: David H=C3=A4rdeman <david@hardeman.nu>
> =

> 0a5e5446fd lirc_dev: change irctl->attached to be a boolean
> 8db0604fcd lirc_dev: sanitize locking
> 160b9262d9 lirc_dev: consistent device registration printk
> +-------------------------------------------+------------+------------+--=
----------+
> | | 0a5e5446fd | 8db0604fcd | 160b9262d9 |
> +-------------------------------------------+------------+------------+--=
----------+
> | boot_successes | 35 | 0 | 11 |
> | boot_failures | 0 | 15 | |
> | WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup | 0 | 15 | |
> +-------------------------------------------+------------+------------+--=
----------+
> =

> [ 13.985208] evbug: Connected device: input7 (SIR IrDA port at sir_ir/inp=
ut0)
> [ 13.986110] input: MCE IR Keyboard/Mouse (sir_ir) as /devices/virtual/in=
put/input8
> [ 13.987144] evbug: Connected device: input8 (MCE IR Keyboard/Mouse (sir_=
ir) at /input0)
> [ 13.987962] sysfs: cannot create duplicate filename '/class/lirc/lirc0'
> [ 13.988616] ------------[ cut here ]------------
> [ 13.989060] WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 sysfs_warn_dup+0=
x4c/0x60
> [ 13.989931] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.0-rc3-00229-g=
8db0604 #1
> [ 13.990653] task: ffff88001d120000 task.stack: ffffc900000d0000
> [ 13.991209] RIP: 0010:sysfs_warn_dup+0x4c/0x60
> [ 13.991636] RSP: 0000:ffffc900000d3a38 EFLAGS: 00010292
> [ 13.992130] RAX: 000000000000003b RBX: ffff880017415000 RCX: 00000000000=
00006
> [ 13.992806] RDX: 00000000000003f7 RSI: ffff88001d120c40 RDI: 00000000000=
00246
> [ 13.993477] RBP: ffffc900000d3a50 R08: 00000000ffffffff R09: 00000000000=
00000
> [ 13.994155] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88001ee=
329c0
> [ 13.994832] R13: ffff88001ed01bd0 R14: ffff88001ed01bd0 R15: fffffffffff=
fffef
> [ 13.995501] FS: 0000000000000000(0000) GS:ffff88001d400000(0000) knlGS:0=
000000000000000
> [ 13.996264] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 13.996831] CR2: 0000000000000000 CR3: 0000000002011000 CR4: 00000000000=
006b0
> [ 13.997506] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
> [ 13.998184] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
> [ 13.998865] Call Trace:
> [ 13.999109] sysfs_do_create_link_sd+0x87/0xb0
> [ 13.999598] sysfs_create_link+0x29/0x40
> [ 13.999980] device_add+0x1e5/0x630
> [ 14.000319] ? refcount_inc+0x9/0x30
> [ 14.000674] ? kobject_get+0x30/0x40
> [ 14.001021] cdev_device_add+0x23/0x70
> [ 14.001383] ? cdev_init+0x50/0x60
> [ 14.001721] lirc_register_driver+0x40e/0x460
> [ 14.002135] ir_lirc_register+0x16a/0x1b0
> [ 14.002519] ir_raw_event_register+0xbc/0xd0
> [ 14.002931] rc_register_device+0x357/0x470
> [ 14.003330] devm_rc_register_device+0x3c/0x70
> [ 14.003759] sir_ir_probe+0x1a4/0x230
> [ 14.004112] platform_drv_probe+0x3a/0x90
> [ 14.004496] driver_probe_device+0x13a/0x330
> [ 14.004911] __device_attach_driver+0x76/0x90
> [ 14.005326] ? __driver_attach+0x90/0x90
> [ 14.005706] bus_for_each_drv+0x4f/0x90
> [ 14.006072] __device_attach+0xa7/0x120
> [ 14.006437] device_initial_probe+0xe/0x10
> [ 14.006876] bus_probe_device+0x35/0xb0
> [ 14.007246] device_add+0x3ed/0x630
> [ 14.007591] ? do_early_param+0x8f/0x8f
> [ 14.007960] platform_device_add+0x15e/0x1d0
> [ 14.008367] ? do_early_param+0x8f/0x8f
> [ 14.008743] sir_ir_init+0x3b/0x65
> [ 14.009073] ? loop_init+0x1a9/0x1a9
> [ 14.009417] do_one_initcall+0x8b/0x13c
> [ 14.009792] ? do_early_param+0x8f/0x8f
> [ 14.010159] kernel_init_freeable+0x321/0x3b2
> [ 14.010582] ? rest_init+0x140/0x140
> [ 14.010926] kernel_init+0x9/0xf0
> [ 14.011246] ret_from_fork+0x2a/0x40
> [ 14.011597] Code: 85 c0 48 89 c3 74 12 b9 00 10 00 00 48 89 c2 31 f6 4c =
89 ef e8 06 cd ff ff 4c 89
> e2 48 89 de 48 c7 c7 a8 22 d8 81 e8 b8 29 f2 ff <0f> ff 48 89 df e8 8a 78=
 f7 ff 5b 41 5c 41 5d 5d
> c3 0f 1f 00 48 =

> [ 14.013493] ---[ end trace a9df301187fd7f90 ]---
> [ 14.014703] evbug: Disconnected device: input8
> =

> # HH:MM RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start d5d341caa7a50b49e81633a44c09432352c8aad3 c0bc126f97fb929=
b3ae02c1c62322645d70eb408
> --
> git bisect bad 51e5cc319de921af4fe90fb662b0f64ee7bcd661 # 02:01 B 0 2 13 =
0 Merge 'kbuild/thin-ar'
> into devel-spot-201706262028
> git bisect good 5865115dc6f7b26c1b27a8026f7279996a2a5a35 # 02:15 G 11 0 0=
 0 Merge
> 'linux-review/Yuval-Shaia/IB-Move-PCI-dependency-from-root-KConfig-to-HW-=
s-KConfigs/20170626-185305'
> into devel-spot-201706262028
> git bisect bad 81c344439265b21d75a2aba66ff5a83dd217be86 # 02:26 B 0 11 22=
 0 Merge
> 'linux-review/David-H-rdeman/lirc_dev-modernisation/20170626-120627' into=
 devel-spot-201706262028
> git bisect good 33fc7d4cd19e464ee240e41ac22f21f73989026e # 02:34 G 11 0 0=
 0 Merge
> 'linux-review/Chris-Packham/dt-bindings-add-bindings-for-i2c-pca-platform=
/20170626-164851' into
> devel-spot-201706262028
> git bisect good b62822e9d45774b5e10eb3e22ec8c95b9d992e2a # 02:44 G 11 0 0=
 0 Merge
> 'linux-review/Karim-Eshapa/soc-qman-Sleep-instead-of-stuck-hacking-jiffie=
s/20170626-140438' into
> devel-spot-201706262028
> git bisect good 3208a8c7859dd7f84118c84104008fcb5a62374e # 02:54 G 11 0 0=
 0 Merge
> 'linux-review/kys-exchange-microsoft-com/Drivers-hv-vmbus-Ringbuffer-clea=
nup-and-optimizations/20170
> 26-145401' into devel-spot-201706262028
> git bisect good 3bbbeeb06c797db2d5262ca0858bbbebb42a9f05 # 03:04 G 11 0 0=
 0 Merge
> 'linux-review/Tommy-Nguyen/android-Update-maintainer-s-e-mail-in-TODO/201=
70626-070306' into
> devel-spot-201706262028
> git bisect good 69793afc5adcad6b9ef5030e9e601753444b2f65 # 03:19 G 11 0 0=
 0 Merge
> 'linux-review/Michel-Thierry/drm-i915-There-is-only-one-fault-register-fr=
om-Gen8-onwards/20170626-10
> 102' into devel-spot-201706262028
> git bisect good 1dc17ad92d91dd15a0cdd3dac4b506f373fa237c # 03:29 G 11 0 0=
 0 lirc_dev: remove
> kmalloc in lirc_dev_fop_read()
> git bisect bad 112a49c460556a79e29aa1f68389ebbade3577e7 # 03:41 B 0 11 24=
 2 lirc_dev: use an IDA
> instead of an array to keep track of registered devices
> git bisect bad 8db0604fcd9a6b5efc91f9887e9f8a13c9e7a94c # 03:51 B 0 3 16 =
2 lirc_dev: sanitize
> locking
> git bisect good 0a5e5446fdde36165ce9313631547acc321c7408 # 04:06 G 11 0 0=
 0 lirc_dev: change
> irctl->attached to be a boolean
> # first bad commit: [8db0604fcd9a6b5efc91f9887e9f8a13c9e7a94c] lirc_dev: =
sanitize locking
> git bisect good 0a5e5446fdde36165ce9313631547acc321c7408 # 04:08 G 31 0 0=
 0 lirc_dev: change
> irctl->attached to be a boolean
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect bad 8db0604fcd9a6b5efc91f9887e9f8a13c9e7a94c # 04:16 B 0 5 16 =
0 lirc_dev: sanitize
> locking
> # extra tests on HEAD of linux-devel/devel-spot-201706262028
> git bisect bad d5d341caa7a50b49e81633a44c09432352c8aad3 # 04:22 B 0 91 10=
5 0 0day head guard for
> 'devel-spot-201706262028'
> # extra tests on tree/branch linux-review/David-H-rdeman/lirc_dev-moderni=
sation/20170626-120627
> git bisect good 160b9262d9ce204fa45b059ea8bfe21a6d63e689 # 04:34 G 11 0 0=
 0 lirc_dev: consistent
> device registration printk
> =

> ---
> 0-DAY kernel test infrastructure Open Source Technology Center
> https://lists.01.org/pipermail/lkp Intel Corporation

--===============1803250773892285241==--

