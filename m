Content-Type: multipart/mixed; boundary="===============1342433773051149988=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Wed, 11 May 2022 19:04:55 +0800
Message-ID: <YnuYV3J2ljY88DyQ@ziqianlu-desk1>
In-Reply-To: <41c08a5371957acac5310a2e608b2e42bd231558.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1342433773051149988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 09:58:23AM +0800, ying.huang(a)intel.com wrote:
> On Tue, 2022-05-10 at 11:05 -0700, Linus Torvalds wrote:
> > [ Adding locking people in case they have any input ]
> > =

> > On Mon, May 9, 2022 at 11:23 PM ying.huang(a)intel.com
> > <ying.huang@intel.com> wrote:
> > > =

> > > > =

> > > > Can you point me to the regression report? I would like to take a l=
ook,
> > > > thanks.
> > > =

> > > https://lore.kernel.org/all/1425108604.10337.84.camel(a)linux.intel.c=
om/
> > =

> > Hmm.
> > =

> > That explanation looks believable, except that our qspinlocks
> > shouldn't be spinning on the lock itself, but spinning on the mcs node
> > it inserts into the lock.
> =

> The referenced regression report is very old (in Feb 2015 for 3.16-
> 3.17).  The ticket spinlock was still used at that time.  I believe that
> things become much better after we used qspinlock.  We can test that.

'will-it-scale/page_fault1 process mode' can greatly stress both zone
lock and LRU lock when nr_process =3D nr_cpu with thp disabled. So I run
it to see if it still makes a difference with qspinlock.
https://github.com/antonblanchard/will-it-scale/blob/master/tests/page_faul=
t1.c

The result on an Icelake 2 sockets server with a total of 48cores/96cpus:

tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/thp_enabled/c=
pufreq_governor/ucode:
  lkp-icl-2sp4/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.=
3/gcc-11/100%/process/page_fault1/never/performance/0xd000331

commit:
  v5.18-rc4
  731a704c0d8760cfd641af4bf57167d8c68f9b99

       v5.18-rc4 731a704c0d8760cfd641af4bf57
---------------- ---------------------------
         %stddev     %change         %stddev
	     \          |                \
  12323894           -26.0%    9125299        will-it-scale.128.processes

     22.33 =C2=B1  4%     -22.3        0.00        perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruv=
ec_lock_irqsave.release_pages.tlb_flush_mmu
      9.80            -9.2        0.57 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruv=
ec_lock_irqsave.__pagevec_lru_add.folio_add_lru
     36.25            +6.7       42.94        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.rmqueue_bulk.rmqueue.ge=
t_page_from_freelist
      4.28 =C2=B1 10%     +34.6       38.93        perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk=
.free_unref_page_list.release_pages
     75.05            +7.8       82.83        perf-profile.self.cycles-pp.n=
ative_queued_spin_lock_slowpath

