Content-Type: multipart/mixed; boundary="===============1720515686571368924=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 19 Aug 2016 16:08:34 +0100
Message-ID: <20160819150834.GP8119@techsingularity.net>
In-Reply-To: <20160818071111.GD22388@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============1720515686571368924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 05:11:11PM +1000, Dave Chinner wrote:
> On Thu, Aug 18, 2016 at 01:45:17AM +0100, Mel Gorman wrote:
> > On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
> > > > Yes, we could try to batch the locking like DaveC already suggested
> > > > (ie we could move the locking to the caller, and then make
> > > > shrink_page_list() just try to keep the lock held for a few pages if
> > > > the mapping doesn't change), and that might result in fewer crazy
> > > > cacheline ping-pongs overall. But that feels like exactly the wrong
> > > > kind of workaround.
> > > > =

> > > =

> > > Even if such batching was implemented, it would be very specific to t=
he
> > > case of a single large file filling LRUs on multiple nodes.
> > > =

> > =

> > The latest Jason Bourne movie was sufficiently bad that I spent time
> > thinking how the tree_lock could be batched during reclaim. It's not
> > straight-forward but this prototype did not blow up on UMA and may be
> > worth considering if Dave can test either approach has a positive impac=
t.
> =

> SO, I just did a couple of tests. I'll call the two patches "sleepy"
> for the contention backoff patch and "bourney" for the Jason Bourne
> inspired batching patch. This is an average of 3 runs, overwriting
> a 47GB file on a machine with 16GB RAM:
> =

> 		IO throughput	wall time __pv_queued_spin_lock_slowpath
> vanilla		470MB/s		1m42s		25-30%
> sleepy		295MB/s		2m43s		<1%
> bourney		425MB/s		1m53s		25-30%
> =


This is another blunt-force patch that

a) stalls all but one kswapd instance when treelock contention occurs
b) marks a pgdat congested when tree_lock contention is encountered
   which may cause direct reclaimers to wait_iff_congested until
   kswapd finishes balancing the node

I tested this on a KVM instance running on a 4-socket box. The vCPUs
were bound to pCPUs and the memory nodes in the KVM mapped to physical
memory nodes. Without the patch 3% of kswapd cycles were spent on
locking. With the patch, the cycle count was 0.23%

xfs_io contention was reduced from 0.63% to 0.39% which is not perfect.
It can be reduced by stalling all kswapd instances but then xfs_io direct
reclaims and throughput drops.

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index d572b78b65e1..f6d3e886f405 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -532,6 +532,7 @@ enum pgdat_flags {
 					 * many pages under writeback
 					 */
 	PGDAT_RECLAIM_LOCKED,		/* prevents concurrent reclaim */
+	PGDAT_CONTENDED,		/* kswapd contending on tree_lock */
 };
 =

 static inline unsigned long zone_end_pfn(const struct zone *zone)
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 374d95d04178..64ca2148755c 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -621,19 +621,43 @@ static pageout_t pageout(struct page *page, struct ad=
dress_space *mapping,
 	return PAGE_CLEAN;
 }
 =

