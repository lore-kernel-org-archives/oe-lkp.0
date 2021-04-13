Content-Type: multipart/mixed; boundary="===============3339781846242503938=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v2 09/16] mm: multigenerational lru: activation
Date: Tue, 13 Apr 2021 00:56:26 -0600
Message-ID: <20210413065633.2782273-10-yuzhao@google.com>
In-Reply-To: <20210413065633.2782273-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3339781846242503938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For pages accessed multiple times via file descriptors, instead of
activating them upon the second accesses, we activate them based on
the refault rates of their tiers. Pages accessed N times via file
descriptors belong to tier order_base_2(N). Pages from tier 0, i.e.,
those read ahead, accessed once via file descriptors and accessed only
via page tables, are evicted regardless of the refault rate. Pages
from other tiers will be moved to the next generation, i.e.,
activated, if the refault rates of their tiers are higher than that of
tier 0. Each generation contains at most MAX_NR_TIERS tiers, and they
require additional MAX_NR_TIERS-2 bits in page->flags. This feedback
model has a few advantages over the current feedforward model:
  1) It has a negligible overhead in the access path because
  activations are done in the reclaim path.
  2) It takes mapped pages into account and avoids overprotecting
  pages accessed multiple times via file descriptors.
  3) More tiers offer better protection to pages accessed more than
  twice when buffered-I/O-intensive workloads are under memory
  pressure.

For pages mapped upon page faults, the accessed bit is set and they
must be properly aged. We add them to the per-zone lists index by
max_seq, i.e., the youngest generation. For pages not in page cache
or swap cache, this can be done easily in the page fault path: we
rename lru_cache_add_inactive_or_unevictable() to
lru_cache_add_page_vma() and add a new parameter, which is set to true
for pages mapped upon page faults. For pages in page cache or swap
cache, we cannot differentiate the page fault path from the read ahead
path at the time we call lru_cache_add() in add_to_page_cache_lru()
and __read_swap_cache_async(). So we add a new function
lru_gen_activation(), which is essentially activate_page(), to move
pages to the per-zone lists indexed by max_seq at a later time.
Hopefully we would find those pages in lru_pvecs.lru_add and simply
set PageActive() on them without having to actually move them.

Finally, we need to be compatible with the existing notion of active
and inactive. We cannot use PageActive() because it is not set on
active pages unless they are isolated, in order to spare the aging the
trouble of clearing it when an active generation becomes inactive. A
new function page_is_active() compares the generation number of a page
with max_seq and max_seq-1 (modulo MAX_NR_GENS), which are considered
active and protected from the eviction. Other generations, which may
or may not exist, are considered inactive.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 fs/proc/task_mmu.c        |   3 +-
 include/linux/mm_inline.h | 101 +++++++++++++++++++++
 include/linux/swap.h      |   4 +-
 kernel/events/uprobes.c   |   2 +-
 mm/huge_memory.c          |   2 +-
 mm/khugepaged.c           |   2 +-
 mm/memory.c               |  14 +--
 mm/migrate.c              |   2 +-
 mm/swap.c                 |  26 +++---
 mm/swapfile.c             |   2 +-
 mm/userfaultfd.c          |   2 +-
 mm/vmscan.c               |  91 ++++++++++++++++++-
 mm/workingset.c           | 179 +++++++++++++++++++++++++++++++-------
 13 files changed, 371 insertions(+), 59 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index e862cab69583..d292f20c4e3d 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -19,6 +19,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/uaccess.h>
 #include <linux/pkeys.h>
+#include <linux/mm_inline.h>
 =

 #include <asm/elf.h>
 #include <asm/tlb.h>
@@ -1718,7 +1719,7 @@ static void gather_stats(struct page *page, struct nu=
ma_maps *md, int pte_dirty,
 	if (PageSwapCache(page))
 		md->swapcache +=3D nr_pages;
 =

-	if (PageActive(page) || PageUnevictable(page))
+	if (PageUnevictable(page) || page_is_active(compound_head(page), NULL))
 		md->active +=3D nr_pages;
 =

 	if (PageWriteback(page))
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 2bf910eb3dd7..5eb4b12972ec 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -95,6 +95,12 @@ static inline int lru_gen_from_seq(unsigned long seq)
 	return seq % MAX_NR_GENS;
 }
 =

