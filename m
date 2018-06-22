Content-Type: multipart/mixed; boundary="===============0999238815783999328=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 14:33:07 +0200
Message-ID: <20180622123307.GA16699@lst.de>
In-Reply-To: <20180622121722.GW30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0999238815783999328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 01:17:22PM +0100, Al Viro wrote:
> > The problem is that call to sk_busy_loop(), which is going to be indire=
ct
> > no matter what.
> =

> 	if ->f_poll_head is NULL {
> 		use ->poll
> 	} else {
> 		if can ll_poll (checked in ->f_mode)
> 			call ->ll_poll(), if it returns what we want - we are done
> 		add to ->f_poll_head
> 		call ->poll_mask()

What I have for now is slightly different:

	if ((events & POLL_BUSY_LOOP) && file->f_op->poll_busy_loop)
		file->f_op->poll_busy_loop(file, events);

	if (file->f_op->poll) {
		return file->f_op->poll(file, pt);
	} else if (file_has_poll_mask(file)) {
		...
	}

returns whatever we want part is something I want to look into
once the basics are done as it probably is non entirely trivial due to
structure of polling in the low-level network protocol.

--===============0999238815783999328==--

