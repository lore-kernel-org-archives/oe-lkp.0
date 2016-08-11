Content-Type: multipart/mixed; boundary="===============0139269639533794517=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 14:16:03 -0700
Message-ID: <87ziojxazw.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160811200018.GA28271@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0139269639533794517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Christoph Hellwig <hch@lst.de> writes:

> On Thu, Aug 11, 2016 at 12:51:31PM -0700, Linus Torvalds wrote:
>> Ok. It does seem to also reset the active file page counts back, so
>> that part did seem to be related, but yeah, from a performance
>> standpoint that was clearly not a major issue.
>> =

>> Let's hope Dave can figure out something based on his numbers, because
>> I'm out of ideas. Or maybe it's the pagefault-atomic thing that
>> Christoph was looking at.
>
> I can't really think of any reason why the pagefaul_disable() would
> s=D1=96gnificantly change performance.  Anyway, the patch for the is below
> (on top of the previous mark_page_accessed() one), so feel free to
> re-run the test with it.  It would also be nice to see the profiles
> with the two patches applied.
>
> commit 43106eea246074acc4bb7d12fdb91f58002f52ed
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu Aug 11 10:41:40 2016 -0700
>
>     fs: remove superflous pagefault_disable from iomap_write_actor
>     =

>     No idea where this really came from, generic_perform_write only brief=
ly
>     did a pagefaul_disable when trying a different prefault scheme.
>     =

>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> diff --git a/fs/iomap.c b/fs/iomap.c
> index f39c318..74712e2 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -194,9 +194,7 @@ again:
>  		if (mapping_writably_mapped(inode->i_mapping))
>  			flush_dcache_page(page);
>  =

> -		pagefault_disable();
>  		copied =3D iov_iter_copy_from_user_atomic(page, i, offset, bytes);
> -		pagefault_enable();
>  =

>  		flush_dcache_page(page);
>  =


Test result is as follow,

commit e129b86bfacc8bb517b843fca41d0d179de7a4ca
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Aug 11 10:41:40 2016 -0700

    fs: remove superflous pagefault_disable from iomap_write_actor
    =

    No idea where this really came from, generic_perform_write only briefly
    did a pagefaul_disable when trying a different prefault scheme.
    =

    Signed-off-by: Christoph Hellwig <hch@lst.de>

diff --git a/fs/iomap.c b/fs/iomap.c
index f39c318..74712e2 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -194,9 +194,7 @@ again:
 		if (mapping_writably_mapped(inode->i_mapping))
 			flush_dcache_page(page);
 =

-		pagefault_disable();
 		copied =3D iov_iter_copy_from_user_atomic(page, i, offset, bytes);
-		pagefault_enable();
 =

 		flush_dcache_page(page);
 =


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/debug-setup/disk/fs/kconfig/load/rootfs/tbox_grou=
p/test/testcase:
  gcc-6/performance/profile/1BRD_48G/xfs/x86_64-rhel/3000/debian-x86_64-201=
5-02-07.cgz/ivb44/disk_wrt/aim7

commit: =

  f0c6bcba74ac51cb77aadb33ad35cb2dc1ad1506
  68a9f5e7007c1afa2cf6830b690a90d0187c0684
  e129b86bfacc8bb517b843fca41d0d179de7a4ca

f0c6bcba74ac51cb 68a9f5e7007c1afa2cf6830b69 e129b86bfacc8bb517b843fca4 =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    484435 =C2=B1  0%     -13.3%     420004 =C2=B1  0%     -11.6%     42832=
3 =C2=B1  0%  aim7.jobs-per-min
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +13.0%      42.2=
4 =C2=B1  0%  aim7.time.elapsed_time
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +13.0%      42.2=
4 =C2=B1  0%  aim7.time.elapsed_time.max
      6491 =C2=B1  3%     +30.8%       8491 =C2=B1  0%     +19.9%       778=
1 =C2=B1  4%  aim7.time.involuntary_context_switches
      2378 =C2=B1  0%      +1.1%       2404 =C2=B1  0%      +9.2%       259=
8 =C2=B1  0%  aim7.time.maximum_resident_set_size
    376.89 =C2=B1  0%     +28.4%     484.11 =C2=B1  0%     +22.8%     462.9=
2 =C2=B1  0%  aim7.time.system_time
    430512 =C2=B1  0%     -20.1%     343838 =C2=B1  0%     -17.3%     35603=
2 =C2=B1  0%  aim7.time.voluntary_context_switches
     26816 =C2=B1  8%     +10.2%      29542 =C2=B1  1%     +13.5%      3042=
8 =C2=B1  0%  interrupts.CAL:Function_call_interrupts
      1016 =C2=B1  8%    +527.7%       6381 =C2=B1 59%    +483.5%       593=
2 =C2=B1 82%  latency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get=
_map.xfs_trans_get_buf_map.xfs_da_get_buf.xfs_dir3_data_init.xfs_dir2_sf_to=
_block.xfs_dir2_sf_addname.xfs_dir_createname.xfs_create.xfs_generic_create
    125122 =C2=B1 10%     -10.7%     111758 =C2=B1 12%      +8.2%     13544=
0 =C2=B1  3%  softirqs.SCHED
    410707 =C2=B1 12%      +5.2%     432155 =C2=B1 11%     +24.9%     51283=
8 =C2=B1  4%  softirqs.TIMER
     24772 =C2=B1  0%     -28.6%      17675 =C2=B1  0%     -24.1%      1881=
3 =C2=B1  1%  vmstat.system.cs
     53477 =C2=B1  2%      +5.6%      56453 =C2=B1  0%      +6.1%      5671=
6 =C2=B1  0%  vmstat.system.in
     43469 =C2=B1  0%      +5.3%      45792 =C2=B1  1%     +25.0%      5434=
3 =C2=B1 16%  proc-vmstat.nr_active_anon
      3906 =C2=B1  0%     +28.8%       5032 =C2=B1  2%     -48.8%       200=
0 =C2=B1 96%  proc-vmstat.nr_active_file
    919.33 =C2=B1  5%     +14.8%       1055 =C2=B1  8%     +17.8%       108=
3 =C2=B1 10%  proc-vmstat.nr_dirty
      2270 =C2=B1  0%      +9.6%       2488 =C2=B1  0%   +2255.3%      5348=
2 =C2=B1 95%  proc-vmstat.nr_inactive_anon
      3444 =C2=B1  5%     +41.8%       4884 =C2=B1  0%   +1809.2%      6575=
2 =C2=B1 92%  proc-vmstat.nr_shmem
      4092 =C2=B1 14%     +61.2%       6595 =C2=B1  1%     +64.7%       674=
1 =C2=B1  9%  proc-vmstat.pgactivate
      1975 =C2=B1 15%     +63.2%       3224 =C2=B1 17%     +39.3%       275=
2 =C2=B1 15%  slabinfo.scsi_data_buffer.active_objs
      1975 =C2=B1 15%     +63.2%       3224 =C2=B1 17%     +39.3%       275=
2 =C2=B1 15%  slabinfo.scsi_data_buffer.num_objs
    464.33 =C2=B1 15%     +63.3%     758.33 =C2=B1 17%     +39.3%     647.0=
0 =C2=B1 15%  slabinfo.xfs_efd_item.active_objs
    464.33 =C2=B1 15%     +63.3%     758.33 =C2=B1 17%     +39.3%     647.0=
0 =C2=B1 15%  slabinfo.xfs_efd_item.num_objs
      1859 =C2=B1  0%      +9.3%       2032 =C2=B1  6%     +12.4%       208=
9 =C2=B1  7%  slabinfo.xfs_ili.active_objs
      1859 =C2=B1  0%      +9.3%       2032 =C2=B1  6%     +12.4%       208=
9 =C2=B1  7%  slabinfo.xfs_ili.num_objs
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +13.0%      42.2=
4 =C2=B1  0%  time.elapsed_time
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +13.0%      42.2=
4 =C2=B1  0%  time.elapsed_time.max
      6491 =C2=B1  3%     +30.8%       8491 =C2=B1  0%     +19.9%       778=
