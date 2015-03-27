Content-Type: multipart/mixed; boundary="===============4334615157789706974=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Fri, 27 Mar 2015 16:49:18 +0800
Message-ID: <1427446158.17170.72.camel@intel.com>
In-Reply-To: <20150325105448.GH4701@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4334615157789706974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-03-25 at 10:54 +0000, Mel Gorman wrote:
> On Mon, Mar 23, 2015 at 04:46:21PM +0800, Huang Ying wrote:
> > > My attention is occupied by the automatic NUMA regression at the mome=
nt
> > > but I haven't forgotten this. Even with the high client count, I was =
not
> > > able to reproduce this so it appears to depend on the number of CPUs
> > > available to stress the allocator enough to bypass the per-cpu alloca=
tor
> > > enough to contend heavily on the zone lock. I'm hoping to think of a
> > > better alternative than adding more padding and increasing the cache
> > > footprint of the allocator but so far I haven't thought of a good
> > > alternative. Moving the lock to the end of the freelists would probab=
ly
> > > address the problem but still increases the footprint for order-0
> > > allocations by a cache line.
> > =

> > Any update on this?  Do you have some better idea?  I guess this may be
> > fixed via putting some fields that are only read during order-0
> > allocation with the same cache line of lock, if there are any.
> > =

> =

> Sorry for the delay, the automatic NUMA regression took a long time to
> close and it potentially affected anybody with a NUMA machine, not just
> stress tests on large machines.
> =

> Moving it beside other fields shifts the problems. The lock is related
> to the free areas so it really belongs nearby and from my own testing,
> it does not affect mid-sized machines. I'd rather not put the lock in its
> own cache line unless we have to. Can you try the following untested patch
> instead? It is untested but builds and should be safe.
> =

> It'll increase the footprint of the page allocator but so would padding.
> It means it will contend with high-order free page breakups but that
> is not likely to happen during stress tests. It also collides with flags
> but they are relatively rarely updated.
> =

> =

> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index f279d9c158cd..2782df47101e 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -474,16 +474,15 @@ struct zone {
>  	unsigned long		wait_table_bits;
>  =

>  	ZONE_PADDING(_pad1_)
> -
> -	/* Write-intensive fields used from the page allocator */
> -	spinlock_t		lock;
> -
>  	/* free areas of different sizes */
>  	struct free_area	free_area[MAX_ORDER];
>  =

>  	/* zone flags, see below */
>  	unsigned long		flags;
>  =

> +	/* Write-intensive fields used from the page allocator */
> +	spinlock_t		lock;
> +
>  	ZONE_PADDING(_pad2_)
>  =

>  	/* Write-intensive fields used by page reclaim */

Stress page allocator tests here shows that the performance restored to
its previous level with the patch above.  I applied your patch on lasted
upstream kernel.  Result is as below:

testbox/testcase/testparams: brickland1/aim7/performance-6000-page_test

c875f421097a55d9  dbdc458f1b7d07f32891509c06  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     84568 =C2=B1  1%     +94.3%     164280 =C2=B1  1%  aim7.jobs-per-min
   2881944 =C2=B1  2%     -35.1%    1870386 =C2=B1  8%  aim7.time.voluntary=
_context_switches
       681 =C2=B1  1%      -3.4%        658 =C2=B1  0%  aim7.time.user_time
   5538139 =C2=B1  0%     -12.1%    4867884 =C2=B1  0%  aim7.time.involunta=
ry_context_switches
     44174 =C2=B1  1%     -46.0%      23848 =C2=B1  1%  aim7.time.system_ti=
me
       426 =C2=B1  1%     -48.4%        219 =C2=B1  1%  aim7.time.elapsed_t=
ime
       426 =C2=B1  1%     -48.4%        219 =C2=B1  1%  aim7.time.elapsed_t=
ime.max
       468 =C2=B1  1%     -43.1%        266 =C2=B1  2%  uptime.boot
     13691 =C2=B1  0%     -24.2%      10379 =C2=B1  1%  softirqs.NET_RX
    931382 =C2=B1  2%     +24.9%    1163065 =C2=B1  1%  softirqs.RCU
    407717 =C2=B1  2%     -36.3%     259521 =C2=B1  9%  softirqs.SCHED
  19690372 =C2=B1  0%     -34.8%   12836548 =C2=B1  1%  softirqs.TIMER
      2442 =C2=B1  1%     -28.9%       1737 =C2=B1  5%  vmstat.procs.b
      3016 =C2=B1  3%     +19.4%       3603 =C2=B1  4%  vmstat.procs.r
    104330 =C2=B1  1%     +34.6%     140387 =C2=B1  0%  vmstat.system.in
     22172 =C2=B1  0%     +48.3%      32877 =C2=B1  2%  vmstat.system.cs
      1891 =C2=B1 12%     -48.2%        978 =C2=B1 10%  numa-numastat.node0=
.other_node
      1785 =C2=B1 14%     -47.7%        933 =C2=B1  6%  numa-numastat.node1=
.other_node
      1790 =C2=B1 12%     -47.8%        935 =C2=B1 10%  numa-numastat.node2=
.other_node
      1766 =C2=B1 14%     -47.0%        935 =C2=B1 12%  numa-numastat.node3=
.other_node
       426 =C2=B1  1%     -48.4%        219 =C2=B1  1%  time.elapsed_time.m=
ax
       426 =C2=B1  1%     -48.4%        219 =C2=B1  1%  time.elapsed_time
   5538139 =C2=B1  0%     -12.1%    4867884 =C2=B1  0%  time.involuntary_co=
ntext_switches
     44174 =C2=B1  1%     -46.0%      23848 =C2=B1  1%  time.system_time
   2881944 =C2=B1  2%     -35.1%    1870386 =C2=B1  8%  time.voluntary_cont=
ext_switches
   7831898 =C2=B1  4%     +31.8%   10325919 =C2=B1  5%  meminfo.Active
   7742498 =C2=B1  4%     +32.2%   10237222 =C2=B1  5%  meminfo.Active(anon)
   7231211 =C2=B1  4%     +28.7%    9308183 =C2=B1  5%  meminfo.AnonPages
  7.55e+11 =C2=B1  4%     +19.6%  9.032e+11 =C2=B1  8%  meminfo.Committed_AS
     14010 =C2=B1  1%     -17.4%      11567 =C2=B1  1%  meminfo.Inactive(an=
on)
    668946 =C2=B1  4%     +40.8%     941815 =C2=B1 27%  meminfo.PageTables
     15392 =C2=B1  1%     -15.9%      12945 =C2=B1  1%  meminfo.Shmem
      1185 =C2=B1  0%      -4.4%       1133 =C2=B1  0%  turbostat.Avg_MHz
      3.29 =C2=B1  6%     -64.5%       1.17 =C2=B1 14%  turbostat.CPU%c1
      0.10 =C2=B1 12%     -90.3%       0.01 =C2=B1  0%  turbostat.CPU%c3
      2.95 =C2=B1  3%     +73.9%       5.13 =C2=B1  3%  turbostat.CPU%c6
       743 =C2=B1  9%     -70.7%        217 =C2=B1 17%  turbostat.CorWatt
       300 =C2=B1  0%      -9.4%        272 =C2=B1  0%  turbostat.PKG_%
      1.58 =C2=B1  2%     +59.6%       2.53 =C2=B1 20%  turbostat.Pkg%pc2
       758 =C2=B1  9%     -69.3%        232 =C2=B1 16%  turbostat.PkgWatt
     15.08 =C2=B1  0%      +5.4%      15.90 =C2=B1  1%  turbostat.RAMWatt
    105729 =C2=B1  6%     -47.0%      56005 =C2=B1 25%  cpuidle.C1-IVT-4S.u=
sage
 2.535e+08 =C2=B1 12%     -62.7%   94532092 =C2=B1 22%  cpuidle.C1-IVT-4S.t=
ime
 4.386e+08 =C2=B1  4%     -79.4%   90246312 =C2=B1 23%  cpuidle.C1E-IVT-4S.=
time
     83425 =C2=B1  6%     -71.7%      23571 =C2=B1 23%  cpuidle.C1E-IVT-4S.=
usage
     14237 =C2=B1  8%     -79.0%       2983 =C2=B1 19%  cpuidle.C3-IVT-4S.u=
sage
 1.242e+08 =C2=B1  7%     -87.5%   15462238 =C2=B1 18%  cpuidle.C3-IVT-4S.t=
ime
     87857 =C2=B1  7%     -71.1%      25355 =C2=B1  5%  cpuidle.C6-IVT-4S.u=
sage
 2.359e+09 =C2=B1  2%     -38.2%  1.458e+09 =C2=B1  2%  cpuidle.C6-IVT-4S.t=
ime
   1960460 =C2=B1  3%     +31.7%    2582336 =C2=B1  4%  proc-vmstat.nr_acti=
ve_anon
      5548 =C2=B1  2%     +53.2%       8498 =C2=B1  3%  proc-vmstat.nr_allo=
c_batch
   1830492 =C2=B1  3%     +28.4%    2349846 =C2=B1  3%  proc-vmstat.nr_anon=
_pages
      3514 =C2=B1  1%     -17.7%       2893 =C2=B1  1%  proc-vmstat.nr_inac=
tive_anon
    168712 =C2=B1  4%     +40.3%     236768 =C2=B1 27%  proc-vmstat.nr_page=
_table_pages
      3859 =C2=B1  1%     -16.1%       3238 =C2=B1  1%  proc-vmstat.nr_shmem
   1997823 =C2=B1  5%     -27.4%    1450005 =C2=B1  5%  proc-vmstat.numa_hi=
nt_faults
   1413076 =C2=B1  6%     -25.3%    1056268 =C2=B1  5%  proc-vmstat.numa_hi=
nt_faults_local
      7213 =C2=B1  6%     -47.3%       3799 =C2=B1  7%  proc-vmstat.numa_ot=
her
    406056 =C2=B1  3%     -41.9%     236064 =C2=B1  6%  proc-vmstat.numa_pa=
ges_migrated
   7242333 =C2=B1  3%     -29.2%    5130788 =C2=B1 10%  proc-vmstat.numa_pt=
e_updates
    406056 =C2=B1  3%     -41.9%     236064 =C2=B1  6%  proc-vmstat.pgmigra=
te_success
    484141 =C2=B1  3%     +32.7%     642529 =C2=B1  5%  numa-vmstat.node0.n=
r_active_anon
 1.509e+08 =C2=B1  0%     -12.6%  1.319e+08 =C2=B1  3%  numa-vmstat.node0.n=
uma_hit
    452041 =C2=B1  3%     +29.9%     587214 =C2=B1  5%  numa-vmstat.node0.n=
r_anon_pages
      1484 =C2=B1  1%     +36.5%       2026 =C2=B1 24%  numa-vmstat.node0.n=
r_alloc_batch
 1.509e+08 =C2=B1  0%     -12.6%  1.319e+08 =C2=B1  3%  numa-vmstat.node0.n=
uma_local
    493672 =C2=B1  8%     +30.5%     644195 =C2=B1 11%  numa-vmstat.node1.n=
r_active_anon
      1481 =C2=B1  9%     +52.5%       2259 =C2=B1  8%  numa-vmstat.node1.n=
r_alloc_batch
    462466 =C2=B1  8%     +27.4%     589287 =C2=B1 10%  numa-vmstat.node1.n=
r_anon_pages
    485463 =C2=B1  6%     +29.1%     626539 =C2=B1  4%  numa-vmstat.node2.n=
r_active_anon
       422 =C2=B1 15%     -63.1%        156 =C2=B1 38%  numa-vmstat.node2.n=
r_inactive_anon
     32587 =C2=B1  9%     +71.0%      55722 =C2=B1 32%  numa-vmstat.node2.n=
r_page_table_pages
      1365 =C2=B1  5%     +68.7%       2303 =C2=B1 11%  numa-vmstat.node2.n=
r_alloc_batch
    453583 =C2=B1  6%     +26.1%     572097 =C2=B1  4%  numa-vmstat.node2.n=
r_anon_pages
 1.378e+08 =C2=B1  2%      -8.5%   1.26e+08 =C2=B1  2%  numa-vmstat.node3.n=
uma_local
    441345 =C2=B1 10%     +28.4%     566740 =C2=B1  6%  numa-vmstat.node3.n=
r_anon_pages
 1.378e+08 =C2=B1  2%      -8.5%  1.261e+08 =C2=B1  2%  numa-vmstat.node3.n=
uma_hit
    471252 =C2=B1 10%     +31.9%     621440 =C2=B1  7%  numa-vmstat.node3.n=
r_active_anon
      1359 =C2=B1  4%     +75.1%       2380 =C2=B1 16%  numa-vmstat.node3.n=
r_alloc_batch
   1826489 =C2=B1  0%     +30.0%    2375174 =C2=B1  4%  numa-meminfo.node0.=
AnonPages
   2774145 =C2=B1  8%     +26.1%    3497281 =C2=B1  9%  numa-meminfo.node0.=
MemUsed
   1962338 =C2=B1  0%     +32.5%    2599292 =C2=B1  4%  numa-meminfo.node0.=
Active(anon)
   1985987 =C2=B1  0%     +32.0%    2621356 =C2=B1  4%  numa-meminfo.node0.=
Active
   2768321 =C2=B1  6%     +27.7%    3534224 =C2=B1 11%  numa-meminfo.node1.=
MemUsed
   1935382 =C2=B1  5%     +34.2%    2597532 =C2=B1 11%  numa-meminfo.node1.=
Active
   1913696 =C2=B1  5%     +34.6%    2575266 =C2=B1 11%  numa-meminfo.node1.=
Active(anon)
   1784346 =C2=B1  6%     +31.7%    2349891 =C2=B1 10%  numa-meminfo.node1.=
AnonPages
      1678 =C2=B1 15%     -62.7%        625 =C2=B1 39%  numa-meminfo.node2.=
Inactive(anon)
   2532834 =C2=B1  4%     +27.4%    3227116 =C2=B1  8%  numa-meminfo.node2.=
MemUsed
    132885 =C2=B1  9%     +67.9%     223159 =C2=B1 32%  numa-meminfo.node2.=
PageTables
   2004439 =C2=B1  5%     +26.1%    2528019 =C2=B1  5%  numa-meminfo.node2.=
Active
   1856674 =C2=B1  5%     +23.0%    2283461 =C2=B1  5%  numa-meminfo.node2.=
AnonPages
   1981962 =C2=B1  5%     +26.4%    2505422 =C2=B1  5%  numa-meminfo.node2.=
Active(anon)
   1862203 =C2=B1  8%     +33.0%    2476954 =C2=B1  6%  numa-meminfo.node3.=
Active(anon)
   1883841 =C2=B1  7%     +32.6%    2498686 =C2=B1  6%  numa-meminfo.node3.=
Active
   2572461 =C2=B1 11%     +24.2%    3195556 =C2=B1  8%  numa-meminfo.node3.=
MemUsed
   1739646 =C2=B1  8%     +29.4%    2250696 =C2=B1  6%  numa-meminfo.node3.=
AnonPages

Best Regards,
Huang, Ying



--===============4334615157789706974==--

