Content-Type: multipart/mixed; boundary="===============2856075189001973554=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 18 Aug 2016 10:55:01 -0700
Message-ID: <CA+55aFyEQhjm9CU0yhk0WBAArB9soOA0JfWzjricnOqG9GB41g@mail.gmail.com>
In-Reply-To: <20160818132414.GK8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2856075189001973554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 6:24 AM, Mel Gorman <mgorman@techsingularity.net>=
 wrote:
> On Thu, Aug 18, 2016 at 05:11:11PM +1000, Dave Chinner wrote:
>> FWIW, I just remembered about /proc/sys/vm/zone_reclaim_mode.
>>
>
> That is a terrifying "fix" for this problem. It just happens to work
> because there is no spillover to other nodes so only one kswapd instance
> is potentially active.

Well, it may be a terrifying fix, but it does bring up an intriguing
notion: maybe what we should think about is to make the actual page
cache allocations be more "node-sticky" for a particular mapping? Not
some hard node binding, but if we were to make a single mapping *tend*
to allocate pages primarily within the same node, that would have the
kind of secondary afvantage that it would avoid the cross-node mapping
locking.

Think of it as a gentler "guiding" fix to the spinlock contention
issue than a hard hammer.

And trying to (at least initially) keep the allocations of one
particular file to one particular node sounds like it could have other
locality advantages too.

In fact, looking at the __page_cache_alloc(), we already have that
"spread pages out" logic. I'm assuming Dave doesn't actually have that
bit set (I don't think it's the default), but I'm also envisioning
that maybe we could extend on that notion, and try to spread out
allocations in general, but keep page allocations from one particular
mapping within one node.

The fact that zone_reclaim_mode really improves on Dave's numbers
*that* dramatically does seem to imply that there is something to be
said for this.

We do *not* want to limit the whole page cache to a particular node -
that sounds very unreasonable in general. But limiting any particular
file mapping (by default - I'm sure there are things like databases
that just want their one DB file to take over all of memory) to a
single node sounds much less unreasonable.

What do you guys think? Worth exploring?

                    Linus

--===============2856075189001973554==--

