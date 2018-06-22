Content-Type: multipart/mixed; boundary="===============1136817905360357597=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 18:18:02 +0200
Message-ID: <20180622161802.GA18957@lst.de>
In-Reply-To: <20180622152850.GA14366@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1136817905360357597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 05:28:50PM +0200, Christoph Hellwig wrote:
> On Fri, Jun 22, 2018 at 04:14:09PM +0100, Al Viro wrote:
> > >     http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/re=
move-get-poll-head
> > =

> > See objections upthread re "fs,net: move poll busy loop handling into a
> > separate method"; as for the next one... I'd like an ACK from networking
> > folks.  The rest of queue makes sense.
> =

> I want to see basic results first before micro-optimizing.  After that
> I'll send it out to the net folks for feedback.

I looked into this a bit, in the end sk_can_busy_loop does this:

	return sk->sk_ll_usec && !signal_pending(current);

where sk_ll_usec defaults based on a sysctl that needs to be
turned on, but can be overriden per socket.

While at the same time corect poll code already checks net_busy_loop_on
to set POLL_BUSY_LOOP.  So except for sockets where people set the
timeout to 0 the code already does the right thing as-is.  IMHO not
really worth wasting a FMODE_* flag for it, but if you insist I'll add
it.

--===============1136817905360357597==--

