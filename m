Content-Type: multipart/mixed; boundary="===============1055587636601980273=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v2 12/16] mm: multigenerational lru: eviction
Date: Tue, 13 Apr 2021 00:56:29 -0600
Message-ID: <20210413065633.2782273-13-yuzhao@google.com>
In-Reply-To: <20210413065633.2782273-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1055587636601980273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The eviction consumes old generations. Given an lruvec, the eviction
scans the pages on the per-zone lists indexed by either of min_seq[2].
It first tries to select a type based on the values of min_seq[2].
When anon and file types are both available from the same generation,
it selects the one that has a lower refault rate.

During a scan, the eviction sorts pages according to their generation
numbers, if the aging has found them referenced. It also moves pages
from the tiers that have higher refault rates than tier 0 to the next
generation. When it finds all the per-zone lists of a selected type
are empty, the eviction increments min_seq[2] indexed by this selected
type.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 mm/vmscan.c | 341 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 341 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 31e1b4155677..6239b1acd84f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5468,6 +5468,347 @@ static bool walk_mm_list(struct lruvec *lruvec, uns=
igned long max_seq,
 	return true;
 }
 =

+/*************************************************************************=
*****
+ *                          the eviction
+ *************************************************************************=
*****/
+
+static bool sort_page(struct page *page, struct lruvec *lruvec, int tier_t=
o_isolate)
+{
+	bool success;
+	int gen =3D page_lru_gen(page);
+	int file =3D page_is_file_lru(page);
+	int zone =3D page_zonenum(page);
+	int tier =3D lru_tier_from_usage(page_tier_usage(page));
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	VM_BUG_ON_PAGE(gen =3D=3D -1, page);
+	VM_BUG_ON_PAGE(tier_to_isolate < 0, page);
+
+	/* a lazy-free page that has been written into? */
+	if (file && PageDirty(page) && PageAnon(page)) {
+		success =3D lru_gen_deletion(page, lruvec);
+		VM_BUG_ON_PAGE(!success, page);
+		SetPageSwapBacked(page);
+		add_page_to_lru_list_tail(page, lruvec);
+		return true;
+	}
+
+	/* page_update_gen() has updated the page? */
+	if (gen !=3D lru_gen_from_seq(lrugen->min_seq[file])) {
+		list_move(&page->lru, &lrugen->lists[gen][file][zone]);
+		return true;
+	}
+
+	/* activate the page if its tier has a higher refault rate */
+	if (tier_to_isolate < tier) {
+		int sid =3D sid_from_seq_or_gen(gen);
+
+		page_inc_gen(page, lruvec, false);
+		WRITE_ONCE(lrugen->activated[sid][file][tier - 1],
+			   lrugen->activated[sid][file][tier - 1] + thp_nr_pages(page));
+		inc_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + file);
+		return true;
+	}
+
+	/*
+	 * A page can't be immediately evicted, and page_inc_gen() will mark it
+	 * for reclaim and hopefully writeback will write it soon if it's dirty.
+	 */
+	if (PageLocked(page) || PageWriteback(page) || (file && PageDirty(page)))=
 {
+		page_inc_gen(page, lruvec, true);
+		return true;
+	}
+
+	return false;
+}
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
+static int scan_lru_gen_pages(struct lruvec *lruvec, struct scan_control *=
sc,
+			      long *nr_to_scan, int file, int tier,
+			      struct list_head *list)
+{
+	bool success;
+	int gen, zone;
+	enum vm_event_item item;
+	int sorted =3D 0;
+	int scanned =3D 0;
+	int isolated =3D 0;
+	int batch_size =3D 0;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	VM_BUG_ON(!list_empty(list));
+
+	if (get_nr_gens(lruvec, file) =3D=3D MIN_NR_GENS)
+		return -ENOENT;
+
+	gen =3D lru_gen_from_seq(lrugen->min_seq[file]);
+
+	for (zone =3D sc->reclaim_idx; zone >=3D 0; zone--) {
+		LIST_HEAD(moved);
+		int skipped =3D 0;
+		struct list_head *head =3D &lrugen->lists[gen][file][zone];
+
+		while (!list_empty(head)) {
+			struct page *page =3D lru_to_page(head);
+			int delta =3D thp_nr_pages(page);
+
+			VM_BUG_ON_PAGE(PageTail(page), page);
+			VM_BUG_ON_PAGE(PageUnevictable(page), page);
+			VM_BUG_ON_PAGE(PageActive(page), page);
+			VM_BUG_ON_PAGE(page_is_file_lru(page) !=3D file, page);
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
+	success =3D try_inc_min_seq(lruvec, file);
+
+	item =3D current_is_kswapd() ? PGSCAN_KSWAPD : PGSCAN_DIRECT;
+	if (!cgroup_reclaim(sc))
+		__count_vm_events(item, scanned);
+	__count_memcg_events(lruvec_memcg(lruvec), item, scanned);
+	__count_vm_events(PGSCAN_ANON + file, scanned);
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
+static int get_tier_to_isolate(struct lruvec *lruvec, int file)
+{
+	int tier;
+	struct controller_pos sp, pv;
+
+	/*
+	 * Ideally we don't want to evict upper tiers that have higher refault
+	 * rates. However, we need to leave some margin for the fluctuation in
+	 * refault rates. So we use a larger gain factor to make sure upper
+	 * tiers are indeed more active. We choose 2 because the lowest upper
+	 * tier would have twice of the refault rate of the base tier, according
+	 * to their numbers of accesses.
+	 */
+	read_controller_pos(&sp, lruvec, file, 0, 1);
+	for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
+		read_controller_pos(&pv, lruvec, file, tier, 2);
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
+	int file, tier;
+	struct controller_pos sp, pv;
+	int gain[ANON_AND_FILE] =3D { swappiness, 200 - swappiness };
+
+	/*
+	 * Compare the refault rates between the base tiers of anon and file to
+	 * determine which type to evict. Also need to compare the refault rates
+	 * of the upper tiers of the selected type with that of the base tier to
+	 * determine which tier of the selected type to evict.
+	 */
+	read_controller_pos(&sp, lruvec, 0, 0, gain[0]);
+	read_controller_pos(&pv, lruvec, 1, 0, gain[1]);
+	file =3D positive_ctrl_err(&sp, &pv);
+
+	read_controller_pos(&sp, lruvec, !file, 0, gain[!file]);
+	for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
+		read_controller_pos(&pv, lruvec, file, tier, gain[file]);
+		if (!positive_ctrl_err(&sp, &pv))
+			break;
+	}
+
+	*tier_to_isolate =3D tier - 1;
+
+	return file;
+}
+
+static int isolate_lru_gen_pages(struct lruvec *lruvec, struct scan_contro=
l *sc,
+				 int swappiness, long *nr_to_scan, int *type_to_scan,
+				 struct list_head *list)
+{
+	int i;
+	int file;
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
+	file =3D !swappiness || min_seq[0] > min_seq[1] ||
+	       (min_seq[0] =3D=3D min_seq[1] && swappiness !=3D 200 &&
+		(swappiness =3D=3D 1 || get_type_to_scan(lruvec, swappiness, &tier)));
+
+	if (tier =3D=3D -1)
+		tier =3D get_tier_to_isolate(lruvec, file);
+
+	for (i =3D !swappiness; i < ANON_AND_FILE; i++) {
+		isolated =3D scan_lru_gen_pages(lruvec, sc, nr_to_scan, file, tier, list=
);
+		if (isolated >=3D 0)
+			break;
+
+		file =3D !file;
+		tier =3D get_tier_to_isolate(lruvec, file);
+	}
+
+	if (isolated < 0)
+		isolated =3D *nr_to_scan =3D 0;
+
+	*type_to_scan =3D file;
+
+	return isolated;
+}
+
+/* Main function used by foreground, background and user-triggered evictio=
n. */
+static bool evict_lru_gen_pages(struct lruvec *lruvec, struct scan_control=
 *sc,
+				int swappiness, long *nr_to_scan)
+{
+	int file;
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
+	isolated =3D isolate_lru_gen_pages(lruvec, sc, swappiness, nr_to_scan, &f=
ile, &list);
+	VM_BUG_ON(list_empty(&list) =3D=3D !!isolated);
+
+	if (isolated)
+		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, isolated);
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
+		if (PageReferenced(page)) {
+			SetPageActive(page);
+			ClearPageReferenced(page);
+		} else {
+			ClearPageActive(page);
+			SetPageWorkingset(page);
+		}
+	}
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	move_pages_to_lru(lruvec, &list);
+
+	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, -isolated);
+
+	item =3D current_is_kswapd() ? PGSTEAL_KSWAPD : PGSTEAL_DIRECT;
+	if (!cgroup_reclaim(sc))
+		__count_vm_events(item, reclaimed);
+	__count_memcg_events(lruvec_memcg(lruvec), item, reclaimed);
+	__count_vm_events(PGSTEAL_ANON + file, reclaimed);
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
 /*************************************************************************=
*****
  *                          state change
  *************************************************************************=
*****/
-- =

2.31.1.295.g9ea45b61b8-goog

--===============1055587636601980273==--

