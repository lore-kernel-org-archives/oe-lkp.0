Content-Type: multipart/mixed; boundary="===============7349169837999649181=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm, page_alloc] 625fab12b4: 160.2% fileio.time.involuntary_context_switches
Date: Mon, 01 Feb 2016 09:56:03 +0800
Message-ID: <87si1dgpn0.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7349169837999649181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux-balancenuma mm-vm=
scan-node-lru-v2r26
commit 625fab12b407ee064c3f9d10b304e5aba87ad1ce ("mm, page_alloc: Remove fa=
ir zone allocation policy")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filenum/fs/iomode/kconfig/nr_threads/period/=
rootfs/rwmode/size/tbox_group/testcase:
  gcc-4.9/performance/1HDD/1024f/xfs/sync/x86_64-rhel/100%/600s/debian-x86_=
64-2015-02-07.cgz/seqwr/64G/lkp-sb02/fileio

commit: =

  94388badc0ebce2bdcc516dc413844921bd768fa
  625fab12b407ee064c3f9d10b304e5aba87ad1ce

94388badc0ebce2b 625fab12b407ee064c3f9d10b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     14265 =C2=B1  0%    +160.2%      37121 =C2=B1  2%  fileio.time.involun=
tary_context_switches
     36.75 =C2=B1  1%     +51.0%      55.50 =C2=B1  0%  fileio.time.percent=
_of_cpu_this_job_got
    224.17 =C2=B1  1%     +50.0%     336.17 =C2=B1  1%  fileio.time.system_=
time
   1263295 =C2=B1  1%     -26.4%     930092 =C2=B1  0%  fileio.time.volunta=
ry_context_switches
    820.99 =C2=B1  0%     -16.1%     688.70 =C2=B1  0%  uptime.idle
     32784 =C2=B1  3%      +9.2%      35813 =C2=B1  3%  softirqs.RCU
    543300 =C2=B1  0%     +21.8%     661679 =C2=B1  0%  softirqs.TIMER
 2.581e+08 =C2=B1  2%     -55.1%  1.158e+08 =C2=B1  1%  cpuidle.C1-SNB.time
    991217 =C2=B1  2%     -22.9%     763992 =C2=B1  1%  cpuidle.C1-SNB.usage
  34907285 =C2=B1 10%     -15.4%   29536292 =C2=B1  4%  cpuidle.C1E-SNB.time
  91859362 =C2=B1  5%     -19.0%   74382776 =C2=B1  5%  cpuidle.POLL.time
    231879 =C2=B1  6%     -31.1%     159807 =C2=B1  5%  cpuidle.POLL.usage
     14265 =C2=B1  0%    +160.2%      37121 =C2=B1  2%  time.involuntary_co=
ntext_switches
     36.75 =C2=B1  1%     +51.0%      55.50 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    224.17 =C2=B1  1%     +50.0%     336.17 =C2=B1  1%  time.system_time
      0.84 =C2=B1  5%     +27.1%       1.07 =C2=B1  1%  time.user_time
   1263295 =C2=B1  1%     -26.4%     930092 =C2=B1  0%  time.voluntary_cont=
ext_switches
     42.95 =C2=B1  0%     +22.2%      52.48 =C2=B1  0%  turbostat.%Busy
      1278 =C2=B1  0%     +21.6%       1555 =C2=B1  0%  turbostat.Avg_MHz
     12.53 =C2=B1  2%     -48.0%       6.51 =C2=B1  1%  turbostat.CPU%c1
     22.19 =C2=B1  0%     +12.8%      25.04 =C2=B1  0%  turbostat.CorWatt
     25.85 =C2=B1  0%     +11.0%      28.70 =C2=B1  0%  turbostat.PkgWatt
     52830 =C2=B1  0%      +1.8%      53782 =C2=B1  0%  vmstat.io.bo
    713.50 =C2=B1  7%     -33.6%     473.75 =C2=B1  2%  vmstat.memory.buff
      1.00 =C2=B1  0%    +100.0%       2.00 =C2=B1  0%  vmstat.procs.r
      5310 =C2=B1  1%     -10.2%       4766 =C2=B1  0%  vmstat.system.cs
      2231 =C2=B1  1%     +20.0%       2678 =C2=B1  0%  vmstat.system.in
      2247 =C2=B1  6%     -12.3%       1971 =C2=B1  3%  slabinfo.anon_vma.a=
ctive_objs
      2247 =C2=B1  6%     -12.3%       1971 =C2=B1  3%  slabinfo.anon_vma.n=
um_objs
    954.00 =C2=B1 10%     +24.4%       1186 =C2=B1  3%  slabinfo.cred_jar.a=
ctive_objs
     20832 =C2=B1  3%    +345.2%      92754 =C2=B1  2%  slabinfo.kmalloc-64=
.active_objs
    325.25 =C2=B1  3%    +345.4%       1448 =C2=B1  2%  slabinfo.kmalloc-64=
.active_slabs
     20832 =C2=B1  3%    +345.2%      92755 =C2=B1  2%  slabinfo.kmalloc-64=
.num_objs
    325.25 =C2=B1  3%    +345.4%       1448 =C2=B1  2%  slabinfo.kmalloc-64=
.num_slabs
      2541 =C2=B1  1%     +18.8%       3018 =C2=B1  1%  slabinfo.radix_tree=
_node.active_slabs
      2541 =C2=B1  1%     +18.8%       3018 =C2=B1  1%  slabinfo.radix_tree=
_node.num_slabs
    146398 =C2=B1  0%     -82.4%      25752 =C2=B1  1%  meminfo.Active
      1660 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  meminfo.Active(anon)
    144736 =C2=B1  0%     -82.2%      25752 =C2=B1  1%  meminfo.Active(file)
    478122 =C2=B1  0%     -52.4%     227480 =C2=B1  0%  meminfo.Dirty
    171938 =C2=B1  6%     +94.9%     335031 =C2=B1  2%  meminfo.Inactive
    171938 =C2=B1  6%     +11.8%     192237 =C2=B1  5%  meminfo.Inactive(an=
on)
    411066 =C2=B1  2%     +10.3%     453230 =C2=B1  1%  meminfo.MemAvailable
    171939 =C2=B1  6%     +11.8%     192238 =C2=B1  5%  meminfo.MemFree
     21148 =C2=B1  0%     +21.8%      25752 =C2=B1  1%  meminfo.SUnreclaim
     21148 =C2=B1  0%     -87.0%       2743 =C2=B1  0%  meminfo.Unevictable
     88635 =C2=B1  0%     -13.8%      76382 =C2=B1  2%  meminfo.Writeback
      0.00 =C2=B1 -1%      +Inf%      14490 =C2=B1 57%  latency_stats.avg.w=
ait_iff_congested.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.copy_page_range.copy_process._do_fork.Sy=
S_clone.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      11880 =C2=B1 71%  latency_stats.avg.w=
ait_iff_congested.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_=
fault.page_fault
     16059 =C2=B1118%     -95.7%     693.00 =C2=B1126%  latency_stats.avg.x=
fs_buf_submit_wait._xfs_buf_read.xfs_buf_read_map.xfs_trans_read_buf_map.xf=
s_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_lookup.xfs_allo=
c_lookup_eq.xfs_free_ag_extent.xfs_free_extent.xfs_trans_free_extent.xfs_bm=
ap_finish
     14149 =C2=B1  3%     -74.7%       3573 =C2=B1  6%  latency_stats.hits.=
balance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write.x=
fs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write.SyS_pw=
rite64.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      14490 =C2=B1 57%  latency_stats.max.w=
ait_iff_congested.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.copy_page_range.copy_process._do_fork.Sy=
S_clone.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      12994 =C2=B1 70%  latency_stats.max.w=
ait_iff_congested.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_=
fault.page_fault
     16059 =C2=B1118%     -95.7%     693.00 =C2=B1126%  latency_stats.max.x=
fs_buf_submit_wait._xfs_buf_read.xfs_buf_read_map.xfs_trans_read_buf_map.xf=
s_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_lookup.xfs_allo=
c_lookup_eq.xfs_free_ag_extent.xfs_free_extent.xfs_trans_free_extent.xfs_bm=
ap_finish
 1.591e+08 =C2=B1  3%     -69.6%   48384300 =C2=B1  0%  latency_stats.sum.b=
alance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write.xf=
s_file_buffered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write.SyS_pwr=
ite64.entry_SYSCALL_64_fastpath
     42101 =C2=B1173%    +544.4%     271288 =C2=B1102%  latency_stats.sum.c=
all_rwsem_down_write_failed.xfs_ilock.xfs_vn_update_time.file_update_time.x=
fs_file_aio_write_checks.xfs_file_buffered_aio_write.xfs_file_write_iter.__=
vfs_write.vfs_write.SyS_pwrite64.entry_SYSCALL_64_fastpath
     29214 =C2=B1 74%     -33.4%      19470 =C2=B1  0%  latency_stats.sum.w=
ait_iff_congested.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.alloc_kmem_pages.kmalloc_order.kmalloc_order_trace.devkmsg_open.me=
mory_open.chrdev_open.do_dentry_open.vfs_open
      0.00 =C2=B1 -1%      +Inf%      14490 =C2=B1 57%  latency_stats.sum.w=
ait_iff_congested.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.copy_page_range.copy_process._do_fork.Sy=
S_clone.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      17260 =C2=B1 76%  latency_stats.sum.w=
ait_iff_congested.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_=
fault.page_fault
     16059 =C2=B1118%     -95.7%     693.00 =C2=B1126%  latency_stats.sum.x=
fs_buf_submit_wait._xfs_buf_read.xfs_buf_read_map.xfs_trans_read_buf_map.xf=
s_btree_read_buf_block.xfs_btree_lookup_get_block.xfs_btree_lookup.xfs_allo=
c_lookup_eq.xfs_free_ag_extent.xfs_free_extent.xfs_trans_free_extent.xfs_bm=
ap_finish
    561.50 =C2=B1  4%     +84.9%       1038 =C2=B1  4%  proc-vmstat.compact=
_fail
  19342446 =C2=B1  3%     +10.1%   21300297 =C2=B1  2%  proc-vmstat.compact=
_free_scanned
     38803 =C2=B1 11%    +184.1%     110237 =C2=B1  7%  proc-vmstat.compact=
_isolated
    167816 =C2=B1  7%    +185.5%     479105 =C2=B1  3%  proc-vmstat.compact=
_migrate_scanned
    794.75 =C2=B1  4%     +80.1%       1431 =C2=B1  4%  proc-vmstat.compact=
_stall
    108382 =C2=B1153%    +329.3%     465280 =C2=B1 58%  proc-vmstat.kswapd_=
inodesteal
      6375 =C2=B1  3%     +27.8%       8149 =C2=B1  2%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
     67488 =C2=B1  2%     -36.6%      42793 =C2=B1  2%  proc-vmstat.nr_acti=
ve_file
    415.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.nr_allo=
c_batch
    119527 =C2=B1  0%     -52.5%      56832 =C2=B1  1%  proc-vmstat.nr_dirty
      5287 =C2=B1  0%     +21.6%       6427 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
     18134 =C2=B1  0%    +366.6%      84625 =C2=B1  0%  proc-vmstat.nr_unev=
ictable
 1.017e+09 =C2=B1  1%     +71.9%  1.748e+09 =C2=B1  1%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     22166 =C2=B1  0%     -13.0%      19279 =C2=B1  4%  proc-vmstat.nr_writ=
eback
     64023 =C2=B1  2%     -57.2%      27420 =C2=B1  2%  proc-vmstat.pgactiv=
ate
    690575 =C2=B1  0%     +15.4%     797060 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
      1327 =C2=B1120%    +975.7%      14277 =C2=B1 64%  proc-vmstat.pgmigra=
te_fail
     12017 =C2=B1  8%    +193.3%      35240 =C2=B1  4%  proc-vmstat.pgmigra=
te_success
   6469794 =C2=B1  1%     +11.8%    7233894 =C2=B1  0%  proc-vmstat.pgrotat=
ed
 1.117e+09 =C2=B1  1%     +95.6%  2.186e+09 =C2=B1  1%  proc-vmstat.pgscan_=
direct
     20246 =C2=B1  0%    +373.6%      95891 =C2=B1  1%  proc-vmstat.unevict=
able_pgs_culled
      5347 =C2=B1  5%     +75.3%       9371 =C2=B1  2%  proc-vmstat.working=
set_nodereclaim
     58075 =C2=B1  5%     +70.5%      99000 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.0
    114182 =C2=B1 15%     +26.0%     143907 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.2
    121749 =C2=B1 12%     +13.3%     138001 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.3
    103780 =C2=B1  0%     +23.8%     128512 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.avg
     57783 =C2=B1  5%     +70.4%      98484 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.min
     30369 =C2=B1  5%     -38.7%      18605 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.stddev
    232.25 =C2=B1 34%     +92.0%     446.00 =C2=B1 26%  sched_debug.cfs_rq:=
/.load_avg.0
    328.00 =C2=B1 31%     +54.0%     505.00 =C2=B1 20%  sched_debug.cfs_rq:=
/.load_avg.3
    306.17 =C2=B1  4%     +49.1%     456.51 =C2=B1  9%  sched_debug.cfs_rq:=
/.load_avg.avg
    809.84 =C2=B1  6%     +37.0%       1109 =C2=B1 14%  sched_debug.cfs_rq:=
/.load_avg.max
     67.39 =C2=B1 31%    +118.3%     147.12 =C2=B1 12%  sched_debug.cfs_rq:=
/.load_avg.min
    310.31 =C2=B1  8%     +27.1%     394.34 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.stddev
    111578 =C2=B1  5%     +98.4%     221416 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.0
    167309 =C2=B1  6%     +42.7%     238775 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.1
    158623 =C2=B1  7%     +58.3%     251082 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.2
    168117 =C2=B1  9%     +44.3%     242659 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.3
    151407 =C2=B1  1%     +57.5%     238483 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    180632 =C2=B1  3%     +40.3%     253385 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.max
    111387 =C2=B1  5%     +97.9%     220417 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.min
     26737 =C2=B1  3%     -53.0%      12574 =C2=B1 19%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.82 =C2=B1  7%     +27.4%       1.05 =C2=B1 12%  sched_debug.cfs_rq:=
/.nr_running.avg
      0.34 =C2=B1 22%    +105.3%       0.70 =C2=B1 17%  sched_debug.cfs_rq:=
/.nr_running.min
    262.97 =C2=B1 12%     +31.6%     346.05 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     38.16 =C2=B1 49%    +159.3%      98.95 =C2=B1 16%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
     55730 =C2=B1 18%     -68.9%      17357 =C2=B1 23%  sched_debug.cfs_rq:=
/.spread0.1
     56538 =C2=B1 21%     -62.4%      21237 =C2=B1 55%  sched_debug.cfs_rq:=
/.spread0.3
     39828 =C2=B1  8%     -57.2%      17064 =C2=B1 31%  sched_debug.cfs_rq:=
/.spread0.avg
     69053 =C2=B1  6%     -53.7%      31964 =C2=B1 23%  sched_debug.cfs_rq:=
/.spread0.max
     26737 =C2=B1  3%     -53.0%      12573 =C2=B1 19%  sched_debug.cfs_rq:=
/.spread0.stddev
    353.25 =C2=B1 20%     +80.7%     638.25 =C2=B1 27%  sched_debug.cfs_rq:=
/.util_avg.0
    391.25 =C2=B1 11%     +75.6%     687.00 =C2=B1 18%  sched_debug.cfs_rq:=
/.util_avg.2
    448.25 =C2=B1 19%     +85.4%     831.00 =C2=B1 11%  sched_debug.cfs_rq:=
/.util_avg.3
    432.79 =C2=B1  8%     +63.3%     706.91 =C2=B1 10%  sched_debug.cfs_rq:=
/.util_avg.avg
    846.57 =C2=B1  5%     +31.8%       1116 =C2=B1  7%  sched_debug.cfs_rq:=
/.util_avg.max
    216.25 =C2=B1 39%    +117.6%     470.50 =C2=B1 14%  sched_debug.cfs_rq:=
/.util_avg.min
    695961 =C2=B1 12%     -23.1%     534898 =C2=B1 14%  sched_debug.cpu.avg=
_idle.2
    354429 =C2=B1 20%     -64.5%     125849 =C2=B1 16%  sched_debug.cpu.avg=
_idle.min
    212161 =C2=B1 11%     +42.3%     301992 =C2=B1  2%  sched_debug.cpu.avg=
_idle.stddev
    232.00 =C2=B1 23%     +74.9%     405.75 =C2=B1  9%  sched_debug.cpu.cpu=
_load[0].2
    265.62 =C2=B1  9%     +28.4%     341.04 =C2=B1  8%  sched_debug.cpu.cpu=
_load[0].avg
    226.75 =C2=B1 23%     +70.0%     385.50 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].2
    260.41 =C2=B1  8%     +31.7%     342.93 =C2=B1  9%  sched_debug.cpu.cpu=
