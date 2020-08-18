Content-Type: multipart/mixed; boundary="===============0180364616901618789=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 276c410448: will-it-scale.per_thread_ops -12.3% regression
Date: Tue, 18 Aug 2020 15:18:34 +0800
Message-ID: <13d4807e-fcea-c87e-d4d4-4a99aa44d3a3@linux.intel.com>
In-Reply-To: <20200616162817.GA2723@paulmck-ThinkPad-P72>
List-Id: <oe-lkp.lists.linux.dev>

--===============0180364616901618789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/17/2020 12:28 AM, Paul E. McKenney wrote:
> On Tue, Jun 16, 2020 at 10:02:24AM +0800, Xing Zhengjun wrote:
>> Hi Paul,
>>
>>     Do you have time to take a look at this? Thanks.
> =

> I do not see how this change could affect anything that isn't directly
> using RCU Tasks Trace.  Yes, there is some addition to process creation,
> but that isn't what is showing the increased overhead.
> =

> I see that the instruction count increased.  Is it possible that this
> is due to changes in offsets within the task_struct structure?
> =

> 							Thanx, Paul


How about this regression? I test the latest v5.9-rc1, the regression is =

still exsited.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/debug-setup/nr_task/mode/test/c=
pufreq_governor/ucode:
 =

lkp-knm01/will-it-scale/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-9/te=
st2/100%/thread/page_fault3/performance/0x11

commit:
   b0afa0f056676ffe0a7213818f09d2460adbcc16
   276c410448dbca357a2bc3539acfe04862e5f172
   v5.9-rc1

b0afa0f056676ffe 276c410448dbca357a2bc3539ac                    v5.9-rc1
---------------- --------------------------- ---------------------------
          %stddev     %change         %stddev     %change         %stddev
              \          |                \          |                \
       1417           -13.2%       1230 =C2=B1  2%     -16.6%       1182 =

   will-it-scale.per_thread_ops
     408456           -13.2%     354391 =C2=B1  2%     -16.6%     340519 =

   will-it-scale.workload


> =

>> On 6/15/2020 4:57 PM, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -12.3% regression of will-it-scale.per_thread_ops due=
 to commit:
