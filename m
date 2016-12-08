Content-Type: multipart/mixed; boundary="===============4486007709343156445=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Thu, 08 Dec 2016 16:39:10 +0800
Message-ID: <87bmwm6ci9.fsf@yhuang-dev.intel.com>
In-Reply-To: <20161207131740.GY3092@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4486007709343156445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:

> On Thu, Dec 01, 2016 at 02:07:29AM +0800, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> FYI, we noticed a -26.1% regression of aim7.jobs-per-min due to commit:
>> =

>> =

>> commit: fd6f48529f4067c6bfbead88d3d7d117d51150f6 ("x86,paravirt: Optimiz=
e native pv_lock_ops.vcpu_is_preempted")
>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking=
/core
>> =

>> in testcase: aim7
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m 5G
>> with following parameters:
>> =

>> 	test: link_test
>> 	load: 2000
>> =

>> test-description: AIM7 is a traditional UNIX system level benchmark
>> suite which is used to test and measure the performance of multiuser
>> system.
>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>> =

>
> OK, so I'm having a very hard time reproducing this. How can I run this
> link_test stuff when I got aim7 compiled? This is all impenetrable gunk
> to me.
>
>
>
> Also, do you see the same problem with the upstream commit?
>
>   3cded4179481 ("x86/paravirt: Optimize native pv_lock_ops.vcpu_is_preemp=
ted()")

Here is the test result for the commit,

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-6/x86_64-rhel-7.2/2000/debian-x86_64-2016-08-31.cgz/vm-lkp-a05/link_t=
est/aim7

commit: =

  05ffc951392df57edecc2519327b169210c3df75
  3cded41794818d788aa1dc028ede4a1c1222d937

05ffc951392df57e 3cded41794818d788aa1dc028e =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      9169 =C2=B1  2%     -27.9%       6610 =C2=B1  1%  aim7.jobs-per-min
      1325 =C2=B1  2%     +38.2%       1831 =C2=B1  1%  aim7.time.elapsed_t=
ime
      1325 =C2=B1  2%     +38.2%       1831 =C2=B1  1%  aim7.time.elapsed_t=
ime.max
      1639 =C2=B1  2%      +9.1%       1789 =C2=B1  2%  aim7.time.system_ti=
me
      2561 =C2=B1  2%     +32.7%       3399 =C2=B1  2%  aim7.time.user_time
    528278 =C2=B1  2%     +81.8%     960538 =C2=B1  0%  aim7.time.voluntary=
_context_switches
    813472 =C2=B1  1%     +62.6%    1323099 =C2=B1  4%  softirqs.RCU
     34284 =C2=B1  1%    +393.3%     169136 =C2=B1  9%  softirqs.SCHED
   1858312 =C2=B1  1%     +30.8%    2430971 =C2=B1  1%  softirqs.TIMER
     65.00 =C2=B1 15%     -47.7%      34.00 =C2=B1 20%  vmstat.procs.r
      3201 =C2=B1  0%      -7.9%       2949 =C2=B1  0%  vmstat.system.cs
      5629 =C2=B1  1%     -10.3%       5049 =C2=B1  1%  vmstat.system.in
    488672 =C2=B1  1%     +82.2%     890241 =C2=B1  1%  proc-vmstat.numa_hit
    488610 =C2=B1  1%     +82.2%     890164 =C2=B1  1%  proc-vmstat.numa_lo=
cal
    531586 =C2=B1  1%     +77.1%     941453 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
    521563 =C2=B1  1%     +83.6%     957670 =C2=B1  0%  proc-vmstat.pgfault
    524470 =C2=B1  1%     +78.5%     936028 =C2=B1  1%  proc-vmstat.pgfree
     42797 =C2=B1  0%     +10.2%      47167 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      3903 =C2=B1  0%     +21.8%       4753 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      3903 =C2=B1  0%     +22.0%       4761 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
      2001 =C2=B1  1%     +26.8%       2536 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      2291 =C2=B1  1%     +18.1%       2706 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
      1325 =C2=B1  2%     +38.2%       1831 =C2=B1  1%  time.elapsed_time
      1325 =C2=B1  2%     +38.2%       1831 =C2=B1  1%  time.elapsed_time.m=
ax
    316.33 =C2=B1  0%     -10.6%     282.67 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
      2561 =C2=B1  2%     +32.7%       3399 =C2=B1  2%  time.user_time
    528278 =C2=B1  2%     +81.8%     960538 =C2=B1  0%  time.voluntary_cont=
ext_switches
     16345 =C2=B1 83%     -92.9%       1153 =C2=B1  9%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.do_syscall_64.return_from_SYSCALL_64
     23013 =C2=B1 68%     -93.0%       1600 =C2=B1 29%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.SyS_=
mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
     45454 =C2=B1111%     -90.8%       4161 =C2=B1141%  latency_stats.avg.n=
fs_wait_on_request.nfs_writepage_setup.nfs_updatepage.nfs_write_end.generic=
_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL=
_64_fastpath
     32652 =C2=B1 60%     -99.0%     333.67 =C2=B1 16%  latency_stats.avg.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    484699 =C2=B1 65%     -92.3%      37212 =C2=B1 72%  latency_stats.avg.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
     45.00 =C2=B1  9%  +25319.3%      11438 =C2=B1  8%  latency_stats.hits.=
pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      5712 =C2=B1 82%    +318.0%      23877 =C2=B1 66%  latency_stats.max.c=
all_rwsem_down_write_failed.__vma_adjust.__split_vma.split_vma.mprotect_fix=
up.do_mprotect_pkey.SyS_mprotect.entry_SYSCALL_64_fastpath
      2760 =C2=B1141%   +1049.6%      31733 =C2=B1 28%  latency_stats.max.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.do_syscall_64.r=
eturn_from_SYSCALL_64
      0.00 =C2=B1 -1%      +Inf%      10184 =C2=B1 64%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCA=
LL_64_fastpath
     39755 =C2=B1 68%     -71.8%      11206 =C2=B1 27%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.SyS_=
mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
     82135 =C2=B1124%     -94.9%       4161 =C2=B1141%  latency_stats.max.n=
fs_wait_on_request.nfs_writepage_setup.nfs_updatepage.nfs_write_end.generic=
_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL=
_64_fastpath
    592251 =C2=B1118%     -83.3%      98662 =C2=B1 45%  latency_stats.max.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    792307 =C2=B1103%     -86.0%     110586 =C2=B1 22%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      12847 =C2=B1 70%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    484699 =C2=B1 65%     -92.3%      37212 =C2=B1 72%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
      6136 =C2=B1 72%    +760.8%      52822 =C2=B1 42%  latency_stats.sum.c=
all_rwsem_down_write_failed.__vma_adjust.__split_vma.split_vma.mprotect_fix=
up.do_mprotect_pkey.SyS_mprotect.entry_SYSCALL_64_fastpath
      7297 =C2=B1141%   +1151.9%      91355 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.do_syscall_64.r=
eturn_from_SYSCALL_64
      0.00 =C2=B1 -1%      +Inf%      12156 =C2=B1 64%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCA=
LL_64_fastpath
    122802 =C2=B1129%     -96.6%       4161 =C2=B1141%  latency_stats.sum.n=
fs_wait_on_request.nfs_writepage_setup.nfs_updatepage.nfs_write_end.generic=
_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL=
_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      18300 =C2=B1 71%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    292182 =C2=B1 32%    +645.7%    2178683 =C2=B1  1%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    484699 =C2=B1 65%     -92.3%      37212 =C2=B1 72%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
    694272 =C2=B1  2%     +27.9%     887696 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.avg
    697960 =C2=B1  2%     +28.0%     893571 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.max
    690173 =C2=B1  2%     +28.1%     883901 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.min
     53.01 =C2=B1  4%     -17.6%      43.69 =C2=B1  3%  sched_debug.cfs_rq:=
/.load_avg.stddev
   3373615 =C2=B1  2%     +20.5%    4065963 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   3393431 =C2=B1  2%     +20.7%    4096926 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.max
   3348545 =C2=B1  1%     +20.5%    4035538 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.min
     17027 =C2=B1 12%     +41.4%      24071 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.94 =C2=B1  5%     -15.4%       0.80 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_running.min
      0.06 =C2=B1 20%     +99.1%       0.12 =C2=B1 38%  sched_debug.cfs_rq:=
/.nr_running.stddev
     21.65 =C2=B1 32%     +52.0%      32.92 =C2=B1  5%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
     12.59 =C2=B1  7%     +61.9%      20.38 =C2=B1 23%  sched_debug.cfs_rq:=
/.nr_spread_over.min
    165.33 =C2=B1  9%      -9.1%     150.30 =C2=B1  7%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
     -2516 =C2=B1-372%   +1102.6%     -30258 =C2=B1 -5%  sched_debug.cfs_rq=
:/.spread0.avg
     13923 =C2=B1 69%     -97.6%     332.39 =C2=B1 84%  sched_debug.cfs_rq:=
/.spread0.max
    -23392 =C2=B1-61%    +156.6%     -60032 =C2=B1 -9%  sched_debug.cfs_rq:=
/.spread0.min
     14184 =C2=B1 15%     +66.7%      23649 =C2=B1 10%  sched_debug.cfs_rq:=
/.spread0.stddev
    981.73 =C2=B1  1%     -11.1%     872.34 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.min
     13.21 =C2=B1 50%    +259.1%      47.44 =C2=B1 35%  sched_debug.cfs_rq:=
/.util_avg.stddev
   5791458 =C2=B1  3%     -43.5%    3274044 =C2=B1  7%  sched_debug.cpu.avg=
_idle.avg
   9237536 =C2=B1  8%     -45.0%    5079786 =C2=B1  6%  sched_debug.cpu.avg=
_idle.max
   2851452 =C2=B1 10%     -32.2%    1933507 =C2=B1  8%  sched_debug.cpu.avg=
_idle.min
   2476106 =C2=B1 16%     -50.6%    1223320 =C2=B1  8%  sched_debug.cpu.avg=
_idle.stddev
    799962 =C2=B1  2%     +32.0%    1056226 =C2=B1  2%  sched_debug.cpu.clo=
ck.avg
    801460 =C2=B1  2%     +31.9%    1056747 =C2=B1  2%  sched_debug.cpu.clo=
ck.max
    798223 =C2=B1  2%     +32.2%    1055492 =C2=B1  2%  sched_debug.cpu.clo=
ck.min
      1204 =C2=B1 22%     -60.4%     476.30 =C2=B1 54%  sched_debug.cpu.clo=
ck.stddev
    732345 =C2=B1  2%     +33.3%     976382 =C2=B1  2%  sched_debug.cpu.clo=
ck_task.avg
    735188 =C2=B1  2%     +33.3%     980230 =C2=B1  2%  sched_debug.cpu.clo=
ck_task.max
    729410 =C2=B1  2%     +33.4%     972788 =C2=B1  2%  sched_debug.cpu.clo=
ck_task.min
      2143 =C2=B1 20%     +33.0%       2849 =C2=B1  9%  sched_debug.cpu.clo=
ck_task.stddev
     51.61 =C2=B1 10%     -17.4%      42.64 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].stddev
      2700 =C2=B1  8%     +31.7%       3555 =C2=B1  9%  sched_debug.cpu.cur=
r->pid.avg
      4641 =C2=B1  0%     +45.0%       6732 =C2=B1  7%  sched_debug.cpu.cur=
r->pid.max
      1557 =C2=B1  7%     +64.5%       2562 =C2=B1  6%  sched_debug.cpu.cur=
r->pid.stddev
    319378 =C2=B1  7%     -14.0%     274755 =C2=B1  4%  sched_debug.cpu.loa=
d.avg
    617372 =C2=B1 17%     -22.6%     478021 =C2=B1 10%  sched_debug.cpu.loa=
d.max
    198535 =C2=B1 26%     -28.5%     142039 =C2=B1 12%  sched_debug.cpu.loa=
d.stddev
   6923798 =C2=B1 12%     -21.5%    5435214 =C2=B1  2%  sched_debug.cpu.max=
_idle_balance_cost.avg
  12147808 =C2=B1 11%     -28.2%    8724945 =C2=B1  8%  sched_debug.cpu.max=
_idle_balance_cost.max
   3456820 =C2=B1 13%     -36.1%    2208165 =C2=B1 15%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      0.00 =C2=B1 22%     -59.3%       0.00 =C2=B1 52%  sched_debug.cpu.nex=
t_balance.stddev
    694723 =C2=B1  2%     +29.2%     897791 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.avg
    701516 =C2=B1  2%     +28.9%     904484 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.max
    688870 =C2=B1  2%     +29.6%     892655 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.min
     27.46 =C2=B1 27%     -55.3%      12.27 =C2=B1 45%  sched_debug.cpu.nr_=
running.avg
     38.22 =C2=B1  5%     -49.0%      19.48 =C2=B1  8%  sched_debug.cpu.nr_=
running.max
     18.61 =C2=B1 62%     -63.7%       6.75 =C2=B1115%  sched_debug.cpu.nr_=
running.min
    417974 =C2=B1  0%     +42.1%     594084 =C2=B1  1%  sched_debug.cpu.nr_=
switches.avg
    434615 =C2=B1  0%     +42.0%     617135 =C2=B1  2%  sched_debug.cpu.nr_=
switches.max
    402365 =C2=B1  1%     +43.4%     576858 =C2=B1  2%  sched_debug.cpu.nr_=
switches.min
    480.59 =C2=B1  3%     +17.0%     562.30 =C2=B1  7%  sched_debug.cpu.nr_=
uninterruptible.max
     41.82 =C2=B1 26%     +97.5%      82.59 =C2=B1 26%  sched_debug.cpu.nr_=
uninterruptible.stddev
    424839 =C2=B1  0%     +39.8%     593868 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.avg
    440948 =C2=B1  0%     +39.2%     613987 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.max
    409377 =C2=B1  1%     +41.2%     578031 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.min
      3171 =C2=B1  4%   +1083.4%      37528 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.avg
      4199 =C2=B1  7%    +833.0%      39181 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.max
      2124 =C2=B1 19%   +1579.8%      35690 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.min
    781.90 =C2=B1 23%     +73.8%       1358 =C2=B1 33%  sched_debug.cpu.sch=
ed_goidle.stddev
    160749 =C2=B1  2%     +72.9%     277897 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.avg
    168447 =C2=B1  1%     +69.7%     285869 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.max
    154130 =C2=B1  2%     +76.3%     271775 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.min
     57828 =C2=B1  2%     +42.9%      82608 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
     64780 =C2=B1  1%     +38.6%      89761 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.max
     51318 =C2=B1  2%     +49.9%      76907 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.min
    796657 =C2=B1  2%     +32.4%    1054652 =C2=B1  2%  sched_debug.cpu_clk
    793315 =C2=B1  2%     +32.5%    1051328 =C2=B1  2%  sched_debug.ktime
      0.00 =C2=B1 81%    +196.1%       0.01 =C2=B1 43%  sched_debug.rt_rq:/=
.rt_time.min
    796657 =C2=B1  2%     +32.4%    1054652 =C2=B1  2%  sched_debug.sched_c=
lk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-6/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/vm-lkp-a03/writeseek3/=
will-it-scale

commit: =

  05ffc951392df57edecc2519327b169210c3df75
  3cded41794818d788aa1dc028ede4a1c1222d937

05ffc951392df57e 3cded41794818d788aa1dc028e =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    133981 =C2=B1  7%     -15.7%     112956 =C2=B1  7%  will-it-scale.per_p=
rocess_ops
    135498 =C2=B1  0%     -22.4%     105187 =C2=B1  1%  will-it-scale.per_t=
hread_ops
      0.20 =C2=B1  5%     -53.4%       0.09 =C2=B1  6%  will-it-scale.scala=
bility
      8824 =C2=B1  5%     -43.5%       4988 =C2=B1  9%  will-it-scale.time.=
involuntary_context_switches
    117.00 =C2=B1  0%     -46.2%      63.00 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    254.95 =C2=B1  0%     -47.3%     134.44 =C2=B1  0%  will-it-scale.time.=
system_time
    259475 =C2=B1  4%    +431.2%    1378354 =C2=B1  3%  will-it-scale.time.=
voluntary_context_switches
      1368 =C2=B1 24%     +49.3%       2042 =C2=B1  7%  interrupts.CAL:Func=
tion_call_interrupts
      2426 =C2=B1  6%     -15.4%       2052 =C2=B1  7%  slabinfo.anon_vma.a=
ctive_objs
      5472 =C2=B1  4%    +394.8%      27077 =C2=B1  2%  vmstat.system.cs
      3197 =C2=B1  1%     +75.9%       5623 =C2=B1  4%  vmstat.system.in
     35005 =C2=B1  2%     +48.1%      51829 =C2=B1  0%  softirqs.RCU
     21333 =C2=B1  2%    +326.5%      90979 =C2=B1  0%  softirqs.SCHED
    308038 =C2=B1  0%     -28.9%     219138 =C2=B1  2%  softirqs.TIMER
      8824 =C2=B1  5%     -43.5%       4988 =C2=B1  9%  time.involuntary_co=
ntext_switches
    117.00 =C2=B1  0%     -46.2%      63.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    254.95 =C2=B1  0%     -47.3%     134.44 =C2=B1  0%  time.system_time
     15.69 =C2=B1  0%     -24.6%      11.84 =C2=B1  1%  time.user_time
    259475 =C2=B1  4%    +431.2%    1378354 =C2=B1  3%  time.voluntary_cont=
ext_switches
      5073 =C2=B1 86%    +333.7%      21999 =C2=B1172%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_do_access.nfs_permission.__inode_permission.inode_per=
mission
    510237 =C2=B1  5%    +496.3%    3042399 =C2=B1  3%  latency_stats.hits.=
call_rwsem_down_write_failed.generic_file_write_iter.__vfs_write.vfs_write.=
SyS_write.entry_SYSCALL_64_fastpath
    510237 =C2=B1  5%    +496.3%    3042399 =C2=B1  3%  latency_stats.hits.=
max
     60936 =C2=B1 34%    +303.6%     245959 =C2=B1128%  latency_stats.max.m=
ax
      0.00 =C2=B1 -1%      +Inf%       5416 =C2=B1100%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     30640 =C2=B1127%    +545.3%     197733 =C2=B1173%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_do_access.nfs_permission.__inode_permission.inode_per=
mission
      7424 =C2=B1 77%    +321.6%      31304 =C2=B1169%  latency_stats.max.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_mm_fault.__do_page_fault.trace_do_page_fault.do_async_page_fault.async_p=
age_fault
  31808074 =C2=B1  1%    +808.0%  2.888e+08 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_write_failed.generic_file_write_iter.__vfs_write.vfs_write.S=
yS_write.entry_SYSCALL_64_fastpath
  31808074 =C2=B1  1%    +808.0%  2.888e+08 =C2=B1  0%  latency_stats.sum.m=
ax
      0.00 =C2=B1 -1%      +Inf%      10281 =C2=B1 99%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    973.00 =C2=B1 46%  +29729.6%     290242 =C2=B1 13%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     43549 =C2=B1 91%    +354.6%     197969 =C2=B1172%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nfs=
_revalidate_inode.nfs_do_access.nfs_permission.__inode_permission.inode_per=
mission
     11317 =C2=B1 87%    +178.8%      31548 =C2=B1168%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_mm_fault.__do_page_fault.trace_do_page_fault.do_async_page_fault.async_p=
age_fault
     46612 =C2=B1  2%     -30.2%      32522 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.avg
     87197 =C2=B1  0%     -18.7%      70902 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.max
     18125 =C2=B1  8%     -33.2%      12115 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.min
     25645 =C2=B1  2%     -11.1%      22809 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.stddev
    249.94 =C2=B1  4%     -15.1%     212.27 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.avg
    167.19 =C2=B1  5%     -24.6%     126.06 =C2=B1  8%  sched_debug.cfs_rq:=
/.load_avg.min
    166834 =C2=B1  2%     -39.5%     100933 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    247458 =C2=B1  2%     -29.3%     174873 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.max
     85072 =C2=B1  8%     -36.3%      54167 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.min
     59318 =C2=B1  6%     -23.3%      45506 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.81 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq:=
/.nr_spread_over.min
   -161804 =C2=B1 -6%     -25.4%    -120730 =C2=B1 -2%  sched_debug.cfs_rq:=
/.spread0.min
     59329 =C2=B1  6%     -23.3%      45518 =C2=B1  3%  sched_debug.cfs_rq:=
/.spread0.stddev
    814.55 =C2=B1  2%     -13.6%     703.81 =C2=B1  6%  sched_debug.cfs_rq:=
/.util_avg.avg
    992.19 =C2=B1  1%     -11.6%     876.62 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.max
    651.12 =C2=B1  5%     -16.8%     541.88 =C2=B1 12%  sched_debug.cfs_rq:=
/.util_avg.min
    266.14 =C2=B1 14%     +57.2%     418.49 =C2=B1  7%  sched_debug.cpu.clo=
ck_task.stddev
    213.55 =C2=B1  9%     -21.3%     168.08 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].avg
    230.91 =C2=B1  5%     -21.8%     180.59 =C2=B1 10%  sched_debug.cpu.cpu=
