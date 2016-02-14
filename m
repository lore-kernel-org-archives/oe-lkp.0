Content-Type: multipart/mixed; boundary="===============7867082241989455380=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 974b5afbf1: +187.0% fsmark.time.voluntary_context_switches
Date: Sun, 14 Feb 2016 15:30:37 +0800
Message-ID: <87lh6nn3z6.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7867082241989455380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs dev-test
commit 974b5afbf16ecd3e01cefd5d52e3090b6d967693 ("f2fs: use writepages->loc=
k for WB_SYNC_ALL")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_di=
rectory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/16MB/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-0=
2-07.cgz/fsyncBeforeClose/nhm4/60G/fsmark

commit: =

  ac247fd0403387a3f264b86b41cdc71543e66400
  974b5afbf16ecd3e01cefd5d52e3090b6d967693

ac247fd0403387a3 974b5afbf16ecd3e01cefd5d52 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     40098 =C2=B1  2%     +25.7%      50389 =C2=B1  3%  fsmark.time.involun=
tary_context_switches
     19.30 =C2=B1  2%     +18.1%      22.80 =C2=B1  1%  fsmark.time.percent=
_of_cpu_this_job_got
     97.36 =C2=B1  1%     +18.1%     115.00 =C2=B1  1%  fsmark.time.system_=
time
    804635 =C2=B1  1%    +187.0%    2309592 =C2=B1  5%  fsmark.time.volunta=
ry_context_switches
      1904 =C2=B1  1%     -18.8%       1546 =C2=B1  3%  uptime.idle
     38568 =C2=B1  2%     +19.0%      45897 =C2=B1  3%  softirqs.RCU
     45610 =C2=B1  1%     +26.9%      57875 =C2=B1  1%  softirqs.SCHED
     78751 =C2=B1  1%     +39.3%     109673 =C2=B1  0%  softirqs.TIMER
     65587 =C2=B1  0%     +76.5%     115770 =C2=B1  0%  vmstat.memory.free
      4605 =C2=B1  1%    +159.8%      11962 =C2=B1  3%  vmstat.system.cs
    564.10 =C2=B1  1%     +75.7%     991.10 =C2=B1  0%  vmstat.system.in
     65578 =C2=B1  0%     +76.3%     115584 =C2=B1  0%  meminfo.MemFree
     69193 =C2=B1  0%     +46.4%     101331 =C2=B1  2%  meminfo.SReclaimable
     79277 =C2=B1  0%     +53.9%     121991 =C2=B1  0%  meminfo.SUnreclaim
    148470 =C2=B1  0%     +50.4%     223322 =C2=B1  1%  meminfo.Slab
      1066 =C2=B1  2%     +45.8%       1554 =C2=B1  1%  time.file_system_in=
puts
     40098 =C2=B1  2%     +25.7%      50389 =C2=B1  3%  time.involuntary_co=
ntext_switches
     19.30 =C2=B1  2%     +18.1%      22.80 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
     97.36 =C2=B1  1%     +18.1%     115.00 =C2=B1  1%  time.system_time
    804635 =C2=B1  1%    +187.0%    2309592 =C2=B1  5%  time.voluntary_cont=
ext_switches
      4.80 =C2=B1  3%    +240.9%      16.37 =C2=B1  3%  turbostat.%Busy
    150.30 =C2=B1  3%    +259.0%     539.60 =C2=B1  3%  turbostat.Avg_MHz
     10.10 =C2=B1  2%     +69.4%      17.11 =C2=B1  2%  turbostat.CPU%c1
     24.51 =C2=B1  2%     +12.3%      27.54 =C2=B1  2%  turbostat.CPU%c3
     60.59 =C2=B1  0%     -35.7%      38.99 =C2=B1  2%  turbostat.CPU%c6
     56.00 =C2=B1  1%     +12.9%      63.20 =C2=B1  1%  turbostat.CoreTmp
 1.042e+08 =C2=B1  3%     -32.6%   70243667 =C2=B1  5%  cpuidle.C1E-NHM.time
  5.49e+08 =C2=B1  2%     +23.1%   6.76e+08 =C2=B1  2%  cpuidle.C3-NHM.time
    155243 =C2=B1  2%     +22.3%     189817 =C2=B1  3%  cpuidle.C3-NHM.usage
 3.052e+09 =C2=B1  0%     -17.6%  2.515e+09 =C2=B1  1%  cpuidle.C6-NHM.time
    132307 =C2=B1  2%     +20.6%     159621 =C2=B1  2%  cpuidle.C6-NHM.usage
  64832253 =C2=B1  9%    +626.5%   4.71e+08 =C2=B1  4%  cpuidle.POLL.time
     95963 =C2=B1  2%    +987.2%    1043299 =C2=B1  8%  cpuidle.POLL.usage
    582.20 =C2=B1  0%    +1e+05%     583505 =C2=B1  7%  slabinfo.f2fs_exten=
t_node.active_objs
      7.20 =C2=B1  5%  +1.1e+05%       7994 =C2=B1  7%  slabinfo.f2fs_exten=
t_node.active_slabs
    582.20 =C2=B1  0%    +1e+05%     583664 =C2=B1  7%  slabinfo.f2fs_exten=
t_node.num_objs
      7.20 =C2=B1  5%  +1.1e+05%       7994 =C2=B1  7%  slabinfo.f2fs_exten=
t_node.num_slabs
     10171 =C2=B1  6%     +22.6%      12471 =C2=B1 10%  slabinfo.free_nid.a=
ctive_objs
     10194 =C2=B1  6%     +23.4%      12580 =C2=B1  9%  slabinfo.free_nid.n=
um_objs
      1834 =C2=B1  1%    +543.2%      11798 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
     78.70 =C2=B1  6%    +406.9%     398.90 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_slabs
      2524 =C2=B1  6%    +403.5%      12710 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
     78.70 =C2=B1  6%    +406.9%     398.90 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_slabs
    355.80 =C2=B1  0%   +2796.0%      10303 =C2=B1  1%  slabinfo.kmalloc-40=
96.active_objs
     55.00 =C2=B1  1%   +8795.8%       4892 =C2=B1  3%  slabinfo.kmalloc-40=
96.active_slabs
    378.60 =C2=B1  0%   +2639.0%      10369 =C2=B1  1%  slabinfo.kmalloc-40=
96.num_objs
     55.00 =C2=B1  1%   +8795.8%       4892 =C2=B1  3%  slabinfo.kmalloc-40=
96.num_slabs
      2929 =C2=B1 11%   +1926.0%      59360 =C2=B1  5%  proc-vmstat.allocst=
all
    160.70 =C2=B1 28%    +461.8%     902.80 =C2=B1 39%  proc-vmstat.compact=
_isolated
    116.60 =C2=B1 21%   +1575.8%       1954 =C2=B1124%  proc-vmstat.compact=
_migrate_scanned
      1657 =C2=B1 10%  +10214.9%     170917 =C2=B1 14%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
     14489 =C2=B1  3%    +974.7%     155724 =C2=B1 12%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     16393 =C2=B1  0%     +76.3%      28901 =C2=B1  0%  proc-vmstat.nr_free=
_pages
     17297 =C2=B1  0%     +46.4%      25331 =C2=B1  2%  proc-vmstat.nr_slab=
_reclaimable
     19818 =C2=B1  0%     +53.9%      30499 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
  16253363 =C2=B1  0%     +21.1%   19685684 =C2=B1  0%  proc-vmstat.numa_hit
  16253363 =C2=B1  0%     +21.1%   19685684 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     16974 =C2=B1  2%   +1830.1%     327619 =C2=B1 13%  proc-vmstat.pageout=
run
  16298906 =C2=B1  0%     +44.0%   23466530 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  15711596 =C2=B1  0%     +45.8%   22903686 =C2=B1  0%  proc-vmstat.pgfree
    480139 =C2=B1  8%   +1593.6%    8131796 =C2=B1  5%  proc-vmstat.pgscan_=
direct_dma32
  14970914 =C2=B1  0%     -51.0%    7341759 =C2=B1  5%  proc-vmstat.pgscan_=
kswapd_dma32
    396381 =C2=B1 11%   +1928.7%    8041357 =C2=B1  5%  proc-vmstat.pgsteal=
_direct_dma32
  14805624 =C2=B1  0%     -51.4%    7188819 =C2=B1  5%  proc-vmstat.pgsteal=
_kswapd_dma32
    207014 =C2=B1  0%   +6368.5%   13390822 =C2=B1  1%  proc-vmstat.slabs_s=
canned
      0.00 =C2=B1 -1%      +Inf%      19563 =C2=B1 50%  latency_stats.avg.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_data_page.[f2fs].do_wr=
ite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2=
fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__fi=
lemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      31033 =C2=B1 94%  latency_stats.avg.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_node_page.[f2fs].f2fs_=
write_node_page.[f2fs].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsy=
nc_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     43514 =C2=B1179%     -24.3%      32919 =C2=B1 42%  latency_stats.avg.c=
all_rwsem_down_write_failed.block_operations.[f2fs].write_checkpoint.[f2fs]=
.f2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsy=
nc.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      39044 =C2=B1 40%  latency_stats.avg.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].f2fs_write_data_p=
ages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wait=
_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCA=
LL_64_fastpath
   9117306 =C2=B1127%     -99.9%      10078 =C2=B1263%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     33.75 =C2=B1173%  +1.9e+05%      62857 =C2=B1114%  latency_stats.avg.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      78722 =C2=B1 14%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_kmem_pages_node.copy_process._do_fork.SyS_clone
      0.00 =C2=B1 -1%      +Inf%      73283 =C2=B1  1%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin
      0.00 =C2=B1 -1%      +Inf%      84609 =C2=B1 12%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_meta_pag=
