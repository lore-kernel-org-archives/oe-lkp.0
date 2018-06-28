Content-Type: multipart/mixed; boundary="===============4320491425090755240=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Fri, 29 Jun 2018 00:37:21 +0100
Message-ID: <20180628233720.GN30522@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFz1PQ86=6xEFM9ajZRoKF7NyAQmf8Gd8qnOOguFieWWbA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4320491425090755240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 03:55:35PM -0700, Linus Torvalds wrote:
> > You are misreading that mess.  What he's trying to do (other than survi=
ving
> > the awful clusterfuck around cancels) is to handle the decision what to
> > report to userland right in the wakeup callback.  *That* is what really
> > drives the "make the second-pass ->poll() or something similar to it
> > non-blocking" (in addition to the fact that it is such in considerable
> > majority of instances).
> =

> That's just crazy BS.
> =

> Just call poll() again when you copy the data to userland (which by
> definition can block, again).
> =

> Stop the idiotic "let's break poll for stupid AIO reasons, because the
> AIO people are morons".

You underestimate the nastiness of that thing (and for the record, I'm
a lot *less* fond of AIO than you are, what with having had to read that
nest of horrors lately).  It does not "copy the data to userland"; what it
does instead is copying into an array of pages it keeps, right from
IO completion callback.  In read/write case.  This
        ev_page =3D kmap_atomic(ctx->ring_pages[pos / AIO_EVENTS_PER_PAGE]);
        event =3D ev_page + pos % AIO_EVENTS_PER_PAGE;

        event->obj =3D (u64)(unsigned long)iocb->ki_user_iocb;
        event->data =3D iocb->ki_user_data;
        event->res =3D res;
        event->res2 =3D res2;

        kunmap_atomic(ev_page);
        flush_dcache_page(ctx->ring_pages[pos / AIO_EVENTS_PER_PAGE]);
is what does the copying.  And that might be done from IRQ context.
Yes, really.

They do have a slightly saner syscall that does copying from the damn
ring buffer, but its use is optional - userland can (and does) direct
read access to mmapped buffer.

Single-consumer ABIs suck and AIO is one such...

It could do schedule_work() and do blocking stuff from that - does so, in
case if it can't grab ->ctx_lock.  Earlier iteration used to try doing
everything straight from wakeup callback, and *that* was racy as hell;
I'd rather have Christoph explain which races he'd been refering to,
but there had been a whole lot of that.  Solution I suggested in the
last round of that was to offload __aio_poll_complete() via schedule_work()
both for cancel and poll wakeup cases.  Doing the common case right
from poll wakeup callback was argued to avoid noticable overhead in
common situation - that's what "aio: try to complete poll iocbs without
context switch" is about.  I'm more than slightly unhappy about the
lack of performance regression testing in non-AIO case...

At that point I would really like to see replies from Christoph - he's
on CET usually, no idea what his effective timezone is...

--===============4320491425090755240==--

