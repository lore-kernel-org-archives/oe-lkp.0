Content-Type: multipart/mixed; boundary="===============5049533936347448054=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [ipc/sem.c] 0882cba0a0: aim9.shared_memory.ops_per_sec -8.8% regression
Date: Mon, 10 Oct 2016 14:26:27 +0800
Message-ID: <20161010062627.GB20007@yexl-desktop>
In-Reply-To: <714a5fac-3485-f480-1050-a4b53ba8b7fb@colorfullife.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5049533936347448054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/09, Manfred Spraul wrote:
>Hi,
>
>On 10/09/2016 09:05 AM, kernel test robot wrote:
>>FYI, we noticed a -8.8% regression of aim9.shared_memory.ops_per_sec due =
to commit:
>>
>>commit 0882cba0a03bca73acd8fab8fb50db04691908e9 ("ipc/sem.c: fix complex_=
count vs. simple op race")
>>https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>
>>in testcase: aim9
>>on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4=
G memory
>>with following parameters:
>>
>>	testtime: 300s
>>	test: shared_memory
>>	cpufreq_governor: performance
>>
>>Suite IX is the "AIM Independent Resource Benchmark:" the famous syntheti=
c benchmark.
>>
>>
>It is probably caused by this change:
>>--- ipc/sem-fast-but-wrong.c    2016-10-09 19:24:47.914825410 +0200
>>+++ ipc/sem.c    2016-10-09 19:24:57.960841540 +0200
>>@@ -363,6 +363,14 @@
>>          */
>>         spin_lock(&sem->lock);
>>
>>+        /*
>>+         * See 51d7d5205d33
>>+         * ("powerpc: Add smp_mb() to arch_spin_is_locked()"):
>>+         * A full barrier is required: the write of sem->lock
>>+         * must be visible before the read is executed
>>+         */
>>+        smp_mb();
>>+
>>         if (!smp_load_acquire(&sma->complex_mode)) {
>>             /* fast path successful! */
>>             return sops->sem_num;
>Unfortunately, we need it, at least for powerpc.
>And I do not want to add a CONFIG_PPC into ipc/sem.c.
>
>Is it possible to do a test what happens with patch that avoids
>spin_unlock_wait()?
>
>https://patchwork.kernel.org/patch/9359365/
>https://patchwork.kernel.org/patch/9359371/
>
>(if possible, with both patches together)

I applied these two patches on top of 0882cba ("ipc/sem.c: fix
complex_count vs. simple op race"), seems they do help recover the
performance back, here is the comparison:


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-6/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-ivb-d0=
3/shared_memory/aim9/300s

commit:
  bfe738a6c274df47650d09360babc8c1b71ff2a8
  0882cba0a03bca73acd8fab8fb50db04691908e9
  cc5f1c2b5da85fdf3de370189765af88c8df7b55 ("ipc/sem: Add hysteresis")

bfe738a6c274df47 0882cba0a03bca73acd8fab8fb cc5f1c2b5da85fdf3de3701897
---------------- -------------------------- --------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
   1377511 =C2=B1  0%      -8.8%    1256420 =C2=B1  0%      -0.5%    137019=
2 =C2=B1  0%  aim9.shared_memory.ops_per_sec
   4133531 =C2=B1  0%      -8.8%    3770259 =C2=B1  0%      -0.5%    411157=
8 =C2=B1  0%  aim9.time.minor_page_faults
      8106 =C2=B1  6%      -7.7%       7483 =C2=B1  8%     +24.5%      1009=
2 =C2=B1  7%  cpuidle.POLL.usage
      9.66 =C2=B1  0%      -2.0%       9.46 =C2=B1  0%      +0.5%       9.7=
1 =C2=B1  0%  turbostat.CorWatt
      2374 =C2=B1  5%     -12.4%       2078 =C2=B1  1%      -5.5%       224=
3 =C2=B1  5%  slabinfo.kmalloc-256.active_objs
    697.75 =C2=B1  4%     +33.5%     931.25 =C2=B1  5%     +43.5%       100=
1 =C2=B1  4%  slabinfo.kmalloc-512.active_objs
    719.50 =C2=B1  3%     +32.3%     951.75 =C2=B1  5%     +41.8%       102=
0 =C2=B1  4%  slabinfo.kmalloc-512.num_objs
      5184 =C2=B1  2%     -12.3%       4544 =C2=B1  8%      -5.9%       487=
7 =C2=B1  8%  slabinfo.kmalloc-64.active_objs
      5184 =C2=B1  2%     -12.3%       4544 =C2=B1  8%      -5.9%       487=
7 =C2=B1  8%  slabinfo.kmalloc-64.num_objs
 2.124e+09 =C2=B1  3%      +0.9%  2.144e+09 =C2=B1  9%     +14.8%  2.439e+0=
9 =C2=B1  9%  perf-stat.cache-references
     10295 =C2=B1  6%      -8.9%       9376 =C2=B1  1%      +6.0%      1091=
2 =C2=B1  7%  perf-stat.cpu-migrations
      0.04 =C2=B1 24%     +59.5%       0.06 =C2=B1 51%    +508.5%       0.2=
4 =C2=B1123%  perf-stat.dTLB-load-miss-rate%
 5.346e+11 =C2=B1  3%     -13.1%  4.647e+11 =C2=B1  7%      +2.9%  5.501e+1=
1 =C2=B1  8%  perf-stat.dTLB-loads
      1.61 =C2=B1  1%      -9.2%       1.46 =C2=B1  1%      -0.6%       1.6=
0 =C2=B1  1%  perf-stat.ipc
   4417053 =C2=B1  0%      -8.2%    4053763 =C2=B1  0%      -0.5%    439497=
3 =C2=B1  0%  perf-stat.minor-faults
   4417054 =C2=B1  0%      -8.2%    4053763 =C2=B1  0%      -0.5%    439497=
3 =C2=B1  0%  perf-stat.page-faults
   4478439 =C2=B1144%     +83.7%    8227939 =C2=B1 90%     -87.4%     56438=
7 =C2=B1 21%  sched_debug.cfs_rq:/.load.max
   1912666 =C2=B1145%     +84.7%    3531796 =C2=B1 91%     -87.7%     23529=
6 =C2=B1 19%  sched_debug.cfs_rq:/.load.stddev
    755.19 =C2=B1 79%      +4.3%     787.48 =C2=B1 63%     -55.2%     338.7=
0 =C2=B1 15%  sched_debug.cfs_rq:/.load_avg.avg
    186.08 =C2=B1  9%     -10.1%     167.38 =C2=B1 15%     -39.9%     111.7=
7 =C2=B1 35%  sched_debug.cfs_rq:/.load_avg.min
     86.83 =C2=B1 22%      -8.6%      79.38 =C2=B1 31%     -38.0%      53.8=
3 =C2=B1 27%  sched_debug.cfs_rq:/.util_avg.min
    222488 =C2=B1  2%      +0.2%     222984 =C2=B1  6%     -22.8%     17169=
1 =C2=B1 15%  sched_debug.cpu.avg_idle.stddev
     62.58 =C2=B1 56%     -18.7%      50.90 =C2=B1 41%     -93.8%       3.8=
6 =C2=B1168%  sched_debug.cpu.clock.stddev
     62.58 =C2=B1 56%     -18.7%      50.90 =C2=B1 41%     -93.8%       3.8=
6 =C2=B1168%  sched_debug.cpu.clock_task.stddev
   4500146 =C2=B1144%     +82.7%    8220704 =C2=B1 92%     -87.5%     56438=
7 =C2=B1 21%  sched_debug.cpu.load.max
   1920553 =C2=B1145%     +83.6%    3525404 =C2=B1 92%     -87.7%     23529=
6 =C2=B1 19%  sched_debug.cpu.load.stddev
      1.52 =C2=B1 11%     -26.7%       1.11 =C2=B1 33%     -24.9%       1.1=
4 =C2=B1 18%  sched_debug.cpu.nr_running.avg
     18404 =C2=B1 42%     +39.9%      25755 =C2=B1 11%     +66.9%      3072=
5 =C2=B1  7%  sched_debug.cpu.ttwu_count.min
      7.90 =C2=B1 26%     -30.4%       5.50 =C2=B1 37%     -13.0%       6.8=
8 =C2=B1 45%  sched_debug.rt_rq:/.rt_time.avg
     31.58 =C2=B1 26%     -30.4%      21.97 =C2=B1 37%     -13.2%      27.4=
2 =C2=B1 45%  sched_debug.rt_rq:/.rt_time.max
     13.67 =C2=B1 26%     -30.5%       9.51 =C2=B1 37%     -13.2%      11.8=
6 =C2=B1 45%  sched_debug.rt_rq:/.rt_time.stddev
      3.17 =C2=B1  9%     -26.7%       2.32 =C2=B1 13%      +2.0%       3.2=
3 =C2=B1 12%  perf-profile.calltrace.cycles-pp._raw_spin_lock.sys_semop.ent=
ry_SYSCALL_64_fastpath
      1.16 =C2=B1  4%     -15.9%       0.98 =C2=B1 14%      +1.0%       1.1=
7 =C2=B1 11%  perf-profile.calltrace.cycles-pp.do_munmap.sys_shmdt.entry_SY=
SCALL_64_fastpath
      5.25 =C2=B1  8%     -15.7%       4.43 =C2=B1  4%      -2.3%       5.1=
3 =C2=B1 15%  perf-profile.calltrace.cycles-pp.do_smart_update.SYSC_semtime=
dop.sys_semop.entry_SYSCALL_64_fastpath
      1.50 =C2=B1  5%     +68.6%       2.53 =C2=B1 10%     -36.2%       0.9=
6 =C2=B1 28%  perf-profile.calltrace.cycles-pp.pid_vnr.SYSC_semtimedop.sys_=
semop.entry_SYSCALL_64_fastpath
      1.24 =C2=B1  4%     -15.3%       1.05 =C2=B1 12%      +0.6%       1.2=
5 =C2=B1 11%  perf-profile.calltrace.cycles-pp.sys_shmdt.entry_SYSCALL_64_f=
astpath
      0.99 =C2=B1 12%     -20.5%       0.79 =C2=B1  6%      -5.7%       0.9=
3 =C2=B1 17%  perf-profile.calltrace.cycles-pp.wake_const_ops.do_smart_wake=
up_zero.do_smart_update.SYSC_semtimedop.sys_semop
      3.45 =C2=B1  9%     -24.8%       2.60 =C2=B1 12%      +1.7%       3.5=
1 =C2=B1 13%  perf-profile.children.cycles-pp._raw_spin_lock
      1.18 =C2=B1  4%     -15.7%       0.99 =C2=B1 14%      +0.9%       1.1=
9 =C2=B1 12%  perf-profile.children.cycles-pp.do_munmap
      5.61 =C2=B1  8%     -15.4%       4.75 =C2=B1  3%      -3.7%       5.4=
0 =C2=B1 15%  perf-profile.children.cycles-pp.do_smart_update
      1.78 =C2=B1  5%     +56.7%       2.80 =C2=B1 11%     -29.1%       1.2=
7 =C2=B1 22%  perf-profile.children.cycles-pp.pid_vnr
      1.24 =C2=B1  4%     -15.3%       1.05 =C2=B1 12%      +0.8%       1.2=
5 =C2=B1 11%  perf-profile.children.cycles-pp.sys_shmdt
      1.24 =C2=B1 13%     -24.7%       0.93 =C2=B1  8%     -12.7%       1.0=
8 =C2=B1 16%  perf-profile.children.cycles-pp.wake_const_ops
      9.86 =C2=B1  8%     +47.0%      14.49 =C2=B1  9%      -8.5%       9.0=
2 =C2=B1 13%  perf-profile.self.cycles-pp.SYSC_semtimedop
      3.45 =C2=B1  9%     -25.2%       2.58 =C2=B1 13%      +1.9%       3.5=
1 =C2=B1 13%  perf-profile.self.cycles-pp._raw_spin_lock
      2.26 =C2=B1  9%     -26.8%       1.65 =C2=B1  7%     -11.0%       2.0=
1 =C2=B1 18%  perf-profile.self.cycles-pp.do_smart_update
      1.78 =C2=B1  5%     +56.7%       2.80 =C2=B1 11%     -29.1%       1.2=
7 =C2=B1 22%  perf-profile.self.cycles-pp.pid_vnr
      1.03 =C2=B1  2%     -15.3%       0.87 =C2=B1  8%      -8.7%       0.9=
4 =C2=B1 25%  perf-profile.self.cycles-pp.security_ipc_permission
      1.32 =C2=B1  5%      -4.0%       1.27 =C2=B1 14%     +14.8%       1.5=
1 =C2=B1  8%  perf-profile.self.cycles-pp.security_sem_semop
      1.24 =C2=B1 13%     -24.7%       0.93 =C2=B1  8%     -12.7%       1.0=
8 =C2=B1 16%  perf-profile.self.cycles-pp.wake_const_ops

Thanks,
Xiaolong
>
>Thanks,
>    Manfred

--===============5049533936347448054==--