e.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      75164 =C2=B1 12%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.new_node_page=
.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      85332 =C2=B1  1%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.new_slab.___slab_alloc.__slab_alloc
      0.00 =C2=B1 -1%      +Inf%      65254 =C2=B1 66%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault
      0.00 =C2=B1 -1%      +Inf%      75091 =C2=B1 35%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_vma.handle_mm_fault.__do_page_fault.do_page_fault
      0.00 =C2=B1 -1%      +Inf%      64635 =C2=B1 50%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_vma.wp_page_copy.do_wp_page.handle_mm_fault
     57408 =C2=B1  1%     -93.3%       3824 =C2=B1 10%  latency_stats.avg.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsyn=
c.entry_SYSCALL_64_fastpath
     49060 =C2=B1  2%   +1508.8%     789275 =C2=B1 10%  latency_stats.hits.=
wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_=
write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsy=
nc.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     129504 =C2=B1 33%  latency_stats.max.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_data_page.[f2fs].do_wr=
ite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2=
fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__fi=
lemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      38782 =C2=B1 81%  latency_stats.max.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_node_page.[f2fs].f2fs_=
write_node_page.[f2fs].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsy=
nc_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      86260 =C2=B1 46%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].f2fs_write_data_p=
ages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wait=
_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCA=
LL_64_fastpath
     13770 =C2=B1 38%   +2493.6%     357160 =C2=B1 18%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_data_page.[f2fs].do_write_data_page.[f2fs].f2fs_write_data_page.[f=
2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_=
pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wai=
t_range
     71537 =C2=B1135%     -90.4%       6880 =C2=B1 17%  latency_stats.max.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].get_d=
