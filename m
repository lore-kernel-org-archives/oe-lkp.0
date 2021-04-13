Content-Type: multipart/mixed; boundary="===============8104259154035868665=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v2 08/16] mm: multigenerational lru: groundwork
Date: Tue, 13 Apr 2021 00:56:25 -0600
Message-ID: <20210413065633.2782273-9-yuzhao@google.com>
In-Reply-To: <20210413065633.2782273-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8104259154035868665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For each lruvec, evictable pages are divided into multiple
generations. The youngest generation number is stored in max_seq for
both anon and file types as they are aged on an equal footing. The
oldest generation numbers are stored in min_seq[2] separately for anon
and file types as clean file pages can be evicted regardless of
may_swap or may_writepage. Generation numbers are truncated into
order_base_2(MAX_NR_GENS+1) bits in order to fit into page->flags. The
sliding window technique is used to prevent truncated generation
numbers from overlapping. Each truncated generation number is an index
to lruvec->evictable.lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES].
Evictable pages are added to the per-zone lists indexed by max_seq or
min_seq[2] (modulo MAX_NR_GENS), depending on whether they are being
faulted in.

The workflow comprises two conceptually independent functions: the
aging and the eviction. The aging produces young generations. Given an
lruvec, the aging scans page tables for referenced pages of this
lruvec. Upon finding one, the aging updates its generation number to
max_seq. After each round of scan, the aging increments max_seq. The
aging is due when both of min_seq[2] reaches max_seq-1, assuming both
anon and file types are reclaimable.

The eviction consumes old generations. Given an lruvec, the eviction
scans the pages on the per-zone lists indexed by either of min_seq[2].
It tries to select a type based on the values of min_seq[2] and
swappiness. During a scan, the eviction sorts pages according to their
generation numbers, if the aging has found them referenced. When it
finds all the per-zone lists of a selected type are empty, the
eviction increments min_seq[2] indexed by this selected type.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 fs/fuse/dev.c                     |   3 +-
 include/linux/mm.h                |   2 +
 include/linux/mm_inline.h         | 193 +++++++++++++++++++
 include/linux/mmzone.h            | 110 +++++++++++
 include/linux/page-flags-layout.h |  20 +-
 include/linux/page-flags.h        |   4 +-
 kernel/bounds.c                   |   6 +
 mm/huge_memory.c                  |   3 +-
 mm/mm_init.c                      |  16 +-
 mm/mmzone.c                       |   2 +
 mm/swapfile.c                     |   4 +
 mm/vmscan.c                       | 305 ++++++++++++++++++++++++++++++
 12 files changed, 656 insertions(+), 12 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index c0fee830a34e..27c83f557794 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -784,7 +784,8 @@ static int fuse_check_page(struct page *page)
 	       1 << PG_lru |
 	       1 << PG_active |
 	       1 << PG_reclaim |
-	       1 << PG_waiters))) {
+	       1 << PG_waiters |
+	       LRU_GEN_MASK | LRU_USAGE_MASK))) {
 		dump_page(page, "fuse: trying to steal weird page");
 		return 1;
 	}
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8ba434287387..2c8a2db78ce9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1070,6 +1070,8 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf);
 #define ZONES_PGOFF		(NODES_PGOFF - ZONES_WIDTH)
 #define LAST_CPUPID_PGOFF	(ZONES_PGOFF - LAST_CPUPID_WIDTH)
 #define KASAN_TAG_PGOFF		(LAST_CPUPID_PGOFF - KASAN_TAG_WIDTH)
+#define LRU_GEN_PGOFF		(KASAN_TAG_PGOFF - LRU_GEN_WIDTH)
+#define LRU_USAGE_PGOFF		(LRU_GEN_PGOFF - LRU_USAGE_WIDTH)
 =

 /*
  * Define the bit shifts to access each section.  For non-existent
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 355ea1ee32bd..2bf910eb3dd7 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -79,11 +79,198 @@ static __always_inline enum lru_list page_lru(struct p=
age *page)
 	return lru;
 }
 =

+#ifdef CONFIG_LRU_GEN
+
+#ifdef CONFIG_LRU_GEN_ENABLED
+DECLARE_STATIC_KEY_TRUE(lru_gen_static_key);
+#define lru_gen_enabled() static_branch_likely(&lru_gen_static_key)
+#else
+DECLARE_STATIC_KEY_FALSE(lru_gen_static_key);
+#define lru_gen_enabled() static_branch_unlikely(&lru_gen_static_key)
+#endif
+
+/* We track@most MAX_NR_GENS generations using the sliding window techn=
ique. */
+static inline int lru_gen_from_seq(unsigned long seq)
+{
+	return seq % MAX_NR_GENS;
+}
+
+/* Return a proper index regardless whether we keep a full history of stat=
s. */
+static inline int sid_from_seq_or_gen(int seq_or_gen)
+{
+	return seq_or_gen % NR_STAT_GENS;
+}
+
+/* The youngest and the second youngest generations are considered active.=
 */
