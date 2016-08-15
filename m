Content-Type: multipart/mixed; boundary="===============0651362885690564107=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 16:20:55 -0700
Message-ID: <CA+55aFzOAorMxCsv3uyyyhS8c5xteVnZVEm+bGyBjkjWVT5Zag@mail.gmail.com>
In-Reply-To: <20160815224259.GB19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============0651362885690564107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 3:42 PM, Dave Chinner <david@fromorbit.com> wrote:
>
>   31.18%  [kernel]  [k] __pv_queued_spin_lock_slowpath
>    9.90%  [kernel]  [k] copy_user_generic_string
>    3.65%  [kernel]  [k] __raw_callee_save___pv_queued_spin_unlock
>    2.62%  [kernel]  [k] __block_commit_write.isra.29
>    2.26%  [kernel]  [k] _raw_spin_lock_irqsave
>    1.72%  [kernel]  [k] _raw_spin_lock

Ok, this is more like it.

I'd still like to see it on raw hardware, just to see if we may have a
bug in the PV code. Because that code has been buggy before. I
*thought* we fixed it, but ...

In fact, you don't even need to do it outside of virtualization, but
with paravirt disabled (so that it runs the native non-pv locking in
the virtual machine).

>    36.60%     0.00%  [kernel]            [k] kswapd
>    - 30.29% kswapd
>       - 30.23% shrink_node
>          - 30.07% shrink_node_memcg.isra.75
>             - 30.15% shrink_inactive_list
>                - 29.49% shrink_page_list
>                   - 22.79% __remove_mapping
>                      - 22.27% _raw_spin_lock_irqsave
>                           __pv_queued_spin_lock_slowpath

How I dislike the way perf shows the call graph data... Just last week
I was talking to Arnaldo about how to better visualize the cost of
spinlocks, because the normal way "perf" shows costs is so nasty.

What happens is that you see that 36% of CPU time is attributed to
kswapd, and then you can drill down and see where that 36% comes from.
So far so good, and that's what perf does fairly well.

But then when you find the spinlock, you actually want to go the other
way, and instead ask it to show "who were the callers to this routine
and what were the percentages", so that you can then see whether (for
example) it's just that __remove_mapping() use that contends with
itself, or whether it's contending with the page additions or
whatever..

And perf makes that unnecessarily much too hard to see.

So what I'd like to see (and this is where it becomes *so* much more
useful to be able to recreate it myself so that I can play with the
perf data several different ways) is to see what the profile looks
like in that spinlocked region.

Hmm. I guess you could just send me the "perf.data" and "vmlinux"
files, and I can look at it that way. But I'll try to see what happens
on my profile, even if I can't recreate the contention itself, just
trying to see what happens inside of that region.

None of this code is all that new, which is annoying. This must have
gone on forever,

               Linus

--===============0651362885690564107==--