_load[1].avg
     40.23 =C2=B1 65%    +190.8%     116.98 =C2=B1 28%  sched_debug.cpu.cpu=
_load[1].min
    229.50 =C2=B1 19%     +72.0%     394.75 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].2
    258.82 =C2=B1  7%     +35.4%     350.45 =C2=B1  9%  sched_debug.cpu.cpu=
_load[2].avg
     42.34 =C2=B1 63%    +222.5%     136.55 =C2=B1 21%  sched_debug.cpu.cpu=
_load[2].min
    240.50 =C2=B1 14%     +70.8%     410.75 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].2
    260.75 =C2=B1 25%     +37.2%     357.75 =C2=B1 11%  sched_debug.cpu.cpu=
_load[3].3
    257.67 =C2=B1  8%     +39.3%     358.95 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].avg
     41.75 =C2=B1 69%    +235.6%     140.12 =C2=B1 20%  sched_debug.cpu.cpu=
_load[3].min
    254.75 =C2=B1 12%     +66.0%     423.00 =C2=B1 10%  sched_debug.cpu.cpu=
_load[4].2
    246.75 =C2=B1 22%     +46.4%     361.25 =C2=B1 16%  sched_debug.cpu.cpu=
_load[4].3
    257.68 =C2=B1  8%     +41.8%     365.33 =C2=B1  8%  sched_debug.cpu.cpu=
