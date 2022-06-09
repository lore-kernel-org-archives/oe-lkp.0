Content-Type: multipart/mixed; boundary="===============7790630215513487569=="
MIME-Version: 1.0
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: lkp@lists.01.org
Subject: Re: [mtd] a2af0cae87: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 09 Jun 2022 14:35:51 +0200
Message-ID: <20220609143551.2c75d949@xps-13>
In-Reply-To: <20220608154404.GD31193@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7790630215513487569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ansuel,

oliver.sang(a)intel.com wrote on Wed, 8 Jun 2022 23:44:04 +0800:

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: a2af0cae87a0205f2f4b89da6e628229a2f8c47f ("[PATCH v5 3/3] mtd: co=
re: introduce of support for dynamic partitions")
> url: https://github.com/intel-lab-lkp/linux/commits/Ansuel-Smith/Add-nvme=
m-support-for-dynamic-partitions/20220606-232755
> base: https://git.kernel.org/cgit/linux/kernel/git/mtd/linux.git mtd/next
> patch link: https://lore.kernel.org/linux-mtd/20220606151417.19227-4-ansu=
elsmth(a)gmail.com
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Can you look into this?

Thanks,
Miqu=C3=A8l

> =

> =

> +---------------------------------------------+------------+------------+
> |                                             | 96a45c785b | a2af0cae87 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 25         | 0          |
> | boot_failures                               | 0          | 12         |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 12         |
> | Oops:#[##]                                  | 0          | 12         |
> | EIP:add_mtd_device                          | 0          | 12         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 12         |
> +---------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [    2.820056][    T1] BUG: kernel NULL pointer dereference, address: 000=
00360
> [    2.821034][    T1] #PF: supervisor read access in kernel mode
> [    2.821862][    T1] #PF: error_code(0x0000) - not-present page
> [    2.822468][    T1] *pde =3D 00000000
> [    2.822468][    T1] Oops: 0000 [#1]
> [    2.822468][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 5.18.0-rc3=
-00074-ga2af0cae87a0 #1
> [    2.822468][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [    2.822468][    T1] EIP: add_mtd_device+0x32d/0x6a0
> [    2.822468][    T1] Code: 01 ff ff ff 8d 50 ff 85 c2 0f 84 ec fe ff ff=
 31 c0 e9 ef fe ff ff 8d b4 26 00 00 00 00 8b 83 cc 03 00 00 3d 08 ff ff ff=
 74 0e <8b> 80 60 03 00 00 85 c0 0f 85 65 01 00 00 8b 7d 84 89 f8 e8 3b 61
> [    2.822468][    T1] EAX: 00000000 EBX: c6eaa000 ECX: 00000001 EDX: 000=
00000
> [    2.822468][    T1] ESI: 00000000 EDI: c6eaa0f8 EBP: c3f0becc ESP: c3f=
0be44
> [    2.822468][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010213
> [    2.822468][    T1] CR0: 80050033 CR2: 00000360 CR3: 0345a000 CR4: 000=
406d0
> [    2.822468][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [    2.822468][    T1] DR6: fffe0ff0 DR7: 00000400
> [    2.822468][    T1] Call Trace:
> [    2.822468][    T1]  ? parse_ofoldpart_partitions+0x60/0x60
> [    2.822468][    T1]  ? mtd_part_of_parse+0x118/0x240
> [    2.822468][    T1]  ? mtd_part_of_parse+0x20e/0x240
> [    2.822468][    T1]  ? parse_mtd_partitions+0xfa/0x200
> [    2.822468][    T1]  mtd_device_parse_register+0x19f/0x2b0
> [    2.822468][    T1]  mtdram_init_device+0xb7/0x100
> [    2.822468][    T1]  init_mtdram+0x67/0xaf
> [    2.822468][    T1]  ? init_phram+0x54/0x54
> [    2.822468][    T1]  do_one_initcall+0x58/0x240
> [    2.822468][    T1]  ? rdinit_setup+0x38/0x38
> [    2.822468][    T1]  do_initcalls+0xf3/0x112
> [    2.822468][    T1]  kernel_init_freeable+0xbd/0xec
> [    2.822468][    T1]  ? rest_init+0x100/0x100
> [    2.822468][    T1]  kernel_init+0x12/0xf0
> [    2.822468][    T1]  ret_from_fork+0x1c/0x30
> [    2.822468][    T1] Modules linked in:
> [    2.822468][    T1] CR2: 0000000000000360
> [    2.822468][    T1] ---[ end trace 0000000000000000 ]---
> [    2.822468][    T1] EIP: add_mtd_device+0x32d/0x6a0
> [    2.822468][    T1] Code: 01 ff ff ff 8d 50 ff 85 c2 0f 84 ec fe ff ff=
 31 c0 e9 ef fe ff ff 8d b4 26 00 00 00 00 8b 83 cc 03 00 00 3d 08 ff ff ff=
 74 0e <8b> 80 60 03 00 00 85 c0 0f 85 65 01 00 00 8b 7d 84 89 f8 e8 3b 61
> [    2.822468][    T1] EAX: 00000000 EBX: c6eaa000 ECX: 00000001 EDX: 000=
00000
> [    2.822468][    T1] ESI: 00000000 EDI: c6eaa0f8 EBP: c3f0becc ESP: c3f=
0be44
> [    2.822468][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010213
> [    2.822468][    T1] CR0: 80050033 CR2: 00000360 CR3: 0345a000 CR4: 000=
406d0
> [    2.822468][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [    2.822468][    T1] DR6: fffe0ff0 DR7: 00000400
> [    2.822468][    T1] Kernel panic - not syncing: Fatal exception
> [    2.822468][    T1] Kernel Offset: disabled
> =

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.18.0-rc3-00074-ga2af0cae87a0 .config
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 olddefconfig prepare module=
s_prepare bzImage modules
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

>=20
--===============7790630215513487569==--