node_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_wr=
ite_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fi=
le_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
  15813502 =C2=B1166%     -99.9%      10078 =C2=B1263%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     33.75 =C2=B1173%  +2.2e+05%      73000 =C2=B1113%  latency_stats.max.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      97634 =C2=B1  0%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_kmem_pages_node.copy_process._do_fork.SyS_clone
      0.00 =C2=B1 -1%      +Inf%      99094 =C2=B1  0%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin
      0.00 =C2=B1 -1%      +Inf%      97469 =C2=B1  0%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_meta_pag=
e.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      95084 =C2=B1  5%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.new_node_page=
.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      98808 =C2=B1  0%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.new_slab.___slab_alloc.__slab_alloc
      0.00 =C2=B1 -1%      +Inf%      66744 =C2=B1 65%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault
      0.00 =C2=B1 -1%      +Inf%      87727 =C2=B1 33%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_vma.handle_mm_fault.__do_page_fault.do_page_fault
      0.00 =C2=B1 -1%      +Inf%      69586 =C2=B1 50%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_vma.wp_page_copy.do_wp_page.handle_mm_fault
  20738812 =C2=B1 27%     -87.5%    2591032 =C2=B1122%  latency_stats.sum.a=
lloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get=
_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write.=
vfs_write.SyS_write
      0.00 =C2=B1 -1%      +Inf%     423935 =C2=B1 53%  latency_stats.sum.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_data_page.[f2fs].do_wr=
