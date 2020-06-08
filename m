Content-Type: multipart/mixed; boundary="===============4932726118931463318=="
MIME-Version: 1.0
From: Matthias Brugger <matthias.bgg@gmail.com>
To: lkp@lists.01.org
Subject: Re: 7edd363421 ("mfd: Add support for PMIC MT6360"): [ 121.241021] BUG: kernel NULL pointer dereference, address: 00000000
Date: Mon, 08 Jun 2020 11:17:05 +0200
Message-ID: <f680a770-b705-42ee-5862-a29e34dcbcef@gmail.com>
In-Reply-To: <20200606151517.GM12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4932726118931463318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 06/06/2020 17:15, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 7edd363421dab1d4806802ac65613d1c0ec85824
> Author:     Gene Chen <gene.chen.richtek@gmail.com>
> AuthorDate: Thu Apr 23 19:24:52 2020 +0800
> Commit:     Lee Jones <lee.jones@linaro.org>
> CommitDate: Wed May 27 07:46:18 2020 +0100
> =

>     mfd: Add support for PMIC MT6360
>     =

>     Add MFD driver for mt6360 pmic chip include Battery Charger/
>     USB_PD/Flash, LED/RGB and LED/LDO/Buck
>     =

>     Signed-off-by: Gene Chen <gene_chen@richtek.com>
>     Signed-off-by: Lee Jones <lee.jones@linaro.org>
> =

> 12e5bf757a  mfd: max77620: Use single-byte writes on MAX77620
> 7edd363421  mfd: Add support for PMIC MT6360
> 435faf5c21  Merge tag 'riscv-for-linus-5.8-mw0' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/riscv/linux
> +---------------------------------------------+------------+------------+=
------------+
> |                                             | 12e5bf757a | 7edd363421 |=
 435faf5c21 |
> +---------------------------------------------+------------+------------+=
------------+
> | boot_successes                              | 29         | 0          |=
 0          |
> | boot_failures                               | 1          | 15         |=
 10         |
> | BUG:kernel_hang_in_boot_stage               | 1          |            |=
            |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 15         |=
 10         |
> | Oops:#[##]                                  | 0          | 15         |=
 10         |
> | EIP:strcmp                                  | 0          | 15         |=
 10         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |=
 10         |
> +---------------------------------------------+------------+------------+=
------------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> [  121.091622] Phantom Linux Driver, version n0.9.8, init OK
> [  121.113939] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [  121.146046] Guest personality initialized and is inactive
> [  121.169091] VMCI host device registered (name=3Dvmci, major=3D10, mino=
r=3D60)
> [  121.188032] Initialized host personality
> [  121.241021] BUG: kernel NULL pointer dereference, address: 00000000
> [  121.243012] #PF: supervisor read access in kernel mode
> [  121.243012] #PF: error_code(0x0000) - not-present page
> [  121.243012] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 =

