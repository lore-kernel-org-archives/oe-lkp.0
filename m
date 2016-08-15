Content-Type: multipart/mixed; boundary="===============7307919308318558772=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 22:14:55 +0800
Message-ID: <20160815141455.GA22903@wfg-t540p.sh.intel.com>
In-Reply-To: <20160814161724.GA20274@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7307919308318558772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Sun, Aug 14, 2016 at 06:17:24PM +0200, Christoph Hellwig wrote:
>Snipping the long contest:
>
>I think there are three observations here:
>
> (1) removing the mark_page_accessed (which is the only significant
>     change in the parent commit)  hurts the
>     aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44 test.
>     I'd still rather stick to the filemap version and let the
>     VM people sort it out.  How do the numbers for this test
>     look for XFS vs say ext4 and btrfs?
> (2) lots of additional spinlock contention in the new case.  A quick
>     check shows that I fat-fingered my rewrite so that we do
>     the xfs_inode_set_eofblocks_tag call now for the pure lookup
>     case, and pretty much all new cycles come from that.
> (3) Boy, are those xfs_inode_set_eofblocks_tag calls expensive, and
>     we're already doing way to many even without my little bug above.
>
>So I've force pushed a new version of the iomap-fixes branch with
>(2) fixed, and also a little patch to xfs_inode_set_eofblocks_tag a
>lot less expensive slotted in before that.  Would be good to see
>the numbers with that.

The aim7 1BRD tests finished and there are ups and downs, with overall
performance remain flat.

99091700659f4df9  74a242ad94d13436a1644c0b45  bf4dc6e4ecc2a3d042029319bc  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    159926                      157324                      158574        G=
EO-MEAN aim7.jobs-per-min
     70897               5%      74137               4%      73775        a=
im7/1BRD_48G-xfs-creat-clo-1500-performance/ivb44
    485217 =C2=B1  3%                492431                      477533    =
    aim7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44
    360451             -19%     292980             -17%     299377        a=
im7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
    338114                      338410               5%     354078        a=
im7/1BRD_48G-xfs-disk_rw-3000-performance/ivb44
     60130 =C2=B1  5%         4%      62438               5%      62923    =
    aim7/1BRD_48G-xfs-disk_src-3000-performance/ivb44
    403144                      397790                      410648        a=
im7/1BRD_48G-xfs-disk_wrt-3000-performance/ivb44
     26327                       26534                       26128        a=
im7/1BRD_48G-xfs-sync_disk_rw-600-performance/ivb44

