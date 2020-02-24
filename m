Content-Type: multipart/mixed; boundary="===============2946853468100157328=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 11:24:41 -0800
Message-ID: <CAHk-=wjkSb1OkiCSn_fzf2v7A=K0bNsUEeQa+06XMhTO+oQUaA@mail.gmail.com>
In-Reply-To: <20200224021915.GC5061@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2946853468100157328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2020 at 6:19 PM Feng Tang <feng.tang@intel.com> wrote:
>
> > What was it without the alignment?
>
> For 5.0-rc6:
>         ffffffff8225b4c0 d types__ptrace
>         ffffffff8225b4e0 D root_user
>         ffffffff8225b580 D init_user_ns
>
> For 5.0-rc6 + 81ec3f3c4c4
>         ffffffff8225b580 d types__ptrace
>         ffffffff8225b5a0 D root_user
>         ffffffff8225b640 D init_user_ns
>
> The sigpending and __count are in the same cachline.

Ok, so they used to be 32-byte aligned, and making it 64-byte aligned
changed something.

None of it makes any sense, though, since as you say, the two fields
you see having cache movement are still in the same cacheline.

The only difference ends up being whether they are in the first or
second half of the cacheline.

I thought that Cascade Lake ends up having full-cacheline transfers at
all caching levels, though, so even that shouldn't matter.

That said, it's a 2-socket system, so maybe there's something in the
cache transfer between sockets that cares which half of the cacheline
goes first.

Or maybe some critical-word-first logic that is simply buggy (or just
has unfortunate interactions).

I did try your little micro-benchmark on my desktop (small
8-core/16-thread 9900K CPU, just to verify the hotspots.

It does show that the fact that we have *two* atomics is a big deal:
the profiles show __sigqueue_alloc as having about half the cost being
that initial "lock xadd" for the refcount update, and a quarter being
the "lock inc" for the sigpending update.

The sigpending update is cheaper, because clearly the cacheline is
generally on the same core (since we just got it for the refcount).

The dequeuing isn't quite as clear in the profiles, because the "lock
decl" is in __dequeue_signal(), and then we have that free_uid ->
refcount_dec_and_lock_irqsave() chain to the 'lock  cmpxchg' which is
the combined lock and decrement (it's basically
refcount_dec_not_one()).

The rest is xsave/restore and the userspace return (which is very
expensive due to the Intel CPU bugs - 30% of all CPU cycles are on
that stupid 'verw').

I'm guessing this might be another thing that makes Cascade Lake show
things: maybe Intel fixed the CPU bug, and thus the contention is much
more visible because it's not being hidden by the overhead?

ANYWAY.

Considering that none of the numbers make any sense at all, I think
that what's going in is (WARNING: wild handwaving commences) that this
is just extremely timing-sensitive for just _when_ the cacheline
transfer happens, and depending on pure bad luck you can get into a
situation where the likelihood that there's a transfer between the two
locked accesses (particularly maybe on the dequeuing path where they
aren't right next to each other), so instead of doing both accesses
with the same cacheline ownership, you get a bounce in between them.

And maybe there is some data transfer path where the cacheline is
transferred as two 32-byte transfers, and if the two words are in the
"high" 32 bytes, it takes longer to get them initially, and then it's
also likelier that you end up losing it again between accesses.

Yeah, if we could harness the energy from that handwaving, we could
probably power a small village.

I don't know. This does not seem to be a particularly serious load.
But it does feel like it should be possible to combine the two atomic
accesses into one, where you don't need to do the refcount thing
except for the case where sigcount goes from zero to non-zero (and
back to zero again).

But is it worth spending resources on it?

It might be a good idea to ask a hardware person why that 32-byte
cacheline placement might matter on that platform.

Does anybody else have any ideas?

                Linus
--===============2946853468100157328==--

