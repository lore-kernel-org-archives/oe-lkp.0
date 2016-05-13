Content-Type: multipart/mixed; boundary="===============4753648375819354013=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched/core] 2159197d66: netperf.Throughput_Mbps 14.2% improvement
Date: Fri, 13 May 2016 09:29:39 +0800
Message-ID: <20160513012939.GA24890@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4753648375819354013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed netperf.Throughput_Mbps 14.2% improvement due to commit:

commit 2159197d66770ec01f75c93fb11dc66df81fd45b ("sched/core: Enable increa=
sed load resolution on 64-bit kernels")
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core

in testcase - netperf
on test machine - lkp-hsw-d01: 8 threads Haswell with 8G memory



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send=
_size/tbox_group/test/testcase:
  cs-localhost/gcc-4.9/performance/ipv4/x86_64-rhel/200%/debian-x86_64-2015=
-02-07.cgz/300s/10K/lkp-hsw-d01/SCTP_STREAM_MANY/netperf

commit: =

  e7904a28f5331c21d17af638cb477c83662e3cb6
  2159197d66770ec01f75c93fb11dc66df81fd45b

e7904a28f5331c21 2159197d66770ec01f75c93fb1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      4657 =C2=B1  3%     +14.2%       5317 =C2=B1  0%  netperf.Throughput_=
Mbps
     10987 =C2=B1  9%  +3.4e+05%   37810767 =C2=B1  0%  netperf.time.involu=
ntary_context_switches
    527.25 =C2=B1  0%     -25.1%     395.00 =C2=B1  0%  netperf.time.percen=
t_of_cpu_this_job_got
      1547 =C2=B1  0%     -24.9%       1162 =C2=B1  0%  netperf.time.system=
_time
     44.45 =C2=B1  1%     -32.1%      30.16 =C2=B1  1%  netperf.time.user_t=
ime
  16045063 =C2=B1  3%     -82.8%    2757566 =C2=B1  6%  netperf.time.volunt=
ary_context_switches
     10119 =C2=B1 41%    +203.3%      30688 =C2=B1 38%  cpuidle.C1-HSW.usage
     51528 =C2=B1  8%    +203.0%     156148 =C2=B1  9%  softirqs.RCU
     55.94 =C2=B1  1%      +4.2%      58.31 =C2=B1  0%  turbostat.CorWatt
     64.79 =C2=B1  1%      +2.6%      66.45 =C2=B1  0%  turbostat.PkgWatt
     21.00 =C2=B1  0%      -8.3%      19.25 =C2=B1  2%  vmstat.procs.r
    105875 =C2=B1  3%    +155.5%     270467 =C2=B1  0%  vmstat.system.cs
 3.535e+08 =C2=B1  3%     +13.4%  4.007e+08 =C2=B1  0%  proc-vmstat.numa_hit
 3.535e+08 =C2=B1  3%     +13.4%  4.007e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
 8.196e+08 =C2=B1  3%     +22.1%  1.001e+09 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
 1.043e+09 =C2=B1  3%     +23.0%  1.282e+09 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 1.862e+09 =C2=B1  3%     +22.6%  2.283e+09 =C2=B1  0%  proc-vmstat.pgfree
     10987 =C2=B1  9%  +3.4e+05%   37810767 =C2=B1  0%  time.involuntary_co=
ntext_switches
    527.25 =C2=B1  0%     -25.1%     395.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      1547 =C2=B1  0%     -24.9%       1162 =C2=B1  0%  time.system_time
     44.45 =C2=B1  1%     -32.1%      30.16 =C2=B1  1%  time.user_time
  16045063 =C2=B1  3%     -82.8%    2757566 =C2=B1  6%  time.voluntary_cont=
ext_switches
    727242 =C2=B1  6%     -94.3%      41723 =C2=B1 17%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
    824178 =C2=B1  0%     -90.6%      77484 =C2=B1  0%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
    353474 =C2=B1 28%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.MIN_vruntime.min
    181141 =C2=B1 29%     -80.4%      35590 =C2=B1  4%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
    215.56 =C2=B1  4%  +6.5e+05%    1404265 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.avg
    289.96 =C2=B1 27%  +6.7e+05%    1954288 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.max
    161.25 =C2=B1  6%  +5.4e+05%     865368 =C2=B1  0%  sched_debug.cfs_rq:=
/.load.min
     41.64 =C2=B1 61%  +1.2e+06%     503455 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.stddev
    196.06 =C2=B1  2%    +401.4%     983.07 =C2=B1  2%  sched_debug.cfs_rq:=
/.load_avg.avg
    241.33 =C2=B1  7%    +359.5%       1108 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.max
    161.29 =C2=B1  0%    +434.5%     862.17 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.min
     31.50 =C2=B1 19%    +180.5%      88.36 =C2=B1 34%  sched_debug.cfs_rq:=
/.load_avg.stddev
    727242 =C2=B1  6%     -94.3%      41723 =C2=B1 17%  sched_debug.cfs_rq:=
/.max_vruntime.avg
    824178 =C2=B1  0%     -90.6%      77484 =C2=B1  0%  sched_debug.cfs_rq:=
/.max_vruntime.max
    353474 =C2=B1 28%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.max_vruntime.min
    181141 =C2=B1 29%     -80.4%      35590 =C2=B1  4%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
    819702 =C2=B1  0%     -90.7%      76071 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    826026 =C2=B1  0%     -90.4%      79401 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.max
    815229 =C2=B1  0%     -90.8%      74929 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
      3308 =C2=B1 26%     -57.2%       1415 =C2=B1 23%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      1.66 =C2=B1  1%     -18.9%       1.34 =C2=B1  3%  sched_debug.cfs_rq:=
/.nr_running.avg
      1.25 =C2=B1  6%     -33.3%       0.83 =C2=B1  0%  sched_debug.cfs_rq:=
/.nr_running.min
      0.24 =C2=B1 18%     +98.5%       0.48 =C2=B1  4%  sched_debug.cfs_rq:=
/.nr_running.stddev
    151.14 =C2=B1  1%    +482.7%     880.75 =C2=B1  1%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    168.83 =C2=B1  1%    +502.6%       1017 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
    103.42 =C2=B1  9%    +601.1%     725.04 =C2=B1 10%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
     21.35 =C2=B1 17%    +357.0%      97.56 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
     -9567 =C2=B1-36%     -53.2%      -4474 =C2=B1-24%  sched_debug.cfs_rq:=
/.spread0.min
      3310 =C2=B1 26%     -57.2%       1416 =C2=B1 23%  sched_debug.cfs_rq:=
/.spread0.stddev
    536142 =C2=B1 16%     -39.3%     325631 =C2=B1 29%  sched_debug.cpu.avg=
_idle.avg
      0.90 =C2=B1 14%    +150.7%       2.26 =C2=B1  5%  sched_debug.cpu.clo=
ck.stddev
      0.90 =C2=B1 14%    +150.7%       2.26 =C2=B1  5%  sched_debug.cpu.clo=
ck_task.stddev
    153.77 =C2=B1  0%    +477.9%     888.63 =C2=B1  1%  sched_debug.cpu.cpu=
_load[0].avg
    169.17 =C2=B1  1%    +503.3%       1020 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].max
    122.96 =C2=B1  5%    +549.6%     798.71 =C2=B1  1%  sched_debug.cpu.cpu=
