Content-Type: multipart/mixed; boundary="===============0266212333955635971=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [regression] d7aa432ad5f: -5.6% will-it-scale.per_thread_ops
Date: Wed, 18 Mar 2015 16:08:28 +0800
Message-ID: <1426666108.5570.31.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0266212333955635971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://flatbed.openfabrics.org/~amirv/linux.git for-upstream
commit d7aa432ad5fa589c56a11bd7993cff05e9b87d05 ("regression: Disable FENTR=
Y [topic: regression] [net-next:regression]")


testbox/testcase/testparams: lkp-sb03/will-it-scale/poll2

5cd08c4aa1751f04  d7aa432ad5fa589c56a11bd799  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    650868 =C2=B1  0%      -2.9%     631737 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
    281122 =C2=B1  0%      -5.6%     265461 =C2=B1  0%  will-it-scale.per_t=
hread_ops
       153 =C2=B1  0%      -7.9%        141 =C2=B1  0%  will-it-scale.time.=
user_time
       118 =C2=B1  0%      +0.9%        119 =C2=B1  0%  turbostat.CorWatt
      2733 =C2=B1  3%     +12.2%       3066 =C2=B1  2%  proc-vmstat.nr_allo=
c_batch
      1319 =C2=B1  3%     +19.1%       1570 =C2=B1  5%  numa-vmstat.node0.n=
r_alloc_batch
      2250 =C2=B1  6%     -13.0%       1958 =C2=B1  5%  slabinfo.kmalloc-20=
48.active_objs
      2380 =C2=B1  6%     -13.2%       2066 =C2=B1  5%  slabinfo.kmalloc-20=
48.num_objs
     31.65 =C2=B1  0%     -92.2%       2.46 =C2=B1  7%  perf-profile.cpu-cy=
cles.fput.sys_poll.system_call_fastpath
     60.25 =C2=B1  0%     +46.7%      88.37 =C2=B1  5%  perf-profile.cpu-cy=
cles.do_sys_poll.sys_poll.system_call_fastpath
      3.57 =C2=B1  7%     -10.2%       3.21 =C2=B1  3%  perf-profile.cpu-cy=
cles.copy_user_generic_string.sys_poll.system_call_fastpath
      2.66 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__fdget.sys_poll.system_call_fastpath
      2.71 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__fget_light.do_sys_poll.sys_poll.system_call_fastpath
      0.00 =C2=B1  0%      +Inf%      33.68 =C2=B1  8%  perf-profile.cpu-cy=
cles.fput.do_sys_poll.sys_poll.system_call_fastpath
        25 =C2=B1 37%     -33.0%         16 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
     37159 =C2=B1  9%     +20.7%      44850 =C2=B1 16%  sched_debug.cfs_rq[=
24]:/.exec_clock
    830542 =C2=B1 10%     +18.8%     986752 =C2=B1 15%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     18120 =C2=B1  8%     -17.8%      14897 =C2=B1 19%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
       394 =C2=B1  8%     -17.8%        323 =C2=B1 19%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
        26 =C2=B1 43%     -36.2%         16 =C2=B1  4%  sched_debug.cpu#15.=
cpu_load[1]
        23 =C2=B1 30%     -28.3%         16 =C2=B1  5%  sched_debug.cpu#15.=
cpu_load[2]
      1564 =C2=B1 21%     +73.2%       2709 =C2=B1 47%  sched_debug.cpu#20.=
nr_switches
       617 =C2=B1 27%     +99.6%       1232 =C2=B1 48%  sched_debug.cpu#20.=
ttwu_count
      2164 =C2=B1 20%     -28.2%       1553 =C2=B1 35%  sched_debug.cpu#25.=
ttwu_count
      1902 =C2=B1 21%     -26.6%       1397 =C2=B1 36%  sched_debug.cpu#25.=
sched_goidle
      1947 =C2=B1 35%     -62.6%        728 =C2=B1 35%  sched_debug.cpu#26.=
ttwu_local
      5620 =C2=B1 23%     -41.6%       3282 =C2=B1 15%  sched_debug.cpu#26.=
nr_switches
      2595 =C2=B1 26%     -43.5%       1465 =C2=B1 19%  sched_debug.cpu#26.=
ttwu_count
       653 =C2=B1  9%     +76.3%       1151 =C2=B1 34%  sched_debug.cpu#31.=
ttwu_local
      1162 =C2=B1 10%     +34.5%       1563 =C2=B1 22%  sched_debug.cpu#31.=
sched_goidle
      2885 =C2=B1  9%     +34.5%       3880 =C2=B1 22%  sched_debug.cpu#31.=
nr_switches

lkp-sb03: Sandy Bridge-EP
Memory: 64G




        perf-profile.cpu-cycles.do_sys_poll.sys_poll.system_call_fastpath

  95 ++--------------------------------------------------------------------=
-+
     |  O  O        O  O  O  O  O     O  O O  O  O  O  O  O  O  O  O  O  O =
 |
  90 ++       O  O                 O                                       =
 |
  85 ++                                                                    =
 |
     O                                                                     =
 |
  80 ++                                                                    =
 O
     |                                                                     =
 |
  75 ++                                                                    =
 |
     |                                                                     =
 |
  70 ++                                                                    =
 |
  65 ++                                                                    =
 |
     |                                                                     =
 |
  60 *+.*..*..*..*..  .*..*..*..*..*..*..*.*..*..*..*..*..*..*..*          =
 |
     |              *.                                                     =
 |
  55 ++--------------------------------------------------------------------=
-+


     perf-profile.cpu-cycles.fput.do_sys_poll.sys_poll.system_call_fastpath

  37 ++--------------------------------------------------------------------=
-+
     |                                                          O          =
 |
  36 ++                                       O           O                =
 |
  35 ++                O  O  O  O     O  O O     O  O  O     O     O  O  O =
 |
     |     O  O     O                                                      =
 |
  34 ++ O                          O                                       =
 |
  33 ++          O                                                         =
 |
     |                                                                     =
 |
  32 ++                                                                    =
 |
  31 ++                                                                    =
 |
     |                                                                     =
 |
  30 O+                                                                    =
 |
  29 ++                                                                    =
 |
     |                                                                     =
 O
  28 ++--------------------------------------------------------------------=
-+


           perf-profile.cpu-cycles.fput.sys_poll.system_call_fastpath

  35 ++--------------------------------------------------------------------=
-+
     *..*..*..*..*..  .*..*..*..*..*..*..*.*..*..*..*..*..*..*..*          =
 |
  30 ++             *.                                                     =
 |
     |                                                                     =
 |
  25 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 ++                                                                    =
 |
     O  O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O =
 O
   0 ++--------------------------------------------------------------------=
-+


                            will-it-scale.per_thread_ops

  290000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  285000 ++                       *..*..                                   =
 |
         |                       :                                         =
 |
         *..*..*.*..*..  .*..*   :      *    *..*..*..*.*..  .*..*         =
 |
  280000 ++            *.     + :        +  :              *.              =
 |
         |                     *          + :                              =
 |
  275000 ++                                *                               =
 |
         |                                                                 =
 |
  270000 ++                                                                =
 |
         |                                                                 =
 |
         |                                 O    O     O    O  O  O  O    O =
 |
  265000 ++ O  O O     O     O O  O     O    O     O    O             O    =
 |
         O          O                O                                     =
 O
  260000 ++---------------O------------------------------------------------=
-+


  perf-profile.cpu-cycles.__fget_light.do_sys_poll.sys_poll.system_call_fas=
tpath

    3 ++-------------------------------------------------------------------=
-+
      *..  .*..*..*..*.. .*..*..*..*..  .*..*..*..  .*..*..*.*..*          =
 |
  2.5 ++ *.             *             *.          *.                       =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    2 ++                                                                   =
 |
      |                                                                    =
 |
  1.5 ++                                                                   =
 |
      |                                                                    =
 |
    1 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.5 ++                                                                   =
 |
      |                                                                    =
 |
    0 O+-O--O--O--O--O--O-O--O--O--O--O--O--O--O--O--O--O--O-O--O--O--O--O-=
-O


           perf-profile.cpu-cycles.__fdget.sys_poll.system_call_fastpath

    3 ++-------------------------------------------------------------------=
-+
      *..*..*..*..*..*..*.*..*..*..*..*..*..           .*..    .*          =
 |
  2.5 ++                                    *..*..*..*.    *.*.            =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    2 ++                                                                   =
 |
      |                                                                    =
 |
  1.5 ++                                                                   =
 |
      |                                                                    =
 |
    1 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.5 ++                                                                   =
 |
      |                                                                    =
 |
    0 O+-O--O--O--O--O--O-O--O--O--O--O--O--O--O--O--O--O--O-O--O--O--O--O-=
-O

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

--===============0266212333955635971==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1
cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZh
dWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5v
cjogCmNvbW1pdDogMmVkMmEwMjNhZTU0ZTk1YTA4MTY2OGI4YzNkYmI5N2JlYmZlM2FhNQptb2Rl
bDogU2FuZHkgQnJpZGdlLUVQCm1lbW9yeTogNjRHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNr
L2J5LWlkL2F0YS1XRENfV0QxMEVBUlMtMDBZNUIxX1dELVdDQVY1RjA1OTQ5OS1wYXJ0MyIKc3dh
cF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RD
X1dEMTBFQVJTLTAwWTVCMV9XRC1XQ0FWNUYwNTk0OTktcGFydDQiCnBlcmYtcHJvZmlsZToKICBm
cmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OiBwb2xsMgp0ZXN0Ym94OiBsa3Atc2IwMwp0
Ym94X2dyb3VwOiBsa3Atc2IwMwprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIw
MTUtMDMtMDkgMDA6MzU6NTkuMDA5MjQ2NTA1ICswODowMApoZWFkX2NvbW1pdDogMmVkMmEwMjNh
ZTU0ZTk1YTA4MTY2OGI4YzNkYmI5N2JlYmZlM2FhNQpiYXNlX2NvbW1pdDogMTNhN2E2YWMwYTEx
MTk3ZWRjZDBmNzU2YTAzNWY0NzJiNDJjZGY4YgpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhv
dXJseS0yMDE1MDMwOTA1Cmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvMmVkMmEwMjNhZTU0
ZTk1YTA4MTY2OGI4YzNkYmI5N2JlYmZlM2FhNS92bWxpbnV6LTQuMC4wLXJjMi0wMDk3Ny1nMmVk
MmEwMiIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9sa3Atc2IwMy93aWxsLWl0LXNjYWxlL3Bv
bGwyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvMmVkMmEwMjNhZTU0
ZTk1YTA4MTY2OGI4YzNkYmI5N2JlYmZlM2FhNS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVk
L2xrcC1zYjAzL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBvbGwyLXg4Nl82NC1yaGVsLUhFQUQtMmVk
MmEwMjNhZTU0ZTk1YTA4MTY2OGI4YzNkYmI5N2JlYmZlM2FhNS0wLTIwMTUwMzA5LTU4MDk4LTFj
amJieWgueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTAzLTA5IDA4OjEzOjAyLjc2OTU0NDY5OSAr
MDg6MDAKbnJfY3B1OiAiJChucHJvYykiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjEu
NTggMTEuOTUgNC44NSAxLzMwOSA5Nzk1CnN0YXJ0X3RpbWU6ICcxNDI1ODYwMDM1JwplbmRfdGlt
ZTogJzE0MjU4NjAzNDUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwMzA4LTE3NTc0NiIK

--===============0266212333955635971==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IHBvbGwyIDI1IGJvdGggMSA4IDE2IDI0IDMyCg==

--===============0266212333955635971==--

