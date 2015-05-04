Content-Type: multipart/mixed; boundary="===============7700425245326774031=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mtd] 6b44d910ae7: WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:3547 check_flags+0xae/0x17b()
Date: Mon, 04 May 2015 10:37:48 +0800
Message-ID: <1430707068.25120.141.camel@intel.com>
In-Reply-To: <20150428213700.GA10945@bugger.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============7700425245326774031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-04-28 at 23:37 +0200, Frans Klaver wrote:
> On Thu, Apr 16, 2015 at 01:27:14PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > commit 6b44d910ae7de5316fcf1fc828ff4a8d48cac5e2 ("mtd: core: set some d=
efaults when dev.parent is set")
> > =

> > =

> > [    5.566033] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.566033] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.567490] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.567490] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.568935] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.568935] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.570362] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.570362] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.571786] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.571786] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.573195] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.573195] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    5.574628] nand: device found, Manufacturer ID: 0x98, Chip ID: 0x39
> > [    5.574628] nand: device found, Manufacturer ID: 0x98, Chip ID: 0x39
> > [    5.575662] nand: Toshiba NAND 128MiB 1,8V 8-bit
> > [    5.575662] nand: Toshiba NAND 128MiB 1,8V 8-bit
> > [    5.576417] nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512, =
OOB size: 16
> > [    5.576417] nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512, =
OOB size: 16
> > [    5.577576] flash size: 128 MiB
> > [    5.577576] flash size: 128 MiB
> > [    5.578060] page size: 512 bytes
> > [    5.578060] page size: 512 bytes
> > [    5.578556] OOB area size: 16 bytes
> > [    5.578556] OOB area size: 16 bytes
> > [    5.579085] sector size: 16 KiB
> > [    5.579085] sector size: 16 KiB
> > [    5.579568] pages number: 262144
> > [    5.579568] pages number: 262144
> > [    5.580114] pages per sector: 32
> > [    5.580114] pages per sector: 32
> > [    5.580659] bus width: 8
> > [    5.580659] bus width: 8
> > [    5.581067] bits in sector size: 14
> > [    5.581067] bits in sector size: 14
> > [    5.581605] bits in page size: 9
> > [    5.581605] bits in page size: 9
> > [    5.582102] bits in OOB size: 4
> > [    5.582102] bits in OOB size: 4
> > [    5.582593] flash size with OOB: 135168 KiB
> > [    5.582593] flash size with OOB: 135168 KiB
> > [    5.583235] page address bytes: 4
> > [    5.583235] page address bytes: 4
> > [    5.583749] sector address bytes: 3
> > [    5.583749] sector address bytes: 3
> > [    5.584332] options: 0x42
> > [    5.584332] options: 0x42
> > [    5.586063] Scanning device for bad blocks
> > [    5.586063] Scanning device for bad blocks
> > [    5.609792] ftl_cs: FTL header not found.
> > [    5.609792] ftl_cs: FTL header not found.
> > [    5.612150] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
> > [    5.612150] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
> > [    5.613131] 0x000000000000-0x000008000000 : "NAND simulator partitio=
n 0"
> > [    5.613131] 0x000000000000-0x000008000000 : "NAND simulator partitio=
n 0"
> > [    5.614496] BUG: unable to handle kernel =

> > [    5.614496] BUG: unable to handle kernel NULL pointer dereferenceNUL=
L pointer dereference at 00000008
> >  at 00000008
> > [    5.615637] IP:
> > [    5.615637] IP: [<818c8620>] add_mtd_device+0x194/0x313
> >  [<818c8620>] add_mtd_device+0x194/0x313
> > [    5.616041] *pde =3D 00000000 =

> > [    5.616041] *pde =3D 00000000 =

> > =

