Content-Type: multipart/mixed; boundary="===============8904641658063555759=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Tue, 13 Jun 2017 06:35:18 +0200
Message-ID: <20170613043518.GA14621@kroah.com>
In-Reply-To: <20170613043416.GB14217@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8904641658063555759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 06:34:16AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jun 12, 2017 at 10:29:20PM -0600, Logan Gunthorpe wrote:
> > =

> > =

> > On 12/06/17 10:18 PM, Greg Kroah-Hartman wrote:
> > > What test causes so many major numbers to be allocated?  Is this
> > > in-kernel test code?  Do you really have a system that requires so ma=
ny
> > > different drivers that all want a dynamic char major?
> > =

> > This is a 0day kernel robot test. I'm not sure the motivations of its
> > design but it seems to be similar to an allyesconfig. So all/most
> > modules are compiled in and allocating their char device regions on boot
> > of a qemu instance.
> =

> Ah, that makes sense.  Well, someone can always work on expanding the
> range of dynamic char major numbers if they are running out of them on a
> real system, I'll gladly take patches for that :)

Or better yet, just turn all char major allocations into dynamic, which
would be really good for test systems.  I thought someone proposed
patches for that a long time ago, but I can't find them anymore.  That
would be the simplest solution here.

thnaks,

greg k-h

--===============8904641658063555759==--