1 =C2=B1  4%  time.involuntary_context_switches
      1037 =C2=B1  0%     +10.8%       1148 =C2=B1  0%      +8.2%       112=
2 =C2=B1  0%  time.percent_of_cpu_this_job_got
    376.89 =C2=B1  0%     +28.4%     484.11 =C2=B1  0%     +22.8%     462.9=
2 =C2=B1  0%  time.system_time
    430512 =C2=B1  0%     -20.1%     343838 =C2=B1  0%     -17.3%     35603=
2 =C2=B1  0%  time.voluntary_context_switches
  52991525 =C2=B1  1%     -19.4%   42687208 =C2=B1  0%     -15.8%   4461088=
4 =C2=B1  0%  cpuidle.C1-IVT.time
    319584 =C2=B1  1%     -26.5%     234868 =C2=B1  1%     -20.1%     25545=
5 =C2=B1  1%  cpuidle.C1-IVT.usage
   3468808 =C2=B1  2%     -19.8%    2783341 =C2=B1  3%     -17.8%    285156=
0 =C2=B1  1%  cpuidle.C1E-IVT.time
     46760 =C2=B1  0%     -22.4%      36298 =C2=B1  0%     -19.3%      3773=
8 =C2=B1  0%  cpuidle.C1E-IVT.usage
  12590471 =C2=B1  0%     -22.3%    9788585 =C2=B1  1%     -19.2%   1016948=
6 =C2=B1  0%  cpuidle.C3-IVT.time
     79965 =C2=B1  0%     -19.0%      64749 =C2=B1  0%     -17.0%      6633=
7 =C2=B1  0%  cpuidle.C3-IVT.usage
   1.3e+09 =C2=B1  0%     +13.3%  1.473e+09 =C2=B1  0%     +11.5%  1.449e+0=
9 =C2=B1  0%  cpuidle.C6-IVT.time
   1645891 =C2=B1  1%      +6.2%    1747525 =C2=B1  0%     +10.3%    181469=
9 =C2=B1  1%  cpuidle.C6-IVT.usage
    352.33 =C2=B1  8%     -24.7%     265.33 =C2=B1  1%     -11.3%     312.5=
0 =C2=B1  4%  cpuidle.POLL.usage
    189508 =C2=B1  0%      +6.3%     201410 =C2=B1  0%     +19.0%     22550=
5 =C2=B1 12%  meminfo.Active
    173880 =C2=B1  0%      +4.4%     181454 =C2=B1  1%     +25.1%     21750=
3 =C2=B1 16%  meminfo.Active(anon)
     15627 =C2=B1  0%     +27.7%      19956 =C2=B1  1%     -48.8%       800=
1 =C2=B1 96%  meminfo.Active(file)
     16103 =C2=B1  3%     +14.3%      18405 =C2=B1  8%     +15.3%      1857=
5 =C2=B1  1%  meminfo.AnonHugePages
   2260771 =C2=B1  0%      -0.7%    2244069 =C2=B1  1%     +10.6%    250105=
0 =C2=B1  9%  meminfo.Committed_AS
   4330854 =C2=B1 11%      -8.5%    3960847 =C2=B1  0%     +16.2%    503403=
0 =C2=B1  0%  meminfo.DirectMap2M
    132898 =C2=B1  9%     +15.4%     153380 =C2=B1  1%      -3.1%     12877=
3 =C2=B1  4%  meminfo.DirectMap4k
      9085 =C2=B1  0%      +9.4%       9940 =C2=B1  0%   +2254.7%     21393=
0 =C2=B1 95%  meminfo.Inactive(anon)
     13777 =C2=B1  5%     +43.1%      19709 =C2=B1  0%   +1809.0%     26300=
6 =C2=B1 92%  meminfo.Shmem
     24.18 =C2=B1  0%      +9.0%      26.35 =C2=B1  0%      +7.1%      25.9=
1 =C2=B1  0%  turbostat.%Busy
    686.00 =C2=B1  0%      +9.5%     751.00 =C2=B1  0%      +7.5%     737.5=
0 =C2=B1  0%  turbostat.Avg_MHz
      0.28 =C2=B1  0%     -25.0%       0.21 =C2=B1  0%     -17.9%       0.2=
3 =C2=B1  0%  turbostat.CPU%c3
     93.33 =C2=B1  1%      +3.0%      96.15 =C2=B1  0%      +0.1%      93.4=
4 =C2=B1  0%  turbostat.CorWatt
     79.00 =C2=B1  1%      -0.4%      78.67 =C2=B1  3%     -25.9%      58.5=
0 =C2=B1  2%  turbostat.CoreTmp
      3.05 =C2=B1 25%     +24.9%       3.81 =C2=B1 44%     -54.3%       1.4=
0 =C2=B1  3%  turbostat.Pkg%pc6
     78.67 =C2=B1  0%      +0.4%      79.00 =C2=B1  3%     -25.6%      58.5=
0 =C2=B1  2%  turbostat.PkgTmp
    124.61 =C2=B1  0%      +2.1%     127.17 =C2=B1  0%      -1.0%     123.3=
3 =C2=B1  0%  turbostat.PkgWatt
      4.74 =C2=B1  0%      -2.7%       4.61 =C2=B1  1%     -11.1%       4.2=
1 =C2=B1  0%  turbostat.RAMWatt
   1724300 =C2=B1 27%     -40.5%    1025538 =C2=B1  1%     -39.2%    104855=
2 =C2=B1  0%  sched_debug.cfs_rq:/.load.max
    618.30 =C2=B1  4%      +0.2%     619.34 =C2=B1  2%     +12.0%     692.2=
1 =C2=B1  3%  sched_debug.cfs_rq:/.min_vruntime.avg
     96.36 =C2=B1  3%     +18.6%     114.32 =C2=B1 15%     +19.1%     114.7=
5 =C2=B1 17%  sched_debug.cfs_rq:/.util_avg.stddev
     15.54 =C2=B1  3%      +1.4%      15.76 =C2=B1 22%     -14.1%      13.3=
5 =C2=B1  1%  sched_debug.cpu.cpu_load[4].avg
   1724300 =C2=B1 27%     -40.5%    1025538 =C2=B1  1%     -39.2%    104855=
2 =C2=B1  0%  sched_debug.cpu.load.max
      4751 =C2=B1 21%     -14.6%       4056 =C2=B1 25%     +25.1%       594=
4 =C2=B1  7%  sched_debug.cpu.nr_load_updates.avg
      7914 =C2=B1  1%     -14.1%       6797 =C2=B1 15%     +29.9%      1028=
0 =C2=B1 18%  sched_debug.cpu.nr_load_updates.max
      2887 =C2=B1 30%     -28.2%       2073 =C2=B1 48%     +37.8%       397=
7 =C2=B1  9%  sched_debug.cpu.nr_load_updates.min
      1182 =C2=B1  2%      +5.2%       1244 =C2=B1  2%     +13.0%       133=
6 =C2=B1 11%  sched_debug.cpu.nr_load_updates.stddev
      1006 =C2=B1  3%      +3.7%       1044 =C2=B1  3%      +7.5%       108=
2 =C2=B1  5%  sched_debug.cpu.nr_switches.avg
      7.66 =C2=B1 20%     -24.9%       5.75 =C2=B1 15%     -20.7%       6.0=
7 =C2=B1  4%  sched_debug.cpu.nr_uninterruptible.stddev
      7723 =C2=B1  0%     +32.6%      10238 =C2=B1  5%     -48.6%       396=
8 =C2=B1 92%  numa-meminfo.node0.Active(file)
      1589 =C2=B1 17%     +45.5%       2313 =C2=B1 24%     +17.4%       186=
6 =C2=B1  2%  numa-meminfo.node0.Dirty
     56052 =C2=B1  3%     +58.2%      88666 =C2=B1 17%     +99.1%     11157=
