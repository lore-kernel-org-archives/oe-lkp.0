Content-Type: multipart/mixed; boundary="===============7311423104850719249=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] 58f1ac5305d: No primary result change, -5.3% fsmark.time.involuntary_context_switches
Date: Thu, 23 Jul 2015 11:25:34 +0800
Message-ID: <87380f1ro1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7311423104850719249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed the below changes on

git://internal_merge_and_test_tree revert-58f1ac5305dc3a07e2f64c8279bde93e0=
2034d62-58f1ac5305dc3a07e2f64c8279bde93e02034d62
commit 58f1ac5305dc3a07e2f64c8279bde93e02034d62 ("sched: Clean up load aver=
age references")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/f2fs/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  63bdfe103e368882a304463547e8e0a9ef45455e
  58f1ac5305dc3a07e2f64c8279bde93e02034d62

63bdfe103e368882 58f1ac5305dc3a07e2f64c8279 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     25219 =C2=B1  0%      -5.3%      23873 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
     14808 =C2=B1  9%     -35.1%       9606 =C2=B1  0%  fsmark.time.minor_p=
age_faults
     22.50 =C2=B1  2%     -29.3%      15.90 =C2=B1  4%  fsmark.time.percent=
_of_cpu_this_job_got
     38.45 =C2=B1  1%     -29.8%      27.01 =C2=B1  3%  fsmark.time.system_=
time
    802177 =C2=B1  0%     -10.0%     722291 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
     13162 =C2=B1  0%      -6.4%      12314 =C2=B1  1%  vmstat.system.cs
      1263 =C2=B1  0%      -9.2%       1146 =C2=B1  2%  vmstat.system.in
      5571 =C2=B1  6%     -16.0%       4680 =C2=B1  4%  slabinfo.kmalloc-19=
2.active_objs
      5603 =C2=B1  6%     -14.7%       4777 =C2=B1  4%  slabinfo.kmalloc-19=
2.num_objs
      3222 =C2=B1  3%     -13.7%       2782 =C2=B1  6%  slabinfo.kmalloc-25=
6.active_objs
     30855 =C2=B1  0%     +18.9%      36686 =C2=B1  1%  softirqs.BLOCK
     34119 =C2=B1  1%     -13.4%      29559 =C2=B1  1%  softirqs.RCU
     41387 =C2=B1  1%     -19.1%      33481 =C2=B1  8%  softirqs.SCHED
    178163 =C2=B1  3%    +108.9%     372131 =C2=B1  3%  numa-numastat.node0=
.local_node
    178165 =C2=B1  3%    +108.9%     372132 =C2=B1  3%  numa-numastat.node0=
.numa_hit
    418023 =C2=B1  1%     -47.6%     218968 =C2=B1  6%  numa-numastat.node1=
.local_node
    418025 =C2=B1  1%     -47.6%     218969 =C2=B1  6%  numa-numastat.node1=
.numa_hit
      5116 =C2=B1 27%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults
      3535 =C2=B1 33%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
      9557 =C2=B1 15%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
     73024 =C2=B1  2%    +102.4%     147800 =C2=B1  3%  proc-vmstat.pgalloc=
_dma32
    558218 =C2=B1  0%     -14.1%     479339 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
     14808 =C2=B1  9%     -35.1%       9606 =C2=B1  0%  time.minor_page_fau=
lts
     22.50 =C2=B1  2%     -29.3%      15.90 =C2=B1  4%  time.percent_of_cpu=
_this_job_got
     38.45 =C2=B1  1%     -29.8%      27.01 =C2=B1  3%  time.system_time
      1.58 =C2=B1  4%     -24.6%       1.19 =C2=B1  3%  time.user_time
    802177 =C2=B1  0%     -10.0%     722291 =C2=B1  1%  time.voluntary_cont=
ext_switches
  98675425 =C2=B1  4%    +100.2%  1.975e+08 =C2=B1  2%  cpuidle.C1-NHM.time
    257096 =C2=B1  7%     +27.8%     328621 =C2=B1  5%  cpuidle.C1-NHM.usage
  26714965 =C2=B1  3%     +52.9%   40858837 =C2=B1  2%  cpuidle.C1E-NHM.time
     25357 =C2=B1  4%    +103.1%      51492 =C2=B1  6%  cpuidle.C1E-NHM.usa=
ge
 9.975e+08 =C2=B1  0%     -18.4%  8.137e+08 =C2=B1  1%  cpuidle.C3-NHM.time
    552516 =C2=B1  1%     -47.2%     291580 =C2=B1 12%  cpuidle.C6-NHM.usage
      1.79 =C2=B1  1%     -25.1%       1.34 =C2=B1  3%  turbostat.%Busy
     37.80 =C2=B1  1%      -9.8%      34.10 =C2=B1  2%  turbostat.Avg_MHz
      2105 =C2=B1  0%     +20.3%       2533 =C2=B1  1%  turbostat.Bzy_MHz
     10.18 =C2=B1  2%     +52.6%      15.54 =C2=B1  1%  turbostat.CPU%c1
     49.11 =C2=B1  1%     -32.8%      33.00 =C2=B1  3%  turbostat.CPU%c3
     38.92 =C2=B1  1%     +28.8%      50.12 =C2=B1  2%  turbostat.CPU%c6
     40.06 =C2=B1  3%     -26.1%      29.62 =C2=B1  3%  turbostat.Pkg%pc3
    240564 =C2=B1  1%     +33.8%     321780 =C2=B1  7%  numa-meminfo.node0.=
Active
     12993 =C2=B1 22%     +49.9%      19476 =C2=B1 13%  numa-meminfo.node0.=
Active(anon)
    227571 =C2=B1  1%     +32.8%     302303 =C2=B1  7%  numa-meminfo.node0.=
Active(file)
     12844 =C2=B1 23%     +50.4%      19321 =C2=B1 13%  numa-meminfo.node0.=
AnonPages
    542437 =C2=B1  0%     +21.0%     656411 =C2=B1  5%  numa-meminfo.node0.=
FilePages
    314113 =C2=B1  1%     +12.2%     352587 =C2=B1  3%  numa-meminfo.node0.=
Inactive
    310529 =C2=B1  0%     +11.6%     346516 =C2=B1  3%  numa-meminfo.node0.=
Inactive(file)
    680045 =C2=B1  1%     +20.3%     818119 =C2=B1  5%  numa-meminfo.node0.=
MemUsed
     54588 =C2=B1  3%     +29.2%      70501 =C2=B1  6%  numa-meminfo.node0.=
SReclaimable
     79000 =C2=B1 10%     +23.9%      97874 =C2=B1 10%  numa-meminfo.node0.=
Slab
    182539 =C2=B1  1%     -37.4%     114205 =C2=B1 17%  numa-meminfo.node1.=
Active
    163472 =C2=B1  2%     -37.9%     101528 =C2=B1 19%  numa-meminfo.node1.=
Active(file)
    438787 =C2=B1  1%     -26.0%     324640 =C2=B1 10%  numa-meminfo.node1.=
FilePages
    274279 =C2=B1  1%     -18.8%     222715 =C2=B1  6%  numa-meminfo.node1.=
Inactive
    269062 =C2=B1  1%     -18.2%     219988 =C2=B1  6%  numa-meminfo.node1.=
Inactive(file)
    573085 =C2=B1  2%     -24.1%     434978 =C2=B1 10%  numa-meminfo.node1.=
MemUsed
     45004 =C2=B1  4%     -35.8%      28877 =C2=B1 15%  numa-meminfo.node1.=
SReclaimable
     74520 =C2=B1 10%     -26.0%      55145 =C2=B1 18%  numa-meminfo.node1.=
Slab
      3247 =C2=B1 22%     +49.9%       4868 =C2=B1 13%  numa-vmstat.node0.n=
r_active_anon
     56883 =C2=B1  1%     +32.9%      75574 =C2=B1  7%  numa-vmstat.node0.n=
r_active_file
      3210 =C2=B1 23%     +50.4%       4829 =C2=B1 13%  numa-vmstat.node0.n=
r_anon_pages
     88593 =C2=B1 16%     +32.2%     117110 =C2=B1 10%  numa-vmstat.node0.n=
r_dirtied
    135599 =C2=B1  0%     +21.0%     164099 =C2=B1  5%  numa-vmstat.node0.n=
r_file_pages
     77626 =C2=B1  0%     +11.6%      86627 =C2=B1  3%  numa-vmstat.node0.n=
r_inactive_file
     13644 =C2=B1  3%     +29.2%      17624 =C2=B1  6%  numa-vmstat.node0.n=
r_slab_reclaimable
     88674 =C2=B1 16%     +32.1%     117156 =C2=B1 10%  numa-vmstat.node0.n=
r_written
    211522 =C2=B1  9%     +46.9%     310819 =C2=B1  6%  numa-vmstat.node0.n=
uma_hit
    156365 =C2=B1 19%     +60.1%     250312 =C2=B1  8%  numa-vmstat.node0.n=
uma_local
     40862 =C2=B1  2%     -37.9%      25381 =C2=B1 19%  numa-vmstat.node1.n=
r_active_file
     73146 =C2=B1 19%     -40.1%      43795 =C2=B1 27%  numa-vmstat.node1.n=
r_dirtied
    109691 =C2=B1  1%     -26.0%      81159 =C2=B1 10%  numa-vmstat.node1.n=
r_file_pages
     67261 =C2=B1  1%     -18.2%      54996 =C2=B1  6%  numa-vmstat.node1.n=
r_inactive_file
     11249 =C2=B1  4%     -35.8%       7219 =C2=B1 15%  numa-vmstat.node1.n=
r_slab_reclaimable
     73101 =C2=B1 19%     -40.1%      43777 =C2=B1 27%  numa-vmstat.node1.n=
r_written
    351627 =C2=B1  5%     -28.8%     250475 =C2=B1  8%  numa-vmstat.node1.n=
uma_hit
    342499 =C2=B1  9%     -28.0%     246662 =C2=B1  8%  numa-vmstat.node1.n=
uma_local
     12795 =C2=B1  2%     -45.6%       6961 =C2=B1 10%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
     70109 =C2=B1  0%      -9.0%      63804 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_wri=
te.vfs_write.SyS_write
     42632 =C2=B1  1%     -12.6%      37247 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wr=
ite_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fi=
le_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
     38640 =C2=B1  1%     -17.0%      32089 =C2=B1  3%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_per=
form_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_writ=
e_iter.[f2fs].__vfs_write.vfs_write
     22535 =C2=B1  2%     -38.8%      13784 =C2=B1  8%  latency_stats.hits.=
call_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2f=
s].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     17926 =C2=B1  2%     -42.7%      10269 =C2=B1  9%  latency_stats.hits.=
call_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].=
f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_f=
astpath
     28584 =C2=B1  2%     -42.5%      16432 =C2=B1  8%  latency_stats.hits.=
