Content-Type: multipart/mixed; boundary="===============7859379499384024028=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [locking/lockdep] 383776fa75: INFO: trying to register non-static key.
Date: Fri, 17 Mar 2017 15:41:41 +0100
Message-ID: <20170317144140.cpsdlpairb2falsv@linutronix.de>
In-Reply-To: <20170317134109.e7qmjwpryelpbgz2@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7859379499384024028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2017-03-17 14:41:09 [+0100], Peter Zijlstra wrote:
> On Fri, Mar 17, 2017 at 02:07:05AM +0800, kernel test robot wrote:
> =

> >     locking/lockdep: Handle statically initialized PER_CPU locks proper=
ly
> =

> > [   11.712266] INFO: trying to register non-static key.
> =

> Blergh; so the problem is that when we assign can_addr to lock->key, we
> can, upon using a different subclass, reach static_obj(lock->key), which
> will fail on the can_addr.
> =

> One way to fix this would be to redefine the canonical address as the
> per-cpu address for a specific cpu; the below hard codes cpu0, but I'm
> not sure we want to rely on cpu0 being a valid cpu.

This solves two problems: The one reported by the bot. The other thing,
that is fixed by the patch, is that the first PER-CPU variable built-in
will return 0 for can_addr and so will the first variable in every
module. As far as I understand it, this should be unique and having the
same value for multiple different variables does not look too good :)
So adding the offset from CPU0 sounds good.

Sebastian

--===============7859379499384024028==--

