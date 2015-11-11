Content-Type: multipart/mixed; boundary="===============4009563852494466204=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [intel_pstate] 10e4d2e8d3: -13.9% will-it-scale.per_thread_ops
Date: Wed, 11 Nov 2015 13:22:23 +0800
Message-ID: <87k2ppm7ow.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4009563852494466204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Philippe-Longepe/intel_pstate-Use-the-cpu-=
load-to-determine-the-PercentPerformance/20151103-173647
commit 10e4d2e8d38473d3964068469dd03f8c69fca4e2 ("intel_pstate: Use the cpu=
 load to determine the PercentPerformance")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lituya/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/pow=
ersave/page_fault2

commit: =

  1ab68460b1d0671968b35e04f21efcf1ce051916
  10e4d2e8d38473d3964068469dd03f8c69fca4e2

1ab68460b1d06719 10e4d2e8d38473d3964068469d =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    298605 =C2=B1  0%     -13.9%     257084 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      6070 =C2=B1  3%     -12.0%       5344 =C2=B1  4%  will-it-scale.time.=
involuntary_context_switches
   2082000 =C2=B1  0%      -4.4%    1990194 =C2=B1  4%  will-it-scale.time.=
maximum_resident_set_size
 2.431e+08 =C2=B1  0%     -27.8%  1.755e+08 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
    317.00 =C2=B1  0%     -15.8%     267.00 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    929.86 =C2=B1  0%     -17.9%     763.32 =C2=B1  0%  will-it-scale.time.=
system_time
     38.72 =C2=B1  0%     +36.8%      52.96 =C2=B1  1%  will-it-scale.time.=
user_time
    160590 =C2=B1  0%     -30.9%     110986 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
     82310 =C2=B1  4%     -10.1%      74007 =C2=B1  2%  softirqs.RCU
     76219 =C2=B1  1%     -11.4%      67558 =C2=B1  2%  softirqs.SCHED
     21099 =C2=B1  0%     -12.8%      18403 =C2=B1  0%  vmstat.system.cs
     17755 =C2=B1  0%      -9.1%      16139 =C2=B1  0%  vmstat.system.in
  50721188 =C2=B1 11%     -24.3%   38373487 =C2=B1  7%  cpuidle.C1-HSW.time
   2915214 =C2=B1  0%     -12.7%    2544540 =C2=B1  0%  cpuidle.C1-HSW.usage
      1349 =C2=B1  7%     -43.6%     761.75 =C2=B1 16%  cpuidle.C1E-HSW.usa=
ge
      1016 =C2=B1 10%     -29.3%     718.75 =C2=B1 14%  cpuidle.C3-HSW.usage
    209143 =C2=B1  0%     -22.2%     162794 =C2=B1  0%  cpuidle.C6-HSW.usage
    134.00 =C2=B1 21%    +342.4%     592.75 =C2=B1 13%  cpuidle.POLL.usage
 5.851e+08 =C2=B1  0%     -11.6%  5.172e+08 =C2=B1  0%  proc-vmstat.numa_hit
 5.851e+08 =C2=B1  0%     -11.6%  5.172e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
  84352492 =C2=B1  0%     -11.0%   75114262 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
 5.008e+08 =C2=B1  0%     -11.7%  4.421e+08 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 5.813e+08 =C2=B1  0%     -11.6%  5.136e+08 =C2=B1  0%  proc-vmstat.pgfault
 5.843e+08 =C2=B1  0%     -11.6%  5.165e+08 =C2=B1  0%  proc-vmstat.pgfree
      6070 =C2=B1  3%     -12.0%       5344 =C2=B1  4%  time.involuntary_co=
ntext_switches
 2.431e+08 =C2=B1  0%     -27.8%  1.755e+08 =C2=B1  0%  time.minor_page_fau=
lts
    317.00 =C2=B1  0%     -15.8%     267.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    929.86 =C2=B1  0%     -17.9%     763.32 =C2=B1  0%  time.system_time
     38.72 =C2=B1  0%     +36.8%      52.96 =C2=B1  1%  time.user_time
    160590 =C2=B1  0%     -30.9%     110986 =C2=B1  0%  time.voluntary_cont=
ext_switches
     49.45 =C2=B1  0%      -6.1%      46.46 =C2=B1  0%  turbostat.%Busy
      1628 =C2=B1  0%     -24.9%       1223 =C2=B1  0%  turbostat.Avg_MHz
      3292 =C2=B1  0%     -20.1%       2632 =C2=B1  0%  turbostat.Bzy_MHz
     30.06 =C2=B1  0%     +12.9%      33.94 =C2=B1  0%  turbostat.CPU%c6
     39.00 =C2=B1  3%     -18.6%      31.75 =C2=B1  1%  turbostat.CoreTmp
     44.25 =C2=B1  0%     -11.9%      39.00 =C2=B1  0%  turbostat.PkgTmp
     60.82 =C2=B1  0%     -21.9%      47.48 =C2=B1  0%  turbostat.PkgWatt
      9.46 =C2=B1  1%     -12.3%       8.30 =C2=B1  0%  turbostat.RAMWatt
    114.00 =C2=B1  6%     -22.8%      88.00 =C2=B1 32%  sched_debug.cfs_rq[=
0]:/.load_avg
    114.75 =C2=B1  6%     -22.4%      89.00 =C2=B1 31%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
    747.75 =C2=B1  4%     -20.2%     597.00 =C2=B1 13%  sched_debug.cfs_rq[=
0]:/.util_avg
     35.00 =C2=B1  7%     -22.1%      27.25 =C2=B1 11%  sched_debug.cfs_rq[=
10]:/.load_avg
     35.00 =C2=B1  7%     -22.1%      27.25 =C2=B1 11%  sched_debug.cfs_rq[=
10]:/.tg_load_avg_contrib
     65687 =C2=B1  9%     -16.3%      55002 =C2=B1 10%  sched_debug.cfs_rq[=
13]:/.exec_clock
    796846 =C2=B1  7%     -13.6%     688111 =C2=B1  9%  sched_debug.cfs_rq[=
13]:/.min_vruntime
    645.50 =C2=B1  3%      -6.9%     601.00 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    646.00 =C2=B1  3%      -6.5%     604.25 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     53581 =C2=B1 21%     -34.5%      35083 =C2=B1 33%  sched_debug.cfs_rq[=
15]:/.exec_clock
    642502 =C2=B1 22%     -32.0%     436623 =C2=B1 30%  sched_debug.cfs_rq[=
15]:/.min_vruntime
    645.75 =C2=B1  3%      -6.4%     604.50 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    675242 =C2=B1 13%     -18.5%     550135 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     21.50 =C2=B1 34%     -66.3%       7.25 =C2=B1 38%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
     29.75 =C2=B1 24%     -26.9%      21.75 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    523.50 =C2=B1 15%     -21.6%     410.50 =C2=B1 19%  sched_debug.cfs_rq[=
4]:/.util_avg
     17.50 =C2=B1 48%     -50.0%       8.75 =C2=B1 27%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
   -306445 =C2=B1-46%     -69.1%     -94668 =C2=B1-159%  sched_debug.cfs_rq=
[7]:/.spread0
    475.50 =C2=B1 11%     +14.8%     545.75 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.util_avg
     32.25 =C2=B1  7%     -19.4%      26.00 =C2=B1 11%  sched_debug.cpu#10.=
cpu_load[1]
     30.50 =C2=B1  9%     -18.0%      25.00 =C2=B1 12%  sched_debug.cpu#10.=
cpu_load[3]
     30.25 =C2=B1 10%     -17.4%      25.00 =C2=B1 12%  sched_debug.cpu#10.=
cpu_load[4]
     71304 =C2=B1 16%     -19.2%      57587 =C2=B1  9%  sched_debug.cpu#13.=
nr_load_updates
      8607 =C2=B1 29%     -41.9%       4998 =C2=B1 32%  sched_debug.cpu#14.=
ttwu_count
     30.50 =C2=B1 24%     -48.4%      15.75 =C2=B1 20%  sched_debug.cpu#15.=
cpu_load[0]
     43.50 =C2=B1  9%     -21.3%      34.25 =C2=B1 10%  sched_debug.cpu#2.c=
pu_load[2]
     42.50 =C2=B1 15%     -37.1%      26.75 =C2=B1 27%  sched_debug.cpu#3.c=
pu_load[0]
     43.00 =C2=B1 14%     -34.9%      28.00 =C2=B1 20%  sched_debug.cpu#3.c=
pu_load[1]
     42.75 =C2=B1 13%     -34.5%      28.00 =C2=B1 20%  sched_debug.cpu#3.c=
pu_load[2]
     42.50 =C2=B1 12%     -34.7%      27.75 =C2=B1 18%  sched_debug.cpu#3.c=
pu_load[3]
     42.00 =C2=B1 10%     -34.5%      27.50 =C2=B1 18%  sched_debug.cpu#3.c=
pu_load[4]
     37.75 =C2=B1 13%     -26.5%      27.75 =C2=B1 27%  sched_debug.cpu#4.c=
pu_load[4]
     28.00 =C2=B1 37%     +40.2%      39.25 =C2=B1  6%  sched_debug.cpu#7.c=
pu_load[0]
      1131 =C2=B1 16%     +41.7%       1602 =C2=B1 19%  sched_debug.cpu#7.c=
urr->pid
     42073 =C2=B1 30%     +56.9%      66014 =C2=B1  6%  sched_debug.cpu#7.n=
r_load_updates
      4725 =C2=B1 34%     -30.5%       3284 =C2=B1  6%  sched_debug.cpu#8.s=
ched_goidle


lituya: Grantley Haswell
Memory: 16G




                                 turbostat.Avg_MHz

  1650 ++-----------*-**-*-*-*-**-*----------------------------------------=
-+
       *.*.**.*.*.*                 *.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*=
.*
  1600 ++                                                                  =
 |
  1550 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++   O     O   O                                                    =
 |
  1450 O+O O  O O   O  O O O O OO O O O O OO                               =
 |
       |                                                                   =
 |
  1400 ++                                                                  =
 |
  1350 ++                                                                  =
 |
       |                                                                   =
 |
  1300 ++                                                                  =
 |
  1250 ++                                                                  =
 |
       |                                       O O O                       =
 |
  1200 ++------------------------------------O-----------------------------=
-+


                                  turbostat._Busy

    50 ++------------------------------------------------------------------=
-+
       |           .*.**.*.*.*.**.*.                                       =
 |
  49.5 *+*.* .*.*.*                 *.*.*.**.*.*.*.**.*.*.*.**.*.*.*.*.**.*=
.*
    49 ++   *                                                              =
 |
       |                                                                   =
 |
  48.5 ++                                                                  =
 |
       |                                                                   =
 |
    48 ++         O                                                        =
 |
       O O OO O O   O O      O  O       O                                  =
 |
  47.5 ++              O O O   O  O O O   OO                               =
 |
    47 ++                                                                  =
 |
       |                                                                   =
 |
  46.5 ++                                    O O   O                       =
 |
       |                                         O                         =
 |
    46 ++------------------------------------------------------------------=
-+


                                turbostat.PkgWatt

  64 ++--------------------------------------------------------------------=
-+
     |                                     .*          *                   =
 |
  62 ++*.*. *.*.*. .*.   .**. .*.*.*.*.*.**  +   .*.*.* +   .*.*.*.*.* .*.*=
.*
  60 *+    *      *   *.*    *                *.*        *.*          *    =
 |
     |                                                                     =
 |
  58 ++                                                                    =
 |
  56 ++                                                                    =
 |
     O   O OO O O         OO O O O   O O O                                 =
 |
  54 ++O          O O O O          O      O                                =
 |
  52 ++                                                                    =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
  48 ++                                                                    =
 |
     |                                      O O O O                        =
 |
  46 ++--------------------------------------------------------------------=
-+


                            will-it-scale.per_thread_ops

  305000 ++----------------------------------------------------------------=
-+
  300000 ++                         .*.*.*.                                =
 |
         *.*.*  *.*.**.*.   *. .*.**       **.*.*.**.*.*.**.*.*.**.*.*.**.*=
.*
  295000 ++  :  :        *.*  *                                            =
 |
  290000 ++  :  :                                                          =
 |
         |   : :                                                           =
 |
  285000 O+   ::                                                           =
 |
  280000 ++O OO:O   O    O OO O                                            =
 |
  275000 ++   ::  O    O        O OO O O O OO                              =
 |
         |    :      O                                                     =
 |
  270000 ++   *                                                            =
 |
  265000 ++                                                                =
 |
         |                                                                 =
 |
  260000 ++                                       OO                       =
 |
  255000 ++-----------------------------------O-O--------------------------=
-+


                          will-it-scale.time.system_time

  940 ++-------------------------------------------------------------------=
-+
      *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*=
.*
  920 ++                                                                   =
 |
  900 ++                                                                   =
 |
      |                                                                    =
 |
  880 ++                                                                   =
 |
  860 ++                                                                   =
 |
      O     OO                                                             =
 |
  840 ++O O    O O   O O  O O O O OO O O O O                               =
 |
  820 ++           O    O                                                  =
 |
      |                                                                    =
 |
  800 ++                                                                   =
 |
  780 ++                                                                   =
 |
      |                                                                    =
 |
  760 ++-------------------------------------O-OO-O------------------------=
-+


                  will-it-scale.time.percent_of_cpu_this_job_got

  320 ++--*------------**-*---*-*-*----*-----------------------------------=
-+
      *.*   **.*.*.*.*      *      *.*   *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*=
.*
  310 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  290 O+  O OO   O   O          O      O                                   =
 |
      | O      O   O   OO O O O   OO O   O O                               =
 |
  280 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  270 ++                                     O O  O                        =
 |
      |                                         O                          =
 |
  260 ++-------------------------------------------------------------------=
-+


                         will-it-scale.time.minor_page_faults

  2.5e+08 ++---------------------------------------------------------------=
-+
          *.**. .*.**.               .*.**.*.**.*.*.**.*.*.**.*.*.**.*.*.**=
.*
  2.4e+08 ++   *      *.*.**.*.*.**.*                                      =
 |
  2.3e+08 ++                                                               =
 |
          |                                                                =
 |
  2.2e+08 ++                                                               =
 |
          O                                                                =
 |
  2.1e+08 ++OO O O  O     OO O O OO O O OO O O                             =
 |
          |        O  O O                                                  =
 |
    2e+08 ++                                                               =
 |
  1.9e+08 ++                                                               =
 |
          |                                                                =
 |
  1.8e+08 ++                                                               =
 |
          |                                   O O O O                      =
 |
  1.7e+08 ++---------------------------------------------------------------=
-+


                    will-it-scale.time.voluntary_context_switches

  170000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  160000 *+*.**.*.*.*               .*.*.*.**.*.*.**.*.*.**.*.*.**.*.*.**.*=
.*
         |           *.*.*.**.*.*.**                                       =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  140000 O+  OO O                                                          =
 |
         | O        O    O OO O O OO O O O OO                              =
 |
  130000 ++       O  O O                                                   =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  120000 ++                                                                =
 |
         |                                                                 =
 |
  110000 ++-----------------------------------O-O-OO-----------------------=
-+


                                 time.system_time

  940 ++-------------------------------------------------------------------=
-+
      *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*=
.*
  920 ++                                                                   =
 |
  900 ++                                                                   =
 |
      |                                                                    =
 |
  880 ++                                                                   =
 |
  860 ++                                                                   =
 |
      O     OO                                                             =
 |
  840 ++O O    O O   O O  O O O O OO O O O O                               =
 |
  820 ++           O    O                                                  =
 |
      |                                                                    =
 |
  800 ++                                                                   =
 |
  780 ++                                                                   =
 |
      |                                                                    =
 |
  760 ++-------------------------------------O-OO-O------------------------=
-+


                         time.percent_of_cpu_this_job_got

  320 ++--*------------**-*---*-*-*----*-----------------------------------=
-+
      *.*   **.*.*.*.*      *      *.*   *.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*=
.*
  310 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  290 O+  O OO   O   O          O      O                                   =
 |
      | O      O   O   OO O O O   OO O   O O                               =
 |
  280 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  270 ++                                     O O  O                        =
 |
      |                                         O                          =
 |
  260 ++-------------------------------------------------------------------=
-+


                                time.minor_page_faults

  2.5e+08 ++---------------------------------------------------------------=
-+
          *.**. .*.**.               .*.**.*.**.*.*.**.*.*.**.*.*.**.*.*.**=
.*
  2.4e+08 ++   *      *.*.**.*.*.**.*                                      =
 |
  2.3e+08 ++                                                               =
 |
          |                                                                =
 |
  2.2e+08 ++                                                               =
 |
          O                                                                =
 |
  2.1e+08 ++OO O O  O     OO O O OO O O OO O O                             =
 |
          |        O  O O                                                  =
 |
    2e+08 ++                                                               =
 |
  1.9e+08 ++                                                               =
 |
          |                                                                =
 |
  1.8e+08 ++                                                               =
 |
          |                                   O O O O                      =
 |
  1.7e+08 ++---------------------------------------------------------------=
-+


                           time.voluntary_context_switches

  170000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  160000 *+*.**.*.*.*               .*.*.*.**.*.*.**.*.*.**.*.*.**.*.*.**.*=
.*
         |           *.*.*.**.*.*.**                                       =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  140000 O+  OO O                                                          =
 |
         | O        O    O OO O O OO O O O OO                              =
 |
  130000 ++       O  O O                                                   =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  120000 ++                                                                =
 |
         |                                                                 =
 |
  110000 ++-----------------------------------O-O-OO-----------------------=
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

--===============4009563852494466204==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcG93ZXJzYXZlCmRlZmF1
bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0OiBmZTc3ZTgz
ZTljYjI1ZDcxZmNlOWRlODc4MmQ2ZDc1YzYzMTQ1ZDY4Cm1vZGVsOiBHcmFudGxleSBIYXN3ZWxs
Cm5yX2NwdTogMTYKbWVtb3J5OiAxNkcKaGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6
IApyb290ZnNfcGFydGl0aW9uOiAKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAg
ZnJlcTogODAwCndpbGwtaXQtc2NhbGU6CiAgdGVzdDogcGFnZV9mYXVsdDIKcXVldWU6IGN5Y2xp
Ywp0ZXN0Ym94OiBsaXR1eWEKdGJveF9ncm91cDogbGl0dXlhCmtjb25maWc6IHg4Nl82NC1yaGVs
CmVucXVldWVfdGltZTogMjAxNS0xMS0wNyAwODowNDo1NS41OTY0MjEwNzkgKzA4OjAwCmlkOiBj
ZDhmYjhjYTUzMTZmNjc0NmMyMWQ3MDJiYWMyMDA0Mjg1NjAyM2UyCnVzZXI6IGxrcApjb21waWxl
cjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogZmU3N2U4M2U5Y2IyNWQ3MWZjZTlkZTg3ODJkNmQ3NWM2
MzE0NWQ2OApiYXNlX2NvbW1pdDogNmExM2ZlYjljODI4MDNlMmI4MTVlY2E3MmZhN2E5ZjU1NjFk
Nzg2MQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTEwODEyCmtlcm5lbDog
Ii9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9mZTc3ZTgzZTljYjI1ZDcxZmNlOWRlODc4
MmQ2ZDc1YzYzMTQ1ZDY4L3ZtbGludXotNC4zLjAtYm9jaHMtdmlydGlvLWdwdS13bC1hdGgtMTMz
MzgtZ2ZlNzdlODMiCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRf
cm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wb3dlcnNhdmUtcGFnZV9mYXVsdDIvbGl0dXlh
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9mZTc3ZTgz
ZTljYjI1ZDcxZmNlOWRlODc4MmQ2ZDc1YzYzMTQ1ZDY4LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hl
ZHVsZWQvbGl0dXlhL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBvd2Vyc2F2ZS1wYWdlX2ZhdWx0Mi14
ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC1mZTc3ZTgzZTljYjI1ZDcxZmNlOWRlODc4MmQ2ZDc1YzYz
MTQ1ZDY4LTIwMTUxMTA3LTQxNTMyLTJ3dTJyMy0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0x
MS0wOCAxOTo1NTozNC40NDU5MTYyODEgKzA4OjAwCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAi
L29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJf
YXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQv
bGl0dXlhL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBvd2Vyc2F2ZS1wYWdlX2ZhdWx0Mi14ODZfNjQt
cmhlbC1DWUNMSUNfSEVBRC1mZTc3ZTgzZTljYjI1ZDcxZmNlOWRlODc4MmQ2ZDc1YzYzMTQ1ZDY4
LTIwMTUxMTA3LTQxNTMyLTJ3dTJyMy0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2
XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMTA4MTIKLSBj
b21taXQ9ZmU3N2U4M2U5Y2IyNWQ3MWZjZTlkZTg3ODJkNmQ3NWM2MzE0NWQ2OAotIEJPT1RfSU1B
R0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2ZlNzdlODNlOWNiMjVkNzFmY2U5ZGU4
NzgyZDZkNzVjNjMxNDVkNjgvdm1saW51ei00LjMuMC1ib2Nocy12aXJ0aW8tZ3B1LXdsLWF0aC0x
MzMzOC1nZmU3N2U4MwotIG1heF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2ls
bC1pdC1zY2FsZS9wb3dlcnNhdmUtcGFnZV9mYXVsdDIvbGl0dXlhL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9mZTc3ZTgzZTljYjI1ZDcxZmNlOWRlODc4
MmQ2ZDc1YzYzMTQ1ZDY4LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9
dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lz
cnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBh
bmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBs
b2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29u
c29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZf
NjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9m
ZTc3ZTgzZTljYjI1ZDcxZmNlOWRlODc4MmQ2ZDc1YzYzMTQ1ZDY4L21vZHVsZXMuY2d6IgpibV9p
bml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNn
eiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmln
LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0
LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1p
dC1zY2FsZS5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMTMuMjQgNi43MyAyLjcw
IDEvMjIwIDQ4ODIKc3RhcnRfdGltZTogJzE0NDY5ODM3NTgnCmVuZF90aW1lOiAnMTQ0Njk4NDA2
MycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTExMDYtMTkwMDIxIgo=

--===============4009563852494466204==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUwL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNh
dmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgouL3J1bnRlc3QucHkgcGFnZV9mYXVsdDIgMzIgYm90aCAxIDggMTIgMTYK

--===============4009563852494466204==--