_load[1].avg
    152.81 =C2=B1  3%     -45.2%      83.69 =C2=B1 29%  sched_debug.cpu.cpu=
_load[1].min
    230.55 =C2=B1  4%     -22.0%     179.84 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].avg
    150.19 =C2=B1  6%     -41.3%      88.12 =C2=B1 23%  sched_debug.cpu.cpu=
_load[2].min
    228.58 =C2=B1  4%     -21.8%     178.77 =C2=B1  9%  sched_debug.cpu.cpu=
_load[3].avg
    148.25 =C2=B1  9%     -39.9%      89.12 =C2=B1 19%  sched_debug.cpu.cpu=
_load[3].min
    225.36 =C2=B1  4%     -21.8%     176.28 =C2=B1  8%  sched_debug.cpu.cpu=
_load[4].avg
    142.75 =C2=B1  8%     -37.3%      89.56 =C2=B1 16%  sched_debug.cpu.cpu=
_load[4].min
     30240 =C2=B1  7%     -15.5%      25555 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.min
     56455 =C2=B1  1%    +695.6%     449188 =C2=B1  3%  sched_debug.cpu.nr_=
switches.avg
     79408 =C2=B1  9%    +667.6%     609573 =C2=B1  6%  sched_debug.cpu.nr_=
switches.max
     39865 =C2=B1  2%    +127.2%      90564 =C2=B1  4%  sched_debug.cpu.nr_=
