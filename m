Content-Type: multipart/mixed; boundary="===============2194241166493070704=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [perf] bd2afa49d1: -20.7% will-it-scale.per_thread_ops
Date: Tue, 08 Mar 2016 15:03:58 +0800
Message-ID: <20160308070358.GC10475@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2194241166493070704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the will-it-scale.per_thread_ops -20.7% regression on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit bd2afa49d194c6412c333e9fdd48bc5d06bb465d ("perf: Fix scaling vs. per=
f_event_enable()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sb03/lseek1/will-it-=
scale

commit: =

  7fce250915efca0f8f51dddee3ae89bf30d86ca5
  bd2afa49d194c6412c333e9fdd48bc5d06bb465d

7fce250915efca0f bd2afa49d194c6412c333e9fdd =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   7989217 =C2=B1  0%     -20.7%    6333122 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.61 =C2=B1  0%      -1.3%       0.60 =C2=B1  0%  will-it-scale.scala=
bility
      1762 =C2=B1  0%      -4.7%       1680 =C2=B1  0%  will-it-scale.time.=
system_time
    748.10 =C2=B1  0%     +11.0%     830.15 =C2=B1  0%  will-it-scale.time.=
user_time
    748.10 =C2=B1  0%     +11.0%     830.15 =C2=B1  0%  time.user_time
      0.03 =C2=B1 40%     -66.7%       0.01 =C2=B1-10000%  turbostat.Pkg%pc6
      1.54 =C2=B1  1%     -16.4%       1.28 =C2=B1  3%  perf-profile.cycles=
.___might_sleep.__might_sleep.mutex_lock.__fdget_pos.sys_lseek
     33.95 =C2=B1  0%     -15.3%      28.77 =C2=B1  0%  perf-profile.cycles=
.__fdget_pos.sys_lseek.entry_SYSCALL_64_fastpath
     14.29 =C2=B1  2%     -18.4%      11.67 =C2=B1  1%  perf-profile.cycles=
.__fget.__fget_light.__fdget_pos.sys_lseek.entry_SYSCALL_64_fastpath
     14.66 =C2=B1  2%     -18.1%      12.02 =C2=B1  0%  perf-profile.cycles=
.__fget_light.__fdget_pos.sys_lseek.entry_SYSCALL_64_fastpath
      3.38 =C2=B1  1%     -14.1%       2.90 =C2=B1  3%  perf-profile.cycles=
.__might_sleep.mutex_lock.__fdget_pos.sys_lseek.entry_SYSCALL_64_fastpath
     12.52 =C2=B1  1%     -10.9%      11.16 =C2=B1  0%  perf-profile.cycles=
.entry_SYSCALL_64
     12.72 =C2=B1  1%     -17.8%      10.45 =C2=B1  1%  perf-profile.cycles=
.entry_SYSCALL_64_after_swapgs
     10.29 =C2=B1  2%     -17.7%       8.47 =C2=B1  1%  perf-profile.cycles=
.fput.entry_SYSCALL_64_fastpath
      1.94 =C2=B1  5%    +152.2%       4.89 =C2=B1  2%  perf-profile.cycles=
.generic_file_llseek_size.shmem_file_llseek.sys_lseek.entry_SYSCALL_64_fast=
path
      0.75 =C2=B1  5%    +517.3%       4.65 =C2=B1  3%  perf-profile.cycles=
.generic_file_llseek_size.sys_lseek.entry_SYSCALL_64_fastpath
     11.77 =C2=B1  2%     -13.5%      10.18 =C2=B1  1%  perf-profile.cycles=
.mutex_lock.__fdget_pos.sys_lseek.entry_SYSCALL_64_fastpath
      4.59 =C2=B1  3%    +180.3%      12.87 =C2=B1  4%  perf-profile.cycles=
.shmem_file_llseek.sys_lseek.entry_SYSCALL_64_fastpath
     47.83 =C2=B1  1%     +12.6%      53.87 =C2=B1  0%  perf-profile.cycles=
.sys_lseek.entry_SYSCALL_64_fastpath
     35661 =C2=B1  4%     +26.3%      45032 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.24
     34816 =C2=B1  0%     +14.1%      39725 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.25
     33735 =C2=B1  4%     -31.2%      23222 =C2=B1 37%  sched_debug.cfs_rq:=
/.exec_clock.8
    804888 =C2=B1  3%     +25.5%    1010094 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.24
    709991 =C2=B1  3%     -30.1%     496149 =C2=B1 31%  sched_debug.cfs_rq:=
/.min_vruntime.min
      4.25 =C2=B1 13%     -24.5%       3.21 =C2=B1  2%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      1.17 =C2=B1  8%     -19.6%       0.94 =C2=B1  5%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
   -585558 =C2=B1 -4%     +28.1%    -750273 =C2=B1-13%  sched_debug.cfs_rq:=
/.spread0.8
   -595168 =C2=B1 -3%     +29.4%    -770251 =C2=B1-14%  sched_debug.cfs_rq:=
/.spread0.min
    561.50 =C2=B1  4%      -6.6%     524.25 =C2=B1  4%  sched_debug.cfs_rq:=
/.util_avg.12
    411.50 =C2=B1 14%     -13.9%     354.50 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.23
    173.25 =C2=B1  1%     +12.8%     195.50 =C2=B1 10%  sched_debug.cfs_rq:=
/.util_avg.26
     53711 =C2=B1  4%     +16.0%      62301 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.24
     10450 =C2=B1 12%     -22.0%       8153 =C2=B1 12%  sched_debug.cpu.nr_=
switches.0
     14829 =C2=B1 16%     +32.3%      19618 =C2=B1 18%  sched_debug.cpu.nr_=
switches.11
      7613 =C2=B1 30%     -59.2%       3109 =C2=B1 11%  sched_debug.cpu.nr_=
switches.29
     33333 =C2=B1  5%     +47.8%      49256 =C2=B1 22%  sched_debug.cpu.nr_=
switches.max
      8197 =C2=B1  3%     +32.3%      10843 =C2=B1 12%  sched_debug.cpu.nr_=
switches.stddev
      1.00 =C2=B1187%    -600.0%      -5.00 =C2=B1-54%  sched_debug.cpu.nr_=
uninterruptible.11
     16912 =C2=B1 19%    +203.2%      51277 =C2=B1 64%  sched_debug.cpu.sch=
ed_count.10
      7914 =C2=B1 31%     -60.3%       3144 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.29
      3798 =C2=B1 39%     +57.9%       5998 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.3
      4658 =C2=B1  9%     +90.7%       8886 =C2=B1 67%  sched_debug.cpu.sch=
ed_goidle.14
      3051 =C2=B1  2%     +11.2%       3394 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.avg
     13064 =C2=B1  9%     +62.4%      21213 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.max
      3266 =C2=B1  4%     +41.9%       4634 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.stddev
      6316 =C2=B1 13%     -41.4%       3703 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.14
     17502 =C2=B1 10%     +82.7%      31976 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.max
      4063 =C2=B1  5%     +53.3%       6230 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.stddev
      1733 =C2=B1 31%     +49.4%       2591 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.11
    899.00 =C2=B1 29%     +76.7%       1588 =C2=B1 22%  sched_debug.cpu.ttw=
u_local.27

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04/ls=
eek1/will-it-scale

commit: =

  7fce250915efca0f8f51dddee3ae89bf30d86ca5
  bd2afa49d194c6412c333e9fdd48bc5d06bb465d

7fce250915efca0f bd2afa49d194c6412c333e9fdd =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   7619716 =C2=B1  0%     -21.2%    6008133 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.60 =C2=B1  0%      -2.6%       0.58 =C2=B1  0%  will-it-scale.scala=
bility
      2982 =C2=B1  0%      -4.8%       2838 =C2=B1  0%  will-it-scale.time.=
system_time
      1262 =C2=B1  0%     +11.4%       1406 =C2=B1  0%  will-it-scale.time.=
user_time
      1262 =C2=B1  0%     +11.4%       1406 =C2=B1  0%  time.user_time
     21294 =C2=B1  1%      +9.4%      23298 =C2=B1  2%  slabinfo.anon_vma_c=
hain.active_objs
     21294 =C2=B1  1%      +9.4%      23298 =C2=B1  2%  slabinfo.anon_vma_c=
hain.num_objs
     13408 =C2=B1  1%     -14.4%      11482 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_objs
     13547 =C2=B1  1%     -12.9%      11804 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
      2.00 =C2=B1  0%    +212.5%       6.25 =C2=B1 34%  sched_debug.cfs_rq:=
/.load.27
      2.50 =C2=B1 20%   +1650.0%      43.75 =C2=B1 84%  sched_debug.cfs_rq:=
/.load_avg.18
     11.50 =C2=B1  4%     -10.9%      10.25 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.46
   1133547 =C2=B1 15%     -14.8%     965376 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.57
      2.00 =C2=B1-50%     +12.5%       2.25 =C2=B1 57%  sched_debug.cfs_rq:=
/.nr_spread_over.9
      5.54 =C2=B1 29%     -33.1%       3.71 =C2=B1 30%  sched_debug.cfs_rq:=
/.nr_spread_over.max
      0.98 =C2=B1  8%     -14.8%       0.83 =C2=B1  7%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
      3.00 =C2=B1  0%     -33.3%       2.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.31
    172.50 =C2=B1  1%     +15.2%     198.75 =C2=B1 14%  sched_debug.cfs_rq:=
/.util_avg.21
    176.00 =C2=B1  0%     +44.5%     254.25 =C2=B1 28%  sched_debug.cfs_rq:=
/.util_avg.26
     17.60 =C2=B1  5%      -8.5%      16.11 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].stddev
      1792 =C2=B1  0%     +27.7%       2289 =C2=B1 31%  sched_debug.cpu.cur=
