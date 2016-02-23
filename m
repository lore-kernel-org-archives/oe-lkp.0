Content-Type: multipart/mixed; boundary="===============2597228723714940548=="
MIME-Version: 1.0
From: Michael Welling <mwelling@ieee.org>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Tue, 23 Feb 2016 15:50:21 -0600
Message-ID: <20160223215021.GA14555@deathstar>
In-Reply-To: <877fhw0w9p.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2597228723714940548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 02:35:14PM +0800, Huang, Ying wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
> =

> > On Mon, Feb 15, 2016 at 3:39 AM, Huang, Ying <ying.huang@intel.com> w=
rote:
> >> Michael Welling <mwelling@ieee.org> writes:
> >
> >>> Could you run cat /proc/devices?
> >>
> >> Sorry, the test mechanism is not flexible enough to run some shell
> >> command in test system.  Could you provide a specialized debug kernel =
to
> >> dump the necessary information in kernel log?  We can collect dmesg
> >> easily.
> >
> > Can you try this:
> >
> > diff --git a/fs/char_dev.c b/fs/char_dev.c
> > index 24b142569ca9..74a2d433273e 100644
> > --- a/fs/char_dev.c
> > +++ b/fs/char_dev.c
> > @@ -96,6 +96,8 @@ __register_chrdev_region(unsigned int major,
> > unsigned int baseminor,
> >              goto out;
> >          }
> >          major =3D i;
> > +        pr_info("CHARDEV: allocate major %d for \"%s\"\n",
> > +            i, name);
> >      }
> >
> >      cd->major =3D major;
> >
> > Then dmesg |grep CHARDEV should tell what we need to know.
> =

> Sorry for late, the dmesg with the patch is attached.  And the output of
> dmesg | grep CHARDEV is as follow:
> =

> [    0.750037] CHARDEV: allocate major 254 for "gpiochip"
> [    0.897928] CHARDEV: allocate major 253 for "tpm"
> [    0.904196] CHARDEV: allocate major 252 for "ndctl"
> [    0.905295] CHARDEV: allocate major 251 for "dimmctl"
> [    0.909573] CHARDEV: allocate major 250 for "pps"
> [    0.913740] CHARDEV: allocate major 249 for "ptp"
> [    0.916711] CHARDEV: allocate major 248 for "iio"
> [    1.227597] CHARDEV: allocate major 247 for "bsg"
> [    1.577194] CHARDEV: allocate major 246 for "gsmtty"
> [    1.614921] CHARDEV: allocate major 245 for "ttyn"
> [    1.616044] CHARDEV: allocate major 244 for "ttyARC"
> [    1.617177] CHARDEV: allocate major 243 for "ttyRP"
> [    1.618310] CHARDEV: allocate major 242 for "ttyLP"
> [    1.620618] CHARDEV: allocate major 241 for "noz"
> [    1.621707] CHARDEV: allocate major 240 for "ttyIPWp"
> [    1.630024] CHARDEV: allocate major 239 for "telco_clock"
> [    1.632315] CHARDEV: allocate major 239 for "cmm"
> [    1.681375] CHARDEV: allocate major 238 for "hpilo"
> [    1.696757] CHARDEV: allocate major 237 for "aac"
> [    1.699338] CHARDEV: allocate major 236 for "megadev_legacy"
> [    1.704680] CHARDEV: allocate major 235 for "megaraid_sas_ioctl"
> [    1.731179] CHARDEV: allocate major 234 for "pmcsas"

Not sure how this is the first time this problem has come up.
There is an obvious overlap here into the statically allocated region.

> [    1.737520] CHARDEV: allocate major 233 for "nvme"
> [    2.388531] CHARDEV: allocate major 232 for "firewire"
> [    2.389743] CHARDEV: allocate major 231 for "uio"
> [    2.904429] CHARDEV: allocate major 230 for "ttySDIO"
> [    2.922374] CHARDEV: allocate major 229 for "ib_qib"
> [    2.927559] CHARDEV: allocate major 228 for "hidraw"
> [    2.952328] CHARDEV: allocate major 227 for "fwtty"
> [    2.953435] CHARDEV: allocate major 225 for "fwloop"
> =

> Best Regards,
> Huang, Ying



--===============2597228723714940548==--