>>>
>>>
>>> commit: 276c410448dbca357a2bc3539acfe04862e5f172 ("rcu-tasks: Split ->t=
rc_reader_need_end")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: will-it-scale
>>> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
>>> with following parameters:
>>>
>>> 	nr_task: 100%
>>> 	mode: thread
>>> 	test: page_fault3
>>> 	cpufreq_governor: performance
>>> 	ucode: 0x11
>>>
>>> test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
>>> test-url: https://github.com/antonblanchard/will-it-scale
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
--------------------------->
>>>
>>>
>>> To reproduce:
>>>
>>>           git clone https://github.com/intel/lkp-tests.git
>>>           cd lkp-tests
>>>           bin/lkp install job.yaml  # job file is attached in this email
>>>           bin/lkp run     job.yaml
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/t=
estcase/ucode:
>>>     gcc-9/performance/x86_64-rhel-7.6/thread/100%/debian-x86_64-2019111=
4.cgz/lkp-knm01/page_fault3/will-it-scale/0x11
>>>
>>> commit:
>>>     b0afa0f056 ("rcu-tasks: Provide boot parameter to delay IPIs until =
late in grace period")
>>>     276c410448 ("rcu-tasks: Split ->trc_reader_need_end")
>>>
>>> b0afa0f056676ffe 276c410448dbca357a2bc3539ac
>>> ---------------- ---------------------------
>>>          fail:runs  %reproduction    fail:runs
>>>              |             |             |
>>>             2:4          -50%            :4     dmesg.WARNING:at#for_ip=
_interrupt_entry/0x
>>>              :4           28%           1:4     perf-profile.calltrace.=
cycles-pp.error_entry
>>>             0:4            0%           0:4     perf-profile.children.c=
ycles-pp.error_exit
>>>             1:4            7%           2:4     perf-profile.children.c=
ycles-pp.error_entry
>>>             0:4            4%           1:4     perf-profile.self.cycle=
s-pp.error_entry
>>>            %stddev     %change         %stddev
>>>                \          |                \
>>>         1414           -12.3%       1241 =C2=B1  2%  will-it-scale.per_=
thread_ops
>>>       463.32            +1.7%     470.99        will-it-scale.time.elap=
sed_time
>>>       463.32            +1.7%     470.99        will-it-scale.time.elap=
sed_time.max
>>>       407566           -12.3%     357573 =C2=B1  2%  will-it-scale.work=
load
>>>        48.51            -1.5%      47.77        boot-time.boot
>>>    7.203e+10           +20.0%   8.64e+10 =C2=B1  2%  cpuidle.C1.time
>>>    2.162e+08 =C2=B1  2%     +27.7%  2.761e+08 =C2=B1  2%  cpuidle.C1.us=
age
>>>        60.50           +12.2       72.74 =C2=B1  2%  mpstat.cpu.all.idl=
e%
>>>        39.17           -12.2       26.97 =C2=B1  6%  mpstat.cpu.all.sys%
>>>         2334 =C2=B1 12%     +18.8%       2772 =C2=B1  5%  slabinfo.khug=
epaged_mm_slot.active_objs
>>>         2334 =C2=B1 12%     +18.8%       2772 =C2=B1  5%  slabinfo.khug=
epaged_mm_slot.num_objs
>>>        60.25           +20.3%      72.50 =C2=B1  2%  vmstat.cpu.id
>>>        92.75 =C2=B1  3%     -21.6%      72.75 =C2=B1  5%  vmstat.procs.r
>>>       223709           +41.8%     317250 =C2=B1  3%  vmstat.system.cs
>>>       641687 =C2=B1  3%      +8.0%     693245 =C2=B1  2%  proc-vmstat.n=
r_inactive_anon
>>>       641688 =C2=B1  3%      +8.0%     693245 =C2=B1  2%  proc-vmstat.n=
r_zone_inactive_anon
>>>       166782            -3.7%     160632        proc-vmstat.numa_hint_f=
aults
>>>       166782            -3.7%     160632        proc-vmstat.numa_hint_f=
aults_local
>>>       984.25           -14.2%     844.75 =C2=B1  2%  proc-vmstat.numa_h=
uge_pte_updates
>>>       710979           -11.2%     631134        proc-vmstat.numa_pte_up=
dates
>>>    1.967e+08           -10.9%  1.752e+08        proc-vmstat.pgfault
>>>        58.18            +3.4%      60.17        perf-stat.i.MPKI
>>>    1.173e+09           +10.5%  1.296e+09        perf-stat.i.branch-inst=
ructions
>>>         6.74            -0.1        6.68        perf-stat.i.branch-miss=
-rate%
>>>     72495831           +10.7%   80219684        perf-stat.i.branch-miss=
es
>>>        14.68            -0.6       14.06        perf-stat.i.cache-miss-=
rate%
>>>     43014696           +10.5%   47551690        perf-stat.i.cache-misses
>>>    2.936e+08           +15.6%  3.393e+08        perf-stat.i.cache-refer=
ences
>>>       227441           +42.0%     323034 =C2=B1  3%  perf-stat.i.contex=
t-switches
>>>        37.22           -29.0%      26.44 =C2=B1  5%  perf-stat.i.cpi
>>>    1.828e+11           -22.3%  1.421e+11 =C2=B1  3%  perf-stat.i.cpu-cy=
cles
>>>       513.71           +13.6%     583.63        perf-stat.i.cpu-migrati=
ons
>>>         4303           -27.8%       3107 =C2=B1  5%  perf-stat.i.cycles=
-between-cache-misses
>>>         1.78            -0.0        1.74        perf-stat.i.iTLB-load-m=
iss-rate%
>>>     90757979            +9.1%   98982336        perf-stat.i.iTLB-load-m=
isses
>>>    5.518e+09           +10.1%  6.076e+09        perf-stat.i.iTLB-loads
>>>    5.501e+09           +10.3%  6.065e+09        perf-stat.i.instructions
>>>        59.50            +2.4%      60.91        perf-stat.i.instruction=
s-per-iTLB-miss
>>>         0.03           +48.9%       0.05 =C2=B1  3%  perf-stat.i.ipc
>>>         0.61           -22.2%       0.47 =C2=B1  3%  perf-stat.i.metric=
.GHz
>>>         0.85 =C2=B1  2%      +6.3%       0.90 =C2=B1  3%  perf-stat.i.m=
etric.K/sec
>>>        23.19           +10.3%      25.58        perf-stat.i.metric.M/sec
>>>       398027           -13.3%     345187 =C2=B1  2%  perf-stat.i.minor-=
faults
>>>       398027           -13.3%     345187 =C2=B1  2%  perf-stat.i.page-f=
aults
>>>        51.63            +4.7%      54.06        perf-stat.overall.MPKI
>>>        14.82            -0.6       14.26        perf-stat.overall.cache=
-miss-rate%
>>>        32.82           -28.9%      23.34 =C2=B1  4%  perf-stat.overall.=
cpi
>>>         4290           -29.4%       3029 =C2=B1  5%  perf-stat.overall.=
cycles-between-cache-misses
>>>         0.03           +40.9%       0.04 =C2=B1  4%  perf-stat.overall.=
ipc
>>>      6447068           +28.0%    8254132 =C2=B1  3%  perf-stat.overall.=
path-length
>>>    1.214e+09           +10.5%  1.341e+09        perf-stat.ps.branch-ins=
tructions
>>>     72454767           +10.7%   80188768        perf-stat.ps.branch-mis=
ses
>>>     43379426           +11.2%   48228470        perf-stat.ps.cache-miss=
es
>>>    2.927e+08           +15.5%  3.382e+08 =C2=B1  2%  perf-stat.ps.cache=
-references
>>>       223136           +42.0%     316818 =C2=B1  3%  perf-stat.ps.conte=
xt-switches
>>>    1.861e+11           -21.6%  1.459e+11 =C2=B1  3%  perf-stat.ps.cpu-c=
ycles
>>>       498.80           +14.0%     568.54        perf-stat.ps.cpu-migrat=
ions
>>>     90216145            +8.9%   98279965        perf-stat.ps.iTLB-load-=
misses
>>>    5.688e+09           +10.2%  6.267e+09        perf-stat.ps.iTLB-loads
>>>     5.67e+09           +10.3%  6.256e+09        perf-stat.ps.instructio=
ns
>>>       404137           -13.0%     351604 =C2=B1  2%  perf-stat.ps.minor=
-faults
>>>       404137           -13.0%     351604 =C2=B1  2%  perf-stat.ps.page-=
faults
>>>    2.627e+12           +12.2%  2.949e+12        perf-stat.total.instruc=
tions
>>>        84210           -25.9%      62375 =C2=B1  5%  sched_debug.cfs_rq=
:/.exec_clock.avg
>>>        91870 =C2=B1  3%     -23.3%      70486 =C2=B1  5%  sched_debug.c=
fs_rq:/.exec_clock.max
>>>        79683           -23.1%      61285 =C2=B1  6%  sched_debug.cfs_rq=
:/.exec_clock.min
>>>         2299 =C2=B1  7%     +36.5%       3139 =C2=B1 12%  sched_debug.c=
fs_rq:/.load.avg
>>>       216559           +81.8%     393746 =C2=B1 14%  sched_debug.cfs_rq=
:/.load.max
>>>        16561 =C2=B1  3%     +64.0%      27165 =C2=B1 14%  sched_debug.c=
fs_rq:/.load.stddev
>>>         2.32 =C2=B1 11%     -19.6%       1.87 =C2=B1 14%  sched_debug.c=
fs_rq:/.load_avg.avg
>>>     18373664 =C2=B1  3%     -19.7%   14762699 =C2=B1  8%  sched_debug.c=
fs_rq:/.min_vruntime.avg
>>>     18652687 =C2=B1  3%     -19.9%   14948853 =C2=B1  8%  sched_debug.c=
fs_rq:/.min_vruntime.max
>>>     17259651 =C2=B1  3%     -20.6%   13706324 =C2=B1  9%  sched_debug.c=
fs_rq:/.min_vruntime.min
>>>         0.09 =C2=B1  4%     -30.2%       0.06 =C2=B1  8%  sched_debug.c=
fs_rq:/.nr_running.avg
>>>         0.27 =C2=B1  2%     -14.3%       0.24 =C2=B1  5%  sched_debug.c=
fs_rq:/.nr_running.stddev
>>>        18.07 =C2=B1  2%     -31.0%      12.47 =C2=B1  5%  sched_debug.c=
fs_rq:/.nr_spread_over.avg
>>>         1.97 =C2=B1 34%     -49.2%       1.00 =C2=B1 57%  sched_debug.c=
fs_rq:/.nr_spread_over.min
>>>       258.66 =C2=B1  6%     -38.4%     159.22 =C2=B1  5%  sched_debug.c=
fs_rq:/.runnable_avg.avg
>>>       231.14           -13.6%     199.77 =C2=B1  7%  sched_debug.cfs_rq=
:/.runnable_avg.stddev
>>>       302282 =C2=B1 40%     -44.4%     168177 =C2=B1 29%  sched_debug.c=
fs_rq:/.spread0.avg
>>>       568464 =C2=B1 36%     -39.3%     344858 =C2=B1 16%  sched_debug.c=
fs_rq:/.spread0.max
>>>       252.26 =C2=B1  6%     -38.7%     154.72 =C2=B1  5%  sched_debug.c=
fs_rq:/.util_avg.avg
>>>       217.63           -15.4%     184.13 =C2=B1  6%  sched_debug.cfs_rq=
:/.util_avg.stddev
>>>        18.44 =C2=B1 12%     -50.3%       9.17 =C2=B1  9%  sched_debug.c=
fs_rq:/.util_est_enqueued.avg
>>>       575.84 =C2=B1 17%     -22.2%     447.81 =C2=B1 16%  sched_debug.c=
fs_rq:/.util_est_enqueued.max
>>>        67.91 =C2=B1  9%     -35.4%      43.85 =C2=B1  9%  sched_debug.c=
fs_rq:/.util_est_enqueued.stddev
>>>       417156 =C2=B1  7%     -15.2%     353896 =C2=B1  5%  sched_debug.c=
pu.avg_idle.stddev
>>>       273.72 =C2=B1  3%     -11.3%     242.79 =C2=B1  4%  sched_debug.c=
pu.clock.stddev
>>>       273.72 =C2=B1  3%     -11.3%     242.79 =C2=B1  4%  sched_debug.c=
pu.clock_task.stddev
>>>       426.78 =C2=B1  3%     -27.6%     309.10 =C2=B1 12%  sched_debug.c=
pu.curr->pid.avg
>>>         1282 =C2=B1  2%     -12.4%       1123 =C2=B1  6%  sched_debug.c=
pu.curr->pid.stddev
>>>       351857 =C2=B1  3%     -16.4%     294246 =C2=B1  4%  sched_debug.c=
pu.max_idle_balance_cost.stddev
>>>         0.00           -11.8%       0.00 =C2=B1  3%  sched_debug.cpu.ne=
xt_balance.stddev
>>>         0.09 =C2=B1  3%     -32.0%       0.06 =C2=B1 12%  sched_debug.c=
pu.nr_running.avg
>>>         0.28           -14.6%       0.24 =C2=B1  7%  sched_debug.cpu.nr=
_running.stddev
>>>       163725           +37.4%     225040 =C2=B1  4%  sched_debug.cpu.nr=
_switches.avg
>>>       174783           +35.4%     236604 =C2=B1  4%  sched_debug.cpu.nr=
_switches.max
>>>       151538           +36.4%     206743 =C2=B1  4%  sched_debug.cpu.nr=
_switches.min
>>>         2143 =C2=B1  4%     +28.5%       2753 =C2=B1  4%  sched_debug.c=
pu.nr_switches.stddev
>>>       160974           +38.1%     222280 =C2=B1  4%  sched_debug.cpu.sc=
hed_count.avg
>>>       170145           +36.7%     232581 =C2=B1  4%  sched_debug.cpu.sc=
hed_count.max
>>>       148944           +37.6%     204888 =C2=B1  4%  sched_debug.cpu.sc=
hed_count.min
>>>         1847 =C2=B1  8%     +38.7%       2563 =C2=B1  6%  sched_debug.c=
pu.sched_count.stddev
>>>        80136           +38.3%     110820 =C2=B1  4%  sched_debug.cpu.sc=
hed_goidle.avg
>>>        84559           +36.9%     115782 =C2=B1  4%  sched_debug.cpu.sc=
hed_goidle.max
>>>        74091           +37.8%     102072 =C2=B1  4%  sched_debug.cpu.sc=
hed_goidle.min
>>>       891.35 =C2=B1  6%     +41.4%       1260 =C2=B1  6%  sched_debug.c=
pu.sched_goidle.stddev
>>>        80346           +38.2%     111003 =C2=B1  4%  sched_debug.cpu.tt=
wu_count.avg
>>>       114308 =C2=B1  2%     +42.7%     163080 =C2=B1  6%  sched_debug.c=
pu.ttwu_count.max
>>>        62759 =C2=B1  3%     +38.4%      86881 =C2=B1  2%  sched_debug.c=
pu.ttwu_count.min
>>>         8223 =C2=B1  7%     +53.5%      12623 =C2=B1 13%  sched_debug.c=
pu.ttwu_count.stddev
>>>         2.35 =C2=B1 10%      -0.7        1.65 =C2=B1 14%  perf-profile.=
calltrace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.=
cpuidle_enter_state.cpuidle_enter
>>>         0.94 =C2=B1 15%      -0.5        0.44 =C2=B1 58%  perf-profile.=
calltrace.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.do_user_add=
r_fault.page_fault
>>>         0.90 =C2=B1 15%      -0.5        0.42 =C2=B1 58%  perf-profile.=
calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rws=
em_down_read_slowpath.do_user_addr_fault.page_fault
>>>         1.38 =C2=B1  4%      -0.4        0.94 =C2=B1 12%  perf-profile.=
calltrace.cycles-pp.__softirqentry_text_start.irq_exit.smp_apic_timer_inter=
rupt.apic_timer_interrupt.cpuidle_enter_state
>>>         0.81 =C2=B1  4%      +0.1        0.91 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.file_update_time.fault_dirty_shared_page.do_fault.__han=
dle_mm_fault.handle_mm_fault
>>>         1.35 =C2=B1  6%      +0.2        1.51 =C2=B1  3%  perf-profile.=
calltrace.cycles-pp.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_=
fault.__do_fault
>>>         1.16 =C2=B1  7%      +0.2        1.33 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.unlock_page.fault_dirty_shared_page.do_fault.__handle_m=
m_fault.handle_mm_fault
>>>         1.29 =C2=B1  8%      +0.2        1.46 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp._raw_spin_lock.alloc_set_pte.finish_fault.do_fault.__ha=
ndle_mm_fault
>>>         1.76 =C2=B1  7%      +0.3        2.04 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.page_add_file_rmap.alloc_set_pte.finish_fault.do_fault.=
__handle_mm_fault
>>>         2.13 =C2=B1  5%      +0.3        2.41 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.fault_dirty_shared_page.do_fault.__handle_mm_fault.hand=
le_mm_fault.do_user_addr_fault
>>>         2.46 =C2=B1  8%      +0.4        2.81 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.up_read.do_user_addr_fault.page_fault
>>>         2.86 =C2=B1  6%      +0.4        3.21 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.find_lock_entry.shmem_getpage_gfp.shmem_fault.__do_faul=
t.do_fault
>>>         3.12 =C2=B1  6%      +0.4        3.52 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.shmem_getpage_gfp.shmem_fault.__do_fault.do_fault.__han=
dle_mm_fault
>>>         3.27 =C2=B1  6%      +0.4        3.67 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.shmem_fault.__do_fault.do_fault.__handle_mm_fault.handl=
e_mm_fault
>>>         3.33 =C2=B1  6%      +0.4        3.75 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.__do_fault.do_fault.__handle_mm_fault.handle_mm_fault.d=
o_user_addr_fault
>>>         0.13 =C2=B1173%      +0.4        0.55 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>>>         3.39 =C2=B1  7%      +0.5        3.89 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.alloc_set_pte.finish_fault.do_fault.__handle_mm_fault.h=
andle_mm_fault
>>>         3.44 =C2=B1  7%      +0.5        3.94 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.finish_fault.do_fault.__handle_mm_fault.handle_mm_fault=
.do_user_addr_fault
>>>         8.99 =C2=B1  6%      +1.2       10.20 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr=
_fault.page_fault
>>>        12.23 =C2=B1  6%      +1.6       13.84 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.pa=
ge_fault
>>>        12.68 =C2=B1  6%      +1.7       14.38 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.page_fault
>>>        45.14 =C2=B1  9%      +6.1       51.25 =C2=B1  6%  perf-profile.=
calltrace.cycles-pp.down_read_trylock.do_user_addr_fault.page_fault
>>>        66.96 =C2=B1  7%      +7.4       74.37 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.do_user_addr_fault.page_fault
>>>        69.19 =C2=B1  7%      +7.7       76.89 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.page_fault
>>>        17.74 =C2=B1  8%      -3.3       14.46 =C2=B1 20%  perf-profile.=
children.cycles-pp.apic_timer_interrupt
>>>        17.02 =C2=B1  8%      -3.1       13.89 =C2=B1 20%  perf-profile.=
children.cycles-pp.smp_apic_timer_interrupt
>>>         2.97 =C2=B1  8%      -0.7        2.25 =C2=B1 12%  perf-profile.=
children.cycles-pp.irq_exit
>>>         1.88 =C2=B1 11%      -0.5        1.41 =C2=B1 11%  perf-profile.=
children.cycles-pp.__softirqentry_text_start
>>>         1.02 =C2=B1 14%      -0.4        0.59 =C2=B1 15%  perf-profile.=
children.cycles-pp.native_queued_spin_lock_slowpath
>>>         1.75 =C2=B1 12%      -0.4        1.35 =C2=B1 14%  perf-profile.=
children.cycles-pp._raw_spin_lock_irq
>>>         0.92 =C2=B1 12%      -0.2        0.68 =C2=B1 17%  perf-profile.=
children.cycles-pp.ktime_get
>>>         0.32 =C2=B1 20%      -0.2        0.13 =C2=B1 30%  perf-profile.=
children.cycles-pp.munmap
>>>         0.32 =C2=B1 22%      -0.2        0.14 =C2=B1 27%  perf-profile.=
children.cycles-pp.__x64_sys_munmap
>>>         0.32 =C2=B1 22%      -0.2        0.14 =C2=B1 28%  perf-profile.=
children.cycles-pp.__vm_munmap
>>>         0.29 =C2=B1 21%      -0.2        0.13 =C2=B1 23%  perf-profile.=
children.cycles-pp.__do_munmap
>>>         0.28 =C2=B1 21%      -0.2        0.12 =C2=B1 25%  perf-profile.=
children.cycles-pp.unmap_region
>>>         0.28 =C2=B1 22%      -0.2        0.13 =C2=B1 23%  perf-profile.=
children.cycles-pp.unmap_vmas
>>>         0.28 =C2=B1 21%      -0.2        0.13 =C2=B1 23%  perf-profile.=
children.cycles-pp.unmap_page_range
>>>         0.48 =C2=B1  6%      -0.1        0.34 =C2=B1 15%  perf-profile.=
children.cycles-pp.rebalance_domains
>>>         0.56 =C2=B1 12%      -0.1        0.43 =C2=B1 16%  perf-profile.=
children.cycles-pp._raw_spin_unlock_irqrestore
>>>         0.44 =C2=B1 11%      -0.1        0.33 =C2=B1 25%  perf-profile.=
children.cycles-pp.clockevents_program_event
>>>         0.31 =C2=B1 14%      -0.1        0.21 =C2=B1 16%  perf-profile.=
children.cycles-pp.run_rebalance_domains
>>>         0.34 =C2=B1  9%      -0.1        0.25 =C2=B1 16%  perf-profile.=
children.cycles-pp.__hrtimer_next_event_base
>>>         0.28 =C2=B1 14%      -0.1        0.21 =C2=B1 22%  perf-profile.=
children.cycles-pp.rcu_dynticks_eqs_exit
>>>         0.12 =C2=B1 21%      -0.1        0.04 =C2=B1 59%  perf-profile.=
children.cycles-pp.smp_call_function_many_cond
>>>         0.12 =C2=B1 21%      -0.1        0.04 =C2=B1 59%  perf-profile.=
children.cycles-pp.on_each_cpu_cond_mask
>>>         0.12 =C2=B1 21%      -0.1        0.05 =C2=B1 60%  perf-profile.=
children.cycles-pp.flush_tlb_mm_range
>>>         0.19 =C2=B1 16%      -0.1        0.12 =C2=B1 25%  perf-profile.=
children.cycles-pp.irq_work_tick
>>>         0.31 =C2=B1 10%      -0.1        0.24 =C2=B1 21%  perf-profile.=
children.cycles-pp.ktime_get_update_offsets_now
>>>         0.17 =C2=B1 13%      -0.0        0.12 =C2=B1 15%  perf-profile.=
children.cycles-pp.rcu_idle_exit
>>>         0.12 =C2=B1 12%      -0.0        0.08 =C2=B1 30%  perf-profile.=
children.cycles-pp.tick_nohz_irq_exit
>>>         0.14 =C2=B1  8%      -0.0        0.10 =C2=B1 12%  perf-profile.=
children.cycles-pp.raise_softirq
>>>         0.09 =C2=B1  7%      +0.0        0.11 =C2=B1  4%  perf-profile.=
children.cycles-pp._cond_resched
>>>         0.06            +0.0        0.08 =C2=B1 11%  perf-profile.child=
ren.cycles-pp.lock_page_memcg
>>>         0.15 =C2=B1  7%      +0.0        0.17 =C2=B1  2%  perf-profile.=
children.cycles-pp.__mod_memcg_state
>>>         0.07            +0.0        0.09 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.perf_swevent_event
>>>         0.18 =C2=B1  7%      +0.0        0.21 =C2=B1  4%  perf-profile.=
children.cycles-pp.current_time
>>>         0.23 =C2=B1  3%      +0.0        0.26 =C2=B1  4%  perf-profile.=
children.cycles-pp.xas_load
>>>         0.14 =C2=B1  9%      +0.0        0.18 =C2=B1  8%  perf-profile.=
children.cycles-pp.__count_memcg_events
>>>         0.46 =C2=B1  5%      +0.1        0.51 =C2=B1  4%  perf-profile.=
children.cycles-pp.__mod_lruvec_state
>>>         0.42 =C2=B1  5%      +0.1        0.48 =C2=B1  7%  perf-profile.=
children.cycles-pp.__mark_inode_dirty
>>>         0.55 =C2=B1  5%      +0.1        0.61 =C2=B1  3%  perf-profile.=
children.cycles-pp.___perf_sw_event
>>>         0.47 =C2=B1  4%      +0.1        0.55 =C2=B1  8%  perf-profile.=
children.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>>>         0.42 =C2=B1  9%      +0.1        0.50 =C2=B1  8%  perf-profile.=
children.cycles-pp.__might_sleep
>>>         0.81 =C2=B1  5%      +0.1        0.92 =C2=B1  4%  perf-profile.=
children.cycles-pp.file_update_time
>>>         1.36 =C2=B1  6%      +0.2        1.52 =C2=B1  3%  perf-profile.=
children.cycles-pp.find_get_entry
>>>         1.17 =C2=B1  7%      +0.2        1.34 =C2=B1  5%  perf-profile.=
children.cycles-pp.unlock_page
>>>         1.77 =C2=B1  7%      +0.3        2.05 =C2=B1  5%  perf-profile.=
children.cycles-pp.page_add_file_rmap
>>>         2.14 =C2=B1  5%      +0.3        2.42 =C2=B1  4%  perf-profile.=
children.cycles-pp.fault_dirty_shared_page
>>>         2.51 =C2=B1  8%      +0.4        2.86 =C2=B1  7%  perf-profile.=
children.cycles-pp.up_read
>>>         2.90 =C2=B1  6%      +0.4        3.26 =C2=B1  4%  perf-profile.=
children.cycles-pp.find_lock_entry
>>>         3.12 =C2=B1  6%      +0.4        3.52 =C2=B1  4%  perf-profile.=
children.cycles-pp.shmem_getpage_gfp
>>>         3.27 =C2=B1  6%      +0.4        3.68 =C2=B1  4%  perf-profile.=
children.cycles-pp.shmem_fault
>>>         3.33 =C2=B1  6%      +0.4        3.75 =C2=B1  3%  perf-profile.=
children.cycles-pp.__do_fault
>>>         3.45 =C2=B1  7%      +0.5        3.95 =C2=B1  5%  perf-profile.=
children.cycles-pp.finish_fault
>>>         3.42 =C2=B1  7%      +0.5        3.92 =C2=B1  5%  perf-profile.=
children.cycles-pp.alloc_set_pte
>>>         9.02 =C2=B1  6%      +1.2       10.23 =C2=B1  4%  perf-profile.=
children.cycles-pp.do_fault
>>>        12.26 =C2=B1  6%      +1.6       13.88 =C2=B1  5%  perf-profile.=
children.cycles-pp.__handle_mm_fault
>>>        12.72 =C2=B1  6%      +1.7       14.43 =C2=B1  5%  perf-profile.=
children.cycles-pp.handle_mm_fault
>>>        45.27 =C2=B1  9%      +6.1       51.39 =C2=B1  6%  perf-profile.=
children.cycles-pp.down_read_trylock
>>>        67.33 =C2=B1  7%      +7.5       74.81 =C2=B1  4%  perf-profile.=
children.cycles-pp.do_user_addr_fault
>>>        69.24 =C2=B1  7%      +7.7       76.95 =C2=B1  4%  perf-profile.=
children.cycles-pp.page_fault
>>>         1.02 =C2=B1 14%      -0.4        0.59 =C2=B1 15%  perf-profile.=
self.cycles-pp.native_queued_spin_lock_slowpath
>>>         0.74 =C2=B1 13%      -0.2        0.55 =C2=B1 18%  perf-profile.=
self.cycles-pp.ktime_get
>>>         0.28 =C2=B1 10%      -0.1        0.21 =C2=B1 17%  perf-profile.=
self.cycles-pp.__hrtimer_next_event_base
>>>         0.28 =C2=B1 13%      -0.1        0.20 =C2=B1 21%  perf-profile.=
self.cycles-pp.rcu_dynticks_eqs_exit
>>>         0.19 =C2=B1 16%      -0.1        0.12 =C2=B1 25%  perf-profile.=
self.cycles-pp.irq_work_tick
>>>         0.26 =C2=B1  7%      -0.1        0.21 =C2=B1 12%  perf-profile.=
self.cycles-pp.__softirqentry_text_start
>>>         0.20 =C2=B1 15%      -0.0        0.16 =C2=B1 11%  perf-profile.=
self.cycles-pp.__run_timers
>>>         0.14 =C2=B1  7%      -0.0        0.10 =C2=B1 12%  perf-profile.=
self.cycles-pp.raise_softirq
>>>         0.13 =C2=B1  9%      -0.0        0.10 =C2=B1 15%  perf-profile.=
self.cycles-pp.tick_sched_timer
>>>         0.07 =C2=B1 10%      -0.0        0.04 =C2=B1 58%  perf-profile.=
self.cycles-pp.clockevents_program_event
>>>         0.09 =C2=B1  5%      -0.0        0.07 =C2=B1 17%  perf-profile.=
self.cycles-pp.apic_timer_interrupt
>>>         0.05 =C2=B1  8%      +0.0        0.07 =C2=B1 12%  perf-profile.=
self.cycles-pp.lock_page_memcg
>>>         0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.=
self.cycles-pp.file_update_time
>>>         0.10 =C2=B1  7%      +0.0        0.12 =C2=B1  7%  perf-profile.=
self.cycles-pp.___might_sleep
>>>         0.06 =C2=B1  6%      +0.0        0.08 =C2=B1  5%  perf-profile.=
self.cycles-pp.perf_swevent_event
>>>         0.18 =C2=B1  8%      +0.0        0.20 =C2=B1  6%  perf-profile.=
self.cycles-pp.__mod_lruvec_state
>>>         0.13 =C2=B1  9%      +0.0        0.15 =C2=B1  3%  perf-profile.=
self.cycles-pp.__mod_memcg_state
>>>         0.24 =C2=B1  6%      +0.0        0.27 =C2=B1  6%  perf-profile.=
self.cycles-pp.handle_mm_fault
>>>         0.41 =C2=B1  4%      +0.0        0.44 =C2=B1  3%  perf-profile.=
self.cycles-pp.___perf_sw_event
>>>         0.14 =C2=B1  9%      +0.0        0.17 =C2=B1  6%  perf-profile.=
self.cycles-pp.__count_memcg_events
>>>         0.21 =C2=B1  6%      +0.0        0.25 =C2=B1  4%  perf-profile.=
self.cycles-pp.shmem_getpage_gfp
>>>         0.23 =C2=B1 10%      +0.1        0.29 =C2=B1 13%  perf-profile.=
self.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>>>         1.02 =C2=B1  6%      +0.1        1.13 =C2=B1  6%  perf-profile.=
self.cycles-pp.find_get_entry
>>>         0.86 =C2=B1  4%      +0.1        1.00 =C2=B1  6%  perf-profile.=
self.cycles-pp.do_user_addr_fault
>>>         1.10 =C2=B1  6%      +0.2        1.26 =C2=B1  7%  perf-profile.=
self.cycles-pp.unlock_page
>>>         1.26 =C2=B1  7%      +0.2        1.44 =C2=B1  8%  perf-profile.=
self.cycles-pp.find_lock_entry
>>>         1.20 =C2=B1  6%      +0.2        1.38 =C2=B1  8%  perf-profile.=
self.cycles-pp.page_add_file_rmap
>>>         2.35 =C2=B1  7%      +0.3        2.69 =C2=B1  8%  perf-profile.=
self.cycles-pp.up_read
>>>         2.97 =C2=B1  6%      +0.4        3.35 =C2=B1  8%  perf-profile.=
self.cycles-pp.__handle_mm_fault
>>>        42.09 =C2=B1  8%      +5.7       47.79 =C2=B1  8%  perf-profile.=
self.cycles-pp.down_read_trylock
>>>       406.00 =C2=B1 37%   +1859.5%       7955 =C2=B1151%  interrupts.32=
:IR-PCI-MSI.2097155-edge.eth0-TxRx-2
>>>      3009113            -4.3%    2880393 =C2=B1  2%  interrupts.CAL:Fun=
ction_call_interrupts
>>>         1445 =C2=B1 50%     +93.0%       2788 =C2=B1  9%  interrupts.CP=
U0.NMI:Non-maskable_interrupts
>>>         1445 =C2=B1 50%     +93.0%       2788 =C2=B1  9%  interrupts.CP=
U0.PMI:Performance_monitoring_interrupts
>>>       939.50 =C2=B1 16%     +23.2%       1157 =C2=B1  5%  interrupts.CP=
U100.RES:Rescheduling_interrupts
>>>         1223 =C2=B1 11%     +43.3%       1753 =C2=B1 23%  interrupts.CP=
U103.NMI:Non-maskable_interrupts
>>>         1223 =C2=B1 11%     +43.3%       1753 =C2=B1 23%  interrupts.CP=
U103.PMI:Performance_monitoring_interrupts
>>>         1163 =C2=B1  6%     +24.5%       1448 =C2=B1  6%  interrupts.CP=
U104.RES:Rescheduling_interrupts
>>>         1062 =C2=B1 15%     +40.5%       1493 =C2=B1  5%  interrupts.CP=
U105.RES:Rescheduling_interrupts
>>>         1490 =C2=B1 28%     +70.1%       2536 =C2=B1 20%  interrupts.CP=
U106.NMI:Non-maskable_interrupts
>>>         1490 =C2=B1 28%     +70.1%       2536 =C2=B1 20%  interrupts.CP=
U106.PMI:Performance_monitoring_interrupts
>>>         1186 =C2=B1  3%     +26.4%       1499 =C2=B1 11%  interrupts.CP=
U106.RES:Rescheduling_interrupts
>>>         1186 =C2=B1  5%     +36.5%       1618 =C2=B1  9%  interrupts.CP=
U107.RES:Rescheduling_interrupts
>>>         1484 =C2=B1 29%     +98.1%       2941 =C2=B1  9%  interrupts.CP=
U108.NMI:Non-maskable_interrupts
>>>         1484 =C2=B1 29%     +98.1%       2941 =C2=B1  9%  interrupts.CP=
U108.PMI:Performance_monitoring_interrupts
>>>         1087 =C2=B1 11%     +35.2%       1470 =C2=B1 11%  interrupts.CP=
U108.RES:Rescheduling_interrupts
>>>       905.00 =C2=B1 14%     +26.9%       1148 =C2=B1  8%  interrupts.CP=
U109.RES:Rescheduling_interrupts
>>>         1534 =C2=B1 35%     +91.6%       2939 =C2=B1  9%  interrupts.CP=
U110.NMI:Non-maskable_interrupts
>>>         1534 =C2=B1 35%     +91.6%       2939 =C2=B1  9%  interrupts.CP=
U110.PMI:Performance_monitoring_interrupts
>>>         1222 =C2=B1 11%     +54.3%       1885 =C2=B1 44%  interrupts.CP=
U111.NMI:Non-maskable_interrupts
>>>         1222 =C2=B1 11%     +54.3%       1885 =C2=B1 44%  interrupts.CP=
U111.PMI:Performance_monitoring_interrupts
>>>         1066           +27.7%       1360 =C2=B1  5%  interrupts.CPU111.=
RES:Rescheduling_interrupts
>>>         1214 =C2=B1 12%     +51.1%       1833 =C2=B1 35%  interrupts.CP=
U112.NMI:Non-maskable_interrupts
>>>         1214 =C2=B1 12%     +51.1%       1833 =C2=B1 35%  interrupts.CP=
U112.PMI:Performance_monitoring_interrupts
>>>         1206 =C2=B1 12%     +30.8%       1577 =C2=B1  9%  interrupts.CP=
U116.RES:Rescheduling_interrupts
>>>         1102 =C2=B1 10%     +46.7%       1616 =C2=B1 11%  interrupts.CP=
U117.RES:Rescheduling_interrupts
>>>         1211 =C2=B1  3%     +35.2%       1638 =C2=B1 15%  interrupts.CP=
U118.RES:Rescheduling_interrupts
>>>         1217 =C2=B1 11%    +115.4%       2623 =C2=B1 29%  interrupts.CP=
U119.NMI:Non-maskable_interrupts
>>>         1217 =C2=B1 11%    +115.4%       2623 =C2=B1 29%  interrupts.CP=
U119.PMI:Performance_monitoring_interrupts
>>>       406.00 =C2=B1 37%   +1859.5%       7955 =C2=B1151%  interrupts.CP=
U12.32:IR-PCI-MSI.2097155-edge.eth0-TxRx-2
>>>         1125 =C2=B1 12%     +27.3%       1432 =C2=B1 10%  interrupts.CP=
U12.NMI:Non-maskable_interrupts
>>>         1125 =C2=B1 12%     +27.3%       1432 =C2=B1 10%  interrupts.CP=
U12.PMI:Performance_monitoring_interrupts
>>>         1173 =C2=B1 12%     +55.5%       1823 =C2=B1 35%  interrupts.CP=
U120.NMI:Non-maskable_interrupts
>>>         1173 =C2=B1 12%     +55.5%       1823 =C2=B1 35%  interrupts.CP=
U120.PMI:Performance_monitoring_interrupts
>>>         1112 =C2=B1  5%     +40.2%       1559 =C2=B1  6%  interrupts.CP=
U121.RES:Rescheduling_interrupts
>>>         1227 =C2=B1 11%     +50.5%       1846 =C2=B1 34%  interrupts.CP=
U122.NMI:Non-maskable_interrupts
>>>         1227 =C2=B1 11%     +50.5%       1846 =C2=B1 34%  interrupts.CP=
U122.PMI:Performance_monitoring_interrupts
>>>         1036 =C2=B1 11%     +36.6%       1416 =C2=B1  4%  interrupts.CP=
U122.RES:Rescheduling_interrupts
>>>         1164 =C2=B1 22%     +40.8%       1639 =C2=B1 16%  interrupts.CP=
U123.RES:Rescheduling_interrupts
>>>         1419 =C2=B1 13%     +20.7%       1712 =C2=B1  9%  interrupts.CP=
U124.RES:Rescheduling_interrupts
>>>         1209 =C2=B1 11%     +21.5%       1469 =C2=B1  9%  interrupts.CP=
U126.NMI:Non-maskable_interrupts
>>>         1209 =C2=B1 11%     +21.5%       1469 =C2=B1  9%  interrupts.CP=
U126.PMI:Performance_monitoring_interrupts
>>>         1266 =C2=B1 16%     +34.9%       1708 =C2=B1 13%  interrupts.CP=
U126.RES:Rescheduling_interrupts
>>>         1207 =C2=B1 24%     +36.5%       1648 =C2=B1 11%  interrupts.CP=
U127.RES:Rescheduling_interrupts
>>>         1298 =C2=B1 12%     +30.8%       1698        interrupts.CPU128.=
RES:Rescheduling_interrupts
>>>         1354 =C2=B1  7%     +33.5%       1808 =C2=B1  9%  interrupts.CP=
U129.RES:Rescheduling_interrupts
>>>         1046 =C2=B1  7%     +42.3%       1488 =C2=B1 17%  interrupts.CP=
U130.RES:Rescheduling_interrupts
>>>         1068 =C2=B1  6%     +45.9%       1558 =C2=B1 13%  interrupts.CP=
U131.RES:Rescheduling_interrupts
>>>         1200 =C2=B1  2%     +41.7%       1701 =C2=B1 14%  interrupts.CP=
U132.RES:Rescheduling_interrupts
>>>         1191 =C2=B1 11%     +85.4%       2208 =C2=B1 39%  interrupts.CP=
U133.NMI:Non-maskable_interrupts
>>>         1191 =C2=B1 11%     +85.4%       2208 =C2=B1 39%  interrupts.CP=
U133.PMI:Performance_monitoring_interrupts
>>>         1327 =C2=B1  9%     +13.8%       1510 =C2=B1  4%  interrupts.CP=
U134.RES:Rescheduling_interrupts
>>>         1203 =C2=B1 12%     +52.8%       1837 =C2=B1 34%  interrupts.CP=
U136.NMI:Non-maskable_interrupts
>>>         1203 =C2=B1 12%     +52.8%       1837 =C2=B1 34%  interrupts.CP=
U136.PMI:Performance_monitoring_interrupts
>>>       976.75 =C2=B1  8%     +19.0%       1162 =C2=B1  8%  interrupts.CP=
U136.RES:Rescheduling_interrupts
>>>         1438 =C2=B1 34%     +75.9%       2530 =C2=B1 27%  interrupts.CP=
U137.NMI:Non-maskable_interrupts
>>>         1438 =C2=B1 34%     +75.9%       2530 =C2=B1 27%  interrupts.CP=
U137.PMI:Performance_monitoring_interrupts
>>>       950.75 =C2=B1  5%     +33.1%       1265 =C2=B1 14%  interrupts.CP=
U139.RES:Rescheduling_interrupts
>>>         1054 =C2=B1  6%     +26.9%       1338 =C2=B1  8%  interrupts.CP=
U140.RES:Rescheduling_interrupts
>>>        10703 =C2=B1  3%      -8.0%       9849 =C2=B1  4%  interrupts.CP=
U140.TLB:TLB_shootdowns
>>>         1509 =C2=B1 29%     +71.5%       2589 =C2=B1 27%  interrupts.CP=
U141.NMI:Non-maskable_interrupts
>>>         1509 =C2=B1 29%     +71.5%       2589 =C2=B1 27%  interrupts.CP=
U141.PMI:Performance_monitoring_interrupts
>>>         1334 =C2=B1  7%     +14.9%       1533 =C2=B1  8%  interrupts.CP=
U141.RES:Rescheduling_interrupts
>>>         1505 =C2=B1 36%     +71.7%       2585 =C2=B1 27%  interrupts.CP=
U142.NMI:Non-maskable_interrupts
>>>         1505 =C2=B1 36%     +71.7%       2585 =C2=B1 27%  interrupts.CP=
U142.PMI:Performance_monitoring_interrupts
>>>         1206 =C2=B1  7%     +32.3%       1596 =C2=B1 13%  interrupts.CP=
U142.RES:Rescheduling_interrupts
>>>         1218 =C2=B1 11%     +55.0%       1888 =C2=B1 44%  interrupts.CP=
U143.NMI:Non-maskable_interrupts
>>>         1218 =C2=B1 11%     +55.0%       1888 =C2=B1 44%  interrupts.CP=
U143.PMI:Performance_monitoring_interrupts
>>>         1883 =C2=B1  5%     +37.7%       2594 =C2=B1 12%  interrupts.CP=
U143.RES:Rescheduling_interrupts
>>>         1211 =C2=B1 11%     +51.1%       1831 =C2=B1 35%  interrupts.CP=
U144.NMI:Non-maskable_interrupts
>>>         1211 =C2=B1 11%     +51.1%       1831 =C2=B1 35%  interrupts.CP=
U144.PMI:Performance_monitoring_interrupts
>>>         1266 =C2=B1 15%     +43.3%       1815 =C2=B1  7%  interrupts.CP=
U144.RES:Rescheduling_interrupts
>>>         1226 =C2=B1 11%    +109.7%       2572 =C2=B1 27%  interrupts.CP=
U145.NMI:Non-maskable_interrupts
>>>         1226 =C2=B1 11%    +109.7%       2572 =C2=B1 27%  interrupts.CP=
U145.PMI:Performance_monitoring_interrupts
>>>         1370 =C2=B1 27%     +54.3%       2114 =C2=B1 35%  interrupts.CP=
U15.NMI:Non-maskable_interrupts
>>>         1370 =C2=B1 27%     +54.3%       2114 =C2=B1 35%  interrupts.CP=
U15.PMI:Performance_monitoring_interrupts
>>>       685.25 =C2=B1  6%     +33.2%     913.00 =C2=B1  9%  interrupts.CP=
U15.RES:Rescheduling_interrupts
>>>         1197 =C2=B1 11%     +84.2%       2206 =C2=B1 39%  interrupts.CP=
U150.NMI:Non-maskable_interrupts
>>>         1197 =C2=B1 11%     +84.2%       2206 =C2=B1 39%  interrupts.CP=
U150.PMI:Performance_monitoring_interrupts
>>>         1097 =C2=B1  9%     +33.0%       1459 =C2=B1 13%  interrupts.CP=
U152.RES:Rescheduling_interrupts
>>>         1263 =C2=B1  7%     +31.8%       1665 =C2=B1  8%  interrupts.CP=
U154.RES:Rescheduling_interrupts
>>>         1215 =C2=B1 12%     +49.4%       1815 =C2=B1 33%  interrupts.CP=
U155.NMI:Non-maskable_interrupts
>>>         1215 =C2=B1 12%     +49.4%       1815 =C2=B1 33%  interrupts.CP=
U155.PMI:Performance_monitoring_interrupts
>>>         1222 =C2=B1  5%     +29.1%       1578 =C2=B1  9%  interrupts.CP=
U155.RES:Rescheduling_interrupts
>>>         1065 =C2=B1  9%     +30.1%       1386 =C2=B1 13%  interrupts.CP=
U156.RES:Rescheduling_interrupts
>>>         1017 =C2=B1 13%     +23.8%       1259 =C2=B1  7%  interrupts.CP=
U157.RES:Rescheduling_interrupts
>>>         1055 =C2=B1 11%     +28.5%       1356 =C2=B1 11%  interrupts.CP=
U158.RES:Rescheduling_interrupts
>>>         1016 =C2=B1  9%     +39.7%       1420 =C2=B1 13%  interrupts.CP=
U159.RES:Rescheduling_interrupts
>>>         1084 =C2=B1  2%     +24.3%       1347 =C2=B1 13%  interrupts.CP=
U161.RES:Rescheduling_interrupts
>>>       918.75 =C2=B1 13%     +20.4%       1106 =C2=B1 11%  interrupts.CP=
U162.RES:Rescheduling_interrupts
>>>        10725            -8.9%       9774 =C2=B1  2%  interrupts.CPU162.=
TLB:TLB_shootdowns
>>>       959.75 =C2=B1  9%     +24.8%       1197 =C2=B1 11%  interrupts.CP=
U163.RES:Rescheduling_interrupts
>>>         1177 =C2=B1  8%     +36.8%       1610 =C2=B1 15%  interrupts.CP=
U167.RES:Rescheduling_interrupts
>>>         1211 =C2=B1 12%     +84.4%       2233 =C2=B1 39%  interrupts.CP=
U168.NMI:Non-maskable_interrupts
>>>         1211 =C2=B1 12%     +84.4%       2233 =C2=B1 39%  interrupts.CP=
U168.PMI:Performance_monitoring_interrupts
>>>         1220 =C2=B1 12%     +22.2%       1491 =C2=B1  8%  interrupts.CP=
U169.RES:Rescheduling_interrupts
>>>       711.00 =C2=B1  6%     +33.3%     948.00 =C2=B1 13%  interrupts.CP=
U17.RES:Rescheduling_interrupts
>>>         1254 =C2=B1  8%     +32.6%       1663 =C2=B1 18%  interrupts.CP=
U170.RES:Rescheduling_interrupts
>>>         1149 =C2=B1 10%     +46.0%       1677 =C2=B1 11%  interrupts.CP=
U171.RES:Rescheduling_interrupts
>>>         1578 =C2=B1 49%     +41.6%       2234 =C2=B1 40%  interrupts.CP=
U173.NMI:Non-maskable_interrupts
>>>         1578 =C2=B1 49%     +41.6%       2234 =C2=B1 40%  interrupts.CP=
U173.PMI:Performance_monitoring_interrupts
>>>         1242 =C2=B1  9%     +17.3%       1456 =C2=B1  9%  interrupts.CP=
U174.NMI:Non-maskable_interrupts
>>>         1242 =C2=B1  9%     +17.3%       1456 =C2=B1  9%  interrupts.CP=
U174.PMI:Performance_monitoring_interrupts
>>>         1008 =C2=B1  7%     +26.7%       1278        interrupts.CPU176.=
RES:Rescheduling_interrupts
>>>         1015 =C2=B1  4%     +33.9%       1360 =C2=B1  8%  interrupts.CP=
U177.RES:Rescheduling_interrupts
>>>       929.50 =C2=B1 13%     +27.4%       1183 =C2=B1  6%  interrupts.CP=
U178.RES:Rescheduling_interrupts
>>>         1051 =C2=B1  8%     +20.7%       1268        interrupts.CPU179.=
RES:Rescheduling_interrupts
>>>         1149 =C2=B1 13%     +87.3%       2153 =C2=B1 34%  interrupts.CP=
U18.NMI:Non-maskable_interrupts
>>>         1149 =C2=B1 13%     +87.3%       2153 =C2=B1 34%  interrupts.CP=
U18.PMI:Performance_monitoring_interrupts
>>>       832.75 =C2=B1  4%     +23.5%       1028        interrupts.CPU18.R=
ES:Rescheduling_interrupts
>>>         1215 =C2=B1 11%     +21.9%       1481 =C2=B1  9%  interrupts.CP=
U180.NMI:Non-maskable_interrupts
>>>         1215 =C2=B1 11%     +21.9%       1481 =C2=B1  9%  interrupts.CP=
U180.PMI:Performance_monitoring_interrupts
>>>         1050 =C2=B1 15%     +39.3%       1463 =C2=B1  6%  interrupts.CP=
U181.RES:Rescheduling_interrupts
>>>         1093 =C2=B1  5%     +28.7%       1407 =C2=B1 11%  interrupts.CP=
U182.RES:Rescheduling_interrupts
>>>         1082 =C2=B1  5%     +27.6%       1381 =C2=B1  3%  interrupts.CP=
U183.RES:Rescheduling_interrupts
>>>       990.50 =C2=B1 10%     +28.1%       1269 =C2=B1  8%  interrupts.CP=
U184.RES:Rescheduling_interrupts
>>>       964.00 =C2=B1 13%     +28.2%       1235 =C2=B1  8%  interrupts.CP=
U186.RES:Rescheduling_interrupts
>>>         1498 =C2=B1 29%     +68.5%       2524 =C2=B1 19%  interrupts.CP=
U187.NMI:Non-maskable_interrupts
>>>         1498 =C2=B1 29%     +68.5%       2524 =C2=B1 19%  interrupts.CP=
U187.PMI:Performance_monitoring_interrupts
>>>         1084 =C2=B1 11%     +35.9%       1473 =C2=B1  9%  interrupts.CP=
U188.RES:Rescheduling_interrupts
>>>         1537 =C2=B1 34%     +68.0%       2582 =C2=B1 26%  interrupts.CP=
U190.NMI:Non-maskable_interrupts
>>>         1537 =C2=B1 34%     +68.0%       2582 =C2=B1 26%  interrupts.CP=
U190.PMI:Performance_monitoring_interrupts
>>>         1247 =C2=B1  2%     +32.7%       1655 =C2=B1  5%  interrupts.CP=
U190.RES:Rescheduling_interrupts
>>>         1292 =C2=B1 11%     +26.0%       1628 =C2=B1  6%  interrupts.CP=
U191.RES:Rescheduling_interrupts
>>>         1223 =C2=B1 13%     +50.2%       1837 =C2=B1 33%  interrupts.CP=
U192.NMI:Non-maskable_interrupts
>>>         1223 =C2=B1 13%     +50.2%       1837 =C2=B1 33%  interrupts.CP=
U192.PMI:Performance_monitoring_interrupts
>>>         1263 =C2=B1  8%     +30.8%       1651 =C2=B1  8%  interrupts.CP=
U193.RES:Rescheduling_interrupts
>>>         1369 =C2=B1  8%     +25.9%       1724 =C2=B1 13%  interrupts.CP=
U196.RES:Rescheduling_interrupts
>>>         1127 =C2=B1  9%     +27.5%       1437 =C2=B1  6%  interrupts.CP=
U197.RES:Rescheduling_interrupts
>>>         1134 =C2=B1 10%     +25.8%       1427 =C2=B1 19%  interrupts.CP=
U198.RES:Rescheduling_interrupts
>>>         1205 =C2=B1 12%     +47.0%       1772 =C2=B1 24%  interrupts.CP=
U199.NMI:Non-maskable_interrupts
>>>         1205 =C2=B1 12%     +47.0%       1772 =C2=B1 24%  interrupts.CP=
U199.PMI:Performance_monitoring_interrupts
>>>         1160 =C2=B1 12%    +117.2%       2520 =C2=B1 25%  interrupts.CP=
U2.NMI:Non-maskable_interrupts
>>>         1160 =C2=B1 12%    +117.2%       2520 =C2=B1 25%  interrupts.CP=
U2.PMI:Performance_monitoring_interrupts
>>>         1408 =C2=B1 27%     +77.7%       2502 =C2=B1 27%  interrupts.CP=
U20.NMI:Non-maskable_interrupts
>>>         1408 =C2=B1 27%     +77.7%       2502 =C2=B1 27%  interrupts.CP=
U20.PMI:Performance_monitoring_interrupts
>>>         1077 =C2=B1 13%     +28.2%       1381 =C2=B1  9%  interrupts.CP=
U202.RES:Rescheduling_interrupts
>>>         1512 =C2=B1 36%     +41.9%       2147 =C2=B1 26%  interrupts.CP=
U203.NMI:Non-maskable_interrupts
>>>         1512 =C2=B1 36%     +41.9%       2147 =C2=B1 26%  interrupts.CP=
U203.PMI:Performance_monitoring_interrupts
>>>         1052 =C2=B1  5%     +35.0%       1420 =C2=B1 20%  interrupts.CP=
U203.RES:Rescheduling_interrupts
>>>         1001 =C2=B1  3%     +41.0%       1411 =C2=B1 19%  interrupts.CP=
U204.RES:Rescheduling_interrupts
>>>         1140 =C2=B1  4%     +31.4%       1498 =C2=B1  7%  interrupts.CP=
U206.RES:Rescheduling_interrupts
>>>         1288 =C2=B1  5%     +27.6%       1643 =C2=B1  3%  interrupts.CP=
U208.RES:Rescheduling_interrupts
>>>         1131 =C2=B1 13%     +60.9%       1821 =C2=B1 44%  interrupts.CP=
U21.NMI:Non-maskable_interrupts
>>>         1131 =C2=B1 13%     +60.9%       1821 =C2=B1 44%  interrupts.CP=
U21.PMI:Performance_monitoring_interrupts
>>>         1126 =C2=B1  2%     +29.1%       1454 =C2=B1 13%  interrupts.CP=
U210.RES:Rescheduling_interrupts
>>>        10556 =C2=B1  3%      -8.9%       9618 =C2=B1  2%  interrupts.CP=
U210.TLB:TLB_shootdowns
>>>         1042 =C2=B1 12%     +42.8%       1489 =C2=B1  9%  interrupts.CP=
U211.RES:Rescheduling_interrupts
>>>         1156 =C2=B1 10%     +18.5%       1371 =C2=B1  9%  interrupts.CP=
U212.RES:Rescheduling_interrupts
>>>         1336 =C2=B1  4%     +13.8%       1520 =C2=B1  5%  interrupts.CP=
U213.RES:Rescheduling_interrupts
>>>         1201 =C2=B1  5%     +23.0%       1477 =C2=B1  8%  interrupts.CP=
U214.RES:Rescheduling_interrupts
>>>         1622 =C2=B1  6%     +36.7%       2219 =C2=B1 17%  interrupts.CP=
U215.RES:Rescheduling_interrupts
>>>         1178 =C2=B1 16%     +30.5%       1538 =C2=B1  6%  interrupts.CP=
U216.RES:Rescheduling_interrupts
>>>         1006 =C2=B1 13%     +48.5%       1494 =C2=B1  7%  interrupts.CP=
U217.RES:Rescheduling_interrupts
>>>         1603 =C2=B1 48%     +40.3%       2248 =C2=B1 38%  interrupts.CP=
U218.NMI:Non-maskable_interrupts
>>>         1603 =C2=B1 48%     +40.3%       2248 =C2=B1 38%  interrupts.CP=
U218.PMI:Performance_monitoring_interrupts
>>>         1235 =C2=B1  9%     +36.4%       1684 =C2=B1  6%  interrupts.CP=
U218.RES:Rescheduling_interrupts
>>>         1219 =C2=B1 13%     +29.3%       1576 =C2=B1  8%  interrupts.CP=
U219.RES:Rescheduling_interrupts
>>>         1153 =C2=B1 12%    +145.2%       2828 =C2=B1 10%  interrupts.CP=
U22.NMI:Non-maskable_interrupts
>>>         1153 =C2=B1 12%    +145.2%       2828 =C2=B1 10%  interrupts.CP=
U22.PMI:Performance_monitoring_interrupts
>>>       849.50 =C2=B1  4%     +25.5%       1066 =C2=B1  6%  interrupts.CP=
U22.RES:Rescheduling_interrupts
>>>         1209 =C2=B1 12%     +84.1%       2226 =C2=B1 40%  interrupts.CP=
U220.NMI:Non-maskable_interrupts
>>>         1209 =C2=B1 12%     +84.1%       2226 =C2=B1 40%  interrupts.CP=
U220.PMI:Performance_monitoring_interrupts
>>>         1037 =C2=B1 10%     +14.3%       1186 =C2=B1  3%  interrupts.CP=
U220.RES:Rescheduling_interrupts
>>>         1092 =C2=B1  8%     +31.8%       1440 =C2=B1 14%  interrupts.CP=
U221.RES:Rescheduling_interrupts
>>>         1112 =C2=B1 13%     +28.8%       1433 =C2=B1  9%  interrupts.CP=
U222.RES:Rescheduling_interrupts
>>>         1220 =C2=B1  9%     +32.8%       1620 =C2=B1  7%  interrupts.CP=
U223.RES:Rescheduling_interrupts
>>>         1515 =C2=B1 34%     +42.5%       2159 =C2=B1 28%  interrupts.CP=
U226.NMI:Non-maskable_interrupts
>>>         1515 =C2=B1 34%     +42.5%       2159 =C2=B1 28%  interrupts.CP=
U226.PMI:Performance_monitoring_interrupts
>>>         1083 =C2=B1  8%     +33.0%       1441 =C2=B1 13%  interrupts.CP=
U226.RES:Rescheduling_interrupts
>>>       956.50 =C2=B1 11%     +23.7%       1183 =C2=B1  8%  interrupts.CP=
U227.RES:Rescheduling_interrupts
>>>         1180 =C2=B1  3%     +38.2%       1631 =C2=B1 18%  interrupts.CP=
U228.RES:Rescheduling_interrupts
>>>         1223 =C2=B1 11%     +20.1%       1468 =C2=B1  9%  interrupts.CP=
U229.NMI:Non-maskable_interrupts
>>>         1223 =C2=B1 11%     +20.1%       1468 =C2=B1  9%  interrupts.CP=
U229.PMI:Performance_monitoring_interrupts
>>>         1149 =C2=B1 12%     +58.3%       1819 =C2=B1 44%  interrupts.CP=
U23.NMI:Non-maskable_interrupts
>>>         1149 =C2=B1 12%     +58.3%       1819 =C2=B1 44%  interrupts.CP=
U23.PMI:Performance_monitoring_interrupts
>>>       726.75 =C2=B1  4%     +32.6%     963.50 =C2=B1  6%  interrupts.CP=
U23.RES:Rescheduling_interrupts
>>>         1013 =C2=B1  7%     +35.2%       1370 =C2=B1 14%  interrupts.CP=
U230.RES:Rescheduling_interrupts
>>>         1004 =C2=B1  5%     +29.5%       1300 =C2=B1  8%  interrupts.CP=
U231.RES:Rescheduling_interrupts
>>>         1213 =C2=B1 13%    +141.5%       2929 =C2=B1  9%  interrupts.CP=
U233.NMI:Non-maskable_interrupts
>>>         1213 =C2=B1 13%    +141.5%       2929 =C2=B1  9%  interrupts.CP=
U233.PMI:Performance_monitoring_interrupts
>>>         1013 =C2=B1  9%     +22.5%       1241 =C2=B1  8%  interrupts.CP=
U233.RES:Rescheduling_interrupts
>>>         1177 =C2=B1 13%     +80.2%       2121 =C2=B1 29%  interrupts.CP=
U234.NMI:Non-maskable_interrupts
>>>         1177 =C2=B1 13%     +80.2%       2121 =C2=B1 29%  interrupts.CP=
U234.PMI:Performance_monitoring_interrupts
>>>         1515 =C2=B1 35%     +68.0%       2545 =C2=B1 26%  interrupts.CP=
U237.NMI:Non-maskable_interrupts
>>>         1515 =C2=B1 35%     +68.0%       2545 =C2=B1 26%  interrupts.CP=
U237.PMI:Performance_monitoring_interrupts
>>>         1770 =C2=B1 29%     +64.4%       2910 =C2=B1 10%  interrupts.CP=
U238.NMI:Non-maskable_interrupts
>>>         1770 =C2=B1 29%     +64.4%       2910 =C2=B1 10%  interrupts.CP=
U238.PMI:Performance_monitoring_interrupts
>>>         1000 =C2=B1 10%     +23.4%       1233 =C2=B1  3%  interrupts.CP=
U238.RES:Rescheduling_interrupts
>>>         1178 =C2=B1  6%     +23.5%       1456 =C2=B1  8%  interrupts.CP=
U239.RES:Rescheduling_interrupts
>>>         1151 =C2=B1 14%    +115.7%       2483 =C2=B1 27%  interrupts.CP=
U24.NMI:Non-maskable_interrupts
>>>         1151 =C2=B1 14%    +115.7%       2483 =C2=B1 27%  interrupts.CP=
U24.PMI:Performance_monitoring_interrupts
>>>       823.00 =C2=B1  9%     +51.7%       1248 =C2=B1 19%  interrupts.CP=
U24.RES:Rescheduling_interrupts
>>>         1217 =C2=B1 15%     +22.9%       1496 =C2=B1  8%  interrupts.CP=
U240.RES:Rescheduling_interrupts
>>>         1014 =C2=B1  4%     +54.4%       1565 =C2=B1 20%  interrupts.CP=
U242.RES:Rescheduling_interrupts
>>>        10616 =C2=B1  3%      -8.3%       9731        interrupts.CPU242.=
TLB:TLB_shootdowns
>>>         1043 =C2=B1 11%     +36.3%       1422 =C2=B1 16%  interrupts.CP=
U243.RES:Rescheduling_interrupts
>>>         1215 =C2=B1 11%     +83.3%       2227 =C2=B1 40%  interrupts.CP=
U247.NMI:Non-maskable_interrupts
>>>         1215 =C2=B1 11%     +83.3%       2227 =C2=B1 40%  interrupts.CP=
U247.PMI:Performance_monitoring_interrupts
>>>         1499 =C2=B1 34%     +68.8%       2531 =C2=B1 20%  interrupts.CP=
U248.NMI:Non-maskable_interrupts
>>>         1499 =C2=B1 34%     +68.8%       2531 =C2=B1 20%  interrupts.CP=
U248.PMI:Performance_monitoring_interrupts
>>>         1034 =C2=B1  5%     +28.3%       1327 =C2=B1 15%  interrupts.CP=
U248.RES:Rescheduling_interrupts
>>>         1103 =C2=B1 14%     +25.1%       1380 =C2=B1  8%  interrupts.CP=
U249.RES:Rescheduling_interrupts
>>>         1143 =C2=B1 13%     +49.8%       1712 =C2=B1 24%  interrupts.CP=
U25.NMI:Non-maskable_interrupts
>>>         1143 =C2=B1 13%     +49.8%       1712 =C2=B1 24%  interrupts.CP=
U25.PMI:Performance_monitoring_interrupts
>>>       749.50 =C2=B1  9%     +24.9%     936.25 =C2=B1  4%  interrupts.CP=
U25.RES:Rescheduling_interrupts
>>>        10842 =C2=B1  2%      -8.8%       9885 =C2=B1  2%  interrupts.CP=
U25.TLB:TLB_shootdowns
>>>         1099 =C2=B1  5%     +18.0%       1297 =C2=B1  3%  interrupts.CP=
U251.RES:Rescheduling_interrupts
>>>       993.25 =C2=B1 11%     +23.1%       1223 =C2=B1  5%  interrupts.CP=
U252.RES:Rescheduling_interrupts
>>>         1017 =C2=B1 12%     +34.7%       1369 =C2=B1 11%  interrupts.CP=
U253.RES:Rescheduling_interrupts
>>>         1532 =C2=B1 49%     +44.3%       2211 =C2=B1 39%  interrupts.CP=
U254.NMI:Non-maskable_interrupts
>>>         1532 =C2=B1 49%     +44.3%       2211 =C2=B1 39%  interrupts.CP=
U254.PMI:Performance_monitoring_interrupts
>>>       979.50 =C2=B1 10%     +29.8%       1271 =C2=B1 10%  interrupts.CP=
U254.RES:Rescheduling_interrupts
>>>       928.50 =C2=B1  8%     +43.7%       1334 =C2=B1 17%  interrupts.CP=
U256.RES:Rescheduling_interrupts
>>>         1049 =C2=B1 12%     +23.9%       1300 =C2=B1  8%  interrupts.CP=
U257.RES:Rescheduling_interrupts
>>>         1183 =C2=B1  4%     +12.5%       1331 =C2=B1 10%  interrupts.CP=
U258.RES:Rescheduling_interrupts
>>>       796.50 =C2=B1  6%     +38.3%       1101 =C2=B1 23%  interrupts.CP=
U26.RES:Rescheduling_interrupts
>>>         1087 =C2=B1  8%     +28.4%       1396 =C2=B1  6%  interrupts.CP=
U260.RES:Rescheduling_interrupts
>>>         1081 =C2=B1 11%     +40.3%       1517 =C2=B1  6%  interrupts.CP=
U261.RES:Rescheduling_interrupts
>>>         1553 =C2=B1 48%     +43.8%       2233 =C2=B1 39%  interrupts.CP=
U262.NMI:Non-maskable_interrupts
>>>         1553 =C2=B1 48%     +43.8%       2233 =C2=B1 39%  interrupts.CP=
U262.PMI:Performance_monitoring_interrupts
>>>         1270 =C2=B1 13%     +29.0%       1638 =C2=B1 10%  interrupts.CP=
U262.RES:Rescheduling_interrupts
>>>         1170 =C2=B1 13%     +57.6%       1844 =C2=B1 44%  interrupts.CP=
U264.NMI:Non-maskable_interrupts
>>>         1170 =C2=B1 13%     +57.6%       1844 =C2=B1 44%  interrupts.CP=
U264.PMI:Performance_monitoring_interrupts
>>>       899.00 =C2=B1 10%     +38.8%       1247 =C2=B1 14%  interrupts.CP=
U264.RES:Rescheduling_interrupts
>>>       912.25 =C2=B1 11%     +18.3%       1079 =C2=B1  7%  interrupts.CP=
U267.RES:Rescheduling_interrupts
>>>       703.25 =C2=B1  9%     +48.5%       1044 =C2=B1 21%  interrupts.CP=
U27.RES:Rescheduling_interrupts
>>>         1198 =C2=B1 12%     +82.4%       2185 =C2=B1 40%  interrupts.CP=
U273.NMI:Non-maskable_interrupts
>>>         1198 =C2=B1 12%     +82.4%       2185 =C2=B1 40%  interrupts.CP=
U273.PMI:Performance_monitoring_interrupts
>>>       847.50 =C2=B1 10%     +44.9%       1228 =C2=B1 18%  interrupts.CP=
U273.RES:Rescheduling_interrupts
>>>       900.50 =C2=B1 19%     +34.2%       1208 =C2=B1 17%  interrupts.CP=
U274.RES:Rescheduling_interrupts
>>>         1175 =C2=B1 13%     +82.5%       2145 =C2=B1 36%  interrupts.CP=
U275.NMI:Non-maskable_interrupts
>>>         1175 =C2=B1 13%     +82.5%       2145 =C2=B1 36%  interrupts.CP=
U275.PMI:Performance_monitoring_interrupts
>>>       800.50 =C2=B1  8%     +35.5%       1084 =C2=B1 14%  interrupts.CP=
U275.RES:Rescheduling_interrupts
>>>       803.00 =C2=B1  7%     +55.0%       1244 =C2=B1 20%  interrupts.CP=
U276.RES:Rescheduling_interrupts
>>>       888.50 =C2=B1 11%     +40.6%       1249 =C2=B1  9%  interrupts.CP=
U277.RES:Rescheduling_interrupts
>>>        10916           -10.1%       9813 =C2=B1  2%  interrupts.CPU277.=
TLB:TLB_shootdowns
>>>         1035 =C2=B1  2%     +23.6%       1280 =C2=B1  5%  interrupts.CP=
U278.RES:Rescheduling_interrupts
>>>       926.75 =C2=B1  8%     +37.3%       1272 =C2=B1 16%  interrupts.CP=
U279.RES:Rescheduling_interrupts
>>>       753.25 =C2=B1 21%     +42.8%       1076 =C2=B1  8%  interrupts.CP=
U282.RES:Rescheduling_interrupts
>>>         1183 =C2=B1 12%     +55.6%       1841 =C2=B1 44%  interrupts.CP=
U283.NMI:Non-maskable_interrupts
>>>         1183 =C2=B1 12%     +55.6%       1841 =C2=B1 44%  interrupts.CP=
U283.PMI:Performance_monitoring_interrupts
>>>         1187 =C2=B1 11%    +112.7%       2525 =C2=B1 27%  interrupts.CP=
U284.NMI:Non-maskable_interrupts
>>>         1187 =C2=B1 11%    +112.7%       2525 =C2=B1 27%  interrupts.CP=
U284.PMI:Performance_monitoring_interrupts
>>>         2063 =C2=B1 28%     +38.7%       2863 =C2=B1  9%  interrupts.CP=
U285.NMI:Non-maskable_interrupts
>>>         2063 =C2=B1 28%     +38.7%       2863 =C2=B1  9%  interrupts.CP=
U285.PMI:Performance_monitoring_interrupts
>>>       854.25 =C2=B1  3%     +27.0%       1084 =C2=B1  5%  interrupts.CP=
U286.RES:Rescheduling_interrupts
>>>       729.50 =C2=B1 11%     +33.3%     972.75 =C2=B1  5%  interrupts.CP=
U287.RES:Rescheduling_interrupts
>>>         1473 =C2=B1 50%     +72.6%       2542 =C2=B1 30%  interrupts.CP=
U29.NMI:Non-maskable_interrupts
>>>         1473 =C2=B1 50%     +72.6%       2542 =C2=B1 30%  interrupts.CP=
U29.PMI:Performance_monitoring_interrupts
>>>         1133 =C2=B1 13%     +92.6%       2183 =C2=B1 39%  interrupts.CP=
U3.NMI:Non-maskable_interrupts
>>>         1133 =C2=B1 13%     +92.6%       2183 =C2=B1 39%  interrupts.CP=
U3.PMI:Performance_monitoring_interrupts
>>>       853.00 =C2=B1  5%     +19.3%       1017 =C2=B1  4%  interrupts.CP=
U3.RES:Rescheduling_interrupts
>>>       865.00 =C2=B1  5%     +27.6%       1103 =C2=B1  9%  interrupts.CP=
U30.RES:Rescheduling_interrupts
>>>       750.50 =C2=B1 10%     +20.9%     907.25 =C2=B1 12%  interrupts.CP=
U31.RES:Rescheduling_interrupts
>>>         1140 =C2=B1 13%     +93.0%       2201 =C2=B1 40%  interrupts.CP=
U32.NMI:Non-maskable_interrupts
>>>         1140 =C2=B1 13%     +93.0%       2201 =C2=B1 40%  interrupts.CP=
U32.PMI:Performance_monitoring_interrupts
>>>       800.50 =C2=B1 10%     +17.9%     944.00 =C2=B1  4%  interrupts.CP=
U32.RES:Rescheduling_interrupts
>>>       836.50 =C2=B1  5%     +18.9%     994.50 =C2=B1  4%  interrupts.CP=
U34.RES:Rescheduling_interrupts
>>>       797.00 =C2=B1  4%     +21.9%     971.75 =C2=B1  6%  interrupts.CP=
U35.RES:Rescheduling_interrupts
>>>       754.00 =C2=B1  4%     +21.2%     914.00 =C2=B1  5%  interrupts.CP=
U36.RES:Rescheduling_interrupts
>>>       616.25 =C2=B1  8%     +44.8%     892.25 =C2=B1 15%  interrupts.CP=
U37.RES:Rescheduling_interrupts
>>>       791.25 =C2=B1  6%     +32.6%       1049 =C2=B1 16%  interrupts.CP=
U38.RES:Rescheduling_interrupts
>>>       686.75 =C2=B1  5%     +34.9%     926.50 =C2=B1 14%  interrupts.CP=
U39.RES:Rescheduling_interrupts
>>>       878.50 =C2=B1  6%     +31.6%       1156 =C2=B1 16%  interrupts.CP=
U4.RES:Rescheduling_interrupts
>>>         1180 =C2=B1 12%     +85.2%       2185 =C2=B1 34%  interrupts.CP=
U42.NMI:Non-maskable_interrupts
>>>         1180 =C2=B1 12%     +85.2%       2185 =C2=B1 34%  interrupts.CP=
U42.PMI:Performance_monitoring_interrupts
>>>       980.75 =C2=B1 11%     +39.5%       1367 =C2=B1 14%  interrupts.CP=
U45.RES:Rescheduling_interrupts
>>>         1103 =C2=B1 14%     +22.1%       1347 =C2=B1  6%  interrupts.CP=
U46.RES:Rescheduling_interrupts
>>>       925.00 =C2=B1 26%     +42.2%       1315 =C2=B1 10%  interrupts.CP=
U47.RES:Rescheduling_interrupts
>>>       960.25 =C2=B1 15%     +41.2%       1356 =C2=B1 12%  interrupts.CP=
U48.RES:Rescheduling_interrupts
>>>       921.75 =C2=B1  8%     +23.2%       1135 =C2=B1 11%  interrupts.CP=
U49.RES:Rescheduling_interrupts
>>>         1067 =C2=B1 15%     +25.3%       1337 =C2=B1 10%  interrupts.CP=
U50.RES:Rescheduling_interrupts
>>>         1076 =C2=B1  7%     +49.1%       1605 =C2=B1 17%  interrupts.CP=
U56.RES:Rescheduling_interrupts
>>>        10449 =C2=B1  2%      -7.7%       9646 =C2=B1  3%  interrupts.CP=
U56.TLB:TLB_shootdowns
>>>       913.75 =C2=B1 13%     +40.9%       1287 =C2=B1 13%  interrupts.CP=
U58.RES:Rescheduling_interrupts
>>>       767.50 =C2=B1  8%     +54.1%       1182 =C2=B1 14%  interrupts.CP=
U59.RES:Rescheduling_interrupts
>>>         1374 =C2=B1 27%     +79.9%       2473 =C2=B1 26%  interrupts.CP=
U6.NMI:Non-maskable_interrupts
>>>         1374 =C2=B1 27%     +79.9%       2473 =C2=B1 26%  interrupts.CP=
U6.PMI:Performance_monitoring_interrupts
>>>       825.00 =C2=B1 11%     +38.8%       1145 =C2=B1 18%  interrupts.CP=
U6.RES:Rescheduling_interrupts
>>>         1016 =C2=B1 21%     +32.2%       1343 =C2=B1 12%  interrupts.CP=
U60.RES:Rescheduling_interrupts
>>>       802.50 =C2=B1 12%     +52.6%       1225 =C2=B1 16%  interrupts.CP=
U61.RES:Rescheduling_interrupts
>>>       895.50 =C2=B1  8%     +21.4%       1087 =C2=B1  2%  interrupts.CP=
U62.RES:Rescheduling_interrupts
>>>       973.25 =C2=B1 22%     +41.4%       1376 =C2=B1  6%  interrupts.CP=
U66.RES:Rescheduling_interrupts
>>>       854.75 =C2=B1 10%     +33.8%       1143 =C2=B1 13%  interrupts.CP=
U67.RES:Rescheduling_interrupts
>>>       771.25 =C2=B1 12%     +40.2%       1081 =C2=B1 13%  interrupts.CP=
U69.RES:Rescheduling_interrupts
>>>       621.50 =C2=B1  7%     +45.4%     903.50 =C2=B1 12%  interrupts.CP=
U7.RES:Rescheduling_interrupts
>>>         1169 =C2=B1  7%     +24.5%       1455 =C2=B1  5%  interrupts.CP=
U70.RES:Rescheduling_interrupts
>>>        10547 =C2=B1  2%      -8.5%       9654        interrupts.CPU70.T=
LB:TLB_shootdowns
>>>         1574 =C2=B1 12%     +34.4%       2115 =C2=B1 11%  interrupts.CP=
U71.RES:Rescheduling_interrupts
>>>         1456 =C2=B1 29%     +49.9%       2183 =C2=B1 35%  interrupts.CP=
U72.NMI:Non-maskable_interrupts
>>>         1456 =C2=B1 29%     +49.9%       2183 =C2=B1 35%  interrupts.CP=
U72.PMI:Performance_monitoring_interrupts
>>>         1183 =C2=B1 12%     +25.6%       1485 =C2=B1  8%  interrupts.CP=
U72.RES:Rescheduling_interrupts
>>>         1514 =C2=B1 33%     +41.4%       2142 =C2=B1 27%  interrupts.CP=
U73.NMI:Non-maskable_interrupts
>>>         1514 =C2=B1 33%     +41.4%       2142 =C2=B1 27%  interrupts.CP=
U73.PMI:Performance_monitoring_interrupts
>>>       986.75 =C2=B1 21%     +56.7%       1546 =C2=B1 14%  interrupts.CP=
U73.RES:Rescheduling_interrupts
>>>         1001 =C2=B1  4%     +35.5%       1356 =C2=B1  7%  interrupts.CP=
U76.RES:Rescheduling_interrupts
>>>         1004 =C2=B1 10%     +22.4%       1229 =C2=B1 11%  interrupts.CP=
U77.RES:Rescheduling_interrupts
>>>       897.25 =C2=B1  9%     +34.5%       1206 =C2=B1 19%  interrupts.CP=
U78.RES:Rescheduling_interrupts
>>>       785.75 =C2=B1 11%     +25.6%     987.00 =C2=B1  4%  interrupts.CP=
U8.RES:Rescheduling_interrupts
>>>       943.75 =C2=B1  9%     +29.1%       1218 =C2=B1 12%  interrupts.CP=
U81.RES:Rescheduling_interrupts
>>>       991.75 =C2=B1  2%     +37.9%       1367 =C2=B1 17%  interrupts.CP=
U82.RES:Rescheduling_interrupts
>>>         1177 =C2=B1 12%     +58.9%       1870 =C2=B1 44%  interrupts.CP=
U83.NMI:Non-maskable_interrupts
>>>         1177 =C2=B1 12%     +58.9%       1870 =C2=B1 44%  interrupts.CP=
U83.PMI:Performance_monitoring_interrupts
>>>         1170 =C2=B1 15%     +17.1%       1370 =C2=B1  6%  interrupts.CP=
U83.RES:Rescheduling_interrupts
>>>         1499 =C2=B1 30%     +45.9%       2188 =C2=B1 34%  interrupts.CP=
U86.NMI:Non-maskable_interrupts
>>>         1499 =C2=B1 30%     +45.9%       2188 =C2=B1 34%  interrupts.CP=
U86.PMI:Performance_monitoring_interrupts
>>>         1193 =C2=B1 10%    +109.8%       2502 =C2=B1 20%  interrupts.CP=
U87.NMI:Non-maskable_interrupts
>>>         1193 =C2=B1 10%    +109.8%       2502 =C2=B1 20%  interrupts.CP=
U87.PMI:Performance_monitoring_interrupts
>>>         1145 =C2=B1 14%     +31.2%       1502 =C2=B1  7%  interrupts.CP=
U87.RES:Rescheduling_interrupts
>>>         1177 =C2=B1  6%     +21.1%       1426 =C2=B1  8%  interrupts.CP=
U88.RES:Rescheduling_interrupts
>>>         1140 =C2=B1 14%     +91.1%       2179 =C2=B1 40%  interrupts.CP=
U9.NMI:Non-maskable_interrupts
>>>         1140 =C2=B1 14%     +91.1%       2179 =C2=B1 40%  interrupts.CP=
U9.PMI:Performance_monitoring_interrupts
>>>       676.75 =C2=B1 10%     +41.2%     955.25 =C2=B1 11%  interrupts.CP=
U9.RES:Rescheduling_interrupts
>>>         1195 =C2=B1 11%     +56.7%       1872 =C2=B1 43%  interrupts.CP=
U90.NMI:Non-maskable_interrupts
>>>         1195 =C2=B1 11%     +56.7%       1872 =C2=B1 43%  interrupts.CP=
U90.PMI:Performance_monitoring_interrupts
>>>         2083 =C2=B1 27%     +40.0%       2917 =C2=B1 10%  interrupts.CP=
U95.NMI:Non-maskable_interrupts
>>>         2083 =C2=B1 27%     +40.0%       2917 =C2=B1 10%  interrupts.CP=
U95.PMI:Performance_monitoring_interrupts
>>>         1110 =C2=B1  6%     +14.4%       1270 =C2=B1 11%  interrupts.CP=
U95.RES:Rescheduling_interrupts
>>>         1110 =C2=B1  6%     +41.0%       1566 =C2=B1 18%  interrupts.CP=
U98.RES:Rescheduling_interrupts
>>>       984.75 =C2=B1  9%     +58.2%       1557 =C2=B1 19%  interrupts.CP=
U99.RES:Rescheduling_interrupts
>>>       310787 =C2=B1  6%     +23.6%     384165 =C2=B1  4%  interrupts.RE=
S:Rescheduling_interrupts
>>>        33134 =C2=B1  2%     +14.7%      38003 =C2=B1  6%  softirqs.CPU0=
.SCHED
>>>        27079 =C2=B1  2%     +17.4%      31779 =C2=B1  3%  softirqs.CPU1=
.SCHED
>>>       162495            +8.8%     176829 =C2=B1  4%  softirqs.CPU1.TIMER
>>>        26465           +19.2%      31556 =C2=B1  3%  softirqs.CPU10.SCH=
ED
>>>        25261 =C2=B1  3%     +16.4%      29411 =C2=B1  3%  softirqs.CPU1=
00.SCHED
>>>        25450           +18.5%      30153 =C2=B1  4%  softirqs.CPU101.SC=
HED
>>>        25169 =C2=B1  2%     +19.3%      30020 =C2=B1  3%  softirqs.CPU1=
02.SCHED
>>>        24805 =C2=B1  3%     +20.5%      29893 =C2=B1  3%  softirqs.CPU1=
03.SCHED
>>>        25132 =C2=B1  3%     +18.9%      29875 =C2=B1  3%  softirqs.CPU1=
04.SCHED
>>>       177301 =C2=B1  2%     +11.3%     197274 =C2=B1  4%  softirqs.CPU1=
04.TIMER
>>>        24869 =C2=B1  3%     +18.8%      29537 =C2=B1  2%  softirqs.CPU1=
05.SCHED
>>>        25032 =C2=B1  2%     +17.7%      29462 =C2=B1  3%  softirqs.CPU1=
06.SCHED
>>>        24317           +22.3%      29729 =C2=B1  3%  softirqs.CPU107.SC=
HED
>>>        25241 =C2=B1  3%     +18.5%      29917 =C2=B1  2%  softirqs.CPU1=
08.SCHED
>>>        25571 =C2=B1  2%     +17.6%      30075 =C2=B1  3%  softirqs.CPU1=
09.SCHED
>>>        25910           +17.9%      30551 =C2=B1  3%  softirqs.CPU11.SCH=
ED
>>>        24927 =C2=B1  2%     +18.5%      29538 =C2=B1  4%  softirqs.CPU1=
10.SCHED
>>>        25019 =C2=B1  2%     +19.2%      29833 =C2=B1  4%  softirqs.CPU1=
11.SCHED
>>>        25067 =C2=B1  2%     +18.7%      29743 =C2=B1  4%  softirqs.CPU1=
12.SCHED
>>>        25105 =C2=B1  2%     +19.1%      29892 =C2=B1  2%  softirqs.CPU1=
13.SCHED
>>>        25603 =C2=B1  2%     +16.2%      29753 =C2=B1  4%  softirqs.CPU1=
14.SCHED
>>>        25517 =C2=B1  2%     +17.9%      30096 =C2=B1  3%  softirqs.CPU1=
15.SCHED
>>>       176346 =C2=B1  5%     +11.4%     196390 =C2=B1  4%  softirqs.CPU1=
15.TIMER
>>>        24988 =C2=B1  2%     +17.3%      29299 =C2=B1  4%  softirqs.CPU1=
16.SCHED
>>>        24362           +22.1%      29748 =C2=B1  2%  softirqs.CPU117.SC=
HED
>>>        25420 =C2=B1  2%     +18.4%      30101 =C2=B1  3%  softirqs.CPU1=
18.SCHED
>>>        25202           +17.2%      29531 =C2=B1  3%  softirqs.CPU119.SC=
HED
>>>       246.00 =C2=B1 32%   +5886.8%      14727 =C2=B1166%  softirqs.CPU1=
2.NET_RX
>>>        25808 =C2=B1  2%     +19.6%      30866 =C2=B1  4%  softirqs.CPU1=
2.SCHED
>>>       161592 =C2=B1  4%     +26.1%     203759 =C2=B1 17%  softirqs.CPU1=
2.TIMER
>>>        25550           +16.3%      29721 =C2=B1  3%  softirqs.CPU120.SC=
HED
>>>       172644 =C2=B1  4%     +13.1%     195269 =C2=B1  4%  softirqs.CPU1=
20.TIMER
>>>        24062 =C2=B1  5%     +24.3%      29898 =C2=B1  3%  softirqs.CPU1=
21.SCHED
>>>       173612 =C2=B1  4%     +12.4%     195124 =C2=B1  3%  softirqs.CPU1=
21.TIMER
>>>        24774 =C2=B1  3%     +20.1%      29742 =C2=B1  2%  softirqs.CPU1=
22.SCHED
>>>        25233 =C2=B1  2%     +18.4%      29878 =C2=B1  2%  softirqs.CPU1=
23.SCHED
>>>        25038 =C2=B1  2%     +18.0%      29548 =C2=B1  4%  softirqs.CPU1=
24.SCHED
>>>        24756           +19.1%      29485 =C2=B1  3%  softirqs.CPU125.SC=
HED
>>>        25079           +19.2%      29903 =C2=B1  3%  softirqs.CPU126.SC=
HED
>>>        25110           +17.9%      29598 =C2=B1  3%  softirqs.CPU127.SC=
HED
>>>        24869 =C2=B1  3%     +19.6%      29754 =C2=B1  3%  softirqs.CPU1=
28.SCHED
>>>        25255 =C2=B1  2%     +17.6%      29710 =C2=B1  3%  softirqs.CPU1=
29.SCHED
>>>        26257           +22.8%      32254 =C2=B1  3%  softirqs.CPU13.SCH=
ED
>>>        25274 =C2=B1  2%     +19.3%      30153 =C2=B1  2%  softirqs.CPU1=
30.SCHED
>>>        25219 =C2=B1  2%     +15.4%      29103 =C2=B1  2%  softirqs.CPU1=
31.SCHED
>>>        25034 =C2=B1  2%     +19.3%      29869 =C2=B1  2%  softirqs.CPU1=
32.SCHED
>>>        25448           +17.1%      29792        softirqs.CPU133.SCHED
>>>        25064           +17.5%      29450 =C2=B1  4%  softirqs.CPU134.SC=
HED
>>>        25561 =C2=B1  2%     +16.4%      29742 =C2=B1  4%  softirqs.CPU1=
35.SCHED
>>>        25620           +17.3%      30041 =C2=B1  3%  softirqs.CPU136.SC=
HED
>>>       174761 =C2=B1  6%     +11.1%     194097 =C2=B1  7%  softirqs.CPU1=
36.TIMER
>>>        26235 =C2=B1  2%     +14.8%      30124 =C2=B1  2%  softirqs.CPU1=
37.SCHED
>>>       169540 =C2=B1  4%     +13.3%     192089 =C2=B1  3%  softirqs.CPU1=
37.TIMER
>>>        25194           +18.3%      29808 =C2=B1  3%  softirqs.CPU138.SC=
HED
>>>        25038 =C2=B1  4%     +19.7%      29982 =C2=B1  4%  softirqs.CPU1=
39.SCHED
>>>        26136 =C2=B1  2%     +20.5%      31494 =C2=B1  2%  softirqs.CPU1=
4.SCHED
>>>        25185           +20.2%      30269 =C2=B1  3%  softirqs.CPU140.SC=
HED
>>>        25032           +20.2%      30098 =C2=B1  2%  softirqs.CPU141.SC=
HED
>>>        25247 =C2=B1  2%     +16.9%      29514        softirqs.CPU142.SC=
HED
>>>        24775           +12.9%      27962 =C2=B1  6%  softirqs.CPU143.SC=
HED
>>>        25196           +19.1%      30016 =C2=B1  3%  softirqs.CPU144.SC=
HED
>>>        24907 =C2=B1  2%     +18.4%      29495 =C2=B1  3%  softirqs.CPU1=
45.SCHED
>>>        25254           +16.3%      29359 =C2=B1  4%  softirqs.CPU146.SC=
HED
>>>        25123           +19.8%      30089 =C2=B1  3%  softirqs.CPU147.SC=
HED
>>>        25311 =C2=B1  6%     +17.6%      29757 =C2=B1  5%  softirqs.CPU1=
48.SCHED
>>>        25020 =C2=B1  2%     +20.4%      30121 =C2=B1  2%  softirqs.CPU1=
49.SCHED
>>>        26013           +19.5%      31094 =C2=B1  2%  softirqs.CPU15.SCH=
ED
>>>        25040           +19.1%      29828 =C2=B1  4%  softirqs.CPU150.SC=
HED
>>>        25358           +20.1%      30458 =C2=B1  2%  softirqs.CPU151.SC=
HED
>>>       175966 =C2=B1  6%     +11.6%     196369 =C2=B1  4%  softirqs.CPU1=
51.TIMER
>>>        24847 =C2=B1  2%     +20.7%      30003 =C2=B1  2%  softirqs.CPU1=
52.SCHED
>>>        24860 =C2=B1  4%     +19.9%      29811 =C2=B1  3%  softirqs.CPU1=
53.SCHED
>>>        25102 =C2=B1  3%     +18.0%      29611 =C2=B1  3%  softirqs.CPU1=
54.SCHED
>>>        24819           +20.0%      29792 =C2=B1  3%  softirqs.CPU155.SC=
HED
>>>        25414 =C2=B1  2%     +17.3%      29808        softirqs.CPU156.SC=
HED
>>>       176417 =C2=B1  5%     +15.6%     203967 =C2=B1  5%  softirqs.CPU1=
56.TIMER
>>>        25556           +16.1%      29663 =C2=B1  4%  softirqs.CPU157.SC=
HED
>>>        25241 =C2=B1  2%     +19.9%      30256 =C2=B1  3%  softirqs.CPU1=
58.SCHED
>>>        25462           +17.9%      30017 =C2=B1  2%  softirqs.CPU159.SC=
HED
>>>        25909           +18.5%      30694 =C2=B1  3%  softirqs.CPU16.SCH=
ED
>>>        25139           +18.1%      29684 =C2=B1  4%  softirqs.CPU160.SC=
HED
>>>        25431           +17.2%      29812 =C2=B1  4%  softirqs.CPU161.SC=
HED
>>>        25712           +18.6%      30483 =C2=B1  5%  softirqs.CPU162.SC=
HED
>>>       172304 =C2=B1  4%     +13.1%     194925 =C2=B1  4%  softirqs.CPU1=
62.TIMER
>>>        25736           +16.7%      30040 =C2=B1  3%  softirqs.CPU163.SC=
HED
>>>       169697 =C2=B1  6%     +16.0%     196768 =C2=B1  7%  softirqs.CPU1=
63.TIMER
>>>        25196 =C2=B1  2%     +17.4%      29591 =C2=B1  2%  softirqs.CPU1=
64.SCHED
>>>        24976           +19.1%      29753 =C2=B1  2%  softirqs.CPU165.SC=
HED
>>>        25153 =C2=B1  2%     +18.0%      29682 =C2=B1  2%  softirqs.CPU1=
66.SCHED
>>>        24977           +19.7%      29886 =C2=B1  2%  softirqs.CPU167.SC=
HED
>>>        24784 =C2=B1  3%     +18.9%      29457 =C2=B1  3%  softirqs.CPU1=
68.SCHED
>>>        25266 =C2=B1  2%     +17.1%      29596 =C2=B1  4%  softirqs.CPU1=
69.SCHED
>>>        25886 =C2=B1  2%     +19.3%      30876 =C2=B1  3%  softirqs.CPU1=
7.SCHED
>>>        24920           +17.6%      29295 =C2=B1  3%  softirqs.CPU170.SC=
HED
>>>        24993           +18.7%      29660 =C2=B1  3%  softirqs.CPU171.SC=
HED
>>>        25422           +17.1%      29763 =C2=B1  2%  softirqs.CPU172.SC=
HED
>>>        25491 =C2=B1  2%     +17.7%      29994 =C2=B1  3%  softirqs.CPU1=
73.SCHED
>>>        25264 =C2=B1  2%     +16.8%      29518 =C2=B1  6%  softirqs.CPU1=
74.SCHED
>>>        25266 =C2=B1  2%     +17.9%      29791 =C2=B1  2%  softirqs.CPU1=
75.SCHED
>>>        25231 =C2=B1  2%     +17.9%      29754 =C2=B1  3%  softirqs.CPU1=
76.SCHED
>>>       183212 =C2=B1  2%     +10.0%     201572 =C2=B1  2%  softirqs.CPU1=
76.TIMER
>>>        25273 =C2=B1  2%     +18.3%      29899 =C2=B1  3%  softirqs.CPU1=
77.SCHED
>>>        25155           +19.8%      30145 =C2=B1  2%  softirqs.CPU178.SC=
HED
>>>        25499 =C2=B1  2%     +16.0%      29576 =C2=B1  5%  softirqs.CPU1=
79.SCHED
>>>        26339           +16.3%      30634 =C2=B1  2%  softirqs.CPU18.SCH=
ED
>>>        24757 =C2=B1  4%     +19.2%      29500 =C2=B1  2%  softirqs.CPU1=
80.SCHED
>>>        25192 =C2=B1  3%     +14.7%      28898 =C2=B1  5%  softirqs.CPU1=
81.SCHED
>>>        25166 =C2=B1  2%     +19.2%      29999 =C2=B1  2%  softirqs.CPU1=
82.SCHED
>>>        25259 =C2=B1  2%     +18.4%      29910 =C2=B1  4%  softirqs.CPU1=
83.SCHED
>>>        25247 =C2=B1  2%     +16.9%      29519 =C2=B1  4%  softirqs.CPU1=
84.SCHED
>>>        25415 =C2=B1  2%     +16.9%      29715 =C2=B1  2%  softirqs.CPU1=
85.SCHED
>>>       180421 =C2=B1  5%     +11.4%     200946 =C2=B1  3%  softirqs.CPU1=
85.TIMER
>>>        24973 =C2=B1  3%     +16.3%      29053        softirqs.CPU186.SC=
HED
>>>        25525 =C2=B1  2%     +16.1%      29625 =C2=B1  2%  softirqs.CPU1=
87.SCHED
>>>        25461           +18.2%      30088 =C2=B1  2%  softirqs.CPU188.SC=
HED
>>>        24833           +20.5%      29936 =C2=B1  2%  softirqs.CPU189.SC=
HED
>>>        25894           +17.1%      30332 =C2=B1  4%  softirqs.CPU19.SCH=
ED
>>>       162878 =C2=B1  4%     +18.0%     192168 =C2=B1 14%  softirqs.CPU1=
9.TIMER
>>>        25062           +18.4%      29663 =C2=B1  2%  softirqs.CPU190.SC=
HED
>>>        24867           +18.3%      29425 =C2=B1  3%  softirqs.CPU191.SC=
HED
>>>        24926           +18.8%      29620 =C2=B1  2%  softirqs.CPU192.SC=
HED
>>>       183126 =C2=B1  5%     +11.9%     204971 =C2=B1  2%  softirqs.CPU1=
92.TIMER
>>>        24864 =C2=B1  2%     +16.2%      28893 =C2=B1  4%  softirqs.CPU1=
93.SCHED
>>>        25242           +17.7%      29702 =C2=B1  2%  softirqs.CPU194.SC=
HED
>>>        25230 =C2=B1  2%     +17.4%      29626 =C2=B1  3%  softirqs.CPU1=
95.SCHED
>>>        24981 =C2=B1  2%     +18.8%      29680 =C2=B1  2%  softirqs.CPU1=
96.SCHED
>>>        25020           +17.3%      29348 =C2=B1  6%  softirqs.CPU197.SC=
HED
>>>        25272           +18.5%      29942 =C2=B1  3%  softirqs.CPU198.SC=
HED
>>>        25221 =C2=B1  2%     +18.8%      29968 =C2=B1  3%  softirqs.CPU1=
99.SCHED
>>>       182100 =C2=B1  4%      +8.3%     197211 =C2=B1  3%  softirqs.CPU1=
99.TIMER
>>>        26451           +18.1%      31251 =C2=B1  3%  softirqs.CPU2.SCHED
>>>        26194           +18.4%      31019 =C2=B1  2%  softirqs.CPU20.SCH=
ED
>>>        25645 =C2=B1  2%     +17.6%      30168 =C2=B1  3%  softirqs.CPU2=
00.SCHED
>>>        25337           +20.0%      30393 =C2=B1  3%  softirqs.CPU201.SC=
HED
>>>        25160           +19.0%      29945 =C2=B1  2%  softirqs.CPU202.SC=
HED
>>>        25322 =C2=B1  2%     +18.3%      29944 =C2=B1  3%  softirqs.CPU2=
03.SCHED
>>>        25076           +20.2%      30130 =C2=B1  3%  softirqs.CPU204.SC=
HED
>>>        25542           +19.2%      30455 =C2=B1  2%  softirqs.CPU205.SC=
HED
>>>        25245 =C2=B1  2%     +16.7%      29455 =C2=B1  2%  softirqs.CPU2=
06.SCHED
>>>        25317 =C2=B1  2%     +17.5%      29743 =C2=B1  3%  softirqs.CPU2=
07.SCHED
>>>        25283 =C2=B1  2%     +18.5%      29958 =C2=B1  4%  softirqs.CPU2=
08.SCHED
>>>        25533           +12.9%      28839 =C2=B1  6%  softirqs.CPU209.SC=
HED
>>>       176766 =C2=B1  3%     +13.1%     199978 =C2=B1  2%  softirqs.CPU2=
09.TIMER
>>>        26093           +18.6%      30954 =C2=B1  3%  softirqs.CPU21.SCH=
ED
>>>        25426 =C2=B1  2%     +17.8%      29963 =C2=B1  3%  softirqs.CPU2=
10.SCHED
>>>        25363 =C2=B1  2%     +17.5%      29794        softirqs.CPU211.SC=
HED
>>>        25056 =C2=B1  2%     +18.3%      29644 =C2=B1  5%  softirqs.CPU2=
12.SCHED
>>>        24915 =C2=B1  2%     +18.8%      29602 =C2=B1  3%  softirqs.CPU2=
13.SCHED
>>>        25269 =C2=B1  2%     +19.9%      30296 =C2=B1  2%  softirqs.CPU2=
14.SCHED
>>>        24759 =C2=B1  2%     +16.4%      28808 =C2=B1  5%  softirqs.CPU2=
15.SCHED
>>>        25090           +19.8%      30061 =C2=B1  2%  softirqs.CPU216.SC=
HED
>>>        24887 =C2=B1  2%     +17.2%      29156        softirqs.CPU217.SC=
HED
>>>        25021           +17.2%      29336 =C2=B1  4%  softirqs.CPU218.SC=
HED
>>>        25320 =C2=B1  2%     +17.7%      29806 =C2=B1  2%  softirqs.CPU2=
19.SCHED
>>>        25672 =C2=B1  2%     +20.9%      31048        softirqs.CPU22.SCH=
ED
>>>        25182 =C2=B1  2%     +18.8%      29919 =C2=B1  3%  softirqs.CPU2=
20.SCHED
>>>        25152 =C2=B1  2%     +20.3%      30248 =C2=B1  4%  softirqs.CPU2=
21.SCHED
>>>        24777           +19.1%      29504 =C2=B1  5%  softirqs.CPU222.SC=
HED
>>>        25122 =C2=B1  3%     +19.6%      30041 =C2=B1  2%  softirqs.CPU2=
23.SCHED
>>>        25079 =C2=B1  2%     +19.4%      29954 =C2=B1  2%  softirqs.CPU2=
24.SCHED
>>>        25236 =C2=B1  2%     +18.8%      29969 =C2=B1  2%  softirqs.CPU2=
25.SCHED
>>>        25105 =C2=B1  3%     +19.0%      29876 =C2=B1  2%  softirqs.CPU2=
26.SCHED
>>>        25609           +15.6%      29613 =C2=B1  4%  softirqs.CPU227.SC=
HED
>>>       180136 =C2=B1  8%     +11.0%     200040 =C2=B1  5%  softirqs.CPU2=
27.TIMER
>>>        25435           +15.9%      29476 =C2=B1  2%  softirqs.CPU228.SC=
HED
>>>       175813 =C2=B1  3%     +16.7%     205108 =C2=B1  5%  softirqs.CPU2=
28.TIMER
>>>        25142 =C2=B1  2%     +14.1%      28699 =C2=B1  5%  softirqs.CPU2=
29.SCHED
>>>        25831           +19.2%      30787 =C2=B1  2%  softirqs.CPU23.SCH=
ED
>>>        25460 =C2=B1  2%     +18.8%      30242 =C2=B1  3%  softirqs.CPU2=
30.SCHED
>>>        25200 =C2=B1  3%     +20.1%      30259 =C2=B1  2%  softirqs.CPU2=
31.SCHED
>>>       168374 =C2=B1  3%      +8.7%     183098 =C2=B1  3%  softirqs.CPU2=
31.TIMER
>>>        25379 =C2=B1  2%     +17.1%      29711 =C2=B1  2%  softirqs.CPU2=
32.SCHED
>>>        25524 =C2=B1  2%     +18.5%      30246 =C2=B1  3%  softirqs.CPU2=
33.SCHED
>>>        25686 =C2=B1  2%     +17.5%      30170 =C2=B1  3%  softirqs.CPU2=
34.SCHED
>>>       170330 =C2=B1  4%     +11.3%     189542 =C2=B1  5%  softirqs.CPU2=
34.TIMER
>>>        25635 =C2=B1  2%     +14.7%      29410 =C2=B1  4%  softirqs.CPU2=
35.SCHED
>>>       176292 =C2=B1  7%     +15.9%     204389 =C2=B1  6%  softirqs.CPU2=
35.TIMER
>>>        25549 =C2=B1  2%     +16.3%      29718 =C2=B1  2%  softirqs.CPU2=
36.SCHED
>>>       178538 =C2=B1  4%      +9.2%     194880 =C2=B1  4%  softirqs.CPU2=
36.TIMER
>>>        25386 =C2=B1  2%     +18.4%      30055 =C2=B1  2%  softirqs.CPU2=
37.SCHED
>>>        25191 =C2=B1  2%     +17.9%      29707        softirqs.CPU238.SC=
HED
>>>        25186 =C2=B1  3%     +20.3%      30293        softirqs.CPU239.SC=
HED
>>>        25877           +19.0%      30799 =C2=B1  3%  softirqs.CPU24.SCH=
ED
>>>        25506           +17.5%      29967 =C2=B1  3%  softirqs.CPU240.SC=
HED
>>>        24964 =C2=B1  2%     +21.1%      30222 =C2=B1  3%  softirqs.CPU2=
41.SCHED
>>>        25258           +17.7%      29719 =C2=B1  2%  softirqs.CPU242.SC=
HED
>>>        25162           +18.2%      29740 =C2=B1  4%  softirqs.CPU243.SC=
HED
>>>        25808           +17.3%      30285 =C2=B1  3%  softirqs.CPU244.SC=
HED
>>>        25679           +17.4%      30150 =C2=B1  3%  softirqs.CPU245.SC=
HED
>>>       175664 =C2=B1  3%      +8.3%     190327 =C2=B1  4%  softirqs.CPU2=
45.TIMER
>>>        25134 =C2=B1  2%     +19.7%      30079 =C2=B1  4%  softirqs.CPU2=
46.SCHED
>>>        24942           +19.9%      29913 =C2=B1  3%  softirqs.CPU247.SC=
HED
>>>        25395 =C2=B1  2%     +17.8%      29906 =C2=B1  2%  softirqs.CPU2=
48.SCHED
>>>       180993 =C2=B1  3%     +10.8%     200584 =C2=B1  4%  softirqs.CPU2=
48.TIMER
>>>        25491 =C2=B1  2%     +18.0%      30075 =C2=B1  4%  softirqs.CPU2=
49.SCHED
>>>        26099           +17.2%      30595 =C2=B1  3%  softirqs.CPU25.SCH=
ED
>>>        25332           +18.7%      30060 =C2=B1  2%  softirqs.CPU250.SC=
HED
>>>        25471 =C2=B1  2%     +17.4%      29892 =C2=B1  3%  softirqs.CPU2=
51.SCHED
>>>       180242 =C2=B1  4%      +9.8%     197819 =C2=B1  4%  softirqs.CPU2=
51.TIMER
>>>        25406 =C2=B1  2%     +16.9%      29694 =C2=B1  3%  softirqs.CPU2=
52.SCHED
>>>        25317 =C2=B1  3%     +18.2%      29922 =C2=B1  3%  softirqs.CPU2=
53.SCHED
>>>        25103 =C2=B1  4%     +19.9%      30106 =C2=B1  3%  softirqs.CPU2=
54.SCHED
>>>        25231 =C2=B1  2%     +19.8%      30227 =C2=B1  3%  softirqs.CPU2=
55.SCHED
>>>        25509 =C2=B1  2%     +18.2%      30161 =C2=B1  3%  softirqs.CPU2=
56.SCHED
>>>        25559 =C2=B1  3%     +16.9%      29888 =C2=B1  3%  softirqs.CPU2=
57.SCHED
>>>        25277 =C2=B1  2%     +16.8%      29523 =C2=B1  2%  softirqs.CPU2=
58.SCHED
>>>        24695 =C2=B1  5%     +20.4%      29721 =C2=B1  2%  softirqs.CPU2=
59.SCHED
>>>       182550 =C2=B1  5%     +10.5%     201781 =C2=B1  3%  softirqs.CPU2=
59.TIMER
>>>        25905           +19.5%      30970 =C2=B1  2%  softirqs.CPU26.SCH=
ED
>>>       164306 =C2=B1  3%      +7.6%     176738 =C2=B1  5%  softirqs.CPU2=
6.TIMER
>>>        24829 =C2=B1  2%     +20.8%      29990 =C2=B1  2%  softirqs.CPU2=
60.SCHED
>>>        25156           +19.1%      29971 =C2=B1  2%  softirqs.CPU261.SC=
HED
>>>        25098 =C2=B1  3%     +17.6%      29515 =C2=B1  4%  softirqs.CPU2=
62.SCHED
>>>       180807 =C2=B1  5%      +9.4%     197856 =C2=B1  3%  softirqs.CPU2=
62.TIMER
>>>        25053 =C2=B1  2%     +18.2%      29613 =C2=B1  2%  softirqs.CPU2=
63.SCHED
>>>        25505           +18.9%      30336 =C2=B1  3%  softirqs.CPU264.SC=
HED
>>>       169958 =C2=B1  5%     +11.8%     189979 =C2=B1  4%  softirqs.CPU2=
64.TIMER
>>>        25011 =C2=B1  3%     +18.5%      29640 =C2=B1  4%  softirqs.CPU2=
65.SCHED
>>>       169719 =C2=B1  4%     +22.2%     207453 =C2=B1  8%  softirqs.CPU2=
65.TIMER
>>>        25489 =C2=B1  2%     +18.6%      30231 =C2=B1  3%  softirqs.CPU2=
66.SCHED
>>>        25727           +18.8%      30554 =C2=B1  2%  softirqs.CPU267.SC=
HED
>>>        25423           +18.1%      30020 =C2=B1  2%  softirqs.CPU268.SC=
HED
>>>        25451 =C2=B1  2%     +19.0%      30292 =C2=B1  4%  softirqs.CPU2=
69.SCHED
>>>        26042           +18.5%      30852 =C2=B1  3%  softirqs.CPU27.SCH=
ED
>>>       163812 =C2=B1  3%      +8.6%     177825 =C2=B1  5%  softirqs.CPU2=
7.TIMER
>>>        25649 =C2=B1  2%     +18.3%      30337 =C2=B1  3%  softirqs.CPU2=
70.SCHED
>>>        25318           +19.3%      30212 =C2=B1  3%  softirqs.CPU271.SC=
HED
>>>        25592 =C2=B1  2%     +19.6%      30603 =C2=B1  3%  softirqs.CPU2=
72.SCHED
>>>        25440 =C2=B1  2%     +20.0%      30520 =C2=B1  3%  softirqs.CPU2=
73.SCHED
>>>        26007           +18.2%      30741 =C2=B1  2%  softirqs.CPU274.SC=
HED
>>>        25661           +18.7%      30454 =C2=B1  3%  softirqs.CPU275.SC=
HED
>>>        25227           +21.0%      30536 =C2=B1  2%  softirqs.CPU276.SC=
HED
>>>        25923           +17.9%      30560 =C2=B1  3%  softirqs.CPU277.SC=
HED
>>>        25973           +14.6%      29757 =C2=B1  5%  softirqs.CPU278.SC=
HED
>>>        25905 =C2=B1  2%     +16.2%      30089 =C2=B1  3%  softirqs.CPU2=
79.SCHED
>>>        26091           +18.3%      30875 =C2=B1  3%  softirqs.CPU28.SCH=
ED
>>>        25736 =C2=B1  2%     +17.4%      30217 =C2=B1  4%  softirqs.CPU2=
80.SCHED
>>>        25964           +13.5%      29482 =C2=B1  6%  softirqs.CPU281.SC=
HED
>>>       170413 =C2=B1  4%     +11.8%     190550 =C2=B1  4%  softirqs.CPU2=
81.TIMER
>>>        25669           +18.8%      30484 =C2=B1  3%  softirqs.CPU282.SC=
HED
>>>        25462 =C2=B1  2%     +18.6%      30208        softirqs.CPU283.SC=
HED
>>>       174059 =C2=B1  6%     +10.6%     192446 =C2=B1  5%  softirqs.CPU2=
83.TIMER
>>>        25578           +18.4%      30287 =C2=B1  3%  softirqs.CPU284.SC=
HED
>>>        25703           +19.1%      30617 =C2=B1  3%  softirqs.CPU285.SC=
HED
>>>        25775 =C2=B1  2%     +16.0%      29891 =C2=B1  2%  softirqs.CPU2=
86.SCHED
>>>        25175 =C2=B1  2%     +16.0%      29204 =C2=B1  4%  softirqs.CPU2=
87.SCHED
>>>        26076           +17.7%      30684 =C2=B1  3%  softirqs.CPU29.SCH=
ED
>>>        26116           +18.8%      31032 =C2=B1  2%  softirqs.CPU3.SCHED
>>>        26043           +18.2%      30789 =C2=B1  3%  softirqs.CPU30.SCH=
ED
>>>        25884           +18.5%      30681 =C2=B1  2%  softirqs.CPU31.SCH=
ED
>>>       167289 =C2=B1  2%      +6.3%     177832 =C2=B1  6%  softirqs.CPU3=
1.TIMER
>>>        26095           +17.1%      30563 =C2=B1  3%  softirqs.CPU32.SCH=
ED
>>>       161186 =C2=B1  2%     +10.6%     178192 =C2=B1  4%  softirqs.CPU3=
2.TIMER
>>>        26124           +18.2%      30887 =C2=B1  3%  softirqs.CPU33.SCH=
ED
>>>        25966           +18.0%      30651 =C2=B1  2%  softirqs.CPU34.SCH=
ED
>>>       167402 =C2=B1  4%      +6.6%     178425 =C2=B1  4%  softirqs.CPU3=
4.TIMER
>>>        25944           +18.0%      30622 =C2=B1  3%  softirqs.CPU35.SCH=
ED
>>>        26167           +17.9%      30861 =C2=B1  2%  softirqs.CPU36.SCH=
ED
>>>        25900           +20.7%      31271 =C2=B1  3%  softirqs.CPU37.SCH=
ED
>>>        25475 =C2=B1  3%     +21.1%      30843 =C2=B1  3%  softirqs.CPU3=
8.SCHED
>>>        25642 =C2=B1  2%     +19.4%      30627 =C2=B1  3%  softirqs.CPU3=
9.SCHED
>>>        25494 =C2=B1  2%     +20.7%      30774 =C2=B1  2%  softirqs.CPU4=
.SCHED
>>>        25610           +18.1%      30236 =C2=B1  4%  softirqs.CPU40.SCH=
ED
>>>        26064 =C2=B1  3%     +17.2%      30546 =C2=B1  3%  softirqs.CPU4=
1.SCHED
>>>        25739 =C2=B1  2%     +15.2%      29643 =C2=B1  4%  softirqs.CPU4=
2.SCHED
>>>        25730 =C2=B1  2%     +18.5%      30493 =C2=B1  3%  softirqs.CPU4=
3.SCHED
>>>       175037 =C2=B1  6%     +10.6%     193664 =C2=B1  4%  softirqs.CPU4=
3.TIMER
>>>        25729           +18.4%      30470 =C2=B1  3%  softirqs.CPU44.SCH=
ED
>>>        25114 =C2=B1  2%     +21.3%      30475 =C2=B1  2%  softirqs.CPU4=
5.SCHED
>>>        25415 =C2=B1  3%     +20.1%      30511 =C2=B1  2%  softirqs.CPU4=
6.SCHED
>>>        25558           +17.4%      29994        softirqs.CPU47.SCHED
>>>        25624           +16.7%      29897 =C2=B1  4%  softirqs.CPU48.SCH=
ED
>>>       167429 =C2=B1  5%     +13.0%     189268 =C2=B1  5%  softirqs.CPU4=
8.TIMER
>>>        25871           +17.3%      30344 =C2=B1  3%  softirqs.CPU49.SCH=
ED
>>>       167694 =C2=B1  3%     +12.5%     188683 =C2=B1  4%  softirqs.CPU4=
9.TIMER
>>>        25681           +20.0%      30819 =C2=B1  3%  softirqs.CPU5.SCHED
>>>        25661           +17.8%      30220        softirqs.CPU50.SCHED
>>>        25857           +17.6%      30408 =C2=B1  3%  softirqs.CPU51.SCH=
ED
>>>        25943           +17.7%      30544 =C2=B1  3%  softirqs.CPU52.SCH=
ED
>>>        25398 =C2=B1  2%     +19.6%      30387 =C2=B1  3%  softirqs.CPU5=
3.SCHED
>>>        25599 =C2=B1  2%     +18.9%      30428 =C2=B1  3%  softirqs.CPU5=
4.SCHED
>>>        25454 =C2=B1  2%     +20.5%      30663 =C2=B1  3%  softirqs.CPU5=
5.SCHED
>>>        25603 =C2=B1  2%     +18.6%      30374 =C2=B1  3%  softirqs.CPU5=
6.SCHED
>>>        25665           +18.7%      30453 =C2=B1  3%  softirqs.CPU57.SCH=
ED
>>>        25853           +18.9%      30740 =C2=B1  2%  softirqs.CPU58.SCH=
ED
>>>        25916           +17.5%      30454 =C2=B1  3%  softirqs.CPU59.SCH=
ED
>>>        26202           +16.7%      30570 =C2=B1  3%  softirqs.CPU6.SCHED
>>>        25549 =C2=B1  2%     +20.5%      30778 =C2=B1  2%  softirqs.CPU6=
0.SCHED
>>>        25854           +18.5%      30626 =C2=B1  2%  softirqs.CPU61.SCH=
ED
>>>        25516 =C2=B1  2%     +17.1%      29871 =C2=B1  4%  softirqs.CPU6=
2.SCHED
>>>        25833           +17.2%      30284 =C2=B1  3%  softirqs.CPU63.SCH=
ED
>>>        25510 =C2=B1  3%     +19.2%      30420 =C2=B1  3%  softirqs.CPU6=
4.SCHED
>>>        26177           +16.5%      30487 =C2=B1  3%  softirqs.CPU65.SCH=
ED
>>>       166747 =C2=B1  3%     +11.5%     185900 =C2=B1  3%  softirqs.CPU6=
5.TIMER
>>>        25637 =C2=B1  2%     +19.0%      30503 =C2=B1  3%  softirqs.CPU6=
6.SCHED
>>>        25644 =C2=B1  2%     +15.4%      29588        softirqs.CPU67.SCH=
ED
>>>        25796           +18.6%      30585 =C2=B1  3%  softirqs.CPU68.SCH=
ED
>>>        25503           +20.2%      30654 =C2=B1  3%  softirqs.CPU69.SCH=
ED
>>>        25912           +16.4%      30171 =C2=B1  4%  softirqs.CPU7.SCHED
>>>        25994 =C2=B1  6%     +16.2%      30203        softirqs.CPU70.SCH=
ED
>>>        25255           +17.9%      29766 =C2=B1  3%  softirqs.CPU71.SCH=
ED
>>>        25057           +19.1%      29854 =C2=B1  3%  softirqs.CPU72.SCH=
ED
>>>        24925 =C2=B1  2%     +18.7%      29588 =C2=B1  2%  softirqs.CPU7=
3.SCHED
>>>        25774           +16.1%      29929 =C2=B1  3%  softirqs.CPU74.SCH=
ED
>>>       177035 =C2=B1  2%      +7.9%     190942 =C2=B1  4%  softirqs.CPU7=
4.TIMER
>>>        25433           +19.2%      30327 =C2=B1  3%  softirqs.CPU75.SCH=
ED
>>>        25274 =C2=B1  2%     +15.5%      29184 =C2=B1  3%  softirqs.CPU7=
6.SCHED
>>>        25297           +17.7%      29765 =C2=B1  4%  softirqs.CPU77.SCH=
ED
>>>        25557 =C2=B1  2%     +18.2%      30203 =C2=B1  3%  softirqs.CPU7=
8.SCHED
>>>        25604 =C2=B1  2%     +17.3%      30034 =C2=B1  3%  softirqs.CPU7=
9.SCHED
>>>       175758 =C2=B1  6%      +9.8%     193033 =C2=B1  3%  softirqs.CPU7=
9.TIMER
>>>        26086           +18.4%      30878 =C2=B1  2%  softirqs.CPU8.SCHED
>>>        25297           +18.6%      30013 =C2=B1  3%  softirqs.CPU80.SCH=
ED
>>>        25450           +17.8%      29987 =C2=B1  2%  softirqs.CPU81.SCH=
ED
>>>        25125 =C2=B1  3%     +17.0%      29404 =C2=B1  3%  softirqs.CPU8=
2.SCHED
>>>        24840 =C2=B1  2%     +18.7%      29490 =C2=B1  6%  softirqs.CPU8=
3.SCHED
>>>        25920           +14.9%      29770 =C2=B1  2%  softirqs.CPU84.SCH=
ED
>>>       168708 =C2=B1  5%     +18.4%     199703 =C2=B1  7%  softirqs.CPU8=
4.TIMER
>>>        24980 =C2=B1  3%     +19.5%      29850 =C2=B1  3%  softirqs.CPU8=
5.SCHED
>>>        25338           +18.6%      30042 =C2=B1  2%  softirqs.CPU86.SCH=
ED
>>>        25404 =C2=B1  2%     +18.6%      30142 =C2=B1  2%  softirqs.CPU8=
7.SCHED
>>>       177099 =C2=B1  3%      +9.0%     193072        softirqs.CPU87.TIM=
ER
>>>        24855 =C2=B1  2%     +20.7%      30000 =C2=B1  3%  softirqs.CPU8=
8.SCHED
>>>        25532 =C2=B1  2%     +17.2%      29916 =C2=B1  3%  softirqs.CPU8=
9.SCHED
>>>        26321 =C2=B1  2%     +14.7%      30186 =C2=B1  4%  softirqs.CPU9=
.SCHED
>>>        25622 =C2=B1  2%     +17.4%      30077 =C2=B1  3%  softirqs.CPU9=
0.SCHED
>>>       177491 =C2=B1  4%     +10.9%     196822 =C2=B1  4%  softirqs.CPU9=
0.TIMER
>>>        25638 =C2=B1  2%     +14.0%      29228 =C2=B1  5%  softirqs.CPU9=
1.SCHED
>>>       175040 =C2=B1  5%     +16.7%     204221 =C2=B1  6%  softirqs.CPU9=
1.TIMER
>>>        25387 =C2=B1  2%     +18.0%      29968 =C2=B1  2%  softirqs.CPU9=
2.SCHED
>>>        25316 =C2=B1  2%     +19.5%      30262 =C2=B1  2%  softirqs.CPU9=
3.SCHED
>>>        25125 =C2=B1  2%     +19.6%      30051        softirqs.CPU94.SCH=
ED
>>>        25303 =C2=B1  2%     +18.1%      29875 =C2=B1  2%  softirqs.CPU9=
5.SCHED
>>>        25481           +18.3%      30133 =C2=B1  3%  softirqs.CPU96.SCH=
ED
>>>        25533           +18.1%      30146 =C2=B1  3%  softirqs.CPU97.SCH=
ED
>>>        24892 =C2=B1  3%     +20.4%      29982 =C2=B1  3%  softirqs.CPU9=
8.SCHED
>>>        24611           +20.3%      29607 =C2=B1  3%  softirqs.CPU99.SCH=
ED
>>>      7325587           +18.2%    8660780 =C2=B1  3%  softirqs.SCHED
>>>
>>>
>>>                              will-it-scale.per_thread_ops
>>>     1500 +-------------------------------------------------------------=
-------+
>>>     1450 |+. +.  .+  +++. +.  .+++. +.  .++. +                         =
       |
>>>          |  +  ++        +  ++     +  ++    + +   .++.+                =
       |
>>>     1400 |-+                                   : +     +               =
       |
>>>     1350 |-+                                   : :                     =
OO     |
>>>     1300 |-+                                    +                    O =
       |
>>>     1250 |-+                                       OO            O OO  =
   OO O|
>>>          |               O  OO O O OO OO O                             =
       |
>>>     1200 |-+              O     O                      OO OO OO O      =
       |
>>>     1150 |-+                                    O                      =
       |
>>>     1100 |-+                              O O    O    O                =
       |
>>>     1050 |O+O      O O O                      O                        =
       |
>>>          |     O  O   O                      O                         =
       |
>>>     1000 |-+ O  O                                                      =
       |
>>>      950 +-------------------------------------------------------------=
-------+
>>> [*] bisect-good sample
>>> [O] bisect-bad  sample
>>>
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
>>> Rong Chen
>>>
>>>
>>> _______________________________________________
>>> LKP mailing list -- lkp(a)lists.01.org
>>> To unsubscribe send an email to lkp-leave(a)lists.01.org
>>>
>>
>> -- =

>> Zhengjun Xing

-- =

Zhengjun Xing
--===============0180364616901618789==--

