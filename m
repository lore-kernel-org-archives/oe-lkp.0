Content-Type: multipart/mixed; boundary="===============7143559480191150588=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v3 11/14] mm: multigenerational lru: eviction
Date: Thu, 20 May 2021 00:53:52 -0600
Message-ID: <20210520065355.2736558-12-yuzhao@google.com>
In-Reply-To: <20210520065355.2736558-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7143559480191150588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The eviction consumes old generations. Given an lruvec, the eviction
scans the pages on the per-zone lists indexed by either of min_seq[2].
It first tries to select a type based on the values of min_seq[2].
When anon and file types are both available from the same generation,
it selects the one that has a lower refault rate.

During a scan, the eviction sorts pages according to their new
generation numbers, if the aging has found them referenced. It also
moves pages from the tiers that have higher refault rates than tier 0
to the next generation. When it finds all the per-zone lists of a
selected type are empty, the eviction increments min_seq[2] indexed by
this selected type.

With the aging and the eviction in place, we can build page reclaim in
a straightforward manner:
  1) In order to reduce the latency, direct reclaim only invokes the
  aging when both min_seq[2] reaches max_seq-1; otherwise it invokes
  the eviction.
  2) In order to avoid the aging in the direct reclaim path, kswapd
  does the background aging. It invokes the aging when either of
  min_seq[2] reaches max_seq-1; otherwise it invokes the eviction.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 include/linux/mmzone.h |   5 +
 mm/vmscan.c            | 540 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 545 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 38de59fcbe54..ded72f44d7e7 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -863,6 +863,8 @@ struct deferred_split {
 };
 #endif
 =

