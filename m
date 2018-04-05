Content-Type: multipart/mixed; boundary="===============1100011139090045007=="
MIME-Version: 1.0
From: Joonsoo Kim <js1304@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm/cma] 2b0f904a5a: fio.read_bw_MBps -16.1% regression
Date: Thu, 05 Apr 2018 16:48:21 +0900
Message-ID: <CAAmzW4OhAdBKy1m1mTyM36hm6vd-tVj31d25yLXfC1x4Sx+dDg@mail.gmail.com>
In-Reply-To: <20180109071628.GA24741@js1304-P5Q-DELUXE>
List-Id: <oe-lkp.lists.linux.dev>

--===============1100011139090045007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
sorry for bothering you.

2018-01-09 16:16 GMT+09:00 Joonsoo Kim <iamjoonsoo.kim@lge.com>:
> On Sat, Jan 06, 2018 at 05:26:31PM +0800, Ye Xiaolong wrote:
>> Hi,
>>
>> On 01/03, Joonsoo Kim wrote:
>> >Hello!
>> >
>> >On Tue, Jan 02, 2018 at 02:35:28PM +0800, kernel test robot wrote:
>> >>
>> >> Greeting,
>> >>
>> >> FYI, we noticed a -16.1% regression of fio.read_bw_MBps due to commit:
>> >>
>> >>
>> >> commit: 2b0f904a5a8781498417d67226fd12c5e56053ae ("mm/cma: manage the=
 memory of the CMA area by using the ZONE_MOVABLE")
>> >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
>> >>
>> >> in testcase: fio-basic
>> >> on test machine: 56 threads Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz=
 with 256G memory
>> >> with following parameters:
>> >>
>> >>    disk: 2pmem
>> >>    fs: ext4
>> >>    runtime: 200s
>> >>    nr_task: 50%
>> >>    time_based: tb
>> >>    rw: randread
>> >>    bs: 2M
>> >>    ioengine: mmap
>> >>    test_size: 200G
>> >>    cpufreq_governor: performance
>> >>
>> >> test-description: Fio is a tool that will spawn a number of threads o=
r processes doing a particular type of I/O action as specified by the user.
>> >> test-url: https://github.com/axboe/fio
>> >>
>> >>
>> >>
>> >> Details are as below:
>> >> ---------------------------------------------------------------------=
----------------------------->
>> >>
>> >>
>> >> To reproduce:
>> >>
>> >>         git clone https://github.com/intel/lkp-tests.git
>> >>         cd lkp-tests
>> >>         bin/lkp install job.yaml  # job file is attached in this email
>> >>         bin/lkp run     job.yaml
>> >>
>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/=
runtime/rw/tbox_group/test_size/testcase/time_based:
>> >>   2M/gcc-7/performance/2pmem/ext4/mmap/x86_64-rhel-7.2/50%/debian-x86=
_64-2016-08-31.cgz/200s/randread/lkp-hsw-ep6/200G/fio-basic/tb
>> >>
>> >> commit:
>> >>   f6572f9cd2 ("mm/page_alloc: don't reserve ZONE_HIGHMEM for ZONE_MOV=
ABLE request")
>> >>   2b0f904a5a ("mm/cma: manage the memory of the CMA area by using the=
 ZONE_MOVABLE")
>> >>
>> >> f6572f9cd248df2c 2b0f904a5a8781498417d67226
>> >> ---------------- --------------------------
>> >>          %stddev     %change         %stddev
>> >>              \          |                \
>> >>      11451           -16.1%       9605        fio.read_bw_MBps
>> >>       0.29 =C4=85  5%      +0.1        0.40 =C4=85  3%  fio.latency_1=
000us%
>> >>      19.35 =C4=85  5%      -4.7       14.69 =C4=85  3%  fio.latency_1=
0ms%
>> >>       7.92 =C4=85  3%     +12.2       20.15        fio.latency_20ms%
>> >>       0.05 =C4=85 11%      +0.0        0.09 =C4=85  8%  fio.latency_2=
ms%
>> >>      70.22            -8.9       61.36        fio.latency_4ms%
>> >>       0.29 =C4=85 13%      +0.0        0.33 =C4=85  3%  fio.latency_5=
00us%
>> >>       0.45 =C4=85 29%      +1.0        1.45 =C4=85  4%  fio.latency_5=
0ms%
>> >>       1.37            +0.1        1.44        fio.latency_750us%
>> >>       9792           +31.7%      12896        fio.read_clat_90%_us
>> >>      10560           +33.0%      14048        fio.read_clat_95%_us
>> >>      15376 =C4=85 10%     +46.9%      22592        fio.read_clat_99%_=
us
>> >>       4885           +19.2%       5825        fio.read_clat_mean_us
>> >>       5725           -16.1%       4802        fio.read_iops
>> >>  4.598e+09           -16.4%  3.845e+09        fio.time.file_system_in=
puts
>> >>     453153            -8.4%     415215        fio.time.involuntary_co=
ntext_switches
>> >>  5.748e+08           -16.4%  4.806e+08        fio.time.major_page_fau=
lts
>> >>    1822257           +23.7%    2254706        fio.time.maximum_reside=
nt_set_size
>> >>       5089            +1.6%       5172        fio.time.system_time
>> >>     514.50           -16.3%     430.48        fio.time.user_time
>> >
>> >System time is increased and user time is decreased. On the below, ther=
e is a clue.
>> >
>> >>      24569 =C4=85  2%      +9.6%      26917 =C4=85  2%  fio.time.volu=
ntary_context_switches
>> >>   54443725           -14.9%   46353339        interrupts.CAL:Function=
_call_interrupts
>> >>       0.00 =C4=85 79%      -0.0        0.00 =C4=85 17%  mpstat.cpu.io=
wait%
>> >>       4.45            -0.7        3.71        mpstat.cpu.usr%
>> >>    1467516           +21.3%    1779543 =C4=85  3%  meminfo.Active
>> >>    1276031           +23.7%    1578443 =C4=85  4%  meminfo.Active(fil=
e)
>> >>      25789 =C4=85  3%     -76.7%       6013 =C4=85  4%  meminfo.CmaFr=
ee
>> >>  1.296e+08           -12.6%  1.133e+08        turbostat.IRQ
>> >>      41.89            -3.4%      40.47        turbostat.RAMWatt
>> >>      17444 =C4=85  2%     -13.5%      15092 =C4=85  3%  turbostat.SMI
>> >>   10896428           -16.4%    9111830        vmstat.io.bi
>> >>       6010            -6.2%       5637        vmstat.system.cs
>> >>     317438           -12.1%     278980        vmstat.system.in
>> >>    1072892 =C4=85  3%     +21.5%    1303487        numa-meminfo.node0=
.Active
>> >>     978318           +21.6%    1189809 =C4=85  2%  numa-meminfo.node0=
.Active(file)
>> >>     222968           -25.2%     166818        numa-meminfo.node0.Page=
Tables
>> >>      47374 =C4=85  2%     +10.6%      52402 =C4=85  7%  numa-meminfo.=
node0.SUnreclaim
>> >>     165213           +31.9%     217870        numa-meminfo.node1.Page=
Tables
>> >>     222405           +10.4%     245633 =C4=85  2%  numa-meminfo.node1=
.SReclaimable
>> >>     102992 =C4=85 46%     -80.8%      19812 =C4=85 38%  numa-meminfo.=
node1.Shmem
>> >>  2.475e+08 =C4=85  2%     -24.0%  1.881e+08        numa-numastat.node=
0.local_node
>> >>   39371795 =C4=85 14%    +167.1%  1.052e+08 =C4=85  2%  numa-numastat=
.node0.numa_foreign
>> >>  2.475e+08 =C4=85  2%     -24.0%  1.881e+08        numa-numastat.node=
0.numa_hit
>> >>   31890417 =C4=85 17%     +40.2%   44705135 =C4=85  8%  numa-numastat=
.node0.numa_miss
>> >>   31899482 =C4=85 17%     +40.2%   44713255 =C4=85  8%  numa-numastat=
.node0.other_node
>> >>  2.566e+08 =C4=85  2%     -44.2%  1.433e+08        numa-numastat.node=
1.local_node
>> >>   31890417 =C4=85 17%     +40.2%   44705135 =C4=85  8%  numa-numastat=
.node1.numa_foreign
>> >>  2.566e+08 =C4=85  2%     -44.2%  1.433e+08        numa-numastat.node=
1.numa_hit
>> >>   39371795 =C4=85 14%    +167.1%  1.052e+08 =C4=85  2%  numa-numastat=
.node1.numa_miss
>> >>   39373660 =C4=85 14%    +167.1%  1.052e+08 =C4=85  2%  numa-numastat=
.node1.other_node
>> >>       6047 =C4=85 39%     -66.5%       2028 =C4=85 63%  sched_debug.c=
fs_rq:/.exec_clock.min
>> >>     461.37 =C4=85  8%     +64.9%     760.74 =C4=85 20%  sched_debug.c=
fs_rq:/.load_avg.avg
>> >>       1105 =C4=85 13%   +1389.3%      16467 =C4=85 56%  sched_debug.c=
fs_rq:/.load_avg.max
>> >>     408.99 =C4=85  3%    +495.0%       2433 =C4=85 49%  sched_debug.c=
fs_rq:/.load_avg.stddev
>> >>      28746 =C4=85 12%     -18.7%      23366 =C4=85 14%  sched_debug.c=
fs_rq:/.min_vruntime.min
>> >>     752426 =C4=85  3%     -12.7%     656636 =C4=85  4%  sched_debug.c=
pu.avg_idle.avg
>> >>     144956 =C4=85 61%     -85.4%      21174 =C4=85 26%  sched_debug.c=
pu.avg_idle.min
>> >>     245684 =C4=85 11%     +44.6%     355257 =C4=85  2%  sched_debug.c=
pu.avg_idle.stddev
>> >>     236035 =C4=85 15%     +51.8%     358264 =C4=85 16%  sched_debug.c=
pu.nr_switches.max
>> >>      42039 =C4=85 22%     +34.7%      56616 =C4=85  8%  sched_debug.c=
pu.nr_switches.stddev
>> >>       3204 =C4=85 24%     -48.1%       1663 =C4=85 30%  sched_debug.c=
pu.sched_count.min
>> >>       2132 =C4=85 25%     +38.7%       2957 =C4=85 11%  sched_debug.c=
pu.sched_count.stddev
>> >>      90.67 =C4=85 32%     -71.8%      25.58 =C4=85 26%  sched_debug.c=
pu.sched_goidle.min
>> >>       6467 =C4=85 15%     +22.3%       7912 =C4=85 15%  sched_debug.c=
pu.ttwu_count.max
>> >>       1513 =C4=85 27%     -55.7%     670.92 =C4=85 22%  sched_debug.c=
pu.ttwu_count.min
>> >>       1025 =C4=85 20%     +68.4%       1727 =C4=85  9%  sched_debug.c=
pu.ttwu_count.stddev
>> >>       1057 =C4=85 16%     -62.9%     391.85 =C4=85 31%  sched_debug.c=
pu.ttwu_local.min
>> >>     244876           +21.6%     297770 =C4=85  2%  numa-vmstat.node0.=
nr_active_file
>> >>      88.00 =C4=85  5%     +19.3%     105.00 =C4=85  5%  numa-vmstat.n=
ode0.nr_isolated_file
>> >>      55778           -25.1%      41765        numa-vmstat.node0.nr_pa=
ge_table_pages
>> >>      11843 =C4=85  2%     +10.6%      13100 =C4=85  7%  numa-vmstat.n=
ode0.nr_slab_unreclaimable
>> >>     159.25 =C4=85 42%     -74.9%      40.00 =C4=85 52%  numa-vmstat.n=
ode0.nr_vmscan_immediate_reclaim
>> >>     244862           +21.6%     297739 =C4=85  2%  numa-vmstat.node0.=
nr_zone_active_file
>> >>   19364320 =C4=85 19%    +187.2%   55617595 =C4=85  2%  numa-vmstat.n=
ode0.numa_foreign
>> >>     268155 =C4=85  3%     +49.6%     401089 =C4=85  4%  numa-vmstat.n=
ode0.workingset_activate
>> >>  1.229e+08           -19.0%   99590617        numa-vmstat.node0.worki=
ngset_refault
>> >>       6345 =C4=85  3%     -76.5%       1489 =C4=85  3%  numa-vmstat.n=
ode1.nr_free_cma
>> >>      41335           +32.0%      54552        numa-vmstat.node1.nr_pa=
ge_table_pages
>> >>      25770 =C4=85 46%     -80.8%       4956 =C4=85 38%  numa-vmstat.n=
ode1.nr_shmem
>> >>      55684           +10.4%      61475 =C4=85  2%  numa-vmstat.node1.=
nr_slab_reclaimable
>> >>  1.618e+08 =C4=85  8%     -47.6%   84846798 =C4=85 17%  numa-vmstat.n=
ode1.numa_hit
>> >>  1.617e+08 =C4=85  8%     -47.6%   84676284 =C4=85 17%  numa-vmstat.n=
ode1.numa_local
>> >>   19365342 =C4=85 19%    +187.2%   55620100 =C4=85  2%  numa-vmstat.n=
ode1.numa_miss
>> >>   19534837 =C4=85 19%    +185.6%   55790654 =C4=85  2%  numa-vmstat.n=
ode1.numa_other
>> >>  1.296e+08           -21.0%  1.024e+08        numa-vmstat.node1.worki=
ngset_refault
>> >>  1.832e+12            -7.5%  1.694e+12        perf-stat.branch-instru=
ctions
>> >>       0.25            -0.0        0.23        perf-stat.branch-miss-r=
ate%
>> >>  4.666e+09           -16.0%  3.918e+09        perf-stat.branch-misses
>> >>      39.88            +1.1       40.98        perf-stat.cache-miss-ra=
te%
>> >>  2.812e+10           -11.6%  2.485e+10        perf-stat.cache-misses
>> >>  7.051e+10           -14.0%  6.064e+10        perf-stat.cache-referen=
ces
>> >>    1260521            -6.1%    1183071        perf-stat.context-switc=
hes
>> >>       1.87            +9.6%       2.05        perf-stat.cpi
>> >>       6707 =C4=85  2%      -5.2%       6359        perf-stat.cpu-migr=
ations
>> >>       1.04 =C4=85 11%      -0.3        0.77 =C4=85  4%  perf-stat.dTL=
B-load-miss-rate%
>> >>  2.365e+10 =C4=85  7%     -25.9%  1.751e+10 =C4=85  9%  perf-stat.dTL=
B-load-misses
>> >>   1.05e+12 =C4=85  4%      -9.5%  9.497e+11 =C4=85  2%  perf-stat.dTL=
B-stores
>> >>      28.16            +2.2       30.35 =C4=85  2%  perf-stat.iTLB-loa=
d-miss-rate%
>> >>   2.56e+08           -10.4%  2.295e+08        perf-stat.iTLB-loads
>> >>  8.974e+12            -9.2%  8.151e+12        perf-stat.instructions
>> >>      89411            -8.8%      81529        perf-stat.instructions-=
per-iTLB-miss
>> >>       0.54            -8.8%       0.49        perf-stat.ipc
>> >>  5.748e+08           -16.4%  4.806e+08        perf-stat.major-faults
>> >>      52.82            +5.8       58.61 =C4=85  2%  perf-stat.node-loa=
d-miss-rate%
>> >>  7.206e+09 =C4=85  2%     -18.6%  5.867e+09 =C4=85  3%  perf-stat.nod=
e-loads
>> >>      17.96 =C4=85  8%     +15.7       33.69 =C4=85  2%  perf-stat.nod=
e-store-miss-rate%
>> >>  2.055e+09 =C4=85  8%     +65.1%  3.393e+09 =C4=85  4%  perf-stat.nod=
e-store-misses
>> >>  9.391e+09 =C4=85  2%     -28.9%  6.675e+09        perf-stat.node-sto=
res
>> >>  5.753e+08           -16.4%  4.811e+08        perf-stat.page-faults
>> >>     305865           -16.3%     256108        proc-vmstat.allocstall_=
movable
>> >>       1923 =C4=85 14%     -72.1%     537.00 =C4=85 12%  proc-vmstat.a=
llocstall_normal
>> >>       0.00            +Inf%       1577 =C4=85 67%  proc-vmstat.compac=
t_isolated
>> >>       1005 =C4=85  4%     -65.8%     344.00 =C4=85  7%  proc-vmstat.k=
swapd_low_wmark_hit_quickly
>> >>     320062           +23.2%     394374 =C4=85  4%  proc-vmstat.nr_act=
ive_file
>> >>       6411 =C4=85  2%     -76.4%       1511 =C4=85  4%  proc-vmstat.n=
r_free_cma
>> >>     277.00 =C4=85 12%     -51.4%     134.75 =C4=85 52%  proc-vmstat.n=
r_vmscan_immediate_reclaim
>> >>     320049           +23.2%     394353 =C4=85  4%  proc-vmstat.nr_zon=
e_active_file
>> >>   71262212 =C4=85 15%    +110.3%  1.499e+08 =C4=85  3%  proc-vmstat.n=
uma_foreign
>> >>  5.042e+08 =C4=85  2%     -34.3%  3.314e+08        proc-vmstat.numa_h=
it
>> >>  5.041e+08 =C4=85  2%     -34.3%  3.314e+08        proc-vmstat.numa_l=
ocal
>> >>   71262212 =C4=85 15%    +110.3%  1.499e+08 =C4=85  3%  proc-vmstat.n=
uma_miss
>> >>   71273176 =C4=85 15%    +110.3%  1.499e+08 =C4=85  3%  proc-vmstat.n=
uma_other
>> >>       1007 =C4=85  4%     -65.6%     346.25 =C4=85  7%  proc-vmstat.p=
ageoutrun
>> >>   23070268           -16.0%   19386190        proc-vmstat.pgalloc_dma=
32
>> >>  5.525e+08           -16.7%  4.603e+08        proc-vmstat.pgalloc_nor=
mal
>> >>  5.753e+08           -16.4%  4.812e+08        proc-vmstat.pgfault
>> >>  5.751e+08           -16.3%  4.813e+08        proc-vmstat.pgfree
>> >>  5.748e+08           -16.4%  4.806e+08        proc-vmstat.pgmajfault
>> >>  2.299e+09           -16.4%  1.923e+09        proc-vmstat.pgpgin
>> >>  8.396e+08           -17.8%  6.901e+08        proc-vmstat.pgscan_dire=
ct
>> >>  3.018e+08 =C4=85  2%     -13.0%  2.627e+08        proc-vmstat.pgscan=
_kswapd
>> >>    4.1e+08           -15.1%   3.48e+08        proc-vmstat.pgsteal_dir=
ect
>> >>  1.542e+08 =C4=85  3%     -20.9%   1.22e+08 =C4=85  3%  proc-vmstat.p=
gsteal_kswapd
>> >>      23514 =C4=85  4%     -23.1%      18076 =C4=85 16%  proc-vmstat.s=
labs_scanned
>> >>     343040 =C4=85  2%     +40.3%     481253 =C4=85  2%  proc-vmstat.w=
orkingset_activate
>> >>  2.525e+08           -20.1%  2.018e+08        proc-vmstat.workingset_=
refault
>> >>      13.64 =C4=85  3%      -1.7       11.96 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.ext4_mpage_readpages.filemap_fault.ext4_filemap_fault._=
_do_fault.__handle_mm_fault
>> >>      11.67 =C4=85  3%      -1.4       10.29 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.submit_bio.ext4_mpage_readpages.filemap_fault.ext4_file=
map_fault.__do_fault
>> >>      11.64 =C4=85  3%      -1.4       10.25 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.generic_make_request.submit_bio.ext4_mpage_readpages.fi=
lemap_fault.ext4_filemap_fault
>> >>      11.10 =C4=85  3%      -1.3        9.82 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.pmem_make_request.generic_make_request.submit_bio.ext4_=
mpage_readpages.filemap_fault
>> >>       9.21 =C4=85  3%      -1.2        8.04 =C4=85  3%  perf-profile.=
calltrace.cycles-pp.pmem_do_bvec.pmem_make_request.generic_make_request.sub=
mit_bio.ext4_mpage_readpages
>> >>      27.33 =C4=85  4%      -1.0       26.35 =C4=85  5%  perf-profile.=
calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>> >>      27.33 =C4=85  4%      -1.0       26.35 =C4=85  5%  perf-profile.=
calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_sta=
rtup_64
>> >>      27.33 =C4=85  4%      -1.0       26.35 =C4=85  5%  perf-profile.=
calltrace.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_sec=
ondary.secondary_startup_64
>> >>      27.33 =C4=85  4%      -1.0       26.35 =C4=85  5%  perf-profile.=
calltrace.cycles-pp.start_secondary.secondary_startup_64
>> >>      26.79 =C4=85  4%      -0.8       25.98 =C4=85  5%  perf-profile.=
calltrace.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entr=
y.start_secondary
>> >>      27.98 =C4=85  3%      -0.8       27.22 =C4=85  4%  perf-profile.=
calltrace.cycles-pp.secondary_startup_64
>> >>       5.36 =C4=85 12%      -0.6        4.76 =C4=85  7%  perf-profile.=
calltrace.cycles-pp.kswapd.kthread.ret_from_fork
>> >>       5.36 =C4=85 12%      -0.6        4.76 =C4=85  7%  perf-profile.=
calltrace.cycles-pp.shrink_node.kswapd.kthread.ret_from_fork
>> >>       5.30 =C4=85 12%      -0.6        4.71 =C4=85  7%  perf-profile.=
calltrace.cycles-pp.shrink_inactive_list.shrink_node_memcg.shrink_node.kswa=
pd.kthread
>> >>       5.35 =C4=85 12%      -0.6        4.76 =C4=85  7%  perf-profile.=
calltrace.cycles-pp.shrink_node_memcg.shrink_node.kswapd.kthread.ret_from_f=
ork
>> >>       5.43 =C4=85 12%      -0.5        4.88 =C4=85  7%  perf-profile.=
calltrace.cycles-pp.ret_from_fork
>> >>       5.43 =C4=85 12%      -0.5        4.88 =C4=85  7%  perf-profile.=
calltrace.cycles-pp.kthread.ret_from_fork
>> >>      11.04 =C4=85  2%      -0.2       10.82 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.shrink_page_list.shrink_inactive_list.shrink_node_memcg=
.shrink_node.do_try_to_free_pages
>> >>      62.44 =C4=85  2%      +1.9       64.38        perf-profile.callt=
race.cycles-pp.page_fault
>> >>      62.38 =C4=85  2%      +2.0       64.33        perf-profile.callt=
race.cycles-pp.__do_page_fault.do_page_fault.page_fault
>> >>      62.38 =C4=85  2%      +2.0       64.34        perf-profile.callt=
race.cycles-pp.do_page_fault.page_fault
>> >>      61.52 =C4=85  2%      +2.1       63.58        perf-profile.callt=
race.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>> >>      61.34 =C4=85  2%      +2.1       63.44        perf-profile.callt=
race.cycles-pp.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fa=
ult.page_fault
>> >>      30.18 =C4=85  3%      +2.3       32.45 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.shrink_inactive_list.shrink_node_memcg.shrink_node.do_t=
ry_to_free_pages.try_to_free_pages
>> >>       7.98 =C4=85  3%      +2.3       10.33 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.add_to_page_cache_lru.filemap_fault.ext4_filemap_fault.=
__do_fault.__handle_mm_fault
>> >>      30.48 =C4=85  3%      +2.4       32.83 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_=
nodemask.filemap_fault.ext4_filemap_fault
>> >>      30.46 =C4=85  3%      +2.4       32.81 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_sl=
owpath.__alloc_pages_nodemask.filemap_fault
>> >>      30.46 =C4=85  3%      +2.4       32.81 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__al=
loc_pages_slowpath.__alloc_pages_nodemask
>> >>      30.37 =C4=85  3%      +2.4       32.75 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.shrink_node_memcg.shrink_node.do_try_to_free_pages.try_=
to_free_pages.__alloc_pages_slowpath
>> >>       5.58 =C4=85  4%      +2.5        8.08 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.__lru_cache_add.add_to_page_cache_lru.filemap_fault.ext=
4_filemap_fault.__do_fault
>> >>      32.88 =C4=85  3%      +2.5       35.38 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.__alloc_pages_nodemask.filemap_fault.ext4_filemap_fault=
.__do_fault.__handle_mm_fault
>> >>       5.51 =C4=85  4%      +2.5        8.02 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.pagevec_lru_move_fn.__lru_cache_add.add_to_page_cache_l=
ru.filemap_fault.ext4_filemap_fault
>> >>       4.24 =C4=85  4%      +2.5        6.76 =C4=85  2%  perf-profile.=
calltrace.cycles-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.__lru_cache_=
add.add_to_page_cache_lru.filemap_fault
>> >>       4.18 =C4=85  4%      +2.5        6.70 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave=
.pagevec_lru_move_fn.__lru_cache_add.add_to_page_cache_lru
>> >>      18.64 =C4=85  3%      +2.5       21.16 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.shr=
ink_inactive_list.shrink_node_memcg.shrink_node
>> >>      31.65 =C4=85  3%      +2.7       34.31 =C4=85  2%  perf-profile.=
calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_pages_nodemask.filemap_f=
ault.ext4_filemap_fault.__do_fault
>> >>      17.21 =C4=85  3%      +2.7       19.93 =C4=85  2%  perf-profile.=
calltrace.cycles-pp._raw_spin_lock_irq.shrink_inactive_list.shrink_node_mem=
cg.shrink_node.do_try_to_free_pages
>> >
>> >It looks like there is more lru lock contention. It would be caused by
>> >using a movable zone for the CMA memory by this patch. In this case,
>> >reclaim for normal memory skips the lru page on the movable zone so nee=
ds
>> >more time to find enough reclaim target pages. It would increase lru lo=
ck
>> >holding time and then cause contention.
>> >
>> >Could you give me another stat 'pgskip_XXX' in /proc/vmstat to confirm
>> >my theory?
>>
>> Attached is the /proc/vmstat sample file during the test, sample interva=
l is 1s.
>
> Thanks!
>
> pgskip_XXX is low so my theory would be wrong. The other theory is
> that numa miss is the reason of the regression. Could you test the
> same test on the system without numa? I cannot test it since I
> don't have pmem.

I may find the reason of this regression. Could you test this patch on
top of this patchset?

http://lkml.kernel.org/r/<1522913236-15776-1-git-send-email-iamjoonsoo.kim(=
a)lge.com>

Thanks.

--===============1100011139090045007==--

