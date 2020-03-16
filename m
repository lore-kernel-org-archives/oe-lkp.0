Content-Type: multipart/mixed; boundary="===============8076430262763689861=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] 2e654b6306: stress-ng.hdd.ops_per_sec -69.5% regression
Date: Mon, 16 Mar 2020 09:52:46 +0800
Message-ID: <20200316015246.GF11705@shao2-debian>
In-Reply-To: <e251ab96-929a-696b-0497-13f981362e31@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8076430262763689861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 03:31:05PM +0800, Alex Shi wrote:
> Many thanks for the testing report.
> =

> This commit is surpose to have much perf lose on lru_lock incrase, but la=
ter patch could fall back a lot on lru_lock reducing. =

> =

> Since the 69.5% drop is just on this commit, how much we lost for the who=
le patchset?

The regression of the patchset is 12%.

        v5.6-rc4  634eb73be260286da9c1f1ecc3  testcase/testparams/testbox
----------------  --------------------------  ---------------------------
         %stddev      change         %stddev
             \          |                \  =

   1218565             -12%    1077320        stress-ng/io-performance-1HDD=
-100%-30s-ucode=3D0x500002c/lkp-csl-2sp5
   1218565             -12%    1077320        GEO-MEAN stress-ng.hdd.ops_pe=
r_sec

Best Regards,
Rong Chen

> =

> Thanks
> Alex
> =

> =E5=9C=A8 2020/3/12 =E4=B8=8A=E5=8D=8810:43, kernel test robot =E5=86=99=
=E9=81=93:
> > Greeting,
> > =

> > FYI, we noticed a -69.5% regression of stress-ng.hdd.ops_per_sec due to=
 commit:
> > =

> > =

