Content-Type: multipart/mixed; boundary="===============0664391073242113122=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 6e7cab53c9: unixbench.score 2.7% improvement
Date: Tue, 19 Apr 2016 10:21:47 +0800
Message-ID: <20160419022147.GB31421@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0664391073242113122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the unixbench.score +2.7% improvement on:

git://bee.sh.intel.com/git/ydu19/tip flat_hierarchy_v1.2
commit 6e7cab53c9f783791705c900d12b5eccb4938440 ("sched/fair: Remove leftov=
er period when sched averages accrue")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/nhm-white2/shell8/u=
nixbench

commit: =

  8bc776c99c82240cf91a1b2a42136bdf9004ae16
  6e7cab53c9f783791705c900d12b5eccb4938440

8bc776c99c82240c 6e7cab53c9f783791705c900d1 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:4     last_state.is_incomplete_run
         %stddev     %change         %stddev
             \          |                \  =

     10400 =C2=B1  0%      +2.7%      10677 =C2=B1  0%  unixbench.score
   1838780 =C2=B1  0%     -57.6%     778800 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 1.245e+08 =C2=B1  0%      +2.7%  1.279e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    736.25 =C2=B1  0%      +1.9%     750.00 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    558.03 =C2=B1  0%      +3.6%     577.91 =C2=B1  0%  unixbench.time.user=
_time
      5358 =C2=B1  1%     +15.9%       6209 =C2=B1  0%  meminfo.KernelStack
    332.25 =C2=B1  1%     +16.1%     385.67 =C2=B1  0%  proc-vmstat.nr_kern=
el_stack
      1660 =C2=B1  1%     +13.7%       1887 =C2=B1  0%  slabinfo.cred_jar.a=
ctive_objs
    137725 =C2=B1  0%     -39.3%      83558 =C2=B1  0%  softirqs.SCHED
   1838780 =C2=B1  0%     -57.6%     778800 =C2=B1  0%  time.involuntary_co=
ntext_switches
    235.05 =C2=B1  0%     -11.9%     207.06 =C2=B1  0%  uptime.idle
     37202 =C2=B1  0%     -30.3%      25924 =C2=B1  0%  vmstat.system.cs
     10784 =C2=B1  0%      -7.5%       9978 =C2=B1  0%  vmstat.system.in
     93.30 =C2=B1  0%      +1.5%      94.72 =C2=B1  0%  turbostat.%Busy
      2729 =C2=B1  0%      +1.5%       2771 =C2=B1  0%  turbostat.Avg_MHz
      1.48 =C2=B1  1%     -89.0%       0.16 =C2=B1  2%  turbostat.CPU%c1
   5384304 =C2=B1  1%     -91.9%     434216 =C2=B1  2%  cpuidle.C1-NHM.time
     89950 =C2=B1  1%     -87.2%      11554 =C2=B1  7%  cpuidle.C1-NHM.usage
   9082096 =C2=B1  1%     -94.4%     506892 =C2=B1  2%  cpuidle.C1E-NHM.time
    137950 =C2=B1  1%     -94.7%       7341 =C2=B1  5%  cpuidle.C1E-NHM.usa=
ge
   7193562 =C2=B1  4%     -82.5%    1257977 =C2=B1 13%  cpuidle.C3-NHM.time
     89945 =C2=B1  4%     -94.9%       4622 =C2=B1  6%  cpuidle.C3-NHM.usage
     23531 =C2=B1  8%     -55.1%      10566 =C2=B1  8%  cpuidle.C6-NHM.usage
      1709 =C2=B1 15%     -92.7%     124.00 =C2=B1 15%  cpuidle.POLL.time
     83.00 =C2=B1  8%     -88.8%       9.33 =C2=B1  5%  cpuidle.POLL.usage
     63.74 =C2=B1 19%     -73.3%      17.03 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     73.09 =C2=B1 18%     -97.8%       1.62 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.avg
    202.38 =C2=B1 46%     -99.0%       2.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.max
     12.44 =C2=B1 32%     -87.9%       1.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.min
     63.17 =C2=B1 46%     -99.7%       0.22 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.stddev
     86.61 =C2=B1  5%  +3.9e+07%   33743136 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.avg
    151.50 =C2=B1 14%  +2.9e+07%   43843754 =C2=B1  2%  sched_debug.cfs_rq:=
/.load_avg.max
     58.88 =C2=B1  1%  +4.2e+07%   24874922 =C2=B1 11%  sched_debug.cfs_rq:=
/.load_avg.min
     32.02 =C2=B1 23%  +1.9e+07%    6050630 =C2=B1 21%  sched_debug.cfs_rq:=
/.load_avg.stddev
   1968797 =C2=B1  0%   +2082.6%   42971060 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   1986695 =C2=B1  0%   +2070.9%   43128549 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
   1949176 =C2=B1  0%   +2096.8%   42820332 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
     10884 =C2=B1 17%    +830.1%     101238 =C2=B1 40%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.08 =C2=B1 72%  +22086.7%      17.33 =C2=B1  3%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
      0.62 =C2=B1 72%   +5420.0%      34.50 =C2=B1  4%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      0.21 =C2=B1 72%   +5297.0%      11.16 =C2=B1  8%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     59.09 =C2=B1  2%   +1307.9%     832.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     67.94 =C2=B1  2%   +1407.3%       1024 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
     47.56 =C2=B1 14%   +1514.7%     768.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
      6.27 =C2=B1 30%   +1668.2%     110.85 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
      7796 =C2=B1 68%   -1935.4%    -143099 =C2=B1-64%  sched_debug.cfs_rq:=
/.spread0.avg
    -11809 =C2=B1-60%   +2386.8%    -293674 =C2=B1-40%  sched_debug.cfs_rq:=
/.spread0.min
     10877 =C2=B1 17%    +831.2%     101294 =C2=B1 40%  sched_debug.cfs_rq:=
/.spread0.stddev
    807.66 =C2=B1  1%  +45873.1%     371304 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.avg
    867.56 =C2=B1  1%  +1.9e+05%    1637161 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.max
    730.44 =C2=B1  0%    +508.4%       4443 =C2=B1 64%  sched_debug.cfs_rq:=
/.util_avg.min
     41.66 =C2=B1  9%  +1.4e+06%     573825 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.stddev
    469251 =C2=B1  7%     +26.0%     591177 =C2=B1  5%  sched_debug.cpu.avg=
_idle.avg
    211409 =C2=B1 16%    +105.7%     434763 =C2=B1 12%  sched_debug.cpu.avg=
_idle.min
    192961 =C2=B1 12%     -39.9%     116038 =C2=B1 14%  sched_debug.cpu.avg=
_idle.stddev
      2.00 =C2=B1 28%     -42.3%       1.15 =C2=B1 30%  sched_debug.cpu.clo=
ck.stddev
      1.99 =C2=B1 28%     -42.2%       1.15 =C2=B1 30%  sched_debug.cpu.clo=
ck_task.stddev
     58.80 =C2=B1  2%   +1314.9%     832.00 =C2=B1  3%  sched_debug.cpu.cpu=
_load[0].avg
     68.00 =C2=B1  2%   +1405.9%       1024 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].max
     48.38 =C2=B1 15%   +1311.2%     682.67 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].min
      6.18 =C2=B1 39%   +2221.5%     143.43 =C2=B1 25%  sched_debug.cpu.cpu=
