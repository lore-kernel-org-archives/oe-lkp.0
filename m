Content-Type: multipart/mixed; boundary="===============1455057363846396587=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [net/socket.c ] 0cf00c6f360: -3.1% netperf.Throughput_Mbps
Date: Sun, 04 Jan 2015 10:18:35 +0800
Message-ID: <1420337915.6201.3.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1455057363846396587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 0cf00c6f360a3f7b97be000520f1acde88800536 ("net/socket.c : introduce =
helper function do_sock_sendmsg to replace reduplicate code")


testbox/testcase/testparams: lkp-t410/netperf/performance-300s-200%-10K-SCT=
P_STREAM_MANY

42eef7a0bb0989cd  0cf00c6f360a3f7b97be000520  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

   1293786 =C2=B1  4%     -17.0%    1073209 =C2=B1  4%  netperf.time.volunt=
ary_context_switches
     13.73 =C2=B1  3%      -8.2%      12.61 =C2=B1  1%  netperf.time.user_t=
ime
      1198 =C2=B1  0%      -3.1%       1162 =C2=B1  0%  netperf.Throughput_=
Mbps
       220 =C2=B1  0%      -2.8%        214 =C2=B1  0%  netperf.time.percen=
t_of_cpu_this_job_got
       653 =C2=B1  0%      -2.7%        635 =C2=B1  0%  netperf.time.system=
_time
      5.91 =C2=B1 22%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_unlock_bh.release_sock.sctp_sendmsg.inet_sendmsg.sock_sendmsg
         0 =C2=B1  0%      +Inf%        131 =C2=B1  1%  latency_stats.avg.s=
ctp_sendmsg.[sctp].inet_sendmsg.do_sock_sendmsg.___sys_sendmsg.__sys_sendms=
g.SyS_sendmsg.system_call_fastpath
         0 =C2=B1  0%      +Inf%       4976 =C2=B1  0%  latency_stats.max.s=
ctp_sendmsg.[sctp].inet_sendmsg.do_sock_sendmsg.___sys_sendmsg.__sys_sendms=
g.SyS_sendmsg.system_call_fastpath
     15.58 =C2=B1  5%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_datamsg_from_user.sctp_sendmsg.inet_sendmsg.sock_sendmsg.___sys_s=
endmsg
     21.57 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_primitive_SEND.sctp_sendmsg.inet_sendmsg.sock_sendmsg.___sys_send=
msg
     21.10 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.release_sock.sctp_sendmsg.inet_sendmsg.sock_sendmsg.___sys_sendmsg
     62.06 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_sendmsg.inet_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sendmsg
     62.68 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.inet_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sendmsg.sys_sendmsg
     63.26 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sock_sendmsg.___sys_sendmsg.__sys_sendmsg.sys_sendmsg.system_call_fast=
path
         0 =C2=B1  0%      +Inf%    1068435 =C2=B1  4%  latency_stats.hits.=
sctp_sendmsg.[sctp].inet_sendmsg.do_sock_sendmsg.___sys_sendmsg.__sys_sendm=
sg.SyS_sendmsg.system_call_fastpath
     14.88 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_backlog_rcv.release_sock.sctp_sendmsg.inet_sendmsg.sock_sendmsg
     12.33 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg.inet_sendmsg.sock_sendmsg
         0 =C2=B1  0%      +Inf%  1.404e+08 =C2=B1  3%  latency_stats.sum.s=
ctp_sendmsg.[sctp].inet_sendmsg.do_sock_sendmsg.___sys_sendmsg.__sys_sendms=
g.SyS_sendmsg.system_call_fastpath
      8.68 =C2=B1  5%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_user_addto_chunk.sctp_datamsg_from_user.sctp_sendmsg.inet_sendmsg=
.sock_sendmsg
      5.78 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg.inet_send=
msg.sock_sendmsg
      4960 =C2=B1  1%    -100.0%          0 =C2=B1  0%  latency_stats.max.s=
ctp_sendmsg.[sctp].inet_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sendmsg.S=
yS_sendmsg.system_call_fastpath
       135 =C2=B1  3%    -100.0%          0 =C2=B1  0%  latency_stats.avg.s=
ctp_sendmsg.[sctp].inet_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sendmsg.S=
yS_sendmsg.system_call_fastpath
 1.755e+08 =C2=B1  5%    -100.0%          0 =C2=B1  0%  latency_stats.sum.s=
ctp_sendmsg.[sctp].inet_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sendmsg.S=
yS_sendmsg.system_call_fastpath
   1289900 =C2=B1  4%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
sctp_sendmsg.[sctp].inet_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_sendmsg.=
SyS_sendmsg.system_call_fastpath
      0.00 =C2=B1  0%      +Inf%       5.88 =C2=B1  9%  perf-profile.cpu-cy=
cles._raw_spin_unlock_bh.release_sock.sctp_sendmsg.inet_sendmsg.do_sock_sen=
dmsg
      0.00 =C2=B1  0%      +Inf%       6.16 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg.inet_send=
msg.do_sock_sendmsg
      0.00 =C2=B1  0%      +Inf%       8.69 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_user_addto_chunk.sctp_datamsg_from_user.sctp_sendmsg.inet_sendmsg=
.do_sock_sendmsg
      0.00 =C2=B1  0%      +Inf%      12.81 =C2=B1  3%  perf-profile.cpu-cy=
cles.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg.inet_sendmsg.do_sock_sendm=
sg
      0.00 =C2=B1  0%      +Inf%      22.40 =C2=B1  4%  perf-profile.cpu-cy=
cles.sctp_primitive_SEND.sctp_sendmsg.inet_sendmsg.do_sock_sendmsg.___sys_s=
endmsg
      0.00 =C2=B1  0%      +Inf%      16.02 =C2=B1  0%  perf-profile.cpu-cy=
cles.sctp_datamsg_from_user.sctp_sendmsg.inet_sendmsg.do_sock_sendmsg.___sy=
s_sendmsg
      0.00 =C2=B1  0%      +Inf%      20.81 =C2=B1  3%  perf-profile.cpu-cy=
cles.release_sock.sctp_sendmsg.inet_sendmsg.do_sock_sendmsg.___sys_sendmsg
      0.00 =C2=B1  0%      +Inf%      64.24 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_sock_sendmsg.___sys_sendmsg.__sys_sendmsg.sys_sendmsg.system_call_f=
astpath
      0.00 =C2=B1  0%      +Inf%      63.64 =C2=B1  2%  perf-profile.cpu-cy=
cles.inet_sendmsg.do_sock_sendmsg.___sys_sendmsg.__sys_sendmsg.sys_sendmsg
      0.00 =C2=B1  0%      +Inf%      63.01 =C2=B1  2%  perf-profile.cpu-cy=
cles.sctp_sendmsg.inet_sendmsg.do_sock_sendmsg.___sys_sendmsg.__sys_sendmsg
      0.00 =C2=B1  0%      +Inf%      14.61 =C2=B1  1%  perf-profile.cpu-cy=
cles.sctp_backlog_rcv.release_sock.sctp_sendmsg.inet_sendmsg.do_sock_sendmsg
      1911 =C2=B1 30%     +92.9%       3687 =C2=B1 19%  latency_stats.sum.d=
own.console_lock.console_device.tty_open.chrdev_open.do_dentry_open.vfs_ope=
n.do_last.path_openat.do_filp_open.do_sys_open.SyS_open
    197535 =C2=B1 24%     +45.6%     287661 =C2=B1 14%  sched_debug.cpu#1.s=
ched_goidle
      2800 =C2=B1  7%     +58.9%       4449 =C2=B1 12%  cpuidle.C6-NHM.usage
   8319130 =C2=B1  3%     +48.0%   12315380 =C2=B1 12%  cpuidle.C6-NHM.time
  16345940 =C2=B1 12%     +52.9%   24992140 =C2=B1  9%  cpuidle.C1-NHM.time
      4.83 =C2=B1 13%     +52.6%       7.37 =C2=B1 10%  turbostat.%c1
  36210370 =C2=B1 14%     +54.4%   55904924 =C2=B1 10%  cpuidle.C1E-NHM.time
      4763 =C2=B1 14%     +70.5%       8121 =C2=B1  7%  cpuidle.C3-NHM.usage
    740074 =C2=B1 13%     +54.9%    1146007 =C2=B1  9%  cpuidle.C1E-NHM.usa=
ge
    201068 =C2=B1 19%     +38.3%     277987 =C2=B1 11%  sched_debug.cpu#0.s=
ched_goidle
      0.23 =C2=B1 10%     +60.4%       0.36 =C2=B1 27%  turbostat.%c6
      0.14 =C2=B1 16%     +27.8%       0.17 =C2=B1 19%  turbostat.%c3
    198646 =C2=B1 19%     +44.9%     287931 =C2=B1 11%  sched_debug.cpu#2.s=
ched_goidle
    401326 =C2=B1 16%     +47.4%     591389 =C2=B1 10%  cpuidle.C1-NHM.usage
       115 =C2=B1 10%     -23.6%         88 =C2=B1 16%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.rpc_call_sync.n=
fs3_rpc_wrapper.nfs3_proc_access.nfs_do_access.nfs_permission.__inode_permi=
ssion.inode_permission.may_open
     34172 =C2=B1  7%     +30.3%      44535 =C2=B1  5%  softirqs.SCHED
   3363437 =C2=B1 11%     +34.9%    4538159 =C2=B1 14%  cpuidle.C3-NHM.time
       156 =C2=B1  5%     +26.1%        197 =C2=B1  6%  uptime.idle
    212838 =C2=B1 17%     +39.3%     296432 =C2=B1  7%  sched_debug.cpu#3.s=
ched_goidle
       151 =C2=B1  5%     -18.5%        123 =C2=B1  3%  latency_stats.avg.s=
ctp_skb_recv_datagram.[sctp].sctp_recvmsg.[sctp].sock_common_recvmsg.sock_r=
ecvmsg.___sys_recvmsg.__sys_recvmsg.SyS_recvmsg.system_call_fastpath
   1137848 =C2=B1  9%     +15.6%    1314801 =C2=B1  4%  sched_debug.cpu#1.s=
ched_count
   1137594 =C2=B1  9%     +15.5%    1314483 =C2=B1  4%  sched_debug.cpu#1.n=
r_switches
       427 =C2=B1  7%     +15.8%        495 =C2=B1  5%  sched_debug.cpu#3.l=
oad
    607501 =C2=B1  6%     -11.3%     539116 =C2=B1  4%  sched_debug.cpu#2.t=
twu_local
   1063918 =C2=B1  4%     -10.4%     952749 =C2=B1  6%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
   3700692 =C2=B1  3%     +12.8%    4174394 =C2=B1  2%  latency_stats.hits.=
sctp_skb_recv_datagram.[sctp].sctp_recvmsg.[sctp].sock_common_recvmsg.sock_=
recvmsg.___sys_recvmsg.__sys_recvmsg.SyS_recvmsg.system_call_fastpath
      1.05 =C2=B1  4%     +10.2%       1.16 =C2=B1  4%  perf-profile.cpu-cy=
cles.kmalloc_large_node.__kmalloc_node_track_caller.__kmalloc_reserve.__all=
oc_skb.sctp_packet_transmit
      2.93 =C2=B1  5%      +7.9%       3.16 =C2=B1  3%  perf-profile.cpu-cy=
cles.__kmalloc_reserve.isra.26.__alloc_skb._sctp_make_chunk.sctp_make_dataf=
rag_empty.sctp_datamsg_from_user
    334282 =C2=B1  4%      -7.3%     309726 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      0.91 =C2=B1  7%     -11.0%       0.81 =C2=B1  3%  perf-profile.cpu-cy=
cles.nf_hook_slow.ip_output.ip_local_out_sk.ip_queue_xmit.sctp_v4_xmit
      2.74 =C2=B1  2%      +8.2%       2.97 =C2=B1  2%  perf-profile.cpu-cy=
cles.get_page_from_freelist.__alloc_pages_nodemask.alloc_kmem_pages_node.km=
alloc_large_node.__kmalloc_node_track_caller
    245637 =C2=B1  3%     -13.0%     213811 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.MIN_vruntime
    245637 =C2=B1  3%     -13.0%     213811 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.max_vruntime
    623176 =C2=B1  4%      -9.9%     561641 =C2=B1  5%  sched_debug.cpu#3.t=
twu_local
       437 =C2=B1  2%      -7.7%        403 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[3]
   1293786 =C2=B1  4%     -17.0%    1073209 =C2=B1  4%  time.voluntary_cont=
ext_switches
     27545 =C2=B1  3%     +11.2%      30617 =C2=B1  1%  vmstat.system.cs
     94.80 =C2=B1  0%      -2.9%      92.09 =C2=B1  0%  turbostat.%c0
       220 =C2=B1  0%      -2.8%        214 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
       653 =C2=B1  0%      -2.7%        635 =C2=B1  0%  time.system_time

lkp-t410: Westmere
Memory: 2G


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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============1455057363846396587==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBuZXRwZXJmCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QK
ICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1h
LXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAK
ICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBs
YXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3Rh
dHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRfZGVidWc6
CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3YXRjaC1v
b206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpjb21taXQ6
IDk3YmY2YWYxZjkyODIxNmZkNmM1YTY2ZThhNTdiZmE5NWE2NTk2NzIKbW9kZWw6IFdlc3RtZXJl
Cm1lbW9yeTogMkcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUZVSklUU1Vf
TUpBMjI1MEJIX0cyX0s5NUNUOUMyRzI5Vy1wYXJ0NiIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZz
X3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtRlVKSVRTVV9NSkEyMjUwQkhfRzJfSzk1
Q1Q5QzJHMjlXLXBhcnQ3IgpydW50aW1lOiAzMDBzCm5yX3RocmVhZHM6Ci0gMjAwJQpwZXJmLXBy
b2ZpbGU6CiAgZnJlcTogODAwCm5ldHBlcmY6CiAgc2VuZF9zaXplOiAxMEsKICB0ZXN0OgogIC0g
U0NUUF9TVFJFQU1fTUFOWQp0ZXN0Ym94OiBsa3AtdDQxMAp0Ym94X2dyb3VwOiBsa3AtdDQxMApr
Y29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTQtMTItMTUgMTM6NDA6NTQuODQz
OTcwNjQ4ICswODowMApoZWFkX2NvbW1pdDogN2NkYWY0Y2MyYTA3ZDI0NjdhYmU4MmI4NDdmYzNi
ZDJiYzllMDE3YgpiYXNlX2NvbW1pdDogOTdiZjZhZjFmOTI4MjE2ZmQ2YzVhNjZlOGE1N2JmYTk1
YTY1OTY3MgpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE0MTIyMzE5Cmtlcm5l
bDogIi9rZXJuZWwveDg2XzY0LXJoZWwvOTdiZjZhZjFmOTI4MjE2ZmQ2YzVhNjZlOGE1N2JmYTk1
YTY1OTY3Mi92bWxpbnV6LTMuMTkuMC1yYzEtZzk3YmY2YWYiCnVzZXI6IGxrcApxdWV1ZTogY3lj
bGljCnJvb3RmczogZGViaWFuLXg4Nl82NC5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2xrcC10
NDEwL25ldHBlcmYvcGVyZm9ybWFuY2UtMzAwcy0yMDAlLTEwSy1TQ1RQX1NUUkVBTV9NQU5ZL2Rl
Ymlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsLzk3YmY2YWYxZjkyODIxNmZkNmM1YTY2ZThhNTdi
ZmE5NWE2NTk2NzIvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtdDQxMC9jeWNsaWNf
bmV0cGVyZi1wZXJmb3JtYW5jZS0zMDBzLTIwMCUtMTBLLVNDVFBfU1RSRUFNX01BTlkteDg2XzY0
LXJoZWwtQkFTRS05N2JmNmFmMWY5MjgyMTZmZDZjNWE2NmU4YTU3YmZhOTVhNjU5NjcyLTAueWFt
bCIKZGVxdWV1ZV90aW1lOiAyMDE0LTEyLTIzIDIxOjI2OjIwLjIyODg2NDIxOCArMDg6MDAKam9i
X3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA3LjE3IDUuMjMgMi4zMSAxLzk5IDU0NDIKc3RhcnRf
dGltZTogJzE0MTkzNDEyMTInCmVuZF90aW1lOiAnMTQxOTM0MTUxNCcKdmVyc2lvbjogIi9sa3Av
bGtwLy5zcmMtMjAxNDEyMjMtMTEyOTI3Igo=

--===============1455057363846396587==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCm5ldHNlcnZlcgpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAw
IC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1t
IDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJm
IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RS
RUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwpuZXRwZXJmIC10IFNDVFBfU1RSRUFNX01B
TlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSwo=

--===============1455057363846396587==--

