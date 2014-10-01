Content-Type: multipart/mixed; boundary="===============6799348943402632881=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [loopback] b17c706987f: +175.7% netperf.Throughput_Mbps
Date: Wed, 01 Oct 2014 15:54:40 +0800
Message-ID: <20141001075440.GC21294@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6799348943402632881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

FYI, we noticed nice performance improvement in commit

b17c706987fa6f28bdc1771c8266e7a69e22adcb ("loopback: sctp: add NETIF_F_SCTP=
_CSUM to device features")

test case: lkp-nex04/netperf/300s-200%-10K-SCTP_STREAM_MANY

72f8e06f3ea022d  b17c706987fa6f28bdc1771c8 =

---------------  ------------------------- =

     %stddev        %change               %stddev
            \          |                 /
       664 =C2=B1 0%    +175.7%       1832 =C2=B1 0%  TOTAL netperf.Through=
put_Mbps
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[63]:/.nr_running
    947669 =C2=B1 2%    +681.8%    7408572 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[63]:/.min_vruntime
     19701 =C2=B1 3%   +2814.0%     574098 =C2=B1 1%  TOTAL sched_debug.cpu=
#63.ttwu_local
     41754 =C2=B1 1%     -99.5%        200 =C2=B143%  TOTAL softirqs.HRTIMER
         5 =C2=B120%    +400.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#63.cpu_load[4]
      2.59 =C2=B1 1%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles.intel_idle.cpuidle_enter_state.cpuidle_idle_call.arch_cpu_idle.cpu=
_startup_entry
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#63.nr_running
        72 =C2=B148%     -95.8%          3 =C2=B142%  TOTAL sched_debug.cfs=
_rq[62]:/.blocked_load_avg
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[62]:/.nr_running
      0.24 =C2=B1 7%   +2565.6%       6.50 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.sctp_transport_timeout.sctp_transport_reset_timers.sctp_outq_flush=
.sctp_outq_uncork.sctp_cmd_interpreter
      0.22 =C2=B1 3%   +1442.3%       3.42 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.get_page_from_freelist.__alloc_pages_nodema=
sk.kmalloc_large_node.__kmalloc_node_track_caller
      0.27 =C2=B1 6%   +1100.0%       3.29 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock.free_one_page.__free_pages_ok.__free_pages.__free_m=
emcg_kmem_pages
      0.04 =C2=B110%   +8463.2%       3.25 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.lock_timer_base.isra.35.mod_timer.sctp_transport_reset_timers.sctp=
_outq_flush.sctp_outq_uncork
      0.04 =C2=B113%   +6227.8%       2.28 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.memcpy.sctp_packet_transmit_chunk.sctp_outq_flush.sctp_outq_uncork=
.sctp_cmd_interpreter
      0.00           +Inf%       1.97 =C2=B1 8%  TOTAL perf-profile.cpu-cyc=
les._raw_spin_lock_irqsave.mod_timer.sctp_transport_reset_timers.sctp_outq_=
flush.sctp_outq_uncork
        11 =C2=B144%   +9151.8%       1036 =C2=B131%  TOTAL sched_debug.cfs=
_rq[62]:/.nr_spread_over
      1.15 =C2=B1 7%     -94.4%       0.06 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_bh.lock_sock_nested.sctp_recvmsg.sock_common_recvms=
g.sock_recvmsg
  33688875 =C2=B1 2%     -89.6%    3504734 =C2=B118%  TOTAL cpuidle.C1-NHM.=
time
    281217 =C2=B1 2%     -90.9%      25698 =C2=B141%  TOTAL cpuidle.C1-NHM.=
usage
  45558795 =C2=B1 0%     -99.9%      27898 =C2=B139%  TOTAL cpuidle.C3-NHM.=
usage
     39.61 =C2=B1 0%     -99.7%       0.11 =C2=B130%  TOTAL turbostat.%c1
      5.60 =C2=B1 0%     -94.0%       0.34 =C2=B1 1%  TOTAL turbostat.%c3
    876992 =C2=B1 3%    +736.3%    7333987 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[62]:/.min_vruntime
     19686 =C2=B1 2%   +2810.9%     573039 =C2=B1 1%  TOTAL sched_debug.cpu=
#62.ttwu_local
         5 =C2=B125%    +403.4%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#62.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#62.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[61]:/.nr_running
         8 =C2=B122%  +13481.4%       1168 =C2=B136%  TOTAL sched_debug.cfs=
_rq[61]:/.nr_spread_over
    899343 =C2=B1 6%    +715.7%    7335525 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[61]:/.min_vruntime
     19673 =C2=B1 4%   +2790.5%     568655 =C2=B1 2%  TOTAL sched_debug.cpu=
#61.ttwu_local
    989853 =C2=B1 2%     -99.2%       7480 =C2=B148%  TOTAL sched_debug.cpu=
#61.sched_goidle
         4 =C2=B140%    +581.0%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#61.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#61.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[60]:/.nr_running
    893662 =C2=B1 5%    +724.8%    7370847 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[60]:/.min_vruntime
     19607 =C2=B1 3%   +2827.4%     573986 =C2=B1 1%  TOTAL sched_debug.cpu=
#60.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#60.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[59]:/.nr_running
     86308 =C2=B118%   +7142.5%    6250836 =C2=B1 8%  TOTAL sched_debug.cfs=
_rq[59]:/.max_vruntime
    899110 =C2=B1 4%    +717.5%    7350607 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[59]:/.min_vruntime
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#0.nr_running
     86308 =C2=B118%   +7142.5%    6250836 =C2=B1 8%  TOTAL sched_debug.cfs=
_rq[59]:/.MIN_vruntime
     20221 =C2=B1 4%   +2739.2%     574120 =C2=B1 1%  TOTAL sched_debug.cpu=
#59.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#59.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[58]:/.nr_running
    370050 =C2=B1 3%     -98.8%       4378 =C2=B124%  TOTAL sched_debug.cpu=
#0.sched_goidle
     32479 =C2=B1 4%   +1698.6%     584171 =C2=B1 1%  TOTAL sched_debug.cpu=
#0.ttwu_local
    947194 =C2=B1 4%    +676.5%    7354983 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[58]:/.min_vruntime
        19 =C2=B112%  +26074.0%       5025 =C2=B132%  TOTAL sched_debug.cfs=
_rq[0]:/.nr_spread_over
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[0]:/.nr_running
     20721 =C2=B1 4%   +2663.3%     572601 =C2=B1 1%  TOTAL sched_debug.cpu=
#58.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#58.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B133%  TOTAL sched_debug.cfs=
_rq[57]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#1.nr_running
    964313 =C2=B1 4%    +662.7%    7355115 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[57]:/.min_vruntime
     21834 =C2=B1 6%   +2531.4%     574540 =C2=B1 1%  TOTAL sched_debug.cpu=
#57.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#57.nr_running
    354246 =C2=B1 1%     -98.7%       4745 =C2=B138%  TOTAL sched_debug.cpu=
#1.sched_goidle
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[56]:/.nr_running
     28829 =C2=B1 5%   +1914.4%     580717 =C2=B1 0%  TOTAL sched_debug.cpu=
#1.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[1]:/.nr_running
    960131 =C2=B1 3%    +667.5%    7368750 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[56]:/.min_vruntime
     21418 =C2=B1 2%   +2584.0%     574857 =C2=B1 0%  TOTAL sched_debug.cpu=
#56.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#2.nr_running
         4 =C2=B117%    +534.8%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#56.cpu_load[4]
         5 =C2=B118%    +433.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#56.cpu_load[3]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#56.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[55]:/.nr_running
     71260 =C2=B142%   +8857.8%    6383312 =C2=B1 6%  TOTAL sched_debug.cfs=
_rq[55]:/.max_vruntime
    935340 =C2=B1 4%    +686.3%    7354731 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[55]:/.min_vruntime
    363420 =C2=B1 1%     -98.9%       3993 =C2=B140%  TOTAL sched_debug.cpu=
#2.sched_goidle
     71260 =C2=B142%   +8857.8%    6383312 =C2=B1 6%  TOTAL sched_debug.cfs=
_rq[55]:/.MIN_vruntime
     19268 =C2=B1 3%   +2867.0%     571688 =C2=B1 2%  TOTAL sched_debug.cpu=
#55.ttwu_local
     29222 =C2=B1 4%   +1889.9%     581489 =C2=B1 0%  TOTAL sched_debug.cpu=
#2.ttwu_local
         5 =C2=B133%    +457.7%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#55.cpu_load[4]
        21 =C2=B110%   +5539.8%       1218 =C2=B119%  TOTAL sched_debug.cfs=
_rq[2]:/.nr_spread_over
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[2]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#55.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[54]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#3.nr_running
     45064 =C2=B118%  +14562.1%    6607460 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[54]:/.max_vruntime
    934539 =C2=B1 6%    +685.1%    7337176 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[54]:/.min_vruntime
     45064 =C2=B118%  +14562.1%    6607460 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[54]:/.MIN_vruntime
     19262 =C2=B1 6%   +2872.1%     572494 =C2=B1 1%  TOTAL sched_debug.cpu=
#54.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#54.nr_running
    356613 =C2=B1 1%     -99.2%       2934 =C2=B129%  TOTAL sched_debug.cpu=
#3.sched_goidle
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[53]:/.nr_running
     27577 =C2=B1 5%   +2003.9%     580222 =C2=B1 1%  TOTAL sched_debug.cpu=
#3.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[3]:/.nr_running
    933523 =C2=B1 4%    +686.2%    7339367 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[53]:/.min_vruntime
     19832 =C2=B1 3%   +2803.2%     575758 =C2=B1 1%  TOTAL sched_debug.cpu=
#53.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#4.nr_running
         5 =C2=B146%    +410.7%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#53.cpu_load[3]
         6 =C2=B147%    +354.8%         28 =C2=B1 5%  TOTAL sched_debug.cpu=
#53.cpu_load[0]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#53.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[52]:/.nr_running
    923091 =C2=B1 3%    +698.0%    7366148 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[52]:/.min_vruntime
    348410 =C2=B1 2%     -98.8%       4230 =C2=B139%  TOTAL sched_debug.cpu=
#4.sched_goidle
     19701 =C2=B1 3%   +2820.0%     575293 =C2=B1 1%  TOTAL sched_debug.cpu=
#52.ttwu_local
     26645 =C2=B1 4%   +2076.8%     580019 =C2=B1 1%  TOTAL sched_debug.cpu=
#4.ttwu_local
    178678 =C2=B125%   +3627.5%    6660167 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[4]:/.MIN_vruntime
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#52.nr_running
    178678 =C2=B125%   +3627.5%    6660167 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[4]:/.max_vruntime
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[4]:/.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[51]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#5.nr_running
    929685 =C2=B1 4%    +688.0%    7325719 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[51]:/.min_vruntime
     19761 =C2=B1 4%   +2813.8%     575800 =C2=B1 1%  TOTAL sched_debug.cpu=
#51.ttwu_local
         5 =C2=B137%    +461.5%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#51.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#51.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[50]:/.nr_running
     26189 =C2=B1 3%   +2110.9%     579032 =C2=B1 0%  TOTAL sched_debug.cpu=
#5.ttwu_local
    963932 =C2=B1 3%    +657.4%    7301196 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[50]:/.min_vruntime
     23557 =C2=B1 2%   +2326.4%     571608 =C2=B1 2%  TOTAL sched_debug.cpu=
#23.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[5]:/.nr_running
     20098 =C2=B1 5%   +2752.9%     573394 =C2=B1 1%  TOTAL sched_debug.cpu=
#50.ttwu_local
         6 =C2=B134%    +380.0%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#50.cpu_load[4]
         6 =C2=B135%    +343.8%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#50.cpu_load[3]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#6.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#50.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[49]:/.nr_running
        16 =C2=B1 8%   +4700.0%        768 =C2=B149%  TOTAL sched_debug.cfs=
_rq[49]:/.nr_spread_over
     25690 =C2=B1 2%   +2152.9%     578774 =C2=B1 1%  TOTAL sched_debug.cpu=
#6.ttwu_local
    988774 =C2=B1 1%    +643.1%    7347606 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[49]:/.min_vruntime
        17 =C2=B116%   +6484.7%       1119 =C2=B136%  TOTAL sched_debug.cfs=
_rq[6]:/.nr_spread_over
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[6]:/.nr_running
     21655 =C2=B1 3%   +2554.9%     574933 =C2=B1 1%  TOTAL sched_debug.cpu=
#49.ttwu_local
    917931 =C2=B1 0%     -99.2%       7364 =C2=B147%  TOTAL sched_debug.cpu=
#49.sched_goidle
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#49.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#7.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[48]:/.nr_running
    963896 =C2=B1 5%    +662.9%    7353616 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[48]:/.min_vruntime
     20962 =C2=B1 5%   +2638.5%     574061 =C2=B1 1%  TOTAL sched_debug.cpu=
#48.ttwu_local
    342563 =C2=B1 2%     -99.0%       3297 =C2=B140%  TOTAL sched_debug.cpu=
#7.sched_goidle
     25834 =C2=B1 4%   +2138.5%     578300 =C2=B1 0%  TOTAL sched_debug.cpu=
#7.ttwu_local
         4 =C2=B148%    +500.0%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#48.cpu_load[3]
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[7]:/.nr_running
         4 =C2=B144%    +513.0%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#48.cpu_load[0]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#48.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#8.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[47]:/.nr_running
   1026500 =C2=B1 4%    +606.8%    7255532 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[47]:/.min_vruntime
     21776 =C2=B1 3%   +2530.7%     572873 =C2=B1 1%  TOTAL sched_debug.cpu=
#47.ttwu_local
    940486 =C2=B1 1%     -99.3%       6905 =C2=B146%  TOTAL sched_debug.cpu=
#47.sched_goidle
    375887 =C2=B1 2%     -98.8%       4502 =C2=B140%  TOTAL sched_debug.cpu=
#8.sched_goidle
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#47.nr_running
        46 =C2=B143%     -94.0%          2 =C2=B141%  TOTAL sched_debug.cfs=
_rq[46]:/.blocked_load_avg
     27667 =C2=B1 3%   +1978.0%     574926 =C2=B1 1%  TOTAL sched_debug.cpu=
#8.ttwu_local
         6 =C2=B134%    +370.0%         28 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[46]:/.runnable_load_avg
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[46]:/.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[8]:/.nr_running
    973194 =C2=B1 3%    +646.5%    7264433 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[46]:/.min_vruntime
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#9.nr_running
     22161 =C2=B1 2%   +2482.1%     572230 =C2=B1 1%  TOTAL sched_debug.cpu=
#46.ttwu_local
         4 =C2=B115%    +525.0%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#46.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#46.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[45]:/.nr_running
    359971 =C2=B1 2%     -99.1%       3085 =C2=B141%  TOTAL sched_debug.cpu=
#9.sched_goidle
   1018595 =C2=B1 4%    +611.1%    7243421 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[45]:/.min_vruntime
     27131 =C2=B1 2%   +2017.8%     574580 =C2=B1 1%  TOTAL sched_debug.cpu=
#9.ttwu_local
    134404 =C2=B131%   +4758.2%    6529609 =C2=B1 8%  TOTAL sched_debug.cfs=
_rq[9]:/.MIN_vruntime
     22294 =C2=B1 4%   +2467.1%     572326 =C2=B1 1%  TOTAL sched_debug.cpu=
#45.ttwu_local
    134404 =C2=B131%   +4758.2%    6529609 =C2=B1 8%  TOTAL sched_debug.cfs=
_rq[9]:/.max_vruntime
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[9]:/.nr_running
         5 =C2=B122%    +455.6%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#45.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B118%  TOTAL sched_debug.cpu=
#45.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[44]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#10.nr_running
    360383 =C2=B1 1%     -98.8%       4421 =C2=B145%  TOTAL sched_debug.cpu=
#10.sched_goidle
     27338 =C2=B1 3%   +2000.0%     574125 =C2=B1 1%  TOTAL sched_debug.cpu=
#10.ttwu_local
   1021430 =C2=B1 4%    +609.5%    7247197 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[44]:/.min_vruntime
    231918 =C2=B124%   +2549.3%    6144271 =C2=B1 8%  TOTAL sched_debug.cfs=
_rq[10]:/.MIN_vruntime
    231918 =C2=B124%   +2549.3%    6144271 =C2=B1 8%  TOTAL sched_debug.cfs=
_rq[10]:/.max_vruntime
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[10]:/.nr_running
     22562 =C2=B1 3%   +2442.1%     573549 =C2=B1 1%  TOTAL sched_debug.cpu=
#44.ttwu_local
         5 =C2=B125%    +492.0%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#44.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#11.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#44.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[43]:/.nr_running
   1019742 =C2=B1 2%    +614.0%    7280699 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[43]:/.min_vruntime
    366743 =C2=B1 3%     -98.8%       4544 =C2=B148%  TOTAL sched_debug.cpu=
#11.sched_goidle
     22781 =C2=B1 3%   +2411.2%     572090 =C2=B1 1%  TOTAL sched_debug.cpu=
#43.ttwu_local
     27283 =C2=B1 5%   +1994.9%     571569 =C2=B1 1%  TOTAL sched_debug.cpu=
#11.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#43.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[11]:/.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[42]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#12.nr_running
   1013625 =C2=B1 3%    +610.3%    7199592 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[42]:/.min_vruntime
     23285 =C2=B1 2%   +2357.3%     572199 =C2=B1 1%  TOTAL sched_debug.cpu=
#42.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#42.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[41]:/.nr_running
    363201 =C2=B1 5%     -99.2%       3010 =C2=B132%  TOTAL sched_debug.cpu=
#12.sched_goidle
   1026049 =C2=B1 2%    +605.1%    7234511 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[41]:/.min_vruntime
     26558 =C2=B1 1%   +2059.8%     573625 =C2=B1 1%  TOTAL sched_debug.cpu=
#12.ttwu_local
     24712 =C2=B1 3%   +2225.8%     574772 =C2=B1 1%  TOTAL sched_debug.cpu=
#41.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[12]:/.nr_running
    908047 =C2=B1 0%     -99.3%       6771 =C2=B146%  TOTAL sched_debug.cpu=
#41.sched_goidle
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#41.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[40]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#13.nr_running
   1045087 =C2=B1 1%    +592.6%    7238603 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[40]:/.min_vruntime
     23905 =C2=B1 4%   +2300.9%     573931 =C2=B1 1%  TOTAL sched_debug.cpu=
#40.ttwu_local
    362073 =C2=B1 4%     -99.0%       3783 =C2=B143%  TOTAL sched_debug.cpu=
#13.sched_goidle
         6 =C2=B145%    +383.3%         29 =C2=B1 0%  TOTAL sched_debug.cpu=
#40.cpu_load[4]
     27170 =C2=B1 6%   +2006.6%     572362 =C2=B1 1%  TOTAL sched_debug.cpu=
#13.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#40.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[13]:/.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[39]:/.nr_running
    956859 =C2=B1 2%    +664.8%    7318047 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[39]:/.min_vruntime
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#14.nr_running
     22156 =C2=B1 6%   +2515.2%     579425 =C2=B1 1%  TOTAL sched_debug.cpu=
#39.ttwu_local
         5 =C2=B120%    +400.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#39.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#39.nr_running
    342979 =C2=B1 2%     -99.1%       3153 =C2=B132%  TOTAL sched_debug.cpu=
#14.sched_goidle
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[38]:/.nr_running
     25831 =C2=B1 2%   +2108.8%     570574 =C2=B1 1%  TOTAL sched_debug.cpu=
#14.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[14]:/.nr_running
    998185 =C2=B1 4%    +630.6%    7292251 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[38]:/.min_vruntime
     21969 =C2=B1 3%   +2536.5%     579224 =C2=B1 1%  TOTAL sched_debug.cpu=
#38.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B118%  TOTAL sched_debug.cpu=
#15.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#38.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[37]:/.nr_running
         8 =C2=B122%   +7077.3%        631 =C2=B147%  TOTAL sched_debug.cfs=
_rq[37]:/.nr_spread_over
    976930 =C2=B1 2%    +653.4%    7359797 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[37]:/.min_vruntime
    365758 =C2=B1 2%     -98.9%       3877 =C2=B147%  TOTAL sched_debug.cpu=
#15.sched_goidle
     22211 =C2=B1 5%   +2503.0%     578152 =C2=B1 0%  TOTAL sched_debug.cpu=
#37.ttwu_local
     25988 =C2=B1 4%   +2107.9%     573784 =C2=B1 1%  TOTAL sched_debug.cpu=
#15.ttwu_local
         4 =C2=B123%    +559.1%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#37.cpu_load[4]
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[15]:/.nr_running
         5 =C2=B114%    +442.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#37.cpu_load[3]
         5 =C2=B1 9%    +414.8%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#37.cpu_load[2]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#37.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[36]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#16.nr_running
        10 =C2=B117%   +6420.8%        691 =C2=B126%  TOTAL sched_debug.cfs=
_rq[36]:/.nr_spread_over
    951225 =C2=B1 5%    +672.6%    7349084 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[36]:/.min_vruntime
     22668 =C2=B1 5%   +2450.8%     578229 =C2=B1 1%  TOTAL sched_debug.cpu=
#36.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#36.nr_running
     25231 =C2=B1 3%   +2177.7%     574692 =C2=B1 1%  TOTAL sched_debug.cpu=
#16.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[35]:/.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[16]:/.nr_running
    969215 =C2=B1 3%    +658.8%    7354084 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[35]:/.min_vruntime
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#17.nr_running
     22948 =C2=B1 6%   +2424.6%     579345 =C2=B1 1%  TOTAL sched_debug.cpu=
#35.ttwu_local
         4 =C2=B144%    +615.0%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#35.cpu_load[4]
         4 =C2=B148%    +518.2%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#35.cpu_load[0]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#35.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[34]:/.nr_running
     24619 =C2=B1 2%   +2234.0%     574630 =C2=B1 1%  TOTAL sched_debug.cpu=
#17.ttwu_local
    985770 =C2=B1 4%    +646.0%    7353877 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[34]:/.min_vruntime
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[17]:/.nr_running
     23297 =C2=B1 6%   +2389.1%     579887 =C2=B1 1%  TOTAL sched_debug.cpu=
#34.ttwu_local
         4 =C2=B142%    +534.8%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#34.cpu_load[4]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#18.nr_running
         5 =C2=B141%    +429.6%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#34.cpu_load[3]
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#34.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[33]:/.nr_running
        11 =C2=B139%   +7127.3%        795 =C2=B129%  TOTAL sched_debug.cfs=
_rq[33]:/.nr_spread_over
    952580 =C2=B1 1%    +670.8%    7342099 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[33]:/.min_vruntime
     24246 =C2=B1 4%   +2265.3%     573496 =C2=B1 1%  TOTAL sched_debug.cpu=
#18.ttwu_local
     24645 =C2=B1 6%   +2249.7%     579112 =C2=B1 1%  TOTAL sched_debug.cpu=
#33.ttwu_local
    933626 =C2=B1 1%     -99.3%       6613 =C2=B147%  TOTAL sched_debug.cpu=
#33.sched_goidle
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[18]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#33.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[32]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#19.nr_running
    950196 =C2=B1 2%    +670.3%    7319391 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[32]:/.min_vruntime
     25033 =C2=B1 5%   +2211.6%     578682 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#32.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[31]:/.nr_running
     23931 =C2=B1 3%   +2304.2%     575367 =C2=B1 1%  TOTAL sched_debug.cpu=
#19.ttwu_local
     23792 =C2=B1 1%   +2309.0%     573173 =C2=B1 1%  TOTAL sched_debug.cpu=
#31.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[19]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#31.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[30]:/.nr_running
     45.19 =C2=B1 0%    -100.0%       0.00 =C2=B1 0%  TOTAL perf-profile.cp=
u-cycles.__crc32c_le.chksum_update.crypto_shash_update.crc32c.sctp_csum_upd=
ate
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#20.nr_running
     23990 =C2=B1 2%   +2299.0%     575544 =C2=B1 1%  TOTAL sched_debug.cpu=
#30.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#30.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[29]:/.nr_running
    333744 =C2=B1 2%     -99.1%       3032 =C2=B130%  TOTAL sched_debug.cpu=
#20.sched_goidle
     23769 =C2=B1 2%   +2321.8%     575648 =C2=B1 1%  TOTAL sched_debug.cpu=
#20.ttwu_local
     23963 =C2=B1 2%   +2289.1%     572507 =C2=B1 1%  TOTAL sched_debug.cpu=
#29.ttwu_local
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[20]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#29.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[28]:/.nr_running
        16 =C2=B116%  +14806.2%       2385 =C2=B148%  TOTAL sched_debug.cfs=
_rq[28]:/.nr_spread_over
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#21.nr_running
     23955 =C2=B1 2%   +2294.9%     573707 =C2=B1 1%  TOTAL sched_debug.cpu=
#28.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#28.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[27]:/.nr_running
    200672 =C2=B141%   +3130.2%    6482112 =C2=B111%  TOTAL sched_debug.cfs=
_rq[27]:/.max_vruntime
    333344 =C2=B1 3%     -99.4%       2160 =C2=B144%  TOTAL sched_debug.cpu=
#21.sched_goidle
    200672 =C2=B141%   +3130.2%    6482112 =C2=B111%  TOTAL sched_debug.cfs=
_rq[27]:/.MIN_vruntime
     24388 =C2=B1 2%   +2254.3%     574189 =C2=B1 1%  TOTAL sched_debug.cpu=
#27.ttwu_local
     23766 =C2=B1 2%   +2316.8%     574378 =C2=B1 1%  TOTAL sched_debug.cpu=
#21.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#27.nr_running
        16 =C2=B123%   +8230.9%       1349 =C2=B131%  TOTAL sched_debug.cfs=
_rq[21]:/.nr_spread_over
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[21]:/.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[26]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#22.nr_running
     24877 =C2=B1 2%   +2200.2%     572209 =C2=B1 1%  TOTAL sched_debug.cpu=
#26.ttwu_local
    333909 =C2=B1 4%     -98.5%       4876 =C2=B131%  TOTAL sched_debug.cpu=
#26.sched_goidle
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#26.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[25]:/.nr_running
        21 =C2=B122%   +8784.9%       1883 =C2=B135%  TOTAL sched_debug.cfs=
_rq[25]:/.nr_spread_over
     24697 =C2=B1 4%   +2214.3%     571582 =C2=B1 1%  TOTAL sched_debug.cpu=
#25.ttwu_local
     24175 =C2=B1 5%   +2283.3%     576162 =C2=B1 1%  TOTAL sched_debug.cpu=
#22.ttwu_local
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#25.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[22]:/.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[24]:/.nr_running
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#23.nr_running
     25076 =C2=B1 2%   +2194.8%     575457 =C2=B1 1%  TOTAL sched_debug.cpu=
#24.ttwu_local
    336969 =C2=B1 2%     -99.1%       3193 =C2=B149%  TOTAL sched_debug.cpu=
#24.sched_goidle
         0 =C2=B1 0%      +Inf%          2 =C2=B1 0%  TOTAL sched_debug.cpu=
#24.nr_running
         0 =C2=B1 0%      +Inf%          1 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[23]:/.nr_running
    420529 =C2=B114%     -80.8%      80883 =C2=B1 6%  TOTAL sched_debug.cpu=
#24.avg_idle
        35 =C2=B1 1%    +394.3%        174 =C2=B1 0%  TOTAL vmstat.procs.r
    320932 =C2=B115%     -77.7%      71461 =C2=B1 8%  TOTAL sched_debug.cpu=
#26.avg_idle
    295750 =C2=B121%     -76.1%      70793 =C2=B117%  TOTAL sched_debug.cpu=
#2.avg_idle
    623387 =C2=B1 0%     -79.5%     127567 =C2=B1 1%  TOTAL softirqs.SCHED
         6 =C2=B142%    +320.6%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#40.cpu_load[3]
         6 =C2=B133%    +376.7%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#51.cpu_load[3]
         6 =C2=B127%    +358.1%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#62.cpu_load[3]
         6 =C2=B127%    +358.1%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#59.cpu_load[4]
         5 =C2=B120%    +403.4%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#44.cpu_load[3]
         5 =C2=B125%    +437.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#38.cpu_load[4]
         6 =C2=B121%    +361.3%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#46.cpu_load[1]
         6 =C2=B110%    +380.0%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#46.cpu_load[2]
         6 =C2=B118%    +364.5%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#44.cpu_load[2]
         6 =C2=B132%    +364.5%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#36.cpu_load[4]
         6 =C2=B121%    +358.1%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#44.cpu_load[1]
         6 =C2=B129%    +354.8%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#44.cpu_load[0]
         6 =C2=B144%    +361.3%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.cpu_load[4]
         6 =C2=B133%    +373.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#55.cpu_load[3]
         6 =C2=B128%    +323.5%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#46.cpu_load[0]
         5 =C2=B1 6%    +406.9%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#46.cpu_load[3]
    340647 =C2=B114%     -77.1%      77839 =C2=B114%  TOTAL sched_debug.cpu=
#25.avg_idle
         6 =C2=B118%    +376.7%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#38.cpu_load[3]
         4 =C2=B137%    +508.7%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#35.cpu_load[3]
         6 =C2=B129%    +314.7%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#56.cpu_load[0]
         6 =C2=B115%    +346.9%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#63.cpu_load[3]
         7 =C2=B147%    +305.7%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.cpu_load[3]
         6 =C2=B117%    +317.6%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#52.cpu_load[4]
         6 =C2=B115%    +343.8%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#56.cpu_load[2]
         6 =C2=B137%    +337.5%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#55.cpu_load[2]
         6 =C2=B123%    +343.8%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#39.cpu_load[3]
         6 =C2=B129%    +351.6%         28 =C2=B1 5%  TOTAL sched_debug.cpu=
#34.cpu_load[1]
         6 =C2=B131%    +354.8%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#34.cpu_load[2]
         6 =C2=B142%    +358.1%         28 =C2=B1 5%  TOTAL sched_debug.cpu=
#53.cpu_load[1]
         6 =C2=B140%    +373.3%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#53.cpu_load[2]
         6 =C2=B128%    +327.3%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#36.cpu_load[3]
         6 =C2=B120%    +327.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#56.cpu_load[1]
         7 =C2=B129%    +297.1%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#50.cpu_load[2]
         7 =C2=B144%    +265.8%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.cpu_load[2]
    317802 =C2=B1 9%     -77.7%      70785 =C2=B1 9%  TOTAL sched_debug.cpu=
#4.avg_idle
    346844 =C2=B110%     -77.6%      77616 =C2=B1 8%  TOTAL sched_debug.cpu=
#16.avg_idle
         4 =C2=B140%    +475.0%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#35.cpu_load[1]
         5 =C2=B135%    +452.0%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[48]:/.runnable_load_avg
         4 =C2=B140%    +470.8%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#35.cpu_load[2]
         5 =C2=B118%    +385.7%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#37.cpu_load[0]
         5 =C2=B1 6%    +369.0%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#37.cpu_load[1]
    366939 =C2=B113%     -78.7%      78115 =C2=B1 9%  TOTAL sched_debug.cpu=
#30.avg_idle
      1023 =C2=B137%    +323.5%       4333 =C2=B1 2%  TOTAL sched_debug.cpu=
#48.curr->pid
    327585 =C2=B1 9%     -77.2%      74734 =C2=B111%  TOTAL sched_debug.cpu=
#17.avg_idle
     12595 =C2=B1 0%     -76.7%       2929 =C2=B1 0%  TOTAL uptime.idle
    338343 =C2=B114%     -78.4%      73057 =C2=B1 5%  TOTAL sched_debug.cpu=
#31.avg_idle
         6 =C2=B137%    +353.1%         29 =C2=B1 4%  TOTAL sched_debug.cpu=
#58.cpu_load[4]
         7 =C2=B123%    +322.9%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#47.cpu_load[4]
         7 =C2=B128%    +316.7%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#42.cpu_load[4]
    316565 =C2=B115%     -74.7%      80204 =C2=B111%  TOTAL sched_debug.cpu=
#23.avg_idle
    295009 =C2=B122%     -75.0%      73750 =C2=B1 9%  TOTAL sched_debug.cpu=
#22.avg_idle
  19299589 =C2=B1 1%    +316.6%   80411460 =C2=B1 1%  TOTAL proc-vmstat.pga=
lloc_dma32
         6 =C2=B126%    +311.8%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#62.cpu_load[2]
         6 =C2=B121%    +393.3%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#45.cpu_load[3]
         7 =C2=B118%    +311.4%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#45.cpu_load[2]
         7 =C2=B110%    +286.8%         29 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[45]:/.runnable_load_avg
         8 =C2=B127%    +234.9%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#42.cpu_load[1]
         6 =C2=B119%    +323.5%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#60.cpu_load[4]
         8 =C2=B126%    +265.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#42.cpu_load[3]
         7 =C2=B113%    +297.2%         28 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[38]:/.runnable_load_avg
         8 =C2=B127%    +234.9%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#42.cpu_load[2]
         6 =C2=B140%    +364.5%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#54.cpu_load[4]
    306463 =C2=B116%     -72.5%      84417 =C2=B111%  TOTAL sched_debug.cpu=
#7.avg_idle
    294085 =C2=B113%     -74.4%      75243 =C2=B111%  TOTAL sched_debug.cpu=
#58.avg_idle
    295178 =C2=B1 8%     -74.8%      74330 =C2=B113%  TOTAL sched_debug.cpu=
#19.avg_idle
    310735 =C2=B112%     -74.4%      79628 =C2=B123%  TOTAL sched_debug.cpu=
#12.avg_idle
         7 =C2=B121%    +275.7%         27 =C2=B1 3%  TOTAL sched_debug.cpu=
#59.cpu_load[3]
         7 =C2=B130%    +277.8%         27 =C2=B1 5%  TOTAL sched_debug.cpu=
#62.cpu_load[1]
         7 =C2=B140%    +300.0%         28 =C2=B1 0%  TOTAL sched_debug.cpu=
#40.cpu_load[2]
         6 =C2=B134%    +314.7%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#51.cpu_load[2]
         7 =C2=B149%    +280.6%         27 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[40]:/.runnable_load_avg
         7 =C2=B134%    +297.1%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#55.cpu_load[1]
         8 =C2=B120%    +245.0%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#36.cpu_load[1]
         7 =C2=B123%    +286.1%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#36.cpu_load[2]
         7 =C2=B116%    +288.9%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#52.cpu_load[3]
         7 =C2=B113%    +278.4%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#63.cpu_load[2]
         7 =C2=B123%    +288.9%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#39.cpu_load[2]
         7 =C2=B128%    +271.1%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#39.cpu_load[1]
         7 =C2=B118%    +288.9%         28 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[63]:/.runnable_load_avg
         6 =C2=B128%    +302.9%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[37]:/.runnable_load_avg
         7 =C2=B130%    +255.3%         27 =C2=B1 6%  TOTAL sched_debug.cpu=
#38.cpu_load[0]
         7 =C2=B125%    +283.3%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#38.cpu_load[1]
         6 =C2=B122%    +324.2%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#38.cpu_load[2]
         6 =C2=B125%    +308.8%         27 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[56]:/.runnable_load_avg
         7 =C2=B138%    +267.6%         27 =C2=B1 5%  TOTAL sched_debug.cpu=
#62.cpu_load[0]
    317966 =C2=B113%     -74.2%      82042 =C2=B1 9%  TOTAL sched_debug.cpu=
#27.avg_idle
    296746 =C2=B116%     -74.7%      75078 =C2=B1 9%  TOTAL sched_debug.cpu=
#14.avg_idle
    298670 =C2=B115%     -73.3%      79831 =C2=B122%  TOTAL sched_debug.cpu=
#6.avg_idle
         6 =C2=B132%    +302.9%         27 =C2=B1 5%  TOTAL sched_debug.cpu=
#34.cpu_load[0]
         7 =C2=B110%    +260.5%         27 =C2=B1 3%  TOTAL sched_debug.cpu=
#52.cpu_load[2]
         6 =C2=B123%    +297.1%         27 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[61]:/.runnable_load_avg
         8 =C2=B139%    +216.3%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.cpu_load[1]
         7 =C2=B130%    +252.6%         26 =C2=B1 2%  TOTAL sched_debug.cpu=
#50.cpu_load[0]
         6 =C2=B138%    +302.9%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#40.cpu_load[1]
         7 =C2=B116%    +283.3%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#63.cpu_load[1]
         7 =C2=B127%    +255.3%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#50.cpu_load[1]
         6 =C2=B144%    +335.5%         27 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[35]:/.runnable_load_avg
         6 =C2=B139%    +300.0%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#40.cpu_load[0]
    294207 =C2=B116%     -73.9%      76789 =C2=B118%  TOTAL sched_debug.cpu=
#20.avg_idle
      1454 =C2=B147%    +193.6%       4270 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.curr->pid
    274384 =C2=B128%     -64.9%      96227 =C2=B133%  TOTAL sched_debug.cpu=
#33.avg_idle
    287321 =C2=B1 8%     -73.1%      77157 =C2=B110%  TOTAL sched_debug.cpu=
#3.avg_idle
         7 =C2=B110%    +255.3%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#52.cpu_load[1]
      1284 =C2=B129%    +228.6%       4222 =C2=B1 0%  TOTAL sched_debug.cpu=
#43.curr->pid
    349008 =C2=B115%     -74.2%      90084 =C2=B1 6%  TOTAL sched_debug.cpu=
#21.avg_idle
         9 =C2=B111%    +230.6%         32 =C2=B1 4%  TOTAL sched_debug.cpu=
#49.cpu_load[4]
         7 =C2=B130%    +281.6%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#43.cpu_load[2]
         7 =C2=B129%    +297.3%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#43.cpu_load[3]
         6 =C2=B138%    +323.5%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#54.cpu_load[3]
         8 =C2=B129%    +223.3%         27 =C2=B110%  TOTAL sched_debug.cfs=
_rq[58]:/.runnable_load_avg
         7 =C2=B118%    +271.8%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#47.cpu_load[3]
         7 =C2=B131%    +322.9%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#43.cpu_load[4]
         7 =C2=B132%    +283.8%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#58.cpu_load[3]
         9 =C2=B125%    +222.2%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#42.cpu_load[0]
    291808 =C2=B112%     -72.2%      81207 =C2=B112%  TOTAL sched_debug.cpu=
#0.avg_idle
     12900 =C2=B1 6%    +248.9%      45016 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[61]:/.avg->runnable_avg_sum
       282 =C2=B1 6%    +247.8%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[61]:/.tg_runnable_contrib
    307360 =C2=B120%     -75.2%      76165 =C2=B1 7%  TOTAL sched_debug.cpu=
#13.avg_idle
      1213 =C2=B136%    +252.3%       4273 =C2=B1 0%  TOTAL sched_debug.cpu=
#35.curr->pid
   2108032 =C2=B1 5%     -71.2%     607806 =C2=B1 1%  TOTAL sched_debug.cpu=
#34.sched_count
   2130952 =C2=B1 9%     -71.4%     609735 =C2=B1 1%  TOTAL sched_debug.cpu=
#33.sched_count
         7 =C2=B139%    +268.4%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#54.cpu_load[0]
         7 =C2=B139%    +278.4%         28 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[53]:/.runnable_load_avg
         8 =C2=B123%    +223.3%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#36.cpu_load[0]
         7 =C2=B120%    +286.1%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#60.cpu_load[3]
         7 =C2=B121%    +265.8%         27 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[50]:/.runnable_load_avg
         7 =C2=B131%    +276.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#45.cpu_load[0]
         8 =C2=B124%    +226.2%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[55]:/.runnable_load_avg
         6 =C2=B136%    +320.6%         28 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[44]:/.runnable_load_avg
         7 =C2=B126%    +281.1%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#51.cpu_load[1]
         7 =C2=B127%    +265.8%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#51.cpu_load[0]
         8 =C2=B127%    +233.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#39.cpu_load[0]
         7 =C2=B121%    +276.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#45.cpu_load[1]
       293 =C2=B1 8%    +234.7%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[56]:/.tg_runnable_contrib
   2074224 =C2=B1 3%     -70.6%     609675 =C2=B1 2%  TOTAL sched_debug.cpu=
#63.sched_count
   2127419 =C2=B1 6%     -71.7%     601604 =C2=B1 1%  TOTAL sched_debug.cpu=
#46.sched_count
   2115949 =C2=B1 3%     -65.2%     737051 =C2=B135%  TOTAL sched_debug.cpu=
#36.sched_count
     13414 =C2=B1 8%    +235.7%      45027 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[56]:/.avg->runnable_avg_sum
    267808 =C2=B113%     -72.1%      74782 =C2=B110%  TOTAL sched_debug.cpu=
#5.avg_idle
   2069493 =C2=B1 8%     -68.4%     654987 =C2=B118%  TOTAL sched_debug.cpu=
#45.sched_count
     14044 =C2=B111%    +220.7%      45039 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[55]:/.avg->runnable_avg_sum
   2053686 =C2=B1 4%     -70.7%     602700 =C2=B1 2%  TOTAL sched_debug.cpu=
#52.sched_count
    289450 =C2=B113%     -68.8%      90401 =C2=B115%  TOTAL sched_debug.cpu=
#1.avg_idle
       307 =C2=B111%    +219.5%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[55]:/.tg_runnable_contrib
   2002864 =C2=B1 8%     -69.9%     602844 =C2=B1 1%  TOTAL sched_debug.cpu=
#40.sched_count
   2035365 =C2=B1 2%     -70.3%     603651 =C2=B1 1%  TOTAL sched_debug.cpu=
#47.sched_count
         9 =C2=B124%    +197.8%         26 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[59]:/.runnable_load_avg
         8 =C2=B124%    +226.8%         26 =C2=B1 6%  TOTAL sched_debug.cpu=
#60.cpu_load[0]
         8 =C2=B123%    +235.0%         26 =C2=B1 4%  TOTAL sched_debug.cpu=
#59.cpu_load[1]
         7 =C2=B119%    +252.6%         26 =C2=B1 4%  TOTAL sched_debug.cpu=
#60.cpu_load[1]
         8 =C2=B123%    +234.1%         27 =C2=B1 3%  TOTAL sched_debug.cpu=
#59.cpu_load[2]
         8 =C2=B136%    +209.1%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[32]:/.runnable_load_avg
         7 =C2=B120%    +253.8%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#63.cpu_load[0]
         8 =C2=B116%    +206.8%         27 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[52]:/.runnable_load_avg
         7 =C2=B119%    +257.9%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#60.cpu_load[2]
   2008711 =C2=B1 1%     -70.0%     602980 =C2=B1 1%  TOTAL sched_debug.cpu=
#61.nr_switches
   2100707 =C2=B1 7%     -71.1%     606142 =C2=B1 2%  TOTAL sched_debug.cpu=
#53.sched_count
   2046800 =C2=B1 1%     -65.3%     710307 =C2=B128%  TOTAL sched_debug.cpu=
#60.sched_count
   2091856 =C2=B1 3%     -70.6%     614687 =C2=B1 3%  TOTAL sched_debug.cpu=
#38.sched_count
   2062814 =C2=B1 3%     -70.7%     604560 =C2=B1 2%  TOTAL sched_debug.cpu=
#54.sched_count
     13554 =C2=B111%    +232.3%      45048 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[35]:/.avg->runnable_avg_sum
       296 =C2=B111%    +231.2%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[35]:/.tg_runnable_contrib
      1474 =C2=B129%    +188.2%       4249 =C2=B1 0%  TOTAL sched_debug.cpu=
#62.curr->pid
   2049101 =C2=B1 6%     -70.4%     607303 =C2=B1 2%  TOTAL sched_debug.cpu=
#41.sched_count
   2167538 =C2=B1 9%     -71.9%     609753 =C2=B1 2%  TOTAL sched_debug.cpu=
#39.sched_count
   2036680 =C2=B1 3%     -70.3%     605379 =C2=B1 1%  TOTAL sched_debug.cpu=
#51.sched_count
   2017924 =C2=B1 1%     -70.0%     604898 =C2=B1 0%  TOTAL sched_debug.cpu=
#59.sched_count
     14509 =C2=B113%    +210.5%      45046 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[63]:/.avg->runnable_avg_sum
   2076058 =C2=B1 5%     -69.2%     640162 =C2=B110%  TOTAL sched_debug.cpu=
#37.sched_count
      1225 =C2=B136%    +253.2%       4329 =C2=B1 3%  TOTAL sched_debug.cpu=
#53.curr->pid
      1148 =C2=B127%    +268.3%       4230 =C2=B1 1%  TOTAL sched_debug.cpu=
#61.curr->pid
     14570 =C2=B113%    +209.0%      45024 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[34]:/.avg->runnable_avg_sum
   2020274 =C2=B1 0%     -69.8%     610215 =C2=B1 2%  TOTAL sched_debug.cpu=
#62.nr_switches
       319 =C2=B113%    +208.0%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[34]:/.tg_runnable_contrib
       317 =C2=B113%    +208.1%        978 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[63]:/.tg_runnable_contrib
   2042951 =C2=B1 1%     -69.7%     618701 =C2=B1 2%  TOTAL sched_debug.cpu=
#62.sched_count
   2058101 =C2=B1 7%     -70.8%     600726 =C2=B1 1%  TOTAL sched_debug.cpu=
#44.sched_count
   1984924 =C2=B1 1%     -69.5%     604880 =C2=B1 0%  TOTAL sched_debug.cpu=
#59.nr_switches
   1971315 =C2=B1 1%     -69.3%     604542 =C2=B1 2%  TOTAL sched_debug.cpu=
#54.nr_switches
   2014162 =C2=B1 6%     -65.2%     700760 =C2=B128%  TOTAL sched_debug.cpu=
#42.sched_count
   1953776 =C2=B1 2%     -68.8%     609656 =C2=B1 2%  TOTAL sched_debug.cpu=
#63.nr_switches
   2055362 =C2=B1 7%     -65.1%     717767 =C2=B133%  TOTAL sched_debug.cpu=
#43.sched_count
      1231 =C2=B129%    +249.4%       4303 =C2=B1 2%  TOTAL sched_debug.cpu=
#50.curr->pid
       313 =C2=B110%    +213.7%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[62]:/.tg_runnable_contrib
         7 =C2=B113%    +255.3%         27 =C2=B1 6%  TOTAL sched_debug.cpu=
#52.cpu_load[0]
         8 =C2=B131%    +202.3%         26 =C2=B1 3%  TOTAL sched_debug.cpu=
#32.cpu_load[0]
   1991792 =C2=B1 1%     -69.3%     611077 =C2=B1 1%  TOTAL sched_debug.cpu=
#60.nr_switches
     14342 =C2=B110%    +214.0%      45031 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[62]:/.avg->runnable_avg_sum
   1942697 =C2=B1 1%     -69.0%     602682 =C2=B1 2%  TOTAL sched_debug.cpu=
#52.nr_switches
   1950644 =C2=B1 1%     -69.2%     601592 =C2=B1 1%  TOTAL sched_debug.cpu=
#46.nr_switches
   1992472 =C2=B1 1%     -61.6%     765257 =C2=B125%  TOTAL sched_debug.cpu=
#50.sched_count
         8 =C2=B120%    +241.5%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#58.cpu_load[1]
         9 =C2=B112%    +215.6%         28 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[39]:/.runnable_load_avg
         7 =C2=B131%    +283.8%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#54.cpu_load[2]
         8 =C2=B122%    +238.1%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#47.cpu_load[2]
         8 =C2=B126%    +250.0%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#58.cpu_load[2]
     13572 =C2=B112%    +232.0%      45056 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[37]:/.avg->runnable_avg_sum
   2047201 =C2=B1 6%     -67.2%     670954 =C2=B118%  TOTAL sched_debug.cpu=
#35.sched_count
       297 =C2=B112%    +230.8%        983 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[37]:/.tg_runnable_contrib
   1955174 =C2=B1 2%     -69.1%     603605 =C2=B1 1%  TOTAL sched_debug.cpu=
#55.nr_switches
   1971669 =C2=B1 5%     -69.1%     608414 =C2=B1 1%  TOTAL sched_debug.cpu=
#49.sched_count
   1939844 =C2=B1 1%     -68.8%     605845 =C2=B1 1%  TOTAL sched_debug.cpu=
#36.nr_switches
   1949899 =C2=B1 1%     -68.9%     606124 =C2=B1 2%  TOTAL sched_debug.cpu=
#53.nr_switches
       315 =C2=B112%    +211.7%        984 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[51]:/.tg_runnable_contrib
        12 =C2=B127%    +166.7%         32 =C2=B1 6%  TOTAL sched_debug.cpu=
#49.cpu_load[2]
        11 =C2=B121%    +184.2%         32 =C2=B1 5%  TOTAL sched_debug.cpu=
#49.cpu_load[3]
     14438 =C2=B112%    +212.0%      45043 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[51]:/.avg->runnable_avg_sum
   2001341 =C2=B1 4%     -66.4%     671981 =C2=B117%  TOTAL sched_debug.cpu=
#57.sched_count
    303710 =C2=B117%     -70.0%      91263 =C2=B113%  TOTAL sched_debug.cpu=
#9.avg_idle
   1900887 =C2=B1 1%     -68.4%     600434 =C2=B1 1%  TOTAL sched_debug.cpu=
#45.nr_switches
     14272 =C2=B112%    +215.8%      45065 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[59]:/.avg->runnable_avg_sum
   1937164 =C2=B1 0%     -68.5%     609385 =C2=B1 1%  TOTAL sched_debug.cpu=
#37.nr_switches
   1974368 =C2=B1 1%     -69.1%     609730 =C2=B1 2%  TOTAL sched_debug.cpu=
#39.nr_switches
   1973848 =C2=B1 2%     -62.6%     738151 =C2=B135%  TOTAL sched_debug.cpu=
#58.sched_count
   1912735 =C2=B1 1%     -68.5%     603190 =C2=B1 2%  TOTAL sched_debug.cpu=
#50.nr_switches
   1931643 =C2=B1 2%     -68.6%     607250 =C2=B1 2%  TOTAL sched_debug.cpu=
#58.nr_switches
      1377 =C2=B114%    +216.7%       4363 =C2=B1 1%  TOTAL sched_debug.cpu=
#49.curr->pid
       312 =C2=B112%    +214.1%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[59]:/.tg_runnable_contrib
   1944033 =C2=B1 1%     -68.9%     605363 =C2=B1 1%  TOTAL sched_debug.cpu=
#51.nr_switches
   1915699 =C2=B1 1%     -68.1%     610629 =C2=B1 1%  TOTAL sched_debug.cpu=
#35.nr_switches
     15047 =C2=B112%    +199.1%      45011 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[32]:/.avg->runnable_avg_sum
     46418 =C2=B1 2%    +213.2%     145374 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[62]:/.exec_clock
   1924241 =C2=B1 2%     -68.3%     609789 =C2=B1 2%  TOTAL sched_debug.cpu=
#38.nr_switches
   1912400 =C2=B1 1%     -68.4%     603629 =C2=B1 1%  TOTAL sched_debug.cpu=
#47.nr_switches
       329 =C2=B112%    +197.8%        979 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[32]:/.tg_runnable_contrib
   1895051 =C2=B1 2%     -68.3%     600708 =C2=B1 1%  TOTAL sched_debug.cpu=
#44.nr_switches
     13983 =C2=B114%    +222.1%      45044 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[44]:/.avg->runnable_avg_sum
   1901704 =C2=B1 1%     -67.9%     609715 =C2=B1 1%  TOTAL sched_debug.cpu=
#33.nr_switches
     14514 =C2=B1 2%    +214.1%      45583 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[33]:/.avg->runnable_avg_sum
       306 =C2=B114%    +221.0%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[44]:/.tg_runnable_contrib
   1926663 =C2=B1 0%     -68.2%     613403 =C2=B1 2%  TOTAL sched_debug.cpu=
#48.sched_count
       317 =C2=B1 2%    +212.6%        993 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[33]:/.tg_runnable_contrib
      1203 =C2=B134%    +258.3%       4310 =C2=B1 1%  TOTAL sched_debug.cpu=
#56.curr->pid
     46837 =C2=B1 2%    +210.4%     145375 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[60]:/.exec_clock
   1874381 =C2=B1 1%     -67.9%     600905 =C2=B1 1%  TOTAL sched_debug.cpu=
#42.nr_switches
         8 =C2=B116%    +238.1%         28 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[47]:/.runnable_load_avg
         9 =C2=B112%    +200.0%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#58.cpu_load[0]
         9 =C2=B124%    +213.3%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#47.cpu_load[1]
         9 =C2=B128%    +200.0%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#47.cpu_load[0]
         8 =C2=B134%    +239.0%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#55.cpu_load[0]
         8 =C2=B115%    +222.7%         28 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[36]:/.runnable_load_avg
         8 =C2=B123%    +246.3%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#43.cpu_load[1]
         8 =C2=B122%    +250.0%         28 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[43]:/.runnable_load_avg
         9 =C2=B137%    +213.3%         28 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[34]:/.runnable_load_avg
         7 =C2=B132%    +268.4%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#54.cpu_load[1]
         9 =C2=B137%    +208.9%         27 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[51]:/.runnable_load_avg
   1916043 =C2=B1 2%     -68.3%     607993 =C2=B1 2%  TOTAL sched_debug.cpu=
#57.nr_switches
    265392 =C2=B117%     -64.3%      94795 =C2=B122%  TOTAL sched_debug.cpu=
#43.avg_idle
   1889707 =C2=B1 1%     -68.3%     599744 =C2=B1 1%  TOTAL sched_debug.cpu=
#43.nr_switches
         9 =C2=B129%    +227.1%         31 =C2=B1 3%  TOTAL sched_debug.cpu=
#33.cpu_load[4]
        39 =C2=B146%    +117.4%         84 =C2=B132%  TOTAL sched_debug.cfs=
_rq[17]:/.tg_load_contrib
   1867119 =C2=B1 0%     -67.6%     605812 =C2=B1 1%  TOTAL sched_debug.cpu=
#49.nr_switches
   1889889 =C2=B1 1%     -67.8%     607783 =C2=B1 1%  TOTAL sched_debug.cpu=
#34.nr_switches
     47035 =C2=B1 4%    +209.1%     145403 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[61]:/.exec_clock
   1860154 =C2=B1 1%     -67.6%     602684 =C2=B1 2%  TOTAL sched_debug.cpu=
#48.nr_switches
       325 =C2=B110%    +202.2%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[39]:/.tg_runnable_contrib
  66798546 =C2=B1 0%    +206.8%  2.049e+08 =C2=B1 0%  TOTAL softirqs.NET_RX
     13894 =C2=B113%    +224.1%      45029 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[48]:/.avg->runnable_avg_sum
     14866 =C2=B110%    +202.7%      44994 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[39]:/.avg->runnable_avg_sum
     14874 =C2=B111%    +207.3%      45713 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[57]:/.avg->runnable_avg_sum
   1893238 =C2=B1 1%     -67.9%     608368 =C2=B1 1%  TOTAL sched_debug.cpu=
#56.sched_count
       304 =C2=B113%    +222.6%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[48]:/.tg_runnable_contrib
   1850633 =C2=B1 0%     -67.2%     606443 =C2=B1 2%  TOTAL sched_debug.cpu=
#41.nr_switches
    273840 =C2=B122%     -69.2%      84378 =C2=B1 8%  TOTAL sched_debug.cpu=
#60.avg_idle
       325 =C2=B112%    +206.1%        996 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[57]:/.tg_runnable_contrib
     14957 =C2=B112%    +201.5%      45098 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[58]:/.avg->runnable_avg_sum
     47628 =C2=B1 2%    +205.5%     145491 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[51]:/.exec_clock
    271141 =C2=B115%     -64.6%      96084 =C2=B133%  TOTAL sched_debug.cpu=
#47.avg_idle
     47097 =C2=B1 2%    +208.9%     145500 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[59]:/.exec_clock
      1395 =C2=B113%    +210.6%       4334 =C2=B1 2%  TOTAL sched_debug.cpu=
#55.curr->pid
     15193 =C2=B110%    +196.8%      45096 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[50]:/.avg->runnable_avg_sum
       326 =C2=B112%    +200.6%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[58]:/.tg_runnable_contrib
       315 =C2=B1 8%    +211.4%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[38]:/.tg_runnable_contrib
     14456 =C2=B1 8%    +211.3%      45004 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[38]:/.avg->runnable_avg_sum
     47896 =C2=B1 3%    +203.5%     145372 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[54]:/.exec_clock
       332 =C2=B110%    +195.7%        984 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[50]:/.tg_runnable_contrib
   1865184 =C2=B1 2%     -67.4%     608353 =C2=B1 1%  TOTAL sched_debug.cpu=
#56.nr_switches
     47722 =C2=B1 2%    +204.7%     145411 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[55]:/.exec_clock
     47334 =C2=B1 2%    +207.3%     145475 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[52]:/.exec_clock
     15320 =C2=B1 5%    +193.8%      45011 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[46]:/.avg->runnable_avg_sum
     48192 =C2=B1 1%    +201.6%     145362 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[63]:/.exec_clock
     48037 =C2=B1 1%    +202.7%     145411 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[32]:/.exec_clock
      1497 =C2=B119%    +193.5%       4395 =C2=B1 5%  TOTAL sched_debug.cpu=
#52.curr->pid
   1846875 =C2=B1 0%     -67.1%     607481 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.nr_switches
    287922 =C2=B123%     -70.6%      84722 =C2=B116%  TOTAL sched_debug.cpu=
#11.avg_idle
     48162 =C2=B1 3%    +202.0%     145448 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[36]:/.exec_clock
       335 =C2=B1 5%    +192.7%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[46]:/.tg_runnable_contrib
     47591 =C2=B1 2%    +205.6%     145417 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[53]:/.exec_clock
    270817 =C2=B122%     -66.3%      91254 =C2=B113%  TOTAL sched_debug.cpu=
#63.avg_idle
     15169 =C2=B110%    +196.9%      45031 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[36]:/.avg->runnable_avg_sum
       332 =C2=B110%    +196.3%        984 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[36]:/.tg_runnable_contrib
         9 =C2=B131%    +195.7%         27 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[54]:/.runnable_load_avg
      1552 =C2=B127%    +175.8%       4281 =C2=B1 2%  TOTAL sched_debug.cpu=
#60.curr->pid
     49056 =C2=B1 1%    +199.2%     146799 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[33]:/.exec_clock
      1431 =C2=B122%    +201.8%       4321 =C2=B1 1%  TOTAL sched_debug.cpu=
#34.curr->pid
     48712 =C2=B1 2%    +198.8%     145545 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[50]:/.exec_clock
     48311 =C2=B1 1%    +201.0%     145402 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[39]:/.exec_clock
       332 =C2=B1 9%    +201.0%        999 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[49]:/.tg_runnable_contrib
    226926 =C2=B113%     -62.6%      84981 =C2=B124%  TOTAL sched_debug.cpu=
#38.avg_idle
     15180 =C2=B1 9%    +201.5%      45763 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[49]:/.avg->runnable_avg_sum
     48719 =C2=B1 2%    +198.5%     145438 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[56]:/.exec_clock
   1795031 =C2=B1 0%     -66.4%     602823 =C2=B1 1%  TOTAL sched_debug.cpu=
#40.nr_switches
     48496 =C2=B1 2%    +199.9%     145443 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[58]:/.exec_clock
     15260 =C2=B111%    +195.2%      45042 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[40]:/.avg->runnable_avg_sum
    285472 =C2=B125%     -68.5%      89860 =C2=B128%  TOTAL sched_debug.cpu=
#15.avg_idle
       334 =C2=B111%    +194.3%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[40]:/.tg_runnable_contrib
     49933 =C2=B1 2%    +194.4%     147012 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[57]:/.exec_clock
     49101 =C2=B1 2%    +196.1%     145384 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[37]:/.exec_clock
     49003 =C2=B1 1%    +196.8%     145444 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[35]:/.exec_clock
      1390 =C2=B122%    +206.7%       4265 =C2=B1 0%  TOTAL sched_debug.cpu=
#37.curr->pid
     48581 =C2=B1 3%    +199.4%     145429 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[48]:/.exec_clock
      1630 =C2=B125%    +160.5%       4247 =C2=B1 2%  TOTAL sched_debug.cpu=
#47.curr->pid
     49123 =C2=B1 2%    +196.0%     145404 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[46]:/.exec_clock
    266050 =C2=B120%     -59.4%     107922 =C2=B124%  TOTAL sched_debug.cpu=
#52.avg_idle
     14978 =C2=B110%    +200.9%      45075 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[45]:/.avg->runnable_avg_sum
      1417 =C2=B121%    +204.3%       4312 =C2=B1 2%  TOTAL sched_debug.cpu=
#39.curr->pid
        12 =C2=B126%    +160.7%         31 =C2=B1 9%  TOTAL sched_debug.cpu=
#49.cpu_load[1]
       327 =C2=B110%    +198.7%        978 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[45]:/.tg_runnable_contrib
    270121 =C2=B117%     -61.7%     103375 =C2=B120%  TOTAL sched_debug.cpu=
#32.avg_idle
     50428 =C2=B1 2%    +189.1%     145774 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[42]:/.exec_clock
      1574 =C2=B134%    +166.5%       4194 =C2=B1 1%  TOTAL sched_debug.cpu=
#45.curr->pid
     50663 =C2=B1 1%    +189.6%     146717 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[49]:/.exec_clock
     49273 =C2=B1 2%    +195.3%     145509 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[34]:/.exec_clock
     15310 =C2=B113%    +194.0%      45007 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[60]:/.avg->runnable_avg_sum
    236078 =C2=B111%     -65.9%      80473 =C2=B114%  TOTAL sched_debug.cpu=
#41.avg_idle
     49673 =C2=B1 2%    +192.7%     145415 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[38]:/.exec_clock
         8 =C2=B126%    +235.0%         26 =C2=B1 5%  TOTAL sched_debug.cpu=
#59.cpu_load[0]
     50433 =C2=B1 2%    +188.4%     145447 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[45]:/.exec_clock
     15213 =C2=B1 5%    +196.2%      45068 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[52]:/.avg->runnable_avg_sum
       334 =C2=B113%    +193.4%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[60]:/.tg_runnable_contrib
     50577 =C2=B1 1%    +187.9%     145609 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[43]:/.exec_clock
    249630 =C2=B115%     -65.3%      86741 =C2=B1 5%  TOTAL sched_debug.cpu=
#8.avg_idle
       332 =C2=B1 5%    +194.9%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[52]:/.tg_runnable_contrib
    235932 =C2=B1 9%     -62.3%      88954 =C2=B119%  TOTAL sched_debug.cpu=
#34.avg_idle
     50890 =C2=B1 2%    +185.7%     145384 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[47]:/.exec_clock
     50930 =C2=B1 1%    +185.7%     145517 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[40]:/.exec_clock
     14328 =C2=B116%    +214.3%      45037 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[53]:/.avg->runnable_avg_sum
     16062 =C2=B1 9%    +180.4%      45031 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[47]:/.avg->runnable_avg_sum
     51840 =C2=B1 1%    +183.3%     146858 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[41]:/.exec_clock
      1499 =C2=B120%    +187.0%       4301 =C2=B1 1%  TOTAL sched_debug.cpu=
#51.curr->pid
     50662 =C2=B1 2%    +187.3%     145570 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[44]:/.exec_clock
    269032 =C2=B1 7%     -66.8%      89230 =C2=B117%  TOTAL sched_debug.cpu=
#59.avg_idle
       313 =C2=B116%    +212.5%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[53]:/.tg_runnable_contrib
     16303 =C2=B117%    +176.2%      45035 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[54]:/.avg->runnable_avg_sum
       356 =C2=B117%    +174.9%        979 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[54]:/.tg_runnable_contrib
       351 =C2=B1 9%    +178.0%        977 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[47]:/.tg_runnable_contrib
     15587 =C2=B111%    +189.2%      45070 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[43]:/.avg->runnable_avg_sum
       341 =C2=B111%    +187.8%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[43]:/.tg_runnable_contrib
  99841369 =C2=B1 0%    +180.1%  2.796e+08 =C2=B1 1%  TOTAL numa-numastat.n=
ode2.local_node
  99843858 =C2=B1 0%    +180.1%  2.796e+08 =C2=B1 1%  TOTAL numa-numastat.n=
ode2.numa_hit
        10 =C2=B117%    +196.2%         30 =C2=B1 3%  TOTAL sched_debug.cpu=
#57.cpu_load[4]
        11 =C2=B112%    +189.1%         31 =C2=B1 8%  TOTAL sched_debug.cpu=
#41.cpu_load[4]
      1560 =C2=B111%    +175.1%       4292 =C2=B1 1%  TOTAL sched_debug.cpu=
#59.curr->pid
  49642548 =C2=B1 0%    +177.8%  1.379e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e2.numa_local
         8 =C2=B128%    +220.5%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#43.cpu_load[0]
  49698361 =C2=B1 0%    +177.6%   1.38e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e2.numa_hit
    219871 =C2=B118%     -57.9%      92485 =C2=B115%  TOTAL sched_debug.cpu=
#62.avg_idle
  50123901 =C2=B1 0%    +178.0%  1.393e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e0.numa_local
  50127863 =C2=B1 0%    +177.9%  1.393e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e0.numa_hit
     16250 =C2=B1 5%    +178.5%      45253 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[42]:/.avg->runnable_avg_sum
  49861680 =C2=B1 0%    +176.2%  1.377e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e3.numa_local
       355 =C2=B1 5%    +177.0%        985 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[42]:/.tg_runnable_contrib
  49917445 =C2=B1 0%    +176.0%  1.378e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e3.numa_hit
      1564 =C2=B112%    +175.2%       4304 =C2=B1 2%  TOTAL sched_debug.cpu=
#54.curr->pid
  49911338 =C2=B1 0%    +175.9%  1.377e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_local
    248524 =C2=B115%     -58.0%     104482 =C2=B129%  TOTAL sched_debug.cpu=
#46.avg_idle
  49966794 =C2=B1 0%    +175.7%  1.377e+08 =C2=B1 1%  TOTAL numa-vmstat.nod=
e1.numa_hit
      1429 =C2=B120%    +198.6%       4269 =C2=B1 0%  TOTAL sched_debug.cpu=
#44.curr->pid
     16484 =C2=B1 8%    +175.8%      45465 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[41]:/.avg->runnable_avg_sum
       361 =C2=B1 8%    +174.8%        992 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[41]:/.tg_runnable_contrib
      1453 =C2=B123%    +197.1%       4318 =C2=B1 1%  TOTAL sched_debug.cpu=
#57.curr->pid
      1424 =C2=B128%    +213.8%       4470 =C2=B1 5%  TOTAL sched_debug.cpu=
#63.curr->pid
      1420 =C2=B123%    +201.2%       4278 =C2=B1 3%  TOTAL sched_debug.cpu=
#58.curr->pid
    211265 =C2=B121%     -57.9%      88934 =C2=B131%  TOTAL sched_debug.cpu=
#39.avg_idle
        37 =C2=B132%    +129.8%         86 =C2=B110%  TOTAL sched_debug.cfs=
_rq[3]:/.tg_load_contrib
   2788857 =C2=B1 1%    +163.2%    7340919 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[16]:/.min_vruntime
    224622 =C2=B117%     -59.3%      91521 =C2=B115%  TOTAL sched_debug.cpu=
#35.avg_idle
   2764205 =C2=B1 1%    +161.1%    7216910 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[8]:/.min_vruntime
   2819278 =C2=B1 1%    +156.7%    7238266 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[10]:/.min_vruntime
   2837162 =C2=B1 1%    +159.3%    7357411 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[24]:/.min_vruntime
   2817770 =C2=B1 1%    +160.8%    7349390 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[17]:/.min_vruntime
        12 =C2=B131%    +160.0%         31 =C2=B1 4%  TOTAL sched_debug.cpu=
#33.cpu_load[3]
   2839736 =C2=B1 1%    +154.5%    7225910 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[13]:/.min_vruntime
        37 =C2=B138%     +86.6%         69 =C2=B145%  TOTAL sched_debug.cfs=
_rq[27]:/.tg_load_contrib
      1826 =C2=B115%    +133.4%       4262 =C2=B1 0%  TOTAL sched_debug.cpu=
#36.curr->pid
   2880692 =C2=B1 3%    +154.0%    7316909 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[0]:/.min_vruntime
      1543 =C2=B116%    +175.8%       4257 =C2=B1 0%  TOTAL sched_debug.cpu=
#46.curr->pid
   2903723 =C2=B1 1%    +153.0%    7346423 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[20]:/.min_vruntime
   2853451 =C2=B1 1%    +156.8%    7328372 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[18]:/.min_vruntime
   2881811 =C2=B1 2%    +154.8%    7342530 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[25]:/.min_vruntime
      3.22 =C2=B1 1%    +149.8%       8.05 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.sctp_user_addto_chunk.sctp_datamsg_from_u=
ser.sctp_sendmsg.inet_sendmsg
   2848635 =C2=B1 1%    +153.7%    7225776 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[12]:/.min_vruntime
   2878875 =C2=B1 2%    +155.2%    7346322 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[2]:/.min_vruntime
    222782 =C2=B127%     -61.7%      85268 =C2=B1 9%  TOTAL sched_debug.cpu=
#56.avg_idle
   2831503 =C2=B1 1%    +154.5%    7205461 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[11]:/.min_vruntime
   2835663 =C2=B1 1%    +154.6%    7218527 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[9]:/.min_vruntime
      1704 =C2=B126%    +152.9%       4309 =C2=B1 1%  TOTAL sched_debug.cpu=
#41.curr->pid
        12 =C2=B135%    +130.6%         28 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[48]:/.load
   2844115 =C2=B1 0%    +154.4%    7235577 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[15]:/.min_vruntime
      1665 =C2=B128%    +159.1%       4315 =C2=B1 1%  TOTAL sched_debug.cpu=
#33.curr->pid
   2892891 =C2=B1 1%    +154.2%    7353510 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[19]:/.min_vruntime
   2901579 =C2=B1 2%    +152.7%    7332677 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[22]:/.min_vruntime
   2896475 =C2=B1 2%    +154.3%    7366784 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[23]:/.min_vruntime
   2911824 =C2=B1 1%    +151.7%    7327805 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[1]:/.min_vruntime
   2966470 =C2=B1 1%    +147.9%    7354082 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[29]:/.min_vruntime
   2884101 =C2=B1 0%    +150.3%    7219627 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[14]:/.min_vruntime
   2925842 =C2=B1 1%    +151.9%    7369360 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[31]:/.min_vruntime
   2902721 =C2=B1 1%    +152.7%    7334172 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[21]:/.min_vruntime
   2924791 =C2=B1 2%    +150.8%    7336302 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[26]:/.min_vruntime
        11 =C2=B126%    +154.2%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#57.cpu_load[3]
   2910713 =C2=B1 1%    +151.6%    7322791 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[3]:/.min_vruntime
   2952231 =C2=B1 2%    +149.6%    7369935 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[27]:/.min_vruntime
      1327 =C2=B142%    +219.3%       4239 =C2=B1 0%  TOTAL sched_debug.cpu=
#40.curr->pid
   2975600 =C2=B1 0%    +146.9%    7348061 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[28]:/.min_vruntime
   2927020 =C2=B1 2%    +150.3%    7326407 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[5]:/.min_vruntime
   2937147 =C2=B1 0%    +148.1%    7287431 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[7]:/.min_vruntime
        12 =C2=B116%    +151.6%         32 =C2=B112%  TOTAL sched_debug.cpu=
#49.cpu_load[0]
   2972203 =C2=B1 1%    +146.7%    7331240 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[30]:/.min_vruntime
   2917430 =C2=B1 1%    +149.9%    7291729 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[4]:/.min_vruntime
         9 =C2=B119%    +177.6%         27 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[60]:/.runnable_load_avg
   2903992 =C2=B1 2%    +150.8%    7282050 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[6]:/.min_vruntime
        37 =C2=B131%    +113.3%         80 =C2=B123%  TOTAL sched_debug.cfs=
_rq[29]:/.tg_load_contrib
    230273 =C2=B117%     -51.7%     111201 =C2=B132%  TOTAL sched_debug.cpu=
#50.avg_idle
      0.70 =C2=B1 1%    +140.3%       1.68 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.get_page_from_freelist.__alloc_pages_nodemask.kmalloc_large_node._=
_kmalloc_node_track_caller.__kmalloc_reserve
    206691 =C2=B115%     -57.8%      87201 =C2=B1 8%  TOTAL sched_debug.cpu=
#61.avg_idle
    259396 =C2=B1 5%    +122.7%     577766 =C2=B1 1%  TOTAL sched_debug.cpu=
#62.ttwu_count
        12 =C2=B134%    +134.9%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#57.cpu_load[2]
    269666 =C2=B116%     -57.7%     114191 =C2=B117%  TOTAL sched_debug.cpu=
#36.avg_idle
        14 =C2=B136%    +119.7%         31 =C2=B1 5%  TOTAL sched_debug.cpu=
#33.cpu_load[2]
      1706 =C2=B116%    +149.8%       4262 =C2=B1 0%  TOTAL sched_debug.cpu=
#38.curr->pid
    242840 =C2=B1 4%     -54.8%     109685 =C2=B127%  TOTAL sched_debug.cpu=
#45.avg_idle
    262430 =C2=B1 5%    +120.6%     578956 =C2=B1 1%  TOTAL sched_debug.cpu=
#60.ttwu_count
    139692 =C2=B1 4%     -54.6%      63480 =C2=B1 2%  TOTAL proc-vmstat.num=
a_hint_faults
        12 =C2=B119%    +148.4%         31 =C2=B1 9%  TOTAL sched_debug.cpu=
#41.cpu_load[3]
    264847 =C2=B1 9%    +116.3%     572756 =C2=B1 2%  TOTAL sched_debug.cpu=
#61.ttwu_count
      0.50 =C2=B1 7%    +122.0%       1.11 =C2=B112%  TOTAL perf-profile.cp=
u-cycles.sctp_sendmsg.inet_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sendmsg
        30 =C2=B112%    +115.3%         64 =C2=B146%  TOTAL sched_debug.cfs=
_rq[19]:/.tg_load_contrib
        11 =C2=B128%    +139.0%         28 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[42]:/.runnable_load_avg
    263882 =C2=B1 5%    +119.9%     580288 =C2=B1 1%  TOTAL sched_debug.cpu=
#59.ttwu_count
        15 =C2=B141%    +105.3%         30 =C2=B1 7%  TOTAL sched_debug.cpu=
#33.cpu_load[1]
        15 =C2=B141%     +97.5%         31 =C2=B110%  TOTAL sched_debug.cpu=
#33.cpu_load[0]
    232649 =C2=B1 8%     -53.9%     107165 =C2=B1 9%  TOTAL sched_debug.cpu=
#37.avg_idle
      1870 =C2=B119%    +126.4%       4234 =C2=B1 0%  TOTAL sched_debug.cpu=
#42.curr->pid
    276936 =C2=B1 2%    +110.2%     582259 =C2=B1 1%  TOTAL sched_debug.cpu=
#32.ttwu_count
        32 =C2=B113%    +116.7%         70 =C2=B131%  TOTAL sched_debug.cfs=
_rq[24]:/.tg_load_contrib
      3.48 =C2=B1 0%    +111.1%       7.35 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.skb_copy_datagram_iovec.sctp_recvmsg.sock=
_common_recvmsg.sock_recvmsg
    276884 =C2=B1 2%    +111.1%     584406 =C2=B1 1%  TOTAL sched_debug.cpu=
#33.ttwu_count
    278248 =C2=B1 4%    +107.0%     575968 =C2=B1 2%  TOTAL sched_debug.cpu=
#55.ttwu_count
    276813 =C2=B1 5%    +109.4%     579782 =C2=B1 1%  TOTAL sched_debug.cpu=
#51.ttwu_count
    274908 =C2=B1 2%    +110.4%     578527 =C2=B1 1%  TOTAL sched_debug.cpu=
#52.ttwu_count
    276883 =C2=B1 5%    +108.8%     578248 =C2=B1 1%  TOTAL sched_debug.cpu=
#53.ttwu_count
        13 =C2=B148%    +127.3%         30 =C2=B1 8%  TOTAL sched_debug.cpu=
#57.cpu_load[0]
        12 =C2=B142%    +130.2%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#57.cpu_load[1]
        12 =C2=B147%    +159.0%         31 =C2=B113%  TOTAL sched_debug.cfs=
_rq[41]:/.runnable_load_avg
     96427 =C2=B1 3%     -51.4%      46839 =C2=B1 0%  TOTAL proc-vmstat.num=
a_hint_faults_local
        14 =C2=B123%    +113.5%         31 =C2=B111%  TOTAL sched_debug.cpu=
#41.cpu_load[2]
    281119 =C2=B1 3%    +105.5%     577638 =C2=B1 1%  TOTAL sched_debug.cpu=
#63.ttwu_count
    279804 =C2=B1 7%    +105.6%     575372 =C2=B1 1%  TOTAL sched_debug.cpu=
#54.ttwu_count
    285799 =C2=B1 3%    +104.0%     583075 =C2=B1 1%  TOTAL sched_debug.cpu=
#39.ttwu_count
    291642 =C2=B121%     -55.2%     130660 =C2=B118%  TOTAL sched_debug.cpu=
#40.avg_idle
       140 =C2=B131%     -57.1%         60 =C2=B144%  TOTAL sched_debug.cfs=
_rq[43]:/.tg_load_contrib
     13879 =C2=B1 0%    +104.3%      28362 =C2=B1 0%  TOTAL proc-vmstat.pga=
ctivate
    251355 =C2=B127%     -49.9%     126023 =C2=B133%  TOTAL sched_debug.cpu=
#42.avg_idle
    284829 =C2=B1 5%    +104.2%     581719 =C2=B1 1%  TOTAL sched_debug.cpu=
#36.ttwu_count
    287754 =C2=B1 5%    +101.5%     579892 =C2=B1 1%  TOTAL sched_debug.cpu=
#57.ttwu_count
    290676 =C2=B1 4%     +98.4%     576782 =C2=B1 1%  TOTAL sched_debug.cpu=
#50.ttwu_count
        15 =C2=B134%     +92.4%         30 =C2=B111%  TOTAL sched_debug.cfs=
_rq[33]:/.runnable_load_avg
        28 =C2=B112%    +100.7%         57 =C2=B130%  TOTAL sched_debug.cfs=
_rq[31]:/.tg_load_contrib
    287909 =C2=B1 4%    +101.5%     580220 =C2=B1 0%  TOTAL sched_debug.cpu=
#56.ttwu_count
    281438 =C2=B1 6%    +105.0%     576839 =C2=B1 1%  TOTAL sched_debug.cpu=
#58.ttwu_count
    223246 =C2=B122%     -59.3%      90847 =C2=B116%  TOTAL sched_debug.cpu=
#57.avg_idle
    292834 =C2=B1 2%     +98.9%     582416 =C2=B1 1%  TOTAL sched_debug.cpu=
#35.ttwu_count
    299007 =C2=B1 1%     +93.8%     579492 =C2=B1 1%  TOTAL sched_debug.cpu=
#49.ttwu_count
    296051 =C2=B1 3%     +96.4%     581581 =C2=B1 0%  TOTAL sched_debug.cpu=
#37.ttwu_count
    155938 =C2=B1 3%     -48.9%      79614 =C2=B1 2%  TOTAL proc-vmstat.num=
a_pte_updates
    292818 =C2=B1 4%     +99.2%     583153 =C2=B1 1%  TOTAL sched_debug.cpu=
#34.ttwu_count
    291339 =C2=B1 3%     +97.8%     576203 =C2=B1 1%  TOTAL sched_debug.cpu=
#46.ttwu_count
   1173228 =C2=B119%     -48.8%     601063 =C2=B1 1%  TOTAL sched_debug.cpu=
#8.sched_count
    291043 =C2=B1 6%     +98.2%     576756 =C2=B1 1%  TOTAL sched_debug.cpu=
#48.ttwu_count
     32644 =C2=B1 0%     +92.8%      62936 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[0]:/.tg->runnable_avg
     32648 =C2=B1 0%     +92.8%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[1]:/.tg->runnable_avg
     32650 =C2=B1 0%     +92.8%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[2]:/.tg->runnable_avg
     32654 =C2=B1 0%     +92.7%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[3]:/.tg->runnable_avg
     32665 =C2=B1 0%     +92.7%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[4]:/.tg->runnable_avg
     32674 =C2=B1 0%     +92.6%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[5]:/.tg->runnable_avg
     32689 =C2=B1 0%     +92.5%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[8]:/.tg->runnable_avg
     32678 =C2=B1 0%     +92.6%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[6]:/.tg->runnable_avg
     32690 =C2=B1 0%     +92.5%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[10]:/.tg->runnable_avg
     32691 =C2=B1 0%     +92.5%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[9]:/.tg->runnable_avg
     32686 =C2=B1 0%     +92.6%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[7]:/.tg->runnable_avg
     32692 =C2=B1 0%     +92.5%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[11]:/.tg->runnable_avg
     32696 =C2=B1 0%     +92.5%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[12]:/.tg->runnable_avg
     32701 =C2=B1 0%     +92.5%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[13]:/.tg->runnable_avg
     32704 =C2=B1 0%     +92.4%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[14]:/.tg->runnable_avg
     32702 =C2=B1 0%     +92.5%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[15]:/.tg->runnable_avg
     32717 =C2=B1 0%     +92.4%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[18]:/.tg->runnable_avg
     32707 =C2=B1 0%     +92.4%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[16]:/.tg->runnable_avg
     32713 =C2=B1 0%     +92.4%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[17]:/.tg->runnable_avg
     32722 =C2=B1 0%     +92.3%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[19]:/.tg->runnable_avg
     32727 =C2=B1 0%     +92.3%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[20]:/.tg->runnable_avg
     32732 =C2=B1 0%     +92.3%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[21]:/.tg->runnable_avg
     32740 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[24]:/.tg->runnable_avg
     32739 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[23]:/.tg->runnable_avg
     32743 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[26]:/.tg->runnable_avg
     32739 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[22]:/.tg->runnable_avg
     32743 =C2=B1 0%     +92.2%      62937 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[27]:/.tg->runnable_avg
     32746 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[25]:/.tg->runnable_avg
     32751 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[29]:/.tg->runnable_avg
     32751 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[30]:/.tg->runnable_avg
     32747 =C2=B1 0%     +92.2%      62938 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[28]:/.tg->runnable_avg
     32752 =C2=B1 0%     +92.2%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[31]:/.tg->runnable_avg
     32752 =C2=B1 0%     +92.2%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[32]:/.tg->runnable_avg
     32759 =C2=B1 0%     +92.1%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[33]:/.tg->runnable_avg
     32770 =C2=B1 0%     +92.1%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[37]:/.tg->runnable_avg
     32757 =C2=B1 0%     +92.1%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[34]:/.tg->runnable_avg
     32766 =C2=B1 0%     +92.1%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[36]:/.tg->runnable_avg
     32765 =C2=B1 0%     +92.1%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[35]:/.tg->runnable_avg
     32767 =C2=B1 0%     +92.1%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[38]:/.tg->runnable_avg
     32774 =C2=B1 0%     +92.0%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[41]:/.tg->runnable_avg
     32775 =C2=B1 0%     +92.0%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[42]:/.tg->runnable_avg
     32774 =C2=B1 0%     +92.0%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[39]:/.tg->runnable_avg
     32779 =C2=B1 0%     +92.0%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[43]:/.tg->runnable_avg
     32773 =C2=B1 0%     +92.0%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[40]:/.tg->runnable_avg
     32822 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[63]:/.tg->runnable_avg
     32820 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[62]:/.tg->runnable_avg
     32793 =C2=B1 0%     +91.9%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[47]:/.tg->runnable_avg
     32796 =C2=B1 0%     +91.9%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[48]:/.tg->runnable_avg
     32818 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[61]:/.tg->runnable_avg
     32821 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[60]:/.tg->runnable_avg
     32790 =C2=B1 0%     +91.9%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[44]:/.tg->runnable_avg
     32791 =C2=B1 0%     +91.9%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[46]:/.tg->runnable_avg
     32819 =C2=B1 0%     +91.8%      62941 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[59]:/.tg->runnable_avg
     32793 =C2=B1 0%     +91.9%      62939 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[45]:/.tg->runnable_avg
     32812 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[56]:/.tg->runnable_avg
     32817 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[57]:/.tg->runnable_avg
     32809 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[52]:/.tg->runnable_avg
     32811 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[55]:/.tg->runnable_avg
     32801 =C2=B1 0%     +91.9%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[49]:/.tg->runnable_avg
     32822 =C2=B1 0%     +91.8%      62941 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[58]:/.tg->runnable_avg
     32808 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[54]:/.tg->runnable_avg
     32812 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[53]:/.tg->runnable_avg
     32809 =C2=B1 0%     +91.8%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[51]:/.tg->runnable_avg
     32804 =C2=B1 0%     +91.9%      62940 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[50]:/.tg->runnable_avg
    309179 =C2=B1 2%     +87.8%     580793 =C2=B1 1%  TOTAL sched_debug.cpu=
#41.ttwu_count
        81 =C2=B144%     -62.2%         30 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[62]:/.tg_load_contrib
   5254994 =C2=B1 0%     +89.6%    9963624 =C2=B1 0%  TOTAL softirqs.TIMER
      3.69 =C2=B1 1%     +86.0%       6.87 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.memcpy.sctp_outq_flush.sctp_outq_uncork.sctp_cmd_interpreter.sctp_=
do_sm
    308199 =C2=B1 4%     +86.7%     575358 =C2=B1 1%  TOTAL sched_debug.cpu=
#42.ttwu_count
    305544 =C2=B1 4%     +90.6%     582390 =C2=B1 1%  TOTAL sched_debug.cpu=
#38.ttwu_count
    309614 =C2=B1 1%     +86.5%     577365 =C2=B1 1%  TOTAL sched_debug.cpu=
#43.ttwu_count
        14 =C2=B133%     +98.6%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#35.load
    309719 =C2=B1 5%     +85.8%     575506 =C2=B1 1%  TOTAL sched_debug.cpu=
#45.ttwu_count
   1081161 =C2=B1 1%     -46.1%     582374 =C2=B1 1%  TOTAL sched_debug.cpu=
#29.ttwu_count
    316152 =C2=B1 3%     +82.7%     577646 =C2=B1 1%  TOTAL sched_debug.cpu=
#40.ttwu_count
        27 =C2=B1 8%    +107.9%         57 =C2=B149%  TOTAL sched_debug.cfs=
_rq[9]:/.tg_load_contrib
   1083438 =C2=B1 0%     -45.9%     586638 =C2=B1 0%  TOTAL sched_debug.cpu=
#7.ttwu_count
    315864 =C2=B1 5%     +82.6%     576755 =C2=B1 1%  TOTAL sched_debug.cpu=
#47.ttwu_count
        31 =C2=B1 7%     +69.2%         52 =C2=B136%  TOTAL sched_debug.cfs=
_rq[13]:/.tg_load_contrib
   1084154 =C2=B1 1%     -45.7%     588437 =C2=B1 1%  TOTAL sched_debug.cpu=
#30.ttwu_count
    311962 =C2=B1 5%     +84.9%     576905 =C2=B1 1%  TOTAL sched_debug.cpu=
#44.ttwu_count
   1060523 =C2=B1 1%     -45.1%     582533 =C2=B1 1%  TOTAL sched_debug.cpu=
#21.ttwu_count
   1054699 =C2=B1 1%     -45.1%     579000 =C2=B1 1%  TOTAL sched_debug.cpu=
#14.ttwu_count
        17 =C2=B122%     +70.8%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#8.cpu_load[4]
        15 =C2=B126%    +103.9%         31 =C2=B112%  TOTAL sched_debug.cpu=
#41.cpu_load[1]
        28 =C2=B1 4%     +85.4%         53 =C2=B138%  TOTAL sched_debug.cfs=
_rq[30]:/.tg_load_contrib
   1075268 =C2=B1 1%     -45.5%     586405 =C2=B1 1%  TOTAL sched_debug.cpu=
#28.ttwu_count
   1059908 =C2=B1 2%     -44.9%     584032 =C2=B1 1%  TOTAL sched_debug.cpu=
#31.ttwu_count
   1068780 =C2=B1 1%     -45.5%     582915 =C2=B1 1%  TOTAL sched_debug.cpu=
#27.ttwu_count
   1068310 =C2=B1 0%     -44.9%     588354 =C2=B1 1%  TOTAL sched_debug.cpu=
#5.ttwu_count
   1055705 =C2=B1 2%     -45.0%     580123 =C2=B1 2%  TOTAL sched_debug.cpu=
#23.ttwu_count
   1054570 =C2=B1 1%     -44.7%     583394 =C2=B1 1%  TOTAL sched_debug.cpu=
#20.ttwu_count
    254366 =C2=B143%     -59.3%     103437 =C2=B113%  TOTAL sched_debug.cpu=
#54.avg_idle
   1063589 =C2=B1 2%     -44.7%     587718 =C2=B1 1%  TOTAL sched_debug.cpu=
#6.ttwu_count
   1058139 =C2=B1 3%     -44.6%     585929 =C2=B1 1%  TOTAL sched_debug.cpu=
#22.ttwu_count
   1067145 =C2=B1 1%     -44.9%     588220 =C2=B1 1%  TOTAL sched_debug.cpu=
#4.ttwu_count
   1057669 =C2=B1 0%     -44.3%     588982 =C2=B1 1%  TOTAL sched_debug.cpu=
#1.ttwu_count
   1059310 =C2=B1 1%     -44.3%     589806 =C2=B1 1%  TOTAL sched_debug.cpu=
#3.ttwu_count
   1043843 =C2=B1 1%     -44.2%     581948 =C2=B1 1%  TOTAL sched_debug.cpu=
#18.ttwu_count
   1031973 =C2=B1 1%     -43.9%     579237 =C2=B1 1%  TOTAL sched_debug.cpu=
#11.ttwu_count
        18 =C2=B124%     +70.7%         31 =C2=B113%  TOTAL sched_debug.cpu=
#41.cpu_load[0]
   1047788 =C2=B1 2%     -44.3%     583196 =C2=B1 1%  TOTAL sched_debug.cpu=
#19.ttwu_count
   1044163 =C2=B1 2%     -44.2%     583017 =C2=B1 1%  TOTAL sched_debug.cpu=
#26.ttwu_count
   1288766 =C2=B138%     -52.8%     608462 =C2=B1 1%  TOTAL sched_debug.cpu=
#1.sched_count
   1032898 =C2=B1 1%     -43.8%     579984 =C2=B1 1%  TOTAL sched_debug.cpu=
#13.ttwu_count
   1049631 =C2=B1 1%     -43.7%     590788 =C2=B1 0%  TOTAL sched_debug.cpu=
#2.ttwu_count
   1034514 =C2=B1 1%     -43.7%     582699 =C2=B1 1%  TOTAL sched_debug.cpu=
#15.ttwu_count
        16 =C2=B120%     +75.0%         29 =C2=B1 4%  TOTAL sched_debug.cpu=
#9.cpu_load[0]
   1023516 =C2=B1 1%     -43.1%     582541 =C2=B1 1%  TOTAL sched_debug.cpu=
#17.ttwu_count
   1039799 =C2=B1 3%     -44.3%     579547 =C2=B1 2%  TOTAL sched_debug.cpu=
#25.ttwu_count
   1302779 =C2=B136%     -54.0%     598642 =C2=B1 1%  TOTAL sched_debug.cpu=
#9.sched_count
   1012139 =C2=B1 0%     -42.5%     581867 =C2=B1 1%  TOTAL sched_debug.cpu=
#9.ttwu_count
   1032088 =C2=B1 2%     -43.7%     581367 =C2=B1 1%  TOTAL sched_debug.cpu=
#12.ttwu_count
   1015497 =C2=B1 1%     -42.6%     582939 =C2=B1 1%  TOTAL sched_debug.cpu=
#16.ttwu_count
   1023139 =C2=B1 1%     -43.1%     582533 =C2=B1 1%  TOTAL sched_debug.cpu=
#10.ttwu_count
   1039034 =C2=B1 1%     -42.7%     595606 =C2=B1 1%  TOTAL sched_debug.cpu=
#0.ttwu_count
   1125131 =C2=B122%     -46.7%     600109 =C2=B1 2%  TOTAL sched_debug.cpu=
#12.sched_count
      9019 =C2=B1 6%     -42.0%       5232 =C2=B110%  TOTAL proc-vmstat.pgm=
igrate_success
      9019 =C2=B1 6%     -42.0%       5232 =C2=B110%  TOTAL proc-vmstat.num=
a_pages_migrated
   1020221 =C2=B1 2%     -42.6%     586085 =C2=B1 1%  TOTAL sched_debug.cpu=
#24.ttwu_count
        18 =C2=B1 9%     +69.2%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#9.cpu_load[4]
        19 =C2=B114%     +84.8%         36 =C2=B134%  TOTAL sched_debug.cfs=
_rq[38]:/.load
        30 =C2=B112%     +56.7%         47 =C2=B118%  TOTAL sched_debug.cfs=
_rq[25]:/.tg_load_contrib
        17 =C2=B113%     +62.5%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#1.cpu_load[0]
        17 =C2=B115%     +64.4%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#22.cpu_load[3]
        19 =C2=B116%     +52.1%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#25.cpu_load[3]
    991690 =C2=B1 0%     -41.2%     582981 =C2=B1 1%  TOTAL sched_debug.cpu=
#8.ttwu_count
        18 =C2=B112%     +60.2%         29 =C2=B1 4%  TOTAL sched_debug.cpu=
#15.cpu_load[4]
        18 =C2=B122%     +66.7%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#8.cpu_load[3]
        17 =C2=B111%     +72.4%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#9.cpu_load[3]
        21 =C2=B126%     +70.5%         35 =C2=B138%  TOTAL sched_debug.cpu=
#61.load
        19 =C2=B125%     +56.8%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#43.load
        18 =C2=B116%     +52.7%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#30.cpu_load[2]
        18 =C2=B118%     +56.0%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#26.cpu_load[4]
        17 =C2=B117%     +59.1%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#22.cpu_load[1]
        17 =C2=B1 4%     +58.0%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#3.cpu_load[0]
        17 =C2=B116%     +55.1%         27 =C2=B1 3%  TOTAL sched_debug.cpu=
#22.cpu_load[0]
        18 =C2=B119%     +56.7%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#26.cpu_load[3]
        17 =C2=B117%     +64.0%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#22.cpu_load[2]
      2664 =C2=B115%     +63.7%       4362 =C2=B1 1%  TOTAL sched_debug.cpu=
#20.curr->pid
        19 =C2=B114%     +56.6%         31 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[45]:/.load
        71 =C2=B143%     -52.1%         34 =C2=B113%  TOTAL sched_debug.cfs=
_rq[47]:/.tg_load_contrib
     13306 =C2=B1 0%     +61.5%      21495 =C2=B1 0%  TOTAL proc-vmstat.nr_=
shmem
     53249 =C2=B1 0%     +61.5%      85996 =C2=B1 0%  TOTAL meminfo.Shmem
        18 =C2=B1 8%     +58.7%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#11.cpu_load[3]
        18 =C2=B112%     +57.1%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#30.cpu_load[3]
        17 =C2=B122%     +65.2%         29 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[9]:/.runnable_load_avg
        19 =C2=B1 6%     +54.7%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#23.cpu_load[4]
        17 =C2=B115%     +69.8%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#9.cpu_load[2]
        18 =C2=B1 7%     +59.1%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#11.cpu_load[4]
        17 =C2=B117%     +70.6%         29 =C2=B1 4%  TOTAL sched_debug.cpu=
#9.cpu_load[1]
        18 =C2=B1 8%     +55.4%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#1.cpu_load[1]
        18 =C2=B1 7%     +55.3%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#1.cpu_load[2]
        19 =C2=B114%     +54.7%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#25.cpu_load[4]
        17 =C2=B114%     +65.5%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#22.cpu_load[4]
        18 =C2=B1 9%     +53.8%         28 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[13]:/.runnable_load_avg
        19 =C2=B111%     +54.7%         29 =C2=B1 5%  TOTAL sched_debug.cpu=
#15.cpu_load[3]
        18 =C2=B112%     +55.4%         28 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[23]:/.runnable_load_avg
        18 =C2=B1 2%     +57.1%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#3.cpu_load[3]
        18 =C2=B1 2%     +60.4%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#3.cpu_load[4]
        17 =C2=B1 2%     +60.7%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#3.cpu_load[2]
      2777 =C2=B110%     +60.7%       4463 =C2=B1 7%  TOTAL sched_debug.cpu=
#27.curr->pid
      2744 =C2=B113%     +58.3%       4342 =C2=B1 3%  TOTAL sched_debug.cpu=
#22.curr->pid
    988578 =C2=B110%     -38.9%     604501 =C2=B1 1%  TOTAL sched_debug.cpu=
#24.sched_count
   1083808 =C2=B131%     -42.7%     621044 =C2=B1 7%  TOTAL sched_debug.cpu=
#6.sched_count
        19 =C2=B112%     +53.1%         29 =C2=B1 4%  TOTAL sched_debug.cpu=
#19.cpu_load[3]
        19 =C2=B113%     +53.6%         29 =C2=B1 4%  TOTAL sched_debug.cpu=
#19.cpu_load[4]
    966177 =C2=B124%     -37.8%     600790 =C2=B1 2%  TOTAL sched_debug.cpu=
#27.sched_count
   1146030 =C2=B146%     -46.9%     608122 =C2=B1 1%  TOTAL sched_debug.cpu=
#2.sched_count
        18 =C2=B1 3%     +55.6%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#3.cpu_load[1]
        19 =C2=B119%     +41.4%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#5.cpu_load[0]
        17 =C2=B1 9%     +58.4%         28 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[3]:/.runnable_load_avg
        18 =C2=B119%     +52.2%         28 =C2=B1 5%  TOTAL sched_debug.cpu=
#26.cpu_load[2]
        18 =C2=B117%     +50.5%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#30.cpu_load[0]
        18 =C2=B117%     +50.5%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#30.cpu_load[1]
        19 =C2=B111%     +49.0%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#15.cpu_load[2]
        18 =C2=B112%     +56.7%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#13.cpu_load[0]
        20 =C2=B113%     +38.0%         27 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[31]:/.runnable_load_avg
        20 =C2=B118%     +40.0%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#5.cpu_load[1]
        18 =C2=B122%     +56.5%         28 =C2=B1 5%  TOTAL sched_debug.cpu=
#8.cpu_load[0]
        19 =C2=B116%     +49.0%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#25.cpu_load[2]
   1040164 =C2=B127%     -37.2%     653364 =C2=B110%  TOTAL sched_debug.cpu=
#19.sched_count
        80 =C2=B129%     -45.9%         43 =C2=B126%  TOTAL sched_debug.cfs=
_rq[37]:/.tg_load_contrib
      2953 =C2=B110%     +47.1%       4345 =C2=B1 2%  TOTAL sched_debug.cpu=
#14.curr->pid
    923395 =C2=B1 6%     -24.6%     695896 =C2=B117%  TOTAL sched_debug.cpu=
#21.sched_count
      2800 =C2=B1 5%     +52.5%       4269 =C2=B1 1%  TOTAL sched_debug.cpu=
#11.curr->pid
      2746 =C2=B115%     +57.0%       4312 =C2=B1 2%  TOTAL sched_debug.cpu=
#8.curr->pid
        20 =C2=B112%     +44.1%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#5.cpu_load[4]
        18 =C2=B113%     +58.1%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#13.cpu_load[2]
        18 =C2=B1 7%     +54.8%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#11.cpu_load[1]
        18 =C2=B113%     +56.5%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#13.cpu_load[1]
        18 =C2=B122%     +60.9%         29 =C2=B1 5%  TOTAL sched_debug.cpu=
#8.cpu_load[2]
        19 =C2=B1 6%     +47.9%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#7.cpu_load[2]
        19 =C2=B112%     +51.6%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#11.cpu_load[0]
        18 =C2=B112%     +58.7%         29 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[11]:/.runnable_load_avg
        18 =C2=B111%     +62.6%         29 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[1]:/.runnable_load_avg
        19 =C2=B1 5%     +50.5%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#23.cpu_load[3]
        19 =C2=B121%     +48.0%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#27.cpu_load[4]
        18 =C2=B112%     +57.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#30.cpu_load[4]
        18 =C2=B1 7%     +53.2%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#11.cpu_load[2]
        19 =C2=B1 4%     +58.9%         30 =C2=B1 9%  TOTAL sched_debug.cfs=
_rq[2]:/.runnable_load_avg
   1101084 =C2=B130%     -44.5%     611225 =C2=B1 2%  TOTAL sched_debug.cpu=
#4.sched_count
      2942 =C2=B110%     +44.9%       4263 =C2=B1 2%  TOTAL sched_debug.cpu=
#7.curr->pid
      2905 =C2=B1 7%     +53.9%       4471 =C2=B1 2%  TOTAL sched_debug.cpu=
#23.curr->pid
   1035532 =C2=B119%     -41.9%     601372 =C2=B1 1%  TOTAL sched_debug.cpu=
#15.sched_count
       663 =C2=B1 7%     +48.7%        987 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[8]:/.tg_runnable_contrib
     30382 =C2=B1 7%     +49.0%      45275 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[8]:/.avg->runnable_avg_sum
     30719 =C2=B1 7%     +46.5%      44998 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[15]:/.avg->runnable_avg_sum
       671 =C2=B1 7%     +45.8%        979 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[15]:/.tg_runnable_contrib
        20 =C2=B1 9%     +46.1%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#18.cpu_load[4]
        20 =C2=B1 6%     +45.6%         30 =C2=B1 4%  TOTAL sched_debug.cpu=
#1.cpu_load[4]
        19 =C2=B1 9%     +52.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#14.cpu_load[4]
        19 =C2=B110%     +57.3%         30 =C2=B1 2%  TOTAL sched_debug.cpu=
#13.cpu_load[4]
        19 =C2=B112%     +55.2%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#13.cpu_load[3]
        20 =C2=B113%     +35.6%         27 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[22]:/.runnable_load_avg
        19 =C2=B111%     +43.8%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[5]:/.runnable_load_avg
        19 =C2=B113%     +42.7%         27 =C2=B1 3%  TOTAL sched_debug.cpu=
#31.cpu_load[0]
      1045 =C2=B1 1%     +52.1%       1589 =C2=B1 7%  TOTAL numa-vmstat.nod=
e0.nr_alloc_batch
    737654 =C2=B1 1%     +50.3%    1108371 =C2=B1 0%  TOTAL softirqs.RCU
      2824 =C2=B115%     +54.7%       4370 =C2=B1 1%  TOTAL sched_debug.cpu=
#31.curr->pid
      2900 =C2=B1 3%     +48.4%       4303 =C2=B1 1%  TOTAL sched_debug.cpu=
#17.curr->pid
      1117 =C2=B1 2%     +42.8%       1595 =C2=B1 6%  TOTAL numa-vmstat.nod=
e3.nr_alloc_batch
     31475 =C2=B1 6%     +43.6%      45205 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[26]:/.avg->runnable_avg_sum
      2819 =C2=B113%     +51.7%       4276 =C2=B1 2%  TOTAL sched_debug.cpu=
#26.curr->pid
     31215 =C2=B1 4%     +44.3%      45055 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[30]:/.avg->runnable_avg_sum
     30904 =C2=B1 4%     +46.4%      45232 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[10]:/.avg->runnable_avg_sum
       675 =C2=B1 4%     +45.9%        985 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[10]:/.tg_runnable_contrib
       687 =C2=B1 6%     +42.7%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[26]:/.tg_runnable_contrib
        19 =C2=B1 3%     +47.9%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#4.cpu_load[1]
        21 =C2=B118%     +32.1%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#31.cpu_load[2]
        19 =C2=B112%     +44.9%         28 =C2=B1 5%  TOTAL sched_debug.cpu=
#15.cpu_load[1]
        18 =C2=B121%     +57.6%         29 =C2=B1 6%  TOTAL sched_debug.cpu=
#8.cpu_load[1]
        19 =C2=B117%     +47.4%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#25.cpu_load[0]
        19 =C2=B1 3%     +49.0%         28 =C2=B1 6%  TOTAL sched_debug.cpu=
#4.cpu_load[0]
        20 =C2=B113%     +42.0%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#5.cpu_load[3]
        20 =C2=B110%     +41.0%         28 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[15]:/.runnable_load_avg
        19 =C2=B1 4%     +45.9%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#4.cpu_load[2]
        19 =C2=B1 7%     +47.4%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#23.cpu_load[2]
        18 =C2=B1 3%     +47.9%         27 =C2=B1 3%  TOTAL sched_debug.cpu=
#7.cpu_load[0]
        19 =C2=B113%     +46.9%         28 =C2=B1 6%  TOTAL sched_debug.cpu=
#15.cpu_load[0]
        19 =C2=B1 8%     +44.8%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#23.cpu_load[1]
        19 =C2=B116%     +45.4%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#25.cpu_load[1]
        19 =C2=B111%     +40.8%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#23.cpu_load[0]
        20 =C2=B114%     +39.6%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#5.cpu_load[2]
        19 =C2=B114%     +41.4%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#31.cpu_load[1]
        19 =C2=B1 6%     +45.8%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#7.cpu_load[1]
        20 =C2=B113%     +40.6%         28 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[25]:/.runnable_load_avg
      2943 =C2=B1 8%     +45.8%       4289 =C2=B1 0%  TOTAL sched_debug.cpu=
#1.curr->pid
      2703 =C2=B111%     +59.2%       4302 =C2=B1 1%  TOTAL sched_debug.cpu=
#4.curr->pid
      2989 =C2=B113%     +42.7%       4265 =C2=B1 2%  TOTAL sched_debug.cpu=
#24.curr->pid
      3048 =C2=B1 8%     +42.7%       4349 =C2=B1 1%  TOTAL sched_debug.cpu=
#3.curr->pid
     30576 =C2=B1 6%     +47.4%      45060 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[22]:/.avg->runnable_avg_sum
       682 =C2=B1 4%     +43.6%        979 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[30]:/.tg_runnable_contrib
      1100 =C2=B1 3%     +49.4%       1643 =C2=B1 4%  TOTAL numa-vmstat.nod=
e1.nr_alloc_batch
      4389 =C2=B1 1%     +46.7%       6439 =C2=B1 1%  TOTAL proc-vmstat.nr_=
alloc_batch
       668 =C2=B1 6%     +46.9%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[22]:/.tg_runnable_contrib
      3115 =C2=B1 9%     +38.4%       4310 =C2=B1 1%  TOTAL sched_debug.cpu=
#5.curr->pid
       695 =C2=B1 4%     +41.8%        985 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[18]:/.tg_runnable_contrib
     31812 =C2=B1 4%     +42.5%      45324 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[18]:/.avg->runnable_avg_sum
      1157 =C2=B1 4%     +40.2%       1622 =C2=B1 7%  TOTAL numa-vmstat.nod=
e2.nr_alloc_batch
        19 =C2=B1 6%     +51.6%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#7.cpu_load[3]
        19 =C2=B1 6%     +51.5%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#2.cpu_load[4]
        19 =C2=B1 6%     +53.7%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#7.cpu_load[4]
        19 =C2=B113%     +51.0%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#19.cpu_load[2]
        19 =C2=B110%     +49.5%         29 =C2=B1 4%  TOTAL sched_debug.cpu=
#2.cpu_load[2]
        19 =C2=B113%     +50.0%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#19.cpu_load[1]
        19 =C2=B1 6%     +49.5%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#2.cpu_load[3]
        20 =C2=B1 8%     +45.5%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#18.cpu_load[3]
        19 =C2=B1 5%     +51.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#20.cpu_load[4]
        20 =C2=B1 7%     +41.2%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#18.cpu_load[2]
        20 =C2=B1 7%     +47.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#4.cpu_load[4]
        20 =C2=B1 5%     +45.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#4.cpu_load[3]
        19 =C2=B116%     +50.5%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#27.cpu_load[3]
        19 =C2=B112%     +44.9%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#16.cpu_load[0]
        19 =C2=B1 5%     +48.5%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#1.cpu_load[3]
        19 =C2=B1 6%     +50.0%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#20.cpu_load[3]
      2924 =C2=B110%     +48.1%       4330 =C2=B1 2%  TOTAL sched_debug.cpu=
#13.curr->pid
      2942 =C2=B1 7%     +45.9%       4291 =C2=B1 2%  TOTAL sched_debug.cpu=
#15.curr->pid
      2957 =C2=B1 5%     +44.4%       4269 =C2=B1 1%  TOTAL sched_debug.cpu=
#9.curr->pid
      2930 =C2=B112%     +47.6%       4326 =C2=B1 3%  TOTAL sched_debug.cpu=
#16.curr->pid
       684 =C2=B1 7%     +44.1%        986 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[27]:/.tg_runnable_contrib
     32158 =C2=B1 4%     +40.1%      45057 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[24]:/.avg->runnable_avg_sum
      2949 =C2=B1 9%     +46.3%       4315 =C2=B1 2%  TOTAL sched_debug.cpu=
#19.curr->pid
        20 =C2=B1 9%     +46.5%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#16.cpu_load[4]
        19 =C2=B114%     +51.0%         29 =C2=B1 5%  TOTAL sched_debug.cpu=
#19.cpu_load[0]
     31356 =C2=B1 7%     +43.8%      45098 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[27]:/.avg->runnable_avg_sum
     33090 =C2=B1 7%     +36.2%      45061 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[29]:/.avg->runnable_avg_sum
       721 =C2=B1 7%     +35.7%        979 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[29]:/.tg_runnable_contrib
     31372 =C2=B1 5%     +43.7%      45081 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[11]:/.avg->runnable_avg_sum
       701 =C2=B1 4%     +39.8%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[24]:/.tg_runnable_contrib
      3005 =C2=B1 6%     +44.1%       4331 =C2=B1 2%  TOTAL sched_debug.cpu=
#28.curr->pid
       722 =C2=B1 5%     +36.2%        983 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[28]:/.tg_runnable_contrib
     32215 =C2=B1 6%     +40.3%      45183 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[19]:/.avg->runnable_avg_sum
     32108 =C2=B1 3%     +40.5%      45102 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[13]:/.avg->runnable_avg_sum
       703 =C2=B1 6%     +39.9%        983 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[19]:/.tg_runnable_contrib
     33049 =C2=B1 5%     +36.4%      45063 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[28]:/.avg->runnable_avg_sum
       685 =C2=B1 5%     +43.1%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[11]:/.tg_runnable_contrib
       702 =C2=B1 3%     +39.7%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[13]:/.tg_runnable_contrib
     32365 =C2=B1 1%     +39.3%      45086 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[20]:/.avg->runnable_avg_sum
       706 =C2=B1 1%     +38.9%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[20]:/.tg_runnable_contrib
   1120854 =C2=B141%     -45.0%     616182 =C2=B1 4%  TOTAL sched_debug.cpu=
#5.sched_count
     31452 =C2=B1 3%     +44.5%      45437 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[9]:/.avg->runnable_avg_sum
     32534 =C2=B1 5%     +38.4%      45040 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[31]:/.avg->runnable_avg_sum
       687 =C2=B1 3%     +44.1%        990 =C2=B1 1%  TOTAL sched_debug.cfs=
_rq[9]:/.tg_runnable_contrib
       702 =C2=B1 7%     +40.4%        985 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[25]:/.tg_runnable_contrib
       694 =C2=B1 5%     +41.6%        983 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[14]:/.tg_runnable_contrib
        19 =C2=B124%     +50.0%         28 =C2=B1 7%  TOTAL sched_debug.cfs=
_rq[8]:/.runnable_load_avg
        19 =C2=B1 9%     +46.9%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#20.cpu_load[2]
        19 =C2=B112%     +42.4%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#16.cpu_load[1]
        19 =C2=B110%     +47.5%         29 =C2=B1 6%  TOTAL sched_debug.cpu=
#2.cpu_load[1]
        19 =C2=B114%     +43.9%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#20.cpu_load[0]
        20 =C2=B113%     +33.7%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#24.cpu_load[1]
        20 =C2=B113%     +50.0%         30 =C2=B111%  TOTAL sched_debug.cpu=
#2.cpu_load[0]
        18 =C2=B116%     +48.9%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#27.cpu_load[2]
        18 =C2=B119%     +46.8%         27 =C2=B1 5%  TOTAL sched_debug.cpu=
#26.cpu_load[1]
        19 =C2=B114%     +43.3%         27 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[30]:/.runnable_load_avg
        20 =C2=B1 6%     +41.6%         28 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[4]:/.runnable_load_avg
        20 =C2=B111%     +40.0%         28 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[16]:/.runnable_load_avg
        20 =C2=B1 4%     +36.3%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[20]:/.runnable_load_avg
        19 =C2=B113%     +44.9%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#16.cpu_load[2]
       710 =C2=B1 5%     +38.1%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[31]:/.tg_runnable_contrib
     32116 =C2=B1 7%     +40.5%      45109 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[25]:/.avg->runnable_avg_sum
     31789 =C2=B1 5%     +41.7%      45041 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[14]:/.avg->runnable_avg_sum
     31727 =C2=B1 4%     +42.1%      45080 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[17]:/.avg->runnable_avg_sum
       696 =C2=B1 6%     +41.2%        983 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[0]:/.tg_runnable_contrib
     31871 =C2=B1 6%     +41.4%      45051 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[0]:/.avg->runnable_avg_sum
     32292 =C2=B1 5%     +39.4%      45011 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[7]:/.avg->runnable_avg_sum
       699 =C2=B1 3%     +40.5%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[16]:/.tg_runnable_contrib
       706 =C2=B1 5%     +39.0%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[7]:/.tg_runnable_contrib
      3025 =C2=B116%     +43.2%       4334 =C2=B1 2%  TOTAL sched_debug.cpu=
#10.curr->pid
     32043 =C2=B1 3%     +40.6%      45060 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[16]:/.avg->runnable_avg_sum
       705 =C2=B1 4%     +39.8%        985 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[3]:/.tg_runnable_contrib
     32260 =C2=B1 4%     +39.8%      45100 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[3]:/.avg->runnable_avg_sum
       694 =C2=B1 4%     +41.3%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[17]:/.tg_runnable_contrib
     32722 =C2=B1 3%     +38.1%      45195 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[2]:/.avg->runnable_avg_sum
      2869 =C2=B111%     +52.0%       4362 =C2=B1 3%  TOTAL sched_debug.cpu=
#30.curr->pid
       698 =C2=B1 5%     +40.6%        982 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[23]:/.tg_runnable_contrib
     32007 =C2=B1 5%     +40.7%      45031 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[23]:/.avg->runnable_avg_sum
        21 =C2=B1 7%     +34.3%         29 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[18]:/.runnable_load_avg
        20 =C2=B111%     +40.8%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#24.cpu_load[3]
        21 =C2=B110%     +34.6%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#29.cpu_load[3]
        21 =C2=B110%     +36.8%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#29.cpu_load[4]
        21 =C2=B1 9%     +39.0%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#24.cpu_load[4]
        21 =C2=B112%     +34.9%         28 =C2=B1 5%  TOTAL sched_debug.cpu=
#29.cpu_load[2]
        20 =C2=B111%     +41.7%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#21.cpu_load[3]
        20 =C2=B110%     +45.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#14.cpu_load[3]
        20 =C2=B115%     +38.2%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#14.cpu_load[1]
        20 =C2=B111%     +45.0%         29 =C2=B1 2%  TOTAL sched_debug.cpu=
#16.cpu_load[3]
        23 =C2=B110%     +25.2%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#55.load
        21 =C2=B1 6%     +34.6%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#28.cpu_load[4]
        20 =C2=B1 6%     +38.8%         28 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[7]:/.runnable_load_avg
        20 =C2=B111%     +44.1%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#21.cpu_load[4]
      2959 =C2=B1 8%     +45.8%       4315 =C2=B1 1%  TOTAL sched_debug.cpu=
#6.curr->pid
     33054 =C2=B1 2%     +36.8%      45208 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[1]:/.avg->runnable_avg_sum
       715 =C2=B1 2%     +37.4%        983 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[2]:/.tg_runnable_contrib
     32267 =C2=B1 5%     +39.7%      45074 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[4]:/.avg->runnable_avg_sum
       705 =C2=B1 4%     +38.9%        979 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[4]:/.tg_runnable_contrib
      2983 =C2=B112%     +47.3%       4394 =C2=B1 2%  TOTAL sched_debug.cpu=
#2.curr->pid
     32679 =C2=B1 5%     +37.9%      45073 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[6]:/.avg->runnable_avg_sum
       722 =C2=B1 2%     +35.8%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[1]:/.tg_runnable_contrib
      2841 =C2=B120%     +54.9%       4399 =C2=B1 1%  TOTAL sched_debug.cpu=
#0.curr->pid
     32684 =C2=B1 5%     +37.8%      45024 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[21]:/.avg->runnable_avg_sum
       714 =C2=B1 5%     +37.3%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[6]:/.tg_runnable_contrib
        22 =C2=B110%     +33.3%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#12.cpu_load[4]
   1044460 =C2=B129%     -42.8%     597073 =C2=B1 1%  TOTAL sched_debug.cpu=
#31.sched_count
      2962 =C2=B110%     +45.6%       4314 =C2=B1 2%  TOTAL sched_debug.cpu=
#21.curr->pid
    107755 =C2=B1 0%     +35.8%     146314 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[16]:/.exec_clock
      3040 =C2=B114%     +45.8%       4431 =C2=B1 3%  TOTAL sched_debug.cpu=
#18.curr->pid
       713 =C2=B1 5%     +37.3%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[21]:/.tg_runnable_contrib
    107444 =C2=B1 0%     +36.2%     146370 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[8]:/.exec_clock
     33921 =C2=B1 7%     +32.9%      45070 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[5]:/.avg->runnable_avg_sum
        19 =C2=B116%     +41.7%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#27.cpu_load[0]
        18 =C2=B116%     +46.8%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#27.cpu_load[1]
        20 =C2=B113%     +35.3%         27 =C2=B1 4%  TOTAL sched_debug.cpu=
#24.cpu_load[0]
    110484 =C2=B1 1%     +34.1%     148181 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[10]:/.exec_clock
    108447 =C2=B1 0%     +34.7%     146038 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[17]:/.exec_clock
       741 =C2=B1 7%     +32.3%        980 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[5]:/.tg_runnable_contrib
      3131 =C2=B110%     +40.9%       4412 =C2=B1 5%  TOTAL sched_debug.cpu=
#29.curr->pid
    108894 =C2=B1 1%     +33.9%     145821 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[24]:/.exec_clock
    108897 =C2=B1 0%     +34.3%     146281 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[9]:/.exec_clock
    110117 =C2=B1 2%     +32.5%     145856 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[25]:/.exec_clock
    109871 =C2=B1 1%     +32.8%     145922 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[15]:/.exec_clock
    110887 =C2=B1 1%     +32.8%     147227 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[12]:/.exec_clock
        20 =C2=B113%     +40.2%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#0.cpu_load[3]
        21 =C2=B1 7%     +30.5%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[28]:/.runnable_load_avg
        20 =C2=B1 7%     +37.9%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#18.cpu_load[1]
        21 =C2=B1 9%     +30.6%         28 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[29]:/.runnable_load_avg
        19 =C2=B112%     +43.4%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#20.cpu_load[1]
        20 =C2=B1 9%     +38.8%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#21.cpu_load[2]
        21 =C2=B1 5%     +33.0%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#28.cpu_load[3]
        21 =C2=B1 5%     +32.4%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#28.cpu_load[1]
        20 =C2=B1 5%     +33.7%         27 =C2=B1 2%  TOTAL sched_debug.cpu=
#28.cpu_load[2]
        21 =C2=B1 9%     +29.0%         27 =C2=B1 5%  TOTAL sched_debug.cpu=
#29.cpu_load[0]
        21 =C2=B113%     +35.2%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#24.cpu_load[2]
        21 =C2=B1 9%     +34.3%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#18.cpu_load[0]
      3098 =C2=B111%     +39.9%       4335 =C2=B1 2%  TOTAL sched_debug.cpu=
#25.curr->pid
    109876 =C2=B1 0%     +33.3%     146491 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[11]:/.exec_clock
    268016 =C2=B1 3%     +32.8%     355948 =C2=B1 9%  TOTAL meminfo.Committ=
ed_AS
    109686 =C2=B1 1%     +33.3%     146181 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[13]:/.exec_clock
    109930 =C2=B1 1%     +33.3%     146529 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[18]:/.exec_clock
    110814 =C2=B1 2%     +31.8%     146073 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[22]:/.exec_clock
    111231 =C2=B1 1%     +31.2%     145955 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[26]:/.exec_clock
    792742 =C2=B1 2%     -24.3%     599925 =C2=B1 1%  TOTAL sched_debug.cpu=
#8.nr_switches
        20 =C2=B113%     +40.6%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#14.cpu_load[2]
        22 =C2=B111%     +30.4%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#12.cpu_load[3]
        22 =C2=B110%     +32.7%         29 =C2=B1 3%  TOTAL sched_debug.cfs=
_rq[21]:/.runnable_load_avg
        22 =C2=B111%     +26.5%         28 =C2=B1 1%  TOTAL sched_debug.cpu=
#12.cpu_load[2]
        20 =C2=B111%     +43.1%         29 =C2=B1 5%  TOTAL sched_debug.cpu=
#0.cpu_load[4]
        22 =C2=B111%     +29.1%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#12.cpu_load[1]
        22 =C2=B121%     +30.0%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#17.cpu_load[3]
    896719 =C2=B118%     -31.3%     615816 =C2=B1 4%  TOTAL sched_debug.cpu=
#30.sched_count
    110467 =C2=B1 1%     +32.0%     145847 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[19]:/.exec_clock
    110856 =C2=B1 1%     +31.7%     145977 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[20]:/.exec_clock
    112749 =C2=B1 1%     +32.1%     148960 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[2]:/.exec_clock
    110628 =C2=B1 1%     +32.0%     146083 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[23]:/.exec_clock
    116500 =C2=B1 1%     +31.0%     152586 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[0]:/.exec_clock
     33803 =C2=B1 6%     +33.2%      45033 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[12]:/.avg->runnable_avg_sum
       738 =C2=B1 6%     +32.9%        981 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[12]:/.tg_runnable_contrib
    111685 =C2=B1 0%     +30.4%     145683 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[4]:/.exec_clock
    111045 =C2=B1 1%     +31.3%     145845 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[21]:/.exec_clock
    111156 =C2=B1 0%     +31.3%     145923 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[14]:/.exec_clock
    111731 =C2=B1 0%     +30.3%     145623 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[5]:/.exec_clock
    111147 =C2=B1 1%     +31.0%     145641 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[6]:/.exec_clock
      3172 =C2=B1 3%     +33.8%       4245 =C2=B1 0%  TOTAL sched_debug.cpu=
#12.curr->pid
    111847 =C2=B1 0%     +30.4%     145836 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[1]:/.exec_clock
        20 =C2=B139%     +43.1%         29 =C2=B1 3%  TOTAL sched_debug.cpu=
#63.load
    111241 =C2=B1 0%     +31.0%     145727 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[3]:/.exec_clock
    111457 =C2=B1 1%     +30.7%     145630 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[31]:/.exec_clock
    112620 =C2=B1 1%     +29.4%     145693 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[27]:/.exec_clock
    112963 =C2=B1 1%     +28.9%     145645 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[29]:/.exec_clock
    112421 =C2=B1 0%     +29.6%     145673 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[7]:/.exec_clock
      7338 =C2=B111%     +23.3%       9050 =C2=B1 7%  TOTAL numa-vmstat.nod=
e3.nr_anon_pages
     29353 =C2=B111%     +23.3%      36204 =C2=B1 7%  TOTAL numa-meminfo.no=
de3.AnonPages
    766344 =C2=B1 4%     -22.2%     596356 =C2=B1 1%  TOTAL sched_debug.cpu=
#12.nr_switches
    112871 =C2=B1 0%     +29.0%     145613 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[28]:/.exec_clock
    785724 =C2=B1 2%     -22.0%     612543 =C2=B1 0%  TOTAL sched_debug.cpu=
#0.nr_switches
    770632 =C2=B1 2%     -22.3%     598517 =C2=B1 1%  TOTAL sched_debug.cpu=
#15.nr_switches
    113328 =C2=B1 0%     +28.5%     145614 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[30]:/.exec_clock
        19 =C2=B116%     +40.2%         27 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[0]:/.runnable_load_avg
        19 =C2=B123%     +39.2%         27 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[26]:/.runnable_load_avg
    763775 =C2=B1 3%     -21.8%     596955 =C2=B1 1%  TOTAL sched_debug.cpu=
#13.nr_switches
        21 =C2=B110%     +30.6%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#29.cpu_load[1]
        20 =C2=B110%     +36.5%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#21.cpu_load[1]
        21 =C2=B118%     +31.1%         27 =C2=B1 1%  TOTAL sched_debug.cpu=
#0.cpu_load[1]
        22 =C2=B1 4%     +30.0%         28 =C2=B1 4%  TOTAL sched_debug.cpu=
#52.load
        21 =C2=B111%     +30.8%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#21.cpu_load[0]
        21 =C2=B1 6%     +28.4%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#28.cpu_load[0]
        21 =C2=B119%     +31.8%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#17.cpu_load[2]
        19 =C2=B120%     +45.8%         28 =C2=B1 3%  TOTAL sched_debug.cpu=
#26.cpu_load[0]
        22 =C2=B116%     +27.3%         28 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[27]:/.runnable_load_avg
        21 =C2=B117%     +29.4%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#17.cpu_load[0]
        21 =C2=B112%     +32.1%         28 =C2=B1 2%  TOTAL sched_debug.cfs=
_rq[24]:/.runnable_load_avg
        20 =C2=B117%     +34.6%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#0.cpu_load[2]
    773695 =C2=B1 2%     -22.5%     599935 =C2=B1 1%  TOTAL sched_debug.cpu=
#11.nr_switches
    760832 =C2=B1 2%     -21.3%     598498 =C2=B1 1%  TOTAL sched_debug.cpu=
#9.nr_switches
        23 =C2=B117%     +20.3%         28 =C2=B1 5%  TOTAL sched_debug.cfs=
_rq[52]:/.load
    761399 =C2=B1 1%     -21.2%     600107 =C2=B1 1%  TOTAL sched_debug.cpu=
#10.nr_switches
    770683 =C2=B1 1%     -21.1%     607908 =C2=B1 1%  TOTAL sched_debug.cpu=
#2.nr_switches
    757803 =C2=B1 4%     -20.7%     600923 =C2=B1 1%  TOTAL sched_debug.cpu=
#6.nr_switches
    750665 =C2=B1 1%     -19.1%     606952 =C2=B1 0%  TOTAL sched_debug.cpu=
#1.nr_switches
    744077 =C2=B1 2%     -19.6%     598358 =C2=B1 0%  TOTAL sched_debug.cpu=
#16.nr_switches
    753828 =C2=B1 1%     -19.6%     605817 =C2=B1 1%  TOTAL sched_debug.cpu=
#3.nr_switches
    742810 =C2=B1 2%     -18.9%     602251 =C2=B1 0%  TOTAL sched_debug.cpu=
#5.nr_switches
    732991 =C2=B1 2%     -18.5%     597448 =C2=B1 1%  TOTAL sched_debug.cpu=
#17.nr_switches
    725349 =C2=B1 2%     -17.9%     595187 =C2=B1 1%  TOTAL sched_debug.cpu=
#14.nr_switches
        21 =C2=B118%     +29.6%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#17.cpu_load[1]
        22 =C2=B114%     +28.2%         28 =C2=B1 2%  TOTAL sched_debug.cpu=
#12.cpu_load[0]
    736992 =C2=B1 2%     -17.8%     605506 =C2=B1 1%  TOTAL sched_debug.cpu=
#4.nr_switches
    724402 =C2=B1 1%     -16.7%     603369 =C2=B1 0%  TOTAL sched_debug.cpu=
#7.nr_switches
    712130 =C2=B1 2%     -15.5%     602079 =C2=B1 1%  TOTAL sched_debug.cpu=
#24.nr_switches
    715409 =C2=B1 5%     -16.1%     600473 =C2=B1 2%  TOTAL sched_debug.cpu=
#22.nr_switches
    169672 =C2=B1 0%     +19.0%     201867 =C2=B1 0%  TOTAL meminfo.Active(=
anon)
     42418 =C2=B1 0%     +18.9%      50446 =C2=B1 0%  TOTAL proc-vmstat.nr_=
active_anon
    710553 =C2=B1 3%     -16.0%     597062 =C2=B1 1%  TOTAL sched_debug.cpu=
#31.nr_switches
    723251 =C2=B1 2%     -17.1%     599549 =C2=B1 1%  TOTAL sched_debug.cpu=
#18.nr_switches
    706093 =C2=B1 4%     -14.9%     601183 =C2=B1 1%  TOTAL sched_debug.cpu=
#26.nr_switches
    704669 =C2=B1 2%     -14.9%     599338 =C2=B1 1%  TOTAL sched_debug.cpu=
#20.nr_switches
    703753 =C2=B1 3%     -15.3%     596238 =C2=B1 1%  TOTAL sched_debug.cpu=
#21.nr_switches
    702440 =C2=B1 5%     -15.1%     596380 =C2=B1 1%  TOTAL sched_debug.cpu=
#25.nr_switches
    702660 =C2=B1 4%     -14.7%     599141 =C2=B1 1%  TOTAL sched_debug.cpu=
#19.nr_switches
        22 =C2=B114%     +28.2%         28 =C2=B1 4%  TOTAL sched_debug.cfs=
_rq[12]:/.runnable_load_avg
        22 =C2=B122%     +32.4%         29 =C2=B1 1%  TOTAL sched_debug.cpu=
#34.load
    701182 =C2=B1 4%     -14.6%     598606 =C2=B1 1%  TOTAL sched_debug.cpu=
#23.nr_switches
      0.23 =C2=B1 5%     -15.8%       0.19 =C2=B1 6%  TOTAL turbostat.%pc3
    238557 =C2=B1 0%     +13.5%     270767 =C2=B1 0%  TOTAL meminfo.Active
    135003 =C2=B1 0%     +12.7%     152182 =C2=B1 0%  TOTAL sched_debug.cpu=
#56.nr_load_updates
    135518 =C2=B1 1%     +12.2%     152028 =C2=B1 0%  TOTAL sched_debug.cpu=
#63.nr_load_updates
    668473 =C2=B1 4%     -10.5%     598372 =C2=B1 1%  TOTAL sched_debug.cpu=
#29.nr_switches
    137963 =C2=B1 0%     +11.9%     154381 =C2=B1 0%  TOTAL sched_debug.cpu=
#57.nr_load_updates
    135802 =C2=B1 0%     +12.1%     152194 =C2=B1 0%  TOTAL sched_debug.cpu=
#58.nr_load_updates
    673342 =C2=B1 3%     -10.3%     604167 =C2=B1 2%  TOTAL sched_debug.cpu=
#30.nr_switches
    136075 =C2=B1 0%     +11.8%     152117 =C2=B1 0%  TOTAL sched_debug.cpu=
#60.nr_load_updates
    136265 =C2=B1 0%     +11.6%     152124 =C2=B1 0%  TOTAL sched_debug.cpu=
#59.nr_load_updates
    136657 =C2=B1 0%     +11.5%     152399 =C2=B1 0%  TOTAL sched_debug.cpu=
#48.nr_load_updates
    672367 =C2=B1 4%     -10.6%     600775 =C2=B1 2%  TOTAL sched_debug.cpu=
#27.nr_switches
    136400 =C2=B1 0%     +11.6%     152176 =C2=B1 0%  TOTAL sched_debug.cpu=
#61.nr_load_updates
    136146 =C2=B1 0%     +11.7%     152103 =C2=B1 0%  TOTAL sched_debug.cpu=
#62.nr_load_updates
      1848 =C2=B1 2%     +10.9%       2049 =C2=B1 5%  TOTAL numa-meminfo.no=
de0.Mapped
    136683 =C2=B1 0%     +11.4%     152199 =C2=B1 0%  TOTAL sched_debug.cpu=
#55.nr_load_updates
    137175 =C2=B1 0%     +11.0%     152310 =C2=B1 0%  TOTAL sched_debug.cpu=
#51.nr_load_updates
    139156 =C2=B1 0%     +10.8%     154236 =C2=B1 0%  TOTAL sched_debug.cpu=
#49.nr_load_updates
    137076 =C2=B1 0%     +11.1%     152253 =C2=B1 0%  TOTAL sched_debug.cpu=
#53.nr_load_updates
    672781 =C2=B1 3%     -10.5%     601982 =C2=B1 1%  TOTAL sched_debug.cpu=
#28.nr_switches
    136873 =C2=B1 1%     +11.2%     152248 =C2=B1 0%  TOTAL sched_debug.cpu=
#52.nr_load_updates
    137601 =C2=B1 0%     +10.8%     152404 =C2=B1 0%  TOTAL sched_debug.cpu=
#50.nr_load_updates
    137409 =C2=B1 0%     +10.8%     152228 =C2=B1 0%  TOTAL sched_debug.cpu=
#54.nr_load_updates
    608198 =C2=B1 1%   +5895.2%   36462984 =C2=B1 0%  TOTAL time.voluntary_=
context_switches
     62.13 =C2=B1 1%    +247.4%     215.86 =C2=B1 1%  TOTAL time.user_time
    560843 =C2=B1 0%     -53.2%     262235 =C2=B1 0%  TOTAL vmstat.system.cs
     54.79 =C2=B1 0%     +81.7%      99.56 =C2=B1 0%  TOTAL turbostat.%c0
     38022 =C2=B1 0%     +76.6%      67144 =C2=B1 0%  TOTAL vmstat.system.in
      2726 =C2=B1 0%     +68.6%       4596 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got
      8155 =C2=B1 0%     +67.2%      13638 =C2=B1 0%  TOTAL time.system_time
    951709 =C2=B1 0%     +53.4%    1459554 =C2=B1 0%  TOTAL time.involuntar=
y_context_switches
    227030 =C2=B1 1%     -16.1%     190393 =C2=B1 0%  TOTAL time.minor_page=
_faults


                                     qperf.sctp.bw

   1.3e+09 ++--------------------------------------------------------------=
-+
   1.2e+09 ++    O                                         O              O=
 |
           O OO O  O       O          O  O  O OO   OO OO O     O    O  O O =
 |
   1.1e+09 ++        OO OO  O O OO OO   O  O     O            O  OO   O    =
 O
     1e+09 ++                                               O              =
 |
           |                                                               =
 |
     9e+08 ++                                                              =
 |
     8e+08 ++                                                              =
 |
     7e+08 ++                                                              =
 |
           |                                                               =
 |
     6e+08 ++                                                              =
 |
     5e+08 ++                                                              =
 |
           |                                      .**.         *. *.       =
 |
     4e+08 *+**.**.*. *.**.**.*.**.**.*.**.**.**.*    **.*.**.*  *  *.**   =
 |
     3e+08 ++--------*-----------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

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

--===============6799348943402632881==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBuZXRwZXJmCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2F0Y2gtb29tOiAKICB3
YWl0OiBwcmUtdGVzdAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBs
b2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBp
bmc6IAogIGRpc2tzdGF0czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0
dXJib3N0YXQ6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKbW9k
ZWw6IE5laGFsZW0tRVgKbWVtb3J5OiAyNTZHCm5yX3NzZF9wYXJ0aXRpb25zOiA2CnNzZF9wYXJ0
aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0QqcGFydDEiCnN3YXBfcGFydGl0
aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTBFQVJTLTAwWTVCMV9XRC1XQ0FWNUYw
NTkwNzQtcGFydDIiCnJ1bnRpbWU6IDMwMHMKbnJfdGhyZWFkczoKLSAyMDAlCnBlcmYtcHJvZmls
ZToKICBmcmVxOiA4MDAKbmV0cGVyZjoKICBzZW5kX3NpemU6IDEwSwogIHRlc3Q6CiAgLSBTQ1RQ
X1NUUkVBTV9NQU5ZCmJyYW5jaDogbGludXMvbWFzdGVyCmNvbW1pdDogMTk1ODNjYTU4NGQ2ZjU3
NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNgpyZXBlYXRfdG86IDMKZW5xdWV1ZV90aW1lOiAyMDE0
LTA5LTI1IDIxOjQxOjE2LjI3NTUzNzU1MiArMDg6MDAKdGVzdGJveDogbGtwLW5leDA0Cmtjb25m
aWc6IHg4Nl82NC1yaGVsCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvMTk1ODNjYTU4NGQ2
ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRhNi92bWxpbnV6LTMuMTYuMCIKdXNlcjogbGtwCnF1
ZXVlOiB3ZmcKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2xrcC1uZXgwNC9uZXRwZXJmLzMwMHMtMjAw
JS0xMEstU0NUUF9TVFJFQU1fTUFOWS9kZWJpYW4teDg2XzY0LmNnei94ODZfNjQtcmhlbC8xOTU4
M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFkY2RjNGE2LzAiCmpvYl9maWxlOiAiL2xrcC9z
Y2hlZHVsZWQvbGtwLW5leDA0L3dmZ19uZXRwZXJmLTMwMHMtMjAwJS0xMEstU0NUUF9TVFJFQU1f
TUFOWS14ODZfNjQtcmhlbC0xOTU4M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFkY2RjNGE2
LTIueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0LTA5LTMwIDAwOjIxOjQwLjM0Nzg2MjI5NCArMDg6
MDAKaGlzdG9yeV90aW1lOiAzMDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxMzkuNTYg
MTA4LjYxIDQ4Ljk2IDIvNTI5IDEzMTkzCnN0YXJ0X3RpbWU6ICcxNDEyMDA3Nzc5JwplbmRfdGlt
ZTogJzE0MTIwMDgwODMnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTQwOTI5LTE1MjA0MyIK

--===============6799348943402632881==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bmV0c2VydmVyCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0g
MTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYg
LXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NU
UF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFO
WSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAt
QyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0g
LW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBL
Cm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBl
cmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9T
VFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1f
TUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAt
YyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAt
bCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAg
LS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0g
MTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYg
LXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NU
UF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFO
WSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAt
QyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0g
LW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBL
Cm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBl
cmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9T
VFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1f
TUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAt
YyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAt
bCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAg
LS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0g
MTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYg
LXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NU
UF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFO
WSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAt
QyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0g
LW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBL
Cm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBl
cmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9T
VFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1f
TUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAt
YyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAt
bCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAg
LS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0g
MTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYg
LXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NU
UF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFO
WSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAt
QyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0g
LW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBL
Cm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBl
cmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9T
VFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1f
TUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAt
YyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAt
bCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAg
LS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0g
MTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYg
LXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NU
UF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFO
WSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAt
QyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0g
LW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBL
Cm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBl
cmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9T
VFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1f
TUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAt
YyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAt
bCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAg
LS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0g
MTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYg
LXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NU
UF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFO
WSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAt
QyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0g
LW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBL
Cm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBl
cmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9T
VFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1f
TUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAt
YyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAt
bCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAg
LS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0g
MTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYg
LXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NU
UF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFO
WSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAt
QyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0g
LW0gMTBLCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBL
Cm5ldHBlcmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBl
cmYgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLCg==

--===============6799348943402632881==--

