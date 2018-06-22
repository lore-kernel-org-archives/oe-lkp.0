Content-Type: multipart/mixed; boundary="===============4625923316518305803=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 19:02:18 +0900
Message-ID: <CA+55aFyW-zN4363TOwptyzZ=6S1fDeatZMe6hYa656AJmnhmXA@mail.gmail.com>
In-Reply-To: <20180622095608.GA12263@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4625923316518305803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 6:46 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > The disadvantages are obvious: every poll event now causes *two*
> > indirect branches to the low-level filesystem or driver - one to get
> > he poll head, and one to get the mask. Add to that all the new "do we
> > have the new-style or old sane poll interface" tests, and poll is
> > obviously more complicated.
>
> It already caused two

No it didn't. If the data was ready, all that got short-circuited, and
we just had that ->poll() call.

Only if you *waited* did you get the second one to check the result,
and the whole poll_wait(). You could just say "I already have the
data, there's no wait-queu to add, I'll just return immediately".

You're making this all unconditionally pessimal.

Admit it. The new interface is inferior.

> In the meantime below is an ugly patch that removes the _qproc
> indirect for ->poll only (similar patch is possible for select
> assuming the code uses select).  And for next merge window I plan
> to kill it off entirely.

You're just making the code even worse here.

Seriously, this patch is beyond ugly. The new interface is nasty shit.

Get your act together. Don't uglify and slow down everything else just
because you're concentrating only on aio.

Your reply so far just makes me more convinced this was not thought
through properly.

            Linus

--===============4625923316518305803==--

