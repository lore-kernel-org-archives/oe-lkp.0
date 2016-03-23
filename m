Content-Type: multipart/mixed; boundary="===============8700270979189582148=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched, fair] dabbd61e79: No primary result change, -25.5% unixbench.time.involuntary_context_switches
Date: Wed, 23 Mar 2016 09:39:04 +0800
Message-ID: <20160323013904.GC27992@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8700270979189582148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that unixbench.time.involuntary_context_switches -25.5% cha=
nge with your commit.

https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urge=
nt
commit dabbd61e79c918f1d8a31598a678bc04e042faf8 ("sched,fair: Fix fairness =
issue on migrate")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/lkp-ivb=
-d01/shell1/unixbench

commit: =

  8ddfc624ef1cf17d19983350e3aa1c413eca98b2
  dabbd61e79c918f1d8a31598a678bc04e042faf8

8ddfc624ef1cf17d dabbd61e79c918f1d8a31598a6 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
         %stddev     %change         %stddev
             \          |                \  =

   2657847 =C2=B1  0%     -25.5%    1981056 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
   5863552 =C2=B1  0%      -9.9%    5283600 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
   2657847 =C2=B1  0%     -25.5%    1981056 =C2=B1  0%  time.involuntary_co=
ntext_switches
   5863552 =C2=B1  0%      -9.9%    5283600 =C2=B1  0%  time.voluntary_cont=
ext_switches
     61338 =C2=B1  0%     -12.6%      53619 =C2=B1  0%  vmstat.system.cs
     11328 =C2=B1  0%      -4.1%      10864 =C2=B1  0%  vmstat.system.in
   2509602 =C2=B1  3%     +14.4%    2870105 =C2=B1  1%  cpuidle.C3-IVB.time
     40796 =C2=B1  1%      +8.3%      44163 =C2=B1  3%  cpuidle.C3-IVB.usage
      9140 =C2=B1  9%     -42.7%       5234 =C2=B1  8%  cpuidle.POLL.usage
      0.31 =C2=B1 10%     -20.0%       0.25 =C2=B1  0%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
     34.51 =C2=B1  3%      +8.7%      37.52 =C2=B1  1%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
      9627 =C2=B1 11%     +25.2%      12056 =C2=B1  6%  sched_debug.cpu.cur=
r->pid.avg
     11046 =C2=B1  6%     +24.3%      13726 =C2=B1  4%  sched_debug.cpu.cur=
r->pid.max
     696919 =C2=B1  0%     -12.4%     610359 =C2=B1  0%  sched_debug.cpu.nr=
_switches.avg
    721494 =C2=B1  1%     -13.1%     626954 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
    679371 =C2=B1  0%     -11.7%     599806 =C2=B1  0%  sched_debug.cpu.nr_=
switches.min
     13857 =C2=B1 18%     -29.8%       9733 =C2=B1  3%  sched_debug.cpu.nr_=
switches.stddev
     46.75 =C2=B1 79%    -137.4%     -17.50 =C2=B1-151%  sched_debug.cpu.nr=
_uninterruptible.4
     79.19 =C2=B1 27%     -39.2%      48.12 =C2=B1 18%  sched_debug.cpu.nr_=
uninterruptible.max
    -76.06 =C2=B1-25%     -31.9%     -51.81 =C2=B1-15%  sched_debug.cpu.nr_=
uninterruptible.min
     49.98 =C2=B1 15%     -30.5%      34.74 =C2=B1 18%  sched_debug.cpu.nr_=
uninterruptible.stddev
    701565 =C2=B1  0%     -12.4%     614787 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
    749766 =C2=B1  0%     -12.3%     657902 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.max
    679732 =C2=B1  0%     -11.7%     600230 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.min
     22192 =C2=B1  7%     -17.7%      18262 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.stddev
    304372 =C2=B1  0%     -13.1%     264622 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
    317048 =C2=B1  1%     -13.8%     273189 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.max
    295849 =C2=B1  0%     -12.1%     260075 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.min
      6882 =C2=B1 20%     -38.3%       4248 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.stddev
    220538 =C2=B1  0%     -15.7%     185970 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
    229084 =C2=B1  1%     -16.4%     191577 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.max
    215432 =C2=B1  0%     -14.9%     183288 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.min
      4627 =C2=B1 28%     -41.3%       2717 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.stddev


lkp-ivb-d01: Ivy Bridge
Memory: 16G



                       pigz.time.involuntary_context_switches

  270000 ++----------------------------------------------------------------=
-+
  260000 ++                                              .*..              =
 |
         *..           .*..         .*..*..    .*.*..*.*.     .*..*.*..    =
 *
  250000 ++ *.  .*.*..*    *..*.  .*        .*.              *         *. .=
.|
  240000 ++   *.                *.         *                             * =
 |
         |                                                                 =
 |
  230000 ++                                                                =
 |
  220000 ++                                                                =
 |
  210000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  190000 ++             O                       O         O                =
 |
         O  O    O O  O    O  O O  O O  O  O O    O  O O     O             =
 |
  180000 ++   O                                                            =
 |
  170000 ++----------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  270000 ++----------------------------------------------------------------=
-+
  260000 ++                                              .*..              =
 |
         *..           .*..         .*..*..    .*.*..*.*.     .*..*.*..    =
 *
  250000 ++ *.  .*.*..*    *..*.  .*        .*.              *         *. .=
.|
  240000 ++   *.                *.         *                             * =
 |
         |                                                                 =
 |
  230000 ++                                                                =
 |
  220000 ++                                                                =
 |
  210000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  190000 ++             O                       O         O                =
 |
         O  O    O O  O    O  O O  O O  O  O O    O  O O     O             =
 |
  180000 ++   O                                                            =
 |
  170000 ++----------------------------------------------------------------=
-+



                       unixbench.time.voluntary_context_switches

  5.9e+06 ++-----------------*---------------------**--------**---*--------=
-+
          *.**.*.**.*.*.**.*  *.*.**.*.**.*.*.**.*    *.**.*    *  +  .*.**=
.*
  5.8e+06 ++                                                        **     =
 |
          |                                                                =
 |
  5.7e+06 ++                                                               =
 |
          |                                                                =
 |
  5.6e+06 ++                                                               =
 |
          |                                                                =
 |
  5.5e+06 ++                                                               =
 |
          |                                                                =
 |
  5.4e+06 ++                                                               =
 |
          |                                                                =
 |
  5.3e+06 O+ O   OO O O OO        OO O OO O O O                            =
 |
          | O  O           O OO O                                          =
 |
  5.2e+06 ++---------------------------------------------------------------=
-+


                      unixbench.time.involuntary_context_switches

  2.7e+06 ++---------------------------------------------------------------=
-+
          *.**.*.**.*.*.**.*.**.*.**.*.**.*.*.**.*.**.*.**.*.**.*.*.**.*.**=
.*
  2.6e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
  2.4e+06 ++                                                               =
 |
          |                                                                =
 |
  2.3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.2e+06 ++                                                               =
 |
  2.1e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++        O              O   O  O   O                            =
 |
          O OO O OO   O OO O OO O O  O  O   O                              =
 |
  1.9e+06 ++---------------------------------------------------------------=
-+


                            time.voluntary_context_switches

  5.9e+06 ++-----------------*---------------------**--------**---*--------=
-+
          *.**.*.**.*.*.**.*  *.*.**.*.**.*.*.**.*    *.**.*    *  +  .*.**=
.*
  5.8e+06 ++                                                        **     =
 |
          |                                                                =
 |
  5.7e+06 ++                                                               =
 |
          |                                                                =
 |
  5.6e+06 ++                                                               =
 |
          |                                                                =
 |
  5.5e+06 ++                                                               =
 |
          |                                                                =
 |
  5.4e+06 ++                                                               =
 |
          |                                                                =
 |
  5.3e+06 O+ O   OO O O OO        OO O OO O O O                            =
 |
          | O  O           O OO O                                          =
 |
  5.2e+06 ++---------------------------------------------------------------=
-+


                           time.involuntary_context_switches

  2.7e+06 ++---------------------------------------------------------------=
-+
          *.**.*.**.*.*.**.*.**.*.**.*.**.*.*.**.*.**.*.**.*.**.*.*.**.*.**=
.*
  2.6e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
  2.4e+06 ++                                                               =
 |
          |                                                                =
 |
  2.3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.2e+06 ++                                                               =
 |
  2.1e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++        O              O   O  O   O                            =
 |
          O OO O OO   O OO O OO O O  O  O   O                              =
 |
  1.9e+06 ++---------------------------------------------------------------=
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
Xiaolong.

--===============8700270979189582148==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnegpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2bXN0YXQ6IAog
IG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mt
dm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFi
aW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBz
b2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAog
IGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBz
Y2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5j
ZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDog
ZGFiYmQ2MWU3OWM5MThmMWQ4YTMxNTk4YTY3OGJjMDRlMDQyZmFmOAptb2RlbDogQnJvYWR3ZWxs
LUVQCm1lbW9yeTogMTI4Rwpucl9zc2RfcGFydGl0aW9uczogMQpzc2RfcGFydGl0aW9uczogIi9k
ZXYvbnZtZTBuMXAxIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKcG1ldGVy
X3NlcnZlcjogbGtwLW9zCnBtZXRlcl9kZXZpY2U6IHlva29nYXdhLXd0MzEwCmNhdGVnb3J5OiBi
ZW5jaG1hcmsKcGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMApucl90aHJlYWRzOiAxMDAlCnBpZ3o6
CiAgYmxvY2tzaXplOiAxMjhLCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbGtwLWJkdy1lcDIKdGJv
eF9ncm91cDogbGtwLWJkdy1lcDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAy
MDE2LTAzLTIyIDE2OjAwOjM5LjM5ODYzNzcxMCArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9v
dGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiA5NTEwNjQ0NDljYzhkMTczYzM3
NmI4ZWVlZDY2YzZiMmEyZWYxOWU1CnVzZXI6IGxrcApoZWFkX2NvbW1pdDogMDAyNDU4NGU3ZmVl
YWNjNjgzZjE1YjEyMGFkYmVmZDI3ZTUzODI1MApiYXNlX2NvbW1pdDogYjU2MmU0NGY1MDdlODYz
YzY3OTI5NDZlNGUxYjE0NDlmYmJhYzg1ZApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJs
eS0yMDE2MDMyMDA1CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9waWd6L3BlcmZvcm1hbmNlLTEwMCUt
MTI4Sy9sa3AtYmR3LWVwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2djYy00LjkvZGFiYmQ2MWU3OWM5MThmMWQ4YTMxNTk4YTY3OGJjMDRlMDQyZmFmOC8wIgpqb2Jf
ZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1iZHctZXAyL2Jpc2VjdF9waWd6LXBlcmZvcm1hbmNl
LTEwMCUtMTI4Sy1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWRhYmJk
NjFlNzljOTE4ZjFkOGEzMTU5OGE2NzhiYzA0ZTA0MmZhZjgtMjAxNjAzMjItOTQ5MjktMTU2d21o
MS0wLnlhbWwiCm5yX2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiAxMjc3LjAyCmluaXRyZDog
Ii9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVy
X2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVk
L2xrcC1iZHctZXAyL2Jpc2VjdF9waWd6LXBlcmZvcm1hbmNlLTEwMCUtMTI4Sy1kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWRhYmJkNjFlNzljOTE4ZjFkOGEzMTU5OGE2
NzhiYzA0ZTA0MmZhZjgtMjAxNjAzMjItOTQ5MjktMTU2d21oMS0wLnlhbWwKLSBBUkNIPXg4Nl82
NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5
LTIwMTYwMzIwMDUKLSBjb21taXQ9ZGFiYmQ2MWU3OWM5MThmMWQ4YTMxNTk4YTY3OGJjMDRlMDQy
ZmFmOAotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2RhYmJkNjFl
NzljOTE4ZjFkOGEzMTU5OGE2NzhiYzA0ZTA0MmZhZjgvdm1saW51ei00LjUuMC1yYzYtMDAwMDUt
Z2RhYmJkNjEKLSBtYXhfdXB0aW1lPTEyNzcKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3BpZ3ovcGVy
Zm9ybWFuY2UtMTAwJS0xMjhLL2xrcC1iZHctZXAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9kYWJiZDYxZTc5YzkxOGYxZDhhMzE1OThhNjc4YmMwNGUw
NDJmYWY4LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1
MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlz
X2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNv
ZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRp
c2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkw
IHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igpt
b2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9kYWJiZDYxZTc5
YzkxOGYxZDhhMzE1OThhNjc4YmMwNGUwNDJmYWY4L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtw
L2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovcGlnei5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45L2RhYmJkNjFlNzljOTE4ZjFkOGEzMTU5OGE2NzhiYzA0ZTA0MmZh
ZjgvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvZGFiYmQ2MWU3OWM5MThmMWQ4YTMxNTk4YTY3OGJjMDRlMDQyZmFm
OC92bWxpbnV6LTQuNS4wLXJjNi0wMDAwNS1nZGFiYmQ2MSIKZGVxdWV1ZV90aW1lOiAyMDE2LTAz
LTIyIDE2OjA1OjEyLjc1MDQ0NjYyMiArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZn
OiA1Ny4zOSA0MS44MyAxOC44MCA3LzgyOCA5NzEyCnN0YXJ0X3RpbWU6ICcxNDU4NjMzOTY1Jwpl
bmRfdGltZTogJzE0NTg2MzQyNjUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMzIyLTEz
MDQwMCIK

--===============8700270979189582148==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIg
MTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6
MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjow
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIg
MTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6
MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6
MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIy
IDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6
MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6
MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIy
IDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjQvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2
OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ni9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2
OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcxL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0y
MiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTgwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2
OjA2OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTgzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2
OjA0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4NC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTYtMDMtMjIgMTY6MDY6MDQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTg2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIyIDE2OjA2OjA0
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ny9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMiAxNjowNjowNCBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK

--===============8700270979189582148==--

