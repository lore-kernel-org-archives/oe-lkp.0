Content-Type: multipart/mixed; boundary="===============1588071774852678425=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Fri, 08 Jan 2021 10:44:04 +0000
Message-ID: <bd305585311745ae9f721b7d50307fc5@AcuMS.aculab.com>
In-Reply-To: <X/grPFTgOMvtqEVZ@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1588071774852678425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Zijlstra
> Sent: 08 January 2021 09:52
> =

> On Fri, Jan 08, 2021 at 09:37:45AM +0000, David Laight wrote:
> > The lack of spinlocks in userspace really kills you.
> =

> Glibc has them, but please don't complain about lock holder preemption
> issues if you do actually use them ;-)

Nothing that glibc can do can help.
It would need to disable interrupts - which isn't allowed in userspace.

The problem isn't that the process holding the lock gets preempted,
but that the lock hold time goes from a few instructions to ~1ms.

It is also entirely noticeable (and a problem) that the futex call
that implements cv_broadcast() gets each process to wake up the next one.
There are two issues:
1) It takes time for the cpu to come out of the sleep states.
   These happen in sequence rather than all together.
2) If the processor affinities mean that one of the threads can't
   be run immediately, then none of the later threads runs either.

I realise this is (probably) done to avoid the 'thundering herd'
on the related mutex - but this code gets nowhere near acquiring
the mutex before the delays, and the mutex is released pretty
soon after 'return to user'.

The delays are far longer than a normal system call or even a =

process switch.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

--===============1588071774852678425==--

