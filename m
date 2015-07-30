Content-Type: multipart/mixed; boundary="===============8593067173873550170=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] 112b650f83e: -6.8% will-it-scale.per_process_ops
Date: Thu, 30 Jul 2015 10:03:22 +0800
Message-ID: <874mkmqu51.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8593067173873550170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git master
commit 112b650f83e5ccea260708f8b7ca747580584659 ("mm: gup: make get_user_pa=
ges_fast and __get_user_pages_fast latency conscious")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-sbx04/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/=
performance/futex1

commit: =

  b7c3d6a0d545317e63ff58a1e60059ce79ac359e
  112b650f83e5ccea260708f8b7ca747580584659

b7c3d6a0d545317e 112b650f83e5ccea260708f8b7 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5155618 =C2=B1  0%      -6.8%    4806190 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1203105 =C2=B1  1%      -3.0%    1166790 =C2=B1  0%  will-it-scale.per_t=
hread_ops
     18828 =C2=B1 11%     +97.6%      37211 =C2=B1  5%  will-it-scale.time.=
involuntary_context_switches
     80265 =C2=B1  8%     -20.5%      63818 =C2=B1 11%  numa-numastat.node0=
.numa_hit
     18828 =C2=B1 11%     +97.6%      37211 =C2=B1  5%  time.involuntary_co=
ntext_switches
      3600 =C2=B1  3%     +20.6%       4341 =C2=B1  5%  vmstat.system.cs
    227062 =C2=B1  3%     +52.6%     346589 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   5878405 =C2=B1  0%     +19.7%    7035430 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      7597 =C2=B1 12%     -36.0%       4860 =C2=B1 32%  numa-meminfo.node0.=
AnonPages
      5012 =C2=B1 50%     +59.1%       7975 =C2=B1 31%  numa-meminfo.node2.=
Mapped
     12346 =C2=B1 14%     +24.2%      15338 =C2=B1  3%  numa-meminfo.node3.=
SReclaimable
      3516 =C2=B1  3%     +10.0%       3867 =C2=B1  3%  slabinfo.kmalloc-20=
48.active_objs
     20418 =C2=B1  3%     -10.9%      18198 =C2=B1  5%  slabinfo.kmalloc-25=
6.active_objs
    344.25 =C2=B1  6%     -25.9%     255.00 =C2=B1 14%  slabinfo.kmem_cache=
.active_objs
    344.25 =C2=B1  6%     -25.9%     255.00 =C2=B1 14%  slabinfo.kmem_cache=
.num_objs
    683.00 =C2=B1  4%     -16.4%     571.00 =C2=B1  7%  slabinfo.kmem_cache=
_node.active_objs
    752.00 =C2=B1  3%     -14.9%     640.00 =C2=B1  7%  slabinfo.kmem_cache=
_node.num_objs
      1899 =C2=B1 12%     -36.0%       1214 =C2=B1 32%  numa-vmstat.node0.n=
r_anon_pages
    113103 =C2=B1  8%     -11.7%      99882 =C2=B1  4%  numa-vmstat.node0.n=
uma_hit
     78508 =C2=B1 13%     -16.9%      65214 =C2=B1  8%  numa-vmstat.node0.n=
uma_local
     95.75 =C2=B1 24%     -56.7%      41.50 =C2=B1 41%  numa-vmstat.node2.n=
r_dirtied
      1252 =C2=B1 50%     +59.1%       1993 =C2=B1 31%  numa-vmstat.node2.n=
r_mapped
     93.25 =C2=B1 24%     -57.1%      40.00 =C2=B1 44%  numa-vmstat.node2.n=
r_written
      3086 =C2=B1 14%     +24.2%       3834 =C2=B1  3%  numa-vmstat.node3.n=
r_slab_reclaimable
      2.26 =C2=B1  2%     -36.9%       1.42 =C2=B1  2%  perf-profile.cpu-cy=
cles.___might_sleep.__might_sleep.get_futex_key.futex_wake.do_futex
      0.41 =C2=B1  5%    +140.2%       0.98 =C2=B1  1%  perf-profile.cpu-cy=
cles.___might_sleep.get_futex_key.futex_wake.do_futex.sys_futex
      0.00 =C2=B1 -1%      +Inf%       3.65 =C2=B1  1%  perf-profile.cpu-cy=
cles.___might_sleep.get_user_pages_fast.get_futex_key.futex_wake.do_futex
      3.21 =C2=B1  2%     -31.6%       2.20 =C2=B1  1%  perf-profile.cpu-cy=
cles.__might_sleep.get_futex_key.futex_wake.do_futex.sys_futex
      4.42 =C2=B1  1%     -11.8%       3.90 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.10.futex_wake.do_futex.sys_futex.entry_SYSCALL=
_64_fastpath
     26.58 =C2=B1  0%     +18.8%      31.59 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_user_pages_fast.get_futex_key.futex_wake.do_futex.sys_futex
     14.18 =C2=B1  1%      -9.6%      12.81 =C2=B1  0%  perf-profile.cpu-cy=
cles.unlock_page.get_futex_key.futex_wake.do_futex.sys_futex
    193.00 =C2=B1 55%     -60.1%      77.00 =C2=B1 87%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
    209.25 =C2=B1 51%     -73.2%      56.00 =C2=B1107%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
      0.50 =C2=B1100%    +350.0%       2.25 =C2=B1 72%  sched_debug.cfs_rq[=
14]:/.nr_spread_over
     65.00 =C2=B1154%     -96.2%       2.50 =C2=B1100%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     81.00 =C2=B1124%     -79.9%      16.25 =C2=B1 13%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    217.25 =C2=B1 96%     -61.4%      83.75 =C2=B1167%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
    219.75 =C2=B1 95%     -60.8%      86.25 =C2=B1161%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
      9485 =C2=B1 11%     +16.1%      11016 =C2=B1  6%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
      9453 =C2=B1 12%     +16.5%      11015 =C2=B1  6%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
      8076 =C2=B1  0%     +13.7%       9178 =C2=B1 11%  sched_debug.cfs_rq[=
21]:/.avg->runnable_avg_sum
      9442 =C2=B1 11%     +16.6%      11010 =C2=B1  6%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
    175.00 =C2=B1  0%     +13.4%     198.50 =C2=B1 11%  sched_debug.cfs_rq[=
21]:/.tg_runnable_contrib
      9432 =C2=B1 12%     +16.7%      11010 =C2=B1  6%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
      9473 =C2=B1 12%     +15.9%      10977 =C2=B1  6%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    175.00 =C2=B1  2%      +7.7%     188.50 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
     35551 =C2=B1 12%     -10.3%      31893 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.exec_clock
     21745 =C2=B1  6%      +8.6%      23612 =C2=B1  6%  sched_debug.cfs_rq[=
56]:/.exec_clock
     73.75 =C2=B1100%    +526.4%     462.00 =C2=B1 54%  sched_debug.cfs_rq[=
63]:/.blocked_load_avg
     84.25 =C2=B1 88%    +460.8%     472.50 =C2=B1 52%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
      0.50 =C2=B1100%    +550.0%       3.25 =C2=B1 25%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
     10053 =C2=B1 27%    +101.2%      20226 =C2=B1 14%  sched_debug.cpu#0.n=
r_switches
     19037 =C2=B1 14%     +54.0%      29326 =C2=B1 10%  sched_debug.cpu#0.s=
ched_count
      2136 =C2=B1 12%    +236.9%       7198 =C2=B1 32%  sched_debug.cpu#0.s=
ched_goidle
     15374 =C2=B1 36%     -57.4%       6548 =C2=B1 67%  sched_debug.cpu#1.n=
r_switches
     15861 =C2=B1 35%     -54.4%       7236 =C2=B1 60%  sched_debug.cpu#1.s=
ched_count
      6837 =C2=B1 44%     -55.2%       3060 =C2=B1 71%  sched_debug.cpu#1.s=
ched_goidle
      2.00 =C2=B1  0%     +50.0%       3.00 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[2]
      3269 =C2=B1 52%    +182.5%       9233 =C2=B1 65%  sched_debug.cpu#19.=
ttwu_count
      1684 =C2=B1 13%     -29.3%       1191 =C2=B1 15%  sched_debug.cpu#23.=
ttwu_local
      1275 =C2=B1 20%    +203.1%       3865 =C2=B1 58%  sched_debug.cpu#24.=
ttwu_local
     -6.25 =C2=B1-54%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu#25.=
nr_uninterruptible
      1.50 =C2=B1233%    -650.0%      -8.25 =C2=B1-97%  sched_debug.cpu#30.=
nr_uninterruptible
     -1.00 =C2=B1-187%    -325.0%       2.25 =C2=B1 79%  sched_debug.cpu#32=
.nr_uninterruptible
      3.50 =C2=B1 47%    -114.3%      -0.50 =C2=B1-331%  sched_debug.cpu#34=
.nr_uninterruptible
      3.25 =C2=B1 39%     -76.9%       0.75 =C2=B1145%  sched_debug.cpu#37.=
nr_uninterruptible
    236.50 =C2=B1 25%    +597.6%       1649 =C2=B1131%  sched_debug.cpu#39.=
sched_goidle
      1.50 =C2=B1137%    +316.7%       6.25 =C2=B1 45%  sched_debug.cpu#41.=
nr_uninterruptible
    984.50 =C2=B1 80%     -63.9%     355.75 =C2=B1 40%  sched_debug.cpu#42.=
ttwu_local
    241.00 =C2=B1  7%    +102.3%     487.50 =C2=B1 25%  sched_debug.cpu#44.=
ttwu_local
    522.50 =C2=B1  6%    +385.2%       2535 =C2=B1 91%  sched_debug.cpu#45.=
sched_goidle
      1481 =C2=B1 17%    +972.4%      15890 =C2=B1117%  sched_debug.cpu#47.=
nr_switches
      1566 =C2=B1 16%    +925.2%      16056 =C2=B1117%  sched_debug.cpu#47.=
sched_count
    618.00 =C2=B1 19%   +1162.9%       7804 =C2=B1119%  sched_debug.cpu#47.=
sched_goidle
      4222 =C2=B1 70%     -61.6%       1619 =C2=B1  9%  sched_debug.cpu#5.n=
r_switches
      4705 =C2=B1 63%     -52.6%       2229 =C2=B1 14%  sched_debug.cpu#5.s=
ched_count
      1971 =C2=B1 76%     -65.4%     682.00 =C2=B1  9%  sched_debug.cpu#5.s=
ched_goidle
      1835 =C2=B1 36%    +215.7%       5792 =C2=B1 36%  sched_debug.cpu#53.=
nr_switches
      1961 =C2=B1 37%    +197.9%       5843 =C2=B1 36%  sched_debug.cpu#53.=
sched_count
    396.00 =C2=B1 19%    +402.3%       1989 =C2=B1 71%  sched_debug.cpu#53.=
ttwu_local
      1803 =C2=B1 13%     -32.6%       1215 =C2=B1 10%  sched_debug.cpu#6.n=
r_switches
    766.25 =C2=B1 13%     -34.5%     502.25 =C2=B1 10%  sched_debug.cpu#6.s=
ched_goidle
    395.50 =C2=B1 10%     -52.3%     188.50 =C2=B1 15%  sched_debug.cpu#6.t=
twu_local
      1105 =C2=B1 33%    +788.4%       9823 =C2=B1107%  sched_debug.cpu#60.=
sched_goidle


lkp-sbx04: Sandy Bridge-EX
Memory: 64G

                             will-it-scale.per_process_ops

   5.2e+06 ++------------------*-------------------------------------------=
-+
           *..      .*..*..*.                 .*..*..*...*                 =
 |
  5.15e+06 ++ *...*.              *..*..*...*.                             =
 |
   5.1e+06 ++                                                              =
 |
           |                                                               =
 |
  5.05e+06 ++                                                              =
 |
     5e+06 ++                                                              =
 |
           |                                                               =
 |
  4.95e+06 ++                                                              =
 |
   4.9e+06 ++                                                              =
 |
           |                                   O  O                        =
 |
  4.85e+06 ++                                                              =
 |
   4.8e+06 ++           O      O                     O   O  O  O  O      O =
 |
           O      O  O     O      O  O  O   O                         O    =
 O
  4.75e+06 ++-O------------------------------------------------------------=
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

--===============8593067173873550170==
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
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVm
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDc1MmY0
OWNmNjkxZGUxYTkxNGJlNDFjNzgxMTFhMDg3N2FmOTg2YmEKbW9kZWw6IFNhbmR5IEJyaWRnZS1F
WApucl9jcHU6IDY0Cm1lbW9yeTogNjRHCm5yX3NzZF9wYXJ0aXRpb25zOiA0CnNzZF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzI0MEEzX0NWQ1YyMDQzMCot
cGFydDEiCnN3YXBfcGFydGl0aW9uczogCmNhdGVnb3J5OiBiZW5jaG1hcmsKcGVyZi1wcm9maWxl
OgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IGZ1dGV4MQpxdWV1ZTogY3ljbGlj
CnRlc3Rib3g6IGxrcC1zYngwNAp0Ym94X2dyb3VwOiBsa3Atc2J4MDQKa2NvbmZpZzogeDg2XzY0
LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTA3LTI3IDExOjI0OjMyLjU3MjA2Mjg2MSArMDg6MDAK
dXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRfY29tbWl0OiA3NTJmNDljZjY5MWRlMWE5
MTRiZTQxYzc4MTExYTA4NzdhZjk4NmJhCmJhc2VfY29tbWl0OiBjYmZlOGZhNmNkNjcyMDExYzc1
NWMzY2Q4NWM5ZmZkNGUyZDEwYTZmCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIw
MTUwNzI3MTcKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45Lzc1MmY0OWNm
NjkxZGUxYTkxNGJlNDFjNzgxMTFhMDg3N2FmOTg2YmEvdm1saW51ei00LjIuMC1yYzQtd2wtYXRo
LTAyMDIzLWc3NTJmNDljIgpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVz
dWx0X3Jvb3Q6ICIvcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtZnV0ZXgxL2xrcC1z
YngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNzUy
ZjQ5Y2Y2OTFkZTFhOTE0YmU0MWM3ODExMWEwODc3YWY5ODZiYS8wIgpqb2JfZmlsZTogIi9sa3Av
c2NoZWR1bGVkL2xrcC1zYngwNC9jeWNsaWNfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1mdXRl
eDEteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtNzUyZjQ5Y2Y2OTFkZTFhOTE0YmU0MWM3ODExMWEw
ODc3YWY5ODZiYS0yMDE1MDcyNy0xMDcwNDQtMW1nOTJqcS0wLnlhbWwiCmRlcXVldWVfdGltZTog
MjAxNS0wNy0yNyAxODowODo0NC44MDk0Njk3OTMgKzA4OjAwCm1heF91cHRpbWU6IDE1MDAKaW5p
dHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rs
b2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hl
ZHVsZWQvbGtwLXNieDA0L2N5Y2xpY193aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLWZ1dGV4MS14
ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC03NTJmNDljZjY5MWRlMWE5MTRiZTQxYzc4MTExYTA4Nzdh
Zjk4NmJhLTIwMTUwNzI3LTEwNzA0NC0xbWc5MmpxLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2Nv
bmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA3
MjcxNwotIGNvbW1pdD03NTJmNDljZjY5MWRlMWE5MTRiZTQxYzc4MTExYTA4NzdhZjk4NmJhCi0g
Qk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNzUyZjQ5Y2Y2OTFkZTFh
OTE0YmU0MWM3ODExMWEwODc3YWY5ODZiYS92bWxpbnV6LTQuMi4wLXJjNC13bC1hdGgtMDIwMjMt
Zzc1MmY0OWMKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQt
c2NhbGUvcGVyZm9ybWFuY2UtZnV0ZXgxL2xrcC1zYngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNzUyZjQ5Y2Y2OTFkZTFhOTE0YmU0MWM3ODExMWEw
ODc3YWY5ODZiYS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMw
LDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fs
d2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0t
MSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9y
YW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9
dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNn
eiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNzUyZjQ5
Y2Y2OTFkZTFhOTE0YmU0MWM3ODExMWEwODc3YWY5ODZiYS9tb2R1bGVzLmNneiIKYm1faW5pdHJk
OiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3os
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3os
L2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3dpbGwtaXQtc2Nh
bGUuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDQ2LjcwIDIwLjc0IDguMDYgMS82
MjQgMTEzNzIKc3RhcnRfdGltZTogJzE0Mzc5OTE4ODAnCmVuZF90aW1lOiAnMTQzNzk5MjE4OScK
dmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA3MjctMTUwNDQ4Igo=

--===============8593067173873550170==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vcnVu
dGVzdC5weSBmdXRleDEgMTYgYm90aCAxIDggMTYgMjQgMzIgNDggNjQK

--===============8593067173873550170==--