switches.min
     15379 =C2=B1 21%   +1269.2%     210574 =C2=B1  4%  sched_debug.cpu.nr_=
switches.stddev
      2.12 =C2=B1 25%     +50.0%       3.19 =C2=B1 11%  sched_debug.cpu.nr_=
uninterruptible.max
      1.54 =C2=B1 18%     +54.9%       2.39 =C2=B1 19%  sched_debug.cpu.nr_=
uninterruptible.stddev
     50481 =C2=B1  1%    +776.6%     442502 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.avg
     74230 =C2=B1  9%    +711.6%     602428 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.max
     32590 =C2=B1  2%    +162.7%      85601 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.min
     16115 =C2=B1 20%   +1198.7%     209295 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.stddev
     14868 =C2=B1  6%   +1322.9%     211568 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.avg
     19320 =C2=B1  8%   +1407.3%     291212 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.max
     10486 =C2=B1 10%    +211.8%      32696 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.min
      3421 =C2=B1 14%   +2960.2%     104701 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.stddev
     26125 =C2=B1  2%    +771.8%     227765 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.avg
     38958 =C2=B1 10%    +676.7%     302591 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.max
     18584 =C2=B1 12%    +148.7%      46227 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.min
      7961 =C2=B1 30%   +1225.3%     105512 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.stddev
      9646 =C2=B1 10%     -34.8%       6293 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.avg
     25388 =C2=B1 16%     -51.3%      12373 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.max
      9497 =C2=B1 20%     -56.8%       4102 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-6/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/vm-lkp-a03/writeseek2/=
