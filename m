Content-Type: multipart/mixed; boundary="===============2740145767859005442=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 16:05:00 +0100
Message-ID: <20160816150500.GH8119@techsingularity.net>
In-Reply-To: <CA+55aFwp-Aeu-6j2MfMgEDoUwq+1vThL4nBdMj-p5TqDMA5RrA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2740145767859005442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:48:36PM -0700, Linus Torvalds wrote:
> On Mon, Aug 15, 2016 at 4:20 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > None of this code is all that new, which is annoying. This must have
> > gone on forever,
> =

> ... ooh.
> =

> Wait, I take that back.
> =

> We actually have some very recent changes that I didn't even think
> about that went into this very merge window.
> =

> In particular, I wonder if it's all (or at least partly) due to the
> new per-node LRU lists.
> =

> So in shrink_page_list(), when kswapd is encountering a page that is
> under page writeback due to page reclaim, it does:
> =

>                         if (current_is_kswapd() &&
>                             PageReclaim(page) &&
>                             test_bit(PGDAT_WRITEBACK, &pgdat->flags)) {
>                                 nr_immediate++;
>                                 goto keep_locked;
> =


I have a limited view of the full topic as I've been in meetings all day
and have another 3 hours to go. I'll set time aside tomorrow to look closer
but there is a theory at the end of the mail.

Node-lru does alter what locks are contended and affects the timing of some
issues but this spot feels like a bad fit. That logic controls whether kswa=
pd
will stall due to dirty/writeback pages reaching the tail of the LRU too
quickly. It can affect lru_lock contention that may be worse with node-lru,
particularly on single-node machines but a workload of a streaming writer
is unlikely to hit that unless the underlying storage is extremely slow.

Another alternation of node-lru potentially affects when buffer heads get
stripped but that's also a poor fit.

I'm not willing to rule out node-lru because it may be wishful thinking
but it feels unlikely.

> which basically ignores that page and puts it back on the LRU list.
> =

> But that "is this node under writeback" is new - it now does that per
> node, and it *used* to do it per zone (so it _used_ to test "is this
> zone under writeback").
> =


Superficially, a small high zone would affect the timing of when a zone
got marked congested and triggered a sleep. Sleeping avoids new pages being
allocated/dirties and may reduce contention. However, quick sleeps due to
small zones was offset by the fair zone allocation policy and is still
offset by GFP_WRITE distributing dirty pages on different zones. The
timing of when sleeps occur due to excessive dirty pages at the tail of
the LRU should be roughly similar with either zone-lru or node-lru.

> All the mapping pages used to be in the same zone, so I think it
> effectively single-threaded the kswapd reclaim for one mapping under
> reclaim writeback. But in your cases, you have multiple nodes...
> =

> Ok, that's a lot of hand-wavy new-age crystal healing thinking.
> =

> Really, I haven't looked at it more than "this is one thing that has
> changed recently, I wonder if it changes the patterns and could
> explain much higher spin_lock contention on the mapping->tree_lock".
> =

> I'm adding Mel Gorman and his band of miscreants to the cc, so that
> they can tell me that I'm full of shit, and completely missed on what
> that zone->node change actually ends up meaning.
> =

> Mel? The issue is that Dave Chinner is seeing some nasty spinlock
> contention on "mapping->tree_lock":
> =


Band Of Miscreants may be the new name for the MM track at LSF/MM.  In the
meantime lets try some hand waving;

A single-threaded file write on a 4-node system is going to have 4 kswapd
instances, writeback and potentially the writer itself all reclaiming.
Given the workload, it's likely that almost all pages have the same
mapping. As they are contending on __remove_mapping, the pages must be
clean when the attempt to reclaim was made and buffers stripped.

The throttling mechanisms for kswapd and direct reclaim rely on either
too many pages being isolated (unlikely to fire in this case) or too many
dirty/writeback pages reaching the end of the LRU. There is not a direct
throttling mechanism for excessive lock contention

However, historically there have been multiple indirect throttling mechanism
that were branded as congestion control but basically said "I don't know
what's going on so it's nap time". Many of these have been removed over
time and the last major one was ede37713737 ("mm: throttle on IO only when
there are too many dirty and writeback pages").

Before that commit, a process that entered direct reclaim and failed to make
progress would sleep before retrying. It's possible that sleep was enough
to reduce contention by temporarily stalling the writer and letting reclaim
make progress. After that commit, it may only do a cond_resched() check
and go back to allocating/reclaiming as quickly as possible. This active
writer may be enough to increase contention. If so, it also means it
stops kswapd making forward progress, leading to more direct reclaim and
more contention.

It's not a perfect theory and assumes;

1. The writer is direct reclaiming
2. The writer was previously failing to __remove_mapping
3. The writer calling congestion_wait due to __remove_mapping failing
   was enough to allow kswapd or writeback to make enough progress to
   avoid contention
4. The writer staying awake allocating and dirtying pages is keeping all
   the kswapd instances awake and writeback continually active and
   increasing the contention overall.

If it was possible to trigger this problem in 4.7 then it would also be
worth checking 4.6. If 4.6 is immune, check that before and after commit
ede37713737.

-- =

Mel Gorman
SUSE Labs

--===============2740145767859005442==--

