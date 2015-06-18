Content-Type: multipart/mixed; boundary="===============7555939915151135574=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [jbd2] de92c8caf16: no primary result change, +270.9% vmstat.procs.b, -61.0% vmstat.procs.r
Date: Thu, 18 Jun 2015 11:20:59 +0800
Message-ID: <1434597659.21752.16.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7555939915151135574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit de92c8caf16ca84926fa31b7a5590c0fb9c0d5ca ("jbd2: speedup jbd2_journa=
l_get_[write|undo]_access()")

It appears that more processes are put in uninterruptible state after the c=
ommit.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/wait_disks_timeout/runtime/disk=
/md/iosched/fs/nr_threads:
  lkp-st02/dd-write/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/300/5m=
/11HDD/JBOD/cfq/ext4/10dd

commit: =

  8b00f400eedf91d074f831077003c0d4d9147377
  de92c8caf16ca84926fa31b7a5590c0fb9c0d5ca

8b00f400eedf91d0 de92c8caf16ca84926fa31b7a5 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     48241 =C2=B1  8%    +139.2%     115399 =C2=B1  2%  softirqs.SCHED
      1565 =C2=B1  5%     +12.4%       1759 =C2=B1  6%  time.involuntary_co=
ntext_switches
    391202 =C2=B1  5%    +110.7%     824392 =C2=B1  1%  proc-vmstat.pgactiv=
ate
     70008 =C2=B1 56%     -73.1%      18828 =C2=B1 50%  proc-vmstat.pgrotat=
ed
     21.50 =C2=B1 10%    +270.9%      79.75 =C2=B1  1%  vmstat.procs.b
     86.00 =C2=B1  1%     -61.0%      33.50 =C2=B1  2%  vmstat.procs.r
     23827 =C2=B1  0%      -2.7%      23187 =C2=B1  0%  vmstat.system.in
      2310 =C2=B1  4%     -16.9%       1919 =C2=B1 10%  slabinfo.ext4_io_en=
d.active_objs
      2310 =C2=B1  4%     -16.9%       1919 =C2=B1 10%  slabinfo.ext4_io_en=
d.num_objs
      2110 =C2=B1 18%     +18.4%       2499 =C2=B1  3%  slabinfo.kmalloc-96=
.active_objs
      2163 =C2=B1 13%     +15.5%       2499 =C2=B1  3%  slabinfo.kmalloc-96=
.num_objs
 1.683e+12 =C2=B1  1%      -6.1%   1.58e+12 =C2=B1  0%  perf-stat.L1-dcache=
-loads
 6.332e+08 =C2=B1  2%      -6.8%  5.904e+08 =C2=B1  1%  perf-stat.L1-dcache=
-prefetches
 9.849e+11 =C2=B1  1%      -4.0%  9.457e+11 =C2=B1  0%  perf-stat.L1-dcache=
-stores
 6.932e+10 =C2=B1  1%      +6.7%  7.397e+10 =C2=B1  0%  perf-stat.L1-icache=
-load-misses
 5.064e+12 =C2=B1  1%      -5.7%  4.777e+12 =C2=B1  0%  perf-stat.L1-icache=
-loads
 1.823e+09 =C2=B1  1%      +8.0%  1.969e+09 =C2=B1  0%  perf-stat.LLC-load-=
misses
 8.519e+11 =C2=B1  1%      -3.5%  8.222e+11 =C2=B1  0%  perf-stat.branch-in=
structions
  8.99e+09 =C2=B1  2%     -23.1%  6.916e+09 =C2=B1  0%  perf-stat.branch-lo=
ad-misses
 8.513e+11 =C2=B1  1%      -3.5%  8.216e+11 =C2=B1  0%  perf-stat.branch-lo=
ads
 8.967e+09 =C2=B1  2%     -23.5%  6.858e+09 =C2=B1  0%  perf-stat.branch-mi=
sses
 8.059e+11 =C2=B1  1%      -3.4%  7.786e+11 =C2=B1  0%  perf-stat.bus-cycles
 3.658e+09 =C2=B1  1%      +5.6%  3.863e+09 =C2=B1  0%  perf-stat.cache-mis=
ses
 1.612e+11 =C2=B1  2%      +5.6%  1.701e+11 =C2=B1  0%  perf-stat.cache-ref=
erences
 6.452e+12 =C2=B1  1%      -3.5%  6.227e+12 =C2=B1  0%  perf-stat.cpu-cycles
     92243 =C2=B1  6%    +175.6%     254241 =C2=B1  2%  perf-stat.cpu-migra=
tions
 1.305e+10 =C2=B1 12%     -15.2%  1.106e+10 =C2=B1  4%  perf-stat.dTLB-load=
-misses
 1.683e+12 =C2=B1  1%      -6.2%  1.579e+12 =C2=B1  0%  perf-stat.dTLB-loads
 9.845e+11 =C2=B1  1%      -4.0%  9.446e+11 =C2=B1  0%  perf-stat.dTLB-stor=
es
  31933083 =C2=B1  9%     -31.3%   21923765 =C2=B1  2%  perf-stat.iTLB-load=
-misses
 4.638e+12 =C2=B1  1%      -3.6%  4.471e+12 =C2=B1  0%  perf-stat.iTLB-loads
 4.639e+12 =C2=B1  1%      -3.6%  4.471e+12 =C2=B1  0%  perf-stat.instructi=
ons
 6.448e+12 =C2=B1  1%      -3.4%  6.229e+12 =C2=B1  0%  perf-stat.ref-cycles
      1.36 =C2=B1  4%     +17.9%       1.60 =C2=B1  3%  perf-profile.cpu-cy=
cles.__clear_user.iov_iter_zero.read_iter_zero.__vfs_read.vfs_read
      3.48 =C2=B1  4%     +11.1%       3.87 =C2=B1  2%  perf-profile.cpu-cy=
cles.__ext4_get_inode_loc.ext4_get_inode_loc.ext4_reserve_inode_write.ext4_=
mark_inode_dirty.ext4_dirty_inode
      5.15 =C2=B1  1%     +22.6%       6.31 =C2=B1  2%  perf-profile.cpu-cy=
cles.__ext4_handle_dirty_metadata.ext4_mark_iloc_dirty.ext4_mark_inode_dirt=
y.ext4_dirty_inode.__mark_inode_dirty
      7.90 =C2=B1  3%     -87.7%       0.98 =C2=B1 14%  perf-profile.cpu-cy=
cles.__ext4_journal_get_write_access.ext4_reserve_inode_write.ext4_mark_ino=
de_dirty.ext4_dirty_inode.__mark_inode_dirty
      8.53 =C2=B1  0%     +17.7%      10.04 =C2=B1  1%  perf-profile.cpu-cy=
cles.__ext4_journal_start_sb.ext4_da_write_begin.generic_perform_write.__ge=
neric_file_write_iter.ext4_file_write_iter
      0.91 =C2=B1  3%     +11.3%       1.01 =C2=B1  9%  perf-profile.cpu-cy=
cles.__ext4_journal_start_sb.ext4_dirty_inode.__mark_inode_dirty.generic_wr=
ite_end.ext4_da_write_end
      2.99 =C2=B1  2%     +17.4%       3.50 =C2=B1  4%  perf-profile.cpu-cy=
cles.__ext4_journal_stop.ext4_da_write_end.generic_perform_write.__generic_=
file_write_iter.ext4_file_write_iter
      0.78 =C2=B1  6%     +22.4%       0.96 =C2=B1  6%  perf-profile.cpu-cy=
cles.__ext4_journal_stop.ext4_dirty_inode.__mark_inode_dirty.generic_write_=
end.ext4_da_write_end
      1.19 =C2=B1  3%     +29.1%       1.53 =C2=B1  4%  perf-profile.cpu-cy=
cles.__find_get_block.__getblk_gfp.__ext4_get_inode_loc.ext4_get_inode_loc.=
ext4_reserve_inode_write
      1.88 =C2=B1  4%     +20.2%       2.26 =C2=B1  4%  perf-profile.cpu-cy=
cles.__getblk_gfp.__ext4_get_inode_loc.ext4_get_inode_loc.ext4_reserve_inod=
e_write.ext4_mark_inode_dirty
     26.69 =C2=B1  0%     -16.5%      22.29 =C2=B1  1%  perf-profile.cpu-cy=
cles.__mark_inode_dirty.generic_write_end.ext4_da_write_end.generic_perform=
_write.__generic_file_write_iter
      3.39 =C2=B1  3%     +18.7%       4.02 =C2=B1  2%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.system_call_fastpath
      0.99 =C2=B1  3%     +36.5%       1.35 =C2=B1  5%  perf-profile.cpu-cy=
cles._raw_read_lock.jbd2__journal_start.__ext4_journal_start_sb.ext4_da_wri=
te_begin.generic_perform_write
      4.13 =C2=B1  6%     -99.8%       0.01 =C2=B1-10000%  perf-profile.cpu=
-cycles.do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_ge=
t_write_access.ext4_reserve_inode_write.ext4_mark_inode_dirty
     34.70 =C2=B1  0%     -10.1%      31.19 =C2=B1  1%  perf-profile.cpu-cy=
cles.ext4_da_write_end.generic_perform_write.__generic_file_write_iter.ext4=
_file_write_iter.__vfs_write
     26.13 =C2=B1  1%     -16.6%      21.80 =C2=B1  1%  perf-profile.cpu-cy=
cles.ext4_dirty_inode.__mark_inode_dirty.generic_write_end.ext4_da_write_en=
d.generic_perform_write
      3.76 =C2=B1  3%      +9.2%       4.11 =C2=B1  2%  perf-profile.cpu-cy=
cles.ext4_get_inode_loc.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4=
_dirty_inode.__mark_inode_dirty
     10.35 =C2=B1  0%     +13.4%      11.74 =C2=B1  2%  perf-profile.cpu-cy=
cles.ext4_mark_iloc_dirty.ext4_mark_inode_dirty.ext4_dirty_inode.__mark_ino=
de_dirty.generic_write_end
     23.99 =C2=B1  1%     -19.4%      19.35 =C2=B1  2%  perf-profile.cpu-cy=
cles.ext4_mark_inode_dirty.ext4_dirty_inode.__mark_inode_dirty.generic_writ=
e_end.ext4_da_write_end
     11.94 =C2=B1  4%     -53.5%       5.55 =C2=B1  3%  perf-profile.cpu-cy=
cles.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mark=
_inode_dirty.generic_write_end
     30.83 =C2=B1  0%     -13.8%      26.58 =C2=B1  1%  perf-profile.cpu-cy=
cles.generic_write_end.ext4_da_write_end.generic_perform_write.__generic_fi=
le_write_iter.ext4_file_write_iter
      7.42 =C2=B1  0%     +16.8%       8.67 =C2=B1  1%  perf-profile.cpu-cy=
cles.jbd2__journal_start.__ext4_journal_start_sb.ext4_da_write_begin.generi=
c_perform_write.__generic_file_write_iter
      1.62 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.jbd2_journal_add_journal_head.jbd2_journal_get_write_access.__ext4_jou=
rnal_get_write_access.ext4_reserve_inode_write.ext4_mark_inode_dirty
      3.63 =C2=B1  1%     +19.7%       4.34 =C2=B1  3%  perf-profile.cpu-cy=
cles.jbd2_journal_dirty_metadata.__ext4_handle_dirty_metadata.ext4_mark_ilo=
c_dirty.ext4_mark_inode_dirty.ext4_dirty_inode
      7.43 =C2=B1  3%     -92.3%       0.57 =C2=B1 22%  perf-profile.cpu-cy=
cles.jbd2_journal_get_write_access.__ext4_journal_get_write_access.ext4_res=
erve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode
      1.01 =C2=B1  9%     +45.9%       1.47 =C2=B1  5%  perf-profile.cpu-cy=
cles.jbd2_journal_grab_journal_head.jbd2_journal_dirty_metadata.__ext4_hand=
le_dirty_metadata.ext4_mark_iloc_dirty.ext4_mark_inode_dirty
      1.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.jbd2_journal_put_journal_head.jbd2_journal_get_write_access.__ext4_jou=
rnal_get_write_access.ext4_reserve_inode_write.ext4_mark_inode_dirty
      2.68 =C2=B1  1%     +17.4%       3.15 =C2=B1  5%  perf-profile.cpu-cy=
cles.jbd2_journal_stop.__ext4_journal_stop.ext4_da_write_end.generic_perfor=
m_write.__generic_file_write_iter
      3.89 =C2=B1  3%     +18.0%       4.58 =C2=B1  2%  perf-profile.cpu-cy=
cles.start_this_handle.jbd2__journal_start.__ext4_journal_start_sb.ext4_da_=
write_begin.generic_perform_write
      6.77 =C2=B1  1%     +14.2%       7.74 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath
      0.90 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.unlock_buffer.do_get_write_access.jbd2_journal_get_write_access.__ext4=
_journal_get_write_access.ext4_reserve_inode_write
      5.98 =C2=B1  1%     +16.8%       6.98 =C2=B1  1%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath
      1323 =C2=B1 24%     -67.3%     433.50 =C2=B1 14%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
   1153750 =C2=B1  5%     +12.2%    1294517 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
   -260439 =C2=B1-69%    -103.8%       9885 =C2=B1199%  sched_debug.cfs_rq[=
1]:/.spread0
      1237 =C2=B1 18%     -78.8%     262.50 =C2=B1 28%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
     87.25 =C2=B1 17%    +165.6%     231.75 =C2=B1 56%  sched_debug.cfs_rq[=
2]:/.load
    942.25 =C2=B1 16%     -78.5%     203.00 =C2=B1 36%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
      1749 =C2=B1 26%     -48.3%     903.50 =C2=B1 72%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    206.25 =C2=B1 39%     -44.5%     114.50 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.load
    162.00 =C2=B1  3%     -25.8%     120.25 =C2=B1 21%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
   -241296 =C2=B1-76%    -102.5%       5936 =C2=B1118%  sched_debug.cfs_rq[=
3]:/.spread0
      1930 =C2=B1 22%     -46.9%       1024 =C2=B1 63%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1203 =C2=B1  9%     -72.3%     333.50 =C2=B1 46%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
    921.50 =C2=B1 95%    +131.9%       2137 =C2=B1 37%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
   1080842 =C2=B1  3%     +17.8%    1273061 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   -333430 =C2=B1-48%     -96.5%     -11621 =C2=B1-147%  sched_debug.cfs_rq=
[4]:/.spread0
      1077 =C2=B1 86%    +110.7%       2269 =C2=B1 35%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      1288 =C2=B1 19%     -76.7%     300.50 =C2=B1 23%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
      1205 =C2=B1 14%     -68.7%     376.75 =C2=B1 52%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
   1095954 =C2=B1  4%     +17.7%    1290354 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   -318381 =C2=B1-49%    -101.8%       5587 =C2=B1256%  sched_debug.cfs_rq[=
6]:/.spread0
      1265 =C2=B1 14%     -71.3%     363.50 =C2=B1 46%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
      1251 =C2=B1 20%     -76.9%     289.75 =C2=B1 32%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
     10.00 =C2=B1 23%     -75.0%       2.50 =C2=B1 20%  sched_debug.cpu#0.n=
r_running
     10.50 =C2=B1 14%     -76.2%       2.50 =C2=B1 44%  sched_debug.cpu#1.n=
r_running
      1793 =C2=B1 12%     -26.9%       1311 =C2=B1 12%  sched_debug.cpu#2.c=
urr->pid
      8.00 =C2=B1 26%     -71.9%       2.25 =C2=B1 36%  sched_debug.cpu#2.n=
r_running
   -246.00 =C2=B1-46%     -93.2%     -16.75 =C2=B1-607%  sched_debug.cpu#2.=
nr_uninterruptible
     10.50 =C2=B1 14%     -73.8%       2.75 =C2=B1 30%  sched_debug.cpu#3.n=
r_running
    128.50 =C2=B1 11%     -20.0%     102.75 =C2=B1  8%  sched_debug.cpu#4.c=
pu_load[0]
    127.75 =C2=B1  9%     -16.0%     107.25 =C2=B1 11%  sched_debug.cpu#4.c=
pu_load[1]
     10.50 =C2=B1 20%     -73.8%       2.75 =C2=B1 30%  sched_debug.cpu#4.n=
r_running
      9.75 =C2=B1 15%     -71.8%       2.75 =C2=B1 15%  sched_debug.cpu#5.n=
r_running
    122.00 =C2=B1  9%     +19.7%     146.00 =C2=B1  8%  sched_debug.cpu#6.c=
pu_load[1]
    120.00 =C2=B1  7%     +25.8%     151.00 =C2=B1 15%  sched_debug.cpu#6.c=
pu_load[2]
     10.75 =C2=B1 21%     -72.1%       3.00 =C2=B1 52%  sched_debug.cpu#6.n=
r_running
      1971 =C2=B1  9%     -34.0%       1300 =C2=B1 17%  sched_debug.cpu#7.c=
urr->pid
     10.00 =C2=B1 23%     -82.5%       1.75 =C2=B1 24%  sched_debug.cpu#7.n=
r_running
     40663 =C2=B1  2%     -18.6%      33116 =C2=B1  0%  latency_stats.avg.b=
alance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write.__=
generic_file_write_iter.ext4_file_write_iter.__vfs_write.vfs_write.SyS_writ=
e.system_call_fastpath
    508303 =C2=B1  3%      +3.3%     525071 =C2=B1  2%  latency_stats.avg.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.system_call_fastpath
     65195 =C2=B1  4%     -13.7%      56254 =C2=B1  3%  latency_stats.avg.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_update_time.file_update_time.__generic_file_write_ite=
r.ext4_file_write_iter.__vfs_write
      3440 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_ext_truncate.ext4=
_truncate.ext4_setattr.notify_change.do_truncate.do_sys_ftruncate.SyS_ftrun=
cate
    453.25 =C2=B1  4%     +67.1%     757.50 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
    968.50 =C2=B1 16%     +28.9%       1248 =C2=B1 10%  latency_stats.avg.e=
p_poll.SyS_epoll_wait.system_call_fastpath
    438.50 =C2=B1  8%     -32.7%     295.00 =C2=B1  1%  latency_stats.avg.r=
ing_buffer_wait.wait_on_pipe.tracing_wait_pipe.tracing_read_pipe.__vfs_read=
.vfs_read.SyS_read.system_call_fastpath
    686.00 =C2=B1 22%     -21.1%     541.50 =C2=B1 16%  latency_stats.avg.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cifs].cifs_posi=