_load[0].stddev
     58.53 =C2=B1  2%   +1309.2%     824.80 =C2=B1  1%  sched_debug.cpu.cpu=
_load[1].avg
     67.25 =C2=B1  2%   +1369.1%     988.00 =C2=B1  3%  sched_debug.cpu.cpu=
_load[1].max
     49.50 =C2=B1  6%   +1347.8%     716.67 =C2=B1 10%  sched_debug.cpu.cpu=
_load[1].min
      5.49 =C2=B1 21%   +1648.7%      96.08 =C2=B1 40%  sched_debug.cpu.cpu=
_load[1].stddev
     58.20 =C2=B1  1%   +1315.3%     823.77 =C2=B1  1%  sched_debug.cpu.cpu=
_load[2].avg
     66.50 =C2=B1  2%   +1295.0%     927.67 =C2=B1  2%  sched_debug.cpu.cpu=
_load[2].max
     49.81 =C2=B1  6%   +1383.9%     739.17 =C2=B1  7%  sched_debug.cpu.cpu=
_load[2].min
      5.19 =C2=B1 25%   +1070.4%      60.75 =C2=B1 47%  sched_debug.cpu.cpu=
_load[2].stddev
     57.96 =C2=B1  1%   +1330.1%     828.93 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].avg
     65.50 =C2=B1  3%   +1270.6%     897.75 =C2=B1  1%  sched_debug.cpu.cpu=