r->pid.16
      1793 =C2=B1  0%     +25.4%       2248 =C2=B1 28%  sched_debug.cpu.cur=
r->pid.21
     48688 =C2=B1  3%      +6.1%      51640 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.63
     14390 =C2=B1 25%     -70.2%       4282 =C2=B1 52%  sched_debug.cpu.nr_=
switches.23
      1180 =C2=B1 10%     +19.8%       1414 =C2=B1 15%  sched_debug.cpu.nr_=
switches.47
      3051 =C2=B1 55%     -57.1%       1309 =C2=B1  6%  sched_debug.cpu.nr_=
switches.50
      1604 =C2=B1 46%    +111.0%       3385 =C2=B1 60%  sched_debug.cpu.nr_=
switches.52
      2296 =C2=B1 37%    +103.1%       4664 =C2=B1 32%  sched_debug.cpu.nr_=
switches.59
      2199 =C2=B1 20%     +95.1%       4292 =C2=B1 39%  sched_debug.cpu.nr_=
switches.60
      1960 =C2=B1 17%     +49.9%       2939 =C2=B1 14%  sched_debug.cpu.nr_=
switches.63
    -18.75 =C2=B1-19%     +62.7%     -30.50 =C2=B1-21%  sched_debug.cpu.nr_=
uninterruptible.0
     -2.00 =C2=B1-86%    -162.5%       1.25 =C2=B1103%  sched_debug.cpu.nr_=