ite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2=
fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__fi=
lemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      51307 =C2=B1 98%  latency_stats.sum.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_node_page.[f2fs].f2fs_=
write_node_page.[f2fs].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsy=
nc_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
 1.391e+08 =C2=B1 38%    +329.4%  5.974e+08 =C2=B1 19%  latency_stats.sum.b=
alance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     188844 =C2=B1 44%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].f2fs_write_data_p=
ages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wait=
_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCA=
LL_64_fastpath
     13770 =C2=B1 38%  +4.1e+05%   56903822 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_data_page.[f2fs].do_write_data_page.[f2fs].f2fs_write_data_page.[f=
2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_=
pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wai=
t_range
      0.00 =C2=B1 -1%      +Inf%     190702 =C2=B1103%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].read_node_page.[f2fs].__ge=
t_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].get_read_d=
ata_page.[f2fs].find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.path_openat
  33143824 =C2=B1  9%     -84.9%    5019833 =C2=B1 18%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].sync_node_pages.[f2fs].f2fs_sync_fil=
e.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   2913424 =C2=B1 31%     -71.7%     823962 =C2=B1 30%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_page_mbio.[f2fs].do_write_page.[f2fs].write_node_page.=
[f2fs].f2fs_write_node_page.[f2fs].sync_node_pages.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range
    356283 =C2=B1145%     -54.1%     163527 =C2=B1 96%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.submit_bio_wait.f2=
fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fs=
ync.entry_SYSCALL_64_fastpath
  20099124 =C2=B1162%     -99.9%      10078 =C2=B1263%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     33.75 =C2=B1173%  +2.2e+05%      73005 =C2=B1113%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     615502 =C2=B1 53%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_kmem_pages_node.copy_process._do_fork.SyS_clone
      0.00 =C2=B1 -1%      +Inf%   98280568 =C2=B1 12%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin
      0.00 =C2=B1 -1%      +Inf%     301619 =C2=B1 56%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_meta_pag=
e.[f2fs]
      0.00 =C2=B1 -1%      +Inf%     481793 =C2=B1 63%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.new_node_page=
.[f2fs]
      0.00 =C2=B1 -1%      +Inf%   26057234 =C2=B1  5%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.new_slab.___slab_alloc.__slab_alloc
      0.00 =C2=B1 -1%      +Inf%     101284 =C2=B1 93%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault
      0.00 =C2=B1 -1%      +Inf%     333615 =C2=B1 52%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_vma.handle_mm_fault.__do_page_fault.do_page_fault
      0.00 =C2=B1 -1%      +Inf%     138162 =C2=B1 93%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_vma.wp_page_copy.do_wp_page.handle_mm_fault
     13154 =C2=B1  1%     +23.4%      16233 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.0
      8553 =C2=B1  0%     +54.7%      13230 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.1
      8198 =C2=B1  1%     +51.5%      12425 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.2
      8134 =C2=B1  1%     +51.6%      12333 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.3
      6757 =C2=B1  1%     +23.1%       8318 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.4
      6611 =C2=B1  1%     +28.2%       8477 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.5
      6746 =C2=B1  2%     +23.9%       8357 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.6
      6753 =C2=B1  2%     +24.8%       8425 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.7
      8113 =C2=B1  0%     +35.3%      10975 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.avg
     13154 =C2=B1  1%     +24.5%      16373 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.max
      6542 =C2=B1  1%     +24.7%       8158 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.min
      2058 =C2=B1  4%     +41.6%       2913 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     72862 =C2=B1  1%     +11.4%      81181 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.5
      5374 =C2=B1  3%     -28.0%       3867 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
    -15402 =C2=B1 -7%     -52.8%      -7264 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.4
    -16718 =C2=B1 -6%     -61.4%      -6457 =C2=B1-62%  sched_debug.cfs_rq:=
