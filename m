Content-Type: multipart/mixed; boundary="===============3206759113324303223=="
MIME-Version: 1.0
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [auxdisplay: ht16k33] cac513f1a9: BUG: KASAN: global-out-of-bounds in __of_match_node at addr ffffffff82ea8cf8
Date: Sun, 19 Feb 2017 16:33:35 -0800
Message-ID: <20170220003335.GA8358@dtor-ws>
In-Reply-To: <58aa1702.SBk7Ac1HTIwh6bqw%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3206759113324303223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 06:06:58AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit cac513f1a9f7ace21d27665435f8fe7e39050396
> Author:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
> AuthorDate: Thu Feb 9 10:15:52 2017 -0800
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Fri Feb 10 15:57:28 2017 +0100
> =

>     auxdisplay: ht16k33: rework input device initialization
>     =

>     This patch fixes following issues in input device (keypad) handling:
>     =

>     - requesting IRQ before allocating and initializing parts of the devi=
ce
>       that can be referenced from IRQ handler is racy, even if we try to
>       disable interrupt after requesting it. Let's move allocations around
>       so that everything is ready by the time we request IRQ.
>     =

>     - using threaded interrupt handler to schedule a work item it sub-opt=
imal.
>       Disabling and then re-enabling interrupts in work item and in open/=
close
>       methods is prone to races and exactly the reason theraded interrupt=
s were
>       introduced. Let's use the infrastructure properly and keep scanning=
 the
>       matrix array in IRQ thread, stopping when there are no keys, or whe=
n told
>       to do so.
>     =

>     Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>     Tested-by: Robin van der Gracht <robin@protonic.nl>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =

> cac513f1a9  auxdisplay: ht16k33: rework input device initialization
> +--------------------------------------------------------------------+---=
-+
> |                                                                    |   =
 |
> +--------------------------------------------------------------------+---=
-+
> | boot_successes                                                     | 0 =
 |
> | boot_failures                                                      | 26=
 |
> | BUG:KASAN:global-out-of-bounds_in__of_match_node_at_addr           | 26=
 |
> | BUG:KASAN:global-out-of-bounds_in__of_device_is_compatible_at_addr | 26=
 |
> +--------------------------------------------------------------------+---=
-+
> =

> [   16.004589] OF: /testcase-data/phandle-tests/consumer-a: arguments lon=
ger than property
> [   16.008292] irq: no irq domain found for /testcase-data/interrupts/int=
c0 !
> [   16.008292] irq: no irq domain found for /testcase-data/interrupts/int=
c0 !
> [   16.011090] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   16.011090] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   16.014687] BUG: KASAN: global-out-of-bounds in __of_match_node+0xf9/0=
x100 at addr ffffffff82ea8cf8
> [   16.014687] BUG: KASAN: global-out-of-bounds in __of_match_node+0xf9/0=
x100 at addr ffffffff82ea8cf8
> [   16.018072] Read of size 1 by task swapper/1
> [   16.018072] Read of size 1 by task swapper/1
> [   16.019363] Address belongs to variable img_ascii_lcd_matches+0x258/0x=
8c0
> [   16.019363] Address belongs to variable img_ascii_lcd_matches+0x258/0x=
8c0

Hmm, I am not sure what exactly happened, but I wonder if the patch
below does not resolve this issue.

Thanks.

-- =

Dmitry


auxdisplay: img-ascii-lcd: add missing sentinel entry in img_ascii_lcd_matc=
hes

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

The OF device table must be terminated, otherwise we'll be walking past it
and into areas unknown.

Fixes: 0cad855fbd08 ("auxdisplay: img-ascii-lcd: driver for simple ASCII...=
")
Cc: stable(a)vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/auxdisplay/img-ascii-lcd.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-as=
cii-lcd.c
index bf43b5d2aafc..83f1439e57fd 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -218,6 +218,7 @@ static const struct of_device_id img_ascii_lcd_matches[=
] =3D {
 	{ .compatible =3D "img,boston-lcd", .data =3D &boston_config },
 	{ .compatible =3D "mti,malta-lcd", .data =3D &malta_config },
 	{ .compatible =3D "mti,sead3-lcd", .data =3D &sead3_config },
+	{ /* sentinel */ }
 };
 =

 /**

--===============3206759113324303223==--