call_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[=
f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     27861 =C2=B1  2%     -36.6%      17669 =C2=B1  7%  latency_stats.hits.=
call_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2f=
s].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.Sy=
S_fsync.entry_SYSCALL_64_fastpath
   6480865 =C2=B1  5%     -54.1%    2976173 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   3833279 =C2=B1  2%     -68.7%    1199323 =C2=B1 20%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs]=
.sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
   8182623 =C2=B1  2%     -42.3%    4718368 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   6813612 =C2=B1  3%     -56.0%    2999812 =C2=B1 12%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_=
file_write_iter.[f2fs].__vfs_write.vfs_write
  24739544 =C2=B1  2%     -47.0%   13112696 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
   2073795 =C2=B1  1%     -46.9%    1101130 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].do_write_data_page.[f2fs].f2fs_wri=
te_data_page.[f2fs].__f2fs_writepage.[f2fs].write_cache_pages.f2fs_write_da=
ta_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
  14552687 =C2=B1  2%     -50.3%    7237230 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wri=
te_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
  14140203 =C2=B1  2%     -32.4%    9558325 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
   3766111 =C2=B1  3%     -27.9%    2717195 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_dat=
a_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_op=
enat.do_filp_open
    418250 =C2=B1  2%     -42.6%     239882 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
  11811483 =C2=B1  2%     -53.9%    5439738 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write=
_iter.[f2fs].__vfs_write.vfs_write
     17249 =C2=B1 18%     -60.3%       6856 =C2=B1 14%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].w=
rite_cache_pages.f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdata=
write_range.filemap_fdatawrite.sync_dirty_dir_inodes.[f2fs]
   1398753 =C2=B1  1%     -48.5%     720320 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].w=
rite_cache_pages.f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdata=
write_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
   5488959 =C2=B1  2%     -59.6%    2218092 =C2=B1 17%  latency_stats.sum.c=