> > commit: 2e654b630637ccdb649032ab6951fc517d8a3f52 ("mm/lru: replace pgda=
t lru_lock with lruvec lock")
> > https://github.com/alexshi/linux.git lrunextthp2
> > =

> > in testcase: stress-ng
> > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz wi=
th 192G memory
> > with following parameters:
> > =

> > 	nr_threads: 100%
> > 	disk: 1HDD
> > 	testtime: 30s
> > 	class: io
> > 	cpufreq_governor: performance
> > 	ucode: 0x500002c
> > =

> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> > =

> > =

> > To reproduce:
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_gro=
up/testcase/testtime/ucode:
> >   io/gcc-7/performance/1HDD/x86_64-rhel-7.6/100%/debian-x86_64-20191114=
.cgz/lkp-csl-2sp5/stress-ng/30s/0x500002c
> > =

> > commit: =

> >   36b05905bc ("mm/mlock: clean up __munlock_isolate_lru_page")
> >   2e654b6306 ("mm/lru: replace pgdat lru_lock with lruvec lock")
> > =

> > 36b05905bc83bcf1 2e654b630637ccdb649032ab695 =

> > ---------------- --------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >   34916296           -69.5%   10661051        stress-ng.hdd.ops
> >    1163719           -69.5%     355316        stress-ng.hdd.ops_per_sec
> >  2.208e+08           -69.5%   67357030        stress-ng.revio.ops
> >    7360285           -69.5%    2245135        stress-ng.revio.ops_per_s=
ec
> >      34211           -70.0%      10279        stress-ng.sync-file.ops
> >       1140           -70.0%     342.60        stress-ng.sync-file.ops_p=
er_sec
> >     149847 =C2=B1  2%     -38.9%      91549 =C2=B1  3%  stress-ng.time.=
involuntary_context_switches
> >      12.21            -1.1%      12.08        iostat.cpu.user
> >       2953           -22.0%       2304 =C2=B1  2%  vmstat.system.cs
> >     102059           -12.2%      89605 =C2=B1  2%  meminfo.KReclaimable
> >     102059           -12.2%      89605 =C2=B1  2%  meminfo.SReclaimable
> >      50376 =C2=B1  6%     -21.6%      39482 =C2=B1 13%  numa-meminfo.no=
de1.KReclaimable
> >      50376 =C2=B1  6%     -21.6%      39482 =C2=B1 13%  numa-meminfo.no=
de1.SReclaimable
> >  1.861e+09 =C2=B1 41%     +58.6%  2.951e+09        cpuidle.C1E.time
> >    4607850 =C2=B1 21%     +33.6%    6155007        cpuidle.C1E.usage
> >       6380 =C2=B1  9%     +18.0%       7527 =C2=B1  6%  cpuidle.POLL.us=
age
> >  4.183e+08           -69.5%  1.274e+08        numa-numastat.node0.local=
_node
> >  4.183e+08           -69.5%  1.274e+08        numa-numastat.node0.numa_=
hit
> >  4.179e+08           -69.5%  1.274e+08        numa-numastat.node1.local=
_node
> >  4.179e+08           -69.5%  1.274e+08        numa-numastat.node1.numa_=
hit
> >      62723           -30.1%      43819 =C2=B1  8%  slabinfo.radix_tree_=
node.active_objs
> >       1133           -30.9%     782.75 =C2=B1  8%  slabinfo.radix_tree_=
node.active_slabs
> >      63499           -30.9%      43869 =C2=B1  8%  slabinfo.radix_tree_=
node.num_objs
> >       1133           -30.9%     782.75 =C2=B1  8%  slabinfo.radix_tree_=
node.num_slabs
> >  1.725e+08           -69.1%   53265509        numa-vmstat.node0.numa_hit
> >  1.723e+08           -69.2%   53158587        numa-vmstat.node0.numa_lo=
cal
> >     154929 =C2=B1  8%     -31.0%     106965 =C2=B1 57%  numa-vmstat.nod=
e0.numa_other
> >      12582 =C2=B1  5%     -21.7%       9856 =C2=B1 13%  numa-vmstat.nod=
e1.nr_slab_reclaimable
> >  1.723e+08           -69.1%   53318620        numa-vmstat.node1.numa_hit
> >  1.723e+08           -69.1%   53224009        numa-vmstat.node1.numa_lo=
cal
> >       1809 =C2=B1 41%     -60.4%     717.00 =C2=B1119%  interrupts.CPU1=
.RES:Rescheduling_interrupts
> >       1319 =C2=B1 50%     -66.9%     436.25 =C2=B1 95%  interrupts.CPU1=
3.RES:Rescheduling_interrupts
> >       1673 =C2=B1 63%     -83.6%     274.75 =C2=B1120%  interrupts.CPU6=
1.RES:Rescheduling_interrupts
> >       1779 =C2=B1106%     -79.2%     370.75 =C2=B1126%  interrupts.CPU6=
3.RES:Rescheduling_interrupts
> >       4926 =C2=B1 34%     +60.1%       7889        interrupts.CPU68.NMI=
:Non-maskable_interrupts
> >       4926 =C2=B1 34%     +60.1%       7889        interrupts.CPU68.PMI=
:Performance_monitoring_interrupts
> >     174.25 =C2=B1  3%     +44.8%     252.25 =C2=B1  2%  interrupts.IWI:=
IRQ_work_interrupts
> >     305.75 =C2=B1 24%     +80.1%     550.75 =C2=B1 19%  interrupts.TLB:=
TLB_shootdowns
> >      19090 =C2=B1  2%      +9.2%      20853        proc-vmstat.nr_shmem
> >      25504           -12.2%      22398 =C2=B1  2%  proc-vmstat.nr_slab_=
reclaimable
> >  8.354e+08           -69.6%  2.542e+08        proc-vmstat.numa_hit
> >  8.354e+08           -69.6%  2.541e+08        proc-vmstat.numa_local
> >      32042 =C2=B1  3%     +15.0%      36851        proc-vmstat.pgactiva=
te
> >  8.375e+08           -69.5%   2.55e+08        proc-vmstat.pgalloc_normal
> >  8.374e+08           -69.6%  2.549e+08        proc-vmstat.pgfree
> >  8.347e+08           -69.6%  2.537e+08        proc-vmstat.unevictable_p=
gs_culled
> >     273.38           +10.3%     301.44        sched_debug.cfs_rq:/.load=
_avg.max
> >      75.00 =C2=B1 46%     +56.8%     117.62 =C2=B1  7%  sched_debug.cfs=
_rq:/.removed.util_avg.max
> >       4598           -13.0%       4002        sched_debug.cpu.nr_switch=
es.avg
> >       2193 =C2=B1  7%     -35.9%       1406 =C2=B1  6%  sched_debug.cpu=
.nr_switches.min
> >       2977           -20.3%       2373        sched_debug.cpu.sched_cou=
nt.avg
> >       1316 =C2=B1  3%     -53.2%     616.75 =C2=B1  2%  sched_debug.cpu=
.sched_count.min
> >       2769 =C2=B1  8%     +17.8%       3263 =C2=B1  6%  sched_debug.cpu=
.sched_goidle.max
> >       1410           -21.2%       1111        sched_debug.cpu.ttwu_coun=
t.avg
> >     606.94 =C2=B1  2%     -57.6%     257.44 =C2=B1  2%  sched_debug.cpu=
.ttwu_count.min
> >       1071 =C2=B1  2%     -27.9%     772.08 =C2=B1  3%  sched_debug.cpu=
.ttwu_local.avg
> >     591.56 =C2=B1  2%     -58.2%     247.56        sched_debug.cpu.ttwu=
_local.min
> >  2.245e+10            -9.5%  2.033e+10        perf-stat.i.branch-instru=
ctions
> >  1.808e+08            -5.4%  1.711e+08        perf-stat.i.branch-misses
> >      54.50 =C2=B1  2%     -12.4       42.07        perf-stat.i.cache-mi=
ss-rate%
> >   2.99e+08           -30.1%   2.09e+08        perf-stat.i.cache-misses
> >  4.109e+08           -16.5%  3.431e+08        perf-stat.i.cache-referen=
ces
> >       2921           -22.3%       2271        perf-stat.i.context-switc=
hes
> >       3.12 =C2=B1  3%     +51.7%       4.73        perf-stat.i.cpi
> >     119.94            -5.8%     112.93        perf-stat.i.cpu-migrations
> >       2135 =C2=B1  7%    +170.5%       5776 =C2=B1  5%  perf-stat.i.cyc=
les-between-cache-misses
> >       0.09 =C2=B1 42%      -0.1        0.02 =C2=B1  5%  perf-stat.i.dTL=
B-load-miss-rate%
> >  2.918e+10           -10.4%  2.613e+10        perf-stat.i.dTLB-loads
> >       0.03 =C2=B1 28%      -0.0        0.02 =C2=B1  7%  perf-stat.i.dTL=
B-store-miss-rate%
> >    1328065 =C2=B1 13%     -60.2%     528688 =C2=B1  7%  perf-stat.i.dTL=
B-store-misses
> >  1.215e+10           -16.4%  1.016e+10        perf-stat.i.dTLB-stores
> >      90.45            -1.3       89.13        perf-stat.i.iTLB-load-mis=
s-rate%
> >  1.268e+11            -8.4%  1.162e+11        perf-stat.i.instructions
> >       0.56            -5.8%       0.53        perf-stat.i.ipc
> >    9428109 =C2=B1 68%     -81.5%    1745740 =C2=B1 40%  perf-stat.i.nod=
e-load-misses
> >  1.602e+08 =C2=B1  6%     -13.7%  1.383e+08 =C2=B1  2%  perf-stat.i.nod=
e-loads
> >    1903934 =C2=B1108%     -83.3%     318054 =C2=B1 20%  perf-stat.i.nod=
e-store-misses
> >   36769171 =C2=B1  6%     -34.0%   24258343        perf-stat.i.node-sto=
res
> >       3.25            -7.3%       3.01        perf-stat.overall.MPKI
> >       0.80            +0.0        0.83        perf-stat.overall.branch-=
miss-rate%
> >      72.49           -12.7       59.84        perf-stat.overall.cache-m=
iss-rate%
> >       1.71           +11.4%       1.90        perf-stat.overall.cpi
> >     726.44           +45.4%       1056        perf-stat.overall.cycles-=
between-cache-misses
> >       0.01 =C2=B1 15%      -0.0        0.01 =C2=B1  7%  perf-stat.overa=
ll.dTLB-store-miss-rate%
> >       0.59           -10.2%       0.53        perf-stat.overall.ipc
> >       4.85 =C2=B1107%      -3.5        1.33 =C2=B1 20%  perf-stat.overa=
ll.node-store-miss-rate%
> >  2.218e+10           -11.2%  1.971e+10        perf-stat.ps.branch-instr=
uctions
> >  1.782e+08            -7.7%  1.644e+08        perf-stat.ps.branch-misses
> >  2.943e+08           -31.3%  2.022e+08        perf-stat.ps.cache-misses
> >  4.061e+08           -16.8%  3.379e+08        perf-stat.ps.cache-refere=
nces
> >       2900           -22.2%       2256        perf-stat.ps.context-swit=
ches
> >     118.91            -5.8%     111.96        perf-stat.ps.cpu-migratio=
ns
> >  2.882e+10           -12.3%  2.529e+10        perf-stat.ps.dTLB-loads
> >    1410086 =C2=B1 14%     -60.8%     553300 =C2=B1  7%  perf-stat.ps.dT=
LB-store-misses
> >    1.2e+10           -18.5%  9.789e+09        perf-stat.ps.dTLB-stores
> >  1.251e+08 =C2=B1  3%      -6.6%  1.168e+08 =C2=B1  2%  perf-stat.ps.iT=
LB-load-misses
> >  1.251e+11           -10.3%  1.123e+11        perf-stat.ps.instructions
> >    9234161 =C2=B1 68%     -81.8%    1679385 =C2=B1 40%  perf-stat.ps.no=
de-load-misses
> >  1.571e+08 =C2=B1  6%     -15.4%  1.329e+08 =C2=B1  2%  perf-stat.ps.no=
de-loads
> >    1879361 =C2=B1106%     -83.0%     319700 =C2=B1 19%  perf-stat.ps.no=
de-store-misses
> >   37089074 =C2=B1  6%     -36.1%   23715352        perf-stat.ps.node-st=
ores
> >  2.273e+13           -10.3%  2.039e+13        perf-stat.total.instructi=
ons
> >      82498 =C2=B1  2%     -29.8%      57879 =C2=B1  3%  softirqs.CPU0.R=
CU
> >      79134           -35.0%      51413 =C2=B1  4%  softirqs.CPU1.RCU
> >      79615 =C2=B1  3%     -38.6%      48918 =C2=B1  3%  softirqs.CPU10.=
RCU
> >      78063           -37.3%      48932 =C2=B1  3%  softirqs.CPU11.RCU
> >      78057           -37.6%      48696 =C2=B1  3%  softirqs.CPU12.RCU
> >      80054 =C2=B1  3%     -37.7%      49897        softirqs.CPU13.RCU
> >      78076           -34.9%      50860 =C2=B1  2%  softirqs.CPU14.RCU
> >      77915           -36.4%      49543 =C2=B1  5%  softirqs.CPU15.RCU
> >      80146 =C2=B1  2%     -37.3%      50248 =C2=B1  5%  softirqs.CPU16.=
RCU
> >      78713           -36.2%      50237 =C2=B1  6%  softirqs.CPU17.RCU
> >      79503 =C2=B1  2%     -38.5%      48890 =C2=B1  3%  softirqs.CPU18.=
RCU
> >      79758           -35.9%      51148 =C2=B1  7%  softirqs.CPU19.RCU
> >      78095           -36.5%      49553 =C2=B1  2%  softirqs.CPU2.RCU
> >      78277           -34.0%      51653 =C2=B1  3%  softirqs.CPU20.RCU
> >      78936 =C2=B1  3%     -37.9%      48983 =C2=B1  2%  softirqs.CPU21.=
RCU
> >      78588           -34.5%      51514 =C2=B1  5%  softirqs.CPU22.RCU
> >      78483           -36.4%      49890 =C2=B1  3%  softirqs.CPU23.RCU
> >      78979           -38.6%      48468        softirqs.CPU24.RCU
> >      80540           -37.3%      50481 =C2=B1  4%  softirqs.CPU25.RCU
> >      79901 =C2=B1  4%     -32.1%      54234 =C2=B1 11%  softirqs.CPU26.=
RCU
> >      83231 =C2=B1  5%     -38.5%      51164 =C2=B1  4%  softirqs.CPU27.=
RCU
> >      78565           -37.8%      48872 =C2=B1  4%  softirqs.CPU28.RCU
> >      79095           -38.9%      48358 =C2=B1  2%  softirqs.CPU29.RCU
> >      80084           -37.1%      50390 =C2=B1  6%  softirqs.CPU3.RCU
> >      78968           -38.9%      48279 =C2=B1  3%  softirqs.CPU30.RCU
> >      78160           -36.4%      49702 =C2=B1  2%  softirqs.CPU31.RCU
> >      79331           -39.2%      48212 =C2=B1  3%  softirqs.CPU32.RCU
> >      79528           -38.8%      48692 =C2=B1  3%  softirqs.CPU33.RCU
> >      79594           -38.2%      49159 =C2=B1  3%  softirqs.CPU34.RCU
> >      79420           -39.2%      48307 =C2=B1  4%  softirqs.CPU35.RCU
> >      78110           -34.9%      50888        softirqs.CPU36.RCU
> >      79064           -34.9%      51440 =C2=B1  7%  softirqs.CPU37.RCU
> >      78142           -36.9%      49281 =C2=B1  7%  softirqs.CPU38.RCU
> >      79441           -38.3%      49001 =C2=B1  4%  softirqs.CPU39.RCU
> >      79427           -36.4%      50526 =C2=B1  2%  softirqs.CPU4.RCU
> >      78010           -36.3%      49683 =C2=B1  8%  softirqs.CPU40.RCU
> >      79556           -38.2%      49173 =C2=B1  3%  softirqs.CPU41.RCU
> >      79054           -39.2%      48065 =C2=B1  3%  softirqs.CPU42.RCU
> >      79484           -39.0%      48510 =C2=B1  3%  softirqs.CPU43.RCU
> >      79119           -36.8%      50014 =C2=B1  4%  softirqs.CPU44.RCU
> >      79095           -38.8%      48375 =C2=B1  4%  softirqs.CPU45.RCU
> >      78723           -39.3%      47761 =C2=B1  3%  softirqs.CPU46.RCU
> >      80129 =C2=B1  2%     -34.4%      52542 =C2=B1  7%  softirqs.CPU47.=
RCU
> >      78762           -36.4%      50124 =C2=B1  6%  softirqs.CPU48.RCU
> >      79464           -38.2%      49083 =C2=B1  2%  softirqs.CPU49.RCU
> >      78245           -37.1%      49184 =C2=B1  2%  softirqs.CPU5.RCU
> >      78326           -36.2%      49972 =C2=B1  4%  softirqs.CPU50.RCU
> >      80007           -35.4%      51689 =C2=B1  8%  softirqs.CPU51.RCU
> >      79011           -36.7%      50020 =C2=B1  3%  softirqs.CPU52.RCU
> >      78986           -39.5%      47794        softirqs.CPU53.RCU
> >      78679           -35.8%      50491 =C2=B1  5%  softirqs.CPU54.RCU
> >      78852 =C2=B1  3%     -38.9%      48186 =C2=B1  2%  softirqs.CPU55.=
RCU
> >      78554           -35.8%      50445 =C2=B1  4%  softirqs.CPU56.RCU
> >      78992           -37.1%      49673 =C2=B1  2%  softirqs.CPU57.RCU
> >      79223 =C2=B1  2%     -38.4%      48841 =C2=B1  2%  softirqs.CPU58.=
RCU
> >      79503 =C2=B1  3%     -36.6%      50406 =C2=B1  4%  softirqs.CPU59.=
RCU
> >      78448           -37.4%      49141 =C2=B1  2%  softirqs.CPU6.RCU
> >      79727 =C2=B1  3%     -38.3%      49180 =C2=B1  5%  softirqs.CPU60.=
RCU
> >      78422           -37.7%      48848 =C2=B1  3%  softirqs.CPU61.RCU
> >      78695           -33.8%      52111 =C2=B1  7%  softirqs.CPU62.RCU
> >      79143           -35.9%      50747 =C2=B1  5%  softirqs.CPU63.RCU
> >      80073 =C2=B1  3%     -34.1%      52786 =C2=B1  4%  softirqs.CPU64.=
RCU
> >      79321           -36.4%      50483 =C2=B1  4%  softirqs.CPU65.RCU
> >      79962 =C2=B1  2%     -38.1%      49469 =C2=B1  5%  softirqs.CPU66.=
RCU
> >      78647           -36.5%      49963 =C2=B1  3%  softirqs.CPU67.RCU
> >      77809 =C2=B1  2%     -36.9%      49124        softirqs.CPU68.RCU
> >      78901 =C2=B1  2%     -37.3%      49503 =C2=B1  4%  softirqs.CPU69.=
RCU
> >      79087           -35.4%      51107 =C2=B1  4%  softirqs.CPU7.RCU
> >      78778           -36.1%      50344 =C2=B1  5%  softirqs.CPU70.RCU
> >      79681           -38.3%      49136 =C2=B1  2%  softirqs.CPU71.RCU
> >      78743           -37.7%      49020 =C2=B1  3%  softirqs.CPU72.RCU
> >      80765           -40.0%      48482 =C2=B1  3%  softirqs.CPU73.RCU
> >      79003           -38.1%      48885 =C2=B1  3%  softirqs.CPU74.RCU
> >      80610 =C2=B1  4%     -40.0%      48347 =C2=B1  2%  softirqs.CPU75.=
RCU
> >      78991           -37.9%      49084 =C2=B1  3%  softirqs.CPU76.RCU
> >      78655           -38.2%      48573 =C2=B1  3%  softirqs.CPU77.RCU
> >      79120           -38.9%      48305 =C2=B1  2%  softirqs.CPU78.RCU
> >      78639           -35.2%      50993 =C2=B1  5%  softirqs.CPU79.RCU
> >      77965           -34.9%      50790 =C2=B1  3%  softirqs.CPU8.RCU
> >      79147           -38.1%      49016 =C2=B1  5%  softirqs.CPU80.RCU
> >      79784           -40.1%      47792 =C2=B1  3%  softirqs.CPU81.RCU
> >      80938 =C2=B1  2%     -39.9%      48663 =C2=B1  4%  softirqs.CPU82.=
RCU
> >      79033           -39.1%      48123 =C2=B1  3%  softirqs.CPU83.RCU
> >      78385           -36.8%      49534 =C2=B1  7%  softirqs.CPU84.RCU
> >      79075           -37.8%      49196 =C2=B1  3%  softirqs.CPU85.RCU
> >      79195           -39.7%      47772 =C2=B1  3%  softirqs.CPU86.RCU
> >      79184           -38.4%      48782 =C2=B1  4%  softirqs.CPU87.RCU
> >      78546           -39.4%      47629 =C2=B1  4%  softirqs.CPU88.RCU
> >      78837           -38.9%      48201 =C2=B1  3%  softirqs.CPU89.RCU
> >      78839           -38.1%      48785 =C2=B1  2%  softirqs.CPU9.RCU
> >      79123           -39.9%      47586 =C2=B1  3%  softirqs.CPU90.RCU
> >      78551           -37.0%      49461 =C2=B1  4%  softirqs.CPU91.RCU
> >      78917           -39.5%      47763 =C2=B1  2%  softirqs.CPU92.RCU
> >      78341           -38.9%      47861 =C2=B1  2%  softirqs.CPU93.RCU
> >      78429           -39.2%      47718        softirqs.CPU94.RCU
> >      79007           -35.1%      51272 =C2=B1  3%  softirqs.CPU95.RCU
> >    7595837           -37.3%    4763370 =C2=B1  2%  softirqs.RCU
> >      38.14           -38.1        0.00        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.__lru_cache_add.add_to_p=
age_cache_lru.pagecache_get_page
> >      38.09           -38.1        0.00        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.pagevec_lru=
_move_fn.__lru_cache_add.add_to_page_cache_lru
> >      37.66           -37.7        0.00        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.release_pages.__pagevec_release.truncate_ino=
de_pages_range.evict
> >      37.59           -37.6        0.00        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.release_pag=
es.__pagevec_release.truncate_inode_pages_range
> >      42.79           -35.0        7.77        perf-profile.calltrace.cy=
cles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >      42.79           -35.0        7.77        perf-profile.calltrace.cy=
cles-pp.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
> >      42.79           -35.0        7.77        perf-profile.calltrace.cy=
cles-pp.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
> >      42.78           -35.0        7.76        perf-profile.calltrace.cy=
cles-pp.__dentry_kill.dput.__fput.task_work_run.exit_to_usermode_loop
> >      42.78           -35.0        7.77        perf-profile.calltrace.cy=
cles-pp.dput.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64
> >      42.77           -35.0        7.76        perf-profile.calltrace.cy=
cles-pp.evict.__dentry_kill.dput.__fput.task_work_run
> >      42.76           -35.0        7.76        perf-profile.calltrace.cy=
cles-pp.truncate_inode_pages_range.evict.__dentry_kill.dput.__fput
> >      40.05           -33.5        6.56        perf-profile.calltrace.cy=
cles-pp.release_pages.__pagevec_release.truncate_inode_pages_range.evict.__=
dentry_kill
> >      40.51           -33.4        7.09        perf-profile.calltrace.cy=
cles-pp.__pagevec_release.truncate_inode_pages_range.evict.__dentry_kill.dp=
ut
> >       3.12 =C2=B1  2%      -2.2        0.92        perf-profile.calltra=
ce.cycles-pp.iov_iter_copy_from_user_atomic.generic_perform_write.__generic=
_file_write_iter.generic_file_write_iter.new_sync_write
> >       2.17            -1.5        0.64        perf-profile.calltrace.cy=
cles-pp.copyin.iov_iter_copy_from_user_atomic.generic_perform_write.__gener=
ic_file_write_iter.generic_file_write_iter
> >       2.09            -1.5        0.62        perf-profile.calltrace.cy=
cles-pp.copy_user_enhanced_fast_string.copyin.iov_iter_copy_from_user_atomi=
c.generic_perform_write.__generic_file_write_iter
> >       1.13            -0.2        0.91        perf-profile.calltrace.cy=
cles-pp.__pagevec_lru_add_fn.pagevec_lru_move_fn.__lru_cache_add.add_to_pag=
e_cache_lru.pagecache_get_page
> >      99.16            +0.4       99.58        perf-profile.calltrace.cy=
cles-pp.entry_SYSCALL_64_after_hwframe
> >      99.05            +0.5       99.54        perf-profile.calltrace.cy=
cles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.00            +0.5        0.51        perf-profile.calltrace.cy=
cles-pp.lock_page_lruvec_irqsave.pagevec_lru_move_fn.lru_add_drain_cpu.__pa=
gevec_release.truncate_inode_pages_range
> >       0.00            +0.5        0.51        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.lock_page_lruvec_irqsave.pagevec_lru_move_fn=
.lru_add_drain_cpu.__pagevec_release
> >       0.00            +0.5        0.52        perf-profile.calltrace.cy=
cles-pp.pagevec_lru_move_fn.lru_add_drain_cpu.__pagevec_release.truncate_in=
ode_pages_range.evict
> >       0.00            +0.5        0.52        perf-profile.calltrace.cy=
cles-pp.lru_add_drain_cpu.__pagevec_release.truncate_inode_pages_range.evic=
t.__dentry_kill
> >       0.00            +5.8        5.77        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.lock_page_l=
ruvec_irqsave.release_pages.__pagevec_release
> >       0.00            +5.8        5.78        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.lock_page_lruvec_irqsave.release_pages.__pag=
evec_release.truncate_inode_pages_range
> >       0.00            +5.8        5.78        perf-profile.calltrace.cy=
cles-pp.lock_page_lruvec_irqsave.release_pages.__pagevec_release.truncate_i=
node_pages_range.evict
> >      55.66           +35.9       91.56        perf-profile.calltrace.cy=
cles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >      55.53           +36.0       91.52        perf-profile.calltrace.cy=
cles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >      54.89           +36.4       91.32        perf-profile.calltrace.cy=
cles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
> >      54.79           +36.5       91.28        perf-profile.calltrace.cy=
cles-pp.generic_file_write_iter.new_sync_write.vfs_write.ksys_write.do_sysc=
all_64
> >      54.42           +36.7       91.16        perf-profile.calltrace.cy=
cles-pp.__generic_file_write_iter.generic_file_write_iter.new_sync_write.vf=
s_write.ksys_write
> >      53.78           +37.2       90.95        perf-profile.calltrace.cy=
cles-pp.generic_perform_write.__generic_file_write_iter.generic_file_write_=
iter.new_sync_write.vfs_write
> >      48.54           +40.9       89.40        perf-profile.calltrace.cy=
cles-pp.simple_write_begin.generic_perform_write.__generic_file_write_iter.=
generic_file_write_iter.new_sync_write
> >      43.71           +44.3       87.98        perf-profile.calltrace.cy=
cles-pp.grab_cache_page_write_begin.simple_write_begin.generic_perform_writ=
e.__generic_file_write_iter.generic_file_write_iter
> >      43.66           +44.3       87.96        perf-profile.calltrace.cy=
cles-pp.pagecache_get_page.grab_cache_page_write_begin.simple_write_begin.g=
eneric_perform_write.__generic_file_write_iter
> >      41.33           +46.0       87.31        perf-profile.calltrace.cy=
cles-pp.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_write_begi=
n.simple_write_begin.generic_perform_write
> >      39.91           +47.0       86.88        perf-profile.calltrace.cy=
cles-pp.__lru_cache_add.add_to_page_cache_lru.pagecache_get_page.grab_cache=
_page_write_begin.simple_write_begin
> >      39.79           +47.0       86.83        perf-profile.calltrace.cy=
cles-pp.pagevec_lru_move_fn.__lru_cache_add.add_to_page_cache_lru.pagecache=
_get_page.grab_cache_page_write_begin
> >       0.00           +84.9       84.94        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.lock_page_l=
ruvec_irqsave.pagevec_lru_move_fn.__lru_cache_add
> >       0.00           +85.4       85.36        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.lock_page_lruvec_irqsave.pagevec_lru_move_fn=
.__lru_cache_add.add_to_page_cache_lru
> >       0.00           +85.4       85.42        perf-profile.calltrace.cy=
cles-pp.lock_page_lruvec_irqsave.pagevec_lru_move_fn.__lru_cache_add.add_to=
_page_cache_lru.pagecache_get_page
> >      42.79           -35.0        7.77        perf-profile.children.cyc=
les-pp.exit_to_usermode_loop
> >      42.79           -35.0        7.77        perf-profile.children.cyc=
les-pp.task_work_run
> >      42.79           -35.0        7.77        perf-profile.children.cyc=
les-pp.__fput
> >      42.78           -35.0        7.77        perf-profile.children.cyc=
les-pp.dput
> >      42.78           -35.0        7.76        perf-profile.children.cyc=
les-pp.__dentry_kill
> >      42.77           -35.0        7.76        perf-profile.children.cyc=
les-pp.evict
> >      42.77           -35.0        7.76        perf-profile.children.cyc=
les-pp.truncate_inode_pages_range
> >      40.24           -33.5        6.71        perf-profile.children.cyc=
les-pp.release_pages
> >      40.51           -33.4        7.09        perf-profile.children.cyc=
les-pp.__pagevec_release
> >       3.13            -2.2        0.93        perf-profile.children.cyc=
les-pp.iov_iter_copy_from_user_atomic
> >       2.20            -1.5        0.65        perf-profile.children.cyc=
les-pp.copyin
> >       2.12            -1.5        0.63        perf-profile.children.cyc=
les-pp.copy_user_enhanced_fast_string
> >       1.76            -1.3        0.47        perf-profile.children.cyc=
les-pp.__alloc_pages_nodemask
> >       1.64            -1.2        0.48        perf-profile.children.cyc=
les-pp.simple_write_end
> >       1.49            -1.1        0.39 =C2=B1  2%  perf-profile.childre=
n.cycles-pp.get_page_from_freelist
> >       1.25            -1.0        0.25        perf-profile.children.cyc=
les-pp.free_unref_page_list
> >       1.36            -0.9        0.41 =C2=B1  3%  perf-profile.childre=
n.cycles-pp.__add_to_page_cache_locked
> >       1.12            -0.8        0.32 =C2=B1  2%  perf-profile.childre=
n.cycles-pp.delete_from_page_cache_batch
> >       0.94            -0.8        0.17 =C2=B1  4%  perf-profile.childre=
n.cycles-pp.free_pcppages_bulk
> >       0.83            -0.6        0.24 =C2=B1  3%  perf-profile.childre=
n.cycles-pp.xas_store
> >       0.70            -0.4        0.27        perf-profile.children.cyc=
les-pp.__list_del_entry_valid
> >       0.65            -0.4        0.21        perf-profile.children.cyc=
les-pp.pagevec_lookup_entries
> >       0.65            -0.4        0.21        perf-profile.children.cyc=
les-pp.find_get_entries
> >       0.48 =C2=B1  2%      -0.3        0.15 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.xas_load
> >       0.41            -0.3        0.13 =C2=B1  3%  perf-profile.childre=
n.cycles-pp.syscall_return_via_sysret
> >       0.39 =C2=B1  2%      -0.3        0.12 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.find_get_entry
> >       1.16            -0.2        0.92        perf-profile.children.cyc=
les-pp.__pagevec_lru_add_fn
> >       0.34            -0.2        0.11 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.mem_cgroup_commit_charge
> >       0.28 =C2=B1  2%      -0.2        0.09 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__mod_memcg_state
> >       0.34 =C2=B1  2%      -0.2        0.15 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__mod_lruvec_state
> >       0.28            -0.2        0.09 =C2=B1  4%  perf-profile.childre=
n.cycles-pp.ksys_lseek
> >       0.26            -0.2        0.08 =C2=B1  5%  perf-profile.childre=
n.cycles-pp.___might_sleep
> >       0.24 =C2=B1  3%      -0.2        0.07        perf-profile.childre=
n.cycles-pp.truncate_cleanup_page
> >       0.21            -0.2        0.05 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.unaccount_page_cache_page
> >       0.23 =C2=B1  2%      -0.2        0.08        perf-profile.childre=
n.cycles-pp.file_remove_privs
> >       0.21 =C2=B1  2%      -0.2        0.06 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.mem_cgroup_charge_statistics
> >       0.21            -0.1        0.06        perf-profile.children.cyc=
les-pp.xas_init_marks
> >       0.21            -0.1        0.07 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.entry_SYSCALL_64
> >       0.21 =C2=B1  3%      -0.1        0.07        perf-profile.childre=
n.cycles-pp.iov_iter_fault_in_readable
> >       0.19 =C2=B1  3%      -0.1        0.05        perf-profile.childre=
n.cycles-pp.__mod_node_page_state
> >       0.22            -0.1        0.08 =C2=B1  5%  perf-profile.childre=
n.cycles-pp.security_file_permission
> >       0.19 =C2=B1  2%      -0.1        0.06 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.mem_cgroup_uncharge_list
> >       0.20            -0.1        0.07 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.__fdget_pos
> >       0.15 =C2=B1  5%      -0.1        0.03 =C2=B1100%  perf-profile.ch=
ildren.cycles-pp.rcu_core
> >       0.15 =C2=B1  9%      -0.1        0.04 =C2=B1 57%  perf-profile.ch=
ildren.cycles-pp.mem_cgroup_try_charge
> >       0.16 =C2=B1  2%      -0.1        0.05 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__fget_light
> >       0.17 =C2=B1  4%      -0.1        0.06        perf-profile.childre=
n.cycles-pp.__softirqentry_text_start
> >       0.16            -0.1        0.05 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.file_update_time
> >       0.17 =C2=B1  3%      -0.1        0.06        perf-profile.childre=
n.cycles-pp.dentry_needs_remove_privs
> >       0.15 =C2=B1  2%      -0.1        0.05        perf-profile.childre=
n.cycles-pp.down_write
> >       0.14 =C2=B1  3%      -0.1        0.04 =C2=B1 57%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_irq
> >       0.14 =C2=B1  3%      -0.1        0.04 =C2=B1 57%  perf-profile.ch=
ildren.cycles-pp.security_inode_need_killpriv
> >       0.15            -0.1        0.06        perf-profile.children.cyc=
les-pp.common_file_perm
> >       0.34 =C2=B1  2%      -0.1        0.27        perf-profile.childre=
n.cycles-pp.smp_apic_timer_interrupt
> >       0.40            -0.1        0.34 =C2=B1  2%  perf-profile.childre=
n.cycles-pp.apic_timer_interrupt
> >       0.26 =C2=B1  4%      -0.0        0.21 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.hrtimer_interrupt
> >       0.18 =C2=B1  4%      -0.0        0.14        perf-profile.childre=
n.cycles-pp.__hrtimer_run_queues
> >       0.14 =C2=B1  7%      -0.0        0.10 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.tick_sched_timer
> >       0.12 =C2=B1  8%      -0.0        0.09        perf-profile.childre=
n.cycles-pp.tick_sched_handle
> >       0.12 =C2=B1  5%      -0.0        0.09 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.update_process_times
> >       0.11 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.mem_cgroup_page_lruvec
> >       0.08            -0.0        0.05        perf-profile.children.cyc=
les-pp.irq_exit
> >       0.08 =C2=B1  8%      -0.0        0.06 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.task_tick_fair
> >       0.09 =C2=B1  7%      -0.0        0.07 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.scheduler_tick
> >       0.11            +0.0        0.12 =C2=B1  3%  perf-profile.childre=
n.cycles-pp.mem_cgroup_update_lru_size
> >       0.15 =C2=B1  2%      +0.0        0.19 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__list_add_valid
> >       0.46            +0.1        0.54        perf-profile.children.cyc=
les-pp.lru_add_drain_cpu
> >       0.00            +0.1        0.12        perf-profile.children.cyc=
les-pp.shmem_write_begin
> >       0.00            +0.1        0.12        perf-profile.children.cyc=
les-pp.shmem_getpage_gfp
> >       0.00            +0.1        0.13        perf-profile.children.cyc=
les-pp.__libc_start_main
> >       0.00            +0.1        0.13        perf-profile.children.cyc=
les-pp.main
> >       0.00            +0.1        0.13        perf-profile.children.cyc=
les-pp.cmd_record
> >       0.00            +0.1        0.13        perf-profile.children.cyc=
les-pp.perf_mmap__push
> >       0.00            +0.1        0.13        perf-profile.children.cyc=
les-pp.__GI___libc_write
> >      99.21            +0.5       99.73        perf-profile.children.cyc=
les-pp.entry_SYSCALL_64_after_hwframe
> >      99.11            +0.6       99.69        perf-profile.children.cyc=
les-pp.do_syscall_64
> >      76.75           +14.7       91.41        perf-profile.children.cyc=
les-pp.native_queued_spin_lock_slowpath
> >      76.30           +15.5       91.82        perf-profile.children.cyc=
les-pp._raw_spin_lock_irqsave
> >      55.69           +36.0       91.69        perf-profile.children.cyc=
les-pp.ksys_write
> >      55.55           +36.1       91.65        perf-profile.children.cyc=
les-pp.vfs_write
> >      54.92           +36.5       91.45        perf-profile.children.cyc=
les-pp.new_sync_write
> >      54.82           +36.6       91.41        perf-profile.children.cyc=
les-pp.generic_file_write_iter
> >      54.45           +36.8       91.29        perf-profile.children.cyc=
les-pp.__generic_file_write_iter
> >      54.00           +37.1       91.13        perf-profile.children.cyc=
les-pp.generic_perform_write
> >      48.56           +40.8       89.40        perf-profile.children.cyc=
les-pp.simple_write_begin
> >      43.72           +44.3       87.98        perf-profile.children.cyc=
les-pp.grab_cache_page_write_begin
> >      43.67           +44.3       87.96        perf-profile.children.cyc=
les-pp.pagecache_get_page
> >      41.33           +46.0       87.31        perf-profile.children.cyc=
les-pp.add_to_page_cache_lru
> >      39.93           +47.1       87.01        perf-profile.children.cyc=
les-pp.__lru_cache_add
> >      40.27           +47.2       87.51        perf-profile.children.cyc=
les-pp.pagevec_lru_move_fn
> >       0.00           +91.9       91.87        perf-profile.children.cyc=
les-pp.lock_page_lruvec_irqsave
> >       4.82            -3.4        1.41        perf-profile.self.cycles-=
pp.simple_write_begin
> >       2.09            -1.5        0.62        perf-profile.self.cycles-=
pp.copy_user_enhanced_fast_string
> >       1.40            -1.0        0.41        perf-profile.self.cycles-=
pp.simple_write_end
> >       0.76 =C2=B1  3%      -0.5        0.23        perf-profile.self.cy=
cles-pp.iov_iter_copy_from_user_atomic
> >       0.70 =C2=B1  2%      -0.4        0.27        perf-profile.self.cy=
cles-pp.__list_del_entry_valid
> >       0.61            -0.4        0.19 =C2=B1  2%  perf-profile.self.cy=
cles-pp.get_page_from_freelist
> >       0.58            -0.4        0.19 =C2=B1  2%  perf-profile.self.cy=
cles-pp.find_get_entries
> >       0.48            -0.4        0.12 =C2=B1  4%  perf-profile.self.cy=
cles-pp.free_pcppages_bulk
> >       0.41            -0.3        0.13        perf-profile.self.cycles-=
pp.syscall_return_via_sysret
> >       0.39            -0.3        0.11 =C2=B1  6%  perf-profile.self.cy=
cles-pp.xas_store
> >       0.39            -0.3        0.11 =C2=B1  4%  perf-profile.self.cy=
cles-pp.generic_perform_write
> >       0.36            -0.2        0.11 =C2=B1  4%  perf-profile.self.cy=
cles-pp.xas_load
> >       0.76            -0.2        0.54 =C2=B1  2%  perf-profile.self.cy=
cles-pp.__pagevec_lru_add_fn
> >       0.60            -0.2        0.39        perf-profile.self.cycles-=
pp.release_pages
> >       0.27            -0.2        0.09 =C2=B1  5%  perf-profile.self.cy=
cles-pp.__mod_memcg_state
> >       0.27 =C2=B1  3%      -0.2        0.08 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.__add_to_page_cache_locked
> >       0.25 =C2=B1  2%      -0.2        0.08 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.___might_sleep
> >       0.24            -0.2        0.07        perf-profile.self.cycles-=
pp.delete_from_page_cache_batch
> >       0.21            -0.1        0.07 =C2=B1  7%  perf-profile.self.cy=
cles-pp.entry_SYSCALL_64
> >       0.21 =C2=B1  3%      -0.1        0.07        perf-profile.self.cy=
cles-pp.iov_iter_fault_in_readable
> >       0.18 =C2=B1  4%      -0.1        0.05        perf-profile.self.cy=
cles-pp.__mod_node_page_state
> >       0.16 =C2=B1  2%      -0.1        0.04 =C2=B1 57%  perf-profile.se=
lf.cycles-pp.truncate_inode_pages_range
> >       0.15 =C2=B1  2%      -0.1        0.05        perf-profile.self.cy=
cles-pp.__alloc_pages_nodemask
> >       0.15 =C2=B1  2%      -0.1        0.05        perf-profile.self.cy=
cles-pp.__fget_light
> >       0.11 =C2=B1  6%      -0.1        0.03 =C2=B1100%  perf-profile.se=
lf.cycles-pp.do_syscall_64
> >       0.12 =C2=B1  3%      -0.1        0.05        perf-profile.self.cy=
cles-pp.common_file_perm
> >       0.10 =C2=B1  4%      -0.0        0.07        perf-profile.self.cy=
cles-pp.__mod_lruvec_state
> >       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.mem_cgroup_page_lruvec
> >       0.11 =C2=B1  4%      +0.0        0.12        perf-profile.self.cy=
cles-pp.mem_cgroup_update_lru_size
> >       0.07 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.se=
lf.cycles-pp._raw_spin_unlock_irqrestore
> >       0.14            +0.0        0.18 =C2=B1  3%  perf-profile.self.cy=
cles-pp.__list_add_valid
> >       0.13            +0.3        0.44 =C2=B1  3%  perf-profile.self.cy=
cles-pp._raw_spin_lock_irqsave
> >      76.75           +14.7       91.41        perf-profile.self.cycles-=
pp.native_queued_spin_lock_slowpath
> > =

> > =

> >                                                                        =
         =

> >                                    stress-ng.hdd.ops                   =
         =

> >                                                                        =
         =

> >     4e+07 +------------------------------------------------------------=
-----+   =

> >           |.+.+..+.+.+.+.+..+.+.+.+.+        +.+..+       +..+.+.      =
     |   =

> >   3.5e+07 |-+                       :        :    :       :      +.+.+.=
.+.+.|   =

> >     3e+07 |-O    O   O O O    O   O :  O O O : O  : O O O :            =
     |   =

> >           |                          :       :    :       :            =
     |   =

> >   2.5e+07 |-+                        :      :      :     :             =
     |   =

> >           |                          :      :      :     :             =
     |   =

> >     2e+07 |-+                        :      :      :     :             =
     |   =

> >           |                           :     :      :     :             =
     |   =

> >   1.5e+07 |-+                         :     :      :     :             =
     |   =

> >     1e+07 |-+                         :     :      :     :   O O O O O =
 O   |   =

> >           |                           :    :        :   :              =
     |   =

> >     5e+06 |-+                          :   :        :   :              =
     |   =

> >           |                            :   :        :   :              =
     |   =

> >         0 +------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                                stress-ng.hdd.ops_per_sec               =
         =

> >                                                                        =
         =

> >   1.4e+06 +------------------------------------------------------------=
-----+   =

> >           |                                                            =
     |   =

> >   1.2e+06 |.+.+..+.+.+.+.+..+.+.+.+.+        +.+..+       +..+.+.+.+.+.=
.+.+.|   =

> >           |          O O O    O   O :  O O O : O  : O O O :            =
     |   =

> >     1e+06 |-O    O                   :       :    :       :            =
     |   =

> >           |                          :       :     :      :            =
     |   =

> >    800000 |-+                        :      :      :     :             =
     |   =

> >           |                          :      :      :     :             =
     |   =

> >    600000 |-+                         :     :      :     :             =
     |   =

> >           |                           :     :      :     :             =
     |   =

> >    400000 |-+                         :     :      :     :   O O O O O =
 O   |   =

> >           |                           :     :       :    :             =
     |   =

> >    200000 |-+                          :   :        :   :              =
     |   =

> >           |                            :   :        :   :              =
     |   =

> >         0 +------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                                   stress-ng.revio.ops                  =
         =

> >                                                                        =
         =

> >   2.5e+08 +------------------------------------------------------------=
-----+   =

> >           |.+.+..+.+.+.+.+..+.+.+.+.+        +.+..+       +..+.+.      =
     |   =

> >           |                         :        :    :   O   :      +.+.+.=
.+.+.|   =

> >     2e+08 |-O    O   O O O    O   O :  O O O : O  : O   O :            =
     |   =

> >           |                          :       :    :       :            =
     |   =

> >           |                          :      :      :     :             =
     |   =

> >   1.5e+08 |-+                        :      :      :     :             =
     |   =

> >           |                          :      :      :     :             =
     |   =

> >     1e+08 |-+                         :     :      :     :             =
     |   =

> >           |                           :     :      :     :             =
     |   =

> >           |                           :     :      :     :   O O O O O =
 O   |   =

> >     5e+07 |-+                         :    :        :   :              =
     |   =

> >           |                            :   :        :   :              =
     |   =

> >           |                            :   :        :   :              =
     |   =

> >         0 +------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                              stress-ng.revio.ops_per_sec               =
         =

> >                                                                        =
         =

> >   8e+06 +--------------------------------------------------------------=
-----+   =

> >         |.+..+.+.+.+..+.+.+    +.+.+        +..+.+        +.+.+..+.+.+.=
+..+.|   =

> >   7e+06 |-O    O   O  O O   O    O : O  O O :  O : O O  O :            =
     |   =

> >   6e+06 |-+                        :        :    :        :            =
     |   =

> >         |                          :        :    :        :            =
     |   =

> >   5e+06 |-+                         :      :      :      :             =
     |   =

> >         |                           :      :      :      :             =
     |   =

> >   4e+06 |-+                         :      :      :      :             =
     |   =

> >         |                           :      :      :      :             =
     |   =

> >   3e+06 |-+                         :      :      :      :             =
     |   =

> >   2e+06 |-+                         :      :      :      :  O O  O O O =
O    |   =

> >         |                            :    :        :    :              =
     |   =

> >   1e+06 |-+                          :    :        :    :              =
     |   =

> >         |                            :    :        :    :              =
     |   =

> >       0 +--------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                                stress-ng.sync-file.ops                 =
         =

> >                                                                        =
         =

> >   40000 +--------------------------------------------------------------=
-----+   =

> >         |              .+.+.+..+.+.+        +..+.+        +.+.+..      =
     |   =

> >   35000 |.+..+.+.+.+..+            :        :    :        :      +.+.+.=
+..+.|   =

> >   30000 |-O    O   O  O O   O    O : O  O O :  O : O O  O :            =
     |   =

> >         |                          :        :    :        :            =
     |   =

> >   25000 |-+                         :      :      :      :             =
     |   =

> >         |                           :      :      :      :             =
     |   =

> >   20000 |-+                         :      :      :      :             =
     |   =

> >         |                           :      :      :      :             =
     |   =

> >   15000 |-+                         :      :      :      :             =
     |   =

> >   10000 |-+                         :      :      :      :  O O  O O O =
O    |   =

> >         |                            :    :        :    :              =
     |   =

> >    5000 |-+                          :    :        :    :              =
     |   =

> >         |                            :    :        :    :              =
     |   =

> >       0 +--------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
                                                                           =
              =

> >                           stress-ng.sync-file.ops_per_sec              =
         =

> >                                                                        =
         =

> >   1400 +---------------------------------------------------------------=
-----+   =

> >        |                                                               =
     |   =

> >   1200 |.+..+.+.+..+.+.+.+..+.+.+..+        +.+.+         +.+.+..      =
     |   =

> >        |           O O O    O   O  : O O  O : O :  O O O  :      +.+.+.=
+..+.|   =

> >   1000 |-O    O                    :        :    :        :            =
     |   =

> >        |                            :       :    :       :             =
     |   =

> >    800 |-+                          :      :     :       :             =
     |   =

> >        |                            :      :     :       :             =
     |   =

> >    600 |-+                          :      :      :      :             =
     |   =

> >        |                            :      :      :     :              =
     |   =

> >    400 |-+                          :      :      :     :              =
     |   =

> >        |                             :     :      :     :   O O  O O O =
O    |   =

> >    200 |-+                           :    :        :    :              =
     |   =

> >        |                             :    :        :   :               =
     |   =

> >      0 +---------------------------------------------------------------=
-----+   =

> >                                                                        =
         =

> >                                                                        =
         =

> > [*] bisect-good sample
> > [O] bisect-bad  sample
> > =

> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Rong Chen
> >=20
--===============8076430262763689861==--

