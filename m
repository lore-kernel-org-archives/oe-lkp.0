Content-Type: multipart/mixed; boundary="===============8931492212815722593=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: [patch 2/2 for-4.20] mm, thp: always fault memory with __GFP_NORETRY
Date: Mon, 03 Dec 2018 15:50:21 -0800
Message-ID: <alpine.DEB.2.21.1812031546230.161134@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.21.1812031545080.161134@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8931492212815722593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If memory compaction initially fails to free a hugepage, reclaiming and
retrying compaction is more likely to be harmful rather than beneficial.

For reclaim, it is unlikely that the pages reclaimed will form contiguous
memory the size of a hugepage without unnecessarily reclaiming a lot of
memory unnecessarily.  It is also not guaranteed to be beneficial to
compaction if the reclaimed memory is not accessible to the per-zone
freeing scanner.  For both of these reasons independently, all reclaim
activity may be entirely fruitless.

With these two issues, retrying compaction again is not likely to have a
different result.  It is better to fallback to pages of the native page
size and allow khugepaged to collapse the memory into a hugepage later
when the fragmentation or availability of local memory is better.

If __GFP_NORETRY is set, which the page allocator implementation is
expecting in its comments, this can prevent large amounts of unnecesary
reclaim and swapping activity that can cause performance of other
applications to quickly degrade.

Furthermore, since reclaim is likely to be more harmful than beneficial
for such large order allocations, it is better to fail earlier rather
than trying reclaim of SWAP_CLUSTER_MAX pages which is unlikely to make
a difference for memory compaction to become successful.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c     |  8 ++++----
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c |  3 +--
 include/linux/gfp.h                      |  3 ++-
 mm/huge_memory.c                         |  3 +--
 mm/page_alloc.c                          | 16 ++++++++++++++++
 5 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm=
_page_alloc.c
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -860,8 +860,8 @@ static int ttm_get_pages(struct page **pages, unsigned =
npages, int flags,
 			while (npages >=3D HPAGE_PMD_NR) {
 				gfp_t huge_flags =3D gfp_flags;
 =

-				huge_flags |=3D GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
-					__GFP_KSWAPD_RECLAIM;
+				huge_flags |=3D GFP_TRANSHUGE_LIGHT |
+					      __GFP_KSWAPD_RECLAIM;
 				huge_flags &=3D ~__GFP_MOVABLE;
 				huge_flags &=3D ~__GFP_COMP;
 				p =3D alloc_pages(huge_flags, HPAGE_PMD_ORDER);
@@ -978,13 +978,13 @@ int ttm_page_alloc_init(struct ttm_mem_global *glob, =
unsigned max_pages)
 				  GFP_USER | GFP_DMA32, "uc dma", 0);
 =

 	ttm_page_pool_init_locked(&_manager->wc_pool_huge,
-				  (GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
+				  (GFP_TRANSHUGE_LIGHT |
 				   __GFP_KSWAPD_RECLAIM) &
 				  ~(__GFP_MOVABLE | __GFP_COMP),
 				  "wc huge", order);
 =

 	ttm_page_pool_init_locked(&_manager->uc_pool_huge,
-				  (GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
+				  (GFP_TRANSHUGE_LIGHT |
 				   __GFP_KSWAPD_RECLAIM) &
 				  ~(__GFP_MOVABLE | __GFP_COMP)
 				  , "uc huge", order);
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm=
/ttm_page_alloc_dma.c
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -863,8 +863,7 @@ static gfp_t ttm_dma_pool_gfp_flags(struct ttm_dma_tt *=
ttm_dma, bool huge)
 		gfp_flags |=3D __GFP_ZERO;
 =

 	if (huge) {
-		gfp_flags |=3D GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
-			__GFP_KSWAPD_RECLAIM;
+		gfp_flags |=3D GFP_TRANSHUGE_LIGHT | __GFP_KSWAPD_RECLAIM;
 		gfp_flags &=3D ~__GFP_MOVABLE;
 		gfp_flags &=3D ~__GFP_COMP;
 	}
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -298,7 +298,8 @@ struct vm_area_struct;
 #define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
 #define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
-			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
+			 __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN) & \
+			 ~__GFP_RECLAIM)
 #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)
 =

 /* Convert GFP flags to their corresponding migrate type */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -636,8 +636,7 @@ static inline gfp_t alloc_hugepage_direct_gfpmask(struc=
t vm_area_struct *vma, un
 =

 	/* Always do synchronous compaction */
 	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_hugepa=
ge_flags))
-		return GFP_TRANSHUGE | __GFP_THISNODE |
-		       (vma_madvised ? 0 : __GFP_NORETRY);
+		return GFP_TRANSHUGE | __GFP_THISNODE;
 =

 	/* Kick kcompactd and fail quickly */
 	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_hugepa=
ge_flags))
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4139,6 +4139,22 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int =
order,
 			if (compact_result =3D=3D COMPACT_DEFERRED)
 				goto nopage;
 =

+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+			/*
+			 * When faulting a hugepage, it is very unlikely that
+			 * thrashing the zonelist is going to help compaction in
+			 * freeing such a high-order page.  Reclaim would need
+			 * to free contiguous memory itself or guarantee the
+			 * reclaimed memory is accessible by the compaction
+			 * freeing scanner.  Since there is no such guarantee,
+			 * thrashing is more harmful than beneficial.  It is
+			 * better to simply fail and fallback to native pages.
+			 */
+			if (order =3D=3D HPAGE_PMD_ORDER &&
+					!(current->flags & PF_KTHREAD))
+				goto nopage;
+#endif
+
 			/*
 			 * Looks like reclaim/compaction is worth trying, but
 			 * sync compaction could be very expensive, so keep

--===============8931492212815722593==--

