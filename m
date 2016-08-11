Content-Type: multipart/mixed; boundary="===============0463482144619493627=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 10:51:45 -0700
Message-ID: <874m6ryz0u.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <CA+55aFyVqdk0p6pmEx_gOs_AiH0TJ23ZEUDZHc9kiFbqEk8UOw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0463482144619493627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Thu, Aug 11, 2016 at 8:57 AM, Christoph Hellwig <hch@lst.de> wrote:
>>
>> The one liner below (not tested yet) to simply remove it should fix that
>> up.  I also noticed we have a spurious pagefault_disable/enable, I
>> need to dig into the history of that first, though.
>
> Hopefully the pagefault_disable/enable doesn't matter for this case.
>
> Can we get this one-liner tested with the kernel robot for comparison?
> I really think a messed-up LRU list could cause bad IO patterns, and
> end up keeping dirty pages around that should be streaming out to disk
> and re-used, so causing memory pressure etc for no good reason.
>
> I think the mapping->tree_lock issue that Dave sees is interesting
> too, but the kswapd activity (and the extra locking it causes) could
> also be a symptom of the same thing - memory pressure due to just
> putting pages in the active file that simply shouldn't be there.
>
> So the trivial oneliner _might_ just explain things. It would be
> really nice if the regression turns out to be due to something so
> easily fixed.
>

Here is the test result for the debug patch.  It appears that the aim7
score is a little better, but the regression is not recovered.