+struct mm_walk_args;
+
 /*
  * On NUMA machines, each NUMA node would have a pg_data_t to describe
  * it's memory layout. On UMA machines there is a single pglist_data which
@@ -968,6 +970,9 @@ typedef struct pglist_data {
 =

 	unsigned long		flags;
 =

+#ifdef CONFIG_LRU_GEN
+	struct mm_walk_args	*mm_walk_args;
+#endif
 	ZONE_PADDING(_pad2_)
 =

 	/* Per-node vmstats */
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 837d5e6a821e..2f86dcc04c56 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1311,6 +1311,11 @@ static unsigned int shrink_page_list(struct list_hea=
d *page_list,
 		if (!sc->may_unmap && page_mapped(page))
 			goto keep_locked;
 =

+		/* in case the page was found accessed by lru_gen_scan_around() */
+		if (lru_gen_enabled() && !ignore_references &&
+		    page_mapped(page) && PageReferenced(page))
+			goto keep_locked;
+
 		may_enter_fs =3D (sc->gfp_mask & __GFP_FS) ||
 			(PageSwapCache(page) && (sc->gfp_mask & __GFP_IO));
 =

@@ -2431,6 +2436,9 @@ static void prepare_scan_count(pg_data_t *pgdat, stru=
ct scan_control *sc)
 	unsigned long file;
 	struct lruvec *target_lruvec;
 =

+	if (lru_gen_enabled())
+		return;
+
 	target_lruvec =3D mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
 =

 	/*
@@ -3970,6 +3978,489 @@ void lru_gen_scan_around(struct page_vma_mapped_wal=
k *pvmw)
 		set_page_dirty(pte_page(pte[i]));
 }
 =

+/*************************************************************************=
*****
+ *                          the eviction
+ *************************************************************************=
*****/
+
+static bool should_skip_page(struct page *page, struct scan_control *sc)
+{
+	if (!sc->may_unmap && page_mapped(page))
+		return true;
+
+	if (!(sc->may_writepage && (sc->gfp_mask & __GFP_IO)) &&
+	    (PageDirty(page) || (PageAnon(page) && !PageSwapCache(page))))
+		return true;
+
+	if (!get_page_unless_zero(page))
+		return true;
+
+	if (!TestClearPageLRU(page)) {
+		put_page(page);
+		return true;
+	}
+
+	return false;
+}
+
+static bool sort_page(struct page *page, struct lruvec *lruvec, int tier_t=
o_isolate)
+{
+	bool success;
+	int gen =3D page_lru_gen(page);
+	int type =3D page_is_file_lru(page);
+	int zone =3D page_zonenum(page);
+	int tier =3D lru_tier_from_usage(page_tier_usage(page));
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	VM_BUG_ON_PAGE(gen =3D=3D -1, page);
+	VM_BUG_ON_PAGE(tier_to_isolate < 0, page);
+
+	/* a lazy-free page that has been written into? */
+	if (type && PageDirty(page) && PageAnon(page)) {
+		success =3D lru_gen_deletion(page, lruvec);
+		VM_BUG_ON_PAGE(!success, page);
+		SetPageSwapBacked(page);
+		add_page_to_lru_list_tail(page, lruvec);
+		return true;
+	}
+
+	/* page_update_gen() has updated the gen #? */
+	if (gen !=3D lru_gen_from_seq(lrugen->min_seq[type])) {
+		list_move(&page->lru, &lrugen->lists[gen][type][zone]);
+		return true;
+	}
+
+	/* activate this page if its tier has a higher refault rate */
+	if (tier_to_isolate < tier) {
+		int hist =3D hist_from_seq_or_gen(gen);
+
+		page_inc_gen(page, lruvec, false);
+		WRITE_ONCE(lrugen->activated[hist][type][tier - 1],
+			   lrugen->activated[hist][type][tier - 1] + thp_nr_pages(page));
+		inc_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + type);
+		return true;
+	}
+
+	/* mark this page for reclaim if it's pending writeback */
+	if (PageWriteback(page) || (type && PageDirty(page))) {
+		page_inc_gen(page, lruvec, true);
+		return true;
+	}
+
+	return false;
+}
+
+static void isolate_page(struct page *page, struct lruvec *lruvec)
+{
+	bool success;
+
+	success =3D lru_gen_deletion(page, lruvec);
+	VM_BUG_ON_PAGE(!success, page);
+
+	if (PageActive(page)) {
+		ClearPageActive(page);
+		/* make sure shrink_page_list() rejects this page */
+		SetPageReferenced(page);
+		return;
+	}
+
+	/* make sure shrink_page_list() doesn't try to write this page */
+	ClearPageReclaim(page);
+	/* make sure shrink_page_list() doesn't reject this page */
+	ClearPageReferenced(page);
+}
+
+static int scan_pages(struct lruvec *lruvec, struct scan_control *sc, long=
 *nr_to_scan,
+		      int type, int tier, struct list_head *list)
+{
+	bool success;
+	int gen, zone;
+	enum vm_event_item item;
+	int sorted =3D 0;
+	int scanned =3D 0;
+	int isolated =3D 0;
+	int batch_size =3D 0;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+
+	VM_BUG_ON(!list_empty(list));
+
+	if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
+		return -ENOENT;
+
+	gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
+
+	for (zone =3D sc->reclaim_idx; zone >=3D 0; zone--) {
+		LIST_HEAD(moved);
+		int skipped =3D 0;
+		struct list_head *head =3D &lrugen->lists[gen][type][zone];
+
+		while (!list_empty(head)) {
+			struct page *page =3D lru_to_page(head);
+			int delta =3D thp_nr_pages(page);
+
+			VM_BUG_ON_PAGE(PageTail(page), page);
+			VM_BUG_ON_PAGE(PageUnevictable(page), page);
+			VM_BUG_ON_PAGE(PageActive(page), page);
+			VM_BUG_ON_PAGE(page_is_file_lru(page) !=3D type, page);
+			VM_BUG_ON_PAGE(page_zonenum(page) !=3D zone, page);
+
+			prefetchw_prev_lru_page(page, head, flags);
+
+			scanned +=3D delta;
+
+			if (sort_page(page, lruvec, tier))
+				sorted +=3D delta;
+			else if (should_skip_page(page, sc)) {
+				list_move(&page->lru, &moved);
+				skipped +=3D delta;
+			} else {
+				isolate_page(page, lruvec);
+				list_add(&page->lru, list);
+				isolated +=3D delta;
+			}
+
+			if (scanned >=3D *nr_to_scan || isolated >=3D SWAP_CLUSTER_MAX ||
+			    ++batch_size =3D=3D MAX_BATCH_SIZE)
+				break;
+		}
+
+		list_splice(&moved, head);
+		__count_zid_vm_events(PGSCAN_SKIP, zone, skipped);
+
+		if (scanned >=3D *nr_to_scan || isolated >=3D SWAP_CLUSTER_MAX ||
+		    batch_size =3D=3D MAX_BATCH_SIZE)
+			break;
+	}
+
+	success =3D try_inc_min_seq(lruvec, type);
+
+	item =3D current_is_kswapd() ? PGSCAN_KSWAPD : PGSCAN_DIRECT;
+	if (!cgroup_reclaim(sc)) {
+		__count_vm_events(item, scanned);
+		__count_vm_events(PGREFILL, sorted);
+	}
+	__count_memcg_events(memcg, item, scanned);
+	__count_memcg_events(memcg, PGREFILL, sorted);
+	__count_vm_events(PGSCAN_ANON + type, scanned);
+
+	*nr_to_scan -=3D scanned;
+
+	if (*nr_to_scan <=3D 0 || success || isolated)
+		return isolated;
+	/*
+	 * We may have trouble finding eligible pages due to reclaim_idx,
+	 * may_unmap and may_writepage. The following check makes sure we won't
+	 * be stuck if we aren't making enough progress.
+	 */
+	return batch_size =3D=3D MAX_BATCH_SIZE && sorted >=3D SWAP_CLUSTER_MAX ?=
 0 : -ENOENT;
+}
+
+static int get_tier_to_isolate(struct lruvec *lruvec, int type)
+{
+	int tier;
+	struct controller_pos sp, pv;
+
+	/*
+	 * Ideally we don't want to evict upper tiers that have higher refault
+	 * rates. However, we need to leave a margin for the fluctuations in
+	 * refault rates. So we use a larger gain factor to make sure upper
+	 * tiers are indeed more active. We choose 2 because the lowest upper
+	 * tier would have twice of the refault rate of the base tier, according
+	 * to their numbers of accesses.
+	 */
+	read_controller_pos(&sp, lruvec, type, 0, 1);
+	for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
+		read_controller_pos(&pv, lruvec, type, tier, 2);
+		if (!positive_ctrl_err(&sp, &pv))
+			break;
+	}
+
+	return tier - 1;
+}
+
+static int get_type_to_scan(struct lruvec *lruvec, int swappiness, int *ti=
er_to_isolate)
+{
+	int type, tier;
+	struct controller_pos sp, pv;
+	int gain[ANON_AND_FILE] =3D { swappiness, 200 - swappiness };
+
+	/*
+	 * Compare the refault rates between the base tiers of anon and file to
+	 * determine which type to evict. Also need to compare the refault rates
+	 * of the upper tiers of the selected type with that of the base tier of
+	 * the other type to determine which tier of the selected type to evict.
+	 */
+	read_controller_pos(&sp, lruvec, 0, 0, gain[0]);
+	read_controller_pos(&pv, lruvec, 1, 0, gain[1]);
+	type =3D positive_ctrl_err(&sp, &pv);
+
+	read_controller_pos(&sp, lruvec, !type, 0, gain[!type]);
+	for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
+		read_controller_pos(&pv, lruvec, type, tier, gain[type]);
+		if (!positive_ctrl_err(&sp, &pv))
+			break;
+	}
+
+	*tier_to_isolate =3D tier - 1;
+
+	return type;
+}
+
+static int isolate_pages(struct lruvec *lruvec, struct scan_control *sc, i=
nt swappiness,
+			 long *nr_to_scan, int *type_to_scan, struct list_head *list)
+{
+	int i;
+	int type;
+	int isolated;
+	int tier =3D -1;
+	DEFINE_MAX_SEQ();
+	DEFINE_MIN_SEQ();
+
+	VM_BUG_ON(!seq_is_valid(lruvec));
+
+	if (max_nr_gens(max_seq, min_seq, swappiness) =3D=3D MIN_NR_GENS)
+		return 0;
+	/*
+	 * Try to select a type based on generations and swappiness, and if that
+	 * fails, fall back to get_type_to_scan(). When anon and file are both
+	 * available from the same generation, swappiness 200 is interpreted as
+	 * anon first and swappiness 1 is interpreted as file first.
+	 */
+	type =3D !swappiness || min_seq[0] > min_seq[1] ||
+	       (min_seq[0] =3D=3D min_seq[1] && swappiness !=3D 200 &&
+		(swappiness =3D=3D 1 || get_type_to_scan(lruvec, swappiness, &tier)));
+
+	if (tier =3D=3D -1)
+		tier =3D get_tier_to_isolate(lruvec, type);
+
+	for (i =3D !swappiness; i < ANON_AND_FILE; i++) {
+		isolated =3D scan_pages(lruvec, sc, nr_to_scan, type, tier, list);
+		if (isolated >=3D 0)
+			break;
+
+		type =3D !type;
+		tier =3D get_tier_to_isolate(lruvec, type);
+	}
+
+	if (isolated < 0)
+		isolated =3D *nr_to_scan =3D 0;
+
+	*type_to_scan =3D type;
+
+	return isolated;
+}
+
+/* Main function used by the foreground, the background and the user-trigg=
ered eviction. */
+static bool evict_pages(struct lruvec *lruvec, struct scan_control *sc, in=
t swappiness,
+			long *nr_to_scan)
+{
+	int type;
+	int isolated;
+	int reclaimed;
+	LIST_HEAD(list);
+	struct page *page;
+	enum vm_event_item item;
+	struct reclaim_stat stat;
+	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	isolated =3D isolate_pages(lruvec, sc, swappiness, nr_to_scan, &type, &li=
st);
+	VM_BUG_ON(list_empty(&list) =3D=3D !!isolated);
+
+	if (isolated)
+		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + type, isolated);
+
+	spin_unlock_irq(&lruvec->lru_lock);
+
+	if (!isolated)
+		goto done;
+
+	reclaimed =3D shrink_page_list(&list, pgdat, sc, &stat, false);
+	/*
+	 * We need to prevent rejected pages from being added back to the same
+	 * lists they were isolated from. Otherwise we may risk looping on them
+	 * forever. We use PageActive() or !PageReferenced() && PageWorkingset()
+	 * to tell lru_gen_addition() not to add them to the oldest generation.
+	 */
+	list_for_each_entry(page, &list, lru) {
+		if (PageMlocked(page))
+			continue;
+
+		if (page_mapped(page) && PageReferenced(page))
+			SetPageActive(page);
+		else {
+			ClearPageActive(page);
+			SetPageWorkingset(page);
+		}
+		ClearPageReferenced(page);
+	}
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	move_pages_to_lru(lruvec, &list);
+
+	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + type, -isolated);
+
+	item =3D current_is_kswapd() ? PGSTEAL_KSWAPD : PGSTEAL_DIRECT;
+	if (!cgroup_reclaim(sc))
+		__count_vm_events(item, reclaimed);
+	__count_memcg_events(lruvec_memcg(lruvec), item, reclaimed);
+	__count_vm_events(PGSTEAL_ANON + type, reclaimed);
+
+	spin_unlock_irq(&lruvec->lru_lock);
+
+	mem_cgroup_uncharge_list(&list);
+	free_unref_page_list(&list);
+
+	sc->nr_reclaimed +=3D reclaimed;
+done:
+	return *nr_to_scan > 0 && sc->nr_reclaimed < sc->nr_to_reclaim;
+}
+
+/*************************************************************************=
*****
+ *                          page reclaim
+ *************************************************************************=
*****/
+
+static int get_swappiness(struct lruvec *lruvec)
+{
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	int swappiness =3D mem_cgroup_get_nr_swap_pages(memcg) >=3D (long)SWAP_CL=
USTER_MAX ?
+			 mem_cgroup_swappiness(memcg) : 0;
+
+	VM_BUG_ON(swappiness > 200U);
+
+	return swappiness;
+}
+
+static unsigned long get_nr_to_scan(struct lruvec *lruvec, struct scan_con=
trol *sc,
+				    int swappiness)
+{
+	int gen, type, zone;
+	long nr_to_scan =3D 0;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+	DEFINE_MAX_SEQ();
+	DEFINE_MIN_SEQ();
+
+	lru_add_drain();
+
+	for (type =3D !swappiness; type < ANON_AND_FILE; type++) {
+		unsigned long seq;
+
+		for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
+			gen =3D lru_gen_from_seq(seq);
+
+			for (zone =3D 0; zone <=3D sc->reclaim_idx; zone++)
+				nr_to_scan +=3D READ_ONCE(lrugen->sizes[gen][type][zone]);
+		}
+	}
+
+	nr_to_scan =3D max(nr_to_scan, 0L);
+	nr_to_scan =3D round_up(nr_to_scan >> sc->priority, SWAP_CLUSTER_MAX);
+
+	if (max_nr_gens(max_seq, min_seq, swappiness) > MIN_NR_GENS)
+		return nr_to_scan;
+
+	/* kswapd uses lru_gen_age_node() */
+	if (current_is_kswapd())
+		return 0;
+
+	return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan :=
 0;
