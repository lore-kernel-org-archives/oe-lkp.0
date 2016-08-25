Content-Type: multipart/mixed; boundary="===============1222003085666023819=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 25 Aug 2016 10:37:28 +0100
Message-ID: <20160825093728.GT8119@techsingularity.net>
In-Reply-To: <87wpj6dvka.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1222003085666023819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2016 at 08:40:37AM -0700, Huang, Ying wrote:
> Mel Gorman <mgorman@techsingularity.net> writes:
> =

> > On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
> >> > Yes, we could try to batch the locking like DaveC already suggested
> >> > (ie we could move the locking to the caller, and then make
> >> > shrink_page_list() just try to keep the lock held for a few pages if
> >> > the mapping doesn't change), and that might result in fewer crazy
> >> > cacheline ping-pongs overall. But that feels like exactly the wrong
> >> > kind of workaround.
> >> > =

> >> =

> >> Even if such batching was implemented, it would be very specific to the
> >> case of a single large file filling LRUs on multiple nodes.
> >> =

> >
> > The latest Jason Bourne movie was sufficiently bad that I spent time
> > thinking how the tree_lock could be batched during reclaim. It's not
> > straight-forward but this prototype did not blow up on UMA and may be
> > worth considering if Dave can test either approach has a positive impac=
t.
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 374d95d04178..926110219cd9 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -621,19 +621,39 @@ static pageout_t pageout(struct page *page, struc=
t address_space *mapping,
> >  	return PAGE_CLEAN;
> >  }
> =

> We found this patch helps much for swap out performance, where there are
> usually only one mapping for all swap pages. =


Yeah, I expected it would be an unconditional win on swapping. I just
did not concentrate on it very much as it was not the problem at hand.

> In our 16 processes
> sequential swap write test case for a ramdisk on a Xeon E5 v3 machine,
> the swap out throughput improved 40.4%, from ~0.97GB/s to ~1.36GB/s.

Ok, so main benefit would be for ultra-fast storage. I doubt it's noticable
on slow disks.

> What's your plan for this patch?  If it can be merged soon, that will be
> great!
> =


Until this mail, no plan. I'm still waiting to hear if Dave's test case
has improved with the latest prototype for reducing contention.

> I found some issues in the original patch to work with swap cache.  Below
> is my fixes to make it work for swap cache.
> =


Thanks for the fix. I'm going offline today for a few days but I added a
todo item to finish this patch at some point. I won't be rushing it but
it'll get done eventually.

-- =

Mel Gorman
SUSE Labs

--===============1222003085666023819==--

