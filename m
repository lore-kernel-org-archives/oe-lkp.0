Content-Type: multipart/mixed; boundary="===============6943516079689187584=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [locks] 7f3697e24d: +35.1% will-it-scale.per_thread_ops
Date: Fri, 29 Jan 2016 09:32:19 +0800
Message-ID: <87powlp3vg.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6943516079689187584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 7f3697e24dc3820b10f445a4a7d914fc356012d1 ("locks: fix unlock when fc=
ntl_setlk races with a close")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-snb01/lo=
ck1/will-it-scale

commit: =

  9189922675ecca0fab38931d86b676e9d79602dc
  7f3697e24dc3820b10f445a4a7d914fc356012d1

9189922675ecca0f 7f3697e24dc3820b10f445a4a7 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2376432 =C2=B1  0%      +2.1%    2427484 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
    807889 =C2=B1  0%     +35.1%    1091496 =C2=B1  4%  will-it-scale.per_t=
hread_ops
     22.08 =C2=B1  2%     +89.1%      41.75 =C2=B1  5%  will-it-scale.time.=
user_time
   1238371 =C2=B1 14%    +100.4%    2481345 =C2=B1 39%  cpuidle.C1E-SNB.time
      3098 =C2=B1 57%     -66.6%       1035 =C2=B1171%  numa-numastat.node1=
.other_node
    379.25 =C2=B1  8%     -21.4%     298.00 =C2=B1 12%  numa-vmstat.node0.n=
r_alloc_batch
     22.08 =C2=B1  2%     +89.1%      41.75 =C2=B1  5%  time.user_time
      1795 =C2=B1  4%      +7.5%       1930 =C2=B1  2%  vmstat.system.cs
      0.54 =C2=B1  5%    +136.9%       1.28 =C2=B1 10%  perf-profile.cycles=
.___might_sleep.__might_sleep.kmem_cache_alloc.locks_alloc_lock.__posix_loc=
k_file
      1.65 =C2=B1 57%    +245.2%       5.70 =C2=B1 29%  perf-profile.cycles=
.__fdget_raw.sys_fcntl.entry_SYSCALL_64_fastpath
      1.58 =C2=B1 59%    +248.3%       5.50 =C2=B1 31%  perf-profile.cycles=
.__fget.__fget_light.__fdget_raw.sys_fcntl.entry_SYSCALL_64_fastpath
      1.62 =C2=B1 58%    +246.3%       5.63 =C2=B1 30%  perf-profile.cycles=
.__fget_light.__fdget_raw.sys_fcntl.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       5.88 =C2=B1 11%  perf-profile.cycles=
.__memset.locks_alloc_lock.__posix_lock_file.vfs_lock_file.do_lock_file_wait
      2.50 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.__memset.locks_alloc_lock.__posix_lock_file.vfs_lock_file.fcntl_setlk
      1.29 =C2=B1  4%    +138.8%       3.09 =C2=B1 11%  perf-profile.cycles=
.__memset.locks_alloc_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.47 =C2=B1  9%    +144.4%       1.16 =C2=B1 11%  perf-profile.cycles=
.__might_fault.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.37 =C2=B1 12%    +140.3%       0.90 =C2=B1  9%  perf-profile.cycles=
.__might_sleep.__might_fault.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.86 =C2=B1  6%    +137.7%       2.05 =C2=B1 10%  perf-profile.cycles=
.__might_sleep.kmem_cache_alloc.locks_alloc_lock.__posix_lock_file.vfs_lock=
_file
      0.61 =C2=B1 14%     +56.8%       0.95 =C2=B1 14%  perf-profile.cycles=
.__might_sleep.kmem_cache_alloc.locks_alloc_lock.fcntl_setlk.sys_fcntl
      0.00 =C2=B1 -1%      +Inf%      39.84 =C2=B1 12%  perf-profile.cycles=
.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcntl_setlk.sys_fcntl
     16.44 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fas=
tpath
      0.00 =C2=B1 -1%      +Inf%       1.77 =C2=B1 11%  perf-profile.cycles=
._raw_spin_lock.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcntl_set=
lk
     59.34 =C2=B1  1%     -72.4%      16.36 =C2=B1 33%  perf-profile.cycles=
._raw_spin_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.46 =C2=B1 11%    +144.9%       1.13 =C2=B1 19%  perf-profile.cycles=
.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_fcntl.security_file=
_fcntl
      0.87 =C2=B1  6%    +103.2%       1.77 =C2=B1 12%  perf-profile.cycles=
.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_lock.security_file_=
lock
      0.81 =C2=B1  4%    +135.7%       1.90 =C2=B1 10%  perf-profile.cycles=
.copy_user_generic_string.sys_fcntl.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      41.86 =C2=B1 12%  perf-profile.cycles=
.do_lock_file_wait.part.29.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.88 =C2=B1  6%    +127.8%       2.00 =C2=B1  9%  perf-profile.cycles=
.entry_SYSCALL_64
      0.86 =C2=B1  4%    +122.6%       1.92 =C2=B1 12%  perf-profile.cycles=
.entry_SYSCALL_64_after_swapgs
     84.98 =C2=B1  0%      -9.1%      77.20 =C2=B1  2%  perf-profile.cycles=
.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.76 =C2=B1 10%    +142.1%       1.84 =C2=B1 14%  perf-profile.cycles=
.file_has_perm.selinux_file_fcntl.security_file_fcntl.sys_fcntl.entry_SYSCA=
LL_64_fastpath
      1.35 =C2=B1  4%    +106.3%       2.78 =C2=B1 11%  perf-profile.cycles=
.file_has_perm.selinux_file_lock.security_file_lock.fcntl_setlk.sys_fcntl
      0.00 =C2=B1 -1%      +Inf%       0.89 =C2=B1 12%  perf-profile.cycles=
.flock_to_posix_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      6.90 =C2=B1  4%     -48.6%       3.55 =C2=B1 27%  perf-profile.cycles=
.fput.entry_SYSCALL_64_fastpath
      0.51 =C2=B1 10%    +140.5%       1.23 =C2=B1 16%  perf-profile.cycles=
.inode_has_perm.isra.31.file_has_perm.selinux_file_fcntl.security_file_fcnt=
l.sys_fcntl
      0.98 =C2=B1  4%     +97.7%       1.93 =C2=B1 11%  perf-profile.cycles=
.inode_has_perm.isra.31.file_has_perm.selinux_file_lock.security_file_lock.=
fcntl_setlk
      0.00 =C2=B1 -1%      +Inf%       6.56 =C2=B1 10%  perf-profile.cycles=
.kmem_cache_alloc.locks_alloc_lock.__posix_lock_file.vfs_lock_file.do_lock_=
file_wait
      2.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.kmem_cache_alloc.locks_alloc_lock.__posix_lock_file.vfs_lock_file.fcntl_se=
tlk
      1.53 =C2=B1  7%    +119.7%       3.37 =C2=B1 13%  perf-profile.cycles=
.kmem_cache_alloc.locks_alloc_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_f=
astpath
      0.00 =C2=B1 -1%      +Inf%       1.79 =C2=B1 11%  perf-profile.cycles=
.kmem_cache_free.locks_free_lock.__posix_lock_file.vfs_lock_file.do_lock_fi=
le_wait
      0.46 =C2=B1 14%    +257.0%       1.66 =C2=B1 11%  perf-profile.cycles=
.kmem_cache_free.locks_free_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fas=
tpath
      0.40 =C2=B1  7%    +158.6%       1.05 =C2=B1 17%  perf-profile.cycles=
.kmem_cache_free.locks_free_lock.locks_dispose_list.__posix_lock_file.vfs_l=
ock_file
      0.00 =C2=B1 -1%      +Inf%       0.96 =C2=B1 10%  perf-profile.cycles=
.lg_local_lock.locks_insert_lock_ctx.__posix_lock_file.vfs_lock_file.do_loc=
k_file_wait
      0.00 =C2=B1 -1%      +Inf%      14.69 =C2=B1 10%  perf-profile.cycles=
.locks_alloc_lock.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcntl_s=
etlk
      6.38 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.locks_alloc_lock.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl
      3.28 =C2=B1  6%    +127.1%       7.45 =C2=B1 12%  perf-profile.cycles=
.locks_alloc_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       9.75 =C2=B1 13%  perf-profile.cycles=
.locks_delete_lock_ctx.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fc=
ntl_setlk
      3.61 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.locks_delete_lock_ctx.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl
      0.00 =C2=B1 -1%      +Inf%       1.84 =C2=B1 11%  perf-profile.cycles=
.locks_dispose_list.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcntl=
_setlk
      0.00 =C2=B1 -1%      +Inf%       2.42 =C2=B1 10%  perf-profile.cycles=
.locks_free_lock.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcntl_se=
tlk
      1.00 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.locks_free_lock.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl
      0.63 =C2=B1 11%    +224.1%       2.05 =C2=B1 10%  perf-profile.cycles=
.locks_free_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.22 =C2=B1 14%  perf-profile.cycles=
.locks_free_lock.locks_dispose_list.__posix_lock_file.vfs_lock_file.do_lock=
_file_wait
      0.00 =C2=B1 -1%      +Inf%       6.17 =C2=B1 15%  perf-profile.cycles=
.locks_insert_lock_ctx.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fc=
ntl_setlk
      2.31 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.locks_insert_lock_ctx.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl
      0.00 =C2=B1 -1%      +Inf%       8.96 =C2=B1 13%  perf-profile.cycles=
.locks_unlink_lock_ctx.locks_delete_lock_ctx.__posix_lock_file.vfs_lock_fil=
e.do_lock_file_wait
      3.27 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.locks_unlink_lock_ctx.locks_delete_lock_ctx.__posix_lock_file.vfs_lock_fil=
e.fcntl_setlk
     53.88 =C2=B1  1%     -79.7%      10.92 =C2=B1 46%  perf-profile.cycles=
.native_queued_spin_lock_slowpath._raw_spin_lock.fcntl_setlk.sys_fcntl.entr=
y_SYSCALL_64_fastpath
      2.75 =C2=B1  0%    +183.3%       7.79 =C2=B1 13%  perf-profile.cycles=
.put_pid.locks_unlink_lock_ctx.locks_delete_lock_ctx.__posix_lock_file.vfs_=
lock_file
      1.11 =C2=B1  9%    +137.2%       2.63 =C2=B1 14%  perf-profile.cycles=
.security_file_fcntl.sys_fcntl.entry_SYSCALL_64_fastpath
      1.69 =C2=B1  4%    +118.2%       3.69 =C2=B1 11%  perf-profile.cycles=
.security_file_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
      0.91 =C2=B1  9%    +139.0%       2.17 =C2=B1 14%  perf-profile.cycles=
.selinux_file_fcntl.security_file_fcntl.sys_fcntl.entry_SYSCALL_64_fastpath
      1.39 =C2=B1  4%    +114.6%       2.97 =C2=B1 10%  perf-profile.cycles=
.selinux_file_lock.security_file_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_6=
4_fastpath
      0.00 =C2=B1 -1%      +Inf%      41.12 =C2=B1 12%  perf-profile.cycles=
.vfs_lock_file.do_lock_file_wait.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fas=
tpath
     17.04 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.vfs_lock_file.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
     34.75 =C2=B1148%    +132.4%      80.75 =C2=B1 82%  sched_debug.cfs_rq:=
/.load.8
     15.00 =C2=B1  9%    +198.3%      44.75 =C2=B1 72%  sched_debug.cfs_rq:=
/.load_avg.21
     25.00 =C2=B1 29%    +574.0%     168.50 =C2=B1 78%  sched_debug.cfs_rq:=
/.load_avg.9
     38.47 =C2=B1  5%     +29.1%      49.65 =C2=B1 26%  sched_debug.cfs_rq:=
/.load_avg.avg
     63.17 =C2=B1 10%     +44.3%      91.16 =C2=B1 36%  sched_debug.cfs_rq:=
/.load_avg.stddev
    893865 =C2=B1 12%     -12.5%     782455 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.25
     18.25 =C2=B1 26%     +52.1%      27.75 =C2=B1 25%  sched_debug.cfs_rq:=
/.runnable_load_avg.9
    -57635 =C2=B1-68%    -196.4%      55548 =C2=B1130%  sched_debug.cfs_rq:=
/.spread0.1
   -802264 =C2=B1-25%     -29.5%    -565458 =C2=B1-49%  sched_debug.cfs_rq:=
/.spread0.8
   -804662 =C2=B1-25%     -29.4%    -567811 =C2=B1-48%  sched_debug.cfs_rq:=
/.spread0.min
      1233 =C2=B1  5%     +30.9%       1614 =C2=B1 28%  sched_debug.cfs_rq:=
/.tg_load_avg.0
      1233 =C2=B1  5%     +30.9%       1614 =C2=B1 28%  sched_debug.cfs_rq:=
/.tg_load_avg.1
      1228 =C2=B1  5%     +30.3%       1601 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.10
      1228 =C2=B1  5%     +30.4%       1601 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.11
      1228 =C2=B1  5%     +30.3%       1601 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.12
      1229 =C2=B1  5%     +30.0%       1598 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.13
      1228 =C2=B1  5%     +30.1%       1598 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.14
      1229 =C2=B1  5%     +30.0%       1598 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.15
      1226 =C2=B1  5%     +30.3%       1598 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.16
      1226 =C2=B1  5%     +30.2%       1597 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.17
      1227 =C2=B1  5%     +30.1%       1595 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.18
      1227 =C2=B1  5%     +29.4%       1588 =C2=B1 26%  sched_debug.cfs_rq:=
/.tg_load_avg.19
      1233 =C2=B1  5%     +30.4%       1609 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.2
      1222 =C2=B1  5%     +29.9%       1587 =C2=B1 26%  sched_debug.cfs_rq:=
/.tg_load_avg.20
      1223 =C2=B1  5%     +24.2%       1519 =C2=B1 20%  sched_debug.cfs_rq:=
/.tg_load_avg.21
      1223 =C2=B1  5%     +23.8%       1515 =C2=B1 20%  sched_debug.cfs_rq:=
/.tg_load_avg.22
      1223 =C2=B1  5%     +23.9%       1515 =C2=B1 20%  sched_debug.cfs_rq:=
/.tg_load_avg.23
      1223 =C2=B1  5%     +23.9%       1515 =C2=B1 20%  sched_debug.cfs_rq:=
/.tg_load_avg.24
      1223 =C2=B1  5%     +23.5%       1511 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg.25
      1224 =C2=B1  5%     +23.5%       1512 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg.26
      1223 =C2=B1  5%     +23.1%       1506 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg.27
      1223 =C2=B1  5%     +22.5%       1499 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg.28
      1224 =C2=B1  5%     +22.5%       1499 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg.29
      1233 =C2=B1  5%     +30.3%       1607 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.3
      1223 =C2=B1  5%     +22.2%       1495 =C2=B1 18%  sched_debug.cfs_rq:=
/.tg_load_avg.30
      1224 =C2=B1  5%     +22.0%       1493 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg.31
      1234 =C2=B1  5%     +30.0%       1604 =C2=B1 28%  sched_debug.cfs_rq:=
/.tg_load_avg.4
      1233 =C2=B1  5%     +30.0%       1604 =C2=B1 28%  sched_debug.cfs_rq:=
/.tg_load_avg.5
      1231 =C2=B1  5%     +30.3%       1604 =C2=B1 28%  sched_debug.cfs_rq:=
/.tg_load_avg.6
      1233 =C2=B1  5%     +30.0%       1603 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.7
      1231 =C2=B1  5%     +30.1%       1601 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.8
      1228 =C2=B1  5%     +30.3%       1601 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.9
      1228 =C2=B1  5%     +27.8%       1569 =C2=B1 24%  sched_debug.cfs_rq:=
/.tg_load_avg.avg
      1246 =C2=B1  5%     +30.7%       1628 =C2=B1 27%  sched_debug.cfs_rq:=
/.tg_load_avg.max
      1212 =C2=B1  5%     +22.2%       1481 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg.min
     15.00 =C2=B1  9%    +198.3%      44.75 =C2=B1 72%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.21
     25.00 =C2=B1 29%    +574.0%     168.50 =C2=B1 78%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.9
     38.53 =C2=B1  5%     +29.0%      49.71 =C2=B1 26%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.avg
     63.34 =C2=B1 10%     +44.1%      91.30 =C2=B1 36%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.stddev
    532.25 =C2=B1  2%      +8.5%     577.50 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.15
    210.75 =C2=B1 14%     -14.4%     180.50 =C2=B1  4%  sched_debug.cfs_rq:=
/.util_avg.29
    450.00 =C2=B1 22%     +50.7%     678.00 =C2=B1 18%  sched_debug.cfs_rq:=
/.util_avg.9
    955572 =C2=B1  4%     -10.2%     857813 =C2=B1  5%  sched_debug.cpu.avg=
_idle.6
     23.99 =C2=B1 60%     -76.2%       5.71 =C2=B1 24%  sched_debug.cpu.clo=
ck.stddev
     23.99 =C2=B1 60%     -76.2%       5.71 =C2=B1 24%  sched_debug.cpu.clo=
ck_task.stddev
      2840 =C2=B1 37%     -47.4%       1492 =C2=B1 65%  sched_debug.cpu.cur=
r->pid.25
     34.75 =C2=B1148%    +132.4%      80.75 =C2=B1 82%  sched_debug.cpu.loa=
d.8
     61776 =C2=B1  7%      -7.1%      57380 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.25
      6543 =C2=B1  2%     +20.4%       7879 =C2=B1  9%  sched_debug.cpu.nr_=
switches.0
      5256 =C2=B1 23%    +177.1%      14566 =C2=B1 52%  sched_debug.cpu.nr_=
switches.27
      7915 =C2=B1  3%      +8.7%       8605 =C2=B1  3%  sched_debug.cpu.nr_=
switches.avg
     -0.25 =C2=B1-519%   +1900.0%      -5.00 =C2=B1-24%  sched_debug.cpu.nr=
_uninterruptible.12
      2.00 =C2=B1 93%    -125.0%      -0.50 =C2=B1-300%  sched_debug.cpu.nr=
_uninterruptible.24
     17468 =C2=B1 14%    +194.3%      51413 =C2=B1 75%  sched_debug.cpu.sch=
ed_count.15
      2112 =C2=B1  2%     +20.8%       2552 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.0
      2103 =C2=B1 34%    +219.0%       6709 =C2=B1 55%  sched_debug.cpu.sch=
ed_goidle.27
      3159 =C2=B1  3%      +8.2%       3418 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.avg
      1323 =C2=B1 64%     -72.7%     361.50 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.23
      3264 =C2=B1 12%     +94.4%       6347 =C2=B1 41%  sched_debug.cpu.ttw=
u_count.27
      3860 =C2=B1  3%      +9.0%       4208 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.avg
      2358 =C2=B1  3%     +28.7%       3035 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.0
      1110 =C2=B1 22%     +54.6%       1716 =C2=B1 28%  sched_debug.cpu.ttw=
u_local.27
      1814 =C2=B1  8%     +16.1%       2106 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.stddev


lkp-snb01: Sandy Bridge-EP
Memory: 32G

                             will-it-scale.per_thread_ops

   1.2e+06 ++--------------------------------------------------------------=
-+
           |                                  O                            =
 |
  1.15e+06 O+O O   O O   O   O   O   O                                     =
 |
   1.1e+06 ++                                                              =
 |
           |     O             O   O   O O OO                              =
 |
  1.05e+06 ++          O   O                                               =
 |
     1e+06 ++                                                              =
 |
           |                                                               =
 |
    950000 ++                                                              =
 |
    900000 ++                                                              =
 |
           |                                                               =
 |
    850000 ++                                                              =
 |
    800000 *+*.*.*.*.*.*.*.*.*.*.*.*. .*.*. *.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*=
.*
           |                         *     *                               =
 |
    750000 ++--------------------------------------------------------------=
-+


                          will-it-scale.time.user_time

  50 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  45 ++         O   O   O    O   O          O                              =
 |
     O O O    O                                                            =
 |
     |     O          O        O   O O                                     =
 |
  40 ++           O        O           O  O                                =
 |
     |                                                                     =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
     |            *                                                        =
 |
  25 ++          + +                                                       =
 |
     *.*.*.*..*.*   *.*.*..*.*.*.*.*.*.*..*.*.*.*.*.*.*..*.*.*.*.*.*..*.*.*=
.*
  20 ++--------------------------------------------------------------------=
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

--===============6943516079689187584==
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
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDdmMzY5
N2UyNGRjMzgyMGIxMGY0NDVhNGE3ZDkxNGZjMzU2MDEyZDEKbW9kZWw6IFNhbmR5IEJyaWRnZS1F
UAptZW1vcnk6IDMyRwpoZGRfcGFydGl0aW9uczogIi9kZXYvc2RhMiIKc3dhcF9wYXJ0aXRpb25z
OiAKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQt
c2NhbGU6CiAgdGVzdDogbG9jazEKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3Atc25iMDEKdGJv
eF9ncm91cDogbGtwLXNuYjAxCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAx
Ni0wMS0yOCAxNDo1MDoyMS42OTkxNzg5NjUgKzA4OjAwCmlkOiBjM2VkNzI5MzhkMzgzYTIxMWVm
ZmNlN2ZhY2M5NzhjMmNjMjQ3YWE4CnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2Nv
bW1pdDogOTJlOTYzZjUwZmM3NDA0MWI1ZTllNzQ0YzMzMGRjYTQ4ZTA0ZjA4ZApiYXNlX2NvbW1p
dDogNTM0OGMxZTllMGRjMmI2MmE0ODRjNGI3NGE4ZDFkNTlhYTk2MjBhNApicmFuY2g6IGxpbnVz
L21hc3Rlcgpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6
ICIvcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtbG9jazEvbGtwLXNuYjAxL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS83ZjM2OTdlMjRkYzM4
MjBiMTBmNDQ1YTRhN2Q5MTRmYzM1NjAxMmQxLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQv
bGtwLXNuYjAxL2Jpc2VjdF93aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLWxvY2sxLWRlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtN2YzNjk3ZTI0ZGMzODIwYjEwZjQ0NWE0
YTdkOTE0ZmMzNTYwMTJkMS0yMDE2MDEyOC03NTkxMS0xMWhkYXB5LTAueWFtbCIKbnJfY3B1OiAi
JChucHJvYykiCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9y
YW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXNuYjAxL2Jpc2VjdF93aWxs
LWl0LXNjYWxlLXBlcmZvcm1hbmNlLWxvY2sxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ot
eDg2XzY0LXJoZWwtN2YzNjk3ZTI0ZGMzODIwYjEwZjQ0NWE0YTdkOTE0ZmMzNTYwMTJkMS0yMDE2
MDEyOC03NTkxMS0xMWhkYXB5LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQt
cmhlbAotIGJyYW5jaD1saW51cy9tYXN0ZXIKLSBjb21taXQ9N2YzNjk3ZTI0ZGMzODIwYjEwZjQ0
NWE0YTdkOTE0ZmMzNTYwMTJkMQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45LzdmMzY5N2UyNGRjMzgyMGIxMGY0NDVhNGE3ZDkxNGZjMzU2MDEyZDEvdm1saW51ei00
LjQuMC1yYzEtMDAwMDUtZzdmMzY5N2UKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0v
cmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtbG9jazEvbGtwLXNuYjAxL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS83ZjM2OTdlMjRkYzM4MjBi
MTBmNDQ1YTRhN2Q5MTRmYzM1NjAxMmQxLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFy
bHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9
ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0
PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29w
cz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwx
MTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtw
L2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwv
Z2NjLTQuOS83ZjM2OTdlMjRkYzM4MjBiMTBmNDQ1YTRhN2Q5MTRmYzM1NjAxMmQxL21vZHVsZXMu
Y2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVu
LWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
dHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFy
a3Mvd2lsbC1pdC1zY2FsZS5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzdmMzY5N2UyNGRjMzgyMGIxMGY0NDVhNGE3ZDkxNGZjMzU2MDEy
ZDEvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvN2YzNjk3ZTI0ZGMzODIwYjEwZjQ0NWE0YTdkOTE0ZmMzNTYwMTJk
MS92bWxpbnV6LTQuNC4wLXJjMS0wMDAwNS1nN2YzNjk3ZSIKZGVxdWV1ZV90aW1lOiAyMDE2LTAx
LTI4IDE1OjExOjU2LjkxMDg5NjYxOSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZn
OiAyNy44OCAxMi41OCA0LjkzIDIvMzY4IDkwOTMKc3RhcnRfdGltZTogJzE0NTM5NjUxNTgnCmVu
ZF90aW1lOiAnMTQ1Mzk2NTQ2OCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAxMjctMjIz
ODUzIgo=

--===============6943516079689187584==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0yOCAxNToxMjozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI4IDE1OjEyOjM3IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEt
MjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI4IDE1OjEyOjM3IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjgg
MTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI4IDE1OjEyOjM3IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6
MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAxLTI4IDE1OjEyOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjoz
NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAxLTI4IDE1OjEyOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTI4IDE1OjEyOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTI4IDE1OjEyOjM3IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTI4IDE1OjEyOjM3IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0yOCAxNToxMjozNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjgg
MTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6
MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDEtMjggMTU6MTI6MzcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMjggMTU6MTI6MzggLi9y
dW50ZXN0LnB5IGxvY2sxIDI1IGJvdGggMSA4IDE2IDI0IDMyCg==

--===============6943516079689187584==--

