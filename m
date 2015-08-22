Content-Type: multipart/mixed; boundary="===============5839020187633878665=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 88a70a69c0: +49.4% fsmark.files_per_sec
Date: Sun, 23 Aug 2015 07:32:22 +0800
Message-ID: <87mvxikigp.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5839020187633878665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 88a70a69c088933011615fe26242e0335b012284 ("f2fs: fix wrong condition=
 check to trigger f2fs_sync_fs")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/16MB/60G/NoSync/16d/256fpd

commit: =

  cd52b6368f1301b55d0e484105c876930e443d83
  88a70a69c088933011615fe26242e0335b012284

cd52b6368f1301b5 88a70a69c088933011615fe262 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    698894 =C2=B1  2%     -10.7%     624267 =C2=B1  1%  fsmark.app_overhead
      6.43 =C2=B1  0%     +49.4%       9.60 =C2=B1  0%  fsmark.files_per_sec
    496.30 =C2=B1  0%      -3.7%     477.72 =C2=B1  0%  fsmark.time.elapsed=
_time
    496.30 =C2=B1  0%      -3.7%     477.72 =C2=B1  0%  fsmark.time.elapsed=
_time.max
     58356 =C2=B1  9%     -49.3%      29591 =C2=B1  7%  fsmark.time.involun=
tary_context_switches
     11.75 =C2=B1  3%     -14.9%      10.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     59.14 =C2=B1  0%     -16.3%      49.50 =C2=B1  0%  fsmark.time.system_=
time
    609502 =C2=B1  0%     -35.9%     390479 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
      2134 =C2=B1  5%     -29.7%       1499 =C2=B1  6%  uptime.idle
    229046 =C2=B1  0%     -13.3%     198655 =C2=B1  1%  meminfo.Dirty
    146785 =C2=B1  1%     +57.8%     231574 =C2=B1  1%  meminfo.Writeback
      2034 =C2=B1  0%     +10.0%       2238 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_objs
    448.00 =C2=B1  0%     +23.1%     551.50 =C2=B1  1%  slabinfo.kmalloc-40=
96.active_objs
    482.25 =C2=B1  0%     +21.6%     586.25 =C2=B1  1%  slabinfo.kmalloc-40=
96.num_objs
     24996 =C2=B1  0%     -18.5%      20379 =C2=B1  1%  softirqs.BLOCK
     93299 =C2=B1  1%     +21.1%     112999 =C2=B1  0%  softirqs.SCHED
    132179 =C2=B1  0%     +18.6%     156829 =C2=B1  1%  softirqs.TIMER
     58356 =C2=B1  9%     -49.3%      29591 =C2=B1  7%  time.involuntary_co=
ntext_switches
     11.75 =C2=B1  3%     -14.9%      10.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     59.14 =C2=B1  0%     -16.3%      49.50 =C2=B1  0%  time.system_time
    609502 =C2=B1  0%     -35.9%     390479 =C2=B1  0%  time.voluntary_cont=
ext_switches
    126546 =C2=B1  0%      +3.6%     131110 =C2=B1  0%  vmstat.io.bo
     15.25 =C2=B1  2%    +103.3%      31.00 =C2=B1  0%  vmstat.procs.b
     23495 =C2=B1  0%      +1.6%      23881 =C2=B1  0%  vmstat.system.cs
     10330 =C2=B1  0%      +4.8%      10825 =C2=B1  0%  vmstat.system.in
      3.14 =C2=B1  3%      -8.0%       2.89 =C2=B1  0%  turbostat.%Busy
     96.75 =C2=B1  3%     -12.4%      84.75 =C2=B1  0%  turbostat.Avg_MHz
     12.01 =C2=B1  2%     +12.6%      13.53 =C2=B1  4%  turbostat.CPU%c1
     40.58 =C2=B1  1%     +73.6%      70.47 =C2=B1  0%  turbostat.CPU%c3
     44.27 =C2=B1  0%     -70.4%      13.12 =C2=B1  3%  turbostat.CPU%c6
 1.506e+08 =C2=B1  2%     -18.6%  1.225e+08 =C2=B1  5%  cpuidle.C1-NHM.time
  63432793 =C2=B1  2%     +45.7%   92408180 =C2=B1  5%  cpuidle.C1E-NHM.time
     85526 =C2=B1  1%     -27.4%      62121 =C2=B1  2%  cpuidle.C1E-NHM.usa=
ge
 1.024e+09 =C2=B1  0%     +45.5%   1.49e+09 =C2=B1  1%  cpuidle.C3-NHM.time
    266717 =C2=B1  0%     +43.9%     383733 =C2=B1  1%  cpuidle.C3-NHM.usage
 2.619e+09 =C2=B1  0%     -22.9%  2.018e+09 =C2=B1  0%  cpuidle.C6-NHM.time
    194213 =C2=B1  2%     -30.4%     135255 =C2=B1  1%  cpuidle.C6-NHM.usage
    155.50 =C2=B1 58%     -91.9%      12.67 =C2=B1 73%  proc-vmstat.allocst=
all
    951.00 =C2=B1  5%    +230.8%       3145 =C2=B1  1%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
      3011 =C2=B1  3%     -31.6%       2060 =C2=B1 10%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     57266 =C2=B1  0%     -13.3%      49663 =C2=B1  1%  proc-vmstat.nr_dirty
      0.75 =C2=B1110%  +13700.0%     103.50 =C2=B1 26%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     36690 =C2=B1  1%     +57.8%      57885 =C2=B1  1%  proc-vmstat.nr_writ=
eback
      4229 =C2=B1  1%     +24.9%       5283 =C2=B1  3%  proc-vmstat.pageout=
run
      8779 =C2=B1  2%     -45.8%       4755 =C2=B1  1%  proc-vmstat.pgactiv=
ate
     78067 =C2=B1 23%     -97.8%       1738 =C2=B1 73%  proc-vmstat.pgscan_=
direct_dma32
     18409 =C2=B1  3%     -32.8%      12373 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     18497 =C2=B1  4%     -18.9%      14995 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     87.71 =C2=B11609%   +2889.8%       2622 =C2=B1 27%  sched_debug.cfs_rq=
[1]:/.spread0
      2068 =C2=B1 13%     +39.3%       2880 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     18322 =C2=B1  1%     -27.5%      13284 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     44.00 =C2=B1 13%     +41.5%      62.25 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      2260 =C2=B1 17%     +69.9%       3840 =C2=B1 39%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     18810 =C2=B1  2%     -27.2%      13703 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     48.50 =C2=B1 16%     +70.1%      82.50 =C2=B1 39%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
      4839 =C2=B1  5%     -43.8%       2718 =C2=B1 14%  sched_debug.cfs_rq[=
4]:/.exec_clock
     15393 =C2=B1  2%     -55.7%       6817 =C2=B1 12%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     -3016 =C2=B1-27%     +84.2%      -5555 =C2=B1-13%  sched_debug.cfs_rq[=
4]:/.spread0
      4957 =C2=B1  3%     -47.1%       2622 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.exec_clock
     16150 =C2=B1  2%     -52.8%       7615 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     -2259 =C2=B1-26%    +110.5%      -4757 =C2=B1-22%  sched_debug.cfs_rq[=
5]:/.spread0
      4977 =C2=B1  3%     -50.7%       2454 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.exec_clock
     15474 =C2=B1  1%     -51.2%       7558 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     -2935 =C2=B1-33%     +64.0%      -4814 =C2=B1-13%  sched_debug.cfs_rq[=
6]:/.spread0
      1797 =C2=B1  4%     +27.7%       2295 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
      4930 =C2=B1  1%     -39.2%       2998 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.exec_clock
     16149 =C2=B1  4%     -48.4%       8326 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     38.25 =C2=B1  5%     +28.8%      49.25 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
      1.25 =C2=B1103%    +420.0%       6.50 =C2=B1 53%  sched_debug.cpu#0.c=
pu_load[1]
   -499.50 =C2=B1-14%     -96.9%     -15.25 =C2=B1-143%  sched_debug.cpu#0.=
nr_uninterruptible
   1523859 =C2=B1 91%     -94.7%      80781 =C2=B1  8%  sched_debug.cpu#1.t=
twu_count
     29758 =C2=B1  1%     +70.6%      50758 =C2=B1 21%  sched_debug.cpu#2.n=
r_load_updates
     27535 =C2=B1  1%   +3818.0%    1078840 =C2=B1 97%  sched_debug.cpu#2.t=
twu_local
     28162 =C2=B1  1%     +35.3%      38116 =C2=B1  4%  sched_debug.cpu#3.n=
r_load_updates
    183204 =C2=B1 16%     -37.4%     114749 =C2=B1  4%  sched_debug.cpu#3.n=
r_switches
    183360 =C2=B1 16%     -37.4%     114830 =C2=B1  4%  sched_debug.cpu#3.s=
ched_count
     80066 =C2=B1 18%     -32.0%      54416 =C2=B1  4%  sched_debug.cpu#3.s=
ched_goidle
     25169 =C2=B1  2%     +20.2%      30259 =C2=B1  4%  sched_debug.cpu#3.t=
twu_local
    205.25 =C2=B1 14%     -70.5%      60.50 =C2=B1  7%  sched_debug.cpu#4.n=
r_uninterruptible
     22718 =C2=B1 37%     -50.2%      11302 =C2=B1  6%  sched_debug.cpu#5.n=
r_load_updates
   1620691 =C2=B1 90%     -93.7%     102382 =C2=B1 14%  sched_debug.cpu#5.n=
r_switches
    177.25 =C2=B1 13%     -74.0%      46.00 =C2=B1 58%  sched_debug.cpu#5.n=
r_uninterruptible
   1620849 =C2=B1 90%     -93.7%     102471 =C2=B1 14%  sched_debug.cpu#5.s=
ched_count
    794157 =C2=B1 91%     -93.9%      48455 =C2=B1 15%  sched_debug.cpu#5.s=
ched_goidle
    810491 =C2=B1 88%     -91.3%      70436 =C2=B1 26%  sched_debug.cpu#5.t=
twu_count
    729454 =C2=B1 98%     -99.2%       6150 =C2=B1  7%  sched_debug.cpu#5.t=
twu_local
    131.00 =C2=B1 37%     -60.5%      51.75 =C2=B1 25%  sched_debug.cpu#6.n=
r_uninterruptible
      3.25 =C2=B1155%   +1130.8%      40.00 =C2=B1 83%  sched_debug.cpu#7.c=
pu_load[0]
      3.75 =C2=B1 82%    +160.0%       9.75 =C2=B1 53%  sched_debug.cpu#7.c=
pu_load[4]
    198.00 =C2=B1 20%     -71.7%      56.00 =C2=B1  8%  sched_debug.cpu#7.n=
r_uninterruptible
     13180 =C2=B1  6%     -43.2%       7481 =C2=B1 13%  sched_debug.cpu#7.t=
twu_local
     43097 =C2=B1  0%     +25.3%      54021 =C2=B1  0%  latency_stats.avg.b=
alance_dirty_pages_ratelimited.generic_perform_write.__generic_file_write_i=
ter.generic_file_write_iter.new_sync_write.vfs_write.SyS_write.system_call_=
fastpath
   1557144 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_convert_inline_inode.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.new_sync_write.vfs_write.SyS_write.system_call_fastpath
    970823 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_cre=
ate.do_last.path_openat.do_filp_open.do_sys_open.SyS_open.system_call_fastp=
ath
      0.00 =C2=B1 -1%      +Inf%     214155 =C2=B1 70%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.=
do_last.path_openat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%      60170 =C2=B1 93%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].reserve_ne=
w_block.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].generic_pe=
rform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
    225094 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.new_sync_write.vfs_write.Sy=
