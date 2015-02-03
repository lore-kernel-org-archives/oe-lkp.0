Content-Type: multipart/mixed; boundary="===============3915095252349435038=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [x86_64, entry] 103dd9885d1: +7.3% will-it-scale.per_process_ops
Date: Tue, 03 Feb 2015 15:47:48 +0800
Message-ID: <1422949668.13951.7.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3915095252349435038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry
commit 103dd9885d1e96be0c7493ce9a33af0732e35441 ("x86_64, entry: Use sysret=
 to return to userspace when possible")


testbox/testcase/testparams: lkp-sb03/will-it-scale/open2

261ebee6aee55a47  103dd9885d1e96be0c7493ce9a  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     35.96 =C2=B1  6%     -39.8%      21.66 =C2=B1  7%  will-it-scale.time.=
user_time
    237495 =C2=B1  1%      +5.2%     249861 =C2=B1  1%  will-it-scale.per_t=
hread_ops
    739981 =C2=B1  0%      +7.3%     793911 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
       127 =C2=B1 20%     -66.9%         42 =C2=B1 30%  sched_debug.cfs_rq[=
14]:/.load
       127 =C2=B1 20%     -66.9%         42 =C2=B1 30%  sched_debug.cpu#14.=
load
        58 =C2=B1 21%     -39.3%         35 =C2=B1 43%  sched_debug.cfs_rq[=
7]:/.load
        58 =C2=B1 21%     -39.3%         35 =C2=B1 43%  sched_debug.cpu#7.l=
oad
      3442 =C2=B1 25%     -42.5%       1978 =C2=B1 20%  sched_debug.cpu#28.=
sched_goidle
      3591 =C2=B1 36%    +128.5%       8204 =C2=B1 17%  sched_debug.cpu#10.=
ttwu_local
      8241 =C2=B1 21%     -36.9%       5202 =C2=B1 19%  sched_debug.cpu#28.=
nr_switches
      5411 =C2=B1 18%     -39.0%       3301 =C2=B1 13%  sched_debug.cpu#14.=
ttwu_local
      8800 =C2=B1 15%     -27.8%       6356 =C2=B1 20%  sched_debug.cpu#9.t=
twu_count
        42 =C2=B1 22%     -33.3%         28 =C2=B1 47%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
        67 =C2=B1 46%     +87.1%        126 =C2=B1 31%  sched_debug.cpu#12.=
load
    573932 =C2=B1  1%     +59.5%     915353 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_objs
      8970 =C2=B1  1%     +59.5%      14305 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_slabs
      8970 =C2=B1  1%     +59.5%      14305 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_slabs
    574152 =C2=B1  1%     +59.5%     915575 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
     35.96 =C2=B1  6%     -39.8%      21.66 =C2=B1  7%  time.user_time
      1358 =C2=B1 24%     -31.9%        924 =C2=B1 34%  sched_debug.cpu#31.=
ttwu_local
      2487 =C2=B1 14%     -32.6%       1677 =C2=B1  9%  sched_debug.cpu#31.=
sched_goidle
     17643 =C2=B1  8%     -33.6%      11719 =C2=B1  5%  sched_debug.cpu#14.=
nr_switches
      8632 =C2=B1 11%     -34.9%       5617 =C2=B1 14%  sched_debug.cpu#14.=
ttwu_count
        29 =C2=B1 12%     +31.9%         38 =C2=B1 15%  sched_debug.cpu#12.=
cpu_load[1]
    115453 =C2=B1  3%     +48.3%     171178 =C2=B1  2%  numa-meminfo.node0.=
SUnreclaim
     28672 =C2=B1  2%     +49.2%      42775 =C2=B1  2%  numa-vmstat.node0.n=
r_slab_unreclaimable
      3313 =C2=B1 15%     +35.0%       4472 =C2=B1 13%  sched_debug.cpu#11.=
curr->pid
    132090 =C2=B1  3%     +42.8%     188646 =C2=B1  2%  numa-meminfo.node0.=
Slab
    200693 =C2=B1  1%     +42.8%     286535 =C2=B1  0%  meminfo.SUnreclaim
     50431 =C2=B1  1%     +42.0%      71624 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
        26 =C2=B1 12%     +29.8%         33 =C2=B1 12%  sched_debug.cpu#12.=
cpu_load[4]
     20434 =C2=B1  2%     +38.4%      28286 =C2=B1  2%  numa-vmstat.node1.n=
r_slab_unreclaimable
     82040 =C2=B1  2%     +36.9%     112273 =C2=B1  2%  numa-meminfo.node1.=
SUnreclaim
     14623 =C2=B1 26%     +55.6%      22751 =C2=B1 12%  sched_debug.cpu#10.=
nr_switches
    235487 =C2=B1  1%     +36.5%     321407 =C2=B1  0%  meminfo.Slab
    842597 =C2=B1 20%     -30.2%     588471 =C2=B1 26%  sched_debug.cfs_rq[=
27]:/.min_vruntime
      6502 =C2=B1 25%     +54.2%      10028 =C2=B1 11%  sched_debug.cpu#10.=
sched_goidle
    100197 =C2=B1  2%     +29.4%     129675 =C2=B1  2%  numa-meminfo.node1.=
Slab
    237178 =C2=B1  1%     -23.2%     182260 =C2=B1  2%  softirqs.RCU
      7310 =C2=B1  4%     -26.2%       5397 =C2=B1  6%  sched_debug.cpu#14.=
sched_goidle
      6148 =C2=B1 12%     -22.7%       4751 =C2=B1 10%  sched_debug.cpu#31.=
nr_switches
     44905 =C2=B1 20%     -28.5%      32101 =C2=B1 25%  sched_debug.cfs_rq[=
27]:/.exec_clock
        32 =C2=B1  6%     +38.3%         44 =C2=B1 19%  sched_debug.cpu#1.c=
pu_load[0]
       139 =C2=B1 15%     -25.4%        104 =C2=B1 18%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
      3454 =C2=B1 14%     -17.7%       2844 =C2=B1  6%  sched_debug.cpu#31.=
curr->pid
       438 =C2=B1  8%     -11.5%        388 =C2=B1  5%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
        30 =C2=B1  1%     +11.6%         33 =C2=B1  6%  sched_debug.cpu#23.=
cpu_load[4]
     20115 =C2=B1  7%     -11.3%      17841 =C2=B1  6%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
        35 =C2=B1 11%     -19.0%         28 =C2=B1  9%  sched_debug.cpu#21.=
cpu_load[0]
        32 =C2=B1  6%     +31.2%         42 =C2=B1 19%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
        32 =C2=B1 11%     +27.1%         41 =C2=B1 10%  sched_debug.cpu#9.c=
pu_load[2]
        30 =C2=B1  1%      +9.9%         33 =C2=B1  6%  sched_debug.cpu#23.=
cpu_load[3]
       575 =C2=B1  5%     +12.4%        647 =C2=B1  6%  sched_debug.cfs_rq[=
23]:/.tg_runnable_contrib
     26412 =C2=B1  5%     +12.5%      29710 =C2=B1  6%  sched_debug.cfs_rq[=
23]:/.avg->runnable_avg_sum
        29 =C2=B1 18%     +33.6%         38 =C2=B1 14%  sched_debug.cpu#12.=
cpu_load[0]
        32 =C2=B1  5%     +32.1%         43 =C2=B1 17%  sched_debug.cpu#1.c=
pu_load[1]
        33 =C2=B1  6%     +26.3%         42 =C2=B1 16%  sched_debug.cpu#1.c=
pu_load[2]
    424232 =C2=B1  2%     +13.7%     482375 =C2=B1  1%  numa-meminfo.node0.=
MemUsed
      3558 =C2=B1  6%     +14.5%       4076 =C2=B1  3%  sched_debug.cpu#15.=
curr->pid
      1567 =C2=B1  0%      -9.3%       1422 =C2=B1  1%  vmstat.system.cs

testbox/testcase/testparams: lkp-sb03/will-it-scale/signal1

261ebee6aee55a47  103dd9885d1e96be0c7493ce9a  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

     40.59 =C2=B1  3%     -33.0%      27.21 =C2=B1  3%  will-it-scale.time.=
user_time
      0.11 =C2=B1  0%     -10.5%       0.10 =C2=B1  0%  will-it-scale.scala=
bility
    297467 =C2=B1  0%     +10.2%     327822 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    526508 =C2=B1  0%      +7.2%     564555 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      2527 =C2=B1 43%     -74.9%        633 =C2=B1 20%  sched_debug.cpu#24.=
ttwu_local
      3355 =C2=B1 33%     -66.8%       1113 =C2=B1 14%  sched_debug.cpu#24.=
ttwu_count
      6776 =C2=B1 38%     -61.6%       2601 =C2=B1 11%  sched_debug.cpu#24.=
nr_switches
        47 =C2=B1 44%     -59.6%         19 =C2=B1 12%  sched_debug.cfs_rq[=
10]:/.load
        48 =C2=B1 40%     -60.8%         19 =C2=B1 12%  sched_debug.cpu#10.=
load
       184 =C2=B1 33%     -63.1%         68 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
        80 =C2=B1 36%     +97.8%        158 =C2=B1 34%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
        98 =C2=B1 30%     +77.7%        175 =C2=B1 31%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
       215 =C2=B1 28%     -54.3%         98 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
       212 =C2=B1 32%     -60.7%         83 =C2=B1 39%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
       238 =C2=B1 34%     -56.0%        104 =C2=B1 35%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
      1175 =C2=B1 15%     +82.0%       2139 =C2=B1 36%  sched_debug.cpu#30.=
sched_goidle
     40.59 =C2=B1  3%     -33.0%      27.21 =C2=B1  3%  time.user_time
       183 =C2=B1 23%     -32.1%        124 =C2=B1 27%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
      3095 =C2=B1 11%     +81.1%       5606 =C2=B1 43%  sched_debug.cpu#30.=
nr_switches
        14 =C2=B1  5%     +39.7%         20 =C2=B1 19%  sched_debug.cpu#31.=
cpu_load[0]
      1296 =C2=B1 11%     +28.2%       1661 =C2=B1 15%  sched_debug.cpu#5.t=
twu_count
        43 =C2=B1  9%     +21.5%         52 =C2=B1 10%  sched_debug.cpu#0.c=
pu_load[0]
     59711 =C2=B1  0%     -11.8%      52641 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.exec_clock
        29 =C2=B1  0%     +13.8%         33 =C2=B1  7%  sched_debug.cpu#21.=
cpu_load[0]
        29 =C2=B1  6%     -12.6%         26 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
        30 =C2=B1  5%     -13.2%         26 =C2=B1  6%  sched_debug.cpu#5.l=
oad
        29 =C2=B1  1%     +12.0%         32 =C2=B1  6%  sched_debug.cpu#21.=
cpu_load[2]
        29 =C2=B1  0%     +14.7%         33 =C2=B1  6%  sched_debug.cpu#21.=
cpu_load[1]
        15 =C2=B1  2%     +24.6%         19 =C2=B1 18%  sched_debug.cpu#31.=
cpu_load[1]
        15 =C2=B1  2%     +19.7%         18 =C2=B1 15%  sched_debug.cpu#31.=
cpu_load[2]
        30 =C2=B1  5%     -12.4%         26 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.load
        29 =C2=B1  0%     +13.8%         33 =C2=B1  7%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
        29 =C2=B1  0%     +13.8%         33 =C2=B1  7%  sched_debug.cfs_rq[=
21]:/.load
        29 =C2=B1  0%     +13.8%         33 =C2=B1  7%  sched_debug.cpu#21.=
load

lkp-sb03: Sandy Bridge-EP
Memory: 64G




                          will-it-scale.time.user_time

  45 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  40 ++                            .*..     .*..                  .*..     =
 |
  35 *+.*..*..  .*..*      *..*..*.    *..*.    *..*..*..  ..*..*.    *..  =
.*
     |        *.    :      :                             *.              *.=
 |
  30 ++              :    :                                                =
 |
  25 ++              :    :                                                =
 |
     O  O  O  O  O  O:  O :O  O  O  O  O  O  O  O  O     O   O             =
 |
  20 ++               :   :                           O                    =
 |
  15 ++               :  :                                                 =
 |
     |                 : :                                                 =
 |
  10 ++                : :                                                 =
 |
   5 ++                : :                                                 =
 |
     |                  :                                                  =
 |
   0 ++-----------------*--------------------------------------------------=
-+


        [*] bisect-good sample
        [O] bisect-bad  sample

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


--===============3915095252349435038==
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
cjogCmNvbW1pdDogNjlkNjY4ZjIzNTY2NzBhYjZkNTllMTdjOTExYTIyMmQ5NTQ2ZjUwYgptb2Rl
bDogU2FuZHkgQnJpZGdlLUVQCm1lbW9yeTogNjRHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNr
L2J5LWlkL2F0YS1XRENfV0QxMEVBUlMtMDBZNUIxX1dELVdDQVY1RjA1OTQ5OS1wYXJ0MyIKc3dh
cF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RD
X1dEMTBFQVJTLTAwWTVCMV9XRC1XQ0FWNUYwNTk0OTktcGFydDQiCnBlcmYtcHJvZmlsZToKICBm
cmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OgogIC0gb3BlbjIKdGVzdGJveDogbGtwLXNi
MDMKdGJveF9ncm91cDogbGtwLXNiMDMKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1l
OiAyMDE1LTAxLTMxIDEyOjAyOjQ4LjIyMDMwODQwNCArMDg6MDAKaGVhZF9jb21taXQ6IDY5ZDY2
OGYyMzU2NjcwYWI2ZDU5ZTE3YzkxMWEyMjJkOTU0NmY1MGIKYmFzZV9jb21taXQ6IDI2YmM0MjBi
NTlhMzhlNGU2Njg1YTczMzQ1YTBkZWY0NjExMzZkY2UKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZl
bC1ob3VybHktMjAxNTAxMzEyMgprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsLzY5ZDY2OGYy
MzU2NjcwYWI2ZDU5ZTE3YzkxMWEyMjJkOTU0NmY1MGIvdm1saW51ei0zLjE5LjAtcmM2LWc2OWQ2
NjhmIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0w
MS0zMC5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2xrcC1zYjAzL3dpbGwtaXQtc2NhbGUvb3Bl
bjIvZGViaWFuLXg4Nl82NC0yMDE1LTAxLTMwLmNnei94ODZfNjQtcmhlbC82OWQ2NjhmMjM1NjY3
MGFiNmQ1OWUxN2M5MTFhMjIyZDk1NDZmNTBiLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQv
bGtwLXNiMDMvY3ljbGljX3dpbGwtaXQtc2NhbGUtb3BlbjIteDg2XzY0LXJoZWwtSEVBRC02OWQ2
NjhmMjM1NjY3MGFiNmQ1OWUxN2M5MTFhMjIyZDk1NDZmNTBiLTAueWFtbCIKZGVxdWV1ZV90aW1l
OiAyMDE1LTAyLTAxIDAwOjI2OjEzLjIzMzg4MDI2OSArMDg6MDAKbnJfY3B1OiAiJChucHJvYyki
CmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjIuMTYgMTIuNDYgNS4wOCAxLzI5NiAxMTIx
OQpzdGFydF90aW1lOiAnMTQyMjcyMTYxOScKZW5kX3RpbWU6ICcxNDIyNzIxOTI5Jwp2ZXJzaW9u
OiAiL2xrcC9sa3AvLnNyYy0yMDE1MDEzMS0wNzQxMTUiCg==

--===============3915095252349435038==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IG9wZW4yIDI1IGJvdGggMSA4IDE2IDI0IDMyCg==

--===============3915095252349435038==--

