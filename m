Content-Type: multipart/mixed; boundary="===============5245222455607734096=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm] 23047a96d7: vm-scalability.throughput -23.8% regression
Date: Tue, 17 May 2016 12:58:05 +0800
Message-ID: <20160517045805.GA16472@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5245222455607734096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed vm-scalability.throughput -23.8% regression due to commit:

commit 23047a96d7cfcfca1a6d026ecaec526ea4803e9e ("mm: workingset: per-cgrou=
p cache thrash detection")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

in testcase: vm-scalability
on test machine: lkp-hsw01: 56 threads Grantley Haswell-EP with 64G memory
with following conditions: cpufreq_governor=3Dperformance/runtime=3D300s/te=
st=3Dlru-file-readtwice


Details are as below:
---------------------------------------------------------------------------=
----------------------->


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-hsw=
01/lru-file-readtwice/vm-scalability

commit: =

  612e44939c3c77245ac80843c0c7876c8cf97282
  23047a96d7cfcfca1a6d026ecaec526ea4803e9e

612e44939c3c7724 23047a96d7cfcfca1a6d026eca =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  28384711 =C2=B1  0%     -23.8%   21621405 =C2=B1  0%  vm-scalability.thro=
ughput
   1854112 =C2=B1  0%      -7.7%    1711141 =C2=B1  0%  vm-scalability.time=
.involuntary_context_switches
    176.03 =C2=B1  0%     -22.2%     136.95 =C2=B1  1%  vm-scalability.time=
.user_time
    302905 =C2=B1  2%     -31.2%     208386 =C2=B1  0%  vm-scalability.time=
.voluntary_context_switches
      0.92 =C2=B1  2%     +51.0%       1.38 =C2=B1  2%  perf-profile.cycles=
-pp.kswapd
    754212 =C2=B1  1%     -29.2%     533832 =C2=B1  2%  softirqs.RCU
     20518 =C2=B1  2%      -8.1%      18866 =C2=B1  2%  vmstat.system.cs
     10574 =C2=B1 19%     +29.9%      13737 =C2=B1  8%  numa-meminfo.node0.=
Mapped
     13490 =C2=B1 13%     -36.6%       8549 =C2=B1 17%  numa-meminfo.node1.=
Mapped
    583.00 =C2=B1  8%     +18.8%     692.50 =C2=B1  5%  slabinfo.avc_xperms=
_node.active_objs
    583.00 =C2=B1  8%     +18.8%     692.50 =C2=B1  5%  slabinfo.avc_xperms=
_node.num_objs
    176.03 =C2=B1  0%     -22.2%     136.95 =C2=B1  1%  time.user_time
    302905 =C2=B1  2%     -31.2%     208386 =C2=B1  0%  time.voluntary_cont=
ext_switches
    263.42 =C2=B1  0%      -3.0%     255.52 =C2=B1  0%  turbostat.PkgWatt
     61.05 =C2=B1  0%     -12.7%      53.26 =C2=B1  0%  turbostat.RAMWatt
      1868 =C2=B1 16%     -43.7%       1052 =C2=B1 13%  cpuidle.C1-HSW.usage
      1499 =C2=B1  9%     -30.3%       1045 =C2=B1 12%  cpuidle.C3-HSW.usage
     16071 =C2=B1  4%     -15.0%      13664 =C2=B1  3%  cpuidle.C6-HSW.usage
     17572 =C2=B1 27%     -59.1%       7179 =C2=B1  5%  cpuidle.POLL.usage
 4.896e+08 =C2=B1  0%     -20.7%  3.884e+08 =C2=B1  0%  numa-numastat.node0=
.local_node
  71305376 =C2=B1  2%     -19.7%   57223573 =C2=B1  4%  numa-numastat.node0=
.numa_foreign
 4.896e+08 =C2=B1  0%     -20.7%  3.884e+08 =C2=B1  0%  numa-numastat.node0=
.numa_hit
  43760475 =C2=B1  3%     -22.1%   34074417 =C2=B1  5%  numa-numastat.node0=
.numa_miss
  43765010 =C2=B1  3%     -22.1%   34078937 =C2=B1  5%  numa-numastat.node0=
.other_node
 4.586e+08 =C2=B1  0%     -25.7%  3.408e+08 =C2=B1  1%  numa-numastat.node1=
.local_node
  43760472 =C2=B1  3%     -22.1%   34074417 =C2=B1  5%  numa-numastat.node1=
.numa_foreign
 4.586e+08 =C2=B1  0%     -25.7%  3.408e+08 =C2=B1  1%  numa-numastat.node1=
.numa_hit
  71305376 =C2=B1  2%     -19.7%   57223573 =C2=B1  4%  numa-numastat.node1=
.numa_miss
  71311721 =C2=B1  2%     -19.7%   57229904 =C2=B1  4%  numa-numastat.node1=
.other_node
    543.25 =C2=B1  3%     -15.0%     461.50 =C2=B1  3%  numa-vmstat.node0.n=
r_isolated_file
      2651 =C2=B1 19%     +30.2%       3451 =C2=B1  8%  numa-vmstat.node0.n=
r_mapped
      1226 =C2=B1  6%     -31.7%     837.25 =C2=B1  9%  numa-vmstat.node0.n=
r_pages_scanned
  37111278 =C2=B1  1%     -20.6%   29474561 =C2=B1  3%  numa-vmstat.node0.n=
uma_foreign
 2.568e+08 =C2=B1  0%     -21.0%  2.028e+08 =C2=B1  0%  numa-vmstat.node0.n=
uma_hit
 2.567e+08 =C2=B1  0%     -21.0%  2.027e+08 =C2=B1  0%  numa-vmstat.node0.n=
uma_local
  22595209 =C2=B1  2%     -22.9%   17420980 =C2=B1  4%  numa-vmstat.node0.n=
uma_miss
  22665391 =C2=B1  2%     -22.8%   17490378 =C2=B1  4%  numa-vmstat.node0.n=
uma_other
     88.25 =C2=B1173%   +1029.7%     997.00 =C2=B1 63%  numa-vmstat.node0.w=
orkingset_activate
   3965715 =C2=B1  0%     -24.9%    2977998 =C2=B1  0%  numa-vmstat.node0.w=
orkingset_nodereclaim
     90.25 =C2=B1170%   +1006.4%     998.50 =C2=B1 63%  numa-vmstat.node0.w=
orkingset_refault
    612.50 =C2=B1  3%      -9.4%     554.75 =C2=B1  4%  numa-vmstat.node1.n=
r_alloc_batch
      3279 =C2=B1 14%     -34.1%       2161 =C2=B1 17%  numa-vmstat.node1.n=
r_mapped
  22597658 =C2=B1  2%     -22.9%   17423271 =C2=B1  4%  numa-vmstat.node1.n=
uma_foreign
 2.403e+08 =C2=B1  0%     -25.9%  1.781e+08 =C2=B1  1%  numa-vmstat.node1.n=
uma_hit
 2.403e+08 =C2=B1  0%     -25.9%  1.781e+08 =C2=B1  1%  numa-vmstat.node1.n=
uma_local
  37115261 =C2=B1  1%     -20.6%   29478460 =C2=B1  3%  numa-vmstat.node1.n=
uma_miss
  37136533 =C2=B1  1%     -20.6%   29500409 =C2=B1  3%  numa-vmstat.node1.n=
uma_other
      6137 =C2=B1173%    +257.3%      21927 =C2=B1 60%  numa-vmstat.node1.w=
orkingset_activate
   3237162 =C2=B1  0%     -30.6%    2246385 =C2=B1  1%  numa-vmstat.node1.w=
orkingset_nodereclaim
      6139 =C2=B1173%    +257.2%      21930 =C2=B1 60%  numa-vmstat.node1.w=
orkingset_refault
    501243 =C2=B1  0%     -26.9%     366510 =C2=B1  1%  proc-vmstat.allocst=
all
     28483 =C2=B1  0%     -50.7%      14047 =C2=B1  3%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
 1.151e+08 =C2=B1  0%     -20.7%   91297990 =C2=B1  0%  proc-vmstat.numa_fo=
reign
 9.482e+08 =C2=B1  0%     -23.1%  7.293e+08 =C2=B1  0%  proc-vmstat.numa_hit
 9.482e+08 =C2=B1  0%     -23.1%  7.293e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
 1.151e+08 =C2=B1  0%     -20.7%   91297990 =C2=B1  0%  proc-vmstat.numa_mi=
ss
 1.151e+08 =C2=B1  0%     -20.7%   91308842 =C2=B1  0%  proc-vmstat.numa_ot=
her
     31562 =C2=B1  0%     -47.1%      16687 =C2=B1  2%  proc-vmstat.pageout=
run
 1.048e+09 =C2=B1  0%     -22.8%  8.088e+08 =C2=B1  0%  proc-vmstat.pgactiv=
ate
  28481000 =C2=B1  0%     -21.3%   22422907 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
 1.035e+09 =C2=B1  0%     -22.9%  7.984e+08 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 1.041e+09 =C2=B1  0%     -23.0%  8.024e+08 =C2=B1  0%  proc-vmstat.pgdeact=
ivate
 1.063e+09 =C2=B1  0%     -22.8%    8.2e+08 =C2=B1  0%  proc-vmstat.pgfree
      2458 =C2=B1 91%     -93.5%     160.75 =C2=B1 29%  proc-vmstat.pgmigra=
te_success
  27571690 =C2=B1  0%     -20.6%   21889554 =C2=B1  0%  proc-vmstat.pgrefil=
l_dma32
 1.014e+09 =C2=B1  0%     -23.0%  7.805e+08 =C2=B1  0%  proc-vmstat.pgrefil=
l_normal
  25263166 =C2=B1  0%     -27.4%   18337251 =C2=B1  1%  proc-vmstat.pgscan_=
direct_dma32
 9.377e+08 =C2=B1  0%     -26.9%  6.852e+08 =C2=B1  1%  proc-vmstat.pgscan_=
direct_normal
   2134103 =C2=B1  1%     +57.6%    3363418 =C2=B1  6%  proc-vmstat.pgscan_=
kswapd_dma32
  69594167 =C2=B1  0%     +26.7%   88192786 =C2=B1  2%  proc-vmstat.pgscan_=
kswapd_normal
  25260851 =C2=B1  0%     -27.4%   18335464 =C2=B1  1%  proc-vmstat.pgsteal=
_direct_dma32
 9.376e+08 =C2=B1  0%     -26.9%  6.852e+08 =C2=B1  1%  proc-vmstat.pgsteal=
_direct_normal
   2133563 =C2=B1  1%     +57.6%    3362346 =C2=B1  6%  proc-vmstat.pgsteal=
_kswapd_dma32
  69585316 =C2=B1  0%     +26.7%   88176045 =C2=B1  2%  proc-vmstat.pgsteal=
_kswapd_normal
  17530080 =C2=B1  0%     -23.3%   13440416 =C2=B1  0%  proc-vmstat.slabs_s=
canned
      6226 =C2=B1173%    +268.2%      22924 =C2=B1 58%  proc-vmstat.working=
set_activate
   7202139 =C2=B1  0%     -27.5%    5223203 =C2=B1  0%  proc-vmstat.working=
set_nodereclaim
      6230 =C2=B1173%    +268.0%      22929 =C2=B1 58%  proc-vmstat.working=
set_refault
    123.70 =C2=B1 12%     +26.7%     156.79 =C2=B1 11%  sched_debug.cfs_rq:=
/.load.stddev
     42.08 =C2=B1  1%     +23.3%      51.90 =C2=B1  8%  sched_debug.cfs_rq:=
/.load_avg.avg
    779.50 =C2=B1  2%     +20.7%     940.83 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.max
      9.46 =C2=B1  8%     -13.7%       8.17 =C2=B1  1%  sched_debug.cfs_rq:=
/.load_avg.min
    123.38 =C2=B1  2%     +31.4%     162.10 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.stddev
    304497 =C2=B1 22%     +65.6%     504169 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     25.74 =C2=B1  8%     +33.9%      34.46 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    481.33 =C2=B1 11%     +50.5%     724.54 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
     69.65 =C2=B1 15%     +62.2%     112.95 =C2=B1 12%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
  -1363122 =C2=B1-14%     +52.6%   -2080627 =C2=B1-10%  sched_debug.cfs_rq:=
/.spread0.min
    304448 =C2=B1 22%     +65.6%     504111 =C2=B1  7%  sched_debug.cfs_rq:=
/.spread0.stddev
    733220 =C2=B1  5%     +13.0%     828548 =C2=B1  1%  sched_debug.cpu.avg=
_idle.avg
    123344 =C2=B1 11%     +73.4%     213827 =C2=B1 27%  sched_debug.cpu.avg=
_idle.min
    233732 =C2=B1  5%     -13.5%     202264 =C2=B1  6%  sched_debug.cpu.avg=
_idle.stddev
     26.93 =C2=B1  9%     +27.8%      34.42 =C2=B1  8%  sched_debug.cpu.cpu=
_load[0].avg
     78.79 =C2=B1 19%     +43.7%     113.20 =C2=B1 12%  sched_debug.cpu.cpu=
_load[0].stddev
     26.23 =C2=B1  8%     +30.5%      34.23 =C2=B1  7%  sched_debug.cpu.cpu=
_load[1].avg
    513.17 =C2=B1 12%     +38.6%     711.12 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].max
     73.34 =C2=B1 15%     +50.7%     110.55 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].stddev
     25.93 =C2=B1  6%     +32.6%      34.40 =C2=B1  6%  sched_debug.cpu.cpu=
