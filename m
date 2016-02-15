Content-Type: multipart/mixed; boundary="===============8015320352472580858=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ppdev] e7223f1860: kernel BUG at drivers/base/driver.c:153!
Date: Mon, 15 Feb 2016 17:20:01 +0530
Message-ID: <20160215115001.GA22934@sudip-pc>
In-Reply-To: <56c18a5d.4mR6FT1TNJ7yeYPN%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8015320352472580858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 04:20:45PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char=
-misc-testing
> =

> commit e7223f18603374d235d8bb0398532323e5f318b9
> Author:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> AuthorDate: Fri Feb 12 18:33:45 2016 +0530
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Sun Feb 14 17:43:50 2016 -0800
> =

>     ppdev: use new parport device model
>     =

>     Modify ppdev driver to use the new parallel port device model.
>     =

>     Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Can you please send the .config file so that i can reproduce in my local
system and test?

Ying Huang also sent a similar report after posting the patches. I tried
his .config and your scripts to reproduce this but was not able to.

Anyway, this error is not related to this patch, this patch has just
uncovered this error in parport. And will only happen if ppdev tries to
register with parport before parport bus is registered.
Can you please check if the below patch solves the problem:


diff --git a/drivers/parport/share.c b/drivers/parport/share.c
index 3308427..176b2b6 100644
--- a/drivers/parport/share.c
+++ b/drivers/parport/share.c
@@ -273,6 +273,9 @@ int __parport_register_driver(struct parport_driver *dr=
v, struct module *owner,
 		/* using device model */
 		int ret;
 =

+		if (!parport_bus_type.p)
+			return -EAGAIN;
+
 		/* initialize common driver fields */
 		drv->driver.name =3D drv->name;
 		drv->driver.bus =3D &parport_bus_type;


--
regards
sudip


--===============8015320352472580858==--

