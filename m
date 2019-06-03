Content-Type: multipart/mixed; boundary="===============5943584780798767344=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 08:40:40 -0700
Message-ID: <CAHk-=wj4pqF9bwjQHNzAKBmbAFTDWi9KwvLznj0HZLAZ+eGFpw@mail.gmail.com>
In-Reply-To: <9c0a9e2faae7404cb712f57910c8db34@AcuMS.aculab.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5943584780798767344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2019 at 8:26 AM David Laight <David.Laight@aculab.com> wro=
te:
>
> From: Paul E. McKenney
>
> > We do
> > occasionally use READ_ONCE() to prevent load-fusing optimizations that
> > would otherwise cause the compiler to turn while-loops into if-statemen=
ts
> > guarding infinite loops.
>
> In that case the variable ought to be volatile...

No.

We do not use volatile on variables.

The C people got the semantics wrong, probably because 'volatile' was
historically for IO, not for access atomicity without locking.

It's not the memory location that is volatile, it is really the
_access_ that is volatile.

The same memory location might be completely stable in other access
situations (ie when done under a lock).

In other words, we should *never* use volatile in the kernel. It's
fundamentally mis-designed for modern use.

(Of course, we then can use volatile in a cast in code, which drives
some compiler people crazy, but that's because said compiler people
don't care about reality, they care about some paperwork).

                      Linus

--===============5943584780798767344==--

