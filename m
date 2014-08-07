Content-Type: multipart/mixed; boundary="===============0824677917197185078=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched/numa] 096aa33863a: -21.4% hackbench.throughput, -20.2% netperf.Throughput_Mbps
Date: Thu, 07 Aug 2014 18:53:11 +0800
Message-ID: <20140807105311.GA17655@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0824677917197185078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rik,

We noticed the below performance regression in commit
096aa33863a5e48de52d2ff30e0801b7487944f4 ("sched/numa: Decay
->wakee_flips instead of zeroing")

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    122361 =C2=B1 0%     -21.4%      96140 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
    122361 =C2=B1 0%     -21.4%      96140 =C2=B1 0%  TOTAL hackbench.throu=
ghput

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1312 =C2=B1 0%     -20.2%       1046 =C2=B1 6%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      1312 =C2=B1 0%     -20.2%       1046 =C2=B1 6%  TOTAL netperf.Through=
put_Mbps

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      7908 =C2=B122%  +23831.0%    1892653 =C2=B125%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      7908 =C2=B122%  +23831.0%    1892653 =C2=B125%  TOTAL cpuidle.C1-NHM.=
usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.35 =C2=B133%     -96.0%       0.09 =C2=B110%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      2.35 =C2=B133%     -96.0%       0.09 =C2=B110%  TOTAL perf-profile.cp=
u-cycles.memcpy.sctp_packet_transmit_chunk.sctp_outq_flush.sctp_outq_uncork=
.sctp_cmd_interpreter

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1250 =C2=B1 1%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      1250 =C2=B1 1%    -100.0%          0 =C2=B1 0%  TOTAL slabinfo.xfs_bu=
f.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1957 =C2=B119%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      1957 =C2=B119%    -100.0%          0 =C2=B1 0%  TOTAL slabinfo.xfs_tr=
ans.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    288862 =C2=B133%  +34804.6%  1.008e+08 =C2=B127%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    288862 =C2=B133%  +34804.6%  1.008e+08 =C2=B127%  TOTAL cpuidle.C1-NHM.=
time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.10 =C2=B114%   +1423.1%       1.58 =C2=B147%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      0.10 =C2=B114%   +1423.1%       1.58 =C2=B147%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_bh.lock_sock_nested.sctp_recvmsg.sock_common_recvms=
g.sock_recvmsg

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    341158 =C2=B130%  +30156.8%  1.032e+08 =C2=B127%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    341158 =C2=B130%  +30156.8%  1.032e+08 =C2=B127%  TOTAL cpuidle.C1E-NHM=
.time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      7320 =C2=B133%  +32271.8%    2369681 =C2=B126%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      7320 =C2=B133%  +32271.8%    2369681 =C2=B126%  TOTAL cpuidle.C1E-NHM=
.usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    506973 =C2=B131%   +3871.2%   20133029 =C2=B125%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    506973 =C2=B131%   +3871.2%   20133029 =C2=B125%  TOTAL cpuidle.C3-NHM.=
time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       292 =C2=B111%   +7707.3%      22813 =C2=B127%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
       292 =C2=B111%   +7707.3%      22813 =C2=B127%  TOTAL cpuidle.C3-NHM.=
usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   7525714 =C2=B117%    +544.6%   48513328 =C2=B120%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   7525714 =C2=B117%    +544.6%   48513328 =C2=B120%  TOTAL cpuidle.C6-NHM.=
time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1952 =C2=B119%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      1952 =C2=B119%    -100.0%          0 =C2=B1 0%  TOTAL slabinfo.xfs_tr=
ans.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1141 =C2=B1 0%    -100.0%          0 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      1141 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL slabinfo.xfs_bu=
f.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.05 =C2=B133%   +1596.2%       0.88 =C2=B124%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      0.05 =C2=B133%   +1596.2%       0.88 =C2=B124%  TOTAL turbostat.%c3

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       716 =C2=B110%   +2369.6%      17702 =C2=B123%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
       716 =C2=B110%   +2369.6%      17702 =C2=B123%  TOTAL cpuidle.C6-NHM.=
usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.32 =C2=B112%    +291.8%       1.24 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-process-pipe
      0.32 =C2=B112%    +291.8%       1.24 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.osq_lock.__mutex_lock_slowpath.mutex_lock.pipe_write.do_sync_write

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.35 =C2=B1 8%    +250.9%       1.21 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-process-pipe
      0.35 =C2=B1 8%    +250.9%       1.21 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.mutex_spin_on_owner.__mutex_lock_slowpath.mutex_lock.pipe_write.do=
_sync_write

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1108302 =C2=B1 1%     +70.8%    1893466 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
     13338 =C2=B1 1%    +523.8%      83205 =C2=B122%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   1121641 =C2=B1 1%     +76.2%    1976671 =C2=B1 1%  TOTAL softirqs.SCHED

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2.43 =C2=B1 2%     +32.7%       3.23 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
      0.08 =C2=B127%  +25202.6%      19.74 =C2=B127%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      2.51 =C2=B1 2%    +814.9%      22.96 =C2=B123%  TOTAL turbostat.%c1

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1615.95 =C2=B1 4%     +19.9%    1938.14 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
     75.27 =C2=B1 1%    +413.0%     386.09 =C2=B121%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   1691.22 =C2=B1 4%     +37.4%    2324.23 =C2=B1 4%  TOTAL uptime.idle

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.58 =C2=B119%    +162.6%       1.52 =C2=B113%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      0.58 =C2=B119%    +162.6%       1.52 =C2=B113%  TOTAL turbostat.%c6

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    704584 =C2=B1 4%    +177.7%    1956399 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
    704584 =C2=B1 4%    +177.7%    1956399 =C2=B1 1%  TOTAL cpuidle.C1E-SNB=
.usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.51 =C2=B1 7%    +168.4%       1.37 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-process-pipe
      0.51 =C2=B1 7%    +168.4%       1.37 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.__mutex_lock_slowpath.mutex_lock.pipe_write.do_sync_write.vfs_write

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.65 =C2=B1 2%    +140.9%       3.97 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.65 =C2=B1 2%    +140.9%       3.97 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.mutex_unlock.do_sync_write.vfs_write.sys_write.system_call_fastpath

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  30881148 =C2=B1 1%    +122.3%   68651628 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
  30881148 =C2=B1 1%    +122.3%   68651628 =C2=B1 2%  TOTAL cpuidle.C1E-SNB=
.time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    130315 =C2=B1 1%     -51.5%      63146 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
    130315 =C2=B1 1%     -51.5%      63146 =C2=B1 1%  TOTAL cpuidle.C7-SNB.=
usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      4.04 =C2=B1 0%     -50.5%       2.00 =C2=B1 8%  lkp-snb01/hackbench/5=
0%-process-pipe
      4.04 =C2=B1 0%     -50.5%       2.00 =C2=B1 8%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wak=
e_function.__wake_up_common

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9880 =C2=B1 5%     -47.0%       5238 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-process-pipe
      9880 =C2=B1 5%     -47.0%       5238 =C2=B1 5%  TOTAL cpuidle.C3-SNB.=
usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.40 =C2=B1 1%     -45.4%       0.76 =C2=B1 9%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.40 =C2=B1 1%     -45.4%       0.76 =C2=B1 9%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irq.__schedule.schedule.pipe_wait.pipe_read

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.55 =C2=B1 2%     -46.3%       0.83 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.55 =C2=B1 2%     -46.3%       0.83 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremov=
e_wake_function.__wake_up_common

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.27 =C2=B1 0%     +88.8%       2.40 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.27 =C2=B1 0%     +88.8%       2.40 =C2=B1 4%  TOTAL perf-profile.cp=
u-cycles.mutex_lock.pipe_write.do_sync_write.vfs_write.sys_write

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
       366 =C2=B1 0%     -19.5%        295 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
        11 =C2=B1 0%     -58.2%          4 =C2=B132%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
       377 =C2=B1 0%     -20.6%        300 =C2=B1 1%  TOTAL vmstat.procs.r

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5.26 =C2=B1 4%     +70.0%       8.95 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      5.26 =C2=B1 4%     +70.0%       8.95 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles._raw_spin_lock_irqsave.__wake_up_sync_key.pipe_write.do_sync_write=
.vfs_write

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.99 =C2=B1 5%     -37.2%       1.25 =C2=B1 6%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.99 =C2=B1 5%     -37.2%       1.25 =C2=B1 6%  TOTAL perf-profile.cp=
u-cycles.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.=
security_file_permission

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  41644859 =C2=B1 1%     -36.6%   26412030 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  41644859 =C2=B1 1%     -36.6%   26412030 =C2=B1 0%  TOTAL numa-numastat.n=
ode0.local_node

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  41645708 =C2=B1 1%     -36.6%   26414565 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  41645708 =C2=B1 1%     -36.6%   26414565 =C2=B1 0%  TOTAL numa-numastat.n=
ode0.numa_hit

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  21020151 =C2=B1 0%     -36.0%   13450417 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  21020151 =C2=B1 0%     -36.0%   13450417 =C2=B1 0%  TOTAL numa-vmstat.nod=
e0.numa_local

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  21084898 =C2=B1 0%     -35.9%   13516547 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  21084898 =C2=B1 0%     -35.9%   13516547 =C2=B1 0%  TOTAL numa-vmstat.nod=
e0.numa_hit

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.66 =C2=B1 2%     +56.1%       1.02 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-process-pipe
      0.66 =C2=B1 2%     +56.1%       1.02 =C2=B1 3%  TOTAL perf-profile.cp=
u-cycles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wa=
ke_up_common.__wake_up_sync_key

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  76135896 =C2=B1 0%     -35.6%   49027766 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  76135896 =C2=B1 0%     -35.6%   49027766 =C2=B1 0%  TOTAL proc-vmstat.pga=
lloc_normal

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2075 =C2=B117%     -25.7%       1543 =C2=B126%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      2075 =C2=B117%     -25.7%       1543 =C2=B126%  TOTAL slabinfo.blkdev=
_ioc.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      2076 =C2=B117%     -25.4%       1549 =C2=B127%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      2076 =C2=B117%     -25.4%       1549 =C2=B127%  TOTAL slabinfo.blkdev=
_ioc.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  42478629 =C2=B1 1%     -35.0%   27615662 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  42478629 =C2=B1 1%     -35.0%   27615662 =C2=B1 0%  TOTAL numa-numastat.n=
ode1.local_node

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  42481997 =C2=B1 1%     -35.0%   27617365 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  42481997 =C2=B1 1%     -35.0%   27617365 =C2=B1 0%  TOTAL numa-numastat.n=
ode1.numa_hit

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  21585988 =C2=B1 1%     -34.6%   14110975 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  21585988 =C2=B1 1%     -34.6%   14110975 =C2=B1 0%  TOTAL numa-vmstat.nod=
e1.numa_local

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  21597275 =C2=B1 1%     -34.6%   14120957 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  21597275 =C2=B1 1%     -34.6%   14120957 =C2=B1 0%  TOTAL numa-vmstat.nod=
e1.numa_hit

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.86 =C2=B1 5%     +53.3%       2.85 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.86 =C2=B1 5%     +53.3%       2.85 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.idle_cpu.select_task_rq_fair.try_to_wake_up.default_wake_function.=
autoremove_wake_function

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.92 =C2=B113%     -31.2%       0.63 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-process-pipe
      0.92 =C2=B113%     -31.2%       0.63 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles.touch_atime.pipe_read.do_sync_read.vfs_read.sys_read

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      0.96 =C2=B1 4%     -30.4%       0.67 =C2=B1 5%  lkp-snb01/hackbench/5=
0%-process-pipe
      0.96 =C2=B1 4%     -30.4%       0.67 =C2=B1 5%  TOTAL perf-profile.cp=
u-cycles.update_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_task.ac=
tivate_task

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    128510 =C2=B1 0%     -30.7%      89002 =C2=B1 2%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    128510 =C2=B1 0%     -30.7%      89002 =C2=B1 2%  TOTAL meminfo.Active(=
file)

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     32134 =C2=B1 0%     -30.8%      22250 =C2=B1 2%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
     32134 =C2=B1 0%     -30.8%      22250 =C2=B1 2%  TOTAL proc-vmstat.nr_=
active_file

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.08 =C2=B1 4%     -30.1%       0.76 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.08 =C2=B1 4%     -30.1%       0.76 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    978152 =C2=B1 3%     -21.3%     769740 =C2=B119%  lkp-snb01/hackbench/5=
0%-process-pipe
    978152 =C2=B1 3%     -21.3%     769740 =C2=B119%  TOTAL cpuidle.C3-SNB.=
time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   8062365 =C2=B1 1%     -37.1%    5070607 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
 2.751e+08 =C2=B1 0%     -18.4%  2.245e+08 =C2=B1 6%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
 2.832e+08 =C2=B1 0%     -18.9%  2.296e+08 =C2=B1 6%  TOTAL proc-vmstat.pga=
lloc_dma32

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      7722 =C2=B1 1%     -24.6%       5824 =C2=B115%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      7722 =C2=B1 1%     -24.6%       5824 =C2=B115%  TOTAL proc-vmstat.pga=
ctivate

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  84116763 =C2=B1 0%     -35.8%   54027061 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  49792666 =C2=B1 0%     -20.2%   39712359 =C2=B1 6%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
 133909429 =C2=B1 0%     -30.0%   93739420 =C2=B1 2%  TOTAL proc-vmstat.num=
a_local

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  84120980 =C2=B1 0%     -35.8%   54031299 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  49792666 =C2=B1 0%     -20.2%   39712359 =C2=B1 6%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
 133913646 =C2=B1 0%     -30.0%   93743658 =C2=B1 2%  TOTAL proc-vmstat.num=
a_hit

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    672803 =C2=B1 0%     -28.1%     483704 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    672803 =C2=B1 0%     -28.1%     483704 =C2=B1 0%  TOTAL vmstat.memory.c=
ache

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    672747 =C2=B1 0%     -28.1%     483713 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    672747 =C2=B1 0%     -28.1%     483713 =C2=B1 0%  TOTAL meminfo.Cached

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    168187 =C2=B1 0%     -28.1%     120926 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    168187 =C2=B1 0%     -28.1%     120926 =C2=B1 0%  TOTAL proc-vmstat.nr_=
file_pages

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.28 =C2=B1 7%     -28.9%       0.91 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.28 =C2=B1 7%     -28.9%       0.91 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.copy_page_to_iter.pipe_read.do_sync_read.vfs_read.sys_read

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  84177329 =C2=B1 0%     -35.8%   54079701 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
 2.781e+08 =C2=B1 0%     -18.4%  2.269e+08 =C2=B1 6%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
 3.623e+08 =C2=B1 0%     -22.4%   2.81e+08 =C2=B1 5%  TOTAL proc-vmstat.pgf=
ree

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    541579 =C2=B1 0%     -27.6%     392085 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    541579 =C2=B1 0%     -27.6%     392085 =C2=B1 0%  TOTAL meminfo.Inactiv=
e(file)

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    135388 =C2=B1 0%     -27.6%      98019 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    135388 =C2=B1 0%     -27.6%      98019 =C2=B1 0%  TOTAL proc-vmstat.nr_=
inactive_file

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    541892 =C2=B1 0%     -27.6%     392387 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    541892 =C2=B1 0%     -27.6%     392387 =C2=B1 0%  TOTAL meminfo.Inactive

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.07 =C2=B1 3%     -27.2%       0.78 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.07 =C2=B1 3%     -27.2%       0.78 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.__read_nocancel

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.91 =C2=B1 2%     -26.9%       1.40 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.91 =C2=B1 2%     -26.9%       1.40 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.pipe_write.do_sync_write.vfs_write.sys_wr=
ite

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    153459 =C2=B1 0%     -25.8%     113813 =C2=B1 2%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    153459 =C2=B1 0%     -25.8%     113813 =C2=B1 2%  TOTAL meminfo.Active

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1426 =C2=B1 2%     -25.2%       1067 =C2=B1 1%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      1426 =C2=B1 2%     -25.2%       1067 =C2=B1 1%  TOTAL slabinfo.ftrace=
_event_file.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1426 =C2=B1 2%     -25.2%       1067 =C2=B1 1%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      1426 =C2=B1 2%     -25.2%       1067 =C2=B1 1%  TOTAL slabinfo.ftrace=
_event_file.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 4.199e+08 =C2=B1 2%     +33.3%  5.596e+08 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
 4.199e+08 =C2=B1 2%     +33.3%  5.596e+08 =C2=B1 0%  TOTAL cpuidle.C1-SNB.=
time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.49 =C2=B1 1%     -25.7%       1.10 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.49 =C2=B1 1%     -25.7%       1.10 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__switch_to.__read_nocancel

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.25 =C2=B1 2%     +31.6%       1.64 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.25 =C2=B1 2%     +31.6%       1.64 =C2=B1 2%  TOTAL perf-profile.cp=
u-cycles.__fget_light.sys_write.system_call_fastpath.__write_nocancel

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    614765 =C2=B1 0%     -23.5%     470579 =C2=B1 8%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    614765 =C2=B1 0%     -23.5%     470579 =C2=B1 8%  TOTAL softirqs.TIMER

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     11425 =C2=B1 2%     -12.9%       9951 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
      4365 =C2=B1 2%     -16.9%       3630 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      2117 =C2=B1 2%     -34.4%       1388 =C2=B1 2%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
     17908 =C2=B1 2%     -16.4%      14970 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-128.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     41164 =C2=B112%     +20.9%      49766 =C2=B1 6%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
     41164 =C2=B112%     +20.9%      49766 =C2=B1 6%  TOTAL meminfo.DirectM=
ap4k

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8060 =C2=B1 3%     -19.9%       6457 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-process-pipe
      8060 =C2=B1 3%     -19.9%       6457 =C2=B1 4%  TOTAL slabinfo.task_x=
state.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      8016 =C2=B1 3%     -19.5%       6450 =C2=B1 4%  lkp-snb01/hackbench/5=
0%-process-pipe
      8016 =C2=B1 3%     -19.5%       6450 =C2=B1 4%  TOTAL slabinfo.task_x=
state.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   3039372 =C2=B1 2%     -20.6%    2414002 =C2=B1 7%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   3039372 =C2=B1 2%     -20.6%    2414002 =C2=B1 7%  TOTAL proc-vmstat.pga=
lloc_dma

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    159254 =C2=B1 1%     -19.6%     128113 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
    159254 =C2=B1 1%     -19.6%     128113 =C2=B1 1%  TOTAL proc-vmstat.num=
a_hint_faults_local

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      9.33 =C2=B1 2%     -16.4%       7.80 =C2=B1 7%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      9.33 =C2=B1 2%     -16.4%       7.80 =C2=B1 7%  TOTAL perf-profile.cp=
u-cycles.copy_user_generic_string.sctp_user_addto_chunk.sctp_datamsg_from_u=
ser.sctp_sendmsg.inet_sendmsg

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  86862453 =C2=B1 1%     +22.1%  1.061e+08 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
  86862453 =C2=B1 1%     +22.1%  1.061e+08 =C2=B1 0%  TOTAL cpuidle.C1-SNB.=
usage

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1.30 =C2=B1 5%     +16.2%       1.51 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      1.30 =C2=B1 5%     +16.2%       1.51 =C2=B1 1%  TOTAL perf-profile.cp=
u-cycles.vfs_write.sys_write.system_call_fastpath.__write_nocancel

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     11443 =C2=B1 2%     -12.5%      10010 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
      4574 =C2=B1 2%     -16.2%       3832 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      2117 =C2=B1 2%     -17.7%       1741 =C2=B1 4%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
     18135 =C2=B1 2%     -14.1%      15585 =C2=B1 2%  TOTAL slabinfo.kmallo=
c-128.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    454028 =C2=B1 0%     -14.7%     387291 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
    454028 =C2=B1 0%     -14.7%     387291 =C2=B1 0%  TOTAL proc-vmstat.num=
a_pte_updates

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1129166 =C2=B1 0%     +17.1%    1322132 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   1129166 =C2=B1 0%     +17.1%    1322132 =C2=B1 0%  TOTAL vmstat.memory.f=
ree

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1129151 =C2=B1 0%     +17.1%    1322021 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   1129151 =C2=B1 0%     +17.1%    1322021 =C2=B1 0%  TOTAL meminfo.MemFree

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    282289 =C2=B1 0%     +17.1%     330504 =C2=B1 0%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
    282289 =C2=B1 0%     +17.1%     330504 =C2=B1 0%  TOTAL proc-vmstat.nr_=
free_pages

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   1352710 =C2=B1 1%      -9.6%    1222637 =C2=B1 2%  lkp-snb01/hackbench/5=
0%-process-pipe
     59510 =C2=B1 5%     -20.1%      47545 =C2=B110%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   1412220 =C2=B1 2%     -10.1%    1270182 =C2=B1 2%  TOTAL softirqs.RCU

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      7978 =C2=B1 0%     -13.8%       6877 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      7978 =C2=B1 0%     -13.8%       6877 =C2=B1 1%  TOTAL slabinfo.files_=
cache.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      7978 =C2=B1 0%     -13.8%       6877 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      7978 =C2=B1 0%     -13.8%       6877 =C2=B1 1%  TOTAL slabinfo.files_=
cache.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   6685911 =C2=B1 6%     -12.8%    5832341 =C2=B1 1%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   6685911 =C2=B1 6%     -12.8%    5832341 =C2=B1 1%  TOTAL softirqs.NET_RX

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3213 =C2=B1 1%     -14.3%       2754 =C2=B1 2%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      2737 =C2=B1 1%     -11.8%       2414 =C2=B1 2%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      5950 =C2=B1 1%     -13.1%       5168 =C2=B1 2%  TOTAL slabinfo.shared=
_policy_node.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3213 =C2=B1 1%     -14.3%       2754 =C2=B1 2%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      2737 =C2=B1 1%     -11.8%       2414 =C2=B1 2%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
      5950 =C2=B1 1%     -13.1%       5168 =C2=B1 2%  TOTAL slabinfo.shared=
_policy_node.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19418 =C2=B1 1%     +14.3%      22186 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
     19418 =C2=B1 1%     +14.3%      22186 =C2=B1 0%  TOTAL softirqs.HRTIMER

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5265 =C2=B1 1%      -9.8%       4750 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      5265 =C2=B1 1%      -9.8%       4750 =C2=B1 1%  TOTAL slabinfo.signal=
_cache.active_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      5359 =C2=B1 1%      -9.5%       4851 =C2=B1 1%  lkp-snb01/hackbench/5=
0%-process-pipe
      5359 =C2=B1 1%      -9.5%       4851 =C2=B1 1%  TOTAL slabinfo.signal=
_cache.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     19262 =C2=B1 2%      -8.2%      17684 =C2=B1 3%  lkp-snb01/hackbench/5=
0%-process-pipe
     19262 =C2=B1 2%      -8.2%      17684 =C2=B1 3%  TOTAL slabinfo.kmallo=
c-192.num_objs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     72008 =C2=B1 0%      -8.7%      65715 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
     72008 =C2=B1 0%      -8.7%      65715 =C2=B1 0%  TOTAL proc-vmstat.pgm=
igrate_success

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     72008 =C2=B1 0%      -8.7%      65715 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
     72008 =C2=B1 0%      -8.7%      65715 =C2=B1 0%  TOTAL proc-vmstat.num=
a_pages_migrated

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3.05 =C2=B136%     -67.0%       1.01 =C2=B1 4%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
      3.05 =C2=B136%     -67.0%       1.01 =C2=B1 4%  TOTAL iostat.sdf.wrqm=
/s

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    873523 =C2=B1 1%     +71.8%    1501063 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
    873523 =C2=B1 1%     +71.8%    1501063 =C2=B1 0%  TOTAL vmstat.system.in

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  28067347 =C2=B1 1%     -33.7%   18595224 =C2=B1 1%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
  28067347 =C2=B1 1%     -33.7%   18595224 =C2=B1 1%  TOTAL perf-stat.iTLB-=
load-misses

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 2.631e+09 =C2=B1 0%     -26.9%  1.922e+09 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
 2.631e+09 =C2=B1 0%     -26.9%  1.922e+09 =C2=B1 0%  TOTAL time.voluntary_=
context_switches

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      1240 =C2=B1 0%     -25.2%        928 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
      1240 =C2=B1 0%     -25.2%        928 =C2=B1 0%  TOTAL time.user_time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 7.586e+08 =C2=B1 0%     -39.2%  4.614e+08 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
    149744 =C2=B1 1%      +4.0%     155739 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 7.587e+08 =C2=B1 0%     -39.2%  4.616e+08 =C2=B1 0%  TOTAL time.involuntar=
y_context_switches

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     99.29 =C2=B1 0%     -21.6%      77.86 =C2=B1 7%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
     99.29 =C2=B1 0%     -21.6%      77.86 =C2=B1 7%  TOTAL turbostat.%c0

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   5681114 =C2=B1 0%     -29.0%    4034794 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
     11667 =C2=B1 0%      -9.0%      10620 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
     41698 =C2=B110%     +15.9%      48342 =C2=B1 2%  lkp-t410/netperf/300s=
-200%-10K-SCTP_STREAM_MANY
   5734480 =C2=B1 0%     -28.6%    4093757 =C2=B1 0%  TOTAL vmstat.system.cs

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
    729049 =C2=B1 0%     -15.6%     615443 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
    729049 =C2=B1 0%     -15.6%     615443 =C2=B1 0%  TOTAL time.minor_page=
_faults

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.232e+09 =C2=B1 7%     -12.6%  1.077e+09 =C2=B1 4%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 1.232e+09 =C2=B1 7%     -12.6%  1.077e+09 =C2=B1 4%  TOTAL perf-stat.dTLB-=
store-misses

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 7.771e+09 =C2=B1 0%     +10.8%  8.608e+09 =C2=B1 1%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 7.771e+09 =C2=B1 0%     +10.8%  8.608e+09 =C2=B1 1%  TOTAL perf-stat.branc=
h-misses

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
   7102173 =C2=B1 0%      -8.9%    6468745 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
   7102173 =C2=B1 0%      -8.9%    6468745 =C2=B1 0%  TOTAL perf-stat.conte=
xt-switches

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 7.793e+09 =C2=B1 0%     +10.2%  8.589e+09 =C2=B1 2%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 7.793e+09 =C2=B1 0%     +10.2%  8.589e+09 =C2=B1 2%  TOTAL perf-stat.branc=
h-load-misses

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
           =C2=B1 0%      -4.6%            =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
           =C2=B1 0%      -4.6%            =C2=B1 0%  TOTAL turbostat.Cor_W

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.887e+12 =C2=B1 0%      +4.4%  1.971e+12 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 1.887e+12 =C2=B1 0%      +4.4%  1.971e+12 =C2=B1 0%  TOTAL perf-stat.dTLB-=
loads

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 1.885e+12 =C2=B1 0%      +4.4%  1.967e+12 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 1.885e+12 =C2=B1 0%      +4.4%  1.967e+12 =C2=B1 0%  TOTAL perf-stat.L1-dc=
ache-loads

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
           =C2=B1 0%      -3.3%            =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
           =C2=B1 0%      -3.3%            =C2=B1 0%  TOTAL turbostat.Pkg_W

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     17763 =C2=B1 0%      +2.1%      18139 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
     17763 =C2=B1 0%      +2.1%      18139 =C2=B1 0%  TOTAL time.system_time

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
      3087 =C2=B1 0%      -1.2%       3050 =C2=B1 0%  lkp-snb01/hackbench/5=
0%-process-pipe
      3087 =C2=B1 0%      -1.2%       3050 =C2=B1 0%  TOTAL time.percent_of=
_cpu_this_job_got

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
  6.85e+12 =C2=B1 0%      +1.5%  6.953e+12 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
  6.85e+12 =C2=B1 0%      +1.5%  6.953e+12 =C2=B1 0%  TOTAL perf-stat.ref-c=
ycles

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     92145 =C2=B1 0%      +0.8%      92909 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
     92145 =C2=B1 0%      +0.8%      92909 =C2=B1 0%  TOTAL iostat.sdf.wkB/s

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 8.563e+11 =C2=B1 0%      +1.5%  8.689e+11 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 8.563e+11 =C2=B1 0%      +1.5%  8.689e+11 =C2=B1 0%  TOTAL perf-stat.bus-c=
ycles

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
     92292 =C2=B1 0%      +0.9%      93079 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
     92292 =C2=B1 0%      +0.9%      93079 =C2=B1 0%  TOTAL iostat.sdj.wkB/s

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 6.859e+12 =C2=B1 0%      +1.3%  6.951e+12 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 6.859e+12 =C2=B1 0%      +1.3%  6.951e+12 =C2=B1 0%  TOTAL perf-stat.cpu-c=
ycles

b1ad065e65f5610  096aa33863a5e48de52d2ff30  testbox/testcase/testparams
---------------  -------------------------  ---------------------------
 6.148e+12 =C2=B1 0%      +1.1%  6.217e+12 =C2=B1 0%  lkp-st02/dd-write/11H=
DD-JBOD-cfq-xfs-10dd
 6.148e+12 =C2=B1 0%      +1.1%  6.217e+12 =C2=B1 0%  TOTAL perf-stat.L1-ic=
ache-loads


Thanks,
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============0824677917197185078==
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
cmVxL3NjYWxpbmdfZ292ZXJub3IKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAt
LXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUg
LWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAw
MDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4v
aGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2Jl
bmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0t
cHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2Vz
cyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBp
cGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwg
NjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAK
L3Vzci9iaW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9i
aW4vaGFja2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAKL3Vzci9iaW4vaGFj
a2JlbmNoIC1nIDE2IC0tcHJvY2VzcyAtLXBpcGUgLWwgNjAwMDAK

--===============0824677917197185078==--

