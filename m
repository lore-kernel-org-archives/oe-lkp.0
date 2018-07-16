Content-Type: multipart/mixed; boundary="===============6264651848547706395=="
MIME-Version: 1.0
From: Xiao Ni <xni@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [MD] 5a409b4f56: aim7.jobs-per-min -27.5% regression
Date: Mon, 16 Jul 2018 04:01:44 -0400
Message-ID: <1483728110.50978686.1531728104115.JavaMail.zimbra@redhat.com>
In-Reply-To: <20180716075430.GA16185@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6264651848547706395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Aaron

I have no update for this yet. I'll have a look this week and give response=
 later.

Regards
Xiao

----- Original Message -----
> From: "Aaron Lu" <aaron.lu@intel.com>
> To: "Xiao Ni" <xni@redhat.com>
> Cc: "kernel test robot" <xiaolong.ye@intel.com>, "Stephen Rothwell" <sf=
r@canb.auug.org.au>, lkp(a)01.org, "LKML"
> <linux-kernel@vger.kernel.org>, "Shaohua Li" <shli@fb.com>, "Ming Lei=
" <ming.lei@redhat.com>
> Sent: Monday, July 16, 2018 3:54:30 PM
> Subject: Re: [LKP] [lkp-robot] [MD] 5a409b4f56: aim7.jobs-per-min -27.5% =
regression
> =

> Ping...
> Any update on this?
> Feel free to ask me for any additional data if you need.
> =

> Thanks,
> Aaron
> =

> On Mon, Jun 04, 2018 at 02:42:03PM +0800, kernel test robot wrote:
> > =

> > Greeting,
> > =

> > FYI, we noticed a -27.5% regression of aim7.jobs-per-min due to commit:
> > =

> > =

