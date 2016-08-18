Content-Type: multipart/mixed; boundary="===============8109542717764384604=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 19 Aug 2016 07:19:49 +1000
Message-ID: <20160818211949.GE22388@dastard>
In-Reply-To: <CA+55aFyEQhjm9CU0yhk0WBAArB9soOA0JfWzjricnOqG9GB41g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8109542717764384604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 10:55:01AM -0700, Linus Torvalds wrote:
> On Thu, Aug 18, 2016 at 6:24 AM, Mel Gorman <mgorman@techsingularity.ne=
t> wrote:
> > On Thu, Aug 18, 2016 at 05:11:11PM +1000, Dave Chinner wrote:
> >> FWIW, I just remembered about /proc/sys/vm/zone_reclaim_mode.
> >>
> >
> > That is a terrifying "fix" for this problem. It just happens to work
> > because there is no spillover to other nodes so only one kswapd instance
> > is potentially active.
> =

> Well, it may be a terrifying fix, but it does bring up an intriguing
> notion: maybe what we should think about is to make the actual page
> cache allocations be more "node-sticky" for a particular mapping? Not
> some hard node binding, but if we were to make a single mapping *tend*
> to allocate pages primarily within the same node, that would have the
> kind of secondary afvantage that it would avoid the cross-node mapping
> locking.

For streaming or use-once IO it makes a lot of sense to restrict the
locality of the page cache. The faster the IO device, the less dirty
page buffering we need to maintain full device bandwidth. And the
larger the machine the greater the effect of global page cache
pollution on the other appplications is.

> Think of it as a gentler "guiding" fix to the spinlock contention
> issue than a hard hammer.
> =

> And trying to (at least initially) keep the allocations of one
> particular file to one particular node sounds like it could have other
> locality advantages too.
> =

> In fact, looking at the __page_cache_alloc(), we already have that
> "spread pages out" logic. I'm assuming Dave doesn't actually have that
> bit set (I don't think it's the default), but I'm also envisioning
> that maybe we could extend on that notion, and try to spread out
> allocations in general, but keep page allocations from one particular
> mapping within one node.

CONFIG_CPUSETS=3Dy

But I don't have any cpusets configured (unless systemd is doing
something wacky under the covers) so the page spread bit should not
be set.

> The fact that zone_reclaim_mode really improves on Dave's numbers
> *that* dramatically does seem to imply that there is something to be
> said for this.
> =

> We do *not* want to limit the whole page cache to a particular node -
> that sounds very unreasonable in general. But limiting any particular
> file mapping (by default - I'm sure there are things like databases
> that just want their one DB file to take over all of memory) to a
> single node sounds much less unreasonable.
> =

> What do you guys think? Worth exploring?

The problem is that whenever we turn this sort of behaviour on, some
benchmark regresses because it no longer holds it's working set in
the page cache, leading to the change being immediately reverted.
Enterprise java benchmarks ring a bell, for some reason.

Hence my comment above about needing it to be tied into specific
"use-once-only" page cache behaviours. I know we have working set
estimation, fadvise modes and things like readahead that help track
sequential and use-once access patterns, but I'm not sure how we can
tie that all together....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============8109542717764384604==--

