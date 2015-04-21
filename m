Content-Type: multipart/mixed; boundary="===============2073564544945644742=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [PM / sleep] 38106313324: -48.0% turbostat.PkgWatt
Date: Tue, 21 Apr 2015 14:59:36 +0800
Message-ID: <1429599576.6769.7.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2073564544945644742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 3810631332465d967ba5e27ea2c7dff2c9afac6c ("PM / sleep: Re-implement =
suspend-to-idle handling")


testbox/testcase/testparams: lkp-sb03/suspend/300s-30x-freeze

18320f2a6871aaf2  3810631332465d967ba5e27ea2  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

       212 =C2=B1  5%     -23.3%        162 =C2=B1  6%  numa-vmstat.node1.n=
r_kernel_stack
      3418 =C2=B1  5%     -23.6%       2610 =C2=B1  6%  numa-meminfo.node1.=
KernelStack
  32165483 =C2=B1 26%     -31.3%   22108958 =C2=B1  7%  cpuidle.C1E-SNB.time
 9.401e+09 =C2=B1  1%     +36.4%  1.283e+10 =C2=B1  0%  cpuidle.C7-SNB.time
      1137 =C2=B1  3%      -7.0%       1057 =C2=B1  5%  slabinfo.blkdev_req=
uests.active_objs
      1137 =C2=B1  3%      -7.0%       1057 =C2=B1  5%  slabinfo.blkdev_req=
uests.num_objs
     50.02 =C2=B1  1%     -69.5%      15.26 =C2=B1  4%  turbostat.CPU%c1
     49.38 =C2=B1  1%     +70.5%      84.19 =C2=B1  0%  turbostat.CPU%c7
     12.77 =C2=B1  3%     -59.0%       5.24 =C2=B1  1%  turbostat.CorWatt
      7.83 =C2=B1 11%    +545.0%      50.49 =C2=B1  0%  turbostat.Pkg%pc6
     38.91 =C2=B1  1%     -48.0%      20.22 =C2=B1  0%  turbostat.PkgWatt
        90 =C2=B1 31%     -34.7%         58 =C2=B1 20%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
        20 =C2=B1 46%     -59.3%          8 =C2=B1 33%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
      4196 =C2=B1 31%     -34.6%       2745 =C2=B1 20%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
      3489 =C2=B1 38%     -33.2%       2329 =C2=B1 11%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
      2418 =C2=B1 43%     +54.7%       3741 =C2=B1 21%  sched_debug.cfs_rq[=
17]:/.avg->runnable_avg_sum
       447 =C2=B1 28%     +48.5%        663 =C2=B1 11%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
       434 =C2=B1 31%     +45.7%        633 =C2=B1 13%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
        51 =C2=B1 44%     +54.4%         79 =C2=B1 21%  sched_debug.cfs_rq[=
17]:/.tg_runnable_contrib
      9268 =C2=B1 26%     -45.4%       5056 =C2=B1 46%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      3653 =C2=B1 42%     +96.0%       7162 =C2=B1 13%  sched_debug.cfs_rq[=
24]:/.min_vruntime
      4355 =C2=B1 14%     +51.2%       6584 =C2=B1 22%  sched_debug.cfs_rq[=
25]:/.min_vruntime
         6 =C2=B1 36%     -55.6%          3 =C2=B1 40%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
       589 =C2=B1 10%     +24.4%        733 =C2=B1 12%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
       585 =C2=B1 10%     +24.1%        727 =C2=B1 11%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
      2484 =C2=B1 30%     +81.1%       4498 =C2=B1 20%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
        52 =C2=B1 30%     +83.9%         97 =C2=B1 20%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     14630 =C2=B1 41%     -56.5%       6370 =C2=B1 40%  sched_debug.cfs_rq[=
7]:/.min_vruntime
        58 =C2=B1  8%     -11.6%         51 =C2=B1  9%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
      2731 =C2=B1  8%     -12.1%       2402 =C2=B1  8%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     18774 =C2=B1 43%     -60.3%       7460 =C2=B1 21%  sched_debug.cpu#1.s=
ched_count
        16 =C2=B1  4%     -25.4%         12 =C2=B1 18%  sched_debug.cpu#10.=
cpu_load[3]
         9 =C2=B1  8%     -28.2%          7 =C2=B1 17%  sched_debug.cpu#10.=
cpu_load[4]
        32 =C2=B1 21%     -33.3%         21 =C2=B1 28%  sched_debug.cpu#13.=
cpu_load[1]
        28 =C2=B1  4%     -28.3%         20 =C2=B1 25%  sched_debug.cpu#13.=
cpu_load[2]
        29 =C2=B1 43%     -58.0%         12 =C2=B1 20%  sched_debug.cpu#14.=
cpu_load[3]
        36 =C2=B1 26%     -42.5%         21 =C2=B1 13%  sched_debug.cpu#14.=
cpu_load[1]
       215 =C2=B1 14%     +53.6%        330 =C2=B1  9%  sched_debug.cpu#14.=
curr->pid
        34 =C2=B1 31%     -47.8%         18 =C2=B1 18%  sched_debug.cpu#14.=
cpu_load[2]
      2431 =C2=B1  3%     +25.3%       3046 =C2=B1 20%  sched_debug.cpu#16.=
sched_count
      1440 =C2=B1 15%     +45.3%       2092 =C2=B1 34%  sched_debug.cpu#16.=
ttwu_count
      2233 =C2=B1  5%     +12.5%       2512 =C2=B1  7%  sched_debug.cpu#20.=
nr_switches
       826 =C2=B1 16%     +65.9%       1370 =C2=B1 31%  sched_debug.cpu#21.=
ttwu_count
       992 =C2=B1  6%     +18.0%       1170 =C2=B1  4%  sched_debug.cpu#23.=
sched_goidle
       308 =C2=B1 13%     +45.2%        448 =C2=B1 19%  sched_debug.cpu#23.=
ttwu_local
      2117 =C2=B1  5%     +14.6%       2426 =C2=B1  4%  sched_debug.cpu#23.=
sched_count
      2072 =C2=B1  6%     +14.6%       2373 =C2=B1  5%  sched_debug.cpu#23.=
nr_switches
         8 =C2=B1 44%     +61.8%         13 =C2=B1 10%  sched_debug.cpu#24.=
nr_uninterruptible
       800 =C2=B1 17%     -26.0%        592 =C2=B1  6%  sched_debug.cpu#28.=
sched_goidle
         5 =C2=B1 37%    +195.0%         14 =C2=B1 46%  sched_debug.cpu#30.=
cpu_load[1]
         9 =C2=B1 33%     +62.2%         15 =C2=B1 12%  sched_debug.cpu#31.=
cpu_load[2]
        28 =C2=B1 43%     +64.9%         47 =C2=B1 42%  sched_debug.cpu#8.c=
pu_load[1]
        17 =C2=B1  8%     -21.1%         14 =C2=B1 18%  sched_debug.cpu#9.c=
pu_load[3]

lkp-sb03: Sandy Bridge-EP
Memory: 64G




                                turbostat.CPU%c1

  60 ++--------------------------------------------------------------------=
-+
     |     .*..*                                                           =
 |
  50 *+*..*     +  .*.*..*.      .*..*.*..*.*..*.*..*.*.*..                =
 |
     |           *.        *.*..*                          *               =
 |
     |                                                                     =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |    O O    O  O O  O O           O       O O              O O  O O   =
 |
     O O       O             O  O         O O       O O O  O O            O=
 O
  10 ++                                                                    =
 |
     |                            O  O                                     =
 |
   0 ++--------------------------------------------------------------------=
-+


                                 turbostat.CPU%c7

  100 ++-------------------------------------------------------------------=
-+
      |                            O O                                     =
 |
   90 ++                                                                   =
 |
      O         O             O              O                             =
 |
      | O  O O    O O  O O  O    O      O O    O O  O O  O O  O O O  O O  O=
 O
   80 ++                                                                   =
 |
      |                                                                    =
 |
   70 ++                                                                   =
 |
      |                                                                    =
 |
   60 ++                                                                   =
 |
      |                                                                    =
 |
      |           *.       .*.  .*.                                        =
 |
   50 *+*..*.    +  *..*.*.   *.   *.  .*.*..*.*.*..*.*..*.*               =
 |
      |      *..*                    *.                                    =
 |
   40 ++-------------------------------------------------------------------=
-+


                                turbostat.Pkg%pc6

  55 ++---------------------------O----------------------------------------=
-+
  50 O+O  O O  O    O O  O O O  O    O O  O O  O O  O O O  O O  O O  O O  O=
 O
     |           O                                                         =
 |
  45 ++                                                                    =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  35 ++                                                                    =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
  15 ++                                                                    =
 |
     |          .*..           .*                                          =
 |
  10 *+  .*.*..*    *.  .*.*.*.  +    .*..*.*.. .*..*.*.*..*               =
 |
   5 ++*--------------*-----------*--*---------*---------------------------=
-+


                                turbostat.PkgWatt

  45 ++-----*--------------------------------------------------------------=
-+
     *.  .*    *                    .*.                                    =
 |
  40 ++*.       +           .*.. .*.   *..                                 =
 |
     |           *..*.*..*.*    *         *.*..*.*..*.*.*..*               =
 |
     |                                                                     =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  25 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                 O   =
 |
  20 O+O  O O  O O  O O  O O O  O O  O O  O O  O O  O O O  O O  O O  O    O=
 O
     |                                                                     =
 |
  15 ++--------------------------------------------------------------------=
-+


                                turbostat.CorWatt

  20 ++--------------------------------------------------------------------=
-+
     |     .*..                                                            =
 |
  18 ++   *                                                                =
 |
  16 *+ ..     *                     *.                                    =
 |
     | *        +                  ..  *..                                 =
 |
  14 ++          *.. .*..*.*.*..*.*             .*..*.    .*               =
 |
  12 ++             *                     *.*..*      *.*.                 =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
   8 ++                                                                    =
 |
     |                                                                     =
 |
   6 O+O  O O    O  O O  O O    O         O O  O O  O O O  O O  O    O O   =
 |
   4 ++        O             O       O O                          O       O=
 O
     |                            O                                        =
 |
   2 ++--------------------------------------------------------------------=
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


--===============2073564544945644742==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBzdXNwZW5kCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QK
ICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1h
LXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAK
ICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBs
YXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3Rh
dHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3Rh
dDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdh
dGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogCmNv
bW1pdDogMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2JhN2RiNmQ3YWU2ZWU3Ngptb2RlbDogU2Fu
ZHkgQnJpZGdlLUVQCm1lbW9yeTogNjRHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlk
L2F0YS1XRENfV0QxMEVBUlMtMDBZNUIxX1dELVdDQVY1RjA1OTQ5OS1wYXJ0MyIKc3dhcF9wYXJ0
aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTBF
QVJTLTAwWTVCMV9XRC1XQ0FWNUYwNTk0OTktcGFydDQiCnJ1bnRpbWU6IDMwMHMKaXRlcmF0aW9u
czogMzB4CnN1c3BlbmQ6CiAgbW9kZTogZnJlZXplCnRlc3Rib3g6IGxrcC1zYjAzCnRib3hfZ3Jv
dXA6IGxrcC1zYjAzCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wNC0x
MiAxODo1NToxNy45MTgzMDAxNTggKzA4OjAwCmhlYWRfY29tbWl0OiAzOWE4ODA0NDU1ZmIyM2Yw
OTE1NzM0MWQzYmE3ZGI2ZDdhZTZlZTc2CmJhc2VfY29tbWl0OiA0ZThhNDgzMGRjOWYwODgzZDUz
MDJiODcxYWRiOWU2MTc5MzM4ZDI0CmJyYW5jaDogbGludXMvbWFzdGVyCmtlcm5lbDogIi9rZXJu
ZWwveDg2XzY0LXJoZWwvMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2JhN2RiNmQ3YWU2ZWU3Ni92
bWxpbnV6LTQuMC4wIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6IGRlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2xrcC1zYjAzL3N1c3BlbmQv
MzAwcy0zMHgtZnJlZXplL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
MzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2JhN2RiNmQ3YWU2ZWU3Ni8wIgpMS1BfU0VSVkVSOiBp
bm4Kam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atc2IwMy9jeWNsaWNfc3VzcGVuZC0zMDBz
LTMweC1mcmVlemUteDg2XzY0LXJoZWwtSEVBRC0zOWE4ODA0NDU1ZmIyM2YwOTE1NzM0MWQzYmE3
ZGI2ZDdhZTZlZTc2LTAtMjAxNTA0MTItMTAxMDEzLXR0N28yZS55YW1sIgpkZXF1ZXVlX3RpbWU6
IDIwMTUtMDQtMTMgMTQ6MTE6NDIuMzA3NjEyMTkwICswODowMApucl9jcHU6ICIkKG5wcm9jKSIK
aW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJv
b3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9z
Y2hlZHVsZWQvbGtwLXNiMDMvY3ljbGljX3N1c3BlbmQtMzAwcy0zMHgtZnJlZXplLXg4Nl82NC1y
aGVsLUhFQUQtMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2JhN2RiNmQ3YWU2ZWU3Ni0wLTIwMTUw
NDEyLTEwMTAxMy10dDdvMmUueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhl
bAotIGJyYW5jaD1saW51cy9tYXN0ZXIKLSBjb21taXQ9MzlhODgwNDQ1NWZiMjNmMDkxNTczNDFk
M2JhN2RiNmQ3YWU2ZWU3NgotIEJPT1RfSU1BR0U9L2tlcm5lbC94ODZfNjQtcmhlbC8zOWE4ODA0
NDU1ZmIyM2YwOTE1NzM0MWQzYmE3ZGI2ZDdhZTZlZTc2L3ZtbGludXotNC4wLjAKLSBSRVNVTFRf
Uk9PVD0vcmVzdWx0L2xrcC1zYjAzL3N1c3BlbmQvMzAwcy0zMHgtZnJlZXplL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFkM2Jh
N2RiNmQ3YWU2ZWU3Ni8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0
eVMwLDExNTIwMCByZC51ZGV2LmxvZy1wcmlvcml0eT1lcnIgc3lzdGVtZC5sb2dfdGFyZ2V0PWpv
dXJuYWwgc3lzdGVtZC5sb2dfbGV2ZWw9d2FybmluZwogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFf
YWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmlj
PS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2Fk
X3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29s
ZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbWF4X3VwdGltZTogMTUwMApsa3BfaW5pdHJkOiAiL2xr
cC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL2tlcm5lbC94ODZfNjQtcmhl
bC8zOWE4ODA0NDU1ZmIyM2YwOTE1NzM0MWQzYmE3ZGI2ZDdhZTZlZTc2L21vZHVsZXMuY2d6Igpi
bV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtw
LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0
LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZAps
b2FkYXZnOiA2LjU0IDQuODggMi4xMyAxLzUwOSAyMjkxCnN0YXJ0X3RpbWU6ICcxNDI4OTA1NTU5
JwplbmRfdGltZTogJzE0Mjg5MDYwMTAnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwNDEz
LTEzMzczMiIK

--===============2073564544945644742==--