The new commit bf4dc6e ("xfs: rewrite and optimize the delalloc write
path") improves the aim7/1BRD_48G-xfs-disk_rw-3000-performance/ivb44
case by 5%. Here are the detailed numbers:

aim7/1BRD_48G-xfs-disk_rw-3000-performance/ivb44

74a242ad94d13436  bf4dc6e4ecc2a3d042029319bc
----------------  --------------------------
         %stddev     %change         %stddev
             \          |                \
    338410               5%     354078        aim7.jobs-per-min
    404390               8%     435117        aim7.time.voluntary_context_s=
witches
      2502              -4%       2396        aim7.time.maximum_resident_se=
t_size
     15018              -9%      13701        aim7.time.involuntary_context=
_switches
       900             -11%        801        aim7.time.system_time
     17432              11%      19365        vmstat.system.cs
     47736 =C2=B1 19%       -24%      36087        interrupts.CAL:Function_=
call_interrupts
   2129646              31%    2790638        proc-vmstat.pgalloc_dma32
    379503              13%     429384        numa-meminfo.node0.Dirty
     15018              -9%      13701        time.involuntary_context_swit=
ches
       900             -11%        801        time.system_time
      1560              10%       1716        slabinfo.mnt_cache.active_objs
      1560              10%       1716        slabinfo.mnt_cache.num_objs
     61.53               -4      57.45 =C2=B1  4%  perf-profile.cycles-pp.i=
ntel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
     61.63               -4      57.55 =C2=B1  4%  perf-profile.func.cycles=
-pp.intel_idle
   1007188 =C2=B1 16%       156%    2577911 =C2=B1  6%  numa-numastat.node0=
.numa_miss
   9662857 =C2=B1  4%       -13%    8420159 =C2=B1  3%  numa-numastat.node0=
.numa_foreign
   1008220 =C2=B1 16%       155%    2570630 =C2=B1  6%  numa-numastat.node1=
.numa_foreign
   9664033 =C2=B1  4%       -13%    8413184 =C2=B1  3%  numa-numastat.node1=
.numa_miss
  26519887 =C2=B1  3%        18%   31322674        cpuidle.C1-IVT.time
    122238              16%     142383        cpuidle.C1-IVT.usage
     46548              11%      51645        cpuidle.C1E-IVT.usage
  17253419              13%   19567582        cpuidle.C3-IVT.time
     86847              13%      98333        cpuidle.C3-IVT.usage
    482033 =C2=B1 12%       108%    1000665 =C2=B1  8%  numa-vmstat.node0.n=
uma_miss
     94689              14%     107744        numa-vmstat.node0.nr_zone_wri=
te_pending
     94677              14%     107718        numa-vmstat.node0.nr_dirty
   3156643 =C2=B1  3%       -20%    2527460 =C2=B1  3%  numa-vmstat.node0.n=
uma_foreign
    429288 =C2=B1 12%       129%     983053 =C2=B1  8%  numa-vmstat.node1.n=
uma_foreign
   3104193 =C2=B1  3%       -19%    2510128        numa-vmstat.node1.numa_m=
iss
      6.43 =C2=B1  5%        51%       9.70 =C2=B1 11%  turbostat.Pkg%pc2
      0.30              28%       0.38        turbostat.CPU%c3
      9.71                        9.92        turbostat.RAMWatt
       158                         154        turbostat.PkgWatt
       125              -3%        121        turbostat.CorWatt
      1141              -6%       1078        turbostat.Avg_MHz
     38.70              -6%      36.48        turbostat.%Busy
      5.03 =C2=B1 11%       -51%       2.46 =C2=B1 40%  turbostat.Pkg%pc6
      8.33 =C2=B1 48%        88%      15.67 =C2=B1 36%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
      1947 =C2=B1  3%       -12%       1710 =C2=B1  7%  sched_debug.cfs_rq:=
/.spread0.stddev
      1936 =C2=B1  3%       -12%       1698 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      2170 =C2=B1 10%       -14%       1863 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.max
    220926 =C2=B1 18%        37%     303192 =C2=B1  5%  sched_debug.cpu.avg=
_idle.stddev
      0.06 =C2=B1 13%       357%       0.28 =C2=B1 23%  sched_debug.rt_rq:/=
.rt_time.avg
      0.37 =C2=B1 10%       240%       1.25 =C2=B1 15%  sched_debug.rt_rq:/=
.rt_time.stddev
      2.54 =C2=B1 10%       160%       6.59 =C2=B1 10%  sched_debug.rt_rq:/=
.rt_time.max
      0.32 =C2=B1 19%        29%       0.42 =C2=B1 10%  perf-stat.dTLB-load=
-miss-rate
    964727               7%    1028830        perf-stat.context-switches
    176406               4%     184289        perf-stat.cpu-migrations
      0.29               4%       0.30        perf-stat.branch-miss-rate
 1.634e+09                   1.673e+09        perf-stat.node-store-misses
     23.60                       23.99        perf-stat.node-store-miss-rate
     40.01                       40.57        perf-stat.cache-miss-rate
      0.95              -8%       0.87        perf-stat.ipc
 3.203e+12              -9%  2.928e+12        perf-stat.cpu-cycles
 1.506e+09             -11%  1.345e+09        perf-stat.branch-misses
     50.64 =C2=B1 13%       -14%      43.45 =C2=B1  4%  perf-stat.iTLB-load=
-miss-rate
 5.285e+11             -14%  4.523e+11        perf-stat.branch-instructions
 3.042e+12             -16%  2.551e+12        perf-stat.instructions
 7.996e+11             -18%  6.584e+11        perf-stat.dTLB-loads
 5.569e+11 =C2=B1  4%       -18%  4.578e+11        perf-stat.dTLB-stores


Here are the detailed numbers for the slowed down case:

aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44

99091700659f4df9  bf4dc6e4ecc2a3d042029319bc
----------------  --------------------------
         %stddev      change         %stddev
             \          |                \
    360451             -17%     299377        aim7.jobs-per-min
     12806             481%      74447        aim7.time.involuntary_context=
_switches
       755              44%       1086        aim7.time.system_time
     50.17              20%      60.36        aim7.time.elapsed_time
     50.17              20%      60.36        aim7.time.elapsed_time.max
    438148                      446012        aim7.time.voluntary_context_s=
witches
     37798 =C2=B1 16%       780%     332583 =C2=B1  8%  interrupts.CAL:Func=
tion_call_interrupts
     78.82 =C2=B1  5%        18%      93.35 =C2=B1  5%  uptime.boot
      2847 =C2=B1  7%        11%       3160 =C2=B1  7%  uptime.idle
    147490 =C2=B1  8%        34%     197261 =C2=B1  3%  softirqs.RCU
    648159              29%     839283        softirqs.TIMER
    160830              10%     177144        softirqs.SCHED
   3845352 =C2=B1  4%        91%    7349133        numa-numastat.node0.numa=
_miss
   4686838 =C2=B1  5%        67%    7835640        numa-numastat.node0.numa=
_foreign
   3848455 =C2=B1  4%        91%    7352436        numa-numastat.node1.numa=
_foreign
   4689920 =C2=B1  5%        67%    7838734        numa-numastat.node1.numa=
_miss
     50.17              20%      60.36        time.elapsed_time.max
     12806             481%      74447        time.involuntary_context_swit=
ches
       755              44%       1086        time.system_time
     50.17              20%      60.36        time.elapsed_time
      1563              18%       1846        time.percent_of_cpu_this_job_=
got
     11699 =C2=B1 19%      3738%     449048        vmstat.io.bo
  18836969             -16%   15789996        vmstat.memory.free
        16              19%         19        vmstat.procs.r
     19377             459%     108364        vmstat.system.cs
     48255              11%      53537        vmstat.system.in
   2357299              25%    2951384        meminfo.Inactive(file)
   2366381              25%    2960468        meminfo.Inactive
   1575292              -9%    1429971        meminfo.Cached
  19342499             -17%   16100340        meminfo.MemFree
   1057904             -20%     842987        meminfo.Dirty
      1057              21%       1284        turbostat.Avg_MHz
     35.78              21%      43.24        turbostat.%Busy
      9.95              15%      11.47        turbostat.RAMWatt
        74 =C2=B1  5%        10%         81        turbostat.CoreTmp
        74 =C2=B1  4%        10%         81        turbostat.PkgTmp
       118               8%        128        turbostat.CorWatt
       151               7%        162        turbostat.PkgWatt
     29.06             -23%      22.39        turbostat.CPU%c6
       487 =C2=B1 89%      3e+04      26448 =C2=B1 57%  latency_stats.max.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_free=
_extent_fix_freelist.xfs_free_extent.xfs_trans_free_extent
      1823 =C2=B1 82%      2e+06    1913796 =C2=B1 38%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_free=
_extent_fix_freelist.xfs_free_extent.xfs_trans_free_extent
    208475 =C2=B1 43%      1e+06    1409494 =C2=B1  5%  latency_stats.sum.w=
ait_on_page_bit.truncate_inode_pages_range.truncate_inode_pages_final.evict=
.iput.dentry_unlink_inode.__dentry_kill.dput.__fput.____fput.task_work_run.=
exit_to_usermode_loop
      6884 =C2=B1 73%      8e+04      90790 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.xfs_trans_=
commit.xfs_vn_update_time.file_update_time.xfs_file_aio_write_checks.xfs_fi=
le_buffered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write.SyS_write
      1598 =C2=B1 20%      3e+04      35015 =C2=B1 27%  latency_stats.sum.c=
all_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.__xfs_tran=
s_roll.xfs_trans_roll.xfs_itruncate_extents.xfs_free_eofblocks.xfs_release.=
xfs_file_release.__fput.____fput.task_work_run
      2006 =C2=B1 25%      3e+04      31143 =C2=B1 35%  latency_stats.sum.c=
all_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.__xfs_tran=
s_roll.xfs_trans_roll.xfs_itruncate_extents.xfs_inactive_truncate.xfs_inact=
ive.xfs_fs_destroy_inode.destroy_inode.evict.iput
        29 =C2=B1101%      1e+04      10214 =C2=B1 29%  latency_stats.sum.c=
all_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.__xfs_tran=
s_roll.xfs_trans_roll.xfs_defer_trans_roll.xfs_defer_finish.xfs_itruncate_e=
xtents.xfs_inactive_truncate.xfs_inactive.xfs_fs_destroy_inode.destroy_inode
      1206 =C2=B1 51%      9e+03       9919 =C2=B1 25%  latency_stats.sum.c=
all_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.xfs_trans_=
commit.xfs_vn_update_time.touch_atime.generic_file_read_iter.xfs_file_buffe=
red_aio_read.xfs_file_read_iter.__vfs_read.vfs_read.SyS_read
  29869205 =C2=B1  4%       -10%   26804569        cpuidle.C1-IVT.time
   5737726              39%    7952214        cpuidle.C1E-IVT.time
     51141              17%      59958        cpuidle.C1E-IVT.usage
  18377551              37%   25176426        cpuidle.C3-IVT.time
     96067              17%     112045        cpuidle.C3-IVT.usage
   1806811              12%    2024041        cpuidle.C6-IVT.usage
   1104420 =C2=B1 36%       204%    3361085 =C2=B1 27%  cpuidle.POLL.time
       281 =C2=B1 10%        20%        338        cpuidle.POLL.usage
      5.61 =C2=B1 11%       -0.5       5.12 =C2=B1 18%  perf-profile.cycles=
-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter.ca=
ll_cpuidle
      5.85 =C2=B1  6%       -0.8       5.06 =C2=B1 15%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.cpuidle_enter
      6.32 =C2=B1  6%       -0.9       5.42 =C2=B1 15%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.cpuidle_enter.call_cpuidle
     15.77 =C2=B1  8%         -2      13.83 =C2=B1 17%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter.call_cpuidl=
e.cpu_startup_entry
     16.04 =C2=B1  8%         -2      14.01 =C2=B1 15%  perf-profile.cycles=
-pp.apic_timer_interrupt.cpuidle_enter.call_cpuidle.cpu_startup_entry.start=
_secondary
     60.25 =C2=B1  4%         -7      53.03 =C2=B1  7%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
     60.41 =C2=B1  4%         -7      53.12 =C2=B1  7%  perf-profile.func.c=
ycles-pp.intel_idle
   1174104              22%    1436859        numa-meminfo.node0.Inactive
   1167471              22%    1428271        numa-meminfo.node0.Inactive(f=
ile)
    770811              -9%     698147        numa-meminfo.node0.FilePages
  20707294             -12%   18281509 =C2=B1  6%  numa-meminfo.node0.Active
  20613745             -12%   18180987 =C2=B1  6%  numa-meminfo.node0.Activ=
e(file)
   9676639             -17%    8003627        numa-meminfo.node0.MemFree
    509906             -22%     396192        numa-meminfo.node0.Dirty
   1189539              28%    1524697        numa-meminfo.node1.Inactive(f=
ile)
   1191989              28%    1525194        numa-meminfo.node1.Inactive
    804508             -10%     727067        numa-meminfo.node1.FilePages
   9654540             -16%    8077810        numa-meminfo.node1.MemFree
    547956             -19%     441933        numa-meminfo.node1.Dirty
       396 =C2=B1 12%       485%       2320 =C2=B1 37%  slabinfo.bio-1.num_=
objs
       396 =C2=B1 12%       481%       2303 =C2=B1 37%  slabinfo.bio-1.acti=
ve_objs
        73             140%        176 =C2=B1 14%  slabinfo.kmalloc-128.act=
ive_slabs
        73             140%        176 =C2=B1 14%  slabinfo.kmalloc-128.num=
_slabs
      4734              94%       9171 =C2=B1 11%  slabinfo.kmalloc-128.num=
_objs
      4734              88%       8917 =C2=B1 13%  slabinfo.kmalloc-128.act=
ive_objs
     16238             -10%      14552 =C2=B1  3%  slabinfo.kmalloc-256.act=
ive_objs
     17189             -13%      15033 =C2=B1  3%  slabinfo.kmalloc-256.num=
_objs
     20651              96%      40387 =C2=B1 17%  slabinfo.radix_tree_node=
.active_objs
       398              91%        761 =C2=B1 17%  slabinfo.radix_tree_node=
.active_slabs
       398              91%        761 =C2=B1 17%  slabinfo.radix_tree_node=
.num_slabs
     22313              91%      42650 =C2=B1 17%  slabinfo.radix_tree_node=
.num_objs
        32             638%        236 =C2=B1 28%  slabinfo.xfs_efd_item.ac=
tive_slabs
        32             638%        236 =C2=B1 28%  slabinfo.xfs_efd_item.nu=
m_slabs
      1295             281%       4934 =C2=B1 23%  slabinfo.xfs_efd_item.nu=
m_objs
      1295             280%       4923 =C2=B1 23%  slabinfo.xfs_efd_item.ac=
tive_objs
      1661              81%       3000 =C2=B1 42%  slabinfo.xfs_log_ticket.=
num_objs
      1661              78%       2952 =C2=B1 42%  slabinfo.xfs_log_ticket.=
active_objs
      2617              49%       3905 =C2=B1 30%  slabinfo.xfs_trans.num_o=
bjs
      2617              48%       3870 =C2=B1 31%  slabinfo.xfs_trans.activ=
e_objs
   1015933             567%    6779099        perf-stat.context-switches
 4.864e+08             126%  1.101e+09        perf-stat.node-load-misses
 1.179e+09             103%  2.399e+09        perf-stat.node-loads
      0.06 =C2=B1 34%        92%       0.12 =C2=B1 11%  perf-stat.dTLB-stor=
e-miss-rate
 2.985e+08 =C2=B1 32%        86%  5.542e+08 =C2=B1 11%  perf-stat.dTLB-stor=
e-misses
 2.551e+09 =C2=B1 15%        81%  4.625e+09 =C2=B1 13%  perf-stat.dTLB-load=
-misses
      0.39 =C2=B1 14%        66%       0.65 =C2=B1 13%  perf-stat.dTLB-load=
-miss-rate
  1.26e+09              60%  2.019e+09        perf-stat.node-store-misses
  46072661 =C2=B1 27%        49%   68472915        perf-stat.iTLB-loads
 2.738e+12 =C2=B1  4%        43%  3.916e+12        perf-stat.cpu-cycles
     21.48              32%      28.35        perf-stat.node-store-miss-rate
 1.612e+10 =C2=B1  3%        28%  2.066e+10        perf-stat.cache-referenc=
es
 1.669e+09 =C2=B1  3%        24%  2.063e+09        perf-stat.branch-misses
 6.816e+09 =C2=B1  3%        20%  8.179e+09        perf-stat.cache-misses
    177699              18%     209145        perf-stat.cpu-migrations
      0.39              13%       0.44        perf-stat.branch-miss-rate
 4.606e+09              11%  5.102e+09        perf-stat.node-stores
 4.329e+11 =C2=B1  4%         9%  4.727e+11        perf-stat.branch-instruc=
tions
 6.458e+11               9%  7.046e+11        perf-stat.dTLB-loads
     29.19               8%      31.45        perf-stat.node-load-miss-rate
    286173               8%     308115        perf-stat.page-faults
    286191               8%     308109        perf-stat.minor-faults
  45084934               4%   47073719        perf-stat.iTLB-load-misses
     42.28              -6%      39.58        perf-stat.cache-miss-rate
     50.62 =C2=B1 16%       -19%      40.75        perf-stat.iTLB-load-miss=
-rate
      0.89             -28%       0.64        perf-stat.ipc
         2 =C2=B1 36%     4e+07%     970191        proc-vmstat.pgrotated
       150 =C2=B1 21%     1e+07%   15356485 =C2=B1  3%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     76823 =C2=B1 35%     56899%   43788651        proc-vmstat.pgscan_direct
    153407 =C2=B1 19%      4483%    7031431        proc-vmstat.nr_written
    619699 =C2=B1 19%      4441%   28139689        proc-vmstat.pgpgout
   5342421            1061%   62050709        proc-vmstat.pgactivate
        47 =C2=B1 25%       354%        217        proc-vmstat.nr_pages_sca=
nned
   8542963 =C2=B1  3%        78%   15182914        proc-vmstat.numa_miss
   8542963 =C2=B1  3%        78%   15182715        proc-vmstat.numa_foreign
   2820568              31%    3699073        proc-vmstat.pgalloc_dma32
    589234              25%     738160        proc-vmstat.nr_zone_inactive_=
file
    589240              25%     738155        proc-vmstat.nr_inactive_file
  61347830              13%   69522958        proc-vmstat.pgfree
    393711              -9%     356981        proc-vmstat.nr_file_pages
   4831749             -17%    4020131        proc-vmstat.nr_free_pages
  61252784             -18%   50183773        proc-vmstat.pgrefill
  61245420             -18%   50176301        proc-vmstat.pgdeactivate
    264397             -20%     210222        proc-vmstat.nr_zone_write_pen=
ding
    264367             -20%     210188        proc-vmstat.nr_dirty
  60420248             -39%   36646178        proc-vmstat.pgscan_kswapd
  60373976             -44%   33735064        proc-vmstat.pgsteal_kswapd
      1753             -98%         43 =C2=B1 18%  proc-vmstat.pageoutrun
      1095             -98%         25 =C2=B1 17%  proc-vmstat.kswapd_low_w=
mark_hit_quickly
       656 =C2=B1  3%       -98%         15 =C2=B1 24%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
         0                     1136221        numa-vmstat.node0.workingset_=
refault
         0                     1136221        numa-vmstat.node0.workingset_=
activate
        23 =C2=B1 45%     1e+07%    2756907        numa-vmstat.node0.nr_vms=
can_immediate_reclaim
     37618 =C2=B1 24%      3234%    1254165        numa-vmstat.node0.nr_wri=
tten
   1346538 =C2=B1  4%       104%    2748439        numa-vmstat.node0.numa_m=
iss
   1577620 =C2=B1  5%        80%    2842882        numa-vmstat.node0.numa_f=
oreign
    291242              23%     357407        numa-vmstat.node0.nr_inactive=
_file
    291237              23%     357390        numa-vmstat.node0.nr_zone_ina=
ctive_file
  13961935              12%   15577331        numa-vmstat.node0.numa_local
  13961938              12%   15577332        numa-vmstat.node0.numa_hit
     39831              10%      43768        numa-vmstat.node0.nr_unevicta=
ble
     39831              10%      43768        numa-vmstat.node0.nr_zone_une=
victable
    193467             -10%     174639        numa-vmstat.node0.nr_file_pag=
es
   5147212             -12%    4542321 =C2=B1  6%  numa-vmstat.node0.nr_act=
ive_file
   5147237             -12%    4542325 =C2=B1  6%  numa-vmstat.node0.nr_zon=
e_active_file
   2426129             -17%    2008637        numa-vmstat.node0.nr_free_pag=
es
    128285             -23%      99206        numa-vmstat.node0.nr_zone_wri=
te_pending
    128259             -23%      99183        numa-vmstat.node0.nr_dirty
         0                     1190594        numa-vmstat.node1.workingset_=
refault
         0                     1190594        numa-vmstat.node1.workingset_=
activate
        21 =C2=B1 36%     1e+07%    3120425 =C2=B1  4%  numa-vmstat.node1.n=
r_vmscan_immediate_reclaim
     38541 =C2=B1 26%      3336%    1324185        numa-vmstat.node1.nr_wri=
tten
   1316819 =C2=B1  4%       105%    2699075        numa-vmstat.node1.numa_f=
oreign
   1547929 =C2=B1  4%        80%    2793491        numa-vmstat.node1.numa_m=
iss
    296714              28%     381124        numa-vmstat.node1.nr_zone_ina=
ctive_file
    296714              28%     381123        numa-vmstat.node1.nr_inactive=
_file
  14311131              10%   15750908        numa-vmstat.node1.numa_hit
  14311130              10%   15750905        numa-vmstat.node1.numa_local
    201164             -10%     181742        numa-vmstat.node1.nr_file_pag=
es
   2422825             -16%    2027750        numa-vmstat.node1.nr_free_pag=
es
    137069             -19%     110501        numa-vmstat.node1.nr_zone_wri=
te_pending
    137069             -19%     110497        numa-vmstat.node1.nr_dirty
       737 =C2=B1 29%     27349%     202387        sched_debug.cfs_rq:/.min=
_vruntime.min
      3637 =C2=B1 20%      7919%     291675        sched_debug.cfs_rq:/.min=
_vruntime.avg
     11.00 =C2=B1 44%      4892%     549.17 =C2=B1  9%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
      2.12 =C2=B1 36%      4853%     105.12 =C2=B1  5%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
      1885 =C2=B1  6%      4189%      80870        sched_debug.cfs_rq:/.min=
_vruntime.stddev
      1896 =C2=B1  6%      4166%      80895        sched_debug.cfs_rq:/.spr=
ead0.stddev
     10774 =C2=B1 13%      4113%     453925        sched_debug.cfs_rq:/.min=
_vruntime.max
      1.02 =C2=B1 19%      2630%      27.72 =C2=B1  7%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     63060 =C2=B1 45%       776%     552157        sched_debug.cfs_rq:/.loa=
d.max
     14442 =C2=B1 21%       590%      99615 =C2=B1 14%  sched_debug.cfs_rq:=
/.load.stddev
      8397 =C2=B1  9%       309%      34370 =C2=B1 12%  sched_debug.cfs_rq:=
/.load.avg
     46.02 =C2=B1 24%       176%     126.96 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.stddev
       817              19%        974 =C2=B1  3%  sched_debug.cfs_rq:/.uti=
l_avg.max
       721             -17%        600 =C2=B1  3%  sched_debug.cfs_rq:/.uti=
l_avg.avg
       595 =C2=B1 11%       -38%        371 =C2=B1  7%  sched_debug.cfs_rq:=
/.util_avg.min
      1484 =C2=B1 20%       -47%        792 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.min
      1798 =C2=B1  4%       -50%        903 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.avg
       322 =C2=B1  8%      7726%      25239 =C2=B1  8%  sched_debug.cpu.nr_=
switches.min
       969            7238%      71158        sched_debug.cpu.nr_switches.a=
vg
      2.23 =C2=B1 40%      4650%     106.14 =C2=B1  4%  sched_debug.cpu.cpu=
_load[0].stddev
       943 =C2=B1  4%      3475%      33730 =C2=B1  3%  sched_debug.cpu.nr_=
switches.stddev
      0.87 =C2=B1 25%      3057%      27.46 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].avg
      5.43 =C2=B1 13%      2232%     126.61        sched_debug.cpu.nr_unint=
