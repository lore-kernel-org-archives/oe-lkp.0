Content-Type: multipart/mixed; boundary="===============2703651104963858939=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] ec419c38ec: unixbench.score +2.7% improvement
Date: Wed, 13 Apr 2016 09:59:09 +0800
Message-ID: <20160413015909.GD659@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2703651104963858939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that unixbench.score +2.7% improvement on

git://bee.sh.intel.com/git/ydu19/tip flat_hierarchy_v2
commit ec419c38ecd766e8e41e3232e9f3d473c7d56b3a ("sched/fair: Drop out inco=
mplete current period when sched averages accrue")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/nhm-white2/shell8/u=
nixbench

commit: =

  19aa29a06823363298646327ecf461e70758b483
  ec419c38ecd766e8e41e3232e9f3d473c7d56b3a

19aa29a068233632 ec419c38ecd766e8e41e3232e9 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

     10397 =C2=B1  0%      +2.7%      10673 =C2=B1  0%  unixbench.score
   1839526 =C2=B1  0%     -57.9%     774575 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 1.245e+08 =C2=B1  0%      +2.7%  1.278e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    737.00 =C2=B1  0%      +1.8%     750.50 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    556.78 =C2=B1  0%      +3.7%     577.20 =C2=B1  0%  unixbench.time.user=
_time
     12060 =C2=B1 31%    +247.1%      41859 =C2=B1 36%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      5391 =C2=B1  1%     +16.0%       6252 =C2=B1  0%  meminfo.KernelStack
    137262 =C2=B1  0%     -38.4%      84501 =C2=B1  0%  softirqs.SCHED
   1839526 =C2=B1  0%     -57.9%     774575 =C2=B1  0%  time.involuntary_co=
ntext_switches
     37242 =C2=B1  0%     -30.6%      25830 =C2=B1  0%  vmstat.system.cs
     10778 =C2=B1  0%      -8.5%       9857 =C2=B1  0%  vmstat.system.in
     93.38 =C2=B1  0%      +1.4%      94.71 =C2=B1  0%  turbostat.%Busy
      2731 =C2=B1  0%      +1.4%       2770 =C2=B1  0%  turbostat.Avg_MHz
      1.48 =C2=B1  1%     -88.9%       0.17 =C2=B1  5%  turbostat.CPU%c1
      1676 =C2=B1  1%     +13.2%       1897 =C2=B1  1%  slabinfo.cred_jar.a=
ctive_objs
     10224 =C2=B1  3%     +12.1%      11462 =C2=B1  4%  slabinfo.kmalloc-32=
.active_objs
     10444 =C2=B1  3%     +11.6%      11658 =C2=B1  4%  slabinfo.kmalloc-32=
.num_objs
      2548 =C2=B1  4%      +5.7%       2692 =C2=B1  5%  slabinfo.pid.num_ob=
js
   5442033 =C2=B1  1%     -92.1%     432360 =C2=B1  8%  cpuidle.C1-NHM.time
     90309 =C2=B1  1%     -86.4%      12297 =C2=B1 27%  cpuidle.C1-NHM.usage
   9093083 =C2=B1  2%     -93.8%     567479 =C2=B1 10%  cpuidle.C1E-NHM.time
    138870 =C2=B1  1%     -94.2%       8031 =C2=B1 13%  cpuidle.C1E-NHM.usa=
ge
   7175826 =C2=B1  3%     -84.9%    1083522 =C2=B1  7%  cpuidle.C3-NHM.time
     91126 =C2=B1  3%     -95.1%       4434 =C2=B1  8%  cpuidle.C3-NHM.usage
     21635 =C2=B1  4%     -55.7%       9588 =C2=B1  2%  cpuidle.C6-NHM.usage
      1547 =C2=B1 17%     -91.6%     130.00 =C2=B1 18%  cpuidle.POLL.time
     81.00 =C2=B1 12%     -88.9%       9.00 =C2=B1 13%  cpuidle.POLL.usage
     63.96 =C2=B1 21%     -58.2%      26.70 =C2=B1 68%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     78.16 =C2=B1 39%     -87.7%       9.62 =C2=B1143%  sched_debug.cfs_rq:=
/.load.avg
     13.81 =C2=B1 36%     -89.1%       1.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.min
     83.85 =C2=B1  4%  +3.9e+07%   33031208 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.avg
    147.62 =C2=B1 11%  +2.8e+07%   41895680 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.max
     58.88 =C2=B1  1%  +3.9e+07%   22927040 =C2=B1 16%  sched_debug.cfs_rq:=
/.load_avg.min
     30.81 =C2=B1 15%    +2e+07%    6076286 =C2=B1 33%  sched_debug.cfs_rq:=
/.load_avg.stddev
   1967526 =C2=B1  0%   +2084.6%   42982191 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   1986032 =C2=B1  0%   +2073.0%   43156774 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.max
   1948430 =C2=B1  0%   +2097.8%   42822398 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
     12142 =C2=B1 27%    +795.8%     108769 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.09 =C2=B1-1066%  +18625.0%      17.55 =C2=B1  4%  sched_debug.cfs_r=
q:/.nr_spread_over.avg
      0.75 =C2=B1-133%   +5133.3%      39.25 =C2=B1 24%  sched_debug.cfs_rq=
:/.nr_spread_over.max
      0.25 =C2=B1-403%   +5061.5%      12.80 =C2=B1 22%  sched_debug.cfs_rq=
:/.nr_spread_over.stddev
     58.11 =C2=B1  3%   +1345.5%     840.00 =C2=B1  1%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     68.00 =C2=B1  2%   +1500.0%       1088 =C2=B1 10%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
     43.75 =C2=B1 33%   +1655.4%     768.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
      7.60 =C2=B1 56%   +1637.8%     132.02 =C2=B1 27%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     22539 =C2=B1 60%    +808.0%     204668 =C2=B1 55%  sched_debug.cfs_rq:=
/.spread0.max
    -15041 =C2=B1-70%    +761.6%    -129597 =C2=B1-39%  sched_debug.cfs_rq:=
/.spread0.min
     12137 =C2=B1 27%    +796.4%     108802 =C2=B1 20%  sched_debug.cfs_rq:=
/.spread0.stddev
    811.48 =C2=B1  0%  +43541.4%     354139 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.avg
    869.12 =C2=B1  1%  +1.9e+05%    1638566 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.max
    743.88 =C2=B1  1%    +727.2%       6153 =C2=B1 44%  sched_debug.cfs_rq:=
/.util_avg.min
     39.33 =C2=B1  6%  +1.4e+06%     555702 =C2=B1  8%  sched_debug.cfs_rq:=
/.util_avg.stddev
    480108 =C2=B1  5%     +13.3%     544065 =C2=B1  2%  sched_debug.cpu.avg=
_idle.avg
    212617 =C2=B1 21%     +54.0%     327335 =C2=B1 11%  sched_debug.cpu.avg=
_idle.min
    186637 =C2=B1  6%     -31.0%     128767 =C2=B1 12%  sched_debug.cpu.avg=
_idle.stddev
     57.17 =C2=B1  1%   +1383.2%     848.00 =C2=B1  3%  sched_debug.cpu.cpu=
_load[0].avg
     67.75 =C2=B1  0%   +1505.9%       1088 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].max
     38.50 =C2=B1 18%   +1894.8%     768.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].min
      9.14 =C2=B1 24%   +1344.5%     132.01 =C2=B1 30%  sched_debug.cpu.cpu=