S_write.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%     101419 =C2=B1 96%  latency_stats.avg.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].f2fs_wait_on_page_writeback.[f2fs].f=
2fs_wait_on_page_writeback.[f2fs].update_inode.[f2fs].update_inode_page.[f2=
fs].f2fs_write_end.[f2fs].generic_perform_write
      0.00 =C2=B1 -1%      +Inf%    1566660 =C2=B1  2%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].__set_data_blkaddr.[f2fs].reserve_new_block.[f2fs].f2fs_reserve_=
block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_w=
rite_iter.generic_file_write_iter.new_sync_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%      60796 =C2=B1 69%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_be=
gin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter.new_sync_write.vfs_write.SyS_write
      0.00 =C2=B1 -1%      +Inf%    1643593 =C2=B1 34%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].new_node_page.[f2fs].=
get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].=
generic_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.00 =C2=B1 -1%      +Inf%     210894 =C2=B1117%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].reserve_new_block.[f2=
fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write=
.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.00 =C2=B1 -1%      +Inf%     885323 =C2=B1 71%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
new_sync_write.vfs_write.SyS_write
   1593081 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.do_last.path_openat.do_filp_open.do_sys_open.SyS_open.syst=
em_call_fastpath
    166104 =C2=B1  0%     +43.7%     238737 =C2=B1  1%  latency_stats.hits.=
balance_dirty_pages_ratelimited.generic_perform_write.__generic_file_write_=
iter.generic_file_write_iter.new_sync_write.vfs_write.SyS_write.system_call=
_fastpath
     89938 =C2=B1  2%     -77.3%      20398 =C2=B1  5%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].g=