_load[0].min
     14.98 =C2=B1 13%    +408.1%      76.13 =C2=B1  2%  sched_debug.cpu.cpu=
_load[0].stddev
    153.47 =C2=B1  0%    +484.2%     896.64 =C2=B1  1%  sched_debug.cpu.cpu=
_load[1].avg
    166.75 =C2=B1  0%    +502.6%       1004 =C2=B1  1%  sched_debug.cpu.cpu=
_load[1].max
    130.62 =C2=B1  2%    +514.7%     802.92 =C2=B1  3%  sched_debug.cpu.cpu=
_load[1].min
     11.46 =C2=B1  8%    +483.7%      66.91 =C2=B1 10%  sched_debug.cpu.cpu=
_load[1].stddev
    152.94 =C2=B1  0%    +485.7%     895.80 =C2=B1  1%  sched_debug.cpu.cpu=
_load[2].avg
    165.04 =C2=B1  0%    +502.6%     994.50 =C2=B1  1%  sched_debug.cpu.cpu=
_load[2].max
    136.29 =C2=B1  1%    +489.4%     803.29 =C2=B1  3%  sched_debug.cpu.cpu=
_load[2].min
      9.17 =C2=B1 12%    +589.1%      63.21 =C2=B1 12%  sched_debug.cpu.cpu=
