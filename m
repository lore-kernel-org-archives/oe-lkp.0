Content-Type: multipart/mixed; boundary="===============3643457284794956600=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: efad4e475c [ 40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
Date: Mon, 18 Feb 2019 11:05:19 -0800
Message-ID: <20190218190519.GV12668@bombadil.infradead.org>
In-Reply-To: <20190218181155.GC4525@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3643457284794956600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 07:11:55PM +0100, Michal Hocko wrote:
> On Mon 18-02-19 09:57:26, Matthew Wilcox wrote:
> > On Mon, Feb 18, 2019 at 06:05:58PM +0100, Michal Hocko wrote:
> > > +	end_pfn =3D min(start_pfn + nr_pages,
> > > +			zone_end_pfn(page_zone(pfn_to_page(start_pfn))));
> > >  =

> > >  	/* Check the starting page of each pageblock within the range */
> > > -	for (; page < end_page; page =3D next_active_pageblock(page)) {
> > > -		if (!is_pageblock_removable_nolock(page))
> > > +	for (; start_pfn < end_pfn; start_pfn =3D next_active_pageblock(sta=
rt_pfn)) {
> > > +		if (!is_pageblock_removable_nolock(start_pfn))
> > =

> > If you have a zone which contains pfns that run from ULONG_MAX-n to ULO=
NG_MAX,
> > end_pfn is going to wrap around to 0 and this loop won't execute.
> =

> Is this a realistic situation to bother?

How insane do you think hardware manufacturers are ... ?  I don't know
of one today, but I wouldn't bet on something like that never existing.

> > I think
> > you should use:
> > =

> > 	max_pfn =3D min(start_pfn + nr_pages,
> > 			zone_end_pfn(page_zone(pfn_to_page(start_pfn)))) - 1;
> > =

> > 	for (; start_pfn <=3D max_pfn; ...)
> =

> I do not really care strongly, but we have more places were we do
> start_pfn + nr_pages and then use it as pfn < end_pfn construct. I
> suspect we would need to make a larger audit and make the code
> consistent so unless there are major concerns I would stick with what
> I have for now and leave the rest for the cleanup. Does that sound
> reasonable?

Yes, I think so.  There are a number of other places where we can wrap
around from ULONG_MAX to 0 fairly easily (eg page offsets in a file on
32-bit machines).  I started thinking about this with the XArray and
rapidly convinced myself we have a problem throughout Linux.

--===============3643457284794956600==--

