Content-Type: multipart/mixed; boundary="===============4228754224894852030=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Fri, 08 Jan 2021 09:29:42 +0000
Message-ID: <e5316226f4174de7925c895cca65a94e@AcuMS.aculab.com>
In-Reply-To: <20210107195734.GL3579531@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4228754224894852030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Al Viro
> Sent: 07 January 2021 19:58
> =

> On Thu, Jan 07, 2021 at 11:33:36AM -0800, Linus Torvalds wrote:
> =

> > In fact, even some threaded app that does what I suspect it could do
> > would likely be ok with it 99% of the time. Because the situation
> > where you change the fd in the poll array is likely not the common
> > case, and even if some -1 file descriptor gets overwritten by a valid
> > one by the poll() system call again, it probably ends up being very
> > hard to see a failure.
> >
> > Which just makes me even more nervous.
> =

> Hmm...  But anything like that will have another problem - we do
> copyin only once.  And we repeat fdget() on each iteration of
> do_poll() loop.  Sure, we don't actually put anything on the
> queues after the first time around, and __pollwait() keeps the
> ones we are actually waiting for pinned, but...  If another
> thread stores -1 to ->fd, then closes what used to be there
> and moves on, what will it see?  ->poll() calls will be done
> for whatever file we'd reused the descriptor for.  Sure,
> the kernel won't break, but the caller of poll() would need
> to be very careful about what it sees...
> =

> Frankly, I'd consider seeing that kind of games in the userland
> as a big red flag; I'm not saying it's OK to break the suckers
> even worse than they are now, but I'm curious whether anything
> in the userland does it *and* how many bugs does it have around
> those uses of poll()...

It is much more likely that an application will change the 'events'
field - in particular enabling POLLOUT if a write() returned EAGAIN.

It could also change the fd, but defer doing the actual close() until
much later - that needs to be synchronised between the application
threads.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

--===============4228754224894852030==--

