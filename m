Content-Type: multipart/mixed; boundary="===============8027655112942612575=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v3 10/14] mm: multigenerational lru: aging
Date: Thu, 20 May 2021 00:53:51 -0600
Message-ID: <20210520065355.2736558-11-yuzhao@google.com>
In-Reply-To: <20210520065355.2736558-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8027655112942612575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The aging produces young generations. Given an lruvec, the aging scans
page tables for referenced pages of this lruvec. Upon finding one, the
aging updates its generation number to max_seq. After each round of
scan, the aging increments max_seq. The aging is due when both of
min_seq[2] reaches max_seq-1, assuming both anon and file types are
reclaimable.

The aging uses the following optimizations when scanning page tables:
  1) It will not scan page tables from processes that have been
  sleeping since the last scan.
  2) It will not scan PTE tables under non-leaf PMD entries that do
  not have the accessed bit set, when
  CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
  3) It will not zigzag between the PGD table and the same PMD or PTE
  table spanning multiple VMAs. In other words, it finishes all the
  VMAs within the range of the same PMD or PTE table before it returns
  to the PGD table. This optimizes workloads that have large numbers
  of tiny VMAs, especially when CONFIG_PGTABLE_LEVELS=3D5.

The aging also takes advantage of the spatial locality: pages mapped
around a referenced PTE may also have been referenced. If the rmap
finds the PTE mapping a page under reclaim referenced, it will call a
new function lru_gen_scan_around() to scan the vicinity of this PTE.
And for each additional PTE found referenced, lru_gen_scan_around()
will update the generation number of the page mapped by this PTE.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 include/linux/mmzone.h |   6 +
 mm/rmap.c              |   6 +
 mm/vmscan.c            | 788 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 800 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index e5deec17b4bd..38de59fcbe54 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -294,6 +294,7 @@ enum lruvec_flags {
 };
 =

 struct lruvec;
+struct page_vma_mapped_walk;
 =

 #define LRU_GEN_MASK		((BIT(LRU_GEN_WIDTH) - 1) << LRU_GEN_PGOFF)
 #define LRU_USAGE_MASK		((BIT(LRU_USAGE_WIDTH) - 1) << LRU_USAGE_PGOFF)
