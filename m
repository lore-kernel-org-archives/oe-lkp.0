Content-Type: multipart/mixed; boundary="===============7207006217079250098=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] 8a0516ed8b9: -1.7% netperf.Throughput_Mbps, +2189.6% netperf.time.minor_page_faults, +3987.5% proc-vmstat.numa_pte_updates
Date: Thu, 26 Feb 2015 13:20:22 +0800
Message-ID: <1424928022.10337.23.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7207006217079250098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 8a0516ed8b90c95ffa1363b420caa37418149f21 ("mm: convert p[te|md]_numa=
 users to p[te|md]_protnone_numa")


testbox/testcase/testparams: lkp-sbx04/netperf/performance-900s-200%-TCP_MA=
ERTS

e7bb4b6d1609cce3  8a0516ed8b90c95ffa1363b420  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    226261 =C2=B1  1%   +2189.6%    5180560 =C2=B1  0%  netperf.time.minor_=
page_faults
       721 =C2=B1  0%      -1.7%        709 =C2=B1  0%  netperf.Throughput_=
Mbps
     12341 =C2=B1 16%    -100.0%          0 =C2=B1  0%  proc-vmstat.numa_pa=
ges_migrated
    364595 =C2=B1  3%    -100.0%          0 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
    388922 =C2=B1  4%    -100.0%          0 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults
    226261 =C2=B1  1%   +2189.6%    5180560 =C2=B1  0%  time.minor_page_fau=
lts
    388831 =C2=B1  3%   +3987.5%   15893407 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
     12341 =C2=B1 16%    -100.0%          0 =C2=B1  0%  proc-vmstat.pgmigra=
te_success
        47 =C2=B1 42%     -60.3%         18 =C2=B1 13%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
        73 =C2=B1 19%     -53.9%         34 =C2=B1 18%  sched_debug.cfs_rq[=
46]:/.load
        32 =C2=B1 20%     +75.0%         56 =C2=B1 32%  sched_debug.cpu#32.=
load
        27 =C2=B1 37%     +61.1%         43 =C2=B1 27%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
        54 =C2=B1 20%     -43.8%         30 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.load
        57 =C2=B1 30%     -39.8%         34 =C2=B1 17%  sched_debug.cfs_rq[=
53]:/.load
        70 =C2=B1 29%     -41.3%         41 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
        64 =C2=B1 20%     -27.9%         46 =C2=B1 14%  sched_debug.cpu#26.=
load
        34 =C2=B1 21%     +68.6%         57 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.load
        60 =C2=B1 21%     -28.2%         43 =C2=B1 26%  sched_debug.cfs_rq[=
6]:/.load
        50 =C2=B1 18%     +33.2%         67 =C2=B1 18%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
        62 =C2=B1 28%     -40.6%         37 =C2=B1 32%  sched_debug.cfs_rq[=
30]:/.load
        59 =C2=B1 18%     -33.5%         39 =C2=B1 14%  sched_debug.cfs_rq[=
62]:/.load
       556 =C2=B1 25%     -54.2%        255 =C2=B1 36%  sched_debug.cpu#59.=
sched_goidle
      1.63 =C2=B1  2%     -31.2%       1.12 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_lock.free_one_page.__free_pages_ok.free_compound_page.put_co=
mpound_page
        50 =C2=B1 40%     -35.5%         32 =C2=B1 16%  sched_debug.cpu#43.=
load
        31 =C2=B1 18%     +39.7%         44 =C2=B1 22%  sched_debug.cpu#53.=
load
      2.18 =C2=B1  3%     -29.0%       1.55 =C2=B1  3%  perf-profile.cpu-cy=
cles.free_one_page.__free_pages_ok.free_compound_page.put_compound_page.put=
_page
        46 =C2=B1 13%     -37.6%         29 =C2=B1 31%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
        51 =C2=B1 26%     -36.6%         32 =C2=B1  6%  sched_debug.cpu#7.l=
oad
        73 =C2=B1 13%     -20.8%         58 =C2=B1  9%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
      1.77 =C2=B1  2%     -25.1%       1.33 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.get_page_from_freelist.__alloc_pages_nodemask.a=
lloc_pages_current.skb_page_frag_refill
        58 =C2=B1 23%     -38.4%         35 =C2=B1 24%  sched_debug.cfs_rq[=
2]:/.load
   8833788 =C2=B1  8%     +22.5%   10821104 =C2=B1 12%  sched_debug.cfs_rq[=
12]:/.max_vruntime
   8833787 =C2=B1  8%     +22.5%   10821104 =C2=B1 12%  sched_debug.cfs_rq[=
12]:/.MIN_vruntime
      1951 =C2=B1 12%     +20.1%       2343 =C2=B1 12%  sched_debug.cpu#9.c=
urr->pid
    112948 =C2=B1  2%     +25.6%     141909 =C2=B1 11%  sched_debug.cpu#32.=
sched_count
      1955 =C2=B1  9%     +17.3%       2293 =C2=B1  9%  sched_debug.cpu#46.=
curr->pid
   9533920 =C2=B1 16%     +31.8%   12561711 =C2=B1 13%  sched_debug.cfs_rq[=
53]:/.max_vruntime
   9533919 =C2=B1 16%     +31.8%   12561711 =C2=B1 13%  sched_debug.cfs_rq[=
53]:/.MIN_vruntime
      0.97 =C2=B1 10%     -15.7%       0.82 =C2=B1  6%  perf-profile.cpu-cy=
cles.tcp_send_mss.tcp_sendmsg.inet_sendmsg.do_sock_sendmsg.SYSC_sendto
     59313 =C2=B1 24%     -21.3%      46703 =C2=B1  2%  sched_debug.cpu#25.=
ttwu_count
      3.92 =C2=B1  2%     -17.1%       3.25 =C2=B1  0%  perf-profile.cpu-cy=
cles.put_compound_page.put_page.skb_release_data.skb_release_all.__kfree_skb
      3.72 =C2=B1  2%     -16.4%       3.11 =C2=B1  0%  perf-profile.cpu-cy=
cles.free_compound_page.put_compound_page.put_page.skb_release_data.skb_rel=
ease_all
      3.65 =C2=B1  1%     -16.8%       3.04 =C2=B1  0%  perf-profile.cpu-cy=
cles.__free_pages_ok.free_compound_page.put_compound_page.put_page.skb_rele=
ase_data
      1853 =C2=B1  9%     +15.7%       2144 =C2=B1  5%  sched_debug.cpu#45.=
curr->pid
      1769 =C2=B1  4%     +19.9%       2121 =C2=B1  6%  sched_debug.cpu#61.=
curr->pid
      5.97 =C2=B1  2%     -16.1%       5.01 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_finish.i=
p_local_deliver
      1.59 =C2=B1  2%     -14.2%       1.37 =C2=B1  2%  perf-profile.cpu-cy=
cles.sk_stream_alloc_skb.tcp_sendmsg.inet_sendmsg.do_sock_sendmsg.SYSC_send=
to
      2.65 =C2=B1  3%     -17.1%       2.20 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_esta=
blished.tcp_v4_do_rcv
      6.19 =C2=B1  1%     -15.3%       5.25 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_finish.ip_local_deliver.ip_r=
cv_finish
      4.45 =C2=B1  1%     -15.6%       3.75 =C2=B1  0%  perf-profile.cpu-cy=
cles.put_page.skb_release_data.skb_release_all.__kfree_skb.tcp_recvmsg
    693150 =C2=B1  3%     +14.6%     794663 =C2=B1  6%  sched_debug.cpu#1.a=
vg_idle
      8.14 =C2=B1  1%     -14.7%       6.94 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_rcv.__netif_receive_skb_core.__netif_receive_skb.process_backlog.ne=
t_rx_action
      7.37 =C2=B1  2%     -14.8%       6.28 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_v4_rcv.ip_local_deliver_finish.ip_local_deliver.ip_rcv_finish.ip_r=
cv
      6.70 =C2=B1  1%     -14.3%       5.74 =C2=B1  1%  perf-profile.cpu-cy=
cles.__kfree_skb.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom
      1988 =C2=B1  7%      -8.0%       1829 =C2=B1  7%  sched_debug.cpu#33.=
curr->pid
      5.21 =C2=B1  1%     -14.0%       4.49 =C2=B1  0%  perf-profile.cpu-cy=
cles.skb_release_data.skb_release_all.__kfree_skb.tcp_recvmsg.inet_recvmsg
      7.93 =C2=B1  2%     -14.5%       6.78 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_rcv_finish.ip_rcv.__netif_receive_skb_core.__netif_receive_skb.proc=
ess_backlog
      7.73 =C2=B1  2%     -14.3%       6.62 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_local_deliver.ip_rcv_finish.ip_rcv.__netif_receive_skb_core.__netif=
_receive_skb
      7.70 =C2=B1  2%     -14.6%       6.58 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_local_deliver_finish.ip_local_deliver.ip_rcv_finish.ip_rcv.__netif_=
receive_skb_core
      8.90 =C2=B1  1%     -14.1%       7.65 =C2=B1  0%  perf-profile.cpu-cy=
cles.__do_softirq.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.ip_f=
inish_output
     39826 =C2=B1  8%     -11.0%      35446 =C2=B1  1%  sched_debug.cpu#22.=
ttwu_local
      6.29 =C2=B1  1%     -14.3%       5.38 =C2=B1  0%  perf-profile.cpu-cy=
cles.skb_release_all.__kfree_skb.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      8.68 =C2=B1  2%     -14.1%       7.45 =C2=B1  0%  perf-profile.cpu-cy=
cles.net_rx_action.__do_softirq.do_softirq_own_stack.do_softirq.__local_bh_=
enable_ip
      8.43 =C2=B1  2%     -13.5%       7.29 =C2=B1  0%  perf-profile.cpu-cy=
cles.process_backlog.net_rx_action.__do_softirq.do_softirq_own_stack.do_sof=
tirq
      8.30 =C2=B1  2%     -13.5%       7.18 =C2=B1  0%  perf-profile.cpu-cy=
cles.__netif_receive_skb_core.__netif_receive_skb.process_backlog.net_rx_ac=
tion.__do_softirq
      8.32 =C2=B1  2%     -13.4%       7.21 =C2=B1  0%  perf-profile.cpu-cy=
cles.__netif_receive_skb.process_backlog.net_rx_action.__do_softirq.do_soft=
irq_own_stack
      8.99 =C2=B1  2%     -13.3%       7.79 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_softirq.part.13.__local_bh_enable_ip.ip_finish_output.ip_output.ip_=
local_out_sk
      9.02 =C2=B1  1%     -13.3%       7.82 =C2=B1  1%  perf-profile.cpu-cy=
cles.__local_bh_enable_ip.ip_finish_output.ip_output.ip_local_out_sk.ip_que=
ue_xmit
      1.02 =C2=B1  6%     -15.9%       0.86 =C2=B1  3%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frame=
s.tcp_rcv_established
  10430785 =C2=B1  7%     -16.8%    8673532 =C2=B1  9%  sched_debug.cfs_rq[=
49]:/.max_vruntime
  10430785 =C2=B1  7%     -16.8%    8673530 =C2=B1  9%  sched_debug.cfs_rq[=
49]:/.MIN_vruntime
  11509303 =C2=B1  9%     -23.1%    8846526 =C2=B1 14%  sched_debug.cfs_rq[=
13]:/.MIN_vruntime
  11509303 =C2=B1  9%     -23.1%    8846526 =C2=B1 14%  sched_debug.cfs_rq[=
13]:/.max_vruntime
      8.95 =C2=B1  1%     -13.2%       7.77 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.ip_finish_output.=
ip_output
     40589 =C2=B1  6%     -10.4%      36365 =C2=B1  3%  sched_debug.cpu#54.=
ttwu_local
      4.34 =C2=B1  1%     -12.8%       3.78 =C2=B1  1%  perf-profile.cpu-cy=
cles.alloc_pages_current.skb_page_frag_refill.sk_page_frag_refill.tcp_sendm=
sg.inet_sendmsg
      3.74 =C2=B1  1%     -14.7%       3.19 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.skb_=
page_frag_refill.sk_page_frag_refill
      1.02 =C2=B1  6%     -14.0%       0.88 =C2=B1  4%  perf-profile.cpu-cy=
cles.skb_release_head_state.skb_release_all.__kfree_skb.tcp_recvmsg.inet_re=
cvmsg
     15.16 =C2=B1  0%     +15.4%      17.50 =C2=B1  0%  perf-profile.cpu-cy=
cles.copy_user_generic_string.tcp_sendmsg.inet_sendmsg.do_sock_sendmsg.SYSC=
_sendto
     10.04 =C2=B1  1%     -12.1%       8.82 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack
     10.11 =C2=B1  1%     -12.1%       8.88 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack.tcp_cleanu=
p_rbuf
     38453 =C2=B1  6%      -9.4%      34832 =C2=B1  2%  sched_debug.cpu#12.=
ttwu_local
     10.22 =C2=B1  1%     -12.5%       8.94 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_finish_output.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_=
skb
      4.16 =C2=B1  1%     -13.3%       3.60 =C2=B1  1%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.skb_page_frag_refill.sk_pag=
e_frag_refill.tcp_sendmsg
      3.71 =C2=B1  2%     -11.8%       3.27 =C2=B1  0%  perf-profile.cpu-cy=
cles.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv=
.ip_local_deliver_finish
        24 =C2=B1  9%     -14.4%         20 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
        23 =C2=B1  4%     -10.6%         21 =C2=B1  3%  sched_debug.cpu#23.=
cpu_load[0]
      5196 =C2=B1  6%     +19.6%       6213 =C2=B1 18%  numa-vmstat.node1.n=
r_anon_pages
     20787 =C2=B1  6%     +19.6%      24855 =C2=B1 18%  numa-meminfo.node1.=
AnonPages
      3.57 =C2=B1  2%     -12.9%       3.11 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do=
_rcv.tcp_v4_rcv
     10.44 =C2=B1  1%     -12.2%       9.17 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack.tcp_cleanup_rbuf.tcp_recvm=
sg
     52615 =C2=B1  7%     -10.5%      47095 =C2=B1  3%  sched_debug.cpu#27.=
ttwu_count
    747189 =C2=B1  2%      +9.4%     817106 =C2=B1  5%  sched_debug.cpu#5.a=
vg_idle
      4.58 =C2=B1  2%     -13.0%       3.98 =C2=B1  1%  perf-profile.cpu-cy=
cles.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg.inet_sendmsg.do_s=
ock_sendmsg
      4.95 =C2=B1  1%     -12.0%       4.36 =C2=B1  1%  perf-profile.cpu-cy=
cles.sk_page_frag_refill.tcp_sendmsg.inet_sendmsg.do_sock_sendmsg.SYSC_send=
to
     12.85 =C2=B1  1%     -11.8%      11.33 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_cleanup_rbuf.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom
      9.45 =C2=B1  1%     -11.5%       8.36 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_send_ack.tcp_cleanup_rbuf.tcp_recvmsg.inet_recvmsg
     12.65 =C2=B1  1%     -11.8%      11.16 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_send_ack.tcp_cleanup_rbuf.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      1967 =C2=B1  5%     -11.3%       1744 =C2=B1  4%  sched_debug.cpu#38.=
curr->pid
      1.50 =C2=B1  3%     -11.2%       1.33 =C2=B1  2%  perf-profile.cpu-cy=
cles.__alloc_skb.sk_stream_alloc_skb.tcp_sendmsg.inet_sendmsg.do_sock_sendm=
sg
      1796 =C2=B1  7%     +16.9%       2101 =C2=B1  3%  sched_debug.cpu#20.=
curr->pid
     52803 =C2=B1  8%      -9.1%      48004 =C2=B1  2%  sched_debug.cpu#22.=
ttwu_count
    121926 =C2=B1  3%      -7.3%     113073 =C2=B1  3%  sched_debug.cpu#27.=
nr_switches
    122808 =C2=B1  3%      -7.8%     113235 =C2=B1  3%  sched_debug.cpu#27.=
sched_count
    121572 =C2=B1  5%      -7.1%     112948 =C2=B1  2%  sched_debug.cpu#46.=
nr_switches
     39590 =C2=B1  3%      -6.3%      37095 =C2=B1  4%  sched_debug.cpu#43.=
ttwu_local
     18366 =C2=B1  0%      -5.0%      17440 =C2=B1  0%  vmstat.system.cs
     70241 =C2=B1  0%      -2.8%      68273 =C2=B1  0%  vmstat.system.in

lkp-sbx04: Sandy Bridge-EX
Memory: 64G




                                time.minor_page_faults

  5.5e+06 ++---------------------------------------------------------------=
-+
    5e+06 ++                                                       O O OO O=
 O
          |                                                                =
 |
  4.5e+06 ++                                                               =
 |
    4e+06 ++                                                               =
 |
  3.5e+06 ++                                                               =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
    2e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 O+O.O.OO.O.O.O.O.OO.O.O.O.O.OO.O.O.O.O.OO.O.O.O.O OO O O         =
 |
        0 ++---------------------------------------------------------------=
-+


                            netperf.time.minor_page_faults

  5.5e+06 ++---------------------------------------------------------------=
-+
    5e+06 ++                                                       O O OO O=
 O
          |                                                                =
 |
  4.5e+06 ++                                                               =
 |
    4e+06 ++                                                               =
 |
  3.5e+06 ++                                                               =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
    2e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 O+O.O.OO.O.O.O.O.OO.O.O.O.O.OO.O.O.O.O.OO.O.O.O.O OO O O         =
 |
        0 ++---------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
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
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============7207006217079250098==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBuZXRwZXJmCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QK
ICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1h
LXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAK
ICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBs
YXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3Rh
dHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3Rh
dDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0X3dh
dGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVy
Zm9ybWFuY2UKY29tbWl0OiA1YWViMmEzZGM0ZjBlYTQ3ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMz
Cm1vZGVsOiBTYW5keSBCcmlkZ2UtRVgKbnJfY3B1OiA2NAptZW1vcnk6IDY0Rwpucl9zc2RfcGFy
dGl0aW9uczogNApzc2RfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtSU5URUxfU1NE
U0MyQ1cyNDBBM19DVkNWMjA0MzAqLXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6IApydW50aW1lOiA5
MDBzCm5yX3RocmVhZHM6IDIwMCUKcGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMApuZXRwZXJmOgog
IHRlc3Q6IFRDUF9NQUVSVFMKdGVzdGJveDogbGtwLXNieDA0CnRib3hfZ3JvdXA6IGxrcC1zYngw
NAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDItMTYgMTE6MTc6MDEu
MDQyNjUwODM2ICswODowMApoZWFkX2NvbW1pdDogNWFlYjJhM2RjNGYwZWE0N2ZlMGRmM2NiM2Fm
NzVlZjgxM2RkYTgzMwpiYXNlX2NvbW1pdDogYmZhNzZkNDk1NzY1OTlhNGI5ZjliN2E3MWYyM2Q3
M2Q2ZGNmZjczNQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDIxNjIzCmtl
cm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvNWFlYjJhM2RjNGYwZWE0N2ZlMGRmM2NiM2FmNzVl
ZjgxM2RkYTgzMy92bWxpbnV6LTMuMTkuMC13bC1hdGgtMDIzMDUtZzVhZWIyYTMiCnVzZXI6IGxr
cApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1
bHRfcm9vdDogIi9yZXN1bHQvbGtwLXNieDA0L25ldHBlcmYvcGVyZm9ybWFuY2UtOTAwcy0yMDAl
LVRDUF9NQUVSVFMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC81YWVi
MmEzZGM0ZjBlYTQ3ZmUwZGYzY2IzYWY3NWVmODEzZGRhODMzLzAiCmpvYl9maWxlOiAiL2xrcC9z
Y2hlZHVsZWQvbGtwLXNieDA0L2N5Y2xpY19uZXRwZXJmLXBlcmZvcm1hbmNlLTkwMHMtMjAwJS1U
Q1BfTUFFUlRTLXg4Nl82NC1yaGVsLUhFQUQtNWFlYjJhM2RjNGYwZWE0N2ZlMGRmM2NiM2FmNzVl
ZjgxM2RkYTgzMy0wLTIwMTUwMjE2LTkzMjA2LTFzZjkxMmMueWFtbCIKZGVxdWV1ZV90aW1lOiAy
MDE1LTAyLTE3IDA2OjA2OjA0LjA5NTIwNjA4MyArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZAps
b2FkYXZnOiAxMDguMjggMTQzLjI3IDk4LjkzIDEvNTc4IDIxMTkyCnN0YXJ0X3RpbWU6ICcxNDI0
MTI0NDIzJwplbmRfdGltZTogJzE0MjQxMjUzMjUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTUwMjE2LTE2MjA0MCIK

--===============7207006217079250098==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bmV0c2VydmVyCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBU
Q1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAw
Cm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRT
IC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYg
LXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1s
IDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01B
RVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRw
ZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAt
QyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRD
UF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAK
bmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMg
LWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAt
dCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwg
OTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFF
UlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBl
cmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1D
IC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQ
X01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApu
ZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAt
YyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10
IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5
MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVS
VFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVy
ZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMg
LWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1Bf
TUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5l
dHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1j
IC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQg
VENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkw
MApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJU
UyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJm
IC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAt
bCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9N
QUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0
cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMg
LUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBU
Q1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAw
Cm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRT
IC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYg
LXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1s
IDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01B
RVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRw
ZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAt
QyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRD
UF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAK
bmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMg
LWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAt
dCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwg
OTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFF
UlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBl
cmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1D
IC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQ
X01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApu
ZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAt
YyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10
IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5
MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVS
VFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVy
ZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMg
LWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1Bf
TUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5l
dHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1j
IC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQg
VENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkw
MApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJU
UyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJm
IC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAt
bCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9N
QUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0
cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMg
LUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBU
Q1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAw
Cm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRT
IC1jIC1DIC1sIDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYg
LXQgVENQX01BRVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1s
IDkwMApuZXRwZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01B
RVJUUyAtYyAtQyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMApuZXRw
ZXJmIC10IFRDUF9NQUVSVFMgLWMgLUMgLWwgOTAwCm5ldHBlcmYgLXQgVENQX01BRVJUUyAtYyAt
QyAtbCA5MDAKbmV0cGVyZiAtdCBUQ1BfTUFFUlRTIC1jIC1DIC1sIDkwMAo=

--===============7207006217079250098==--