+/* Convert the level of usage to a tier. See the comment on MAX_NR_TIERS. =
*/
+static inline int lru_tier_from_usage(int usage)
+{
+	return order_base_2(usage + 1);
+}
+
 /* Return a proper index regardless whether we keep a full history of stat=
s. */
 static inline int sid_from_seq_or_gen(int seq_or_gen)
 {
@@ -238,12 +244,93 @@ static inline bool lru_gen_deletion(struct page *page=
, struct lruvec *lruvec)
 	return true;
 }
 =

+/* Activate a page from page cache or swap cache after it's mapped. */
+static inline void lru_gen_activation(struct page *page, struct vm_area_st=
ruct *vma)
+{
+	if (!lru_gen_enabled())
+		return;
+
+	if (PageActive(page) || PageUnevictable(page) || vma_is_dax(vma) ||
+	    (vma->vm_flags & (VM_LOCKED | VM_SPECIAL)))
+		return;
+	/*
+	 * TODO: pass vm_fault to add_to_page_cache_lru() and
+	 * __read_swap_cache_async() so they can activate pages directly when in
+	 * the page fault path.
+	 */
+	activate_page(page);
+}
+
 /* Return -1 when a page is not on a list of the multigenerational lru. */
 static inline int page_lru_gen(struct page *page)
 {
 	return ((READ_ONCE(page->flags) & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
 }
 =

+/* This function works regardless whether the multigenerational lru is ena=
bled. */
+static inline bool page_is_active(struct page *page, struct lruvec *lruvec)
+{
+	struct mem_cgroup *memcg;
+	int gen =3D page_lru_gen(page);
+	bool active =3D false;
+
+	VM_BUG_ON_PAGE(PageTail(page), page);
+
+	if (gen < 0)
+		return PageActive(page);
+
+	if (lruvec) {
+		VM_BUG_ON_PAGE(PageUnevictable(page), page);
+		VM_BUG_ON_PAGE(PageActive(page), page);
+		lockdep_assert_held(&lruvec->lru_lock);
+
+		return lru_gen_is_active(lruvec, gen);
+	}
+
+	rcu_read_lock();
+
+	memcg =3D page_memcg_rcu(page);
+	lruvec =3D mem_cgroup_lruvec(memcg, page_pgdat(page));
+	active =3D lru_gen_is_active(lruvec, gen);
+
+	rcu_read_unlock();
+
+	return active;
+}
+
+/* Return the level of usage of a page. See the comment on MAX_NR_TIERS. */
+static inline int page_tier_usage(struct page *page)
+{
+	unsigned long flags =3D READ_ONCE(page->flags);
+
+	return flags & BIT(PG_workingset) ?
+	       ((flags & LRU_USAGE_MASK) >> LRU_USAGE_PGOFF) + 1 : 0;
+}
+
+/* Increment the usage counter after a page is accessed via file descripto=
rs. */
+static inline bool page_inc_usage(struct page *page)
+{
+	unsigned long old_flags, new_flags;
+
+	if (!lru_gen_enabled())
+		return PageActive(page);
+
+	do {
+		old_flags =3D READ_ONCE(page->flags);
+
+		if (!(old_flags & BIT(PG_workingset)))
+			new_flags =3D old_flags | BIT(PG_workingset);
+		else
+			new_flags =3D (old_flags & ~LRU_USAGE_MASK) | min(LRU_USAGE_MASK,
+				    (old_flags & LRU_USAGE_MASK) + BIT(LRU_USAGE_PGOFF));
+
+		if (old_flags =3D=3D new_flags)
+			break;
+	} while (cmpxchg(&page->flags, old_flags, new_flags) !=3D old_flags);
+
+	return true;
+}
+
 #else /* CONFIG_LRU_GEN */
 =

 static inline bool lru_gen_enabled(void)
@@ -261,6 +348,20 @@ static inline bool lru_gen_deletion(struct page *page,=
 struct lruvec *lruvec)
 	return false;
 }
 =

+static inline void lru_gen_activation(struct page *page, struct vm_area_st=
ruct *vma)
+{
+}
+
+static inline bool page_is_active(struct page *page, struct lruvec *lruvec)
+{
+	return PageActive(page);
+}
+
+static inline bool page_inc_usage(struct page *page)
+{
+	return PageActive(page);
+}
+
 #endif /* CONFIG_LRU_GEN */
 =

 static __always_inline void add_page_to_lru_list(struct page *page,
diff --git a/include/linux/swap.h b/include/linux/swap.h
index de2bbbf181ba..0e7532c7db22 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -350,8 +350,8 @@ extern void deactivate_page(struct page *page);
 extern void mark_page_lazyfree(struct page *page);
 extern void swap_setup(void);
 =

-extern void lru_cache_add_inactive_or_unevictable(struct page *page,
-						struct vm_area_struct *vma);
+extern void lru_cache_add_page_vma(struct page *page, struct vm_area_struc=
t *vma,
+				   bool faulting);
 =

 /* linux/mm/vmscan.c */
 extern unsigned long zone_reclaimable_pages(struct zone *zone);
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 6addc9780319..4e93e5602723 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -184,7 +184,7 @@ static int __replace_page(struct vm_area_struct *vma, u=
nsigned long addr,
 	if (new_page) {
 		get_page(new_page);
 		page_add_new_anon_rmap(new_page, vma, addr, false);
-		lru_cache_add_inactive_or_unevictable(new_page, vma);
+		lru_cache_add_page_vma(new_page, vma, false);
 	} else
 		/* no new page, just dec_mm_counter for old_page */
 		dec_mm_counter(mm, MM_ANONPAGES);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 26d3cc4a7a0b..2cf46270c84b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -637,7 +637,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct v=
m_fault *vmf,
 		entry =3D mk_huge_pmd(page, vma->vm_page_prot);
 		entry =3D maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
 		page_add_new_anon_rmap(page, vma, haddr, true);
-		lru_cache_add_inactive_or_unevictable(page, vma);
+		lru_cache_add_page_vma(page, vma, true);
 		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
 		set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
 		update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a7d6cb912b05..08a43910f232 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1199,7 +1199,7 @@ static void collapse_huge_page(struct mm_struct *mm,
 	spin_lock(pmd_ptl);
 	BUG_ON(!pmd_none(*pmd));
 	page_add_new_anon_rmap(new_page, vma, address, true);
-	lru_cache_add_inactive_or_unevictable(new_page, vma);
+	lru_cache_add_page_vma(new_page, vma, true);
 	pgtable_trans_huge_deposit(mm, pmd, pgtable);
 	set_pmd_at(mm, address, pmd, _pmd);
 	update_mmu_cache_pmd(vma, address, pmd);
diff --git a/mm/memory.c b/mm/memory.c
index 550405fc3b5e..9a6cb6d31430 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -73,6 +73,7 @@
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
 #include <linux/vmalloc.h>
+#include <linux/mm_inline.h>
 =

 #include <trace/events/kmem.h>
 =

@@ -839,7 +840,7 @@ copy_present_page(struct vm_area_struct *dst_vma, struc=
t vm_area_struct *src_vma
 	copy_user_highpage(new_page, page, addr, src_vma);
 	__SetPageUptodate(new_page);
 	page_add_new_anon_rmap(new_page, dst_vma, addr, false);
-	lru_cache_add_inactive_or_unevictable(new_page, dst_vma);
+	lru_cache_add_page_vma(new_page, dst_vma, false);
 	rss[mm_counter(new_page)]++;
 =

 	/* All done, just insert the new page copy in the child */
@@ -2907,7 +2908,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		 */
 		ptep_clear_flush_notify(vma, vmf->address, vmf->pte);
 		page_add_new_anon_rmap(new_page, vma, vmf->address, false);
-		lru_cache_add_inactive_or_unevictable(new_page, vma);
+		lru_cache_add_page_vma(new_page, vma, true);
 		/*
 		 * We call the notify macro here because, when using secondary
 		 * mmu page tables (such as kvm shadow page tables), we want the
@@ -3438,9 +3439,10 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	/* ksm created a completely new copy */
 	if (unlikely(page !=3D swapcache && swapcache)) {
 		page_add_new_anon_rmap(page, vma, vmf->address, false);
-		lru_cache_add_inactive_or_unevictable(page, vma);
+		lru_cache_add_page_vma(page, vma, true);
 	} else {
 		do_page_add_anon_rmap(page, vma, vmf->address, exclusive);
+		lru_gen_activation(page, vma);
 	}
 =

 	swap_free(entry);
@@ -3584,7 +3586,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *=
vmf)
 =

 	inc_mm_counter_fast(vma->vm_mm, MM_ANONPAGES);
 	page_add_new_anon_rmap(page, vma, vmf->address, false);
-	lru_cache_add_inactive_or_unevictable(page, vma);
+	lru_cache_add_page_vma(page, vma, true);
 setpte:
 	set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
 =

@@ -3709,6 +3711,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct pa=
ge *page)
 =

 	add_mm_counter(vma->vm_mm, mm_counter_file(page), HPAGE_PMD_NR);
 	page_add_file_rmap(page, true);
+	lru_gen_activation(page, vma);
 	/*
 	 * deposit and withdraw with pmd lock held
 	 */
@@ -3752,10 +3755,11 @@ void do_set_pte(struct vm_fault *vmf, struct page *=
page, unsigned long addr)
 	if (write && !(vma->vm_flags & VM_SHARED)) {
 		inc_mm_counter_fast(vma->vm_mm, MM_ANONPAGES);
 		page_add_new_anon_rmap(page, vma, addr, false);
-		lru_cache_add_inactive_or_unevictable(page, vma);
+		lru_cache_add_page_vma(page, vma, true);
 	} else {
 		inc_mm_counter_fast(vma->vm_mm, mm_counter_file(page));
 		page_add_file_rmap(page, false);
+		lru_gen_activation(page, vma);
 	}
 	set_pte_at(vma->vm_mm, addr, vmf->pte, entry);
 }
diff --git a/mm/migrate.c b/mm/migrate.c
index 62b81d5257aa..1064b03cac33 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -3004,7 +3004,7 @@ static void migrate_vma_insert_page(struct migrate_vm=
a *migrate,
 	inc_mm_counter(mm, MM_ANONPAGES);
 	page_add_new_anon_rmap(page, vma, addr, false);
 	if (!is_zone_device_page(page))
-		lru_cache_add_inactive_or_unevictable(page, vma);
+		lru_cache_add_page_vma(page, vma, false);
 	get_page(page);
 =

 	if (flush) {
diff --git a/mm/swap.c b/mm/swap.c
index f20ed56ebbbf..d6458ee1e9f8 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -306,7 +306,7 @@ void lru_note_cost_page(struct page *page)
 =

 static void __activate_page(struct page *page, struct lruvec *lruvec)
 {
-	if (!PageActive(page) && !PageUnevictable(page)) {
+	if (!PageUnevictable(page) && !page_is_active(page, lruvec)) {
 		int nr_pages =3D thp_nr_pages(page);
 =

 		del_page_from_lru_list(page, lruvec);
@@ -337,7 +337,7 @@ static bool need_activate_page_drain(int cpu)
 static void activate_page_on_lru(struct page *page)
 {
 	page =3D compound_head(page);
-	if (PageLRU(page) && !PageActive(page) && !PageUnevictable(page)) {
+	if (PageLRU(page) && !PageUnevictable(page) && !page_is_active(page, NULL=
)) {
 		struct pagevec *pvec;
 =

 		local_lock(&lru_pvecs.lock);
@@ -431,7 +431,7 @@ void mark_page_accessed(struct page *page)
 		 * this list is never rotated or maintained, so marking an
 		 * evictable page accessed has no effect.
 		 */
-	} else if (!PageActive(page)) {
+	} else if (!page_inc_usage(page)) {
 		activate_page(page);
 		ClearPageReferenced(page);
 		workingset_activation(page);
@@ -467,15 +467,14 @@ void lru_cache_add(struct page *page)
 EXPORT_SYMBOL(lru_cache_add);
 =

 /**
- * lru_cache_add_inactive_or_unevictable
+ * lru_cache_add_page_vma
  * @page:  the page to be added to LRU
  * @vma:   vma in which page is mapped for determining reclaimability
  *
- * Place @page on the inactive or unevictable LRU list, depending on its
- * evictability.
+ * Place @page on an LRU list, depending on its evictability.
  */
-void lru_cache_add_inactive_or_unevictable(struct page *page,
-					 struct vm_area_struct *vma)
+void lru_cache_add_page_vma(struct page *page, struct vm_area_struct *vma,
+			    bool faulting)
 {
 	bool unevictable;
 =

@@ -492,6 +491,11 @@ void lru_cache_add_inactive_or_unevictable(struct page=
 *page,
 		__mod_zone_page_state(page_zone(page), NR_MLOCK, nr_pages);
 		count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
 	}
+
+	/* tell the multigenerational lru that the page is being faulted in */
+	if (lru_gen_enabled() && !unevictable && faulting)
+		SetPageActive(page);
+
 	lru_cache_add(page);
 }
 =

@@ -518,7 +522,7 @@ void lru_cache_add_inactive_or_unevictable(struct page =
*page,
  */
 static void lru_deactivate_file_fn(struct page *page, struct lruvec *lruve=
c)
 {
-	bool active =3D PageActive(page);
+	bool active =3D page_is_active(page, lruvec);
 	int nr_pages =3D thp_nr_pages(page);
 =

 	if (PageUnevictable(page))
@@ -558,7 +562,7 @@ static void lru_deactivate_file_fn(struct page *page, s=
truct lruvec *lruvec)
 =

 static void lru_deactivate_fn(struct page *page, struct lruvec *lruvec)
 {
-	if (PageActive(page) && !PageUnevictable(page)) {
+	if (!PageUnevictable(page) && page_is_active(page, lruvec)) {
 		int nr_pages =3D thp_nr_pages(page);
 =

 		del_page_from_lru_list(page, lruvec);
@@ -672,7 +676,7 @@ void deactivate_file_page(struct page *page)
  */
 void deactivate_page(struct page *page)
 {
-	if (PageLRU(page) && PageActive(page) && !PageUnevictable(page)) {
+	if (PageLRU(page) && !PageUnevictable(page) && page_is_active(page, NULL)=
) {
 		struct pagevec *pvec;
 =

 		local_lock(&lru_pvecs.lock);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index c6041d10a73a..ab3b5ca404fd 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1936,7 +1936,7 @@ static int unuse_pte(struct vm_area_struct *vma, pmd_=
t *pmd,
 		page_add_anon_rmap(page, vma, addr, false);
 	} else { /* ksm created a completely new copy */
 		page_add_new_anon_rmap(page, vma, addr, false);
-		lru_cache_add_inactive_or_unevictable(page, vma);
+		lru_cache_add_page_vma(page, vma, false);
 	}
 	swap_free(entry);
 out:
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 9a3d451402d7..e1d4cd3103b8 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -123,7 +123,7 @@ static int mcopy_atomic_pte(struct mm_struct *dst_mm,
 =

 	inc_mm_counter(dst_mm, MM_ANONPAGES);
 	page_add_new_anon_rmap(page, dst_vma, dst_addr, false);
-	lru_cache_add_inactive_or_unevictable(page, dst_vma);
+	lru_cache_add_page_vma(page, dst_vma, true);
 =

 	set_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte);
 =

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 8559bb94d452..c74ebe2039f7 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -898,9 +898,11 @@ static int __remove_mapping(struct address_space *mapp=
ing, struct page *page,
 =

 	if (PageSwapCache(page)) {
 		swp_entry_t swap =3D { .val =3D page_private(page) };
-		mem_cgroup_swapout(page, swap);
+
+		/* get a shadow entry before page_memcg() is cleared */
 		if (reclaimed && !mapping_exiting(mapping))
 			shadow =3D workingset_eviction(page, target_memcg);
+		mem_cgroup_swapout(page, swap);
 		__delete_from_swap_cache(page, swap, shadow);
 		xa_unlock_irqrestore(&mapping->i_pages, flags);
 		put_swap_page(page, swap);
@@ -4375,6 +4377,93 @@ static bool __maybe_unused seq_is_valid(struct lruve=
c *lruvec)
 	       get_nr_gens(lruvec, 1) <=3D MAX_NR_GENS;
 }
 =

+/*************************************************************************=
*****
+ *                          refault feedback loop
+ *************************************************************************=
*****/
+
+/*
+ * A feedback loop modeled after the PID controller. Currently supports the
+ * proportional (P) and the integral (I) terms; the derivative (D) term ca=
n be
+ * added if necessary. The setpoint (SP) is the desired position; the proc=
ess
+ * variable (PV) is the measured position. The error is the difference bet=
ween
+ * the SP and the PV. A positive error results in a positive control output
+ * correction, which, in our case, is to allow eviction.
+ *
+ * The P term is the current refault rate refaulted/(evicted+activated), w=
hich
+ * has a weight of 1. The I term is the arithmetic mean of the last N refa=
ult
+ * rates, weighted by geometric series 1/2, 1/4, ..., 1/(1<<N).
+ *
+ * Our goal is to make sure upper tiers have similar refault rates as the =
base
+ * tier. That is we try to be fair to all tiers by maintaining similar ref=
ault
+ * rates across them.
+ */
+struct controller_pos {
+	unsigned long refaulted;
+	unsigned long total;
+	int gain;
+};
+
+static void read_controller_pos(struct controller_pos *pos, struct lruvec =
*lruvec,
+				int file, int tier, int gain)
+{
+	struct lrugen *lrugen =3D &lruvec->evictable;
+	int sid =3D sid_from_seq_or_gen(lrugen->min_seq[file]);
+
+	pos->refaulted =3D lrugen->avg_refaulted[file][tier] +
+			 atomic_long_read(&lrugen->refaulted[sid][file][tier]);
+	pos->total =3D lrugen->avg_total[file][tier] +
+		     atomic_long_read(&lrugen->evicted[sid][file][tier]);
+	if (tier)
+		pos->total +=3D lrugen->activated[sid][file][tier - 1];
+	pos->gain =3D gain;
+}
+
+static void reset_controller_pos(struct lruvec *lruvec, int gen, int file)
+{
+	int tier;
+	int sid =3D sid_from_seq_or_gen(gen);
+	struct lrugen *lrugen =3D &lruvec->evictable;
+	bool carryover =3D gen =3D=3D lru_gen_from_seq(lrugen->min_seq[file]);
+
+	if (!carryover && NR_STAT_GENS =3D=3D 1)
+		return;
+
+	for (tier =3D 0; tier < MAX_NR_TIERS; tier++) {
+		if (carryover) {
+			unsigned long sum;
+
+			sum =3D lrugen->avg_refaulted[file][tier] +
+			      atomic_long_read(&lrugen->refaulted[sid][file][tier]);
+			WRITE_ONCE(lrugen->avg_refaulted[file][tier], sum >> 1);
+
+			sum =3D lrugen->avg_total[file][tier] +
+			      atomic_long_read(&lrugen->evicted[sid][file][tier]);
+			if (tier)
+				sum +=3D lrugen->activated[sid][file][tier - 1];
+			WRITE_ONCE(lrugen->avg_total[file][tier], sum >> 1);
+
+			if (NR_STAT_GENS > 1)
+				continue;
+		}
+
+		atomic_long_set(&lrugen->refaulted[sid][file][tier], 0);
+		atomic_long_set(&lrugen->evicted[sid][file][tier], 0);
+		if (tier)
+			WRITE_ONCE(lrugen->activated[sid][file][tier - 1], 0);
+	}
+}
+
+static bool positive_ctrl_err(struct controller_pos *sp, struct controller=
_pos *pv)
+{
+	/*
+	 * Allow eviction if the PV has a limited number of refaulted pages or a
+	 * lower refault rate than the SP.
+	 */
+	return pv->refaulted < SWAP_CLUSTER_MAX ||
+	       pv->refaulted * max(sp->total, 1UL) * sp->gain <=3D
+	       sp->refaulted * max(pv->total, 1UL) * pv->gain;
+}
+
 /*************************************************************************=
*****
  *                          state change
  *************************************************************************=
*****/
diff --git a/mm/workingset.c b/mm/workingset.c
index cd39902c1062..df363f9419fc 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -168,9 +168,9 @@
  * refault distance will immediately activate the refaulting page.
  */
 =

-#define EVICTION_SHIFT	((BITS_PER_LONG - BITS_PER_XA_VALUE) +	\
-			 1 + NODES_SHIFT + MEM_CGROUP_ID_SHIFT)
-#define EVICTION_MASK	(~0UL >> EVICTION_SHIFT)
+#define EVICTION_SHIFT		(BITS_PER_XA_VALUE - MEM_CGROUP_ID_SHIFT - NODES_S=
HIFT)
+#define EVICTION_MASK		(BIT(EVICTION_SHIFT) - 1)
+#define WORKINGSET_WIDTH	1
 =

 /*
  * Eviction timestamps need to be able to cover the full range of
@@ -182,38 +182,139 @@
  */
 static unsigned int bucket_order __read_mostly;
 =

-static void *pack_shadow(int memcgid, pg_data_t *pgdat, unsigned long evic=
tion,
-			 bool workingset)
+static void *pack_shadow(int memcg_id, struct pglist_data *pgdat, unsigned=
 long val)
 {
-	eviction >>=3D bucket_order;
-	eviction &=3D EVICTION_MASK;
-	eviction =3D (eviction << MEM_CGROUP_ID_SHIFT) | memcgid;
-	eviction =3D (eviction << NODES_SHIFT) | pgdat->node_id;
-	eviction =3D (eviction << 1) | workingset;
+	val =3D (val << MEM_CGROUP_ID_SHIFT) | memcg_id;
+	val =3D (val << NODES_SHIFT) | pgdat->node_id;
 =

-	return xa_mk_value(eviction);
+	return xa_mk_value(val);
 }
 =

-static void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
-			  unsigned long *evictionp, bool *workingsetp)
+static unsigned long unpack_shadow(void *shadow, int *memcg_id, struct pgl=
ist_data **pgdat)
 {
-	unsigned long entry =3D xa_to_value(shadow);
-	int memcgid, nid;
-	bool workingset;
-
-	workingset =3D entry & 1;
-	entry >>=3D 1;
-	nid =3D entry & ((1UL << NODES_SHIFT) - 1);
-	entry >>=3D NODES_SHIFT;
-	memcgid =3D entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
-	entry >>=3D MEM_CGROUP_ID_SHIFT;
-
-	*memcgidp =3D memcgid;
-	*pgdat =3D NODE_DATA(nid);
-	*evictionp =3D entry << bucket_order;
-	*workingsetp =3D workingset;
+	unsigned long val =3D xa_to_value(shadow);
+
+	*pgdat =3D NODE_DATA(val & (BIT(NODES_SHIFT) - 1));
+	val >>=3D NODES_SHIFT;
+	*memcg_id =3D val & (BIT(MEM_CGROUP_ID_SHIFT) - 1);
+
+	return val >> MEM_CGROUP_ID_SHIFT;
+}
+
+#ifdef CONFIG_LRU_GEN
+
+#if LRU_GEN_SHIFT + LRU_USAGE_SHIFT >=3D EVICTION_SHIFT
+#error "Please try smaller NODES_SHIFT, NR_LRU_GENS and TIERS_PER_GEN conf=
igurations"
+#endif
+
+static void page_set_usage(struct page *page, int usage)
+{
+	unsigned long old_flags, new_flags;
+
+	VM_BUG_ON(usage > BIT(LRU_USAGE_WIDTH));
+
+	if (!usage)
+		return;
+
+	do {
+		old_flags =3D READ_ONCE(page->flags);
+		new_flags =3D (old_flags & ~LRU_USAGE_MASK) | LRU_TIER_FLAGS |
+			    ((usage - 1UL) << LRU_USAGE_PGOFF);
+		if (old_flags =3D=3D new_flags)
+			break;
+	} while (cmpxchg(&page->flags, old_flags, new_flags) !=3D old_flags);
+}
+
+/* Return a token to be stored in the shadow entry of a page being evicted=
. */
+static void *lru_gen_eviction(struct page *page)
+{
+	int sid, tier;
+	unsigned long token;
+	unsigned long min_seq;
+	struct lruvec *lruvec;
+	struct lrugen *lrugen;
+	int file =3D page_is_file_lru(page);
+	int usage =3D page_tier_usage(page);
+	struct mem_cgroup *memcg =3D page_memcg(page);
+	struct pglist_data *pgdat =3D page_pgdat(page);
+
+	if (!lru_gen_enabled())
+		return NULL;
+
+	lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+	lrugen =3D &lruvec->evictable;
+	min_seq =3D READ_ONCE(lrugen->min_seq[file]);
+	token =3D (min_seq << LRU_USAGE_SHIFT) | usage;
+
+	sid =3D sid_from_seq_or_gen(min_seq);
+	tier =3D lru_tier_from_usage(usage);
+	atomic_long_add(thp_nr_pages(page), &lrugen->evicted[sid][file][tier]);
+
+	return pack_shadow(mem_cgroup_id(memcg), pgdat, token);
+}
+
+/* Account a refaulted page based on the token stored in its shadow entry.=
 */
+static bool lru_gen_refault(struct page *page, void *shadow)
+{
+	int sid, tier, usage;
+	int memcg_id;
+	unsigned long token;
+	unsigned long min_seq;
+	struct lruvec *lruvec;
+	struct lrugen *lrugen;
+	struct pglist_data *pgdat;
+	struct mem_cgroup *memcg;
+	int file =3D page_is_file_lru(page);
+
+	if (!lru_gen_enabled())
+		return false;
+
+	token =3D unpack_shadow(shadow, &memcg_id, &pgdat);
+	if (page_pgdat(page) !=3D pgdat)
+		return true;
+
+	rcu_read_lock();
+	memcg =3D page_memcg_rcu(page);
+	if (mem_cgroup_id(memcg) !=3D memcg_id)
+		goto unlock;
+
+	usage =3D token & (BIT(LRU_USAGE_SHIFT) - 1);
+	token >>=3D LRU_USAGE_SHIFT;
+
+	lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+	lrugen =3D &lruvec->evictable;
+	min_seq =3D READ_ONCE(lrugen->min_seq[file]);
+	if (token !=3D (min_seq & (EVICTION_MASK >> LRU_USAGE_SHIFT)))
+		goto unlock;
+
+	page_set_usage(page, usage);
+
+	sid =3D sid_from_seq_or_gen(min_seq);
+	tier =3D lru_tier_from_usage(usage);
+	atomic_long_add(thp_nr_pages(page), &lrugen->refaulted[sid][file][tier]);
+	inc_lruvec_state(lruvec, WORKINGSET_REFAULT_BASE + file);
+	if (tier)
+		inc_lruvec_state(lruvec, WORKINGSET_RESTORE_BASE + file);
+unlock:
+	rcu_read_unlock();
+
+	return true;
+}
+
+#else /* CONFIG_LRU_GEN */
+
+static void *lru_gen_eviction(struct page *page)
+{
+	return NULL;
 }
 =

+static bool lru_gen_refault(struct page *page, void *shadow)
+{
+	return false;
+}
+
+#endif /* CONFIG_LRU_GEN */
+
 /**
  * workingset_age_nonresident - age non-resident entries as LRU ages
  * @lruvec: the lruvec that was aged
@@ -256,18 +357,25 @@ void *workingset_eviction(struct page *page, struct m=
em_cgroup *target_memcg)
 	unsigned long eviction;
 	struct lruvec *lruvec;
 	int memcgid;
+	void *shadow;
 =

 	/* Page is fully exclusive and pins page's memory cgroup pointer */
 	VM_BUG_ON_PAGE(PageLRU(page), page);
 	VM_BUG_ON_PAGE(page_count(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 =

+	shadow =3D lru_gen_eviction(page);
+	if (shadow)
+		return shadow;
+
 	lruvec =3D mem_cgroup_lruvec(target_memcg, pgdat);
 	/* XXX: target_memcg can be NULL, go through lruvec */
 	memcgid =3D mem_cgroup_id(lruvec_memcg(lruvec));
 	eviction =3D atomic_long_read(&lruvec->nonresident_age);
+	eviction >>=3D bucket_order;
+	eviction =3D (eviction << WORKINGSET_WIDTH) | PageWorkingset(page);
 	workingset_age_nonresident(lruvec, thp_nr_pages(page));
-	return pack_shadow(memcgid, pgdat, eviction, PageWorkingset(page));
+	return pack_shadow(memcgid, pgdat, eviction);
 }
 =

 /**
@@ -294,7 +402,10 @@ void workingset_refault(struct page *page, void *shado=
w)
 	bool workingset;
 	int memcgid;
 =

-	unpack_shadow(shadow, &memcgid, &pgdat, &eviction, &workingset);
+	if (lru_gen_refault(page, shadow))
+		return;
+
+	eviction =3D unpack_shadow(shadow, &memcgid, &pgdat);
 =

 	rcu_read_lock();
 	/*
@@ -318,6 +429,8 @@ void workingset_refault(struct page *page, void *shadow)
 		goto out;
 	eviction_lruvec =3D mem_cgroup_lruvec(eviction_memcg, pgdat);
 	refault =3D atomic_long_read(&eviction_lruvec->nonresident_age);
+	workingset =3D eviction & (BIT(WORKINGSET_WIDTH) - 1);
+	eviction =3D (eviction >> WORKINGSET_WIDTH) << bucket_order;
 =

 	/*
 	 * Calculate the refault distance
@@ -335,7 +448,7 @@ void workingset_refault(struct page *page, void *shadow)
 	 * longest time, so the occasional inappropriate activation
 	 * leading to pressure on the active list is not a problem.
 	 */
-	refault_distance =3D (refault - eviction) & EVICTION_MASK;
+	refault_distance =3D (refault - eviction) & (EVICTION_MASK >> WORKINGSET_=
WIDTH);
 =

 	/*
 	 * The activation decision for this page is made at the level
@@ -594,7 +707,7 @@ static int __init workingset_init(void)
 	unsigned int max_order;
 	int ret;
 =

-	BUILD_BUG_ON(BITS_PER_LONG < EVICTION_SHIFT);
+	BUILD_BUG_ON(EVICTION_SHIFT < WORKINGSET_WIDTH);
 	/*
 	 * Calculate the eviction bucket size to cover the longest
 	 * actionable refault distance, which is currently half of
@@ -602,7 +715,7 @@ static int __init workingset_init(void)
 	 * some more pages@runtime, so keep working with up to
 	 * double the initial memory by using totalram_pages as-is.
 	 */
-	timestamp_bits =3D BITS_PER_LONG - EVICTION_SHIFT;
+	timestamp_bits =3D EVICTION_SHIFT - WORKINGSET_WIDTH;
 	max_order =3D fls_long(totalram_pages() - 1);
 	if (max_order > timestamp_bits)
 		bucket_order =3D max_order - timestamp_bits;
-- =

2.31.1.295.g9ea45b61b8-goog

--===============3339781846242503938==--