/.spread0.5
    -15098 =C2=B1 -7%     -63.1%      -5565 =C2=B1-67%  sched_debug.cfs_rq:=
/.spread0.7
    -11694 =C2=B1 -4%     -50.9%      -5743 =C2=B1-55%  sched_debug.cfs_rq:=
/.spread0.avg
    -17636 =C2=B1 -4%     -34.4%     -11575 =C2=B1-32%  sched_debug.cfs_rq:=
/.spread0.min
      5375 =C2=B1  3%     -28.0%       3867 =C2=B1 16%  sched_debug.cfs_rq:=
/.spread0.stddev
    676391 =C2=B1  8%     -47.7%     353495 =C2=B1 32%  sched_debug.cpu.avg=
_idle.min
    108056 =C2=B1 15%     +92.1%     207595 =C2=B1 16%  sched_debug.cpu.avg=
_idle.stddev
     45103 =C2=B1  2%     +21.1%      54620 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.0
     18846 =C2=B1  4%     +70.1%      32053 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.1
     17706 =C2=B1  5%     +52.2%      26944 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.2
     17047 =C2=B1  2%     +56.1%      26602 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.3
     10781 =C2=B1  2%     +25.4%      13521 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.4
     11231 =C2=B1  2%     +25.5%      14091 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.5
     10556 =C2=B1  1%     +26.0%      13300 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.6
     10601 =C2=B1  2%     +27.7%      13541 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.7
     17734 =C2=B1  1%     +37.2%      24335 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.avg
     45103 =C2=B1  2%     +21.2%      54662 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.max
     10419 =C2=B1  1%     +26.4%      13166 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.min
     10889 =C2=B1  3%     +24.3%      13541 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.stddev
    230386 =C2=B1 11%     +42.9%     329109 =C2=B1  8%  sched_debug.cpu.nr_=
switches.0
    202377 =C2=B1  8%    +251.4%     711088 =C2=B1  4%  sched_debug.cpu.nr_=
switches.1
    171137 =C2=B1 19%    +180.6%     480135 =C2=B1  8%  sched_debug.cpu.nr_=
switches.2
    203086 =C2=B1 18%    +117.9%     442482 =C2=B1  6%  sched_debug.cpu.nr_=
switches.3
     83980 =C2=B1  6%    +109.3%     175809 =C2=B1 14%  sched_debug.cpu.nr_=
switches.4
     89866 =C2=B1 11%     +75.8%     158005 =C2=B1  7%  sched_debug.cpu.nr_=
switches.5
     83814 =C2=B1 10%     +88.5%     158008 =C2=B1 10%  sched_debug.cpu.nr_=
switches.6
     85831 =C2=B1 14%     +78.4%     153106 =C2=B1 13%  sched_debug.cpu.nr_=
switches.7
    143810 =C2=B1  1%    +126.7%     325968 =C2=B1  3%  sched_debug.cpu.nr_=
switches.avg
    250243 =C2=B1  5%    +184.3%     711514 =C2=B1  4%  sched_debug.cpu.nr_=
switches.max
     76332 =C2=B1  3%     +87.6%     143189 =C2=B1  8%  sched_debug.cpu.nr_=
switches.min
     65017 =C2=B1  6%    +198.8%     194260 =C2=B1  5%  sched_debug.cpu.nr_=
switches.stddev
    203.80 =C2=B1 36%    +113.9%     436.00 =C2=B1  9%  sched_debug.cpu.nr_=
