Content-Type: multipart/mixed; boundary="===============8534206927818657504=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] 1732e8d84b: -6.4% will-it-scale.per_process_ops
Date: Thu, 27 Aug 2015 08:36:44 +0800
Message-ID: <87io81bm8z.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8534206927818657504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git master
commit 1732e8d84b5fa950d6533284dcc63dfee93e39f1 ("mm: gup: make get_user_pa=
ges_fast and __get_user_pages_fast latency conscious")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  lkp-sb03/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/f=
utex1

commit: =

  7201f254ee6b51b1549ecec1cffe4d59b3e53935
  1732e8d84b5fa950d6533284dcc63dfee93e39f1

7201f254ee6b51b1 1732e8d84b5fa950d6533284dc =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5363330 =C2=B1  0%      -6.4%    5021398 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1810294 =C2=B1  0%      -5.0%    1720041 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    209850 =C2=B1  5%     +13.0%     237196 =C2=B1  4%  cpuidle.C1-SNB.usage
     53.75 =C2=B1 62%    -100.9%      -0.50 =C2=B1-1300%  numa-numastat.nod=
e0.other_node
      0.00 =C2=B1 -1%      +Inf%       1.11 =C2=B1  3%  perf-profile.cpu-cy=
cles.___might_sleep.get_user_pages_fast.get_futex_key.futex_wake.do_futex
      2791 =C2=B1  2%     +15.8%       3231 =C2=B1  1%  vmstat.system.cs
    290504 =C2=B1  2%     +16.8%     339313 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   4203979 =C2=B1  0%      +5.3%    4424982 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      2941 =C2=B1 15%     -23.0%       2266 =C2=B1 11%  numa-vmstat.node0.n=
r_anon_pages
      3377 =C2=B1 13%     +19.7%       4040 =C2=B1  6%  numa-vmstat.node1.n=
r_anon_pages
      2090 =C2=B1 27%     +49.7%       3129 =C2=B1  0%  numa-vmstat.node1.n=
r_mapped
     11769 =C2=B1 15%     -22.9%       9070 =C2=B1 11%  numa-meminfo.node0.=
AnonPages
     13509 =C2=B1 13%     +19.7%      16167 =C2=B1  6%  numa-meminfo.node1.=
AnonPages
      2457 =C2=B1  1%      +8.9%       2675 =C2=B1  3%  numa-meminfo.node1.=
KernelStack
      8363 =C2=B1 27%     +49.7%      12519 =C2=B1  0%  numa-meminfo.node1.=
Mapped
     11075 =C2=B1 24%     +95.4%      21637 =C2=B1 17%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
     37436 =C2=B1 10%     +29.7%      48571 =C2=B1 11%  sched_debug.cfs_rq[=
24]:/.exec_clock
    854911 =C2=B1 11%     +25.9%    1076265 =C2=B1  9%  sched_debug.cfs_rq[=
24]:/.min_vruntime
    241.25 =C2=B1 24%     +95.4%     471.50 =C2=B1 16%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
     12705 =C2=B1 27%     -32.3%       8597 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.avg->runnable_avg_sum
     40588 =C2=B1 13%     -13.7%      35043 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.exec_clock
    276.00 =C2=B1 27%     -32.3%     186.75 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.tg_runnable_contrib
    631.75 =C2=B1101%     -71.4%     180.75 =C2=B1164%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    689.75 =C2=B1 96%     -68.1%     220.00 =C2=B1134%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      4.50 =C2=B1 57%     -94.4%       0.25 =C2=B1173%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
     23334 =C2=B1 10%     -41.3%      13699 =C2=B1 18%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
    508.50 =C2=B1 10%     -41.6%     296.75 =C2=B1 18%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     36.75 =C2=B1  1%     +15.6%      42.50 =C2=B1 11%  sched_debug.cpu#1.c=
pu_load[0]
      7238 =C2=B1 31%    +167.1%      19330 =C2=B1 16%  sched_debug.cpu#1.n=
r_switches
      8723 =C2=B1 23%    +147.9%      21622 =C2=B1 10%  sched_debug.cpu#1.s=
ched_count
      3283 =C2=B1 33%    +179.5%       9179 =C2=B1 18%  sched_debug.cpu#1.s=
ched_goidle
     31624 =C2=B1 30%     -44.4%      17585 =C2=B1 12%  sched_debug.cpu#11.=
sched_count
      1170 =C2=B1 32%     +84.8%       2163 =C2=B1 27%  sched_debug.cpu#18.=
sched_goidle
      8659 =C2=B1 35%    +158.8%      22411 =C2=B1 18%  sched_debug.cpu#2.n=
r_switches
     10200 =C2=B1 44%    +200.8%      30686 =C2=B1 38%  sched_debug.cpu#2.s=
ched_count
      4063 =C2=B1 38%    +167.8%      10881 =C2=B1 18%  sched_debug.cpu#2.s=
ched_goidle
      2.00 =C2=B1154%     +37.5%       2.75 =C2=B1 39%  sched_debug.cpu#21.=
nr_uninterruptible
     57326 =C2=B1  6%     +16.9%      67039 =C2=B1  7%  sched_debug.cpu#24.=
nr_load_updates
     62286 =C2=B1  4%      -8.8%      56812 =C2=B1  4%  sched_debug.cpu#25.=
nr_load_updates
      5467 =C2=B1 46%    +315.6%      22723 =C2=B1 49%  sched_debug.cpu#26.=
nr_switches
      5588 =C2=B1 45%    +312.3%      23036 =C2=B1 48%  sched_debug.cpu#26.=
sched_count
      2274 =C2=B1 57%    +357.8%      10412 =C2=B1 57%  sched_debug.cpu#26.=
sched_goidle
      2440 =C2=B1 29%     -58.6%       1011 =C2=B1 20%  sched_debug.cpu#27.=
ttwu_local
     39.25 =C2=B1  1%      +7.0%      42.00 =C2=B1  2%  sched_debug.cpu#3.c=
pu_load[3]
      4907 =C2=B1 50%    +215.8%      15497 =C2=B1 49%  sched_debug.cpu#5.n=
r_switches
      2213 =C2=B1 53%    +239.4%       7512 =C2=B1 51%  sched_debug.cpu#5.s=
ched_goidle
    370.00 =C2=B1 13%     +97.0%     728.75 =C2=B1 23%  sched_debug.cpu#6.t=
twu_local
    882811 =C2=B1  2%     +12.7%     995138 =C2=B1  0%  sched_debug.cpu#9.a=
vg_idle


lkp-sb03: Sandy Bridge-EP
Memory: 64G


                             will-it-scale.per_process_ops

   5.4e+06 ++--------------------------------------------------------------=
-+
           *..*...*..*..                      .*..*..*...*..     .*...*..*.=
.*
  5.35e+06 ++           *..*...*..*..*..*...*.              *..*.          =
 |
   5.3e+06 ++                                                              =
 |
           |                                                               =
 |
  5.25e+06 ++                                                              =
 |
   5.2e+06 ++                                                              =
 |
           |                                                               =
 |
  5.15e+06 ++                                                              =
 |
   5.1e+06 ++                                                              =
 |
           |               O   O     O      O                              =
 |
  5.05e+06 ++                     O     O      O     O                   O =
 |
     5e+06 ++ O   O     O                         O      O  O  O  O   O    =
 O
           O         O                                                     =
 |
  4.95e+06 ++--------------------------------------------------------------=
-+


                             will-it-scale.per_thread_ops

  1.82e+06 ++---------------------------------------------------------*----=
-+
           |                                  .*..     ..*..     .*.     *.=
.*
   1.8e+06 ++   ..*..*..      .*..*..   *...*.    *..*.       .*.          =
 |
           *..*.        *.. ..        ..                    *.             =
 |
           |               *         *                                     =
 |
  1.78e+06 ++                                                              =
 |
           |                                                               =
 |
  1.76e+06 ++                                                              =
 |
           |                                                               =
 |
  1.74e+06 ++                                                              =
 |
           |               O   O     O      O                            O =
 O
           O         O            O     O            O      O  O           =
 |
  1.72e+06 ++           O                      O  O      O            O    =
 |
           |  O   O                                                        =
 |
   1.7e+06 ++-----------------------------------------------------O--------=
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
Ying Huang

--===============8534206927818657504==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogCmRlZmF1bHQtd2F0Y2hk
b2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0OiBkMjUxYThiMGQyMDY0ODEz
YWZiOTBkZWZkNGUwOWNiNTk5ZDI4Y2RiCm1vZGVsOiBTYW5keSBCcmlkZ2UtRVAKbWVtb3J5OiA2
NEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwRUFSUy0wMFk1
QjFfV0QtV0NBVjVGMDU5NDk5LXBhcnQzIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0
aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMEVBUlMtMDBZNUIxX1dELVdDQVY1RjA1
OTQ5OS1wYXJ0NCIKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAw
CndpbGwtaXQtc2NhbGU6CiAgdGVzdDogZnV0ZXgxCnF1ZXVlOiBjeWNsaWMKdGVzdGJveDogbGtw
LXNiMDMKdGJveF9ncm91cDogbGtwLXNiMDMKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90
aW1lOiAyMDE1LTA4LTIwIDE1OjIxOjU0LjQxMzI1MTc1NyArMDg6MDAKaWQ6IGFkZWY1NGYyNjc4
ZjIzYzE4YTk5Mjk3OWY2M2ZiZjE5MmU0YTdkZmMKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45
CmhlYWRfY29tbWl0OiBkMjUxYThiMGQyMDY0ODEzYWZiOTBkZWZkNGUwOWNiNTk5ZDI4Y2RiCmJh
c2VfY29tbWl0OiAyYzY2MjVjZDU0NWJkZDY2YWNmZjE0ZjMzOTQ4NjVkNDM5MjBhNWM3CmJyYW5j
aDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwODIwMTgKa2VybmVsOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45L2QyNTFhOGIwZDIwNjQ4MTNhZmI5MGRlZmQ0ZTA5Y2I1OTlk
MjhjZGIvdm1saW51ei00LjIuMC1yYzctMDQ4MjUtZ2QyNTFhOGIiCnJvb3RmczogZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2FsZS9m
dXRleDEvbGtwLXNiMDMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9n
Y2MtNC45L2QyNTFhOGIwZDIwNjQ4MTNhZmI5MGRlZmQ0ZTA5Y2I1OTlkMjhjZGIvMCIKam9iX2Zp
bGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atc2IwMy9jeWNsaWNfd2lsbC1pdC1zY2FsZS1mdXRleDEt
eDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtZDI1MWE4YjBkMjA2NDgxM2FmYjkwZGVmZDRlMDljYjU5
OWQyOGNkYi0yMDE1MDgyMC02NTUyOS0xbTEwajZpLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1
LTA4LTIwIDIxOjMwOjEzLjY5MzM4NjY4OCArMDg6MDAKbnJfY3B1OiAiJChucHJvYykiCm1heF91
cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AK
LSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXNiMDMvY3ljbGljX3dpbGwtaXQtc2NhbGUtZnV0ZXgx
LXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWQyNTFhOGIwZDIwNjQ4MTNhZmI5MGRlZmQ0ZTA5Y2I1
OTlkMjhjZGItMjAxNTA4MjAtNjU1MjktMW0xMGo2aS0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtj
b25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUw
ODIwMTgKLSBjb21taXQ9ZDI1MWE4YjBkMjA2NDgxM2FmYjkwZGVmZDRlMDljYjU5OWQyOGNkYgot
IEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2QyNTFhOGIwZDIwNjQ4
MTNhZmI5MGRlZmQ0ZTA5Y2I1OTlkMjhjZGIvdm1saW51ei00LjIuMC1yYzctMDQ4MjUtZ2QyNTFh
OGIKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUv
ZnV0ZXgxL2xrcC1zYjAzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS9kMjUxYThiMGQyMDY0ODEzYWZiOTBkZWZkNGUwOWNiNTk5ZDI4Y2RiLzAKLSBMS1Bf
U0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9n
X2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRh
dGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9
MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFt
ZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAg
cncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDog
Ii9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9kMjUxYThiMGQyMDY0ODEzYWZiOTBkZWZk
NGUwOWNiNTk5ZDI4Y2RiL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVy
Ym9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3oiCmpvYl9zdGF0ZTog
ZmluaXNoZWQKbG9hZGF2ZzogMjcuODUgMTIuNDUgNC44NiAxLzM1MyA4OTM5CnN0YXJ0X3RpbWU6
ICcxNDQwMDc3NjcxJwplbmRfdGltZTogJzE0NDAwNzc5ODEnCnZlcnNpb246ICIvbGtwL2xrcC8u
c3JjLTIwMTUwODIwLTE5NDMwNiIK

--===============8534206927818657504==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IGZ1dGV4MSAyNSBib3RoIDEgOCAxNiAyNCAzMgo=

--===============8534206927818657504==--