all_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2fs=
].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   5417904 =C2=B1  2%     -65.5%    1867191 =C2=B1 19%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].f=
2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fa=
stpath
   7197931 =C2=B1  2%     -70.6%    2114873 =C2=B1 20%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   1397482 =C2=B1  7%     -60.6%     551254 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
  12368430 =C2=B1  2%     -48.8%    6335859 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     68573 =C2=B1 15%     -43.0%      39072 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkd=
ir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
   4813264 =C2=B1  2%     -70.3%    1428098 =C2=B1 20%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
   7175909 =C2=B1  2%     -51.6%    3472229 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
 2.154e+09 =C2=B1  0%      +7.8%  2.321e+09 =C2=B1  1%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.f2fs_issue_flush.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
  1.31e+09 =C2=B1  0%      -6.5%  1.225e+09 =C2=B1  1%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.f2fs_s=
ync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     75524 =C2=B1  3%     -24.3%      57147 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     79656 =C2=B1  5%     -59.9%      31914 =C2=B1 10%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      4128 =C2=B1116%    -711.2%     -25233 =C2=B1-22%  sched_debug.cfs_rq[=
10]:/.spread0
     79938 =C2=B1  5%     -51.4%      38880 =C2=B1 17%  sched_debug.cfs_rq[=
12]:/.min_vruntime
      4410 =C2=B1136%    -514.2%     -18269 =C2=B1-44%  sched_debug.cfs_rq[=
12]:/.spread0
     31594 =C2=B1 16%     -56.4%      13772 =C2=B1 29%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     77046 =C2=B1  3%     -47.2%      40660 =C2=B1 11%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      1517 =C2=B1326%   -1186.4%     -16490 =C2=B1-43%  sched_debug.cfs_rq[=
14]:/.spread0
     35693 =C2=B1 15%     -58.6%      14771 =C2=B1 44%  sched_debug.cfs_rq[=
15]:/.min_vruntime
      9.00 =C2=B1 42%     -68.9%       2.80 =C2=B1 90%  sched_debug.cfs_rq[=
1]:/.load_avg
     64601 =C2=B1  6%     -42.9%      36897 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      9.30 =C2=B1 43%     -69.9%       2.80 =C2=B1 90%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
     84884 =C2=B1  3%     -40.3%      50685 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      9358 =C2=B1 45%    -169.0%      -6461 =C2=B1-109%  sched_debug.cfs_rq=
[2]:/.spread0
      4113 =C2=B1 23%     -59.2%       1677 =C2=B1 36%  sched_debug.cfs_rq[=
3]:/.exec_clock
     57549 =C2=B1  5%     -36.2%      36719 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     21.30 =C2=B1 40%     -56.3%       9.30 =C2=B1 48%  sched_debug.cfs_rq[=
3]:/.util_avg
     84707 =C2=B1  4%     -32.3%      57351 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     61439 =C2=B1 12%     -43.6%      34654 =C2=B1 14%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     23.00 =C2=B1 18%     -71.7%       6.50 =C2=B1 76%  sched_debug.cfs_rq[=
5]:/.util_avg
     87972 =C2=B1  5%     -29.5%      62035 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     61032 =C2=B1  7%     -40.0%      36642 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.min_vruntime
    967.60 =C2=B1 11%     +35.5%       1311 =C2=B1 21%  sched_debug.cfs_rq[=
8]:/.exec_clock
     79581 =C2=B1  4%     -47.4%      41877 =C2=B1 13%  sched_debug.cfs_rq[=
8]:/.min_vruntime
      4054 =C2=B1119%    -476.6%     -15270 =C2=B1-39%  sched_debug.cfs_rq[=
8]:/.spread0
     34334 =C2=B1 14%     -49.6%      17293 =C2=B1 21%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     64914 =C2=B1  1%     +46.3%      94988 =C2=B1 10%  sched_debug.cpu#0.n=
r_switches
     -1262 =C2=B1 -2%     +65.6%      -2090 =C2=B1 -2%  sched_debug.cpu#0.n=
r_uninterruptible
     67869 =C2=B1  2%     +44.9%      98341 =C2=B1 10%  sched_debug.cpu#0.s=
ched_count
     30303 =C2=B1  1%     +40.1%      42444 =C2=B1 11%  sched_debug.cpu#0.s=
ched_goidle
     96797 =C2=B1  1%     +29.1%     124968 =C2=B1  9%  sched_debug.cpu#0.t=
twu_count
     17452 =C2=B1  3%     +67.1%      29167 =C2=B1  5%  sched_debug.cpu#0.t=
twu_local
     13679 =C2=B1  8%     -24.8%      10284 =C2=B1 11%  sched_debug.cpu#1.n=
r_load_updates
   -328.60 =C2=B1-18%     -93.4%     -21.70 =C2=B1-120%  sched_debug.cpu#1.=
nr_uninterruptible
     26411 =C2=B1 16%     -42.1%      15282 =C2=B1 33%  sched_debug.cpu#1.t=
twu_count
    652.20 =C2=B1  6%     -29.9%     457.20 =C2=B1 11%  sched_debug.cpu#10.=
nr_uninterruptible
      9079 =C2=B1 10%     -33.5%       6041 =C2=B1 10%  sched_debug.cpu#11.=
nr_load_updates
     49233 =C2=B1 33%     -72.3%      13639 =C2=B1 37%  sched_debug.cpu#11.=
nr_switches
    483.20 =C2=B1 10%     -89.4%      51.20 =C2=B1 34%  sched_debug.cpu#11.=
nr_uninterruptible
     50134 =C2=B1 31%     -72.8%      13653 =C2=B1 36%  sched_debug.cpu#11.=
sched_count
     22029 =C2=B1 36%     -74.4%       5646 =C2=B1 38%  sched_debug.cpu#11.=
sched_goidle
    662.70 =C2=B1  6%     -28.3%     475.10 =C2=B1 11%  sched_debug.cpu#12.=
nr_uninterruptible
     16020 =C2=B1  3%     +30.3%      20875 =C2=B1 30%  sched_debug.cpu#12.=
ttwu_count
      3067 =C2=B1  5%     +35.5%       4157 =C2=B1 10%  sched_debug.cpu#12.=
ttwu_local
      8661 =C2=B1  5%     -32.4%       5855 =C2=B1 12%  sched_debug.cpu#13.=
nr_load_updates
     45097 =C2=B1 31%     -58.4%      18740 =C2=B1 55%  sched_debug.cpu#13.=
nr_switches
    477.00 =C2=B1  6%     -88.0%      57.30 =C2=B1 36%  sched_debug.cpu#13.=