_load[2].avg
    488.38 =C2=B1  8%     +44.8%     706.96 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].max
     69.79 =C2=B1 10%     +56.9%     109.52 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].stddev
     25.89 =C2=B1  4%     +35.1%      34.97 =C2=B1  4%  sched_debug.cpu.cpu=
_load[3].avg
    467.83 =C2=B1  7%     +50.2%     702.71 =C2=B1  9%  sched_debug.cpu.cpu=
_load[3].max
     67.27 =C2=B1  9%     +63.6%     110.03 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].stddev
     25.83 =C2=B1  4%     +37.2%      35.44 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].avg
    445.29 =C2=B1  9%     +56.7%     697.88 =C2=B1  8%  sched_debug.cpu.cpu=
_load[4].max
     64.41 =C2=B1  9%     +72.4%     111.02 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].stddev
    123.66 =C2=B1 12%     +28.2%     158.54 =C2=B1 11%  sched_debug.cpu.loa=
d.stddev
      1.56 =C2=B1  1%      +9.8%       1.71 =C2=B1  0%  sched_debug.cpu.nr_=
running.avg
      0.46 =C2=B1 12%     +28.4%       0.59 =C2=B1  6%  sched_debug.cpu.nr_=
running.stddev
     57967 =C2=B1  3%      -9.8%      52290 =C2=B1  2%  sched_debug.cpu.nr_=
