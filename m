Content-Type: multipart/mixed; boundary="===============0432810103009097398=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Wed, 14 Jun 2017 07:01:12 +0200
Message-ID: <20170614050112.GB11630@kroah.com>
In-Reply-To: <alpine.DEB.2.20.1706132106410.11042@aurora.sdinet.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0432810103009097398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 09:13:32PM +0200, Sven-Haegar Koch wrote:
> On Tue, 13 Jun 2017, Greg Kroah-Hartman wrote:
> =

> > On Tue, Jun 13, 2017 at 10:25:40AM -0600, Logan Gunthorpe wrote:
> > > =

> > > On 12/06/17 10:35 PM, Greg Kroah-Hartman wrote:
> > > > Or better yet, just turn all char major allocations into dynamic, w=
hich
> > > > would be really good for test systems.  I thought someone proposed
> > > > patches for that a long time ago, but I can't find them anymore.  T=
hat
> > > > would be the simplest solution here.
> > > =

> > > Would people not complain about that? I would not be surprised if some
> > > crazy application is using hard coded major numbers in userspace. So
> > > such a change could potentially break userspace...
> > =

> > For char devices, I doubt it, but we can't take the chance, which is why
> > you make it an option.  Then, it's enabled for 'allmodconfig' builds,
> > which helps testers out.
> =

> At least for /dev/null, /dev/zero, and perhaps /dev/tty it would =

> definitely break things if the major+minor number is not static. I have =

> multiple chroot environments having only some minimal needed static =

> /dev subdir, with naturally no daemons or filesystem creating those =

> on-demand. For the main /dev I use whatever the system sets up, so =

> devtmpfs with udev.

No, it wouldn't be required, it would be an option for those people
using devtmpfs.

thanks,

greg k-h

--===============0432810103009097398==--

