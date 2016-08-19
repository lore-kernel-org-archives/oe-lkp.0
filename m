Content-Type: multipart/mixed; boundary="===============2951749001615103074=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 19 Aug 2016 11:49:46 +0100
Message-ID: <20160819104946.GL8119@techsingularity.net>
In-Reply-To: <CA+55aFzqmNRWyczFHDCgjv2w6ZyD_AUJL1O1ZRmDs+DHT2=2cQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2951749001615103074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 03:25:40PM -0700, Linus Torvalds wrote:
> >> In fact, looking at the __page_cache_alloc(), we already have that
> >> "spread pages out" logic. I'm assuming Dave doesn't actually have that
> >> bit set (I don't think it's the default), but I'm also envisioning
> >> that maybe we could extend on that notion, and try to spread out
> >> allocations in general, but keep page allocations from one particular
> >> mapping within one node.
> >
> > CONFIG_CPUSETS=3Dy
> >
> > But I don't have any cpusets configured (unless systemd is doing
> > something wacky under the covers) so the page spread bit should not
> > be set.
> =

> Yeah, but even when it's not set we just do a generic alloc_pages(),
> which is just going to fill up all nodes. Not perhaps quite as "spread
> out", but there's obviously no attempt to try to be node-aware either.
> =


There is a slight difference. Reads should fill the nodes in turn but
dirty pages (__GFP_WRITE) get distributed to balance the number of dirty
pages on each node to avoid hitting dirty balance limits prematurely.

Yesterday I tried a patch that avoids distributing to remote nodes close
to the high watermark to avoid waking remote kswapd instances. It added a
lot of overhead to the fast path (3%) which hurts every writer but did not
reduce contention enough on the special case of writing a single large file.

As an aside, the dirty distribution check itself is very expensive so I
prototyped something that does the expensive calculations on a vmstat
update. Not sure if it'll work but it's a side issue.

> So _if_ we come up with some reasonable way to say "let's keep the
> pages of this mapping together", we could try to do it in that
> numa-aware __page_cache_alloc().
> =

> It *could* be as simple/stupid as just saying "let's allocate the page
> cache for new pages from the current node" - and if the process that
> dirties pages just stays around on one single node, that might already
> be sufficient.
> =

> So just for testing purposes, you could try changing that
> =

>         return alloc_pages(gfp, 0);
> =

> in __page_cache_alloc() into something like
> =

>         return alloc_pages_node(cpu_to_node(raw_smp_processor_id())), gfp=
, 0);
> =

> or something.
> =


The test would be interesting but I believe that keeping heavy writers
on one node will force them to stall early on dirty balancing even if
there is plenty of free memory on other nodes.

-- =

Mel Gorman
SUSE Labs

--===============2951749001615103074==--

