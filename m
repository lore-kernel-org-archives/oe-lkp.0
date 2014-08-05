Content-Type: multipart/mixed; boundary="===============8535738906057385195=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 40c5e72463e: +64.8% hackbench.throughput
Date: Wed, 06 Aug 2014 05:28:41 +0800
Message-ID: <20140805212841.GC14042@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8535738906057385195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yuyang,

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v5-on-3.16-rc7
commit 40c5e72463e42659e15eba0c8c2f46f96f703fac ("sched: Rewrite per entity=
 runnable load average tracking")

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    153447 =C2=B1 6%     +64.8%     252931 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
    153447 =C2=B1 6%     +64.8%     252931 =C2=B1 0%  TOTAL hackbench.throu=
ghput

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.02 =C2=B144%     -89.3%       0.11 =C2=B129%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.02 =C2=B144%     -89.3%       0.11 =C2=B129%  TOTAL perf-profile.cp=
u-cycles.__schedule.schedule_user.sysret_careful.__write_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9166 =C2=B115%    +703.0%      73599 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      9166 =C2=B115%    +703.0%      73599 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_other

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.49 =C2=B112%    -100.0%       0.00 =C2=B1 0%  xps2/pigz/100%-512K
      1.49 =C2=B112%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles.update_cfs_rq_blocked_load.task_tick_fair.scheduler_tick.update_pr=
ocess_times.tick_sched_handle

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.64 =C2=B140%     -85.6%       0.09 =C2=B118%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.64 =C2=B140%     -85.6%       0.09 =C2=B118%  TOTAL perf-profile.cp=
u-cycles.__switch_to.__write_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 2.319e+08 =C2=B110%    +368.0%  1.085e+09 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 2.319e+08 =C2=B110%    +368.0%  1.085e+09 =C2=B1 1%  TOTAL cpuidle.C1-SNB.=
time

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2658 =C2=B140%    +240.4%       9049 =C2=B114%  lkp-snb01/hackbench/1=
600%-process-pipe
      2658 =C2=B140%    +240.4%       9049 =C2=B114%  TOTAL numa-vmstat.nod=
e0.nr_kernel_stack

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     42829 =C2=B140%    +233.0%     142608 =C2=B114%  lkp-snb01/hackbench/1=
600%-process-pipe
     42829 =C2=B140%    +233.0%     142608 =C2=B114%  TOTAL numa-meminfo.no=
de0.KernelStack

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3.41 =C2=B111%     -69.8%       1.03 =C2=B1 7%  lkp-snb01/hackbench/1=
600%-process-pipe
      3.41 =C2=B111%     -69.8%       1.03 =C2=B1 7%  TOTAL turbostat.%c7

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.11 =C2=B136%     -71.1%       0.32 =C2=B117%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.11 =C2=B136%     -71.1%       0.32 =C2=B117%  TOTAL perf-profile.cp=
u-cycles.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremov=
e_wake_function.__wake_up_common

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3629 =C2=B120%     -60.8%       1421 =C2=B111%  lkp-snb01/hackbench/1=
600%-process-pipe
      3629 =C2=B120%     -60.8%       1421 =C2=B111%  TOTAL cpuidle.C3-SNB.=
usage

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.17 =C2=B129%     -67.6%       0.38 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.17 =C2=B129%     -67.6%       0.38 =C2=B112%  TOTAL perf-profile.cp=
u-cycles.__switch_to.__read_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.52 =C2=B139%     -70.6%       0.74 =C2=B117%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.52 =C2=B139%     -70.6%       0.74 =C2=B117%  TOTAL perf-profile.cp=
u-cycles.__schedule.schedule.pipe_wait.pipe_read.new_sync_read

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     21455 =C2=B132%    +183.8%      60881 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
     21455 =C2=B132%    +183.8%      60881 =C2=B112%  TOTAL numa-vmstat.nod=
e0.nr_slab_unreclaimable

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.79 =C2=B1 9%    +177.2%       7.75 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.79 =C2=B1 9%    +177.2%       7.75 =C2=B1 0%  TOTAL turbostat.%c1

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     86194 =C2=B132%    +180.9%     242116 =C2=B113%  lkp-snb01/hackbench/1=
600%-process-pipe
     86194 =C2=B132%    +180.9%     242116 =C2=B113%  TOTAL numa-meminfo.no=
de0.SUnreclaim

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       226 =C2=B110%    +149.5%        563 =C2=B122%  lkp-snb01/hackbench/1=
600%-process-pipe
       226 =C2=B110%    +149.5%        563 =C2=B122%  TOTAL slabinfo.nfs_re=
ad_data.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       226 =C2=B110%    +149.5%        563 =C2=B122%  lkp-snb01/hackbench/1=
600%-process-pipe
       226 =C2=B110%    +149.5%        563 =C2=B122%  TOTAL slabinfo.nfs_re=
ad_data.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  19845625 =C2=B1 7%     -64.3%    7081268 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
  19845625 =C2=B1 7%     -64.3%    7081268 =C2=B1 9%  TOTAL cpuidle.C1-SNB.=
usage

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.79 =C2=B140%     -67.9%       0.25 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.79 =C2=B140%     -67.9%       0.25 =C2=B1 9%  TOTAL perf-profile.cp=
u-cycles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_d=
o_activate

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  65227388 =C2=B115%    +144.4%  1.594e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  65227388 =C2=B115%    +144.4%  1.594e+08 =C2=B1 1%  TOTAL numa-numastat.n=
ode0.local_node

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  65230757 =C2=B115%    +144.3%  1.594e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  65230757 =C2=B115%    +144.3%  1.594e+08 =C2=B1 1%  TOTAL numa-numastat.n=
ode0.numa_hit

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  12740359 =C2=B115%    +142.5%   30890379 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  12740359 =C2=B115%    +142.5%   30890379 =C2=B1 1%  TOTAL proc-vmstat.pga=
lloc_dma32

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  74621961 =C2=B114%    +165.6%  1.982e+08 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
  74621961 =C2=B114%    +165.6%  1.982e+08 =C2=B1 9%  TOTAL cpuidle.C1E-SNB=
.time

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.26 =C2=B129%     -58.4%       0.53 =C2=B128%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.26 =C2=B129%     -58.4%       0.53 =C2=B128%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wak=
e_function.__wake_up_common

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    110174 =C2=B125%    +145.0%     269959 =C2=B111%  lkp-snb01/hackbench/1=
600%-process-pipe
    110174 =C2=B125%    +145.0%     269959 =C2=B111%  TOTAL numa-meminfo.no=
de0.Slab

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    251603 =C2=B112%     -50.5%     124607 =C2=B117%  lkp-snb01/hackbench/1=
600%-process-pipe
    251603 =C2=B112%     -50.5%     124607 =C2=B117%  TOTAL numa-meminfo.no=
de1.KernelStack

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  35446837 =C2=B110%    +128.9%   81153081 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
  35446837 =C2=B110%    +128.9%   81153081 =C2=B1 3%  TOTAL numa-vmstat.nod=
e0.numa_local

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  35512157 =C2=B110%    +128.5%   81153946 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
  35512157 =C2=B110%    +128.5%   81153946 =C2=B1 3%  TOTAL numa-vmstat.nod=
e0.numa_hit

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     49301 =C2=B131%    +142.9%     119747 =C2=B119%  xps2/pigz/100%-512K
     49301 =C2=B131%    +142.9%     119747 =C2=B119%  TOTAL cpuidle.C1-NHM.=
time

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     15690 =C2=B112%     -50.7%       7735 =C2=B115%  lkp-snb01/hackbench/1=
600%-process-pipe
     15690 =C2=B112%     -50.7%       7735 =C2=B115%  TOTAL numa-vmstat.nod=
e1.nr_kernel_stack

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  9.01e+08 =C2=B1 9%     -52.7%  4.263e+08 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
  9.01e+08 =C2=B1 9%     -52.7%  4.263e+08 =C2=B1 4%  TOTAL cpuidle.C7-SNB.=
time

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    413966 =C2=B110%     -47.6%     216914 =C2=B115%  lkp-snb01/hackbench/1=
600%-process-pipe
    413966 =C2=B110%     -47.6%     216914 =C2=B115%  TOTAL numa-meminfo.no=
de1.SUnreclaim

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    103395 =C2=B110%     -47.9%      53859 =C2=B113%  lkp-snb01/hackbench/1=
600%-process-pipe
    103395 =C2=B110%     -47.9%      53859 =C2=B113%  TOTAL numa-vmstat.nod=
e1.nr_slab_unreclaimable

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       316 =C2=B112%    +100.0%        632 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
       316 =C2=B112%    +100.0%        632 =C2=B110%  TOTAL slabinfo.mnt_ca=
che.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       316 =C2=B112%    +100.0%        632 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
       316 =C2=B112%    +100.0%        632 =C2=B110%  TOTAL slabinfo.mnt_ca=
che.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       175 =C2=B113%     +81.9%        319 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
       175 =C2=B113%     +81.9%        319 =C2=B112%  TOTAL cpuidle.POLL.us=
age

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    447801 =C2=B1 9%     -45.5%     243827 =C2=B113%  lkp-snb01/hackbench/1=
600%-process-pipe
    447801 =C2=B1 9%     -45.5%     243827 =C2=B113%  TOTAL numa-meminfo.no=
de1.Slab

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.599e+08 =C2=B1 6%    +102.1%  3.233e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.599e+08 =C2=B1 6%    +102.1%  3.233e+08 =C2=B1 1%  TOTAL proc-vmstat.num=
a_local

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.599e+08 =C2=B1 6%    +102.1%  3.233e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.599e+08 =C2=B1 6%    +102.1%  3.233e+08 =C2=B1 1%  TOTAL proc-vmstat.num=
a_hit

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.633e+08 =C2=B1 6%    +101.2%  3.286e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.633e+08 =C2=B1 6%    +101.2%  3.286e+08 =C2=B1 1%  TOTAL proc-vmstat.pgf=
ree

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    362173 =C2=B114%     -67.0%     119526 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     17618 =C2=B1 1%     -12.5%      15410 =C2=B1 1%  xps2/pigz/100%-512K
    379792 =C2=B113%     -64.5%     134936 =C2=B1 1%  TOTAL softirqs.SCHED

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.506e+08 =C2=B1 8%     +97.7%  2.978e+08 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
 1.506e+08 =C2=B1 8%     +97.7%  2.978e+08 =C2=B1 1%  TOTAL proc-vmstat.pga=
lloc_normal

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    363748 =C2=B110%     -38.8%     222459 =C2=B113%  lkp-snb01/hackbench/1=
600%-process-pipe
    363748 =C2=B110%     -38.8%     222459 =C2=B113%  TOTAL numa-meminfo.no=
de1.PageTables

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  46501465 =C2=B125%     +80.7%   84012112 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
  46501465 =C2=B125%     +80.7%   84012112 =C2=B1 4%  TOTAL numa-vmstat.nod=
e1.numa_hit

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  46492299 =C2=B125%     +80.5%   83938512 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
  46492299 =C2=B125%     +80.5%   83938512 =C2=B1 4%  TOTAL numa-vmstat.nod=
e1.numa_local

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     90828 =C2=B110%     -39.8%      54666 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
     90828 =C2=B110%     -39.8%      54666 =C2=B110%  TOTAL numa-vmstat.nod=
e1.nr_page_table_pages

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   2182344 =C2=B1 8%     -36.1%    1394287 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
   2182344 =C2=B1 8%     -36.1%    1394287 =C2=B110%  TOTAL numa-meminfo.no=
de1.MemUsed

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.99 =C2=B124%     +46.2%       1.44 =C2=B113%  xps2/pigz/100%-512K
      0.99 =C2=B124%     +46.2%       1.44 =C2=B113%  TOTAL perf-profile.cp=
u-cycles.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_tim=
es.tick_sched_handle

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    169771 =C2=B1 5%     +45.6%     247119 =C2=B111%  lkp-snb01/hackbench/1=
600%-process-pipe
    169771 =C2=B1 5%     +45.6%     247119 =C2=B111%  TOTAL numa-meminfo.no=
de0.PageTables

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     42466 =C2=B1 5%     +44.8%      61470 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
     42466 =C2=B1 5%     +44.8%      61470 =C2=B112%  TOTAL numa-vmstat.nod=
e0.nr_page_table_pages

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  94704593 =C2=B122%     +73.1%  1.639e+08 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
  94704593 =C2=B122%     +73.1%  1.639e+08 =C2=B1 3%  TOTAL numa-numastat.n=
ode1.numa_hit

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  94703743 =C2=B122%     +73.1%  1.639e+08 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
  94703743 =C2=B122%     +73.1%  1.639e+08 =C2=B1 3%  TOTAL numa-numastat.n=
ode1.local_node

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    386264 =C2=B1 9%     -29.0%     274232 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
    386264 =C2=B1 9%     -29.0%     274232 =C2=B112%  TOTAL numa-meminfo.no=
de1.AnonPages

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.29 =C2=B132%     +72.4%       2.22 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.29 =C2=B132%     +72.4%       2.22 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles.__sb_start_write.pipe_write.new_sync_write.vfs_write.sys_write

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    386033 =C2=B1 9%     -28.9%     274285 =C2=B112%  lkp-snb01/hackbench/1=
600%-process-pipe
    386033 =C2=B1 9%     -28.9%     274285 =C2=B112%  TOTAL numa-meminfo.no=
de1.Active(anon)

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    451326 =C2=B1 7%     -29.5%     317996 =C2=B1 9%  lkp-snb01/hackbench/1=
600%-process-pipe
    451326 =C2=B1 7%     -29.5%     317996 =C2=B1 9%  TOTAL numa-meminfo.no=
de1.Active

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1054737 =C2=B1 7%     +47.7%    1557962 =C2=B1 8%  lkp-snb01/hackbench/1=
600%-process-pipe
   1054737 =C2=B1 7%     +47.7%    1557962 =C2=B1 8%  TOTAL numa-meminfo.no=
de0.MemUsed

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.78 =C2=B135%     +69.4%       1.33 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.78 =C2=B135%     +69.4%       1.33 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.system_call.__read_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.18 =C2=B133%     +70.1%       2.01 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.18 =C2=B133%     +70.1%       2.01 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.__srcu_read_unlock.fsnotify.vfs_write.sys_write.system_call_fastpa=
th

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3.36 =C2=B122%     +54.1%       5.18 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      3.36 =C2=B122%     +54.1%       5.18 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read=
.vfs_read

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       712 =C2=B112%     +55.6%       1108 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
       712 =C2=B112%     +55.6%       1108 =C2=B1 4%  TOTAL slabinfo.RAW.ac=
tive_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       712 =C2=B112%     +55.6%       1108 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
       712 =C2=B112%     +55.6%       1108 =C2=B1 4%  TOTAL slabinfo.RAW.nu=
m_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  18948890 =C2=B1 5%     +52.1%   28823331 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  18948890 =C2=B1 5%     +52.1%   28823331 =C2=B1 1%  TOTAL proc-vmstat.pgf=
ault

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.77 =C2=B134%     +69.4%       1.30 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.77 =C2=B134%     +69.4%       1.30 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.system_call.__write_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.05 =C2=B134%     +68.3%       1.77 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.05 =C2=B134%     +68.3%       1.77 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.__sb_end_write.pipe_write.new_sync_write.vfs_write.sys_write

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.60 =C2=B134%     +63.1%       0.97 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.60 =C2=B134%     +63.1%       0.97 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.mutex_lock.pipe_read.new_sync_read.vfs_read.sys_read

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.46 =C2=B134%     +63.8%       2.39 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.46 =C2=B134%     +63.8%       2.39 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.01 =C2=B131%     +61.5%       1.63 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.01 =C2=B131%     +61.5%       1.63 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.new_sync_read.vfs_read.sys_read.system_call_fastpath.__read_nocanc=
el

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     96485 =C2=B1 9%     -30.0%      67541 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
     96485 =C2=B1 9%     -30.0%      67541 =C2=B110%  TOTAL numa-vmstat.nod=
e1.nr_anon_pages

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     96426 =C2=B1 9%     -29.9%      67560 =C2=B110%  lkp-snb01/hackbench/1=
600%-process-pipe
     96426 =C2=B1 9%     -29.9%      67560 =C2=B110%  TOTAL numa-vmstat.nod=
e1.nr_active_anon

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.53 =C2=B131%     +59.6%       4.03 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.53 =C2=B131%     +59.6%       4.03 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_w=
rite.vfs_write

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.98 =C2=B135%     +58.7%       1.55 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.98 =C2=B135%     +58.7%       1.55 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.new_sync_write.vfs_write.sys_write.system_call_fastpath.__write_no=
cancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.75 =C2=B129%     +50.7%       1.13 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.75 =C2=B129%     +50.7%       1.13 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.mutex_unlock.new_sync_read.vfs_read.sys_read.system_call_fastpath

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     10716 =C2=B113%     -31.5%       7336 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
     10716 =C2=B113%     -31.5%       7336 =C2=B1 3%  TOTAL slabinfo.proc_i=
node_cache.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   2462781 =C2=B111%     -32.2%    1669715 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
    104190 =C2=B1 1%     -28.0%      75034 =C2=B1 7%  xps2/pigz/100%-512K
   2566971 =C2=B110%     -32.0%    1744750 =C2=B1 1%  TOTAL softirqs.RCU

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.14 =C2=B127%     +47.7%       1.68 =C2=B1 6%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.14 =C2=B127%     +47.7%       1.68 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.vfs_read.sys_read.system_call_fastpath.__read_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.26 =C2=B111%     +40.7%       3.18 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.26 =C2=B111%     +40.7%       3.18 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.mutex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpa=
th

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.49 =C2=B131%     +52.2%       2.26 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.49 =C2=B131%     +52.2%       2.26 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.copy_page_from_iter_iovec.copy_page_from_iter.pipe_write.new_sync_=
write.vfs_write

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3627 =C2=B1 4%     +31.3%       4761 =C2=B1 5%  xps2/pigz/100%-512K
      3627 =C2=B1 4%     +31.3%       4761 =C2=B1 5%  TOTAL slabinfo.anon_v=
ma.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3627 =C2=B1 4%     +31.3%       4761 =C2=B1 5%  xps2/pigz/100%-512K
      3627 =C2=B1 4%     +31.3%       4761 =C2=B1 5%  TOTAL slabinfo.anon_v=
ma.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.12 =C2=B114%     +35.1%       2.86 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      2.12 =C2=B114%     +35.1%       2.86 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_page_to_iter_iovec.copy_page_to_iter.pipe_read.new_sync_read.=
vfs_read

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.06 =C2=B133%     +56.8%       1.66 =C2=B113%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.06 =C2=B133%     +56.8%       1.66 =C2=B113%  TOTAL perf-profile.cp=
u-cycles.selinux_file_permission.security_file_permission.rw_verify_area.vf=
s_write.sys_write

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.97 =C2=B132%     +50.2%       2.96 =C2=B1 6%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.97 =C2=B132%     +50.2%       2.96 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.pipe_write.new_sync_write.vfs_write.sys_write.system_call_fastpath

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.72 =C2=B133%     +54.7%       1.12 =C2=B1 6%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.72 =C2=B133%     +54.7%       1.12 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.system_call_after_swapgs.__read_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8466 =C2=B1 6%     -20.5%       6731 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      8466 =C2=B1 6%     -20.5%       6731 =C2=B1 3%  TOTAL numa-vmstat.nod=
e1.nr_slab_reclaimable

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.94 =C2=B130%     +51.1%       1.41 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.94 =C2=B130%     +51.1%       1.41 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.fsnotify.vfs_write.sys_write.system_call_fastpath.__write_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     33833 =C2=B1 6%     -20.5%      26913 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
     33833 =C2=B1 6%     -20.5%      26913 =C2=B1 4%  TOTAL numa-meminfo.no=
de1.SReclaimable

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     49037 =C2=B114%     +38.1%      67717 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
     49037 =C2=B114%     +38.1%      67717 =C2=B1 2%  TOTAL cpuidle.C7-SNB.=
usage

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.73 =C2=B134%     +49.3%       1.09 =C2=B1 7%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.73 =C2=B134%     +49.3%       1.09 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.system_call_after_swapgs.__write_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9215 =C2=B121%     -22.4%       7152 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      9215 =C2=B121%     -22.4%       7152 =C2=B1 3%  TOTAL slabinfo.proc_i=
node_cache.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    221963 =C2=B111%     +25.7%     279098 =C2=B1 5%  lkp-snb01/hackbench/1=
600%-process-pipe
    221963 =C2=B111%     +25.7%     279098 =C2=B1 5%  TOTAL cpuidle.C1E-SNB=
.usage

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.96 =C2=B112%     +22.0%       1.17 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.96 =C2=B112%     +22.0%       1.17 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles._raw_spin_unlock_irqrestore.__wake_up_sync_key.pipe_write.new_sync=
_write.vfs_write

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1397 =C2=B1 8%     +23.4%       1723 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1397 =C2=B1 8%     +23.4%       1723 =C2=B1 3%  TOTAL slabinfo.sock_i=
node_cache.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1397 =C2=B1 8%     +23.4%       1723 =C2=B1 3%  lkp-snb01/hackbench/1=
600%-process-pipe
      1397 =C2=B1 8%     +23.4%       1723 =C2=B1 3%  TOTAL slabinfo.sock_i=
node_cache.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      6328 =C2=B1 5%     +26.3%       7995 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      6328 =C2=B1 5%     +26.3%       7995 =C2=B1 0%  TOTAL vmstat.procs.r

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     23979 =C2=B1 5%     +16.1%      27842 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
     23979 =C2=B1 5%     +16.1%      27842 =C2=B1 4%  TOTAL numa-meminfo.no=
de0.SReclaimable

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.91 =C2=B114%     +26.5%       1.15 =C2=B1 7%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.91 =C2=B114%     +26.5%       1.15 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.touch_atime.pipe_read.new_sync_read.vfs_read.sys_read

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5990 =C2=B1 6%     +16.0%       6951 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      5990 =C2=B1 6%     +16.0%       6951 =C2=B1 4%  TOTAL numa-vmstat.nod=
e0.nr_slab_reclaimable

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3249 =C2=B1 5%     -13.7%       2802 =C2=B1 4%  xps2/pigz/100%-512K
      3249 =C2=B1 5%     -13.7%       2802 =C2=B1 4%  TOTAL slabinfo.vm_are=
a_struct.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.36 =C2=B110%     +19.0%       1.62 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      1.36 =C2=B110%     +19.0%       1.62 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__read_nocancel

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.84 =C2=B125%     +37.2%       1.15 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      0.84 =C2=B125%     +37.2%       1.15 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.file_update_time.pipe_write.new_sync_write.vfs_write.sys_write

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2093 =C2=B1 6%     +21.6%       2545 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
      2093 =C2=B1 6%     +21.6%       2545 =C2=B1 2%  TOTAL uptime.idle

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2800 =C2=B1 1%     +13.1%       3168 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      2800 =C2=B1 1%     +13.1%       3168 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-96.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    393737 =C2=B1 5%      -8.2%     361521 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      3287 =C2=B1 4%     -13.2%       2852 =C2=B1 4%  xps2/pigz/100%-512K
    397025 =C2=B1 5%      -8.2%     364373 =C2=B1 1%  TOTAL slabinfo.vm_are=
a_struct.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    315204 =C2=B1 6%     +14.2%     360116 =C2=B1 7%  lkp-snb01/hackbench/1=
600%-process-pipe
    315204 =C2=B1 6%     +14.2%     360116 =C2=B1 7%  TOTAL numa-meminfo.no=
de0.Active

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9685 =C2=B1 6%     +20.0%      11625 =C2=B1 9%  xps2/pigz/100%-512K
      9685 =C2=B1 6%     +20.0%      11625 =C2=B1 9%  TOTAL meminfo.AnonHug=
ePages

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    164662 =C2=B1 6%      -8.9%     150041 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
    164662 =C2=B1 6%      -8.9%     150041 =C2=B1 1%  TOTAL proc-vmstat.nr_=
anon_pages

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    164625 =C2=B1 6%      -8.8%     150107 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
    164625 =C2=B1 6%      -8.8%     150107 =C2=B1 1%  TOTAL proc-vmstat.nr_=
active_anon

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2881 =C2=B1 1%     +11.4%       3208 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      2881 =C2=B1 1%     +11.4%       3208 =C2=B1 4%  TOTAL slabinfo.kmallo=
c-96.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8948 =C2=B1 5%      -8.2%       8216 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      8948 =C2=B1 5%      -8.2%       8216 =C2=B1 1%  TOTAL slabinfo.vm_are=
a_struct.num_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8948 =C2=B1 5%      -8.2%       8216 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      8948 =C2=B1 5%      -8.2%       8216 =C2=B1 1%  TOTAL slabinfo.vm_are=
a_struct.active_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1057 =C2=B1 4%      -8.9%        963 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1057 =C2=B1 4%      -8.9%        963 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.num_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1057 =C2=B1 4%      -8.9%        963 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1057 =C2=B1 4%      -8.9%        963 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.active_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     17987 =C2=B1 4%      -8.9%      16386 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
     17987 =C2=B1 4%      -8.9%      16386 =C2=B1 1%  TOTAL slabinfo.mm_str=
uct.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8196 =C2=B1 5%      -7.9%       7551 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      8196 =C2=B1 5%      -7.9%       7551 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.num_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8196 =C2=B1 5%      -7.9%       7551 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      8196 =C2=B1 5%      -7.9%       7551 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.active_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    524580 =C2=B1 5%      -7.9%     483309 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
    524580 =C2=B1 5%      -7.9%     483309 =C2=B1 1%  TOTAL slabinfo.kmallo=
c-64.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1396 =C2=B1 1%     -10.2%       1253 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      1396 =C2=B1 1%     -10.2%       1253 =C2=B1 0%  TOTAL slabinfo.sighan=
d_cache.num_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1396 =C2=B1 1%     -10.2%       1253 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      1396 =C2=B1 1%     -10.2%       1253 =C2=B1 0%  TOTAL slabinfo.sighan=
d_cache.active_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     20950 =C2=B1 1%     -10.2%      18812 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     20950 =C2=B1 1%     -10.2%      18812 =C2=B1 0%  TOTAL slabinfo.sighan=
d_cache.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      4787 =C2=B1 4%      -8.7%       4371 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      4787 =C2=B1 4%      -8.7%       4371 =C2=B1 0%  TOTAL slabinfo.task_s=
truct.num_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      4787 =C2=B1 4%      -8.7%       4371 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      4787 =C2=B1 4%      -8.7%       4371 =C2=B1 0%  TOTAL slabinfo.task_s=
truct.active_slabs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19150 =C2=B1 4%      -8.7%      17485 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     19150 =C2=B1 4%      -8.7%      17485 =C2=B1 0%  TOTAL slabinfo.task_s=
truct.num_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1385 =C2=B1 2%     +13.8%       1576 =C2=B1 4%  lkp-snb01/hackbench/1=
600%-process-pipe
      1385 =C2=B1 2%     +13.8%       1576 =C2=B1 4%  TOTAL numa-vmstat.nod=
e0.nr_alloc_batch

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     15330 =C2=B1 3%      -8.3%      14061 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     15330 =C2=B1 3%      -8.3%      14061 =C2=B1 0%  TOTAL slabinfo.kmallo=
c-1024.active_objs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    854631 =C2=B115%     -82.4%     150502 =C2=B1 8%  lkp-snb01/hackbench/1=
600%-process-pipe
      8975 =C2=B1 0%      -5.5%       8486 =C2=B1 0%  xps2/pigz/100%-512K
    863606 =C2=B115%     -81.6%     158988 =C2=B1 8%  TOTAL vmstat.system.in

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.089e+09 =C2=B1 5%     -48.6%  5.603e+08 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    225282 =C2=B1 3%     +75.6%     395515 =C2=B1 0%  xps2/pigz/100%-512K
 1.089e+09 =C2=B1 5%     -48.5%  5.607e+08 =C2=B1 2%  TOTAL time.involuntar=
y_context_switches

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 2.226e+09 =C2=B1 2%     -50.4%  1.104e+09 =C2=B1 2%  lkp-snb01/hackbench/1=
600%-process-pipe
    259846 =C2=B1 0%     +67.5%     435184 =C2=B1 0%  xps2/pigz/100%-512K
 2.227e+09 =C2=B1 2%     -50.4%  1.105e+09 =C2=B1 2%  TOTAL time.voluntary_=
context_switches

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   5516027 =C2=B1 0%     -50.2%    2748065 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
      1994 =C2=B1 1%     +61.1%       3212 =C2=B1 0%  xps2/pigz/100%-512K
   5518022 =C2=B1 0%     -50.1%    2751278 =C2=B1 1%  TOTAL vmstat.system.cs

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  17665402 =C2=B1 5%     +59.9%   28239273 =C2=B1 1%  lkp-snb01/hackbench/1=
600%-process-pipe
  17665402 =C2=B1 5%     +59.9%   28239273 =C2=B1 1%  TOTAL time.minor_page=
_faults

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1489 =C2=B1 1%      -5.8%       1402 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      1489 =C2=B1 1%      -5.8%       1402 =C2=B1 0%  TOTAL time.user_time

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     93.79 =C2=B1 0%      -2.7%      91.22 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     93.79 =C2=B1 0%      -2.7%      91.22 =C2=B1 0%  TOTAL turbostat.%c0

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2989 =C2=B1 0%      -2.5%       2916 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
      2989 =C2=B1 0%      -2.5%       2916 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
           =C2=B1 0%      +1.8%            =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
           =C2=B1 0%      +1.8%            =C2=B1 0%  TOTAL turbostat.Cor_W

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
           =C2=B1 0%      +1.5%            =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
           =C2=B1 0%      +1.5%            =C2=B1 0%  TOTAL turbostat.Pkg_W

d9dcf63eab17615  40c5e72463e42659e15eba0c8  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     16679 =C2=B1 1%      -2.0%      16340 =C2=B1 0%  lkp-snb01/hackbench/1=
600%-process-pipe
     16679 =C2=B1 1%      -2.0%      16340 =C2=B1 0%  TOTAL time.system_time


Legend:
	=C2=B1XX%    - stddev percent
	[+-]XX% - change percent


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

--===============8535738906057385195==--