+static atomic_t kswapd_contended =3D ATOMIC_INIT(0);
+
 /*
  * Same as remove_mapping, but if the page is removed from the mapping, it
  * gets returned with a refcount of 0.
  */
 static int __remove_mapping(struct address_space *mapping, struct page *pa=
ge,
-			    bool reclaimed)
+			    bool reclaimed, unsigned long *nr_contended)
 {
 	unsigned long flags;
 =

 	BUG_ON(!PageLocked(page));
 	BUG_ON(mapping !=3D page_mapping(page));
 =

-	spin_lock_irqsave(&mapping->tree_lock, flags);
+	if (!nr_contended || !current_is_kswapd())
+		spin_lock_irqsave(&mapping->tree_lock, flags);
+	else {
+		/* Account for trylock contentions in kswapd */
+		if (!spin_trylock_irqsave(&mapping->tree_lock, flags)) {
+			pg_data_t *pgdat =3D page_pgdat(page);
+			int nr_kswapd;
+
+			/* Account for contended pages and contended kswapds */
+			(*nr_contended)++;
+			if (!test_and_set_bit(PGDAT_CONTENDED, &pgdat->flags))
+				nr_kswapd =3D atomic_inc_return(&kswapd_contended);
+			else
+				nr_kswapd =3D atomic_read(&kswapd_contended);
+			BUG_ON(nr_kswapd > nr_online_nodes || nr_kswapd < 0);
+
+			/* Stall kswapd if multiple kswapds are contending */
+			if (nr_kswapd > 1)
+				congestion_wait(BLK_RW_ASYNC, HZ/10);
+
+			spin_lock_irqsave(&mapping->tree_lock, flags);
+		}
+	}
 	/*
 	 * The non racy check for a busy page.
 	 *
@@ -719,7 +743,7 @@ static int __remove_mapping(struct address_space *mappi=
ng, struct page *page,
  */
 int remove_mapping(struct address_space *mapping, struct page *page)
 {
-	if (__remove_mapping(mapping, page, false)) {
+	if (__remove_mapping(mapping, page, false, NULL)) {
 		/*
 		 * Unfreezing the refcount with 1 rather than 2 effectively
 		 * drops the pagecache ref for us without requiring another
@@ -906,6 +930,7 @@ static unsigned long shrink_page_list(struct list_head =
*page_list,
 				      unsigned long *ret_nr_congested,
 				      unsigned long *ret_nr_writeback,
 				      unsigned long *ret_nr_immediate,
+				      unsigned long *ret_nr_contended,
 				      bool force_reclaim)
 {
 	LIST_HEAD(ret_pages);
@@ -917,6 +942,7 @@ static unsigned long shrink_page_list(struct list_head =
*page_list,
 	unsigned long nr_reclaimed =3D 0;
 	unsigned long nr_writeback =3D 0;
 	unsigned long nr_immediate =3D 0;
+	unsigned long nr_contended =3D 0;
 =

 	cond_resched();
 =

@@ -1206,7 +1232,7 @@ static unsigned long shrink_page_list(struct list_hea=
d *page_list,
 		}
 =

 lazyfree:
-		if (!mapping || !__remove_mapping(mapping, page, true))
+		if (!mapping || !__remove_mapping(mapping, page, true, &nr_contended))
 			goto keep_locked;
 =

 		/*
@@ -1263,6 +1289,7 @@ static unsigned long shrink_page_list(struct list_hea=
d *page_list,
 	*ret_nr_unqueued_dirty +=3D nr_unqueued_dirty;
 	*ret_nr_writeback +=3D nr_writeback;
 	*ret_nr_immediate +=3D nr_immediate;
+	*ret_nr_contended +=3D nr_contended;
 	return nr_reclaimed;
 }
 =

@@ -1274,7 +1301,7 @@ unsigned long reclaim_clean_pages_from_list(struct zo=
ne *zone,
 		.priority =3D DEF_PRIORITY,
 		.may_unmap =3D 1,
 	};
-	unsigned long ret, dummy1, dummy2, dummy3, dummy4, dummy5;
+	unsigned long ret, dummy1, dummy2, dummy3, dummy4, dummy5, dummy6;
 	struct page *page, *next;
 	LIST_HEAD(clean_pages);
 =

@@ -1288,7 +1315,7 @@ unsigned long reclaim_clean_pages_from_list(struct zo=
ne *zone,
 =

 	ret =3D shrink_page_list(&clean_pages, zone->zone_pgdat, &sc,
 			TTU_UNMAP|TTU_IGNORE_ACCESS,
-			&dummy1, &dummy2, &dummy3, &dummy4, &dummy5, true);
+			&dummy1, &dummy2, &dummy3, &dummy4, &dummy5, &dummy6, true);
 	list_splice(&clean_pages, page_list);
 	mod_node_page_state(zone->zone_pgdat, NR_ISOLATED_FILE, -ret);
 	return ret;
@@ -1693,6 +1720,7 @@ shrink_inactive_list(unsigned long nr_to_scan, struct=
 lruvec *lruvec,
 	unsigned long nr_unqueued_dirty =3D 0;
 	unsigned long nr_writeback =3D 0;
 	unsigned long nr_immediate =3D 0;
+	unsigned long nr_contended =3D 0;
 	isolate_mode_t isolate_mode =3D 0;
 	int file =3D is_file_lru(lru);
 	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
@@ -1738,7 +1766,7 @@ shrink_inactive_list(unsigned long nr_to_scan, struct=
 lruvec *lruvec,
 =

 	nr_reclaimed =3D shrink_page_list(&page_list, pgdat, sc, TTU_UNMAP,
 				&nr_dirty, &nr_unqueued_dirty, &nr_congested,
-				&nr_writeback, &nr_immediate,
+				&nr_writeback, &nr_immediate, &nr_contended,
 				false);
 =

 	spin_lock_irq(&pgdat->lru_lock);
@@ -1789,6 +1817,15 @@ shrink_inactive_list(unsigned long nr_to_scan, struc=
t lruvec *lruvec,
 			set_bit(PGDAT_CONGESTED, &pgdat->flags);
 =

 		/*
+		 * Tag a zone as congested if kswapd encounters contended pages
+		 * as it may indicate contention with a heavy writer or
+		 * other kswapd instances. The tag may stall direct reclaimers
+		 * in wait_iff_congested.
+		 */
+		if (nr_contended && current_is_kswapd())
+			set_bit(PGDAT_CONGESTED, &pgdat->flags);
+
+		/*
 		 * If dirty pages are scanned that are not queued for IO, it
 		 * implies that flushers are not keeping up. In this case, flag
 		 * the pgdat PGDAT_DIRTY and kswapd will start writing pages from
@@ -1805,6 +1842,7 @@ shrink_inactive_list(unsigned long nr_to_scan, struct=
 lruvec *lruvec,
 		 */
 		if (nr_immediate && current_may_throttle())
 			congestion_wait(BLK_RW_ASYNC, HZ/10);
+
 	}
 =

 	/*
@@ -3109,6 +3147,9 @@ static bool zone_balanced(struct zone *zone, int orde=
r, int classzone_idx)
 	clear_bit(PGDAT_CONGESTED, &zone->zone_pgdat->flags);
 	clear_bit(PGDAT_DIRTY, &zone->zone_pgdat->flags);
 =

+	if (test_and_clear_bit(PGDAT_CONTENDED, &zone->zone_pgdat->flags))
+		atomic_dec(&kswapd_contended);
+
 	return true;
 }
=20

--===============1720515686571368924==--