x_open.[cifs].cifs_open.[cifs].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open.do_sys_open.SyS_open
    874.50 =C2=B1 55%     -47.7%     457.75 =C2=B1 11%  latency_stats.avg.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cifs].cifs_posi=
x_open.[cifs].cifs_open.[cifs].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open.do_sys_open.SyS_openat
      1169 =C2=B1140%     -86.2%     161.75 =C2=B1  5%  latency_stats.avg.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSSMBUnixQPathInfo.[cifs].cifs=
_get_inode_info_unix.[cifs].cifs_lookup.[cifs].lookup_real.__lookup_hash.do=
_unlinkat.SyS_unlink.system_call_fastpath
    199.00 =C2=B1  7%     -19.5%     160.25 =C2=B1 15%  latency_stats.avg.w=
ait_for_response.[cifs].SendReceive2.[cifs].CIFSSMBWrite2.[cifs].cifs_sync_=
write.[cifs].cifs_write.[cifs].cifs_write_end.[cifs].generic_perform_write.=
__generic_file_write_iter.generic_file_write_iter.cifs_strict_writev.[cifs]=
.__vfs_write.vfs_write
    107505 =C2=B1 14%     +51.7%     163094 =C2=B1 11%  latency_stats.avg.w=
ait_transaction_locked.start_this_handle.jbd2__journal_start.__ext4_journal=
_start_sb.ext4_dirty_inode.__mark_inode_dirty.generic_update_time.file_upda=
te_time.__generic_file_write_iter.ext4_file_write_iter.__vfs_write.vfs_write
    103169 =C2=B1 12%    +514.6%     634103 =C2=B1  1%  latency_stats.hits.=
