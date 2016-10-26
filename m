Content-Type: multipart/mixed; boundary="===============7032154011541414512=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf powerpc] 18d1796d0b: [No primary change]
Date: Wed, 26 Oct 2016 10:09:23 +0800
Message-ID: <87mvhroo8c.fsf@yhuang-dev.intel.com>
In-Reply-To: <20161025090651.GC3175@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7032154011541414512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:

> On Tue, Oct 25, 2016 at 02:40:13PM +0800, kernel test robot wrote:
>> [will-it-scale] perf-stat.branch-miss-rate +7.4% regression =

>> Reply-To: kernel test robot <xiaolong.ye@intel.com>
>> User-Agent: Heirloom mailx 12.5 6/20/10
>> =

>> =

>> FYI, we noticed a +7.4% regression of perf-stat.branch-miss-rate due to =
commit:
>> =

>> commit 18d1796d0b45762ec6f58c5ed2ad3f7510ffbaa9 ("perf powerpc: Don't ca=
ll perf_event_disable from atomic context")
>> https://github.com/0day-ci/linux Jiri-Olsa/perf-powerpc-Don-t-call-perf_=
event_disable-from-atomic-context/20161006-203500
>> =

>> in testcase: will-it-scale
>> on test machine: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz wit=
h 64G memory
>> with following parameters:
>> =

>> 	test: poll2
>> 	cpufreq_governor: performance
>> =

>> Will It Scale takes a testcase and runs it from 1 through to n parallel =
copies to see if the testcase will scale. It builds both a process and thre=
ads based test in order to see any differences between the two.
>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>> =

>> =

>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>>   gcc-6/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/lkp-sb0=
3/poll2/will-it-scale
>> =

>> commit: =

>>   41aad2a6d4 (" perf/core improvements and fixes:")
>>   18d1796d0b ("perf powerpc: Don't call perf_event_disable from atomic c=
ontext")
>> =

>> 41aad2a6d4fcdda8 18d1796d0b45762ec6f58c5ed2 =

>> ---------------- -------------------------- =

>>        fail:runs  %reproduction    fail:runs
>>            |             |             |    =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>       0.19 .  0%      +7.4%       0.21 .  0%  perf-stat.branch-miss-rate%
>>  9.591e+09 .  1%      +9.1%  1.047e+10 .  0%  perf-stat.branch-misses
>>  1.962e+09 .  0%      +2.3%  2.008e+09 .  1%  perf-stat.cache-references
>>      51.18 .  2%      +5.6%      54.06 .  1%  perf-stat.iTLB-load-miss-r=
ate%
>>   46430577 .  5%      -6.9%   43241506 .  2%  perf-stat.iTLB-loads
>>       9.90 .  4%      +9.3%      10.82 .  4%  turbostat.Pkg%pc2
>>      62066 . 24%     +34.7%      83582 . 11%  numa-meminfo.node1.Active
>>      49531 . 30%     +42.9%      70778 . 13%  numa-meminfo.node1.Active(=
anon)
>>      27883 .100%    -100.0%       0.00 . -1%  latency_stats.avg.proc_cgr=
oup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.do_syscall_=
64.return_from_SYSCALL_64
>>      27883 .100%    -100.0%       0.00 . -1%  latency_stats.max.proc_cgr=
oup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.do_syscall_=
64.return_from_SYSCALL_64
>>      32685 . 38%     +88.5%      61603 .147%  latency_stats.sum.call_rws=
em_down_write_failed.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SY=
SCALL_64_fastpath
>>      27883 .100%    -100.0%       0.00 . -1%  latency_stats.sum.proc_cgr=
oup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.do_syscall_=
64.return_from_SYSCALL_64
>>      92795 .  4%      -8.6%      84853 .  6%  numa-vmstat.node0.numa_hit
>>      92782 .  4%      -8.5%      84851 .  6%  numa-vmstat.node0.numa_loc=
al
>>      12381 . 30%     +42.9%      17694 . 13%  numa-vmstat.node1.nr_activ=
e_anon
>>      12381 . 30%     +42.9%      17694 . 13%  numa-vmstat.node1.nr_zone_=
active_anon
>>      21.80 . 59%     -69.8%       6.58 . 83%  sched_debug.cpu.clock.stdd=
ev
>>      21.80 . 59%     -69.8%       6.58 . 83%  sched_debug.cpu.clock_task=
.stddev
>>       0.00 . 23%     -34.3%       0.00 . 20%  sched_debug.cpu.next_balan=
ce.stddev
>>      35829 .  9%     -18.4%      29221 .  6%  sched_debug.cpu.nr_switche=
s.max
>>       8361 .  6%     -13.4%       7243 .  7%  sched_debug.cpu.nr_switche=
s.stddev
>>       8.43 . 11%     -25.2%       6.30 . 12%  sched_debug.cpu.nr_uninter=
ruptible.stddev
>>      18057 .  6%     -14.3%      15482 .  8%  sched_debug.cpu.sched_coun=
t.stddev
>> =

>
> ARGH... so what is the normal metric for this test and did that change?
> And why can't I still find that? These reports suck!

There is observable changes between the benchmark (will-it-scale)
scores.  That is said in the subject of the mail: "[No primary
change]".  But apparently, that is not clear.  We will improve that to
make it more clear.

> The result doesn't make sense, my gcc inlines the function call, the
> emitted code is very similar to the old code, with exception of one
> extra symbol.
>
> Are you sure this isn't simple run to run variation?

The reported change is perf-stat.branch-miss-rate%, which is changed
from 0.19% to 0.21%.  That is too small.  So, please ignore this
report.  We will be more careful in the future.

Best Regards,
Huang, Ying

--===============7032154011541414512==--

