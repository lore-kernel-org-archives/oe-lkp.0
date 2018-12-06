Content-Type: multipart/mixed; boundary="===============0083092598241817199=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: [patch for-4.20] Revert "mm, thp: consolidate THP gfp handling into alloc_hugepage_direct_gfpmask"
Date: Thu, 06 Dec 2018 14:00:20 -0800
Message-ID: <alpine.DEB.2.21.1812061343240.144733@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.21.1812061341130.144733@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0083092598241817199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This reverts commit 89c83fb539f95491be80cdd5158e6f0ce329e317.

There are a couple of issues with 89c83fb539f9 independent of its partial =

revert in 2f0799a0ffc0 ("mm, thp: restore node-local hugepage =

allocations"):

Firstly, the interaction between alloc_hugepage_direct_gfpmask() and =

alloc_pages_vma() is racy wrt __GFP_THISNODE and MPOL_BIND.  =

alloc_hugepage_direct_gfpmask() makes sure not to set __GFP_THISNODE for =

an MPOL_BIND policy but the policy used in alloc_pages_vma() may not be =

the same for shared vma policies, triggering the WARN_ON_ONCE() in =

policy_node().

Secondly, prior to 89c83fb539f9, alloc_pages_vma() implemented a somewhat =

different policy for hugepage allocations, which were allocated through =

alloc_hugepage_vma().  For hugepage allocations, if the allocating =

process's node is in the set of allowed nodes, allocate with =

__GFP_THISNODE for that node (for MPOL_PREFERRED, use that node with =

__GFP_THISNODE instead).  This was changed for shmem_alloc_hugepage() to =

allow fallback to other nodes in 89c83fb539f9 as it did for new_page() in =

mm/mempolicy.c which is functionally different behavior and removes the =

requirement to only allocate hugepages locally.

The latter should have been reverted as part of 2f0799a0ffc0 as well.

Fully revert 89c83fb539f9 so that hugepage allocation policy is fully =

restored and there is no race between alloc_hugepage_direct_gfpmask() and =

alloc_pages_vma().

Fixes: 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into alloc_huge=
page_direct_gfpmask")
Fixes: 2f0799a0ffc0 ("mm, thp: restore node-local hugepage allocations")
Signed-off-by: David Rientjes <rientjes@google.com>
---
 include/linux/gfp.h | 12 ++++++++----
 mm/huge_memory.c    | 27 +++++++++++++--------------
 mm/mempolicy.c      | 32 +++++++++++++++++++++++++++++---
 mm/shmem.c          |  2 +-
 4 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -510,18 +510,22 @@ alloc_pages(gfp_t gfp_mask, unsigned int order)
 }
 extern struct page *alloc_pages_vma(gfp_t gfp_mask, int order,
 			struct vm_area_struct *vma, unsigned long addr,
-			int node);
+			int node, bool hugepage);
+#define alloc_hugepage_vma(gfp_mask, vma, addr, order) \
+	alloc_pages_vma(gfp_mask, order, vma, addr, numa_node_id(), true)
 #else
 #define alloc_pages(gfp_mask, order) \
 		alloc_pages_node(numa_node_id(), gfp_mask, order)
-#define alloc_pages_vma(gfp_mask, order, vma, addr, node)\
+#define alloc_pages_vma(gfp_mask, order, vma, addr, node, false)\
+	alloc_pages(gfp_mask, order)
+#define alloc_hugepage_vma(gfp_mask, vma, addr, order) \
 	alloc_pages(gfp_mask, order)
 #endif
 #define alloc_page(gfp_mask) alloc_pages(gfp_mask, 0)
 #define alloc_page_vma(gfp_mask, vma, addr)			\
-	alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id())
+	alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id(), false)
 #define alloc_page_vma_node(gfp_mask, vma, addr, node)		\
-	alloc_pages_vma(gfp_mask, 0, vma, addr, node)
+	alloc_pages_vma(gfp_mask, 0, vma, addr, node, false)
 =

 extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
 extern unsigned long get_zeroed_page(gfp_t gfp_mask);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -629,30 +629,30 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct=
 vm_fault *vmf,
  *	    available
  * never: never stall for any thp allocation
  */
-static inline gfp_t alloc_hugepage_direct_gfpmask(struct vm_area_struct *v=
ma, unsigned long addr)
+static inline gfp_t alloc_hugepage_direct_gfpmask(struct vm_area_struct *v=
ma)
 {
 	const bool vma_madvised =3D !!(vma->vm_flags & VM_HUGEPAGE);
-	const gfp_t gfp_mask =3D GFP_TRANSHUGE_LIGHT | __GFP_THISNODE;
 =

 	/* Always do synchronous compaction */
 	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepa=
ge_flags))
-		return GFP_TRANSHUGE | __GFP_THISNODE |
-		       (vma_madvised ? 0 : __GFP_NORETRY);
+		return GFP_TRANSHUGE | (vma_madvised ? 0 : __GFP_NORETRY);
 =

 	/* Kick kcompactd and fail quickly */
 	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepa=
ge_flags))
-		return gfp_mask | __GFP_KSWAPD_RECLAIM;
+		return GFP_TRANSHUGE_LIGHT | __GFP_KSWAPD_RECLAIM;
 =

 	/* Synchronous compaction if madvised, otherwise kick kcompactd */
 	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transparen=
t_hugepage_flags))
-		return gfp_mask | (vma_madvised ? __GFP_DIRECT_RECLAIM :
-						  __GFP_KSWAPD_RECLAIM);
+		return GFP_TRANSHUGE_LIGHT |
+			(vma_madvised ? __GFP_DIRECT_RECLAIM :
+					__GFP_KSWAPD_RECLAIM);
 =

 	/* Only do synchronous compaction if madvised */
 	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_huge=