2 =C2=B1 36%  numa-meminfo.node1.Active
     48142 =C2=B1  4%     +64.0%      78943 =C2=B1 19%    +123.4%     10753=
6 =C2=B1 41%  numa-meminfo.node1.Active(anon)
      7908 =C2=B1  1%     +22.9%       9722 =C2=B1  3%     -49.0%       403=
5 =C2=B1 99%  numa-meminfo.node1.Active(file)
     46721 =C2=B1  3%     +55.9%      72837 =C2=B1 24%     +76.9%      8265=
2 =C2=B1 34%  numa-meminfo.node1.AnonPages
      3283 =C2=B1122%      +4.7%       3436 =C2=B1 99%   +3034.3%     10292=
0 =C2=B1 98%  numa-meminfo.node1.Inactive(anon)
      6005 =C2=B1  4%      -0.5%       5974 =C2=B1  1%    +340.4%      2644=
4 =C2=B1 77%  numa-meminfo.node1.KernelStack
    545018 =C2=B1  2%      +9.2%     594908 =C2=B1  4%     +33.1%     72528=
0 =C2=B1 19%  numa-meminfo.node1.MemUsed
     10518 =C2=B1 11%     +72.6%      18157 =C2=B1 33%    +330.3%      4525=
6 =C2=B1 74%  numa-meminfo.node1.PageTables
     51114 =C2=B1  1%      +2.8%      52548 =C2=B1  8%     +78.0%      9099=
6 =C2=B1 39%  numa-meminfo.node1.SUnreclaim
      4789 =C2=B1 69%    +102.3%       9687 =C2=B1  9%   +2571.5%     12793=
6 =C2=B1 91%  numa-meminfo.node1.Shmem
     83631 =C2=B1  2%      -1.7%      82192 =C2=B1  9%     +47.0%     12294=
9 =C2=B1 22%  numa-meminfo.node1.Slab
      1930 =C2=B1  0%     +33.9%       2585 =C2=B1  3%     -48.6%     992.0=
0 =C2=B1 92%  numa-vmstat.node0.nr_active_file
      4468 =C2=B1  7%      -8.5%       4089 =C2=B1  5%      +9.7%       490=
2 =C2=B1  5%  numa-vmstat.node0.nr_alloc_batch
    466.67 =C2=B1  4%     +29.3%     603.33 =C2=B1 14%      +4.0%     485.5=
0 =C2=B1 22%  numa-vmstat.node0.nr_dirty
     12026 =C2=B1  4%     +64.1%      19734 =C2=B1 20%    +123.3%      2685=
2 =C2=B1 41%  numa-vmstat.node1.nr_active_anon
      1977 =C2=B1  1%     +23.6%       2444 =C2=B1  1%     -49.0%       100=
8 =C2=B1 99%  numa-vmstat.node1.nr_active_file
      3809 =C2=B1  6%     +16.1%       4422 =C2=B1  4%     +17.1%       445=
9 =C2=B1 17%  numa-vmstat.node1.nr_alloc_batch
     11671 =C2=B1  3%     +55.9%      18197 =C2=B1 24%     +76.8%      2063=
3 =C2=B1 34%  numa-vmstat.node1.nr_anon_pages
  13239858 =C2=B1  0%      +2.7%   13602721 =C2=B1  4%      +9.4%   1448999=
9 =C2=B1  2%  numa-vmstat.node1.nr_dirtied
    480.67 =C2=B1  4%      -5.2%     455.67 =C2=B1 24%      +7.8%     518.0=
0 =C2=B1  6%  numa-vmstat.node1.nr_dirty
    820.33 =C2=B1122%      +4.7%     858.67 =C2=B1 99%   +3036.2%      2572=
7 =C2=B1 98%  numa-vmstat.node1.nr_inactive_anon
    373.67 =C2=B1  4%      -0.5%     371.67 =C2=B1  1%    +340.5%       164=
6 =C2=B1 76%  numa-vmstat.node1.nr_kernel_stack
      2626 =C2=B1 11%     +72.6%       4533 =C2=B1 33%    +329.6%      1128=
3 =C2=B1 74%  numa-vmstat.node1.nr_page_table_pages
      1197 =C2=B1 69%    +102.3%       2422 =C2=B1  9%   +2572.1%      3198=
4 =C2=B1 91%  numa-vmstat.node1.nr_shmem
     12777 =C2=B1  1%      +2.8%      13134 =C2=B1  8%     +77.9%      2273=
1 =C2=B1 39%  numa-vmstat.node1.nr_slab_unreclaimable
    456.33 =C2=B1 57%     -75.6%     111.33 =C2=B1 86%     -71.2%     131.5=
0 =C2=B1 96%  numa-vmstat.node1.nr_written
  13421081 =C2=B1  0%      +2.9%   13803847 =C2=B1  4%      +9.8%   1473537=
1 =C2=B1  2%  numa-vmstat.node1.numa_hit
  13421080 =C2=B1  0%      +2.9%   13803845 =C2=B1  4%      +9.8%   1473536=
9 =C2=B1  2%  numa-vmstat.node1.numa_local
 2.658e+11 =C2=B1  4%     +24.7%  3.316e+11 =C2=B1  2%     +20.5%  3.204e+1=
1 =C2=B1  0%  perf-stat.branch-instructions
      0.41 =C2=B1  1%      -9.1%       0.37 =C2=B1  1%     -22.9%       0.3=
2 =C2=B1  0%  perf-stat.branch-miss-rate
  1.09e+09 =C2=B1  3%     +13.4%  1.237e+09 =C2=B1  1%      -7.0%  1.014e+0=
9 =C2=B1  0%  perf-stat.branch-misses
    981138 =C2=B1  0%     -18.1%     803696 =C2=B1  0%     -14.7%     83710=
7 =C2=B1  0%  perf-stat.context-switches
 1.511e+12 =C2=B1  5%     +23.4%  1.864e+12 =C2=B1  3%     +16.1%  1.754e+1=
2 =C2=B1  0%  perf-stat.cpu-cycles
    102600 =C2=B1  1%      -7.3%      95075 =C2=B1  1%      -4.7%      9780=
3 =C2=B1  0%  perf-stat.cpu-migrations
      0.26 =C2=B1 12%     -30.8%       0.18 =C2=B1 10%     +48.9%       0.3=
9 =C2=B1 36%  perf-stat.dTLB-load-miss-rate
 8.332e+08 =C2=B1 13%      -3.8%  8.015e+08 =C2=B1  6%    +105.9%  1.716e+0=
9 =C2=B1 34%  perf-stat.dTLB-load-misses
 3.164e+11 =C2=B1  1%     +39.9%  4.426e+11 =C2=B1  4%     +39.6%  4.417e+1=
1 =C2=B1  2%  perf-stat.dTLB-loads
      0.03 =C2=B1 26%     -41.3%       0.02 =C2=B1 13%     +35.0%       0.0=
4 =C2=B1 15%  perf-stat.dTLB-store-miss-rate
  60071678 =C2=B1 27%     -25.6%   44690199 =C2=B1 15%     +69.8%   1.02e+0=
8 =C2=B1 17%  perf-stat.dTLB-store-misses
 2.247e+11 =C2=B1  6%     +26.4%  2.839e+11 =C2=B1  2%     +25.1%  2.812e+1=
1 =C2=B1  2%  perf-stat.dTLB-stores
  1.49e+12 =C2=B1  4%     +30.1%  1.939e+12 =C2=B1  2%     +25.5%   1.87e+1=
2 =C2=B1  0%  perf-stat.instructions
     43348 =C2=B1  2%     +34.2%      58161 =C2=B1 12%     +33.0%      5766=
6 =C2=B1  8%  perf-stat.instructions-per-iTLB-miss
      0.99 =C2=B1  0%      +5.5%       1.04 =C2=B1  0%      +8.1%       1.0=
