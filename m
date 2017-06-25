Content-Type: multipart/mixed; boundary="===============1886003610707236814=="
MIME-Version: 1.0
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: lkp@lists.01.org
Subject: Re: 040de6ebde ("mtd: Fallback to ->_read/write_oob() when ->_read/wr..."): BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Sun, 25 Jun 2017 18:02:53 +0200
Message-ID: <20170625180253.22503dc6@bbrezillon>
In-Reply-To: <594fcd86.GwKK3kecNMcm3YFa%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1886003610707236814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Le Sun, 25 Jun 2017 22:49:42 +0800,
kernel test robot <fengguang.wu@intel.com> a =C3=A9crit :

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.infradead.org/users/dedekind/l2-mtd.git nand/next
> =

> commit 040de6ebdeea7b666c0e33c351b2847050275579
> Author:     Boris Brezillon <boris.brezillon@free-electrons.com>
> AuthorDate: Sun Jun 11 22:42:55 2017 +0200
> Commit:     Boris Brezillon <boris.brezillon@free-electrons.com>
> CommitDate: Sat Jun 24 21:32:49 2017 +0200
> =

>     mtd: Fallback to ->_read/write_oob() when ->_read/write() is missing
>     =

>     Some MTD sublayers/drivers are implementing ->_read/write_oob() and
>     providing dummy wrappers for their ->_read/write() implementations.
>     Let the core handle this case instead of duplicating the logic.
>     =

>     Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>     Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
>     Acked-by: Brian Norris <computersforpeace@gmail.com>

I dropped the patch and sent a new version that hopefully fixes the
problem.

> =

> a57ce43950  MAINTAINERS: add entry for Denali NAND controller driver
> 040de6ebde  mtd: Fallback to ->_read/write_oob() when ->_read/write() is =
missing
> 4922adb306  mtd: nand: mtk: add ->setup_data_interface() hook
> +------------------------------------------+------------+------------+---=
---------+
> |                                          | a57ce43950 | 040de6ebde | 49=
22adb306 |
> +------------------------------------------+------------+------------+---=
---------+
> | boot_successes                           | 35         | 2          | 4 =
         |
> | boot_failures                            | 0          | 13         | 15=
         |
> | BUG:unable_to_handle_kernel              | 0          | 13         | 15=
         |
> | Oops:#[##]                               | 0          | 13         | 15=
         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 13         | 15=
         |
> +------------------------------------------+------------+------------+---=
---------+
> =

> [   15.809135] pidof (223) used greatest stack depth: 13656 bytes left
> [   16.032144] udevadm (227) used greatest stack depth: 13144 bytes left
> [   16.032144] udevadm (227) used greatest stack depth: 13144 bytes left
> [   16.246605] input: ImExPS/2 Generic Explorer Mouse as /devices/platfor=
m/i8042/serio1/input/input5
> [   16.246605] input: ImExPS/2 Generic Explorer Mouse as /devices/platfor=
m/i8042/serio1/input/input5
> [   16.378803] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [   16.378803] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [   16.381166] IP:           (null)
> [   16.381166] IP:           (null)
> [   16.382130] PGD 1a6c6067 =

> [   16.382130] PGD 1a6c6067 =

> [   16.382133] P4D 1a6c6067 =

> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 11a0bb67d48fefc2610dfaa27f477c5cdab1c45b 41f1830f5a7af77=
cf5c86359aba3cbd706687e52 --
> git bisect  bad af0dc25c97fb9907e8b0831552604b6f43e764ae  # 19:01  B     =
 0    11   22   0  Merge 'hwmon/hwmon-next' into devel-spot-201706251637
