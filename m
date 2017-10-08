Content-Type: multipart/mixed; boundary="===============3373192976434758446=="
MIME-Version: 1.0
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: e69b6c02b4 ("net: Add support for networking over Thunderbolt .."): BUG: unable to handle kernel NULL pointer dereference at 00000004
Date: Sun, 08 Oct 2017 18:21:12 +0300
Message-ID: <20171008152112.GH2761@lahna.fi.intel.com>
In-Reply-To: <59d9fd44.faJIDzfsN8g+fY2r%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3373192976434758446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 08, 2017 at 06:26:12PM +0800, kernel test robot wrote:
> [   25.857227] BUG: unable to handle kernel NULL pointer dereference at 0=
0000004
> [   25.857937] IP: tb_property_find+0xe/0x41
> [   25.858330] *pde =3D 00000000 =

> [   25.858619] Oops: 0000 [#1]
> [   25.858887] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-rc1-00741-g=
e69b6c0 #412
> [   25.859604] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   25.860427] task: 89c80000 task.stack: 89c7c000
> [   25.860487] EIP: tb_property_find+0xe/0x41
> [   25.860487] EFLAGS: 00210246 CPU: 0
> [   25.860487] EAX: 00000000 EBX: 7a368f47 ECX: 00000044 EDX: 7a368f47
> [   25.860487] ESI: 8851d340 EDI: 7a368f47 EBP: 89c7df0c ESP: 89c7defc
> [   25.860487]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> [   25.860487] CR0: 80050033 CR2: 00000004 CR3: 027a2000 CR4: 00000690
> [   25.860487] Call Trace:
> [   25.860487]  tb_register_property_dir+0x49/0xb9
> [   25.860487]  ? cdc_mbim_driver_init+0x1b/0x1b
> [   25.860487]  tbnet_init+0x77/0x9f
> [   25.860487]  ? cdc_mbim_driver_init+0x1b/0x1b
> [   25.860487]  do_one_initcall+0x7e/0x145
> [   25.860487]  ? parse_args+0x10c/0x1b3
> [   25.860487]  ? kernel_init_freeable+0xbe/0x159
> [   25.860487]  kernel_init_freeable+0xd1/0x159
> [   25.860487]  ? rest_init+0x110/0x110
> [   25.860487]  kernel_init+0xd/0xd0
> [   25.860487]  ret_from_fork+0x19/0x30
> [   25.860487] Code: 08 8b 50 04 89 51 04 89 0a c7 00 00 01 00 00 c7 40 0=
4 00 02 00 00 e8 b5 a1 65 ff 5d c3 55 89 e5 57 56 53 53 e8 05 94 55 ff 89 d=
7 <8b> 58 04 8d 70 04 eb 1b 39 4b 14 75 14 89 4d f0 8d 43 08 89 fa
> [   25.860487] EIP: tb_property_find+0xe/0x41 SS:ESP: 0068:89c7defc
> [   25.860487] CR2: 0000000000000004
> [   25.860487] ---[ end trace 42823d141a09532c ]---
> [   25.860487] Kernel panic - not syncing: Fatal exception

This happens because both drivers are build in to the kernel image and
drivers/net/* is linked before drivers/thunderbolt/*. I'll send out a
fix upstream tomorrow (and make sure it is included in intel-next as
well).

Thanks for the report!

--===============3373192976434758446==--