7 =C2=B1  0%  perf-stat.ipc
    262799 =C2=B1  0%      +4.4%     274251 =C2=B1  1%      +4.6%     27499=
3 =C2=B1  0%  perf-stat.minor-faults
     34.12 =C2=B1  1%      +2.1%      34.83 =C2=B1  0%      +5.5%      35.9=
9 =C2=B1  0%  perf-stat.node-load-miss-rate
  46476754 =C2=B1  2%      +4.6%   48601269 =C2=B1  1%      +5.5%   4903864=
8 =C2=B1  0%  perf-stat.node-load-misses
  89728871 =C2=B1  1%      +1.3%   90913257 =C2=B1  1%      -2.8%   8723340=
1 =C2=B1  0%  perf-stat.node-loads
      9.96 =C2=B1  0%     +13.4%      11.30 =C2=B1  0%     +18.3%      11.7=
9 =C2=B1  3%  perf-stat.node-store-miss-rate
  24460859 =C2=B1  1%     +14.4%   27971097 =C2=B1  1%      +5.3%   2574754=
6 =C2=B1  3%  perf-stat.node-store-misses
 2.211e+08 =C2=B1  1%      -0.6%  2.197e+08 =C2=B1  1%     -12.6%  1.931e+0=
8 =C2=B1  6%  perf-stat.node-stores
    262780 =C2=B1  0%      +4.4%     274227 =C2=B1  1%      +4.6%     27495=
3 =C2=B1  0%  perf-stat.page-faults
     11.31 =C2=B1  1%     -18.1%       9.27 =C2=B1  0%     -17.3%       9.3=
6 =C2=B1  0%  perf-profile.cycles-pp.____fput.task_work_run.exit_to_usermod=
e_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.68 =C2=B1  1%      +Inf%       1.7=
4 =C2=B1  1%  perf-profile.cycles-pp.__add_to_page_cache_locked.add_to_page=
_cache_lru.pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin
      1.80 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.__add_to_page_cache_locked.add_to_page=
_cache_lru.pagecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      2.55 =C2=B1  3%     -14.2%       2.19 =C2=B1  2%     -15.3%       2.1=
6 =C2=B1  0%  perf-profile.cycles-pp.__alloc_pages_nodemask.alloc_pages_cur=
rent.__page_cache_alloc.pagecache_get_page.grab_cache_page_write_begin
      0.00 =C2=B1 -1%      +Inf%       4.45 =C2=B1  1%      +Inf%       4.9=
6 =C2=B1  1%  perf-profile.cycles-pp.__block_commit_write.isra.24.block_wri=
te_end.generic_write_end.iomap_write_actor.iomap_apply
      5.93 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.__block_commit_write.isra.24.block_wri=
te_end.generic_write_end.xfs_vm_write_end.generic_perform_write
     13.71 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.__block_write_begin.xfs_vm_write_begin=
.generic_perform_write.xfs_file_buffered_aio_write.xfs_file_write_iter
     10.36 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.__block_write_begin_int.__block_write_=
begin.xfs_vm_write_begin.generic_perform_write.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       3.64 =C2=B1  0%      +Inf%       3.7=
9 =C2=B1  2%  perf-profile.cycles-pp.__block_write_begin_int.iomap_write_be=
gin.iomap_write_actor.iomap_apply.iomap_file_buffered_write
      1.04 =C2=B1  2%     -18.9%       0.84 =C2=B1  1%     -15.4%       0.8=
8 =C2=B1  0%  perf-profile.cycles-pp.__delete_from_page_cache.delete_from_p=
age_cache.truncate_inode_page.truncate_inode_pages_range.truncate_inode_pag=
es_final
     11.24 =C2=B1  2%     -18.1%       9.21 =C2=B1  0%     -17.3%       9.3=
0 =C2=B1  0%  perf-profile.cycles-pp.__dentry_kill.dput.__fput.____fput.tas=
k_work_run
     11.31 =C2=B1  2%     -18.1%       9.26 =C2=B1  0%     -17.3%       9.3=
6 =C2=B1  0%  perf-profile.cycles-pp.__fput.____fput.task_work_run.exit_to_=
usermode_loop.syscall_return_slowpath
      1.72 =C2=B1  2%     -10.1%       1.54 =C2=B1  1%     -17.6%       1.4=
2 =C2=B1  0%  perf-profile.cycles-pp.__lru_cache_add.lru_cache_add.add_to_p=
age_cache_lru.pagecache_get_page.grab_cache_page_write_begin
      0.00 =C2=B1 -1%      +Inf%       1.09 =C2=B1  2%      +Inf%       1.1=
2 =C2=B1  1%  perf-profile.cycles-pp.__mark_inode_dirty.generic_write_end.i=
omap_write_actor.iomap_apply.iomap_file_buffered_write
      1.32 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.__mark_inode_dirty.generic_write_end.x=
fs_vm_write_end.generic_perform_write.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       2.68 =C2=B1  2%      +Inf%       2.6=
5 =C2=B1  0%  perf-profile.cycles-pp.__page_cache_alloc.pagecache_get_page.=
grab_cache_page_write_begin.iomap_write_begin.iomap_write_actor
      3.04 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.__page_cache_alloc.pagecache_get_page.=
grab_cache_page_write_begin.xfs_vm_write_begin.generic_perform_write
      2.50 =C2=B1  3%     -11.5%       2.21 =C2=B1  0%     -18.8%       2.0=
3 =C2=B1  0%  perf-profile.cycles-pp.__pagevec_release.truncate_inode_pages=
_range.truncate_inode_pages_final.evict.iput
      1.00 =C2=B1  1%     -18.0%       0.82 =C2=B1  1%     -10.0%       0.9=
0 =C2=B1  0%  perf-profile.cycles-pp.__radix_tree_lookup.radix_tree_lookup_=
slot.find_get_entry.pagecache_get_page.grab_cache_page_write_begin
      1.12 =C2=B1  2%     -17.6%       0.92 =C2=B1  4%     -13.8%       0.9=
6 =C2=B1  0%  perf-profile.cycles-pp.__sb_start_write.vfs_write.sys_write.e=
ntry_SYSCALL_64_fastpath
      1.38 =C2=B1  2%     -13.3%       1.19 =C2=B1  1%     -12.5%       1.2=
1 =C2=B1  0%  perf-profile.cycles-pp.__set_page_dirty.mark_buffer_dirty.__b=
lock_commit_write.isra.24.block_write_end.generic_write_end
     54.10 =C2=B1  1%     +13.1%      61.20 =C2=B1  0%     +10.6%      59.8=
6 =C2=B1  0%  perf-profile.cycles-pp.__vfs_write.vfs_write.sys_write.entry_=
SYSCALL_64_fastpath
      6.34 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.__xfs_get_blocks.xfs_get_blocks.__bloc=
k_write_begin_int.__block_write_begin.xfs_vm_write_begin
      0.00 =C2=B1 -1%      +Inf%       3.69 =C2=B1  1%      +Inf%       3.6=
2 =C2=B1  0%  perf-profile.cycles-pp.add_to_page_cache_lru.pagecache_get_pa=
ge.grab_cache_page_write_begin.iomap_write_begin.iomap_write_actor
      4.02 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.add_to_page_cache_lru.pagecache_get_pa=
ge.grab_cache_page_write_begin.xfs_vm_write_begin.generic_perform_write
      0.98 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.alloc_page_buffers.create_empty_buffer=
s.create_page_buffers.__block_write_begin_int.__block_write_begin
      0.00 =C2=B1 -1%      +Inf%       2.56 =C2=B1  2%      +Inf%       2.5=
0 =C2=B1  0%  perf-profile.cycles-pp.alloc_pages_current.__page_cache_alloc=
.pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin
      2.91 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.alloc_pages_current.__page_cache_alloc=
.pagecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      3.42 =C2=B1  0%     -20.9%       2.71 =C2=B1  2%     -15.7%       2.8=
8 =C2=B1  0%  perf-profile.cycles-pp.block_invalidatepage.xfs_vm_invalidate=
page.truncate_inode_page.truncate_inode_pages_range.truncate_inode_pages_fi=
nal
      0.00 =C2=B1 -1%      +Inf%       4.69 =C2=B1  0%      +Inf%       5.5=
4 =C2=B1  1%  perf-profile.cycles-pp.block_write_end.generic_write_end.ioma=
p_write_actor.iomap_apply.iomap_file_buffered_write
      6.24 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.block_write_end.generic_write_end.xfs_=
vm_write_end.generic_perform_write.xfs_file_buffered_aio_write
     19.18 =C2=B1  5%      -9.3%      17.40 =C2=B1  0%      -5.8%      18.0=
6 =C2=B1  1%  perf-profile.cycles-pp.call_cpuidle.cpu_startup_entry.start_s=
econdary
      0.94 =C2=B1  4%     -19.8%       0.76 =C2=B1  0%     -15.2%       0.8=
0 =C2=B1  1%  perf-profile.cycles-pp.cancel_dirty_page.try_to_free_buffers.=
xfs_vm_releasepage.try_to_release_page.block_invalidatepage
      3.95 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.copy_user_enhanced_fast_string.generic=
_perform_write.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
      0.00 =C2=B1 -1%      +Inf%       3.22 =C2=B1  0%      +Inf%       3.2=
9 =C2=B1  1%  perf-profile.cycles-pp.copy_user_enhanced_fast_string.iomap_w=
rite_actor.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
     19.75 =C2=B1  5%      -9.8%      17.81 =C2=B1  0%      -6.3%      18.5=
0 =C2=B1  1%  perf-profile.cycles-pp.cpu_startup_entry.start_secondary
     19.18 =C2=B1  5%      -9.3%      17.40 =C2=B1  0%      -5.8%      18.0=
5 =C2=B1  1%  perf-profile.cycles-pp.cpuidle_enter.call_cpuidle.cpu_startup=
_entry.start_secondary
     18.45 =C2=B1  5%      -9.2%      16.75 =C2=B1  0%      -5.6%      17.4=
2 =C2=B1  1%  perf-profile.cycles-pp.cpuidle_enter_state.cpuidle_enter.call=
_cpuidle.cpu_startup_entry.start_secondary
      1.44 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.create_empty_buffers.create_page_buffe=
rs.__block_write_begin_int.__block_write_begin.xfs_vm_write_begin
      0.00 =C2=B1 -1%      +Inf%       1.18 =C2=B1  1%      +Inf%       1.2=
5 =C2=B1  2%  perf-profile.cycles-pp.create_empty_buffers.create_page_buffe=
rs.__block_write_begin_int.iomap_write_begin.iomap_write_actor
      1.86 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.create_page_buffers.__block_write_begi=
n_int.__block_write_begin.xfs_vm_write_begin.generic_perform_write
      0.00 =C2=B1 -1%      +Inf%       1.53 =C2=B1  1%      +Inf%       1.6=
1 =C2=B1  3%  perf-profile.cycles-pp.create_page_buffers.__block_write_begi=
n_int.iomap_write_begin.iomap_write_actor.iomap_apply
      1.74 =C2=B1  2%     -19.9%       1.40 =C2=B1  3%     -16.8%       1.4=
5 =C2=B1  0%  perf-profile.cycles-pp.delete_from_page_cache.truncate_inode_=
page.truncate_inode_pages_range.truncate_inode_pages_final.evict
      1.27 =C2=B1  0%     -22.5%       0.99 =C2=B1  4%     -22.3%       0.9=
9 =C2=B1  0%  perf-profile.cycles-pp.destroy_inode.evict.iput.__dentry_kill=
.dput
      2.61 =C2=B1  1%     -24.3%       1.98 =C2=B1  1%     -20.7%       2.0=
7 =C2=B1  0%  perf-profile.cycles-pp.do_filp_open.do_sys_open.sys_creat.ent=
ry_SYSCALL_64_fastpath
      2.66 =C2=B1  1%     -24.3%       2.01 =C2=B1  1%     -20.5%       2.1=
2 =C2=B1  0%  perf-profile.cycles-pp.do_sys_open.sys_creat.entry_SYSCALL_64=
_fastpath
      1.79 =C2=B1  2%     -28.2%       1.28 =C2=B1  3%     -23.3%       1.3=
7 =C2=B1  2%  perf-profile.cycles-pp.do_unlinkat.sys_unlink.entry_SYSCALL_6=
4_fastpath
      1.07 =C2=B1  3%     -23.3%       0.82 =C2=B1  3%     -19.4%       0.8=
6 =C2=B1  0%  perf-profile.cycles-pp.down_write.xfs_file_buffered_aio_write=
.xfs_file_write_iter.__vfs_write.vfs_write
      1.01 =C2=B1  3%     -17.9%       0.83 =C2=B1  2%     -13.6%       0.8=
7 =C2=B1  1%  perf-profile.cycles-pp.down_write.xfs_ilock.xfs_file_buffered=
_aio_write.xfs_file_write_iter.__vfs_write
     11.26 =C2=B1  2%     -18.1%       9.23 =C2=B1  0%     -17.2%       9.3=
2 =C2=B1  0%  perf-profile.cycles-pp.dput.__fput.____fput.task_work_run.exi=
t_to_usermode_loop
     11.21 =C2=B1  2%     -18.1%       9.18 =C2=B1  0%     -17.4%       9.2=
6 =C2=B1  0%  perf-profile.cycles-pp.evict.iput.__dentry_kill.dput.__fput
     11.34 =C2=B1  2%     -18.1%       9.29 =C2=B1  0%     -17.3%       9.3=
8 =C2=B1  0%  perf-profile.cycles-pp.exit_to_usermode_loop.syscall_return_s=
lowpath.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.55 =C2=B1  3%      +Inf%       1.6=
5 =C2=B1  0%  perf-profile.cycles-pp.find_get_entry.pagecache_get_page.grab=
_cache_page_write_begin.iomap_write_begin.iomap_write_actor
      1.83 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.find_get_entry.pagecache_get_page.grab=
_cache_page_write_begin.xfs_vm_write_begin.generic_perform_write
     43.95 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.generic_perform_write.xfs_file_buffere=
d_aio_write.xfs_file_write_iter.__vfs_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%       7.91 =C2=B1  1%      +Inf%       9.0=
4 =C2=B1  0%  perf-profile.cycles-pp.generic_write_end.iomap_write_actor.io=
map_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
     10.68 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.generic_write_end.xfs_vm_write_end.gen=
eric_perform_write.xfs_file_buffered_aio_write.xfs_file_write_iter
      1.91 =C2=B1  3%     -16.4%       1.59 =C2=B1  1%     -17.7%       1.5=
7 =C2=B1  0%  perf-profile.cycles-pp.get_page_from_freelist.__alloc_pages_n=
odemask.alloc_pages_current.__page_cache_alloc.pagecache_get_page
      0.00 =C2=B1 -1%      +Inf%       9.85 =C2=B1  0%      +Inf%       9.9=
1 =C2=B1  0%  perf-profile.cycles-pp.grab_cache_page_write_begin.iomap_writ=
e_begin.iomap_write_actor.iomap_apply.iomap_file_buffered_write
     10.96 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.grab_cache_page_write_begin.xfs_vm_wri=
te_begin.generic_perform_write.xfs_file_buffered_aio_write.xfs_file_write_i=
ter
      0.00 =C2=B1 -1%      +Inf%      52.29 =C2=B1  0%      +Inf%      50.8=
2 =C2=B1  0%  perf-profile.cycles-pp.iomap_apply.iomap_file_buffered_write.=
xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
      0.00 =C2=B1 -1%      +Inf%      52.94 =C2=B1  0%      +Inf%      51.4=