+static inline bool lru_gen_is_active(struct lruvec *lruvec, int gen)
+{
+	unsigned long max_seq =3D READ_ONCE(lruvec->evictable.max_seq);
+
+	VM_BUG_ON(!max_seq);
+	VM_BUG_ON(gen >=3D MAX_NR_GENS);
+
+	return gen =3D=3D lru_gen_from_seq(max_seq) || gen =3D=3D lru_gen_from_se=
q(max_seq - 1);
+}
+
+/* Update the sizes of the multigenerational lru. */
+static inline void lru_gen_update_size(struct page *page, struct lruvec *l=
ruvec,
+				       int old_gen, int new_gen)
+{
+	int file =3D page_is_file_lru(page);
+	int zone =3D page_zonenum(page);
+	int delta =3D thp_nr_pages(page);
+	enum lru_list lru =3D LRU_FILE * file;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	lockdep_assert_held(&lruvec->lru_lock);
+	VM_BUG_ON(old_gen !=3D -1 && old_gen >=3D MAX_NR_GENS);
+	VM_BUG_ON(new_gen !=3D -1 && new_gen >=3D MAX_NR_GENS);
+	VM_BUG_ON(old_gen =3D=3D -1 && new_gen =3D=3D -1);
+
+	if (old_gen >=3D 0)
+		WRITE_ONCE(lrugen->sizes[old_gen][file][zone],
+			   lrugen->sizes[old_gen][file][zone] - delta);
+	if (new_gen >=3D 0)
+		WRITE_ONCE(lrugen->sizes[new_gen][file][zone],
+			   lrugen->sizes[new_gen][file][zone] + delta);
+
+	if (old_gen < 0) {
+		if (lru_gen_is_active(lruvec, new_gen))
+			lru +=3D LRU_ACTIVE;
+		update_lru_size(lruvec, lru, zone, delta);
+		return;
+	}
+
+	if (new_gen < 0) {
+		if (lru_gen_is_active(lruvec, old_gen))
+			lru +=3D LRU_ACTIVE;
+		update_lru_size(lruvec, lru, zone, -delta);
+		return;
+	}
+
+	if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(lruvec, new_=
gen)) {
+		update_lru_size(lruvec, lru, zone, -delta);
+		update_lru_size(lruvec, lru + LRU_ACTIVE, zone, delta);
+	}
+
+	VM_BUG_ON(lru_gen_is_active(lruvec, old_gen) && !lru_gen_is_active(lruvec=
, new_gen));
+}
+
+/* Add a page to a list of the multigenerational lru. Return true on succe=
ss. */
+static inline bool lru_gen_addition(struct page *page, struct lruvec *lruv=
ec, bool front)
+{
+	int gen;
+	unsigned long old_flags, new_flags;
+	int file =3D page_is_file_lru(page);
+	int zone =3D page_zonenum(page);
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	if (PageUnevictable(page) || !lrugen->enabled[file])
+		return false;
+	/*
+	 * If a page is being faulted in, add it to the youngest generation.
+	 * try_walk_mm_list() may look at the size of the youngest generation to
+	 * determine if the aging is due.
+	 *
+	 * If a page can't be evicted immediately, i.e., a shmem page not in
+	 * swap cache, a dirty page waiting on writeback, or a page rejected by
+	 * evict_lru_gen_pages() due to races, dirty buffer heads, etc., add it
+	 * to the second oldest generation.
+	 *
+	 * If a page could be evicted immediately, i.e., deactivated, rotated by
+	 * writeback, or allocated for buffered io, add it to the oldest
+	 * generation.
+	 */
+	if (PageActive(page))
+		gen =3D lru_gen_from_seq(lrugen->max_seq);
+	else if ((!file && !PageSwapCache(page)) ||
+		 (PageReclaim(page) && (PageDirty(page) || PageWriteback(page))) ||
+		 (!PageReferenced(page) && PageWorkingset(page)))
+		gen =3D lru_gen_from_seq(lrugen->min_seq[file] + 1);
+	else
+		gen =3D lru_gen_from_seq(lrugen->min_seq[file]);
+
+	do {
+		old_flags =3D READ_ONCE(page->flags);
+		VM_BUG_ON_PAGE(old_flags & LRU_GEN_MASK, page);
+
+		new_flags =3D (old_flags & ~(LRU_GEN_MASK | BIT(PG_active))) |
+			    ((gen + 1UL) << LRU_GEN_PGOFF);
+		/* see the comment in evict_lru_gen_pages() */
+		if (!(old_flags & BIT(PG_referenced)))
+			new_flags &=3D ~(LRU_USAGE_MASK | LRU_TIER_FLAGS);
+	} while (cmpxchg(&page->flags, old_flags, new_flags) !=3D old_flags);
+
+	lru_gen_update_size(page, lruvec, -1, gen);
+	if (front)
+		list_add(&page->lru, &lrugen->lists[gen][file][zone]);
+	else
+		list_add_tail(&page->lru, &lrugen->lists[gen][file][zone]);
+
+	return true;
+}
+
+/* Delete a page from a list of the multigenerational lru. Return true on =
success. */
+static inline bool lru_gen_deletion(struct page *page, struct lruvec *lruv=
ec)
+{
+	int gen;
+	unsigned long old_flags, new_flags;
+
+	do {
+		old_flags =3D READ_ONCE(page->flags);
+		if (!(old_flags & LRU_GEN_MASK))
+			return false;
+
+		VM_BUG_ON_PAGE(PageActive(page), page);
+		VM_BUG_ON_PAGE(PageUnevictable(page), page);
+
+		gen =3D ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
+
+		new_flags =3D old_flags & ~LRU_GEN_MASK;
+		/* mark page active accordingly */
+		if (lru_gen_is_active(lruvec, gen))
+			new_flags |=3D BIT(PG_active);
+	} while (cmpxchg(&page->flags, old_flags, new_flags) !=3D old_flags);
+
+	lru_gen_update_size(page, lruvec, gen, -1);
+	list_del(&page->lru);
+
+	return true;
+}
+
+/* Return -1 when a page is not on a list of the multigenerational lru. */
+static inline int page_lru_gen(struct page *page)
+{
+	return ((READ_ONCE(page->flags) & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
+}
+
+#else /* CONFIG_LRU_GEN */
+
+static inline bool lru_gen_enabled(void)
+{
+	return false;
+}
+
+static inline bool lru_gen_addition(struct page *page, struct lruvec *lruv=
ec, bool front)
+{
+	return false;
+}
+
+static inline bool lru_gen_deletion(struct page *page, struct lruvec *lruv=
ec)
+{
+	return false;
+}
+
+#endif /* CONFIG_LRU_GEN */
+
 static __always_inline void add_page_to_lru_list(struct page *page,
 				struct lruvec *lruvec)
 {
 	enum lru_list lru =3D page_lru(page);
 =

+	if (lru_gen_addition(page, lruvec, true))
+		return;
+
 	update_lru_size(lruvec, lru, page_zonenum(page), thp_nr_pages(page));
 	list_add(&page->lru, &lruvec->lists[lru]);
 }
@@ -93,6 +280,9 @@ static __always_inline void add_page_to_lru_list_tail(st=
ruct page *page,
 {
 	enum lru_list lru =3D page_lru(page);
 =

+	if (lru_gen_addition(page, lruvec, false))
+		return;
+
 	update_lru_size(lruvec, lru, page_zonenum(page), thp_nr_pages(page));
 	list_add_tail(&page->lru, &lruvec->lists[lru]);
 }
@@ -100,6 +290,9 @@ static __always_inline void add_page_to_lru_list_tail(s=
truct page *page,
 static __always_inline void del_page_from_lru_list(struct page *page,
 				struct lruvec *lruvec)
 {
+	if (lru_gen_deletion(page, lruvec))
+		return;
+
 	list_del(&page->lru);
 	update_lru_size(lruvec, page_lru(page), page_zonenum(page),
 			-thp_nr_pages(page));
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 47946cec7584..a60c7498afd7 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -293,6 +293,112 @@ enum lruvec_flags {
 					 */
 };
 =

+struct lruvec;
+
+#define LRU_GEN_MASK		((BIT(LRU_GEN_WIDTH) - 1) << LRU_GEN_PGOFF)
+#define LRU_USAGE_MASK		((BIT(LRU_USAGE_WIDTH) - 1) << LRU_USAGE_PGOFF)
+
+#ifdef CONFIG_LRU_GEN
+
+/*
+ * For each lruvec, evictable pages are divided into multiple generations.=
 The
+ * youngest and the oldest generation numbers, AKA max_seq and min_seq, are
+ * monotonically increasing. The sliding window technique is used to track=
 at
+ * most MAX_NR_GENS and@least MIN_NR_GENS generations. An offset within=
 the
+ * window, AKA gen, indexes an array of per-type and per-zone lists for the
+ * corresponding generation. All pages from this array of lists have gen+1
+ * stored in page->flags. 0 is reserved to indicate that pages are not on =
the
+ * lists.
+ */
+#define MAX_NR_GENS		((unsigned int)CONFIG_NR_LRU_GENS)
+
+/*
+ * Each generation is then divided into multiple tiers. Tiers represent le=
vels
+ * of usage from file descriptors, i.e., mark_page_accessed(). In contrast=
 to
+ * moving across generations which requires the lru lock, moving across ti=
ers
+ * only involves an atomic operation on page->flags and therefore has a
+ * negligible cost.
+ *
+ * The purposes of tiers are to:
+ *   1) estimate whether pages accessed multiple times via file descriptor=
s are
+ *   more active than pages accessed only via page tables by separating th=
e two
+ *   access types into upper tiers and the base tier and comparing refault=
 rates
+ *   across tiers.
+ *   2) improve buffered io performance by deferring activations of pages
+ *   accessed multiple times until the eviction. That is activations happe=
n in
+ *   the reclaim path, not the access path.
+ *
+ * Pages accessed N times via file descriptors belong to tier order_base_2=
(N).
+ * The base tier uses the following page flag:
+ *   !PageReferenced() -- readahead pages
+ *   PageReferenced() -- single-access pages
+ * All upper tiers use the following page flags:
+ *   PageReferenced() && PageWorkingset() -- multi-access pages
+ * in addition to the bits storing N-2 accesses. Therefore, we can support=
 one
+ * upper tier without using additional bits in page->flags.
+ *
+ * Note that
+ *   1) PageWorkingset() is always set for upper tiers because we want to
+ *    maintain the existing psi behavior.
+ *   2) !PageReferenced() && PageWorkingset() is not a valid tier. See the
+ *   comment in evict_lru_gen_pages().
+ *   3) pages accessed only via page tables belong to the base tier.
+ *
+ * Pages from the base tier are evicted regardless of the refault rate. Pa=
ges
+ * from upper tiers will be moved to the next generation, if their refault=
 rates
+ * are higher than that of the base tier.
+ */
+#define MAX_NR_TIERS		((unsigned int)CONFIG_TIERS_PER_GEN)
+#define LRU_TIER_FLAGS		(BIT(PG_referenced) | BIT(PG_workingset))
+#define LRU_USAGE_SHIFT		(CONFIG_TIERS_PER_GEN - 1)
+
+/* Whether to keep historical stats for each generation. */
+#ifdef CONFIG_LRU_GEN_STATS
+#define NR_STAT_GENS		((unsigned int)CONFIG_NR_LRU_GENS)
+#else
+#define NR_STAT_GENS		1U
+#endif
+
+struct lrugen {
+	/* the aging increments the max generation number */
+	unsigned long max_seq;
+	/* the eviction increments the min generation numbers */
+	unsigned long min_seq[ANON_AND_FILE];
+	/* the birth time of each generation in jiffies */
+	unsigned long timestamps[MAX_NR_GENS];
+	/* the lists of the multigenerational lru */
+	struct list_head lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
+	/* the sizes of the multigenerational lru in pages */
+	unsigned long sizes[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
+	/* to determine which type and its tiers to evict */
+	atomic_long_t evicted[NR_STAT_GENS][ANON_AND_FILE][MAX_NR_TIERS];
+	atomic_long_t refaulted[NR_STAT_GENS][ANON_AND_FILE][MAX_NR_TIERS];
+	/* the base tier is inactive and won't be activated */
+	unsigned long activated[NR_STAT_GENS][ANON_AND_FILE][MAX_NR_TIERS - 1];
+	/* arithmetic mean weighted by geometric series 1/2, 1/4, ... */
+	unsigned long avg_total[ANON_AND_FILE][MAX_NR_TIERS];
+	unsigned long avg_refaulted[ANON_AND_FILE][MAX_NR_TIERS];
+	/* reclaim priority to compare across memcgs */
+	atomic_t priority;
+	/* whether the multigenerational lru is enabled */
+	bool enabled[ANON_AND_FILE];
+};
+
+void lru_gen_init_lruvec(struct lruvec *lruvec);
+void lru_gen_set_state(bool enable, bool main, bool swap);
+
+#else /* CONFIG_LRU_GEN */
+
+static inline void lru_gen_init_lruvec(struct lruvec *lruvec)
+{
+}
+
+static inline void lru_gen_set_state(bool enable, bool main, bool swap)
+{
+}
+
+#endif /* CONFIG_LRU_GEN */
+
 struct lruvec {
 	struct list_head		lists[NR_LRU_LISTS];
 	/* per lruvec lru_lock for memcg */
@@ -310,6 +416,10 @@ struct lruvec {
 	unsigned long			refaults[ANON_AND_FILE];
 	/* Various lruvec state flags (enum lruvec_flags) */
 	unsigned long			flags;
+#ifdef CONFIG_LRU_GEN
+	/* unevictable pages are on LRU_UNEVICTABLE */
+	struct lrugen			evictable;
+#endif
 #ifdef CONFIG_MEMCG
 	struct pglist_data *pgdat;
 #endif
diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-l=
ayout.h
index 7d4ec26d8a3e..df83aaec8498 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -24,6 +24,17 @@
 #error ZONES_SHIFT -- too many zones configured adjust calculation
 #endif
 =

+#ifdef CONFIG_LRU_GEN
+/*
+ * LRU_GEN_WIDTH is generated from order_base_2(CONFIG_NR_LRU_GENS + 1). A=
nd the
+ * comment on MAX_NR_TIERS explains why we offset by 2 here.
+ */
+#define LRU_USAGE_WIDTH		(CONFIG_TIERS_PER_GEN - 2)
+#else
+#define LRU_GEN_WIDTH		0
+#define LRU_USAGE_WIDTH		0
+#endif
+
 #ifdef CONFIG_SPARSEMEM
 #include <asm/sparsemem.h>
 =

@@ -56,7 +67,8 @@
 =

 #define ZONES_WIDTH		ZONES_SHIFT
 =

-#if SECTIONS_WIDTH+ZONES_WIDTH+NODES_SHIFT <=3D BITS_PER_LONG - NR_PAGEFLA=
GS
+#if SECTIONS_WIDTH+ZONES_WIDTH+LRU_GEN_WIDTH+LRU_USAGE_WIDTH+NODES_SHIFT \
+	<=3D BITS_PER_LONG - NR_PAGEFLAGS
 #define NODES_WIDTH		NODES_SHIFT
 #else
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
@@ -83,14 +95,16 @@
 #define KASAN_TAG_WIDTH 0
 #endif
 =

-#if SECTIONS_WIDTH+ZONES_WIDTH+NODES_SHIFT+LAST_CPUPID_SHIFT+KASAN_TAG_WID=
TH \
+#if SECTIONS_WIDTH+ZONES_WIDTH+LRU_GEN_WIDTH+LRU_USAGE_WIDTH+ \
+	NODES_WIDTH+KASAN_TAG_WIDTH+LAST_CPUPID_SHIFT \
 	<=3D BITS_PER_LONG - NR_PAGEFLAGS
 #define LAST_CPUPID_WIDTH LAST_CPUPID_SHIFT
 #else
 #define LAST_CPUPID_WIDTH 0
 #endif
 =

-#if SECTIONS_WIDTH+NODES_WIDTH+ZONES_WIDTH+LAST_CPUPID_WIDTH+KASAN_TAG_WID=
TH \
+#if SECTIONS_WIDTH+ZONES_WIDTH+LRU_GEN_WIDTH+LRU_USAGE_WIDTH+ \
+	NODES_WIDTH+KASAN_TAG_WIDTH+LAST_CPUPID_WIDTH \
 	> BITS_PER_LONG - NR_PAGEFLAGS
 #error "Not enough bits in page flags"
 #endif
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 04a34c08e0a6..e58984fca32a 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -817,7 +817,7 @@ static inline void ClearPageSlabPfmemalloc(struct page =
*page)
 	 1UL << PG_private	| 1UL << PG_private_2	|	\
 	 1UL << PG_writeback	| 1UL << PG_reserved	|	\
 	 1UL << PG_slab		| 1UL << PG_active 	|	\
-	 1UL << PG_unevictable	| __PG_MLOCKED)
+	 1UL << PG_unevictable	| __PG_MLOCKED | LRU_GEN_MASK)
 =

 /*
  * Flags checked when a page is prepped for return by the page allocator.
@@ -828,7 +828,7 @@ static inline void ClearPageSlabPfmemalloc(struct page =
*page)
  * alloc-free cycle to prevent from reusing the page.
  */
 #define PAGE_FLAGS_CHECK_AT_PREP	\
-	(((1UL << NR_PAGEFLAGS) - 1) & ~__PG_HWPOISON)
+	((((1UL << NR_PAGEFLAGS) - 1) & ~__PG_HWPOISON) | LRU_GEN_MASK | LRU_USAG=
E_MASK)
 =

 #define PAGE_FLAGS_PRIVATE				\
 	(1UL << PG_private | 1UL << PG_private_2)
diff --git a/kernel/bounds.c b/kernel/bounds.c
index 9795d75b09b2..a8cbf2d0b11a 100644
--- a/kernel/bounds.c
+++ b/kernel/bounds.c
@@ -22,6 +22,12 @@ int main(void)
 	DEFINE(NR_CPUS_BITS, ilog2(CONFIG_NR_CPUS));
 #endif
 	DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
+#ifdef CONFIG_LRU_GEN
+	/* bits needed to represent internal values stored in page->flags */
+	DEFINE(LRU_GEN_WIDTH, order_base_2(CONFIG_NR_LRU_GENS + 1));
+	/* bits needed to represent normalized values for external uses */
+	DEFINE(LRU_GEN_SHIFT, order_base_2(CONFIG_NR_LRU_GENS));
+#endif
 	/* End of constants */
 =

 	return 0;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ae907a9c2050..26d3cc4a7a0b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2418,7 +2418,8 @@ static void __split_huge_page_tail(struct page *head,=
 int tail,
 #ifdef CONFIG_64BIT
 			 (1L << PG_arch_2) |
 #endif
-			 (1L << PG_dirty)));
+			 (1L << PG_dirty) |
+			 LRU_GEN_MASK | LRU_USAGE_MASK));
 =

 	/* ->mapping in first tail page is compound_mapcount */
 	VM_BUG_ON_PAGE(tail > 2 && page_tail->mapping !=3D TAIL_MAPPING,
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 8e02e865cc65..6303ed7aa511 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -71,27 +71,33 @@ void __init mminit_verify_pageflags_layout(void)
 	width =3D shift - SECTIONS_WIDTH - NODES_WIDTH - ZONES_WIDTH
 		- LAST_CPUPID_SHIFT - KASAN_TAG_WIDTH;
 	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_widths",
-		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d Flags %d\n",
+		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d lru gen %d tier %d=
 Flags %d\n",
 		SECTIONS_WIDTH,
 		NODES_WIDTH,
 		ZONES_WIDTH,
 		LAST_CPUPID_WIDTH,
 		KASAN_TAG_WIDTH,
+		LRU_GEN_WIDTH,
+		LRU_USAGE_WIDTH,
 		NR_PAGEFLAGS);
 	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_shifts",
-		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d\n",
+		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d lru gen %d tier %d=
\n",
 		SECTIONS_SHIFT,
 		NODES_SHIFT,
 		ZONES_SHIFT,
 		LAST_CPUPID_SHIFT,
-		KASAN_TAG_WIDTH);
+		KASAN_TAG_WIDTH,
+		LRU_GEN_WIDTH,
+		LRU_USAGE_WIDTH);
 	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_pgshifts",
-		"Section %lu Node %lu Zone %lu Lastcpupid %lu Kasantag %lu\n",
+		"Section %lu Node %lu Zone %lu Lastcpupid %lu Kasantag %lu lru gen %lu t=
ier %lu\n",
 		(unsigned long)SECTIONS_PGSHIFT,
 		(unsigned long)NODES_PGSHIFT,
 		(unsigned long)ZONES_PGSHIFT,
 		(unsigned long)LAST_CPUPID_PGSHIFT,
-		(unsigned long)KASAN_TAG_PGSHIFT);
+		(unsigned long)KASAN_TAG_PGSHIFT,
+		(unsigned long)LRU_GEN_PGOFF,
+		(unsigned long)LRU_USAGE_PGOFF);
 	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_nodezoneid",
 		"Node/Zone ID: %lu -> %lu\n",
 		(unsigned long)(ZONEID_PGOFF + ZONEID_SHIFT),