_load[4].avg
     43.82 =C2=B1 60%    +219.9%     140.18 =C2=B1 19%  sched_debug.cpu.cpu=
_load[4].min
      4021 =C2=B1  0%     -16.0%       3378 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.max
     20.05 =C2=B1 67%    +461.3%     112.53 =C2=B1 53%  sched_debug.cpu.cur=
r->pid.min
      1691 =C2=B1  2%     -20.3%       1348 =C2=B1  1%  sched_debug.cpu.cur=
r->pid.stddev
    144.05 =C2=B1 34%     +63.2%     235.02 =C2=B1 28%  sched_debug.cpu.loa=
d.min
      0.00 =C2=B1  7%     -35.1%       0.00 =C2=B1 12%  sched_debug.cpu.nex=
t_balance.stddev
     87656 =C2=B1  3%     +44.4%     126554 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.0
    128292 =C2=B1  0%     +16.7%     149747 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.avg
     87534 =C2=B1  3%     +44.1%     126162 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.min
     26961 =C2=B1  8%     -44.2%      15041 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.stddev
      1.06 =C2=B1 11%     +54.1%       1.64 =C2=B1 17%  sched_debug.cpu.nr_=
running.avg
      1.91 =C2=B1 11%     +53.2%       2.92 =C2=B1 22%  sched_debug.cpu.nr_=