4 =C2=B1  0%  perf-profile.cycles-pp.iomap_file_buffered_write.xfs_file_buf=
fered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%      34.35 =C2=B1  0%      +Inf%      32.2=
7 =C2=B1  0%  perf-profile.cycles-pp.iomap_write_actor.iomap_apply.iomap_fi=
le_buffered_write.xfs_file_buffered_aio_write.xfs_file_write_iter
      0.00 =C2=B1 -1%      +Inf%      16.48 =C2=B1  0%      +Inf%      16.7=
5 =C2=B1  1%  perf-profile.cycles-pp.iomap_write_begin.iomap_write_actor.io=
map_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
     11.22 =C2=B1  2%     -18.1%       9.19 =C2=B1  0%     -17.3%       9.2=
7 =C2=B1  0%  perf-profile.cycles-pp.iput.__dentry_kill.dput.__fput.____fput
      0.00 =C2=B1 -1%      +Inf%       1.55 =C2=B1  1%      +Inf%       1.4=
2 =C2=B1  0%  perf-profile.cycles-pp.lru_cache_add.add_to_page_cache_lru.pa=
gecache_get_page.grab_cache_page_write_begin.iomap_write_begin
      1.72 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.lru_cache_add.add_to_page_cache_lru.pa=
gecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      0.00 =C2=B1 -1%      +Inf%       2.78 =C2=B1  0%      +Inf%       2.8=
8 =C2=B1  1%  perf-profile.cycles-pp.mark_buffer_dirty.__block_commit_write=
.isra.24.block_write_end.generic_write_end.iomap_write_actor
      3.39 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.mark_buffer_dirty.__block_commit_write=
.isra.24.block_write_end.generic_write_end.xfs_vm_write_end
      0.00 =C2=B1 -1%      +Inf%       3.44 =C2=B1  1%      +NaN%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.mark_page_accessed.iomap_write_actor.i=
omap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      3.03 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.memset_erms.__block_write_begin.xfs_vm=
_write_begin.generic_perform_write.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       2.43 =C2=B1  0%      +Inf%       2.4=
8 =C2=B1  3%  perf-profile.cycles-pp.memset_erms.iomap_write_begin.iomap_wr=
ite_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1 -1%      +Inf%       9.25 =C2=B1  0%      +Inf%       9.2=
5 =C2=B1  0%  perf-profile.cycles-pp.pagecache_get_page.grab_cache_page_wri=
te_begin.iomap_write_begin.iomap_write_actor.iomap_apply
     10.37 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.pagecache_get_page.grab_cache_page_wri=
te_begin.xfs_vm_write_begin.generic_perform_write.xfs_file_buffered_aio_wri=
te
      1.52 =C2=B1  2%      -9.2%       1.38 =C2=B1  1%     -17.0%       1.2=
7 =C2=B1  0%  perf-profile.cycles-pp.pagevec_lru_move_fn.__lru_cache_add.lr=
u_cache_add.add_to_page_cache_lru.pagecache_get_page
      2.58 =C2=B1  1%     -24.1%       1.96 =C2=B1  0%     -20.6%       2.0=
5 =C2=B1  0%  perf-profile.cycles-pp.path_openat.do_filp_open.do_sys_open.s=
ys_creat.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.95 =C2=B1  0%      +Inf%       1.0=
4 =C2=B1  0%  perf-profile.cycles-pp.radix_tree_lookup_slot.find_get_entry.=
pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin
      1.17 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.radix_tree_lookup_slot.find_get_entry.=
pagecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      2.39 =C2=B1  3%     -11.2%       2.12 =C2=B1  0%     -18.3%       1.9=
5 =C2=B1  1%  perf-profile.cycles-pp.release_pages.__pagevec_release.trunca=
te_inode_pages_range.truncate_inode_pages_final.evict
      2.06 =C2=B1  3%     -22.5%       1.60 =C2=B1  2%     -10.9%       1.8=
3 =C2=B1  0%  perf-profile.cycles-pp.rw_verify_area.vfs_write.sys_write.ent=
ry_SYSCALL_64_fastpath
      1.79 =C2=B1  3%     -22.2%       1.39 =C2=B1  0%      -9.8%       1.6=
2 =C2=B1  0%  perf-profile.cycles-pp.security_file_permission.rw_verify_are=
a.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.32 =C2=B1  4%     -21.4%       1.04 =C2=B1  0%      -7.4%       1.2=
3 =C2=B1  1%  perf-profile.cycles-pp.selinux_file_permission.security_file_=
permission.rw_verify_area.vfs_write.sys_write
     19.79 =C2=B1  5%      -9.9%      17.84 =C2=B1  0%      -6.4%      18.5=
4 =C2=B1  1%  perf-profile.cycles-pp.start_secondary
      2.67 =C2=B1  1%     -24.2%       2.02 =C2=B1  1%     -20.4%       2.1=
2 =C2=B1  1%  perf-profile.cycles-pp.sys_creat.entry_SYSCALL_64_fastpath
      1.79 =C2=B1  3%     -27.9%       1.29 =C2=B1  3%     -23.0%       1.3=
8 =C2=B1  2%  perf-profile.cycles-pp.sys_unlink.entry_SYSCALL_64_fastpath
     60.98 =C2=B1  1%      +9.5%      66.76 =C2=B1  0%      +7.8%      65.7=
4 =C2=B1  0%  perf-profile.cycles-pp.sys_write.entry_SYSCALL_64_fastpath
     11.34 =C2=B1  1%     -18.1%       9.29 =C2=B1  0%     -17.2%       9.3=
9 =C2=B1  0%  perf-profile.cycles-pp.syscall_return_slowpath.entry_SYSCALL_=
64_fastpath
     11.32 =C2=B1  1%     -18.0%       9.28 =C2=B1  0%     -17.3%       9.3=
7 =C2=B1  0%  perf-profile.cycles-pp.task_work_run.exit_to_usermode_loop.sy=
scall_return_slowpath.entry_SYSCALL_64_fastpath
      5.96 =C2=B1  1%     -20.0%       4.77 =C2=B1  0%     -15.8%       5.0=
2 =C2=B1  0%  perf-profile.cycles-pp.truncate_inode_page.truncate_inode_pag=
es_range.truncate_inode_pages_final.evict.iput
      9.89 =C2=B1  2%     -17.4%       8.17 =C2=B1  0%     -16.7%       8.2=
5 =C2=B1  0%  perf-profile.cycles-pp.truncate_inode_pages_final.evict.iput.=
__dentry_kill.dput
      9.87 =C2=B1  2%     -17.5%       8.15 =C2=B1  0%     -16.8%       8.2=
1 =C2=B1  0%  perf-profile.cycles-pp.truncate_inode_pages_range.truncate_in=
ode_pages_final.evict.iput.__dentry_kill
      2.07 =C2=B1  1%     -20.4%       1.65 =C2=B1  2%     -14.9%       1.7=
7 =C2=B1  1%  perf-profile.cycles-pp.try_to_free_buffers.xfs_vm_releasepage=
.try_to_release_page.block_invalidatepage.xfs_vm_invalidatepage
      2.40 =C2=B1  1%     -21.0%       1.89 =C2=B1  2%     -15.3%       2.0=
3 =C2=B1  1%  perf-profile.cycles-pp.try_to_release_page.block_invalidatepa=
ge.xfs_vm_invalidatepage.truncate_inode_page.truncate_inode_pages_range
      0.00 =C2=B1 -1%      +Inf%       1.36 =C2=B1  1%      +Inf%       1.5=
6 =C2=B1  3%  perf-profile.cycles-pp.unlock_page.generic_write_end.iomap_wr=
ite_actor.iomap_apply.iomap_file_buffered_write
      1.72 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.unlock_page.generic_write_end.xfs_vm_w=
rite_end.generic_perform_write.xfs_file_buffered_aio_write
     59.63 =C2=B1  1%     +10.2%      65.72 =C2=B1  0%      +8.5%      64.6=
8 =C2=B1  0%  perf-profile.cycles-pp.vfs_write.sys_write.entry_SYSCALL_64_f=
astpath
      0.00 =C2=B1 -1%      +Inf%       1.52 =C2=B1  2%      +NaN%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.workingset_activation.mark_page_access=
