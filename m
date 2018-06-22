Content-Type: multipart/mixed; boundary="===============5411971284717215708=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 21:02:55 +0100
Message-ID: <20180622200255.GB30522@ZenIV.linux.org.uk>
In-Reply-To: <20180622161802.GA18957@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5411971284717215708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 06:18:02PM +0200, Christoph Hellwig wrote:
> On Fri, Jun 22, 2018 at 05:28:50PM +0200, Christoph Hellwig wrote:
> > On Fri, Jun 22, 2018 at 04:14:09PM +0100, Al Viro wrote:
> > > >     http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/=
remove-get-poll-head
> > > =

> > > See objections upthread re "fs,net: move poll busy loop handling into=
 a
> > > separate method"; as for the next one... I'd like an ACK from network=
ing
> > > folks.  The rest of queue makes sense.
> > =

> > I want to see basic results first before micro-optimizing.  After that
> > I'll send it out to the net folks for feedback.
> =

> I looked into this a bit, in the end sk_can_busy_loop does this:
> =

> 	return sk->sk_ll_usec && !signal_pending(current);
> =

> where sk_ll_usec defaults based on a sysctl that needs to be
> turned on, but can be overriden per socket.
> =

> While at the same time corect poll code already checks net_busy_loop_on
> to set POLL_BUSY_LOOP.  So except for sockets where people set the
> timeout to 0 the code already does the right thing as-is.  IMHO not
> really worth wasting a FMODE_* flag for it, but if you insist I'll add
> it.

It's not just that - there's also an issue of extra indirect call on the
fast path for sockets.  You get this method of yours + ->poll_mask(),
which hits another indirect to per-family ->poll_mask().  It might be
better to have these combined, sparing us an extra indirect call.

Just give it the same calling conventions as ->poll_mask() have...

--===============5411971284717215708==--

