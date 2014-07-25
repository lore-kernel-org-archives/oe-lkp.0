Content-Type: multipart/mixed; boundary="===============6903489702843123064=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: [sched] cfe48d5b416: +82.2% ebizzy.throughput.per_thread.stddev_percent
Date: Fri, 25 Jul 2014 16:15:07 +0800
Message-ID: <53D2120B.2040007@intel.com>
In-Reply-To: <53d2107b.Y4DlDtxtf94Eji1h%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6903489702843123064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v4-on-3.16-rc3
commit cfe48d5b416f8a3f5c45164cf350b42a6ef397b7 ("sched: Rewrite per entity=
 runnable load average tracking")

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.08 ~ 3%     +82.2%       0.14 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      0.08 ~ 3%     +82.2%       0.14 ~ 5%  TOTAL ebizzy.throughput.per_thr=
ead.stddev_percent

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    153533 ~ 2%     +65.0%     253355 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    152059 ~ 0%      +1.9%     154948 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    174164 ~ 2%     +22.1%     212579 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     94656 ~ 0%      +4.1%      98501 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
     87638 ~ 0%     +77.6%     155606 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     89973 ~ 0%      +3.6%      93205 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
     80042 ~ 0%     +84.5%     147645 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    832068 ~ 1%     +34.1%    1115843 ~ 0%  TOTAL hackbench.throughput

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       124 ~ 0%     +28.4%        159 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
       124 ~ 0%     +28.4%        159 ~ 1%  TOTAL ebizzy.throughput.per_thr=
ead.max

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     15321 ~ 1%      +6.8%      16370 ~ 2%  lkp-sb03/nepim/300s-25%-udp6
     15321 ~ 1%      +6.8%      16370 ~ 2%  TOTAL nepim.udp.avg.snd_s

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    502056 ~ 1%      +6.8%     536440 ~ 2%  lkp-sb03/nepim/300s-25%-udp6
    502056 ~ 1%      +6.8%     536440 ~ 2%  TOTAL nepim.udp.avg.kbps_out

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        77 ~ 1%      -6.9%         72 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
        77 ~ 1%      -6.9%         72 ~ 1%  TOTAL ebizzy.throughput.per_thr=
ead.min

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      4274 ~ 0%      +2.8%       4393 ~ 0%  lkp-sb03/nepim/300s-100%-udp
      3854 ~ 0%      +4.9%       4042 ~ 4%  lkp-sb03/nepim/300s-100%-udp6
     15309 ~ 1%      +6.1%      16246 ~ 2%  lkp-sb03/nepim/300s-25%-udp6
     23438 ~ 1%      +5.3%      24682 ~ 2%  TOTAL nepim.udp.avg.rcv_s

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    140076 ~ 0%      +2.8%     143971 ~ 0%  lkp-sb03/nepim/300s-100%-udp
    126302 ~ 0%      +4.9%     132471 ~ 4%  lkp-sb03/nepim/300s-100%-udp6
    501648 ~ 1%      +6.1%     532350 ~ 2%  lkp-sb03/nepim/300s-25%-udp6
    768027 ~ 1%      +5.3%     808793 ~ 2%  TOTAL nepim.udp.avg.kbps_in

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     45897 ~ 0%      +1.7%      46658 ~ 0%  lkp-sb03/nuttcp/300s
     45897 ~ 0%      +1.7%      46658 ~ 0%  TOTAL nuttcp.throughput_Mbps

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2679 ~ 0%      -1.5%       2639 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
      2679 ~ 0%      -1.5%       2639 ~ 1%  TOTAL nepim.tcp.avg.snd_s

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    702354 ~ 0%      -1.5%     691824 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
    702354 ~ 0%      -1.5%     691824 ~ 1%  TOTAL nepim.tcp.avg.kbps_out

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    702188 ~ 0%      -1.5%     691663 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
    702188 ~ 0%      -1.5%     691663 ~ 1%  TOTAL nepim.tcp.avg.kbps_in

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2678 ~ 0%      -1.5%       2638 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
      2678 ~ 0%      -1.5%       2638 ~ 1%  TOTAL nepim.tcp.avg.rcv_s

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     40.91 ~ 0%      -1.2%      40.42 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     40.91 ~ 0%      -1.2%      40.42 ~ 0%  TOTAL ebizzy.time.user

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     12763 ~ 0%      -1.2%      12615 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     12763 ~ 0%      -1.2%      12615 ~ 0%  TOTAL ebizzy.throughput

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.10 ~46%     -81.5%       0.20 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.10 ~46%     -81.5%       0.20 ~16%  TOTAL perf-profile.cpu-cycles.t=
ry_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_comm=
on.__wake_up_sync_key

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6.73 ~ 2%     -83.3%       1.12 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      6.54 ~ 1%     -80.7%       1.26 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
     13.27 ~ 2%     -82.0%       2.39 ~ 3%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_stream_send=
msg.sock_aio_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3454 ~ 1%     -86.3%        475 ~14%  lkp-nex04/ebizzy/200%-100x-10s
      3454 ~ 1%     -86.3%        475 ~14%  TOTAL proc-vmstat.thp_fault_all=
oc

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1202 ~ 7%     -81.9%        217 ~17%  lkp-nex04/ebizzy/200%-100x-10s
     63019 ~ 0%     -99.5%        291 ~32%  lkp-sb03/nepim/300s-100%-tcp
     62951 ~ 0%     -99.8%        156 ~39%  lkp-sb03/nepim/300s-100%-tcp6
     63162 ~ 0%     -99.3%        415 ~38%  lkp-sb03/nepim/300s-100%-udp
     62963 ~ 0%     -99.4%        401 ~21%  lkp-sb03/nepim/300s-100%-udp6
     62944 ~ 0%     -99.6%        256 ~27%  lkp-sb03/nepim/300s-25%-tcp
     63190 ~ 0%     -99.5%        304 ~42%  lkp-sb03/nepim/300s-25%-tcp6
     62976 ~ 0%     -99.7%        174 ~13%  lkp-sb03/nepim/300s-25%-udp
     63128 ~ 0%     -99.6%        252 ~38%  lkp-sb03/nepim/300s-25%-udp6
     63366 ~ 0%     -99.4%        385 ~26%  lkp-sb03/nuttcp/300s
     66426 ~ 0%     -99.5%        333 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     63814 ~ 2%     -93.7%       3997 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
    699145 ~ 0%     -99.0%       7184 ~14%  TOTAL numa-vmstat.node0.numa_ot=
her

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     15005 ~ 0%    +418.1%      77748 ~ 0%  lkp-sb03/nepim/300s-100%-tcp
     14977 ~ 0%    +420.0%      77881 ~ 0%  lkp-sb03/nepim/300s-100%-tcp6
     15018 ~ 0%    +416.8%      77618 ~ 0%  lkp-sb03/nepim/300s-100%-udp
     14850 ~ 1%    +423.4%      77730 ~ 0%  lkp-sb03/nepim/300s-100%-udp6
     15071 ~ 1%    +415.0%      77626 ~ 0%  lkp-sb03/nepim/300s-25%-tcp
     14748 ~ 1%    +426.9%      77711 ~ 0%  lkp-sb03/nepim/300s-25%-tcp6
     15131 ~ 1%    +414.4%      77837 ~ 0%  lkp-sb03/nepim/300s-25%-udp
     14967 ~ 0%    +418.4%      77597 ~ 0%  lkp-sb03/nepim/300s-25%-udp6
     14763 ~ 0%    +425.2%      77542 ~ 0%  lkp-sb03/nuttcp/300s
      9740 ~19%    +650.5%      73099 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      8157 ~ 0%    +812.6%      74440 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     10511 ~12%    +588.3%      72344 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     10802 ~17%    +553.8%      70627 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      8509 ~ 3%    +762.0%      73347 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      9348 ~17%    +682.7%      73163 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
     10550 ~16%    +592.4%      73053 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
    202152 ~ 4%    +498.2%    1209368 ~ 0%  TOTAL numa-vmstat.node1.numa_ot=
her

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

         1         -100.0%          0       brickland1/boot/1
         1         -100.0%          0       TOTAL last_state.is_incomplete_=
run

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        31 ~ 0%    +378.7%        148 ~15%  lkp-nex04/ebizzy/200%-100x-10s
        31 ~ 0%    +433.3%        165 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-socket
        31 ~ 0%    +398.9%        154 ~16%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
        93 ~ 0%    +403.7%        468 ~13%  TOTAL slabinfo.nfs_inode_cache.=
active_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        31 ~ 0%    +378.7%        148 ~15%  lkp-nex04/ebizzy/200%-100x-10s
        31 ~ 0%    +433.3%        165 ~ 8%  lkp-snb01/hackbench/1600%-proce=
ss-socket
        31 ~ 0%    +398.9%        154 ~16%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
        93 ~ 0%    +403.7%        468 ~13%  TOTAL slabinfo.nfs_inode_cache.=
num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       286 ~31%    -100.0%          0 ~ 0%  lkp-sb03/nepim/300s-100%-udp6
     66825 ~12%    -100.0%          0 ~ 0%  lkp-sb03/thrulay/300s
       242 ~37%    +341.2%       1070 ~24%  lkp-snb01/hackbench/50%-process=
-socket
     67354 ~12%     -98.4%       1070 ~24%  TOTAL cpuidle.C6-SNB.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        11 ~36%    -100.0%          0 ~ 0%  lkp-sb03/nepim/300s-100%-tcp6
         2 ~20%    -100.0%          0 ~ 0%  lkp-sb03/nepim/300s-100%-udp6
        44 ~12%    -100.0%          0 ~ 0%  lkp-sb03/thrulay/300s
        58 ~17%    -100.0%          0 ~ 0%  TOTAL cpuidle.C6-SNB.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        28 ~20%    +141.9%         69 ~24%  lkp-sb03/thrulay/300s
      4196 ~ 0%     -99.9%          6 ~49%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      4225 ~ 0%     -98.2%         75 ~26%  TOTAL numa-numastat.node0.other=
_node

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.80 ~ 1%     -84.0%       0.29 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
      1.08 ~ 1%     -72.8%       0.29 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      2.88 ~ 1%     -79.8%       0.58 ~ 6%  TOTAL perf-profile.cpu-cycles._=
_schedule.schedule.schedule_timeout.unix_stream_recvmsg.sock_aio_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        21 ~47%    +235.9%         71 ~ 6%  lkp-sb03/nepim/300s-100%-tcp6
        10 ~48%    +390.0%         49 ~32%  lkp-sb03/nepim/300s-25%-tcp6
        30 ~48%    +162.2%         78 ~27%  lkp-sb03/thrulay/300s
        61 ~48%    +225.0%        199 ~21%  TOTAL numa-numastat.node1.other=
_node

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.21 ~18%     -69.1%       0.37 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.21 ~18%     -69.1%       0.37 ~14%  TOTAL perf-profile.cpu-cycles._=
_switch_to.__read_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.29 ~29%     -49.7%       0.65 ~28%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.83 ~47%     -55.8%       0.37 ~30%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.38 ~ 7%    -100.0%       0.00 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      1.56 ~ 6%     -82.0%       0.28 ~ 7%  lkp-snb01/hackbench/50%-threads=
-socket
      5.05 ~19%     -74.4%       1.29 ~24%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_function=
.__wake_up_common

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.30 ~ 1%    +140.8%       0.73 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      0.30 ~ 1%    +140.8%       0.73 ~ 3%  TOTAL turbostat.%c3

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.83 ~14%     -87.1%       0.11 ~19%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.50 ~ 3%     +97.3%       0.98 ~13%  lkp-snb01/hackbench/50%-process=
-pipe
      1.33 ~10%     -18.1%       1.09 ~13%  TOTAL perf-profile.cpu-cycles._=
_schedule.schedule_user.sysret_careful.__write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

   1651079 ~38%     -64.9%     579633 ~29%  lkp-sb03/thrulay/300s
   2671709 ~14%     -51.0%    1309182 ~23%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   2658121 ~15%     -57.5%    1129334 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    647488 ~ 2%     -58.8%     266863 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
   2237049 ~ 0%    +859.5%   21463678 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
    708689 ~12%     -74.1%     183252 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
   1983795 ~ 9%   +1089.3%   23593446 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
  12557931 ~13%    +286.4%   48525391 ~ 2%  TOTAL cpuidle.C3-SNB.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3.04 ~ 4%     -71.9%       0.85 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3.16 ~ 2%     -78.2%       0.69 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      0.72 ~ 3%     -58.1%       0.30 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.90 ~ 2%     -63.3%       0.33 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      7.82 ~ 3%     -72.2%       2.17 ~ 4%  TOTAL turbostat.%c7

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

  10916426 ~29%     +93.5%   21121509 ~11%  lkp-sb03/nepim/300s-100%-tcp
  16988964 ~39%    +192.6%   49707033 ~21%  lkp-sb03/nepim/300s-25%-udp
    748822 ~41%    +253.6%    2648151 ~36%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      5975 ~ 2%     -79.1%       1246 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
  28660188 ~35%    +156.4%   73477940 ~19%  TOTAL cpuidle.POLL.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     19745 ~ 0%     -79.7%       4001 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     23807 ~ 3%     -33.1%      15931 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     17385 ~ 0%     -81.2%       3275 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
     21297 ~ 0%     -25.3%      15917 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     82234 ~ 1%     -52.4%      39125 ~ 1%  TOTAL softirqs.HRTIMER

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.19 ~21%     -52.1%       0.57 ~30%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      2.95 ~ 0%     +33.6%       3.94 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      1.52 ~ 6%     -84.2%       0.24 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
      2.98 ~ 1%     +36.4%       4.06 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.54 ~ 5%     -75.3%       0.38 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
     10.18 ~ 4%      -9.7%       9.19 ~ 5%  TOTAL perf-profile.cpu-cycles.i=
dle_cpu.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremove=
_wake_function

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       199 ~14%    +620.4%       1438 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       180 ~11%    +181.3%        506 ~15%  lkp-sb03/nepim/300s-100%-tcp
       171 ~12%    +210.9%        531 ~ 3%  lkp-sb03/nepim/300s-100%-tcp6
       208 ~18%    +197.0%        617 ~ 9%  lkp-sb03/nepim/300s-100%-udp
       191 ~19%    +212.2%        598 ~ 8%  lkp-sb03/nepim/300s-100%-udp6
       223 ~25%    +127.7%        509 ~ 8%  lkp-sb03/nepim/300s-25%-tcp
       166 ~15%    +225.5%        541 ~ 4%  lkp-sb03/nepim/300s-25%-tcp6
       176 ~18%    +217.7%        561 ~15%  lkp-sb03/nepim/300s-25%-udp
       159 ~25%    +309.6%        651 ~ 1%  lkp-sb03/nepim/300s-25%-udp6
       181 ~15%    +279.0%        687 ~12%  lkp-sb03/nuttcp/300s
       237 ~21%    +120.3%        522 ~16%  lkp-sb03/thrulay/300s
       271 ~ 8%    +138.9%        649 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       271 ~22%    +111.4%        573 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       197 ~ 7%    +181.2%        554 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       178 ~23%    +284.8%        685 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       316 ~13%     +98.5%        627 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
       254 ~13%    +170.2%        687 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
       252 ~10%    +135.3%        593 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
       256 ~31%    +174.3%        702 ~11%  lkp-snb01/hackbench/50%-threads=
-socket
      4091 ~17%    +199.1%      12237 ~ 9%  TOTAL slabinfo.nfs_read_data.nu=
m_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       199 ~14%    +620.4%       1438 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       180 ~11%    +181.3%        506 ~15%  lkp-sb03/nepim/300s-100%-tcp
       171 ~12%    +210.9%        531 ~ 3%  lkp-sb03/nepim/300s-100%-tcp6
       208 ~18%    +197.0%        617 ~ 9%  lkp-sb03/nepim/300s-100%-udp
       191 ~19%    +212.2%        598 ~ 8%  lkp-sb03/nepim/300s-100%-udp6
       223 ~25%    +127.7%        509 ~ 8%  lkp-sb03/nepim/300s-25%-tcp
       166 ~15%    +225.5%        541 ~ 4%  lkp-sb03/nepim/300s-25%-tcp6
       176 ~18%    +217.7%        561 ~15%  lkp-sb03/nepim/300s-25%-udp
       159 ~25%    +309.6%        651 ~ 1%  lkp-sb03/nepim/300s-25%-udp6
       181 ~15%    +279.0%        687 ~12%  lkp-sb03/nuttcp/300s
       237 ~21%    +120.3%        522 ~16%  lkp-sb03/thrulay/300s
       271 ~ 8%    +138.9%        649 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       271 ~22%    +111.4%        573 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       197 ~ 7%    +181.2%        554 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       178 ~23%    +284.8%        685 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       316 ~13%     +98.5%        627 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
       254 ~13%    +170.2%        687 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
       252 ~10%    +135.3%        593 ~15%  lkp-snb01/hackbench/50%-threads=
-pipe
       256 ~31%    +174.3%        702 ~11%  lkp-snb01/hackbench/50%-threads=
-socket
      4091 ~17%    +199.1%      12237 ~ 9%  TOTAL slabinfo.nfs_read_data.ac=
tive_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      5062 ~ 1%     +22.0%       6174 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
     34696 ~23%    +331.8%     149823 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     11167 ~30%   +1170.7%     141901 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     12829 ~46%   +1273.3%     176184 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8640 ~ 0%     +63.9%      14164 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      8832 ~ 0%     +56.3%      13801 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      8763 ~ 1%     +70.2%      14918 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      8937 ~ 3%     +61.0%      14387 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
     98928 ~18%    +437.1%     531356 ~ 5%  TOTAL numa-meminfo.node0.Kernel=
Stack

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       315 ~ 1%     +22.2%        386 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      2182 ~27%    +331.0%       9406 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       689 ~29%   +1195.1%       8923 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       763 ~41%   +1366.6%      11200 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       539 ~ 0%     +64.3%        886 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
       551 ~ 0%     +56.4%        862 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
       547 ~ 1%     +70.4%        932 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
       558 ~ 3%     +61.0%        898 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      6147 ~18%    +444.9%      33495 ~ 5%  TOTAL numa-vmstat.node0.nr_kern=
el_stack

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

  14763662 ~22%    +224.1%   47849986 ~ 0%  lkp-sb03/nepim/300s-100%-tcp
   1480018 ~27%    +459.2%    8276231 ~40%  lkp-sb03/nepim/300s-100%-udp
   2915323 ~36%    +101.6%    5876341 ~25%  lkp-sb03/nepim/300s-100%-udp6
  75125252 ~10%    +213.4%  2.354e+08 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  82596524 ~ 8%    +460.9%  4.633e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  21297770 ~ 5%     -26.5%   15663204 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  31587170 ~ 6%     -29.5%   22263279 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  71953061 ~ 2%     -72.4%   19859358 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
  96289114 ~ 0%     -16.7%   80250915 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
  73806483 ~ 5%     -71.4%   21092902 ~10%  lkp-snb01/hackbench/50%-threads=
-pipe
 1.036e+08 ~ 3%     -16.6%   86421555 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
 5.754e+08 ~ 5%     +74.9%  1.006e+09 ~ 2%  TOTAL cpuidle.C1E-SNB.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2.85 ~35%     -74.9%       0.72 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.92 ~13%     -50.2%       0.46 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      2.92 ~ 1%     +23.9%       3.62 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      6.69 ~17%     -28.3%       4.80 ~ 6%  TOTAL perf-profile.cpu-cycles._=
_schedule.schedule.pipe_wait.pipe_read.new_sync_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3929 ~25%     -62.0%       1492 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      3912 ~22%     -73.8%       1025 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      7842 ~23%     -67.9%       2517 ~11%  TOTAL numa-meminfo.node1.AnonHu=
gePages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     38.25 ~ 4%     -12.8%      33.36 ~ 7%  lkp-sb03/nepim/300s-25%-tcp
      0.48 ~43%    +317.2%       2.02 ~44%  lkp-sb03/nepim/300s-25%-udp6
     25.16 ~13%     -45.3%      13.76 ~16%  lkp-sb03/thrulay/300s
     63.89 ~ 7%     -23.1%      49.14 ~11%  TOTAL turbostat.%pc2

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

 8.158e+08 ~ 3%     -51.4%  3.968e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 9.392e+08 ~ 2%     -66.3%  3.164e+08 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
 2.327e+08 ~ 3%     -44.6%   1.29e+08 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
 3.969e+08 ~ 4%     -65.8%  1.357e+08 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  42048728 ~ 1%     -12.3%   36887906 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
  62765988 ~ 1%    +380.1%  3.013e+08 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
  32303805 ~ 3%     -14.2%   27707031 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
  52109921 ~ 3%    +506.8%  3.162e+08 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
 2.574e+09 ~ 2%     -35.5%   1.66e+09 ~ 1%  TOTAL cpuidle.C7-SNB.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    207297 ~ 1%     +12.2%     232664 ~ 0%  lkp-sb03/nepim/300s-100%-tcp6
     44562 ~ 7%     +50.0%      66834 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    153401 ~22%     -42.3%      88566 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    152044 ~ 5%     -56.2%      66525 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     66292 ~ 0%     -61.2%      25711 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
    322564 ~ 4%    +774.3%    2820113 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     65877 ~ 2%     -67.9%      21134 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
    281638 ~ 2%    +886.2%    2777596 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
   1293677 ~ 5%    +371.5%    6099145 ~ 0%  TOTAL cpuidle.C7-SNB.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       405 ~ 2%     +70.3%        690 ~19%  lkp-sb03/nepim/300s-100%-tcp6
       219 ~ 9%     -56.0%         96 ~14%  lkp-sb03/nepim/300s-100%-udp
       235 ~ 8%     -43.0%        134 ~35%  lkp-sb03/nepim/300s-100%-udp6
       226 ~ 9%     -51.6%        109 ~ 5%  lkp-sb03/nepim/300s-25%-udp
       195 ~ 5%     -37.8%        121 ~22%  lkp-sb03/nepim/300s-25%-udp6
      1495 ~ 2%     +20.0%       1794 ~14%  lkp-sb03/thrulay/300s
      3326 ~17%     -45.2%       1824 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     11463 ~21%     -68.1%       3660 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      2241 ~22%     -52.1%       1074 ~18%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     10587 ~11%     -67.6%       3431 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      5333 ~ 4%     -73.8%       1399 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     26317 ~ 7%    +725.5%     217243 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      5073 ~ 5%     -79.3%       1050 ~14%  lkp-snb01/hackbench/50%-threads=
-pipe
     22920 ~ 3%    +848.8%     217474 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     90040 ~ 8%    +399.9%     450104 ~ 1%  TOTAL cpuidle.C3-SNB.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.15 ~ 0%    +164.0%       0.40 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      0.15 ~ 0%    +164.0%       0.40 ~ 6%  TOTAL turbostat.%pc3

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

   1951114 ~ 5%    +157.2%    5018507 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
   1951114 ~ 5%    +157.2%    5018507 ~ 5%  TOTAL cpuidle.C1-NHM.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.25 ~ 6%     -57.9%       0.53 ~19%  lkp-snb01/hackbench/50%-process=
-pipe
      0.99 ~ 4%     -66.4%       0.33 ~18%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.24 ~ 5%     -61.7%       0.86 ~19%  TOTAL perf-profile.cpu-cycles.o=
sq_lock.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.23 ~39%     +91.6%       2.36 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.23 ~39%     +91.6%       2.36 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_sb_start_write.pipe_write.new_sync_write.vfs_write.sys_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.90 ~39%     -74.1%       0.23 ~14%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.95 ~ 2%     +35.8%       1.29 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      0.97 ~ 2%     +45.5%       1.41 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.82 ~14%      +4.0%       2.93 ~ 4%  TOTAL perf-profile.cpu-cycles.e=
nqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6645 ~ 7%     +31.2%       8718 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
        41 ~34%     -67.8%         13 ~27%  xps2/pigz/100%-512K
      6686 ~ 7%     +30.6%       8731 ~ 3%  TOTAL cpuidle.C1-NHM.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       120 ~ 7%     -60.3%         48 ~10%  lkp-nex04/ebizzy/200%-100x-10s
       120 ~ 7%     -60.3%         48 ~10%  TOTAL numa-vmstat.node0.nr_writ=
ten

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.70 ~38%     +90.5%       1.34 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.70 ~38%     +90.5%       1.34 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
ystem_call.__read_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.64 ~42%     +75.1%       1.13 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.64 ~42%     +75.1%       1.13 ~ 4%  TOTAL perf-profile.cpu-cycles.s=
ystem_call_after_swapgs.__read_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     53133 ~16%    +895.1%     528750 ~13%  lkp-sb03/nepim/300s-100%-tcp
      1600 ~ 7%     -24.9%       1201 ~ 9%  lkp-sb03/nepim/300s-100%-udp
      4271 ~15%     +30.9%       5589 ~12%  lkp-sb03/thrulay/300s
    222098 ~11%     +44.3%     320444 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    322668 ~13%     +31.2%     423349 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    148463 ~ 2%     -29.8%     104219 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    160658 ~ 8%     -24.8%     120774 ~13%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1987182 ~ 1%     -79.4%     408827 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
   2527467 ~ 1%     -53.7%    1170358 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
   2021632 ~ 4%     -78.7%     430740 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
   2760121 ~ 3%     -55.1%    1238775 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
  10209298 ~ 3%     -53.4%    4753029 ~ 4%  TOTAL cpuidle.C1E-SNB.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       121 ~ 8%     -59.2%         49 ~ 8%  lkp-nex04/ebizzy/200%-100x-10s
       121 ~ 8%     -59.2%         49 ~ 8%  TOTAL numa-vmstat.node0.nr_dirt=
ied

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    653425 ~19%    +171.2%    1771912 ~12%  lkp-sb03/nepim/300s-25%-tcp6
  25787420 ~ 0%     -93.4%    1692219 ~ 7%  lkp-sb03/nuttcp/300s
  33678146 ~ 6%    +141.0%   81148968 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   2961311 ~ 2%     +82.0%    5389919 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  43981691 ~ 0%     +37.7%   60558244 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    696045 ~ 3%     +73.9%    1210434 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    776526 ~ 1%     +10.9%     860780 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
  11737131 ~ 0%     +10.5%   12970700 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
 120271698 ~ 2%     +37.7%  165603178 ~ 3%  TOTAL numa-vmstat.node0.numa_hit

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.63 ~41%     +76.7%       1.11 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.63 ~41%     +76.7%       1.11 ~ 5%  TOTAL perf-profile.cpu-cycles.s=
ystem_call_after_swapgs.__write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.85 ~37%     +84.8%       1.58 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.85 ~37%     +84.8%       1.58 ~ 2%  TOTAL perf-profile.cpu-cycles.n=
ew_sync_write.vfs_write.sys_write.system_call_fastpath.__write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.11 ~23%     -74.6%       0.28 ~16%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.91 ~12%     -56.9%       0.39 ~16%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.92 ~ 1%     +30.8%       1.20 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      0.90 ~ 1%     +39.8%       1.25 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      3.84 ~10%     -18.5%       3.13 ~ 6%  TOTAL perf-profile.cpu-cycles.s=
elect_task_rq_fair.try_to_wake_up.default_wake_function.autoremove_wake_fun=
ction.__wake_up_common

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     26744 ~ 0%     +25.3%      33519 ~ 1%  lkp-sb03/nepim/300s-100%-udp
     27174 ~ 0%     +27.4%      34621 ~ 3%  lkp-sb03/nepim/300s-100%-udp6
    331613 ~49%    +595.6%    2306838 ~21%  lkp-sb03/nepim/300s-25%-tcp6
     27067 ~ 0%     +19.4%      32308 ~ 4%  lkp-sb03/nepim/300s-25%-udp6
  45320633 ~ 0%     -95.6%    2004477 ~13%  lkp-sb03/nuttcp/300s
  11866726 ~ 8%    +173.1%   32408219 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   1812740 ~ 3%     +62.9%    2953163 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  15181872 ~ 6%     +57.3%   23874547 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    968743 ~ 1%     +39.1%    1347806 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   4379628 ~ 0%     +12.2%    4914933 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
    679717 ~ 0%     +21.4%     824892 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
  80622660 ~ 3%     -12.3%   70735326 ~ 4%  TOTAL proc-vmstat.pgalloc_dma32

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3914 ~10%     +24.2%       4861 ~10%  lkp-nex04/ebizzy/200%-100x-10s
      4338 ~ 5%     -14.2%       3724 ~ 2%  lkp-sb03/nepim/300s-25%-tcp
     67261 ~ 9%     +23.9%      83343 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     69413 ~ 4%     +19.8%      83138 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      4427 ~12%    +512.3%      27107 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      4749 ~16%    +586.5%      32602 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      6360 ~ 3%     +18.7%       7550 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
    160464 ~ 7%     +51.0%     242328 ~ 3%  TOTAL numa-vmstat.node0.nr_acti=
ve_anon

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    188054 ~ 0%     -12.0%     165421 ~ 4%  lkp-sb03/nepim/300s-25%-tcp6
    343918 ~ 6%     -64.9%     120828 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    320302 ~ 8%     -56.4%     139500 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    297973 ~ 1%     -59.9%     119454 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    322249 ~ 2%     -58.6%     133389 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1850589 ~ 0%     -77.7%     412694 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
   2385284 ~ 2%     -25.0%    1789163 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
   1585568 ~ 1%     -80.5%     309240 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
   2107300 ~ 0%     -20.2%    1682672 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     17939 ~ 0%     -14.9%      15263 ~ 2%  xps2/pigz/100%-128K
     17390 ~ 0%     -10.8%      15519 ~ 3%  xps2/pigz/100%-512K
   9436567 ~ 1%     -48.0%    4903145 ~ 1%  TOTAL softirqs.SCHED

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3891 ~10%     +24.7%       4851 ~10%  lkp-nex04/ebizzy/200%-100x-10s
      4365 ~ 5%     -13.0%       3800 ~ 1%  lkp-sb03/nepim/300s-25%-tcp
     67265 ~ 9%     +23.9%      83314 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     69429 ~ 4%     +19.8%      83193 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      4433 ~13%    +516.2%      27320 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      4778 ~16%    +588.3%      32885 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      6396 ~ 3%     +19.1%       7619 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
    160558 ~ 7%     +51.3%     242983 ~ 3%  TOTAL numa-vmstat.node0.nr_anon=
_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     15646 ~10%     +24.0%      19398 ~10%  lkp-nex04/ebizzy/200%-100x-10s
     17355 ~ 5%     -14.2%      14884 ~ 2%  lkp-sb03/nepim/300s-25%-tcp
    269116 ~ 9%     +22.2%     328855 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    279739 ~ 3%     +18.8%     332246 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     17832 ~13%    +502.6%     107459 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     19129 ~17%    +566.8%     127566 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     25440 ~ 3%     +18.6%      30181 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
    644260 ~ 7%     +49.1%     960591 ~ 3%  TOTAL numa-meminfo.node0.Active=
(anon)

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     15557 ~10%     +24.5%      19363 ~10%  lkp-nex04/ebizzy/200%-100x-10s
     17471 ~ 5%     -13.0%      15192 ~ 1%  lkp-sb03/nepim/300s-25%-tcp
    269127 ~ 9%     +22.1%     328720 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    279812 ~ 3%     +18.8%     332479 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     17857 ~14%    +506.4%     108290 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     19246 ~17%    +568.4%     128641 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     25586 ~ 3%     +19.1%      30461 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
    644658 ~ 7%     +49.4%     963149 ~ 3%  TOTAL numa-meminfo.node0.AnonPa=
ges

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       210 ~32%     -42.9%        120 ~12%  lkp-sb03/nepim/300s-100%-tcp
       167 ~ 5%     +71.4%        287 ~18%  lkp-sb03/nepim/300s-25%-udp
       900 ~10%     -82.3%        159 ~12%  lkp-sb03/nepim/300s-25%-udp6
       228 ~ 6%     +76.1%        402 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       102 ~23%    +140.6%        247 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       171 ~ 6%     +27.1%        217 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
        86 ~11%     +73.6%        149 ~13%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       936 ~ 2%     -68.8%        292 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      1158 ~ 2%     -24.8%        871 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
       783 ~ 1%     -70.6%        230 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      4745 ~ 6%     -37.3%       2976 ~ 7%  TOTAL cpuidle.POLL.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

  73790094 ~ 4%     +78.3%  1.316e+08 ~14%  lkp-sb03/nepim/300s-100%-udp
  95266368 ~13%     +74.8%  1.665e+08 ~10%  lkp-sb03/nepim/300s-100%-udp6
 1.563e+08 ~14%     +29.1%  2.017e+08 ~ 6%  lkp-sb03/nepim/300s-25%-tcp6
  35821817 ~15%    +150.6%   89759590 ~ 9%  lkp-sb03/nepim/300s-25%-udp
  45897422 ~30%     +78.1%   81730826 ~12%  lkp-sb03/nepim/300s-25%-udp6
 1.231e+08 ~13%     +56.6%  1.927e+08 ~ 4%  lkp-sb03/nuttcp/300s
 2.136e+08 ~ 7%    +378.8%  1.023e+09 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.908e+08 ~ 4%     +82.9%  3.489e+08 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
 1.734e+08 ~ 1%     +61.9%  2.807e+08 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
 1.668e+08 ~ 2%     +34.8%  2.248e+08 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
 5.248e+08 ~ 0%     -76.4%  1.238e+08 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
 7.484e+08 ~ 2%     +56.2%  1.169e+09 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
 4.615e+08 ~ 1%     -79.3%   95529551 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
 6.688e+08 ~ 1%     +67.4%  1.119e+09 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
 3.678e+09 ~ 3%     +42.7%  5.249e+09 ~ 2%  TOTAL cpuidle.C1-SNB.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    260064 ~ 1%     +27.6%     331777 ~ 1%  lkp-sb03/nepim/300s-100%-udp
    262026 ~ 0%     +27.0%     332775 ~ 4%  lkp-sb03/nepim/300s-100%-udp6
    789769 ~23%    +287.5%    3060129 ~19%  lkp-sb03/nepim/300s-25%-tcp6
    261626 ~ 0%     +20.5%     315240 ~ 4%  lkp-sb03/nepim/300s-25%-udp6
  51318653 ~ 0%     -94.8%    2660554 ~11%  lkp-sb03/nuttcp/300s
  60628351 ~ 8%    +172.5%  1.652e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   5671391 ~ 5%     +79.4%   10175004 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  78033309 ~ 6%     +55.9%  1.217e+08 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1011536 ~ 2%    +106.0%    2083453 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1142072 ~ 3%     +13.2%    1293092 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
  22796768 ~ 0%     +11.9%   25515853 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
    963465 ~ 1%     +14.4%    1102031 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
 2.231e+08 ~ 4%     +49.6%  3.338e+08 ~ 4%  TOTAL numa-numastat.node0.local=
_node

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    260067 ~ 1%     +27.6%     331779 ~ 1%  lkp-sb03/nepim/300s-100%-udp
    262028 ~ 0%     +27.0%     332777 ~ 4%  lkp-sb03/nepim/300s-100%-udp6
    789772 ~23%    +287.5%    3060134 ~19%  lkp-sb03/nepim/300s-25%-tcp6
    261626 ~ 0%     +20.5%     315242 ~ 4%  lkp-sb03/nepim/300s-25%-udp6
  51318659 ~ 0%     -94.8%    2660559 ~11%  lkp-sb03/nuttcp/300s
  60631155 ~ 8%    +172.5%  1.652e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   5675587 ~ 5%     +79.3%   10175010 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  78034716 ~ 6%     +55.9%  1.217e+08 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1012934 ~ 3%    +106.0%    2086250 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
   1146283 ~ 3%     +12.9%    1294543 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
  22799567 ~ 0%     +11.9%   25517251 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
    965148 ~ 1%     +14.4%    1103710 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
 2.232e+08 ~ 4%     +49.6%  3.338e+08 ~ 4%  TOTAL numa-numastat.node0.numa_=
hit

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.91 ~35%     +68.9%       1.54 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.91 ~35%     +68.9%       1.54 ~ 2%  TOTAL perf-profile.cpu-cycles.n=
ew_sync_read.vfs_read.sys_read.system_call_fastpath.__read_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.82 ~38%     +63.6%       1.35 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.82 ~38%     +63.6%       1.35 ~ 3%  TOTAL perf-profile.cpu-cycles.f=
snotify.vfs_write.sys_write.system_call_fastpath.__write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.73 ~12%     -51.6%       0.84 ~20%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.88 ~ 1%     +43.0%       2.68 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.51 ~ 4%     -66.7%       0.50 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      5.11 ~ 5%     -21.4%       4.02 ~ 5%  TOTAL perf-profile.cpu-cycles._=
_switch_to

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.71 ~38%     +81.7%       1.29 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.71 ~38%     +81.7%       1.29 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
ystem_call.__write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       241 ~ 2%     -47.4%        127 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
     16247 ~10%     -58.4%       6766 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     16536 ~ 4%     -48.3%       8548 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     13905 ~ 1%     -51.8%       6703 ~12%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     15226 ~ 1%     -72.3%       4223 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       752 ~ 0%     -46.0%        406 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
       733 ~ 0%     -40.9%        433 ~ 6%  lkp-snb01/hackbench/50%-process=
-socket
       743 ~ 0%     -51.9%        357 ~12%  lkp-snb01/hackbench/50%-threads=
-pipe
       723 ~ 2%     -45.1%        397 ~12%  lkp-snb01/hackbench/50%-threads=
-socket
     65108 ~ 4%     -57.1%      27963 ~ 7%  TOTAL numa-vmstat.node1.nr_kern=
el_stack

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

   1300367 ~ 7%     -51.2%     634804 ~ 6%  lkp-sb03/nepim/300s-100%-tcp
      8787 ~ 3%     +13.7%       9992 ~ 3%  lkp-sb03/nepim/300s-100%-udp
      8076 ~ 1%     +18.7%       9586 ~ 6%  lkp-sb03/nepim/300s-100%-udp6
      5496 ~ 4%     +19.4%       6562 ~ 3%  lkp-sb03/nepim/300s-25%-udp
  20723811 ~ 8%     -18.1%   16972955 ~18%  lkp-sb03/nuttcp/300s
  20051774 ~16%     -64.1%    7193483 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   7080252 ~23%     -41.5%    4141225 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  17950855 ~ 2%     -64.6%    6352937 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   7114691 ~11%     -32.9%    4776778 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  90502668 ~ 0%     -78.8%   19208998 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
 1.076e+08 ~ 2%     -24.8%   80930849 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
  78124067 ~ 0%     -79.9%   15682243 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
  93617032 ~ 0%     -14.9%   79650426 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
 4.441e+08 ~ 2%     -47.0%  2.356e+08 ~ 2%  TOTAL cpuidle.C1-SNB.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    255551 ~ 0%     -27.0%     186539 ~ 2%  lkp-sb03/nepim/300s-100%-udp
    255500 ~ 1%     -27.2%     185901 ~ 7%  lkp-sb03/nepim/300s-100%-udp6
    254830 ~ 0%     -19.7%     204582 ~ 8%  lkp-sb03/nepim/300s-25%-udp6
    507685 ~13%   +9751.5%   50014706 ~ 0%  lkp-sb03/nuttcp/300s
 1.001e+08 ~ 9%     +61.0%  1.613e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  13187833 ~ 0%     -26.9%    9646005 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   2782220 ~ 1%     -50.0%    1390395 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  23621451 ~ 0%      +8.7%   25686642 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
   1027470 ~ 2%     +16.7%    1198816 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
  1.42e+08 ~ 7%     +75.8%  2.498e+08 ~ 1%  TOTAL numa-numastat.node1.local=
_node

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    255552 ~ 0%     -27.0%     186546 ~ 2%  lkp-sb03/nepim/300s-100%-udp
    255503 ~ 1%     -27.2%     185907 ~ 7%  lkp-sb03/nepim/300s-100%-udp6
    254832 ~ 0%     -19.7%     204585 ~ 8%  lkp-sb03/nepim/300s-25%-udp6
    507686 ~13%   +9751.5%   50014715 ~ 0%  lkp-sb03/nuttcp/300s
 1.001e+08 ~ 9%     +61.0%  1.613e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  13187839 ~ 0%     -26.8%    9650203 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   2785019 ~ 1%     -50.0%    1391796 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  23622853 ~ 0%      +8.7%   25689442 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
   1029988 ~ 1%     +16.6%    1201335 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
  1.42e+08 ~ 7%     +75.8%  2.498e+08 ~ 1%  TOTAL numa-numastat.node1.numa_=
hit

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    336227 ~ 1%     -10.0%     302601 ~ 1%  lkp-sb03/nepim/300s-100%-udp
    477009 ~11%   +5148.9%   25037586 ~ 0%  lkp-sb03/nuttcp/300s
  48309350 ~12%     +67.4%   80865606 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   7161565 ~ 4%     -27.5%    5191520 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  54578213 ~ 3%      +9.7%   59862395 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1593797 ~ 0%     -39.4%     966066 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  12134656 ~ 0%      +8.5%   13164720 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
    718513 ~ 1%     +15.8%     832355 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
 125309332 ~ 6%     +48.6%  186222850 ~ 1%  TOTAL numa-vmstat.node1.numa_hit

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    321208 ~ 1%     -30.0%     224982 ~ 1%  lkp-sb03/nepim/300s-100%-udp
    320408 ~ 2%     -25.5%     238721 ~ 2%  lkp-sb03/nepim/300s-100%-udp6
    327286 ~ 0%     -24.8%     246097 ~ 8%  lkp-sb03/nepim/300s-25%-udp6
    462246 ~11%   +5299.7%   24960044 ~ 0%  lkp-sb03/nuttcp/300s
  48299610 ~12%     +67.3%   80792506 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   7153407 ~ 4%     -28.5%    5117079 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  54567457 ~ 3%      +9.6%   59808663 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1583285 ~ 0%     -43.6%     893721 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  12125307 ~ 0%      +8.0%   13091555 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
 125160217 ~ 6%     +48.1%  185373370 ~ 1%  TOTAL numa-vmstat.node1.numa_lo=
cal

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.25 ~ 4%     -47.1%       0.66 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
      1.13 ~ 1%     -55.9%       0.50 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.39 ~ 3%     -51.3%       1.16 ~11%  TOTAL perf-profile.cpu-cycles.m=
utex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_wri=
te

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    291907 ~ 0%     +30.5%     381061 ~ 0%  lkp-sb03/nepim/300s-100%-udp
    300689 ~ 0%     +26.8%     381191 ~ 3%  lkp-sb03/nepim/300s-100%-udp6
    590235 ~22%    +200.2%    1771607 ~12%  lkp-sb03/nepim/300s-25%-tcp6
    293021 ~ 0%     +19.8%     351132 ~ 9%  lkp-sb03/nepim/300s-25%-udp
    284025 ~ 0%     +33.6%     379443 ~ 3%  lkp-sb03/nepim/300s-25%-udp6
  25724053 ~ 0%     -93.4%    1691833 ~ 7%  lkp-sb03/nuttcp/300s
  33612981 ~ 6%    +141.4%   81147547 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   2894884 ~ 2%     +86.2%    5389585 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-socket
  43917694 ~ 0%     +37.8%   60537420 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    632190 ~ 3%     +91.1%    1207968 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    710341 ~ 2%     +21.0%     859338 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
  11671991 ~ 0%     +11.1%   12969157 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
    636411 ~ 1%     +16.6%     741777 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
 121560423 ~ 2%     +38.0%  167809063 ~ 3%  TOTAL numa-vmstat.node0.numa_lo=
cal

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       986 ~14%     -56.7%        427 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
        45 ~20%     +77.5%         80 ~29%  xps2/pigz/100%-128K
      1031 ~14%     -50.8%        507 ~10%  TOTAL cpuidle.C1E-NHM.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       308 ~ 0%     +94.5%        599 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       294 ~ 0%    +105.0%        603 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
       602 ~ 0%     +99.6%       1202 ~ 0%  TOTAL slabinfo.kmalloc-256.acti=
ve_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       308 ~ 0%     +94.5%        599 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       294 ~ 0%    +105.0%        603 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
       602 ~ 0%     +99.6%       1202 ~ 0%  TOTAL slabinfo.kmalloc-256.num_=
slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       317 ~ 0%     +91.9%        609 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       300 ~ 0%    +103.5%        612 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
       618 ~ 0%     +97.6%       1221 ~ 0%  TOTAL slabinfo.kmalloc-512.acti=
ve_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       317 ~ 0%     +91.9%        609 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       300 ~ 0%    +103.5%        612 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
       618 ~ 0%     +97.6%       1221 ~ 0%  TOTAL slabinfo.kmalloc-512.num_=
slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3872 ~ 2%     -47.4%       2038 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
      1836 ~ 2%     +15.8%       2127 ~ 4%  lkp-sb03/nepim/300s-100%-tcp
      2259 ~ 5%     -17.3%       1867 ~ 2%  lkp-sb03/nuttcp/300s
      1934 ~ 6%      +8.9%       2105 ~ 1%  lkp-sb03/thrulay/300s
    261024 ~10%     -57.4%     111299 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    265786 ~ 3%     -49.0%     135448 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    223640 ~ 1%     -52.3%     106733 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    242683 ~ 1%     -72.8%      66037 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     12011 ~ 0%     -45.9%       6495 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
     11736 ~ 0%     -40.9%       6940 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
     11931 ~ 0%     -52.1%       5711 ~12%  lkp-snb01/hackbench/50%-threads=
-pipe
     11576 ~ 2%     -44.9%       6376 ~12%  lkp-snb01/hackbench/50%-threads=
-socket
   1050291 ~ 4%     -56.9%     453180 ~ 6%  TOTAL numa-meminfo.node1.Kernel=
Stack

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.93 ~31%     +56.3%       1.45 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.93 ~31%     +56.3%       1.45 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.02 ~33%     +70.6%       1.74 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.73 ~ 2%     +58.7%       1.15 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1.75 ~20%     +65.6%       2.89 ~ 2%  TOTAL perf-profile.cpu-cycles.v=
fs_read.sys_read.system_call_fastpath.__read_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       408 ~ 0%     +92.5%        785 ~10%  lkp-nex04/ebizzy/200%-100x-10s
       340 ~ 7%     +90.0%        646 ~ 9%  lkp-sb03/nepim/300s-100%-tcp
       357 ~ 0%    +100.0%        714 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
       323 ~ 7%    +115.8%        697 ~ 3%  lkp-sb03/nepim/300s-100%-udp
       374 ~ 6%     +68.2%        629 ~10%  lkp-sb03/nepim/300s-100%-udp6
       323 ~ 7%    +105.3%        663 ~ 6%  lkp-sb03/nepim/300s-25%-tcp
       340 ~ 7%    +100.0%        680 ~ 9%  lkp-sb03/nepim/300s-25%-tcp6
       340 ~ 7%    +100.0%        680 ~ 9%  lkp-sb03/nepim/300s-25%-udp
       374 ~ 6%     +81.8%        680 ~ 7%  lkp-sb03/nepim/300s-25%-udp6
       357 ~11%    +104.8%        731 ~ 6%  lkp-sb03/nuttcp/300s
       357 ~11%    +100.0%        714 ~ 0%  lkp-sb03/thrulay/300s
       340 ~ 7%    +115.0%        731 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       374 ~ 6%     +77.3%        663 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       357 ~ 0%     +76.2%        629 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       357 ~ 0%    +104.8%        731 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       374 ~12%     +72.7%        646 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
       374 ~ 6%     +63.6%        612 ~ 6%  lkp-snb01/hackbench/50%-process=
-socket
       374 ~12%     +59.1%        595 ~10%  lkp-snb01/hackbench/50%-threads=
-pipe
       346 ~11%     +94.1%        673 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      6789 ~ 6%     +90.0%      12899 ~ 7%  TOTAL slabinfo.mnt_cache.num_ob=
js

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       408 ~ 0%     +92.5%        785 ~10%  lkp-nex04/ebizzy/200%-100x-10s
       340 ~ 7%     +90.0%        646 ~ 9%  lkp-sb03/nepim/300s-100%-tcp
       357 ~ 0%    +100.0%        714 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
       323 ~ 7%    +115.8%        697 ~ 3%  lkp-sb03/nepim/300s-100%-udp
       374 ~ 6%     +68.2%        629 ~10%  lkp-sb03/nepim/300s-100%-udp6
       323 ~ 7%    +105.3%        663 ~ 6%  lkp-sb03/nepim/300s-25%-tcp
       340 ~ 7%    +100.0%        680 ~ 9%  lkp-sb03/nepim/300s-25%-tcp6
       340 ~ 7%    +100.0%        680 ~ 9%  lkp-sb03/nepim/300s-25%-udp
       374 ~ 6%     +81.8%        680 ~ 7%  lkp-sb03/nepim/300s-25%-udp6
       357 ~11%    +104.8%        731 ~ 6%  lkp-sb03/nuttcp/300s
       357 ~11%    +100.0%        714 ~ 0%  lkp-sb03/thrulay/300s
       340 ~ 7%    +115.0%        731 ~11%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       374 ~ 6%     +77.3%        663 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       357 ~ 0%     +76.2%        629 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       357 ~ 0%    +104.8%        731 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       374 ~12%     +72.7%        646 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
       374 ~ 6%     +63.6%        612 ~ 6%  lkp-snb01/hackbench/50%-process=
-socket
       374 ~12%     +59.1%        595 ~10%  lkp-snb01/hackbench/50%-threads=
-pipe
       346 ~11%     +94.1%        673 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      6789 ~ 6%     +90.0%      12899 ~ 7%  TOTAL slabinfo.mnt_cache.active=
_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.55 ~37%     +77.7%       0.98 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.79 ~ 5%     +23.3%       0.97 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.34 ~19%     +45.8%       1.95 ~ 4%  TOTAL perf-profile.cpu-cycles.m=
utex_lock.pipe_read.new_sync_read.vfs_read.sys_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.99 ~40%     +70.4%       1.69 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.68 ~12%     +76.0%       1.20 ~ 6%  lkp-snb01/hackbench/50%-process=
-socket
      0.67 ~15%     +53.2%       1.02 ~17%  lkp-snb01/hackbench/50%-threads=
-socket
      2.34 ~25%     +67.1%       3.90 ~ 9%  TOTAL perf-profile.cpu-cycles.s=
elinux_file_permission.security_file_permission.rw_verify_area.vfs_write.sy=
s_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      5756 ~ 6%     +19.2%       6863 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      8732 ~ 5%     +23.3%      10762 ~15%  lkp-sb03/nepim/300s-100%-tcp
      8698 ~ 6%      -7.6%       8041 ~ 1%  lkp-sb03/nepim/300s-25%-udp
     21425 ~49%    +216.7%      67853 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     63758 ~ 3%     +50.5%      95964 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      8958 ~11%    +290.6%      34993 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     52207 ~ 4%     +65.2%      86255 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8458 ~ 4%     +61.8%      13686 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      9574 ~ 5%     +78.7%      17110 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      9175 ~ 1%     +15.7%      10614 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
     10383 ~ 4%     +28.6%      13349 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    207127 ~ 9%     +76.5%     365493 ~ 3%  TOTAL numa-vmstat.node0.nr_slab=
_unreclaimable

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     23027 ~ 6%     +19.2%      27451 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
     34931 ~ 5%     +23.3%      43055 ~15%  lkp-sb03/nepim/300s-100%-tcp
     34794 ~ 6%      -7.6%      32165 ~ 1%  lkp-sb03/nepim/300s-25%-udp
    252845 ~ 3%     +51.0%     381893 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     35920 ~11%    +287.6%     139238 ~ 6%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    208226 ~ 7%     +61.8%     336833 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     33831 ~ 4%     +61.7%      54718 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     38316 ~ 5%     +78.7%      68454 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
     36701 ~ 1%     +15.7%      42453 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
     41548 ~ 4%     +28.6%      53422 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    740143 ~ 5%     +59.4%    1179686 ~ 4%  TOTAL numa-meminfo.node0.SUnrec=
laim

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.36 ~ 1%     -42.2%       0.79 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
      1.10 ~ 4%     -49.2%       0.56 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.46 ~ 2%     -45.3%       1.34 ~11%  TOTAL perf-profile.cpu-cycles._=
_mutex_lock_slowpath.mutex_lock.pipe_write.new_sync_write.vfs_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

 2.455e+08 ~ 0%    +132.4%  5.707e+08 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
    317554 ~12%     +41.3%     448663 ~ 9%  xps2/pigz/100%-128K
    313973 ~ 9%     +36.7%     429232 ~13%  xps2/pigz/100%-512K
 2.462e+08 ~ 0%    +132.2%  5.715e+08 ~ 3%  TOTAL cpuidle.C3-NHM.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.08 ~ 0%     +97.5%       0.16 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      8.09 ~ 0%     +17.1%       9.47 ~ 3%  lkp-sb03/nepim/300s-100%-udp
      8.65 ~ 3%     +19.2%      10.31 ~ 5%  lkp-sb03/nepim/300s-100%-udp6
      9.31 ~ 2%     +12.8%      10.51 ~ 3%  lkp-sb03/nepim/300s-25%-tcp6
      7.32 ~ 2%     +16.5%       8.53 ~ 0%  lkp-sb03/nepim/300s-25%-udp
      7.50 ~ 4%     +10.9%       8.32 ~ 3%  lkp-sb03/nepim/300s-25%-udp6
      9.25 ~ 4%     +16.8%      10.80 ~ 2%  lkp-sb03/nuttcp/300s
      2.60 ~ 5%    +193.1%       7.63 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.96 ~ 5%     +68.1%       4.97 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.43 ~ 0%     +30.9%       1.88 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      2.13 ~ 3%     -22.7%       1.65 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      3.00 ~ 1%     -73.4%       0.80 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      4.36 ~ 0%     +82.7%       7.97 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      2.71 ~ 1%     -77.4%       0.61 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
      4.10 ~ 0%     +89.6%       7.77 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      0.18 ~ 0%     +11.1%       0.20 ~ 3%  xps2/pigz/100%-128K
      0.18 ~ 2%     +10.9%       0.20 ~ 2%  xps2/pigz/100%-512K
     73.85 ~ 2%     +24.3%      91.76 ~ 2%  TOTAL turbostat.%c1

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        99 ~28%     +43.4%        142 ~ 0%  lkp-sb03/nepim/300s-25%-udp
        99 ~28%     +43.4%        142 ~ 0%  TOTAL proc-vmstat.nr_written

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.75 ~27%     +49.1%       1.11 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.75 ~27%     +49.1%       1.11 ~ 7%  TOTAL perf-profile.cpu-cycles.f=
ile_update_time.pipe_write.new_sync_write.vfs_write.sys_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.09 ~35%     +84.4%       2.00 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.57 ~ 5%     +21.2%       1.91 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.63 ~ 4%     +81.6%       1.15 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      0.60 ~ 2%     +76.5%       1.07 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      3.90 ~13%     +57.2%       6.13 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_srcu_read_unlock.fsnotify.vfs_write.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.75 ~35%     +82.5%       3.20 ~13%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.68 ~ 4%     +33.8%       3.59 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.84 ~ 6%     +98.8%       1.67 ~16%  lkp-snb01/hackbench/50%-threads=
-socket
      5.28 ~15%     +60.4%       8.46 ~10%  TOTAL perf-profile.cpu-cycles.a=
vc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.security_f=
ile_permission

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.89 ~28%     +49.1%       1.33 ~12%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.89 ~28%     +49.1%       1.33 ~12%  TOTAL perf-profile.cpu-cycles._=
_fget_light.sys_read.system_call_fastpath.__read_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.98 ~30%     +49.0%       1.46 ~10%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.98 ~30%     +49.0%       1.46 ~10%  TOTAL perf-profile.cpu-cycles.s=
elinux_file_permission.security_file_permission.rw_verify_area.vfs_read.sys=
_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2209 ~12%     +33.6%       2951 ~ 3%  lkp-sb03/nepim/300s-25%-tcp
    100316 ~ 2%     -39.0%      61218 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    102573 ~ 2%     -22.2%      79771 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     43454 ~ 0%     -52.8%      20519 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     42356 ~ 2%     -67.1%      13951 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      6459 ~ 3%     -17.4%       5332 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
      7111 ~ 3%     -13.5%       6149 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
    304479 ~ 2%     -37.6%     189893 ~ 4%  TOTAL numa-vmstat.node1.nr_acti=
ve_anon

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.96 ~33%     +80.3%       1.74 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.39 ~ 6%     +18.5%       1.64 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      2.35 ~17%     +43.8%       3.38 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_sb_end_write.pipe_write.new_sync_write.vfs_write.sys_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      8844 ~12%     +33.5%      11808 ~ 3%  lkp-sb03/nepim/300s-25%-tcp
    401560 ~ 2%     -37.1%     252711 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    413896 ~ 1%     -22.9%     319212 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    174088 ~ 1%     -53.0%      81904 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    168921 ~ 2%     -66.9%      55935 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     25777 ~ 3%     -17.3%      21308 ~14%  lkp-snb01/hackbench/50%-process=
-pipe
     28447 ~ 3%     -13.5%      24604 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
   1221534 ~ 2%     -37.2%     767483 ~ 4%  TOTAL numa-meminfo.node1.Active=
(anon)

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.83 ~ 9%     +17.3%       2.14 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1.20 ~ 4%    +101.9%       2.42 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      1.15 ~ 2%     +87.7%       2.17 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      4.18 ~ 6%     +61.0%       6.73 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.skb_copy_datagram_from_iovec.unix_stream_sendmsg.so=
ck_aio_write.do_sync_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2286 ~11%     +30.7%       2989 ~ 3%  lkp-sb03/nepim/300s-25%-tcp
    100357 ~ 2%     -39.0%      61211 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    102650 ~ 2%     -22.2%      79879 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     43827 ~ 1%     -52.6%      20768 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     42620 ~ 2%     -66.8%      14153 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      6551 ~ 3%     -17.5%       5406 ~15%  lkp-snb01/hackbench/50%-process=
-pipe
      7196 ~ 3%     -13.8%       6203 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
    305489 ~ 2%     -37.6%     190611 ~ 4%  TOTAL numa-vmstat.node1.nr_anon=
_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.28 ~34%     +86.0%       2.39 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.98 ~ 7%     +18.7%       2.35 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.13 ~10%     +15.9%       1.31 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.79 ~ 3%     +83.2%       1.45 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      0.76 ~ 4%     +80.4%       1.38 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      5.95 ~13%     +49.2%       8.88 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      9160 ~11%     +30.6%      11961 ~ 3%  lkp-sb03/nepim/300s-25%-tcp
    401720 ~ 2%     -37.1%     252704 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    414201 ~ 1%     -22.8%     319643 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    175555 ~ 1%     -52.8%      82890 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    169932 ~ 2%     -66.6%      56758 ~10%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     26147 ~ 3%     -17.4%      21604 ~15%  lkp-snb01/hackbench/50%-process=
-pipe
     28786 ~ 3%     -13.8%      24815 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
   1225502 ~ 2%     -37.1%     770377 ~ 4%  TOTAL numa-meminfo.node1.AnonPa=
ges

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       220 ~ 0%     -30.3%        153 ~16%  lkp-sb03/nepim/300s-100%-udp6
       115 ~32%     +58.2%        183 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       335 ~11%      +0.2%        336 ~ 7%  TOTAL proc-vmstat.nr_dirtied

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       267 ~ 2%     -44.6%        148 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
       261 ~ 2%     -40.5%        155 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
       261 ~ 0%     -43.0%        148 ~ 1%  lkp-sb03/nepim/300s-100%-udp
       263 ~ 0%     -43.0%        150 ~ 1%  lkp-sb03/nepim/300s-100%-udp6
       264 ~ 0%     -41.4%        154 ~ 0%  lkp-sb03/nepim/300s-25%-tcp
       261 ~ 1%     -41.5%        153 ~ 1%  lkp-sb03/nepim/300s-25%-tcp6
       264 ~ 4%     -44.3%        147 ~ 1%  lkp-sb03/nepim/300s-25%-udp
       265 ~ 2%     -43.9%        148 ~ 0%  lkp-sb03/nepim/300s-25%-udp6
       267 ~ 1%     -43.7%        150 ~ 1%  lkp-sb03/nuttcp/300s
       259 ~ 2%     -42.5%        149 ~ 2%  lkp-sb03/thrulay/300s
       624 ~ 5%     -18.3%        510 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       264 ~ 2%     -39.8%        159 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       413 ~ 4%     -24.1%        314 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
       324 ~ 2%     -35.5%        209 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
       262 ~ 4%     -37.5%        163 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
      4522 ~ 2%     -36.7%       2861 ~ 2%  TOTAL slabinfo.kmalloc-192.acti=
ve_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       267 ~ 2%     -44.6%        148 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
       261 ~ 2%     -40.5%        155 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
       261 ~ 0%     -43.0%        148 ~ 1%  lkp-sb03/nepim/300s-100%-udp
       263 ~ 0%     -43.0%        150 ~ 1%  lkp-sb03/nepim/300s-100%-udp6
       264 ~ 0%     -41.4%        154 ~ 0%  lkp-sb03/nepim/300s-25%-tcp
       261 ~ 1%     -41.5%        153 ~ 1%  lkp-sb03/nepim/300s-25%-tcp6
       264 ~ 4%     -44.3%        147 ~ 1%  lkp-sb03/nepim/300s-25%-udp
       265 ~ 2%     -43.9%        148 ~ 0%  lkp-sb03/nepim/300s-25%-udp6
       267 ~ 1%     -43.7%        150 ~ 1%  lkp-sb03/nuttcp/300s
       259 ~ 2%     -42.5%        149 ~ 2%  lkp-sb03/thrulay/300s
       624 ~ 5%     -18.3%        510 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       264 ~ 2%     -39.8%        159 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       413 ~ 4%     -24.1%        314 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
       324 ~ 2%     -35.5%        209 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
       262 ~ 4%     -37.5%        163 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
      4522 ~ 2%     -36.7%       2861 ~ 2%  TOTAL slabinfo.kmalloc-192.num_=
slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     59833 ~ 2%     -12.0%      52649 ~ 6%  lkp-sb03/nepim/300s-100%-tcp6
    108376 ~41%    +172.3%     295120 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    272813 ~ 2%     +52.0%     414643 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     62546 ~12%    +171.8%     169998 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    231752 ~ 7%     +59.8%     370345 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     57896 ~ 3%     +27.6%      73874 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     56551 ~ 5%     +60.9%      90973 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
     57482 ~ 2%     +11.1%      63842 ~ 5%  lkp-snb01/hackbench/50%-threads=
-pipe
     63592 ~ 2%     +19.4%      75956 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
    970845 ~ 9%     +65.6%    1607403 ~ 3%  TOTAL numa-meminfo.node0.Slab

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.34 ~34%     +69.0%       2.27 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.88 ~ 4%     +13.8%       2.14 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      3.22 ~17%     +36.8%       4.41 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_page_from_iter_iovec.copy_page_from_iter.pipe_write.new_sync_write.vfs_=
write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.65 ~ 7%     +11.7%       1.84 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1.04 ~ 3%     +91.1%       1.99 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      1.01 ~ 3%     +80.6%       1.82 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      3.70 ~ 5%     +52.9%       5.65 ~ 1%  TOTAL perf-profile.cpu-cycles._=
_alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write.do_sync_=
write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.64 ~ 4%     +60.2%       1.02 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      0.64 ~ 4%     +60.2%       1.02 ~ 1%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.skb_unlink.unix_stream_recvmsg.sock_aio_read.sock_aio=
_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     10170 ~ 2%     -20.1%       8121 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     11266 ~ 2%     -44.5%       6257 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
     10994 ~ 2%     -40.3%       6565 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
     11000 ~ 0%     -43.0%       6271 ~ 1%  lkp-sb03/nepim/300s-100%-udp
     11098 ~ 0%     -42.9%       6340 ~ 1%  lkp-sb03/nepim/300s-100%-udp6
     11126 ~ 0%     -41.4%       6523 ~ 0%  lkp-sb03/nepim/300s-25%-tcp
     11014 ~ 1%     -41.4%       6453 ~ 2%  lkp-sb03/nepim/300s-25%-tcp6
     11140 ~ 4%     -44.1%       6228 ~ 1%  lkp-sb03/nepim/300s-25%-udp
     11168 ~ 2%     -43.7%       6284 ~ 0%  lkp-sb03/nepim/300s-25%-udp6
     11252 ~ 1%     -43.5%       6355 ~ 1%  lkp-sb03/nuttcp/300s
     10944 ~ 2%     -42.3%       6313 ~ 2%  lkp-sb03/thrulay/300s
     26242 ~ 5%     -18.3%      21452 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     11133 ~ 2%     -39.9%       6687 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     17402 ~ 4%     -24.1%      13213 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     15766 ~ 0%     -18.2%      12896 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
     13635 ~ 2%     -35.5%       8792 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
     11044 ~ 3%     -37.5%       6902 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    216402 ~ 2%     -34.5%     141656 ~ 2%  TOTAL slabinfo.kmalloc-192.num_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     10170 ~ 2%     -20.1%       8121 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     11266 ~ 2%     -44.5%       6257 ~ 1%  lkp-sb03/nepim/300s-100%-tcp
     10994 ~ 2%     -40.3%       6565 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
     11000 ~ 0%     -43.0%       6271 ~ 1%  lkp-sb03/nepim/300s-100%-udp
     11098 ~ 0%     -42.9%       6340 ~ 1%  lkp-sb03/nepim/300s-100%-udp6
     11126 ~ 0%     -41.4%       6523 ~ 0%  lkp-sb03/nepim/300s-25%-tcp
     11014 ~ 1%     -41.4%       6453 ~ 2%  lkp-sb03/nepim/300s-25%-tcp6
     11140 ~ 4%     -44.1%       6228 ~ 1%  lkp-sb03/nepim/300s-25%-udp
     11168 ~ 2%     -43.7%       6284 ~ 0%  lkp-sb03/nepim/300s-25%-udp6
     11252 ~ 1%     -43.5%       6355 ~ 1%  lkp-sb03/nuttcp/300s
     10944 ~ 2%     -42.3%       6313 ~ 2%  lkp-sb03/thrulay/300s
     26088 ~ 5%     -18.3%      21317 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     11086 ~ 2%     -39.7%       6687 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     17314 ~ 4%     -23.8%      13191 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     15756 ~ 0%     -18.2%      12896 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
     13609 ~ 2%     -35.4%       8792 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
     11044 ~ 3%     -37.6%       6895 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    216076 ~ 2%     -34.5%     141492 ~ 2%  TOTAL slabinfo.kmalloc-192.acti=
ve_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.12 ~19%     +39.6%       1.56 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      8.74 ~ 1%     -41.7%       5.10 ~ 8%  lkp-snb01/hackbench/50%-process=
-pipe
      8.13 ~ 1%     -43.7%       4.58 ~ 6%  lkp-snb01/hackbench/50%-threads=
-pipe
     17.99 ~ 2%     -37.6%      11.24 ~ 6%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.__wake_up_sync_key.pipe_write.new_sync_write.vfs_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.67 ~29%     +67.8%       1.13 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      0.89 ~ 2%     +18.0%       1.05 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.56 ~13%     +39.5%       2.18 ~ 1%  TOTAL perf-profile.cpu-cycles.m=
utex_unlock.new_sync_read.vfs_read.sys_read.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.18 ~ 5%     +27.3%       1.51 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.57 ~ 5%     +86.1%       1.07 ~13%  lkp-snb01/hackbench/50%-threads=
-socket
      1.76 ~ 5%     +46.5%       2.57 ~10%  TOTAL perf-profile.cpu-cycles._=
_fget.__fget_light.__fdget_pos.sys_read.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     34891 ~ 3%     +12.1%      39120 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
     54366 ~ 4%     -10.2%      48838 ~ 5%  lkp-sb03/nepim/300s-25%-udp6
    317580 ~ 3%     +25.9%     399990 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     76977 ~17%    +115.0%     165477 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     57835 ~ 8%    +187.9%     166509 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     91372 ~13%     -21.8%      71452 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
     62251 ~ 3%     +30.6%      81316 ~16%  lkp-snb01/hackbench/50%-process=
-socket
    695274 ~ 6%     +39.9%     972704 ~ 5%  TOTAL numa-meminfo.node0.Active

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.94 ~ 6%     +24.6%       1.17 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.86 ~10%     +76.1%       1.52 ~ 6%  lkp-snb01/hackbench/50%-process=
-socket
      0.76 ~ 8%     +77.4%       1.35 ~10%  lkp-snb01/hackbench/50%-threads=
-socket
      2.56 ~ 8%     +57.6%       4.04 ~ 7%  TOTAL perf-profile.cpu-cycles.k=
mem_cache_alloc_node.__alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.s=
ock_aio_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.93 ~ 8%     +17.3%       1.09 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.79 ~ 3%     +70.9%       1.35 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      0.76 ~ 1%     +65.6%       1.25 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      2.47 ~ 4%     +49.2%       3.69 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.sock_alloc_send_ps=
kb.unix_stream_sendmsg

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.71 ~ 6%     +58.2%       1.12 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      0.68 ~ 8%     +48.8%       1.01 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
      1.39 ~ 7%     +53.6%       2.14 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
mpxchg_double_slab.isra.52.__slab_free.kfree.skb_free_head.skb_release_data

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2.34 ~34%     +72.2%       4.03 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3.09 ~ 7%     +14.4%       3.54 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      4.77 ~ 7%     +20.1%       5.73 ~ 3%  xps2/pigz/100%-128K
     10.21 ~13%     +30.3%      13.30 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_from_iter.pipe_write.new_sync_write.vfs_w=
rite

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.50 ~ 5%     +19.4%       1.79 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.56 ~ 3%     +77.3%       1.00 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      2.06 ~ 5%     +35.2%       2.79 ~ 4%  TOTAL perf-profile.cpu-cycles._=
_pthread_enable_asynccancel.start_thread

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

  19148511 ~ 1%     +51.8%   29065392 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  19148511 ~ 1%     +51.8%   29065392 ~ 0%  TOTAL proc-vmstat.pgfault

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    391194 ~ 7%     +99.4%     780172 ~39%  lkp-nex04/ebizzy/200%-100x-10s
    391194 ~ 7%     +99.4%     780172 ~39%  TOTAL cpuidle.C1E-NHM.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       619 ~ 9%    +136.0%       1461 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
       708 ~ 8%     +47.5%       1044 ~ 5%  lkp-sb03/nepim/300s-100%-tcp
       756 ~ 3%     +39.7%       1056 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
       756 ~ 3%     +47.6%       1116 ~ 0%  lkp-sb03/nepim/300s-100%-udp
       732 ~ 8%     +45.9%       1068 ~ 5%  lkp-sb03/nepim/300s-100%-udp6
       708 ~ 2%     +54.2%       1092 ~ 5%  lkp-sb03/nepim/300s-25%-tcp
       708 ~ 6%     +57.6%       1116 ~ 2%  lkp-sb03/nepim/300s-25%-tcp6
       732 ~ 4%     +49.2%       1092 ~ 5%  lkp-sb03/nepim/300s-25%-udp
       768 ~ 8%     +43.8%       1104 ~ 4%  lkp-sb03/nepim/300s-25%-udp6
       756 ~ 6%     +42.9%       1080 ~ 2%  lkp-sb03/nuttcp/300s
       756 ~ 0%     +52.4%       1152 ~ 2%  lkp-sb03/thrulay/300s
       756 ~11%     +38.1%       1044 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       768 ~ 2%     +40.6%       1080 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       732 ~ 4%     +39.3%       1020 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      5351 ~ 2%     +25.7%       6726 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       792 ~ 6%     +27.3%       1008 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
      2041 ~ 5%     +50.6%       3074 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     18439 ~ 4%     +42.8%      26334 ~ 3%  TOTAL slabinfo.RAW.num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.17 ~41%     +61.4%       1.89 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.29 ~ 2%     -22.5%       1.00 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.17 ~ 1%     -19.1%       0.94 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      1.19 ~ 2%     +24.4%       1.48 ~ 6%  lkp-snb01/hackbench/50%-process=
-socket
      4.81 ~11%     +10.3%       5.31 ~ 6%  TOTAL perf-profile.cpu-cycles.v=
fs_write.sys_write.system_call_fastpath.__write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        24 ~ 9%     -34.7%         16 ~ 4%  lkp-nex04/ebizzy/200%-100x-10s
        24 ~ 9%     -34.7%         16 ~ 4%  TOTAL numa-numastat.node2.other=
_node

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       382 ~ 3%     +14.3%        437 ~ 7%  lkp-sb03/nepim/300s-100%-udp6
       312 ~ 3%     +26.3%        394 ~ 5%  lkp-sb03/nuttcp/300s
     42434 ~16%     +64.6%      69867 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     42903 ~ 5%     +58.3%      67917 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       325 ~10%     +40.0%        455 ~16%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       363 ~ 5%     +33.5%        485 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1931 ~ 2%     +86.4%       3600 ~ 9%  lkp-snb01/hackbench/50%-process=
-pipe
      1890 ~ 1%     +75.3%       3314 ~ 7%  lkp-snb01/hackbench/50%-process=
-socket
     90543 ~10%     +61.8%     146472 ~ 4%  TOTAL numa-vmstat.node0.nr_page=
_table_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     36648 ~ 2%      +9.9%      40265 ~ 1%  lkp-sb03/nepim/300s-25%-tcp6
     72498 ~ 1%     -46.5%      38790 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     47285 ~26%     +52.5%      72115 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     74274 ~ 1%     -23.2%      57039 ~21%  lkp-snb01/hackbench/50%-process=
-socket
    230707 ~ 7%      -9.8%     208210 ~ 7%  TOTAL numa-meminfo.node1.Active=
(file)

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       619 ~ 9%    +136.0%       1461 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
       708 ~ 8%     +47.5%       1044 ~ 5%  lkp-sb03/nepim/300s-100%-tcp
       756 ~ 3%     +39.7%       1056 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
       756 ~ 3%     +47.6%       1116 ~ 0%  lkp-sb03/nepim/300s-100%-udp
       732 ~ 8%     +45.9%       1068 ~ 5%  lkp-sb03/nepim/300s-100%-udp6
       708 ~ 2%     +54.2%       1092 ~ 5%  lkp-sb03/nepim/300s-25%-tcp
       708 ~ 6%     +57.6%       1116 ~ 2%  lkp-sb03/nepim/300s-25%-tcp6
       732 ~ 4%     +49.2%       1092 ~ 5%  lkp-sb03/nepim/300s-25%-udp
       768 ~ 8%     +43.8%       1104 ~ 4%  lkp-sb03/nepim/300s-25%-udp6
       756 ~ 6%     +42.9%       1080 ~ 2%  lkp-sb03/nuttcp/300s
       756 ~ 0%     +52.4%       1152 ~ 2%  lkp-sb03/thrulay/300s
       756 ~11%     +38.1%       1044 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
       768 ~ 2%     +40.6%       1080 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       732 ~ 4%     +39.3%       1020 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      5350 ~ 2%     +24.7%       6670 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
       792 ~ 6%     +27.3%       1008 ~ 7%  lkp-snb01/hackbench/50%-threads=
-pipe
      2010 ~ 4%     +44.5%       2904 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     18408 ~ 4%     +41.8%      26108 ~ 3%  TOTAL slabinfo.RAW.active_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      9161 ~ 2%      +9.9%      10066 ~ 1%  lkp-sb03/nepim/300s-25%-tcp6
     18064 ~ 1%     -46.3%       9697 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     11814 ~26%     +52.7%      18038 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
     18558 ~ 2%     -23.2%      14259 ~21%  lkp-snb01/hackbench/50%-process=
-socket
     57598 ~ 7%      -9.6%      52061 ~ 7%  TOTAL numa-vmstat.node1.nr_acti=
ve_file

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3.34 ~20%     +52.6%       5.10 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3.78 ~ 4%     +19.9%       4.53 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      7.12 ~11%     +35.3%       9.64 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1547 ~ 3%     +12.8%       1745 ~ 6%  lkp-sb03/nepim/300s-100%-udp6
      1251 ~ 3%     +26.3%       1581 ~ 6%  lkp-sb03/nuttcp/300s
    169996 ~16%     +61.0%     273678 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    172042 ~ 5%     +57.7%     271314 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1305 ~ 9%     +39.1%       1816 ~16%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1455 ~ 5%     +32.5%       1929 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      7703 ~ 2%     +86.5%      14365 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
      7567 ~ 1%     +75.0%      13241 ~ 7%  lkp-snb01/hackbench/50%-process=
-socket
    362870 ~10%     +59.7%     579670 ~ 3%  TOTAL numa-meminfo.node0.PageTa=
bles

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       934 ~ 7%     +43.3%       1339 ~23%  lkp-sb03/thrulay/300s
      1520 ~25%     -30.3%       1060 ~25%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2772 ~10%     -23.1%       2133 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    368951 ~ 3%     -16.3%     308670 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
    374178 ~ 4%     -16.3%     313202 ~ 1%  TOTAL proc-vmstat.numa_pte_upda=
tes

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       919 ~ 7%     +44.1%       1324 ~23%  lkp-sb03/thrulay/300s
    219218 ~ 3%     -31.3%     150603 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
    220137 ~ 3%     -31.0%     151928 ~ 1%  TOTAL proc-vmstat.numa_hint_fau=
lts

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.80 ~ 5%     +21.1%       2.18 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.71 ~ 2%     +70.6%       1.21 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      2.51 ~ 4%     +35.1%       3.39 ~ 2%  TOTAL perf-profile.cpu-cycles._=
_pthread_disable_asynccancel.start_thread

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      9883 ~ 4%      -7.5%       9145 ~ 3%  lkp-sb03/nepim/300s-25%-udp6
      9459 ~ 3%     +78.7%      16904 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     15633 ~20%     -38.6%       9605 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
      9202 ~ 3%     +38.9%      12783 ~23%  lkp-snb01/hackbench/50%-process=
-socket
     44178 ~ 9%      +9.6%      48438 ~ 9%  TOTAL numa-vmstat.node0.nr_acti=
ve_file

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     39535 ~ 4%      -7.5%      36584 ~ 3%  lkp-sb03/nepim/300s-25%-udp6
     37841 ~ 3%     +79.0%      67744 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     62533 ~20%     -38.6%      38423 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
     36811 ~ 3%     +38.9%      51134 ~23%  lkp-snb01/hackbench/50%-process=
-socket
    176720 ~ 9%      +9.7%     193885 ~ 8%  TOTAL numa-meminfo.node0.Active=
(file)

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.88 ~ 3%     +56.3%       1.37 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      0.87 ~ 3%     +41.3%       1.23 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      1.75 ~ 3%     +48.8%       2.60 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
mpxchg_double_slab.isra.52.__slab_free.kmem_cache_free.kfree_skbmem.consume=
_skb

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    555134 ~ 0%     +23.5%     685485 ~11%  lkp-sb03/nepim/300s-100%-tcp
   1051233 ~15%     +58.1%    1661779 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   1176668 ~ 2%     +50.1%    1766141 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    524339 ~ 5%     +64.5%     862347 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    630814 ~ 1%     +66.2%    1048417 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    477843 ~ 1%     +14.3%     546220 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
   4416032 ~ 5%     +48.8%    6570390 ~ 3%  TOTAL numa-meminfo.node0.MemUsed

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.30 ~ 2%     +40.4%       1.82 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      1.30 ~ 2%     +40.4%       1.82 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_fget_light.sys_write.system_call_fastpath.__write_nocancel

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1942 ~ 0%     +25.9%       2445 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1398 ~ 0%     -19.6%       1124 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1903 ~ 0%     -46.0%       1028 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      2111 ~ 1%     +22.1%       2578 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      1777 ~ 0%     -46.3%        954 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      2009 ~ 0%     +27.6%       2565 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     11143 ~ 0%      -4.0%      10696 ~ 1%  TOTAL uptime.idle

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    707650 ~ 0%     -18.8%     574550 ~14%  lkp-sb03/nepim/300s-100%-tcp
   2248066 ~ 5%     -41.5%    1314386 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   2416921 ~ 2%     -32.2%    1639330 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   1043649 ~ 3%     -30.1%     729789 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1174630 ~ 1%     -34.4%     770016 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    582159 ~ 0%     -10.4%     521613 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
   8173077 ~ 2%     -32.1%    5549686 ~ 4%  TOTAL numa-meminfo.node1.MemUsed

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    147755 ~ 4%     -41.4%      86619 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
     67168 ~ 2%     -11.1%      59729 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
    214923 ~ 3%     -31.9%     146349 ~ 2%  TOTAL proc-vmstat.numa_hint_fau=
lts_local

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.60 ~ 6%     +18.9%       1.91 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.89 ~ 9%     +20.3%       1.07 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.61 ~ 2%     +79.8%       1.10 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      3.10 ~ 6%     +31.4%       4.08 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
ystem_call_after_swapgs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1245 ~ 8%     +25.4%       1562 ~ 7%  lkp-sb03/nepim/300s-25%-tcp
      1432 ~21%     +25.9%       1803 ~ 7%  lkp-sb03/nepim/300s-25%-tcp6
    384498 ~ 5%     -47.3%     202806 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    394577 ~ 1%     -34.3%     259067 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      2079 ~ 6%     -22.5%       1611 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1949 ~ 3%     -18.1%       1595 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     19295 ~ 0%     -35.9%      12376 ~11%  lkp-snb01/hackbench/50%-process=
-pipe
     19235 ~ 0%     -28.3%      13799 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
    824312 ~ 3%     -40.0%     494620 ~ 3%  TOTAL numa-meminfo.node1.PageTa=
bles

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2.14 ~ 6%     +23.0%       2.64 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.18 ~ 8%     +13.0%       1.34 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.75 ~ 1%     +84.1%       1.39 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      4.08 ~ 5%     +31.4%       5.36 ~ 2%  TOTAL perf-profile.cpu-cycles.s=
ystem_call

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       308 ~ 8%     +26.8%        390 ~ 7%  lkp-sb03/nepim/300s-25%-tcp
       357 ~21%     +26.4%        452 ~ 7%  lkp-sb03/nepim/300s-25%-tcp6
     96051 ~ 6%     -49.3%      48671 ~ 5%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     97606 ~ 1%     -33.5%      64870 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-socket
       519 ~ 6%     -22.1%        404 ~17%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       486 ~ 3%     -17.7%        400 ~11%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      4836 ~ 0%     -35.9%       3098 ~10%  lkp-snb01/hackbench/50%-process=
-pipe
      4806 ~ 0%     -28.2%       3449 ~ 8%  lkp-snb01/hackbench/50%-process=
-socket
    204971 ~ 3%     -40.6%     121735 ~ 4%  TOTAL numa-vmstat.node1.nr_page=
_table_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

   6523562 ~15%     -10.8%    5818368 ~16%  lkp-sb03/nuttcp/300s
   6523562 ~15%     -10.8%    5818368 ~16%  TOTAL meminfo.DirectMap2M

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     33435 ~ 7%     +21.0%      40458 ~ 4%  lkp-sb03/nepim/300s-100%-tcp6
     28760 ~ 4%     +13.5%      32648 ~ 1%  lkp-sb03/nepim/300s-25%-udp
     26586 ~ 2%     +13.9%      30295 ~ 8%  lkp-sb03/nuttcp/300s
    425914 ~ 8%     -53.5%     197944 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    558352 ~ 3%     -34.2%     367403 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    206983 ~ 2%     -46.3%     111181 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    337005 ~ 1%     -29.2%     238687 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     67896 ~ 3%     -32.5%      45821 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
     75769 ~ 2%     -16.0%      63666 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
     40707 ~ 2%     -15.9%      34239 ~10%  lkp-snb01/hackbench/50%-threads=
-pipe
     45364 ~ 4%      +9.3%      49578 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
   1846775 ~ 4%     -34.4%    1211924 ~ 3%  TOTAL numa-meminfo.node1.SUnrec=
laim

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      8357 ~ 7%     +21.0%      10115 ~ 4%  lkp-sb03/nepim/300s-100%-tcp6
      7190 ~ 4%     +13.5%       8161 ~ 1%  lkp-sb03/nepim/300s-25%-udp
      6646 ~ 2%     +14.0%       7573 ~ 8%  lkp-sb03/nuttcp/300s
    106180 ~ 8%     -54.6%      48163 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    138795 ~ 3%     -33.2%      92656 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     51574 ~ 2%     -46.0%      27873 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     84460 ~ 0%     -27.6%      61158 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     16978 ~ 3%     -32.5%      11454 ~ 7%  lkp-snb01/hackbench/50%-process=
-pipe
     18938 ~ 2%     -16.0%      15915 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
     10172 ~ 1%     -15.8%       8561 ~10%  lkp-snb01/hackbench/50%-threads=
-pipe
     11338 ~ 4%      +9.3%      12390 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
    460631 ~ 4%     -34.0%     304021 ~ 3%  TOTAL numa-vmstat.node1.nr_slab=
_unreclaimable

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

 1.608e+08 ~ 3%    +103.0%  3.265e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.854e+08 ~ 3%     +29.8%  2.407e+08 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  46422733 ~ 0%     +10.3%   51188106 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
   1978195 ~ 1%     +16.2%    2298776 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
 3.945e+08 ~ 3%     +57.3%  6.206e+08 ~ 2%  TOTAL proc-vmstat.numa_local

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

 1.608e+08 ~ 3%    +103.0%  3.265e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.854e+08 ~ 3%     +29.8%  2.407e+08 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  46426934 ~ 0%     +10.3%   51192304 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
   1982395 ~ 1%     +16.2%    2302974 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
 3.946e+08 ~ 3%     +57.3%  6.206e+08 ~ 2%  TOTAL proc-vmstat.numa_hit

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    113518 ~ 1%     -28.2%      81532 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
    113518 ~ 1%     -28.2%      81532 ~ 2%  TOTAL cpuidle.C3-NHM.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     51111 ~ 3%     +17.5%      60051 ~ 4%  lkp-sb03/nepim/300s-100%-tcp6
     43770 ~ 3%     +11.2%      48652 ~ 4%  lkp-sb03/nuttcp/300s
    461552 ~ 8%     -51.3%     224806 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    603433 ~ 3%     -34.1%     397917 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    236378 ~ 3%     -42.8%     135284 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    377714 ~ 0%     -29.3%     267064 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     87519 ~ 2%     -20.9%      69257 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
    103159 ~ 2%     -15.6%      87084 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
     62787 ~ 2%     -12.9%      54669 ~ 8%  lkp-snb01/hackbench/50%-threads=
-pipe
   2027426 ~ 4%     -33.7%    1344788 ~ 3%  TOTAL numa-meminfo.node1.Slab

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.81 ~ 3%     +51.2%       1.23 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      0.80 ~ 2%     +33.0%       1.06 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      1.61 ~ 2%     +42.2%       2.29 ~ 3%  TOTAL perf-profile.cpu-cycles.s=
ock_has_perm.selinux_socket_sendmsg.security_socket_sendmsg.sock_aio_write.=
do_sync_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.65 ~20%     +36.1%       0.89 ~12%  xps2/pigz/100%-512K
      0.65 ~20%     +36.1%       0.89 ~12%  TOTAL perf-profile.cpu-cycles.t=
ask_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.tick_sc=
hed_timer

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6.49 ~ 7%     +13.2%       7.35 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      2.40 ~ 1%     +50.3%       3.60 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      2.20 ~ 2%     +46.5%       3.23 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     11.09 ~ 5%     +27.9%      14.18 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.skb_copy_datagram_iovec.unix_stream_recvmsg.sock_ai=
o_read.sock_aio_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.94 ~22%     +48.0%       2.88 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.98 ~ 5%     +27.7%       2.52 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.01 ~ 2%     +13.2%       1.14 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
      4.93 ~11%     +32.7%       6.54 ~ 2%  TOTAL perf-profile.cpu-cycles.c=
opy_page_to_iter_iovec.copy_page_to_iter.pipe_read.new_sync_read.vfs_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.69 ~ 3%     -25.8%       1.25 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.69 ~ 3%     -25.8%       1.25 ~ 3%  TOTAL perf-profile.cpu-cycles.f=
put.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       323 ~ 8%     +30.8%        423 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
       343 ~14%     +51.4%        520 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
       666 ~11%     +41.4%        943 ~ 5%  TOTAL slabinfo.taskstats.active=
_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       323 ~ 8%     +30.8%        423 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
       343 ~14%     +51.4%        520 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
       666 ~11%     +41.4%        943 ~ 5%  TOTAL slabinfo.taskstats.num_ob=
js

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.07 ~ 2%     -27.7%       0.77 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      1.05 ~ 4%     -24.8%       0.79 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      2.12 ~ 3%     -26.3%       1.56 ~ 1%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.92 ~ 3%     +10.9%       2.13 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.83 ~ 7%     +28.2%       2.35 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1.60 ~ 1%     +52.0%       2.43 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
      1.37 ~ 3%     +62.0%       2.23 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      6.73 ~ 4%     +35.8%       9.14 ~ 4%  TOTAL perf-profile.cpu-cycles.k=
free.skb_free_head.skb_release_data.skb_release_all.consume_skb

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     10557 ~ 1%     -15.5%       8923 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      9981 ~ 4%     +16.6%      11637 ~ 6%  lkp-sb03/nepim/300s-100%-tcp
      9598 ~ 1%     +12.3%      10775 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
      6877 ~ 4%     +30.9%       8999 ~15%  lkp-sb03/nepim/300s-25%-tcp
      7404 ~ 3%     +22.5%       9071 ~12%  lkp-sb03/nepim/300s-25%-tcp6
     20340 ~ 0%     +91.7%      39000 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      5500 ~ 4%      -8.1%       5056 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
     19281 ~ 0%    +103.4%      39216 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     89540 ~ 2%     +48.2%     132678 ~ 3%  TOTAL slabinfo.kmalloc-512.num_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1840 ~ 4%     +18.6%       2184 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       364 ~13%     +60.7%        585 ~ 5%  lkp-sb03/nepim/300s-100%-tcp
       442 ~11%     +41.2%        624 ~13%  lkp-sb03/nepim/300s-100%-udp6
       468 ~ 0%     +19.4%        559 ~ 6%  lkp-sb03/nepim/300s-25%-tcp
       429 ~ 0%     +39.4%        598 ~ 8%  lkp-sb03/nepim/300s-25%-tcp6
       455 ~14%     +34.3%        611 ~10%  lkp-sb03/nepim/300s-25%-udp
       442 ~ 8%     +35.3%        598 ~ 6%  lkp-sb03/nuttcp/300s
      4440 ~ 6%     +29.7%       5759 ~ 7%  TOTAL slabinfo.blkdev_ioc.activ=
e_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1840 ~ 4%     +18.6%       2184 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       364 ~13%     +60.7%        585 ~ 5%  lkp-sb03/nepim/300s-100%-tcp
       442 ~11%     +41.2%        624 ~13%  lkp-sb03/nepim/300s-100%-udp6
       468 ~ 0%     +19.4%        559 ~ 6%  lkp-sb03/nepim/300s-25%-tcp
       429 ~ 0%     +39.4%        598 ~ 8%  lkp-sb03/nepim/300s-25%-tcp6
       455 ~14%     +34.3%        611 ~10%  lkp-sb03/nepim/300s-25%-udp
       442 ~ 8%     +35.3%        598 ~ 6%  lkp-sb03/nuttcp/300s
      4440 ~ 6%     +29.7%       5759 ~ 7%  TOTAL slabinfo.blkdev_ioc.num_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

 1.642e+08 ~ 3%    +102.1%  3.319e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.884e+08 ~ 3%     +29.7%  2.443e+08 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  14343538 ~ 0%     -12.0%   12627073 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  46508656 ~ 0%     +10.2%   51273397 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
   7315676 ~ 1%     +22.0%    8926297 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
 4.208e+08 ~ 2%     +54.2%   6.49e+08 ~ 2%  TOTAL proc-vmstat.pgfree

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     46998 ~ 1%     +10.3%      51840 ~ 2%  lkp-sb03/nepim/300s-25%-tcp
     46397 ~ 5%     +12.6%      52255 ~ 3%  lkp-sb03/nepim/300s-25%-tcp6
     50269 ~ 4%     +12.0%      56287 ~ 5%  lkp-sb03/nepim/300s-25%-udp6
     48978 ~ 3%     +10.3%      54047 ~ 5%  lkp-sb03/nuttcp/300s
    464333 ~ 2%     -33.7%     307875 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    486395 ~ 1%     -26.4%     358003 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    221951 ~ 6%     -41.9%     129046 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    234076 ~ 3%     -47.2%     123647 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     73063 ~16%     +27.9%      93424 ~ 5%  lkp-snb01/hackbench/50%-process=
-pipe
    102722 ~ 2%     -20.5%      81643 ~15%  lkp-snb01/hackbench/50%-process=
-socket
   1775186 ~ 3%     -26.3%    1308070 ~ 6%  TOTAL numa-meminfo.node1.Active

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.33 ~ 1%     +10.3%       1.47 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      1.27 ~ 7%     +20.7%       1.53 ~ 5%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.87 ~ 1%     +50.4%       1.31 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      0.82 ~ 2%     +46.7%       1.20 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      4.29 ~ 3%     +28.5%       5.51 ~ 3%  TOTAL perf-profile.cpu-cycles.k=
mem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_aio_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     12495 ~ 4%     -17.3%      10339 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
     12334 ~ 5%     -18.4%      10067 ~15%  lkp-sb03/nepim/300s-100%-tcp
     12750 ~ 2%     -14.5%      10901 ~ 1%  lkp-sb03/nepim/300s-100%-tcp6
     12717 ~ 1%     -15.8%      10704 ~ 3%  lkp-sb03/nepim/300s-100%-udp6
     12688 ~ 1%     -20.5%      10088 ~ 9%  lkp-sb03/nepim/300s-25%-tcp
     11901 ~ 4%     -16.9%       9887 ~11%  lkp-sb03/nepim/300s-25%-udp
     12825 ~ 9%     -20.9%      10148 ~11%  lkp-sb03/nepim/300s-25%-udp6
     12550 ~ 8%     -17.0%      10421 ~ 5%  lkp-sb03/nuttcp/300s
    173587 ~ 9%     -16.9%     144174 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     34681 ~ 1%     -10.7%      30955 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     15024 ~ 0%     +93.3%      29042 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     14443 ~ 0%    +103.1%      29336 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    337999 ~ 6%      -6.5%     316065 ~ 3%  TOTAL slabinfo.kmalloc-256.acti=
ve_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     10461 ~ 2%     -15.0%       8890 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      9675 ~ 5%     +16.5%      11266 ~ 6%  lkp-sb03/nepim/300s-100%-tcp
      9236 ~ 1%     +12.9%      10425 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
      6535 ~ 4%     +31.9%       8621 ~16%  lkp-sb03/nepim/300s-25%-tcp
      7063 ~ 4%     +23.2%       8704 ~13%  lkp-sb03/nepim/300s-25%-tcp6
    161906 ~ 9%     -17.9%     132939 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     15834 ~ 0%     +88.2%      29807 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      5499 ~ 4%      -8.4%       5035 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
     15208 ~ 0%     +97.5%      30039 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    241419 ~ 7%      +1.8%     245730 ~ 2%  TOTAL slabinfo.kmalloc-512.acti=
ve_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     16905 ~ 3%     +22.3%      20680 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      9281 ~11%     +43.8%      13344 ~ 8%  lkp-sb03/nepim/300s-100%-tcp
      8039 ~ 1%     +43.1%      11508 ~ 0%  lkp-sb03/nepim/300s-100%-tcp6
      8499 ~ 2%     +23.8%      10522 ~ 1%  lkp-sb03/nepim/300s-100%-udp
      8754 ~12%     +31.5%      11508 ~11%  lkp-sb03/nepim/300s-100%-udp6
      7937 ~ 2%     +38.8%      11015 ~ 8%  lkp-sb03/nepim/300s-25%-tcp
      8363 ~12%     +31.3%      10981 ~ 3%  lkp-sb03/nepim/300s-25%-tcp6
      7342 ~11%     +55.3%      11406 ~ 5%  lkp-sb03/nepim/300s-25%-udp
      7853 ~ 4%     +53.9%      12086 ~ 5%  lkp-sb03/nepim/300s-25%-udp6
      8345 ~ 4%     +28.9%      10760 ~ 1%  lkp-sb03/nuttcp/300s
      8788 ~11%     +18.2%      10386 ~ 5%  lkp-sb03/thrulay/300s
    246982 ~ 2%      -9.2%     224144 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9530 ~10%     +23.0%      11719 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      9122 ~ 9%     +39.0%      12678 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8582 ~ 4%     +42.3%      12208 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      8303 ~ 7%     +40.7%      11685 ~13%  lkp-snb01/hackbench/50%-threads=
-socket
      3760 ~ 5%     +15.9%       4357 ~ 6%  xps2/pigz/100%-128K
      3543 ~ 6%     +25.3%       4439 ~ 9%  xps2/pigz/100%-512K
    389934 ~ 4%      +6.5%     415431 ~ 2%  TOTAL slabinfo.anon_vma.active_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     16905 ~ 3%     +22.3%      20680 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
      9281 ~11%     +43.8%      13344 ~ 8%  lkp-sb03/nepim/300s-100%-tcp
      8039 ~ 1%     +43.1%      11508 ~ 0%  lkp-sb03/nepim/300s-100%-tcp6
      8499 ~ 2%     +23.8%      10522 ~ 1%  lkp-sb03/nepim/300s-100%-udp
      8754 ~12%     +31.5%      11508 ~11%  lkp-sb03/nepim/300s-100%-udp6
      7937 ~ 2%     +38.8%      11015 ~ 8%  lkp-sb03/nepim/300s-25%-tcp
      8363 ~12%     +31.3%      10981 ~ 3%  lkp-sb03/nepim/300s-25%-tcp6
      7342 ~11%     +55.3%      11406 ~ 5%  lkp-sb03/nepim/300s-25%-udp
      7853 ~ 4%     +53.9%      12086 ~ 5%  lkp-sb03/nepim/300s-25%-udp6
      8345 ~ 4%     +28.9%      10760 ~ 1%  lkp-sb03/nuttcp/300s
      8788 ~11%     +18.2%      10386 ~ 5%  lkp-sb03/thrulay/300s
    261436 ~ 2%      -8.7%     238598 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9530 ~10%     +23.0%      11719 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      9122 ~ 9%     +39.0%      12678 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      8582 ~ 4%     +42.3%      12208 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
      8303 ~ 7%     +40.7%      11685 ~13%  lkp-snb01/hackbench/50%-threads=
-socket
      3760 ~ 5%     +15.9%       4357 ~ 6%  xps2/pigz/100%-128K
      3543 ~ 6%     +25.3%       4439 ~ 9%  xps2/pigz/100%-512K
    404387 ~ 4%      +6.3%     429885 ~ 2%  TOTAL slabinfo.anon_vma.num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1137 ~ 5%     +38.7%       1577 ~ 8%  xps2/pigz/100%-128K
      1233 ~ 5%     +21.2%       1495 ~ 7%  xps2/pigz/100%-512K
      2370 ~ 5%     +29.6%       3072 ~ 7%  TOTAL cpuidle.C6-NHM.usage

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       490 ~ 6%     -30.4%        341 ~17%  lkp-sb03/nuttcp/300s
       490 ~ 6%     -30.4%        341 ~17%  TOTAL slabinfo.kmem_cache.activ=
e_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       490 ~ 6%     -30.4%        341 ~17%  lkp-sb03/nuttcp/300s
       490 ~ 6%     -30.4%        341 ~17%  TOTAL slabinfo.kmem_cache.num_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.87 ~ 4%     +21.8%       1.06 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1.09 ~ 5%     +38.7%       1.52 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1.05 ~ 3%     +31.0%       1.38 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
      3.01 ~ 4%     +31.2%       3.95 ~ 3%  TOTAL perf-profile.cpu-cycles._=
_slab_free.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     13036 ~ 4%     -18.7%      10599 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
     12799 ~ 4%     -21.3%      10068 ~15%  lkp-sb03/nepim/300s-100%-tcp
     13138 ~ 2%     -13.6%      11349 ~ 3%  lkp-sb03/nepim/300s-100%-tcp6
     12991 ~ 3%     -16.4%      10858 ~ 1%  lkp-sb03/nepim/300s-100%-udp6
     13010 ~ 3%     -17.4%      10752 ~ 5%  lkp-sb03/nepim/300s-25%-tcp
     12373 ~ 3%     -18.6%      10067 ~11%  lkp-sb03/nepim/300s-25%-udp
     13245 ~ 7%     -21.7%      10368 ~10%  lkp-sb03/nepim/300s-25%-udp6
     12949 ~ 6%     -16.1%      10858 ~ 3%  lkp-sb03/nuttcp/300s
     34931 ~ 1%     -10.6%      31216 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     19752 ~ 0%     +94.3%      38373 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     14760 ~ 8%     -11.4%      13084 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
     18856 ~ 0%    +104.9%      38631 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      2100 ~ 4%     -13.9%       1807 ~ 4%  xps2/pigz/100%-128K
    193944 ~ 3%      +7.3%     208035 ~ 3%  TOTAL slabinfo.kmalloc-256.num_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       598 ~ 8%     -21.7%        468 ~11%  lkp-sb03/nepim/300s-25%-tcp
       585 ~ 9%     -22.2%        455 ~ 8%  lkp-sb03/nepim/300s-25%-tcp6
      1183 ~ 8%     -22.0%        923 ~ 9%  TOTAL slabinfo.buffer_head.acti=
ve_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       598 ~ 8%     -21.7%        468 ~11%  lkp-sb03/nepim/300s-25%-tcp
       585 ~ 9%     -22.2%        455 ~ 8%  lkp-sb03/nepim/300s-25%-tcp6
      1183 ~ 8%     -22.0%        923 ~ 9%  TOTAL slabinfo.buffer_head.num_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     34373 ~ 5%     +16.7%      40123 ~ 6%  lkp-sb03/nepim/300s-25%-tcp
     35521 ~ 6%     +21.8%      43258 ~ 4%  lkp-sb03/thrulay/300s
   2733841 ~ 4%     -38.4%    1682955 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   4112625 ~ 2%     -18.1%    3367793 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1496304 ~ 2%     +18.1%    1767380 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
   1423436 ~ 4%     -14.8%    1212900 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
   1407562 ~ 0%     +33.9%    1884784 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
    103996 ~ 0%     -32.7%      69985 ~13%  xps2/pigz/100%-128K
    106317 ~ 1%     -33.4%      70845 ~14%  xps2/pigz/100%-512K
  11453977 ~ 2%     -11.5%   10140026 ~ 2%  TOTAL softirqs.RCU

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    181156 ~ 4%     +24.4%     225371 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
     13586 ~ 2%     +41.1%      19168 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
    194742 ~ 4%     +25.6%     244539 ~ 2%  TOTAL proc-vmstat.pgmigrate_suc=
cess

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    181156 ~ 4%     +24.4%     225371 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
     13586 ~ 2%     +41.1%      19168 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
    194742 ~ 4%     +25.6%     244539 ~ 2%  TOTAL proc-vmstat.numa_pages_mi=
grated

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.36 ~ 4%     +16.2%       1.58 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.70 ~ 6%     +50.6%       1.05 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
      2.05 ~ 5%     +27.9%       2.62 ~ 3%  TOTAL perf-profile.cpu-cycles.v=
fs_read.sys_read.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     21233 ~ 3%     -12.9%      18492 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
     20342 ~ 0%     -13.6%      17569 ~ 9%  lkp-sb03/nepim/300s-100%-udp6
     19967 ~ 8%     +64.0%      32749 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     23526 ~11%     +42.4%      33511 ~13%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     24064 ~ 8%     -20.4%      19155 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
     18234 ~ 6%     +23.5%      22518 ~12%  lkp-snb01/hackbench/50%-process=
-socket
    127367 ~ 6%     +13.1%     143995 ~ 8%  TOTAL numa-meminfo.node0.SRecla=
imable

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       589 ~ 5%     -19.2%        476 ~11%  lkp-sb03/nepim/300s-100%-tcp6
       634 ~ 5%     -21.4%        498 ~ 6%  lkp-sb03/nepim/300s-100%-udp
      1224 ~ 5%     -20.4%        974 ~ 8%  TOTAL slabinfo.dnotify_mark.act=
ive_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       589 ~ 5%     -19.2%        476 ~11%  lkp-sb03/nepim/300s-100%-tcp6
       634 ~ 5%     -21.4%        498 ~ 6%  lkp-sb03/nepim/300s-100%-udp
      1224 ~ 5%     -20.4%        974 ~ 8%  TOTAL slabinfo.dnotify_mark.num=
_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

  4.06e+08 ~ 0%      -8.2%  3.727e+08 ~ 3%  lkp-sb03/nepim/300s-100%-tcp
 3.657e+08 ~ 0%     +13.7%  4.158e+08 ~ 0%  lkp-sb03/nuttcp/300s
 1.524e+08 ~ 4%     +96.6%  2.995e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 1.733e+08 ~ 3%     +27.2%  2.205e+08 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  13391577 ~ 0%     -15.7%   11295680 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
  42141128 ~ 0%     +10.0%   46369579 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
   6649375 ~ 1%     +22.0%    8114649 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
  1.16e+09 ~ 1%     +18.5%  1.374e+09 ~ 2%  TOTAL proc-vmstat.pgalloc_normal

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      5308 ~ 3%     -12.9%       4622 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
      5085 ~ 0%     -13.6%       4392 ~ 9%  lkp-sb03/nepim/300s-100%-udp6
      4992 ~ 8%     +63.6%       8168 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      5885 ~11%     +43.3%       8434 ~13%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      6016 ~ 8%     -20.4%       4788 ~ 6%  lkp-snb01/hackbench/50%-process=
-pipe
      4558 ~ 6%     +23.5%       5629 ~12%  lkp-snb01/hackbench/50%-process=
-socket
     31845 ~ 6%     +13.2%      36035 ~ 8%  TOTAL numa-vmstat.node0.nr_slab=
_reclaimable

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2261 ~ 4%     +15.2%       2604 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       586 ~18%     +52.5%        894 ~14%  lkp-sb03/nepim/300s-100%-udp6
      2848 ~ 7%     +22.9%       3499 ~ 8%  TOTAL slabinfo.blkdev_requests.=
num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2261 ~ 4%     +15.2%       2604 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
       586 ~18%     +52.5%        894 ~14%  lkp-sb03/nepim/300s-100%-udp6
      2848 ~ 7%     +22.9%       3499 ~ 8%  TOTAL slabinfo.blkdev_requests.=
active_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.85 ~ 1%     +22.8%       1.04 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      0.85 ~ 1%     +22.8%       1.04 ~ 6%  TOTAL perf-profile.cpu-cycles.s=
kb_release_data.skb_release_all.consume_skb.unix_stream_recvmsg.sock_aio_re=
ad

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.00 ~13%     +34.9%       1.35 ~ 9%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.00 ~13%     +34.9%       1.35 ~ 9%  TOTAL perf-profile.cpu-cycles.t=
ouch_atime.pipe_read.new_sync_read.vfs_read.sys_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1499 ~ 5%     +73.5%       2601 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      1462 ~ 4%     +29.0%       1886 ~ 2%  lkp-sb03/nepim/300s-100%-tcp
      1462 ~ 7%     +20.9%       1768 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
      1513 ~ 1%     +18.0%       1785 ~ 2%  lkp-sb03/nepim/300s-100%-udp
      1377 ~ 0%     +24.7%       1717 ~ 2%  lkp-sb03/nepim/300s-100%-udp6
      1428 ~ 5%     +27.4%       1818 ~ 3%  lkp-sb03/nepim/300s-25%-tcp
      1428 ~ 5%     +26.2%       1801 ~ 3%  lkp-sb03/nepim/300s-25%-tcp6
      1445 ~ 5%     +23.5%       1785 ~ 2%  lkp-sb03/nepim/300s-25%-udp
      1564 ~ 8%     +13.0%       1768 ~ 1%  lkp-sb03/nepim/300s-25%-udp6
      1512 ~ 5%     +13.5%       1717 ~ 5%  lkp-sb03/nuttcp/300s
      1581 ~ 6%     +12.9%       1785 ~ 2%  lkp-sb03/thrulay/300s
      1428 ~ 5%     +17.9%       1683 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1496 ~ 3%     +17.0%       1751 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1411 ~ 4%     +25.3%       1768 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      6212 ~ 2%     +29.0%       8012 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      5009 ~ 8%     +52.4%       7635 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
     31829 ~ 5%     +29.7%      41282 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1499 ~ 5%     +73.5%       2601 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      1462 ~ 4%     +29.0%       1886 ~ 2%  lkp-sb03/nepim/300s-100%-tcp
      1462 ~ 7%     +20.9%       1768 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
      1513 ~ 1%     +18.0%       1785 ~ 2%  lkp-sb03/nepim/300s-100%-udp
      1377 ~ 0%     +24.7%       1717 ~ 2%  lkp-sb03/nepim/300s-100%-udp6
      1428 ~ 5%     +27.4%       1818 ~ 3%  lkp-sb03/nepim/300s-25%-tcp
      1428 ~ 5%     +26.2%       1801 ~ 3%  lkp-sb03/nepim/300s-25%-tcp6
      1445 ~ 5%     +23.5%       1785 ~ 2%  lkp-sb03/nepim/300s-25%-udp
      1564 ~ 8%     +13.0%       1768 ~ 1%  lkp-sb03/nepim/300s-25%-udp6
      1512 ~ 5%     +13.5%       1717 ~ 5%  lkp-sb03/nuttcp/300s
      1581 ~ 6%     +12.9%       1785 ~ 2%  lkp-sb03/thrulay/300s
      1428 ~ 5%     +17.9%       1683 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1496 ~ 3%     +17.0%       1751 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1411 ~ 4%     +25.3%       1768 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
      6212 ~ 2%     +28.7%       7992 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      5001 ~ 7%     +51.0%       7552 ~ 6%  lkp-snb01/hackbench/50%-threads=
-socket
     31821 ~ 5%     +29.4%      41180 ~ 3%  TOTAL slabinfo.sock_inode_cache=
.active_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.20 ~ 4%     +28.0%       1.54 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
      1.20 ~ 4%     +28.0%       1.54 ~ 2%  TOTAL perf-profile.cpu-cycles.n=
ative_write_msr_safe

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2.26 ~ 4%     +26.5%       2.86 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      2.09 ~ 2%     +25.5%       2.62 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      4.35 ~ 3%     +26.0%       5.48 ~ 2%  TOTAL perf-profile.cpu-cycles.u=
nix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_write.sys_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       600 ~ 5%     -24.9%        451 ~13%  lkp-sb03/nuttcp/300s
       600 ~ 5%     -24.9%        451 ~13%  TOTAL slabinfo.kmem_cache_node.=
active_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     11272 ~ 8%     -32.4%       7623 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     10931 ~ 3%     -16.4%       9134 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      8045 ~ 0%     -10.7%       7188 ~ 3%  lkp-snb01/hackbench/50%-threads=
-pipe
     30248 ~ 4%     -20.8%      23946 ~ 3%  TOTAL slabinfo.proc_inode_cache=
.num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.69 ~17%     +30.4%       2.20 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1.79 ~ 4%     +11.6%       1.99 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      3.48 ~10%     +20.7%       4.20 ~ 4%  TOTAL perf-profile.cpu-cycles.p=
ipe_read.new_sync_read.vfs_read.sys_read.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       618 ~ 4%     -24.1%        469 ~12%  lkp-sb03/nuttcp/300s
       618 ~ 4%     -24.1%        469 ~12%  TOTAL slabinfo.kmem_cache_node.=
num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6440 ~ 2%     +25.5%       8079 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      6440 ~ 2%     +25.5%       8079 ~ 2%  TOTAL slabinfo.files_cache.num_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6440 ~ 2%     +25.1%       8057 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      6440 ~ 2%     +25.1%       8057 ~ 2%  TOTAL slabinfo.files_cache.acti=
ve_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.31 ~ 5%     +17.3%       1.53 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.29 ~ 1%     -24.5%       0.98 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
      2.60 ~ 3%      -3.5%       2.51 ~ 3%  TOTAL perf-profile.cpu-cycles.v=
fs_write.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      7776 ~ 1%     +34.7%      10476 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
     10023 ~ 1%     +12.7%      11295 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     17799 ~ 1%     +22.3%      21771 ~ 1%  TOTAL slabinfo.Acpi-Namespace.a=
ctive_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      7776 ~ 1%     +34.7%      10476 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
     10023 ~ 1%     +12.7%      11295 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     17799 ~ 1%     +22.3%      21771 ~ 1%  TOTAL slabinfo.Acpi-Namespace.n=
um_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2.37 ~ 9%     +34.4%       3.18 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2.12 ~ 4%     +28.1%       2.72 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      3.98 ~ 3%     -10.4%       3.57 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      8.47 ~ 5%     +11.8%       9.47 ~ 1%  TOTAL perf-profile.cpu-cycles.m=
utex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     17675 ~ 4%     +10.8%      19592 ~ 4%  lkp-sb03/nepim/300s-100%-tcp6
     35637 ~11%     -24.6%      26861 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     45081 ~ 3%     -32.3%      30513 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     29394 ~17%     -18.0%      24102 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     40709 ~ 5%     -30.3%      28377 ~15%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     19622 ~10%     +19.4%      23436 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
     27389 ~ 3%     -14.5%      23417 ~11%  lkp-snb01/hackbench/50%-process=
-socket
    215507 ~ 7%     -18.2%     176300 ~ 7%  TOTAL numa-meminfo.node1.SRecla=
imable

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      4418 ~ 4%     +10.8%       4898 ~ 4%  lkp-sb03/nepim/300s-100%-tcp6
      8898 ~11%     -24.7%       6702 ~ 7%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     11258 ~ 3%     -32.1%       7648 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      7342 ~17%     -17.9%       6030 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     10198 ~ 5%     -30.4%       7096 ~14%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      4904 ~10%     +19.5%       5858 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      6846 ~ 3%     -14.5%       5854 ~11%  lkp-snb01/hackbench/50%-process=
-socket
     53867 ~ 7%     -18.2%      44088 ~ 7%  TOTAL numa-vmstat.node1.nr_slab=
_reclaimable

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2074 ~ 5%     +15.8%       2402 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       602 ~17%     +44.2%        868 ~12%  lkp-sb03/nepim/300s-100%-udp6
      2676 ~ 7%     +22.2%       3270 ~ 7%  TOTAL slabinfo.xfs_buf.num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2074 ~ 5%     +15.8%       2402 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
       602 ~17%     +44.2%        868 ~12%  lkp-sb03/nepim/300s-100%-udp6
      2676 ~ 7%     +22.2%       3270 ~ 7%  TOTAL slabinfo.xfs_buf.active_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6507 ~ 2%     +24.0%       8066 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      2359 ~ 2%     -17.4%       1949 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      7144 ~ 1%     +12.2%       8017 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
       301 ~ 0%     +32.4%        398 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
       272 ~ 0%     +18.8%        323 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
       307 ~ 1%     +33.0%        408 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
       273 ~ 0%     +22.3%        334 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     17165 ~ 2%     +13.6%      19498 ~ 0%  TOTAL vmstat.procs.r

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.06 ~ 8%     +19.5%       1.27 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.06 ~ 8%     +19.5%       1.27 ~ 3%  TOTAL perf-profile.cpu-cycles.f=
snotify.vfs_write.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.66 ~ 2%     +11.6%       1.85 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      2.25 ~ 3%     +37.1%       3.09 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
      3.91 ~ 3%     +26.3%       4.94 ~ 5%  TOTAL perf-profile.cpu-cycles._=
_fget.__fget_light.__fdget_pos.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6824 ~ 2%     +13.8%       7766 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      6904 ~ 0%     -15.9%       5803 ~ 9%  lkp-snb01/hackbench/50%-threads=
-pipe
      6306 ~ 1%     +24.7%       7864 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     20035 ~ 1%      +7.0%      21434 ~ 3%  TOTAL slabinfo.task_xstate.num_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.14 ~ 4%     +23.0%       1.41 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1.04 ~ 3%     +19.0%       1.24 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      2.19 ~ 3%     +21.1%       2.65 ~ 2%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_aio_write.do_=
sync_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6819 ~ 2%     +13.1%       7716 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      6904 ~ 0%     -16.7%       5748 ~ 9%  lkp-snb01/hackbench/50%-threads=
-pipe
      6304 ~ 1%     +23.7%       7800 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     20027 ~ 1%      +6.2%      21264 ~ 3%  TOTAL slabinfo.task_xstate.acti=
ve_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.23 ~ 4%     +21.1%       1.49 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.23 ~ 4%     +21.1%       1.49 ~ 2%  TOTAL perf-profile.cpu-cycles.n=
ew_sync_write.vfs_write.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.09 ~ 5%     +19.2%       1.30 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.09 ~ 5%     +19.2%       1.30 ~ 0%  TOTAL perf-profile.cpu-cycles.m=
utex_lock.pipe_write.new_sync_write.vfs_write.sys_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     56653 ~22%     +28.9%      73003 ~ 4%  lkp-sb03/nepim/300s-100%-tcp6
     65693 ~ 5%     +19.2%      78329 ~ 5%  lkp-sb03/nepim/300s-100%-udp
     45982 ~14%     +23.5%      56799 ~ 1%  lkp-sb03/nepim/300s-25%-tcp6
     52960 ~12%     +33.5%      70715 ~ 7%  lkp-sb03/nuttcp/300s
   9630007 ~ 3%     -13.0%    8376359 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     54856 ~ 1%     -11.8%      48377 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
   9906152 ~ 3%     -12.1%    8703583 ~ 2%  TOTAL meminfo.Committed_AS

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6.06 ~ 6%     +14.3%       6.93 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      3.98 ~ 7%     +18.3%       4.71 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      3.66 ~ 5%     +18.4%       4.33 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     13.70 ~ 6%     +16.5%      15.97 ~ 1%  TOTAL perf-profile.cpu-cycles.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_wr=
ite

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      4.81 ~ 9%     +16.8%       5.62 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      3.44 ~ 4%     -15.8%       2.90 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      3.34 ~ 3%     -18.6%       2.72 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     11.59 ~ 5%      -3.0%      11.24 ~ 1%  TOTAL perf-profile.cpu-cycles.u=
nix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_read.vfs_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       350 ~12%     +27.7%        447 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
      9189 ~ 2%      -9.6%       8302 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9539 ~ 2%      -8.3%       8749 ~ 0%  TOTAL slabinfo.vm_area_struct.n=
um_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       350 ~12%     +27.7%        447 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
      9189 ~ 2%      -9.6%       8302 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9539 ~ 2%      -8.3%       8749 ~ 0%  TOTAL slabinfo.vm_area_struct.a=
ctive_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     17517 ~ 3%     +13.0%      19800 ~ 3%  lkp-sb03/nepim/300s-100%-tcp
     15419 ~12%     +27.7%      19685 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
     16014 ~ 7%     +14.4%      18319 ~ 7%  lkp-sb03/nepim/300s-100%-udp6
     15628 ~ 6%     +16.0%      18125 ~ 5%  lkp-sb03/nepim/300s-25%-tcp
     16925 ~ 1%     +19.2%      20172 ~ 7%  lkp-sb03/nepim/300s-25%-tcp6
     14385 ~ 4%     +21.1%      17425 ~ 6%  lkp-sb03/nepim/300s-25%-udp
    404354 ~ 2%      -9.6%     365336 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     18083 ~ 7%     -16.8%      15036 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      3266 ~ 2%     -11.9%       2876 ~ 2%  xps2/pigz/100%-128K
      3288 ~ 3%     -12.5%       2876 ~ 4%  xps2/pigz/100%-512K
    524882 ~ 3%      -4.8%     499654 ~ 2%  TOTAL slabinfo.vm_area_struct.n=
um_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     76464 ~10%     +22.3%      93530 ~ 6%  lkp-sb03/nepim/300s-100%-tcp6
     80560 ~ 9%     +12.7%      90800 ~ 4%  lkp-sb03/nepim/300s-100%-udp6
     80560 ~ 5%     +13.6%      91482 ~ 9%  lkp-sb03/nepim/300s-25%-udp
     82608 ~ 4%     +13.2%      93530 ~ 5%  lkp-sb03/nepim/300s-25%-udp6
     71002 ~ 5%     +10.6%      78512 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     65541 ~ 3%     +31.2%      86021 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    456736 ~ 6%     +16.9%     533877 ~ 6%  TOTAL meminfo.DirectMap4k

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     17435 ~ 3%     +11.6%      19462 ~ 4%  lkp-sb03/nepim/300s-100%-tcp
     15173 ~12%     +29.5%      19656 ~ 5%  lkp-sb03/nepim/300s-100%-tcp6
     15506 ~ 9%     +23.0%      19076 ~ 8%  lkp-sb03/nepim/300s-100%-udp
     16001 ~ 7%     +13.4%      18138 ~ 7%  lkp-sb03/nepim/300s-100%-udp6
     15485 ~ 5%     +14.6%      17743 ~ 6%  lkp-sb03/nepim/300s-25%-tcp
     16727 ~ 2%     +19.1%      19918 ~ 7%  lkp-sb03/nepim/300s-25%-tcp6
     14364 ~ 4%     +20.0%      17241 ~ 6%  lkp-sb03/nepim/300s-25%-udp
    387410 ~ 2%     -10.0%     348665 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     17938 ~ 7%     -16.9%      14911 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      3221 ~ 2%     -12.2%       2828 ~ 3%  xps2/pigz/100%-128K
      3243 ~ 3%     -12.8%       2826 ~ 4%  xps2/pigz/100%-512K
    522505 ~ 3%      -4.2%     500469 ~ 2%  TOTAL slabinfo.vm_area_struct.a=
ctive_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     12006 ~ 0%     -21.2%       9466 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      9831 ~ 1%     +10.3%      10843 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      9309 ~ 1%     +17.5%      10942 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     31148 ~ 1%      +0.3%      31252 ~ 2%  TOTAL slabinfo.kmalloc-128.num_=
objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     12002 ~ 0%     -21.3%       9450 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      9814 ~ 2%     +10.4%      10834 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      9303 ~ 1%     +17.6%      10941 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
     31119 ~ 1%      +0.3%      31226 ~ 2%  TOTAL slabinfo.kmalloc-128.acti=
ve_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3.49 ~ 8%     +12.3%       3.92 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      3.49 ~ 8%     +12.3%       3.92 ~ 3%  TOTAL perf-profile.cpu-cycles.u=
nix_destruct_scm.skb_release_all.consume_skb.unix_stream_recvmsg.sock_aio_r=
ead

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.49 ~ 6%     +14.7%       1.71 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1.49 ~ 6%     +14.7%       1.71 ~ 1%  TOTAL perf-profile.cpu-cycles.s=
kb_copy_datagram_iovec.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_s=
ync_read

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.94 ~ 1%     -11.7%       1.71 ~ 4%  lkp-snb01/hackbench/50%-process=
-pipe
      2.54 ~ 2%     -20.1%       2.03 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      4.48 ~ 1%     -16.4%       3.75 ~ 2%  TOTAL perf-profile.cpu-cycles.p=
ipe_write.new_sync_write.vfs_write.sys_write.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

   5331418 ~ 4%     +18.2%    6303841 ~ 3%  xps2/pigz/100%-128K
   5795986 ~ 3%     +11.8%    6478564 ~ 4%  xps2/pigz/100%-512K
  11127404 ~ 4%     +14.9%   12782405 ~ 4%  TOTAL cpuidle.C6-NHM.time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1633 ~ 3%     +20.3%       1965 ~ 5%  lkp-nex04/ebizzy/200%-100x-10s
      1633 ~ 3%     +20.3%       1965 ~ 5%  TOTAL numa-meminfo.node2.Kernel=
Stack

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     28546 ~ 0%     +15.8%      33069 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     21721 ~ 0%     +18.6%      25751 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     50268 ~ 0%     +17.0%      58820 ~ 0%  TOTAL proc-vmstat.nr_slab_unrec=
laimable

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.89 ~ 6%     +21.7%       1.08 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      0.97 ~ 3%     +10.0%       1.07 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1.86 ~ 5%     +15.6%       2.15 ~ 3%  TOTAL perf-profile.cpu-cycles.k=
size.__alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    114140 ~ 0%     +15.9%     132276 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     86858 ~ 0%     +18.6%     103041 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    200998 ~ 0%     +17.1%     235318 ~ 0%  TOTAL meminfo.SUnreclaim

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      0.96 ~ 2%     +14.2%       1.10 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      0.96 ~ 2%     +14.2%       1.10 ~ 1%  TOTAL perf-profile.cpu-cycles._=
raw_spin_unlock_irqrestore.__wake_up_sync_key.pipe_write.new_sync_write.vfs=
_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1749 ~ 5%     +12.2%       1962 ~ 6%  lkp-sb03/nepim/300s-25%-udp6
      1770 ~ 1%     +11.4%       1973 ~ 4%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1754 ~ 3%     +18.2%       2074 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1733 ~ 3%     +15.4%       1999 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1717 ~ 2%     +13.0%       1941 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      1727 ~ 3%     +17.2%       2024 ~ 4%  lkp-snb01/hackbench/50%-process=
-socket
     10453 ~ 3%     +14.6%      11975 ~ 4%  TOTAL slabinfo.kmalloc-2048.num=
_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1822 ~ 3%     +18.6%       2160 ~ 7%  lkp-nex04/ebizzy/200%-100x-10s
      1822 ~ 3%     +18.6%       2160 ~ 7%  TOTAL numa-meminfo.node3.Kernel=
Stack

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      8803 ~10%     -16.0%       7396 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      8455 ~ 2%     -15.6%       7140 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     14063 ~ 1%     -10.1%      12638 ~ 8%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      8045 ~ 0%     -14.2%       6906 ~ 4%  lkp-snb01/hackbench/50%-threads=
-pipe
     39367 ~ 3%     -13.4%      34080 ~ 6%  TOTAL slabinfo.proc_inode_cache=
.active_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.05 ~ 0%      -8.6%       0.96 ~ 3%  lkp-snb01/hackbench/1600%-proce=
ss-socket
      0.86 ~ 7%     +14.7%       0.99 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1.01 ~ 2%     +19.5%       1.21 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      0.99 ~ 3%     +16.7%       1.16 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      3.91 ~ 3%     +10.2%       4.31 ~ 1%  TOTAL perf-profile.cpu-cycles.s=
ock_wfree.unix_destruct_scm.skb_release_head_state.skb_release_all.consume_=
skb

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     23118 ~ 7%     -18.7%      18805 ~15%  lkp-nex04/ebizzy/200%-100x-10s
     23118 ~ 7%     -18.7%      18805 ~15%  TOTAL numa-meminfo.node2.AnonPa=
ges

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1660 ~ 5%     +14.0%       1892 ~ 4%  lkp-sb03/nepim/300s-25%-udp6
      1685 ~ 1%     +12.2%       1891 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1709 ~ 2%     +14.7%       1961 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1633 ~ 3%     +12.9%       1843 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      1677 ~ 4%     +15.4%       1934 ~ 5%  lkp-snb01/hackbench/50%-process=
-socket
      8365 ~ 3%     +13.8%       9522 ~ 4%  TOTAL slabinfo.kmalloc-2048.act=
ive_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     69466 ~ 0%     -13.2%      60304 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     63299 ~ 6%      +9.9%      69579 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    132765 ~ 3%      -2.2%     129884 ~ 0%  TOTAL numa-vmstat.node1.nr_file=
_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    278167 ~ 0%     -13.3%     241220 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    253215 ~ 6%      +9.9%     278330 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    531382 ~ 3%      -2.2%     519550 ~ 0%  TOTAL numa-meminfo.node1.FilePa=
ges

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      5773 ~ 7%     -18.5%       4704 ~15%  lkp-nex04/ebizzy/200%-100x-10s
      5773 ~ 7%     -18.5%       4704 ~15%  TOTAL numa-vmstat.node2.nr_anon=
_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3628 ~ 0%     +15.1%       4176 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      1984 ~ 3%     +13.7%       2256 ~ 1%  lkp-sb03/nepim/300s-100%-tcp6
      2000 ~ 4%     +10.4%       2208 ~ 3%  lkp-sb03/nuttcp/300s
      1917 ~ 0%     +11.0%       2128 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1888 ~ 1%     +17.8%       2224 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1891 ~ 5%     +10.2%       2083 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
     13309 ~ 2%     +13.3%      15075 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3628 ~ 0%     +15.1%       4176 ~ 1%  lkp-nex04/ebizzy/200%-100x-10s
      1984 ~ 3%     +13.7%       2256 ~ 1%  lkp-sb03/nepim/300s-100%-tcp6
      2000 ~ 4%     +10.4%       2208 ~ 3%  lkp-sb03/nuttcp/300s
      1917 ~ 0%     +11.0%       2128 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1888 ~ 1%     +17.8%       2224 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1891 ~ 5%     +10.2%       2083 ~ 4%  lkp-snb01/hackbench/50%-threads=
-socket
     13309 ~ 2%     +13.3%      15075 ~ 2%  TOTAL slabinfo.shmem_inode_cach=
e.active_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1.31 ~ 3%     +17.8%       1.54 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
      1.31 ~ 3%     +17.8%       1.54 ~ 0%  TOTAL perf-profile.cpu-cycles.n=
ew_sync_read.vfs_read.sys_read.system_call_fastpath

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    556740 ~ 2%     -12.2%     488680 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    556740 ~ 2%     -12.2%     488680 ~ 2%  TOTAL meminfo.PageTables

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    673425 ~ 2%     -11.4%     596661 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    673425 ~ 2%     -11.4%     596661 ~ 1%  TOTAL meminfo.AnonPages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    673241 ~ 2%     -11.3%     596958 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    673241 ~ 2%     -11.3%     596958 ~ 1%  TOTAL meminfo.Active(anon)

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    243927 ~ 0%     +13.3%     276462 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    268549 ~ 6%      -9.2%     243781 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    512476 ~ 3%      +1.5%     520244 ~ 0%  TOTAL numa-meminfo.node0.FilePa=
ges

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     60981 ~ 0%     +13.3%      69071 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
     67133 ~ 6%      -9.2%      60945 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    128114 ~ 3%      +1.5%     130016 ~ 0%  TOTAL numa-vmstat.node0.nr_file=
_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    167906 ~ 2%     -10.7%     149933 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    167906 ~ 2%     -10.7%     149933 ~ 0%  TOTAL proc-vmstat.nr_anon_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    167868 ~ 2%     -10.7%     149989 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    167868 ~ 2%     -10.7%     149989 ~ 0%  TOTAL proc-vmstat.nr_active_anon

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     18393 ~ 2%     -10.2%      16523 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     18393 ~ 2%     -10.2%      16523 ~ 0%  TOTAL slabinfo.mm_struct.num_ob=
js

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1081 ~ 2%     -10.2%        971 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1081 ~ 2%     -10.2%        971 ~ 0%  TOTAL slabinfo.mm_struct.active=
_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1081 ~ 2%     -10.2%        971 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1081 ~ 2%     -10.2%        971 ~ 0%  TOTAL slabinfo.mm_struct.num_sl=
abs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1135 ~ 3%     -10.6%       1015 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
      1135 ~ 3%     -10.6%       1015 ~ 2%  TOTAL slabinfo.dentry.num_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1135 ~ 3%     -10.6%       1015 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
      1135 ~ 3%     -10.6%       1015 ~ 2%  TOTAL slabinfo.dentry.active_sl=
abs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     47732 ~ 3%     -10.6%      42671 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
     47732 ~ 3%     -10.6%      42671 ~ 2%  TOTAL slabinfo.dentry.num_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    138869 ~ 2%     -11.5%     122931 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    138869 ~ 2%     -11.5%     122931 ~ 0%  TOTAL proc-vmstat.nr_page_table=
_pages

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      9035 ~ 4%      -8.1%       8303 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      8695 ~ 5%      +9.4%       9515 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      9804 ~ 0%     -12.6%       8565 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     27534 ~ 3%      -4.2%      26384 ~ 0%  TOTAL proc-vmstat.pgactivate

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     18024 ~ 2%     +12.3%      20238 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     18024 ~ 2%     +12.3%      20238 ~ 1%  TOTAL slabinfo.kmalloc-16.activ=
e_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     18024 ~ 2%     +12.3%      20238 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     18024 ~ 2%     +12.3%      20238 ~ 1%  TOTAL slabinfo.kmalloc-16.num_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1420 ~ 1%     -10.5%       1271 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1420 ~ 1%     -10.5%       1271 ~ 0%  TOTAL slabinfo.sighand_cache.nu=
m_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1420 ~ 1%     -10.5%       1271 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      1420 ~ 1%     -10.5%       1271 ~ 0%  TOTAL slabinfo.sighand_cache.ac=
tive_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     21313 ~ 1%     -10.5%      19076 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     21313 ~ 1%     -10.5%      19076 ~ 0%  TOTAL slabinfo.sighand_cache.nu=
m_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    159766 ~ 0%     +11.5%     178214 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
    130677 ~ 0%     +13.3%     148052 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    290443 ~ 0%     +12.3%     326267 ~ 0%  TOTAL meminfo.Slab

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    784453 ~ 2%     -10.8%     700063 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    784453 ~ 2%     -10.8%     700063 ~ 1%  TOTAL meminfo.Active

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     59275 ~ 4%     +11.9%      66301 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
    512544 ~ 2%      -9.6%     463395 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    571819 ~ 2%      -7.4%     529696 ~ 1%  TOTAL slabinfo.kmalloc-64.activ=
e_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       931 ~ 4%     +12.3%       1046 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      8408 ~ 2%      -9.3%       7627 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9339 ~ 2%      -7.1%       8673 ~ 1%  TOTAL slabinfo.kmalloc-64.activ=
e_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       931 ~ 4%     +12.3%       1046 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
      8408 ~ 2%      -9.3%       7627 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      9339 ~ 2%      -7.1%       8673 ~ 1%  TOTAL slabinfo.kmalloc-64.num_s=
labs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     47732 ~ 3%     -10.7%      42612 ~ 2%  lkp-sb03/nepim/300s-100%-tcp6
     47032 ~ 0%      -9.3%      42671 ~ 0%  lkp-sb03/nepim/300s-25%-tcp6
     94764 ~ 2%     -10.0%      85283 ~ 1%  TOTAL slabinfo.dentry.active_ob=
js

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2954 ~ 3%      +8.5%       3206 ~ 4%  lkp-sb03/nepim/300s-100%-tcp
      2940 ~ 0%     +11.9%       3290 ~ 1%  lkp-sb03/nepim/300s-100%-udp
      2884 ~ 2%     +12.1%       3234 ~ 2%  lkp-sb03/nepim/300s-100%-udp6
      2898 ~ 1%     +10.1%       3192 ~ 1%  lkp-sb03/nepim/300s-25%-tcp6
      2954 ~ 1%     +10.4%       3262 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      1243 ~ 3%      -8.1%       1142 ~ 2%  xps2/pigz/100%-512K
     15873 ~ 1%      +9.2%      17326 ~ 2%  TOTAL slabinfo.kmalloc-96.num_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2912 ~ 3%      +8.7%       3164 ~ 4%  lkp-sb03/nepim/300s-100%-tcp
      2900 ~ 0%     +12.1%       3251 ~ 1%  lkp-sb03/nepim/300s-100%-udp
      2843 ~ 2%     +12.3%       3192 ~ 2%  lkp-sb03/nepim/300s-100%-udp6
      2857 ~ 1%     +10.2%       3150 ~ 1%  lkp-sb03/nepim/300s-25%-tcp6
      2926 ~ 1%      +9.2%       3195 ~ 2%  lkp-sb03/thrulay/300s
      2912 ~ 1%     +10.6%       3220 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
      1243 ~ 3%      -8.1%       1142 ~ 2%  xps2/pigz/100%-512K
     18594 ~ 1%      +9.3%      20317 ~ 2%  TOTAL slabinfo.kmalloc-96.activ=
e_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1501 ~ 3%      -9.3%       1361 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1501 ~ 3%      -9.3%       1361 ~ 1%  TOTAL slabinfo.Acpi-State.num_s=
labs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1501 ~ 3%      -9.3%       1361 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      1501 ~ 3%      -9.3%       1361 ~ 1%  TOTAL slabinfo.Acpi-State.activ=
e_slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     76578 ~ 3%      -9.3%      69446 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     76578 ~ 3%      -9.3%      69446 ~ 1%  TOTAL slabinfo.Acpi-State.num_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      3.05 ~ 4%     +10.7%       3.38 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      2.49 ~ 3%     -10.7%       2.22 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      5.54 ~ 4%      +1.1%       5.60 ~ 2%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_write

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2670 ~ 1%     +10.3%       2945 ~ 2%  lkp-nex04/ebizzy/200%-100x-10s
      2670 ~ 1%     +10.3%       2945 ~ 2%  TOTAL slabinfo.signal_cache.num=
_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     76434 ~ 3%      -9.3%      69312 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     76434 ~ 3%      -9.3%      69312 ~ 1%  TOTAL slabinfo.Acpi-State.activ=
e_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     59659 ~ 4%     +12.2%      66966 ~ 6%  lkp-nex04/ebizzy/200%-100x-10s
     41275 ~ 8%     +15.9%      47851 ~ 1%  lkp-sb03/nepim/300s-100%-tcp6
    538141 ~ 2%      -9.3%     488191 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    639076 ~ 3%      -5.6%     603009 ~ 1%  TOTAL slabinfo.kmalloc-64.num_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     49737 ~ 4%      -8.9%      45300 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     23456 ~ 3%     +11.8%      26221 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     73193 ~ 3%      -2.3%      71521 ~ 2%  TOTAL slabinfo.kmalloc-32.activ=
e_objs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1489 ~ 3%     +10.3%       1643 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      1489 ~ 3%     +10.3%       1643 ~ 1%  TOTAL numa-vmstat.node1.nr_allo=
c_batch

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     49900 ~ 4%      -8.3%      45768 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     23515 ~ 2%     +11.5%      26221 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
     73415 ~ 3%      -1.9%      71989 ~ 2%  TOTAL slabinfo.kmalloc-32.num_o=
bjs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      2961 ~ 0%     +11.2%       3293 ~ 1%  lkp-snb01/hackbench/50%-process=
-socket
      2945 ~ 1%     +11.8%       3292 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
      5906 ~ 1%     +11.5%       6585 ~ 0%  TOTAL proc-vmstat.nr_alloc_batch

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      5125 ~ 2%      -8.7%       4678 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      5125 ~ 2%      -8.7%       4678 ~ 0%  TOTAL slabinfo.anon_vma.active_=
slabs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      5125 ~ 2%      -8.7%       4678 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      5125 ~ 2%      -8.7%       4678 ~ 0%  TOTAL slabinfo.anon_vma.num_sla=
bs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      1446 ~ 3%      -7.7%       1335 ~ 2%  lkp-sb03/nuttcp/300s
      1467 ~ 1%     +11.7%       1638 ~ 2%  lkp-snb01/hackbench/50%-process=
-socket
      1471 ~ 1%     +10.3%       1622 ~ 5%  lkp-snb01/hackbench/50%-threads=
-socket
      4385 ~ 2%      +4.8%       4596 ~ 3%  TOTAL numa-vmstat.node0.nr_allo=
c_batch

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

   4966084 ~ 0%      -5.6%    4686464 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
 1.121e+09 ~ 1%     -53.0%  5.266e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  53815621 ~18%     -47.1%   28479628 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-socket
 1.145e+09 ~ 2%     -23.1%  8.803e+08 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
  28394616 ~13%     +26.1%   35804827 ~ 7%  lkp-snb01/hackbench/1600%-threa=
ds-socket
 4.835e+08 ~ 0%     +44.8%  6.999e+08 ~ 3%  lkp-snb01/hackbench/50%-process=
-pipe
 3.433e+08 ~ 3%     -85.0%   51340279 ~ 3%  lkp-snb01/hackbench/50%-process=
-socket
 5.202e+08 ~ 1%     +84.3%  9.588e+08 ~ 1%  lkp-snb01/hackbench/50%-threads=
-pipe
 3.635e+08 ~ 0%     -81.4%   67599987 ~ 3%  lkp-snb01/hackbench/50%-threads=
-socket
    645756 ~ 2%    +130.8%    1490689 ~ 0%  xps2/pigz/100%-128K
    221363 ~ 3%     +78.2%     394432 ~ 0%  xps2/pigz/100%-512K
 4.065e+09 ~ 1%     -19.9%  3.255e+09 ~ 3%  TOTAL time.involuntary_context_=
switches

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    809533 ~ 0%      -1.2%     799770 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
      2406 ~ 0%      +3.3%       2485 ~ 0%  lkp-sb03/nepim/300s-100%-tcp6
    830317 ~ 9%     -81.2%     155833 ~ 6%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     53890 ~ 8%     -28.6%      38488 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
    855345 ~ 5%     -35.9%     548702 ~ 9%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1455387 ~ 0%     +15.7%    1684589 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    758904 ~ 1%     -87.6%      93836 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
   1526394 ~ 0%     +11.9%    1707988 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
    878846 ~ 0%     -87.0%     114082 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
      9875 ~ 0%      -9.9%       8895 ~ 0%  xps2/pigz/100%-128K
      8926 ~ 0%      -4.8%       8498 ~ 0%  xps2/pigz/100%-512K
   7189826 ~ 2%     -28.2%    5163169 ~ 1%  TOTAL vmstat.system.in

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

    168582 ~ 1%     -32.1%     114531 ~ 3%  lkp-nex04/ebizzy/200%-100x-10s
   1423389 ~ 6%     -14.8%    1213039 ~ 2%  lkp-sb03/nepim/300s-100%-tcp
   4343729 ~ 5%      +5.4%    4579296 ~ 2%  lkp-sb03/nepim/300s-25%-tcp6
 2.249e+09 ~ 1%     -53.6%  1.042e+09 ~ 2%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
 2.579e+08 ~ 5%     -24.4%   1.95e+08 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
 2.263e+09 ~ 2%     -28.0%  1.629e+09 ~ 4%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
 2.288e+08 ~ 3%      -7.4%  2.118e+08 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
 1.952e+09 ~ 0%      +7.2%  2.093e+09 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
 1.389e+09 ~ 3%     -70.9%  4.045e+08 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
 1.974e+09 ~ 0%     +22.2%  2.412e+09 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
 1.375e+09 ~ 0%     -68.4%  4.341e+08 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
    965425 ~ 0%     +70.8%    1648765 ~ 0%  xps2/pigz/100%-128K
    257508 ~ 0%     +68.2%     433104 ~ 0%  xps2/pigz/100%-512K
  1.17e+10 ~ 1%     -27.9%   8.43e+09 ~ 2%  TOTAL time.voluntary_context_sw=
itches

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      6191 ~ 0%      -4.5%       5915 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
     10058 ~ 6%     -13.6%       8694 ~ 2%  lkp-sb03/nepim/300s-100%-tcp
      9592 ~ 5%     +13.6%      10894 ~ 6%  lkp-sb03/nepim/300s-100%-tcp6
     29353 ~ 4%      +5.3%      30918 ~ 2%  lkp-sb03/nepim/300s-25%-tcp6
   5570895 ~ 1%     -53.5%    2589738 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    518232 ~ 9%     -29.2%     367167 ~ 1%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   5591371 ~ 2%     -26.3%    4118330 ~ 3%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   4044411 ~ 0%     +14.1%    4613997 ~ 2%  lkp-snb01/hackbench/50%-process=
-pipe
   2973219 ~ 0%     -69.2%     915067 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
   4169225 ~ 1%     +28.7%    5366899 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
   3053787 ~ 0%     -67.9%     979802 ~ 1%  lkp-snb01/hackbench/50%-threads=
-socket
      5726 ~ 0%     +89.0%      10822 ~ 0%  xps2/pigz/100%-128K
      1984 ~ 1%     +61.3%       3199 ~ 0%  xps2/pigz/100%-512K
  25984047 ~ 1%     -26.8%   19021447 ~ 1%  TOTAL vmstat.system.cs

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

   4104.92 ~ 0%      -1.4%    4045.93 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
      6.23 ~ 0%    +106.7%      12.88 ~36%  lkp-sb03/nepim/300s-100%-tcp6
   1496.85 ~ 0%      -6.5%    1398.94 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
   1251.12 ~ 1%     +15.8%    1448.69 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
    935.98 ~ 0%     +10.5%    1033.87 ~ 1%  lkp-snb01/hackbench/50%-process=
-pipe
    691.25 ~ 0%      +5.8%     731.53 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
    613.86 ~ 0%     +57.8%     968.47 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
   9100.21 ~ 0%      +5.9%    9640.32 ~ 0%  TOTAL time.user_time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

 1.227e+09 ~ 0%      -1.1%  1.213e+09 ~ 0%  lkp-nex04/ebizzy/200%-100x-10s
  17865184 ~ 2%     +59.5%   28487861 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
  17338504 ~ 2%      +6.7%   18496122 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-socket
   1234198 ~ 1%     +20.1%    1481802 ~ 2%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
   1044797 ~ 0%      +4.3%    1090169 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    617093 ~ 0%      -2.4%     602008 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
    577133 ~ 3%     +32.4%     764148 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
    124062 ~ 1%     +10.2%     136719 ~ 2%  lkp-snb01/hackbench/50%-threads=
-socket
 1.266e+09 ~ 0%      -0.1%  1.264e+09 ~ 0%  TOTAL time.minor_page_faults

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       293 ~ 0%     -12.4%        257 ~10%  lkp-sb03/nepim/300s-100%-tcp6
     16866 ~ 0%      -2.5%      16437 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     18078 ~ 0%      -2.5%      17632 ~ 1%  lkp-snb01/hackbench/1600%-threa=
ds-pipe
     18474 ~ 0%      -1.2%      18247 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
     18197 ~ 2%      -7.5%      16835 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     18522 ~ 0%      +4.0%      19256 ~ 2%  lkp-snb01/hackbench/50%-threads=
-pipe
     17841 ~ 0%      -5.4%      16870 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    108274 ~ 1%      -2.5%     105535 ~ 0%  TOTAL time.system_time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     49.06 ~ 2%      -5.8%      46.20 ~ 3%  lkp-sb03/nepim/300s-100%-tcp
     55.43 ~ 0%      +1.0%      56.00 ~ 0%  lkp-sb03/nepim/300s-100%-udp
     55.13 ~ 0%      +2.5%      56.51 ~ 1%  lkp-sb03/nepim/300s-100%-udp6
     47.05 ~ 1%      +5.5%      49.63 ~ 1%  lkp-sb03/nepim/300s-25%-tcp
     54.79 ~ 0%      +2.4%      56.10 ~ 0%  lkp-sb03/nepim/300s-25%-udp
     45.29 ~ 3%      +7.9%      48.87 ~ 0%  lkp-sb03/nuttcp/300s
     52.35 ~ 2%      +8.4%      56.73 ~ 1%  lkp-sb03/thrulay/300s
    164.37 ~ 0%      +1.3%     166.51 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    169.52 ~ 0%      +1.2%     171.56 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    165.66 ~ 0%      +3.9%     172.19 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
    161.41 ~ 0%      +1.7%     164.15 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
    164.47 ~ 0%      +4.7%     172.27 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
   1184.53 ~ 0%      +2.7%    1216.70 ~ 0%  TOTAL turbostat.Cor_W

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

     83.00 ~ 0%      +1.7%      84.37 ~ 0%  lkp-sb03/nepim/300s-100%-udp6
     75.08 ~ 1%      +3.5%      77.68 ~ 1%  lkp-sb03/nepim/300s-25%-tcp
     82.70 ~ 0%      +1.6%      84.04 ~ 0%  lkp-sb03/nepim/300s-25%-udp
     72.79 ~ 2%      +5.0%      76.40 ~ 0%  lkp-sb03/nuttcp/300s
     79.86 ~ 1%      +5.5%      84.26 ~ 0%  lkp-sb03/thrulay/300s
    191.91 ~ 0%      +1.1%     193.96 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
    200.01 ~ 0%      +1.2%     202.33 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
    193.16 ~ 0%      +3.2%     199.24 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
    189.63 ~ 0%      +1.5%     192.46 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
    192.28 ~ 0%      +3.6%     199.30 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
   1360.44 ~ 0%      +2.5%    1394.06 ~ 0%  TOTAL turbostat.Pkg_W

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

      5.99 ~ 0%      +1.8%       6.10 ~ 0%  lkp-sb03/nepim/300s-25%-tcp
      6.45 ~ 1%      +5.2%       6.78 ~ 1%  lkp-sb03/nepim/300s-25%-udp
     94.35 ~ 0%      -3.0%      91.52 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
     96.96 ~ 0%      +1.1%      98.01 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
     96.88 ~ 0%      +2.3%      99.08 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
     95.50 ~ 0%      -3.8%      91.88 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
     97.19 ~ 0%      +2.2%      99.29 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
     95.79 ~ 0%      -3.8%      92.10 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
    589.10 ~ 0%      -0.7%     584.77 ~ 0%  TOTAL turbostat.%c0

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

       613 ~ 0%      -1.7%        603 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
       634 ~ 0%      -3.9%        609 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      1248 ~ 0%      -2.8%       1213 ~ 0%  TOTAL time.elapsed_time

eb0beb902dc3bed  cfe48d5b416f8a3f5c45164cf  =

---------------  -------------------------  =

        88 ~ 0%      -1.5%         87 ~ 0%  lkp-sb03/nepim/300s-100%-tcp
      3008 ~ 0%      -2.7%       2925 ~ 0%  lkp-snb01/hackbench/1600%-proce=
ss-pipe
      3097 ~ 0%      +1.2%       3133 ~ 0%  lkp-snb01/hackbench/1600%-threa=
ds-socket
      3058 ~ 0%      +3.4%       3161 ~ 0%  lkp-snb01/hackbench/50%-process=
-pipe
      3019 ~ 0%      -3.4%       2917 ~ 0%  lkp-snb01/hackbench/50%-process=
-socket
      3071 ~ 0%      +3.2%       3170 ~ 0%  lkp-snb01/hackbench/50%-threads=
-pipe
      3028 ~ 0%      -3.4%       2924 ~ 0%  lkp-snb01/hackbench/50%-threads=
-socket
     18371 ~ 0%      -0.3%      18318 ~ 0%  TOTAL time.percent_of_cpu_this_=
job_got


Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                                  time.user_time

  1000 ++------------------------------------------------------------------=
-+
       O      O      O      O      O                                       =
 |
   950 ++                                                                  =
 |
   900 ++                                                                  =
 |
       |                                                                   =
 |
   850 ++                                                                  =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   750 ++                                                                  =
 |
   700 ++                                                                  =
 |
       |                                                                   =
 |
   650 ++                                                                  =
 |
   600 *+.....*......*......*......*......*.....*......*......*......*.....=
.*
       |                                                                   =
 |
   550 ++------------------------------------------------------------------=
-+


                                  time.system_time

  18400 ++-----------------------------------------------------------------=
-+
        |             *..                                                  =
 |
  18200 ++          ..   ..                                                =
 |
  18000 ++        ..       .    ...*......*.....                           =
.*
        *...... ..          *...                .    ...*....          ....=
 |
  17800 ++     *                                 *...        .    ...*.    =
 |
  17600 ++                                                    *...         =
 |
        |                                                                  =
 |
  17400 ++                                                                 =
 |
  17200 ++                                                                 =
 |
        |                                                                  =
 |
  17000 ++     O                                                           =
 |
  16800 O+            O     O      O                                       =
 |
        |                                                                  =
 |
  16600 ++-----------------------------------------------------------------=
-+


                         time.percent_of_cpu_this_job_got

  3040 ++------------------------------------------------------------------=
-+
       *......*.....       .*......*......*.....*......*......*......*.....=
.|
  3020 ++           .  ....                                                =
 *
       |             *.                                                    =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2980 ++                                                                  =
 |
       |                                                                   =
 |
  2960 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
  2940 ++                                                                  =
 |
       O      O      O      O                                              =
 |
  2920 ++--------------------------O---------------------------------------=
-+


                            time.voluntary_context_switches

  1.4e+09 *+-----*-----*------------*------*------*-----*------*-----*-----=
-*
  1.3e+09 ++                  *..                                          =
 |
          |                                                                =
 |
  1.2e+09 ++                                                               =
 |
  1.1e+09 ++                                                               =
 |
          |                                                                =
 |
    1e+09 ++                                                               =
 |
    9e+08 ++                                                               =
 |
    8e+08 ++                                                               =
 |
          |                                                                =
 |
    7e+08 ++                                                               =
 |
    6e+08 ++                                                               =
 |
          |                                                                =
 |
    5e+08 O+     O                                                         =
 |
    4e+08 ++-----------O------O-----O--------------------------------------=
-+


                           time.involuntary_context_switches

    4e+08 ++---------------------------------------------------------------=
-+
          |                                    ...*.....*......*.....*.....=
.*
  3.5e+08 *+.....*.....*......*.....*......*...                            =
 |
          |                                                                =
 |
    3e+08 ++                                                               =
 |
          |                                                                =
 |
  2.5e+08 ++                                                               =
 |
          |                                                                =
 |
    2e+08 ++                                                               =
 |
          |                                                                =
 |
  1.5e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          O      O     O      O     O                                      =
 |
    5e+07 ++---------------------------------------------------------------=
-+


                                hackbench.throughput

  150000 O+-----------O------O------O--------------------------------------=
-+
         |      O                                                          =
 |
  140000 ++                                                                =
 |
  130000 ++                                                                =
 |
         |                                                                 =
 |
  120000 ++                                                                =
 |
         |                                                                 =
 |
  110000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
   90000 ++                                                                =
 |
         |                                                                 =
 |
   80000 *+.....*.....    ...*......*......*.....*......*......*.....*.....=
.*
         |            *...                                                 =
 |
   70000 ++----------------------------------------------------------------=
-+


                                   turbostat.%c0

    96 ++------------------------------------------------------------------=
-+
       *......*......*......*......*......*.....*......*......*......*.....=
.*
  95.5 ++                                                                  =
 |
    95 ++                                                                  =
 |
       |                                                                   =
 |
  94.5 ++                                                                  =
 |
       |                                                                   =
 |
    94 ++                                                                  =
 |
       |                                                                   =
 |
  93.5 ++                                                                  =
 |
    93 ++                                                                  =
 |
       |                                                                   =
 |
  92.5 ++                                                                  =
 |
       |                                                                   =
 |
    92 O+-----O------O------O------O---------------------------------------=
-+


                                  turbostat.Pkg_W

  X+9 ++-------------------------------------------------------------------=
-+
      O             O      O      O                                        =
 |
  X+8 ++     O                                                             =
 |
  X+7 ++                                                                   =
 |
      |                                                                    =
 |
  X+6 ++                                                                   =
 |
  X+5 ++                                                                   =
 |
      |                                                                    =
 |
  X+4 ++                                                                   =
 |
  X+3 ++                                                                   =
 |
      |                                                                    =
 |
  X+2 ++  ...*.....                                                        =
 |
  X+1 *+..         .    ...*......*......*......*......*......*......*.....=
.*
      |             *...                                                   =
 |
  X   ++-------------------------------------------------------------------=
-+


                                  turbostat.Cor_W

  X+10++-------------------------------------------------------------------=
-+
  X+9 O+            O      O      O                                        =
 |
      |      O                                                             =
 |
  X+8 ++                                                                   =
 |
  X+7 ++                                                                   =
 |
      |                                                                    =
 |
  X+6 ++                                                                   =
 |
  X+5 ++                                                                   =
 |
  X+4 ++                                                                   =
 |
      |                                                                    =
 |
  X+3 ++                                                                   =
 |
  X+2 *+.....*.....                                        ...*......      =
 |
      |            .    ...*......*......*......*......*...          *.....=
.*
  X+1 ++            *...                                                   =
 |
  X   ++-------------------------------------------------------------------=
-+


                                  vmstat.system.in

  900000 ++-----------*-------------*------*-----*------*------------*-----=
-*
         *......*..          *...                              *..         =
 |
  800000 ++                                                                =
 |
         |                                                                 =
 |
  700000 ++                                                                =
 |
  600000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  100000 O+-----O-----O------O------O--------------------------------------=
-+


                                   vmstat.system.cs

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 *+.....*.....*......*.....*......*......*.....*......*.....*.....=
.*
          |                                                                =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    1e+06 O+     O     O      O     O                                      =
 |
          |                                                                =
 |
   500000 ++---------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Aaron

--===============6903489702843123064==
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
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAt
bCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3Iv
YmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJl
YWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAK
L3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNr
YmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAt
LXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2
MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmlu
L2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRz
IC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVu
Y2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRo
cmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tdGhyZWFkcyAtbCA2MDAw
MAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hh
Y2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2
IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMTYgLS10aHJlYWRzIC1s
IDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAxNiAtLXRocmVhZHMgLWwgNjAwMDAKCg==

--===============6903489702843123064==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="AttachedMessagePart.ksh"

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTEtQIG1haWxp
bmcgbGlzdApMS1BAbGludXguaW50ZWwuY29tCgo=

--===============6903489702843123064==--