will-it-scale

commit: =

  05ffc951392df57edecc2519327b169210c3df75
  3cded41794818d788aa1dc028ede4a1c1222d937

05ffc951392df57e 3cded41794818d788aa1dc028e =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    117707 =C2=B1  0%     -10.4%     105488 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.14 =C2=B1  5%     -30.0%       0.10 =C2=B1  5%  will-it-scale.scala=
bility
      7386 =C2=B1  5%     -27.7%       5340 =C2=B1  5%  will-it-scale.time.=
involuntary_context_switches
    114.50 =C2=B1  0%     -45.4%      62.50 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    252.41 =C2=B1  0%     -47.3%     133.15 =C2=B1  0%  will-it-scale.time.=
system_time
    390729 =C2=B1  4%    +233.0%    1301165 =C2=B1  5%  will-it-scale.time.=
voluntary_context_switches
      1385 =C2=B1 21%     +49.6%       2072 =C2=B1  6%  interrupts.CAL:Func=
tion_call_interrupts
      2938 =C2=B1 42%     +61.1%       4735 =C2=B1 29%  slabinfo.kmalloc-32=
.active_objs
      2938 =C2=B1 42%     +61.1%       4735 =C2=B1 29%  slabinfo.kmalloc-32=
.num_objs
      7965 =C2=B1  4%    +217.8%      25316 =C2=B1  4%  vmstat.system.cs
      3325 =C2=B1  0%     +67.9%       5583 =C2=B1  5%  vmstat.system.in
     35250 =C2=B1  2%     +49.4%      52681 =C2=B1  3%  softirqs.RCU
     24427 =C2=B1  2%    +271.5%      90748 =C2=B1  2%  softirqs.SCHED
    305640 =C2=B1  0%     -28.3%     219173 =C2=B1  0%  softirqs.TIMER
      7386 =C2=B1  5%     -27.7%       5340 =C2=B1  5%  time.involuntary_co=
