Content-Type: multipart/mixed; boundary="===============4870720994295441500=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 94b1b03b51: hackbench.throughput -20% regression
Date: Sun, 23 Jul 2017 22:23:39 -0700
Message-ID: <CALCETrUbvUmNTej7nRpC0R_GaxD7+Y8NjnNV6V6dmp_oVczTWw@mail.gmail.com>
In-Reply-To: <20170724021511.GF32356@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4870720994295441500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

AFAICT this is a regression running hackbench with 56 * 40 threads on
112 CPUs.  The performance numbers are odd -- it looks like only 10
CPUs worth of work are happening, so the system is 90% or so idle.
I'm not sure why.

I suspect this is hitting the nasty case that Rik thought of: on
transition to and from idle, we're doing cpumask_clear() and
cpumask_set() respecitvely on a per-mm bitmask, causing false sharing.
This is merely a worsening of an existing problem that we do mmgrab()
and mmdrop() in the scheduler to keep track of the reference counts.
IOW our performance is generally awful on NUMA or other big systems
with mms with many threads on many CPUs that are constantly going idle
and un-idle.

Do we care for the purpose of the PCID series?  This is a bit of a
weird corner case.

--Andy


On Sun, Jul 23, 2017 at 7:15 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> Greeting,
>
> We noticed a -20% regression of hackbench.throughput due to commit:
>
> commit: 94b1b03b519b81c494900cb112aa00ed205cc2d9 ("x86/mm: Rework lazy TL=
B mode and TLB freshness tracking")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: hackbench
> on test machine: 112 threads Skylake with 64G memory
> with following parameters:
>
>         nr_threads: 50%
>         mode: threads
>         ipc: pipe
>         cpufreq_governor: performance
>
> test-description: Hackbench is both a benchmark and a stress test for the=
 Linux kernel scheduler.
> test-url: https://github.com/linux-test-project/ltp/blob/master/testcases=
/kernel/sched/cfs-scheduler/hackbench.c
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> testcase/path_params/tbox_group/run: hackbench/50%-threads-pipe-performan=
ce/lkp-skl-sp1
>
> b0579ade7cd82391  94b1b03b519b81c494900cb112
> ----------------  --------------------------
>     341577             -20%     273386        hackbench.throughput
>        619                         627        hackbench.time.elapsed_time
>        619                         627        hackbench.time.elapsed_time=
.max
>      60730                       61467        hackbench.time.system_time
>      10342                       10237        hackbench.time.percent_of_c=
pu_this_job_got
>  3.668e+09 =C2=B1  3%       -14%  3.162e+09        hackbench.time.involun=
tary_context_switches
>       3343             -16%       2822        hackbench.time.user_time
>      79579             -19%      64691        hackbench.time.minor_page_f=
aults
>  7.122e+09             -21%  5.615e+09        hackbench.time.voluntary_co=
ntext_switches
>   19184056             -21%   15224960        vmstat.system.cs
>     657050 =C2=B1  3%       -21%     518229        vmstat.system.in
>       1.68             111%       3.54        perf-stat.cache-miss-rate%
>  2.716e+09 =C2=B1  4%        90%  5.153e+09        perf-stat.node-load-mi=
sses
>  2.175e+10              78%  3.876e+10        perf-stat.cache-misses
>  4.423e+08              49%  6.587e+08        perf-stat.node-loads
>      61682 =C2=B1 12%        30%      80181 =C2=B1  4%  perf-stat.instruc=
tions-per-iTLB-miss
>       7.69 =C2=B1 16%        29%       9.91 =C2=B1  3%  perf-stat.iTLB-lo=
ad-miss-rate%
>      85.98               3%      88.67        perf-stat.node-load-miss-ra=
te%
>  1.336e+14                   1.357e+14        perf-stat.cpu-cycles
>      50.62              -3%      48.95        perf-stat.node-store-miss-r=
ate%
>       0.50              -5%       0.48        perf-stat.branch-miss-rate%
>  1.863e+09             -14%    1.6e+09        perf-stat.node-stores
>    3.5e+09             -14%  2.992e+09        perf-stat.cpu-migrations
>  1.298e+12             -16%  1.094e+12        perf-stat.cache-references
>       0.01 =C2=B1  5%       -17%       0.00 =C2=B1  5%  perf-stat.dTLB-lo=
ad-miss-rate%
>  1.191e+10             -20%  9.584e+09        perf-stat.context-switches
>   1.91e+09             -20%  1.534e+09        perf-stat.node-store-misses
>  2.608e+13             -20%  2.087e+13        perf-stat.dTLB-loads
>  1.734e+13             -20%  1.385e+13        perf-stat.branch-instructio=
ns
>  8.712e+13             -20%  6.948e+13        perf-stat.instructions
>  1.654e+13             -20%  1.318e+13        perf-stat.dTLB-stores
>       0.65             -21%       0.51        perf-stat.ipc
>  8.673e+10             -24%  6.587e+10        perf-stat.branch-misses
>       0.00 =C2=B1  5%       -26%       0.00 =C2=B1  8%  perf-stat.dTLB-st=
ore-miss-rate%
>  1.414e+09 =C2=B1  4%       -34%  9.394e+08 =C2=B1  5%  perf-stat.dTLB-lo=
ad-misses
>  1.439e+09 =C2=B1 14%       -40%   8.68e+08 =C2=B1  4%  perf-stat.iTLB-lo=
ad-misses
>   76075198 =C2=B1  4%       -41%   44671969 =C2=B1  8%  perf-stat.dTLB-st=
ore-misses
>  1.735e+10 =C2=B1  4%       -55%  7.885e+09        perf-stat.iTLB-loads
>
>
>
>                                 hackbench.throughput
>
>   350000 *+*-*-*-*-*--*-*-*-*-*-*-*-*-*-*--*-*---------------------------=
---+
>          |                                                               =
   |
>   300000 ++                                                              =
   |
>          O O O O O O  O O O O O O O O O O    O   O   O O O   O O  O O O O=
 O O
>   250000 ++                                                              =
   |
>          |                                                               =
   |
>   200000 ++                                                              =
   |
>          |                                                               =
   |
>   150000 ++                                                              =
   |
>          |                                                               =
   |
>   100000 ++                                                              =
   |
>          |                                                               =
   |
>    50000 ++                                                              =
   |
>          |                                                               =
   |
>        0 ++--------------------------------O---O---O-------O-------------=
---+
>
>
>
>   [*] bisect-good sample
>   [O] bisect-bad  sample
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Xiaolong

--===============4870720994295441500==--

