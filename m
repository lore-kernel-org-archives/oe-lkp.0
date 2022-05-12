Content-Type: multipart/mixed; boundary="===============4039943616183356813=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Thu, 12 May 2022 11:06:34 -0700
Message-ID: <20220512110634.712057e4663ecc5f697bf185@linux-foundation.org>
In-Reply-To: <CAHk-=whmeWNC-YH_cGRofdW3Spt8Y5nfWpoX=CipQ5pBYgnt2g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4039943616183356813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 12 May 2022 10:42:09 -0700 Linus Torvalds <torvalds@linux-foundat=
ion.org> wrote:

> On Thu, May 12, 2022 at 5:46 AM Aaron Lu <aaron.lu@intel.com> wrote:
> >
> > When nr_process=3D16, zone lock contention increased about 21% from 6% =
to
> > 27%, performance dropped 17.8%, overall lock contention increased 14.3%:
> =

> So the contention issue seems real and nasty, and while the queued
> locks may have helped a bit, I don't think they ended up making a
> *huge* change: the queued locks help make sure the lock itself doesn't
> bounce all over the place, but clearly if the lock holder writes close
> to the lock, it will still bounce with at least *one* lock waiter.
> =

> And having looked at the qspinlock code, I have to agree with Waiman
> and PeterZ that I don't think the locking code can reasonably eb
> changed - I'm sure this particular case could be improved, but the
> downsides for other cases would be quite large enough to make that a
> bad idea.
> =

> So I think the issue is that
> =

>  (a) that zone lock is too hot.
> =

>  (b) given lock contention, the fields that get written to under the
> lock are too close to the lock
> =

> Now, the optimal fix would of course be to just fix the lock so that
> it isn't so hot. But assuming that's not possible, just looking at the
> definition of that 'struct zone', I do have to say that the
> ZONE_PADDING fields seem to have bit-rotted over the years.
> =

> The whole and only reason for them would be to avoid the cache
> bouncing, but commit 6168d0da2b47 ("mm/lru: replace pgdat lru_lock
> with lruvec lock") actively undid that for the 'lru_lock' case, and
> way back when commit a368ab67aa55 ("mm: move zone lock to a different
> cache line than order-0 free page lists") tried to make it true for
> the 'lock' vs free_area[] cases, but did it without actually using the
> ZONE_PADDING thing, but by moving things around, and not really
> *guaranteeing* that 'lock' was in a different cacheline, but really
> just making 'free_area[]' aligned, but still potentially in the same
> cache-line as 'lock' (so now the lower-order 'free_area[]' entries are
> not sharing a cache-line, but the higher-order 'free_area[]' ones
> probably are).
> =

> So I get the feeling that those 'ZONE_PADDING' things are a bit random
> and not really effective.
> =

> In a perfect world, somebody would fix the locking to just not have as
> much contention. But assuming that isn't an option, maybe somebody
> should just look at that 'struct zone' layout a bit more.

(hopefully adds linux-mm to cc)
--===============4039943616183356813==--