diff --git a/mm/mmzone.c b/mm/mmzone.c
index eb89d6e018e2..2ec0d7793424 100644
--- a/mm/mmzone.c
+++ b/mm/mmzone.c
@@ -81,6 +81,8 @@ void lruvec_init(struct lruvec *lruvec)
 =

 	for_each_lru(lru)
 		INIT_LIST_HEAD(&lruvec->lists[lru]);
+
+	lru_gen_init_lruvec(lruvec);
 }
 =

 #if defined(CONFIG_NUMA_BALANCING) && !defined(LAST_CPUPID_NOT_IN_PAGE_FLA=
GS)
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 084a5b9a18e5..c6041d10a73a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2702,6 +2702,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, special=
file)
 	err =3D 0;
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
+	/* stop tracking anon if the multigenerational lru is enabled */
+	lru_gen_set_state(false, false, true);
 =

 out_dput:
 	filp_close(victim, NULL);
@@ -3348,6 +3350,8 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialf=
ile, int, swap_flags)
 	mutex_unlock(&swapon_mutex);
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
+	/* start tracking anon if the multigenerational lru is enabled */
+	lru_gen_set_state(true, false, true);
 =

 	error =3D 0;
 	goto out;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 1a24d2e0a4cb..8559bb94d452 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -49,6 +49,7 @@
 #include <linux/printk.h>
 #include <linux/dax.h>
 #include <linux/psi.h>
