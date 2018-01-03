Content-Type: multipart/mixed; boundary="===============0795131892642558996=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/cma] 2b0f904a5a: fio.read_bw_MBps -16.1% regression
Date: Wed, 03 Jan 2018 11:05:25 +0900
Message-ID: <20180103020525.GA26517@js1304-P5Q-DELUXE>
In-Reply-To: <20180102063528.GG30397@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0795131892642558996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

On Tue, Jan 02, 2018 at 02:35:28PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -16.1% regression of fio.read_bw_MBps due to commit:
> =

> =

> commit: 2b0f904a5a8781498417d67226fd12c5e56053ae ("mm/cma: manage the mem=
ory of the CMA area by using the ZONE_MOVABLE")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: fio-basic
> on test machine: 56 threads Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz wit=
h 256G memory
> with following parameters:
> =

> 	disk: 2pmem
> 	fs: ext4
> 	runtime: 200s
> 	nr_task: 50%
> 	time_based: tb
> 	rw: randread
> 	bs: 2M
> 	ioengine: mmap
> 	test_size: 200G
> 	cpufreq_governor: performance
> =

> test-description: Fio is a tool that will spawn a number of threads or pr=
ocesses doing a particular type of I/O action as specified by the user.
> test-url: https://github.com/axboe/fio
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
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runt=
ime/rw/tbox_group/test_size/testcase/time_based:
>   2M/gcc-7/performance/2pmem/ext4/mmap/x86_64-rhel-7.2/50%/debian-x86_64-=
2016-08-31.cgz/200s/randread/lkp-hsw-ep6/200G/fio-basic/tb
> =

> commit: =

>   f6572f9cd2 ("mm/page_alloc: don't reserve ZONE_HIGHMEM for ZONE_MOVABLE=
 request")
>   2b0f904a5a ("mm/cma: manage the memory of the CMA area by using the ZON=
E_MOVABLE")
> =

> f6572f9cd248df2c 2b0f904a5a8781498417d67226 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      11451           -16.1%       9605        fio.read_bw_MBps
>       0.29 =C2=B1  5%      +0.1        0.40 =C2=B1  3%  fio.latency_1000u=
s%
>      19.35 =C2=B1  5%      -4.7       14.69 =C2=B1  3%  fio.latency_10ms%
>       7.92 =C2=B1  3%     +12.2       20.15        fio.latency_20ms%
>       0.05 =C2=B1 11%      +0.0        0.09 =C2=B1  8%  fio.latency_2ms%
>      70.22            -8.9       61.36        fio.latency_4ms%
>       0.29 =C2=B1 13%      +0.0        0.33 =C2=B1  3%  fio.latency_500us%
>       0.45 =C2=B1 29%      +1.0        1.45 =C2=B1  4%  fio.latency_50ms%
>       1.37            +0.1        1.44        fio.latency_750us%
>       9792           +31.7%      12896        fio.read_clat_90%_us
>      10560           +33.0%      14048        fio.read_clat_95%_us
>      15376 =C2=B1 10%     +46.9%      22592        fio.read_clat_99%_us
>       4885           +19.2%       5825        fio.read_clat_mean_us
>       5725           -16.1%       4802        fio.read_iops
>  4.598e+09           -16.4%  3.845e+09        fio.time.file_system_inputs
>     453153            -8.4%     415215        fio.time.involuntary_contex=
t_switches
>  5.748e+08           -16.4%  4.806e+08        fio.time.major_page_faults
>    1822257           +23.7%    2254706        fio.time.maximum_resident_s=
et_size
>       5089            +1.6%       5172        fio.time.system_time
>     514.50           -16.3%     430.48        fio.time.user_time

System time is increased and user time is decreased. On the below, there is=
 a clue.

>      24569 =C2=B1  2%      +9.6%      26917 =C2=B1  2%  fio.time.voluntar=
y_context_switches
>   54443725           -14.9%   46353339        interrupts.CAL:Function_cal=
l_interrupts
>       0.00 =C2=B1 79%      -0.0        0.00 =C2=B1 17%  mpstat.cpu.iowait%
>       4.45            -0.7        3.71        mpstat.cpu.usr%
>    1467516           +21.3%    1779543 =C2=B1  3%  meminfo.Active
>    1276031           +23.7%    1578443 =C2=B1  4%  meminfo.Active(file)
>      25789 =C2=B1  3%     -76.7%       6013 =C2=B1  4%  meminfo.CmaFree
>  1.296e+08           -12.6%  1.133e+08        turbostat.IRQ
>      41.89            -3.4%      40.47        turbostat.RAMWatt
>      17444 =C2=B1  2%     -13.5%      15092 =C2=B1  3%  turbostat.SMI
>   10896428           -16.4%    9111830        vmstat.io.bi
>       6010            -6.2%       5637        vmstat.system.cs
>     317438           -12.1%     278980        vmstat.system.in
>    1072892 =C2=B1  3%     +21.5%    1303487        numa-meminfo.node0.Act=
ive
>     978318           +21.6%    1189809 =C2=B1  2%  numa-meminfo.node0.Act=
ive(file)
>     222968           -25.2%     166818        numa-meminfo.node0.PageTabl=
es
>      47374 =C2=B1  2%     +10.6%      52402 =C2=B1  7%  numa-meminfo.node=
0.SUnreclaim
>     165213           +31.9%     217870        numa-meminfo.node1.PageTabl=
es
>     222405           +10.4%     245633 =C2=B1  2%  numa-meminfo.node1.SRe=
claimable
>     102992 =C2=B1 46%     -80.8%      19812 =C2=B1 38%  numa-meminfo.node=
1.Shmem
>  2.475e+08 =C2=B1  2%     -24.0%  1.881e+08        numa-numastat.node0.lo=
cal_node
>   39371795 =C2=B1 14%    +167.1%  1.052e+08 =C2=B1  2%  numa-numastat.nod=
e0.numa_foreign
>  2.475e+08 =C2=B1  2%     -24.0%  1.881e+08        numa-numastat.node0.nu=
ma_hit
>   31890417 =C2=B1 17%     +40.2%   44705135 =C2=B1  8%  numa-numastat.nod=
e0.numa_miss
>   31899482 =C2=B1 17%     +40.2%   44713255 =C2=B1  8%  numa-numastat.nod=
e0.other_node
>  2.566e+08 =C2=B1  2%     -44.2%  1.433e+08        numa-numastat.node1.lo=
cal_node
>   31890417 =C2=B1 17%     +40.2%   44705135 =C2=B1  8%  numa-numastat.nod=
e1.numa_foreign
>  2.566e+08 =C2=B1  2%     -44.2%  1.433e+08        numa-numastat.node1.nu=
ma_hit
>   39371795 =C2=B1 14%    +167.1%  1.052e+08 =C2=B1  2%  numa-numastat.nod=
e1.numa_miss
>   39373660 =C2=B1 14%    +167.1%  1.052e+08 =C2=B1  2%  numa-numastat.nod=
e1.other_node
>       6047 =C2=B1 39%     -66.5%       2028 =C2=B1 63%  sched_debug.cfs_r=
q:/.exec_clock.min
>     461.37 =C2=B1  8%     +64.9%     760.74 =C2=B1 20%  sched_debug.cfs_r=
q:/.load_avg.avg
>       1105 =C2=B1 13%   +1389.3%      16467 =C2=B1 56%  sched_debug.cfs_r=
q:/.load_avg.max
>     408.99 =C2=B1  3%    +495.0%       2433 =C2=B1 49%  sched_debug.cfs_r=
q:/.load_avg.stddev
>      28746 =C2=B1 12%     -18.7%      23366 =C2=B1 14%  sched_debug.cfs_r=
q:/.min_vruntime.min
>     752426 =C2=B1  3%     -12.7%     656636 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.avg
>     144956 =C2=B1 61%     -85.4%      21174 =C2=B1 26%  sched_debug.cpu.a=
vg_idle.min
>     245684 =C2=B1 11%     +44.6%     355257 =C2=B1  2%  sched_debug.cpu.a=
vg_idle.stddev
>     236035 =C2=B1 15%     +51.8%     358264 =C2=B1 16%  sched_debug.cpu.n=
r_switches.max
>      42039 =C2=B1 22%     +34.7%      56616 =C2=B1  8%  sched_debug.cpu.n=
r_switches.stddev
>       3204 =C2=B1 24%     -48.1%       1663 =C2=B1 30%  sched_debug.cpu.s=
ched_count.min
>       2132 =C2=B1 25%     +38.7%       2957 =C2=B1 11%  sched_debug.cpu.s=
ched_count.stddev
>      90.67 =C2=B1 32%     -71.8%      25.58 =C2=B1 26%  sched_debug.cpu.s=
ched_goidle.min
>       6467 =C2=B1 15%     +22.3%       7912 =C2=B1 15%  sched_debug.cpu.t=
twu_count.max
>       1513 =C2=B1 27%     -55.7%     670.92 =C2=B1 22%  sched_debug.cpu.t=
twu_count.min
>       1025 =C2=B1 20%     +68.4%       1727 =C2=B1  9%  sched_debug.cpu.t=
twu_count.stddev
>       1057 =C2=B1 16%     -62.9%     391.85 =C2=B1 31%  sched_debug.cpu.t=
twu_local.min
>     244876           +21.6%     297770 =C2=B1  2%  numa-vmstat.node0.nr_a=
ctive_file
>      88.00 =C2=B1  5%     +19.3%     105.00 =C2=B1  5%  numa-vmstat.node0=
.nr_isolated_file
>      55778           -25.1%      41765        numa-vmstat.node0.nr_page_t=
able_pages
>      11843 =C2=B1  2%     +10.6%      13100 =C2=B1  7%  numa-vmstat.node0=
.nr_slab_unreclaimable
>     159.25 =C2=B1 42%     -74.9%      40.00 =C2=B1 52%  numa-vmstat.node0=
.nr_vmscan_immediate_reclaim
>     244862           +21.6%     297739 =C2=B1  2%  numa-vmstat.node0.nr_z=
one_active_file
>   19364320 =C2=B1 19%    +187.2%   55617595 =C2=B1  2%  numa-vmstat.node0=
.numa_foreign
>     268155 =C2=B1  3%     +49.6%     401089 =C2=B1  4%  numa-vmstat.node0=
.workingset_activate
>  1.229e+08           -19.0%   99590617        numa-vmstat.node0.workingse=
t_refault
>       6345 =C2=B1  3%     -76.5%       1489 =C2=B1  3%  numa-vmstat.node1=
.nr_free_cma
>      41335           +32.0%      54552        numa-vmstat.node1.nr_page_t=
able_pages
>      25770 =C2=B1 46%     -80.8%       4956 =C2=B1 38%  numa-vmstat.node1=
.nr_shmem
>      55684           +10.4%      61475 =C2=B1  2%  numa-vmstat.node1.nr_s=
lab_reclaimable
>  1.618e+08 =C2=B1  8%     -47.6%   84846798 =C2=B1 17%  numa-vmstat.node1=
.numa_hit
>  1.617e+08 =C2=B1  8%     -47.6%   84676284 =C2=B1 17%  numa-vmstat.node1=
.numa_local
>   19365342 =C2=B1 19%    +187.2%   55620100 =C2=B1  2%  numa-vmstat.node1=
.numa_miss
>   19534837 =C2=B1 19%    +185.6%   55790654 =C2=B1  2%  numa-vmstat.node1=
.numa_other
>  1.296e+08           -21.0%  1.024e+08        numa-vmstat.node1.workingse=
t_refault
>  1.832e+12            -7.5%  1.694e+12        perf-stat.branch-instructio=
ns
>       0.25            -0.0        0.23        perf-stat.branch-miss-rate%
>  4.666e+09           -16.0%  3.918e+09        perf-stat.branch-misses
>      39.88            +1.1       40.98        perf-stat.cache-miss-rate%
>  2.812e+10           -11.6%  2.485e+10        perf-stat.cache-misses
>  7.051e+10           -14.0%  6.064e+10        perf-stat.cache-references
>    1260521            -6.1%    1183071        perf-stat.context-switches
>       1.87            +9.6%       2.05        perf-stat.cpi
>       6707 =C2=B1  2%      -5.2%       6359        perf-stat.cpu-migratio=
ns
>       1.04 =C2=B1 11%      -0.3        0.77 =C2=B1  4%  perf-stat.dTLB-lo=
ad-miss-rate%
>  2.365e+10 =C2=B1  7%     -25.9%  1.751e+10 =C2=B1  9%  perf-stat.dTLB-lo=
ad-misses
>   1.05e+12 =C2=B1  4%      -9.5%  9.497e+11 =C2=B1  2%  perf-stat.dTLB-st=
ores
>      28.16            +2.2       30.35 =C2=B1  2%  perf-stat.iTLB-load-mi=
ss-rate%
>   2.56e+08           -10.4%  2.295e+08        perf-stat.iTLB-loads
>  8.974e+12            -9.2%  8.151e+12        perf-stat.instructions
>      89411            -8.8%      81529        perf-stat.instructions-per-=
iTLB-miss
>       0.54            -8.8%       0.49        perf-stat.ipc
>  5.748e+08           -16.4%  4.806e+08        perf-stat.major-faults
>      52.82            +5.8       58.61 =C2=B1  2%  perf-stat.node-load-mi=
ss-rate%
>  7.206e+09 =C2=B1  2%     -18.6%  5.867e+09 =C2=B1  3%  perf-stat.node-lo=
ads
>      17.96 =C2=B1  8%     +15.7       33.69 =C2=B1  2%  perf-stat.node-st=
ore-miss-rate%
>  2.055e+09 =C2=B1  8%     +65.1%  3.393e+09 =C2=B1  4%  perf-stat.node-st=
ore-misses
>  9.391e+09 =C2=B1  2%     -28.9%  6.675e+09        perf-stat.node-stores
>  5.753e+08           -16.4%  4.811e+08        perf-stat.page-faults
>     305865           -16.3%     256108        proc-vmstat.allocstall_mova=
ble
>       1923 =C2=B1 14%     -72.1%     537.00 =C2=B1 12%  proc-vmstat.alloc=
stall_normal
>       0.00            +Inf%       1577 =C2=B1 67%  proc-vmstat.compact_is=
olated
>       1005 =C2=B1  4%     -65.8%     344.00 =C2=B1  7%  proc-vmstat.kswap=
d_low_wmark_hit_quickly
>     320062           +23.2%     394374 =C2=B1  4%  proc-vmstat.nr_active_=
file
>       6411 =C2=B1  2%     -76.4%       1511 =C2=B1  4%  proc-vmstat.nr_fr=
ee_cma
>     277.00 =C2=B1 12%     -51.4%     134.75 =C2=B1 52%  proc-vmstat.nr_vm=
scan_immediate_reclaim
>     320049           +23.2%     394353 =C2=B1  4%  proc-vmstat.nr_zone_ac=
tive_file
>   71262212 =C2=B1 15%    +110.3%  1.499e+08 =C2=B1  3%  proc-vmstat.numa_=
foreign
>  5.042e+08 =C2=B1  2%     -34.3%  3.314e+08        proc-vmstat.numa_hit
>  5.041e+08 =C2=B1  2%     -34.3%  3.314e+08        proc-vmstat.numa_local
>   71262212 =C2=B1 15%    +110.3%  1.499e+08 =C2=B1  3%  proc-vmstat.numa_=
miss
>   71273176 =C2=B1 15%    +110.3%  1.499e+08 =C2=B1  3%  proc-vmstat.numa_=
other
>       1007 =C2=B1  4%     -65.6%     346.25 =C2=B1  7%  proc-vmstat.pageo=
utrun
>   23070268           -16.0%   19386190        proc-vmstat.pgalloc_dma32
>  5.525e+08           -16.7%  4.603e+08        proc-vmstat.pgalloc_normal
>  5.753e+08           -16.4%  4.812e+08        proc-vmstat.pgfault
>  5.751e+08           -16.3%  4.813e+08        proc-vmstat.pgfree
>  5.748e+08           -16.4%  4.806e+08        proc-vmstat.pgmajfault
>  2.299e+09           -16.4%  1.923e+09        proc-vmstat.pgpgin
>  8.396e+08           -17.8%  6.901e+08        proc-vmstat.pgscan_direct
>  3.018e+08 =C2=B1  2%     -13.0%  2.627e+08        proc-vmstat.pgscan_ksw=
apd
>    4.1e+08           -15.1%   3.48e+08        proc-vmstat.pgsteal_direct
>  1.542e+08 =C2=B1  3%     -20.9%   1.22e+08 =C2=B1  3%  proc-vmstat.pgste=
al_kswapd
>      23514 =C2=B1  4%     -23.1%      18076 =C2=B1 16%  proc-vmstat.slabs=
_scanned
>     343040 =C2=B1  2%     +40.3%     481253 =C2=B1  2%  proc-vmstat.worki=
ngset_activate
>  2.525e+08           -20.1%  2.018e+08        proc-vmstat.workingset_refa=
ult
>      13.64 =C2=B1  3%      -1.7       11.96 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.ext4_mpage_readpages.filemap_fault.ext4_filemap_fault.__do_=
fault.__handle_mm_fault
>      11.67 =C2=B1  3%      -1.4       10.29 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.submit_bio.ext4_mpage_readpages.filemap_fault.ext4_filemap_=
fault.__do_fault
>      11.64 =C2=B1  3%      -1.4       10.25 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.generic_make_request.submit_bio.ext4_mpage_readpages.filema=
p_fault.ext4_filemap_fault
>      11.10 =C2=B1  3%      -1.3        9.82 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.pmem_make_request.generic_make_request.submit_bio.ext4_mpag=
e_readpages.filemap_fault
>       9.21 =C2=B1  3%      -1.2        8.04 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.pmem_do_bvec.pmem_make_request.generic_make_request.submit_=
bio.ext4_mpage_readpages
>      27.33 =C2=B1  4%      -1.0       26.35 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      27.33 =C2=B1  4%      -1.0       26.35 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64
>      27.33 =C2=B1  4%      -1.0       26.35 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_seconda=
ry.secondary_startup_64
>      27.33 =C2=B1  4%      -1.0       26.35 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64
>      26.79 =C2=B1  4%      -0.8       25.98 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.st=
art_secondary
>      27.98 =C2=B1  3%      -0.8       27.22 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.secondary_startup_64
>       5.36 =C2=B1 12%      -0.6        4.76 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.kswapd.kthread.ret_from_fork
>       5.36 =C2=B1 12%      -0.6        4.76 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.shrink_node.kswapd.kthread.ret_from_fork
>       5.30 =C2=B1 12%      -0.6        4.71 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.shrink_inactive_list.shrink_node_memcg.shrink_node.kswapd.k=
thread
>       5.35 =C2=B1 12%      -0.6        4.76 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.shrink_node_memcg.shrink_node.kswapd.kthread.ret_from_fork
>       5.43 =C2=B1 12%      -0.5        4.88 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       5.43 =C2=B1 12%      -0.5        4.88 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>      11.04 =C2=B1  2%      -0.2       10.82 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.shrink_page_list.shrink_inactive_list.shrink_node_memcg.shr=
ink_node.do_try_to_free_pages
>      62.44 =C2=B1  2%      +1.9       64.38        perf-profile.calltrace=
.cycles-pp.page_fault
>      62.38 =C2=B1  2%      +2.0       64.33        perf-profile.calltrace=
.cycles-pp.__do_page_fault.do_page_fault.page_fault
>      62.38 =C2=B1  2%      +2.0       64.34        perf-profile.calltrace=
.cycles-pp.do_page_fault.page_fault
>      61.52 =C2=B1  2%      +2.1       63.58        perf-profile.calltrace=
.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>      61.34 =C2=B1  2%      +2.1       63.44        perf-profile.calltrace=
.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fault.=
page_fault
>      30.18 =C2=B1  3%      +2.3       32.45 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.shrink_inactive_list.shrink_node_memcg.shrink_node.do_try_t=
o_free_pages.try_to_free_pages
>       7.98 =C2=B1  3%      +2.3       10.33 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.add_to_page_cache_lru.filemap_fault.ext4_filemap_fault.__do=
_fault.__handle_mm_fault
>      30.48 =C2=B1  3%      +2.4       32.83 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_node=
mask.filemap_fault.ext4_filemap_fault
>      30.46 =C2=B1  3%      +2.4       32.81 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpa=
th.__alloc_pages_nodemask.filemap_fault
>      30.46 =C2=B1  3%      +2.4       32.81 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_=
pages_slowpath.__alloc_pages_nodemask
>      30.37 =C2=B1  3%      +2.4       32.75 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.shrink_node_memcg.shrink_node.do_try_to_free_pages.try_to_f=
ree_pages.__alloc_pages_slowpath
>       5.58 =C2=B1  4%      +2.5        8.08 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__lru_cache_add.add_to_page_cache_lru.filemap_fault.ext4_fi=
lemap_fault.__do_fault
>      32.88 =C2=B1  3%      +2.5       35.38 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__alloc_pages_nodemask.filemap_fault.ext4_filemap_fault.__d=
o_fault.__handle_mm_fault
>       5.51 =C2=B1  4%      +2.5        8.02 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.pagevec_lru_move_fn.__lru_cache_add.add_to_page_cache_lru.f=
ilemap_fault.ext4_filemap_fault
>       4.24 =C2=B1  4%      +2.5        6.76 =C2=B1  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.__lru_cache_add.=
add_to_page_cache_lru.filemap_fault
>       4.18 =C2=B1  4%      +2.5        6.70 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.pag=
evec_lru_move_fn.__lru_cache_add.add_to_page_cache_lru
>      18.64 =C2=B1  3%      +2.5       21.16 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.shrink_=
inactive_list.shrink_node_memcg.shrink_node
>      31.65 =C2=B1  3%      +2.7       34.31 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__alloc_pages_slowpath.__alloc_pages_nodemask.filemap_fault=
.ext4_filemap_fault.__do_fault
>      17.21 =C2=B1  3%      +2.7       19.93 =C2=B1  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irq.shrink_inactive_list.shrink_node_memcg.s=
hrink_node.do_try_to_free_pages

It looks like there is more lru lock contention. It would be caused by
using a movable zone for the CMA memory by this patch. In this case,
reclaim for normal memory skips the lru page on the movable zone so needs
more time to find enough reclaim target pages. It would increase lru lock
holding time and then cause contention.

Could you give me another stat 'pgskip_XXX' in /proc/vmstat to confirm
my theory?

BTW, other stats for memory management looks better than before,
less nr_free_cma, less pgmajfault, less reclaim scan/steal.

Thanks.

--===============0795131892642558996==--