eneric_perform_write.__generic_file_write_iter.generic_file_write_iter.new_=
sync_write.vfs_write.SyS_write
     90810 =C2=B1  2%     -77.3%      20638 =C2=B1  5%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter.new_sync_write.vfs_write.SyS_write.sy=
stem_call_fastpath
     73358 =C2=B1  3%     -77.9%      16217 =C2=B1  5%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wr=
ite_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fi=
le_write_iter.new_sync_write.vfs_write
     95785 =C2=B1  2%     -76.4%      22618 =C2=B1  5%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_per=
form_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write=
.vfs_write.SyS_write
   2926891 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_convert_inline_inode.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.new_sync_write.vfs_write.SyS_write.system_call_fastpath
   1609764 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_cre=
ate.do_last.path_openat.do_filp_open.do_sys_open.SyS_open.system_call_fastp=
ath
      0.00 =C2=B1 -1%      +Inf%     493421 =C2=B1 62%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.=
do_last.path_openat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%      99336 =C2=B1 98%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].reserve_ne=
w_block.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].generic_pe=
rform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
   2242545 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.new_sync_write.vfs_write.Sy=
S_write.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%     101419 =C2=B1 96%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].f2fs_wait_on_page_writeback.[f2fs].f=
2fs_wait_on_page_writeback.[f2fs].update_inode.[f2fs].update_inode_page.[f2=
fs].f2fs_write_end.[f2fs].generic_perform_write
      0.00 =C2=B1 -1%      +Inf%    2155762 =C2=B1  1%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].__set_data_blkaddr.[f2fs].reserve_new_block.[f2fs].f2fs_reserve_=
