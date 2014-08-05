Content-Type: multipart/mixed; boundary="===============6115591354969672300=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 49df457a977: +65.9% hackbench.throughput
Date: Tue, 05 Aug 2014 16:23:40 +0800
Message-ID: <20140805082340.GA11210@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6115591354969672300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v5.1-on-3.16-rc5
commit 49df457a977e6c0e3f43fb9269a058c724282d60 ("sched: Rewrite per entity=
 runnable load average tracking")

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    152082 =C2=B1 2%     +58.8%     241578 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     81835 =C2=B1 0%     +78.9%     146423 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
    233917 =C2=B1 2%     +65.9%     388001 =C2=B1 0%  TOTAL hackbench.throu=
ghput

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  4.37e+08 =C2=B1 0%     -14.9%  3.717e+08 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
  4.37e+08 =C2=B1 0%     -14.9%  3.717e+08 =C2=B1 0%  TOTAL pigz.throughput

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     10.56 =C2=B1 6%    -100.0%       0.00 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
     10.56 =C2=B1 6%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles.update_cfs_rq_blocked_load.task_tick_fair.scheduler_tick.update_pr=
ocess_times.tick_sched_handle

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.82 =C2=B1 0%    +948.1%       8.64 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
      0.82 =C2=B1 0%    +948.1%       8.64 =C2=B1 1%  TOTAL turbostat.%c3







55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     63216 =C2=B1 2%     -95.3%       2992 =C2=B147%  lkp-snb01/hackbench/1=
600%-process-pipe
     63879 =C2=B1 2%     -94.8%       3335 =C2=B121%  lkp-snb01/hackbench/5=
0%-threads-socket
    127096 =C2=B1 2%     -95.0%       6328 =C2=B133%  TOTAL numa-vmstat.nod=
e0.numa_other

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5863 =C2=B122%    +543.7%      37747 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
     11294 =C2=B111%    +531.6%      71342 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
     10341 =C2=B118%    +581.5%      70471 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     27499 =C2=B116%    +553.0%     179560 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_other

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.69 =C2=B132%     -88.1%       0.08 =C2=B120%  lkp-nex06/pigz/100%-1=
28K
      0.69 =C2=B132%     -88.1%       0.08 =C2=B120%  TOTAL perf-profile.cp=
u-cycles.ktime_get_update_offsets.hrtimer_interrupt.local_apic_timer_interr=
upt.smp_apic_timer_interrupt.apic_timer_interrupt

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   2304326 =C2=B1 9%    +895.7%   22944148 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
   2304326 =C2=B1 9%    +895.7%   22944148 =C2=B1 3%  TOTAL cpuidle.C3-SNB.=
time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.95 =C2=B112%     -84.0%       0.15 =C2=B1 8%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.95 =C2=B112%     -84.0%       0.15 =C2=B1 8%  TOTAL perf-profile.cp=
u-cycles.__schedule.schedule_user.sysret_careful.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.70 =C2=B113%    +347.0%       3.14 =C2=B1 7%  lkp-nex06/pigz/100%-1=
28K
      0.70 =C2=B113%    +347.0%       3.14 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.mutex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.pipe_read.new=
_sync_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.20 =C2=B121%    +400.0%       1.01 =C2=B1 7%  lkp-nex06/pigz/100%-1=
28K
      0.20 =C2=B121%    +400.0%       1.01 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.mutex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.pipe_wait.pip=
e_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      6.23 =C2=B1 2%     -77.7%       1.39 =C2=B1 9%  lkp-snb01/hackbench/5=
0%-threads-socket
      6.23 =C2=B1 2%     -77.7%       1.39 =C2=B1 9%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_s=
tream_sendmsg.sock_aio_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.70 =C2=B115%    +351.0%       3.17 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
      0.70 =C2=B115%    +351.0%       3.17 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_idle_loop.cpu_sta=
rtup_entry

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.64 =C2=B133%     -76.5%       0.15 =C2=B117%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.64 =C2=B133%     -76.5%       0.15 =C2=B117%  TOTAL perf-profile.cp=
u-cycles.effective_load.isra.39.select_task_rq_fair.try_to_wake_up.default_=
wake_function.autoremove_wake_function

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.11 =C2=B1 7%    +270.2%       0.42 =C2=B110%  lkp-nex06/pigz/100%-1=
28K
      0.11 =C2=B1 7%    +270.2%       0.42 =C2=B110%  TOTAL turbostat.%pc3

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      4040 =C2=B114%     -67.3%       1322 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
     26396 =C2=B1 4%    +717.5%     215780 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
     30436 =C2=B1 5%    +613.3%     217103 =C2=B1 3%  TOTAL cpuidle.C3-SNB.=
usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3.15 =C2=B1 5%     -70.3%       0.93 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
      3.15 =C2=B1 5%     -70.3%       0.93 =C2=B110%  TOTAL turbostat.%c7

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.11 =C2=B145%     -80.9%       0.40 =C2=B1 8%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.45 =C2=B1 6%     -68.5%       0.46 =C2=B1 7%  lkp-snb01/hackbench/5=
0%-threads-socket
      3.56 =C2=B129%     -75.9%       0.86 =C2=B1 8%  TOTAL perf-profile.cp=
u-cycles.idle_cpu.select_task_rq_fair.try_to_wake_up.default_wake_function.=
autoremove_wake_function

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     49554 =C2=B1 4%     +34.5%      66654 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
    329712 =C2=B1 3%    +722.2%    2710783 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
    379266 =C2=B1 3%    +632.3%    2777437 =C2=B1 1%  TOTAL cpuidle.C7-SNB.=
usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.29 =C2=B128%     -51.9%       0.62 =C2=B123%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.41 =C2=B1 9%     -75.7%       0.34 =C2=B1 8%  lkp-snb01/hackbench/5=
0%-threads-socket
      2.70 =C2=B118%     -64.3%       0.96 =C2=B118%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wak=
e_function.__wake_up_common

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 2.159e+08 =C2=B1 3%    +368.3%  1.011e+09 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 7.508e+08 =C2=B1 2%     +49.4%  1.122e+09 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
 9.667e+08 =C2=B1 2%    +120.6%  2.133e+09 =C2=B1 0%  TOTAL cpuidle.C1-SNB.=
time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.01 =C2=B1 4%     -65.5%       0.35 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.01 =C2=B1 4%     -65.5%       0.35 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.__schedule.schedule.schedule_timeout.unix_stream_recvmsg.sock_aio_=
read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.15 =C2=B1 9%     -62.8%       0.43 =C2=B1 7%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.15 =C2=B1 9%     -62.8%       0.43 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.__switch_to.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 8.468e+08 =C2=B1 5%     -53.0%  3.981e+08 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
  91769773 =C2=B121%    +267.1%  3.369e+08 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
 9.386e+08 =C2=B1 6%     -21.7%   7.35e+08 =C2=B1 3%  TOTAL cpuidle.C7-SNB.=
time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.08 =C2=B116%     -65.1%       0.38 =C2=B1 8%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.08 =C2=B116%     -65.1%       0.38 =C2=B1 8%  TOTAL perf-profile.cp=
u-cycles.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremov=
e_wake_function.__wake_up_common

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.43 =C2=B1 1%    +553.3%      15.87 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
      2.63 =C2=B1 3%    +177.2%       7.29 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      4.54 =C2=B1 2%     +69.9%       7.72 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.17 =C2=B1 2%     +19.3%       0.20 =C2=B1 8%  xps2/pigz/100%-128K
      9.77 =C2=B1 2%    +218.1%      31.08 =C2=B1 1%  TOTAL turbostat.%c1

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  5.34e+08 =C2=B1 1%    +753.1%  4.555e+09 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
    338506 =C2=B119%     +43.3%     484919 =C2=B1 9%  xps2/pigz/100%-128K
    357641 =C2=B120%     +40.6%     502909 =C2=B119%  xps2/pigz/100%-512K
 5.347e+08 =C2=B1 1%    +752.1%  4.556e+09 =C2=B1 1%  TOTAL cpuidle.C3-NHM.=
time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.40 =C2=B124%     -65.2%       0.83 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.40 =C2=B124%     -65.2%       0.83 =C2=B1 9%  TOTAL perf-profile.cp=
u-cycles.__schedule.schedule.pipe_wait.pipe_read.new_sync_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  62967702 =C2=B1 1%    +150.8%  1.579e+08 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
  62967702 =C2=B1 1%    +150.8%  1.579e+08 =C2=B1 1%  TOTAL cpuidle.C1E-NHM=
.time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       441 =C2=B111%    +143.3%       1075 =C2=B123%  lkp-nex06/pigz/100%-1=
28K
       238 =C2=B111%    +161.3%        623 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
       332 =C2=B1 6%     +92.8%        640 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
      1012 =C2=B1 9%    +131.0%       2338 =C2=B114%  TOTAL slabinfo.nfs_re=
ad_data.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       441 =C2=B111%    +143.3%       1075 =C2=B123%  lkp-nex06/pigz/100%-1=
28K
       238 =C2=B111%    +161.3%        623 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
       332 =C2=B1 6%     +92.8%        640 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
      1012 =C2=B1 9%    +131.0%       2338 =C2=B114%  TOTAL slabinfo.nfs_re=
ad_data.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.44 =C2=B1 3%     -57.7%       0.61 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.44 =C2=B1 3%     -57.7%       0.61 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.__switch_to

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  30431707 =C2=B110%    +149.9%   76054788 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
  30431707 =C2=B110%    +149.9%   76054788 =C2=B1 2%  TOTAL numa-vmstat.nod=
e0.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1237793 =C2=B1 1%    +221.2%    3976158 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
       525 =C2=B1 8%     +36.3%        715 =C2=B1 4%  xps2/pigz/100%-128K
   1238318 =C2=B1 1%    +221.2%    3976874 =C2=B1 1%  TOTAL cpuidle.C3-NHM.=
usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
        12 =C2=B134%    +243.8%         44 =C2=B111%  lkp-nex06/pigz/100%-1=
28K
      1161 =C2=B1 6%     -17.4%        959 =C2=B1 7%  lkp-snb01/hackbench/5=
0%-threads-socket
      1174 =C2=B1 6%     -14.6%       1003 =C2=B1 7%  TOTAL cpuidle.POLL.us=
age

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     37122 =C2=B135%    +273.9%     138803 =C2=B124%  lkp-snb01/hackbench/1=
600%-process-pipe
      8772 =C2=B1 1%     +59.2%      13962 =C2=B1 7%  lkp-snb01/hackbench/5=
0%-threads-socket
     45894 =C2=B129%    +232.9%     152766 =C2=B123%  TOTAL numa-meminfo.no=
de0.KernelStack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  21214660 =C2=B1 2%     -68.2%    6742903 =C2=B115%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.039e+08 =C2=B1 3%     -22.9%   80151817 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
 1.252e+08 =C2=B1 2%     -30.6%   86894721 =C2=B1 1%  TOTAL cpuidle.C1-SNB.=
usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2338 =C2=B135%    +273.0%       8720 =C2=B123%  lkp-snb01/hackbench/1=
600%-process-pipe
       547 =C2=B1 1%     +59.3%        872 =C2=B1 7%  lkp-snb01/hackbench/5=
0%-threads-socket
      2886 =C2=B128%    +232.4%       9593 =C2=B121%  TOTAL numa-vmstat.nod=
e0.nr_kernel_stack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.80 =C2=B145%     -69.7%       0.24 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.80 =C2=B145%     -69.7%       0.24 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wa=
ke_up_common.__wake_up_sync_key

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       438 =C2=B1 9%    +104.7%        897 =C2=B1 5%  lkp-nex06/pigz/100%-1=
28K
       336 =C2=B1 7%    +106.1%        693 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
       346 =C2=B111%     +94.1%        673 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
      1122 =C2=B1 9%    +101.8%       2264 =C2=B1 5%  TOTAL slabinfo.mnt_ca=
che.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       438 =C2=B1 9%    +104.7%        897 =C2=B1 5%  lkp-nex06/pigz/100%-1=
28K
       336 =C2=B1 7%    +106.1%        693 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
       346 =C2=B111%     +94.1%        673 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
      1122 =C2=B1 9%    +101.8%       2264 =C2=B1 5%  TOTAL slabinfo.mnt_ca=
che.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  10403035 =C2=B1 6%    +187.4%   29899077 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    686033 =C2=B1 3%     +26.5%     868030 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
  11089068 =C2=B1 6%    +177.5%   30767107 =C2=B1 2%  TOTAL proc-vmstat.pga=
lloc_dma32

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       302 =C2=B1 0%     +97.2%        597 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
       302 =C2=B1 0%     +97.2%        597 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-256.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       302 =C2=B1 0%     +97.2%        597 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
       302 =C2=B1 0%     +97.2%        597 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-256.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8.60 =C2=B1 4%     -49.0%       4.38 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
      8.60 =C2=B1 4%     -49.0%       4.38 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_hand=
le.tick_sched_timer

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  53048396 =C2=B1 6%    +186.7%  1.521e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    973526 =C2=B1 2%     +14.4%    1114006 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
  54021922 =C2=B1 6%    +183.6%  1.532e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode0.local_node

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  53049243 =C2=B1 6%    +186.7%  1.521e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    975207 =C2=B1 2%     +14.6%    1117775 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
  54024451 =C2=B1 6%    +183.6%  1.532e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode0.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19892 =C2=B1 0%     +95.4%      38869 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     19892 =C2=B1 0%     +95.4%      38869 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-512.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     14811 =C2=B1 0%     +95.8%      29006 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     14811 =C2=B1 0%     +95.8%      29006 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-256.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       310 =C2=B1 0%     +95.6%        606 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
       310 =C2=B1 0%     +95.6%        606 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-512.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       310 =C2=B1 0%     +95.6%        606 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
       310 =C2=B1 0%     +95.6%        606 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-512.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     76814 =C2=B125%    +207.8%     236402 =C2=B122%  lkp-snb01/hackbench/1=
600%-process-pipe
     41043 =C2=B1 3%     +33.2%      54656 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
    117858 =C2=B117%    +147.0%     291059 =C2=B119%  TOTAL numa-meminfo.no=
de0.SUnreclaim

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19322 =C2=B124%    +206.9%      59299 =C2=B121%  lkp-snb01/hackbench/1=
600%-process-pipe
     10264 =C2=B1 3%     +33.1%      13662 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
     29586 =C2=B117%    +146.6%      72961 =C2=B118%  TOTAL numa-vmstat.nod=
e0.nr_slab_unreclaimable

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  21990854 =C2=B1 3%     +91.1%   42026612 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
  21990854 =C2=B1 3%     +91.1%   42026612 =C2=B1 1%  TOTAL cpuidle.C1-NHM.=
time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     15609 =C2=B1 0%     +90.9%      29798 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     15609 =C2=B1 0%     +90.9%      29798 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-512.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.74 =C2=B1 2%     +81.9%       1.35 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.74 =C2=B1 2%     +81.9%       1.35 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.system_call

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.83 =C2=B111%     +71.9%       1.43 =C2=B1 8%  lkp-nex06/pigz/100%-1=
28K
      0.83 =C2=B111%     +71.9%       1.43 =C2=B1 8%  TOTAL perf-profile.cp=
u-cycles.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_tim=
es.tick_sched_handle

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     17139 =C2=B1 3%     -51.5%       8312 =C2=B120%  lkp-snb01/hackbench/1=
600%-process-pipe
       733 =C2=B1 1%     -42.3%        423 =C2=B115%  lkp-snb01/hackbench/5=
0%-threads-socket
     17873 =C2=B1 3%     -51.1%       8735 =C2=B120%  TOTAL numa-vmstat.nod=
e1.nr_kernel_stack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    274323 =C2=B1 3%     -51.4%     133375 =C2=B121%  lkp-snb01/hackbench/1=
600%-process-pipe
     11756 =C2=B1 0%     -42.3%       6784 =C2=B114%  lkp-snb01/hackbench/5=
0%-threads-socket
    286079 =C2=B1 3%     -51.0%     140159 =C2=B121%  TOTAL numa-meminfo.no=
de1.KernelStack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.61 =C2=B1 5%     +71.7%       1.05 =C2=B116%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.61 =C2=B1 5%     +71.7%       1.05 =C2=B116%  TOTAL perf-profile.cp=
u-cycles.__fget.__fget_light.__fdget_pos.sys_read.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.62 =C2=B1 2%     +76.7%       1.09 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.62 =C2=B1 2%     +76.7%       1.09 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.system_call_after_swapgs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    101782 =C2=B118%    +157.1%     261679 =C2=B120%  lkp-snb01/hackbench/1=
600%-process-pipe
     61937 =C2=B1 3%     +22.6%      75955 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-threads-socket
    163719 =C2=B112%    +106.2%     337635 =C2=B117%  TOTAL numa-meminfo.no=
de0.Slab

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.17 =C2=B1 4%     +75.7%       2.06 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.17 =C2=B1 4%     +75.7%       2.06 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.skb_copy_datagram_from_iovec.unix_stream_=
sendmsg.sock_aio_write.do_sync_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  30368489 =C2=B111%    +150.4%   76051795 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    640255 =C2=B1 2%     +18.7%     759830 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
  31008744 =C2=B110%    +147.7%   76811625 =C2=B1 2%  TOTAL numa-vmstat.nod=
e0.numa_local

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.04 =C2=B1 1%     +74.1%       1.81 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.04 =C2=B1 1%     +74.1%       1.81 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.__alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_writ=
e.do_sync_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  76785252 =C2=B110%    +140.7%  1.848e+08 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.162e+08 =C2=B1 5%     -16.7%   96778716 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
  1.93e+08 =C2=B1 7%     +45.9%  2.816e+08 =C2=B1 5%  TOTAL cpuidle.C1E-SNB=
.time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
        66 =C2=B1 8%     -41.0%         39 =C2=B122%  xps2/pigz/100%-128K
        66 =C2=B1 8%     -41.0%         39 =C2=B122%  TOTAL cpuidle.C1-NHM.=
usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    101194 =C2=B1 2%     -42.7%      58014 =C2=B116%  lkp-snb01/hackbench/1=
600%-process-pipe
    101194 =C2=B1 2%     -42.7%      58014 =C2=B116%  TOTAL numa-vmstat.nod=
e1.nr_page_table_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       669 =C2=B1 5%    +109.7%       1404 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
       662 =C2=B1 7%     +63.0%       1080 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1991 =C2=B1 2%     +50.9%       3004 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
      3323 =C2=B1 4%     +65.2%       5488 =C2=B1 4%  TOTAL slabinfo.RAW.nu=
m_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    220620 =C2=B1 5%     +28.6%     283650 =C2=B1 6%  lkp-snb01/hackbench/1=
600%-process-pipe
   2811067 =C2=B1 2%     -51.8%    1354069 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
   3031688 =C2=B1 2%     -46.0%    1637720 =C2=B1 5%  TOTAL cpuidle.C1E-SNB=
.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       669 =C2=B1 5%    +109.7%       1404 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
       662 =C2=B1 7%     +63.0%       1080 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1990 =C2=B1 2%     +42.6%       2837 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
      3322 =C2=B1 4%     +60.2%       5321 =C2=B1 4%  TOTAL slabinfo.RAW.ac=
tive_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     14666 =C2=B122%     -24.9%      11016 =C2=B123%  lkp-snb01/hackbench/5=
0%-threads-socket
     14666 =C2=B122%     -24.9%      11016 =C2=B123%  TOTAL numa-vmstat.nod=
e0.nr_active_file

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     58664 =C2=B122%     -24.9%      44067 =C2=B123%  lkp-snb01/hackbench/5=
0%-threads-socket
     58664 =C2=B122%     -24.9%      44067 =C2=B123%  TOTAL numa-meminfo.no=
de0.Active(file)

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    405352 =C2=B1 2%     -41.2%     238526 =C2=B115%  lkp-snb01/hackbench/1=
600%-process-pipe
    405352 =C2=B1 2%     -41.2%     238526 =C2=B115%  TOTAL numa-meminfo.no=
de1.PageTables

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       258 =C2=B1 1%     -37.3%        162 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
       258 =C2=B1 1%     -37.3%        162 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-192.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       258 =C2=B1 1%     -37.3%        162 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
       258 =C2=B1 1%     -37.3%        162 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-192.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.73 =C2=B1 3%     +61.8%       1.18 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.73 =C2=B1 3%     +61.8%       1.18 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__pthread_disable_asynccancel.start_thread

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.21 =C2=B118%     +56.9%       1.90 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.60 =C2=B1 3%     +76.9%       1.06 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.81 =C2=B113%     +63.5%       2.96 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__srcu_read_unlock.fsnotify.vfs_write.sys_write.system_call_fastpa=
th

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.46 =C2=B118%     +56.0%       2.27 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.74 =C2=B1 4%     +74.1%       1.29 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      2.20 =C2=B113%     +62.1%       3.56 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.31 =C2=B115%     +51.8%       1.98 =C2=B114%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.31 =C2=B115%     +51.8%       1.98 =C2=B114%  TOTAL perf-profile.cp=
u-cycles.vfs_write.sys_write.system_call_fastpath.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.74 =C2=B115%     +53.3%       1.13 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.74 =C2=B115%     +53.3%       1.13 =C2=B110%  TOTAL perf-profile.cp=
u-cycles.system_call_after_swapgs.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.08 =C2=B111%     +38.0%       1.49 =C2=B114%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.08 =C2=B111%     +38.0%       1.49 =C2=B114%  TOTAL perf-profile.cp=
u-cycles.selinux_file_permission.security_file_permission.rw_verify_area.vf=
s_read.sys_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.07 =C2=B120%     +46.4%       3.03 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.94 =C2=B119%     +75.2%       1.64 =C2=B113%  lkp-snb01/hackbench/5=
0%-threads-socket
      3.00 =C2=B120%     +55.4%       4.67 =C2=B111%  TOTAL perf-profile.cp=
u-cycles.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.=
security_file_permission

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.82 =C2=B113%     +44.7%       1.18 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.82 =C2=B113%     +44.7%       1.18 =C2=B110%  TOTAL perf-profile.cp=
u-cycles.file_update_time.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    273566 =C2=B1 1%     +40.4%     384149 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
    322081 =C2=B1 4%     -63.1%     118798 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   2257437 =C2=B1 2%     -26.0%    1671000 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     18041 =C2=B1 1%     -15.6%      15233 =C2=B1 3%  xps2/pigz/100%-128K
     17691 =C2=B1 1%     -12.6%      15460 =C2=B1 1%  xps2/pigz/100%-512K
   2888818 =C2=B1 2%     -23.7%    2204642 =C2=B1 0%  TOTAL softirqs.SCHED

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.77 =C2=B1 4%     +56.9%       1.20 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.77 =C2=B1 4%     +56.9%       1.20 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.sock_all=
oc_send_pskb.unix_stream_sendmsg

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   2336851 =C2=B1 2%     -36.7%    1479825 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
   2336851 =C2=B1 2%     -36.7%    1479825 =C2=B112%  TOTAL numa-meminfo.no=
de1.MemUsed

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     12660 =C2=B1 6%     -13.4%      10957 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
     19407 =C2=B1 0%     +97.0%      38234 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     32068 =C2=B1 2%     +53.4%      49191 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-256.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.02 =C2=B116%     +49.0%       1.52 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.02 =C2=B116%     +49.0%       1.52 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.new_sync_read.vfs_read.sys_read.system_call_fastpath.__read_nocanc=
el

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.63 =C2=B115%     +54.1%       0.97 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.63 =C2=B115%     +54.1%       0.97 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles.mutex_lock.pipe_read.new_sync_read.vfs_read.sys_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.77 =C2=B1 8%     +64.2%       1.27 =C2=B1 9%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.77 =C2=B1 8%     +64.2%       1.27 =C2=B1 9%  TOTAL perf-profile.cp=
u-cycles.kmem_cache_alloc_node.__alloc_skb.sock_alloc_send_pskb.unix_stream=
_sendmsg.sock_aio_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.07 =C2=B118%     +56.4%       1.68 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.07 =C2=B118%     +56.4%       1.68 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__sb_end_write.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     17082 =C2=B1 2%     +31.7%      22504 =C2=B115%  lkp-nex06/pigz/100%-1=
28K
    444139 =C2=B1 4%     -47.5%     233233 =C2=B119%  lkp-snb01/hackbench/1=
600%-process-pipe
    461221 =C2=B1 4%     -44.6%     255738 =C2=B119%  TOTAL numa-meminfo.no=
de1.SUnreclaim

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      4270 =C2=B1 2%     +31.7%       5625 =C2=B115%  lkp-nex06/pigz/100%-1=
28K
    110967 =C2=B1 3%     -47.9%      57811 =C2=B119%  lkp-snb01/hackbench/1=
600%-process-pipe
    115237 =C2=B1 3%     -45.0%      63437 =C2=B118%  TOTAL numa-vmstat.nod=
e1.nr_slab_unreclaimable

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.64 =C2=B1 4%     +50.8%       0.97 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.64 =C2=B1 4%     +50.8%       0.97 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.skb_unlink.unix_stream_recvmsg.sock_aio_rea=
d.sock_aio_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.81 =C2=B118%     +57.4%       1.27 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.81 =C2=B118%     +57.4%       1.27 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.system_call.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.96 =C2=B116%     +58.9%       1.52 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.96 =C2=B116%     +58.9%       1.52 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.new_sync_write.vfs_write.sys_write.system_call_fastpath.__write_no=
cancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     75285 =C2=B117%     -20.0%      60243 =C2=B119%  lkp-snb01/hackbench/5=
0%-threads-socket
     75285 =C2=B117%     -20.0%      60243 =C2=B119%  TOTAL numa-meminfo.no=
de0.Active

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    258391 =C2=B1 1%     +52.0%     392803 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
    258391 =C2=B1 1%     +52.0%     392803 =C2=B1 0%  TOTAL cpuidle.C1E-NHM=
.usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    105594 =C2=B1 1%     -33.1%      70680 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
    105594 =C2=B1 1%     -33.1%      70680 =C2=B112%  TOTAL numa-vmstat.nod=
e1.nr_anon_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    105548 =C2=B1 1%     -33.0%      70702 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
    105548 =C2=B1 1%     -33.0%      70702 =C2=B112%  TOTAL numa-vmstat.nod=
e1.nr_active_anon

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.13 =C2=B113%     +46.6%       1.66 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.63 =C2=B1 3%     +49.7%       0.94 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.76 =C2=B1 9%     +47.7%       2.60 =C2=B1 9%  TOTAL perf-profile.cp=
u-cycles.selinux_file_permission.security_file_permission.rw_verify_area.vf=
s_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.80 =C2=B119%     +56.1%       1.25 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.80 =C2=B119%     +56.1%       1.25 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.system_call.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3907 =C2=B1 1%    +107.9%       8122 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      2094 =C2=B1 7%     +14.3%       2393 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      2184 =C2=B1 1%     +20.5%       2631 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
      8185 =C2=B1 2%     +60.6%      13147 =C2=B1 2%  TOTAL uptime.idle

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.14 =C2=B114%     +51.8%       1.73 =C2=B1 6%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.14 =C2=B114%     +51.8%       1.73 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.fsnotify.vfs_write.sys_write.system_call_fastpath.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.68 =C2=B1 6%     +46.9%       1.00 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.68 =C2=B1 6%     +46.9%       1.00 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.cmpxchg_double_slab.isra.52.__slab_free.kfree.skb_free_head.skb_re=
lease_data

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.81 =C2=B1 2%     +43.8%       1.17 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.81 =C2=B1 2%     +43.8%       1.17 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_=
aio_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.78 =C2=B115%     +45.5%       1.14 =C2=B1 8%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.78 =C2=B115%     +45.5%       1.14 =C2=B1 8%  TOTAL perf-profile.cp=
u-cycles.system_call_after_swapgs.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    422963 =C2=B1 1%     -31.4%     290240 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
    422963 =C2=B1 1%     -31.4%     290240 =C2=B112%  TOTAL numa-meminfo.no=
de1.AnonPages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.48 =C2=B116%     +51.5%       2.24 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.48 =C2=B116%     +51.5%       2.24 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_page_from_iter_iovec.copy_page_from_iter.pipe_write.new_sync_=
write.vfs_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    422767 =C2=B1 1%     -31.3%     290312 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
    422767 =C2=B1 1%     -31.3%     290312 =C2=B112%  TOTAL numa-meminfo.no=
de1.Active(anon)

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     27471 =C2=B1 4%     +23.1%      33818 =C2=B1 7%  lkp-nex06/pigz/100%-1=
28K
    477043 =C2=B1 3%     -44.8%     263564 =C2=B117%  lkp-snb01/hackbench/1=
600%-process-pipe
    504514 =C2=B1 3%     -41.1%     297382 =C2=B116%  TOTAL numa-meminfo.no=
de1.Slab

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1540 =C2=B1 7%     +59.6%       2458 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      1326 =C2=B1 2%     +30.8%       1734 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      5091 =C2=B1 3%     +36.7%       6962 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
      7957 =C2=B1 3%     +40.2%      11154 =C2=B1 3%  TOTAL slabinfo.sock_i=
node_cache.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  43169152 =C2=B1 0%     -14.1%   37096135 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
 1.612e+08 =C2=B1 3%     +93.7%  3.123e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   7426036 =C2=B1 3%     +27.4%    9463921 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
 2.118e+08 =C2=B1 2%     +69.4%  3.588e+08 =C2=B1 1%  TOTAL proc-vmstat.pgf=
ree

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1540 =C2=B1 7%     +59.6%       2458 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      1326 =C2=B1 2%     +30.8%       1734 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      5091 =C2=B1 3%     +35.0%       6874 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-threads-socket
      7957 =C2=B1 3%     +39.1%      11067 =C2=B1 3%  TOTAL slabinfo.sock_i=
node_cache.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.72 =C2=B1 7%     +47.9%       1.07 =C2=B1 8%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.72 =C2=B1 7%     +47.9%       1.07 =C2=B1 8%  TOTAL perf-profile.cp=
u-cycles.fsnotify.vfs_write.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1028826 =C2=B1 2%     -18.8%     835226 =C2=B1 5%  lkp-nex06/pigz/100%-1=
28K
   2599901 =C2=B1 2%     -33.4%    1730340 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    105504 =C2=B1 2%     -39.7%      63575 =C2=B110%  xps2/pigz/100%-128K
    104124 =C2=B1 2%     -26.0%      77061 =C2=B1 7%  xps2/pigz/100%-512K
   3838356 =C2=B1 2%     -29.5%    2706203 =C2=B1 3%  TOTAL softirqs.RCU

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  19200235 =C2=B1 1%     +43.6%   27577988 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
  19200235 =C2=B1 1%     +43.6%   27577988 =C2=B1 0%  TOTAL proc-vmstat.pgf=
ault

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  43073142 =C2=B1 0%     -14.2%   36976442 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
 1.578e+08 =C2=B1 3%     +94.6%  3.071e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   2015784 =C2=B1 3%     +18.8%    2394748 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
 2.029e+08 =C2=B1 2%     +70.8%  3.465e+08 =C2=B1 1%  TOTAL proc-vmstat.num=
a_local

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  43085563 =C2=B1 0%     -14.2%   36988892 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
 1.578e+08 =C2=B1 3%     +94.6%  3.071e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   2019982 =C2=B1 3%     +18.7%    2398545 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
 2.029e+08 =C2=B1 2%     +70.8%  3.465e+08 =C2=B1 1%  TOTAL proc-vmstat.num=
a_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  40621416 =C2=B1 0%     -14.0%   34945982 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
 1.509e+08 =C2=B1 3%     +87.2%  2.824e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
   6753452 =C2=B1 3%     +27.5%    8608994 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
 1.982e+08 =C2=B1 2%     +64.4%  3.259e+08 =C2=B1 1%  TOTAL proc-vmstat.pga=
lloc_normal

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.96 =C2=B113%     +40.5%       1.35 =C2=B111%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.96 =C2=B113%     +40.5%       1.35 =C2=B111%  TOTAL perf-profile.cp=
u-cycles.__fget_light.sys_read.system_call_fastpath.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9771 =C2=B1 2%     -16.4%       8165 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
     10909 =C2=B1 1%     -37.4%       6830 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
     20681 =C2=B1 1%     -27.5%      14995 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-192.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9771 =C2=B1 2%     -16.4%       8165 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
     10909 =C2=B1 1%     -37.5%       6823 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
     20681 =C2=B1 1%     -27.5%      14988 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-192.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.11 =C2=B116%     +38.0%       2.91 =C2=B1 7%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.11 =C2=B116%     +38.0%       2.91 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.pipe_write.new_sync_write.vfs_write.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     23521 =C2=B1 2%     -27.1%      17157 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
     23521 =C2=B1 2%     -27.1%      17157 =C2=B1 1%  TOTAL softirqs.HRTIMER

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1225 =C2=B1 4%     +41.2%       1729 =C2=B111%  xps2/pigz/100%-128K
      1225 =C2=B1 4%     +41.2%       1729 =C2=B111%  TOTAL cpuidle.C6-NHM.=
usage

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       357 =C2=B1 4%     +37.7%        491 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
       357 =C2=B1 4%     +37.7%        491 =C2=B1 6%  TOTAL slabinfo.taskst=
ats.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       357 =C2=B1 4%     +37.7%        491 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
       357 =C2=B1 4%     +37.7%        491 =C2=B1 6%  TOTAL slabinfo.taskst=
ats.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.77 =C2=B117%     +44.2%       1.11 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.77 =C2=B117%     +44.2%       1.11 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.mutex_unlock.new_sync_read.vfs_read.sys_read.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     42939 =C2=B1 6%     +43.8%      61753 =C2=B118%  lkp-snb01/hackbench/1=
600%-process-pipe
     42939 =C2=B1 6%     +43.8%      61753 =C2=B118%  TOTAL numa-vmstat.nod=
e0.nr_page_table_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.57 =C2=B1 4%     +30.8%       3.37 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
      2.50 =C2=B116%     +53.0%       3.83 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      4.75 =C2=B1 6%     +14.9%       5.46 =C2=B1 8%  xps2/pigz/100%-128K
      9.83 =C2=B1 8%     +28.8%      12.65 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_w=
rite.vfs_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.89 =C2=B1 3%     +35.3%       1.20 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.89 =C2=B1 3%     +35.3%       1.20 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.cmpxchg_double_slab.isra.52.__slab_free.kmem_cache_free.kfree_skbm=
em.consume_skb

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.40 =C2=B118%     +52.1%       2.13 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.40 =C2=B118%     +52.1%       2.13 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.__sb_start_write.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    171696 =C2=B1 6%     +43.4%     246188 =C2=B119%  lkp-snb01/hackbench/1=
600%-process-pipe
    171696 =C2=B1 6%     +43.4%     246188 =C2=B119%  TOTAL numa-meminfo.no=
de0.PageTables

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.81 =C2=B1 3%     +34.2%       1.09 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.81 =C2=B1 3%     +34.2%       1.09 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.sock_has_perm.selinux_socket_sendmsg.security_socket_sendmsg.sock_=
aio_write.do_sync_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.18 =C2=B114%     +32.0%       1.56 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.18 =C2=B114%     +32.0%       1.56 =C2=B110%  TOTAL perf-profile.cp=
u-cycles.__fget_light.sys_write.system_call_fastpath.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.74 =C2=B1 3%     +32.2%       0.98 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.74 =C2=B1 3%     +32.2%       0.98 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__pthread_enable_asynccancel.start_thread

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.94 =C2=B1 7%     +28.0%       1.21 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.94 =C2=B1 7%     +28.0%       1.21 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.touch_atime.pipe_read.new_sync_read.vfs_read.sys_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    157716 =C2=B1 6%     +17.7%     185558 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
     13440 =C2=B1 2%     +43.4%      19269 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
    171156 =C2=B1 5%     +19.7%     204827 =C2=B1 4%  TOTAL proc-vmstat.num=
a_pages_migrated

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    157716 =C2=B1 6%     +17.7%     185558 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
     13440 =C2=B1 2%     +43.4%      19269 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
    171156 =C2=B1 5%     +19.7%     204827 =C2=B1 4%  TOTAL proc-vmstat.pgm=
igrate_success

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.25 =C2=B1 2%     +30.3%       2.93 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-threads-socket
      2.25 =C2=B1 2%     +30.3%       2.93 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles.__fget.__fget_light.__fdget_pos.sys_write.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.03 =C2=B1 5%     +31.1%       1.35 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.03 =C2=B1 5%     +31.1%       1.35 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.__slab_free.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_r=
ecvmsg

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.06 =C2=B1 0%     +28.7%       2.65 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      2.06 =C2=B1 0%     +28.7%       2.65 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_write.sys_wri=
te

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    468246 =C2=B1 3%     -26.0%     346293 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
    468246 =C2=B1 3%     -26.0%     346293 =C2=B1 9%  TOTAL numa-meminfo.no=
de1.Active

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5.70 =C2=B1 1%     +10.8%       6.32 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
      3.37 =C2=B1 9%     +45.1%       4.89 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      9.08 =C2=B1 4%     +23.5%      11.21 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read=
.vfs_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      6462 =C2=B1 1%     +28.4%       8300 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      6462 =C2=B1 1%     +28.4%       8300 =C2=B1 2%  TOTAL slabinfo.task_d=
elay_info.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      6462 =C2=B1 1%     +28.4%       8300 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      6462 =C2=B1 1%     +28.4%       8300 =C2=B1 2%  TOTAL slabinfo.task_d=
elay_info.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.64 =C2=B1 2%     +27.3%       2.08 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.64 =C2=B1 2%     +27.3%       2.08 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.kfree.skb_free_head.skb_release_data.skb_release_all.consume_skb

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.38 =C2=B1 2%     +30.5%       3.11 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      2.38 =C2=B1 2%     +30.5%       3.11 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.skb_copy_datagram_iovec.unix_stream_recvm=
sg.sock_aio_read.sock_aio_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.05 =C2=B1 9%     +30.3%       2.67 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.05 =C2=B1 9%     +30.3%       2.67 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_page_to_iter_iovec.copy_page_to_iter.pipe_read.new_sync_read.=
vfs_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  10466312 =C2=B1 7%     -12.6%    9148526 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
 1.048e+08 =C2=B1 3%     +48.0%   1.55e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
   1049829 =C2=B1 3%     +21.9%    1279781 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
 1.163e+08 =C2=B1 4%     +42.3%  1.655e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode1.local_node

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  10468797 =C2=B1 7%     -12.6%    9151845 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
 1.048e+08 =C2=B1 3%     +48.0%   1.55e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
   1052346 =C2=B1 3%     +21.6%    1279808 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
 1.163e+08 =C2=B1 4%     +42.3%  1.655e+08 =C2=B1 2%  TOTAL numa-numastat.n=
ode1.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   9625911 =C2=B1 0%     -21.6%    7546918 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
   9625911 =C2=B1 0%     -21.6%    7546918 =C2=B1 0%  TOTAL softirqs.TIMER

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       834 =C2=B1 8%     +34.6%       1123 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
       834 =C2=B1 8%     +34.6%       1123 =C2=B1 4%  TOTAL slabinfo.blkdev=
_ioc.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       834 =C2=B1 8%     +34.6%       1123 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
       834 =C2=B1 8%     +34.6%       1123 =C2=B1 4%  TOTAL slabinfo.blkdev=
_ioc.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.02 =C2=B114%     +33.6%       1.36 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.02 =C2=B114%     +33.6%       1.36 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.__write_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     12584 =C2=B1 1%     +24.7%      15699 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
    257147 =C2=B1 0%     -11.0%     228841 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      8913 =C2=B111%     +25.2%      11161 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      3472 =C2=B1 6%     +34.7%       4676 =C2=B1 8%  xps2/pigz/100%-128K
      3552 =C2=B111%     +25.2%       4446 =C2=B1 6%  xps2/pigz/100%-512K
    285670 =C2=B1 0%      -7.3%     264823 =C2=B1 1%  TOTAL slabinfo.anon_v=
ma.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     12584 =C2=B1 1%     +24.7%      15699 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
    271487 =C2=B1 0%     -10.2%     243787 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      8913 =C2=B111%     +25.2%      11161 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      3472 =C2=B1 6%     +34.7%       4676 =C2=B1 8%  xps2/pigz/100%-128K
      3552 =C2=B111%     +25.2%       4446 =C2=B1 6%  xps2/pigz/100%-512K
    300010 =C2=B1 0%      -6.7%     279770 =C2=B1 1%  TOTAL slabinfo.anon_v=
ma.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    277391 =C2=B1 5%     +14.0%     316249 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
   1065264 =C2=B1 5%     +44.6%    1539953 =C2=B114%  lkp-snb01/hackbench/1=
600%-process-pipe
   1342655 =C2=B1 5%     +38.2%    1856203 =C2=B112%  TOTAL numa-meminfo.no=
de0.MemUsed

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.03 =C2=B1 4%     -21.9%       0.80 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.03 =C2=B1 4%     -21.9%       0.80 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_=
sync_read

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   5263371 =C2=B1 8%     -12.6%    4601652 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
  52804907 =C2=B1 8%     +46.7%   77483170 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  58068279 =C2=B1 8%     +41.4%   82084823 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_local

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.19 =C2=B116%     +38.2%       3.02 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.19 =C2=B116%     +38.2%       3.02 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.mutex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpa=
th

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1047 =C2=B111%     +32.8%       1390 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
      1047 =C2=B111%     +32.8%       1390 =C2=B1 6%  TOTAL slabinfo.blkdev=
_requests.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1047 =C2=B111%     +32.8%       1390 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
      1047 =C2=B111%     +32.8%       1390 =C2=B1 6%  TOTAL slabinfo.blkdev=
_requests.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.23 =C2=B112%     +30.8%       1.61 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.23 =C2=B112%     +30.8%       1.61 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.vfs_read.sys_read.system_call_fastpath.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.33 =C2=B1 6%     +18.0%       1.57 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.33 =C2=B1 6%     +18.0%       1.57 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.__read_nocancel

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   5269235 =C2=B1 8%     -12.0%    4639400 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
  52816202 =C2=B1 8%     +46.8%   77554512 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
    740470 =C2=B1 2%     +15.9%     857961 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
  58825909 =C2=B1 8%     +41.2%   83051875 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1066 =C2=B112%     +32.8%       1417 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
      1066 =C2=B112%     +32.8%       1417 =C2=B1 6%  TOTAL slabinfo.xfs_bu=
f.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1066 =C2=B112%     +32.8%       1417 =C2=B1 6%  lkp-nex06/pigz/100%-1=
28K
      1066 =C2=B112%     +32.8%       1417 =C2=B1 6%  TOTAL slabinfo.xfs_bu=
f.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.99 =C2=B1 3%     +18.5%       1.18 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.99 =C2=B1 3%     +18.5%       1.18 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.sock_wfree.unix_destruct_scm.skb_release_head_state.skb_release_al=
l.consume_skb

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      6549 =C2=B1 2%     +21.0%       7927 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      6549 =C2=B1 2%     +21.0%       7927 =C2=B1 1%  TOTAL slabinfo.task_x=
state.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       580 =C2=B1 4%     +26.4%        733 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
      9564 =C2=B1 0%     -11.2%       8492 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     10144 =C2=B1 0%      -9.0%       9226 =C2=B1 1%  TOTAL slabinfo.vm_are=
a_struct.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       580 =C2=B1 4%     +26.4%        733 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
      9564 =C2=B1 0%     -11.2%       8492 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     10144 =C2=B1 0%      -9.0%       9226 =C2=B1 1%  TOTAL slabinfo.vm_are=
a_struct.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
        62 =C2=B1 0%     -16.3%         52 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
      6780 =C2=B1 0%     +18.0%       7997 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
       271 =C2=B1 0%     +24.0%        336 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
      7114 =C2=B1 0%     +17.9%       8386 =C2=B1 0%  TOTAL vmstat.procs.r

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       722 =C2=B1 3%     +26.3%        912 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      8737 =C2=B1 0%     -10.9%       7782 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      9459 =C2=B1 0%      -8.1%       8695 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       722 =C2=B1 3%     +26.3%        912 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      8737 =C2=B1 0%     -10.9%       7782 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      9459 =C2=B1 0%      -8.1%       8695 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      6548 =C2=B1 2%     +20.3%       7880 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      6548 =C2=B1 2%     +20.3%       7880 =C2=B1 2%  TOTAL slabinfo.task_x=
state.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3.65 =C2=B1 5%     +18.9%       4.33 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      3.65 =C2=B1 5%     +18.9%       4.33 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write.do_sync_wr=
ite.vfs_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     10259 =C2=B1 9%     -18.1%       8402 =C2=B1 8%  lkp-snb01/hackbench/1=
600%-process-pipe
      1672 =C2=B1 3%      -8.4%       1531 =C2=B1 4%  xps2/pigz/100%-512K
     11931 =C2=B1 8%     -16.7%       9933 =C2=B1 7%  TOTAL slabinfo.proc_i=
node_cache.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3001 =C2=B1 3%     +20.8%       3625 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
      1824 =C2=B1 6%     +13.2%       2064 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      4825 =C2=B1 4%     +17.9%       5689 =C2=B1 1%  TOTAL slabinfo.shmem_=
inode_cache.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3001 =C2=B1 3%     +20.8%       3625 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
      1824 =C2=B1 6%     +13.2%       2064 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      4825 =C2=B1 4%     +17.9%       5689 =C2=B1 1%  TOTAL slabinfo.shmem_=
inode_cache.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   5693091 =C2=B1 6%     -14.6%    4861240 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
   5693091 =C2=B1 6%     -14.6%    4861240 =C2=B1 3%  TOTAL numa-vmstat.nod=
e3.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     46012 =C2=B1 3%     +25.9%      57926 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
    533974 =C2=B1 0%     -11.5%     472605 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     45601 =C2=B1 5%     -10.8%      40697 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
    625588 =C2=B1 0%      -8.7%     571230 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     46275 =C2=B1 3%     +26.3%      58424 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
    559228 =C2=B1 0%     -10.9%     498132 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     45817 =C2=B1 5%     -10.6%      40954 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
    651321 =C2=B1 0%      -8.3%     597511 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     25431 =C2=B1 4%     +26.3%      32132 =C2=B1 5%  lkp-nex06/pigz/100%-1=
28K
    404148 =C2=B1 0%     -11.8%     356411 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      3274 =C2=B1 1%      -8.5%       2996 =C2=B1 5%  xps2/pigz/100%-128K
      3366 =C2=B1 4%     -12.4%       2947 =C2=B1 4%  xps2/pigz/100%-512K
    436220 =C2=B1 0%      -9.6%     394487 =C2=B1 1%  TOTAL slabinfo.vm_are=
a_struct.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.05 =C2=B1 2%     +18.0%       1.24 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.05 =C2=B1 2%     +18.0%       1.24 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_aio=
_write.do_sync_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     87403 =C2=B1 0%     +17.5%     102720 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     87403 =C2=B1 0%     +17.5%     102720 =C2=B1 0%  TOTAL meminfo.SUnrecl=
aim

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.13 =C2=B1 5%     +16.0%       1.32 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.13 =C2=B1 5%     +16.0%       1.32 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.mutex_lock.pipe_write.new_sync_write.vfs_write.sys_write

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   5655413 =C2=B1 6%     -14.6%    4830277 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
   5655413 =C2=B1 6%     -14.6%    4830277 =C2=B1 3%  TOTAL numa-vmstat.nod=
e3.numa_local

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     21858 =C2=B1 0%     +17.5%      25684 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     21858 =C2=B1 0%     +17.5%      25684 =C2=B1 0%  TOTAL proc-vmstat.nr_=
slab_unreclaimable

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.17 =C2=B1 5%     +15.3%       0.20 =C2=B1 2%  xps2/pigz/100%-128K
      0.17 =C2=B1 5%     +15.3%       0.20 =C2=B1 2%  TOTAL turbostat.%pc6

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     25564 =C2=B1 4%     +26.3%      32296 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
    420842 =C2=B1 0%     -11.2%     373711 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      3312 =C2=B1 2%      -8.3%       3038 =C2=B1 6%  xps2/pigz/100%-128K
      3408 =C2=B1 3%     -12.4%       2984 =C2=B1 3%  xps2/pigz/100%-512K
    453127 =C2=B1 0%      -9.1%     412030 =C2=B1 1%  TOTAL slabinfo.vm_are=
a_struct.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   5797050 =C2=B1 2%     +17.3%    6801865 =C2=B1 5%  xps2/pigz/100%-128K
   5797050 =C2=B1 2%     +17.3%    6801865 =C2=B1 5%  TOTAL cpuidle.C6-NHM.=
time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  11456539 =C2=B1 5%     -18.2%    9372635 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
  11456539 =C2=B1 5%     -18.2%    9372635 =C2=B1 3%  TOTAL numa-numastat.n=
ode3.local_node

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  11459851 =C2=B1 5%     -18.2%    9375130 =C2=B1 3%  lkp-nex06/pigz/100%-1=
28K
  11459851 =C2=B1 5%     -18.2%    9375130 =C2=B1 3%  TOTAL numa-numastat.n=
ode3.numa_hit

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.77 =C2=B1 4%     +22.1%       2.16 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.77 =C2=B1 4%     +22.1%       2.16 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles.pipe_read.new_sync_read.vfs_read.sys_read.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9453 =C2=B1 1%     +17.5%      11110 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      9453 =C2=B1 1%     +17.5%      11110 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-128.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  10101941 =C2=B1 0%     -14.4%    8650440 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
  10101941 =C2=B1 0%     -14.4%    8650440 =C2=B1 2%  TOTAL meminfo.Committ=
ed_AS

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3.21 =C2=B1 3%     -14.6%       2.74 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      3.21 =C2=B1 3%     -14.6%       2.74 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_read.vfs_r=
ead

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1036 =C2=B1 8%     -15.5%        876 =C2=B1 5%  lkp-nex06/pigz/100%-1=
28K
      1036 =C2=B1 8%     -15.5%        876 =C2=B1 5%  TOTAL slabinfo.ip_fib=
_trie.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1036 =C2=B1 8%     -15.5%        876 =C2=B1 5%  lkp-nex06/pigz/100%-1=
28K
      1036 =C2=B1 8%     -15.5%        876 =C2=B1 5%  TOTAL slabinfo.ip_fib=
_trie.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    176173 =C2=B1 0%     -13.4%     152605 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    176173 =C2=B1 0%     -13.4%     152605 =C2=B1 2%  TOTAL proc-vmstat.nr_=
anon_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    176133 =C2=B1 0%     -13.3%     152665 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    176133 =C2=B1 0%     -13.3%     152665 =C2=B1 2%  TOTAL proc-vmstat.nr_=
active_anon

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    144484 =C2=B1 0%     -14.3%     123860 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
    144484 =C2=B1 0%     -14.3%     123860 =C2=B1 1%  TOTAL proc-vmstat.nr_=
page_table_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      7967 =C2=B1 2%     +16.4%       9272 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      7967 =C2=B1 2%     +16.4%       9272 =C2=B1 2%  TOTAL slabinfo.Acpi-N=
amespace.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      7967 =C2=B1 2%     +16.4%       9272 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      7967 =C2=B1 2%     +16.4%       9272 =C2=B1 2%  TOTAL slabinfo.Acpi-N=
amespace.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    705846 =C2=B1 0%     -13.0%     613934 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    705846 =C2=B1 0%     -13.0%     613934 =C2=B1 2%  TOTAL meminfo.AnonPag=
es

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    705673 =C2=B1 0%     -13.0%     614218 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    705673 =C2=B1 0%     -13.0%     614218 =C2=B1 2%  TOTAL meminfo.Active(=
anon)

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    579273 =C2=B1 0%     -14.0%     498028 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    579273 =C2=B1 0%     -14.0%     498028 =C2=B1 2%  TOTAL meminfo.PageTab=
les

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9715 =C2=B1 0%     -15.4%       8214 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
      9733 =C2=B1 0%     -11.5%       8618 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     19448 =C2=B1 0%     -13.4%      16832 =C2=B1 0%  TOTAL proc-vmstat.pga=
ctivate

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    275989 =C2=B1 5%      -8.3%     253185 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
    265215 =C2=B1 6%      -6.2%     248871 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-threads-socket
    541204 =C2=B1 6%      -7.2%     502057 =C2=B1 5%  TOTAL numa-meminfo.no=
de0.FilePages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     69007 =C2=B1 6%      -8.3%      63255 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
     66301 =C2=B1 6%      -6.2%      62217 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-threads-socket
    135309 =C2=B1 6%      -7.3%     125473 =C2=B1 5%  TOTAL numa-vmstat.nod=
e0.nr_file_pages

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    819171 =C2=B1 0%     -12.2%     719483 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    819171 =C2=B1 0%     -12.2%     719483 =C2=B1 2%  TOTAL meminfo.Active

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2746 =C2=B1 3%     +12.5%       3091 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      2866 =C2=B1 3%     +11.4%       3193 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      5612 =C2=B1 3%     +12.0%       6284 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-96.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     70020 =C2=B1 6%      -9.0%      63708 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
     70020 =C2=B1 6%      -9.0%      63708 =C2=B1 3%  TOTAL proc-vmstat.num=
a_hint_faults_local

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5845 =C2=B1 0%      -7.7%       5396 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      9413 =C2=B1 1%     +18.0%      11106 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
     15258 =C2=B1 1%      +8.2%      16503 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-128.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.02 =C2=B1 3%     -12.0%       0.89 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      1.02 =C2=B1 3%     -12.0%       0.89 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__slab_free.kfree.skb_free_head.skb_release_data.skb_release_all

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2788 =C2=B1 3%     +12.3%       3133 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      2914 =C2=B1 3%     +11.0%       3234 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      5703 =C2=B1 3%     +11.6%       6367 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-96.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1430 =C2=B1 2%     +12.7%       1611 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      1430 =C2=B1 2%     +12.7%       1611 =C2=B1 1%  TOTAL numa-vmstat.nod=
e0.nr_alloc_batch

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1421 =C2=B1 0%     -10.8%       1267 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1421 =C2=B1 0%     -10.8%       1267 =C2=B1 1%  TOTAL slabinfo.sighan=
d_cache.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1421 =C2=B1 0%     -10.8%       1267 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1421 =C2=B1 0%     -10.8%       1267 =C2=B1 1%  TOTAL slabinfo.sighan=
d_cache.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     21323 =C2=B1 0%     -10.8%      19020 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     21323 =C2=B1 0%     -10.8%      19020 =C2=B1 1%  TOTAL slabinfo.sighan=
d_cache.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.88 =C2=B1 3%     +15.8%       1.01 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-threads-socket
      0.88 =C2=B1 3%     +15.8%       1.01 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.vfs_read.sys_read.system_call_fastpath

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1114 =C2=B1 0%     -11.0%        991 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1114 =C2=B1 0%     -11.0%        991 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1114 =C2=B1 0%     -11.0%        991 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1114 =C2=B1 0%     -11.0%        991 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     18957 =C2=B1 0%     -11.1%      16861 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     18957 =C2=B1 0%     -11.1%      16861 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19974 =C2=B1 0%     -10.8%      17814 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     19974 =C2=B1 0%     -10.8%      17814 =C2=B1 1%  TOTAL slabinfo.task_s=
truct.num_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      4993 =C2=B1 0%     -10.8%       4453 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      4993 =C2=B1 0%     -10.8%       4453 =C2=B1 1%  TOTAL slabinfo.task_s=
truct.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      4993 =C2=B1 0%     -10.8%       4453 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      4993 =C2=B1 0%     -10.8%       4453 =C2=B1 1%  TOTAL slabinfo.task_s=
truct.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    131512 =C2=B1 0%     +11.9%     147227 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
    131512 =C2=B1 0%     +11.9%     147227 =C2=B1 0%  TOTAL meminfo.Slab

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     20909 =C2=B1 0%     -10.1%      18793 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     20909 =C2=B1 0%     -10.1%      18793 =C2=B1 1%  TOTAL slabinfo.sighan=
d_cache.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19775 =C2=B1 1%     -10.5%      17695 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     19775 =C2=B1 1%     -10.5%      17695 =C2=B1 1%  TOTAL slabinfo.task_s=
truct.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19540 =C2=B1 1%     -10.3%      17524 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     19540 =C2=B1 1%     -10.3%      17524 =C2=B1 1%  TOTAL proc-vmstat.nr_=
kernel_stack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1653 =C2=B1 2%      -7.9%       1522 =C2=B1 3%  xps2/pigz/100%-512K
      1653 =C2=B1 2%      -7.9%       1522 =C2=B1 3%  TOTAL slabinfo.proc_i=
node_cache.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     15845 =C2=B1 0%      -9.8%      14296 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     15845 =C2=B1 0%      -9.8%      14296 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-1024.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5322 =C2=B1 0%     -10.2%       4779 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      5322 =C2=B1 0%     -10.2%       4779 =C2=B1 1%  TOTAL slabinfo.anon_v=
ma.active_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5322 =C2=B1 0%     -10.2%       4779 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      5322 =C2=B1 0%     -10.2%       4779 =C2=B1 1%  TOTAL slabinfo.anon_v=
ma.num_slabs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2447 =C2=B1 0%     +12.7%       2758 =C2=B1 2%  lkp-nex06/pigz/100%-1=
28K
      2447 =C2=B1 0%     +12.7%       2758 =C2=B1 2%  TOTAL slabinfo.signal=
_cache.active_objs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    312131 =C2=B1 1%     -10.4%     279585 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    312131 =C2=B1 1%     -10.4%     279585 =C2=B1 2%  TOTAL meminfo.KernelS=
tack

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2905 =C2=B1 2%     +11.8%       3248 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-threads-socket
      2905 =C2=B1 2%     +11.8%       3248 =C2=B1 2%  TOTAL proc-vmstat.nr_=
alloc_batch

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     88744 =C2=B1 2%     -18.9%      71959 =C2=B1 1%  lkp-nex06/pigz/100%-1=
28K
    758083 =C2=B1 4%     -80.0%     151644 =C2=B114%  lkp-snb01/hackbench/1=
600%-process-pipe
    797693 =C2=B1 0%     -83.3%     133387 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
      9915 =C2=B1 0%     -10.4%       8882 =C2=B1 0%  xps2/pigz/100%-128K
      9033 =C2=B1 1%      -3.5%       8715 =C2=B1 0%  xps2/pigz/100%-512K
   1663470 =C2=B1 2%     -77.5%     374589 =C2=B1 7%  TOTAL vmstat.system.in

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1672511 =C2=B1 2%     -60.4%     662359 =C2=B1 4%  lkp-nex06/pigz/100%-1=
28K
 1.235e+09 =C2=B1 2%     -50.2%  6.146e+08 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
 3.534e+08 =C2=B1 3%     -76.5%   83078402 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-threads-socket
    665615 =C2=B1 2%    +124.4%    1493408 =C2=B1 0%  xps2/pigz/100%-128K
    225299 =C2=B1 2%     +75.0%     394317 =C2=B1 0%  xps2/pigz/100%-512K
 1.591e+09 =C2=B1 2%     -56.0%  7.002e+08 =C2=B1 3%  TOTAL time.involuntar=
y_context_switches

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   4270788 =C2=B1 0%     +36.6%    5835317 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
 2.303e+09 =C2=B1 1%     -50.5%   1.14e+09 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.359e+09 =C2=B1 3%     -65.3%  4.722e+08 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
    971741 =C2=B1 0%     +70.1%    1652539 =C2=B1 0%  xps2/pigz/100%-128K
    257403 =C2=B1 0%     +67.9%     432153 =C2=B1 0%  xps2/pigz/100%-512K
 3.667e+09 =C2=B1 2%     -55.8%   1.62e+09 =C2=B1 2%  TOTAL time.voluntary_=
context_switches

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     26043 =C2=B1 0%     +46.6%      38168 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
   5797529 =C2=B1 0%     -49.9%    2906036 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
   2951616 =C2=B1 1%     -64.2%    1057779 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
      5804 =C2=B1 0%     +86.7%      10834 =C2=B1 0%  xps2/pigz/100%-128K
      1983 =C2=B1 1%     +61.4%       3202 =C2=B1 0%  xps2/pigz/100%-512K
   8782976 =C2=B1 0%     -54.3%    4016020 =C2=B1 1%  TOTAL vmstat.system.cs

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  17874373 =C2=B1 1%     +51.0%   26995527 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
    126429 =C2=B1 4%     +11.6%     141154 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-threads-socket
  18000803 =C2=B1 1%     +50.8%   27136681 =C2=B1 0%  TOTAL time.minor_page=
_faults

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     18438 =C2=B1 0%     -22.7%      14250 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
      1579 =C2=B1 1%     -11.8%       1392 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
       665 =C2=B1 3%     +45.1%        965 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     20682 =C2=B1 0%     -19.7%      16609 =C2=B1 0%  TOTAL time.user_time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       166 =C2=B1 0%     +34.3%        223 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
     16907 =C2=B1 1%      -3.1%      16387 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     18149 =C2=B1 3%      -6.0%      17055 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     35223 =C2=B1 2%      -4.4%      33666 =C2=B1 0%  TOTAL time.system_time

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     96.75 =C2=B1 0%     -22.0%      75.49 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
     94.22 =C2=B1 0%      -2.6%      91.78 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     95.22 =C2=B1 0%      -3.4%      92.02 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
    286.18 =C2=B1 0%      -9.4%     259.29 =C2=B1 0%  TOTAL turbostat.%c0

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      6196 =C2=B1 0%     -22.2%       4819 =C2=B1 0%  lkp-nex06/pigz/100%-1=
28K
      3004 =C2=B1 0%      -2.3%       2934 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      3010 =C2=B1 0%      -3.0%       2920 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
     12210 =C2=B1 0%     -12.6%      10673 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       192 =C2=B1 0%      +3.2%        198 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
       192 =C2=B1 0%      +3.2%        198 =C2=B1 0%  TOTAL turbostat.Pkg_W

55ea71268e23ea3  49df457a977e6c0e3f43fb926  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       164 =C2=B1 0%      +1.0%        166 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
       164 =C2=B1 0%      +4.1%        171 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-threads-socket
       329 =C2=B1 0%      +2.5%        338 =C2=B1 0%  TOTAL turbostat.Cor_W


Legend:
	=C2=B1XX%    - stddev percent
	[+-]XX% - change percent


                                  time.user_time

  1000 ++------------------------------------------------------------------=
-+
       O    O    O    O    O    O    O    O   O    O                       =
 |
   950 ++                                                                  =
 |
   900 ++                                                                  =
 |
       |                                                                   =
 |
   850 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   750 ++                                                                  =
 |
   700 ++                                                                  =
 |
       |                                                    .*....*....*...=
 |
   650 ++                                                 ..               =
.|
       |                                              ..*.                 =
 *
   600 *+---*----*----*----*----*----*----*---*----*-----------------------=
-+


                         time.percent_of_cpu_this_job_got

  3040 ++------------------------------------------------------------------=
-+
       *....*....*....*....*....*....*....*...*....*...                    =
 |
  3020 ++                                              .        ..*....    =
 |
       |                                                *....*..       *...=
.|
  3000 ++                                                                  =
 *
       |                                                                   =
 |
  2980 ++                                                                  =
 |
       |                                                                   =
 |
  2960 ++                                                                  =
 |
       |                                                                   =
 |
  2940 ++                                                                  =
 |
       O    O         O    O                                               =
 |
  2920 ++        O              O    O    O   O    O                       =
 |
       |                                                                   =
 |
  2900 ++------------------------------------------------------------------=
-+


                            time.voluntary_context_switches

  1.5e+09 ++---------------------------------------------------------------=
-+
  1.4e+09 ++                                                 .*....*...*...=
 |
          *....*...*....*....*....*...*....*....*...*....  ..              =
.|
  1.3e+09 ++                                             *.                =
 *
  1.2e+09 ++                                                               =
 |
  1.1e+09 ++                                                               =
 |
    1e+09 ++                                                               =
 |
          |                                                                =
 |
    9e+08 ++                                                               =
 |
    8e+08 ++                                                               =
 |
    7e+08 ++                                                               =
 |
    6e+08 ++                                                               =
 |
          |                                                                =
 |
    5e+08 O+   O   O    O    O    O   O    O    O   O                      =
 |
    4e+08 ++---------------------------------------------------------------=
-+


                           time.involuntary_context_switches

    4e+08 ++---------------------------------------------------------------=
-+
          *....*...   ..*....*....*...*....*....                 ..*...*...=
 |
  3.5e+08 ++       *..                          *...*....   ..*..          =
.|
          |                                              *..               =
 *
    3e+08 ++                                                               =
 |
          |                                                                =
 |
  2.5e+08 ++                                                               =
 |
          |                                                                =
 |
    2e+08 ++                                                               =
 |
          |                                                                =
 |
  1.5e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                               O                               =
 |
          O    O   O    O    O    O   O         O   O                      =
 |
    5e+07 ++---------------------------------------------------------------=
-+


                                hackbench.throughput

  150000 ++--------O---O-----------------------O---------------------------=
-+
         O    O             O    O    O    O        O                      =
 |
  140000 ++                                                                =
 |
  130000 ++                                                                =
 |
         |                                                                 =
 |
  120000 ++                                                                =
 |
         |                                                                 =
 |
  110000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
   90000 ++                                                                =
 |
         |                                                                 =
 |
   80000 ++          ..*....   ..*....                 ..*....*...*....*...=
.*
         *....*....*.       *..       *....*...*....*..                    =
 |
   70000 ++----------------------------------------------------------------=
-+


                                   turbostat.%c0

    96 *+------------------*----*----*----*--------------------------------=
-+
       |    *....*....*..                     *....*...                    =
 |
  95.5 ++                                              .   ..*....*....*...=
.|
    95 ++                                               *..                =
 *
       |                                                                   =
 |
  94.5 ++                                                                  =
 |
    94 ++                                                                  =
 |
       |                                                                   =
 |
  93.5 ++                                                                  =
 |
    93 ++                                                                  =
 |
       |                                                                   =
 |
  92.5 ++                                                                  =
 |
    92 O+   O         O    O         O    O   O                            =
 |
       |         O              O                  O                       =
 |
  91.5 ++------------------------------------------------------------------=
-+


                                  turbostat.Pkg_W

  200 ++-------------------------------------------------------------------=
-+
      O    O    O    O                        O                            =
 |
  199 ++                  O    O    O    O         O                       =
 |
  198 ++                                                                   =
 |
      |                                                                    =
 |
  197 ++                                                                   =
 |
  196 ++                                                                   =
 |
      |                                                                    =
 |
  195 ++                                                                   =
 |
  194 ++                                                                   =
 |
      |                                                                    =
 |
  193 ++                                                   ..*....*....*...=
 |
  192 *+...   ..*....*....*....*....*....*....*....   ..*..                =
.|
      |    *..                                     *..                     =
 *
  191 ++-------------------------------------------------------------------=
-+


                                  turbostat.Cor_W

  173 ++-------------------------------------------------------------------=
-+
  172 O+   O    O    O                        O                            =
 |
      |                   O    O    O    O         O                       =
 |
  171 ++                                                                   =
 |
  170 ++                                                                   =
 |
      |                                                                    =
 |
  169 ++                                                                   =
 |
  168 ++                                                                   =
 |
  167 ++                                                                   =
 |
      |                                                                    =
 |
  166 ++                                                    .*....         =
 |
  165 ++                                                  ..      *....*...=
.|
      *....   ..*....*....*....*....*....*....*....   ..*.                 =
 *
  164 ++   *..                                     *..                     =
 |
  163 ++-------------------------------------------------------------------=
-+


                                  vmstat.system.in

  900000 ++---*----*---*----*----*----*----*--------*----------------------=
-+
         *..                                   *..      .                  =
 |
  800000 ++                                              *....*...*....*...=
.*
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
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
         O    O    O   O    O    O    O    O   O    O                      =
 |
  100000 ++----------------------------------------------------------------=
-+


                                   vmstat.system.cs

  3.2e+06 ++---------------------------------------------------------------=
-+
    3e+06 *+...*...*....*....*....*...*....*....*...        ..*....*...    =
 |
          |                                         *....*..           *...=
.*
  2.8e+06 ++                                                               =
 |
  2.6e+06 ++                                                               =
 |
  2.4e+06 ++                                                               =
 |
  2.2e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
  1.8e+06 ++                                                               =
 |
  1.6e+06 ++                                                               =
 |
  1.4e+06 ++                                                               =
 |
          |                                                                =
 |
  1.2e+06 ++                               O                               =
 |
    1e+06 O+---O---O----O----O----O---O---------O---O----------------------=
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
Fengguang

--===============6115591354969672300==
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
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAt
bCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3Iv
YmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJl
YWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAK
L3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNr
YmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAt
LXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2
MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmlu
L2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRz
IC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVu
Y2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRo
cmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAw
MAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hh
Y2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2
IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1s
IDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAK

--===============6115591354969672300==--