nr_uninterruptible
     45122 =C2=B1 31%     -56.4%      19691 =C2=B1 59%  sched_debug.cpu#13.=
sched_count
     20135 =C2=B1 35%     -59.2%       8223 =C2=B1 62%  sched_debug.cpu#13.=
sched_goidle
    673.80 =C2=B1  4%     -30.0%     471.60 =C2=B1 10%  sched_debug.cpu#14.=
nr_uninterruptible
      8848 =C2=B1  2%     -31.7%       6040 =C2=B1 11%  sched_debug.cpu#15.=
nr_load_updates
     56279 =C2=B1 29%     -68.6%      17682 =C2=B1 55%  sched_debug.cpu#15.=
nr_switches
    487.30 =C2=B1 12%     -86.3%      66.60 =C2=B1 32%  sched_debug.cpu#15.=
nr_uninterruptible
     57410 =C2=B1 27%     -69.2%      17695 =C2=B1 55%  sched_debug.cpu#15.=
sched_count
     25648 =C2=B1 33%     -70.5%       7558 =C2=B1 60%  sched_debug.cpu#15.=
sched_goidle
     34822 =C2=B1 33%     -67.0%      11489 =C2=B1 59%  sched_debug.cpu#15.=
ttwu_count
     56714 =C2=B1  2%     +54.8%      87780 =C2=B1 18%  sched_debug.cpu#2.n=
r_switches
   -405.40 =C2=B1-12%     -86.6%     -54.50 =C2=B1-81%  sched_debug.cpu#2.n=
r_uninterruptible
     57650 =C2=B1  3%     +53.9%      88723 =C2=B1 18%  sched_debug.cpu#2.s=
ched_count
     25057 =C2=B1  2%     +56.1%      39122 =C2=B1 20%  sched_debug.cpu#2.s=
ched_goidle
     23873 =C2=B1  3%     +35.0%      32222 =C2=B1  9%  sched_debug.cpu#2.t=
twu_count
      3677 =C2=B1  7%     +40.8%       5177 =C2=B1  5%  sched_debug.cpu#2.t=
twu_local
     11386 =C2=B1  5%     -25.8%       8442 =C2=B1 14%  sched_debug.cpu#3.n=
r_load_updates
   -325.00 =C2=B1-16%     -87.8%     -39.60 =C2=B1-42%  sched_debug.cpu#3.n=
r_uninterruptible
     26641 =C2=B1 21%     -34.9%      17353 =C2=B1 32%  sched_debug.cpu#3.t=
twu_count
   -503.40 =C2=B1-10%     -94.1%     -29.50 =C2=B1-131%  sched_debug.cpu#4.=
nr_uninterruptible
     61132 =C2=B1  3%     +34.6%      82297 =C2=B1 16%  sched_debug.cpu#4.s=
ched_count
      4440 =C2=B1  9%     +27.3%       5652 =C2=B1  9%  sched_debug.cpu#4.t=
twu_local
     12260 =C2=B1  3%     -34.8%       7991 =C2=B1 14%  sched_debug.cpu#5.n=
r_load_updates
   -332.50 =C2=B1-14%     -88.3%     -38.90 =C2=B1-60%  sched_debug.cpu#5.n=
r_uninterruptible
     26089 =C2=B1 23%     -45.5%      14210 =C2=B1 36%  sched_debug.cpu#5.t=
twu_count
     61869 =C2=B1  5%     +27.2%      78701 =C2=B1 12%  sched_debug.cpu#6.n=
r_switches
   -585.00 =C2=B1 -7%     -94.8%     -30.30 =C2=B1-134%  sched_debug.cpu#6.=
nr_uninterruptible
     62412 =C2=B1  5%     +27.7%      79682 =C2=B1 13%  sched_debug.cpu#6.s=
ched_count
     27753 =C2=B1  5%     +24.7%      34601 =C2=B1 14%  sched_debug.cpu#6.s=
ched_goidle
      4437 =C2=B1  6%     +36.0%       6034 =C2=B1 16%  sched_debug.cpu#6.t=
twu_local
     11733 =C2=B1  3%     -29.0%       8329 =C2=B1 17%  sched_debug.cpu#7.n=
r_load_updates
   -333.80 =C2=B1-11%     -89.5%     -34.90 =C2=B1-69%  sched_debug.cpu#7.n=
r_uninterruptible
     25454 =C2=B1 26%     -46.7%      13577 =C2=B1 36%  sched_debug.cpu#7.t=
twu_count
      9484 =C2=B1  4%     +17.6%      11150 =C2=B1  5%  sched_debug.cpu#8.n=
r_load_updates
     35251 =C2=B1 14%     +52.5%      53768 =C2=B1 12%  sched_debug.cpu#8.n=
r_switches
    178.20 =C2=B1 28%    +309.0%     728.90 =C2=B1  6%  sched_debug.cpu#8.n=
r_uninterruptible
     35466 =C2=B1 13%     +51.7%      53792 =C2=B1 12%  sched_debug.cpu#8.s=
ched_count
     12642 =C2=B1  5%     +87.3%      23677 =C2=B1 35%  sched_debug.cpu#8.t=
twu_count
      2975 =C2=B1 11%     +44.7%       4304 =C2=B1  8%  sched_debug.cpu#8.t=
twu_local
      8491 =C2=B1  3%     -29.2%       6008 =C2=B1 11%  sched_debug.cpu#9.n=
r_load_updates
     42212 =C2=B1 24%     -64.4%      15008 =C2=B1 41%  sched_debug.cpu#9.n=
r_switches
    478.60 =C2=B1  7%     -89.9%      48.30 =C2=B1 42%  sched_debug.cpu#9.n=
r_uninterruptible
     42236 =C2=B1 24%     -60.4%      16734 =C2=B1 43%  sched_debug.cpu#9.s=
ched_count
     18748 =C2=B1 27%     -66.1%       6356 =C2=B1 44%  sched_debug.cpu#9.s=
ched_goidle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/f2fs/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  63bdfe103e368882a304463547e8e0a9ef45455e
  58f1ac5305dc3a07e2f64c8279bde93e02034d62

63bdfe103e368882 58f1ac5305dc3a07e2f64c8279 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    473.57 =C2=B1  0%      +1.0%     478.43 =C2=B1  0%  fsmark.files_per_sec
     15733 =C2=B1  1%      -3.7%      15145 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     22.20 =C2=B1  2%     -27.0%      16.20 =C2=B1  5%  fsmark.time.percent=
