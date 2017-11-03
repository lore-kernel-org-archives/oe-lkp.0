Content-Type: multipart/mixed; boundary="===============1213329659895035695=="
MIME-Version: 1.0
From: Roger Quadros <rogerq@ti.com>
To: lkp@lists.01.org
Subject: Re: 7be10517c2 ("USB: dummy-hcd: Adapt dummy_udc_set_speed()"): BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Fri, 03 Nov 2017 15:00:51 +0200
Message-ID: <4238b0b8-0239-53ab-0632-47a0438d39ef@ti.com>
In-Reply-To: <59fb95b3./DjHhZ1X9Nu/BA/u%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1213329659895035695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 03/11/17 00:01, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Roger-Quadros/USB-dummy-hcd-Adap=
t-dummy_udc_set_speed/20171103-045118
> =

> commit 7be10517c266766e46572d60e7c4b3876d461c0c
> Author:     Roger Quadros <rogerq@ti.com>
> AuthorDate: Thu Nov 2 11:09:17 2017 +0200
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Fri Nov 3 04:51:20 2017 +0800
> =

>     USB: dummy-hcd: Adapt dummy_udc_set_speed()
>     =

>     The UDC core ensures that .udc_set_speed() is called with
>     a speed that is a minimum of the max speeds supported
>     by the gadget function driver and the UDC driver.
>     =

>     We can now use the speed argument as is.
>     =

>     Get rid of the debug print as that condition will never happen.
>     =

>     Signed-off-by: Roger Quadros <rogerq@ti.com>
> =

> ce2b21a4e5  usb: dwc2: Fix UDC state tracking
> 7be10517c2  USB: dummy-hcd: Adapt dummy_udc_set_speed()
> +------------------------------------------+------------+------------+
> |                                          | ce2b21a4e5 | 7be10517c2 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 33         | 0          |
> | boot_failures                            | 0          | 13         |
> | BUG:unable_to_handle_kernel              | 0          | 13         |
> | Oops:#[##]                               | 0          | 13         |
> | RIP:dummy_set_selfpowered                | 0          | 13         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 13         |
> +------------------------------------------+------------+------------+
> =

> [    4.740314] usb usb1: Product: Dummy host controller
> [    4.740866] usb usb1: Manufacturer: Linux 4.14.0-rc4-00052-g7be1051 du=
mmy_hcd
> [    4.741660] usb usb1: SerialNumber: dummy_hcd.0
> [    4.742575] hub 1-0:1.0: USB hub found
> [    4.743043] hub 1-0:1.0: 1 port detected
> [    4.744153] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [    4.745027] IP: dummy_set_selfpowered+0x34/0x4f

Any idea why that might be happening?

> [    4.745536] PGD 0 P4D 0 =

> [    4.745826] Oops: 0000 [#1] PREEMPT SMP
> [    4.746259] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0-rc4-00052=
-g7be1051 #24
> [    4.747098] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    4.748009] task: ffff905840050000 task.stack: ffffa75bc0008000
> [    4.748012] RIP: 0010:dummy_set_selfpowered+0x34/0x4f
> [    4.748012] RSP: 0000:ffffa75bc000bd98 EFLAGS: 00010202
> [    4.748012] RAX: 0000000000000000 RBX: ffff90585ce08e00 RCX: 7cd537960=
0000000
> [    4.748012] RDX: ffffffff92a07020 RSI: 0000000000000001 RDI: ffff90585=
cdeac08
> [    4.748012] RBP: ffffa75bc000bd98 R08: ffff9058400507d0 R09: 000000005=
d6b445c
> [    4.748012] R10: ffff90585e9a7419 R11: ffff90585e9a73f8 R12: ffff90585=
cdeac08
> [    4.748012] R13: 0000000000000000 R14: ffff90585d17c990 R15: ffffffff9=
34df4c0
> [    4.748012] FS:  0000000000000000(0000) GS:ffff90585fa00000(0000) knlG=
S:0000000000000000
> [    4.748012] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.748012] CR2: 0000000000000000 CR3: 000000001a416001 CR4: 000000000=
01606f0
> [    4.748012] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [    4.748012] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [    4.748012] Call Trace:
> [    4.748012]  usb_gadget_set_selfpowered+0x18/0x20
> [    4.748012]  composite_dev_prepare+0x9c/0xda
> [    4.748012]  composite_bind+0x82/0x17d
> [    4.748012]  ? set_debug_rodata+0x12/0x12
> [    4.748012]  udc_bind_to_driver+0x49/0xde
> [    4.748012]  usb_gadget_probe_driver+0x118/0x131
> [    4.748012]  ? mass_storagemod_init+0x12/0x12
> [    4.748012]  usb_composite_probe+0x9b/0x9d
> [    4.748012]  acm_ms_driver_init+0x10/0x12
> [    4.748012]  do_one_initcall+0x8b/0x132
> [    4.748012]  ? set_debug_rodata+0x12/0x12
> [    4.748012]  kernel_init_freeable+0x19f/0x224
> [    4.748012]  ? rest_init+0x135/0x135
> [    4.748012]  kernel_init+0x9/0xe6
> [    4.748012]  ret_from_fork+0x25/0x30
> [    4.748012] Code: 48 89 e5 88 c2 8a 87 51 05 00 00 83 e0 df 09 d0 83 7=
f 78 05 88 87 51 05 00 00 48 8b 87 18 06 00 00 48 0f 45 87 10 06 00 00 85 f=
6 <48> 8b 00 74 0a 66 83 88 10 12 00 00 01 eb 08 66 83 a0 10 12 00 =

> [    4.748012] RIP: dummy_set_selfpowered+0x34/0x4f RSP: ffffa75bc000bd98
> [    4.748012] CR2: 0000000000000000
> [    4.748012] ---[ end trace b94b0554e9424d55 ]---
> [    4.748012] Kernel panic - not syncing: Fatal exception
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 7be10517c266766e46572d60e7c4b3876d461c0c ce2b21a4e5ce042=
c0a42c9db8fa9e0f849427d5e --
> # first bad commit: [7be10517c266766e46572d60e7c4b3876d461c0c] USB: dummy=
-hcd: Adapt dummy_udc_set_speed()
> git bisect good ce2b21a4e5ce042c0a42c9db8fa9e0f849427d5e  # 05:46  G     =
32     0    0   0  usb: dwc2: Fix UDC state tracking
> # extra tests on HEAD of linux-review/Roger-Quadros/USB-dummy-hcd-Adapt-d=
ummy_udc_set_speed/20171103-045118
> git bisect  bad 7be10517c266766e46572d60e7c4b3876d461c0c  # 05:46  B     =
 0    13   28   0  USB: dummy-hcd: Adapt dummy_udc_set_speed()
> # extra tests on tree/branch linux-review/Roger-Quadros/USB-dummy-hcd-Ada=
pt-dummy_udc_set_speed/20171103-045118
> git bisect  bad 7be10517c266766e46572d60e7c4b3876d461c0c  # 05:47  B     =
 0    13   28   0  USB: dummy-hcd: Adapt dummy_udc_set_speed()
> # extra tests with first bad commit reverted
> git bisect good 62cdc97d08c1ab29a70e80800549b794cd512c54  # 06:01  G     =
11     0    0   0  Revert "USB: dummy-hcd: Adapt dummy_udc_set_speed()"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
> =


-- =

cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--===============1213329659895035695==--

