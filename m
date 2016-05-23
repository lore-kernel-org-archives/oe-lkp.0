Content-Type: multipart/mixed; boundary="===============3739488385706403276=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 23047a96d7: vm-scalability.throughput -23.8% regression
Date: Mon, 23 May 2016 16:46:05 -0400
Message-ID: <20160523204605.GA3133@cmpxchg.org>
In-Reply-To: <20160517045805.GA16472@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3739488385706403276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for your report.

On Tue, May 17, 2016 at 12:58:05PM +0800, kernel test robot wrote:
> FYI, we noticed vm-scalability.throughput -23.8% regression due to commit:
> =

> commit 23047a96d7cfcfca1a6d026ecaec526ea4803e9e ("mm: workingset: per-cgr=
oup cache thrash detection")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: vm-scalability
> on test machine: lkp-hsw01: 56 threads Grantley Haswell-EP with 64G memory
> with following conditions: cpufreq_governor=3Dperformance/runtime=3D300s/=
test=3Dlru-file-readtwice

That test hammers the LRU activation path, to which this patch added
the cgroup lookup and pinning code. Does the following patch help?

>From b535c630fd8954865b7536c915c3916beb3b4830 Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Mon, 23 May 2016 16:14:24 -0400
Subject: [PATCH] mm: fix vm-scalability regression in workingset_activation=
()

23047a96d7cf ("mm: workingset: per-cgroup cache thrash detection")
added cgroup lookup and pinning overhead to the LRU activation path,
which the vm-scalability benchmark is particularly sensitive to.

Inline the lookup functions to eliminate calls. Furthermore, since
activations are not moved when pages are moved between memcgs, we
don't need the full page->mem_cgroup locking; holding the RCU lock is
enough to prevent the memcg from being freed.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 include/linux/memcontrol.h | 43 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mm.h         |  8 ++++++++
 mm/memcontrol.c            | 42 ------------------------------------------
 mm/workingset.c            | 10 ++++++----
 4 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index a805474df4ab..0bb36cf89bf6 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -306,7 +306,48 @@ void mem_cgroup_uncharge_list(struct list_head *page_l=
ist);
 =

 void mem_cgroup_migrate(struct page *oldpage, struct page *newpage);
 =

-struct lruvec *mem_cgroup_zone_lruvec(struct zone *, struct mem_cgroup *);
+static inline struct mem_cgroup_per_zone *
+mem_cgroup_zone_zoneinfo(struct mem_cgroup *memcg, struct zone *zone)
+{
+	int nid =3D zone_to_nid(zone);
+	int zid =3D zone_idx(zone);
+
+	return &memcg->nodeinfo[nid]->zoneinfo[zid];
+}
+
+/**
+ * mem_cgroup_zone_lruvec - get the lru list vector for a zone and memcg
+ * @zone: zone of the wanted lruvec
+ * @memcg: memcg of the wanted lruvec
+ *
+ * Returns the lru list vector holding pages for the given @zone and
+ * @mem.  This can be the global zone lruvec, if the memory controller
+ * is disabled.
+ */
+static inline struct lruvec *mem_cgroup_zone_lruvec(struct zone *zone,
+						    struct mem_cgroup *memcg)
+{
+	struct mem_cgroup_per_zone *mz;
+	struct lruvec *lruvec;
+
+	if (mem_cgroup_disabled()) {
+		lruvec =3D &zone->lruvec;
+		goto out;
+	}
+
+	mz =3D mem_cgroup_zone_zoneinfo(memcg, zone);
+	lruvec =3D &mz->lruvec;
+out:
+	/*
+	 * Since a node can be onlined after the mem_cgroup was created,
+	 * we have to be prepared to initialize lruvec->zone here;
+	 * and if offlined then reonlined, we need to reinitialize it.
+	 */
+	if (unlikely(lruvec->zone !=3D zone))
+		lruvec->zone =3D zone;
+	return lruvec;
+}
+
 struct lruvec *mem_cgroup_page_lruvec(struct page *, struct zone *);
 =

 bool task_in_mem_cgroup(struct task_struct *task, struct mem_cgroup *memcg=
);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b530c99e8e81..a9dd54e196a7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -943,11 +943,19 @@ static inline struct mem_cgroup *page_memcg(struct pa=
ge *page)
 {
 	return page->mem_cgroup;
 }
+static inline struct mem_cgroup *page_memcg_rcu(struct page *page)
+{
+	return READ_ONCE(page->mem_cgroup);
+}
 #else
 static inline struct mem_cgroup *page_memcg(struct page *page)
 {
 	return NULL;
 }
+static inline struct mem_cgroup *page_memcg_rcu(struct page *page)
+{
+	return NULL;
+}
 #endif
 =

 /*
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index b3f16ab4b431..f65e5e527864 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -323,15 +323,6 @@ EXPORT_SYMBOL(memcg_kmem_enabled_key);
 =

 #endif /* !CONFIG_SLOB */
 =

-static struct mem_cgroup_per_zone *
-mem_cgroup_zone_zoneinfo(struct mem_cgroup *memcg, struct zone *zone)
-{
-	int nid =3D zone_to_nid(zone);
-	int zid =3D zone_idx(zone);
-
-	return &memcg->nodeinfo[nid]->zoneinfo[zid];
-}
-
 /**
  * mem_cgroup_css_from_page - css of the memcg associated with a page
  * @page: page of interest
@@ -944,39 +935,6 @@ static void invalidate_reclaim_iterators(struct mem_cg=
roup *dead_memcg)
 	     iter =3D mem_cgroup_iter(NULL, iter, NULL))
 =

 /**
- * mem_cgroup_zone_lruvec - get the lru list vector for a zone and memcg
- * @zone: zone of the wanted lruvec
- * @memcg: memcg of the wanted lruvec
- *
- * Returns the lru list vector holding pages for the given @zone and
- * @mem.  This can be the global zone lruvec, if the memory controller
- * is disabled.
- */
-struct lruvec *mem_cgroup_zone_lruvec(struct zone *zone,
-				      struct mem_cgroup *memcg)
-{
-	struct mem_cgroup_per_zone *mz;
-	struct lruvec *lruvec;
-
-	if (mem_cgroup_disabled()) {
-		lruvec =3D &zone->lruvec;
-		goto out;
-	}
-
-	mz =3D mem_cgroup_zone_zoneinfo(memcg, zone);
-	lruvec =3D &mz->lruvec;
-out:
-	/*
-	 * Since a node can be onlined after the mem_cgroup was created,
-	 * we have to be prepared to initialize lruvec->zone here;
-	 * and if offlined then reonlined, we need to reinitialize it.
-	 */
-	if (unlikely(lruvec->zone !=3D zone))
-		lruvec->zone =3D zone;
-	return lruvec;
-}
-
-/**
  * mem_cgroup_page_lruvec - return lruvec for isolating/putting an LRU page
  * @page: the page
  * @zone: zone of the page
diff --git a/mm/workingset.c b/mm/workingset.c
index 8a75f8d2916a..8252de4566e9 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -305,9 +305,10 @@ bool workingset_refault(void *shadow)
  */
 void workingset_activation(struct page *page)
 {
+	struct mem_cgroup *memcg;
 	struct lruvec *lruvec;
 =

-	lock_page_memcg(page);
+	rcu_read_lock();
 	/*
 	 * Filter non-memcg pages here, e.g. unmap can call
 	 * mark_page_accessed() on VDSO pages.
@@ -315,12 +316,13 @@ void workingset_activation(struct page *page)
 	 * XXX: See workingset_refault() - this should return
 	 * root_mem_cgroup even for !CONFIG_MEMCG.
 	 */
-	if (!mem_cgroup_disabled() && !page_memcg(page))
+	memcg =3D page_memcg_rcu(page);
+	if (!mem_cgroup_disabled() && !memcg)
 		goto out;
-	lruvec =3D mem_cgroup_zone_lruvec(page_zone(page), page_memcg(page));
+	lruvec =3D mem_cgroup_zone_lruvec(page_zone(page), memcg);
 	atomic_long_inc(&lruvec->inactive_age);
 out:
-	unlock_page_memcg(page);
+	rcu_read_unlock();
 }
 =

 /*
-- =

2.8.2


--===============3739488385706403276==--

