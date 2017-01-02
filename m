Content-Type: multipart/mixed; boundary="===============6782435620002790188=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/core] 6b94780e45: unixbench.score -4.5% regression
Date: Mon, 02 Jan 2017 15:56:37 +0100
Message-ID: <20170102145637.GA8760@linaro.org>
In-Reply-To: <20161219001453.GD1723@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6782435620002790188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

Le Monday 19 Dec 2016 =C3=A0 08:14:53 (+0800), kernel test robot a =C3=A9cr=
it :
> =

> Greeting,
> =

> FYI, we noticed a -4.5% regression of unixbench.score due to commit:

I have been able to restore performance on my platform with the patch below.
Could you test it ?

---
 kernel/sched/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 393759b..6e7d45c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2578,6 +2578,7 @@ void wake_up_new_task(struct task_struct *p)
 	__set_task_cpu(p, select_task_rq(p, task_cpu(p), SD_BALANCE_FORK, 0));
 #endif
 	rq =3D __task_rq_lock(p, &rf);
+	update_rq_clock(rq);
 	post_init_entity_util_avg(&p->se);
 =

 	activate_task(rq, p, 0);
-- =

2.7.4

Vincent

> =

> =

> commit: 6b94780e45c17b83e3e75f8aaca5a328db583c74 ("sched/core: Use load_a=
vg for selecting idlest group")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: unixbench
> on test machine: 24 threads Nehalem-EP with 24G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 100%
> 	test: shell1
> 	cpufreq_governor: performance
> =

> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
------------------+
> | testcase: change | unixbench: unixbench.score -2.9% regression         =
                  |
> | test machine     | 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz wit=
h 6G memory       |
> | test parameters  | nr_task=3D1                                         =
                    |
> |                  | runtime=3D300s                                      =
                    |
> |                  | test=3Dshell8                                       =
                    |
> +------------------+-----------------------------------------------------=
------------------+
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

> testcase/path_params/tbox_group/run: unixbench/300s-100%-shell1-performan=
ce/lkp-wsm-ep1
> =

> f519a3f1c6b7a990  6b94780e45c17b83e3e75f8aac  =

> ----------------  --------------------------  =

>      25565              -5%      24414        unixbench.score
>   29557557                    28781098        unixbench.time.voluntary_co=
ntext_switches
>       5743              -4%       5514        unixbench.time.user_time
>  9.232e+08              -4%  8.831e+08        unixbench.time.minor_page_f=
aults
>       1807              -5%       1709        unixbench.time.percent_of_c=
pu_this_job_got
>       5656              -7%       5271        unixbench.time.system_time
>   13223805             -20%   10628072        unixbench.time.involuntary_=
context_switches
>     741766             -62%     279054        interrupts.CAL:Function_cal=
l_interrupts
>      31060              -9%      28214        vmstat.system.in
>     126250             -12%     110890        vmstat.system.cs
>      78.58              -6%      74.20        turbostat.%Busy
>       2507              -6%       2366        turbostat.Avg_MHz
>       9134 =C2=B1 47%     -6e+03       2973 =C2=B1 36%  latency_stats.max=
.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>     380879 =C2=B1 10%      5e+05     887692 =C2=B1 49%  latency_stats.sum=
.wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.ha=
ndle_mm_fault.__do_page_fault.do_page_fault.page_fault
>      31710 =C2=B1 15%     -2e+04      10583 =C2=B1 14%  latency_stats.sum=
.call_rwsem_down_write_failed.__vma_adjust.__split_vma.do_munmap.vm_munmap.=
elf_map.load_elf_binary.search_binary_handler.do_execveat_common.SyS_execve=
.do_syscall_64.return_from_SYSCALL_64
>      51796 =C2=B1  4%     -4e+04      15457 =C2=B1 10%  latency_stats.sum=
.call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do=
_munmap.vm_munmap.elf_map.load_elf_binary.search_binary_handler.do_execveat=
_common.SyS_execve.do_syscall_64
>     111998 =C2=B1 18%     -7e+04      37074 =C2=B1 14%  latency_stats.sum=
.call_rwsem_down_write_failed.__vma_adjust.__split_vma.do_munmap.mmap_regio=
n.do_mmap.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
>     275087 =C2=B1 15%     -2e+05      81973 =C2=B1  3%  latency_stats.sum=
.call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do=
_munmap.mmap_region.do_mmap.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
>     930993 =C2=B1 12%     -6e+05     320520 =C2=B1  4%  latency_stats.sum=
.call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.vm=
_mmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.do_syscall_64
>    4755783 =C2=B1  9%     -3e+06    1619348 =C2=B1  4%  latency_stats.sum=
.call_rwsem_down_write_failed.__vma_adjust.__split_vma.split_vma.mprotect_f=
ixup.do_mprotect_pkey.SyS_mprotect.entry_SYSCALL_64_fastpath
>    5536067 =C2=B1 10%     -4e+06    1929338 =C2=B1  3%  latency_stats.sum=
.call_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.do_syscall_64=
.return_from_SYSCALL_64
>  9.032e+08              -4%   8.64e+08        perf-stat.page-faults
>  9.032e+08              -4%   8.64e+08        perf-stat.minor-faults
>  2.329e+09                   2.269e+09        perf-stat.node-load-misses
>    2.2e+09              -9%  2.011e+09 =C2=B1  5%  perf-stat.dTLB-store-m=
isses
>  3.278e+10              -9%  2.987e+10 =C2=B1  6%  perf-stat.dTLB-load-mi=
sses
>   19484819              13%   21974129        perf-stat.cpu-migrations
>  3.755e+13              -6%   3.54e+13        perf-stat.cpu-cycles
>       3244               4%       3379        perf-stat.instructions-per-=
iTLB-miss
>  4.536e+12              -4%  4.332e+12        perf-stat.branch-instructio=
ns
>  2.303e+13              -4%  2.208e+13        perf-stat.instructions
>  5.768e+12              -4%  5.517e+12        perf-stat.dTLB-loads
>  3.567e+11              -4%  3.414e+11        perf-stat.cache-references
>       2.97                        2.93        perf-stat.branch-miss-rate%
>  2.768e+10                   2.699e+10        perf-stat.node-stores
>  5.446e+10              -3%  5.275e+10        perf-stat.cache-misses
>       0.03              -4%       0.03        perf-stat.iTLB-load-miss-ra=
te%
>  9.673e+09              -4%  9.294e+09        perf-stat.node-loads
>  3.596e+12              -4%  3.442e+12        perf-stat.dTLB-stores
>       0.61                        0.62        perf-stat.ipc
>  1.347e+11              -6%   1.27e+11        perf-stat.branch-misses
>  7.098e+09              -8%  6.533e+09        perf-stat.iTLB-load-misses
>  2.309e+13              -4%  2.206e+13        perf-stat.iTLB-loads
>   79911173             -12%   70187035        perf-stat.context-switches
> =

> =

> =

>                                  turbostat._Busy
> =

>   90 ++-------------------------------------*---*------------------------=
---+
>      |                                    ..       *...*..               =
   |
>   80 *+..*..*...*..*...*..*...*..*...O...*  O   O  O   O  O...O..O...O  O=
   O
>   70 O+  O  O   O  O   O  O   O  O                                       =
   |
>      |                                                                   =
   |
>   60 ++                                                                  =
   |
>   50 ++                                                                  =
   |
>      |                                                                   =
   |
>   40 ++                                                                  =
   |
>   30 ++                                                                  =
   |
>      |                                                                   =
   |
>   20 ++                                                                  =
   |
>   10 ++                                                                  =
   |
>      |                                                                   =
   |
>    0 ++----------------------------------O-------------------------------=
---+
> =

> =

> =

> =

> =

>                     unixbench.time.percent_of_cpu_this_job_got
> =

>   2500 ++----------------------------------------------------------------=
---+
>        |                                                                 =
   |
>        |                                       .*...                     =
   |
>   2000 ++                                   .*.     *..*...              =
   |
>        *..*...*..*...*..*...*..*...*..O...*. O  O   O  O   O..O...O..O   =
O  O
>        O  O   O  O   O  O   O  O   O                                     =
   |
>   1500 ++                                                                =
   |
>        |                                                                 =
   |
>   1000 ++                                                                =
   |
>        |                                                                 =
   |
>        |                                                                 =
   |
>    500 ++                                                                =
   |
>        |                                                                 =
   |
>        |                                                                 =
   |
>      0 ++---------------------------------O------------------------------=
---+
> =

> =

>                                   vmstat.system.in
> =

>   40000 ++---------------------------------------------------------------=
---+
>         |                                          .*...*..              =
   |
>   35000 ++                                  .*...*.                      =
   |
>   30000 *+.*...*..*...*..*..*...*..*...*..*.               *..*...*..*   =
   |
>         O  O   O  O   O  O  O   O  O   O     O   O  O   O  O  O   O  O   =
O  O
>   25000 ++                                                               =
   |
>         |                                                                =
   |
>   20000 ++                                                               =
   |
>         |                                                                =
   |
>   15000 ++                                                               =
   |
>   10000 ++                                                               =
   |
>         |                                                                =
   |
>    5000 ++                                                               =
   |
>         |                                                                =
   |
>       0 ++--------------------------------O------------------------------=
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


--===============6782435620002790188==--