uninterruptible.4
    271442 =C2=B1  9%     +36.5%     370389 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.0
    202559 =C2=B1  8%    +251.6%     712283 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.1
    171330 =C2=B1 19%    +180.8%     481155 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.2
    203293 =C2=B1 18%    +118.1%     443428 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.3
     84236 =C2=B1  6%    +110.5%     177352 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.4
     90110 =C2=B1 11%     +77.1%     159606 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.5
     84044 =C2=B1 10%     +89.9%     159621 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.6
     86056 =C2=B1 14%     +79.6%     154524 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.7
    149134 =C2=B1  1%    +122.8%     332295 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.avg
    277382 =C2=B1  7%    +158.6%     717324 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.max
     76562 =C2=B1  3%     +89.1%     144747 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.min
     73405 =C2=B1  6%    +167.7%     196494 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.stddev
     93022 =C2=B1 14%     +46.7%     136420 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.0
     80762 =C2=B1 10%    +310.6%     331612 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.1
     65323 =C2=B1 24%    +230.1%     215622 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.2
     81365 =C2=B1 22%    +142.9%     197613 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.3
     24975 =C2=B1 10%    +175.0%      68669 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.4
     28091 =C2=B1 18%    +113.2%      59878 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.5
     25071 =C2=B1 17%    +139.1%      59944 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.6
     25926 =C2=B1 22%    +122.1%      57579 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.7
     53067 =C2=B1  1%    +165.5%     140918 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.avg
    103919 =C2=B1  6%    +219.2%     331734 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.max
     21303 =C2=B1  5%    +146.7%      52553 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.min
     30666 =C2=B1  6%    +209.8%      95012 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.stddev
    114436 =C2=B1  5%    +504.9%     692179 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.0
     85402 =C2=B1  9%     +51.2%     129168 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.1
     97257 =C2=B1 16%     +34.8%     131088 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.2
     77150 =C2=B1 10%     +62.7%     125500 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.3
     87047 =C2=B1  1%    +107.1%     180272 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.avg
    125384 =C2=B1  6%    +452.1%     692194 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.max
     57245 =C2=B1  8%     +22.4%      70061 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.min
     22286 =C2=B1 16%    +775.5%     195117 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.stddev
     65970 =C2=B1  1%     +25.1%      82512 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.0
     36267 =C2=B1  2%     +19.0%      43155 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.1
     36396 =C2=B1  3%     +17.8%      42878 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.2
     36182 =C2=B1  3%     +15.9%      41920 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.3
     34843 =C2=B1  0%     +14.8%      39990 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.avg
     65970 =C2=B1  1%     +25.1%      82533 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.max
     12737 =C2=B1  2%     +38.6%      17657 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.stddev


nhm4: Nehalem
Memory: 4G


                              fsmark.time.system_time

  120 ++-------------------------------------------------------------------=
-+
      |                                                  O                 =
 |
  115 ++                                      OOOO O   O  O                =
 |
      |             O              O     OOO        O O    O               =
 |
      |     OO    OO   OO   OO O O   O O     O       O                     =
 |
  110 +OO O   O OO       O    O   O O   O                                  =
 |
      O    O          O    O                                               =
 |
  105 ++                                                                   =
 |
      |     *                                                              =
 |
  100 ++    ::           *.                          *                     =
 |
      |**.*: **.** **. **  * ** .*   *     *    **.** :   **   *     *  *. =
*|
      *    *      *   *     *  *  *** + * * + * :     **  : :.* ***.* **  *=
 *
   95 ++                               * *   * *        +:  *              =
 |
      |                                                  *                 =
 |
   90 ++-------------------------------------------------------------------=
-+


                        fsmark.time.voluntary_context_switches

    3e+06 ++---------------------------------------------------------------=
-+
          |O       O      O                                                =
 |
          |      O   O OO    O       O     O                               =
 |
  2.5e+06 O+O  OO O        OO   O O     O   O    OO       O O              =
 |
          |  O      O         O  O OO O  OO   O     OOO  O O               =
 |
          |              O                   O  O  O    O                  =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          ****.*******.********.*******.*******.*******.********.*******.**=
**
          |                                                                =
 |
   500000 ++---------------------------------------------------------------=
-+


