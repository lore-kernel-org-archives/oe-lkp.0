Content-Type: multipart/mixed; boundary="===============4816934128498376543=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 25c1355151: +6.0% fsmark.app_overhead
Date: Thu, 17 Mar 2016 13:39:34 +0800
Message-ID: <20160317053934.GC1670@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4816934128498376543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that fsmark.app_overhead +6.0% increasement on

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs dev-test
commit 25c13551519c66453737e038d104058f94b2e70a ("f2fs: use writepages->loc=
k for WB_SYNC_ALL")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/16MB/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x=
86_64-2015-02-07.cgz/fsyncBeforeClose/lkp-sb02/60G/fsmark

commit: =

  b483fadf7e913be838e11e065175205aa17e429a
  25c13551519c66453737e038d104058f94b2e70a

b483fadf7e913be8 25c13551519c66453737e038d1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    552212 =C2=B1  1%      +6.0%     585551 =C2=B1  5%  fsmark.app_overhead
     21783 =C2=B1  1%     +38.4%      30142 =C2=B1  4%  fsmark.time.involun=
tary_context_switches
    671513 =C2=B1  8%     +78.6%    1199030 =C2=B1  4%  fsmark.time.volunta=
ry_context_switches
    103046 =C2=B1  3%     +36.4%     140590 =C2=B1  4%  vmstat.memory.free
      1340 =C2=B1  5%     +71.5%       2299 =C2=B1  3%  vmstat.system.cs
  27693777 =C2=B1 11%     +23.8%   34297734 =C2=B1  8%  cpuidle.C1-SNB.time
 1.574e+08 =C2=B1 30%    +141.0%  3.794e+08 =C2=B1 16%  cpuidle.POLL.time
    214433 =C2=B1  9%    +166.5%     571452 =C2=B1  4%  cpuidle.POLL.usage
      1010 =C2=B1  2%     +47.4%       1489 =C2=B1  1%  time.file_system_in=
puts
     21783 =C2=B1  1%     +38.4%      30142 =C2=B1  4%  time.involuntary_co=
ntext_switches
    671513 =C2=B1  8%     +78.6%    1199030 =C2=B1  4%  time.voluntary_cont=
ext_switches
    191323 =C2=B1  6%     -14.7%     163263 =C2=B1  3%  meminfo.Dirty
    102976 =C2=B1  3%     +36.6%     140637 =C2=B1  4%  meminfo.MemFree
     30591 =C2=B1  0%     +59.9%      48906 =C2=B1  2%  meminfo.SUnreclaim
    107972 =C2=B1  0%     +23.8%     133628 =C2=B1  1%  meminfo.Slab
      4.88 =C2=B1 17%     +98.1%       9.66 =C2=B1 12%  turbostat.%Busy
    143.78 =C2=B1 17%    +100.7%     288.50 =C2=B1 12%  turbostat.Avg_MHz
      9.26 =C2=B1  3%     +11.3%      10.31 =C2=B1  4%  turbostat.CPU%c1
      3.93 =C2=B1  9%     +53.5%       6.03 =C2=B1  8%  turbostat.CorWatt
     24.40 =C2=B1  5%     -20.8%      19.32 =C2=B1  5%  turbostat.Pkg%pc2
      7.06 =C2=B1  6%     -18.4%       5.76 =C2=B1  6%  turbostat.Pkg%pc3
     28.14 =C2=B1  4%     -22.4%      21.85 =C2=B1  5%  turbostat.Pkg%pc6
      7.31 =C2=B1  4%     +29.2%       9.44 =C2=B1  5%  turbostat.PkgWatt
    344.44 =C2=B1 15%  +38478.6%     132881 =C2=B1  8%  slabinfo.f2fs_exten=
t_node.active_objs
      3.78 =C2=B1 20%  +48240.6%       1826 =C2=B1  8%  slabinfo.f2fs_exten=
t_node.active_slabs
    344.44 =C2=B1 15%  +38610.4%     133335 =C2=B1  8%  slabinfo.f2fs_exten=
t_node.num_objs
      3.78 =C2=B1 20%  +48240.6%       1826 =C2=B1  8%  slabinfo.f2fs_exten=
t_node.num_slabs
      1544 =C2=B1  0%    +277.3%       5827 =C2=B1  6%  slabinfo.kmalloc-25=
6.active_objs
    117.78 =C2=B1  3%    +263.5%     428.10 =C2=B1  5%  slabinfo.kmalloc-25=
6.active_slabs
      1892 =C2=B1  3%    +262.3%       6856 =C2=B1  5%  slabinfo.kmalloc-25=
6.num_objs
    117.78 =C2=B1  3%    +263.5%     428.10 =C2=B1  5%  slabinfo.kmalloc-25=
6.num_slabs
    295.11 =C2=B1  1%   +1434.4%       4528 =C2=B1  7%  slabinfo.kmalloc-40=
96.active_objs
     39.00 =C2=B1  1%   +2253.3%     917.80 =C2=B1  8%  slabinfo.kmalloc-40=
96.active_slabs
    315.00 =C2=B1  1%   +1352.2%       4574 =C2=B1  7%  slabinfo.kmalloc-40=
96.num_objs
     39.00 =C2=B1  1%   +2253.3%     917.80 =C2=B1  8%  slabinfo.kmalloc-40=
96.num_slabs
     93.67 =C2=B1164%   +4783.1%       4573 =C2=B1 18%  proc-vmstat.allocst=
all
    110.22 =C2=B1  9%   +6662.5%       7453 =C2=B1 36%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
      5848 =C2=B1  1%    +144.9%      14326 =C2=B1 15%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     47830 =C2=B1  6%     -14.7%      40810 =C2=B1  3%  proc-vmstat.nr_dirty
     25744 =C2=B1  3%     +36.6%      35157 =C2=B1  4%  proc-vmstat.nr_free=
_pages
     25.33 =C2=B1 26%   +1126.4%     310.70 =C2=B1 15%  proc-vmstat.nr_page=
s_scanned
      7647 =C2=B1  0%     +59.9%      12224 =C2=B1  2%  proc-vmstat.nr_slab=
_unreclaimable
     76857 =C2=B1 43%     -60.7%      30217 =C2=B1 53%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
      6361 =C2=B1  0%    +253.8%      22511 =C2=B1 22%  proc-vmstat.pageout=
run
  13101725 =C2=B1  0%     +12.5%   14745650 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
   3956682 =C2=B1  0%     +21.0%    4789042 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
  16228928 =C2=B1  0%     +15.3%   18704882 =C2=B1  0%  proc-vmstat.pgfree
     31211 =C2=B1107%   +2261.2%     736978 =C2=B1 16%  proc-vmstat.pgscan_=
direct_dma32
      9873 =C2=B1107%   +2223.3%     229380 =C2=B1 16%  proc-vmstat.pgscan_=
direct_normal
     13354 =C2=B1169%   +5000.3%     681106 =C2=B1 18%  proc-vmstat.pgsteal=
_direct_dma32
      4264 =C2=B1168%   +4865.8%     211768 =C2=B1 18%  proc-vmstat.pgsteal=
_direct_normal
    219420 =C2=B1  0%   +2108.9%    4846809 =C2=B1  8%  proc-vmstat.slabs_s=
canned
    364381 =C2=B1132%     -96.1%      14178 =C2=B1121%  latency_stats.avg.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       6157 =C2=B1 30%  latency_stats.avg.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_data_page.[f2fs].do_wr=
ite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2=
fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__fi=
lemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
      0.00 =C2=B1 -1%      +Inf%      68118 =C2=B1 59%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     19231 =C2=B1  0%    +533.2%     121779 =C2=B1 65%  latency_stats.avg.c=
all_rwsem_down_write_failed.block_operations.[f2fs].write_checkpoint.[f2fs]=
.f2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsy=
nc.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      94391 =C2=B1101%  latency_stats.avg.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].f2fs_write_data_p=
ages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wait=
_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCA=
LL_64_fastpath
     11119 =C2=B1 86%   +1161.5%     140262 =C2=B1 10%  latency_stats.avg.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_data_page.[f2fs].do_write_data_page.[f2fs].f2fs_write_data_page.[f=
2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_=
pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wai=
t_range
     23095 =C2=B1 15%     -89.6%       2408 =C2=B1134%  latency_stats.avg.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    2220210 =C2=B1 60%  latency_stats.avg.f=
2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync=
.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      77575 =C2=B1 50%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin
      0.00 =C2=B1 -1%      +Inf%      53520 =C2=B1 89%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.new_slab.___slab_alloc.__slab_alloc
     57788 =C2=B1  1%    +221.3%     185675 =C2=B1  9%  latency_stats.hits.=
wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_=
write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsy=
nc.entry_SYSCALL_64_fastpath
    723355 =C2=B1 82%     -73.3%     193177 =C2=B1 91%  latency_stats.max.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      19907 =C2=B1139%  latency_stats.max.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_data_page.[f2fs].do_wr=
ite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2=
fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__fi=
lemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
      0.00 =C2=B1 -1%      +Inf%     150516 =C2=B1 59%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    794065 =C2=B1 51%     -94.4%      44235 =C2=B1159%  latency_stats.max.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__get=
_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserv=
e_block.[f2fs].f2fs_get_block.[f2fs].f2fs_write_begin.[f2fs].generic_perfor=
m_write.__generic_file_write_iter.generic_file_write_iter
   1014725 =C2=B1 22%     -95.6%      44296 =C2=B1159%  latency_stats.max.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__get=
_node_page.[f2fs].get_node_page.[f2fs].get_node_page.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.f2fs_file_write_iter.[f2fs].__vfs_write
    425754 =C2=B1 97%     -90.1%      42226 =C2=B1169%  latency_stats.max.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f=
2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__f=
ilemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
     19231 =C2=B1  0%   +4035.5%     795298 =C2=B1 80%  latency_stats.max.c=
all_rwsem_down_write_failed.block_operations.[f2fs].write_checkpoint.[f2fs]=
.f2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsy=
nc.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     123677 =C2=B1103%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].f2fs_write_data_p=
ages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wait=
_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCA=
LL_64_fastpath
     13652 =C2=B1 57%   +9571.3%    1320329 =C2=B1 20%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_data_page.[f2fs].do_write_data_page.[f2fs].f2fs_write_data_page.[f=
2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_=
pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wai=
t_range
      0.00 =C2=B1 -1%      +Inf%    2342313 =C2=B1 61%  latency_stats.max.f=
2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync=
.entry_SYSCALL_64_fastpath
    192297 =C2=B1 57%    +239.8%     653426 =C2=B1 32%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].f2fs_write_data_pages.[f2fs].do_writ=