_load[3].max
     50.31 =C2=B1  5%   +1411.9%     760.67 =C2=B1  5%  sched_debug.cpu.cpu=
_load[3].min
      4.60 =C2=B1 27%    +803.4%      41.52 =C2=B1 40%  sched_debug.cpu.cpu=
_load[3].stddev
     58.10 =C2=B1  1%   +1340.0%     836.69 =C2=B1  0%  sched_debug.cpu.cpu=
_load[4].avg
     64.56 =C2=B1  4%   +1272.7%     886.25 =C2=B1  2%  sched_debug.cpu.cpu=
_load[4].max
     51.50 =C2=B1  3%   +1422.8%     784.25 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].min
      4.13 =C2=B1 31%    +688.6%      32.53 =C2=B1 33%  sched_debug.cpu.cpu=
_load[4].stddev
     64.74 =C2=B1  4%     -81.0%      12.29 =C2=B1122%  sched_debug.cpu.loa=
d.avg
     12.38 =C2=B1 34%     -87.9%       1.50 =C2=B1  0%  sched_debug.cpu.loa=
d.min
      0.00 =C2=B1 13%     -18.1%       0.00 =C2=B1  8%  sched_debug.cpu.nex=
t_balance.stddev
      3.36 =C2=B1  6%     -14.2%       2.88 =C2=B1 14%  sched_debug.cpu.nr_=
running.stddev
    424371 =C2=B1  0%     -29.9%     297353 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    443398 =C2=B1  0%     -28.8%     315529 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
    410840 =C2=B1  0%     -31.2%     282757 =C2=B1  2%  sched_debug.cpu.nr_=
switches.min
     90.50 =C2=B1  7%     +93.3%     174.92 =C2=B1 22%  sched_debug.cpu.nr_=
uninterruptible.max
    -81.81 =C2=B1-31%     +94.0%    -158.75 =C2=B1-24%  sched_debug.cpu.nr_=
uninterruptible.min
     52.60 =C2=B1 14%     +94.7%     102.40 =C2=B1 22%  sched_debug.cpu.nr_=
uninterruptible.stddev
    420259 =C2=B1  0%     -30.2%     293195 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
    437167 =C2=B1  0%     -29.6%     307604 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.max
    407813 =C2=B1  0%     -31.3%     280108 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.min
     19966 =C2=B1  1%     -91.5%       1703 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.avg
     21891 =C2=B1  3%     -83.4%       3642 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.max
     18268 =C2=B1  2%     -94.3%       1042 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.min
      1151 =C2=B1 11%     -31.0%     794.30 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.stddev
    209338 =C2=B1  0%     -22.5%     162153 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
    222545 =C2=B1  0%     -21.0%     175766 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.max
    198999 =C2=B1  0%     -24.2%     150879 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.min
    157836 =C2=B1  0%     -20.1%     126120 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
    163936 =C2=B1  0%     -20.9%     129672 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.max
    152229 =C2=B1  0%     -19.6%     122365 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.min
      4082 =C2=B1 15%     -42.9%       2332 =C2=B1 22%  sched_debug.cpu.ttw=