+}
+
+static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_contr=
ol *sc)
+{
+	struct blk_plug plug;
+	unsigned long scanned =3D 0;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+
+	blk_start_plug(&plug);
+
+	while (true) {
+		long nr_to_scan;
+		int swappiness =3D sc->may_swap ? get_swappiness(lruvec) : 0;
+
+		nr_to_scan =3D get_nr_to_scan(lruvec, sc, swappiness) - scanned;
+		if (nr_to_scan < (long)SWAP_CLUSTER_MAX)
+			break;
+
+		scanned +=3D nr_to_scan;
+
+		if (!evict_pages(lruvec, sc, swappiness, &nr_to_scan))
+			break;
+
+		scanned -=3D nr_to_scan;
+
+		if (mem_cgroup_below_min(memcg) ||
+		    (mem_cgroup_below_low(memcg) && !sc->memcg_low_reclaim))
+			break;
+
+		cond_resched();
+	}
+
+	blk_finish_plug(&plug);
+}
+
+/*************************************************************************=
*****
+ *                          the background aging
+ *************************************************************************=
*****/
+
+static int lru_gen_spread =3D MIN_NR_GENS;
+
+static void try_walk_mm_list(struct lruvec *lruvec, struct scan_control *s=
c)
+{
+	int gen, type, zone;
+	long old_and_young[2] =3D {};
+	int spread =3D READ_ONCE(lru_gen_spread);
+	int swappiness =3D get_swappiness(lruvec);
+	struct lrugen *lrugen =3D &lruvec->evictable;
+	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
+	DEFINE_MAX_SEQ();
+	DEFINE_MIN_SEQ();
+
+	lru_add_drain();
+
+	for (type =3D !swappiness; type < ANON_AND_FILE; type++) {
+		unsigned long seq;
+
+		for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
+			gen =3D lru_gen_from_seq(seq);
+
+			for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
+				old_and_young[seq =3D=3D max_seq] +=3D
+					READ_ONCE(lrugen->sizes[gen][type][zone]);
+		}
+	}
+
+	old_and_young[0] =3D max(old_and_young[0], 0L);
+	old_and_young[1] =3D max(old_and_young[1], 0L);
+
+	/* try to spread pages out across spread+1 generations */
+	if (old_and_young[0] >=3D old_and_young[1] * spread &&
+	    min_nr_gens(max_seq, min_seq, swappiness) > max(spread, MIN_NR_GENS))
+		return;
+
+	walk_mm_list(lruvec, max_seq, sc, swappiness, pgdat->mm_walk_args);
+}
+
+static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_contro=
l *sc)
+{
+	struct mem_cgroup *memcg;
+
+	VM_BUG_ON(!current_is_kswapd());
+
+	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
+	do {
+		struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+
+		if (!mem_cgroup_below_min(memcg) &&
+		    (!mem_cgroup_below_low(memcg) || sc->memcg_low_reclaim))
+			try_walk_mm_list(lruvec, sc);
+
+		cond_resched();
+	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+}
+
 /*************************************************************************=
*****
  *                          state change
  *************************************************************************=
*****/
@@ -4172,6 +4663,21 @@ static int __meminit __maybe_unused lru_gen_online_m=
em(struct notifier_block *se
 	return NOTIFY_DONE;
 }
 =

+static void lru_gen_start_kswapd(int nid)
+{
+	struct pglist_data *pgdat =3D NODE_DATA(nid);
+
+	pgdat->mm_walk_args =3D kvzalloc_node(size_of_mm_walk_args(), GFP_KERNEL,=
 nid);
+	WARN_ON_ONCE(!pgdat->mm_walk_args);
+}
+
+static void lru_gen_stop_kswapd(int nid)
+{
+	struct pglist_data *pgdat =3D NODE_DATA(nid);
+
+	kvfree(pgdat->mm_walk_args);
+}
+
 /*************************************************************************=
*****
  *                          initialization
  *************************************************************************=
*****/
@@ -4220,6 +4726,24 @@ static int __init init_lru_gen(void)
  */
 arch_initcall(init_lru_gen);
 =

+#else /* CONFIG_LRU_GEN */
+
+static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_contr=
ol *sc)
+{
+}
+
+static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_contro=
l *sc)
+{
+}
+
+static void lru_gen_start_kswapd(int nid)
+{
+}
+
+static void lru_gen_stop_kswapd(int nid)
+{
+}
+
 #endif /* CONFIG_LRU_GEN */
 =

 static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