uninterruptible.19
     -1.75 =C2=B1-123%    -171.4%       1.25 =C2=B1103%  sched_debug.cpu.nr=
_uninterruptible.27
      1.25 =C2=B1153%    +360.0%       5.75 =C2=B1 35%  sched_debug.cpu.nr_=
uninterruptible.32
      3.50 =C2=B1 84%     -71.4%       1.00 =C2=B1254%  sched_debug.cpu.nr_=
uninterruptible.46
    -18.50 =C2=B1-18%     +62.6%     -30.08 =C2=B1-21%  sched_debug.cpu.nr_=
uninterruptible.min
   4732118 =C2=B1  0%     +27.7%    6043638 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.0
     16580 =C2=B1100%     -73.9%       4329 =C2=B1 47%  sched_debug.cpu.sch=
ed_count.1
     14410 =C2=B1 24%     -70.2%       4297 =C2=B1 52%  sched_debug.cpu.sch=
ed_count.23
     11351 =C2=B1 43%    +159.5%      29460 =C2=B1 46%  sched_debug.cpu.sch=
ed_count.27
      5346 =C2=B1 55%     -50.1%       2669 =C2=B1 35%  sched_debug.cpu.sch=
ed_count.4
      3061 =C2=B1 55%     -56.9%       1320 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.50
      1614 =C2=B1 46%    +110.6%       3399 =C2=B1 60%  sched_debug.cpu.sch=
ed_count.52
      2035 =C2=B1  8%     +59.1%       3238 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.57
      2310 =C2=B1 37%    +105.8%       4754 =C2=B1 33%  sched_debug.cpu.sch=
ed_count.59
      2218 =C2=B1 20%    +122.3%       4931 =C2=B1 36%  sched_debug.cpu.sch=
ed_count.60
      1973 =C2=B1 17%     +91.8%       3785 =C2=B1 37%  sched_debug.cpu.sch=
ed_count.63
     80242 =C2=B1  0%     +26.0%     101102 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
   4732118 =C2=B1  0%     +27.7%    6043638 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.max
    586184 =C2=B1  0%     +27.7%     748781 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.stddev
      4320 =C2=B1 46%     -64.8%       1520 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.20
      2161 =C2=B1 73%     -53.1%       1012 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.4
    622.00 =C2=B1 25%     -19.3%     502.25 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.44
      1063 =C2=B1 38%     -53.4%     496.00 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.50
    480.50 =C2=B1 10%     +39.0%     667.75 =C2=B1 33%  sched_debug.cpu.sch=
