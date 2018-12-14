Content-Type: multipart/mixed; boundary="===============2329169040206294155=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Fri, 14 Dec 2018 23:11:47 +0000
Message-ID: <20181214231147.GF29005@techsingularity.net>
In-Reply-To: <alpine.DEB.2.21.1812141244450.186427@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2329169040206294155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 01:04:11PM -0800, David Rientjes wrote:
> On Wed, 12 Dec 2018, Vlastimil Babka wrote:
> =

> > > Regarding the role of direct reclaim in the allocator, I think we nee=
d =

> > > work on the feedback from compaction to determine whether it's worthw=
hile.  =

> > > That's difficult because of the point I continue to bring up: =

> > > isolate_freepages() is not necessarily always able to access this fre=
ed =

> > > memory.
> > =

> > That's one of the *many* reasons why having free base pages doesn't
> > guarantee compaction success. We can and will improve on that. But I
> > don't think it would be e.g. practical to check the pfns of free pages
> > wrt compaction scanner positions and decide based on that.
> =

> Yeah, agreed.  Rather than proposing that memory is only reclaimed if its =

> known that it can be accessible to isolate_freepages(), I'm wondering =

> about the implementation of the freeing scanner entirely.
> =

> In other words, I think there is a lot of potential stranding that occurs =

> for both scanners that could otherwise result in completely free =

> pageblocks.  If there a single movable page present near the end of the =

> zone in an otherwise fully free pageblock, surely we can do better than =

> the current implementation that would never consider this very easy to =

> compact memory.
> =


While it's somewhat premature, I posted a series before I had a full set
of results because it uses free lists to reduce searches and reduces
inference between multiple scanners. Preliminary results indicated it
boosted allocation success rates by 20%ish, reduced migration scanning
by 99% and free scanning by 27%.

> The same problem occurs for the migration scanner where we can iterate =

> over a ton of free memory that is never considered a suitable migration =

> target.  The implementation that attempts to migrate all memory toward th=
e =

> end of the zone penalizes the freeing scanner when it is reset: we just =

> iterate over a ton of used pages.
> =


Yes, partially addressed in series. It can be improved significantly but it
hit a boundary condition near the points where compaction scanners meet. I
dropped the patch in question as it needs more thought on how to deal
with the boundary condition without remigrating the blocks close to it.
Besides, at 14 patches, it would probably be best to get that reviewed
and finalised before building upon it further so review would be welcome.

> Has anybody tried a migration scanner that isn't linearly based, rather =

> finding the highest-order free page of the same migratetype, iterating th=
e =

> pages of its pageblock, and using this to determine whether the actual =

> migration will be worthwhile or not?  I could imagine pageblock_skip bein=
g =

> repurposed for this as the heuristic.
> =


Yes, but it has downsides. Redoing the same work on pageblocks, tracking
state and tracking the exit conditions are tricky. I think it's best to
squeeze the most out of the linear scanning first and the series is the
first step in that.

> It would be interesting to know if anybody has tried using the per-zone =

> free_area's to determine migration targets and set a bit if it should be =

> considered a migration source or a migration target.  If all pages for a =

> pageblock are not on free_areas, they are fully used.
> =


Series has patches which implement something similar to this idea.

-- =

Mel Gorman
SUSE Labs

--===============2329169040206294155==--