_load[0].stddev
     57.66 =C2=B1  0%   +1352.1%     837.35 =C2=B1  1%  sched_debug.cpu.cpu=
_load[1].avg
     66.75 =C2=B1  0%   +1380.6%     988.31 =C2=B1  3%  sched_debug.cpu.cpu=
_load[1].max
     45.50 =C2=B1  5%   +1579.3%     764.06 =C2=B1  0%  sched_debug.cpu.cpu=
_load[1].min
      6.45 =C2=B1 12%   +1149.7%      80.65 =C2=B1 18%  sched_debug.cpu.cpu=
_load[1].stddev
     57.53 =C2=B1  0%   +1351.2%     834.91 =C2=B1  0%  sched_debug.cpu.cpu=
_load[2].avg
     66.12 =C2=B1  2%   +1316.4%     936.62 =C2=B1  2%  sched_debug.cpu.cpu=
_load[2].max
     48.50 =C2=B1  2%   +1476.8%     764.75 =C2=B1  1%  sched_debug.cpu.cpu=
_load[2].min
      5.22 =C2=B1  8%    +985.5%      56.65 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].stddev
     57.43 =C2=B1  0%   +1350.6%     833.06 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].avg
     65.12 =C2=B1  2%   +1290.8%     905.75 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].max
     50.56 =C2=B1  1%   +1433.4%     775.31 =C2=B1  1%  sched_debug.cpu.cpu=