> [  121.243012] Oops: 0000 [#1] DEBUG_PAGEALLOC
> [  121.243012] CPU: 0 PID: 1 Comm: swapper Not tainted 5.7.0-rc1-00052-g7=
edd363421dab #1
> [  121.243012] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [  121.243012] EIP: strcmp+0x11/0x30
> [  121.243012] Code: fa 8b 75 f8 89 c8 8b 7d fc 89 ec 5d c3 8d b4 26 00 0=
0 00 00 8d 74 26 00 90 55 89 e5 83 ec 08 89 75 f8 89 c6 89 7d fc 89 d7 ac <=
ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 8b 75 f8 8b 7d fc 89
> [  121.243012] EAX: c2a8bc64 EBX: 00000000 ECX: 00000000 EDX: 00000000
> [  121.243012] ESI: c2a8bc79 EDI: 00000000 EBP: e54bdea8 ESP: e54bdea0
> [  121.243012] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010=
286
> [  121.243012] CR0: 80050033 CR2: 00000000 CR3: 02ec3000 CR4: 000006b0
> [  121.243012] Call Trace:
> [  121.243012]  kset_find_obj+0x3d/0xc0

This happens because the driver has no name. Actually I think we should fix=
 this
in the driver and in the base code.

I'll prepare some patches.

Regards,
Matthias

> [  121.243012]  driver_find+0x16/0x40
> [  121.243012]  driver_register+0x49/0x100
> [  121.243012]  ? i2c_for_each_dev+0x39/0x50
> [  121.243012]  ? __process_new_adapter+0x20/0x20
> [  121.243012]  ? cht_wc_driver_init+0x11/0x11
> [  121.243012]  i2c_register_driver+0x30/0x80
> [  121.243012]  ? intel_lpss_pci_driver_init+0x16/0x16
> [  121.243012]  mt6360_pmu_driver_init+0xf/0x11
> [  121.243012]  do_one_initcall+0x33/0x1a0
> [  121.243012]  ? parse_args+0x1eb/0x3d0
> [  121.243012]  ? __might_sleep+0x31/0x90
> [  121.243012]  ? kernel_init_freeable+0x10a/0x17f
> [  121.243012]  kernel_init_freeable+0x12c/0x17f
> [  121.243012]  ? rest_init+0x110/0x110
> [  121.243012]  kernel_init+0xb/0x100
> [  121.243012]  ? schedule_tail_wrapper+0x9/0xc
> [  121.243012]  ret_from_fork+0x19/0x24
> [  121.243012] Modules linked in:
> [  121.243012] CR2: 0000000000000000
> [  121.243012] random: get_random_bytes called from init_oops_id+0x3a/0x4=
0 with crng_init=3D0
> [  121.243012] ---[ end trace 38a803400f1a2bee ]---
> [  121.243012] EIP: strcmp+0x11/0x30
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start e7b08814b16b80a0bf76eeca16317f8c2ed23b8c v5.6 --
> git bisect good 0e698dfa282211e414076f9dc7e83c1c288314fd  # 10:46  G     =
10     0    0   0  Linux 5.7-rc4
> git bisect good e6dffbf84da606cdb0a9bbaf5578cd2f7f792e05  # 11:36  G     =
10     0    0   0  Merge remote-tracking branch 'omap/for-next'
> git bisect good 2a74742ab11f42d8f855b00f88b3ed269c68040b  # 12:11  G     =
10     0    0   0  Merge remote-tracking branch 'sound-asoc/for-next'
> git bisect  bad 259921c0dc98a30df65d25d91f2f5c95567d12c9  # 12:37  B     =
 0     1   17   0  Merge remote-tracking branch 'driver-core/driver-core-ne=
xt'
> git bisect  bad d9baaa8ac86327a7a913f79db4b7342d0fa09c91  # 12:56  B     =
 0     1   17   0  Merge remote-tracking branch 'iommu/next'
> git bisect  bad aacbf7c5e5f087e216d3c8772ef36ef46d873876  # 13:14  B     =
 0     1   17   0  Merge remote-tracking branch 'regulator/for-next'
> git bisect good f7793e0aaba983940644b9610e8a04d2c417b797  # 13:49  G     =
10     0    0   0  Merge remote-tracking branch 'pcmcia/pcmcia-next'
> git bisect  bad 5ba24b008cb7900cfe07e3bf27ff854e4cf520cc  # 14:51  B     =
 0     4   22   0  Merge remote-tracking branch 'mfd/for-mfd-next'
> git bisect good ae683dc18d5e3febf0a0346f56a641351a95dc48  # 15:29  G     =
10     0    1   1  Merge remote-tracking branch 'mmc/next'
> git bisect good 2f72d35ea75ee8bf8c9e63fb43d43d5bfb4ac8fd  # 15:49  G     =
10     0    0   0  MAINTAINERS: Update entry for Intel Broxton PMC driver
> git bisect good ff8bd0b59cfdabb9bc4c0941724fafaf9a508c07  # 16:08  G     =
10     0    0   0  mfd: tqmx86: Fix a typo in MODULE_DESCRIPTION
> git bisect good f4a1954036c1a256e89fb087eb39cb719336e7c4  # 16:23  G     =
10     0    0   0  mfd: wm8994: Fix unbalanced calls to regulator_bulk_disa=
ble()
> git bisect good 97eda5dcc2cde5dcc778bef7a9344db3b6bf8ef5  # 17:25  G     =
10     0    1   1  mfd: stmfx: Disable IRQ in suspend to avoid spurious int=
errupt
> git bisect good 12e5bf757a1fd03c5d736942428732be641daa1c  # 17:41  G     =
10     0    0   0  mfd: max77620: Use single-byte writes on MAX77620
> git bisect  bad 7edd363421dab1d4806802ac65613d1c0ec85824  # 18:00  B     =
 0     3   19   0  mfd: Add support for PMIC MT6360
> # first bad commit: [7edd363421dab1d4806802ac65613d1c0ec85824] mfd: Add s=
upport for PMIC MT6360
> git bisect good 12e5bf757a1fd03c5d736942428732be641daa1c  # 18:10  G     =
30     0    3   4  mfd: max77620: Use single-byte writes on MAX77620
> # extra tests with debug options
> git bisect  bad 7edd363421dab1d4806802ac65613d1c0ec85824  # 18:21  B     =
 0     3   19   0  mfd: Add support for PMIC MT6360
> # extra tests on head commit of linus/master
> git bisect  bad 435faf5c218a47fd6258187f62d9bb1009717896  # 18:39  B     =
 0    10   26   0  Merge tag 'riscv-for-linus-5.8-mw0' of git://git.kernel.=
org/pub/scm/linux/kernel/git/riscv/linux
> # bad: [435faf5c218a47fd6258187f62d9bb1009717896] Merge tag 'riscv-for-li=
nus-5.8-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> # extra tests on linus/master
> # duplicated: [435faf5c218a47fd6258187f62d9bb1009717896] Merge tag 'riscv=
-for-linus-5.8-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/=
linux
> # extra tests on linux-next/master
> # 119: [af30725c132e2e5c5369b60369ff0771fde7d4ff] Add linux-next specific=
 files for 20200605
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
> =

> =

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek(a)lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>=20
--===============4932726118931463318==--

