Content-Type: multipart/mixed; boundary="===============0587023859765897896=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Fri, 14 Dec 2018 13:04:11 -0800
Message-ID: <alpine.DEB.2.21.1812141244450.186427@chino.kir.corp.google.com>
In-Reply-To: <0bbf4202-6187-28fb-37b7-da6885b89cce@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0587023859765897896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Dec 2018, Vlastimil Babka wrote:

> > Regarding the role of direct reclaim in the allocator, I think we need =

> > work on the feedback from compaction to determine whether it's worthwhi=
le.  =

> > That's difficult because of the point I continue to bring up: =

> > isolate_freepages() is not necessarily always able to access this freed =

> > memory.
> =

> That's one of the *many* reasons why having free base pages doesn't
> guarantee compaction success. We can and will improve on that. But I
> don't think it would be e.g. practical to check the pfns of free pages
> wrt compaction scanner positions and decide based on that.

Yeah, agreed.  Rather than proposing that memory is only reclaimed if its =

known that it can be accessible to isolate_freepages(), I'm wondering =

about the implementation of the freeing scanner entirely.

In other words, I think there is a lot of potential stranding that occurs =

for both scanners that could otherwise result in completely free =

pageblocks.  If there a single movable page present near the end of the =

zone in an otherwise fully free pageblock, surely we can do better than =

the current implementation that would never consider this very easy to =

compact memory.

For hugepages, we don't care what pageblock we allocate from.  There are =

requirements for MAX_ORDER-1, but I assume we shouldn't optimize for these =

cases (and if CMA has requirements for a migration/freeing scanner =

redesign, I think that can be special cased).

The same problem occurs for the migration scanner where we can iterate =

over a ton of free memory that is never considered a suitable migration =

target.  The implementation that attempts to migrate all memory toward the =

end of the zone penalizes the freeing scanner when it is reset: we just =

iterate over a ton of used pages.

Reclaim likely could be deterministically useful if we consider a redesign =

of how migration sources and targets are determined in compaction.

Has anybody tried a migration scanner that isn't linearly based, rather =

finding the highest-order free page of the same migratetype, iterating the =

pages of its pageblock, and using this to determine whether the actual =

migration will be worthwhile or not?  I could imagine pageblock_skip being =

repurposed for this as the heuristic.

Finding migration targets would be more tricky, but if we iterate the =

pages of the pageblock for low-order free pages and find them to be mostly =

used, that seems more appropriate than just pushing all memory to the end =

of the zone?

It would be interesting to know if anybody has tried using the per-zone =

free_area's to determine migration targets and set a bit if it should be =

considered a migration source or a migration target.  If all pages for a =

pageblock are not on free_areas, they are fully used.

> > otherwise we fail and defer because it wasn't able =

> > to make a hugepage available.
> =

> Note that THP fault compaction doesn't actually defer itself, which I
> think is a weakness of the current implementation and hope that patch 3
> in my series from yesterday [1] can address that. Because defering is
> the general feedback mechanism that we have for suppressing compaction
> (and thus associated reclaim) in cases it fails for any reason, not just
> the one you mention. Instead of inspecting failure conditions in detail,
> which would be costly, it's a simple statistical approach. And when
> compaction is improved to fail less, defering automatically also happens
> less.
> =


I couldn't get the link to work, unfortunately, I don't think the patch =

series made it to LKML :/  I do see it archived for linux-mm, though, so =

I'll take a look, thanks!

> [1] https://lkml.kernel.org/r/20181211142941.20500-1-vbabka(a)suse.cz
>=20

--===============0587023859765897896==--