block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_w=
rite_iter.generic_file_write_iter.new_sync_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%     547532 =C2=B1147%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_be=
gin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter.new_sync_write.vfs_write.SyS_write
      0.00 =C2=B1 -1%      +Inf%    1643593 =C2=B1 34%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].new_node_page.[f2fs].=
get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].=
generic_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.00 =C2=B1 -1%      +Inf%     936362 =C2=B1100%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].reserve_new_block.[f2=
fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write=
.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.00 =C2=B1 -1%      +Inf%     981143 =C2=B1 74%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
new_sync_write.vfs_write.SyS_write
   2311901 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.do_last.path_openat.do_filp_open.do_sys_open.SyS_open.syst=
em_call_fastpath
 7.159e+09 =C2=B1  1%     +80.1%   1.29e+10 =C2=B1  0%  latency_stats.sum.b=
alance_dirty_pages_ratelimited.generic_perform_write.__generic_file_write_i=
ter.generic_file_write_iter.new_sync_write.vfs_write.SyS_write.system_call_=
fastpath
 7.392e+09 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_convert_inline_inode.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.new_sync_write.vfs_write.SyS_write.system_call_fastpath
   4641241 =C2=B1 65%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_cre=
ate.do_last.path_openat.do_filp_open.do_sys_open.SyS_open.system_call_fastp=
ath
      0.00 =C2=B1 -1%      +Inf%    2970972 =C2=B1119%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.=
do_last.path_openat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%    1400735 =C2=B1115%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].reserve_ne=
w_block.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].generic_pe=
rform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
  34303529 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.new_sync_write.vfs_write.Sy=
S_write.system_call_fastpath
    173732 =C2=B1  4%     -43.4%      98372 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].get_dn=
ode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].generi=
c_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_=
write.vfs_write.SyS_write
  12335489 =C2=B1  3%     -82.6%    2148753 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.new_s=
ync_write.vfs_write.SyS_write
  12643502 =C2=B1  3%     -82.9%    2161679 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.new_sync_write.vfs_write.SyS_write.sys=
tem_call_fastpath
  10460959 =C2=B1  4%     -82.8%    1796848 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_wri=
te_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.new_sync_write.vfs_write
     46303 =C2=B1 10%     -71.7%      13097 =C2=B1 23%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.do_la=
st.path_openat
     24455 =C2=B1 18%     -66.6%       8164 =C2=B1 29%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].find_data_page.[f2fs].f2fs_find_en=
try.[f2fs].f2fs_lookup.[f2fs].lookup_real.do_last.path_openat.do_filp_open
  13132122 =C2=B1  3%     -81.7%    2403201 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write.=
vfs_write.SyS_write
    689498 =C2=B1  4%     -70.8%     201181 =C2=B1  6%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].get_d=
node_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].gener=
ic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync=
_write.vfs_write.SyS_write
    107001 =C2=B1  7%     -67.6%      34703 =C2=B1 29%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.do_last.path_openat.do_filp_open.do_sys_open
    637933 =C2=B1  4%     -72.5%     175156 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].get_d=
node_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].gener=
ic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync=
_write.vfs_write.SyS_write
     98057 =C2=B1  3%     -71.3%      28111 =C2=B1 17%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.do_last.path_openat.do_filp_open.do_sys_open
   1107127 =C2=B1  0%      +5.5%    1168564 =C2=B1  1%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%     101419 =C2=B1 96%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].f2fs_wait_on_page_writeback.[f2fs].f=
2fs_wait_on_page_writeback.[f2fs].update_inode.[f2fs].update_inode_page.[f2=
fs].f2fs_write_end.[f2fs].generic_perform_write
    946288 =C2=B1128%  +18540.4%  1.764e+08 =C2=B1 44%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.do_last.pat=
