Content-Type: multipart/mixed; boundary="===============1536725728366449294=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ppdev] 138e9d20e6: kernel BUG at drivers/base/driver.c:153!
Date: Sun, 14 Feb 2016 22:00:01 +0530
Message-ID: <20160214163001.GA19855@sudip-laptop>
In-Reply-To: <878u2nollw.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1536725728366449294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2016 at 02:24:27PM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Sudip-Mukherjee/ppdev-space-prohibited-b=
etween-function-name-and-parenthesis/20160212-210833
> commit 138e9d20e69c0d682f584ee1ef0151338eef7499 ("ppdev: use new parport =
device model")

I am not able to reproduce this as I donot have all your scripts/files.
Can you please check if the below patch solves this in your setup.


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

--===============1536725728366449294==--

