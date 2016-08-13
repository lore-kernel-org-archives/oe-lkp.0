Content-Type: multipart/mixed; boundary="===============2698902654143963095=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 09:32:17 +1000
Message-ID: <20160813233217.GT19025@dastard>
In-Reply-To: <20160813003054.GA3101@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2698902654143963095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 13, 2016 at 02:30:54AM +0200, Christoph Hellwig wrote:
> On Fri, Aug 12, 2016 at 08:02:08PM +1000, Dave Chinner wrote:
> > Which says "no change". Oh well, back to the drawing board...
> =

> I don't see how it would change thing much - for all relevant calculations
> we convert to block units first anyway.

THere was definitely an off-by-one in the code, which meant for
1-byte writes it never triggered speculative prealloc, so it was
doing the past-EOF real block check for every write. With it also
passing less than a block size, when the > XFS_ISIZE check passed
3 out of every 4 want_preallocate checks were landing on an already
allocated block, too, so it was doing 3x as many lookups as needed.
for 1k writes on a 4k block size filesystem. Amongst other things...

> But the whole xfs_iomap_write_delay is a giant mess anyway.  For a usual
> call we do at least four lookups in the extent btree, which seems rather
> costly.  Especially given that the low-level xfs_bmap_search_extents
> interface would give us all required information in one single call.

I noticed, though I was looking for a smaller, targetted fix rather
than rewriting the whole thing. Don't get me wrong, I think it needs
a rewrite to be efficient for the iomap infrastructure, just didn't
want to do that as a regression fix if a 1-liner might be
sufficient...

> Below is a patch I hacked up this morning to do just that.  It passes
> xfstests, but I've not done any real benchmarking with it.  If the
> reduced lookup overhead in it doesn't help enough we'll need to some
> sort of look aside cache for the information, but I hope that we
> can avoid that.  And yes, it's a rather large patch - but the old
> path was so entangled that I couldn't come up with something lighter.

I'll run some tests on it. If it does so;ve the regression, I'm
going to hold it back until we get a decent amount of review and
test coverage on it, though...

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============2698902654143963095==--