h_openat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      0.00 =C2=B1 -1%      +Inf%  9.825e+08 =C2=B1  4%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].__set_data_blkaddr.[f2fs].reserve_new_block.[f2fs].f2fs_reserve_=
block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_w=
rite_iter.generic_file_write_iter.new_sync_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%    6369185 =C2=B1 77%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_be=
gin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter.new_sync_write.vfs_write.SyS_write
      0.00 =C2=B1 -1%      +Inf%    1643593 =C2=B1 34%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].new_node_page.[f2fs].=
get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].=
generic_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.00 =C2=B1 -1%      +Inf%   14652195 =C2=B1106%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].reserve_new_block.[f2=
fs].f2fs_reserve_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write=
.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.00 =C2=B1 -1%      +Inf%    2354965 =C2=B1107%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
new_sync_write.vfs_write.SyS_write
   6949333 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.do_last.path_openat.do_filp_open.do_sys_open.SyS_open.syst=
em_call_fastpath


nhm4: Nehalem
Memory: 4G

                               fsmark.files_per_sec

   10 ++-------------------------------------------------------------------=
-+
      O  O O  O O  O O  O O  O O  O O  O O  O O  O O  O O  O O  O O  O O  O=
 O
  9.5 ++                                                                   =
 |
    9 ++                                                                   =
 |
      |                                                                    =
 |
  8.5 ++                                                                   =
 |
      |                                                                    =
 |
    8 ++                                                                   =
 |
      |                                                                    =
 |
  7.5 ++                                                                   =
 |
    7 ++                                                                   =
 |
      |                                                                    =
 |
  6.5 *+.*.*..    .*.  .*.*..      .*..           .*                       =
 |
      |       *.*.   *.      *.*..*    *.*..*.*..*                         =
 |
    6 ++-------------------------------------------------------------------=
-+


                             fsmark.time.system_time

  62 ++--------------------------------------------------------------------=
-+
     |    *..*                                                             =
 |
  60 *+. +    +       .*.*..*.*..*.*..   *.                                =
 |
     |  *      *.. .*.                 ..  *..*.*..*                       =
 |
  58 ++           *                   *                                    =
 |
     |                                                                     =
 |
  56 ++                                                                    =
 |
     |                                                                     =
 |
  54 ++                                                                    =
 |
     |                                                                     =
 |
  52 ++                                                                    =
 |
     O            O    O    O O  O    O  O                                 =
 |
  50 ++ O O  O O    O    O         O       O  O O  O         O           O =
 O
     |                                               O  O O    O  O O  O   =
 |
  48 ++--------------------------------------------------------------------=
-+


                             fsmark.time.elapsed_time

  620 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  600 ++                                 *                                 =
 |
  580 ++                                 :                                 =
 |
      |                                  ::                                =
 |
  560 ++                                : :                                =
 |
      |                                 : :                                =
 |
  540 ++                                :  :                               =
 |
      |                                 :  :                               =
 |
  520 ++                               :   :                               =
 |
  500 ++                               :    :                              =
 |
      *..*.*..*.*..*.*..*.*..*.*..*.*..*    *.*..*.*                       =
 |
  480 O+ O O  O O  O O  O O  O O    O  O O  O O  O O  O O    O  O O  O O  O=
 |
      |                           O                        O               =
 O
  460 ++-------------------------------------------------------------------=
-+


                           fsmark.time.elapsed_time.max

  620 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  600 ++                                 *                                 =
 |
  580 ++                                 :                                 =
 |
      |                                  ::                                =
 |
  560 ++                                : :                                =
 |
      |                                 : :                                =
 |
  540 ++                                :  :                               =
 |
      |                                 :  :                               =
 |
  520 ++                               :   :                               =
 |
  500 ++                               :    :                              =
 |
      *..*.*..*.*..*.*..*.*..*.*..*.*..*    *.*..*.*                       =
 |
  480 O+ O O  O O  O O  O O  O O    O  O O  O O  O O  O O    O  O O  O O  O=
 |
      |                           O                        O               =
 O
  460 ++-------------------------------------------------------------------=
-+


                       fsmark.time.voluntary_context_switches

  650000 ++----------------------------------------------------------------=
-+
         *                                .*.                              =
 |
  600000 ++  .*.*..*.*.*..*.*..*.*.*..*.*.   *.*..*.*                      =
 |
         | *.                                                              =
 |
         |                                                                 =
 |
  550000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  450000 ++                                                                =
 |
         |                                                                 =
 |
         |                O             O                                  =
 |
  400000 O+O  O O  O O O    O  O O O  O    O O O  O O O  O O  O O O  O O  O=
 O
         |                                                                 =
 |
  350000 ++----------------------------------------------------------------=
-+


                                time.system_time

  62 ++--------------------------------------------------------------------=