_of_cpu_this_job_got
     23.78 =C2=B1  2%     -27.7%      17.20 =C2=B1  4%  fsmark.time.system_=
time
    499188 =C2=B1  0%      -9.1%     453540 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
      1222 =C2=B1  5%     +15.2%       1408 =C2=B1  4%  uptime.idle
     49509 =C2=B1  6%     +87.7%      92928 =C2=B1  5%  proc-vmstat.pgalloc=
_dma32
    351809 =C2=B1  0%     -12.8%     306650 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
     13123 =C2=B1  1%      -6.4%      12281 =C2=B1  1%  vmstat.system.cs
      1242 =C2=B1  1%      -9.3%       1126 =C2=B1  3%  vmstat.system.in
      5366 =C2=B1  4%     -12.7%       4686 =C2=B1  4%  slabinfo.kmalloc-19=
2.active_objs
      5382 =C2=B1  4%     -11.9%       4741 =C2=B1  3%  slabinfo.kmalloc-19=
2.num_objs
      3256 =C2=B1  3%      -9.5%       2945 =C2=B1  4%  slabinfo.kmalloc-25=
6.active_objs
     19775 =C2=B1  1%     +16.7%      23079 =C2=B1  2%  softirqs.BLOCK
     22538 =C2=B1  1%     -11.6%      19922 =C2=B1  2%  softirqs.RCU
     30961 =C2=B1  1%     -21.3%      24380 =C2=B1  9%  softirqs.SCHED
     22.20 =C2=B1  2%     -27.0%      16.20 =C2=B1  5%  time.percent_of_cpu=
_this_job_got
     23.78 =C2=B1  2%     -27.7%      17.20 =C2=B1  4%  time.system_time
      0.98 =C2=B1  6%     -23.2%       0.76 =C2=B1  4%  time.user_time
    122742 =C2=B1  7%     +91.8%     235473 =C2=B1  4%  numa-numastat.node0=
.local_node
    122743 =C2=B1  7%     +91.8%     235474 =C2=B1  4%  numa-numastat.node0=
.numa_hit
    257483 =C2=B1  3%     -44.5%     142790 =C2=B1  8%  numa-numastat.node1=
.local_node
    257484 =C2=B1  3%     -44.5%     142790 =C2=B1  8%  numa-numastat.node1=
.numa_hit
  63728525 =C2=B1  6%     +91.4%   1.22e+08 =C2=B1  2%  cpuidle.C1-NHM.time
    159514 =C2=B1  4%     +26.3%     201419 =C2=B1  6%  cpuidle.C1-NHM.usage
  16677027 =C2=B1  4%     +55.3%   25898113 =C2=B1  4%  cpuidle.C1E-NHM.time
     16159 =C2=B1  7%     +93.6%      31276 =C2=B1  7%  cpuidle.C1E-NHM.usa=
ge
 6.193e+08 =C2=B1  1%     -17.7%  5.097e+08 =C2=B1  0%  cpuidle.C3-NHM.time
    340676 =C2=B1  2%     -43.1%     193945 =C2=B1 15%  cpuidle.C6-NHM.usage
      1.79 =C2=B1  1%     -23.4%       1.37 =C2=B1  3%  turbostat.%Busy
     37.80 =C2=B1  1%      -9.3%      34.30 =C2=B1  2%  turbostat.Avg_MHz
      2121 =C2=B1  1%     +18.4%       2511 =C2=B1  1%  turbostat.Bzy_MHz
     10.30 =C2=B1  3%     +50.7%      15.52 =C2=B1  2%  turbostat.CPU%c1
     48.31 =C2=B1  2%     -30.7%      33.48 =C2=B1  3%  turbostat.CPU%c3
     39.61 =C2=B1  2%     +25.3%      49.63 =C2=B1  2%  turbostat.CPU%c6
     39.50 =C2=B1  1%     -25.6%      29.40 =C2=B1  4%  turbostat.Pkg%pc3
    175092 =C2=B1  3%     +23.1%     215613 =C2=B1  7%  numa-meminfo.node0.=
Active
    160048 =C2=B1  3%     +25.4%     200693 =C2=B1  7%  numa-meminfo.node0.=
Active(file)
    431187 =C2=B1  1%     +13.3%     488494 =C2=B1  4%  numa-meminfo.node0.=
FilePages
    556926 =C2=B1  3%     +11.8%     622412 =C2=B1  5%  numa-meminfo.node0.=
MemUsed
     41286 =C2=B1  2%     +21.6%      50194 =C2=B1  6%  numa-meminfo.node0.=
SReclaimable
    136473 =C2=B1  4%     -24.7%     102701 =C2=B1 14%  numa-meminfo.node1.=
Active
    122572 =C2=B1  4%     -27.6%      88742 =C2=B1 15%  numa-meminfo.node1.=
Active(file)
    361068 =C2=B1  1%     -15.8%     304142 =C2=B1  8%  numa-meminfo.node1.=
FilePages
    477742 =C2=B1  3%     -13.4%     413936 =C2=B1  8%  numa-meminfo.node1.=
MemUsed
     34115 =C2=B1  2%     -26.5%      25089 =C2=B1 13%  numa-meminfo.node1.=
SReclaimable
     40006 =C2=B1  3%     +25.4%      50171 =C2=B1  7%  numa-vmstat.node0.n=
r_active_file
    107790 =C2=B1  1%     +13.3%     122116 =C2=B1  4%  numa-vmstat.node0.n=
r_file_pages
     10320 =C2=B1  2%     +21.6%      12548 =C2=B1  6%  numa-vmstat.node0.n=
r_slab_reclaimable
    201560 =C2=B1  8%     +22.1%     246181 =C2=B1  7%  numa-vmstat.node0.n=
uma_hit
    140880 =C2=B1 11%     +31.8%     185696 =C2=B1  9%  numa-vmstat.node0.n=
uma_local
     30639 =C2=B1  4%     -27.6%      22185 =C2=B1 15%  numa-vmstat.node1.n=
r_active_file
     90262 =C2=B1  1%     -15.8%      76033 =C2=B1  8%  numa-vmstat.node1.n=
r_file_pages
      8527 =C2=B1  2%     -26.5%       6271 =C2=B1 13%  numa-vmstat.node1.n=
r_slab_reclaimable
    253902 =C2=B1  6%     -17.8%     208633 =C2=B1  8%  numa-vmstat.node1.n=