u_local.stddev


nhm-white2: 8 threads Nehalem with 4G memory




                             unixbench.time.user_time

  600 ++-----------------------------------O-------------------------------=
-+
      OO.OO.OO.O*.OO  O.OO.OO.OO.OO.OO.O*.O*.O*.**.**.**.**.**.**.**.**.**.=
**
  500 ++           :  :                                                    =
 |
      |            :  :                                                    =
 |
      |            :  :                                                    =
 |
  400 ++            : :                                                    =
 |
      |             : :                                                    =
 |
  300 ++            : :                                                    =
 |
      |             ::                                                     =
 |
  200 ++            ::                                                     =
 |
      |             ::                                                     =
 |
      |              :                                                     =
 |
  100 ++             :                                                     =
 |
      |              :                                                     =
 |
    0 ++--------O----O------------------O----------------------------------=
-+


                           unixbench.time.minor_page_faults

  1.4e+08 ++---------------------------------------------------------------=
-+
          OO OO OOO  O O O OO OOO OO OOO O  OO O                           =
 |
  1.2e+08 **.**.***.**.* *.**.***.**.***.**.**.***.**.***.**.***.**.***.**.=
**
          |            : :                                                 =
 |
    1e+08 ++           : :                                                 =
 |
          |            : :                                                 =
 |
    8e+07 ++           : :                                                 =
 |
          |            : :                                                 =
 |
    6e+07 ++            ::                                                 =
 |
          |             :                                                  =
 |
    4e+07 ++            :                                                  =
 |
          |             :                                                  =
 |
    2e+07 ++            :                                                  =
 |
          |             :                                                  =
 |
        0 ++--------O---O-----------------O--------------------------------=
-+


                      unixbench.time.involuntary_context_switches

    2e+06 ++---------------------------------------------------------------=
-+
  1.8e+06 **.**.***.**.* *.**.***.**.***.**.**.***.**.***.**.***.**.***.**.=
**
          |            : :                                                 =
 |
  1.6e+06 ++           : :                                                 =
 |
  1.4e+06 ++           : :                                                 =
 |
          |            : :                                                 =
 |
  1.2e+06 ++           : :                                                 =
 |
    1e+06 ++           : :                                                 =
 |
   800000 ++            :         OO   O O                                 =
 |
          OO OO OOO  O O:O OO OOO    OO     OO O                           =
 |
   600000 ++            :                                                  =
 |
   400000 ++            :                                                  =
 |
          |             :                                                  =
 |
   200000 ++            :                                                  =
 |
        0 ++--------O---O-----------------O--------------------------------=
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
Xiaolong Ye