-+
     |    *..*                                                             =
 |
  60 *+. +    +       .*.*..*.*..*.*..   *.                                =
 |
     |  *      *.. .*.                 ..  *..*.*..*                       =
 |
  58 ++           *                   *                                    =
 |
     |                                                                     =
 |
  56 ++                                                                    =
 |
     |                                                                     =
 |
  54 ++                                                                    =
 |
     |                                                                     =
 |
  52 ++                                                                    =
 |
     O            O    O    O O  O    O  O                                 =
 |
  50 ++ O O  O O    O    O         O       O  O O  O         O           O =
 O
     |                                               O  O O    O  O O  O   =
 |
  48 ++--------------------------------------------------------------------=
-+


                           time.voluntary_context_switches

  650000 ++----------------------------------------------------------------=
-+
         *                                .*.                              =
 |
  600000 ++  .*.*..*.*.*..*.*..*.*.*..*.*.   *.*..*.*                      =
 |
         | *.                                                              =
 |
         |                                                                 =
 |
  550000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  450000 ++                                                                =
 |
         |                                                                 =
 |
         |                O             O                                  =
 |
  400000 O+O  O O  O O O    O  O O O  O    O O O  O O O  O O  O O O  O O  O=
 O
         |                                                                 =
 |
  350000 ++----------------------------------------------------------------=
-+


                                 vmstat.procs.b

  32 ++--------------------------------------------------------------------=
-+
     O  O O  O O  O O  O O  O O  O O  O  O O  O O  O O  O O  O O  O O  O O =
 O
  30 ++                                                                    =
 |
  28 ++                                                                    =
 |
     |                                                                     =
 |
  26 ++                                                                    =
 |
  24 ++                                                                    =
 |
     |                                                                     =
 |
  22 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  18 ++  .*..    .*.                                                       =
 |
  16 *+.*    *.*.   *..*.*..*.*..*.*..*..*.*..                             =
 |
     |                                        *.*..*                       =
 |
  14 ++--------------------------------------------------------------------=
-+


                                    vmstat.io.bo

  132000 ++----------------------------------------------------------------=
-+
         |                                     O    O      O               =
 |
  131000 O+O    O  O O O  O O  O O O  O O  O O    O   O  O    O O O  O O   =
 O
         |    O                                                           O=
 |
         |                                                                 =
 |
  130000 ++                                                                =
 |
         |                                                                 =
 |
  129000 ++                                                                =
 |
         |                                                                 =
 |
  128000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  127000 ++  .*.*..   .*..*.  .*.    .*.  .*.      .*                      =
 |
         *.*.      *.*      *.   *.*.   *.   *.*..*                        =
 |
  126000 ++----------------------------------------------------------------=
-+


                              proc-vmstat.nr_writeback

  60000 ++--------------------------------------------------------O--------=
-+
        | O  O O  O           O             O  O O  O    O O O  O    O O  O=
 |
  55000 O+          O  O O O    O  O O  O O           O                    =
 O
        |                                                                  =
 |
        |                                                                  =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        |.*..*.*..                  .*..                                   =
 |
        *         *.*..*.*.*..*.*..*    *   *..*.*..*                      =
 |
  35000 ++                               : :                               =
 |
        |                                : :                               =
 |
  30000 ++--------------------------------*--------------------------------=
-+


                      proc-vmstat.nr_vmscan_immediate_reclaim

  180 ++-------------------------------------------------------------------=
-+
      |  O                                                                 =
 |
  160 ++                                                                   =
 |
  140 ++                          O                                       O=
 |
      |            O                   O O                   O         O   =
 |
  120 O+   O                   O    O                             O        =
 |
  100 ++      O O    O  O O  O                O    O    O                  =
 |
      |                                                    O    O          =
 |
   80 ++                                    O    O    O              O     =
 O
   60 ++                                                                   =
 |
      |                                                                    =
 |
   40 ++                                                                   =
 |
   20 ++                                                                   =
 |
      |                                                                    =
 |
    0 *+-*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*-----------------------=
-+


                               proc-vmstat.pgactivate

  10000 ++-----------------------------------------------------------------=
-+
        *                                 *.                               =
 |
   9000 ++    .*.. .*..*.    .*.*.. .*.. +  *.. .*..                       =
 |
        | *..*    *      *.*.      *    *      *    *                      =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
        |                                                                  =
 |
   7000 ++                                                                 =
 |
        |                                                                  =
 |
   6000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   5000 O+O  O O    O  O O      O  O O    O O    O    O    O    O    O O  O=
 O
        |         O        O  O         O      O    O    O   O    O        =
 |
   4000 ++-----------------------------------------------------------------=
-+


                     proc-vmstat.kswapd_high_wmark_hit_quickly

  3500 ++------------------------------------------------------------------=
