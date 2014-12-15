Content-Type: multipart/mixed; boundary="===============2947105997348799018=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched] 05bfb65f52c: -5.2% thrulay.throughput
Date: Mon, 15 Dec 2014 14:55:46 +0800
Message-ID: <1418626546.5745.183.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2947105997348799018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 05bfb65f52cbdabe26ebb629959416a6cffb034d ("sched: Remove a wake_affi=
ne() condition")


testbox/testcase/testparams: ivb42/thrulay/performance-300s

afdeee0510db918b  05bfb65f52cbdabe26ebb62995  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     37071 =C2=B1  1%      -5.2%      35155 =C2=B1  1%  thrulay.throughput
         9 =C2=B1 39%    +294.4%         35 =C2=B1 45%  sched_debug.cpu#41.=
cpu_load[4]
       127 =C2=B1 43%    +199.0%        380 =C2=B1 33%  sched_debug.cpu#30.=
curr->pid
     89726 =C2=B1 35%    +249.9%     313930 =C2=B1 40%  sched_debug.cpu#12.=
sched_goidle
    180377 =C2=B1 34%    +248.9%     629297 =C2=B1 40%  sched_debug.cpu#12.=
nr_switches
    186401 =C2=B1 33%    +239.4%     632605 =C2=B1 39%  sched_debug.cpu#12.=
sched_count
       467 =C2=B1  9%     -51.9%        224 =C2=B1 46%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
        73 =C2=B1 13%     -58.6%         30 =C2=B1 41%  sched_debug.cpu#2.c=
pu_load[1]
        97 =C2=B1 28%     -59.1%         39 =C2=B1 47%  sched_debug.cpu#11.=
load
        30 =C2=B1 45%     +86.1%         56 =C2=B1 26%  sched_debug.cpu#9.c=
pu_load[2]
       122 =C2=B1 37%     -50.9%         60 =C2=B1 46%  sched_debug.cpu#1.c=
pu_load[1]
        16 =C2=B1 38%    +100.0%         32 =C2=B1 31%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
       782 =C2=B1 34%     +93.8%       1517 =C2=B1 29%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
       445 =C2=B1 31%     -43.3%        252 =C2=B1 35%  sched_debug.cpu#11.=
curr->pid
      5983 =C2=B1 11%    +106.3%      12342 =C2=B1 12%  sched_debug.cfs_rq[=
12]:/.exec_clock
        53 =C2=B1 24%     -38.5%         32 =C2=B1 21%  sched_debug.cpu#27.=
load
      1636 =C2=B1 24%     -42.9%        934 =C2=B1 22%  sched_debug.cpu#15.=
curr->pid
       285 =C2=B1 48%     -44.8%        157 =C2=B1 33%  sched_debug.cpu#26.=
curr->pid
      8138 =C2=B1  9%     +96.5%      15989 =C2=B1 11%  sched_debug.cfs_rq[=
12]:/.min_vruntime
       174 =C2=B1 26%     -46.4%         93 =C2=B1 25%  sched_debug.cpu#15.=
load
        55 =C2=B1 39%     +49.8%         82 =C2=B1 28%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
        47 =C2=B1 22%     +82.1%         86 =C2=B1 28%  sched_debug.cpu#6.c=
pu_load[2]
        26 =C2=B1 22%     -45.3%         14 =C2=B1 28%  numa-numastat.node1=
.other_node
        90 =C2=B1 24%     -39.7%         54 =C2=B1 19%  sched_debug.cpu#2.c=
pu_load[3]
        24 =C2=B1 37%     +76.5%         43 =C2=B1  6%  sched_debug.cpu#32.=
cpu_load[4]
    107188 =C2=B1 22%     +46.3%     156809 =C2=B1 18%  sched_debug.cpu#32.=
sched_count
       409 =C2=B1 12%     +54.5%        633 =C2=B1 34%  sched_debug.cpu#11.=
ttwu_local
       131 =C2=B1 27%     -43.5%         74 =C2=B1 39%  sched_debug.cpu#1.c=
pu_load[2]
       247 =C2=B1 32%     +64.1%        406 =C2=B1 29%  sched_debug.cpu#2.c=
urr->pid
        89 =C2=B1 29%     -55.3%         39 =C2=B1 47%  sched_debug.cfs_rq[=
11]:/.load
        83 =C2=B1 16%     -50.7%         41 =C2=B1 26%  sched_debug.cpu#2.c=
pu_load[2]
    194662 =C2=B1 18%     +49.5%     290986 =C2=B1 10%  sched_debug.cpu#8.s=
ched_count
        24 =C2=B1 22%     +75.5%         43 =C2=B1 25%  sched_debug.cpu#31.=
cpu_load[1]
        28 =C2=B1 46%     +57.5%         44 =C2=B1 15%  sched_debug.cpu#29.=
cpu_load[4]
     70637 =C2=B1 23%     +34.4%      94908 =C2=B1 17%  sched_debug.cpu#27.=
ttwu_count
        26 =C2=B1 40%     +62.5%         42 =C2=B1 15%  sched_debug.cpu#32.=
cpu_load[3]
        65 =C2=B1 20%     -30.2%         45 =C2=B1 19%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
      3044 =C2=B1 20%     -29.7%       2139 =C2=B1 19%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
        28 =C2=B1  6%     -33.0%         19 =C2=B1 16%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
      1357 =C2=B1  6%     -32.5%        915 =C2=B1 17%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
       277 =C2=B1 14%     -38.6%        170 =C2=B1 18%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
       279 =C2=B1 14%     -39.1%        170 =C2=B1 18%  sched_debug.cfs_rq[=
40]:/.load
    575205 =C2=B1 11%     +29.6%     745663 =C2=B1 10%  sched_debug.cpu#11.=
avg_idle
    151626 =C2=B1 19%     +17.5%     178195 =C2=B1 13%  sched_debug.cpu#3.t=
twu_count
    349553 =C2=B1  6%     +33.4%     466210 =C2=B1 11%  sched_debug.cpu#0.t=
twu_count
       133 =C2=B1  5%     -29.6%         94 =C2=B1 26%  sched_debug.cpu#40.=
cpu_load[3]
      3767 =C2=B1 16%     -28.8%       2680 =C2=B1 15%  sched_debug.cpu#40.=
curr->pid
       279 =C2=B1 14%     -25.3%        209 =C2=B1  9%  sched_debug.cpu#40.=
load
        39 =C2=B1  8%     -24.7%         29 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
      1855 =C2=B1  7%     -24.0%       1410 =C2=B1  6%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
       309 =C2=B1  7%     -32.9%        207 =C2=B1 20%  sched_debug.cpu#40.=
cpu_load[0]
       213 =C2=B1  5%     -32.4%        144 =C2=B1 22%  sched_debug.cpu#40.=
cpu_load[2]
    602662 =C2=B1 11%     +20.9%     728740 =C2=B1  7%  sched_debug.cpu#30.=
avg_idle
     84865 =C2=B1 16%     +26.5%     107350 =C2=B1  8%  sched_debug.cpu#26.=
ttwu_count
       285 =C2=B1  6%     -34.0%        188 =C2=B1 20%  sched_debug.cpu#40.=
cpu_load[1]
    178498 =C2=B1 12%     +21.2%     216368 =C2=B1 12%  sched_debug.cpu#2.t=
twu_count
      5368 =C2=B1  9%     +14.5%       6147 =C2=B1  9%  sched_debug.cfs_rq[=
28]:/.exec_clock
    229046 =C2=B1  6%     -10.9%     204016 =C2=B1  7%  sched_debug.cpu#8.t=
twu_count
    716125 =C2=B1  9%     +22.4%     876793 =C2=B1  4%  sched_debug.cpu#14.=
avg_idle
       921 =C2=B1  4%     +15.3%       1062 =C2=B1  5%  sched_debug.cpu#25.=
ttwu_local
    628697 =C2=B1 12%     +22.5%     769882 =C2=B1  8%  sched_debug.cpu#1.a=
vg_idle
    123795 =C2=B1  7%     -13.6%     106992 =C2=B1  9%  sched_debug.cpu#32.=
ttwu_count
     10875 =C2=B1  4%     -16.5%       9083 =C2=B1  8%  sched_debug.cfs_rq[=
35]:/.min_vruntime
      5103 =C2=B1  9%     -16.2%       4277 =C2=B1 10%  sched_debug.cfs_rq[=
40]:/.min_vruntime
        86 =C2=B1  6%     -13.7%         74 =C2=B1 11%  sched_debug.cpu#44.=
ttwu_local
    538474 =C2=B1 13%     +27.6%     686910 =C2=B1  7%  sched_debug.cpu#15.=
avg_idle
       223 =C2=B1  4%     +16.4%        260 =C2=B1  6%  sched_debug.cpu#28.=
ttwu_local
     33784 =C2=B1  5%     -15.1%      28679 =C2=B1 11%  cpuidle.C1E-IVT.usa=
ge
      2764 =C2=B1  6%     -20.6%       2193 =C2=B1 20%  sched_debug.cfs_rq[=
20]:/.min_vruntime
       681 =C2=B1 19%     -19.1%        551 =C2=B1  6%  cpuidle.POLL.usage
     18925 =C2=B1  9%     +15.6%      21877 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.exec_clock
    559454 =C2=B1 13%     +21.3%     678413 =C2=B1  6%  sched_debug.cpu#27.=
avg_idle
     49536 =C2=B1  3%     -10.2%      44495 =C2=B1  1%  sched_debug.cpu#15.=
nr_load_updates
     17570 =C2=B1  6%     -17.5%      14492 =C2=B1 10%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     57206 =C2=B1  1%      -7.6%      52840 =C2=B1  2%  sched_debug.cpu#7.n=
r_load_updates
     51547 =C2=B1  1%      -8.0%      47418 =C2=B1  3%  sched_debug.cpu#26.=
nr_load_updates
     43519 =C2=B1  1%      -9.2%      39535 =C2=B1  1%  sched_debug.cpu#43.=
nr_load_updates
     50591 =C2=B1  1%      -8.6%      46252 =C2=B1  2%  sched_debug.cpu#35.=
nr_load_updates
     45642 =C2=B1  1%     -10.1%      41051 =C2=B1  2%  sched_debug.cpu#23.=
nr_load_updates
     46023 =C2=B1  2%      -9.0%      41872 =C2=B1  1%  sched_debug.cpu#19.=
nr_load_updates
      3.42 =C2=B1  1%      +9.8%       3.75 =C2=B1  2%  turbostat.RAM_W
     58859 =C2=B1  3%      +5.9%      62353 =C2=B1  1%  vmstat.system.cs
       269 =C2=B1  2%      +3.8%        279 =C2=B1  0%  time.system_time
        93 =C2=B1  1%      +3.5%         96 =C2=B1  0%  time.percent_of_cpu=
_this_job_got

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G




                                 thrulay.throughput

  44000 ++-*---------------------------------------------------------------=
-+
        |..:                                                               =
 |
  42000 *+  :       .*..*.     .*.                                         =
 |
        |   :   *.*.      *..*.   *..*                                     =
 |
        |    :..                      +      *.                            =
 |
  40000 ++   *                         *..  +  *..        *                =
 |
        |                                  +      *.*.. .. :               =
 |
  38000 ++                                *            *   :  .*..         =
 |
        |                                                   *.     .*..*.* =
 |
  36000 ++                                             O          *        =
 |
        |                                           O     O O       O    O =
 O
        O  O O  O    O  O       O      O  O    O               O  O        =
 |
  34000 ++        O       O                  O    O                    O   =
 |
        |                         O  O                                     =
 |
  32000 ++-------------------O---------------------------------------------=
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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============2947105997348799018==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB0aHJ1bGF5CmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QK
ICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1h
LXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAK
ICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBs
YXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3Rh
dHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRfZGVidWc6
CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3YXRjaC1v
b206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpjb21taXQ6
IGIyNzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQKbW9kZWw6IEl2eXRvd24g
SXZ5IEJyaWRnZS1FUApucl9jcHU6IDQ4Cm1lbW9yeTogNjRHCnJvb3RmczogZGViaWFuLXg4Nl82
NC5jZ3oKcnVudGltZTogMzAwcwp0aHJ1bGF5OiAKdGVzdGJveDogaXZiNDIKdGJveF9ncm91cDog
aXZiNDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE0LTEyLTA4IDA1OjE4
OjE3LjE1MTAzODI3MiArMDg6MDAKaGVhZF9jb21taXQ6IGQyNzNjMzE5M2I5NjZlNmVjZGM1OTQ4
YjNkODZlZmI4NTE0ZWUzMzUKYmFzZV9jb21taXQ6IDAwOWQwNDMxYzM5MTRkZTY0NjY2YmVjMGQz
NTBlNTRmZGQ1OWRmNmEKYnJhbmNoOiBpbnRlcm5hbC1leXdhL21hc3RlcgprZXJuZWw6ICIva2Vy
bmVsL3g4Nl82NC1yaGVsL2IyNzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQv
dm1saW51ei0zLjE4LjAtZ2IyNzc2YmYiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJlc3VsdF9y
b290OiAiL3Jlc3VsdC9pdmI0Mi90aHJ1bGF5L3BlcmZvcm1hbmNlLTMwMHMvZGViaWFuLXg4Nl82
NC5jZ3oveDg2XzY0LXJoZWwvYjI3NzZiZjcxNDliZGRkMWY0MTYxZjE0Zjc5NTIwZjE3ZmMxZDcx
ZC8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2l2YjQyL2N5Y2xpY190aHJ1bGF5LXBlcmZv
cm1hbmNlLTMwMHMtZGViaWFuLXg4Nl82NC5jZ3oteDg2XzY0LXJoZWwtQkFTRS1iMjc3NmJmNzE0
OWJkZGQxZjQxNjFmMTRmNzk1MjBmMTdmYzFkNzFkLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0
LTEyLTA5IDA5OjE2OjA0LjQ2NTUzMzYzMCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiAxLjExIDAuODkgMC40MiAxLzQxMCAxMDE1OQpzdGFydF90aW1lOiAnMTQxODA4NzgwMScK
ZW5kX3RpbWU6ICcxNDE4MDg4MTAyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTIwNi0w
NjAyMTkiCg==

--===============2947105997348799018==
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
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgp0aHJ1bGF5ZAp0aHJ1bGF5IC10IDMwMCAxMjcuMC4wLjEK

--===============2947105997348799018==--