ed_goidle.53
    925.50 =C2=B1 43%    +115.9%       1998 =C2=B1 39%  sched_debug.cpu.sch=
ed_goidle.59
    754.75 =C2=B1  6%     +59.7%       1205 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.63
      8103 =C2=B1  6%     -11.0%       7214 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.0
      1831 =C2=B1 23%     +69.1%       3095 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.15
      2932 =C2=B1 23%     -47.1%       1550 =C2=B1 22%  sched_debug.cpu.ttw=
u_count.18
      4208 =C2=B1 27%     -59.6%       1702 =C2=B1 20%  sched_debug.cpu.ttw=
u_count.19
      4212 =C2=B1 39%     -69.9%       1268 =C2=B1 24%  sched_debug.cpu.ttw=
u_count.23
      5265 =C2=B1 45%     -44.9%       2901 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.27
      3700 =C2=B1 24%     +71.1%       6331 =C2=B1 48%  sched_debug.cpu.ttw=
u_count.28
      2916 =C2=B1 90%     -65.1%       1017 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.4
      2347 =C2=B1 50%     -62.8%     874.25 =C2=B1 77%  sched_debug.cpu.ttw=
u_count.44
      5181 =C2=B1 49%     -78.6%       1107 =C2=B1 66%  sched_debug.cpu.ttw=
u_count.46
      1745 =C2=B1 28%    +174.4%       4789 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.9
      1182 =C2=B1 79%     -63.6%     430.00 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.18
      2470 =C2=B1 56%     -78.6%     529.25 =C2=B1 30%  sched_debug.cpu.ttw=
u_local.19
      3327 =C2=B1 46%     -86.4%     452.25 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.23
      1156 =C2=B1 40%     +66.5%       1925 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.24
      1589 =C2=B1  9%     -28.6%       1134 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.27
    349.50 =C2=B1 27%     -34.5%     229.00 =C2=B1 40%  sched_debug.cpu.ttw=
u_local.33
    126.50 =C2=B1 15%     +43.1%     181.00 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.38
      1126 =C2=B1 62%     -62.2%     425.75 =C2=B1 34%  sched_debug.cpu.ttw=
u_local.4
    381.00 =C2=B1 21%    +145.7%     936.00 =C2=B1 35%  sched_debug.cpu.ttw=
u_local.59


lkp-sb03: Sandy Bridge-EP
Memory: 64G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G

		    will-it-scale.per_thread_ops

9e+06 ++------------------------------------------------------------------+
*.  .*.*.*.                                        .*.*             |
8e+06 ++*.       *..*.*.*.*..*.*.*.*..*.*.*..*.*.*.*..*.*   :    *.*.*..*.*
7e+06 O+O  O O O O  O O O O  O                              :    :        |
|                        O O O  O                      :   :        |
6e+06 ++                                                     :   :        |
5e+06 ++                                                     :  :         |
|                                                      :  :         |
4e+06 ++                                                      : :         |
3e+06 ++                                                      : :         |
|                                                       : :         |
2e+06 ++                                                      : :         |
1e+06 ++                                                       :          |
|                                                        :          |
0 ++-------------------------------------------------------*----------+


                          will-it-scale.time.system_time

  1800 *+*--*-*-*--*-*-*-*--*-*-*--*-*-*--*-*-*-*--*-*-*--*-*-*----*-*-*--*=
-*
       O O  O O O  O O O O  O O O  O O O                      :    :       =
 |
  1600 ++                                                     :    :       =
 |
  1400 ++                                                      :   :       =
 |
       |                                                       :  :        =
 |
  1200 ++                                                      :  :        =
 |
  1000 ++                                                      :  :        =
 |
       |                                                        : :        =
 |
   800 ++                                                       : :        =
 |
   600 ++                                                       : :        =
 |
       |                                                        : :        =
 |
   400 ++                                                       ::         =
 |
   200 ++                                                        :         =
 |
       |                                                         :         =
 |
     0 ++--------------------------------------------------------*---------=
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

