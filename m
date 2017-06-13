Content-Type: multipart/mixed; boundary="===============9031624565908132589=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Tue, 13 Jun 2017 18:35:08 +0200
Message-ID: <20170613163508.GA31961@kroah.com>
In-Reply-To: <8462abee-0a7f-00fb-6111-1f78362ea3f7@deltatee.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9031624565908132589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 10:25:40AM -0600, Logan Gunthorpe wrote:
> =

> =

> On 12/06/17 10:35 PM, Greg Kroah-Hartman wrote:
> > Or better yet, just turn all char major allocations into dynamic, which
> > would be really good for test systems.  I thought someone proposed
> > patches for that a long time ago, but I can't find them anymore.  That
> > would be the simplest solution here.
> =

> Would people not complain about that? I would not be surprised if some
> crazy application is using hard coded major numbers in userspace. So
> such a change could potentially break userspace...

For char devices, I doubt it, but we can't take the chance, which is why
you make it an option.  Then, it's enabled for 'allmodconfig' builds,
which helps testers out.

thanks,

greg k-h

--===============9031624565908132589==--