page_flags))
-		return gfp_mask | (vma_madvised ? __GFP_DIRECT_RECLAIM : 0);
+		return GFP_TRANSHUGE_LIGHT |
+		       (vma_madvised ? __GFP_DIRECT_RECLAIM : 0);
 =

-	return gfp_mask;
+	return GFP_TRANSHUGE_LIGHT;
 }
 =

 /* Caller must hold page table lock. */
@@ -724,8 +724,8 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *=
vmf)
 			pte_free(vma->vm_mm, pgtable);
 		return ret;
 	}
-	gfp =3D alloc_hugepage_direct_gfpmask(vma, haddr);
-	page =3D alloc_pages_vma(gfp, HPAGE_PMD_ORDER, vma, haddr, numa_node_id()=
);
+	gfp =3D alloc_hugepage_direct_gfpmask(vma);
+	page =3D alloc_hugepage_vma(gfp, vma, haddr, HPAGE_PMD_ORDER);
 	if (unlikely(!page)) {
 		count_vm_event(THP_FAULT_FALLBACK);
 		return VM_FAULT_FALLBACK;
@@ -1295,9 +1295,8 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf, =
pmd_t orig_pmd)
 alloc:
 	if (transparent_hugepage_enabled(vma) &&
 	    !transparent_hugepage_debug_cow()) {
-		huge_gfp =3D alloc_hugepage_direct_gfpmask(vma, haddr);
-		new_page =3D alloc_pages_vma(huge_gfp, HPAGE_PMD_ORDER, vma,
-				haddr, numa_node_id());
+		huge_gfp =3D alloc_hugepage_direct_gfpmask(vma);
+		new_page =3D alloc_hugepage_vma(huge_gfp, vma, haddr, HPAGE_PMD_ORDER);
 	} else
 		new_page =3D NULL;
 =

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1116,8 +1116,8 @@ static struct page *new_page(struct page *page, unsig=
ned long start)
 	} else if (PageTransHuge(page)) {
 		struct page *thp;
 =

-		thp =3D alloc_pages_vma(GFP_TRANSHUGE, HPAGE_PMD_ORDER, vma,
-				address, numa_node_id());
+		thp =3D alloc_hugepage_vma(GFP_TRANSHUGE, vma, address,
+					 HPAGE_PMD_ORDER);
 		if (!thp)
 			return NULL;
 		prep_transhuge_page(thp);
@@ -2011,6 +2011,7 @@ static struct page *alloc_page_interleave(gfp_t gfp, =
unsigned order,
  * 	@vma:  Pointer to VMA or NULL if not available.
  *	@addr: Virtual Address of the allocation. Must be inside the VMA.
  *	@node: Which node to prefer for allocation (modulo policy).
+ *	@hugepage: for hugepages try only the preferred node if possible
  *
  * 	This function allocates a page from the kernel page pool and applies
  *	a NUMA policy associated with the VMA or the current process.
@@ -2021,7 +2022,7 @@ static struct page *alloc_page_interleave(gfp_t gfp, =
unsigned order,
  */
 struct page *
 alloc_pages_vma(gfp_t gfp, int order, struct vm_area_struct *vma,
-		unsigned long addr, int node)
+		unsigned long addr, int node, bool hugepage)
 {
 	struct mempolicy *pol;
 	struct page *page;
@@ -2039,6 +2040,31 @@ alloc_pages_vma(gfp_t gfp, int order, struct vm_area=
_struct *vma,
 		goto out;
 	}
 =

+	if (unlikely(IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hugepage)) {
+		int hpage_node =3D node;
+
+		/*
+		 * For hugepage allocation and non-interleave policy which
+		 * allows the current node (or other explicitly preferred
+		 * node) we only try to allocate from the current/preferred
+		 * node and don't fall back to other nodes, as the cost of
+		 * remote accesses would likely offset THP benefits.
+		 *
+		 * If the policy is interleave, or does not allow the current
+		 * node in its nodemask, we allocate the standard way.
+		 */
+		if (pol->mode =3D=3D MPOL_PREFERRED && !(pol->flags & MPOL_F_LOCAL))
+			hpage_node =3D pol->v.preferred_node;
+
+		nmask =3D policy_nodemask(gfp, pol);
+		if (!nmask || node_isset(hpage_node, *nmask)) {
+			mpol_cond_put(pol);
+			page =3D __alloc_pages_node(hpage_node,
+						gfp | __GFP_THISNODE, order);
+			goto out;
+		}
+	}
+
 	nmask =3D policy_nodemask(gfp, pol);
 	preferred_nid =3D policy_node(gfp, pol, node);
 	page =3D __alloc_pages_nodemask(gfp, order, preferred_nid, nmask);
diff --git a/mm/shmem.c b/mm/shmem.c
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1439,7 +1439,7 @@ static struct page *shmem_alloc_hugepage(gfp_t gfp,
 =

 	shmem_pseudo_vma_init(&pvma, info, hindex);
 	page =3D alloc_pages_vma(gfp | __GFP_COMP | __GFP_NORETRY | __GFP_NOWARN,
-			HPAGE_PMD_ORDER, &pvma, 0, numa_node_id());
+			HPAGE_PMD_ORDER, &pvma, 0, numa_node_id(), true);
 	shmem_pseudo_vma_destroy(&pvma);
 	if (page)
 		prep_transhuge_page(page);

--===============0083092598241817199==--