running.max
      0.34 =C2=B1 22%    +112.7%       0.72 =C2=B1 15%  sched_debug.cpu.nr_=
running.min
      0.67 =C2=B1  7%     +38.3%       0.92 =C2=B1 26%  sched_debug.cpu.nr_=
running.stddev
    437095 =C2=B1  6%     -24.0%     332148 =C2=B1  3%  sched_debug.cpu.nr_=
switches.1
    434420 =C2=B1 11%     -33.1%     290428 =C2=B1  4%  sched_debug.cpu.nr_=
switches.2
    415871 =C2=B1 10%     -23.5%     318027 =C2=B1  3%  sched_debug.cpu.nr_=
switches.3
    460555 =C2=B1  0%     -21.7%     360716 =C2=B1  1%  sched_debug.cpu.nr_=
switches.avg
    379951 =C2=B1  3%     -24.2%     287882 =C2=B1  4%  sched_debug.cpu.nr_=
switches.min
     69023 =C2=B1  6%     +25.2%      86397 =C2=B1 11%  sched_debug.cpu.nr_=
switches.stddev
     -9.50 =C2=B1-83%    -778.9%      64.50 =C2=B1 49%  sched_debug.cpu.nr_=
uninterruptible.0
     23.23 =C2=B1 25%    +219.9%      74.30 =C2=B1 25%  sched_debug.cpu.nr_=
