Content-Type: multipart/mixed; boundary="===============6574453713663178914=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 8212a964ee: vm-scalability.throughput 30.5% improvement
Date: Sat, 12 Mar 2022 19:58:49 +0100
Message-ID: <15307f8a-c202-75d8-1361-dae0146df734@suse.cz>
In-Reply-To: <20220312154321.GC1189@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6574453713663178914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/12/22 16:43, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a 30.5% improvement of vm-scalability.throughput due to c=
ommit:
> =

> =

> commit: 8212a964ee020471104e34dce7029dec33c218a9 ("Re: [PATCH v2] mm/page=
_alloc: call check_new_pages() while zone spinlock is not held")
> url: https://github.com/0day-ci/linux/commits/Mel-Gorman/Re-PATCH-v2-mm-p=
age_alloc-call-check_new_pages-while-zone-spinlock-is-not-held/20220309-203=
504
> patch link: https://lore.kernel.org/lkml/20220309123245.GI15701(a)techsin=
gularity.net

Heh, that's weird. I would expect some improvement from Eric's patch,
but this seems to be actually about Mel's "mm/page_alloc: check
high-order pages for corruption during PCP operations" applied directly
on 5.17-rc7 per the github url above. This was rather expected to make
performance worse if anything, so maybe the improvement is due to some
unexpected side-effect of different inlining decisions or cache alignment...

> in testcase: vm-scalability
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU=
 @ 2.60GHz with 128G memory
> with following parameters:
> =

> 	runtime: 300s
> 	size: 512G
> 	test: anon-w-rand-hugetlb
> 	cpufreq_governor: performance
> 	ucode: 0xd000331
> =

> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/
> =

> =

> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/debian-10.4-x86_64-20200603.cgz/300s/=
512G/lkp-icl-2sp5/anon-w-rand-hugetlb/vm-scalability/0xd000331
> =

> commit: =

>   v5.17-rc7
>   8212a964ee ("mm/page_alloc: call check_new_pages() while zone spinlock =
is not held")
> =

>        v5.17-rc7 8212a964ee020471104e34dce70 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>       0.00 =C2=B1  5%      -7.4%       0.00 =C2=B1  4%  vm-scalability.fr=
ee_time
>      47190 =C2=B1  2%     +25.5%      59208 =C2=B1  2%  vm-scalability.me=
dian
>    6352467 =C2=B1  2%     +30.5%    8293110 =C2=B1  2%  vm-scalability.th=
roughput
>     218.97 =C2=B1  2%     -18.7%     177.98 =C2=B1  3%  vm-scalability.ti=
me.elapsed_time
>     218.97 =C2=B1  2%     -18.7%     177.98 =C2=B1  3%  vm-scalability.ti=
me.elapsed_time.max
>     121357 =C2=B1  7%     -24.9%      91162 =C2=B1 10%  vm-scalability.ti=
me.involuntary_context_switches
>      11226            -5.2%      10641        vm-scalability.time.percent=
_of_cpu_this_job_got
>       2311 =C2=B1  3%     -35.2%       1496 =C2=B1  6%  vm-scalability.ti=
me.system_time
>      22275 =C2=B1  2%     -21.7%      17443 =C2=B1  3%  vm-scalability.ti=
me.user_time
>       9358 =C2=B1  3%     -13.1%       8130        vm-scalability.time.vo=
luntary_context_switches
>     255.23           -16.1%     214.10 =C2=B1  2%  uptime.boot
>       2593            +6.8%       2771 =C2=B1  5%  vmstat.system.cs
>      11.51 =C2=B1  7%      +4.5       16.05 =C2=B1  8%  mpstat.cpu.all.id=
le%
>       8.48 =C2=B1  2%      -1.6        6.84 =C2=B1  3%  mpstat.cpu.all.sy=
s%
>     727581 =C2=B1 12%     -17.2%     602238 =C2=B1  6%  numa-numastat.nod=
e1.local_node
>     798037 =C2=B1  8%     -13.3%     691955 =C2=B1  6%  numa-numastat.nod=
e1.numa_hit
>    5806206 =C2=B1 17%     +26.7%    7356010 =C2=B1 10%  turbostat.C1E
>       9.55 =C2=B1 26%      +5.9       15.48 =C2=B1  9%  turbostat.C1E%
>   59854751 =C2=B1  2%     -17.8%   49202950 =C2=B1  3%  turbostat.IRQ
>      42804 =C2=B1  6%     -54.9%      19301 =C2=B1 21%  meminfo.Active
>      41832 =C2=B1  7%     -56.2%      18325 =C2=B1 23%  meminfo.Active(an=
on)
>      63386 =C2=B1  6%     -26.6%      46542 =C2=B1  3%  meminfo.Mapped
>     137758           -25.5%     102591 =C2=B1  3%  meminfo.Shmem
>      36980 =C2=B1  5%     -62.6%      13823 =C2=B1 29%  numa-meminfo.node=
1.Active
>      36495 =C2=B1  5%     -63.9%      13173 =C2=B1 30%  numa-meminfo.node=
1.Active(anon)
>      19454 =C2=B1 26%     -57.7%       8233 =C2=B1 33%  numa-meminfo.node=
1.Mapped
>      65896 =C2=B1 38%     -67.8%      21189 =C2=B1 13%  numa-meminfo.node=
1.Shmem
>       9185 =C2=B1  6%     -64.7%       3246 =C2=B1 31%  numa-vmstat.node1=
.nr_active_anon
>       4769 =C2=B1 26%     -54.5%       2171 =C2=B1 32%  numa-vmstat.node1=
.nr_mapped
>      16462 =C2=B1 37%     -68.1%       5258 =C2=B1 14%  numa-vmstat.node1=
.nr_shmem
>       9185 =C2=B1  6%     -64.7%       3246 =C2=B1 31%  numa-vmstat.node1=
.nr_zone_active_anon
>      10436 =C2=B1  5%     -56.2%       4570 =C2=B1 23%  proc-vmstat.nr_ac=
tive_anon
>      69290            +1.3%      70203        proc-vmstat.nr_anon_pages
>    1717695            +4.5%    1794462        proc-vmstat.nr_dirty_backgr=
ound_threshold
>    3439592            +4.5%    3593312        proc-vmstat.nr_dirty_thresh=
old
>     640952            -1.4%     632171        proc-vmstat.nr_file_pages
>   17356030            +4.4%   18125242        proc-vmstat.nr_free_pages
>      93258            -2.4%      91059        proc-vmstat.nr_inactive_anon
>      16187 =C2=B1  5%     -26.4%      11911 =C2=B1  2%  proc-vmstat.nr_ma=
pped
>      34477 =C2=B1  2%     -25.6%      25663 =C2=B1  4%  proc-vmstat.nr_sh=
mem
>      10436 =C2=B1  5%     -56.2%       4570 =C2=B1 23%  proc-vmstat.nr_zo=
ne_active_anon
>      93258            -2.4%      91059        proc-vmstat.nr_zone_inactiv=
e_anon
>      32151 =C2=B1 16%     -61.0%      12542 =C2=B1 13%  proc-vmstat.numa_=
hint_faults
>      21214 =C2=B1 22%     -86.0%       2964 =C2=B1 45%  proc-vmstat.numa_=
hint_faults_local
>    1598135           -10.9%    1423466        proc-vmstat.numa_hit
>    1481881           -11.8%    1307551        proc-vmstat.numa_local
>     117279            -1.2%     115916        proc-vmstat.numa_other
>     555445 =C2=B1 16%     -53.2%     260178 =C2=B1 53%  proc-vmstat.numa_=
pte_updates
>      93889 =C2=B1  4%     -74.3%      24113 =C2=B1  7%  proc-vmstat.pgact=
ivate
>    1599893           -11.0%    1424527        proc-vmstat.pgalloc_normal
>    1594626           -14.2%    1368920        proc-vmstat.pgfault
>    1609987           -20.8%    1275284        proc-vmstat.pgfree
>      49893           -14.8%      42496 =C2=B1  5%  proc-vmstat.pgreuse
>      15.23 =C2=B1  2%      -7.8%      14.04        perf-stat.i.MPKI
>  1.348e+10           +22.0%  1.645e+10 =C2=B1  3%  perf-stat.i.branch-ins=
tructions
>  6.957e+08 =C2=B1  2%     +22.4%  8.517e+08 =C2=B1  3%  perf-stat.i.cache=
-misses
>  7.117e+08 =C2=B1  2%     +22.4%   8.71e+08 =C2=B1  3%  perf-stat.i.cache=
-references
>       7.86 =C2=B1  2%     -29.0%       5.58 =C2=B1  6%  perf-stat.i.cpi
>  3.739e+11            -5.1%  3.549e+11        perf-stat.i.cpu-cycles
>     550.18 =C2=B1  3%     -22.2%     427.87 =C2=B1  5%  perf-stat.i.cycle=
s-between-cache-misses
>  1.605e+10           +22.1%  1.959e+10 =C2=B1  3%  perf-stat.i.dTLB-loads
>       0.02 =C2=B1  3%      -0.0        0.01 =C2=B1  4%  perf-stat.i.dTLB-=
store-miss-rate%
>     921125 =C2=B1  2%      -4.6%     878569        perf-stat.i.dTLB-store=
-misses
>  5.803e+09           +22.0%  7.078e+09 =C2=B1  3%  perf-stat.i.dTLB-stores
>  5.665e+10           +22.0%  6.911e+10 =C2=B1  3%  perf-stat.i.instructio=
ns
>       0.16 =C2=B1  3%     +26.1%       0.20 =C2=B1  3%  perf-stat.i.ipc
>       2.92            -5.1%       2.77        perf-stat.i.metric.GHz
>     123.32 =C2=B1 16%    +158.4%     318.61 =C2=B1 22%  perf-stat.i.metri=
c.K/sec
>     286.92           +21.8%     349.59 =C2=B1  3%  perf-stat.i.metric.M/s=
ec
>       6641            +4.8%       6957 =C2=B1  2%  perf-stat.i.minor-faul=
ts
>     586608 =C2=B1 12%     +36.4%     800024 =C2=B1  7%  perf-stat.i.node-=
loads
>      26.79 =C2=B1  4%     -10.5       16.31 =C2=B1 12%  perf-stat.i.node-=
store-miss-rate%
>  1.785e+08 =C2=B1  2%     -27.7%  1.291e+08 =C2=B1  7%  perf-stat.i.node-=
store-misses
>  5.131e+08 =C2=B1  3%     +39.8%  7.172e+08 =C2=B1  5%  perf-stat.i.node-=
stores
>       6643            +4.8%       6959 =C2=B1  2%  perf-stat.i.page-faults
>       0.02 =C2=B1 18%      -0.0        0.01 =C2=B1  4%  perf-stat.overall=
.branch-miss-rate%
>       6.66 =C2=B1  2%     -22.5%       5.16 =C2=B1  3%  perf-stat.overall=
.cpi
>     539.35 =C2=B1  2%     -22.7%     416.69 =C2=B1  3%  perf-stat.overall=
.cycles-between-cache-misses
>       0.02 =C2=B1  3%      -0.0        0.01 =C2=B1  3%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.15 =C2=B1  2%     +29.1%       0.19 =C2=B1  3%  perf-stat.overall=
.ipc
>      25.88 =C2=B1  4%     -10.6       15.28 =C2=B1 10%  perf-stat.overall=
.node-store-miss-rate%
>  1.325e+10 =C2=B1  2%     +22.3%  1.622e+10 =C2=B1  3%  perf-stat.ps.bran=
ch-instructions
>   6.88e+08 =C2=B1  2%     +22.7%  8.444e+08 =C2=B1  3%  perf-stat.ps.cach=
e-misses
>  7.043e+08 =C2=B1  2%     +22.7%  8.638e+08 =C2=B1  3%  perf-stat.ps.cach=
e-references
>  3.708e+11            -5.2%  3.515e+11        perf-stat.ps.cpu-cycles
>  1.577e+10 =C2=B1  2%     +22.4%  1.931e+10 =C2=B1  3%  perf-stat.ps.dTLB=
-loads
>     910623 =C2=B1  2%      -4.6%     868700        perf-stat.ps.dTLB-stor=
e-misses
>  5.701e+09 =C2=B1  2%     +22.3%  6.975e+09 =C2=B1  3%  perf-stat.ps.dTLB=
-stores
>  5.569e+10 =C2=B1  2%     +22.3%  6.813e+10 =C2=B1  3%  perf-stat.ps.inst=
ructions
>       6716            +4.8%       7038        perf-stat.ps.minor-faults
>     595302 =C2=B1 11%     +37.2%     816710 =C2=B1  8%  perf-stat.ps.node=
-loads
>  1.769e+08 =C2=B1  2%     -27.8%  1.277e+08 =C2=B1  7%  perf-stat.ps.node=
-store-misses
>  5.071e+08 =C2=B1  3%     +40.3%  7.113e+08 =C2=B1  5%  perf-stat.ps.node=
-stores
>       6717            +4.8%       7039        perf-stat.ps.page-faults
>       0.00            +0.8        0.80 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.rmqueue_bulk.get=
_page_from_freelist.__alloc_pages
>       0.00            +0.8        0.80 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.rmqueue_bulk.get_page_from_freelist.__alloc_pages=
.alloc_buddy_huge_page
>       0.00            +0.8        0.83 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.rmqueue_bulk.get_page_from_freelist.__alloc_pages.alloc_buddy_hu=
ge_page.alloc_fresh_huge_page
>       0.00            +0.8        0.84 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.__alloc_pages.alloc_buddy_huge_page.alloc_fresh_huge_page.alloc_=
surplus_huge_page.hugetlb_acct_memory
>       0.00            +0.8        0.84 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.get_page_from_freelist.__alloc_pages.alloc_buddy_huge_page.alloc=
_fresh_huge_page.alloc_surplus_huge_page
>       0.00            +0.8        0.84 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.alloc_buddy_huge_page.alloc_fresh_huge_page.alloc_surplus_huge_p=
age.hugetlb_acct_memory.hugetlb_reserve_pages
>       0.00            +0.9        0.85 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.alloc_fresh_huge_page.alloc_surplus_huge_page.hugetlb_acct_memor=
y.hugetlb_reserve_pages.hugetlbfs_file_mmap
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.alloc_surplus_huge_page.hugetlb_acct_memory.hugetlb_reserve_page=
s.hugetlbfs_file_mmap.mmap_region
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.__mmap
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__m=
map
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.__mmap
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.hugetlbfs_file_mmap.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_=
pgoff
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.hugetlb_reserve_pages.hugetlbfs_file_mmap.mmap_region.do_mmap.vm=
_mmap_pgoff
>       0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.hugetlb_acct_memory.hugetlb_reserve_pages.hugetlbfs_file_mmap.mm=
ap_region.do_mmap
>      60.28 =C2=B1  5%      +4.7       64.98 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.do_rw_once
>       0.09 =C2=B1  8%      +0.0        0.11 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       0.14 =C2=B1  7%      +0.0        0.17 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.20 =C2=B1  9%      +0.0        0.24 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.19 =C2=B1  9%      +0.0        0.24 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.19 =C2=B1  9%      +0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.24 =C2=B1  8%      +0.0        0.29 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.40 =C2=B1  8%      +0.1        0.45 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       0.39 =C2=B1  7%      +0.1        0.45 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.26 =C2=B1 71%      +0.6        0.86 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       0.28 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__mmap
>       0.28 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ksys_mmap_pgoff
>       0.27 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.hugetlbfs_file_mmap
>       0.27 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.hugetlb_reserve_pages
>       0.27 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.hugetlb_acct_memory
>       0.27 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.alloc_surplus_huge_page
>       0.28 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.vm_mmap_pgoff
>       0.28 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.do_mmap
>       0.28 =C2=B1 71%      +0.6        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.mmap_region
>       0.55 =C2=B1 44%      +0.6        1.16 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.55 =C2=B1 44%      +0.6        1.16 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       0.12 =C2=B1 71%      +0.7        0.85 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.alloc_fresh_huge_page
>       0.03 =C2=B1 70%      +0.8        0.84 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.alloc_buddy_huge_page
>       0.04 =C2=B1 71%      +0.8        0.84 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.04 =C2=B1 71%      +0.8        0.84 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__alloc_pages
>       0.00            +0.8        0.82 =C2=B1  8%  perf-profile.children.=
cycles-pp._raw_spin_lock
>       0.00            +0.8        0.83 =C2=B1  8%  perf-profile.children.=
cycles-pp.rmqueue_bulk
>       0.26 =C2=B1 71%      +0.6        0.86 =C2=B1  8%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
> =

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

> ---
> 0-DAY CI Kernel Test Service
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
> =

> Thanks,
> Oliver Sang
>=20

--===============6574453713663178914==--

