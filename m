Content-Type: multipart/mixed; boundary="===============7063326080447564826=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [vmstat] c3916839649: -63.9% will-it-scale.time.involuntary_context_switches, -17.6% will-it-scale.time.voluntary_context_switches, no primary result change
Date: Sun, 15 Feb 2015 15:55:19 +0800
Message-ID: <1423986919.5538.14.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7063326080447564826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit c3916839649ddb3c0d541ce346360c4197898d52 ("vmstat: do not use deferr=
able delayed work for vmstat_update")


testbox/testcase/testparams: wsm/will-it-scale/performance-malloc1

516245a5b8e7c56e  c3916839649ddb3c0d541ce346  =

----------------  --------------------------  =

      1213 =C2=B1  1%     -63.9%        438 =C2=B1  6%  will-it-scale.time.=
involuntary_context_switches
   2978260 =C2=B1  4%     -17.6%    2453255 =C2=B1  3%  will-it-scale.time.=
voluntary_context_switches
       242 =C2=B1  0%      +3.3%        250 =C2=B1  1%  will-it-scale.time.=
system_time
   1274586 =C2=B1  5%     -84.6%     196270 =C2=B1  2%  cpuidle.C6-NHM.usage
    140438 =C2=B1 18%     -72.4%      38803 =C2=B1 14%  cpuidle.C1-NHM.usage
     33943 =C2=B1  8%     -72.9%       9203 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.exec_clock
    114238 =C2=B1 19%     +72.3%     196836 =C2=B1 17%  sched_debug.cpu#4.t=
twu_local
    308423 =C2=B1 12%     -68.9%      95778 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    146477 =C2=B1 10%     +48.7%     217860 =C2=B1 17%  sched_debug.cpu#4.t=
twu_count
     64938 =C2=B1 16%     -26.8%      47543 =C2=B1  4%  sched_debug.cpu#0.t=
twu_count
  14242451 =C2=B1 14%     -65.4%    4921778 =C2=B1 15%  cpuidle.C1-NHM.time
        37 =C2=B1 14%     -52.7%         17 =C2=B1 31%  sched_debug.cpu#5.c=
pu_load[4]
      1213 =C2=B1  1%     -63.9%        438 =C2=B1  6%  time.involuntary_co=
ntext_switches
     61803 =C2=B1 13%     -25.4%      46093 =C2=B1  4%  sched_debug.cpu#0.s=
ched_goidle
        40 =C2=B1 13%     -52.8%         19 =C2=B1 33%  sched_debug.cpu#5.c=
pu_load[3]
        46 =C2=B1 17%     -52.2%         22 =C2=B1 39%  sched_debug.cpu#5.c=
pu_load[2]
        79 =C2=B1 10%     +59.3%        126 =C2=B1 32%  sched_debug.cpu#6.c=
pu_load[4]
        73 =C2=B1 10%     +54.9%        113 =C2=B1 33%  sched_debug.cpu#6.c=
pu_load[3]
     48956 =C2=B1  5%     -46.1%      26390 =C2=B1 12%  sched_debug.cpu#5.n=
r_load_updates
        54 =C2=B1 26%     -50.0%         27 =C2=B1 48%  sched_debug.cpu#5.c=
pu_load[1]
       327 =C2=B1 10%     -44.1%        182 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
     15032 =C2=B1 10%     -43.9%       8426 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
     32594 =C2=B1  9%     +78.4%      58157 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.exec_clock
    285793 =C2=B1 11%     +73.6%     496180 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.min_vruntime
        83 =C2=B1 15%     -30.4%         57 =C2=B1 11%  sched_debug.cpu#10.=
load
        29 =C2=B1 12%     +72.4%         50 =C2=B1  5%  sched_debug.cpu#11.=
cpu_load[4]
        31 =C2=B1  9%     +59.8%         50 =C2=B1  6%  sched_debug.cpu#11.=
cpu_load[3]
        48 =C2=B1 15%     +41.5%         69 =C2=B1 11%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
        68 =C2=B1 25%     +41.9%         96 =C2=B1 20%  sched_debug.cfs_rq[=
9]:/.load
        81 =C2=B1 17%     -26.5%         59 =C2=B1 12%  sched_debug.cfs_rq[=
10]:/.load
       521 =C2=B1  9%     +43.4%        748 =C2=B1  6%  cpuidle.POLL.usage
     14974 =C2=B1 12%     +46.0%      21864 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
       327 =C2=B1 12%     +45.8%        476 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
     58930 =C2=B1  6%     +41.2%      83196 =C2=B1  1%  sched_debug.cpu#11.=
nr_load_updates
      5326 =C2=B1 13%     -18.5%       4343 =C2=B1  4%  meminfo.AnonHugePag=
es
    222147 =C2=B1  7%     +47.1%     326809 =C2=B1 30%  sched_debug.cfs_rq[=
6]:/.spread0
    149897 =C2=B1 12%     +44.3%     216276 =C2=B1 17%  sched_debug.cpu#4.s=
ched_goidle
    127451 =C2=B1 13%     -24.2%      96598 =C2=B1  4%  sched_debug.cpu#0.n=
r_switches
    127599 =C2=B1 13%     -24.2%      96740 =C2=B1  4%  sched_debug.cpu#0.s=
ched_count
        36 =C2=B1  8%     +42.1%         51 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[2]
    301690 =C2=B1 12%     +43.9%     434016 =C2=B1 17%  sched_debug.cpu#4.n=
r_switches
    301787 =C2=B1 12%     +43.8%     434096 =C2=B1 17%  sched_debug.cpu#4.s=
ched_count
    116070 =C2=B1  3%     -25.4%      86585 =C2=B1  9%  sched_debug.cpu#11.=
ttwu_count
   1824349 =C2=B1  4%     +29.4%    2361351 =C2=B1  4%  cpuidle.C3-NHM.usage
     10615 =C2=B1 13%     -17.4%       8766 =C2=B1 13%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
       230 =C2=B1 13%     -17.4%        190 =C2=B1 13%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
        61 =C2=B1 14%     -19.4%         49 =C2=B1 12%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
     99092 =C2=B1 10%     -16.8%      82477 =C2=B1  0%  sched_debug.cpu#10.=
sched_goidle
      1175 =C2=B1 12%     +18.8%       1397 =C2=B1 11%  sched_debug.cpu#11.=
curr->pid
    199498 =C2=B1 10%     -16.9%     165794 =C2=B1  0%  sched_debug.cpu#10.=
sched_count
    199295 =C2=B1 10%     -16.9%     165611 =C2=B1  0%  sched_debug.cpu#10.=
nr_switches
    326090 =C2=B1 12%     -11.6%     288127 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.min_vruntime
 6.955e+08 =C2=B1  1%     +25.2%  8.707e+08 =C2=B1  1%  cpuidle.C3-NHM.time
   2978260 =C2=B1  4%     -17.6%    2453255 =C2=B1  3%  time.voluntary_cont=
ext_switches
  1.06e+08 =C2=B1  3%     -21.3%   83401246 =C2=B1  8%  cpuidle.C1E-NHM.time
    109454 =C2=B1  4%     -19.9%      87649 =C2=B1  8%  sched_debug.cpu#6.t=
twu_count
        48 =C2=B1  3%     +17.6%         56 =C2=B1 10%  sched_debug.cpu#9.c=
pu_load[2]
    139443 =C2=B1  5%     +15.4%     160850 =C2=B1  4%  proc-vmstat.thp_fau=
lt_alloc
    139441 =C2=B1  5%     +15.4%     160848 =C2=B1  4%  proc-vmstat.thp_spl=
it
    220724 =C2=B1  2%     -20.1%     176362 =C2=B1  9%  sched_debug.cpu#11.=
nr_switches
    220846 =C2=B1  2%     -20.1%     176481 =C2=B1  9%  sched_debug.cpu#11.=
sched_count
    109644 =C2=B1  2%     -20.0%      87693 =C2=B1  9%  sched_debug.cpu#11.=
sched_goidle
        46 =C2=B1  2%     +17.3%         54 =C2=B1  8%  sched_debug.cpu#9.c=
pu_load[3]
     79492 =C2=B1  1%     +12.9%      89782 =C2=B1  4%  softirqs.SCHED
    100431 =C2=B1  8%     -17.2%      83150 =C2=B1  9%  sched_debug.cpu#9.t=
twu_count
    726690 =C2=B1  2%     +11.9%     813169 =C2=B1  5%  sched_debug.cpu#4.a=
vg_idle
     91979 =C2=B1  0%     +12.9%     103877 =C2=B1 12%  sched_debug.cfs_rq[=
6]:/.exec_clock
    201606 =C2=B1  5%     -11.7%     177929 =C2=B1  5%  sched_debug.cpu#6.n=
r_switches
    201773 =C2=B1  5%     -11.7%     178108 =C2=B1  5%  sched_debug.cpu#6.s=
ched_count
    100423 =C2=B1  5%     -11.8%      88575 =C2=B1  5%  sched_debug.cpu#6.s=
ched_goidle
     40821 =C2=B1  2%     +15.8%      47259 =C2=B1  5%  softirqs.RCU
        44 =C2=B1  3%     +16.9%         52 =C2=B1  8%  sched_debug.cpu#9.c=
pu_load[4]
      9.56 =C2=B1  4%     -11.6%       8.45 =C2=B1  1%  time.user_time
    306985 =C2=B1 12%     -12.0%     270022 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.min_vruntime
 1.544e+09 =C2=B1  1%     -10.0%  1.389e+09 =C2=B1  0%  cpuidle.C6-NHM.time
    115366 =C2=B1  1%     +11.3%     128364 =C2=B1 10%  sched_debug.cpu#6.n=
r_load_updates
     22.81 =C2=B1  1%     +10.8%      25.26 =C2=B1  1%  turbostat.CPU%c3
     25858 =C2=B1  3%     -13.3%      22427 =C2=B1  2%  vmstat.system.cs

wsm: Westmere
Memory: 6G




                         time.involuntary_context_switches

  1300 ++------------------------------------------------------------------=
-+
  1200 *+*..      .*.                      .*.           .*.      .*.*.*..*=
.*
       |       .*.   *.*.*..*.*.*..   .*..*   *.*..*.*.*.   *.*..*         =
 |
  1100 ++   *.*                    *.*                                     =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   900 ++                                                                  =
 |
   800 ++                                                                  =
 |
   700 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
   500 ++   O   O                         O                                =
 |
       O      O    O O O    O   O    O O    O O O    O                     =
 |
   400 ++O               O    O    O               O                       =
 |
   300 ++------------------------------------------------------------------=
-+


                                  cpuidle.C3-NHM.time

  9.5e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    9e+08 ++                             O                                 =
 |
          O      O O O      O   O O        O   O      O                    =
 |
          | O O        O O    O     O  O     O    O O                      =
 |
  8.5e+08 ++                                                               =
 |
          |                                                                =
 |
    8e+08 ++                                                               =
 |
          |                                                                =
 |
  7.5e+08 ++                                                               =
 |
          |                .*   *.*.    .*.           *.                   =
 |
          |     .*.*   *.*.  + +    *..*   *.*.      +  *                  =
 |
    7e+08 *+ .*.    + +       *                *..*.*    +  .*.*.*. .*..*. =
.*
          | *        *                                    *.       *      *=
 |
  6.5e+08 ++---------------------------------------------------------------=
-+


                                  cpuidle.C6-NHM.time

   1.6e+09 ++--------------------------------------------------------------=
-+
           |                   *.                          *.             *=
 |
           |.*.*..  *.*.      :  *    .*       .*   *     :  *.*.         :=
:|
  1.55e+09 *+      +    *.    :   :  *  +    .*  + + +    :      *.*..*  : =
:|
           |      *       *. :    : +    *..*     *   *..*             + : =
 *
           |                *      *                                    *  =
 |
   1.5e+09 ++                                                              =
 |
           |                                                               =
 |
  1.45e+09 ++                                                              =
 |
           |                                                               =
 |
           | O                       O                                     =
 |
   1.4e+09 ++           O                           O                      =
 |
           O   O          O O  O O     O      O O O   O                    =
 |
           |      O O O            O        O                              =
 |
  1.35e+09 ++----------------------------O---------------------------------=
-+


                                 cpuidle.C6-NHM.usage

  1.4e+06 ++--------------------------------------------------------------*=
-+
          *.*.       *.*                         .*                    .*  =
 *
  1.2e+06 ++  *..*. +   +  .*.*. .*.  .*.     .*.  + .*.*.  .*.*. .*.*.    =
 |
          |        *     *.     *   *.   *.*.*      *     *.     *         =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 O+O O  O O O O O  O O O O O  O O O O O  O O O                    =
 |
          |                                                                =
 |
        0 ++---------------------------------------------------------------=
-+


                  will-it-scale.time.involuntary_context_switches

  1300 ++------------------------------------------------------------------=
-+
  1200 *+*..      .*.                      .*.           .*.      .*.*.*..*=
.*
       |       .*.   *.*.*..*.*.*..   .*..*   *.*..*.*.*.   *.*..*         =
 |
  1100 ++   *.*                    *.*                                     =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   900 ++                                                                  =
 |
   800 ++                                                                  =
 |
   700 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
   500 ++   O   O                         O                                =
 |
       O      O    O O O    O   O    O O    O O O    O                     =
 |
   400 ++O               O    O    O               O                       =
 |
   300 ++------------------------------------------------------------------=
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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============7063326080447564826==
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
cjogcGVyZm9ybWFuY2UKY29tbWl0OiA3NDk2YWQ2NzJkMGVkNzE3N2ZlZmVjOWM3MGVjZThhNzBi
YmQyZGMxCm1vZGVsOiBXZXN0bWVyZQptZW1vcnk6IDZHCm5yX2hkZF9wYXJ0aXRpb25zOiAxCmhk
ZF9wYXJ0aXRpb25zOiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCm5ldGNv
bnNvbGVfcG9ydDogNjY2NwpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6
CiAgdGVzdDogbWFsbG9jMQp0ZXN0Ym94OiB3c20KdGJveF9ncm91cDogd3NtCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wMi0xMiAwNzoyNTowOC45MzU5MjY1MDQgKzA4
OjAwCmhlYWRfY29tbWl0OiA3NDk2YWQ2NzJkMGVkNzE3N2ZlZmVjOWM3MGVjZThhNzBiYmQyZGMx
CmJhc2VfY29tbWl0OiBiZmE3NmQ0OTU3NjU5OWE0YjlmOWI3YTcxZjIzZDczZDZkY2ZmNzM1CmJy
YW5jaDogbmV4dC9tYXN0ZXIKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC83NDk2YWQ2NzJk
MGVkNzE3N2ZlZmVjOWM3MGVjZThhNzBiYmQyZGMxL3ZtbGludXotMy4xOS4wLW5leHQtMjAxNTAy
MTItZzc0OTZhZDYiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvd3NtL3dpbGwtaXQtc2NhbGUv
cGVyZm9ybWFuY2UtbWFsbG9jMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1y
aGVsLzc0OTZhZDY3MmQwZWQ3MTc3ZmVmZWM5YzcwZWNlOGE3MGJiZDJkYzEvMCIKam9iX2ZpbGU6
ICIvbGtwL3NjaGVkdWxlZC93c20vY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtbWFs
bG9jMS14ODZfNjQtcmhlbC1IRUFELTc0OTZhZDY3MmQwZWQ3MTc3ZmVmZWM5YzcwZWNlOGE3MGJi
ZDJkYzEtMC0yMDE1MDIxMi0zMTQ0MC1peDlwYTEueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTAy
LTEyIDE2OjM1OjQ1Ljc3ODI2ODc3MSArMDg6MDAKbnJfY3B1OiAiJChucHJvYykiCmpvYl9zdGF0
ZTogZmluaXNoZWQKbG9hZGF2ZzogOC4zNyA0LjkxIDIuMDIgMS8xNTggNTYyOQpzdGFydF90aW1l
OiAnMTQyMzczMDE2OScKZW5kX3RpbWU6ICcxNDIzNzMwNDc0Jwp2ZXJzaW9uOiAiL2xrcC9sa3Av
LnNyYy0yMDE1MDIxMi0xNjI0MDgiCg==

--===============7063326080447564826==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IG1hbGxvYzEgMzIgYm90aCAxIDYgOSAxMgo=

--===============7063326080447564826==--

