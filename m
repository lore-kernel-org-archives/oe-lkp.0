Content-Type: multipart/mixed; boundary="===============1832161532075121888=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [auxdisplay: ht16k33] cac513f1a9: BUG: KASAN: global-out-of-bounds in __of_match_node at addr ffffffff82ea8cf8
Date: Mon, 20 Feb 2017 10:39:06 +0800
Message-ID: <20170220023906.onlnybqi3pnsrg7z@wfg-t540p.sh.intel.com>
In-Reply-To: <20170220003335.GA8358@dtor-ws>
List-Id: <oe-lkp.lists.linux.dev>

--===============1832161532075121888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

>> cac513f1a9  auxdisplay: ht16k33: rework input device initialization
>> +--------------------------------------------------------------------+--=
--+
>> |                                                                    |  =
  |
>> +--------------------------------------------------------------------+--=
--+
>> | boot_successes                                                     | 0=
  |
>> | boot_failures                                                      | 2=
6 |
>> | BUG:KASAN:global-out-of-bounds_in__of_match_node_at_addr           | 2=
6 |
>> | BUG:KASAN:global-out-of-bounds_in__of_device_is_compatible_at_addr | 2=
6 |
>> +--------------------------------------------------------------------+--=
--+
>>
>> [   16.004589] OF: /testcase-data/phandle-tests/consumer-a: arguments lo=
nger than property
>> [   16.008292] irq: no irq domain found for /testcase-data/interrupts/in=
tc0 !
>> [   16.008292] irq: no irq domain found for /testcase-data/interrupts/in=
tc0 !
>> [   16.011090] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   16.011090] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   16.014687] BUG: KASAN: global-out-of-bounds in __of_match_node+0xf9/=
0x100 at addr ffffffff82ea8cf8
>> [   16.014687] BUG: KASAN: global-out-of-bounds in __of_match_node+0xf9/=
0x100 at addr ffffffff82ea8cf8
>> [   16.018072] Read of size 1 by task swapper/1
>> [   16.018072] Read of size 1 by task swapper/1
>> [   16.019363] Address belongs to variable img_ascii_lcd_matches+0x258/0=
x8c0
>> [   16.019363] Address belongs to variable img_ascii_lcd_matches+0x258/0=
x8c0
>
>Hmm, I am not sure what exactly happened, but I wonder if the patch
>below does not resolve this issue.

Yes it works.

Tested-by: Fengguang Wu <fengguang.wu@intel.com>

Thanks,
Fengguang

>auxdisplay: img-ascii-lcd: add missing sentinel entry in img_ascii_lcd_mat=
ches
>
>From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
>The OF device table must be terminated, otherwise we'll be walking past it
>and into areas unknown.
>
>Fixes: 0cad855fbd08 ("auxdisplay: img-ascii-lcd: driver for simple ASCII..=
.")
>Cc: stable(a)vger.kernel.org
>Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>---
> drivers/auxdisplay/img-ascii-lcd.c |    1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-a=
scii-lcd.c
>index bf43b5d2aafc..83f1439e57fd 100644
>--- a/drivers/auxdisplay/img-ascii-lcd.c
>+++ b/drivers/auxdisplay/img-ascii-lcd.c
>@@ -218,6 +218,7 @@ static const struct of_device_id img_ascii_lcd_matches=
[] =3D {
> 	{ .compatible =3D "img,boston-lcd", .data =3D &boston_config },
> 	{ .compatible =3D "mti,malta-lcd", .data =3D &malta_config },
> 	{ .compatible =3D "mti,sead3-lcd", .data =3D &sead3_config },
>+	{ /* sentinel */ }
> };
>
> /**

--===============1832161532075121888==--

