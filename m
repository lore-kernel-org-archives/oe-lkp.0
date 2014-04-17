Content-Type: multipart/mixed; boundary="===============8487693346609141045=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [net/sctp] 362d52040c7: +99.0% netperf.Throughput_Mbps
Date: Thu, 17 Apr 2014 11:39:03 +0800
Message-ID: <20140417033903.GC8702@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8487693346609141045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

We noticed the same improvements in netperf SCTP_STREAM test case
as described in your patch changelog.

commit 362d52040c71f6e8d8158be48c812d7729cb8df1 ("Revert "net: sctp: Fix a_=
rwnd/rwnd management to reflect real state of the receiver's buffer"")

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      2.14 ~ 0%     +98.9%       4.25 ~ 0%  kbuildx/micro/netperf/300s-200%=
-SCTP_STREAM
      2.14 ~ 0%     +99.1%       4.25 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      2.14 ~ 0%     +99.0%       4.25 ~ 0%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      6.41 ~ 0%     +99.0%      12.76 ~ 0%  TOTAL netperf.Throughput_Mbps

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      2.67 ~26%    -100.0%       0.00 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      0.92 ~27%    -100.0%       0.00 ~ 0%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      3.59 ~26%    -100.0%       0.00 ~ 0%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.skb_copy_datagram_iovec.skb_copy_datagram_iovec.sct=
p_recvmsg.sock_common_recvmsg

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      8.75 ~32%     -80.4%       1.72 ~21%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      8.75 ~32%     -80.4%       1.72 ~21%  TOTAL perf-profile.cpu-cycles.s=
ctp_packet_transmit.sctp_outq_flush.sctp_outq_uncork.sctp_cmd_interpreter.s=
ctp_do_sm

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      0.00           +Inf%       1.22 ~22%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      0.00           +Inf%       1.43 ~22%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      0.00           +Inf%       2.65 ~22%  TOTAL perf-profile.cpu-cycles.s=
ctp_packet_transmit.sctp_packet_transmit_chunk.sctp_outq_flush.sctp_outq_un=
cork.sctp_cmd_interpreter

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      6.26 ~13%    +306.9%      25.46 ~26%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      6.26 ~13%    +306.9%      25.46 ~26%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.clockevents_notify.intel_idle.cpuidle_enter_state.cpu=
idle_enter

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

       966 ~45%     -44.6%        535 ~29%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
       966 ~45%     -44.6%        535 ~29%  TOTAL cpuidle.C1-NHM.time

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      0.45 ~33%    +165.0%       1.20 ~14%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      0.48 ~37%    +235.3%       1.62 ~12%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      0.93 ~35%    +201.3%       2.81 ~13%  TOTAL perf-profile.cpu-cycles.s=
kb_copy_bits.skb_copy.sctp_make_reassembled_event.sctp_ulpq_tail_data.sctp_=
cmd_interpreter

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      0.80 ~32%     -56.1%       0.35 ~38%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      0.80 ~32%     -56.1%       0.35 ~38%  TOTAL perf-profile.cpu-cycles.m=
enu_select.cpuidle_select.cpu_startup_entry.start_secondary

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      5.08 ~26%     -58.3%       2.12 ~21%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      1.34 ~27%    +112.1%       2.85 ~ 9%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      6.43 ~26%     -22.7%       4.97 ~14%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.skb_copy_datagram_iovec.sctp_recvmsg.sock_common_re=
cvmsg.sock_recvmsg

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      0.72 ~41%     +69.4%       1.22 ~25%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      0.72 ~41%     +69.4%       1.22 ~25%  TOTAL perf-profile.cpu-cycles.u=
nmap_single_vma.unmap_vmas.exit_mmap.mmput.do_exit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    916917 ~ 0%     +79.9%    1649300 ~ 0%  kbuildx/micro/netperf/300s-200%=
-SCTP_STREAM
  12832444 ~ 1%    +115.7%   27683375 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
  13749362 ~ 0%    +113.3%   29332676 ~ 0%  TOTAL proc-vmstat.pgalloc_normal

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

   1175423 ~ 0%     +79.7%    2111948 ~ 0%  kbuildx/micro/netperf/300s-200%=
-SCTP_STREAM
  12997556 ~ 0%    +115.4%   27996526 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
   1181153 ~ 0%     +79.3%    2118015 ~ 0%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
  15354133 ~ 0%    +109.9%   32226491 ~ 0%  TOTAL proc-vmstat.pgfree

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    257597 ~ 0%     +79.3%     461743 ~ 0%  kbuildx/micro/netperf/300s-200%=
-SCTP_STREAM
   1179621 ~ 0%     +79.4%    2116528 ~ 0%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
   1437218 ~ 0%     +79.4%    2578271 ~ 0%  TOTAL proc-vmstat.pgalloc_dma32

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    138767 ~ 3%    +102.3%     280793 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
     12422 ~ 1%     +46.0%      18142 ~ 2%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
    151189 ~ 3%     +97.7%     298935 ~ 0%  TOTAL softirqs.NET_RX

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      2.37 ~18%     +78.7%       4.23 ~14%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      2.37 ~18%     +78.7%       4.23 ~14%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.tick_broadcast_oneshot_control.clockevents_notify.int=
el_idle.cpuidle_enter_state

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    386789 ~27%     +43.0%     553161 ~ 6%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    386789 ~27%     +43.0%     553161 ~ 6%  TOTAL numa-numastat.node0.local=
_node

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    388443 ~28%     +42.8%     554814 ~ 6%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    388443 ~28%     +42.8%     554814 ~ 6%  TOTAL numa-numastat.node0.numa_=
hit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

     14.18 ~24%     -32.9%       9.52 ~16%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      3.43 ~26%     +54.6%       5.30 ~20%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
     17.60 ~24%     -15.8%      14.82 ~17%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.sctp_user_addto_chunk.sctp_datamsg_from_user.sctp_s=
endmsg.inet_sendmsg

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    393446 ~24%     +40.0%     550772 ~ 3%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    393446 ~24%     +40.0%     550772 ~ 3%  TOTAL numa-numastat.node2.local=
_node

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    397581 ~23%     +39.6%     554907 ~ 3%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    397581 ~23%     +39.6%     554907 ~ 3%  TOTAL numa-numastat.node2.numa_=
hit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      0.79 ~ 4%     +42.7%       1.13 ~ 3%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      0.79 ~ 4%     +42.7%       1.13 ~ 3%  TOTAL turbostat.%c1

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    357508 ~ 9%     +42.9%     510964 ~ 8%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    357508 ~ 9%     +42.9%     510964 ~ 8%  TOTAL numa-numastat.node1.numa_=
hit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    355027 ~ 9%     +43.0%     507656 ~ 7%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    355027 ~ 9%     +43.0%     507656 ~ 7%  TOTAL numa-numastat.node1.local=
_node

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    298703 ~12%     +27.8%     381632 ~ 4%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    298703 ~12%     +27.8%     381632 ~ 4%  TOTAL numa-vmstat.node2.numa_lo=
cal

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

   1513199 ~ 0%     +39.1%    2105308 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
   1513199 ~ 0%     +39.1%    2105308 ~ 0%  TOTAL proc-vmstat.numa_local

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

   1525603 ~ 0%     +38.8%    2117713 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
   1525603 ~ 0%     +38.8%    2117713 ~ 0%  TOTAL proc-vmstat.numa_hit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    320874 ~14%     +24.8%     400369 ~ 4%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    320874 ~14%     +24.8%     400369 ~ 4%  TOTAL numa-vmstat.node0.numa_lo=
cal

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    323017 ~ 1%     +32.8%     428933 ~ 1%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    323017 ~ 1%     +32.8%     428933 ~ 1%  TOTAL cpuidle.C3-NHM.usage

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    386570 ~ 9%     +21.4%     469471 ~ 3%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    386570 ~ 9%     +21.4%     469471 ~ 3%  TOTAL numa-vmstat.node2.numa_hit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    380244 ~12%     +20.9%     459829 ~ 3%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    380244 ~12%     +20.9%     459829 ~ 3%  TOTAL numa-vmstat.node0.numa_hit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    352316 ~ 4%     +19.9%     422485 ~ 5%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    352316 ~ 4%     +19.9%     422485 ~ 5%  TOTAL numa-vmstat.node1.numa_lo=
cal

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    380978 ~ 4%     +18.6%     451706 ~ 5%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    380978 ~ 4%     +18.6%     451706 ~ 5%  TOTAL numa-vmstat.node1.numa_hit

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    119700 ~ 2%     +18.6%     141993 ~ 1%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    119700 ~ 2%     +18.6%     141993 ~ 1%  TOTAL softirqs.SCHED

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

     45876 ~ 4%      -7.9%      42242 ~ 7%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
     45876 ~ 4%      -7.9%      42242 ~ 7%  TOTAL numa-meminfo.node0.AnonPa=
ges

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

     11467 ~ 4%      -7.9%      10559 ~ 7%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
     11467 ~ 4%      -7.9%      10559 ~ 7%  TOTAL numa-vmstat.node0.nr_anon=
_pages

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    184229 ~ 1%     +14.4%     210833 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    184229 ~ 1%     +14.4%     210833 ~ 0%  TOTAL softirqs.TIMER

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

       347 ~ 5%    +140.0%        834 ~10%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
       347 ~ 5%    +140.0%        834 ~10%  TOTAL interrupts.98:PCI-MSI-edg=
e.eth0-TxRx-0

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      9125 ~ 4%     +59.8%      14585 ~13%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      9125 ~ 4%     +59.8%      14585 ~13%  TOTAL interrupts.RES

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

       338 ~ 6%     +15.8%        392 ~ 4%  kbuildx/micro/netperf/300s-200%=
-SCTP_STREAM
      1830 ~ 0%     +71.2%       3135 ~ 0%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
       352 ~ 0%     +20.5%        425 ~ 1%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      2522 ~ 1%     +56.7%       3952 ~ 1%  TOTAL vmstat.system.cs

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

    171971 ~ 3%     +29.8%     223248 ~ 1%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
    171971 ~ 3%     +29.8%     223248 ~ 1%  TOTAL interrupts.LOC

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

       839 ~ 3%     +24.4%       1044 ~ 1%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
       839 ~ 3%     +24.4%       1044 ~ 1%  TOTAL vmstat.system.in

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      8197 ~11%     +32.2%      10835 ~ 7%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      1043 ~ 0%     +15.2%       1202 ~ 3%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      9241 ~ 9%     +30.3%      12037 ~ 7%  TOTAL interrupts.PMI

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      8197 ~11%     +32.2%      10835 ~ 7%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      1043 ~ 0%     +15.2%       1202 ~ 3%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      9241 ~ 9%     +30.3%      12037 ~ 7%  TOTAL interrupts.NMI

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

      0.73 ~ 4%     +20.5%       0.88 ~ 6%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
      0.94 ~ 0%     +14.4%       1.08 ~ 1%  lkp-t410/micro/netperf/300s-200=
%-SCTP_STREAM
      1.67 ~ 2%     +17.1%       1.96 ~ 3%  TOTAL turbostat.%c0

bfae23249955819  362d52040c71f6e8d8158be48  =

---------------  -------------------------  =

     17709 ~ 2%      -4.1%      16985 ~ 1%  lkp-nex04/micro/netperf/300s-20=
0%-SCTP_STREAM
     17709 ~ 2%      -4.1%      16985 ~ 1%  TOTAL interrupts.IWI


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                              netperf.Throughput_Mbps

   4.5 ++------------------------------------------------------------------=
-+
       O  O O  O O  O O  O O  O  O O  O O  O O  O O  O  O O  O O  O O  O   =
 |
       |                                                                   =
 |
     4 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
   3.5 ++                                                                  =
 |
       |                                                                   =
 |
     3 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
   2.5 ++                                                                  =
 |
       |                                                                   =
 |
       *..*.*..*.*..*.*..*.*..*..*.*..*.*..*.*..*.*..*..*.*..*.*..*.*..*.*.=
.*
     2 ++------------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

Thanks,
Fengguang

--===============8487693346609141045==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bmV0c2VydmVyCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU0gLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQg
U0NUUF9TVFJFQU0gLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU0gLWMgLUMgLWwg
MzAwCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU0gLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgU0NUUF9T
VFJFQU0gLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU0gLWMgLUMgLWwgMzAwCm5l
dHBlcmYgLXQgU0NUUF9TVFJFQU0gLWMgLUMgLWwgMzAwCm5ldHBlcmYgLXQgU0NUUF9TVFJFQU0g
LWMgLUMgLWwgMzAwCg==

--===============8487693346609141045==--

