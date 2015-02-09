Content-Type: multipart/mixed; boundary="===============3087778210929986200=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/core] 9edfbfed3f5: +88.2% hackbench.time.involuntary_context_switches
Date: Mon, 09 Feb 2015 13:58:33 +0800
Message-ID: <1423461513.5968.56.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3087778210929986200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
commit 9edfbfed3f544a7830d99b341f0c175995a02950 ("sched/core: Rework rq->cl=
ock update skips")


testbox/testcase/testparams: xps2/hackbench/performance-1600%-process-socket

cebde6d681aa45f9  9edfbfed3f544a7830d99b341f  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

   1839273 =C2=B1  6%     +88.2%    3462337 =C2=B1  4%  hackbench.time.invo=
luntary_context_switches
  41965851 =C2=B1  5%      +5.6%   44307403 =C2=B1  1%  hackbench.time.volu=
ntary_context_switches
       388 =C2=B1 39%     -58.6%        160 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
     12957 =C2=B1 14%     -60.5%       5117 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     30505 =C2=B1 14%     -57.7%      12905 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      2790 =C2=B1 24%     -65.4%        964 =C2=B1 32%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      2915 =C2=B1 23%     -62.2%       1101 =C2=B1 29%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
   1839273 =C2=B1  6%     +88.2%    3462337 =C2=B1  4%  time.involuntary_co=
ntext_switches
      1474 =C2=B1 28%     -61.7%        565 =C2=B1 43%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
     11830 =C2=B1 15%     +63.0%      19285 =C2=B1 11%  sched_debug.cpu#4.s=
ched_goidle
     19319 =C2=B1 29%     +91.1%      36913 =C2=B1  7%  sched_debug.cpu#3.s=
ched_goidle
      5899 =C2=B1 31%     -35.6%       3801 =C2=B1 11%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      5999 =C2=B1 30%     -34.5%       3929 =C2=B1 11%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
     37884 =C2=B1 13%     -33.5%      25207 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    229547 =C2=B1  5%     +47.9%     339519 =C2=B1  5%  cpuidle.C1-NHM.usage
     35712 =C2=B1  3%     +31.7%      47036 =C2=B1  9%  cpuidle.C3-NHM.usage
      5010 =C2=B1  9%     -29.0%       3556 =C2=B1 20%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      5139 =C2=B1  9%     -28.2%       3690 =C2=B1 19%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     49568 =C2=B1  6%     +24.8%      61867 =C2=B1  7%  sched_debug.cpu#1.s=
ched_goidle
     26369 =C2=B1 35%     -42.0%      15289 =C2=B1 29%  cpuidle.C6-NHM.usage
        18 =C2=B1 16%     +36.5%         25 =C2=B1  7%  sched_debug.cpu#4.n=
r_running
      1.41 =C2=B1 12%     -19.3%       1.14 =C2=B1 13%  perf-profile.cpu-cy=
cles.sock_wfree.unix_destruct_scm.skb_release_head_state.skb_release_all.co=
nsume_skb
        25 =C2=B1 15%     +28.7%         32 =C2=B1  9%  sched_debug.cpu#3.n=
r_running
      1.63 =C2=B1 11%     -18.0%       1.34 =C2=B1 12%  perf-profile.cpu-cy=
cles.unix_destruct_scm.skb_release_head_state.skb_release_all.consume_skb.u=
nix_stream_recvmsg
      0.57 =C2=B1  8%      +9.6%       0.62 =C2=B1  5%  turbostat.CPU%c1
       148 =C2=B1 11%     -16.7%        123 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.load
       109 =C2=B1  6%     +17.1%        128 =C2=B1  6%  sched_debug.cpu#6.c=
pu_load[0]
      2.41 =C2=B1  8%     -13.3%       2.09 =C2=B1 11%  perf-profile.cpu-cy=
cles.skb_release_head_state.skb_release_all.consume_skb.unix_stream_recvmsg=
.sock_aio_read
       147 =C2=B1 12%     -16.4%        123 =C2=B1  7%  sched_debug.cpu#1.l=
oad
       111 =C2=B1  5%     +15.4%        129 =C2=B1  5%  sched_debug.cpu#6.c=
pu_load[2]
       110 =C2=B1  5%     +14.9%        127 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
       112 =C2=B1  5%     +14.5%        128 =C2=B1  4%  sched_debug.cpu#6.c=
pu_load[3]
       113 =C2=B1  5%     +13.2%        128 =C2=B1  3%  sched_debug.cpu#6.c=
pu_load[4]
    789953 =C2=B1  2%     -10.8%     704528 =C2=B1  4%  sched_debug.cpu#3.a=
vg_idle
     15471 =C2=B1  5%      -7.7%      14278 =C2=B1  2%  sched_debug.cpu#5.c=
urr->pid
   2675106 =C2=B1 10%     +16.2%    3109411 =C2=B1  1%  sched_debug.cpu#4.n=
r_switches
   2675140 =C2=B1 10%     +16.2%    3109440 =C2=B1  1%  sched_debug.cpu#4.s=
ched_count
    155201 =C2=B1  5%     +14.6%     177901 =C2=B1  3%  softirqs.RCU
      8.64 =C2=B1  6%      -9.6%       7.82 =C2=B1  5%  perf-profile.cpu-cy=
cles.skb_release_all.consume_skb.unix_stream_recvmsg.sock_aio_read.sock_aio=
_read
   2658351 =C2=B1 11%     +13.7%    3021564 =C2=B1  2%  sched_debug.cpu#5.s=
ched_count
   2658326 =C2=B1 11%     +13.7%    3021539 =C2=B1  2%  sched_debug.cpu#5.n=
r_switches
     71443 =C2=B1  5%      +9.9%      78486 =C2=B1  0%  vmstat.system.cs
      8209 =C2=B1  5%      +7.3%       8805 =C2=B1  0%  vmstat.system.in

xps2: Nehalem
Memory: 4G

To reproduce:

        apt-get install ruby ruby-oj
        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
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


--===============3087778210929986200==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

dGJlbmNoX3NydiAmCnRiZW5jaCA0IDEyNy4wLjAuMQpraWxsYWxsIHRiZW5jaF9zcnYK

--===============3087778210929986200==
Content-Type: application/x-yaml
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB0YmVuY2gKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0
OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHRfd2F0
Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOiBwZXJm
b3JtYW5jZQpjb21taXQ6IDllZGZiZmVkM2Y1NDRhNzgzMGQ5OWIzNDFmMGMxNzU5OTVhMDI5NTAK
bW9kZWw6IEF0b20KbWVtb3J5OiA4RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9h
dGEtVE9TSElCQV9NSzgwNjFHU1lCXzIyRkhQME5HVC1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAK
cm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtVE9TSElCQV9NSzgwNjFHU1lC
XzIyRkhQME5HVC1wYXJ0MiIKbnJfdGhyZWFkczogMTAwJQpwZXJmLXByb2ZpbGU6IAp0YmVuY2g6
IAp0ZXN0Ym94OiBsa3AtYTA2CnRib3hfZ3JvdXA6IGxrcC1hMDYKa2NvbmZpZzogeDg2XzY0LXJo
ZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAyLTAyIDE3OjAzOjM2LjQ0MjkwODY3MiArMDg6MDAKaGVh
ZF9jb21taXQ6IDk1ZDE5NTEyYTE0NWNkNGUyNzhiOTBmZmQ2N2FmYWIwY2I3M2Q5ZTYKYmFzZV9j
b21taXQ6IDI2YmM0MjBiNTlhMzhlNGU2Njg1YTczMzQ1YTBkZWY0NjExMzZkY2UKYnJhbmNoOiBs
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTAyMDEyMgp1c2VyOiBsa3AKcXVldWU6IGJpc2Vj
dApyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMS0zMC5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVz
dWx0L2xrcC1hMDYvdGJlbmNoL3BlcmZvcm1hbmNlLTEwMCUvZGViaWFuLXg4Nl82NC0yMDE1LTAx
LTMwLmNnei94ODZfNjQtcmhlbC85ZWRmYmZlZDNmNTQ0YTc4MzBkOTliMzQxZjBjMTc1OTk1YTAy
OTUwLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLWEwNi9iaXNlY3RfdGJlbmNoLXBl
cmZvcm1hbmNlLTEwMCUtZGViaWFuLXg4Nl82NC0yMDE1LTAxLTMwLmNnei14ODZfNjQtcmhlbC05
ZWRmYmZlZDNmNTQ0YTc4MzBkOTliMzQxZjBjMTc1OTk1YTAyOTUwLTEueWFtbCIKbnJfY3B1OiAi
JChucHJvYykiCnJlcGVhdF90bzogMgprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsLzllZGZi
ZmVkM2Y1NDRhNzgzMGQ5OWIzNDFmMGMxNzU5OTVhMDI5NTAvdm1saW51ei0zLjE5LjAtcmMxLWc5
ZWRmYmZlIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDItMDIgMTc6MTk6MDcuMzQwNTExNTUxICswODow
MApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDIuOTkgNC44NyAzLjI0IDEvOTcgMTI1ODcK
c3RhcnRfdGltZTogJzE0MjI4Njg4MDgnCmVuZF90aW1lOiAnMTQyMjg2OTUyOScKdmVyc2lvbjog
Ii9sa3AvbGtwLy5zcmMtMjAxNTAyMDItMTMxMzI0Igo=

--===============3087778210929986200==--