epages.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_fi=
le.[f2fs].vfs_fsync_range
      0.00 =C2=B1 -1%      +Inf%      78018 =C2=B1 50%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin
      0.00 =C2=B1 -1%      +Inf%      54060 =C2=B1 89%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.new_slab.___slab_alloc.__slab_alloc
   4632456 =C2=B1 93%     -77.6%    1037402 =C2=B1121%  latency_stats.sum.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      86433 =C2=B1 44%  latency_stats.sum.a=
llocate_data_block.[f2fs].do_write_page.[f2fs].write_data_page.[f2fs].do_wr=
ite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2=
fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__fi=
lemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
      0.00 =C2=B1 -1%      +Inf%    2383249 =C2=B1 92%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
   1199350 =C2=B1181%     -74.2%     309546 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].__get=
_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].get_read_da=
ta_page.[f2fs].find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2=
fs].lookup_real.path_openat
     19231 =C2=B1  0%   +4037.1%     795607 =C2=B1 80%  latency_stats.sum.c=
all_rwsem_down_write_failed.block_operations.[f2fs].write_checkpoint.[f2fs]=
.f2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsy=
nc.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     150063 =C2=B1109%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].f2fs_write_data_p=
ages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wait=
_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCA=
LL_64_fastpath
     13652 =C2=B1 57%  +2.8e+05%   38009621 =C2=B1 12%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_data_page.[f2fs].do_write_data_page.[f2fs].f2fs_write_data_page.[f=
2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_=
pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_write_and_wai=
t_range
   1168485 =C2=B1 81%     -58.4%     485914 =C2=B1 44%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
      3847 =C2=B1 76%   +5520.0%     216250 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].read_node_page.[f2fs].__ge=
