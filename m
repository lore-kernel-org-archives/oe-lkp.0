Content-Type: multipart/mixed; boundary="===============5291282458423189695=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v3 05/14] mm/vmscan.c: refactor shrink_node()
Date: Thu, 20 May 2021 00:53:46 -0600
Message-ID: <20210520065355.2736558-6-yuzhao@google.com>
In-Reply-To: <20210520065355.2736558-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5291282458423189695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Heuristics that determine scan balance between anon and file LRUs are
rather independent. Move them into a separate function to improve
readability.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 mm/vmscan.c | 186 +++++++++++++++++++++++++++-------------------------
 1 file changed, 98 insertions(+), 88 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5199b9696bab..2339459c97d4 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2421,6 +2421,103 @@ enum scan_balance {
 	SCAN_FILE,
 };
 =

+static void prepare_scan_count(pg_data_t *pgdat, struct scan_control *sc)
+{
+	unsigned long file;
+	struct lruvec *target_lruvec;
+
+	target_lruvec =3D mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
+
+	/*
+	 * Determine the scan balance between anon and file LRUs.
+	 */
+	spin_lock_irq(&target_lruvec->lru_lock);
+	sc->anon_cost =3D target_lruvec->anon_cost;
+	sc->file_cost =3D target_lruvec->file_cost;
+	spin_unlock_irq(&target_lruvec->lru_lock);
+
+	/*
+	 * Target desirable inactive:active list ratios for the anon
+	 * and file LRU lists.
+	 */
+	if (!sc->force_deactivate) {
+		unsigned long refaults;
+
+		refaults =3D lruvec_page_state(target_lruvec,
+				WORKINGSET_ACTIVATE_ANON);
+		if (refaults !=3D target_lruvec->refaults[0] ||
+			inactive_is_low(target_lruvec, LRU_INACTIVE_ANON))
+			sc->may_deactivate |=3D DEACTIVATE_ANON;
+		else
+			sc->may_deactivate &=3D ~DEACTIVATE_ANON;
+
+		/*
+		 * When refaults are being observed, it means a new
+		 * workingset is being established. Deactivate to get
+		 * rid of any stale active pages quickly.
+		 */
+		refaults =3D lruvec_page_state(target_lruvec,
+				WORKINGSET_ACTIVATE_FILE);
+		if (refaults !=3D target_lruvec->refaults[1] ||
+		    inactive_is_low(target_lruvec, LRU_INACTIVE_FILE))
+			sc->may_deactivate |=3D DEACTIVATE_FILE;
+		else
+			sc->may_deactivate &=3D ~DEACTIVATE_FILE;
+	} else
+		sc->may_deactivate =3D DEACTIVATE_ANON | DEACTIVATE_FILE;
+
+	/*
+	 * If we have plenty of inactive file pages that aren't
+	 * thrashing, try to reclaim those first before touching
+	 * anonymous pages.
+	 */
+	file =3D lruvec_page_state(target_lruvec, NR_INACTIVE_FILE);
+	if (file >> sc->priority && !(sc->may_deactivate & DEACTIVATE_FILE))
+		sc->cache_trim_mode =3D 1;
+	else
+		sc->cache_trim_mode =3D 0;
+
+	/*
+	 * Prevent the reclaimer from falling into the cache trap: as
+	 * cache pages start out inactive, every cache fault will tip
+	 * the scan balance towards the file LRU.  And as the file LRU
+	 * shrinks, so does the window for rotation from references.
+	 * This means we have a runaway feedback loop where a tiny
+	 * thrashing file LRU becomes infinitely more attractive than
+	 * anon pages.  Try to detect this based on file LRU size.
+	 */
+	if (!cgroup_reclaim(sc)) {
+		unsigned long total_high_wmark =3D 0;
+		unsigned long free, anon;
+		int z;
+
+		free =3D sum_zone_node_page_state(pgdat->node_id, NR_FREE_PAGES);
+		file =3D node_page_state(pgdat, NR_ACTIVE_FILE) +
+			   node_page_state(pgdat, NR_INACTIVE_FILE);
+
+		for (z =3D 0; z < MAX_NR_ZONES; z++) {
+			struct zone *zone =3D &pgdat->node_zones[z];
+
+			if (!managed_zone(zone))
+				continue;
+
+			total_high_wmark +=3D high_wmark_pages(zone);
+		}
+
+		/*
+		 * Consider anon: if that's low too, this isn't a
+		 * runaway file reclaim problem, but rather just
+		 * extreme pressure. Reclaim as per usual then.
+		 */
+		anon =3D node_page_state(pgdat, NR_INACTIVE_ANON);
+
+		sc->file_is_tiny =3D
+			file + free <=3D total_high_wmark &&
+			!(sc->may_deactivate & DEACTIVATE_ANON) &&
+			anon >> sc->priority;
+	}
+}
+
 /*
  * Determine how aggressively the anon and file LRU lists should be
  * scanned.  The relative value of each set of LRU lists is determined
@@ -2866,7 +2963,6 @@ static void shrink_node(pg_data_t *pgdat, struct scan=
_control *sc)
 	unsigned long nr_reclaimed, nr_scanned;
 	struct lruvec *target_lruvec;
 	bool reclaimable =3D false;
-	unsigned long file;
 =

 	target_lruvec =3D mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
 =

@@ -2876,93 +2972,7 @@ static void shrink_node(pg_data_t *pgdat, struct sca=
n_control *sc)
 	nr_reclaimed =3D sc->nr_reclaimed;
 	nr_scanned =3D sc->nr_scanned;
 =

-	/*
-	 * Determine the scan balance between anon and file LRUs.
-	 */
-	spin_lock_irq(&target_lruvec->lru_lock);
-	sc->anon_cost =3D target_lruvec->anon_cost;
-	sc->file_cost =3D target_lruvec->file_cost;
-	spin_unlock_irq(&target_lruvec->lru_lock);
-
-	/*
-	 * Target desirable inactive:active list ratios for the anon
-	 * and file LRU lists.
-	 */
-	if (!sc->force_deactivate) {
-		unsigned long refaults;
-
-		refaults =3D lruvec_page_state(target_lruvec,
-				WORKINGSET_ACTIVATE_ANON);
-		if (refaults !=3D target_lruvec->refaults[0] ||
-			inactive_is_low(target_lruvec, LRU_INACTIVE_ANON))
-			sc->may_deactivate |=3D DEACTIVATE_ANON;
-		else
-			sc->may_deactivate &=3D ~DEACTIVATE_ANON;
-
-		/*
-		 * When refaults are being observed, it means a new
-		 * workingset is being established. Deactivate to get
-		 * rid of any stale active pages quickly.
-		 */
-		refaults =3D lruvec_page_state(target_lruvec,
-				WORKINGSET_ACTIVATE_FILE);
-		if (refaults !=3D target_lruvec->refaults[1] ||
-		    inactive_is_low(target_lruvec, LRU_INACTIVE_FILE))
-			sc->may_deactivate |=3D DEACTIVATE_FILE;
-		else
-			sc->may_deactivate &=3D ~DEACTIVATE_FILE;
-	} else
-		sc->may_deactivate =3D DEACTIVATE_ANON | DEACTIVATE_FILE;
-
-	/*
-	 * If we have plenty of inactive file pages that aren't
-	 * thrashing, try to reclaim those first before touching
-	 * anonymous pages.
-	 */
-	file =3D lruvec_page_state(target_lruvec, NR_INACTIVE_FILE);
-	if (file >> sc->priority && !(sc->may_deactivate & DEACTIVATE_FILE))
-		sc->cache_trim_mode =3D 1;
-	else
-		sc->cache_trim_mode =3D 0;
-
-	/*
-	 * Prevent the reclaimer from falling into the cache trap: as
-	 * cache pages start out inactive, every cache fault will tip
-	 * the scan balance towards the file LRU.  And as the file LRU
-	 * shrinks, so does the window for rotation from references.
-	 * This means we have a runaway feedback loop where a tiny
-	 * thrashing file LRU becomes infinitely more attractive than
-	 * anon pages.  Try to detect this based on file LRU size.
-	 */
-	if (!cgroup_reclaim(sc)) {
-		unsigned long total_high_wmark =3D 0;
-		unsigned long free, anon;
-		int z;
-
-		free =3D sum_zone_node_page_state(pgdat->node_id, NR_FREE_PAGES);
-		file =3D node_page_state(pgdat, NR_ACTIVE_FILE) +
-			   node_page_state(pgdat, NR_INACTIVE_FILE);
-
-		for (z =3D 0; z < MAX_NR_ZONES; z++) {
-			struct zone *zone =3D &pgdat->node_zones[z];
-			if (!managed_zone(zone))
-				continue;
-
-			total_high_wmark +=3D high_wmark_pages(zone);
-		}
-
-		/*
-		 * Consider anon: if that's low too, this isn't a
-		 * runaway file reclaim problem, but rather just
-		 * extreme pressure. Reclaim as per usual then.
-		 */
-		anon =3D node_page_state(pgdat, NR_INACTIVE_ANON);
-
-		sc->file_is_tiny =3D
-			file + free <=3D total_high_wmark &&
-			!(sc->may_deactivate & DEACTIVATE_ANON) &&
-			anon >> sc->priority;
-	}
+	prepare_scan_count(pgdat, sc);
 =

 	shrink_node_memcgs(pgdat, sc);
 =

-- =

2.31.1.751.gd2f1c929bd-goog

--===============5291282458423189695==--

