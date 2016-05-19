Content-Type: multipart/mixed; boundary="===============4674481775692959683=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [writeback] 074e46e1ad: fio.write_bw_MBps -10.5% regression
Date: Thu, 19 May 2016 09:16:57 +0800
Message-ID: <20160519011657.GB11822@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4674481775692959683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed fio.write_bw_MBps -10.5% regression due to commit:

commit 074e46e1aded0ac0474a5db4d50d514d9dc42e78 ("writeback: throttle buffe=
red writeback")
https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git wb-bu=
f-throttle

in testcase: fio-basic
on test machine: lkp-bdw-ep2:  threads Broadwell-EP with 128G memory
with following conditions: bs=3D4k/cpufreq_governor=3Dperformance/disk=3D1S=
SD/fs=3Dxfs/ioengine=3Dsync/nr_task=3D8/runtime=3D300/rw=3Dwrite/test_size=
=3D512g



Details are as below:
---------------------------------------------------------------------------=
----------------------->


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runtim=
e/rw/tbox_group/test_size/testcase:
  4k/gcc-4.9/performance/1SSD/xfs/sync/x86_64-rhel/8/debian-x86_64-2015-02-=
07.cgz/300/write/lkp-bdw-ep2/512g/fio-basic

commit: =

  565d33b77b63e5f70357ebf97c4141044854f621
  074e46e1aded0ac0474a5db4d50d514d9dc42e78

565d33b77b63e5f7 074e46e1aded0ac0474a5db4d5 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -25%            :5     kmsg.ENERGY_PERF_BIAS:Set_to'=
normal',was'performance'
          1:4          -25%            :5     kmsg.ENERGY_PERF_BIAS:View_an=
d_update_with_x86_energy_perf_policy(#)
         %stddev     %change         %stddev
             \          |                \  =

    289.61 =C2=B1  0%      +3.7%     300.36 =C2=B1  0%  fio.time.elapsed_ti=
me
    289.61 =C2=B1  0%      +3.7%     300.36 =C2=B1  0%  fio.time.elapsed_ti=
me.max
 1.074e+09 =C2=B1  0%      -7.1%  9.971e+08 =C2=B1  0%  fio.time.file_syste=
m_outputs
      3446 =C2=B1  9%     -64.2%       1234 =C2=B1 27%  fio.time.involuntar=
y_context_switches
    105.50 =C2=B1  0%     -12.8%      92.00 =C2=B1  0%  fio.time.percent_of=
_cpu_this_job_got
    268.34 =C2=B1  0%     -10.4%     240.47 =C2=B1  1%  fio.time.system_time
     98347 =C2=B1  0%      +4.6%     102892 =C2=B1  0%  fio.time.voluntary_=
context_switches
      1812 =C2=B1  0%     -10.5%       1622 =C2=B1  0%  fio.write_bw_MBps
    463987 =C2=B1  0%     -10.5%     415407 =C2=B1  0%  fio.write_iops
    239.56 =C2=B1  0%      -1.9%     235.12 =C2=B1  0%  pmeter.Average_Acti=
ve_Power
      1944 =C2=B1  0%      -8.8%       1773 =C2=B1  0%  pmeter.performance_=
per_watt
      3446 =C2=B1  9%     -64.2%       1234 =C2=B1 27%  time.involuntary_co=
ntext_switches
    105.50 =C2=B1  0%     -12.8%      92.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    268.34 =C2=B1  0%     -10.4%     240.47 =C2=B1  1%  time.system_time
   1774732 =C2=B1  0%     -10.9%    1581981 =C2=B1  0%  vmstat.io.bo
      8570 =C2=B1  1%     -48.5%       4417 =C2=B1  1%  vmstat.system.cs
     17991 =C2=B1  0%     -11.1%      15999 =C2=B1  0%  vmstat.system.in
     31090 =C2=B1  2%      -8.5%      28447 =C2=B1  1%  meminfo.Active(anon)
      7169 =C2=B1 12%     -32.5%       4839 =C2=B1  0%  meminfo.AnonHugePag=
es
     28207 =C2=B1  3%      -8.3%      25865 =C2=B1  1%  meminfo.AnonPages
    969710 =C2=B1  0%     -12.9%     844795 =C2=B1  0%  meminfo.Writeback
      4437 =C2=B1 22%     -32.7%       2986 =C2=B1 24%  numa-vmstat.node0.n=
r_active_anon
      3915 =C2=B1 19%     -27.6%       2835 =C2=B1 18%  numa-vmstat.node0.n=
r_anon_pages
    125910 =C2=B1  6%     -14.5%     107612 =C2=B1  7%  numa-vmstat.node0.n=
r_writeback
     17293 =C2=B1  5%      -6.5%      16170 =C2=B1  5%  numa-vmstat.node1.n=
r_slab_unreclaimable
    120890 =C2=B1  5%     -14.7%     103101 =C2=B1  8%  numa-vmstat.node1.n=
r_writeback
 1.837e+08 =C2=B1  5%     +12.8%  2.072e+08 =C2=B1  5%  cpuidle.C1-BDW.time
   2471919 =C2=B1  1%     +15.3%    2849758 =C2=B1  3%  cpuidle.C1-BDW.usage
 1.565e+08 =C2=B1 11%     -13.7%   1.35e+08 =C2=B1 10%  cpuidle.C1E-BDW.time
 2.784e+08 =C2=B1 16%     -80.3%   54791144 =C2=B1 18%  cpuidle.C3-BDW.time
    380002 =C2=B1  5%     -24.9%     285251 =C2=B1 10%  cpuidle.C3-BDW.usage
   1340681 =C2=B1  2%     -32.0%     911539 =C2=B1  7%  cpuidle.C6-BDW.usage
     71772 =C2=B1  6%      -9.0%      65308 =C2=B1  4%  numa-meminfo.node0.=
Active
     17749 =C2=B1 22%     -32.7%      11947 =C2=B1 24%  numa-meminfo.node0.=
Active(anon)
      5249 =C2=B1 49%     -66.0%       1786 =C2=B1123%  numa-meminfo.node0.=
AnonHugePages
     15662 =C2=B1 19%     -27.6%      11342 =C2=B1 18%  numa-meminfo.node0.=
AnonPages
    503521 =C2=B1  6%     -14.1%     432594 =C2=B1  7%  numa-meminfo.node0.=
Writeback
     69173 =C2=B1  5%      -6.5%      64685 =C2=B1  5%  numa-meminfo.node1.=
SUnreclaim
    483701 =C2=B1  5%     -14.7%     412545 =C2=B1  8%  numa-meminfo.node1.=
Writeback
      1.77 =C2=B1  1%     -14.4%       1.52 =C2=B1  1%  turbostat.%Busy
     59.50 =C2=B1  1%     -13.6%      51.40 =C2=B1  0%  turbostat.Avg_MHz
      6.52 =C2=B1  2%     -17.7%       5.36 =C2=B1  2%  turbostat.CPU%c1
      1.47 =C2=B1 20%     -82.3%       0.26 =C2=B1 23%  turbostat.CPU%c3
      0.24 =C2=B1 48%     +52.4%       0.36 =C2=B1  5%  turbostat.Pkg%pc6
     93.44 =C2=B1  0%      -2.6%      90.99 =C2=B1  0%  turbostat.PkgWatt
     58.25 =C2=B1  0%      -1.8%      57.22 =C2=B1  1%  turbostat.RAMWatt
    675.50 =C2=B1  6%     -46.5%     361.60 =C2=B1  7%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
      7768 =C2=B1  2%      -8.5%       7108 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
      7047 =C2=B1  3%      -8.3%       6463 =C2=B1  1%  proc-vmstat.nr_anon=
_pages
    242465 =C2=B1  0%     -12.8%     211436 =C2=B1  0%  proc-vmstat.nr_writ=
eback
      1544 =C2=B1  5%      -9.8%       1393 =C2=B1  1%  proc-vmstat.pgactiv=
ate
 1.058e+08 =C2=B1  0%      -9.4%   95845408 =C2=B1  0%  proc-vmstat.pgfree
 1.015e+08 =C2=B1  0%      -9.4%   91969429 =C2=B1  0%  proc-vmstat.pgscan_=
kswapd_normal
 1.014e+08 =C2=B1  0%      -9.4%   91873948 =C2=B1  0%  proc-vmstat.pgsteal=
_kswapd_normal
      1.76 =C2=B1  3%     -23.4%       1.35 =C2=B1  4%  perf-profile.cycles=
-pp.blk_mq_make_request
     18.28 =C2=B1  5%     -14.4%      15.64 =C2=B1  7%  perf-profile.cycles=
-pp.call_cpuidle
     19.04 =C2=B1  5%     -14.1%      16.34 =C2=B1  7%  perf-profile.cycles=
-pp.cpu_startup_entry
     18.27 =C2=B1  5%     -14.5%      15.63 =C2=B1  7%  perf-profile.cycles=
-pp.cpuidle_enter
     15.93 =C2=B1  5%     -15.3%      13.50 =C2=B1  9%  perf-profile.cycles=
-pp.cpuidle_enter_state
      1.79 =C2=B1  3%     -22.5%       1.39 =C2=B1  2%  perf-profile.cycles=
-pp.generic_make_request
     15.70 =C2=B1  5%     -16.1%      13.17 =C2=B1 10%  perf-profile.cycles=
-pp.intel_idle
     18.21 =C2=B1  5%     -15.5%      15.40 =C2=B1  7%  perf-profile.cycles=
-pp.start_secondary
      1.79 =C2=B1  3%     -22.5%       1.39 =C2=B1  2%  perf-profile.cycles=
-pp.submit_bio
      2.56 =C2=B1  0%     -22.5%       1.99 =C2=B1  2%  perf-profile.cycles=
-pp.xfs_submit_ioend
      1.80 =C2=B1  3%     -22.5%       1.39 =C2=B1  2%  perf-profile.cycles=
-pp.xfs_submit_ioend_bio
      6238 =C2=B1  1%     -14.0%       5367 =C2=B1  3%  slabinfo.kmalloc-10=
24.active_objs
      6430 =C2=B1  1%     -15.4%       5442 =C2=B1  3%  slabinfo.kmalloc-10=
24.num_objs
     25207 =C2=B1  3%     -65.5%       8700 =C2=B1  2%  slabinfo.kmalloc-12=
8.active_objs
    398.75 =C2=B1  3%     -66.0%     135.40 =C2=B1  1%  slabinfo.kmalloc-12=
8.active_slabs
     25559 =C2=B1  3%     -65.9%       8709 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_objs
    398.75 =C2=B1  3%     -66.0%     135.40 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_slabs
     14482 =C2=B1  0%     -35.4%       9349 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_objs
    347.75 =C2=B1  0%     -36.0%     222.40 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_slabs
     14626 =C2=B1  0%     -36.0%       9360 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_objs
    347.75 =C2=B1  0%     -36.0%     222.40 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_slabs
      1644 =C2=B1  1%     -10.0%       1480 =C2=B1  1%  slabinfo.kmalloc-40=
96.active_objs
      1703 =C2=B1  1%      -9.5%       1541 =C2=B1  1%  slabinfo.kmalloc-40=
96.num_objs
     22806 =C2=B1  2%      -9.4%      20665 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_objs
     23061 =C2=B1  3%     -10.4%      20670 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
     49871 =C2=B1  0%     -16.9%      41459 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    783.00 =C2=B1  0%     -17.0%     649.80 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     50152 =C2=B1  0%     -17.1%      41598 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    783.00 =C2=B1  0%     -17.0%     649.80 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
     22015 =C2=B1  1%     -20.7%      17458 =C2=B1  4%  slabinfo.kmalloc-96=
.active_objs
    529.25 =C2=B1  1%     -20.8%     419.40 =C2=B1  4%  slabinfo.kmalloc-96=
.active_slabs
     22233 =C2=B1  1%     -20.7%      17632 =C2=B1  4%  slabinfo.kmalloc-96=
.num_objs
    529.25 =C2=B1  1%     -20.8%     419.40 =C2=B1  4%  slabinfo.kmalloc-96=
.num_slabs
     34.21 =C2=B1154%     -93.6%       2.21 =C2=B1 38%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
      2872 =C2=B1161%     -96.2%     108.07 =C2=B1 44%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
    306.53 =C2=B1160%     -95.7%      13.25 =C2=B1 41%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     34.84 =C2=B1  9%     -21.3%      27.43 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.avg
    471.10 =C2=B1 13%     -17.3%     389.73 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.max
     83.48 =C2=B1  6%     -18.1%      68.41 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.stddev
    350786 =C2=B1  3%     +32.0%     463179 =C2=B1  9%  sched_debug.cpu.avg=
_idle.min
    165474 =C2=B1  9%     -23.8%     126079 =C2=B1 12%  sched_debug.cpu.avg=
_idle.stddev
    167991 =C2=B1  2%     +19.6%     200863 =C2=B1  0%  sched_debug.cpu.clo=
ck.avg
    167997 =C2=B1  2%     +19.6%     200869 =C2=B1  0%  sched_debug.cpu.clo=
ck.max
    167942 =C2=B1  2%     +19.6%     200832 =C2=B1  0%  sched_debug.cpu.clo=
ck.min
      8.46 =C2=B1 23%     -28.8%       6.02 =C2=B1 21%  sched_debug.cpu.clo=
ck.stddev
    167991 =C2=B1  2%     +19.6%     200863 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.avg
    167997 =C2=B1  2%     +19.6%     200869 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.max
    167942 =C2=B1  2%     +19.6%     200832 =C2=B1  0%  sched_debug.cpu.clo=
ck_task.min
      8.46 =C2=B1 23%     -28.8%       6.02 =C2=B1 21%  sched_debug.cpu.clo=
ck_task.stddev
      3039 =C2=B1153%     -92.6%     224.07 =C2=B1 35%  sched_debug.cpu.cpu=
_load[0].max
      2930 =C2=B1155%     -93.4%     192.50 =C2=B1 23%  sched_debug.cpu.cpu=
_load[1].max
    316.33 =C2=B1152%     -91.6%      26.43 =C2=B1 24%  sched_debug.cpu.cpu=
_load[1].stddev
     34.90 =C2=B1142%     -87.2%       4.47 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].avg
      2792 =C2=B1157%     -93.9%     169.40 =C2=B1 19%  sched_debug.cpu.cpu=
_load[2].max
    300.71 =C2=B1154%     -92.6%      22.15 =C2=B1 17%  sched_debug.cpu.cpu=
_load[2].stddev
     32.00 =C2=B1144%     -88.4%       3.70 =C2=B1 10%  sched_debug.cpu.cpu=
_load[3].avg
      2573 =C2=B1157%     -94.2%     150.10 =C2=B1 23%  sched_debug.cpu.cpu=
_load[3].max
    276.30 =C2=B1155%     -93.2%      18.91 =C2=B1 17%  sched_debug.cpu.cpu=
_load[3].stddev
     26.92 =C2=B1143%     -87.8%       3.28 =C2=B1  7%  sched_debug.cpu.cpu=
_load[4].avg
      2160 =C2=B1157%     -93.3%     145.60 =C2=B1 19%  sched_debug.cpu.cpu=
_load[4].max
    231.48 =C2=B1155%     -92.5%      17.47 =C2=B1 15%  sched_debug.cpu.cpu=
_load[4].stddev
     12611 =C2=B1  2%     -33.4%       8396 =C2=B1  2%  sched_debug.cpu.nr_=
switches.avg
     68299 =C2=B1  7%     -37.6%      42632 =C2=B1 11%  sched_debug.cpu.nr_=
switches.max
     14204 =C2=B1  2%     -38.9%       8675 =C2=B1  1%  sched_debug.cpu.nr_=
switches.stddev
     13.50 =C2=B1 13%     +95.1%      26.33 =C2=B1 15%  sched_debug.cpu.nr_=
uninterruptible.max
    -30.65 =C2=B1-20%     +63.9%     -50.23 =C2=B1-17%  sched_debug.cpu.nr_=
uninterruptible.min
      6.48 =C2=B1  7%     +55.3%      10.07 =C2=B1  7%  sched_debug.cpu.nr_=
uninterruptible.stddev
    167990 =C2=B1  2%     +19.6%     200861 =C2=B1  0%  sched_debug.cpu_clk
    164597 =C2=B1  2%     +19.9%     197433 =C2=B1  0%  sched_debug.ktime
    167990 =C2=B1  2%     +19.6%     200861 =C2=B1  0%  sched_debug.sched_c=
lk



                                 fio.write_bw_MBps

  1850 ++------------------------------------------------------------------=
-+
       | .*..*.*..                                                         =
 |
       *.         *..*..*.*..*..*.. .*..*..*..*.*..*..*..*.*..*..  .*.*..*.=
.*
  1800 ++                          *                             *.        =
 |
       |                                                                   =
 |
       |                                                                   =
 |
  1750 ++                                                                  =
 |
       |                                                                   =
 |
  1700 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
  1650 ++                                                                  =
 |
       |                                                                   =
 |
       O  O  O O  O                                                        =
 |
  1600 ++------------------------------------------------------------------=
-+


                                   fio.write_iops

  470000 ++------*---------------------------------------------------------=
-+
         *..*.*.    *.*..*..*.*..*..    .*..  .*.  .*..*.*..       .*..*.*.=
.*
  460000 ++                         *.*.    *.   *.         *..*.*.        =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  450000 ++                                                                =
 |
         |                                                                 =
 |
  440000 ++                                                                =
 |
         |                                                                 =
 |
  430000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  420000 ++                                                                =
 |
         O  O O  O  O                                                      =
 |
  410000 ++----------------------------------------------------------------=
-+


                                turbostat.Avg_MHz

  75 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
     | .*..*..*.*..                                                        =
 |
  70 *+                                                                    =
 |
     |             *..*                                                    =
 |
     |                 :                                                   =
 |
  65 ++                :                                                   =
 |
     |                  :                                                  =
 |
  60 ++                 :       .*..     .*..*..    .*..                   =
.*
     |                   *..*..*    *..*.       *.*.    *..*..*..*.*..*..*.=
 |
     |                                                                     =
 |
  55 ++                                                                    =
 |
     |                                                                     =
 |
     O  O  O  O O                                                          =
 |
  50 ++--------------------------------------------------------------------=
-+


                                  turbostat._Busy

  2.2 ++-------------------------------------------------------------------=
-+
      | .*..*.                                                             =
 |
  2.1 *+      *..*..                                                       =
 |
    2 ++              .*                                                   =
 |
      |             *.  :                                                  =
 |
  1.9 ++                :                                                  =
 |
      |                  :                                                 =
 |
  1.8 ++                 :               .*..*..     .*.                   =
.*
      |                   *.*..*..*..*..*       *..*.   *..*..*..*..*.*..*.=
 |
  1.7 ++                                                                   =
 |
  1.6 ++                                                                   =
 |
      |  O                                                                 =
 |
  1.5 O+    O O  O                                                         =
 |
      |                                                                    =
 |
  1.4 ++-------------------------------------------------------------------=
-+


                                 turbostat.CPU_c3

    2 ++--------------------*-----------------------------------------*----=
-+
  1.8 ++                    :+                                        ::   =
 |
      |                *.. :  +      *..             .*.             :  :  =
 |
  1.6 ++             ..    :   *..  +   *.  .*..   *.   *..          :  :  =
 |
  1.4 ++    *.     .*     *        +      *.     ..        *..*..*.. :   *.=
.*
      |   ..  *..*.               *             *                   :      =
 |
  1.2 *+.*                                                          *      =
 |
    1 ++                                                                   =
 |
  0.8 ++                                                                   =
 |
      |                                                                    =
 |
  0.6 ++                                                                   =
 |
  0.4 ++                                                                   =
 |
      |  O  O    O                                                         =
 |
  0.2 O+      O                                                            =
 |
    0 ++-------------------------------------------------------------------=
-+


                               fio.time.system_time

  285 ++-------------------------------------------------------------------=
-+
  280 ++ *..                                          *                    =
 |
      | +   *.  .*                                    ::                   =
 |
  275 ++      *.  :        .*..         *            : :                   =
 |
  270 *+           :      *    *..     : :           :  :          .*.*..*.=
.|
      |            :    ..             : :  .*..    :   *..     .*.        =
 |
  265 ++            *..*          *.. :   *.    *.. :        .*.           =
 *
  260 ++                             *             *       *.              =
 |
  255 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
  245 ++         O                                                         =
 |
      |  O    O                                                            =
 |
  240 ++    O                                                              =
 |
  235 O+-------------------------------------------------------------------=
-+


                       fio.time.percent_of_cpu_this_job_got

  110 ++-*--------------------------------------------*--------------------=
-+
  108 ++.   *.*..*                      *            : :                   =
 |
      *           :        .*..        : :           : :                   =
 |
  106 ++           :      *    *..     : :  .*..    :   *          .*.*..*.=
.|
  104 ++           :    ..            :   *.        :    +      .*.        =
 *
      |             *..*          *..*          *..*      +  .*.           =
 |
  102 ++                                                   *.              =
 |
  100 ++                                                                   =
 |
   98 ++                                                                   =
 |
      |                                                                    =
 |
   96 ++                                                                   =
 |
   94 ++                                                                   =
 |
      |       O  O                                                         =
 |
   92 O+ O  O                                                              =
 |
   90 ++-------------------------------------------------------------------=
-+


                               fio.time.elapsed_time

  302 ++-------------------------------------------------------------------=
-+
      O  O  O O  O                                                         =
 |
  300 ++                                                                   =
 |
  298 ++                                                                   =
 |
      |                                                                    =
 |
  296 ++                                                                   =
 |
      |                                                                    =
 |
  294 ++                                                                   =
 |
      |                                                                    =
 |
  292 ++                          *..                           .*..       =
 |
  290 ++                        ..   *.. .*..  .*..        *..*.           =
 |
      |            .*..*..*.*..*        *    *.    *..*. ..         *.*..*.=
.*
  288 *+.       .*.                                     *                  =
 |
      |  *..*.*.                                                           =
 |
  286 ++-------------------------------------------------------------------=
-+


                             fio.time.elapsed_time.max

  302 ++-------------------------------------------------------------------=
-+
      O  O  O O  O                                                         =
 |
  300 ++                                                                   =
 |
  298 ++                                                                   =
 |
      |                                                                    =
 |
  296 ++                                                                   =
 |
      |                                                                    =
 |
  294 ++                                                                   =
 |
      |                                                                    =
 |
  292 ++                          *..                           .*..       =
 |
  290 ++                        ..   *.. .*..  .*..        *..*.           =
 |
      |            .*..*..*.*..*        *    *.    *..*. ..         *.*..*.=
.*
  288 *+.       .*.                                     *                  =
 |
      |  *..*.*.                                                           =
 |
  286 ++-------------------------------------------------------------------=
-+


                         fio.time.voluntary_context_switches

  104000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  103000 O+ O O  O  O                                                      =
 |
  102000 ++                                                                =
 |
         |                                                                 =
 |
  101000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   99000 ++                        .*.          .*..        *.. .*..       =
 |
   98000 ++           *..*..*.*..*.   *..*..*..*    *..*. ..   *    *..*.*.=
.*
         |           +                                   *                 =
 |
   97000 *+.*.*..*..*                                                      =
 |
         |                                                                 =
 |
   96000 ++----------------------------------------------------------------=
-+


                             fio.time.file_system_outputs

  1.08e+09 ++--------------------------------------------------------------=
-+
           *..*.*..*.*..*..*.*..*.*..*..*.*..*.*..*..*.*..*.*..*..*.*..*.*.=
.*
  1.07e+09 ++                                                              =
 |
  1.06e+09 ++                                                              =
 |
           |                                                               =
 |
  1.05e+09 ++                                                              =
 |
  1.04e+09 ++                                                              =
 |
           |                                                               =
 |
  1.03e+09 ++                                                              =
 |
  1.02e+09 ++                                                              =
 |
           |                                                               =
 |
  1.01e+09 ++                                                              =
 |
     1e+09 ++                                                              =
 |
           O  O O  O O                                                     =
 |
   9.9e+08 ++--------------------------------------------------------------=
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
Xiaolong

--===============4674481775692959683==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZmlvLWJhc2ljCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZv
cm1hbmNlCk5GU19IQU5HX0RGX1RJTUVPVVQ6IDIwMApORlNfSEFOR19DSEVDS19JTlRFUlZBTDog
OTAwCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKICBuZnMt
aGFuZzogCm1vZGVsOiBCcm9hZHdlbGwtRVAKbWVtb3J5OiAxMjhHCm5yX3NzZF9wYXJ0aXRpb25z
OiAxCnNzZF9wYXJ0aXRpb25zOiAiL2Rldi9udm1lMG4xcDEiCnN3YXBfcGFydGl0aW9uczogCnJv
b3Rmc19wYXJ0aXRpb246IApwbWV0ZXJfc2VydmVyOiBsa3Atb3MKcG1ldGVyX2RldmljZTogeW9r
b2dhd2Etd3QzMTAKY2F0ZWdvcnk6IGJlbmNobWFyawpkaXNrOiAxU1NECmZzOiB4ZnMKbnJfdGFz
azogOApmaW8tc2V0dXAtYmFzaWM6CiAgcnVudGltZTogMzAwCiAgcnc6IHdyaXRlCiAgYnM6IDRr
CiAgaW9lbmdpbmU6IHN5bmMKICB0ZXN0X3NpemU6IDUxMmcKcGVyZi1wcm9maWxlOgogIGZyZXE6
IDEwMDAKZmlvOiAKYnJhbmNoOiBibG9jay93Yi1idWYtdGhyb3R0bGUKY29tbWl0OiAwNzRlNDZl
MWFkZWQwYWMwNDc0YTVkYjRkNTBkNTE0ZDlkYzQyZTc4CnF1ZXVlOiB5aHVhbmcKdGVzdGJveDog
bGtwLWJkdy1lcDIKdGJveF9ncm91cDogbGtwLWJkdy1lcDIKa2NvbmZpZzogeDg2XzY0LXJoZWwK
ZW5xdWV1ZV90aW1lOiAyMDE2LTA1LTE3IDEyOjU1OjM4LjQ0Mjk3OTc3NyArMDg6MDAKY29tcGls
ZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiBlZjA1
MzdmZGM4NWQ5MGIyMWY0MDk5NzdmZmYzMDJmMzJiNWRlMDk4CnVzZXI6IGxrcAprZXJuZWw6ICIv
cGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMDc0ZTQ2ZTFhZGVkMGFjMDQ3NGE1ZGI0ZDUw
ZDUxNGQ5ZGM0MmU3OC92bWxpbnV6LTQuNi4wLXJjMy0wMDIxMy1nMDc0ZTQ2ZSIKcmVzdWx0X3Jv
b3Q6ICIvcmVzdWx0L2Zpby1iYXNpYy9wZXJmb3JtYW5jZS0xU1NELXhmcy04LTMwMC13cml0ZS00
ay1zeW5jLTUxMmcvbGtwLWJkdy1lcDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZf
NjQtcmhlbC9nY2MtNC45LzA3NGU0NmUxYWRlZDBhYzA0NzRhNWRiNGQ1MGQ1MTRkOWRjNDJlNzgv
MCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtYmR3LWVwMi95aHVhbmdfZmlvLWJhc2lj
LXBlcmZvcm1hbmNlLTFTU0QteGZzLTgtMzAwLXdyaXRlLTRrLXN5bmMtNTEyZy1kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTA3NGU0NmUxYWRlZDBhYzA0NzRhNWRiNGQ1
MGQ1MTRkOWRjNDJlNzgtMjAxNjA1MTctMjYyNjktcmxxcGNnLTAueWFtbCIKZGVxdWV1ZV90aW1l
OiAyMDE2LTA1LTE3IDEzOjM5OjI5LjExNjI2ODY3NCArMDg6MDAKbnJfY3B1OiAiJChucHJvYyki
Cm1heF91cHRpbWU6IDM2MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNl
cj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLWJkdy1lcDIveWh1YW5nX2Zpby1iYXNpYy1w
ZXJmb3JtYW5jZS0xU1NELXhmcy04LTMwMC13cml0ZS00ay1zeW5jLTUxMmctZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0wNzRlNDZlMWFkZWQwYWMwNDc0YTVkYjRkNTBk
NTE0ZDlkYzQyZTc4LTIwMTYwNTE3LTI2MjY5LXJscXBjZy0wLnlhbWwKLSBBUkNIPXg4Nl82NAot
IGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9YmxvY2svd2ItYnVmLXRocm90dGxlCi0gY29t
bWl0PTA3NGU0NmUxYWRlZDBhYzA0NzRhNWRiNGQ1MGQ1MTRkOWRjNDJlNzgKLSBCT09UX0lNQUdF
PS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wNzRlNDZlMWFkZWQwYWMwNDc0YTVkYjRk
NTBkNTE0ZDlkYzQyZTc4L3ZtbGludXotNC42LjAtcmMzLTAwMjEzLWcwNzRlNDZlCi0gbWF4X3Vw
dGltZT0zNjAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9maW8tYmFzaWMvcGVyZm9ybWFuY2UtMVNT
RC14ZnMtOC0zMDAtd3JpdGUtNGstc3luYy01MTJnL2xrcC1iZHctZXAyL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8wNzRlNDZlMWFkZWQwYWMwNDc0YTVk
YjRkNTBkNTE0ZDlkYzQyZTc4LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmlu
dGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcg
c3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAog
IHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5p
YyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAg
Y29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14
ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQu
OS8wNzRlNDZlMWFkZWQwYWMwNDc0YTVkYjRkNTBkNTE0ZDlkYzQyZTc4L21vZHVsZXMuY2d6Igpi
bV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtw
LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29u
ZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9z
dGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9sa3AvYmVuY2htYXJrcy9wZXJmLXByb2Zp
bGUteDg2XzY0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
ZmlvLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvMDc0ZTQ2ZTFhZGVkMGFjMDQ3NGE1ZGI0ZDUwZDUxNGQ5ZGM0MmU3OC9saW51eC1oZWFk
ZXJzLmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA4LjQ4IDUuNzUgMi41NCAzLzk2
NiA5NTAxCnN0YXJ0X3RpbWU6ICcxNDYzNDYzNjQ0JwplbmRfdGltZTogJzE0NjM0NjM5NDQnCnZl
cnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwNTE3LTEzMzEyNyIK

--===============4674481775692959683==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNS0xNyAxMzo0MDozNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDUtMTcgMTM6NDA6MzYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUt
MTcgMTM6NDA6MzYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcg
MTM6NDA6MzYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6
NDA6MzYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzYgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA1LTE3IDEzOjQwOjM2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDoz
NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1
LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcg
MTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6
NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6
MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1
LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3
IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6
NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6
MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6Mzcg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1
LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3
IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjQvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEz
OjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQw
OjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6Mzcg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcxL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0x
NyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTgwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEz
OjQwOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTgzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQw
OjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4NC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTYtMDUtMTcgMTM6NDA6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTg2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDEzOjQwOjM3
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ny9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAxMzo0MDozNyBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wNS0xNyAxMzo0MDozOCBta2ZzIC10IHhmcyAvZGV2L252bWUwbjFwMQoyMDE2LTA1LTE3IDEz
OjQwOjQyIG1vdW50IC10IHhmcyAtbyBub2JhcnJpZXIsaW5vZGU2NCAvZGV2L252bWUwbjFwMSAv
ZnMvbnZtZTBuMXAxCjIwMTYtMDUtMTcgMTM6NDA6NDQgZWNobyAiCltnbG9iYWxdCmJzPTRrCmlv
ZW5naW5lPXN5bmMKaW9kZXB0aD0zMgpzaXplPTY4NzE5NDc2NzM2CmRpcmVjdD0wCnJ1bnRpbWU9
MzAwCmludmFsaWRhdGU9MQpmYWxsb2NhdGU9cG9zaXgKZGlyZWN0b3J5PS9mcy9udm1lMG4xcDEK
Z3JvdXBfcmVwb3J0aW5nCgpbdGFza10Kcnc9d3JpdGUKbnVtam9icz04IiB8IGZpbyAtLW91dHB1
dC1mb3JtYXQ9anNvbiAtCg==

--===============4674481775692959683==--