_load[3].min
      4.47 =C2=B1  6%    +834.0%      41.77 =C2=B1 17%  sched_debug.cpu.cpu=
_load[3].stddev
     57.62 =C2=B1  0%   +1352.0%     836.62 =C2=B1  0%  sched_debug.cpu.cpu=
_load[4].avg
     64.62 =C2=B1  2%   +1281.2%     892.62 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].max
     51.56 =C2=B1  1%   +1437.8%     792.94 =C2=B1  1%  sched_debug.cpu.cpu=
_load[4].min
      3.96 =C2=B1 11%    +696.6%      31.52 =C2=B1 30%  sched_debug.cpu.cpu=
_load[4].stddev
      7178 =C2=B1 18%     -91.6%     599.44 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.min
     62.48 =C2=B1  6%     -84.6%       9.62 =C2=B1143%  sched_debug.cpu.loa=
d.avg
     14.50 =C2=B1 27%     -89.7%       1.50 =C2=B1  0%  sched_debug.cpu.loa=
d.min
      1280 =C2=B1 20%     +35.3%       1733 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.stddev
    424311 =C2=B1  0%     -30.2%     296261 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    442171 =C2=B1  0%     -29.6%     311189 =C2=B1  1%  sched_debug.cpu.nr_=
switches.max
    409575 =C2=B1  0%     -31.9%     278989 =C2=B1  1%  sched_debug.cpu.nr_=
switches.min
     65.50 =C2=B1 13%    +167.3%     175.06 =C2=B1 21%  sched_debug.cpu.nr_=
uninterruptible.max
    -68.31 =C2=B1-28%    +323.2%    -289.12 =C2=B1-39%  sched_debug.cpu.nr_=
uninterruptible.min
     43.89 =C2=B1 17%    +210.5%     136.27 =C2=B1 29%  sched_debug.cpu.nr_=
uninterruptible.stddev
    420593 =C2=B1  0%     -30.5%     292299 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
    435963 =C2=B1  0%     -30.0%     305050 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.max
    406393 =C2=B1  0%     -32.0%     276478 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.min
     20000 =C2=B1  2%     -90.7%       1865 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.avg
     21505 =C2=B1  2%     -78.9%       4535 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.max
     18583 =C2=B1  3%     -94.4%       1049 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.min
    209474 =C2=B1  0%     -22.9%     161408 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
    222079 =C2=B1  0%     -22.9%     171331 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.max
    198750 =C2=B1  0%     -24.5%     149958 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.min
    157706 =C2=B1  0%     -20.1%     125986 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
    163360 =C2=B1  0%     -20.5%     129947 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.max
    152244 =C2=B1  0%     -19.5%     122494 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.min
      3666 =C2=B1  6%     -35.3%       2373 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.stddev


nhm-white2: Nehalem
Memory: 4G





                             unixbench.time.user_time

  580 ++-----------------------O-----O-------------------------------------=