erruptible.stddev
      6131 =C2=B1  3%      2028%     130453        sched_debug.cpu.nr_switc=
hes.max
      1.58 =C2=B1 29%      1852%      30.90 =C2=B1  4%  sched_debug.cpu.cpu=
_load[4].avg
      2.00 =C2=B1 49%      1422%      30.44 =C2=B1  5%  sched_debug.cpu.cpu=
_load[3].avg
     63060 =C2=B1 45%      1053%     726920 =C2=B1 32%  sched_debug.cpu.loa=
d.max
     21.25 =C2=B1 44%       777%     186.33 =C2=B1  7%  sched_debug.cpu.nr_=
uninterruptible.max
     14419 =C2=B1 21%       731%     119865 =C2=B1 31%  sched_debug.cpu.loa=
d.stddev
      3586             381%      17262        sched_debug.cpu.nr_load_updat=
es.min
      8286 =C2=B1  8%       364%      38414 =C2=B1 17%  sched_debug.cpu.loa=
d.avg
      5444             303%      21956        sched_debug.cpu.nr_load_updat=
es.avg
      1156             231%       3827        sched_debug.cpu.nr_load_updat=
es.stddev
      8603 =C2=B1  4%       222%      27662        sched_debug.cpu.nr_load_=
updates.max
      1410             165%       3735        sched_debug.cpu.curr->pid.max
     28742 =C2=B1 15%       120%      63101 =C2=B1  7%  sched_debug.cpu.clo=