uma_hit
    250233 =C2=B1  6%     -18.2%     204805 =C2=B1  8%  numa-vmstat.node1.n=
uma_local
     17683 =C2=B1  4%     -38.9%      10801 =C2=B1 10%  latency_stats.hits.=
call_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[=
f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   3957940 =C2=B1  3%     -50.9%    1943365 =C2=B1  4%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   2357390 =C2=B1  6%     -63.9%     851598 =C2=B1 25%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs]=
.sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
   5025093 =C2=B1  3%     -39.0%    3066123 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   4181281 =C2=B1  4%     -52.7%    1978526 =C2=B1 15%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_=
file_write_iter.[f2fs].__vfs_write.vfs_write
  15169248 =C2=B1  3%     -43.9%    8508169 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
   1270561 =C2=B1  2%     -43.4%     719012 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].do_write_data_page.[f2fs].f2fs_wri=
te_data_page.[f2fs].__f2fs_writepage.[f2fs].write_cache_pages.f2fs_write_da=
ta_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
   8960743 =C2=B1  3%     -47.4%    4715954 =C2=B1 11%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wri=
te_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
   8649776 =C2=B1  2%     -30.4%    6020880 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
    257376 =C2=B1  5%     -39.8%     155062 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   7270903 =C2=B1  3%     -50.6%    3592159 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write=
_iter.[f2fs].__vfs_write.vfs_write
    853908 =C2=B1  3%     -44.3%     475332 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].w=
rite_cache_pages.f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdata=
write_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
   3402112 =C2=B1  5%     -54.9%    1536044 =C2=B1 20%  latency_stats.sum.c=
all_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2fs=
].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   3332083 =C2=B1  6%     -60.7%    1309373 =C2=B1 23%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].f=
2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fa=
stpath
   4433165 =C2=B1  7%     -65.9%    1511723 =C2=B1 24%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    884362 =C2=B1  6%     -59.5%     358601 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
   1846299 =C2=B1  7%     -55.4%     824341 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_node_page.[f2fs].f2fs_write_node_page.[f2fs].sync_node_pages.[f2fs=
].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64=
_fastpath
   7539782 =C2=B1  3%     -45.2%    4130101 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
   2985986 =C2=B1  6%     -65.7%    1023527 =C2=B1 24%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
   4380610 =C2=B1  3%     -47.4%    2305123 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
      2076 =C2=B1 13%     +68.0%       3488 =C2=B1 26%  sched_debug.cfs_rq[=
0]:/.exec_clock
     44965 =C2=B1 10%     -21.9%      35096 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     41879 =C2=B1  7%     -53.4%      19512 =C2=B1 16%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     -3093 =C2=B1-157%    +404.0%     -15591 =C2=B1-36%  sched_debug.cfs_rq=
[10]:/.spread0
     18593 =C2=B1 20%     -44.9%      10237 =C2=B1 26%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     42966 =C2=B1  9%     -52.1%      20596 =C2=B1 13%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     -2006 =C2=B1-387%    +623.0%     -14509 =C2=B1-31%  sched_debug.cfs_rq=
[12]:/.spread0
     17227 =C2=B1 13%     -40.1%      10324 =C2=B1 20%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     41959 =C2=B1  5%     -49.6%      21165 =C2=B1 14%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     47240 =C2=B1  4%     -40.0%      28366 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     36398 =C2=B1 18%     -34.4%      23869 =C2=B1 12%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     51725 =C2=B1 11%     -30.8%      35783 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     47731 =C2=B1  5%     -24.2%      36200 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     33561 =C2=B1 12%     -33.2%      22425 =C2=B1 18%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     35528 =C2=B1  4%     +58.4%      56284 =C2=B1 16%  sched_debug.cpu#0.n=
r_switches
   -639.70 =C2=B1 -4%     +68.8%      -1080 =C2=B1 -4%  sched_debug.cpu#0.n=
r_uninterruptible
     38596 =C2=B1  5%     +51.5%      58477 =C2=B1 15%  sched_debug.cpu#0.s=
ched_count
     16464 =C2=B1  5%     +53.8%      25316 =C2=B1 18%  sched_debug.cpu#0.s=
ched_goidle
     50403 =C2=B1  2%     +20.5%      60739 =C2=B1  6%  sched_debug.cpu#0.t=
twu_count
      9729 =C2=B1  8%     +56.7%      15249 =C2=B1  7%  sched_debug.cpu#0.t=
twu_local
   -166.30 =C2=B1-20%     -87.1%     -21.40 =C2=B1-115%  sched_debug.cpu#1.=
nr_uninterruptible
    320.00 =C2=B1 16%     -34.8%     208.60 =C2=B1 10%  sched_debug.cpu#10.=
nr_uninterruptible
      5591 =C2=B1  4%     -20.7%       4436 =C2=B1  7%  sched_debug.cpu#11.=
nr_load_updates
     28636 =C2=B1 43%     -68.0%       9159 =C2=B1 74%  sched_debug.cpu#11.=
nr_switches
    220.80 =C2=B1 15%     -85.4%      32.20 =C2=B1 51%  sched_debug.cpu#11.=
nr_uninterruptible
     28725 =C2=B1 42%     -67.5%       9349 =C2=B1 71%  sched_debug.cpu#11.=
sched_count
     13090 =C2=B1 47%     -70.1%       3909 =C2=B1 83%  sched_debug.cpu#11.=
sched_goidle
    352.00 =C2=B1  5%     -32.5%     237.50 =C2=B1 10%  sched_debug.cpu#12.=
nr_uninterruptible
      1622 =C2=B1  8%     +53.6%       2492 =C2=B1 30%  sched_debug.cpu#12.=
ttwu_local
      5426 =C2=B1  2%     -19.3%       4380 =C2=B1  8%  sched_debug.cpu#13.=
nr_load_updates
    240.20 =C2=B1 16%     -85.4%      35.10 =C2=B1 47%  sched_debug.cpu#13.=
nr_uninterruptible
    332.20 =C2=B1  6%     -29.3%     234.80 =C2=B1 16%  sched_debug.cpu#14.=
nr_uninterruptible
      1567 =C2=B1  5%     +43.2%       2244 =C2=B1 29%  sched_debug.cpu#14.=
ttwu_local
      5959 =C2=B1  3%     -18.5%       4857 =C2=B1  8%  sched_debug.cpu#15.=
nr_load_updates
    237.10 =C2=B1 16%     -83.4%      39.40 =C2=B1 58%  sched_debug.cpu#15.=
