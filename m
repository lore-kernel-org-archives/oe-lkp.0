Content-Type: multipart/mixed; boundary="===============8019720156826840560=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 08:55:13 -0700
Message-ID: <CAHk-=wj2t+GK+DGQ7Xy6U7zMf72e7Jkxn4_-kGyfH3WFEoH+YQ@mail.gmail.com>
In-Reply-To: <20190603030324.kl3bckqmebzis2vw@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============8019720156826840560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2019 at 8:03 PM Herbert Xu <herbert@gondor.apana.org.au> w=
rote:
>
> In any case, I am now even more certain that compiler barriers are
> not needed in the code in question.  The reasoning is quite simple.
> If you need those compiler barriers then you surely need real memory
> barriers.

So the above statement is not necessarily correct.

Compiler barriers very much can have real effects even in the absense
of "real" memory barriers.

But those effects are obviously not about multiple CPU's - they are
about code generation and can be about ordering on _one_ CPU. Those
effects definitely happen, though.

So a compiler barrier without a memory barrier may make a difference if you

 (a) compile for UP (when a compiler barrier basically _is_ a memory barrie=
r)

 (b) have deadlock or ordering avoidance with only the local CPU
taking interrupts.

 (c) need to re-load a value in a loop, but ordering isn't a concern

and possibly other situations.

In the above, (a) may be pointless and trivial, but (b) and (c) are
issues even on SMP. Some things only matter for the local CPU - an
interrupt or a code sequence that happens on another CPU can just
block, but if an interrupt comes in on the same CPU may dead-lock and
depend on particular access ordering. And (c) is for things like
cpu_relax() in loops that read stuff (although honestly, READ_ONCE()
is generally a much better pattern).

But it sounds like in this case at least, Herbert's and Paul's
disagreements aren't really all that fundamentally about the memory
barriers and locking, as just the fact that in general the only thing
that RCU protects against is single accesses, and thus any RCU region
technically should use something that guarantees that the compiler
might not do stupid things.

We do require a _minimum_ of compiler sanity, but the compiler turning
a non-marked read into two reads has definitely happened, and can be
very subtle. Even if on a C level it looks like a single access, and
correctness doesn't care about _what_ the value we read is, it might
be turned by the compiler into two separate accesses that get two
different values, and then the end result may be insane and
unreliable.

So on the whole, I do think that it's usually a good idea to show
_which_ access is protected by RCU. Perhaps with a
READ_ONCE/WRITE_ONCE pattern, although it can be other things.

I don't believe that it would necessarily help to turn a
rcu_read_lock() into a compiler barrier, because for the non-preempt
case rcu_read_lock() doesn't need to actually _do_ anything, and
anything that matters for the RCU read lock will already be a compiler
barrier for other reasons (ie a function call that can schedule).

Anyway, I suspect the code is correct in practice, but I do have some
sympathy for the "RCU protected accesses should be marked".

                    Linus

--===============8019720156826840560==--

