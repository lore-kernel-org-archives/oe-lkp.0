Content-Type: multipart/mixed; boundary="===============3441903488305107606=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 8212a964ee: vm-scalability.throughput 30.5% improvement
Date: Sun, 13 Mar 2022 14:10:12 -0700
Message-ID: <CANn89iJwBe4+C8KP--c_9O6QE_Tou+1Z0+ugtuniG-06nzxPmg@mail.gmail.com>
In-Reply-To: <8f499c76-68cb-a2c3-01fd-c8759e2fd317@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3441903488305107606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2022 at 1:29 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 3/13/22 00:26, Eric Dumazet wrote:
> > On Sat, Mar 12, 2022 at 10:59 AM Vlastimil Babka <vbabka@suse.cz> wro=
te:
> >>
> >> On 3/12/22 16:43, kernel test robot wrote:
> >>>
> >>>
> >>> Greeting,
> >>>
> >>> FYI, we noticed a 30.5% improvement of vm-scalability.throughput due =
to commit:
> >>>
> >>>
> >>> commit: 8212a964ee020471104e34dce7029dec33c218a9 ("Re: [PATCH v2] mm/=
page_alloc: call check_new_pages() while zone spinlock is not held")
> >>> url: https://github.com/0day-ci/linux/commits/Mel-Gorman/Re-PATCH-v2-=
mm-page_alloc-call-check_new_pages-while-zone-spinlock-is-not-held/20220309=
-203504
> >>> patch link: https://lore.kernel.org/lkml/20220309123245.GI15701(a)tec=
hsingularity.net
> >>
> >> Heh, that's weird. I would expect some improvement from Eric's patch,
> >> but this seems to be actually about Mel's "mm/page_alloc: check
> >> high-order pages for corruption during PCP operations" applied directly
> >> on 5.17-rc7 per the github url above. This was rather expected to make
> >> performance worse if anything, so maybe the improvement is due to some
> >> unexpected side-effect of different inlining decisions or cache alignm=
ent...
> >>
> >
> > I doubt this has anything to do with inlining or cache alignment.
> >
> > I am not familiar with the benchmark, but its name
> > (anon-w-rand-hugetlb) hints at hugetlb ?
> >
> > After Mel fix, we go over 512 'struct page' to perform sanity checks,
> > thus loading into cpu caches the 512 cache lines.
>
> Ah, that's true.
>
> > This caching is done while no lock is held.
>
> But I don't think this is. The test was AFAICS done without your patch,
> so the lock is still held in rmqueue(). And it's also held in
> rmqueue_bulk() -> check_pcp_refill().

Note that Mel patch  touches both check_pcp_refill() and check_new_pcp()

__rmqueue_pcplist() definitely calls check_new_pcp() while the zone
spinlock is _not_ held.

Note that it is possible to defer calls to check_pcp_refill after the
spinlock is released.

Untested patch:

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 1804287c1b792b8aa0e964b17eb002b6b1115258..3c504b4c068a5dbeeaf8f386bb0=
9b673236f7a11
100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3024,6 +3024,7 @@ static int rmqueue_bulk(struct zone *zone,
unsigned int order,
                        unsigned long count, struct list_head *list,
                        int migratetype, unsigned int alloc_flags)
 {
+       struct page *page, *tmp;
        int i, allocated =3D 0;

        /*
@@ -3032,14 +3033,10 @@ static int rmqueue_bulk(struct zone *zone,
unsigned int order,
         */
        spin_lock(&zone->lock);
        for (i =3D 0; i < count; ++i) {
-               struct page *page =3D __rmqueue(zone, order, migratetype,
-                                                               alloc_flags=
);
+               page =3D __rmqueue(zone, order, migratetype, alloc_flags);
                if (unlikely(page =3D=3D NULL))
                        break;

-               if (unlikely(check_pcp_refill(page)))
-                       continue;
-
                /*
                 * Split buddy pages returned by expand() are received here=
 in
                 * physical page order. The page is added to the tail of
@@ -3065,6 +3062,12 @@ static int rmqueue_bulk(struct zone *zone,
unsigned int order,
         */
        __mod_zone_page_state(zone, NR_FREE_PAGES, -(i << order));
        spin_unlock(&zone->lock);
+       list_for_each_entry_safe(page, tmp, list, lru) {
+               if (unlikely(check_pcp_refill(page))) {
+                       list_del(&page->lru);
+                       allocated--;
+               }
+       }
        return allocated;
 }
--===============3441903488305107606==--