commit 731a704c0d8760cfd641af4bf57 moves zone's lock back to above
free_area by reverting commit a368ab67aa55("mm: move zone lock to a
different cache line than order-0 free page lists") on top of v5.18-rc4.

The interpretation of the above result is: after the revert, performance
dropped 26%, zone lock increased 41% from 40% to 81%, the overall lock
contention increased 7.8% from 75% to 82.83%. So it appears it still
makes a difference with qspinlock.

------
Commit 731a704c0d8760cfd641af4bf57:

>From 731a704c0d8760cfd641af4bf57167d8c68f9b99 Mon Sep 17 00:00:00 2001
From: Aaron Lu <aaron.lu@intel.com>
Date: Wed, 11 May 2022 10:32:53 +0800
Subject: [PATCH] Revert "mm: move zone lock to a different cache line than
 order-0 free page lists"

This reverts commit a368ab67aa55615a03b2c9c00fb965bee3ebeaa4.
---
 include/linux/mmzone.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 46ffab808f03..f5534f42c693 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -628,15 +628,15 @@ struct zone {
 	/* Write-intensive fields used from the page allocator */
 	ZONE_PADDING(_pad1_)
 =

+	/* Primarily protects free_area */
+	spinlock_t		lock;
+
 	/* free areas of different sizes */
 	struct free_area	free_area[MAX_ORDER];
 =

 	/* zone flags, see below */
 	unsigned long		flags;
 =

-	/* Primarily protects free_area */
-	spinlock_t		lock;
-
 	/* Write-intensive fields used by compaction and vmstats. */
 	ZONE_PADDING(_pad2_)
 =

-- =

2.35.3

The entire diff between the two kernels:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/thp_enabled/c=
pufreq_governor/ucode:
  lkp-icl-2sp4/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.=
3/gcc-11/100%/process/page_fault1/never/performance/0xd000331

commit: =

  v5.18-rc4
  731a704c0d8760cfd641af4bf57167d8c68f9b99

       v5.18-rc4 731a704c0d8760cfd641af4bf57 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  12323894           -26.0%    9125299        will-it-scale.128.processes
      0.05 =C2=B1  8%     +37.5%       0.07 =C2=B1 17%  will-it-scale.128.p=
rocesses_idle
     96279           -26.0%      71290        will-it-scale.per_process_ops
  12323894           -26.0%    9125299        will-it-scale.workload
      0.33 =C2=B1141%    +800.0%       3.00 =C2=B1 54%  time.major_page_fau=
lts
      0.66            -0.1        0.60        mpstat.cpu.all.irq%
      1.49            -0.3        1.23        mpstat.cpu.all.usr%
    747.00 =C2=B1 54%     -83.8%     121.33 =C2=B1 62%  numa-meminfo.node0.=
Active(file)
   4063469           -11.0%    3617426 =C2=B1  2%  numa-meminfo.node0.AnonP=
ages
      1634            -3.9%       1571        vmstat.system.cs
    250770 =C2=B1  5%     -24.4%     189542        vmstat.system.in
   7234686 =C2=B1  2%     +13.9%    8241057        meminfo.Inactive
   7231508 =C2=B1  2%     +13.9%    8239382        meminfo.Inactive(anon)
    101436           -19.5%      81700        meminfo.Mapped
    592.33 =C2=B1141%    +201.2%       1784        meminfo.Mlocked
 1.873e+09           -23.7%  1.429e+09        numa-numastat.node0.local_node
 1.872e+09           -23.7%  1.429e+09        numa-numastat.node0.numa_hit
 1.853e+09           -28.2%   1.33e+09        numa-numastat.node1.local_node
 1.852e+09           -28.2%  1.329e+09        numa-numastat.node1.numa_hit
     52056 =C2=B1 65%     +53.8%      80068 =C2=B1 34%  numa-numastat.node1=
.other_node
      0.06           -16.7%       0.05        turbostat.IPC
  75911699 =C2=B1  4%     -24.2%   57562839        turbostat.IRQ
     27.73           -23.4        4.29 =C2=B1  6%  turbostat.PKG_%
     77.67            -1.7%      76.33        turbostat.PkgTmp
    486.01            -2.8%     472.42        turbostat.PkgWatt
     94.08           -13.3%      81.55        turbostat.RAMWatt
    186.67 =C2=B1 54%     -84.1%      29.67 =C2=B1 63%  numa-vmstat.node0.n=
r_active_file
   1031719           -10.8%     920591 =C2=B1  2%  numa-vmstat.node0.nr_ano=
n_pages
    186.67 =C2=B1 54%     -84.1%      29.67 =C2=B1 63%  numa-vmstat.node0.n=
r_zone_active_file
 1.872e+09           -23.7%  1.429e+09        numa-vmstat.node0.numa_hit
 1.873e+09           -23.7%  1.429e+09        numa-vmstat.node0.numa_local
   1030546 =C2=B1  2%      -9.2%     935582        numa-vmstat.node1.nr_ano=
n_pages
 1.852e+09           -28.2%  1.329e+09        numa-vmstat.node1.numa_hit
 1.853e+09           -28.2%   1.33e+09        numa-vmstat.node1.numa_local
     52056 =C2=B1 65%     +53.8%      80068 =C2=B1 34%  numa-vmstat.node1.n=
uma_other
     34.48 =C2=B1 33%     +59.4%      54.95 =C2=B1 16%  sched_debug.cfs_rq:=
/.load_avg.avg
    227417           +10.5%     251193 =C2=B1  3%  sched_debug.cfs_rq:/.min=
_vruntime.stddev
     59485 =C2=B1 84%    -144.1%     -26247        sched_debug.cfs_rq:/.spr=
ead0.avg
  -1687153            +8.2%   -1825127        sched_debug.cfs_rq:/.spread0.=
min
    227479           +10.4%     251123 =C2=B1  3%  sched_debug.cfs_rq:/.spr=
ead0.stddev
      8.05 =C2=B1 21%     +59.2%      12.82 =C2=B1 27%  sched_debug.cpu.clo=
ck.stddev
      0.55 =C2=B1  7%     +61.5%       0.88 =C2=B1 14%  sched_debug.rt_rq:/=
.rt_time.avg
     68.39 =C2=B1 10%     +65.2%     113.01 =C2=B1 14%  sched_debug.rt_rq:/=
.rt_time.max
      6.02 =C2=B1 10%     +65.3%       9.95 =C2=B1 14%  sched_debug.rt_rq:/=
.rt_time.stddev
     51614            +6.2%      54828 =C2=B1  2%  proc-vmstat.nr_active_an=
on
   1762215 =C2=B1  3%      +5.3%    1855523        proc-vmstat.nr_anon_pages
   1855872 =C2=B1  3%      +9.5%    2032582        proc-vmstat.nr_inactive_=
anon
     25600           -19.4%      20637        proc-vmstat.nr_mapped
      8779            +3.6%       9100        proc-vmstat.nr_page_table_pag=
es
     51614            +6.2%      54828 =C2=B1  2%  proc-vmstat.nr_zone_acti=
ve_anon
   1855870 =C2=B1  3%      +9.5%    2032581        proc-vmstat.nr_zone_inac=
tive_anon
 3.725e+09           -26.0%  2.758e+09        proc-vmstat.numa_hit
 3.726e+09           -25.9%  2.759e+09        proc-vmstat.numa_local
    140034 =C2=B1  3%     -15.7%     118073 =C2=B1  4%  proc-vmstat.numa_pt=
e_updates
    164530            -6.5%     153823 =C2=B1  2%  proc-vmstat.pgactivate
 3.722e+09           -25.9%  2.756e+09        proc-vmstat.pgalloc_normal
 3.712e+09           -25.9%  2.749e+09        proc-vmstat.pgfault
 3.722e+09           -25.9%  2.756e+09        proc-vmstat.pgfree
     92383            -2.0%      90497        proc-vmstat.pgreuse
     14.36           -11.1%      12.77        perf-stat.i.MPKI
 1.493e+10           -11.2%  1.326e+10        perf-stat.i.branch-instructio=
ns
      0.12            -0.0        0.09        perf-stat.i.branch-miss-rate%
  16850271           -30.3%   11746955        perf-stat.i.branch-misses
     53.64            -9.1       44.57        perf-stat.i.cache-miss-rate%
  5.43e+08           -36.0%  3.473e+08        perf-stat.i.cache-misses
 1.012e+09           -23.1%  7.788e+08        perf-stat.i.cache-references
      1550            -3.2%       1500        perf-stat.i.context-switches
      5.92           +16.4%       6.89        perf-stat.i.cpi
 4.178e+11            +1.0%  4.219e+11        perf-stat.i.cpu-cycles
    150.89            -2.3%     147.36        perf-stat.i.cpu-migrations
    769.17           +57.8%       1213        perf-stat.i.cycles-between-ca=
che-misses
      0.01            -0.0        0.01 =C2=B1  3%  perf-stat.i.dTLB-load-mi=
ss-rate%
   1363413 =C2=B1  3%     -41.4%     799244 =C2=B1  4%  perf-stat.i.dTLB-lo=
ad-misses
 1.855e+10           -13.9%  1.597e+10        perf-stat.i.dTLB-loads
      1.87            -0.0        1.83        perf-stat.i.dTLB-store-miss-r=
ate%
  1.45e+08           -27.1%  1.057e+08        perf-stat.i.dTLB-store-misses
 7.586e+09           -25.1%  5.682e+09        perf-stat.i.dTLB-stores
 7.051e+10           -13.3%  6.114e+10        perf-stat.i.instructions
      0.17           -14.0%       0.15        perf-stat.i.ipc
    333.69          +209.4%       1032        perf-stat.i.metric.K/sec
    332.10           -16.3%     278.07        perf-stat.i.metric.M/sec
  12265683           -25.6%    9119612        perf-stat.i.minor-faults
      8.89            +4.2       13.06        perf-stat.i.node-load-miss-ra=
te%
   1327995           -33.6%     882417        perf-stat.i.node-load-misses
  14189574           -57.0%    6101421        perf-stat.i.node-loads
      0.63            +0.0        0.68        perf-stat.i.node-store-miss-r=
ate%
   2654944           -33.3%    1769896        perf-stat.i.node-store-misses
 4.223e+08           -38.3%  2.606e+08        perf-stat.i.node-stores
  12265684           -25.6%    9119613        perf-stat.i.page-faults
     14.35           -11.1%      12.76        perf-stat.overall.MPKI
      0.11            -0.0        0.09        perf-stat.overall.branch-miss=
-rate%
     53.62            -9.0       44.59        perf-stat.overall.cache-miss-=
rate%
      5.93           +16.4%       6.90        perf-stat.overall.cpi
    770.18           +57.5%       1213        perf-stat.overall.cycles-betw=
een-cache-misses
      0.01 =C2=B1  2%      -0.0        0.01 =C2=B1  4%  perf-stat.overall.d=
TLB-load-miss-rate%
      1.87            -0.0        1.83        perf-stat.overall.dTLB-store-=
miss-rate%
      0.17           -14.1%       0.14        perf-stat.overall.ipc
      8.47            +3.9       12.38        perf-stat.overall.node-load-m=
iss-rate%
      0.62            +0.0        0.67        perf-stat.overall.node-store-=
miss-rate%
   1728530           +16.5%    2012907        perf-stat.overall.path-length
 1.483e+10           -11.8%  1.309e+10        perf-stat.ps.branch-instructi=
ons
  16689442           -30.9%   11532682        perf-stat.ps.branch-misses
 5.392e+08           -36.3%  3.433e+08        perf-stat.ps.cache-misses
 1.006e+09           -23.4%  7.698e+08        perf-stat.ps.cache-references
      1534            -4.1%       1472        perf-stat.ps.context-switches
    148.92            -2.9%     144.56        perf-stat.ps.cpu-migrations
   1379865 =C2=B1  2%     -39.8%     830956 =C2=B1  4%  perf-stat.ps.dTLB-l=
oad-misses
 1.843e+10           -14.5%  1.576e+10        perf-stat.ps.dTLB-loads
  1.44e+08           -27.5%  1.045e+08        perf-stat.ps.dTLB-store-misses
 7.537e+09           -25.6%  5.611e+09        perf-stat.ps.dTLB-stores
 7.006e+10           -13.9%  6.035e+10        perf-stat.ps.instructions
      0.97            -7.8%       0.89        perf-stat.ps.major-faults
  12184666           -26.0%    9015678        perf-stat.ps.minor-faults
   1314901           -34.3%     864119        perf-stat.ps.node-load-misses
  14202713           -56.9%    6114798        perf-stat.ps.node-loads
   2633146           -34.0%    1737950        perf-stat.ps.node-store-misses
 4.191e+08           -38.6%  2.575e+08        perf-stat.ps.node-stores
  12184667           -26.0%    9015679        perf-stat.ps.page-faults
  2.13e+13           -13.8%  1.837e+13        perf-stat.total.instructions
     22.34 =C2=B1  4%     -22.3        0.00        perf-profile.calltrace.c=
ycles-pp.folio_lruvec_lock_irqsave.release_pages.tlb_flush_mmu.zap_pte_rang=
e.zap_pmd_range
     22.34 =C2=B1  4%     -22.3        0.00        perf-profile.calltrace.c=
ycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.tlb=
_flush_mmu.zap_pte_range
     22.33 =C2=B1  4%     -22.3        0.00        perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruv=
ec_lock_irqsave.release_pages.tlb_flush_mmu
     10.82            -9.6        1.26        perf-profile.calltrace.cycles=
-pp.folio_add_lru.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_us=
er_addr_fault
     10.74            -9.5        1.20 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.__pagevec_lru_add.folio_add_lru.do_anonymous_page.__handle_mm_faul=
t.handle_mm_fault
     67.12            -9.3       57.77        perf-profile.calltrace.cycles=
-pp.testcase
     67.39            -9.3       58.05        perf-profile.calltrace.cycles=
-pp.asm_exc_page_fault.testcase
      9.85            -9.3        0.60 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__pagevec_lru_add=
.folio_add_lru.do_anonymous_page
      9.85            -9.2        0.61 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.folio_lruvec_lock_irqsave.__pagevec_lru_add.folio_add_lru.do_anony=
mous_page.__handle_mm_fault
      9.80            -9.2        0.57 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruv=
ec_lock_irqsave.__pagevec_lru_add.folio_add_lru
     63.37            -8.3       55.10        perf-profile.calltrace.cycles=
-pp.exc_page_fault.asm_exc_page_fault.testcase
     63.30            -8.3       55.04        perf-profile.calltrace.cycles=
-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     62.65            -8.1       54.57        perf-profile.calltrace.cycles=
-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.te=
stcase
     62.18            -7.9       54.23        perf-profile.calltrace.cycles=
-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm=
_exc_page_fault
     61.61            -7.8       53.84        perf-profile.calltrace.cycles=
-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.=
exc_page_fault
      6.69            -2.5        4.15 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.__mem_cgroup_charge.do_anonymous_page.__handle_mm_fault.handle_mm_=
fault.do_user_addr_fault
      5.36            -2.0        3.35 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.charge_memcg.__mem_cgroup_charge.do_anonymous_page.__handle_mm_fau=
lt.handle_mm_fault
      4.76            -1.7        3.05        perf-profile.calltrace.cycles=
-pp.clear_page_erms.get_page_from_freelist.__alloc_pages.alloc_pages_vma.do=
_anonymous_page
      2.25            -0.8        1.41 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.try_charge_memcg.charge_memcg.__mem_cgroup_charge.do_anonymous_pag=
e.__handle_mm_fault
      1.16            -0.3        0.84        perf-profile.calltrace.cycles=
-pp.error_entry.testcase
      1.08            -0.3        0.78        perf-profile.calltrace.cycles=
-pp.sync_regs.error_entry.testcase
      0.00            +0.6        0.58        perf-profile.calltrace.cycles=
-pp.__free_one_page.free_pcppages_bulk.free_unref_page_list.release_pages.t=
lb_flush_mmu
      3.31            +0.8        4.16        perf-profile.calltrace.cycles=
-pp.tlb_finish_mmu.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap
      3.29            +0.8        4.14        perf-profile.calltrace.cycles=
-pp.release_pages.tlb_finish_mmu.unmap_region.__do_munmap.__vm_munmap
      0.87 =C2=B1  7%      +3.1        3.96        perf-profile.calltrace.c=
ycles-pp._raw_spin_lock.free_pcppages_bulk.free_unref_page_list.release_pag=
es.tlb_finish_mmu
      0.98 =C2=B1  6%      +3.1        4.08        perf-profile.calltrace.c=
ycles-pp.free_unref_page_list.release_pages.tlb_finish_mmu.unmap_region.__d=
o_munmap
      0.95 =C2=B1  7%      +3.1        4.05        perf-profile.calltrace.c=
ycles-pp.free_pcppages_bulk.free_unref_page_list.release_pages.tlb_finish_m=
mu.unmap_region
     43.13            +4.6       47.75        perf-profile.calltrace.cycles=
-pp.alloc_pages_vma.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_=
user_addr_fault
     42.94            +4.7       47.60        perf-profile.calltrace.cycles=
-pp.__alloc_pages.alloc_pages_vma.do_anonymous_page.__handle_mm_fault.handl=
e_mm_fault
     42.69            +4.7       47.42        perf-profile.calltrace.cycles=
-pp.get_page_from_freelist.__alloc_pages.alloc_pages_vma.do_anonymous_page.=
__handle_mm_fault
     37.53            +6.6       44.09        perf-profile.calltrace.cycles=
-pp.rmqueue.get_page_from_freelist.__alloc_pages.alloc_pages_vma.do_anonymo=
us_page
     37.08            +6.7       43.76        perf-profile.calltrace.cycles=
-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.alloc_pages_v=
ma
     36.25            +6.7       42.94        perf-profile.calltrace.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.rmqueue_bulk.rmqueue.ge=
t_page_from_freelist
     36.26            +6.7       42.96        perf-profile.calltrace.cycles=
-pp._raw_spin_lock.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages
     28.37            +8.7       37.04        perf-profile.calltrace.cycles=
-pp.unmap_vmas.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap
     28.37            +8.7       37.04        perf-profile.calltrace.cycles=
-pp.unmap_page_range.unmap_vmas.unmap_region.__do_munmap.__vm_munmap
     28.37            +8.7       37.04        perf-profile.calltrace.cycles=
-pp.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region.__do_munmap
     28.35            +8.7       37.03        perf-profile.calltrace.cycles=
-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region
     27.31            +9.1       36.40        perf-profile.calltrace.cycles=
-pp.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
     27.16            +9.2       36.32        perf-profile.calltrace.cycles=
-pp.release_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range
     31.70            +9.5       41.20        perf-profile.calltrace.cycles=
-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     31.70            +9.5       41.20        perf-profile.calltrace.cycles=
-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
     31.70            +9.5       41.20        perf-profile.calltrace.cycles=
-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.__munmap
     31.70            +9.5       41.20        perf-profile.calltrace.cycles=
-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     31.70            +9.5       41.21        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.__munmap
     31.70            +9.5       41.21        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     31.70            +9.5       41.21        perf-profile.calltrace.cycles=
-pp.__munmap
      3.40 =C2=B1 14%     +31.6       34.97        perf-profile.calltrace.c=
ycles-pp._raw_spin_lock.free_pcppages_bulk.free_unref_page_list.release_pag=
es.tlb_flush_mmu
      4.15 =C2=B1 12%     +31.7       35.82        perf-profile.calltrace.c=
ycles-pp.free_unref_page_list.release_pages.tlb_flush_mmu.zap_pte_range.zap=
_pmd_range
      3.94 =C2=B1 12%     +31.7       35.61        perf-profile.calltrace.c=
ycles-pp.free_pcppages_bulk.free_unref_page_list.release_pages.tlb_flush_mm=
u.zap_pte_range
      4.28 =C2=B1 10%     +34.6       38.93        perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk=
.free_unref_page_list.release_pages
     34.49 =C2=B1  2%     -33.7        0.74 =C2=B1  5%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
     34.49 =C2=B1  2%     -33.7        0.74 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.folio_lruvec_lock_irqsave
     10.86            -9.6        1.27        perf-profile.children.cycles-=
pp.folio_add_lru
     10.80            -9.6        1.21 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__pagevec_lru_add
     68.04            -9.6       58.47        perf-profile.children.cycles-=
pp.testcase
     65.56            -8.9       56.70        perf-profile.children.cycles-=
pp.asm_exc_page_fault
     63.41            -8.3       55.13        perf-profile.children.cycles-=
pp.exc_page_fault
     63.35            -8.3       55.09        perf-profile.children.cycles-=
pp.do_user_addr_fault
     62.69            -8.1       54.60        perf-profile.children.cycles-=
pp.handle_mm_fault
     62.20            -7.9       54.26        perf-profile.children.cycles-=
pp.__handle_mm_fault
     61.84            -7.8       54.00        perf-profile.children.cycles-=
pp.do_anonymous_page
      6.74            -2.6        4.18 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__mem_cgroup_charge
      5.56            -2.1        3.47 =C2=B1  2%  perf-profile.children.cy=
cles-pp.charge_memcg
      4.82            -1.7        3.09        perf-profile.children.cycles-=
pp.clear_page_erms
      2.26            -0.8        1.42 =C2=B1  2%  perf-profile.children.cy=
cles-pp.try_charge_memcg
      1.21            -0.3        0.88        perf-profile.children.cycles-=
pp.error_entry
      1.08            -0.3        0.79        perf-profile.children.cycles-=
pp.sync_regs
      1.01            -0.3        0.73        perf-profile.children.cycles-=
pp.native_irq_return_iret
      0.66            -0.3        0.39 =C2=B1  3%  perf-profile.children.cy=
cles-pp.get_mem_cgroup_from_mm
      0.68            -0.2        0.44        perf-profile.children.cycles-=
pp.__mod_lruvec_page_state
      0.66            -0.2        0.48        perf-profile.children.cycles-=
pp.__pagevec_lru_add_fn
      0.50            -0.2        0.32 =C2=B1  2%  perf-profile.children.cy=
cles-pp.page_add_new_anon_rmap
      0.53            -0.2        0.37        perf-profile.children.cycles-=
pp.__list_del_entry_valid
      0.47            -0.1        0.32        perf-profile.children.cycles-=
pp.asm_sysvec_apic_timer_interrupt
      0.41            -0.1        0.27        perf-profile.children.cycles-=
pp.page_remove_rmap
      0.39            -0.1        0.28 =C2=B1  3%  perf-profile.children.cy=
cles-pp.sysvec_apic_timer_interrupt
      0.38            -0.1        0.26        perf-profile.children.cycles-=
pp.__mod_memcg_lruvec_state
      0.37            -0.1        0.26 =C2=B1  3%  perf-profile.children.cy=
cles-pp.__sysvec_apic_timer_interrupt
      0.37            -0.1        0.26 =C2=B1  3%  perf-profile.children.cy=
cles-pp.hrtimer_interrupt
      0.26 =C2=B1  5%      -0.1        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.page_counter_try_charge
      0.32            -0.1        0.21        perf-profile.children.cycles-=
pp.__mod_lruvec_state
      0.33            -0.1        0.23 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__hrtimer_run_queues
      0.32            -0.1        0.23 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__perf_sw_event
      0.30            -0.1        0.21 =C2=B1  3%  perf-profile.children.cy=
cles-pp.tick_sched_timer
      0.29            -0.1        0.20 =C2=B1  2%  perf-profile.children.cy=
cles-pp.tick_sched_handle
      0.29            -0.1        0.20 =C2=B1  2%  perf-profile.children.cy=
cles-pp.update_process_times
      0.23 =C2=B1  2%      -0.1        0.15        perf-profile.children.cy=
cles-pp.__mod_node_page_state
      0.27            -0.1        0.19 =C2=B1  2%  perf-profile.children.cy=
cles-pp.scheduler_tick
      0.14 =C2=B1  3%      -0.1        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.free_pages_and_swap_cache
      0.25            -0.1        0.17 =C2=B1  2%  perf-profile.children.cy=
cles-pp.task_tick_fair
      0.13 =C2=B1  3%      -0.1        0.06        perf-profile.children.cy=
cles-pp.free_swap_cache
      0.22            -0.1        0.15 =C2=B1  5%  perf-profile.children.cy=
cles-pp.update_curr
      0.24            -0.1        0.17        perf-profile.children.cycles-=
pp.___perf_sw_event
      0.16 =C2=B1  3%      -0.1        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.irqentry_exit_to_user_mode
      0.12 =C2=B1  3%      -0.1        0.06        perf-profile.children.cy=
cles-pp.task_numa_work
      0.15 =C2=B1  5%      -0.1        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.exit_to_user_mode_prepare
      0.20            -0.1        0.14 =C2=B1  5%  perf-profile.children.cy=
cles-pp.perf_trace_sched_stat_runtime
      0.13 =C2=B1  3%      -0.1        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.exit_to_user_mode_loop
      0.12 =C2=B1  3%      -0.1        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.task_work_run
      0.12 =C2=B1  6%      -0.1        0.06        perf-profile.children.cy=
cles-pp.change_prot_numa
      0.12 =C2=B1  6%      -0.1        0.06        perf-profile.children.cy=
cles-pp.change_protection_range
      0.12 =C2=B1  6%      -0.1        0.06        perf-profile.children.cy=
cles-pp.change_pmd_range
      0.12 =C2=B1  6%      -0.1        0.06        perf-profile.children.cy=
cles-pp.change_pte_range
      0.20 =C2=B1  2%      -0.1        0.14 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.perf_tp_event
      0.19 =C2=B1  2%      -0.1        0.13 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.__perf_event_overflow
      0.19 =C2=B1  2%      -0.1        0.13 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.perf_event_output_forward
      0.16            -0.0        0.11 =C2=B1  4%  perf-profile.children.cy=
cles-pp.perf_callchain
      0.16 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.get_perf_callchain
      0.16            -0.0        0.12 =C2=B1  4%  perf-profile.children.cy=
cles-pp.perf_prepare_sample
      0.13 =C2=B1  3%      -0.0        0.10 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.cgroup_rstat_updated
      0.09            -0.0        0.06 =C2=B1  8%  perf-profile.children.cy=
cles-pp.__irqentry_text_end
      0.09 =C2=B1  5%      -0.0        0.06        perf-profile.children.cy=
cles-pp.__cgroup_throttle_swaprate
      0.12 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.perf_callchain_kernel
      0.11 =C2=B1  4%      -0.0        0.08        perf-profile.children.cy=
cles-pp.free_unref_page_commit
      0.11 =C2=B1  4%      -0.0        0.08        perf-profile.children.cy=
cles-pp.__count_memcg_events
      0.09            -0.0        0.06        perf-profile.children.cycles-=
pp.__mem_cgroup_uncharge_list
      0.12 =C2=B1  3%      -0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.mem_cgroup_charge_statistics
      0.09 =C2=B1  5%      -0.0        0.06        perf-profile.children.cy=
cles-pp.mem_cgroup_update_lru_size
      0.06            -0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.handle_pte_fault
      0.12 =C2=B1  4%      -0.0        0.09        perf-profile.children.cy=
cles-pp.__might_resched
      0.08            -0.0        0.06 =C2=B1  8%  perf-profile.children.cy=
cles-pp.up_read
      0.10 =C2=B1  4%      -0.0        0.08        perf-profile.children.cy=
cles-pp.__mod_zone_page_state
      0.08            -0.0        0.06        perf-profile.children.cycles-=
pp.down_read_trylock
      0.07            -0.0        0.05        perf-profile.children.cycles-=
pp.folio_mapping
      0.07            -0.0        0.05        perf-profile.children.cycles-=
pp.find_vma
      0.09            -0.0        0.07 =C2=B1  6%  perf-profile.children.cy=
cles-pp.unwind_next_frame
      0.06            -0.0        0.05        perf-profile.children.cycles-=
pp.__cond_resched
      0.16            +0.0        0.17 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__list_add_valid
      0.06 =C2=B1  8%      +0.0        0.10 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__tlb_remove_page_size
      0.06 =C2=B1  7%      +0.1        0.13 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.shmem_alloc_and_acct_page
      0.06 =C2=B1  7%      +0.1        0.13 =C2=B1 18%  perf-profile.childr=
en.cycles-pp.shmem_alloc_page
      0.00            +0.1        0.09 =C2=B1  5%  perf-profile.children.cy=
cles-pp.__get_free_pages
      0.55 =C2=B1  3%      +0.1        0.68        perf-profile.children.cy=
cles-pp.__free_one_page
      3.31            +0.8        4.16        perf-profile.children.cycles-=
pp.tlb_finish_mmu
     43.22            +4.7       47.91        perf-profile.children.cycles-=
pp.alloc_pages_vma
     43.13            +4.8       47.90        perf-profile.children.cycles-=
pp.__alloc_pages
     42.83            +4.9       47.69        perf-profile.children.cycles-=
pp.get_page_from_freelist
     37.68            +6.7       44.37        perf-profile.children.cycles-=
pp.rmqueue
     37.20            +6.8       44.02        perf-profile.children.cycles-=
pp.rmqueue_bulk
     75.05            +7.8       82.83        perf-profile.children.cycles-=
pp.native_queued_spin_lock_slowpath
     28.37            +8.7       37.04        perf-profile.children.cycles-=
pp.unmap_vmas
     28.37            +8.7       37.04        perf-profile.children.cycles-=
pp.unmap_page_range
     28.37            +8.7       37.04        perf-profile.children.cycles-=
pp.zap_pmd_range
     28.37            +8.7       37.04        perf-profile.children.cycles-=
pp.zap_pte_range
     27.31            +9.1       36.40        perf-profile.children.cycles-=
pp.tlb_flush_mmu
     31.70            +9.5       41.20        perf-profile.children.cycles-=
pp.__do_munmap
     31.70            +9.5       41.20        perf-profile.children.cycles-=
pp.__vm_munmap
     31.70            +9.5       41.20        perf-profile.children.cycles-=
pp.__x64_sys_munmap
     31.70            +9.5       41.20        perf-profile.children.cycles-=
pp.unmap_region
     31.70            +9.5       41.21        perf-profile.children.cycles-=
pp.__munmap
     31.91            +9.5       41.44        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_after_hwframe
     31.91            +9.5       41.44        perf-profile.children.cycles-=
pp.do_syscall_64
     30.60           +10.0       40.57        perf-profile.children.cycles-=
pp.release_pages
      5.15 =C2=B1  8%     +34.8       39.91        perf-profile.children.cy=
cles-pp.free_unref_page_list
      4.90 =C2=B1  9%     +34.8       39.69        perf-profile.children.cy=
cles-pp.free_pcppages_bulk
     40.73 =C2=B1  2%     +41.5       82.22        perf-profile.children.cy=
cles-pp._raw_spin_lock
      4.79            -1.7        3.08 =C2=B1  2%  perf-profile.self.cycles=
-pp.clear_page_erms
      3.27            -1.2        2.02 =C2=B1  2%  perf-profile.self.cycles=
-pp.charge_memcg
      1.80            -0.7        1.15 =C2=B1  2%  perf-profile.self.cycles=
-pp.try_charge_memcg
      2.15            -0.6        1.59        perf-profile.self.cycles-pp.t=
estcase
      0.57 =C2=B1  3%      -0.3        0.27 =C2=B1  3%  perf-profile.self.c=
ycles-pp.zap_pte_range
      1.06            -0.3        0.77        perf-profile.self.cycles-pp.s=
ync_regs
      1.01            -0.3        0.73        perf-profile.self.cycles-pp.n=
ative_irq_return_iret
      0.63            -0.3        0.38 =C2=B1  3%  perf-profile.self.cycles=
-pp.get_mem_cgroup_from_mm
      0.51            -0.2        0.34        perf-profile.self.cycles-pp._=
_list_del_entry_valid
      0.55 =C2=B1  2%      -0.2        0.39        perf-profile.self.cycles=
-pp.do_anonymous_page
      0.39 =C2=B1  2%      -0.2        0.24 =C2=B1  3%  perf-profile.self.c=
ycles-pp.__mem_cgroup_charge
      0.30 =C2=B1  2%      -0.1        0.18 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__mod_lruvec_page_state
      0.38            -0.1        0.27        perf-profile.self.cycles-pp.r=
elease_pages
      0.34            -0.1        0.23 =C2=B1  2%  perf-profile.self.cycles=
-pp.get_page_from_freelist
      0.25            -0.1        0.14 =C2=B1  3%  perf-profile.self.cycles=
-pp.rmqueue
      0.30            -0.1        0.21 =C2=B1  2%  perf-profile.self.cycles=
-pp.__mod_memcg_lruvec_state
      0.22 =C2=B1  6%      -0.1        0.13 =C2=B1  3%  perf-profile.self.c=
ycles-pp.page_counter_try_charge
      0.33            -0.1        0.24        perf-profile.self.cycles-pp._=
_pagevec_lru_add_fn
      0.22 =C2=B1  2%      -0.1        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.__mod_node_page_state
      0.28            -0.1        0.21 =C2=B1  2%  perf-profile.self.cycles=
-pp.__handle_mm_fault
      0.13 =C2=B1  3%      -0.1        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.free_swap_cache
      0.11 =C2=B1  4%      -0.1        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.change_pte_range
      0.19 =C2=B1  2%      -0.1        0.14        perf-profile.self.cycles=
-pp.handle_mm_fault
      0.16 =C2=B1  2%      -0.0        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__alloc_pages
      0.17 =C2=B1  2%      -0.0        0.12        perf-profile.self.cycles=
-pp.___perf_sw_event
      0.14 =C2=B1  3%      -0.0        0.10        perf-profile.self.cycles=
-pp.page_remove_rmap
      0.16            -0.0        0.12        perf-profile.self.cycles-pp.d=
o_user_addr_fault
      0.07            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp._raw_spin_lock_irqsave
      0.09            -0.0        0.06        perf-profile.self.cycles-pp._=
_perf_sw_event
      0.09            -0.0        0.06        perf-profile.self.cycles-pp._=
_count_memcg_events
      0.11            -0.0        0.08        perf-profile.self.cycles-pp.c=
group_rstat_updated
      0.11            -0.0        0.08        perf-profile.self.cycles-pp._=
_might_resched
      0.08            -0.0        0.05        perf-profile.self.cycles-pp._=
_irqentry_text_end
      0.13            -0.0        0.10        perf-profile.self.cycles-pp.e=
rror_entry
      0.12            -0.0        0.09        perf-profile.self.cycles-pp.a=
lloc_pages_vma
      0.09 =C2=B1  5%      -0.0        0.06        perf-profile.self.cycles=
-pp.free_unref_page_commit
      0.08            -0.0        0.06 =C2=B1  8%  perf-profile.self.cycles=
-pp.folio_add_lru
      0.07 =C2=B1  6%      -0.0        0.05        perf-profile.self.cycles=
-pp.mem_cgroup_update_lru_size
      0.10 =C2=B1  4%      -0.0        0.07 =C2=B1  6%  perf-profile.self.c=
ycles-pp.mem_cgroup_charge_statistics
      0.10            -0.0        0.08        perf-profile.self.cycles-pp._=
raw_spin_lock
      0.07 =C2=B1  6%      -0.0        0.05 =C2=B1  8%  perf-profile.self.c=
ycles-pp.down_read_trylock
      0.09            -0.0        0.07        perf-profile.self.cycles-pp._=
_mod_zone_page_state
      0.08            -0.0        0.06        perf-profile.self.cycles-pp._=
_mod_lruvec_state
      0.07 =C2=B1  6%      -0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.asm_exc_page_fault
      0.07            -0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.up_read
      0.06 =C2=B1  7%      -0.0        0.05        perf-profile.self.cycles=
-pp.folio_mapping
      0.08 =C2=B1  5%      -0.0        0.07        perf-profile.self.cycles=
-pp.free_unref_page_list
      0.13            +0.0        0.15 =C2=B1  3%  perf-profile.self.cycles=
-pp.__list_add_valid
      0.48            +0.1        0.58        perf-profile.self.cycles-pp.r=
mqueue_bulk
      0.46 =C2=B1  3%      +0.1        0.56        perf-profile.self.cycles=
-pp.__free_one_page
     75.05            +7.8       82.83        perf-profile.self.cycles-pp.n=
ative_queued_spin_lock_slowpath

--===============1342433773051149988==--