+#include <linux/memory.h>
 =

 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -4314,3 +4315,307 @@ void check_move_unevictable_pages(struct pagevec *p=
vec)
 	}
 }
 EXPORT_SYMBOL_GPL(check_move_unevictable_pages);
+
+#ifdef CONFIG_LRU_GEN
+
+/*
+ * After pages are faulted in, the aging must scan them twice before the
+ * eviction can. The first scan clears the accessed bit set during initial
+ * faults. And the second scan makes sure they haven't been used since the
+ * first.
+ */
+#define MIN_NR_GENS	2
+
+#define MAX_BATCH_SIZE	8192
+
+/*************************************************************************=
*****
+ *                          shorthand helpers
+ *************************************************************************=
*****/
+
+#define DEFINE_MAX_SEQ()						\
+	unsigned long max_seq =3D READ_ONCE(lruvec->evictable.max_seq)
+
+#define DEFINE_MIN_SEQ()						\
+	unsigned long min_seq[ANON_AND_FILE] =3D {			\
+		READ_ONCE(lruvec->evictable.min_seq[0]),		\
+		READ_ONCE(lruvec->evictable.min_seq[1]),		\
+	}
+
+#define for_each_type_zone(file, zone)					\
+	for ((file) =3D 0; (file) < ANON_AND_FILE; (file)++)		\
+		for ((zone) =3D 0; (zone) < MAX_NR_ZONES; (zone)++)
+
+#define for_each_gen_type_zone(gen, file, zone)				\
+	for ((gen) =3D 0; (gen) < MAX_NR_GENS; (gen)++)			\
+		for ((file) =3D 0; (file) < ANON_AND_FILE; (file)++)	\
+			for ((zone) =3D 0; (zone) < MAX_NR_ZONES; (zone)++)
+
+static int get_nr_gens(struct lruvec *lruvec, int file)
+{
+	return lruvec->evictable.max_seq - lruvec->evictable.min_seq[file] + 1;
+}
+
+static int min_nr_gens(unsigned long max_seq, unsigned long *min_seq, int =
swappiness)
+{
+	return max_seq - max(min_seq[!swappiness], min_seq[1]) + 1;
+}
+
+static int max_nr_gens(unsigned long max_seq, unsigned long *min_seq, int =
swappiness)
+{
+	return max_seq - min(min_seq[!swappiness], min_seq[1]) + 1;
+}
+
+static bool __maybe_unused seq_is_valid(struct lruvec *lruvec)
+{
+	lockdep_assert_held(&lruvec->lru_lock);
+
+	return get_nr_gens(lruvec, 0) >=3D MIN_NR_GENS &&
+	       get_nr_gens(lruvec, 0) <=3D MAX_NR_GENS &&
+	       get_nr_gens(lruvec, 1) >=3D MIN_NR_GENS &&
+	       get_nr_gens(lruvec, 1) <=3D MAX_NR_GENS;
+}
+
+/*************************************************************************=
*****
+ *                          state change
+ *************************************************************************=
*****/
+
+#ifdef CONFIG_LRU_GEN_ENABLED
+DEFINE_STATIC_KEY_TRUE(lru_gen_static_key);
+#else
+DEFINE_STATIC_KEY_FALSE(lru_gen_static_key);
+#endif
+
+static DEFINE_MUTEX(lru_gen_state_mutex);
+static int lru_gen_nr_swapfiles __read_mostly;
+
+static bool __maybe_unused state_is_valid(struct lruvec *lruvec)
+{
+	int gen, file, zone;
+	enum lru_list lru;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	for_each_evictable_lru(lru) {
+		file =3D is_file_lru(lru);
+
+		if (lrugen->enabled[file] && !list_empty(&lruvec->lists[lru]))
+			return false;
+	}
+
+	for_each_gen_type_zone(gen, file, zone) {
+		if (!lrugen->enabled[file] && !list_empty(&lrugen->lists[gen][file][zone=
]))
+			return false;
+
+		VM_WARN_ONCE(!lrugen->enabled[file] && lrugen->sizes[gen][file][zone],
+			     "lru_gen: possible unbalanced number of pages");
+	}
+
+	return true;
+}
+
+static bool fill_lru_gen_lists(struct lruvec *lruvec)
+{
+	enum lru_list lru;
+	int batch_size =3D 0;
+
+	for_each_evictable_lru(lru) {
+		int file =3D is_file_lru(lru);
+		bool active =3D is_active_lru(lru);
+		struct list_head *head =3D &lruvec->lists[lru];
+
+		if (!lruvec->evictable.enabled[file])
+			continue;
+
+		while (!list_empty(head)) {
+			bool success;
+			struct page *page =3D lru_to_page(head);
+
+			VM_BUG_ON_PAGE(PageTail(page), page);
+			VM_BUG_ON_PAGE(PageUnevictable(page), page);
+			VM_BUG_ON_PAGE(PageActive(page) !=3D active, page);
+			VM_BUG_ON_PAGE(page_lru_gen(page) !=3D -1, page);
+			VM_BUG_ON_PAGE(page_is_file_lru(page) !=3D file, page);
+
+			prefetchw_prev_lru_page(page, head, flags);
+
+			del_page_from_lru_list(page, lruvec);
+			success =3D lru_gen_addition(page, lruvec, true);
+			VM_BUG_ON(!success);
+
+			if (++batch_size =3D=3D MAX_BATCH_SIZE)
+				return false;
+		}
+	}
+
+	return true;
+}
+
+static bool drain_lru_gen_lists(struct lruvec *lruvec)
+{
+	int gen, file, zone;
+	int batch_size =3D 0;
+
+	for_each_gen_type_zone(gen, file, zone) {
+		struct list_head *head =3D &lruvec->evictable.lists[gen][file][zone];
+
+		if (lruvec->evictable.enabled[file])
+			continue;
+
+		while (!list_empty(head)) {
+			bool success;
+			struct page *page =3D lru_to_page(head);
+
+			VM_BUG_ON_PAGE(PageTail(page), page);
+			VM_BUG_ON_PAGE(PageUnevictable(page), page);
+			VM_BUG_ON_PAGE(PageActive(page), page);
+			VM_BUG_ON_PAGE(page_is_file_lru(page) !=3D file, page);
+			VM_BUG_ON_PAGE(page_zonenum(page) !=3D zone, page);
+
+			prefetchw_prev_lru_page(page, head, flags);
+
+			success =3D lru_gen_deletion(page, lruvec);
+			VM_BUG_ON(!success);
+			add_page_to_lru_list(page, lruvec);
+
+			if (++batch_size =3D=3D MAX_BATCH_SIZE)
+				return false;
+		}
+	}
+
+	return true;
+}
+
+/*
+ * For file page tracking, we enable/disable it according to the main swit=
ch.
+ * For anon page tracking, we only enabled it when the main switch is on a=
nd
+ * there is at least one swapfile; we disable it when there are no swapfil=
es
+ * regardless of the value of the main switch. Otherwise, we will eventual=
ly
+ * reach the max size of the sliding window and have to call inc_min_seq(),
+ * which brings an unnecessary overhead.
+ */
+void lru_gen_set_state(bool enable, bool main, bool swap)
+{
+	struct mem_cgroup *memcg;
+
+	mem_hotplug_begin();
+	mutex_lock(&lru_gen_state_mutex);
+	cgroup_lock();
+
+	main =3D main && enable !=3D lru_gen_enabled();
+	swap =3D swap && !(enable ? lru_gen_nr_swapfiles++ : --lru_gen_nr_swapfil=
es);
+	swap =3D swap && lru_gen_enabled();
+	if (!main && !swap)
+		goto unlock;
+
+	if (main) {
+		if (enable)
+			static_branch_enable(&lru_gen_static_key);
+		else
+			static_branch_disable(&lru_gen_static_key);
+	}
+
+	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
+	do {
+		int nid;
+
+		for_each_node_state(nid, N_MEMORY) {
+			struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, NODE_DATA(nid));
+			struct lrugen *lrugen =3D &lruvec->evictable;
+
+			spin_lock_irq(&lruvec->lru_lock);
+
+			VM_BUG_ON(!seq_is_valid(lruvec));
+			VM_BUG_ON(!state_is_valid(lruvec));
+
+			WRITE_ONCE(lrugen->enabled[0], lru_gen_enabled() && lru_gen_nr_swapfile=
s);
+			WRITE_ONCE(lrugen->enabled[1], lru_gen_enabled());
+
+			while (!(enable ? fill_lru_gen_lists(lruvec) :
+					  drain_lru_gen_lists(lruvec))) {
+				spin_unlock_irq(&lruvec->lru_lock);
+				cond_resched();
+				spin_lock_irq(&lruvec->lru_lock);
+			}
+
+			spin_unlock_irq(&lruvec->lru_lock);
+		}
+
+		cond_resched();
+	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+unlock:
+	cgroup_unlock();
+	mutex_unlock(&lru_gen_state_mutex);
+	mem_hotplug_done();
+}
+
+static int __meminit __maybe_unused lru_gen_online_mem(struct notifier_blo=
ck *self,
+						       unsigned long action, void *arg)
+{
+	struct mem_cgroup *memcg;
+	struct memory_notify *mnb =3D arg;
+	int nid =3D mnb->status_change_nid;
+
+	if (action !=3D MEM_GOING_ONLINE || nid =3D=3D NUMA_NO_NODE)
+		return NOTIFY_DONE;
+
+	mutex_lock(&lru_gen_state_mutex);
+	cgroup_lock();
+
+	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
+	do {
+		struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, NODE_DATA(nid));
+		struct lrugen *lrugen =3D &lruvec->evictable;
+
+		VM_BUG_ON(!seq_is_valid(lruvec));
+		VM_BUG_ON(!state_is_valid(lruvec));
+
+		WRITE_ONCE(lrugen->enabled[0], lru_gen_enabled() && lru_gen_nr_swapfiles=
);
+		WRITE_ONCE(lrugen->enabled[1], lru_gen_enabled());
+	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+
+	cgroup_unlock();
+	mutex_unlock(&lru_gen_state_mutex);
+
+	return NOTIFY_DONE;
+}
+
+/*************************************************************************=
*****
+ *                          initialization
+ *************************************************************************=
*****/
+
+void lru_gen_init_lruvec(struct lruvec *lruvec)
+{
+	int i;
+	int gen, file, zone;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	atomic_set(&lrugen->priority, DEF_PRIORITY);
+
+	lrugen->max_seq =3D MIN_NR_GENS + 1;
+	lrugen->enabled[0] =3D lru_gen_enabled() && lru_gen_nr_swapfiles;
+	lrugen->enabled[1] =3D lru_gen_enabled();
+
+	for (i =3D 0; i <=3D MIN_NR_GENS + 1; i++)
+		lrugen->timestamps[i] =3D jiffies;
+
+	for_each_gen_type_zone(gen, file, zone)
+		INIT_LIST_HEAD(&lrugen->lists[gen][file][zone]);
+}
+
+static int __init init_lru_gen(void)
+{
+	BUILD_BUG_ON(MIN_NR_GENS + 1 >=3D MAX_NR_GENS);
+	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH) <=3D MAX_NR_GENS);
+
+	if (hotplug_memory_notifier(lru_gen_online_mem, 0))
+		pr_err("lru_gen: failed to subscribe hotplug notifications\n");
+
+	return 0;
+};
+/*
+ * We want to run as early as possible because some debug code, e.g.,
+ * dma_resv_lockdep(), calls mm_alloc() and mmput(). We only depend on mm_=
kobj,
+ * which is initialized one stage earlier.
+ */
+arch_initcall(init_lru_gen);
+
+#endif /* CONFIG_LRU_GEN */
-- =

2.31.1.295.g9ea45b61b8-goog

--===============8104259154035868665==--

