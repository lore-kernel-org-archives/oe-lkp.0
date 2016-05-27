Content-Type: multipart/mixed; boundary="===============0840759893504051530=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 23047a96d7: vm-scalability.throughput -23.8% regression
Date: Fri, 27 May 2016 16:11:19 +0800
Message-ID: <20160527081119.GB7651@yexl-desktop>
In-Reply-To: <20160525060617.GB24136@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0840759893504051530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2016 at 02:06:17PM +0800, Ye Xiaolong wrote:
>On Mon, May 23, 2016 at 04:46:05PM -0400, Johannes Weiner wrote:
>>Hi,
>>
>>thanks for your report.
>>
>>On Tue, May 17, 2016 at 12:58:05PM +0800, kernel test robot wrote:
>>> FYI, we noticed vm-scalability.throughput -23.8% regression due to comm=
it:
>>> =

>>> commit 23047a96d7cfcfca1a6d026ecaec526ea4803e9e ("mm: workingset: per-c=
group cache thrash detection")
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
>>> =

>>> in testcase: vm-scalability
>>> on test machine: lkp-hsw01: 56 threads Grantley Haswell-EP with 64G mem=
ory
>>> with following conditions: cpufreq_governor=3Dperformance/runtime=3D300=
s/test=3Dlru-file-readtwice
>>
>>That test hammers the LRU activation path, to which this patch added
>>the cgroup lookup and pinning code. Does the following patch help?
>>

Hi, Johannes

FYI, I have done more tests with your fix patch.

1) apply it on top of latest kernel (head commit: 478a1469("Merge tag 'dax-=
locking-for-4.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm")

The following is the comparison info among first bad commit's parent, first
bad commit, head commit of linus' master branch, your fix commit(a7abed95):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-hsw=
01/lru-file-readtwice/vm-scalability

commit: =

  612e44939c3c77245ac80843c0c7876c8cf97282
  23047a96d7cfcfca1a6d026ecaec526ea4803e9e
  478a1469a7d27fe6b2f85fc801ecdeb8afc836e6
  a7abed950afdc1186d4eaf442b7eb296ff04c947

612e44939c3c7724 23047a96d7cfcfca1a6d026eca 478a1469a7d27fe6b2f85fc801 a7ab=
ed950afdc1186d4eaf442b
---------------- -------------------------- -------------------------- ----=
----------------------
         %stddev     %change         %stddev     %change         %stddev   =
  %change         %stddev
             \          |                \          |                \     =
     |                \
  28384711 =C2=B1  0%     -23.8%   21621405 =C2=B1  0%     -12.4%   2486510=
1 =C2=B1  4%      -8.1%   26076417 =C2=B1  3%  vm-scalability.throughput
   1854112 =C2=B1  0%      -7.7%    1711141 =C2=B1  0%      +6.4%    197325=
7 =C2=B1  4%      +9.2%    2025214 =C2=B1  3%  vm-scalability.time.involunt=
ary_context_switches
      5279 =C2=B1  0%      -0.7%       5243 =C2=B1  0%      -2.6%       514=
3 =C2=B1  0%      -2.4%       5153 =C2=B1  0%  vm-scalability.time.percent_=
of_cpu_this_job_got
     16267 =C2=B1  0%      -0.6%      16173 =C2=B1  0%      -2.0%      1593=
4 =C2=B1  0%      -1.8%      15978 =C2=B1  0%  vm-scalability.time.system_t=
ime
    176.03 =C2=B1  0%     -22.2%     136.95 =C2=B1  1%     -10.4%     157.6=
6 =C2=B1  1%     -11.2%     156.32 =C2=B1  0%  vm-scalability.time.user_time
    302905 =C2=B1  2%     -31.2%     208386 =C2=B1  0%      +5.8%     32061=
8 =C2=B1 47%     -36.0%     193991 =C2=B1 22%  vm-scalability.time.voluntar=
y_context_switches
      0.92 =C2=B1  2%     +51.0%       1.38 =C2=B1  2%     +96.5%       1.8=
0 =C2=B1  0%     +97.3%       1.81 =C2=B1  0%  perf-profile.cycles-pp.kswapd
      2585 =C2=B1  1%      -1.9%       2536 =C2=B1  0%      +9.6%       283=
4 =C2=B1  1%     +10.7%       2862 =C2=B1  1%  uptime.idle
    754212 =C2=B1  1%     -29.2%     533832 =C2=B1  2%     -34.8%     49139=
7 =C2=B1  2%     -27.5%     546666 =C2=B1  8%  softirqs.RCU
    151918 =C2=B1  8%      +5.7%     160522 =C2=B1  5%     -17.4%     12541=
9 =C2=B1 18%     -22.7%     117409 =C2=B1  7%  softirqs.SCHED
    176.03 =C2=B1  0%     -22.2%     136.95 =C2=B1  1%     -10.4%     157.6=
6 =C2=B1  1%     -11.2%     156.32 =C2=B1  0%  time.user_time
    302905 =C2=B1  2%     -31.2%     208386 =C2=B1  0%      +5.8%     32061=
8 =C2=B1 47%     -36.0%     193991 =C2=B1 22%  time.voluntary_context_switc=
hes


2) apply it on top of v4.6 (head commit: 2dcd0af5("Linux 4.6"))

The following is the comparison info among first bad commit's parent, first
bad commit, v4.6, your fix commit(c05f8814):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-hsw=
01/lru-file-readtwice/vm-scalability

commit: =

  612e44939c3c77245ac80843c0c7876c8cf97282
  23047a96d7cfcfca1a6d026ecaec526ea4803e9e
  v4.6
  c05f8814641ceabbc628cd4edc7f64ff58498d5a

612e44939c3c7724 23047a96d7cfcfca1a6d026eca                       v4.6 c05f=
8814641ceabbc628cd4edc
---------------- -------------------------- -------------------------- ----=
----------------------
         %stddev     %change         %stddev     %change         %stddev   =
  %change         %stddev
             \          |                \          |                \     =
     |                \
  28384711 =C2=B1  0%     -23.8%   21621405 =C2=B1  0%     -18.9%   2301301=
1 =C2=B1  0%     -19.2%   22937943 =C2=B1  0%  vm-scalability.throughput
   1854112 =C2=B1  0%      -7.7%    1711141 =C2=B1  0%      -5.2%    175712=
4 =C2=B1  0%      -4.9%    1762398 =C2=B1  0%  vm-scalability.time.involunt=
ary_context_switches
     66021 =C2=B1  0%      -0.4%      65745 =C2=B1  0%      +1.8%      6723=
1 =C2=B1  1%      +3.4%      68291 =C2=B1  0%  vm-scalability.time.minor_pa=
ge_faults
      5279 =C2=B1  0%      -0.7%       5243 =C2=B1  0%      -1.6%       519=
7 =C2=B1  0%      -1.5%       5198 =C2=B1  0%  vm-scalability.time.percent_=
of_cpu_this_job_got
     16267 =C2=B1  0%      -0.6%      16173 =C2=B1  0%      -1.5%      1603=
0 =C2=B1  0%      -1.4%      16032 =C2=B1  0%  vm-scalability.time.system_t=
ime
    176.03 =C2=B1  0%     -22.2%     136.95 =C2=B1  1%     -17.8%     144.6=
6 =C2=B1  1%     -17.0%     146.15 =C2=B1  1%  vm-scalability.time.user_time
    302905 =C2=B1  2%     -31.2%     208386 =C2=B1  0%     -19.4%     24416=
7 =C2=B1  1%     -19.3%     244584 =C2=B1  1%  vm-scalability.time.voluntar=
y_context_switches
     23999 =C2=B1  2%      -5.9%      22575 =C2=B1  2%      -7.1%      2229=
1 =C2=B1  3%      -7.0%      22319 =C2=B1  1%  meminfo.Mapped
      0.92 =C2=B1  2%     +51.0%       1.38 =C2=B1  2%     +96.8%       1.8=
1 =C2=B1  0%     +95.5%       1.79 =C2=B1  0%  perf-profile.cycles-pp.kswapd
    754212 =C2=B1  1%     -29.2%     533832 =C2=B1  2%     -41.1%     44401=
9 =C2=B1  4%     -42.8%     431345 =C2=B1  0%  softirqs.RCU
     20518 =C2=B1  2%      -8.1%      18866 =C2=B1  2%      -2.6%      1998=
0 =C2=B1  3%      -2.9%      19926 =C2=B1  7%  vmstat.system.cs
     10574 =C2=B1 19%     +29.9%      13737 =C2=B1  8%      +1.6%      1074=
0 =C2=B1 33%     +16.9%      12359 =C2=B1 17%  numa-meminfo.node0.Mapped
     13490 =C2=B1 13%     -36.6%       8549 =C2=B1 17%     -13.3%      1168=
9 =C2=B1 29%     -26.5%       9912 =C2=B1 22%  numa-meminfo.node1.Mapped
    176.03 =C2=B1  0%     -22.2%     136.95 =C2=B1  1%     -17.8%     144.6=
6 =C2=B1  1%     -17.0%     146.15 =C2=B1  1%  time.user_time
    302905 =C2=B1  2%     -31.2%     208386 =C2=B1  0%     -19.4%     24416=
7 =C2=B1  1%     -19.3%     244584 =C2=B1  1%  time.voluntary_context_switc=
hes


Thanks,
Xiaolong
>
>Hi,
>
>Here is the comparison of original first bad commit (23047a96d) and your n=
ew patch (063f6715e).
>vm-scalability.throughput improved 11.3%.
>
>
>compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
>  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-hs=
w01/lru-file-readtwice/vm-scalability
>
>commit: =

>  23047a96d7cfcfca1a6d026ecaec526ea4803e9e
>  063f6715e77a7be5770d6081fe6d7ca2437ac9f2
>
>23047a96d7cfcfca 063f6715e77a7be5770d6081fe
>---------------- --------------------------
>         %stddev     %change         %stddev
>             \          |                \
>  21621405 =C2=B1  0%     +11.3%   24069657 =C2=B1  2%  vm-scalability.thr=
oughput
>   1711141 =C2=B1  0%     +40.9%    2411083 =C2=B1  2%  vm-scalability.tim=
e.involuntary_context_switches
>      2747 =C2=B1  0%      +2.4%       2812 =C2=B1  0%  vm-scalability.tim=
e.maximum_resident_set_size
>      5243 =C2=B1  0%      -1.2%       5180 =C2=B1  0%  vm-scalability.tim=
e.percent_of_cpu_this_job_got
>    136.95 =C2=B1  1%     +13.6%     155.55 =C2=B1  0%  vm-scalability.tim=
e.user_time
>    208386 =C2=B1  0%     -71.5%      59394 =C2=B1 16%  vm-scalability.tim=
e.voluntary_context_switches
>      1.38 =C2=B1  2%     +21.7%       1.69 =C2=B1  2%  perf-profile.cycle=
s-pp.kswapd
>    160522 =C2=B1  5%     -30.0%     112342 =C2=B1  2%  softirqs.SCHED
>      2536 =C2=B1  0%      +7.3%       2722 =C2=B1  2%  uptime.idle
>   1711141 =C2=B1  0%     +40.9%    2411083 =C2=B1  2%  time.involuntary_c=
ontext_switches
>    136.95 =C2=B1  1%     +13.6%     155.55 =C2=B1  0%  time.user_time
>    208386 =C2=B1  0%     -71.5%      59394 =C2=B1 16%  time.voluntary_con=
text_switches
>      1052 =C2=B1 13%   +1453.8%      16346 =C2=B1 39%  cpuidle.C1-HSW.usa=
ge
>      1045 =C2=B1 12%     -54.3%     477.50 =C2=B1 25%  cpuidle.C3-HSW.usa=
ge
> 5.719e+08 =C2=B1  1%     +17.9%  6.743e+08 =C2=B1  0%  cpuidle.C6-HSW.time
>  40424411 =C2=B1  2%     -97.3%    1076732 =C2=B1 99%  cpuidle.POLL.time
>      7179 =C2=B1  5%     -99.9%       6.50 =C2=B1 53%  cpuidle.POLL.usage
>      0.51 =C2=B1  8%     -40.6%       0.30 =C2=B1 13%  turbostat.CPU%c1
>      2.83 =C2=B1  2%     +30.5%       3.70 =C2=B1  0%  turbostat.CPU%c6
>      0.23 =C2=B1 79%    +493.4%       1.35 =C2=B1  2%  turbostat.Pkg%pc2
>    255.52 =C2=B1  0%      +3.3%     263.95 =C2=B1  0%  turbostat.PkgWatt
>     53.26 =C2=B1  0%     +14.9%      61.22 =C2=B1  0%  turbostat.RAMWatt
>   1836104 =C2=B1  0%     +13.3%    2079934 =C2=B1  4%  vmstat.memory.free
>      5.00 =C2=B1  0%     -70.0%       1.50 =C2=B1 33%  vmstat.procs.b
>    107.00 =C2=B1  0%      +8.4%     116.00 =C2=B1  2%  vmstat.procs.r
>     18866 =C2=B1  2%     +40.1%      26436 =C2=B1 13%  vmstat.system.cs
>     69056 =C2=B1  0%     +11.8%      77219 =C2=B1  1%  vmstat.system.in
>  31628132 =C2=B1  0%     +80.9%   57224963 =C2=B1  0%  meminfo.Active
>  31294504 =C2=B1  0%     +81.7%   56876042 =C2=B1  0%  meminfo.Active(fil=
e)
>    142271 =C2=B1  6%     +11.2%     158138 =C2=B1  5%  meminfo.DirectMap4k
>  30612825 =C2=B1  0%     -87.2%    3915695 =C2=B1  0%  meminfo.Inactive
>  30562772 =C2=B1  0%     -87.4%    3862631 =C2=B1  0%  meminfo.Inactive(f=
ile)
>     15635 =C2=B1  1%     +38.0%      21572 =C2=B1  8%  meminfo.KernelStack
>     22575 =C2=B1  2%      +7.7%      24316 =C2=B1  4%  meminfo.Mapped
>   1762372 =C2=B1  3%     +12.2%    1976873 =C2=B1  3%  meminfo.MemFree
>    847557 =C2=B1  0%    +105.5%    1741958 =C2=B1  8%  meminfo.SReclaimab=
le
>    946378 =C2=B1  0%     +95.1%    1846370 =C2=B1  8%  meminfo.Slab
>
>Thanks,
>Xiaolong
>
>>From b535c630fd8954865b7536c915c3916beb3b4830 Mon Sep 17 00:00:00 2001
>>From: Johannes Weiner <hannes@cmpxchg.org>
>>Date: Mon, 23 May 2016 16:14:24 -0400
>>Subject: [PATCH] mm: fix vm-scalability regression in workingset_activati=
on()
>>
>>23047a96d7cf ("mm: workingset: per-cgroup cache thrash detection")
>>added cgroup lookup and pinning overhead to the LRU activation path,
>>which the vm-scalability benchmark is particularly sensitive to.
>>
>>Inline the lookup functions to eliminate calls. Furthermore, since
>>activations are not moved when pages are moved between memcgs, we
>>don't need the full page->mem_cgroup locking; holding the RCU lock is
>>enough to prevent the memcg from being freed.
>>
>>Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
>>---
>> include/linux/memcontrol.h | 43 ++++++++++++++++++++++++++++++++++++++++=
++-
>> include/linux/mm.h         |  8 ++++++++
>> mm/memcontrol.c            | 42 ----------------------------------------=
--
>> mm/workingset.c            | 10 ++++++----
>> 4 files changed, 56 insertions(+), 47 deletions(-)
>>
>>diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
>>index a805474df4ab..0bb36cf89bf6 100644
>>--- a/include/linux/memcontrol.h
>>+++ b/include/linux/memcontrol.h
>>@@ -306,7 +306,48 @@ void mem_cgroup_uncharge_list(struct list_head *page=
_list);
>> =

>> void mem_cgroup_migrate(struct page *oldpage, struct page *newpage);
>> =

>>-struct lruvec *mem_cgroup_zone_lruvec(struct zone *, struct mem_cgroup *=
);
>>+static inline struct mem_cgroup_per_zone *
>>+mem_cgroup_zone_zoneinfo(struct mem_cgroup *memcg, struct zone *zone)
>>+{
>>+	int nid =3D zone_to_nid(zone);
>>+	int zid =3D zone_idx(zone);
>>+
>>+	return &memcg->nodeinfo[nid]->zoneinfo[zid];
>>+}
>>+
>>+/**
>>+ * mem_cgroup_zone_lruvec - get the lru list vector for a zone and memcg
>>+ * @zone: zone of the wanted lruvec
>>+ * @memcg: memcg of the wanted lruvec
>>+ *
>>+ * Returns the lru list vector holding pages for the given @zone and
>>+ * @mem.  This can be the global zone lruvec, if the memory controller
>>+ * is disabled.
>>+ */
>>+static inline struct lruvec *mem_cgroup_zone_lruvec(struct zone *zone,
>>+						    struct mem_cgroup *memcg)
>>+{
>>+	struct mem_cgroup_per_zone *mz;
>>+	struct lruvec *lruvec;
>>+
>>+	if (mem_cgroup_disabled()) {
>>+		lruvec =3D &zone->lruvec;
>>+		goto out;
>>+	}
>>+
>>+	mz =3D mem_cgroup_zone_zoneinfo(memcg, zone);
>>+	lruvec =3D &mz->lruvec;
>>+out:
>>+	/*
>>+	 * Since a node can be onlined after the mem_cgroup was created,
>>+	 * we have to be prepared to initialize lruvec->zone here;
>>+	 * and if offlined then reonlined, we need to reinitialize it.
>>+	 */
>>+	if (unlikely(lruvec->zone !=3D zone))
>>+		lruvec->zone =3D zone;
>>+	return lruvec;
>>+}
>>+
>> struct lruvec *mem_cgroup_page_lruvec(struct page *, struct zone *);
>> =

>> bool task_in_mem_cgroup(struct task_struct *task, struct mem_cgroup *mem=
cg);
>>diff --git a/include/linux/mm.h b/include/linux/mm.h
>>index b530c99e8e81..a9dd54e196a7 100644
>>--- a/include/linux/mm.h
>>+++ b/include/linux/mm.h
>>@@ -943,11 +943,19 @@ static inline struct mem_cgroup *page_memcg(struct =
page *page)
>> {
>> 	return page->mem_cgroup;
>> }
>>+static inline struct mem_cgroup *page_memcg_rcu(struct page *page)
>>+{
>>+	return READ_ONCE(page->mem_cgroup);
>>+}
>> #else
>> static inline struct mem_cgroup *page_memcg(struct page *page)
>> {
>> 	return NULL;
>> }
>>+static inline struct mem_cgroup *page_memcg_rcu(struct page *page)
>>+{
>>+	return NULL;
>>+}
>> #endif
>> =

>> /*
>>diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>>index b3f16ab4b431..f65e5e527864 100644
>>--- a/mm/memcontrol.c
>>+++ b/mm/memcontrol.c
>>@@ -323,15 +323,6 @@ EXPORT_SYMBOL(memcg_kmem_enabled_key);
>> =

>> #endif /* !CONFIG_SLOB */
>> =

>>-static struct mem_cgroup_per_zone *
>>-mem_cgroup_zone_zoneinfo(struct mem_cgroup *memcg, struct zone *zone)
>>-{
>>-	int nid =3D zone_to_nid(zone);
>>-	int zid =3D zone_idx(zone);
>>-
>>-	return &memcg->nodeinfo[nid]->zoneinfo[zid];
>>-}
>>-
>> /**
>>  * mem_cgroup_css_from_page - css of the memcg associated with a page
>>  * @page: page of interest
>>@@ -944,39 +935,6 @@ static void invalidate_reclaim_iterators(struct mem_=
cgroup *dead_memcg)
>> 	     iter =3D mem_cgroup_iter(NULL, iter, NULL))
>> =

>> /**
>>- * mem_cgroup_zone_lruvec - get the lru list vector for a zone and memcg
>>- * @zone: zone of the wanted lruvec
>>- * @memcg: memcg of the wanted lruvec
>>- *
>>- * Returns the lru list vector holding pages for the given @zone and
>>- * @mem.  This can be the global zone lruvec, if the memory controller
>>- * is disabled.
>>- */
>>-struct lruvec *mem_cgroup_zone_lruvec(struct zone *zone,
>>-				      struct mem_cgroup *memcg)
>>-{
>>-	struct mem_cgroup_per_zone *mz;
>>-	struct lruvec *lruvec;
>>-
>>-	if (mem_cgroup_disabled()) {
>>-		lruvec =3D &zone->lruvec;
>>-		goto out;
>>-	}
>>-
>>-	mz =3D mem_cgroup_zone_zoneinfo(memcg, zone);
>>-	lruvec =3D &mz->lruvec;
>>-out:
>>-	/*
>>-	 * Since a node can be onlined after the mem_cgroup was created,
>>-	 * we have to be prepared to initialize lruvec->zone here;
>>-	 * and if offlined then reonlined, we need to reinitialize it.
>>-	 */
>>-	if (unlikely(lruvec->zone !=3D zone))
>>-		lruvec->zone =3D zone;
>>-	return lruvec;
>>-}
>>-
>>-/**
>>  * mem_cgroup_page_lruvec - return lruvec for isolating/putting an LRU p=
age
>>  * @page: the page
>>  * @zone: zone of the page
>>diff --git a/mm/workingset.c b/mm/workingset.c
>>index 8a75f8d2916a..8252de4566e9 100644
>>--- a/mm/workingset.c
>>+++ b/mm/workingset.c
>>@@ -305,9 +305,10 @@ bool workingset_refault(void *shadow)
>>  */
>> void workingset_activation(struct page *page)
>> {
>>+	struct mem_cgroup *memcg;
>> 	struct lruvec *lruvec;
>> =

>>-	lock_page_memcg(page);
>>+	rcu_read_lock();
>> 	/*
>> 	 * Filter non-memcg pages here, e.g. unmap can call
>> 	 * mark_page_accessed() on VDSO pages.
>>@@ -315,12 +316,13 @@ void workingset_activation(struct page *page)
>> 	 * XXX: See workingset_refault() - this should return
>> 	 * root_mem_cgroup even for !CONFIG_MEMCG.
>> 	 */
>>-	if (!mem_cgroup_disabled() && !page_memcg(page))
>>+	memcg =3D page_memcg_rcu(page);
>>+	if (!mem_cgroup_disabled() && !memcg)
>> 		goto out;
>>-	lruvec =3D mem_cgroup_zone_lruvec(page_zone(page), page_memcg(page));
>>+	lruvec =3D mem_cgroup_zone_lruvec(page_zone(page), memcg);
>> 	atomic_long_inc(&lruvec->inactive_age);
>> out:
>>-	unlock_page_memcg(page);
>>+	rcu_read_unlock();
>> }
>> =

>> /*
>>-- =

>>2.8.2
>>
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============0840759893504051530==--