ed.iomap_write_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1 -1%      +Inf%       1.73 =C2=B1  1%      +Inf%       1.7=
5 =C2=B1  2%  perf-profile.cycles-pp.xfs_bmap_search_extents.xfs_bmapi_dela=
y.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply
      0.00 =C2=B1 -1%      +Inf%       1.97 =C2=B1  2%      +Inf%       2.0=
4 =C2=B1  0%  perf-profile.cycles-pp.xfs_bmap_search_extents.xfs_bmapi_read=
.xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1 -1%      +Inf%       1.61 =C2=B1  2%      +Inf%       1.6=
5 =C2=B1  1%  perf-profile.cycles-pp.xfs_bmap_search_extents.xfs_bmapi_read=
.xfs_iomap_eof_want_preallocate.constprop.8.xfs_iomap_write_delay.xfs_file_=
iomap_begin
      0.00 =C2=B1 -1%      +Inf%       1.24 =C2=B1  2%      +Inf%       1.2=
1 =C2=B1  3%  perf-profile.cycles-pp.xfs_bmap_search_multi_extents.xfs_bmap=
_search_extents.xfs_bmapi_delay.xfs_iomap_write_delay.xfs_file_iomap_begin
      0.00 =C2=B1 -1%      +Inf%       1.46 =C2=B1  1%      +Inf%       1.4=
7 =C2=B1  1%  perf-profile.cycles-pp.xfs_bmap_search_multi_extents.xfs_bmap=
_search_extents.xfs_bmapi_read.xfs_file_iomap_begin.iomap_apply
      0.00 =C2=B1 -1%      +Inf%       1.21 =C2=B1  2%      +Inf%       1.2=
5 =C2=B1  0%  perf-profile.cycles-pp.xfs_bmap_search_multi_extents.xfs_bmap=
_search_extents.xfs_bmapi_read.xfs_iomap_eof_want_preallocate.constprop.8.x=
fs_iomap_write_delay
      1.25 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.xfs_bmapi_delay.xfs_iomap_write_delay.=
__xfs_get_blocks.xfs_get_blocks.__block_write_begin_int
      0.00 =C2=B1 -1%      +Inf%       3.06 =C2=B1  1%      +Inf%       3.0=
8 =C2=B1  1%  perf-profile.cycles-pp.xfs_bmapi_delay.xfs_iomap_write_delay.=
xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_write
      1.04 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.xfs_bmapi_read.__xfs_get_blocks.xfs_ge=
t_blocks.__block_write_begin_int.__block_write_begin
      0.00 =C2=B1 -1%      +Inf%       3.04 =C2=B1  1%      +Inf%       3.1=
6 =C2=B1  1%  perf-profile.cycles-pp.xfs_bmapi_read.xfs_file_iomap_begin.io=
map_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       3.05 =C2=B1  1%      +Inf%       3.0=
9 =C2=B1  1%  perf-profile.cycles-pp.xfs_bmapi_read.xfs_iomap_eof_want_prea=
llocate.constprop.8.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply
      1.32 =C2=B1  2%     -21.5%       1.04 =C2=B1  1%     -19.7%       1.0=
6 =C2=B1  0%  perf-profile.cycles-pp.xfs_create.xfs_generic_create.xfs_vn_m=
knod.xfs_vn_create.path_openat
     51.83 =C2=B1  1%     +14.3%      59.25 =C2=B1  0%     +11.8%      57.9=
5 =C2=B1  0%  perf-profile.cycles-pp.xfs_file_buffered_aio_write.xfs_file_w=
rite_iter.__vfs_write.vfs_write.sys_write
      0.00 =C2=B1 -1%      +Inf%      16.05 =C2=B1  0%      +Inf%      16.6=
8 =C2=B1  0%  perf-profile.cycles-pp.xfs_file_iomap_begin.iomap_apply.iomap=
_file_buffered_write.xfs_file_buffered_aio_write.xfs_file_write_iter
     53.16 =C2=B1  1%     +13.6%      60.40 =C2=B1  0%     +11.1%      59.0=
9 =C2=B1  0%  perf-profile.cycles-pp.xfs_file_write_iter.__vfs_write.vfs_wr=
ite.sys_write.entry_SYSCALL_64_fastpath
      1.24 =C2=B1  1%     -23.1%       0.95 =C2=B1  4%     -21.8%       0.9=
7 =C2=B1  0%  perf-profile.cycles-pp.xfs_fs_destroy_inode.destroy_inode.evi=
ct.iput.__dentry_kill
      1.42 =C2=B1  2%     -21.2%       1.12 =C2=B1  1%     -20.6%       1.1=
2 =C2=B1  0%  perf-profile.cycles-pp.xfs_generic_create.xfs_vn_mknod.xfs_vn=
_create.path_openat.do_filp_open
      6.46 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.xfs_get_blocks.__block_write_begin_int=
.__block_write_begin.xfs_vm_write_begin.generic_perform_write
      1.29 =C2=B1  3%     -18.9%       1.04 =C2=B1  1%     -14.1%       1.1=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_ilock.xfs_file_buffered_aio_write.=
xfs_file_write_iter.__vfs_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%       1.14 =C2=B1  3%      +Inf%       1.1=
7 =C2=B1  1%  perf-profile.cycles-pp.xfs_ilock.xfs_file_iomap_begin.iomap_a=
pply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      1.21 =C2=B1  1%     -23.4%       0.93 =C2=B1  4%     -22.5%       0.9=
4 =C2=B1  0%  perf-profile.cycles-pp.xfs_inactive.xfs_fs_destroy_inode.dest=
roy_inode.evict.iput
      1.23 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.xfs_iomap_eof_want_preallocate.constpr=
op.6.xfs_iomap_write_delay.__xfs_get_blocks.xfs_get_blocks.__block_write_be=
gin_int
      0.00 =C2=B1 -1%      +Inf%       4.14 =C2=B1  0%      +Inf%       4.1=
5 =C2=B1  1%  perf-profile.cycles-pp.xfs_iomap_eof_want_preallocate.constpr=
op.8.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply.iomap_file_buff=
ered_write
      3.28 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.xfs_iomap_write_delay.__xfs_get_blocks=
.xfs_get_blocks.__block_write_begin_int.__block_write_begin
      0.00 =C2=B1 -1%      +Inf%       9.08 =C2=B1  0%      +Inf%       9.1=
9 =C2=B1  1%  perf-profile.cycles-pp.xfs_iomap_write_delay.xfs_file_iomap_b=
egin.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      3.54 =C2=B1  0%     -20.8%       2.81 =C2=B1  1%     -15.6%       2.9=
9 =C2=B1  0%  perf-profile.cycles-pp.xfs_vm_invalidatepage.truncate_inode_p=
age.truncate_inode_pages_range.truncate_inode_pages_final.evict
      2.35 =C2=B1  1%     -21.0%       1.86 =C2=B1  1%     -15.1%       2.0=
0 =C2=B1  1%  perf-profile.cycles-pp.xfs_vm_releasepage.try_to_release_page=
.block_invalidatepage.xfs_vm_invalidatepage.truncate_inode_page
     25.10 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.xfs_vm_write_begin.generic_perform_wri=
te.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
     11.03 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.cycles-pp.xfs_vm_write_end.generic_perform_write=
.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
      1.42 =C2=B1  2%     -20.7%       1.13 =C2=B1  1%     -20.4%       1.1=
3 =C2=B1  0%  perf-profile.cycles-pp.xfs_vn_create.path_openat.do_filp_open=
.do_sys_open.sys_creat
      1.42 =C2=B1  2%     -20.5%       1.13 =C2=B1  1%     -20.2%       1.1=
3 =C2=B1  0%  perf-profile.cycles-pp.xfs_vn_mknod.xfs_vn_create.path_openat=
.do_filp_open.do_sys_open
      2.27 =C2=B1  1%     -10.6%       2.03 =C2=B1  0%      -6.7%       2.1=