switches.avg
    270099 =C2=B1  9%     -16.4%     225748 =C2=B1  7%  sched_debug.cpu.nr_=
switches.max
     27370 =C2=B1  1%     -13.3%      23723 =C2=B1  0%  sched_debug.cpu.nr_=
switches.min
     55749 =C2=B1  7%     -14.3%      47767 =C2=B1  5%  sched_debug.cpu.nr_=
switches.stddev
    -55.33 =C2=B1-19%     -40.4%     -32.96 =C2=B1 -2%  sched_debug.cpu.nr_=
uninterruptible.min

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/x86_64-randconfig-a0-04240012/yocto-minimal-i386.cgz/1/vm-kbuild-yo=
cto-ia32/boot

commit: =

  612e44939c3c77245ac80843c0c7876c8cf97282
  23047a96d7cfcfca1a6d026ecaec526ea4803e9e

612e44939c3c7724 23047a96d7cfcfca1a6d026eca =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :50           2%           1:180   kmsg.augmented_rbtree_testing
           :50         216%         108:180   last_state.is_incomplete_run



                           vm-scalability.time.user_time

  180 *+**-*-----*-*-*--*-*---*----*-*-**------**-*-**-**------*-**--------=
-+
  175 ++     **.*     *    *.*  *.*       **.*            *.**     +  .*.**=
