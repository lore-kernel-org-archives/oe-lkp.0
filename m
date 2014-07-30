Content-Type: multipart/mixed; boundary="===============7582747880583892754=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 49df457a977: +58.8% hackbench.throughput
Date: Wed, 30 Jul 2014 10:48:25 +0800
Message-ID: <53D85CF9.5040908@intel.com>
In-Reply-To: <53d8586e.nIBwr0ClTNEmc22H%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7582747880583892754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v4.6-on-3.16-rc5
commit 49df457a977e6c0e3f43fb9269a058c724282d60 ("sched: Rewrite per entity=
 runnable load average tracking")

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    152082 ~ 2%     +58.8%     241578 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    152082 ~ 2%     +58.8%     241578 ~ 0%  TOTAL hackbench.throughput

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.95 ~12%     -84.0%       0.15 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.95 ~12%     -84.0%       0.15 ~ 8%  TOTAL perf-profile.cpu-cycles._=
_schedule.schedule_user.sysret_careful.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     11294 ~11%    +531.6%      71342 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     11294 ~11%    +531.6%      71342 ~ 2%  TOTAL numa-vmstat.node1.numa_ot=
her

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     63216 ~ 2%     -95.3%       2992 ~47%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     63216 ~ 2%     -95.3%       2992 ~47%  TOTAL numa-vmstat.node0.numa_ot=
her

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 2.159e+08 ~ 3%    +368.3%  1.011e+09 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 2.159e+08 ~ 3%    +368.3%  1.011e+09 ~ 1%  TOTAL cpuidle.C1-SNB.time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.64 ~33%     -76.5%       0.15 ~17%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.64 ~33%     -76.5%       0.15 ~17%  TOTAL perf-profile.cpu-cycles.e=
ffective_load.isra.39.select_task_rq_fair.try_to_wake_up.default_wake_funct=
ion.autoremove_wake_function

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.11 ~45%     -80.9%       0.40 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.11 ~45%     -80.9%       0.40 ~ 8%  TOTAL perf-profile.cpu-cycles.i=
dle_cpu.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremove=
_wake_function

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      3.15 ~ 5%     -70.3%       0.93 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3.15 ~ 5%     -70.3%       0.93 ~10%  TOTAL turbostat.%c7

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  21214660 ~ 2%     -68.2%    6742903 ~15%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  21214660 ~ 2%     -68.2%    6742903 ~15%  TOTAL cpuidle.C1-SNB.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     37122 ~35%    +273.9%     138803 ~24%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     37122 ~35%    +273.9%     138803 ~24%  TOTAL numa-meminfo.node0.Kernel=
Stack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.15 ~ 9%     -62.8%       0.43 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.15 ~ 9%     -62.8%       0.43 ~ 7%  TOTAL perf-profile.cpu-cycles._=
_switch_to.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  10403035 ~ 6%    +187.4%   29899077 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  10403035 ~ 6%    +187.4%   29899077 ~ 2%  TOTAL proc-vmstat.pgalloc_dma32

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      4040 ~14%     -67.3%       1322 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      4040 ~14%     -67.3%       1322 ~ 9%  TOTAL cpuidle.C3-SNB.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  53049243 ~ 6%    +186.7%  1.521e+08 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  53049243 ~ 6%    +186.7%  1.521e+08 ~ 2%  TOTAL numa-numastat.node0.numa_=
hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  53048396 ~ 6%    +186.7%  1.521e+08 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  53048396 ~ 6%    +186.7%  1.521e+08 ~ 2%  TOTAL numa-numastat.node0.local=
_node

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.08 ~16%     -65.1%       0.38 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.08 ~16%     -65.1%       0.38 ~ 8%  TOTAL perf-profile.cpu-cycles.s=
elect_task_rq_fair.try_to_wake_up.default_wake_function.autoremove_wake_fun=
ction.__wake_up_common

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2338 ~35%    +273.0%       8720 ~23%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2338 ~35%    +273.0%       8720 ~23%  TOTAL numa-vmstat.node0.nr_kern=
el_stack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       238 ~11%    +161.3%        623 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       238 ~11%    +161.3%        623 ~ 5%  TOTAL slabinfo.nfs_read_data.nu=
m_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       238 ~11%    +161.3%        623 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       238 ~11%    +161.3%        623 ~ 5%  TOTAL slabinfo.nfs_read_data.ac=
tive_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.40 ~24%     -65.2%       0.83 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.40 ~24%     -65.2%       0.83 ~ 9%  TOTAL perf-profile.cpu-cycles._=
_schedule.schedule.pipe_wait.pipe_read.new_sync_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     76814 ~25%    +207.8%     236402 ~22%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     76814 ~25%    +207.8%     236402 ~22%  TOTAL numa-meminfo.node0.SUnrec=
laim

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     19322 ~24%    +206.9%      59299 ~21%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     19322 ~24%    +206.9%      59299 ~21%  TOTAL numa-vmstat.node0.nr_slab=
_unreclaimable

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  30368489 ~11%    +150.4%   76051795 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  30368489 ~11%    +150.4%   76051795 ~ 2%  TOTAL numa-vmstat.node0.numa_lo=
cal

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  30431707 ~10%    +149.9%   76054788 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  30431707 ~10%    +149.9%   76054788 ~ 2%  TOTAL numa-vmstat.node0.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    101782 ~18%    +157.1%     261679 ~20%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    101782 ~18%    +157.1%     261679 ~20%  TOTAL numa-meminfo.node0.Slab

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  76785252 ~10%    +140.7%  1.848e+08 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  76785252 ~10%    +140.7%  1.848e+08 ~ 5%  TOTAL cpuidle.C1E-SNB.time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.80 ~45%     -69.7%       0.24 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.80 ~45%     -69.7%       0.24 ~ 4%  TOTAL perf-profile.cpu-cycles.t=
ry_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_comm=
on.__wake_up_sync_key

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 8.468e+08 ~ 5%     -53.0%  3.981e+08 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 8.468e+08 ~ 5%     -53.0%  3.981e+08 ~ 3%  TOTAL cpuidle.C7-SNB.time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       336 ~ 7%    +106.1%        693 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       336 ~ 7%    +106.1%        693 ~ 3%  TOTAL slabinfo.mnt_cache.active=
_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       336 ~ 7%    +106.1%        693 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       336 ~ 7%    +106.1%        693 ~ 3%  TOTAL slabinfo.mnt_cache.num_ob=
js

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.63 ~ 3%    +177.2%       7.29 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.17 ~ 2%     +19.3%       0.20 ~ 8%  xps2/pigz/100%-128K
      2.79 ~ 3%    +167.9%       7.48 ~ 0%  TOTAL turbostat.%c1

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.29 ~28%     -51.9%       0.62 ~23%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.29 ~28%     -51.9%       0.62 ~23%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_function=
.__wake_up_common

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    274323 ~ 3%     -51.4%     133375 ~21%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    274323 ~ 3%     -51.4%     133375 ~21%  TOTAL numa-meminfo.node1.Kernel=
Stack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     17139 ~ 3%     -51.5%       8312 ~20%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     17139 ~ 3%     -51.5%       8312 ~20%  TOTAL numa-vmstat.node1.nr_kern=
el_stack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 1.578e+08 ~ 3%     +94.6%  3.071e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.578e+08 ~ 3%     +94.6%  3.071e+08 ~ 1%  TOTAL proc-vmstat.numa_local

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 1.578e+08 ~ 3%     +94.6%  3.071e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.578e+08 ~ 3%     +94.6%  3.071e+08 ~ 1%  TOTAL proc-vmstat.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 1.612e+08 ~ 3%     +93.7%  3.123e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.612e+08 ~ 3%     +93.7%  3.123e+08 ~ 1%  TOTAL proc-vmstat.pgfree

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 1.509e+08 ~ 3%     +87.2%  2.824e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.509e+08 ~ 3%     +87.2%  2.824e+08 ~ 1%  TOTAL proc-vmstat.pgalloc_normal

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    444139 ~ 4%     -47.5%     233233 ~19%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    444139 ~ 4%     -47.5%     233233 ~19%  TOTAL numa-meminfo.node1.SUnrec=
laim

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    110967 ~ 3%     -47.9%      57811 ~19%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    110967 ~ 3%     -47.9%      57811 ~19%  TOTAL numa-vmstat.node1.nr_slab=
_unreclaimable

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    477043 ~ 3%     -44.8%     263564 ~17%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    477043 ~ 3%     -44.8%     263564 ~17%  TOTAL numa-meminfo.node1.Slab

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

        66 ~ 8%     -41.0%         39 ~22%  xps2/pigz/100%-128K
        66 ~ 8%     -41.0%         39 ~22%  TOTAL cpuidle.C1-NHM.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    101194 ~ 2%     -42.7%      58014 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    101194 ~ 2%     -42.7%      58014 ~16%  TOTAL numa-vmstat.node1.nr_page=
_table_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    322081 ~ 4%     -63.1%     118798 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     18041 ~ 1%     -15.6%      15233 ~ 3%  xps2/pigz/100%-128K
     17691 ~ 1%     -12.6%      15460 ~ 1%  xps2/pigz/100%-512K
    357814 ~ 3%     -58.2%     149492 ~ 1%  TOTAL softirqs.SCHED

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    405352 ~ 2%     -41.2%     238526 ~15%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    405352 ~ 2%     -41.2%     238526 ~15%  TOTAL numa-meminfo.node1.PageTa=
bles

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.31 ~15%     +51.8%       1.98 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.31 ~15%     +51.8%       1.98 ~14%  TOTAL perf-profile.cpu-cycles.v=
fs_write.sys_write.system_call_fastpath.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       662 ~ 7%     +63.0%       1080 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       662 ~ 7%     +63.0%       1080 ~ 3%  TOTAL slabinfo.RAW.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       662 ~ 7%     +63.0%       1080 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       662 ~ 7%     +63.0%       1080 ~ 3%  TOTAL slabinfo.RAW.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.74 ~15%     +53.3%       1.13 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.74 ~15%     +53.3%       1.13 ~10%  TOTAL perf-profile.cpu-cycles.s=
ystem_call_after_swapgs.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.08 ~11%     +38.0%       1.49 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.08 ~11%     +38.0%       1.49 ~14%  TOTAL perf-profile.cpu-cycles.s=
elinux_file_permission.security_file_permission.rw_verify_area.vfs_read.sys=
_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.82 ~13%     +44.7%       1.18 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.82 ~13%     +44.7%       1.18 ~10%  TOTAL perf-profile.cpu-cycles.f=
ile_update_time.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

   2336851 ~ 2%     -36.7%    1479825 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   2336851 ~ 2%     -36.7%    1479825 ~12%  TOTAL numa-meminfo.node1.MemUsed

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.02 ~16%     +49.0%       1.52 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.02 ~16%     +49.0%       1.52 ~ 1%  TOTAL perf-profile.cpu-cycles.n=
ew_sync_read.vfs_read.sys_read.system_call_fastpath.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.63 ~15%     +54.1%       0.97 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.63 ~15%     +54.1%       0.97 ~ 5%  TOTAL perf-profile.cpu-cycles.m=
utex_lock.pipe_read.new_sync_read.vfs_read.sys_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.07 ~18%     +56.4%       1.68 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.07 ~18%     +56.4%       1.68 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_sb_end_write.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.81 ~18%     +57.4%       1.27 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.81 ~18%     +57.4%       1.27 ~ 3%  TOTAL perf-profile.cpu-cycles.s=
ystem_call.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.96 ~16%     +58.9%       1.52 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.96 ~16%     +58.9%       1.52 ~ 1%  TOTAL perf-profile.cpu-cycles.n=
ew_sync_write.vfs_write.sys_write.system_call_fastpath.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.21 ~18%     +56.9%       1.90 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.21 ~18%     +56.9%       1.90 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_srcu_read_unlock.fsnotify.vfs_write.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.46 ~18%     +56.0%       2.27 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.46 ~18%     +56.0%       2.27 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.13 ~13%     +46.6%       1.66 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.13 ~13%     +46.6%       1.66 ~12%  TOTAL perf-profile.cpu-cycles.s=
elinux_file_permission.security_file_permission.rw_verify_area.vfs_write.sy=
s_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    338506 ~19%     +43.3%     484919 ~ 9%  xps2/pigz/100%-128K
    357641 ~20%     +40.6%     502909 ~19%  xps2/pigz/100%-512K
    696147 ~20%     +41.9%     987828 ~14%  TOTAL cpuidle.C3-NHM.time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

   2599901 ~ 2%     -33.4%    1730340 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    105504 ~ 2%     -39.7%      63575 ~10%  xps2/pigz/100%-128K
    104124 ~ 2%     -26.0%      77061 ~ 7%  xps2/pigz/100%-512K
   2809530 ~ 2%     -33.4%    1870976 ~ 2%  TOTAL softirqs.RCU

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    105594 ~ 1%     -33.1%      70680 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    105594 ~ 1%     -33.1%      70680 ~12%  TOTAL numa-vmstat.node1.nr_anon=
_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    105548 ~ 1%     -33.0%      70702 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    105548 ~ 1%     -33.0%      70702 ~12%  TOTAL numa-vmstat.node1.nr_acti=
ve_anon

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.80 ~19%     +56.1%       1.25 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.80 ~19%     +56.1%       1.25 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
ystem_call.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.14 ~14%     +51.8%       1.73 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.14 ~14%     +51.8%       1.73 ~ 6%  TOTAL perf-profile.cpu-cycles.f=
snotify.vfs_write.sys_write.system_call_fastpath.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      3.37 ~ 9%     +45.1%       4.89 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3.37 ~ 9%     +45.1%       4.89 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 1.048e+08 ~ 3%     +48.0%   1.55e+08 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.048e+08 ~ 3%     +48.0%   1.55e+08 ~ 2%  TOTAL numa-numastat.node1.local=
_node

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 1.048e+08 ~ 3%     +48.0%   1.55e+08 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.048e+08 ~ 3%     +48.0%   1.55e+08 ~ 2%  TOTAL numa-numastat.node1.numa_=
hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.78 ~15%     +45.5%       1.14 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.78 ~15%     +45.5%       1.14 ~ 8%  TOTAL perf-profile.cpu-cycles.s=
ystem_call_after_swapgs.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    422963 ~ 1%     -31.4%     290240 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    422963 ~ 1%     -31.4%     290240 ~12%  TOTAL numa-meminfo.node1.AnonPa=
ges

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.48 ~16%     +51.5%       2.24 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.48 ~16%     +51.5%       2.24 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_page_from_iter_iovec.copy_page_from_iter.pipe_write.new_sync_write.vfs_=
write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    422767 ~ 1%     -31.3%     290312 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    422767 ~ 1%     -31.3%     290312 ~12%  TOTAL numa-meminfo.node1.Active=
(anon)

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  19200235 ~ 1%     +43.6%   27577988 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  19200235 ~ 1%     +43.6%   27577988 ~ 0%  TOTAL proc-vmstat.pgfault

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.96 ~13%     +40.5%       1.35 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.96 ~13%     +40.5%       1.35 ~11%  TOTAL perf-profile.cpu-cycles._=
_fget_light.sys_read.system_call_fastpath.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.11 ~16%     +38.0%       2.91 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.11 ~16%     +38.0%       2.91 ~ 7%  TOTAL perf-profile.cpu-cycles.p=
ipe_write.new_sync_write.vfs_write.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  52816202 ~ 8%     +46.8%   77554512 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  52816202 ~ 8%     +46.8%   77554512 ~ 1%  TOTAL numa-vmstat.node1.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  52804907 ~ 8%     +46.7%   77483170 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  52804907 ~ 8%     +46.7%   77483170 ~ 1%  TOTAL numa-vmstat.node1.numa_lo=
cal

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1225 ~ 4%     +41.2%       1729 ~11%  xps2/pigz/100%-128K
      1225 ~ 4%     +41.2%       1729 ~11%  TOTAL cpuidle.C6-NHM.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.77 ~17%     +44.2%       1.11 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.77 ~17%     +44.2%       1.11 ~ 4%  TOTAL perf-profile.cpu-cycles.m=
utex_unlock.new_sync_read.vfs_read.sys_read.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.50 ~16%     +53.0%       3.83 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      4.75 ~ 6%     +14.9%       5.46 ~ 8%  xps2/pigz/100%-128K
      7.25 ~ 9%     +28.1%       9.29 ~ 5%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_write.vfs_w=
rite

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       525 ~ 8%     +36.3%        715 ~ 4%  xps2/pigz/100%-128K
       525 ~ 8%     +36.3%        715 ~ 4%  TOTAL cpuidle.C3-NHM.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     42939 ~ 6%     +43.8%      61753 ~18%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     42939 ~ 6%     +43.8%      61753 ~18%  TOTAL numa-vmstat.node0.nr_page=
_table_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

   1065264 ~ 5%     +44.6%    1539953 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   1065264 ~ 5%     +44.6%    1539953 ~14%  TOTAL numa-meminfo.node0.MemUsed

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1326 ~ 2%     +30.8%       1734 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1326 ~ 2%     +30.8%       1734 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1326 ~ 2%     +30.8%       1734 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1326 ~ 2%     +30.8%       1734 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.40 ~18%     +52.1%       2.13 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.40 ~18%     +52.1%       2.13 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_sb_start_write.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    171696 ~ 6%     +43.4%     246188 ~19%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    171696 ~ 6%     +43.4%     246188 ~19%  TOTAL numa-meminfo.node0.PageTa=
bles

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.18 ~14%     +32.0%       1.56 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.18 ~14%     +32.0%       1.56 ~10%  TOTAL perf-profile.cpu-cycles._=
_fget_light.sys_write.system_call_fastpath.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.07 ~20%     +46.4%       3.03 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.07 ~20%     +46.4%       3.03 ~10%  TOTAL perf-profile.cpu-cycles.a=
vc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.security_f=
ile_permission

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.94 ~ 7%     +28.0%       1.21 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.94 ~ 7%     +28.0%       1.21 ~ 3%  TOTAL perf-profile.cpu-cycles.t=
ouch_atime.pipe_read.new_sync_read.vfs_read.sys_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     49554 ~ 4%     +34.5%      66654 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     49554 ~ 4%     +34.5%      66654 ~ 4%  TOTAL cpuidle.C7-SNB.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    468246 ~ 3%     -26.0%     346293 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    468246 ~ 3%     -26.0%     346293 ~ 9%  TOTAL numa-meminfo.node1.Active

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.05 ~ 9%     +30.3%       2.67 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.05 ~ 9%     +30.3%       2.67 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_page_to_iter_iovec.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.02 ~14%     +33.6%       1.36 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.02 ~14%     +33.6%       1.36 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    257147 ~ 0%     -11.0%     228841 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3472 ~ 6%     +34.7%       4676 ~ 8%  xps2/pigz/100%-128K
      3552 ~11%     +25.2%       4446 ~ 6%  xps2/pigz/100%-512K
    264172 ~ 0%      -9.9%     237963 ~ 1%  TOTAL slabinfo.anon_vma.active_=
objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    271487 ~ 0%     -10.2%     243787 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3472 ~ 6%     +34.7%       4676 ~ 8%  xps2/pigz/100%-128K
      3552 ~11%     +25.2%       4446 ~ 6%  xps2/pigz/100%-512K
    278512 ~ 0%      -9.2%     252909 ~ 1%  TOTAL slabinfo.anon_vma.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    220620 ~ 5%     +28.6%     283650 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    220620 ~ 5%     +28.6%     283650 ~ 6%  TOTAL cpuidle.C1E-SNB.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2.19 ~16%     +38.2%       3.02 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.19 ~16%     +38.2%       3.02 ~ 3%  TOTAL perf-profile.cpu-cycles.m=
utex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.23 ~12%     +30.8%       1.61 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.23 ~12%     +30.8%       1.61 ~ 3%  TOTAL perf-profile.cpu-cycles.v=
fs_read.sys_read.system_call_fastpath.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.33 ~ 6%     +18.0%       1.57 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.33 ~ 6%     +18.0%       1.57 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     10259 ~ 9%     -18.1%       8402 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1672 ~ 3%      -8.4%       1531 ~ 4%  xps2/pigz/100%-512K
     11931 ~ 8%     -16.7%       9933 ~ 7%  TOTAL slabinfo.proc_inode_cache=
.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2094 ~ 7%     +14.3%       2393 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2094 ~ 7%     +14.3%       2393 ~ 1%  TOTAL uptime.idle

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      6780 ~ 0%     +18.0%       7997 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      6780 ~ 0%     +18.0%       7997 ~ 0%  TOTAL vmstat.procs.r

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.13 ~ 5%     +16.0%       1.32 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.13 ~ 5%     +16.0%       1.32 ~ 2%  TOTAL perf-profile.cpu-cycles.m=
utex_lock.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      0.17 ~ 5%     +15.3%       0.20 ~ 2%  xps2/pigz/100%-128K
      0.17 ~ 5%     +15.3%       0.20 ~ 2%  TOTAL turbostat.%pc6

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

   5797050 ~ 2%     +17.3%    6801865 ~ 5%  xps2/pigz/100%-128K
   5797050 ~ 2%     +17.3%    6801865 ~ 5%  TOTAL cpuidle.C6-NHM.time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1.77 ~ 4%     +22.1%       2.16 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.77 ~ 4%     +22.1%       2.16 ~ 5%  TOTAL perf-profile.cpu-cycles.p=
ipe_read.new_sync_read.vfs_read.sys_read.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  10101941 ~ 0%     -14.4%    8650440 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  10101941 ~ 0%     -14.4%    8650440 ~ 2%  TOTAL meminfo.Committed_AS

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    176173 ~ 0%     -13.4%     152605 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    176173 ~ 0%     -13.4%     152605 ~ 2%  TOTAL proc-vmstat.nr_anon_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    176133 ~ 0%     -13.3%     152665 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    176133 ~ 0%     -13.3%     152665 ~ 2%  TOTAL proc-vmstat.nr_active_anon

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     69007 ~ 6%      -8.3%      63255 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     69007 ~ 6%      -8.3%      63255 ~ 5%  TOTAL numa-vmstat.node0.nr_file=
_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    275989 ~ 5%      -8.3%     253185 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    275989 ~ 5%      -8.3%     253185 ~ 5%  TOTAL numa-meminfo.node0.FilePa=
ges

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    144484 ~ 0%     -14.3%     123860 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    144484 ~ 0%     -14.3%     123860 ~ 1%  TOTAL proc-vmstat.nr_page_table=
_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1824 ~ 6%     +13.2%       2064 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1824 ~ 6%     +13.2%       2064 ~ 1%  TOTAL slabinfo.shmem_inode_cach=
e.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1824 ~ 6%     +13.2%       2064 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1824 ~ 6%     +13.2%       2064 ~ 1%  TOTAL slabinfo.shmem_inode_cach=
e.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    705846 ~ 0%     -13.0%     613934 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    705846 ~ 0%     -13.0%     613934 ~ 2%  TOTAL meminfo.AnonPages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    705673 ~ 0%     -13.0%     614218 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    705673 ~ 0%     -13.0%     614218 ~ 2%  TOTAL meminfo.Active(anon)

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2746 ~ 3%     +12.5%       3091 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2746 ~ 3%     +12.5%       3091 ~ 3%  TOTAL slabinfo.kmalloc-96.activ=
e_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    579273 ~ 0%     -14.0%     498028 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    579273 ~ 0%     -14.0%     498028 ~ 2%  TOTAL meminfo.PageTables

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      2788 ~ 3%     +12.3%       3133 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2788 ~ 3%     +12.3%       3133 ~ 3%  TOTAL slabinfo.kmalloc-96.num_o=
bjs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    819171 ~ 0%     -12.2%     719483 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    819171 ~ 0%     -12.2%     719483 ~ 2%  TOTAL meminfo.Active

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    404148 ~ 0%     -11.8%     356411 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3274 ~ 1%      -8.5%       2996 ~ 5%  xps2/pigz/100%-128K
      3366 ~ 4%     -12.4%       2947 ~ 4%  xps2/pigz/100%-512K
    410789 ~ 0%     -11.8%     362355 ~ 1%  TOTAL slabinfo.vm_area_struct.a=
ctive_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    420842 ~ 0%     -11.2%     373711 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3312 ~ 2%      -8.3%       3038 ~ 6%  xps2/pigz/100%-128K
      3408 ~ 3%     -12.4%       2984 ~ 3%  xps2/pigz/100%-512K
    427563 ~ 0%     -11.2%     379734 ~ 1%  TOTAL slabinfo.vm_area_struct.n=
um_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    533974 ~ 0%     -11.5%     472605 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    533974 ~ 0%     -11.5%     472605 ~ 1%  TOTAL slabinfo.kmalloc-64.activ=
e_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1421 ~ 0%     -10.8%       1267 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1421 ~ 0%     -10.8%       1267 ~ 1%  TOTAL slabinfo.sighand_cache.ac=
tive_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1421 ~ 0%     -10.8%       1267 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1421 ~ 0%     -10.8%       1267 ~ 1%  TOTAL slabinfo.sighand_cache.nu=
m_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     21323 ~ 0%     -10.8%      19020 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     21323 ~ 0%     -10.8%      19020 ~ 1%  TOTAL slabinfo.sighand_cache.nu=
m_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1114 ~ 0%     -11.0%        991 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1114 ~ 0%     -11.0%        991 ~ 1%  TOTAL slabinfo.mm_struct.num_sl=
abs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1114 ~ 0%     -11.0%        991 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1114 ~ 0%     -11.0%        991 ~ 1%  TOTAL slabinfo.mm_struct.active=
_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     18957 ~ 0%     -11.1%      16861 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     18957 ~ 0%     -11.1%      16861 ~ 1%  TOTAL slabinfo.mm_struct.num_ob=
js

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     19974 ~ 0%     -10.8%      17814 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     19974 ~ 0%     -10.8%      17814 ~ 1%  TOTAL slabinfo.task_struct.num_=
objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      4993 ~ 0%     -10.8%       4453 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      4993 ~ 0%     -10.8%       4453 ~ 1%  TOTAL slabinfo.task_struct.num_=
slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      4993 ~ 0%     -10.8%       4453 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      4993 ~ 0%     -10.8%       4453 ~ 1%  TOTAL slabinfo.task_struct.acti=
ve_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      9564 ~ 0%     -11.2%       8492 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9564 ~ 0%     -11.2%       8492 ~ 1%  TOTAL slabinfo.vm_area_struct.n=
um_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      9564 ~ 0%     -11.2%       8492 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9564 ~ 0%     -11.2%       8492 ~ 1%  TOTAL slabinfo.vm_area_struct.a=
ctive_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     20909 ~ 0%     -10.1%      18793 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     20909 ~ 0%     -10.1%      18793 ~ 1%  TOTAL slabinfo.sighand_cache.ac=
tive_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     19775 ~ 1%     -10.5%      17695 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     19775 ~ 1%     -10.5%      17695 ~ 1%  TOTAL slabinfo.task_struct.acti=
ve_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    559228 ~ 0%     -10.9%     498132 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    559228 ~ 0%     -10.9%     498132 ~ 1%  TOTAL slabinfo.kmalloc-64.num_o=
bjs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      8737 ~ 0%     -10.9%       7782 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      8737 ~ 0%     -10.9%       7782 ~ 1%  TOTAL slabinfo.kmalloc-64.num_s=
labs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      8737 ~ 0%     -10.9%       7782 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      8737 ~ 0%     -10.9%       7782 ~ 1%  TOTAL slabinfo.kmalloc-64.activ=
e_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     19540 ~ 1%     -10.3%      17524 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     19540 ~ 1%     -10.3%      17524 ~ 1%  TOTAL proc-vmstat.nr_kernel_sta=
ck

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1653 ~ 2%      -7.9%       1522 ~ 3%  xps2/pigz/100%-512K
      1653 ~ 2%      -7.9%       1522 ~ 3%  TOTAL slabinfo.proc_inode_cache=
.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     15845 ~ 0%      -9.8%      14296 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     15845 ~ 0%      -9.8%      14296 ~ 0%  TOTAL slabinfo.kmalloc-1024.act=
ive_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      5322 ~ 0%     -10.2%       4779 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      5322 ~ 0%     -10.2%       4779 ~ 1%  TOTAL slabinfo.anon_vma.num_sla=
bs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      5322 ~ 0%     -10.2%       4779 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      5322 ~ 0%     -10.2%       4779 ~ 1%  TOTAL slabinfo.anon_vma.active_=
slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    312131 ~ 1%     -10.4%     279585 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    312131 ~ 1%     -10.4%     279585 ~ 2%  TOTAL meminfo.KernelStack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

    758083 ~ 4%     -80.0%     151644 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9915 ~ 0%     -10.4%       8882 ~ 0%  xps2/pigz/100%-128K
      9033 ~ 1%      -3.5%       8715 ~ 0%  xps2/pigz/100%-512K
    777032 ~ 4%     -78.2%     169242 ~13%  TOTAL vmstat.system.in

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 1.235e+09 ~ 2%     -50.2%  6.146e+08 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    665615 ~ 2%    +124.4%    1493408 ~ 0%  xps2/pigz/100%-128K
    225299 ~ 2%     +75.0%     394317 ~ 0%  xps2/pigz/100%-512K
 1.236e+09 ~ 2%     -50.1%  6.164e+08 ~ 3%  TOTAL time.involuntary_context_=
switches

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

   5797529 ~ 0%     -49.9%    2906036 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      5804 ~ 0%     +86.7%      10834 ~ 0%  xps2/pigz/100%-128K
      1983 ~ 1%     +61.4%       3202 ~ 0%  xps2/pigz/100%-512K
   5805316 ~ 0%     -49.7%    2920073 ~ 2%  TOTAL vmstat.system.cs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

 2.303e+09 ~ 1%     -50.5%   1.14e+09 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    971741 ~ 0%     +70.1%    1652539 ~ 0%  xps2/pigz/100%-128K
    257403 ~ 0%     +67.9%     432153 ~ 0%  xps2/pigz/100%-512K
 2.304e+09 ~ 1%     -50.4%  1.142e+09 ~ 3%  TOTAL time.voluntary_context_sw=
itches

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

  17874373 ~ 1%     +51.0%   26995527 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  17874373 ~ 1%     +51.0%   26995527 ~ 0%  TOTAL time.minor_page_faults

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      1579 ~ 1%     -11.8%       1392 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1579 ~ 1%     -11.8%       1392 ~ 0%  TOTAL time.user_time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     16907 ~ 1%      -3.1%      16387 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     16907 ~ 1%      -3.1%      16387 ~ 0%  TOTAL time.system_time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

     94.22 ~ 0%      -2.6%      91.78 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     94.22 ~ 0%      -2.6%      91.78 ~ 0%  TOTAL turbostat.%c0

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

      3004 ~ 0%      -2.3%       2934 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3004 ~ 0%      -2.3%       2934 ~ 0%  TOTAL time.percent_of_cpu_this_=
job_got

55ea71268e23ea3  49df457a977e6c0e3f43fb926  =

---------------  -------------------------  =

       164 ~ 0%      +1.0%        166 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       164 ~ 0%      +1.0%        166 ~ 0%  TOTAL turbostat.Cor_W


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                           time.voluntary_context_switches

  460000 ++----------------------------------------------------------------=
-+
  440000 O+   O    O   O    O                                              =
 |
         |                       O    O    O   O    O                      =
 |
  420000 ++                                                                =
 |
  400000 ++                                                                =
 |
  380000 ++                                                                =
 |
  360000 ++                                                                =
 |
         |                                                                 =
 |
  340000 ++                                                                =
 |
  320000 ++                                                                =
 |
  300000 ++                                                                =
 |
  280000 ++                                                                =
 |
         |                                                                 =
 |
  260000 *+...*....*...*....*....*....*....*...*....*....*....*...*....*...=
.*
  240000 ++----------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  450000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
         O    O    O   O    O                                              =
 |
  400000 ++                      O    O    O   O    O                      =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  350000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                     ..*....*....  ..*....   ..*....*...        .=
.*
         *....*....*...*....*..            *.       *..           *....*.. =
 |
  200000 ++----------------------------------------------------------------=
-+


                                 vmstat.system.cs

  3400 ++------------------------------------------------------------------=
-+
       O    O    O    O    O                                               =
 |
  3200 ++                       O    O    O   O    O                       =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2800 ++                                                                  =
 |
       |                                                                   =
 |
  2600 ++                                                                  =
 |
       |                                                                   =
 |
  2400 ++                                                                  =
 |
  2200 ++                                                                  =
 |
       |                                                                   =
 |
  2000 *+...                  ..*....*....*...*....*....*....*....        .=
.*
       |    *....*....*....*..                                    *....*.. =
 |
  1800 ++------------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Aaron

--===============7582747880583892754==
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
bGluZ19nb3Zlcm5vcgoK

--===============7582747880583892754==--