uninterruptible.max
    -22.02 =C2=B1-32%    +204.8%     -67.12 =C2=B1-10%  sched_debug.cpu.nr_=
uninterruptible.min
     17.50 =C2=B1 28%    +215.3%      55.18 =C2=B1 11%  sched_debug.cpu.nr_=
uninterruptible.stddev
    581166 =C2=B1 14%     -23.6%     444135 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.1
    501484 =C2=B1  8%     -22.6%     388161 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.3
    598204 =C2=B1  2%     -13.2%     519290 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.avg
    441282 =C2=B1  3%     -19.5%     355031 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.min
    147934 =C2=B1  4%     +19.1%     176138 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.stddev
    267440 =C2=B1  1%     -17.4%     220961 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.0
    209831 =C2=B1  7%     -30.6%     145673 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.1
    210490 =C2=B1 11%     -41.7%     122757 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.2
    200281 =C2=B1 10%     -29.2%     141844 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.3
    222011 =C2=B1  0%     -28.9%     157809 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.avg
    269793 =C2=B1  0%     -17.7%     222161 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.max
    183167 =C2=B1  3%     -33.3%     122237 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.min
    276225 =C2=B1  0%     -30.6%     191807 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.0
    210972 =C2=B1  8%     -16.3%     176617 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.1
    220636 =C2=B1 10%     -15.3%     186902 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.2
    212763 =C2=B1  4%     -21.5%     167014 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.3
    230149 =C2=B1  0%     -21.5%     180585 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.avg
    276922 =C2=B1  0%     -29.1%     196398 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.max
    194281 =C2=B1  3%     -14.9%     165374 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.min
     31652 =C2=B1  6%     -59.6%      12798 =C2=B1 20%  sched_debug.cpu.ttw=