> > commit: 5a409b4f56d50b212334f338cb8465d65550cd85 ("MD: fix lock content=
ion
> > for flush bios")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > =

> > in testcase: aim7
> > on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz w=
ith
> > 384G memory
> > with following parameters:
> > =

> > 	disk: 4BRD_12G
> > 	md: RAID1
> > 	fs: xfs
> > 	test: sync_disk_rw
> > 	load: 600
> > 	cpufreq_governor: performance
> > =

> > test-description: AIM7 is a traditional UNIX system level benchmark sui=
te
> > which is used to test and measure the performance of multiuser system.
> > test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/tes=
t/testcase:
> >   gcc-7/performance/4BRD_12G/xfs/x86_64-rhel-7.2/600/RAID1/debian-x86_6=
4-2016-08-31.cgz/lkp-ivb-ep01/sync_disk_rw/aim7
> > =

> > commit:
> >   448ec638c6 ("md/raid5: Assigning NULL to sh->batch_head before testing
> >   bit R5_Overlap of a stripe")
> >   5a409b4f56 ("MD: fix lock contention for flush bios")
> > =

> > 448ec638c6bcf369 5a409b4f56d50b212334f338cb
> > ---------------- --------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >       1640           -27.5%       1189        aim7.jobs-per-min
> >       2194           +37.9%       3026        aim7.time.elapsed_time
> >       2194           +37.9%       3026        aim7.time.elapsed_time.max
> >   50990311           -95.8%    2148266
> >   aim7.time.involuntary_context_switches
> >     107965 =C2=B1  4%     -26.4%      79516 =C2=B1  2%  aim7.time.minor=
_page_faults
> >      49.14           +82.5%      89.66 =C2=B1  2%  aim7.time.user_time
> >  7.123e+08           -35.7%  4.582e+08
> >  aim7.time.voluntary_context_switches
> >     672282           +36.8%     919615
> >     interrupts.CAL:Function_call_interrupts
> >   16631387 =C2=B1  2%     -39.9%    9993075 =C2=B1  7%  softirqs.RCU
> >    9708009          +186.1%   27778773        softirqs.SCHED
> >   33436649           +45.5%   48644912        softirqs.TIMER
> >       4.16            -2.1        2.01        mpstat.cpu.idle%
> >       0.24 =C2=B1  2%     +27.7       27.91        mpstat.cpu.iowait%
> >      95.51           -25.6       69.94        mpstat.cpu.sys%
> >       0.09            +0.0        0.13        mpstat.cpu.usr%
> >    6051756 =C2=B1  3%     +59.0%    9623085
> >    numa-numastat.node0.local_node
> >    6055311 =C2=B1  3%     +59.0%    9626996        numa-numastat.node0.=
numa_hit
> >    6481209 =C2=B1  3%     +48.4%    9616310
> >    numa-numastat.node1.local_node
> >    6485866 =C2=B1  3%     +48.3%    9620756        numa-numastat.node1.=
numa_hit
> >      61404           -27.7%      44424        vmstat.io.bo
> >       2.60 =C2=B1 18%  +11519.2%     302.10        vmstat.procs.b
> >     304.10           -84.9%      45.80 =C2=B1  2%  vmstat.procs.r
> >     400477           -43.5%     226094        vmstat.system.cs
> >     166461           -49.9%      83332        vmstat.system.in
> >      78397           +27.0%      99567        meminfo.Dirty
> >      14427           +18.4%      17082        meminfo.Inactive(anon)
> >       1963 =C2=B1  5%      +5.4%       2068 =C2=B1  4%  meminfo.Mlocked
> >     101143          +991.0%    1103488        meminfo.SUnreclaim
> >      53684 =C2=B1  4%     -18.1%      43946 =C2=B1  3%  meminfo.Shmem
> >     175580          +571.4%    1178829        meminfo.Slab
> >      39406           +26.2%      49717        numa-meminfo.node0.Dirty
> >    1767204 =C2=B1 10%     +37.2%    2425487 =C2=B1  2%  numa-meminfo.no=
de0.MemUsed
> >      51634 =C2=B1 18%    +979.3%     557316        numa-meminfo.node0.S=
Unreclaim
> >      92259 =C2=B1 13%    +551.7%     601288        numa-meminfo.node0.S=
lab
> >      38969           +28.0%      49863        numa-meminfo.node1.Dirty
> >    1895204 =C2=B1 10%     +24.7%    2363037 =C2=B1  3%  numa-meminfo.no=
de1.MemUsed
> >      49512 =C2=B1 19%   +1003.1%     546165        numa-meminfo.node1.S=
Unreclaim
> >      83323 =C2=B1 14%    +593.1%     577534        numa-meminfo.node1.S=
lab
> >  2.524e+09          +894.5%   2.51e+10        cpuidle.C1.time
> >   50620790          +316.5%  2.109e+08        cpuidle.C1.usage
> >  3.965e+08         +1871.1%  7.815e+09        cpuidle.C1E.time
> >    5987788          +186.1%   17129412        cpuidle.C1E.usage
> >  2.506e+08           +97.5%  4.948e+08 =C2=B1  2%  cpuidle.C3.time
> >    2923498           -55.7%    1295033        cpuidle.C3.usage
> >  5.327e+08          +179.9%  1.491e+09        cpuidle.C6.time
> >     779874 =C2=B1  2%    +229.3%    2567769        cpuidle.C6.usage
> >    6191357         +3333.6%  2.126e+08        cpuidle.POLL.time
> >     204095         +1982.1%    4249504        cpuidle.POLL.usage
> >       9850           +26.3%      12444        numa-vmstat.node0.nr_dirty
> >      12908 =C2=B1 18%    +979.3%     139321
> >      numa-vmstat.node0.nr_slab_unreclaimable
> >       8876           +29.6%      11505
> >       numa-vmstat.node0.nr_zone_write_pending
> >    3486319 =C2=B1  4%     +55.1%    5407021        numa-vmstat.node0.nu=
ma_hit
> >    3482713 =C2=B1  4%     +55.1%    5403066        numa-vmstat.node0.nu=
ma_local
> >       9743           +28.1%      12479        numa-vmstat.node1.nr_dirty
> >      12377 =C2=B1 19%   +1003.1%     136532
> >      numa-vmstat.node1.nr_slab_unreclaimable
> >       9287           +30.0%      12074
> >       numa-vmstat.node1.nr_zone_write_pending
> >    3678995 =C2=B1  4%     +44.8%    5326772        numa-vmstat.node1.nu=
ma_hit
> >    3497785 =C2=B1  4%     +47.1%    5145705        numa-vmstat.node1.nu=
ma_local
> >     252.70          +100.2%     505.90
> >     slabinfo.biovec-max.active_objs
> >     282.70           +99.1%     562.90        slabinfo.biovec-max.num_o=
bjs
> >       2978 =C2=B1 17%     +52.5%       4543 =C2=B1 14%
> >       slabinfo.dmaengine-unmap-16.active_objs
> >       2978 =C2=B1 17%     +52.5%       4543 =C2=B1 14%
> >       slabinfo.dmaengine-unmap-16.num_objs
> >       2078          +147.9%       5153 =C2=B1 11%
> >       slabinfo.ip6_dst_cache.active_objs
> >       2078          +148.1%       5157 =C2=B1 11%
> >       slabinfo.ip6_dst_cache.num_objs
> >       5538 =C2=B1  2%     +26.2%       6990 =C2=B1  3%
> >       slabinfo.kmalloc-1024.active_objs
> >       5586 =C2=B1  3%     +27.1%       7097 =C2=B1  3%
> >       slabinfo.kmalloc-1024.num_objs
> >       6878           +47.6%      10151 =C2=B1  5%
> >       slabinfo.kmalloc-192.active_objs
> >       6889           +47.5%      10160 =C2=B1  5%  slabinfo.kmalloc-192=
.num_objs
> >       9843 =C2=B1  5%  +1.6e+05%   16002876
> >       slabinfo.kmalloc-64.active_objs
> >     161.90 =C2=B1  4%  +1.5e+05%     250044
> >     slabinfo.kmalloc-64.active_slabs
> >      10386 =C2=B1  4%  +1.5e+05%   16002877        slabinfo.kmalloc-64.=
num_objs
> >     161.90 =C2=B1  4%  +1.5e+05%     250044        slabinfo.kmalloc-64.=
num_slabs
> >     432.80 =C2=B1 12%     +45.2%     628.50 =C2=B1  6%
> >     slabinfo.nfs_read_data.active_objs
> >     432.80 =C2=B1 12%     +45.2%     628.50 =C2=B1  6%
> >     slabinfo.nfs_read_data.num_objs
> >       3956           -23.1%       3041
> >       slabinfo.pool_workqueue.active_objs
> >       4098           -19.8%       3286
> >       slabinfo.pool_workqueue.num_objs
> >     360.50 =C2=B1 15%     +56.6%     564.70 =C2=B1 11%
> >     slabinfo.secpath_cache.active_objs
> >     360.50 =C2=B1 15%     +56.6%     564.70 =C2=B1 11%
> >     slabinfo.secpath_cache.num_objs
> >      35373 =C2=B1  2%      -8.3%      32432        proc-vmstat.nr_activ=
e_anon
> >      19595           +27.1%      24914        proc-vmstat.nr_dirty
> >       3607           +18.4%       4270        proc-vmstat.nr_inactive_a=
non
> >     490.30 =C2=B1  5%      +5.4%     516.90 =C2=B1  4%  proc-vmstat.nr_=
mlock
> >      13421 =C2=B1  4%     -18.1%      10986 =C2=B1  3%  proc-vmstat.nr_=
shmem
> >      18608            +1.2%      18834
> >      proc-vmstat.nr_slab_reclaimable
> >      25286          +991.0%     275882
> >      proc-vmstat.nr_slab_unreclaimable
> >      35405 =C2=B1  2%      -8.3%      32465
> >      proc-vmstat.nr_zone_active_anon
> >       3607           +18.4%       4270
> >       proc-vmstat.nr_zone_inactive_anon
> >      18161           +29.8%      23572
> >      proc-vmstat.nr_zone_write_pending
> >      76941 =C2=B1  5%     -36.8%      48622 =C2=B1  4%  proc-vmstat.num=
a_hint_faults
> >      33878 =C2=B1  7%     -35.5%      21836 =C2=B1  5%
> >      proc-vmstat.numa_hint_faults_local
> >   12568956           +53.3%   19272377        proc-vmstat.numa_hit
> >   12560739           +53.4%   19264015        proc-vmstat.numa_local
> >      17938 =C2=B1  3%     -33.5%      11935 =C2=B1  2%
> >      proc-vmstat.numa_pages_migrated
> >      78296 =C2=B1  5%     -36.0%      50085 =C2=B1  4%  proc-vmstat.num=
a_pte_updates
> >       8848 =C2=B1  6%     -38.2%       5466 =C2=B1  6%  proc-vmstat.pga=
ctivate
> >    8874568 =C2=B1  8%    +368.7%   41590920        proc-vmstat.pgalloc_=
normal
> >    5435965           +39.2%    7564148        proc-vmstat.pgfault
> >   12863707          +255.1%   45683570        proc-vmstat.pgfree
> >      17938 =C2=B1  3%     -33.5%      11935 =C2=B1  2%  proc-vmstat.pgm=
igrate_success
> >  1.379e+13           -40.8%   8.17e+12        perf-stat.branch-instruct=
ions
> >       0.30            +0.1        0.42        perf-stat.branch-miss-rat=
e%
> >    4.2e+10           -17.6%  3.462e+10        perf-stat.branch-misses
> >      15.99            +3.8       19.74        perf-stat.cache-miss-rate%
> >  3.779e+10           -21.6%  2.963e+10        perf-stat.cache-misses
> >  2.364e+11           -36.5%  1.501e+11        perf-stat.cache-references
> >  8.795e+08           -22.2%   6.84e+08        perf-stat.context-switches
> >       4.44            -7.2%       4.12        perf-stat.cpi
> >  2.508e+14           -44.5%  1.393e+14        perf-stat.cpu-cycles
> >   36915392           +60.4%   59211221        perf-stat.cpu-migrations
> >       0.29 =C2=B1  2%      +0.0        0.34 =C2=B1  4%
> >       perf-stat.dTLB-load-miss-rate%
> >   4.14e+10           -30.2%   2.89e+10 =C2=B1  4%  perf-stat.dTLB-load-=
misses
> >  1.417e+13           -40.1%  8.491e+12        perf-stat.dTLB-loads
> >       0.20 =C2=B1  4%      -0.0        0.18 =C2=B1  5%
> >       perf-stat.dTLB-store-miss-rate%
> >  3.072e+09 =C2=B1  4%     -28.0%   2.21e+09 =C2=B1  4%  perf-stat.dTLB-=
store-misses
> >  1.535e+12           -20.2%  1.225e+12        perf-stat.dTLB-stores
> >      90.73           -11.7       79.07
> >      perf-stat.iTLB-load-miss-rate%
> >  8.291e+09            -6.6%  7.743e+09        perf-stat.iTLB-load-misses
> >  8.473e+08          +141.8%  2.049e+09 =C2=B1  3%  perf-stat.iTLB-loads
> >  5.646e+13           -40.2%  3.378e+13        perf-stat.instructions
> >       6810           -35.9%       4362
> >       perf-stat.instructions-per-iTLB-miss
> >       0.23            +7.8%       0.24        perf-stat.ipc
> >    5326672           +39.2%    7413706        perf-stat.minor-faults
> >  1.873e+10           -29.9%  1.312e+10        perf-stat.node-load-misses
> >  2.093e+10           -29.2%  1.481e+10        perf-stat.node-loads
> >      39.38            -0.7       38.72
> >      perf-stat.node-store-miss-rate%
> >  1.087e+10           -16.6%  9.069e+09        perf-stat.node-store-miss=
es
> >  1.673e+10           -14.2%  1.435e+10        perf-stat.node-stores
> >    5326695           +39.2%    7413708        perf-stat.page-faults
> >    1875095 =C2=B1  7%     -54.8%     846645 =C2=B1 16%
> >    sched_debug.cfs_rq:/.MIN_vruntime.avg
> >   32868920 =C2=B1  6%     -35.7%   21150379 =C2=B1 14%
> >   sched_debug.cfs_rq:/.MIN_vruntime.max
> >    7267340 =C2=B1  5%     -44.7%    4015798 =C2=B1 14%
> >    sched_debug.cfs_rq:/.MIN_vruntime.stddev
> >       4278 =C2=B1  7%     -54.7%       1939 =C2=B1 11%
> >       sched_debug.cfs_rq:/.exec_clock.stddev
> >     245.48 =C2=B1  2%     +65.3%     405.75 =C2=B1  7%
> >     sched_debug.cfs_rq:/.load_avg.avg
> >       2692 =C2=B1  6%    +126.0%       6087 =C2=B1  7%
> >       sched_debug.cfs_rq:/.load_avg.max
> >      33.09           -73.0%       8.94 =C2=B1  7%
> >      sched_debug.cfs_rq:/.load_avg.min
> >     507.40 =C2=B1  4%    +128.0%       1156 =C2=B1  7%
> >     sched_debug.cfs_rq:/.load_avg.stddev
> >    1875095 =C2=B1  7%     -54.8%     846645 =C2=B1 16%
> >    sched_debug.cfs_rq:/.max_vruntime.avg
> >   32868921 =C2=B1  6%     -35.7%   21150379 =C2=B1 14%
> >   sched_debug.cfs_rq:/.max_vruntime.max
> >    7267341 =C2=B1  5%     -44.7%    4015798 =C2=B1 14%
> >    sched_debug.cfs_rq:/.max_vruntime.stddev
> >   35887197           -13.2%   31149130
> >   sched_debug.cfs_rq:/.min_vruntime.avg
> >   37385506           -14.3%   32043914
> >   sched_debug.cfs_rq:/.min_vruntime.max
> >   34416296           -12.3%   30183927
> >   sched_debug.cfs_rq:/.min_vruntime.min
> >    1228844 =C2=B1  8%     -52.6%     582759 =C2=B1  4%
> >    sched_debug.cfs_rq:/.min_vruntime.stddev
> >       0.83           -28.1%       0.60 =C2=B1  6%
> >       sched_debug.cfs_rq:/.nr_running.avg
> >       2.07 =C2=B1  3%     -24.6%       1.56 =C2=B1  8%
> >       sched_debug.cfs_rq:/.nr_running.max
> >      20.52 =C2=B1  4%     -48.8%      10.52 =C2=B1  3%
> >      sched_debug.cfs_rq:/.nr_spread_over.avg
> >      35.96 =C2=B1  5%     -42.2%      20.77 =C2=B1  9%
> >      sched_debug.cfs_rq:/.nr_spread_over.max
> >       8.97 =C2=B1 11%     -44.5%       4.98 =C2=B1  8%
> >       sched_debug.cfs_rq:/.nr_spread_over.min
> >       6.40 =C2=B1 12%     -45.5%       3.49 =C2=B1  7%
> >       sched_debug.cfs_rq:/.nr_spread_over.stddev
> >      21.78 =C2=B1  7%    +143.3%      53.00 =C2=B1  9%
> >      sched_debug.cfs_rq:/.runnable_load_avg.avg
> >     328.86 =C2=B1 18%    +303.4%       1326 =C2=B1 14%
> >     sched_debug.cfs_rq:/.runnable_load_avg.max
> >      55.97 =C2=B1 17%    +286.0%     216.07 =C2=B1 13%
> >      sched_debug.cfs_rq:/.runnable_load_avg.stddev
> >       0.10 =C2=B1 29%     -82.4%       0.02 =C2=B1 50%
> >       sched_debug.cfs_rq:/.spread.avg
> >       3.43 =C2=B1 25%     -79.9%       0.69 =C2=B1 50%
> >       sched_debug.cfs_rq:/.spread.max
> >       0.56 =C2=B1 26%     -80.7%       0.11 =C2=B1 50%
> >       sched_debug.cfs_rq:/.spread.stddev
> >    1228822 =C2=B1  8%     -52.6%     582732 =C2=B1  4%
> >    sched_debug.cfs_rq:/.spread0.stddev
> >     992.30           -24.9%     745.56 =C2=B1  2%
> >     sched_debug.cfs_rq:/.util_avg.avg
> >       1485           -18.1%       1217 =C2=B1  2%
> >       sched_debug.cfs_rq:/.util_avg.max
> >     515.45 =C2=B1  2%     -25.2%     385.73 =C2=B1  6%
> >     sched_debug.cfs_rq:/.util_avg.min
> >     201.54           -14.9%     171.52 =C2=B1  3%
> >     sched_debug.cfs_rq:/.util_avg.stddev
> >     248.73 =C2=B1  6%     -38.1%     154.02 =C2=B1  8%
> >     sched_debug.cfs_rq:/.util_est_enqueued.avg
> >     222.78 =C2=B1  3%     -15.8%     187.58 =C2=B1  2%
> >     sched_debug.cfs_rq:/.util_est_enqueued.stddev
> >      77097 =C2=B1  4%    +278.4%     291767 =C2=B1 11%  sched_debug.cpu=
.avg_idle.avg
> >     181319 =C2=B1  6%    +298.7%     722862 =C2=B1  3%  sched_debug.cpu=
.avg_idle.max
> >      19338          +392.3%      95203 =C2=B1 17%  sched_debug.cpu.avg_=
idle.min
> >      34877 =C2=B1  6%    +303.5%     140732 =C2=B1  6%
> >      sched_debug.cpu.avg_idle.stddev
> >    1107408           +37.6%    1523823        sched_debug.cpu.clock.avg
> >    1107427           +37.6%    1523834        sched_debug.cpu.clock.max
> >    1107385           +37.6%    1523811        sched_debug.cpu.clock.min
> >      13.10 =C2=B1  9%     -48.1%       6.80 =C2=B1  8%  sched_debug.cpu=
.clock.stddev
> >    1107408           +37.6%    1523823
> >    sched_debug.cpu.clock_task.avg
> >    1107427           +37.6%    1523834
> >    sched_debug.cpu.clock_task.max
> >    1107385           +37.6%    1523811
> >    sched_debug.cpu.clock_task.min
> >      13.10 =C2=B1  9%     -48.1%       6.80 =C2=B1  8%
> >      sched_debug.cpu.clock_task.stddev
> >      30.36 =C2=B1  7%    +107.7%      63.06 =C2=B1 12%
> >      sched_debug.cpu.cpu_load[0].avg
> >     381.48 =C2=B1 18%    +269.8%       1410 =C2=B1 18%
> >     sched_debug.cpu.cpu_load[0].max
> >      63.92 =C2=B1 18%    +262.2%     231.50 =C2=B1 17%
> >      sched_debug.cpu.cpu_load[0].stddev
> >      31.34 =C2=B1  5%    +118.4%      68.44 =C2=B1  9%
> >      sched_debug.cpu.cpu_load[1].avg
> >     323.62 =C2=B1 17%    +349.5%       1454 =C2=B1 14%
> >     sched_debug.cpu.cpu_load[1].max
> >      53.23 =C2=B1 16%    +350.3%     239.71 =C2=B1 13%
> >      sched_debug.cpu.cpu_load[1].stddev
> >      32.15 =C2=B1  3%    +129.4%      73.74 =C2=B1  6%
> >      sched_debug.cpu.cpu_load[2].avg
> >     285.20 =C2=B1 14%    +420.8%       1485 =C2=B1  9%
> >     sched_debug.cpu.cpu_load[2].max
> >      46.66 =C2=B1 12%    +430.0%     247.32 =C2=B1  8%
> >      sched_debug.cpu.cpu_load[2].stddev
> >      33.02 =C2=B1  2%    +133.2%      77.00 =C2=B1  3%
> >      sched_debug.cpu.cpu_load[3].avg
> >     252.16 =C2=B1 10%    +481.2%       1465 =C2=B1  7%
> >     sched_debug.cpu.cpu_load[3].max
> >      40.74 =C2=B1  8%    +503.2%     245.72 =C2=B1  6%
> >      sched_debug.cpu.cpu_load[3].stddev
> >      33.86          +131.5%      78.38 =C2=B1  2%
> >      sched_debug.cpu.cpu_load[4].avg
> >     219.81 =C2=B1  8%    +522.6%       1368 =C2=B1  5%
> >     sched_debug.cpu.cpu_load[4].max
> >      35.45 =C2=B1  7%    +554.2%     231.90 =C2=B1  4%
> >      sched_debug.cpu.cpu_load[4].stddev
> >       2600 =C2=B1  4%     -30.5%       1807 =C2=B1  4%  sched_debug.cpu=
.curr->pid.avg
> >      25309 =C2=B1  4%     -19.5%      20367 =C2=B1  4%  sched_debug.cpu=
.curr->pid.max
> >       4534 =C2=B1  7%     -21.2%       3573 =C2=B1  5%
> >       sched_debug.cpu.curr->pid.stddev
> >       0.00 =C2=B1  2%     -27.6%       0.00 =C2=B1  6%
> >       sched_debug.cpu.next_balance.stddev
> >    1083917           +38.6%    1502777
> >    sched_debug.cpu.nr_load_updates.avg
> >    1088142           +38.6%    1508302
> >    sched_debug.cpu.nr_load_updates.max
> >    1082048           +38.7%    1501073
> >    sched_debug.cpu.nr_load_updates.min
> >       3.53 =C2=B1  6%     -73.0%       0.95 =C2=B1  6%
> >       sched_debug.cpu.nr_running.avg
> >      11.54 =C2=B1  3%     -62.1%       4.37 =C2=B1 10%
> >      sched_debug.cpu.nr_running.max
> >       3.10 =C2=B1  3%     -66.8%       1.03 =C2=B1  9%
> >       sched_debug.cpu.nr_running.stddev
> >   10764176           -22.4%    8355047
> >   sched_debug.cpu.nr_switches.avg
> >   10976436           -22.2%    8545010
> >   sched_debug.cpu.nr_switches.max
> >   10547712           -22.8%    8143037
> >   sched_debug.cpu.nr_switches.min
> >     148628 =C2=B1  3%     -22.7%     114880 =C2=B1  7%
> >     sched_debug.cpu.nr_switches.stddev
> >      11.13 =C2=B1  2%     +24.5%      13.85
> >      sched_debug.cpu.nr_uninterruptible.avg
> >       6420 =C2=B1  8%     -48.7%       3296 =C2=B1 11%
> >       sched_debug.cpu.nr_uninterruptible.max
> >      -5500           -37.2%      -3455
> >      sched_debug.cpu.nr_uninterruptible.min
> >       3784 =C2=B1  6%     -47.2%       1997 =C2=B1  4%
> >       sched_debug.cpu.nr_uninterruptible.stddev
> >   10812670           -22.7%    8356821
> >   sched_debug.cpu.sched_count.avg
> >   11020646           -22.5%    8546277
> >   sched_debug.cpu.sched_count.max
> >   10601390           -23.2%    8144743
> >   sched_debug.cpu.sched_count.min
> >     144529 =C2=B1  3%     -20.9%     114359 =C2=B1  7%
> >     sched_debug.cpu.sched_count.stddev
> >     706116          +259.0%    2534721
> >     sched_debug.cpu.sched_goidle.avg
> >     771307          +232.4%    2564059
> >     sched_debug.cpu.sched_goidle.max
> >     644658          +286.9%    2494236
> >     sched_debug.cpu.sched_goidle.min
> >      49847 =C2=B1  6%     -67.9%      15979 =C2=B1  7%
> >      sched_debug.cpu.sched_goidle.stddev
> >    9618827           -39.9%    5780369
> >    sched_debug.cpu.ttwu_count.avg
> >    8990451           -61.7%    3441265 =C2=B1  4%
> >    sched_debug.cpu.ttwu_count.min
> >     418563 =C2=B1 25%    +244.2%    1440565 =C2=B1  7%
> >     sched_debug.cpu.ttwu_count.stddev
> >     640964           -93.7%      40366 =C2=B1  2%
> >     sched_debug.cpu.ttwu_local.avg
> >     679527           -92.1%      53476 =C2=B1  4%
> >     sched_debug.cpu.ttwu_local.max
> >     601661           -94.9%      30636 =C2=B1  3%
> >     sched_debug.cpu.ttwu_local.min
> >      24242 =C2=B1 21%     -77.7%       5405 =C2=B1  9%
> >      sched_debug.cpu.ttwu_local.stddev
> >    1107383           +37.6%    1523810        sched_debug.cpu_clk
> >    1107383           +37.6%    1523810        sched_debug.ktime
> >       0.00           -49.4%       0.00 =C2=B1 65%
> >       sched_debug.rt_rq:/.rt_nr_migratory.avg
> >       0.03           -49.4%       0.01 =C2=B1 65%
> >       sched_debug.rt_rq:/.rt_nr_migratory.max
> >       0.00           -49.4%       0.00 =C2=B1 65%
> >       sched_debug.rt_rq:/.rt_nr_migratory.stddev
> >       0.00           -49.4%       0.00 =C2=B1 65%
> >       sched_debug.rt_rq:/.rt_nr_running.avg
> >       0.03           -49.4%       0.01 =C2=B1 65%
> >       sched_debug.rt_rq:/.rt_nr_running.max
> >       0.00           -49.4%       0.00 =C2=B1 65%
> >       sched_debug.rt_rq:/.rt_nr_running.stddev
> >       0.01 =C2=B1  8%     +79.9%       0.01 =C2=B1 23%
> >       sched_debug.rt_rq:/.rt_time.avg
> >    1107805           +37.6%    1524235        sched_debug.sched_clk
> >      87.59           -87.6        0.00
> >      perf-profile.calltrace.cycles-pp.md_flush_request.raid1_make_reque=
st.md_handle_request.md_make_request.generic_make_request
> >      87.57           -87.6        0.00
> >      perf-profile.calltrace.cycles-pp.submit_bio_wait.blkdev_issue_flus=
h.xfs_file_fsync.xfs_file_write_iter.__vfs_write
> >      87.59           -87.5        0.05 =C2=B1299%
> >      perf-profile.calltrace.cycles-pp.blkdev_issue_flush.xfs_file_fsync=
.xfs_file_write_iter.__vfs_write.vfs_write
> >      87.51           -87.5        0.00
> >      perf-profile.calltrace.cycles-pp.generic_make_request.submit_bio.s=
ubmit_bio_wait.blkdev_issue_flush.xfs_file_fsync
> >      87.51           -87.5        0.00
> >      perf-profile.calltrace.cycles-pp.submit_bio.submit_bio_wait.blkdev=
_issue_flush.xfs_file_fsync.xfs_file_write_iter
> >      87.50           -87.5        0.00
> >      perf-profile.calltrace.cycles-pp.md_make_request.generic_make_requ=
est.submit_bio.submit_bio_wait.blkdev_issue_flush
> >      87.50           -87.5        0.00
> >      perf-profile.calltrace.cycles-pp.md_handle_request.md_make_request=
.generic_make_request.submit_bio.submit_bio_wait
> >      82.37           -82.4        0.00
> >      perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.md_flush_reque=
st.raid1_make_request.md_handle_request.md_make_request
> >      82.23           -82.2        0.00
> >      perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.=
_raw_spin_lock_irq.md_flush_request.raid1_make_request.md_handle_request
> >      87.79           -25.0       62.75 =C2=B1  8%
> >      perf-profile.calltrace.cycles-pp.raid1_make_request.md_handle_requ=
est.md_make_request.generic_make_request.submit_bio
> >      92.78           -13.0       79.76
> >      perf-profile.calltrace.cycles-pp.xfs_file_fsync.xfs_file_write_ite=
r.__vfs_write.vfs_write.ksys_write
> >      93.08           -12.6       80.49
> >      perf-profile.calltrace.cycles-pp.xfs_file_write_iter.__vfs_write.v=
fs_write.ksys_write.do_syscall_64
> >      93.08           -12.6       80.50
> >      perf-profile.calltrace.cycles-pp.__vfs_write.vfs_write.ksys_write.=
do_syscall_64.entry_SYSCALL_64_after_hwframe
> >      93.11           -12.6       80.56
> >      perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
> >      93.11           -12.6       80.56
> >      perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
> >      93.14           -12.5       80.64
> >      perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
> >      93.15           -12.5       80.65
> >      perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
> >       3.40 =C2=B1  2%      -1.4        1.97 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_f=
ork
> >       3.33 =C2=B1  2%      -1.4        1.96 =C2=B1  9%
> >       perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.k=
thread.ret_from_fork
> >       1.12 =C2=B1  2%      -0.7        0.42 =C2=B1 68%
> >       perf-profile.calltrace.cycles-pp.__save_stack_trace.save_stack_tr=
ace_tsk.__account_scheduler_latency.enqueue_entity.enqueue_task_fair
> >       1.16 =C2=B1  2%      -0.6        0.60 =C2=B1 17%
> >       perf-profile.calltrace.cycles-pp.save_stack_trace_tsk.__account_s=
cheduler_latency.enqueue_entity.enqueue_task_fair.ttwu_do_activate
> >       0.00            +0.6        0.59 =C2=B1 15%
> >       perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up=
_common_lock.raid1_write_request.raid1_make_request.md_handle_request
> >       0.00            +0.6        0.64 =C2=B1 15%
> >       perf-profile.calltrace.cycles-pp.__wake_up_common_lock.raid1_writ=
e_request.raid1_make_request.md_handle_request.md_make_request
> >       0.00            +0.7        0.65 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair=
.ttwu_do_activate.sched_ttwu_pending.do_idle
> >       0.00            +0.7        0.68 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.enqueue_task_fair.ttwu_do_activa=
te.sched_ttwu_pending.do_idle.cpu_startup_entry
> >       0.00            +0.7        0.69 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pend=
ing.do_idle.cpu_startup_entry.start_secondary
> >       0.00            +0.8        0.79 =C2=B1 11%
> >       perf-profile.calltrace.cycles-pp.sched_ttwu_pending.do_idle.cpu_s=
tartup_entry.start_secondary.secondary_startup_64
> >       0.00            +0.8        0.83 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.__schedule.schedule.raid1_write_=
request.raid1_make_request.md_handle_request
> >       0.62 =C2=B1  3%      +0.8        1.45 =C2=B1 22%
> >       perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath=
._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait.__xfs_log_force_lsn
> >       0.00            +0.8        0.83 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.schedule.raid1_write_request.rai=
d1_make_request.md_handle_request.md_make_request
> >       0.63 =C2=B1  2%      +0.8        1.46 =C2=B1 22%
> >       perf-profile.calltrace.cycles-pp.remove_wait_queue.xlog_wait.__xf=
s_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync
> >       0.62 =C2=B1  2%      +0.8        1.46 =C2=B1 22%
> >       perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wa=
it_queue.xlog_wait.__xfs_log_force_lsn.xfs_log_force_lsn
> >       3.92 =C2=B1  2%      +0.9        4.79 =C2=B1  6%
> >       perf-profile.calltrace.cycles-pp.ret_from_fork
> >       3.92 =C2=B1  2%      +0.9        4.79 =C2=B1  6%
> >       perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
> >       0.69 =C2=B1  2%      +0.9        1.64 =C2=B1 23%
> >       perf-profile.calltrace.cycles-pp.xlog_wait.__xfs_log_force_lsn.xf=
s_log_force_lsn.xfs_file_fsync.xfs_file_write_iter
> >       0.00            +1.2        1.17 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.prep=
are_to_wait_event.raid1_write_request.raid1_make_request.md_handle_request
> >       0.00            +1.2        1.23 =C2=B1 18%
> >       perf-profile.calltrace.cycles-pp.prepare_to_wait_event.raid1_writ=
e_request.raid1_make_request.md_handle_request.submit_flushes
> >       0.00            +1.3        1.27 =C2=B1 17%
> >       perf-profile.calltrace.cycles-pp.raid1_write_request.raid1_make_r=
equest.md_handle_request.submit_flushes.process_one_work
> >       0.00            +1.3        1.27 =C2=B1 17%
> >       perf-profile.calltrace.cycles-pp.md_handle_request.submit_flushes=
.process_one_work.worker_thread.kthread
> >       0.00            +1.3        1.27 =C2=B1 17%
> >       perf-profile.calltrace.cycles-pp.raid1_make_request.md_handle_req=
uest.submit_flushes.process_one_work.worker_thread
> >       0.00            +1.3        1.27 =C2=B1 17%
> >       perf-profile.calltrace.cycles-pp.submit_flushes.process_one_work.=
worker_thread.kthread.ret_from_fork
> >       0.00            +1.6        1.65 =C2=B1 14%
> >       perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_f=
unction.__wake_up_common.__wake_up_common_lock.raid_end_bio_io
> >       0.00            +1.7        1.71 =C2=B1 14%
> >       perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_=
up_common.__wake_up_common_lock.raid_end_bio_io.raid1_end_write_request
> >       0.00            +1.7        1.71 =C2=B1 14%
> >       perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_commo=
n_lock.raid_end_bio_io.raid1_end_write_request.brd_make_request
> >       0.00            +1.9        1.86 =C2=B1 13%
> >       perf-profile.calltrace.cycles-pp.__wake_up_common_lock.raid_end_b=
io_io.raid1_end_write_request.brd_make_request.generic_make_request
> >       0.00            +2.1        2.10 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath=
._raw_spin_lock_irqsave.remove_wait_queue.__xfs_log_force_lsn.xfs_log_force=
_lsn
> >       0.00            +2.1        2.10 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wa=
it_queue.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync
> >       0.00            +2.1        2.11 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.remove_wait_queue.__xfs_log_forc=
e_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_write_iter
> >       0.00            +2.2        2.16 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.raid_end_bio_io.raid1_end_write_=
request.brd_make_request.generic_make_request.flush_bio_list
> >       2.24 =C2=B1  4%      +2.2        4.44 =C2=B1 15%
> >       perf-profile.calltrace.cycles-pp.xfs_log_force_lsn.xfs_file_fsync=
.xfs_file_write_iter.__vfs_write.vfs_write
> >       0.00            +2.3        2.25 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.raid1_end_write_request.brd_make=
_request.generic_make_request.flush_bio_list.flush_pending_writes
> >       0.00            +2.3        2.30 =C2=B1 20%
> >       perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath=
._raw_spin_lock_irqsave.raid1_write_request.raid1_make_request.md_handle_re=
quest
> >       0.00            +2.4        2.35 =C2=B1 20%
> >       perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.raid1_wri=
te_request.raid1_make_request.md_handle_request.md_make_request
> >       0.37 =C2=B1 65%      +2.4        2.81 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.md_thread.kthread.ret_from_fork
> >       0.26 =C2=B1100%      +2.5        2.81 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.raid1d.md_thread.kthread.ret_fro=
m_fork
> >       0.26 =C2=B1100%      +2.5        2.81 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.flush_pending_writes.raid1d.md_t=
hread.kthread.ret_from_fork
> >       0.26 =C2=B1100%      +2.6        2.81 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.flush_bio_list.flush_pending_wri=
tes.raid1d.md_thread.kthread
> >       0.10 =C2=B1200%      +2.7        2.76 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.generic_make_request.flush_bio_l=
ist.flush_pending_writes.raid1d.md_thread
> >       0.00            +2.7        2.73 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.brd_make_request.generic_make_re=
quest.flush_bio_list.flush_pending_writes.raid1d
> >       1.20 =C2=B1  3%      +3.1        4.35 =C2=B1 15%
> >       perf-profile.calltrace.cycles-pp.__xfs_log_force_lsn.xfs_log_forc=
e_lsn.xfs_file_fsync.xfs_file_write_iter.__vfs_write
> >       0.63 =C2=B1  6%      +3.8        4.38 =C2=B1 27%
> >       perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath=
._raw_spin_lock_irqsave.remove_wait_queue.__xfs_log_force_lsn.xfs_file_fsync
> >       0.63 =C2=B1  5%      +3.8        4.39 =C2=B1 27%
> >       perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wa=
it_queue.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_write_iter
> >       0.63 =C2=B1  5%      +3.8        4.40 =C2=B1 27%
> >       perf-profile.calltrace.cycles-pp.remove_wait_queue.__xfs_log_forc=
e_lsn.xfs_file_fsync.xfs_file_write_iter.__vfs_write
> >       1.26 =C2=B1  5%      +5.3        6.55 =C2=B1 27%
> >       perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath=
._raw_spin_lock.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_write_iter
> >       1.27 =C2=B1  5%      +5.3        6.55 =C2=B1 27%
> >       perf-profile.calltrace.cycles-pp._raw_spin_lock.__xfs_log_force_l=
sn.xfs_file_fsync.xfs_file_write_iter.__vfs_write
> >       1.30 =C2=B1  4%      +8.4        9.72 =C2=B1  9%
> >       perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.d=
o_idle.cpu_startup_entry.start_secondary
> >       1.33 =C2=B1  4%      +8.9       10.26 =C2=B1  9%
> >       perf-profile.calltrace.cycles-pp.cpuidle_enter_state.do_idle.cpu_=
startup_entry.start_secondary.secondary_startup_64
> >       2.28 =C2=B1  2%      +9.1       11.36 =C2=B1 27%
> >       perf-profile.calltrace.cycles-pp.__xfs_log_force_lsn.xfs_file_fsy=
nc.xfs_file_write_iter.__vfs_write.vfs_write
> >       1.59 =C2=B1  4%     +10.4       11.97 =C2=B1  9%
> >       perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_=
secondary.secondary_startup_64
> >       1.59 =C2=B1  4%     +10.4       11.98 =C2=B1  9%
> >       perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondar=
y.secondary_startup_64
> >       1.59 =C2=B1  4%     +10.4       11.98 =C2=B1  9%
> >       perf-profile.calltrace.cycles-pp.start_secondary.secondary_startu=
p_64
> >       1.63 =C2=B1  4%     +10.8       12.47 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.secondary_startup_64
> >       0.00           +57.7       57.66 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath=
._raw_spin_lock_irqsave.prepare_to_wait_event.raid1_write_request.raid1_mak=
e_request
> >       0.00           +57.7       57.73 =C2=B1 10%
> >       perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_t=
o_wait_event.raid1_write_request.raid1_make_request.md_handle_request
> >       0.05 =C2=B1299%     +57.8       57.85 =C2=B1  9%
> >       perf-profile.calltrace.cycles-pp.prepare_to_wait_event.raid1_writ=
e_request.raid1_make_request.md_handle_request.md_make_request
> >       0.19 =C2=B1154%     +62.5       62.73 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.raid1_write_request.raid1_make_r=
equest.md_handle_request.md_make_request.generic_make_request
> >       0.19 =C2=B1154%     +62.6       62.76 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.md_handle_request.md_make_reques=
t.generic_make_request.submit_bio.xfs_submit_ioend
> >       0.19 =C2=B1154%     +62.6       62.79 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.md_make_request.generic_make_req=
uest.submit_bio.xfs_submit_ioend.xfs_vm_writepages
> >       0.20 =C2=B1154%     +62.6       62.81 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.generic_make_request.submit_bio.=
xfs_submit_ioend.xfs_vm_writepages.do_writepages
> >       0.20 =C2=B1154%     +62.6       62.81 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.submit_bio.xfs_submit_ioend.xfs_=
vm_writepages.do_writepages.__filemap_fdatawrite_range
> >       0.20 =C2=B1154%     +62.6       62.82 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.xfs_submit_ioend.xfs_vm_writepag=
es.do_writepages.__filemap_fdatawrite_range.file_write_and_wait_range
> >       0.29 =C2=B1125%     +62.8       63.09 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.xfs_vm_writepages.do_writepages.=
__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync
> >       0.29 =C2=B1126%     +62.8       63.10 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.do_writepages.__filemap_fdatawri=
te_range.file_write_and_wait_range.xfs_file_fsync.xfs_file_write_iter
> >       0.29 =C2=B1125%     +62.8       63.11 =C2=B1  8%
> >       perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.file_=
write_and_wait_range.xfs_file_fsync.xfs_file_write_iter.__vfs_write
> >       0.62 =C2=B1 41%     +62.9       63.52 =C2=B1  7%
> >       perf-profile.calltrace.cycles-pp.file_write_and_wait_range.xfs_fi=
le_fsync.xfs_file_write_iter.__vfs_write.vfs_write
> >      88.51           -88.2        0.26 =C2=B1 19%
> >      perf-profile.children.cycles-pp.md_flush_request
> >      87.57           -87.2        0.35 =C2=B1 19%
> >      perf-profile.children.cycles-pp.submit_bio_wait
> >      87.59           -87.2        0.39 =C2=B1 19%
> >      perf-profile.children.cycles-pp.blkdev_issue_flush
> >      83.26           -83.2        0.02 =C2=B1123%
> >      perf-profile.children.cycles-pp._raw_spin_lock_irq
> >      88.85           -25.7       63.11 =C2=B1  8%
> >      perf-profile.children.cycles-pp.md_make_request
> >      88.90           -25.7       63.17 =C2=B1  8%
> >      perf-profile.children.cycles-pp.submit_bio
> >      88.83           -24.5       64.31 =C2=B1  8%
> >      perf-profile.children.cycles-pp.raid1_make_request
> >      88.84           -24.5       64.33 =C2=B1  8%
> >      perf-profile.children.cycles-pp.md_handle_request
> >      89.38           -23.5       65.92 =C2=B1  7%
> >      perf-profile.children.cycles-pp.generic_make_request
> >      89.90           -13.4       76.51 =C2=B1  2%
> >      perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
> >      92.79           -13.0       79.76
> >      perf-profile.children.cycles-pp.xfs_file_fsync
> >      93.08           -12.6       80.49
> >      perf-profile.children.cycles-pp.xfs_file_write_iter
> >      93.09           -12.6       80.54
> >      perf-profile.children.cycles-pp.__vfs_write
> >      93.13           -12.5       80.60
> >      perf-profile.children.cycles-pp.vfs_write
> >      93.13           -12.5       80.61
> >      perf-profile.children.cycles-pp.ksys_write
> >      93.22           -12.4       80.83
> >      perf-profile.children.cycles-pp.do_syscall_64
> >      93.22           -12.4       80.83
> >      perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
> >       3.40 =C2=B1  2%      -1.4        1.97 =C2=B1  8%
> >       perf-profile.children.cycles-pp.worker_thread
> >       3.33 =C2=B1  2%      -1.4        1.96 =C2=B1  9%
> >       perf-profile.children.cycles-pp.process_one_work
> >       1.03 =C2=B1  7%      -1.0        0.07 =C2=B1 37%
> >       perf-profile.children.cycles-pp.xlog_cil_force_lsn
> >       1.69 =C2=B1  2%      -0.7        0.96 =C2=B1  4%
> >       perf-profile.children.cycles-pp.reschedule_interrupt
> >       1.66 =C2=B1  2%      -0.7        0.94 =C2=B1  4%
> >       perf-profile.children.cycles-pp.scheduler_ipi
> >       1.13 =C2=B1  2%      -0.7        0.47 =C2=B1 11%
> >       perf-profile.children.cycles-pp.finish_wait
> >       0.54 =C2=B1  8%      -0.4        0.10 =C2=B1 38%
> >       perf-profile.children.cycles-pp.xlog_cil_push
> >       0.49 =C2=B1  9%      -0.4        0.09 =C2=B1 35%
> >       perf-profile.children.cycles-pp.xlog_write
> >       0.10 =C2=B1  8%      -0.1        0.04 =C2=B1 67%
> >       perf-profile.children.cycles-pp.flush_work
> >       0.20 =C2=B1  5%      -0.0        0.16 =C2=B1 11%
> >       perf-profile.children.cycles-pp.reweight_entity
> >       0.06 =C2=B1 10%      +0.0        0.10 =C2=B1 23%
> >       perf-profile.children.cycles-pp.brd_lookup_page
> >       0.18 =C2=B1  5%      +0.0        0.23 =C2=B1 13%
> >       perf-profile.children.cycles-pp.__update_load_avg_se
> >       0.02 =C2=B1153%      +0.1        0.07 =C2=B1 16%
> >       perf-profile.children.cycles-pp.delay_tsc
> >       0.03 =C2=B1100%      +0.1        0.08 =C2=B1 15%
> >       perf-profile.children.cycles-pp.find_next_bit
> >       0.08 =C2=B1  5%      +0.1        0.14 =C2=B1 14%
> >       perf-profile.children.cycles-pp.native_write_msr
> >       0.29 =C2=B1  4%      +0.1        0.36 =C2=B1  8%
> >       perf-profile.children.cycles-pp.__orc_find
> >       0.40 =C2=B1  4%      +0.1        0.46 =C2=B1  7%
> >       perf-profile.children.cycles-pp.dequeue_task_fair
> >       0.11 =C2=B1 11%      +0.1        0.18 =C2=B1 14%
> >       perf-profile.children.cycles-pp.__module_text_address
> >       0.12 =C2=B1  8%      +0.1        0.19 =C2=B1 13%
> >       perf-profile.children.cycles-pp.is_module_text_address
> >       0.04 =C2=B1 50%      +0.1        0.12 =C2=B1 19%
> >       perf-profile.children.cycles-pp.kmem_cache_alloc
> >       0.00            +0.1        0.08 =C2=B1 11%
> >       perf-profile.children.cycles-pp.clear_page_erms
> >       0.00            +0.1        0.08 =C2=B1 28%
> >       perf-profile.children.cycles-pp.__indirect_thunk_start
> >       0.01 =C2=B1200%      +0.1        0.10 =C2=B1 25%
> >       perf-profile.children.cycles-pp.xfs_trans_alloc
> >       0.00            +0.1        0.09 =C2=B1 18%
> >       perf-profile.children.cycles-pp.md_wakeup_thread
> >       0.00            +0.1        0.09 =C2=B1 26%
> >       perf-profile.children.cycles-pp.rebalance_domains
> >       0.00            +0.1        0.09 =C2=B1 26%
> >       perf-profile.children.cycles-pp.get_next_timer_interrupt
> >       0.00            +0.1        0.09 =C2=B1 20%
> >       perf-profile.children.cycles-pp.ktime_get
> >       0.18 =C2=B1  4%      +0.1        0.27 =C2=B1 12%
> >       perf-profile.children.cycles-pp.idle_cpu
> >       0.20 =C2=B1  6%      +0.1        0.30 =C2=B1  9%
> >       perf-profile.children.cycles-pp.unwind_get_return_address
> >       0.16 =C2=B1 10%      +0.1        0.25 =C2=B1 13%
> >       perf-profile.children.cycles-pp.__module_address
> >       0.03 =C2=B1100%      +0.1        0.13 =C2=B1  8%
> >       perf-profile.children.cycles-pp.brd_insert_page
> >       0.06 =C2=B1  9%      +0.1        0.16 =C2=B1 14%
> >       perf-profile.children.cycles-pp.task_tick_fair
> >       0.08 =C2=B1 12%      +0.1        0.18 =C2=B1 24%
> >       perf-profile.children.cycles-pp.bio_alloc_bioset
> >       0.03 =C2=B1 81%      +0.1        0.14 =C2=B1 27%
> >       perf-profile.children.cycles-pp.generic_make_request_checks
> >       0.17 =C2=B1  7%      +0.1        0.28 =C2=B1 11%
> >       perf-profile.children.cycles-pp.__kernel_text_address
> >       0.11 =C2=B1  9%      +0.1        0.22 =C2=B1 15%
> >       perf-profile.children.cycles-pp.wake_up_page_bit
> >       0.16 =C2=B1  6%      +0.1        0.27 =C2=B1 10%
> >       perf-profile.children.cycles-pp.kernel_text_address
> >       0.00            +0.1        0.11 =C2=B1 11%
> >       perf-profile.children.cycles-pp.get_page_from_freelist
> >       0.00            +0.1        0.11 =C2=B1 19%
> >       perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
> >       0.00            +0.1        0.11 =C2=B1  7%
> >       perf-profile.children.cycles-pp.__alloc_pages_nodemask
> >       0.08 =C2=B1 10%      +0.1        0.19 =C2=B1 22%
> >       perf-profile.children.cycles-pp.xfs_do_writepage
> >       0.25 =C2=B1  4%      +0.1        0.37 =C2=B1 10%
> >       perf-profile.children.cycles-pp.switch_mm_irqs_off
> >       0.00            +0.1        0.12 =C2=B1 13%
> >       perf-profile.children.cycles-pp.switch_mm
> >       0.08 =C2=B1 38%      +0.1        0.20 =C2=B1 19%
> >       perf-profile.children.cycles-pp.io_serial_in
> >       0.18 =C2=B1  5%      +0.1        0.31 =C2=B1  7%
> >       perf-profile.children.cycles-pp.dequeue_entity
> >       0.00            +0.1        0.13 =C2=B1 26%
> >       perf-profile.children.cycles-pp.tick_nohz_next_event
> >       0.06 =C2=B1 11%      +0.1        0.19 =C2=B1 19%
> >       perf-profile.children.cycles-pp.mempool_alloc
> >       0.32 =C2=B1  5%      +0.1        0.45 =C2=B1  6%
> >       perf-profile.children.cycles-pp.orc_find
> >       0.15 =C2=B1 10%      +0.1        0.29 =C2=B1 19%
> >       perf-profile.children.cycles-pp.xfs_destroy_ioend
> >       0.15 =C2=B1 11%      +0.1        0.30 =C2=B1 18%
> >       perf-profile.children.cycles-pp.call_bio_endio
> >       0.08 =C2=B1 17%      +0.2        0.23 =C2=B1 25%
> >       perf-profile.children.cycles-pp.xlog_state_done_syncing
> >       0.00            +0.2        0.15 =C2=B1 22%
> >       perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
> >       0.12 =C2=B1  8%      +0.2        0.27 =C2=B1 23%
> >       perf-profile.children.cycles-pp.write_cache_pages
> >       0.10 =C2=B1 16%      +0.2        0.26 =C2=B1 16%
> >       perf-profile.children.cycles-pp.wait_for_xmitr
> >       0.10 =C2=B1 19%      +0.2        0.25 =C2=B1 14%
> >       perf-profile.children.cycles-pp.serial8250_console_putchar
> >       0.10 =C2=B1 17%      +0.2        0.26 =C2=B1 13%
> >       perf-profile.children.cycles-pp.uart_console_write
> >       0.10 =C2=B1 16%      +0.2        0.26 =C2=B1 15%
> >       perf-profile.children.cycles-pp.serial8250_console_write
> >       0.11 =C2=B1 15%      +0.2        0.27 =C2=B1 15%
> >       perf-profile.children.cycles-pp.console_unlock
> >       0.09 =C2=B1  9%      +0.2        0.26 =C2=B1 12%
> >       perf-profile.children.cycles-pp.scheduler_tick
> >       0.10 =C2=B1 18%      +0.2        0.28 =C2=B1 15%
> >       perf-profile.children.cycles-pp.irq_work_run_list
> >       0.10 =C2=B1 15%      +0.2        0.28 =C2=B1 14%
> >       perf-profile.children.cycles-pp.xlog_state_do_callback
> >       0.09 =C2=B1 12%      +0.2        0.27 =C2=B1 16%
> >       perf-profile.children.cycles-pp.irq_work_run
> >       0.09 =C2=B1 12%      +0.2        0.27 =C2=B1 16%
> >       perf-profile.children.cycles-pp.printk
> >       0.09 =C2=B1 12%      +0.2        0.27 =C2=B1 16%
> >       perf-profile.children.cycles-pp.vprintk_emit
> >       0.09 =C2=B1 12%      +0.2        0.27 =C2=B1 17%
> >       perf-profile.children.cycles-pp.irq_work_interrupt
> >       0.09 =C2=B1 12%      +0.2        0.27 =C2=B1 17%
> >       perf-profile.children.cycles-pp.smp_irq_work_interrupt
> >       0.00            +0.2        0.18 =C2=B1 16%
> >       perf-profile.children.cycles-pp.poll_idle
> >       0.30 =C2=B1  4%      +0.2        0.49 =C2=B1 11%
> >       perf-profile.children.cycles-pp.update_load_avg
> >       1.39 =C2=B1  2%      +0.2        1.59 =C2=B1  6%
> >       perf-profile.children.cycles-pp.__save_stack_trace
> >       1.43            +0.2        1.65 =C2=B1  6%
> >       perf-profile.children.cycles-pp.save_stack_trace_tsk
> >       0.14 =C2=B1 13%      +0.2        0.36 =C2=B1 13%
> >       perf-profile.children.cycles-pp.update_process_times
> >       0.00            +0.2        0.23 =C2=B1 22%
> >       perf-profile.children.cycles-pp.find_busiest_group
> >       0.22 =C2=B1  6%      +0.2        0.45 =C2=B1 18%
> >       perf-profile.children.cycles-pp.brd_do_bvec
> >       0.14 =C2=B1 13%      +0.2        0.38 =C2=B1 14%
> >       perf-profile.children.cycles-pp.tick_sched_handle
> >       0.10 =C2=B1  8%      +0.2        0.34 =C2=B1 26%
> >       perf-profile.children.cycles-pp.xfs_log_commit_cil
> >       0.07 =C2=B1 10%      +0.3        0.33 =C2=B1 23%
> >       perf-profile.children.cycles-pp.io_schedule
> >       0.03 =C2=B1 83%      +0.3        0.29 =C2=B1 27%
> >       perf-profile.children.cycles-pp.__softirqentry_text_start
> >       0.11 =C2=B1  5%      +0.3        0.36 =C2=B1 25%
> >       perf-profile.children.cycles-pp.__xfs_trans_commit
> >       0.06 =C2=B1 36%      +0.3        0.31 =C2=B1 26%
> >       perf-profile.children.cycles-pp.irq_exit
> >       0.08 =C2=B1  9%      +0.3        0.35 =C2=B1 23%
> >       perf-profile.children.cycles-pp.wait_on_page_bit_common
> >       0.15 =C2=B1 12%      +0.3        0.42 =C2=B1 14%
> >       perf-profile.children.cycles-pp.tick_sched_timer
> >       0.10 =C2=B1 11%      +0.3        0.39 =C2=B1 22%
> >       perf-profile.children.cycles-pp.__filemap_fdatawait_range
> >       0.06 =C2=B1 12%      +0.3        0.37 =C2=B1  9%
> >       perf-profile.children.cycles-pp.schedule_idle
> >       0.02 =C2=B1153%      +0.3        0.34 =C2=B1 17%
> >       perf-profile.children.cycles-pp.menu_select
> >       0.17 =C2=B1  5%      +0.3        0.49 =C2=B1 22%
> >       perf-profile.children.cycles-pp.xfs_vn_update_time
> >       0.19 =C2=B1 12%      +0.3        0.51 =C2=B1 18%
> >       perf-profile.children.cycles-pp.xlog_iodone
> >       0.18 =C2=B1  5%      +0.3        0.51 =C2=B1 22%
> >       perf-profile.children.cycles-pp.file_update_time
> >       0.18 =C2=B1  5%      +0.3        0.51 =C2=B1 21%
> >       perf-profile.children.cycles-pp.xfs_file_aio_write_checks
> >       0.21 =C2=B1 11%      +0.4        0.60 =C2=B1 15%
> >       perf-profile.children.cycles-pp.__hrtimer_run_queues
> >       0.26 =C2=B1  6%      +0.4        0.69 =C2=B1 16%
> >       perf-profile.children.cycles-pp.pick_next_task_fair
> >       1.20 =C2=B1  2%      +0.4        1.64 =C2=B1 10%
> >       perf-profile.children.cycles-pp.schedule
> >       0.28 =C2=B1  5%      +0.4        0.72 =C2=B1 21%
> >       perf-profile.children.cycles-pp.xfs_file_buffered_aio_write
> >       0.00            +0.4        0.44 =C2=B1 22%
> >       perf-profile.children.cycles-pp.load_balance
> >       0.25 =C2=B1  8%      +0.5        0.74 =C2=B1 15%
> >       perf-profile.children.cycles-pp.hrtimer_interrupt
> >       1.30 =C2=B1  2%      +0.7        2.00 =C2=B1  9%
> >       perf-profile.children.cycles-pp.__schedule
> >       0.31 =C2=B1  8%      +0.8        1.09 =C2=B1 16%
> >       perf-profile.children.cycles-pp.smp_apic_timer_interrupt
> >       0.31 =C2=B1  8%      +0.8        1.09 =C2=B1 16%
> >       perf-profile.children.cycles-pp.apic_timer_interrupt
> >       3.92 =C2=B1  2%      +0.9        4.79 =C2=B1  6%
> >       perf-profile.children.cycles-pp.ret_from_fork
> >       3.92 =C2=B1  2%      +0.9        4.79 =C2=B1  6%
> >       perf-profile.children.cycles-pp.kthread
> >       0.69 =C2=B1  2%      +0.9        1.64 =C2=B1 23%
> >       perf-profile.children.cycles-pp.xlog_wait
> >       0.08 =C2=B1 13%      +1.2        1.27 =C2=B1 17%
> >       perf-profile.children.cycles-pp.submit_flushes
> >       0.16 =C2=B1  9%      +1.6        1.74 =C2=B1  4%
> >       perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
> >       0.17 =C2=B1  9%      +2.0        2.16 =C2=B1 10%
> >       perf-profile.children.cycles-pp.raid_end_bio_io
> >       0.21 =C2=B1  6%      +2.0        2.25 =C2=B1 10%
> >       perf-profile.children.cycles-pp.raid1_end_write_request
> >       2.24 =C2=B1  4%      +2.2        4.44 =C2=B1 15%
> >       perf-profile.children.cycles-pp.xfs_log_force_lsn
> >       0.46 =C2=B1  6%      +2.3        2.73 =C2=B1  7%
> >       perf-profile.children.cycles-pp.brd_make_request
> >       0.51 =C2=B1  6%      +2.3        2.81 =C2=B1  7%
> >       perf-profile.children.cycles-pp.md_thread
> >       0.49 =C2=B1  6%      +2.3        2.81 =C2=B1  7%
> >       perf-profile.children.cycles-pp.raid1d
> >       0.49 =C2=B1  6%      +2.3        2.81 =C2=B1  7%
> >       perf-profile.children.cycles-pp.flush_pending_writes
> >       0.49 =C2=B1  6%      +2.3        2.81 =C2=B1  7%
> >       perf-profile.children.cycles-pp.flush_bio_list
> >       1.80 =C2=B1  3%      +5.6        7.44 =C2=B1 27%
> >       perf-profile.children.cycles-pp._raw_spin_lock
> >       2.12 =C2=B1  4%      +5.8        7.97 =C2=B1 20%
> >       perf-profile.children.cycles-pp.remove_wait_queue
> >       1.33 =C2=B1  4%      +8.8       10.12 =C2=B1  8%
> >       perf-profile.children.cycles-pp.intel_idle
> >       1.37 =C2=B1  4%      +9.3       10.71 =C2=B1  8%
> >       perf-profile.children.cycles-pp.cpuidle_enter_state
> >       1.59 =C2=B1  4%     +10.4       11.98 =C2=B1  9%
> >       perf-profile.children.cycles-pp.start_secondary
> >       1.63 =C2=B1  4%     +10.8       12.47 =C2=B1  8%
> >       perf-profile.children.cycles-pp.secondary_startup_64
> >       1.63 =C2=B1  4%     +10.8       12.47 =C2=B1  8%
> >       perf-profile.children.cycles-pp.cpu_startup_entry
> >       1.63 =C2=B1  4%     +10.9       12.49 =C2=B1  8%
> >       perf-profile.children.cycles-pp.do_idle
> >       3.48           +12.2       15.72 =C2=B1 23%
> >       perf-profile.children.cycles-pp.__xfs_log_force_lsn
> >       1.36 =C2=B1 12%     +57.8       59.12 =C2=B1 10%
> >       perf-profile.children.cycles-pp.prepare_to_wait_event
> >       0.43 =C2=B1 38%     +62.4       62.82 =C2=B1  8%
> >       perf-profile.children.cycles-pp.xfs_submit_ioend
> >       0.55 =C2=B1 29%     +62.5       63.10 =C2=B1  8%
> >       perf-profile.children.cycles-pp.xfs_vm_writepages
> >       0.55 =C2=B1 30%     +62.5       63.10 =C2=B1  8%
> >       perf-profile.children.cycles-pp.do_writepages
> >       0.55 =C2=B1 29%     +62.6       63.11 =C2=B1  8%
> >       perf-profile.children.cycles-pp.__filemap_fdatawrite_range
> >       0.66 =C2=B1 25%     +62.9       63.52 =C2=B1  7%
> >       perf-profile.children.cycles-pp.file_write_and_wait_range
> >       0.39 =C2=B1 43%     +63.6       64.02 =C2=B1  8%
> >       perf-profile.children.cycles-pp.raid1_write_request
> >       5.43 =C2=B1  3%     +64.2       69.64 =C2=B1  5%
> >       perf-profile.children.cycles-pp._raw_spin_lock_irqsave
> >      89.86           -13.5       76.31 =C2=B1  2%
> >      perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
> >       0.14 =C2=B1  8%      -0.0        0.09 =C2=B1 19%
> >       perf-profile.self.cycles-pp.md_flush_request
> >       0.10 =C2=B1 12%      -0.0        0.07 =C2=B1 21%
> >       perf-profile.self.cycles-pp.account_entity_enqueue
> >       0.06 =C2=B1  7%      +0.0        0.08 =C2=B1 12%
> >       perf-profile.self.cycles-pp.pick_next_task_fair
> >       0.05 =C2=B1 12%      +0.0        0.08 =C2=B1 18%
> >       perf-profile.self.cycles-pp.___perf_sw_event
> >       0.15 =C2=B1  6%      +0.0        0.18 =C2=B1  9%
> >       perf-profile.self.cycles-pp.__update_load_avg_se
> >       0.17 =C2=B1  4%      +0.0        0.22 =C2=B1 10%
> >       perf-profile.self.cycles-pp.__schedule
> >       0.10 =C2=B1 11%      +0.1        0.15 =C2=B1 11%
> >       perf-profile.self.cycles-pp._raw_spin_lock
> >       0.02 =C2=B1153%      +0.1        0.07 =C2=B1 16%
> >       perf-profile.self.cycles-pp.delay_tsc
> >       0.02 =C2=B1152%      +0.1        0.07 =C2=B1 23%
> >       perf-profile.self.cycles-pp.set_next_entity
> >       0.03 =C2=B1100%      +0.1        0.08 =C2=B1 15%
> >       perf-profile.self.cycles-pp.find_next_bit
> >       0.08 =C2=B1  5%      +0.1        0.14 =C2=B1 14%
> >       perf-profile.self.cycles-pp.native_write_msr
> >       0.01 =C2=B1200%      +0.1        0.07 =C2=B1 23%
> >       perf-profile.self.cycles-pp.kmem_cache_alloc
> >       0.29 =C2=B1  4%      +0.1        0.36 =C2=B1  8%
> >       perf-profile.self.cycles-pp.__orc_find
> >       0.14 =C2=B1  7%      +0.1        0.21 =C2=B1 12%
> >       perf-profile.self.cycles-pp.switch_mm_irqs_off
> >       0.00            +0.1        0.08 =C2=B1 11%
> >       perf-profile.self.cycles-pp.clear_page_erms
> >       0.00            +0.1        0.08 =C2=B1 28%
> >       perf-profile.self.cycles-pp.__indirect_thunk_start
> >       0.00            +0.1        0.08 =C2=B1 20%
> >       perf-profile.self.cycles-pp.md_wakeup_thread
> >       0.34 =C2=B1  6%      +0.1        0.43 =C2=B1 12%
> >       perf-profile.self.cycles-pp._raw_spin_lock_irqsave
> >       0.18 =C2=B1  4%      +0.1        0.27 =C2=B1 12%
> >       perf-profile.self.cycles-pp.idle_cpu
> >       0.16 =C2=B1 10%      +0.1        0.25 =C2=B1 13%
> >       perf-profile.self.cycles-pp.__module_address
> >       0.06 =C2=B1 11%      +0.1        0.17 =C2=B1 14%
> >       perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
> >       0.08 =C2=B1 38%      +0.1        0.20 =C2=B1 19%
> >       perf-profile.self.cycles-pp.io_serial_in
> >       0.18 =C2=B1  5%      +0.1        0.32 =C2=B1 15%
> >       perf-profile.self.cycles-pp.update_load_avg
> >       0.00            +0.1        0.15 =C2=B1 17%
> >       perf-profile.self.cycles-pp.poll_idle
> >       0.00            +0.2        0.15 =C2=B1 16%
> >       perf-profile.self.cycles-pp.menu_select
> >       0.00            +0.2        0.18 =C2=B1 24%
> >       perf-profile.self.cycles-pp.find_busiest_group
> >       0.02 =C2=B1152%      +0.3        0.35 =C2=B1 21%
> >       perf-profile.self.cycles-pp.raid1_write_request
> >       1.33 =C2=B1  4%      +8.8       10.12 =C2=B1  8%
> >       perf-profile.self.cycles-pp.intel_idle
> > =

> > =

> >                                                                        =
         =

> >                                  aim7.jobs-per-min
> >                                                                        =
         =

> >   1700
> >   +-+------------------------------------------------------------------+
> >        |+ ++++++ :+   ++++ ++++     +++     ++++++ +  +  ++++++++++++ ++
> >        |++|
> >   1600 +-+       + +++    +    +++++   ++.++      + ++ ++            + =
 ++
> >   |
> >        |                                                               =
     |   =

> >        |                                                               =
     |   =

> >   1500 +-+
> >   |
> >        |                                                               =
     |   =

> >   1400 +-+
> >   |
> >        |                                                               =
     |   =

> >   1300 +-+
> >   |
> >        |                                                               =
     |   =

> >        O  OO         OO  O              O          O
> >        |
> >   1200 +OO  OOOOOOOOO  OO OOOOOOOOOOOOOO  OOOOOOOOO O
> >   |
> >        |                                                               =
     |   =

> >   1100
> >   +-+------------------------------------------------------------------+
> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                                                                        =
         =

> > [*] bisect-good sample
> > [O] bisect-bad  sample
> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are
> > provided
> > for informational purposes only. Any difference in system hardware or
> > software
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Xiaolong
>=20

--===============6264651848547706395==--

