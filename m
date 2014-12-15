Content-Type: multipart/mixed; boundary="===============1865430363415361546=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 8b26ef98da3: + 27.4% iostat.sda.wrqm/s
Date: Mon, 15 Dec 2014 11:26:55 +0800
Message-ID: <1418614015.5745.166.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1865430363415361546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 8b26ef98da3387eb57a8a5c1747c6e628948ee0c ("f2fs: use rw_semaphore fo=
r nat entry lock")

testbox/testcase/testparams: lkp-ne04/fsmark/performance-1x-32t-1HDD-f2fs-8=
K-400M-fsyncBeforeClose-16d-256fpd

4634d71ed190c99e  8b26ef98da3387eb57a8a5c174  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

       420 =C2=B1  0%     +12.0%        470 =C2=B1  0%  fsmark.files_per_sec
      7.37 =C2=B1 22%     -84.0%       1.18 =C2=B1 26%  turbostat.%pc6
      2122 =C2=B1  2%    +929.0%      21838 =C2=B1  1%  proc-vmstat.pgactiv=
ate
     41341 =C2=B1 34%    +226.9%     135151 =C2=B1 40%  sched_debug.cpu#4.s=
ched_count
      4093 =C2=B1 29%    +266.1%      14988 =C2=B1 21%  sched_debug.cpu#12.=
ttwu_count
  20670219 =C2=B1 24%    +243.7%   71049994 =C2=B1 11%  cpuidle.C1-NHM.time
      4279 =C2=B1 25%    +237.2%      14431 =C2=B1 19%  sched_debug.cpu#14.=
ttwu_count
      3995 =C2=B1 19%    +237.7%      13492 =C2=B1 22%  sched_debug.cpu#11.=
ttwu_count
      4092 =C2=B1 25%    +230.0%      13503 =C2=B1 19%  sched_debug.cpu#15.=
ttwu_count
      7241 =C2=B1 14%    +218.7%      23080 =C2=B1 18%  sched_debug.cpu#3.t=
twu_count
      4065 =C2=B1 28%    +251.5%      14291 =C2=B1 24%  sched_debug.cpu#13.=
ttwu_count
        23 =C2=B1 48%    +201.1%         69 =C2=B1 12%  cpuidle.POLL.usage
     12604 =C2=B1 11%    +161.1%      32904 =C2=B1 28%  sched_debug.cpu#11.=
nr_switches
      5441 =C2=B1 15%    +164.0%      14365 =C2=B1 27%  sched_debug.cpu#11.=
sched_goidle
     12902 =C2=B1  9%    +163.0%      33936 =C2=B1 33%  sched_debug.cpu#13.=
nr_switches
      8230 =C2=B1 13%    +182.2%      23230 =C2=B1 20%  sched_debug.cpu#1.t=
twu_count
     13010 =C2=B1  9%    +153.2%      32947 =C2=B1 28%  sched_debug.cpu#15.=
nr_switches
      5571 =C2=B1 11%    +160.5%      14511 =C2=B1 30%  sched_debug.cpu#13.=
sched_goidle
     13596 =C2=B1 13%    +172.7%      37082 =C2=B1 38%  sched_debug.cpu#15.=
sched_count
      7563 =C2=B1 16%    +200.9%      22762 =C2=B1 22%  sched_debug.cpu#7.t=
twu_count
      5598 =C2=B1 12%    +156.2%      14342 =C2=B1 26%  sched_debug.cpu#15.=
sched_goidle
     16069 =C2=B1 23%    +117.8%      34992 =C2=B1 25%  sched_debug.cpu#14.=
nr_switches
     14194 =C2=B1  8%    +152.8%      35879 =C2=B1 26%  sched_debug.cpu#12.=
nr_switches
     13397 =C2=B1 11%    +158.2%      34598 =C2=B1 22%  sched_debug.cpu#11.=
sched_count
     14596 =C2=B1  9%    +148.3%      36240 =C2=B1 25%  sched_debug.cpu#12.=
sched_count
     13647 =C2=B1 10%    +150.2%      34139 =C2=B1 32%  sched_debug.cpu#13.=
sched_count
      6705 =C2=B1 20%    +127.1%      15225 =C2=B1 23%  sched_debug.cpu#14.=
sched_goidle
      6177 =C2=B1 10%    +151.7%      15546 =C2=B1 24%  sched_debug.cpu#12.=
sched_goidle
     16275 =C2=B1 23%    +139.7%      39015 =C2=B1 17%  sched_debug.cpu#14.=
sched_count
      6218 =C2=B1 15%    +209.6%      19252 =C2=B1 45%  sched_debug.cpu#10.=
sched_goidle
     21820 =C2=B1  6%    +123.4%      48742 =C2=B1 25%  sched_debug.cpu#7.n=
r_switches
     22931 =C2=B1 10%    +159.5%      59497 =C2=B1 44%  sched_debug.cpu#5.n=
r_switches
      9865 =C2=B1  8%    +120.0%      21709 =C2=B1 24%  sched_debug.cpu#7.s=
ched_goidle
     10505 =C2=B1 12%    +141.8%      25405 =C2=B1 37%  sched_debug.cpu#5.s=
ched_goidle
     12980 =C2=B1  6%    +107.7%      26956 =C2=B1 16%  sched_debug.cpu#4.t=
twu_count
     24231 =C2=B1 18%    +103.6%      49334 =C2=B1 24%  sched_debug.cpu#3.n=
r_switches
     11147 =C2=B1 14%     +99.2%      22210 =C2=B1 22%  sched_debug.cpu#1.s=
ched_goidle
     11092 =C2=B1 21%     +99.0%      22076 =C2=B1 23%  sched_debug.cpu#3.s=
ched_goidle
     29443 =C2=B1  8%     +89.3%      55744 =C2=B1 20%  sched_debug.cpu#4.n=
r_switches
     32087 =C2=B1  7%     +81.3%      58169 =C2=B1 18%  sched_debug.cpu#2.n=
r_switches
     12984 =C2=B1 17%    +111.4%      27446 =C2=B1 12%  sched_debug.cpu#2.t=
twu_count
     26458 =C2=B1 18%     +89.7%      50191 =C2=B1 24%  sched_debug.cpu#1.n=
r_switches
     14505 =C2=B1  8%     +98.6%      28807 =C2=B1 29%  sched_debug.cpu#0.s=
ched_goidle
     13628 =C2=B1  8%     +81.1%      24686 =C2=B1 17%  sched_debug.cpu#2.s=
ched_goidle
     13700 =C2=B1  9%     +82.6%      25012 =C2=B1 18%  sched_debug.cpu#4.s=
ched_goidle
     33822 =C2=B1  9%    +102.3%      68417 =C2=B1 35%  sched_debug.cpu#0.n=
r_switches
     18438 =C2=B1 28%    +160.1%      47957 =C2=B1 23%  cpuidle.C1-NHM.usage
      6.50 =C2=B1 10%     +73.2%      11.25 =C2=B1  7%  turbostat.%c1
        14 =C2=B1 13%     +52.5%         22 =C2=B1 12%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
    135553 =C2=B1  6%     +73.5%     235188 =C2=B1  6%  cpuidle.C3-NHM.usage
       723 =C2=B1 13%     +48.3%       1072 =C2=B1 10%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     28.84 =C2=B1  9%     +52.2%      43.89 =C2=B1  5%  turbostat.%c3
     63.48 =C2=B1  3%     -31.8%      43.29 =C2=B1  5%  turbostat.%c6
     30737 =C2=B1  0%     -31.0%      21223 =C2=B1  1%  softirqs.BLOCK
      2329 =C2=B1  5%     +31.1%       3052 =C2=B1 11%  sched_debug.cfs_rq[=
14]:/.min_vruntime
 3.494e+08 =C2=B1 12%     +48.6%  5.192e+08 =C2=B1  5%  cpuidle.C3-NHM.time
 1.545e+09 =C2=B1  2%     -27.1%  1.126e+09 =C2=B1  2%  cpuidle.C6-NHM.time
  26451473 =C2=B1  5%     -28.7%   18850454 =C2=B1 17%  cpuidle.C1E-NHM.time
    304184 =C2=B1  6%     +36.3%     414743 =C2=B1  6%  cpuidle.C6-NHM.usage
       362 =C2=B1  2%     +28.7%        466 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
       363 =C2=B1  2%     +28.6%        467 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
       364 =C2=B1  1%     +28.4%        467 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
       367 =C2=B1  1%     +28.0%        470 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
       369 =C2=B1  1%     +27.9%        472 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
    977486 =C2=B1  1%     -21.6%     766721 =C2=B1 11%  sched_debug.cpu#13.=
avg_idle
       372 =C2=B1  1%     +27.2%        473 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
       373 =C2=B1  1%     +27.6%        476 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
       379 =C2=B1  1%     +27.2%        482 =C2=B1  6%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
       376 =C2=B1  1%     +27.5%        479 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
       381 =C2=B1  1%     +26.8%        484 =C2=B1  6%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     41363 =C2=B1  5%     +59.4%      65923 =C2=B1 48%  sched_debug.cpu#0.t=
twu_count
       384 =C2=B1  1%     +23.1%        473 =C2=B1  8%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
    986988 =C2=B1  0%     -19.5%     794664 =C2=B1  4%  sched_debug.cpu#11.=
avg_idle
       386 =C2=B1  1%     +22.8%        474 =C2=B1  8%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
       389 =C2=B1  2%     +22.0%        475 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
       392 =C2=B1  2%     +21.2%        476 =C2=B1  8%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
       388 =C2=B1  1%     +22.1%        474 =C2=B1  8%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
       396 =C2=B1  2%     +20.8%        478 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
    940409 =C2=B1  1%     -12.3%     824690 =C2=B1  4%  sched_debug.cpu#0.a=
vg_idle
    927692 =C2=B1  3%     -12.9%     807567 =C2=B1  5%  sched_debug.cpu#2.a=
vg_idle
      3216 =C2=B1  5%     -10.8%       2870 =C2=B1  3%  proc-vmstat.nr_allo=
c_batch
    979736 =C2=B1  0%     -13.5%     847782 =C2=B1  4%  sched_debug.cpu#12.=
avg_idle
    245057 =C2=B1  6%     -12.1%     215473 =C2=B1 11%  numa-vmstat.node1.n=
uma_local
      1620 =C2=B1  4%     -11.5%       1435 =C2=B1  8%  numa-vmstat.node0.n=
r_alloc_batch
    894470 =C2=B1  3%     -12.4%     783635 =C2=B1  7%  sched_debug.cpu#7.a=
vg_idle
    965398 =C2=B1  2%     -11.1%     858414 =C2=B1  6%  sched_debug.cpu#14.=
avg_idle
    167233 =C2=B1  0%    +239.7%     568014 =C2=B1  0%  time.voluntary_cont=
ext_switches
      5760 =C2=B1  0%    +115.2%      12394 =C2=B1  1%  vmstat.system.cs
      7938 =C2=B1  2%     +86.4%      14800 =C2=B1  2%  time.involuntary_co=
ntext_switches
         9 =C2=B1  7%     +72.2%         15 =C2=B1  5%  time.percent_of_cpu=
_this_job_got
     10.79 =C2=B1  4%     +52.9%      16.50 =C2=B1  4%  time.system_time
      1.18 =C2=B1  2%     +33.8%       1.57 =C2=B1  3%  turbostat.%c0
       394 =C2=B1  1%     +27.4%        502 =C2=B1  1%  iostat.sda.wrqm/s
     17.69 =C2=B1  0%     -13.3%      15.33 =C2=B1  0%  iostat.sda.avgqu-sz
      5140 =C2=B1  1%     +14.8%       5900 =C2=B1  0%  vmstat.io.bo
      5183 =C2=B1  1%     +14.5%       5935 =C2=B1  0%  iostat.sda.wkB/s
       833 =C2=B1  0%     -10.5%        746 =C2=B1  0%  iostat.sda.w/s
       122 =C2=B1  0%     -10.4%        109 =C2=B1  0%  time.elapsed_time
      1174 =C2=B1  1%      +5.4%       1238 =C2=B1  1%  vmstat.system.in
      2.17 =C2=B1  1%      -4.6%       2.06 =C2=B1  1%  turbostat.GHz
   1280314 =C2=B1  0%      +2.9%    1317252 =C2=B1  0%  time.file_system_ou=
tputs

lkp-ne04: Nehalem-EP
Memory: 12G




                                 iostat.sda.wrqm/s

  600 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  500 O+O O  O O O O O  O O O O O O  O O O O O  O O O O O  O O O           =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  400 *+*.*..*.*.*.*.*..*.*.*.*.*.*..*.*.*.*.*..*.*.*   *    *.*.*.*.*..*.*=
.*
      |                                             :   :    :             =
 |
  300 ++                                            :   ::   :             =
 |
      |                                              : : :  :              =
 |
  200 ++                                             : : :  :              =
 |
      |                                              : :  : :              =
 |
      |                                              : :  : :              =
 |
  100 ++                                              :   ::               =
 |
      |                                               :    :               =
 |
    0 ++----------------------------------------------*----*---------------=
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
Fengguang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============1865430363415361546==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBmc21hcmsKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0OiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiAxMAogIHBtZXRlcjogCmRlZmF1bHRfd2F0Y2hkb2dzOgogIHdhdGNoLW9v
bTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOgotIHBlcmZvcm1hbmNlCmNvbW1pdDog
YjZjNGNmMTc1MzY5YjMxNTUyZmFkODY0MjJmMWY0ZDk4NDdiMTZlYgptb2RlbDogTmVoYWxlbS1F
UAptZW1vcnk6IDEyRwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtU1QzNTAw
NTE0TlNfOVdKMDNFQkEtcGFydDMiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9h
dGEtU1QzMTIwMDI2QVNfNU1TMDdIQTItcGFydDIiCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rp
c2svYnktaWQvYXRhLVNUMzUwMDUxNE5TXzlXSjAzRUJBLXBhcnQxIgppdGVyYXRpb25zOiAxeApu
cl90aHJlYWRzOiAzMnQKZGlzazogMUhERApmczoKLSBmMmZzCmZzMjoKLSAKZnNtYXJrOgogIGZp
bGVzaXplOgogIC0gOEsKICB0ZXN0X3NpemU6IDQwME0KICBzeW5jX21ldGhvZDogZnN5bmNCZWZv
cmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAy
NTZmcGQKdGVzdGJveDogbGtwLW5lMDQKdGJveF9ncm91cDogbGtwLW5lMDQKa2NvbmZpZzogeDg2
XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE0LTEyLTEzIDAwOjQwOjE2LjI2NDM4MDg2MCArMDg6
MDAKaGVhZF9jb21taXQ6IGI2YzRjZjE3NTM2OWIzMTU1MmZhZDg2NDIyZjFmNGQ5ODQ3YjE2ZWIK
YmFzZV9jb21taXQ6IGIyNzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQKYnJh
bmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNDEyMTIwMQprZXJuZWw6ICIva2VybmVs
L3g4Nl82NC1yaGVsL2I2YzRjZjE3NTM2OWIzMTU1MmZhZDg2NDIyZjFmNGQ5ODQ3YjE2ZWIvdm1s
aW51ei0zLjE4LjAtZ2I2YzRjZjEiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJvb3RmczogZGVi
aWFuLXg4Nl82NC5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2xrcC1uZTA0L2ZzbWFyay9wZXJm
b3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLThLLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2
ZnBkL2RlYmlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsL2I2YzRjZjE3NTM2OWIzMTU1MmZhZDg2
NDIyZjFmNGQ5ODQ3YjE2ZWIvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtbmUwNC9j
eWNsaWNfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtOEstNDAwTS1mc3luY0Jl
Zm9yZUNsb3NlLTE2ZC0yNTZmcGQteDg2XzY0LXJoZWwtSEVBRC1iNmM0Y2YxNzUzNjliMzE1NTJm
YWQ4NjQyMmYxZjRkOTg0N2IxNmViLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0LTEyLTEzIDA3
OjU2OjQ3LjU3ODg0MzA5OCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAyMS40
OSA5LjMxIDMuNDcgMS8yMTAgNTI5OApzdGFydF90aW1lOiAnMTQxODQyODY0OCcKZW5kX3RpbWU6
ICcxNDE4NDI4NzU2Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTIxMi0wNzUzMDEiCg==

--===============1865430363415361546==
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
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm1rZnMgLXQgZjJmcyAvZGV2L3NkYTMK
bW91bnQgLXQgZjJmcyAvZGV2L3NkYTMgL2ZzL3NkYTMKLi9mc19tYXJrIC1kIC9mcy9zZGEzLzEg
LWQgL2ZzL3NkYTMvMiAtZCAvZnMvc2RhMy8zIC1kIC9mcy9zZGEzLzQgLWQgL2ZzL3NkYTMvNSAt
ZCAvZnMvc2RhMy82IC1kIC9mcy9zZGEzLzcgLWQgL2ZzL3NkYTMvOCAtZCAvZnMvc2RhMy85IC1k
IC9mcy9zZGEzLzEwIC1kIC9mcy9zZGEzLzExIC1kIC9mcy9zZGEzLzEyIC1kIC9mcy9zZGEzLzEz
IC1kIC9mcy9zZGEzLzE0IC1kIC9mcy9zZGEzLzE1IC1kIC9mcy9zZGEzLzE2IC1kIC9mcy9zZGEz
LzE3IC1kIC9mcy9zZGEzLzE4IC1kIC9mcy9zZGEzLzE5IC1kIC9mcy9zZGEzLzIwIC1kIC9mcy9z
ZGEzLzIxIC1kIC9mcy9zZGEzLzIyIC1kIC9mcy9zZGEzLzIzIC1kIC9mcy9zZGEzLzI0IC1kIC9m
cy9zZGEzLzI1IC1kIC9mcy9zZGEzLzI2IC1kIC9mcy9zZGEzLzI3IC1kIC9mcy9zZGEzLzI4IC1k
IC9mcy9zZGEzLzI5IC1kIC9mcy9zZGEzLzMwIC1kIC9mcy9zZGEzLzMxIC1kIC9mcy9zZGEzLzMy
IC1EIDE2IC1OIDI1NiAtbiAxNjAwIC1MIDEgLVMgMSAtcyA4MTkyCg==

--===============1865430363415361546==--

