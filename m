Content-Type: multipart/mixed; boundary="===============9213012540317852207=="
MIME-Version: 1.0
From: Tobin C. Harding <tobin@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH 1/1] slob: Only use list functions when safe to do so
Date: Tue, 02 Apr 2019 14:29:57 +1100
Message-ID: <20190402032957.26249-2-tobin@kernel.org>
In-Reply-To: <20190402032957.26249-1-tobin@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9213012540317852207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently we call (indirectly) list_del() then we manually try to combat
the fact that the list may be in an undefined state by getting 'prev'
and 'next' pointers in a somewhat contrived manner.  It is hard to
verify that this works for all initial states of the list.  Clearly the
author (me) got it wrong the first time because the 0day kernel testing
robot managed to crash the kernel thanks to this code.

All this is done in order to do an optimisation aimed at preventing
fragmentation at the start of a slab.  We can just skip this
optimisation any time the list is put into an undefined state since this
only occurs when an allocation completely fills the slab and in this
case the optimisation is unnecessary since we have not fragmented the slab
by this allocation.

Change the page pointer passed to slob_alloc_page() to be a double
pointer so that we can set it to NULL to indicate that the page was
removed from the list.  Skip the optimisation if the page was removed.

Found thanks to the kernel test robot, email subject:

	340d3d6178 ("mm/slob.c: respect list_head abstraction layer"):  kernel BUG=
 at lib/list_debug.c:31!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 mm/slob.c | 50 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/mm/slob.c b/mm/slob.c
index 21af3fdb457a..c543da10df45 100644
--- a/mm/slob.c
+++ b/mm/slob.c
@@ -213,10 +213,18 @@ static void slob_free_pages(void *b, int order)
 }
 =

 /*
- * Allocate a slob block within a given slob_page sp.
+ * slob_page_alloc() - Allocate a slob block within a given slob_page sp.
+ * @spp: Page to look in, return parameter.
+ * @size: Size of the allocation.
+ * @align: Allocation alignment.
+ *
+ * Tries to find a chunk of memory at least @size within page.  If the
+ * allocation fills up page then page is removed from list, in this case
+ * *spp will be set to %NULL to signal that list removal occurred.
  */
-static void *slob_page_alloc(struct page *sp, size_t size, int align)
+static void *slob_page_alloc(struct page **spp, size_t size, int align)
 {
+	struct page *sp =3D *spp;
 	slob_t *prev, *cur, *aligned =3D NULL;
 	int delta =3D 0, units =3D SLOB_UNITS(size);
 =

@@ -254,8 +262,11 @@ static void *slob_page_alloc(struct page *sp, size_t s=
ize, int align)
 			}
 =

 			sp->units -=3D units;
-			if (!sp->units)
+			if (!sp->units) {
 				clear_slob_page_free(sp);
+				/* Signal that page was removed from list. */
+				*spp =3D NULL;
+			}
 			return cur;
 		}
 		if (slob_last(cur))
@@ -268,7 +279,7 @@ static void *slob_page_alloc(struct page *sp, size_t si=
ze, int align)
  */
 static void *slob_alloc(size_t size, gfp_t gfp, int align, int node)
 {
-	struct page *sp, *prev, *next;
+	struct page *sp;
 	struct list_head *slob_list;
 	slob_t *b =3D NULL;
 	unsigned long flags;
@@ -283,6 +294,7 @@ static void *slob_alloc(size_t size, gfp_t gfp, int ali=
gn, int node)
 	spin_lock_irqsave(&slob_lock, flags);
 	/* Iterate through each partially free page, try to find room */
 	list_for_each_entry(sp, slob_list, slab_list) {
+		struct page **spp =3D &sp;
 #ifdef CONFIG_NUMA
 		/*
 		 * If there's a node specification, search for a partial
@@ -295,27 +307,25 @@ static void *slob_alloc(size_t size, gfp_t gfp, int a=
lign, int node)
 		if (sp->units < SLOB_UNITS(size))
 			continue;
 =

-		/*
-		 * Cache previous entry because slob_page_alloc() may
-		 * remove sp from slob_list.
-		 */
-		prev =3D list_prev_entry(sp, slab_list);
-
 		/* Attempt to alloc */
-		b =3D slob_page_alloc(sp, size, align);
+		b =3D slob_page_alloc(spp, size, align);
 		if (!b)
 			continue;
 =

-		next =3D list_next_entry(prev, slab_list); /* This may or may not be sp =
*/
-
 		/*
-		 * Improve fragment distribution and reduce our average
-		 * search time by starting our next search here. (see
-		 * Knuth vol 1, sec 2.5, pg 449)
+		 * If slob_page_alloc() removed sp from the list then we
+		 * cannot call list functions on sp.  Just bail, don't
+		 * worry about the optimisation below.
 		 */
-		if (!list_is_first(&next->slab_list, slob_list))
-			list_rotate_to_front(&next->slab_list, slob_list);
-
+		if (*spp) {
+			/*
+			 * Improve fragment distribution and reduce our average
+			 * search time by starting our next search here. (see
+			 * Knuth vol 1, sec 2.5, pg 449)
+			 */
+			if (!list_is_first(&sp->slab_list, slob_list))
+				list_rotate_to_front(&sp->slab_list, slob_list);
+		}
 		break;
 	}
 	spin_unlock_irqrestore(&slob_lock, flags);
@@ -334,7 +344,7 @@ static void *slob_alloc(size_t size, gfp_t gfp, int ali=
gn, int node)
 		INIT_LIST_HEAD(&sp->slab_list);
 		set_slob(b, SLOB_UNITS(PAGE_SIZE), b + SLOB_UNITS(PAGE_SIZE));
 		set_slob_page_free(sp, slob_list);
-		b =3D slob_page_alloc(sp, size, align);
+		b =3D slob_page_alloc(&sp, size, align);
 		BUG_ON(!b);
 		spin_unlock_irqrestore(&slob_lock, flags);
 	}
-- =

2.21.0


--===============9213012540317852207==--

