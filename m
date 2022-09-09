Content-Type: multipart/mixed; boundary="===============7572232688511771833=="
MIME-Version: 1.0
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/sl[au]b] 3c4cafa313: canonical_address#:#[##]
Date: Fri, 09 Sep 2022 23:32:45 +0900
Message-ID: <YxtOjYB9DvR4Fkdp@hyeyoo>
In-Reply-To: <3d178109-5981-f4ee-8fe5-4f1d0c557ed2@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7572232688511771833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 03:44:19PM +0200, Vlastimil Babka wrote:
> On 9/9/22 13:05, Hyeonggon Yoo wrote:
> >> ----8<----
> >> From d6f9fbb33b908eb8162cc1f6ce7f7c970d0f285f Mon Sep 17 00:00:00 2001
> >> From: Vlastimil Babka <vbabka@suse.cz>
> >> Date: Fri, 9 Sep 2022 12:03:10 +0200
> >> Subject: [PATCH 2/3] mm/migrate: make isolate_movable_page() skip slab=
 pages
> >> =

> >> In the next commit we want to rearrange struct slab fields to allow a
> >> larger rcu_head. Afterwards, the page->mapping field will overlap
> >> with SLUB's "struct list_head slab_list", where the value of prev
> >> pointer can become LIST_POISON2, which is 0x122 + POISON_POINTER_DELTA.
> >> Unfortunately the bit 1 being set can confuse PageMovable() to be a
> >> false positive and cause a GPF as reported by lkp [1].
> >> =

> >> To fix this, make isolate_movable_page() skip pages with the PageSlab
> >> flag set. This is a bit tricky as we need to add memory barriers to SL=
AB
> >> and SLUB's page allocation and freeing, and their counterparts to
> >> isolate_movable_page().
> > =

> > Hello, I just took a quick grasp,
> > Is this approach okay with folio_test_anon()?
> =

> Not if used on a completely random page as compaction scanners can, but
> relies on those being first tested for PageLRU or coming from a page table
> lookup etc.
> Not ideal huh. Well I could improve also by switching 'next' and 'slabs'
> field and relying on the fact that the value of LIST_POISON2 doesn't incl=
ude
> 0x1, just 0x2.

What about swapping counters and freelist?
freelist should be always aligned.  =



diff --git a/mm/slab.h b/mm/slab.h
index 2c248864ea91..7d4762a39065 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -27,17 +27,7 @@ struct slab {
 	struct kmem_cache *slab_cache;
 	union {
 		struct {
-			union {
-				struct list_head slab_list;
-#ifdef CONFIG_SLUB_CPU_PARTIAL
-				struct {
-					struct slab *next;
-					int slabs;	/* Nr of slabs left */
-				};
-#endif
-			};
 			/* Double-word boundary */
-			void *freelist;		/* first free object */
 			union {
 				unsigned long counters;
 				struct {
@@ -46,6 +36,16 @@ struct slab {
 					unsigned frozen:1;
 				};
 			};
+			void *freelist;		/* first free object */
+			union {
+				struct list_head slab_list;
+#ifdef CONFIG_SLUB_CPU_PARTIAL
+				struct {
+					struct slab *next;
+					int slabs;	/* Nr of slabs left */
+				};
+#endif
+			};
 		};
 		struct rcu_head rcu_head;
 	};
@@ -81,10 +81,14 @@ SLAB_MATCH(_refcount, __page_refcount);
 #ifdef CONFIG_MEMCG
 SLAB_MATCH(memcg_data, memcg_data);
 #endif
+#ifdef CONFIG_SLUB
+SLAB_MATCH(mapping, freelist);
+#endif
+
 #undef SLAB_MATCH
 static_assert(sizeof(struct slab) <=3D sizeof(struct page));
 #if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && defined(CONFIG_SLUB)
-static_assert(IS_ALIGNED(offsetof(struct slab, freelist), 16));
+static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
 #endif
 =

 /**
diff --git a/mm/slub.c b/mm/slub.c
index 2f9cb6e67de3..0c9595c63e33 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -487,9 +487,9 @@ static inline bool __cmpxchg_double_slab(struct kmem_ca=
che *s, struct slab *slab
 #if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && \
     defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
 	if (s->flags & __CMPXCHG_DOUBLE) {
-		if (cmpxchg_double(&slab->freelist, &slab->counters,
-				   freelist_old, counters_old,
-				   freelist_new, counters_new))
+		if (cmpxchg_double(&slab->counters, &slab->freelist,
+				   counters_old, freelist_old,
+				   counters_new, freelist_new))
 			return true;
 	} else
 #endif
@@ -526,9 +526,9 @@ static inline bool cmpxchg_double_slab(struct kmem_cach=
e *s, struct slab *slab,
 #if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && \
     defined(CONFIG_HAVE_ALIGNED_STRUCT_PAGE)
 	if (s->flags & __CMPXCHG_DOUBLE) {
-		if (cmpxchg_double(&slab->freelist, &slab->counters,
-				   freelist_old, counters_old,
-				   freelist_new, counters_new))
+		if (cmpxchg_double(&slab->counters, &slab->freelist,
+				   counters_old, freelist_old,
+				   counters_new, freelist_new))
 			return true;
 	} else
 #endif

-- =

Thanks,
Hyeonggon
--===============7572232688511771833==--