--===============0664391073242113122==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IApkZWZh
dWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNmU3Y2Fi
NTNjOWY3ODM3OTE3MDVjOTAwZDEyYjVlY2NiNDkzODQ0MAptb2RlbDogTmVoYWxlbQptZW1vcnk6
IDRHCm5yX2NwdTogOApoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19w
YXJ0aXRpb246IApuZXRjb25zb2xlX3BvcnQ6IDY2NzEKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90
YXNrOiAxMDAlCnVuaXhiZW5jaDoKICB0ZXN0OiBzaGVsbDgKcXVldWU6IGJpc2VjdAp0ZXN0Ym94
OiBuaG0td2hpdGUyCnRib3hfZ3JvdXA6IG5obS13aGl0ZTIKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE2LTA0LTE4IDE5OjAxOjE4LjEzNzk1NDk4NSArMDg6MDAKY29tcGls
ZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiAwODFl
YzBmNWZjNDdjNDE2NDU4YmM0MmIzZTU2ZTgxMDJjYmNjMTkwCnVzZXI6IGxrcApoZWFkX2NvbW1p
dDogZTMwNTY5ZTNlZWM0ZTIxMmRiYTQ0MjA0NTAwMTBjNTBmZDJjOTk2NQpiYXNlX2NvbW1pdDog
OTczNWEyMjc5OWI5MjE0ZDE3ZDNjMjMxZmUzNzdmYzg1MmYwNDJlOQpicmFuY2g6IGxpbnV4LWRl
dmVsL2RldmVsLWhvdXJseS0yMDE2MDQwOTA5CnJlc3VsdF9yb290OiAiL3Jlc3VsdC91bml4YmVu
Y2gvMTAwJS1zaGVsbDgvbmhtLXdoaXRlMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvNmU3Y2FiNTNjOWY3ODM3OTE3MDVjOTAwZDEyYjVlY2NiNDkzODQ0
MC8xIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obS13aGl0ZTIvYmlzZWN0X3VuaXhiZW5j
aC0xMDAlLXNoZWxsOC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTZl
N2NhYjUzYzlmNzgzNzkxNzA1YzkwMGQxMmI1ZWNjYjQ5Mzg0NDAtMjAxNjA0MTgtMTIyNzM1LXJh
djU3bS0xLnlhbWwiCm1heF91cHRpbWU6IDEwMTcuNAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4v
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0v
ZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9uaG0td2hpdGUyL2Jpc2Vj
dF91bml4YmVuY2gtMTAwJS1zaGVsbDgtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZf
NjQtcmhlbC02ZTdjYWI1M2M5Zjc4Mzc5MTcwNWM5MDBkMTJiNWVjY2I0OTM4NDQwLTIwMTYwNDE4
LTEyMjczNS1yYXY1N20tMS55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVs
Ci0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDQwOTA5Ci0gY29tbWl0PTZl
N2NhYjUzYzlmNzgzNzkxNzA1YzkwMGQxMmI1ZWNjYjQ5Mzg0NDAKLSBCT09UX0lNQUdFPS9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82ZTdjYWI1M2M5Zjc4Mzc5MTcwNWM5MDBkMTJiNWVj
Y2I0OTM4NDQwL3ZtbGludXotNC42LjAtcmMyLTAwMDg1LWc2ZTdjYWI1Ci0gbWF4X3VwdGltZT0x
MDE3Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC91bml4YmVuY2gvMTAwJS1zaGVsbDgvbmhtLXdoaXRl
Mi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNmU3Y2Fi
NTNjOWY3ODM3OTE3MDVjOTAwZDEyYjVlY2NiNDkzODQ0MC8xCi0gTEtQX1NFUlZFUj1pbm4KLSB8
Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBk
ZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3Rh
bGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9n
PXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNv
bGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6
ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvNmU3Y2FiNTNjOWY3ODM3OTE3MDVjOTAwZDEyYjVlY2NiNDkzODQ0
MC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xr
cC9iZW5jaG1hcmtzL3VuaXhiZW5jaC5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzZlN2NhYjUzYzlmNzgzNzkxNzA1YzkwMGQxMmI1ZWNj
YjQ5Mzg0NDAvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xp
bnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNmU3Y2FiNTNjOWY3ODM3OTE3MDVjOTAwZDEyYjVlY2Ni
NDkzODQ0MC92bWxpbnV6LTQuNi4wLXJjMi0wMDA4NS1nNmU3Y2FiNSIKZGVxdWV1ZV90aW1lOiAy
MDE2LTA0LTE4IDE5OjQxOjI5LjE4OTUzMTY1MSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZAps
b2FkYXZnOiA0Mi44NCAyMC44NiA4LjIwIDEvMTgwIDE0ODY0CnN0YXJ0X3RpbWU6ICcxNDYwOTc5
NzE2JwplbmRfdGltZTogJzE0NjA5Nzk5MDUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYw
NDE4LTE4NTcxNyIK

--===============0664391073242113122==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0xOCAxOTo0MTo1NiAuL1J1biBzaGVsbDggLWMgOAo=

--===============0664391073242113122==--

