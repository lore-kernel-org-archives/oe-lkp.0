Content-Type: multipart/mixed; boundary="===============1284278920313517365=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [rcu] 00f5159aeb6: +55.3% will-it-scale.time.involuntary_context_switches
Date: Wed, 21 Jan 2015 15:32:44 +0800
Message-ID: <1421825564.6126.29.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1284278920313517365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git stall.2=
015.01.06a
commit 00f5159aeb68f08ce29597be86be87d6db0c1ba1 ("rcu: Run grace-period kth=
reads at real-time priority")


testbox/testcase/testparams: lkp-a03/will-it-scale/performance-lock1

e3663b1024d1f946  00f5159aeb68f08ce29597be86  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     11321 =C2=B1  5%     +55.3%      17582 =C2=B1 14%  will-it-scale.time.=
involuntary_context_switches
     28999 =C2=B1 44%    +109.3%      60700 =C2=B1 25%  sched_debug.cpu#1.t=
twu_count
     58384 =C2=B1 44%    +103.6%     118851 =C2=B1 24%  sched_debug.cpu#1.n=
r_switches
     26144 =C2=B1 48%     +90.3%      49762 =C2=B1 26%  sched_debug.cpu#1.s=
ched_goidle
       827 =C2=B1 34%     -57.3%        353 =C2=B1 21%  cpuidle.C2-ATM.usage
     58976 =C2=B1 43%    +103.0%     119712 =C2=B1 24%  sched_debug.cpu#1.s=
ched_count
       503 =C2=B1 29%     -56.5%        219 =C2=B1 27%  cpuidle.C4-ATM.usage
     11321 =C2=B1  5%     +55.3%      17582 =C2=B1 14%  time.involuntary_co=
ntext_switches
       156 =C2=B1 14%     -29.6%        110 =C2=B1 19%  cpuidle.POLL.usage
     50583 =C2=B1  2%     -21.7%      39630 =C2=B1  4%  cpuidle.C6-ATM.usage
  51597156 =C2=B1  2%     +23.7%   63848564 =C2=B1  3%  cpuidle.C1E-ATM.time
     39349 =C2=B1  2%     -12.0%      34622 =C2=B1  2%  softirqs.SCHED
    758790 =C2=B1  8%     -15.3%     642336 =C2=B1 12%  sched_debug.cpu#2.s=
ched_count
    378981 =C2=B1  8%     -15.6%     319776 =C2=B1 12%  sched_debug.cpu#2.t=
twu_count
    374440 =C2=B1  8%     -15.5%     316513 =C2=B1 12%  sched_debug.cpu#2.t=
twu_local
      5307 =C2=B1  0%      -1.0%       5255 =C2=B1  0%  vmstat.system.in

testbox/testcase/testparams: wsm/will-it-scale/performance-open2

e3663b1024d1f946  00f5159aeb68f08ce29597be86  =

----------------  --------------------------  =

     22128 =C2=B1  3%    +120.2%      48719 =C2=B1  8%  will-it-scale.time.=
involuntary_context_switches
      5577 =C2=B1 45%   +1492.2%      88802 =C2=B1 33%  sched_debug.cpu#6.s=
ched_count
      5457 =C2=B1 46%   +1526.2%      88751 =C2=B1 33%  sched_debug.cpu#6.n=
r_switches
      0.45 =C2=B1 43%     -73.3%       0.12 =C2=B1 15%  turbostat.%c3
        10 =C2=B1 24%     -55.8%          4 =C2=B1 40%  sched_debug.cpu#9.n=
r_uninterruptible
       147 =C2=B1 11%     -58.5%         61 =C2=B1 32%  sched_debug.cpu#11.=
load
       147 =C2=B1 11%     -58.5%         61 =C2=B1 32%  sched_debug.cfs_rq[=
11]:/.load
  10821106 =C2=B1 39%     -59.8%    4347430 =C2=B1 20%  cpuidle.C3-NHM.time
       356 =C2=B1 41%     +76.6%        629 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     22128 =C2=B1  3%    +120.2%      48719 =C2=B1  8%  time.involuntary_co=
ntext_switches
       145 =C2=B1 36%     -35.9%         93 =C2=B1 30%  sched_debug.cpu#5.l=
oad
       469 =C2=B1 29%     +55.9%        732 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
       145 =C2=B1 36%     -34.0%         95 =C2=B1 29%  sched_debug.cfs_rq[=
5]:/.load
        99 =C2=B1  8%     -27.8%         72 =C2=B1 24%  sched_debug.cpu#9.l=
oad
        99 =C2=B1  8%     -27.8%         72 =C2=B1 24%  sched_debug.cfs_rq[=
9]:/.load
    219871 =C2=B1  6%     -33.3%     146545 =C2=B1 19%  sched_debug.cpu#3.t=
twu_local
    224610 =C2=B1  6%     -31.3%     154342 =C2=B1 18%  sched_debug.cpu#3.s=
ched_goidle
    451877 =C2=B1  6%     -31.1%     311378 =C2=B1 18%  sched_debug.cpu#3.s=
ched_count
    451737 =C2=B1  6%     -31.1%     311279 =C2=B1 18%  sched_debug.cpu#3.n=
r_switches
    225208 =C2=B1  6%     -31.3%     154688 =C2=B1 18%  sched_debug.cpu#3.t=
twu_count
      4122 =C2=B1  7%     -23.6%       3148 =C2=B1 17%  cpuidle.C3-NHM.usage
        84 =C2=B1 11%     -27.4%         61 =C2=B1  5%  sched_debug.cpu#7.c=
pu_load[0]
    154565 =C2=B1  2%     -29.6%     108768 =C2=B1  9%  cpuidle.C6-NHM.usage
    124949 =C2=B1 25%     +41.4%     176670 =C2=B1 15%  sched_debug.cpu#2.s=
ched_goidle
     74177 =C2=B1  2%     -23.6%      56653 =C2=B1  4%  sched_debug.cpu#3.n=
r_load_updates
        79 =C2=B1  6%     -23.1%         60 =C2=B1  5%  sched_debug.cpu#7.c=
pu_load[1]
     50107 =C2=B1  6%     -20.9%      39621 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.exec_clock
        76 =C2=B1  4%     -20.6%         60 =C2=B1  6%  sched_debug.cpu#7.c=
pu_load[2]
    385983 =C2=B1  9%     -20.4%     307347 =C2=B1 12%  sched_debug.cfs_rq[=
3]:/.min_vruntime
        74 =C2=B1  2%     -18.5%         60 =C2=B1  6%  sched_debug.cpu#7.c=
pu_load[3]
      1.50 =C2=B1  6%     -10.0%       1.35 =C2=B1  9%  perf-profile.cpu-cy=
cles.selinux_file_free_security.security_file_free.__fput.____fput.task_wor=
k_run
     46086 =C2=B1  1%     -25.7%      34260 =C2=B1  5%  softirqs.SCHED
        72 =C2=B1  1%     -15.9%         60 =C2=B1  7%  sched_debug.cpu#7.c=
pu_load[4]
        74 =C2=B1 13%     -17.7%         61 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
        65 =C2=B1  2%     +16.9%         76 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[3]
      1.94 =C2=B1  5%      -9.9%       1.74 =C2=B1  6%  perf-profile.cpu-cy=
cles.security_file_free.__fput.____fput.task_work_run.do_notify_resume
     58851 =C2=B1  1%     +20.5%      70942 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.exec_clock
     69880 =C2=B1  1%     -16.9%      58047 =C2=B1 11%  sched_debug.cpu#7.n=
r_load_updates
        60 =C2=B1  5%      +9.5%         66 =C2=B1  3%  sched_debug.cpu#9.c=
pu_load[4]
     12064 =C2=B1  7%     +12.4%      13561 =C2=B1  5%  slabinfo.kmalloc-64=
.num_objs
        67 =C2=B1  4%     +14.9%         77 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[2]
     53070 =C2=B1  7%     +18.3%      62803 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.exec_clock
        64 =C2=B1  1%     +16.3%         74 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[4]
     11895 =C2=B1  7%     +12.9%      13429 =C2=B1  5%  slabinfo.kmalloc-64=
.active_objs
     67415 =C2=B1  1%     -16.4%      56345 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.exec_clock
     58403 =C2=B1  4%     +12.0%      65434 =C2=B1  6%  sched_debug.cpu#9.n=
r_load_updates
    428535 =C2=B1  8%     +18.3%     507136 =C2=B1  6%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    505551 =C2=B1  1%     +16.3%     588207 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      1818 =C2=B1  5%      -8.4%       1665 =C2=B1  3%  slabinfo.proc_inode=
_cache.active_objs
      1818 =C2=B1  5%      -8.4%       1665 =C2=B1  3%  slabinfo.proc_inode=
_cache.num_objs
       616 =C2=B1  0%     +11.4%        686 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      2259 =C2=B1 14%     +23.5%       2790 =C2=B1  5%  sched_debug.cpu#3.c=
urr->pid
     28336 =C2=B1  0%     +11.2%      31517 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
    576795 =C2=B1  1%     -14.6%     492717 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      7176 =C2=B1  0%      +2.1%       7323 =C2=B1  0%  vmstat.system.cs
     10798 =C2=B1  0%      -1.1%      10675 =C2=B1  0%  vmstat.system.in

lkp-a03: Atom
Memory: 8G

wsm: Westmere
Memory: 6G




                   will-it-scale.time.involuntary_context_switches

  70000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  60000 ++                                                         O       =
 |
        O        O    O                  O    O   O    O    O   O      O   =
 |
  50000 ++   O O    O        O                           O    O           O=
 O
        | O                    O  O        O    O                    O     =
 |
  40000 ++              O  O        O O              O                     =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |     .*.                       .*.*..                      .*     =
 |
  20000 *+*..*   *..*.*    *.*.*..*.*.*.      *.*.*..*.*.*..*.*.*..*       =
 |
        |              :  :                                                =
 |
  10000 ++             :  :                                                =
 |
        |               ::                                                 =
 |
      0 ++--------------*--------------------------------------------------=
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


--===============1284278920313517365==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3
YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpj
b21taXQ6IDYzNGIwYmQ0OTBiN2ViZDdhMDU0Y2VhNGY3ZTBkMjU3NDhiZGU2NzgKbW9kZWw6IFdl
c3RtZXJlCm1lbW9yeTogNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDEKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0Y29uc29sZV9wb3J0OiA2NjY3
CnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OgogIC0gb3Bl
bjIKdGVzdGJveDogd3NtCnRib3hfZ3JvdXA6IHdzbQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1
ZXVlX3RpbWU6IDIwMTUtMDEtMTYgMTc6NDM6NDcuOTc2OTkwNjIxICswODowMApoZWFkX2NvbW1p
dDogNjM0YjBiZDQ5MGI3ZWJkN2EwNTRjZWE0ZjdlMGQyNTc0OGJkZTY3OApiYXNlX2NvbW1pdDog
ZWFhMjdmMzRlOTFhMTRjZGNlZWQyNmVkNmM2NzkzZWMxZDE4NjExNQpicmFuY2g6IG5leHQvbWFz
dGVyCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvNjM0YjBiZDQ5MGI3ZWJkN2EwNTRjZWE0
ZjdlMGQyNTc0OGJkZTY3OC92bWxpbnV6LTMuMTkuMC1yYzQtbmV4dC0yMDE1MDExNi1nNjM0YjBi
ZCIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDEt
MTMuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93c20vd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5j
ZS1vcGVuMi9kZWJpYW4teDg2XzY0LTIwMTUtMDEtMTMuY2d6L3g4Nl82NC1yaGVsLzYzNGIwYmQ0
OTBiN2ViZDdhMDU0Y2VhNGY3ZTBkMjU3NDhiZGU2NzgvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVk
dWxlZC93c20vY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2Utb3BlbjIteDg2XzY0LXJo
ZWwtSEVBRC02MzRiMGJkNDkwYjdlYmQ3YTA1NGNlYTRmN2UwZDI1NzQ4YmRlNjc4LTAueWFtbCIK
ZGVxdWV1ZV90aW1lOiAyMDE1LTAxLTE2IDIzOjUwOjA3LjI0NzA2NTYyMyArMDg6MDAKbnJfY3B1
OiAiJChucHJvYykiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogOC4xMiA0Ljk3IDIuMDYg
MS8xNDYgNjY5MwpzdGFydF90aW1lOiAnMTQyMTQyMzQzOScKZW5kX3RpbWU6ICcxNDIxNDIzNzQz
Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDExNi0xMTM1MjUiCg==

--===============1284278920313517365==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IG9wZW4yIDMyIDEgNiA5IDEyCg==

--===============1284278920313517365==--

