Content-Type: multipart/mixed; boundary="===============0887080058609498762=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: efad4e475c [ 40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
Date: Mon, 18 Feb 2019 18:05:58 +0100
Message-ID: <20190218170558.GV4525@dhcp22.suse.cz>
In-Reply-To: <20190218164813.GG25446@rapoport-lnx>
List-Id: <oe-lkp.lists.linux.dev>

--===============0887080058609498762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 18-02-19 18:48:14, Mike Rapoport wrote:
> On Mon, Feb 18, 2019 at 04:22:13PM +0100, Michal Hocko wrote:
[...]
> > Thinking about it some more, is it possible that we are overflowing by 1
> > here?
> =

> Looks like that, the end_pfn is actually the first pfn in the next sectio=
n.

Thanks for the confirmation. I guess it also exaplains why nobody has
noticed this off-by-one. Most people seem to use VMEMMAP SPARSE model
and we are safe there.

> > diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> > index 124e794867c5..6618b9d3e53a 100644
> > --- a/mm/memory_hotplug.c
> > +++ b/mm/memory_hotplug.c
> > @@ -1234,10 +1234,10 @@ bool is_mem_section_removable(unsigned long sta=
rt_pfn, unsigned long nr_pages)
> >  {
> >  	struct page *page =3D pfn_to_page(start_pfn);
> >  	unsigned long end_pfn =3D min(start_pfn + nr_pages, zone_end_pfn(page=
_zone(page)));
> > -	struct page *end_page =3D pfn_to_page(end_pfn);
> > +	struct page *end_page =3D pfn_to_page(end_pfn - 1);
> >  =

> >  	/* Check the starting page of each pageblock within the range */
> > -	for (; page < end_page; page =3D next_active_pageblock(page)) {
> > +	for (; page <=3D end_page; page =3D next_active_pageblock(page)) {
> >  		if (!is_pageblock_removable_nolock(page))
> >  			return false;
> >  		cond_resched();
> =

> Works with your fix, but I think mine is more intuitive ;-)

I would rather go and rework this to pfns. What about this instead.
Slightly larger but arguably cleared code?

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 124e794867c5..a799a0bdbf34 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1188,11 +1188,13 @@ static inline int pageblock_free(struct page *page)
 	return PageBuddy(page) && page_order(page) >=3D pageblock_order;
 }
 =

-/* Return the start of the next active pageblock after a given page */
-static struct page *next_active_pageblock(struct page *page)
+/* Return the pfn of the start of the next active pageblock after a given =
pfn */
+static unsigned long next_active_pageblock(unsigned long pfn)
 {
+	struct page *page =3D pfn_to_page(pfn);
+
 	/* Ensure the starting page is pageblock-aligned */
-	BUG_ON(page_to_pfn(page) & (pageblock_nr_pages - 1));
+	BUG_ON(pfn & (pageblock_nr_pages - 1));
 =

 	/* If the entire pageblock is free, move to the end of free page */
 	if (pageblock_free(page)) {
@@ -1200,16 +1202,16 @@ static struct page *next_active_pageblock(struct pa=
ge *page)
 		/* be careful. we don't have locks, page_order can be changed.*/
 		order =3D page_order(page);
 		if ((order < MAX_ORDER) && (order >=3D pageblock_order))
-			return page + (1 << order);
+			return pfn + (1 << order);
 	}
 =

-	return page + pageblock_nr_pages;
+	return pfn + pageblock_nr_pages;
 }
 =

-static bool is_pageblock_removable_nolock(struct page *page)
+static bool is_pageblock_removable_nolock(unsigned long pfn)
 {
+	struct page *page =3D pfn_to_page(pfn);
 	struct zone *zone;
-	unsigned long pfn;
 =

 	/*
 	 * We have to be careful here because we are iterating over memory
@@ -1232,13 +1234,14 @@ static bool is_pageblock_removable_nolock(struct pa=
ge *page)
 /* Checks if this range of memory is likely to be hot-removable. */
 bool is_mem_section_removable(unsigned long start_pfn, unsigned long nr_pa=
ges)
 {
-	struct page *page =3D pfn_to_page(start_pfn);
-	unsigned long end_pfn =3D min(start_pfn + nr_pages, zone_end_pfn(page_zon=
e(page)));
-	struct page *end_page =3D pfn_to_page(end_pfn);
+	unsigned long end_pfn;
+
+	end_pfn =3D min(start_pfn + nr_pages,
+			zone_end_pfn(page_zone(pfn_to_page(start_pfn))));
 =

 	/* Check the starting page of each pageblock within the range */
-	for (; page < end_page; page =3D next_active_pageblock(page)) {
-		if (!is_pageblock_removable_nolock(page))
+	for (; start_pfn < end_pfn; start_pfn =3D next_active_pageblock(start_pfn=
)) {
+		if (!is_pageblock_removable_nolock(start_pfn))
 			return false;
 		cond_resched();
 	}
-- =

Michal Hocko
SUSE Labs

--===============0887080058609498762==--