-+
      |                    OO O  OO O  OO OO                               =
 |
      |      O O   O OO OO                                                 =
 |
  575 +O OO O   O O                          O                             =
 |
      O                                                                    =
 |
      |                                                                    =
 |
  570 ++                                                                   =
 |
      |                                                                    =
 |
  565 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                               *    =
 |
  560 **.**. *.**. *.              .**.**. *.**. *.**.**. *.**. *.* .* :   =
 |
      |     *     *  **.**.  .*   *       *     *        *     *   *   :   =
 *
      |                    **  *.*                                      **.=
*|
  555 ++-------------------------------------------------------------------=
-+


                    unixbench.time.percent_of_cpu_this_job_got

  752 ++-------------------------------------------------------------------=
-+
      |                     O OO OO OO O  O  O                             =
 |
  750 OO OO OO OO OO OO OO O            O  O                               =
 |
  748 ++                                                                   =
 |
      |                                                                    =
 |
  746 ++                                                                   =
 |
      |                                                                    =
 |
  744 ++                                                                   =
 |
      |                                                                    =
 |
  742 ++                                                                   =
 |
  740 ++                                                                   =
 |
      |                                                                    =
 |
  738 ++               .*   *.  .*                                         =
 |
      **.**.**.**.**.**  *.*  **  *.**.**.**.**.**.**.**.**.**.**.**. *.**.=
**
  736 ++-------------------------------------------------------------*-----=
-+


                      unixbench.time.involuntary_context_switches

    2e+06 ++---------------------------------------------------------------=
-+
          |*. *.   .* .*               *. *.    * .* .* *.    * .**. *     =
 |
  1.8e+06 *+ *  ***  *  **.**.***.**.**  *  **.* *  *  *  **.* *    * *.**.=
**
          |                                                                =
 |
  1.6e+06 ++                                                               =
 |
          |                                                                =
 |
  1.4e+06 ++                                                               =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++ OO  O  OO OOO OO OOO OO OOO OO OO O                           =
 |
          OO    O O                                                        =
 |
   600000 ++---------------------------------------------------------------=
-+


                           time.involuntary_context_switches

    2e+06 ++---------------------------------------------------------------=
-+
          |*. *.   .* .*               *. *.    * .* .* *.    * .**. *     =
 |
  1.8e+06 *+ *  ***  *  **.**.***.**.**  *  **.* *  *  *  **.* *    * *.**.=
**
          |                                                                =
 |
  1.6e+06 ++                                                               =
 |
          |                                                                =
 |
  1.4e+06 ++                                                               =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++ OO  O  OO OOO OO OOO OO OOO OO OO O                           =
 |
          OO    O O                                                        =
 |
   600000 ++---------------------------------------------------------------=
-+


  =

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