.*
      |                                                             **     =
 |
  170 ++                                                                   =
 |
  165 ++                                                                   =
 |
      |                                                                    =
 |
  160 ++                                                                   =
 |
  155 ++                                                                   =
 |
  150 ++                                                                   =
 |
      | O                                                                  =
 |
  145 O+ O O OO    O                                                       =
 |
  140 ++        OO                                     O                   =
 |
      |                   OO O  O  O O     O   OO O O                      =
 |
  135 ++              O O     O   O    OO O  O       O                     =
 |
  130 ++-------------O-----------------------------------------------------=
-+


                               vm-scalability.throughput

  2.9e+07 ++------*--------------------------*---------------*-------------=
-+
          |.*   *  *.* .**.**.* .*.**. *.  .*  **. *. .*   *  *.* .* .**.**=
.*
  2.8e+07 *+ *.*      *        *      *  **       *  *  *.*      *  *      =
 |
  2.7e+07 ++                                                               =
 |
          |                                                                =
 |
  2.6e+07 ++                                                               =
 |
          |                                                                =
 |
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
  2.4e+07 ++                                                               =
 |
  2.3e+07 ++O  OO     O                                                    =
 |
          O  O    OO O                                                     =
 |
  2.2e+07 ++                                                               =
 |
          |             OO OO OO O OO OO OO OO OO OO O OO                  =
 |
  2.1e+07 ++---------------------------------------------------------------=
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

