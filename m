Content-Type: multipart/mixed; boundary="===============2116252469169113451=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Tue, 13 Jun 2017 06:34:16 +0200
Message-ID: <20170613043416.GB14217@kroah.com>
In-Reply-To: <f6322f70-7ca7-abf6-b947-4cbbfd598948@deltatee.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2116252469169113451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2017 at 10:29:20PM -0600, Logan Gunthorpe wrote:
> =

> =

> On 12/06/17 10:18 PM, Greg Kroah-Hartman wrote:
> > What test causes so many major numbers to be allocated?  Is this
> > in-kernel test code?  Do you really have a system that requires so many
> > different drivers that all want a dynamic char major?
> =

> This is a 0day kernel robot test. I'm not sure the motivations of its
> design but it seems to be similar to an allyesconfig. So all/most
> modules are compiled in and allocating their char device regions on boot
> of a qemu instance.

Ah, that makes sense.  Well, someone can always work on expanding the
range of dynamic char major numbers if they are running out of them on a
real system, I'll gladly take patches for that :)

thanks,

greg k-h

--===============2116252469169113451==--

