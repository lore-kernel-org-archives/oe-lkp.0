Content-Type: multipart/mixed; boundary="===============6485105070218519499=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] f6259fdded: unixbench.score -27.1% regression
Date: Fri, 22 Apr 2016 16:10:42 +0800
Message-ID: <20160422081042.GD31129@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6485105070218519499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that unixbench.score -27.1% regression with following commi=
t:

https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
commit f6259fddeda7598394b2a49278091d6c0a576a79 ("sched/fair: Do not call c=
pufreq hook unless util changed")

on test machine: lituya: 16 threads Haswell High-end Desktop (i7-5960X 3.0G=
) with 16G memory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_task/test:
  lituya/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/powersa=
ve/1/shell1

commit: =

  3597ffc9380329269bb6681aa53a337a79f6d8f8
  f6259fddeda7598394b2a49278091d6c0a576a79

3597ffc938032926 f6259fddeda7598394b2a49278
---------------- --------------------------
         %stddev     %change         %stddev
             \          |                \
      3465 =C2=B1  0%     -27.1%       2525 =C2=B1  1%  unixbench.score
    443336 =C2=B1  0%     -27.3%     322453 =C2=B1  1%  unixbench.time.invo=
luntary_context_switches
  39455165 =C2=B1  0%     -27.5%   28600130 =C2=B1  1%  unixbench.time.mino=
r_page_faults
    138.75 =C2=B1  0%      +1.6%     141.00 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
   1401359 =C2=B1  0%     -29.9%     982981 =C2=B1  1%  unixbench.time.volu=
ntary_context_switches
     21904 =C2=B1  4%      +4.2%      22829 =C2=B1  4%  meminfo.AnonPages
     25212 =C2=B1  2%     -24.5%      19040 =C2=B1  1%  vmstat.system.cs
    443336 =C2=B1  0%     -27.3%     322453 =C2=B1  1%  time.involuntary_co=
ntext_switches
  39455165 =C2=B1  0%     -27.5%   28600130 =C2=B1  1%  time.minor_page_fau=
lts
   1401359 =C2=B1  0%     -29.9%     982981 =C2=B1  1%  time.voluntary_cont=
ext_switches
 1.467e+08 =C2=B1  0%     +19.0%  1.745e+08 =C2=B1  1%  cpuidle.C1E-HSW.time
    197499 =C2=B1  1%     -43.2%     112181 =C2=B1  2%  cpuidle.C1E-HSW.usa=
ge
  44005437 =C2=B1  3%     -45.7%   23875352 =C2=B1  3%  cpuidle.C3-HSW.time
     78137 =C2=B1  4%     -49.8%      39238 =C2=B1  1%  cpuidle.C3-HSW.usage
   1903820 =C2=B1  0%     -21.5%    1494689 =C2=B1  1%  cpuidle.C6-HSW.usage
    118.50 =C2=B1  7%     -34.6%      77.50 =C2=B1  9%  cpuidle.POLL.usage
      8.65 =C2=B1  0%      +6.0%       9.17 =C2=B1  0%  turbostat.%Busy
    276.25 =C2=B1  0%     -19.5%     222.25 =C2=B1  0%  turbostat.Avg_MHz
      3196 =C2=B1  0%     -24.1%       2424 =C2=B1  0%  turbostat.Bzy_MHz
      1.23 =C2=B1  2%     -38.4%       0.76 =C2=B1  3%  turbostat.CPU%c3
     35.83 =C2=B1  0%     -30.8%      24.80 =C2=B1  1%  turbostat.PkgWatt
      0.94 =C2=B1  0%     -90.7%       0.09 =C2=B1 56%  turbostat.RAMWatt
      6236 =C2=B1  1%      +9.9%       6854 =C2=B1  3%  slabinfo.anon_vma.a=
ctive_objs
      6239 =C2=B1  1%      +9.8%       6854 =C2=B1  3%  slabinfo.anon_vma.n=
um_objs
      7840 =C2=B1  1%     -10.8%       6993 =C2=B1  2%  slabinfo.cred_jar.a=
ctive_objs
      7947 =C2=B1  1%     -10.8%       7088 =C2=B1  2%  slabinfo.cred_jar.n=
um_objs
      8423 =C2=B1  6%     -12.8%       7340 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_objs
      8487 =C2=B1  5%     -11.9%       7478 =C2=B1  0%  slabinfo.kmalloc-51=
2.num_objs
      1336 =C2=B1  2%      -8.8%       1218 =C2=B1  2%  slabinfo.pid.active=
_objs
      1336 =C2=B1  2%      -8.8%       1218 =C2=B1  2%  slabinfo.pid.num_ob=
js
      5480 =C2=B1  4%      +4.3%       5715 =C2=B1  4%  proc-vmstat.nr_anon=
_pages
  33498049 =C2=B1  0%     -27.4%   24319823 =C2=B1  1%  proc-vmstat.numa_hit
  33498049 =C2=B1  0%     -27.4%   24319823 =C2=B1  1%  proc-vmstat.numa_lo=
cal
    131905 =C2=B1  0%     -27.3%      95854 =C2=B1  1%  proc-vmstat.pgactiv=
ate
   4110833 =C2=B1  0%     -27.6%    2974572 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
  31686750 =C2=B1  0%     -27.5%   22967091 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
  39558605 =C2=B1  0%     -27.4%   28729898 =C2=B1  1%  proc-vmstat.pgfault
  35793044 =C2=B1  0%     -27.5%   25937428 =C2=B1  1%  proc-vmstat.pgfree
      1473 =C2=B1  1%     -27.8%       1063 =C2=B1  1%  proc-vmstat.thp_def=
erred_split_page
      1473 =C2=B1  1%     -27.8%       1063 =C2=B1  1%  proc-vmstat.thp_fau=
lt_alloc
    195652 =C2=B1 20%     +60.4%     313910 =C2=B1 14%  sched_debug.cpu.avg=
_idle.min
    256685 =C2=B1  7%     -15.0%     218154 =C2=B1  5%  sched_debug.cpu.avg=
_idle.stddev
     13429 =C2=B1 23%     -52.9%       6331 =C2=B1 22%  sched_debug.cpu.cur=
r->pid.avg
     98973 =C2=B1  0%     -57.7%      41828 =C2=B1  6%  sched_debug.cpu.cur=
r->pid.max
     32693 =C2=B1  9%     -55.5%      14545 =C2=B1 11%  sched_debug.cpu.cur=
r->pid.stddev
     14.44 =C2=B1 10%     +19.9%      17.32 =C2=B1  6%  sched_debug.cpu.loa=
d.avg
     29.80 =C2=B1  5%     +10.7%      32.99 =C2=B1  6%  sched_debug.cpu.loa=
d.stddev
      0.00 =C2=B1 15%     +38.0%       0.00 =C2=B1 11%  sched_debug.cpu.nex=
t_balance.stddev
     44538 =C2=B1  0%     -13.1%      38688 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.avg
     34977 =C2=B1  3%     -17.5%      28847 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.min
    147247 =C2=B1  0%     -25.5%     109653 =C2=B1  2%  sched_debug.cpu.nr_=
switches.avg
    191177 =C2=B1  1%     -24.0%     145298 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
    107571 =C2=B1  6%     -27.5%      78011 =C2=B1  1%  sched_debug.cpu.nr_=
switches.min
     28109 =C2=B1  3%     -15.7%      23706 =C2=B1  2%  sched_debug.cpu.nr_=
switches.stddev




                                  unixbench.score

  3500 *+*-*-*-*-*---*---*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--=
-+
       |           *   *                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2500 O+O O O O O O O O O O O O O O O O  O O O O O   O O O   O O O O O O O=
 O
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
       |                                                                   =
 |
     0 ++-------------------------------------------O-------O--------------=
-+


                           unixbench.time.minor_page_faults

    4e+07 *+*-*-*-*-*------*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*--=
-+
          |           *.*.*                                                =
 |
  3.5e+07 ++                                                               =
 |
    3e+07 ++                                                               =
 |
          O O O O O O O O OO O O O O O O O O O O O O   O O O  O O O O O O O=
 O
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
        0 ++-----------------------------------------O------O--------------=
-+


                       unixbench.time.voluntary_context_switches

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 *+*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*  =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
    1e+06 O+O O   O O                              O   O O O  O O   O O O  =
 O
          |     O     O O OO O O O O O O O O O O O                O       O=
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 ++-----------------------------------------O------O--------------=
-+


                     unixbench.time.involuntary_context_switches

  450000 *+*-*-*-*-*-------*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*--=
-+
         |           *.*.*                                                 =
 |
  400000 ++                                                                =
 |
  350000 ++                                                                =
 |
         O O O O O O O O O O O O O O O O O OO O O O   O O O   O O O O O O O=
 O
  300000 ++                                                                =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
   50000 ++                                                                =
 |
         |                                                                 =
 |
       0 ++-----------------------------------------O-------O--------------=
-+


                                time.minor_page_faults

    4e+07 *+*-*-*-*-*------*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*--=
-+
          |           *.*.*                                                =
 |
  3.5e+07 ++                                                               =
 |
    3e+07 ++                                                               =
 |
          O O O O O O O O OO O O O O O O O O O O O O   O O O  O O O O O O O=
 O
  2.5e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
        0 ++-----------------------------------------O------O--------------=
-+


                            time.voluntary_context_switches

  1.6e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 *+*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*  =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
    1e+06 O+O O   O O                              O   O O O  O O   O O O  =
 O
          |     O     O O OO O O O O O O O O O O O                O       O=
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 ++-----------------------------------------O------O--------------=
-+


                          time.involuntary_context_switches

  450000 *+*-*-*-*-*-------*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*--=
-+
         |           *.*.*                                                 =
 |
  400000 ++                                                                =
 |
  350000 ++                                                                =
 |
         O O O O O O O O O O O O O O O O O OO O O O   O O O   O O O O O O O=
 O
  300000 ++                                                                =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
   50000 ++                                                                =
 |
         |                                                                 =
 |
       0 ++-----------------------------------------O-------O--------------=
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
Xiaolong Ye

--===============6485105070218519499==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBvd2Vy
c2F2ZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1p
dDogZjYyNTlmZGRlZGE3NTk4Mzk0YjJhNDkyNzgwOTFkNmMwYTU3NmE3OQptb2RlbDogSGFzd2Vs
bCBIaWdoLWVuZCBEZXNrdG9wCm5yX2NwdTogMTYKbWVtb3J5OiAxNkcKaGRkX3BhcnRpdGlvbnM6
IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKZGVzY3JpcHRpb246IDE2IHRo
cmVhZHMgSGFzd2VsbCBIaWdoLWVuZCBEZXNrdG9wIChpNy01OTYwWCAzLjBHKSB3aXRoIDE2RyBt
ZW1vcnkKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90YXNrOiAxCnVuaXhiZW5jaDoKICB0ZXN0OiBz
aGVsbDEKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsaXR1eWEKdGJveF9ncm91cDogbGl0dXlhCmtj
b25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wNC0yMiAwMjo0MjoxMC4yMTQz
OTc5ODUgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnegppZDogMzBiNjU3MmFhYjA2MjEzNzNmNDc0MDM0ZTdhMTNiOWUyMDgyZjAwNAp1
c2VyOiBsa3AKaGVhZF9jb21taXQ6IGM1Yzg4MTY3MTkzMmZiN2NjNDZlNGQ2YmRjNWRhYWEwZjEw
ODQ2Y2MKYmFzZV9jb21taXQ6IGMzYjQ2YzczMjY0YjAzMDAwZDFlMThiMjJmNWNhZjYzMzMyNTQ3
YzkKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA0MjEwOQpyZXN1bHRfcm9v
dDogIi9yZXN1bHQvdW5peGJlbmNoL3Bvd2Vyc2F2ZS0xLXNoZWxsMS9saXR1eWEvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2Y2MjU5ZmRkZWRhNzU5ODM5
NGIyYTQ5Mjc4MDkxZDZjMGE1NzZhNzkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9saXR1
eWEvYmlzZWN0X3VuaXhiZW5jaC1wb3dlcnNhdmUtMS1zaGVsbDEtZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei14ODZfNjQtcmhlbC1mNjI1OWZkZGVkYTc1OTgzOTRiMmE0OTI3ODA5MWQ2YzBh
NTc2YTc5LTIwMTYwNDIyLTU1NjktMXJ2anhzNi0wLnlhbWwiCm1heF91cHRpbWU6IDEwMjQuOTYK
aW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJv
b3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9z
Y2hlZHVsZWQvbGl0dXlhL2Jpc2VjdF91bml4YmVuY2gtcG93ZXJzYXZlLTEtc2hlbGwxLWRlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtZjYyNTlmZGRlZGE3NTk4Mzk0YjJh
NDkyNzgwOTFkNmMwYTU3NmE3OS0yMDE2MDQyMi01NTY5LTFydmp4czYtMC55YW1sCi0gQVJDSD14
ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhv
dXJseS0yMDE2MDQyMTA5Ci0gY29tbWl0PWY2MjU5ZmRkZWRhNzU5ODM5NGIyYTQ5Mjc4MDkxZDZj
MGE1NzZhNzkKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9mNjI1
OWZkZGVkYTc1OTgzOTRiMmE0OTI3ODA5MWQ2YzBhNTc2YTc5L3ZtbGludXotNC42LjAtcmMxLTAw
MDMxLWdmNjI1OWZkCi0gbWF4X3VwdGltZT0xMDI0Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC91bml4
YmVuY2gvcG93ZXJzYXZlLTEtc2hlbGwxL2xpdHV5YS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3g4Nl82NC1yaGVsL2djYy00LjkvZjYyNTlmZGRlZGE3NTk4Mzk0YjJhNDkyNzgwOTFkNmMw
YTU3NmE3OS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDEx
NTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5
c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBz
b2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1k
aXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5
MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIK
bW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZjYyNTlmZGRl
ZGE3NTk4Mzk0YjJhNDkyNzgwOTFkNmMwYTU3NmE3OS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAi
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xr
cC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3VuaXhiZW5jaC5jZ3oi
CmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2Y2
MjU5ZmRkZWRhNzU5ODM5NGIyYTQ5Mjc4MDkxZDZjMGE1NzZhNzkvbGludXgtaGVhZGVycy5jZ3oi
CnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZjYy
NTlmZGRlZGE3NTk4Mzk0YjJhNDkyNzgwOTFkNmMwYTU3NmE3OS92bWxpbnV6LTQuNi4wLXJjMS0w
MDAzMS1nZjYyNTlmZCIKZGVxdWV1ZV90aW1lOiAyMDE2LTA0LTIyIDAyOjU2OjUxLjA1OTUzMDYz
NiArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxLjM0IDAuNjggMC4yNyAxLzI1
OSAyNjgzMgpzdGFydF90aW1lOiAnMTQ2MTI2NTAzNScKZW5kX3RpbWU6ICcxNDYxMjY1MjI0Jwp2
ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDQyMS0xNzQ3MjciCg==

--===============6485105070218519499==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0yMiAwMjo1NzoxNCBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDI6NTc6MTQgZWNo
byBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTA0LTIyIDAyOjU3OjE0IGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIg
MDI6NTc6MTQgZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwMjo1NzoxNCBlY2hvIHBvd2Vyc2F2
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA0LTIyIDAyOjU3OjE0IGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDI6NTc6MTQg
ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwMjo1NzoxNCBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTIyIDAyOjU3OjE0IGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwMjo1NzoxNCBlY2hvIHBvd2Vy
c2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDQtMjIgMDI6NTc6MTQgZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDAyOjU3OjE0
IGVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwMjo1NzoxNCBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MjIgMDI6NTc6MTQgZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDAyOjU3OjE0IGVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNC0yMiAwMjo1NzoxNCBlY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDI6NTc6MTUg
Li9SdW4gc2hlbGwxIC1jIDEK

--===============6485105070218519499==--

