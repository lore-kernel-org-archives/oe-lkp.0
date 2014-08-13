Content-Type: multipart/mixed; boundary="===============1340212111224536623=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [net] 8f61059a96c: +26.4% netperf.Throughput_Mbps
Date: Wed, 13 Aug 2014 09:19:00 +0800
Message-ID: <20140813011900.GC11210@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1340212111224536623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we are glad to inform you that we noticed the below good changes on

commit 8f61059a96c2a29c1cc5a39dfe23d06ef5b4b065 ("net: sctp: improve timer =
slack calculation for transport HBs")

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     %stddev        %change               %stddev
            \          |                 /
      2586 =C2=B1 0%     +11.1%       2873 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      1349 =C2=B1 2%     +55.7%       2101 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      3936 =C2=B1 0%     +26.4%       4974 =C2=B1 0%  TOTAL netperf.Through=
put_Mbps

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

    170805 =C2=B112%    +398.9%     852164 =C2=B114%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    170805 =C2=B112%    +398.9%     852164 =C2=B114%  TOTAL cpuidle.C1-NHM.=
usage

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      4.18 =C2=B1 5%    -100.0%       0.00 =C2=B1 0%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      4.18 =C2=B1 5%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.mod_timer.sctp_transport_reset_timers.sctp_=
outq_flush.sctp_outq_uncork

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      3.06 =C2=B1 2%     -98.4%       0.05 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      3.06 =C2=B1 2%     -98.4%       0.05 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.lock_timer_base.mod_timer.sctp_transport_re=
set_timers.sctp_outq_flush

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      4.31 =C2=B1 2%     -99.3%       0.03 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
     10.60 =C2=B1 2%     -99.7%       0.03 =C2=B114%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
     14.92 =C2=B1 2%     -99.6%       0.06 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.sctp_transport_timeout.sctp_transport_reset_timers.sctp_outq_flush=
.sctp_outq_uncork.sctp_cmd_interpreter

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      4.42 =C2=B1 2%     -99.5%       0.02 =C2=B118%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      4.42 =C2=B1 2%     -99.5%       0.02 =C2=B118%  TOTAL perf-profile.cp=
u-cycles.lock_timer_base.isra.34.mod_timer.sctp_transport_reset_timers.sctp=
_outq_flush.sctp_outq_uncork

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      1.77 =C2=B1 4%     -78.8%       0.38 =C2=B1 4%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      1.77 =C2=B1 4%     -78.8%       0.38 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.sctp_outq_flush.sctp_outq_uncork.sctp_cmd_interpreter.sctp_do_sm.s=
ctp_assoc_bh_rcv

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

    131114 =C2=B1 5%     -71.1%      37873 =C2=B1 3%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    131114 =C2=B1 5%     -71.1%      37873 =C2=B1 3%  TOTAL cpuidle.C1E-SNB=
.usage

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

  14540720 =C2=B117%    +162.1%   38114453 =C2=B115%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
  14540720 =C2=B117%    +162.1%   38114453 =C2=B115%  TOTAL cpuidle.C1-NHM.=
time

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      4.37 =C2=B1 1%     +36.5%       5.96 =C2=B1 1%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      3.42 =C2=B111%    +196.0%      10.11 =C2=B1 5%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      7.78 =C2=B1 5%    +106.5%      16.07 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock.free_one_page.__free_pages_ok.__free_pages.__free_k=
mem_pages

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      4.04 =C2=B1 1%     +32.3%       5.35 =C2=B1 1%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      3.52 =C2=B110%    +174.1%       9.64 =C2=B1 6%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      7.56 =C2=B1 6%     +98.3%      14.99 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.get_page_from_freelist.__alloc_pages_nodema=
sk.alloc_kmem_pages_node.kmalloc_large_node

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

     26132 =C2=B1 1%     +45.8%      38103 =C2=B125%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
     26132 =C2=B1 1%     +45.8%      38103 =C2=B125%  TOTAL numa-vmstat.nod=
e2.nr_file_pages

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

    104532 =C2=B1 1%     +45.8%     152358 =C2=B125%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    104532 =C2=B1 1%     +45.8%     152358 =C2=B125%  TOTAL numa-meminfo.no=
de2.FilePages

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

    643556 =C2=B1 9%     +56.2%    1005209 =C2=B1 5%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    643556 =C2=B1 9%     +56.2%    1005209 =C2=B1 5%  TOTAL cpuidle.C1-SNB.=
usage

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      2894 =C2=B132%     +98.4%       5742 =C2=B131%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      2894 =C2=B132%     +98.4%       5742 =C2=B131%  TOTAL cpuidle.C6-SNB.=
time

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

  18604327 =C2=B1 7%     -43.0%   10606401 =C2=B112%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
  18604327 =C2=B1 7%     -43.0%   10606401 =C2=B112%  TOTAL cpuidle.C1E-NHM=
.time

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.253e+08 =C2=B1 2%     +55.0%  1.942e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.253e+08 =C2=B1 2%     +55.0%  1.942e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e3.numa_local

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.253e+08 =C2=B1 2%     +55.0%  1.942e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.253e+08 =C2=B1 2%     +55.0%  1.942e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e3.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 2.554e+08 =C2=B1 2%     +53.1%   3.91e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.554e+08 =C2=B1 2%     +53.1%   3.91e+08 =C2=B1 1%  TOTAL numa-numastat.n=
ode3.local_node

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 2.554e+08 =C2=B1 2%     +53.1%   3.91e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.554e+08 =C2=B1 2%     +53.1%   3.91e+08 =C2=B1 1%  TOTAL numa-numastat.n=
ode3.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 4.133e+08 =C2=B1 0%     +13.6%  4.695e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.094e+08 =C2=B1 4%     +70.5%  1.866e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 5.228e+08 =C2=B1 1%     +25.5%  6.561e+08 =C2=B1 0%  TOTAL proc-vmstat.pga=
lloc_dma32

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      0.17 =C2=B110%     +52.9%       0.27 =C2=B121%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      0.17 =C2=B110%     +52.9%       0.27 =C2=B121%  TOTAL turbostat.%c1

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.981e+08 =C2=B1 0%     +14.0%  2.259e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.267e+08 =C2=B1 2%     +63.0%  2.066e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 3.248e+08 =C2=B1 1%     +33.1%  4.325e+08 =C2=B1 0%  TOTAL numa-vmstat.nod=
e0.numa_local

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.981e+08 =C2=B1 0%     +14.0%  2.259e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.267e+08 =C2=B1 2%     +63.0%  2.066e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 3.249e+08 =C2=B1 1%     +33.1%  4.325e+08 =C2=B1 0%  TOTAL numa-vmstat.nod=
e0.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 3.989e+08 =C2=B1 0%     +13.1%   4.51e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.582e+08 =C2=B1 2%     +60.9%  4.155e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 6.571e+08 =C2=B1 1%     +31.9%  8.665e+08 =C2=B1 0%  TOTAL numa-numastat.n=
ode0.local_node

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 3.989e+08 =C2=B1 0%     +13.1%   4.51e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.582e+08 =C2=B1 2%     +60.9%  4.155e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 6.571e+08 =C2=B1 1%     +31.9%  8.665e+08 =C2=B1 0%  TOTAL numa-numastat.n=
ode0.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.905e+08 =C2=B1 1%     +13.0%  2.153e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.256e+08 =C2=B1 1%     +55.7%  1.956e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 3.161e+08 =C2=B1 1%     +30.0%  4.109e+08 =C2=B1 0%  TOTAL numa-vmstat.nod=
e1.numa_local

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.905e+08 =C2=B1 1%     +13.0%  2.153e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.257e+08 =C2=B1 1%     +55.7%  1.957e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 3.162e+08 =C2=B1 1%     +30.0%   4.11e+08 =C2=B1 0%  TOTAL numa-vmstat.nod=
e1.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 3.836e+08 =C2=B1 1%     +12.4%  4.314e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.561e+08 =C2=B1 1%     +53.9%  3.942e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 6.397e+08 =C2=B1 1%     +29.0%  8.256e+08 =C2=B1 0%  TOTAL numa-numastat.n=
ode1.local_node

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 3.836e+08 =C2=B1 1%     +12.4%  4.314e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.561e+08 =C2=B1 1%     +53.9%  3.942e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 6.397e+08 =C2=B1 1%     +29.0%  8.256e+08 =C2=B1 0%  TOTAL numa-numastat.n=
ode1.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.952e+08 =C2=B1 1%     +10.0%  2.148e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.251e+08 =C2=B1 2%     +56.3%  1.955e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 3.202e+08 =C2=B1 1%     +28.1%  4.102e+08 =C2=B1 0%  TOTAL numa-vmstat.nod=
e2.numa_local

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 1.952e+08 =C2=B1 1%     +10.0%  2.148e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.251e+08 =C2=B1 2%     +56.3%  1.955e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 3.203e+08 =C2=B1 1%     +28.1%  4.103e+08 =C2=B1 0%  TOTAL numa-vmstat.nod=
e2.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 8.277e+09 =C2=B1 0%     +11.1%  9.194e+09 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
   5.4e+09 =C2=B1 2%     +55.7%  8.406e+09 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.368e+10 =C2=B1 1%     +28.7%   1.76e+10 =C2=B1 0%  TOTAL proc-vmstat.pgf=
ree

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 2.853e+08 =C2=B1 0%     +11.1%  3.169e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.861e+08 =C2=B1 2%     +55.7%  2.897e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 4.713e+08 =C2=B1 1%     +28.7%  6.065e+08 =C2=B1 0%  TOTAL softirqs.NET_RX

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

  1.57e+09 =C2=B1 0%     +11.1%  1.744e+09 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.024e+09 =C2=B1 2%     +55.6%  1.594e+09 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.594e+09 =C2=B1 1%     +28.7%  3.338e+09 =C2=B1 0%  TOTAL proc-vmstat.num=
a_local

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

  1.57e+09 =C2=B1 0%     +11.1%  1.744e+09 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.024e+09 =C2=B1 2%     +55.6%  1.594e+09 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.594e+09 =C2=B1 1%     +28.7%  3.338e+09 =C2=B1 0%  TOTAL proc-vmstat.num=
a_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 7.864e+09 =C2=B1 0%     +11.0%  8.725e+09 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
  5.29e+09 =C2=B1 2%     +55.4%   8.22e+09 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 1.315e+10 =C2=B1 1%     +28.8%  1.694e+10 =C2=B1 0%  TOTAL proc-vmstat.pga=
lloc_normal

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 3.927e+08 =C2=B1 1%      +9.6%  4.305e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.547e+08 =C2=B1 2%     +54.5%  3.936e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 6.474e+08 =C2=B1 1%     +27.3%   8.24e+08 =C2=B1 0%  TOTAL numa-numastat.n=
ode2.local_node

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

 3.927e+08 =C2=B1 1%      +9.6%  4.305e+08 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 2.547e+08 =C2=B1 2%     +54.5%  3.936e+08 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
 6.474e+08 =C2=B1 1%     +27.3%   8.24e+08 =C2=B1 0%  TOTAL numa-numastat.n=
ode2.numa_hit

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      1294 =C2=B1 4%     -17.2%       1071 =C2=B111%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      1294 =C2=B1 4%     -17.2%       1071 =C2=B111%  TOTAL numa-vmstat.nod=
e0.nr_page_table_pages

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      5176 =C2=B1 4%     -17.2%       4288 =C2=B111%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      5176 =C2=B1 4%     -17.2%       4288 =C2=B111%  TOTAL numa-meminfo.no=
de0.PageTables

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      1.58 =C2=B1 3%     +20.3%       1.90 =C2=B1 0%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      1.58 =C2=B1 3%     +20.3%       1.90 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles.get_page_from_freelist.__alloc_pages_nodemask.alloc_kmem_pages_nod=
e.kmalloc_large_node.__kmalloc_node_track_caller

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      3.29 =C2=B1 1%      +9.8%       3.62 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      2.60 =C2=B1 1%     +16.3%       3.02 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      5.89 =C2=B1 1%     +12.6%       6.63 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.memcpy.sctp_packet_transmit_chunk.sctp_outq_flush.sctp_outq_uncork=
.sctp_cmd_interpreter

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      1400 =C2=B1 7%     +11.9%       1566 =C2=B1 4%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      1400 =C2=B1 7%     +11.9%       1566 =C2=B1 4%  TOTAL slabinfo.nfs_re=
ad_data.active_objs

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      1400 =C2=B1 7%     +11.9%       1566 =C2=B1 4%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      1400 =C2=B1 7%     +11.9%       1566 =C2=B1 4%  TOTAL slabinfo.nfs_re=
ad_data.num_objs

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      6.49 =C2=B1 0%     +12.8%       7.32 =C2=B1 2%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      6.49 =C2=B1 0%     +12.8%       7.32 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.skb_copy_datagram_iovec.sctp_recvmsg.sock=
_common_recvmsg.sock_recvmsg

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

     11700 =C2=B1 4%     +18.7%      13891 =C2=B1 7%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
     11700 =C2=B1 4%     +18.7%      13891 =C2=B1 7%  TOTAL proc-vmstat.pgm=
igrate_success

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

     11700 =C2=B1 4%     +18.7%      13891 =C2=B1 7%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
     11700 =C2=B1 4%     +18.7%      13891 =C2=B1 7%  TOTAL proc-vmstat.num=
a_pages_migrated

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

    139702 =C2=B1 1%     +16.3%     162521 =C2=B1 5%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    139702 =C2=B1 1%     +16.3%     162521 =C2=B1 5%  TOTAL proc-vmstat.num=
a_hint_faults

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

       977 =C2=B1 2%     +16.0%       1133 =C2=B1 8%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
       977 =C2=B1 2%     +16.0%       1133 =C2=B1 8%  TOTAL proc-vmstat.pgm=
igrate_fail

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      7.74 =C2=B1 0%     +10.4%       8.54 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      6.81 =C2=B1 0%     +12.2%       7.64 =C2=B1 2%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
     14.55 =C2=B1 0%     +11.2%      16.18 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.sctp_user_addto_chunk.sctp_datamsg_from_u=
ser.sctp_sendmsg.inet_sendmsg

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      4.98 =C2=B1 0%     +11.8%       5.57 =C2=B1 2%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      4.98 =C2=B1 0%     +11.8%       5.57 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.memcpy.sctp_outq_flush.sctp_outq_uncork.sctp_cmd_interpreter.sctp_=
do_sm

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

    160357 =C2=B1 1%     +14.2%     183117 =C2=B1 4%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    160357 =C2=B1 1%     +14.2%     183117 =C2=B1 4%  TOTAL proc-vmstat.num=
a_pte_updates

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

      1653 =C2=B1 3%      -8.5%       1512 =C2=B1 4%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
      1653 =C2=B1 3%      -8.5%       1512 =C2=B1 4%  TOTAL numa-vmstat.nod=
e0.nr_alloc_batch

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

    474850 =C2=B1 0%     +11.3%     528286 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    310335 =C2=B1 2%     +55.9%     483905 =C2=B1 1%  lkp-wsx02/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
    785185 =C2=B1 1%     +28.9%    1012192 =C2=B1 0%  TOTAL vmstat.system.cs

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

       354 =C2=B1 0%      +3.2%        366 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
       354 =C2=B1 0%      +3.2%        366 =C2=B1 0%  TOTAL turbostat.Cor_W

eb1ac820c61d0d8  8f61059a96c2a29c1cc5a39df  =

---------------  -------------------------  =

       410 =C2=B1 0%      +2.8%        422 =C2=B1 0%  lkp-sbx04/netperf/300=
s-200%-10K-SCTP_STREAM_MANY
       410 =C2=B1 0%      +2.8%        422 =C2=B1 0%  TOTAL turbostat.Pkg_W




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

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============1340212111224536623==
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
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm5ldHNl
cnZlcgpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwg
MzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0t
IC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEw
SwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10
IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFN
X01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkg
LWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAw
IC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1t
IDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwg
MzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0t
IC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEw
SwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10
IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFN
X01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkg
LWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAw
IC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1t
IDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwg
MzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0t
IC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEw
SwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10
IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFN
X01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkg
LWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAw
IC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1t
IDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwg
MzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0t
IC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEw
SwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10
IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFN
X01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkg
LWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAw
IC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1t
IDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwg
MzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0t
IC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEw
SwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10
IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFN
X01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkg
LWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAw
IC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1t
IDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwg
MzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0t
IC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEw
SwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10
IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFN
X01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkg
LWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAw
IC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1t
IDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwg
MzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0t
IC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEw
SwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10
IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwo=

--===============1340212111224536623==--

