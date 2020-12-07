Content-Type: multipart/mixed; boundary="===============5305678642921953087=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [iov_iter] 9bd0e337c6: will-it-scale.per_process_ops -4.8% regression
Date: Mon, 07 Dec 2020 21:10:37 +0800
Message-ID: <20201207131037.GA3826@xsang-OptiPlex-9020>
In-Reply-To: <98294.1607082708@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5305678642921953087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Dec 04, 2020 at 11:51:48AM +0000, David Howells wrote:
> kernel test robot <oliver.sang@intel.com> wrote:
> =

> > FYI, we noticed a -4.8% regression of will-it-scale.per_process_ops due=
 to commit:
> > =

> > =

> > commit: 9bd0e337c633aed3e8ec3c7397b7ae0b8436f163 ("[PATCH 01/29] iov_it=
er: Switch to using a table of operations")
> =

> Out of interest, would it be possible for you to run this on the tail of =
the
> series on the same hardware?

sorry for late. below is the result adding the tail of the series:
* ded69a6991fe0 (linux-review/David-Howells/RFC-iov_iter-Switch-to-using-an=
-ops-table/20201121-222344) iov_iter: Remove iterate_all_kinds() and iterat=
e_and_advance()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/process/50%/debian-10.4-x86_64-20200603=
.cgz/lkp-ivb-2ep1/pwrite1/will-it-scale/0x42e

commit: =

  27bba9c532a8d21050b94224ffd310ad0058c353
  9bd0e337c633aed3e8ec3c7397b7ae0b8436f163
  ded69a6991fe0094f36d96bf1ace2a9636428676

27bba9c532a8d210 9bd0e337c633aed3e8ec3c7397b ded69a6991fe0094f36d96bf1ac =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

  28443113            -4.8%   27064036            -4.8%   27084904        w=
ill-it-scale.24.processes
   1185129            -4.8%    1127667            -4.8%    1128537        w=
ill-it-scale.per_process_ops
  28443113            -4.8%   27064036            -4.8%   27084904        w=
ill-it-scale.workload
     13.84            +1.0%      13.98            +0.3%      13.89        b=
oot-time.dhcp
      1251 =C2=B1  9%     -17.2%       1035 =C2=B1 10%      -9.1%       113=
7 =C2=B1  5%  slabinfo.dmaengine-unmap-16.active_objs
      1251 =C2=B1  9%     -17.2%       1035 =C2=B1 10%      -9.1%       113=
7 =C2=B1  5%  slabinfo.dmaengine-unmap-16.num_objs
      1052 =C2=B1  6%      -1.1%       1041 =C2=B1  5%     -13.4%     911.7=
5 =C2=B1 10%  slabinfo.task_group.active_objs
      1052 =C2=B1  6%      -1.1%       1041 =C2=B1  5%     -13.4%     911.7=
5 =C2=B1 10%  slabinfo.task_group.num_objs
     31902 =C2=B1  5%      -5.6%      30124 =C2=B1  7%      -8.3%      2926=
5 =C2=B1  4%  slabinfo.vm_area_struct.active_objs
     32163 =C2=B1  5%      -5.4%      30441 =C2=B1  6%      -8.0%      2960=
2 =C2=B1  4%  slabinfo.vm_area_struct.num_objs
     73.46 =C2=B1 48%     -59.7%      29.59 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.MIN_vruntime.avg
      2386 =C2=B1 23%     -40.5%       1420 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.MIN_vruntime.max
    393.92 =C2=B1 33%     -48.5%     202.85 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.MIN_vruntime.stddev
     73.46 =C2=B1 48%     -59.7%      29.60 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.max_vruntime.avg
      2386 =C2=B1 23%     -40.5%       1420 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.max_vruntime.max
    393.92 =C2=B1 33%     -48.5%     202.94 =C2=B1100%    -100.0%       0.0=
0        sched_debug.cfs_rq:/.max_vruntime.stddev
      0.00 =C2=B1  9%     -13.5%       0.00 =C2=B1  3%      -2.9%       0.0=
0 =C2=B1 13%  sched_debug.cpu.next_balance.stddev
    -18.50           +33.5%     -24.70           -41.9%     -10.75        s=
ched_debug.cpu.nr_uninterruptible.min
    411.75 =C2=B1 58%     +76.8%     728.00 =C2=B1 32%     +59.2%     655.5=
0 =C2=B1 50%  numa-vmstat.node0.nr_active_anon
     34304 =C2=B1  2%     -35.6%      22103 =C2=B1 48%      +8.6%      3724=
3 =C2=B1 26%  numa-vmstat.node0.nr_anon_pages
     36087 =C2=B1  2%     -31.0%      24915 =C2=B1 43%      +7.0%      3860=
6 =C2=B1 27%  numa-vmstat.node0.nr_inactive_anon
      2233 =C2=B1 51%     +60.4%       3582 =C2=B1  7%      -7.7%       206=
2 =C2=B1 51%  numa-vmstat.node0.nr_shmem
    411.75 =C2=B1 58%     +76.8%     728.00 =C2=B1 32%     +59.2%     655.5=
0 =C2=B1 50%  numa-vmstat.node0.nr_zone_active_anon
     36087 =C2=B1  2%     -31.0%      24915 =C2=B1 43%      +7.0%      3860=
6 =C2=B1 27%  numa-vmstat.node0.nr_zone_inactive_anon
     24265 =C2=B1  3%     +51.3%      36707 =C2=B1 29%     -12.2%      2131=
5 =C2=B1 47%  numa-vmstat.node1.nr_anon_pages
     25441 =C2=B1  2%     +44.9%      36858 =C2=B1 29%      -9.9%      2291=
2 =C2=B1 47%  numa-vmstat.node1.nr_inactive_anon
    537.25 =C2=B1 20%     +22.8%     659.50 =C2=B1 10%     +14.5%     615.0=
0 =C2=B1 21%  numa-vmstat.node1.nr_page_table_pages
     25441 =C2=B1  2%     +44.9%      36858 =C2=B1 29%      -9.9%      2291=
2 =C2=B1 47%  numa-vmstat.node1.nr_zone_inactive_anon
      1649 =C2=B1 58%     +76.7%       2913 =C2=B1 32%     +59.0%       262=
1 =C2=B1 50%  numa-meminfo.node0.Active
      1649 =C2=B1 58%     +76.7%       2913 =C2=B1 32%     +59.0%       262=
1 =C2=B1 50%  numa-meminfo.node0.Active(anon)
    137223 =C2=B1  2%     -35.6%      88410 =C2=B1 48%      +8.6%     14897=
3 =C2=B1 26%  numa-meminfo.node0.AnonPages
    164997 =C2=B1  9%     -28.4%     118095 =C2=B1 42%      +6.9%     17634=
0 =C2=B1 23%  numa-meminfo.node0.AnonPages.max
    144353 =C2=B1  2%     -31.0%      99656 =C2=B1 43%      +7.0%     15442=
4 =C2=B1 27%  numa-meminfo.node0.Inactive
    144353 =C2=B1  2%     -31.0%      99656 =C2=B1 43%      +7.0%     15442=
4 =C2=B1 27%  numa-meminfo.node0.Inactive(anon)
      8937 =C2=B1 51%     +60.3%      14328 =C2=B1  7%      -7.7%       825=
1 =C2=B1 51%  numa-meminfo.node0.Shmem
     97072 =C2=B1  3%     +51.3%     146858 =C2=B1 29%     -12.2%      8527=
4 =C2=B1 47%  numa-meminfo.node1.AnonPages
    127410 =C2=B1  5%     +43.2%     182468 =C2=B1 16%      -1.9%     12498=
6 =C2=B1 42%  numa-meminfo.node1.AnonPages.max
    101822 =C2=B1  2%     +44.9%     147521 =C2=B1 29%      -9.9%      9173=
8 =C2=B1 47%  numa-meminfo.node1.Inactive
    101822 =C2=B1  2%     +44.9%     147521 =C2=B1 29%      -9.9%      9173=
8 =C2=B1 47%  numa-meminfo.node1.Inactive(anon)
      2148 =C2=B1 20%     +22.9%       2639 =C2=B1 10%     +14.5%       246=
0 =C2=B1 21%  numa-meminfo.node1.PageTables
     24623 =C2=B1  5%     -18.0%      20184 =C2=B1 15%      -6.9%      2292=
9 =C2=B1 15%  softirqs.CPU0.RCU
     15977 =C2=B1  9%     +34.4%      21477 =C2=B1 22%     +54.7%      2471=
1 =C2=B1 15%  softirqs.CPU13.RCU
     30680 =C2=B1 40%     -56.2%      13431 =C2=B1 60%     -70.8%       896=
6 =C2=B1 44%  softirqs.CPU13.SCHED
     28877 =C2=B1 10%     -30.6%      20051 =C2=B1 15%     -24.2%      2188=
7 =C2=B1 13%  softirqs.CPU19.RCU
      5693 =C2=B1 31%    +402.3%      28595 =C2=B1 22%    +154.6%      1449=
6 =C2=B1 46%  softirqs.CPU19.SCHED
      5753 =C2=B1 14%    +141.4%      13886 =C2=B1 87%    +172.2%      1565=
7 =C2=B1 51%  softirqs.CPU2.SCHED
      7252 =C2=B1 79%    +239.9%      24653 =C2=B1 48%    +189.1%      2096=
8 =C2=B1 44%  softirqs.CPU23.SCHED
     42479           -24.7%      31999 =C2=B1 39%     -25.9%      31488 =C2=
=B1 27%  softirqs.CPU26.SCHED
     21142 =C2=B1 15%     -26.5%      15533 =C2=B1 11%      +5.6%      2231=
7 =C2=B1 17%  softirqs.CPU27.RCU
     20776 =C2=B1 38%     -50.5%      10290 =C2=B1 58%      +4.7%      2174=
8 =C2=B1 35%  softirqs.CPU3.SCHED
     26618 =C2=B1 11%     -35.3%      17214 =C2=B1  6%     -33.5%      1768=
9 =C2=B1  5%  softirqs.CPU37.RCU
     10894 =C2=B1 48%    +175.5%      30012 =C2=B1 34%    +237.2%      3673=
4 =C2=B1 10%  softirqs.CPU37.SCHED
     17015 =C2=B1  4%     +39.2%      23681 =C2=B1  7%      +9.9%      1870=
7 =C2=B1 21%  softirqs.CPU43.RCU
     29682 =C2=B1 10%     -17.6%      24446 =C2=B1 23%     -18.9%      2406=
2 =C2=B1  9%  softirqs.CPU6.RCU
     21953 =C2=B1 20%      +9.7%      24079 =C2=B1 24%     -18.3%      1794=
3 =C2=B1 23%  softirqs.CPU7.RCU
      3431 =C2=B1 89%     -85.1%     512.25 =C2=B1109%     -93.6%     220.7=
5 =C2=B1 32%  interrupts.38:PCI-MSI.2621444-edge.eth0-TxRx-3
    348.50 =C2=B1 62%    +152.7%     880.75 =C2=B1 27%     -30.1%     243.5=
0 =C2=B1 44%  interrupts.40:PCI-MSI.2621446-edge.eth0-TxRx-5
     50948            -0.6%      50655            +7.1%      54590 =C2=B1  =
6%  interrupts.CAL:Function_call_interrupts
      2579 =C2=B1 26%     +32.3%       3412 =C2=B1 43%     +58.3%       408=
2 =C2=B1 27%  interrupts.CPU0.NMI:Non-maskable_interrupts
      2579 =C2=B1 26%     +32.3%       3412 =C2=B1 43%     +58.3%       408=
2 =C2=B1 27%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
    296.75            -3.4%     286.75 =C2=B1  7%     -38.2%     183.50 =C2=
=B1 40%  interrupts.CPU1.RES:Rescheduling_interrupts
    737.25            +8.7%     801.75 =C2=B1 13%     +92.5%       1419 =C2=
=B1 73%  interrupts.CPU11.CAL:Function_call_interrupts
      1697 =C2=B1 63%     -53.1%     796.75 =C2=B1 13%     -55.7%     751.5=
0        interrupts.CPU13.CAL:Function_call_interrupts
     89.75 =C2=B1 36%    +220.3%     287.50 =C2=B1 20%    +195.3%     265.0=
0 =C2=B1 10%  interrupts.CPU13.RES:Rescheduling_interrupts
    745.75 =C2=B1  3%    +104.6%       1526 =C2=B1 69%     +52.7%       113=
8 =C2=B1 61%  interrupts.CPU19.CAL:Function_call_interrupts
    293.00 =C2=B1  5%     -60.0%     117.25 =C2=B1 47%     -24.1%     222.2=
5 =C2=B1 22%  interrupts.CPU19.RES:Rescheduling_interrupts
    778.50 =C2=B1  9%    +123.7%       1741 =C2=B1 64%      +3.3%     804.5=
0 =C2=B1 10%  interrupts.CPU22.CAL:Function_call_interrupts
    670.00 =C2=B1 22%     +40.2%     939.50 =C2=B1 49%     +84.6%       123=
6 =C2=B1 63%  interrupts.CPU23.CAL:Function_call_interrupts
    283.50 =C2=B1  7%     -47.7%     148.25 =C2=B1 64%     -38.9%     173.2=
5 =C2=B1 38%  interrupts.CPU23.RES:Rescheduling_interrupts
      6450 =C2=B1 29%     -38.0%       4000 =C2=B1  4%      +8.2%       697=
7 =C2=B1 29%  interrupts.CPU24.NMI:Non-maskable_interrupts
      6450 =C2=B1 29%     -38.0%       4000 =C2=B1  4%      +8.2%       697=
7 =C2=B1 29%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
      2505 =C2=B1 24%    +100.2%       5015 =C2=B1 45%    +166.6%       667=
9 =C2=B1 26%  interrupts.CPU25.NMI:Non-maskable_interrupts
      2505 =C2=B1 24%    +100.2%       5015 =C2=B1 45%    +166.6%       667=
9 =C2=B1 26%  interrupts.CPU25.PMI:Performance_monitoring_interrupts
      2012 =C2=B1 56%     -57.6%     852.75 =C2=B1  6%     -48.0%       104=
7 =C2=B1 35%  interrupts.CPU26.CAL:Function_call_interrupts
     71.50 =C2=B1 12%     +73.4%     124.00 =C2=B1 72%    +106.3%     147.5=
0 =C2=B1 49%  interrupts.CPU26.RES:Rescheduling_interrupts
      4198 =C2=B1 54%      +5.7%       4438 =C2=B1 51%     +41.8%       595=
2 =C2=B1 40%  interrupts.CPU27.NMI:Non-maskable_interrupts
      4198 =C2=B1 54%      +5.7%       4438 =C2=B1 51%     +41.8%       595=
2 =C2=B1 40%  interrupts.CPU27.PMI:Performance_monitoring_interrupts
    184.25 =C2=B1 37%     -47.9%      96.00 =C2=B1 49%      -6.5%     172.2=
5 =C2=B1 27%  interrupts.CPU27.RES:Rescheduling_interrupts
      0.50 =C2=B1100%  +64250.0%     321.75 =C2=B1170%    +500.0%       3.0=
0 =C2=B1115%  interrupts.CPU28.TLB:TLB_shootdowns
      3431 =C2=B1 89%     -85.1%     512.25 =C2=B1109%     -93.6%     220.7=
5 =C2=B1 32%  interrupts.CPU29.38:PCI-MSI.2621444-edge.eth0-TxRx-3
      5982 =C2=B1 40%     -21.5%       4695 =C2=B1 46%     -35.1%       388=
1 =C2=B1 64%  interrupts.CPU3.NMI:Non-maskable_interrupts
      5982 =C2=B1 40%     -21.5%       4695 =C2=B1 46%     -35.1%       388=
1 =C2=B1 64%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
    348.50 =C2=B1 62%    +152.7%     880.75 =C2=B1 27%     -30.1%     243.5=
0 =C2=B1 44%  interrupts.CPU31.40:PCI-MSI.2621446-edge.eth0-TxRx-5
    156.50 =C2=B1 51%     -51.3%      76.25 =C2=B1 59%      +9.1%     170.7=
5 =C2=B1 48%  interrupts.CPU33.RES:Rescheduling_interrupts
    883.50 =C2=B1 18%     -23.8%     673.25 =C2=B1 22%      -2.2%     863.7=
5 =C2=B1 12%  interrupts.CPU36.CAL:Function_call_interrupts
      7492 =C2=B1 13%     -45.6%       4073 =C2=B1 63%     -40.2%       448=
3 =C2=B1 27%  interrupts.CPU37.NMI:Non-maskable_interrupts
      7492 =C2=B1 13%     -45.6%       4073 =C2=B1 63%     -40.2%       448=
3 =C2=B1 27%  interrupts.CPU37.PMI:Performance_monitoring_interrupts
    250.50 =C2=B1 19%     -52.5%     119.00 =C2=B1 50%     -76.0%      60.0=
0 =C2=B1 49%  interrupts.CPU37.RES:Rescheduling_interrupts
    772.50 =C2=B1  2%      +2.0%     787.75 =C2=B1 10%    +346.2%       344=
7 =C2=B1127%  interrupts.CPU40.CAL:Function_call_interrupts
      4688 =C2=B1 27%     +63.5%       7667 =C2=B1 15%     +14.0%       534=
5 =C2=B1 38%  interrupts.CPU40.NMI:Non-maskable_interrupts
      4688 =C2=B1 27%     +63.5%       7667 =C2=B1 15%     +14.0%       534=
5 =C2=B1 38%  interrupts.CPU40.PMI:Performance_monitoring_interrupts
     96.75 =C2=B1 92%    +135.1%     227.50 =C2=B1 22%     +29.5%     125.2=
5 =C2=B1 46%  interrupts.CPU43.RES:Rescheduling_interrupts
      2932 =C2=B1 36%     +73.4%       5084 =C2=B1 21%     +24.7%       365=
6 =C2=B1 55%  interrupts.CPU47.NMI:Non-maskable_interrupts
      2932 =C2=B1 36%     +73.4%       5084 =C2=B1 21%     +24.7%       365=
6 =C2=B1 55%  interrupts.CPU47.PMI:Performance_monitoring_interrupts
     57.50 =C2=B1 78%    +250.4%     201.50 =C2=B1 42%    +251.7%     202.2=
5 =C2=B1 17%  interrupts.CPU47.RES:Rescheduling_interrupts
      4207 =C2=B1 61%     +86.0%       7827 =C2=B1 11%     +48.7%       625=
8 =C2=B1 33%  interrupts.CPU8.NMI:Non-maskable_interrupts
      4207 =C2=B1 61%     +86.0%       7827 =C2=B1 11%     +48.7%       625=
8 =C2=B1 33%  interrupts.CPU8.PMI:Performance_monitoring_interrupts
      0.18 =C2=B1 60%     -36.2%       0.11 =C2=B1  9%     -39.0%       0.1=
1 =C2=B1  4%  perf-stat.i.MPKI
 1.089e+10            -2.3%  1.064e+10            -4.8%  1.036e+10        p=
erf-stat.i.branch-instructions
      1.62            +0.7        2.34            +0.8        2.40        p=
erf-stat.i.branch-miss-rate%
 1.741e+08           +42.3%  2.476e+08           +42.2%  2.475e+08        p=
erf-stat.i.branch-misses
      2.70            -0.1        2.65 =C2=B1  6%      +0.2        2.95 =C2=
=B1  3%  perf-stat.i.cache-miss-rate%
   5228328            +4.0%    5436325 =C2=B1  8%      -4.5%    4992245 =C2=
=B1  2%  perf-stat.i.cache-references
      1.36            +3.3%       1.41            +5.5%       1.44        p=
erf-stat.i.cpi
     52.10            +0.9%      52.55            +1.8%      53.04        p=
erf-stat.i.cpu-migrations
 1.233e+08 =C2=B1  3%      -7.1%  1.146e+08            +1.6%  1.253e+08 =C2=
=B1 11%  perf-stat.i.dTLB-load-misses
  2.38e+10            -3.3%  2.302e+10            -4.5%  2.273e+10        p=
erf-stat.i.dTLB-loads
  57501510            -4.9%   54711717            -4.6%   54852849        p=
erf-stat.i.dTLB-store-misses
 1.828e+10            -3.7%  1.761e+10            -4.3%   1.75e+10        p=
erf-stat.i.dTLB-stores
     98.97            -2.9       96.02 =C2=B1  2%     -29.3       69.69    =
    perf-stat.i.iTLB-load-miss-rate%
  29795797 =C2=B1  4%      -5.0%   28320171            -5.2%   28254639    =
    perf-stat.i.iTLB-load-misses
    299268 =C2=B1  2%    +298.1%    1191476 =C2=B1 50%   +4062.6%   1245739=
6 =C2=B1  4%  perf-stat.i.iTLB-loads
 5.335e+10            -3.7%  5.138e+10            -5.7%  5.029e+10        p=
erf-stat.i.instructions
      0.74            -3.7%       0.71            -5.7%       0.70        p=
erf-stat.i.ipc
      0.20 =C2=B1  8%     +12.1%       0.23            +2.7%       0.21 =C2=
=B1  9%  perf-stat.i.major-faults
      1104            -3.2%       1069            -4.5%       1055        p=
erf-stat.i.metric.M/sec
     66981            +4.3%      69845 =C2=B1  6%     +10.1%      73725 =C2=
=B1  4%  perf-stat.i.node-load-misses
     84278 =C2=B1  2%      +7.2%      90313 =C2=B1  6%      +9.8%      9254=
3 =C2=B1  5%  perf-stat.i.node-loads
     72308            +2.3%      73975 =C2=B1  2%      +1.5%      73361    =
    perf-stat.i.node-stores
      0.10            +7.9%       0.11 =C2=B1  8%      +1.3%       0.10 =C2=
=B1  3%  perf-stat.overall.MPKI
      1.60            +0.7        2.33            +0.8        2.39        p=
erf-stat.overall.branch-miss-rate%
      3.60 =C2=B1  6%      -0.1        3.45 =C2=B1  7%      +0.3        3.8=
8 =C2=B1  2%  perf-stat.overall.cache-miss-rate%
      1.35            +4.1%       1.41            +6.2%       1.44        p=
erf-stat.overall.cpi
     99.00            -3.0       95.98 =C2=B1  2%     -29.6       69.42    =
    perf-stat.overall.iTLB-load-miss-rate%
      0.74            -3.9%       0.71            -5.9%       0.70        p=
erf-stat.overall.ipc
    567203            +1.0%     572789            -1.2%     560464        p=
erf-stat.overall.path-length
 1.085e+10            -2.3%   1.06e+10            -4.8%  1.033e+10        p=
erf-stat.ps.branch-instructions
 1.735e+08           +42.3%  2.468e+08           +42.2%  2.467e+08        p=
erf-stat.ps.branch-misses
   5216268            +4.0%    5422673 =C2=B1  8%      -4.5%    4979211 =C2=
=B1  2%  perf-stat.ps.cache-references
     51.99            +0.8%      52.43            +1.8%      52.92        p=
erf-stat.ps.cpu-migrations
 1.229e+08 =C2=B1  3%      -7.1%  1.142e+08            +1.6%  1.249e+08 =C2=
=B1 12%  perf-stat.ps.dTLB-load-misses
 2.372e+10            -3.3%  2.294e+10            -4.5%  2.266e+10        p=
erf-stat.ps.dTLB-loads
  57306258            -4.9%   54525679            -4.6%   54668669        p=
erf-stat.ps.dTLB-store-misses
 1.822e+10            -3.7%  1.755e+10            -4.3%  1.744e+10        p=
erf-stat.ps.dTLB-stores
  29695158 =C2=B1  4%      -5.0%   28224049            -5.2%   28159995    =
    perf-stat.ps.iTLB-load-misses
    298257 =C2=B1  2%    +298.1%    1187498 =C2=B1 50%   +4061.6%   1241224=
1 =C2=B1  4%  perf-stat.ps.iTLB-loads
 5.317e+10            -3.7%   5.12e+10            -5.7%  5.012e+10        p=
erf-stat.ps.instructions
      0.20 =C2=B1  7%     +12.0%       0.23 =C2=B1  2%      +3.0%       0.2=
1 =C2=B1  8%  perf-stat.ps.major-faults
     66882            +4.3%      69726 =C2=B1  6%     +10.1%      73651 =C2=
=B1  4%  perf-stat.ps.node-load-misses
     84325 =C2=B1  2%      +7.1%      90306 =C2=B1  6%      +9.7%      9248=
9 =C2=B1  5%  perf-stat.ps.node-loads
 1.613e+13            -3.9%   1.55e+13            -5.9%  1.518e+13        p=
erf-stat.total.instructions
      8.00 =C2=B1 14%      -8.0        0.00            -8.0        0.00    =
    perf-profile.calltrace.cycles-pp.iov_iter_copy_from_user_atomic.generic=
_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_w=
rite
      7.38 =C2=B1 14%      -7.4        0.00            -7.4        0.00    =
    perf-profile.calltrace.cycles-pp.copyin.iov_iter_copy_from_user_atomic.=
generic_perform_write.__generic_file_write_iter.generic_file_write_iter
      7.27 =C2=B1 14%      -7.3        0.00            -7.3        0.00    =
    perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copyin.=
iov_iter_copy_from_user_atomic.generic_perform_write.__generic_file_write_i=
ter
      6.71 =C2=B1 12%      -0.7        5.98 =C2=B1 13%      -0.7        6.0=
3 =C2=B1 10%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__=
libc_pwrite
      4.93 =C2=B1 12%      -0.6        4.29 =C2=B1 14%      -0.5        4.4=
0 =C2=B1 11%  perf-profile.calltrace.cycles-pp.shmem_getpage_gfp.shmem_writ=
e_begin.generic_perform_write.__generic_file_write_iter.generic_file_write_=
iter
      5.81 =C2=B1 13%      -0.6        5.22 =C2=B1 14%      -0.6        5.1=
7 =C2=B1 11%  perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_pe=
rform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      3.50 =C2=B1 14%      -0.5        3.03 =C2=B1 13%      -0.4        3.1=
3 =C2=B1 11%  perf-profile.calltrace.cycles-pp.shmem_write_end.generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.69 =C2=B1 14%      -0.4        0.29 =C2=B1100%      -0.5        0.1=
4 =C2=B1173%  perf-profile.calltrace.cycles-pp.up_write.generic_file_write_=
iter.new_sync_write.vfs_write.ksys_pwrite64
      3.44 =C2=B1 12%      -0.4        3.06 =C2=B1 14%      -0.4        3.0=
5 =C2=B1 12%  perf-profile.calltrace.cycles-pp.find_lock_entry.shmem_getpag=
e_gfp.shmem_write_begin.generic_perform_write.__generic_file_write_iter
      0.62 =C2=B1 15%      -0.3        0.30 =C2=B1101%      -0.2        0.4=
3 =C2=B1 59%  perf-profile.calltrace.cycles-pp.unlock_page.shmem_write_end.=
generic_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.85 =C2=B1  8%      -0.2        0.66 =C2=B1 15%      -0.1        0.7=
1 =C2=B1 10%  perf-profile.calltrace.cycles-pp.__fget_light.ksys_pwrite64.d=
o_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
      0.84 =C2=B1 14%      -0.1        0.71 =C2=B1 14%      -0.1        0.7=
2 =C2=B1  8%  perf-profile.calltrace.cycles-pp.set_page_dirty.shmem_write_e=
nd.generic_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.91 =C2=B1 11%      -0.1        0.79 =C2=B1 12%      -0.1        0.8=
2 =C2=B1 10%  perf-profile.calltrace.cycles-pp.file_update_time.__generic_f=
ile_write_iter.generic_file_write_iter.new_sync_write.vfs_write
      0.68 =C2=B1 15%      -0.1        0.58 =C2=B1 13%      -0.1        0.5=
7 =C2=B1  9%  perf-profile.calltrace.cycles-pp.page_mapping.set_page_dirty.=
shmem_write_end.generic_perform_write.__generic_file_write_iter
      0.00            +0.0        0.00            +1.0        1.02 =C2=B1 1=
1%  perf-profile.calltrace.cycles-pp.__get_user_nocheck_1.iovec_fault_in_re=
adable.generic_perform_write.__generic_file_write_iter.generic_file_write_i=
ter
      0.00            +0.0        0.00            +1.2        1.17 =C2=B1  =
9%  perf-profile.calltrace.cycles-pp.iovec_advance.generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.00            +0.0        0.00            +2.1        2.13 =C2=B1 1=
1%  perf-profile.calltrace.cycles-pp.iovec_fault_in_readable.generic_perfor=
m_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.00            +0.0        0.00            +6.8        6.85 =C2=B1 1=
0%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copyin.=
iovec_copy_from_user_atomic.generic_perform_write.__generic_file_write_iter
      0.00            +0.0        0.00            +6.9        6.95 =C2=B1 1=
0%  perf-profile.calltrace.cycles-pp.copyin.iovec_copy_from_user_atomic.gen=
eric_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.00            +0.0        0.00            +8.2        8.17 =C2=B1 1=
0%  perf-profile.calltrace.cycles-pp.iovec_copy_from_user_atomic.generic_pe=
rform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.00            +1.0        1.01 =C2=B1 13%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.__get_user_nocheck_1.xxx_fault_in_read=
able.generic_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.00            +1.4        1.42 =C2=B1 12%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.xxx_advance.generic_perform_write.__ge=
neric_file_write_iter.generic_file_write_iter.new_sync_write
      0.00            +2.1        2.15 =C2=B1 13%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.xxx_fault_in_readable.generic_perform_=
write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      0.00            +6.8        6.82 =C2=B1 13%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copyin.=
xxx_copy_from_user_atomic.generic_perform_write.__generic_file_write_iter
      0.00            +6.9        6.92 =C2=B1 13%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.copyin.xxx_copy_from_user_atomic.gener=
ic_perform_write.__generic_file_write_iter.generic_file_write_iter
      0.00            +8.1        8.09 =C2=B1 14%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.xxx_copy_from_user_atomic.generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
      8.03 =C2=B1 14%      -8.0        0.00            -8.0        0.00    =
    perf-profile.children.cycles-pp.iov_iter_copy_from_user_atomic
      7.55 =C2=B1 12%      -0.8        6.75 =C2=B1 13%      -0.8        6.7=
9 =C2=B1 10%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      4.99 =C2=B1 12%      -0.6        4.34 =C2=B1 14%      -0.5        4.4=
5 =C2=B1 11%  perf-profile.children.cycles-pp.shmem_getpage_gfp
      5.84 =C2=B1 13%      -0.6        5.22 =C2=B1 14%      -0.6        5.2=
0 =C2=B1 11%  perf-profile.children.cycles-pp.shmem_write_begin
      3.53 =C2=B1 13%      -0.5        3.07 =C2=B1 13%      -0.4        3.1=
7 =C2=B1 11%  perf-profile.children.cycles-pp.shmem_write_end
      3.48 =C2=B1 12%      -0.4        3.09 =C2=B1 14%      -0.4        3.0=
9 =C2=B1 12%  perf-profile.children.cycles-pp.find_lock_entry
      0.85 =C2=B1  8%      -0.2        0.66 =C2=B1 15%      -0.1        0.7=
1 =C2=B1 10%  perf-profile.children.cycles-pp.__fget_light
      0.69 =C2=B1 14%      -0.2        0.52 =C2=B1 15%      -0.2        0.4=
8 =C2=B1  9%  perf-profile.children.cycles-pp.up_write
      0.62 =C2=B1 13%      -0.2        0.46 =C2=B1 14%      -0.2        0.4=
7 =C2=B1 12%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.86 =C2=B1 14%      -0.1        0.74 =C2=B1 14%      -0.1        0.7=
4 =C2=B1  8%  perf-profile.children.cycles-pp.set_page_dirty
      0.94 =C2=B1 11%      -0.1        0.82 =C2=B1 13%      -0.1        0.8=
5 =C2=B1 10%  perf-profile.children.cycles-pp.file_update_time
      0.51 =C2=B1 12%      -0.1        0.40 =C2=B1 14%      +0.0        0.5=
2 =C2=B1 11%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimit=
ed
      0.71 =C2=B1 15%      -0.1        0.60 =C2=B1 13%      -0.1        0.6=
0 =C2=B1  9%  perf-profile.children.cycles-pp.page_mapping
      0.55 =C2=B1 12%      -0.1        0.47 =C2=B1 12%      -0.0        0.5=
0 =C2=B1  9%  perf-profile.children.cycles-pp.current_time
      0.62 =C2=B1 14%      -0.1        0.55 =C2=B1 13%      -0.1        0.5=
6 =C2=B1 13%  perf-profile.children.cycles-pp.unlock_page
      0.24 =C2=B1 13%      -0.0        0.20 =C2=B1 16%      -0.0        0.2=
2 =C2=B1 12%  perf-profile.children.cycles-pp.timestamp_truncate
      0.18 =C2=B1 11%      -0.0        0.14 =C2=B1 15%      -0.0        0.1=
8 =C2=B1 12%  perf-profile.children.cycles-pp.file_remove_privs
      0.42 =C2=B1 13%      -0.0        0.39 =C2=B1 14%      -0.1        0.3=
6 =C2=B1 13%  perf-profile.children.cycles-pp.testcase
      0.00            +0.0        0.00            +1.2        1.18 =C2=B1  =
9%  perf-profile.children.cycles-pp.iovec_advance
      0.00            +0.0        0.00            +2.2        2.21 =C2=B1 1=
1%  perf-profile.children.cycles-pp.iovec_fault_in_readable
      0.00            +0.0        0.00            +8.2        8.20 =C2=B1 1=
0%  perf-profile.children.cycles-pp.iovec_copy_from_user_atomic
      0.21 =C2=B1 17%      +0.1        0.28 =C2=B1 16%      +0.1        0.2=
9 =C2=B1 10%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.55 =C2=B1 14%      +0.3        0.87 =C2=B1 15%      +0.3        0.8=
9 =C2=B1 13%  perf-profile.children.cycles-pp.__x86_retpoline_rax
      0.00            +1.4        1.42 =C2=B1 12%      +0.0        0.00    =
    perf-profile.children.cycles-pp.xxx_advance
      0.00            +2.2        2.22 =C2=B1 13%      +0.0        0.00    =
    perf-profile.children.cycles-pp.xxx_fault_in_readable
      0.00            +8.1        8.12 =C2=B1 14%      +0.0        0.00    =
    perf-profile.children.cycles-pp.xxx_copy_from_user_atomic
      7.52 =C2=B1 12%      -0.8        6.72 =C2=B1 13%      -0.8        6.7=
7 =C2=B1 10%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.02 =C2=B1 16%      -0.2        0.82 =C2=B1 12%      -0.1        0.9=
2 =C2=B1 10%  perf-profile.self.cycles-pp.shmem_getpage_gfp
      0.82 =C2=B1  8%      -0.2        0.63 =C2=B1 15%      -0.1        0.6=
8 =C2=B1 10%  perf-profile.self.cycles-pp.__fget_light
      0.66 =C2=B1 14%      -0.2        0.49 =C2=B1 15%      -0.2        0.4=
6 =C2=B1  8%  perf-profile.self.cycles-pp.up_write
      0.54 =C2=B1 15%      -0.2        0.39 =C2=B1 14%      -0.1        0.4=
0 =C2=B1 12%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.59 =C2=B1 13%      -0.1        0.46 =C2=B1 13%      -0.1        0.4=
5 =C2=B1  9%  perf-profile.self.cycles-pp.ksys_pwrite64
      0.50 =C2=B1 12%      -0.1        0.40 =C2=B1 13%      -0.0        0.4=
7 =C2=B1 12%  perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited
      0.67 =C2=B1 15%      -0.1        0.57 =C2=B1 12%      -0.1        0.5=
7 =C2=B1  9%  perf-profile.self.cycles-pp.page_mapping
      0.71 =C2=B1 17%      -0.1        0.63 =C2=B1 13%      -0.1        0.6=
0 =C2=B1 14%  perf-profile.self.cycles-pp.security_file_permission
      0.24 =C2=B1 15%      -0.0        0.19 =C2=B1 15%      -0.0        0.2=
2 =C2=B1 12%  perf-profile.self.cycles-pp.timestamp_truncate
      0.20 =C2=B1 13%      -0.0        0.17 =C2=B1 12%      -0.0        0.1=
8 =C2=B1 10%  perf-profile.self.cycles-pp.current_time
      0.00            +0.0        0.00            +1.1        1.05 =C2=B1  =
9%  perf-profile.self.cycles-pp.iovec_advance
      0.00            +0.0        0.00            +1.2        1.17 =C2=B1 1=
2%  perf-profile.self.cycles-pp.iovec_fault_in_readable
      0.00            +0.0        0.00            +1.2        1.19 =C2=B1 1=
0%  perf-profile.self.cycles-pp.iovec_copy_from_user_atomic
      0.82 =C2=B1 15%      +0.0        0.83 =C2=B1 12%      -0.1        0.7=
1 =C2=B1 10%  perf-profile.self.cycles-pp.shmem_write_begin
      0.12 =C2=B1 14%      +0.1        0.19 =C2=B1 14%      +0.1        0.2=
0 =C2=B1  7%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.43 =C2=B1 14%      +0.3        0.68 =C2=B1 15%      +0.3        0.6=
9 =C2=B1 15%  perf-profile.self.cycles-pp.__x86_retpoline_rax
      0.00            +1.1        1.14 =C2=B1 15%      +0.0        0.00    =
    perf-profile.self.cycles-pp.xxx_copy_from_user_atomic
      0.00            +1.2        1.21 =C2=B1 12%      +0.0        0.00    =
    perf-profile.self.cycles-pp.xxx_fault_in_readable
      0.00            +1.3        1.28 =C2=B1 12%      +0.0        0.00    =
    perf-profile.self.cycles-pp.xxx_advance

> =

> Thanks,
> David
>=20
--===============5305678642921953087==--

