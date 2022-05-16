Content-Type: multipart/mixed; boundary="===============4126171154105686385=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [cgroup/cpuset] 7aaa45f837: kbuild.buildtime_per_iteration 2583.0% regression
Date: Sun, 15 May 2022 23:02:39 -0400
Message-ID: <daf56c43-feba-4075-1361-94b9a2dae15a@redhat.com>
In-Reply-To: <20220513063308.GA21013@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4126171154105686385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/13/22 02:33, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed a 2583.0% regression of kbuild.buildtime_per_iteration du=
e to commit:
>
>
> commit: 7aaa45f8374887d98cd479a6bdd3b4c74e6a981a ("[PATCH] cgroup/cpuset:=
 Remove redundant cpu/node masks setup in cpuset_init_smp()")
> url: https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/cgroup-cp=
uset-Remove-redundant-cpu-node-masks-setup-in-cpuset_init_smp/20220425-1011=
26
> base: https://git.kernel.org/cgit/linux/kernel/git/tj/cgroup.git for-next
> patch link: https://lore.kernel.org/linux-mm/20220425020926.1264611-1-lon=
gman(a)redhat.com

That link is the original v1 patch which is not correct. Is this the one =

that is being tested here?

I have sent out another patch which shouldn't cause this kind of problem.

Thanks,
Longman

>
> in testcase: kbuild
> on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2=
.10GHz with 128G memory
> with following parameters:
>
> 	memory.high: 90%
> 	memory.low: 50%
> 	memory.max: max
> 	pids.max: 10000
> 	runtime: 300s
> 	nr_task: 50%
> 	target: autoksyms_recursive
> 	cpufreq_governor: performance
> 	ucode: 0x500320a
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          sudo bin/lkp install job.yaml           # job file is attached i=
n this email
>          bin/lkp split-job --compatible job.yaml # generate the yaml file=
 for lkp run
>          sudo bin/lkp run generated-yaml-file
>
>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/memory.high/memory.low/memory.max/nr_ta=
sk/pids.max/rootfs/runtime/target/tbox_group/testcase/ucode:
>    gcc-11/performance/x86_64-rhel-8.3/90%/50%/max/50%/10000/debian-10.4-x=
86_64-20200603.cgz/300s/autoksyms_recursive/lkp-csl-2sp9/kbuild/0x500320a
>
> commit:
>    4ab93063c8 ("cgroup: Add test_cpucg_weight_underprovisioned() testcase=
")
>    7aaa45f837 ("cgroup/cpuset: Remove redundant cpu/node masks setup in c=
puset_init_smp()")
>
> 4ab93063c83a2478 7aaa45f8374887d98cd479a6bdd
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       44.43         +2583.0%       1192        kbuild.buildtime_per_itera=
tion
>      311.14          +283.0%       1191        kbuild.time.elapsed_time
>      311.14          +283.0%       1191        kbuild.time.elapsed_time.m=
ax
>      363486            -4.7%     346532        kbuild.time.involuntary_co=
ntext_switches
>        7528 =C2=B1  2%     -99.1%      68.00        kbuild.time.major_pag=
e_faults
>   3.854e+08           -85.7%   55047165        kbuild.time.minor_page_fau=
lts
>        2608           -96.4%      95.00        kbuild.time.percent_of_cpu=
_this_job_got
>        1361           -89.5%     142.46        kbuild.time.system_time
>        6756           -85.3%     991.32        kbuild.time.user_time
>     1763962           -84.6%     270814        kbuild.time.voluntary_cont=
ext_switches
>        7.00           -85.7%       1.00        kbuild.workload
>   1.886e+10          +439.9%  1.018e+11        cpuidle..time
>    40524113          +397.6%  2.016e+08 =C2=B1  9%  cpuidle..usage
>      352.84          +249.7%       1233        uptime.boot
>       22088          +378.4%     105677        uptime.idle
>       68.86           +28.8       97.63        mpstat.cpu.all.idle%
>        0.16 =C2=B1  3%      -0.1        0.08 =C2=B1  8%  mpstat.cpu.all.s=
oft%
>        5.23            -5.1        0.15        mpstat.cpu.all.sys%
>       24.48           -23.5        0.96        mpstat.cpu.all.usr%
>       68.83           +42.1%      97.83        vmstat.cpu.id
>       24.00          -100.0%       0.00        vmstat.cpu.us
>       26.00           +73.1%      45.00        vmstat.procs.r
>       17438           -88.3%       2045        vmstat.system.cs
>   1.749e+08           -70.6%   51378800        numa-numastat.node0.local_=
node
>    1.75e+08           -70.6%   51378813        numa-numastat.node0.numa_h=
it
>       50974 =C2=B1 50%    -100.0%      13.50 =C2=B1 75%  numa-numastat.no=
de0.other_node
>    1.75e+08          -100.0%      82.83 =C2=B1223%  numa-numastat.node1.l=
ocal_node
>    1.75e+08          -100.0%      79394        numa-numastat.node1.numa_h=
it
>       28316 =C2=B1 91%    +180.1%      79311        numa-numastat.node1.o=
ther_node
>        6700 =C2=B1  4%     +69.9%      11385 =C2=B1  3%  meminfo.Active
>        6540 =C2=B1  4%     +69.1%      11063        meminfo.Active(anon)
>      223421           +31.7%     294262 =C2=B1  2%  meminfo.AnonHugePages
>     1300267           +31.4%    1708081        meminfo.AnonPages
>     1576268           +25.7%    1981479        meminfo.Committed_AS
>     1338713           +28.5%    1719792        meminfo.Inactive
>     1338565           +28.4%    1719004        meminfo.Inactive(anon)
>       18332           -11.0%      16310        meminfo.KernelStack
>       93129           -43.8%      52361        meminfo.Mapped
>       14656 =C2=B1  2%      -8.9%      13355        meminfo.PageTables
>       43576 =C2=B1  3%     -52.0%      20896        meminfo.Shmem
>     7581989           -10.5%    6785067        meminfo.max_used_kB
>      875.33          -100.0%       0.00        turbostat.Avg_MHz
>       31.74           -31.7        0.00        turbostat.Busy%
>        2764          -100.0%       0.00        turbostat.Bzy_MHz
>      173892 =C2=B1 10%    -100.0%       0.00        turbostat.C1
>        0.02 =C2=B1 17%      -0.0        0.00        turbostat.C1%
>    33508125 =C2=B1 20%    -100.0%       0.00        turbostat.C1E
>       48.18 =C2=B1 44%     -48.2        0.00        turbostat.C1E%
>     6776884 =C2=B1102%    -100.0%       0.00        turbostat.C6
>       20.30 =C2=B1104%     -20.3        0.00        turbostat.C6%
>       66.40 =C2=B1  4%    -100.0%       0.00        turbostat.CPU%c1
>        1.86 =C2=B1139%    -100.0%       0.00        turbostat.CPU%c6
>       59.17          -100.0%       0.00        turbostat.CoreTmp
>        0.33          -100.0%       0.00        turbostat.IPC
>    55232878          -100.0%       0.00        turbostat.IRQ
>       56380 =C2=B1  6%    -100.0%       0.00        turbostat.POLL
>       59.00          -100.0%       0.00        turbostat.PkgTmp
>      215.76          -100.0%       0.00        turbostat.PkgWatt
>       16.16          -100.0%       0.00        turbostat.RAMWatt
>        2095          -100.0%       0.00        turbostat.TSC_MHz
>      813.00 =C2=B1 11%    +237.1%       2740        numa-vmstat.node0.nr_=
active_anon
>      183776          +131.6%     425651        numa-vmstat.node0.nr_anon_=
pages
>      186417          +129.7%     428211        numa-vmstat.node0.nr_inact=
ive_anon
>        1978           +68.0%       3324        numa-vmstat.node0.nr_page_=
table_pages
>        3282 =C2=B1  7%     +53.1%       5023        numa-vmstat.node0.nr_=
shmem
>      813.00 =C2=B1 11%    +237.1%       2740        numa-vmstat.node0.nr_=
zone_active_anon
>      186416          +129.7%     428211        numa-vmstat.node0.nr_zone_=
inactive_anon
>    1.75e+08           -70.6%   51378302        numa-vmstat.node0.numa_hit
>   1.749e+08           -70.6%   51378288        numa-vmstat.node0.numa_loc=
al
>       50973 =C2=B1 50%    -100.0%      13.50 =C2=B1 75%  numa-vmstat.node=
0.numa_other
>      823.33 =C2=B1  5%     -97.5%      20.33 =C2=B1 12%  numa-vmstat.node=
1.nr_active_anon
>      139750 =C2=B1  2%     -99.9%      88.17 =C2=B1114%  numa-vmstat.node=
1.nr_anon_pages
>      157716 =C2=B1183%     -97.6%       3733 =C2=B1208%  numa-vmstat.node=
1.nr_file_pages
>      146649 =C2=B1  2%     -99.8%     265.00 =C2=B1 56%  numa-vmstat.node=
1.nr_inactive_anon
>        8288 =C2=B1  4%     -31.8%       5653 =C2=B1  5%  numa-vmstat.node=
1.nr_kernel_stack
>        8789 =C2=B1 47%     -99.6%      32.00 =C2=B1120%  numa-vmstat.node=
1.nr_mapped
>        1658           -99.8%       4.00 =C2=B1 73%  numa-vmstat.node1.nr_=
page_table_pages
>        7610 =C2=B1  3%     -97.4%     197.17 =C2=B1 27%  numa-vmstat.node=
1.nr_shmem
>       11225 =C2=B1101%     -74.3%       2883 =C2=B1  9%  numa-vmstat.node=
1.nr_slab_reclaimable
>       20034 =C2=B1  3%     -25.8%      14861 =C2=B1  4%  numa-vmstat.node=
1.nr_slab_unreclaimable
>      823.33 =C2=B1  5%     -97.5%      20.33 =C2=B1 12%  numa-vmstat.node=
1.nr_zone_active_anon
>      146648 =C2=B1  2%     -99.8%     265.00 =C2=B1 56%  numa-vmstat.node=
1.nr_zone_inactive_anon
>    1.75e+08          -100.0%      79394        numa-vmstat.node1.numa_hit
>    1.75e+08          -100.0%      82.83 =C2=B1223%  numa-vmstat.node1.num=
a_local
>       28312 =C2=B1 91%    +180.1%      79311        numa-vmstat.node1.num=
a_other
>        1642 =C2=B1  4%     +68.3%       2763        proc-vmstat.nr_active=
_anon
>      322313           +32.5%     427139        proc-vmstat.nr_anon_pages
>      864421            -1.5%     851593        proc-vmstat.nr_file_pages
>      332108           +29.4%     429879        proc-vmstat.nr_inactive_an=
on
>       18183           -10.3%      16310        proc-vmstat.nr_kernel_stack
>       23431           -43.6%      13208        proc-vmstat.nr_mapped
>        3550 =C2=B1  2%      -6.0%       3337        proc-vmstat.nr_page_t=
able_pages
>       11164 =C2=B1  3%     -53.2%       5223        proc-vmstat.nr_shmem
>       46151            -2.2%      45116        proc-vmstat.nr_slab_reclai=
mable
>       46770            -8.6%      42749        proc-vmstat.nr_slab_unrecl=
aimable
>        1642 =C2=B1  4%     +68.3%       2763        proc-vmstat.nr_zone_a=
ctive_anon
>      332108           +29.4%     429879        proc-vmstat.nr_zone_inacti=
ve_anon
>      360277 =C2=B1 30%     -99.8%     680.17 =C2=B1112%  proc-vmstat.numa=
_hint_faults
>      357678 =C2=B1 31%     -99.8%     680.17 =C2=B1112%  proc-vmstat.numa=
_hint_faults_local
>     3.5e+08           -85.3%   51462030        proc-vmstat.numa_hit
>   3.499e+08           -85.3%   51382705        proc-vmstat.numa_local
>       10372 =C2=B1129%    -100.0%       0.00        proc-vmstat.numa_page=
s_migrated
>      790289 =C2=B1 15%     -75.5%     193877 =C2=B1  7%  proc-vmstat.numa=
_pte_updates
>      290045           -86.1%      40379        proc-vmstat.pgactivate
>   3.498e+08           -85.3%   51462440        proc-vmstat.pgalloc_normal
>   3.871e+08           -85.1%   57578373        proc-vmstat.pgfault
>   3.497e+08           -85.3%   51397471        proc-vmstat.pgfree
>       10372 =C2=B1129%    -100.0%       0.00        proc-vmstat.pgmigrate=
_success
>     2920438           -78.6%     624274        proc-vmstat.pgreuse
>       18128           -85.7%       2594        proc-vmstat.thp_fault_alloc
>      771909           -85.7%     110390        proc-vmstat.unevictable_pg=
s_culled
>        3411 =C2=B1 11%    +226.2%      11127        numa-meminfo.node0.Ac=
tive
>        3251 =C2=B1 11%    +237.3%      10966        numa-meminfo.node0.Ac=
tive(anon)
>      188175 =C2=B1  6%     +56.0%     293523 =C2=B1  2%  numa-meminfo.nod=
e0.AnonHugePages
>      737315          +130.8%    1701834        numa-meminfo.node0.AnonPag=
es
>     1657848 =C2=B1  5%     +85.9%    3081876 =C2=B1  4%  numa-meminfo.nod=
e0.AnonPages.max
>      748023          +129.0%    1712859        numa-meminfo.node0.Inactive
>      747875          +128.9%    1712108        numa-meminfo.node0.Inactiv=
e(anon)
>     4306840 =C2=B1 28%     +35.6%    5839514        numa-meminfo.node0.Me=
mUsed
>        7772 =C2=B1  3%     +71.1%      13297        numa-meminfo.node0.Pa=
geTables
>       13182 =C2=B1  8%     +52.5%      20099        numa-meminfo.node0.Sh=
mem
>        3307 =C2=B1  5%     -92.7%     242.00 =C2=B1147%  numa-meminfo.nod=
e1.Active
>        3307 =C2=B1  5%     -97.5%      81.33 =C2=B1 12%  numa-meminfo.nod=
e1.Active(anon)
>       34918 =C2=B1 34%    -100.0%       0.00        numa-meminfo.node1.An=
onHugePages
>      557333 =C2=B1  2%     -99.9%     353.33 =C2=B1114%  numa-meminfo.nod=
e1.AnonPages
>     1876230 =C2=B1  3%    -100.0%     496.67 =C2=B1 96%  numa-meminfo.nod=
e1.AnonPages.max
>      631836 =C2=B1183%     -97.6%      14935 =C2=B1208%  numa-meminfo.nod=
e1.FilePages
>      586137 =C2=B1  2%     -99.8%       1096 =C2=B1 51%  numa-meminfo.nod=
e1.Inactive
>      586137 =C2=B1  2%     -99.8%       1061 =C2=B1 56%  numa-meminfo.nod=
e1.Inactive(anon)
>       44909 =C2=B1101%     -74.3%      11533 =C2=B1  9%  numa-meminfo.nod=
e1.KReclaimable
>        8244 =C2=B1  4%     -31.4%       5653 =C2=B1  5%  numa-meminfo.nod=
e1.KernelStack
>       35330 =C2=B1 46%     -99.6%     129.17 =C2=B1119%  numa-meminfo.nod=
e1.Mapped
>     1612958 =C2=B1 74%     -79.4%     333010 =C2=B1  7%  numa-meminfo.nod=
e1.MemUsed
>        6577           -99.8%      16.17 =C2=B1 73%  numa-meminfo.node1.Pa=
geTables
>       44909 =C2=B1101%     -74.3%      11533 =C2=B1  9%  numa-meminfo.nod=
e1.SReclaimable
>       80135 =C2=B1  3%     -25.8%      59446 =C2=B1  4%  numa-meminfo.nod=
e1.SUnreclaim
>       31315 =C2=B1  3%     -97.5%     789.17 =C2=B1 27%  numa-meminfo.nod=
e1.Shmem
>      125044 =C2=B1 38%     -43.2%      70980 =C2=B1  4%  numa-meminfo.nod=
e1.Slab
>   1.978e+10           -95.6%  8.797e+08        perf-stat.i.branch-instruc=
tions
>   5.616e+08           -95.6%   24754884 =C2=B1  8%  perf-stat.i.branch-mi=
sses
>   1.495e+08           -94.7%    7868663 =C2=B1  5%  perf-stat.i.cache-mis=
ses
>   6.176e+08           -94.5%   34193232 =C2=B1 36%  perf-stat.i.cache-ref=
erences
>       17499           -88.4%       2029        perf-stat.i.context-switch=
es
>        0.93 =C2=B1  3%     +36.6%       1.27 =C2=B1  5%  perf-stat.i.cpi
>   7.611e+10           -93.3%  5.121e+09 =C2=B1  4%  perf-stat.i.cpu-cycles
>        1275          -100.0%       0.04 =C2=B1 28%  perf-stat.i.cpu-migra=
tions
>        1029 =C2=B1  5%     -31.3%     707.28 =C2=B1  2%  perf-stat.i.cycl=
es-between-cache-misses
>    14172722           -94.1%     836284 =C2=B1 47%  perf-stat.i.dTLB-load=
-misses
>   2.503e+10           -95.5%  1.122e+09        perf-stat.i.dTLB-loads
>     7917427           -95.8%     332811 =C2=B1 15%  perf-stat.i.dTLB-stor=
e-misses
>   1.244e+10           -95.4%  5.666e+08        perf-stat.i.dTLB-stores
>    24631063           -92.3%    1894591 =C2=B1  2%  perf-stat.i.iTLB-load=
-misses
>    71323368           -94.9%    3665231 =C2=B1  6%  perf-stat.i.iTLB-loads
>   9.005e+10           -95.5%  4.054e+09        perf-stat.i.instructions
>        3571           -39.7%       2152        perf-stat.i.instructions-p=
er-iTLB-miss
>        1.10 =C2=B1  2%     -28.1%       0.79 =C2=B1  5%  perf-stat.i.ipc
>       24.38 =C2=B1  2%     -99.5%       0.11 =C2=B1 23%  perf-stat.i.majo=
r-faults
>        0.86           -93.3%       0.06 =C2=B1  4%  perf-stat.i.metric.GHz
>      658.74           -95.6%      29.19        perf-stat.i.metric.M/sec
>     1236978           -96.1%      48019        perf-stat.i.minor-faults
>       24.93 =C2=B1  5%     -18.7        6.26 =C2=B1 22%  perf-stat.i.node=
-load-miss-rate%
>     6765575           -97.4%     178075 =C2=B1 26%  perf-stat.i.node-load=
-misses
>    55797319           -94.4%    3120263        perf-stat.i.node-loads
>       18.32 =C2=B1  4%      -9.7        8.62 =C2=B1 22%  perf-stat.i.node=
-store-miss-rate%
>     1648658           -97.0%      50137 =C2=B1 26%  perf-stat.i.node-stor=
e-misses
>    11762943           -95.0%     585083        perf-stat.i.node-stores
>     1237003           -96.1%      48019        perf-stat.i.page-faults
>        6.86           +23.4%       8.46 =C2=B1 38%  perf-stat.overall.MPKI
>        0.85           +49.5%       1.26 =C2=B1  5%  perf-stat.overall.cpi
>      508.96           +27.9%     651.10        perf-stat.overall.cycles-b=
etween-cache-misses
>       25.67            +8.5       34.14 =C2=B1  3%  perf-stat.overall.iTL=
B-load-miss-rate%
>        3655           -41.4%       2140        perf-stat.overall.instruct=
ions-per-iTLB-miss
>        1.18           -32.9%       0.79 =C2=B1  5%  perf-stat.overall.ipc
>       10.82            -5.4        5.38 =C2=B1 24%  perf-stat.overall.nod=
e-load-miss-rate%
>       12.30            -4.4        7.85 =C2=B1 23%  perf-stat.overall.nod=
e-store-miss-rate%
>   4.002e+12           +20.6%  4.826e+12        perf-stat.overall.path-len=
gth
>   1.972e+10           -95.5%  8.791e+08        perf-stat.ps.branch-instru=
ctions
>   5.599e+08           -95.6%   24737459 =C2=B1  8%  perf-stat.ps.branch-m=
isses
>   1.491e+08           -94.7%    7862895 =C2=B1  5%  perf-stat.ps.cache-mi=
sses
>   6.158e+08           -94.5%   34168138 =C2=B1 36%  perf-stat.ps.cache-re=
ferences
>       17447           -88.4%       2027        perf-stat.ps.context-switc=
hes
>   7.588e+10           -93.3%  5.118e+09 =C2=B1  4%  perf-stat.ps.cpu-cycl=
es
>        1272          -100.0%       0.04 =C2=B1 28%  perf-stat.ps.cpu-migr=
ations
>    14129808           -94.1%     835661 =C2=B1 47%  perf-stat.ps.dTLB-loa=
d-misses
>   2.495e+10           -95.5%  1.121e+09        perf-stat.ps.dTLB-loads
>     7893270           -95.8%     332570 =C2=B1 15%  perf-stat.ps.dTLB-sto=
re-misses
>    1.24e+10           -95.4%  5.662e+08        perf-stat.ps.dTLB-stores
>    24556703           -92.3%    1893249 =C2=B1  2%  perf-stat.ps.iTLB-loa=
d-misses
>    71106326           -94.8%    3662587 =C2=B1  6%  perf-stat.ps.iTLB-loa=
ds
>   8.978e+10           -95.5%  4.051e+09        perf-stat.ps.instructions
>       24.32 =C2=B1  2%     -99.5%       0.11 =C2=B1 24%  perf-stat.ps.maj=
or-faults
>     1233214           -96.1%      47986        perf-stat.ps.minor-faults
>     6745825           -97.4%     177950 =C2=B1 26%  perf-stat.ps.node-loa=
d-misses
>    55627061           -94.4%    3117959        perf-stat.ps.node-loads
>     1644068           -97.0%      50102 =C2=B1 26%  perf-stat.ps.node-sto=
re-misses
>    11727184           -95.0%     584651        perf-stat.ps.node-stores
>     1233238           -96.1%      47986        perf-stat.ps.page-faults
>   2.802e+13           -82.8%  4.826e+12        perf-stat.total.instructio=
ns
>        0.39         +3586.3%      14.32 =C2=B1  4%  sched_debug.cfs_rq:/.=
h_nr_running.avg
>        1.11 =C2=B1  7%   +4138.2%      47.09        sched_debug.cfs_rq:/.=
h_nr_running.max
>        0.43         +4683.1%      20.72        sched_debug.cfs_rq:/.h_nr_=
running.stddev
>       14081 =C2=B1 20%   +2107.0%     310782 =C2=B1  4%  sched_debug.cfs_=
rq:/.load.avg
>      407170 =C2=B1 49%    +170.4%    1101004        sched_debug.cfs_rq:/.=
load.max
>       52684 =C2=B1 42%    +768.5%     457567        sched_debug.cfs_rq:/.=
load.stddev
>       37.01 =C2=B1 46%    +723.1%     304.63 =C2=B1  4%  sched_debug.cfs_=
rq:/.load_avg.avg
>      144.31 =C2=B1 45%    +210.7%     448.32        sched_debug.cfs_rq:/.=
load_avg.stddev
>     2488735           -92.5%     187680 =C2=B1  3%  sched_debug.cfs_rq:/.=
min_vruntime.avg
>     2938975           -80.2%     581666        sched_debug.cfs_rq:/.min_v=
runtime.max
>     2060745 =C2=B1  2%     -99.5%      10250 =C2=B1 34%  sched_debug.cfs_=
rq:/.min_vruntime.min
>      182406 =C2=B1  6%     +39.2%     253824        sched_debug.cfs_rq:/.=
min_vruntime.stddev
>        0.39           -23.7%       0.30 =C2=B1  4%  sched_debug.cfs_rq:/.=
nr_running.avg
>      400.60         +3272.5%      13510 =C2=B1  5%  sched_debug.cfs_rq:/.=
runnable_avg.avg
>      971.78 =C2=B1  2%   +4430.1%      44022        sched_debug.cfs_rq:/.=
runnable_avg.max
>      370.10         +5173.5%      19517        sched_debug.cfs_rq:/.runna=
ble_avg.stddev
>       12579 =C2=B11058%   -3228.1%    -393486        sched_debug.cfs_rq:/=
.spread0.avg
>      462824 =C2=B1 24%     -99.9%     540.01 =C2=B1 92%  sched_debug.cfs_=
rq:/.spread0.max
>      182401 =C2=B1  6%     +39.2%     253852        sched_debug.cfs_rq:/.=
spread0.stddev
>      400.13           -25.0%     300.07 =C2=B1  4%  sched_debug.cfs_rq:/.=
util_avg.avg
>      369.97           +18.4%     437.88        sched_debug.cfs_rq:/.util_=
avg.stddev
>       10.90 =C2=B1 10%     -87.5%       1.37 =C2=B1 48%  sched_debug.cfs_=
rq:/.util_est_enqueued.avg
>      454.44 =C2=B1 14%     -90.3%      44.23 =C2=B1  3%  sched_debug.cfs_=
rq:/.util_est_enqueued.max
>       60.82 =C2=B1 13%     -90.9%       5.53 =C2=B1 14%  sched_debug.cfs_=
rq:/.util_est_enqueued.stddev
>        0.92 =C2=B1 36%     -90.0%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.load_avg.avg
>        1.08 =C2=B1 17%     -91.5%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.load_avg.max
>        0.50 =C2=B1107%   +2506.1%      12.97 =C2=B1 57%  sched_debug.cfs_=
rq:/init.scope.min_vruntime.avg
>        0.54 =C2=B1104%   +2288.9%      13.00 =C2=B1 57%  sched_debug.cfs_=
rq:/init.scope.min_vruntime.max
>        0.45 =C2=B1111%   +2768.6%      12.93 =C2=B1 57%  sched_debug.cfs_=
rq:/init.scope.min_vruntime.min
>        0.92 =C2=B1 36%     -90.0%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.runnable_avg.avg
>        1.08 =C2=B1 17%     -91.5%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.runnable_avg.max
>        0.51 =C2=B1123%   +1809.6%       9.78 =C2=B1 40%  sched_debug.cfs_=
rq:/init.scope.se->sum_exec_runtime.avg
>        0.52 =C2=B1122%   +1769.0%       9.78 =C2=B1 40%  sched_debug.cfs_=
rq:/init.scope.se->sum_exec_runtime.max
>        0.50 =C2=B1126%   +1852.0%       9.77 =C2=B1 40%  sched_debug.cfs_=
rq:/init.scope.se->sum_exec_runtime.min
>      927421 =C2=B1116%     -88.6%     105436 =C2=B1 29%  sched_debug.cfs_=
rq:/init.scope.se->vruntime.avg
>      927672 =C2=B1116%     -88.6%     105945 =C2=B1 29%  sched_debug.cfs_=
rq:/init.scope.se->vruntime.max
>      927171 =C2=B1117%     -88.7%     104926 =C2=B1 29%  sched_debug.cfs_=
rq:/init.scope.se->vruntime.min
>     -903221           -88.3%    -106040        sched_debug.cfs_rq:/init.s=
cope.spread0.avg
>     -903221           -88.3%    -106040        sched_debug.cfs_rq:/init.s=
cope.spread0.max
>     -903221           -88.3%    -106040        sched_debug.cfs_rq:/init.s=
cope.spread0.min
>        1.08 =C2=B1 17%     -91.5%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.tg_load_avg.avg
>        1.08 =C2=B1 17%     -91.5%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.tg_load_avg.max
>        1.08 =C2=B1 17%     -91.5%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.tg_load_avg.min
>        0.92 =C2=B1 36%     -90.0%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.tg_load_avg_contrib.avg
>        1.08 =C2=B1 17%     -91.5%       0.09 =C2=B1176%  sched_debug.cfs_=
rq:/init.scope.tg_load_avg_contrib.max
>        0.92 =C2=B1 36%     -96.4%       0.03 =C2=B1111%  sched_debug.cfs_=
rq:/init.scope.util_avg.avg
>        1.08 =C2=B1 17%     -96.9%       0.03 =C2=B1111%  sched_debug.cfs_=
rq:/init.scope.util_avg.max
>      109.53 =C2=B1107%  +50485.6%      55405        sched_debug.cfs_rq:/k=
build.1.MIN_vruntime.avg
>        9638 =C2=B1107%    +475.0%      55414        sched_debug.cfs_rq:/k=
build.1.MIN_vruntime.max
>       -0.30        -1.9e+07%      55396        sched_debug.cfs_rq:/kbuild=
.1.MIN_vruntime.min
>        0.39 =C2=B1  2%  +11812.2%      46.70        sched_debug.cfs_rq:/k=
build.1.h_nr_running.avg
>        1.00         +4594.2%      46.94        sched_debug.cfs_rq:/kbuild=
.1.h_nr_running.max
>      410733 =C2=B1  2%  +11823.3%   48972868        sched_debug.cfs_rq:/k=
build.1.load.avg
>     1048576         +4594.2%   49221905        sched_debug.cfs_rq:/kbuild=
.1.load.max
>      659.13 =C2=B1  3%   +7394.5%      49398        sched_debug.cfs_rq:/k=
build.1.load_avg.avg
>        2647 =C2=B1 11%   +1777.5%      49713        sched_debug.cfs_rq:/k=
build.1.load_avg.max
>        0.03 =C2=B1223%  +1.8e+08%      49083 =C2=B1  2%  sched_debug.cfs_=
rq:/kbuild.1.load_avg.min
>      109.53 =C2=B1107%  +50489.2%      55409        sched_debug.cfs_rq:/k=
build.1.max_vruntime.avg
>        9638 =C2=B1107%    +475.0%      55418        sched_debug.cfs_rq:/k=
build.1.max_vruntime.max
>       -0.30        -1.9e+07%      55400        sched_debug.cfs_rq:/kbuild=
.1.max_vruntime.min
>       87264           -36.5%      55405        sched_debug.cfs_rq:/kbuild=
.1.min_vruntime.avg
>       99270           -44.2%      55414        sched_debug.cfs_rq:/kbuild=
.1.min_vruntime.max
>       75767           -26.9%      55396        sched_debug.cfs_rq:/kbuild=
.1.min_vruntime.min
>        5024 =C2=B1  7%     -99.8%       9.08 =C2=B1100%  sched_debug.cfs_=
rq:/kbuild.1.min_vruntime.stddev
>        0.39 =C2=B1  2%  +11812.2%      46.70        sched_debug.cfs_rq:/k=
build.1.nr_running.avg
>        1.00         +4594.2%      46.94        sched_debug.cfs_rq:/kbuild=
.1.nr_running.max
>       35.29 =C2=B1 22%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.load_avg.avg
>      919.11 =C2=B1 14%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.load_avg.max
>      156.52 =C2=B1 17%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.load_avg.stddev
>       14.27 =C2=B1 27%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.runnable_avg.avg
>      419.11 =C2=B1 25%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.runnable_avg.max
>       65.99 =C2=B1 27%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.runnable_avg.stddev
>       14.27 =C2=B1 27%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.util_avg.avg
>      419.11 =C2=B1 25%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.util_avg.max
>       65.99 =C2=B1 27%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.removed.util_avg.stddev
>      412.27        +10527.3%      43813        sched_debug.cfs_rq:/kbuild=
.1.runnable_avg.avg
>      967.14 =C2=B1  2%   +4443.7%      43944        sched_debug.cfs_rq:/k=
build.1.runnable_avg.max
>        0.03 =C2=B1223%  +1.6e+08%      43681        sched_debug.cfs_rq:/k=
build.1.runnable_avg.min
>      368.39           -64.4%     131.08 =C2=B1101%  sched_debug.cfs_rq:/k=
build.1.runnable_avg.stddev
>       13.05 =C2=B1 10%   +7646.3%       1011        sched_debug.cfs_rq:/k=
build.1.se->avg.load_avg.avg
>       87.56 =C2=B1 16%   +1069.5%       1023        sched_debug.cfs_rq:/k=
build.1.se->avg.load_avg.max
>      412.13        +10524.7%      43787        sched_debug.cfs_rq:/kbuild=
.1.se->avg.runnable_avg.avg
>      967.47 =C2=B1  2%   +4439.4%      43917        sched_debug.cfs_rq:/k=
build.1.se->avg.runnable_avg.max
>        0.03 =C2=B1223%  +1.6e+08%      43657        sched_debug.cfs_rq:/k=
build.1.se->avg.runnable_avg.min
>      368.51           -64.7%     129.95 =C2=B1101%  sched_debug.cfs_rq:/k=
build.1.se->avg.runnable_avg.stddev
>      411.92          +141.6%     995.10        sched_debug.cfs_rq:/kbuild=
.1.se->avg.util_avg.avg
>        0.03 =C2=B1223%  +3.5e+06%     983.40 =C2=B1  2%  sched_debug.cfs_=
rq:/kbuild.1.se->avg.util_avg.min
>      368.41           -96.8%      11.70 =C2=B1100%  sched_debug.cfs_rq:/k=
build.1.se->avg.util_avg.stddev
>      188343          +220.5%     603616        sched_debug.cfs_rq:/kbuild=
.1.se->exec_start.avg
>      188644          +220.2%     604099        sched_debug.cfs_rq:/kbuild=
.1.se->exec_start.max
>      186221          +223.9%     603133        sched_debug.cfs_rq:/kbuild=
.1.se->exec_start.min
>       51889 =C2=B1  7%   +1920.8%    1048576        sched_debug.cfs_rq:/k=
build.1.se->load.weight.avg
>      176539 =C2=B1 22%    +494.0%    1048576        sched_debug.cfs_rq:/k=
build.1.se->load.weight.max
>        1173 =C2=B1 53%  +89267.3%    1048576        sched_debug.cfs_rq:/k=
build.1.se->load.weight.min
>       41159 =C2=B1 21%    -100.0%       0.00        sched_debug.cfs_rq:/k=
build.1.se->load.weight.stddev
>       44377         +1155.3%     557089        sched_debug.cfs_rq:/kbuild=
.1.se->sum_exec_runtime.avg
>       52129          +968.7%     557092        sched_debug.cfs_rq:/kbuild=
.1.se->sum_exec_runtime.max
>       36817 =C2=B1  2%   +1413.1%     557086        sched_debug.cfs_rq:/k=
build.1.se->sum_exec_runtime.min
>        3173 =C2=B1  5%     -99.9%       3.27 =C2=B1100%  sched_debug.cfs_=
rq:/kbuild.1.se->sum_exec_runtime.stddev
>     2490096           -76.7%     580821        sched_debug.cfs_rq:/kbuild=
.1.se->vruntime.avg
>     2932328           -80.2%     581126        sched_debug.cfs_rq:/kbuild=
.1.se->vruntime.max
>     2062018 =C2=B1  2%     -71.8%     580516        sched_debug.cfs_rq:/k=
build.1.se->vruntime.min
>      182836 =C2=B1  7%     -99.8%     305.00 =C2=B1101%  sched_debug.cfs_=
rq:/kbuild.1.se->vruntime.stddev
>    -2388892           -78.0%    -525720        sched_debug.cfs_rq:/kbuild=
.1.spread0.avg
>    -2376905           -77.9%    -525711        sched_debug.cfs_rq:/kbuild=
.1.spread0.max
>    -2400349           -78.1%    -525729        sched_debug.cfs_rq:/kbuild=
.1.spread0.min
>        5008 =C2=B1  7%     -99.8%       9.10 =C2=B1100%  sched_debug.cfs_=
rq:/kbuild.1.spread0.stddev
>       59728 =C2=B1  4%     -16.5%      49878        sched_debug.cfs_rq:/k=
build.1.tg_load_avg.max
>        2203 =C2=B1 20%     -99.9%       1.82 =C2=B1223%  sched_debug.cfs_=
rq:/kbuild.1.tg_load_avg.stddev
>      661.43 =C2=B1  3%   +7393.3%      49562        sched_debug.cfs_rq:/k=
build.1.tg_load_avg_contrib.avg
>        2655 =C2=B1 11%   +1778.5%      49878        sched_debug.cfs_rq:/k=
build.1.tg_load_avg_contrib.max
>        0.03 =C2=B1223%  +1.8e+08%      49246 =C2=B1  2%  sched_debug.cfs_=
rq:/kbuild.1.tg_load_avg_contrib.min
>      412.06          +140.8%     992.05        sched_debug.cfs_rq:/kbuild=
.1.util_avg.avg
>        0.03 =C2=B1223%  +3.5e+06%     980.41 =C2=B1  2%  sched_debug.cfs_=
rq:/kbuild.1.util_avg.min
>      368.29           -96.8%      11.64 =C2=B1100%  sched_debug.cfs_rq:/k=
build.1.util_avg.stddev
>        0.00 =C2=B1 27%  +7.1e+08%       6.35 =C2=B1 16%  sched_debug.cfs_=
rq:/system.slice.MIN_vruntime.avg
>        0.00 =C2=B1 27%  +2.9e+09%      25.72        sched_debug.cfs_rq:/s=
ystem.slice.MIN_vruntime.max
>        0.00 =C2=B1 27%     -70.0%       0.00 =C2=B1 25%  sched_debug.cfs_=
rq:/system.slice.MIN_vruntime.min
>      739.56 =C2=B1 54%     -90.0%      73.75 =C2=B1 36%  sched_debug.cfs_=
rq:/system.slice.load_avg.max
>      183.19 =C2=B1 53%     -82.7%      31.64 =C2=B1 37%  sched_debug.cfs_=
rq:/system.slice.load_avg.stddev
>        0.00 =C2=B1 27%  +7.3e+08%       6.45 =C2=B1 17%  sched_debug.cfs_=
rq:/system.slice.max_vruntime.avg
>        0.00 =C2=B1 27%  +2.9e+09%      26.12        sched_debug.cfs_rq:/s=
ystem.slice.max_vruntime.max
>        0.00 =C2=B1 27%     -70.0%       0.00 =C2=B1 25%  sched_debug.cfs_=
rq:/system.slice.max_vruntime.min
>       30.65 =C2=B1 43%   +4649.8%       1455 =C2=B1 30%  sched_debug.cfs_=
rq:/system.slice.min_vruntime.avg
>       97.37 =C2=B1 36%   +1415.3%       1475 =C2=B1 30%  sched_debug.cfs_=
rq:/system.slice.min_vruntime.max
>        4.88 =C2=B1263%  +29568.6%       1449 =C2=B1 30%  sched_debug.cfs_=
rq:/system.slice.min_vruntime.min
>      739.56 =C2=B1 54%     -90.0%      73.75 =C2=B1 36%  sched_debug.cfs_=
rq:/system.slice.runnable_avg.max
>      183.44 =C2=B1 53%     -82.8%      31.64 =C2=B1 37%  sched_debug.cfs_=
rq:/system.slice.runnable_avg.stddev
>      698.25 =C2=B1 54%     -92.7%      51.19        sched_debug.cfs_rq:/s=
ystem.slice.se->avg.load_avg.max
>      173.10 =C2=B1 53%     -87.3%      21.91 =C2=B1  5%  sched_debug.cfs_=
rq:/system.slice.se->avg.load_avg.stddev
>      739.56 =C2=B1 54%     -90.0%      73.76 =C2=B1 36%  sched_debug.cfs_=
rq:/system.slice.se->avg.runnable_avg.max
>      183.45 =C2=B1 53%     -82.8%      31.64 =C2=B1 37%  sched_debug.cfs_=
rq:/system.slice.se->avg.runnable_avg.stddev
>       50.39 =C2=B1 53%     -89.1%       5.49 =C2=B1 40%  sched_debug.cfs_=
rq:/system.slice.se->avg.util_avg.avg
>      739.39 =C2=B1 54%     -97.0%      22.29 =C2=B1 38%  sched_debug.cfs_=
rq:/system.slice.se->avg.util_avg.max
>      183.41 =C2=B1 53%     -94.8%       9.54 =C2=B1 39%  sched_debug.cfs_=
rq:/system.slice.se->avg.util_avg.stddev
>       10507 =C2=B1 54%     -92.1%     828.57 =C2=B1  5%  sched_debug.cfs_=
rq:/system.slice.se->exec_start.stddev
>      796179 =C2=B1 45%     -80.2%     157286 =C2=B1 19%  sched_debug.cfs_=
rq:/system.slice.se->load.weight.max
>        2018 =C2=B1 70%   +7694.2%     157286 =C2=B1 19%  sched_debug.cfs_=
rq:/system.slice.se->load.weight.min
>      299826 =C2=B1 43%    -100.0%       0.00        sched_debug.cfs_rq:/s=
ystem.slice.se->load.weight.stddev
>       14.57 =C2=B1103%  +10710.8%       1574 =C2=B1 30%  sched_debug.cfs_=
rq:/system.slice.se->sum_exec_runtime.avg
>       98.32 =C2=B1 35%   +1522.3%       1595 =C2=B1 29%  sched_debug.cfs_=
rq:/system.slice.se->sum_exec_runtime.max
>        5.78 =C2=B1222%  +27036.3%       1568 =C2=B1 30%  sched_debug.cfs_=
rq:/system.slice.se->sum_exec_runtime.min
>       10560 =C2=B1 60%     -95.1%     519.51 =C2=B1 12%  sched_debug.cfs_=
rq:/system.slice.se->vruntime.stddev
>      781.68 =C2=B1 54%     -89.7%      80.14 =C2=B1 30%  sched_debug.cfs_=
rq:/system.slice.tg_load_avg.avg
>      783.75 =C2=B1 54%     -88.9%      86.65 =C2=B1 31%  sched_debug.cfs_=
rq:/system.slice.tg_load_avg.max
>      779.86 =C2=B1 54%     -90.5%      73.87 =C2=B1 36%  sched_debug.cfs_=
rq:/system.slice.tg_load_avg.min
>      739.36 =C2=B1 54%     -90.0%      73.87 =C2=B1 36%  sched_debug.cfs_=
rq:/system.slice.tg_load_avg_contrib.max
>      183.14 =C2=B1 53%     -82.7%      31.69 =C2=B1 37%  sched_debug.cfs_=
rq:/system.slice.tg_load_avg_contrib.stddev
>       50.40 =C2=B1 53%     -89.1%       5.49 =C2=B1 40%  sched_debug.cfs_=
rq:/system.slice.util_avg.avg
>      739.39 =C2=B1 54%     -97.0%      22.29 =C2=B1 38%  sched_debug.cfs_=
rq:/system.slice.util_avg.max
>      183.40 =C2=B1 53%     -94.8%       9.54 =C2=B1 39%  sched_debug.cfs_=
rq:/system.slice.util_avg.stddev
>      130276 =C2=B1  3%     -53.9%      60023 =C2=B1 30%  sched_debug.cpu.=
avg_idle.stddev
>      190561          +223.2%     615836        sched_debug.cpu.clock.avg
>      190566          +223.2%     615963        sched_debug.cpu.clock.max
>      190557          +223.1%     615766        sched_debug.cpu.clock.min
>        2.49 =C2=B1  2%   +3195.3%      82.17 =C2=B1 10%  sched_debug.cpu.=
clock.stddev
>      188349          +223.1%     608620        sched_debug.cpu.clock_task=
.avg
>      188650          +224.3%     611860        sched_debug.cpu.clock_task=
.max
>      186038          +224.3%     603373        sched_debug.cpu.clock_task=
.min
>      370.07 =C2=B1 40%    +680.3%       2887 =C2=B1 40%  sched_debug.cpu.=
clock_task.stddev
>       15323 =C2=B1 17%     -97.1%     451.92 =C2=B1  5%  sched_debug.cpu.=
curr->pid.avg
>       16512 =C2=B1 12%     -74.5%       4215 =C2=B1  5%  sched_debug.cpu.=
curr->pid.stddev
>        0.00 =C2=B1  5%    +351.8%       0.00 =C2=B1 10%  sched_debug.cpu.=
next_balance.stddev
>        0.38           +40.2%       0.54        sched_debug.cpu.nr_running=
.avg
>        1.11 =C2=B1  7%   +4138.2%      47.09        sched_debug.cpu.nr_ru=
nning.max
>        0.42         +1084.1%       4.99        sched_debug.cpu.nr_running=
.stddev
>       34116           -48.2%      17664        sched_debug.cpu.nr_switche=
s.avg
>       66559 =C2=B1  6%   +1204.5%     868266        sched_debug.cpu.nr_sw=
itches.max
>       26193 =C2=B1  2%     -96.9%     813.00 =C2=B1  3%  sched_debug.cpu.=
nr_switches.min
>        7164 =C2=B1  3%   +1254.8%      97055        sched_debug.cpu.nr_sw=
itches.stddev
>      190557          +223.1%     615766        sched_debug.cpu_clk
>      189985          +223.8%     615197        sched_debug.ktime
>      193775          +219.7%     619543        sched_debug.sched_clk
>
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>

--===============4126171154105686385==--