balance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write._=
_generic_file_write_iter.ext4_file_write_iter.__vfs_write.vfs_write.SyS_wri=
te.system_call_fastpath
      1.00 =C2=B1 81%    +225.0%       3.25 =C2=B1 50%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.=
flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS=
_execve.return_from_execve
     26.00 =C2=B1 14%     +30.8%      34.00 =C2=B1 13%  latency_stats.hits.=
do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_=
access.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_da_write_end.gen=
eric_perform_write.__generic_file_write_iter.ext4_file_write_iter.__vfs_wri=
te.vfs_write.SyS_write
      2835 =C2=B1  5%     +11.4%       3158 =C2=B1  3%  latency_stats.hits.=
do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_=
access.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__ma=
rk_inode_dirty.generic_update_time.file_update_time.__generic_file_write_it=
er.ext4_file_write_iter.__vfs_write
    663.50 =C2=B1 10%     -40.2%     396.75 =C2=B1  8%  latency_stats.hits.=
do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_=
access.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__ma=
rk_inode_dirty.generic_write_end.ext4_da_write_end.generic_perform_write.__=
generic_file_write_iter.ext4_file_write_iter
      1.75 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_=
access.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_ext_truncate.ext=
4_truncate.ext4_setattr.notify_change.do_truncate.do_sys_ftruncate.SyS_ftru=
ncate
      1661 =C2=B1  0%     +17.3%       1948 =C2=B1  1%  latency_stats.hits.=
do_wait.SyS_wait4.system_call_fastpath
    142.50 =C2=B1  6%     +15.3%     164.25 =C2=B1 11%  latency_stats.hits.=
ep_poll.SyS_epoll_wait.system_call_fastpath
    394313 =C2=B1  0%     -10.2%     354275 =C2=B1  4%  latency_stats.hits.=
hrtimer_nanosleep.SyS_nanosleep.system_call_fastpath
    465945 =C2=B1 23%     -37.9%     289496 =C2=B1  4%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
    337392 =C2=B1  8%     -49.8%     169230 =C2=B1  8%  latency_stats.hits.=
ring_buffer_wait.wait_on_pipe.tracing_wait_pipe.tracing_read_pipe.__vfs_rea=
d.vfs_read.SyS_read.system_call_fastpath
     91.75 =C2=B1 47%     -87.6%      11.33 =C2=B1141%  latency_stats.hits.=
wait_iff_congested.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to=
_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__=
page_cache_alloc.pagecache_get_page.grab_cache_page_write_begin.ext4_da_wri=
te_begin
      1123 =C2=B1  3%     -41.6%     656.00 =C2=B1  6%  latency_stats.hits.=
wait_transaction_locked.start_this_handle.jbd2__journal_start.__ext4_journa=
l_start_sb.ext4_da_write_begin.generic_perform_write.__generic_file_write_i=
ter.ext4_file_write_iter.__vfs_write.vfs_write.SyS_write.system_call_fastpa=
th
      4105 =C2=B1  0%     -38.2%       2535 =C2=B1  3%  latency_stats.hits.=
wait_transaction_locked.start_this_handle.jbd2__journal_start.__ext4_journa=
l_start_sb.ext4_dirty_inode.__mark_inode_dirty.generic_update_time.file_upd=
ate_time.__generic_file_write_iter.ext4_file_write_iter.__vfs_write.vfs_wri=
te
   1030093 =C2=B1  9%     +11.9%    1152679 =C2=B1  6%  latency_stats.max.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.system_call_fastpath
    309120 =C2=B1 43%     -41.6%     180418 =C2=B1 23%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_da_write_end.gene=
ric_perform_write.__generic_file_write_iter.ext4_file_write_iter.__vfs_writ=
e.vfs_write.SyS_write
      4459 =C2=B1 75%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_ext_truncate.ext4=
_truncate.ext4_setattr.notify_change.do_truncate.do_sys_ftruncate.SyS_ftrun=
cate
      4823 =C2=B1  1%      +2.5%       4943 =C2=B1  0%  latency_stats.max.e=
p_poll.SyS_epoll_wait.system_call_fastpath
      1271 =C2=B1 69%     -55.1%     570.75 =C2=B1  8%  latency_stats.max.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cifs].cifs_posi=
x_open.[cifs].cifs_do_create.[cifs].cifs_atomic_open.[cifs].do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
     11400 =C2=B1126%     -91.8%     939.75 =C2=B1 37%  latency_stats.max.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cifs].cifs_posi=
x_open.[cifs].cifs_open.[cifs].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open.do_sys_open.SyS_openat
      1169 =C2=B1140%     -86.2%     161.75 =C2=B1  5%  latency_stats.max.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSSMBUnixQPathInfo.[cifs].cifs=
