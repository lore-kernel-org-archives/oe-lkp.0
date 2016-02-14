Content-Type: multipart/mixed; boundary="===============3230397069328509039=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Sun, 14 Feb 2016 15:49:54 -0800
Message-ID: <20160214234954.GA25420@kroah.com>
In-Reply-To: <20160214195120.GA7608@deathstar>
List-Id: <oe-lkp.lists.linux.dev>

--===============3230397069328509039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2016 at 01:51:20PM -0600, Michael Welling wrote:
> On Sun, Feb 14, 2016 at 11:05:15AM -0800, Greg KH wrote:
> > On Sun, Feb 14, 2016 at 06:56:20PM +0100, Linus Walleij wrote:
> > > On Sun, Feb 14, 2016 at 6:49 PM, Greg KH <gregkh@linuxfoundation.or=
g> wrote:
> > > > On Sun, Feb 14, 2016 at 06:42:11PM +0100, Linus Walleij wrote:
> > > >> Greg, heads-up on this... you'd know if this happened
> > > >> before.
> > > >>
> > > >> On Sun, Feb 14, 2016 at 9:06 AM, Michael Welling <mwelling@ieee.=
org> wrote:
> > > >> > On Sun, Feb 14, 2016 at 02:59:06PM +0800, kernel test robot wrot=
e:
> > > >> >> FYI, we noticed the below changes on
> > > >> >>
> > > >> >> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git chardev
> > > >> >> commit 3c702e9987e261042a07e43460a8148be254412e ("gpio: add a u=
serspace chardev ABI for GPIOs")
> > > >> >>
> > > >> >>
> > > >> >> [    1.951191] user_verbs: couldn't register device number
> > > >> >
> > > >> > Looks like user_verbs is using a static device node setup.
> > > >> >
> > > >> > enum {
> > > >> >         IB_UVERBS_MAJOR       =3D 231,
> > > >> >         IB_UVERBS_BASE_MINOR  =3D 192,
> > > >> >         IB_UVERBS_MAX_DEVICES =3D 32
> > > >> > };
> > > >> >
> > > >> > #define IB_UVERBS_BASE_DEV      MKDEV(IB_UVERBS_MAJOR, IB_UVERBS=
_BASE_MINOR)
> > > >>
> > > >> That's annoying...
> > > >> I notice that infiniband is using register_chrdev_region() at
> > > >> module_init() time, counting on device major 231 to be free.
> > > >
> > > > That device major is assigned to Infiniband, why shouldn't it be do=
ing
> > > > this?
> > > =

> > > I mean it's annoying that they collide. (Because of the details I
> > > write below, it's fine it's using the assigned number.
> > > =

> > > > Why not just ask for a new reserved one?  We could give you 261 and
> > > > everything should be fine, right?
> > > =

> > > Sure I can post a patch for that, but it just mitigates the problem.
> > > =

> > > The report point to the serious problem that on this system
> > > some dynamic allocations have already stolen major device
> > > numbers 232 thru 255, and 232 and 233 are also assigned.
> > > =

> > > What do you think about a patch that makes fs/char_dev.c
> > > emit a warning when it starts assigning dynamic numbers
> > > 233 and below?
> > =

> > That's fine with me.  I also think maybe we should look into just
> > switching all char major/minor allocation to be dynamic, starting at the
> > bottom and moving up.  I think the only tools that might have an issue
> > with that is the raw device controller, but maybe that has been fixed up
> > in userspace, I haven't looked at that in many years.
> >
> =

> Is there any reason for the CHRDEV_MAJOR_HASH_SIZE being 255?
> If we increase the size to say 511 will it break userspace?

No, that's an internal thing, but I don't see what that has to do with
this...

> In the future I see a robot building a kernel with more that 255 devices =
and
> having to deal with this kind of collision again.

We handle major numbers larger than 255 already...

> The handling of large major assignment baffles me.

It's tricky, messy, and something you don't want to touch, seriously...

good luck,

greg k-h

--===============3230397069328509039==--

