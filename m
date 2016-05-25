Content-Type: multipart/mixed; boundary="===============6047201615581775360=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 23047a96d7: vm-scalability.throughput -23.8% regression
Date: Wed, 25 May 2016 14:06:17 +0800
Message-ID: <20160525060617.GB24136@yexl-desktop>
In-Reply-To: <20160523204605.GA3133@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6047201615581775360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2016 at 04:46:05PM -0400, Johannes Weiner wrote:
>Hi,
>
>thanks for your report.
>
>On Tue, May 17, 2016 at 12:58:05PM +0800, kernel test robot wrote:
>> FYI, we noticed vm-scalability.throughput -23.8% regression due to commi=
t:
>> =

>> commit 23047a96d7cfcfca1a6d026ecaec526ea4803e9e ("mm: workingset: per-cg=
roup cache thrash detection")
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> =

>> in testcase: vm-scalability
>> on test machine: lkp-hsw01: 56 threads Grantley Haswell-EP with 64G memo=
ry
>> with following conditions: cpufreq_governor=3Dperformance/runtime=3D300s=
/test=3Dlru-file-readtwice
>
>That test hammers the LRU activation path, to which this patch added
>the cgroup lookup and pinning code. Does the following patch help?
>

Hi,

Here is the comparison of original first bad commit (23047a96d) and your ne=
w patch (063f6715e).
vm-scalability.throughput improved 11.3%.


compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-hsw=
01/lru-file-readtwice/vm-scalability

commit: =

  23047a96d7cfcfca1a6d026ecaec526ea4803e9e
  063f6715e77a7be5770d6081fe6d7ca2437ac9f2

23047a96d7cfcfca 063f6715e77a7be5770d6081fe
---------------- --------------------------
         %stddev     %change         %stddev
             \          |                \
  21621405 =C2=B1  0%     +11.3%   24069657 =C2=B1  2%  vm-scalability.thro=
ughput
   1711141 =C2=B1  0%     +40.9%    2411083 =C2=B1  2%  vm-scalability.time=
.involuntary_context_switches
      2747 =C2=B1  0%      +2.4%       2812 =C2=B1  0%  vm-scalability.time=
.maximum_resident_set_size
      5243 =C2=B1  0%      -1.2%       5180 =C2=B1  0%  vm-scalability.time=
.percent_of_cpu_this_job_got
    136.95 =C2=B1  1%     +13.6%     155.55 =C2=B1  0%  vm-scalability.time=
.user_time
    208386 =C2=B1  0%     -71.5%      59394 =C2=B1 16%  vm-scalability.time=
.voluntary_context_switches
      1.38 =C2=B1  2%     +21.7%       1.69 =C2=B1  2%  perf-profile.cycles=
-pp.kswapd
    160522 =C2=B1  5%     -30.0%     112342 =C2=B1  2%  softirqs.SCHED
      2536 =C2=B1  0%      +7.3%       2722 =C2=B1  2%  uptime.idle
   1711141 =C2=B1  0%     +40.9%    2411083 =C2=B1  2%  time.involuntary_co=
ntext_switches
    136.95 =C2=B1  1%     +13.6%     155.55 =C2=B1  0%  time.user_time
    208386 =C2=B1  0%     -71.5%      59394 =C2=B1 16%  time.voluntary_cont=
ext_switches
      1052 =C2=B1 13%   +1453.8%      16346 =C2=B1 39%  cpuidle.C1-HSW.usage
      1045 =C2=B1 12%     -54.3%     477.50 =C2=B1 25%  cpuidle.C3-HSW.usage
 5.719e+08 =C2=B1  1%     +17.9%  6.743e+08 =C2=B1  0%  cpuidle.C6-HSW.time
  40424411 =C2=B1  2%     -97.3%    1076732 =C2=B1 99%  cpuidle.POLL.time
      7179 =C2=B1  5%     -99.9%       6.50 =C2=B1 53%  cpuidle.POLL.usage
      0.51 =C2=B1  8%     -40.6%       0.30 =C2=B1 13%  turbostat.CPU%c1
      2.83 =C2=B1  2%     +30.5%       3.70 =C2=B1  0%  turbostat.CPU%c6
      0.23 =C2=B1 79%    +493.4%       1.35 =C2=B1  2%  turbostat.Pkg%pc2
    255.52 =C2=B1  0%      +3.3%     263.95 =C2=B1  0%  turbostat.PkgWatt
     53.26 =C2=B1  0%     +14.9%      61.22 =C2=B1  0%  turbostat.RAMWatt
   1836104 =C2=B1  0%     +13.3%    2079934 =C2=B1  4%  vmstat.memory.free
      5.00 =C2=B1  0%     -70.0%       1.50 =C2=B1 33%  vmstat.procs.b
    107.00 =C2=B1  0%      +8.4%     116.00 =C2=B1  2%  vmstat.procs.r
     18866 =C2=B1  2%     +40.1%      26436 =C2=B1 13%  vmstat.system.cs
     69056 =C2=B1  0%     +11.8%      77219 =C2=B1  1%  vmstat.system.in
  31628132 =C2=B1  0%     +80.9%   57224963 =C2=B1  0%  meminfo.Active
  31294504 =C2=B1  0%     +81.7%   56876042 =C2=B1  0%  meminfo.Active(file)
    142271 =C2=B1  6%     +11.2%     158138 =C2=B1  5%  meminfo.DirectMap4k
  30612825 =C2=B1  0%     -87.2%    3915695 =C2=B1  0%  meminfo.Inactive
  30562772 =C2=B1  0%     -87.4%    3862631 =C2=B1  0%  meminfo.Inactive(fi=
le)
     15635 =C2=B1  1%     +38.0%      21572 =C2=B1  8%  meminfo.KernelStack
     22575 =C2=B1  2%      +7.7%      24316 =C2=B1  4%  meminfo.Mapped
   1762372 =C2=B1  3%     +12.2%    1976873 =C2=B1  3%  meminfo.MemFree
    847557 =C2=B1  0%    +105.5%    1741958 =C2=B1  8%  meminfo.SReclaimable
    946378 =C2=B1  0%     +95.1%    1846370 =C2=B1  8%  meminfo.Slab

Thanks,
Xiaolong

>From b535c630fd8954865b7536c915c3916beb3b4830 Mon Sep 17 00:00:00 2001
>From: Johannes Weiner <hannes@cmpxchg.org>
>Date: Mon, 23 May 2016 16:14:24 -0400
>Subject: [PATCH] mm: fix vm-scalability regression in workingset_activatio=
n()
>
>23047a96d7cf ("mm: workingset: per-cgroup cache thrash detection")
>added cgroup lookup and pinning overhead to the LRU activation path,
>which the vm-scalability benchmark is particularly sensitive to.
>
>Inline the lookup functions to eliminate calls. Furthermore, since
>activations are not moved when pages are moved between memcgs, we
>don't need the full page->mem_cgroup locking; holding the RCU lock is
>enough to prevent the memcg from being freed.
>
>Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
>---
> include/linux/memcontrol.h | 43 +++++++++++++++++++++++++++++++++++++++++=
+-
> include/linux/mm.h         |  8 ++++++++
> mm/memcontrol.c            | 42 ------------------------------------------
> mm/workingset.c            | 10 ++++++----
> 4 files changed, 56 insertions(+), 47 deletions(-)
>
>diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
>index a805474df4ab..0bb36cf89bf6 100644
>--- a/include/linux/memcontrol.h
>+++ b/include/linux/memcontrol.h
>@@ -306,7 +306,48 @@ void mem_cgroup_uncharge_list(struct list_head *page_=
list);
> =

> void mem_cgroup_migrate(struct page *oldpage, struct page *newpage);
> =

>-struct lruvec *mem_cgroup_zone_lruvec(struct zone *, struct mem_cgroup *);
>+static inline struct mem_cgroup_per_zone *
>+mem_cgroup_zone_zoneinfo(struct mem_cgroup *memcg, struct zone *zone)
>+{
>+	int nid =3D zone_to_nid(zone);
>+	int zid =3D zone_idx(zone);
>+
>+	return &memcg->nodeinfo[nid]->zoneinfo[zid];
>+}
>+
>+/**
>+ * mem_cgroup_zone_lruvec - get the lru list vector for a zone and memcg
>+ * @zone: zone of the wanted lruvec
>+ * @memcg: memcg of the wanted lruvec
>+ *
>+ * Returns the lru list vector holding pages for the given @zone and
>+ * @mem.  This can be the global zone lruvec, if the memory controller
>+ * is disabled.
>+ */
>+static inline struct lruvec *mem_cgroup_zone_lruvec(struct zone *zone,
>+						    struct mem_cgroup *memcg)
>+{
>+	struct mem_cgroup_per_zone *mz;
>+	struct lruvec *lruvec;
>+
>+	if (mem_cgroup_disabled()) {
>+		lruvec =3D &zone->lruvec;
>+		goto out;
>+	}
>+
>+	mz =3D mem_cgroup_zone_zoneinfo(memcg, zone);
>+	lruvec =3D &mz->lruvec;
>+out:
>+	/*
>+	 * Since a node can be onlined after the mem_cgroup was created,
>+	 * we have to be prepared to initialize lruvec->zone here;
>+	 * and if offlined then reonlined, we need to reinitialize it.
>+	 */
>+	if (unlikely(lruvec->zone !=3D zone))
>+		lruvec->zone =3D zone;
>+	return lruvec;
>+}
>+
> struct lruvec *mem_cgroup_page_lruvec(struct page *, struct zone *);
> =

> bool task_in_mem_cgroup(struct task_struct *task, struct mem_cgroup *memc=
g);
>diff --git a/include/linux/mm.h b/include/linux/mm.h
>index b530c99e8e81..a9dd54e196a7 100644
>--- a/include/linux/mm.h
>+++ b/include/linux/mm.h
>@@ -943,11 +943,19 @@ static inline struct mem_cgroup *page_memcg(struct p=
age *page)
> {
> 	return page->mem_cgroup;
> }
>+static inline struct mem_cgroup *page_memcg_rcu(struct page *page)
>+{
>+	return READ_ONCE(page->mem_cgroup);
>+}
> #else
> static inline struct mem_cgroup *page_memcg(struct page *page)
> {
> 	return NULL;
> }
>+static inline struct mem_cgroup *page_memcg_rcu(struct page *page)
>+{
>+	return NULL;
>+}
> #endif
> =

> /*
>diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>index b3f16ab4b431..f65e5e527864 100644
>--- a/mm/memcontrol.c
>+++ b/mm/memcontrol.c
>@@ -323,15 +323,6 @@ EXPORT_SYMBOL(memcg_kmem_enabled_key);
> =

> #endif /* !CONFIG_SLOB */
> =

>-static struct mem_cgroup_per_zone *
>-mem_cgroup_zone_zoneinfo(struct mem_cgroup *memcg, struct zone *zone)
>-{
>-	int nid =3D zone_to_nid(zone);
>-	int zid =3D zone_idx(zone);
>-
>-	return &memcg->nodeinfo[nid]->zoneinfo[zid];
>-}
>-
> /**
>  * mem_cgroup_css_from_page - css of the memcg associated with a page
>  * @page: page of interest
>@@ -944,39 +935,6 @@ static void invalidate_reclaim_iterators(struct mem_c=
group *dead_memcg)
> 	     iter =3D mem_cgroup_iter(NULL, iter, NULL))
> =

> /**
>- * mem_cgroup_zone_lruvec - get the lru list vector for a zone and memcg
>- * @zone: zone of the wanted lruvec
>- * @memcg: memcg of the wanted lruvec
>- *
>- * Returns the lru list vector holding pages for the given @zone and
>- * @mem.  This can be the global zone lruvec, if the memory controller
>- * is disabled.
>- */
>-struct lruvec *mem_cgroup_zone_lruvec(struct zone *zone,
>-				      struct mem_cgroup *memcg)
>-{
>-	struct mem_cgroup_per_zone *mz;
>-	struct lruvec *lruvec;
>-
>-	if (mem_cgroup_disabled()) {
>-		lruvec =3D &zone->lruvec;
>-		goto out;
>-	}
>-
>-	mz =3D mem_cgroup_zone_zoneinfo(memcg, zone);
>-	lruvec =3D &mz->lruvec;
>-out:
>-	/*
>-	 * Since a node can be onlined after the mem_cgroup was created,
>-	 * we have to be prepared to initialize lruvec->zone here;
>-	 * and if offlined then reonlined, we need to reinitialize it.
>-	 */
>-	if (unlikely(lruvec->zone !=3D zone))
>-		lruvec->zone =3D zone;
>-	return lruvec;
>-}
>-
>-/**
>  * mem_cgroup_page_lruvec - return lruvec for isolating/putting an LRU pa=
ge
>  * @page: the page
>  * @zone: zone of the page
>diff --git a/mm/workingset.c b/mm/workingset.c
>index 8a75f8d2916a..8252de4566e9 100644
>--- a/mm/workingset.c
>+++ b/mm/workingset.c
>@@ -305,9 +305,10 @@ bool workingset_refault(void *shadow)
>  */
> void workingset_activation(struct page *page)
> {
>+	struct mem_cgroup *memcg;
> 	struct lruvec *lruvec;
> =

>-	lock_page_memcg(page);
>+	rcu_read_lock();
> 	/*
> 	 * Filter non-memcg pages here, e.g. unmap can call
> 	 * mark_page_accessed() on VDSO pages.
>@@ -315,12 +316,13 @@ void workingset_activation(struct page *page)
> 	 * XXX: See workingset_refault() - this should return
> 	 * root_mem_cgroup even for !CONFIG_MEMCG.
> 	 */
>-	if (!mem_cgroup_disabled() && !page_memcg(page))
>+	memcg =3D page_memcg_rcu(page);
>+	if (!mem_cgroup_disabled() && !memcg)
> 		goto out;
>-	lruvec =3D mem_cgroup_zone_lruvec(page_zone(page), page_memcg(page));
>+	lruvec =3D mem_cgroup_zone_lruvec(page_zone(page), memcg);
> 	atomic_long_inc(&lruvec->inactive_age);
> out:
>-	unlock_page_memcg(page);
>+	rcu_read_unlock();
> }
> =

> /*
>-- =

>2.8.2
>

--===============6047201615581775360==--