_get_inode_info_unix.[cifs].cifs_lookup.[cifs].lookup_real.__lookup_hash.do=
_unlinkat.SyS_unlink.system_call_fastpath
   4.2e+09 =C2=B1 13%    +399.9%    2.1e+10 =C2=B1  1%  latency_stats.sum.b=
alance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write.__=
generic_file_write_iter.ext4_file_write_iter.__vfs_write.vfs_write.SyS_writ=
e.system_call_fastpath
  24398593 =C2=B1  3%      +3.3%   25203443 =C2=B1  2%  latency_stats.sum.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.system_call_fastpath
  10100882 =C2=B1 15%     -24.3%    7648970 =C2=B1 12%  latency_stats.sum.c=
all_rwsem_down_read_failed.ext4_da_get_block_prep.__block_write_begin.ext4_=
da_write_begin.generic_perform_write.__generic_file_write_iter.ext4_file_wr=
ite_iter.__vfs_write.vfs_write.SyS_write.system_call_fastpath
      6.00 =C2=B1 81%    +216.7%      19.00 =C2=B1 56%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
  38146064 =C2=B1 11%     -40.7%   22612285 =C2=B1  6%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_write_end.ext4_da_write_end.generic_perform_write.__g=
eneric_file_write_iter.ext4_file_write_iter
      7994 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_ext_truncate.ext4=
_truncate.ext4_setattr.notify_change.do_truncate.do_sys_ftruncate.SyS_ftrun=
cate
    753440 =C2=B1  3%     +96.0%    1476939 =C2=B1  2%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
    139159 =C2=B1 21%     +49.1%     207524 =C2=B1 22%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.system_call_fastpath
  22735513 =C2=B1  0%     -10.0%   20470551 =C2=B1  4%  latency_stats.sum.h=
rtimer_nanosleep.SyS_nanosleep.system_call_fastpath
 2.014e+08 =C2=B1  6%     -51.4%   97800459 =C2=B1  4%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
 1.488e+08 =C2=B1 14%     -66.4%   49982280 =C2=B1  7%  latency_stats.sum.r=
ing_buffer_wait.wait_on_pipe.tracing_wait_pipe.tracing_read_pipe.__vfs_read=
.vfs_read.SyS_read.system_call_fastpath
     79639 =C2=B1 22%     -21.2%      62767 =C2=B1 17%  latency_stats.sum.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cifs].cifs_posi=
x_open.[cifs].cifs_open.[cifs].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open.do_sys_open.SyS_open
     25189 =C2=B1 56%     -49.1%      12823 =C2=B1 11%  latency_stats.sum.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cifs].cifs_posi=
x_open.[cifs].cifs_open.[cifs].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open.do_sys_open.SyS_openat
      1169 =C2=B1140%     -86.2%     161.75 =C2=B1  5%  latency_stats.sum.w=
ait_for_response.[cifs].SendReceive.[cifs].CIFSSMBUnixQPathInfo.[cifs].cifs=
_get_inode_info_unix.[cifs].cifs_lookup.[cifs].lookup_real.__lookup_hash.do=
_unlinkat.SyS_unlink.system_call_fastpath
     24794 =C2=B1 13%     -25.1%      18564 =C2=B1 14%  latency_stats.sum.w=
ait_for_response.[cifs].SendReceive2.[cifs].CIFSSMBWrite2.[cifs].cifs_sync_=
write.[cifs].cifs_write.[cifs].cifs_write_end.[cifs].generic_perform_write.=
__generic_file_write_iter.generic_file_write_iter.cifs_strict_writev.[cifs]=
.__vfs_write.vfs_write
    108340 =C2=B1 27%     -81.3%      20256 =C2=B1141%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to_=
free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__p=
age_cache_alloc.pagecache_get_page.grab_cache_page_write_begin.ext4_da_writ=
e_begin
 1.015e+08 =C2=B1 11%     -36.3%   64626646 =C2=B1 16%  latency_stats.sum.w=
ait_transaction_locked.start_this_handle.jbd2__journal_start.__ext4_journal=
_start_sb.ext4_da_write_begin.generic_perform_write.__generic_file_write_it=
er.ext4_file_write_iter.__vfs_write.vfs_write.SyS_write.system_call_fastpath
     26524 =C2=B1  5%     +16.1%      30791 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdb.bdi_dirty
    179.00 =C2=B1 15%     -46.4%      96.00 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdb.dirtied
    179.25 =C2=B1 15%     -45.0%      98.50 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdb.dirtied_pause
     58927 =C2=B1 13%     -80.8%      11327 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdb.dirty_ratelimit
  -3430677 =C2=B1-173%    -100.0%     -11.00 =C2=B1-75%  ftrace.balance_dir=
ty_pages.sdb.pause
     22.50 =C2=B1 25%     +76.7%      39.75 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdb.period
     80869 =C2=B1 18%     -86.9%      10600 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdb.task_ratelimit
   3430696 =C2=B1173%    -100.0%      49.25 =C2=B1 18%  ftrace.balance_dirt=
y_pages.sdb.think
    190.25 =C2=B1 13%     -51.8%      91.75 =C2=B1  5%  ftrace.balance_dirt=
y_pages.sdc.dirtied
    191.75 =C2=B1 13%     -51.1%      93.75 =C2=B1  5%  ftrace.balance_dirt=
y_pages.sdc.dirtied_pause
     58193 =C2=B1 19%     -81.2%      10953 =C2=B1  5%  ftrace.balance_dirt=
y_pages.sdc.dirty_ratelimit
   -424.50 =C2=B1 -2%     -98.4%      -7.00 =C2=B1-286%  ftrace.balance_dir=
ty_pages.sdc.pause
     20.00 =C2=B1 17%    +448.8%     109.75 =C2=B1114%  ftrace.balance_dirt=
y_pages.sdc.period
     76965 =C2=B1 21%     -84.8%      11683 =C2=B1  7%  ftrace.balance_dirt=
y_pages.sdc.task_ratelimit
    443.75 =C2=B1  2%     -90.4%      42.75 =C2=B1 47%  ftrace.balance_dirt=
y_pages.sdc.think
     23458 =C2=B1  9%     +22.1%      28637 =C2=B1  7%  ftrace.balance_dirt=
y_pages.sdd.bdi_dirty
    185.75 =C2=B1 14%     -49.7%      93.50 =C2=B1  5%  ftrace.balance_dirt=
y_pages.sdd.dirtied
    186.00 =C2=B1 14%     -49.2%      94.50 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdd.dirtied_pause
     61258 =C2=B1 14%     -81.7%      11213 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdd.dirty_ratelimit
   -416.00 =C2=B1 -4%    -100.1%       0.50 =C2=B1830%  ftrace.balance_dirt=
y_pages.sdd.pause
     19.25 =C2=B1 22%     +97.4%      38.00 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdd.period
     86687 =C2=B1 20%     -87.2%      11105 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdd.task_ratelimit
    433.50 =C2=B1  4%     -91.5%      36.75 =C2=B1  7%  ftrace.balance_dirt=
y_pages.sdd.think
    186.75 =C2=B1 13%     -53.1%      87.50 =C2=B1  0%  ftrace.balance_dirt=
y_pages.sde.dirtied
    188.25 =C2=B1 13%     -52.6%      89.25 =C2=B1  0%  ftrace.balance_dirt=
y_pages.sde.dirtied_pause
     60931 =C2=B1 16%     -82.8%      10461 =C2=B1  1%  ftrace.balance_dirt=
y_pages.sde.dirty_ratelimit
  -3387398 =C2=B1-173%    -100.0%      -1.25 =C2=B1-1079%  ftrace.balance_d=
irty_pages.sde.pause
     19.25 =C2=B1 14%     +94.8%      37.50 =C2=B1  1%  ftrace.balance_dirt=
y_pages.sde.period
     80501 =C2=B1 23%     -86.6%      10750 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sde.task_ratelimit
   3387416 =C2=B1173%    -100.0%      37.00 =C2=B1 34%  ftrace.balance_dirt=
y_pages.sde.think
    191.50 =C2=B1  8%     -52.3%      91.25 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdf.dirtied
    192.50 =C2=B1  8%     -51.8%      92.75 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdf.dirtied_pause
     59318 =C2=B1 10%     -81.4%      11026 =C2=B1  1%  ftrace.balance_dirt=
