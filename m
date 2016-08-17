Content-Type: multipart/mixed; boundary="===============8112755871526383593=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 17 Aug 2016 16:49:07 +0100
Message-ID: <20160817154907.GI8119@techsingularity.net>
In-Reply-To: <CA+55aFxCSU=Hy7OqRxHoJDx1ruMD3H2qvmy4hdZ0Bjx94dwDug@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8112755871526383593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 10:47:36AM -0700, Linus Torvalds wrote:
> I've always preferred to see direct reclaim as the primary model for
> reclaim, partly in order to throttle the actual "bad" process, but
> also because "kswapd uses lots of CPU time" is such a nasty thing to
> even begin guessing about.
> =


While I agree that bugs with high CPU usage from kswapd are a pain,
I'm reluctant to move towards direct reclaim being the primary mode. The
stalls can be severe and there is no guarantee that the process punished
is the process responsible. I'm basing this assumption on observations
of severe performance regressions when I accidentally broke kswapd during
the development of node-lru.

> So I have to admit to liking that "make kswapd sleep a bit if it's
> just looping" logic that got removed in that commit.
> =


It's primarily the direct reclaimer that is affected by that patch.

> And looking at DaveC's numbers, it really feels like it's not even
> what we do inside the locked region that is the problem. Sure,
> __delete_from_page_cache() (which is most of it) is at 1.86% of CPU
> time (when including all the things it calls), but that still isn't
> all that much. Especially when compared to just:
> =

>    0.78%  [kernel]  [k] _raw_spin_unlock_irqrestore
> =