@@ -382,6 +383,7 @@ struct lrugen {
 =

 void lru_gen_init_lruvec(struct lruvec *lruvec);
 void lru_gen_set_state(bool enable, bool main, bool swap);
+void lru_gen_scan_around(struct page_vma_mapped_walk *pvmw);
 =

 #else /* CONFIG_LRU_GEN */
 =

@@ -393,6 +395,10 @@ static inline void lru_gen_set_state(bool enable, bool=
 main, bool swap)
 {
 }
 =

+static inline void lru_gen_scan_around(struct page_vma_mapped_walk *pvmw)
+{
+}
+
 #endif /* CONFIG_LRU_GEN */
 =

 struct lruvec {
diff --git a/mm/rmap.c b/mm/rmap.c
index 693a610e181d..985cf4ebd03c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -72,6 +72,7 @@
 #include <linux/page_idle.h>
 #include <linux/memremap.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/mm_inline.h>
 =

 #include <asm/tlbflush.h>
 =

@@ -792,6 +793,11 @@ static bool page_referenced_one(struct page *page, str=
uct vm_area_struct *vma,
 		}
 =

 		if (pvmw.pte) {
+			/* the multigenerational lru exploits the spatial locality */
+			if (lru_gen_enabled() && pte_young(*pvmw.pte)) {
+				lru_gen_scan_around(&pvmw);
+				referenced++;
+			}
 			if (ptep_clear_flush_young_notify(vma, address,
 						pvmw.pte)) {
 				/*
diff --git a/mm/vmscan.c b/mm/vmscan.c
index d93d2272e475..837d5e6a821e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -50,6 +50,8 @@
 #include <linux/dax.h>
 #include <linux/psi.h>
 #include <linux/memory.h>
+#include <linux/pagewalk.h>
+#include <linux/shmem_fs.h>
 =

 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -3186,6 +3188,788 @@ static bool get_next_mm(struct mm_walk_args *args, =
struct mm_struct **iter)
 	return last;
 }
 =

+/*************************************************************************=
*****
+ *                          the aging
+ *************************************************************************=
*****/
+
+static void update_batch_size(struct page *page, int old_gen, int new_gen,
+			      struct mm_walk_args *args)
+{
+	int type =3D page_is_file_lru(page);
+	int zone =3D page_zonenum(page);
+	int delta =3D thp_nr_pages(page);
+
+	VM_BUG_ON(old_gen >=3D MAX_NR_GENS);
+	VM_BUG_ON(new_gen >=3D MAX_NR_GENS);
+
+	args->batch_size++;
+
+	args->nr_pages[old_gen][type][zone] -=3D delta;
+	args->nr_pages[new_gen][type][zone] +=3D delta;
+}
+
+static void reset_batch_size(struct lruvec *lruvec, struct mm_walk_args *a=
rgs)
+{
+	int gen, type, zone;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	if (!args->batch_size)
+		return;
+
+	args->batch_size =3D 0;
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	for_each_gen_type_zone(gen, type, zone) {
+		enum lru_list lru =3D type * LRU_FILE;
+		int total =3D args->nr_pages[gen][type][zone];
+
+		if (!total)
+			continue;
+
+		args->nr_pages[gen][type][zone] =3D 0;
+		WRITE_ONCE(lrugen->sizes[gen][type][zone],
+			   lrugen->sizes[gen][type][zone] + total);
+
+		if (lru_gen_is_active(lruvec, gen))
+			lru +=3D LRU_ACTIVE;
+		update_lru_size(lruvec, lru, zone, total);
+	}
+
+	spin_unlock_irq(&lruvec->lru_lock);
+}
+
+static int page_update_gen(struct page *page, int new_gen)
+{
+	int old_gen;
+	unsigned long old_flags, new_flags;
+
+	VM_BUG_ON(new_gen >=3D MAX_NR_GENS);
+
+	do {
+		old_flags =3D READ_ONCE(page->flags);
+
+		old_gen =3D ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
+		if (old_gen < 0) {
+			new_flags =3D old_flags | BIT(PG_referenced);
+			continue;
+		}
+
+		new_flags =3D (old_flags & ~(LRU_GEN_MASK | LRU_USAGE_MASK | LRU_TIER_FL=
AGS)) |
+			    ((new_gen + 1UL) << LRU_GEN_PGOFF);
+	} while (new_flags !=3D old_flags &&
+		 cmpxchg(&page->flags, old_flags, new_flags) !=3D old_flags);
+
+	return old_gen;
+}
+
+static int should_skip_vma(unsigned long start, unsigned long end, struct =
mm_walk *walk)
+{
+	struct address_space *mapping;
+	struct vm_area_struct *vma =3D walk->vma;
+	struct mm_walk_args *args =3D walk->private;
+
+	if (!vma_is_accessible(vma) || is_vm_hugetlb_page(vma) ||
+	    (vma->vm_flags & (VM_LOCKED | VM_SPECIAL)))
+		return true;
+
+	if (vma_is_anonymous(vma))
+		return !args->swappiness;
+
+	if (WARN_ON_ONCE(!vma->vm_file || !vma->vm_file->f_mapping))
+		return true;
+
+	mapping =3D vma->vm_file->f_mapping;
+	if (!mapping->a_ops->writepage)
+		return true;
+
+	return (shmem_mapping(mapping) && !args->swappiness) || mapping_unevictab=
le(mapping);
+}
+
+/*
+ * Some userspace memory allocators create many single-page VMAs. So inste=
ad of
+ * returning back to the PGD table for each of such VMAs, we finish at lea=
st an
+ * entire PMD table and therefore avoid many zigzags. This optimizes page =
table
+ * walks for workloads that have large numbers of tiny VMAs.
+ *
+ * We scan PMD tables in two passes. The first pass reaches to PTE tables =
and
+ * doesn't take the PMD lock. The second pass clears the accessed bit on P=
MD
+ * entries and needs to take the PMD lock. The second pass is only done on=
 the
+ * PMD entries that first pass has found the accessed bit is set, namely
+ *   1) leaf entries mapping huge pages from the node under reclaim, and
+ *   2) non-leaf entries whose leaf entries only map pages from the node u=
nder
+ *   reclaim, when CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
+ */
+static bool get_next_vma(struct mm_walk *walk, unsigned long mask, unsigne=
d long size,
+			 unsigned long *start, unsigned long *end)
+{
+	unsigned long next =3D round_up(*end, size);
+	struct mm_walk_args *args =3D walk->private;
+
+	VM_BUG_ON(mask & size);
+	VM_BUG_ON(*start >=3D *end);
+	VM_BUG_ON((next & mask) !=3D (*start & mask));
+
+	while (walk->vma) {
+		if (next >=3D walk->vma->vm_end) {
+			walk->vma =3D walk->vma->vm_next;
+			continue;
+		}
+
+		if ((next & mask) !=3D (walk->vma->vm_start & mask))
+			return false;
+
+		if (should_skip_vma(walk->vma->vm_start, walk->vma->vm_end, walk)) {
+			walk->vma =3D walk->vma->vm_next;
+			continue;
+		}
+
+		*start =3D max(next, walk->vma->vm_start);
+		next =3D (next | ~mask) + 1;
+		/* rounded-up boundaries can wrap to 0 */
+		*end =3D next && next < walk->vma->vm_end ? next : walk->vma->vm_end;
+
+		args->mm_stats[MM_VMA_INTERVAL]++;
+
+		return true;
+	}
+
+	return false;
+}
+
+static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long =
end,
+			   struct mm_walk *walk)
+{
+	int i;
+	pte_t *pte;
+	spinlock_t *ptl;
+	unsigned long addr;
+	int remote =3D 0;
+	struct mm_walk_args *args =3D walk->private;
+	int old_gen, new_gen =3D lru_gen_from_seq(args->max_seq);
+
+	VM_BUG_ON(pmd_leaf(*pmd));
+
+	pte =3D pte_offset_map_lock(walk->mm, pmd, start & PMD_MASK, &ptl);
+	arch_enter_lazy_mmu_mode();
+restart:
+	for (i =3D pte_index(start), addr =3D start; addr !=3D end; i++, addr +=
=3D PAGE_SIZE) {
+		struct page *page;
+		unsigned long pfn =3D pte_pfn(pte[i]);
+
+		if (!pte_present(pte[i]) || is_zero_pfn(pfn)) {
+			args->mm_stats[MM_LEAF_HOLE]++;
+			continue;
+		}
+
+		if (WARN_ON_ONCE(pte_devmap(pte[i]) || pte_special(pte[i])))
+			continue;
+
+		if (!pte_young(pte[i])) {
+			args->mm_stats[MM_LEAF_OLD]++;
+			continue;
+		}
+
+		VM_BUG_ON(!pfn_valid(pfn));
+		if (pfn < args->start_pfn || pfn >=3D args->end_pfn) {
+			args->mm_stats[MM_LEAF_OTHER_NODE]++;
+			remote++;
+			continue;
+		}
+
+		page =3D compound_head(pfn_to_page(pfn));
+		if (page_to_nid(page) !=3D args->node_id) {
+			args->mm_stats[MM_LEAF_OTHER_NODE]++;
+			remote++;
+			continue;
+		}
+
+		if (page_memcg_rcu(page) !=3D args->memcg) {
+			args->mm_stats[MM_LEAF_OTHER_MEMCG]++;
+			continue;
+		}
+
+		VM_BUG_ON(addr < walk->vma->vm_start || addr >=3D walk->vma->vm_end);
+		if (!ptep_test_and_clear_young(walk->vma, addr, pte + i))
+			continue;
+
+		if (pte_dirty(pte[i]) && !PageDirty(page) &&
+		    !(PageAnon(page) && PageSwapBacked(page) && !PageSwapCache(page))) {
+			set_page_dirty(page);
+			args->mm_stats[MM_LEAF_DIRTY]++;
+		}
+
+		old_gen =3D page_update_gen(page, new_gen);
+		if (old_gen >=3D 0 && old_gen !=3D new_gen)
+			update_batch_size(page, old_gen, new_gen, args);
+		args->mm_stats[MM_LEAF_YOUNG]++;
+	}
+
+	if (i < PTRS_PER_PTE && get_next_vma(walk, PMD_MASK, PAGE_SIZE, &start, &=
end))
+		goto restart;
+
+	arch_leave_lazy_mmu_mode();
+	pte_unmap_unlock(pte, ptl);
+
+	return IS_ENABLED(CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG) && !remote;
+}
+
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HAVE_ARCH_PAREN=
T_PMD_YOUNG)
+static void __walk_pmd_range(pud_t *pud, unsigned long start,
+			     struct vm_area_struct *vma, struct mm_walk *walk)
+{
+	int i;
+	pmd_t *pmd;
+	spinlock_t *ptl;
+	struct mm_walk_args *args =3D walk->private;
+	int old_gen, new_gen =3D lru_gen_from_seq(args->max_seq);
+
+	VM_BUG_ON(pud_leaf(*pud));
+
+	start &=3D PUD_MASK;
+	pmd =3D pmd_offset(pud, start);
+	ptl =3D pmd_lock(walk->mm, pmd);
+	arch_enter_lazy_mmu_mode();
+
+	for_each_set_bit(i, args->bitmap, PTRS_PER_PMD) {
+		struct page *page;
+		unsigned long pfn =3D pmd_pfn(pmd[i]);
+		unsigned long addr =3D start + i * PMD_SIZE;
+
+		if (!pmd_present(pmd[i]) || is_huge_zero_pmd(pmd[i])) {
+			args->mm_stats[MM_LEAF_HOLE]++;
+			continue;
+		}
+
+		if (WARN_ON_ONCE(pmd_devmap(pmd[i])))
+			continue;
+
+		if (!pmd_young(pmd[i])) {
+			args->mm_stats[MM_LEAF_OLD]++;
+			continue;
+		}
+
+		if (!pmd_trans_huge(pmd[i])) {
+			if (IS_ENABLED(CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG) &&
+			    pmdp_test_and_clear_young(vma, addr, pmd + i))
+				args->mm_stats[MM_NONLEAF_YOUNG]++;
+			continue;
+		}
+
+		VM_BUG_ON(!pfn_valid(pfn));
+		if (pfn < args->start_pfn || pfn >=3D args->end_pfn) {
+			args->mm_stats[MM_LEAF_OTHER_NODE]++;
+			continue;
+		}
+
+		page =3D pfn_to_page(pfn);
+		VM_BUG_ON_PAGE(PageTail(page), page);
+		if (page_to_nid(page) !=3D args->node_id) {
+			args->mm_stats[MM_LEAF_OTHER_NODE]++;
+			continue;
+		}
+
+		if (page_memcg_rcu(page) !=3D args->memcg) {
+			args->mm_stats[MM_LEAF_OTHER_MEMCG]++;
+			continue;
+		}
+
+		VM_BUG_ON(addr < vma->vm_start || addr >=3D vma->vm_end);
+		if (!pmdp_test_and_clear_young(vma, addr, pmd + i))
+			continue;
+
+		if (pmd_dirty(pmd[i]) && !PageDirty(page) &&
+		    !(PageAnon(page) && PageSwapBacked(page) && !PageSwapCache(page))) {
+			set_page_dirty(page);
+			args->mm_stats[MM_LEAF_DIRTY]++;
+		}
+
+		old_gen =3D page_update_gen(page, new_gen);
+		if (old_gen >=3D 0 && old_gen !=3D new_gen)
+			update_batch_size(page, old_gen, new_gen, args);
+		args->mm_stats[MM_LEAF_YOUNG]++;
+	}
+
+	arch_leave_lazy_mmu_mode();
+	spin_unlock(ptl);
+
+	bitmap_zero(args->bitmap, PTRS_PER_PMD);
+}
+#else
+static void __walk_pmd_range(pud_t *pud, unsigned long start,
+			     struct vm_area_struct *vma, struct mm_walk *walk)
+{
+}
+#endif
+
+static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long =
end,
+			   struct mm_walk *walk)
+{
+	int i;
+	pmd_t *pmd;
+	unsigned long next;
+	unsigned long addr;
+	struct vm_area_struct *vma;
+	int leaf =3D 0;
+	int nonleaf =3D 0;
+	struct mm_walk_args *args =3D walk->private;
+
+	VM_BUG_ON(pud_leaf(*pud));
+
+	pmd =3D pmd_offset(pud, start & PUD_MASK);
+restart:
+	vma =3D walk->vma;
+	for (i =3D pmd_index(start), addr =3D start; addr !=3D end; i++, addr =3D=
 next) {
+		pmd_t val =3D pmd_read_atomic(pmd + i);
+
+		/* for pmd_read_atomic() */
+		barrier();
+
+		next =3D pmd_addr_end(addr, end);
+
+		if (!pmd_present(val)) {
+			args->mm_stats[MM_LEAF_HOLE]++;
+			continue;
+		}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+		if (pmd_trans_huge(val)) {
+			unsigned long pfn =3D pmd_pfn(val);
+
+			if (is_huge_zero_pmd(val)) {
+				args->mm_stats[MM_LEAF_HOLE]++;
+				continue;
+			}
+
+			if (!pmd_young(val)) {
+				args->mm_stats[MM_LEAF_OLD]++;
+				continue;
+			}
+
+			if (pfn < args->start_pfn || pfn >=3D args->end_pfn) {
+				args->mm_stats[MM_LEAF_OTHER_NODE]++;
+				continue;
+			}
+
+			__set_bit(i, args->bitmap);
+			leaf++;
+			continue;
+		}
+#endif
+
+#ifdef CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG
+		if (!pmd_young(val)) {
+			args->mm_stats[MM_NONLEAF_OLD]++;
+			continue;
+		}
+#endif
+		if (walk_pte_range(&val, addr, next, walk)) {
+			__set_bit(i, args->bitmap);
+			nonleaf++;
+		}
+	}
+
+	if (leaf) {
+		__walk_pmd_range(pud, start, vma, walk);
+		leaf =3D nonleaf =3D 0;
+	}
+
+	if (i < PTRS_PER_PMD && get_next_vma(walk, PUD_MASK, PMD_SIZE, &start, &e=
nd))
+		goto restart;
+
+	if (nonleaf)
+		__walk_pmd_range(pud, start, vma, walk);
+}
+
+static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long e=
nd,
+			  struct mm_walk *walk)
+{
+	int i;
+	pud_t *pud;
+	unsigned long addr;
+	unsigned long next;
+	struct mm_walk_args *args =3D walk->private;
+
+	VM_BUG_ON(p4d_leaf(*p4d));
+
+	pud =3D pud_offset(p4d, start & P4D_MASK);
+restart:
+	for (i =3D pud_index(start), addr =3D start; addr !=3D end; i++, addr =3D=
 next) {
+		pud_t val =3D READ_ONCE(pud[i]);
+
+		next =3D pud_addr_end(addr, end);
+
+		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
+			continue;
+
+		walk_pmd_range(&val, addr, next, walk);
+
+		if (args->batch_size >=3D MAX_BATCH_SIZE) {
+			end =3D (addr | ~PUD_MASK) + 1;
+			goto done;
+		}
+	}
+
+	if (i < PTRS_PER_PUD && get_next_vma(walk, P4D_MASK, PUD_SIZE, &start, &e=
nd))
+		goto restart;
+
+	end =3D round_up(end, P4D_SIZE);
+done:
+	/* rounded-up boundaries can wrap to 0 */
+	args->next_addr =3D end && walk->vma ? max(end, walk->vma->vm_start) : 0;
+
+	return -EAGAIN;
+}
+
+static void walk_mm(struct mm_walk_args *args, struct mm_struct *mm)
+{
+	static const struct mm_walk_ops mm_walk_ops =3D {
+		.test_walk =3D should_skip_vma,
+		.p4d_entry =3D walk_pud_range,
+	};
+
+	int err;
+	struct mem_cgroup *memcg =3D args->memcg;
+	struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, NODE_DATA(args->node_i=
d));
+
+	args->next_addr =3D FIRST_USER_ADDRESS;
+
+	do {
+		unsigned long start =3D args->next_addr;
+		unsigned long end =3D mm->highest_vm_end;
+
+		err =3D -EBUSY;
+
+		preempt_disable();
+		rcu_read_lock();
+
+#ifdef CONFIG_MEMCG
+		if (memcg && atomic_read(&memcg->moving_account)) {
+			args->mm_stats[MM_LOCK_CONTENTION]++;
+			goto contended;
+		}
+#endif
+		if (!mmap_read_trylock(mm)) {
+			args->mm_stats[MM_LOCK_CONTENTION]++;
+			goto contended;
+		}
+
+		err =3D walk_page_range(mm, start, end, &mm_walk_ops, args);
+
+		mmap_read_unlock(mm);
+
+		reset_batch_size(lruvec, args);
+contended:
+		rcu_read_unlock();
+		preempt_enable();
+
+		cond_resched();
+	} while (err =3D=3D -EAGAIN && args->next_addr &&
+		 !mm_is_oom_victim(mm) && !mm_has_migrated(mm, memcg));
+}
+
+static void page_inc_gen(struct page *page, struct lruvec *lruvec, bool fr=
ont)
+{
+	int old_gen, new_gen;
+	unsigned long old_flags, new_flags;
+	int type =3D page_is_file_lru(page);
+	int zone =3D page_zonenum(page);
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	old_gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
+
+	do {
+		old_flags =3D READ_ONCE(page->flags);
+
+		/* in case the aging has updated old_gen */
+		new_gen =3D ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
+		VM_BUG_ON_PAGE(new_gen < 0, page);
+		if (new_gen >=3D 0 && new_gen !=3D old_gen)
+			goto sort;
+
+		new_gen =3D (old_gen + 1) % MAX_NR_GENS;
+
+		new_flags =3D (old_flags & ~(LRU_GEN_MASK | LRU_USAGE_MASK | LRU_TIER_FL=
AGS)) |
+			    ((new_gen + 1UL) << LRU_GEN_PGOFF);
+		/* mark the page for reclaim if it's pending writeback */
+		if (front)
+			new_flags |=3D BIT(PG_reclaim);
+	} while (cmpxchg(&page->flags, old_flags, new_flags) !=3D old_flags);
+
+	lru_gen_update_size(page, lruvec, old_gen, new_gen);
+sort:
+	if (front)
+		list_move(&page->lru, &lrugen->lists[new_gen][type][zone]);
+	else
+		list_move_tail(&page->lru, &lrugen->lists[new_gen][type][zone]);
+}
+
+static bool try_inc_min_seq(struct lruvec *lruvec, int type)
+{
+	int gen, zone;
+	bool success =3D false;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	VM_BUG_ON(!seq_is_valid(lruvec));
+
+	while (get_nr_gens(lruvec, type) > MIN_NR_GENS) {
+		gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
+
+		for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
+			if (!list_empty(&lrugen->lists[gen][type][zone]))
+				return success;
+		}
+
+		reset_controller_pos(lruvec, gen, type);
+		WRITE_ONCE(lrugen->min_seq[type], lrugen->min_seq[type] + 1);
+
+		success =3D true;
+	}
+
+	return success;
+}
+
+static bool inc_min_seq(struct lruvec *lruvec, int type)
+{
+	int gen, zone;
+	int batch_size =3D 0;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	VM_BUG_ON(!seq_is_valid(lruvec));
+
+	if (get_nr_gens(lruvec, type) !=3D MAX_NR_GENS)
+		return true;
+
+	gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
+
+	for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
+		struct list_head *head =3D &lrugen->lists[gen][type][zone];
+
+		while (!list_empty(head)) {
+			struct page *page =3D lru_to_page(head);
+
+			VM_BUG_ON_PAGE(PageTail(page), page);
+			VM_BUG_ON_PAGE(PageUnevictable(page), page);
+			VM_BUG_ON_PAGE(PageActive(page), page);
+			VM_BUG_ON_PAGE(page_is_file_lru(page) !=3D type, page);
+			VM_BUG_ON_PAGE(page_zonenum(page) !=3D zone, page);
+
+			prefetchw_prev_lru_page(page, head, flags);
+
+			page_inc_gen(page, lruvec, false);
+
+			if (++batch_size =3D=3D MAX_BATCH_SIZE)
+				return false;
+		}
+
+		VM_BUG_ON(lrugen->sizes[gen][type][zone]);
+	}
+
+	reset_controller_pos(lruvec, gen, type);
+	WRITE_ONCE(lrugen->min_seq[type], lrugen->min_seq[type] + 1);
+
+	return true;
+}
+
+static void inc_max_seq(struct lruvec *lruvec)
+{
+	int gen, type, zone;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	VM_BUG_ON(!seq_is_valid(lruvec));
+
+	for (type =3D 0; type < ANON_AND_FILE; type++) {
+		if (try_inc_min_seq(lruvec, type))
+			continue;
+
+		while (!inc_min_seq(lruvec, type)) {
+			spin_unlock_irq(&lruvec->lru_lock);
+			cond_resched();
+			spin_lock_irq(&lruvec->lru_lock);
+		}
+	}
+
+	gen =3D lru_gen_from_seq(lrugen->max_seq - 1);
+	for_each_type_zone(type, zone) {
+		enum lru_list lru =3D type * LRU_FILE;
+		long total =3D lrugen->sizes[gen][type][zone];
+
+		if (!total)
+			continue;
+
+		WARN_ON_ONCE(total !=3D (int)total);
+
+		update_lru_size(lruvec, lru, zone, total);
+		update_lru_size(lruvec, lru + LRU_ACTIVE, zone, -total);
+	}
+
+	gen =3D lru_gen_from_seq(lrugen->max_seq + 1);
+	for_each_type_zone(type, zone) {
+		VM_BUG_ON(lrugen->sizes[gen][type][zone]);
+		VM_BUG_ON(!list_empty(&lrugen->lists[gen][type][zone]));
+	}
+
+	for (type =3D 0; type < ANON_AND_FILE; type++)
+		reset_controller_pos(lruvec, gen, type);
+
+	WRITE_ONCE(lrugen->timestamps[gen], jiffies);
+	/* make sure all preceding modifications appear first */
+	smp_store_release(&lrugen->max_seq, lrugen->max_seq + 1);
+
+	spin_unlock_irq(&lruvec->lru_lock);
+}
+
+/* Main function used by the foreground, the background and the user-trigg=
ered aging. */
+static bool walk_mm_list(struct lruvec *lruvec, unsigned long max_seq,
+			 struct scan_control *sc, int swappiness, struct mm_walk_args *args)
+{
+	bool last;
+	bool alloc =3D !args;
+	struct mm_struct *mm =3D NULL;
+	struct lrugen *lrugen =3D &lruvec->evictable;
+	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
+	int nid =3D pgdat->node_id;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
+
+	VM_BUG_ON(max_seq > READ_ONCE(lrugen->max_seq));
+
+	if (alloc) {
+		args =3D kvzalloc_node(size_of_mm_walk_args(), GFP_KERNEL, nid);
+		if (WARN_ON_ONCE(!args))
+			return false;
+	}
+
+	args->memcg =3D memcg;
+	args->max_seq =3D max_seq;
+	args->start_pfn =3D pgdat->node_start_pfn;
+	args->end_pfn =3D pgdat_end_pfn(pgdat);
+	args->node_id =3D nid;
+	args->swappiness =3D swappiness;
+
+	do {
+		last =3D get_next_mm(args, &mm);
+		if (mm)
+			walk_mm(args, mm);
+
+		cond_resched();
+	} while (mm);
+
+	if (alloc)
+		kvfree(args);
+
+	if (!last) {
+		/* the foreground aging prefers not to wait */
+		if (!current_is_kswapd() && sc->priority < DEF_PRIORITY - 2)
+			wait_event_killable(mm_list->nodes[nid].wait,
+					    max_seq < READ_ONCE(lrugen->max_seq));
+
+		return max_seq < READ_ONCE(lrugen->max_seq);
+	}
+
+	VM_BUG_ON(max_seq !=3D READ_ONCE(lrugen->max_seq));
+
+	inc_max_seq(lruvec);
+
+	/* order against inc_max_seq() */
+	smp_mb();
+	/* either we see any waiters or they will see updated max_seq */
+	if (waitqueue_active(&mm_list->nodes[nid].wait))
+		wake_up_all(&mm_list->nodes[nid].wait);
+
+	wakeup_flusher_threads(WB_REASON_VMSCAN);
+
+	return true;
+}
+
+void lru_gen_scan_around(struct page_vma_mapped_walk *pvmw)
+{
+	int i;
+	pte_t *pte;
+	int old_gen, new_gen;
+	unsigned long start;
+	unsigned long end;
+	unsigned long addr;
+	struct lruvec *lruvec;
+	struct mem_cgroup *memcg;
+	struct pglist_data *pgdat =3D page_pgdat(pvmw->page);
+	unsigned long bitmap[BITS_TO_LONGS(SWAP_CLUSTER_MAX * 2)] =3D {};
+
+	lockdep_assert_held(pvmw->ptl);
+	VM_BUG_ON_PAGE(PageTail(pvmw->page), pvmw->page);
+
+	start =3D max(pvmw->address & PMD_MASK, pvmw->vma->vm_start);
+	end =3D pmd_addr_end(pvmw->address, pvmw->vma->vm_end);
+
+	if (end - start > SWAP_CLUSTER_MAX * 2 * PAGE_SIZE) {
+		if (pvmw->address - start < SWAP_CLUSTER_MAX * PAGE_SIZE)
+			end =3D start + SWAP_CLUSTER_MAX * 2 * PAGE_SIZE;
+		else if (end - pvmw->address < SWAP_CLUSTER_MAX * PAGE_SIZE)
+			start =3D end - SWAP_CLUSTER_MAX * 2 * PAGE_SIZE;
+		else {
+			start =3D pvmw->address - SWAP_CLUSTER_MAX * PAGE_SIZE;
+			end =3D pvmw->address + SWAP_CLUSTER_MAX * PAGE_SIZE;
+		}
+	}
+
+	pte =3D pvmw->pte - (pvmw->address - start) / PAGE_SIZE;
+
+	arch_enter_lazy_mmu_mode();
+
+	lock_page_memcg(pvmw->page);
+	lruvec =3D lock_page_lruvec_irq(pvmw->page);
+
+	memcg =3D page_memcg(pvmw->page);
+	new_gen =3D lru_gen_from_seq(lruvec->evictable.max_seq);
+
+	for (i =3D 0, addr =3D start; addr !=3D end; i++, addr +=3D PAGE_SIZE) {
+		struct page *page;
+		unsigned long pfn =3D pte_pfn(pte[i]);
+
+		if (!pte_present(pte[i]) || is_zero_pfn(pfn))
+			continue;
+
+		if (WARN_ON_ONCE(pte_devmap(pte[i]) || pte_special(pte[i])))
+			continue;
+
+		if (!pte_young(pte[i]))
+			continue;
+
+		VM_BUG_ON(!pfn_valid(pfn));
+		if (pfn < pgdat->node_start_pfn || pfn >=3D pgdat_end_pfn(pgdat))
+			continue;
+
+		page =3D compound_head(pfn_to_page(pfn));
+		if (page_to_nid(page) !=3D pgdat->node_id)
+			continue;
+
+		if (page_memcg_rcu(page) !=3D memcg)
+			continue;
+
+		VM_BUG_ON(addr < pvmw->vma->vm_start || addr >=3D pvmw->vma->vm_end);
+		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
+			continue;
+
+		if (pte_dirty(pte[i]) && !PageDirty(page) &&
+		    !(PageAnon(page) && PageSwapBacked(page) && !PageSwapCache(page)))
+			__set_bit(i, bitmap);
+
+		old_gen =3D page_update_gen(page, new_gen);
+		if (old_gen >=3D 0 && old_gen !=3D new_gen)
+			lru_gen_update_size(page, lruvec, old_gen, new_gen);
+	}
+
+	unlock_page_lruvec_irq(lruvec);
+	unlock_page_memcg(pvmw->page);
+
+	arch_leave_lazy_mmu_mode();
+
+	for_each_set_bit(i, bitmap, SWAP_CLUSTER_MAX * 2)
+		set_page_dirty(pte_page(pte[i]));
+}
+
 /*************************************************************************=
*****
  *                          state change
  *************************************************************************=
*****/
@@ -3415,6 +4199,10 @@ static int __init init_lru_gen(void)
 	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH) <=3D MAX_NR_GENS);
 	BUILD_BUG_ON(sizeof(MM_STAT_CODES) !=3D NR_MM_STATS + 1);
 =

+	VM_BUG_ON(PMD_SIZE / PAGE_SIZE !=3D PTRS_PER_PTE);
+	VM_BUG_ON(PUD_SIZE / PMD_SIZE !=3D PTRS_PER_PMD);
+	VM_BUG_ON(P4D_SIZE / PUD_SIZE !=3D PTRS_PER_PUD);
+
 	if (mem_cgroup_disabled()) {
 		global_mm_list =3D alloc_mm_list();
 		if (WARN_ON_ONCE(!global_mm_list))
-- =

2.31.1.751.gd2f1c929bd-goog

--===============8027655112942612575==--