nr_uninterruptible
     30821 =C2=B1  6%     +39.6%      43025 =C2=B1 15%  sched_debug.cpu#2.n=
r_switches
   -175.30 =C2=B1-19%     -84.2%     -27.70 =C2=B1-124%  sched_debug.cpu#2.=
nr_uninterruptible
     13625 =C2=B1  6%     +39.9%      19065 =C2=B1 18%  sched_debug.cpu#2.s=
ched_goidle
     12767 =C2=B1  7%     +34.0%      17109 =C2=B1 29%  sched_debug.cpu#2.t=
twu_count
   -176.70 =C2=B1-27%     -84.7%     -27.00 =C2=B1-58%  sched_debug.cpu#3.n=
r_uninterruptible
     31533 =C2=B1  4%     +32.5%      41792 =C2=B1 18%  sched_debug.cpu#4.n=
r_switches
   -270.20 =C2=B1-15%    -102.7%       7.30 =C2=B1420%  sched_debug.cpu#4.n=
r_uninterruptible
     14029 =C2=B1  4%     +31.5%      18447 =C2=B1 21%  sched_debug.cpu#4.s=
ched_goidle
     14218 =C2=B1  3%     +21.2%      17234 =C2=B1 19%  sched_debug.cpu#4.t=
twu_count
      7669 =C2=B1  8%     -18.9%       6219 =C2=B1  9%  sched_debug.cpu#5.n=
r_load_updates
   -163.00 =C2=B1-22%     -86.5%     -22.00 =C2=B1-49%  sched_debug.cpu#5.n=
r_uninterruptible
   -276.50 =C2=B1 -9%     -97.9%      -5.70 =C2=B1-453%  sched_debug.cpu#6.=
nr_uninterruptible
      7764 =C2=B1 11%     -18.8%       6306 =C2=B1 11%  sched_debug.cpu#7.n=
r_load_updates
     32838 =C2=B1 30%     -48.8%      16811 =C2=B1 42%  sched_debug.cpu#7.n=
r_switches
   -159.10 =C2=B1-14%     -92.7%     -11.60 =C2=B1-184%  sched_debug.cpu#7.=
nr_uninterruptible
     34286 =C2=B1 28%     -44.4%      19053 =C2=B1 40%  sched_debug.cpu#7.s=
ched_count
     14999 =C2=B1 32%     -50.3%       7447 =C2=B1 45%  sched_debug.cpu#7.s=
ched_goidle
      6160 =C2=B1  3%     +12.4%       6925 =C2=B1  4%  sched_debug.cpu#8.n=
r_load_updates
     17475 =C2=B1  6%     +57.5%      27531 =C2=B1 18%  sched_debug.cpu#8.n=
r_switches
     89.40 =C2=B1 24%    +319.9%     375.40 =C2=B1 15%  sched_debug.cpu#8.n=
r_uninterruptible
     17497 =C2=B1  6%     +57.4%      27546 =C2=B1 18%  sched_debug.cpu#8.s=
ched_count
      7280 =C2=B1  6%     +55.2%      11298 =C2=B1 22%  sched_debug.cpu#8.s=
ched_goidle
      6672 =C2=B1  9%     +49.4%       9970 =C2=B1 20%  sched_debug.cpu#8.t=
twu_count
      5691 =C2=B1  5%     -20.6%       4521 =C2=B1  9%  sched_debug.cpu#9.n=
r_load_updates
     22691 =C2=B1 31%     -54.3%      10374 =C2=B1 56%  sched_debug.cpu#9.n=
r_switches
    247.10 =C2=B1  7%     -84.9%      37.40 =C2=B1 39%  sched_debug.cpu#9.n=
r_uninterruptible
     23033 =C2=B1 29%     -46.7%      12269 =C2=B1 43%  sched_debug.cpu#9.s=
ched_count
     10070 =C2=B1 35%     -55.4%       4494 =C2=B1 63%  sched_debug.cpu#9.s=
ched_goidle


lkp-ne04: Nehalem-EP
Memory: 12G


                             fsmark.time.system_time

  40 +*----------**--*-----*--**-*-----------------------------------------=
-+
     *  **.**.**   *  *.**  *    :                    *.**. *. **.*        =
 |
  38 ++                           :             *.* .*     *  *    *.*     =
 |
  36 ++                           * .*       .* :  *                       =
 |
     |                             *  :  *.**  *                           =
 |
  34 ++                               *. :                                 =
 |
     |                                  *                                  =
 |
  32 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  28 OO    OO OO  OO        O    O O O  OO  O O          O    O         O  =
 O
     |  OO       O   OO O             O        O     O             O       =
 |
  26 ++                  O O  OO  O        O    O OO  O O  OO  OO O  OO  O =
O|
     |                                                                     =
 |
  24 ++--------------------------------------------------------------------=
-+


                                time.system_time

  40 +*----------**--*-----*--**-*-----------------------------------------=
-+
     *  **.**.**   *  *.**  *    :                    *.**. *. **.*        =
 |
  38 ++                           :             *.* .*     *  *    *.*     =
 |
  36 ++                           * .*       .* :  *                       =
 |
     |                             *  :  *.**  *                           =
 |
  34 ++                               *. :                                 =
 |
     |                                  *                                  =
 |
  32 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  28 OO    OO OO  OO        O    O O O  OO  O O          O    O         O  =
 O
     |  OO       O   OO O             O        O     O             O       =
 |
  26 ++                  O O  OO  O        O    O OO  O O  OO  OO O  OO  O =
O|
     |                                                                     =
 |
  24 ++--------------------------------------------------------------------=
-+


                            proc-vmstat.numa_pte_updates

  14000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  12000 ++     *  *                                                        =
 |
        |      : ::              *                *    *      *  **.*      =
 |
  10000 **    : :: :        .*   :*    *       * + *   :+     :: :  :      =
 |
        | + *.* *  * .**.  *  : :  +  ::      + *   :.*  ***.* : :   :     =
 |
   8000 ++ *        *    **   *.*   * : : .***      *           :    *     =
 |
        |                            *  **                      *          =
 |
   6000 ++                                                                 =
 |
        |                                                                  =
 |
   4000 ++                                                                 =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        |                                                                  =
 |
      0 OO-OO-OOO-OOO-OO-OOO-OO-OOO-OO-OOO-OOO-OO-OOO-OO-OOO-OO-OOO-OOO-OO-=
OO




	[*] bisect-good sample
	[O] bisect-bad  sample

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

