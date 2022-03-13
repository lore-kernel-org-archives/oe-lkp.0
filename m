Content-Type: multipart/mixed; boundary="===============2681316479931913760=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 8212a964ee: vm-scalability.throughput 30.5% improvement
Date: Sun, 13 Mar 2022 14:36:07 -0700
Message-ID: <CANn89iKKgT0BdQgBwZSbNNwyiOJELr7kdbPyCxMQUDxTeUL8-Q@mail.gmail.com>
In-Reply-To: <CANn89iL9u-dWpgNF7YGrQ4RQ5M_BwmS8Hqq3DPeWJunKRbu-PA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2681316479931913760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2022 at 2:27 PM Eric Dumazet <edumazet@google.com> wrote:
>
> On Sun, Mar 13, 2022 at 2:18 PM Matthew Wilcox <willy@infradead.org> wr=
ote:
> >
> > On Sun, Mar 13, 2022 at 02:10:12PM -0700, Eric Dumazet wrote:
> > > @@ -3065,6 +3062,12 @@ static int rmqueue_bulk(struct zone *zone,
> > > unsigned int order,
> > >          */
> > >         __mod_zone_page_state(zone, NR_FREE_PAGES, -(i << order));
> > >         spin_unlock(&zone->lock);
> > > +       list_for_each_entry_safe(page, tmp, list, lru) {
> > > +               if (unlikely(check_pcp_refill(page))) {
> > > +                       list_del(&page->lru);
> > > +                       allocated--;
> > > +               }
> > > +       }
> >
> > ... you'd need to adjust __mod_zone_page_state() too, right?
>
> Probably !
> This was only to show the basic idea, as I said, not even compiled or tes=
ted :)

I can test the following:

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 1804287c1b792b8aa0e964b17eb002b6b1115258..30a1abf40ea7e9104bfd24a42d9=
e0c8ebb152fc4
100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3024,7 +3024,9 @@ static int rmqueue_bulk(struct zone *zone,
unsigned int order,
                        unsigned long count, struct list_head *list,
                        int migratetype, unsigned int alloc_flags)
 {
+       struct page *page, *tmp;
        int i, allocated =3D 0;
+       int free_cma_pages =3D 0;

        /*
         * local_lock_irq held so equivalent to spin_lock_irqsave for
@@ -3032,14 +3034,10 @@ static int rmqueue_bulk(struct zone *zone,
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
@@ -3052,9 +3050,6 @@ static int rmqueue_bulk(struct zone *zone,
unsigned int order,
                 */
                list_add_tail(&page->lru, list);
                allocated++;
-               if (is_migrate_cma(get_pcppage_migratetype(page)))
-                       __mod_zone_page_state(zone, NR_FREE_CMA_PAGES,
-                                             -(1 << order));
        }

        /*
@@ -3065,6 +3060,16 @@ static int rmqueue_bulk(struct zone *zone,
unsigned int order,
         */
        __mod_zone_page_state(zone, NR_FREE_PAGES, -(i << order));
        spin_unlock(&zone->lock);
+       list_for_each_entry_safe(page, tmp, list, lru) {
+               if (unlikely(check_pcp_refill(page))) {
+                       list_del(&page->lru);
+                       allocated--;
+               } else if (is_migrate_cma(get_pcppage_migratetype(page))) {
+                       free_cma_pages++;
+               }
+       }
+       if (free_cma_pages)
+               __mod_zone_page_state(zone, NR_FREE_CMA_PAGES,
-(free_cma_pages << order));
        return allocated;
 }
--===============2681316479931913760==--