t_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reser=
ve_block.[f2fs].get_new_data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat
      5857 =C2=B1 81%   +5984.5%     356421 =C2=B1 57%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].read_node_page.[f2fs].__ge=
t_node_page.[f2fs].get_node_page.[f2fs].get_dnode_of_data.[f2fs].get_read_d=
ata_page.[f2fs].find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.path_openat
  10101346 =C2=B1 20%     -90.6%     947017 =C2=B1141%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
    674069 =C2=B1 79%     -70.0%     202360 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
      0.00 =C2=B1 -1%      +Inf%    7065858 =C2=B1 87%  latency_stats.sum.f=
2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync=
.entry_SYSCALL_64_fastpath
    624892 =C2=B1 77%    +875.0%    6092743 =C2=B1 31%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].f2fs_write_data_pages.[f2fs].do_writ=
epages.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_fi=
le.[f2fs].vfs_fsync_range
      0.00 =C2=B1 -1%      +Inf%    2781158 =C2=B1128%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin
      0.00 =C2=B1 -1%      +Inf%     158254 =C2=B1150%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodem=
ask.alloc_pages_current.new_slab.___slab_alloc.__slab_alloc

lkp-sb02: Sandy Bridge-EP
Memory: 4G

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
Xiaolong Ye.

--===============4816934128498376543==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3RhdDog
CiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJv
Yy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNs
YWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAog
IHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDog
CiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1h
bmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0
OiAyNWMxMzU1MTUxOWM2NjQ1MzczN2UwMzhkMTA0MDU4Zjk0YjJlNzBhCm1vZGVsOiBTYW5keSBC
cmlkZ2UtRVAKbWVtb3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEt
SERUNzIyNTE2RExBMzgwX1ZEU0QxRFRDRUtZQUVKLXBhcnQyIgpzd2FwX3BhcnRpdGlvbnM6IApy
b290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1IRFQ3MjI1MTZETEEzODBfVkRT
RDFEVENFS1lBRUotcGFydDEiCmNhdGVnb3J5OiBiZW5jaG1hcmsKaXRlcmF0aW9uczogMXgKbnJf
dGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGYyZnMKZnMyOiAKZnNtYXJrOgogIGZpbGVzaXpl
OiAxNk1CCiAgdGVzdF9zaXplOiA2MEcKICBzeW5jX21ldGhvZDogZnN5bmNCZWZvcmVDbG9zZQog
IG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAyNTZmcGQKcXVl
dWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3Atc2IwMgp0Ym94X2dyb3VwOiBsa3Atc2IwMgprY29uZmln
OiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDMtMTUgMTc6Mzk6MDAuNzg5NzUzMjE1
ICswODowMApjb21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oKaWQ6IGJlNGNmZmQ1OWNlZDJlZWJkNmY4MjBlOGE1YzQ0MWNiZjg2NTg5YTIKdXNlcjog
bGtwCmhlYWRfY29tbWl0OiAyYWQ1MzA2MTU2YTZmNWRhNzA2MWI4OGUyYzYxOWIzODMwZDMyOGJk
CmJhc2VfY29tbWl0OiBmNmNlZGU1YjQ5ZTgyMmViYzQxYTA5OWZlNDFhYjQ5ODlmNjRlMmNiCmJy
YW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzEyMTUKcmVzdWx0X3Jvb3Q6ICIv
cmVzdWx0L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTE2TUItNjBHLWZzeW5j
QmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3Atc2IwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMjVjMTM1NTE1MTljNjY0NTM3MzdlMDM4ZDEwNDA1OGY5
NGIyZTcwYS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1zYjAyL2Jpc2VjdF9mc21h
cmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZjJmcy0xNk1CLTYwRy1mc3luY0JlZm9yZUNsb3Nl
LTE2ZC0yNTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0yNWMx
MzU1MTUxOWM2NjQ1MzczN2UwMzhkMTA0MDU4Zjk0YjJlNzBhLTIwMTYwMzE1LTIyMTk3LTk5d3Jt
cC0wLnlhbWwiCm5yX2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiAzNDY4Ljg2MDAwMDAwMDAw
MDYKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oi
CmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xr
cC9zY2hlZHVsZWQvbGtwLXNiMDIvYmlzZWN0X2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhE
RC1mMmZzLTE2TUItNjBHLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTI1YzEzNTUxNTE5YzY2NDUzNzM3ZTAzOGQxMDQw
NThmOTRiMmU3MGEtMjAxNjAzMTUtMjIxOTctOTl3cm1wLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0g
a2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NjAzMTIxNQotIGNvbW1pdD0yNWMxMzU1MTUxOWM2NjQ1MzczN2UwMzhkMTA0MDU4Zjk0YjJlNzBh
Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMjVjMTM1NTE1MTlj
NjY0NTM3MzdlMDM4ZDEwNDA1OGY5NGIyZTcwYS92bWxpbnV6LTQuNS4wLXJjNS0wMDE3OC1nMjVj
MTM1NQotIG1heF91cHRpbWU9MzQ2OAotIFJFU1VMVF9ST09UPS9yZXN1bHQvZnNtYXJrL3BlcmZv
cm1hbmNlLTF4LTMydC0xSERELWYyZnMtMTZNQi02MEctZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2
ZnBkL2xrcC1zYjAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2Nj
LTQuOS8yNWMxMzU1MTUxOWM2NjQ1MzczN2UwMzhkMTA0MDU4Zjk0YjJlNzBhLzAKLSBMS1BfU0VS
VkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xl
dmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUu
cmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBu
bWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlz
az0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncK
bGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8yNWMxMzU1MTUxOWM2NjQ1MzczN2UwMzhkMTA0
MDU4Zjk0YjJlNzBhL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9z
dGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6
LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIuY2d6LC9sa3Av
YmVuY2htYXJrcy9mc21hcmsuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS8yNWMxMzU1MTUxOWM2NjQ1MzczN2UwMzhkMTA0MDU4Zjk0YjJl
NzBhL2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDUKa2VybmVsOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzI1YzEzNTUxNTE5YzY2NDUzNzM3ZTAzOGQxMDQwNThmOTRiMmU3
MGEvdm1saW51ei00LjUuMC1yYzUtMDAxNzgtZzI1YzEzNTUiCmRlcXVldWVfdGltZTogMjAxNi0w
My0xNSAxODowMjo0MC41MzI0NTAxODggKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2
ZzogMjguMTQgMzEuMTcgMjMuOTQgMS8xMTggMTY4OTAKc3RhcnRfdGltZTogJzE0NTgwMzYxOTYn
CmVuZF90aW1lOiAnMTQ1ODAzNzQ1NCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAzMTUt
MTU1MzE0Igo=