-+
       |                   O O         O  O   O    O    O  O O  O         O=
 |
  3000 O+O  O O  O O  O O       O O  O      O    O    O           O  O O   =
 O
       |                                                                   =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
       |                  .*.    .*..                                      =
 |
  1000 *+*..*.  .*.*..*.*.   *..*    *.*..*.*.*..*.*                       =
 |
       |      *.                                                           =
 |
   500 ++------------------------------------------------------------------=
-+


                                  meminfo.Writeback

  240000 ++-------------------------------------------------------O--------=
-+
         | O  O O  O           O             O O  O O    O O  O O    O O  O=
 |
  220000 O+          O O  O O    O O  O O  O          O                    =
 O
         |                                                                 =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  180000 ++                                                                =
 |
         |                                                                 =
 |
  160000 ++                                                                =
 |
         |.*..*.*..                  .*.                                   =
 |
         *         *.*.*..*.*..*.*.*.   *    *.*..*.*                      =
 |
  140000 ++                              +  :                              =
 |
         |                                + :                              =
 |
  120000 ++--------------------------------*-------------------------------=
-+


                         slabinfo.kmalloc-4096.active_objs

  580 ++-------------------------------------------------------------------=
-+
      |                      O                                            O=
 |
  560 O+ O O  O O  O    O O         O  O O    O    O    O  O O  O O  O O   =
 |
  540 ++             O         O  O         O    O    O                    =
 O
      |                                                                    =
 |
  520 ++                                                                   =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  480 ++                                                                   =
 |
  460 ++                                                                   =
 |
      *..*.*..*.*..*.*..*.  .*.*..*.*..     *.*..*.*                       =
 |
  440 ++                  *.           *   +                               =
 |
  420 ++                                + +                                =
 |
      |                                  *                                 =
 |
  400 ++-------------------------------------------------------------------=
-+


                          slabinfo.kmalloc-4096.num_objs

  600 ++------------------------------------------------------------------O=
-+
      O  O O  O    O    O    O      O  O O    O    O    O  O O  O O  O O   =
 |
  580 ++        O         O    O  O         O    O    O                    =
 O
  560 ++             O                                                     =
 |
      |                                                                    =
 |
  540 ++                                                                   =
 |
      |                                                                    =
 |
  520 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
  480 *+.*.*..*.*..*.*..*.  .*.*..*.*..      .*..*.*                       =
 |
      |                   *.           *    *                              =
 |
  460 ++                                :  +                               =
 |
      |                                 : +                                =
 |
  440 ++---------------------------------*---------------------------------=
-+


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