y_pages.sdf.dirty_ratelimit
   -425.75 =C2=B1 -1%     -96.6%     -14.50 =C2=B1-84%  ftrace.balance_dirt=
y_pages.sdf.pause
     21.50 =C2=B1 14%     +77.9%      38.25 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdf.period
     78892 =C2=B1 14%     -85.6%      11371 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdf.task_ratelimit
    446.00 =C2=B1  1%     -88.5%      51.50 =C2=B1 25%  ftrace.balance_dirt=
y_pages.sdf.think
     29879 =C2=B1  6%     -10.9%      26610 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdg.bdi_dirty
    181.75 =C2=B1 14%     -51.3%      88.50 =C2=B1  0%  ftrace.balance_dirt=
y_pages.sdg.dirtied
    182.50 =C2=B1 14%     -50.3%      90.75 =C2=B1  1%  ftrace.balance_dirt=
y_pages.sdg.dirtied_pause
     49491 =C2=B1 23%     -78.7%      10564 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdg.dirty_ratelimit
   -372.25 =C2=B1 -5%     -99.3%      -2.75 =C2=B1-376%  ftrace.balance_dir=
ty_pages.sdg.pause
     27.75 =C2=B1 16%     +48.6%      41.25 =C2=B1 17%  ftrace.balance_dirt=
y_pages.sdg.period
     63160 =C2=B1 27%     -83.3%      10550 =C2=B1  5%  ftrace.balance_dirt=
y_pages.sdg.task_ratelimit
    398.25 =C2=B1  3%     -90.4%      38.25 =C2=B1 24%  ftrace.balance_dirt=
y_pages.sdg.think
    184.00 =C2=B1 14%     -50.7%      90.75 =C2=B1  5%  ftrace.balance_dirt=
y_pages.sdh.dirtied
    185.50 =C2=B1 14%     -50.0%      92.75 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdh.dirtied_pause
     55615 =C2=B1 12%     -80.6%      10769 =C2=B1  5%  ftrace.balance_dirt=
y_pages.sdh.dirty_ratelimit
   -388.00 =C2=B1-10%     -97.9%      -8.00 =C2=B1-168%  ftrace.balance_dir=
ty_pages.sdh.pause
     23.50 =C2=B1 16%     +62.8%      38.25 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdh.period
     70106 =C2=B1 20%     -84.2%      11100 =C2=B1  6%  ftrace.balance_dirt=
y_pages.sdh.task_ratelimit
    410.25 =C2=B1  9%     -89.0%      45.00 =C2=B1 32%  ftrace.balance_dirt=
y_pages.sdh.think
    176.25 =C2=B1 14%     -47.1%      93.25 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdi.dirtied
    177.25 =C2=B1 14%     -46.3%      95.25 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdi.dirtied_pause
     45550 =C2=B1 19%     -75.7%      11062 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdi.dirty_ratelimit
   -363.75 =C2=B1 -8%     -95.3%     -17.25 =C2=B1-85%  ftrace.balance_dirt=
y_pages.sdi.pause
      2.00 =C2=B1 50%     -87.5%       0.25 =C2=B1173%  ftrace.balance_dirt=
y_pages.sdi.paused
     29.25 =C2=B1  4%     +35.0%      39.50 =C2=B1  1%  ftrace.balance_dirt=
y_pages.sdi.period
     54404 =C2=B1 24%     -80.4%      10681 =C2=B1  6%  ftrace.balance_dirt=
y_pages.sdi.task_ratelimit
    391.75 =C2=B1  7%     -85.8%      55.75 =C2=B1 26%  ftrace.balance_dirt=
y_pages.sdi.think
    180.50 =C2=B1 11%     -48.2%      93.50 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdk.dirtied
    181.75 =C2=B1 12%     -47.5%      95.50 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdk.dirtied_pause
     53838 =C2=B1 14%     -79.4%      11111 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdk.dirty_ratelimit
   -383.50 =C2=B1 -8%     -97.1%     -11.25 =C2=B1-84%  ftrace.balance_dirt=
y_pages.sdk.pause
     23.75 =C2=B1 22%     +65.3%      39.25 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdk.period
     73059 =C2=B1 22%     -84.8%      11122 =C2=B1  6%  ftrace.balance_dirt=
y_pages.sdk.task_ratelimit
    406.50 =C2=B1  6%     -88.0%      48.75 =C2=B1 20%  ftrace.balance_dirt=
y_pages.sdk.think
    179.75 =C2=B1 14%     -49.5%      90.75 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdl.dirtied
    180.50 =C2=B1 14%     -48.2%      93.50 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdl.dirtied_pause
     59262 =C2=B1  9%     -81.7%      10868 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdl.dirty_ratelimit
   -401.25 =C2=B1 -2%     -98.0%      -8.00 =C2=B1-115%  ftrace.balance_dir=
ty_pages.sdl.pause
     21.00 =C2=B1 10%     +82.1%      38.25 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdl.period
     77465 =C2=B1 15%     -86.1%      10789 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdl.task_ratelimit
    421.75 =C2=B1  1%     -89.4%      44.75 =C2=B1 21%  ftrace.balance_dirt=
y_pages.sdl.think
    185.75 =C2=B1 13%     -49.0%      94.75 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdm.dirtied
    186.75 =C2=B1 13%     -48.7%      95.75 =C2=B1  4%  ftrace.balance_dirt=
y_pages.sdm.dirtied_pause
     59214 =C2=B1 18%     -81.0%      11276 =C2=B1  3%  ftrace.balance_dirt=
y_pages.sdm.dirty_ratelimit
   -402.75 =C2=B1 -3%     -98.8%      -5.00 =C2=B1-183%  ftrace.balance_dir=
ty_pages.sdm.pause
      1.50 =C2=B1 57%    -100.0%       0.00 =C2=B1  0%  ftrace.balance_dirt=
y_pages.sdm.paused
     21.25 =C2=B1 20%     +84.7%      39.25 =C2=B1  2%  ftrace.balance_dirt=
y_pages.sdm.period
     80010 =C2=B1 25%     -85.6%      11485 =C2=B1  7%  ftrace.balance_dirt=
y_pages.sdm.task_ratelimit
    422.00 =C2=B1  3%     -89.9%      42.50 =C2=B1 20%  ftrace.balance_dirt=
y_pages.sdm.think
     60203 =C2=B1 14%     -81.5%      11163 =C2=B1  4%  ftrace.bdi_dirty_ra=
telimit.sdb.balanced_dirty_ratelimit
     58856 =C2=B1 13%     -80.9%      11269 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sdb.dirty_ratelimit
     80299 =C2=B1 18%     -87.2%      10313 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sdb.task_ratelimit
     58684 =C2=B1 18%     -81.5%      10842 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sdc.balanced_dirty_ratelimit
     58173 =C2=B1 19%     -81.3%      10902 =C2=B1  5%  ftrace.bdi_dirty_ra=
telimit.sdc.dirty_ratelimit
     77036 =C2=B1 21%     -85.1%      11441 =C2=B1  9%  ftrace.bdi_dirty_ra=
telimit.sdc.task_ratelimit
     63739 =C2=B1 14%     -82.8%      10955 =C2=B1  1%  ftrace.bdi_dirty_ra=
telimit.sdd.balanced_dirty_ratelimit
     61299 =C2=B1 14%     -81.8%      11184 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sdd.dirty_ratelimit
     86718 =C2=B1 20%     -87.4%      10969 =C2=B1  1%  ftrace.bdi_dirty_ra=
telimit.sdd.task_ratelimit
     62431 =C2=B1 16%     -82.8%      10760 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sde.balanced_dirty_ratelimit
     60940 =C2=B1 16%     -82.9%      10415 =C2=B1  1%  ftrace.bdi_dirty_ra=
telimit.sde.dirty_ratelimit
     80144 =C2=B1 22%     -86.9%      10513 =C2=B1  4%  ftrace.bdi_dirty_ra=
telimit.sde.task_ratelimit
     61030 =C2=B1 11%     -81.6%      11236 =C2=B1  1%  ftrace.bdi_dirty_ra=
telimit.sdf.balanced_dirty_ratelimit
     59341 =C2=B1 10%     -81.5%      10997 =C2=B1  1%  ftrace.bdi_dirty_ra=
telimit.sdf.dirty_ratelimit
     78573 =C2=B1 14%     -85.5%      11382 =C2=B1  2%  ftrace.bdi_dirty_ra=
