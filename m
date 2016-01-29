Content-Type: multipart/mixed; boundary="===============6794786568998550434=="
MIME-Version: 1.0
From: Jeff Layton <jeff.layton@primarydata.com>
To: lkp@lists.01.org
Subject: Re: [locks] 7f3697e24d: +35.1% will-it-scale.per_thread_ops
Date: Fri, 29 Jan 2016 07:13:24 -0500
Message-ID: <20160129071324.44122d27@tlielax.poochiereds.net>
In-Reply-To: <87h9hxp063.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6794786568998550434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Jan 2016 10:52:20 +0800
"Huang\, Ying" <ying.huang@intel.com> wrote:

> Jeff Layton <jeff.layton@primarydata.com> writes:
> =

> > On Fri, 29 Jan 2016 09:32:19 +0800
> > kernel test robot <ying.huang@linux.intel.com> wrote:
> >  =

> >> FYI, we noticed the below changes on
> >> =

> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mas=
ter
> >> commit 7f3697e24dc3820b10f445a4a7d914fc356012d1 ("locks: fix unlock wh=
en fcntl_setlk races with a close")
> >> =

> >> =

> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
> >>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-snb=
01/lock1/will-it-scale
> >> =

> >> commit: =

> >>   9189922675ecca0fab38931d86b676e9d79602dc
> >>   7f3697e24dc3820b10f445a4a7d914fc356012d1
> >> =

> >> 9189922675ecca0f 7f3697e24dc3820b10f445a4a7 =

> >> ---------------- -------------------------- =

> >>          %stddev     %change         %stddev
> >>              \          |                \  =

> >>    2376432 =C2=B1  0%      +2.1%    2427484 =C2=B1  0%  will-it-scale.=
per_process_ops
> >>     807889 =C2=B1  0%     +35.1%    1091496 =C2=B1  4%  will-it-scale.=
per_thread_ops
> >>      22.08 =C2=B1  2%     +89.1%      41.75 =C2=B1  5%  will-it-scale.=
time.user_time
> >>    1238371 =C2=B1 14%    +100.4%    2481345 =C2=B1 39%  cpuidle.C1E-SN=
B.time
> >>       3098 =C2=B1 57%     -66.6%       1035 =C2=B1171%  numa-numastat.=
node1.other_node
> >>     379.25 =C2=B1  8%     -21.4%     298.00 =C2=B1 12%  numa-vmstat.no=
de0.nr_alloc_batch
> >>      22.08 =C2=B1  2%     +89.1%      41.75 =C2=B1  5%  time.user_time
> >>       1795 =C2=B1  4%      +7.5%       1930 =C2=B1  2%  vmstat.system.=
cs
> >>       0.54 =C2=B1  5%    +136.9%       1.28 =C2=B1 10%  perf-profile.c=
ycles.___might_sleep.__might_sleep.kmem_cache_alloc.locks_alloc_lock.__posi=
x_lock_file
> >>       1.65 =C2=B1 57%    +245.2%       5.70 =C2=B1 29%  perf-profile.c=
ycles.__fdget_raw.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       1.58 =C2=B1 59%    +248.3%       5.50 =C2=B1 31%  perf-profile.c=
ycles.__fget.__fget_light.__fdget_raw.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       1.62 =C2=B1 58%    +246.3%       5.63 =C2=B1 30%  perf-profile.c=
ycles.__fget_light.__fdget_raw.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.00 =C2=B1 -1%      +Inf%       5.88 =C2=B1 11%  perf-profile.c=
ycles.__memset.locks_alloc_lock.__posix_lock_file.vfs_lock_file.do_lock_fil=
e_wait
> >>       2.50 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.__memset.locks_alloc_lock.__posix_lock_file.vfs_lock_file.fcntl_setlk
> >>       1.29 =C2=B1  4%    +138.8%       3.09 =C2=B1 11%  perf-profile.c=
ycles.__memset.locks_alloc_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fast=
path
> >>       0.47 =C2=B1  9%    +144.4%       1.16 =C2=B1 11%  perf-profile.c=
ycles.__might_fault.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.37 =C2=B1 12%    +140.3%       0.90 =C2=B1  9%  perf-profile.c=
ycles.__might_sleep.__might_fault.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fa=
stpath
> >>       0.86 =C2=B1  6%    +137.7%       2.05 =C2=B1 10%  perf-profile.c=
ycles.__might_sleep.kmem_cache_alloc.locks_alloc_lock.__posix_lock_file.vfs=
_lock_file
> >>       0.61 =C2=B1 14%     +56.8%       0.95 =C2=B1 14%  perf-profile.c=
ycles.__might_sleep.kmem_cache_alloc.locks_alloc_lock.fcntl_setlk.sys_fcntl
> >>       0.00 =C2=B1 -1%      +Inf%      39.84 =C2=B1 12%  perf-profile.c=
ycles.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcntl_setlk.sys_fcn=
tl
> >>      16.44 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl.entry_SYSCALL_6=
4_fastpath
> >>       0.00 =C2=B1 -1%      +Inf%       1.77 =C2=B1 11%  perf-profile.c=
ycles._raw_spin_lock.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcnt=
l_setlk
> >>      59.34 =C2=B1  1%     -72.4%      16.36 =C2=B1 33%  perf-profile.c=
ycles._raw_spin_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.46 =C2=B1 11%    +144.9%       1.13 =C2=B1 19%  perf-profile.c=
ycles.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_fcntl.security=
_file_fcntl
> >>       0.87 =C2=B1  6%    +103.2%       1.77 =C2=B1 12%  perf-profile.c=
ycles.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_lock.security_=
file_lock
> >>       0.81 =C2=B1  4%    +135.7%       1.90 =C2=B1 10%  perf-profile.c=
ycles.copy_user_generic_string.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.00 =C2=B1 -1%      +Inf%      41.86 =C2=B1 12%  perf-profile.c=
ycles.do_lock_file_wait.part.29.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fast=
path
> >>       0.88 =C2=B1  6%    +127.8%       2.00 =C2=B1  9%  perf-profile.c=
ycles.entry_SYSCALL_64
> >>       0.86 =C2=B1  4%    +122.6%       1.92 =C2=B1 12%  perf-profile.c=
ycles.entry_SYSCALL_64_after_swapgs
> >>      84.98 =C2=B1  0%      -9.1%      77.20 =C2=B1  2%  perf-profile.c=
ycles.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.76 =C2=B1 10%    +142.1%       1.84 =C2=B1 14%  perf-profile.c=
ycles.file_has_perm.selinux_file_fcntl.security_file_fcntl.sys_fcntl.entry_=
SYSCALL_64_fastpath
> >>       1.35 =C2=B1  4%    +106.3%       2.78 =C2=B1 11%  perf-profile.c=
ycles.file_has_perm.selinux_file_lock.security_file_lock.fcntl_setlk.sys_fc=
ntl
> >>       0.00 =C2=B1 -1%      +Inf%       0.89 =C2=B1 12%  perf-profile.c=
ycles.flock_to_posix_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       6.90 =C2=B1  4%     -48.6%       3.55 =C2=B1 27%  perf-profile.c=
ycles.fput.entry_SYSCALL_64_fastpath
> >>       0.51 =C2=B1 10%    +140.5%       1.23 =C2=B1 16%  perf-profile.c=
ycles.inode_has_perm.isra.31.file_has_perm.selinux_file_fcntl.security_file=
_fcntl.sys_fcntl
> >>       0.98 =C2=B1  4%     +97.7%       1.93 =C2=B1 11%  perf-profile.c=
ycles.inode_has_perm.isra.31.file_has_perm.selinux_file_lock.security_file_=
lock.fcntl_setlk
> >>       0.00 =C2=B1 -1%      +Inf%       6.56 =C2=B1 10%  perf-profile.c=
ycles.kmem_cache_alloc.locks_alloc_lock.__posix_lock_file.vfs_lock_file.do_=
lock_file_wait
> >>       2.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.kmem_cache_alloc.locks_alloc_lock.__posix_lock_file.vfs_lock_file.fcn=
tl_setlk
> >>       1.53 =C2=B1  7%    +119.7%       3.37 =C2=B1 13%  perf-profile.c=
ycles.kmem_cache_alloc.locks_alloc_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL=
_64_fastpath
> >>       0.00 =C2=B1 -1%      +Inf%       1.79 =C2=B1 11%  perf-profile.c=
ycles.kmem_cache_free.locks_free_lock.__posix_lock_file.vfs_lock_file.do_lo=
ck_file_wait
> >>       0.46 =C2=B1 14%    +257.0%       1.66 =C2=B1 11%  perf-profile.c=
ycles.kmem_cache_free.locks_free_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_6=
4_fastpath
> >>       0.40 =C2=B1  7%    +158.6%       1.05 =C2=B1 17%  perf-profile.c=
ycles.kmem_cache_free.locks_free_lock.locks_dispose_list.__posix_lock_file.=
vfs_lock_file
> >>       0.00 =C2=B1 -1%      +Inf%       0.96 =C2=B1 10%  perf-profile.c=
ycles.lg_local_lock.locks_insert_lock_ctx.__posix_lock_file.vfs_lock_file.d=
o_lock_file_wait
> >>       0.00 =C2=B1 -1%      +Inf%      14.69 =C2=B1 10%  perf-profile.c=
ycles.locks_alloc_lock.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fc=
ntl_setlk
> >>       6.38 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.locks_alloc_lock.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl
> >>       3.28 =C2=B1  6%    +127.1%       7.45 =C2=B1 12%  perf-profile.c=
ycles.locks_alloc_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.00 =C2=B1 -1%      +Inf%       9.75 =C2=B1 13%  perf-profile.c=
ycles.locks_delete_lock_ctx.__posix_lock_file.vfs_lock_file.do_lock_file_wa=
it.fcntl_setlk
> >>       3.61 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.locks_delete_lock_ctx.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys=
_fcntl
> >>       0.00 =C2=B1 -1%      +Inf%       1.84 =C2=B1 11%  perf-profile.c=
ycles.locks_dispose_list.__posix_lock_file.vfs_lock_file.do_lock_file_wait.=
fcntl_setlk
> >>       0.00 =C2=B1 -1%      +Inf%       2.42 =C2=B1 10%  perf-profile.c=
ycles.locks_free_lock.__posix_lock_file.vfs_lock_file.do_lock_file_wait.fcn=
tl_setlk
> >>       1.00 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.locks_free_lock.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys_fcntl
> >>       0.63 =C2=B1 11%    +224.1%       2.05 =C2=B1 10%  perf-profile.c=
ycles.locks_free_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.00 =C2=B1 -1%      +Inf%       1.22 =C2=B1 14%  perf-profile.c=
ycles.locks_free_lock.locks_dispose_list.__posix_lock_file.vfs_lock_file.do=
_lock_file_wait
> >>       0.00 =C2=B1 -1%      +Inf%       6.17 =C2=B1 15%  perf-profile.c=
ycles.locks_insert_lock_ctx.__posix_lock_file.vfs_lock_file.do_lock_file_wa=
it.fcntl_setlk
> >>       2.31 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.locks_insert_lock_ctx.__posix_lock_file.vfs_lock_file.fcntl_setlk.sys=
_fcntl
> >>       0.00 =C2=B1 -1%      +Inf%       8.96 =C2=B1 13%  perf-profile.c=
ycles.locks_unlink_lock_ctx.locks_delete_lock_ctx.__posix_lock_file.vfs_loc=
k_file.do_lock_file_wait
> >>       3.27 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.locks_unlink_lock_ctx.locks_delete_lock_ctx.__posix_lock_file.vfs_loc=
k_file.fcntl_setlk
> >>      53.88 =C2=B1  1%     -79.7%      10.92 =C2=B1 46%  perf-profile.c=
ycles.native_queued_spin_lock_slowpath._raw_spin_lock.fcntl_setlk.sys_fcntl=
.entry_SYSCALL_64_fastpath
> >>       2.75 =C2=B1  0%    +183.3%       7.79 =C2=B1 13%  perf-profile.c=
ycles.put_pid.locks_unlink_lock_ctx.locks_delete_lock_ctx.__posix_lock_file=
.vfs_lock_file
> >>       1.11 =C2=B1  9%    +137.2%       2.63 =C2=B1 14%  perf-profile.c=
ycles.security_file_fcntl.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       1.69 =C2=B1  4%    +118.2%       3.69 =C2=B1 11%  perf-profile.c=
ycles.security_file_lock.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>       0.91 =C2=B1  9%    +139.0%       2.17 =C2=B1 14%  perf-profile.c=
ycles.selinux_file_fcntl.security_file_fcntl.sys_fcntl.entry_SYSCALL_64_fas=
tpath
> >>       1.39 =C2=B1  4%    +114.6%       2.97 =C2=B1 10%  perf-profile.c=
ycles.selinux_file_lock.security_file_lock.fcntl_setlk.sys_fcntl.entry_SYSC=
ALL_64_fastpath
> >>       0.00 =C2=B1 -1%      +Inf%      41.12 =C2=B1 12%  perf-profile.c=
ycles.vfs_lock_file.do_lock_file_wait.fcntl_setlk.sys_fcntl.entry_SYSCALL_6=
4_fastpath
> >>      17.04 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles.vfs_lock_file.fcntl_setlk.sys_fcntl.entry_SYSCALL_64_fastpath
> >>      34.75 =C2=B1148%    +132.4%      80.75 =C2=B1 82%  sched_debug.cf=
s_rq:/.load.8
> >>      15.00 =C2=B1  9%    +198.3%      44.75 =C2=B1 72%  sched_debug.cf=
s_rq:/.load_avg.21
> >>      25.00 =C2=B1 29%    +574.0%     168.50 =C2=B1 78%  sched_debug.cf=
s_rq:/.load_avg.9
> >>      38.47 =C2=B1  5%     +29.1%      49.65 =C2=B1 26%  sched_debug.cf=
s_rq:/.load_avg.avg
> >>      63.17 =C2=B1 10%     +44.3%      91.16 =C2=B1 36%  sched_debug.cf=
s_rq:/.load_avg.stddev
> >>     893865 =C2=B1 12%     -12.5%     782455 =C2=B1  0%  sched_debug.cf=
s_rq:/.min_vruntime.25
> >>      18.25 =C2=B1 26%     +52.1%      27.75 =C2=B1 25%  sched_debug.cf=
s_rq:/.runnable_load_avg.9
> >>     -57635 =C2=B1-68%    -196.4%      55548 =C2=B1130%  sched_debug.cf=
s_rq:/.spread0.1
> >>    -802264 =C2=B1-25%     -29.5%    -565458 =C2=B1-49%  sched_debug.cf=
s_rq:/.spread0.8
> >>    -804662 =C2=B1-25%     -29.4%    -567811 =C2=B1-48%  sched_debug.cf=
s_rq:/.spread0.min
> >>       1233 =C2=B1  5%     +30.9%       1614 =C2=B1 28%  sched_debug.cf=
s_rq:/.tg_load_avg.0
> >>       1233 =C2=B1  5%     +30.9%       1614 =C2=B1 28%  sched_debug.cf=
s_rq:/.tg_load_avg.1
> >>       1228 =C2=B1  5%     +30.3%       1601 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.10
> >>       1228 =C2=B1  5%     +30.4%       1601 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.11
> >>       1228 =C2=B1  5%     +30.3%       1601 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.12
> >>       1229 =C2=B1  5%     +30.0%       1598 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.13
> >>       1228 =C2=B1  5%     +30.1%       1598 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.14
> >>       1229 =C2=B1  5%     +30.0%       1598 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.15
> >>       1226 =C2=B1  5%     +30.3%       1598 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.16
> >>       1226 =C2=B1  5%     +30.2%       1597 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.17
> >>       1227 =C2=B1  5%     +30.1%       1595 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.18
> >>       1227 =C2=B1  5%     +29.4%       1588 =C2=B1 26%  sched_debug.cf=
s_rq:/.tg_load_avg.19
> >>       1233 =C2=B1  5%     +30.4%       1609 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.2
> >>       1222 =C2=B1  5%     +29.9%       1587 =C2=B1 26%  sched_debug.cf=
s_rq:/.tg_load_avg.20
> >>       1223 =C2=B1  5%     +24.2%       1519 =C2=B1 20%  sched_debug.cf=
s_rq:/.tg_load_avg.21
> >>       1223 =C2=B1  5%     +23.8%       1515 =C2=B1 20%  sched_debug.cf=
s_rq:/.tg_load_avg.22
> >>       1223 =C2=B1  5%     +23.9%       1515 =C2=B1 20%  sched_debug.cf=
s_rq:/.tg_load_avg.23
> >>       1223 =C2=B1  5%     +23.9%       1515 =C2=B1 20%  sched_debug.cf=
s_rq:/.tg_load_avg.24
> >>       1223 =C2=B1  5%     +23.5%       1511 =C2=B1 19%  sched_debug.cf=
s_rq:/.tg_load_avg.25
> >>       1224 =C2=B1  5%     +23.5%       1512 =C2=B1 19%  sched_debug.cf=
s_rq:/.tg_load_avg.26
> >>       1223 =C2=B1  5%     +23.1%       1506 =C2=B1 19%  sched_debug.cf=
s_rq:/.tg_load_avg.27
> >>       1223 =C2=B1  5%     +22.5%       1499 =C2=B1 19%  sched_debug.cf=
s_rq:/.tg_load_avg.28
> >>       1224 =C2=B1  5%     +22.5%       1499 =C2=B1 19%  sched_debug.cf=
s_rq:/.tg_load_avg.29
> >>       1233 =C2=B1  5%     +30.3%       1607 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.3
> >>       1223 =C2=B1  5%     +22.2%       1495 =C2=B1 18%  sched_debug.cf=
s_rq:/.tg_load_avg.30
> >>       1224 =C2=B1  5%     +22.0%       1493 =C2=B1 19%  sched_debug.cf=
s_rq:/.tg_load_avg.31
> >>       1234 =C2=B1  5%     +30.0%       1604 =C2=B1 28%  sched_debug.cf=
s_rq:/.tg_load_avg.4
> >>       1233 =C2=B1  5%     +30.0%       1604 =C2=B1 28%  sched_debug.cf=
s_rq:/.tg_load_avg.5
> >>       1231 =C2=B1  5%     +30.3%       1604 =C2=B1 28%  sched_debug.cf=
s_rq:/.tg_load_avg.6
> >>       1233 =C2=B1  5%     +30.0%       1603 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.7
> >>       1231 =C2=B1  5%     +30.1%       1601 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.8
> >>       1228 =C2=B1  5%     +30.3%       1601 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.9
> >>       1228 =C2=B1  5%     +27.8%       1569 =C2=B1 24%  sched_debug.cf=
s_rq:/.tg_load_avg.avg
> >>       1246 =C2=B1  5%     +30.7%       1628 =C2=B1 27%  sched_debug.cf=
s_rq:/.tg_load_avg.max
> >>       1212 =C2=B1  5%     +22.2%       1481 =C2=B1 19%  sched_debug.cf=
s_rq:/.tg_load_avg.min
> >>      15.00 =C2=B1  9%    +198.3%      44.75 =C2=B1 72%  sched_debug.cf=
s_rq:/.tg_load_avg_contrib.21
> >>      25.00 =C2=B1 29%    +574.0%     168.50 =C2=B1 78%  sched_debug.cf=
s_rq:/.tg_load_avg_contrib.9
> >>      38.53 =C2=B1  5%     +29.0%      49.71 =C2=B1 26%  sched_debug.cf=
s_rq:/.tg_load_avg_contrib.avg
> >>      63.34 =C2=B1 10%     +44.1%      91.30 =C2=B1 36%  sched_debug.cf=
s_rq:/.tg_load_avg_contrib.stddev
> >>     532.25 =C2=B1  2%      +8.5%     577.50 =C2=B1  6%  sched_debug.cf=
s_rq:/.util_avg.15
> >>     210.75 =C2=B1 14%     -14.4%     180.50 =C2=B1  4%  sched_debug.cf=
s_rq:/.util_avg.29
> >>     450.00 =C2=B1 22%     +50.7%     678.00 =C2=B1 18%  sched_debug.cf=
s_rq:/.util_avg.9
> >>     955572 =C2=B1  4%     -10.2%     857813 =C2=B1  5%  sched_debug.cp=
u.avg_idle.6
> >>      23.99 =C2=B1 60%     -76.2%       5.71 =C2=B1 24%  sched_debug.cp=
u.clock.stddev
> >>      23.99 =C2=B1 60%     -76.2%       5.71 =C2=B1 24%  sched_debug.cp=
u.clock_task.stddev
> >>       2840 =C2=B1 37%     -47.4%       1492 =C2=B1 65%  sched_debug.cp=
u.curr->pid.25
> >>      34.75 =C2=B1148%    +132.4%      80.75 =C2=B1 82%  sched_debug.cp=
u.load.8
> >>      61776 =C2=B1  7%      -7.1%      57380 =C2=B1  0%  sched_debug.cp=
u.nr_load_updates.25
> >>       6543 =C2=B1  2%     +20.4%       7879 =C2=B1  9%  sched_debug.cp=
u.nr_switches.0
> >>       5256 =C2=B1 23%    +177.1%      14566 =C2=B1 52%  sched_debug.cp=
u.nr_switches.27
> >>       7915 =C2=B1  3%      +8.7%       8605 =C2=B1  3%  sched_debug.cp=
u.nr_switches.avg
> >>      -0.25 =C2=B1-519%   +1900.0%      -5.00 =C2=B1-24%  sched_debug.c=
pu.nr_uninterruptible.12
> >>       2.00 =C2=B1 93%    -125.0%      -0.50 =C2=B1-300%  sched_debug.c=
pu.nr_uninterruptible.24
> >>      17468 =C2=B1 14%    +194.3%      51413 =C2=B1 75%  sched_debug.cp=
u.sched_count.15
> >>       2112 =C2=B1  2%     +20.8%       2552 =C2=B1 11%  sched_debug.cp=
u.sched_goidle.0
> >>       2103 =C2=B1 34%    +219.0%       6709 =C2=B1 55%  sched_debug.cp=
u.sched_goidle.27
> >>       3159 =C2=B1  3%      +8.2%       3418 =C2=B1  4%  sched_debug.cp=
u.sched_goidle.avg
> >>       1323 =C2=B1 64%     -72.7%     361.50 =C2=B1 15%  sched_debug.cp=
u.ttwu_count.23
> >>       3264 =C2=B1 12%     +94.4%       6347 =C2=B1 41%  sched_debug.cp=
u.ttwu_count.27
> >>       3860 =C2=B1  3%      +9.0%       4208 =C2=B1  3%  sched_debug.cp=
u.ttwu_count.avg
> >>       2358 =C2=B1  3%     +28.7%       3035 =C2=B1  9%  sched_debug.cp=
u.ttwu_local.0
> >>       1110 =C2=B1 22%     +54.6%       1716 =C2=B1 28%  sched_debug.cp=
u.ttwu_local.27
> >>       1814 =C2=B1  8%     +16.1%       2106 =C2=B1  5%  sched_debug.cp=
u.ttwu_local.stddev
> >> =

> >> =

> >> lkp-snb01: Sandy Bridge-EP
> >> Memory: 32G
> >> =

> >>                              will-it-scale.per_thread_ops
> >> =

> >>    1.2e+06 ++---------------------------------------------------------=
------+
> >>            |                                  O                       =
      |
> >>   1.15e+06 O+O O   O O   O   O   O   O                                =
      |
> >>    1.1e+06 ++                                                         =
      |
> >>            |     O             O   O   O O OO                         =
      |
> >>   1.05e+06 ++          O   O                                          =
      |
> >>      1e+06 ++                                                         =
      |
> >>            |                                                          =
      |
> >>     950000 ++                                                         =
      |
> >>     900000 ++                                                         =
      |
> >>            |                                                          =
      |
> >>     850000 ++                                                         =
      |
> >>     800000 *+*.*.*.*.*.*.*.*.*.*.*.*. .*.*. *.*.*.*.*.*.*.*.*.*.*.*.*.=
*.*.*.*
> >>            |                         *     *                          =
      |
> >>     750000 ++---------------------------------------------------------=
------+
> >> =

> >> =

> >>                           will-it-scale.time.user_time
> >> =

> >>   50 ++---------------------------------------------------------------=
------+
> >>      |                                                                =
      |
> >>   45 ++         O   O   O    O   O          O                         =
      |
> >>      O O O    O                                                       =
      |
> >>      |     O          O        O   O O                                =
      |
> >>   40 ++           O        O           O  O                           =
      |
> >>      |                                                                =
      |
> >>   35 ++                                                               =
      |
> >>      |                                                                =
      |
> >>   30 ++                                                               =
      |
> >>      |                                                                =
      |
> >>      |            *                                                   =
      |
> >>   25 ++          + +                                                  =
      |
> >>      *.*.*.*..*.*   *.*.*..*.*.*.*.*.*.*..*.*.*.*.*.*.*..*.*.*.*.*.*..=
*.*.*.*
> >>   20 ++---------------------------------------------------------------=
------+
> >> =

> >> =

> >> 	[*] bisect-good sample
> >> 	[O] bisect-bad  sample
> >> =

> >> To reproduce:
> >> =

> >>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lk=
p-tests.git
> >>         cd lkp-tests
> >>         bin/lkp install job.yaml  # job file is attached in this email
> >>         bin/lkp run     job.yaml
> >> =

> >> =

> >> Disclaimer:
> >> Results have been estimated based on internal Intel analysis and are p=
rovided
> >> for informational purposes only. Any difference in system hardware or =
software
> >> design or configuration may affect actual performance.
> >> =

> >> =

> >> Thanks,
> >> Ying Huang  =

> >
> > Thanks...
> >
> > Huh...I'm stumped on this one. If anything I would have expected better
> > performance with this patch since we don't even take the file_lock or
> > do the fcheck in the F_UNLCK codepath now, or when there is an error.
> >
> > I'll see if I can reproduce it on my own test rig, but I'd welcome
> > ideas of where and how this performance regression could have crept in.=
  =

> =

> This is a performance increase instead of performance regression.
> =


Hah, no wonder that made no sense. Ok, thanks for letting me know!

-- =

Jeff Layton <jeff.layton@primarydata.com>

--===============6794786568998550434==--

