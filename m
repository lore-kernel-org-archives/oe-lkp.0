Content-Type: multipart/mixed; boundary="===============0468907580058986244=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, sched] 1567c3e346: vm-scalability.median -15.8% regression
Date: Thu, 16 Apr 2020 14:10:11 +0800
Message-ID: <a5b0b58d-54a9-0f06-c822-3087346a0ae8@linux.intel.com>
In-Reply-To: <20200306051916.GA23395@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0468907580058986244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Giovanni,

   1567c3e346("x86, sched: Add support for frequency invariance") has =

been merged into Linux mainline v5.7-rc1 now. Do you have time to take a =

look at this? Thanks.

On 3/6/2020 1:19 PM, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -15.8% regression of vm-scalability.median due to commi=
t:
> =

> =

> commit: 1567c3e3467cddeb019a7b53ec632f834b6a9239 ("x86, sched: Add suppor=
t for frequency invariance")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: vm-scalability
> on test machine: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz wi=
th 512G memory
> with following parameters:
> =

> 	runtime: 300s
> 	size: 8T
> 	test: anon-cow-seq
> 	cpufreq_governor: performance
> 	ucode: 0x16
> =

> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
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
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tcase/ucode:
>    gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-20191114.cgz/300s/8T/l=
kp-hsw-4ex1/anon-cow-seq/vm-scalability/0x16
> =

> commit:
>    2a4b03ffc6 ("sched/fair: Prevent unlimited runtime on throttled group")
>    1567c3e346 ("x86, sched: Add support for frequency invariance")
> =

> 2a4b03ffc69f2ded 1567c3e3467cddeb019a7b53ec6
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>      210443           -15.8%     177280        vm-scalability.median
>        0.07 =C2=B1  6%     -64.9%       0.02 =C2=B1 16%  vm-scalability.m=
edian_stddev
>    30242018           -16.0%   25399016        vm-scalability.throughput
>      241304 =C2=B1  2%     +53.9%     371337 =C2=B1  2%  vm-scalability.t=
ime.involuntary_context_switches
>     8973780           -12.4%    7862380        vm-scalability.time.minor_=
page_faults
>       10507            +7.6%      11301        vm-scalability.time.percen=
t_of_cpu_this_job_got
>       17759           +22.0%      21664 =C2=B1  2%  vm-scalability.time.s=
ystem_time
>       14801           -10.4%      13262        vm-scalability.time.user_t=
ime
>     1023965           -63.3%     376066 =C2=B1  4%  vm-scalability.time.v=
oluntary_context_switches
>   7.967e+09           -11.1%  7.082e+09        vm-scalability.workload
>        2985           -11.4%       2643 =C2=B1  3%  slabinfo.khugepaged_m=
m_slot.active_objs
>        2985           -11.4%       2643 =C2=B1  3%  slabinfo.khugepaged_m=
m_slot.num_objs
>    36024164           -42.9%   20554898 =C2=B1 40%  cpuidle.C1.time
>   7.277e+09 =C2=B1 41%     -72.1%  2.027e+09 =C2=B1160%  cpuidle.C3.time
>    17453257 =C2=B1 19%     -74.4%    4462508 =C2=B1163%  cpuidle.C3.usage
>      214574 =C2=B1 10%     -50.2%     106926 =C2=B1 33%  cpuidle.POLL.usa=
ge
>       26.26            -5.4       20.89        mpstat.cpu.all.idle%
>        0.02 =C2=B1  8%      -0.0        0.01 =C2=B1  9%  mpstat.cpu.all.i=
owait%
>       40.23            +8.8       49.05        mpstat.cpu.all.sys%
>       33.49            -3.4       30.05 =C2=B1  2%  mpstat.cpu.all.usr%
>     1989988           -20.6%    1580840 =C2=B1  4%  numa-numastat.node1.l=
ocal_node
>     2026261           -20.6%    1608134 =C2=B1  4%  numa-numastat.node1.n=
uma_hit
>     3614123 =C2=B1 44%     -56.4%    1576459 =C2=B1  5%  numa-numastat.no=
de2.local_node
>     3641345 =C2=B1 44%     -56.0%    1603122 =C2=B1  5%  numa-numastat.no=
de2.numa_hit
>       26.50           -20.8%      21.00        vmstat.cpu.id
>       32.75           -10.7%      29.25        vmstat.cpu.us
>        9800           -34.3%       6434        vmstat.system.cs
>      290059            -6.9%     270063 =C2=B1  4%  vmstat.system.in
>   1.012e+08           +12.3%  1.136e+08        meminfo.Active
>   1.012e+08           +12.3%  1.136e+08        meminfo.Active(anon)
>    92123057           +14.3%  1.053e+08        meminfo.AnonHugePages
>   1.009e+08           +12.3%  1.134e+08        meminfo.AnonPages
>   1.044e+08           +11.9%  1.169e+08        meminfo.Memused
>    25495045           +15.0%   29324284        numa-meminfo.node1.Active
>    25494976           +15.0%   29324244        numa-meminfo.node1.Active(=
anon)
>    23164225           +17.2%   27157731        numa-meminfo.node1.AnonHug=
ePages
>    25417044           +15.1%   29267058        numa-meminfo.node1.AnonPag=
es
>    26192254           +14.4%   29959010        numa-meminfo.node1.MemUsed
>    24839952 =C2=B1  3%     +18.2%   29349199        numa-meminfo.node2.Ac=
tive
>    24839901 =C2=B1  3%     +18.2%   29349040        numa-meminfo.node2.Ac=
tive(anon)
>    22604826 =C2=B1  3%     +20.4%   27211067        numa-meminfo.node2.An=
onHugePages
>    24777054 =C2=B1  3%     +18.2%   29282273        numa-meminfo.node2.An=
onPages
>    25718372 =C2=B1  2%     +16.8%   30037056        numa-meminfo.node2.Me=
mUsed
>      199045 =C2=B1 96%     -99.6%     743.75 =C2=B1 52%  numa-meminfo.nod=
e2.PageTables
>       54935 =C2=B1 20%     -24.5%      41470 =C2=B1 10%  numa-meminfo.nod=
e2.SUnreclaim
>      418.75 =C2=B1 94%     -93.7%      26.50 =C2=B1 49%  numa-meminfo.nod=
e3.Inactive(file)
>        4864 =C2=B1 15%     +26.9%       6174 =C2=B1 10%  numa-meminfo.nod=
e3.KernelStack
>       95371 =C2=B1172%    +233.9%     318444 =C2=B1 57%  numa-meminfo.nod=
e3.PageTables
>     6347307           +14.8%    7286035        numa-vmstat.node1.nr_activ=
e_anon
>     6328825           +14.9%    7268986        numa-vmstat.node1.nr_anon_=
pages
>       11261           +16.9%      13162        numa-vmstat.node1.nr_anon_=
transparent_hugepages
>     6347284           +14.8%    7285923        numa-vmstat.node1.nr_zone_=
active_anon
>     1324428           -15.2%    1122566 =C2=B1  3%  numa-vmstat.node1.num=
a_hit
>     1204942           -16.0%    1011998 =C2=B1  3%  numa-vmstat.node1.num=
a_local
>     6207902 =C2=B1  3%     +17.7%    7308204        numa-vmstat.node2.nr_=
active_anon
>     6195059 =C2=B1  3%     +17.6%    7287608        numa-vmstat.node2.nr_=
anon_pages
>       11047 =C2=B1  3%     +19.7%      13218        numa-vmstat.node2.nr_=
anon_transparent_hugepages
>       49684 =C2=B1 96%     -99.6%     186.00 =C2=B1 52%  numa-vmstat.node=
2.nr_page_table_pages
>       13734 =C2=B1 20%     -24.5%      10367 =C2=B1 10%  numa-vmstat.node=
2.nr_slab_unreclaimable
>     6207738 =C2=B1  3%     +17.7%    7308081        numa-vmstat.node2.nr_=
zone_active_anon
>     2125860 =C2=B1 40%     -49.5%    1073183 =C2=B1  2%  numa-vmstat.node=
2.numa_hit
>     2015486 =C2=B1 42%     -52.2%     963317 =C2=B1  2%  numa-vmstat.node=
2.numa_local
>      104.25 =C2=B1 94%     -93.8%       6.50 =C2=B1 49%  numa-vmstat.node=
3.nr_inactive_file
>        4864 =C2=B1 15%     +26.7%       6160 =C2=B1 10%  numa-vmstat.node=
3.nr_kernel_stack
>       23833 =C2=B1172%    +230.0%      78649 =C2=B1 57%  numa-vmstat.node=
3.nr_page_table_pages
>      104.25 =C2=B1 94%     -93.8%       6.50 =C2=B1 49%  numa-vmstat.node=
3.nr_zone_inactive_file
>        1.12 =C2=B1 19%      -0.5        0.63 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.do_huge_pmd_numa_page.__handle_mm_fault.handle_mm_fault.__=
do_page_fault.do_page_fault
>        0.81 =C2=B1 19%      -0.2        0.60 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.reuse_swap_page.do_huge_pmd_wp_page.__handle_mm_fault.hand=
le_mm_fault.__do_page_fault
>        0.33 =C2=B1 22%      -0.2        0.17 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.migrate_misplaced_transhuge_page
>        0.09 =C2=B1 23%      -0.1        0.03 =C2=B1100%  perf-profile.chi=
ldren.cycles-pp.ttwu_do_activate
>        0.08 =C2=B1 19%      -0.1        0.03 =C2=B1100%  perf-profile.chi=
ldren.cycles-pp.enqueue_entity
>        0.15 =C2=B1 20%      -0.1        0.10 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.wake_up_page_bit
>        0.14 =C2=B1 23%      -0.1        0.09 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.__wake_up_common
>        0.14 =C2=B1 20%      -0.1        0.09 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.autoremove_wake_function
>        0.09 =C2=B1 20%      -0.0        0.04 =C2=B1 58%  perf-profile.chi=
ldren.cycles-pp.enqueue_task_fair
>        0.09 =C2=B1 23%      -0.0        0.04 =C2=B1 58%  perf-profile.chi=
ldren.cycles-pp.activate_task
>        0.15 =C2=B1 21%      -0.0        0.11 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.try_to_wake_up
>        0.15 =C2=B1 11%      +0.0        0.17 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.schedule
>        0.08 =C2=B1 10%      +0.0        0.12 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.newidle_balance
>        0.12 =C2=B1 16%      +0.0        0.17 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.find_busiest_group
>        0.00            +0.1        0.05        perf-profile.children.cycl=
es-pp.balance_fair
>        0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children=
.cycles-pp.arch_scale_freq_tick
>        0.18 =C2=B1 10%      +0.1        0.23 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.load_balance
>        0.00            +0.1        0.09 =C2=B1  9%  perf-profile.children=
.cycles-pp.smpboot_thread_fn
>        0.40 =C2=B1 23%      +0.3        0.68 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.task_tick_fair
>        0.01 =C2=B1173%      +0.3        0.30 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.update_cfs_group
>        0.01 =C2=B1173%      +0.3        0.30 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.update_cfs_group
>        8587 =C2=B1 12%     -29.1%       6090 =C2=B1  9%  sched_debug.cfs_=
rq:/.exec_clock.stddev
>        0.53 =C2=B1 45%     -92.1%       0.04 =C2=B1173%  sched_debug.cfs_=
rq:/.load_avg.min
>        0.54 =C2=B1 19%     +38.3%       0.74 =C2=B1 10%  sched_debug.cfs_=
rq:/.nr_running.avg
>        4.81 =C2=B1 12%    +266.0%      17.59 =C2=B1  7%  sched_debug.cfs_=
rq:/.nr_spread_over.avg
>       24.01 =C2=B1  8%     +96.4%      47.14 =C2=B1  4%  sched_debug.cfs_=
rq:/.nr_spread_over.max
>        5.02 =C2=B1 10%    +123.0%      11.19 =C2=B1  6%  sched_debug.cfs_=
rq:/.nr_spread_over.stddev
>      313.47 =C2=B1 18%     -55.1%     140.75 =C2=B1 51%  sched_debug.cfs_=
rq:/.runnable_load_avg.max
>       31.75 =C2=B1  9%     -54.5%      14.46 =C2=B1 44%  sched_debug.cfs_=
rq:/.runnable_load_avg.stddev
>        0.54 =C2=B1 19%     +38.2%       0.75 =C2=B1  9%  sched_debug.cpu.=
nr_running.avg
>       11567 =C2=B1  8%     -28.4%       8277 =C2=B1  7%  sched_debug.cpu.=
nr_switches.avg
>        4760 =C2=B1  9%     -31.7%       3249 =C2=B1  4%  sched_debug.cpu.=
nr_switches.stddev
>      -36.17           +31.8%     -47.65        sched_debug.cpu.nr_uninter=
ruptible.min
>       15.88 =C2=B1  2%     +35.3%      21.49 =C2=B1  7%  sched_debug.cpu.=
nr_uninterruptible.stddev
>        9718 =C2=B1 10%     -34.1%       6402 =C2=B1  9%  sched_debug.cpu.=
sched_count.avg
>        4294 =C2=B1  8%     -37.4%       2688 =C2=B1  8%  sched_debug.cpu.=
sched_count.stddev
>        3936 =C2=B1 10%     -53.6%       1828 =C2=B1 12%  sched_debug.cpu.=
sched_goidle.avg
>        2045 =C2=B1  8%     -50.0%       1022 =C2=B1 10%  sched_debug.cpu.=
sched_goidle.stddev
>        4616 =C2=B1  9%     -36.5%       2933 =C2=B1 10%  sched_debug.cpu.=
ttwu_count.avg
>       11005 =C2=B1  9%     -22.0%       8579 =C2=B1  9%  sched_debug.cpu.=
ttwu_count.max
>        2271 =C2=B1  8%     -34.9%       1478 =C2=B1  8%  sched_debug.cpu.=
ttwu_count.stddev
>      915.40 =C2=B1  8%     +42.3%       1303 =C2=B1  6%  sched_debug.cpu.=
ttwu_local.avg
>        3927 =C2=B1  5%     +19.3%       4684 =C2=B1 10%  sched_debug.cpu.=
ttwu_local.max
>      488.40 =C2=B1  9%     +40.6%     686.55 =C2=B1  3%  sched_debug.cpu.=
ttwu_local.stddev
>    25252488           +12.3%   28363408        proc-vmstat.nr_active_anon
>    25182652           +12.4%   28296707        proc-vmstat.nr_anon_pages
>       44870           +14.2%      51263        proc-vmstat.nr_anon_transp=
arent_hugepages
>      148.25            -5.7%     139.75        proc-vmstat.nr_dirtied
>    10541824            -3.0%   10230220        proc-vmstat.nr_dirty_backg=
round_threshold
>    21109424            -3.0%   20485453        proc-vmstat.nr_dirty_thres=
hold
>    1.06e+08            -2.9%  1.029e+08        proc-vmstat.nr_free_pages
>      369.75            -1.4%     364.50        proc-vmstat.nr_inactive_fi=
le
>       99622            +7.3%     106911        proc-vmstat.nr_page_table_=
pages
>      144.25            -4.9%     137.25        proc-vmstat.nr_written
>    25252485           +12.3%   28363396        proc-vmstat.nr_zone_active=
_anon
>      369.75            -1.4%     364.50        proc-vmstat.nr_zone_inacti=
ve_file
>     2953466           -10.6%    2639571        proc-vmstat.numa_hint_faul=
ts
>      661711            -9.8%     596566        proc-vmstat.numa_hint_faul=
ts_local
>    11245421           -11.8%    9923535        proc-vmstat.numa_hit
>     5838019            -7.0%    5428548        proc-vmstat.numa_huge_pte_=
updates
>    11136518           -11.9%    9814538        proc-vmstat.numa_local
>      201352 =C2=B1 12%    +234.6%     673715 =C2=B1  7%  proc-vmstat.numa=
_pages_migrated
>    2.99e+09            -7.0%   2.78e+09        proc-vmstat.numa_pte_updat=
es
>   2.382e+09           -18.9%  1.931e+09        proc-vmstat.pgalloc_normal
>    10046733           -11.2%    8918565        proc-vmstat.pgfault
>   2.381e+09           -18.9%   1.93e+09        proc-vmstat.pgfree
>   5.942e+08           -42.6%  3.409e+08        proc-vmstat.pgmigrate_fail
>      201352 =C2=B1 12%    +234.6%     673715 =C2=B1  7%  proc-vmstat.pgmi=
grate_success
>     3478289           -11.1%    3091553        proc-vmstat.thp_fault_alloc
>        8.85 =C2=B1  7%     -16.8%       7.36 =C2=B1 12%  perf-stat.i.MPKI
>   2.766e+10 =C2=B1  4%      -7.4%  2.562e+10 =C2=B1  3%  perf-stat.i.bran=
ch-instructions
>       20.31            +1.8       22.10 =C2=B1  4%  perf-stat.i.cache-mis=
s-rate%
>   5.089e+08 =C2=B1  4%      -9.5%  4.604e+08 =C2=B1  3%  perf-stat.i.cach=
e-references
>        9955 =C2=B1  3%     -33.0%       6665 =C2=B1  4%  perf-stat.i.cont=
ext-switches
>        1.73 =C2=B1  4%      +9.9%       1.90 =C2=B1  3%  perf-stat.i.cpi
>   1.287e+11 =C2=B1  4%     +11.2%  1.431e+11 =C2=B1  3%  perf-stat.i.cpu-=
cycles
>      485.10 =C2=B1  5%    +108.0%       1009 =C2=B1  4%  perf-stat.i.cpu-=
migrations
>   2.215e+10 =C2=B1  4%      -6.5%  2.071e+10 =C2=B1  3%  perf-stat.i.dTLB=
-loads
>   7.427e+09 =C2=B1  4%      -8.1%  6.829e+09 =C2=B1  3%  perf-stat.i.dTLB=
-stores
>      958368 =C2=B1  5%     -30.9%     662160 =C2=B1  2%  perf-stat.i.iTLB=
-load-misses
>   8.707e+10 =C2=B1  4%      -7.4%  8.062e+10 =C2=B1  3%  perf-stat.i.inst=
ructions
>      142754 =C2=B1  2%     +11.3%     158927 =C2=B1  2%  perf-stat.i.inst=
ructions-per-iTLB-miss
>        0.67           -13.3%       0.58        perf-stat.i.ipc
>       33135 =C2=B1  4%     -10.7%      29584 =C2=B1  2%  perf-stat.i.mino=
r-faults
>       70.79            +6.0       76.82        perf-stat.i.node-load-miss=
-rate%
>    41028170 =C2=B1  4%     +14.1%   46801837 =C2=B1  3%  perf-stat.i.node=
-load-misses
>        1.85 =C2=B1  5%      +0.9        2.78 =C2=B1  5%  perf-stat.i.node=
-store-miss-rate%
>      584076 =C2=B1  6%     +70.0%     992640 =C2=B1  4%  perf-stat.i.node=
-store-misses
>    53445296 =C2=B1  5%     -19.0%   43298204 =C2=B1  7%  perf-stat.i.node=
-stores
>       33137 =C2=B1  4%     -10.7%      29584 =C2=B1  2%  perf-stat.i.page=
-faults
>        5.85            -1.7%       5.75        perf-stat.overall.MPKI
>        1.48           +19.6%       1.77        perf-stat.overall.cpi
>        1156           +16.7%       1350 =C2=B1  5%  perf-stat.overall.cyc=
les-between-cache-misses
>       92129 =C2=B1  6%     +25.2%     115378        perf-stat.overall.ins=
tructions-per-iTLB-miss
>        0.67           -16.4%       0.56        perf-stat.overall.ipc
>       75.40            +3.8       79.17        perf-stat.overall.node-loa=
d-miss-rate%
>        1.11 =C2=B1  2%      +1.2        2.33 =C2=B1  7%  perf-stat.overal=
l.node-store-miss-rate%
>   2.704e+10           -11.0%  2.408e+10        perf-stat.ps.branch-instru=
ctions
>   1.091e+08            -8.5%   99896941 =C2=B1  5%  perf-stat.ps.cache-mi=
sses
>   4.979e+08           -12.5%  4.357e+08        perf-stat.ps.cache-referen=
ces
>        9775           -34.7%       6386 =C2=B1  2%  perf-stat.ps.context-=
switches
>   1.262e+11            +6.5%  1.344e+11        perf-stat.ps.cpu-cycles
>      487.90 =C2=B1  5%    +100.7%     979.41        perf-stat.ps.cpu-migr=
ations
>   2.166e+10           -10.1%  1.948e+10        perf-stat.ps.dTLB-loads
>    7.26e+09           -11.3%  6.441e+09        perf-stat.ps.dTLB-stores
>      927296 =C2=B1  5%     -29.1%     657143        perf-stat.ps.iTLB-loa=
d-misses
>   8.512e+10           -10.9%  7.581e+10        perf-stat.ps.instructions
>       32070           -11.2%      28469        perf-stat.ps.minor-faults
>    40537100            +9.2%   44251909 =C2=B1  4%  perf-stat.ps.node-loa=
d-misses
>    13226459 =C2=B1  2%     -12.0%   11644845 =C2=B1  4%  perf-stat.ps.nod=
e-loads
>      582949 =C2=B1  3%     +65.6%     965166 =C2=B1  3%  perf-stat.ps.nod=
e-store-misses
>    52116857           -21.9%   40679765 =C2=B1  8%  perf-stat.ps.node-sto=
res
>       32070           -11.2%      28469        perf-stat.ps.page-faults
>   2.642e+13           -11.4%  2.341e+13        perf-stat.total.instructio=
ns
>      229.75 =C2=B1 52%     -34.1%     151.50        interrupts.102:PCI-MS=
I.1572921-edge.eth0-TxRx-57
>      156.75 =C2=B1  3%     +27.3%     199.50 =C2=B1 29%  interrupts.47:PC=
I-MSI.1572866-edge.eth0-TxRx-2
>        1603 =C2=B1 22%     -15.6%       1352 =C2=B1  4%  interrupts.CPU1.=
NMI:Non-maskable_interrupts
>        1603 =C2=B1 22%     -15.6%       1352 =C2=B1  4%  interrupts.CPU1.=
PMI:Performance_monitoring_interrupts
>        1007 =C2=B1 19%     -38.7%     618.00 =C2=B1  8%  interrupts.CPU10=
0.RES:Rescheduling_interrupts
>        1016 =C2=B1 19%     -33.9%     671.75 =C2=B1  5%  interrupts.CPU10=
1.RES:Rescheduling_interrupts
>        2046 =C2=B1 32%     -19.9%       1638 =C2=B1 30%  interrupts.CPU10=
2.NMI:Non-maskable_interrupts
>        2046 =C2=B1 32%     -19.9%       1638 =C2=B1 30%  interrupts.CPU10=
2.PMI:Performance_monitoring_interrupts
>      956.75 =C2=B1 18%     -33.1%     640.25 =C2=B1  5%  interrupts.CPU10=
2.RES:Rescheduling_interrupts
>      909.50 =C2=B1 20%     -29.1%     644.50 =C2=B1 12%  interrupts.CPU10=
3.RES:Rescheduling_interrupts
>      959.50 =C2=B1 24%     -31.4%     658.00 =C2=B1  5%  interrupts.CPU10=
4.RES:Rescheduling_interrupts
>      921.75 =C2=B1 14%     -30.2%     643.50 =C2=B1  3%  interrupts.CPU10=
5.RES:Rescheduling_interrupts
>      901.50 =C2=B1 14%     -27.8%     650.50 =C2=B1 11%  interrupts.CPU10=
6.RES:Rescheduling_interrupts
>        2670 =C2=B1  3%     -37.5%       1670 =C2=B1 31%  interrupts.CPU10=
7.NMI:Non-maskable_interrupts
>        2670 =C2=B1  3%     -37.5%       1670 =C2=B1 31%  interrupts.CPU10=
7.PMI:Performance_monitoring_interrupts
>        2849           -31.6%       1948 =C2=B1 33%  interrupts.CPU109.NMI=
:Non-maskable_interrupts
>        2849           -31.6%       1948 =C2=B1 33%  interrupts.CPU109.PMI=
:Performance_monitoring_interrupts
>        1410 =C2=B1 20%     +51.0%       2130 =C2=B1 23%  interrupts.CPU11=
.NMI:Non-maskable_interrupts
>        1410 =C2=B1 20%     +51.0%       2130 =C2=B1 23%  interrupts.CPU11=
.PMI:Performance_monitoring_interrupts
>        2820 =C2=B1  3%     -30.7%       1955 =C2=B1 32%  interrupts.CPU11=
1.NMI:Non-maskable_interrupts
>        2820 =C2=B1  3%     -30.7%       1955 =C2=B1 32%  interrupts.CPU11=
1.PMI:Performance_monitoring_interrupts
>        2808           -30.1%       1962 =C2=B1 33%  interrupts.CPU116.NMI=
:Non-maskable_interrupts
>        2808           -30.1%       1962 =C2=B1 33%  interrupts.CPU116.PMI=
:Performance_monitoring_interrupts
>      622190            -8.1%     571803 =C2=B1  4%  interrupts.CPU118.LOC=
:Local_timer_interrupts
>      621861            -8.3%     570381 =C2=B1  4%  interrupts.CPU119.LOC=
:Local_timer_interrupts
>        2024 =C2=B1 25%     -30.0%       1417 =C2=B1  8%  interrupts.CPU12=
.NMI:Non-maskable_interrupts
>        2024 =C2=B1 25%     -30.0%       1417 =C2=B1  8%  interrupts.CPU12=
.PMI:Performance_monitoring_interrupts
>      622130            -8.0%     572612 =C2=B1  4%  interrupts.CPU120.LOC=
:Local_timer_interrupts
>      622145            -8.4%     569980 =C2=B1  4%  interrupts.CPU121.LOC=
:Local_timer_interrupts
>        2131 =C2=B1 33%     -24.4%       1611 =C2=B1 26%  interrupts.CPU12=
1.NMI:Non-maskable_interrupts
>        2131 =C2=B1 33%     -24.4%       1611 =C2=B1 26%  interrupts.CPU12=
1.PMI:Performance_monitoring_interrupts
>      621983            -7.9%     572602 =C2=B1  4%  interrupts.CPU123.LOC=
:Local_timer_interrupts
>        2219 =C2=B1 34%     -40.0%       1332 =C2=B1  5%  interrupts.CPU12=
4.NMI:Non-maskable_interrupts
>        2219 =C2=B1 34%     -40.0%       1332 =C2=B1  5%  interrupts.CPU12=
4.PMI:Performance_monitoring_interrupts
>      622061            -8.0%     572198 =C2=B1  4%  interrupts.CPU125.LOC=
:Local_timer_interrupts
>      817.50 =C2=B1 12%     -46.8%     435.25 =C2=B1 13%  interrupts.CPU12=
8.RES:Rescheduling_interrupts
>      820.75 =C2=B1 24%     -48.8%     420.00 =C2=B1 25%  interrupts.CPU12=
9.RES:Rescheduling_interrupts
>      750.00 =C2=B1 25%     -42.9%     428.00 =C2=B1 24%  interrupts.CPU13=
0.RES:Rescheduling_interrupts
>        2285 =C2=B1 22%     -38.1%       1415        interrupts.CPU133.NMI=
:Non-maskable_interrupts
>        2285 =C2=B1 22%     -38.1%       1415        interrupts.CPU133.PMI=
:Performance_monitoring_interrupts
>      779.25 =C2=B1 30%     -50.5%     386.00 =C2=B1 23%  interrupts.CPU13=
3.RES:Rescheduling_interrupts
>      741.25 =C2=B1 28%     -47.7%     387.75 =C2=B1 28%  interrupts.CPU13=
5.RES:Rescheduling_interrupts
>      728.00 =C2=B1 28%     -46.2%     391.50 =C2=B1 31%  interrupts.CPU13=
7.RES:Rescheduling_interrupts
>      749.25 =C2=B1 29%     -53.9%     345.50 =C2=B1 27%  interrupts.CPU13=
8.RES:Rescheduling_interrupts
>      751.25 =C2=B1 27%     -49.0%     383.00 =C2=B1 29%  interrupts.CPU13=
9.RES:Rescheduling_interrupts
>      688.00 =C2=B1 24%     -49.8%     345.25 =C2=B1 27%  interrupts.CPU14=
0.RES:Rescheduling_interrupts
>      726.00 =C2=B1 27%     -55.1%     326.25 =C2=B1 32%  interrupts.CPU14=
1.RES:Rescheduling_interrupts
>        2272 =C2=B1 29%     -40.7%       1347 =C2=B1  2%  interrupts.CPU15=
.NMI:Non-maskable_interrupts
>        2272 =C2=B1 29%     -40.7%       1347 =C2=B1  2%  interrupts.CPU15=
.PMI:Performance_monitoring_interrupts
>      156.75 =C2=B1  3%     +27.3%     199.50 =C2=B1 29%  interrupts.CPU2.=
47:PCI-MSI.1572866-edge.eth0-TxRx-2
>        2562 =C2=B1  9%     -38.6%       1573 =C2=B1 28%  interrupts.CPU2.=
NMI:Non-maskable_interrupts
>        2562 =C2=B1  9%     -38.6%       1573 =C2=B1 28%  interrupts.CPU2.=
PMI:Performance_monitoring_interrupts
>        1344 =C2=B1 20%     -32.8%     903.75        interrupts.CPU20.RES:=
Rescheduling_interrupts
>        1314 =C2=B1 16%     -29.9%     921.50 =C2=B1  5%  interrupts.CPU21=
.RES:Rescheduling_interrupts
>      120.00 =C2=B1 47%     -98.3%       2.00 =C2=B1 93%  interrupts.CPU22=
.TLB:TLB_shootdowns
>        2245 =C2=B1 24%     -35.7%       1443 =C2=B1 24%  interrupts.CPU23=
.NMI:Non-maskable_interrupts
>        2245 =C2=B1 24%     -35.7%       1443 =C2=B1 24%  interrupts.CPU23=
.PMI:Performance_monitoring_interrupts
>        1338 =C2=B1 18%     -32.8%     899.00 =C2=B1 12%  interrupts.CPU23=
.RES:Rescheduling_interrupts
>        1243 =C2=B1 16%     -28.0%     895.75 =C2=B1  4%  interrupts.CPU24=
.RES:Rescheduling_interrupts
>        1360 =C2=B1 30%     -33.3%     907.50 =C2=B1 15%  interrupts.CPU25=
.RES:Rescheduling_interrupts
>        1273 =C2=B1 20%     -34.0%     841.00 =C2=B1  6%  interrupts.CPU26=
.RES:Rescheduling_interrupts
>        1273 =C2=B1 15%     -31.3%     874.25 =C2=B1  8%  interrupts.CPU27=
.RES:Rescheduling_interrupts
>        1315 =C2=B1 16%     -40.6%     781.00 =C2=B1 11%  interrupts.CPU28=
.RES:Rescheduling_interrupts
>        1320 =C2=B1 20%     -39.2%     802.75 =C2=B1  5%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>        2094 =C2=B1 30%     -22.7%       1619 =C2=B1 35%  interrupts.CPU30=
.NMI:Non-maskable_interrupts
>        2094 =C2=B1 30%     -22.7%       1619 =C2=B1 35%  interrupts.CPU30=
.PMI:Performance_monitoring_interrupts
>        1301 =C2=B1 19%     -40.6%     773.00 =C2=B1  5%  interrupts.CPU30=
.RES:Rescheduling_interrupts
>        1253 =C2=B1 16%     -36.9%     791.00 =C2=B1 15%  interrupts.CPU31=
.RES:Rescheduling_interrupts
>        1231 =C2=B1 17%     -41.5%     720.25 =C2=B1  8%  interrupts.CPU32=
.RES:Rescheduling_interrupts
>        1177 =C2=B1 11%     -37.3%     738.00 =C2=B1 14%  interrupts.CPU33=
.RES:Rescheduling_interrupts
>        1195 =C2=B1 18%     -34.0%     788.75 =C2=B1 21%  interrupts.CPU34=
.RES:Rescheduling_interrupts
>        2567 =C2=B1  8%     -35.1%       1666 =C2=B1 35%  interrupts.CPU35=
.NMI:Non-maskable_interrupts
>        2567 =C2=B1  8%     -35.1%       1666 =C2=B1 35%  interrupts.CPU35=
.PMI:Performance_monitoring_interrupts
>        1223 =C2=B1 18%     -39.1%     745.25 =C2=B1  8%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>      621753            -7.9%     572936 =C2=B1  4%  interrupts.CPU36.LOC:=
Local_timer_interrupts
>        2527 =C2=B1 10%     -34.0%       1667 =C2=B1 31%  interrupts.CPU40=
.NMI:Non-maskable_interrupts
>        2527 =C2=B1 10%     -34.0%       1667 =C2=B1 31%  interrupts.CPU40=
.PMI:Performance_monitoring_interrupts
>      622323            -7.9%     572967 =C2=B1  4%  interrupts.CPU45.LOC:=
Local_timer_interrupts
>        1832 =C2=B1 17%     +38.7%       2541 =C2=B1  3%  interrupts.CPU46=
.NMI:Non-maskable_interrupts
>        1832 =C2=B1 17%     +38.7%       2541 =C2=B1  3%  interrupts.CPU46=
.PMI:Performance_monitoring_interrupts
>      621906            -8.0%     572330 =C2=B1  4%  interrupts.CPU47.LOC:=
Local_timer_interrupts
>      621972            -8.1%     571378 =C2=B1  4%  interrupts.CPU48.LOC:=
Local_timer_interrupts
>      622275            -8.2%     571410 =C2=B1  4%  interrupts.CPU49.LOC:=
Local_timer_interrupts
>        2459 =C2=B1 24%     -41.7%       1433 =C2=B1 10%  interrupts.CPU49=
.NMI:Non-maskable_interrupts
>        2459 =C2=B1 24%     -41.7%       1433 =C2=B1 10%  interrupts.CPU49=
.PMI:Performance_monitoring_interrupts
>      622031            -7.9%     573184 =C2=B1  4%  interrupts.CPU50.LOC:=
Local_timer_interrupts
>      622081            -7.9%     572943 =C2=B1  4%  interrupts.CPU51.LOC:=
Local_timer_interrupts
>      622140            -7.8%     573769 =C2=B1  4%  interrupts.CPU52.LOC:=
Local_timer_interrupts
>      622074            -7.6%     574558 =C2=B1  4%  interrupts.CPU53.LOC:=
Local_timer_interrupts
>      229.75 =C2=B1 52%     -34.1%     151.50        interrupts.CPU57.102:=
PCI-MSI.1572921-edge.eth0-TxRx-57
>        1052 =C2=B1 38%     -59.2%     429.25 =C2=B1 16%  interrupts.CPU61=
.RES:Rescheduling_interrupts
>      830.75 =C2=B1 26%     -53.3%     388.25 =C2=B1 27%  interrupts.CPU62=
.RES:Rescheduling_interrupts
>      774.50 =C2=B1 28%     -48.5%     399.00 =C2=B1 32%  interrupts.CPU67=
.RES:Rescheduling_interrupts
>      785.00 =C2=B1 33%     -51.6%     380.00 =C2=B1 32%  interrupts.CPU68=
.RES:Rescheduling_interrupts
>      890.25 =C2=B1 31%     -58.3%     371.50 =C2=B1 27%  interrupts.CPU69=
.RES:Rescheduling_interrupts
>      821.50 =C2=B1 30%     -46.4%     440.50 =C2=B1 36%  interrupts.CPU70=
.RES:Rescheduling_interrupts
>        1897 =C2=B1 24%     +40.4%       2663 =C2=B1  4%  interrupts.CPU84=
.NMI:Non-maskable_interrupts
>        1897 =C2=B1 24%     +40.4%       2663 =C2=B1  4%  interrupts.CPU84=
.PMI:Performance_monitoring_interrupts
>        1431 =C2=B1 17%     -43.5%     808.25 =C2=B1 21%  interrupts.CPU9.=
RES:Rescheduling_interrupts
>        1064 =C2=B1 18%     -30.1%     743.75 =C2=B1 16%  interrupts.CPU91=
.RES:Rescheduling_interrupts
>        1076 =C2=B1 10%     -39.6%     649.75 =C2=B1 10%  interrupts.CPU92=
.RES:Rescheduling_interrupts
>        1042 =C2=B1 17%     -33.8%     690.00 =C2=B1 10%  interrupts.CPU93=
.RES:Rescheduling_interrupts
>        1065 =C2=B1 18%     -33.4%     709.50 =C2=B1  5%  interrupts.CPU94=
.RES:Rescheduling_interrupts
>        2731 =C2=B1  7%     -30.6%       1894 =C2=B1 28%  interrupts.CPU95=
.NMI:Non-maskable_interrupts
>        2731 =C2=B1  7%     -30.6%       1894 =C2=B1 28%  interrupts.CPU95=
.PMI:Performance_monitoring_interrupts
>      998.75 =C2=B1 19%     -28.4%     715.00 =C2=B1  7%  interrupts.CPU96=
.RES:Rescheduling_interrupts
>        2.75 =C2=B1 47%   +2009.1%      58.00 =C2=B1148%  interrupts.CPU96=
.TLB:TLB_shootdowns
>      952.50 =C2=B1 27%     -29.5%     671.25 =C2=B1 12%  interrupts.CPU97=
.RES:Rescheduling_interrupts
>        2667 =C2=B1  2%     -50.2%       1328 =C2=B1  4%  interrupts.CPU98=
.NMI:Non-maskable_interrupts
>        2667 =C2=B1  2%     -50.2%       1328 =C2=B1  4%  interrupts.CPU98=
.PMI:Performance_monitoring_interrupts
>      973.00 =C2=B1 20%     -28.5%     695.25 =C2=B1  4%  interrupts.CPU98=
.RES:Rescheduling_interrupts
>      991.00 =C2=B1 18%     -34.0%     654.00 =C2=B1  8%  interrupts.CPU99=
.RES:Rescheduling_interrupts
>      135782 =C2=B1 14%     -25.0%     101847 =C2=B1  6%  interrupts.RES:R=
escheduling_interrupts
>      140559 =C2=B1  2%     -11.8%     124028 =C2=B1  6%  softirqs.CPU0.RCU
>      145814 =C2=B1  3%     -13.7%     125791 =C2=B1  5%  softirqs.CPU1.RCU
>      138760           -12.0%     122124 =C2=B1  6%  softirqs.CPU100.RCU
>       16104           -17.4%      13295 =C2=B1  5%  softirqs.CPU100.SCHED
>       16422 =C2=B1  5%     -16.9%      13653 =C2=B1  7%  softirqs.CPU101.=
SCHED
>       15960           -14.5%      13650 =C2=B1  6%  softirqs.CPU102.SCHED
>       15804 =C2=B1  8%     -13.8%      13616 =C2=B1  7%  softirqs.CPU103.=
SCHED
>      139949           -12.0%     123102 =C2=B1  5%  softirqs.CPU104.RCU
>       16155 =C2=B1  3%     -14.6%      13799 =C2=B1  8%  softirqs.CPU104.=
SCHED
>       16018 =C2=B1  4%     -14.3%      13725 =C2=B1 10%  softirqs.CPU105.=
SCHED
>       15392 =C2=B1  5%     -14.4%      13172 =C2=B1  6%  softirqs.CPU106.=
SCHED
>       15218 =C2=B1  4%     -15.5%      12852 =C2=B1  9%  softirqs.CPU107.=
SCHED
>      143209           -14.2%     122899 =C2=B1  5%  softirqs.CPU108.RCU
>      144618           -14.9%     123106 =C2=B1  4%  softirqs.CPU109.RCU
>      144915           -14.1%     124470 =C2=B1  6%  softirqs.CPU110.RCU
>      145038           -14.7%     123770 =C2=B1  5%  softirqs.CPU111.RCU
>      138846           -12.2%     121867 =C2=B1  6%  softirqs.CPU112.RCU
>      137438           -11.9%     121069 =C2=B1  6%  softirqs.CPU113.RCU
>      141152           -13.4%     122234 =C2=B1  5%  softirqs.CPU114.RCU
>      141545           -13.8%     122025 =C2=B1  5%  softirqs.CPU115.RCU
>      140302           -13.0%     122108 =C2=B1  6%  softirqs.CPU116.RCU
>      140548           -13.2%     122057 =C2=B1  5%  softirqs.CPU117.RCU
>      142370           -14.3%     122021 =C2=B1  5%  softirqs.CPU118.RCU
>      136694           -11.3%     121193 =C2=B1  5%  softirqs.CPU119.RCU
>      137193           -11.5%     121415 =C2=B1  6%  softirqs.CPU120.RCU
>      137125           -11.9%     120804 =C2=B1  5%  softirqs.CPU121.RCU
>      140181           -13.0%     121893 =C2=B1  5%  softirqs.CPU122.RCU
>      137405           -11.4%     121741 =C2=B1  5%  softirqs.CPU124.RCU
>      139350           -12.5%     122000 =C2=B1  6%  softirqs.CPU125.RCU
>      145339           -14.5%     124311 =C2=B1  5%  softirqs.CPU126.RCU
>       14887 =C2=B1 18%     -32.6%      10033 =C2=B1 15%  softirqs.CPU126.=
SCHED
>      144917           -15.6%     122366 =C2=B1  5%  softirqs.CPU127.RCU
>       15094 =C2=B1 20%     -37.0%       9516 =C2=B1 21%  softirqs.CPU127.=
SCHED
>      140946           -13.8%     121461 =C2=B1  6%  softirqs.CPU128.RCU
>      138106 =C2=B1  2%     -11.1%     122812 =C2=B1  6%  softirqs.CPU129.=
RCU
>      137799           -11.3%     122221 =C2=B1  6%  softirqs.CPU130.RCU
>      137425           -10.9%     122427 =C2=B1  6%  softirqs.CPU131.RCU
>      140854           -12.9%     122753 =C2=B1  5%  softirqs.CPU132.RCU
>       15140 =C2=B1 24%     -35.8%       9716 =C2=B1 19%  softirqs.CPU132.=
SCHED
>      140764 =C2=B1  2%     -12.7%     122926 =C2=B1  5%  softirqs.CPU133.=
RCU
>      139626           -11.7%     123235 =C2=B1  5%  softirqs.CPU134.RCU
>      141210 =C2=B1  2%     -12.6%     123477 =C2=B1  5%  softirqs.CPU135.=
RCU
>      142996 =C2=B1  3%     -14.1%     122901 =C2=B1  5%  softirqs.CPU136.=
RCU
>      140567 =C2=B1  2%     -12.5%     123022 =C2=B1  6%  softirqs.CPU140.=
RCU
>       14192 =C2=B1 21%     -34.2%       9336 =C2=B1 18%  softirqs.CPU141.=
SCHED
>      135514 =C2=B1  2%      -9.8%     122294 =C2=B1  5%  softirqs.CPU142.=
RCU
>      134945 =C2=B1  2%     -10.0%     121501 =C2=B1  6%  softirqs.CPU143.=
RCU
>      145145           -13.0%     126309 =C2=B1  5%  softirqs.CPU16.RCU
>      144489 =C2=B1  2%     -13.3%     125217 =C2=B1  5%  softirqs.CPU17.R=
CU
>      138706 =C2=B1  4%     -12.0%     122092 =C2=B1  5%  softirqs.CPU18.R=
CU
>       15348 =C2=B1  4%     -10.0%      13810 =C2=B1  8%  softirqs.CPU18.S=
CHED
>      140870 =C2=B1  2%     -10.7%     125784 =C2=B1  3%  softirqs.CPU19.R=
CU
>       16392 =C2=B1  5%     -15.5%      13843 =C2=B1  6%  softirqs.CPU19.S=
CHED
>      143741 =C2=B1  2%     -12.4%     125852 =C2=B1  5%  softirqs.CPU2.RCU
>      140088           -11.7%     123663 =C2=B1  5%  softirqs.CPU20.RCU
>       16092 =C2=B1  3%     -14.0%      13832 =C2=B1  5%  softirqs.CPU20.S=
CHED
>      138206           -11.0%     123025 =C2=B1  5%  softirqs.CPU21.RCU
>       16877 =C2=B1  4%     -16.7%      14051 =C2=B1  4%  softirqs.CPU21.S=
CHED
>      138653           -11.4%     122814 =C2=B1  5%  softirqs.CPU22.RCU
>       17090 =C2=B1  3%     -19.3%      13797 =C2=B1  5%  softirqs.CPU22.S=
CHED
>       16476 =C2=B1  3%     -15.6%      13910 =C2=B1  5%  softirqs.CPU23.S=
CHED
>      138808           -11.2%     123204 =C2=B1  5%  softirqs.CPU24.RCU
>       16779           -16.2%      14060 =C2=B1  5%  softirqs.CPU24.SCHED
>      139811 =C2=B1  2%     -11.6%     123555 =C2=B1  5%  softirqs.CPU25.R=
CU
>       16734 =C2=B1  3%     -15.8%      14083 =C2=B1  7%  softirqs.CPU25.S=
CHED
>      138909           -10.9%     123758 =C2=B1  5%  softirqs.CPU26.RCU
>       16619 =C2=B1  5%     -15.0%      14133 =C2=B1  5%  softirqs.CPU26.S=
CHED
>      140257           -12.3%     123025 =C2=B1  5%  softirqs.CPU27.RCU
>       17013 =C2=B1  5%     -17.3%      14061 =C2=B1  5%  softirqs.CPU27.S=
CHED
>      137824           -11.2%     122428 =C2=B1  6%  softirqs.CPU28.RCU
>       16470 =C2=B1  2%     -15.4%      13927 =C2=B1  6%  softirqs.CPU28.S=
CHED
>      135294 =C2=B1  2%      -9.6%     122364 =C2=B1  6%  softirqs.CPU29.R=
CU
>       17350 =C2=B1  3%     -20.7%      13761 =C2=B1  5%  softirqs.CPU29.S=
CHED
>      142300 =C2=B1  3%     -13.1%     123621 =C2=B1  6%  softirqs.CPU3.RCU
>       17067           -18.4%      13927 =C2=B1  5%  softirqs.CPU30.SCHED
>       17110 =C2=B1  4%     -17.6%      14099 =C2=B1  7%  softirqs.CPU31.S=
CHED
>      145321           -14.0%     124914 =C2=B1  4%  softirqs.CPU32.RCU
>       16952 =C2=B1  3%     -16.0%      14234 =C2=B1  7%  softirqs.CPU32.S=
CHED
>      143684           -14.0%     123636 =C2=B1  5%  softirqs.CPU33.RCU
>       16728 =C2=B1  2%     -17.3%      13838 =C2=B1  5%  softirqs.CPU33.S=
CHED
>      143358           -13.4%     124129 =C2=B1  5%  softirqs.CPU34.RCU
>       17103 =C2=B1  3%     -17.7%      14082 =C2=B1  6%  softirqs.CPU34.S=
CHED
>      143430           -13.0%     124848 =C2=B1  5%  softirqs.CPU35.RCU
>       16705           -17.7%      13746 =C2=B1  4%  softirqs.CPU35.SCHED
>      139206           -11.5%     123261 =C2=B1  7%  softirqs.CPU36.RCU
>      140252           -12.7%     122378 =C2=B1  5%  softirqs.CPU37.RCU
>      140086           -12.6%     122492 =C2=B1  5%  softirqs.CPU39.RCU
>      140518           -13.4%     121743 =C2=B1  5%  softirqs.CPU40.RCU
>      138605           -11.7%     122371 =C2=B1  5%  softirqs.CPU41.RCU
>      141519           -13.5%     122418 =C2=B1  5%  softirqs.CPU42.RCU
>      142030           -13.7%     122637 =C2=B1  5%  softirqs.CPU43.RCU
>      140694           -13.4%     121845 =C2=B1  4%  softirqs.CPU44.RCU
>      140504           -12.1%     123545 =C2=B1  5%  softirqs.CPU45.RCU
>      140277           -12.7%     122435 =C2=B1  5%  softirqs.CPU46.RCU
>      137267           -11.2%     121919 =C2=B1  5%  softirqs.CPU47.RCU
>      140839           -12.9%     122646 =C2=B1  5%  softirqs.CPU48.RCU
>      141816           -13.3%     122937 =C2=B1  5%  softirqs.CPU49.RCU
>      140868 =C2=B1  2%     -12.0%     123942 =C2=B1  6%  softirqs.CPU5.RCU
>      143643           -14.1%     123392 =C2=B1  6%  softirqs.CPU50.RCU
>      141326           -12.7%     123403 =C2=B1  6%  softirqs.CPU51.RCU
>      141583           -13.4%     122613 =C2=B1  6%  softirqs.CPU52.RCU
>      141100           -13.2%     122445 =C2=B1  5%  softirqs.CPU53.RCU
>      139956           -12.1%     122981 =C2=B1  6%  softirqs.CPU54.RCU
>       14018 =C2=B1 17%     -29.8%       9845 =C2=B1 15%  softirqs.CPU54.S=
CHED
>      140114           -11.3%     124217 =C2=B1  5%  softirqs.CPU55.RCU
>      143329           -14.8%     122069 =C2=B1  6%  softirqs.CPU56.RCU
>      141146           -12.3%     123718 =C2=B1  6%  softirqs.CPU57.RCU
>       15264 =C2=B1 19%     -34.6%       9988 =C2=B1 17%  softirqs.CPU57.S=
CHED
>      140809           -12.4%     123330 =C2=B1  6%  softirqs.CPU58.RCU
>       15201 =C2=B1 20%     -36.3%       9678 =C2=B1 20%  softirqs.CPU58.S=
CHED
>      140568           -12.0%     123769 =C2=B1  5%  softirqs.CPU59.RCU
>       15360 =C2=B1 20%     -33.3%      10252 =C2=B1 19%  softirqs.CPU59.S=
CHED
>      139409 =C2=B1  3%     -10.9%     124281 =C2=B1  6%  softirqs.CPU6.RCU
>      141767           -12.7%     123768 =C2=B1  5%  softirqs.CPU60.RCU
>      142046           -12.9%     123657 =C2=B1  5%  softirqs.CPU61.RCU
>       15389 =C2=B1 22%     -34.7%      10052 =C2=B1 18%  softirqs.CPU61.S=
CHED
>      141719           -12.7%     123700 =C2=B1  5%  softirqs.CPU62.RCU
>      142499           -12.9%     124068 =C2=B1  6%  softirqs.CPU63.RCU
>       14667 =C2=B1 20%     -31.8%      10005 =C2=B1 18%  softirqs.CPU63.S=
CHED
>      144437           -14.1%     124008 =C2=B1  6%  softirqs.CPU64.RCU
>       15191 =C2=B1 22%     -35.9%       9736 =C2=B1 19%  softirqs.CPU64.S=
CHED
>      141156 =C2=B1  2%     -12.3%     123743 =C2=B1  6%  softirqs.CPU65.R=
CU
>      139859           -11.2%     124140 =C2=B1  6%  softirqs.CPU66.RCU
>      141282           -11.9%     124535 =C2=B1  6%  softirqs.CPU67.RCU
>      144228           -13.7%     124434 =C2=B1  6%  softirqs.CPU68.RCU
>      142536           -13.0%     123956 =C2=B1  6%  softirqs.CPU69.RCU
>      141103 =C2=B1  2%     -11.8%     124488 =C2=B1  6%  softirqs.CPU7.RCU
>      140849 =C2=B1  2%     -11.5%     124683 =C2=B1  6%  softirqs.CPU70.R=
CU
>      141347 =C2=B1  2%     -12.4%     123863 =C2=B1  6%  softirqs.CPU71.R=
CU
>      142552 =C2=B1  3%     -13.6%     123193 =C2=B1  5%  softirqs.CPU72.R=
CU
>      142074 =C2=B1  4%     -12.3%     124659 =C2=B1  7%  softirqs.CPU73.R=
CU
>      141649           -13.1%     123155 =C2=B1  5%  softirqs.CPU74.RCU
>      143525 =C2=B1  4%     -14.0%     123493 =C2=B1  6%  softirqs.CPU75.R=
CU
>      142772 =C2=B1  3%     -13.9%     122974 =C2=B1  7%  softirqs.CPU76.R=
CU
>      141178 =C2=B1  3%     -12.9%     122944 =C2=B1  5%  softirqs.CPU77.R=
CU
>      140777 =C2=B1  3%     -12.8%     122799 =C2=B1  5%  softirqs.CPU78.R=
CU
>      143039 =C2=B1  4%     -14.3%     122572 =C2=B1  5%  softirqs.CPU79.R=
CU
>      140336 =C2=B1  3%     -11.8%     123811 =C2=B1  6%  softirqs.CPU8.RCU
>      141727 =C2=B1  2%     -13.0%     123316 =C2=B1  5%  softirqs.CPU80.R=
CU
>      141813 =C2=B1  2%     -13.0%     123363 =C2=B1  5%  softirqs.CPU81.R=
CU
>      141978 =C2=B1  2%     -11.6%     125442 =C2=B1  3%  softirqs.CPU82.R=
CU
>      137611 =C2=B1  3%     -10.7%     122950 =C2=B1  5%  softirqs.CPU84.R=
CU
>      141077 =C2=B1  2%     -12.0%     124188 =C2=B1  5%  softirqs.CPU86.R=
CU
>      139221 =C2=B1  3%     -11.9%     122606 =C2=B1  5%  softirqs.CPU87.R=
CU
>      138177 =C2=B1  4%     -11.7%     121980 =C2=B1  5%  softirqs.CPU88.R=
CU
>      139882 =C2=B1  2%     -11.1%     124329 =C2=B1  5%  softirqs.CPU9.RCU
>      141843 =C2=B1  2%     -13.6%     122541 =C2=B1  6%  softirqs.CPU90.R=
CU
>       16251 =C2=B1  3%     -15.5%      13733 =C2=B1  5%  softirqs.CPU90.S=
CHED
>      143175 =C2=B1  2%     -14.1%     122926 =C2=B1  6%  softirqs.CPU91.R=
CU
>       17088 =C2=B1  3%     -19.2%      13801 =C2=B1  7%  softirqs.CPU91.S=
CHED
>      144768           -14.7%     123542 =C2=B1  5%  softirqs.CPU92.RCU
>       16851 =C2=B1  2%     -20.1%      13462 =C2=B1  4%  softirqs.CPU92.S=
CHED
>      144398 =C2=B1  4%     -13.4%     125018 =C2=B1  3%  softirqs.CPU93.R=
CU
>       16917 =C2=B1  3%     -19.9%      13559 =C2=B1  6%  softirqs.CPU93.S=
CHED
>      142957 =C2=B1  2%     -13.6%     123521 =C2=B1  5%  softirqs.CPU94.R=
CU
>       16758 =C2=B1  2%     -17.8%      13773 =C2=B1  4%  softirqs.CPU94.S=
CHED
>      141885           -13.8%     122263 =C2=B1  6%  softirqs.CPU95.RCU
>       16161 =C2=B1  5%     -14.7%      13789 =C2=B1  6%  softirqs.CPU95.S=
CHED
>      138647           -11.8%     122297 =C2=B1  5%  softirqs.CPU96.RCU
>       16590 =C2=B1  3%     -16.8%      13804 =C2=B1  8%  softirqs.CPU96.S=
CHED
>       15776 =C2=B1  3%     -13.0%      13731 =C2=B1  7%  softirqs.CPU97.S=
CHED
>       16115           -10.6%      14405 =C2=B1  5%  softirqs.CPU98.SCHED
>      140827           -12.8%     122846 =C2=B1  5%  softirqs.CPU99.RCU
>       16252 =C2=B1  4%     -16.2%      13623 =C2=B1  5%  softirqs.CPU99.S=
CHED
>    20190421           -12.1%   17737370 =C2=B1  5%  softirqs.RCU
>     2133170           -16.1%    1790167 =C2=B1  4%  softirqs.SCHED
> =

> =

>                                                                          =
        =

>                             vm-scalability.time.system_time
>                                                                          =
        =

>    22500 +---------------------------------------------------------------=
----+
>    22000 |-+                                                          O  =
  O |
>          |      O    O    O                                 O            =
    |
>    21500 |-O            O      O           O    O O  O                   =
    |
>    21000 |-+  O    O             O  O    O   O            O   O  O O    O=
    |
>    20500 |-+                O         O                O                 =
    |
>    20000 |-+                                                             =
    |
>          |                                                               =
    |
>    19500 |-+                                                             =
    |
>    19000 |-+                                                             =
    |
>    18500 |-+            +                                                =
    |
>    18000 |.+..     +   + :                                               =
    |
>          |       .. + +  : .+..  +..  +                                  =
    |
>    17500 |-+  +.+    +    +     +    +                                   =
    |
>    17000 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                     vm-scalability.time.percent_of_cpu_this_job_got
>                                                                          =
        =

>    11400 +---------------------------------------------------------------=
----+
>    11300 |-+              O                       O  O O  O   O  O O  O  =
    |
>          | O  O O  O O  O      O O    O  O O O  O           O           O=
  O |
>    11200 |-+                O       O                                    =
    |
>    11100 |-+                                                             =
    |
>          |                                                               =
    |
>    11000 |-+                                                             =
    |
>    10900 |-+                                                             =
    |
>    10800 |-+                                                             =
    |
>          |                                                               =
    |
>    10700 |-+                                                             =
    |
>    10600 |-+                                                             =
    |
>          |.+..    .+.  .+.      .+.. .+                                  =
    |
>    10500 |-+  +.+.   +.   +.+..+    +                                    =
    |
>    10400 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                      vm-scalability.time.voluntary_context_switches
>                                                                          =
        =

>    1.3e+06 +-------------------------------------------------------------=
----+
>    1.2e+06 |.+                                                           =
    |
>            |  +              .+.  .+. .+                                 =
    |
>    1.1e+06 |-+ + .+.+..+.+..+   +.   +                                   =
    |
>      1e+06 |-+  +                                                        =
    |
>            |                                                             =
    |
>     900000 |-+                                                           =
    |
>     800000 |-+                                                           =
    |
>     700000 |-+                                                           =
    |
>            |                                                             =
    |
>     600000 |-+                                                           =
    |
>     500000 |-+                                                           =
    |
>            |    O      O      O O    O O  O O O  O O O           O       =
    |
>     400000 |-O    O O    O  O      O                    O O  O O    O O O=
  O |
>     300000 +-------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                 vm-scalability.throughput
>                                                                          =
        =

>    3.2e+07 +-------------------------------------------------------------=
----+
>            | +..                                                         =
    |
>    3.1e+07 |++                                                           =
    |
>            |    +.+.  .+.  .+.+.+..+.+.+                                 =
    |
>      3e+07 |-+      +.   +.                                              =
    |
>            |                                                             =
    |
>    2.9e+07 |-+                                                           =
    |
>            |                                                             =
    |
>    2.8e+07 |-+                                                           =
    |
>            |                                                             =
    |
>    2.7e+07 |-+                                                           =
    |
>            |                                                             =
    |
>    2.6e+07 |-+  O             O        O  O O O  O O O  O O      O  O    =
    |
>            | O    O O  O O  O   O  O O                         O      O O=
    |
>    2.5e+07 +-------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                  vm-scalability.median
>                                                                          =
        =

>    220000 +--------------------------------------------------------------=
----+
>    215000 |-+..                                                          =
    |
>           |+   +.+.. .+.  .+.+..+.+.+..+                                 =
    |
>    210000 |-+       +   +.                                               =
    |
>    205000 |-+                                                            =
    |
>           |                                                              =
    |
>    200000 |-+                                                            =
    |
>    195000 |-+                                                            =
    |
>    190000 |-+                                                            =
    |
>           |                                                              =
    |
>    185000 |-+                                                            =
    |
>    180000 |-+  O             O    O O  O O  O O O  O O O  O      O O     =
    |
>           | O    O  O O O  O    O                           O  O      O O=
    |
>    175000 |-+                                                            =
  O |
>    170000 +--------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                  vm-scalability.workload
>                                                                          =
        =

>    8.4e+09 +-------------------------------------------------------------=
----+
>            | +                                                           =
    |
>    8.2e+09 |:++                                                          =
    |
>            |:  +                                                         =
    |
>      8e+09 |-+  +.+.+..+.+..+.+.+..+.+.+                                 =
    |
>            |                                                             =
    |
>    7.8e+09 |-+                                                           =
    |
>            |                                                             =
    |
>    7.6e+09 |-+                                                           =
    |
>            |                                                             =
    |
>    7.4e+09 |-+                                                           =
    |
>            |                                                             =
    |
>    7.2e+09 |-+                                                           =
    |
>            | O  O O O  O O  O O O  O O O  O O O  O O O  O O  O O O  O O O=
  O |
>      7e+09 +-------------------------------------------------------------=
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
> Oliver Sang
> =

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============0468907580058986244==--