To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============7867082241989455380==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6CiAg
b29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDk3NGI1YWZiZjE2ZWNkM2UwMWNlZmQ1
ZDUyZTMwOTBiNmQ5Njc2OTMKbW9kZWw6IE5laGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwMDNGQllaLTAxMEZCMF9X
RC1XQ0FXMzY4MTIwNDEtcGFydDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9h
dGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MiIKcm9vdGZzX3Bh
cnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdD
QVczNjgxMjA0MS1wYXJ0MyIKbmV0Y29uc29sZV9wb3J0OiA2NjQ5CmNhdGVnb3J5OiBiZW5jaG1h
cmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGYyZnMKZnMy
OiAKZnNtYXJrOgogIGZpbGVzaXplOiAxNk1CCiAgdGVzdF9zaXplOiA2MEcKICBzeW5jX21ldGhv
ZDogZnN5bmNCZWZvcmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJf
ZGlyZWN0b3J5OiAyNTZmcGQKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBuaG00CnRib3hfZ3JvdXA6
IG5obTQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAyLTEwIDE1OjEx
OjE1LjU0MzY4MzYzNSArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6CmlkOiBmNGZhMGIyYjBkNjBmM2NiYzE1MTA4ZTI2YWRlOTc3ZTAx
ZGVkZjBhCnVzZXI6IGxrcApoZWFkX2NvbW1pdDogYzA2YTJhNzcyMmQyZTU1MzY4YWFiZjBjYTFl
ZDQ0MDkyYTU3YTllZApiYXNlX2NvbW1pdDogMzg4ZjdiMWQ2ZThjYTA2NzYyZTI0NTRkMjhkNmMz
YzU1YWQwZmU5NQpicmFuY2g6IGxpbnV4LW5leHQvbWFzdGVyCnJlc3VsdF9yb290OiAiL3Jlc3Vs
dC9mc21hcmsvMXgtMzJ0LTFIREQtZjJmcy0xNk1CLTYwRy1mc3luY0JlZm9yZUNsb3NlLTE2ZC0y
NTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00
LjkvOTc0YjVhZmJmMTZlY2QzZTAxY2VmZDVkNTJlMzA5MGI2ZDk2NzY5My8wIgpqb2JfZmlsZTog
Ii9sa3Avc2NoZWR1bGVkL25obTQvYmlzZWN0X2ZzbWFyay0xeC0zMnQtMUhERC1mMmZzLTE2TUIt
NjBHLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6LXg4Nl82NC1yaGVsLTk3NGI1YWZiZjE2ZWNkM2UwMWNlZmQ1ZDUyZTMwOTBiNmQ5Njc2OTMt
MjAxNjAyMTAtNjk5MTUtd3NjeGJvLTAueWFtbCIKbWF4X3VwdGltZTogMTYzNi44OTk5OTk5OTk5
OTk5CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9s
a3Avc2NoZWR1bGVkL25obTQvYmlzZWN0X2ZzbWFyay0xeC0zMnQtMUhERC1mMmZzLTE2TUItNjBH
LWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
LXg4Nl82NC1yaGVsLTk3NGI1YWZiZjE2ZWNkM2UwMWNlZmQ1ZDUyZTMwOTBiNmQ5Njc2OTMtMjAx
NjAyMTAtNjk5MTUtd3NjeGJvLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQt
cmhlbAotIGJyYW5jaD1saW51eC1uZXh0L21hc3RlcgotIGNvbW1pdD05NzRiNWFmYmYxNmVjZDNl
MDFjZWZkNWQ1MmUzMDkwYjZkOTY3NjkzCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvOTc0YjVhZmJmMTZlY2QzZTAxY2VmZDVkNTJlMzA5MGI2ZDk2NzY5My92bWxp
bnV6LTQuNS4wLXJjMi0wMDI2MS1nOTc0YjVhZgotIG1heF91cHRpbWU9MTYzNgotIFJFU1VMVF9S
T09UPS9yZXN1bHQvZnNtYXJrLzF4LTMydC0xSERELWYyZnMtMTZNQi02MEctZnN5bmNCZWZvcmVD
bG9zZS0xNmQtMjU2ZnBkL25obTQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQt
cmhlbC9nY2MtNC45Lzk3NGI1YWZiZjE2ZWNkM2UwMWNlZmQ1ZDUyZTMwOTBiNmQ5Njc2OTMvMAot
IExLUF9TRVJWRVI9aW5uCi0gfC0KICBsaWJhdGEuZm9yY2U9MS41R2JwcwoKICBlYXJseXByaW50
az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBz
eXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAg
cGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmlj
IGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBj
b25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4
Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45
Lzk3NGI1YWZiZjE2ZWNkM2UwMWNlZmQ1ZDUyZTMwOTBiNmQ5Njc2OTMvbW9kdWxlcy5jZ3oiCmJt
X2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3Au
Y2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25m
aWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0
YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L2ZzMi5jZ3osL2xrcC9iZW5jaG1hcmtzL2ZzbWFyay5jZ3oiCmxpbnV4
X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzk3NGI1YWZi
ZjE2ZWNkM2UwMWNlZmQ1ZDUyZTMwOTBiNmQ5Njc2OTMvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVh
dF90bzogNQprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvOTc0YjVhZmJm
MTZlY2QzZTAxY2VmZDVkNTJlMzA5MGI2ZDk2NzY5My92bWxpbnV6LTQuNS4wLXJjMi0wMDI2MS1n
OTc0YjVhZiIKZGVxdWV1ZV90aW1lOiAyMDE2LTAyLTEwIDE2OjMxOjUwLjg4OTY4ODI4MSArMDg6
MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAzMi4xNiAyNi4zMyAxMy40NiAxLzE1NiA3
MjU5CnN0YXJ0X3RpbWU6ICcxNDU1MDkzMTQwJwplbmRfdGltZTogJzE0NTUwOTM2MzYnCnZlcnNp
b246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMjEwLTEwMDEwOCIK

