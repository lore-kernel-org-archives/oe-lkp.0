Content-Type: multipart/mixed; boundary="===============6623582538503665468=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [locking/mutexes] cb4bbc457b: -40.0% unixbench.score
Date: Fri, 22 Jan 2016 10:27:55 +0800
Message-ID: <874me6jql0.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6623582538503665468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Ding-Tianhong/locking-mutexes-don-t-spin-o=
n-owner-when-wait-list-is-not-NULL/20160121-173317
commit cb4bbc457bfed6194ffab1b10c7be73b3f16ca2d ("locking/mutexes: don't sp=
in on owner when wait list is not NULL.")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/lkp-ivb=
-d01/fstime/unixbench

commit: =

  f249f40fd783437189a2ac2aea88fe4f1dd2ab37
  cb4bbc457bfed6194ffab1b10c7be73b3f16ca2d

f249f40fd7834371 cb4bbc457bfed6194ffab1b10c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      6088 =C2=B1  0%     -40.0%       3653 =C2=B1  1%  unixbench.score
      9363 =C2=B1 10%     -59.7%       3773 =C2=B1 75%  unixbench.time.invo=
luntary_context_switches
    558.75 =C2=B1  0%     -67.6%     181.25 =C2=B1  1%  unixbench.time.perc=
ent_of_cpu_this_job_got
    795.37 =C2=B1  0%     -68.5%     250.73 =C2=B1  1%  unixbench.time.syst=
em_time
    440962 =C2=B1  8%   +9552.3%   42563214 =C2=B1  2%  unixbench.time.volu=
ntary_context_switches
    505.14 =C2=B1  1%    +117.3%       1097 =C2=B1  0%  uptime.idle
     21682 =C2=B1  5%     +53.0%      33173 =C2=B1  4%  softirqs.RCU
     19435 =C2=B1  5%    +350.6%      87578 =C2=B1  1%  softirqs.SCHED
    420271 =C2=B1  0%     -70.0%     125973 =C2=B1  1%  softirqs.TIMER
      3.75 =C2=B1 11%     -73.3%       1.00 =C2=B1  0%  vmstat.procs.r
      7011 =C2=B1  8%   +8194.5%     581586 =C2=B1  1%  vmstat.system.cs
      5674 =C2=B1  0%     +24.1%       7044 =C2=B1  8%  vmstat.system.in
     18847 =C2=B1137%     -82.2%       3349 =C2=B1147%  latency_stats.avg.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
     20617 =C2=B1  8%  +50440.7%   10420359 =C2=B1  6%  latency_stats.hits.=
generic_file_write_iter.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fa=
stpath
    420571 =C2=B1140%     -84.9%      63576 =C2=B1164%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
   4406135 =C2=B1  4%  +11665.3%  5.184e+08 =C2=B1  0%  latency_stats.sum.g=
eneric_file_write_iter.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fas=
tpath
    430234 =C2=B1138%     -82.8%      73849 =C2=B1146%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
      9363 =C2=B1 10%     -59.7%       3773 =C2=B1 75%  time.involuntary_co=
ntext_switches
    558.75 =C2=B1  0%     -67.6%     181.25 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
    795.37 =C2=B1  0%     -68.5%     250.73 =C2=B1  1%  time.system_time
     12.81 =C2=B1  1%     -13.8%      11.04 =C2=B1  2%  time.user_time
    440962 =C2=B1  8%   +9552.3%   42563214 =C2=B1  2%  time.voluntary_cont=
ext_switches
     69.85 =C2=B1  0%     -65.3%      24.25 =C2=B1  1%  turbostat.%Busy
      2578 =C2=B1  0%     -65.3%     896.00 =C2=B1  1%  turbostat.Avg_MHz
      1.08 =C2=B1 27%   +4194.0%      46.59 =C2=B1  0%  turbostat.CPU%c1
      0.15 =C2=B1 63%    +313.6%       0.61 =C2=B1 26%  turbostat.CPU%c3
     29.14 =C2=B1  0%     -25.1%      21.81 =C2=B1  0%  turbostat.CorWatt
     70.00 =C2=B1  3%      -7.5%      64.75 =C2=B1  2%  turbostat.PkgTmp
     35.02 =C2=B1  0%     -21.0%      27.66 =C2=B1  0%  turbostat.PkgWatt
   3977771 =C2=B1 42%   +4729.4%  1.921e+08 =C2=B1  7%  cpuidle.C1-IVB.time
     27974 =C2=B1  4%  +23907.8%    6716112 =C2=B1 10%  cpuidle.C1-IVB.usage
   1647001 =C2=B1 22%  +15982.9%  2.649e+08 =C2=B1  0%  cpuidle.C1E-IVB.time
      4743 =C2=B1  7%  +1.2e+05%    5603747 =C2=B1  7%  cpuidle.C1E-IVB.usa=
ge
   1647557 =C2=B1 50%   +1186.1%   21188962 =C2=B1 31%  cpuidle.C3-IVB.time
      3255 =C2=B1 10%   +5794.9%     191907 =C2=B1 24%  cpuidle.C3-IVB.usage
 3.437e+08 =C2=B1  1%     +16.3%  3.998e+08 =C2=B1  2%  cpuidle.C6-IVB.time
     15488 =C2=B1  4%   +1524.2%     251555 =C2=B1 18%  cpuidle.C6-IVB.usage
   2645730 =C2=B1 26%    +151.8%    6662843 =C2=B1 29%  cpuidle.POLL.time
    152570 =C2=B1 12%    +195.7%     451112 =C2=B1 20%  cpuidle.POLL.usage
     38345 =C2=B1  1%     -58.7%      15844 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.0
     37626 =C2=B1  0%     -61.9%      14342 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.1
     37864 =C2=B1  1%     -61.7%      14486 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.2
     38132 =C2=B1  1%     -62.1%      14438 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.3
     37376 =C2=B1  0%     -72.4%      10318 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.4
     37402 =C2=B1  0%     -69.9%      11244 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.5
     37433 =C2=B1  0%     -70.4%      11089 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.6
     37407 =C2=B1  0%     -69.8%      11282 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.7
     37698 =C2=B1  0%     -65.8%      12880 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.avg
     38910 =C2=B1  0%     -59.1%      15902 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.max
     37349 =C2=B1  0%     -72.4%      10297 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.min
    500.91 =C2=B1 17%    +310.6%       2056 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     65.59 =C2=B1  7%     +28.8%      84.51 =C2=B1  9%  sched_debug.cfs_rq:=
/.load.stddev
    128.00 =C2=B1 25%     -55.5%      57.00 =C2=B1 45%  sched_debug.cfs_rq:=
/.load_avg.0
     92.75 =C2=B1 54%     +57.1%     145.75 =C2=B1 27%  sched_debug.cfs_rq:=
/.load_avg.3
    199.25 =C2=B1 27%     -71.3%      57.25 =C2=B1 50%  sched_debug.cfs_rq:=
/.load_avg.4
    146.50 =C2=B1 83%     -95.1%       7.25 =C2=B1 38%  sched_debug.cfs_rq:=
/.load_avg.6
    119.26 =C2=B1 14%     -33.4%      79.48 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.avg
    263.33 =C2=B1 22%     -30.1%     184.08 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.max
     44.67 =C2=B1  6%     -87.5%       5.58 =C2=B1 46%  sched_debug.cfs_rq:=
/.load_avg.min
    303665 =C2=B1  0%     -75.2%      75238 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.0
    302562 =C2=B1  0%     -75.8%      73288 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.1
    302728 =C2=B1  0%     -75.8%      73154 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.2
    303591 =C2=B1  0%     -75.8%      73426 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.3
    301962 =C2=B1  0%     -81.6%      55478 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.4
    302458 =C2=B1  0%     -80.5%      59083 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.5
    302281 =C2=B1  0%     -80.7%      58358 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.6
    302717 =C2=B1  0%     -80.4%      59383 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.7
    302745 =C2=B1  0%     -78.2%      65926 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    304288 =C2=B1  0%     -75.2%      75418 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.max
    301709 =C2=B1  0%     -81.7%      55237 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.min
    795.06 =C2=B1 12%    +921.0%       8117 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.44 =C2=B1 10%     -33.3%       0.29 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_running.avg
     42.00 =C2=B1  5%     -93.5%       2.75 =C2=B1 30%  sched_debug.cfs_rq:=
/.runnable_load_avg.2
     44.75 =C2=B1  6%     -89.9%       4.50 =C2=B1 72%  sched_debug.cfs_rq:=
/.runnable_load_avg.3
     41.25 =C2=B1  4%     -92.7%       3.00 =C2=B1 62%  sched_debug.cfs_rq:=
/.runnable_load_avg.5
     43.50 =C2=B1  6%     -96.0%       1.75 =C2=B1 74%  sched_debug.cfs_rq:=
/.runnable_load_avg.6
     33.50 =C2=B1 48%     -96.3%       1.25 =C2=B1 87%  sched_debug.cfs_rq:=
/.runnable_load_avg.7
     38.30 =C2=B1  8%     -91.1%       3.41 =C2=B1 12%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     51.25 =C2=B1  2%     -78.2%      11.17 =C2=B1 19%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
     13.90 =C2=B1 39%     -74.1%       3.60 =C2=B1 16%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     -1707 =C2=B1-24%   +1057.5%     -19760 =C2=B1 -8%  sched_debug.cfs_rq:=
/.spread0.4
     -1211 =C2=B1-89%   +1233.8%     -16156 =C2=B1 -6%  sched_debug.cfs_rq:=
/.spread0.5
     -1388 =C2=B1-66%   +1116.1%     -16881 =C2=B1 -8%  sched_debug.cfs_rq:=
/.spread0.6
   -953.45 =C2=B1-133%   +1563.1%     -15856 =C2=B1 -6%  sched_debug.cfs_rq=
:/.spread0.7
   -922.60 =C2=B1-87%    +909.4%      -9312 =C2=B1 -3%  sched_debug.cfs_rq:=
/.spread0.avg
     -1960 =C2=B1-39%    +920.5%     -20002 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.min
    795.42 =C2=B1 12%    +920.6%       8117 =C2=B1  2%  sched_debug.cfs_rq:=
/.spread0.stddev
    461.50 =C2=B1  2%     -55.2%     206.75 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.0
    450.25 =C2=B1  6%     -34.0%     297.25 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.1
    497.25 =C2=B1  8%     -42.1%     287.75 =C2=B1 19%  sched_debug.cfs_rq:=
/.util_avg.2
    471.75 =C2=B1 13%     -30.1%     329.75 =C2=B1 15%  sched_debug.cfs_rq:=
/.util_avg.3
    491.75 =C2=B1 11%     -70.3%     146.00 =C2=B1 42%  sched_debug.cfs_rq:=
/.util_avg.4
    414.00 =C2=B1  4%     -49.3%     209.75 =C2=B1 44%  sched_debug.cfs_rq:=
/.util_avg.5
    490.25 =C2=B1 28%     -66.7%     163.25 =C2=B1 28%  sched_debug.cfs_rq:=
/.util_avg.6
    463.25 =C2=B1  9%     -49.2%     235.25 =C2=B1 18%  sched_debug.cfs_rq:=
/.util_avg.7
    467.84 =C2=B1  3%     -49.8%     234.84 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.avg
    594.42 =C2=B1 14%     -32.6%     400.50 =C2=B1  8%  sched_debug.cfs_rq:=
/.util_avg.max
    383.00 =C2=B1  3%     -71.7%     108.33 =C2=B1 22%  sched_debug.cfs_rq:=
/.util_avg.min
    429518 =C2=B1 15%     +37.1%     588985 =C2=B1 12%  sched_debug.cpu.avg=
_idle.5
     23.41 =C2=B1114%     -90.7%       2.17 =C2=B1 56%  sched_debug.cpu.clo=
ck.stddev
     23.41 =C2=B1114%     -90.7%       2.17 =C2=B1 56%  sched_debug.cpu.clo=
ck_task.stddev
     40.75 =C2=B1  6%     -87.7%       5.00 =C2=B1 92%  sched_debug.cpu.cpu=
_load[0].2
     44.00 =C2=B1  6%     -94.3%       2.50 =C2=B1173%  sched_debug.cpu.cpu=
_load[0].3
     32.50 =C2=B1 49%     -91.5%       2.75 =C2=B1 78%  sched_debug.cpu.cpu=
_load[0].4
     40.25 =C2=B1  5%     -93.8%       2.50 =C2=B1 91%  sched_debug.cpu.cpu=
_load[0].5
     43.50 =C2=B1  8%     -93.9%       2.67 =C2=B1 63%  sched_debug.cpu.cpu=
_load[0].6
     35.03 =C2=B1  6%     -92.0%       2.80 =C2=B1 33%  sched_debug.cpu.cpu=
_load[0].avg
     51.58 =C2=B1  2%     -75.9%      12.42 =C2=B1 33%  sched_debug.cpu.cpu=
_load[0].max
     18.26 =C2=B1 10%     -76.1%       4.37 =C2=B1 30%  sched_debug.cpu.cpu=
_load[0].stddev
     32.50 =C2=B1 32%     -97.7%       0.75 =C2=B1 57%  sched_debug.cpu.cpu=
_load[1].0
     36.25 =C2=B1 24%     -91.0%       3.25 =C2=B1 50%  sched_debug.cpu.cpu=
_load[1].1
     40.75 =C2=B1  5%     -90.8%       3.75 =C2=B1 98%  sched_debug.cpu.cpu=
_load[1].2
     43.00 =C2=B1  4%     -95.3%       2.00 =C2=B1173%  sched_debug.cpu.cpu=
_load[1].3
     37.00 =C2=B1 22%     -95.3%       1.75 =C2=B1 62%  sched_debug.cpu.cpu=
_load[1].4
     40.50 =C2=B1  3%     -95.7%       1.75 =C2=B1 74%  sched_debug.cpu.cpu=
_load[1].5
     42.75 =C2=B1  7%     -95.3%       2.00 =C2=B1108%  sched_debug.cpu.cpu=
_load[1].6
     28.50 =C2=B1 53%     -98.2%       0.50 =C2=B1173%  sched_debug.cpu.cpu=
_load[1].7
     38.00 =C2=B1  2%     -94.2%       2.19 =C2=B1 28%  sched_debug.cpu.cpu=
_load[1].avg
     49.17 =C2=B1  1%     -81.5%       9.08 =C2=B1 39%  sched_debug.cpu.cpu=
_load[1].max
     16.08 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[1].min
     11.03 =C2=B1 15%     -72.3%       3.05 =C2=B1 36%  sched_debug.cpu.cpu=
_load[1].stddev
     37.50 =C2=B1 13%     -98.0%       0.75 =C2=B1 57%  sched_debug.cpu.cpu=
_load[2].0
     39.00 =C2=B1 12%     -92.9%       2.75 =C2=B1 39%  sched_debug.cpu.cpu=
_load[2].1
     40.75 =C2=B1  5%     -92.6%       3.00 =C2=B1 97%  sched_debug.cpu.cpu=
_load[2].2
     42.25 =C2=B1  3%     -96.4%       1.50 =C2=B1173%  sched_debug.cpu.cpu=
_load[2].3
     39.25 =C2=B1  9%     -96.8%       1.25 =C2=B1 66%  sched_debug.cpu.cpu=
_load[2].4
     40.50 =C2=B1  3%     -96.3%       1.50 =C2=B1 57%  sched_debug.cpu.cpu=
_load[2].5
     42.50 =C2=B1  6%     -97.1%       1.25 =C2=B1131%  sched_debug.cpu.cpu=
_load[2].6
     33.50 =C2=B1 30%     -97.8%       0.75 =C2=B1110%  sched_debug.cpu.cpu=
_load[2].7
     39.82 =C2=B1  1%     -95.3%       1.86 =C2=B1 26%  sched_debug.cpu.cpu=
_load[2].avg
     48.00 =C2=B1  2%     -85.1%       7.17 =C2=B1 41%  sched_debug.cpu.cpu=
_load[2].max
     26.50 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[2].min
      6.77 =C2=B1 20%     -64.8%       2.38 =C2=B1 38%  sched_debug.cpu.cpu=
_load[2].stddev
     40.00 =C2=B1  7%     -96.9%       1.25 =C2=B1 34%  sched_debug.cpu.cpu=
_load[3].0
     40.50 =C2=B1  7%     -93.8%       2.50 =C2=B1 34%  sched_debug.cpu.cpu=
_load[3].1
     40.25 =C2=B1  2%     -95.0%       2.00 =C2=B1122%  sched_debug.cpu.cpu=
_load[3].2
     42.25 =C2=B1  2%     -97.0%       1.25 =C2=B1131%  sched_debug.cpu.cpu=
_load[3].3
     40.25 =C2=B1  5%     -97.5%       1.00 =C2=B1 70%  sched_debug.cpu.cpu=
_load[3].4
     40.00 =C2=B1  3%     -98.1%       0.75 =C2=B1110%  sched_debug.cpu.cpu=
_load[3].5
     42.25 =C2=B1  5%     -96.8%       1.33 =C2=B1141%  sched_debug.cpu.cpu=
_load[3].6
     36.75 =C2=B1 18%     -98.0%       0.75 =C2=B1110%  sched_debug.cpu.cpu=
_load[3].7
     40.66 =C2=B1  1%     -96.0%       1.65 =C2=B1 25%  sched_debug.cpu.cpu=
_load[3].avg
     47.25 =C2=B1  2%     -85.9%       6.67 =C2=B1 34%  sched_debug.cpu.cpu=
_load[3].max
     32.58 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[3].min
      4.44 =C2=B1 20%     -51.2%       2.17 =C2=B1 32%  sched_debug.cpu.cpu=
_load[3].stddev
     42.25 =C2=B1  5%     -97.6%       1.00 =C2=B1 70%  sched_debug.cpu.cpu=
_load[4].0
     40.50 =C2=B1  4%     -93.8%       2.50 =C2=B1 34%  sched_debug.cpu.cpu=
_load[4].1
     40.25 =C2=B1  2%     -96.3%       1.50 =C2=B1110%  sched_debug.cpu.cpu=
_load[4].2
     42.25 =C2=B1  2%     -97.0%       1.25 =C2=B1131%  sched_debug.cpu.cpu=
_load[4].3
     40.75 =C2=B1  4%     -96.3%       1.50 =C2=B1 74%  sched_debug.cpu.cpu=
_load[4].4
     39.50 =C2=B1  2%     -98.7%       0.50 =C2=B1173%  sched_debug.cpu.cpu=
_load[4].5
     42.00 =C2=B1  4%     -96.0%       1.67 =C2=B1141%  sched_debug.cpu.cpu=
_load[4].6
     39.50 =C2=B1 11%     -98.1%       0.75 =C2=B1110%  sched_debug.cpu.cpu=
_load[4].7
     41.25 =C2=B1  0%     -96.1%       1.60 =C2=B1 17%  sched_debug.cpu.cpu=
_load[4].avg
     47.17 =C2=B1  3%     -86.4%       6.42 =C2=B1 26%  sched_debug.cpu.cpu=
_load[4].max
     35.92 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[4].min
      3.44 =C2=B1 23%     -37.0%       2.17 =C2=B1 22%  sched_debug.cpu.cpu=
_load[4].stddev
      1059 =C2=B1 28%     -64.3%     378.00 =C2=B1 71%  sched_debug.cpu.cur=
r->pid.2
    857.25 =C2=B1 26%     -25.6%     638.00 =C2=B1 13%  sched_debug.cpu.cur=
r->pid.5
    757.75 =C2=B1 10%     -44.7%     419.35 =C2=B1 25%  sched_debug.cpu.cur=
r->pid.avg
     38227 =C2=B1  0%     -14.3%      32746 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.4
     38089 =C2=B1  0%     -13.4%      32980 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.5
     38315 =C2=B1  0%     -15.5%      32362 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.6
     38187 =C2=B1  0%     -11.4%      33843 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.7
     38058 =C2=B1  0%     -16.8%      31648 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.min
      2260 =C2=B1 12%    +104.4%       4619 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.stddev
      0.46 =C2=B1 11%     -27.3%       0.33 =C2=B1 23%  sched_debug.cpu.nr_=
running.avg
     60237 =C2=B1 11%   +7594.3%    4634892 =C2=B1 11%  sched_debug.cpu.nr_=
switches.0
     55226 =C2=B1 12%   +8157.3%    4560209 =C2=B1  5%  sched_debug.cpu.nr_=
switches.1
     55047 =C2=B1 14%   +7797.4%    4347263 =C2=B1  3%  sched_debug.cpu.nr_=
switches.2
     57289 =C2=B1 14%   +7469.6%    4336552 =C2=B1  7%  sched_debug.cpu.nr_=
switches.3
     43239 =C2=B1 13%   +7701.1%    3373163 =C2=B1  8%  sched_debug.cpu.nr_=
switches.4
     44998 =C2=B1  7%   +7390.4%    3370525 =C2=B1  5%  sched_debug.cpu.nr_=
switches.5
     44707 =C2=B1 19%   +7785.8%    3525502 =C2=B1  2%  sched_debug.cpu.nr_=
switches.6
     42020 =C2=B1 12%   +7500.9%    3193917 =C2=B1  7%  sched_debug.cpu.nr_=
switches.7
     50345 =C2=B1 11%   +7681.7%    3917753 =C2=B1  2%  sched_debug.cpu.nr_=
switches.avg
     64527 =C2=B1  8%   +7405.8%    4843308 =C2=B1  7%  sched_debug.cpu.nr_=
switches.max
     40279 =C2=B1 11%   +7577.4%    3092415 =C2=B1  6%  sched_debug.cpu.nr_=
switches.min
      8478 =C2=B1 11%   +7117.2%     611929 =C2=B1 25%  sched_debug.cpu.nr_=
switches.stddev
      0.05 =C2=B1 34%    +320.0%       0.22 =C2=B1 24%  sched_debug.cpu.nr_=
uninterruptible.avg
     95009 =C2=B1  7%   +4814.6%    4669278 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.0
     55259 =C2=B1 12%   +8152.5%    4560280 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.1
     55076 =C2=B1 14%   +7793.3%    4347342 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.2
     57315 =C2=B1 14%   +7466.2%    4336636 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.3
     43271 =C2=B1 13%   +7695.6%    3373239 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.4
     45025 =C2=B1  7%   +7386.0%    3370599 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.5
     44736 =C2=B1 19%   +7780.8%    3525576 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.6
     42050 =C2=B1 12%   +7495.7%    3194026 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.7
     54718 =C2=B1 10%   +7067.8%    3922122 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.avg
     95009 =C2=B1  7%   +5021.3%    4865699 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.max
     40308 =C2=B1 11%   +7572.0%    3092488 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.min
     17263 =C2=B1  4%   +3482.1%     618390 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.stddev
     28215 =C2=B1 11%   +8107.6%    2315778 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.0
     25818 =C2=B1 10%   +8729.5%    2279654 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.1
     26437 =C2=B1 16%   +8118.1%    2172611 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.2
     25648 =C2=B1 11%   +8348.5%    2166947 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.3
     20962 =C2=B1 13%   +7940.0%    1685351 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.4
     21369 =C2=B1  8%   +7784.9%    1684972 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.5
     21662 =C2=B1 20%   +8035.7%    1762354 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.6
     20316 =C2=B1 12%   +7752.8%    1595435 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.7
     23804 =C2=B1 11%   +8125.0%    1957888 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.avg
     30125 =C2=B1  8%   +7935.5%    2420701 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.max
     19379 =C2=B1 11%   +7877.2%    1545896 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.min
      3658 =C2=B1 18%   +8263.0%     305987 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.stddev
     30798 =C2=B1  9%   +7479.9%    2334453 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.0
     28062 =C2=B1  8%   +8128.7%    2309129 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.1
     25856 =C2=B1 17%   +8831.7%    2309423 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.2
     24822 =C2=B1 18%   +9337.9%    2342745 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.3
     21728 =C2=B1 16%   +5352.6%    1184732 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.4
     24081 =C2=B1 18%   +7105.7%    1735222 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.5
     24395 =C2=B1  7%   +6596.3%    1633561 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.6
     21052 =C2=B1 17%   +8550.8%    1821237 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.7
     25099 =C2=B1 11%   +7704.1%    1958813 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.avg
     31674 =C2=B1  9%   +7601.4%    2439385 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.max
     19256 =C2=B1 14%   +6050.5%    1184359 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.min
      4109 =C2=B1 16%  +10090.0%     418801 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.stddev
      7112 =C2=B1  5%     -26.5%       5226 =C2=B1 37%  sched_debug.cpu.ttw=
u_local.0
      1112 =C2=B1 17%     -43.9%     624.50 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.6
    869.42 =C2=B1  7%     -38.4%     535.83 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.min


lkp-ivb-d01: Ivy Bridge
Memory: 16G

vm-kbuild-yocto-x86_64: qemu-system-x86_64 -enable-kvm -cpu SandyBridge
Memory: 320M



                                    uptime.idle

  1200 ++------------------------------------------------------------------=
-+
       OO OO O   O OOO OO    OOO O                                         =
 |
  1100 ++     O O         OO      O OO OO OOO                              =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   900 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   700 ++                                                                  =
 |
   600 ++                                                             *    =
 |
       |                                                              :+   =
 |
   500 **.**.**.**.***.**.**.***.**.**.**.***.**.**.***.**.**.**.***.*  **.=
**
       |                                                                   =
 |
   400 ++------------------------------------------------------------------=
-+




  1.2e+07 ++---------------------------------------------------------------=
-+
          |                           OO   OO                              =
 |
    1e+07 ++                        O     O                                =
 |
          |                             O     O                            =
 |
          |         OO                                                     =
 |
    8e+06 ++                O                                              =
 |
          |      OO          O                                             =
 |
    6e+06 O+  O       O        O   O                                       =
 |
          |O O          O  O    OO                                         =
 |
    4e+06 ++    O        O                                                 =
 |
          |                                                                =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**




  6e+08 ++-----------------------------------------------------------------=
-+
        OO OO O      OO OO   O OO O                                        =
 |
  5e+08 ++     O OOO      O O      OO OO OOO O                             =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  4e+08 ++                                                                 =
 |
        |                                                                  =
 |
  3e+08 ++                                                                 =
 |
        |                                                                  =
 |
  2e+08 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+08 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                                   softirqs.TIMER

  450000 ++----------------------------------------------------------------=
-+
         **.**.***.**.***.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
  400000 ++                                                                =
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
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 O+ OO OOO OO O   OO OO                                            =
 |
         |O            OO      O OO OOO OO OOO                             =
 |
  100000 ++----------------------------------------------------------------=
-+


                                   softirqs.SCHED

  100000 ++------O---------O-O---------------------------------------------=
-+
         OO OO OO  OO OOO O   O                                            =
 |
   90000 ++                    O OO OOO OO OOO                             =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   70000 ++                                                                =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   30000 ++                                                                =
 |
   20000 +*.* .** .**.*  .*    *.* .** .**. **. **. *.* *. *.*  .**. **.  .=
**
         *   *   *     **  *.**   *   *    *   *   *   *  *   **    *   ** =
 |
   10000 ++----------------------------------------------------------------=
-+


                                  cpuidle.C1-IVB.time

  2.5e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          |                           O    O                               =
 |
    2e+08 ++                        O  O  O O                              =
 |
          |                                                                =
 |
          |                             O     O                            =
 |
  1.5e+08 ++         O                                                     =
 |
          |         O                                                      =
 |
    1e+08 OO OO  OO            OOO O                                       =
 |
          |     O     O O                                                  =
 |
          |              O OOO                                             =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                                cpuidle.C1-IVB.usage

  8e+06 ++-----------------------------------------------------------------=
-+
        |                           O     O                                =
 |
  7e+06 ++                         O  O  O O                               =
 |
  6e+06 ++                                                                 =
 |
        |                              O     O                             =
 |
  5e+06 ++                                                                 =
 |
        |                                                                  =
 |
  4e+06 ++                                                                 =
 |
        |          O                                                       =
 |
  3e+06 ++        O                                                        =
 |
  2e+06 O+     O O                                                         =
 |
        |O OO O      OO  OO OO OO O                                        =
 |
  1e+06 ++              O                                                  =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                                 cpuidle.C1E-IVB.time

  3.5e+08 ++---------------------------------------------------------------=
-+
          |                 O                                              =
 |
    3e+08 ++      O          O                                             =
 |
          |      O  OO         O    O OOO OOO O                            =
 |
  2.5e+08 OO OO       O O  O    OO O                                       =
 |
          |              O                                                 =
 |
    2e+08 ++    O                                                          =
 |
          |                                                                =
 |
  1.5e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                                cpuidle.C1E-IVB.usage

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 ++                          O O   OO                               =
 |
        |                          O     O                                 =
 |
  5e+06 ++                             O     O                             =
 |
        |                 O                                                =
 |
  4e+06 ++       OOO        O                                              =
 |
        |      O                                                           =
 |
  3e+06 ++                   O                                             =
 |
        OO OO        OO  O     OO O                                        =
 |
  2e+06 ++    O         O                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                                 turbostat.Avg_MHz

  2800 ++------------------------------------------------------------------=
-+
  2600 ++      .*          *.        *.           *.     *.**.**. **.    *.=
 |
       **.**.**  *.***.**.*  ***.**.*  **.***.**.*  ***.*        *   * .*  =
**
  2400 ++                                                             *    =
 |
  2200 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
  1800 ++                                                                  =
 |
  1600 ++                                                                  =
 |
       |                                                                   =
 |
  1400 ++                                                                  =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++       OO O              O OO OO OOO                              =
 |
   800 OO-OO-OO-----OO-OO-OO-OOO-O-----------------------------------------=
-+


                                 turbostat._Busy

  75 ++--------------------------------------------------------------------=
-+
  70 **.**.**.**.**.**.**.**.**.**.**.**.***.**.**.**. *.**.**.**.**.*  **.=
**
     |                                                *               :+   =
 |
  65 ++                                                               *    =
 |
  60 ++                                                                    =
 |
  55 ++                                                                    =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  45 ++                                                                    =
 |
  40 ++                                                                    =
 |
  35 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  25 OO OO OO OO OO OO OO OO OO OO OO OO OOO                               =
 |
  20 ++--------------------------------------------------------------------=
-+


                                turbostat.CPU_c1

  50 ++--------------------------------------------------------------------=
-+
  45 OO OO  O OO OO OO OO OO OO OO OO OO OOO                               =
 |
     |     O                                                               =
 |
  40 ++                                                                    =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 ++                                                                    =
 |
   0 **-**-**-**-**-**-**-**-**-**-**-**-***-**-**-**-**-**-**-**-**-**-**-=
**


                                turbostat.PkgWatt

  36 ++-------------------*------------------------------**-*--------------=
-+
  35 **.**.**.**.**.**.**  *.**.**.**.**.***.**.**.**   +    *.**.**.*   *.=
**
     |                                               + *             :  *  =
 |
  34 ++                                               *               ::   =
 |
  33 ++                                                               ::   =
 |
     |                                                                *    =
 |
  32 ++                                                                    =
 |
  31 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  29 ++                                                                    =
 |
  28 ++        O O  O               O     O                                =
 |
     OO OO OO O   O  O OO O  OO OO O  OO O O                               =
 |
  27 ++                    O                                               =
 |
  26 ++--------------------------------------------------------------------=
-+


                                turbostat.CorWatt

  31 ++--------------------------------------------------------------------=
-+
  30 ++                                                  *                 =
 |
     **.**.**.**.**.**.**.**.**.**.**.**.***.**.**.**.  + *.**.**.**.*   *.=
**
  29 ++                                               **             :  *  =
 |
  28 ++                                                               ::   =
 |
  27 ++                                                               ::   =
 |
  26 ++                                                               *    =
 |
     |                                                                     =
 |
  25 ++                                                                    =
 |
  24 ++                                                                    =
 |
  23 ++                                                                    =
 |
  22 ++        O O                  O     O                                =
 |
     OO OO OO O   O OO OO O  OO OO O  OO O O                               =
 |
  21 ++                    O                                               =
 |
  20 ++--------------------------------------------------------------------=
-+


                                  unixbench.score

  6500 ++------------------------------------------------------------------=
-+
       **.           *. *.* .**          .**          *. *. *.  .***.**.  .=
**
  6000 ++ **.**.**.**  *   *   *.**.**.**   *.**.**.**  *  *  **        ** =
 |
  5500 ++                                                                  =
 |
       |                                                                   =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
  4500 ++                                                                  =
 |
       |                                                                   =
 |
  4000 ++                                                                  =
 |
  3500 ++                         O OO OO OOO                              =
 |
       |         O O                                                       =
 |
  3000 O+ OO  O O   OO    OO OOO O                                         =
 |
       |O    O         OO                                                  =
 |
  2500 ++------------------------------------------------------------------=
-+


                            unixbench.time.system_time

  800 **-**-**-**-**-**-***-**-**-**-**-***-**-**-**-**-**-***-**-**-**-**-=
**
      |                                                                    =
 |
  700 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      OO OO OO OO OO O  OOO OO OO OO OO OOO O                              =
 |
  200 ++--------------O----------------------------------------------------=
-+


                    unixbench.time.percent_of_cpu_this_job_got

  600 ++-------------------------------------------------------------------=
-+
      **.**.**.**.**.**.***.**.**.**.**.***.**.**.**.* .**.***.**.**.*  **.=
**
  550 ++                                              *               :+   =
 |
  500 ++                                                              *    =
 |
      |                                                                    =
 |
  450 ++                                                                   =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  350 ++                                                                   =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
  200 ++                                                                   =
 |
      |      O OO O      OO       OO OO OOO O                              =
 |
  150 OO-OO-O------O-OO-O---OO-OO------------------------------------------=
-+


                      unixbench.time.voluntary_context_switches

  6e+07 ++----O---------O--------------------------------------------------=
-+
        OO OO        OO  OO O                                              =
 |
  5e+07 ++     O O             OO O                                        =
 |
        |         OO         O                                             =
 |
        |                          OO OO OOO O                             =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |                                                                  =
 |
  2e+07 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+07 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                                 time.system_time

  800 **-**-**-**-**-**-***-**-**-**-**-***-**-**-**-**-**-***-**-**-**-**-=
**
      |                                                                    =
 |
  700 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      OO OO OO OO OO O  OOO OO OO OO OO OOO O                              =
 |
  200 ++--------------O----------------------------------------------------=
-+


                         time.percent_of_cpu_this_job_got

  600 ++-------------------------------------------------------------------=
-+
      **.**.**.**.**.**.***.**.**.**.**.***.**.**.**.* .**.***.**.**.*  **.=
**
  550 ++                                              *               :+   =
 |
  500 ++                                                              *    =
 |
      |                                                                    =
 |
  450 ++                                                                   =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  350 ++                                                                   =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
  200 ++                                                                   =
 |
      |      O OO O      OO       OO OO OOO O                              =
 |
  150 OO-OO-O------O-OO-O---OO-OO------------------------------------------=
-+


                           time.voluntary_context_switches

  6e+07 ++----O---------O--------------------------------------------------=
-+
        OO OO        OO  OO O                                              =
 |
  5e+07 ++     O O             OO O                                        =
 |
        |         OO         O                                             =
 |
        |                          OO OO OOO O                             =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |                                                                  =
 |
  2e+07 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+07 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                                  vmstat.procs.r

    4 **----**-**-**-**-**--**----**-**-***----**-**-*--**-***-**-**-*--**-=
*+
      |:    :            :  ::    :       :    :     :  :            :  :  =
:|
  3.5 ++:  :             : :  :  :         :  :      : :             : :   =
:|
      | :  :              ::  :  :         :  :       ::              ::   =
 |
      |  ::               :    ::           ::        :               :    =
 |
    3 ++ **               *    **           **        *               *    =
 *
      |                                                                    =
 |
  2.5 ++                                                                   =
 |
      |                                                                    =
 |
    2 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  1.5 ++                                                                   =
 |
      |                                                                    =
 |
    1 OO-OO-OO-OO-OO-OO-OOO-OO-OO-OO-OO-OOO-O------------------------------=
-+


                                  vmstat.system.cs

  900000 ++----------------------------------------------------------------=
-+
         |     O                                                           =
 |
  800000 OO OO        OOO OO                                               =
 |
  700000 ++     OO           O O  O                                        =
 |
         |         OO         O  O                                         =
 |
  600000 ++                         OOO OO OOO                             =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
       0 **-**-***-**-***-**-***-**-***-**-***-***-**-***-**-***-**-***-**-=
**


                          sched_debug.cpu.cpu_load_2_.0

  70 ++--------------------------------------------------------------------=
-+
     |  *                     *            *                               =
 |
  60 ++ :                     ::           ::                              =
 |
     * : :                 *  ::        .* ::                              =
 |
  50 ++: *.     .*         :  : *      * : : *      *.             *       =
 |
     | :   **.**  :     *.* ::   *.**.*  ::   *.**.*  *    .* .*   :+      =
 *
  40 ++:          *.**.*    ::            :            *.**  *  *.*  **  *.=
 |
     |:                      :            :                            + : =
*|
  30 +*                      *            *                             *  =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |   O O            O       O                                          =
 |
   0 OO-O---O-OO-OO-OO-O--OO-OO--O-OO-OO-OOO-------------------------------=
-+


                          sched_debug.cpu.cpu_load_3_.0

  70 ++-*---------------------*------------*-------------------------------=
-+
     |  :                     ::           ::                              =
 |
  60 ++: :                    ::           ::                              =
 |
     * : :                 *  : :       .* : :                             =
 |
  50 ++: *.     .*         :::  *      * ::  *      *.      *      *       =
 |
     |::   **.**  :     *.* ::   *.**.*   :   *.**.*  *    + :.*   :+      =
 *
  40 ++           *.**.*     :            :            *.**  *  *.*  **. *.=
*|
     |*                      *            *                             *  =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |O  O O            O       O                                          =
 |
   0 O+-O---O-OO-OO-OO-O--OO-OO--O-OO-OO-OOO-------------------------------=
-+


                          sched_debug.cpu.cpu_load_4_.0

  80 ++-*---------------------*------------*-------------------------------=
-+
     |  :                     :            :                               =
 |
  70 ++::                     ::           ::                              =
 |
  60 ++: :                    ::           ::                              =
 |
     * : :                 * : :        .*: :               *              =
 |
  50 ++: :      .*         :::  :      * ::  :      *.     : :             =
 |
     |:  *.**.**  :     *.* ::  **.**.*   :  **.**.*  *    : *.**. *.      =
 *
  40 +*           *.**.*     *            *            *.**       *  **.**.=
*|
     |                                                                     =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |   O O  O  O              O                                          =
 |
   0 OO-O---O--O--O-OO-OO-OO-OO--O-OO-OO-OOO-------------------------------=
-+


                             sched_debug.cpu.ttwu_count.0

    4e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  3.5e+06 ++             O                                                 =
 |
    3e+06 ++  O O                                                          =
 |
          |  O   O          OO                                             =
 |
  2.5e+06 OO      O     O  O          O    O                               =
 |
          |         OOO        O O  O  OO O O O                            =
 |
    2e+06 ++                    O  O                                       =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.0

  40000 **-*---*-***-**-***--*-**---*-**-***-*---*-***--*-***-**--*-***-*--=
-+
        |   *.*             *     **          *.*      *         *       *.=
**
  35000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++        OO  O                                                    =
 |
        O  O  OO     O         OO O                                        =
 |
        |O  O    O       OO OO      O OO  OO O                             =
 |
  15000 ++              O          O     O                                 =
 |
        |                                                                  =
 |
  10000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.0

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.* *.**.***.**.***.**.=
**
         |                                             *                   =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 O+        OO OO       O O                                         =
 |
         |O OO OOO      O OO OO   O OOO OO OOO                             =
 |
   50000 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu.nr_switches.1

  1.6e+07 ++---------------------------------------------------------------=
-+
          |              O                                                 =
 |
  1.4e+07 ++                                                               =
 |
  1.2e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    8e+06 ++               O     O                                         =
 |
          |O      O O   O   O                                              =
 |
    6e+06 ++    O              O                                           =
 |
    4e+06 O+ OO              O      O OOO OOO O                            =
 |
          |      O   OO         O  O                                       =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cpu.cpu_load_4_.1

  70 ++--------------------------------------------------------------------=
-+
     |     *                     *            *                            =
 |
  60 ++    :                     :            :                            =
 |
     |    ::   *                 ::   *       ::   *                       =
 |
  50 ++   : :  :+               : :  + :     : :  + :                      =
 |
     **. *  :.*  **. *.    *.* .*  :*  *.** .*  :*  *   .*    .*    .**. *.=
 |
  40 ++ *   *       *  *  *   *    *       *    *    + * :  **  *.**    *  =
**
     |                 : :                            *   ::               =
 |
  30 ++                 ::                                ::               =
 |
     |                  *                                 *                =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |  OO  O                      O     O                                 =
 |
   0 OO----O--OO-OO-OO-OO-OO-OO-OO--O-OO--OO-------------------------------=
-+


                             sched_debug.cpu.sched_count.1

  1.6e+07 ++---------------------------------------------------------------=
-+
          |              O                                                 =
 |
  1.4e+07 ++                                                               =
 |
  1.2e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    8e+06 ++               O     O                                         =
 |
          |O      O O   O   O                                              =
 |
    6e+06 ++    O              O                                           =
 |
    4e+06 O+ OO              O      O OOO OOO O                            =
 |
          |      O   OO         O  O                                       =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                           sched_debug.cpu.sched_goidle.1

  8e+06 ++-----------------------------------------------------------------=
-+
        |               O                                                  =
 |
  7e+06 ++                                                                 =
 |
  6e+06 ++                                                                 =
 |
        |                                                                  =
 |
  5e+06 ++                                                                 =
 |
        |                                                                  =
 |
  4e+06 ++               O      O                                          =
 |
        |O       OO   O   O                                                =
 |
  3e+06 ++    O              O                                             =
 |
  2e+06 O+ OO               O      OO OO OOO O                             =
 |
        |      O   O O         O  O                                        =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                             sched_debug.cpu.ttwu_count.1

    4e+06 ++----O----------------------------------------------------------=
-+
          O  O                                                             =
 |
  3.5e+06 +O          O    OOO                                             =
 |
    3e+06 ++  O  OO     O       OO O                                       =
 |
          |         O    O     O                                           =
 |
  2.5e+06 ++         O                                                     =
 |
          |                         O OOO OOO O                            =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.1

  40000 ++-----------------------------------------------------------------=
-+
        **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**.**.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        |        O      OO   O                                             =
 |
  15000 OO OO O   OO  O   O O  OO OOO OO OOO O                             =
 |
        |      O     O                                                     =
 |
  10000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.1

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.* *.**.***.**.***.**.=
**
         |                                             *                   =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         OO OO OOO OO OOO OO OOO OO OOO OO OOO                             =
 |
   50000 ++----------------------------------------------------------------=
-+


                            sched_debug.cpu.nr_switches.2

  9e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  8e+06 ++ O                                                               =
 |
  7e+06 ++                O                                                =
 |
        |      O                                                           =
 |
  6e+06 ++              O                                                  =
 |
  5e+06 O+               O  O                                              =
 |
        |     O  O   OO        O    O OO  OO O                             =
 |
  4e+06 ++        OO               O     O                                 =
 |
  3e+06 ++  O                O    O                                        =
 |
        |O                      O                                          =
 |
  2e+06 ++                                                                 =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                          sched_debug.cpu.cpu_load_3_.2

  70 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  60 ++                                                      *             =
 |
     |                                                       ::            =
 |
  50 **                    *.*          .**                 : :            =
 |
     | +    *.  .* .**. *.*   :    *   *   :    *   *. *. *.*  : .*        =
 |
  40 ++ *   : **  *    *      *.  + *.*    *.  + *.*  *  *     **  *.**.**.=
**
     |   *.*                    **           **                            =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                 O  OO O  O   O     O                                =
 |
   0 OO-OO-OO-OO-OO-OO--O-----O--O-O--OO-O-O-------------------------------=
-+


                          sched_debug.cpu.cpu_load_4_.2

  60 ++------------------------------------------------------*-------------=
-+
     |                                                       ::            =
 |
  50 ++                                                     : :            =
 |
     **.                   *.*          .**               *.*  : .*        =
 |
     |  *   *.**.**.**.**.*   *.  .**.**   *.  .**.**. *.*     **  *.**.*  =
 |
  40 ++  *.*                    **           **       *                  *.=
**
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                 O   O    O   O     O                                =
 |
   0 OO-OO-OO-OO-OO-OO--O-O--OO--O-O--OO-O-O-------------------------------=
-+


                            sched_debug.cpu.sched_count.2

  9e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  8e+06 ++ O                                                               =
 |
  7e+06 ++                O                                                =
 |
        |      O                                                           =
 |
  6e+06 ++              O                                                  =
 |
  5e+06 O+               O  O                                              =
 |
        |     O  O   OO        O    O OO  OO O                             =
 |
  4e+06 ++        OO               O     O                                 =
 |
  3e+06 ++  O                O    O                                        =
 |
        |O                      O                                          =
 |
  2e+06 ++                                                                 =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                            sched_debug.cpu.sched_goidle.2

  4.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    4e+06 ++ O                                                             =
 |
  3.5e+06 ++                O                                              =
 |
          |      O                                                         =
 |
    3e+06 ++             O                                                 =
 |
  2.5e+06 O+               O O                                             =
 |
          |     O O   O O       O     OOO  OO O                            =
 |
    2e+06 ++        OO              O     O                                =
 |
  1.5e+06 ++  O                O   O                                       =
 |
          |O                     O                                         =
 |
    1e+06 ++                                                               =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                             sched_debug.cpu.ttwu_count.2

    4e+06 ++----O--------O-------------------------------------------------=
-+
          |O  O       O    O     O                                         =
 |
  3.5e+06 ++            O   O   O  O                                       =
 |
    3e+06 O+      O O        O O                                           =
 |
          |  O   O   O                                                     =
 |
  2.5e+06 ++                                                               =
 |
          |                         O OOO OOO O                            =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.2

  40000 ++--*---------------*-----*-----------*----------------------------=
*+
        **.*  **.***.**.***  *.**  **.**.***.*  **.***. *.***.**.**.***.** =
 *
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  15000 OO OO OO OOO O  OOO O  OO OOO OO OOO O                             =
 |
        |             O      O                                             =
 |
  10000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.2

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.* *.**.***.**.***.**.=
**
         |                                             *                   =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         OO OO OOO OO OOO OO OOO OO OOO OO OOO                             =
 |
   50000 ++----------------------------------------------------------------=
-+


                            sched_debug.cpu.nr_switches.3

  9e+06 ++-----------------------------------------------------------------=
-+
        |   O O                                                            =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 ++                                                                 =
 |
  5e+06 ++                        O                                        =
 |
        |O           O      O       O OO  OO O                             =
 |
  4e+06 O+ O   O OO     O O  O O   O     O                                 =
 |
  3e+06 ++         O  O  O      O                                          =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                          sched_debug.cpu.cpu_load_0_.3

  60 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  50 ++  *                      *            *                             =
 |
     |   :+         *          + :          + :              *.          *.=
 *
     **.*  **.**.* + :.**.**.**  *.**.**.***  *.**.**. *.**  : * .*   *.*  =
*|
  40 ++           *  *                                *   :  :  *  *.*     =
 |
     |                                                    :  :             =
 |
  30 ++                                                    : :             =
 |
     |                                                     : :             =
 |
  20 ++                                                    ::              =
 |
     |                                                     ::              =
 |
     |  O                                                   :              =
 |
  10 ++     O          O      O       O    O                :              =
 |
     OO    O        O                                       *              =
 |
   0 ++--O----OO-OO--O--O-OO-O--OO-OO--O-OO--------------------------------=
-+


                          sched_debug.cpu.cpu_load_1_.3

  50 ++--------------------------------------------------------------------=
-+
  45 ++  *.     .*      *.     .*      *.   .*      *                    * =
 *
     **.*  **.**  :.*   : **.**  *.**.*  ***  *.**.* +  .**  *.*      *. :+=
 |
  40 ++           * :  *                              **  :  :  *  *.*  *  =
*|
  35 ++              ::                                    : :   + :       =
 |
     |               ::                                    : :    *        =
 |
  30 ++              *                                     ::              =
 |
  25 ++                                                     :              =
 |
  20 ++                                                     *              =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |  O                     O       O    O                               =
 |
   5 OO    OO  O    O  O  O     O                                          =
 |
   0 ++--O----O--OO--O--O--O-O---O-OO--O-OO--------------------------------=
-+


                          sched_debug.cpu.cpu_load_2_.3

  50 ++--------------------------------------------------------------------=
-+
  45 ++  *. *.  .*      *.     .* .*   *.   .* .*   *                      =
 |
     **.*  *  **  :.*   : **.**  *  *.*  ***  *  *.* +  .**  *.*      *. *.=
 *
  40 ++           * :  *                              **   : :  *. *.*  *  =
*|
  35 ++              :+                                    ::     *        =
 |
     |               *                                      *              =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |  O                             O    O                               =
 |
   5 OO    OO OO    O  O  O   O O                                          =
 |
   0 ++--O-------OO--O--O--O-O---O-OO--O-OO--------------------------------=
-+


                          sched_debug.cpu.cpu_load_3_.3

  50 ++-----*----------------------*------------*--------------------------=
-+
     |   *. :+  .*             .* + :  *.   .* + :  *         .*           =
 |
     **.*  *  **  :.*   *.**.**  *  *.*  ***  *  *.* +  .**  *  :     *.**.=
 *
  40 ++           *  :.*                              **   + :  *.**.*     =
*|
     |               *                                      *              =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |  O                                                                  =
 |
     |O  O OO OO    O  O  O   O O     O    O                               =
 |
   0 O+----------OO--O--O--O-O---O-OO--O-OO--------------------------------=
-+


                          sched_debug.cpu.cpu_load_4_.3

  60 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  50 ++     *                      *            *                          =
 |
     |      :+  .*                + :  *.      + :  *         .*           =
 |
     **.**.*  **  :.* .**.**.**.**  *.*  ***.**  *.* + *.**. *  *.*   *.**.=
**
  40 ++           *  *                                *     *      *.*     =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++ O                                                                  =
 |
     |     O  O     O         O O     O    O                               =
 |
   0 OO--O--O--O-OO--O-OO-OO-O---O-OO--O-OO--------------------------------=
-+


                            sched_debug.cpu.sched_count.3

  9e+06 ++-----------------------------------------------------------------=
-+
        |   O O                                                            =
 |
  8e+06 ++                                                                 =
 |
  7e+06 ++                                                                 =
 |
        |                                                                  =
 |
  6e+06 ++                                                                 =
 |
  5e+06 ++                        O                                        =
 |
        |O           O      O       O OO  OO O                             =
 |
  4e+06 O+ O   O OO     O O  O O   O     O                                 =
 |
  3e+06 ++         O  O  O      O                                          =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                            sched_debug.cpu.sched_goidle.3

  4.5e+06 ++---------------------------------------------------------------=
-+
          |   O O                                                          =
 |
    4e+06 ++                                                               =
 |
  3.5e+06 ++                                                               =
 |
          |                                                                =
 |
    3e+06 ++                                                               =
 |
  2.5e+06 ++                       O                                       =
 |
          |O          O      O        OOO  OO O                            =
 |
    2e+06 O+ O   OO O    O  O  OO   O     O                                =
 |
  1.5e+06 ++         O  O  O     O                                         =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                             sched_debug.cpu.ttwu_count.3

  4.5e+06 ++---------------------------------------------------------------=
-+
          |O                                                               =
 |
    4e+06 O+    O     O    O                                               =
 |
  3.5e+06 ++ O           O                                                 =
 |
          |      OO     O   OO   O                                         =
 |
    3e+06 ++  O      O          O  O                                       =
 |
  2.5e+06 ++        O          O    O     O                                =
 |
          |                           OOO  OO O                            =
 |
    2e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.3

  40000 ++-------------------------------------------------------*---------=
-+
        **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**  *.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        |     O                                                            =
 |
  15000 OO OO  O OOO O  OO  O     OOO OO OOO O                             =
 |
        |             O   O  O OO                                          =
 |
  10000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.3

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.* *.**.***.**.***.**.=
**
         |                                             *                   =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         OO OO OOO OO OOO OO OOO OO OOO OO OOO                             =
 |
   50000 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu.nr_switches.4

    4e+06 ++---------------------------------------------------------------=
-+
          |                           O    O                               =
 |
  3.5e+06 ++                           O    O                              =
 |
    3e+06 ++                        O   O O   O                            =
 |
          |                                                                =
 |
  2.5e+06 ++          O                                                    =
 |
          |O      O            O                                           =
 |
    2e+06 O+  O  O       O OO   OO O                                       =
 |
          |  O       O  O    O                                             =
 |
  1.5e+06 ++        O                                                      =
 |
    1e+06 ++    O                                                          =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cpu.cpu_load_2_.4

  60 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  50 ++     *                      *            *                          =
 |
     |      :+            *       + :          + :                         =
 |
     |*.**.*  * .**.**   + :.**.**  *. *. **.**  *. *  *    **  *     *  *.=
*|
  40 *+        *      : *  *          *  *         * + :+  +  : :: *.* + : =
 *
     |                : :                             *  **   :: : :    *  =
 |
  30 ++                *                                       *  *        =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |  O            O                                                     =
 |
   0 OO--O-OO-OO-OO-O--OO-OO-OO-OO-OO-OO-OOO-------------------------------=
-+


                          sched_debug.cpu.cpu_load_3_.4

  70 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  60 ++                   *                                                =
 |
     |                    :                                                =
 |
  50 ++     *            : :      .*           .*                          =
 |
     | .* .* +  .**. *   : :  *. *  :  *.  *. *  :  *      .**            .=
*|
  40 **  *    **    * + *  *.*  *   *.*  **  *   *.* + *. *   + *. *.**. * =
 *
     |                 *                              *  *     *  *     *  =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   0 OO-OO-OO-OO-OO-OO-OO-OO-OO-OO-OO-OO-OOO-------------------------------=
-+


                          sched_debug.cpu.cpu_load_4_.4

  80 ++--------------------------------------------------------------------=
-+
     |                    *                                                =
 |
  70 ++                   :                                                =
 |
  60 ++                  ::                                                =
 |
     |                   : :                                               =
 |
  50 ++     *            : :       *            *                          =
 |
     | .*   :+ *.**. *  :  :  *.  + :.**.  *.  + :.**.    *.**.           .=
*|
  40 **  *.*  *     * + *  *.*  **  *    **  **  *    **.*     **.**.**.** =
 *
     |                 *                                                   =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     O                             O     O                                 =
 |
   0 +O-OO-OO-OO-OO-OO-OO-OO-OO-OO--O-OO--OO-------------------------------=
-+


                             sched_debug.cpu.sched_count.4

    4e+06 ++---------------------------------------------------------------=
-+
          |                           O    O                               =
 |
  3.5e+06 ++                           O    O                              =
 |
    3e+06 ++                        O   O O   O                            =
 |
          |                                                                =
 |
  2.5e+06 ++          O                                                    =
 |
          |O      O            O                                           =
 |
    2e+06 O+  O  O       O OO   OO O                                       =
 |
          |  O       O  O    O                                             =
 |
  1.5e+06 ++        O                                                      =
 |
    1e+06 ++    O                                                          =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                            sched_debug.cpu.sched_goidle.4

    2e+06 ++---------------------------------------------------------------=
-+
  1.8e+06 ++                          O    O                               =
 |
          |                            O    O                              =
 |
  1.6e+06 ++                        O   O O   O                            =
 |
  1.4e+06 ++                                                               =
 |
          |           O                                                    =
 |
  1.2e+06 +O      O            O                                           =
 |
    1e+06 O+  O  O       O OO   OO O                                       =
 |
   800000 ++ O       O  O    O                                             =
 |
          |         O                                                      =
 |
   600000 ++    O                                                          =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                             sched_debug.cpu.ttwu_count.4

    2e+06 ++---------------------------------------------------------------=
-+
  1.8e+06 ++             O                                                 =
 |
          |   O                                                            =
 |
  1.6e+06 ++                                                               =
 |
  1.4e+06 ++ O              O                                              =
 |
          O      OO                    O    O                              =
 |
  1.2e+06 +O    O   OOO O  O O      O O O OO  O                            =
 |
    1e+06 ++                   O                                           =
 |
   800000 ++                    OO O                                       =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.4

  40000 ++-----------------------------------------------------------------=
-+
        **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**.**.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                         OO OO OOO O                             =
 |
        OO OO OO OOO OO OOO OO OO O                                        =
 |
   5000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.4

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   50000 OO OO  OO OO OOO OO OOO OO OOO OO OOO                             =
 |
         |     O                                                           =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu.nr_switches.5

    5e+06 ++----------------O----------------------------------------------=
-+
  4.5e+06 ++                                                               =
 |
          |   O                                                            =
 |
    4e+06 ++                                                               =
 |
  3.5e+06 ++                        O O O OO  O                            =
 |
          |          O                 O    O                              =
 |
    3e+06 ++     O       O     O                                           =
 |
  2.5e+06 O+ O    O        O O  O  O                                       =
 |
    2e+06 +O          O O        O                                         =
 |
          |     O   O                                                      =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cpu.cpu_load_3_.5

  60 ++-------*---------------------*------------*-------------------------=
-+
     |  *    +:               *     :      *     :                         =
 |
  50 +++:   * :               ::   * :     ::   * :                        =
 |
     **  :  : :            *.* :  :  :  .** :  :  :     .*                 =
 |
     |   *.:   : *    .**.*     * :  : *     * :  : *.**  *.**.**.*   *.*  =
 |
  40 ++    *   : :*.**           *   : :      *   : :             :   :  *.=
**
     |         ::                     ::           ::              : :     =
 |
  30 ++        ::                     :            :               :.*     =
 |
     |         *                      *            *               *       =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                          O                                          =
 |
   0 OO-OO-OO-OO-OO-OO-OO-OO-OO--O-OO-OO-OOO-------------------------------=
-+


                          sched_debug.cpu.cpu_load_4_.5

  70 ++-------*---------------------*------------*-------------------------=
-+
     |        :                     :            :                         =
 |
  60 *+      ::            *        ::   *       ::                        =
 |
     |  *    ::            :: *    : :  +: *    : :                        =
 |
  50 +++:   *  : *        : : ::   * : *  :::   * : *.  .*                 =
 |
     |*  :  :  : ::      .*  * :  +  : :  * :  +  : : **  :  *. *.         =
 |
  40 ++  *.*   :: *.**.**       **    ::     **    ::     *.*  *  *   *.**.=
**
     |         ::                     :            :               *.*     =
 |
  30 ++        *                      *            *                       =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     O        O                 O                                          =
 |
   0 +O-OO-OO--O-OO-OO-OO-OO-OO--O-OO-OO-OOO-------------------------------=
-+


                             sched_debug.cpu.sched_count.5

    5e+06 ++----------------O----------------------------------------------=
-+
  4.5e+06 ++                                                               =
 |
          |   O                                                            =
 |
    4e+06 ++                                                               =
 |
  3.5e+06 ++                        O O O OO  O                            =
 |
          |          O                 O    O                              =
 |
    3e+06 ++     O       O     O                                           =
 |
  2.5e+06 O+ O    O        O O  O  O                                       =
 |
    2e+06 +O          O O        O                                         =
 |
          |     O   O                                                      =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                            sched_debug.cpu.sched_goidle.5

  2.5e+06 ++----------------O----------------------------------------------=
-+
          |                                                                =
 |
          |   O                                                            =
 |
    2e+06 ++                                                               =
 |
          |                         O O O OO  O                            =
 |
          |          O                 O    O                              =
 |
  1.5e+06 ++     O       O     O                                           =
 |
          O       O        O O  O  O                                       =
 |
    1e+06 +O O        O O        O                                         =
 |
          |     O   O                                                      =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                             sched_debug.cpu.ttwu_count.5

  2.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          |  O   O           O                                             =
 |
    2e+06 ++          O     O   O  O    O     O                            =
 |
          OO  O   O  O  O  O        O     O                                =
 |
          |                    O       O    O                              =
 |
  1.5e+06 ++    O   O            O    O    O                               =
 |
          |              O                                                 =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.5

  40000 ++-----------------------------------------------------------------=
-+
        **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**.**.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                             OO   O O                             =
 |
  10000 ++ OO  O OOO      O OO O  OOO    OO                                =
 |
        OO    O      OO OO      O                                          =
 |
   5000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.5

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   50000 OO OO OOO OO OOO OO OOO OO OOO OO OOO                             =
 |
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu.nr_switches.6

  5.5e+06 ++---------------------------------------------------------------=
-+
    5e+06 +O                 O                                             =
 |
          |                                                                =
 |
  4.5e+06 ++                                                               =
 |
    4e+06 O+                                                               =
 |
  3.5e+06 ++      O        O        O OOO OOO O                            =
 |
    3e+06 ++ O   O                                                         =
 |
          |           O OO  O                                              =
 |
  2.5e+06 ++  O O   OO         O O O                                       =
 |
    2e+06 ++                    O                                          =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cpu.cpu_load_2_.6

  60 ++--------------------------------------------------------------------=
-+
     |   *.*   *                **   .*      **   .*                       =
 |
  50 ++  : :  * +              + :  *  :    + :  *  :                      =
 |
     | .*  :  :  *            *   : :  *.  *   : :  *              *   .*  =
 |
     **    : :    :  *.* .**.*    : :    **    : :   + *    **.*  * + *  *.=
*|
  40 ++     ::    *. :  *         : :          : :    * +  +    :+   *     =
 *
     |      ::      *             ::           ::        **     *          =
 |
  30 ++     :                      :            :                          =
 |
     |      *                      *            *                          =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |        O     OO              O     O                                =
 |
   0 OO-OO-OO--O-OO----OO-OO-OO-OO-O--OO-O-O-------------------------------=
-+


                          sched_debug.cpu.cpu_load_3_.6

  70 ++--------------------------------------------------------------------=
-+
     |   *                      *            *                             =
 |
  60 ++  :+                     ::           ::                            =
 |
     |   : *   *.              : *   .*     : *   .*                       =
 |
  50 ++ :  :  *  *             :  : *  *    :  : *  *                      =
 |
     |*.*   :+    :      .* .**   : :   + **   : :   +           .**.  .*  =
 |
  40 *+     *     *. *.**  *       *     *      *     **.  .**.**    **  *.=
**
     |              *                                    **                =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |        O              O      O     O                                =
 |
   0 OO-OO-OO--O-OO-OO-OO-OO--O-OO-O--OO-O---------------------------------=
-+


                          sched_debug.cpu.cpu_load_4_.6

  80 ++--------------------------------------------------------------------=
-+
     |   *                      *            *                             =
 |
  70 ++  ::                     :            :                             =
 |
  60 ++  ::                    : :          : :                            =
 |
     |  :  *   *               : *.   *     : *.   *                       =
 |
  50 +*.:   *. :+            *:    * + :  *:    * + :                      =
 |
     |: *     *  *       .* + *     *  *. :*     *  *.      *    .**.  .*  =
 |
  40 *+           *.**.**  *             *            **.* + *.**    **  *.=
**
     |                                                    *                =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                       O      O     O                                =
 |
   0 OO-OO-OO-OO-OO-OO-OO-OO--O-OO-O--OO-O---------------------------------=
-+


                             sched_debug.cpu.sched_count.6

  5.5e+06 ++---------------------------------------------------------------=
-+
    5e+06 +O                 O                                             =
 |
          |                                                                =
 |
  4.5e+06 ++                                                               =
 |
    4e+06 O+                                                               =
 |
  3.5e+06 ++      O        O        O OOO OOO O                            =
 |
    3e+06 ++ O   O                                                         =
 |
          |           O OO  O                                              =
 |
  2.5e+06 ++  O O   OO         O O O                                       =
 |
    2e+06 ++                    O                                          =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                            sched_debug.cpu.sched_goidle.6

    3e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  2.5e+06 +O                 O                                             =
 |
          |                                                                =
 |
          |                                                                =
 |
    2e+06 O+                        O     O                                =
 |
          |       O        O          OOO  OO O                            =
 |
  1.5e+06 ++ O   O    O O   O                                              =
 |
          |   O O        O     O O O                                       =
 |
    1e+06 ++        OO          O                                          =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                             sched_debug.cpu.ttwu_count.6

  2.5e+06 ++---------------------------------------------------------------=
-+
          |              O O                                               =
 |
          |O      O   O O   O                                              =
 |
    2e+06 ++  O              O O   O                                       =
 |
          O      O  OO           O  O     O                                =
 |
          |  O  O               O     OOO  OO O                            =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.6

  40000 ++----*--------------------*------------*--------------------------=
-+
        **.**  *.***.**.***.**.**.* *.**.***.**  *.***. *.***.**.**.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                          O  O  O O                               =
 |
  10000 +O OO  O OOO OO OOO OO  O O O  O  O  O                             =
 |
        O     O                O                                           =
 |
   5000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.6

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   50000 OO OO OOO OO OOO OO OOO OO OOO OO OOO                             =
 |
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                             sched_debug.cpu.nr_switches.7

    4e+06 ++---------------------------------------------------------------=
-+
          |      O                                                         =
 |
  3.5e+06 ++                        O O   OO                               =
 |
    3e+06 ++                 O         O    O                              =
 |
          |       O         O           O     O                            =
 |
  2.5e+06 ++                   O                                           =
 |
          |   O       O  O      O                                          =
 |
    2e+06 O+         O  O        O O                                       =
 |
          |O O  O   O      O                                               =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cpu.cpu_load_3_.7

  50 ++-----*-*--------------------**-----------**-------------------------=
-+
     **.**. :  :          **.**.* +  +  .***.* +  +                        =
 |
     |     *   *.**. *.* +       *    **      *    **  *.**.**.*     **.   =
 *
  40 ++             *   *                            + :        *.*  :  *  =
 |
     |                                                *           : :   :  =
*|
     |                                                             ::    ::=
 |
  30 ++                                                            :     ::=
 |
     |                                                             *     * =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
     |           O     OO    O        O    O                               =
 |
   0 OO-OO-OO-OO--O-OO----OO--O-OO-OO--O-OO--------------------------------=
-+


                          sched_debug.cpu.cpu_load_4_.7

  50 ++--*--*-*-----------------*--**--------*--**-------------------------=
-+
     **.* : :  :         .**.** : :  +  .*** : :  +    *.            *     =
 *
     |    ::   *.**. *.**        ::   **      ::   **. : **.**.**.   :*.   =
 |
  40 ++    *        *            *            *       *           * :   *  =
*|
     |                                                            : :    :+=
 |
     |                                                             :     * =
 |
  30 ++                                                            *       =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
     |            O    O            O     O                                =
 |
   0 OO-OO-OO-OO-O--OO--O-OO-OO-OO-O--OO-O-O-------------------------------=
-+


                             sched_debug.cpu.sched_count.7

    4e+06 ++---------------------------------------------------------------=
-+
          |      O                                                         =
 |
  3.5e+06 ++                        O O   OO                               =
 |
    3e+06 ++                 O         O    O                              =
 |
          |       O         O           O     O                            =
 |
  2.5e+06 ++                   O                                           =
 |
          |   O       O  O      O                                          =
 |
    2e+06 O+         O  O        O O                                       =
 |
          |O O  O   O      O                                               =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                            sched_debug.cpu.sched_goidle.7

    2e+06 ++---------------------------------------------------------------=
-+
  1.8e+06 ++     O                                                         =
 |
          |                         O O   OO                               =
 |
  1.6e+06 ++                 O         O    O                              =
 |
  1.4e+06 ++      O         O           O     O                            =
 |
          |                    O                                           =
 |
  1.2e+06 ++  O       O  O      O                                          =
 |
    1e+06 O+         O  O        O O                                       =
 |
   800000 +O O  O   O      O                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                             sched_debug.cpu.ttwu_count.7

  2.5e+06 ++---------------------------------------------------------------=
-+
          O       O                                                        =
 |
          |O     O           O                                             =
 |
    2e+06 ++ O  O   O O OO  O   O     O O  O  O                            =
 |
          |                O     O                                         =
 |
          |   O      O         O   OO  O  O O                              =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                          sched_debug.cfs_rq:_.exec_clock.7

  40000 ++-----------------------------------------------------------------=
-+
        **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**.**.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                           O O   OO                               =
 |
  10000 O+     O OOO OO   O OO OO  O   O O   O                             =
 |
        |O OO O         OO        O                                        =
 |
   5000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.min_vruntime.7

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   50000 OO OO OOO OO OOO OO OOO OO OOO OO OOO                             =
 |
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                            sched_debug.cpu.nr_switches.min

  3.5e+06 ++--------------------------O----O-------------------------------=
-+
          |                                                                =
 |
    3e+06 ++                        O  O  O O                              =
 |
          |                             O     O                            =
 |
  2.5e+06 ++      O                                                        =
 |
          |                    O                                           =
 |
    2e+06 O+     O    O     O   OO O                                       =
 |
          |O  O      O   O O O                                             =
 |
  1.5e+06 ++ O      O   O                                                  =
 |
          |     O                                                          =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                           sched_debug.cpu.nr_switches.avg

  6e+06 ++-----------------------------------------------------------------=
-+
        |     O                                                            =
 |
  5e+06 OO OO        O  OOO                                                =
 |
        |      O O    O     O  OO O                                        =
 |
        |         OO         O                                             =
 |
  4e+06 ++                         OO OO OOO O                             =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                         sched_debug.cpu.nr_load_updates.min

  40000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  38000 **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**.**.***.**.=
**
  36000 ++                                             *                   =
 |
        |                                                                  =
 |
  34000 ++                                                                 =
 |
        |                                                                  =
 |
  32000 ++                         OO O  OOO                               =
 |
        |                              O     O                             =
 |
  30000 ++  O    O O                                                       =
 |
  28000 ++     O  O       O                                                =
 |
        OO O         O   O                                                 =
 |
  26000 ++            O     OO O  O                                        =
 |
        |               O       O                                          =
 |
  24000 ++----O------------------------------------------------------------=
-+


                         sched_debug.cpu.nr_load_updates.avg

  41000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  40000 **.**.**.***.*   **.**.**.***.**.***.**.**.***  *.* *.**.**.***. *.=
**
        |             *.*                             : :  *            *  =
 |
  39000 ++                                            ::                   =
 |
        |                                              *                   =
 |
  38000 ++                                                                 =
 |
        |                                                                  =
 |
  37000 ++       O                 OO O  OOO                               =
 |
        |      O  OO                   O     O                             =
 |
  36000 ++                O O  O                                           =
 |
        |  OO        OO  O        O                                        =
 |
  35000 OO              O       O                                          =
 |
        |     O              O                                             =
 |
  34000 ++-----------------------------------------------------------------=
-+


                          sched_debug.cpu.cpu_load_0_.max

  120 ++-------*---------------------*------------*------------------------=
-+
      |        :                     :            :                        =
 |
  100 ++      ::                    ::           ::                        =
 |
      |       : :                   : :          : :                       =
 |
      |      :  :                  :  :         :  :                       =
 |
   80 *+ *   *  *.          *  *   *  *. *  *   *  *.                      =
 |
      |:+ :.*     *        : :+ :.*     * :+ :.*     *                     =
 |
   60 +*  *        :       : *  *         *  *       :  *                  =
 |
      |            *. *.***                           :+ *.***.**.**.**.**.=
**
   40 ++             *                                *                    =
 |
      |                                                                    =
 |
      |                                                                    =
 |
   20 ++ O  O         O O    O       OO   O O                              =
 |
      OO  O  O OO OO O   OO    OO OO    OO                                 =
 |
    0 ++--------------------O----------------------------------------------=
-+


                         sched_debug.cpu.cpu_load_0_.avg

  60 ++--------------------------------------------------------------------=
-+
     |        *                     *            *                         =
 |
  50 ++      : :                    :+           :+                        =
 |
     *       : *.*         *.      :  **.*      :  **                      =
 |
     |*.*   *     *.**.**.*  **.   *      **.   *    : *.    *.**          =
 |
  40 ++  *. :                   * +          * +     : : * .*    + *.**. * =
 *
     |     *                     *            *       *   *       *     * +=
 |
  30 ++                                                                    =
*|
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |O O  O   O O   O OO O  OO    OO O  OOO                               =
 |
   0 O+--O--O-O---O-O------O----OO-----O-----------------------------------=
-+


                         sched_debug.cpu.cpu_load_1_.max

  90 ++--------------------------------------------------------------------=
-+
     |        *                     *            *           *             =
 |
  80 ++      +:                     ::           ::          :             =
 |
  70 ++ *   *  :              *    * :     *    * :          ::            =
 |
     * +:   :  *.          *. ::  +   * .* ::  +   *         ::            =
 |
  60 +*  :.*     *         : * : *     *  * : *     *       : :            =
 |
  50 ++  *        :      .*     *            *       + *.**.:  : .**.  .* .=
**
     |            *.**.**                             *     *  **    **  * =
 |
  40 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
  10 ++ O                    O      O O   OO                               =
 |
     OO  O OO OO OO OO OO O   O OO O   O O                                 =
 |
   0 ++--------------------O-----------------------------------------------=
-+


                         sched_debug.cpu.cpu_load_1_.avg

  50 ++-------*---------------------*------------*-------------------------=
-+
  45 *+.*    + *.*         *. *.    : **.* *.    : **        *             =
 |
     |*  *. *     *.*    .*  *  * .*      *  * .*    : *.    :+            =
 |
  40 ++    *         *.**        *            *      : : * .*  **. *.**.*  =
 *
  35 ++                                               *   *       *      *.=
*|
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 OO O  O  O  O   O O  O  OO     O O   OO                               =
 |
   0 ++--O--O--O--O-O---O--O----OO-O---O-O---------------------------------=
-+


                         sched_debug.cpu.cpu_load_2_.max

  80 ++--------------------------------------------------------------------=
-+
     |  *                     *            *                 *             =
 |
  70 ++::                     ::           ::                :             =
 |
  60 *+: :  *.**.         **.: :  .**.* .*: :  .**.*         ::            =
 |
     |*  *.*     *       :   *  **     *  *  **     *       : :            =
 |
  50 ++           :      :                           + *.*  :  : .**.  .*  =
 *
     |            *.**.**                             *   *.*  **    **  *.=
*|
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++ O                           O     O                                =
 |
     OO  O OO OO OO OO OO OO OO OO O  OO O O                               =
 |
   0 ++--------------------------------------------------------------------=
-+


                         sched_debug.cpu.cpu_load_2_.avg

  50 ++--------------------------------------------------------------------=
-+
  45 *+.*   *.* .*        **. *.  .**. *.* *.  .**. *        *             =
 |
     |*  *.*   *  *.     +   *  **    *   *  **    * + *.*  * +       *.   =
 |
  40 ++             **.**                             *   :+   **.**.*  **.=
**
  35 ++                                                   *                =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 +O O  O  O  O   O O  O  OO O   O O   OO                               =
 |
   0 O+--O--O--O--O-O---O--O-----O-O---O-O---------------------------------=
-+


                         sched_debug.cpu.cpu_load_3_.max

  80 ++--------------------------------------------------------------------=
-+
     |  *                 *   *            *                               =
 |
  70 ++ ::                ::  :+           :+                              =
 |
  60 *+: *.**.**.        : *  : **.**.* .* : **.**.*         *             =
 |
     |::         *       :  +:         *  :         *        ::            =
 |
  50 +*           :     :    *            *          + *.* .* :    *.      =
 |
     |            *.**.**                             *   *    **.*  **.**.=
**
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++ O                       O   O     O                                =
 |
     OO  O OO OO OO OO OO OO OO  O O  OO O O                               =
 |
   0 ++--------------------------------------------------------------------=
-+


                         sched_debug.cpu.cpu_load_3_.avg

  50 ++-*---------------------*------------*-------------------------------=
-+
  45 *++ *.**.* .*        **. : **.**. *.* : **.**. *        *.            =
 |
     |*        *  *. *.  +   *        *   *        * + *.* .*  **.*   *.*  =
 *
  40 ++             *  **                             *   *        *.*   *.=
*|
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 ++ O                       O   O     O                                =
 |
   0 OO--O-OO-OO-OO-OO-OO-OO-OO--O-O--OO-O-O-------------------------------=
-+


                         sched_debug.cpu.cpu_load_4_.max

  90 ++--------------------------------------------------------------------=
-+
     |  *                 *   *.           *.                              =
 |
  80 ++ :*.   *           :   : *   *      : *   *                         =
 |
  70 ++:   * +:          : :  :  *. ::     :  *. ::                        =
 |
     * :    *  :         : *.:     * :  .*:     * :                        =
 |
  60 +*        *.*       :   *        **  *        **      .**             =
 |
  50 ++           :     :                            + *.**   +  .**.     .=
**
     |            *.**.**                             *        **    **.** =
 |
  40 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
  10 ++                                                                    =
 |
     O  OO OO OO O  OO OO OO OO OO OO OO OOO                               =
 |
   0 +O-----------O--------------------------------------------------------=
-+


                         sched_debug.cpu.cpu_load_4_.avg

  50 ++-*---------------------*------------*-------------------------------=
-+
  45 **  *.**.**.*        **.*  **.**.**.**  **.**.**        *.            =
 |
     |            *.**.* +                           + *.* .*  **.*   *.* .=
**
  40 ++                 *                             *   *        *.*   * =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 O+ OO                      O   O     O                                =
 |
   0 +O----OO-OO-OO-OO-OO-OO-OO--O-O--OO-O-O-------------------------------=
-+


                            sched_debug.cpu.sched_count.min

  3.5e+06 ++--------------------------O----O-------------------------------=
-+
          |                                                                =
 |
    3e+06 ++                        O  O  O O                              =
 |
          |                             O     O                            =
 |
  2.5e+06 ++      O                                                        =
 |
          |                    O                                           =
 |
    2e+06 O+     O    O     O   OO O                                       =
 |
          |O  O      O   O O O                                             =
 |
  1.5e+06 ++ O      O   O                                                  =
 |
          |     O                                                          =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                           sched_debug.cpu.sched_count.avg

  6e+06 ++-----------------------------------------------------------------=
-+
        |     O                                                            =
 |
  5e+06 OO OO        O  OOO O                                              =
 |
        |      O O    O        OO O                                        =
 |
        |         OO         O                                             =
 |
  4e+06 ++                         OO OO OOO O                             =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 **-**-**-***-**-***-**-**-***-**-***-**-**-***-**-***-**-**-***-**-=
**


                           sched_debug.cpu.sched_goidle.min

  1.8e+06 ++---------------------------------------------------------------=
-+
          |                           O    O                               =
 |
  1.6e+06 ++                        O  O  O O                              =
 |
  1.4e+06 ++                            O     O                            =
 |
          |                                                                =
 |
  1.2e+06 ++      O                                                        =
 |
    1e+06 O+     O    O     O  O O O                                       =
 |
          |O  O      O   O O O  O                                          =
 |
   800000 ++ O          O                                                  =
 |
   600000 ++    O   O                                                      =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                           sched_debug.cpu.sched_goidle.avg

    3e+06 ++---------------------------------------------------------------=
-+
          |     O                                                          =
 |
  2.5e+06 OO OO       O  O OO                                              =
 |
          |      OO     O    O  OO O                                       =
 |
          |         OO         O                                           =
 |
    2e+06 ++                        O OOO OOO O                            =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                            sched_debug.cpu.ttwu_count.max

  4.5e+06 ++---------------------------------------------------------------=
-+
          |O    O                                                          =
 |
    4e+06 O+          O  O O                                               =
 |
  3.5e+06 ++ OO             O   OO O                                       =
 |
          |      OO     O    O O                                           =
 |
    3e+06 ++        OO                                                     =
 |
  2.5e+06 ++                        O O   OO                               =
 |
          |                            OO   O O                            =
 |
    2e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                            sched_debug.cpu.ttwu_count.min

  1.6e+06 ++--O------------------------------------------------------------=
-+
          |                 O                                              =
 |
  1.4e+06 ++ O   OO                                                        =
 |
          OO             O             O    O                              =
 |
  1.2e+06 ++    O   OO  O  O O      O O O OO  O                            =
 |
    1e+06 ++          O        O                                           =
 |
          |                     OO O                                       =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                            sched_debug.cpu.ttwu_count.avg

    3e+06 ++---------------------------------------------------------------=
-+
          |     O                                                          =
 |
  2.5e+06 OO OO       O  O OO                                              =
 |
          |      OO     O    O  OO O                                       =
 |
          |         OO         O                                           =
 |
    2e+06 ++                        O OOO OOO O                            =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                           sched_debug.cpu.ttwu_count.stddev

  1.2e+06 ++---------------------------------------------------------------=
-+
          |     O                                                          =
 |
    1e+06 ++                                                               =
 |
          OO             O O                                               =
 |
          |  O        O         OO O                                       =
 |
   800000 ++  O         O                                                  =
 |
          |                 OO O                                           =
 |
   600000 ++     OO OO                                                     =
 |
          |                           O    O                               =
 |
   400000 ++                        O  O  O O                              =
 |
          |                             O     O                            =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 **-**-***-***-**-***-***-**-***-***-**-***-***-**-***-***-**-***-=
**


                         sched_debug.cfs_rq:_.exec_clock.max

  40000 **-**--*-***-**-***-**-**-*-*-**-***-**--*-***--*-***-**-**-***----=
-+
        |     *                    *            *      *                **.=
**
        |                                                                  =
 |
  35000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  20000 ++        OO  O                                                    =
 |
        O  O  OO     O         OO O                                        =
 |
        |O  O    O      OOO OO      O OO  OO O                             =
 |
  15000 ++-------------------------O-----O---------------------------------=
-+


                         sched_debug.cfs_rq:_.exec_clock.min

  40000 ++-----------------------------------------------------------------=
-+
        **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**.**.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                         OO OO OOO O                             =
 |
        OO OO OO OOO OO OOO OO OO O                                        =
 |
   5000 ++-----------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.exec_clock.avg

  40000 ++-----------------------------------------------------------------=
-+
        **.**.**.***.**.***.**.**.***.**.***.**.**.***. *.***.**.**.***.**.=
**
  35000 ++                                             *                   =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        OO OO OO OOO OO OOO OO OO OOO OO OOO O                             =
 |
  10000 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq:_.min_vruntime.max

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.* *.**.***.**.***.**.=
**
         |                                             *                   =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 O+        OO OO       O O                                         =
 |
         |O OO OOO      O OO OO   O OOO OO OOO                             =
 |
   50000 ++----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq:_.min_vruntime.min

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.***.**.***.**.***.**.=
**
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   50000 OO OO  OO OO OOO OO OOO OO OOO OO OOO                             =
 |
         |     O                                                           =
 |
       0 ++----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq:_.min_vruntime.avg

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 **.**.***.**.***.**.***.**.***.**.***.***.**.* *.**.***.**.***.**.=
**
         |                                             *                   =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |       O OO      O O      OOO OO OOO                             =
 |
   50000 OO-OO-OO-----OOO-O---OO-OO----------------------------------------=
-+


                      sched_debug.cfs_rq:_.min_vruntime.stddev

  18000 ++-----------------------------------------------------------------=
-+
        |     O    O                                                       =
 |
  16000 O+        O  O          O                                          =
 |
  14000 ++ OO         O OO     O  O                                        =
 |
        |        O        O O                                              =
 |
  12000 +O     O             O                                             =
 |
  10000 ++                                                                 =
 |
        |                              O     O                             =
 |
   8000 ++                         OO O  OOO                               =
 |
   6000 ++                                                                 =
 |
        |                                                                  =
 |
   4000 ++                                                                 =
 |
   2000 ++                                                                 =
 |
        **.**.**.** .**.***.**.**.***.**. **.**.**.** .**.***. *.**.***.**.=
**
      0 ++---------*---------------------*-----------*--------*------------=
-+


                         sched_debug.cfs_rq:_.spread0.stddev

  18000 ++-----------------------------------------------------------------=
-+
        |     O    O                                                       =
 |
  16000 O+        O  O          O                                          =
 |
  14000 ++ OO         O OO     O  O                                        =
 |
        |        O        O O                                              =
 |
  12000 +O     O             O                                             =
 |
  10000 ++                                                                 =
 |
        |                              O     O                             =
 |
   8000 ++                         OO O  OOO                               =
 |
   6000 ++                                                                 =
 |
        |                                                                  =
 |
   4000 ++                                                                 =
 |
   2000 ++                                                                 =
 |
        **.**.**.** .**.***.**.**.***.**. **.**.**.** .**.***. *.**.***.**.=
**
      0 ++---------*---------------------*-----------*--------*------------=
-+


                    sched_debug.cfs_rq:_.runnable_load_avg.max

  100 ++-----*---------------------*------------*--------------------------=
-+
   90 ++     :    *                :    *       :    *                     =
 |
      |      ::  ::                ::  : :      ::  ::                     =
 |
   80 *+ *  : :  ::         *  *  : :  : *  *  : :  ::                     =
 |
   70 +++ *.:  :*  :        ::+ *.:  :*   :+ *.:  :*  :                    =
 |
      |*    *  *   :       : *    *  *    *    *  *   :                    =
 |
   60 ++           :       :                          :.*        .*        =
 |
   50 ++           *. *.***                           *  *.***.**  *.**.**.=
**
   40 ++             *                                                     =
 |
      |                                                                    =
 |
   30 ++                                                                   =
 |
   20 ++ O                                                                 =
 |
      |     O   O       O    O  O O  OO O O O                              =
 |
   10 OO  O  O O  OO OO  OO O  O   O     O                                 =
 |
    0 ++-------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq:_.runnable_load_avg.avg

  55 ++--------------------------------------------------------------------=
-+
  50 ++         .*                     *.           *                      =
 |
     *  *   *  * :         *  *.   *  *  * *.   *  * +                     =
 |
  45 +++ *  :: :  :.**.   * + : * :: :    :: * :: :   * .* .**.**     *  *.=
 |
  40 +*   +: ::   *    * +   *   :: ::    *   :: ::    *  *      +    :+ : =
**
  35 ++    *  *         *        *  *         *  *                *  :  *  =
 |
  30 ++                                                            *.*     =
 |
     |                                                                     =
 |
  25 ++                                                                    =
 |
  20 ++                                                                    =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 OO OO OO OO OO OO OO OO OO OO OO OO OOO                               =
 |
   0 ++--------------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.util_avg.min

  450 ++-------------------------------------------------------------------=
-+
      |               *                                .**           *     =
 *
  400 **.*   *.*  **  :+  *.**.*   *.*  ***.*   *.*  **   :         : :.* .=
*|
  350 ++  *.*   :+  +:  **      *.*   :+     *.*   :+     : **.**.* : *  * =
 |
      |         *    *                *            *       *       *       =
 |
  300 ++                                                                   =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 ++       O                                                           =
 |
  150 ++                             O    O                                =
 |
      OO  O     O O  O       O O                                           =
 |
  100 ++ O  O         O  OO O   O OO  O OO  O                              =
 |
   50 ++     O     O                                                       =
 |
      |                 O                                                  =
 |
    0 ++-------------------------------------------------------------------=
-+


                         sched_debug.cfs_rq:_.util_avg.avg

  550 ++-------------------------------------------------------------------=
-+
      |                                                     *              =
 |
  500 ++              *.  *                              *. :*            .=
*|
  450 +*.**.**.*   *.*  ** + *.**.**.*    *.**.**.*    .*  *  + *.**.**. * =
 *
      *         *.*         *         *.**         *.**        *        *  =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  350 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
  250 O+  O                     O                                          =
 |
      |O O   O OO O  OO O O  O O  OO OO OOO O                              =
 |
  200 ++    O      O     O                                                 =
 |
      |                                                                    =
 |
  150 ++--------------------O----------------------------------------------=
-+


                          sched_debug.cpu.cpu_load_2_.7

  50 ++-----*----------------------*------------*--------------------------=
-+
     |*.    : **.*        * .*    + *.**. *    + *.**  *.            *     =
 |
     *  **.*      *.  .* + *  *.**       * *.**      : : **.**.**.   :*.   =
 *
  40 ++             **  *                            : :          * :   *  =
 |
     |                                                :           : :   :  =
:|
     |                                                *            :    :  =
*|
  30 ++                                                            *     : =
:|
     |                                                                   ::=
 |
  20 ++                                                                  ::=
 |
     |                                                                   * =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
     |O    O     O     OO  O O        O    O                               =
 |
   0 O+-OO--O-OO--O-OO----O---O-OO-OO--O-OO--------------------------------=
-+


                         sched_debug.cpu.cpu_load_4_.min

  42 ++--------------------------------------------------------------------=
-+
     |        *  *                  *  *.        *  *        *  *          =
 |
  40 **.  .*  :  :*       **.*   *  :  : **   *  :  :: *.    :+ :+    *.   =
 |
  38 ++ ** : ::  : + *.   :   *.* : :  :   *.* : :  :: : *  *  *  *   : *  =
 |
     |      ::: :   *  *  :       :: : :       :: : : :  :  :     :   : :  =
 *
  36 ++     * : :      :  :        * : :        * : : *  :  :     :  :   : =
*|
  34 ++        ::      : :           ::           ::     : :      :  :   :+=
 |
     |         ::      : :           ::           ::     : :      :  *   * =
 |
  32 ++        :       : :            :            :      ::       : :     =
 |
  30 ++        :        ::            :            :      ::       ::      =
 |
     |         *        ::            *            *      ::       ::      =
 |
  28 ++                 ::                                :        ::      =
 |
  26 ++                 :                                 :        :       =
 |
     |                  :                                 *        *       =
 |
  24 ++-----------------*--------------------------------------------------=
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

--===============6623582538503665468==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogY2I0YmJjNDU3
YmZlZDYxOTRmZmFiMWIxMGM3YmU3M2IzZjE2Y2EyZAptb2RlbDogSXZ5IEJyaWRnZQpucl9jcHU6
IDgKbWVtb3J5OiAxNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDAKaGRkX3BhcnRpdGlvbnM6IApuZXRj
b25zb2xlX3BvcnQ6IDY2NzIKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90YXNrOiAxMDAlCnVuaXhi
ZW5jaDoKICB0ZXN0OiBmc3RpbWUKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3AtaXZiLWQwMQp0
Ym94X2dyb3VwOiBsa3AtaXZiLWQwMQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6
IDIwMTYtMDEtMjIgMDE6MDg6MTEuNjI0MzA2MDYzICswODowMAppZDogMzZmMjU2MjAxMjY0NTZk
ZmU4MzQ0NzgxZWViYmJhZGYyOGZkYTFkYQp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVh
ZF9jb21taXQ6IDU4NGRkMWMwZDljZDQ0NGExYTcyNzQ0ZDU5MGQ5NDNjMmQyMzRmZDMKYmFzZV9j
b21taXQ6IGFmZDJmZjliN2UxYjM2NzE3MmYxOGJhN2Y2OTNkZmI2MmJkY2IyZGMKYnJhbmNoOiBs
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAxMjExOApyb290ZnM6IGRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3VuaXhiZW5jaC9wZXJmb3JtYW5j
ZS0xMDAlLWZzdGltZS9sa3AtaXZiLWQwMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvY2I0YmJjNDU3YmZlZDYxOTRmZmFiMWIxMGM3YmU3M2IzZjE2Y2Ey
ZC8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1pdmItZDAxL2Jpc2VjdF91bml4YmVu
Y2gtcGVyZm9ybWFuY2UtMTAwJS1mc3RpbWUtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14
ODZfNjQtcmhlbC1jYjRiYmM0NTdiZmVkNjE5NGZmYWIxYjEwYzdiZTczYjNmMTZjYTJkLTIwMTYw
MTIyLTM5NTk1LTFxcmsxaDQtMC55YW1sIgptYXhfdXB0aW1lOiA5MzkuMDYwMDAwMDAwMDAwMQpp
bml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9v
dGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3Nj
aGVkdWxlZC9sa3AtaXZiLWQwMS9iaXNlY3RfdW5peGJlbmNoLXBlcmZvcm1hbmNlLTEwMCUtZnN0
aW1lLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtY2I0YmJjNDU3YmZl
ZDYxOTRmZmFiMWIxMGM3YmU3M2IzZjE2Y2EyZC0yMDE2MDEyMi0zOTU5NS0xcXJrMWg0LTAueWFt
bAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZl
bC9kZXZlbC1ob3VybHktMjAxNjAxMjExOAotIGNvbW1pdD1jYjRiYmM0NTdiZmVkNjE5NGZmYWIx
YjEwYzdiZTczYjNmMTZjYTJkCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvY2I0YmJjNDU3YmZlZDYxOTRmZmFiMWIxMGM3YmU3M2IzZjE2Y2EyZC92bWxpbnV6LTQu
NC4wLTA1ODg5LWdjYjRiYmM0Ci0gbWF4X3VwdGltZT05MzkKLSBSRVNVTFRfUk9PVD0vcmVzdWx0
L3VuaXhiZW5jaC9wZXJmb3JtYW5jZS0xMDAlLWZzdGltZS9sa3AtaXZiLWQwMS9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvY2I0YmJjNDU3YmZlZDYxOTRm
ZmFiMWIxMGM3YmU3M2IzZjE2Y2EyZC8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5
cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRl
YnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0x
MDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9
cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1
MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9s
a3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvY2I0YmJjNDU3YmZlZDYxOTRmZmFiMWIxMGM3YmU3M2IzZjE2Y2EyZC9tb2R1bGVzLmNn
eiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1p
cGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1
cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtz
L3VuaXhiZW5jaC5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45L2NiNGJiYzQ1N2JmZWQ2MTk0ZmZhYjFiMTBjN2JlNzNiM2YxNmNhMmQvbGlu
dXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvY2I0YmJjNDU3YmZlZDYxOTRmZmFiMWIxMGM3YmU3M2IzZjE2Y2EyZC92bWxp
bnV6LTQuNC4wLTA1ODg5LWdjYjRiYmM0IgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDEtMjIgMDE6MTM6
MzcuMjQ1NjkzNDQ3ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDUuNDUgMi4y
MyAwLjg0IDEvMTY0IDI4NTEKc3RhcnRfdGltZTogJzE0NTMzOTY0NDUnCmVuZF90aW1lOiAnMTQ1
MzM5NjU4OScKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAxMjEtMTgwMjA2Igo=

--===============6623582538503665468==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0yMiAwMToxNDowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yMiAwMToxNDowNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yMiAwMToxNDowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
MS0yMiAwMToxNDowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yMiAwMToxNDowNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0yMiAwMToxNDowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yMiAw
MToxNDowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yMiAwMToxNDowNCBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0yMiAwMToxNDowNSAuL1J1biBmc3RpbWUgLWMgOAo=

--===============6623582538503665468==--

