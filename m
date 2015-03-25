Content-Type: multipart/mixed; boundary="===============7660410701031257975=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Wed, 25 Mar 2015 10:54:48 +0000
Message-ID: <20150325105448.GH4701@suse.de>
In-Reply-To: <1427100381.17170.2.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7660410701031257975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2015 at 04:46:21PM +0800, Huang Ying wrote:
> > My attention is occupied by the automatic NUMA regression at the moment
> > but I haven't forgotten this. Even with the high client count, I was not
> > able to reproduce this so it appears to depend on the number of CPUs
> > available to stress the allocator enough to bypass the per-cpu allocator
> > enough to contend heavily on the zone lock. I'm hoping to think of a
> > better alternative than adding more padding and increasing the cache
> > footprint of the allocator but so far I haven't thought of a good
> > alternative. Moving the lock to the end of the freelists would probably
> > address the problem but still increases the footprint for order-0
> > allocations by a cache line.
> =

> Any update on this?  Do you have some better idea?  I guess this may be
> fixed via putting some fields that are only read during order-0
> allocation with the same cache line of lock, if there are any.
> =


Sorry for the delay, the automatic NUMA regression took a long time to
close and it potentially affected anybody with a NUMA machine, not just
stress tests on large machines.

Moving it beside other fields shifts the problems. The lock is related
to the free areas so it really belongs nearby and from my own testing,
it does not affect mid-sized machines. I'd rather not put the lock in its
own cache line unless we have to. Can you try the following untested patch
instead? It is untested but builds and should be safe.

It'll increase the footprint of the page allocator but so would padding.
It means it will contend with high-order free page breakups but that
is not likely to happen during stress tests. It also collides with flags
but they are relatively rarely updated.


diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index f279d9c158cd..2782df47101e 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -474,16 +474,15 @@ struct zone {
 	unsigned long		wait_table_bits;
 =

 	ZONE_PADDING(_pad1_)
-
-	/* Write-intensive fields used from the page allocator */
-	spinlock_t		lock;
-
 	/* free areas of different sizes */
 	struct free_area	free_area[MAX_ORDER];
 =

 	/* zone flags, see below */
 	unsigned long		flags;
 =

+	/* Write-intensive fields used from the page allocator */
+	spinlock_t		lock;
+
 	ZONE_PADDING(_pad2_)
 =

 	/* Write-intensive fields used by page reclaim */

--===============7660410701031257975==--

