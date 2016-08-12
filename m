Content-Type: multipart/mixed; boundary="===============3251204819840604234=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 16:51:24 +0800
Message-ID: <20160812085124.GB19354@yexl-desktop>
In-Reply-To: <20160812062934.GA17589@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3251204819840604234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/12, Ye Xiaolong wrote:
>On 08/12, Dave Chinner wrote:

[snip]

>>lkp-folk: the patch I've just tested it attached below - can you
>>feed that through your test and see if it fixes the regression?
>>
>
>Hi, Dave
>
>I am verifying your fix patch in lkp environment now, will send the
>result once I get it.
>

Here is the test result.

commit 636b594f38278080db93f2d67d11d31700924f5d
Author:     Dave Chinner <dchinner@redhat.com>
AuthorDate: Fri Aug 12 14:23:44 2016 +0800
Commit:     Xiaolong Ye <xiaolong.ye@intel.com>
CommitDate: Fri Aug 12 14:23:44 2016 +0800

    When a write occurs that extends the file, we check to see if we
    need to preallocate more delalloc space.  When we do sub-page
    writes, the new iomap write path passes a sub-block write length to
    the block mapping code.  xfs_iomap_write_delay does not expect to be
    pased byte counts smaller than one filesystem block, so it ends up
    checking the BMBT on for blocks beyond EOF on every write,
    regardless of whether we need to or not. This causes a regression in
    aim7 benchmarks as it is full of sub-page writes.
    =

    To fix this, clamp the minimum length of a mapping request coming
    through xfs_file_iomap_begin() to one filesystem block. This ensures
    we are passing the same length to xfs_iomap_write_delay() as we did
    when calling through the get_blocks path. This substantially reduces
    the amount of lookup load being placed on the BMBT during sub-block
    write loads.
    =

    Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 fs/xfs/xfs_iomap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 620fc91..5eaace0 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -1015,10 +1015,15 @@ xfs_file_iomap_begin(
                 * number pulled out of thin air as a best guess for initial
                 * testing.
                 *
+                * xfs_iomap_write_delay() only works if the length passed =
in is
+                * >=3D one filesystem block. Hence we need to clamp the mi=
nimum
+                * length we map, too.
+                *
                 * Note that the values needs to be less than 32-bits wide =
until
                 * the lower level functions are updated.
                 */
                length =3D min_t(loff_t, length, 1024 * PAGE_SIZE);
+               length =3D max_t(loff_t, length, (1 << inode->i_blkbits));
                if (xfs_get_extsz_hint(ip)) {
                        /*
                         * xfs_iomap_write_direct() expects the shared lock=
. It

f0c6bcba74ac51cb  68a9f5e7007c1afa2cf6830b69  636b594f38278080db93f2d67d  =

----------------  --------------------------  --------------------------  =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    484435 =C2=B1  0%     -13.3%     420004 =C2=B1  0%     -14.0%     41677=
7 =C2=B1  0%  aim7.jobs-per-min
      6491 =C2=B1  3%     +30.8%       8491 =C2=B1  0%     +35.7%       880=
6 =C2=B1  1%  aim7.time.involuntary_context_switches
       376 =C2=B1  0%     +28.4%        484 =C2=B1  0%     +29.6%        48=
8 =C2=B1  0%  aim7.time.system_time
    430512 =C2=B1  0%     -20.1%     343838 =C2=B1  0%     -19.7%     34570=
8 =C2=B1  0%  aim7.time.voluntary_context_switches
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +16.1%      43.4=
1 =C2=B1  0%  aim7.time.elapsed_time
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +16.1%      43.4=
1 =C2=B1  0%  aim7.time.elapsed_time.max
    155184 =C2=B1  1%      -2.1%     151864 =C2=B1  1%      -2.7%     15093=
7 =C2=B1  1%  aim7.time.minor_page_faults
         0 =C2=B1  0%      +Inf%     215412 =C2=B1141%      +Inf%     33441=
6 =C2=B1 75%  latency_stats.sum.wait_on_page_bit.__migration_entry_wait.mig=
ration_entry_wait.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_=
fault.page_fault
     24772 =C2=B1  0%     -28.6%      17675 =C2=B1  0%     -26.7%      1814=
9 =C2=B1  2%  vmstat.system.cs
     26816 =C2=B1  8%     +10.2%      29542 =C2=B1  1%     +13.3%      3037=
0 =C2=B1  1%  interrupts.CAL:Function_call_interrupts
    125122 =C2=B1 10%     -10.7%     111758 =C2=B1 12%     -11.1%     11122=
3 =C2=B1 11%  softirqs.SCHED
      3906 =C2=B1  0%     +28.8%       5032 =C2=B1  2%     +29.1%       504=
5 =C2=B1  1%  proc-vmstat.nr_active_file
      3444 =C2=B1  5%     +41.8%       4884 =C2=B1  0%     +25.0%       430=
4 =C2=B1 11%  proc-vmstat.nr_shmem
      4092 =C2=B1 14%     +61.2%       6595 =C2=B1  1%     +40.0%       572=
8 =C2=B1 15%  proc-vmstat.pgactivate
     15627 =C2=B1  0%     +27.7%      19956 =C2=B1  1%     +27.4%      1990=
2 =C2=B1  0%  meminfo.Active(file)
     16103 =C2=B1  3%     +14.3%      18405 =C2=B1  8%     +11.2%      1790=
0 =C2=B1  1%  meminfo.AnonHugePages
     13777 =C2=B1  5%     +43.1%      19709 =C2=B1  0%     +25.0%      1722=
0 =C2=B1 11%  meminfo.Shmem
   1724300 =C2=B1 27%     -40.5%    1025538 =C2=B1  1%     -41.3%    101286=
8 =C2=B1  0%  sched_debug.cfs_rq:/.load.max
   1724300 =C2=B1 27%     -40.5%    1025538 =C2=B1  1%     -41.3%    101286=
8 =C2=B1  0%  sched_debug.cpu.load.max
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +16.1%      43.4=
1 =C2=B1  0%  time.elapsed_time
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%     +16.1%      43.4=
1 =C2=B1  0%  time.elapsed_time.max
      6491 =C2=B1  3%     +30.8%       8491 =C2=B1  0%     +35.7%       880=
6 =C2=B1  1%  time.involuntary_context_switches
      1037 =C2=B1  0%     +10.8%       1148 =C2=B1  0%     +10.9%       114=
9 =C2=B1  0%  time.percent_of_cpu_this_job_got
       376 =C2=B1  0%     +28.4%        484 =C2=B1  0%     +29.6%        48=
8 =C2=B1  0%  time.system_time
    430512 =C2=B1  0%     -20.1%     343838 =C2=B1  0%     -19.7%     34570=
8 =C2=B1  0%  time.voluntary_context_switches
    319584 =C2=B1  1%     -26.5%     234868 =C2=B1  1%     -23.9%     24333=
1 =C2=B1  3%  cpuidle.C1-IVT.usage
  52991525 =C2=B1  1%     -19.4%   42687208 =C2=B1  0%     -20.0%   4236875=
4 =C2=B1  0%  cpuidle.C1-IVT.time
     46760 =C2=B1  0%     -22.4%      36298 =C2=B1  0%     -21.6%      3668=
1 =C2=B1  1%  cpuidle.C1E-IVT.usage
   3468808 =C2=B1  2%     -19.8%    2783341 =C2=B1  3%     -16.9%    288160=
8 =C2=B1  5%  cpuidle.C1E-IVT.time
  12590471 =C2=B1  0%     -22.3%    9788585 =C2=B1  1%     -21.6%    986651=
5 =C2=B1  1%  cpuidle.C3-IVT.time
     79965 =C2=B1  0%     -19.0%      64749 =C2=B1  0%     -19.1%      6465=
4 =C2=B1  0%  cpuidle.C3-IVT.usage
   1.3e+09 =C2=B1  0%     +13.3%  1.473e+09 =C2=B1  0%     +13.9%  1.481e+0=
9 =C2=B1  0%  cpuidle.C6-IVT.time
     24.18 =C2=B1  0%      +9.0%      26.35 =C2=B1  0%      +9.6%      26.4=
9 =C2=B1  0%  turbostat.%Busy
       686 =C2=B1  0%      +9.5%        751 =C2=B1  0%      +9.2%        74=
9 =C2=B1  1%  turbostat.Avg_MHz
      0.28 =C2=B1  0%     -25.0%       0.21 =C2=B1  0%     -23.8%       0.2=
1 =C2=B1  4%  turbostat.CPU%c3
        79 =C2=B1  1%      -0.4%         78 =C2=B1  3%     -21.5%         6=
2 =C2=B1  2%  turbostat.CoreTmp
        78 =C2=B1  0%      +0.4%         79 =C2=B1  3%     -21.2%         6=
2 =C2=B1  1%  turbostat.PkgTmp
      4.74 =C2=B1  0%      -2.7%       4.61 =C2=B1  1%     -13.1%       4.1=
2 =C2=B1  0%  turbostat.RAMWatt
        51 =C2=B1  0%      +0.0%         51 =C2=B1  0%    +333.3%        22=
1 =C2=B1 10%  slabinfo.dio.active_objs
        51 =C2=B1  0%      +0.0%         51 =C2=B1  0%    +333.3%        22=
1 =C2=B1 10%  slabinfo.dio.num_objs
       876 =C2=B1  6%      +2.8%        900 =C2=B1  3%     +16.7%       102=
2 =C2=B1  0%  slabinfo.nsproxy.active_objs
       876 =C2=B1  6%      +2.8%        900 =C2=B1  3%     +16.7%       102=
2 =C2=B1  0%  slabinfo.nsproxy.num_objs
      1975 =C2=B1 15%     +63.2%       3224 =C2=B1 17%     +45.5%       287=
4 =C2=B1 15%  slabinfo.scsi_data_buffer.active_objs
      1975 =C2=B1 15%     +63.2%       3224 =C2=B1 17%     +45.5%       287=
4 =C2=B1 15%  slabinfo.scsi_data_buffer.num_objs
       464 =C2=B1 15%     +63.3%        758 =C2=B1 17%     +46.6%        68=
0 =C2=B1 15%  slabinfo.xfs_efd_item.active_objs
       464 =C2=B1 15%     +63.3%        758 =C2=B1 17%     +46.6%        68=
0 =C2=B1 15%  slabinfo.xfs_efd_item.num_objs
      1930 =C2=B1  0%     +33.9%       2585 =C2=B1  3%     +24.7%       240=
7 =C2=B1  5%  numa-vmstat.node0.nr_active_file
       466 =C2=B1  4%     +29.3%        603 =C2=B1 14%     +28.9%        60=
1 =C2=B1 18%  numa-vmstat.node0.nr_dirty
      1977 =C2=B1  1%     +23.6%       2444 =C2=B1  1%     +33.6%       264=
1 =C2=B1  7%  numa-vmstat.node1.nr_active_file
     11671 =C2=B1  3%     +55.9%      18197 =C2=B1 24%     +43.3%      1673=
0 =C2=B1 25%  numa-vmstat.node1.nr_anon_pages
      3809 =C2=B1  6%     +16.1%       4422 =C2=B1  4%     +21.6%       463=
3 =C2=B1  4%  numa-vmstat.node1.nr_alloc_batch
     12026 =C2=B1  4%     +64.1%      19734 =C2=B1 20%     +43.7%      1727=
6 =C2=B1 22%  numa-vmstat.node1.nr_active_anon
      7723 =C2=B1  0%     +32.6%      10238 =C2=B1  5%     +19.5%       922=
8 =C2=B1  4%  numa-meminfo.node0.Active(file)
      8774 =C2=B1 29%      +5.3%       9238 =C2=B1 28%     +22.5%      1074=
9 =C2=B1 24%  numa-meminfo.node1.Mapped
      7908 =C2=B1  1%     +22.9%       9722 =C2=B1  3%     +35.8%      1073=
6 =C2=B1  3%  numa-meminfo.node1.Active(file)
     46721 =C2=B1  3%     +55.9%      72837 =C2=B1 24%     +42.8%      6671=
1 =C2=B1 26%  numa-meminfo.node1.AnonPages
     56052 =C2=B1  3%     +58.2%      88666 =C2=B1 17%     +42.2%      7969=
6 =C2=B1 19%  numa-meminfo.node1.Active
     48142 =C2=B1  4%     +64.0%      78943 =C2=B1 19%     +43.2%      6896=
0 =C2=B1 22%  numa-meminfo.node1.Active(anon)
 2.658e+11 =C2=B1  4%     +24.7%  3.316e+11 =C2=B1  2%     +25.9%  3.346e+1=
1 =C2=B1  3%  perf-stat.branch-instructions
      0.41 =C2=B1  1%      -9.1%       0.37 =C2=B1  1%      -9.4%       0.3=
7 =C2=B1  1%  perf-stat.branch-miss-rate
  1.09e+09 =C2=B1  3%     +13.4%  1.237e+09 =C2=B1  1%     +14.1%  1.244e+0=
9 =C2=B1  2%  perf-stat.branch-misses
    981138 =C2=B1  0%     -18.1%     803696 =C2=B1  0%     -16.0%     82391=
3 =C2=B1  1%  perf-stat.context-switches
 1.511e+12 =C2=B1  5%     +23.4%  1.864e+12 =C2=B1  3%     +24.4%   1.88e+1=
2 =C2=B1  4%  perf-stat.cpu-cycles
    102600 =C2=B1  1%      -7.3%      95075 =C2=B1  1%      -5.2%      9726=
1 =C2=B1  1%  perf-stat.cpu-migrations
      0.26 =C2=B1 12%     -30.8%       0.18 =C2=B1 10%     -28.1%       0.1=
9 =C2=B1 27%  perf-stat.dTLB-load-miss-rate
 3.164e+11 =C2=B1  1%     +39.9%  4.426e+11 =C2=B1  4%     +40.0%   4.43e+1=
1 =C2=B1  1%  perf-stat.dTLB-loads
      0.03 =C2=B1 26%     -41.3%       0.02 =C2=B1 13%     -41.8%       0.0=
2 =C2=B1  5%  perf-stat.dTLB-store-miss-rate
 2.247e+11 =C2=B1  6%     +26.4%  2.839e+11 =C2=B1  2%     +29.2%  2.903e+1=
1 =C2=B1  5%  perf-stat.dTLB-stores
  34415974 =C2=B1  6%      -1.7%   33840719 =C2=B1 12%      -6.7%   3211946=
2 =C2=B1  2%  perf-stat.iTLB-load-misses
  17863352 =C2=B1  4%      +2.1%   18245848 =C2=B1  2%      -7.9%   1646016=
1 =C2=B1  2%  perf-stat.iTLB-loads
  1.49e+12 =C2=B1  4%     +30.1%  1.939e+12 =C2=B1  2%     +31.5%  1.959e+1=
2 =C2=B1  3%  perf-stat.instructions
     43348 =C2=B1  2%     +34.2%      58161 =C2=B1 12%     +40.9%      6106=
5 =C2=B1  5%  perf-stat.instructions-per-iTLB-miss
      0.99 =C2=B1  0%      +5.5%       1.04 =C2=B1  0%      +5.7%       1.0=
4 =C2=B1  0%  perf-stat.ipc
    262799 =C2=B1  0%      +4.4%     274251 =C2=B1  1%      +4.3%     27414=
9 =C2=B1  0%  perf-stat.minor-faults
     34.12 =C2=B1  1%      +2.1%      34.83 =C2=B1  0%      +3.5%      35.3=
0 =C2=B1  1%  perf-stat.node-load-miss-rate
  46476754 =C2=B1  2%      +4.6%   48601269 =C2=B1  1%      +6.6%   4953426=
7 =C2=B1  0%  perf-stat.node-load-misses
      9.96 =C2=B1  0%     +13.4%      11.30 =C2=B1  0%     +13.6%      11.3=
1 =C2=B1  2%  perf-stat.node-store-miss-rate
  24460859 =C2=B1  1%     +14.4%   27971097 =C2=B1  1%     +13.8%   2784490=
3 =C2=B1  0%  perf-stat.node-store-misses
    262780 =C2=B1  0%      +4.4%     274227 =C2=B1  1%      +4.3%     27411=
7 =C2=B1  0%  perf-stat.page-faults
      0.00 =C2=B1  0%      +Inf%      52.94 =C2=B1  0%      +Inf%      52.6=
9 =C2=B1  0%  perf-profile.cycles-pp.iomap_file_buffered_write.xfs_file_buf=
fered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write
      0.00 =C2=B1  0%      +Inf%      52.29 =C2=B1  0%      +Inf%      52.1=
1 =C2=B1  0%  perf-profile.cycles-pp.iomap_apply.iomap_file_buffered_write.=
xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
      0.00 =C2=B1  0%      +Inf%      34.35 =C2=B1  0%      +Inf%      34.0=
5 =C2=B1  0%  perf-profile.cycles-pp.iomap_write_actor.iomap_apply.iomap_fi=
le_buffered_write.xfs_file_buffered_aio_write.xfs_file_write_iter
      0.00 =C2=B1  0%      +Inf%      16.48 =C2=B1  0%      +Inf%      16.3=
5 =C2=B1  1%  perf-profile.cycles-pp.iomap_write_begin.iomap_write_actor.io=
map_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1  0%      +Inf%      16.05 =C2=B1  0%      +Inf%      16.2=
1 =C2=B1  1%  perf-profile.cycles-pp.xfs_file_iomap_begin.iomap_apply.iomap=
_file_buffered_write.xfs_file_buffered_aio_write.xfs_file_write_iter
      0.00 =C2=B1  0%      +Inf%       9.85 =C2=B1  0%      +Inf%       9.7=
5 =C2=B1  1%  perf-profile.cycles-pp.grab_cache_page_write_begin.iomap_writ=
e_begin.iomap_write_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       9.25 =C2=B1  0%      +Inf%       9.1=
8 =C2=B1  1%  perf-profile.cycles-pp.pagecache_get_page.grab_cache_page_wri=
te_begin.iomap_write_begin.iomap_write_actor.iomap_apply
      0.00 =C2=B1  0%      +Inf%       9.08 =C2=B1  0%      +Inf%       9.0=
8 =C2=B1  1%  perf-profile.cycles-pp.xfs_iomap_write_delay.xfs_file_iomap_b=
egin.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1  0%      +Inf%       7.91 =C2=B1  1%      +Inf%       7.9=
0 =C2=B1  0%  perf-profile.cycles-pp.generic_write_end.iomap_write_actor.io=
map_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1  0%      +Inf%       4.69 =C2=B1  0%      +Inf%       4.6=
6 =C2=B1  0%  perf-profile.cycles-pp.block_write_end.generic_write_end.ioma=
p_write_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       4.45 =C2=B1  1%      +Inf%       4.4=
5 =C2=B1  0%  perf-profile.cycles-pp.__block_commit_write.isra.24.block_wri=
te_end.generic_write_end.iomap_write_actor.iomap_apply
      0.00 =C2=B1  0%      +Inf%       4.14 =C2=B1  0%      +Inf%       4.1=
2 =C2=B1  1%  perf-profile.cycles-pp.xfs_iomap_eof_want_preallocate.constpr=
op.8.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply.iomap_file_buff=
ered_write
      0.00 =C2=B1  0%      +Inf%       3.69 =C2=B1  1%      +Inf%       3.6=
9 =C2=B1  2%  perf-profile.cycles-pp.add_to_page_cache_lru.pagecache_get_pa=
ge.grab_cache_page_write_begin.iomap_write_begin.iomap_write_actor
      0.00 =C2=B1  0%      +Inf%       3.64 =C2=B1  0%      +Inf%       3.6=
2 =C2=B1  0%  perf-profile.cycles-pp.__block_write_begin_int.iomap_write_be=
gin.iomap_write_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       3.44 =C2=B1  1%      +Inf%       3.3=
5 =C2=B1  2%  perf-profile.cycles-pp.mark_page_accessed.iomap_write_actor.i=
omap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1  0%      +Inf%       3.04 =C2=B1  1%      +Inf%       3.0=
0 =C2=B1  3%  perf-profile.cycles-pp.xfs_bmapi_read.xfs_file_iomap_begin.io=
map_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1  0%      +Inf%       3.22 =C2=B1  0%      +Inf%       3.1=
5 =C2=B1  1%  perf-profile.cycles-pp.copy_user_enhanced_fast_string.iomap_w=
rite_actor.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1  0%      +Inf%       3.06 =C2=B1  1%      +Inf%       3.0=
9 =C2=B1  0%  perf-profile.cycles-pp.xfs_bmapi_delay.xfs_iomap_write_delay.=
xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       3.05 =C2=B1  1%      +Inf%       3.0=
5 =C2=B1  2%  perf-profile.cycles-pp.xfs_bmapi_read.xfs_iomap_eof_want_prea=
llocate.constprop.8.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply
      0.00 =C2=B1  0%      +Inf%       2.78 =C2=B1  0%      +Inf%       2.8=
3 =C2=B1  1%  perf-profile.cycles-pp.mark_buffer_dirty.__block_commit_write=
.isra.24.block_write_end.generic_write_end.iomap_write_actor
      0.00 =C2=B1  0%      +Inf%       2.68 =C2=B1  2%      +Inf%       2.6=
0 =C2=B1  1%  perf-profile.cycles-pp.__page_cache_alloc.pagecache_get_page.=
grab_cache_page_write_begin.iomap_write_begin.iomap_write_actor
      0.00 =C2=B1  0%      +Inf%       2.56 =C2=B1  2%      +Inf%       2.4=
6 =C2=B1  0%  perf-profile.cycles-pp.alloc_pages_current.__page_cache_alloc=
.pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin
      0.00 =C2=B1  0%      +Inf%       2.43 =C2=B1  0%      +Inf%       2.4=
2 =C2=B1  0%  perf-profile.cycles-pp.memset_erms.iomap_write_begin.iomap_wr=
ite_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       1.97 =C2=B1  2%      +Inf%       1.9=
0 =C2=B1  4%  perf-profile.cycles-pp.xfs_bmap_search_extents.xfs_bmapi_read=
.xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       1.55 =C2=B1  3%      +Inf%       1.6=
2 =C2=B1  2%  perf-profile.cycles-pp.find_get_entry.pagecache_get_page.grab=
_cache_page_write_begin.iomap_write_begin.iomap_write_actor
      0.00 =C2=B1  0%      +Inf%       1.68 =C2=B1  1%      +Inf%       1.6=
6 =C2=B1  2%  perf-profile.cycles-pp.__add_to_page_cache_locked.add_to_page=
_cache_lru.pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin
      0.00 =C2=B1  0%      +Inf%       1.73 =C2=B1  1%      +Inf%       1.7=
1 =C2=B1  2%  perf-profile.cycles-pp.xfs_bmap_search_extents.xfs_bmapi_dela=
y.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply
      0.00 =C2=B1  0%      +Inf%       1.61 =C2=B1  2%      +Inf%       1.6=
4 =C2=B1  3%  perf-profile.cycles-pp.xfs_bmap_search_extents.xfs_bmapi_read=
.xfs_iomap_eof_want_preallocate.constprop.8.xfs_iomap_write_delay.xfs_file_=
iomap_begin
      0.00 =C2=B1  0%      +Inf%       1.52 =C2=B1  2%      +Inf%       1.5=
1 =C2=B1  4%  perf-profile.cycles-pp.workingset_activation.mark_page_access=
ed.iomap_write_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       1.55 =C2=B1  1%      +Inf%       1.5=
5 =C2=B1  1%  perf-profile.cycles-pp.lru_cache_add.add_to_page_cache_lru.pa=
gecache_get_page.grab_cache_page_write_begin.iomap_write_begin
      0.00 =C2=B1  0%      +Inf%       1.53 =C2=B1  1%      +Inf%       1.5=
2 =C2=B1  1%  perf-profile.cycles-pp.create_page_buffers.__block_write_begi=
n_int.iomap_write_begin.iomap_write_actor.iomap_apply
      0.00 =C2=B1  0%      +Inf%       1.46 =C2=B1  1%      +Inf%       1.4=
5 =C2=B1  3%  perf-profile.cycles-pp.xfs_bmap_search_multi_extents.xfs_bmap=
_search_extents.xfs_bmapi_read.xfs_file_iomap_begin.iomap_apply
      0.00 =C2=B1  0%      +Inf%       1.36 =C2=B1  1%      +Inf%       1.3=
9 =C2=B1  1%  perf-profile.cycles-pp.unlock_page.generic_write_end.iomap_wr=
ite_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       1.18 =C2=B1  1%      +Inf%       1.1=
9 =C2=B1  1%  perf-profile.cycles-pp.create_empty_buffers.create_page_buffe=
rs.__block_write_begin_int.iomap_write_begin.iomap_write_actor
      0.00 =C2=B1  0%      +Inf%       1.21 =C2=B1  2%      +Inf%       1.2=
3 =C2=B1  2%  perf-profile.cycles-pp.xfs_bmap_search_multi_extents.xfs_bmap=
_search_extents.xfs_bmapi_read.xfs_iomap_eof_want_preallocate.constprop.8.x=
fs_iomap_write_delay
      0.00 =C2=B1  0%      +Inf%       1.24 =C2=B1  2%      +Inf%       1.2=
1 =C2=B1  2%  perf-profile.cycles-pp.xfs_bmap_search_multi_extents.xfs_bmap=
_search_extents.xfs_bmapi_delay.xfs_iomap_write_delay.xfs_file_iomap_begin
      0.00 =C2=B1  0%      +Inf%       1.14 =C2=B1  3%      +Inf%       1.1=
6 =C2=B1  3%  perf-profile.cycles-pp.xfs_ilock.xfs_file_iomap_begin.iomap_a=
pply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00 =C2=B1  0%      +Inf%       1.09 =C2=B1  2%      +Inf%       1.0=
8 =C2=B1  1%  perf-profile.cycles-pp.__mark_inode_dirty.generic_write_end.i=
omap_write_actor.iomap_apply.iomap_file_buffered_write
      0.00 =C2=B1  0%      +Inf%       0.95 =C2=B1  0%      +Inf%       1.0=
1 =C2=B1  3%  perf-profile.cycles-pp.radix_tree_lookup_slot.find_get_entry.=
pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin
     43.95 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.generic_perform_write.xfs_file_buffere=
d_aio_write.xfs_file_write_iter.__vfs_write.vfs_write
     25.10 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_vm_write_begin.generic_perform_wri=
te.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
     13.71 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.__block_write_begin.xfs_vm_write_begin=
.generic_perform_write.xfs_file_buffered_aio_write.xfs_file_write_iter
     11.03 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_vm_write_end.generic_perform_write=
.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
     10.68 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.generic_write_end.xfs_vm_write_end.gen=
eric_perform_write.xfs_file_buffered_aio_write.xfs_file_write_iter
     10.96 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.grab_cache_page_write_begin.xfs_vm_wri=
te_begin.generic_perform_write.xfs_file_buffered_aio_write.xfs_file_write_i=
ter
     10.36 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.__block_write_begin_int.__block_write_=
begin.xfs_vm_write_begin.generic_perform_write.xfs_file_buffered_aio_write
     10.37 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.pagecache_get_page.grab_cache_page_wri=
te_begin.xfs_vm_write_begin.generic_perform_write.xfs_file_buffered_aio_wri=
te
      6.46 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_get_blocks.__block_write_begin_int=
.__block_write_begin.xfs_vm_write_begin.generic_perform_write
      6.34 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.__xfs_get_blocks.xfs_get_blocks.__bloc=
k_write_begin_int.__block_write_begin.xfs_vm_write_begin
      6.24 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.block_write_end.generic_write_end.xfs_=
vm_write_end.generic_perform_write.xfs_file_buffered_aio_write
      5.93 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.__block_commit_write.isra.24.block_wri=
te_end.generic_write_end.xfs_vm_write_end.generic_perform_write
      3.95 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.copy_user_enhanced_fast_string.generic=
_perform_write.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write
      4.02 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.add_to_page_cache_lru.pagecache_get_pa=
ge.grab_cache_page_write_begin.xfs_vm_write_begin.generic_perform_write
      3.39 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.mark_buffer_dirty.__block_commit_write=
.isra.24.block_write_end.generic_write_end.xfs_vm_write_end
      3.28 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_iomap_write_delay.__xfs_get_blocks=
.xfs_get_blocks.__block_write_begin_int.__block_write_begin
      3.03 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.memset_erms.__block_write_begin.xfs_vm=
_write_begin.generic_perform_write.xfs_file_buffered_aio_write
      3.04 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.__page_cache_alloc.pagecache_get_page.=
grab_cache_page_write_begin.xfs_vm_write_begin.generic_perform_write
      2.91 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.alloc_pages_current.__page_cache_alloc=
.pagecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      1.86 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.create_page_buffers.__block_write_begi=
n_int.__block_write_begin.xfs_vm_write_begin.generic_perform_write
      1.72 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.unlock_page.generic_write_end.xfs_vm_w=
rite_end.generic_perform_write.xfs_file_buffered_aio_write
      1.80 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.__add_to_page_cache_locked.add_to_page=
_cache_lru.pagecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      1.83 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.find_get_entry.pagecache_get_page.grab=
_cache_page_write_begin.xfs_vm_write_begin.generic_perform_write
      1.72 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.lru_cache_add.add_to_page_cache_lru.pa=
gecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      1.44 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.create_empty_buffers.create_page_buffe=
rs.__block_write_begin_int.__block_write_begin.xfs_vm_write_begin
      1.32 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.__mark_inode_dirty.generic_write_end.x=
fs_vm_write_end.generic_perform_write.xfs_file_buffered_aio_write
      1.25 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_bmapi_delay.xfs_iomap_write_delay.=
__xfs_get_blocks.xfs_get_blocks.__block_write_begin_int
      1.23 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_iomap_eof_want_preallocate.constpr=
op.6.xfs_iomap_write_delay.__xfs_get_blocks.xfs_get_blocks.__block_write_be=
gin_int
      1.17 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.radix_tree_lookup_slot.find_get_entry.=
pagecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin
      1.04 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_bmapi_read.__xfs_get_blocks.xfs_ge=
t_blocks.__block_write_begin_int.__block_write_begin
      0.98 =C2=B1  5%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.cycles-pp.alloc_page_buffers.create_empty_buffer=
s.create_page_buffers.__block_write_begin_int.__block_write_begin
      1.79 =C2=B1  2%     -28.2%       1.28 =C2=B1  3%     -27.8%       1.2=
9 =C2=B1  4%  perf-profile.cycles-pp.do_unlinkat.sys_unlink.entry_SYSCALL_6=
4_fastpath
      1.79 =C2=B1  3%     -27.9%       1.29 =C2=B1  3%     -27.7%       1.3=
0 =C2=B1  4%  perf-profile.cycles-pp.sys_unlink.entry_SYSCALL_64_fastpath
      1.27 =C2=B1  0%     -22.5%       0.99 =C2=B1  4%     -24.6%       0.9=
6 =C2=B1  4%  perf-profile.cycles-pp.destroy_inode.evict.iput.__dentry_kill=
.dput
      2.61 =C2=B1  1%     -24.3%       1.98 =C2=B1  1%     -24.1%       1.9=
8 =C2=B1  1%  perf-profile.cycles-pp.do_filp_open.do_sys_open.sys_creat.ent=
ry_SYSCALL_64_fastpath
      2.58 =C2=B1  1%     -24.1%       1.96 =C2=B1  0%     -24.1%       1.9=
6 =C2=B1  1%  perf-profile.cycles-pp.path_openat.do_filp_open.do_sys_open.s=
ys_creat.entry_SYSCALL_64_fastpath
      1.07 =C2=B1  3%     -23.3%       0.82 =C2=B1  3%     -21.1%       0.8=
5 =C2=B1  2%  perf-profile.cycles-pp.down_write.xfs_file_buffered_aio_write=
.xfs_file_write_iter.__vfs_write.vfs_write
      2.66 =C2=B1  1%     -24.3%       2.01 =C2=B1  1%     -23.7%       2.0=
3 =C2=B1  1%  perf-profile.cycles-pp.do_sys_open.sys_creat.entry_SYSCALL_64=
_fastpath
      2.67 =C2=B1  1%     -24.2%       2.02 =C2=B1  1%     -23.8%       2.0=
3 =C2=B1  1%  perf-profile.cycles-pp.sys_creat.entry_SYSCALL_64_fastpath
      1.24 =C2=B1  1%     -23.1%       0.95 =C2=B1  4%     -24.2%       0.9=
4 =C2=B1  4%  perf-profile.cycles-pp.xfs_fs_destroy_inode.destroy_inode.evi=
ct.iput.__dentry_kill
      1.21 =C2=B1  1%     -23.4%       0.93 =C2=B1  4%     -24.7%       0.9=
1 =C2=B1  4%  perf-profile.cycles-pp.xfs_inactive.xfs_fs_destroy_inode.dest=
roy_inode.evict.iput
      0.94 =C2=B1  4%     -19.8%       0.76 =C2=B1  0%     -21.6%       0.7=
4 =C2=B1  4%  perf-profile.cycles-pp.cancel_dirty_page.try_to_free_buffers.=
xfs_vm_releasepage.try_to_release_page.block_invalidatepage
      1.32 =C2=B1  2%     -21.5%       1.04 =C2=B1  1%     -22.2%       1.0=
3 =C2=B1  3%  perf-profile.cycles-pp.xfs_create.xfs_generic_create.xfs_vn_m=
knod.xfs_vn_create.path_openat
      1.42 =C2=B1  2%     -20.7%       1.13 =C2=B1  1%     -22.1%       1.1=
1 =C2=B1  3%  perf-profile.cycles-pp.xfs_vn_create.path_openat.do_filp_open=
.do_sys_open.sys_creat
      2.35 =C2=B1  1%     -21.0%       1.86 =C2=B1  1%     -20.7%       1.8=
6 =C2=B1  1%  perf-profile.cycles-pp.xfs_vm_releasepage.try_to_release_page=
.block_invalidatepage.xfs_vm_invalidatepage.truncate_inode_page
      1.91 =C2=B1  3%     -16.4%       1.59 =C2=B1  1%     -19.9%       1.5=
3 =C2=B1  1%  perf-profile.cycles-pp.get_page_from_freelist.__alloc_pages_n=
odemask.alloc_pages_current.__page_cache_alloc.pagecache_get_page
      2.07 =C2=B1  1%     -20.4%       1.65 =C2=B1  2%     -19.9%       1.6=
6 =C2=B1  1%  perf-profile.cycles-pp.try_to_free_buffers.xfs_vm_releasepage=
.try_to_release_page.block_invalidatepage.xfs_vm_invalidatepage
      1.42 =C2=B1  2%     -20.5%       1.13 =C2=B1  1%     -22.1%       1.1=
0 =C2=B1  2%  perf-profile.cycles-pp.xfs_vn_mknod.xfs_vn_create.path_openat=
.do_filp_open.do_sys_open
      1.42 =C2=B1  2%     -21.2%       1.12 =C2=B1  1%     -22.4%       1.1=
0 =C2=B1  3%  perf-profile.cycles-pp.xfs_generic_create.xfs_vn_mknod.xfs_vn=
_create.path_openat.do_filp_open
      1.12 =C2=B1  2%     -17.6%       0.92 =C2=B1  4%     -22.3%       0.8=
7 =C2=B1  4%  perf-profile.cycles-pp.__sb_start_write.vfs_write.sys_write.e=
ntry_SYSCALL_64_fastpath
      2.40 =C2=B1  1%     -21.0%       1.89 =C2=B1  2%     -20.6%       1.9=
0 =C2=B1  1%  perf-profile.cycles-pp.try_to_release_page.block_invalidatepa=
ge.xfs_vm_invalidatepage.truncate_inode_page.truncate_inode_pages_range
      1.29 =C2=B1  3%     -18.9%       1.04 =C2=B1  1%     -17.9%       1.0=
6 =C2=B1  1%  perf-profile.cycles-pp.xfs_ilock.xfs_file_buffered_aio_write.=
xfs_file_write_iter.__vfs_write.vfs_write
      3.42 =C2=B1  0%     -20.9%       2.71 =C2=B1  2%     -20.3%       2.7=
3 =C2=B1  2%  perf-profile.cycles-pp.block_invalidatepage.xfs_vm_invalidate=
page.truncate_inode_page.truncate_inode_pages_range.truncate_inode_pages_fi=
nal
      5.96 =C2=B1  1%     -20.0%       4.77 =C2=B1  0%     -19.4%       4.8=
1 =C2=B1  1%  perf-profile.cycles-pp.truncate_inode_page.truncate_inode_pag=
es_range.truncate_inode_pages_final.evict.iput
      3.54 =C2=B1  0%     -20.8%       2.81 =C2=B1  1%     -20.0%       2.8=
3 =C2=B1  2%  perf-profile.cycles-pp.xfs_vm_invalidatepage.truncate_inode_p=
age.truncate_inode_pages_range.truncate_inode_pages_final.evict
      2.55 =C2=B1  3%     -14.2%       2.19 =C2=B1  2%     -17.5%       2.1=
0 =C2=B1  1%  perf-profile.cycles-pp.__alloc_pages_nodemask.alloc_pages_cur=
rent.__page_cache_alloc.pagecache_get_page.grab_cache_page_write_begin
      1.04 =C2=B1  2%     -18.9%       0.84 =C2=B1  1%     -19.6%       0.8=
4 =C2=B1  0%  perf-profile.cycles-pp.__delete_from_page_cache.delete_from_p=
age_cache.truncate_inode_page.truncate_inode_pages_range.truncate_inode_pag=
es_final
      1.74 =C2=B1  2%     -19.9%       1.40 =C2=B1  3%     -19.3%       1.4=
1 =C2=B1  1%  perf-profile.cycles-pp.delete_from_page_cache.truncate_inode_=
page.truncate_inode_pages_range.truncate_inode_pages_final.evict
      1.01 =C2=B1  3%     -17.9%       0.83 =C2=B1  2%     -18.2%       0.8=
2 =C2=B1  1%  perf-profile.cycles-pp.down_write.xfs_ilock.xfs_file_buffered=
_aio_write.xfs_file_write_iter.__vfs_write
     11.21 =C2=B1  2%     -18.1%       9.18 =C2=B1  0%     -18.4%       9.1=
4 =C2=B1  1%  perf-profile.cycles-pp.evict.iput.__dentry_kill.dput.__fput
     11.24 =C2=B1  2%     -18.1%       9.21 =C2=B1  0%     -18.4%       9.1=
8 =C2=B1  1%  perf-profile.cycles-pp.__dentry_kill.dput.__fput.____fput.tas=
k_work_run
     11.22 =C2=B1  2%     -18.1%       9.19 =C2=B1  0%     -18.4%       9.1=
6 =C2=B1  1%  perf-profile.cycles-pp.iput.__dentry_kill.dput.__fput.____fput
      1.79 =C2=B1  3%     -22.2%       1.39 =C2=B1  0%     -18.2%       1.4=
6 =C2=B1  0%  perf-profile.cycles-pp.security_file_permission.rw_verify_are=
a.vfs_write.sys_write.entry_SYSCALL_64_fastpath
     11.26 =C2=B1  2%     -18.1%       9.23 =C2=B1  0%     -18.3%       9.2=
0 =C2=B1  1%  perf-profile.cycles-pp.dput.__fput.____fput.task_work_run.exi=
t_to_usermode_loop
     11.31 =C2=B1  1%     -18.1%       9.27 =C2=B1  0%     -18.2%       9.2=
5 =C2=B1  1%  perf-profile.cycles-pp.____fput.task_work_run.exit_to_usermod=
e_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
     11.34 =C2=B1  2%     -18.1%       9.29 =C2=B1  0%     -18.3%       9.2=
7 =C2=B1  1%  perf-profile.cycles-pp.exit_to_usermode_loop.syscall_return_s=
lowpath.entry_SYSCALL_64_fastpath
     11.31 =C2=B1  2%     -18.1%       9.26 =C2=B1  0%     -18.3%       9.2=
4 =C2=B1  1%  perf-profile.cycles-pp.__fput.____fput.task_work_run.exit_to_=
usermode_loop.syscall_return_slowpath
     11.32 =C2=B1  1%     -18.0%       9.28 =C2=B1  0%     -18.2%       9.2=
6 =C2=B1  1%  perf-profile.cycles-pp.task_work_run.exit_to_usermode_loop.sy=
scall_return_slowpath.entry_SYSCALL_64_fastpath
     11.34 =C2=B1  1%     -18.1%       9.29 =C2=B1  0%     -18.2%       9.2=
7 =C2=B1  1%  perf-profile.cycles-pp.syscall_return_slowpath.entry_SYSCALL_=
64_fastpath
      2.06 =C2=B1  3%     -22.5%       1.60 =C2=B1  2%     -18.1%       1.6=
9 =C2=B1  0%  perf-profile.cycles-pp.rw_verify_area.vfs_write.sys_write.ent=
ry_SYSCALL_64_fastpath
      9.87 =C2=B1  2%     -17.5%       8.15 =C2=B1  0%     -17.6%       8.1=
4 =C2=B1  1%  perf-profile.cycles-pp.truncate_inode_pages_range.truncate_in=
ode_pages_final.evict.iput.__dentry_kill
      9.89 =C2=B1  2%     -17.4%       8.17 =C2=B1  0%     -17.5%       8.1=
6 =C2=B1  1%  perf-profile.cycles-pp.truncate_inode_pages_final.evict.iput.=
__dentry_kill.dput
      1.00 =C2=B1  1%     -18.0%       0.82 =C2=B1  1%     -14.3%       0.8=
6 =C2=B1  3%  perf-profile.cycles-pp.__radix_tree_lookup.radix_tree_lookup_=
slot.find_get_entry.pagecache_get_page.grab_cache_page_write_begin
     51.83 =C2=B1  1%     +14.3%      59.25 =C2=B1  0%     +13.8%      58.9=
7 =C2=B1  0%  perf-profile.cycles-pp.xfs_file_buffered_aio_write.xfs_file_w=
rite_iter.__vfs_write.vfs_write.sys_write
      1.38 =C2=B1  2%     -13.3%       1.19 =C2=B1  1%      -9.9%       1.2=
4 =C2=B1  2%  perf-profile.cycles-pp.__set_page_dirty.mark_buffer_dirty.__b=
lock_commit_write.isra.24.block_write_end.generic_write_end
     53.16 =C2=B1  1%     +13.6%      60.40 =C2=B1  0%     +13.0%      60.1=
0 =C2=B1  0%  perf-profile.cycles-pp.xfs_file_write_iter.__vfs_write.vfs_wr=
ite.sys_write.entry_SYSCALL_64_fastpath
     54.10 =C2=B1  1%     +13.1%      61.20 =C2=B1  0%     +12.5%      60.8=
6 =C2=B1  0%  perf-profile.cycles-pp.__vfs_write.vfs_write.sys_write.entry_=
SYSCALL_64_fastpath
      1.32 =C2=B1  4%     -21.4%       1.04 =C2=B1  0%     -14.9%       1.1=
3 =C2=B1  1%  perf-profile.cycles-pp.selinux_file_permission.security_file_=
permission.rw_verify_area.vfs_write.sys_write
     19.79 =C2=B1  5%      -9.9%      17.84 =C2=B1  0%      -7.5%      18.3=
1 =C2=B1  3%  perf-profile.cycles-pp.start_secondary
     19.75 =C2=B1  5%      -9.8%      17.81 =C2=B1  0%      -7.4%      18.2=
8 =C2=B1  3%  perf-profile.cycles-pp.cpu_startup_entry.start_secondary
      2.50 =C2=B1  3%     -11.5%       2.21 =C2=B1  0%     -13.1%       2.1=
7 =C2=B1  0%  perf-profile.cycles-pp.__pagevec_release.truncate_inode_pages=
_range.truncate_inode_pages_final.evict.iput
      2.39 =C2=B1  3%     -11.2%       2.12 =C2=B1  0%     -13.0%       2.0=
8 =C2=B1  0%  perf-profile.cycles-pp.release_pages.__pagevec_release.trunca=
te_inode_pages_range.truncate_inode_pages_final.evict
     59.63 =C2=B1  1%     +10.2%      65.72 =C2=B1  0%      +9.7%      65.4=
3 =C2=B1  0%  perf-profile.cycles-pp.vfs_write.sys_write.entry_SYSCALL_64_f=
astpath
      0.00 =C2=B1  0%      +Inf%       1.91 =C2=B1  1%      +Inf%       1.8=
3 =C2=B1  1%  perf-profile.func.cycles-pp.mark_page_accessed
      0.00 =C2=B1  0%      +Inf%       1.12 =C2=B1  1%      +Inf%       1.1=
2 =C2=B1  0%  perf-profile.func.cycles-pp.iomap_write_actor
      0.00 =C2=B1  0%      +Inf%       1.10 =C2=B1  3%      +Inf%       1.1=
0 =C2=B1  2%  perf-profile.func.cycles-pp.xfs_iomap_eof_want_preallocate.co=
nstprop.8
      1.30 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.func.cycles-pp.generic_perform_write
      1.08 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%    -100.0%       0.0=
0 =C2=B1  0%  perf-profile.func.cycles-pp.__xfs_get_blocks
      0.37 =C2=B1  2%    +243.6%       1.26 =C2=B1  2%    +236.4%       1.2=
3 =C2=B1  0%  perf-profile.func.cycles-pp.xfs_bmap_search_extents
      0.70 =C2=B1  5%    +219.5%       2.24 =C2=B1  0%    +213.8%       2.2=
0 =C2=B1  2%  perf-profile.func.cycles-pp.xfs_bmapi_read
      0.41 =C2=B1  1%    +198.4%       1.22 =C2=B1  2%    +190.2%       1.1=
9 =C2=B1  1%  perf-profile.func.cycles-pp.xfs_bmap_search_multi_extents
      0.64 =C2=B1  1%    +182.8%       1.81 =C2=B1  4%    +181.3%       1.8=
0 =C2=B1  0%  perf-profile.func.cycles-pp.xfs_iext_bno_to_ext
      0.46 =C2=B1  4%    +161.6%       1.20 =C2=B1  1%    +163.0%       1.2=
1 =C2=B1  1%  perf-profile.func.cycles-pp.xfs_iomap_write_delay
      1.31 =C2=B1  2%     -46.7%       0.70 =C2=B1  0%     -46.9%       0.6=
9 =C2=B1  2%  perf-profile.func.cycles-pp.generic_write_end
      2.49 =C2=B1  0%     -34.5%       1.63 =C2=B1  1%     -36.0%       1.5=
9 =C2=B1  1%  perf-profile.func.cycles-pp.__block_commit_write.isra.24
      1.50 =C2=B1  1%     -20.9%       1.19 =C2=B1  1%     -21.3%       1.1=
8 =C2=B1  1%  perf-profile.func.cycles-pp.mark_buffer_dirty
      3.24 =C2=B1  0%     -19.8%       2.60 =C2=B1  0%     -20.0%       2.5=
9 =C2=B1  0%  perf-profile.func.cycles-pp.memset_erms
      3.96 =C2=B1  2%     -18.4%       3.23 =C2=B1  0%     -20.3%       3.1=
6 =C2=B1  1%  perf-profile.func.cycles-pp.copy_user_enhanced_fast_string
      1.79 =C2=B1  4%     -16.8%       1.49 =C2=B1  1%     -19.6%       1.4=
4 =C2=B1  0%  perf-profile.func.cycles-pp.__mark_inode_dirty
      1.41 =C2=B1  3%     -20.6%       1.12 =C2=B1  3%     -21.3%       1.1=
1 =C2=B1  3%  perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath
      1.16 =C2=B1  0%     -18.1%       0.95 =C2=B1  1%     -18.1%       0.9=
5 =C2=B1  3%  perf-profile.func.cycles-pp._raw_spin_lock
      1.16 =C2=B1  1%     -21.6%       0.91 =C2=B1  1%     -20.1%       0.9=
3 =C2=B1  2%  perf-profile.func.cycles-pp.vfs_write
      1.75 =C2=B1  2%     -18.9%       1.42 =C2=B1  1%     -17.7%       1.4=
4 =C2=B1  2%  perf-profile.func.cycles-pp.unlock_page
      1.32 =C2=B1  0%     -16.4%       1.10 =C2=B1  1%     -14.1%       1.1=
3 =C2=B1  3%  perf-profile.func.cycles-pp.__radix_tree_lookup
      1.51 =C2=B1  2%     +15.4%       1.75 =C2=B1  1%     +15.9%       1.7=
5 =C2=B1  0%  perf-profile.func.cycles-pp.__block_write_begin_int
      1.02 =C2=B1  4%      -7.5%       0.94 =C2=B1  2%     -12.4%       0.8=
9 =C2=B1  2%  perf-profile.func.cycles-pp.pagecache_get_page
      1.05 =C2=B1  2%     -15.6%       0.88 =C2=B1  3%     -15.6%       0.8=
8 =C2=B1  5%  perf-profile.func.cycles-pp.xfs_file_write_iter

raw perf profile data:

  "perf-profile.func.cycles-pp.intel_idle": 17.0,
  "perf-profile.func.cycles-pp.copy_user_enhanced_fast_string": 3.15,
  "perf-profile.func.cycles-pp.memset_erms": 2.59,
  "perf-profile.func.cycles-pp.xfs_bmapi_read": 2.25,
  "perf-profile.func.cycles-pp.___might_sleep": 2.13,
  "perf-profile.func.cycles-pp.mark_page_accessed": 1.8,
  "perf-profile.func.cycles-pp.xfs_iext_bno_to_ext": 1.8,
  "perf-profile.func.cycles-pp.__block_write_begin_int": 1.74,
  "perf-profile.func.cycles-pp.__block_commit_write.isra.24": 1.62,
  "perf-profile.func.cycles-pp.up_write": 1.62,
  "perf-profile.func.cycles-pp.down_write": 1.48,
  "perf-profile.func.cycles-pp.unlock_page": 1.48,
  "perf-profile.func.cycles-pp.__mark_inode_dirty": 1.43,
  "perf-profile.func.cycles-pp.xfs_iomap_write_delay": 1.23,
  "perf-profile.func.cycles-pp.xfs_bmap_search_extents": 1.23,
  "perf-profile.func.cycles-pp.__radix_tree_lookup": 1.19,
  "perf-profile.func.cycles-pp.xfs_bmap_search_multi_extents": 1.18,
  "perf-profile.func.cycles-pp.__might_sleep": 1.17,
  "perf-profile.func.cycles-pp.mark_buffer_dirty": 1.16,
  "perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath": 1.12,
  "perf-profile.func.cycles-pp.iomap_write_actor": 1.11,
  "perf-profile.func.cycles-pp.xfs_iomap_eof_want_preallocate.constprop.8":=
 1.07,
  "perf-profile.func.cycles-pp._raw_spin_lock": 1.0,
  "perf-profile.func.cycles-pp.vfs_write": 0.94,
  "perf-profile.func.cycles-pp.pagecache_get_page": 0.92,
  "perf-profile.func.cycles-pp.xfs_bmapi_delay": 0.92,
  "perf-profile.func.cycles-pp.xfs_file_iomap_begin": 0.91,
  "perf-profile.func.cycles-pp.xfs_file_write_iter": 0.9,
  "perf-profile.func.cycles-pp.workingset_activation": 0.82,
  "perf-profile.func.cycles-pp.iomap_apply": 0.77,
  "perf-profile.func.cycles-pp.xfs_bmapi_trim_map.isra.14": 0.75,
  "perf-profile.func.cycles-pp.xfs_file_buffered_aio_write": 0.74,
  "perf-profile.func.cycles-pp.mem_cgroup_zone_lruvec": 0.73,
  "perf-profile.func.cycles-pp.native_queued_spin_lock_slowpath": 0.73,
  "perf-profile.func.cycles-pp.get_page_from_freelist": 0.72,
  "perf-profile.func.cycles-pp.generic_write_end": 0.71,
  "perf-profile.func.cycles-pp.__vfs_write": 0.66,
  "perf-profile.func.cycles-pp.rwsem_spin_on_owner": 0.66,
  "perf-profile.func.cycles-pp.iov_iter_copy_from_user_atomic": 0.66,
  "perf-profile.func.cycles-pp.release_pages": 0.65,
  "perf-profile.func.cycles-pp.find_get_entry": 0.65,

Thanks,
Xiaolong

--===============3251204819840604234==--