> > [    5.616041] Oops: 0000 [#1] =

> > [    5.616041] Oops: 0000 [#1] DEBUG_PAGEALLOC DEBUG_PAGEALLOC =

> > =

> > [    5.616041] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.=
0.0-08945-gcb973ec #3
> > [    5.616041] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.=
0.0-08945-gcb973ec #3
> > [    5.616041] task: 94680000 ti: 94688000 task.ti: 94688000
> > [    5.616041] task: 94680000 ti: 94688000 task.ti: 94688000
> > [    5.616041] EIP: 0060:[<818c8620>] EFLAGS: 00010202 CPU: 0
> > [    5.616041] EIP: 0060:[<818c8620>] EFLAGS: 00010202 CPU: 0
> > [    5.616041] EIP is at add_mtd_device+0x194/0x313
> > [    5.616041] EIP is at add_mtd_device+0x194/0x313
> > [    5.616041] EAX: 8bc100f0 EBX: 00000001 ECX: 00000001 EDX: 00000000
> > [    5.616041] EAX: 8bc100f0 EBX: 00000001 ECX: 00000001 EDX: 00000000
> > [    5.616041] ESI: 8caf9c20 EDI: 00000001 EBP: 94689ea8 ESP: 94689e98
> > [    5.616041] ESI: 8caf9c20 EDI: 00000001 EBP: 94689ea8 ESP: 94689e98
> > [    5.616041]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> > [    5.616041]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> > [    5.616041] CR0: 80050033 CR2: 00000008 CR3: 027cf000 CR4: 00040690
> > [    5.616041] CR0: 80050033 CR2: 00000008 CR3: 027cf000 CR4: 00040690
> > [    5.616041] Stack:
> > [    5.616041] Stack:
> > [    5.616041]  00000000
> > [    5.616041]  00000000 00000000 00000000 8caf9c20 8caf9c20 00000000 0=
0000000 94689ecc 94689ecc 818cc564 818cc564 00cabab3 00cabab3 00000001 0000=
0001
> > =

> > [    5.616041]  8bc10000
> > [    5.616041]  8bc10000 8c3eb820 8c3eb820 00000001 00000001 8bc10000 8=
bc10000 8c3eb820 8c3eb820 94689ee4 94689ee4 818c888c 818c888c 8c3eb820 8c3e=
b820
> > =

> > [    5.616041]  00000000
> > [    5.616041]  00000000 8bc10000 8bc10000 8bc10000 8bc10000 94689f24 9=
4689f24 82772ced 82772ced 8bc1066c 8bc1066c 00000001 00000001 00000000 0000=
0000
> > =

> > [    5.616041] Call Trace:
> > [    5.616041] Call Trace:
> > [    5.616041]  [<818cc564>] add_mtd_partitions+0xc2/0xef
> > [    5.616041]  [<818cc564>] add_mtd_partitions+0xc2/0xef
> > [    5.616041]  [<818c888c>] mtd_device_parse_register+0xed/0x16f
> > [    5.616041]  [<818c888c>] mtd_device_parse_register+0xed/0x16f
> > [    5.616041]  [<82772ced>] ns_init_module+0x1384/0x13fc
> > [    5.616041]  [<82772ced>] ns_init_module+0x1384/0x13fc
> > [    5.616041]  [<82771969>] ? probe_docg4+0x626/0x626
> > [    5.616041]  [<82771969>] ? probe_docg4+0x626/0x626
> > [    5.616041]  [<8271411c>] do_one_initcall+0x128/0x278
> > [    5.616041]  [<8271411c>] do_one_initcall+0x128/0x278
> > [    5.616041]  [<816610d6>] ? strlen+0x9/0x1c
> > [    5.616041]  [<816610d6>] ? strlen+0x9/0x1c
> > [    5.616041]  [<82713500>] ? do_early_param+0x92/0xac
> > [    5.616041]  [<82713500>] ? do_early_param+0x92/0xac
> > [    5.616041]  [<8105f0be>] ? parse_args+0x367/0x45f
> > [    5.616041]  [<8105f0be>] ? parse_args+0x367/0x45f
> > [    5.616041]  [<827144e4>] kernel_init_freeable+0x278/0x33d
> > [    5.616041]  [<827144e4>] kernel_init_freeable+0x278/0x33d
> > [    5.616041]  [<81c98a6e>] kernel_init+0xe/0x139
> > [    5.616041]  [<81c98a6e>] kernel_init+0xe/0x139
> > [    5.616041]  [<81cb0240>] ret_from_kernel_thread+0x20/0x30
> > [    5.616041]  [<81cb0240>] ret_from_kernel_thread+0x20/0x30
> > [    5.616041]  [<81c98a60>] ? rest_init+0x131/0x131
> > [    5.616041]  [<81c98a60>] ? rest_init+0x131/0x131
> > [    5.616041] Code:
> > [    5.616041] Code: d8 d8 74 74 62 62 82 82 84 84 c9 c9 74 74 65 65 83=
 83 be be ec ec 00 00 00 00 00 00 00 00 0f 0f 94 94 c1 c1 0f 0f b6 b6 f9 f9=
 8b 8b 14 14 bd bd c4 c4 74 74 62 62 82 82 42 42 89 89 14 14 bd bd c4 c4 74=
 74 62 62 82 82 84 84 c9 c9 74 74 0c 0c 8b 8b 50 50 7c 7c <8b> <8b> 52 52 0=
8 08 89 89 96 96 ec ec 00 00 00 00 00 00 83 83 7e 7e 38 38 00 00 0f 0f 94 9=
4 c1 c1 0f 0f b6 b6 f9 f9 8b 8b 14 14
> > =

> > [    5.616041] EIP: [<818c8620>] =

> > [    5.616041] EIP: [<818c8620>] add_mtd_device+0x194/0x313add_mtd_devi=
ce+0x194/0x313 SS:ESP 0068:94689e98
> >  SS:ESP 0068:94689e98
> > [    5.616041] CR2: 0000000000000008
> > [    5.616041] CR2: 0000000000000008
> > [    5.616041] ---[ end trace 1ca0c76386d57ae6 ]---
> > [    5.616041] ---[ end trace 1ca0c76386d57ae6 ]---
> > [    5.616041] Kernel panic - not syncing: Fatal exception
> > [    5.616041] Kernel panic - not syncing: Fatal exception
> > [    5.616041] Kernel Offset: disabled
> > [    5.616041] Kernel Offset: disabled
> > =

> > Elapsed time: 10
> > qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -kernel /kernel/i=
386-randconfig-nexs0-04131730+CONFIG_DEBUG_INFO/cb973eca7f9b50e81a5544e4e91=
e6bf516e10322/vmlinuz-4.0.0-08945-gcb973ec -append 'root=3D/dev/ram0 user=
=3Dlkp job=3D/lkp/scheduled/vm-vp-quantal-i386-33/rand_boot-1-quantal-core-=
i386.cgz-i386-randconfig-nexs0-04131730+CONFIG_DEBUG_INFO-cb973eca7f9b50e81=
a5544e4e91e6bf516e10322-1-20150416-99016-oo4h64.yaml ARCH=3Di386 kconfig=3D=
i386-randconfig-nexs0-04131730+CONFIG_DEBUG_INFO branch=3Dnext/master commi=
t=3Dcb973eca7f9b50e81a5544e4e91e6bf516e10322 BOOT_IMAGE=3D/kernel/i386-rand=
config-nexs0-04131730+CONFIG_DEBUG_INFO/cb973eca7f9b50e81a5544e4e91e6bf516e=
10322/vmlinuz-4.0.0-08945-gcb973ec RESULT_ROOT=3D/result/vm-vp-quantal-i386=
/boot/1/quantal-core-i386.cgz/i386-randconfig-nexs0-04131730+CONFIG_DEBUG_I=
NFO/cb973eca7f9b50e81a5544e4e91e6bf516e10322/0 LKP_SERVER=3Dinn earlyprintk=
=3DttyS0,115200 rd.udev.log-priority=3Derr systemd.log_target=3Djournal sys=
temd.log_level=3Dwarning debug apic=3Ddebug sysrq_always_enabled rcupdate.r=
cu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dp=
anic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,11520=
0 console=3Dtty0 vga=3Dnormal rw ip=3D::::vm-vp-quantal-i386-33::dhcp drbd.=
minor_count=3D8'  -initrd /fs/sdh1/initrd-vm-vp-quantal-i386-33 -m 360 -smp=
 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-=
reboot -watchdog i6300esb -rtc base=3Dlocaltime -pidfile /dev/shm/kboot/pid=
-vm-vp-quantal-i386-33 -serial file:/dev/shm/kboot/serial-vm-vp-quantal-i38=
6-33 -daemonize -display none -monitor null =

> =

> I can't seem to reproduce this in qemu. Is there a way to get the same
> setup you have so I can investigate?

Have you tried with the following root file system image (initrd)?

quantal-core-i386.cgz in
https://github.com/fengguang/reproduce-kernel-bug/tree/master/initrd

Best Regards,
Huang, Ying



--===============7700425245326774031==--