ntext_switches
    114.50 =C2=B1  0%     -45.4%      62.50 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    252.41 =C2=B1  0%     -47.3%     133.15 =C2=B1  0%  time.system_time
    390729 =C2=B1  4%    +233.0%    1301165 =C2=B1  5%  time.voluntary_cont=
ext_switches
      0.00 =C2=B1 -1%      +Inf%       4556 =C2=B1105%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    789155 =C2=B1  5%    +259.8%    2839571 =C2=B1  4%  latency_stats.hits.=
call_rwsem_down_write_failed.generic_file_write_iter.__vfs_write.vfs_write.=
SyS_write.entry_SYSCALL_64_fastpath
    789155 =C2=B1  5%    +259.8%    2839571 =C2=B1  4%  latency_stats.hits.=
max
      0.00 =C2=B1 -1%      +Inf%       7416 =C2=B1100%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     12955 =C2=B1106%     -95.9%     536.50 =C2=B1129%  latency_stats.max.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_mm_fault.__do_page_fault.trace_do_page_fault.do_async_page_fault.async_p=
age_fault
  45389051 =C2=B1  2%    +541.5%  2.912e+08 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_write_failed.generic_file_write_iter.__vfs_write.vfs_write.S=
yS_write.entry_SYSCALL_64_fastpath
  45389051 =C2=B1  2%    +541.5%  2.912e+08 =C2=B1  0%  latency_stats.sum.m=