2 =C2=B1  1%  perf-profile.func.cycles-pp.___might_sleep
      2.49 =C2=B1  0%     -34.5%       1.63 =C2=B1  1%     -16.7%       2.0=
8 =C2=B1  0%  perf-profile.func.cycles-pp.__block_commit_write.isra.24
      1.51 =C2=B1  2%     +15.4%       1.75 =C2=B1  1%     +18.0%       1.7=
9 =C2=B1  2%  perf-profile.func.cycles-pp.__block_write_begin_int
      1.79 =C2=B1  4%     -16.8%       1.49 =C2=B1  1%     -14.5%       1.5=
3 =C2=B1  0%  perf-profile.func.cycles-pp.__mark_inode_dirty
      1.32 =C2=B1  0%     -16.4%       1.10 =C2=B1  1%      -9.5%       1.1=
9 =C2=B1  0%  perf-profile.func.cycles-pp.__radix_tree_lookup
      1.08 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.func.cycles-pp.__xfs_get_blocks
      1.16 =C2=B1  0%     -18.1%       0.95 =C2=B1  1%     -15.8%       0.9=
8 =C2=B1  1%  perf-profile.func.cycles-pp._raw_spin_lock
      3.96 =C2=B1  2%     -18.4%       3.23 =C2=B1  0%     -16.9%       3.2=
9 =C2=B1  1%  perf-profile.func.cycles-pp.copy_user_enhanced_fast_string
      1.41 =C2=B1  3%     -20.6%       1.12 =C2=B1  3%     -21.1%       1.1=
1 =C2=B1  3%  perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath
      1.30 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%    -100.0%       0.0=
0 =C2=B1 -1%  perf-profile.func.cycles-pp.generic_perform_write
      1.31 =C2=B1  2%     -46.7%       0.70 =C2=B1  0%     -43.8%       0.7=
3 =C2=B1  0%  perf-profile.func.cycles-pp.generic_write_end
     18.43 =C2=B1  5%      -9.1%      16.76 =C2=B1  0%      -5.4%      17.4=
4 =C2=B1  1%  perf-profile.func.cycles-pp.intel_idle
      0.00 =C2=B1 -1%      +Inf%       1.12 =C2=B1  1%      +Inf%       0.9=
0 =C2=B1  0%  perf-profile.func.cycles-pp.iomap_write_actor
      1.50 =C2=B1  1%     -20.9%       1.19 =C2=B1  1%     -17.0%       1.2=
5 =C2=B1  2%  perf-profile.func.cycles-pp.mark_buffer_dirty
      0.00 =C2=B1 -1%      +Inf%       1.91 =C2=B1  1%      +NaN%       0.0=
0 =C2=B1 -1%  perf-profile.func.cycles-pp.mark_page_accessed
      3.24 =C2=B1  0%     -19.8%       2.60 =C2=B1  0%     -18.1%       2.6=
6 =C2=B1  3%  perf-profile.func.cycles-pp.memset_erms
      1.75 =C2=B1  2%     -18.9%       1.42 =C2=B1  1%      -7.3%       1.6=
2 =C2=B1  4%  perf-profile.func.cycles-pp.unlock_page
      1.56 =C2=B1  2%      +6.0%       1.65 =C2=B1  3%     +11.8%       1.7=
4 =C2=B1  1%  perf-profile.func.cycles-pp.up_write
      1.16 =C2=B1  1%     -21.6%       0.91 =C2=B1  1%     -17.7%       0.9=
5 =C2=B1  1%  perf-profile.func.cycles-pp.vfs_write
      0.37 =C2=B1  2%    +243.6%       1.26 =C2=B1  2%    +272.3%       1.3=
6 =C2=B1  2%  perf-profile.func.cycles-pp.xfs_bmap_search_extents
      0.41 =C2=B1  1%    +198.4%       1.22 =C2=B1  2%    +198.8%       1.2=
3 =C2=B1  3%  perf-profile.func.cycles-pp.xfs_bmap_search_multi_extents
      0.70 =C2=B1  5%    +219.5%       2.24 =C2=B1  0%    +227.9%       2.2=
9 =C2=B1  0%  perf-profile.func.cycles-pp.xfs_bmapi_read
      1.05 =C2=B1  2%     -15.6%       0.88 =C2=B1  3%     -18.8%       0.8=
5 =C2=B1  1%  perf-profile.func.cycles-pp.xfs_file_write_iter
      0.64 =C2=B1  1%    +182.8%       1.81 =C2=B1  4%    +182.0%       1.8=
1 =C2=B1  0%  perf-profile.func.cycles-pp.xfs_iext_bno_to_ext
      0.00 =C2=B1 -1%      +Inf%       1.10 =C2=B1  3%      +Inf%       1.2=
1 =C2=B1  2%  perf-profile.func.cycles-pp.xfs_iomap_eof_want_preallocate.co=
nstprop.8
      0.46 =C2=B1  4%    +161.6%       1.20 =C2=B1  1%    +171.7%       1.2=
5 =C2=B1  1%  perf-profile.func.cycles-pp.xfs_iomap_write_delay


raw perf data:

  "perf-profile.func.cycles-pp.intel_idle": 17.66,
  "perf-profile.func.cycles-pp.copy_user_enhanced_fast_string": 3.25,
  "perf-profile.func.cycles-pp.memset_erms": 2.56,
  "perf-profile.func.cycles-pp.xfs_bmapi_read": 2.28,
  "perf-profile.func.cycles-pp.___might_sleep": 2.09,
  "perf-profile.func.cycles-pp.__block_commit_write.isra.24": 2.07,
  "perf-profile.func.cycles-pp.xfs_iext_bno_to_ext": 1.79,
  "perf-profile.func.cycles-pp.__block_write_begin_int": 1.74,
  "perf-profile.func.cycles-pp.up_write": 1.72,
  "perf-profile.func.cycles-pp.unlock_page": 1.69,
  "perf-profile.func.cycles-pp.down_write": 1.59,
  "perf-profile.func.cycles-pp.__mark_inode_dirty": 1.54,
  "perf-profile.func.cycles-pp.xfs_bmap_search_extents": 1.33,
  "perf-profile.func.cycles-pp.xfs_iomap_write_delay": 1.23,
  "perf-profile.func.cycles-pp.mark_buffer_dirty": 1.21,
  "perf-profile.func.cycles-pp.__radix_tree_lookup": 1.2,
  "perf-profile.func.cycles-pp.xfs_bmap_search_multi_extents": 1.18,
  "perf-profile.func.cycles-pp.xfs_iomap_eof_want_preallocate.constprop.8":=
 1.17,
  "perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath": 1.15,
  "perf-profile.func.cycles-pp.__might_sleep": 1.14,
  "perf-profile.func.cycles-pp._raw_spin_lock": 0.97,
  "perf-profile.func.cycles-pp.vfs_write": 0.94,
  "perf-profile.func.cycles-pp.xfs_bmapi_delay": 0.93,
  "perf-profile.func.cycles-pp.iomap_write_actor": 0.9,
  "perf-profile.func.cycles-pp.pagecache_get_page": 0.89,
  "perf-profile.func.cycles-pp.xfs_file_write_iter": 0.86,
  "perf-profile.func.cycles-pp.xfs_file_iomap_begin": 0.81,
  "perf-profile.func.cycles-pp.iov_iter_copy_from_user_atomic": 0.78,
  "perf-profile.func.cycles-pp.iomap_apply": 0.77,
  "perf-profile.func.cycles-pp.generic_write_end": 0.74,
  "perf-profile.func.cycles-pp.xfs_file_buffered_aio_write": 0.72,
  "perf-profile.func.cycles-pp.find_get_entry": 0.69,
  "perf-profile.func.cycles-pp.__vfs_write": 0.67,


Best Regards,
Huang, Ying

--===============0139269639533794517==--

