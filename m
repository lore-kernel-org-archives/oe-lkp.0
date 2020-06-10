Content-Type: multipart/mixed; boundary="===============0842814801118988884=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [ima] 8eb613c0b8: stress-ng.icache.ops_per_sec -84.2% regression
Date: Wed, 10 Jun 2020 11:21:13 +0800
Message-ID: <099cfe59-1601-a0fc-3849-13eee8754130@linux.intel.com>
In-Reply-To: <20200603091150.GH12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0842814801118988884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mimi,

     Do you have time to take a look at this? we noticed a 3.7% =

regression of boot-time.dhcp and a 84.2% regression of =

stress-ng.icache.ops_per_sec. Thanks.

On 6/3/2020 5:11 PM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 3.7% regression of boot-time.dhcp due to commit:
> =

> =

> commit: 8eb613c0b8f19627ba1846dcf78bb2c85edbe8dd ("ima: verify mprotect c=
hange is consistent with mmap policy")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: stress-ng
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 192G memory
> with following parameters:
> =

> 	nr_threads: 100%
> 	disk: 1HDD
> 	testtime: 30s
> 	class: cpu-cache
> 	cpufreq_governor: performance
> 	ucode: 0x500002c
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_group=
/testcase/testtime/ucode:
>    cpu-cache/gcc-9/performance/1HDD/x86_64-rhel-7.6/100%/debian-x86_64-20=
191114.cgz/lkp-csl-2sp5/stress-ng/30s/0x500002c
> =

> commit:
>    0c4395fb2a ("evm: Fix possible memory leak in evm_calc_hmac_or_hash()")
>    8eb613c0b8 ("ima: verify mprotect change is consistent with mmap polic=
y")
> =

> 0c4395fb2aa77341 8eb613c0b8f19627ba1846dcf78
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :4           25%           1:4     dmesg.WARNING:at#for_ip_in=
terrupt_entry/0x
>            0:4            3%           0:4     perf-profile.children.cycl=
es-pp.error_entry
>           %stddev     %change         %stddev
>               \          |                \
>     1245570           -84.2%     197151        stress-ng.icache.ops
>       41517           -84.2%       6570        stress-ng.icache.ops_per_s=
ec
>   1.306e+09           -82.1%  2.338e+08        stress-ng.time.minor_page_=
faults
>        2985           +13.5%       3387        stress-ng.time.system_time
>        4.28           +13.1%       4.85        iostat.cpu.system
>        4.18            +0.6        4.73        mpstat.cpu.all.sys%
>       10121            +9.6%      11096 =C2=B1  3%  softirqs.CPU67.SCHED
>      203299            -4.2%     194854 =C2=B1  5%  vmstat.system.in
>       26.91            +2.8%      27.67 =C2=B1  3%  boot-time.boot
>       16.34            +3.7%      16.94 =C2=B1  2%  boot-time.dhcp
>        2183 =C2=B1  3%      +3.7%       2263        boot-time.idle
>     1042938 =C2=B1 80%   +8208.2%   86649242 =C2=B1156%  cpuidle.C1.time
>       48428 =C2=B1114%   +1842.4%     940677 =C2=B1151%  cpuidle.C1.usage
>       15748 =C2=B1 28%    +301.0%      63144 =C2=B1 79%  cpuidle.POLL.usa=
ge
>       61300 =C2=B1  4%     +82.8%     112033 =C2=B1 11%  numa-vmstat.node=
1.nr_active_anon
>       47060 =C2=B1  3%    +106.8%      97323 =C2=B1 12%  numa-vmstat.node=
1.nr_anon_pages
>       42.67 =C2=B1  2%    +217.0%     135.25 =C2=B1 14%  numa-vmstat.node=
1.nr_anon_transparent_hugepages
>       61301 =C2=B1  4%     +82.8%     112032 =C2=B1 11%  numa-vmstat.node=
1.nr_zone_active_anon
>        3816 =C2=B1  2%      +3.0%       3931        proc-vmstat.nr_page_t=
able_pages
>    35216541            +2.9%   36244047        proc-vmstat.pgalloc_normal
>   1.308e+09           -82.0%  2.356e+08        proc-vmstat.pgfault
>    35173363            +2.8%   36173843        proc-vmstat.pgfree
>      248171 =C2=B1  5%     +82.5%     452893 =C2=B1 11%  numa-meminfo.nod=
e1.Active
>      244812 =C2=B1  4%     +83.5%     449116 =C2=B1 11%  numa-meminfo.nod=
e1.Active(anon)
>       88290 =C2=B1  3%    +214.4%     277591 =C2=B1 15%  numa-meminfo.nod=
e1.AnonHugePages
>      187940 =C2=B1  3%    +107.8%     390486 =C2=B1 12%  numa-meminfo.nod=
e1.AnonPages
>     1366813 =C2=B1  3%     +12.0%    1530428 =C2=B1  6%  numa-meminfo.nod=
e1.MemUsed
>      571.00 =C2=B1  8%     +10.4%     630.50 =C2=B1  8%  slabinfo.UDP.act=
ive_objs
>      571.00 =C2=B1  8%     +10.4%     630.50 =C2=B1  8%  slabinfo.UDP.num=
_objs
>      300.00 =C2=B1  5%     +20.0%     360.00 =C2=B1 10%  slabinfo.kmem_ca=
che.active_objs
>      300.00 =C2=B1  5%     +20.0%     360.00 =C2=B1 10%  slabinfo.kmem_ca=
che.num_objs
>      606.33 =C2=B1  4%     +17.6%     713.00 =C2=B1  8%  slabinfo.kmem_ca=
che_node.active_objs
>      661.33 =C2=B1  4%     +16.1%     768.00 =C2=B1  8%  slabinfo.kmem_ca=
che_node.num_objs
>      114561 =C2=B1 23%     -34.3%      75239 =C2=B1  7%  sched_debug.cfs_=
rq:/.load.max
>       14869 =C2=B1 22%     -36.6%       9424 =C2=B1  8%  sched_debug.cfs_=
rq:/.load.stddev
>     4040842 =C2=B1  5%     +18.0%    4767515 =C2=B1 13%  sched_debug.cpu.=
avg_idle.max
>     2019061 =C2=B1  8%     +25.5%    2534134 =C2=B1 14%  sched_debug.cpu.=
max_idle_balance_cost.max
>      378044 =C2=B1  3%     +22.5%     463135 =C2=B1  8%  sched_debug.cpu.=
max_idle_balance_cost.stddev
>       41605           +12.6%      46852 =C2=B1  2%  sched_debug.cpu.nr_sw=
itches.max
>       44445 =C2=B1  2%     +11.8%      49668 =C2=B1  3%  sched_debug.cpu.=
sched_count.max
>        7704 =C2=B1  8%     +26.6%       9753 =C2=B1 14%  sched_debug.cpu.=
sched_goidle.max
>      584.16 =C2=B1  4%    +135.0%       1372 =C2=B1 57%  sched_debug.cpu.=
sched_goidle.stddev
>        1416 =C2=B1  3%     +32.2%       1873 =C2=B1 19%  sched_debug.cpu.=
ttwu_local.stddev
>        0.33 =C2=B1141%  +18200.0%      61.00 =C2=B1152%  interrupts.40:PC=
I-MSI.31981573-edge.i40e-eth0-TxRx-4
>       79.67 =C2=B1124%     -99.1%       0.75 =C2=B1110%  interrupts.89:PC=
I-MSI.31981622-edge.i40e-eth0-TxRx-53
>        6318           +44.6%       9134 =C2=B1  6%  interrupts.CPU1.RES:R=
escheduling_interrupts
>        5245 =C2=B1 35%     +50.1%       7871        interrupts.CPU11.NMI:=
Non-maskable_interrupts
>        5245 =C2=B1 35%     +50.1%       7871        interrupts.CPU11.PMI:=
Performance_monitoring_interrupts
>       67.00 =C2=B1 58%     -79.9%      13.50 =C2=B1 76%  interrupts.CPU16=
.TLB:TLB_shootdowns
>      861.67           +39.1%       1198 =C2=B1 31%  interrupts.CPU23.RES:=
Rescheduling_interrupts
>      796.33 =C2=B1  2%      +9.4%     871.50 =C2=B1  2%  interrupts.CPU34=
.RES:Rescheduling_interrupts
>        0.33 =C2=B1141%  +18125.0%      60.75 =C2=B1153%  interrupts.CPU4.=
40:PCI-MSI.31981573-edge.i40e-eth0-TxRx-4
>        1271 =C2=B1 43%     +47.2%       1872 =C2=B1 26%  interrupts.CPU51=
.RES:Rescheduling_interrupts
>       79.33 =C2=B1125%     -99.4%       0.50 =C2=B1173%  interrupts.CPU53=
.89:PCI-MSI.31981622-edge.i40e-eth0-TxRx-53
>      844.00 =C2=B1  2%     +63.7%       1381 =C2=B1 34%  interrupts.CPU6.=
RES:Rescheduling_interrupts
>      786.00 =C2=B1  4%     +21.2%     953.00 =C2=B1 13%  interrupts.CPU69=
.RES:Rescheduling_interrupts
>      855.67 =C2=B1 11%     +96.3%       1679 =C2=B1 60%  interrupts.CPU8.=
RES:Rescheduling_interrupts
>      178.33 =C2=B1 43%     -81.2%      33.50 =C2=B1 85%  interrupts.CPU8.=
TLB:TLB_shootdowns
>      820.67 =C2=B1  9%     -18.8%     666.25 =C2=B1  9%  interrupts.CPU82=
.RES:Rescheduling_interrupts
>   4.464e+10            -2.9%  4.336e+10        perf-stat.i.branch-instruc=
tions
>        2.65            +0.1        2.73        perf-stat.i.branch-miss-ra=
te%
>        6.32 =C2=B1  3%      +5.3%       6.65 =C2=B1  2%  perf-stat.i.cpi
>    19226980            -8.5%   17587852        perf-stat.i.dTLB-load-miss=
es
>    5.17e+10            -3.5%  4.989e+10        perf-stat.i.dTLB-loads
>     5874100           -52.1%    2811682        perf-stat.i.dTLB-store-mis=
ses
>   1.968e+10            -5.4%  1.861e+10        perf-stat.i.dTLB-stores
>     6448559 =C2=B1  3%     -45.3%    3527950 =C2=B1  9%  perf-stat.i.iTLB=
-load-misses
>    31409753 =C2=B1  4%     -53.3%   14680095 =C2=B1  3%  perf-stat.i.iTLB=
-loads
>   2.267e+11            -2.9%  2.201e+11        perf-stat.i.instructions
>        0.93            -2.7%       0.91        perf-stat.i.ipc
>        1155            -3.9%       1110        perf-stat.i.metric.M/sec
>     1819587           -82.9%     311898        perf-stat.i.minor-faults
>     1819587           -82.9%     311898        perf-stat.i.page-faults
>        3.49            +3.3%       3.61        perf-stat.overall.MPKI
>        2.26            +0.1        2.32        perf-stat.overall.branch-m=
iss-rate%
>        1.08            +3.5%       1.12        perf-stat.overall.cpi
>        0.04            -0.0        0.04        perf-stat.overall.dTLB-loa=
d-miss-rate%
>        0.03            -0.0        0.02        perf-stat.overall.dTLB-sto=
re-miss-rate%
>       17.10            +2.4       19.49 =C2=B1  6%  perf-stat.overall.iTL=
B-load-miss-rate%
>       35144 =C2=B1  2%     +75.7%      61761 =C2=B1  8%  perf-stat.overal=
l.instructions-per-iTLB-miss
>        0.92            -3.3%       0.89        perf-stat.overall.ipc
>   4.286e+10            -3.0%  4.156e+10        perf-stat.ps.branch-instru=
ctions
>    18403186            -8.6%   16825390        perf-stat.ps.dTLB-load-mis=
ses
>   4.958e+10            -3.6%  4.778e+10        perf-stat.ps.dTLB-loads
>     5647388           -51.3%    2750721        perf-stat.ps.dTLB-store-mi=
sses
>   1.886e+10            -5.5%  1.782e+10        perf-stat.ps.dTLB-stores
>     6190595 =C2=B1  2%     -44.4%    3440326 =C2=B1  9%  perf-stat.ps.iTL=
B-load-misses
>    30030226 =C2=B1  4%     -52.8%   14185074 =C2=B1  3%  perf-stat.ps.iTL=
B-loads
>   2.174e+11            -3.1%  2.107e+11        perf-stat.ps.instructions
>     1737379           -82.0%     312180        perf-stat.ps.minor-faults
>     1737379           -82.0%     312180        perf-stat.ps.page-faults
>   1.635e+14            -3.1%  1.585e+14        perf-stat.total.instructio=
ns
>        0.97 =C2=B1  3%      -0.3        0.70 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.new_sync=
_write.vfs_write.ksys_write
>        0.97 =C2=B1  3%      -0.3        0.70 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.generic_perform_write.__generic_file_write_iter.generic_fi=
le_write_iter.new_sync_write.vfs_write
>        0.98 =C2=B1  4%      -0.3        0.71 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>        0.98 =C2=B1  4%      -0.3        0.71 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.generic_file_write_iter.new_sync_write.vfs_write.ksys_writ=
e.do_syscall_64
>        0.99 =C2=B1  3%      -0.2        0.74 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.__GI___libc_write
>        1.02 =C2=B1  3%      -0.2        0.77 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.perf_mmap__push.cmd_record.main.__libc_start_main
>        1.00 =C2=B1  4%      -0.2        0.76 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__GI___libc_write.perf_mmap__push.cmd_record.main.__libc_s=
tart_main
>        0.99 =C2=B1  3%      -0.2        0.75 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__=
GI___libc_write.perf_mmap__push
>        0.99 =C2=B1  3%      -0.2        0.76 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_write.perf_mmap=
__push.cmd_record.main
>        0.99 =C2=B1  3%      -0.2        0.76 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_w=
rite.perf_mmap__push.cmd_record
>        2.99 =C2=B1  5%      +0.4        3.37 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_inte=
rrupt.smp_apic_timer_interrupt.apic_timer_interrupt
>        2.06 =C2=B1  9%      +0.4        2.45 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.update_curr.task_tick_fair.scheduler_tick.update_process_t=
imes.tick_sched_handle
>        2.43 =C2=B1  7%      +0.4        2.84 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.native_write_msr.lapic_next_deadline.clockevents_program_e=
vent.hrtimer_interrupt.smp_apic_timer_interrupt
>        0.17 =C2=B1141%      +0.4        0.60 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock_irqsave.rcu_core.__softirqentry_text_start.=
irq_exit.smp_apic_timer_interrupt
>        0.19 =C2=B1141%      +0.5        0.68 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.reweight_entity.task_tick_fair.scheduler_tick.update_proce=
ss_times.tick_sched_handle
>        1.50 =C2=B1 15%      +0.5        2.03 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.native_write_msr.__intel_pmu_enable_all.perf_mux_hrtimer_h=
andler.__hrtimer_run_queues.hrtimer_interrupt
>        1.57 =C2=B1 16%      +0.6        2.12 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.__intel_pmu_enable_all.perf_mux_hrtimer_handler.__hrtimer_=
run_queues.hrtimer_interrupt.smp_apic_timer_interrupt
>        3.58 =C2=B1 15%      +1.0        4.63 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_inte=
rrupt.smp_apic_timer_interrupt.apic_timer_interrupt
>        3.94 =C2=B1  3%      +1.7        5.69 =C2=B1 28%  perf-profile.cal=
ltrace.cycles-pp.hrtimer_active.task_tick_fair.scheduler_tick.update_proces=
s_times.tick_sched_handle
>       34.96 =C2=B1  5%      +3.2       38.16 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.sm=
p_apic_timer_interrupt.apic_timer_interrupt
>       41.63 =C2=B1  5%      +4.8       46.42 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_inte=
rrupt.apic_timer_interrupt
>       19.35 =C2=B1  3%      +5.8       25.16 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__=
hrtimer_run_queues.hrtimer_interrupt
>        0.41 =C2=B1 55%      -0.3        0.09 =C2=B1 55%  perf-profile.chi=
ldren.cycles-pp.alloc_pages_vma
>        1.22 =C2=B1  2%      -0.3        0.91 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.new_sync_write
>        1.26            -0.3        0.96 =C2=B1 13%  perf-profile.children=
.cycles-pp.ksys_write
>        1.23            -0.3        0.94 =C2=B1 15%  perf-profile.children=
.cycles-pp.vfs_write
>        0.98 =C2=B1  4%      -0.3        0.71 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__generic_file_write_iter
>        0.98 =C2=B1  4%      -0.3        0.71 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.generic_perform_write
>        0.99 =C2=B1  5%      -0.3        0.72 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.generic_file_write_iter
>        1.02 =C2=B1  3%      -0.2        0.77 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.perf_mmap__push
>        1.00 =C2=B1  4%      -0.2        0.76 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__GI___libc_write
>        0.16 =C2=B1 10%      -0.1        0.07 =C2=B1 60%  perf-profile.chi=
ldren.cycles-pp.hrtimer_run_queues
>        0.15 =C2=B1 22%      -0.1        0.09 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.run_posix_cpu_timers
>        0.33 =C2=B1  8%      -0.1        0.27 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.rcu_irq_enter
>        0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.path_lookupat
>        0.04 =C2=B1 71%      +0.0        0.08 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.filename_lookup
>        0.20 =C2=B1 22%      +0.0        0.25 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.tick_program_event
>        0.20 =C2=B1 23%      +0.1        0.26 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.cmd_stat
>        0.02 =C2=B1141%      +0.1        0.08 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.vsnprintf
>        0.00            +0.1        0.06 =C2=B1 14%  perf-profile.children=
.cycles-pp.lookup_fast
>        0.12 =C2=B1 26%      +0.1        0.18 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.enqueue_entity
>        0.03 =C2=B1141%      +0.1        0.09 =C2=B1 39%  perf-profile.chi=
ldren.cycles-pp.pagevec_lru_move_fn
>        0.02 =C2=B1141%      +0.1        0.09 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_mprotect
>        0.02 =C2=B1141%      +0.1        0.09 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_mprotect_pkey
>        0.19 =C2=B1 38%      +0.1        0.26 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.update_min_vruntime
>        0.16 =C2=B1 29%      +0.1        0.23 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.iov_iter_fault_in_readable
>        0.19 =C2=B1  5%      +0.1        0.27 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.copy_process
>        0.25 =C2=B1 14%      +0.1        0.33 =C2=B1 29%  perf-profile.chi=
ldren.cycles-pp.__do_sys_clone
>        0.25 =C2=B1 14%      +0.1        0.33 =C2=B1 29%  perf-profile.chi=
ldren.cycles-pp._do_fork
>        0.12 =C2=B1 13%      +0.1        0.21 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.activate_task
>        0.14 =C2=B1 18%      +0.1        0.23 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.enqueue_task_fair
>        0.11 =C2=B1 29%      +0.1        0.20 =C2=B1 41%  perf-profile.chi=
ldren.cycles-pp.rebalance_domains
>        0.04 =C2=B1 71%      +0.1        0.13 =C2=B1 43%  perf-profile.chi=
ldren.cycles-pp.cpuacct_account_field
>        0.12 =C2=B1 22%      +0.1        0.21 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.ttwu_do_activate
>        0.29 =C2=B1 10%      +0.1        0.40 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.__libc_fork
>        0.00            +0.1        0.11 =C2=B1 48%  perf-profile.children=
.cycles-pp.i40e_handle_lldp_event
>        0.00            +0.1        0.11 =C2=B1 48%  perf-profile.children=
.cycles-pp.i40e_asq_send_command
>        0.33 =C2=B1  6%      +0.1        0.44 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.forkshell
>        0.00            +0.1        0.11 =C2=B1 42%  perf-profile.children=
.cycles-pp.i40e_clean_adminq_subtask
>        0.63            +0.1        0.75 =C2=B1 14%  perf-profile.children=
.cycles-pp._raw_spin_lock_irq
>        0.02 =C2=B1141%      +0.1        0.14 =C2=B1 62%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_poll
>        0.09 =C2=B1 13%      +0.1        0.21 =C2=B1 51%  perf-profile.chi=
ldren.cycles-pp.change_prot_numa
>        0.00            +0.1        0.12 =C2=B1 43%  perf-profile.children=
.cycles-pp.i40e_service_task
>        0.57 =C2=B1 14%      +0.1        0.70 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.handle_mm_fault
>        0.02 =C2=B1141%      +0.1        0.15 =C2=B1 55%  perf-profile.chi=
ldren.cycles-pp.poll
>        0.85            +0.2        1.07 =C2=B1 13%  perf-profile.children=
.cycles-pp.interrupt_entry
>        1.55 =C2=B1  5%      +0.3        1.80 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.read_tsc
>        0.49 =C2=B1 24%      +0.3        0.76 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.reweight_entity
>        0.62 =C2=B1 10%      +0.3        0.90 =C2=B1 29%  perf-profile.chi=
ldren.cycles-pp._raw_spin_unlock_irqrestore
>        0.27 =C2=B1 28%      +0.4        0.63 =C2=B1 33%  perf-profile.chi=
ldren.cycles-pp.account_user_time
>        3.00 =C2=B1  5%      +0.4        3.38 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.lapic_next_deadline
>        2.20 =C2=B1  8%      +0.4        2.62 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.update_curr
>        1.58 =C2=B1 15%      +0.6        2.13 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__intel_pmu_enable_all
>        0.31 =C2=B1141%      +0.6        0.90 =C2=B1 39%  perf-profile.chi=
ldren.cycles-pp.wake_up_klogd_work_func
>        4.11 =C2=B1  9%      +1.0        5.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.native_write_msr
>        3.62 =C2=B1 15%      +1.1        4.68 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.perf_mux_hrtimer_handler
>        3.95 =C2=B1  3%      +1.7        5.70 =C2=B1 29%  perf-profile.chi=
ldren.cycles-pp.hrtimer_active
>       34.98 =C2=B1  5%      +3.2       38.18 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.tick_sched_timer
>       15.44            +3.7       19.12 =C2=B1 18%  perf-profile.children=
.cycles-pp.scheduler_tick
>       41.67 =C2=B1  5%      +4.8       46.49 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__hrtimer_run_queues
>       19.36 =C2=B1  3%      +5.8       25.18 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.update_process_times
>        0.33 =C2=B1  8%      -0.1        0.27 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.rcu_irq_enter
>        0.15 =C2=B1 23%      -0.1        0.09 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.run_posix_cpu_timers
>        0.20 =C2=B1 22%      +0.0        0.24 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.tick_program_event
>        0.10 =C2=B1 12%      +0.1        0.17 =C2=B1 23%  perf-profile.sel=
f.cycles-pp.unmap_page_range
>        0.07 =C2=B1 30%      +0.1        0.13 =C2=B1 31%  perf-profile.sel=
f.cycles-pp.rcu_irq_exit
>        0.00            +0.1        0.06 =C2=B1 20%  perf-profile.self.cyc=
les-pp.select_idle_sibling
>        0.18 =C2=B1 35%      +0.1        0.26 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.update_min_vruntime
>        0.04 =C2=B1 71%      +0.1        0.13 =C2=B1 43%  perf-profile.sel=
f.cycles-pp.cpuacct_account_field
>        0.05 =C2=B1 78%      +0.1        0.14 =C2=B1 49%  perf-profile.sel=
f.cycles-pp.change_pte_range
>        0.20 =C2=B1 21%      +0.1        0.32 =C2=B1 19%  perf-profile.sel=
f.cycles-pp.irq_exit
>        0.13 =C2=B1  3%      +0.1        0.27 =C2=B1 29%  perf-profile.sel=
f.cycles-pp.copy_user_enhanced_fast_string
>        0.37 =C2=B1 31%      +0.2        0.57 =C2=B1 21%  perf-profile.sel=
f.cycles-pp.reweight_entity
>        0.84 =C2=B1  2%      +0.2        1.07 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.interrupt_entry
>        0.62 =C2=B1  8%      +0.3        0.87 =C2=B1 29%  perf-profile.sel=
f.cycles-pp._raw_spin_unlock_irqrestore
>        1.49 =C2=B1  6%      +0.3        1.75 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.read_tsc
>        0.22 =C2=B1 31%      +0.3        0.50 =C2=B1 33%  perf-profile.sel=
f.cycles-pp.account_user_time
>        1.47            +0.4        1.91 =C2=B1 13%  perf-profile.self.cyc=
les-pp.update_curr
>        4.10 =C2=B1 10%      +1.0        5.05 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.native_write_msr
>        3.93 =C2=B1  3%      +1.8        5.70 =C2=B1 29%  perf-profile.sel=
f.cycles-pp.hrtimer_active
> =

> =

>                                                                          =
        =

>                              stress-ng.time.system_time
>                                                                          =
        =

>    3500 +----------------------------------------------------------------=
----+
>         |  O  O  O  O O  O  O  O  O     O  O O  O  O  O             O    =
    |
>    3000 |..+..+..+..+.+..+..+..+..+..+..+..+.+..+..+..+..+..+     +.+..+ =
    |
>         |                                                   :     :      =
    |
>    2500 |-+                                                  :    :      =
    |
>         |                                                    :   :       =
    |
>    2000 |-+                                                  :   :       =
    |
>         |                                                    :   :       =
    |
>    1500 |-+                                                   :  :       =
    |
>         |                                                     : :        =
    |
>    1000 |-+                                                   : :        =
    |
>         |                                                     : :        =
    |
>     500 |-+                                                    ::        =
    |
>         |                                                      :         =
    |
>       0 +----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                             stress-ng.time.minor_page_faults
>                                                                          =
        =

>    1.4e+09 +-------------------------------------------------------------=
----+
>            |..+..+.+..+..+..+.+..+..+..+.+..+..+..+.+..+..+..+    +..+..+=
    |
>    1.2e+09 |-+                                               :    :      =
    |
>            |                                                 :    :      =
    |
>      1e+09 |-+                                               :   :       =
    |
>            |                                                  :  :       =
    |
>      8e+08 |-+                                                :  :       =
    |
>            |                                                  :  :       =
    |
>      6e+08 |-+                                                : :        =
    |
>            |                                                  : :        =
    |
>      4e+08 |-+                                                : :        =
    |
>            |                                                   ::        =
    |
>      2e+08 |-+O  O O  O  O  O O  O  O    O  O  O  O O  O  O  O :  O  O  O=
 O  |
>            |                                                   :         =
    |
>          0 +-------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                   stress-ng.icache.ops
>                                                                          =
        =

>    1.4e+06 +-------------------------------------------------------------=
----+
>            |                 .+..                                        =
    |
>    1.2e+06 |..+..+.+..+..+..+    +..+..+.+..+..+..+.+..+..+..+    +..+..+=
    |
>            |                                                 :    :      =
    |
>      1e+06 |-+                                               :    :      =
    |
>            |                                                  :  :       =
    |
>     800000 |-+                                                :  :       =
    |
>            |                                                  :  :       =
    |
>     600000 |-+                                                :  :       =
    |
>            |                                                  : :        =
    |
>     400000 |-+                                                : :        =
    |
>            |                                                   ::        =
    |
>     200000 |-+O  O O  O  O  O O  O  O    O  O  O  O O  O  O  O :: O  O  O=
 O  |
>            |                                                   :         =
    |
>          0 +-------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                              stress-ng.icache.ops_per_sec
>                                                                          =
        =

>    45000 +---------------------------------------------------------------=
----+
>          |..+..+..+.+..+..+..+..+..+.+..+..+..+..+..+.+..+..+     +..+.+ =
    |
>    40000 |-+                                                :     :      =
    |
>    35000 |-+                                                :     :      =
    |
>          |                                                   :   :       =
    |
>    30000 |-+                                                 :   :       =
    |
>    25000 |-+                                                 :   :       =
    |
>          |                                                   :   :       =
    |
>    20000 |-+                                                  : :        =
    |
>    15000 |-+                                                  : :        =
    |
>          |                                                    : :        =
    |
>    10000 |-+                                                  : :        =
    |
>     5000 |-+O  O  O O  O  O  O  O  O    O  O  O  O  O O  O  O  :  O  O O =
 O  |
>          |                                                     :         =
    |
>        0 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

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
> Rong Chen
> =

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============0842814801118988884==--