--===============2194241166493070704==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2
bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86
IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZv
OiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0
YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5m
c3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1l
dGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAK
ZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGJk
MmFmYTQ5ZDE5NGM2NDEyYzMzM2U5ZmRkNDhiYzVkMDZiYjQ2NWQKbW9kZWw6IFNhbmR5IEJyaWRn
ZS1FUAptZW1vcnk6IDY0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RD
X1dEMTBFQVJTLTAwWTVCMV9XRC1XQ0FWNUYwNTk0OTktcGFydDMiCnN3YXBfcGFydGl0aW9uczog
CnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwRUFSUy0wMFk1
QjFfV0QtV0NBVjVGMDU5NDk5LXBhcnQ0IgpjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJvZmls
ZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OiBsc2VlazEKcXVldWU6IGJpc2Vj
dAp0ZXN0Ym94OiBsa3Atc2IwMwp0Ym94X2dyb3VwOiBsa3Atc2IwMwprY29uZmlnOiB4ODZfNjQt
cmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDMtMDcgMTU6MjQ6NTguMzE5MzE2OTA1ICswODowMApj
b21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKaWQ6
IDFjZTE4NDQxOTE3MDQ2MGVmNDIyNDE2NzI5M2M3MjU2MWZjN2FjMzUKdXNlcjogbGtwCmhlYWRf
Y29tbWl0OiA3NWM3MzM5MTEzYTM1NWI4M2Y2Mzc0N2U2Njk5YzMwMjhkNGJmMzYyCmJhc2VfY29t
bWl0OiBmYzc3ZGJkMzRjNWM5OWJjZTQ2ZDQwYTI0OTE5MzdjM2JjYmQxMGFmCmJyYW5jaDogbGlu
dXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzA2MTQKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3dp
bGwtaXQtc2NhbGUvbHNlZWsxL2xrcC1zYjAzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
eDg2XzY0LXJoZWwvZ2NjLTQuOS9iZDJhZmE0OWQxOTRjNjQxMmMzMzNlOWZkZDQ4YmM1ZDA2YmI0
NjVkLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXNiMDMvYmlzZWN0X3dpbGwtaXQt
c2NhbGUtbHNlZWsxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtYmQy
YWZhNDlkMTk0YzY0MTJjMzMzZTlmZGQ0OGJjNWQwNmJiNDY1ZC0yMDE2MDMwNy0xMDU5MzEtbHR6
bXNxLTAueWFtbCIKbnJfY3B1OiAiJChucHJvYykiCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAi
L29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJf
YXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQv
bGtwLXNiMDMvYmlzZWN0X3dpbGwtaXQtc2NhbGUtbHNlZWsxLWRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oteDg2XzY0LXJoZWwtYmQyYWZhNDlkMTk0YzY0MTJjMzMzZTlmZGQ0OGJjNWQwNmJi
NDY1ZC0yMDE2MDMwNy0xMDU5MzEtbHR6bXNxLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZp
Zz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMDYx
NAotIGNvbW1pdD1iZDJhZmE0OWQxOTRjNjQxMmMzMzNlOWZkZDQ4YmM1ZDA2YmI0NjVkCi0gQk9P
VF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYmQyYWZhNDlkMTk0YzY0MTJj
MzMzZTlmZGQ0OGJjNWQwNmJiNDY1ZC92bWxpbnV6LTQuNS4wLXJjNS0wMDIxNi1nYmQyYWZhNAot
IG1heF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvd2lsbC1pdC1zY2FsZS9sc2Vl
azEvbGtwLXNiMDMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45L2JkMmFmYTQ5ZDE5NGM2NDEyYzMzM2U5ZmRkNDhiYzVkMDZiYjQ2NWQvMAotIExLUF9TRVJW
RVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2
ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwps
a3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2JkMmFmYTQ5ZDE5NGM2NDEyYzMzM2U5ZmRkNDhi
YzVkMDZiYjQ2NWQvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0
YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei93aWxsLWl0
LXNjYWxlLmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3osL2xrcC9iZW5jaG1h
cmtzL3dpbGwtaXQtc2NhbGUteDg2XzY0LmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYmQyYWZhNDlkMTk0YzY0MTJjMzMzZTlmZGQ0OGJj
NWQwNmJiNDY1ZC9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iZDJhZmE0OWQxOTRjNjQxMmMzMzNlOWZkZDQ4YmM1
ZDA2YmI0NjVkL3ZtbGludXotNC41LjAtcmM1LTAwMjE2LWdiZDJhZmE0IgpkZXF1ZXVlX3RpbWU6
IDIwMTYtMDMtMDcgMTU6MzA6MTUuMjMwOTYwNzM2ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVk
CmxvYWRhdmc6IDI4LjI0IDEyLjc1IDQuOTkgMi8zNjAgOTA0NwpzdGFydF90aW1lOiAnMTQ1NzMz
NTg3MicKZW5kX3RpbWU6ICcxNDU3MzM2MTgzJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2
MDMwNy0xMzAxMzkiCg==

--===============2194241166493070704==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0wNyAxNTozMToxMiAuL3J1bnRlc3QucHkgbHNlZWsxIDI1IGJvdGggMSA4IDE2IDI0
IDMyCg==

--===============2194241166493070704==--

