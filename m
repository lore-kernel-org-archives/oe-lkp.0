Content-Type: multipart/mixed; boundary="===============7236180255523474012=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/tip] 30874f21ed9: No primary result change, +195.6% fileio.time.minor_page_faults
Date: Tue, 14 Jul 2015 21:02:28 +0800
Message-ID: <1436878948.1264.6.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7236180255523474012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
commit 30874f21ed9bf392ca910600df8bb1dbfd9beabb ("sched/tip:Prefer numa hot=
ness over cache hotness")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/period/nr_thre=
ads/disk/fs/size/filenum/rwmode/iomode:
  bay/fileio/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/6=
00s/100%/1HDD/btrfs/64G/1024f/seqwr/sync

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      3746 =C2=B1  2%      +3.5%       3876 =C2=B1  0%  fileio.time.maximum=
_resident_set_size
    666.50 =C2=B1  0%    +195.6%       1970 =C2=B1  2%  fileio.time.minor_p=
age_faults
    666.50 =C2=B1  0%    +195.6%       1970 =C2=B1  2%  time.minor_page_fau=
lts
    124968 =C2=B1100%    +279.4%     474125 =C2=B1100%  latency_stats.avg.b=
trfs_async_run_delayed_refs.[btrfs].__btrfs_end_transaction.[btrfs].btrfs_e=
nd_transaction.[btrfs].btrfs_cont_expand.[btrfs].btrfs_file_write_iter.[btr=
fs].__vfs_write.vfs_write.SyS_pwrite64.entry_SYSCALL_64_fastpath
     16379 =C2=B1  5%     +53.2%      25088 =C2=B1 18%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
    576.00 =C2=B1 10%     +20.7%     695.25 =C2=B1 11%  slabinfo.btrfs_dela=
yed_data_ref.active_objs
    576.00 =C2=B1 10%     +20.7%     695.25 =C2=B1 11%  slabinfo.btrfs_dela=
yed_data_ref.num_objs
     29.75 =C2=B1 20%    +135.3%      70.00 =C2=B1 36%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    119.50 =C2=B1 65%    +186.4%     342.25 =C2=B1 32%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
      4219 =C2=B1  7%     +33.4%       5629 =C2=B1 26%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     91.00 =C2=B1  6%     +34.3%     122.25 =C2=B1 26%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     39.50 =C2=B1 61%     +91.8%      75.75 =C2=B1 18%  sched_debug.cpu#1.c=
pu_load[0]
     27.00 =C2=B1 52%    +108.3%      56.25 =C2=B1 22%  sched_debug.cpu#1.c=
pu_load[1]
     19.00 =C2=B1 34%    +117.1%      41.25 =C2=B1 24%  sched_debug.cpu#1.c=
pu_load[2]
     14.00 =C2=B1 22%    +116.1%      30.25 =C2=B1 27%  sched_debug.cpu#1.c=
pu_load[3]
     12.00 =C2=B1 26%    +104.2%      24.50 =C2=B1 27%  sched_debug.cpu#1.c=
pu_load[4]
     24.25 =C2=B1 39%    +166.0%      64.50 =C2=B1 28%  sched_debug.cpu#2.c=
pu_load[0]
     21.25 =C2=B1 34%    +132.9%      49.50 =C2=B1 33%  sched_debug.cpu#2.c=
pu_load[1]
     18.75 =C2=B1 34%    +118.7%      41.00 =C2=B1 47%  sched_debug.cpu#2.c=
pu_load[2]
     16.75 =C2=B1 39%    +119.4%      36.75 =C2=B1 62%  sched_debug.cpu#2.c=
pu_load[3]
    984.25 =C2=B1 44%     +98.8%       1956 =C2=B1 26%  sched_debug.cpu#2.c=
urr->pid
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/period/nr_thre=
ads/disk/fs/size/filenum/rwmode/iomode:
  bay/fileio/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/6=
00s/100%/1HDD/f2fs/64G/1024f/seqwr/sync

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    668.00 =C2=B1  0%    +185.1%       1904 =C2=B1  3%  fileio.time.minor_p=
age_faults
   3504570 =C2=B1  0%      -1.0%    3471202 =C2=B1  0%  fileio.time.volunta=
ry_context_switches
     77542 =C2=B1 18%     -46.6%      41420 =C2=B1 34%  proc-vmstat.pgscan_=
direct_dma32
    668.00 =C2=B1  0%    +185.1%       1904 =C2=B1  3%  time.minor_page_fau=
lts
     26397 =C2=B1  0%      -8.7%      24113 =C2=B1 13%  vmstat.system.cs
      0.00 =C2=B1 -1%      +Inf%    1432132 =C2=B1166%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    2499827 =C2=B1169%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  1.28e+08 =C2=B1  0%      +7.8%   1.38e+08 =C2=B1  3%  latency_stats.sum.b=
alance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.__vfs_write.vfs_write.SyS_p=
write64.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    5611872 =C2=B1171%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      8.50 =C2=B1105%    +523.5%      53.00 =C2=B1 50%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      4840 =C2=B1 24%     +47.1%       7118 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
    105.00 =C2=B1 24%     +47.4%     154.75 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      4176 =C2=B1  9%     +53.7%       6417 =C2=B1 20%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
     90.25 =C2=B1  9%     +54.3%     139.25 =C2=B1 20%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
     17.75 =C2=B1 30%    +260.6%      64.00 =C2=B1 65%  sched_debug.cpu#0.c=
pu_load[0]
   1213614 =C2=B1 94%     -59.3%     494542 =C2=B1  5%  sched_debug.cpu#0.t=
twu_count
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/period/nr_thre=
ads/disk/fs/size/filenum/rwmode/iomode:
  bay/fileio/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/6=
00s/100%/1HDD/xfs/64G/1024f/seqwr/sync

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    665.75 =C2=B1  0%    +193.9%       1956 =C2=B1  2%  fileio.time.minor_p=
age_faults
      1661 =C2=B1  4%     +10.8%       1841 =C2=B1  4%  proc-vmstat.pgalloc=
_dma
    665.75 =C2=B1  0%    +193.9%       1956 =C2=B1  2%  time.minor_page_fau=
lts
     24.00 =C2=B1  5%     +24.0%      29.75 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     25.00 =C2=B1  4%     -21.0%      19.75 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      1784 =C2=B1 37%     -49.3%     904.00 =C2=B1 28%  sched_debug.cpu#1.c=
urr->pid
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/btrfs/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      8052 =C2=B1  0%     +54.0%      12401 =C2=B1  5%  fsmark.time.minor_p=
age_faults
  73486184 =C2=B1  4%      +7.9%   79292570 =C2=B1  4%  cpuidle.C3-NHM.time
      8052 =C2=B1  0%     +54.0%      12401 =C2=B1  5%  time.minor_page_fau=
lts
    298.75 =C2=B1 18%     +26.6%     378.25 =C2=B1 10%  slabinfo.ext4_free_=
data.active_objs
    298.75 =C2=B1 18%     +26.6%     378.25 =C2=B1 10%  slabinfo.ext4_free_=
data.num_objs
     27801 =C2=B1 21%     +35.0%      37530 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     10055 =C2=B1 16%     +34.7%      13540 =C2=B1 12%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     27802 =C2=B1 21%     +34.5%      37391 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     27671 =C2=B1 21%     +34.4%      37194 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     27672 =C2=B1 21%     +29.6%      35868 =C2=B1 15%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     27622 =C2=B1 21%     +29.9%      35868 =C2=B1 15%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     27635 =C2=B1 21%     +29.8%      35868 =C2=B1 15%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     27632 =C2=B1 21%     +29.8%      35868 =C2=B1 15%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     27521 =C2=B1 21%     +30.3%      35864 =C2=B1 15%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      5438 =C2=B1 31%  +12265.8%     672512 =C2=B1104%  sched_debug.cpu#1.t=
twu_local
     12.25 =C2=B1 63%    +167.3%      32.75 =C2=B1 19%  sched_debug.cpu#4.c=
pu_load[1]
     65.50 =C2=B1 21%     -67.2%      21.50 =C2=B1 93%  sched_debug.cpu#6.c=
pu_load[2]
     46.50 =C2=B1 15%     -62.4%      17.50 =C2=B1 75%  sched_debug.cpu#6.c=
pu_load[3]
     33.25 =C2=B1 16%     -45.1%      18.25 =C2=B1 54%  sched_debug.cpu#6.c=
pu_load[4]
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/btrfs/9B/400M/fsyncBeforeClose/16d/256fpd

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10640 =C2=B1  0%     +87.8%      19978 =C2=B1  2%  fsmark.time.minor_p=
age_faults
     17490 =C2=B1  6%     -75.5%       4277 =C2=B1  8%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpa=
th
     10640 =C2=B1  0%     +87.8%      19978 =C2=B1  2%  time.minor_page_fau=
lts
   1533083 =C2=B1 72%     -73.1%     413085 =C2=B1  1%  sched_debug.cpu#1.n=
r_switches
   1533200 =C2=B1 72%     -73.0%     413220 =C2=B1  1%  sched_debug.cpu#1.s=
ched_count
    650722 =C2=B1 80%     -81.4%     120841 =C2=B1  3%  sched_debug.cpu#1.s=
ched_goidle
    289935 =C2=B1 60%     +82.6%     529534 =C2=B1 21%  sched_debug.cpu#5.a=
vg_idle
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/mod=
e/ipc:
  mtp-ivy1/hackbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfo=
rmance/50%/threads/socket

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    663.53 =C2=B1  0%      -1.1%     656.02 =C2=B1  0%  hackbench.time.elap=
sed_time
    663.53 =C2=B1  0%      -1.1%     656.02 =C2=B1  0%  hackbench.time.elap=
sed_time.max
 2.236e+08 =C2=B1  0%      -2.4%  2.182e+08 =C2=B1  1%  hackbench.time.invo=
luntary_context_switches
      5959 =C2=B1  0%    +516.4%      36734 =C2=B1  4%  hackbench.time.mino=
r_page_faults
      4904 =C2=B1  0%      -1.1%       4850 =C2=B1  0%  hackbench.time.syst=
em_time
 4.841e+08 =C2=B1  0%      -1.9%  4.749e+08 =C2=B1  1%  hackbench.time.volu=
ntary_context_switches
    670026 =C2=B1 31%     +92.5%    1289662 =C2=B1 18%  cpuidle.C3-IVB.time
      5959 =C2=B1  0%    +516.4%      36734 =C2=B1  4%  time.minor_page_fau=
lts
      0.05 =C2=B1 43%    +115.8%       0.10 =C2=B1 21%  turbostat.Pkg%pc3
      0.45 =C2=B1  9%    +163.3%       1.19 =C2=B1  2%  perf-profile.cpu-cy=
cles.__kernel_text_address.dump_trace.save_stack_trace_tsk.__account_schedu=
ler_latency.enqueue_entity
     15.81 =C2=B1  1%     -22.1%      12.31 =C2=B1  0%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      1.69 =C2=B1  3%     +13.9%       1.93 =C2=B1  3%  perf-profile.cpu-cy=
cles.__module_text_address.is_module_text_address.__kernel_text_address.pri=
nt_context_stack.dump_trace
      1.32 =C2=B1  1%     -13.4%       1.15 =C2=B1  8%  perf-profile.cpu-cy=
cles.__switch_to
      6.81 =C2=B1  2%     -59.7%       2.74 =C2=B1  1%  perf-profile.cpu-cy=
cles.is_ftrace_trampoline.__kernel_text_address.print_context_stack.dump_tr=
ace.save_stack_trace_tsk
      1.78 =C2=B1  2%     +73.0%       3.07 =C2=B1  1%  perf-profile.cpu-cy=
cles.is_module_text_address.print_context_stack.dump_trace.save_stack_trace=
_tsk.__account_scheduler_latency
      1.04 =C2=B1  6%     +13.2%       1.18 =C2=B1  6%  perf-profile.cpu-cy=
cles.kfree.skb_free_head.skb_release_data.skb_release_all.consume_skb
      1.41 =C2=B1  2%     -10.1%       1.27 =C2=B1  2%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_r=
ecvmsg
      1.29 =C2=B1  2%     +15.1%       1.49 =C2=B1  3%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.94 =C2=B1  3%     +22.4%       1.15 =C2=B1  5%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.05 =C2=B1  1%     +18.1%       1.24 =C2=B1  6%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_read.sys_read.entry_SYSCAL=
L_64_fastpath
      1.07 =C2=B1  7%     +13.3%       1.21 =C2=B1  4%  perf-profile.cpu-cy=
cles.skb_free_head.skb_release_data.skb_release_all.consume_skb.unix_stream=
_recvmsg
      1.27 =C2=B1  4%     +14.6%       1.46 =C2=B1  2%  perf-profile.cpu-cy=
cles.skb_release_data.skb_release_all.consume_skb.unix_stream_recvmsg.sock_=
recvmsg
    138.75 =C2=B1 10%     -21.1%     109.50 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.load
    132.00 =C2=B1  7%     -15.0%     112.25 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
    746.75 =C2=B1  5%     +22.1%     912.00 =C2=B1 17%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
    311731 =C2=B1  0%      -9.3%     282874 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.exec_clock
      7.50 =C2=B1 29%     +63.3%      12.25 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
   2722211 =C2=B1  1%      -7.3%    2524484 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     16.75 =C2=B1 14%     -40.3%      10.00 =C2=B1 39%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
   2746419 =C2=B1  0%      -7.2%    2550006 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      1014 =C2=B1  8%     -16.3%     849.00 =C2=B1 16%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
    312033 =C2=B1  0%      -7.3%     289288 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.exec_clock
    268.00 =C2=B1 49%    +153.7%     680.00 =C2=B1 41%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
   2744206 =C2=B1  0%      -7.5%    2537905 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.min_vruntime
    397.50 =C2=B1 32%    +100.6%     797.25 =C2=B1 35%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    136.25 =C2=B1 10%     -21.5%     107.00 =C2=B1 11%  sched_debug.cpu#0.l=
oad
   9222208 =C2=B1  1%      -9.1%    8382999 =C2=B1  2%  sched_debug.cpu#0.t=
twu_local
  30430538 =C2=B1  2%      -7.1%   28271798 =C2=B1  3%  sched_debug.cpu#1.t=
twu_count
     35870 =C2=B1 19%    +353.0%     162504 =C2=B1 61%  sched_debug.cpu#2.s=
ched_goidle
  30831893 =C2=B1  3%      -9.9%   27785159 =C2=B1  4%  sched_debug.cpu#3.t=
twu_count
  10432629 =C2=B1  7%     -18.8%    8470000 =C2=B1  8%  sched_debug.cpu#3.t=
twu_local
      6.25 =C2=B1 77%    -116.0%      -1.00 =C2=B1-538%  sched_debug.cpu#4.=
nr_uninterruptible
  30690275 =C2=B1  0%      -8.6%   28038013 =C2=B1  3%  sched_debug.cpu#4.t=
twu_count
  30663532 =C2=B1  2%      -9.5%   27765762 =C2=B1  4%  sched_debug.cpu#5.t=
twu_count
   9498405 =C2=B1  2%     -10.7%    8483506 =C2=B1  4%  sched_debug.cpu#5.t=
twu_local
  44973638 =C2=B1  2%     -10.3%   40347779 =C2=B1  6%  sched_debug.cpu#6.n=
r_switches
  44973914 =C2=B1  2%     -10.3%   40348157 =C2=B1  6%  sched_debug.cpu#6.s=
ched_count
    314540 =C2=B1  0%      -7.2%     291752 =C2=B1  4%  sched_debug.cpu#7.n=
r_load_updates
  45078605 =C2=B1  1%     -11.7%   39798883 =C2=B1  3%  sched_debug.cpu#7.n=
r_switches
  45079120 =C2=B1  1%     -11.7%   39799188 =C2=B1  3%  sched_debug.cpu#7.s=
ched_count
   9584278 =C2=B1  5%     -11.5%    8482116 =C2=B1  5%  sched_debug.cpu#7.t=
twu_local
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  xps2/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/10=
0%/128K

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     12488 =C2=B1  1%    +647.0%      93290 =C2=B1  4%  pigz.time.minor_pag=
e_faults
      7154 =C2=B1 24%    +147.1%      17676 =C2=B1 45%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
    337520 =C2=B1  0%     +23.8%     417772 =C2=B1  1%  proc-vmstat.pgfault
     12488 =C2=B1  1%    +647.0%      93290 =C2=B1  4%  time.minor_page_fau=
lts
      1.20 =C2=B1  7%     +23.7%       1.49 =C2=B1 12%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.pipe_write.__vfs_write.vfs_=
write
      1.38 =C2=B1  1%     +26.9%       1.76 =C2=B1 15%  perf-profile.cpu-cy=
cles.alloc_pages_current.pipe_write.__vfs_write.vfs_write.sys_write
      1.38 =C2=B1 26%     +46.8%       2.03 =C2=B1 12%  perf-profile.cpu-cy=
cles.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      2.07 =C2=B1  3%     -29.3%       1.47 =C2=B1 16%  perf-profile.cpu-cy=
cles.tick_do_update_jiffies64.tick_sched_do_timer.tick_sched_timer.__hrtime=
r_run_queues.hrtimer_interrupt
      1.76 =C2=B1  7%     -37.8%       1.10 =C2=B1 26%  perf-profile.cpu-cy=
cles.update_wall_time.tick_do_update_jiffies64.tick_sched_do_timer.tick_sch=
ed_timer.__hrtimer_run_queues
     13.50 =C2=B1  6%     -46.3%       7.25 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
      4.00 =C2=B1 17%     +68.8%       6.75 =C2=B1 28%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
    120.00 =C2=B1  7%     -13.5%     103.75 =C2=B1  9%  sched_debug.cpu#1.c=
pu_load[4]
      5.25 =C2=B1 34%    -128.6%      -1.50 =C2=B1-218%  sched_debug.cpu#1.=
nr_uninterruptible
    970.50 =C2=B1 15%     +67.7%       1627 =C2=B1 23%  sched_debug.cpu#4.s=
ched_goidle
    188.00 =C2=B1 42%     -50.8%      92.50 =C2=B1  6%  sched_debug.cpu#5.l=
oad
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  xps2/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/10=
0%/512K

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   3752893 =C2=B1  0%      +4.2%    3908831 =C2=B1  3%  pigz.time.involunta=
ry_context_switches
     28250 =C2=B1  0%    +605.5%     199301 =C2=B1  2%  pigz.time.minor_pag=
e_faults
      6677 =C2=B1 66%    +437.6%      35901 =C2=B1 52%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    353061 =C2=B1  0%     +48.0%     522561 =C2=B1  0%  proc-vmstat.pgfault
      3118 =C2=B1  7%     +12.8%       3516 =C2=B1  3%  slabinfo.kmalloc-19=
2.active_objs
     28250 =C2=B1  0%    +605.5%     199301 =C2=B1  2%  time.minor_page_fau=
lts
    154.19 =C2=B1  2%      +9.6%     168.94 =C2=B1  4%  uptime.idle
      0.34 =C2=B1 42%    +104.4%       0.70 =C2=B1 27%  perf-profile.cpu-cy=
cles.__update_cpu_load.update_cpu_load_active.scheduler_tick.update_process=
_times.tick_sched_handle
      1.71 =C2=B1  9%     +20.1%       2.06 =C2=B1  6%  perf-profile.cpu-cy=
cles.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.59 =C2=B1 23%     +73.1%       1.03 =C2=B1 12%  perf-profile.cpu-cy=
cles.sched_clock_cpu.update_rq_clock.scheduler_tick.update_process_times.ti=
ck_sched_handle
     10.03 =C2=B1  4%     +11.6%      11.19 =C2=B1  3%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.local_apic_timer_interrupt
      0.66 =C2=B1 23%     +51.5%       1.00 =C2=B1 29%  perf-profile.cpu-cy=
cles.update_cpu_load_active.scheduler_tick.update_process_times.tick_sched_=
handle.tick_sched_timer
      8.50 =C2=B1 30%     -38.2%       5.25 =C2=B1 20%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
      1029 =C2=B1  8%     -11.4%     911.75 =C2=B1 10%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
     88.00 =C2=B1  0%     +10.8%      97.50 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.load
     88.50 =C2=B1  1%     +13.8%     100.75 =C2=B1 10%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
     -2.50 =C2=B1-34%    -130.0%       0.75 =C2=B1110%  sched_debug.cpu#0.n=
r_uninterruptible
    127.25 =C2=B1  5%     -15.1%     108.00 =C2=B1  6%  sched_debug.cpu#1.c=
pu_load[3]
    127.25 =C2=B1  3%     -16.7%     106.00 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[4]
      1369 =C2=B1 40%     +51.6%       2076 =C2=B1  6%  sched_debug.cpu#1.c=
urr->pid
     51700 =C2=B1 17%     -30.3%      36053 =C2=B1 30%  sched_debug.cpu#4.t=
twu_count
    458569 =C2=B1 22%     +54.8%     709974 =C2=B1 13%  sched_debug.cpu#5.a=
vg_idle
     88.50 =C2=B1  1%     +13.8%     100.75 =C2=B1 10%  sched_debug.cpu#5.c=
pu_load[0]
     88.00 =C2=B1  0%     +10.8%      97.50 =C2=B1  8%  sched_debug.cpu#5.l=
oad
      9.00 =C2=B1 33%     -75.0%       2.25 =C2=B1 79%  sched_debug.cpu#5.n=
r_uninterruptible
    -11.50 =C2=B1-81%    -119.6%       2.25 =C2=B1155%  sched_debug.cpu#6.n=
r_uninterruptible
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/context_switch1

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     11171 =C2=B1  0%     +14.1%      12745 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
   1134537 =C2=B1141%    +263.3%    4121317 =C2=B1117%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     11171 =C2=B1  0%     +14.1%      12745 =C2=B1  0%  time.minor_page_fau=
lts
      0.81 =C2=B1  5%     +94.4%       1.58 =C2=B1  3%  perf-profile.cpu-cy=
cles.__kernel_text_address.dump_trace.save_stack_trace_tsk.__account_schedu=
ler_latency.enqueue_entity
     11.19 =C2=B1  0%     -19.9%       8.96 =C2=B1  1%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      1.28 =C2=B1  2%      -9.2%       1.17 =C2=B1  1%  perf-profile.cpu-cy=
cles.__module_address.is_module_text_address.__kernel_text_address.print_co=
ntext_stack.dump_trace
      1.68 =C2=B1 14%     +20.6%       2.03 =C2=B1  7%  perf-profile.cpu-cy=
cles.__remove_hrtimer.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restar=
t.tick_nohz_idle_exit
      6.59 =C2=B1  1%     +39.6%       9.20 =C2=B1  0%  perf-profile.cpu-cy=
cles.__schedule.schedule.pipe_wait.pipe_read.__vfs_read
      1.55 =C2=B1  7%     -55.6%       0.69 =C2=B1  7%  perf-profile.cpu-cy=
cles._raw_spin_unlock_irqrestore.hrtimer_start_range_ns.tick_nohz_restart.t=
ick_nohz_idle_exit.cpu_startup_entry
      4.09 =C2=B1  1%     +72.9%       7.07 =C2=B1  1%  perf-profile.cpu-cy=
cles.deactivate_task.__schedule.schedule.pipe_wait.pipe_read
      2.60 =C2=B1  2%    +116.8%       5.63 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedu=
le
      4.02 =C2=B1  1%     +74.0%       6.99 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__schedule.schedule.pipe_wait
      3.44 =C2=B1  1%     +88.2%       6.47 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule
      3.56 =C2=B1 10%     +14.6%       4.08 =C2=B1  5%  perf-profile.cpu-cy=
cles.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_=
exit.cpu_startup_entry
      4.30 =C2=B1  0%     -56.0%       1.89 =C2=B1  4%  perf-profile.cpu-cy=
cles.is_ftrace_trampoline.__kernel_text_address.print_context_stack.dump_tr=
ace.save_stack_trace_tsk
      0.92 =C2=B1  3%     +17.7%       1.08 =C2=B1  3%  perf-profile.cpu-cy=
cles.is_ftrace_trampoline.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      1.38 =C2=B1  2%     +10.5%       1.52 =C2=B1  2%  perf-profile.cpu-cy=
cles.is_module_text_address.print_context_stack.dump_trace.save_stack_trace=
_tsk.__account_scheduler_latency
      8.57 =C2=B1  0%     +27.0%      10.89 =C2=B1  0%  perf-profile.cpu-cy=
cles.pipe_wait.pipe_read.__vfs_read.vfs_read.sys_read
      1.07 =C2=B1  2%     +31.5%       1.41 =C2=B1  2%  perf-profile.cpu-cy=
cles.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      7.04 =C2=B1  1%     +36.3%       9.59 =C2=B1  0%  perf-profile.cpu-cy=
cles.schedule.pipe_wait.pipe_read.__vfs_read.vfs_read
      0.90 =C2=B1  2%     +36.6%       1.22 =C2=B1  3%  perf-profile.cpu-cy=
cles.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSC=
ALL_64_fastpath
      2.27 =C2=B1  3%     -18.0%       1.86 =C2=B1  3%  perf-profile.cpu-cy=
cles.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremove_wa=
ke_function.__wake_up_common
      0.75 =C2=B1  1%     +45.0%       1.09 =C2=B1  4%  perf-profile.cpu-cy=
cles.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wr=
ite.sys_write
      1.36 =C2=B1  6%     +29.5%       1.76 =C2=B1 11%  perf-profile.cpu-cy=
cles.tick_program_event.__remove_hrtimer.hrtimer_start_range_ns.tick_nohz_s=
top_sched_tick.__tick_nohz_idle_enter
      0.87 =C2=B1  2%     +30.0%       1.13 =C2=B1  2%  perf-profile.cpu-cy=
cles.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deacti=
vate_task
    516.25 =C2=B1136%    +301.7%       2073 =C2=B1 61%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     14524 =C2=B1 11%     +18.9%      17267 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    596.25 =C2=B1116%    +270.8%       2211 =C2=B1 60%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
     14343 =C2=B1 11%     +19.5%      17147 =C2=B1 10%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     14335 =C2=B1 11%     +19.4%      17110 =C2=B1 10%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      1.75 =C2=B1 47%    +171.4%       4.75 =C2=B1 27%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     14489 =C2=B1 11%     +19.0%      17248 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     14483 =C2=B1 11%     +19.1%      17253 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    455.25 =C2=B1 27%     +28.8%     586.50 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
     14430 =C2=B1 10%     +19.4%      17232 =C2=B1 10%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     14424 =C2=B1 10%     +19.3%      17213 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     14420 =C2=B1 10%     +19.3%      17199 =C2=B1 10%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     14408 =C2=B1 10%     +19.3%      17192 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     14382 =C2=B1 10%     +19.4%      17179 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      1865 =C2=B1 18%     -65.5%     642.75 =C2=B1 56%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     14377 =C2=B1 10%     +19.4%      17163 =C2=B1 10%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      1914 =C2=B1 18%     -62.4%     719.00 =C2=B1 53%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
     14368 =C2=B1 10%     +19.4%      17154 =C2=B1 10%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     72.25 =C2=B1  9%     +34.6%      97.25 =C2=B1  9%  sched_debug.cpu#0.c=
pu_load[0]
    290172 =C2=B1  7%     -16.0%     243745 =C2=B1 17%  sched_debug.cpu#1.a=
vg_idle
     54.25 =C2=B1  3%     +12.9%      61.25 =C2=B1  3%  sched_debug.cpu#1.c=
pu_load[2]
     54.00 =C2=B1  3%     +13.9%      61.50 =C2=B1  3%  sched_debug.cpu#1.c=
pu_load[3]
     54.00 =C2=B1  3%     +10.2%      59.50 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[4]
  19375134 =C2=B1 14%     -12.2%   17015561 =C2=B1  4%  sched_debug.cpu#2.n=
r_switches
  19375189 =C2=B1 14%     -12.2%   17015610 =C2=B1  4%  sched_debug.cpu#2.s=
ched_count
   5658065 =C2=B1 24%     -20.9%    4473053 =C2=B1  9%  sched_debug.cpu#2.s=
ched_goidle
      1600 =C2=B1 21%     +28.5%       2056 =C2=B1  9%  sched_debug.cpu#3.c=
urr->pid
     42.75 =C2=B1  6%     +18.1%      50.50 =C2=B1  8%  sched_debug.cpu#5.c=
pu_load[2]
     88.50 =C2=B1 19%     -32.8%      59.50 =C2=B1 28%  sched_debug.cpu#6.c=
pu_load[0]
      0.30 =C2=B1 93%     -78.8%       0.06 =C2=B1102%  sched_debug.rt_rq[1=
]:/.rt_time
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-a03/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/pe=
rformance/lock1

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      7478 =C2=B1  0%      +1.2%       7569 =C2=B1  0%  will-it-scale.time.=
maximum_resident_set_size
      8398 =C2=B1  0%      +6.2%       8920 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
     51892 =C2=B1 17%     +27.6%      66228 =C2=B1 12%  meminfo.DirectMap4k
     29992 =C2=B1  8%     +12.8%      33842 =C2=B1  4%  softirqs.RCU
     29.63 =C2=B1  4%     +10.0%      32.61 =C2=B1  3%  time.user_time
     17682 =C2=B1  7%      +5.3%      18625 =C2=B1  7%  vmstat.system.cs
    247.25 =C2=B1  2%     -15.5%     209.00 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.load
    853.50 =C2=B1  1%     -11.9%     751.75 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     35.25 =C2=B1  4%     -18.4%      28.75 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      2348 =C2=B1  1%      -8.6%       2145 =C2=B1  5%  sched_debug.cpu#0.c=
urr->pid
    247.00 =C2=B1  2%     -15.4%     209.00 =C2=B1 15%  sched_debug.cpu#0.l=
oad
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/malloc2

commit: =

  6a1debd14048f8067c4d0ed8b41149a3ef178cbf
  30874f21ed9bf392ca910600df8bb1dbfd9beabb

6a1debd14048f806 30874f21ed9bf392ca910600df =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     11144 =C2=B1  0%     +12.5%      12538 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
    202651 =C2=B1  3%     -14.4%     173458 =C2=B1  2%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     11144 =C2=B1  0%     +12.5%      12538 =C2=B1  0%  time.minor_page_fau=
lts
     16.86 =C2=B1 31%     -73.8%       4.41 =C2=B1100%  perf-profile.cpu-cy=
cles.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86=
_64_start_kernel
     57.17 =C2=B1 10%     +36.3%      77.94 =C2=B1 18%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
     16.80 =C2=B1 31%     -73.9%       4.39 =C2=B1100%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.rest_init.start_kernel.x86_64_start_re=
servations
     16.11 =C2=B1 31%     -73.5%       4.27 =C2=B1100%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.rest_init.start_ke=
rnel
     56.70 =C2=B1 10%     +36.7%      77.50 =C2=B1 18%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
      0.97 =C2=B1100%     -93.8%       0.06 =C2=B1-1666%  perf-profile.cpu-=
cycles.do_set_pte.filemap_map_pages.handle_pte_fault.handle_mm_fault.__do_p=
age_fault
      1.96 =C2=B1 78%     -77.8%       0.43 =C2=B1135%  perf-profile.cpu-cy=
cles.filemap_map_pages.handle_pte_fault.handle_mm_fault.__do_page_fault.do_=
page_fault
      3.18 =C2=B1 34%     -75.9%       0.77 =C2=B1 85%  perf-profile.cpu-cy=
cles.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
     15.91 =C2=B1 33%     -74.9%       4.00 =C2=B1101%  perf-profile.cpu-cy=
cles.poll_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.rest_init
     56.07 =C2=B1 11%     +37.8%      77.28 =C2=B1 18%  perf-profile.cpu-cy=
cles.poll_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_se=
condary
     17.10 =C2=B1 30%     -66.8%       5.68 =C2=B1 59%  perf-profile.cpu-cy=
cles.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
     17.10 =C2=B1 30%     -66.8%       5.68 =C2=B1 59%  perf-profile.cpu-cy=
cles.start_kernel.x86_64_start_reservations.x86_64_start_kernel
     57.18 =C2=B1 10%     +36.3%      77.94 =C2=B1 18%  perf-profile.cpu-cy=
cles.start_secondary
     17.10 =C2=B1 30%     -66.8%       5.68 =C2=B1 59%  perf-profile.cpu-cy=
cles.x86_64_start_kernel
     17.10 =C2=B1 30%     -66.8%       5.68 =C2=B1 59%  perf-profile.cpu-cy=
cles.x86_64_start_reservations.x86_64_start_kernel
      6.50 =C2=B1 38%     -61.5%       2.50 =C2=B1 72%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
   -197566 =C2=B1-35%     +57.5%    -311256 =C2=B1-11%  sched_debug.cfs_rq[=
4]:/.spread0
    851471 =C2=B1  8%     -10.5%     762192 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    735.50 =C2=B1 44%     +98.3%       1458 =C2=B1 47%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
    796.75 =C2=B1 38%     +91.2%       1523 =C2=B1 46%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
     52.75 =C2=B1 25%     +73.9%      91.75 =C2=B1 29%  sched_debug.cfs_rq[=
9]:/.load
    610312 =C2=B1  9%     -12.3%     535184 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     52.75 =C2=B1 25%     +65.4%      87.25 =C2=B1 29%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
   1373175 =C2=B1101%     -99.2%      10693 =C2=B1 42%  sched_debug.cpu#1.t=
twu_count
     58262 =C2=B1  0%     +11.2%      64777 =C2=B1  6%  sched_debug.cpu#10.=
nr_load_updates
     39758 =C2=B1 47%     -60.2%      15813 =C2=B1 55%  sched_debug.cpu#11.=
nr_switches
     39788 =C2=B1 47%     -60.2%      15839 =C2=B1 55%  sched_debug.cpu#11.=
sched_count
     18721 =C2=B1 51%     -68.6%       5869 =C2=B1 55%  sched_debug.cpu#11.=
sched_goidle
     73.50 =C2=B1 10%     -20.1%      58.75 =C2=B1  7%  sched_debug.cpu#4.c=
pu_load[2]
     68.50 =C2=B1  5%     -16.8%      57.00 =C2=B1  7%  sched_debug.cpu#4.c=
pu_load[3]
     64.50 =C2=B1  6%     -13.6%      55.75 =C2=B1  7%  sched_debug.cpu#4.c=
pu_load[4]
    965204 =C2=B1119%     -99.0%      10127 =C2=B1 80%  sched_debug.cpu#7.n=
r_switches
    965234 =C2=B1119%     -98.9%      10157 =C2=B1 79%  sched_debug.cpu#7.s=
ched_count
    492436 =C2=B1119%     -98.7%       6337 =C2=B1 96%  sched_debug.cpu#7.t=
twu_count
    478601 =C2=B1120%     -99.8%     733.50 =C2=B1 51%  sched_debug.cpu#7.t=
twu_local
     52.75 =C2=B1 25%     +65.4%      87.25 =C2=B1 29%  sched_debug.cpu#9.c=
pu_load[0]
     53.25 =C2=B1 24%     +30.0%      69.25 =C2=B1 17%  sched_debug.cpu#9.c=
pu_load[1]
      1920 =C2=B1  8%     +21.6%       2334 =C2=B1  4%  sched_debug.cpu#9.c=
urr->pid
     52.75 =C2=B1 25%     +73.9%      91.75 =C2=B1 29%  sched_debug.cpu#9.l=
oad
      0.69 =C2=B1 67%    +358.0%       3.14 =C2=B1114%  sched_debug.rt_rq[0=
]:/.rt_time
    155259 =C2=B1  0%     -42.2%      89723 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_features


bay: Pentium D
Memory: 2G

nhm4: Nehalem
Memory: 4G

mtp-ivy1: Ivy Bridge
Memory: 32G

xps2: Nehalem
Memory: 4G

wsm: Westmere
Memory: 6G

lkp-a03: Atom
Memory: 8G


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

--===============7236180255523474012==
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
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogZDY1ZjI3ZDhhZTRk
MjM0NjNiNmQxMmQwYjEzNThkYTlkZDdhNzAxNgptb2RlbDogUGVudGl1bSBECm5yX2NwdTogNApt
ZW1vcnk6IDJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDM3NTA1MjhB
U182VlAyVENaTi1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1T
VDM3NTA1MjhBU185VlA1TFBITi1wYXJ0NSIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9i
eS1pZC9hdGEtU1QzNzUwNTI4QVNfNlZQMlRDWk4tcGFydDIiCm5ldGNvbnNvbGVfcG9ydDogNjY0
NQpjYXRlZ29yeTogYmVuY2htYXJrCnBlcmlvZDogNjAwcwpucl90aHJlYWRzOiAxMDAlCmRpc2s6
IDFIREQKZnM6IGJ0cmZzCnNpemU6IDY0RwpmaWxlaW86CiAgZmlsZW51bTogMTAyNGYKICByd21v
ZGU6IHNlcXdyCiAgaW9tb2RlOiBzeW5jCnF1ZXVlOiBjeWNsaWMKdGVzdGJveDogYmF5CnRib3hf
Z3JvdXA6IGJheQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDctMDMg
MTA6MTE6MzIuMjcyODU0OTMxICswODowMAp1c2VyOiB3ZmcKY29tcGlsZXI6IGdjYy00LjkKaGVh
ZF9jb21taXQ6IGQ2NWYyN2Q4YWU0ZDIzNDYzYjZkMTJkMGIxMzU4ZGE5ZGQ3YTcwMTYKYmFzZV9j
b21taXQ6IGI5NTNjMGQyMzRiYzcyZTg0ODlkM2JmNTFhMjc2YzVjNGVjODUzNDUKYnJhbmNoOiBs
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA3MDQwNQprZXJuZWw6ICIvcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvZDY1ZjI3ZDhhZTRkMjM0NjNiNmQxMmQwYjEzNThkYTlkZDdhNzAx
Ni92bWxpbnV6LTQuMS4wLTA0OTUxLWdkNjVmMjdkIgpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2ZpbGVpby9wZXJmb3JtYW5jZS02MDBz
LTEwMCUtMUhERC1idHJmcy02NEctMTAyNGYtc2Vxd3Itc3luYy9iYXkvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2Q2NWYyN2Q4YWU0ZDIzNDYzYjZkMTJk
MGIxMzU4ZGE5ZGQ3YTcwMTYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9iYXkvY3ljbGlj
X2ZpbGVpby1wZXJmb3JtYW5jZS02MDBzLTEwMCUtMUhERC1idHJmcy02NEctMTAyNGYtc2Vxd3It
c3luYy14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC1kNjVmMjdkOGFlNGQyMzQ2M2I2ZDEyZDBiMTM1
OGRhOWRkN2E3MDE2LTIwMTUwNzAzLTM2ODA5LXh4cjYwNS0wLnlhbWwiCmRlcXVldWVfdGltZTog
MjAxNS0wNy0wNCAxMjoyOTo0Mi4zMTQ2ODIyMzYgKzA4OjAwCm1heF91cHRpbWU6IDE4NTUuMDIw
MDAwMDAwMDAwNAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPXdmZwot
IGpvYj0vbGtwL3NjaGVkdWxlZC9iYXkvY3ljbGljX2ZpbGVpby1wZXJmb3JtYW5jZS02MDBzLTEw
MCUtMUhERC1idHJmcy02NEctMTAyNGYtc2Vxd3Itc3luYy14ODZfNjQtcmhlbC1DWUNMSUNfSEVB
RC1kNjVmMjdkOGFlNGQyMzQ2M2I2ZDEyZDBiMTM1OGRhOWRkN2E3MDE2LTIwMTUwNzAzLTM2ODA5
LXh4cjYwNS0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFu
Y2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNzA0MDUKLSBjb21taXQ9ZDY1ZjI3ZDhh
ZTRkMjM0NjNiNmQxMmQwYjEzNThkYTlkZDdhNzAxNgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45L2Q2NWYyN2Q4YWU0ZDIzNDYzYjZkMTJkMGIxMzU4ZGE5ZGQ3YTcw
MTYvdm1saW51ei00LjEuMC0wNDk1MS1nZDY1ZjI3ZAotIG1heF91cHRpbWU9MTg1NQotIFJFU1VM
VF9ST09UPS9yZXN1bHQvZmlsZWlvL3BlcmZvcm1hbmNlLTYwMHMtMTAwJS0xSERELWJ0cmZzLTY0
Ry0xMDI0Zi1zZXF3ci1zeW5jL2JheS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvZDY1ZjI3ZDhhZTRkMjM0NjNiNmQxMmQwYjEzNThkYTlkZDdhNzAxNi8w
Ci0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0
ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVk
IHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3Vw
X3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJv
bXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9y
bWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL3dmZy9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZDY1ZjI3ZDhhZTRkMjM0NjNi
NmQxMmQwYjEzNThkYTlkZDdhNzAxNi9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1h
cmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZmls
ZWlvLmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA2LjI5IDQuOTEgMi42NCAxLzE0
NyA4NDQxCnN0YXJ0X3RpbWU6ICcxNDM1OTg0MjIxJwplbmRfdGltZTogJzE0MzU5ODQ4MjEnCnZl
cnNpb246ICIvbGtwL3dmZy8uc3JjLTIwMTUwNzAxLTEzNTg1NyIK

--===============7236180255523474012==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCm1rZnMgLXQgYnRyZnMgL2Rldi9zZGExCm1vdW50IC10IGJ0cmZzIC9kZXYvc2RhMSAv
ZnMvc2RhMQpjZCAvZnMvc2RhMQpzeXNiZW5jaCAtLXRlc3Q9ZmlsZWlvIC0tbWF4LXJlcXVlc3Rz
PTAgLS1udW0tdGhyZWFkcz00IC0tbWF4LXRpbWU9NjAwIC0tZmlsZS10ZXN0LW1vZGU9c2Vxd3Ig
LS1maWxlLXRvdGFsLXNpemU9Njg3MTk0NzY3MzYgLS1maWxlLWlvLW1vZGU9c3luYyAtLWZpbGUt
bnVtPTEwMjQgcnVuCg==

--===============7236180255523474012==--

