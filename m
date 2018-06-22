Content-Type: multipart/mixed; boundary="===============2082800634841874986=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 13:29:56 +0100
Message-ID: <20180622122956.GX30522@ZenIV.linux.org.uk>
In-Reply-To: <20180622123307.GA16699@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2082800634841874986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 02:33:07PM +0200, Christoph Hellwig wrote:
> On Fri, Jun 22, 2018 at 01:17:22PM +0100, Al Viro wrote:
> > > The problem is that call to sk_busy_loop(), which is going to be indi=
rect
> > > no matter what.
> > =

> > 	if ->f_poll_head is NULL {
> > 		use ->poll
> > 	} else {
> > 		if can ll_poll (checked in ->f_mode)
> > 			call ->ll_poll(), if it returns what we want - we are done
> > 		add to ->f_poll_head
> > 		call ->poll_mask()
> =

> What I have for now is slightly different:
> =

> 	if ((events & POLL_BUSY_LOOP) && file->f_op->poll_busy_loop)
> 		file->f_op->poll_busy_loop(file, events);
> =

> 	if (file->f_op->poll) {
> 		return file->f_op->poll(file, pt);
> 	} else if (file_has_poll_mask(file)) {
> 		...
> 	}
> =

> returns whatever we want part is something I want to look into
> once the basics are done as it probably is non entirely trivial due to
> structure of polling in the low-level network protocol.

First of all, you'll get the same ->f_op for *all* sockets.  So you'll be
hitting that path regardless of sk_can_busy_loop(sock->sk).  What's more,
that way you get (on fast path) even more indirect calls, AFAICS.

And I don't see any point in separate file_has_poll_mask() - just check
->f_poll_head and that's it.

--===============2082800634841874986==--