--===============7867082241989455380==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0xMCAxNjozMjoxNiBta2ZzIC10IGYyZnMgL2Rldi9zZGExCjIwMTYtMDItMTAgMTY6
MzI6MTggbW91bnQgLXQgZjJmcyAvZGV2L3NkYTEgL2ZzL3NkYTEKMjAxNi0wMi0xMCAxNjozMjoy
MCAuL2ZzX21hcmsgLWQgL2ZzL3NkYTEvMSAtZCAvZnMvc2RhMS8yIC1kIC9mcy9zZGExLzMgLWQg
L2ZzL3NkYTEvNCAtZCAvZnMvc2RhMS81IC1kIC9mcy9zZGExLzYgLWQgL2ZzL3NkYTEvNyAtZCAv
ZnMvc2RhMS84IC1kIC9mcy9zZGExLzkgLWQgL2ZzL3NkYTEvMTAgLWQgL2ZzL3NkYTEvMTEgLWQg
L2ZzL3NkYTEvMTIgLWQgL2ZzL3NkYTEvMTMgLWQgL2ZzL3NkYTEvMTQgLWQgL2ZzL3NkYTEvMTUg
LWQgL2ZzL3NkYTEvMTYgLWQgL2ZzL3NkYTEvMTcgLWQgL2ZzL3NkYTEvMTggLWQgL2ZzL3NkYTEv
MTkgLWQgL2ZzL3NkYTEvMjAgLWQgL2ZzL3NkYTEvMjEgLWQgL2ZzL3NkYTEvMjIgLWQgL2ZzL3Nk
YTEvMjMgLWQgL2ZzL3NkYTEvMjQgLWQgL2ZzL3NkYTEvMjUgLWQgL2ZzL3NkYTEvMjYgLWQgL2Zz
L3NkYTEvMjcgLWQgL2ZzL3NkYTEvMjggLWQgL2ZzL3NkYTEvMjkgLWQgL2ZzL3NkYTEvMzAgLWQg
L2ZzL3NkYTEvMzEgLWQgL2ZzL3NkYTEvMzIgLUQgMTYgLU4gMjU2IC1uIDEyMCAtTCAxIC1TIDEg
LXMgMTY3NzcyMTYK

--===============7867082241989455380==--

