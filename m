Content-Type: multipart/mixed; boundary="===============0220886970019964765=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Fri, 08 Jan 2021 09:37:45 +0000
Message-ID: <824461ae2cb642b1b2f82fac140a98da@AcuMS.aculab.com>
In-Reply-To: <CAHk-=whneXU5Sr=iOOrzcqZt6q85zp-8CUSviOwGPj5ePBW4CQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0220886970019964765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Linus Torvalds
> Sent: 07 January 2021 19:34
> =

> On Thu, Jan 7, 2021 at 11:04 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > BTW, changing 'event' field in place from another thread is going to
> > be interesting - you have two 16bit values next to each other and
> > two CPUs modifying those with no exclusion.  Sounds like a recipe
> > for massive trouble...
> =

> It's perfectly fine on just about anything else than on an original
> pre-ev5 alpha.

Apart from the horrid cost of the cache-line bouncing.

> The C standard even - finally - made it a requirement that accesses to
> different members can't introduce data races.
> =

> So I agree with you that it's a bit annoying, and it's likely not even
> very common, but I could easily imagine myself writing code that
> changes either 'fd' or 'events' in a threaded server.
> =

> That's pretty much the whole point of 'poll()' after all - threaded
> servers that have that convenient array of pollable file descriptors.

I ended up using epoll().
One server thread does the epoll() and then all the threads process
the entries using atomic_increment() on the array index.

The lack of spinlocks in userspace really kills you.
If you use a futex to control a linked list a hardware interrupt
and then all the network and rcu softint callbacks can happen
in the few locked instrcutions.
It doesn't matter that one server thread is blocked for ~1ms,
but having them all blocked is a problem.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

--===============0220886970019964765==--