telimit.sdf.task_ratelimit
     49805 =C2=B1 24%     -78.4%      10782 =C2=B1  5%  ftrace.bdi_dirty_ra=
telimit.sdg.balanced_dirty_ratelimit
     49586 =C2=B1 23%     -78.8%      10508 =C2=B1  2%  ftrace.bdi_dirty_ra=
telimit.sdg.dirty_ratelimit
     62941 =C2=B1 28%     -83.5%      10409 =C2=B1  6%  ftrace.bdi_dirty_ra=
telimit.sdg.task_ratelimit
     56232 =C2=B1 13%     -80.5%      10962 =C2=B1  7%  ftrace.bdi_dirty_ra=
telimit.sdh.balanced_dirty_ratelimit
     55658 =C2=B1 12%     -80.7%      10737 =C2=B1  6%  ftrace.bdi_dirty_ra=
telimit.sdh.dirty_ratelimit
     69833 =C2=B1 20%     -84.4%      10906 =C2=B1  7%  ftrace.bdi_dirty_ra=
telimit.sdh.task_ratelimit
     44050 =C2=B1 17%     -75.7%      10685 =C2=B1  4%  ftrace.bdi_dirty_ra=
telimit.sdi.balanced_dirty_ratelimit
     45546 =C2=B1 19%     -75.8%      11013 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sdi.dirty_ratelimit
     54325 =C2=B1 24%     -80.6%      10513 =C2=B1  7%  ftrace.bdi_dirty_ra=
telimit.sdi.task_ratelimit
     54470 =C2=B1 16%     -80.2%      10809 =C2=B1  2%  ftrace.bdi_dirty_ra=
telimit.sdk.balanced_dirty_ratelimit
     53799 =C2=B1 14%     -79.4%      11069 =C2=B1  4%  ftrace.bdi_dirty_ra=
telimit.sdk.dirty_ratelimit
     72874 =C2=B1 22%     -85.2%      10787 =C2=B1  6%  ftrace.bdi_dirty_ra=
telimit.sdk.task_ratelimit
     60161 =C2=B1 10%     -82.0%      10837 =C2=B1  2%  ftrace.bdi_dirty_ra=
telimit.sdl.balanced_dirty_ratelimit
     59266 =C2=B1  9%     -81.7%      10819 =C2=B1  5%  ftrace.bdi_dirty_ra=
telimit.sdl.dirty_ratelimit
     77010 =C2=B1 16%     -86.3%      10563 =C2=B1  2%  ftrace.bdi_dirty_ra=
telimit.sdl.task_ratelimit
     60632 =C2=B1 18%     -81.0%      11544 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sdm.balanced_dirty_ratelimit
     59157 =C2=B1 18%     -81.0%      11246 =C2=B1  3%  ftrace.bdi_dirty_ra=
telimit.sdm.dirty_ratelimit
     79666 =C2=B1 25%     -86.0%      11179 =C2=B1  6%  ftrace.bdi_dirty_ra=
telimit.sdm.task_ratelimit
    263022 =C2=B1  7%     -10.6%     235031 =C2=B1  4%  ftrace.writeback_si=
ngle_inode.sde.index
      2635 =C2=B1  5%     -12.1%       2317 =C2=B1  2%  ftrace.writeback_si=
ngle_inode.sde.wrote
      2810 =C2=B1  8%     -12.2%       2466 =C2=B1  4%  ftrace.writeback_si=
ngle_inode.sdf.wrote
      1.00 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  ftrace.writeback_si=
ngle_inode.sdg.age
      3173 =C2=B1 10%     -25.6%       2360 =C2=B1  4%  ftrace.writeback_si=
ngle_inode.sdg.wrote
      1.00 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  ftrace.writeback_si=
ngle_inode.sdh.age
      3521 =C2=B1 14%     -26.7%       2581 =C2=B1  7%  ftrace.writeback_si=
ngle_inode.sdi.wrote


lkp-st02: Core2
Memory: 8G


                                   softirqs.SCHED

  200000 ++----------------------------------------------------------------=
-+
  180000 ++                   O                                            =
 |
         |                 O            O                                  =
 |
  160000 ++                          O                         O           =
 |
  140000 O+        O  O            O       O    O    O    O       O        =
 |
         |       O      O       O                 O          O             =
 |
  120000 ++   O                              O         O            O  O O =
 O
  100000 ++                                                                =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++          .*.*..  .*.       .*..         .*.                    =
 |
   40000 ++ *.*..*.*.      *.   *..*.*.    *.*..*.*.   *                   =
 |
         | +                                                               =
 |
   20000 ++                                                                =
 |
       0 *+-O--------------------------------------------------------------=
-+


                              perf-stat.cpu-migrations

  400000 ++-------------------O--------------------------------------------=
-+
         |                 O                                               =
 |
  350000 ++                          O  O                      O           =
 |
         O            O            O       O         O            O        =
 |
  300000 ++      O O    O       O               O O       O  O             =
 |
  250000 ++   O                              O         O            O  O O =
 O
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
  100000 ++          .*.*..  .*.       .*..                                =
 |
         |  *.*..*.*.      *.   *..*.*.    *.*..*.*..*.*                   =
 |
   50000 +++                                                               =
 |
         |+                                                                =
 |
       0 *+-O--------------------------------------------------------------=
-+


                                  vmstat.procs.r

  100 ++-------------------------------------------------------------------=
-+
   90 ++ *.                     .*..*.  .*..                               =
 |
      |  : *..*..*.     .*.. .*.      *.    *.*..*..*.*                    =
 |
   80 ++ :         *..*.    *                                              =
 |
   70 ++:                                                                  =
 |
      | :                                                                  =
 |
   60 ++:                                                                  =
 |
   50 ++:                                                                  =
 |
   40 ++                                                                   =
 |
      |:   O                                O         O             O  O   =
 O
   30 O+      O  O O  O       O  O  O O  O    O  O  O    O  O  O O       O =
 |
   20 ++                 O  O                                              =
 |
      |                                                                    =
 |
   10 ++                                                                   =
 |
    0 *+-O-----------------------------------------------------------------=
-+


                                  vmstat.procs.b

  100 ++-------------------------------------------------------------------=
-+
   90 ++                 O  O       O O                                    =
 |
      O       O    O             O       O    O  O  O    O  O  O O         =
 |
   80 ++   O     O    O       O             O         O             O  O O =
 O
   70 ++                                                                   =
 |
      |                                                                    =
 |
   60 ++                                                                   =
 |
   50 ++                                                                   =
 |
   40 ++                                                                   =
 |
      |              .*..   *                                              =
 |
   30 ++          .*.     .. +                  .*..                       =
 |
   20 ++  .*..*..*       *    *..*.. .*..  .*.*.    *.*                    =
 |
      |  *                          *    *.                                =
 |
   10 ++.                                                                  =
 |
    0 *+-O-----------------------------------------------------------------=
-+


                               proc-vmstat.pgactivate

  900000 ++----------------O--O------O--O----------------------O--O--------=
-+
         O    O  O O  O O       O  O       O O  O O  O O  O  O      O  O O =
 O
  800000 ++                                                                =
 |
  700000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
         |           .*.*..  .*.                                           =
 |
  400000 ++  .*.. .*.      *.   *..         .*..*.*..*.*                   =
 |
  300000 ++ *    *                 *.*..*..*                               =
 |
         | :                                                               =
 |
  200000 ++:                                                               =
 |
  100000 ++                                                                =
 |
         |:                                                                =
 |
       0 *+-O--------------------------------------------------------------=
-+


                       ftrace.balance_dirty_pages.sdc.pause

   50 ++-------------------------------------------------------------------=
-+
    0 O+ O    O    O  O     O       O O  O    O  O  O    O  O  O O     O   =
 O
      |    O     O       O    O  O          O         O             O    O =
 |
  -50 ++                                                                   =
 |
 -100 ++                                                                   =
 |
      |:                                                                   =
 |
 -150 ++                                                                   =
 |
 -200 ++:                                                                  =
 |
 -250 ++:                                                                  =
 |
      | :                                                                  =
 |
 -300 ++:                           *.  .*                                 =
 |
 -350 ++ :            *     *     ..  *.  +                                =
 |
      |  :          .. +   + +  .*         +                               =
 |
 -400 ++ *.*..  .*.*    + +   *.            *.  .*..*.                     =
 |
 -450 ++------*----------*--------------------*-------*--------------------=
