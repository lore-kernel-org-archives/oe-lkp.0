Content-Type: multipart/mixed; boundary="===============6247413887412177589=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mremap] 5d1904204c: will-it-scale.per_thread_ops -13.1% regression
Date: Mon, 28 Nov 2016 16:29:50 +0800
Message-ID: <20161128082950.GA1901@aaronlu.sh.intel.com>
In-Reply-To: <20161127182153.GE2501@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6247413887412177589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+linux-mm

On Mon, Nov 28, 2016 at 02:21:53AM +0800, kernel test robot wrote:
> =

> Greeting,

Thanks for the report.

> =

> FYI, we noticed a -13.1% regression of will-it-scale.per_thread_ops due t=
o commit:

I took a look at the test, it
1 creates an eventfd with the counter's initial value set to 0;
2 writes 1 to this eventfd, i.e. set its counter to 1;
3 does read, i.e. return the value of 1 and reset the counter to 0;
4 loop to step 2.

I don't see move_vma/move_page_tables/move_ptes involved in this test
though.

I also tried trace-cmd to see if I missed anything:
# trace-cmd record -p function --func-stack -l move_vma -l move_page_tables=
 -l move_huge_pmd ./eventfd1_threads -t 1 -s 10

The report is:
# /usr/local/bin/trace-cmd report
CPU 0 is empty
CPU 1 is empty
CPU 2 is empty
CPU 3 is empty
CPU 4 is empty
CPU 5 is empty
CPU 6 is empty
cpus=3D8
 eventfd1_thread-21210 [007]  2626.438884: function:             move_page_=
tables
 eventfd1_thread-21210 [007]  2626.438889: kernel_stack:         <stack tra=
ce>
=3D> setup_arg_pages (ffffffff81282ac0)
=3D> load_elf_binary (ffffffff812e4503)
=3D> search_binary_handler (ffffffff81282268)
=3D> exec_binprm (ffffffff8149d6ab)
=3D> do_execveat_common.isra.41 (ffffffff81284882)
=3D> do_execve (ffffffff8128498c)
=3D> SyS_execve (ffffffff81284c3e)
=3D> do_syscall_64 (ffffffff81002a76)
=3D> return_from_SYSCALL_64 (ffffffff81cbd509)

i.e., only one call of move_page_tables is in the log, and it's at the
very beginning of the run, not during.

I also did the run on my Sandybridge desktop(4 cores 8 threads with 12G
memory) and a Broadwell EP, they don't have this performance drop
either. Perhaps this problem only occurs on some machine.

I'll continue to take a look at this report, hopefully I can figure out
why this commit is bisected while its change doesn't seem to play a part
in the test. Your comments are greatly appreciated.

Thanks,
Aaron

> =

> =

