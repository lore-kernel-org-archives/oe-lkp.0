Content-Type: multipart/mixed; boundary="===============3906331191670680977=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [cpuidle] 664ef5b861: No primary result change, +13.7% turbostat.PkgWatt
Date: Mon, 21 Mar 2016 15:13:45 +0800
Message-ID: <20160321071345.GB897@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3906331191670680977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that turbostat.PkgWatt +13.7% change with your commit.

https://github.com/0day-ci/linux Rik-van-Riel/cpuidle-break-out-of-idle-pol=
ling-loop-after-HLT-threshold/20160319-053854
commit 664ef5b8615ff12b03b46988408b4c0a15eab07c ("cpuidle: use high confide=
nce factors only when considering polling")

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox=
_group/test/testcase:
  cs-localhost/gcc-4.9/performance/ipv4/x86_64-rhel/1/debian-x86_64-2015-02=
-07.cgz/300s/lkp-hsw-d01/SCTP_RR/netperf

commit: =

  38497f04cd3604396327ba1810dde0ac239989f4
  664ef5b8615ff12b03b46988408b4c0a15eab07c

38497f04cd360439 664ef5b8615ff12b03b4698840 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     67771 =C2=B1  1%      +2.8%      69694 =C2=B1  1%  netperf.Throughput_=
tps
     77.00 =C2=B1  0%      +1.3%      78.00 =C2=B1  0%  netperf.time.percen=
t_of_cpu_this_job_got
    226.75 =C2=B1  0%      +3.3%     234.16 =C2=B1  0%  netperf.time.system=
_time
  20330477 =C2=B1  1%      +2.8%   20907309 =C2=B1  1%  netperf.time.volunt=
ary_context_switches
      9.29 =C2=B1 10%     -42.2%       5.38 =C2=B1  6%  time.user_time
    266114 =C2=B1  1%      +2.8%     273497 =C2=B1  1%  vmstat.system.cs
      1929 =C2=B1  1%    +374.1%       9148 =C2=B1 23%  vmstat.system.in
 1.622e+08 =C2=B1  6%     -64.3%   57961470 =C2=B1  6%  cpuidle.C1-HSW.time
  33127115 =C2=B1  3%     -96.7%    1109711 =C2=B1 50%  cpuidle.C1-HSW.usage
   5649502 =C2=B1 10%     +16.0%    6551668 =C2=B1  2%  cpuidle.C3-HSW.time
  63535957 =C2=B1 10%    +117.7%  1.383e+08 =C2=B1  1%  cpuidle.POLL.time
   7659494 =C2=B1 10%   +1097.5%   91718696 =C2=B1  3%  cpuidle.POLL.usage
     21.06 =C2=B1  1%     +16.3%      24.50 =C2=B1  0%  turbostat.%Busy
    794.00 =C2=B1  2%     +19.7%     950.33 =C2=B1  0%  turbostat.Avg_MHz
     20.14 =C2=B1 12%     -20.2%      16.06 =C2=B1 10%  turbostat.CPU%c1
      0.38 =C2=B1  5%     +18.5%       0.45 =C2=B1  3%  turbostat.CPU%c3
     17.24 =C2=B1  0%     +21.0%      20.85 =C2=B1  2%  turbostat.CorWatt
     25.77 =C2=B1  0%     +13.7%      29.31 =C2=B1  1%  turbostat.PkgWatt
      0.51 =C2=B1 39%    +164.7%       1.36 =C2=B1 36%  perf-profile.cycles=
-pp._raw_spin_lock_bh.lock_sock_nested.sctp_skb_recv_datagram.sctp_recvmsg.=
sock_common_recvmsg
      0.51 =C2=B1 34%    +142.9%       1.23 =C2=B1 27%  perf-profile.cycles=
-pp.cpuidle_select.cpu_startup_entry.start_secondary
      1.34 =C2=B1  7%     +11.8%       1.50 =C2=B1  5%  perf-profile.cycles=
-pp.dequeue_entity.dequeue_task_fair.deactivate_task.__schedule.schedule
     14.74 =C2=B1 14%     -78.4%       3.18 =C2=B1 68%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      1.32 =C2=B1 12%     -28.5%       0.94 =C2=B1 18%  perf-profile.cycles=
-pp.is_ftrace_trampoline.print_context_stack.dump_trace.save_stack_trace_ts=
k.__account_scheduler_latency
      1.16 =C2=B1 17%     -21.3%       0.91 =C2=B1 19%  perf-profile.cycles=
-pp.kfree_skb.sctp_ulpevent_free.sctp_recvmsg.sock_common_recvmsg.sock_recv=
msg
      0.00 =C2=B1 -1%      +Inf%      17.25 =C2=B1  4%  perf-profile.cycles=
-pp.ktime_get.poll_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle
      0.68 =C2=B1 31%    +126.6%       1.55 =C2=B1 33%  perf-profile.cycles=
-pp.lock_sock_nested.sctp_skb_recv_datagram.sctp_recvmsg.sock_common_recvms=
g.sock_recvmsg
      0.38 =C2=B1 41%    +178.9%       1.06 =C2=B1 28%  perf-profile.cycles=
-pp.menu_select.cpuidle_select.cpu_startup_entry.start_secondary
      0.30 =C2=B1 82%    +304.4%       1.22 =C2=B1 42%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_bh.lock_sock_nested.sct=
p_skb_recv_datagram.sctp_recvmsg
      9.13 =C2=B1 35%    +165.1%      24.19 =C2=B1  3%  perf-profile.cycles=
-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_en=
try
      0.00 =C2=B1 -1%      +Inf%      10.46 =C2=B1  2%  perf-profile.cycles=
-pp.read_tsc.ktime_get.poll_idle.cpuidle_enter_state.cpuidle_enter
      1.14 =C2=B1 14%     -16.2%       0.95 =C2=B1  8%  perf-profile.cycles=
-pp.sctp_make_control.sctp_make_sack.sctp_packet_append_chunk.sctp_packet_t=
ransmit_chunk.sctp_outq_flush
      1.71 =C2=B1 10%     -16.3%       1.43 =C2=B1  5%  perf-profile.cycles=
-pp.sctp_make_sack.sctp_packet_append_chunk.sctp_packet_transmit_chunk.sctp=
_outq_flush.sctp_outq_uncork
      3.00 =C2=B1  8%     -12.8%       2.62 =C2=B1  4%  perf-profile.cycles=
-pp.sctp_packet_transmit_chunk.sctp_outq_flush.sctp_outq_uncork.sctp_cmd_in=
terpreter.sctp_do_sm
      1.40 =C2=B1  7%     -23.9%       1.06 =C2=B1 11%  perf-profile.cycles=
-pp.sctp_transport_reset_timers.sctp_outq_flush.sctp_outq_uncork.sctp_cmd_i=
nterpreter.sctp_do_sm
      1.59 =C2=B1 20%     -24.9%       1.19 =C2=B1 24%  perf-profile.cycles=
-pp.sctp_ulpevent_free.sctp_recvmsg.sock_common_recvmsg.sock_recvmsg.___sys=
_recvmsg


lkp-hsw-d01: Haswell
Memory: 8G



                                turbostat.PkgWatt

  35 ++--------------------------------------------------------------------=
-+
     |   O                                                                 =
 |
  30 OOO  OO O  OOO O O                                                    =
 |
     |      O                                                       *  *   =
 |
  25 **  ******.*****.******.* ***.*** *.******.** **.******.*****.* ** *.*=
**
     |:  :                   : :     : :         : :                       =
 |
  20 ++  :                   : :     : :         : :                       =
 |
     |: :                    : :     : :         : :                       =
 |
  15 ++ :                    : :     : :         : :                       =
 |
     | ::                     ::      ::          ::                       =
 |
  10 ++::                     :       :           :                        =
 |
     | ::                     :       :           :                        =
 |
   5 ++:                      :       :           :                        =
 |
     | :                      :       :           :                        =
 |
   0 ++*------O----O----------*-------*-----------*------------------------=
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
Xiaolong Ye.

--===============3906331191670680977==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogbmV0cGVyZgpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0
b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2bXN0YXQ6
IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHBy
b2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBz
bGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAK
ICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6
IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAK
ICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3Jt
YW5jZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1p
dDogNjY0ZWY1Yjg2MTVmZjEyYjAzYjQ2OTg4NDA4YjRjMGExNWVhYjA3Ywptb2RlbDogSGFzd2Vs
bApucl9jcHU6IDgKbWVtb3J5OiA4RwpoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczog
CnJvb3Rmc19wYXJ0aXRpb246IApjYXRlZ29yeTogYmVuY2htYXJrCmlwOiBpcHY0CnJ1bnRpbWU6
IDMwMHMKbnJfdGhyZWFkczogMQpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCmNsdXN0ZXI6IGNz
LWxvY2FsaG9zdAppZiByb2xlIHNlcnZlcjoKICBuZXRzZXJ2ZXI6IAppZiByb2xlIGNsaWVudDoK
ICBuZXRwZXJmOgogICAgdGVzdDogU0NUUF9SUgpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1o
c3ctZDAxCnRib3hfZ3JvdXA6IGxrcC1oc3ctZDAxCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVl
dWVfdGltZTogMjAxNi0wMy0xOSAxODoxNzozNy4zNTgzNjIxNDQgKzA4OjAwCmNvbXBpbGVyOiBn
Y2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogNGM4ZWNjNjhm
NTg1M2YxYWFmMWYzODIwZjQzYjM0MDc3YThmOGJlYwp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IGRk
MjA2MjE5YzEyODVjNjE3NmM1NTEwNjJjNzg1YmYxOTZmYWVhOWYKYmFzZV9jb21taXQ6IGI1NjJl
NDRmNTA3ZTg2M2M2NzkyOTQ2ZTRlMWIxNDQ5ZmJiYWM4NWQKYnJhbmNoOiBsaW51eC1kZXZlbC9k
ZXZlbC1ob3VybHktMjAxNjAzMTkwNQpub2RlX3JvbGVzOiBzZXJ2ZXIgY2xpZW50CnJlc3VsdF9y
b290OiAiL3Jlc3VsdC9uZXRwZXJmL3BlcmZvcm1hbmNlLWlwdjQtMzAwcy0xLWNzLWxvY2FsaG9z
dC1TQ1RQX1JSL2xrcC1oc3ctZDAxL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0
LXJoZWwvZ2NjLTQuOS82NjRlZjViODYxNWZmMTJiMDNiNDY5ODg0MDhiNGMwYTE1ZWFiMDdjLzAi
CmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLWhzdy1kMDEvYmlzZWN0X25ldHBlcmYtcGVy
Zm9ybWFuY2UtaXB2NC0zMDBzLTEtY3MtbG9jYWxob3N0LVNDVFBfUlItZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC02NjRlZjViODYxNWZmMTJiMDNiNDY5ODg0MDhiNGMw
YTE1ZWFiMDdjLTIwMTYwMzE5LTI1OTU5LXU4M284ai0wLnlhbWwiCm1heF91cHRpbWU6IDE1MDAK
aW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJv
b3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9z
Y2hlZHVsZWQvbGtwLWhzdy1kMDEvYmlzZWN0X25ldHBlcmYtcGVyZm9ybWFuY2UtaXB2NC0zMDBz
LTEtY3MtbG9jYWxob3N0LVNDVFBfUlItZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZf
NjQtcmhlbC02NjRlZjViODYxNWZmMTJiMDNiNDY5ODg0MDhiNGMwYTE1ZWFiMDdjLTIwMTYwMzE5
LTI1OTU5LXU4M284ai0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwK
LSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzE5MDUKLSBjb21taXQ9NjY0
ZWY1Yjg2MTVmZjEyYjAzYjQ2OTg4NDA4YjRjMGExNWVhYjA3YwotIEJPT1RfSU1BR0U9L3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzY2NGVmNWI4NjE1ZmYxMmIwM2I0Njk4ODQwOGI0YzBh
MTVlYWIwN2Mvdm1saW51ei00LjUuMC0wMTcyNy1nNjY0ZWY1YgotIG1heF91cHRpbWU9MTUwMAot
IFJFU1VMVF9ST09UPS9yZXN1bHQvbmV0cGVyZi9wZXJmb3JtYW5jZS1pcHY0LTMwMHMtMS1jcy1s
b2NhbGhvc3QtU0NUUF9SUi9sa3AtaHN3LWQwMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3g4Nl82NC1yaGVsL2djYy00LjkvNjY0ZWY1Yjg2MTVmZjEyYjAzYjQ2OTg4NDA4YjRjMGExNWVh
YjA3Yy8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIw
MCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19l
bmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0
bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNr
PTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2
Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9k
dWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNjY0ZWY1Yjg2MTVm
ZjEyYjAzYjQ2OTg4NDA4YjRjMGExNWVhYjA3Yy9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9i
ZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L25ldHBlcmYuY2d6LC9sa3AvYmVuY2htYXJrcy9uZXRwZXJmLmNneiIKbGludXhf
aGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNjY0ZWY1Yjg2
MTVmZjEyYjAzYjQ2OTg4NDA4YjRjMGExNWVhYjA3Yy9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0
X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82NjRlZjViODYx
NWZmMTJiMDNiNDY5ODg0MDhiNGMwYTE1ZWFiMDdjL3ZtbGludXotNC41LjAtMDE3MjctZzY2NGVm
NWIiCmRlcXVldWVfdGltZTogMjAxNi0wMy0xOSAxODoyMTowOS41NzM5NTc1NDcgKzA4OjAwCmpv
Yl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMC44OSAwLjY4IDAuMzEgMS8xNTIgNDc2MQpzdGFy
dF90aW1lOiAnMTQ1ODM4Mjg5NicKZW5kX3RpbWU6ICcxNDU4MzgzMjAxJwp2ZXJzaW9uOiAiL2xr
cC9sa3AvLnNyYy0yMDE2MDMxOC0xNTUwMTIiCg==

--===============3906331191670680977==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0xOSAxODoyMTozNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOSAxODoyMTozNSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOSAxODoyMTozNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xOSAxODoyMTozNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOSAxODoyMTozNSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0xOSAxODoyMTozNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOSAx
ODoyMTozNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOSAxODoyMTozNSBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0xOSAxODoyMTozNSBuZXRzZXJ2ZXIgLTQKMjAxNi0wMy0xOSAxODoyMTozNyBu
ZXRwZXJmIC00IC10IFNDVFBfUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMSAmCg==

--===============3906331191670680977==--