--===============5245222455607734096==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdm0tc2NhbGFiaWxpdHkKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0
ZS1tb25pdG9yCiAga21zZzogCiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIGhlYXJ0YmVhdDogCiAg
dm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZv
OiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5m
bzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9z
dGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBu
ZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBt
ZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjog
cGVyZm9ybWFuY2UKTkZTX0hBTkdfREZfVElNRU9VVDogMjAwCk5GU19IQU5HX0NIRUNLX0lOVEVS
VkFMOiA5MDAKZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IAog
IG5mcy1oYW5nOiAKY29tbWl0OiAyMzA0N2E5NmQ3Y2ZjZmNhMWE2ZDAyNmVjYWVjNTI2ZWE0ODAz
ZTllCm1vZGVsOiBHcmFudGxleSBIYXN3ZWxsLUVQCm5yX2NwdTogNTYKbWVtb3J5OiA2NEcKaGRk
X3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKY2F0ZWdv
cnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6IApydW50aW1lOiAzMDBzCnNpemU6IAp2bS1zY2Fs
YWJpbGl0eToKICB0ZXN0OiBscnUtZmlsZS1yZWFkdHdpY2UKcXVldWU6IGJpc2VjdAp0ZXN0Ym94
OiBsa3AtaHN3MDEKdGJveF9ncm91cDogbGtwLWhzdzAxCmtjb25maWc6IHg4Nl82NC1yaGVsCmVu
cXVldWVfdGltZTogMjAxNi0wNS0xNyAwMDoxMzoxNS4xMDkyODk4MjQgKzA4OjAwCmNvbXBpbGVy
OiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogN2Y2Mjdi
ZjA3NDVjMTlhOGM2ZWU2ZjI2N2VlMWQzMTc2ZTQyMmVmNAp1c2VyOiBsa3AKaGVhZF9jb21taXQ6
IDJkY2QwYWY1NjhiMGNmNTgzNjQ1YzhhMzE3ZGQxMmUzNDRiMWM3MmEKYmFzZV9jb21taXQ6IDE0
NWJkYWExNTAxYmYxYzhhNmNmYThlYTVlMzQ3YjlhNDZhYWQxYjcKYnJhbmNoOiBsaW51cy9tYXN0
ZXIKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3ZtLXNjYWxhYmlsaXR5L3BlcmZvcm1hbmNlLTMwMHMt
bHJ1LWZpbGUtcmVhZHR3aWNlL2xrcC1oc3cwMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3g4Nl82NC1yaGVsL2djYy00LjkvMjMwNDdhOTZkN2NmY2ZjYTFhNmQwMjZlY2FlYzUyNmVhNDgw
M2U5ZS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1oc3cwMS9iaXNlY3Rfdm0tc2Nh
bGFiaWxpdHktcGVyZm9ybWFuY2UtMzAwcy1scnUtZmlsZS1yZWFkdHdpY2UtZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0yMzA0N2E5NmQ3Y2ZjZmNhMWE2ZDAyNmVjYWVj
NTI2ZWE0ODAzZTllLTIwMTYwNTE3LTI1MjA4LTFlcHA2YXctMC55YW1sIgptYXhfdXB0aW1lOiAx
NTAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9s
a3Avc2NoZWR1bGVkL2xrcC1oc3cwMS9iaXNlY3Rfdm0tc2NhbGFiaWxpdHktcGVyZm9ybWFuY2Ut
MzAwcy1scnUtZmlsZS1yZWFkdHdpY2UtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZf
NjQtcmhlbC0yMzA0N2E5NmQ3Y2ZjZmNhMWE2ZDAyNmVjYWVjNTI2ZWE0ODAzZTllLTIwMTYwNTE3
LTI1MjA4LTFlcHA2YXctMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVs
Ci0gYnJhbmNoPWxpbnVzL21hc3RlcgotIGNvbW1pdD0yMzA0N2E5NmQ3Y2ZjZmNhMWE2ZDAyNmVj
YWVjNTI2ZWE0ODAzZTllCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMjMwNDdhOTZkN2NmY2ZjYTFhNmQwMjZlY2FlYzUyNmVhNDgwM2U5ZS92bWxpbnV6LTQuNS4w
LTAwNTcwLWcyMzA0N2E5Ci0gbWF4X3VwdGltZT0xNTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC92
bS1zY2FsYWJpbGl0eS9wZXJmb3JtYW5jZS0zMDBzLWxydS1maWxlLXJlYWR0d2ljZS9sa3AtaHN3
MDEvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzIzMDQ3
YTk2ZDdjZmNmY2ExYTZkMDI2ZWNhZWM1MjZlYTQ4MDNlOWUvMAotIExLUF9TRVJWRVI9aW5uCi0g
fDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAg
ZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0
YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRv
Zz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25z
b2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJk
OiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzIzMDQ3YTk2ZDdjZmNmY2ExYTZkMDI2ZWNhZWM1MjZlYTQ4MDNl
OWUvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9s
a3AvYmVuY2htYXJrcy9wZXJmLXByb2ZpbGUteDg2XzY0LmNneiwvbGtwL2JlbmNobWFya3Mvdm0t
c2NhbGFiaWxpdHkuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0
LXJoZWwvZ2NjLTQuOS8yMzA0N2E5NmQ3Y2ZjZmNhMWE2ZDAyNmVjYWVjNTI2ZWE0ODAzZTllL2xp
bnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45LzIzMDQ3YTk2ZDdjZmNmY2ExYTZkMDI2ZWNhZWM1MjZlYTQ4MDNlOWUvdm1s
aW51ei00LjUuMC0wMDU3MC1nMjMwNDdhOSIKZGVxdWV1ZV90aW1lOiAyMDE2LTA1LTE3IDAwOjI1
OjI2LjI4MTc0MzQwOCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAzOS4xMCA1
OC4yNCAyOS4zMSAxLzU0OCA5MjcxCnN0YXJ0X3RpbWU6ICcxNDYzNDE1OTc1JwplbmRfdGltZTog
JzE0NjM0MTYyODYnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwNTE2LTIyNDc0MiIK

