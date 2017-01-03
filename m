Content-Type: multipart/mixed; boundary="===============4369123584504527569=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/core] 6b94780e45: unixbench.score -4.5% regression
Date: Tue, 03 Jan 2017 10:01:00 +0100
Message-ID: <CAKfTPtDZ+3suhcdK9gnx449i4TWUrOjWCxUUFiaAU90B+UBUrA@mail.gmail.com>
In-Reply-To: <20170103071316.GA2823@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4369123584504527569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

Thanks for testing, I'm going to look for another root cause
It was also mentioned  a -2.9% regression with a 8 threads Intel(R)
Core(TM) i7 CPU 870 @ 2.93GHz with 6G memory. Have you checked this
platform too ?

Regards,
Vincent

On 3 January 2017 at 08:13, Ye Xiaolong <xiaolong.ye@intel.com> wrote:
> On 01/02, Vincent Guittot wrote:
>>Hi Xiaolong,
>>
>>Le Monday 19 Dec 2016 =C5=95 08:14:53 (+0800), kernel test robot a =C3=A9=
crit :
>>>
>>> Greeting,
>>>
>>> FYI, we noticed a -4.5% regression of unixbench.score due to commit:
>>
>>I have been able to restore performance on my platform with the patch bel=
ow.
>>Could you test it ?
>>
>>---
>> kernel/sched/core.c | 1
>> 1 file changed, 1 insertion(+)
>>
>>diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>index 393759b..6e7d45c 100644
>>--- a/kernel/sched/core.c
>>+++ b/kernel/sched/core.c
>>@@ -2578,6 +2578,7 @@ void wake_up_new_task(struct task_struct *p)
>>       __set_task_cpu(p, select_task_rq(p, task_cpu(p), SD_BALANCE_FORK, =
0));
>> #endif
>>       rq =3D __task_rq_lock(p, &rf);
>>+      update_rq_clock(rq);
>>       post_init_entity_util_avg(&p->se);
>>
>>       activate_task(rq, p, 0);
>>--
>>2.7.4
>>
>>Vincent
>
> Hi, Vincent,
>
> I applied your fix patch on top of 6b94780 ("sched/core: Use load_avg for=
 selecting idlest group"),
> and here is the comparison. (60df283834fd4def3c11ad2de3 is the fix commit=
 id).
> Seems the performance hasn't been restored back.

Thanks for testings.
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-6/performance/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz/300=
s/lkp-wsm-ep1/shell1/unixbench
>
> commit:
>   f519a3f1c6b7a990e5aed37a8f853c6ecfdee945
>   6b94780e45c17b83e3e75f8aaca5a328db583c74
>   60df283834fd4def3c11ad2de3e6fc9e81b7dff1
>
> f519a3f1c6b7a990 6b94780e45c17b83e3e75f8aac 60df283834fd4def3c11ad2de3
> ---------------- -------------------------- --------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      25565 =C4=85  0%      -4.5%      24414 =C4=85  0%      -4.5%      24=
421 =C4=85  0%  unixbench.score
>   13223805 =C4=85  2%     -19.6%   10628072 =C4=85  0%     -21.3%   10412=
818 =C4=85  1%  unixbench.time.involuntary_context_switches
>  9.232e+08 =C4=85  0%      -4.3%  8.831e+08 =C4=85  0%      -4.3%  8.838e=
+08 =C4=85  0%  unixbench.time.minor_page_faults
>       1807 =C4=85  0%      -5.4%       1709 =C4=85  0%      -5.6%       1=
705 =C4=85  0%  unixbench.time.percent_of_cpu_this_job_got
>       5656 =C4=85  0%      -6.8%       5271 =C4=85  0%      -7.3%       5=
243 =C4=85  0%  unixbench.time.system_time
>       5743 =C4=85  0%      -4.0%       5514 =C4=85  0%      -3.9%       5=
516 =C4=85  0%  unixbench.time.user_time
>   29557557 =C4=85  0%      -2.6%   28781098 =C4=85  0%      -2.2%   28919=
280 =C4=85  0%  unixbench.time.voluntary_context_switches
>     741766 =C4=85  2%     -62.4%     279054 =C4=85  1%     -61.8%     283=
034 =C4=85  1%  interrupts.CAL:Function_call_interrupts
>    2912823 =C4=85  0%      -9.7%    2630010 =C4=85  0%      -8.7%    2660=
077 =C4=85  0%  softirqs.RCU
>   13223805 =C4=85  2%     -19.6%   10628072 =C4=85  0%     -21.3%   10412=
818 =C4=85  1%  time.involuntary_context_switches
>     126250 =C4=85  0%     -12.2%     110890 =C4=85  0%     -11.5%     111=
739 =C4=85  0%  vmstat.system.cs
>      31060 =C4=85  1%      -9.2%      28214 =C4=85  0%      -9.6%      28=
078 =C4=85  0%  vmstat.system.in
>     454.50 =C4=85150%    +164.7%       1203 =C4=85166%    +792.3%       4=
055 =C4=85 18%  numa-numastat.node0.numa_foreign
>     454.50 =C4=85150%    +164.7%       1203 =C4=85166%    +792.3%       4=
055 =C4=85 18%  numa-numastat.node0.numa_miss
>       4297 =C4=85 15%     -18.1%       3520 =C4=85 57%     -84.5%     666=
.40 =C4=85113%  numa-numastat.node1.numa_foreign
>       4297 =C4=85 15%     -18.1%       3520 =C4=85 57%     -84.5%     666=
.40 =C4=85113%  numa-numastat.node1.numa_miss
>      78.58 =C4=85  0%      -5.6%      74.20 =C4=85  0%      -6.0%      73=
.90 =C4=85  0%  turbostat.%Busy
>       2507 =C4=85  0%      -5.6%       2366 =C4=85  0%      -6.0%       2=
356 =C4=85  0%  turbostat.Avg_MHz
>       3.01 =C4=85  2%    +100.4%       6.03 =C4=85  2%    +100.1%       6=
.02 =C4=85  0%  turbostat.CPU%c3
>       2.35 =C4=85  1%      +6.8%       2.51 =C4=85  4%     +12.1%       2=
.64 =C4=85  1%  turbostat.CPU%c6
>       1.25 =C4=85  5%     -17.1%       1.04 =C4=85 22%     -32.3%       0=
.85 =C4=85  5%  perf-profile.children.cycles-pp.__irqentry_text_start
>
> Thanks,
> Xiaolong
>
>>
>>>
>>>
>>> commit: 6b94780e45c17b83e3e75f8aaca5a328db583c74 ("sched/core: Use load=
_avg for selecting idlest group")
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
>>>
>>> in testcase: unixbench
>>> on test machine: 24 threads Nehalem-EP with 24G memory
>>> with following parameters:
>>>
>>>      runtime: 300s
>>>      nr_task: 100%
>>>      test: shell1
>>>      cpufreq_governor: performance
>>>
>>> test-description: UnixBench is the original BYTE UNIX benchmark suite a=
ims to test performance of Unix-like system.
>>> test-url: https://github.com/kdlucas/byte-unixbench
>>>
>>> In addition to that, the commit also has significant impact on the foll=
owing tests:
>>>
>>> +------------------+---------------------------------------------------=
--------------------+
>>> | testcase: change | unixbench: unixbench.score -2.9% regression       =
                    |
>>> | test machine     | 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz w=
ith 6G memory       |
>>> | test parameters  | nr_task=3D1                                       =
                      |
>>> |                  | runtime=3D300s                                    =
                      |
>>> |                  | test=3Dshell8                                     =
                      |
>>> +------------------+---------------------------------------------------=
--------------------+
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
--------------------------->
>>>
>>>
>>> To reproduce:
>>>
>>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp=
-tests.git
>>>         cd lkp-tests
>>>         bin/lkp install job.yaml  # job file is attached in this email
>>>         bin/lkp run     job.yaml
>>>
>>> testcase/path_params/tbox_group/run: unixbench/300s-100%-shell1-perform=
ance/lkp-wsm-ep1
>>>
>>> f519a3f1c6b7a990  6b94780e45c17b83e3e75f8aac
>>> ----------------  --------------------------
>>>      25565              -5%      24414        unixbench.score
>>>   29557557                    28781098        unixbench.time.voluntary_=
context_switches
>>>       5743              -4%       5514        unixbench.time.user_time
>>>  9.232e+08              -4%  8.831e+08        unixbench.time.minor_page=
_faults
>>>       1807              -5%       1709        unixbench.time.percent_of=
_cpu_this_job_got
>>>       5656              -7%       5271        unixbench.time.system_time
>>>   13223805             -20%   10628072        unixbench.time.involuntar=
y_context_switches
>>>     741766             -62%     279054        interrupts.CAL:Function_c=
all_interrupts
>>>      31060              -9%      28214        vmstat.system.in
>>>     126250             -12%     110890        vmstat.system.cs
>>>      78.58              -6%      74.20        turbostat.%Busy
>>>       2507              -6%       2366        turbostat.Avg_MHz
>>>       9134 =C4=85 47%     -6e+03       2973 =C4=85 36%  latency_stats.m=
ax.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>>>     380879 =C4=85 10%      5e+05     887692 =C4=85 49%  latency_stats.s=
um.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.=
handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>      31710 =C4=85 15%     -2e+04      10583 =C4=85 14%  latency_stats.s=
um.call_rwsem_down_write_failed.__vma_adjust.__split_vma.do_munmap.vm_munma=
p.elf_map.load_elf_binary.search_binary_handler.do_execveat_common.SyS_exec=
ve.do_syscall_64.return_from_SYSCALL_64
>>>      51796 =C4=85  4%     -4e+04      15457 =C4=85 10%  latency_stats.s=
um.call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.=
do_munmap.vm_munmap.elf_map.load_elf_binary.search_binary_handler.do_execve=
at_common.SyS_execve.do_syscall_64
>>>     111998 =C4=85 18%     -7e+04      37074 =C4=85 14%  latency_stats.s=
um.call_rwsem_down_write_failed.__vma_adjust.__split_vma.do_munmap.mmap_reg=
ion.do_mmap.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
>>>     275087 =C4=85 15%     -2e+05      81973 =C4=85  3%  latency_stats.s=
um.call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.=
do_munmap.mmap_region.do_mmap.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_S=
YSCALL_64_fastpath
>>>     930993 =C4=85 12%     -6e+05     320520 =C4=85  4%  latency_stats.s=
um.call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.=
vm_mmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_common.Sy=
S_execve.do_syscall_64
>>>    4755783 =C4=85  9%     -3e+06    1619348 =C4=85  4%  latency_stats.s=
um.call_rwsem_down_write_failed.__vma_adjust.__split_vma.split_vma.mprotect=
_fixup.do_mprotect_pkey.SyS_mprotect.entry_SYSCALL_64_fastpath
>>>    5536067 =C4=85 10%     -4e+06    1929338 =C4=85  3%  latency_stats.s=
um.call_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.do_syscall_=
64.return_from_SYSCALL_64
>>>  9.032e+08              -4%   8.64e+08        perf-stat.page-faults
>>>  9.032e+08              -4%   8.64e+08        perf-stat.minor-faults
>>>  2.329e+09                   2.269e+09        perf-stat.node-load-misses
>>>    2.2e+09              -9%  2.011e+09 =C4=85  5%  perf-stat.dTLB-store=
-misses
>>>  3.278e+10              -9%  2.987e+10 =C4=85  6%  perf-stat.dTLB-load-=
misses
>>>   19484819              13%   21974129        perf-stat.cpu-migrations
>>>  3.755e+13              -6%   3.54e+13        perf-stat.cpu-cycles
>>>       3244               4%       3379        perf-stat.instructions-pe=
r-iTLB-miss
>>>  4.536e+12              -4%  4.332e+12        perf-stat.branch-instruct=
ions
>>>  2.303e+13              -4%  2.208e+13        perf-stat.instructions
>>>  5.768e+12              -4%  5.517e+12        perf-stat.dTLB-loads
>>>  3.567e+11              -4%  3.414e+11        perf-stat.cache-references
>>>       2.97                        2.93        perf-stat.branch-miss-rat=
e%
>>>  2.768e+10                   2.699e+10        perf-stat.node-stores
>>>  5.446e+10              -3%  5.275e+10        perf-stat.cache-misses
>>>       0.03              -4%       0.03        perf-stat.iTLB-load-miss-=
rate%
>>>  9.673e+09              -4%  9.294e+09        perf-stat.node-loads
>>>  3.596e+12              -4%  3.442e+12        perf-stat.dTLB-stores
>>>       0.61                        0.62        perf-stat.ipc
>>>  1.347e+11              -6%   1.27e+11        perf-stat.branch-misses
>>>  7.098e+09              -8%  6.533e+09        perf-stat.iTLB-load-misses
>>>  2.309e+13              -4%  2.206e+13        perf-stat.iTLB-loads
>>>   79911173             -12%   70187035        perf-stat.context-switches
>>>
>>>
>>>
>>>                                  turbostat._Busy
>>>
>>>   90 ++-------------------------------------*---*----------------------=
-----+
>>>      |                                    ..       *...*..             =
     |
>>>   80 *+..*..*...*..*...*..*...*..*...O...*  O   O  O   O  O...O..O...O =
 O   O
>>>   70 O+  O  O   O  O   O  O   O  O                                     =
     |
>>>      |                                                                 =
     |
>>>   60 ++                                                                =
     |
>>>   50 ++                                                                =
     |
>>>      |                                                                 =
     |
>>>   40 ++                                                                =
     |
>>>   30 ++                                                                =
     |
>>>      |                                                                 =
     |
>>>   20 ++                                                                =
     |
>>>   10 ++                                                                =
     |
>>>      |                                                                 =
     |
>>>    0 ++----------------------------------O-----------------------------=
-----+
>>>
>>>
>>>
>>>
>>>
>>>                     unixbench.time.percent_of_cpu_this_job_got
>>>
>>>   2500 ++--------------------------------------------------------------=
-----+
>>>        |                                                               =
     |
>>>        |                                       .*...                   =
     |
>>>   2000 ++                                   .*.     *..*...            =
     |
>>>        *..*...*..*...*..*...*..*...*..O...*. O  O   O  O   O..O...O..O =
  O  O
>>>        O  O   O  O   O  O   O  O   O                                   =
     |
>>>   1500 ++                                                              =
     |
>>>        |                                                               =
     |
>>>   1000 ++                                                              =
     |
>>>        |                                                               =
     |
>>>        |                                                               =
     |
>>>    500 ++                                                              =
     |
>>>        |                                                               =
     |
>>>        |                                                               =
     |
>>>      0 ++---------------------------------O----------------------------=
-----+
>>>
>>>
>>>                                   vmstat.system.in
>>>
>>>   40000 ++-------------------------------------------------------------=
-----+
>>>         |                                          .*...*..            =
     |
>>>   35000 ++                                  .*...*.                    =
     |
>>>   30000 *+.*...*..*...*..*..*...*..*...*..*.               *..*...*..* =
     |
>>>         O  O   O  O   O  O  O   O  O   O     O   O  O   O  O  O   O  O =
  O  O
>>>   25000 ++                                                             =
     |
>>>         |                                                              =
     |
>>>   20000 ++                                                             =
     |
>>>         |                                                              =
     |
>>>   15000 ++                                                             =
     |
>>>   10000 ++                                                             =
     |
>>>         |                                                              =
     |
>>>    5000 ++                                                             =
     |
>>>         |                                                              =
     |
>>>       0 ++--------------------------------O----------------------------=
-----+
>>>
>>>      [*] bisect-good sample
>>>      [O] bisect-bad  sample
>>>
>>>
>>> Disclaimer:
>>> Results have been estimated based on internal Intel analysis and are pr=
ovided
>>> for informational purposes only. Any difference in system hardware or s=
oftware
>>> design or configuration may affect actual performance.
>>>
>>>
>>> Thanks,
>>> Xiaolong
>>

--===============4369123584504527569==--