@@ -4233,6 +4757,11 @@ static void shrink_lruvec(struct lruvec *lruvec, str=
uct scan_control *sc)
 	struct blk_plug plug;
 	bool scan_adjusted;
 =

+	if (lru_gen_enabled()) {
+		lru_gen_shrink_lruvec(lruvec, sc);
+		return;
+	}
+
 	get_scan_count(lruvec, sc, nr);
 =

 	/* Record the original scan target for proportional adjustments later */
@@ -4699,6 +5228,9 @@ static void snapshot_refaults(struct mem_cgroup *targ=
et_memcg, pg_data_t *pgdat)
 	struct lruvec *target_lruvec;
 	unsigned long refaults;
 =

+	if (lru_gen_enabled())
+		return;
+
 	target_lruvec =3D mem_cgroup_lruvec(target_memcg, pgdat);
 	refaults =3D lruvec_page_state(target_lruvec, WORKINGSET_ACTIVATE_ANON);
 	target_lruvec->refaults[0] =3D refaults;
@@ -5073,6 +5605,11 @@ static void age_active_anon(struct pglist_data *pgda=
t,
 	struct mem_cgroup *memcg;
 	struct lruvec *lruvec;
 =

+	if (lru_gen_enabled()) {
+		lru_gen_age_node(pgdat, sc);
+		return;
+	}
+
 	if (!total_swap_pages)
 		return;
 =

@@ -5753,6 +6290,8 @@ int kswapd_run(int nid)
 	if (pgdat->kswapd)
 		return 0;
 =

+	lru_gen_start_kswapd(nid);
+
 	pgdat->kswapd =3D kthread_run(kswapd, pgdat, "kswapd%d", nid);
 	if (IS_ERR(pgdat->kswapd)) {
 		/* failure at boot is fatal */
@@ -5775,6 +6314,7 @@ void kswapd_stop(int nid)
 	if (kswapd) {
 		kthread_stop(kswapd);
 		NODE_DATA(nid)->kswapd =3D NULL;
+		lru_gen_stop_kswapd(nid);
 	}
 }
 =

-- =

2.31.1.751.gd2f1c929bd-goog

--===============7143559480191150588==--

