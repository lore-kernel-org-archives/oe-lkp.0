Content-Type: multipart/mixed; boundary="===============8124749125585927538=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf powerpc] 18d1796d0b: [No primary change]
Date: Tue, 25 Oct 2016 11:06:51 +0200
Message-ID: <20161025090651.GC3175@twins.programming.kicks-ass.net>
In-Reply-To: <20161025064013.GB2726@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8124749125585927538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 02:40:13PM +0800, kernel test robot wrote:
> [will-it-scale] perf-stat.branch-miss-rate +7.4% regression =

> Reply-To: kernel test robot <xiaolong.ye@intel.com>
> User-Agent: Heirloom mailx 12.5 6/20/10
> =

> =

> FYI, we noticed a +7.4% regression of perf-stat.branch-miss-rate due to c=
ommit:
> =

> commit 18d1796d0b45762ec6f58c5ed2ad3f7510ffbaa9 ("perf powerpc: Don't cal=
l perf_event_disable from atomic context")
> https://github.com/0day-ci/linux Jiri-Olsa/perf-powerpc-Don-t-call-perf_e=
vent_disable-from-atomic-context/20161006-203500
> =

> in testcase: will-it-scale
> on test machine: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz with=
 64G memory
> with following parameters:
> =

> 	test: poll2
> 	cpufreq_governor: performance
> =

> Will It Scale takes a testcase and runs it from 1 through to n parallel c=
opies to see if the testcase will scale. It builds both a process and threa=
ds based test in order to see any differences between the two.

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-6/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-sb03=
/poll2/will-it-scale
> =

> commit: =

>   41aad2a6d4 (" perf/core improvements and fixes:")
>   18d1796d0b ("perf powerpc: Don't call perf_event_disable from atomic co=
ntext")
> =

> 41aad2a6d4fcdda8 18d1796d0b45762ec6f58c5ed2 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>          %stddev     %change         %stddev
>              \          |                \  =

>       0.19 =C2=B1  0%      +7.4%       0.21 =C2=B1  0%  perf-stat.branch-=
miss-rate%
>  9.591e+09 =C2=B1  1%      +9.1%  1.047e+10 =C2=B1  0%  perf-stat.branch-=
misses
>  1.962e+09 =C2=B1  0%      +2.3%  2.008e+09 =C2=B1  1%  perf-stat.cache-r=
eferences
>      51.18 =C2=B1  2%      +5.6%      54.06 =C2=B1  1%  perf-stat.iTLB-lo=
ad-miss-rate%
>   46430577 =C2=B1  5%      -6.9%   43241506 =C2=B1  2%  perf-stat.iTLB-lo=
ads
>       9.90 =C2=B1  4%      +9.3%      10.82 =C2=B1  4%  turbostat.Pkg%pc2
>      62066 =C2=B1 24%     +34.7%      83582 =C2=B1 11%  numa-meminfo.node=
1.Active
>      49531 =C2=B1 30%     +42.9%      70778 =C2=B1 13%  numa-meminfo.node=
1.Active(anon)
>      27883 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg=
.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.do=
_syscall_64.return_from_SYSCALL_64
>      27883 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max=
.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.do=
_syscall_64.return_from_SYSCALL_64
>      32685 =C2=B1 38%     +88.5%      61603 =C2=B1147%  latency_stats.sum=
.call_rwsem_down_write_failed.path_openat.do_filp_open.do_sys_open.SyS_open=
.entry_SYSCALL_64_fastpath
>      27883 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum=
.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.do=
_syscall_64.return_from_SYSCALL_64
>      92795 =C2=B1  4%      -8.6%      84853 =C2=B1  6%  numa-vmstat.node0=
.numa_hit
>      92782 =C2=B1  4%      -8.5%      84851 =C2=B1  6%  numa-vmstat.node0=
.numa_local
>      12381 =C2=B1 30%     +42.9%      17694 =C2=B1 13%  numa-vmstat.node1=
.nr_active_anon
>      12381 =C2=B1 30%     +42.9%      17694 =C2=B1 13%  numa-vmstat.node1=
.nr_zone_active_anon
>      21.80 =C2=B1 59%     -69.8%       6.58 =C2=B1 83%  sched_debug.cpu.c=
lock.stddev
>      21.80 =C2=B1 59%     -69.8%       6.58 =C2=B1 83%  sched_debug.cpu.c=
lock_task.stddev
>       0.00 =C2=B1 23%     -34.3%       0.00 =C2=B1 20%  sched_debug.cpu.n=
ext_balance.stddev
>      35829 =C2=B1  9%     -18.4%      29221 =C2=B1  6%  sched_debug.cpu.n=
r_switches.max
>       8361 =C2=B1  6%     -13.4%       7243 =C2=B1  7%  sched_debug.cpu.n=
r_switches.stddev
>       8.43 =C2=B1 11%     -25.2%       6.30 =C2=B1 12%  sched_debug.cpu.n=
r_uninterruptible.stddev
>      18057 =C2=B1  6%     -14.3%      15482 =C2=B1  8%  sched_debug.cpu.s=
ched_count.stddev
> =


ARGH... so what is the normal metric for this test and did that change?
And why can't I still find that? These reports suck!

The result doesn't make sense, my gcc inlines the function call, the
emitted code is very similar to the old code, with exception of one
extra symbol.

Are you sure this isn't simple run to run variation?

--===============8124749125585927538==--