ax
     24448 =C2=B1 22%    +304.0%      98774 =C2=B1 10%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      14768 =C2=B1125%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      5731 =C2=B1 51%   +5184.2%     302877 =C2=B1  7%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     17745 =C2=B1118%     -96.0%     708.75 =C2=B1102%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_mm_fault.__do_page_fault.trace_do_page_fault.do_async_page_fault.async_p=
age_fault
     46558 =C2=B1  2%     -47.2%      24580 =C2=B1 57%  sched_debug.cfs_rq:=
/.exec_clock.avg
     87062 =C2=B1  0%     -38.4%      53670 =C2=B1 57%  sched_debug.cfs_rq:=
/.exec_clock.max
     18511 =C2=B1  8%     -52.9%       8711 =C2=B1 58%  sched_debug.cfs_rq:=
/.exec_clock.min
     25505 =C2=B1  2%     -31.9%      17378 =C2=B1 57%  sched_debug.cfs_rq:=
/.exec_clock.stddev
    157973 =C2=B1 23%     -73.0%      42690 =C2=B1 89%  sched_debug.cfs_rq:=
/.load.min
    248.97 =C2=B1  3%     -34.5%     163.19 =C2=B1 58%  sched_debug.cfs_rq:=
/.load_avg.avg
    170.56 =C2=B1  4%     -52.2%      81.50 =C2=B1 59%  sched_debug.cfs_rq:=
/.load_avg.min
    163483 =C2=B1  1%     -55.0%      73569 =C2=B1 57%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    244881 =C2=B1  1%     -48.5%     126134 =C2=B1 57%  sched_debug.cfs_rq:=
/.min_vruntime.max
     82001 =C2=B1  7%     -51.8%      39556 =C2=B1 58%  sched_debug.cfs_rq:=
/.min_vruntime.min
     59695 =C2=B1  5%     -45.4%      32602 =C2=B1 57%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.94 =C2=B1  4%     -33.3%       0.62 =C2=B1 57%  sched_debug.cfs_rq:=
/.nr_running.avg
      0.81 =C2=B1 13%     -69.2%       0.25 =C2=B1 70%  sched_debug.cfs_rq:=
/.nr_running.min
    232.31 =C2=B1  2%     -46.5%     124.30 =C2=B1 58%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    370.56 =C2=B1  8%     -39.2%     225.31 =C2=B1 58%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
    151.12 =C2=B1  4%     -76.1%      36.12 =C2=B1 58%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
    -80526 =C2=B1 -6%     -34.9%     -52383 =C2=B1-58%  sched_debug.cfs_rq:=
/.spread0.avg
   -162018 =C2=B1 -5%     -46.7%     -86405 =C2=B1-57%  sched_debug.cfs_rq:=
/.spread0.min
     59706 =C2=B1  5%     -45.4%      32609 =C2=B1 57%  sched_debug.cfs_rq:=
/.spread0.stddev
    815.88 =C2=B1  1%     -39.2%     496.09 =C2=B1 58%  sched_debug.cfs_rq:=
/.util_avg.avg
    992.94 =C2=B1  1%     -34.3%     652.12 =C2=B1 57%  sched_debug.cfs_rq:=
/.util_avg.max
    660.44 =C2=B1  2%     -46.0%     356.75 =C2=B1 60%  sched_debug.cfs_rq:=
/.util_avg.min
    223.78 =C2=B1  4%     -45.3%     122.33 =C2=B1 57%  sched_debug.cpu.cpu=
_load[0].avg
    365.50 =C2=B1  9%     -38.2%     225.94 =C2=B1 58%  sched_debug.cpu.cpu=
_load[0].max
    126.19 =C2=B1 16%     -68.8%      39.31 =C2=B1 84%  sched_debug.cpu.cpu=
_load[0].min
    223.53 =C2=B1  4%     -42.2%     129.09 =C2=B1 57%  sched_debug.cpu.cpu=
_load[1].avg
    364.94 =C2=B1  9%     -38.4%     224.69 =C2=B1 58%  sched_debug.cpu.cpu=
_load[1].max
    129.06 =C2=B1 14%     -56.9%      55.56 =C2=B1 61%  sched_debug.cpu.cpu=
_load[1].min
    220.55 =C2=B1  4%     -43.2%     125.22 =C2=B1 57%  sched_debug.cpu.cpu=
_load[2].avg
    363.94 =C2=B1  8%     -38.8%     222.75 =C2=B1 59%  sched_debug.cpu.cpu=
_load[2].max
    128.06 =C2=B1 12%     -57.5%      54.44 =C2=B1 61%  sched_debug.cpu.cpu=
_load[2].min
    218.84 =C2=B1  3%     -44.4%     121.75 =C2=B1 57%  sched_debug.cpu.cpu=
_load[3].avg
    363.44 =C2=B1  6%     -39.8%     218.94 =C2=B1 59%  sched_debug.cpu.cpu=
_load[3].max
    129.06 =C2=B1  9%     -57.2%      55.25 =C2=B1 62%  sched_debug.cpu.cpu=
_load[3].min
    218.17 =C2=B1  2%     -45.4%     119.05 =C2=B1 57%  sched_debug.cpu.cpu=
_load[4].avg
    362.81 =C2=B1  4%     -41.1%     213.56 =C2=B1 59%  sched_debug.cpu.cpu=
