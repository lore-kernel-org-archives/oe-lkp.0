Content-Type: multipart/mixed; boundary="===============1448125534626837085=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Sun, 14 Feb 2016 09:49:47 -0800
Message-ID: <20160214174947.GA21558@kroah.com>
In-Reply-To: <CACRpkdYo4xAU0VDTopmg3r=yo9fzqeBHii0v2kvkmARPL349Og@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1448125534626837085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2016 at 06:42:11PM +0100, Linus Walleij wrote:
> Greg, heads-up on this... you'd know if this happened
> before.
> =

> On Sun, Feb 14, 2016 at 9:06 AM, Michael Welling <mwelling@ieee.org> wr=
ote:
> > On Sun, Feb 14, 2016 at 02:59:06PM +0800, kernel test robot wrote:
> >> FYI, we noticed the below changes on
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git =
chardev
> >> commit 3c702e9987e261042a07e43460a8148be254412e ("gpio: add a userspac=
e chardev ABI for GPIOs")
> >>
> >>
> >> [    1.951191] user_verbs: couldn't register device number
> >
> > Looks like user_verbs is using a static device node setup.
> >
> > enum {
> >         IB_UVERBS_MAJOR       =3D 231,
> >         IB_UVERBS_BASE_MINOR  =3D 192,
> >         IB_UVERBS_MAX_DEVICES =3D 32
> > };
> >
> > #define IB_UVERBS_BASE_DEV      MKDEV(IB_UVERBS_MAJOR, IB_UVERBS_BASE_M=
INOR)
> =

> That's annoying...
> I notice that infiniband is using register_chrdev_region() at
> module_init() time, counting on device major 231 to be free.

That device major is assigned to Infiniband, why shouldn't it be doing
this?

> =

> > Something tells me that a new GPIO chardev is taking this spot.
> =

> Yes. Please post the contents of /proc/devices on this system.
> =

> If you look in fs/char_dev.c this happens in
> __register_chrdev_region() you can see that dynamic
> character major numbers are assigned from 254 and
> downwards in this way:
> =

> #define CHRDEV_MAJOR_HASH_SIZE       255
> (...)
> } *chrdevs[CHRDEV_MAJOR_HASH_SIZE];
> =

>         /* temporary */
>         if (major =3D=3D 0) {
>                 for (i =3D ARRAY_SIZE(chrdevs)-1; i > 0; i--) {
>                         if (chrdevs[i] =3D=3D NULL)
>                                 break;
>                 }
> =

>                 if (i =3D=3D 0) {
>                         ret =3D -EBUSY;
>                         goto out;
>                 }
>                 major =3D i;
>         }
> =

> Whereas fixed device numbers are assigned sparsely
> from low to high.
> =

> I suspect what happens is that in your system there are
> already so many dynamically assigned character devices that
> they go down and already collide with 232 and 233, you just
> didn't notice until this make it hit 231 which incidentally
> was in use.
> =

> So I would be very intersted in what misc stuff you have filling
> out 232 thru 255, already knocking out other assigned
> numbers...
> =

> I guess I *could* try to grab a static assignment in the low
> range, say recycle character device 8, which is the first
> unallocated from the bottom, but I'm afraid the device
> core maintainers have worked to get devices to go more
> dynamic and would be very unhappy about this.

Why not just ask for a new reserved one?  We could give you 261 and
everything should be fine, right?

thanks,

greg k-h

--===============1448125534626837085==--