> git bisect good 384fc8848f2753daaea06bd0f8b4e349000a49da  # 19:14  G     =
11     0    0   0  Merge 'linux-review/Pierre-Louis-Bossart/Lenovo-tablet-f=
ixes/20170625-121908' into devel-spot-201706251637
> git bisect good a0a2a58fdca1e037a8cdb46f34e9d40383742f55  # 19:28  G     =
11     0    0   0  Merge 'linux-review/Harry-Chou/mtd-spi-nor-Add-support-f=
or-Spansion-S25FL064L/20170624-234717' into devel-spot-201706251637
> git bisect good f7c851f74833faaa5b2199d4c8c6fa6841e5ae2c  # 19:42  G     =
11     0    0   0  Merge 'linux-review/Breno-Leitao/powerpc-kernel-Avoid-re=
dundancies-on-giveup_all/20170625-101622' into devel-spot-201706251637
> git bisect good 24814d327477c4ec16eec5fa9bfc08c234ea4eea  # 19:52  G     =
11     0    0   0  Merge 'chao-linux/quota' into devel-spot-201706251637
> git bisect good df99874d819c1601daec45ece679eebd3f85132d  # 20:14  G     =
11     0    0   0  Merge 'open-channel-ssd/pblk.for-4.13' into devel-spot-2=
01706251637
> git bisect  bad 007fcc68c05959efa273b5f126e6e31cf6ccfd3a  # 20:27  B     =
 0     1   13   0  Merge 'mtd-next/nand/next' into devel-spot-201706251637
> git bisect good d49f5790278d18fd6b8e474397d9abfdf29a48f2  # 20:46  G     =
11     0    0   0  mtd: nand: denali: use interrupt instead of polling for =
bank reset
> git bisect good d1ab0da84dcbac30a9039ccef72d69bf0a68bfc7  # 20:57  G     =
11     0    0   0  mtd: nand: ifc: Initialize SRAM for all version >=3D 1.0
> git bisect  bad 92ca434b9c09549193290d6f0f7133375e2d6e4c  # 21:05  B     =
 0     1   12   0  mtd: nand: mtk: fix incorrect register setting order abo=
ut ecc irq
> git bisect good a7adb70a73b7cb220f4515745d2671d2226e0097  # 21:21  G     =
11     0    0   0  dt-bindings: gpmc: Correct location of generic gpmc bind=
ing
> git bisect  bad 040de6ebdeea7b666c0e33c351b2847050275579  # 21:28  B     =
 0     5   16   0  mtd: Fallback to ->_read/write_oob() when ->_read/write(=
) is missing
> git bisect good a57ce439505da3801e264656a3bdf746505c77ec  # 21:48  G     =
11     0    0   0  MAINTAINERS: add entry for Denali NAND controller driver
> # first bad commit: [040de6ebdeea7b666c0e33c351b2847050275579] mtd: Fallb=
ack to ->_read/write_oob() when ->_read/write() is missing
> git bisect good a57ce439505da3801e264656a3bdf746505c77ec  # 22:06  G     =
31     0    0   0  MAINTAINERS: add entry for Denali NAND controller driver
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 040de6ebdeea7b666c0e33c351b2847050275579  # 22:19  B     =
 0    11   22   0  mtd: Fallback to ->_read/write_oob() when ->_read/write(=
) is missing
> # extra tests on HEAD of linux-devel/devel-spot-201706251637
> git bisect  bad 11a0bb67d48fefc2610dfaa27f477c5cdab1c45b  # 22:19  B     =
 0    13   27   0  0day head guard for 'devel-spot-201706251637'
> # extra tests on tree/branch l2-mtd/nand/next
> git bisect  bad 4922adb306240ceee3300a516675e5caef45de73  # 22:28  B     =
 0     1   12   0  mtd: nand: mtk: add ->setup_data_interface() hook
> # extra tests with first bad commit reverted
> git bisect good f7481b7c9c36436afa86a98023a60df9eef2d083  # 22:49  G     =
11     0    0   0  Revert "mtd: Fallback to ->_read/write_oob() when ->_rea=
d/write() is missing"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion


--===============1886003610707236814==--