-+


                       ftrace.balance_dirty_pages.sdc.think

  500 ++-------------------------------------------------------------------=
-+
  450 ++     .*..*.      *..                 .*..    .*                    =
 |
      |  *.*.      *..  +    .*..           *    *..*                      =
 |
  400 ++ :             +    *    *..       +                               =
 |
  350 ++ :            *              .*.. +                                =
 |
      | :                           *    *                                 =
 |
  300 ++:                                                                  =
 |
  250 ++:                                                                  =
 |
  200 ++:                                                                  =
 |
      |:                                                                   =
 |
  150 ++                                                                   =
 |
  100 ++                                                                   =
 |
      |:         O                                                  O    O =
 |
   50 O+   O  O    O  O  O  O O  O    O  O  O O  O  O O  O  O  O O     O   =
 O
    0 *+-O--------------------------O--------------------------------------=
-+


                       ftrace.balance_dirty_pages.sdg.pause

   50 ++-------------------------------------------------------------------=
-+
    0 O+ O    O          O  O O  O  O O  O    O  O  O    O  O  O O  O      =
 O
      |    O     O O  O                     O         O                O O =
 |
  -50 ++                                                                   =
 |
 -100 ++                                                                   =
 |
      |:                                                                   =
 |
 -150 ++                                                                   =
 |
 -200 ++:                                                                  =
 |
 -250 ++:                                                                  =
 |
      | :                   *       *                                      =
 |
 -300 ++:            .*    : :     + +                                     =
 |
 -350 ++ :         *.  +   : :    +   *..*..    .*..  *                    =
 |
      |  :        +     + :   : .*          *.*.     +                     =
 |
 -400 ++ *.*..*..*       *    *.                    *                      =
 |
 -450 ++-------------------------------------------------------------------=
-+


                       ftrace.balance_dirty_pages.sdg.think

  450 ++------*--*-------*----*--------------------------------------------=
-+
      |  *.*.     :     + :   :            .*.     .*.                     =
 |
  400 ++ :        :    +   : :   *      .*.   *..*.   *                    =
 |
  350 ++ :         *..*    : :    +   *.                                   =
 |
      | :                   *      + +                                     =
 |
  300 ++:                           *                                      =
 |
  250 ++:                                                                  =
 |
      | :                                                                  =
 |
  200 ++                                                                   =
 |
  150 ++                                                                   =
 |
      |:                                                                   =
 |
  100 ++                                                                   =
 |
   50 ++   O     O O                                                     O =
 |
      O       O       O  O  O O  O  O O  O  O O  O  O O  O  O  O O  O  O   =
 O
    0 *+-O-----------------------------------------------------------------=
-+


                       ftrace.balance_dirty_pages.sdl.pause

   50 ++-------------------------------------------------------------------=
-+
    0 O+ O         O  O  O  O    O  O O  O          O          O O     O   =
 O
      |    O  O  O            O             O O  O    O  O  O       O    O =
 |
  -50 ++                                                                   =
 |
 -100 ++                                                                   =
 |
      |:                                                                   =
 |
 -150 ++                                                                   =
 |
 -200 ++:                                                                  =
 |
 -250 ++:             *                                                    =
 |
      | :            : :                                                   =
 |
 -300 ++:            :  :   *      .*.                                     =
 |
 -350 ++ :          :   : .. :   *.   *..*..                               =
 |
      |  *.         :    *   : ..               .*..                       =
 |
 -400 ++   *..  .*.*          *             *.*.    *.*                    =
 |
 -450 ++------*------------------------------------------------------------=
-+


                       ftrace.balance_dirty_pages.sdl.think

  500 ++-------------------------------------------------------------------=
-+
  450 ++     .*..                                                          =
 |
      |   .*.    *.*     *..  *..           *.*..  .*.*                    =
 |
  400 ++ *          :   :    +            ..     *.                        =
 |
  350 ++ :           :  :   *    *.. .*..*                                 =
 |
      | :            : :            *                                      =
 |
  300 ++:             *                                                    =
 |
  250 ++:                                                                  =
 |
  200 ++:                                                                  =
 |
      |:                                                                   =
 |
  150 ++                                                                   =
 |
  100 ++                                                                   =
 |
      |:   O  O                                                          O =
 |
   50 O+         O O  O     O O  O  O O  O  O O  O  O O  O  O  O O  O  O   =
 O
    0 *+-O---------------O-------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang
-------------------------------------
lkp(a)eclists.intel.com
https://eclists.intel.com/sympa/info/lkp
Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "Uns=
ubscribe lkp"


--===============7555939915151135574==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZGQtd3JpdGUKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAogIHVw
dGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1z
dGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBp
bnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9j
a19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5n
OiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6
IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2
MApkZWZhdWx0LXdhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9n
b3Zlcm5vcjogCmNvbW1pdDogYTNhY2EzM2IzYWYwZjY5NjE3MTljNjhhNWIxYjU2MTIwNmVhYTRi
OAptb2RlbDogQ29yZTIKbWVtb3J5OiA4Rwpucl9oZGRfcGFydGl0aW9uczogMTIKd2FpdF9kaXNr
c190aW1lb3V0OiAzMDAKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvc2NzaS0zNTAw
MGM1MDAwPz8/Pz8/PyIKc3dhcF9wYXJ0aXRpb25zOiAKcnVudGltZTogNW0KZGlzazogMTFIREQK
bWQ6IEpCT0QKaW9zY2hlZDogY2ZxCmZzOiBleHQ0CmZzMjogCm1vbml0b3JzOgogIHBlcmYtc3Rh
dDogCiAgcGVyZi1wcm9maWxlOiAKICBmdHJhY2U6CiAgICBldmVudHM6IGJhbGFuY2VfZGlydHlf
cGFnZXMgYmRpX2RpcnR5X3JhdGVsaW1pdCBnbG9iYWxfZGlydHlfc3RhdGUgd3JpdGViYWNrX3Np
bmdsZV9pbm9kZQpucl90aHJlYWRzOiAxMGRkCmRkOiAKdGVzdGJveDogbGtwLXN0MDIKdGJveF9n
cm91cDogbGtwLXN0MDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTA2
LTE1IDExOjM5OjI3LjAxNTgwODEyNiArMDg6MDAKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKY29t
cGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGEzYWNhMzNiM2FmMGY2OTYxNzE5YzY4YTViMWI1
NjEyMDZlYWE0YjgKYmFzZV9jb21taXQ6IDBmNTdkODY3ODdkOGIxMDc2ZWE4ZjljYmRkZGRhMmE0
NmQ1MzRhMjcKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA2MTYwOQprZXJu
ZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYTNhY2EzM2IzYWYwZjY5NjE3MTlj
NjhhNWIxYjU2MTIwNmVhYTRiOC92bWxpbnV6LTQuMS4wLXJjOC13bC0wNDE3OC1nYTNhY2EzMyIK
cm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3Vs
dC9kZC13cml0ZS8zMDAtNW0tMTFIREQtSkJPRC1jZnEtZXh0NC0xMGRkL2xrcC1zdDAyL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9hM2FjYTMzYjNhZjBm
Njk2MTcxOWM2OGE1YjFiNTYxMjA2ZWFhNGI4LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQv
bGtwLXN0MDIvY3ljbGljX2RkLXdyaXRlLTMwMC01bS0xMUhERC1KQk9ELWNmcS1leHQ0LTEwZGQt
eDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtYTNhY2EzM2IzYWYwZjY5NjE3MTljNjhhNWIxYjU2MTIw
NmVhYTRiOC0wLTIwMTUwNjE1LTk2MjAwLXRqcDA5Zy55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUt
MDYtMTYgMDk6NDk6MzMuOTQ1NDM1MTE1ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3Vw
dGltZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAot
IGpvYj0vbGtwL3NjaGVkdWxlZC9sa3Atc3QwMi9jeWNsaWNfZGQtd3JpdGUtMzAwLTVtLTExSERE
LUpCT0QtY2ZxLWV4dDQtMTBkZC14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC1hM2FjYTMzYjNhZjBm
Njk2MTcxOWM2OGE1YjFiNTYxMjA2ZWFhNGI4LTAtMjAxNTA2MTUtOTYyMDAtdGpwMDlnLnlhbWwK
LSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwv
ZGV2ZWwtaG91cmx5LTIwMTUwNjE2MDkKLSBjb21taXQ9YTNhY2EzM2IzYWYwZjY5NjE3MTljNjhh
NWIxYjU2MTIwNmVhYTRiOAotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2Mt
NC45L2EzYWNhMzNiM2FmMGY2OTYxNzE5YzY4YTViMWI1NjEyMDZlYWE0Yjgvdm1saW51ei00LjEu
MC1yYzgtd2wtMDQxNzgtZ2EzYWNhMzMKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0v
cmVzdWx0L2RkLXdyaXRlLzMwMC01bS0xMUhERC1KQk9ELWNmcS1leHQ0LTEwZGQvbGtwLXN0MDIv
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2EzYWNhMzNi
M2FmMGY2OTYxNzE5YzY4YTViMWI1NjEyMDZlYWE0YjgvMAotIExLUF9TRVJWRVI9aW5uCi0gfDIt
CgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVi
dWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxs
X3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1w
YW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xl
PXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAi
L2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZf
NjQtcmhlbC9nY2MtNC45L2EzYWNhMzNiM2FmMGY2OTYxNzE5YzY4YTViMWI1NjEyMDZlYWE0Yjgv
bW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9vc2lt
YWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzMi5jZ3oiCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogNjUuMDQgNjYuNTIgMzEuNDYgMS8xNjkgNTU3NQpzdGFydF90aW1lOiAnMTQz
NDQxOTQyMScKZW5kX3RpbWU6ICcxNDM0NDE5NzQyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0y
MDE1MDYxNi0wNzEyMjIiCnRpbWVfZGVsdGE6ICcxNDM0NDE5Mzg2LjMwNzYzMzQ2MCcK