--===============5245222455607734096==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNS0xNyAwMDoyNjoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDUtMTcgMDA6MjY6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjEzIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUt
MTcgMDA6MjY6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjEzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcg
MDA6MjY6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjEzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6
MjY6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjox
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1
LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcg
MDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6
MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6
MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1
LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3
IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6
MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6
MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA1LTE3IDAwOjI2OjE0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNS0xNyAwMDoyNjoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDUtMTcgMDA6MjY6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDUtMTcgMDA6MjY6MTUgbW91bnQgLXQgdG1wZnMgLW8gc2l6ZT0xMDAl
IHZtLXNjYWxhYmlsaXR5LXRtcCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcAoyMDE2LTA1LTE3IDAw
OjI2OjE1IHRydW5jYXRlIC1zIDY3NDA0NDA2Nzg0IC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3Zt
LXNjYWxhYmlsaXR5LmltZwoyMDE2LTA1LTE3IDAwOjI2OjE1IG1rZnMueGZzIC1xIC90bXAvdm0t
c2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5LmltZwoyMDE2LTA1LTE3IDAwOjI2OjE1IG1v
dW50IC1vIGxvb3AgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkuaW1nIC90
bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5CjIwMTYtMDUtMTcgMDA6MjY6MTUg
Li9jYXNlLWxydS1maWxlLXJlYWR0d2ljZQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90
bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFk
dHdpY2UtMSAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAv
dm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdp
Y2UtMiAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0t
c2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2Ut
MyAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2Nh
bGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtNCAt
cyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFi
aWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtNSAtcyA3
ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxp
dHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtNiAtcyA3ODUz
NjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHkt
dG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtNyAtcyA3ODUzNjU0
NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1w
L3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtOCAtcyA3ODUzNjU0NDg0
MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3Zt
LXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtOSAtcyA3ODUzNjU0NDg0MQoy
MDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNj
YWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtMTAgLXMgNzg1MzY1NDQ4NDEKMjAx
Ni0wNS0xNyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2Fs
YWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTExIC1zIDc4NTM2NTQ0ODQxCjIwMTYt
MDUtMTcgMDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFi
aWxpdHkvc3BhcnNlLWxydS1maWxlLXJlYWR0d2ljZS0xMiAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1
LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmls
aXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtMTMgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0x
NyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0
eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTE0IC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcg
MDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkv
c3BhcnNlLWxydS1maWxlLXJlYWR0d2ljZS0xNSAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAw
OjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3Nw
YXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtMTYgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoy
NjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFy
c2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTE3IC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6
MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNl
LWxydS1maWxlLXJlYWR0d2ljZS0xOCAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1
IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1s
cnUtZmlsZS1yZWFkdHdpY2UtMTkgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNSB0
cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1
LWZpbGUtcmVhZHR3aWNlLTIwIC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTUgdHJ1
bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1m
aWxlLXJlYWR0d2ljZS0yMSAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5j
YXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmls
ZS1yZWFkdHdpY2UtMjIgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNSB0cnVuY2F0
ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUt
cmVhZHR3aWNlLTIzIC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTUgdHJ1bmNhdGUg
L3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1maWxlLXJl
YWR0d2ljZS0yNCAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90
bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFk
dHdpY2UtMjUgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1w
L3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3
aWNlLTI2IC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92
bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1maWxlLXJlYWR0d2lj
ZS0yNyAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0t
c2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2Ut
MjggLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNj
YWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTI5
IC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2Fs
YWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1maWxlLXJlYWR0d2ljZS0zMCAt
cyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFi
aWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtMzEgLXMg
Nzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmls
aXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTMyIC1zIDc4
NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0
eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1maWxlLXJlYWR0d2ljZS0zMyAtcyA3ODUz
NjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHkt
dG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtMzQgLXMgNzg1MzY1
NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRt
cC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTM1IC1zIDc4NTM2NTQ0
ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAv
dm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1maWxlLXJlYWR0d2ljZS0zNiAtcyA3ODUzNjU0NDg0
MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3Zt
LXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtMzcgLXMgNzg1MzY1NDQ4NDEK
MjAxNi0wNS0xNyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1z
Y2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTM4IC1zIDc4NTM2NTQ0ODQxCjIw
MTYtMDUtMTcgMDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2Nh
bGFiaWxpdHkvc3BhcnNlLWxydS1maWxlLXJlYWR0d2ljZS0zOSAtcyA3ODUzNjU0NDg0MQoyMDE2
LTA1LTE3IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxh
YmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtNDAgLXMgNzg1MzY1NDQ4NDEKMjAxNi0w
NS0xNyAwMDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJp
bGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTQxIC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUt
MTcgMDA6MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxp
dHkvc3BhcnNlLWxydS1maWxlLXJlYWR0d2ljZS00MiAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3
IDAwOjI2OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5
L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdpY2UtNDMgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAw
MDoyNjoxNSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9z
cGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNlLTQ0IC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6
MjY6MTUgdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3Bh
cnNlLWxydS1maWxlLXJlYWR0d2ljZS00NSAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2
OjE1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJz
ZS1scnUtZmlsZS1yZWFkdHdpY2UtNDYgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjox
NSB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2Ut
bHJ1LWZpbGUtcmVhZHR3aWNlLTQ3IC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTUg
dHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxy
dS1maWxlLXJlYWR0d2ljZS00OCAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE1IHRy
dW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUt
ZmlsZS1yZWFkdHdpY2UtNDkgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNiB0cnVu
Y2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZp
bGUtcmVhZHR3aWNlLTUwIC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTYgdHJ1bmNh
dGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1maWxl
LXJlYWR0d2ljZS01MSAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE2IHRydW5jYXRl
IC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1y
ZWFkdHdpY2UtNTIgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNiB0cnVuY2F0ZSAv
dG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVh
ZHR3aWNlLTUzIC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MjY6MTYgdHJ1bmNhdGUgL3Rt
cC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNlLWxydS1maWxlLXJlYWR0
d2ljZS01NCAtcyA3ODUzNjU0NDg0MQoyMDE2LTA1LTE3IDAwOjI2OjE2IHRydW5jYXRlIC90bXAv
dm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1scnUtZmlsZS1yZWFkdHdp
Y2UtNTUgLXMgNzg1MzY1NDQ4NDEKMjAxNi0wNS0xNyAwMDoyNjoxNiB0cnVuY2F0ZSAvdG1wL3Zt
LXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbHJ1LWZpbGUtcmVhZHR3aWNl
LTU2IC1zIDc4NTM2NTQ0ODQxCjIwMTYtMDUtMTcgMDA6MzE6MjYgdW1vdW50IC90bXAvdm0tc2Nh
bGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5CjIwMTYtMDUtMTcgMDA6MzE6MjYgcm0gL3RtcC92
bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkuaW1nCjIwMTYtMDUtMTcgMDA6MzE6MjYg
dW1vdW50IC90bXAvdm0tc2NhbGFiaWxpdHktdG1wCg==

--===============5245222455607734096==--