commit 5c70fdfdf82723e47ac180e36a7638ca06ea19d8
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Aug 11 17:57:21 2016 +0200

    dbg fix 68a9f5e700: aim7.jobs-per-min -13.6% regression
    =

    On Wed, Aug 10, 2016 at 06:00:24PM -0700, Linus Torvalds wrote:
    > The biggest difference is that we have "mark_page_accessed()" show up
    > after, and not before. There was also a lot of LRU noise in the
    > non-profile data. I wonder if that is the reason here: the old model
    > of using generic_perform_write/block_page_mkwrite didn't mark the
    > pages accessed, and now with iomap_file_buffered_write() they get
    > marked as active and that screws up the LRU list, and makes us not
    > flush out the dirty pages well (because they are seen as active and
    > not good for writeback), and then you get bad memory use.
    =

    And that's actually a "bug" in the new code - mostly because I failed
    to pick up changes to the core code happening after we 'forked' it,
    in this case commit 2457ae ("mm: non-atomically mark page accessed duri=
ng page
    cache allocation where possible").
    =

    The one liner below (not tested yet) to simply remove it should fix that
    up.  I also noticed we have a spurious pagefault_disable/enable, I
    need to dig into the history of that first, though.

diff --git a/fs/iomap.c b/fs/iomap.c
index 48141b8..f39c318 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -199,7 +199,6 @@ again:
 		pagefault_enable();
 =

 		flush_dcache_page(page);
-		mark_page_accessed(page);
 =

 		status =3D iomap_write_end(inode, pos, bytes, copied, page);
 		if (unlikely(status < 0))


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testc=
ase:
  gcc-6/performance/1BRD_48G/xfs/x86_64-rhel/3000/debian-x86_64-2015-02-07.=
cgz/ivb44/disk_wrt/aim7

commit: =

  f0c6bcba74ac51cb77aadb33ad35cb2dc1ad1506
  68a9f5e7007c1afa2cf6830b690a90d0187c0684
  5c70fdfdf82723e47ac180e36a7638ca06ea19d8

f0c6bcba74ac51cb 68a9f5e7007c1afa2cf6830b69 5c70fdfdf82723e47ac180e36a =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    486586 =C2=B1  0%     -13.6%     420523 =C2=B1  0%     -11.2%     43216=
5 =C2=B1  0%  aim7.jobs-per-min
     37.23 =C2=B1  0%     +15.5%      43.02 =C2=B1  0%     +12.4%      41.8=
7 =C2=B1  0%  aim7.time.elapsed_time
     37.23 =C2=B1  0%     +15.5%      43.02 =C2=B1  0%     +12.4%      41.8=
7 =C2=B1  0%  aim7.time.elapsed_time.max
      6424 =C2=B1  1%     +31.3%       8437 =C2=B1  1%     +24.4%       799=
2 =C2=B1  3%  aim7.time.involuntary_context_switches
      2489 =C2=B1  3%      -2.5%       2425 =C2=B1  1%      -1.0%       246=
5 =C2=B1  3%  aim7.time.maximum_resident_set_size
    151288 =C2=B1  0%      +3.0%     155764 =C2=B1  0%      +2.0%     15425=
2 =C2=B1  1%  aim7.time.minor_page_faults
    376.31 =C2=B1  0%     +28.4%     483.23 =C2=B1  0%     +22.5%     460.9=
6 =C2=B1  1%  aim7.time.system_time
    429058 =C2=B1  0%     -20.1%     343013 =C2=B1  0%     -16.7%     35723=
1 =C2=B1  0%  aim7.time.voluntary_context_switches
     16014 =C2=B1  0%     +28.3%      20545 =C2=B1  1%      -4.0%      1536=
9 =C2=B1  0%  meminfo.Active(file)
    127154 =C2=B1  9%     -15.5%     107424 =C2=B1 10%      -4.4%     12150=
5 =C2=B1 11%  softirqs.SCHED
     24561 =C2=B1  0%     -27.1%      17895 =C2=B1  1%     -22.5%      1903=
3 =C2=B1  1%  vmstat.system.cs
     47289 =C2=B1  0%      +1.4%      47938 =C2=B1  0%      +1.1%      4780=
7 =C2=B1  0%  vmstat.system.in
      4003 =C2=B1  0%     +27.8%       5117 =C2=B1  1%      -4.0%       384=
2 =C2=B1  0%  proc-vmstat.nr_active_file
    979.25 =C2=B1  0%     +59.1%       1558 =C2=B1  5%     -11.8%     864.0=
0 =C2=B1  1%  proc-vmstat.pgactivate
      4699 =C2=B1  3%    +132.6%      10932 =C2=B1 78%     +77.1%       832=
1 =C2=B1 36%  proc-vmstat.pgpgout
      7868 =C2=B1  1%     +28.9%      10140 =C2=B1  6%      -1.8%       772=
4 =C2=B1  1%  numa-meminfo.node0.Active(file)
    161402 =C2=B1  1%     -21.0%     127504 =C2=B1 25%      -1.7%     15870=
8 =C2=B1  5%  numa-meminfo.node0.Slab
      8148 =C2=B1  1%     +27.8%      10416 =C2=B1  7%      -6.1%       764=
8 =C2=B1  1%  numa-meminfo.node1.Active(file)
     81041 =C2=B1  3%     +43.8%     116540 =C2=B1 27%      +5.7%      8563=
1 =C2=B1  8%  numa-meminfo.node1.Slab
     13903 =C2=B1 18%     +22.8%      17076 =C2=B1  9%     -27.8%      1003=
9 =C2=B1 12%  numa-numastat.node0.numa_foreign
     12525 =C2=B1 20%     +27.1%      15922 =C2=B1  9%     -26.8%       917=
0 =C2=B1 17%  numa-numastat.node0.numa_miss
     14084 =C2=B1 18%     -35.4%       9102 =C2=B1 17%     +16.5%      1640=
1 =C2=B1  8%  numa-numastat.node1.numa_foreign
     15461 =C2=B1 17%     -33.7%      10257 =C2=B1 14%     +11.7%      1727=
0 =C2=B1  9%  numa-numastat.node1.numa_miss
      1966 =C2=B1  1%     +30.4%       2565 =C2=B1  4%      -1.8%       193=
0 =C2=B1  1%  numa-vmstat.node0.nr_active_file
      4204 =C2=B1  3%     +17.7%       4947 =C2=B1  7%      +6.1%       446=
1 =C2=B1  6%  numa-vmstat.node0.nr_alloc_batch
    521.75 =C2=B1  4%      +5.4%     549.80 =C2=B1  4%     -12.0%     459.0=
0 =C2=B1 12%  numa-vmstat.node0.nr_dirty
      2037 =C2=B1  1%     +24.9%       2543 =C2=B1  5%      -6.1%       191=
2 =C2=B1  1%  numa-vmstat.node1.nr_active_file
     24.26 =C2=B1  0%      +8.7%      26.36 =C2=B1  0%      +7.1%      25.9=
9 =C2=B1  0%  turbostat.%Busy
    686.75 =C2=B1  0%      +9.2%     749.80 =C2=B1  0%      +6.5%     731.6=
7 =C2=B1  0%  turbostat.Avg_MHz
      0.29 =C2=B1  1%     -24.9%       0.22 =C2=B1  2%     -18.8%       0.2=
3 =C2=B1  2%  turbostat.CPU%c3
     91.39 =C2=B1  2%      +3.5%      94.60 =C2=B1  0%      +4.4%      95.4=
5 =C2=B1  1%  turbostat.CorWatt
    121.88 =C2=B1  1%      +2.6%     124.99 =C2=B1  0%      +3.9%     126.5=
7 =C2=B1  1%  turbostat.PkgWatt
     37.23 =C2=B1  0%     +15.5%      43.02 =C2=B1  0%     +12.4%      41.8=
7 =C2=B1  0%  time.elapsed_time
     37.23 =C2=B1  0%     +15.5%      43.02 =C2=B1  0%     +12.4%      41.8=
7 =C2=B1  0%  time.elapsed_time.max
      6424 =C2=B1  1%     +31.3%       8437 =C2=B1  1%     +24.4%       799=
2 =C2=B1  3%  time.involuntary_context_switches
      1038 =C2=B1  0%     +10.5%       1148 =C2=B1  0%      +8.4%       112=
6 =C2=B1  0%  time.percent_of_cpu_this_job_got
    376.31 =C2=B1  0%     +28.4%     483.23 =C2=B1  0%     +22.5%     460.9=
6 =C2=B1  1%  time.system_time
    429058 =C2=B1  0%     -20.1%     343013 =C2=B1  0%     -16.7%     35723=
1 =C2=B1  0%  time.voluntary_context_switches
  53643508 =C2=B1  0%     -19.5%   43181295 =C2=B1  2%     -16.4%   4482251=
8 =C2=B1  0%  cpuidle.C1-IVT.time
    318952 =C2=B1  0%     -25.7%     236993 =C2=B1  0%     -21.3%     25108=
4 =C2=B1  0%  cpuidle.C1-IVT.usage
   3471235 =C2=B1  2%     -18.1%    2843694 =C2=B1  3%     -12.9%    302277=
0 =C2=B1  1%  cpuidle.C1E-IVT.time
     46642 =C2=B1  1%     -22.5%      36144 =C2=B1  0%     -17.4%      3854=
5 =C2=B1  0%  cpuidle.C1E-IVT.usage
  12601665 =C2=B1  1%     -21.9%    9837996 =C2=B1  1%     -18.9%   1021844=
4 =C2=B1  0%  cpuidle.C3-IVT.time
     79872 =C2=B1  1%     -19.7%      64163 =C2=B1  0%     -16.8%      6647=
7 =C2=B1  0%  cpuidle.C3-IVT.usage
 1.292e+09 =C2=B1  0%     +13.7%  1.469e+09 =C2=B1  0%     +10.9%  1.434e+0=
9 =C2=B1  0%  cpuidle.C6-IVT.time
      5131 =C2=B1121%     -98.5%      75.60 =C2=B1200%     -93.3%     344.3=
3 =C2=B1 98%  latency_stats.avg.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      2966 =C2=B1 80%     -27.5%       2151 =C2=B1 16%    +359.2%      1362=
4 =C2=B1 77%  latency_stats.max.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get=
_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_d=
roplink.xfs_remove.xfs_vn_unlink.vfs_unlink
      5131 =C2=B1121%     -98.5%      75.60 =C2=B1200%     -93.3%     344.3=
3 =C2=B1 98%  latency_stats.max.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      9739 =C2=B1 99%     -99.0%      95.40 =C2=B1  9%     -99.1%      91.3=
3 =C2=B1  5%  latency_stats.max.submit_bio_wait.blkdev_issue_flush.ext4_syn=
c_fs.sync_fs_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
      7739 =C2=B1 81%     -71.5%       2202 =C2=B1 46%     -77.4%       175=
2 =C2=B1 23%  latency_stats.max.wait_on_page_bit.__filemap_fdatawait_range.=
filemap_fdatawait_keep_errors.sync_inodes_sb.sync_inodes_one_sb.iterate_sup=
ers.sys_sync.entry_SYSCALL_64_fastpath
      5131 =C2=B1121%     -98.5%      75.60 =C2=B1200%     -93.3%     344.3=
3 =C2=B1 98%  latency_stats.sum.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     10459 =C2=B1 97%     -97.5%     263.80 =C2=B1  5%     -97.6%     254.6=
7 =C2=B1  1%  latency_stats.sum.submit_bio_wait.blkdev_issue_flush.ext4_syn=
c_fs.sync_fs_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
      9097 =C2=B1 81%     -70.2%       2708 =C2=B1 40%     -74.3%       233=
5 =C2=B1 21%  latency_stats.sum.wait_on_page_bit.__filemap_fdatawait_range.=
filemap_fdatawait_keep_errors.sync_inodes_sb.sync_inodes_one_sb.iterate_sup=
ers.sys_sync.entry_SYSCALL_64_fastpath
    229.50 =C2=B1 11%      -6.7%     214.20 =C2=B1 46%     -77.8%      51.0=
0 =C2=B1  0%  slabinfo.dio.active_objs
    229.50 =C2=B1 11%      -6.7%     214.20 =C2=B1 46%     -77.8%      51.0=
0 =C2=B1  0%  slabinfo.dio.num_objs
    369.75 =C2=B1 17%      -6.2%     346.80 =C2=B1 11%     -21.8%     289.0=
0 =C2=B1 16%  slabinfo.kmem_cache.active_objs
    369.75 =C2=B1 17%      -6.2%     346.80 =C2=B1 11%     -21.8%     289.0=
0 =C2=B1 16%  slabinfo.kmem_cache.num_objs
      1022 =C2=B1  5%      -2.9%     992.80 =C2=B1 11%     -11.9%     900.3=
3 =C2=B1  3%  slabinfo.nsproxy.active_objs
      1022 =C2=B1  5%      -2.9%     992.80 =C2=B1 11%     -11.9%     900.3=
3 =C2=B1  3%  slabinfo.nsproxy.num_objs
      1836 =C2=B1 10%     +60.6%       2949 =C2=B1  9%     +45.1%       266=
5 =C2=B1  6%  slabinfo.scsi_data_buffer.active_objs
      1836 =C2=B1 10%     +60.6%       2949 =C2=B1  9%     +45.1%       266=
5 =C2=B1  6%  slabinfo.scsi_data_buffer.num_objs
    431.75 =C2=B1 10%     +60.7%     693.80 =C2=B1  9%     +45.1%     626.6=
7 =C2=B1  6%  slabinfo.xfs_efd_item.active_objs
    431.75 =C2=B1 10%     +60.7%     693.80 =C2=B1  9%     +45.1%     626.6=
7 =C2=B1  6%  slabinfo.xfs_efd_item.num_objs
  2.59e+11 =C2=B1  6%     +22.4%  3.169e+11 =C2=B1  5%     +22.9%  3.182e+1=
1 =C2=B1  7%  perf-stat.branch-instructions
      0.41 =C2=B1  2%      -9.2%       0.38 =C2=B1  1%     -25.5%       0.3=
1 =C2=B1  3%  perf-stat.branch-miss-rate
 1.072e+09 =C2=B1  4%     +11.3%  1.193e+09 =C2=B1  3%      -8.5%  9.812e+0=
8 =C2=B1  4%  perf-stat.branch-misses
    972882 =C2=B1  0%     -17.4%     803235 =C2=B1  0%     -14.3%     83375=
3 =C2=B1  0%  perf-stat.context-switches
 1.472e+12 =C2=B1  6%     +20.5%  1.774e+12 =C2=B1  5%     +16.7%  1.717e+1=
2 =C2=B1  7%  perf-stat.cpu-cycles
    100350 =C2=B1  1%      -5.2%      95091 =C2=B1  1%      -3.8%      9655=
3 =C2=B1  0%  perf-stat.cpu-migrations
 7.315e+08 =C2=B1 24%     +54.9%  1.133e+09 =C2=B1 35%    +107.1%  1.515e+0=
9 =C2=B1 64%  perf-stat.dTLB-load-misses
 3.225e+11 =C2=B1  5%     +38.1%  4.454e+11 =C2=B1  3%     +32.2%  4.263e+1=
1 =C2=B1  6%  perf-stat.dTLB-loads
 2.176e+11 =C2=B1  9%     +45.2%   3.16e+11 =C2=B1  5%     +50.1%  3.267e+1=
1 =C2=B1  7%  perf-stat.dTLB-stores
 1.452e+12 =C2=B1  6%     +27.7%  1.853e+12 =C2=B1  5%     +28.0%  1.858e+1=
2 =C2=B1  7%  perf-stat.instructions
     42168 =C2=B1 16%     +24.9%      52676 =C2=B1  7%     +33.4%      5623=
4 =C2=B1  6%  perf-stat.instructions-per-iTLB-miss
      0.99 =C2=B1  0%      +5.9%       1.05 =C2=B1  0%      +9.6%       1.0=
8 =C2=B1  0%  perf-stat.ipc
    252401 =C2=B1  0%      +6.7%     269219 =C2=B1  0%      +5.2%     26552=
4 =C2=B1  0%  perf-stat.minor-faults
     10.16 =C2=B1  3%     +14.5%      11.63 =C2=B1  4%     +12.3%      11.4=
1 =C2=B1  3%  perf-stat.node-store-miss-rate
  24842185 =C2=B1  2%     +11.0%   27573897 =C2=B1  2%      +7.6%   2672027=
1 =C2=B1  3%  perf-stat.node-store-misses
 2.198e+08 =C2=B1  2%      -4.5%    2.1e+08 =C2=B1  5%      -5.6%  2.076e+0=
8 =C2=B1  2%  perf-stat.node-stores
    252321 =C2=B1  0%      +6.6%     269092 =C2=B1  0%      +5.2%     26541=
5 =C2=B1  0%  perf-stat.page-faults
      4.08 =C2=B1 64%     +63.1%       6.65 =C2=B1 77%    +609.5%      28.9=
3 =C2=B1 92%  sched_debug.cfs_rq:/.MIN_vruntime.avg
    157.17 =C2=B1 61%     +30.0%     204.25 =C2=B1 47%    +686.9%       123=
6 =C2=B1112%  sched_debug.cfs_rq:/.MIN_vruntime.max
      4.08 =C2=B1 64%     +63.1%       6.65 =C2=B1 77%    +609.5%      28.9=
3 =C2=B1 92%  sched_debug.cfs_rq:/.max_vruntime.avg
    157.17 =C2=B1 61%     +30.0%     204.25 =C2=B1 47%    +686.9%       123=
6 =C2=B1112%  sched_debug.cfs_rq:/.max_vruntime.max
    191.00 =C2=B1 35%     -23.4%     146.40 =C2=B1 15%     -28.4%     136.6=
7 =C2=B1  5%  sched_debug.cfs_rq:/.runnable_load_avg.max
     44.43 =C2=B1 16%     -20.2%      35.47 =C2=B1  9%     -25.2%      33.2=
5 =C2=B1  1%  sched_debug.cfs_rq:/.runnable_load_avg.stddev
     50.23 =C2=B1 19%     -27.1%      36.61 =C2=B1 15%     -30.3%      35.0=
3 =C2=B1 15%  sched_debug.cpu.cpu_load[1].avg
    466.50 =C2=B1 29%     -55.6%     207.20 =C2=B1 73%     -47.5%     245.0=
0 =C2=B1 67%  sched_debug.cpu.cpu_load[1].max
     77.78 =C2=B1 33%     -52.4%      37.05 =C2=B1 53%     -48.8%      39.8=
6 =C2=B1 51%  sched_debug.cpu.cpu_load[1].stddev
     38.82 =C2=B1 19%     -24.2%      29.42 =C2=B1 15%     -29.6%      27.3=
1 =C2=B1 10%  sched_debug.cpu.cpu_load[2].avg
    300.50 =C2=B1 33%     -55.1%     135.00 =C2=B1 46%     -50.2%     149.6=
7 =C2=B1 46%  sched_debug.cpu.cpu_load[2].max
     51.71 =C2=B1 41%     -49.3%      26.20 =C2=B1 46%     -50.9%      25.3=
9 =C2=B1 33%  sched_debug.cpu.cpu_load[2].stddev
     27.08 =C2=B1 19%     -22.4%      21.02 =C2=B1 15%     -27.8%      19.5=
6 =C2=B1 11%  sched_debug.cpu.cpu_load[3].avg
    185.00 =C2=B1 43%     -49.6%      93.20 =C2=B1 44%     -48.3%      95.6=
7 =C2=B1 30%  sched_debug.cpu.cpu_load[3].max
     32.91 =C2=B1 50%     -46.1%      17.75 =C2=B1 45%     -49.8%      16.5=
1 =C2=B1 25%  sched_debug.cpu.cpu_load[3].stddev
     17.78 =C2=B1 20%     -20.9%      14.06 =C2=B1 13%     -25.3%      13.2=
8 =C2=B1 13%  sched_debug.cpu.cpu_load[4].avg
     20.29 =C2=B1 55%     -44.5%      11.26 =C2=B1 39%     -47.7%      10.6=
1 =C2=B1 27%  sched_debug.cpu.cpu_load[4].stddev
      4929 =C2=B1 18%     -24.8%       3704 =C2=B1 23%      -4.5%       470=
8 =C2=B1 21%  sched_debug.cpu.nr_load_updates.avg
    276.50 =C2=B1 10%      -4.4%     264.20 =C2=B1  7%     -14.3%     237.0=
0 =C2=B1 19%  sched_debug.cpu.nr_switches.min

Best Regards,
Huang, Ying

--===============0463482144619493627==--