--===============7311423104850719249==
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
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogODMyNzU5MjQ0ZGYy
ZDRjZDhiN2EzZjZhMjkyMTcxNTE4ZjBhOWY3Ygptb2RlbDogTmVoYWxlbS1FUAptZW1vcnk6IDEy
RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNF
QkEtcGFydDMiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzMTIwMDI2
QVNfNU1TMDdIQTItcGFydDIiCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRh
LVNUMzUwMDUxNE5TXzlXSjAzRUJBLXBhcnQxIgpjYXRlZ29yeTogYmVuY2htYXJrCml0ZXJhdGlv
bnM6IDF4Cm5yX3RocmVhZHM6IDMydApkaXNrOiAxSERECmZzOiBmMmZzCmZzMjogCmZzbWFyazoK
ICBmaWxlc2l6ZTogNUsKICB0ZXN0X3NpemU6IDQwME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZv
cmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAy
NTZmcGQKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiBsa3AtbmUwNAp0Ym94X2dyb3VwOiBsa3AtbmUw
NAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDctMTYgMjA6MDY6MTAu
NjUyOTMyMjc1ICswODowMAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6
IDgzMjc1OTI0NGRmMmQ0Y2Q4YjdhM2Y2YTI5MjE3MTUxOGYwYTlmN2IKYmFzZV9jb21taXQ6IGJj
MDE5NWFhZDBkYWEyYWQ1YjBkNzZjY2UyMmIxNjdiYzM0MzU1OTAKYnJhbmNoOiBsaW51eC1kZXZl
bC9kZXZlbC1ob3VybHktMjAxNTA3MTcwMQprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvODMyNzU5MjQ0ZGYyZDRjZDhiN2EzZjZhMjkyMTcxNTE4ZjBhOWY3Yi92bWxpbnV6
LTQuMi4wLXJjMi0wMTk4NS1nODMyNzU5MiIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFI
REQtZjJmcy01Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3AtbmUwNC9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvODMyNzU5MjQ0ZGYy
ZDRjZDhiN2EzZjZhMjkyMTcxNTE4ZjBhOWY3Yi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVk
L2xrcC1uZTA0L2N5Y2xpY19mc21hcmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZjJmcy01Sy00
MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC04
MzI3NTkyNDRkZjJkNGNkOGI3YTNmNmEyOTIxNzE1MThmMGE5ZjdiLTIwMTUwNzE2LTUzNzQwLTF3
aXV3dTktMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDctMTcgMDI6MjM6NTguMTk2NDk4MDU5
ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMTAyMy40NTk5OTk5OTk5OTk5
CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpi
b290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Av
c2NoZWR1bGVkL2xrcC1uZTA0L2N5Y2xpY19mc21hcmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQt
ZjJmcy01Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1DWUNM
SUNfSEVBRC04MzI3NTkyNDRkZjJkNGNkOGI3YTNmNmEyOTIxNzE1MThmMGE5ZjdiLTIwMTUwNzE2
LTUzNzQwLTF3aXV3dTktMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVs
Ci0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDcxNzAxCi0gY29tbWl0PTgz
Mjc1OTI0NGRmMmQ0Y2Q4YjdhM2Y2YTI5MjE3MTUxOGYwYTlmN2IKLSBCT09UX0lNQUdFPS9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS84MzI3NTkyNDRkZjJkNGNkOGI3YTNmNmEyOTIxNzE1
MThmMGE5ZjdiL3ZtbGludXotNC4yLjAtcmMyLTAxOTg1LWc4MzI3NTkyCi0gbWF4X3VwdGltZT0x
MDIzCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQt
ZjJmcy01Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3AtbmUwNC9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvODMyNzU5MjQ0ZGYyZDRj
ZDhiN2EzZjZhMjkyMTcxNTE4ZjBhOWY3Yi8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVh
cmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGlj
PWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91
dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9v
cHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAs
MTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xr
cC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvODMyNzU5MjQ0ZGYyZDRjZDhiN2EzZjZhMjkyMTcxNTE4ZjBhOWY3Yi9tb2R1bGVz
LmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1
bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNn
eiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAyNy43MiAxMy42OCA1LjMzIDEvMjUwIDUz
ODUKc3RhcnRfdGltZTogJzE0MzcwNzEwOTcnCmVuZF90aW1lOiAnMTQzNzA3MTI3MCcKdmVyc2lv
bjogIi9sa3AvbGtwLy5zcmMtMjAxNTA3MTYtMDg1NTA1Igo=

--===============7311423104850719249==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm1rZnMgLXQgZjJmcyAvZGV2L3NkYTMK
bW91bnQgLXQgZjJmcyAvZGV2L3NkYTMgL2ZzL3NkYTMKLi9mc19tYXJrIC1kIC9mcy9zZGEzLzEg
LWQgL2ZzL3NkYTMvMiAtZCAvZnMvc2RhMy8zIC1kIC9mcy9zZGEzLzQgLWQgL2ZzL3NkYTMvNSAt
ZCAvZnMvc2RhMy82IC1kIC9mcy9zZGEzLzcgLWQgL2ZzL3NkYTMvOCAtZCAvZnMvc2RhMy85IC1k
IC9mcy9zZGEzLzEwIC1kIC9mcy9zZGEzLzExIC1kIC9mcy9zZGEzLzEyIC1kIC9mcy9zZGEzLzEz
IC1kIC9mcy9zZGEzLzE0IC1kIC9mcy9zZGEzLzE1IC1kIC9mcy9zZGEzLzE2IC1kIC9mcy9zZGEz
LzE3IC1kIC9mcy9zZGEzLzE4IC1kIC9mcy9zZGEzLzE5IC1kIC9mcy9zZGEzLzIwIC1kIC9mcy9z
ZGEzLzIxIC1kIC9mcy9zZGEzLzIyIC1kIC9mcy9zZGEzLzIzIC1kIC9mcy9zZGEzLzI0IC1kIC9m
cy9zZGEzLzI1IC1kIC9mcy9zZGEzLzI2IC1kIC9mcy9zZGEzLzI3IC1kIC9mcy9zZGEzLzI4IC1k
IC9mcy9zZGEzLzI5IC1kIC9mcy9zZGEzLzMwIC1kIC9mcy9zZGEzLzMxIC1kIC9mcy9zZGEzLzMy
IC1EIDE2IC1OIDI1NiAtbiAyNTYwIC1MIDEgLVMgMSAtcyA1MTIwCg==

--===============7311423104850719249==--