--===============7555939915151135574==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBleHQ0IC1xIC1GIC9kZXYvc2RoCm1rZnMgLXQgZXh0NCAtcSAtRiAvZGV2L3NkaQpt
b3VudCAtdCBleHQ0IC9kZXYvc2RiIC9mcy9zZGIKbW91bnQgLXQgZXh0NCAvZGV2L3NkZyAvZnMv
c2RnCm1vdW50IC10IGV4dDQgL2Rldi9zZGkgL2ZzL3NkaQptb3VudCAtdCBleHQ0IC9kZXYvc2Ro
IC9mcy9zZGgKbW91bnQgLXQgZXh0NCAvZGV2L3NkbCAvZnMvc2RsCm1vdW50IC10IGV4dDQgL2Rl
di9zZGYgL2ZzL3NkZgptb3VudCAtdCBleHQ0IC9kZXYvc2RtIC9mcy9zZG0KbW91bnQgLXQgZXh0
NCAvZGV2L3NkayAvZnMvc2RrCm1vdW50IC10IGV4dDQgL2Rldi9zZGQgL2ZzL3NkZAptb3VudCAt
dCBleHQ0IC9kZXYvc2RlIC9mcy9zZGUKbW91bnQgLXQgZXh0NCAvZGV2L3NkYyAvZnMvc2RjCmVj
aG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL3dyaXRlYmFjay9iYWxhbmNl
X2RpcnR5X3BhZ2VzL2VuYWJsZQplY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2
ZW50cy93cml0ZWJhY2svYmRpX2RpcnR5X3JhdGVsaW1pdC9lbmFibGUKZWNobyAxID4gL3N5cy9r
ZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvd3JpdGViYWNrL2dsb2JhbF9kaXJ0eV9zdGF0ZS9l
bmFibGUKZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVudHMvd3JpdGViYWNr
L3dyaXRlYmFja19zaW5nbGVfaW5vZGUvZW5hYmxlCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
Yi96ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZy96ZXJv
LTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaS96ZXJvLTEgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJvLTEgc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbC96ZXJvLTEgc3RhdHVzPW5veGZlciAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZi96ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL3NkbS96ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL3Nkay96ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL3NkZC96ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L3NkZS96ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYy96
ZXJvLTEgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYi96ZXJvLTIg
c3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZy96ZXJvLTIgc3RhdHVz
PW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaS96ZXJvLTIgc3RhdHVzPW5veGZl
ciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbC96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3NkZi96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL3NkbS96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3Nkay96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
ZC96ZXJvLTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZS96ZXJv
LTIgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYy96ZXJvLTIgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYi96ZXJvLTMgc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZy96ZXJvLTMgc3RhdHVzPW5veGZlciAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaS96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL3NkbC96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL3NkZi96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L3NkbS96ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nkay96
ZXJvLTMgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZC96ZXJvLTMg
c3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZS96ZXJvLTMgc3RhdHVz
PW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYy96ZXJvLTMgc3RhdHVzPW5veGZl
ciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYi96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZy96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3NkaS96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL3NkaC96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3NkbC96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
Zi96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbS96ZXJv
LTQgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nkay96ZXJvLTQgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZC96ZXJvLTQgc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZS96ZXJvLTQgc3RhdHVzPW5veGZlciAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYy96ZXJvLTQgc3RhdHVzPW5veGZlciAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL3NkYi96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL3NkZy96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL3NkaS96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L3NkaC96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbC96
ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZi96ZXJvLTUg
c3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbS96ZXJvLTUgc3RhdHVz
PW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nkay96ZXJvLTUgc3RhdHVzPW5veGZl
ciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZC96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZS96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3NkYy96ZXJvLTUgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL3NkYi96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3NkZy96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
aS96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJv
LTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbC96ZXJvLTYgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZi96ZXJvLTYgc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbS96ZXJvLTYgc3RhdHVzPW5veGZlciAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nkay96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL3NkZC96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL3NkZS96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL3NkYy96ZXJvLTYgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L3NkYi96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZy96
ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaS96ZXJvLTcg
c3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJvLTcgc3RhdHVz
PW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbC96ZXJvLTcgc3RhdHVzPW5veGZl
ciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZi96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbS96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3Nkay96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL3NkZC96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3NkZS96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
Yy96ZXJvLTcgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYi96ZXJv
LTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZy96ZXJvLTggc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaS96ZXJvLTggc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJvLTggc3RhdHVzPW5veGZlciAm
CmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkbC96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBp
Zj0vZGV2L3plcm8gb2Y9L2ZzL3NkZi96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2
L3plcm8gb2Y9L2ZzL3NkbS96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8g
b2Y9L2ZzL3Nkay96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L3NkZC96ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZS96
ZXJvLTggc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYy96ZXJvLTgg
c3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYi96ZXJvLTkgc3RhdHVz
PW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZy96ZXJvLTkgc3RhdHVzPW5veGZl
ciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaS96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRk
ICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3NkbC96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3pl
cm8gb2Y9L2ZzL3NkZi96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9
L2ZzL3NkbS96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3Nk
ay96ZXJvLTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZC96ZXJv
LTkgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZS96ZXJvLTkgc3Rh
dHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYy96ZXJvLTkgc3RhdHVzPW5v
eGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkYi96ZXJvLTEwIHN0YXR1cz1ub3hmZXIg
JgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGcvemVyby0xMCBzdGF0dXM9bm94ZmVyICYKZGQg
IGlmPS9kZXYvemVybyBvZj0vZnMvc2RpL3plcm8tMTAgc3RhdHVzPW5veGZlciAmCmRkICBpZj0v
ZGV2L3plcm8gb2Y9L2ZzL3NkaC96ZXJvLTEwIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96
ZXJvIG9mPS9mcy9zZGwvemVyby0xMCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBv
Zj0vZnMvc2RmL3plcm8tMTAgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2Zz
L3NkbS96ZXJvLTEwIHN0YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGsv
emVyby0xMCBzdGF0dXM9bm94ZmVyICYKZGQgIGlmPS9kZXYvemVybyBvZj0vZnMvc2RkL3plcm8t
MTAgc3RhdHVzPW5veGZlciAmCmRkICBpZj0vZGV2L3plcm8gb2Y9L2ZzL3NkZS96ZXJvLTEwIHN0
YXR1cz1ub3hmZXIgJgpkZCAgaWY9L2Rldi96ZXJvIG9mPS9mcy9zZGMvemVyby0xMCBzdGF0dXM9
bm94ZmVyICYKc2xlZXAgMjg5CmtpbGxhbGwgLTkgZGQK

--===============7555939915151135574==--

