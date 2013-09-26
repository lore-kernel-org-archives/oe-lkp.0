Content-Type: multipart/mixed; boundary="===============2435823891650911187=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 08:04:21 -0700
Message-ID: <20130926150421.GA25545@kroah.com>
In-Reply-To: <52441B23.7050704@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2435823891650911187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2013 at 07:31:47AM -0400, Peter Hurley wrote:
> On 09/26/2013 03:33 AM, Andrew Morton wrote:
> >On Tue, 17 Sep 2013 20:22:42 -0400 Peter Hurley <peter@hurleysoftware.=
com> wrote:
> >
> >>Looking over vmalloc.c, the critical section footprint of the vmap_area=
_lock
> >>could definitely be reduced (even nearly eliminated), but that's a proj=
ect for
> >>another day :)
> >
> >20bafb3d23d10 ("n_tty: Move buffers into n_tty_data") switched a
> >kmalloc (which is very fast) to a vmalloc (which is very slow) without
> >so much as mentioning it in the changelog.  This should have been
> >picked up at review, btw.
> >
> >Revert that part of the patch and the problem will be solved.
> >
> >If we are really really worried that a ~9k kmalloc might fail or will
> >be slow, then implement a fallback to vmalloc() if kmalloc(GFP_NOWARN)
> >failed.  This kinda sucks, but is practical, but really should only be
> >done if necessary - ie, if problems with using plain old kmalloc are
> >demonstrable.
> >
> >Or just revert all of 20bafb3d23d10 - it was supposed to be a small
> >performance improvement but turned out to be a significant performance
> >loss.  Therefore zap.
> =

> I have no particular objection to reverting the entire patch.

How about just switching the call to vmalloc to kmalloc?  Yes, it's a
larger size that is being allocated here, but we were allocating that
much memory anyway before, so it should be the same "speed", if not
faster than before (1 call to kmalloc instead of 3).

thanks,

greg k-h

--===============2435823891650911187==--