> commit 5d1904204c99596b50a700f092fe49d78edba400 ("mremap: fix race betwee=
n mremap() and page cleanning")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 12 threads Intel(R) Core(TM) i7 CPU X 980 @ 3.33GHz with=
 6G memory
> with following parameters:
> =

> 	test: eventfd1
> 	cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

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
>   gcc-6/performance/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/wsm/even=
tfd1/will-it-scale
> =

> commit: =

>   961b708e95 (" fixes for amdgpu, and a bunch of arm drivers.")
>   5d1904204c ("mremap: fix race between mremap() and page cleanning")
> =

> 961b708e95181041 5d1904204c99596b50a700f092 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>          %stddev     %change         %stddev
>              \          |                \  =

>    2459656 =C2=B1  0%     -13.1%    2137017 =C2=B1  1%  will-it-scale.per=
_thread_ops
>    2865527 =C2=B1  3%      +4.2%    2986100 =C2=B1  0%  will-it-scale.per=
_process_ops
>       0.62 =C2=B1 11%     -13.2%       0.54 =C2=B1  1%  will-it-scale.sca=
lability
>     893.40 =C2=B1  0%      +1.3%     905.24 =C2=B1  0%  will-it-scale.tim=
e.system_time
>     169.92 =C2=B1  0%      -7.0%     158.09 =C2=B1  0%  will-it-scale.tim=
e.user_time
>     176943 =C2=B1  6%     +26.1%     223131 =C2=B1 11%  cpuidle.C1E-NHM.t=
ime
>      10.00 =C2=B1  6%     -10.9%       8.91 =C2=B1  4%  turbostat.CPU%c6
>      30508 =C2=B1  1%      +3.4%      31541 =C2=B1  0%  vmstat.system.cs
>      27239 =C2=B1  0%      +1.5%      27650 =C2=B1  0%  vmstat.system.in
>       2.03 =C2=B1  2%     -11.6%       1.80 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64
>       4.11 =C2=B1  1%     -12.0%       3.61 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_swapgs
>       1.70 =C2=B1  3%     -13.8%       1.46 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__fget_light
>       2.03 =C2=B1  2%     -11.6%       1.80 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64
>       4.11 =C2=B1  1%     -12.0%       3.61 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_swapgs
>      12.79 =C2=B1  1%     -10.0%      11.50 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.selinux_file_permission
>       1.70 =C2=B1  3%     -13.8%       1.46 =C2=B1  5%  perf-profile.self=
.cycles-pp.__fget_light
>       2.03 =C2=B1  2%     -11.6%       1.80 =C2=B1  6%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64
>       4.11 =C2=B1  1%     -12.0%       3.61 =C2=B1  4%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_swapgs
>       5.85 =C2=B1  2%     -12.5%       5.12 =C2=B1  5%  perf-profile.self=
.cycles-pp.selinux_file_permission
>  1.472e+12 =C2=B1  0%      -5.5%  1.392e+12 =C2=B1  0%  perf-stat.branch-=
instructions
>       0.89 =C2=B1  0%      -6.0%       0.83 =C2=B1  0%  perf-stat.branch-=
miss-rate%
>  1.303e+10 =C2=B1  0%     -11.1%  1.158e+10 =C2=B1  0%  perf-stat.branch-=
misses
>  5.534e+08 =C2=B1  4%      -6.9%  5.151e+08 =C2=B1  1%  perf-stat.cache-r=
eferences
>    9347877 =C2=B1  1%      +3.4%    9663609 =C2=B1  0%  perf-stat.context=
-switches
>  2.298e+12 =C2=B1  0%      -5.6%  2.168e+12 =C2=B1  0%  perf-stat.dTLB-lo=
ads
>  1.525e+12 =C2=B1  1%      -5.4%  1.442e+12 =C2=B1  0%  perf-stat.dTLB-st=
ores
>  7.795e+12 =C2=B1  0%      -5.5%  7.363e+12 =C2=B1  0%  perf-stat.iTLB-lo=
ads
>  6.694e+12 =C2=B1  1%      -4.5%  6.391e+12 =C2=B1  2%  perf-stat.instruc=
tions
>       0.93 =C2=B1  0%      -5.5%       0.88 =C2=B1  0%  perf-stat.ipc
>     119024 =C2=B1  5%     -11.3%     105523 =C2=B1  8%  sched_debug.cfs_r=
q:/.exec_clock.max
>    5933459 =C2=B1 19%     +24.5%    7385120 =C2=B1  3%  sched_debug.cpu.n=
r_switches.max
>    1684848 =C2=B1 15%     +20.6%    2032107 =C2=B1  3%  sched_debug.cpu.n=
r_switches.stddev
>    5929704 =C2=B1 19%     +24.5%    7382036 =C2=B1  3%  sched_debug.cpu.s=
ched_count.max
>    1684318 =C2=B1 15%     +20.6%    2031701 =C2=B1  3%  sched_debug.cpu.s=
ched_count.stddev
>    2826278 =C2=B1 18%     +30.4%    3684493 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.max
>     804195 =C2=B1 14%     +26.2%    1014783 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.stddev
>    2969365 =C2=B1 19%     +24.3%    3692180 =C2=B1  3%  sched_debug.cpu.t=
twu_count.max
>     843614 =C2=B1 15%     +20.5%    1016263 =C2=B1  3%  sched_debug.cpu.t=
twu_count.stddev
>    2963657 =C2=B1 19%     +24.4%    3687897 =C2=B1  3%  sched_debug.cpu.t=
twu_local.max
>     843104 =C2=B1 15%     +20.5%    1016333 =C2=B1  3%  sched_debug.cpu.t=
twu_local.stddev
> =

> =

> =

>                            will-it-scale.time.user_time
> =

>   172 ++--------------------*--------*---*-------------------------------=
---+
>   170 ++..*....*...*....*.      *..         .       ..*....  ..*...*.... =
   |
>       *.                                     *....*.       *.           *=
...*
>   168 ++                                                                 =
   |
>   166 ++                                                                 =
   |
>       |                                                                  =
   |
>   164 ++                                                                 =
   |
>   162 ++                                                                 =
   |
>   160 ++                                                                 =
   |
>       |                              O            O                      =
   |
>   158 ++                        O        O   O                           =
   |
>   156 ++                    O                                            =
   |
>       O            O                                                     =
   |
>   154 ++       O        O                                                =
   |
>   152 ++--O--------------------------------------------------------------=
---+
> =

> =

>                           will-it-scale.time.system_time
> =

>   912 ++-----------------------------------------------------------------=
---+
>   910 ++  O             O                                                =
   |
>       O        O   O                                                     =
   |
>   908 ++                    O                                            =
   |
>   906 ++                        O        O   O                           =
   |
>   904 ++                             O            O                      =
   |
>   902 ++                                                                 =
   |
>       |                                                                  =
   |
>   900 ++                                                                 =
   |
>   898 ++                                                                 =
   |
>   896 ++                                                                 =
   |
>   894 ++                                                                 =
 ..*
>       *...*....  ..*....                   ..*....*...*....*...*...*....*=
.  |
>   892 ++       *.       *...*...*....*...*.                              =
   |
>   890 ++-----------------------------------------------------------------=
---+
> =

> =

>                              will-it-scale.per_thread_ops
> =

>   2.55e+06 ++------------------------------------------------------------=
---+
>    2.5e+06 ++ .*...*..    .*...*...           ..*.             .*..      =
   |
>            |..        . ..         *...*....*.    ..   .*... ..    .     =
   |
>   2.45e+06 *+          *                             ..     *       *...*=
...*
>    2.4e+06 ++                                       *                    =
   |
>   2.35e+06 ++                                                            =
   |
>    2.3e+06 ++                                                            =
   |
>            |                                                             =
   |
>   2.25e+06 ++                                                            =
   |
>    2.2e+06 ++                      O                                     =
   |
>   2.15e+06 ++  O                       O        O   O                    =
   |
>    2.1e+06 ++          O       O                                         =
   |
>            O       O                        O                            =
   |
>   2.05e+06 ++              O                                             =
   |
>      2e+06 ++------------------------------------------------------------=
---+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Xiaolong

--===============6247413887412177589==--

