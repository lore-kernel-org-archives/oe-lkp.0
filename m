Content-Type: multipart/mixed; boundary="===============3520007999805445605=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 8212a964ee: vm-scalability.throughput 30.5% improvement
Date: Sun, 13 Mar 2022 21:18:44 +0000
Message-ID: <Yi5ftFbykAZLLCwf@casper.infradead.org>
In-Reply-To: <CANn89iJwBe4+C8KP--c_9O6QE_Tou+1Z0+ugtuniG-06nzxPmg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3520007999805445605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 13, 2022 at 02:10:12PM -0700, Eric Dumazet wrote:
> @@ -3065,6 +3062,12 @@ static int rmqueue_bulk(struct zone *zone,
> unsigned int order,
>          */
>         __mod_zone_page_state(zone, NR_FREE_PAGES, -(i << order));
>         spin_unlock(&zone->lock);
> +       list_for_each_entry_safe(page, tmp, list, lru) {
> +               if (unlikely(check_pcp_refill(page))) {
> +                       list_del(&page->lru);
> +                       allocated--;
> +               }
> +       }

... you'd need to adjust __mod_zone_page_state() too, right?

>         return allocated;
>  }
>=20
--===============3520007999805445605==--

