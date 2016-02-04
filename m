Content-Type: multipart/mixed; boundary="===============0171996745958617904=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched] 0c9ceffc34: +113.2% unixbench.score, +88.1% perf-bench-sched-pipe.ops_per_sec
Date: Thu, 04 Feb 2016 09:39:55 +0800
Message-ID: <87egctdzis.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0171996745958617904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux sched-disable-sch=
edstats-v3r1
commit 0c9ceffc3460e0dd67dd0996bfe90d97771ff6a6 ("sched: Make schedstats a =
runtime tunable that is disabled by default v3")

Part of change may come from latencytop is disabled too.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/nhm-white2/context1=
/unixbench

commit: =

  v4.5-rc1
  0c9ceffc3460e0dd67dd0996bfe90d97771ff6a6

        v4.5-rc1 0c9ceffc3460e0dd67dd0996bf =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1514 =C2=B1  0%    +113.2%       3229 =C2=B1  0%  unixbench.score
     80462 =C2=B1 33%    +491.4%     475819 =C2=B1  9%  unixbench.time.invo=
luntary_context_switches
    388.27 =C2=B1  0%      -3.6%     374.28 =C2=B1  0%  unixbench.time.syst=
em_time
     10.93 =C2=B1  1%    +108.9%      22.83 =C2=B1  0%  unixbench.time.user=
_time
  60435954 =C2=B1  0%    +111.1%  1.276e+08 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    397.30 =C2=B1 20%     +79.0%     711.00 =C2=B1 26%  cpuidle.C1-NHM.usage
   3200280 =C2=B1 39%     -65.8%    1095808 =C2=B1  1%  cpuidle.C3-NHM.time
      7.00 =C2=B1  0%     +14.3%       8.00 =C2=B1  0%  vmstat.procs.r
    906365 =C2=B1  2%    +113.9%    1938512 =C2=B1  0%  vmstat.system.cs
     80462 =C2=B1 33%    +491.4%     475819 =C2=B1  9%  time.involuntary_co=
ntext_switches
     10.93 =C2=B1  1%    +108.9%      22.83 =C2=B1  0%  time.user_time
  60435954 =C2=B1  0%    +111.1%  1.276e+08 =C2=B1  0%  time.voluntary_cont=
ext_switches
      0.95 =C2=B1 22%     -35.5%       0.61 =C2=B1 18%  turbostat.CPU%c1
      0.51 =C2=B1 42%     -68.4%       0.16 =C2=B1  4%  turbostat.CPU%c3
      1.04 =C2=B1 51%     -73.5%       0.28 =C2=B1  9%  turbostat.Pkg%pc3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/loops/mode/rootfs/tbox_group/testcase:
  gcc-4.9/performance/x86_64-rhel/10000000ops/process/debian-x86_64-2015-02=
-07.cgz/lkp-bdw01/perf-bench-sched-pipe

commit: =

  v4.5-rc1
  0c9ceffc3460e0dd67dd0996bfe90d97771ff6a6

        v4.5-rc1 0c9ceffc3460e0dd67dd0996bf =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     96795 =C2=B1  0%     +88.1%     182087 =C2=B1  0%  perf-bench-sched-pi=
pe.ops_per_sec
    103.32 =C2=B1  0%     -46.8%      54.92 =C2=B1  0%  perf-bench-sched-pi=
pe.time.elapsed_time
    103.32 =C2=B1  0%     -46.8%      54.92 =C2=B1  0%  perf-bench-sched-pi=
pe.time.elapsed_time.max
    162.86 =C2=B1  0%     -18.5%     132.75 =C2=B1  0%  perf-bench-sched-pi=
pe.time.percent_of_cpu_this_job_got
    165.06 =C2=B1  1%     -56.6%      71.69 =C2=B1  0%  perf-bench-sched-pi=
pe.time.system_time
    123.34 =C2=B1  0%     -39.0%      75.19 =C2=B1  0%  uptime.boot
    373.78 =C2=B1  0%     -38.4%     230.36 =C2=B1  1%  uptime.idle
    377958 =C2=B1  0%     +84.9%     698794 =C2=B1  0%  vmstat.system.cs
      2330 =C2=B1 17%    +545.9%      15051 =C2=B1  9%  vmstat.system.in
     23710 =C2=B1 84%     -67.4%       7725 =C2=B1 19%  softirqs.RCU
     58220 =C2=B1  6%     -44.7%      32185 =C2=B1  0%  softirqs.SCHED
     85302 =C2=B1  6%     -32.5%      57603 =C2=B1  0%  softirqs.TIMER
    103.32 =C2=B1  0%     -46.8%      54.92 =C2=B1  0%  time.elapsed_time
    103.32 =C2=B1  0%     -46.8%      54.92 =C2=B1  0%  time.elapsed_time.m=
ax
    162.86 =C2=B1  0%     -18.5%     132.75 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    165.06 =C2=B1  1%     -56.6%      71.69 =C2=B1  0%  time.system_time
      3.66 =C2=B1  8%     -57.5%       1.56 =C2=B1  7%  time.user_time
     51.24 =C2=B1  1%     +13.9%      58.36 =C2=B1  1%  turbostat.%Busy
      1124 =C2=B1  1%     +13.9%       1280 =C2=B1  1%  turbostat.Avg_MHz
     29.20 =C2=B1  6%     -26.1%      21.58 =C2=B1 11%  turbostat.CPU%c7
      4.30 =C2=B1  0%     +12.5%       4.83 =C2=B1  1%  turbostat.CorWatt
      6.00 =C2=B1  0%      +8.1%       6.49 =C2=B1  1%  turbostat.PkgWatt
    106097 =C2=B1  0%     -41.4%      62186 =C2=B1  0%  proc-vmstat.numa_hit
    106097 =C2=B1  0%     -41.4%      62186 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     75307 =C2=B1  0%     -41.3%      44239 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
     35761 =C2=B1  0%     -41.1%      21078 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
    125687 =C2=B1  0%     -41.4%      73686 =C2=B1  0%  proc-vmstat.pgfault
    108857 =C2=B1  0%     -42.0%      63107 =C2=B1  0%  proc-vmstat.pgfree
  17894873 =C2=B1 18%     -85.3%    2623742 =C2=B1 36%  cpuidle.C1-BDW.time
   3765284 =C2=B1  8%     -99.9%       4200 =C2=B1  3%  cpuidle.C1-BDW.usage
      1755 =C2=B1110%     -64.9%     616.75 =C2=B1 10%  cpuidle.C1E-BDW.usa=
ge
      3915 =C2=B1166%     -80.4%     765.75 =C2=B1  9%  cpuidle.C3-BDW.usage
      1611 =C2=B1186%     -86.7%     214.50 =C2=B1  5%  cpuidle.C6-BDW.usage
   8089687 =C2=B1 59%     -75.0%    2024751 =C2=B1 28%  cpuidle.C7s-BDW.time
      5195 =C2=B1173%     -84.4%     811.75 =C2=B1  2%  cpuidle.C7s-BDW.usa=
ge
      4308 =C2=B1 94%     -71.7%       1221 =C2=B1  5%  cpuidle.C8-BDW.usage
  39471496 =C2=B1103%     -68.0%   12634953 =C2=B1 28%  cpuidle.C9-BDW.time
      8325 =C2=B1195%     -90.7%     770.50 =C2=B1  5%  cpuidle.C9-BDW.usage
  46685007 =C2=B1  8%     -51.1%   22808700 =C2=B1 11%  cpuidle.POLL.time
  16152326 =C2=B1  1%     -60.2%    6434419 =C2=B1 12%  cpuidle.POLL.usage


nhm-white2: Nehalem
Memory: 4G

lkp-bdw01: Broadwell ULT
Memory: 4G

                          perf-bench-sched-pipe.ops_per_sec

  200000 ++----------------------------------------------------------------=
-+
  180000 O+O O  O O O O  O O O O  O O O O  O O O O O  O                    =
 |
         |                                                                 =
 |
  160000 ++                                                                =
 |
  140000 ++                                                                =
 |
         |                                                                 =
 |
  120000 ++                                                                =
 |
  100000 *+*    *.*.*.*..*.*.*.*..*   *.*..*.*.*.*.*..*.*.*.*..*.*.*.*..*.*=
.*
   80000 ++:    :                 :   :                                    =
 |
         |  :  :                   : :                                     =
 |
   60000 ++ :  :                   : :                                     =
 |
   40000 ++ : :                    : :                                     =
 |
         |  : :                    : :                                     =
 |
   20000 ++  :                      :                                      =
 |
       0 ++--*----------------------*--------------------------------------=
-+


                      perf-bench-sched-pipe.time.system_time

  180 ++-------------------------------------------------------------------=
-+
      *.*        .*.*.*..*.*.*..*   *..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*=
.*
  160 ++:    *.*.               :   :                                      =
 |
  140 ++:    :                  :   :                                      =
 |
      |  :   :                  :   :                                      =
 |
  120 ++ :   :                   : :                                       =
 |
  100 ++ :  :                    : :                                       =
 |
      |  :  :                    : :                                       =
 |
   80 ++  : :     O   O  O O O  O: :O  O O O  O O O  O                     =
 |
   60 O+O :O:O O    O            :O:                                       =
 |
      |   : :                    : :                                       =
 |
   40 ++  : :                     :                                        =
 |
   20 ++   :                      :                                        =
 |
      |    :                      :                                        =
 |
    0 ++---*----------------------*----------------------------------------=
-+


              perf-bench-sched-pipe.time.percent_of_cpu_this_job_got

  180 ++-------------------------------------------------------------------=
-+
      *.*    *.*..*.*.*..*.*.*..*   *..*.*.*..*.*.*..*.*.*..*.*.*..*.*.*..*=
.*
  160 ++:    :                  :   :                                      =
 |
  140 ++:    :                  :   :                                      =
 |
      O O: O O O  O O O  O O O  O O O  O O O  O O O  O                     =
 |
  120 ++ :  :                    : :                                       =
 |
  100 ++ :  :                    : :                                       =
 |
      |  :  :                    : :                                       =
 |
   80 ++  : :                    : :                                       =
 |
   60 ++  : :                    : :                                       =
 |
      |   : :                    : :                                       =
 |
   40 ++  ::                      :                                        =
 |
   20 ++   :                      :                                        =
 |
      |    :                      :                                        =
 |
    0 ++---*----------------------*----------------------------------------=
-+


                                  unixbench.score

  3600 ++------------------------------------------------------------------=
-+
  3400 ++           O O O O O                                              =
 |
       O O O O               O O O O O O OO O                              =
 |
  3200 ++     O O O                                                        =
 |
  3000 ++                                                                  =
 |
  2800 ++                                                                  =
 |
  2600 ++                                                                  =
 |
       |                                                                   =
 |
  2400 ++                                                                  =
 |
  2200 ++                                                                  =
 |
  2000 ++                                                                  =
 |
  1800 ++                                                                  =
 |
       |                                                                   =
 |
  1600 *+*.*.**.*.*.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.*.*.**.*.*=
.*
  1400 ++------------------------------------------------------------------=
-+


                            unixbench.time.user_time

  24 ++--------------------------------------------------------------------=
-+
     |           O        O   O O O O O OO O                               =
 |
  22 O+  O     O  O O O O   O                                              =
 |
     | O   O                                                               =
 |
  20 ++      O                                                             =
 |
     |                                                                     =
 |
  18 ++                                                                    =
 |
     |                                                                     =
 |
  16 ++                                                                    =
 |
     |                                                                     =
 |
  14 ++                                                                    =
 |
     |               .*.                                                   =
 |
  12 ++         .**.*   *.       .*.                                       =
 |
     *.*.*.*.*.*          *.*.*.*   *.*.**.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*=
.*
  10 ++--------------------------------------------------------------------=
-+


                            unixbench.time.system_time

  390 ++-------------------------------------------------------------------=
-+
      *. .*.*.**.*.*.   .*.*.*.**. .*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.**.*.*.*=
.*
      | *            *.*          *                                        =
 |
  385 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  380 ++                                                                   =
 |
      |              O O     O                                             =
 |
  375 O+                 O O   OO     O O                                  =
 |
      |   O O    O O                O       O                              =
 |
      |        O                  O       O                                =
 |
  370 ++O                                                                  =
 |
      |                                                                    =
 |
      |       O                                                            =
 |
  365 ++-------------------------------------------------------------------=
-+


                       unixbench.time.voluntary_context_switches

  1.4e+08 ++---------------------------------------------------------------=
-+
          |           O O O O OO                                           =
 |
  1.3e+08 O+  OO                 O O O OO O O O                            =
 |
  1.2e+08 ++O    O O O                                                     =
 |
          |                                                                =
 |
  1.1e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
    9e+07 ++                                                               =
 |
    8e+07 ++                                                               =
 |
          |                                                                =
 |
    7e+07 ++                                                               =
 |
          *.*.* .*.*.**.   .*.**.*.*.*.**.                                 =
 |
    6e+07 ++---*--------*-*---------------*-*-**-*-*-*-**-*-*-*-**-*-*-**-*=
-*

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
Ying Huang

--===============0171996745958617904==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDBjOWNlZmZjMzQ2MGUwZGQ2N2Rk
MDk5NmJmZTkwZDk3NzcxZmY2YTYKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA0Rwpucl9jcHU6IDgK
aGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0
Y29uc29sZV9wb3J0OiA2NjcxCmNhdGVnb3J5OiBiZW5jaG1hcmsKbnJfdGFzazogMTAwJQp1bml4
YmVuY2g6CiAgdGVzdDogY29udGV4dDEKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBuaG0td2hpdGUy
CnRib3hfZ3JvdXA6IG5obS13aGl0ZTIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1l
OiAyMDE2LTAyLTAzIDA5OjQ5OjM0LjAyODUzMjQyNCArMDg6MDAKaWQ6IGExYTExMDJlOTk3Yjc2
NTJkZWQyNGM5YWQxYTliNDYyNDc3OTRkZGMKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45Cmhl
YWRfY29tbWl0OiA0NmQ4NDI1MmZjNTQ5NTk5NTc4MjRhNTEyZmVhYmQxOWI3NjNlZjRkCmJhc2Vf
Y29tbWl0OiAzNmY5MGIwYTJkZGQ2MDgyM2ZlMTkzYTg1ZTYwZmYxOTA2YzJhOWIzCmJyYW5jaDog
bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMjAyMTkKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC91bml4YmVuY2gvMTAwJS1jb250
ZXh0MS9uaG0td2hpdGUyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS8wYzljZWZmYzM0NjBlMGRkNjdkZDA5OTZiZmU5MGQ5Nzc3MWZmNmE2LzAiCmpvYl9m
aWxlOiAiL2xrcC9zY2hlZHVsZWQvbmhtLXdoaXRlMi9iaXNlY3RfdW5peGJlbmNoLTEwMCUtY29u
dGV4dDEtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0wYzljZWZmYzM0
NjBlMGRkNjdkZDA5OTZiZmU5MGQ5Nzc3MWZmNmE2LTIwMTYwMjAzLTU4ODY5LXM3ODZoYy0wLnlh
bWwiCm1heF91cHRpbWU6IDg5Ni44Mzk5OTk5OTk5OTk5CmluaXRyZDogIi9vc2ltYWdlL2RlYmlh
bi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290
PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL25obS13aGl0ZTIvYmlz
ZWN0X3VuaXhiZW5jaC0xMDAlLWNvbnRleHQxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ot
eDg2XzY0LXJoZWwtMGM5Y2VmZmMzNDYwZTBkZDY3ZGQwOTk2YmZlOTBkOTc3NzFmZjZhNi0yMDE2
MDIwMy01ODg2OS1zNzg2aGMtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1y
aGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDIwMjE5Ci0gY29tbWl0
PTBjOWNlZmZjMzQ2MGUwZGQ2N2RkMDk5NmJmZTkwZDk3NzcxZmY2YTYKLSBCT09UX0lNQUdFPS9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wYzljZWZmYzM0NjBlMGRkNjdkZDA5OTZiZmU5
MGQ5Nzc3MWZmNmE2L3ZtbGludXotNC41LjAtcmMxLTAwMDAxLWcwYzljZWZmCi0gbWF4X3VwdGlt
ZT04OTYKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3VuaXhiZW5jaC8xMDAlLWNvbnRleHQxL25obS13
aGl0ZTIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzBj
OWNlZmZjMzQ2MGUwZGQ2N2RkMDk5NmJmZTkwZDk3NzcxZmY2YTYvMAotIExLUF9TRVJWRVI9aW5u
Ci0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJy
CiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1
X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRj
aGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBj
b25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5p
dHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45LzBjOWNlZmZjMzQ2MGUwZGQ2N2RkMDk5NmJmZTkwZDk3Nzcx
ZmY2YTYvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6
LC9sa3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wYzljZWZmYzM0NjBlMGRkNjdkZDA5OTZiZmU5
MGQ5Nzc3MWZmNmE2L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzBjOWNlZmZjMzQ2MGUwZGQ2N2RkMDk5NmJmZTkw
ZDk3NzcxZmY2YTYvdm1saW51ei00LjUuMC1yYzEtMDAwMDEtZzBjOWNlZmYiCmRlcXVldWVfdGlt
ZTogMjAxNi0wMi0wMyAwOTo1MjoxMy4yMDE4MzU0MzggKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogNi44MiAyLjY5IDEuMDAgMS8xNjYgMjg5MwpzdGFydF90aW1lOiAnMTQ1NDQ2
NDM1NycKZW5kX3RpbWU6ICcxNDU0NDY0NDg3Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2
MDIwMy0wOTIyMjkiCg==

--===============0171996745958617904==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0wMyAwOTo1MjozNyAuL1J1biBjb250ZXh0MSAtYyA4Cg==

--===============0171996745958617904==--

