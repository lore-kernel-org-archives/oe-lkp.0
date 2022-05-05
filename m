Content-Type: multipart/mixed; boundary="===============3655251376372384319=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Thu, 05 May 2022 16:27:04 +0800
Message-ID: <YnOKWNE3PZzzohNH@ziqianlu-desk1>
In-Reply-To: <20220429133918.GC3441@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3655251376372384319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 02:39:18PM +0100, Mel Gorman wrote:
> On Fri, Apr 29, 2022 at 07:29:19PM +0800, Aaron Lu wrote:

... ...

> > The said change looks like this:
> > (relevant comment will have to be adjusted)
> > =

> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 505d59f7d4fa..130a02af8321 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3332,18 +3332,19 @@ static int nr_pcp_high(struct per_cpu_pages *pc=
p, struct zone *zone,
> >  		       bool free_high)
> >  {
> >  	int high =3D READ_ONCE(pcp->high);
> > +	int batch =3D READ_ONCE(pcp->batch);
> >  =

> > -	if (unlikely(!high || free_high))
> > +	if (unlikely(!high))
> >  		return 0;
> >  =

> > -	if (!test_bit(ZONE_RECLAIM_ACTIVE, &zone->flags))
> > -		return high;
> > -
> >  	/*
> >  	 * If reclaim is active, limit the number of pages that can be
> >  	 * stored on pcp lists
> >  	 */
> > -	return min(READ_ONCE(pcp->batch) << 2, high);
> > +	if (test_bit(ZONE_RECLAIM_ACTIVE, &zone->flags) || free_high)
> > +		return min(batch << 2, high);
> > +
> > +	return high;
> >  }
> >  =

> >  static void free_unref_page_commit(struct page *page, int migratetype,
> > =

> > Does this look sane? If so, I can prepare a formal patch with proper
> > comment and changelog, thanks.
> =

> I think it looks reasonable sane. The corner case is that if
> ((high - (batch >> 2)) > cachesize) that the pages will not get recycled

When free_high is true, the above diff changed the return value of
nr_pcp_high() from 0 to min(batch << 2, pcp->high) so the corner case is
when (min(batch << 2, pcp->high) > cachesize)?

> quickly enough. On the plus side always freeing to buddy may contend on t=
he
> zone lock again and freeing in batches reduces that risk.
> =

> Given that zone lock contention is reduced regardless of cache size, it
> seems like a reasonable tradeoff.

Glad to hear this.
--===============3655251376372384319==--

