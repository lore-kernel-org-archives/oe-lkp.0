Content-Type: multipart/mixed; boundary="===============2280559801086031058=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 8212a964ee: vm-scalability.throughput 30.5% improvement
Date: Sun, 13 Mar 2022 14:27:48 -0700
Message-ID: <CANn89iL9u-dWpgNF7YGrQ4RQ5M_BwmS8Hqq3DPeWJunKRbu-PA@mail.gmail.com>
In-Reply-To: <Yi5ftFbykAZLLCwf@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2280559801086031058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2022 at 2:18 PM Matthew Wilcox <willy@infradead.org> wrot=
e:
>
> On Sun, Mar 13, 2022 at 02:10:12PM -0700, Eric Dumazet wrote:
> > @@ -3065,6 +3062,12 @@ static int rmqueue_bulk(struct zone *zone,
> > unsigned int order,
> >          */
> >         __mod_zone_page_state(zone, NR_FREE_PAGES, -(i << order));
> >         spin_unlock(&zone->lock);
> > +       list_for_each_entry_safe(page, tmp, list, lru) {
> > +               if (unlikely(check_pcp_refill(page))) {
> > +                       list_del(&page->lru);
> > +                       allocated--;
> > +               }
> > +       }
>
> ... you'd need to adjust __mod_zone_page_state() too, right?

Probably !
This was only to show the basic idea, as I said, not even compiled or teste=
d :)
--===============2280559801086031058==--

