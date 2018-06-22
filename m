Content-Type: multipart/mixed; boundary="===============1790719373350582719=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 14:07:39 +0200
Message-ID: <20180622120739.GA15351@lst.de>
In-Reply-To: <20180622115613.GV30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1790719373350582719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 12:56:13PM +0100, Al Viro wrote:
> 	So mark that in ->f_mode - I strongly suspect that
> sk_can_busy_loop(sock->sk) can't change while an opened file is there.
> And lift that (conditional on new FMODE_BUSY_LOOP) into do_poll()
> and do_select() - we *already* have bits of pieces of that logics in
> there and that way they'd at least be gathered in one place.

The problem is that call to sk_busy_loop(), which is going to be indirect
no matter what.

> =

> 	Then replace ->get_poll_head() with file->f_poll_head and
> see what it gives.

Working on it right now.  Works so far except for the busy loop case.
I'm looking into a separate methods just for that as a first idea.

--===============1790719373350582719==--

