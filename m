Content-Type: multipart/mixed; boundary="===============8662807135284792611=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [rcu] 5057f55e543: dmesg.BUG:soft_lockup-CPU_stuck_for_s
Date: Mon, 06 Oct 2014 13:50:24 +0800
Message-ID: <20141006055024.GD28732@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8662807135284792611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

FYI, we noticed a number of ups and downs for commit

5057f55e543b7859cfd26bc281291795eac93f8a ("rcu: Bind RCU grace-period kthre=
ads if NO_HZ_FULL")

testbox/testcase/testparams: lkp-a04/netperf/300s-200%-SCTP_RR

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
     %stddev        %change               %stddev
            \          |                 /
         3 =C2=B112%    +145.5%          9 =C2=B132%  sched_debug.cfs_rq[0]=
:/.nr_spread_over
      2438 =C2=B1 1%     +10.3%       2689 =C2=B1 2%  sched_debug.cpu#2.cur=
r->pid
     21560 =C2=B1 5%     -24.1%      16358 =C2=B114%  sched_debug.cpu#2.sch=
ed_goidle
     10790 =C2=B1 9%     +64.7%      17776 =C2=B1 8%  sched_debug.cpu#1.sch=
ed_goidle
     20210 =C2=B120%     -25.9%      14968 =C2=B111%  sched_debug.cpu#0.sch=
ed_goidle
     88244 =C2=B1 6%     -51.1%      43188 =C2=B1 6%  meminfo.DirectMap4k
      1689 =C2=B1 4%     +68.5%       2847 =C2=B114%  cpuidle.C1E-ATM.usage
      2610 =C2=B1 3%      -9.9%       2353 =C2=B1 4%  sched_debug.cpu#3.cur=
r->pid
     19071 =C2=B1 4%     -17.9%      15661 =C2=B1 1%  softirqs.SCHED

testbox/testcase/testparams: lkp-a04/netperf/300s-200%-SCTP_STREAM

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
     21897 =C2=B118%     -34.0%      14445 =C2=B1 4%  sched_debug.cfs_rq[2]=
:/.exec_clock
       115 =C2=B110%     -14.1%         99 =C2=B1 9%  sched_debug.cfs_rq[2]=
:/.tg_runnable_contrib
     20231 =C2=B113%     -16.2%      16951 =C2=B1 3%  sched_debug.cfs_rq[3]=
:/.exec_clock
      1.19 =C2=B137%     -53.6%       0.55 =C2=B130%  perf-profile.cpu-cycl=
es.filemap_map_pages.do_read_fault.handle_mm_fault.__do_page_fault.do_page_=
fault
      5346 =C2=B110%     -13.8%       4607 =C2=B1 9%  sched_debug.cfs_rq[2]=
:/.avg->runnable_avg_sum
       291 =C2=B124%     -38.5%        179 =C2=B1 9%  sched_debug.cfs_rq[2]=
:/.load
      1.74 =C2=B139%     -54.1%       0.80 =C2=B1 4%  perf-profile.cpu-cycl=
es.__ctype_get_mb_cur_max
      0.81 =C2=B139%     -43.4%       0.46 =C2=B126%  perf-profile.cpu-cycl=
es.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap.mmput
        18 =C2=B1 5%     -18.2%         15 =C2=B114%  sched_debug.cpu#0.cpu=
_load[4]
      0.89 =C2=B133%     -51.5%       0.43 =C2=B127%  perf-profile.cpu-cycl=
es.menu_select.cpuidle_select.cpu_startup_entry.start_secondary
      1.29 =C2=B123%     -47.0%       0.68 =C2=B113%  perf-profile.cpu-cycl=
es.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.rest_init
       314 =C2=B1 5%     -23.3%        241 =C2=B1 8%  sched_debug.cpu#2.load
   1119966 =C2=B119%     -33.1%     748978 =C2=B1 7%  sched_debug.cpu#2.sch=
ed_count
       262 =C2=B122%     -28.0%        189 =C2=B134%  sched_debug.cfs_rq[0]=
:/.tg_load_contrib
       115 =C2=B1 7%     -15.6%         97 =C2=B1 4%  sched_debug.cfs_rq[0]=
:/.tg_runnable_contrib
      5341 =C2=B1 7%     -15.7%       4505 =C2=B1 4%  sched_debug.cfs_rq[0]=
:/.avg->runnable_avg_sum
       488 =C2=B113%     +16.7%        569 =C2=B112%  sched_debug.cfs_rq[1]=
:/.load
        15 =C2=B121%     +26.1%         19 =C2=B119%  sched_debug.cfs_rq[3]=
:/.nr_spread_over
       472 =C2=B1 9%     +18.2%        558 =C2=B112%  sched_debug.cpu#1.load
      1917 =C2=B1 9%     +19.1%       2284 =C2=B1 2%  sched_debug.cpu#1.cur=
r->pid
     93022 =C2=B112%     -47.0%      49332 =C2=B112%  meminfo.DirectMap4k
        39 =C2=B133%     -40.7%         23 =C2=B127%  sched_debug.cfs_rq[2]=
:/.runnable_load_avg
    671451 =C2=B114%     +52.9%    1026958 =C2=B110%  sched_debug.cpu#1.sch=
ed_count
     43745 =C2=B1 3%     +16.6%      51000 =C2=B1 6%  sched_debug.cpu#1.nr_=
load_updates
      0.96 =C2=B131%     -49.3%       0.49 =C2=B134%  perf-profile.cpu-cycl=
es.find_busiest_group.load_balance.pick_next_task_fair.__schedule.schedule
     64360 =C2=B117%     +80.9%     116399 =C2=B115%  sched_debug.cfs_rq[1]=
:/.min_vruntime
     36171 =C2=B1 6%     -27.8%      26101 =C2=B1 1%  softirqs.RCU
      1537 =C2=B1 0%     -20.1%       1228 =C2=B1 7%  cpuidle.C2-ATM.usage
     16404 =C2=B1 4%     +20.9%      19837 =C2=B1 2%  sched_debug.cfs_rq[0]=
:/.exec_clock
    143516 =C2=B123%     -34.7%      93764 =C2=B112%  sched_debug.cfs_rq[2]=
:/.min_vruntime
      1198 =C2=B1 3%     -14.8%       1021 =C2=B1 7%  cpuidle.C4-ATM.usage
     42206 =C2=B1 2%     -17.8%      34709 =C2=B1 3%  sched_debug.cpu#3.nr_=
load_updates
        10 =C2=B1 4%     +41.9%         14 =C2=B1 8%  sched_debug.cfs_rq[2]=
:/.nr_spread_over
      1788 =C2=B1 8%     -21.7%       1399 =C2=B119%  sched_debug.cpu#3.cur=
r->pid
     43004 =C2=B110%     -25.3%      32112 =C2=B1 5%  sched_debug.cpu#2.nr_=
load_updates
     28737 =C2=B1 1%     -18.2%      23511 =C2=B1 3%  softirqs.SCHED
       881 =C2=B1 0%     +14.3%       1007 =C2=B1 8%  slabinfo.kmalloc-96.a=
ctive_objs
       881 =C2=B1 0%     +14.3%       1007 =C2=B1 8%  slabinfo.kmalloc-96.n=
um_objs
      1.10 =C2=B110%     -24.3%       0.83 =C2=B118%  perf-profile.cpu-cycl=
es.copy_user_generic_string.skb_copy_datagram_iovec.sctp_recvmsg.sock_commo=
n_recvmsg.sock_recvmsg
      2717 =C2=B118%     +27.9%       3474 =C2=B1 7%  slabinfo.anon_vma.act=
ive_objs
      2862 =C2=B110%     +21.4%       3474 =C2=B1 7%  slabinfo.anon_vma.num=
_objs

testbox/testcase/testparams: lkp-a04/netperf/900s-200%-TCP_STREAM

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
         7 =C2=B111%     +47.6%         10 =C2=B112%  sched_debug.cfs_rq[1]=
:/.nr_spread_over
      2830 =C2=B1 7%     +11.0%       3142 =C2=B1 2%  sched_debug.cpu#0.cur=
r->pid
    511581 =C2=B112%     +28.0%     654949 =C2=B1 4%  sched_debug.cpu#0.avg=
_idle
       309 =C2=B1 7%     +20.3%        372 =C2=B110%  sched_debug.cfs_rq[3]=
:/.blocked_load_avg
    669223 =C2=B110%     +20.7%     808043 =C2=B112%  sched_debug.cfs_rq[1]=
:/.MIN_vruntime
    669224 =C2=B110%     +20.7%     808044 =C2=B112%  sched_debug.cfs_rq[1]=
:/.max_vruntime
   1005242 =C2=B1 7%     -23.6%     767543 =C2=B117%  sched_debug.cpu#0.sch=
ed_count
    187491 =C2=B1 8%     -15.6%     158259 =C2=B110%  cpuidle.C1E-ATM.time
    476437 =C2=B1 4%     -38.5%     293130 =C2=B123%  sched_debug.cpu#0.ttw=
u_local
       507 =C2=B1 7%     -11.0%        451 =C2=B1 3%  sched_debug.cpu#2.load
    667256 =C2=B111%     +39.5%     931026 =C2=B121%  sched_debug.cpu#2.sch=
ed_count
    939243 =C2=B1 3%     -31.0%     648447 =C2=B116%  sched_debug.cpu#0.nr_=
switches
    311196 =C2=B1 2%     +39.4%     433868 =C2=B120%  sched_debug.cpu#3.ttw=
u_count
    599407 =C2=B1 4%     +38.6%     830893 =C2=B116%  sched_debug.cpu#3.sch=
ed_count
    569241 =C2=B1 0%     +38.8%     789955 =C2=B119%  sched_debug.cpu#2.nr_=
switches
     14160 =C2=B1 9%     +31.6%      18630 =C2=B1 3%  sched_debug.cpu#2.sch=
ed_goidle
      2007 =C2=B1 0%     +90.3%       3820 =C2=B1 7%  meminfo.AnonHugePages
    544571 =C2=B1 4%     -31.9%     370869 =C2=B117%  sched_debug.cpu#0.ttw=
u_count
      3536 =C2=B1 8%     -14.8%       3013 =C2=B1 6%  sched_debug.cpu#1.cur=
r->pid
     26536 =C2=B1 2%     -38.5%      16313 =C2=B1 8%  sched_debug.cpu#0.sch=
ed_goidle
     59574 =C2=B127%     -39.0%      36314 =C2=B127%  cpuidle.C2-ATM.time
    951369 =C2=B1 6%     -17.7%     782526 =C2=B118%  sched_debug.cpu#1.sch=
ed_count
       162 =C2=B130%     -43.4%         92 =C2=B123%  cpuidle.C2-ATM.usage
        10 =C2=B1 8%     +20.0%         12 =C2=B1 6%  sched_debug.cfs_rq[2]=
:/.nr_spread_over
       858 =C2=B1 3%     +10.6%        949 =C2=B1 3%  slabinfo.buffer_head.=
active_objs
       858 =C2=B1 3%     +10.6%        949 =C2=B1 3%  slabinfo.buffer_head.=
num_objs
       868 =C2=B1 4%     +16.1%       1008 =C2=B1 3%  slabinfo.kmalloc-96.a=
ctive_objs
       868 =C2=B1 4%     +16.1%       1008 =C2=B1 3%  slabinfo.kmalloc-96.n=
um_objs
   1209498 =C2=B1 1%      -6.5%    1131376 =C2=B1 1%  time.involuntary_cont=
ext_switches
      5138 =C2=B1 1%      -2.5%       5011 =C2=B1 0%  vmstat.system.cs

testbox/testcase/testparams: lkp-a04/netperf/900s-200%-TCP_MAERTS

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
    665275 =C2=B1 5%     -14.5%     569138 =C2=B1 9%  sched_debug.cpu#3.avg=
_idle
     20642 =C2=B1 6%     -56.4%       9003 =C2=B140%  sched_debug.cpu#3.sch=
ed_goidle
    195414 =C2=B1 1%     -31.4%     134127 =C2=B133%  cpuidle.C1E-ATM.time
     23091 =C2=B116%     -40.2%      13807 =C2=B130%  sched_debug.cpu#2.sch=
ed_goidle
     11208 =C2=B1 6%     +77.5%      19895 =C2=B114%  sched_debug.cpu#1.sch=
ed_goidle
      3459 =C2=B1 5%     -11.9%       3047 =C2=B1 4%  sched_debug.cpu#1.cur=
r->pid
     13303 =C2=B118%     +56.5%      20817 =C2=B126%  sched_debug.cpu#0.sch=
ed_goidle
      4409 =C2=B1 1%     -32.9%       2958 =C2=B131%  cpuidle.C1E-ATM.usage
     32560 =C2=B143%     +91.7%      62409 =C2=B1 3%  cpuidle.C4-ATM.time
        45 =C2=B125%     +92.7%         88 =C2=B117%  cpuidle.C4-ATM.usage
      3125 =C2=B1 1%     +20.9%       3779 =C2=B1 7%  sched_debug.cpu#3.cur=
r->pid
      1716 =C2=B1 3%     +10.8%       1901 =C2=B1 7%  slabinfo.kmalloc-192.=
active_objs
    306953 =C2=B1 4%     -23.3%     235502 =C2=B120%  cpuidle.C6-ATM.time
      1.97 =C2=B1 1%     +10.1%       2.17 =C2=B1 1%  perf-profile.cpu-cycl=
es.tcp_sendmsg.inet_sendmsg.sock_sendmsg.SYSC_sendto.sys_sendto

testbox/testcase/testparams: lkp-a04/netperf/300s-200%-10K-SCTP_STREAM_MANY

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
      0.90 =C2=B127%     +67.8%       1.51 =C2=B131%  sched_debug.cfs_rq[3]=
:/.spread
       395 =C2=B1 9%     +24.2%        491 =C2=B1 3%  sched_debug.cfs_rq[3]=
:/.runnable_load_avg
      2.00 =C2=B128%     -48.7%       1.03 =C2=B117%  sched_debug.cfs_rq[0]=
:/.spread
       866 =C2=B1 8%     -20.1%        692 =C2=B112%  sched_debug.cpu#2.load
    346856 =C2=B1 5%     +36.3%     472836 =C2=B113%  sched_debug.cpu#1.avg=
_idle
     76913 =C2=B119%     -30.7%      53329 =C2=B112%  sched_debug.cpu#0.sch=
ed_goidle
     87561 =C2=B133%     -44.4%      48649 =C2=B122%  meminfo.DirectMap4k
    825954 =C2=B1 2%     +14.6%     946706 =C2=B1 8%  sched_debug.cpu#1.sch=
ed_count
    327181 =C2=B1 1%      +9.7%     358887 =C2=B1 2%  sched_debug.cfs_rq[1]=
:/.min_vruntime
    335128 =C2=B1 3%      +9.1%     365583 =C2=B1 4%  sched_debug.cfs_rq[0]=
:/.min_vruntime
     77300 =C2=B137%     +50.5%     116358 =C2=B118%  sched_debug.cfs_rq[3]=
:/.MIN_vruntime
     77301 =C2=B137%     +50.5%     116359 =C2=B118%  sched_debug.cfs_rq[3]=
:/.max_vruntime
       572 =C2=B1 9%     +31.3%        751 =C2=B1 4%  sched_debug.cfs_rq[3]=
:/.load
     16994 =C2=B1 0%      -1.7%      16710 =C2=B1 1%  vmstat.system.cs

testbox/testcase/testparams: lkp-snb01/hackbench/1600%-process-pipe

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
    156776 =C2=B1 1%      +2.9%     161328 =C2=B1 0%  hackbench.throughput
2333181.35 =C2=B111%    -100.0%       0.00 =C2=B1 0%  sched_debug.cfs_rq[20=
]:/.max_vruntime
2333181.35 =C2=B111%    -100.0%       0.00 =C2=B1 0%  sched_debug.cfs_rq[20=
]:/.MIN_vruntime
      1852 =C2=B134%     -47.3%        977 =C2=B140%  numa-vmstat.node1.nr_=
inactive_anon
      7403 =C2=B134%     -46.5%       3958 =C2=B139%  numa-meminfo.node1.In=
active(anon)
      1134 =C2=B127%     +93.9%       2199 =C2=B139%  sched_debug.cfs_rq[21=
]:/.nr_spread_over
     12900 =C2=B120%     +25.5%      16194 =C2=B1 9%  numa-meminfo.node0.In=
active(anon)
      3230 =C2=B120%     +24.1%       4008 =C2=B1 8%  numa-vmstat.node0.nr_=
inactive_anon
        58 =C2=B114%     -38.1%         36 =C2=B116%  sched_debug.cpu#12.lo=
ad
        51 =C2=B1 0%     -24.7%         38 =C2=B119%  sched_debug.cpu#12.cp=
u_load[1]
        52 =C2=B1 2%     -23.7%         39 =C2=B118%  sched_debug.cpu#12.cp=
u_load[2]
        43 =C2=B1 3%     -19.4%         34 =C2=B118%  sched_debug.cfs_rq[12=
]:/.runnable_load_avg
        57 =C2=B119%     -37.6%         36 =C2=B121%  sched_debug.cpu#26.lo=
ad
        17 =C2=B113%     +81.1%         32 =C2=B124%  sched_debug.cfs_rq[4]=
:/.load
       863 =C2=B1 3%     +16.3%       1004 =C2=B1 7%  sched_debug.cfs_rq[5]=
:/.tg_load_contrib
        31 =C2=B113%     +87.2%         58 =C2=B1 9%  sched_debug.cpu#17.cp=
u_load[1]
        30 =C2=B112%     +67.0%         50 =C2=B1 9%  sched_debug.cpu#17.cp=
u_load[2]
       834 =C2=B1 8%     +22.7%       1023 =C2=B114%  sched_debug.cfs_rq[25=
]:/.blocked_load_avg
        51 =C2=B1 9%     -14.8%         44 =C2=B1 8%  sched_debug.cpu#27.cp=
u_load[1]
        52 =C2=B1 3%     -14.6%         44 =C2=B112%  sched_debug.cpu#14.cp=
u_load[2]
        51 =C2=B1 3%     -20.9%         40 =C2=B117%  sched_debug.cpu#12.cp=
u_load[3]
        53 =C2=B1 3%     -20.6%         42 =C2=B110%  sched_debug.cpu#27.cp=
u_load[4]
        49 =C2=B1 3%     -18.4%         40 =C2=B116%  sched_debug.cpu#12.cp=
u_load[4]
        43 =C2=B1 2%     -19.2%         35 =C2=B116%  sched_debug.cfs_rq[14=
]:/.runnable_load_avg
       878 =C2=B1 8%     +21.7%       1069 =C2=B112%  sched_debug.cfs_rq[25=
]:/.tg_load_contrib
        58 =C2=B114%     -31.0%         40 =C2=B114%  sched_debug.cpu#14.lo=
ad
        56 =C2=B123%     -36.1%         36 =C2=B119%  sched_debug.cfs_rq[26=
]:/.load
       825 =C2=B110%     +25.1%       1032 =C2=B110%  sched_debug.cfs_rq[4]=
:/.tg_load_contrib
        18 =C2=B1 5%    +134.5%         43 =C2=B121%  sched_debug.cfs_rq[17=
]:/.runnable_load_avg
       846 =C2=B1 3%     +15.8%        979 =C2=B1 7%  sched_debug.cfs_rq[5]=
:/.blocked_load_avg
        17 =C2=B1 9%     +45.1%         24 =C2=B126%  sched_debug.cfs_rq[0]=
:/.load
        52 =C2=B1 2%     -19.6%         42 =C2=B113%  sched_debug.cpu#27.cp=
u_load[2]
        16 =C2=B1 5%     +43.8%         23 =C2=B128%  sched_debug.cfs_rq[3]=
:/.runnable_load_avg
        54 =C2=B1 1%     -22.2%         42 =C2=B111%  sched_debug.cpu#27.cp=
u_load[3]
        50 =C2=B1 3%     -20.4%         40 =C2=B116%  sched_debug.cfs_rq[14=
]:/.load
        44 =C2=B1 2%     -21.6%         35 =C2=B116%  sched_debug.cfs_rq[11=
]:/.runnable_load_avg
     20084 =C2=B1 4%     -10.7%      17926 =C2=B1 6%  sched_debug.cpu#5.cur=
r->pid
      1013 =C2=B113%     +22.7%       1242 =C2=B110%  sched_debug.cfs_rq[7]=
:/.tg_load_contrib
        47 =C2=B121%     -32.2%         32 =C2=B122%  sched_debug.cpu#27.lo=
ad
        28 =C2=B111%     +60.5%         46 =C2=B1 9%  sched_debug.cpu#17.cp=
u_load[3]
        19 =C2=B137%     +42.1%         27 =C2=B126%  sched_debug.cpu#0.cpu=
_load[2]
        16 =C2=B1 8%     +60.4%         25 =C2=B125%  sched_debug.cpu#1.cpu=
_load[2]
  39420050 =C2=B1 4%     -12.6%   34437873 =C2=B1 5%  sched_debug.cpu#9.ttw=
u_count
        15 =C2=B1 9%     +46.7%         22 =C2=B129%  sched_debug.cfs_rq[0]=
:/.runnable_load_avg
     21495 =C2=B1 6%     -15.4%      18194 =C2=B1 5%  sched_debug.cpu#10.cu=
rr->pid
        18 =C2=B124%     +44.4%         26 =C2=B123%  sched_debug.cpu#0.cpu=
_load[3]
      1118 =C2=B1 7%     +22.3%       1367 =C2=B1 9%  sched_debug.cfs_rq[20=
]:/.blocked_load_avg
        47 =C2=B1 6%     -27.7%         34 =C2=B126%  sched_debug.cpu#25.lo=
ad
      4513 =C2=B110%     +63.0%       7356 =C2=B140%  numa-vmstat.node0.nr_=
kernel_stack
        16 =C2=B1 8%     +43.8%         23 =C2=B128%  sched_debug.cfs_rq[5]=
:/.runnable_load_avg
        37 =C2=B1 8%     -23.2%         28 =C2=B114%  sched_debug.cfs_rq[30=
]:/.runnable_load_avg
      2002 =C2=B1 4%     -92.2%        157 =C2=B1 8%  cpuidle.POLL.usage
    286004 =C2=B122%     +91.0%     546269 =C2=B129%  sched_debug.cpu#2.avg=
_idle
    266606 =C2=B1 8%     +57.9%     421009 =C2=B131%  sched_debug.cpu#3.avg=
_idle
        16 =C2=B110%     +48.0%         24 =C2=B126%  sched_debug.cpu#1.cpu=
_load[3]
     10084 =C2=B1 1%     -12.5%       8827 =C2=B1 1%  proc-vmstat.pgactivate
       993 =C2=B113%     +22.6%       1217 =C2=B110%  sched_debug.cfs_rq[7]=
:/.blocked_load_avg
  33083232 =C2=B1 2%      -6.6%   30915131 =C2=B1 4%  sched_debug.cpu#11.tt=
wu_count
        44 =C2=B1 5%     -22.4%         34 =C2=B115%  sched_debug.cfs_rq[10=
]:/.runnable_load_avg
        27 =C2=B120%     +36.6%         37 =C2=B112%  sched_debug.cpu#18.cp=
u_load[2]
   9531695 =C2=B111%     +43.5%   13678188 =C2=B128%  proc-vmstat.pgalloc_d=
ma32
        39 =C2=B1 3%     -24.8%         29 =C2=B119%  sched_debug.cfs_rq[26=
]:/.runnable_load_avg
    937152 =C2=B112%     +66.6%    1561391 =C2=B1 6%  cpuidle.C3-SNB.time
        17 =C2=B117%     +49.0%         25 =C2=B122%  sched_debug.cpu#0.cpu=
_load[4]
        16 =C2=B111%     +49.0%         24 =C2=B125%  sched_debug.cpu#5.cpu=
_load[0]
        15 =C2=B110%     +63.8%         25 =C2=B125%  sched_debug.cpu#1.cpu=
_load[1]
        17 =C2=B1 8%     +43.1%         24 =C2=B128%  sched_debug.cpu#1.cpu=
_load[4]
        46 =C2=B1 8%     -27.3%         33 =C2=B128%  sched_debug.cfs_rq[25=
]:/.load
        71 =C2=B110%     -27.1%         52 =C2=B129%  sched_debug.cpu#15.cp=
u_load[0]
     17408 =C2=B1 3%     -14.0%      14970 =C2=B1 2%  sched_debug.cpu#28.cu=
rr->pid
        41 =C2=B1 9%     -22.8%         31 =C2=B115%  sched_debug.cfs_rq[28=
]:/.runnable_load_avg
        16 =C2=B111%     +65.3%         27 =C2=B137%  sched_debug.cpu#5.cpu=
_load[1]
        45 =C2=B111%     -26.7%         33 =C2=B1 7%  sched_debug.cfs_rq[28=
]:/.load
        51 =C2=B1 5%     -23.2%         39 =C2=B119%  sched_debug.cfs_rq[10=
]:/.load
        53 =C2=B110%     -21.1%         42 =C2=B1 6%  sched_debug.cpu#10.cp=
u_load[3]
        49 =C2=B110%     +34.0%         65 =C2=B116%  sched_debug.cpu#25.cp=
u_load[0]
        45 =C2=B111%     -27.2%         33 =C2=B1 9%  sched_debug.cpu#28.lo=
ad
        54 =C2=B118%     -33.1%         36 =C2=B116%  sched_debug.cpu#9.load
        50 =C2=B1 7%     -19.7%         40 =C2=B1 9%  sched_debug.cpu#10.cp=
u_load[4]
      1153 =C2=B1 8%     +21.0%       1396 =C2=B1 9%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
        42 =C2=B1 5%     -20.5%         33 =C2=B116%  sched_debug.cfs_rq[15=
]:/.runnable_load_avg
     17980 =C2=B1 5%     -18.3%      14689 =C2=B110%  sched_debug.cpu#26.cu=
rr->pid
        15 =C2=B1 9%     +53.3%         23 =C2=B122%  sched_debug.cfs_rq[21=
]:/.load
        17 =C2=B1 8%     +56.9%         26 =C2=B138%  sched_debug.cpu#5.cpu=
_load[2]
        15 =C2=B110%     +44.7%         22 =C2=B129%  sched_debug.cpu#1.cpu=
_load[0]
         1 =C2=B1 0%    +133.3%          2 =C2=B120%  sched_debug.cfs_rq[11=
]:/.nr_spread_over
        56 =C2=B1 6%     -14.3%         48 =C2=B112%  sched_debug.cpu#15.cp=
u_load[3]
        18 =C2=B1 7%     +46.3%         26 =C2=B136%  sched_debug.cpu#5.cpu=
_load[3]
        16 =C2=B1 2%     +42.0%         23 =C2=B124%  sched_debug.cpu#3.cpu=
_load[0]
        65 =C2=B1 2%     -19.8%         52 =C2=B114%  sched_debug.cpu#15.cp=
u_load[1]
        52 =C2=B1 6%     -14.6%         45 =C2=B112%  sched_debug.cpu#15.cp=
u_load[4]
        55 =C2=B1 2%     -12.1%         48 =C2=B1 7%  sched_debug.cpu#11.lo=
ad
        18 =C2=B1 7%     +42.6%         25 =C2=B134%  sched_debug.cpu#5.cpu=
_load[4]
      0.47 =C2=B1 8%    +101.4%       0.95 =C2=B117%  perf-profile.cpu-cycl=
es._raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_func=
tion.__wake_up_common
        15 =C2=B110%     +44.7%         22 =C2=B129%  sched_debug.cfs_rq[1]=
:/.runnable_load_avg
        50 =C2=B1 6%     -21.1%         40 =C2=B117%  sched_debug.cpu#10.lo=
ad
        26 =C2=B1 9%     +57.5%         42 =C2=B110%  sched_debug.cpu#17.cp=
u_load[4]
        60 =C2=B1 3%     -14.9%         51 =C2=B1 8%  sched_debug.cpu#15.cp=
u_load[2]
      1170 =C2=B1 7%     -21.7%        916 =C2=B121%  sched_debug.cfs_rq[28=
]:/.blocked_load_avg
        18 =C2=B112%     +88.9%         34 =C2=B143%  sched_debug.cpu#6.load
        18 =C2=B110%     +34.5%         24 =C2=B121%  sched_debug.cpu#3.cpu=
_load[3]
        25 =C2=B1 9%     +34.7%         33 =C2=B119%  sched_debug.cpu#18.cp=
u_load[4]
      1216 =C2=B1 7%     -21.8%        950 =C2=B120%  sched_debug.cfs_rq[28=
]:/.tg_load_contrib
        26 =C2=B112%     +35.4%         35 =C2=B114%  sched_debug.cpu#18.cp=
u_load[3]
  48104532 =C2=B111%     +45.0%   69756781 =C2=B128%  numa-numastat.node0.l=
ocal_node
  48104551 =C2=B111%     +45.0%   69758195 =C2=B128%  numa-numastat.node0.n=
uma_hit
        20 =C2=B133%     +54.1%         31 =C2=B122%  sched_debug.cpu#6.cpu=
_load[1]
       808 =C2=B110%     +24.6%       1007 =C2=B112%  sched_debug.cfs_rq[4]=
:/.blocked_load_avg
        48 =C2=B1 2%     -14.4%         41 =C2=B1 9%  sched_debug.cpu#8.cpu=
_load[4]
        14 =C2=B117%     +51.2%         21 =C2=B127%  sched_debug.cfs_rq[16=
]:/.runnable_load_avg
        27 =C2=B126%    +165.9%         72 =C2=B116%  sched_debug.cpu#17.cp=
u_load[0]
      3.41 =C2=B1 0%     +12.9%       3.85 =C2=B1 2%  turbostat.%c7
     15630 =C2=B1 2%     -18.4%      12759 =C2=B123%  numa-vmstat.node1.nr_=
kernel_stack
    267232 =C2=B1 8%    +105.7%     549732 =C2=B137%  sched_debug.cpu#6.avg=
_idle
    247641 =C2=B118%     +56.4%     387298 =C2=B122%  sched_debug.cpu#5.avg=
_idle
 1.685e+08 =C2=B1 6%     -14.4%  1.442e+08 =C2=B1 4%  cpuidle.C1-SNB.time
      0.79 =C2=B1 4%     +54.4%       1.22 =C2=B113%  perf-profile.cpu-cycl=
es._raw_spin_lock_irqsave.__wake_up_sync_key.pipe_write.do_sync_write.vfs_w=
rite
        18 =C2=B1 6%     +34.5%         24 =C2=B124%  sched_debug.cpu#3.cpu=
_load[4]
        44 =C2=B1 4%     -16.7%         36 =C2=B1 9%  sched_debug.cfs_rq[8]=
:/.runnable_load_avg
        47 =C2=B1 4%     -14.0%         41 =C2=B1 8%  sched_debug.cpu#9.cpu=
_load[4]
      0.98 =C2=B1 3%     -43.9%       0.55 =C2=B133%  perf-profile.cpu-cycl=
es.llist_add_batch.try_to_wake_up.default_wake_function.autoremove_wake_fun=
ction.__wake_up_common
        45 =C2=B1 3%     -22.8%         35 =C2=B112%  sched_debug.cfs_rq[9]=
:/.runnable_load_avg
        19 =C2=B120%     +50.0%         29 =C2=B125%  sched_debug.cpu#6.cpu=
_load[2]
    270052 =C2=B119%    +109.1%     564602 =C2=B140%  sched_debug.cpu#7.avg=
_idle
        16 =C2=B110%     +50.0%         25 =C2=B124%  sched_debug.cfs_rq[6]=
:/.runnable_load_avg
        18 =C2=B113%     +42.9%         26 =C2=B122%  sched_debug.cfs_rq[6]=
:/.load
      1.27 =C2=B1 3%     -43.5%       0.72 =C2=B135%  perf-profile.cpu-cycl=
es.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu=
_pending
        79 =C2=B113%     +50.6%        119 =C2=B134%  sched_debug.cpu#0.nr_=
running
    316918 =C2=B122%     +46.5%     464434 =C2=B119%  sched_debug.cpu#18.av=
g_idle
        17 =C2=B110%     +48.1%         25 =C2=B117%  sched_debug.cpu#3.cpu=
_load[1]
       284 =C2=B1 5%     -29.3%        200 =C2=B123%  sched_debug.cpu#11.nr=
_running
       271 =C2=B1 5%     -30.1%        189 =C2=B119%  sched_debug.cpu#15.nr=
_running
        51 =C2=B123%     -38.7%         31 =C2=B1 6%  sched_debug.cfs_rq[31=
]:/.load
        51 =C2=B122%     -38.6%         31 =C2=B113%  sched_debug.cpu#31.lo=
ad
    274345 =C2=B1 8%     +44.0%     395193 =C2=B118%  sched_debug.cpu#19.av=
g_idle
        19 =C2=B110%     +39.7%         27 =C2=B126%  sched_debug.cpu#6.cpu=
_load[4]
       232 =C2=B1 9%     -22.6%        180 =C2=B120%  sched_debug.cpu#31.nr=
_running
       362 =C2=B1 8%     +35.3%        490 =C2=B1 6%  slabinfo.kmem_cache.a=
ctive_objs
       362 =C2=B1 8%     +35.3%        490 =C2=B1 6%  slabinfo.kmem_cache.n=
um_objs
       230 =C2=B1 5%     -23.8%        175 =C2=B119%  sched_debug.cpu#28.nr=
_running
     16860 =C2=B1 1%     -21.6%      13224 =C2=B1 8%  sched_debug.cpu#23.cu=
rr->pid
        19 =C2=B112%     +42.4%         28 =C2=B125%  sched_debug.cpu#6.cpu=
_load[3]
    297114 =C2=B1 8%     +44.6%     429601 =C2=B116%  sched_debug.cpu#16.av=
g_idle
       673 =C2=B1 7%     -21.3%        530 =C2=B110%  slabinfo.blkdev_reque=
sts.active_objs
       673 =C2=B1 7%     -21.3%        530 =C2=B110%  slabinfo.blkdev_reque=
sts.num_objs
       277 =C2=B1 6%     -32.1%        188 =C2=B121%  sched_debug.cpu#10.nr=
_running
       362 =C2=B134%     -43.9%        203 =C2=B119%  sched_debug.cpu#13.nr=
_running
       249 =C2=B1 3%     -34.7%        162 =C2=B122%  sched_debug.cpu#25.nr=
_running
        18 =C2=B112%     +40.7%         25 =C2=B118%  sched_debug.cpu#3.cpu=
_load[2]
       236 =C2=B1 5%     -26.1%        174 =C2=B124%  sched_debug.cpu#27.nr=
_running
       234 =C2=B1 7%     -25.0%        176 =C2=B122%  sched_debug.cpu#24.nr=
_running
        51 =C2=B116%     -42.5%         29 =C2=B117%  sched_debug.cpu#29.lo=
ad
      1.00 =C2=B1 4%     -36.0%       0.64 =C2=B129%  perf-profile.cpu-cycl=
es.mutex_lock.pipe_wait.pipe_read.do_sync_read.vfs_read
    882415 =C2=B114%     -27.3%     641860 =C2=B121%  sched_debug.cpu#9.avg=
_idle
      1.93 =C2=B1 5%     -34.0%       1.28 =C2=B124%  perf-profile.cpu-cycl=
es.effective_load.isra.38.select_task_rq_fair.try_to_wake_up.default_wake_f=
unction.autoremove_wake_function
      2.21 =C2=B1 5%     -11.3%       1.96 =C2=B1 4%  turbostat.%c1
        60 =C2=B116%     -34.8%         39 =C2=B118%  sched_debug.cfs_rq[11=
]:/.load
        57 =C2=B114%     -32.2%         38 =C2=B117%  sched_debug.cfs_rq[13=
]:/.load
       281 =C2=B1 1%     -31.4%        192 =C2=B118%  sched_debug.cpu#12.nr=
_running
      3.91 =C2=B1 3%     -30.0%       2.73 =C2=B120%  perf-profile.cpu-cycl=
es.idle_cpu.select_task_rq_fair.try_to_wake_up.default_wake_function.autore=
move_wake_function
    101299 =C2=B1 2%     -17.5%      83592 =C2=B120%  numa-vmstat.node1.nr_=
slab_unreclaimable
       471 =C2=B1 6%     +27.1%        599 =C2=B1 5%  slabinfo.kmem_cache_n=
ode.active_objs
       742 =C2=B1 7%     -20.8%        588 =C2=B110%  slabinfo.xfs_buf.num_=
objs
       742 =C2=B1 7%     -20.8%        588 =C2=B110%  slabinfo.xfs_buf.acti=
ve_objs
       280 =C2=B1 7%     -26.4%        206 =C2=B120%  sched_debug.cpu#14.nr=
_running
       490 =C2=B1 6%     +26.1%        618 =C2=B1 4%  slabinfo.kmem_cache_n=
ode.num_objs
       235 =C2=B1 6%     -27.4%        171 =C2=B121%  sched_debug.cpu#26.nr=
_running
        64 =C2=B1 7%     +58.8%        102 =C2=B138%  sched_debug.cpu#23.nr=
_running
     17597 =C2=B1 5%     -21.9%      13742 =C2=B1 5%  sched_debug.cpu#29.cu=
rr->pid
      1.53 =C2=B1 3%     +36.5%       2.09 =C2=B115%  perf-profile.cpu-cycl=
es.copy_user_generic_string.pipe_write.do_sync_write.vfs_write.sys_write
        43 =C2=B1 9%     -31.0%         29 =C2=B120%  sched_debug.cfs_rq[29=
]:/.load
      0.79 =C2=B1 5%     +34.2%       1.06 =C2=B112%  perf-profile.cpu-cycl=
es.vfs_read.sys_read.system_call_fastpath.__read_nocancel
      1.61 =C2=B1 2%     -33.3%       1.08 =C2=B123%  perf-profile.cpu-cycl=
es.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_=
common.__wake_up_sync_key
        39 =C2=B1 5%     -29.9%         27 =C2=B122%  sched_debug.cfs_rq[29=
]:/.runnable_load_avg
      0.77 =C2=B1 8%     +28.3%       0.98 =C2=B113%  perf-profile.cpu-cycl=
es.selinux_file_permission.security_file_permission.rw_verify_area.vfs_read=
.sys_read
        48 =C2=B120%     -34.9%         31 =C2=B114%  sched_debug.cfs_rq[24=
]:/.runnable_load_avg
    155404 =C2=B1 0%     +18.9%     184780 =C2=B1 0%  softirqs.SCHED
      3.37 =C2=B1 1%     -20.6%       2.68 =C2=B1 6%  perf-profile.cpu-cycl=
es.mutex_unlock.do_sync_write.vfs_write.sys_write.system_call_fastpath
      0.71 =C2=B110%     +41.3%       1.00 =C2=B118%  perf-profile.cpu-cycl=
es.selinux_file_permission.security_file_permission.rw_verify_area.vfs_writ=
e.sys_write
       288 =C2=B1 7%     -27.1%        210 =C2=B119%  sched_debug.cpu#8.nr_=
running
      1.03 =C2=B1 8%     -32.0%       0.70 =C2=B124%  perf-profile.cpu-cycl=
es._raw_spin_unlock_irqrestore.try_to_wake_up.default_wake_function.autorem=
ove_wake_function.__wake_up_common
      0.95 =C2=B1 5%     +34.3%       1.28 =C2=B115%  perf-profile.cpu-cycl=
es._raw_spin_unlock_irqrestore.__wake_up_sync_key.pipe_write.do_sync_write.=
vfs_write
    829183 =C2=B118%     -23.4%     635360 =C2=B112%  sched_debug.cpu#24.av=
g_idle
     33066 =C2=B1 7%     +50.4%      49736 =C2=B135%  numa-vmstat.node0.nr_=
slab_unreclaimable
        50 =C2=B1 6%     -19.2%         40 =C2=B113%  sched_debug.cpu#31.cp=
u_load[2]
       233 =C2=B1 6%     -24.5%        176 =C2=B121%  sched_debug.cpu#29.nr=
_running
       245 =C2=B1 6%     -24.7%        185 =C2=B120%  sched_debug.cpu#9.nr_=
running
        49 =C2=B1 4%     -18.1%         40 =C2=B113%  sched_debug.cpu#31.cp=
u_load[3]
     18064 =C2=B1 1%     -21.3%      14220 =C2=B1 4%  sched_debug.cpu#31.cu=
rr->pid
        39 =C2=B111%     -27.4%         28 =C2=B115%  sched_debug.cfs_rq[31=
]:/.runnable_load_avg
        44 =C2=B1 5%     -19.4%         36 =C2=B114%  sched_debug.cfs_rq[13=
]:/.runnable_load_avg
      0.98 =C2=B1 2%     -20.7%       0.78 =C2=B112%  perf-profile.cpu-cycl=
es.__wake_up_common.__wake_up_sync_key.pipe_write.do_sync_write.vfs_write
     49911 =C2=B1 8%     +32.5%      66126 =C2=B127%  numa-vmstat.node0.nr_=
page_table_pages
      0.91 =C2=B1 6%     +30.9%       1.19 =C2=B113%  perf-profile.cpu-cycl=
es.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath
      0.85 =C2=B1 7%     +24.4%       1.05 =C2=B114%  perf-profile.cpu-cycl=
es.__sb_start_write.pipe_write.do_sync_write.vfs_write.sys_write
      4.09 =C2=B1 1%     -25.4%       3.05 =C2=B117%  perf-profile.cpu-cycl=
es.__schedule.schedule.pipe_wait.pipe_read.do_sync_read
      1.24 =C2=B1 2%     +22.5%       1.52 =C2=B111%  perf-profile.cpu-cycl=
es.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.securi=
ty_file_permission
        45 =C2=B127%     -35.0%         29 =C2=B118%  sched_debug.cpu#30.lo=
ad
    697427 =C2=B1 2%     -22.7%     539034 =C2=B120%  sched_debug.cpu#29.av=
g_idle
      1.59 =C2=B110%     +31.9%       2.09 =C2=B115%  perf-profile.cpu-cycl=
es.pipe_write.do_sync_write.vfs_write.sys_write.system_call_fastpath
      0.75 =C2=B110%     +31.9%       0.99 =C2=B113%  perf-profile.cpu-cycl=
es.__fget_light.sys_write.system_call_fastpath.__write_nocancel
      0.78 =C2=B1 4%     +29.1%       1.01 =C2=B116%  perf-profile.cpu-cycl=
es.__srcu_read_unlock.fsnotify.vfs_write.sys_write.system_call_fastpath
        49 =C2=B1 3%     -16.9%         41 =C2=B115%  sched_debug.cpu#31.cp=
u_load[4]
      0.65 =C2=B1 7%     +33.0%       0.86 =C2=B115%  perf-profile.cpu-cycl=
es.__sb_end_write.pipe_write.do_sync_write.vfs_write.sys_write
      0.69 =C2=B1 1%     +23.1%       0.85 =C2=B113%  perf-profile.cpu-cycl=
es.__write_nocancel
      1.06 =C2=B1 3%     -19.8%       0.85 =C2=B115%  perf-profile.cpu-cycl=
es.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_acti=
vate
     41260 =C2=B1 4%      -4.9%      39232 =C2=B1 5%  sched_debug.cfs_rq[17=
]:/.tg_load_avg
      1106 =C2=B112%     -11.2%        982 =C2=B1 5%  numa-meminfo.node1.Un=
evictable
      1103 =C2=B112%     -11.2%        979 =C2=B1 5%  numa-meminfo.node1.Ml=
ocked
       228 =C2=B1 6%     -21.4%        179 =C2=B121%  sched_debug.cpu#30.nr=
_running
      2.41 =C2=B1 2%     +18.0%       2.84 =C2=B110%  perf-profile.cpu-cycl=
es.copy_user_generic_string.pipe_read.do_sync_read.vfs_read.sys_read
      9444 =C2=B1 3%      -6.5%       8831 =C2=B1 5%  slabinfo.proc_inode_c=
ache.active_objs
 1.928e+09 =C2=B1 0%      -2.6%  1.878e+09 =C2=B1 0%  time.voluntary_contex=
t_switches
  18293607 =C2=B1 1%      +3.6%   18950807 =C2=B1 0%  time.minor_page_faults
   4628480 =C2=B1 1%      -1.9%    4541031 =C2=B1 0%  vmstat.system.cs
   1057268 =C2=B1 0%      -4.4%    1010922 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-snb01/hackbench/1600%-process-socket

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
    136352 =C2=B1 1%      +5.3%     143641 =C2=B1 0%  hackbench.throughput
      3768 =C2=B112%     -27.4%       2735 =C2=B1 5%  sched_debug.cfs_rq[27=
]:/.blocked_load_avg
        29 =C2=B126%     +51.7%         45 =C2=B111%  sched_debug.cpu#24.cp=
u_load[3]
      2752 =C2=B122%     -48.4%       1418 =C2=B137%  sched_debug.cfs_rq[14=
]:/.tg_load_contrib
     18318 =C2=B1 9%     -15.1%      15561 =C2=B1 1%  sched_debug.cpu#25.cu=
rr->pid
        25 =C2=B135%    +101.3%         51 =C2=B132%  sched_debug.cpu#2.cpu=
_load[1]
        27 =C2=B132%     +53.0%         42 =C2=B120%  sched_debug.cpu#2.cpu=
_load[2]
      1196 =C2=B144%     +92.2%       2299 =C2=B130%  sched_debug.cfs_rq[2]=
:/.blocked_load_avg
      3822 =C2=B111%     -27.4%       2777 =C2=B1 5%  sched_debug.cfs_rq[27=
]:/.tg_load_contrib
        17 =C2=B142%     -55.8%          7 =C2=B149%  sched_debug.cpu#0.cpu=
_load[2]
        62 =C2=B142%     -50.3%         31 =C2=B117%  sched_debug.cpu#10.cp=
u_load[0]
        18 =C2=B145%     -58.2%          7 =C2=B149%  sched_debug.cpu#0.cpu=
_load[3]
      2980 =C2=B115%     -56.5%       1296 =C2=B130%  sched_debug.cfs_rq[6]=
:/.tg_load_contrib
      3104 =C2=B126%     -40.9%       1834 =C2=B116%  sched_debug.cfs_rq[20=
]:/.blocked_load_avg
     14604 =C2=B121%     +25.8%      18369 =C2=B1 9%  sched_debug.cpu#21.cu=
rr->pid
    604711 =C2=B126%     +81.6%    1098097 =C2=B119%  sched_debug.cpu#2.avg=
_idle
      1223 =C2=B143%     +94.5%       2379 =C2=B129%  sched_debug.cfs_rq[2]=
:/.tg_load_contrib
        14 =C2=B140%     -46.5%          7 =C2=B149%  sched_debug.cpu#0.cpu=
_load[1]
      2901 =C2=B115%     -57.6%       1230 =C2=B132%  sched_debug.cfs_rq[6]=
:/.blocked_load_avg
     22133 =C2=B1 1%     -26.0%      16387 =C2=B120%  sched_debug.cpu#11.cu=
rr->pid
   1774944 =C2=B1 7%     -25.7%    1319004 =C2=B116%  cpuidle.C3-SNB.time
        17 =C2=B142%     -55.8%          7 =C2=B149%  sched_debug.cpu#0.cpu=
_load[4]
        32 =C2=B116%    +319.6%        135 =C2=B128%  sched_debug.cpu#9.load
      3173 =C2=B126%     -40.7%       1880 =C2=B115%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
        29 =C2=B148%     +90.8%         55 =C2=B1 9%  sched_debug.cpu#5.cpu=
_load[2]
    122294 =C2=B1 3%     +14.2%     139679 =C2=B1 4%  numa-vmstat.node1.nr_=
active_anon
      2719 =C2=B122%     -49.1%       1385 =C2=B138%  sched_debug.cfs_rq[14=
]:/.blocked_load_avg
        26 =C2=B136%     +68.4%         44 =C2=B128%  sched_debug.cfs_rq[20=
]:/.runnable_load_avg
         2 =C2=B140%    +133.3%          4 =C2=B136%  sched_debug.cfs_rq[29=
]:/.nr_spread_over
        28 =C2=B140%     +71.4%         48 =C2=B1 6%  sched_debug.cpu#5.cpu=
_load[3]
        22 =C2=B124%    +126.9%         50 =C2=B144%  sched_debug.cfs_rq[24=
]:/.load
        27 =C2=B134%     +55.6%         42 =C2=B110%  sched_debug.cpu#5.cpu=
_load[4]
        57 =C2=B116%     -23.3%         44 =C2=B1 6%  sched_debug.cpu#15.cp=
u_load[2]
      3698 =C2=B117%     -44.1%       2066 =C2=B136%  sched_debug.cfs_rq[8]=
:/.blocked_load_avg
      3736 =C2=B117%     -43.0%       2131 =C2=B135%  sched_debug.cfs_rq[8]=
:/.tg_load_contrib
      1137 =C2=B121%     -38.1%        704 =C2=B1 1%  slabinfo.kmalloc-192.=
num_slabs
      1137 =C2=B121%     -38.1%        704 =C2=B1 1%  slabinfo.kmalloc-192.=
active_slabs
        26 =C2=B144%     +72.5%         46 =C2=B130%  sched_debug.cpu#24.cp=
u_load[1]
    585607 =C2=B137%     +66.8%     976862 =C2=B117%  sched_debug.cpu#1.avg=
_idle
     34949 =C2=B126%     -45.1%      19186 =C2=B1 1%  slabinfo.task_struct.=
active_objs
     34958 =C2=B126%     -45.1%      19205 =C2=B1 1%  slabinfo.task_struct.=
num_objs
      8739 =C2=B126%     -45.1%       4801 =C2=B1 1%  slabinfo.task_struct.=
num_slabs
      8739 =C2=B126%     -45.1%       4801 =C2=B1 1%  slabinfo.task_struct.=
active_slabs
 1.755e+08 =C2=B1 1%     -38.7%  1.077e+08 =C2=B114%  cpuidle.C1E-SNB.time
     17413 =C2=B1 9%     +20.3%      20940 =C2=B1 2%  sched_debug.cpu#1.cur=
r->pid
      1215 =C2=B125%     -42.3%        701 =C2=B1 0%  slabinfo.signal_cache=
.num_slabs
      1215 =C2=B125%     -42.3%        701 =C2=B1 0%  slabinfo.signal_cache=
.active_slabs
     36961 =C2=B125%     -40.4%      22031 =C2=B1 2%  slabinfo.task_xstate.=
active_objs
       948 =C2=B125%     -40.3%        566 =C2=B1 2%  slabinfo.task_xstate.=
active_slabs
       948 =C2=B125%     -40.3%        566 =C2=B1 2%  slabinfo.task_xstate.=
num_slabs
     36988 =C2=B125%     -40.2%      22106 =C2=B1 2%  slabinfo.task_xstate.=
num_objs
     67514 =C2=B116%     -19.2%      54578 =C2=B1 5%  numa-vmstat.node0.nr_=
active_anon
        28 =C2=B142%     +57.1%         44 =C2=B114%  sched_debug.cpu#24.cp=
u_load[2]
     40258 =C2=B124%     -32.2%      27293 =C2=B110%  slabinfo.kmalloc-128.=
active_objs
       629 =C2=B124%     -31.9%        428 =C2=B110%  slabinfo.kmalloc-128.=
active_slabs
       629 =C2=B124%     -31.9%        428 =C2=B110%  slabinfo.kmalloc-128.=
num_slabs
     40288 =C2=B124%     -31.9%      27449 =C2=B110%  slabinfo.kmalloc-128.=
num_objs
        65 =C2=B148%     -63.6%         23 =C2=B149%  sched_debug.cpu#22.cp=
u_load[0]
     38175 =C2=B112%     -57.3%      16317 =C2=B1 4%  numa-vmstat.node1.nr_=
kernel_stack
        31 =C2=B111%     +41.5%         44 =C2=B114%  sched_debug.cpu#24.cp=
u_load[4]
    894920 =C2=B137%     +52.0%    1360209 =C2=B113%  sched_debug.cpu#5.avg=
_idle
 3.965e+08 =C2=B110%     -44.7%  2.194e+08 =C2=B110%  cpuidle.C1-SNB.time
        28 =C2=B1 5%     +57.0%         45 =C2=B116%  sched_debug.cpu#9.cpu=
_load[0]
    213890 =C2=B128%     -44.9%     117926 =C2=B114%  numa-meminfo.node1.Ke=
rnelStack
     93234 =C2=B118%     +79.4%     167249 =C2=B118%  slabinfo.kmalloc-512.=
active_objs
        30 =C2=B138%     +50.0%         46 =C2=B111%  sched_debug.cpu#7.cpu=
_load[2]
     36480 =C2=B125%     -42.3%      21059 =C2=B1 0%  slabinfo.signal_cache=
.num_objs
     36396 =C2=B125%     -42.3%      20991 =C2=B1 0%  slabinfo.signal_cache=
.active_objs
   2477866 =C2=B123%     -42.3%    1429384 =C2=B125%  sched_debug.cpu#23.av=
g_idle
        20 =C2=B122%     +50.0%         31 =C2=B113%  sched_debug.cpu#11.nr=
_running
        18 =C2=B1 7%     +38.9%         25 =C2=B1 3%  sched_debug.cpu#15.nr=
_running
        15 =C2=B129%     +41.3%         21 =C2=B1 5%  sched_debug.cpu#31.nr=
_running
       298 =C2=B110%     +50.0%        448 =C2=B111%  slabinfo.kmem_cache.a=
ctive_objs
       298 =C2=B110%     +50.0%        448 =C2=B111%  slabinfo.kmem_cache.n=
um_objs
 5.746e+08 =C2=B115%     +49.7%  8.602e+08 =C2=B1 7%  cpuidle.C7-SNB.time
        29 =C2=B142%     +79.3%         52 =C2=B128%  sched_debug.cpu#7.cpu=
_load[1]
     47797 =C2=B121%     -38.1%      29598 =C2=B1 1%  slabinfo.kmalloc-192.=
num_objs
     14154 =C2=B142%     +45.2%      20558 =C2=B1 3%  sched_debug.cpu#3.cur=
r->pid
        14 =C2=B126%     +59.5%         22 =C2=B128%  sched_debug.cpu#19.nr=
_running
     15030 =C2=B111%     +42.4%      21408 =C2=B1 2%  sched_debug.cpu#18.cu=
rr->pid
    121150 =C2=B1 3%     +13.8%     137836 =C2=B1 4%  numa-vmstat.node1.nr_=
anon_pages
        18 =C2=B125%     +33.3%         24 =C2=B1 9%  sched_debug.cpu#27.nr=
_running
        17 =C2=B114%     +46.2%         25 =C2=B111%  sched_debug.cpu#24.nr=
_running
        20 =C2=B110%     +23.0%         25 =C2=B113%  sched_debug.cpu#20.nr=
_running
    148903 =C2=B1 4%     +26.4%     188145 =C2=B1 9%  cpuidle.C7-SNB.usage
    253536 =C2=B119%     +52.7%     387249 =C2=B1 9%  slabinfo.kmalloc-512.=
num_objs
      3961 =C2=B119%     +52.7%       6050 =C2=B1 9%  slabinfo.kmalloc-512.=
num_slabs
      3961 =C2=B119%     +52.7%       6050 =C2=B1 9%  slabinfo.kmalloc-512.=
active_slabs
        17 =C2=B129%     +57.7%         27 =C2=B1 1%  sched_debug.cpu#7.nr_=
running
    207838 =C2=B111%     -37.8%     129252 =C2=B1 4%  numa-vmstat.node1.nr_=
slab_unreclaimable
       407 =C2=B1 7%     +36.6%        557 =C2=B1 9%  slabinfo.kmem_cache_n=
ode.active_objs
        32 =C2=B145%     +60.2%         52 =C2=B1 5%  sched_debug.cpu#31.cp=
u_load[1]
       426 =C2=B1 7%     +35.0%        576 =C2=B1 9%  slabinfo.kmem_cache_n=
ode.num_objs
     47738 =C2=B121%     -38.2%      29494 =C2=B1 1%  slabinfo.kmalloc-192.=
active_objs
   1956305 =C2=B1 7%     -15.0%    1661919 =C2=B1 8%  sched_debug.cpu#20.av=
g_idle
     75011 =C2=B112%     -19.6%      60311 =C2=B1 1%  slabinfo.kernfs_node_=
cache.active_objs
     75036 =C2=B112%     -19.6%      60361 =C2=B1 1%  slabinfo.kernfs_node_=
cache.num_objs
      2084 =C2=B113%     -19.6%       1676 =C2=B1 1%  slabinfo.kernfs_node_=
cache.active_slabs
      2084 =C2=B113%     -19.6%       1676 =C2=B1 1%  slabinfo.kernfs_node_=
cache.num_slabs
   4049841 =C2=B1 2%     +32.0%    5343918 =C2=B114%  cpuidle.C1-SNB.usage
    293311 =C2=B1 3%     +12.1%     328716 =C2=B1 1%  softirqs.SCHED
    683095 =C2=B115%     -31.3%     469359 =C2=B115%  numa-meminfo.node1.SU=
nreclaim
    129912 =C2=B121%     +49.2%     193826 =C2=B1 9%  slabinfo.kmalloc-256.=
active_objs
    719915 =C2=B115%     -29.8%     505238 =C2=B114%  numa-meminfo.node1.Sl=
ab
     94716 =C2=B114%     -19.5%      76235 =C2=B119%  sched_debug.cfs_rq[22=
]:/.tg_load_avg
      4553 =C2=B120%     +39.9%       6370 =C2=B1 8%  slabinfo.kmalloc-256.=
active_slabs
      4553 =C2=B120%     +39.9%       6370 =C2=B1 8%  slabinfo.kmalloc-256.=
num_slabs
     66028 =C2=B114%     -17.7%      54316 =C2=B1 5%  numa-vmstat.node0.nr_=
anon_pages
     81070 =C2=B1 4%     -17.4%      66948 =C2=B111%  sched_debug.cfs_rq[5]=
:/.tg_load_avg
    291472 =C2=B120%     +39.9%     407746 =C2=B1 8%  slabinfo.kmalloc-256.=
num_objs
     71814 =C2=B110%     -17.8%      59021 =C2=B110%  sched_debug.cfs_rq[3]=
:/.tg_load_avg
     78608 =C2=B1 2%     -15.3%      66578 =C2=B111%  sched_debug.cfs_rq[4]=
:/.tg_load_avg
    757843 =C2=B1 9%      +9.1%     827114 =C2=B1 5%  meminfo.AnonPages

testbox/testcase/testparams: lkp-sb03/nepim/300s-100%-udp6

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
   -327409 =C2=B1 0%      +1.3%    -331788 =C2=B1 0%  sched_debug.cfs_rq[20=
]:/.spread0
      1651 =C2=B123%     -81.4%        308 =C2=B115%  sched_debug.cpu#5.ttw=
u_local
      1977 =C2=B121%     -86.5%        266 =C2=B113%  sched_debug.cpu#7.ttw=
u_local
      2233 =C2=B135%     -75.3%        551 =C2=B121%  sched_debug.cpu#12.tt=
wu_local
        -2 =C2=B1-20%    +136.1%         -5 =C2=B1-16%  sched_debug.cpu#9.n=
r_uninterruptible
      2279 =C2=B111%     -83.8%        368 =C2=B1 5%  sched_debug.cpu#4.ttw=
u_local
      1253 =C2=B128%     -73.0%        338 =C2=B1 4%  sched_debug.cpu#6.ttw=
u_local
      3305 =C2=B119%     -81.3%        616 =C2=B134%  sched_debug.cpu#10.tt=
wu_local
      4201 =C2=B127%     -68.6%       1319 =C2=B1 7%  sched_debug.cpu#12.tt=
wu_count
      4965 =C2=B140%     -70.6%       1461 =C2=B140%  sched_debug.cpu#15.tt=
wu_count
   -294566 =C2=B1-14%     +13.0%    -332791 =C2=B1 0%  sched_debug.cfs_rq[8=
]:/.spread0
      3498 =C2=B124%     -75.9%        844 =C2=B1 5%  sched_debug.cpu#5.ttw=
u_count
      2721 =C2=B126%     -89.2%        293 =C2=B118%  sched_debug.cpu#1.ttw=
u_local
      3949 =C2=B133%     -78.7%        842 =C2=B113%  sched_debug.cpu#7.ttw=
u_count
      2237 =C2=B140%     -80.0%        447 =C2=B144%  sched_debug.cpu#8.ttw=
u_local
      4376 =C2=B1 9%     -75.7%       1063 =C2=B1 5%  sched_debug.cpu#4.ttw=
u_count
       336 =C2=B140%     -38.3%        207 =C2=B119%  sched_debug.cfs_rq[27=
]:/.exec_clock
     11571 =C2=B126%     -54.2%       5295 =C2=B118%  sched_debug.cpu#15.nr=
_switches
        39 =C2=B1 7%     +41.4%         56 =C2=B1 6%  sched_debug.cpu#23.tt=
wu_local
      5760 =C2=B126%     -54.8%       2603 =C2=B118%  sched_debug.cpu#15.sc=
hed_goidle
      3848 =C2=B138%     -73.8%       1007 =C2=B143%  sched_debug.cpu#8.ttw=
u_count
      2663 =C2=B124%     -57.5%       1133 =C2=B138%  sched_debug.cpu#6.ttw=
u_count
      3354 =C2=B123%     -68.6%       1054 =C2=B1 8%  sched_debug.cpu#11.tt=
wu_local
       292 =C2=B143%     +99.5%        582 =C2=B123%  sched_debug.cpu#23.sc=
hed_goidle
      6044 =C2=B140%     +65.4%       9999 =C2=B124%  sched_debug.cfs_rq[5]=
:/.min_vruntime
      5173 =C2=B126%     -49.5%       2610 =C2=B123%  sched_debug.cpu#10.sc=
hed_goidle
      5064 =C2=B124%     -69.1%       1562 =C2=B127%  sched_debug.cpu#1.ttw=
u_count
     13939 =C2=B117%     -60.7%       5484 =C2=B121%  sched_debug.cpu#10.nr=
_switches
      8052 =C2=B121%     -48.1%       4181 =C2=B130%  sched_debug.cpu#8.nr_=
switches
      6978 =C2=B111%     -33.3%       4656 =C2=B1 9%  sched_debug.cpu#6.nr_=
switches
      4072 =C2=B1 9%     -43.6%       2296 =C2=B1 7%  sched_debug.cpu#5.sch=
ed_goidle
      6458 =C2=B114%     -37.9%       4008 =C2=B1 5%  sched_debug.cpu#12.sc=
hed_goidle
     11124 =C2=B1 5%     -19.5%       8960 =C2=B1 6%  sched_debug.cpu#3.sch=
ed_goidle
     90.84 =C2=B1 4%     +95.6%     177.72 =C2=B147%  sched_debug.cfs_rq[30=
]:/.exec_clock
       605 =C2=B141%     +99.8%       1210 =C2=B122%  sched_debug.cpu#23.nr=
_switches
      3465 =C2=B111%     -34.0%       2286 =C2=B110%  sched_debug.cpu#6.sch=
ed_goidle
      8984 =C2=B114%     -30.0%       6290 =C2=B126%  sched_debug.cpu#13.nr=
_switches
      3925 =C2=B121%     -47.5%       2060 =C2=B130%  sched_debug.cpu#8.sch=
ed_goidle
      7184 =C2=B115%     -40.3%       4290 =C2=B1 7%  sched_debug.cpu#11.tt=
wu_count
       886 =C2=B1 4%     +17.7%       1043 =C2=B1 9%  sched_debug.cpu#11.cu=
rr->pid
    423855 =C2=B149%    +139.1%    1013399 =C2=B119%  cpuidle.C3-SNB.time
      8204 =C2=B1 9%     -42.9%       4688 =C2=B1 8%  sched_debug.cpu#5.nr_=
switches
     10570 =C2=B124%     +42.3%      15043 =C2=B1 5%  sched_debug.cfs_rq[3]=
:/.min_vruntime
      4455 =C2=B114%     -30.5%       3094 =C2=B126%  sched_debug.cpu#13.sc=
hed_goidle
      6062 =C2=B1 3%     -37.4%       3796 =C2=B1 8%  sched_debug.cpu#4.sch=
ed_goidle
     12202 =C2=B1 3%     -37.0%       7686 =C2=B1 8%  sched_debug.cpu#4.nr_=
switches
     23602 =C2=B1 9%     -24.6%      17787 =C2=B1 7%  sched_debug.cpu#11.nr=
_switches
      1614 =C2=B1 4%     +27.9%       2064 =C2=B125%  sched_debug.cpu#28.sc=
hed_goidle
      2634 =C2=B1 4%    +106.3%       5435 =C2=B1 6%  sched_debug.cpu#17.tt=
wu_count
     22391 =C2=B1 5%     -18.7%      18206 =C2=B1 6%  sched_debug.cpu#3.nr_=
switches
      1933 =C2=B113%     -17.0%       1605 =C2=B1 1%  sched_debug.cpu#20.sc=
hed_goidle
     31292 =C2=B139%     -37.3%      19629 =C2=B114%  sched_debug.cpu#11.sc=
hed_count
      6957 =C2=B1 6%     -41.0%       4101 =C2=B1 3%  sched_debug.cpu#3.ttw=
u_count
     13015 =C2=B114%     -35.8%       8358 =C2=B1 5%  sched_debug.cpu#12.nr=
_switches
     11715 =C2=B1 9%     -25.5%       8728 =C2=B1 7%  sched_debug.cpu#11.sc=
hed_goidle
       745 =C2=B1 4%     +57.6%       1174 =C2=B141%  sched_debug.cpu#28.tt=
wu_local
      8103 =C2=B1 9%     -41.0%       4780 =C2=B121%  sched_debug.cpu#7.nr_=
switches
      5644 =C2=B124%     -37.9%       3502 =C2=B1 7%  sched_debug.cpu#2.sch=
ed_goidle
      4009 =C2=B1 8%     -41.2%       2355 =C2=B121%  sched_debug.cpu#7.sch=
ed_goidle
      5472 =C2=B122%     -43.5%       3089 =C2=B118%  sched_debug.cpu#1.sch=
ed_goidle
      3223 =C2=B113%     -57.2%       1378 =C2=B1 7%  sched_debug.cpu#3.ttw=
u_local
      4652 =C2=B116%     -36.9%       2934 =C2=B123%  sched_debug.cfs_rq[27=
]:/.min_vruntime
        69 =C2=B119%    +101.1%        140 =C2=B110%  sched_debug.cpu#29.tt=
wu_local
     11110 =C2=B121%     -43.7%       6260 =C2=B118%  sched_debug.cpu#1.nr_=
switches
       832 =C2=B113%     +97.3%       1641 =C2=B1 7%  sched_debug.cpu#17.tt=
wu_local
      5188 =C2=B1 6%     +35.6%       7038 =C2=B1 3%  sched_debug.cpu#17.nr=
_switches
      4689 =C2=B110%     -13.7%       4045 =C2=B1 0%  sched_debug.cpu#20.sc=
hed_count
      5220 =C2=B115%     -19.4%       4209 =C2=B110%  sched_debug.cfs_rq[28=
]:/.min_vruntime
       249 =C2=B118%     +35.0%        337 =C2=B121%  sched_debug.cpu#18.tt=
wu_local
        53 =C2=B117%     +49.3%         80 =C2=B1 9%  sched_debug.cpu#31.tt=
wu_local
       455 =C2=B1 8%     -30.5%        316 =C2=B121%  cpuidle.C3-SNB.usage
      5275 =C2=B132%     -34.8%       3440 =C2=B118%  sched_debug.cfs_rq[20=
]:/.min_vruntime
      3474 =C2=B1 7%     -12.0%       3058 =C2=B1 6%  cpuidle.C1E-SNB.usage
      2169 =C2=B1 6%     +15.7%       2510 =C2=B1 4%  sched_debug.cpu#18.tt=
wu_count
    139702 =C2=B1 1%     -33.8%      92508 =C2=B1 1%  cpuidle.C7-SNB.usage
       406 =C2=B1 9%     -18.6%        330 =C2=B116%  numa-vmstat.node1.nr_=
page_table_pages
      4676 =C2=B110%     -13.8%       4033 =C2=B1 0%  sched_debug.cpu#20.nr=
_switches
      5780 =C2=B1 6%     -18.1%       4736 =C2=B1 4%  cpuidle.C1-SNB.usage
     47898 =C2=B1 5%     +32.0%      63244 =C2=B1 3%  softirqs.SCHED
    989252 =C2=B1 1%      -9.3%     897324 =C2=B1 6%  sched_debug.cpu#14.av=
g_idle
    399538 =C2=B1 1%     +11.7%     446206 =C2=B1 0%  softirqs.TIMER
       343 =C2=B118%  +12507.6%      43294 =C2=B1 2%  time.involuntary_cont=
ext_switches
      2506 =C2=B1 0%      -5.0%       2382 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-snb01/will-it-scale/open2

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
    253013 =C2=B1 0%      -1.2%     249916 =C2=B1 0%  will-it-scale.per_thr=
ead_ops
      4354 =C2=B141%     -84.1%        692 =C2=B120%  sched_debug.cpu#13.tt=
wu_local
      5296 =C2=B118%     -83.9%        853 =C2=B113%  sched_debug.cpu#12.tt=
wu_local
      7641 =C2=B138%     -77.3%       1735 =C2=B118%  sched_debug.cpu#13.tt=
wu_count
      9118 =C2=B118%     -77.2%       2074 =C2=B111%  sched_debug.cpu#12.tt=
wu_count
      9904 =C2=B1 6%     -48.4%       5115 =C2=B134%  sched_debug.cpu#10.tt=
wu_count
      8839 =C2=B127%     -79.3%       1833 =C2=B129%  sched_debug.cpu#8.ttw=
u_local
    101354 =C2=B118%     -27.7%      73268 =C2=B119%  sched_debug.cfs_rq[16=
]:/.exec_clock
     24061 =C2=B128%     -61.1%       9371 =C2=B129%  sched_debug.cpu#15.nr=
_switches
     11419 =C2=B129%     -73.9%       2977 =C2=B1 5%  sched_debug.cpu#15.sc=
hed_goidle
     14046 =C2=B122%     -78.0%       3091 =C2=B119%  sched_debug.cpu#8.ttw=
u_count
     32344 =C2=B120%     -38.7%      19821 =C2=B123%  sched_debug.cpu#13.sc=
hed_count
      5788 =C2=B113%     -77.0%       1331 =C2=B1 9%  sched_debug.cpu#11.tt=
wu_local
     10055 =C2=B115%     -40.7%       5957 =C2=B121%  sched_debug.cpu#10.sc=
hed_goidle
     20203 =C2=B118%     -40.0%      12127 =C2=B124%  sched_debug.cpu#14.nr=
_switches
     24515 =C2=B1 7%     -30.7%      16990 =C2=B121%  sched_debug.cpu#10.nr=
_switches
     27297 =C2=B120%     -59.1%      11172 =C2=B116%  sched_debug.cpu#8.nr_=
switches
        75 =C2=B130%     -45.6%         41 =C2=B148%  sched_debug.cpu#16.cp=
u_load[1]
      9222 =C2=B121%     -61.1%       3586 =C2=B1 7%  sched_debug.cpu#14.sc=
hed_goidle
        74 =C2=B130%     -45.1%         40 =C2=B148%  sched_debug.cpu#16.cp=
u_load[0]
     10894 =C2=B110%     -49.7%       5474 =C2=B1 8%  sched_debug.cpu#12.sc=
hed_goidle
        71 =C2=B131%     -44.7%         39 =C2=B131%  sched_debug.cfs_rq[6]=
:/.blocked_load_avg
      3515 =C2=B119%     -32.0%       2390 =C2=B112%  sched_debug.cpu#6.sch=
ed_goidle
     20866 =C2=B116%     -58.6%       8634 =C2=B110%  sched_debug.cpu#13.nr=
_switches
     11007 =C2=B118%     -64.8%       3878 =C2=B117%  sched_debug.cpu#8.sch=
ed_goidle
     10057 =C2=B111%     -57.8%       4240 =C2=B117%  sched_debug.cpu#11.tt=
wu_count
     37414 =C2=B126%    +186.5%     107204 =C2=B115%  sched_debug.cpu#0.sch=
ed_count
        18 =C2=B116%     +34.4%         24 =C2=B123%  sched_debug.cfs_rq[26=
]:/.runnable_load_avg
   1384240 =C2=B140%     -67.3%     452908 =C2=B122%  cpuidle.C3-SNB.time
      9831 =C2=B117%     -62.7%       3666 =C2=B112%  sched_debug.cpu#13.sc=
hed_goidle
      7050 =C2=B119%     -50.0%       3527 =C2=B111%  sched_debug.cpu#9.sch=
ed_goidle
     27447 =C2=B113%     -32.1%      18629 =C2=B113%  sched_debug.cpu#11.nr=
_switches
      5961 =C2=B119%    +315.5%      24768 =C2=B124%  sched_debug.cpu#0.ttw=
u_local
      4277 =C2=B113%    +132.7%       9953 =C2=B126%  sched_debug.cpu#17.tt=
wu_count
     17147 =C2=B114%    +387.7%      83620 =C2=B121%  sched_debug.cpu#0.nr_=
switches
     23029 =C2=B110%     -45.8%      12486 =C2=B1 8%  sched_debug.cpu#12.nr=
_switches
     11920 =C2=B111%     -29.5%       8400 =C2=B115%  sched_debug.cpu#11.sc=
hed_goidle
        80 =C2=B112%     -51.0%         39 =C2=B144%  sched_debug.cfs_rq[16=
]:/.load
        61 =C2=B137%     -47.7%         32 =C2=B142%  sched_debug.cpu#10.lo=
ad
     13026 =C2=B118%    +265.2%      47568 =C2=B122%  sched_debug.cpu#0.ttw=
u_count
        80 =C2=B113%     -49.6%         40 =C2=B143%  sched_debug.cpu#16.lo=
ad
      1445 =C2=B131%     +98.2%       2863 =C2=B139%  sched_debug.cpu#17.tt=
wu_local
      7763 =C2=B117%     +76.4%      13693 =C2=B135%  sched_debug.cpu#17.nr=
_switches
    810769 =C2=B1 3%     +12.5%     912189 =C2=B1 2%  sched_debug.cpu#1.avg=
_idle
        74 =C2=B130%     -46.8%         39 =C2=B144%  sched_debug.cfs_rq[16=
]:/.runnable_load_avg
      1120 =C2=B116%     -41.9%        651 =C2=B118%  cpuidle.C3-SNB.usage
     92087 =C2=B120%     +30.7%     120342 =C2=B110%  sched_debug.cpu#0.nr_=
load_updates
    914687 =C2=B1 4%     -10.4%     819316 =C2=B1 5%  sched_debug.cpu#17.av=
g_idle
      2080 =C2=B1 2%      -9.8%       1877 =C2=B1 1%  slabinfo.signal_cache=
.num_objs
      2050 =C2=B1 4%      -8.4%       1877 =C2=B1 1%  slabinfo.signal_cache=
.active_objs
      2175 =C2=B113%     +71.2%       3725 =C2=B126%  sched_debug.cpu#18.tt=
wu_count
    335319 =C2=B1 0%     -21.0%     265024 =C2=B1 0%  cpuidle.C7-SNB.usage
     18870 =C2=B1 0%    +265.8%      69025 =C2=B1 0%  time.involuntary_cont=
ext_switches
      1981 =C2=B1 0%      +7.1%       2122 =C2=B1 0%  vmstat.system.cs
     18240 =C2=B1 0%      -1.3%      18004 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-sb03/nuttcp/300s

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
   3883.97 =C2=B135%    -100.0%       0.00 =C2=B1 0%  sched_debug.cfs_rq[5]=
:/.max_vruntime
   3883.97 =C2=B135%    -100.0%       0.00 =C2=B1 0%  sched_debug.cfs_rq[5]=
:/.MIN_vruntime
      8618 =C2=B129%     -74.5%       2195 =C2=B128%  sched_debug.cpu#14.tt=
wu_count
      2971 =C2=B148%     -88.0%        357 =C2=B139%  sched_debug.cpu#5.ttw=
u_local
       549 =C2=B122%    +442.9%       2984 =C2=B133%  sched_debug.cpu#21.nr=
_switches
      1789 =C2=B146%     -75.4%        440 =C2=B149%  sched_debug.cpu#4.ttw=
u_local
      7097 =C2=B130%     -71.8%       2000 =C2=B133%  sched_debug.cpu#15.tt=
wu_local
      5737 =C2=B110%     -92.0%        458 =C2=B125%  sched_debug.cpu#10.tt=
wu_local
      8862 =C2=B126%     -66.2%       2994 =C2=B112%  sched_debug.cpu#15.tt=
wu_count
     63.34 =C2=B110%    +391.1%     311.04 =C2=B143%  sched_debug.cfs_rq[23=
]:/.exec_clock
        10 =C2=B112%     -38.7%          6 =C2=B137%  sched_debug.cfs_rq[17=
]:/.nr_spread_over
      1828 =C2=B122%     -38.2%       1130 =C2=B136%  sched_debug.cfs_rq[11=
]:/.exec_clock
       562 =C2=B122%    +433.1%       2997 =C2=B133%  sched_debug.cpu#21.sc=
hed_count
        63 =C2=B138%     -66.7%         21 =C2=B143%  sched_debug.cfs_rq[2]=
:/.tg_runnable_contrib
      1523 =C2=B129%     -58.6%        630 =C2=B130%  sched_debug.cpu#2.ttw=
u_local
        46 =C2=B120%    +344.6%        206 =C2=B126%  sched_debug.cpu#23.tt=
wu_local
        11 =C2=B144%    -100.0%          0 =C2=B1 0%  sched_debug.cpu#29.cp=
u_load[4]
       444 =C2=B110%    +511.9%       2722 =C2=B148%  sched_debug.cfs_rq[3]=
:/.exec_clock
      3428 =C2=B1 4%     +43.4%       4917 =C2=B1 5%  sched_debug.cpu#25.tt=
wu_count
        10 =C2=B1 0%    -100.0%          0 =C2=B1 0%  sched_debug.cfs_rq[5]=
:/.blocked_load_avg
        60 =C2=B126%    +637.6%        445 =C2=B121%  sched_debug.cpu#21.tt=
wu_local
      1044 =C2=B119%     +57.7%       1647 =C2=B1 7%  sched_debug.cpu#25.tt=
wu_local
      2923 =C2=B137%     -65.6%       1006 =C2=B140%  sched_debug.cfs_rq[2]=
:/.avg->runnable_avg_sum
         9 =C2=B139%    +159.3%         23 =C2=B130%  sched_debug.cpu#0.cpu=
_load[3]
       193 =C2=B134%    -100.0%          0 =C2=B1 0%  sched_debug.cpu#28.cp=
u_load[0]
        11 =C2=B116%     -52.9%          5 =C2=B123%  sched_debug.cfs_rq[26=
]:/.tg_runnable_contrib
         2 =C2=B140%    -100.0%          0 =C2=B1 0%  sched_debug.cfs_rq[9]=
:/.tg_runnable_contrib
       114 =C2=B131%     -83.3%         19 =C2=B117%  sched_debug.cfs_rq[9]=
:/.avg->runnable_avg_sum
       550 =C2=B113%     -54.9%        248 =C2=B122%  sched_debug.cfs_rq[26=
]:/.avg->runnable_avg_sum
        10 =C2=B122%    +140.6%         25 =C2=B145%  sched_debug.cpu#0.cpu=
_load[4]
      4891 =C2=B133%     -54.9%       2206 =C2=B149%  sched_debug.cfs_rq[10=
]:/.exec_clock
      3279 =C2=B140%    -100.0%          0 =C2=B1 0%  sched_debug.cpu#28.cu=
rr->pid
       196 =C2=B135%    -100.0%          0 =C2=B1 0%  sched_debug.cfs_rq[28=
]:/.runnable_load_avg
      2481 =C2=B1 5%     -43.3%       1406 =C2=B132%  sched_debug.cfs_rq[31=
]:/.exec_clock
       196 =C2=B135%    -100.0%          0 =C2=B1 0%  sched_debug.cfs_rq[28=
]:/.load
  3.55e+08 =C2=B1 0%      +8.9%  3.865e+08 =C2=B1 5%  proc-vmstat.pgalloc_n=
ormal
      2357 =C2=B1 7%    +103.2%       4790 =C2=B1 2%  sched_debug.cpu#17.tt=
wu_count
       196 =C2=B135%    -100.0%          0 =C2=B1 0%  sched_debug.cpu#28.lo=
ad
      2705 =C2=B120%     -42.9%       1544 =C2=B149%  sched_debug.cpu#31.nr=
_switches
       175 =C2=B137%     +89.2%        332 =C2=B148%  sched_debug.cfs_rq[21=
]:/.avg->runnable_avg_sum
      1186 =C2=B119%     -43.7%        668 =C2=B146%  sched_debug.cpu#31.sc=
hed_goidle
      3161 =C2=B127%     -38.0%       1959 =C2=B1 0%  meminfo.AnonHugePages
       349 =C2=B142%    +131.2%        808 =C2=B137%  sched_debug.cpu#3.ttw=
u_local
      6468 =C2=B1 9%     +30.4%       8433 =C2=B119%  sched_debug.cpu#0.ttw=
u_count
       866 =C2=B113%     +91.2%       1656 =C2=B1 4%  sched_debug.cpu#17.tt=
wu_local
      6038 =C2=B1 7%     -34.0%       3986 =C2=B130%  sched_debug.cfs_rq[28=
]:/.min_vruntime
      5313 =C2=B1 9%     -40.4%       3169 =C2=B136%  sched_debug.cfs_rq[31=
]:/.min_vruntime
      1862 =C2=B1 4%     +54.5%       2878 =C2=B121%  sched_debug.cfs_rq[23=
]:/.min_vruntime
      5098 =C2=B1 4%     -33.3%       3402 =C2=B1 6%  sched_debug.cfs_rq[29=
]:/.min_vruntime
    126798 =C2=B115%     -28.1%      91178 =C2=B1 0%  sched_debug.cpu#4.nr_=
load_updates
    112718 =C2=B110%     -19.7%      90480 =C2=B1 1%  sched_debug.cpu#5.nr_=
load_updates
    470584 =C2=B147%    +101.6%     948801 =C2=B1 2%  sched_debug.cpu#5.avg=
_idle
     26143 =C2=B1 2%     +66.8%      43614 =C2=B1 7%  softirqs.RCU
    959521 =C2=B1 4%     -35.0%     623768 =C2=B141%  sched_debug.cpu#13.av=
g_idle
    967558 =C2=B1 2%     -19.5%     778607 =C2=B119%  sched_debug.cpu#15.av=
g_idle
    325196 =C2=B1 0%     -26.0%     240605 =C2=B1 0%  cpuidle.C7-SNB.usage
    662043 =C2=B114%     +46.9%     972290 =C2=B1 2%  sched_debug.cpu#4.avg=
_idle
        31 =C2=B134%     -32.3%         21 =C2=B114%  sched_debug.cfs_rq[25=
]:/.tg_runnable_contrib
      1466 =C2=B133%     -32.1%        995 =C2=B114%  sched_debug.cfs_rq[25=
]:/.avg->runnable_avg_sum
     10900 =C2=B1 3%     +18.2%      12884 =C2=B1 7%  slabinfo.kmalloc-256.=
num_objs
       308 =C2=B1 0%   +6197.7%      19418 =C2=B1 0%  time.involuntary_cont=
ext_switches
      0.00 =C2=B1 0%      +4.9%       0.00 =C2=B1 3%  energy.energy-cores
     41.80 =C2=B1 0%      +4.9%      43.85 =C2=B1 3%  turbostat.Cor_W
     69.29 =C2=B1 0%      +3.0%      71.34 =C2=B1 1%  turbostat.Pkg_W
      0.00 =C2=B1 0%      +3.0%       0.00 =C2=B1 1%  energy.energy-pkg

testbox/testcase/testparams: xps2/pigz/100%-512K

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
       797 =C2=B119%     +73.4%       1382 =C2=B1 7%  sched_debug.cfs_rq[6]=
:/.tg_load_contrib
       679 =C2=B124%     +83.1%       1244 =C2=B1 7%  sched_debug.cfs_rq[6]=
:/.blocked_load_avg
       135 =C2=B1 9%     -10.6%        121 =C2=B110%  sched_debug.cpu#7.load
       421 =C2=B1 3%     -30.3%        294 =C2=B1 7%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
       306 =C2=B1 5%     -51.2%        149 =C2=B120%  sched_debug.cfs_rq[1]=
:/.blocked_load_avg
      2002 =C2=B1 4%     +36.3%       2729 =C2=B111%  sched_debug.cpu#7.sch=
ed_goidle
    503763 =C2=B115%     +24.2%     625908 =C2=B113%  sched_debug.cpu#5.avg=
_idle
     22573 =C2=B123%     +30.5%      29451 =C2=B114%  cpuidle.C1-NHM.time
       101 =C2=B1 8%     +25.3%        127 =C2=B1 3%  cpuidle.C1-NHM.usage
      5399 =C2=B1 1%     +19.8%       6469 =C2=B1 9%  sched_debug.cfs_rq[0]=
:/.tg_load_avg
       980 =C2=B1 2%     +12.9%       1106 =C2=B1 3%  slabinfo.kmalloc-96.a=
ctive_objs
       980 =C2=B1 2%     +12.9%       1106 =C2=B1 3%  slabinfo.kmalloc-96.n=
um_objs
      5425 =C2=B1 1%     +19.8%       6500 =C2=B1 9%  sched_debug.cfs_rq[1]=
:/.tg_load_avg
      5422 =C2=B1 1%     +19.4%       6474 =C2=B1 9%  sched_debug.cfs_rq[5]=
:/.tg_load_avg
      2151 =C2=B1 1%     -10.1%       1935 =C2=B1 4%  slabinfo.kmalloc-256.=
num_objs
      5416 =C2=B1 1%     +19.6%       6479 =C2=B1 8%  sched_debug.cfs_rq[3]=
:/.tg_load_avg
      5431 =C2=B1 1%     +19.4%       6486 =C2=B1 9%  sched_debug.cfs_rq[6]=
:/.tg_load_avg
      5402 =C2=B1 2%     +19.7%       6464 =C2=B1 8%  sched_debug.cfs_rq[2]=
:/.tg_load_avg
      5423 =C2=B1 0%     +19.5%       6478 =C2=B1 9%  sched_debug.cfs_rq[7]=
:/.tg_load_avg
      5429 =C2=B1 1%     +19.6%       6495 =C2=B1 8%  sched_debug.cfs_rq[4]=
:/.tg_load_avg

testbox/testcase/testparams: xps/ftrace_onoff/5m

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
      0.00 =C2=B1 0%  +8.1e+10%     813.10 =C2=B132%  sched_debug.cfs_rq[0]=
:/.MIN_vruntime
      0.00 =C2=B1 0%  +8.1e+10%     813.23 =C2=B132%  sched_debug.cfs_rq[0]=
:/.max_vruntime
       -21 =C2=B1-48%    +130.8%        -50 =C2=B1-17%  sched_debug.cpu#3.n=
r_uninterruptible
      1754 =C2=B1 5%     +88.5%       3308 =C2=B1 9%  sched_debug.cfs_rq[5]=
:/.spread0
      2504 =C2=B125%    +100.0%       5009 =C2=B1 6%  sched_debug.cfs_rq[6]=
:/.spread0
     11853 =C2=B125%    +113.3%      25277 =C2=B1 5%  sched_debug.cpu#5.ttw=
u_local
      2544 =C2=B1 6%    +126.2%       5753 =C2=B1 8%  sched_debug.cfs_rq[4]=
:/.spread0
      1809 =C2=B133%     +86.1%       3367 =C2=B115%  sched_debug.cfs_rq[7]=
:/.spread0
     14455 =C2=B1 2%    +111.4%      30556 =C2=B1 7%  sched_debug.cpu#7.ttw=
u_local
     -1841 =C2=B1 0%     +60.0%      -2945 =C2=B1 0%  sched_debug.cpu#2.nr_=
uninterruptible
       -11 =C2=B1-21%    +282.9%        -44 =C2=B1-14%  sched_debug.cpu#1.n=
r_uninterruptible
       532 =C2=B110%     +78.4%        949 =C2=B1 4%  sched_debug.cpu#4.nr_=
uninterruptible
     29707 =C2=B110%     +47.3%      43756 =C2=B112%  sched_debug.cpu#4.ttw=
u_local
     24165 =C2=B111%     +39.9%      33805 =C2=B113%  sched_debug.cpu#6.ttw=
u_local
        60 =C2=B110%     +55.5%         94 =C2=B117%  sched_debug.cfs_rq[3]=
:/.tg_runnable_contrib
      2840 =C2=B1 9%     +54.2%       4380 =C2=B116%  sched_debug.cfs_rq[3]=
:/.avg->runnable_avg_sum
        28 =C2=B146%    +101.2%         57 =C2=B116%  sched_debug.cpu#4.cpu=
_load[4]
         3 =C2=B114%     -70.0%          1 =C2=B1 0%  sched_debug.cfs_rq[7]=
:/.nr_spread_over
     74392 =C2=B1 8%     +45.5%     108276 =C2=B1 7%  sched_debug.cpu#6.sch=
ed_count
       553 =C2=B1 5%     +60.1%        886 =C2=B1 3%  sched_debug.cpu#5.nr_=
uninterruptible
     21753 =C2=B112%    +105.0%      44597 =C2=B1 4%  sched_debug.cpu#5.ttw=
u_count
     25413 =C2=B1 0%    +107.6%      52755 =C2=B1 5%  sched_debug.cpu#7.ttw=
u_count
      5262 =C2=B1 4%     +37.6%       7243 =C2=B1 2%  sched_debug.cfs_rq[5]=
:/.exec_clock
      4733 =C2=B1 7%     +25.4%       5936 =C2=B1 3%  sched_debug.cfs_rq[6]=
:/.avg->runnable_avg_sum
        85 =C2=B129%     +56.8%        134 =C2=B115%  sched_debug.cfs_rq[4]=
:/.tg_runnable_contrib
      3972 =C2=B129%     +56.2%       6203 =C2=B115%  sched_debug.cfs_rq[4]=
:/.avg->runnable_avg_sum
     11046 =C2=B1 1%     +38.8%      15330 =C2=B1 1%  sched_debug.cfs_rq[4]=
:/.min_vruntime
     41713 =C2=B1 7%     +71.2%      71395 =C2=B1 8%  sched_debug.cpu#4.ttw=
u_count
   1550134 =C2=B1 0%     +47.4%    2285060 =C2=B1 0%  proc-vmstat.numa_local
   1550134 =C2=B1 0%     +47.4%    2285060 =C2=B1 0%  proc-vmstat.numa_hit
   1561481 =C2=B1 0%     +47.3%    2300370 =C2=B1 0%  proc-vmstat.pgfree
     58.66 =C2=B1 0%     -26.2%      43.29 =C2=B1 0%  turbostat.%c6
    137258 =C2=B1 5%     -21.6%     107598 =C2=B1 0%  sched_debug.cpu#2.ttw=
u_local
       102 =C2=B1 8%     +25.1%        128 =C2=B1 3%  sched_debug.cfs_rq[6]=
:/.tg_runnable_contrib
         9 =C2=B148%     -65.5%          3 =C2=B114%  sched_debug.cfs_rq[5]=
:/.nr_spread_over
         3 =C2=B114%     -60.0%          1 =C2=B135%  sched_debug.cfs_rq[1]=
:/.nr_spread_over
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  vmstat.procs.r
     52586 =C2=B127%    +179.8%     147141 =C2=B144%  cpuidle.POLL.time
   1617673 =C2=B1 0%     +41.4%    2288012 =C2=B1 0%  proc-vmstat.pgfault
      5885 =C2=B1 2%     +49.6%       8807 =C2=B1 1%  sched_debug.cfs_rq[4]=
:/.exec_clock
     34481 =C2=B1 9%     +71.3%      59084 =C2=B1 7%  sched_debug.cpu#6.ttw=
u_count
      1213 =C2=B110%     +28.5%       1559 =C2=B111%  sched_debug.cfs_rq[4]=
:/.tg_load_contrib
     10257 =C2=B1 0%     +25.6%      12885 =C2=B1 1%  sched_debug.cfs_rq[5]=
:/.min_vruntime
     48767 =C2=B112%     +72.0%      83904 =C2=B1 3%  sched_debug.cpu#5.sch=
ed_count
     83323 =C2=B1 7%     +46.5%     122037 =C2=B1 8%  sched_debug.cpu#4.sch=
ed_count
       471 =C2=B1 6%     +71.7%        810 =C2=B1 6%  sched_debug.cpu#6.nr_=
uninterruptible
    168963 =C2=B1 4%     -23.4%     129367 =C2=B1 0%  sched_debug.cpu#2.ttw=
u_count
     74340 =C2=B1 8%     +45.6%     108231 =C2=B1 7%  sched_debug.cpu#6.nr_=
switches
         1 =C2=B128%   +1560.0%         27 =C2=B149%  sched_debug.cpu#1.cpu=
_load[2]
     21505 =C2=B113%     +67.3%      35987 =C2=B1 4%  sched_debug.cpu#5.sch=
ed_goidle
        55 =C2=B128%    +143.6%        134 =C2=B114%  sched_debug.cfs_rq[0]=
:/.blocked_load_avg
      2987 =C2=B1 0%     +49.9%       4477 =C2=B1 0%  cpuidle.POLL.usage
    216974 =C2=B1 1%     -16.2%     181870 =C2=B1 9%  sched_debug.cpu#3.sch=
ed_goidle
     34261 =C2=B1 8%     +39.4%      47774 =C2=B1 8%  sched_debug.cpu#6.sch=
ed_goidle
       286 =C2=B113%     +32.8%        380 =C2=B1 1%  sched_debug.cpu#7.nr_=
uninterruptible
      3.98 =C2=B1 1%     +49.0%       5.92 =C2=B1 1%  turbostat.%c3
   1164419 =C2=B1 0%     +47.6%    1718674 =C2=B1 0%  proc-vmstat.pgalloc_d=
ma32
     48716 =C2=B112%     +72.1%      83860 =C2=B1 3%  sched_debug.cpu#5.nr_=
switches
      5676 =C2=B1 5%     +12.8%       6401 =C2=B1 3%  sched_debug.cfs_rq[3]=
:/.min_vruntime
     37862 =C2=B1 8%     +40.1%      53053 =C2=B110%  sched_debug.cpu#4.sch=
ed_goidle
     83271 =C2=B1 7%     +46.5%     121990 =C2=B1 8%  sched_debug.cpu#4.nr_=
switches
    398812 =C2=B1 0%     +46.4%     583757 =C2=B1 0%  proc-vmstat.pgalloc_n=
ormal
    334712 =C2=B1 4%     -18.3%     273483 =C2=B1 0%  sched_debug.cpu#2.sch=
ed_count
    437235 =C2=B1 1%     -15.5%     369670 =C2=B1 8%  sched_debug.cpu#3.nr_=
switches
     11007 =C2=B1 5%     +32.5%      14585 =C2=B1 2%  sched_debug.cfs_rq[6]=
:/.min_vruntime
        45 =C2=B111%     +92.6%         87 =C2=B1 9%  sched_debug.cfs_rq[1]=
:/.tg_runnable_contrib
      2133 =C2=B110%     +89.3%       4039 =C2=B1 9%  sched_debug.cfs_rq[1]=
:/.avg->runnable_avg_sum
      5686 =C2=B1 5%     +45.1%       8248 =C2=B1 2%  sched_debug.cfs_rq[6]=
:/.exec_clock
        59 =C2=B116%    +169.8%        161 =C2=B113%  sched_debug.cfs_rq[0]=
:/.tg_load_contrib
    217819 =C2=B1 1%     -18.2%     178157 =C2=B1 9%  sched_debug.cpu#3.ttw=
u_count
    437287 =C2=B1 1%     -15.4%     369733 =C2=B1 8%  sched_debug.cpu#3.sch=
ed_count
     30.42 =C2=B1 1%     -50.3%      15.11 =C2=B1 2%  turbostat.%pc6
    115697 =C2=B1 0%    +100.0%     231357 =C2=B1 1%  cpuidle.C3-NHM.usage
        73 =C2=B123%    +133.3%        170 =C2=B125%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
        68 =C2=B122%    +127.0%        154 =C2=B129%  sched_debug.cfs_rq[1]=
:/.blocked_load_avg
        40 =C2=B126%     +59.5%         64 =C2=B117%  sched_debug.cpu#5.cpu=
_load[3]
     54634 =C2=B1 1%     +79.7%      98153 =C2=B1 5%  sched_debug.cpu#7.nr_=
switches
    334661 =C2=B1 4%     -18.3%     273419 =C2=B1 0%  sched_debug.cpu#2.nr_=
switches
    165837 =C2=B1 4%     -19.2%     134051 =C2=B1 0%  sched_debug.cpu#2.sch=
ed_goidle
     24575 =C2=B1 1%     +75.9%      43216 =C2=B1 5%  sched_debug.cpu#7.sch=
ed_goidle
        27 =C2=B113%     +65.9%         45 =C2=B120%  sched_debug.cpu#5.cpu=
_load[4]
    189542 =C2=B1 1%     -16.6%     158027 =C2=B110%  sched_debug.cpu#3.ttw=
u_local
     54684 =C2=B1 1%     +79.6%      98192 =C2=B1 5%  sched_debug.cpu#7.sch=
ed_count
     31471 =C2=B1 0%     +66.7%      52466 =C2=B1 0%  sched_debug.cpu#7.nr_=
load_updates
      1120 =C2=B119%     +28.5%       1439 =C2=B111%  sched_debug.cfs_rq[4]=
:/.blocked_load_avg
     32395 =C2=B1 1%     +71.5%      55564 =C2=B1 0%  sched_debug.cpu#6.nr_=
load_updates
      3844 =C2=B1 0%     +58.3%       6085 =C2=B1 0%  proc-vmstat.nr_written
      5966 =C2=B1 0%     +14.8%       6851 =C2=B1 5%  sched_debug.cfs_rq[1]=
:/.min_vruntime
     34252 =C2=B1 1%     +68.6%      57744 =C2=B1 0%  sched_debug.cpu#4.nr_=
load_updates
     30594 =C2=B1 2%     +64.6%      50355 =C2=B1 1%  sched_debug.cpu#5.nr_=
load_updates
      3839 =C2=B1 0%     +58.5%       6085 =C2=B1 0%  proc-vmstat.nr_dirtied
  96594258 =C2=B1 0%     +48.5%  1.434e+08 =C2=B1 1%  cpuidle.C3-NHM.time
      8501 =C2=B1 1%     +12.6%       9575 =C2=B1 2%  sched_debug.cfs_rq[0]=
:/.min_vruntime
      5973 =C2=B1 5%     +19.1%       7112 =C2=B1 0%  sched_debug.cfs_rq[2]=
:/.min_vruntime
     10312 =C2=B1 6%     +25.5%      12945 =C2=B1 2%  sched_debug.cfs_rq[7]=
:/.min_vruntime
 4.016e+08 =C2=B1 0%     +58.7%  6.375e+08 =C2=B1 0%  cpuidle.C1-NHM.time
   1074730 =C2=B1 0%     +58.5%    1702978 =C2=B1 0%  cpuidle.C1-NHM.usage
        35 =C2=B1 2%     +55.7%         55 =C2=B124%  sched_debug.cpu#6.cpu=
_load[4]
      5205 =C2=B1 4%     +32.0%       6872 =C2=B1 2%  sched_debug.cfs_rq[7]=
:/.exec_clock
     11362 =C2=B1 5%     +38.1%      15693 =C2=B1 2%  softirqs.NET_RX
     30.76 =C2=B1 0%     +35.7%      41.76 =C2=B1 0%  turbostat.%c1
      6215 =C2=B1 4%     +18.2%       7347 =C2=B1 5%  sched_debug.cfs_rq[0]=
:/.tg_load_avg
       559 =C2=B1 4%     +37.5%        769 =C2=B110%  sched_debug.cfs_rq[0]=
:/.tg->runnable_avg
       579 =C2=B1 4%     +37.1%        794 =C2=B1 9%  sched_debug.cfs_rq[1]=
:/.tg->runnable_avg
       588 =C2=B1 3%     +36.9%        806 =C2=B110%  sched_debug.cfs_rq[2]=
:/.tg->runnable_avg
       622 =C2=B1 3%     +36.2%        848 =C2=B110%  sched_debug.cfs_rq[5]=
:/.tg->runnable_avg
 1.714e+09 =C2=B1 0%     -20.2%  1.368e+09 =C2=B1 0%  cpuidle.C6-NHM.time
       599 =C2=B1 3%     +36.0%        815 =C2=B110%  sched_debug.cfs_rq[3]=
:/.tg->runnable_avg
       615 =C2=B1 3%     +35.7%        835 =C2=B110%  sched_debug.cfs_rq[4]=
:/.tg->runnable_avg
       635 =C2=B1 2%     +36.0%        863 =C2=B1 9%  sched_debug.cfs_rq[6]=
:/.tg->runnable_avg
       646 =C2=B1 2%     +35.3%        874 =C2=B1 9%  sched_debug.cfs_rq[7]=
:/.tg->runnable_avg
      6295 =C2=B1 4%     +16.7%       7347 =C2=B1 4%  sched_debug.cfs_rq[1]=
:/.tg_load_avg
      6407 =C2=B1 4%     +17.1%       7501 =C2=B1 4%  sched_debug.cfs_rq[5]=
:/.tg_load_avg
      6323 =C2=B1 4%     +18.1%       7465 =C2=B1 4%  sched_debug.cfs_rq[3]=
:/.tg_load_avg
      6425 =C2=B1 4%     +16.5%       7487 =C2=B1 3%  sched_debug.cfs_rq[6]=
:/.tg_load_avg
      6332 =C2=B1 4%     +17.2%       7418 =C2=B1 5%  sched_debug.cfs_rq[2]=
:/.tg_load_avg
      6417 =C2=B1 4%     +16.1%       7452 =C2=B1 4%  sched_debug.cfs_rq[7]=
:/.tg_load_avg
      4.23 =C2=B1 2%     +15.9%       4.91 =C2=B1 3%  turbostat.%pc3
      6378 =C2=B1 4%     +17.3%       7480 =C2=B1 5%  sched_debug.cfs_rq[4]=
:/.tg_load_avg
  56450565 =C2=B1 0%     +13.2%   63882668 =C2=B1 1%  cpuidle.C1E-NHM.time
    101678 =C2=B1 0%     +12.9%     114794 =C2=B1 0%  softirqs.TIMER
        47 =C2=B1 3%      +8.5%         51 =C2=B1 4%  turbostat.CTMP
     20813 =C2=B1 0%     +95.2%      40618 =C2=B1 0%  time.involuntary_cont=
ext_switches
     30496 =C2=B1 0%     +58.7%      48386 =C2=B1 0%  time.file_system_outp=
uts
     55307 =C2=B1 0%     +58.9%      87877 =C2=B1 0%  time.voluntary_contex=
t_switches
   1155035 =C2=B1 0%     +58.7%    1833059 =C2=B1 0%  time.minor_page_faults
      6.60 =C2=B1 0%     +36.9%       9.03 =C2=B1 0%  turbostat.%c0
        11 =C2=B1 0%     +45.5%         16 =C2=B1 0%  time.percent_of_cpu_t=
his_job_got
     31.28 =C2=B1 0%     +39.9%      43.76 =C2=B1 0%  time.system_time
      8112 =C2=B1 0%      +3.3%       8378 =C2=B1 0%  vmstat.system.cs
      7738 =C2=B1 0%     +36.5%      10566 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-a06/qperf/600s

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
     75582 =C2=B1 2%      -3.1%      73228 =C2=B1 0%  qperf.sctp.latency
 6.479e+08 =C2=B1 0%      -0.9%   6.42e+08 =C2=B1 0%  qperf.udp.recv_bw
 6.561e+08 =C2=B1 0%      -1.3%  6.477e+08 =C2=B1 0%  qperf.udp.send_bw
   -148722 =C2=B1-11%     +44.8%    -215280 =C2=B1-15%  sched_debug.cfs_rq[=
3]:/.spread0
    196852 =C2=B131%     -30.1%     137556 =C2=B1 4%  sched_debug.cpu#1.ttw=
u_local
     16973 =C2=B1 4%      -9.2%      15414 =C2=B1 3%  cpuidle.POLL.time
      3.30 =C2=B139%     -61.6%       1.27 =C2=B117%  perf-profile.cpu-cycl=
es.copy_user_generic_string.skb_copy_datagram_iovec.tcp_recvmsg.inet_recvms=
g.sock_aio_read
       197 =C2=B1 1%      -6.9%        183 =C2=B1 6%  sched_debug.cpu#2.cpu=
_load[3]
       329 =C2=B1 5%     -13.2%        285 =C2=B1 9%  sched_debug.cfs_rq[2]=
:/.load
       422 =C2=B118%     -23.4%        323 =C2=B120%  sched_debug.cfs_rq[3]=
:/.blocked_load_avg
       624 =C2=B113%     -16.3%        522 =C2=B110%  sched_debug.cfs_rq[3]=
:/.tg_load_contrib
   3715157 =C2=B1 2%     +11.7%    4149477 =C2=B1 0%  sched_debug.cpu#0.sch=
ed_count
       323 =C2=B1 3%     -13.4%        280 =C2=B1 6%  sched_debug.cpu#2.load
       186 =C2=B1 8%     +12.4%        209 =C2=B1 6%  sched_debug.cpu#0.cpu=
_load[0]
       353 =C2=B1 7%     -20.4%        281 =C2=B1 9%  sched_debug.cfs_rq[1]=
:/.load
    457483 =C2=B1 9%     +20.2%     549887 =C2=B1 8%  sched_debug.cpu#1.avg=
_idle
    100532 =C2=B118%     -40.7%      59572 =C2=B117%  meminfo.DirectMap4k
       246 =C2=B1 7%     -12.2%        216 =C2=B1 2%  sched_debug.cfs_rq[2]=
:/.runnable_load_avg
     84774 =C2=B1 4%     -23.5%      64863 =C2=B1 4%  softirqs.RCU
     16026 =C2=B1 5%     -16.3%      13414 =C2=B1 4%  cpuidle.C2-ATM.usage
   9358028 =C2=B1 6%     -17.8%    7692487 =C2=B1 6%  cpuidle.C4-ATM.time
      5313 =C2=B1 7%     -25.2%       3972 =C2=B110%  cpuidle.C4-ATM.usage
      1769 =C2=B1 2%     +14.6%       2027 =C2=B1 6%  slabinfo.kmalloc-192.=
active_objs
     85994 =C2=B1 1%     -14.2%      73762 =C2=B1 1%  softirqs.SCHED
    150630 =C2=B1 3%     -16.0%     126496 =C2=B1 4%  cpuidle.C6-ATM.usage
    116081 =C2=B1 0%     +12.5%     130610 =C2=B1 1%  time.involuntary_cont=
ext_switches

testbox/testcase/testparams: lkp-sb03/nepim/300s-100%-tcp

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
      2499 =C2=B1 2%      -6.1%       2347 =C2=B1 2%  nepim.tcp.avg.snd_s
    655257 =C2=B1 2%      -6.1%     615397 =C2=B1 2%  nepim.tcp.avg.kbps_out
    654746 =C2=B1 2%      -6.0%     615555 =C2=B1 2%  nepim.tcp.avg.kbps_in
      2497 =C2=B1 2%      -6.0%       2348 =C2=B1 2%  nepim.tcp.avg.rcv_s
   -163648 =C2=B1-14%     -33.4%    -108977 =C2=B1-9%  sched_debug.cfs_rq[2=
4]:/.spread0
   -162978 =C2=B1-14%     -34.9%    -106150 =C2=B1-9%  sched_debug.cfs_rq[2=
1]:/.spread0
   -163786 =C2=B1-14%     -33.3%    -109304 =C2=B1-10%  sched_debug.cfs_rq[=
30]:/.spread0
   -161694 =C2=B1-15%     -47.6%     -84805 =C2=B1-32%  sched_debug.cfs_rq[=
14]:/.spread0
   -154868 =C2=B1-18%     -37.2%     -97180 =C2=B1-4%  sched_debug.cfs_rq[1=
2]:/.spread0
      2705 =C2=B129%     -83.0%        461 =C2=B138%  sched_debug.cpu#9.ttw=
u_local
   -145997 =C2=B1-22%     -37.5%     -91304 =C2=B1-11%  sched_debug.cfs_rq[=
11]:/.spread0
   -163278 =C2=B1-15%     -44.7%     -90304 =C2=B1-20%  sched_debug.cfs_rq[=
15]:/.spread0
   -156828 =C2=B1-16%     -35.9%    -100544 =C2=B1-12%  sched_debug.cfs_rq[=
17]:/.spread0
   -163188 =C2=B1-15%     -33.9%    -107948 =C2=B1-9%  sched_debug.cfs_rq[2=
3]:/.spread0
   -161060 =C2=B1-14%     -36.7%    -102013 =C2=B1-8%  sched_debug.cfs_rq[1=
8]:/.spread0
   -156604 =C2=B1-15%     -35.2%    -101557 =C2=B1-11%  sched_debug.cfs_rq[=
25]:/.spread0
   -162125 =C2=B1-13%     -34.2%    -106729 =C2=B1-9%  sched_debug.cfs_rq[2=
9]:/.spread0
   -162791 =C2=B1-15%     -34.5%    -106675 =C2=B1-10%  sched_debug.cfs_rq[=
31]:/.spread0
   -163378 =C2=B1-15%     -36.0%    -104576 =C2=B1-10%  sched_debug.cfs_rq[=
22]:/.spread0
    -81764 =C2=B1-12%     -42.8%     -46748 =C2=B1-22%  sched_debug.cfs_rq[=
1]:/.spread0
   -152211 =C2=B1-18%     -51.6%     -73594 =C2=B1-41%  sched_debug.cfs_rq[=
5]:/.spread0
   -158111 =C2=B1-15%     -31.9%    -107656 =C2=B1-10%  sched_debug.cfs_rq[=
19]:/.spread0
   -161454 =C2=B1-14%     -34.5%    -105758 =C2=B1-10%  sched_debug.cfs_rq[=
20]:/.spread0
   -157597 =C2=B1-18%     -32.7%    -106088 =C2=B1-9%  sched_debug.cfs_rq[2=
6]:/.spread0
   -157783 =C2=B1-10%     -31.7%    -107791 =C2=B1-9%  sched_debug.cfs_rq[1=
6]:/.spread0
   -163864 =C2=B1-14%     -34.5%    -107286 =C2=B1-9%  sched_debug.cfs_rq[2=
7]:/.spread0
   -160294 =C2=B1-16%     -43.2%     -91021 =C2=B1-21%  sched_debug.cfs_rq[=
13]:/.spread0
   -154265 =C2=B1-17%     -57.9%     -64949 =C2=B1-48%  sched_debug.cfs_rq[=
4]:/.spread0
   -156174 =C2=B1-13%     -56.0%     -68677 =C2=B1-46%  sched_debug.cfs_rq[=
7]:/.spread0
   -163039 =C2=B1-14%     -35.4%    -105312 =C2=B1-9%  sched_debug.cfs_rq[2=
8]:/.spread0
      2648 =C2=B117%     -70.4%        784 =C2=B137%  sched_debug.cpu#12.tt=
wu_local
      3794 =C2=B113%     -71.5%       1082 =C2=B143%  sched_debug.cpu#4.ttw=
u_local
      4710 =C2=B128%     -83.9%        756 =C2=B138%  sched_debug.cpu#1.ttw=
u_local
     39796 =C2=B146%     -68.5%      12541 =C2=B117%  cpuidle.C6-SNB.time
       293 =C2=B1 2%     +49.7%        439 =C2=B122%  sched_debug.cpu#31.tt=
wu_count
      2434 =C2=B141%     +57.1%       3824 =C2=B110%  sched_debug.cpu#8.ttw=
u_local
  54924.58 =C2=B123%     -64.4%   19562.82 =C2=B136%  sched_debug.cfs_rq[9]=
:/.exec_clock
       190 =C2=B1 4%     -44.6%        105 =C2=B112%  sched_debug.cpu#0.load
    453881 =C2=B115%     -67.5%     147391 =C2=B130%  sched_debug.cpu#9.sch=
ed_count
        10 =C2=B136%     -43.8%          6 =C2=B123%  sched_debug.cpu#18.nr=
_uninterruptible
    209867 =C2=B124%     -57.2%      89799 =C2=B121%  sched_debug.cpu#8.ttw=
u_count
        23 =C2=B143%     +77.5%         42 =C2=B116%  numa-numastat.node0.o=
ther_node
      3549 =C2=B1 6%     +67.4%       5941 =C2=B1 1%  sched_debug.cpu#25.tt=
wu_count
         1 =C2=B1 0%    +166.7%          2 =C2=B117%  sched_debug.cfs_rq[18=
]:/.nr_spread_over
       665 =C2=B113%    +145.1%       1631 =C2=B142%  sched_debug.cfs_rq[28=
]:/.exec_clock
       588 =C2=B136%     +38.8%        816 =C2=B1 4%  sched_debug.cpu#27.tt=
wu_count
      2526 =C2=B1 3%     -48.9%       1291 =C2=B131%  sched_debug.cpu#11.tt=
wu_local
       626 =C2=B111%     -52.8%        296 =C2=B120%  sched_debug.cpu#23.sc=
hed_goidle
       192 =C2=B1 4%     -49.0%         98 =C2=B112%  sched_debug.cfs_rq[0]=
:/.load
     24.72 =C2=B1 6%     -18.7%      20.10 =C2=B1 6%  turbostat.%pc2
      1763 =C2=B1 1%     -50.5%        872 =C2=B110%  sched_debug.cpu#0.cur=
r->pid
     58263 =C2=B129%    +106.5%     120293 =C2=B132%  sched_debug.cpu#4.sch=
ed_count
      1176 =C2=B1 9%     +63.0%       1916 =C2=B1 6%  sched_debug.cpu#25.tt=
wu_local
         3 =C2=B127%    +122.2%          6 =C2=B146%  sched_debug.cfs_rq[11=
]:/.runnable_load_avg
       242 =C2=B1 7%     -42.5%        139 =C2=B1 9%  sched_debug.cpu#0.cpu=
_load[2]
       128 =C2=B115%     -41.6%         75 =C2=B119%  sched_debug.cpu#1.cpu=
_load[2]
       471 =C2=B126%    +133.4%       1101 =C2=B138%  sched_debug.cfs_rq[21=
]:/.exec_clock
       192 =C2=B1 3%     -49.7%         97 =C2=B112%  sched_debug.cfs_rq[0]=
:/.runnable_load_avg
       263 =C2=B1 8%     -41.3%        154 =C2=B1 8%  sched_debug.cpu#0.cpu=
_load[3]
        22 =C2=B114%     +64.7%         37 =C2=B115%  sched_debug.cfs_rq[11=
]:/.tg_runnable_contrib
    451167 =C2=B115%     -67.8%     145407 =C2=B130%  sched_debug.cpu#9.nr_=
switches
      1076 =C2=B113%     +64.1%       1766 =C2=B114%  sched_debug.cfs_rq[11=
]:/.avg->runnable_avg_sum
    923811 =C2=B1 3%      -8.6%     844463 =C2=B1 7%  sched_debug.cpu#2.avg=
_idle
       348 =C2=B113%     -33.5%        231 =C2=B129%  sched_debug.cfs_rq[18=
]:/.tg_load_contrib
       141 =C2=B116%     -43.5%         79 =C2=B118%  sched_debug.cpu#1.cpu=
_load[3]
      1350 =C2=B121%    +192.3%       3946 =C2=B130%  sched_debug.cpu#21.tt=
wu_count
      1334 =C2=B110%     -52.4%        635 =C2=B117%  sched_debug.cpu#23.nr=
_switches
       346 =C2=B120%     -65.6%        119 =C2=B148%  sched_debug.cfs_rq[9]=
:/.tg_runnable_contrib
     15865 =C2=B120%     -65.6%       5457 =C2=B147%  sched_debug.cfs_rq[9]=
:/.avg->runnable_avg_sum
       216 =C2=B1 6%     -43.9%        121 =C2=B1 9%  sched_debug.cpu#0.cpu=
_load[1]
       344 =C2=B115%     -33.8%        228 =C2=B132%  sched_debug.cfs_rq[18=
]:/.blocked_load_avg
      0.94 =C2=B112%     -46.6%       0.50 =C2=B129%  turbostat.%c3
     53828 =C2=B117%    +138.4%     128330 =C2=B138%  sched_debug.cpu#0.sch=
ed_count
       276 =C2=B1 8%     -39.9%        166 =C2=B1 6%  sched_debug.cpu#0.cpu=
_load[4]
       115 =C2=B114%     -39.2%         70 =C2=B123%  sched_debug.cpu#1.cpu=
_load[1]
       150 =C2=B114%     -44.8%         83 =C2=B117%  sched_debug.cpu#1.cpu=
_load[4]
       117 =C2=B121%     -62.7%         43 =C2=B138%  sched_debug.cpu#9.cpu=
_load[2]
       104 =C2=B118%     -60.7%         41 =C2=B132%  sched_debug.cpu#9.cpu=
_load[1]
    224950 =C2=B114%     -67.8%      72354 =C2=B130%  sched_debug.cpu#9.sch=
ed_goidle
        95 =C2=B117%     -56.1%         42 =C2=B124%  sched_debug.cfs_rq[9]=
:/.load
 3.634e+08 =C2=B1 3%      -8.0%  3.343e+08 =C2=B1 5%  proc-vmstat.pgalloc_n=
ormal
     38481 =C2=B114%     -27.7%      27816 =C2=B1 0%  sched_debug.cfs_rq[1]=
:/.exec_clock
      3095 =C2=B1 9%    +114.8%       6648 =C2=B1 6%  sched_debug.cpu#17.tt=
wu_count
       101 =C2=B128%     -62.2%         38 =C2=B129%  sched_debug.cpu#9.load
    116290 =C2=B121%     -63.1%      42940 =C2=B135%  sched_debug.cfs_rq[9]=
:/.min_vruntime
       318 =C2=B1 6%     -53.0%        149 =C2=B1 7%  sched_debug.cfs_rq[1]=
:/.tg_runnable_contrib
       195 =C2=B1 3%     -47.7%        102 =C2=B110%  sched_debug.cpu#0.cpu=
_load[0]
     14526 =C2=B1 7%     -52.8%       6853 =C2=B1 7%  sched_debug.cfs_rq[1]=
:/.avg->runnable_avg_sum
       195 =C2=B1 4%     -50.0%         97 =C2=B113%  sched_debug.cfs_rq[0]=
:/.tg_load_contrib
      4452 =C2=B116%    +104.1%       9084 =C2=B115%  sched_debug.cpu#28.tt=
wu_count
       109 =C2=B111%     -39.4%         66 =C2=B131%  sched_debug.cpu#1.cpu=
_load[0]
      5937 =C2=B1 8%     +45.3%       8626 =C2=B1 7%  sched_debug.cpu#17.sc=
hed_count
      2727 =C2=B129%     -39.7%       1644 =C2=B115%  sched_debug.cfs_rq[30=
]:/.min_vruntime
        93 =C2=B114%     +47.3%        137 =C2=B112%  sched_debug.cpu#27.tt=
wu_local
       110 =C2=B114%     -53.3%         51 =C2=B115%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
       509 =C2=B120%     +57.1%        799 =C2=B118%  sched_debug.cpu#28.tt=
wu_local
    180930 =C2=B117%     -48.4%      93315 =C2=B1 8%  sched_debug.cpu#1.sch=
ed_goidle
       529 =C2=B1 7%     -47.8%        276 =C2=B112%  sched_debug.cfs_rq[0]=
:/.tg_runnable_contrib
       106 =C2=B117%     -58.0%         44 =C2=B110%  sched_debug.cfs_rq[1]=
:/.runnable_load_avg
     24335 =C2=B1 7%     -47.9%      12681 =C2=B112%  sched_debug.cfs_rq[0]=
:/.avg->runnable_avg_sum
       116 =C2=B116%     -59.6%         47 =C2=B110%  sched_debug.cfs_rq[1]=
:/.load
      1050 =C2=B128%     -61.4%        405 =C2=B124%  sched_debug.cpu#9.cur=
r->pid
     81635 =C2=B1 5%      -7.0%      75959 =C2=B1 4%  sched_debug.cpu#19.nr=
_load_updates
      2611 =C2=B1 7%     -29.7%       1834 =C2=B119%  sched_debug.cpu#3.ttw=
u_local
      2454 =C2=B110%     +20.0%       2944 =C2=B1 1%  sched_debug.cpu#17.sc=
hed_goidle
    201182 =C2=B117%     -48.1%     104439 =C2=B110%  sched_debug.cpu#0.ttw=
u_count
       997 =C2=B122%     +34.2%       1338 =C2=B120%  proc-vmstat.numa_hint=
_faults_local
    362192 =C2=B117%     -48.1%     187835 =C2=B1 8%  sched_debug.cpu#1.nr_=
switches
      1093 =C2=B1 8%     +72.8%       1889 =C2=B1 7%  sched_debug.cpu#17.tt=
wu_local
       105 =C2=B1 9%     -51.9%         50 =C2=B1 9%  sched_debug.cpu#1.load
      5926 =C2=B1 8%     +35.7%       8040 =C2=B1 2%  sched_debug.cpu#17.nr=
_switches
    566873 =C2=B113%     +29.7%     735000 =C2=B1 8%  sched_debug.cpu#1.avg=
_idle
       112 =C2=B121%     -62.5%         42 =C2=B126%  sched_debug.cfs_rq[9]=
:/.tg_load_contrib
      3534 =C2=B115%     +35.8%       4798 =C2=B1 9%  sched_debug.cfs_rq[21=
]:/.min_vruntime
      1085 =C2=B1 8%     -55.1%        487 =C2=B1 7%  sched_debug.cpu#1.cur=
r->pid
    105312 =C2=B1 9%     -17.5%      86874 =C2=B1 5%  sched_debug.cpu#9.nr_=
load_updates
      3473 =C2=B111%     +62.3%       5636 =C2=B114%  sched_debug.cfs_rq[28=
]:/.min_vruntime
       822 =C2=B1 8%     +74.0%       1430 =C2=B119%  sched_debug.cpu#19.tt=
wu_count
    380149 =C2=B118%     -47.1%     201060 =C2=B1 7%  sched_debug.cpu#1.sch=
ed_count
       134 =C2=B123%     -64.9%         47 =C2=B143%  sched_debug.cpu#9.cpu=
_load[3]
     97430 =C2=B1 3%     -10.0%      87706 =C2=B1 6%  sched_debug.cpu#1.nr_=
load_updates
     84743 =C2=B116%     -24.2%      64197 =C2=B1 1%  sched_debug.cfs_rq[1]=
:/.min_vruntime
        65 =C2=B1 9%     +62.9%        107 =C2=B130%  sched_debug.cpu#31.tt=
wu_local
     93974 =C2=B1 9%     -13.1%      81632 =C2=B1 7%  sched_debug.cpu#10.nr=
_load_updates
    970168 =C2=B1 4%      -4.7%     925055 =C2=B1 5%  sched_debug.cpu#6.avg=
_idle
  99271909 =C2=B111%     +46.2%  1.451e+08 =C2=B1 5%  cpuidle.C1-SNB.time
       101 =C2=B115%     -58.7%         42 =C2=B126%  sched_debug.cpu#9.cpu=
_load[0]
     82245 =C2=B114%     -37.9%      51114 =C2=B114%  sched_debug.cpu#0.nr_=
load_updates
     34310 =C2=B1 3%     +24.7%      42799 =C2=B1 8%  softirqs.RCU
       149 =C2=B124%     -65.8%         51 =C2=B145%  sched_debug.cpu#9.cpu=
_load[4]
     79674 =C2=B114%     -41.6%      46569 =C2=B114%  sched_debug.cfs_rq[0]=
:/.exec_clock
    166507 =C2=B114%     -33.4%     110946 =C2=B1 9%  sched_debug.cfs_rq[0]=
:/.min_vruntime
        88 =C2=B116%     -56.4%         38 =C2=B125%  sched_debug.cfs_rq[9]=
:/.runnable_load_avg
     87747 =C2=B1 7%      -8.1%      80678 =C2=B1 6%  sched_debug.cpu#11.nr=
_load_updates
      1185 =C2=B132%     -41.6%        693 =C2=B1 6%  sched_debug.cpu#18.sc=
hed_goidle
     85483 =C2=B1 6%      -6.9%      79608 =C2=B1 4%  sched_debug.cpu#12.nr=
_load_updates
       731 =C2=B1 0%     +25.5%        917 =C2=B1 9%  slabinfo.blkdev_reque=
sts.active_objs
       731 =C2=B1 0%     +25.5%        917 =C2=B1 9%  slabinfo.blkdev_reque=
sts.num_objs
       748 =C2=B118%     +26.9%        950 =C2=B1 7%  sched_debug.cpu#26.sc=
hed_goidle
     58322 =C2=B113%     +22.4%      71395 =C2=B1 6%  sched_debug.cpu#2.nr_=
load_updates
    300852 =C2=B1 3%     -22.5%     233044 =C2=B1 2%  cpuidle.C7-SNB.usage
    571714 =C2=B1 5%     +24.2%     710013 =C2=B1 9%  sched_debug.cpu#9.avg=
_idle
     10.29 =C2=B1 5%      +9.3%      11.25 =C2=B1 2%  turbostat.%c1
       742 =C2=B1 2%     +22.6%        910 =C2=B1 7%  slabinfo.xfs_buf.num_=
objs
       742 =C2=B1 2%     +22.6%        910 =C2=B1 7%  slabinfo.xfs_buf.acti=
ve_objs
       383 =C2=B1 5%     +14.9%        441 =C2=B1 5%  numa-vmstat.node1.nr_=
page_table_pages
      1533 =C2=B1 4%     +15.4%       1769 =C2=B1 6%  numa-meminfo.node1.Pa=
geTables
       524 =C2=B1 3%     -14.4%        448 =C2=B1 9%  numa-vmstat.node0.nr_=
page_table_pages
      2081 =C2=B1 3%     -13.8%       1794 =C2=B1 9%  numa-meminfo.node0.Pa=
geTables
     12203 =C2=B1 4%      +6.3%      12970 =C2=B1 2%  slabinfo.kmalloc-256.=
num_objs
       546 =C2=B124%   +2329.3%      13280 =C2=B1 8%  time.involuntary_cont=
ext_switches
      1827 =C2=B1 5%     +23.9%       2263 =C2=B114%  time.minor_page_faults
      3166 =C2=B1 0%      -5.8%       2984 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: xps2/pigz/100%-128K

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
         3 =C2=B127%    +500.0%         18 =C2=B116%  sched_debug.cfs_rq[7]=
:/.nr_spread_over
        10 =C2=B1 4%     -71.0%          3 =C2=B127%  sched_debug.cfs_rq[4]=
:/.nr_spread_over
       575 =C2=B144%     +75.4%       1009 =C2=B114%  sched_debug.cfs_rq[5]=
:/.tg_load_contrib
         2 =C2=B1 0%    +116.7%          4 =C2=B110%  sched_debug.cfs_rq[0]=
:/.nr_spread_over
       116 =C2=B1 5%     +19.4%        139 =C2=B1 6%  sched_debug.cfs_rq[7]=
:/.load
         8 =C2=B130%     +50.0%         13 =C2=B116%  sched_debug.cfs_rq[5]=
:/.nr_spread_over
       114 =C2=B1 2%     +11.4%        127 =C2=B1 3%  sched_debug.cfs_rq[7]=
:/.runnable_load_avg
        10 =C2=B1 4%     +18.8%         12 =C2=B1 3%  cpuidle.POLL.usage
       115 =C2=B1 3%     +24.1%        142 =C2=B1 4%  sched_debug.cpu#7.load
       111 =C2=B1 4%      +9.9%        122 =C2=B1 1%  sched_debug.cpu#5.cpu=
_load[1]
       109 =C2=B1 4%     +11.6%        122 =C2=B1 1%  sched_debug.cpu#5.cpu=
_load[2]
       303 =C2=B114%     -31.0%        209 =C2=B126%  sched_debug.cfs_rq[1]=
:/.blocked_load_avg
       109 =C2=B1 3%     +10.7%        120 =C2=B1 1%  sched_debug.cpu#5.cpu=
_load[3]
     11242 =C2=B139%     -46.6%       6002 =C2=B127%  sched_debug.cpu#2.sch=
ed_goidle
       109 =C2=B1 3%      +8.6%        118 =C2=B1 1%  sched_debug.cpu#5.cpu=
_load[4]
      5622 =C2=B124%     +78.6%      10041 =C2=B116%  sched_debug.cpu#0.sch=
ed_goidle
       113 =C2=B1 1%     +12.6%        128 =C2=B1 6%  sched_debug.cpu#7.cpu=
_load[1]
      2051 =C2=B1 2%     -21.3%       1614 =C2=B116%  slabinfo.kmalloc-256.=
active_objs
      1428 =C2=B111%     -20.1%       1140 =C2=B1 4%  cpuidle.C6-NHM.usage
       966 =C2=B1 3%     +23.2%       1190 =C2=B1 4%  slabinfo.kmalloc-96.a=
ctive_objs
       966 =C2=B1 3%     +23.2%       1190 =C2=B1 4%  slabinfo.kmalloc-96.n=
um_objs
       112 =C2=B1 0%     +16.0%        130 =C2=B1 5%  sched_debug.cpu#7.cpu=
_load[0]
      2244 =C2=B1 3%     -12.3%       1969 =C2=B1 6%  slabinfo.kmalloc-256.=
num_objs

testbox/testcase/testparams: lkp-a05/iperf/300s-tcp

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
      8639 =C2=B1 6%     -55.0%       3890 =C2=B111%  cpuidle.POLL.time
       324 =C2=B112%     +23.4%        400 =C2=B1 1%  sched_debug.cfs_rq[3]=
:/.blocked_load_avg
       351 =C2=B1 5%     -34.7%        229 =C2=B1 6%  cpuidle.POLL.usage
       538 =C2=B111%     +21.3%        653 =C2=B1 4%  sched_debug.cfs_rq[3]=
:/.tg_load_contrib
       188 =C2=B1 8%     +17.2%        221 =C2=B1 8%  sched_debug.cpu#3.cpu=
_load[3]
      2271 =C2=B1 5%     +15.9%       2632 =C2=B1 7%  sched_debug.cpu#1.cur=
r->pid
      6143 =C2=B1 6%     -20.8%       4864 =C2=B1 5%  cpuidle.C2-ATM.usage
       168 =C2=B1 9%     +23.0%        207 =C2=B1 7%  sched_debug.cpu#3.cpu=
_load[4]
   4822666 =C2=B1 6%     -20.7%    3824022 =C2=B1 5%  cpuidle.C4-ATM.time
      2978 =C2=B1 1%     -25.4%       2221 =C2=B1 4%  cpuidle.C4-ATM.usage
    135546 =C2=B1 4%      -7.4%     125521 =C2=B1 1%  sched_debug.cpu#2.nr_=
load_updates
     44960 =C2=B1 5%     -24.3%      34026 =C2=B1 2%  softirqs.SCHED
     59568 =C2=B1 1%     -22.3%      46262 =C2=B1 4%  cpuidle.C6-ATM.usage
     31677 =C2=B1 0%     +42.5%      45147 =C2=B1 1%  time.involuntary_cont=
ext_switches

testbox/testcase/testparams: lkp-sb03/nepim/300s-100%-tcp6

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
   -175469 =C2=B1-9%     -45.6%     -95473 =C2=B1-2%  sched_debug.cfs_rq[24=
]:/.spread0
   -171833 =C2=B1-9%     -45.1%     -94396 =C2=B1-3%  sched_debug.cfs_rq[21=
]:/.spread0
   -175185 =C2=B1-9%     -46.3%     -94082 =C2=B1-4%  sched_debug.cfs_rq[30=
]:/.spread0
      9641 =C2=B129%    +510.9%      58903 =C2=B113%  sched_debug.cfs_rq[12=
]:/.min_vruntime
      2277 =C2=B128%   +1040.1%      25970 =C2=B115%  sched_debug.cfs_rq[12=
]:/.exec_clock
   -167372 =C2=B1-10%     -60.2%     -66538 =C2=B1-5%  sched_debug.cfs_rq[1=
4]:/.spread0
   -167598 =C2=B1-11%     -75.7%     -40731 =C2=B1-14%  sched_debug.cfs_rq[=
12]:/.spread0
      7439 =C2=B114%    +635.8%      54741 =C2=B121%  sched_debug.cfs_rq[15=
]:/.min_vruntime
   -169801 =C2=B1-9%     -73.6%     -44894 =C2=B1-31%  sched_debug.cfs_rq[1=
5]:/.spread0
   -168310 =C2=B1-9%     -46.6%     -89926 =C2=B1-2%  sched_debug.cfs_rq[17=
]:/.spread0
   -174844 =C2=B1-9%     -44.5%     -96979 =C2=B1-3%  sched_debug.cfs_rq[23=
]:/.spread0
   -173449 =C2=B1-9%     -45.2%     -95119 =C2=B1-2%  sched_debug.cfs_rq[18=
]:/.spread0
   -167940 =C2=B1-9%     -47.1%     -88900 =C2=B1-2%  sched_debug.cfs_rq[25=
]:/.spread0
   -174120 =C2=B1-9%     -44.6%     -96498 =C2=B1-2%  sched_debug.cfs_rq[29=
]:/.spread0
   -173030 =C2=B1-8%     -44.8%     -95548 =C2=B1-2%  sched_debug.cfs_rq[31=
]:/.spread0
     90.71 =C2=B147%   +1113.5%    1100.77 =C2=B1 7%  sched_debug.cfs_rq[24=
]:/.exec_clock
   -172929 =C2=B1-9%     -44.0%     -96907 =C2=B1-3%  sched_debug.cfs_rq[22=
]:/.spread0
    -79197 =C2=B1-12%     -25.9%     -58693 =C2=B1-10%  sched_debug.cfs_rq[=
1]:/.spread0
   -152042 =C2=B1-8%     -38.2%     -93998 =C2=B1-3%  sched_debug.cfs_rq[5]=
:/.spread0
   -160250 =C2=B1-10%     -50.3%     -79621 =C2=B1-4%  sched_debug.cfs_rq[3=
]:/.spread0
   -173703 =C2=B1-9%     -44.5%     -96326 =C2=B1-2%  sched_debug.cfs_rq[19=
]:/.spread0
   -161707 =C2=B1-6%     -46.3%     -86771 =C2=B1-1%  sched_debug.cfs_rq[2]=
:/.spread0
   -170621 =C2=B1-10%     -47.6%     -89343 =C2=B1-3%  sched_debug.cfs_rq[2=
0]:/.spread0
   -167504 =C2=B1-10%     -42.7%     -95923 =C2=B1-2%  sched_debug.cfs_rq[6=
]:/.spread0
   -171102 =C2=B1-8%     -51.3%     -83293 =C2=B1-13%  sched_debug.cfs_rq[2=
6]:/.spread0
   -172487 =C2=B1-10%     -44.0%     -96550 =C2=B1-1%  sched_debug.cfs_rq[1=
6]:/.spread0
   -172553 =C2=B1-9%     -46.1%     -92991 =C2=B1-2%  sched_debug.cfs_rq[27=
]:/.spread0
   -162867 =C2=B1-7%     -74.9%     -40947 =C2=B1-16%  sched_debug.cfs_rq[1=
3]:/.spread0
      3582 =C2=B124%     -92.2%        277 =C2=B145%  sched_debug.cpu#5.ttw=
u_local
         1 =C2=B135%    +825.0%         12 =C2=B1 7%  sched_debug.cpu#26.cp=
u_load[1]
   -166730 =C2=B1-11%     -45.7%     -90466 =C2=B1-1%  sched_debug.cfs_rq[4=
]:/.spread0
   -170615 =C2=B1-9%     -45.1%     -93612 =C2=B1-1%  sched_debug.cfs_rq[7]=
:/.spread0
   -170862 =C2=B1-10%     -45.6%     -92877 =C2=B1-3%  sched_debug.cfs_rq[2=
8]:/.spread0
      2409 =C2=B1 7%     -93.0%        169 =C2=B124%  sched_debug.cpu#7.ttw=
u_local
      2923 =C2=B129%     -66.4%        983 =C2=B137%  sched_debug.cpu#12.tt=
wu_local
        -6 =C2=B1-18%     -70.0%         -2 =C2=B1-40%  sched_debug.cpu#9.n=
r_uninterruptible
      3067 =C2=B138%     -68.0%        982 =C2=B130%  sched_debug.cpu#14.tt=
wu_local
      2931 =C2=B1 7%     -81.3%        547 =C2=B140%  sched_debug.cpu#4.ttw=
u_local
      4447 =C2=B115%     -37.3%       2790 =C2=B119%  sched_debug.cpu#15.tt=
wu_local
    -77693 =C2=B1-33%     -68.9%     -24161 =C2=B1-39%  sched_debug.cfs_rq[=
9]:/.spread0
   -154541 =C2=B1-17%     -73.6%     -40812 =C2=B1-16%  sched_debug.cfs_rq[=
10]:/.spread0
         2 =C2=B140%   +7216.7%        146 =C2=B113%  sched_debug.cfs_rq[13=
]:/.tg_runnable_contrib
        38 =C2=B139%     -55.3%         17 =C2=B129%  sched_debug.cfs_rq[3]=
:/.tg_runnable_contrib
      1771 =C2=B138%     -53.8%        818 =C2=B126%  sched_debug.cfs_rq[3]=
:/.avg->runnable_avg_sum
      5503 =C2=B114%    +988.7%      59913 =C2=B143%  sched_debug.cpu#15.tt=
wu_count
        30 =C2=B112%     -31.9%         20 =C2=B118%  sched_debug.cpu#25.nr=
_uninterruptible
        15 =C2=B1 6%     +42.6%         22 =C2=B116%  sched_debug.cpu#17.nr=
_uninterruptible
         0 =C2=B1 0%      +Inf%         62 =C2=B111%  sched_debug.cpu#13.cp=
u_load[4]
         0 =C2=B1 0%      +Inf%         56 =C2=B110%  sched_debug.cpu#13.cp=
u_load[3]
         1 =C2=B1 0%    +133.3%          2 =C2=B120%  sched_debug.cfs_rq[20=
]:/.nr_spread_over
      7389 =C2=B112%     +26.6%       9356 =C2=B1 7%  sched_debug.cpu#25.nr=
_switches
      7939 =C2=B123%     -87.0%       1036 =C2=B111%  sched_debug.cpu#5.ttw=
u_count
      3883 =C2=B119%     -80.8%        745 =C2=B111%  sched_debug.cpu#7.ttw=
u_count
       423 =C2=B1 6%    +151.3%       1063 =C2=B142%  sched_debug.cpu#31.tt=
wu_count
       131 =C2=B135%   +5024.7%       6713 =C2=B113%  sched_debug.cfs_rq[13=
]:/.avg->runnable_avg_sum
         5 =C2=B1 8%    +150.0%         13 =C2=B115%  sched_debug.cpu#26.cp=
u_load[2]
      6749 =C2=B1 7%     -94.9%        342 =C2=B1 8%  sched_debug.cfs_rq[5]=
:/.exec_clock
  46851.02 =C2=B110%     -25.0%   35154.20 =C2=B115%  sched_debug.cfs_rq[9]=
:/.exec_clock
      9868 =C2=B124%    +235.4%      33097 =C2=B1 9%  sched_debug.cfs_rq[14=
]:/.min_vruntime
     14373 =C2=B134%    +308.3%      58688 =C2=B111%  sched_debug.cfs_rq[13=
]:/.min_vruntime
         3 =C2=B112%    +318.2%         15 =C2=B111%  sched_debug.cpu#26.cp=
u_load[4]
      7007 =C2=B123%    +296.6%      27792 =C2=B133%  sched_debug.cfs_rq[11=
]:/.exec_clock
     33105 =C2=B134%    +116.4%      71634 =C2=B115%  sched_debug.cpu#14.sc=
hed_count
      5012 =C2=B123%     -65.6%       1725 =C2=B113%  sched_debug.cpu#4.ttw=
u_count
     21902 =C2=B123%    +520.5%     135902 =C2=B148%  sched_debug.cpu#8.sch=
ed_count
      1941 =C2=B132%     +89.7%       3683 =C2=B136%  sched_debug.cpu#21.sc=
hed_count
        28 =C2=B141%     -77.9%          6 =C2=B114%  sched_debug.cfs_rq[2]=
:/.tg_runnable_contrib
         0 =C2=B1 0%      +Inf%         76 =C2=B131%  sched_debug.cpu#11.cp=
u_load[4]
     27194 =C2=B144%    +219.6%      86905 =C2=B1 7%  sched_debug.cpu#15.nr=
_switches
        60 =C2=B1 8%    +229.7%        200 =C2=B131%  sched_debug.cpu#30.tt=
wu_local
      3322 =C2=B1 7%     -27.6%       2404 =C2=B130%  sched_debug.cpu#28.sc=
hed_count
       174 =C2=B116%     -53.2%         81 =C2=B118%  sched_debug.cpu#0.load
    497648 =C2=B1 8%     -49.7%     250454 =C2=B110%  sched_debug.cpu#9.sch=
ed_count
      3023 =C2=B115%     -84.8%        459 =C2=B119%  sched_debug.cpu#2.ttw=
u_local
         5 =C2=B1 8%    +158.8%         14 =C2=B114%  sched_debug.cpu#26.cp=
u_load[3]
     13564 =C2=B144%    +210.7%      42148 =C2=B1 8%  sched_debug.cpu#15.sc=
hed_goidle
      1158 =C2=B113%     -53.9%        534 =C2=B111%  sched_debug.cpu#29.tt=
wu_count
    278319 =C2=B111%     -55.5%     123957 =C2=B1 8%  sched_debug.cpu#8.ttw=
u_count
        70 =C2=B133%     +74.8%        122 =C2=B1 7%  sched_debug.cpu#24.tt=
wu_local
      3732 =C2=B1 5%     +72.0%       6419 =C2=B1 7%  sched_debug.cpu#25.tt=
wu_count
       760 =C2=B1 5%    +134.8%       1784 =C2=B143%  sched_debug.cpu#27.nr=
_switches
        25 =C2=B119%    -100.0%          0 =C2=B1 0%  sched_debug.cfs_rq[9]=
:/.blocked_load_avg
      1546 =C2=B117%     -28.4%       1107 =C2=B130%  sched_debug.cpu#29.sc=
hed_count
       138 =C2=B1 3%     -60.5%         54 =C2=B115%  sched_debug.cpu#28.cp=
u_load[2]
        94 =C2=B1 2%     -53.9%         43 =C2=B1 9%  sched_debug.cpu#28.cp=
u_load[3]
       174 =C2=B116%     -53.2%         81 =C2=B118%  sched_debug.cfs_rq[0]=
:/.load
      1652 =C2=B112%     -52.8%        779 =C2=B120%  sched_debug.cpu#0.cur=
r->pid
      1315 =C2=B111%     +52.1%       2000 =C2=B1 3%  sched_debug.cpu#25.tt=
wu_local
       164 =C2=B132%   +2186.6%       3757 =C2=B113%  sched_debug.cpu#24.tt=
wu_count
     35074 =C2=B116%    +169.1%      94384 =C2=B1 8%  sched_debug.cpu#15.sc=
hed_count
      6458 =C2=B141%     -66.4%       2172 =C2=B133%  sched_debug.cpu#1.ttw=
u_count
         3 =C2=B112%   +1509.1%         59 =C2=B136%  sched_debug.cfs_rq[11=
]:/.runnable_load_avg
     84863 =C2=B1 5%     -44.2%      47316 =C2=B1 6%  sched_debug.cfs_rq[8]=
:/.exec_clock
  11542079 =C2=B1 8%     -63.6%    4201723 =C2=B1 7%  numa-vmstat.node0.num=
a_local
        55 =C2=B1 2%     -37.3%         34 =C2=B1 3%  sched_debug.cpu#28.cp=
u_load[4]
  11597631 =C2=B1 8%     -63.3%    4257210 =C2=B1 7%  numa-vmstat.node0.num=
a_hit
     20087 =C2=B126%    +532.6%     127072 =C2=B142%  sched_debug.cpu#8.nr_=
switches
      6826 =C2=B122%     -73.1%       1837 =C2=B111%  sched_debug.cpu#2.ttw=
u_count
     14685 =C2=B123%     -57.7%       6217 =C2=B1 9%  sched_debug.cpu#6.nr_=
switches
    181370 =C2=B1 5%     -44.3%     100933 =C2=B110%  sched_debug.cfs_rq[8]=
:/.min_vruntime
       166 =C2=B1 4%     -61.2%         64 =C2=B115%  sched_debug.cpu#28.cp=
u_load[1]
       246 =C2=B115%     -43.2%        140 =C2=B113%  sched_debug.cpu#0.cpu=
_load[2]
      1333 =C2=B140%     -76.4%        314 =C2=B112%  sched_debug.cfs_rq[2]=
:/.avg->runnable_avg_sum
       171 =C2=B114%     -52.8%         80 =C2=B119%  sched_debug.cfs_rq[0]=
:/.runnable_load_avg
      3309 =C2=B1 7%     -27.7%       2392 =C2=B130%  sched_debug.cpu#28.nr=
_switches
       271 =C2=B113%     -39.1%        165 =C2=B112%  sched_debug.cpu#0.cpu=
_load[3]
       136 =C2=B112%    +138.0%        325 =C2=B128%  sched_debug.cfs_rq[20=
]:/.blocked_load_avg
      9301 =C2=B1 8%     +15.4%      10734 =C2=B112%  sched_debug.cfs_rq[25=
]:/.min_vruntime
         0 =C2=B1 0%      +Inf%         71 =C2=B131%  sched_debug.cpu#11.cp=
u_load[3]
        26 =C2=B1 8%    +556.4%        170 =C2=B130%  sched_debug.cfs_rq[11=
]:/.tg_runnable_contrib
    489684 =C2=B1 7%     -50.7%     241248 =C2=B113%  sched_debug.cpu#9.nr_=
switches
      1243 =C2=B1 8%    +532.9%       7868 =C2=B130%  sched_debug.cfs_rq[11=
]:/.avg->runnable_avg_sum
      8102 =C2=B117%     -63.3%       2974 =C2=B1 8%  sched_debug.cpu#5.sch=
ed_goidle
       168 =C2=B1 5%     -60.1%         67 =C2=B112%  sched_debug.cpu#28.cp=
u_load[0]
      8079 =C2=B112%    +912.4%      81796 =C2=B1 9%  sched_debug.cpu#12.sc=
hed_goidle
        11 =C2=B1 7%    +248.5%         38 =C2=B1 7%  sched_debug.cfs_rq[26=
]:/.tg_runnable_contrib
        67 =C2=B115%     +93.0%        129 =C2=B130%  sched_debug.cpu#22.tt=
wu_local
       525 =C2=B1 7%    +244.4%       1809 =C2=B1 7%  sched_debug.cfs_rq[26=
]:/.avg->runnable_avg_sum
       217 =C2=B117%     -48.2%        112 =C2=B115%  sched_debug.cpu#0.cpu=
_load[1]
      7318 =C2=B123%     -58.1%       3069 =C2=B1 9%  sched_debug.cpu#6.sch=
ed_goidle
     20346 =C2=B141%    +576.0%     137537 =C2=B113%  sched_debug.cpu#13.nr=
_switches
      9915 =C2=B126%    +506.6%      60151 =C2=B146%  sched_debug.cpu#8.sch=
ed_goidle
      7317 =C2=B123%    +925.4%      75030 =C2=B149%  sched_debug.cpu#11.tt=
wu_count
         7 =C2=B123%    +228.6%         23 =C2=B132%  sched_debug.cfs_rq[21=
]:/.tg_runnable_contrib
      3075 =C2=B113%     +16.2%       3572 =C2=B110%  sched_debug.cpu#25.sc=
hed_goidle
       239 =C2=B1 8%     -71.4%         68 =C2=B141%  sched_debug.cfs_rq[29=
]:/.blocked_load_avg
  17742699 =C2=B1 8%     -62.8%    6609108 =C2=B1 4%  proc-vmstat.pgalloc_d=
ma32
       240 =C2=B1 9%     -71.6%         68 =C2=B141%  sched_debug.cfs_rq[29=
]:/.tg_load_contrib
       185 =C2=B1 3%     -51.7%         89 =C2=B126%  sched_debug.cfs_rq[8]=
:/.load
       289 =C2=B113%     -35.1%        187 =C2=B113%  sched_debug.cpu#0.cpu=
_load[4]
       185 =C2=B1 3%     -51.7%         89 =C2=B117%  sched_debug.cpu#8.load
     16302 =C2=B117%     -63.0%       6038 =C2=B1 8%  sched_debug.cpu#5.nr_=
switches
       108 =C2=B118%     -27.9%         78 =C2=B125%  sched_debug.cpu#9.cpu=
_load[2]
      1230 =C2=B121%     -45.9%        665 =C2=B116%  sched_debug.cpu#31.sc=
hed_count
     10134 =C2=B141%    +569.8%      67883 =C2=B113%  sched_debug.cpu#13.sc=
hed_goidle
       100 =C2=B117%     -31.6%         68 =C2=B124%  sched_debug.cpu#9.cpu=
_load[1]
    244283 =C2=B1 7%     -51.0%     119587 =C2=B113%  sched_debug.cpu#9.sch=
ed_goidle
      3263 =C2=B1 7%     -58.9%       1342 =C2=B124%  sched_debug.cpu#28.cu=
rr->pid
       168 =C2=B1 5%     -60.1%         67 =C2=B112%  sched_debug.cfs_rq[28=
]:/.runnable_load_avg
       168 =C2=B1 5%     -59.6%         68 =C2=B114%  sched_debug.cfs_rq[28=
]:/.load
      1378 =C2=B1 7%     -32.4%        931 =C2=B131%  sched_debug.cpu#28.sc=
hed_goidle
     45204 =C2=B1 7%     -62.7%      16868 =C2=B113%  sched_debug.cfs_rq[1]=
:/.exec_clock
      3177 =C2=B1 6%     +77.9%       5650 =C2=B1 5%  sched_debug.cpu#17.tt=
wu_count
       168 =C2=B1 5%     -59.6%         68 =C2=B114%  sched_debug.cpu#28.lo=
ad
      1592 =C2=B1 4%     +44.3%       2298 =C2=B1 4%  sched_debug.cpu#20.sc=
hed_goidle
      1217 =C2=B121%     -46.4%        653 =C2=B116%  sched_debug.cpu#31.nr=
_switches
       282 =C2=B1 8%     +68.1%        474 =C2=B1 9%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
     99546 =C2=B110%     -24.2%      75473 =C2=B112%  sched_debug.cfs_rq[9]=
:/.min_vruntime
      9735 =C2=B143%     -61.9%       3711 =C2=B113%  sched_debug.cfs_rq[6]=
:/.min_vruntime
       355 =C2=B122%    +209.9%       1101 =C2=B130%  sched_debug.cfs_rq[21=
]:/.avg->runnable_avg_sum
       260 =C2=B126%     +41.7%        368 =C2=B122%  sched_debug.cfs_rq[21=
]:/.tg_load_contrib
     56733 =C2=B144%     +84.8%     104825 =C2=B132%  sched_debug.cpu#11.sc=
hed_count
       193 =C2=B119%     -50.0%         96 =C2=B119%  sched_debug.cpu#0.cpu=
_load[0]
     29282 =C2=B117%     -28.6%      20906 =C2=B1 8%  sched_debug.cpu#0.nr_=
switches
      1022 =C2=B113%     -67.3%        333 =C2=B110%  sched_debug.cfs_rq[6]=
:/.exec_clock
       177 =C2=B114%     -49.9%         88 =C2=B112%  sched_debug.cfs_rq[0]=
:/.tg_load_contrib
       567 =C2=B123%     -49.5%        286 =C2=B119%  sched_debug.cpu#31.sc=
hed_goidle
      6500 =C2=B113%     -19.3%       5245 =C2=B1 3%  sched_debug.cpu#3.ttw=
u_count
     16269 =C2=B112%    +916.1%     165305 =C2=B1 8%  sched_debug.cpu#12.nr=
_switches
      1772 =C2=B114%    +134.8%       4162 =C2=B1 3%  sched_debug.cfs_rq[24=
]:/.min_vruntime
      5866 =C2=B1 4%     +28.6%       7544 =C2=B1 5%  sched_debug.cpu#17.sc=
hed_count
     79126 =C2=B1 2%      +6.8%      84535 =C2=B1 3%  sched_debug.cpu#24.nr=
_load_updates
      2058 =C2=B118%    +169.8%       5553 =C2=B142%  sched_debug.cfs_rq[30=
]:/.min_vruntime
       127 =C2=B1 7%     -50.3%         63 =C2=B129%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
       536 =C2=B1 8%     -32.8%        360 =C2=B121%  sched_debug.cpu#28.tt=
wu_local
     11834 =C2=B125%     -58.5%       4905 =C2=B1 7%  sched_debug.cpu#7.nr_=
switches
     32497 =C2=B138%     -40.8%      19232 =C2=B130%  sched_debug.cpu#2.nr_=
switches
     16058 =C2=B139%     -40.9%       9484 =C2=B131%  sched_debug.cpu#2.sch=
ed_goidle
      5899 =C2=B126%     -58.9%       2424 =C2=B1 7%  sched_debug.cpu#7.sch=
ed_goidle
    230137 =C2=B1 3%     -66.7%      76736 =C2=B1 9%  sched_debug.cpu#1.sch=
ed_goidle
       507 =C2=B112%     -49.9%        254 =C2=B118%  sched_debug.cfs_rq[0]=
:/.tg_runnable_contrib
      3627 =C2=B110%     -45.4%       1980 =C2=B1 0%  meminfo.AnonHugePages
     23190 =C2=B112%     -49.7%      11664 =C2=B118%  sched_debug.cfs_rq[0]=
:/.avg->runnable_avg_sum
      2954 =C2=B1 8%     -47.8%       1543 =C2=B111%  sched_debug.cpu#3.ttw=
u_local
     79091 =C2=B1 2%      +7.2%      84785 =C2=B1 2%  sched_debug.cpu#27.nr=
_load_updates
      2474 =C2=B138%     -44.2%       1381 =C2=B111%  proc-vmstat.numa_hint=
_faults
    244948 =C2=B1 7%     -61.7%      93754 =C2=B1 4%  sched_debug.cpu#0.ttw=
u_count
     24408 =C2=B1 2%    +154.6%      62149 =C2=B131%  sched_debug.cfs_rq[11=
]:/.min_vruntime
      2521 =C2=B137%     -43.6%       1422 =C2=B110%  proc-vmstat.numa_pte_=
updates
       186 =C2=B1 4%     -49.5%         94 =C2=B123%  sched_debug.cfs_rq[8]=
:/.tg_load_contrib
       535 =C2=B1 6%     +76.0%        941 =C2=B1 0%  sched_debug.cpu#20.tt=
wu_local
       387 =C2=B1 8%     +70.8%        661 =C2=B131%  sched_debug.cpu#22.sc=
hed_goidle
    460655 =C2=B1 3%     -66.6%     153819 =C2=B1 9%  sched_debug.cpu#1.nr_=
switches
      1533 =C2=B118%     -38.6%        940 =C2=B119%  sched_debug.cpu#29.nr=
_switches
      1055 =C2=B115%     +68.2%       1775 =C2=B1 7%  sched_debug.cpu#17.tt=
wu_local
      5854 =C2=B1 4%     +28.6%       7532 =C2=B1 5%  sched_debug.cpu#17.nr=
_switches
    518944 =C2=B1 5%     +46.1%     758059 =C2=B118%  sched_debug.cpu#1.avg=
_idle
     21065 =C2=B1 9%     +10.8%      23341 =C2=B110%  numa-meminfo.node0.Ac=
tive(anon)
       186 =C2=B1 4%     -51.3%         90 =C2=B123%  sched_debug.cpu#8.cpu=
_load[0]
       240 =C2=B1 3%     -53.2%        112 =C2=B128%  sched_debug.cpu#8.cpu=
_load[3]
       215 =C2=B1 3%     -52.5%        102 =C2=B126%  sched_debug.cpu#8.cpu=
_load[2]
       450 =C2=B126%     -44.7%        249 =C2=B132%  sched_debug.cfs_rq[28=
]:/.tg_load_contrib
      3760 =C2=B1 3%     +52.8%       5744 =C2=B1 1%  sched_debug.cpu#20.sc=
hed_count
     12799 =C2=B119%     -45.6%       6960 =C2=B1 7%  sched_debug.cpu#0.sch=
ed_goidle
  23771309 =C2=B1 8%     -62.1%    9017612 =C2=B1 3%  numa-numastat.node0.l=
ocal_node
  23771332 =C2=B1 8%     -62.1%    9017635 =C2=B1 3%  numa-numastat.node0.n=
uma_hit
       531 =C2=B1 0%     -49.2%        270 =C2=B125%  sched_debug.cfs_rq[8]=
:/.tg_runnable_contrib
       193 =C2=B1 3%     -51.5%         94 =C2=B124%  sched_debug.cpu#8.cpu=
_load[1]
     24361 =C2=B1 0%     -49.2%      12377 =C2=B125%  sched_debug.cfs_rq[8]=
:/.avg->runnable_avg_sum
      2525 =C2=B1 8%     -19.6%       2030 =C2=B1 4%  sched_debug.cpu#18.sc=
hed_count
       358 =C2=B1 3%     -45.5%        195 =C2=B132%  sched_debug.cfs_rq[26=
]:/.blocked_load_avg
       358 =C2=B1 3%     -42.8%        205 =C2=B131%  sched_debug.cfs_rq[26=
]:/.tg_load_contrib
      5268 =C2=B1 9%     +10.8%       5836 =C2=B110%  numa-vmstat.node0.nr_=
active_anon
       257 =C2=B1 2%     -52.8%        121 =C2=B128%  sched_debug.cpu#8.cpu=
_load[4]
       836 =C2=B1 8%     +75.8%       1471 =C2=B128%  sched_debug.cpu#22.nr=
_switches
    467556 =C2=B1 3%     -63.2%     172089 =C2=B115%  sched_debug.cpu#1.sch=
ed_count
    100306 =C2=B1 2%      -8.2%      92129 =C2=B1 1%  sched_debug.cpu#1.nr_=
load_updates
  13406964 =C2=B1 9%     +54.8%   20753143 =C2=B1 3%  numa-vmstat.node1.num=
a_local
  13421601 =C2=B1 9%     +54.7%   20768222 =C2=B1 3%  numa-vmstat.node1.num=
a_hit
       201 =C2=B1 8%     +50.4%        303 =C2=B1 5%  sched_debug.cpu#18.tt=
wu_local
     98041 =C2=B1 7%     -58.2%      40940 =C2=B117%  sched_debug.cfs_rq[1]=
:/.min_vruntime
    968087 =C2=B1 3%     -13.4%     838650 =C2=B1 3%  sched_debug.cpu#12.av=
g_idle
     85296 =C2=B1 3%     +13.9%      97133 =C2=B1 1%  sched_debug.cpu#10.nr=
_load_updates
      1822 =C2=B1 7%     -52.6%        863 =C2=B117%  sched_debug.cpu#8.cur=
r->pid
     84101 =C2=B1 1%     +16.2%      97746 =C2=B1 3%  sched_debug.cpu#15.nr=
_load_updates
       100 =C2=B115%     -34.9%         65 =C2=B122%  sched_debug.cpu#9.cpu=
_load[0]
     87101 =C2=B110%     -44.4%      48461 =C2=B1 3%  sched_debug.cpu#0.nr_=
load_updates
     82841 =C2=B1 2%     +10.4%      91426 =C2=B1 1%  sched_debug.cpu#14.nr=
_load_updates
       186 =C2=B1 4%     -53.2%         87 =C2=B126%  sched_debug.cfs_rq[8]=
:/.runnable_load_avg
     83538 =C2=B1 2%     +16.0%      96885 =C2=B1 3%  sched_debug.cpu#13.nr=
_load_updates
     84391 =C2=B1 8%     -48.3%      43669 =C2=B1 4%  sched_debug.cfs_rq[0]=
:/.exec_clock
    987037 =C2=B1 1%     -14.2%     846398 =C2=B1 8%  sched_debug.cpu#13.av=
g_idle
    177237 =C2=B1 9%     -43.8%      99634 =C2=B1 2%  sched_debug.cfs_rq[0]=
:/.min_vruntime
     86370 =C2=B1 4%     +13.7%      98170 =C2=B1 6%  sched_debug.cpu#11.nr=
_load_updates
      1085 =C2=B112%     -21.0%        856 =C2=B1 4%  sched_debug.cpu#18.sc=
hed_goidle
     82842 =C2=B1 1%     +16.7%      96690 =C2=B1 0%  sched_debug.cpu#12.nr=
_load_updates
    128898 =C2=B1 0%     -15.0%     109598 =C2=B1 2%  sched_debug.cpu#8.nr_=
load_updates
    678775 =C2=B1 1%     +23.3%     836906 =C2=B1 7%  sched_debug.cpu#11.av=
g_idle
    997365 =C2=B1 0%     -16.3%     834655 =C2=B1 6%  sched_debug.cpu#8.avg=
_idle
  25575328 =C2=B110%     +56.4%   39987543 =C2=B1 2%  numa-numastat.node1.n=
uma_hit
  25575276 =C2=B110%     +56.4%   39987507 =C2=B1 2%  numa-numastat.node1.l=
ocal_node
       679 =C2=B119%     -39.1%        414 =C2=B121%  sched_debug.cpu#29.sc=
hed_goidle
      3791 =C2=B110%     +19.1%       4515 =C2=B1 2%  sched_debug.cfs_rq[18=
]:/.min_vruntime
      1263 =C2=B1 4%     +13.0%       1427 =C2=B1 5%  sched_debug.cpu#18.tt=
wu_count
     53498 =C2=B1 8%     +42.0%      75956 =C2=B1 4%  sched_debug.cpu#2.nr_=
load_updates
    939453 =C2=B1 4%     -12.6%     821265 =C2=B1 2%  sched_debug.cpu#10.av=
g_idle
    295153 =C2=B1 2%     -15.6%     249216 =C2=B1 1%  cpuidle.C7-SNB.usage
    583842 =C2=B112%     +32.4%     773272 =C2=B1 2%  sched_debug.cpu#9.avg=
_idle
      3748 =C2=B1 3%     +49.5%       5605 =C2=B1 4%  sched_debug.cpu#20.nr=
_switches
      2420 =C2=B111%     -16.7%       2017 =C2=B1 4%  sched_debug.cpu#18.nr=
_switches
     11077 =C2=B1 8%     +19.1%      13188 =C2=B1 3%  slabinfo.kmalloc-256.=
active_objs
       507 =C2=B112%     +25.6%        637 =C2=B110%  slabinfo.buffer_head.=
active_objs
       507 =C2=B112%     +25.6%        637 =C2=B110%  slabinfo.buffer_head.=
num_objs
     16697 =C2=B1 9%     -11.4%      14793 =C2=B110%  slabinfo.vm_area_stru=
ct.num_objs
     16525 =C2=B110%     -11.8%      14577 =C2=B1 9%  slabinfo.vm_area_stru=
ct.active_objs
     11616 =C2=B1 9%     +17.4%      13637 =C2=B1 6%  slabinfo.kmalloc-256.=
num_objs
      1410 =C2=B1 6%     +10.8%       1563 =C2=B1 3%  slabinfo.sock_inode_c=
ache.active_objs
      1410 =C2=B1 6%     +10.8%       1563 =C2=B1 3%  slabinfo.sock_inode_c=
ache.num_objs
       863 =C2=B145%   +1260.1%      11737 =C2=B112%  time.involuntary_cont=
ext_switches
      3167 =C2=B1 0%      -4.9%       3011 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-a05/iperf/300s-udp

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
        21 =C2=B1 7%     -28.1%         15 =C2=B126%  sched_debug.cpu#2.cpu=
_load[4]
      3045 =C2=B111%     -21.1%       2402 =C2=B114%  cpuidle.POLL.time
        41 =C2=B114%     -41.6%         24 =C2=B146%  sched_debug.cpu#2.cpu=
_load[2]
       219 =C2=B119%     -35.3%        142 =C2=B123%  sched_debug.cfs_rq[2]=
:/.blocked_load_avg
        31 =C2=B111%     -36.6%         19 =C2=B137%  sched_debug.cpu#2.cpu=
_load[3]
       256 =C2=B122%     -36.9%        162 =C2=B127%  sched_debug.cfs_rq[2]=
:/.tg_load_contrib
       841 =C2=B1 7%     -13.0%        731 =C2=B1 7%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
       699 =C2=B110%     -16.2%        586 =C2=B111%  sched_debug.cfs_rq[1]=
:/.blocked_load_avg
    518031 =C2=B1 4%     +14.6%     593471 =C2=B1 7%  cpuidle.C2-ATM.time
    126580 =C2=B111%     -28.2%      90853 =C2=B112%  sched_debug.cfs_rq[1]=
:/.min_vruntime
     42977 =C2=B1 6%      -8.3%      39399 =C2=B1 8%  sched_debug.cpu#0.nr_=
load_updates
     37026 =C2=B113%     -31.0%      25539 =C2=B1 4%  softirqs.RCU
      1286 =C2=B1 2%     -26.1%        950 =C2=B1 7%  cpuidle.C2-ATM.usage
     25472 =C2=B1 7%     -23.7%      19445 =C2=B1 2%  softirqs.SCHED
      2017 =C2=B1 5%     -11.5%       1785 =C2=B1 1%  sched_debug.cfs_rq[2]=
:/.tg_load_avg
     87377 =C2=B1 8%     -10.7%      77993 =C2=B1 2%  softirqs.TIMER

testbox/testcase/testparams: lkp-sb03/nepim/300s-25%-udp6

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
   -317754 =C2=B1-1%      -4.0%    -305106 =C2=B1-2%  sched_debug.cfs_rq[11=
]:/.spread0
        14 =C2=B145%    -100.0%          0 =C2=B1 0%  sched_debug.cpu#18.cp=
u_load[0]
   -320520 =C2=B1-1%      -3.2%    -310228 =C2=B1-1%  sched_debug.cfs_rq[19=
]:/.spread0
      2408 =C2=B136%     -79.9%        484 =C2=B113%  sched_debug.cpu#14.tt=
wu_count
   -317961 =C2=B1-1%      -3.7%    -306068 =C2=B1-2%  sched_debug.cfs_rq[13=
]:/.spread0
      1377 =C2=B1 9%     -71.7%        389 =C2=B130%  sched_debug.cpu#5.ttw=
u_local
   -315516 =C2=B1-1%      -4.5%    -301211 =C2=B1-1%  sched_debug.cfs_rq[7]=
:/.spread0
      1644 =C2=B133%     -80.3%        324 =C2=B131%  sched_debug.cpu#7.ttw=
u_local
        -3 =C2=B1-35%     +86.3%         -6 =C2=B1-7%  sched_debug.cpu#14.n=
r_uninterruptible
      2011 =C2=B128%     -92.0%        160 =C2=B127%  sched_debug.cpu#12.tt=
wu_local
      1042 =C2=B141%     -93.0%         73 =C2=B141%  sched_debug.cpu#14.tt=
wu_local
      6624 =C2=B120%    +427.9%      34970 =C2=B149%  sched_debug.cpu#25.sc=
hed_count
      2004 =C2=B118%     -81.8%        364 =C2=B124%  sched_debug.cpu#4.ttw=
u_local
       828 =C2=B120%    +274.7%       3104 =C2=B1 1%  sched_debug.cfs_rq[2]=
:/.exec_clock
      1346 =C2=B115%     -82.0%        242 =C2=B1 4%  sched_debug.cpu#6.ttw=
u_local
      2859 =C2=B133%     -76.8%        662 =C2=B136%  sched_debug.cpu#13.tt=
wu_count
      3677 =C2=B120%     -72.4%       1016 =C2=B127%  sched_debug.cpu#12.tt=
wu_count
      2745 =C2=B1 6%     +90.3%       5223 =C2=B1 2%  sched_debug.cpu#16.tt=
wu_count
      6117 =C2=B1 7%    +471.5%      34961 =C2=B149%  sched_debug.cpu#25.nr=
_switches
      2999 =C2=B113%     -69.9%        902 =C2=B112%  sched_debug.cpu#5.ttw=
u_count
      3415 =C2=B126%     -75.8%        827 =C2=B126%  sched_debug.cpu#7.ttw=
u_count
      4872 =C2=B1 5%     +43.1%       6971 =C2=B1 1%  sched_debug.cpu#16.nr=
_switches
      3900 =C2=B120%     -74.8%        984 =C2=B114%  sched_debug.cpu#4.ttw=
u_count
      8394 =C2=B115%     -35.2%       5441 =C2=B124%  sched_debug.cpu#8.sch=
ed_count
        58 =C2=B122%     +61.0%         94 =C2=B118%  sched_debug.cpu#30.tt=
wu_local
      2669 =C2=B120%     -81.5%        492 =C2=B114%  sched_debug.cpu#2.ttw=
u_local
       807 =C2=B118%     +93.7%       1563 =C2=B1 0%  sched_debug.cpu#16.tt=
wu_local
      1278 =C2=B1 9%     -15.0%       1087 =C2=B1 1%  sched_debug.cfs_rq[3]=
:/.exec_clock
      5841 =C2=B110%    +305.6%      23695 =C2=B145%  sched_debug.cpu#25.tt=
wu_count
      8530 =C2=B130%     -49.4%       4317 =C2=B1 8%  sched_debug.cpu#13.sc=
hed_count
      3003 =C2=B125%     -76.9%        693 =C2=B112%  sched_debug.cpu#6.ttw=
u_count
       161 =C2=B123%     +55.5%        251 =C2=B118%  sched_debug.cpu#22.tt=
wu_count
      6519 =C2=B118%     +90.7%      12431 =C2=B119%  sched_debug.cpu#30.nr=
_load_updates
      3305 =C2=B120%     -60.5%       1304 =C2=B118%  sched_debug.cpu#11.tt=
wu_local
      4883 =C2=B1 5%     +43.0%       6982 =C2=B1 1%  sched_debug.cpu#16.sc=
hed_count
      0.13 =C2=B1 8%     +56.1%       0.20 =C2=B123%  turbostat.%pc2
      2086 =C2=B1 4%     +21.1%       2527 =C2=B1 3%  sched_debug.cpu#16.sc=
hed_goidle
      5017 =C2=B121%     -61.6%       1927 =C2=B137%  sched_debug.cpu#2.ttw=
u_count
      6689 =C2=B111%     -44.2%       3735 =C2=B119%  sched_debug.cpu#6.nr_=
switches
        19 =C2=B139%     -59.2%          8 =C2=B117%  sched_debug.cpu#18.cp=
u_load[1]
      1924 =C2=B132%     +50.9%       2904 =C2=B111%  sched_debug.cpu#9.nr_=
switches
      3912 =C2=B1 6%     -42.5%       2251 =C2=B1 3%  sched_debug.cpu#5.sch=
ed_goidle
      5781 =C2=B113%     -36.9%       3649 =C2=B1 4%  sched_debug.cpu#12.sc=
hed_goidle
     11126 =C2=B1 7%     -23.4%       8520 =C2=B1 1%  sched_debug.cpu#3.sch=
ed_goidle
      3323 =C2=B111%     -45.1%       1825 =C2=B119%  sched_debug.cpu#6.sch=
ed_goidle
      7285 =C2=B114%     -40.9%       4305 =C2=B1 8%  sched_debug.cpu#13.nr=
_switches
      3566 =C2=B116%     -45.0%       1963 =C2=B125%  sched_debug.cpu#8.sch=
ed_goidle
      7022 =C2=B111%     -41.2%       4132 =C2=B1 6%  sched_debug.cpu#11.tt=
wu_count
     14533 =C2=B122%     +43.8%      20896 =C2=B1 5%  sched_debug.cpu#0.sch=
ed_count
     13253 =C2=B112%     -43.9%       7439 =C2=B1 4%  sched_debug.cpu#12.sc=
hed_count
      2426 =C2=B1 7%     +24.2%       3014 =C2=B111%  sched_debug.cpu#25.sc=
hed_goidle
    797026 =C2=B137%     -43.9%     446843 =C2=B110%  cpuidle.C3-SNB.time
      7893 =C2=B1 6%     -41.8%       4591 =C2=B1 4%  sched_debug.cpu#5.nr_=
switches
      7392 =C2=B116%     +74.9%      12931 =C2=B124%  sched_debug.cpu#28.nr=
_load_updates
      3612 =C2=B114%     -42.2%       2086 =C2=B1 8%  sched_debug.cpu#13.sc=
hed_goidle
       937 =C2=B134%     +53.1%       1435 =C2=B111%  sched_debug.cpu#9.sch=
ed_goidle
      5792 =C2=B1 6%     -39.9%       3479 =C2=B1 1%  sched_debug.cpu#4.sch=
ed_goidle
     11646 =C2=B1 7%     -39.3%       7073 =C2=B1 1%  sched_debug.cpu#4.nr_=
switches
      1794 =C2=B117%     -23.1%       1380 =C2=B117%  sched_debug.cfs_rq[31=
]:/.exec_clock
     22924 =C2=B1 7%     -23.6%      17516 =C2=B1 4%  sched_debug.cpu#11.nr=
_switches
      2633 =C2=B119%     +64.0%       4319 =C2=B130%  sched_debug.cfs_rq[19=
]:/.min_vruntime
     59079 =C2=B132%     -47.8%      30837 =C2=B122%  sched_debug.cpu#2.sch=
ed_count
      9835 =C2=B112%     +55.6%      15307 =C2=B119%  sched_debug.cpu#16.nr=
_load_updates
     22381 =C2=B1 7%     -22.4%      17362 =C2=B1 1%  sched_debug.cpu#3.nr_=
switches
         2 =C2=B142%     +94.4%          4 =C2=B110%  sched_debug.cfs_rq[10=
]:/.nr_spread_over
      6781 =C2=B117%     +81.3%      12296 =C2=B123%  sched_debug.cpu#22.nr=
_load_updates
     24758 =C2=B114%     -28.0%      17837 =C2=B1 5%  sched_debug.cpu#11.sc=
hed_count
      7096 =C2=B1 2%     +14.7%       8136 =C2=B1 5%  sched_debug.cpu#0.nr_=
switches
      6661 =C2=B117%     +78.0%      11853 =C2=B124%  sched_debug.cpu#29.nr=
_load_updates
      6785 =C2=B118%     +78.1%      12082 =C2=B124%  sched_debug.cpu#21.nr=
_load_updates
      6854 =C2=B112%     -38.8%       4194 =C2=B1 4%  sched_debug.cpu#3.ttw=
u_count
      7612 =C2=B115%     +70.9%      13007 =C2=B123%  sched_debug.cpu#20.nr=
_load_updates
     11659 =C2=B112%     -36.3%       7426 =C2=B1 4%  sched_debug.cpu#12.nr=
_switches
     11402 =C2=B1 7%     -24.8%       8571 =C2=B1 4%  sched_debug.cpu#11.sc=
hed_goidle
      7111 =C2=B115%     +77.7%      12637 =C2=B123%  sched_debug.cpu#17.nr=
_load_updates
      6973 =C2=B116%     +75.0%      12203 =C2=B124%  sched_debug.cpu#31.nr=
_load_updates
      6809 =C2=B117%     +78.1%      12129 =C2=B125%  sched_debug.cpu#24.nr=
_load_updates
      7591 =C2=B115%     +72.5%      13093 =C2=B122%  sched_debug.cpu#18.nr=
_load_updates
      7391 =C2=B119%     -50.8%       3634 =C2=B116%  sched_debug.cpu#7.nr_=
switches
     12020 =C2=B112%     -39.8%       7242 =C2=B114%  sched_debug.cpu#2.nr_=
switches
      5974 =C2=B113%     -41.0%       3522 =C2=B114%  sched_debug.cpu#2.sch=
ed_goidle
      3666 =C2=B120%     -51.8%       1768 =C2=B116%  sched_debug.cpu#7.sch=
ed_goidle
      5384 =C2=B125%     -58.7%       2223 =C2=B114%  sched_debug.cpu#1.sch=
ed_goidle
      6942 =C2=B116%     +87.4%      13011 =C2=B122%  sched_debug.cpu#19.nr=
_load_updates
      3090 =C2=B116%     -52.0%       1483 =C2=B113%  sched_debug.cpu#3.ttw=
u_local
      6633 =C2=B118%     +85.6%      12313 =C2=B123%  sched_debug.cpu#27.nr=
_load_updates
      6347 =C2=B1 2%     +38.2%       8770 =C2=B1 2%  sched_debug.cpu#0.ttw=
u_count
      5397 =C2=B117%     +74.9%       9439 =C2=B144%  sched_debug.cfs_rq[11=
]:/.min_vruntime
      4066 =C2=B124%     -23.3%       3117 =C2=B114%  sched_debug.cfs_rq[27=
]:/.min_vruntime
      6801 =C2=B116%     +77.5%      12071 =C2=B124%  sched_debug.cpu#23.nr=
_load_updates
      7568 =C2=B114%     +77.7%      13450 =C2=B122%  sched_debug.cpu#9.nr_=
load_updates
        59 =C2=B131%    +104.4%        121 =C2=B143%  sched_debug.cfs_rq[30=
]:/.avg->runnable_avg_sum
       466 =C2=B114%     +90.9%        890 =C2=B124%  sched_debug.cpu#19.tt=
wu_count
      9801 =C2=B113%     +41.9%      13906 =C2=B121%  sched_debug.cpu#6.nr_=
load_updates
      8128 =C2=B125%     +58.3%      12867 =C2=B126%  sched_debug.cpu#1.nr_=
load_updates
       238 =C2=B112%     +84.9%        440 =C2=B131%  sched_debug.cpu#18.tt=
wu_local
      6744 =C2=B127%     +46.1%       9853 =C2=B110%  sched_debug.cfs_rq[1]=
:/.min_vruntime
     10030 =C2=B112%     +40.0%      14044 =C2=B121%  sched_debug.cpu#5.nr_=
load_updates
       445 =C2=B112%     -41.6%        260 =C2=B110%  cpuidle.C3-SNB.usage
     11607 =C2=B1 6%     +34.9%      15655 =C2=B115%  sched_debug.cpu#15.nr=
_load_updates
  30852509 =C2=B120%     +59.8%   49301317 =C2=B113%  cpuidle.C1-SNB.time
      9340 =C2=B1 9%     +46.6%      13688 =C2=B119%  sched_debug.cpu#14.nr=
_load_updates
      9843 =C2=B113%     +45.2%      14288 =C2=B120%  sched_debug.cpu#13.nr=
_load_updates
     10191 =C2=B114%     +41.5%      14420 =C2=B120%  sched_debug.cpu#8.nr_=
load_updates
     12555 =C2=B1 8%     +26.9%      15934 =C2=B118%  sched_debug.cpu#3.nr_=
load_updates
    125011 =C2=B1 1%     -33.4%      83286 =C2=B1 4%  cpuidle.C7-SNB.usage
      4440 =C2=B1 9%     +15.2%       5114 =C2=B1 2%  numa-vmstat.node1.nr_=
slab_reclaimable
     17765 =C2=B1 9%     +15.2%      20459 =C2=B1 2%  numa-meminfo.node1.SR=
eclaimable
     20407 =C2=B1 7%     -14.5%      17450 =C2=B1 3%  numa-meminfo.node0.SR=
eclaimable
      5101 =C2=B1 7%     -14.5%       4362 =C2=B1 3%  numa-vmstat.node0.nr_=
slab_reclaimable
     39288 =C2=B1 0%     +48.6%      58382 =C2=B1 5%  softirqs.SCHED
    385696 =C2=B1 0%     +12.4%     433713 =C2=B1 1%  softirqs.TIMER
       312 =C2=B1 0%  +12223.0%      38521 =C2=B1 1%  time.involuntary_cont=
ext_switches
      2333 =C2=B1 0%      -4.2%       2234 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: brickland1/boot/1

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
         0           +Inf%          1       dmesg.BUG:soft_lockup-CPU_stuck=
_for_s
         0           +Inf%          1       dmesg.Kernel_panic-not_syncing:=
softlockup:hung_tasks
         0           +Inf%          1       last_state.is_incomplete_run
         0           +Inf%          1       last_state.booting

testbox/testcase/testparams: lkp-sb03/nepim/300s-100%-udp

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
   -332412 =C2=B1-2%     -31.4%    -228062 =C2=B1-41%  sched_debug.cfs_rq[2=
4]:/.spread0
   -332189 =C2=B1-1%     -29.6%    -233944 =C2=B1-42%  sched_debug.cfs_rq[2=
1]:/.spread0
   -333098 =C2=B1-1%     -29.6%    -234545 =C2=B1-42%  sched_debug.cfs_rq[3=
0]:/.spread0
   -331878 =C2=B1-2%     -31.4%    -227531 =C2=B1-45%  sched_debug.cfs_rq[1=
4]:/.spread0
   -320408 =C2=B1-6%     -29.2%    -226996 =C2=B1-42%  sched_debug.cfs_rq[1=
2]:/.spread0
   -329173 =C2=B1-2%     -30.6%    -228514 =C2=B1-42%  sched_debug.cfs_rq[1=
1]:/.spread0
   -328417 =C2=B1-3%     -29.4%    -231861 =C2=B1-42%  sched_debug.cfs_rq[1=
5]:/.spread0
   -326879 =C2=B1-1%     -30.2%    -228116 =C2=B1-43%  sched_debug.cfs_rq[1=
7]:/.spread0
   -333639 =C2=B1-1%     -30.3%    -232642 =C2=B1-42%  sched_debug.cfs_rq[2=
3]:/.spread0
   -330937 =C2=B1-1%     -30.5%    -230138 =C2=B1-43%  sched_debug.cfs_rq[1=
8]:/.spread0
   -333169 =C2=B1-1%     -29.8%    -233884 =C2=B1-42%  sched_debug.cfs_rq[2=
9]:/.spread0
   -332021 =C2=B1-1%     -29.9%    -232732 =C2=B1-43%  sched_debug.cfs_rq[3=
1]:/.spread0
   -332316 =C2=B1-1%     -29.6%    -233922 =C2=B1-43%  sched_debug.cfs_rq[2=
2]:/.spread0
   -329709 =C2=B1 0%     -32.1%    -223771 =C2=B1-43%  sched_debug.cfs_rq[5=
]:/.spread0
   -324925 =C2=B1-1%     -33.7%    -215479 =C2=B1-46%  sched_debug.cfs_rq[3=
]:/.spread0
   -331383 =C2=B1-1%     -30.0%    -231988 =C2=B1-43%  sched_debug.cfs_rq[1=
9]:/.spread0
   -328445 =C2=B1 0%     -31.3%    -225649 =C2=B1-43%  sched_debug.cfs_rq[2=
]:/.spread0
   -330852 =C2=B1-1%     -29.9%    -231837 =C2=B1-43%  sched_debug.cfs_rq[2=
0]:/.spread0
   -330882 =C2=B1-1%     -31.1%    -227986 =C2=B1-43%  sched_debug.cfs_rq[6=
]:/.spread0
   -331089 =C2=B1-2%     -37.4%    -207235 =C2=B1-41%  sched_debug.cfs_rq[2=
6]:/.spread0
   -332707 =C2=B1-1%     -35.2%    -215441 =C2=B1-41%  sched_debug.cfs_rq[1=
6]:/.spread0
      2896 =C2=B132%     -73.8%        758 =C2=B128%  sched_debug.cpu#14.tt=
wu_count
   -329983 =C2=B1-1%     -30.9%    -227891 =C2=B1-46%  sched_debug.cfs_rq[2=
7]:/.spread0
   -321000 =C2=B1-3%     -28.5%    -229602 =C2=B1-43%  sched_debug.cfs_rq[1=
3]:/.spread0
   -327709 =C2=B1 0%     -32.5%    -221267 =C2=B1-45%  sched_debug.cfs_rq[4=
]:/.spread0
   -328881 =C2=B1-1%     -31.1%    -226445 =C2=B1-47%  sched_debug.cfs_rq[7=
]:/.spread0
      1859 =C2=B129%     -86.7%        247 =C2=B138%  sched_debug.cpu#12.tt=
wu_local
      6731 =C2=B1 6%     +32.5%       8916 =C2=B110%  sched_debug.cpu#25.sc=
hed_count
       661 =C2=B117%    +493.7%       3925 =C2=B124%  sched_debug.cfs_rq[2]=
:/.exec_clock
   -334661 =C2=B1-1%     -30.6%    -232419 =C2=B1-42%  sched_debug.cfs_rq[9=
]:/.spread0
      1379 =C2=B1 6%     -85.7%        197 =C2=B132%  sched_debug.cpu#6.ttw=
u_local
      2949 =C2=B118%     -54.7%       1337 =C2=B138%  sched_debug.cpu#13.tt=
wu_count
      3358 =C2=B132%     -64.7%       1184 =C2=B140%  sched_debug.cpu#12.tt=
wu_count
      6723 =C2=B1 6%     +25.2%       8419 =C2=B1 6%  sched_debug.cpu#25.nr=
_switches
      3130 =C2=B1 2%     -70.6%        920 =C2=B137%  sched_debug.cpu#5.ttw=
u_count
      2865 =C2=B121%     -71.7%        810 =C2=B116%  sched_debug.cpu#7.ttw=
u_count
        95 =C2=B138%     -48.1%         49 =C2=B134%  sched_debug.cfs_rq[13=
]:/.avg->runnable_avg_sum
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  sched_debug.cpu#29.cp=
u_load[3]
    118.77 =C2=B147%    +320.1%     498.91 =C2=B134%  sched_debug.cfs_rq[9]=
:/.exec_clock
     12507 =C2=B1 3%    +184.0%      35517 =C2=B142%  sched_debug.cpu#26.nr=
_load_updates
        59 =C2=B110%     +34.1%         80 =C2=B118%  sched_debug.cpu#30.tt=
wu_local
      2042 =C2=B132%     -80.2%        404 =C2=B135%  sched_debug.cpu#2.ttw=
u_local
        52 =C2=B1 9%     +51.0%         79 =C2=B124%  sched_debug.cpu#23.tt=
wu_local
      4980 =C2=B127%     -46.4%       2670 =C2=B122%  sched_debug.cpu#15.sc=
hed_goidle
      5708 =C2=B1 3%     -12.7%       4983 =C2=B1 9%  sched_debug.cpu#20.tt=
wu_count
      3175 =C2=B116%     -67.7%       1025 =C2=B145%  sched_debug.cpu#6.ttw=
u_count
      2500 =C2=B111%     -47.5%       1313 =C2=B114%  sched_debug.cpu#11.tt=
wu_local
      8413 =C2=B122%     -60.3%       3343 =C2=B126%  sched_debug.cpu#10.sc=
hed_goidle
      7474 =C2=B1 7%     -28.7%       5329 =C2=B1 2%  sched_debug.cpu#14.nr=
_switches
      1275 =C2=B1 3%     +44.5%       1843 =C2=B1 4%  sched_debug.cpu#25.tt=
wu_local
      3774 =C2=B125%     -60.1%       1506 =C2=B127%  sched_debug.cpu#2.ttw=
u_count
      7163 =C2=B1 2%     -51.5%       3473 =C2=B118%  sched_debug.cpu#6.nr_=
switches
      3206 =C2=B1 7%     -37.0%       2020 =C2=B127%  sched_debug.cpu#20.cu=
rr->pid
         7 =C2=B125%     +86.4%         13 =C2=B129%  sched_debug.cfs_rq[25=
]:/.nr_spread_over
      3709 =C2=B1 7%     -29.5%       2615 =C2=B1 2%  sched_debug.cpu#14.sc=
hed_goidle
        10 =C2=B129%    +116.7%         21 =C2=B143%  sched_debug.cfs_rq[11=
]:/.tg_runnable_contrib
       490 =C2=B127%    +110.7%       1032 =C2=B141%  sched_debug.cfs_rq[11=
]:/.avg->runnable_avg_sum
      3762 =C2=B1 0%     -34.3%       2470 =C2=B1 6%  sched_debug.cpu#5.sch=
ed_goidle
      5345 =C2=B120%     -29.4%       3775 =C2=B115%  sched_debug.cpu#12.sc=
hed_goidle
       599 =C2=B112%     -23.7%        457 =C2=B1 7%  sched_debug.cfs_rq[18=
]:/.tg_load_contrib
     10630 =C2=B1 3%     -23.4%       8143 =C2=B1 9%  sched_debug.cpu#3.sch=
ed_goidle
    139.20 =C2=B149%     -42.5%      80.00 =C2=B1 6%  sched_debug.cfs_rq[30=
]:/.exec_clock
       584 =C2=B133%     -41.1%        344 =C2=B112%  sched_debug.cpu#21.tt=
wu_count
       595 =C2=B111%     -25.5%        444 =C2=B1 8%  sched_debug.cfs_rq[18=
]:/.blocked_load_avg
        41 =C2=B1 9%     -37.9%         25 =C2=B120%  sched_debug.cpu#20.cp=
u_load[3]
      3561 =C2=B1 2%     -52.4%       1693 =C2=B120%  sched_debug.cpu#6.sch=
ed_goidle
      7825 =C2=B112%     -35.1%       5081 =C2=B120%  sched_debug.cpu#13.nr=
_switches
      6110 =C2=B110%     -32.5%       4123 =C2=B1 4%  sched_debug.cpu#11.tt=
wu_count
       121 =C2=B1 7%     -32.9%         81 =C2=B118%  sched_debug.cpu#20.cp=
u_load[1]
       539 =C2=B149%    +111.1%       1139 =C2=B111%  sched_debug.cpu#11.cu=
rr->pid
     28969 =C2=B1 6%     -11.8%      25554 =C2=B1 6%  proc-vmstat.pgalloc_d=
ma32
        21 =C2=B1 9%     -38.5%         13 =C2=B124%  sched_debug.cpu#20.cp=
u_load[4]
    364837 =C2=B128%     +80.5%     658376 =C2=B139%  cpuidle.C3-SNB.time
      7578 =C2=B1 1%     -33.2%       5062 =C2=B1 7%  sched_debug.cpu#5.nr_=
switches
       161 =C2=B1 7%     -30.8%        111 =C2=B117%  sched_debug.cpu#20.cp=
u_load[0]
      3866 =C2=B112%     -35.5%       2493 =C2=B120%  sched_debug.cpu#13.sc=
hed_goidle
      2670 =C2=B1 2%     +96.8%       5255 =C2=B1 1%  sched_debug.cpu#17.tt=
wu_count
     12432 =C2=B1 5%    +168.0%      33312 =C2=B127%  sched_debug.cpu#16.nr=
_load_updates
     21409 =C2=B1 3%     -22.4%      16617 =C2=B1 9%  sched_debug.cpu#3.nr_=
switches
       418 =C2=B137%     -46.1%        225 =C2=B137%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
        10 =C2=B1 4%     +45.2%         15 =C2=B123%  sched_debug.cfs_rq[17=
]:/.tg_runnable_contrib
      6560 =C2=B1 5%     -40.9%       3876 =C2=B1 4%  sched_debug.cpu#3.ttw=
u_count
     10781 =C2=B121%     -28.5%       7712 =C2=B115%  sched_debug.cpu#12.nr=
_switches
     15101 =C2=B1 5%     +89.1%      28556 =C2=B149%  sched_debug.cpu#17.nr=
_load_updates
       492 =C2=B1 5%     +45.8%        718 =C2=B122%  sched_debug.cfs_rq[17=
]:/.avg->runnable_avg_sum
     12110 =C2=B1 5%    +131.6%      28045 =C2=B145%  sched_debug.cpu#24.nr=
_load_updates
      3021 =C2=B144%     -52.8%       1426 =C2=B128%  sched_debug.cfs_rq[30=
]:/.min_vruntime
       163 =C2=B1 6%     -33.9%        108 =C2=B120%  sched_debug.cfs_rq[20=
]:/.runnable_load_avg
      7318 =C2=B1 9%     -33.1%       4898 =C2=B115%  sched_debug.cpu#7.nr_=
switches
     10903 =C2=B114%     -25.7%       8103 =C2=B1 1%  sched_debug.cpu#2.nr_=
switches
      5414 =C2=B114%     -27.2%       3943 =C2=B1 1%  sched_debug.cpu#2.sch=
ed_goidle
      3639 =C2=B1 9%     -33.4%       2423 =C2=B115%  sched_debug.cpu#7.sch=
ed_goidle
        84 =C2=B143%     +51.2%        128 =C2=B1 2%  sched_debug.cpu#11.lo=
ad
      5531 =C2=B1 4%     -62.4%       2080 =C2=B126%  sched_debug.cpu#1.sch=
ed_goidle
      2894 =C2=B1 7%     -57.2%       1239 =C2=B117%  sched_debug.cpu#3.ttw=
u_local
      2128 =C2=B1 6%     +20.7%       2569 =C2=B1 5%  sched_debug.cpu#17.sc=
hed_goidle
      7757 =C2=B110%    +109.8%      16272 =C2=B142%  sched_debug.cpu#0.ttw=
u_count
      3802 =C2=B116%     -46.1%       2048 =C2=B128%  sched_debug.cfs_rq[22=
]:/.min_vruntime
       162 =C2=B1 6%     -33.5%        108 =C2=B120%  sched_debug.cfs_rq[20=
]:/.load
       750 =C2=B114%    +122.9%       1671 =C2=B1 1%  sched_debug.cpu#17.tt=
wu_local
      4961 =C2=B1 5%     +42.8%       7085 =C2=B1 3%  sched_debug.cpu#17.nr=
_switches
       162 =C2=B1 6%     -33.5%        108 =C2=B120%  sched_debug.cpu#20.lo=
ad
        74 =C2=B1 8%     -35.1%         48 =C2=B119%  sched_debug.cpu#20.cp=
u_load[2]
      3929 =C2=B138%     -48.4%       2026 =C2=B123%  sched_debug.cfs_rq[21=
]:/.min_vruntime
    283094 =C2=B1 7%     -12.0%     249151 =C2=B1 3%  numa-numastat.node0.l=
ocal_node
    283099 =C2=B1 7%     -12.0%     249158 =C2=B1 3%  numa-numastat.node0.n=
uma_hit
     89434 =C2=B1 7%     -13.0%      77829 =C2=B1 3%  meminfo.DirectMap4k
       525 =C2=B130%     +57.0%        824 =C2=B122%  sched_debug.cpu#19.tt=
wu_count
       557 =C2=B1 9%     +40.7%        785 =C2=B117%  sched_debug.cfs_rq[18=
]:/.exec_clock
     16533 =C2=B1 4%     +77.6%      29359 =C2=B143%  sched_debug.cpu#4.nr_=
load_updates
     15325 =C2=B1 4%     +83.0%      28049 =C2=B147%  sched_debug.cpu#5.nr_=
load_updates
    153651 =C2=B1 0%     -29.4%     108464 =C2=B144%  sched_debug.cpu#0.nr_=
load_updates
    154973 =C2=B1 0%     -32.2%     105144 =C2=B146%  sched_debug.cfs_rq[0]=
:/.exec_clock
    336114 =C2=B1 1%     -29.8%     235968 =C2=B142%  sched_debug.cfs_rq[0]=
:/.min_vruntime
     17101 =C2=B1 2%     +67.3%      28611 =C2=B149%  sched_debug.cpu#11.nr=
_load_updates
     16749 =C2=B1 8%     +65.9%      27795 =C2=B148%  sched_debug.cpu#12.nr=
_load_updates
     18016 =C2=B1 6%     +67.5%      30176 =C2=B146%  sched_debug.cpu#3.nr_=
load_updates
    267383 =C2=B1 7%     +12.9%     301747 =C2=B1 2%  numa-numastat.node1.n=
uma_hit
    267353 =C2=B1 7%     +12.9%     301717 =C2=B1 2%  numa-numastat.node1.l=
ocal_node
      9873 =C2=B1 4%     -11.7%       8721 =C2=B1 1%  slabinfo.kmalloc-192.=
num_objs
      7870 =C2=B1 4%      -9.5%       7121 =C2=B1 6%  numa-vmstat.node1.nr_=
slab_unreclaimable
      9873 =C2=B1 4%     -11.7%       8721 =C2=B1 1%  slabinfo.kmalloc-192.=
active_objs
      4392 =C2=B1 5%     -10.4%       3933 =C2=B1 7%  sched_debug.cpu#20.nr=
_switches
      5151 =C2=B1 1%     -11.8%       4542 =C2=B1 5%  numa-vmstat.node1.nr_=
slab_reclaimable
     20608 =C2=B1 1%     -11.8%      18170 =C2=B1 5%  numa-meminfo.node1.SR=
eclaimable
     45893 =C2=B1 2%     +43.5%      65872 =C2=B112%  softirqs.SCHED
     31483 =C2=B1 4%      -9.5%      28488 =C2=B1 6%  numa-meminfo.node1.SU=
nreclaim
        27 =C2=B136%     -41.0%         16 =C2=B120%  sched_debug.cfs_rq[20=
]:/.tg_runnable_contrib
      1310 =C2=B136%     -40.6%        778 =C2=B120%  sched_debug.cfs_rq[20=
]:/.avg->runnable_avg_sum
     52092 =C2=B1 3%     -10.4%      46658 =C2=B1 5%  numa-meminfo.node1.Sl=
ab
     17004 =C2=B1 7%     -13.8%      14657 =C2=B1 6%  slabinfo.vm_area_stru=
ct.num_objs
     16843 =C2=B1 8%     -14.1%      14468 =C2=B1 4%  slabinfo.vm_area_stru=
ct.active_objs
    395985 =C2=B1 1%     +10.1%     436060 =C2=B1 0%  softirqs.TIMER

testbox/testcase/testparams: lkp-sb03/nepim/300s-25%-tcp

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
     10695 =C2=B1 0%      -2.1%      10467 =C2=B1 1%  nepim.tcp.avg.snd_s
   2803859 =C2=B1 0%      -2.1%    2743881 =C2=B1 1%  nepim.tcp.avg.kbps_out
   2804100 =C2=B1 0%      -2.2%    2743293 =C2=B1 1%  nepim.tcp.avg.kbps_in
     10698 =C2=B1 0%      -2.2%      10467 =C2=B1 1%  nepim.tcp.avg.rcv_s
   -121719 =C2=B1-8%     -25.3%     -90877 =C2=B1-22%  sched_debug.cfs_rq[2=
4]:/.spread0
   -121918 =C2=B1-7%     -23.1%     -93789 =C2=B1-26%  sched_debug.cfs_rq[3=
0]:/.spread0
   -120019 =C2=B1-7%     -34.1%     -79077 =C2=B1-44%  sched_debug.cfs_rq[1=
4]:/.spread0
   -111279 =C2=B1-3%     -26.7%     -81532 =C2=B1-45%  sched_debug.cfs_rq[1=
2]:/.spread0
   -116127 =C2=B1-7%     -24.5%     -87649 =C2=B1-26%  sched_debug.cfs_rq[1=
7]:/.spread0
   -120630 =C2=B1-7%     -23.7%     -92046 =C2=B1-22%  sched_debug.cfs_rq[2=
3]:/.spread0
   -120159 =C2=B1-6%     -22.6%     -93007 =C2=B1-25%  sched_debug.cfs_rq[1=
8]:/.spread0
   -115146 =C2=B1-8%     -27.5%     -83505 =C2=B1-29%  sched_debug.cfs_rq[2=
5]:/.spread0
   -120796 =C2=B1-6%     -21.9%     -94345 =C2=B1-23%  sched_debug.cfs_rq[2=
9]:/.spread0
   -120845 =C2=B1-7%     -24.7%     -91044 =C2=B1-28%  sched_debug.cfs_rq[3=
1]:/.spread0
    -42392 =C2=B1-14%     -34.3%     -27870 =C2=B1-8%  sched_debug.cfs_rq[1=
]:/.spread0
   -114000 =C2=B1-8%     -32.0%     -77568 =C2=B1-27%  sched_debug.cfs_rq[5=
]:/.spread0
   -104612 =C2=B1-9%     -31.4%     -71780 =C2=B1-27%  sched_debug.cfs_rq[3=
]:/.spread0
   -109295 =C2=B1-10%     -43.2%     -62052 =C2=B1-49%  sched_debug.cfs_rq[=
2]:/.spread0
   -113348 =C2=B1-4%     -32.0%     -77037 =C2=B1-22%  sched_debug.cfs_rq[6=
]:/.spread0
      1399 =C2=B1 3%    +293.1%       5501 =C2=B148%  sched_debug.cpu#26.sc=
hed_count
   -120334 =C2=B1-6%     -23.7%     -91799 =C2=B1-25%  sched_debug.cfs_rq[2=
6]:/.spread0
   -122092 =C2=B1-7%     -22.2%     -94988 =C2=B1-23%  sched_debug.cfs_rq[1=
6]:/.spread0
   -119413 =C2=B1-6%     -20.7%     -94724 =C2=B1-24%  sched_debug.cfs_rq[2=
7]:/.spread0
      4257 =C2=B1 8%     -90.8%        391 =C2=B148%  sched_debug.cpu#5.ttw=
u_local
   -112177 =C2=B1-8%     -29.2%     -79394 =C2=B1-24%  sched_debug.cfs_rq[4=
]:/.spread0
   -114081 =C2=B1-5%     -31.0%     -78750 =C2=B1-25%  sched_debug.cfs_rq[7=
]:/.spread0
   -118923 =C2=B1-6%     -26.3%     -87677 =C2=B1-31%  sched_debug.cfs_rq[2=
8]:/.spread0
      1611 =C2=B114%     -39.2%        979 =C2=B143%  sched_debug.cpu#13.tt=
wu_local
      1403 =C2=B120%     -68.4%        444 =C2=B142%  sched_debug.cpu#12.tt=
wu_local
         8 =C2=B117%     -45.8%          4 =C2=B128%  sched_debug.cpu#19.nr=
_uninterruptible
     10328 =C2=B124%    +393.1%      50927 =C2=B1 9%  sched_debug.cpu#25.sc=
hed_count
        29 =C2=B1 9%     -34.8%         19 =C2=B1 4%  sched_debug.cpu#25.nr=
_uninterruptible
       892 =C2=B123%     -75.7%        216 =C2=B121%  sched_debug.cfs_rq[19=
]:/.exec_clock
     10284 =C2=B124%    +394.0%      50801 =C2=B1 9%  sched_debug.cpu#25.nr=
_switches
      1386 =C2=B1 3%    +296.0%       5489 =C2=B148%  sched_debug.cpu#26.nr=
_switches
        53 =C2=B115%     +44.0%         76 =C2=B123%  sched_debug.cpu#16.tt=
wu_local
        14 =C2=B115%     +83.3%         25 =C2=B130%  numa-numastat.node0.o=
ther_node
       954 =C2=B1 8%    +408.1%       4849 =C2=B144%  sched_debug.cpu#26.tt=
wu_count
      3148 =C2=B1 7%     +87.6%       5907 =C2=B112%  sched_debug.cpu#25.tt=
wu_count
    185.51 =C2=B126%     -30.6%     128.82 =C2=B1 6%  sched_debug.cfs_rq[22=
]:/.exec_clock
      1169 =C2=B116%     +81.6%       2124 =C2=B117%  sched_debug.cpu#25.tt=
wu_local
     90119 =C2=B111%     -42.8%      51537 =C2=B132%  sched_debug.cfs_rq[8]=
:/.exec_clock
    176077 =C2=B110%     -40.2%     105252 =C2=B129%  sched_debug.cfs_rq[8]=
:/.min_vruntime
       176 =C2=B1 2%     -42.5%        101 =C2=B142%  sched_debug.cpu#0.cpu=
_load[3]
      9192 =C2=B117%     +59.2%      14633 =C2=B110%  sched_debug.cfs_rq[25=
]:/.min_vruntime
      1159 =C2=B1 9%     -19.8%        929 =C2=B115%  sched_debug.cpu#22.sc=
hed_count
       427 =C2=B1 6%     -34.1%        281 =C2=B142%  sched_debug.cfs_rq[9]=
:/.tg_runnable_contrib
     19503 =C2=B1 6%     -34.1%      12843 =C2=B142%  sched_debug.cfs_rq[9]=
:/.avg->runnable_avg_sum
       839 =C2=B1 5%     +24.5%       1045 =C2=B120%  sched_debug.cpu#11.cu=
rr->pid
        14 =C2=B118%     +69.8%         24 =C2=B132%  sched_debug.cfs_rq[21=
]:/.tg_runnable_contrib
      4588 =C2=B127%    +432.3%      24425 =C2=B110%  sched_debug.cpu#25.sc=
hed_goidle
       205 =C2=B1 7%     -43.6%        115 =C2=B144%  sched_debug.cfs_rq[8]=
:/.load
      2524 =C2=B141%     -58.1%       1056 =C2=B114%  sched_debug.cpu#19.sc=
hed_count
       185 =C2=B1 2%     -38.1%        115 =C2=B132%  sched_debug.cpu#0.cpu=
_load[4]
       205 =C2=B1 7%     -43.6%        115 =C2=B143%  sched_debug.cpu#8.load
   2248.86 =C2=B1 5%     +30.0%    2922.92 =C2=B125%  sched_debug.cfs_rq[17=
]:/.exec_clock
       139 =C2=B1 7%     -35.2%         90 =C2=B142%  sched_debug.cpu#9.cpu=
_load[2]
       875 =C2=B126%    +100.7%       1757 =C2=B118%  sched_debug.cpu#31.sc=
hed_count
       123 =C2=B1 8%     -35.0%         80 =C2=B142%  sched_debug.cpu#9.cpu=
_load[1]
      1195 =C2=B128%    +207.3%       3674 =C2=B143%  sched_debug.cfs_rq[31=
]:/.exec_clock
      5340 =C2=B121%     -56.6%       2318 =C2=B117%  sched_debug.cfs_rq[19=
]:/.min_vruntime
       791 =C2=B125%     -38.1%        490 =C2=B111%  sched_debug.cpu#30.nr=
_switches
       827 =C2=B1 8%     -45.4%        451 =C2=B116%  sched_debug.cpu#19.sc=
hed_goidle
       140 =C2=B1 6%     -39.1%         85 =C2=B147%  sched_debug.cpu#9.load
       863 =C2=B127%    +102.1%       1745 =C2=B118%  sched_debug.cpu#31.nr=
_switches
       701 =C2=B117%     +62.8%       1141 =C2=B131%  sched_debug.cfs_rq[21=
]:/.avg->runnable_avg_sum
         7 =C2=B142%     +76.2%         12 =C2=B126%  sched_debug.cpu#21.cp=
u_load[4]
       359 =C2=B126%     -42.1%        208 =C2=B112%  sched_debug.cpu#30.sc=
hed_goidle
      5844 =C2=B1 8%     +35.5%       7918 =C2=B1 6%  sched_debug.cpu#17.sc=
hed_count
       803 =C2=B125%     -37.4%        502 =C2=B111%  sched_debug.cpu#30.sc=
hed_count
      2421 =C2=B136%     +79.6%       4348 =C2=B140%  sched_debug.cfs_rq[30=
]:/.min_vruntime
       257 =C2=B143%     -42.6%        147 =C2=B125%  sched_debug.cpu#27.tt=
wu_local
      3419 =C2=B127%     -63.2%       1256 =C2=B112%  sched_debug.cpu#3.ttw=
u_local
      1867 =C2=B134%     -57.2%        799 =C2=B1 7%  proc-vmstat.numa_hint=
_faults
    512960 =C2=B112%     -31.0%     354196 =C2=B126%  sched_debug.cpu#0.ttw=
u_count
      1094 =C2=B134%     -45.8%        592 =C2=B113%  proc-vmstat.numa_hint=
_faults_local
      1908 =C2=B133%     -55.7%        845 =C2=B1 6%  proc-vmstat.numa_pte_=
updates
       205 =C2=B1 8%     -42.4%        118 =C2=B144%  sched_debug.cfs_rq[8]=
:/.tg_load_contrib
        97 =C2=B1 6%     +30.6%        126 =C2=B120%  sched_debug.cpu#29.tt=
wu_local
       502 =C2=B110%     -19.4%        404 =C2=B118%  sched_debug.cpu#22.sc=
hed_goidle
       935 =C2=B1 7%    +101.6%       1885 =C2=B1 7%  sched_debug.cpu#17.tt=
wu_local
      1793 =C2=B1 6%     -41.8%       1044 =C2=B114%  sched_debug.cpu#19.nr=
_switches
      5832 =C2=B1 9%     +35.5%       7906 =C2=B1 6%  sched_debug.cpu#17.nr=
_switches
      4005 =C2=B119%     +58.2%       6338 =C2=B114%  sched_debug.cfs_rq[26=
]:/.min_vruntime
       204 =C2=B1 8%     -43.8%        115 =C2=B144%  sched_debug.cpu#8.cpu=
_load[0]
       261 =C2=B1 7%     -42.7%        149 =C2=B144%  sched_debug.cpu#8.cpu=
_load[3]
       232 =C2=B1 8%     -42.6%        133 =C2=B144%  sched_debug.cpu#8.cpu=
_load[2]
       595 =C2=B1 8%     -40.3%        355 =C2=B142%  sched_debug.cfs_rq[8]=
:/.tg_runnable_contrib
       210 =C2=B1 8%     -43.0%        119 =C2=B144%  sched_debug.cpu#8.cpu=
_load[1]
      5415 =C2=B135%     +93.2%      10461 =C2=B145%  sched_debug.cfs_rq[28=
]:/.min_vruntime
     27308 =C2=B1 8%     -40.3%      16304 =C2=B141%  sched_debug.cfs_rq[8]=
:/.avg->runnable_avg_sum
       331 =C2=B120%     -55.4%        147 =C2=B141%  sched_debug.cfs_rq[26=
]:/.blocked_load_avg
       333 =C2=B119%     -55.7%        147 =C2=B141%  sched_debug.cfs_rq[26=
]:/.tg_load_contrib
      3494 =C2=B120%    +103.0%       7094 =C2=B141%  sched_debug.cfs_rq[31=
]:/.min_vruntime
       283 =C2=B1 7%     -42.3%        163 =C2=B144%  sched_debug.cpu#8.cpu=
_load[4]
      1146 =C2=B1 9%     -19.9%        918 =C2=B115%  sched_debug.cpu#22.nr=
_switches
       157 =C2=B1 7%     -34.5%        103 =C2=B141%  sched_debug.cpu#9.cpu=
_load[3]
      1885 =C2=B1 4%     -41.0%       1112 =C2=B142%  sched_debug.cpu#8.cur=
r->pid
       803 =C2=B116%     -31.3%        551 =C2=B111%  cpuidle.C3-SNB.usage
  1.39e+08 =C2=B1 2%     +41.2%  1.963e+08 =C2=B119%  cpuidle.C1-SNB.time
       115 =C2=B1 7%     -34.2%         75 =C2=B143%  sched_debug.cpu#9.cpu=
_load[0]
     34157 =C2=B1 2%     +50.0%      51248 =C2=B1 7%  softirqs.RCU
       204 =C2=B1 8%     -43.8%        115 =C2=B144%  sched_debug.cfs_rq[8]=
:/.runnable_load_avg
       172 =C2=B1 6%     -33.7%        114 =C2=B142%  sched_debug.cpu#9.cpu=
_load[4]
     60313 =C2=B1 8%     -23.5%      46115 =C2=B123%  sched_debug.cfs_rq[0]=
:/.exec_clock
      7005 =C2=B116%     -20.0%       5600 =C2=B1 8%  sched_debug.cfs_rq[20=
]:/.min_vruntime
    131677 =C2=B1 2%      -8.8%     120031 =C2=B1 5%  sched_debug.cpu#8.nr_=
load_updates
   1000000 =C2=B1 0%      -7.8%     921845 =C2=B1 3%  sched_debug.cpu#8.avg=
_idle
    305943 =C2=B1 0%     -14.9%     260489 =C2=B1 1%  cpuidle.C7-SNB.usage
    447676 =C2=B1 8%     +39.2%     623231 =C2=B112%  sched_debug.cpu#9.avg=
_idle
    136899 =C2=B1 0%     +10.9%     151875 =C2=B1 2%  softirqs.SCHED
     10246 =C2=B1 5%     +13.2%      11600 =C2=B1 8%  slabinfo.kmalloc-256.=
active_objs
      3693 =C2=B110%      -8.4%       3383 =C2=B1 8%  sched_debug.cfs_rq[30=
]:/.tg_load_avg
      3701 =C2=B1 9%      -8.4%       3389 =C2=B1 8%  sched_debug.cfs_rq[31=
]:/.tg_load_avg
      3682 =C2=B1 9%      -8.4%       3371 =C2=B1 8%  sched_debug.cfs_rq[29=
]:/.tg_load_avg
      3667 =C2=B1 9%      -9.0%       3338 =C2=B1 8%  sched_debug.cfs_rq[28=
]:/.tg_load_avg
      3660 =C2=B110%      -9.0%       3331 =C2=B1 7%  sched_debug.cfs_rq[27=
]:/.tg_load_avg
    378073 =C2=B1 0%     +17.8%     445472 =C2=B1 6%  softirqs.TIMER
       633 =C2=B123%   +1292.7%       8816 =C2=B115%  time.involuntary_cont=
ext_switches
   2298705 =C2=B111%     -17.8%    1889948 =C2=B114%  time.voluntary_contex=
t_switches
      1947 =C2=B112%     -23.5%       1490 =C2=B1 1%  time.minor_page_faults
    256.98 =C2=B1 1%      +2.0%     262.20 =C2=B1 1%  time.system_time
     21901 =C2=B1 1%      -5.2%      20756 =C2=B1 3%  vmstat.system.cs
      3707 =C2=B1 1%      -4.6%       3538 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-sb03/nepim/300s-25%-tcp6

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
      9863 =C2=B1 0%      -2.9%       9577 =C2=B1 1%  nepim.tcp.avg.snd_s
   2585647 =C2=B1 0%      -2.9%    2510718 =C2=B1 1%  nepim.tcp.avg.kbps_out
   2585813 =C2=B1 0%      -2.9%    2510916 =C2=B1 1%  nepim.tcp.avg.kbps_in
      9866 =C2=B1 0%      -2.9%       9584 =C2=B1 1%  nepim.tcp.avg.rcv_s
   -134976 =C2=B1-16%     -40.4%     -80425 =C2=B1-36%  sched_debug.cfs_rq[=
24]:/.spread0
   -132063 =C2=B1-16%     -43.2%     -74963 =C2=B1-37%  sched_debug.cfs_rq[=
21]:/.spread0
   -133375 =C2=B1-15%     -39.8%     -80283 =C2=B1-35%  sched_debug.cfs_rq[=
30]:/.spread0
        -6 =C2=B1-28%     -50.0%         -3 =C2=B1-37%  sched_debug.cpu#12.=
nr_uninterruptible
   -128176 =C2=B1-14%     -40.9%     -75751 =C2=B1-38%  sched_debug.cfs_rq[=
17]:/.spread0
   -133880 =C2=B1-15%     -42.4%     -77048 =C2=B1-33%  sched_debug.cfs_rq[=
23]:/.spread0
   -132298 =C2=B1-16%     -40.7%     -78493 =C2=B1-37%  sched_debug.cfs_rq[=
18]:/.spread0
   -126650 =C2=B1-16%     -42.8%     -72400 =C2=B1-38%  sched_debug.cfs_rq[=
25]:/.spread0
   -133032 =C2=B1-15%     -42.0%     -77124 =C2=B1-32%  sched_debug.cfs_rq[=
29]:/.spread0
   -131725 =C2=B1-17%     -39.8%     -79248 =C2=B1-36%  sched_debug.cfs_rq[=
31]:/.spread0
   -133654 =C2=B1-16%     -41.6%     -78031 =C2=B1-36%  sched_debug.cfs_rq[=
22]:/.spread0
   -124091 =C2=B1-18%     -60.9%     -48524 =C2=B1-20%  sched_debug.cfs_rq[=
5]:/.spread0
   -122612 =C2=B1-21%     -67.6%     -39778 =C2=B1-35%  sched_debug.cfs_rq[=
3]:/.spread0
   -130477 =C2=B1-17%     -40.8%     -77255 =C2=B1-36%  sched_debug.cfs_rq[=
19]:/.spread0
   -108967 =C2=B1-27%     -61.8%     -41596 =C2=B1-35%  sched_debug.cfs_rq[=
2]:/.spread0
   -129246 =C2=B1-17%     -44.3%     -72006 =C2=B1-36%  sched_debug.cfs_rq[=
20]:/.spread0
   -132670 =C2=B1-16%     -41.1%     -78095 =C2=B1-36%  sched_debug.cfs_rq[=
26]:/.spread0
   -130968 =C2=B1-19%     -44.9%     -72217 =C2=B1-38%  sched_debug.cfs_rq[=
16]:/.spread0
   -133731 =C2=B1-16%     -42.8%     -76524 =C2=B1-33%  sched_debug.cfs_rq[=
27]:/.spread0
      4116 =C2=B132%     -83.3%        686 =C2=B140%  sched_debug.cpu#5.ttw=
u_local
   -126780 =C2=B1-13%     -64.4%     -45152 =C2=B1-26%  sched_debug.cfs_rq[=
4]:/.spread0
   -128099 =C2=B1-16%     -60.8%     -50243 =C2=B1-43%  sched_debug.cfs_rq[=
7]:/.spread0
   -132645 =C2=B1-15%     -42.4%     -76383 =C2=B1-36%  sched_debug.cfs_rq[=
28]:/.spread0
      2271 =C2=B126%     -65.7%        780 =C2=B120%  sched_debug.cpu#4.ttw=
u_local
      8273 =C2=B1 9%     -45.1%       4538 =C2=B148%  cpuidle.C6-SNB.time
         5 =C2=B1 8%     -50.0%          2 =C2=B135%  sched_debug.cpu#26.cp=
u_load[2]
      9944 =C2=B142%    +275.2%      37311 =C2=B145%  sched_debug.cfs_rq[4]=
:/.min_vruntime
         5 =C2=B116%     -46.7%          2 =C2=B135%  sched_debug.cpu#26.cp=
u_load[3]
      3686 =C2=B116%     +66.2%       6129 =C2=B1 1%  sched_debug.cpu#25.tt=
wu_count
      1411 =C2=B114%     -42.3%        813 =C2=B115%  sched_debug.cpu#24.nr=
_switches
      1423 =C2=B114%     -42.0%        825 =C2=B115%  sched_debug.cpu#24.sc=
hed_count
       791 =C2=B117%     +87.4%       1483 =C2=B1 4%  sched_debug.cfs_rq[28=
]:/.exec_clock
       375 =C2=B116%     +74.3%        654 =C2=B122%  sched_debug.cpu#27.tt=
wu_count
      2514 =C2=B118%     -49.1%       1281 =C2=B1 9%  sched_debug.cpu#11.tt=
wu_local
       166 =C2=B114%     +90.2%        316 =C2=B116%  sched_debug.cpu#21.tt=
wu_local
     22218 =C2=B148%    +910.3%     224477 =C2=B148%  sched_debug.cpu#4.sch=
ed_count
    192.76 =C2=B148%    +437.1%    1035.32 =C2=B148%  sched_debug.cfs_rq[22=
]:/.exec_clock
     72170 =C2=B118%     -53.8%      33348 =C2=B146%  sched_debug.cfs_rq[8]=
:/.exec_clock
    141319 =C2=B116%     -51.4%      68708 =C2=B142%  sched_debug.cfs_rq[8]=
:/.min_vruntime
       675 =C2=B117%     -46.2%        363 =C2=B118%  sched_debug.cpu#24.sc=
hed_goidle
       223 =C2=B1 4%     -55.6%         99 =C2=B143%  sched_debug.cpu#0.cpu=
_load[2]
      3102 =C2=B1 9%     -67.4%       1010 =C2=B124%  sched_debug.cpu#20.cu=
rr->pid
         8 =C2=B1 5%     -34.6%          5 =C2=B122%  sched_debug.cfs_rq[25=
]:/.nr_spread_over
       243 =C2=B1 5%     -53.7%        112 =C2=B140%  sched_debug.cpu#0.cpu=
_load[3]
    943654 =C2=B1 0%      -7.9%     869181 =C2=B1 5%  sched_debug.cpu#3.avg=
_idle
       375 =C2=B125%     -56.2%        164 =C2=B127%  sched_debug.cfs_rq[18=
]:/.tg_load_contrib
       200 =C2=B1 3%     -57.8%         84 =C2=B149%  sched_debug.cpu#0.cpu=
_load[1]
       375 =C2=B125%     -56.2%        164 =C2=B127%  sched_debug.cfs_rq[18=
]:/.blocked_load_avg
        82 =C2=B1 8%     -66.8%         27 =C2=B136%  sched_debug.cpu#20.cp=
u_load[3]
      0.64 =C2=B122%     -64.1%       0.23 =C2=B114%  turbostat.%c3
       161 =C2=B1 7%     -70.4%         47 =C2=B126%  sched_debug.cpu#20.cp=
u_load[1]
       327 =C2=B115%     -26.4%        241 =C2=B116%  sched_debug.cpu#26.tt=
wu_local
        47 =C2=B1 8%     -60.8%         18 =C2=B145%  sched_debug.cpu#20.cp=
u_load[4]
       151 =C2=B1 2%     -40.7%         89 =C2=B148%  sched_debug.cfs_rq[8]=
:/.load
       257 =C2=B1 5%     -52.1%        123 =C2=B139%  sched_debug.cpu#0.cpu=
_load[4]
       151 =C2=B1 2%     -39.0%         92 =C2=B144%  sched_debug.cpu#8.load
       165 =C2=B1 7%     -69.2%         51 =C2=B123%  sched_debug.cpu#20.cp=
u_load[0]
      7874 =C2=B1 9%     -33.1%       5264 =C2=B123%  sched_debug.cpu#0.ttw=
u_local
     14892 =C2=B1 1%    +242.6%      51016 =C2=B149%  numa-vmstat.node1.num=
a_other
       310 =C2=B1 2%     -37.6%        194 =C2=B145%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
      4812 =C2=B116%    +144.7%      11778 =C2=B124%  sched_debug.cpu#28.tt=
wu_count
        88 =C2=B1 0%     -41.3%         51 =C2=B148%  sched_debug.cpu#1.cpu=
_load[0]
        84 =C2=B114%     +43.3%        121 =C2=B121%  sched_debug.cpu#27.tt=
wu_local
       165 =C2=B1 7%     -70.2%         49 =C2=B121%  sched_debug.cfs_rq[20=
]:/.runnable_load_avg
       120 =C2=B1 9%     -44.2%         67 =C2=B121%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
       125 =C2=B124%     -39.9%         75 =C2=B1 4%  sched_debug.cpu#11.lo=
ad
    556084 =C2=B126%     -46.6%     296758 =C2=B142%  sched_debug.cpu#1.sch=
ed_goidle
      2211 =C2=B114%     -29.4%       1560 =C2=B111%  sched_debug.cpu#3.ttw=
u_local
      1410 =C2=B132%     -45.0%        775 =C2=B126%  proc-vmstat.numa_hint=
_faults
      1822 =C2=B145%     -84.2%        287 =C2=B1 4%  sched_debug.cpu#17.sc=
hed_goidle
    701369 =C2=B116%     -58.8%     289218 =C2=B144%  sched_debug.cpu#0.ttw=
u_count
      1451 =C2=B131%     -43.7%        816 =C2=B124%  proc-vmstat.numa_pte_=
updates
   1112623 =C2=B126%     -46.3%     597441 =C2=B142%  sched_debug.cpu#1.nr_=
switches
       167 =C2=B1 7%     -70.5%         49 =C2=B121%  sched_debug.cfs_rq[20=
]:/.load
       167 =C2=B1 7%     -70.5%         49 =C2=B121%  sched_debug.cpu#20.lo=
ad
    550128 =C2=B1 9%     +44.6%     795580 =C2=B115%  sched_debug.cpu#1.avg=
_idle
       127 =C2=B1 8%     -69.9%         38 =C2=B130%  sched_debug.cpu#20.cp=
u_load[2]
         3 =C2=B112%     -45.5%          2 =C2=B140%  sched_debug.cpu#18.cp=
u_load[4]
      4664 =C2=B110%     +60.8%       7501 =C2=B120%  sched_debug.cfs_rq[21=
]:/.min_vruntime
    118108 =C2=B1 2%      -9.1%     107394 =C2=B1 5%  sched_debug.cpu#9.nr_=
load_updates
      4084 =C2=B115%     +48.9%       6082 =C2=B116%  sched_debug.cfs_rq[28=
]:/.min_vruntime
      1506 =C2=B110%     +28.5%       1934 =C2=B114%  sched_debug.cpu#18.sc=
hed_count
       282 =C2=B1 8%     -59.0%        116 =C2=B143%  sched_debug.cfs_rq[26=
]:/.blocked_load_avg
       285 =C2=B1 9%     -58.7%        117 =C2=B140%  sched_debug.cfs_rq[26=
]:/.tg_load_contrib
      5004 =C2=B125%     -35.7%       3217 =C2=B116%  sched_debug.cfs_rq[31=
]:/.min_vruntime
   1131632 =C2=B125%     -45.5%     616403 =C2=B142%  sched_debug.cpu#1.sch=
ed_count
       459 =C2=B112%     -30.7%        318 =C2=B119%  sched_debug.cfs_rq[18=
]:/.avg->runnable_avg_sum
       128 =C2=B1 3%     -43.8%         72 =C2=B128%  sched_debug.cpu#3.load
      1466 =C2=B1 3%     -41.8%        854 =C2=B146%  sched_debug.cpu#8.cur=
r->pid
    996199 =C2=B1 0%     -11.1%     885680 =C2=B1 8%  sched_debug.cpu#6.avg=
_idle
       743 =C2=B116%     -32.9%        498 =C2=B110%  cpuidle.C3-SNB.usage
 1.416e+08 =C2=B111%     +34.5%  1.905e+08 =C2=B117%  cpuidle.C1-SNB.time
     74056 =C2=B116%     -45.2%      40609 =C2=B138%  sched_debug.cpu#0.nr_=
load_updates
     33054 =C2=B1 3%     +41.9%      46916 =C2=B1 3%  softirqs.RCU
     70652 =C2=B117%     -49.4%      35731 =C2=B141%  sched_debug.cfs_rq[0]=
:/.exec_clock
    136723 =C2=B115%     -39.7%      82462 =C2=B134%  sched_debug.cfs_rq[0]=
:/.min_vruntime
       654 =C2=B110%     +27.7%        836 =C2=B117%  sched_debug.cpu#18.sc=
hed_goidle
    125106 =C2=B1 4%     -11.0%     111302 =C2=B1 4%  sched_debug.cpu#8.nr_=
load_updates
       122 =C2=B1 6%     -44.1%         68 =C2=B127%  sched_debug.cfs_rq[3]=
:/.load
         9 =C2=B112%     -34.5%          6 =C2=B119%  sched_debug.cfs_rq[18=
]:/.tg_runnable_contrib
    660329 =C2=B111%     +16.4%     768895 =C2=B1 4%  sched_debug.cpu#11.av=
g_idle
       405 =C2=B1 7%     +21.1%        490 =C2=B1 6%  slabinfo.kmem_cache.a=
ctive_objs
       405 =C2=B1 7%     +21.1%        490 =C2=B1 6%  slabinfo.kmem_cache.n=
um_objs
      1513 =C2=B1 5%     -49.0%        771 =C2=B125%  sched_debug.cpu#3.cur=
r->pid
     69624 =C2=B114%     +26.2%      87837 =C2=B1 3%  sched_debug.cpu#2.nr_=
load_updates
    308728 =C2=B1 1%     -16.1%     258979 =C2=B1 0%  cpuidle.C7-SNB.usage
    988675 =C2=B1 0%      -9.8%     891351 =C2=B1 4%  sched_debug.cpu#4.avg=
_idle
       514 =C2=B1 5%     +16.6%        599 =C2=B1 5%  slabinfo.kmem_cache_n=
ode.active_objs
       533 =C2=B1 5%     +16.0%        618 =C2=B1 4%  slabinfo.kmem_cache_n=
ode.num_objs
      1492 =C2=B110%     +28.8%       1921 =C2=B114%  sched_debug.cpu#18.nr=
_switches
     11153 =C2=B1 9%     +17.4%      13091 =C2=B1 4%  slabinfo.kmalloc-256.=
active_objs
      3919 =C2=B1 5%     -11.6%       3463 =C2=B1 7%  sched_debug.cfs_rq[24=
]:/.tg_load_avg
      3902 =C2=B1 4%     -11.3%       3460 =C2=B1 7%  sched_debug.cfs_rq[15=
]:/.tg_load_avg
      3918 =C2=B1 6%     -11.7%       3462 =C2=B1 6%  sched_debug.cfs_rq[19=
]:/.tg_load_avg
      3915 =C2=B1 5%     -11.8%       3451 =C2=B1 8%  sched_debug.cfs_rq[25=
]:/.tg_load_avg
      3920 =C2=B1 6%     -11.8%       3459 =C2=B1 6%  sched_debug.cfs_rq[20=
]:/.tg_load_avg
      3929 =C2=B1 5%     -11.4%       3479 =C2=B1 6%  sched_debug.cfs_rq[21=
]:/.tg_load_avg
      3919 =C2=B1 5%     -11.1%       3483 =C2=B1 7%  sched_debug.cfs_rq[18=
]:/.tg_load_avg
      3887 =C2=B1 5%     -11.4%       3442 =C2=B1 7%  sched_debug.cfs_rq[9]=
:/.tg_load_avg
      3907 =C2=B1 5%     -10.6%       3494 =C2=B1 7%  sched_debug.cfs_rq[23=
]:/.tg_load_avg
      3897 =C2=B1 4%     -11.1%       3464 =C2=B1 7%  sched_debug.cfs_rq[12=
]:/.tg_load_avg
      3890 =C2=B1 6%     -10.8%       3469 =C2=B1 8%  sched_debug.cfs_rq[30=
]:/.tg_load_avg
      3881 =C2=B1 6%     -11.2%       3447 =C2=B1 7%  sched_debug.cfs_rq[31=
]:/.tg_load_avg
      3892 =C2=B1 5%     -11.4%       3449 =C2=B1 7%  sched_debug.cfs_rq[8]=
:/.tg_load_avg
      3920 =C2=B1 5%     -11.1%       3486 =C2=B1 6%  sched_debug.cfs_rq[22=
]:/.tg_load_avg
      3940 =C2=B1 4%     -11.5%       3485 =C2=B1 6%  sched_debug.cfs_rq[1]=
:/.tg_load_avg
      3891 =C2=B1 5%     -11.3%       3449 =C2=B1 7%  sched_debug.cfs_rq[26=
]:/.tg_load_avg
      3904 =C2=B1 4%     -11.2%       3469 =C2=B1 7%  sched_debug.cfs_rq[11=
]:/.tg_load_avg
      3906 =C2=B1 5%     -10.7%       3489 =C2=B1 6%  sched_debug.cfs_rq[16=
]:/.tg_load_avg
      3908 =C2=B1 4%     -11.7%       3452 =C2=B1 7%  sched_debug.cfs_rq[10=
]:/.tg_load_avg
      3875 =C2=B1 5%      -9.9%       3492 =C2=B1 8%  sched_debug.cfs_rq[29=
]:/.tg_load_avg
       499 =C2=B1 4%     -11.7%        440 =C2=B1 6%  numa-vmstat.node0.nr_=
page_table_pages
      3878 =C2=B1 4%     -10.5%       3472 =C2=B1 7%  sched_debug.cfs_rq[13=
]:/.tg_load_avg
      3899 =C2=B1 6%     -10.8%       3479 =C2=B1 7%  sched_debug.cfs_rq[27=
]:/.tg_load_avg
      3873 =C2=B1 5%     -10.5%       3466 =C2=B1 7%  sched_debug.cfs_rq[14=
]:/.tg_load_avg
      3909 =C2=B1 4%     -10.5%       3498 =C2=B1 6%  sched_debug.cfs_rq[5]=
:/.tg_load_avg
      1992 =C2=B1 4%     -11.6%       1761 =C2=B1 6%  numa-meminfo.node0.Pa=
geTables
     11313 =C2=B1 9%     +17.2%      13260 =C2=B1 2%  slabinfo.kmalloc-256.=
num_objs
      3904 =C2=B1 5%     -11.6%       3452 =C2=B1 6%  sched_debug.cfs_rq[3]=
:/.tg_load_avg
      3903 =C2=B1 4%     -10.5%       3493 =C2=B1 6%  sched_debug.cfs_rq[6]=
:/.tg_load_avg
      3913 =C2=B1 5%     -11.6%       3461 =C2=B1 6%  sched_debug.cfs_rq[2]=
:/.tg_load_avg
      3896 =C2=B1 5%     -11.1%       3461 =C2=B1 7%  sched_debug.cfs_rq[7]=
:/.tg_load_avg
      3912 =C2=B1 4%     -10.9%       3486 =C2=B1 6%  sched_debug.cfs_rq[4]=
:/.tg_load_avg
      3915 =C2=B1 5%     -10.9%       3489 =C2=B1 6%  sched_debug.cfs_rq[17=
]:/.tg_load_avg
       417 =C2=B1 5%   +1714.5%       7572 =C2=B111%  time.involuntary_cont=
ext_switches
   1545546 =C2=B114%     +46.1%    2257840 =C2=B1 8%  time.voluntary_contex=
t_switches
        92 =C2=B1 0%      -4.0%         88 =C2=B1 1%  time.percent_of_cpu_t=
his_job_got
    266.95 =C2=B1 1%      -4.7%     254.49 =C2=B1 1%  time.system_time
     70.07 =C2=B1 0%      -1.7%      68.85 =C2=B1 1%  turbostat.Pkg_W
      0.00 =C2=B1 0%      -1.7%       0.00 =C2=B1 1%  energy.energy-pkg

testbox/testcase/testparams: lkp-a04/netperf/300s-200%-TCP_SENDFILE

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
       357 =C2=B114%     +48.2%        529 =C2=B1 5%  sched_debug.cfs_rq[2]=
:/.blocked_load_avg
    273340 =C2=B1 1%     +12.5%     307586 =C2=B1 8%  sched_debug.cfs_rq[1]=
:/.MIN_vruntime
    273341 =C2=B1 1%     +12.5%     307587 =C2=B1 8%  sched_debug.cfs_rq[1]=
:/.max_vruntime
       834 =C2=B1 7%     +22.7%       1024 =C2=B1 6%  sched_debug.cfs_rq[2]=
:/.tg_load_contrib
       422 =C2=B1 6%      +7.0%        451 =C2=B1 5%  sched_debug.cpu#1.cpu=
_load[0]
     17997 =C2=B113%     -37.6%      11222 =C2=B119%  sched_debug.cpu#0.sch=
ed_goidle
     58206 =C2=B116%     -35.2%      37726 =C2=B1 5%  meminfo.DirectMap4k
     73342 =C2=B1 3%      -7.3%      67960 =C2=B1 4%  softirqs.RCU
        50 =C2=B140%     -60.3%         20 =C2=B141%  cpuidle.C2-ATM.usage
     19996 =C2=B1 2%     -12.4%      17512 =C2=B1 1%  softirqs.SCHED
       234 =C2=B1 9%     -11.5%        207 =C2=B1 9%  cpuidle.C6-ATM.usage
       143 =C2=B1 0%      -1.2%        141 =C2=B1 0%  time.percent_of_cpu_t=
his_job_got
    415.97 =C2=B1 0%      -1.1%     411.58 =C2=B1 0%  time.system_time

testbox/testcase/testparams: lkp-sb03/nepim/300s-25%-udp

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
    613815 =C2=B1 1%      +7.4%     659052 =C2=B1 0%  nepim.udp.avg.kbps_out
     18732 =C2=B1 1%      +7.4%      20112 =C2=B1 0%  nepim.udp.avg.snd_s
   -320497 =C2=B1 0%      -7.2%    -297493 =C2=B1-2%  sched_debug.cfs_rq[24=
]:/.spread0
   -321084 =C2=B1 0%      -7.2%    -297847 =C2=B1-2%  sched_debug.cfs_rq[21=
]:/.spread0
   -320898 =C2=B1 0%      -7.1%    -298153 =C2=B1-2%  sched_debug.cfs_rq[30=
]:/.spread0
   -322176 =C2=B1 0%      -8.2%    -295627 =C2=B1-2%  sched_debug.cfs_rq[14=
]:/.spread0
   -317520 =C2=B1-1%     -10.0%    -285795 =C2=B1-6%  sched_debug.cfs_rq[12=
]:/.spread0
   -314487 =C2=B1-1%      -6.1%    -295166 =C2=B1-1%  sched_debug.cfs_rq[11=
]:/.spread0
   -321530 =C2=B1 0%      -7.6%    -296947 =C2=B1-2%  sched_debug.cfs_rq[15=
]:/.spread0
   -321302 =C2=B1 0%      -7.2%    -298254 =C2=B1-2%  sched_debug.cfs_rq[17=
]:/.spread0
   -321475 =C2=B1 0%      -7.5%    -297494 =C2=B1-1%  sched_debug.cfs_rq[23=
]:/.spread0
   -317814 =C2=B1 0%      -7.3%    -294474 =C2=B1-2%  sched_debug.cfs_rq[18=
]:/.spread0
   -321687 =C2=B1 0%      -7.7%    -296916 =C2=B1-2%  sched_debug.cfs_rq[29=
]:/.spread0
   -320368 =C2=B1 0%      -7.3%    -296887 =C2=B1-2%  sched_debug.cfs_rq[31=
]:/.spread0
   -322274 =C2=B1 0%      -7.5%    -298025 =C2=B1-1%  sched_debug.cfs_rq[22=
]:/.spread0
   -318704 =C2=B1 0%      -7.9%    -293419 =C2=B1-2%  sched_debug.cfs_rq[1]=
:/.spread0
   -317100 =C2=B1 0%      -8.0%    -291706 =C2=B1-1%  sched_debug.cfs_rq[5]=
:/.spread0
   -310371 =C2=B1-1%      -7.8%    -286235 =C2=B1-1%  sched_debug.cfs_rq[3]=
:/.spread0
   -320602 =C2=B1 0%      -7.6%    -296275 =C2=B1-1%  sched_debug.cfs_rq[19=
]:/.spread0
   -314944 =C2=B1-1%      -8.4%    -288396 =C2=B1-2%  sched_debug.cfs_rq[2]=
:/.spread0
   -320652 =C2=B1 0%      -7.6%    -296167 =C2=B1-2%  sched_debug.cfs_rq[20=
]:/.spread0
   -317734 =C2=B1 0%      -8.1%    -292103 =C2=B1-2%  sched_debug.cfs_rq[6]=
:/.spread0
   -320529 =C2=B1 0%      -8.3%    -293841 =C2=B1-2%  sched_debug.cfs_rq[26=
]:/.spread0
   -314699 =C2=B1 0%      -7.1%    -292485 =C2=B1-2%  sched_debug.cfs_rq[16=
]:/.spread0
      2163 =C2=B112%     -79.7%        438 =C2=B129%  sched_debug.cpu#14.tt=
wu_count
   -321151 =C2=B1 0%      -8.0%    -295420 =C2=B1-1%  sched_debug.cfs_rq[27=
]:/.spread0
   -319401 =C2=B1-1%      -7.5%    -295562 =C2=B1-1%  sched_debug.cfs_rq[13=
]:/.spread0
      1421 =C2=B116%     -76.9%        329 =C2=B120%  sched_debug.cpu#5.ttw=
u_local
   -315126 =C2=B1 0%      -7.8%    -290630 =C2=B1-1%  sched_debug.cfs_rq[4]=
:/.spread0
   -313540 =C2=B1 0%      -7.0%    -291520 =C2=B1-2%  sched_debug.cfs_rq[7]=
:/.spread0
   -320276 =C2=B1 0%      -7.6%    -295808 =C2=B1-2%  sched_debug.cfs_rq[28=
]:/.spread0
      1719 =C2=B1 3%     -83.4%        284 =C2=B122%  sched_debug.cpu#7.ttw=
u_local
      1383 =C2=B131%     -87.7%        170 =C2=B135%  sched_debug.cpu#13.tt=
wu_local
         3 =C2=B128%     -60.0%          1 =C2=B135%  sched_debug.cpu#16.cp=
u_load[3]
       947 =C2=B113%     -89.0%        104 =C2=B119%  sched_debug.cpu#14.tt=
wu_local
      7606 =C2=B114%    +498.2%      45499 =C2=B1 1%  sched_debug.cpu#25.sc=
hed_count
      2230 =C2=B111%     -84.7%        340 =C2=B112%  sched_debug.cpu#4.ttw=
u_local
       616 =C2=B1 5%    +618.8%       4432 =C2=B137%  sched_debug.cfs_rq[2]=
:/.exec_clock
   -321906 =C2=B1 0%      -8.0%    -296005 =C2=B1-2%  sched_debug.cfs_rq[9]=
:/.spread0
      1487 =C2=B1 7%     -79.2%        310 =C2=B1 4%  sched_debug.cpu#6.ttw=
u_local
      3778 =C2=B121%     -89.7%        387 =C2=B115%  sched_debug.cpu#10.tt=
wu_local
      2539 =C2=B113%     -79.4%        522 =C2=B120%  sched_debug.cpu#13.tt=
wu_count
      3463 =C2=B114%     -58.5%       1436 =C2=B137%  sched_debug.cpu#12.tt=
wu_count
      3554 =C2=B148%     -80.3%        699 =C2=B138%  sched_debug.cpu#15.tt=
wu_count
      2673 =C2=B1 6%     +88.2%       5031 =C2=B1 4%  sched_debug.cpu#16.tt=
wu_count
   -320748 =C2=B1 0%      -8.5%    -293620 =C2=B1-2%  sched_debug.cfs_rq[8]=
:/.spread0
      6636 =C2=B1 3%    +585.6%      45494 =C2=B1 1%  sched_debug.cpu#25.nr=
_switches
      6495 =C2=B113%     -75.6%       1584 =C2=B1 9%  sched_debug.cpu#10.tt=
wu_count
      3089 =C2=B112%     -73.1%        829 =C2=B110%  sched_debug.cpu#5.ttw=
u_count
      2309 =C2=B121%     -86.4%        313 =C2=B1 5%  sched_debug.cpu#1.ttw=
u_local
      3199 =C2=B1 4%     -77.4%        723 =C2=B122%  sched_debug.cpu#7.ttw=
u_count
      4826 =C2=B1 6%     +42.5%       6875 =C2=B1 3%  sched_debug.cpu#16.nr=
_switches
      6572 =C2=B1 3%    +199.1%      19657 =C2=B119%  sched_debug.cpu#26.nr=
_load_updates
      4409 =C2=B113%     -75.4%       1086 =C2=B1 5%  sched_debug.cpu#4.ttw=
u_count
      9187 =C2=B133%     -59.8%       3693 =C2=B138%  sched_debug.cpu#15.nr=
_switches
      4413 =C2=B1 4%      -9.5%       3994 =C2=B1 2%  sched_debug.cpu#28.sc=
hed_count
       941 =C2=B119%     -32.8%        632 =C2=B120%  sched_debug.cfs_rq[11=
]:/.max_vruntime
       941 =C2=B119%     -32.8%        632 =C2=B120%  sched_debug.cfs_rq[11=
]:/.MIN_vruntime
      6219 =C2=B119%     -75.8%       1502 =C2=B115%  sched_debug.cpu#9.sch=
ed_count
       776 =C2=B115%    +107.5%       1610 =C2=B1 5%  sched_debug.cpu#16.tt=
wu_local
      4564 =C2=B133%     -60.3%       1813 =C2=B139%  sched_debug.cpu#15.sc=
hed_goidle
      1128 =C2=B1 4%     +15.3%       1300 =C2=B1 8%  sched_debug.cfs_rq[3]=
:/.exec_clock
      1795 =C2=B138%    +132.6%       4177 =C2=B149%  sched_debug.cpu#26.tt=
wu_count
      5520 =C2=B110%    +454.6%      30617 =C2=B1 2%  sched_debug.cpu#25.tt=
wu_count
     11528 =C2=B137%     -52.6%       5467 =C2=B134%  sched_debug.cpu#13.sc=
hed_count
       433 =C2=B137%    +385.1%       2100 =C2=B133%  sched_debug.cpu#24.nr=
_switches
       445 =C2=B136%    +374.1%       2113 =C2=B133%  sched_debug.cpu#24.sc=
hed_count
      3728 =C2=B1 6%     -48.6%       1917 =C2=B133%  sched_debug.cpu#6.ttw=
u_count
       186 =C2=B122%     +87.8%        350 =C2=B116%  sched_debug.cpu#22.tt=
wu_count
      5998 =C2=B1 2%    +197.5%      17846 =C2=B117%  sched_debug.cpu#30.nr=
_load_updates
      9644 =C2=B1 9%     -23.3%       7395 =C2=B1 4%  sched_debug.cfs_rq[16=
]:/.min_vruntime
      2692 =C2=B1 5%     -58.6%       1115 =C2=B1 5%  sched_debug.cpu#11.tt=
wu_local
      4838 =C2=B1 6%     +42.4%       6888 =C2=B1 3%  sched_debug.cpu#16.sc=
hed_count
      6623 =C2=B1 7%     -59.4%       2689 =C2=B145%  sched_debug.cpu#14.nr=
_switches
      0.13 =C2=B1 3%    +268.4%       0.47 =C2=B1 2%  turbostat.%pc2
      2065 =C2=B1 6%     +18.2%       2441 =C2=B1 4%  sched_debug.cpu#16.sc=
hed_goidle
      1167 =C2=B117%   +1248.5%      15736 =C2=B1 2%  sched_debug.cpu#25.tt=
wu_local
      9982 =C2=B138%     -51.2%       4866 =C2=B121%  sched_debug.cpu#15.sc=
hed_count
      4218 =C2=B121%     -78.8%        892 =C2=B1 3%  sched_debug.cpu#1.ttw=
u_count
     12688 =C2=B117%     -63.2%       4669 =C2=B1 8%  sched_debug.cpu#10.nr=
_switches
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  sched_debug.cfs_rq[11=
]:/.runnable_load_avg
      7783 =C2=B1 3%     -41.9%       4521 =C2=B1 6%  sched_debug.cpu#6.nr_=
switches
       191 =C2=B133%    +437.2%       1029 =C2=B133%  sched_debug.cpu#24.sc=
hed_goidle
       174 =C2=B120%     +37.1%        239 =C2=B116%  sched_debug.cfs_rq[2]=
:/.avg->runnable_avg_sum
      4400 =C2=B1 4%      -9.5%       3983 =C2=B1 2%  sched_debug.cpu#28.nr=
_switches
      3289 =C2=B1 7%     -60.1%       1312 =C2=B147%  sched_debug.cpu#14.sc=
hed_goidle
       113 =C2=B128%     +56.6%        177 =C2=B114%  sched_debug.cpu#19.tt=
wu_local
      4013 =C2=B1 6%     -42.4%       2311 =C2=B1 7%  sched_debug.cpu#5.sch=
ed_goidle
      5240 =C2=B1 3%     -30.9%       3623 =C2=B118%  sched_debug.cpu#12.sc=
hed_goidle
       746 =C2=B123%     +33.2%        994 =C2=B120%  sched_debug.cpu#22.sc=
hed_count
     10760 =C2=B1 3%     -18.3%       8796 =C2=B1 4%  sched_debug.cpu#3.sch=
ed_goidle
         7 =C2=B125%     +50.0%         11 =C2=B1 0%  sched_debug.cfs_rq[26=
]:/.tg_runnable_contrib
       353 =C2=B1 7%     +45.1%        513 =C2=B1 3%  sched_debug.cpu#21.tt=
wu_count
       369 =C2=B122%     +48.7%        548 =C2=B1 2%  sched_debug.cfs_rq[26=
]:/.avg->runnable_avg_sum
      3879 =C2=B1 3%     -43.2%       2204 =C2=B1 6%  sched_debug.cpu#6.sch=
ed_goidle
      8154 =C2=B1 9%     -50.3%       4056 =C2=B1 7%  sched_debug.cpu#13.nr=
_switches
      6518 =C2=B1 8%     -37.8%       4055 =C2=B110%  sched_debug.cpu#11.tt=
wu_count
     12545 =C2=B119%     +94.3%      24380 =C2=B117%  sched_debug.cpu#0.sch=
ed_count
     12125 =C2=B1 7%     -35.9%       7767 =C2=B122%  sched_debug.cpu#12.sc=
hed_count
       874 =C2=B116%     +27.0%       1110 =C2=B1 2%  sched_debug.cpu#19.sc=
hed_count
     15301 =C2=B123%     -55.3%       6839 =C2=B144%  sched_debug.cpu#10.sc=
hed_count
      8071 =C2=B1 6%     -41.6%       4710 =C2=B1 6%  sched_debug.cpu#5.nr_=
switches
      6935 =C2=B1 1%    +164.2%      18321 =C2=B115%  sched_debug.cpu#28.nr=
_load_updates
    160.08 =C2=B121%     -57.4%      68.24 =C2=B117%  sched_debug.cfs_rq[17=
]:/.exec_clock
      4035 =C2=B110%     -51.2%       1968 =C2=B1 8%  sched_debug.cpu#13.sc=
hed_goidle
      6166 =C2=B1 4%     -36.1%       3938 =C2=B1 1%  sched_debug.cpu#4.sch=
ed_goidle
     12390 =C2=B1 4%     -35.6%       7979 =C2=B1 1%  sched_debug.cpu#4.nr_=
switches
      2013 =C2=B113%     -40.4%       1199 =C2=B122%  sched_debug.cfs_rq[31=
]:/.exec_clock
     21917 =C2=B1 3%     -23.4%      16789 =C2=B1 3%  sched_debug.cpu#11.nr=
_switches
      2889 =C2=B111%     +38.8%       4009 =C2=B1 4%  sched_debug.cpu#0.ttw=
u_local
      1770 =C2=B1 4%      -9.9%       1595 =C2=B1 3%  sched_debug.cpu#28.sc=
hed_goidle
      9373 =C2=B1 1%    +122.2%      20825 =C2=B113%  sched_debug.cpu#16.nr=
_load_updates
     21640 =C2=B1 3%     -17.4%      17875 =C2=B1 4%  sched_debug.cpu#3.nr_=
switches
      2436 =C2=B127%     +59.0%       3874 =C2=B1 8%  sched_debug.cfs_rq[9]=
:/.min_vruntime
       141 =C2=B142%     +78.5%        251 =C2=B131%  sched_debug.cfs_rq[21=
]:/.avg->runnable_avg_sum
         5 =C2=B1 8%     -25.0%          4 =C2=B1 0%  sched_debug.cfs_rq[10=
]:/.nr_spread_over
      6297 =C2=B1 1%    +180.9%      17692 =C2=B116%  sched_debug.cpu#22.nr=
_load_updates
     23813 =C2=B1 5%     -26.3%      17540 =C2=B1 9%  sched_debug.cpu#11.sc=
hed_count
      7203 =C2=B110%     +51.3%      10901 =C2=B1 6%  sched_debug.cpu#0.nr_=
switches
      6103 =C2=B1 0%    +184.8%      17380 =C2=B116%  sched_debug.cpu#29.nr=
_load_updates
      6345 =C2=B1 1%    +179.0%      17704 =C2=B116%  sched_debug.cpu#21.nr=
_load_updates
      6778 =C2=B113%     -38.3%       4182 =C2=B1 1%  sched_debug.cpu#3.ttw=
u_count
      7185 =C2=B1 2%    +158.0%      18540 =C2=B114%  sched_debug.cpu#20.nr=
_load_updates
     10557 =C2=B1 3%     -30.0%       7389 =C2=B117%  sched_debug.cpu#12.nr=
_switches
     10861 =C2=B1 3%     -24.2%       8234 =C2=B1 3%  sched_debug.cpu#11.sc=
hed_goidle
      6415 =C2=B1 1%    +185.0%      18284 =C2=B117%  sched_debug.cpu#17.nr=
_load_updates
      6453 =C2=B1 2%    +183.8%      18311 =C2=B110%  sched_debug.cpu#31.nr=
_load_updates
      6222 =C2=B1 2%    +193.1%      18237 =C2=B117%  sched_debug.cpu#24.nr=
_load_updates
        92 =C2=B1 6%    +170.3%        248 =C2=B145%  sched_debug.cpu#27.tt=
wu_local
      7028 =C2=B1 3%    +162.9%      18480 =C2=B115%  sched_debug.cpu#18.nr=
_load_updates
      7966 =C2=B1 5%     -51.4%       3869 =C2=B113%  sched_debug.cpu#7.nr_=
switches
      5522 =C2=B112%     -30.6%       3833 =C2=B110%  sched_debug.cpu#2.sch=
ed_goidle
      3962 =C2=B1 5%     -52.1%       1899 =C2=B113%  sched_debug.cpu#7.sch=
ed_goidle
      4947 =C2=B118%     -53.5%       2300 =C2=B112%  sched_debug.cpu#1.sch=
ed_goidle
      6343 =C2=B1 0%    +182.5%      17920 =C2=B115%  sched_debug.cpu#19.nr=
_load_updates
      2816 =C2=B110%     -50.2%       1402 =C2=B1 3%  sched_debug.cpu#3.ttw=
u_local
      6187 =C2=B1 1%    +198.2%      18452 =C2=B116%  sched_debug.cpu#27.nr=
_load_updates
      6690 =C2=B1 8%     +45.0%       9701 =C2=B1 4%  sched_debug.cpu#0.ttw=
u_count
      6420 =C2=B1 1%    +183.9%      18227 =C2=B118%  sched_debug.cpu#23.nr=
_load_updates
       341 =C2=B124%     +34.7%        460 =C2=B120%  sched_debug.cpu#22.sc=
hed_goidle
     10009 =C2=B117%     -53.0%       4701 =C2=B112%  sched_debug.cpu#1.nr_=
switches
       862 =C2=B116%     +27.3%       1097 =C2=B1 2%  sched_debug.cpu#19.nr=
_switches
      3816 =C2=B121%     +58.3%       6040 =C2=B118%  sched_debug.cfs_rq[26=
]:/.min_vruntime
      3259 =C2=B122%     -37.6%       2033 =C2=B110%  sched_debug.cfs_rq[21=
]:/.min_vruntime
      7691 =C2=B116%    +137.7%      18283 =C2=B115%  sched_debug.cpu#9.nr_=
load_updates
      2017 =C2=B114%     +53.7%       3101 =C2=B1 2%  sched_debug.cpu#0.sch=
ed_goidle
      9970 =C2=B1 0%     +94.2%      19358 =C2=B113%  sched_debug.cpu#7.nr_=
load_updates
      3040 =C2=B115%     -46.5%       1626 =C2=B112%  sched_debug.cfs_rq[17=
]:/.min_vruntime
       404 =C2=B113%    +118.1%        881 =C2=B121%  sched_debug.cpu#19.tt=
wu_count
       735 =C2=B123%     +33.6%        982 =C2=B120%  sched_debug.cpu#22.nr=
_switches
      9707 =C2=B1 1%    +102.0%      19613 =C2=B114%  sched_debug.cpu#6.nr_=
load_updates
      7028 =C2=B1 7%    +138.5%      16759 =C2=B115%  sched_debug.cpu#1.nr_=
load_updates
     11006 =C2=B1 2%     +83.2%      20160 =C2=B113%  sched_debug.cpu#4.nr_=
load_updates
      9640 =C2=B1 3%    +101.9%      19466 =C2=B114%  sched_debug.cpu#5.nr_=
load_updates
     10343 =C2=B114%     +86.3%      19265 =C2=B118%  sched_debug.cpu#15.nr=
_load_updates
      8734 =C2=B1 1%    +115.3%      18805 =C2=B114%  sched_debug.cpu#14.nr=
_load_updates
      9591 =C2=B1 4%    +100.4%      19225 =C2=B112%  sched_debug.cpu#13.nr=
_load_updates
    154763 =C2=B1 0%      -8.9%     141064 =C2=B1 2%  sched_debug.cfs_rq[0]=
:/.exec_clock
     12025 =C2=B1 6%     +73.6%      20879 =C2=B112%  sched_debug.cpu#11.nr=
_load_updates
     10341 =C2=B1 4%    +102.2%      20906 =C2=B114%  sched_debug.cpu#12.nr=
_load_updates
       934 =C2=B1 1%     -32.0%        635 =C2=B110%  cpuidle.C1E-SNB.usage
     10712 =C2=B110%    +104.0%      21852 =C2=B120%  sched_debug.cpu#8.nr_=
load_updates
     11875 =C2=B1 3%     +80.8%      21468 =C2=B113%  sched_debug.cpu#3.nr_=
load_updates
       465 =C2=B1 7%     -35.5%        300 =C2=B133%  sched_debug.cfs_rq[7]=
:/.exec_clock
       645 =C2=B114%     +40.0%        903 =C2=B115%  slabinfo.blkdev_reque=
sts.active_objs
       645 =C2=B114%     +40.0%        903 =C2=B115%  slabinfo.blkdev_reque=
sts.num_objs
    956772 =C2=B1 5%     -10.1%     859962 =C2=B1 5%  sched_debug.cpu#25.av=
g_idle
     10958 =C2=B1 3%     +79.7%      19689 =C2=B1 4%  sched_debug.cpu#2.nr_=
load_updates
    122784 =C2=B1 0%     -27.0%      89589 =C2=B1 3%  cpuidle.C7-SNB.usage
       672 =C2=B113%     +35.4%        910 =C2=B113%  slabinfo.xfs_buf.num_=
objs
       672 =C2=B113%     +35.4%        910 =C2=B113%  slabinfo.xfs_buf.acti=
ve_objs
      4671 =C2=B110%     -18.2%       3821 =C2=B1 6%  cpuidle.C1-SNB.usage
     37764 =C2=B1 2%     +60.0%      60411 =C2=B1 3%  softirqs.SCHED
     11061 =C2=B1 5%     +11.5%      12334 =C2=B1 4%  slabinfo.kmalloc-256.=
active_objs
   5821781 =C2=B1 8%     -18.0%    4773888 =C2=B110%  meminfo.DirectMap2M
    384047 =C2=B1 0%     +12.2%     430996 =C2=B1 1%  softirqs.TIMER
      1445 =C2=B1 1%     -12.4%       1266 =C2=B1 5%  slabinfo.sock_inode_c=
ache.active_objs
      1445 =C2=B1 1%     -12.4%       1266 =C2=B1 5%  slabinfo.sock_inode_c=
ache.num_objs
       364 =C2=B120%   +9569.9%      35198 =C2=B1 7%  time.involuntary_cont=
ext_switches
      2331 =C2=B1 0%      -3.5%       2250 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-a04/netperf/300s-200%-TCP_RR

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
       549 =C2=B1 6%     -11.5%        486 =C2=B1 2%  sched_debug.cfs_rq[0]=
:/.load
       244 =C2=B122%     +68.3%        411 =C2=B122%  sched_debug.cfs_rq[3]=
:/.blocked_load_avg
       705 =C2=B1 7%     +20.1%        846 =C2=B110%  sched_debug.cfs_rq[3]=
:/.tg_load_contrib
       836 =C2=B1 8%      +7.8%        901 =C2=B1 7%  sched_debug.cfs_rq[2]=
:/.tg_load_contrib
   3057027 =C2=B1 0%      +9.5%    3346840 =C2=B1 1%  sched_debug.cpu#3.nr_=
switches
       909 =C2=B1 9%     -15.6%        767 =C2=B1 1%  sched_debug.cfs_rq[0]=
:/.tg_load_contrib
   3113873 =C2=B1 3%      +8.1%    3365443 =C2=B1 0%  sched_debug.cpu#3.sch=
ed_count
   3055925 =C2=B1 0%     +10.9%    3389777 =C2=B1 2%  sched_debug.cpu#2.nr_=
switches
        21 =C2=B115%     -25.4%         15 =C2=B115%  sched_debug.cfs_rq[3]=
:/.nr_spread_over
       554 =C2=B1 1%     -12.8%        483 =C2=B1 3%  sched_debug.cpu#1.load
     14437 =C2=B145%     +83.7%      26517 =C2=B112%  cpuidle.C2-ATM.time
        27 =C2=B121%     +61.7%         43 =C2=B120%  cpuidle.C2-ATM.usage
    232546 =C2=B1 9%     -14.0%     200000 =C2=B112%  sched_debug.cfs_rq[3]=
:/.MIN_vruntime
    232546 =C2=B1 9%     -14.0%     200000 =C2=B112%  sched_debug.cfs_rq[3]=
:/.max_vruntime
        13 =C2=B1 9%     -29.3%          9 =C2=B1 4%  sched_debug.cfs_rq[2]=
:/.nr_spread_over
      0.93 =C2=B1 6%     -13.6%       0.81 =C2=B1 4%  perf-profile.cpu-cycl=
es.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_=
common.__wake_up_sync_key
     17732 =C2=B1 1%     -16.7%      14766 =C2=B1 4%  softirqs.SCHED
       128 =C2=B1 3%      +5.2%        135 =C2=B1 4%  uptime.idle
      8424 =C2=B1 6%     -10.2%       7561 =C2=B1 3%  slabinfo.kmalloc-64.n=
um_objs
      1.49 =C2=B1 4%      -8.3%       1.37 =C2=B1 2%  perf-profile.cpu-cycl=
es.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.sys_recvfrom

testbox/testcase/testparams: lkp-nex04/ebizzy/200%-100x-10s

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
        83 =C2=B1 0%      -2.0%         81 =C2=B1 0%  ebizzy.throughput.per=
_thread.min
     12681 =C2=B1 0%      -1.4%      12503 =C2=B1 0%  ebizzy.throughput
     41.83 =C2=B1 0%      +1.2%      42.33 =C2=B1 0%  ebizzy.time.user
    115275 =C2=B139%    -255.1%    -178796 =C2=B1-14%  sched_debug.cfs_rq[1=
]:/.spread0
       -20 =C2=B1-20%    +109.7%        -43 =C2=B1-16%  sched_debug.cpu#31.=
nr_uninterruptible
       -12 =C2=B1-45%    +171.1%        -34 =C2=B1-36%  sched_debug.cpu#15.=
nr_uninterruptible
       413 =C2=B141%     +59.7%        660 =C2=B113%  sched_debug.cfs_rq[19=
]:/.blocked_load_avg
    207474 =C2=B134%    +204.1%     630866 =C2=B132%  sched_debug.cpu#40.sc=
hed_count
        56 =C2=B118%    +112.5%        119 =C2=B113%  sched_debug.cpu#49.nr=
_uninterruptible
        17 =C2=B115%     +38.5%         24 =C2=B112%  sched_debug.cpu#14.cp=
u_load[1]
    149203 =C2=B121%    +181.6%     420151 =C2=B124%  sched_debug.cpu#54.sc=
hed_count
        37 =C2=B123%     -45.9%         20 =C2=B144%  sched_debug.cpu#4.load
    252107 =C2=B140%    +120.5%     556018 =C2=B134%  sched_debug.cpu#23.sc=
hed_count
    210263 =C2=B134%    +184.3%     597868 =C2=B144%  sched_debug.cpu#21.sc=
hed_count
    990810 =C2=B112%     +18.7%    1175867 =C2=B110%  sched_debug.cfs_rq[39=
]:/.spread0
       401 =C2=B138%     +50.2%        602 =C2=B1 8%  sched_debug.cfs_rq[25=
]:/.blocked_load_avg
        18 =C2=B111%     +29.1%         23 =C2=B1 7%  sched_debug.cpu#14.cp=
u_load[2]
        17 =C2=B1 7%     +20.8%         21 =C2=B1 5%  sched_debug.cpu#14.cp=
u_load[3]
       415 =C2=B137%     +47.6%        613 =C2=B1 8%  sched_debug.cfs_rq[25=
]:/.tg_load_contrib
        25 =C2=B1 4%     -28.6%         18 =C2=B126%  numa-numastat.node0.o=
ther_node
       426 =C2=B140%     +57.4%        671 =C2=B113%  sched_debug.cfs_rq[19=
]:/.tg_load_contrib
       457 =C2=B144%     +50.3%        687 =C2=B1 4%  sched_debug.cfs_rq[10=
]:/.blocked_load_avg
        12 =C2=B126%    +127.0%         28 =C2=B135%  sched_debug.cfs_rq[58=
]:/.load
        12 =C2=B126%    +154.1%         31 =C2=B144%  sched_debug.cpu#58.lo=
ad
       471 =C2=B143%     +48.6%        700 =C2=B1 4%  sched_debug.cfs_rq[10=
]:/.tg_load_contrib
    198896 =C2=B140%    +164.2%     525570 =C2=B149%  sched_debug.cpu#24.sc=
hed_count
        23 =C2=B112%     -34.8%         15 =C2=B123%  sched_debug.cfs_rq[26=
]:/.load
      2373 =C2=B1 0%     -14.8%       2021 =C2=B1 2%  sched_debug.cpu#21.sc=
hed_goidle
       367 =C2=B145%     +56.2%        574 =C2=B116%  sched_debug.cfs_rq[2]=
:/.blocked_load_avg
        17 =C2=B110%     +17.3%         20 =C2=B112%  sched_debug.cpu#27.cp=
u_load[2]
      2371 =C2=B1 2%     -12.9%       2064 =C2=B1 1%  sched_debug.cpu#16.sc=
hed_goidle
        17 =C2=B1 9%     +17.0%         20 =C2=B1 9%  sched_debug.cpu#27.cp=
u_load[3]
        14 =C2=B1 5%     -19.0%         11 =C2=B111%  sched_debug.cfs_rq[11=
]:/.runnable_load_avg
        18 =C2=B116%     -46.3%          9 =C2=B1 9%  sched_debug.cpu#26.cp=
u_load[0]
       402 =C2=B144%     +63.3%        657 =C2=B111%  sched_debug.cfs_rq[7]=
:/.tg_load_contrib
    262964 =C2=B146%     +78.4%     469186 =C2=B144%  sched_debug.cpu#47.sc=
hed_count
        39 =C2=B1 8%     -31.4%         27 =C2=B129%  sched_debug.cfs_rq[2]=
:/.load
        12 =C2=B126%    +102.7%         25 =C2=B137%  sched_debug.cpu#58.cp=
u_load[0]
        12 =C2=B126%     +81.1%         22 =C2=B129%  sched_debug.cfs_rq[58=
]:/.runnable_load_avg
       440 =C2=B145%     +58.7%        698 =C2=B116%  sched_debug.cfs_rq[20=
]:/.blocked_load_avg
      2555 =C2=B1 2%     -18.0%       2096 =C2=B1 4%  sched_debug.cpu#14.sc=
hed_goidle
         6 =C2=B125%     -50.0%          3 =C2=B128%  cpuidle.POLL.usage
        16 =C2=B110%     +28.0%         21 =C2=B1 2%  sched_debug.cpu#1.cpu=
_load[3]
    186638 =C2=B130%    +122.1%     414470 =C2=B143%  sched_debug.cpu#53.sc=
hed_count
       391 =C2=B144%     +51.4%        592 =C2=B115%  sched_debug.cfs_rq[2]=
:/.tg_load_contrib
        27 =C2=B147%     +96.3%         53 =C2=B138%  sched_debug.cpu#41.cp=
u_load[0]
        14 =C2=B131%     +84.1%         27 =C2=B120%  sched_debug.cpu#60.lo=
ad
        21 =C2=B130%     -52.3%         10 =C2=B112%  sched_debug.cpu#21.cp=
u_load[0]
       390 =C2=B146%     +65.6%        645 =C2=B111%  sched_debug.cfs_rq[7]=
:/.blocked_load_avg
     66283 =C2=B1 3%      +8.5%      71886 =C2=B1 2%  sched_debug.cpu#11.tt=
wu_count
        27 =C2=B147%     +85.4%         50 =C2=B135%  sched_debug.cfs_rq[41=
]:/.runnable_load_avg
       389 =C2=B143%     +64.2%        640 =C2=B1 8%  sched_debug.cfs_rq[29=
]:/.blocked_load_avg
        14 =C2=B122%     -34.1%          9 =C2=B1 9%  sched_debug.cfs_rq[26=
]:/.runnable_load_avg
       402 =C2=B141%     +62.3%        653 =C2=B1 7%  sched_debug.cfs_rq[29=
]:/.tg_load_contrib
    382891 =C2=B141%     +64.4%     629385 =C2=B123%  sched_debug.cpu#10.sc=
hed_count
        16 =C2=B1 5%     +20.8%         19 =C2=B1 2%  sched_debug.cpu#1.cpu=
_load[4]
      3299 =C2=B1 9%     -27.3%       2398 =C2=B1 3%  sched_debug.cpu#4.sch=
ed_goidle
        21 =C2=B134%     -45.3%         11 =C2=B138%  sched_debug.cpu#53.lo=
ad
    135693 =C2=B1 3%      +7.3%     145636 =C2=B1 2%  sched_debug.cpu#11.nr=
_switches
        20 =C2=B1 7%     -30.0%         14 =C2=B1 5%  sched_debug.cpu#21.cp=
u_load[1]
        17 =C2=B116%     +67.3%         29 =C2=B123%  sched_debug.cpu#28.lo=
ad
        15 =C2=B126%     +48.9%         23 =C2=B122%  sched_debug.cpu#9.load
       454 =C2=B144%     +56.6%        711 =C2=B115%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
       426 =C2=B147%     +56.8%        669 =C2=B110%  sched_debug.cfs_rq[21=
]:/.blocked_load_avg
        12 =C2=B110%     -21.6%          9 =C2=B1 4%  sched_debug.cfs_rq[19=
]:/.runnable_load_avg
        19 =C2=B1 4%     -17.5%         15 =C2=B1 6%  sched_debug.cpu#21.cp=
u_load[2]
       442 =C2=B146%     +54.6%        683 =C2=B110%  sched_debug.cfs_rq[21=
]:/.tg_load_contrib
        16 =C2=B1 2%      -8.0%         15 =C2=B1 3%  sched_debug.cpu#21.cp=
u_load[4]
        13 =C2=B122%     +89.7%         24 =C2=B134%  sched_debug.cpu#58.cp=
u_load[1]
        17 =C2=B1 2%      -9.4%         16 =C2=B1 5%  sched_debug.cpu#21.cp=
u_load[3]
      4281 =C2=B132%     -36.6%       2713 =C2=B1 5%  sched_debug.cpu#11.sc=
hed_goidle
    145077 =C2=B120%     +90.1%     275727 =C2=B141%  sched_debug.cpu#52.sc=
hed_count
        28 =C2=B144%     +75.0%         49 =C2=B132%  sched_debug.cpu#41.cp=
u_load[1]
        11 =C2=B1 8%    +114.3%         25 =C2=B125%  sched_debug.cfs_rq[59=
]:/.load
        13 =C2=B1 6%    +170.7%         37 =C2=B145%  sched_debug.cpu#3.cpu=
_load[0]
      3270 =C2=B118%     -24.3%       2474 =C2=B1 6%  sched_debug.cpu#1.sch=
ed_goidle
        12 =C2=B1 7%     +71.1%         21 =C2=B1 4%  sched_debug.cfs_rq[1]=
:/.runnable_load_avg
        22 =C2=B131%     +52.2%         34 =C2=B124%  sched_debug.cpu#10.lo=
ad
        12 =C2=B1 7%    +100.0%         25 =C2=B1 6%  sched_debug.cfs_rq[1]=
:/.load
    160297 =C2=B130%     +44.2%     231073 =C2=B124%  sched_debug.cpu#35.sc=
hed_count
      2223 =C2=B1 0%     -12.5%       1946 =C2=B1 2%  sched_debug.cpu#17.sc=
hed_goidle
        18 =C2=B111%     +80.4%         33 =C2=B121%  sched_debug.cfs_rq[18=
]:/.load
      2379 =C2=B1 8%     -12.3%       2085 =C2=B1 7%  sched_debug.cpu#22.sc=
hed_goidle
        42 =C2=B1 6%     -35.2%         27 =C2=B127%  sched_debug.cfs_rq[20=
]:/.load
        20 =C2=B134%     -43.5%         11 =C2=B126%  sched_debug.cfs_rq[54=
]:/.load
        20 =C2=B134%     -43.5%         11 =C2=B126%  sched_debug.cpu#54.lo=
ad
    202074 =C2=B126%     +85.4%     374733 =C2=B140%  sched_debug.cpu#49.sc=
hed_count
        24 =C2=B123%     -49.3%         12 =C2=B121%  sched_debug.cpu#6.load
        13 =C2=B118%    +132.5%         31 =C2=B118%  sched_debug.cpu#43.lo=
ad
    203456 =C2=B124%    +157.7%     524260 =C2=B141%  sched_debug.cpu#20.sc=
hed_count
    200838 =C2=B121%    +129.5%     460986 =C2=B118%  sched_debug.cpu#18.sc=
hed_count
       400 =C2=B145%     +49.9%        600 =C2=B111%  sched_debug.cfs_rq[26=
]:/.blocked_load_avg
       415 =C2=B144%     +46.7%        609 =C2=B110%  sched_debug.cfs_rq[26=
]:/.tg_load_contrib
       368 =C2=B146%     +78.1%        656 =C2=B114%  sched_debug.cfs_rq[22=
]:/.blocked_load_avg
        12 =C2=B1 7%     -23.7%          9 =C2=B1 9%  sched_debug.cfs_rq[16=
]:/.runnable_load_avg
       380 =C2=B144%     +75.2%        666 =C2=B113%  sched_debug.cfs_rq[22=
]:/.tg_load_contrib
        16 =C2=B115%     -44.0%          9 =C2=B1 5%  sched_debug.cpu#45.cp=
u_load[0]
        16 =C2=B115%     -44.0%          9 =C2=B113%  sched_debug.cfs_rq[45=
]:/.runnable_load_avg
        28 =C2=B117%     +89.5%         54 =C2=B141%  sched_debug.cpu#45.nr=
_uninterruptible
        15 =C2=B130%     -40.0%          9 =C2=B1 9%  sched_debug.cfs_rq[37=
]:/.runnable_load_avg
       208 =C2=B1 0%     -28.2%        149 =C2=B110%  proc-vmstat.nr_dirtied
        17 =C2=B119%     -42.3%         10 =C2=B1 8%  sched_debug.cpu#45.cp=
u_load[1]
        14 =C2=B128%     +61.4%         23 =C2=B128%  sched_debug.cfs_rq[48=
]:/.load
        20 =C2=B127%     +62.9%         33 =C2=B128%  sched_debug.cpu#62.lo=
ad
    123063 =C2=B1 5%     +82.2%     224204 =C2=B145%  sched_debug.cpu#60.sc=
hed_count
        16 =C2=B123%     +96.0%         32 =C2=B141%  sched_debug.cpu#6.cpu=
_load[0]
        15 =C2=B116%     -26.1%         11 =C2=B111%  sched_debug.cpu#38.cp=
u_load[1]
       432 =C2=B144%     +60.5%        694 =C2=B1 8%  sched_debug.cfs_rq[23=
]:/.blocked_load_avg
    252685 =C2=B138%     +40.9%     356018 =C2=B110%  sched_debug.cpu#55.sc=
hed_count
       445 =C2=B142%     +58.1%        704 =C2=B1 8%  sched_debug.cfs_rq[23=
]:/.tg_load_contrib
        13 =C2=B113%     +73.2%         23 =C2=B110%  sched_debug.cfs_rq[3]=
:/.load
        18 =C2=B1 6%     +65.5%         30 =C2=B124%  sched_debug.cpu#3.cpu=
_load[1]
        13 =C2=B115%     +75.6%         24 =C2=B110%  sched_debug.cfs_rq[31=
]:/.load
        17 =C2=B117%     +60.8%         27 =C2=B110%  sched_debug.cpu#31.lo=
ad
      2674 =C2=B114%     +31.3%       3512 =C2=B1 9%  cpuidle.C1-NHM.usage
        18 =C2=B120%     -32.7%         12 =C2=B110%  sched_debug.cpu#45.cp=
u_load[2]
        19 =C2=B110%     +29.3%         25 =C2=B113%  sched_debug.cpu#3.cpu=
_load[2]
        12 =C2=B116%     -21.6%          9 =C2=B1 9%  sched_debug.cpu#61.cp=
u_load[0]
        12 =C2=B116%     -21.6%          9 =C2=B1 9%  sched_debug.cpu#61.cp=
u_load[1]
       371 =C2=B146%     +55.2%        575 =C2=B112%  sched_debug.cfs_rq[39=
]:/.blocked_load_avg
       385 =C2=B144%     +52.9%        589 =C2=B113%  sched_debug.cfs_rq[39=
]:/.tg_load_contrib
        18 =C2=B117%     -25.0%         14 =C2=B110%  sched_debug.cpu#45.cp=
u_load[3]
        14 =C2=B1 3%     +23.3%         17 =C2=B110%  sched_debug.cpu#60.cp=
u_load[3]
        13 =C2=B110%     +38.5%         18 =C2=B125%  sched_debug.cpu#31.cp=
u_load[1]
        63 =C2=B137%     +68.9%        107 =C2=B122%  sched_debug.cfs_rq[49=
]:/.nr_spread_over
       365 =C2=B146%     +63.5%        596 =C2=B114%  sched_debug.cfs_rq[62=
]:/.blocked_load_avg
        27 =C2=B133%     -38.6%         17 =C2=B114%  sched_debug.cfs_rq[30=
]:/.load
       378 =C2=B144%     +61.0%        609 =C2=B114%  sched_debug.cfs_rq[62=
]:/.tg_load_contrib
        42 =C2=B122%     +56.3%         66 =C2=B124%  sched_debug.cfs_rq[57=
]:/.load
        14 =C2=B111%     +15.9%         17 =C2=B1 8%  sched_debug.cpu#47.cp=
u_load[2]
      1881 =C2=B110%     -14.2%       1614 =C2=B1 6%  sched_debug.cpu#39.sc=
hed_goidle
     12305 =C2=B1 5%      -9.9%      11081 =C2=B1 3%  numa-meminfo.node0.SR=
eclaimable
      3075 =C2=B1 5%      -9.9%       2770 =C2=B1 3%  numa-vmstat.node0.nr_=
slab_reclaimable
     24141 =C2=B1 2%     +10.0%      26545 =C2=B1 3%  numa-meminfo.node1.SU=
nreclaim
        11 =C2=B111%     -17.6%          9 =C2=B1 5%  sched_debug.cpu#44.cp=
u_load[0]
        11 =C2=B111%     -17.6%          9 =C2=B1 5%  sched_debug.cfs_rq[44=
]:/.runnable_load_avg
     12214 =C2=B1 1%      -8.9%      11131 =C2=B1 3%  slabinfo.kmalloc-256.=
active_objs
        15 =C2=B1 6%     +28.3%         19 =C2=B112%  sched_debug.cpu#31.cp=
u_load[2]
        16 =C2=B1 5%     +18.0%         19 =C2=B1 6%  sched_debug.cpu#31.cp=
u_load[3]
        15 =C2=B1 3%     +21.7%         18 =C2=B113%  sched_debug.cpu#58.cp=
u_load[4]
        14 =C2=B1 3%     +18.2%         17 =C2=B1 5%  sched_debug.cpu#60.cp=
u_load[4]
       639 =C2=B1 5%      -8.9%        582 =C2=B1 1%  numa-vmstat.node3.nr_=
mapped
      2558 =C2=B1 5%      -8.9%       2331 =C2=B1 1%  numa-meminfo.node3.Ma=
pped
     16791 =C2=B114%     -19.0%      13605 =C2=B110%  sched_debug.cpu#49.cu=
rr->pid
     39715 =C2=B1 3%     -11.4%      35185 =C2=B1 3%  numa-meminfo.node0.Sl=
ab
      3039 =C2=B1 5%     +15.2%       3500 =C2=B1 6%  sched_debug.cpu#57.sc=
hed_goidle
        16 =C2=B1 2%     +10.2%         18 =C2=B1 4%  sched_debug.cpu#31.cp=
u_load[4]
        14 =C2=B1 3%     +11.6%         16 =C2=B1 5%  sched_debug.cpu#59.cp=
u_load[3]
      2350 =C2=B122%     -22.7%       1817 =C2=B1 5%  sched_debug.cpu#42.sc=
hed_goidle
       407 =C2=B145%     +50.0%        610 =C2=B1 9%  sched_debug.cfs_rq[56=
]:/.tg_load_contrib
      2567 =C2=B1 4%      -8.4%       2352 =C2=B1 0%  numa-meminfo.node0.Ma=
pped
       641 =C2=B1 4%      -8.4%        587 =C2=B1 0%  numa-vmstat.node0.nr_=
mapped
       393 =C2=B147%     +51.7%        596 =C2=B1 9%  sched_debug.cfs_rq[56=
]:/.blocked_load_avg
      2549 =C2=B1 4%      -8.1%       2342 =C2=B1 0%  proc-vmstat.nr_mapped
     10198 =C2=B1 4%      -8.1%       9369 =C2=B1 0%  meminfo.Mapped
       636 =C2=B1 5%      -7.8%        587 =C2=B1 0%  numa-vmstat.node2.nr_=
mapped
      2547 =C2=B1 5%      -7.8%       2349 =C2=B1 0%  numa-meminfo.node2.Ma=
pped
       631 =C2=B1 4%      -7.5%        583 =C2=B1 0%  numa-vmstat.node1.nr_=
mapped
      2525 =C2=B1 4%      -7.5%       2336 =C2=B1 0%  numa-meminfo.node1.Ma=
pped
 1.219e+09 =C2=B1 0%      -1.4%  1.202e+09 =C2=B1 0%  time.minor_page_faults
    793360 =C2=B1 0%      -1.6%     780981 =C2=B1 0%  vmstat.system.in
      4198 =C2=B1 0%      +1.2%       4247 =C2=B1 0%  time.user_time

testbox/testcase/testparams: lkp-a04/netperf/300s-200%-TCP_CRR

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
    915757 =C2=B1 2%     -12.1%     804961 =C2=B111%  sched_debug.cpu#1.ttw=
u_local
    707963 =C2=B1 1%     +17.3%     830122 =C2=B1 8%  sched_debug.cpu#2.ttw=
u_local
    952710 =C2=B1 2%     -13.4%     825293 =C2=B111%  sched_debug.cpu#1.ttw=
u_count
    740153 =C2=B1 0%     +16.2%     860125 =C2=B1 7%  sched_debug.cpu#2.ttw=
u_count
       970 =C2=B1 6%     -10.9%        864 =C2=B1 7%  sched_debug.cfs_rq[2]=
:/.tg_load_contrib
       411 =C2=B110%     +17.2%        482 =C2=B1 3%  sched_debug.cpu#2.load
   1048586 =C2=B1 3%     +32.5%    1389065 =C2=B1 7%  sched_debug.cpu#2.sch=
ed_count
   1027759 =C2=B1 4%     +26.3%    1298423 =C2=B1 7%  sched_debug.cpu#3.sch=
ed_count
   1028957 =C2=B1 1%     +14.7%    1180449 =C2=B1 9%  sched_debug.cpu#2.nr_=
switches
   1321054 =C2=B1 2%     -13.9%    1137448 =C2=B111%  sched_debug.cpu#1.nr_=
switches
     80734 =C2=B111%     -44.8%      44553 =C2=B1 9%  meminfo.DirectMap4k
     70255 =C2=B127%     +66.1%     116714 =C2=B114%  sched_debug.cfs_rq[3]=
:/.MIN_vruntime
     70255 =C2=B127%     +66.1%     116714 =C2=B114%  sched_debug.cfs_rq[3]=
:/.max_vruntime
       367 =C2=B1 6%     +16.7%        428 =C2=B1 4%  sched_debug.cfs_rq[3]=
:/.load
        13 =C2=B116%     -35.9%          8 =C2=B111%  sched_debug.cfs_rq[2]=
:/.nr_spread_over
     18981 =C2=B1 2%     -17.7%      15623 =C2=B1 3%  softirqs.SCHED
      3707 =C2=B1 4%     -13.8%       3197 =C2=B1 6%  slabinfo.anon_vma.act=
ive_objs
      3707 =C2=B1 4%     -13.8%       3197 =C2=B1 6%  slabinfo.anon_vma.num=
_objs
      6203 =C2=B1 0%      -4.5%       5925 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-sb03/thrulay/300s

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
     47828 =C2=B1 1%      -5.5%      45180 =C2=B1 0%  thrulay.throughput
      0.10 =C2=B1 1%      +5.9%       0.10 =C2=B1 0%  thrulay.RTT
    -59302 =C2=B1-17%     -50.1%     -29575 =C2=B1-35%  sched_debug.cfs_rq[=
24]:/.spread0
    -60291 =C2=B1-15%     -50.7%     -29694 =C2=B1-31%  sched_debug.cfs_rq[=
21]:/.spread0
    -60819 =C2=B1-14%     -47.2%     -32107 =C2=B1-24%  sched_debug.cfs_rq[=
30]:/.spread0
    -54873 =C2=B1-16%     -45.3%     -30027 =C2=B1-34%  sched_debug.cfs_rq[=
17]:/.spread0
    -59850 =C2=B1-17%     -47.2%     -31624 =C2=B1-30%  sched_debug.cfs_rq[=
23]:/.spread0
    -55261 =C2=B1-20%     -45.9%     -29906 =C2=B1-24%  sched_debug.cfs_rq[=
18]:/.spread0
    -41785 =C2=B1-16%     -41.5%     -24458 =C2=B1-43%  sched_debug.cfs_rq[=
25]:/.spread0
    -57365 =C2=B1-17%     -47.7%     -30005 =C2=B1-32%  sched_debug.cfs_rq[=
29]:/.spread0
    -60492 =C2=B1-14%     -51.2%     -29536 =C2=B1-30%  sched_debug.cfs_rq[=
31]:/.spread0
    -61193 =C2=B1-14%     -47.0%     -32461 =C2=B1-27%  sched_debug.cfs_rq[=
22]:/.spread0
    -54660 =C2=B1-11%     -62.3%     -20582 =C2=B1-29%  sched_debug.cfs_rq[=
5]:/.spread0
    -48402 =C2=B1-25%     -64.3%     -17293 =C2=B1-9%  sched_debug.cfs_rq[3=
]:/.spread0
    -60044 =C2=B1-15%     -48.8%     -30734 =C2=B1-28%  sched_debug.cfs_rq[=
19]:/.spread0
    -47533 =C2=B1-5%     -69.0%     -14740 =C2=B1-22%  sched_debug.cfs_rq[2=
]:/.spread0
    -55735 =C2=B1-19%     -47.5%     -29282 =C2=B1-35%  sched_debug.cfs_rq[=
20]:/.spread0
    -55307 =C2=B1-22%     -54.9%     -24958 =C2=B1-2%  sched_debug.cfs_rq[6=
]:/.spread0
    -56973 =C2=B1-18%     -47.7%     -29790 =C2=B1-28%  sched_debug.cfs_rq[=
26]:/.spread0
    -62112 =C2=B1-15%     -54.6%     -28195 =C2=B1-27%  sched_debug.cfs_rq[=
16]:/.spread0
    -59783 =C2=B1-15%     -55.3%     -26706 =C2=B1-44%  sched_debug.cfs_rq[=
27]:/.spread0
    -50405 =C2=B1-2%     -62.5%     -18877 =C2=B1-24%  sched_debug.cfs_rq[4=
]:/.spread0
    -56951 =C2=B1-14%     -56.5%     -24767 =C2=B1-7%  sched_debug.cfs_rq[7=
]:/.spread0
    -58540 =C2=B1-16%     -46.1%     -31550 =C2=B1-28%  sched_debug.cfs_rq[=
28]:/.spread0
         0 =C2=B1 0%      +Inf%          9 =C2=B141%  sched_debug.cpu#16.cp=
u_load[4]
      2027 =C2=B114%     -47.4%       1067 =C2=B110%  sched_debug.cpu#1.ttw=
u_local
    278405 =C2=B141%     +46.1%     406808 =C2=B1 9%  cpuidle.C6-SNB.time
  51182.86 =C2=B125%     -50.9%   25142.66 =C2=B124%  sched_debug.cfs_rq[9]=
:/.exec_clock
         4 =C2=B1 0%    +758.3%         34 =C2=B135%  sched_debug.cfs_rq[27=
]:/.tg_runnable_contrib
       215 =C2=B1 1%    +643.7%       1604 =C2=B133%  sched_debug.cfs_rq[27=
]:/.avg->runnable_avg_sum
      1889 =C2=B1 6%     -44.9%       1041 =C2=B134%  sched_debug.cpu#2.ttw=
u_local
        12 =C2=B123%    +219.4%         38 =C2=B137%  numa-numastat.node0.o=
ther_node
       969 =C2=B130%    +156.7%       2489 =C2=B143%  sched_debug.cfs_rq[29=
]:/.exec_clock
      1777 =C2=B120%    +306.5%       7227 =C2=B145%  sched_debug.cfs_rq[16=
]:/.min_vruntime
      2059 =C2=B1 5%     -20.0%       1647 =C2=B115%  sched_debug.cpu#11.tt=
wu_local
       148 =C2=B111%     +35.1%        200 =C2=B119%  sched_debug.cpu#21.tt=
wu_local
      1206 =C2=B1 6%     +72.1%       2077 =C2=B111%  sched_debug.cpu#25.tt=
wu_local
    601215 =C2=B112%     -54.4%     274002 =C2=B1 7%  sched_debug.cpu#1.ttw=
u_count
     55669 =C2=B123%     -43.1%      31676 =C2=B119%  sched_debug.cfs_rq[8]=
:/.exec_clock
     58901 =C2=B122%     -34.9%      38328 =C2=B127%  sched_debug.cfs_rq[8]=
:/.min_vruntime
       693 =C2=B124%    +122.2%       1541 =C2=B149%  sched_debug.cfs_rq[21=
]:/.exec_clock
       388 =C2=B137%    +141.9%        938 =C2=B118%  sched_debug.cpu#10.cu=
rr->pid
     22104 =C2=B148%     -50.4%      10965 =C2=B122%  sched_debug.cfs_rq[25=
]:/.min_vruntime
     56292 =C2=B1 2%      -8.1%      51711 =C2=B1 6%  numa-meminfo.node1.Ac=
tive
       122 =C2=B1 9%    +127.6%        277 =C2=B122%  sched_debug.cpu#19.tt=
wu_local
       330 =C2=B1 8%     -52.9%        155 =C2=B140%  sched_debug.cfs_rq[18=
]:/.tg_load_contrib
       305 =C2=B1 6%     -57.4%        130 =C2=B148%  sched_debug.cpu#1.cpu=
_load[3]
        94 =C2=B124%     +61.0%        151 =C2=B114%  sched_debug.cpu#22.tt=
wu_local
       312 =C2=B112%     -50.3%        155 =C2=B140%  sched_debug.cfs_rq[18=
]:/.blocked_load_avg
   1092563 =C2=B112%     -41.6%     637743 =C2=B123%  sched_debug.cpu#0.sch=
ed_count
       186 =C2=B1 5%     +89.1%        351 =C2=B130%  sched_debug.cpu#26.tt=
wu_local
       334 =C2=B1 7%     -57.4%        142 =C2=B143%  sched_debug.cpu#1.cpu=
_load[4]
     13942 =C2=B1 8%     -28.0%      10036 =C2=B124%  numa-meminfo.node1.Ac=
tive(anon)
      8994 =C2=B124%     -56.4%       3922 =C2=B1 4%  sched_debug.cpu#0.ttw=
u_local
      3845 =C2=B111%     +21.9%       4688 =C2=B1 7%  sched_debug.cfs_rq[19=
]:/.min_vruntime
     53930 =C2=B113%     -59.1%      22080 =C2=B116%  sched_debug.cfs_rq[1]=
:/.exec_clock
     56331 =C2=B127%     -45.3%      30809 =C2=B130%  sched_debug.cfs_rq[9]=
:/.min_vruntime
       380 =C2=B1 8%     -64.1%        136 =C2=B145%  sched_debug.cfs_rq[1]=
:/.tg_runnable_contrib
   1027661 =C2=B111%     -40.8%     608510 =C2=B126%  sched_debug.cpu#0.nr_=
switches
     17471 =C2=B1 8%     -64.1%       6277 =C2=B145%  sched_debug.cfs_rq[1]=
:/.avg->runnable_avg_sum
      3486 =C2=B1 8%     -28.0%       2510 =C2=B124%  numa-vmstat.node1.nr_=
active_anon
        72 =C2=B127%     +94.0%        139 =C2=B1 8%  sched_debug.cpu#10.lo=
ad
      1958 =C2=B1 9%     -25.1%       1466 =C2=B1 7%  sched_debug.cpu#3.ttw=
u_local
      4107 =C2=B115%    +112.2%       8717 =C2=B134%  sched_debug.cfs_rq[27=
]:/.min_vruntime
       157 =C2=B140%     +77.0%        279 =C2=B120%  sched_debug.cpu#29.tt=
wu_local
    542656 =C2=B1 5%     +45.1%     787416 =C2=B111%  sched_debug.cpu#1.avg=
_idle
      3598 =C2=B1 5%     +59.2%       5728 =C2=B119%  sched_debug.cfs_rq[21=
]:/.min_vruntime
    511646 =C2=B111%     -41.0%     301664 =C2=B126%  sched_debug.cpu#0.sch=
ed_goidle
      3398 =C2=B114%     +73.2%       5886 =C2=B113%  sched_debug.cfs_rq[31=
]:/.min_vruntime
       200 =C2=B1 4%     +34.7%        270 =C2=B127%  sched_debug.cpu#18.tt=
wu_local
     59922 =C2=B113%     -50.7%      29522 =C2=B119%  sched_debug.cfs_rq[1]=
:/.min_vruntime
    993453 =C2=B1 0%     -11.1%     882755 =C2=B110%  sched_debug.cpu#6.avg=
_idle
 1.757e+08 =C2=B121%    +115.7%   3.79e+08 =C2=B111%  cpuidle.C1-SNB.time
     60986 =C2=B1 9%     -42.8%      34903 =C2=B127%  sched_debug.cpu#0.nr_=
load_updates
     39546 =C2=B1 2%     +15.5%      45657 =C2=B1 3%  softirqs.RCU
     55041 =C2=B112%     -46.7%      29348 =C2=B134%  sched_debug.cfs_rq[0]=
:/.exec_clock
     63888 =C2=B114%     -44.6%      35422 =C2=B125%  sched_debug.cfs_rq[0]=
:/.min_vruntime
     13748 =C2=B1 3%     -28.2%       9867 =C2=B128%  numa-meminfo.node1.An=
onPages
      3195 =C2=B1 3%     +55.3%       4960 =C2=B1 6%  cpuidle.C1E-SNB.usage
       341 =C2=B1 8%     +37.5%        469 =C2=B1 6%  slabinfo.kmem_cache.a=
ctive_objs
       341 =C2=B1 8%     +37.5%        469 =C2=B1 6%  slabinfo.kmem_cache.n=
um_objs
    996850 =C2=B1 0%     -16.5%     832771 =C2=B110%  sched_debug.cpu#15.av=
g_idle
      3441 =C2=B1 4%     -28.3%       2469 =C2=B128%  numa-vmstat.node1.nr_=
anon_pages
     83332 =C2=B1 8%     +20.7%     100608 =C2=B1 2%  sched_debug.cpu#2.nr_=
load_updates
    862076 =C2=B1 6%     -12.5%     754527 =C2=B1 7%  sched_debug.cpu#10.av=
g_idle
    319014 =C2=B1 1%     -13.3%     276514 =C2=B1 0%  cpuidle.C7-SNB.usage
     11.66 =C2=B1 8%     +28.0%      14.93 =C2=B1 6%  turbostat.%c1
       453 =C2=B1 7%     +35.0%        612 =C2=B1 9%  slabinfo.dnotify_mark=
.active_objs
       453 =C2=B1 7%     +35.0%        612 =C2=B1 9%  slabinfo.dnotify_mark=
.num_objs
       450 =C2=B1 6%     +23.7%        557 =C2=B1 0%  slabinfo.kmem_cache_n=
ode.active_objs
       469 =C2=B1 6%     +22.7%        576 =C2=B1 0%  slabinfo.kmem_cache_n=
ode.num_objs
       443 =C2=B1 6%     -14.8%        377 =C2=B1 6%  numa-vmstat.node1.nr_=
page_table_pages
    139086 =C2=B1 1%     +15.0%     160011 =C2=B1 1%  softirqs.SCHED
     11164 =C2=B1 2%     +15.2%      12864 =C2=B110%  slabinfo.kmalloc-256.=
active_objs
      1772 =C2=B1 6%     -15.0%       1506 =C2=B1 6%  numa-meminfo.node1.Pa=
geTables
     11412 =C2=B1 1%     +16.0%      13237 =C2=B1 8%  slabinfo.kmalloc-256.=
num_objs
    989992 =C2=B1 1%     -14.4%     846954 =C2=B1 4%  sched_debug.cpu#14.av=
g_idle
    386658 =C2=B1 2%      +9.5%     423490 =C2=B1 1%  softirqs.TIMER
       418 =C2=B1 4%   +4948.2%      21101 =C2=B1 1%  time.involuntary_cont=
ext_switches
      6.42 =C2=B1 0%      +1.9%       6.54 =C2=B1 0%  turbostat.%c0
     29456 =C2=B1 7%     +40.8%      41487 =C2=B1 5%  vmstat.system.cs
      8227 =C2=B110%     +34.8%      11087 =C2=B1 3%  vmstat.system.in
      0.00 =C2=B1 1%      +4.4%       0.00 =C2=B1 0%  energy.energy-cores
     43.93 =C2=B1 1%      +4.4%      45.86 =C2=B1 0%  turbostat.Cor_W
     71.43 =C2=B1 0%      +2.7%      73.35 =C2=B1 0%  turbostat.Pkg_W
      0.00 =C2=B1 0%      +2.7%       0.00 =C2=B1 0%  energy.energy-pkg

testbox/testcase/testparams: lkp-a04/netperf/300s-200%-UDP_RR

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
     17781 =C2=B122%     -39.7%      10718 =C2=B128%  sched_debug.cpu#3.sch=
ed_goidle
       426 =C2=B1 6%      +8.4%        461 =C2=B1 4%  sched_debug.cpu#0.cpu=
_load[1]
       410 =C2=B1 8%     +11.6%        458 =C2=B1 3%  sched_debug.cpu#0.cpu=
_load[0]
     12459 =C2=B125%     +26.1%      15711 =C2=B1 8%  sched_debug.cpu#1.sch=
ed_goidle
       565 =C2=B1 5%     +15.9%        655 =C2=B110%  slabinfo.kmalloc-512.=
active_objs
     27181 =C2=B114%     -37.6%      16948 =C2=B143%  cpuidle.C4-ATM.time
     18120 =C2=B1 1%     -16.4%      15156 =C2=B1 1%  softirqs.SCHED
       882 =C2=B1 6%     +14.3%       1008 =C2=B1 0%  slabinfo.kmalloc-96.a=
ctive_objs
       882 =C2=B1 6%     +14.3%       1008 =C2=B1 0%  slabinfo.kmalloc-96.n=
um_objs
      0.99 =C2=B1 5%     -13.4%       0.86 =C2=B1 6%  perf-profile.cpu-cycl=
es.ip_rcv.__netif_receive_skb_core.__netif_receive_skb.process_backlog.net_=
rx_action
      1.00 =C2=B1 4%      -7.3%       0.93 =C2=B1 2%  perf-profile.cpu-cycl=
es.__skb_recv_datagram.udp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom
      1.24 =C2=B1 1%     -10.5%       1.11 =C2=B1 4%  perf-profile.cpu-cycl=
es.recv_omni.process_requests.spawn_child.accept_connection.accept_connecti=
ons

testbox/testcase/testparams: lkp-snb01/hackbench/1600%-threads-pipe

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
         0           +Inf%          0 =C2=B1141%  last_state.is_incomplete_=
run
         0           +Inf%          0 =C2=B1141%  last_state.booting

testbox/testcase/testparams: lkp-snb01/hackbench/1600%-threads-socket

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
    144955 =C2=B1 0%      +3.5%     149992 =C2=B1 0%  hackbench.throughput
    469607 =C2=B136%    +127.0%    1065815 =C2=B137%  sched_debug.cfs_rq[6]=
:/.spread0
        43 =C2=B127%    +138.5%        103 =C2=B125%  sched_debug.cpu#30.nr=
_uninterruptible
        46 =C2=B122%    +122.3%        103 =C2=B124%  sched_debug.cpu#20.nr=
_uninterruptible
      8591 =C2=B126%     +95.9%      16831 =C2=B148%  numa-meminfo.node1.Sh=
mem
   1350481 =C2=B137%     +50.8%    2036091 =C2=B116%  sched_debug.cpu#6.ttw=
u_local
   1369653 =C2=B134%     +52.0%    2081643 =C2=B118%  sched_debug.cpu#10.tt=
wu_local
   1591125 =C2=B139%     +53.3%    2438849 =C2=B118%  sched_debug.cpu#13.tt=
wu_count
        40 =C2=B141%    +140.0%         96 =C2=B139%  numa-vmstat.node0.nr_=
inactive_anon
        29 =C2=B120%     +48.3%         44 =C2=B126%  sched_debug.cfs_rq[12=
]:/.load
   1692456 =C2=B141%     +61.6%    2735455 =C2=B117%  sched_debug.cpu#6.sch=
ed_count
      2398 =C2=B124%     +69.8%       4071 =C2=B127%  sched_debug.cfs_rq[31=
]:/.tg_load_contrib
        13 =C2=B146%    +241.5%         46 =C2=B143%  sched_debug.cpu#5.nr_=
uninterruptible
   1633856 =C2=B135%     +47.0%    2400982 =C2=B119%  sched_debug.cpu#10.tt=
wu_count
   1412831 =C2=B137%     +59.2%    2249726 =C2=B117%  sched_debug.cpu#7.ttw=
u_count
   1639820 =C2=B137%     +53.6%    2518680 =C2=B117%  sched_debug.cpu#30.tt=
wu_count
      2284 =C2=B126%     +95.8%       4471 =C2=B123%  sched_debug.cfs_rq[30=
]:/.blocked_load_avg
   8517470 =C2=B134%     +49.5%   12735720 =C2=B120%  sched_debug.cfs_rq[14=
]:/.min_vruntime
        41 =C2=B118%    +102.4%         83 =C2=B134%  sched_debug.cpu#4.load
   7998814 =C2=B137%     +51.5%   12121260 =C2=B118%  sched_debug.cfs_rq[4]=
:/.min_vruntime
   9075023 =C2=B134%     +42.9%   12971768 =C2=B120%  sched_debug.cfs_rq[13=
]:/.min_vruntime
        49 =C2=B114%     -36.9%         31 =C2=B113%  sched_debug.cfs_rq[22=
]:/.load
        37 =C2=B115%    +120.4%         83 =C2=B134%  sched_debug.cfs_rq[4]=
:/.load
        49 =C2=B114%     -35.8%         31 =C2=B114%  sched_debug.cpu#22.lo=
ad
   1770212 =C2=B134%     +52.6%    2701111 =C2=B115%  sched_debug.cpu#23.sc=
hed_count
   1740470 =C2=B137%     +53.9%    2678976 =C2=B120%  sched_debug.cpu#14.sc=
hed_count
        25 =C2=B117%     +70.7%         42 =C2=B123%  sched_debug.cpu#13.cp=
u_load[1]
      2318 =C2=B119%     +51.0%       3500 =C2=B122%  sched_debug.cfs_rq[24=
]:/.blocked_load_avg
        27 =C2=B1 6%     +34.1%         36 =C2=B113%  sched_debug.cpu#11.cp=
u_load[4]
      1398 =C2=B117%    +176.5%       3867 =C2=B121%  sched_debug.cfs_rq[14=
]:/.tg_load_contrib
      2365 =C2=B124%     +69.8%       4014 =C2=B128%  sched_debug.cfs_rq[31=
]:/.blocked_load_avg
      2345 =C2=B125%     +92.5%       4513 =C2=B123%  sched_debug.cfs_rq[30=
]:/.tg_load_contrib
   1629777 =C2=B135%     +61.5%    2631445 =C2=B119%  sched_debug.cpu#29.tt=
wu_count
   1402021 =C2=B137%     +61.0%    2256755 =C2=B112%  sched_debug.cpu#24.tt=
wu_local
         1 =C2=B1 0%    +233.3%          3 =C2=B137%  sched_debug.cfs_rq[13=
]:/.nr_spread_over
    344797 =C2=B140%    +200.2%    1035150 =C2=B136%  proc-vmstat.pgfault
   1875924 =C2=B136%     +67.9%    3149828 =C2=B117%  sched_debug.cpu#24.nr=
_switches
   1875929 =C2=B136%     +67.9%    3149836 =C2=B117%  sched_debug.cpu#24.sc=
hed_count
   1526264 =C2=B137%     +51.3%    2308860 =C2=B116%  sched_debug.cpu#6.ttw=
u_count
      4153 =C2=B123%     -31.6%       2839 =C2=B127%  sched_debug.cfs_rq[15=
]:/.tg_load_contrib
      2465 =C2=B121%     +53.8%       3791 =C2=B123%  sched_debug.cfs_rq[9]=
:/.blocked_load_avg
   2091990 =C2=B134%     +48.7%    3110913 =C2=B121%  sched_debug.cpu#29.sc=
hed_count
     27940 =C2=B141%    +108.4%      58221 =C2=B116%  sched_debug.cpu#23.sc=
hed_goidle
   7730782 =C2=B134%     +54.0%   11906817 =C2=B117%  sched_debug.cfs_rq[5]=
:/.min_vruntime
        21 =C2=B1 5%     +71.9%         36 =C2=B121%  sched_debug.cpu#28.cp=
u_load[2]
        21 =C2=B1 7%     +63.1%         35 =C2=B119%  sched_debug.cpu#28.cp=
u_load[3]
      2436 =C2=B121%     +66.9%       4068 =C2=B129%  sched_debug.cfs_rq[13=
]:/.tg_load_contrib
   1605358 =C2=B137%     +63.4%    2623281 =C2=B118%  sched_debug.cpu#5.sch=
ed_count
   1739895 =C2=B137%     +53.7%    2675024 =C2=B120%  sched_debug.cpu#14.nr=
_switches
   1696861 =C2=B141%     +58.0%    2680333 =C2=B114%  sched_debug.cpu#24.tt=
wu_count
   1935125 =C2=B138%     +44.9%    2803150 =C2=B120%  sched_debug.cpu#10.nr=
_switches
        22 =C2=B1 9%     +56.1%         34 =C2=B1 5%  sched_debug.cfs_rq[11=
]:/.runnable_load_avg
        21 =C2=B113%     +56.3%         33 =C2=B118%  sched_debug.cpu#28.cp=
u_load[4]
        66 =C2=B145%     -54.0%         30 =C2=B134%  sched_debug.cpu#6.nr_=
uninterruptible
   1421075 =C2=B139%     +61.3%    2292004 =C2=B117%  sched_debug.cpu#2.ttw=
u_count
   1675341 =C2=B141%     +61.3%    2701696 =C2=B116%  sched_debug.cpu#6.nr_=
switches
        21 =C2=B1 5%     +64.6%         35 =C2=B120%  sched_debug.cpu#28.cp=
u_load[1]
   1589299 =C2=B134%     +49.4%    2374588 =C2=B119%  sched_debug.cpu#9.ttw=
u_count
        11 =C2=B119%    +118.2%         24 =C2=B120%  sched_debug.cfs_rq[25=
]:/.nr_spread_over
      2366 =C2=B124%    +169.5%       6378 =C2=B136%  proc-vmstat.nr_shmem
        28 =C2=B1 3%     +33.7%         38 =C2=B110%  sched_debug.cpu#11.cp=
u_load[3]
      2348 =C2=B119%     +50.6%       3537 =C2=B121%  sched_debug.cfs_rq[24=
]:/.tg_load_contrib
        30 =C2=B118%     +23.9%         38 =C2=B113%  sched_debug.cpu#11.cp=
u_load[1]
        29 =C2=B1 8%     +29.2%         38 =C2=B111%  sched_debug.cpu#11.cp=
u_load[2]
        33 =C2=B1 9%     -16.2%         27 =C2=B111%  sched_debug.cfs_rq[7]=
:/.runnable_load_avg
        20 =C2=B116%     +56.7%         31 =C2=B110%  sched_debug.cpu#28.cp=
u_load[0]
        57 =C2=B147%    +111.7%        120 =C2=B110%  cpuidle.POLL.usage
   1164777 =C2=B1 9%     -18.9%     945177 =C2=B115%  sched_debug.cpu#2.avg=
_idle
   1124134 =C2=B1 5%     -31.5%     769685 =C2=B130%  sched_debug.cpu#3.avg=
_idle
   1722266 =C2=B137%     +61.5%    2781561 =C2=B117%  sched_debug.cpu#22.sc=
hed_count
        38 =C2=B120%     +62.6%         62 =C2=B138%  sched_debug.cpu#19.cp=
u_load[0]
   1765711 =C2=B134%     +52.6%    2693739 =C2=B115%  sched_debug.cpu#23.nr=
_switches
     18664 =C2=B1 3%     -14.0%      16047 =C2=B1 7%  sched_debug.cpu#17.cu=
rr->pid
        43 =C2=B130%     -36.2%         27 =C2=B111%  sched_debug.cpu#21.cp=
u_load[0]
        24 =C2=B1 8%     +27.4%         31 =C2=B1 5%  sched_debug.cfs_rq[10=
]:/.runnable_load_avg
      2885 =C2=B1 7%     +17.7%       3394 =C2=B1 7%  sched_debug.cfs_rq[29=
]:/.blocked_load_avg
      2914 =C2=B1 7%     +17.6%       3427 =C2=B1 7%  sched_debug.cfs_rq[29=
]:/.tg_load_contrib
   1939082 =C2=B138%     +44.7%    2806802 =C2=B120%  sched_debug.cpu#10.sc=
hed_count
   1601460 =C2=B137%     +63.3%    2615545 =C2=B118%  sched_debug.cpu#5.nr_=
switches
        27 =C2=B1 3%     +22.9%         34 =C2=B1 4%  sched_debug.cpu#5.cpu=
_load[0]
   7789960 =C2=B135%     +53.1%   11926079 =C2=B117%  sched_debug.cfs_rq[3]=
:/.min_vruntime
   2017783 =C2=B138%     +45.5%    2934975 =C2=B120%  sched_debug.cpu#31.sc=
hed_count
     14307 =C2=B115%     +45.4%      20799 =C2=B1 3%  sched_debug.cpu#28.cu=
rr->pid
        18 =C2=B127%     +67.9%         31 =C2=B1 9%  sched_debug.cfs_rq[28=
]:/.runnable_load_avg
        23 =C2=B121%     +61.4%         37 =C2=B127%  sched_debug.cpu#13.cp=
u_load[0]
        43 =C2=B127%     -40.5%         26 =C2=B116%  sched_debug.cfs_rq[21=
]:/.runnable_load_avg
        21 =C2=B120%     +65.1%         34 =C2=B1 1%  sched_debug.cfs_rq[28=
]:/.load
        22 =C2=B146%     +67.2%         37 =C2=B1 8%  sched_debug.cfs_rq[9]=
:/.load
   8190727 =C2=B136%     +52.5%   12487628 =C2=B119%  sched_debug.cfs_rq[19=
]:/.min_vruntime
   2015494 =C2=B134%     +45.1%    2924514 =C2=B121%  sched_debug.cpu#30.nr=
_switches
        20 =C2=B118%    +154.1%         51 =C2=B146%  sched_debug.cpu#28.lo=
ad
   2015322 =C2=B138%     +45.5%    2932466 =C2=B120%  sched_debug.cpu#31.nr=
_switches
   7652403 =C2=B134%     +59.9%   12239590 =C2=B116%  sched_debug.cfs_rq[6]=
:/.min_vruntime
      2255 =C2=B134%     +41.1%       3181 =C2=B112%  sched_debug.cfs_rq[21=
]:/.blocked_load_avg
        15 =C2=B118%     -55.6%          6 =C2=B146%  sched_debug.cfs_rq[10=
]:/.nr_spread_over
        23 =C2=B123%     -30.0%         16 =C2=B111%  sched_debug.cpu#0.cpu=
_load[0]
     90586 =C2=B121%    +133.3%     211300 =C2=B118%  sched_debug.cpu#20.nr=
_load_updates
     46776 =C2=B136%     +53.4%      71746 =C2=B134%  sched_debug.cpu#11.sc=
hed_goidle
   8541800 =C2=B132%     +54.3%   13181879 =C2=B119%  sched_debug.cfs_rq[24=
]:/.min_vruntime
   2017977 =C2=B134%     +45.1%    2927629 =C2=B121%  sched_debug.cpu#30.sc=
hed_count
   8808565 =C2=B134%     +44.7%   12746465 =C2=B120%  sched_debug.cfs_rq[10=
]:/.min_vruntime
      1366 =C2=B118%    +180.9%       3838 =C2=B121%  sched_debug.cfs_rq[14=
]:/.blocked_load_avg
      2241 =C2=B145%     -60.1%        895 =C2=B116%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
        25 =C2=B128%     +48.0%         37 =C2=B1 4%  sched_debug.cpu#15.cp=
u_load[3]
      2209 =C2=B146%     -60.9%        863 =C2=B116%  sched_debug.cfs_rq[1]=
:/.blocked_load_avg
        42 =C2=B1 2%     -28.1%         30 =C2=B1 4%  sched_debug.cpu#3.cpu=
_load[0]
   1597804 =C2=B137%     +62.3%    2593330 =C2=B117%  sched_debug.cpu#7.nr_=
switches
        25 =C2=B132%     +40.3%         36 =C2=B1 4%  sched_debug.cpu#15.cp=
u_load[1]
     28687 =C2=B144%    +120.7%      63303 =C2=B120%  sched_debug.cpu#7.sch=
ed_goidle
        25 =C2=B126%     +40.8%         35 =C2=B1 4%  sched_debug.cpu#15.cp=
u_load[4]
        24 =C2=B130%     +51.4%         37 =C2=B1 2%  sched_debug.cpu#15.cp=
u_load[2]
   8082735 =C2=B135%     +55.5%   12567911 =C2=B116%  sched_debug.cfs_rq[22=
]:/.min_vruntime
   9052400 =C2=B133%     +39.9%   12660242 =C2=B119%  sched_debug.cfs_rq[11=
]:/.min_vruntime
      8894 =C2=B116%    +146.7%      21946 =C2=B134%  meminfo.Shmem
   1412482 =C2=B133%     +60.2%    2262381 =C2=B119%  sched_debug.cpu#29.tt=
wu_local
   2091479 =C2=B134%     +48.7%    3110611 =C2=B121%  sched_debug.cpu#29.nr=
_switches
      2403 =C2=B122%     +67.5%       4024 =C2=B129%  sched_debug.cfs_rq[13=
]:/.blocked_load_avg
   1603334 =C2=B138%     +62.1%    2599754 =C2=B117%  sched_debug.cpu#7.sch=
ed_count
   8734614 =C2=B135%     +42.6%   12456632 =C2=B121%  sched_debug.cfs_rq[26=
]:/.min_vruntime
   5482284 =C2=B122%     -33.8%    3626939 =C2=B117%  sched_debug.cpu#31.ma=
x_idle_balance_cost
        38 =C2=B111%     -20.0%         30 =C2=B1 4%  sched_debug.cpu#3.cpu=
_load[3]
      2513 =C2=B121%     +52.7%       3838 =C2=B123%  sched_debug.cfs_rq[9]=
:/.tg_load_contrib
  58410910 =C2=B112%     -30.0%   40912772 =C2=B128%  cpuidle.C1E-SNB.time
   7962719 =C2=B138%     +54.2%   12276900 =C2=B116%  sched_debug.cfs_rq[21=
]:/.min_vruntime
     16966 =C2=B1 3%     +12.4%      19071 =C2=B1 6%  sched_debug.cpu#1.cur=
r->pid
   8896468 =C2=B134%     +45.4%   12938806 =C2=B119%  sched_debug.cfs_rq[28=
]:/.min_vruntime
      4055 =C2=B128%     -35.9%       2598 =C2=B1 7%  sched_debug.cfs_rq[22=
]:/.blocked_load_avg
   8798874 =C2=B133%     +46.1%   12851935 =C2=B119%  sched_debug.cfs_rq[31=
]:/.min_vruntime
   8162157 =C2=B131%     +48.5%   12122503 =C2=B120%  sched_debug.cfs_rq[23=
]:/.min_vruntime
   5167674 =C2=B128%     -37.4%    3233547 =C2=B1 3%  sched_debug.cpu#24.ma=
x_idle_balance_cost
   8545579 =C2=B132%     +47.5%   12602337 =C2=B119%  sched_debug.cfs_rq[17=
]:/.min_vruntime
   1716393 =C2=B138%     +62.0%    2780327 =C2=B117%  sched_debug.cpu#22.nr=
_switches
      4096 =C2=B128%     -34.9%       2668 =C2=B1 7%  sched_debug.cfs_rq[22=
]:/.tg_load_contrib
        38 =C2=B113%     -40.4%         22 =C2=B133%  sched_debug.cpu#17.cp=
u_load[0]
   6670497 =C2=B132%     -39.0%    4071219 =C2=B116%  sched_debug.cpu#25.ma=
x_idle_balance_cost
      0.46 =C2=B1 9%    +104.3%       0.95 =C2=B118%  turbostat.%c7
   7671602 =C2=B137%     +56.7%   12020919 =C2=B116%  sched_debug.cfs_rq[1]=
:/.min_vruntime
     16699 =C2=B1 8%     +12.0%      18695 =C2=B1 6%  sched_debug.cpu#8.cur=
r->pid
      3340 =C2=B1 9%     +69.6%       5665 =C2=B1 3%  cpuidle.C3-SNB.usage
      4119 =C2=B123%     -32.2%       2794 =C2=B127%  sched_debug.cfs_rq[15=
]:/.blocked_load_avg
 2.328e+08 =C2=B1 8%     -22.9%  1.796e+08 =C2=B1 6%  cpuidle.C1-SNB.time
    102235 =C2=B110%     +40.9%     144065 =C2=B115%  sched_debug.cpu#0.nr_=
load_updates
   3930107 =C2=B149%     -52.5%    1866005 =C2=B125%  sched_debug.cpu#22.av=
g_idle
        36 =C2=B112%     -16.4%         30 =C2=B1 5%  sched_debug.cpu#3.cpu=
_load[4]
   7631893 =C2=B129%     +61.4%   12317261 =C2=B118%  sched_debug.cfs_rq[20=
]:/.min_vruntime
   7077210 =C2=B134%     +55.2%   10981933 =C2=B116%  sched_debug.cfs_rq[0]=
:/.min_vruntime
    130538 =C2=B130%     +60.3%     209286 =C2=B117%  sched_debug.cpu#11.nr=
_load_updates
   7732046 =C2=B135%     +53.2%   11845661 =C2=B118%  sched_debug.cfs_rq[2]=
:/.min_vruntime
   7742195 =C2=B135%     +54.5%   11959035 =C2=B117%  sched_debug.cfs_rq[7]=
:/.min_vruntime
        46 =C2=B121%     -31.7%         31 =C2=B1 6%  sched_debug.cpu#3.cpu=
_load[1]
   1134823 =C2=B112%     -33.2%     758329 =C2=B122%  sched_debug.cpu#11.av=
g_idle
        13 =C2=B116%     +41.0%         18 =C2=B120%  sched_debug.cpu#28.nr=
_running
    770906 =C2=B148%     +95.8%    1509648 =C2=B129%  numa-numastat.node1.n=
uma_hit
    769508 =C2=B148%     +96.0%    1508250 =C2=B129%  numa-numastat.node1.l=
ocal_node
 3.254e+08 =C2=B1 3%     +35.0%  4.392e+08 =C2=B110%  cpuidle.C7-SNB.time
   7873970 =C2=B137%     +53.7%   12100093 =C2=B118%  sched_debug.cfs_rq[18=
]:/.min_vruntime
      9908 =C2=B1 4%      -8.6%       9052 =C2=B1 2%  slabinfo.kmalloc-192.=
num_objs
        42 =C2=B116%     -25.4%         31 =C2=B1 5%  sched_debug.cpu#3.cpu=
_load[2]
        25 =C2=B1 5%     -21.3%         19 =C2=B111%  sched_debug.cpu#22.nr=
_running
        23 =C2=B119%     +58.6%         37 =C2=B1 3%  sched_debug.cfs_rq[11=
]:/.load
        18 =C2=B132%     +35.2%         24 =C2=B1 3%  sched_debug.cpu#12.nr=
_running
     33978 =C2=B116%     -51.3%      16531 =C2=B1 8%  sched_debug.cfs_rq[0]=
:/.tg_load_avg
      9908 =C2=B1 4%      -8.6%       9052 =C2=B1 2%  slabinfo.kmalloc-192.=
active_objs
     17065 =C2=B113%     +17.7%      20090 =C2=B1 2%  sched_debug.cpu#29.cu=
rr->pid
        24 =C2=B141%     +47.2%         35 =C2=B116%  sched_debug.cfs_rq[29=
]:/.load
      1509 =C2=B1 2%     +16.3%       1754 =C2=B110%  proc-vmstat.nr_inacti=
ve_anon
    275899 =C2=B1 2%     +12.3%     309911 =C2=B1 1%  softirqs.SCHED
    331858 =C2=B1 6%     +14.1%     378649 =C2=B1 6%  numa-meminfo.node1.SU=
nreclaim
    365515 =C2=B1 5%     +13.8%     416065 =C2=B1 6%  numa-meminfo.node1.Sl=
ab
     58244 =C2=B117%     -34.6%      38103 =C2=B1 1%  sched_debug.cfs_rq[1]=
:/.tg_load_avg
    101161 =C2=B1 2%      +7.2%     108412 =C2=B1 4%  sched_debug.cfs_rq[26=
]:/.tg_load_avg
    101605 =C2=B1 3%      +7.2%     108920 =C2=B1 3%  sched_debug.cfs_rq[29=
]:/.tg_load_avg
      0.93 =C2=B1 5%     +11.1%       1.04 =C2=B1 5%  perf-profile.cpu-cycl=
es.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath
    101319 =C2=B1 3%      +7.3%     108756 =C2=B1 4%  sched_debug.cfs_rq[28=
]:/.tg_load_avg
    102248 =C2=B1 2%      +6.5%     108895 =C2=B1 4%  sched_debug.cfs_rq[27=
]:/.tg_load_avg
      0.82 =C2=B1 4%     +14.2%       0.94 =C2=B1 4%  perf-profile.cpu-cycl=
es.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.sock_alloc_sen=
d_pskb.unix_stream_sendmsg
     13729 =C2=B1 3%     +10.6%      15183 =C2=B1 5%  proc-vmstat.nr_slab_r=
eclaimable
     48264 =C2=B1 4%     +12.6%      54361 =C2=B1 6%  proc-vmstat.nr_active=
_anon
      1.07 =C2=B1 5%     +14.0%       1.22 =C2=B1 5%  perf-profile.cpu-cycl=
es.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_aio_re=
ad
      6025 =C2=B1 2%     +12.7%       6788 =C2=B1 6%  meminfo.Inactive(anon)
      1065 =C2=B1 9%     -11.3%        945 =C2=B1 0%  numa-meminfo.node1.Un=
evictable
      1065 =C2=B1 9%     -11.5%        942 =C2=B1 0%  numa-meminfo.node1.Ml=
ocked
    138913 =C2=B1 5%      +7.5%     149308 =C2=B1 2%  proc-vmstat.nr_slab_u=
nreclaimable
   1095284 =C2=B1 4%     -10.1%     984542 =C2=B1 1%  time.minor_page_faults

testbox/testcase/testparams: lkp-snb01/hackbench/50%-process-pipe

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
      -745 =C2=B1-5%     -19.6%       -598 =C2=B1-10%  sched_debug.cpu#27.n=
r_uninterruptible
       376 =C2=B1 4%   +1543.5%       6185 =C2=B146%  numa-vmstat.node0.nr_=
shmem
      -586 =C2=B1-11%     -24.9%       -440 =C2=B1-20%  sched_debug.cpu#21.=
nr_uninterruptible
   2734514 =C2=B1 7%     -14.6%    2334144 =C2=B1 6%  sched_debug.cfs_rq[16=
]:/.spread0
      -383 =C2=B1-27%     +45.3%       -557 =C2=B1-10%  sched_debug.cpu#22.=
nr_uninterruptible
      1506 =C2=B1 4%   +1544.1%      24759 =C2=B146%  numa-meminfo.node0.Sh=
mem
      -727 =C2=B1-11%     -17.7%       -598 =C2=B1-7%  sched_debug.cpu#19.n=
r_uninterruptible
       707 =C2=B1 3%     -27.4%        513 =C2=B114%  sched_debug.cpu#2.nr_=
uninterruptible
       222 =C2=B117%     +67.2%        371 =C2=B1 2%  sched_debug.cpu#15.nr=
_uninterruptible
      -442 =C2=B1-9%     -19.7%       -355 =C2=B1-10%  sched_debug.cpu#25.n=
r_uninterruptible
        71 =C2=B121%     +43.5%        102 =C2=B122%  sched_debug.cfs_rq[14=
]:/.tg_load_contrib
        78 =C2=B136%    +119.2%        171 =C2=B122%  sched_debug.cfs_rq[30=
]:/.tg_load_contrib
        26 =C2=B1 6%     +16.2%         31 =C2=B1 6%  sched_debug.cfs_rq[19=
]:/.load
        33 =C2=B1 7%     -13.0%         29 =C2=B1 5%  sched_debug.cpu#5.load
       234 =C2=B146%     -57.5%         99 =C2=B126%  sched_debug.cfs_rq[19=
]:/.tg_load_contrib
        34 =C2=B1 5%     -16.3%         29 =C2=B112%  sched_debug.cfs_rq[14=
]:/.load
        60 =C2=B119%    +109.9%        126 =C2=B118%  sched_debug.cfs_rq[7]=
:/.tg_load_contrib
        68 =C2=B125%    +155.3%        175 =C2=B126%  sched_debug.cfs_rq[20=
]:/.blocked_load_avg
        32 =C2=B1 5%     -12.5%         28 =C2=B1 5%  sched_debug.cfs_rq[5]=
:/.runnable_load_avg
        36 =C2=B115%    +107.3%         75 =C2=B1 4%  sched_debug.cfs_rq[0]=
:/.blocked_load_avg
      2660 =C2=B1 6%     -64.0%        956 =C2=B1 3%  cpuidle.POLL.usage
     28999 =C2=B128%     +44.7%      41951 =C2=B115%  sched_debug.cpu#2.avg=
_idle
       317 =C2=B1 9%     +18.7%        376 =C2=B110%  sched_debug.cpu#7.nr_=
uninterruptible
        29 =C2=B1 6%     -14.6%         25 =C2=B1 4%  sched_debug.cpu#21.cp=
u_load[0]
        28 =C2=B145%    +236.0%         96 =C2=B126%  sched_debug.cfs_rq[7]=
:/.blocked_load_avg
        32 =C2=B1 5%     -17.3%         27 =C2=B1 0%  sched_debug.cpu#5.cpu=
_load[0]
     62112 =C2=B1 3%     -28.2%      44609 =C2=B127%  numa-meminfo.node1.Ac=
tive(anon)
        32 =C2=B1 5%     -16.5%         27 =C2=B1 0%  sched_debug.cpu#5.cpu=
_load[1]
        30 =C2=B1 8%     -14.4%         25 =C2=B1 1%  sched_debug.cfs_rq[21=
]:/.runnable_load_avg
      8439 =C2=B1 0%     +28.9%      10875 =C2=B114%  numa-vmstat.node1.num=
a_other
        29 =C2=B1 8%     -12.4%         26 =C2=B1 3%  sched_debug.cpu#21.cp=
u_load[1]
        97 =C2=B116%    +111.6%        206 =C2=B121%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
        27 =C2=B1 4%     +14.6%         31 =C2=B1 6%  sched_debug.cfs_rq[19=
]:/.runnable_load_avg
        30 =C2=B1 1%      -6.5%         28 =C2=B1 3%  sched_debug.cpu#25.cp=
u_load[3]
        32 =C2=B1 3%     -15.3%         27 =C2=B1 1%  sched_debug.cpu#5.cpu=
_load[2]
        29 =C2=B1 8%     -12.4%         26 =C2=B1 3%  sched_debug.cpu#21.cp=
u_load[2]
        30 =C2=B1 5%     -11.1%         26 =C2=B1 1%  sched_debug.cpu#21.cp=
u_load[4]
        30 =C2=B1 5%     -11.1%         26 =C2=B1 1%  sched_debug.cpu#21.cp=
u_load[3]
        71 =C2=B1 6%     +51.2%        107 =C2=B1 3%  sched_debug.cfs_rq[0]=
:/.tg_load_contrib
        29 =C2=B1 8%     -13.5%         25 =C2=B1 4%  sched_debug.cpu#21.lo=
ad
     15527 =C2=B1 2%     -28.1%      11157 =C2=B127%  numa-vmstat.node1.nr_=
active_anon
        39 =C2=B138%     +82.2%         71 =C2=B134%  sched_debug.cfs_rq[14=
]:/.blocked_load_avg
        32 =C2=B1 3%     -15.3%         27 =C2=B1 1%  sched_debug.cpu#5.cpu=
_load[3]
        32 =C2=B1 2%     -13.4%         28 =C2=B1 2%  sched_debug.cpu#5.cpu=
_load[4]
        36 =C2=B113%     -17.3%         30 =C2=B1 4%  sched_debug.cpu#10.lo=
ad
        24 =C2=B112%     +24.3%         30 =C2=B1 8%  sched_debug.cfs_rq[20=
]:/.load
        66 =C2=B111%     +93.5%        129 =C2=B120%  sched_debug.cfs_rq[28=
]:/.blocked_load_avg
        24 =C2=B1 7%     +24.7%         30 =C2=B1 8%  sched_debug.cpu#20.lo=
ad
     30668 =C2=B1 8%     +55.0%      47545 =C2=B127%  numa-meminfo.node0.Ac=
tive(anon)
        95 =C2=B1 8%     +66.6%        159 =C2=B116%  sched_debug.cfs_rq[28=
]:/.tg_load_contrib
      7667 =C2=B1 8%     +55.0%      11885 =C2=B127%  numa-vmstat.node0.nr_=
active_anon
     57027 =C2=B124%     -35.3%      36872 =C2=B119%  sched_debug.cpu#6.avg=
_idle
     41749 =C2=B120%     +37.6%      57439 =C2=B110%  sched_debug.cpu#13.av=
g_idle
     61077 =C2=B119%     -43.3%      34602 =C2=B112%  sched_debug.cpu#7.avg=
_idle
     56966 =C2=B1 8%     -24.7%      42880 =C2=B119%  sched_debug.cpu#11.av=
g_idle
        24 =C2=B110%     +17.6%         29 =C2=B1 7%  sched_debug.cfs_rq[31=
]:/.load
        25 =C2=B111%     +17.1%         29 =C2=B1 6%  sched_debug.cpu#31.lo=
ad
     62174 =C2=B124%     -35.0%      40444 =C2=B123%  sched_debug.cpu#19.av=
g_idle
     55229 =C2=B1 0%     -32.6%      37224 =C2=B114%  sched_debug.cpu#16.av=
g_idle
         8 =C2=B1 5%     +28.0%         10 =C2=B111%  sched_debug.cpu#20.nr=
_running
    211665 =C2=B1 0%     +12.1%     237174 =C2=B1 5%  numa-meminfo.node0.Fi=
lePages
     52916 =C2=B1 0%     +12.0%      59289 =C2=B1 5%  numa-vmstat.node0.nr_=
file_pages
     48377 =C2=B111%     -37.3%      30344 =C2=B120%  sched_debug.cpu#4.avg=
_idle
      3814 =C2=B1 3%      +7.1%       4086 =C2=B1 5%  sched_debug.cfs_rq[0]=
:/.tg_load_avg
        12 =C2=B1 3%     -18.4%         10 =C2=B112%  sched_debug.cpu#14.nr=
_running
      6477 =C2=B1 6%     -16.3%       5419 =C2=B111%  numa-vmstat.node1.nr_=
slab_reclaimable
     25905 =C2=B1 6%     -16.3%      21676 =C2=B111%  numa-meminfo.node1.SR=
eclaimable
     17880 =C2=B1 9%     +24.3%      22230 =C2=B110%  numa-meminfo.node0.SR=
eclaimable
      4469 =C2=B1 9%     +24.3%       5557 =C2=B110%  numa-vmstat.node0.nr_=
slab_reclaimable
      1.11 =C2=B1 2%     -14.1%       0.95 =C2=B1 3%  perf-profile.cpu-cycl=
es.selinux_file_permission.security_file_permission.rw_verify_area.vfs_writ=
e.sys_write
      8769 =C2=B1 4%     +11.2%       9751 =C2=B1 1%  numa-vmstat.node0.nr_=
slab_unreclaimable
        12 =C2=B1 6%     -13.9%         10 =C2=B1 4%  sched_debug.cpu#5.nr_=
running
     97815 =C2=B1 3%      -8.4%      89618 =C2=B1 3%  numa-meminfo.node1.Sl=
ab
     52957 =C2=B1 5%     +15.7%      61254 =C2=B1 3%  numa-meminfo.node0.Sl=
ab
        31 =C2=B1 3%      -8.5%         28 =C2=B1 3%  sched_debug.cpu#25.cp=
u_load[4]
    252921 =C2=B1 0%     -10.1%     227367 =C2=B1 5%  numa-meminfo.node1.Fi=
lePages
     63234 =C2=B1 0%     -10.1%      56843 =C2=B1 5%  numa-vmstat.node1.nr_=
file_pages
     35077 =C2=B1 4%     +11.2%      39023 =C2=B1 1%  numa-meminfo.node0.SU=
nreclaim
   5759109 =C2=B1 0%      -1.5%    5672917 =C2=B1 0%  vmstat.system.cs
    865590 =C2=B1 0%      -1.2%     855126 =C2=B1 0%  vmstat.system.in
      1254 =C2=B1 0%      -1.3%       1238 =C2=B1 0%  time.user_time

testbox/testcase/testparams: lkp-snb01/hackbench/50%-process-socket

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
 813898.55 =C2=B145%    -100.0%       0.00 =C2=B1 0%  sched_debug.cfs_rq[25=
]:/.MIN_vruntime
 813898.55 =C2=B145%    -100.0%       0.00 =C2=B1 0%  sched_debug.cfs_rq[25=
]:/.max_vruntime
   2841487 =C2=B1 3%     +14.1%    3241106 =C2=B1 3%  sched_debug.cfs_rq[13=
]:/.spread0
   2533569 =C2=B1 4%     +17.2%    2968494 =C2=B1 9%  sched_debug.cfs_rq[10=
]:/.spread0
   2047785 =C2=B1 9%     +20.0%    2456470 =C2=B1 9%  sched_debug.cfs_rq[8]=
:/.spread0
     13370 =C2=B1 6%      -7.8%      12327 =C2=B1 5%  sched_debug.cpu#27.cu=
rr->pid
    468040 =C2=B145%     +92.8%     902473 =C2=B133%  sched_debug.cfs_rq[17=
]:/.MIN_vruntime
    468040 =C2=B145%     +92.8%     902473 =C2=B133%  sched_debug.cfs_rq[17=
]:/.max_vruntime
        26 =C2=B1 0%     +10.3%         28 =C2=B1 1%  sched_debug.cpu#26.cp=
u_load[4]
       104 =C2=B114%     -31.5%         71 =C2=B1 9%  sched_debug.cfs_rq[12=
]:/.tg_load_contrib
        74 =C2=B118%     -40.4%         44 =C2=B117%  sched_debug.cfs_rq[12=
]:/.blocked_load_avg
        26 =C2=B1 0%     +10.3%         28 =C2=B1 1%  sched_debug.cpu#26.cp=
u_load[3]
        31 =C2=B1 7%     +12.9%         35 =C2=B1 4%  sched_debug.cfs_rq[5]=
:/.load
        32 =C2=B1 3%     -12.4%         28 =C2=B1 5%  sched_debug.cfs_rq[14=
]:/.runnable_load_avg
        29 =C2=B1 4%     +14.9%         33 =C2=B1 5%  sched_debug.cfs_rq[4]=
:/.runnable_load_avg
      4208 =C2=B1 0%     -99.8%          7 =C2=B134%  numa-numastat.node0.o=
ther_node
        47 =C2=B126%     +99.3%         93 =C2=B127%  sched_debug.cfs_rq[9]=
:/.blocked_load_avg
       126 =C2=B1 9%     -32.2%         85 =C2=B119%  sched_debug.cfs_rq[4]=
:/.tg_load_contrib
        25 =C2=B1 0%     +14.7%         28 =C2=B1 7%  sched_debug.cpu#26.cp=
u_load[0]
       176 =C2=B121%     -68.2%         56 =C2=B147%  sched_debug.cfs_rq[20=
]:/.blocked_load_avg
    110715 =C2=B1 6%     -29.6%      77907 =C2=B1 0%  numa-meminfo.node1.Ac=
tive
      2546 =C2=B1 1%     -46.8%       1355 =C2=B1 4%  cpuidle.POLL.usage
        99 =C2=B1 9%     -35.4%         64 =C2=B125%  sched_debug.cfs_rq[3]=
:/.tg_load_contrib
     69536 =C2=B1 9%     -48.0%      36187 =C2=B1 2%  numa-meminfo.node1.Ac=
tive(anon)
     13151 =C2=B1 5%      -8.4%      12052 =C2=B1 4%  sched_debug.cpu#28.cu=
rr->pid
        30 =C2=B1 2%      -8.9%         27 =C2=B1 1%  sched_debug.cpu#13.cp=
u_load[0]
        24 =C2=B1 9%     +17.6%         29 =C2=B1 4%  sched_debug.cfs_rq[21=
]:/.runnable_load_avg
        27 =C2=B114%     -17.1%         22 =C2=B113%  sched_debug.cfs_rq[28=
]:/.load
      8305 =C2=B1 0%     +43.7%      11938 =C2=B1 2%  numa-vmstat.node1.num=
a_other
        24 =C2=B1 7%     +12.3%         27 =C2=B1 3%  sched_debug.cpu#21.cp=
u_load[1]
        26 =C2=B112%     -15.0%         22 =C2=B113%  sched_debug.cpu#28.lo=
ad
       210 =C2=B116%     -60.6%         83 =C2=B132%  sched_debug.cfs_rq[20=
]:/.tg_load_contrib
     13282 =C2=B1 1%     -10.5%      11888 =C2=B1 1%  sched_debug.cpu#26.cu=
rr->pid
        24 =C2=B113%     +19.2%         29 =C2=B1 4%  sched_debug.cfs_rq[21=
]:/.load
        24 =C2=B1 5%     +13.7%         27 =C2=B1 4%  sched_debug.cpu#21.cp=
u_load[2]
        25 =C2=B1 3%     +13.3%         28 =C2=B1 4%  sched_debug.cpu#21.cp=
u_load[4]
        24 =C2=B1 3%     +13.5%         28 =C2=B1 2%  sched_debug.cpu#21.cp=
u_load[3]
        24 =C2=B115%     +19.2%         29 =C2=B1 4%  sched_debug.cpu#21.lo=
ad
     17376 =C2=B1 9%     -48.0%       9038 =C2=B1 2%  numa-vmstat.node1.nr_=
active_anon
        34 =C2=B117%     -22.5%         26 =C2=B1 6%  sched_debug.cfs_rq[20=
]:/.runnable_load_avg
        34 =C2=B122%     -26.5%         25 =C2=B111%  sched_debug.cfs_rq[20=
]:/.load
        29 =C2=B1 3%     -15.9%         24 =C2=B113%  sched_debug.cpu#20.lo=
ad
     24649 =C2=B126%    +134.5%      57798 =C2=B1 1%  numa-meminfo.node0.Ac=
tive(anon)
        28 =C2=B1 3%     -12.8%         25 =C2=B1 6%  sched_debug.cpu#20.cp=
u_load[2]
        77 =C2=B116%     +60.8%        124 =C2=B120%  sched_debug.cfs_rq[9]=
:/.tg_load_contrib
      6158 =C2=B126%    +134.7%      14451 =C2=B1 1%  numa-vmstat.node0.nr_=
active_anon
        97 =C2=B113%     -46.7%         51 =C2=B129%  sched_debug.cfs_rq[4]=
:/.blocked_load_avg
     67282 =C2=B110%     +47.8%      99432 =C2=B1 1%  numa-meminfo.node0.Ac=
tive
        31 =C2=B1 6%     +12.8%         35 =C2=B1 3%  sched_debug.cpu#3.load
     32887 =C2=B131%     +45.2%      47767 =C2=B1 6%  sched_debug.cpu#5.avg=
_idle
     40530 =C2=B117%     +44.0%      58353 =C2=B113%  sched_debug.cpu#21.av=
g_idle
     49686 =C2=B122%     -35.8%      31895 =C2=B110%  sched_debug.cpu#22.av=
g_idle
        30 =C2=B1 3%      -9.8%         27 =C2=B1 3%  sched_debug.cfs_rq[8]=
:/.runnable_load_avg
     35312 =C2=B1 7%     +36.8%      48309 =C2=B113%  sched_debug.cpu#18.av=
g_idle
     39897 =C2=B1 7%     -25.4%      29761 =C2=B1 5%  sched_debug.cpu#8.avg=
_idle
     40180 =C2=B1 5%     +19.0%      47800 =C2=B1 3%  sched_debug.cpu#16.av=
g_idle
    216166 =C2=B1 1%     +16.7%     252197 =C2=B1 1%  numa-meminfo.node0.Fi=
lePages
     54041 =C2=B1 1%     +16.7%      63050 =C2=B1 1%  numa-vmstat.node0.nr_=
file_pages
        11 =C2=B1 7%     -21.2%          8 =C2=B114%  sched_debug.cpu#14.nr=
_running
     37603 =C2=B122%     +25.8%      47317 =C2=B1 7%  sched_debug.cpu#20.av=
g_idle
        31 =C2=B1 7%     -13.8%         27 =C2=B1 8%  sched_debug.cpu#23.lo=
ad
    293929 =C2=B1 4%      +6.2%     312221 =C2=B1 2%  softirqs.SCHED
       741 =C2=B1 8%     -14.0%        637 =C2=B1 7%  slabinfo.buffer_head.=
active_objs
       741 =C2=B1 8%     -14.0%        637 =C2=B1 7%  slabinfo.buffer_head.=
num_objs
        31 =C2=B110%     -12.9%         27 =C2=B1 8%  sched_debug.cfs_rq[23=
]:/.load
    249967 =C2=B1 1%     -14.5%     213710 =C2=B1 1%  numa-meminfo.node1.Fi=
lePages
     62493 =C2=B1 1%     -14.5%      53427 =C2=B1 1%  numa-vmstat.node1.nr_=
file_pages
   3231743 =C2=B1 0%      +1.0%    3264953 =C2=B1 0%  vmstat.system.cs
    559279 =C2=B1 0%      +1.2%     566102 =C2=B1 0%  vmstat.system.in

testbox/testcase/testparams: lkp-snb01/hackbench/50%-threads-pipe

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
      -231 =C2=B1-42%     +66.1%       -383 =C2=B1 0%  sched_debug.cpu#29.n=
r_uninterruptible
    352987 =C2=B134%     -62.6%     132004 =C2=B149%  sched_debug.cfs_rq[1]=
:/.spread0
   2000694 =C2=B110%     -14.8%    1703642 =C2=B1 6%  sched_debug.cfs_rq[20=
]:/.spread0
   2669321 =C2=B1 7%     -25.5%    1987489 =C2=B1 9%  sched_debug.cfs_rq[26=
]:/.spread0
   2218008 =C2=B1 5%     -11.1%    1972491 =C2=B1 8%  sched_debug.cfs_rq[27=
]:/.spread0
    429280 =C2=B132%     +76.9%     759410 =C2=B110%  sched_debug.cfs_rq[7]=
:/.spread0
   2416889 =C2=B1 2%     -12.2%    2121635 =C2=B1 5%  sched_debug.cfs_rq[28=
]:/.spread0
      -388 =C2=B1-20%     -32.8%       -261 =C2=B1-3%  sched_debug.cpu#30.n=
r_uninterruptible
       353 =C2=B1 2%     +13.4%        400 =C2=B1 6%  sched_debug.cpu#9.nr_=
uninterruptible
      -264 =C2=B1-11%     -20.7%       -209 =C2=B1-4%  sched_debug.cpu#31.n=
r_uninterruptible
    795535 =C2=B127%     -38.8%     486872 =C2=B118%  sched_debug.cfs_rq[9]=
:/.spread0
       143 =C2=B120%     +24.0%        177 =C2=B1 8%  sched_debug.cpu#15.nr=
_uninterruptible
       197 =C2=B122%     -40.4%        117 =C2=B134%  sched_debug.cfs_rq[19=
]:/.blocked_load_avg
    888413 =C2=B118%     -52.4%     422792 =C2=B1 4%  sched_debug.cfs_rq[8]=
:/.spread0
      -317 =C2=B1-14%     -33.3%       -211 =C2=B1-47%  sched_debug.cpu#25.=
nr_uninterruptible
       157 =C2=B129%     +63.7%        257 =C2=B129%  sched_debug.cfs_rq[27=
]:/.blocked_load_avg
        96 =C2=B128%     -34.3%         63 =C2=B124%  sched_debug.cfs_rq[12=
]:/.tg_load_contrib
        87 =C2=B119%     -54.6%         39 =C2=B116%  sched_debug.cfs_rq[24=
]:/.blocked_load_avg
       411 =C2=B141%     -80.0%         82 =C2=B148%  sched_debug.cfs_rq[25=
]:/.blocked_load_avg
       106 =C2=B113%     -38.1%         65 =C2=B130%  sched_debug.cfs_rq[30=
]:/.tg_load_contrib
        26 =C2=B1 6%     +17.5%         31 =C2=B1 3%  sched_debug.cpu#25.cp=
u_load[1]
        31 =C2=B1 6%     -10.5%         28 =C2=B1 6%  sched_debug.cfs_rq[27=
]:/.runnable_load_avg
        31 =C2=B1 5%     -14.0%         26 =C2=B1 9%  sched_debug.cfs_rq[27=
]:/.load
       439 =C2=B139%     -74.2%        113 =C2=B136%  sched_debug.cfs_rq[25=
]:/.tg_load_contrib
       227 =C2=B117%     -34.5%        148 =C2=B127%  sched_debug.cfs_rq[19=
]:/.tg_load_contrib
   1056797 =C2=B1 4%     +13.7%    1201745 =C2=B1 6%  sched_debug.cpu#21.sc=
hed_goidle
       189 =C2=B123%     +50.8%        286 =C2=B126%  sched_debug.cfs_rq[27=
]:/.tg_load_contrib
        31 =C2=B1 3%     -14.9%         26 =C2=B1 9%  sched_debug.cpu#27.lo=
ad
   1130048 =C2=B1 3%     +10.5%    1248905 =C2=B1 2%  sched_debug.cpu#24.sc=
hed_goidle
    902294 =C2=B1 2%     +11.2%    1003068 =C2=B1 5%  sched_debug.cpu#14.sc=
hed_goidle
       116 =C2=B113%     -41.0%         68 =C2=B1 9%  sched_debug.cfs_rq[24=
]:/.tg_load_contrib
        27 =C2=B1 3%     +12.0%         31 =C2=B1 4%  sched_debug.cpu#25.cp=
u_load[2]
      1783 =C2=B1 3%     -68.9%        555 =C2=B1 3%  cpuidle.POLL.usage
     78441 =C2=B132%     -40.5%      46653 =C2=B115%  sched_debug.cpu#3.avg=
_idle
    765606 =C2=B1 7%     +11.7%     855212 =C2=B1 4%  sched_debug.cpu#8.sch=
ed_goidle
        31 =C2=B1 9%     -13.7%         27 =C2=B1 7%  sched_debug.cpu#17.lo=
ad
    555616 =C2=B1 7%     +14.5%     636021 =C2=B1 8%  cpuidle.C3-SNB.time
    877042 =C2=B1 5%     +17.4%    1029798 =C2=B1 2%  sched_debug.cpu#13.sc=
hed_goidle
     47197 =C2=B1 2%     -27.6%      34170 =C2=B137%  numa-meminfo.node1.Ac=
tive(anon)
        25 =C2=B1 3%     +34.7%         33 =C2=B110%  sched_debug.cfs_rq[25=
]:/.load
        26 =C2=B1 6%     +20.0%         32 =C2=B1 2%  sched_debug.cpu#25.cp=
u_load[0]
        26 =C2=B1 6%     +16.2%         31 =C2=B1 6%  sched_debug.cfs_rq[25=
]:/.runnable_load_avg
        30 =C2=B1 4%     -13.2%         26 =C2=B1 3%  sched_debug.cfs_rq[21=
]:/.load
        28 =C2=B1 5%      +9.5%         30 =C2=B1 4%  sched_debug.cpu#25.cp=
u_load[3]
        64 =C2=B127%    +104.2%        130 =C2=B118%  sched_debug.cfs_rq[0]=
:/.tg_load_contrib
   1137850 =C2=B1 3%     +16.6%    1326788 =C2=B1 5%  sched_debug.cpu#31.sc=
hed_goidle
        30 =C2=B1 3%     -14.1%         26 =C2=B1 1%  sched_debug.cpu#21.lo=
ad
     11804 =C2=B1 2%     -27.6%       8548 =C2=B137%  numa-vmstat.node1.nr_=
active_anon
    844857 =C2=B1 4%     +11.3%     940540 =C2=B1 2%  sched_debug.cpu#11.sc=
hed_goidle
   1181283 =C2=B1 3%     +10.3%    1302776 =C2=B1 4%  sched_debug.cpu#30.sc=
hed_goidle
     56347 =C2=B123%     -32.8%      37850 =C2=B116%  sched_debug.cpu#1.avg=
_idle
     21182 =C2=B1 5%     +59.6%      33804 =C2=B137%  numa-meminfo.node0.Ac=
tive(anon)
        31 =C2=B1 5%      -7.5%         28 =C2=B1 3%  sched_debug.cpu#20.cp=
u_load[2]
     79877 =C2=B1 7%     +13.7%      90800 =C2=B1 3%  meminfo.DirectMap4k
      5294 =C2=B1 5%     +59.7%       8452 =C2=B137%  numa-vmstat.node0.nr_=
active_anon
     69161 =C2=B125%     -28.5%      49469 =C2=B126%  sched_debug.cpu#28.av=
g_idle
     70975 =C2=B1 9%     -44.3%      39542 =C2=B125%  sched_debug.cpu#6.avg=
_idle
     81808 =C2=B118%     -20.6%      64989 =C2=B123%  sched_debug.cpu#21.av=
g_idle
     71797 =C2=B113%     -15.9%      60409 =C2=B111%  sched_debug.cpu#22.av=
g_idle
     74546 =C2=B119%     -32.3%      50439 =C2=B121%  sched_debug.cpu#17.av=
g_idle
     16769 =C2=B1 4%     -15.6%      14155 =C2=B113%  numa-meminfo.node1.An=
onPages
     93643 =C2=B119%     -47.8%      48884 =C2=B111%  sched_debug.cpu#8.avg=
_idle
        31 =C2=B1 9%     -15.8%         26 =C2=B1 4%  sched_debug.cfs_rq[31=
]:/.load
        31 =C2=B110%     -17.0%         26 =C2=B1 5%  sched_debug.cpu#31.lo=
ad
   1184850 =C2=B1 2%     +10.1%    1304822 =C2=B1 1%  sched_debug.cpu#29.sc=
hed_goidle
  19014825 =C2=B1 4%     +12.5%   21391786 =C2=B1 4%  cpuidle.C7-SNB.time
         8 =C2=B1 5%     +38.5%         12 =C2=B113%  sched_debug.cpu#25.nr=
_running
     65471 =C2=B110%     -33.0%      43881 =C2=B113%  sched_debug.cpu#15.av=
g_idle
      4192 =C2=B1 4%     -15.7%       3534 =C2=B113%  numa-vmstat.node1.nr_=
anon_pages
        32 =C2=B1 6%     -14.6%         27 =C2=B1 6%  sched_debug.cpu#29.lo=
ad
      4066 =C2=B1 6%     -13.9%       3502 =C2=B1 8%  sched_debug.cfs_rq[0]=
:/.tg_load_avg
     84719 =C2=B1 6%     -36.5%      53778 =C2=B132%  sched_debug.cpu#20.av=
g_idle
        27 =C2=B1 1%      -9.6%         25 =C2=B1 3%  sched_debug.cfs_rq[30=
]:/.load
        32 =C2=B1 6%     -17.7%         26 =C2=B1 7%  sched_debug.cfs_rq[29=
]:/.load
    225864 =C2=B1 0%     +15.1%     259863 =C2=B1 1%  softirqs.SCHED
        11 =C2=B1 4%     -17.6%          9 =C2=B1 5%  sched_debug.cpu#21.nr=
_running
        11 =C2=B1 8%     -20.0%          9 =C2=B1 5%  sched_debug.cpu#29.nr=
_running
      3817 =C2=B1 8%     -13.6%       3298 =C2=B1 2%  sched_debug.cfs_rq[24=
]:/.tg_load_avg
      3864 =C2=B1 9%     -10.6%       3455 =C2=B1 5%  sched_debug.cfs_rq[15=
]:/.tg_load_avg
      3845 =C2=B1 9%     -12.8%       3353 =C2=B1 3%  sched_debug.cfs_rq[19=
]:/.tg_load_avg
      3800 =C2=B1 7%     -13.6%       3284 =C2=B1 1%  sched_debug.cfs_rq[25=
]:/.tg_load_avg
      3830 =C2=B1 9%     -13.1%       3329 =C2=B1 2%  sched_debug.cfs_rq[20=
]:/.tg_load_avg
      3819 =C2=B1 8%     -12.8%       3330 =C2=B1 2%  sched_debug.cfs_rq[21=
]:/.tg_load_avg
      3829 =C2=B1 9%     -11.7%       3382 =C2=B1 4%  sched_debug.cfs_rq[18=
]:/.tg_load_avg
      3816 =C2=B1 8%     -10.2%       3428 =C2=B1 8%  sched_debug.cfs_rq[9]=
:/.tg_load_avg
      3806 =C2=B1 8%     -13.1%       3307 =C2=B1 2%  sched_debug.cfs_rq[23=
]:/.tg_load_avg
      3852 =C2=B1 8%     -11.3%       3417 =C2=B1 7%  sched_debug.cfs_rq[12=
]:/.tg_load_avg
      3783 =C2=B1 9%     -14.2%       3247 =C2=B1 2%  sched_debug.cfs_rq[30=
]:/.tg_load_avg
      3790 =C2=B1 9%     -14.6%       3238 =C2=B1 2%  sched_debug.cfs_rq[31=
]:/.tg_load_avg
      3893 =C2=B1 5%     -12.0%       3426 =C2=B1 9%  sched_debug.cfs_rq[8]=
:/.tg_load_avg
      3813 =C2=B1 8%     -12.7%       3330 =C2=B1 2%  sched_debug.cfs_rq[22=
]:/.tg_load_avg
      3992 =C2=B1 5%     -13.7%       3446 =C2=B1 9%  sched_debug.cfs_rq[1]=
:/.tg_load_avg
      3787 =C2=B1 9%     -13.9%       3259 =C2=B1 1%  sched_debug.cfs_rq[26=
]:/.tg_load_avg
      1233 =C2=B1 1%      +9.6%       1351 =C2=B1 2%  uptime.idle
      3822 =C2=B1 8%     -10.1%       3436 =C2=B1 7%  sched_debug.cfs_rq[11=
]:/.tg_load_avg
      5103 =C2=B1 3%     +11.2%       5673 =C2=B1 8%  numa-vmstat.node0.nr_=
anon_pages
      3830 =C2=B1 8%      -9.8%       3453 =C2=B1 7%  sched_debug.cfs_rq[10=
]:/.tg_load_avg
      3790 =C2=B1 8%     -14.1%       3258 =C2=B1 2%  sched_debug.cfs_rq[29=
]:/.tg_load_avg
      3800 =C2=B1 8%     -14.1%       3263 =C2=B1 2%  sched_debug.cfs_rq[28=
]:/.tg_load_avg
      3873 =C2=B1 8%     -10.7%       3457 =C2=B1 7%  sched_debug.cfs_rq[13=
]:/.tg_load_avg
      3880 =C2=B1 8%     -10.0%       3493 =C2=B1 6%  sched_debug.cfs_rq[14=
]:/.tg_load_avg
      1.76 =C2=B1 3%      -9.1%       1.60 =C2=B1 2%  perf-profile.cpu-cycl=
es.__schedule.schedule.pipe_wait.pipe_read.do_sync_read
      1.33 =C2=B1 9%     -14.8%       1.13 =C2=B1 2%  perf-profile.cpu-cycl=
es.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.securi=
ty_file_permission
        28 =C2=B1 7%     -12.9%         24 =C2=B1 5%  sched_debug.cpu#30.lo=
ad
      3914 =C2=B1 5%     -11.9%       3448 =C2=B1 9%  sched_debug.cfs_rq[6]=
:/.tg_load_avg
      3908 =C2=B1 5%     -11.6%       3455 =C2=B1 9%  sched_debug.cfs_rq[7]=
:/.tg_load_avg
     20420 =C2=B1 3%     +11.1%      22683 =C2=B1 8%  numa-meminfo.node0.An=
onPages
        10 =C2=B1 4%     -16.1%          8 =C2=B1 5%  sched_debug.cpu#30.nr=
_running
 1.062e+09 =C2=B1 0%      -2.9%  1.031e+09 =C2=B1 0%  time.involuntary_cont=
ext_switches
 2.994e+09 =C2=B1 0%      -1.4%  2.951e+09 =C2=B1 0%  time.voluntary_contex=
t_switches
   6679284 =C2=B1 0%      -2.0%    6547702 =C2=B1 0%  vmstat.system.cs
    986879 =C2=B1 0%      -1.2%     975385 =C2=B1 0%  vmstat.system.in
       828 =C2=B1 0%      -1.6%        815 =C2=B1 0%  time.user_time

testbox/testcase/testparams: lkp-snb01/hackbench/50%-threads-socket

71a9b26963f8c2d  5057f55e543b7859cfd26bc28
---------------  -------------------------
   1170822 =C2=B1 5%     +17.2%    1371820 =C2=B1 7%  sched_debug.cfs_rq[3]=
:/.spread0
    819914 =C2=B112%     +19.2%     977633 =C2=B1 6%  sched_debug.cfs_rq[2]=
:/.spread0
        28 =C2=B1 2%      -9.5%         25 =C2=B1 1%  sched_debug.cpu#16.cp=
u_load[2]
       122 =C2=B112%     -32.8%         82 =C2=B114%  sched_debug.cfs_rq[11=
]:/.tg_load_contrib
       118 =C2=B136%    +332.2%        510 =C2=B141%  sched_debug.cfs_rq[1]=
:/.nr_spread_over
        65 =C2=B116%     +43.1%         93 =C2=B1 9%  sched_debug.cfs_rq[15=
]:/.tg_load_contrib
        33 =C2=B1 5%     -16.8%         28 =C2=B1 8%  sched_debug.cfs_rq[3]=
:/.runnable_load_avg
        80 =C2=B118%     -32.6%         54 =C2=B132%  sched_debug.cfs_rq[7]=
:/.tg_load_contrib
        37 =C2=B1 5%     -17.7%         31 =C2=B1 5%  sched_debug.cfs_rq[2]=
:/.load
        28 =C2=B1 3%     -11.8%         25 =C2=B1 3%  sched_debug.cpu#16.cp=
u_load[1]
        28 =C2=B1 1%     -12.9%         24 =C2=B1 3%  sched_debug.cpu#16.cp=
u_load[0]
        70 =C2=B134%     +67.1%        117 =C2=B117%  sched_debug.cfs_rq[24=
]:/.tg_load_contrib
        26 =C2=B1 7%     +34.2%         35 =C2=B1 3%  sched_debug.cfs_rq[15=
]:/.load
        26 =C2=B1 7%     +33.7%         35 =C2=B1 5%  sched_debug.cpu#15.lo=
ad
       616 =C2=B1 3%      +9.3%        674 =C2=B1 7%  numa-vmstat.node0.nr_=
kernel_stack
        26 =C2=B1 4%     +15.2%         30 =C2=B1 8%  sched_debug.cpu#10.cp=
u_load[1]
      2259 =C2=B1 2%     -47.9%       1178 =C2=B1 3%  cpuidle.POLL.usage
        27 =C2=B1 4%      -8.4%         25 =C2=B1 1%  sched_debug.cpu#19.cp=
u_load[0]
        83 =C2=B129%     +46.2%        121 =C2=B123%  sched_debug.cfs_rq[29=
]:/.blocked_load_avg
       110 =C2=B123%     +36.0%        150 =C2=B122%  sched_debug.cfs_rq[29=
]:/.tg_load_contrib
        29 =C2=B1 1%     +10.2%         32 =C2=B1 2%  sched_debug.cpu#15.cp=
u_load[0]
        24 =C2=B1 8%     +15.1%         28 =C2=B1 5%  sched_debug.cfs_rq[28=
]:/.runnable_load_avg
        26 =C2=B112%     +22.8%         32 =C2=B1 5%  sched_debug.cfs_rq[10=
]:/.load
        27 =C2=B1 1%     +13.4%         31 =C2=B1 7%  sched_debug.cpu#10.cp=
u_load[3]
        37 =C2=B1 6%     -17.7%         31 =C2=B1 5%  sched_debug.cpu#2.load
        27 =C2=B1 3%     +10.8%         30 =C2=B1 8%  sched_debug.cpu#10.cp=
u_load[4]
        25 =C2=B1 1%     +11.8%         28 =C2=B1 7%  sched_debug.cfs_rq[25=
]:/.runnable_load_avg
        28 =C2=B1 1%     +16.3%         33 =C2=B1 1%  sched_debug.cfs_rq[15=
]:/.runnable_load_avg
        27 =C2=B1 3%      -7.3%         25 =C2=B1 1%  sched_debug.cfs_rq[19=
]:/.runnable_load_avg
        35 =C2=B1 1%     -10.3%         32 =C2=B1 0%  sched_debug.cpu#1.cpu=
_load[0]
        65 =C2=B116%     +64.8%        107 =C2=B118%  sched_debug.cfs_rq[1]=
:/.tg_load_contrib
        29 =C2=B1 2%     +14.9%         33 =C2=B1 7%  sched_debug.cpu#15.cp=
u_load[3]
        29 =C2=B137%    +158.6%         75 =C2=B126%  sched_debug.cfs_rq[1]=
:/.blocked_load_avg
        29 =C2=B1 4%     +11.4%         32 =C2=B1 3%  sched_debug.cpu#15.cp=
u_load[1]
        28 =C2=B1 1%     +16.3%         33 =C2=B1 7%  sched_debug.cpu#15.cp=
u_load[4]
        32 =C2=B1 3%     -19.4%         26 =C2=B1 7%  sched_debug.cpu#11.lo=
ad
        35 =C2=B1 2%      -9.4%         32 =C2=B1 0%  sched_debug.cfs_rq[1]=
:/.runnable_load_avg
        26 =C2=B112%     +20.3%         31 =C2=B1 3%  sched_debug.cpu#10.lo=
ad
       317 =C2=B134%     -45.6%        172 =C2=B143%  sched_debug.cfs_rq[17=
]:/.tg_load_contrib
        29 =C2=B1 4%     +12.5%         33 =C2=B1 4%  sched_debug.cpu#15.cp=
u_load[2]
        74 =C2=B120%     -46.9%         39 =C2=B124%  sched_debug.cfs_rq[8]=
:/.blocked_load_avg
       107 =C2=B113%     -35.6%         69 =C2=B116%  sched_debug.cfs_rq[8]=
:/.tg_load_contrib
        89 =C2=B116%     -40.5%         53 =C2=B125%  sched_debug.cfs_rq[11=
]:/.blocked_load_avg
     67243 =C2=B110%     -40.5%      39981 =C2=B113%  sched_debug.cpu#28.av=
g_idle
     53609 =C2=B122%     -33.5%      35652 =C2=B117%  sched_debug.cpu#12.av=
g_idle
       695 =C2=B1 2%      -8.1%        638 =C2=B1 7%  numa-vmstat.node1.nr_=
kernel_stack
     45204 =C2=B115%     -35.6%      29093 =C2=B113%  sched_debug.cpu#5.avg=
_idle
        35 =C2=B131%     +67.9%         59 =C2=B115%  sched_debug.cfs_rq[15=
]:/.blocked_load_avg
      5559 =C2=B1 3%      -7.9%       5118 =C2=B1 7%  numa-meminfo.node1.Ke=
rnelStack
     64428 =C2=B112%     -38.1%      39863 =C2=B1 9%  sched_debug.cpu#18.av=
g_idle
        43 =C2=B122%     -30.2%         30 =C2=B1 9%  sched_debug.cfs_rq[3]=
:/.load
        33 =C2=B1 6%     -11.1%         29 =C2=B1 4%  sched_debug.cpu#3.cpu=
_load[1]
         8 =C2=B110%     +38.5%         12 =C2=B1 6%  sched_debug.cpu#15.nr=
_running
     62466 =C2=B119%     -34.7%      40779 =C2=B1 8%  sched_debug.cpu#19.av=
g_idle
     56228 =C2=B115%     -24.7%      42343 =C2=B1 7%  sched_debug.cpu#16.av=
g_idle
         8 =C2=B1 0%     +29.2%         10 =C2=B1 9%  sched_debug.cpu#10.nr=
_running
     54061 =C2=B116%     -34.5%      35393 =C2=B122%  sched_debug.cpu#15.av=
g_idle
     39436 =C2=B122%     -27.7%      28510 =C2=B117%  sched_debug.cpu#10.av=
g_idle
        32 =C2=B1 3%     -17.5%         26 =C2=B1 9%  sched_debug.cfs_rq[11=
]:/.load
        24 =C2=B1 5%     +15.1%         28 =C2=B1 7%  sched_debug.cpu#31.cp=
u_load[1]
    274999 =C2=B1 0%     +11.6%     306774 =C2=B1 0%  softirqs.SCHED
        24 =C2=B1 3%     +17.6%         29 =C2=B1 5%  sched_debug.cpu#31.cp=
u_load[2]
        24 =C2=B1 3%     +17.6%         29 =C2=B1 5%  sched_debug.cpu#31.cp=
u_load[3]
        25 =C2=B1 4%     +13.2%         28 =C2=B1 6%  sched_debug.cfs_rq[31=
]:/.runnable_load_avg
      4050 =C2=B1 9%     -10.0%       3646 =C2=B1 3%  sched_debug.cfs_rq[1]=
:/.tg_load_avg
      3914 =C2=B1 8%     -10.6%       3499 =C2=B1 5%  sched_debug.cfs_rq[13=
]:/.tg_load_avg
      3915 =C2=B1 8%     -10.7%       3494 =C2=B1 4%  sched_debug.cfs_rq[14=
]:/.tg_load_avg
        29 =C2=B1 8%     -13.6%         25 =C2=B1 1%  sched_debug.cpu#30.lo=
ad
        25 =C2=B1 1%     +17.1%         29 =C2=B1 5%  sched_debug.cpu#31.cp=
u_load[4]
      4064 =C2=B1 8%     -12.2%       3569 =C2=B1 5%  sched_debug.cfs_rq[4]=
:/.tg_load_avg
      4937 =C2=B1 3%      +9.2%       5392 =C2=B1 6%  numa-meminfo.node0.Ke=
rnelStack
    692520 =C2=B1 0%      +0.9%     698981 =C2=B1 0%  vmstat.system.in
       680 =C2=B1 0%      -1.6%        669 =C2=B1 0%  time.user_time

The testbox configurations are:

brickland1: Brickland Ivy Bridge-EX
Memory: 128G

lkp-sb03: Sandy Bridge-EP
Memory: 64G

lkp-snb01: Sandy Bridge-EP
Memory: 32G

lkp-nex04: Nehalem-EX
Memory: 256G

lkp-a06: Atom
Memory: 8G

xps: Nehalem
Memory: 4G

lkp-a04: Atom
Memory: 8G

xps2: Nehalem
Memory: 4G

lkp-a05: Atom
Memory: 8G


To reproduce:

	apt-get install ruby ruby-oj
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


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

--===============8662807135284792611==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2F0Y2gtb29t
OiAKICB3YWl0OiBwcmUtdGVzdAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51
bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1z
dGF0OiAKICBwcm9jLXN0YXQ6IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRz
OiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2
X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVx
OiAKICB0dXJib3N0YXQ6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVy
OiAKbW9kZWw6IFNhbmR5IEJyaWRnZS1FUAptZW1vcnk6IDMyRwpoZGRfcGFydGl0aW9uczogIi9k
ZXYvc2RhMiIKc3dhcF9wYXJ0aXRpb25zOiAKcGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMAp3aWxs
LWl0LXNjYWxlOgogIHRlc3Q6CiAgLSBvcGVuMgpicmFuY2g6IGxpbnVzL21hc3Rlcgpjb21taXQ6
IDE5NTgzY2E1ODRkNmY1NzQzODRlMTdmZTc2MTNkZmFlYWRjZGM0YTYKcmVwZWF0X3RvOiAzCmVu
cXVldWVfdGltZTogMjAxNC0wOS0yNSAyMTo0OTo1NS43OTU0MjY4MDEgKzA4OjAwCnRlc3Rib3g6
IGxrcC1zbmIwMQprY29uZmlnOiB4ODZfNjQtcmhlbAprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1y
aGVsLzE5NTgzY2E1ODRkNmY1NzQzODRlMTdmZTc2MTNkZmFlYWRjZGM0YTYvdm1saW51ei0zLjE2
LjAiCnVzZXI6IGxrcApxdWV1ZTogd2ZnCnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3Atc25iMDEv
d2lsbC1pdC1zY2FsZS9vcGVuMi9kZWJpYW4teDg2XzY0LmNnei94ODZfNjQtcmhlbC8xOTU4M2Nh
NTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFkY2RjNGE2LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hl
ZHVsZWQvbGtwLXNuYjAxL3dmZ193aWxsLWl0LXNjYWxlLW9wZW4yLXg4Nl82NC1yaGVsLTE5NTgz
Y2E1ODRkNmY1NzQzODRlMTdmZTc2MTNkZmFlYWRjZGM0YTYtMi55YW1sIgpkZXF1ZXVlX3RpbWU6
IDIwMTQtMDktMjggMDM6MDU6NTguMzM1MjY4MDYxICswODowMApoaXN0b3J5X3RpbWU6IDMwMApq
b2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDIyLjU4IDEyLjUwIDUuMDUgMS80OTUgMTAzOTQK
c3RhcnRfdGltZTogJzE0MTE4NDQ4MDEnCmVuZF90aW1lOiAnMTQxMTg0NTExMScKdmVyc2lvbjog
Ii9sa3AvbGtwLy5zcmMtMjAxNDA5MjctMjAwMzM0Igo=

--===============8662807135284792611==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IG9wZW4yIDI1IDEgOCAxNiAyNCAzMgo=

--===============8662807135284792611==--

