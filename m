Content-Type: multipart/mixed; boundary="===============2792601811104346871=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 50a2a3b246: 6.8% unixbench.score
Date: Tue, 22 Sep 2015 10:07:05 +0800
Message-ID: <877fnjp5py.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2792601811104346871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 50a2a3b246149d041065a67ccb3e98145f780a2f ("sched/fair: Have task_mov=
e_group_fair() unconditionally add the entity load to the runqueue")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white2/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/she=
ll1

commit: =

  a05e8c51ff097ff73ec2947631d9102283545f7c
  50a2a3b246149d041065a67ccb3e98145f780a2f

a05e8c51ff097ff7 50a2a3b246149d041065a67ccb =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10017 =C2=B1  0%      +6.8%      10695 =C2=B1  0%  unixbench.score
   2659497 =C2=B1  1%      +9.9%    2923213 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  1.42e+08 =C2=B1  0%      +5.4%  1.497e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    359.00 =C2=B1  2%      +9.7%     394.00 =C2=B1  1%  unixbench.time.perc=
ent_of_cpu_this_job_got
    897.18 =C2=B1  0%      +6.5%     955.67 =C2=B1  0%  unixbench.time.syst=
em_time
    495.06 =C2=B1  0%     +10.6%     547.62 =C2=B1  0%  unixbench.time.user=
_time
   4510842 =C2=B1  0%      +7.5%    4847483 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    480122 =C2=B1  0%     +10.3%     529647 =C2=B1  0%  softirqs.RCU
    495.06 =C2=B1  0%     +10.6%     547.62 =C2=B1  0%  time.user_time
      1853 =C2=B1  3%      -8.4%       1697 =C2=B1  1%  uptime.idle
     15016 =C2=B1  9%      +8.6%      16300 =C2=B1  1%  vmstat.system.in
  12355927 =C2=B1115%     -67.9%    3962132 =C2=B1133%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  18212179 =C2=B1120%     -78.2%    3962132 =C2=B1133%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     46.62 =C2=B1  2%      +9.2%      50.91 =C2=B1  1%  turbostat.%Busy
      1338 =C2=B1  2%      +9.4%       1463 =C2=B1  1%  turbostat.Avg_MHz
     21.04 =C2=B1  2%     -13.9%      18.12 =C2=B1  0%  turbostat.CPU%c1
 1.065e+08 =C2=B1  0%     -24.9%   79962725 =C2=B1  0%  cpuidle.C1E-NHM.time
   1298155 =C2=B1  0%     -13.4%    1123926 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
  7.87e+08 =C2=B1  0%      -9.1%  7.152e+08 =C2=B1  0%  cpuidle.C3-NHM.time
   2381534 =C2=B1  0%     -25.0%    1786239 =C2=B1  0%  cpuidle.C3-NHM.usage
      1.50 =C2=B1 74%  +28083.3%     422.75 =C2=B1 22%  sched_debug.cfs_rq[=
0]:/.load_avg
   1347362 =C2=B1  9%     -63.5%     491982 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    122.50 =C2=B1129%   +1752.2%       2269 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      2.25 =C2=B1 36%  +13633.3%     309.00 =C2=B1 18%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
     10.50 =C2=B1 65%   +7852.4%     835.00 =C2=B1 12%  sched_debug.cfs_rq[=
0]:/.util_avg
      0.75 =C2=B1110%  +54333.3%     408.25 =C2=B1 22%  sched_debug.cfs_rq[=
1]:/.load_avg
   1437995 =C2=B1  2%     -65.6%     494833 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    125.50 =C2=B1125%   +1706.8%       2267 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      1.25 =C2=B1 66%  +24020.0%     301.50 =C2=B1 12%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
      8.50 =C2=B1 55%   +9700.0%     833.00 =C2=B1 12%  sched_debug.cfs_rq[=
1]:/.util_avg
     72.50 =C2=B1 30%    +114.1%     155.25 =C2=B1 24%  sched_debug.cfs_rq[=
2]:/.load
      2.00 =C2=B1 70%  +15875.0%     319.50 =C2=B1 16%  sched_debug.cfs_rq[=
2]:/.load_avg
   1382532 =C2=B1  4%     -64.6%     489518 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    125.75 =C2=B1127%   +1704.8%       2269 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      2.50 =C2=B1 60%  +11280.0%     284.50 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg_contrib
      9.75 =C2=B1 33%   +7459.0%     737.00 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.util_avg
      4.25 =C2=B1 93%   +9800.0%     420.75 =C2=B1 25%  sched_debug.cfs_rq[=
3]:/.load_avg
   1402802 =C2=B1  2%     -64.9%     492660 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    127.75 =C2=B1124%   +1644.0%       2228 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      4.50 =C2=B1 83%   +6138.9%     280.75 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.tg_load_avg_contrib
     14.50 =C2=B1 23%   +5537.9%     817.50 =C2=B1 12%  sched_debug.cfs_rq[=
3]:/.util_avg
     52365 =C2=B1  5%     +16.3%      60890 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.exec_clock
      1.50 =C2=B1100%  +27566.7%     415.00 =C2=B1 25%  sched_debug.cfs_rq[=
4]:/.load_avg
    662638 =C2=B1  5%     -23.7%     505740 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   -684773 =C2=B1-13%    -102.0%      13746 =C2=B1 28%  sched_debug.cfs_rq[=
4]:/.spread0
    129.00 =C2=B1124%   +1626.2%       2226 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      2.25 =C2=B1 72%  +11977.8%     271.75 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.tg_load_avg_contrib
     13.25 =C2=B1 62%   +6213.2%     836.50 =C2=B1 12%  sched_debug.cfs_rq[=
4]:/.util_avg
     52235 =C2=B1  5%     +14.6%      59862 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.exec_clock
      3.00 =C2=B1 52%  +13558.3%     409.75 =C2=B1 23%  sched_debug.cfs_rq[=
5]:/.load_avg
    661534 =C2=B1  5%     -22.7%     511492 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.min_vruntime
   -685906 =C2=B1-15%    -102.8%      19497 =C2=B1 28%  sched_debug.cfs_rq[=
5]:/.spread0
    134.25 =C2=B1119%   +1559.4%       2227 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      3.00 =C2=B1 52%   +8616.7%     261.50 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_load_avg_contrib
     15.00 =C2=B1 39%   +5310.0%     811.50 =C2=B1 11%  sched_debug.cfs_rq[=
5]:/.util_avg
     51367 =C2=B1  5%     +18.2%      60717 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.exec_clock
     99.25 =C2=B1162%    +411.3%     507.50 =C2=B1 20%  sched_debug.cfs_rq[=
6]:/.load_avg
    633721 =C2=B1  5%     -20.3%     505177 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   -713722 =C2=B1-15%    -101.8%      13179 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.spread0
    130.00 =C2=B1122%   +1615.4%       2230 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     16.00 =C2=B1 44%   +5578.1%     908.50 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.util_avg
     51705 =C2=B1  5%     +15.5%      59737 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.exec_clock
      9.25 =C2=B1118%   +3883.8%     368.50 =C2=B1 31%  sched_debug.cfs_rq[=
7]:/.load_avg
    642655 =C2=B1  5%     -20.6%     510351 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
   -704795 =C2=B1-15%    -102.6%      18352 =C2=B1 49%  sched_debug.cfs_rq[=
7]:/.spread0
    129.25 =C2=B1123%   +1620.5%       2223 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     10.00 =C2=B1104%   +2460.0%     256.00 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
     24.75 =C2=B1 57%   +3009.1%     769.50 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.util_avg
     46.00 =C2=B1 17%     +96.2%      90.25 =C2=B1 69%  sched_debug.cpu#0.c=
pu_load[0]
     53.00 =C2=B1 12%     +34.0%      71.00 =C2=B1 22%  sched_debug.cpu#0.l=
oad
    775771 =C2=B1114%     -68.6%     243664 =C2=B1  1%  sched_debug.cpu#0.s=
ched_goidle
     41.50 =C2=B1 13%     +32.5%      55.00 =C2=B1 13%  sched_debug.cpu#1.c=
pu_load[2]
     41.50 =C2=B1  9%     +30.7%      54.25 =C2=B1  9%  sched_debug.cpu#1.c=
pu_load[3]
     40.00 =C2=B1  8%     +33.8%      53.50 =C2=B1  6%  sched_debug.cpu#1.c=
pu_load[4]
    246556 =C2=B1  3%    +228.0%     808810 =C2=B1 69%  sched_debug.cpu#1.t=
twu_count
     93825 =C2=B1  6%    +610.3%     666397 =C2=B1 86%  sched_debug.cpu#1.t=
twu_local
     36.25 =C2=B1 26%     +40.7%      51.00 =C2=B1 12%  sched_debug.cpu#2.c=
pu_load[1]
     41.25 =C2=B1 19%     +29.1%      53.25 =C2=B1 13%  sched_debug.cpu#2.c=
pu_load[2]
      0.00 =C2=B1  0%      +Inf%       1.25 =C2=B1 34%  sched_debug.cpu#2.n=
r_running
    774754 =C2=B1 67%     -68.4%     245160 =C2=B1  0%  sched_debug.cpu#2.s=
ched_goidle
     41.50 =C2=B1 17%     +43.4%      59.50 =C2=B1  6%  sched_debug.cpu#4.c=
pu_load[0]
     85775 =C2=B1  3%     +13.1%      97001 =C2=B1  1%  sched_debug.cpu#4.t=
twu_local
     28.25 =C2=B1 27%     +84.1%      52.00 =C2=B1 12%  sched_debug.cpu#5.c=
pu_load[0]
    100187 =C2=B1  3%     +15.2%     115465 =C2=B1  6%  sched_debug.cpu#5.n=
r_load_updates
    501003 =C2=B1  4%    +416.5%    2587654 =C2=B1 80%  sched_debug.cpu#5.n=
r_switches
    501188 =C2=B1  4%    +416.3%    2587851 =C2=B1 80%  sched_debug.cpu#5.s=
ched_count
    194683 =C2=B1  6%    +538.1%    1242234 =C2=B1 83%  sched_debug.cpu#5.t=
twu_count
     80363 =C2=B1  6%   +1303.0%    1127469 =C2=B1 93%  sched_debug.cpu#5.t=
twu_local
     40.50 =C2=B1 13%     +16.0%      47.00 =C2=B1  8%  sched_debug.cpu#7.c=
pu_load[4]
      1.28 =C2=B1171%     -99.5%       0.01 =C2=B1 64%  sched_debug.rt_rq[4=
]:/.rt_time
      0.00 =C2=B1 59%  +42561.3%       2.09 =C2=B1 99%  sched_debug.rt_rq[5=
]:/.rt_time


nhm-white2: Nehalem
Memory: 4G




                                 cpuidle.C1E-NHM.time

   1.1e+08 ++--------------------------------------------------------------=
-+
           *.*.. .*.. .*.*..*.*..*.*.*..    .*.      .*.. .*.. .*.  .*.  .*=
.*
  1.05e+08 ++   *    *                  *.*.   *..*.*    *    *   *.   *.  =
 |
           |                                                               =
 |
     1e+08 ++                                                              =
 |
           |    O      O      O    O                                       =
 |
   9.5e+07 O+O    O  O      O    O                                         =
 |
           |             O                                                 =
 |
     9e+07 ++                                                              =
 |
           |                            O O  O                             =
 |
   8.5e+07 ++                        O                                     =
 |
           |                                                               =
 |
     8e+07 ++                                  O  O O O                    =
 |
           |                                                               =
 |
   7.5e+07 ++--------------------------------------------------------------=
-+


                                 cpuidle.C3-NHM.usage

  2.4e+06 *+*--*----*-*--*-*----*-*--*-*--*-*----*----*----*---------*----*=
-*
          |      *.           *                *    *   *.   *..*.*.   *.  =
 |
  2.3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.2e+06 ++                                                               =
 |
          |                                                                =
 |
  2.1e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 O+O  O O  O O    O  O O O                                        =
 |
          |              O                                                 =
 |
  1.9e+06 ++                                                               =
 |
          |                          O O  O O                              =
 |
  1.8e+06 ++                                   O O  O O                    =
 |
          |                                                                =
 |
  1.7e+06 ++---------------------------------------------------------------=
-+


                                   unixbench.score

  10800 ++-----------------------------------------------------------------=
-+
        |                                     O O                          =
 |
  10700 ++                                         O O                     =
 |
  10600 ++                          O O  O O                               =
 |
        |                                                                  =
 |
  10500 ++                                                                 =
 |
  10400 ++                                                                 =
 |
        O  O O  O O  O O  O O  O O                                         =
 |
  10300 ++                                                                 =
 |
  10200 ++                                                                 =
 |
        |                                                                  =
 |
  10100 ++                                                                 =
 |
  10000 *+.*.*..*.*..*.*..*.*..*.  .*.                        .*..*.*..*.*.=
.*
        |                        *.   *..*.*..*.*..*.*..*.*..*             =
 |
   9900 ++-----------------------------------------------------------------=
-+


                             unixbench.time.user_time

  550 ++-------------------------------------O-----------------------------=
-+
      |                                        O  O  O                     =
 |
  540 ++                             O  O O                                =
 |
      |                            O                                       =
 |
      |                                                                    =
 |
  530 ++                                                                   =
 |
      O  O O  O O  O  O O  O O  O                                          =
 |
  520 ++                                                                   =
 |
      |                                                                    =
 |
  510 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  500 ++                                                      .*..         =
 |
      *..*.*..*.*..*..*.*..*.*..*..*.*..*.*..*.*..*..*.*..*.*.    *.*..*.*.=
.*
  490 ++-------------------------------------------------------------------=
-+


                            unixbench.time.system_time

  960 ++-------------------------------------------------------------------=
-+
      |                                      O O  O  O                     =
 |
  950 ++                           O O  O O                                =
 |
      |                                                                    =
 |
  940 ++                                                                   =
 |
      O  O O  O O     O O  O O  O                                          =
 |
  930 ++           O                                                       =
 |
      |                                                                    =
 |
  920 ++                                                                   =
 |
      |                                                                    =
 |
  910 ++                                                                   =
 |
      |                                                                    =
 |
  900 *+.*.*..*.  .*..*.  .*.  .*..*.*..*.*..*.*..*..*.*..*.*..*..*.       =
.*
      |         *.      *.   *.                                     *..*.*.=
 |
  890 ++-------------------------------------------------------------------=
-+


                           unixbench.time.minor_page_faults

   1.5e+08 ++----------------------------------O--O------------------------=
-+
  1.49e+08 ++                             O         O O                    =
 |
           |                         O  O    O                             =
 |
  1.48e+08 ++                                                              =
 |
  1.47e+08 ++                                                              =
 |
           |                                                               =
 |
  1.46e+08 O+O  O O  O O O  O O  O O                                       =
 |
  1.45e+08 ++                                                              =
 |
  1.44e+08 ++                                                              =
 |
           |                                                               =
 |
  1.43e+08 ++                                                              =
 |
  1.42e+08 *+*..*.*..*.*.*.. .*..*. .*..                       .*.*..*.*..*=
.*
           |                *      *        .*.*..*.*.*..*.*..*            =
 |
  1.41e+08 ++                           *.*.                               =
 |
   1.4e+08 ++--------------------------------------------------------------=
-+


                       unixbench.time.voluntary_context_switches

   4.9e+06 ++--------------------------------------------------------------=
-+
           |                                      O                        =
 |
  4.85e+06 ++                                  O    O O                    =
 |
   4.8e+06 ++                                                              =
 |
           |                         O  O O  O                             =
 |
  4.75e+06 ++                                                              =
 |
   4.7e+06 ++                                                              =
 |
           |                                                               =
 |
  4.65e+06 O+O  O O  O O O  O O  O O                                       =
 |
   4.6e+06 ++                                                              =
 |
           |                                                               =
 |
  4.55e+06 ++                                                              =
 |
   4.5e+06 *+*..*.*..*.*.*..*.*..*.*.*..                       .*.*..*.*..*=
.*
           |                            *.*..*.*..*.*.*..*.*..*            =
 |
  4.45e+06 ++--------------------------------------------------------------=
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

--===============2792601811104346871==
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
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGU3YWUzZjVjY2ZmNTlmMTE5M2Yy
Mzg2Y2UyMTAxMTYzODNmOGZlNzkKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA0Rwpucl9jcHU6IDgK
aGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0
Y29uc29sZV9wb3J0OiA2NjcxCmNhdGVnb3J5OiBiZW5jaG1hcmsKdW5peGJlbmNoOgogIHRlc3Q6
IHNoZWxsMQpxdWV1ZTogY3ljbGljCnRlc3Rib3g6IG5obS13aGl0ZTIKdGJveF9ncm91cDogbmht
LXdoaXRlMgprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDktMTkgMTA6
MzU6MDguMzIyODA4MjU4ICswODowMAppZDogYmE0ZDU1NGQzYjU3ZjkzOTUyZmU5YWRhODc2ZTZm
ODRiNTM0NjQxMwp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGU3YWUz
ZjVjY2ZmNTlmMTE5M2YyMzg2Y2UyMTAxMTYzODNmOGZlNzkKYmFzZV9jb21taXQ6IDZmZjMzZjM5
MDJjM2IxYzVkMGRiNmIxZTJjNzBiNmQ3NmZiYTM1N2YKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZl
bC1ob3VybHktMjAxNTA5MTkxMwprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvZTdhZTNmNWNjZmY1OWYxMTkzZjIzODZjZTIxMDExNjM4M2Y4ZmU3OS92bWxpbnV6LTQuMy4w
LXJjMS13bC0wMTgwOC1nZTdhZTNmNSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC91bml4YmVuY2gvc2hlbGwxL25obS13aGl0ZTIvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2U3YWUzZjVjY2Zm
NTlmMTE5M2YyMzg2Y2UyMTAxMTYzODNmOGZlNzkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9uaG0td2hpdGUyL2N5Y2xpY191bml4YmVuY2gtc2hlbGwxLXg4Nl82NC1yaGVsLUNZQ0xJQ19I
RUFELWU3YWUzZjVjY2ZmNTlmMTE5M2YyMzg2Y2UyMTAxMTYzODNmOGZlNzktMjAxNTA5MTktODcy
OS0xcDA2enloLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA5LTE5IDE0OjM0OjU3LjU1ODkz
MTI4MCArMDg6MDAKbWF4X3VwdGltZTogMTM5Ni44NAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4v
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0v
ZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9uaG0td2hpdGUyL2N5Y2xp
Y191bml4YmVuY2gtc2hlbGwxLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWU3YWUzZjVjY2ZmNTlm
MTE5M2YyMzg2Y2UyMTAxMTYzODNmOGZlNzktMjAxNTA5MTktODcyOS0xcDA2enloLTAueWFtbAot
IEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9k
ZXZlbC1ob3VybHktMjAxNTA5MTkxMwotIGNvbW1pdD1lN2FlM2Y1Y2NmZjU5ZjExOTNmMjM4NmNl
MjEwMTE2MzgzZjhmZTc5Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvZTdhZTNmNWNjZmY1OWYxMTkzZjIzODZjZTIxMDExNjM4M2Y4ZmU3OS92bWxpbnV6LTQuMy4w
LXJjMS13bC0wMTgwOC1nZTdhZTNmNQotIG1heF91cHRpbWU9MTM5NgotIFJFU1VMVF9ST09UPS9y
ZXN1bHQvdW5peGJlbmNoL3NoZWxsMS9uaG0td2hpdGUyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9lN2FlM2Y1Y2NmZjU5ZjExOTNmMjM4NmNlMjEwMTE2
MzgzZjhmZTc5LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAs
MTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3
YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0x
IHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3Jh
bWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10
dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6
Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9lN2FlM2Y1
Y2NmZjU5ZjExOTNmMjM4NmNlMjEwMTE2MzgzZjhmZTc5L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6
ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwv
bGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdW5peGJlbmNoLmNn
eiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxMS4xNiA1LjgzIDIuMzcgMS8xNTMgMTQ3
NjcKc3RhcnRfdGltZTogJzE0NDI2NDQ1MjEnCmVuZF90aW1lOiAnMTQ0MjY0NDg5OScKdmVyc2lv
bjogIi9sa3AvbGtwLy5zcmMtMjAxNTA5MTktMTMyOTMwIgo=

--===============2792601811104346871==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9SdW4gc2hlbGwxCg==

--===============2792601811104346871==--