ck.min
     28742 =C2=B1 15%       120%      63101 =C2=B1  7%  sched_debug.cpu.clo=
ck_task.min
     28748 =C2=B1 15%       120%      63107 =C2=B1  7%  sched_debug.cpu.clo=
ck.avg
     28748 =C2=B1 15%       120%      63107 =C2=B1  7%  sched_debug.cpu.clo=
ck_task.avg
     28751 =C2=B1 15%       120%      63113 =C2=B1  7%  sched_debug.cpu.clo=
ck.max
     28751 =C2=B1 15%       120%      63113 =C2=B1  7%  sched_debug.cpu.clo=
ck_task.max
       442 =C2=B1 11%        93%        854 =C2=B1 15%  sched_debug.cpu.cur=
r->pid.avg
       618 =C2=B1  3%        72%       1065 =C2=B1  4%  sched_debug.cpu.cur=
r->pid.stddev
      1.88 =C2=B1 11%        50%       2.83 =C2=B1  8%  sched_debug.cpu.clo=
ck.stddev
      1.88 =C2=B1 11%        50%       2.83 =C2=B1  8%  sched_debug.cpu.clo=
ck_task.stddev
      5.22 =C2=B1  9%       -55%       2.34 =C2=B1 23%  sched_debug.rt_rq:/=
.rt_time.max
      0.85             -55%       0.38 =C2=B1 28%  sched_debug.rt_rq:/.rt_t=
ime.stddev
      0.17             -56%       0.07 =C2=B1 33%  sched_debug.rt_rq:/.rt_t=
ime.avg
     27633 =C2=B1 16%       124%      61980 =C2=B1  8%  sched_debug.ktime
     28745 =C2=B1 15%       120%      63102 =C2=B1  7%  sched_debug.sched_c=
lk
     28745 =C2=B1 15%       120%      63102 =C2=B1  7%  sched_debug.cpu_clk

Thanks,
Fengguang

--===============7307919308318558772==--