--===============5839020187633878665==
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
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogMzlhODgwNDQ1NWZi
MjNmMDkxNTczNDFkM2JhN2RiNmQ3YWU2ZWU3Ngptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVt
b3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZC
WVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQy
Igpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0w
MTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgpuZXRjb25zb2xlX3BvcnQ6IDY2NDkKY2F0ZWdv
cnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApm
czogZjJmcwpmczI6IApmc21hcms6CiAgZmlsZXNpemU6IDE2TUIKICB0ZXN0X3NpemU6IDYwRwog
IHN5bmNfbWV0aG9kOiBOb1N5bmMKICBucl9kaXJlY3RvcmllczogMTZkCiAgbnJfZmlsZXNfcGVy
X2RpcmVjdG9yeTogMjU2ZnBkCnF1ZXVlOiByZWNvbmZpcm0KdGVzdGJveDogbmhtNAp0Ym94X2dy
b3VwOiBuaG00Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wOC0wOSAx
Njo0NzowNC45NDEwMzYyMzUgKzA4OjAwCmlkOiA1ZmM0Yzc1MjVkMmZmMDJhMTM5NTNkYjFmMjRj
OWJjNDZmNmQ4YzkwCnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogM2Mx
OWQyMzdkZDgxNDg5MjZlNDkyNTllNDk1ZWU0MWRkZGQxZjA5YwpiYXNlX2NvbW1pdDogNzRkMzMy
OTNlNDY3ZGY2MWRlMWIxZDhiMmZiZTI5ZTU1MGRlYzMzYgpicmFuY2g6IHNvYy10aGVybWFsL2Zp
eGVzCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9y
ZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtMTZNQi02MEctTm9TeW5j
LTE2ZC0yNTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2djYy00LjkvMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2JhN2RiNmQ3YWU2ZWU3Ni8wIgpqb2Jf
ZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obTQvcmVjb25maXJtX2ZzbWFyay1wZXJmb3JtYW5jZS0x
eC0zMnQtMUhERC1mMmZzLTE2TUItNjBHLU5vU3luYy0xNmQtMjU2ZnBkLWRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2JhN2Ri
NmQ3YWU2ZWU3Ni0yMDE1MDgwOS0xMTI4OTEtMXhkdXY2OC0wLnlhbWwiCm1heF91cHRpbWU6IDE2
MDguNTYKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9
L2xrcC9zY2hlZHVsZWQvbmhtNC9yZWNvbmZpcm1fZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTMydC0x
SERELWYyZnMtMTZNQi02MEctTm9TeW5jLTE2ZC0yNTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei14ODZfNjQtcmhlbC0zOWE4ODA0NDU1ZmIyM2YwOTE1NzM0MWQzYmE3ZGI2ZDdhZTZl
ZTc2LTIwMTUwODA5LTExMjg5MS0xeGR1djY4LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZp
Zz14ODZfNjQtcmhlbAotIGJyYW5jaD1zb2MtdGhlcm1hbC9maXhlcwotIGNvbW1pdD0zOWE4ODA0
NDU1ZmIyM2YwOTE1NzM0MWQzYmE3ZGI2ZDdhZTZlZTc2Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2JhN2RiNmQ3YWU2
ZWU3Ni92bWxpbnV6LTQuMC4wCi0gbWF4X3VwdGltZT0xNjA4Ci0gUkVTVUxUX1JPT1Q9L3Jlc3Vs
dC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZjJmcy0xNk1CLTYwRy1Ob1N5bmMtMTZk
LTI1NmZwZC9uaG00L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2Nj
LTQuOS8zOWE4ODA0NDU1ZmIyM2YwOTE1NzM0MWQzYmE3ZGI2ZDdhZTZlZTc2LzAKLSBMS1BfU0VS
VkVSPWlubgotIHwtCiAgbGliYXRhLmZvcmNlPTEuNUdicHMKCiAgZWFybHlwcmludGs9dHR5UzAs
MTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3
YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0x
IHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3Jh
bWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10
dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6
Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8zOWE4ODA0
NDU1ZmIyM2YwOTE1NzM0MWQzYmE3ZGI2ZDdhZTZlZTc2L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6
ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwv
bGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei9mczIuY2d6LC9sa3AvYmVuY2htYXJrcy9mc21hcmsuY2d6IgpyZXBlYXRfdG86IDUK
a2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzM5YTg4MDQ0NTVmYjIzZjA5
MTU3MzQxZDNiYTdkYjZkN2FlNmVlNzYvdm1saW51ei00LjAuMCIKZGVxdWV1ZV90aW1lOiAyMDE1
LTA4LTA5IDE2OjUyOjQ4LjY5ODU5NDA3MyArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiAzMS42OCAyNi4wNyAxMy4yMCAxLzE1NSA2OTkyCnN0YXJ0X3RpbWU6ICcxNDM5MTA5ODM3
JwplbmRfdGltZTogJzE0MzkxMTAzMTQnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwODA3
LTE4MzE1MiIK

--===============5839020187633878665==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgpta2ZzIC10IGYyZnMgL2Rldi9zZGIxCm1vdW50IC10IGYyZnMgL2Rldi9z
ZGIxIC9mcy9zZGIxCi4vZnNfbWFyayAtZCAvZnMvc2RiMS8xIC1kIC9mcy9zZGIxLzIgLWQgL2Zz
L3NkYjEvMyAtZCAvZnMvc2RiMS80IC1kIC9mcy9zZGIxLzUgLWQgL2ZzL3NkYjEvNiAtZCAvZnMv
c2RiMS83IC1kIC9mcy9zZGIxLzggLWQgL2ZzL3NkYjEvOSAtZCAvZnMvc2RiMS8xMCAtZCAvZnMv
c2RiMS8xMSAtZCAvZnMvc2RiMS8xMiAtZCAvZnMvc2RiMS8xMyAtZCAvZnMvc2RiMS8xNCAtZCAv
ZnMvc2RiMS8xNSAtZCAvZnMvc2RiMS8xNiAtZCAvZnMvc2RiMS8xNyAtZCAvZnMvc2RiMS8xOCAt
ZCAvZnMvc2RiMS8xOSAtZCAvZnMvc2RiMS8yMCAtZCAvZnMvc2RiMS8yMSAtZCAvZnMvc2RiMS8y
MiAtZCAvZnMvc2RiMS8yMyAtZCAvZnMvc2RiMS8yNCAtZCAvZnMvc2RiMS8yNSAtZCAvZnMvc2Ri
MS8yNiAtZCAvZnMvc2RiMS8yNyAtZCAvZnMvc2RiMS8yOCAtZCAvZnMvc2RiMS8yOSAtZCAvZnMv
c2RiMS8zMCAtZCAvZnMvc2RiMS8zMSAtZCAvZnMvc2RiMS8zMiAtRCAxNiAtTiAyNTYgLW4gMTIw
IC1MIDEgLVMgMCAtcyAxNjc3NzIxNgo=

--===============5839020187633878665==--

