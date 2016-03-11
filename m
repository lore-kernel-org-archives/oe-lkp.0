Content-Type: multipart/mixed; boundary="===============8765744636029211166=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [RAID5] 6ab2a4b806: 91.9% fsmark.app_overhead
Date: Fri, 11 Mar 2016 10:03:16 +0800
Message-ID: <20160311020316.GB13081@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8765744636029211166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 6ab2a4b806ae21b6c3e47c5ff1285ec06d505325 ("RAID5: revert e9e4c377e2f=
563 to fix a livelock")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/md/nr_threads=
/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/performance/8BRD_12G/4M/xfs/1x/x86_64-rhel/RAID5/64t/debian-x86_6=
4-2015-02-07.cgz/fsyncBeforeClose/lkp-hsx02/60G/fsmark

commit: =

  27a353c026a879a1001e5eac4bda75b16262c44a
  6ab2a4b806ae21b6c3e47c5ff1285ec06d505325

27a353c026a879a1 6ab2a4b806ae21b6c3e47c5ff1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    592411 =C2=B1  2%     +91.9%    1136931 =C2=B1 11%  fsmark.app_overhead
     98.37 =C2=B1  1%     -21.9%      76.80 =C2=B1  2%  fsmark.files_per_sec
    188.95 =C2=B1  0%     +59.9%     302.16 =C2=B1  3%  fsmark.time.elapsed=
_time
    188.95 =C2=B1  0%     +59.9%     302.16 =C2=B1  3%  fsmark.time.elapsed=
_time.max
     20813 =C2=B1  4%    +290.1%      81196 =C2=B1  4%  fsmark.time.minor_p=
age_faults
    165.00 =C2=B1  2%    +553.8%       1078 =C2=B1  7%  fsmark.time.percent=
_of_cpu_this_job_got
    312.06 =C2=B1  3%    +947.5%       3269 =C2=B1 10%  fsmark.time.system_=
time
  10132990 =C2=B1  2%    +465.7%   57325950 =C2=B1  7%  fsmark.time.volunta=
ry_context_switches
    171460 =C2=B1  2%     -24.4%     129549 =C2=B1  6%  meminfo.Writeback
    830948 =C2=B1 85%    +339.1%    3649060 =C2=B1 89%  numa-numastat.node3=
.numa_foreign
      2814 =C2=B1  1%     -10.4%       2523 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
      2870 =C2=B1  1%     -12.1%       2523 =C2=B1  0%  slabinfo.kmalloc-40=
96.num_objs
    285.82 =C2=B1  0%     +39.4%     398.30 =C2=B1  2%  uptime.boot
     40413 =C2=B1  0%     +33.4%      53898 =C2=B1  2%  uptime.idle
      1.92 =C2=B1  1%    +345.0%       8.53 =C2=B1  6%  turbostat.%Busy
     55.25 =C2=B1  1%    +347.1%     247.00 =C2=B1  6%  turbostat.Avg_MHz
    356.24 =C2=B1  0%      +5.5%     375.77 =C2=B1  0%  turbostat.PkgWatt
      7994 =C2=B1  3%     +26.5%      10115 =C2=B1  5%  softirqs.NET_RX
    308842 =C2=B1 48%    +222.4%     995686 =C2=B1 12%  softirqs.RCU
    227016 =C2=B1 26%    +477.0%    1309870 =C2=B1 16%  softirqs.SCHED
    743051 =C2=B1 31%    +195.6%    2196488 =C2=B1  8%  softirqs.TIMER
    329656 =C2=B1  0%     -37.0%     207541 =C2=B1  3%  vmstat.io.bo
      1.75 =C2=B1 24%    +500.0%      10.50 =C2=B1  4%  vmstat.procs.r
    108684 =C2=B1  1%    +249.1%     379378 =C2=B1  3%  vmstat.system.cs
      3836 =C2=B1  2%    +257.4%      13711 =C2=B1  5%  vmstat.system.in
    188.95 =C2=B1  0%     +59.9%     302.16 =C2=B1  3%  time.elapsed_time
    188.95 =C2=B1  0%     +59.9%     302.16 =C2=B1  3%  time.elapsed_time.m=
ax
     20813 =C2=B1  4%    +290.1%      81196 =C2=B1  4%  time.minor_page_fau=
lts
    165.00 =C2=B1  2%    +553.8%       1078 =C2=B1  7%  time.percent_of_cpu=
_this_job_got
    312.06 =C2=B1  3%    +947.5%       3269 =C2=B1 10%  time.system_time
  10132990 =C2=B1  2%    +465.7%   57325950 =C2=B1  7%  time.voluntary_cont=
ext_switches
      2497 =C2=B1142%     -87.3%     316.75 =C2=B1 15%  numa-meminfo.node1.=
Inactive(anon)
      2591 =C2=B1137%     -84.5%     401.50 =C2=B1 11%  numa-meminfo.node1.=
Shmem
     16695 =C2=B1  1%     -16.9%      13875 =C2=B1  9%  numa-meminfo.node1.=
Unevictable
     16915 =C2=B1  1%     -17.4%      13969 =C2=B1  8%  numa-meminfo.node2.=
Unevictable
      5698 =C2=B1 22%     +90.1%      10831 =C2=B1 24%  numa-meminfo.node3.=
Active(anon)
      5660 =C2=B1 22%     +89.2%      10707 =C2=B1 24%  numa-meminfo.node3.=
AnonPages
    550.25 =C2=B1 22%   +1135.0%       6795 =C2=B1 50%  numa-meminfo.node3.=
Inactive(anon)
    626.25 =C2=B1 19%   +1002.1%       6902 =C2=B1 50%  numa-meminfo.node3.=
Shmem
    383.75 =C2=B1  3%     +11.7%     428.75 =C2=B1  2%  numa-vmstat.node1.n=
r_alloc_batch
    623.75 =C2=B1142%     -87.4%      78.75 =C2=B1 16%  numa-vmstat.node1.n=
r_inactive_anon
    647.25 =C2=B1137%     -84.6%     100.00 =C2=B1 11%  numa-vmstat.node1.n=
r_shmem
      4173 =C2=B1  1%     -16.9%       3468 =C2=B1  9%  numa-vmstat.node1.n=
r_unevictable
      4228 =C2=B1  1%     -17.4%       3492 =C2=B1  8%  numa-vmstat.node2.n=
r_unevictable
      1424 =C2=B1 22%     +90.1%       2708 =C2=B1 24%  numa-vmstat.node3.n=
r_active_anon
      1415 =C2=B1 22%     +89.2%       2677 =C2=B1 24%  numa-vmstat.node3.n=
r_anon_pages
    137.00 =C2=B1 22%   +1139.8%       1698 =C2=B1 50%  numa-vmstat.node3.n=
r_inactive_anon
    156.00 =C2=B1 19%   +1005.8%       1725 =C2=B1 50%  numa-vmstat.node3.n=
r_shmem
     36.67 =C2=B1130%  +52543.9%      19302 =C2=B1139%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
      3.75 =C2=B1 11%   +6480.0%     246.75 =C2=B1101%  proc-vmstat.nr_page=
s_scanned
     42860 =C2=B1  2%     -24.4%      32415 =C2=B1  6%  proc-vmstat.nr_writ=
eback
     10144 =C2=B1  8%    +593.7%      70377 =C2=B1  4%  proc-vmstat.numa_hi=
nt_faults
      5990 =C2=B1 14%    +608.3%      42426 =C2=B1  4%  proc-vmstat.numa_hi=
nt_faults_local
      1310 =C2=B1 14%    +365.9%       6105 =C2=B1 11%  proc-vmstat.numa_pa=
ges_migrated
     13530 =C2=B1  6%    +452.3%      74730 =C2=B1  4%  proc-vmstat.numa_pt=
e_updates
      4444 =C2=B1  9%    +476.1%      25606 =C2=B1101%  proc-vmstat.pageout=
run
    523627 =C2=B1  1%     +67.6%     877482 =C2=B1  3%  proc-vmstat.pgfault
      1310 =C2=B1 14%    +365.9%       6105 =C2=B1 11%  proc-vmstat.pgmigra=
te_success
     16384 =C2=B1  4%     +72.5%      28257 =C2=B1 15%  proc-vmstat.slabs_s=
canned
   2452516 =C2=B1 62%    +165.0%    6499322 =C2=B1123%  latency_stats.avg.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_alloc_read_agfl.xfs_alloc_fix_freelist.xfs_alloc_vextent.xf=
s_ialloc_ag_alloc.xfs_dialloc.xfs_ialloc
    619509 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_l=
ookup.xfs_alloc_lookup_eq.xfs_alloc_fixup_trees.xfs_alloc_ag_vextent_size
    668825 =C2=B1167%     -74.7%     169025 =C2=B1 94%  latency_stats.avg.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_l=
ookup.xfs_inobt_insert.xfs_ialloc_ag_alloc.xfs_dialloc
      0.00 =C2=B1 -1%      +Inf%   10533842 =C2=B1100%  latency_stats.avg.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_da_read_buf.xfs_dir3_block_read.xfs_dir2_block_addname.xfs_=
dir_createname.xfs_create.xfs_generic_create
   1434223 =C2=B1 33%    +205.1%    4375501 =C2=B1 39%  latency_stats.avg.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_imap_to_bp.xfs_iread.xfs_iget.xfs_ialloc.xfs_dir_ialloc.xfs=
_create
      1134 =C2=B1173%  +1.6e+05%    1818032 =C2=B1153%  latency_stats.avg.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_allo=
c_vextent.xfs_ialloc_ag_alloc.xfs_dialloc
     35260 =C2=B1  6%    +280.2%     134055 =C2=B1 12%  latency_stats.hits.=
raid5_get_active_stripe.[raid456].raid5_make_request.[raid456].md_make_requ=
est.generic_make_request.submit_bio._xfs_buf_ioapply.xfs_buf_submit.xlog_bd=
strat.xlog_sync.xlog_state_release_iclog._xfs_log_force_lsn.xfs_file_fsync
   9385649 =C2=B1  3%    +505.1%   56794939 =C2=B1  7%  latency_stats.hits.=
raid5_get_active_stripe.[raid456].raid5_make_request.[raid456].md_make_requ=
est.generic_make_request.submit_bio.xfs_submit_ioend_bio.xfs_submit_ioend.x=
fs_vm_writepage.__writepage.write_cache_pages.generic_writepages.xfs_vm_wri=
tepages
   3807550 =C2=B1 25%    +155.1%    9711263 =C2=B1 73%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_alloc_read_agfl.xfs_alloc_fix_freelist.xfs_alloc_vextent.xf=
s_bmap_btalloc.xfs_bmap_alloc.xfs_bmapi_write
   2688649 =C2=B1 59%    +187.4%    7727816 =C2=B1117%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_alloc_read_agfl.xfs_alloc_fix_freelist.xfs_alloc_vextent.xf=
s_ialloc_ag_alloc.xfs_dialloc.xfs_ialloc
    673991 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_l=
ookup.xfs_alloc_lookup_eq.xfs_alloc_fixup_trees.xfs_alloc_ag_vextent_size
    668825 =C2=B1167%     -74.6%     169683 =C2=B1 94%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_l=
ookup.xfs_inobt_insert.xfs_ialloc_ag_alloc.xfs_dialloc
      0.00 =C2=B1 -1%      +Inf%   14261726 =C2=B1 73%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_da_read_buf.xfs_dir3_block_read.xfs_dir2_block_addname.xfs_=
dir_createname.xfs_create.xfs_generic_create
   1260860 =C2=B1 73%    +328.3%    5400244 =C2=B1169%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_da_read_buf.xfs_dir3_leaf_read.xfs_dir2_leaf_addname.xfs_di=
r_createname.xfs_create.xfs_generic_create
   5058489 =C2=B1 54%    +148.5%   12570469 =C2=B1 76%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_da_read_buf.xfs_dir3_leaf_read.xfs_dir2_leaf_lookup_int.xfs=
_dir2_leaf_lookup.xfs_dir_lookup.xfs_lookup
      1134 =C2=B1173%  +4.8e+05%    5434961 =C2=B1154%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_allo=
c_vextent.xfs_ialloc_ag_alloc.xfs_dialloc
   6967127 =C2=B1 59%     +82.8%   12733733 =C2=B1127%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_alloc_read_agfl.xfs_alloc_fix_freelist.xfs_alloc_vextent.xf=
s_ialloc_ag_alloc.xfs_dialloc.xfs_ialloc
  11217182 =C2=B1 27%    +199.8%   33628397 =C2=B1 72%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_alloc_read_agfl.xfs_alloc_fix_freelist.xfs_free_extent.xfs_=
trans_free_extent.xfs_bmap_finish.xfs_itruncate_extents
    674368 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_l=
ookup.xfs_alloc_lookup_eq.xfs_alloc_fixup_trees.xfs_alloc_ag_vextent_size
    668825 =C2=B1167%     -50.1%     333621 =C2=B1 97%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_l=
ookup.xfs_inobt_insert.xfs_ialloc_ag_alloc.xfs_dialloc
      0.00 =C2=B1 -1%      +Inf%   51551059 =C2=B1 88%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_da_read_buf.xfs_dir3_block_read.xfs_dir2_block_addname.xfs_=
dir_createname.xfs_create.xfs_generic_create
  87014211 =C2=B1 98%    +420.2%  4.527e+08 =C2=B1 36%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_da_read_buf.xfs_dir3_block_read.xfs_dir2_block_lookup_int.x=
fs_dir2_block_lookup.xfs_dir_lookup.xfs_lookup
   1318029 =C2=B1 69%    +573.2%    8872791 =C2=B1169%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_da_read_buf.xfs_dir3_leaf_read.xfs_dir2_leaf_addname.xfs_di=
r_createname.xfs_create.xfs_generic_create
  60188444 =C2=B1 39%    +368.4%  2.819e+08 =C2=B1 29%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_imap_to_bp.xfs_iread.xfs_iget.xfs_ialloc.xfs_dir_ialloc.xfs=
_create
  81840534 =C2=B1 50%    +295.9%   3.24e+08 =C2=B1 29%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_allo=
c_vextent.xfs_bmap_btalloc.xfs_bmap_alloc
      1134 =C2=B1173%  +4.8e+05%    5435006 =C2=B1154%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_allo=
c_vextent.xfs_ialloc_ag_alloc.xfs_dialloc
  1.69e+08 =C2=B1 42%    +381.8%  8.144e+08 =C2=B1 23%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc.xfs_ialloc.xfs_dir=
_ialloc.xfs_create
    411.75 =C2=B1115%   +3043.3%      12942 =C2=B1 21%  latency_stats.sum.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.do_swap_page.ha=
ndle_mm_fault.__do_page_fault.do_page_fault.page_fault
     70443 =C2=B1 38%    +284.3%     270746 =C2=B1 59%  latency_stats.sum.x=
log_cil_force_lsn._xfs_log_force_lsn.xfs_file_fsync.vfs_fsync_range.do_fsyn=
c.SyS_fsync.entry_SYSCALL_64_fastpath

lkp-hsx02: Brickland Haswell-EX
Memory: 128G


                                    uptime.boot

  450 ++-------------------------------------------------------------------=
-+
      O         O  O  O  O     O   O  O               O           O        =
 |
  400 ++ O  O               O            O  O  O   O     O  O  O      O    =
 |
  350 ++                                                                   =
 |
      |                                                                    =
 |
  300 *+.*..*...*..*..*..*..*      *..*..*..*..*...*..*..*..*..*..*...*..*.=
.*
  250 ++                    :      :                                       =
 |
      |                      :    :                                        =
 |
  200 ++                     :    :                                        =
 |
  150 ++                     :   :                                         =
 |
      |                       :  :                                         =
 |
  100 ++                      : :                                          =
 |
   50 ++                      : :                                          =
 |
      |                        :                                           =
 |
    0 ++-----------------------*-------------------------------------------=
-+


                                     uptime.idle

  60000 ++-----------------------O-----------------------------------------=
-+
        O  O     O  O  O   O        O  O     O     O  O         O  O       =
 |
  50000 ++    O               O           O     O        O   O        O    =
 |
        |                                                                  =
 |
        |          .*..                        .*..  .*..                  =
 |
  40000 *+.*..*..*.    *...*..*     *..*..*..*.    *.    *...*..*..*..*..*.=
.*
        |                     :     :                                      =
 |
  30000 ++                     :   :                                       =
 |
        |                      :   :                                       =
 |
  20000 ++                     :   :                                       =
 |
        |                       : :                                        =
 |
        |                       : :                                        =
 |
  10000 ++                      : :                                        =
 |
        |                        :                                         =
 |
      0 ++-----------------------*-----------------------------------------=
-+


                                 turbostat.Avg_MHz

  300 ++-------------------------------------------------------------------=
-+
      O                        O      O                           O        =
 |
  250 ++                 O                                                 =
 |
      |         O  O  O     O      O     O  O  O   O  O  O  O  O      O    =
 |
      |  O  O                                                              =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
      |                                                                    =
 |
      *..*..*...*..*..                        .*...*..*..*..*..  .*...*..*.=
.*
   50 ++              *..*..*..   .*..*..*..*.                 *.          =
 |
      |                         ..                                         =
 |
    0 ++-----------------------*-------------------------------------------=
-+


                                 turbostat._Busy

  10 ++--------------------------------------------------------------------=
-+
   9 O+                        O     O                            O        =
 |
     |                  O                   O     O  O         O      O    =
 |
   8 ++ O      O  O  O      O     O      O     O         O  O              =
 |
   7 ++    O                                                               =
 |
     |                                                                     =
 |
   6 ++                                                                    =
 |
   5 ++                                                                    =
 |
   4 ++                                                                    =
 |
     |                                                                     =
 |
   3 ++                                                                    =
 |
   2 *+.*..*...*..*..  .*...      *..      .*..*..*..*...*..*..*..*...*..*.=
.*
     |               *.     *..  +   *...*.                                =
 |
   1 ++                         +                                          =
 |
   0 ++------------------------*-------------------------------------------=
-+


                                 turbostat.PkgWatt

  400 ++-------------------------------------------------------------------=
-+
      O  O  O   O  O  O  O  O  O   O  O  O  O  O   O  O  O  O  O  O   O    =
 |
  350 *+.*..*...*..*..*..*..*      *..*..*..*..*...*..*..*..*..*..*...*..*.=
.*
  300 ++                    :      :                                       =
 |
      |                      :    :                                        =
 |
  250 ++                     :    :                                        =
 |
      |                      :    :                                        =
 |
  200 ++                     :   :                                         =
 |
      |                       :  :                                         =
 |
  150 ++                      :  :                                         =
 |
  100 ++                      : :                                          =
 |
      |                       : :                                          =
 |
   50 ++                       ::                                          =
 |
      |                        :                                           =
 |
    0 ++-----------------------*-------------------------------------------=
-+


                                  fsmark.app_overhead

  1.4e+06 ++----------------------------O--------------------------O-------=
-+
          |                                                                =
 |
  1.2e+06 ++          O           O        O     O                         =
 |
          O  O     O                                            O     O    =
 |
    1e+06 ++             O  O  O     O        O     O     O  O             =
 |
          |     O                                      O                   =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 *+.*..*..*..*..*..*..*     *..*..*..*..*..*..*..*..*..*..*..*..*.=
.*
          |                     :    :                                     =
 |
   400000 ++                    :   :                                      =
 |
          |                      :  :                                      =
 |
   200000 ++                     : :                                       =
 |
          |                       ::                                       =
 |
        0 ++----------------------*----------------------------------------=
-+


                              fsmark.time.system_time

  4500 ++------------------------------------------------------------------=
-+
       |                        O                                          =
 |
  4000 O+                             O                            O       =
 |
  3500 ++                 O                                                =
 |
       |            O              O         O     O  O        O      O    =
 |
  3000 ++       O      O     O            O     O        O  O              =
 |
  2500 ++ O  O                                                             =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
   500 ++                                                                  =
 |
       *..*..*..*...*..*..*..*..  .*..*...*..*..*..*..*..*..*..*...*..*..*.=
.*
     0 ++-----------------------*------------------------------------------=
-+


                      fsmark.time.percent_of_cpu_this_job_got

  1400 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1200 O+                       O     O                            O       =
 |
       |                  O                  O     O  O        O      O    =
 |
  1000 ++       O   O  O     O     O      O     O        O  O              =
 |
       |  O  O                                                             =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   400 ++                                                                  =
 |
       |                                                                   =
 |
   200 *+.*..*..*...*..  .*..                  .*..*..*..*..*..*...*..*..*.=
.*
       |               *.    *..  .*..*...*..*.                            =
 |
     0 ++-----------------------*------------------------------------------=
-+


                             fsmark.time.elapsed_time

  350 ++-----------------------O-------------------------------------------=
-+
      O                            O  O                           O        =
 |
  300 ++ O  O   O  O  O  O  O            O  O  O   O  O  O  O  O      O    =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 *+.*..*...*..*..                           ..*..  .*..     .*...*..*.=
.|
      |               *..*..*      *..*..*..*..*.     *.    *..*.          =
 *
  150 ++                    :     :                                        =
 |
      |                      :    :                                        =
 |
  100 ++                     :   :                                         =
 |
      |                       :  :                                         =
 |
   50 ++                      : :                                          =
 |
      |                        ::                                          =
 |
    0 ++-----------------------*-------------------------------------------=
-+


                           fsmark.time.elapsed_time.max

  350 ++-----------------------O-------------------------------------------=
-+
      O                            O  O                           O        =
 |
  300 ++ O  O   O  O  O  O  O            O  O  O   O  O  O  O  O      O    =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 *+.*..*...*..*..                           ..*..  .*..     .*...*..*.=
.|
      |               *..*..*      *..*..*..*..*.     *.    *..*.          =
 *
  150 ++                    :     :                                        =
 |
      |                      :    :                                        =
 |
  100 ++                     :   :                                         =
 |
      |                       :  :                                         =
 |
   50 ++                      : :                                          =
 |
      |                        ::                                          =
 |
    0 ++-----------------------*-------------------------------------------=
-+


                            fsmark.time.minor_page_faults

  100000 ++----------------------O-----O-----------------------------------=
-+
   90000 ++          O                                                     =
 |
         O  O     O                 O      O     O              O     O    =
 |
   80000 ++                O                  O     O     O  O     O       =
 |
   70000 ++    O        O     O                                            =
 |
         |                                             O                   =
 |
   60000 ++                                                                =
 |
   50000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   30000 ++                                                                =
 |
   20000 *+.*..*..*..*..*..*..*     *..*...*..*..*..*..*..*..*..*..*..*..*.=
.*
         |                     +   +                                       =
 |
   10000 ++                     + +                                        =
 |
       0 ++----------------------*-----------------------------------------=
-+


                       fsmark.time.voluntary_context_switches

  8e+07 ++-----------------------------------------------------------------=
-+
        |                        O                                         =
 |
  7e+07 O+             O               O                                   =
 |
  6e+07 ++       O         O  O     O                              O       =
 |
        |  O        O                        O     O  O  O      O     O    =
 |
  5e+07 ++    O                           O     O            O             =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
  2e+07 ++                                                                 =
 |
        |                                                                  =
 |
  1e+07 *+.*..*..*..*..*...*..*..   *..*..*..*..*..*..*..*...*..*..*..*..*.=
.*
        |                         ..                                       =
 |
      0 ++-----------------------*-----------------------------------------=
-+


                                 time.system_time

  4500 ++------------------------------------------------------------------=
-+
       |                        O                                          =
 |
  4000 O+                             O                            O       =
 |
  3500 ++                 O                                                =
 |
       |            O              O         O     O  O        O      O    =
 |
  3000 ++       O      O     O            O     O        O  O              =
 |
  2500 ++ O  O                                                             =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
   500 ++                                                                  =
 |
       *..*..*..*...*..*..*..*..  .*..*...*..*..*..*..*..*..*..*...*..*..*.=
.*
     0 ++-----------------------*------------------------------------------=
-+


                         time.percent_of_cpu_this_job_got

  1400 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1200 O+                       O     O                            O       =
 |
       |                  O                  O     O  O        O      O    =
 |
  1000 ++       O   O  O     O     O      O     O        O  O              =
 |
       |  O  O                                                             =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   400 ++                                                                  =
 |
       |                                                                   =
 |
   200 *+.*..*..*...*..  .*..                  .*..*..*..*..*..*...*..*..*.=
.*
       |               *.    *..  .*..*...*..*.                            =
 |
     0 ++-----------------------*------------------------------------------=
-+


                                 time.elapsed_time

  350 ++-----------------------O-------------------------------------------=
-+
      O                            O  O                           O        =
 |
  300 ++ O  O   O  O  O  O  O            O  O  O   O  O  O  O  O      O    =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 *+.*..*...*..*..                           ..*..  .*..     .*...*..*.=
.|
      |               *..*..*      *..*..*..*..*.     *.    *..*.          =
 *
  150 ++                    :     :                                        =
 |
      |                      :    :                                        =
 |
  100 ++                     :   :                                         =
 |
      |                       :  :                                         =
 |
   50 ++                      : :                                          =
 |
      |                        ::                                          =
 |
    0 ++-----------------------*-------------------------------------------=
-+


                               time.elapsed_time.max

  350 ++-----------------------O-------------------------------------------=
-+
      O                            O  O                           O        =
 |
  300 ++ O  O   O  O  O  O  O            O  O  O   O  O  O  O  O      O    =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 *+.*..*...*..*..                           ..*..  .*..     .*...*..*.=
.|
      |               *..*..*      *..*..*..*..*.     *.    *..*.          =
 *
  150 ++                    :     :                                        =
 |
      |                      :    :                                        =
 |
  100 ++                     :   :                                         =
 |
      |                       :  :                                         =
 |
   50 ++                      : :                                          =
 |
      |                        ::                                          =
 |
    0 ++-----------------------*-------------------------------------------=
-+


                               time.minor_page_faults

  100000 ++----------------------O-----O-----------------------------------=
-+
   90000 ++          O                                                     =
 |
         O  O     O                 O      O     O              O     O    =
 |
   80000 ++                O                  O     O     O  O     O       =
 |
   70000 ++    O        O     O                                            =
 |
         |                                             O                   =
 |
   60000 ++                                                                =
 |
   50000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   30000 ++                                                                =
 |
   20000 *+.*..*..*..*..*..*..*     *..*...*..*..*..*..*..*..*..*..*..*..*.=
.*
         |                     +   +                                       =
 |
   10000 ++                     + +                                        =
 |
       0 ++----------------------*-----------------------------------------=
-+


                           time.voluntary_context_switches

  8e+07 ++-----------------------------------------------------------------=
-+
        |                        O                                         =
 |
  7e+07 O+             O               O                                   =
 |
  6e+07 ++       O         O  O     O                              O       =
 |
        |  O        O                        O     O  O  O      O     O    =
 |
  5e+07 ++    O                           O     O            O             =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
  2e+07 ++                                                                 =
 |
        |                                                                  =
 |
  1e+07 *+.*..*..*..*..*...*..*..   *..*..*..*..*..*..*..*...*..*..*..*..*.=
.*
        |                         ..                                       =
 |
      0 ++-----------------------*-----------------------------------------=
-+

   =

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
Xiaolong Ye

--===============8765744636029211166==
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
OiA2YWIyYTRiODA2YWUyMWI2YzNlNDdjNWZmMTI4NWVjMDZkNTA1MzI1Cm1vZGVsOiBCcmlja2xh
bmQgSGFzd2VsbC1FWApucl9jcHU6IDE0NAptZW1vcnk6IDEyOEcKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKY2F0ZWdvcnk6IGJlbmNobWFyawpp
dGVyYXRpb25zOiAxeApucl90aHJlYWRzOiA2NHQKZGlzazogOEJSRF8xMkcKbmVlZF9tZW1vcnk6
IDEwMEcKbWQ6IFJBSUQ1CmZzOiB4ZnMKZnNtYXJrOgogIGZpbGVzaXplOiA0TQogIHRlc3Rfc2l6
ZTogNjBHCiAgc3luY19tZXRob2Q6IGZzeW5jQmVmb3JlQ2xvc2UKcXVldWU6IGJpc2VjdAp0ZXN0
Ym94OiBsa3AtaHN4MDIKdGJveF9ncm91cDogbGtwLWhzeDAyCmtjb25maWc6IHg4Nl82NC1yaGVs
CmVucXVldWVfdGltZTogMjAxNi0wMy0xMCAxNDo0MTo1NS4zNzgxOTc4NTEgKzA4OjAwCmNvbXBp
bGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogMjk0
NzEyMDc1NzMyMTFkODhiNjI0N2YzZDFjYjUyMTVkYmE5OGE2Ywp1c2VyOiBsa3AKaGVhZF9jb21t
aXQ6IDc4MTFiNGZmYzMxMjg1ZTA4ZWU3YTZhOTZhOTQ4NDhjMzdhNDNlMDkKYmFzZV9jb21taXQ6
IGY2Y2VkZTViNDllODIyZWJjNDFhMDk5ZmU0MWFiNDk4OWY2NGUyY2IKYnJhbmNoOiBsaW51eC1u
ZXh0L21hc3RlcgpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTY0
dC04QlJEXzEyRy1SQUlENS14ZnMtNE0tNjBHLWZzeW5jQmVmb3JlQ2xvc2UvbGtwLWhzeDAyL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82YWIyYTRiODA2
YWUyMWI2YzNlNDdjNWZmMTI4NWVjMDZkNTA1MzI1LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVs
ZWQvbGtwLWhzeDAyL2Jpc2VjdF9mc21hcmstcGVyZm9ybWFuY2UtMXgtNjR0LThCUkRfMTJHLVJB
SUQ1LXhmcy00TS02MEctZnN5bmNCZWZvcmVDbG9zZS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6LXg4Nl82NC1yaGVsLTZhYjJhNGI4MDZhZTIxYjZjM2U0N2M1ZmYxMjg1ZWMwNmQ1MDUzMjUt
MjAxNjAzMTAtMjAxODMtMWR2amwwMS0wLnlhbWwiCm1heF91cHRpbWU6IDEyMDguNTAwMDAwMDAw
MDAwMgppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
eiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0v
bGtwL3NjaGVkdWxlZC9sa3AtaHN4MDIvYmlzZWN0X2ZzbWFyay1wZXJmb3JtYW5jZS0xeC02NHQt
OEJSRF8xMkctUkFJRDUteGZzLTRNLTYwRy1mc3luY0JlZm9yZUNsb3NlLWRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNmFiMmE0YjgwNmFlMjFiNmMzZTQ3YzVmZjEyODVl
YzA2ZDUwNTMyNS0yMDE2MDMxMC0yMDE4My0xZHZqbDAxLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0g
a2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1uZXh0L21hc3RlcgotIGNvbW1pdD02
YWIyYTRiODA2YWUyMWI2YzNlNDdjNWZmMTI4NWVjMDZkNTA1MzI1Ci0gQk9PVF9JTUFHRT0vcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNmFiMmE0YjgwNmFlMjFiNmMzZTQ3YzVmZjEyODVl
YzA2ZDUwNTMyNS92bWxpbnV6LTQuNS4wLXJjNS0wMDIwOS1nNmFiMmE0YgotIG1heF91cHRpbWU9
MTIwOAotIFJFU1VMVF9ST09UPS9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTY0dC04QlJE
XzEyRy1SQUlENS14ZnMtNE0tNjBHLWZzeW5jQmVmb3JlQ2xvc2UvbGtwLWhzeDAyL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82YWIyYTRiODA2YWUyMWI2
YzNlNDdjNWZmMTI4NWVjMDZkNTA1MzI1LzAKLSBMS1BfU0VSVkVSPWlubgotIHwtCiAgaHBldD1k
aXNhYmxlIG5vYXBpYyBjcHVpZGxlLm9mZj0xCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBz
eXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFi
bGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9j
a3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIg
cHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9
bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxl
c19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNmFiMmE0YjgwNmFlMjFi
NmMzZTQ3YzVmZjEyODVlYzA2ZDUwNTMyNS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5j
aG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L2ZzLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNmFiMmE0YjgwNmFlMjFiNmMz
ZTQ3YzVmZjEyODVlYzA2ZDUwNTMyNS9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtl
cm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82YWIyYTRiODA2YWUyMWI2YzNl
NDdjNWZmMTI4NWVjMDZkNTA1MzI1L3ZtbGludXotNC41LjAtcmM1LTAwMjA5LWc2YWIyYTRiIgpk
ZXF1ZXVlX3RpbWU6IDIwMTYtMDMtMTAgMTU6MDI6MDAuOTA2NTUxNjA0ICswODowMApqb2Jfc3Rh
dGU6IGZpbmlzaGVkCmxvYWRhdmc6IDM2Ljk5IDMwLjExIDEzLjY1IDIvMTM4NCAxMTc5NApzdGFy
dF90aW1lOiAnMTQ1NzU5MzQzNycKZW5kX3RpbWU6ICcxNDU3NTkzNzI3Jwp2ZXJzaW9uOiAiL2xr
cC9sa3AvLnNyYy0yMDE2MDMxMC0wODQ0MTAiCg==

--===============8765744636029211166==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAxL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTIvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyNi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMxL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0x
MCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNDIvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0x
MCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAx
NTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTgv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE5L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAz
OjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0x
MCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzMi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAx
NTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM0L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzNS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTow
Mzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzOC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1
NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTQwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTQ2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAg
MTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ5
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTow
Mzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1
NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTQvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTcvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTYxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Mi9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAg
MTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY0
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6
MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY3L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6
NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTczL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzgvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEw
IDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1ODEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6
MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6
NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ODcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTEwIDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTk0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEw
IDE1OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDMtMTAgMTU6MDM6NTUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTEwIDE1
OjAzOjU1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5OC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xMCAxNTowMzo1NSBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDMtMTAgMTU6MDM6NTYgbWRhZG0gLXEgLS1jcmVhdGUgL2Rldi9tZDAgLS1jaHVu
az0yNTYgLS1sZXZlbD1yYWlkNSAtLXJhaWQtZGV2aWNlcz04IC0tZm9yY2UgLS1hc3N1bWUtY2xl
YW4gL2Rldi9yYW0wIC9kZXYvcmFtMSAvZGV2L3JhbTIgL2Rldi9yYW0zIC9kZXYvcmFtNCAvZGV2
L3JhbTUgL2Rldi9yYW02IC9kZXYvcmFtNwoyMDE2LTAzLTEwIDE1OjAzOjU2IG1rZnMgLXQgeGZz
IC9kZXYvbWQwCjIwMTYtMDMtMTAgMTU6MDM6NTYgbW91bnQgLXQgeGZzIC1vIG5vYmFycmllcixp
bm9kZTY0IC9kZXYvbWQwIC9mcy9tZDAKMjAxNi0wMy0xMCAxNTowMzo1OCAuL2ZzX21hcmsgLWQg
L2ZzL21kMC8xIC1kIC9mcy9tZDAvMiAtZCAvZnMvbWQwLzMgLWQgL2ZzL21kMC80IC1kIC9mcy9t
ZDAvNSAtZCAvZnMvbWQwLzYgLWQgL2ZzL21kMC83IC1kIC9mcy9tZDAvOCAtZCAvZnMvbWQwLzkg
LWQgL2ZzL21kMC8xMCAtZCAvZnMvbWQwLzExIC1kIC9mcy9tZDAvMTIgLWQgL2ZzL21kMC8xMyAt
ZCAvZnMvbWQwLzE0IC1kIC9mcy9tZDAvMTUgLWQgL2ZzL21kMC8xNiAtZCAvZnMvbWQwLzE3IC1k
IC9mcy9tZDAvMTggLWQgL2ZzL21kMC8xOSAtZCAvZnMvbWQwLzIwIC1kIC9mcy9tZDAvMjEgLWQg
L2ZzL21kMC8yMiAtZCAvZnMvbWQwLzIzIC1kIC9mcy9tZDAvMjQgLWQgL2ZzL21kMC8yNSAtZCAv
ZnMvbWQwLzI2IC1kIC9mcy9tZDAvMjcgLWQgL2ZzL21kMC8yOCAtZCAvZnMvbWQwLzI5IC1kIC9m
cy9tZDAvMzAgLWQgL2ZzL21kMC8zMSAtZCAvZnMvbWQwLzMyIC1kIC9mcy9tZDAvMzMgLWQgL2Zz
L21kMC8zNCAtZCAvZnMvbWQwLzM1IC1kIC9mcy9tZDAvMzYgLWQgL2ZzL21kMC8zNyAtZCAvZnMv
bWQwLzM4IC1kIC9mcy9tZDAvMzkgLWQgL2ZzL21kMC80MCAtZCAvZnMvbWQwLzQxIC1kIC9mcy9t
ZDAvNDIgLWQgL2ZzL21kMC80MyAtZCAvZnMvbWQwLzQ0IC1kIC9mcy9tZDAvNDUgLWQgL2ZzL21k
MC80NiAtZCAvZnMvbWQwLzQ3IC1kIC9mcy9tZDAvNDggLWQgL2ZzL21kMC80OSAtZCAvZnMvbWQw
LzUwIC1kIC9mcy9tZDAvNTEgLWQgL2ZzL21kMC81MiAtZCAvZnMvbWQwLzUzIC1kIC9mcy9tZDAv
NTQgLWQgL2ZzL21kMC81NSAtZCAvZnMvbWQwLzU2IC1kIC9mcy9tZDAvNTcgLWQgL2ZzL21kMC81
OCAtZCAvZnMvbWQwLzU5IC1kIC9mcy9tZDAvNjAgLWQgL2ZzL21kMC82MSAtZCAvZnMvbWQwLzYy
IC1kIC9mcy9tZDAvNjMgLWQgL2ZzL21kMC82NCAtbiAyNDAgLUwgMSAtUyAxIC1zIDQxOTQzMDQK

--===============8765744636029211166==--

