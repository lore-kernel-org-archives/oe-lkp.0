Content-Type: multipart/mixed; boundary="===============7476650696439340537=="
MIME-Version: 1.0
From: Fabian Frederick <fabf@skynet.be>
To: lkp@lists.01.org
Subject: Re: [befs] BUG: unable to handle kernel paging request at cfc07000
Date: Fri, 01 Aug 2014 12:20:35 +0200
Message-ID: <1246830567.83786.1406888435084.open-xchange@webmail.nmp.skynet.be>
In-Reply-To: <20140801012506.GA8729@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7476650696439340537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On 01 August 2014 at 03:25 Fengguang Wu <fengguang.wu@intel.com> wrote:
>
>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit dac52fc1826a788d2591a4f77e3c482b30f577e2
> Author:=C2=A0 =C2=A0 =C2=A0Fabian Frederick <fabf@skynet.be>
> AuthorDate: Thu Apr 3 14:50:23 2014 -0700
> Commit:=C2=A0 =C2=A0 =C2=A0Linus Torvalds <torvalds@linux-foundation.or=
g>
> CommitDate: Thu Apr 3 16:21:25 2014 -0700
>
>=C2=A0 =C2=A0 =C2=A0BEFS: logging cleanup
>=C2=A0 =C2=A0 =C2=A0
>=C2=A0 =C2=A0 =C2=A0Summary:
>=C2=A0 =C2=A0 =C2=A0 - all printk(KERN_foo converted to pr_foo()
>=C2=A0 =C2=A0 =C2=A0 - add pr_fmt and remove redundant prefixes
>=C2=A0 =C2=A0 =C2=A0 - convert befs_() to va_format (based on patch by Joe=
 Perches)
>=C2=A0 =C2=A0 =C2=A0 - remove non standard %Lu
>=C2=A0 =C2=A0 =C2=A0 - use __func__ for all debugging
>=C2=A0 =C2=A0 =C2=A0
>=C2=A0 =C2=A0 =C2=A0[akpm(a)linux-foundation.org: fix printk warnings, rep=
orted by Fengguang]
>=C2=A0 =C2=A0 =C2=A0Signed-off-by: Fabian Frederick <fabf@skynet.be>
>=C2=A0 =C2=A0 =C2=A0Cc: Joe Perches <joe@perches.com>
>=C2=A0 =C2=A0 =C2=A0Cc: Fengguang Wu <fengguang.wu@gmail.com>
>=C2=A0 =C2=A0 =C2=A0Signed-off-by: Andrew Morton <akpm@linux-foundation.=
org>
>=C2=A0 =C2=A0 =C2=A0Signed-off-by: Linus Torvalds <torvalds@linux-founda=
tion.org>
>
> +--------------------------------------------+------------+------------+-=
--------------+
> |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 91a52ab7d6 | dac52fc182 |
> next-20140730 |
> +--------------------------------------------+------------+------------+-=
--------------+
> | boot_successes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1000=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 895=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 159=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | boot_failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | BUG:unable_to_handle_kernel_paging_request | 0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | Oops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 2=C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | EIP_is_at_strnlen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | Kernel_panic-not_syncing:Fatal_exception=C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | backtrace:do_mount=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | backtrace:SyS_mount=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=C2=A0 =C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> +--------------------------------------------+------------+------------+-=
--------------+
>
> [=C2=A0 =C2=A0 6.576645] power_supply test_battery: prop PRESENT=3D1
> [=C2=A0 =C2=A0 6.578273] power_supply test_usb: uevent
> [=C2=A0 =C2=A0 6.579644] power_supply test_usb: POWER_SUPPLY_NAME=3Dtest_=
usb
> [=C2=A0 =C2=A0 6.581395] BUG: unable to handle kernel paging request at c=
fc07000
> [=C2=A0 =C2=A0 6.583373] IP: [] strnlen+0x9/0x19
> [=C2=A0 =C2=A0 6.584678] *pde =3D 13bc1067 *pte =3D 0fc07060
> [=C2=A0 =C2=A0 6.584678] Oops: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
> [=C2=A0 =C2=A0 6.584678] CPU: 0 PID: 483 Comm: mount Not tainted 3.14.0-0=
7551-gdac52fc
> #1
> [=C2=A0 =C2=A0 6.584678] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS
> Bochs 01/01/2011
> [=C2=A0 =C2=A0 6.584678] task: d0d29500 ti: d006e000 task.ti: d006e000
> [=C2=A0 =C2=A0 6.584678] EIP: 0060:[] EFLAGS: 00010097 CPU: 0
> [=C2=A0 =C2=A0 6.584678] EIP is at strnlen+0x9/0x19
> [=C2=A0 =C2=A0 6.584678] EAX: cfc07000 EBX: d006fe40 ECX: cfc06200 EDX: f=
ffff1fe
> [=C2=A0 =C2=A0 6.584678] ESI: d006fe44 EDI: c2247728 EBP: d006fcb8 ESP: d=
006fcb8
> [=C2=A0 =C2=A0 6.584678]=C2=A0 DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 00=
68
> [=C2=A0 =C2=A0 6.584678] CR0: 8005003b CR2: cfc07000 CR3: 10f33000 CR4: 0=
00006d0
> [=C2=A0 =C2=A0 6.584678] Stack:
> [=C2=A0 =C2=A0 6.584678]=C2=A0 d006fcd4 c138e850 cfc06200 c2247361 d006fe=
40 d006fe44 c1acbda3
> d006fd1c
> [=C2=A0 =C2=A0 6.584678]=C2=A0 c138fa8f c1e13600 d006ffff c183ffff 879a3b=
ef d006fcfc c10824cf
> 000003ce
> [=C2=A0 =C2=A0 6.584678]=C2=A0 c224735a c1acbda3 c2247728 c2247361 ff0a00=
04 ffffffff c105ffff
> c224735a
> [=C2=A0 =C2=A0 6.584678] Call Trace:
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] string.isra.5+0x29/0x93
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] vsnprintf+0x159/0x281
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? _raw_spin_unlock_irq+0x5/0x3e
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? tick_program_event+0x22/0x26
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? load_balance+0x3fc/0x681
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] pointer.isra.16+0x220/0x37e
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? string.isra.5+0x29/0x93
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] vsnprintf+0x194/0x281
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? _raw_spin_lock_irq+0x62/0x72
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? load_balance+0x3fc/0x681
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? pc_clock_adjtime+0x33/0x4b
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] vscnprintf+0x14/0x25
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] vprintk_emit+0x249/0x451
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] printk+0x38/0x3a
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] befs_debug+0x37/0x39
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] befs_dump_super_block+0x30/0x28d
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? befs_load_sb+0x127/0x13b
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] befs_fill_super+0x22d/0x384
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? disk_name+0x30/0x81
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? ns_test_super+0x11/0x11
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] mount_bdev+0x113/0x15b
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? arch_local_irq_save+0x12/0x17
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? __kmalloc_track_caller+0x103/0x127
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] befs_mount+0x1a/0x1f
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? __ilog2_u32+0xf/0xf
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] mount_fs+0x16/0xaf
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? __alloc_percpu+0xa/0xc
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? alloc_vfsmnt+0x93/0x134
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] vfs_kern_mount+0x43/0x9f
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] do_mount+0x5b7/0x6c4
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] ? strndup_user+0x2c/0x3d
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] SyS_mount+0x77/0xa4
> [=C2=A0 =C2=A0 6.584678]=C2=A0 [] syscall_call+0x7/0xb
> [=C2=A0 =C2=A0 6.584678] Code: 00 00 4f eb 02 31 ff 89 f8 5f 5d c3 55 85 =
c9 89 e5 57 89
> c7 74 07 89 d0 f2 ae 75 01 4f 89 f8 5f 5d c3 55 89 c1 89 e5 89 c8 eb 06 <=
80>
> 38 00 74 07 40 4a 83 fa ff 75 f4 29 c8 5d c3 55 83 c9 ff 89
> [=C2=A0 =C2=A0 6.584678] EIP: [] strnlen+0x9/0x19 SS:ESP 0068:d006fcb8
> [=C2=A0 =C2=A0 6.584678] CR2: 00000000cfc07000
> [=C2=A0 =C2=A0 6.584678] ---[ end trace d80bc704897c976c ]---
> [=C2=A0 =C2=A0 6.584678] Kernel panic - not syncing: Fatal exception
>
> git bisect start v3.15 v3.14 --
> git bisect=C2=A0 bad 674366e90e5a2430e3ddef40ce51512d681944e4=C2=A0 # 22:=
06=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 2=C2=A0 Merge tag 'pci-v3.15-fixes-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci
> git bisect=C2=A0 bad 9f800363bb0ea459e15bef0928a72c88d374e489=C2=A0 # 22:=
06=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 Merge tag 'fixes-non-critical-3.15' of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
> git bisect good 1aabc5990d205cdb0789a1c26143c53601e9bb07=C2=A0 # 22:46=C2=
=A0 =C2=A0 900+=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 x86: Fix dumpstack_64 to keep state of "used" variable in loop
> git bisect good d0cb5f71c5cde8e1ef6d03983641366800ceabdb=C2=A0 # 23:44=C2=
=A0 =C2=A0 900+=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 Merge tag 'vfio-v3.15-rc1' of git://github.com/awilliam/linux-vfio
> git bisect=C2=A0 bad d15fee814d8d30bbb4859ef8fef7a1f96327635b=C2=A0 # 23:=
44=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 2=C2=A0 Merge branch 'for-linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse
> git bisect=C2=A0 bad 4a4389abdd9822fdf3cc2ac6ed87eb811fd43acc=C2=A0 # 23:=
44=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 4=C2=A0 Merge branch 'linux_next' of
> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-edac
> git bisect=C2=A0 bad 3cf59142bcd391680beb6932838fe09a73947705=C2=A0 # 23:=
44=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 Merge tag 'hwmon-for-linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
> git bisect=C2=A0 bad 76ca7d1cca761bb9712dfcad9a27d70b520874ae=C2=A0 # 23:=
44=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 2=C2=A0 Merge branch 'akpm' (incoming from Andrew)
> git bisect good 70d14fcf365c1b20d380d542ec53906f2b5e2435=C2=A0 # 00:29=C2=
=A0 =C2=A0 900+=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 MAINTAINERS: add backlight co-maintainers
> git bisect good 98e2d21faaf96d879e2746cedd96f5c38c04f9b3=C2=A0 # 02:11=C2=
=A0 =C2=A0 900+=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 rtc: rtc-sirfsoc: remove unnecessary OOM messages
> git bisect good fda9909ddaab13fb7b35b94f204623c1f9571fc7=C2=A0 # 02:47=C2=
=A0 =C2=A0 900+=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 rtc: pm8xxx: move device_init_wakeup() before rtc_register
> git bisect=C2=A0 bad 2cc88f3a5f16ae9a3c8f54de1b2fd4a397b36075=C2=A0 # 02:=
53=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 nilfs2: implementation of NILFS_IOCTL_SET_SUINFO ioctl
> git bisect good 84ee353df07e9beec200da44ac70f583449fffb1=C2=A0 # 05:13=C2=
=A0 =C2=A0 900+=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 fs/minix/inode.c: add __init to init_inodecache()
> git bisect=C2=A0 bad 5f356fd4d75fd66e62c803fc7a684863c4b38e59=C2=A0 # 05:=
33=C2=A0 =C2=A0 104-=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 fs/coda/inode.c: add __init to init_inodecache()
> git bisect good 91a52ab7d664a1c8972a0ecb30955d34aea54d7f=C2=A0 # 07:03=C2=
=A0 =C2=A0 900+=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 fs/befs/linuxvfs.c: add __init to befs_init_inodecache()
> git bisect=C2=A0 bad dac52fc1826a788d2591a4f77e3c482b30f577e2=C2=A0 # 07:=
09=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 BEFS: logging cleanup
> # first bad commit: [dac52fc1826a788d2591a4f77e3c482b30f577e2] BEFS: logg=
ing
> cleanup
> git bisect good 91a52ab7d664a1c8972a0ecb30955d34aea54d7f=C2=A0 # 07:15=C2=
=A0 =C2=A01000+=C2=A0 =C2=A0 =C2=A0
> 0=C2=A0 fs/befs/linuxvfs.c: add __init to befs_init_inodecache()
> git bisect=C2=A0 bad fcf6395d41087217d4b88d5b2ad7a1ce66ca6ced=C2=A0 # 07:=
15=C2=A0 =C2=A0 =C2=A0 0-=C2=A0 =C2=A0 =C2=A0
> 2=C2=A0 Add linux-next specific files for 20140730
> git bisect=C2=A0 bad 7c909b09372d5b064651202bf236b63caddd1777=C2=A0 # 07:=
39=C2=A0 =C2=A0 219-=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 Merge tag 'clk-fixes-for-linus' of
> git://git.linaro.org/people/mike.turquette/linux
> git bisect=C2=A0 bad 5c159783e8086645dd7aa42e35c531ad0e8dd16d=C2=A0 # 07:=
51=C2=A0 =C2=A0 =C2=A0 9-=C2=A0 =C2=A0 =C2=A0
> 1=C2=A0 Add linux-next specific files for 20140731
>
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dyocto-minimal-i386.cgz
>
> wget --no-clobber
> https://github.com/fengguang/reproduce-kernel-bug/raw/master/initrd/$init=
rd
>
> kvm=3D(
>=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-system-x86_64
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-cpu kvm64
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-enable-kvm
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-kernel $kernel
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-initrd $initrd
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-m 320
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-smp 1
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-net nic,vlan=3D1,model=3De1000
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-net user,vlan=3D1
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-boot order=3Dnc
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-no-reboot
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-watchdog i6300esb
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-rtc base=3Dlocaltime
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-serial stdio
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-display none
>=C2=A0 =C2=A0 =C2=A0 =C2=A0-monitor null
> )
>
> append=3D(
>=C2=A0 =C2=A0 =C2=A0 =C2=A0hung_task_panic=3D1
>=C2=A0 =C2=A0 =C2=A0 =C2=A0earlyprintk=3DttyS0,115200
>=C2=A0 =C2=A0 =C2=A0 =C2=A0debug
>=C2=A0 =C2=A0 =C2=A0 =C2=A0apic=3Ddebug
>=C2=A0 =C2=A0 =C2=A0 =C2=A0sysrq_always_enabled
>=C2=A0 =C2=A0 =C2=A0 =C2=A0rcupdate.rcu_cpu_stall_timeout=3D100
>=C2=A0 =C2=A0 =C2=A0 =C2=A0panic=3D10
>=C2=A0 =C2=A0 =C2=A0 =C2=A0softlockup_panic=3D1
>=C2=A0 =C2=A0 =C2=A0 =C2=A0nmi_watchdog=3Dpanic
>=C2=A0 =C2=A0 =C2=A0 =C2=A0load_ramdisk=3D2
>=C2=A0 =C2=A0 =C2=A0 =C2=A0prompt_ramdisk=3D0
>=C2=A0 =C2=A0 =C2=A0 =C2=A0console=3DttyS0,115200
>=C2=A0 =C2=A0 =C2=A0 =C2=A0console=3Dtty0
>=C2=A0 =C2=A0 =C2=A0 =C2=A0vga=3Dnormal
>=C2=A0 =C2=A0 =C2=A0 =C2=A0root=3D/dev/ram0
>=C2=A0 =C2=A0 =C2=A0 =C2=A0rw
>=C2=A0 =C2=A0 =C2=A0 =C2=A0drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> Thanks,
> Fengguang

Hello Fengguang,

null block was not used due to a problem in initrd wget.

I've run your config several times but still have no error here :
=C2=A0 =C2=A0 =C2=A0 =C2=A0
[=C2=A0 =C2=A012.931229] befs: (nullb1): ---> befs_fill_super
[=C2=A0 =C2=A012.978560] befs: (nullb1): No write support. Marking filesyst=
em read-only
[=C2=A0 =C2=A012.987596] befs: (nullb0): ---> befs_fill_super
[=C2=A0 =C2=A012.990460] befs: (nullb1): Using x86 superblock location
[=C2=A0 =C2=A012.993315] befs: (nullb1): befs_super_block information
[=C2=A0 =C2=A012.996255] befs: (nullb0): No write support. Marking filesyst=
em read-only
[=C2=A0 =C2=A012.999839] befs: (nullb0): Using x86 superblock location
[=C2=A0 =C2=A013.002770] befs: (nullb0): befs_super_block information
[=C2=A0 =C2=A013.005642] befs: (nullb1):=C2=A0 =C2=A0name
[=C2=A0 =C2=A013.007830] befs: (nullb1):=C2=A0 =C2=A0magic1 00000000
...

Regards,
Fabian

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com

--===============7476650696439340537==--