_load[2].stddev
    153.46 =C2=B1  0%    +483.7%     895.78 =C2=B1  1%  sched_debug.cpu.cpu=
_load[3].avg
    163.92 =C2=B1  0%    +500.3%     984.04 =C2=B1  1%  sched_debug.cpu.cpu=
_load[3].max
    141.88 =C2=B1  1%    +468.7%     806.79 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].min
      7.18 =C2=B1 12%    +734.9%      59.98 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].stddev
    155.51 =C2=B1  0%    +475.5%     894.93 =C2=B1  1%  sched_debug.cpu.cpu=
_load[4].avg
    164.58 =C2=B1  0%    +489.0%     969.38 =C2=B1  0%  sched_debug.cpu.cpu=
_load[4].max
    146.58 =C2=B1  1%    +452.8%     810.38 =C2=B1  2%  sched_debug.cpu.cpu=
_load[4].min
      5.76 =C2=B1 13%    +858.1%      55.18 =C2=B1 12%  sched_debug.cpu.cpu=
_load[4].stddev
    215.88 =C2=B1  5%  +6.3e+05%    1365964 =C2=B1  6%  sched_debug.cpu.loa=
d.avg
    293.25 =C2=B1 26%  +6.7e+05%    1953269 =C2=B1  3%  sched_debug.cpu.loa=
d.max
    166.50 =C2=B1  5%  +5.2e+05%     865491 =C2=B1  0%  sched_debug.cpu.loa=
d.min
     40.05 =C2=B1 61%  +1.2e+06%     478086 =C2=B1  4%  sched_debug.cpu.loa=
d.stddev
      2.51 =C2=B1  1%     -10.6%       2.24 =C2=B1  3%  sched_debug.cpu.nr_=
running.avg
      1.96 =C2=B1  7%     -27.7%       1.42 =C2=B1 13%  sched_debug.cpu.nr_=
running.min
      0.38 =C2=B1 24%     +85.2%       0.70 =C2=B1 23%  sched_debug.cpu.nr_=
running.stddev
   2001135 =C2=B1  3%    +154.6%    5095769 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
   2026432 =C2=B1  4%    +158.1%    5231149 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
   1975801 =C2=B1  3%    +152.2%    4983341 =C2=B1  1%  sched_debug.cpu.nr_=
switches.min
     17661 =C2=B1 48%    +365.1%      82150 =C2=B1 34%  sched_debug.cpu.nr_=
switches.stddev



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
Xiaolong