u_count.stddev
     31469 =C2=B1  5%     +35.9%      42760 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.0
     25336 =C2=B1  3%     +22.4%      31021 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.avg
     31881 =C2=B1  5%     +35.3%      43121 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.max
     20206 =C2=B1  5%     +13.8%      22998 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.min
      4634 =C2=B1 17%     +70.9%       7918 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.stddev
      0.02 =C2=B1 21%     +58.1%       0.02 =C2=B1 22%  sched_debug.rt_rq:/=
.rt_time.avg


lkp-sb02: Sandy Bridge-EP
Memory: 4G

                      fileio.time.involuntary_context_switches

  120000 ++----------------------------------------------------------------=
-+
         |   OO   O O                                                      =
 |
  100000 O+O    O                                                          =
 |
         |                                                                 =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   40000 ++                                                                =
 |
         |           O O O OO O O OO O O O                                 =
 |
         |                                                                 =
 |
   20000 ++                                                 *.*.*  *.*.**.*=
.*
         |                                                 +     :+        =
 |
       0 *+*-**-*-*-**-*-*-**-*-*-**-*-*-*-**-*-*-**-*-*-**------*---------=
-+


                         proc-vmstat.nr_slab_unreclaimable

  7000 ++------------------------------------------------------------------=
-+
       O            O OO O O O OO O O O O                                  =
 |
  6000 ++O OO O O O                                                        =
 |
       |                                        .*.           .*. .*.*.**.*=
.|
  5000 ++*.**.*.*.*.*.**.*.*.*.**.*.*.*.*.**.*.*   **.*.*.*.**   *         =
 *
       | :                                                                 =
 |
  4000 ++:                                                                 =
 |
       |:                                                                  =
 |
  3000 ++                                                                  =
 |
       |:                                                                  =
 |
  2000 ++                                                                  =
 |
       |:                                                                  =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
     0 *+------------------------------------------------------------------=