--===============2703651104963858939==
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
dWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogZWM0MTlj
MzhlY2Q3NjZlOGU0MWUzMjMyZTlmM2Q0NzNjN2Q1NmIzYQptb2RlbDogTmVoYWxlbQptZW1vcnk6
IDRHCm5yX2NwdTogOApoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19w
YXJ0aXRpb246IApuZXRjb25zb2xlX3BvcnQ6IDY2NzEKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90
YXNrOiAxMDAlCnVuaXhiZW5jaDoKICB0ZXN0OiBzaGVsbDgKcXVldWU6IGJpc2VjdAp0ZXN0Ym94
OiBuaG0td2hpdGUyCnRib3hfZ3JvdXA6IG5obS13aGl0ZTIKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE2LTA0LTExIDEzOjQyOjQ5LjAyNjM0NTQ5NSArMDg6MDAKY29tcGls
ZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiBhZmYy
ODZjZmE5NGRiMDRiYzc3YzZkMTU4MDc5MDlmYTBjODRhODM4CnVzZXI6IGxrcApoZWFkX2NvbW1p
dDogNjhhYzA4YTk5YTM5MWI0Mjg4ZWRiYmFiY2FmZjllNzU0YTRmOGJiYwpiYXNlX2NvbW1pdDog
OTczNWEyMjc5OWI5MjE0ZDE3ZDNjMjMxZmUzNzdmYzg1MmYwNDJlOQpicmFuY2g6IGxpbnV4LWRl
dmVsL2RldmVsLWhvdXJseS0yMDE2MDQxMDIwCnJlc3VsdF9yb290OiAiL3Jlc3VsdC91bml4YmVu
Y2gvMTAwJS1zaGVsbDgvbmhtLXdoaXRlMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvZWM0MTljMzhlY2Q3NjZlOGU0MWUzMjMyZTlmM2Q0NzNjN2Q1NmIz
YS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obS13aGl0ZTIvYmlzZWN0X3VuaXhiZW5j
aC0xMDAlLXNoZWxsOC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWVj
NDE5YzM4ZWNkNzY2ZThlNDFlMzIzMmU5ZjNkNDczYzdkNTZiM2EtMjAxNjA0MTEtODAzMDQtMTV2
ODBiNi0wLnlhbWwiCm1heF91cHRpbWU6IDEwMTcuNDIKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFu
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9
L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbmhtLXdoaXRlMi9iaXNl
Y3RfdW5peGJlbmNoLTEwMCUtc2hlbGw4LWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2
XzY0LXJoZWwtZWM0MTljMzhlY2Q3NjZlOGU0MWUzMjMyZTlmM2Q0NzNjN2Q1NmIzYS0yMDE2MDQx
MS04MDMwNC0xNXY4MGI2LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhl
bAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA0MTAyMAotIGNvbW1pdD1l
YzQxOWMzOGVjZDc2NmU4ZTQxZTMyMzJlOWYzZDQ3M2M3ZDU2YjNhCi0gQk9PVF9JTUFHRT0vcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZWM0MTljMzhlY2Q3NjZlOGU0MWUzMjMyZTlmM2Q0
NzNjN2Q1NmIzYS92bWxpbnV6LTQuNi4wLXJjMi0wMDA4Ni1nZWM0MTljMwotIG1heF91cHRpbWU9
MTAxNwotIFJFU1VMVF9ST09UPS9yZXN1bHQvdW5peGJlbmNoLzEwMCUtc2hlbGw4L25obS13aGl0
ZTIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2VjNDE5
YzM4ZWNkNzY2ZThlNDFlMzIzMmU5ZjNkNDczYzdkNTZiM2EvMAotIExLUF9TRVJWRVI9aW5uCi0g
fDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAg
ZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0
YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRv
Zz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25z
b2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJk
OiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45L2VjNDE5YzM4ZWNkNzY2ZThlNDFlMzIzMmU5ZjNkNDczYzdkNTZi
M2EvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9s
a3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9lYzQxOWMzOGVjZDc2NmU4ZTQxZTMyMzJlOWYzZDQ3
M2M3ZDU2YjNhL2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2VjNDE5YzM4ZWNkNzY2ZThlNDFlMzIzMmU5ZjNkNDcz
YzdkNTZiM2Evdm1saW51ei00LjYuMC1yYzItMDAwODYtZ2VjNDE5YzMiCmRlcXVldWVfdGltZTog
MjAxNi0wNC0xMSAxMzo1MjozNy4xODQ5NDUwNzcgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQK
bG9hZGF2ZzogMzkuNDEgMTkuMzIgNy42MCAxLzE4MSAxOTA0MQpzdGFydF90aW1lOiAnMTQ2MDM1
Mzk4MicKZW5kX3RpbWU6ICcxNDYwMzU0MTcxJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2
MDQxMS0xMjI3MTAiCg==

--===============2703651104963858939==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0xMSAxMzo1MzowMiAuL1J1biBzaGVsbDggLWMgOAo=

--===============2703651104963858939==--