--===============4753648375819354013==
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
YW5jZQpORlNfSEFOR19ERl9USU1FT1VUOiAyMDAKTkZTX0hBTkdfQ0hFQ0tfSU5URVJWQUw6IDkw
MApkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCiAgbmZzLWhh
bmc6IApjb21taXQ6IDIxNTkxOTdkNjY3NzBlYzAxZjc1YzkzZmIxMWRjNjZkZjgxZmQ0NWIKbW9k
ZWw6IEhhc3dlbGwKbnJfY3B1OiA4Cm1lbW9yeTogOEcKaGRkX3BhcnRpdGlvbnM6IApzd2FwX3Bh
cnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKY2F0ZWdvcnk6IGJlbmNobWFyawpkaXNhYmxl
X2xhdGVuY3lfc3RhdHM6IDEKaXA6IGlwdjQKcnVudGltZTogMzAwcwpucl90aHJlYWRzOiAyMDAl
CnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKY2x1c3RlcjogY3MtbG9jYWxob3N0CmlmIHJvbGUg
c2VydmVyOgogIG5ldHNlcnZlcjogCmlmIHJvbGUgY2xpZW50OgogIG5ldHBlcmY6CiAgICBzZW5k
X3NpemU6IDEwSwogICAgdGVzdDogU0NUUF9TVFJFQU1fTUFOWQpxdWV1ZTogYmlzZWN0CnRlc3Ri
b3g6IGxrcC1oc3ctZDAxCnRib3hfZ3JvdXA6IGxrcC1oc3ctZDAxCmtjb25maWc6IHg4Nl82NC1y
aGVsCmVucXVldWVfdGltZTogMjAxNi0wNS0xMyAwNDozNzo0My42NTcwNzc5MzMgKzA4OjAwCmNv
bXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDog
YzE5ZjQ4ZTZhYWJjNTdiYmRjYWU5MzU5ODJhNDZiMTEzNWIwNjc5OAp1c2VyOiBsa3AKaGVhZF9j
b21taXQ6IDc1MDMyZTU2ZTlkODMwOTVkZjc1YjYwMjlhNzY0MjgwZjA4MWEyNTgKYmFzZV9jb21t
aXQ6IDQ0NTQ5ZThmNWVlYTRlMGE0MWI0ODdiNjNlNjE2Y2IwODk5MjJiOTkKYnJhbmNoOiBsaW51
eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA1MTIxMwpub2RlX3JvbGVzOiBzZXJ2ZXIgY2xpZW50
CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9uZXRwZXJmL3BlcmZvcm1hbmNlLWlwdjQtMzAwcy0yMDAl
LWNzLWxvY2FsaG9zdC0xMEstU0NUUF9TVFJFQU1fTUFOWS9sa3AtaHN3LWQwMS9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMjE1OTE5N2Q2Njc3MGVjMDFm
NzVjOTNmYjExZGM2NmRmODFmZDQ1Yi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1o
c3ctZDAxL2Jpc2VjdF9uZXRwZXJmLXBlcmZvcm1hbmNlLWlwdjQtMzAwcy0yMDAlLWNzLWxvY2Fs
aG9zdC0xMEstU0NUUF9TVFJFQU1fTUFOWS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4
Nl82NC1yaGVsLTIxNTkxOTdkNjY3NzBlYzAxZjc1YzkzZmIxMWRjNjZkZjgxZmQ0NWItMjAxNjA1
MTMtNzM0MTYtMXEzdXY4bS0wLnlhbWwiCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1h
Z2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5k
OgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLWhz
dy1kMDEvYmlzZWN0X25ldHBlcmYtcGVyZm9ybWFuY2UtaXB2NC0zMDBzLTIwMCUtY3MtbG9jYWxo
b3N0LTEwSy1TQ1RQX1NUUkVBTV9NQU5ZLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2
XzY0LXJoZWwtMjE1OTE5N2Q2Njc3MGVjMDFmNzVjOTNmYjExZGM2NmRmODFmZDQ1Yi0yMDE2MDUx
My03MzQxNi0xcTN1djhtLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhl
bAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA1MTIxMwotIGNvbW1pdD0y
MTU5MTk3ZDY2NzcwZWMwMWY3NWM5M2ZiMTFkYzY2ZGY4MWZkNDViCi0gQk9PVF9JTUFHRT0vcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMjE1OTE5N2Q2Njc3MGVjMDFmNzVjOTNmYjExZGM2
NmRmODFmZDQ1Yi92bWxpbnV6LTQuNi4wLXJjNS0wMDAzNC1nMjE1OTE5NwotIG1heF91cHRpbWU9
MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvbmV0cGVyZi9wZXJmb3JtYW5jZS1pcHY0LTMwMHMt
MjAwJS1jcy1sb2NhbGhvc3QtMTBLLVNDVFBfU1RSRUFNX01BTlkvbGtwLWhzdy1kMDEvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzIxNTkxOTdkNjY3NzBl
YzAxZjc1YzkzZmIxMWRjNjZkZjgxZmQ0NWIvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBl
YXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBp
Yz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVv
dXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBv
b3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMw
LDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9s
a3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzIxNTkxOTdkNjY3NzBlYzAxZjc1YzkzZmIxMWRjNjZkZjgxZmQ0NWIvbW9kdWxl
cy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9y
dW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2ht
YXJrcy9wZXJmLXByb2ZpbGUteDg2XzY0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovbmV0cGVyZi5jZ3osL2xrcC9iZW5jaG1hcmtzL25ldHBlcmYuY2d6Igps
aW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8yMTU5
MTk3ZDY2NzcwZWMwMWY3NWM5M2ZiMTFkYzY2ZGY4MWZkNDViL2xpbnV4LWhlYWRlcnMuY2d6Igpy
ZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzIxNTkx
OTdkNjY3NzBlYzAxZjc1YzkzZmIxMWRjNjZkZjgxZmQ0NWIvdm1saW51ei00LjYuMC1yYzUtMDAw
MzQtZzIxNTkxOTciCmRlcXVldWVfdGltZTogMjAxNi0wNS0xMyAwNDo0ODoxMC44ODI3MDUxMDcg
KzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMTguODQgMTIuNzggNS42MyAxLzE1
NyA0NTk3CnN0YXJ0X3RpbWU6ICcxNDYzMDg2MTI4JwplbmRfdGltZTogJzE0NjMwODY0MjknCnZl
cnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwNTEzLTAwMTIzNSIK

--===============4753648375819354013==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNS0xMyAwNDo0ODo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwNDo0ODo0NyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwNDo0ODo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NS0xMyAwNDo0ODo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwNDo0ODo0NyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNS0xMyAwNDo0ODo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAw
NDo0ODo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNS0xMyAwNDo0ODo0NyBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNS0xMyAwNDo0ODo0NyBuZXRzZXJ2ZXIgLTQKMjAxNi0wNS0xMyAwNDo0ODo0OSBu
ZXRwZXJmIC00IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSyAtSCAx
MjcuMC4wLjEgJgoyMDE2LTA1LTEzIDA0OjQ4OjQ5IG5ldHBlcmYgLTQgLXQgU0NUUF9TVFJFQU1f
TUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLIC1IIDEyNy4wLjAuMSAmCjIwMTYtMDUtMTMgMDQ6
NDg6NDkgbmV0cGVyZiAtNCAtdCBTQ1RQX1NUUkVBTV9NQU5ZIC1jIC1DIC1sIDMwMCAtLSAtbSAx
MEsgLUggMTI3LjAuMC4xICYKMjAxNi0wNS0xMyAwNDo0ODo0OSBuZXRwZXJmIC00IC10IFNDVFBf
U1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSyAtSCAxMjcuMC4wLjEgJgoyMDE2LTA1
LTEzIDA0OjQ4OjQ5IG5ldHBlcmYgLTQgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAg
LS0gLW0gMTBLIC1IIDEyNy4wLjAuMSAmCjIwMTYtMDUtMTMgMDQ6NDg6NDkgbmV0cGVyZiAtNCAt
dCBTQ1RQX1NUUkVBTV9NQU5ZIC1jIC1DIC1sIDMwMCAtLSAtbSAxMEsgLUggMTI3LjAuMC4xICYK
MjAxNi0wNS0xMyAwNDo0ODo0OSBuZXRwZXJmIC00IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSyAtSCAxMjcuMC4wLjEgJgoyMDE2LTA1LTEzIDA0OjQ4OjQ5IG5ldHBl
cmYgLTQgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLIC1IIDEyNy4w
LjAuMSAmCjIwMTYtMDUtMTMgMDQ6NDg6NDkgbmV0cGVyZiAtNCAtdCBTQ1RQX1NUUkVBTV9NQU5Z
IC1jIC1DIC1sIDMwMCAtLSAtbSAxMEsgLUggMTI3LjAuMC4xICYKMjAxNi0wNS0xMyAwNDo0ODo0
OSBuZXRwZXJmIC00IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSyAt
SCAxMjcuMC4wLjEgJgoyMDE2LTA1LTEzIDA0OjQ4OjQ5IG5ldHBlcmYgLTQgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLIC1IIDEyNy4wLjAuMSAmCjIwMTYtMDUtMTMg
MDQ6NDg6NDkgbmV0cGVyZiAtNCAtdCBTQ1RQX1NUUkVBTV9NQU5ZIC1jIC1DIC1sIDMwMCAtLSAt
bSAxMEsgLUggMTI3LjAuMC4xICYKMjAxNi0wNS0xMyAwNDo0ODo0OSBuZXRwZXJmIC00IC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSyAtSCAxMjcuMC4wLjEgJgoyMDE2
LTA1LTEzIDA0OjQ4OjQ5IG5ldHBlcmYgLTQgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLIC1IIDEyNy4wLjAuMSAmCjIwMTYtMDUtMTMgMDQ6NDg6NDkgbmV0cGVyZiAt
NCAtdCBTQ1RQX1NUUkVBTV9NQU5ZIC1jIC1DIC1sIDMwMCAtLSAtbSAxMEsgLUggMTI3LjAuMC4x
ICYKMjAxNi0wNS0xMyAwNDo0ODo0OSBuZXRwZXJmIC00IC10IFNDVFBfU1RSRUFNX01BTlkgLWMg
LUMgLWwgMzAwIC0tIC1tIDEwSyAtSCAxMjcuMC4wLjEgJgo=

--===============4753648375819354013==--