_load[4].max
    130.88 =C2=B1  5%     -56.2%      57.38 =C2=B1 62%  sched_debug.cpu.cpu=
_load[4].min
      1262 =C2=B1  6%     -41.9%     733.83 =C2=B1 62%  sched_debug.cpu.cur=
r->pid.avg
    562.94 =C2=B1 37%     -84.7%      86.38 =C2=B1104%  sched_debug.cpu.cur=
r->pid.min
    158697 =C2=B1 23%     -70.4%      46952 =C2=B1 73%  sched_debug.cpu.loa=
d.min
     29618 =C2=B1  8%     -34.9%      19275 =C2=B1 57%  sched_debug.cpu.nr_=
load_updates.min
      0.81 =C2=B1 13%     -69.2%       0.25 =C2=B1 70%  sched_debug.cpu.nr_=
running.min
     10582 =C2=B1  9%     -57.9%       4458 =C2=B1 58%  sched_debug.cpu.ttw=
u_local.avg
     29402 =C2=B1 13%     -69.0%       9127 =C2=B1 58%  sched_debug.cpu.ttw=
u_local.max
     11214 =C2=B1 15%     -72.0%       3144 =C2=B1 58%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-6/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/vm-lkp-a03/unlink1/wil=
l-it-scale

commit: =

  05ffc951392df57edecc2519327b169210c3df75
  3cded41794818d788aa1dc028ede4a1c1222d937

05ffc951392df57e 3cded41794818d788aa1dc028e =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     16313 =C2=B1  6%     -23.6%      12469 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
     16895 =C2=B1  0%     -26.5%      12411 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.31 =C2=B1  1%     -60.3%       0.12 =C2=B1  1%  will-it-scale.scala=
bility
     16998 =C2=B1  4%     -32.5%      11466 =C2=B1  8%  will-it-scale.time.=
involuntary_context_switches
    113.00 =C2=B1  0%     -42.7%      64.75 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    253.12 =C2=B1  0%     -43.1%     144.03 =C2=B1  0%  will-it-scale.time.=
system_time
     78161 =C2=B1  0%    +940.8%     813494 =C2=B1  1%  will-it-scale.time.=
voluntary_context_switches
      1368 =C2=B1 17%     +36.4%       1866 =C2=B1  4%  interrupts.CAL:Func=
tion_call_interrupts
      2802 =C2=B1  1%    +448.2%      15364 =C2=B1  0%  vmstat.system.cs
      3227 =C2=B1  1%    +100.4%       6467 =C2=B1  0%  vmstat.system.in
     56760 =C2=B1  3%     +79.7%     101973 =C2=B1  1%  softirqs.RCU
     36216 =C2=B1  3%    +154.3%      92080 =C2=B1  0%  softirqs.SCHED
    315821 =C2=B1  0%     -25.6%     235069 =C2=B1  0%  softirqs.TIMER
   1067890 =C2=B1  2%     -43.1%     607496 =C2=B1  2%  proc-vmstat.numa_hit
   1067861 =C2=B1  2%     -43.1%     607468 =C2=B1  2%  proc-vmstat.numa_lo=
cal
   1762497 =C2=B1  2%     -44.6%     976765 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
   1759927 =C2=B1  2%     -44.7%     974114 =C2=B1  1%  proc-vmstat.pgfree
      2922 =C2=B1  7%     -38.1%       1808 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
      2968 =C2=B1  7%     -37.5%       1855 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_objs
      2743 =C2=B1  7%     -38.8%       1680 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.active_objs
      2772 =C2=B1  7%     -38.5%       1705 =C2=B1  3%  slabinfo.shmem_inod=
e_cache.num_objs
     16998 =C2=B1  4%     -32.5%      11466 =C2=B1  8%  time.involuntary_co=
ntext_switches
    113.00 =C2=B1  0%     -42.7%      64.75 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    253.12 =C2=B1  0%     -43.1%     144.03 =C2=B1  0%  time.system_time
      8.11 =C2=B1  1%     -27.4%       5.88 =C2=B1  3%  time.user_time
     78161 =C2=B1  0%    +940.8%     813494 =C2=B1  1%  time.voluntary_cont=
ext_switches
     18200 =C2=B1 82%     -68.3%       5774 =C2=B1 62%  latency_stats.avg.m=
ax
     84687 =C2=B1  5%    +775.3%     741232 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_write_failed.do_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpa=
th
     79821 =C2=B1  4%    +998.5%     876839 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
     84780 =C2=B1  5%    +934.3%     876839 =C2=B1  0%  latency_stats.hits.=
max
    926.75 =C2=B1173%    +490.0%       5467 =C2=B1 88%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.do_syscall_64.return_from_SYSCALL_64
     90755 =C2=B1 73%     -52.2%      43373 =C2=B1  9%  latency_stats.max.m=
ax
      8546 =C2=B1 38%     -86.9%       1123 =C2=B1 36%  latency_stats.max.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      7734 =C2=B1 85%     -85.4%       1127 =C2=B1 47%  latency_stats.max.s=
top_one_cpu.sched_exec.do_execveat_common.SyS_execve.do_syscall_64.return_f=
rom_SYSCALL_64
  19824666 =C2=B1  3%    +553.4%  1.295e+08 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_write_failed.do_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
  18676250 =C2=B1  2%    +666.0%  1.431e+08 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_write_failed.path_openat.do_filp_open.do_sys_open.SyS_open.e=
