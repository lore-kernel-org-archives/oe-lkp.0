Content-Type: multipart/mixed; boundary="===============0953298024142514514=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Sun, 23 Feb 2020 17:06:33 -0800
Message-ID: <CAHk-=whi87NNOnNXJ6CvyyedmhnS8dZA2YkQQSajvBArH5XOeA@mail.gmail.com>
In-Reply-To: <20200224003301.GA5061@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0953298024142514514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2020 at 4:33 PM Feng Tang <feng.tang@intel.com> wrote:
>
> From the perf c2c data, and the source code checking, the conflicts
> only happens for root_user.__count, and root_user.sigpending, as
> all running tasks are accessing this global data for get/put and
> other operations.

That's odd.

Why? Because those two would be guaranteed to be in the same cacheline
_after_ you've aligned that user_struct.

So if it were a false sharing issue between those two, it would
actually get _worse_ with alignment. Those two fields are basically
next to each other.

But maybe it was straddling a cacheline before, and it caused two
cache accesses each time?

I find this as confusing as you do.

If it's sigpending vs the __refcount, then we almost always change
them together. sigpending gets incremented by __sigqueue_alloc() -
which also does a "get_uid()", and then we decrement it in
__sigqueue_free() - which also does a "free_uid().

That said, exactly *because* they get incremented and decremented
together, maybe we could do something clever: make the "sigpending" be
a separate user counter, kind of how we do mm->user vs mm-.count.

And we'd only increment __refcount as the sigpending goes from zero to
non-zero, and decrement it as sigpending goes back to zero. Avoiding
the double atomics for the case of "lots of signals".

>      ffffffff8225b580 d types__ptrace
>      ffffffff8225b5c0 D root_user
>      ffffffff8225b680 D init_user_ns

I'm assuming this is after the alignment patch (since that's 64-byte
aligned there).

What was it without the alignment?

> No, it's not the biggest, I tried another machine 'Xeon Phi(TM) CPU 7295',
> which has 72C/288T, and the regression is not seen. This is the part
> confusing me :)

Hmm.

Humor me - what  happens if you turn off SMT on that Cascade Lake
system?  Maybe it's about the thread ID bit in the L1? Although again,
I'd have expected things to get _worse_ if it's the two fields that
are now in the same cachline thanks to alignment.

The Xeon Phi is the small-core setup, right? They may be slow enough
to not show the issue as clearly despite having more cores. And it
wouldn't show effects of some out-of-order speculative cache accesses.

                Linus
--===============0953298024142514514==--

