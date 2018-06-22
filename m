Content-Type: multipart/mixed; boundary="===============1889409735106995819=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 13:17:22 +0100
Message-ID: <20180622121722.GW30522@ZenIV.linux.org.uk>
In-Reply-To: <20180622120739.GA15351@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1889409735106995819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 02:07:39PM +0200, Christoph Hellwig wrote:
> On Fri, Jun 22, 2018 at 12:56:13PM +0100, Al Viro wrote:
> > 	So mark that in ->f_mode - I strongly suspect that
> > sk_can_busy_loop(sock->sk) can't change while an opened file is there.
> > And lift that (conditional on new FMODE_BUSY_LOOP) into do_poll()
> > and do_select() - we *already* have bits of pieces of that logics in
> > there and that way they'd at least be gathered in one place.
> =

> The problem is that call to sk_busy_loop(), which is going to be indirect
> no matter what.

	if ->f_poll_head is NULL {
		use ->poll
	} else {
		if can ll_poll (checked in ->f_mode)
			call ->ll_poll(), if it returns what we want - we are done
		add to ->f_poll_head
		call ->poll_mask()
	}

--===============1889409735106995819==--