The profile is shocking for such a basic workload. I automated what Dave
described with xfs_io except that the file size is 2*RAM. The filesystem
is sized to be roughly the same size as the file to minimise variances
due to block layout. A call-graph profile collected on bare metal UMA with
numa=3Dfake=3D4 and paravirt spinlocks showed

     1.40%     0.16%  kswapd1          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     1.36%     0.16%  kswapd2          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     1.21%     0.12%  kswapd0          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     1.12%     0.13%  kswapd3          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.81%     0.45%  xfs_io           [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave

Those contention figures are not great but they are not terrible either. The
vmstats told me there was no direct reclaim activity so either my theory
is wrong or this machine is not reproducing the same problem Dave is seeing.

I have partial results from a 2-socket and 4-socket machine. 2-socket spends
roughtly 1.8% in _raw_spin_lock_irqsave and 4-socket spends roughtly 3%,
both with no direct reclaim. Clearly the problem gets worse the more NUMA
nodes there are but not to the same extent Dave reports.

I believe potential reasons why I do not see the same problem as Dave are;

1. Different memory sizes changing timing
2. Dave has fast storage and I'm using a spinning disk
3. Lock contention problems are magnified inside KVM

I think 3 is a good possibility if contended locks result in expensive
exiting and reentery of the guest. I have a vague recollection that a
spinning vcpu exits the guest but I did not confirm that. I can setup a
KVM instance and run the tests but it'll take a few hours and possibly
will be pushed out until tomorrow.

> So I'm more and more getting the feeling that it's not what we do
> inside the lock that is problematic. I started out blaming memcg
> accounting or something, but none of the numbers seem to back that up.
> So it's primarily really just the fact that kswapd is simply hammering
> on that lock way too much.
> =


Agreed.

> So yeah, I'm blaming kswapd itself doing something wrong. It's not a
> problem in a single-node environment (since there's only one), but
> with multiple nodes it clearly just devolves.
> =

> Yes, we could try to batch the locking like DaveC already suggested
> (ie we could move the locking to the caller, and then make
> shrink_page_list() just try to keep the lock held for a few pages if
> the mapping doesn't change), and that might result in fewer crazy
> cacheline ping-pongs overall. But that feels like exactly the wrong
> kind of workaround.
> =


Even if such batching was implemented, it would be very specific to the
case of a single large file filling LRUs on multiple nodes.

> I'd much rather re-instate some "if kswapd is just spinning on CPU
> time and not actually improving IO parallelism, kswapd should just get
> the hell out" logic.
> =


I'm having trouble right now thinking of a good way of identifying when
kswapd should give up and force direct reclaim to take a hit.

I'd like to pass something else by the wtf-o-meter. I had a prototype
patch lying around that replaced a congestion_wait if too many LRU pages
were isolated with a waitqueue for an unrelated theoretical problem. It's
the bulk of the patch below but can be trivially extended for the case of
tree_lock contention.

The interesting part is the change to __remove_mapping. It stalls a
reclaimer (direct or kswapd) if the lock is contended for either a
timeout or a local reclaimer finishing some reclaim. This stalls for a
"real" reason instead of blindly calling congestion_wait.  The downside
is that I do see xfs_io briefly enter direct reclaim when kswapd stalled
on contention but the overall impact to completion times was 0.01 seconds
in the UMA with fake NUMA nodes case.

This could be made specific to direct reclaimers but it makes a certain
amount of sense to stall kswapd instances contending with each other.
With the patch applied I see a drop in cycles spent in spin_lock_irqsave

Before
     1.40%     0.16%  kswapd1          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     1.36%     0.16%  kswapd2          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     1.21%     0.12%  kswapd0          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     1.12%     0.13%  kswapd3          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.81%     0.45%  xfs_io           [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.26%     0.23%  kworker/u20:1    [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.25%     0.19%  kworker/3:2      [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.23%     0.19%  rm               [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave

After
     0.57%     0.50%  xfs_io           [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.24%     0.20%  rm               [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.24%     0.21%  kthreadd         [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.21%     0.17%  kworker/6:1      [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.12%     0.09%  kworker/2:1      [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.11%     0.10%  kworker/u20:0    [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.10%     0.10%  swapper          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.09%     0.08%  kworker/7:2      [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
....
     0.01%     0.00%  kswapd0          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.01%     0.00%  kswapd1          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.01%     0.00%  kswapd3          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave
     0.01%     0.00%  kswapd2          [kernel.vmlinux]            [k] _raw=
_spin_lock_irqsave

kswapd time on locking is almost eliminated.

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index d572b78b65e1..72f92f67bd0c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -653,6 +653,7 @@ typedef struct pglist_data {
 	int node_id;
 	wait_queue_head_t kswapd_wait;
 	wait_queue_head_t pfmemalloc_wait;
+	wait_queue_head_t contention_wait;
 	struct task_struct *kswapd;	/* Protected by
 					   mem_hotplug_begin/end() */
 	int kswapd_order;
diff --git a/mm/compaction.c b/mm/compaction.c
index 9affb2908304..57351dddcd9a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1616,6 +1616,10 @@ static enum compact_result compact_zone(struct zone =
*zone, struct compact_contro
 			zone->compact_cached_free_pfn =3D free_pfn;
 	}
 =

+	/* Page reclaim could have stalled due to isolated pages */
+	if (waitqueue_active(&zone->zone_pgdat->contention_wait))
+		wake_up(&zone->zone_pgdat->contention_wait);
+
 	trace_mm_compaction_end(start_pfn, cc->migrate_pfn,
 				cc->free_pfn, end_pfn, sync, ret);
 =

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3fbe73a6fe4b..5af4eecdb4c9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5825,6 +5825,7 @@ static void __paginginit free_area_init_core(struct p=
glist_data *pgdat)
 #endif
 	init_waitqueue_head(&pgdat->kswapd_wait);
 	init_waitqueue_head(&pgdat->pfmemalloc_wait);
+	init_waitqueue_head(&pgdat->contention_wait);
 #ifdef CONFIG_COMPACTION
 	init_waitqueue_head(&pgdat->kcompactd_wait);
 #endif
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 374d95d04178..42c37bf88cb7 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -633,7 +633,25 @@ static int __remove_mapping(struct address_space *mapp=
ing, struct page *page,
 	BUG_ON(!PageLocked(page));
 	BUG_ON(mapping !=3D page_mapping(page));
 =

-	spin_lock_irqsave(&mapping->tree_lock, flags);
+	if (!reclaimed) {
+		spin_lock_irqsave(&mapping->tree_lock, flags);
+	} else {
+		/*
+		 * If a reclaimer encounters a contended tree_lock then briefly
+		 * stall and allow the parallel reclaim to make progress. The
+		 * full HZ/10 penalty is incurred if the lock holder is
+		 * reclaiming on a remote node.
+		 */
+		if (!spin_trylock_irqsave(&mapping->tree_lock, flags)) {
+			pg_data_t *pgdat =3D page_pgdat(page);
+
+			try_to_unmap_flush();
+			wait_event_interruptible_timeout(pgdat->contention_wait,
+				spin_is_locked(&mapping->tree_lock), HZ/10);
+			spin_lock_irqsave(&mapping->tree_lock, flags);
+		}
+	}
+
 	/*
 	 * The non racy check for a busy page.
 	 *
@@ -1554,16 +1572,16 @@ int isolate_lru_page(struct page *page)
  * the LRU list will go small and be scanned faster than necessary, leadin=
g to
  * unnecessary swapping, thrashing and OOM.
  */
-static int too_many_isolated(struct pglist_data *pgdat, int file,
+static bool safe_to_isolate(struct pglist_data *pgdat, int file,
 		struct scan_control *sc)
 {
 	unsigned long inactive, isolated;
 =

 	if (current_is_kswapd())
-		return 0;
+		return true;
 =

-	if (!sane_reclaim(sc))
-		return 0;
+	if (sane_reclaim(sc))
+		return true;
 =

 	if (file) {
 		inactive =3D node_page_state(pgdat, NR_INACTIVE_FILE);
@@ -1581,7 +1599,7 @@ static int too_many_isolated(struct pglist_data *pgda=
t, int file,
 	if ((sc->gfp_mask & (__GFP_IO | __GFP_FS)) =3D=3D (__GFP_IO | __GFP_FS))
 		inactive >>=3D 3;
 =

-	return isolated > inactive;
+	return isolated < inactive;
 }
 =

 static noinline_for_stack void
@@ -1701,12 +1719,15 @@ shrink_inactive_list(unsigned long nr_to_scan, stru=
ct lruvec *lruvec,
 	if (!inactive_reclaimable_pages(lruvec, sc, lru))
 		return 0;
 =

-	while (unlikely(too_many_isolated(pgdat, file, sc))) {
-		congestion_wait(BLK_RW_ASYNC, HZ/10);
+	while (!safe_to_isolate(pgdat, file, sc)) {
+		wait_event_interruptible_timeout(pgdat->contention_wait,
+			safe_to_isolate(pgdat, file, sc), HZ/10);
 =

 		/* We are about to die and free our memory. Return now. */
-		if (fatal_signal_pending(current))
-			return SWAP_CLUSTER_MAX;
+		if (fatal_signal_pending(current)) {
+			nr_reclaimed =3D SWAP_CLUSTER_MAX;
+			goto out;
+		}
 	}
 =

 	lru_add_drain();
@@ -1819,6 +1840,10 @@ shrink_inactive_list(unsigned long nr_to_scan, struc=
t lruvec *lruvec,
 	trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
 			nr_scanned, nr_reclaimed,
 			sc->priority, file);
+
+out:
+	if (waitqueue_active(&pgdat->contention_wait))
+		wake_up(&pgdat->contention_wait);
 	return nr_reclaimed;
 }
=20

--===============8112755871526383593==--