--===============4816934128498376543==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0xNSAxODowMzoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xNSAxODowMzoxMiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xNSAxODowMzoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xNSAxODowMzoxMiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xNSAxODowMzoxMiBta2ZzIC10
IGYyZnMgL2Rldi9zZGEyCjIwMTYtMDMtMTUgMTg6MDM6MTUgbW91bnQgLXQgZjJmcyAvZGV2L3Nk
YTIgL2ZzL3NkYTIKMjAxNi0wMy0xNSAxODowMzoxNiAuL2ZzX21hcmsgLWQgL2ZzL3NkYTIvMSAt
ZCAvZnMvc2RhMi8yIC1kIC9mcy9zZGEyLzMgLWQgL2ZzL3NkYTIvNCAtZCAvZnMvc2RhMi81IC1k
IC9mcy9zZGEyLzYgLWQgL2ZzL3NkYTIvNyAtZCAvZnMvc2RhMi84IC1kIC9mcy9zZGEyLzkgLWQg
L2ZzL3NkYTIvMTAgLWQgL2ZzL3NkYTIvMTEgLWQgL2ZzL3NkYTIvMTIgLWQgL2ZzL3NkYTIvMTMg
LWQgL2ZzL3NkYTIvMTQgLWQgL2ZzL3NkYTIvMTUgLWQgL2ZzL3NkYTIvMTYgLWQgL2ZzL3NkYTIv
MTcgLWQgL2ZzL3NkYTIvMTggLWQgL2ZzL3NkYTIvMTkgLWQgL2ZzL3NkYTIvMjAgLWQgL2ZzL3Nk
YTIvMjEgLWQgL2ZzL3NkYTIvMjIgLWQgL2ZzL3NkYTIvMjMgLWQgL2ZzL3NkYTIvMjQgLWQgL2Zz
L3NkYTIvMjUgLWQgL2ZzL3NkYTIvMjYgLWQgL2ZzL3NkYTIvMjcgLWQgL2ZzL3NkYTIvMjggLWQg
L2ZzL3NkYTIvMjkgLWQgL2ZzL3NkYTIvMzAgLWQgL2ZzL3NkYTIvMzEgLWQgL2ZzL3NkYTIvMzIg
LUQgMTYgLU4gMjU2IC1uIDEyMCAtTCAxIC1TIDEgLXMgMTY3NzcyMTYK

--===============4816934128498376543==--