ntry_SYSCALL_64_fastpath
    926.75 =C2=B1173%    +739.2%       7777 =C2=B1 99%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.do_syscall_64.return_from_SYSCALL_64
  19824666 =C2=B1  3%    +621.6%  1.431e+08 =C2=B1  0%  latency_stats.sum.m=
ax
     21861 =C2=B1 35%    +281.3%      83362 =C2=B1  7%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      8887 =C2=B1 60%   +3600.2%     328845 =C2=B1  3%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     47251 =C2=B1  2%     -26.7%      34657 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.avg
     86652 =C2=B1  0%     -16.5%      72331 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.max
     22604 =C2=B1  8%     -35.7%      14535 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.min
    284.03 =C2=B1  6%     -19.8%     227.78 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.avg
    187.00 =C2=B1  6%     -38.2%     115.50 =C2=B1  8%  sched_debug.cfs_rq:=
/.load_avg.min
    156921 =C2=B1  2%     -37.5%      98113 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
    233602 =C2=B1  2%     -29.5%     164691 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.max
     83618 =C2=B1  6%     -35.4%      54026 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.min
     54783 =C2=B1  4%     -24.5%      41351 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
    207.30 =C2=B1  3%     -15.7%     174.77 =C2=B1  9%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     97.31 =C2=B1  3%     -43.8%      54.69 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.min
    -76348 =C2=B1 -4%     -13.0%     -66417 =C2=B1 -3%  sched_debug.cfs_rq:=
/.spread0.avg
   -149671 =C2=B1 -4%     -26.2%    -110516 =C2=B1 -2%  sched_debug.cfs_rq:=
/.spread0.min
     54797 =C2=B1  4%     -24.5%      41361 =C2=B1  2%  sched_debug.cfs_rq:=
/.spread0.stddev
    838.38 =C2=B1  2%     -20.6%     665.44 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.avg
      1009 =C2=B1  0%     -13.5%     873.06 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.max
    698.25 =C2=B1  4%     -27.7%     504.75 =C2=B1  8%  sched_debug.cfs_rq:=
/.util_avg.min
    267.78 =C2=B1 20%    +144.8%     655.64 =C2=B1 16%  sched_debug.cpu.clo=
ck_task.stddev
    213.39 =C2=B1  6%     -20.8%     169.06 =C2=B1 11%  sched_debug.cpu.cpu=
_load[0].avg
    116.38 =C2=B1 24%     -68.8%      36.31 =C2=B1 54%  sched_debug.cpu.cpu=
_load[0].min
    234.58 =C2=B1  2%     -18.5%     191.17 =C2=B1  8%  sched_debug.cpu.cpu=
_load[1].avg
    158.19 =C2=B1  3%     -47.0%      83.81 =C2=B1 33%  sched_debug.cpu.cpu=
_load[1].min
    232.41 =C2=B1  3%     -20.4%     185.09 =C2=B1  8%  sched_debug.cpu.cpu=
_load[2].avg
    154.25 =C2=B1  3%     -48.6%      79.31 =C2=B1 25%  sched_debug.cpu.cpu=
_load[2].min
    229.50 =C2=B1  3%     -21.3%     180.53 =C2=B1  7%  sched_debug.cpu.cpu=
_load[3].avg
    150.00 =C2=B1  3%     -48.2%      77.62 =C2=B1 17%  sched_debug.cpu.cpu=
_load[3].min
    227.19 =C2=B1  3%     -22.3%     176.44 =C2=B1  7%  sched_debug.cpu.cpu=
_load[4].avg
    147.00 =C2=B1  4%     -46.1%      79.25 =C2=B1 14%  sched_debug.cpu.cpu=
_load[4].min
    418.31 =C2=B1 38%     -80.6%      81.19 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.min
    528.82 =C2=B1 12%     +31.8%     696.79 =C2=B1  1%  sched_debug.cpu.cur=
r->pid.stddev
     38066 =C2=B1  2%     -16.8%      31687 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.min
     24488 =C2=B1  3%      +9.9%      26915 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.stddev
      1.30 =C2=B1 11%     -18.1%       1.06 =C2=B1 10%  sched_debug.cpu.nr_=
running.avg
     49239 =C2=B1  1%    +415.4%     253772 =C2=B1  1%  sched_debug.cpu.nr_=
switches.avg
     77869 =C2=B1 10%    +320.9%     327779 =C2=B1  1%  sched_debug.cpu.nr_=
switches.max
     30323 =C2=B1 15%    +158.7%      78446 =C2=B1  9%  sched_debug.cpu.nr_=
switches.min
     18253 =C2=B1 25%    +464.5%     103041 =C2=B1  4%  sched_debug.cpu.nr_=
switches.stddev
     43018 =C2=B1  1%    +474.6%     247180 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.avg
     72309 =C2=B1 12%    +342.4%     319861 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.max
     22541 =C2=B1 19%    +224.9%      73230 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.min
     19100 =C2=B1 22%    +432.6%     101731 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.stddev
     11814 =C2=B1  7%    +842.4%     111345 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.avg
     19421 =C2=B1 17%    +664.7%     148514 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.max
      6494 =C2=B1 15%    +278.2%      24559 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.min
      5147 =C2=B1 19%    +888.0%      50856 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.stddev
     22211 =C2=B1  1%    +475.1%     127736 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.avg
     35498 =C2=B1 11%    +365.5%     165259 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.max
     14006 =C2=B1 17%    +155.9%      35840 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.min
      8309 =C2=B1 27%    +544.9%      53589 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.stddev

Best Regards,
Huang, Ying

--===============4486007709343156445==--