-+


                                 meminfo.SUnreclaim

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 O+O      O O OO O O OO O O O OO O                                  =
 |
        |   OO O                                                           =
 |
        | *.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.*.**.*.   *.*.*.*.**.*=
.*
  20000 ++:                                                 *.*            =
 |
        | :                                                                =
 |
  15000 ++                                                                 =
 |
        |:                                                                 =
 |
  10000 ++                                                                 =
 |
        |:                                                                 =
 |
        |:                                                                 =
 |
   5000 ++                                                                 =
 |
        |                                                                  =
 |
      0 *+-----------------------------------------------------------------=
-+


                            proc-vmstat.nr_alloc_batch

  450 ++-------------------------------------------------------------------=
-+
      |                                                    *.*.*.*.*.**.*.*=
.*
  400 ++                                                   :               =
 |
  350 ++                                                   :               =
 |
      |                                                   :                =
 |
  300 ++                                                  :                =
 |
  250 ++*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.*                =
 |
      | :                                                                  =
 |
  200 ++:                                                                  =
 |
  150 ++                                                                   =
 |
      |:                                                                   =
 |
  100 ++                                                                   =
 |
   50 ++                                                                   =
 |
      |                                                                    =
 |
    0 *+-------------------------------------------------------------------=
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

--===============7349169837999649181==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZmlsZWlvCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNjI1ZmFiMTJiNDA3
ZWUwNjRjM2Y5ZDEwYjMwNGU1YWJhODdhZDFjZQptb2RlbDogU2FuZHkgQnJpZGdlLUVQCm1lbW9y
eTogNEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUhEVDcyMjUxNkRMQTM4
MF9WRFNEMURUQ0VLWUFFSi1wYXJ0MiIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlv
bjogIi9kZXYvZGlzay9ieS1pZC9hdGEtSERUNzIyNTE2RExBMzgwX1ZEU0QxRFRDRUtZQUVKLXBh
cnQxIgpjYXRlZ29yeTogYmVuY2htYXJrCnBlcmlvZDogNjAwcwpucl90aHJlYWRzOiAxMDAlCmRp
c2s6IDFIREQKZnM6IHhmcwpzaXplOiA2NEcKZmlsZWlvOgogIGZpbGVudW06IDEwMjRmCiAgcndt
b2RlOiBzZXF3cgogIGlvbW9kZTogc3luYwpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1zYjAy
CnRib3hfZ3JvdXA6IGxrcC1zYjAyCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTog
MjAxNi0wMS0yOSAxODoyNjoyOC45NTc0MjU1NTggKzA4OjAwCmlkOiBhMGJhODkxOTRkYzNlMWM1
YWNlMzU3NTE4Y2Q0MjAwYjVmOGRlNDEzCnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFk
X2NvbW1pdDogZmVhYTY1NTkyY2FiNjNjYWFmNzY2ZmU1Nzk0MGY0YTFiZmEyZmM0MwpiYXNlX2Nv
bW1pdDogOTJlOTYzZjUwZmM3NDA0MWI1ZTllNzQ0YzMzMGRjYTQ4ZTA0ZjA4ZApicmFuY2g6IGxp
bnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDEyODE4CnJvb3RmczogZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZmlsZWlvL3BlcmZvcm1hbmNlLTYw
MHMtMTAwJS0xSERELXhmcy02NEctMTAyNGYtc2Vxd3Itc3luYy9sa3Atc2IwMi9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNjI1ZmFiMTJiNDA3ZWUwNjRj
M2Y5ZDEwYjMwNGU1YWJhODdhZDFjZS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1z
YjAyL2Jpc2VjdF9maWxlaW8tcGVyZm9ybWFuY2UtNjAwcy0xMDAlLTFIREQteGZzLTY0Ry0xMDI0
Zi1zZXF3ci1zeW5jLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNjI1
ZmFiMTJiNDA3ZWUwNjRjM2Y5ZDEwYjMwNGU1YWJhODdhZDFjZS0yMDE2MDEyOS0xNDQ4Mi1nN2h6
dnQtMC55YW1sIgpucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMTg0NS41CmluaXRyZDog
Ii9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVy
X2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVk
L2xrcC1zYjAyL2Jpc2VjdF9maWxlaW8tcGVyZm9ybWFuY2UtNjAwcy0xMDAlLTFIREQteGZzLTY0
Ry0xMDI0Zi1zZXF3ci1zeW5jLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJo
ZWwtNjI1ZmFiMTJiNDA3ZWUwNjRjM2Y5ZDEwYjMwNGU1YWJhODdhZDFjZS0yMDE2MDEyOS0xNDQ4
Mi1nN2h6dnQtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJh
bmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDEyODE4Ci0gY29tbWl0PTYyNWZhYjEy
YjQwN2VlMDY0YzNmOWQxMGIzMDRlNWFiYTg3YWQxY2UKLSBCT09UX0lNQUdFPS9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS82MjVmYWIxMmI0MDdlZTA2NGMzZjlkMTBiMzA0ZTVhYmE4N2Fk
MWNlL3ZtbGludXotNC41LjAtcmMxLTAwMDI0LWc2MjVmYWIxCi0gbWF4X3VwdGltZT0xODQ1Ci0g
UkVTVUxUX1JPT1Q9L3Jlc3VsdC9maWxlaW8vcGVyZm9ybWFuY2UtNjAwcy0xMDAlLTFIREQteGZz
LTY0Ry0xMDI0Zi1zZXF3ci1zeW5jL2xrcC1zYjAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82MjVmYWIxMmI0MDdlZTA2NGMzZjlkMTBiMzA0ZTVhYmE4
N2FkMWNlLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1
MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlz
X2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNv
ZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRp
c2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkw
IHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igpt
b2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82MjVmYWIxMmI0
MDdlZTA2NGMzZjlkMTBiMzA0ZTVhYmE4N2FkMWNlL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtw
L2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei9maWxlaW8uY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0
LXJoZWwvZ2NjLTQuOS82MjVmYWIxMmI0MDdlZTA2NGMzZjlkMTBiMzA0ZTVhYmE4N2FkMWNlL2xp
bnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45LzYyNWZhYjEyYjQwN2VlMDY0YzNmOWQxMGIzMDRlNWFiYTg3YWQxY2Uvdm1s
aW51ei00LjUuMC1yYzEtMDAwMjQtZzYyNWZhYjEiCmRlcXVldWVfdGltZTogMjAxNi0wMS0yOSAx
ODo1Nzo0OC40MTQzOTkwNDYgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNi43
NSA2LjE2IDMuNDAgMS8xMzIgNjM5OQpzdGFydF90aW1lOiAnMTQ1NDA2NTEwMScKZW5kX3RpbWU6
ICcxNDU0MDY1NzA1Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDEyNy0yMjM4NTMiCg==

--===============7349169837999649181==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0yOSAxODo1ODoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxODo1ODoxOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxODo1ODoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
MS0yOSAxODo1ODoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOSAxODo1ODoxOSBta2ZzIC10
IHhmcyAvZGV2L3NkYTIKMjAxNi0wMS0yOSAxODo1ODoyMCBtb3VudCAtdCB4ZnMgLW8gbm9iYXJy
aWVyLGlub2RlNjQgL2Rldi9zZGEyIC9mcy9zZGEyCjIwMTYtMDEtMjkgMTg6NTg6MjEgY2QgL2Zz
L3NkYTIKMjAxNi0wMS0yOSAxODo1ODoyMSBzeXNiZW5jaCAtLXRlc3Q9ZmlsZWlvIC0tbWF4LXJl
cXVlc3RzPTAgLS1udW0tdGhyZWFkcz00IC0tbWF4LXRpbWU9NjAwIC0tZmlsZS10ZXN0LW1vZGU9
c2Vxd3IgLS1maWxlLXRvdGFsLXNpemU9Njg3MTk0NzY3MzYgLS1maWxlLWlvLW1vZGU9c3luYyAt
LWZpbGUtbnVtPTEwMjQgcnVuCg==

--===============7349169837999649181==--

