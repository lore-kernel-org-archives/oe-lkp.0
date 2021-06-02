Content-Type: multipart/mixed; boundary="===============4606355843089124566=="
MIME-Version: 1.0
From: Julia Lawall <julia.lawall@inria.fr>
To: lkp@lists.01.org
Subject: Re: [sched/fair] d8fcb81f1a: netperf.Throughput_tps -16.9% regression
Date: Wed, 02 Jun 2021 08:17:28 +0200
Message-ID: <alpine.DEB.2.22.394.2106020812460.48206@hadrien>
In-Reply-To: <79c17dbf-844e-d137-ecac-bcb291d14649@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4606355843089124566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On Wed, 2 Jun 2021, Xing Zhengjun wrote:

> Hi Julia,
>
> =C2=A0=C2=A0=C2=A0=C2=A0 Do you have time to look at this?=C2=A0 The regr=
ession still exists in
> v5.13-rc4. Thanks.

Hi,

I'm not familiar with netperf.  Is it easy to set up?  Would it be
feasible for you to send me some traces with trace-cmd, with the options
-e sched -e -v sched-stat-runtime?  Then I can see the exact behavior on
your machine.

julia

>
> On 3/9/2021 2:25 PM, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed a -16.9% regression of netperf.Throughput_tps due to comm=
it:
>
>
> commit: d8fcb81f1acf651a0e50eacecca43d0524984f87 ("sched/fair: Check for =
idl
> e core in wake_affine")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
>
> in testcase: netperf
> on test machine: 144 threads Intel(R) Xeon(R) Gold 5318H CPU @ 2.50GHz wi=
th
> 128G memory
> with following parameters:
>
> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 25%
> 	cluster: cs-localhost
> 	test: SCTP_RR
> 	cpufreq_governor: performance
> 	ucode: 0x700001c
>
> test-description: Netperf is a benchmark that can be use to measure vario=
us
> aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
>
> In addition to that, the commit also has significant impact on the follow=
ing
>  tests:
>
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | netperf: netperf.Throughput_tps -14.2% regression
>                    |
> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GH
> z with 192G memory |
> | test parameters  | cluster=3Dcs-localhost
>                    |
> |                  | cpufreq_governor=3Dperformance
>                    |
> |                  | ip=3Dipv4
>                    |
> |                  | nr_threads=3D25%
>                    |
> |                  | runtime=3D300s
>                    |
> |                  | test=3DSCTP_RR
>                    |
> |                  | ucode=3D0x5003006
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | vm-scalability: vm-scalability.throughput 4.3% impro=
vem
> ent                |
> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GH
> z with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | runtime=3D300s
>                    |
> |                  | size=3D2T
>                    |
> |                  | test=3Dshm-xread-seq-mt
>                    |
> |                  | ucode=3D0x5003006
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | aim7: aim7.jobs-per-min -1.8% regression
>                    |
> | test machine     | 88 threads Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz=
 wi
> th 128G memory     |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | disk=3D4BRD_12G
>                    |
> |                  | fs=3Dxfs
>                    |
> |                  | load=3D3000
>                    |
> |                  | md=3DRAID0
>                    |
> |                  | test=3Ddisk_src
>                    |
> |                  | ucode=3D0x5003006
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | pigz: pigz.throughput 19.7% improvement
>                    |
> | test machine     | 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz=
 wi
> th 80G memory      |
> | test parameters  | blocksize=3D128K
>                    |
> |                  | cpufreq_governor=3Dperformance
>                    |
> |                  | nr_threads=3D100%
>                    |
> |                  | ucode=3D0x11
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | pigz: pigz.throughput 16.1% improvement
>                    |
> | test machine     | 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz=
 wi
> th 80G memory      |
> | test parameters  | blocksize=3D512K
>                    |
> |                  | cpufreq_governor=3Dperformance
>                    |
> |                  | nr_threads=3D100%
>                    |
> |                  | ucode=3D0x11
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | aim7: aim7.jobs-per-min 4.7% improvement
>                    |
> | test machine     | 144 threads Intel(R) Xeon(R) Gold 5318H CPU @ 2.50GH=
z w
> ith 128G memory    |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | disk=3D1BRD_48G
>                    |
> |                  | fs=3Dxfs
>                    |
> |                  | load=3D600
>                    |
> |                  | test=3Dsync_disk_rw
>                    |
> |                  | ucode=3D0x700001e
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | unixbench: unixbench.score 11.7% improvement
>                    |
> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GH
> z with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | nr_task=3D30%
>                    |
> |                  | runtime=3D300s
>                    |
> |                  | test=3Dshell8
>                    |
> |                  | ucode=3D0x4003003
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | aim7: aim7.jobs-per-min 4.7% improvement
>                    |
> | test machine     | 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G =
mem
> ory                |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | disk=3D4BRD_12G
>                    |
> |                  | fs=3Dxfs
>                    |
> |                  | load=3D300
>                    |
> |                  | md=3DRAID0
>                    |
> |                  | test=3Dsync_disk_rw
>                    |
> |                  | ucode=3D0x4002f01
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | unixbench: unixbench.score 10.5% improvement
>                    |
> | test machine     | 96 threads Intel(R) Xeon(R) Platinum 8260L CPU @ 2.4=
0GH
> z with 128G memory |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | nr_task=3D30%
>                    |
> |                  | runtime=3D300s
>                    |
> |                  | test=3Dshell8
>                    |
> |                  | ucode=3D0x4002f01
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | fsmark: fsmark.files_per_sec -13.7% regression
>                    |
> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GH
> z with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | disk=3D1SSD
>                    |
> |                  | filesize=3D9B
>                    |
> |                  | fs2=3Dnfsv4
>                    |
> |                  | fs=3Dext4
>                    |
> |                  | iterations=3D4
>                    |
> |                  | nr_directories=3D16d
>                    |
> |                  | nr_files_per_directory=3D256fpd
>                    |
> |                  | nr_threads=3D4
>                    |
> |                  | sync_method=3DfsyncBeforeClose
>                    |
> |                  | test_size=3D10G
>                    |
> |                  | ucode=3D0x4002f01
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | netperf: netperf.Throughput_tps -21.1% regression
>                    |
> | test machine     | 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G =
mem
> ory                |
> | test parameters  | cluster=3Dcs-localhost
>                    |
> |                  | cpufreq_governor=3Dperformance
>                    |
> |                  | ip=3Dipv4
>                    |
> |                  | nr_threads=3D25%
>                    |
> |                  | runtime=3D300s
>                    |
> |                  | test=3DSCTP_RR
>                    |
> |                  | ucode=3D0x700001e
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
> | testcase: change | aim7: aim7.jobs-per-min 8.7% improvement
>                    |
> | test machine     | 192 threads Intel(R) Xeon(R) CPU @ 2.20GHz with 192G=
 me
> mory               |
> | test parameters  | cpufreq_governor=3Dperformance
>                    |
> |                  | disk=3D1BRD_48G
>                    |
> |                  | fs=3Dxfs
>                    |
> |                  | load=3D600
>                    |
> |                  | test=3Dsync_disk_rw
>                    |
> |                  | ucode=3D0x700001c
>                    |
> +------------------+-----------------------------------------------------=
---
> -------------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
---
> ---------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is attached i=
n t
> his email
>         bin/lkp split-job --compatible job.yaml
>         bin/lkp run                    compatible-job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_
> group/test/testcase/ucode:
>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/25%/debian-10.4-x86=
_64
> -20200603.cgz/300s/lkp-cpl-4sp1/SCTP_RR/netperf/0x700001c
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>    2021304           -16.9%    1678970 =C2=B1  3%  netperf.Throughput_tot=
al_tps
>      56147           -16.9%      46638 =C2=B1  3%  netperf.Throughput_tps
>       1465            -5.2%       1389        netperf.time.percent_of_cpu=
_th
> is_job_got
>       4372            -5.0%       4155        netperf.time.system_time
>      99.55           -17.0%      82.63 =C2=B1  4%  netperf.time.user_time
>  6.064e+08           -16.9%  5.037e+08 =C2=B1  3%  netperf.time.voluntary=
_context
> _switches
>  6.064e+08           -16.9%  5.037e+08 =C2=B1  3%  netperf.workload
>       0.52 =C2=B1  2%      -0.1        0.44 =C2=B1  4%  mpstat.cpu.all.us=
r%
>     514.75 =C2=B1 47%    +248.2%       1792 =C2=B1 49%  numa-meminfo.node=
1.Active
>     514.75 =C2=B1 47%    +248.2%       1792 =C2=B1 49%  numa-meminfo.node=
1.Active(anon
> )
>     140083 =C2=B1 32%     +74.2%     244042 =C2=B1 28%  numa-numastat.nod=
e1.local_node
>     161065 =C2=B1 28%     +62.4%     261530 =C2=B1 24%  numa-numastat.nod=
e1.numa_hit
>     128.25 =C2=B1 47%    +249.1%     447.75 =C2=B1 49%  numa-vmstat.node1=
.nr_active_an
> on
>     128.25 =C2=B1 47%    +249.1%     447.75 =C2=B1 49%  numa-vmstat.node1=
.nr_zone_acti
> ve_anon
>      27622 =C2=B1  6%     -23.7%      21068 =C2=B1 26%  proc-vmstat.numa_=
hint_faults
>      15390 =C2=B1 25%     -32.9%      10329 =C2=B1  6%  proc-vmstat.numa_=
hint_faults_l
> ocal
>       2870 =C2=B1 11%     +16.4%       3342 =C2=B1  7%  slabinfo.fsnotify=
_mark_connect
> or.active_objs
>       2870 =C2=B1 11%     +16.4%       3342 =C2=B1  7%  slabinfo.fsnotify=
_mark_connect
> or.num_objs
>      66.00            +1.5%      67.00        vmstat.cpu.id
>    7870403           -16.9%    6543135 =C2=B1  3%  vmstat.system.cs
>  1.178e+09           -15.8%  9.919e+08 =C2=B1  3%  cpuidle.C1.usage
>  1.967e+08 =C2=B1  4%     -35.7%  1.266e+08 =C2=B1 11%  cpuidle.POLL.time
>   39529805 =C2=B1  5%     -42.6%   22687592 =C2=B1 15%  cpuidle.POLL.usage
>      33571 =C2=B1 23%     -40.5%      19979 =C2=B1 34%  sched_debug.cfs_r=
q:/.MIN_vrunt
> ime.avg
>    1094720 =C2=B1  2%     -18.4%     893789 =C2=B1  8%  sched_debug.cfs_r=
q:/.MIN_vrunt
> ime.max
>     175204 =C2=B1 12%     -29.7%     123212 =C2=B1 20%  sched_debug.cfs_r=
q:/.MIN_vrunt
> ime.stddev
>      33571 =C2=B1 23%     -40.5%      19979 =C2=B1 34%  sched_debug.cfs_r=
q:/.max_vrunt
> ime.avg
>    1094720 =C2=B1  2%     -18.4%     893789 =C2=B1  8%  sched_debug.cfs_r=
q:/.max_vrunt
> ime.max
>     175204 =C2=B1 12%     -29.7%     123212 =C2=B1 20%  sched_debug.cfs_r=
q:/.max_vrunt
> ime.stddev
>     952375           -11.8%     839736 =C2=B1  2%  sched_debug.cfs_rq:/.m=
in_vrunt
> ime.avg
>    1212025           -13.4%    1049842 =C2=B1  3%  sched_debug.cfs_rq:/.m=
in_vrunt
> ime.max
>     126484 =C2=B1  4%     -30.2%      88234 =C2=B1 18%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.stddev
>     126455 =C2=B1  4%     -30.2%      88222 =C2=B1 18%  sched_debug.cfs_r=
q:/.spread0.s
> tddev
>     188.46 =C2=B1  8%     -17.5%     155.42 =C2=B1  6%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.avg
>     428784 =C2=B1  4%     -15.7%     361528 =C2=B1  7%  sched_debug.cpu.a=
vg_idle.avg
>     410059            -9.3%     372101 =C2=B1  5%  sched_debug.cpu.avg_id=
le.stdde
> v
>       2101 =C2=B1  4%     -20.3%       1674 =C2=B1 13%  sched_debug.cpu.c=
lock_task.std
> dev
>    6576722           -17.3%    5441716 =C2=B1  3%  sched_debug.cpu.nr_swi=
tches.av
> g
>    8614196 =C2=B1  2%     -17.4%    7116437 =C2=B1  3%  sched_debug.cpu.n=
r_switches.ma
> x
>    4809812 =C2=B1  2%     -17.2%    3981069 =C2=B1  4%  sched_debug.cpu.n=
r_switches.mi
> n
>     997524 =C2=B1  4%     -32.3%     675800 =C2=B1 17%  sched_debug.cpu.n=
r_switches.st
> ddev
>      14.55           -10.5%      13.03 =C2=B1  4%  perf-stat.i.MPKI
>  2.174e+10           -16.6%  1.814e+10 =C2=B1  3%  perf-stat.i.branch-ins=
truction
> s
>  3.616e+08           -16.8%   3.01e+08 =C2=B1  3%  perf-stat.i.branch-mis=
ses
>       6.26 =C2=B1  7%     +14.3       20.53 =C2=B1 17%  perf-stat.i.cache=
-miss-rate%
>   93314796 =C2=B1  6%    +147.2%  2.307e+08 =C2=B1 10%  perf-stat.i.cache=
-misses
>  1.569e+09           -26.2%  1.158e+09 =C2=B1  6%  perf-stat.i.cache-refe=
rences
>    7953259           -16.9%    6606167 =C2=B1  3%  perf-stat.i.context-sw=
itches
>       1.65           +15.5%       1.91 =C2=B1  3%  perf-stat.i.cpi
>   1.76e+11            -4.0%  1.689e+11        perf-stat.i.cpu-cycles
>       1989 =C2=B1  7%     -61.6%     764.42 =C2=B1 10%  perf-stat.i.cycle=
s-between-cac
> he-misses
>     942230 =C2=B1  7%     +48.2%    1396336 =C2=B1  6%  perf-stat.i.dTLB-=
load-misses
>  3.099e+10           -16.7%  2.581e+10 =C2=B1  3%  perf-stat.i.dTLB-loads
>  1.867e+10           -16.6%  1.556e+10 =C2=B1  3%  perf-stat.i.dTLB-stores
>  2.638e+08           -18.1%  2.161e+08 =C2=B1  3%  perf-stat.i.iTLB-load-=
misses
>  2.261e+08 =C2=B1  2%     -15.0%  1.921e+08 =C2=B1  3%  perf-stat.i.iTLB-=
loads
>  1.088e+11           -16.7%  9.066e+10 =C2=B1  3%  perf-stat.i.instructio=
ns
>       0.62           -13.2%       0.53 =C2=B1  3%  perf-stat.i.ipc
>       1.22            -4.0%       1.17        perf-stat.i.metric.GHz
>     508.81           -16.7%     423.92 =C2=B1  3%  perf-stat.i.metric.M/s=
ec
>   52969510 =C2=B1  6%    +148.0%  1.313e+08 =C2=B1 12%  perf-stat.i.node-=
load-misses
>   17086736 =C2=B1  6%    +157.6%   44016773 =C2=B1 10%  perf-stat.i.node-=
store-misses
>      64311 =C2=B1 11%     -34.9%      41851 =C2=B1 14%  perf-stat.i.node-=
stores
>      14.42           -11.5%      12.76 =C2=B1  3%  perf-stat.overall.MPKI
>       5.95 =C2=B1  7%     +14.2       20.16 =C2=B1 17%  perf-stat.overall=
.cache-miss-r
> ate%
>       1.62           +15.3%       1.87 =C2=B1  2%  perf-stat.overall.cpi
>       1896 =C2=B1  7%     -61.0%     740.44 =C2=B1 10%  perf-stat.overall=
.cycles-betwe
> en-cache-misses
>       0.00 =C2=B1  7%      +0.0        0.01 =C2=B1  5%  perf-stat.overall=
.dTLB-load-mi
> ss-rate%
>       0.00 =C2=B1 14%      +0.0        0.00 =C2=B1 13%  perf-stat.overall=
.dTLB-store-m
> iss-rate%
>     412.39            +1.7%     419.58        perf-stat.overall.instructi=
ons
> -per-iTLB-miss
>       0.62           -13.2%       0.54 =C2=B1  2%  perf-stat.overall.ipc
>  2.166e+10           -16.6%  1.808e+10 =C2=B1  3%  perf-stat.ps.branch-in=
structio
> ns
>  3.604e+08           -16.8%      3e+08 =C2=B1  3%  perf-stat.ps.branch-mi=
sses
>   92988755 =C2=B1  7%    +147.2%  2.299e+08 =C2=B1 10%  perf-stat.ps.cach=
e-misses
>  1.563e+09           -26.2%  1.154e+09 =C2=B1  6%  perf-stat.ps.cache-ref=
erences
>    7926179           -16.9%    6584156 =C2=B1  3%  perf-stat.ps.context-s=
witches
>  1.754e+11            -4.0%  1.684e+11        perf-stat.ps.cpu-cycles
>     939926 =C2=B1  7%     +48.1%    1392168 =C2=B1  6%  perf-stat.ps.dTLB=
-load-misses
>  3.089e+10           -16.7%  2.572e+10 =C2=B1  3%  perf-stat.ps.dTLB-loads
>   1.86e+10           -16.6%  1.551e+10 =C2=B1  3%  perf-stat.ps.dTLB-stor=
es
>  2.629e+08           -18.1%  2.153e+08 =C2=B1  3%  perf-stat.ps.iTLB-load=
-misses
>  2.253e+08 =C2=B1  2%     -15.0%  1.915e+08 =C2=B1  3%  perf-stat.ps.iTLB=
-loads
>  1.084e+11           -16.7%  9.036e+10 =C2=B1  3%  perf-stat.ps.instructi=
ons
>   52782616 =C2=B1  6%    +147.9%  1.309e+08 =C2=B1 11%  perf-stat.ps.node=
-load-misses
>   17027286 =C2=B1  6%    +157.6%   43860947 =C2=B1 10%  perf-stat.ps.node=
-store-misses
>      64160 =C2=B1 11%     -34.9%      41770 =C2=B1 14%  perf-stat.ps.node=
-stores
>  3.318e+13           -16.7%  2.766e+13 =C2=B1  3%  perf-stat.total.instru=
ctions
>    3506997 =C2=B1  4%     -16.4%    2933100 =C2=B1  6%  softirqs.CPU0.NET=
_RX
>    3903901           -16.8%    3247945 =C2=B1  9%  softirqs.CPU1.NET_RX
>    4694083 =C2=B1  5%     -17.7%    3862507 =C2=B1  5%  softirqs.CPU100.N=
ET_RX
>    4923774 =C2=B1  4%     -21.1%    3886686 =C2=B1  9%  softirqs.CPU101.N=
ET_RX
>    4869616 =C2=B1  4%     -21.7%    3812313 =C2=B1  7%  softirqs.CPU102.N=
ET_RX
>    4918475           -21.0%    3883466 =C2=B1  4%  softirqs.CPU103.NET_RX
>    4906196 =C2=B1  2%     -18.7%    3988389 =C2=B1  8%  softirqs.CPU104.N=
ET_RX
>    5016457 =C2=B1  3%     -21.6%    3933099 =C2=B1  8%  softirqs.CPU105.N=
ET_RX
>    4787127 =C2=B1  2%     -21.6%    3751065 =C2=B1  4%  softirqs.CPU106.N=
ET_RX
>    4557257 =C2=B1  5%     -15.5%    3853062 =C2=B1 10%  softirqs.CPU107.N=
ET_RX
>    3989557 =C2=B1  5%     -12.8%    3477707 =C2=B1  3%  softirqs.CPU108.N=
ET_RX
>    4426957 =C2=B1  5%     -19.5%    3561527 =C2=B1  6%  softirqs.CPU109.N=
ET_RX
>    4509964 =C2=B1  3%     -21.2%    3555033 =C2=B1  7%  softirqs.CPU110.N=
ET_RX
>    4650935 =C2=B1  4%     -19.0%    3766095        softirqs.CPU111.NET_RX
>    4979607 =C2=B1  3%     -26.8%    3644489        softirqs.CPU112.NET_RX
>    4802807 =C2=B1  5%     -18.8%    3902056 =C2=B1  3%  softirqs.CPU113.N=
ET_RX
>    4600130 =C2=B1  4%     -17.7%    3787307 =C2=B1  6%  softirqs.CPU114.N=
ET_RX
>    4846524 =C2=B1  2%     -19.7%    3890526 =C2=B1  6%  softirqs.CPU115.N=
ET_RX
>    4848325 =C2=B1  4%     -18.5%    3949458 =C2=B1  4%  softirqs.CPU116.N=
ET_RX
>    4841593 =C2=B1  4%     -23.3%    3713749 =C2=B1  5%  softirqs.CPU117.N=
ET_RX
>    4962625 =C2=B1  4%     -24.9%    3724765 =C2=B1  2%  softirqs.CPU118.N=
ET_RX
>    4878386 =C2=B1  2%     -21.7%    3821724 =C2=B1  2%  softirqs.CPU119.N=
ET_RX
>    3671284 =C2=B1  2%     -11.9%    3236225 =C2=B1  6%  softirqs.CPU12.NE=
T_RX
>    4804326 =C2=B1  2%     -22.5%    3722890 =C2=B1  7%  softirqs.CPU120.N=
ET_RX
>    4810032 =C2=B1  2%     -20.8%    3810281 =C2=B1  4%  softirqs.CPU121.N=
ET_RX
>    4674701 =C2=B1  2%     -19.9%    3743600        softirqs.CPU122.NET_RX
>    4820533 =C2=B1  3%     -21.6%    3778337 =C2=B1  5%  softirqs.CPU123.N=
ET_RX
>    4963991 =C2=B1  3%     -25.1%    3718717 =C2=B1  3%  softirqs.CPU124.N=
ET_RX
>    4757180 =C2=B1  4%     -21.5%    3734017 =C2=B1  4%  softirqs.CPU125.N=
ET_RX
>    4178313 =C2=B1  3%     -18.5%    3406188 =C2=B1  6%  softirqs.CPU126.N=
ET_RX
>    4577315 =C2=B1  2%     -22.0%    3569736 =C2=B1  9%  softirqs.CPU127.N=
ET_RX
>    4518891 =C2=B1  4%     -16.9%    3756407 =C2=B1  6%  softirqs.CPU128.N=
ET_RX
>    4579776           -20.3%    3648330 =C2=B1  7%  softirqs.CPU129.NET_RX
>    4759539 =C2=B1  2%     -21.6%    3731311 =C2=B1  5%  softirqs.CPU130.N=
ET_RX
>    4803880 =C2=B1  3%     -21.9%    3750895 =C2=B1 10%  softirqs.CPU131.N=
ET_RX
>    4965998 =C2=B1  6%     -22.0%    3874282 =C2=B1 11%  softirqs.CPU132.N=
ET_RX
>    4790232 =C2=B1  4%     -19.1%    3876366 =C2=B1  7%  softirqs.CPU133.N=
ET_RX
>    4990987 =C2=B1  5%     -23.6%    3812578 =C2=B1  9%  softirqs.CPU134.N=
ET_RX
>    4699132 =C2=B1  6%     -22.7%    3631829 =C2=B1 11%  softirqs.CPU135.N=
ET_RX
>    5016814           -24.7%    3776072 =C2=B1  9%  softirqs.CPU136.NET_RX
>    4924422 =C2=B1  2%     -21.9%    3845930 =C2=B1  8%  softirqs.CPU137.N=
ET_RX
>    4750549 =C2=B1  2%     -22.1%    3698942 =C2=B1 10%  softirqs.CPU138.N=
ET_RX
>    4770625 =C2=B1  2%     -19.4%    3844132 =C2=B1  7%  softirqs.CPU139.N=
ET_RX
>    4744799 =C2=B1  2%     -24.6%    3577218 =C2=B1  7%  softirqs.CPU140.N=
ET_RX
>    4825357 =C2=B1  2%     -18.5%    3931362 =C2=B1 12%  softirqs.CPU141.N=
ET_RX
>    4797723 =C2=B1  6%     -24.5%    3620678 =C2=B1  7%  softirqs.CPU142.N=
ET_RX
>    3969978 =C2=B1  2%     -24.0%    3016623 =C2=B1  9%  softirqs.CPU143.N=
ET_RX
>    3867599 =C2=B1  3%     -14.1%    3322296 =C2=B1  4%  softirqs.CPU19.NE=
T_RX
>    3714385           -13.5%    3213699 =C2=B1  7%  softirqs.CPU2.NET_RX
>    3515022 =C2=B1  3%     -15.3%    2976763 =C2=B1  6%  softirqs.CPU25.NE=
T_RX
>    3524413           -16.3%    2950764 =C2=B1  3%  softirqs.CPU26.NET_RX
>    3721828 =C2=B1  6%     -16.2%    3118466 =C2=B1  6%  softirqs.CPU28.NE=
T_RX
>    3664085 =C2=B1  3%     -13.4%    3174913 =C2=B1  6%  softirqs.CPU29.NE=
T_RX
>    3737605 =C2=B1  3%     -17.7%    3077711 =C2=B1  6%  softirqs.CPU3.NET=
_RX
>    3657333 =C2=B1  3%     -15.6%    3088177 =C2=B1  8%  softirqs.CPU30.NE=
T_RX
>    3519665 =C2=B1  2%     -15.1%    2988581 =C2=B1  7%  softirqs.CPU32.NE=
T_RX
>    3546129 =C2=B1  7%     -13.7%    3059612 =C2=B1  5%  softirqs.CPU35.NE=
T_RX
>    3914634 =C2=B1  4%     -17.7%    3220023        softirqs.CPU36.NET_RX
>    3889312 =C2=B1  4%     -16.7%    3239074 =C2=B1  7%  softirqs.CPU37.NE=
T_RX
>    3892937 =C2=B1  4%     -15.4%    3294655 =C2=B1  4%  softirqs.CPU38.NE=
T_RX
>    3801244 =C2=B1  5%     -17.4%    3140858 =C2=B1  4%  softirqs.CPU39.NE=
T_RX
>    3637839 =C2=B1  7%     -16.3%    3045183 =C2=B1  2%  softirqs.CPU41.NE=
T_RX
>    3907951           -19.4%    3151345 =C2=B1  6%  softirqs.CPU42.NET_RX
>    3761489 =C2=B1  2%     -17.3%    3109370 =C2=B1  4%  softirqs.CPU43.NE=
T_RX
>    3723387 =C2=B1  2%     -18.1%    3047921 =C2=B1  3%  softirqs.CPU44.NE=
T_RX
>    3660934           -13.8%    3156447 =C2=B1  5%  softirqs.CPU45.NET_RX
>    3711314 =C2=B1  5%     -13.8%    3199313 =C2=B1  5%  softirqs.CPU46.NE=
T_RX
>    3688112 =C2=B1  2%     -14.7%    3144122 =C2=B1  4%  softirqs.CPU47.NE=
T_RX
>    3786695 =C2=B1  2%     -14.9%    3223894 =C2=B1  7%  softirqs.CPU48.NE=
T_RX
>    3635194 =C2=B1  3%     -15.7%    3066106 =C2=B1  4%  softirqs.CPU49.NE=
T_RX
>    3703974 =C2=B1  7%     -15.3%    3139087 =C2=B1  2%  softirqs.CPU50.NE=
T_RX
>    3714001 =C2=B1  5%     -14.2%    3186517 =C2=B1  3%  softirqs.CPU51.NE=
T_RX
>    3518991 =C2=B1  4%      -9.8%    3175381 =C2=B1  4%  softirqs.CPU52.NE=
T_RX
>    3520297 =C2=B1  4%     -13.1%    3060815 =C2=B1  5%  softirqs.CPU53.NE=
T_RX
>    3716157 =C2=B1  2%     -15.9%    3123436 =C2=B1  8%  softirqs.CPU54.NE=
T_RX
>    3666897 =C2=B1  2%     -15.9%    3083062 =C2=B1  9%  softirqs.CPU55.NE=
T_RX
>    3864789 =C2=B1  3%     -18.5%    3149120 =C2=B1 12%  softirqs.CPU56.NE=
T_RX
>    3711210           -17.9%    3048231 =C2=B1  8%  softirqs.CPU57.NET_RX
>    3679783 =C2=B1  2%     -17.8%    3025671 =C2=B1  7%  softirqs.CPU59.NE=
T_RX
>    3637873 =C2=B1  4%     -13.3%    3153071 =C2=B1  6%  softirqs.CPU6.NET=
_RX
>    3723407 =C2=B1  4%     -16.4%    3111734 =C2=B1 11%  softirqs.CPU61.NE=
T_RX
>    3788311 =C2=B1  4%     -13.5%    3278070 =C2=B1  7%  softirqs.CPU63.NE=
T_RX
>    3601558           -12.7%    3145208 =C2=B1 11%  softirqs.CPU64.NET_RX
>    3694909           -13.5%    3196495 =C2=B1  8%  softirqs.CPU65.NET_RX
>    3694166 =C2=B1  4%     -14.7%    3152138 =C2=B1 10%  softirqs.CPU66.NE=
T_RX
>    3695641 =C2=B1  4%     -16.2%    3095356 =C2=B1  7%  softirqs.CPU67.NE=
T_RX
>    3712425 =C2=B1  6%     -19.2%    3000879 =C2=B1  4%  softirqs.CPU69.NE=
T_RX
>    3754021 =C2=B1  2%     -13.4%    3249767 =C2=B1  9%  softirqs.CPU7.NET=
_RX
>    3994248 =C2=B1  3%     -14.3%    3423955 =C2=B1  7%  softirqs.CPU71.NE=
T_RX
>    4497273 =C2=B1  3%      -9.8%    4057857 =C2=B1  4%  softirqs.CPU73.NE=
T_RX
>    4708310 =C2=B1  2%     -14.8%    4012194 =C2=B1  5%  softirqs.CPU74.NE=
T_RX
>    4681992 =C2=B1  4%     -12.7%    4089027        softirqs.CPU75.NET_RX
>    4874851 =C2=B1  5%     -18.7%    3963093 =C2=B1  4%  softirqs.CPU76.NE=
T_RX
>    4904138           -18.3%    4006997 =C2=B1  4%  softirqs.CPU77.NET_RX
>    4973767 =C2=B1  2%     -17.1%    4122604 =C2=B1  4%  softirqs.CPU78.NE=
T_RX
>    4796795           -15.3%    4061543 =C2=B1  4%  softirqs.CPU79.NET_RX
>    5013123 =C2=B1  5%     -21.4%    3938543 =C2=B1  3%  softirqs.CPU80.NE=
T_RX
>    4943538           -15.8%    4160931 =C2=B1  2%  softirqs.CPU81.NET_RX
>    4879433           -18.6%    3970630 =C2=B1  3%  softirqs.CPU82.NET_RX
>    4907139 =C2=B1  3%     -19.1%    3971135 =C2=B1  2%  softirqs.CPU83.NE=
T_RX
>    4779878 =C2=B1  2%     -16.3%    4002421        softirqs.CPU84.NET_RX
>    4881043 =C2=B1  3%     -18.1%    3996600 =C2=B1  2%  softirqs.CPU85.NE=
T_RX
>    4869262 =C2=B1  2%     -17.1%    4036233 =C2=B1  6%  softirqs.CPU86.NE=
T_RX
>    4907304 =C2=B1  5%     -17.7%    4038111 =C2=B1  4%  softirqs.CPU87.NE=
T_RX
>    4843958           -16.4%    4050836 =C2=B1  4%  softirqs.CPU88.NET_RX
>    4624455 =C2=B1  5%     -15.6%    3902318 =C2=B1  5%  softirqs.CPU89.NE=
T_RX
>    4233853 =C2=B1  6%     -17.3%    3500555 =C2=B1  5%  softirqs.CPU90.NE=
T_RX
>    4490834           -20.0%    3591973 =C2=B1 10%  softirqs.CPU91.NET_RX
>    4662654 =C2=B1  3%     -21.3%    3671296 =C2=B1  6%  softirqs.CPU92.NE=
T_RX
>    4781582 =C2=B1  3%     -23.5%    3660134 =C2=B1  9%  softirqs.CPU93.NE=
T_RX
>    4838586 =C2=B1  4%     -23.0%    3725348 =C2=B1  7%  softirqs.CPU94.NE=
T_RX
>    4836798 =C2=B1  4%     -22.7%    3738511 =C2=B1  4%  softirqs.CPU95.NE=
T_RX
>    4998673 =C2=B1  6%     -23.3%    3833021 =C2=B1 10%  softirqs.CPU96.NE=
T_RX
>    4971178           -17.5%    4101849 =C2=B1  8%  softirqs.CPU97.NET_RX
>    4961621           -19.5%    3996158 =C2=B1 10%  softirqs.CPU98.NET_RX
>    4882725 =C2=B1  3%     -22.1%    3803195 =C2=B1  5%  softirqs.CPU99.NE=
T_RX
>  6.064e+08           -16.9%  5.037e+08 =C2=B1  3%  softirqs.NET_RX
>     562373 =C2=B1  4%     +87.4%    1053723 =C2=B1 10%  interrupts.CAL:Fu=
nction_call_i
> nterrupts
>       7019 =C2=B1  9%     +28.4%       9011 =C2=B1  4%  interrupts.CPU0.C=
AL:Function_c
> all_interrupts
>      11626 =C2=B1  2%     -27.8%       8399 =C2=B1  8%  interrupts.CPU0.R=
ES:Rescheduli
> ng_interrupts
>       4874 =C2=B1  9%     +50.6%       7341 =C2=B1 15%  interrupts.CPU1.C=
AL:Function_c
> all_interrupts
>      11774 =C2=B1  4%     -29.6%       8284 =C2=B1 11%  interrupts.CPU1.R=
ES:Rescheduli
> ng_interrupts
>       4306 =C2=B1  5%     +56.8%       6753 =C2=B1 16%  interrupts.CPU10.=
CAL:Function_
> call_interrupts
>      11496 =C2=B1  5%     -21.0%       9085 =C2=B1  8%  interrupts.CPU10.=
RES:Reschedul
> ing_interrupts
>       3162 =C2=B1 14%    +131.4%       7318 =C2=B1 13%  interrupts.CPU100=
.CAL:Function
> _call_interrupts
>      15326 =C2=B1  6%     -32.1%      10399 =C2=B1 14%  interrupts.CPU100=
.RES:Reschedu
> ling_interrupts
>       3355 =C2=B1  7%    +113.9%       7177 =C2=B1 16%  interrupts.CPU101=
.CAL:Function
> _call_interrupts
>      15643 =C2=B1  4%     -34.9%      10181 =C2=B1 20%  interrupts.CPU101=
.RES:Reschedu
> ling_interrupts
>       3179          +130.9%       7340 =C2=B1 15%  interrupts.CPU102.CAL:=
Function
> _call_interrupts
>      15900 =C2=B1  3%     -38.2%       9833 =C2=B1 14%  interrupts.CPU102=
.RES:Reschedu
> ling_interrupts
>       3126 =C2=B1 11%    +138.6%       7460 =C2=B1 24%  interrupts.CPU103=
.CAL:Function
> _call_interrupts
>      16102 =C2=B1  3%     -37.0%      10149 =C2=B1 18%  interrupts.CPU103=
.RES:Reschedu
> ling_interrupts
>       3261 =C2=B1  6%    +124.0%       7306 =C2=B1  8%  interrupts.CPU104=
.CAL:Function
> _call_interrupts
>      16195 =C2=B1  4%     -32.7%      10892 =C2=B1 18%  interrupts.CPU104=
.RES:Reschedu
> ling_interrupts
>       3402 =C2=B1 10%    +125.1%       7659 =C2=B1 12%  interrupts.CPU105=
.CAL:Function
> _call_interrupts
>      16183 =C2=B1  5%     -38.8%       9910 =C2=B1 19%  interrupts.CPU105=
.RES:Reschedu
> ling_interrupts
>       3684 =C2=B1 14%    +100.4%       7381 =C2=B1 15%  interrupts.CPU106=
.CAL:Function
> _call_interrupts
>      15362 =C2=B1  4%     -36.6%       9744 =C2=B1 15%  interrupts.CPU106=
.RES:Reschedu
> ling_interrupts
>       4022 =C2=B1  8%     +78.6%       7181 =C2=B1 18%  interrupts.CPU107=
.CAL:Function
> _call_interrupts
>       4087 =C2=B1 26%     +25.9%       5146 =C2=B1  3%  interrupts.CPU107=
.NMI:Non-mask
> able_interrupts
>       4087 =C2=B1 26%     +25.9%       5146 =C2=B1  3%  interrupts.CPU107=
.PMI:Performa
> nce_monitoring_interrupts
>      14902 =C2=B1  7%     -29.1%      10571 =C2=B1 20%  interrupts.CPU107=
.RES:Reschedu
> ling_interrupts
>       3480 =C2=B1  6%     +95.5%       6802 =C2=B1  8%  interrupts.CPU108=
.CAL:Function
> _call_interrupts
>      12731 =C2=B1  4%     -24.1%       9667 =C2=B1  7%  interrupts.CPU108=
.RES:Reschedu
> ling_interrupts
>       3674 =C2=B1  8%    +104.5%       7515 =C2=B1 14%  interrupts.CPU109=
.CAL:Function
> _call_interrupts
>      13686 =C2=B1  4%     -37.9%       8492 =C2=B1  6%  interrupts.CPU109=
.RES:Reschedu
> ling_interrupts
>       4362 =C2=B1  7%     +60.9%       7020 =C2=B1 15%  interrupts.CPU11.=
CAL:Function_
> call_interrupts
>      11724 =C2=B1  2%     -25.1%       8785 =C2=B1  5%  interrupts.CPU11.=
RES:Reschedul
> ing_interrupts
>       3640 =C2=B1  6%     +92.4%       7005 =C2=B1 10%  interrupts.CPU110=
.CAL:Function
> _call_interrupts
>      13753 =C2=B1  4%     -38.4%       8467 =C2=B1  5%  interrupts.CPU110=
.RES:Reschedu
> ling_interrupts
>       3372          +109.6%       7069 =C2=B1  7%  interrupts.CPU111.CAL:=
Function
> _call_interrupts
>      14581 =C2=B1  3%     -35.6%       9388 =C2=B1  7%  interrupts.CPU111=
.RES:Reschedu
> ling_interrupts
>       3433 =C2=B1  7%    +128.2%       7834 =C2=B1 15%  interrupts.CPU112=
.CAL:Function
> _call_interrupts
>      15284 =C2=B1  5%     -44.4%       8503 =C2=B1  8%  interrupts.CPU112=
.RES:Reschedu
> ling_interrupts
>       3452 =C2=B1  2%    +111.6%       7306 =C2=B1  8%  interrupts.CPU113=
.CAL:Function
> _call_interrupts
>      15148 =C2=B1  5%     -37.1%       9533 =C2=B1  8%  interrupts.CPU113=
.RES:Reschedu
> ling_interrupts
>       3451 =C2=B1  6%    +116.1%       7458 =C2=B1  6%  interrupts.CPU114=
.CAL:Function
> _call_interrupts
>      13784 =C2=B1  8%     -33.8%       9126 =C2=B1  8%  interrupts.CPU114=
.RES:Reschedu
> ling_interrupts
>       3446 =C2=B1  6%    +110.8%       7265 =C2=B1  5%  interrupts.CPU115=
.CAL:Function
> _call_interrupts
>      14748 =C2=B1  4%     -36.8%       9318 =C2=B1 14%  interrupts.CPU115=
.RES:Reschedu
> ling_interrupts
>       3335 =C2=B1  5%    +122.9%       7435 =C2=B1  2%  interrupts.CPU116=
.CAL:Function
> _call_interrupts
>      15556 =C2=B1  8%     -36.0%       9953 =C2=B1  7%  interrupts.CPU116=
.RES:Reschedu
> ling_interrupts
>       3256 =C2=B1  5%    +121.2%       7202 =C2=B1  5%  interrupts.CPU117=
.CAL:Function
> _call_interrupts
>      15523 =C2=B1  5%     -39.0%       9468 =C2=B1 11%  interrupts.CPU117=
.RES:Reschedu
> ling_interrupts
>       3273 =C2=B1  7%    +138.2%       7797 =C2=B1  2%  interrupts.CPU118=
.CAL:Function
> _call_interrupts
>      15447 =C2=B1  7%     -42.6%       8864 =C2=B1  7%  interrupts.CPU118=
.RES:Reschedu
> ling_interrupts
>       3526 =C2=B1  3%    +112.7%       7501 =C2=B1  2%  interrupts.CPU119=
.CAL:Function
> _call_interrupts
>      14871           -37.0%       9364 =C2=B1  7%  interrupts.CPU119.RES:=
Reschedu
> ling_interrupts
>       4509 =C2=B1  8%     +50.1%       6768 =C2=B1  8%  interrupts.CPU12.=
CAL:Function_
> call_interrupts
>      11536 =C2=B1  4%     -24.6%       8698 =C2=B1  8%  interrupts.CPU12.=
RES:Reschedul
> ing_interrupts
>       3381 =C2=B1  6%    +109.8%       7092 =C2=B1  8%  interrupts.CPU120=
.CAL:Function
> _call_interrupts
>      14941 =C2=B1  4%     -38.5%       9184 =C2=B1 20%  interrupts.CPU120=
.RES:Reschedu
> ling_interrupts
>       3596 =C2=B1  7%    +107.2%       7451 =C2=B1  5%  interrupts.CPU121=
.CAL:Function
> _call_interrupts
>      15041 =C2=B1  6%     -38.4%       9264 =C2=B1  9%  interrupts.CPU121=
.RES:Reschedu
> ling_interrupts
>       3823 =C2=B1  7%     +96.8%       7525 =C2=B1  9%  interrupts.CPU122=
.CAL:Function
> _call_interrupts
>      14368 =C2=B1  5%     -37.6%       8972 =C2=B1 12%  interrupts.CPU122=
.RES:Reschedu
> ling_interrupts
>       3692 =C2=B1  5%     +98.0%       7310 =C2=B1  7%  interrupts.CPU123=
.CAL:Function
> _call_interrupts
>      14744           -39.7%       8896 =C2=B1 17%  interrupts.CPU123.RES:=
Reschedu
> ling_interrupts
>       3684          +105.5%       7570 =C2=B1 11%  interrupts.CPU124.CAL:=
Function
> _call_interrupts
>       4377 =C2=B1 21%     +19.7%       5240 =C2=B1  5%  interrupts.CPU124=
.NMI:Non-mask
> able_interrupts
>       4377 =C2=B1 21%     +19.7%       5240 =C2=B1  5%  interrupts.CPU124=
.PMI:Performa
> nce_monitoring_interrupts
>      15441 =C2=B1  5%     -42.1%       8939 =C2=B1  3%  interrupts.CPU124=
.RES:Reschedu
> ling_interrupts
>       3932 =C2=B1  8%     +94.2%       7638 =C2=B1  8%  interrupts.CPU125=
.CAL:Function
> _call_interrupts
>      14672 =C2=B1  7%     -38.9%       8961 =C2=B1 11%  interrupts.CPU125=
.RES:Reschedu
> ling_interrupts
>       4046 =C2=B1  3%     +92.8%       7799 =C2=B1 27%  interrupts.CPU126=
.CAL:Function
> _call_interrupts
>      13843 =C2=B1  4%     -29.3%       9786 =C2=B1 24%  interrupts.CPU126=
.RES:Reschedu
> ling_interrupts
>       3748 =C2=B1  5%    +122.0%       8320 =C2=B1 21%  interrupts.CPU127=
.CAL:Function
> _call_interrupts
>      14797 =C2=B1  5%     -39.1%       9014 =C2=B1 24%  interrupts.CPU127=
.RES:Reschedu
> ling_interrupts
>       3937 =C2=B1  8%     +93.5%       7618 =C2=B1 26%  interrupts.CPU128=
.CAL:Function
> _call_interrupts
>      14775 =C2=B1  7%     -34.6%       9666 =C2=B1 17%  interrupts.CPU128=
.RES:Reschedu
> ling_interrupts
>       3569 =C2=B1  5%    +120.9%       7885 =C2=B1 23%  interrupts.CPU129=
.CAL:Function
> _call_interrupts
>      15648 =C2=B1  2%     -37.7%       9748 =C2=B1 17%  interrupts.CPU129=
.RES:Reschedu
> ling_interrupts
>       4248 =C2=B1  3%     +60.3%       6808 =C2=B1 14%  interrupts.CPU13.=
CAL:Function_
> call_interrupts
>      11049 =C2=B1  3%     -22.8%       8525 =C2=B1  8%  interrupts.CPU13.=
RES:Reschedul
> ing_interrupts
>       3739 =C2=B1  4%    +138.1%       8903 =C2=B1 28%  interrupts.CPU130=
.CAL:Function
> _call_interrupts
>      15859 =C2=B1  4%     -34.7%      10349 =C2=B1 22%  interrupts.CPU130=
.RES:Reschedu
> ling_interrupts
>       3407 =C2=B1  9%    +132.8%       7930 =C2=B1 19%  interrupts.CPU131=
.CAL:Function
> _call_interrupts
>      16050 =C2=B1  6%     -38.2%       9925 =C2=B1 26%  interrupts.CPU131=
.RES:Reschedu
> ling_interrupts
>       3721 =C2=B1  3%    +124.7%       8360 =C2=B1 26%  interrupts.CPU132=
.CAL:Function
> _call_interrupts
>      16353 =C2=B1 10%     -39.7%       9855 =C2=B1 28%  interrupts.CPU132=
.RES:Reschedu
> ling_interrupts
>       3596 =C2=B1  5%    +126.5%       8146 =C2=B1 26%  interrupts.CPU133=
.CAL:Function
> _call_interrupts
>      15380 =C2=B1  5%     -34.6%      10055 =C2=B1 21%  interrupts.CPU133=
.RES:Reschedu
> ling_interrupts
>       3739 =C2=B1  5%    +124.4%       8391 =C2=B1 29%  interrupts.CPU134=
.CAL:Function
> _call_interrupts
>      16643 =C2=B1 10%     -39.6%      10058 =C2=B1 30%  interrupts.CPU134=
.RES:Reschedu
> ling_interrupts
>       3583 =C2=B1  5%    +127.1%       8139 =C2=B1 16%  interrupts.CPU135=
.CAL:Function
> _call_interrupts
>      15844 =C2=B1 10%     -34.5%      10380 =C2=B1 28%  interrupts.CPU135=
.RES:Reschedu
> ling_interrupts
>       3464 =C2=B1  5%    +138.6%       8266 =C2=B1 24%  interrupts.CPU136=
.CAL:Function
> _call_interrupts
>      16464 =C2=B1  4%     -43.0%       9384 =C2=B1 28%  interrupts.CPU136=
.RES:Reschedu
> ling_interrupts
>       3521 =C2=B1  6%    +116.2%       7614 =C2=B1 15%  interrupts.CPU137=
.CAL:Function
> _call_interrupts
>      16015 =C2=B1  5%     -36.2%      10216 =C2=B1 17%  interrupts.CPU137=
.RES:Reschedu
> ling_interrupts
>       3689 =C2=B1 13%    +119.2%       8086 =C2=B1 30%  interrupts.CPU138=
.CAL:Function
> _call_interrupts
>      15693 =C2=B1  4%     -38.8%       9606 =C2=B1 25%  interrupts.CPU138=
.RES:Reschedu
> ling_interrupts
>       3583 =C2=B1  5%    +114.6%       7688 =C2=B1 25%  interrupts.CPU139=
.CAL:Function
> _call_interrupts
>       5396 =C2=B1  7%     -24.1%       4095 =C2=B1 30%  interrupts.CPU139=
.NMI:Non-mask
> able_interrupts
>       5396 =C2=B1  7%     -24.1%       4095 =C2=B1 30%  interrupts.CPU139=
.PMI:Performa
> nce_monitoring_interrupts
>      15751 =C2=B1  3%     -34.5%      10312 =C2=B1 19%  interrupts.CPU139=
.RES:Reschedu
> ling_interrupts
>       4157 =C2=B1  7%     +65.2%       6870 =C2=B1 14%  interrupts.CPU14.=
CAL:Function_
> call_interrupts
>      11063 =C2=B1  3%     -23.8%       8425 =C2=B1  5%  interrupts.CPU14.=
RES:Reschedul
> ing_interrupts
>       3675 =C2=B1  8%    +115.3%       7912 =C2=B1 21%  interrupts.CPU140=
.CAL:Function
> _call_interrupts
>      15412 =C2=B1  5%     -37.8%       9590 =C2=B1 20%  interrupts.CPU140=
.RES:Reschedu
> ling_interrupts
>       3590 =C2=B1 10%    +115.7%       7743 =C2=B1 22%  interrupts.CPU141=
.CAL:Function
> _call_interrupts
>      15596 =C2=B1  4%     -33.8%      10320 =C2=B1 27%  interrupts.CPU141=
.RES:Reschedu
> ling_interrupts
>       3738 =C2=B1  5%    +109.9%       7846 =C2=B1 23%  interrupts.CPU142=
.CAL:Function
> _call_interrupts
>      15253 =C2=B1  4%     -39.8%       9182 =C2=B1 21%  interrupts.CPU142=
.RES:Reschedu
> ling_interrupts
>       4063 =C2=B1  3%     +86.7%       7584 =C2=B1 21%  interrupts.CPU143=
.CAL:Function
> _call_interrupts
>      13302 =C2=B1  2%     -41.4%       7796 =C2=B1 22%  interrupts.CPU143=
.RES:Reschedu
> ling_interrupts
>       4300 =C2=B1  9%     +59.4%       6853 =C2=B1 18%  interrupts.CPU15.=
CAL:Function_
> call_interrupts
>      11275 =C2=B1  4%     -19.2%       9105 =C2=B1  4%  interrupts.CPU15.=
RES:Reschedul
> ing_interrupts
>       4241 =C2=B1 10%     +66.1%       7043 =C2=B1 16%  interrupts.CPU16.=
CAL:Function_
> call_interrupts
>      10910 =C2=B1  4%     -22.9%       8407 =C2=B1  7%  interrupts.CPU16.=
RES:Reschedul
> ing_interrupts
>       4154 =C2=B1  6%     +65.0%       6854 =C2=B1 19%  interrupts.CPU17.=
CAL:Function_
> call_interrupts
>      11484 =C2=B1  2%     -24.2%       8704 =C2=B1 13%  interrupts.CPU17.=
RES:Reschedul
> ing_interrupts
>       5547 =C2=B1 15%     +49.8%       8309 =C2=B1 16%  interrupts.CPU18.=
CAL:Function_
> call_interrupts
>      11804 =C2=B1  5%     -27.2%       8589 =C2=B1 20%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>       4505 =C2=B1  9%     +71.6%       7732 =C2=B1 16%  interrupts.CPU19.=
CAL:Function_
> call_interrupts
>      12342 =C2=B1  5%     -31.5%       8449 =C2=B1 16%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>       4629 =C2=B1  2%     +60.0%       7409 =C2=B1  8%  interrupts.CPU2.C=
AL:Function_c
> all_interrupts
>      11216 =C2=B1  3%     -25.1%       8396 =C2=B1  8%  interrupts.CPU2.R=
ES:Rescheduli
> ng_interrupts
>       4244 =C2=B1 13%     +64.1%       6967 =C2=B1 18%  interrupts.CPU20.=
CAL:Function_
> call_interrupts
>      11723 =C2=B1  4%     -25.2%       8770 =C2=B1 16%  interrupts.CPU20.=
RES:Reschedul
> ing_interrupts
>       4046 =C2=B1  8%     +74.6%       7062 =C2=B1 20%  interrupts.CPU21.=
CAL:Function_
> call_interrupts
>      11251 =C2=B1  4%     -22.8%       8682 =C2=B1 17%  interrupts.CPU21.=
RES:Reschedul
> ing_interrupts
>       4104 =C2=B1  6%     +69.5%       6959 =C2=B1 18%  interrupts.CPU22.=
CAL:Function_
> call_interrupts
>       3904 =C2=B1 11%     +77.3%       6922 =C2=B1 17%  interrupts.CPU23.=
CAL:Function_
> call_interrupts
>      11419 =C2=B1  7%     -26.4%       8407 =C2=B1 20%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>       3894 =C2=B1  6%     +72.7%       6726 =C2=B1 19%  interrupts.CPU24.=
CAL:Function_
> call_interrupts
>      11137 =C2=B1  6%     -22.7%       8609 =C2=B1 21%  interrupts.CPU24.=
RES:Reschedul
> ing_interrupts
>       3807 =C2=B1 12%     +67.6%       6379 =C2=B1 11%  interrupts.CPU25.=
CAL:Function_
> call_interrupts
>      11159 =C2=B1  2%     -32.6%       7517 =C2=B1 15%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>       3756 =C2=B1  9%     +80.0%       6762 =C2=B1 15%  interrupts.CPU26.=
CAL:Function_
> call_interrupts
>      11288 =C2=B1  3%     -33.7%       7489 =C2=B1 12%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>       3827 =C2=B1 10%     +74.5%       6678 =C2=B1 21%  interrupts.CPU27.=
CAL:Function_
> call_interrupts
>      11224 =C2=B1  5%     -25.5%       8364 =C2=B1 19%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>       3703 =C2=B1 13%     +83.1%       6783 =C2=B1 14%  interrupts.CPU28.=
CAL:Function_
> call_interrupts
>      11910 =C2=B1 10%     -30.6%       8262 =C2=B1 17%  interrupts.CPU28.=
RES:Reschedul
> ing_interrupts
>       3683 =C2=B1 10%     +74.4%       6422 =C2=B1 19%  interrupts.CPU29.=
CAL:Function_
> call_interrupts
>      11587 =C2=B1  7%     -28.7%       8257 =C2=B1 13%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>       4061 =C2=B1  2%     +75.6%       7132 =C2=B1 13%  interrupts.CPU3.C=
AL:Function_c
> all_interrupts
>      11536 =C2=B1  4%     -32.9%       7746 =C2=B1  8%  interrupts.CPU3.R=
ES:Rescheduli
> ng_interrupts
>       3677 =C2=B1 10%     +80.3%       6630 =C2=B1 17%  interrupts.CPU30.=
CAL:Function_
> call_interrupts
>      11500 =C2=B1  7%     -31.7%       7854 =C2=B1 19%  interrupts.CPU30.=
RES:Reschedul
> ing_interrupts
>       3556 =C2=B1 10%     +76.3%       6269 =C2=B1 16%  interrupts.CPU31.=
CAL:Function_
> call_interrupts
>      11927 =C2=B1  6%     -32.1%       8093 =C2=B1 24%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>       3880 =C2=B1  7%     +68.0%       6519 =C2=B1 19%  interrupts.CPU32.=
CAL:Function_
> call_interrupts
>      11463 =C2=B1  3%     -30.7%       7944 =C2=B1 18%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>       3648 =C2=B1 15%     +75.9%       6416 =C2=B1 18%  interrupts.CPU33.=
CAL:Function_
> call_interrupts
>      11090 =C2=B1  8%     -27.7%       8019 =C2=B1 14%  interrupts.CPU33.=
RES:Reschedul
> ing_interrupts
>       3924 =C2=B1  8%     +64.2%       6444 =C2=B1 19%  interrupts.CPU34.=
CAL:Function_
> call_interrupts
>      11190 =C2=B1  6%     -20.6%       8882 =C2=B1 16%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>       3981 =C2=B1  3%     +62.6%       6473 =C2=B1 19%  interrupts.CPU35.=
CAL:Function_
> call_interrupts
>      11376 =C2=B1  6%     -28.6%       8117 =C2=B1 17%  interrupts.CPU35.=
RES:Reschedul
> ing_interrupts
>       5232 =C2=B1  3%     +61.3%       8439 =C2=B1 10%  interrupts.CPU36.=
CAL:Function_
> call_interrupts
>      12049 =C2=B1  7%     -33.0%       8076 =C2=B1  6%  interrupts.CPU36.=
RES:Reschedul
> ing_interrupts
>       4684 =C2=B1  6%     +65.4%       7748 =C2=B1  4%  interrupts.CPU37.=
CAL:Function_
> call_interrupts
>      11799 =C2=B1  6%     -33.6%       7836 =C2=B1 16%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>       4382 =C2=B1  6%     +69.0%       7407 =C2=B1  4%  interrupts.CPU38.=
CAL:Function_
> call_interrupts
>      11762 =C2=B1  9%     -30.9%       8129 =C2=B1 10%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>       4089 =C2=B1  4%     +68.1%       6875 =C2=B1  9%  interrupts.CPU39.=
CAL:Function_
> call_interrupts
>       3245 =C2=B1 24%     -18.7%       2638 =C2=B1 26%  interrupts.CPU39.=
NMI:Non-maska
> ble_interrupts
>       3245 =C2=B1 24%     -18.7%       2638 =C2=B1 26%  interrupts.CPU39.=
PMI:Performan
> ce_monitoring_interrupts
>      11403 =C2=B1 10%     -33.2%       7613 =C2=B1 13%  interrupts.CPU39.=
RES:Reschedul
> ing_interrupts
>       4297 =C2=B1  2%     +69.2%       7271 =C2=B1 11%  interrupts.CPU4.C=
AL:Function_c
> all_interrupts
>      11042 =C2=B1  3%     -25.6%       8215 =C2=B1  4%  interrupts.CPU4.R=
ES:Rescheduli
> ng_interrupts
>       4186 =C2=B1  7%     +67.4%       7006 =C2=B1  5%  interrupts.CPU40.=
CAL:Function_
> call_interrupts
>      10088 =C2=B1 11%     -22.3%       7833 =C2=B1 14%  interrupts.CPU40.=
RES:Reschedul
> ing_interrupts
>       4142 =C2=B1  7%     +66.9%       6912 =C2=B1  6%  interrupts.CPU41.=
CAL:Function_
> call_interrupts
>      11096 =C2=B1 12%     -33.0%       7433 =C2=B1  7%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>       4022 =C2=B1  7%     +71.3%       6892 =C2=B1  5%  interrupts.CPU42.=
CAL:Function_
> call_interrupts
>      11657 =C2=B1  4%     -33.5%       7748 =C2=B1 11%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>       3999 =C2=B1  3%     +70.9%       6835 =C2=B1  7%  interrupts.CPU43.=
CAL:Function_
> call_interrupts
>      11295 =C2=B1  4%     -35.0%       7347 =C2=B1  5%  interrupts.CPU43.=
RES:Reschedul
> ing_interrupts
>       3961 =C2=B1  5%     +62.2%       6425 =C2=B1  7%  interrupts.CPU44.=
CAL:Function_
> call_interrupts
>      11562 =C2=B1  3%     -31.4%       7929 =C2=B1  7%  interrupts.CPU44.=
RES:Reschedul
> ing_interrupts
>       3980 =C2=B1  4%     +77.1%       7049 =C2=B1 10%  interrupts.CPU45.=
CAL:Function_
> call_interrupts
>      11151 =C2=B1  4%     -30.3%       7767 =C2=B1  3%  interrupts.CPU45.=
RES:Reschedul
> ing_interrupts
>       3852 =C2=B1  8%     +71.6%       6609 =C2=B1  9%  interrupts.CPU46.=
CAL:Function_
> call_interrupts
>       2497 =C2=B1 29%     +60.0%       3995 =C2=B1 29%  interrupts.CPU46.=
NMI:Non-maska
> ble_interrupts
>       2497 =C2=B1 29%     +60.0%       3995 =C2=B1 29%  interrupts.CPU46.=
PMI:Performan
> ce_monitoring_interrupts
>      11205 =C2=B1  6%     -29.7%       7875 =C2=B1 12%  interrupts.CPU46.=
RES:Reschedul
> ing_interrupts
>       4121 =C2=B1  9%     +59.0%       6553 =C2=B1  4%  interrupts.CPU47.=
CAL:Function_
> call_interrupts
>      12440 =C2=B1 24%     -38.1%       7695 =C2=B1  4%  interrupts.CPU47.=
RES:Reschedul
> ing_interrupts
>       3989 =C2=B1  8%     +61.5%       6441 =C2=B1 10%  interrupts.CPU48.=
CAL:Function_
> call_interrupts
>      11188 =C2=B1  5%     -31.7%       7641 =C2=B1 12%  interrupts.CPU48.=
RES:Reschedul
> ing_interrupts
>       3626 =C2=B1  6%     +76.2%       6387 =C2=B1  3%  interrupts.CPU49.=
CAL:Function_
> call_interrupts
>      10995 =C2=B1  3%     -30.7%       7616 =C2=B1 11%  interrupts.CPU49.=
RES:Reschedul
> ing_interrupts
>       4635 =C2=B1 13%     +49.3%       6923 =C2=B1 11%  interrupts.CPU5.C=
AL:Function_c
> all_interrupts
>      12111 =C2=B1 12%     -31.6%       8288 =C2=B1  9%  interrupts.CPU5.R=
ES:Rescheduli
> ng_interrupts
>       3988 =C2=B1  6%     +73.4%       6913 =C2=B1  5%  interrupts.CPU50.=
CAL:Function_
> call_interrupts
>      11280 =C2=B1 10%     -31.3%       7749 =C2=B1  9%  interrupts.CPU50.=
RES:Reschedul
> ing_interrupts
>       3982 =C2=B1  5%     +62.3%       6465 =C2=B1  5%  interrupts.CPU51.=
CAL:Function_
> call_interrupts
>      11049 =C2=B1  7%     -28.4%       7911 =C2=B1  3%  interrupts.CPU51.=
RES:Reschedul
> ing_interrupts
>       3735 =C2=B1  4%     +76.2%       6582 =C2=B1  4%  interrupts.CPU52.=
CAL:Function_
> call_interrupts
>      10603 =C2=B1  7%     -25.8%       7866 =C2=B1  7%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>       4102 =C2=B1  5%     +64.4%       6742 =C2=B1  9%  interrupts.CPU53.=
CAL:Function_
> call_interrupts
>      10902 =C2=B1  7%     -31.7%       7447 =C2=B1  6%  interrupts.CPU53.=
RES:Reschedul
> ing_interrupts
>       5497 =C2=B1  2%     +63.2%       8971 =C2=B1 19%  interrupts.CPU54.=
CAL:Function_
> call_interrupts
>      11852 =C2=B1  2%     -32.4%       8016 =C2=B1 26%  interrupts.CPU54.=
RES:Reschedul
> ing_interrupts
>       4533 =C2=B1  4%     +79.2%       8124 =C2=B1 19%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>      11745           -35.0%       7628 =C2=B1 25%  interrupts.CPU55.RES:R=
eschedul
> ing_interrupts
>       4339 =C2=B1  3%     +79.5%       7789 =C2=B1 20%  interrupts.CPU56.=
CAL:Function_
> call_interrupts
>      12506 =C2=B1  5%     -35.4%       8078 =C2=B1 28%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>       4289 =C2=B1  4%     +94.1%       8326 =C2=B1 20%  interrupts.CPU57.=
CAL:Function_
> call_interrupts
>       4142 =C2=B1  4%     +76.8%       7322 =C2=B1 18%  interrupts.CPU58.=
CAL:Function_
> call_interrupts
>      11691 =C2=B1  3%     -29.4%       8248 =C2=B1 23%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>       4133 =C2=B1  4%     +92.1%       7942 =C2=B1 18%  interrupts.CPU59.=
CAL:Function_
> call_interrupts
>      12200 =C2=B1  3%     -38.0%       7564 =C2=B1 23%  interrupts.CPU59.=
RES:Reschedul
> ing_interrupts
>       4275 =C2=B1  3%     +62.9%       6963 =C2=B1 10%  interrupts.CPU6.C=
AL:Function_c
> all_interrupts
>      10993 =C2=B1  5%     -27.6%       7955 =C2=B1  5%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>       4085 =C2=B1  4%     +90.4%       7777 =C2=B1 20%  interrupts.CPU60.=
CAL:Function_
> call_interrupts
>      11203 =C2=B1  8%     -30.2%       7817 =C2=B1 20%  interrupts.CPU60.=
RES:Reschedul
> ing_interrupts
>       3990 =C2=B1  6%     +91.6%       7643 =C2=B1 19%  interrupts.CPU61.=
CAL:Function_
> call_interrupts
>      11525 =C2=B1  4%     -31.7%       7866 =C2=B1 24%  interrupts.CPU61.=
RES:Reschedul
> ing_interrupts
>       3831 =C2=B1  2%     +91.0%       7318 =C2=B1 17%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>      11485 =C2=B1  4%     -29.1%       8139 =C2=B1 22%  interrupts.CPU62.=
RES:Reschedul
> ing_interrupts
>       4099 =C2=B1  5%     +83.5%       7523 =C2=B1 24%  interrupts.CPU63.=
CAL:Function_
> call_interrupts
>      12337 =C2=B1  4%     -30.3%       8598 =C2=B1 22%  interrupts.CPU63.=
RES:Reschedul
> ing_interrupts
>       3889           +84.8%       7188 =C2=B1 16%  interrupts.CPU64.CAL:F=
unction_
> call_interrupts
>      11519 =C2=B1  2%     -28.3%       8263 =C2=B1 23%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>       3644 =C2=B1  5%    +100.7%       7314 =C2=B1 22%  interrupts.CPU65.=
CAL:Function_
> call_interrupts
>      12153 =C2=B1  3%     -31.2%       8366 =C2=B1 20%  interrupts.CPU65.=
RES:Reschedul
> ing_interrupts
>       3899 =C2=B1  7%     +95.0%       7601 =C2=B1 22%  interrupts.CPU66.=
CAL:Function_
> call_interrupts
>      12312 =C2=B1  4%     -32.5%       8315 =C2=B1 24%  interrupts.CPU66.=
RES:Reschedul
> ing_interrupts
>       4040 =C2=B1  3%     +78.1%       7198 =C2=B1 18%  interrupts.CPU67.=
CAL:Function_
> call_interrupts
>      11975 =C2=B1  6%     -30.0%       8389 =C2=B1 18%  interrupts.CPU67.=
RES:Reschedul
> ing_interrupts
>       4118 =C2=B1  4%     +88.5%       7762 =C2=B1 15%  interrupts.CPU68.=
CAL:Function_
> call_interrupts
>      12033           -29.9%       8430 =C2=B1 21%  interrupts.CPU68.RES:R=
eschedul
> ing_interrupts
>       3759 =C2=B1  6%    +100.3%       7532 =C2=B1 20%  interrupts.CPU69.=
CAL:Function_
> call_interrupts
>      12265 =C2=B1  6%     -37.8%       7625 =C2=B1 15%  interrupts.CPU69.=
RES:Reschedul
> ing_interrupts
>       4275 =C2=B1  7%     +55.9%       6665 =C2=B1  8%  interrupts.CPU7.C=
AL:Function_c
> all_interrupts
>       4840 =C2=B1  8%     -33.5%       3217 =C2=B1 34%  interrupts.CPU7.N=
MI:Non-maskab
> le_interrupts
>       4840 =C2=B1  8%     -33.5%       3217 =C2=B1 34%  interrupts.CPU7.P=
MI:Performanc
> e_monitoring_interrupts
>      11313           -28.5%       8084 =C2=B1 12%  interrupts.CPU7.RES:Re=
scheduli
> ng_interrupts
>       4282 =C2=B1  4%     +82.1%       7799 =C2=B1 14%  interrupts.CPU70.=
CAL:Function_
> call_interrupts
>      11818 =C2=B1 10%     -31.9%       8053 =C2=B1 21%  interrupts.CPU70.=
RES:Reschedul
> ing_interrupts
>       4220           +75.4%       7402 =C2=B1 16%  interrupts.CPU71.CAL:F=
unction_
> call_interrupts
>       2792 =C2=B1 34%     +63.1%       4555 =C2=B1  7%  interrupts.CPU71.=
NMI:Non-maska
> ble_interrupts
>       2792 =C2=B1 34%     +63.1%       4555 =C2=B1  7%  interrupts.CPU71.=
PMI:Performan
> ce_monitoring_interrupts
>      12435 =C2=B1  9%     -32.2%       8430 =C2=B1 19%  interrupts.CPU71.=
RES:Reschedul
> ing_interrupts
>       4462 =C2=B1  8%     +75.3%       7821 =C2=B1 22%  interrupts.CPU72.=
CAL:Function_
> call_interrupts
>       4955 =C2=B1  4%     -19.0%       4011 =C2=B1 20%  interrupts.CPU72.=
NMI:Non-maska
> ble_interrupts
>       4955 =C2=B1  4%     -19.0%       4011 =C2=B1 20%  interrupts.CPU72.=
PMI:Performan
> ce_monitoring_interrupts
>      13460 =C2=B1  6%     -21.9%      10517 =C2=B1  3%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>       4037 =C2=B1  2%     +90.6%       7697 =C2=B1 19%  interrupts.CPU73.=
CAL:Function_
> call_interrupts
>      13625 =C2=B1  6%     -22.9%      10505 =C2=B1  5%  interrupts.CPU73.=
RES:Reschedul
> ing_interrupts
>       3982 =C2=B1  6%    +102.3%       8054 =C2=B1 19%  interrupts.CPU74.=
CAL:Function_
> call_interrupts
>       4071 =C2=B1 25%     +28.7%       5239 =C2=B1  4%  interrupts.CPU74.=
NMI:Non-maska
> ble_interrupts
>       4071 =C2=B1 25%     +28.7%       5239 =C2=B1  4%  interrupts.CPU74.=
PMI:Performan
> ce_monitoring_interrupts
>      14272 =C2=B1  3%     -28.7%      10176 =C2=B1  9%  interrupts.CPU74.=
RES:Reschedul
> ing_interrupts
>       3811 =C2=B1 13%    +106.3%       7861 =C2=B1 20%  interrupts.CPU75.=
CAL:Function_
> call_interrupts
>      14574 =C2=B1  2%     -29.6%      10260 =C2=B1  5%  interrupts.CPU75.=
RES:Reschedul
> ing_interrupts
>       3730 =C2=B1  9%    +100.1%       7463 =C2=B1 18%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>      15610 =C2=B1  4%     -34.6%      10213 =C2=B1  8%  interrupts.CPU76.=
RES:Reschedul
> ing_interrupts
>       3588 =C2=B1  8%    +107.1%       7431 =C2=B1 17%  interrupts.CPU77.=
CAL:Function_
> call_interrupts
>      15243 =C2=B1  3%     -30.8%      10548 =C2=B1  8%  interrupts.CPU77.=
RES:Reschedul
> ing_interrupts
>       3567 =C2=B1  8%    +107.2%       7391 =C2=B1 16%  interrupts.CPU78.=
CAL:Function_
> call_interrupts
>      15536 =C2=B1  3%     -31.1%      10698 =C2=B1  7%  interrupts.CPU78.=
RES:Reschedul
> ing_interrupts
>      71.75 =C2=B1 53%     -59.9%      28.75 =C2=B1 55%  interrupts.CPU78.=
TLB:TLB_shoot
> downs
>       3722 =C2=B1  9%    +104.9%       7629 =C2=B1 15%  interrupts.CPU79.=
CAL:Function_
> call_interrupts
>      14641 =C2=B1  2%     -29.6%      10309 =C2=B1  7%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>       4305 =C2=B1  5%     +52.8%       6580 =C2=B1 10%  interrupts.CPU8.C=
AL:Function_c
> all_interrupts
>      10673 =C2=B1  2%     -15.8%       8985 =C2=B1  4%  interrupts.CPU8.R=
ES:Rescheduli
> ng_interrupts
>       3637 =C2=B1  7%    +103.1%       7389 =C2=B1 22%  interrupts.CPU80.=
CAL:Function_
> call_interrupts
>      15435 =C2=B1  5%     -34.8%      10060 =C2=B1  4%  interrupts.CPU80.=
RES:Reschedul
> ing_interrupts
>       3710 =C2=B1  3%     +73.9%       6453 =C2=B1 10%  interrupts.CPU81.=
CAL:Function_
> call_interrupts
>      15193 =C2=B1  2%     -28.0%      10941 =C2=B1  2%  interrupts.CPU81.=
RES:Reschedul
> ing_interrupts
>       3632 =C2=B1 10%     +99.6%       7248 =C2=B1 14%  interrupts.CPU82.=
CAL:Function_
> call_interrupts
>       5312 =C2=B1 10%     -39.7%       3203 =C2=B1 38%  interrupts.CPU82.=
NMI:Non-maska
> ble_interrupts
>       5312 =C2=B1 10%     -39.7%       3203 =C2=B1 38%  interrupts.CPU82.=
PMI:Performan
> ce_monitoring_interrupts
>      14933           -30.2%      10426 =C2=B1  7%  interrupts.CPU82.RES:R=
eschedul
> ing_interrupts
>       3543 =C2=B1 10%    +109.7%       7431 =C2=B1 18%  interrupts.CPU83.=
CAL:Function_
> call_interrupts
>      15475 =C2=B1  4%     -33.9%      10226 =C2=B1  4%  interrupts.CPU83.=
RES:Reschedul
> ing_interrupts
>       3653 =C2=B1  6%     +99.0%       7271 =C2=B1 19%  interrupts.CPU84.=
CAL:Function_
> call_interrupts
>      14866           -29.5%      10474 =C2=B1  4%  interrupts.CPU84.RES:R=
eschedul
> ing_interrupts
>       3698 =C2=B1  9%     +92.0%       7100 =C2=B1 20%  interrupts.CPU85.=
CAL:Function_
> call_interrupts
>      15330 =C2=B1  2%     -29.8%      10759 =C2=B1  3%  interrupts.CPU85.=
RES:Reschedul
> ing_interrupts
>       3844 =C2=B1  8%     +96.8%       7567 =C2=B1 21%  interrupts.CPU86.=
CAL:Function_
> call_interrupts
>      15061 =C2=B1  3%     -29.5%      10616 =C2=B1 12%  interrupts.CPU86.=
RES:Reschedul
> ing_interrupts
>       3969 =C2=B1 15%     +74.8%       6939 =C2=B1 13%  interrupts.CPU87.=
CAL:Function_
> call_interrupts
>      15159 =C2=B1  7%     -28.6%      10822 =C2=B1  8%  interrupts.CPU87.=
RES:Reschedul
> ing_interrupts
>       3847 =C2=B1 10%     +93.7%       7451 =C2=B1 19%  interrupts.CPU88.=
CAL:Function_
> call_interrupts
>      14690 =C2=B1  2%     -29.2%      10402 =C2=B1  9%  interrupts.CPU88.=
RES:Reschedul
> ing_interrupts
>       3983 =C2=B1 13%    +101.4%       8020 =C2=B1 20%  interrupts.CPU89.=
CAL:Function_
> call_interrupts
>      14481 =C2=B1  6%     -29.5%      10203 =C2=B1  9%  interrupts.CPU89.=
RES:Reschedul
> ing_interrupts
>       4164 =C2=B1  9%     +73.2%       7210 =C2=B1 26%  interrupts.CPU9.C=
AL:Function_c
> all_interrupts
>      11502 =C2=B1  4%     -17.5%       9492 =C2=B1  6%  interrupts.CPU9.R=
ES:Rescheduli
> ng_interrupts
>       3428 =C2=B1  6%    +100.1%       6858 =C2=B1 18%  interrupts.CPU90.=
CAL:Function_
> call_interrupts
>      13999 =C2=B1  8%     -30.4%       9746 =C2=B1 15%  interrupts.CPU90.=
RES:Reschedul
> ing_interrupts
>       3564 =C2=B1  4%     +97.2%       7027 =C2=B1 16%  interrupts.CPU91.=
CAL:Function_
> call_interrupts
>      14546 =C2=B1  4%     -36.0%       9302 =C2=B1 20%  interrupts.CPU91.=
RES:Reschedul
> ing_interrupts
>       3941 =C2=B1  6%     +76.0%       6936 =C2=B1 19%  interrupts.CPU92.=
CAL:Function_
> call_interrupts
>      14844 =C2=B1  6%     -34.2%       9773 =C2=B1 15%  interrupts.CPU92.=
RES:Reschedul
> ing_interrupts
>       3347 =C2=B1  7%    +102.9%       6792 =C2=B1 20%  interrupts.CPU93.=
CAL:Function_
> call_interrupts
>      15141 =C2=B1 10%     -38.9%       9246 =C2=B1 20%  interrupts.CPU93.=
RES:Reschedul
> ing_interrupts
>       3774 =C2=B1  8%     +83.4%       6923 =C2=B1 18%  interrupts.CPU94.=
CAL:Function_
> call_interrupts
>      15238 =C2=B1 11%     -33.0%      10207 =C2=B1 14%  interrupts.CPU94.=
RES:Reschedul
> ing_interrupts
>       3351 =C2=B1 10%    +120.4%       7385 =C2=B1 20%  interrupts.CPU95.=
CAL:Function_
> call_interrupts
>      15894 =C2=B1  5%     -37.2%       9987 =C2=B1 15%  interrupts.CPU95.=
RES:Reschedul
> ing_interrupts
>       3455 =C2=B1 12%     +93.2%       6676 =C2=B1 16%  interrupts.CPU96.=
CAL:Function_
> call_interrupts
>      15949 =C2=B1  9%     -33.4%      10614 =C2=B1 19%  interrupts.CPU96.=
RES:Reschedul
> ing_interrupts
>       3456 =C2=B1  6%    +110.1%       7262 =C2=B1 19%  interrupts.CPU97.=
CAL:Function_
> call_interrupts
>       4276 =C2=B1 29%     +22.8%       5250 =C2=B1  6%  interrupts.CPU97.=
NMI:Non-maska
> ble_interrupts
>       4276 =C2=B1 29%     +22.8%       5250 =C2=B1  6%  interrupts.CPU97.=
PMI:Performan
> ce_monitoring_interrupts
>      16089 =C2=B1  3%     -32.7%      10835 =C2=B1 16%  interrupts.CPU97.=
RES:Reschedul
> ing_interrupts
>       3709 =C2=B1 11%    +104.4%       7580 =C2=B1 20%  interrupts.CPU98.=
CAL:Function_
> call_interrupts
>      17700 =C2=B1 20%     -42.5%      10177 =C2=B1 19%  interrupts.CPU98.=
RES:Reschedul
> ing_interrupts
>       3477 =C2=B1 16%    +114.3%       7451 =C2=B1 10%  interrupts.CPU99.=
CAL:Function_
> call_interrupts
>      17887 =C2=B1 20%     -43.7%      10073 =C2=B1 10%  interrupts.CPU99.=
RES:Reschedul
> ing_interrupts
>    1922458 =C2=B1  3%     -32.5%    1297826 =C2=B1  6%  interrupts.RES:Re=
scheduling_in
> terrupts
>       3.06            -0.9        2.18 =C2=B1  8%  perf-profile.calltrace=
.cycles-
> pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>       2.99            -0.9        2.11 =C2=B1  8%  perf-profile.calltrace=
.cycles-
> pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       3.25            -0.7        2.55 =C2=B1  7%  perf-profile.calltrace=
.cycles-
> pp.__schedule.schedule.schedule_timeout.sctp_skb_recv_datagram.sctp_recvm=
sg
>       6.43            -0.6        5.81 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.skb_release_all.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp_cmd_int=
erp
> reter
>       6.43            -0.6        5.81 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.skb_release_head_state.skb_release_all.consume_skb.sctp_chunk_put.sctp=
_ou
> tq_sack
>       3.62            -0.6        3.05 =C2=B1  5%  perf-profile.calltrace=
.cycles-
> pp.schedule.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_rec=
vms
> g
>       3.68            -0.6        3.13 =C2=B1  5%  perf-profile.calltrace=
.cycles-
> pp.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg.____=
sys
> _recvmsg
>       6.10            -0.5        5.59 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.sctp_wfree.skb_release_head_state.skb_release_all.consume_skb.sctp_chu=
nk_
> put
>       4.42            -0.5        3.92 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_com=
mon
> _lock.__sctp_write_space
>       4.47            -0.5        3.98 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.__sctp=
_wr
> ite_space.sctp_wfree
>       1.58            -0.5        1.10 =C2=B1  9%  perf-profile.calltrace=
.cycles-
> pp.pick_next_task_fair.__schedule.schedule_idle.do_idle.cpu_startup_entry
>       5.21            -0.4        4.77 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.__sctp_write_space.sctp_wfree.skb_release_head_state.skb_release_all.c=
ons
> ume_skb
>       4.95            -0.4        4.52 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.__wake_up_common_lock.__sctp_write_space.sctp_wfree.skb_release_head_s=
tat
> e.skb_release_all
>       1.72            -0.4        1.32 =C2=B1 13%  perf-profile.calltrace=
.cycles-
> pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_com=
mon
> .__wake_up_common_lock
>       0.82 =C2=B1  2%      -0.4        0.43 =C2=B1 58%  perf-profile.call=
trace.cycles-
> pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
>       4.56            -0.4        4.17 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.__wake_up_common.__wake_up_common_lock.__sctp_write_space.sctp_wfree.s=
kb_
> release_head_state
>       1.44 =C2=B1  2%      -0.4        1.06 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
>       1.15            -0.4        0.79 =C2=B1  9%  perf-profile.calltrace=
.cycles-
> pp.set_next_entity.pick_next_task_fair.__schedule.schedule_idle.do_idle
>       1.72 =C2=B1  5%      -0.4        1.35 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.sctp_ulpq_tail_data.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.=
sct
> p_rcv
>       1.67            -0.4        1.30 =C2=B1 13%  perf-profile.calltrace=
.cycles-
> pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_wake_func=
tio
> n.__wake_up_common
>       1.62 =C2=B1  2%      -0.3        1.27 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.sctp_skb_recv_d=
ata
> gram
>       0.90            -0.3        0.57        perf-profile.calltrace.cycl=
es-
> pp.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_=
com
> mon.__wake_up_common_lock
>       1.34            -0.3        1.03 =C2=B1 12%  perf-profile.calltrace=
.cycles-
> pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autor=
emo
> ve_wake_function
>       1.19 =C2=B1  8%      -0.3        0.89 =C2=B1 13%  perf-profile.call=
trace.cycles-
> pp.sctp_ulpevent_make_rcvmsg.sctp_ulpq_tail_data.sctp_cmd_interpreter.sct=
p_d
> o_sm.sctp_assoc_bh_rcv
>       7.35            -0.3        7.05        perf-profile.calltrace.cycl=
es-
> pp.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_ass=
oc_
> bh_rcv
>       5.77            -0.3        5.48 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sy=
s_r
> ecvmsg
>       7.06            -0.3        6.78        perf-profile.calltrace.cycl=
es-
> pp.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpreter.sctp_do=
_sm
>       0.64 =C2=B1  5%      -0.2        0.43 =C2=B1 57%  perf-profile.call=
trace.cycles-
> pp.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.i=
p_o
> utput
>       0.60            -0.2        0.40 =C2=B1 57%  perf-profile.calltrace=
.cycles-
> pp.sctp_queue_purge_ulpevents.sctp_ulpq_tail_event.do_ulpq_tail_event.sct=
p_c
> md_interpreter.sctp_do_sm
>       1.03            -0.2        0.82 =C2=B1  8%  perf-profile.calltrace=
.cycles-
> pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit.sctp_pack=
et_
> transmit
>       1.53            -0.2        1.34 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startu=
p_6
> 4_no_verify
>       0.88 =C2=B1  2%      -0.1        0.76 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.do_ulpq_tail_event.sctp_cmd_interpreter.sctp_do_sm.sctp_cmd_interprete=
r.s
> ctp_do_sm
>       0.72 =C2=B1  4%      -0.1        0.59 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_=
que
> ue_xmit
>       0.81 =C2=B1  4%      -0.1        0.71 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.sctp_ulpevent_make_sender_dry_event.sctp_sf_do_no_pending_tsn.sctp_do_=
sm.
> sctp_cmd_interpreter.sctp_do_sm
>       0.76 =C2=B1  2%      -0.1        0.66 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.sctp_ulpq_tail_event.do_ulpq_tail_event.sctp_cmd_interpreter.sctp_do_s=
m.s
> ctp_cmd_interpreter
>       0.83 =C2=B1  3%      -0.1        0.74 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.sctp_sf_do_no_pending_tsn.sctp_do_sm.sctp_cmd_interpreter.sctp_do_sm.s=
ctp
> _assoc_bh_rcv
>       0.64            -0.1        0.55 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get_sleep_leng=
th.
> menu_select.do_idle
>       0.75            -0.1        0.67 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_idle.cp=
u_s
> tartup_entry
>       0.96            -0.1        0.89 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_entry.start=
_se
> condary
>       0.99            +0.0        1.04 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.sctp_packet_pack.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpr=
ete
> r.sctp_do_sm
>       0.64 =C2=B1  2%      +0.1        0.70 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.sctp_chunk_put.sctp_packet_pack.sctp_packet_transmit.sctp_outq_flush.s=
ctp
> _cmd_interpreter
>       0.80            +0.1        0.88 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.__skb_datagram_iter.skb_copy_datagram_iter.sctp_recvmsg.inet_recvmsg._=
___
> sys_recvmsg
>       0.81            +0.1        0.89 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.skb_copy_datagram_iter.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sy=
s_r
> ecvmsg
>       0.55 =C2=B1  2%      +0.1        0.64 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.sctp_user_addto_chunk.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp=
_se
> ndmsg.sock_sendmsg
>       0.73 =C2=B1  2%      +0.1        0.82 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_fro=
m_u
> ser.sctp_sendmsg_to_asoc
>       1.19            +0.1        1.28 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.sctp_transport_reset_t3_rtx.sctp_outq_flush.sctp_cmd_interpreter.sctp_=
do_
> sm.sctp_primitive_SEND
>       0.67 =C2=B1  4%      +0.1        0.77        perf-profile.calltrace=
.cycles-
> pp.sock_kmalloc.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64
>       1.72 =C2=B1  2%      +0.1        1.83        perf-profile.calltrace=
.cycles-
> pp.sctp_chunk_put.sctp_ulpevent_free.sctp_recvmsg.inet_recvmsg.____sys_re=
cvm
> sg
>       0.99 =C2=B1  2%      +0.1        1.11 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_=
sen
> dmsg_to_asoc.sctp_sendmsg
>       1.28            +0.1        1.40 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.s=
ctp
> _sendmsg.sock_sendmsg
>       0.76 =C2=B1  2%      +0.1        0.89 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.__alloc_skb.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.=
sct
> p_do_sm
>       0.55            +0.1        0.69 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.mod_timer.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_rcv
>       0.64            +0.1        0.78 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp._sctp_make_chunk.sctp_make_sack.sctp_packet_append_chunk.sctp_packet_t=
ran
> smit_chunk.sctp_outq_flush
>       1.74            +0.1        1.89        perf-profile.calltrace.cycl=
es-
> pp.sctp_check_transmitted.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.=
sct
> p_assoc_bh_rcv
>       0.78 =C2=B1  2%      +0.2        0.94 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.mod_timer.sctp_transport_reset_t3_rtx.sctp_outq_flush.sctp_cmd_interpr=
ete
> r.sctp_do_sm
>       1.51 =C2=B1  2%      +0.2        1.67 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.sctp_outq_select_transport.sctp_outq_flush.sctp_cmd_interpreter.sctp_d=
o_s
> m.sctp_primitive_SEND
>       0.74            +0.2        0.90 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.kfree_skb.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sys_recvmsg
>      11.83            +0.2       12.00        perf-profile.calltrace.cycl=
es-
> pp.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry_SYSCA=
LL_
> 64_after_hwframe
>       0.57 =C2=B1  2%      +0.2        0.74 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.lock_timer_base.mod_timer.sctp_transport_reset_t3_rtx.sctp_outq_flush.=
sct
> p_cmd_interpreter
>       0.52 =C2=B1  2%      +0.2        0.71 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.kmem_cache_free.sctp_ulpevent_free.sctp_recvmsg.inet_recvmsg.____sys_r=
ecv
> msg
>       0.66 =C2=B1  2%      +0.2        0.86 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.sctp_chunk_free.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_as=
soc
> _bh_rcv
>       0.92 =C2=B1  5%      +0.2        1.13 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.lock_sock_nested.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg.____=
sys
> _recvmsg
>      11.18            +0.2       11.38        perf-profile.calltrace.cycl=
es-
> pp.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_=
rcv
>       0.82 =C2=B1  6%      +0.2        1.03 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock_bh.lock_sock_nested.sctp_skb_recv_datagram.sctp_recvmsg=
.in
> et_recvmsg
>       0.38 =C2=B1 57%      +0.2        0.60 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.__check_object_size.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_sy=
sca
> ll_64
>       2.60            +0.2        2.82        perf-profile.calltrace.cycl=
es-
> pp.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg.=
___
> _sys_sendmsg
>      11.36            +0.2       11.60        perf-profile.calltrace.cycl=
es-
> pp.inet_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_syscall_64
>      11.23            +0.3       11.50        perf-profile.calltrace.cycl=
es-
> pp.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg
>       2.49            +0.3        2.77        perf-profile.calltrace.cycl=
es-
> pp.sctp_ulpevent_free.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sys_re=
cvm
> sg
>       2.81            +0.3        3.12 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.sctp_packet_transmit_chunk.sctp_outq_flush.sctp_cmd_interpreter.sctp_d=
o_s
> m.sctp_primitive_SEND
>       2.65            +0.3        2.98 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.sctp_packet_append_chunk.sctp_packet_transmit_chunk.sctp_outq_flush.sc=
tp_
> cmd_interpreter.sctp_do_sm
>       0.12 =C2=B1173%      +0.4        0.55        perf-profile.calltrace=
.cycles-
> pp.sctp_sf_eat_sack_6_2.sctp_do_sm.sctp_assoc_bh_rcv.sctp_rcv.ip_protocol=
_de
> liver_rcu
>       1.42            +0.4        1.84 =C2=B1  5%  perf-profile.calltrace=
.cycles-
> pp.sctp_make_sack.sctp_packet_append_chunk.sctp_packet_transmit_chunk.sct=
p_o
> utq_flush.sctp_cmd_interpreter
>      42.61            +0.4       43.04        perf-profile.calltrace.cycl=
es-
> pp.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      40.13            +0.4       40.56        perf-profile.calltrace.cycl=
es-
> pp.sock_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64
>       0.12 =C2=B1173%      +0.4        0.57 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.prepare_to_wait_exclusive.sctp_skb_recv_datagram.sctp_recvmsg.inet_rec=
vms
> g.____sys_recvmsg
>      42.40            +0.5       42.86        perf-profile.calltrace.cycl=
es-
> pp.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
>      39.87            +0.5       40.35        perf-profile.calltrace.cycl=
es-
> pp.sctp_sendmsg.sock_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg
>      55.52            +0.5       56.01        perf-profile.calltrace.cycl=
es-
> pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00            +0.5        0.52 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.skb_release_head_state.skb_release_all.consume_skb.sctp_chunk_put.sctp=
_ul
> pevent_free
>      18.25            +0.5       18.78        perf-profile.calltrace.cycl=
es-
> pp.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_=
sen
> dmsg
>       0.00            +0.5        0.53 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.skb_release_all.consume_skb.sctp_chunk_put.sctp_ulpevent_free.sctp_rec=
vms
> g
>      19.24            +0.5       19.77        perf-profile.calltrace.cycl=
es-
> pp.sctp_cmd_interpreter.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg_to_as=
oc.
> sctp_sendmsg
>      41.79            +0.5       42.34        perf-profile.calltrace.cycl=
es-
> pp.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCA=
LL_
> 64_after_hwframe
>       0.00            +0.6        0.58 =C2=B1  5%  perf-profile.calltrace=
.cycles-
> pp.__slab_free.kmem_cache_free.sctp_ulpevent_free.sctp_recvmsg.inet_recvm=
sg
>       0.00            +0.6        0.59 =C2=B1  8%  perf-profile.calltrace=
.cycles-
> pp.__slab_free.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpr=
ete
> r
>      39.28            +0.6       39.90        perf-profile.calltrace.cycl=
es-
> pp.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg.____sys_sendmsg.___sys_=
sen
> dmsg
>       0.00            +0.8        0.76 =C2=B1 12%  perf-profile.calltrace=
.cycles-
> pp.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_=
com
> mon.__wake_up_common_lock
>       0.00            +0.8        0.78 =C2=B1 14%  perf-profile.calltrace=
.cycles-
> pp.sched_ttwu_pending.flush_smp_call_function_from_idle.do_idle.cpu_start=
up_
> entry.start_secondary
>       0.14 =C2=B1173%      +1.2        1.31 =C2=B1 13%  perf-profile.call=
trace.cycles-
> pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.start_seco=
nda
> ry.secondary_startup_64_no_verify
>       6.29            -1.6        4.71 =C2=B1  7%  perf-profile.children.=
cycles-p
> p.__schedule
>       3.09            -0.9        2.19 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.schedule_idle
>       3.62            -0.6        3.05 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.schedule
>       7.19            -0.6        6.61 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.skb_release_all
>       7.17            -0.6        6.60 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.skb_release_head_state
>       3.69            -0.6        3.13 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.schedule_timeout
>       6.10            -0.5        5.59 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.sctp_wfree
>       4.47            -0.5        3.98 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.autoremove_wake_function
>       4.43            -0.5        3.93 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.try_to_wake_up
>       1.71            -0.5        1.24 =C2=B1  9%  perf-profile.children.=
cycles-p
> p.pick_next_task_fair
>       5.21            -0.4        4.77 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__sctp_write_space
>       4.95            -0.4        4.53 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__wake_up_common_lock
>       4.56            -0.4        4.17 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__wake_up_common
>       1.45 =C2=B1  2%      -0.4        1.07 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.dequeue_entity
>       1.55            -0.4        1.17 =C2=B1  9%  perf-profile.children.=
cycles-p
> p.update_load_avg
>       1.18            -0.4        0.80 =C2=B1  9%  perf-profile.children.=
cycles-p
> p.set_next_entity
>       1.72 =C2=B1  5%      -0.4        1.35 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpq_tail_data
>       1.62 =C2=B1  2%      -0.4        1.27 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.dequeue_task_fair
>       0.90            -0.3        0.57        perf-profile.children.cycle=
s-p
> p.select_task_rq_fair
>       1.90            -0.3        1.58 =C2=B1  9%  perf-profile.children.=
cycles-p
> p.ttwu_do_activate
>       8.03            -0.3        7.71        perf-profile.children.cycle=
s-p
> p.consume_skb
>       1.20 =C2=B1  8%      -0.3        0.90 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpevent_make_rcvmsg
>       1.85            -0.3        1.55 =C2=B1  9%  perf-profile.children.=
cycles-p
> p.enqueue_task_fair
>       5.79            -0.3        5.51 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.sctp_skb_recv_datagram
>       0.83 =C2=B1  2%      -0.3        0.55 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.poll_idle
>       1.50            -0.3        1.25 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.enqueue_entity
>       0.84            -0.2        0.63 =C2=B1 10%  perf-profile.children.=
cycles-p
> p.update_rq_clock
>       1.04            -0.2        0.83 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.__dev_queue_xmit
>       0.62 =C2=B1  3%      -0.2        0.43 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.update_curr
>       1.55            -0.2        1.36 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.menu_select
>       9.98            -0.2        9.80        perf-profile.children.cycle=
s-p
> p.sctp_chunk_put
>       1.12 =C2=B1  2%      -0.1        0.98 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpq_tail_event
>       0.88 =C2=B1  2%      -0.1        0.76 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.do_ulpq_tail_event
>       1.01            -0.1        0.89 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.copy_msghdr_from_user
>       0.55            -0.1        0.43 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.sctp_association_put
>       0.72 =C2=B1  4%      -0.1        0.60 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.dev_hard_start_xmit
>       0.34 =C2=B1 16%      -0.1        0.22 =C2=B1 22%  perf-profile.chil=
dren.cycles-p
> p.ipv4_dst_check
>       0.29 =C2=B1  3%      -0.1        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.resched_curr
>       0.34 =C2=B1  3%      -0.1        0.24 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.__update_load_avg_se
>       0.35 =C2=B1  2%      -0.1        0.24 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.pick_next_entity
>       0.81 =C2=B1  4%      -0.1        0.72 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpevent_make_sender_dry_event
>       0.23 =C2=B1 13%      -0.1        0.14 =C2=B1 22%  perf-profile.chil=
dren.cycles-p
> p.__ip_finish_output
>       0.84 =C2=B1  3%      -0.1        0.74 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sctp_sf_do_no_pending_tsn
>       0.64 =C2=B1  5%      -0.1        0.55 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.loopback_xmit
>       0.36 =C2=B1  3%      -0.1        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.check_preempt_curr
>       0.61            -0.1        0.52 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.sctp_queue_purge_ulpevents
>       0.46 =C2=B1  3%      -0.1        0.37 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sctp_datamsg_put
>       0.64            -0.1        0.55 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.get_next_timer_interrupt
>       0.53 =C2=B1  2%      -0.1        0.45 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.sendmsg_copy_msghdr
>       0.56            -0.1        0.48 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.import_iovec
>       0.38 =C2=B1  3%      -0.1        0.29 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.ttwu_do_wakeup
>       0.53            -0.1        0.45 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.__import_iovec
>       0.42 =C2=B1  3%      -0.1        0.35 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__switch_to_asm
>       0.75            -0.1        0.68 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.tick_nohz_next_event
>       0.69            -0.1        0.62 =C2=B1  4%  perf-profile.children.=
cycles-p
> p._copy_from_user
>       0.54 =C2=B1  3%      -0.1        0.47 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.__update_load_avg_cfs_rq
>       0.96            -0.1        0.89 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.tick_nohz_get_sleep_length
>       0.40 =C2=B1  2%      -0.1        0.33 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.iovec_from_user
>       0.29 =C2=B1  3%      -0.1        0.22 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p._copy_from_iter_full
>       0.34 =C2=B1  5%      -0.1        0.27 =C2=B1 22%  perf-profile.chil=
dren.cycles-p
> p.start_kernel
>       0.34 =C2=B1  5%      -0.1        0.27 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__sctp_packet_append_chunk
>       0.57            -0.1        0.51 =C2=B1  2%  perf-profile.children.=
cycles-p
> p._raw_spin_unlock_irqrestore
>       0.20 =C2=B1  6%      -0.1        0.14 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.switch_mm_irqs_off
>       0.41 =C2=B1  3%      -0.1        0.35 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.sched_clock
>       0.43 =C2=B1  3%      -0.1        0.38 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.sched_clock_cpu
>       0.41 =C2=B1  3%      -0.1        0.35 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__next_timer_interrupt
>       0.39 =C2=B1  3%      -0.1        0.33 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.native_sched_clock
>       0.17 =C2=B1 10%      -0.1        0.12 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.ip_rcv_finish
>       0.37            -0.1        0.32 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.read_tsc
>       1.04            -0.1        0.99 =C2=B1  2%  perf-profile.children.=
cycles-p
> p._raw_spin_lock
>       0.40 =C2=B1  2%      -0.1        0.35 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__switch_to
>       0.15 =C2=B1  7%      -0.1        0.10 =C2=B1 18%  perf-profile.chil=
dren.cycles-p
> p.validate_xmit_skb
>       0.28 =C2=B1  5%      -0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.___perf_sw_event
>       0.16 =C2=B1 13%      -0.0        0.11 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.ip_rcv_finish_core
>       0.22 =C2=B1  8%      -0.0        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.sock_recvmsg
>       0.20 =C2=B1  8%      -0.0        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.security_socket_recvmsg
>       0.22 =C2=B1  9%      -0.0        0.17 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.ipv4_mtu
>       0.30 =C2=B1  5%      -0.0        0.25        perf-profile.children.=
cycles-p
> p.sctp_data_ready
>       0.41 =C2=B1  4%      -0.0        0.36 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sctp_transport_hold
>       0.24 =C2=B1  5%      -0.0        0.20 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__check_heap_object
>       0.51 =C2=B1  2%      -0.0        0.46 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.__list_del_entry_valid
>       0.17 =C2=B1  4%      -0.0        0.13 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.sctp_outq_tail
>       0.23 =C2=B1  4%      -0.0        0.19 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.aa_sk_perm
>       0.18 =C2=B1  3%      -0.0        0.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.sctp_inq_pop
>       0.21 =C2=B1 12%      -0.0        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.irqtime_account_irq
>       0.25 =C2=B1  3%      -0.0        0.21 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.reweight_entity
>       0.12 =C2=B1  4%      -0.0        0.09 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.cpuidle_governor_latency_req
>       0.09 =C2=B1 12%      -0.0        0.05        perf-profile.children.=
cycles-p
> p.__cgroup_account_cputime
>       0.11 =C2=B1 11%      -0.0        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.update_min_vruntime
>       0.20 =C2=B1  6%      -0.0        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.release_sock
>       0.38 =C2=B1  2%      -0.0        0.34 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.memset_erms
>       0.33 =C2=B1  3%      -0.0        0.30 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.sctp_chunk_hold
>       0.15 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.sock_wfree
>       0.20 =C2=B1  6%      -0.0        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.finish_task_switch
>       0.19 =C2=B1  3%      -0.0        0.16 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sock_kfree_s
>       0.19 =C2=B1  2%      -0.0        0.16 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.memcpy_erms
>       0.26            -0.0        0.23 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.sockfd_lookup_light
>       0.26            -0.0        0.23 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.__might_fault
>       0.18 =C2=B1  2%      -0.0        0.15 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.syscall_exit_to_user_mode
>       0.11 =C2=B1  8%      -0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.sctp_validate_data
>       0.10 =C2=B1  8%      -0.0        0.07        perf-profile.children.=
cycles-p
> p.put_prev_task_fair
>       0.07 =C2=B1  7%      -0.0        0.04 =C2=B1 57%  perf-profile.chil=
dren.cycles-p
> p.sctp_v4_xmit
>       0.29            -0.0        0.26 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.___might_sleep
>       0.19 =C2=B1  2%      -0.0        0.16 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p._find_next_bit
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p._cond_resched
>       0.11 =C2=B1  3%      -0.0        0.09 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sctp_control_set_owner_w
>       0.09 =C2=B1 24%      -0.0        0.06        perf-profile.children.=
cycles-p
> p.sctp_chunk_assign_ssn
>       0.21 =C2=B1  2%      -0.0        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.copy_user_enhanced_fast_string
>       0.16            -0.0        0.14 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.security_socket_sendmsg
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.__wrgsbase_inactive
>       0.11 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__calc_delta
>       0.09 =C2=B1  4%      -0.0        0.07 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.rb_next
>       0.38            -0.0        0.35 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.__copy_msghdr_from_user
>       0.16 =C2=B1  2%      -0.0        0.14 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.copy_fpregs_to_fpstate
>       0.13 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__entry_text_start
>       0.24 =C2=B1  2%      -0.0        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.syscall_return_via_sysret
>       0.17 =C2=B1  2%      -0.0        0.15 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpevent_receive_data
>       0.07 =C2=B1  5%      -0.0        0.06 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.rcu_all_qs
>       0.08 =C2=B1 10%      -0.0        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.newidle_balance
>       0.07            -0.0        0.05 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.cpuacct_charge
>       0.09 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.exit_to_user_mode_prepare
>       0.09 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpevent_init
>       0.08            -0.0        0.07 =C2=B1  7%  perf-profile.children.=
cycles-p
> p.__rdgsbase_inactive
>       0.07 =C2=B1  7%      -0.0        0.05        perf-profile.children.=
cycles-p
> p.kmalloc_slab
>       0.10 =C2=B1  4%      -0.0        0.09        perf-profile.children.=
cycles-p
> p.sk_filter_trim_cap
>       0.06            -0.0        0.05        perf-profile.children.cycle=
s-p
> p.__put_user_nocheck_8
>       0.06            -0.0        0.05        perf-profile.children.cycle=
s-p
> p.syscall_enter_from_user_mode
>       0.05            +0.0        0.06 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.sctp_transport_raise_cwnd
>       0.06 =C2=B1  6%      +0.0        0.09 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.__hrtimer_next_event_base
>       0.40            +0.0        0.42 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.copyout
>       0.30 =C2=B1  2%      +0.0        0.34 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.internal_add_timer
>       0.16 =C2=B1  2%      +0.0        0.20 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__slab_alloc
>       0.32 =C2=B1  8%      +0.0        0.36 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__ip_local_out
>       0.27 =C2=B1  4%      +0.0        0.31 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.enqueue_timer
>       0.15 =C2=B1  3%      +0.0        0.19 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.___slab_alloc
>       0.53 =C2=B1  5%      +0.0        0.58 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.dst_release
>       0.15 =C2=B1 10%      +0.0        0.20 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__cgroup_bpf_run_filter_skb
>       1.00            +0.0        1.05 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.sctp_packet_pack
>       0.28 =C2=B1  9%      +0.0        0.33 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.ip_send_check
>       0.07 =C2=B1 17%      +0.0        0.12 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.rcu_eqs_enter
>       0.11 =C2=B1  7%      +0.1        0.16 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.ip_finish_output
>       0.13 =C2=B1 14%      +0.1        0.19 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.sctp_transport_burst_limited
>       0.28 =C2=B1  2%      +0.1        0.34 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.sctp_chunk_abandoned
>       0.48 =C2=B1  2%      +0.1        0.55        perf-profile.children.=
cycles-p
> p.sctp_sf_eat_sack_6_2
>       0.65            +0.1        0.71        perf-profile.children.cycle=
s-p
> p.sctp_user_addto_chunk
>       0.28            +0.1        0.35 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.simple_copy_to_iter
>       0.81            +0.1        0.89 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.skb_copy_datagram_iter
>       0.80            +0.1        0.88 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__skb_datagram_iter
>       0.09 =C2=B1  4%      +0.1        0.17 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.sctp_bind_addr_match
>       0.48 =C2=B1  4%      +0.1        0.57 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.prepare_to_wait_exclusive
>       0.42 =C2=B1 14%      +0.1        0.51 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.native_queued_spin_lock_slowpath
>       1.19            +0.1        1.28 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.sctp_transport_reset_t3_rtx
>       0.67 =C2=B1  3%      +0.1        0.77        perf-profile.children.=
cycles-p
> p.sock_kmalloc
>       0.45            +0.1        0.56 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.skb_set_owner_w
>       1.29            +0.1        1.40 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.sctp_make_datafrag_empty
>       0.63 =C2=B1  3%      +0.1        0.74 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.kfree
>       0.28 =C2=B1  3%      +0.1        0.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.sctp_transport_put
>       0.56            +0.1        0.69 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.sctp_addto_chunk
>       0.20 =C2=B1  3%      +0.1        0.34 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.skb_put
>       0.89            +0.1        1.03 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.kfree_skb
>       1.75            +0.1        1.90        perf-profile.children.cycle=
s-p
> p.sctp_check_transmitted
>       1.52 =C2=B1  2%      +0.2        1.67 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.sctp_outq_select_transport
>       1.19 =C2=B1  3%      +0.2        1.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.lock_sock_nested
>       0.10 =C2=B1  5%      +0.2        0.26 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.available_idle_cpu
>       1.08 =C2=B1  5%      +0.2        1.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_lock_bh
>      11.83            +0.2       12.00        perf-profile.children.cycle=
s-p
> p.____sys_recvmsg
>       2.18            +0.2        2.35 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__alloc_skb
>       1.82            +0.2        1.99 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.lock_timer_base
>       0.08 =C2=B1 11%      +0.2        0.26 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.llist_add_batch
>       0.61 =C2=B1  3%      +0.2        0.80 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.sctp_chunkify
>       0.08 =C2=B1 11%      +0.2        0.26 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.__smp_call_single_queue
>       0.11 =C2=B1 14%      +0.2        0.30 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.send_call_function_single_ipi
>       0.68 =C2=B1  2%      +0.2        0.88 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.sctp_chunk_free
>       0.08 =C2=B1 19%      +0.2        0.28 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.llist_reverse_order
>       0.86 =C2=B1  2%      +0.2        1.06 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__ksize
>      11.18            +0.2       11.39        perf-profile.children.cycle=
s-p
> p.sctp_outq_sack
>       2.60            +0.2        2.82        perf-profile.children.cycle=
s-p
> p.sctp_datamsg_from_user
>      11.36            +0.2       11.60        perf-profile.children.cycle=
s-p
> p.inet_recvmsg
>      11.24            +0.3       11.50        perf-profile.children.cycle=
s-p
> p.sctp_recvmsg
>       2.59            +0.3        2.86        perf-profile.children.cycle=
s-p
> p.sctp_ulpevent_free
>       1.65 =C2=B1  2%      +0.3        1.92 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p._sctp_make_chunk
>       1.10 =C2=B1  3%      +0.3        1.37 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.__check_object_size
>       0.11 =C2=B1 17%      +0.3        0.38 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.flush_smp_call_function_queue
>       1.35            +0.3        1.64 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.mod_timer
>       2.09            +0.3        2.38 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.kmem_cache_free
>       2.82            +0.3        3.12 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.sctp_packet_transmit_chunk
>       2.61 =C2=B1  2%      +0.3        2.92 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_lock_irqsave
>       2.65            +0.3        2.99 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.sctp_packet_append_chunk
>       1.50            +0.4        1.91 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.sctp_make_sack
>      42.62            +0.4       43.05        perf-profile.children.cycle=
s-p
> p.__sys_sendmsg
>      40.13            +0.4       40.57        perf-profile.children.cycle=
s-p
> p.sock_sendmsg
>       0.34 =C2=B1 12%      +0.4        0.79 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.sched_ttwu_pending
>      42.41            +0.5       42.86        perf-profile.children.cycle=
s-p
> p.___sys_sendmsg
>      39.89            +0.5       40.36        perf-profile.children.cycle=
s-p
> p.sctp_sendmsg
>       0.28 =C2=B1 12%      +0.5        0.76 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.ttwu_queue_wakelist
>      55.57            +0.5       56.06        perf-profile.children.cycle=
s-p
> p.do_syscall_64
>      41.79            +0.5       42.34        perf-profile.children.cycle=
s-p
> p.____sys_sendmsg
>      39.30            +0.6       39.91        perf-profile.children.cycle=
s-p
> p.sctp_sendmsg_to_asoc
>       1.98 =C2=B1  2%      +0.8        2.73 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__slab_free
>       0.47 =C2=B1 13%      +0.9        1.32 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.flush_smp_call_function_from_idle
>       1.37            -0.4        0.94 =C2=B1  8%  perf-profile.self.cycl=
es-pp.__
> schedule
>       0.76 =C2=B1  4%      -0.3        0.48 =C2=B1 11%  perf-profile.self=
.cycles-pp.po
> ll_idle
>       0.65 =C2=B1  2%      -0.2        0.46 =C2=B1 12%  perf-profile.self=
.cycles-pp.up
> date_rq_clock
>       0.53            -0.2        0.35 =C2=B1 11%  perf-profile.self.cycl=
es-pp.se
> t_next_entity
>       0.59 =C2=B1  3%      -0.2        0.41 =C2=B1  6%  perf-profile.self=
.cycles-pp.do
> _idle
>       0.69 =C2=B1  2%      -0.2        0.54 =C2=B1  9%  perf-profile.self=
.cycles-pp.up
> date_load_avg
>       0.53 =C2=B1  3%      -0.1        0.40 =C2=B1  9%  perf-profile.self=
.cycles-pp.__
> update_load_avg_cfs_rq
>       0.42            -0.1        0.30 =C2=B1  6%  perf-profile.self.cycl=
es-pp.se
> lect_task_rq_fair
>       0.55            -0.1        0.43 =C2=B1  4%  perf-profile.self.cycl=
es-pp.sc
> tp_association_put
>       0.29 =C2=B1  3%      -0.1        0.17 =C2=B1  9%  perf-profile.self=
.cycles-pp.re
> sched_curr
>       0.33 =C2=B1 14%      -0.1        0.22 =C2=B1 20%  perf-profile.self=
.cycles-pp.ip
> v4_dst_check
>       0.34 =C2=B1  2%      -0.1        0.23 =C2=B1 10%  perf-profile.self=
.cycles-pp.pi
> ck_next_entity
>       0.39 =C2=B1  3%      -0.1        0.28 =C2=B1  8%  perf-profile.self=
.cycles-pp.en
> queue_entity
>       0.33 =C2=B1  2%      -0.1        0.23 =C2=B1  9%  perf-profile.self=
.cycles-pp.__
> update_load_avg_se
>       0.63            -0.1        0.53 =C2=B1 10%  perf-profile.self.cycl=
es-pp.sc
> tp_association_hold
>       0.27 =C2=B1  5%      -0.1        0.18 =C2=B1  8%  perf-profile.self=
.cycles-pp.up
> date_curr
>       0.43 =C2=B1  2%      -0.1        0.34 =C2=B1  3%  perf-profile.self=
.cycles-pp.me
> nu_select
>       0.42 =C2=B1  3%      -0.1        0.35 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> switch_to_asm
>       0.53            -0.1        0.46 =C2=B1  4%  perf-profile.self.cycl=
es-pp._r
> aw_spin_unlock_irqrestore
>       0.31 =C2=B1  6%      -0.1        0.24 =C2=B1  6%  perf-profile.self=
.cycles-pp.__
> softirqentry_text_start
>       0.83            -0.1        0.77 =C2=B1  2%  perf-profile.self.cycl=
es-pp.sc
> tp_wfree
>       0.20 =C2=B1  5%      -0.1        0.14 =C2=B1  7%  perf-profile.self=
.cycles-pp.sw
> itch_mm_irqs_off
>       0.37 =C2=B1  4%      -0.1        0.32 =C2=B1  4%  perf-profile.self=
.cycles-pp.na
> tive_sched_clock
>       0.23 =C2=B1  8%      -0.0        0.18 =C2=B1  6%  perf-profile.self=
.cycles-pp.sc
> tp_datamsg_put
>       0.16 =C2=B1 12%      -0.0        0.11 =C2=B1 13%  perf-profile.self=
.cycles-pp.ip
> _rcv_finish_core
>       0.36            -0.0        0.31 =C2=B1  5%  perf-profile.self.cycl=
es-pp.re
> ad_tsc
>       0.38 =C2=B1  2%      -0.0        0.33 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> switch_to
>       0.25 =C2=B1  5%      -0.0        0.21 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> _perf_sw_event
>       0.18 =C2=B1  4%      -0.0        0.13 =C2=B1 11%  perf-profile.self=
.cycles-pp.de
> queue_entity
>       0.21 =C2=B1  7%      -0.0        0.17 =C2=B1 11%  perf-profile.self=
.cycles-pp.ip
> v4_mtu
>       0.16 =C2=B1  4%      -0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.tr
> y_to_wake_up
>       0.27 =C2=B1  7%      -0.0        0.22 =C2=B1  4%  perf-profile.self=
.cycles-pp.sc
> tp_sendmsg
>       1.02            -0.0        0.98 =C2=B1  2%  perf-profile.self.cycl=
es-pp._r
> aw_spin_lock
>       0.40 =C2=B1  4%      -0.0        0.36 =C2=B1  5%  perf-profile.self=
.cycles-pp.sc
> tp_transport_hold
>       0.23 =C2=B1  3%      -0.0        0.19 =C2=B1 14%  perf-profile.self=
.cycles-pp.__
> sctp_packet_append_chunk
>       0.15 =C2=B1  7%      -0.0        0.11 =C2=B1 10%  perf-profile.self=
.cycles-pp.sc
> tp_outq_tail
>       0.07 =C2=B1  7%      -0.0        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.sc
> tp_v4_xmit
>       0.24 =C2=B1  2%      -0.0        0.21 =C2=B1  5%  perf-profile.self=
.cycles-pp.en
> try_SYSCALL_64_after_hwframe
>       0.24 =C2=B1  3%      -0.0        0.20 =C2=B1  5%  perf-profile.self=
.cycles-pp.sc
> tp_do_sm
>       0.23 =C2=B1  3%      -0.0        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> check_heap_object
>       0.29 =C2=B1  5%      -0.0        0.25        perf-profile.self.cycl=
es-pp.sc
> tp_data_ready
>       0.25 =C2=B1  3%      -0.0        0.21 =C2=B1  7%  perf-profile.self=
.cycles-pp.re
> weight_entity
>       0.19 =C2=B1  2%      -0.0        0.15 =C2=B1  4%  perf-profile.self=
.cycles-pp.lo
> opback_xmit
>       0.18 =C2=B1  6%      -0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.__
> __sys_sendmsg
>       0.11 =C2=B1  9%      -0.0        0.07 =C2=B1 17%  perf-profile.self=
.cycles-pp.up
> date_min_vruntime
>       0.36 =C2=B1  3%      -0.0        0.33 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> alloc_skb
>       0.49            -0.0        0.45 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__
> list_del_entry_valid
>       0.37 =C2=B1  2%      -0.0        0.34 =C2=B1  3%  perf-profile.self=
.cycles-pp.me
> mset_erms
>       0.19 =C2=B1  3%      -0.0        0.16 =C2=B1  9%  perf-profile.self=
.cycles-pp.pr
> ocess_backlog
>       0.13 =C2=B1  6%      -0.0        0.10 =C2=B1  9%  perf-profile.self=
.cycles-pp.__
> dev_queue_xmit
>       0.18 =C2=B1  2%      -0.0        0.15 =C2=B1  2%  perf-profile.self=
.cycles-pp.me
> mcpy_erms
>       0.16 =C2=B1  4%      -0.0        0.13 =C2=B1  9%  perf-profile.self=
.cycles-pp.__
> ip_queue_xmit
>       0.18 =C2=B1  4%      -0.0        0.15 =C2=B1  7%  perf-profile.self=
.cycles-pp.aa
> _sk_perm
>       0.33 =C2=B1  3%      -0.0        0.30 =C2=B1  2%  perf-profile.self=
.cycles-pp.sc
> tp_chunk_hold
>       0.28 =C2=B1  5%      -0.0        0.25 =C2=B1  2%  perf-profile.self=
.cycles-pp.__
> might_sleep
>       0.11 =C2=B1 11%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.do
> _ulpq_tail_event
>       0.18 =C2=B1  2%      -0.0        0.16 =C2=B1  6%  perf-profile.self=
.cycles-pp._f
> ind_next_bit
>       0.11 =C2=B1  6%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.ip
> _local_deliver
>       0.28            -0.0        0.26 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__
> _might_sleep
>       0.20 =C2=B1  4%      -0.0        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> next_timer_interrupt
>       0.14 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.so
> ck_wfree
>       0.25 =C2=B1  4%      -0.0        0.23 =C2=B1  2%  perf-profile.self=
.cycles-pp.km
> em_cache_alloc
>       0.20 =C2=B1  4%      -0.0        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.co
> py_user_enhanced_fast_string
>       0.08 =C2=B1 19%      -0.0        0.06        perf-profile.self.cycl=
es-pp.pr
> epare_to_wait_exclusive
>       0.08 =C2=B1 10%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.de
> v_hard_start_xmit
>       0.06 =C2=B1  6%      -0.0        0.04 =C2=B1 57%  perf-profile.self=
.cycles-pp.__
> kmalloc_reserve
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.__
> wrgsbase_inactive
>       0.24 =C2=B1  2%      -0.0        0.22        perf-profile.self.cycl=
es-pp.sy
> scall_return_via_sysret
>       0.16 =C2=B1  2%      -0.0        0.14 =C2=B1  8%  perf-profile.self=
.cycles-pp.co
> py_fpregs_to_fpstate
>       0.11 =C2=B1  9%      -0.0        0.09 =C2=B1  4%  perf-profile.self=
.cycles-pp.in
> et_recvmsg
>       0.09 =C2=B1  7%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.__
> skb_clone
>       0.17 =C2=B1  2%      -0.0        0.15 =C2=B1  7%  perf-profile.self=
.cycles-pp.sc
> tp_eat_data
>       0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.co
> py_msghdr_from_user
>       0.13 =C2=B1  5%      -0.0        0.11        perf-profile.self.cycl=
es-pp.do
> _syscall_64
>       0.13 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> entry_text_start
>       0.07 =C2=B1 22%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> tp_chunk_assign_ssn
>       0.09 =C2=B1  4%      -0.0        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.rb
> _next
>       0.09 =C2=B1  4%      -0.0        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.sc
> tp_validate_data
>       0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  4%  perf-profile.self=
.cycles-pp.sc
> tp_packet_pack
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> calc_delta
>       0.10 =C2=B1  8%      -0.0        0.08 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> tp_inq_pop
>       0.07 =C2=B1 10%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.__
> genradix_ptr
>       0.07            -0.0        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.cp
> uacct_charge
>       0.09 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.sc
> tp_ulpevent_init
>       0.15 =C2=B1  3%      -0.0        0.13 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> import_iovec
>       0.13            -0.0        0.11 =C2=B1  4%  perf-profile.self.cycl=
es-pp.rc
> u_idle_exit
>       0.13 =C2=B1  3%      -0.0        0.11 =C2=B1  3%  perf-profile.self=
.cycles-pp.__
> __sys_recvmsg
>       0.09 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.sc
> tp_ulpevent_receive_data
>       0.08            -0.0        0.07 =C2=B1  7%  perf-profile.self.cycl=
es-pp.__
> rdgsbase_inactive
>       0.07 =C2=B1  5%      -0.0        0.06        perf-profile.self.cycl=
es-pp.__
> _sys_sendmsg
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> sys_recvmsg
>       0.08 =C2=B1  5%      -0.0        0.07 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> list_add_valid
>       0.06            -0.0        0.05        perf-profile.self.cycles-pp=
.sc
> hedule_idle
>       0.06            -0.0        0.05        perf-profile.self.cycles-pp=
.__
> put_user_nocheck_8
>       0.07 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.sc
> hedule_timeout
>       0.07 =C2=B1 10%      +0.0        0.09 =C2=B1 11%  perf-profile.self=
.cycles-pp.ch
> eck_preempt_curr
>       0.04 =C2=B1 58%      +0.0        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.__
> hrtimer_next_event_base
>       0.17 =C2=B1  4%      +0.0        0.21 =C2=B1  5%  perf-profile.self=
.cycles-pp.sc
> tp_addto_chunk
>       0.56 =C2=B1  3%      +0.0        0.60 =C2=B1  2%  perf-profile.self=
.cycles-pp.sc
> tp_datamsg_from_user
>       0.27 =C2=B1  4%      +0.0        0.31 =C2=B1  4%  perf-profile.self=
.cycles-pp.en
> queue_timer
>       0.15 =C2=B1  3%      +0.0        0.19 =C2=B1  6%  perf-profile.self=
.cycles-pp.__
> _slab_alloc
>       0.14 =C2=B1  8%      +0.0        0.19 =C2=B1  7%  perf-profile.self=
.cycles-pp.__
> cgroup_bpf_run_filter_skb
>       0.47            +0.0        0.52        perf-profile.self.cycles-pp=
.sc
> tp_assoc_bh_rcv
>       0.14 =C2=B1  6%      +0.0        0.19 =C2=B1  5%  perf-profile.self=
.cycles-pp.de
> queue_task_fair
>       0.53 =C2=B1  5%      +0.1        0.58 =C2=B1  2%  perf-profile.self=
.cycles-pp.ds
> t_release
>       0.28 =C2=B1 10%      +0.1        0.33 =C2=B1  4%  perf-profile.self=
.cycles-pp.ip
> _send_check
>       0.28 =C2=B1  2%      +0.1        0.33 =C2=B1  3%  perf-profile.self=
.cycles-pp.sc
> tp_chunk_abandoned
>       0.13 =C2=B1 14%      +0.1        0.19 =C2=B1 14%  perf-profile.self=
.cycles-pp.sc
> tp_transport_burst_limited
>       0.52 =C2=B1  5%      +0.1        0.57 =C2=B1  2%  perf-profile.self=
.cycles-pp.sc
> tp_outq_flush
>       0.46 =C2=B1  2%      +0.1        0.52 =C2=B1  3%  perf-profile.self=
.cycles-pp.sc
> tp_rcv
>       0.47 =C2=B1  3%      +0.1        0.54        perf-profile.self.cycl=
es-pp.sc
> tp_sf_eat_sack_6_2
>       0.51            +0.1        0.58        perf-profile.self.cycles-pp=
.sc
> tp_recvmsg
>       0.66 =C2=B1  3%      +0.1        0.73 =C2=B1  3%  perf-profile.self=
.cycles-pp._r
> aw_spin_lock_bh
>       0.00            +0.1        0.08 =C2=B1 17%  perf-profile.self.cycl=
es-pp.rc
> u_eqs_enter
>       0.26 =C2=B1  8%      +0.1        0.34 =C2=B1  3%  perf-profile.self=
.cycles-pp.mo
> d_timer
>       0.06 =C2=B1 13%      +0.1        0.15 =C2=B1 15%  perf-profile.self=
.cycles-pp.sc
> tp_bind_addr_match
>       0.09 =C2=B1 11%      +0.1        0.18 =C2=B1 11%  perf-profile.self=
.cycles-pp.sc
> tp_hash_cmp
>       0.42 =C2=B1 13%      +0.1        0.51 =C2=B1  6%  perf-profile.self=
.cycles-pp.na
> tive_queued_spin_lock_slowpath
>       0.00            +0.1        0.11 =C2=B1 14%  perf-profile.self.cycl=
es-pp.fl
> ush_smp_call_function_queue
>       0.09 =C2=B1  5%      +0.1        0.19 =C2=B1  8%  perf-profile.self=
.cycles-pp.__
> wake_up_common
>       0.08 =C2=B1 24%      +0.1        0.19 =C2=B1 14%  perf-profile.self=
.cycles-pp.tt
> wu_queue_wakelist
>       0.51 =C2=B1  6%      +0.1        0.61 =C2=B1  7%  perf-profile.self=
.cycles-pp.sc
> tp_outq_select_transport
>       0.45            +0.1        0.56 =C2=B1  5%  perf-profile.self.cycl=
es-pp.sk
> b_set_owner_w
>       0.54 =C2=B1  4%      +0.1        0.66 =C2=B1  2%  perf-profile.self=
.cycles-pp.so
> ck_kmalloc
>       0.36 =C2=B1  4%      +0.1        0.48 =C2=B1  3%  perf-profile.self=
.cycles-pp.sc
> hedule
>       0.61 =C2=B1  3%      +0.1        0.73 =C2=B1  3%  perf-profile.self=
.cycles-pp.kf
> ree
>       0.90 =C2=B1  2%      +0.1        1.02 =C2=B1  3%  perf-profile.self=
.cycles-pp.km
> em_cache_free
>       0.27 =C2=B1  3%      +0.1        0.40 =C2=B1  2%  perf-profile.self=
.cycles-pp.sc
> tp_transport_put
>       0.15 =C2=B1  4%      +0.1        0.28 =C2=B1  9%  perf-profile.self=
.cycles-pp.sk
> b_put
>       0.49 =C2=B1  3%      +0.1        0.63 =C2=B1  5%  perf-profile.self=
.cycles-pp.sc
> tp_make_sack
>       0.52 =C2=B1  2%      +0.1        0.66 =C2=B1  2%  perf-profile.self=
.cycles-pp.sc
> tp_cmd_interpreter
>       0.75 =C2=B1  2%      +0.1        0.89 =C2=B1  4%  perf-profile.self=
.cycles-pp.sc
> tp_sendmsg_to_asoc
>       0.60 =C2=B1  3%      +0.1        0.74 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> tp_packet_config
>       0.00            +0.1        0.15 =C2=B1 14%  perf-profile.self.cycl=
es-pp.fl
> ush_smp_call_function_from_idle
>       0.09 =C2=B1  4%      +0.2        0.26 =C2=B1  9%  perf-profile.self=
.cycles-pp.av
> ailable_idle_cpu
>       0.15 =C2=B1  5%      +0.2        0.33 =C2=B1 12%  perf-profile.self=
.cycles-pp.sc
> tp_chunkify
>       0.08 =C2=B1 11%      +0.2        0.26 =C2=B1 14%  perf-profile.self=
.cycles-pp.sc
> hed_ttwu_pending
>       0.08 =C2=B1 11%      +0.2        0.26 =C2=B1 15%  perf-profile.self=
.cycles-pp.ll
> ist_add_batch
>       0.11 =C2=B1 14%      +0.2        0.30 =C2=B1 11%  perf-profile.self=
.cycles-pp.se
> nd_call_function_single_ipi
>       0.85 =C2=B1  3%      +0.2        1.05 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> ksize
>       0.08 =C2=B1 15%      +0.2        0.28 =C2=B1 14%  perf-profile.self=
.cycles-pp.ll
> ist_reverse_order
>       1.15            +0.2        1.35 =C2=B1  4%  perf-profile.self.cycl=
es-pp.sc
> tp_outq_sack
>       0.54            +0.2        0.75 =C2=B1  6%  perf-profile.self.cycl=
es-pp.lo
> ck_timer_base
>       0.69 =C2=B1  4%      +0.3        0.99 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> check_object_size
>       2.60 =C2=B1  2%      +0.3        2.91 =C2=B1  2%  perf-profile.self=
.cycles-pp._r
> aw_spin_lock_irqsave
>       1.97 =C2=B1  2%      +0.7        2.71 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> slab_free
>
>
>
>
>                                netperf.Throughput_tps
>
>
>
>   58000 +----------------------------------------------------------------=
---
> +
>         |. .+.   .+.   .+.   .+.+.+. .+.   .+. .+.     .+. .+.+. .+.+.   =
  .
> |
>   56000 |-+   +.+   +.+   +.+       +   +.+   +   +.+.+   +     +     +.+=
.+
> |
>   54000 |-+
> |
>         |
> |
>   52000 |-+
> |
>         |
> |
>   50000 |-+                   O
> |
>         |       O                           O       O
> |
>   48000 |-+                 O         O       O
> |
>   46000 |-O O     O O O           O     O       O
> |
>         |     O                 O
> |
>   44000 |-+               O               O       O
> |
>         |               O           O
> |
>   42000 +----------------------------------------------------------------=
---
> +
>
>
>
>
>
>                              netperf.Throughput_total_tps
>
>
>
>    2.1e+06 +-------------------------------------------------------------=
---
> +
>   2.05e+06 |-+.+          +.           .+       .+           +.          =
  .
> |
>            |.+  + .+.++. +  +.+.+.+.+.+  + .++.+  + .+.+.+. +  +.++.+.+.+=
.+
> |
>      2e+06 |-+   +      +                 +        +       +
> |
>   1.95e+06 |-+
> |
>    1.9e+06 |-+
> |
>   1.85e+06 |-+
> |
>            |
> |
>    1.8e+06 |-+                  O
> |
>   1.75e+06 |-+     O                         O       O
> |
>    1.7e+06 |-+ O              O         O      O
> |
>   1.65e+06 |-O       OO O           O     O      O
> |
>            |     O                O
> |
>    1.6e+06 |-+              O               O      O
> |
>   1.55e+06 +-------------------------------------------------------------=
---
> +
>
>
>
>
>
>                                    netperf.workload
>
>
>
>   6.2e+08 +--------------------------------------------------------------=
---
> +
>           |. .+. .+.+.+. + :  .+.+.+. .+. .+.+. .+. .+. .+. : +. .+.+.   =
.+
> |
>     6e+08 |-+   +       +  +.+       +   +     +   +   +   +    +     +.+
> |
>   5.8e+08 |-+
> |
>           |
> |
>   5.6e+08 |-+
> |
>           |
> |
>   5.4e+08 |-+                  O
> |
>           |       O                          O       O
> |
>   5.2e+08 |-+                          O       O
> |
>     5e+08 |-O O       O      O     O     O       O
> |
>           |     O   O   O        O
> |
>   4.8e+08 |-+              O
> |
>           |               O          O     O       O
> |
>   4.6e+08 +--------------------------------------------------------------=
---
> +
>
>
>
>
>
>                         netperf.time.voluntary_context_switches
>
>
>
>   6.2e+08 +--------------------------------------------------------------=
---
> +
>           |. .+. .+.+.+. + :  .+.+.+. .+. .+.+. .+. .+. .+. : +. .+.+.   =
.+
> |
>     6e+08 |-+   +       +  +.+       +   +     +   +   +   +    +     +.+
> |
>   5.8e+08 |-+
> |
>           |
> |
>   5.6e+08 |-+
> |
>           |
> |
>   5.4e+08 |-+                  O
> |
>           |       O                          O       O
> |
>   5.2e+08 |-+                          O       O
> |
>     5e+08 |-O O       O      O     O     O       O
> |
>           |     O   O   O        O
> |
>   4.8e+08 |-+              O
> |
>           |               O          O     O       O
> |
>   4.6e+08 +--------------------------------------------------------------=
---
> +
>
>
>
>
> [*] bisect-good sample
> [O] bisect-bad  sample
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2ap3: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz wi=
th
> 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_
> group/test/testcase/ucode:
>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/25%/debian-10.4-x86=
_64
> -20200603.cgz/300s/lkp-csl-2ap3/SCTP_RR/netperf/0x5003006
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>    2593124           -14.2%    2223862 =C2=B1  4%  netperf.Throughput_tot=
al_tps
>      54023           -14.2%      46330 =C2=B1  4%  netperf.Throughput_tps
>      22549            +2.0%      22995        netperf.time.minor_page_fau=
lts
>       1928            -4.5%       1842        netperf.time.percent_of_cpu=
_th
> is_job_got
>       5741            -4.1%       5504        netperf.time.system_time
>     142.91           -18.0%     117.12 =C2=B1  3%  netperf.time.user_time
>  7.779e+08           -14.2%  6.671e+08 =C2=B1  4%  netperf.time.voluntary=
_context
> _switches
>  7.779e+08           -14.2%  6.672e+08 =C2=B1  4%  netperf.workload
>    1246851 =C2=B1  4%      -6.0%    1172481 =C2=B1  3%  meminfo.DirectMap=
4k
>       0.74 =C2=B1  2%      -0.1        0.64 =C2=B1  2%  mpstat.cpu.all.us=
r%
>   10104662           -14.2%    8666085 =C2=B1  4%  vmstat.system.cs
>  1.376e+09 =C2=B1  2%     -14.3%  1.179e+09 =C2=B1  2%  cpuidle.C1.usage
>  4.497e+08 =C2=B1 14%     -18.3%  3.675e+08 =C2=B1 16%  cpuidle.POLL.time
>     959.00 =C2=B1  5%     -13.3%     831.00 =C2=B1  6%  slabinfo.kmem_cac=
he.active_obj
> s
>     959.00 =C2=B1  5%     -13.3%     831.00 =C2=B1  6%  slabinfo.kmem_cac=
he.num_objs
>    3186644 =C2=B1 11%     -60.5%    1259903 =C2=B1 51%  numa-numastat.nod=
e2.local_node
>    3273211 =C2=B1 10%     -59.4%    1328013 =C2=B1 51%  numa-numastat.nod=
e2.numa_hit
>     603757 =C2=B1 56%    +127.9%    1376146 =C2=B1  9%  numa-numastat.nod=
e3.local_node
>     661509 =C2=B1 45%    +113.6%    1413302 =C2=B1  7%  numa-numastat.nod=
e3.numa_hit
>    2333625            +1.3%    2363165        proc-vmstat.nr_file_pages
>    2151110            +1.4%    2180871        proc-vmstat.nr_inactive_anon
>      30243            +1.2%      30609        proc-vmstat.nr_kernel_stack
>     633681 =C2=B1  2%      -5.2%     600472        proc-vmstat.nr_mapped
>       3285            -3.8%       3160        proc-vmstat.nr_page_table_p=
age
> s
>    2093095            +1.4%    2122636        proc-vmstat.nr_shmem
>    2151110            +1.4%    2180871        proc-vmstat.nr_zone_inactiv=
e_a
> non
>     834511 =C2=B1  7%     -15.3%     706708 =C2=B1  2%  proc-vmstat.numa_=
hint_faults_l
> ocal
>    6589041            +1.2%    6671356        proc-vmstat.numa_hit
>    6329248            +1.3%    6411436        proc-vmstat.numa_local
>    6692448            +1.2%    6772348        proc-vmstat.pgalloc_normal
>    1669440           -17.5%    1376576 =C2=B1 10%  sched_debug.cfs_rq:/.M=
IN_vrunt
> ime.max
>     269192 =C2=B1  3%     -15.9%     226291 =C2=B1 16%  sched_debug.cfs_r=
q:/.MIN_vrunt
> ime.stddev
>    1669440           -17.5%    1376576 =C2=B1 10%  sched_debug.cfs_rq:/.m=
ax_vrunt
> ime.max
>     269192 =C2=B1  3%     -15.9%     226291 =C2=B1 16%  sched_debug.cfs_r=
q:/.max_vrunt
> ime.stddev
>    1482002           -16.4%    1239417 =C2=B1 11%  sched_debug.cfs_rq:/.m=
in_vrunt
> ime.avg
>    2208803 =C2=B1  2%     -15.2%    1873699 =C2=B1 13%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.max
>    1154372 =C2=B1  2%     -17.5%     951854 =C2=B1 11%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.min
>     171674 =C2=B1  5%     -24.8%     129145 =C2=B1  9%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.stddev
>       0.36 =C2=B1  2%      -6.4%       0.34 =C2=B1  3%  sched_debug.cfs_r=
q:/.nr_runnin
> g.avg
>     267292 =C2=B1 10%     -24.7%     201248 =C2=B1 12%  sched_debug.cfs_r=
q:/.spread0.a
> vg
>     994080 =C2=B1  9%     -15.9%     835530 =C2=B1 17%  sched_debug.cfs_r=
q:/.spread0.m
> ax
>     171643 =C2=B1  5%     -24.8%     129126 =C2=B1  9%  sched_debug.cfs_r=
q:/.spread0.s
> tddev
>     173.75           -10.6%     155.27 =C2=B1  5%  sched_debug.cfs_rq:/.u=
til_est_
> enqueued.avg
>       2040 =C2=B1  5%     -18.9%       1655 =C2=B1 10%  sched_debug.cpu.c=
lock_task.std
> dev
>       8218            -9.7%       7424 =C2=B1  2%  sched_debug.cpu.curr->=
pid.max
>    7999095           -20.3%    6372453 =C2=B1 11%  sched_debug.cpu.nr_swi=
tches.av
> g
>   10167417           -19.9%    8146165 =C2=B1 13%  sched_debug.cpu.nr_swi=
tches.ma
> x
>    5866364           -23.4%    4491146 =C2=B1 12%  sched_debug.cpu.nr_swi=
tches.mi
> n
>     996913 =C2=B1  6%     -27.9%     719077 =C2=B1  7%  sched_debug.cpu.n=
r_switches.st
> ddev
>     741.33 =C2=B1 55%     +77.5%       1315 =C2=B1 10%  numa-vmstat.node0=
.nr_page_tabl
> e_pages
>      53580 =C2=B1  4%     -60.2%      21316 =C2=B1 72%  numa-vmstat.node1=
.nr_anon_page
> s
>       8874 =C2=B1 10%     -21.4%       6977        numa-vmstat.node1.nr_k=
ernel_st
> ack
>       1422 =C2=B1  2%     -78.1%     311.33 =C2=B1 17%  numa-vmstat.node1=
.nr_page_tabl
> e_pages
>      21719 =C2=B1 10%     -18.5%      17694 =C2=B1  4%  numa-vmstat.node1=
.nr_slab_unre
> claimable
>       2707 =C2=B1 13%     -51.7%       1309 =C2=B1 28%  numa-vmstat.node2=
.nr_active_an
> on
>       5968 =C2=B1 52%    +346.6%      26653 =C2=B1 44%  numa-vmstat.node2=
.nr_anon_page
> s
>    1236316 =C2=B1  9%     -61.1%     481065 =C2=B1 62%  numa-vmstat.node2=
.nr_file_page
> s
>    1181958 =C2=B1  9%     -62.0%     448842 =C2=B1 68%  numa-vmstat.node2=
.nr_inactive_
> anon
>       6777 =C2=B1  2%     +14.2%       7741 =C2=B1  7%  numa-vmstat.node2=
.nr_kernel_st
> ack
>     367777 =C2=B1  8%     -50.6%     181775 =C2=B1 62%  numa-vmstat.node2=
.nr_mapped
>    1178736 =C2=B1  9%     -64.1%     423533 =C2=B1 70%  numa-vmstat.node2=
.nr_shmem
>       2707 =C2=B1 13%     -51.7%       1309 =C2=B1 28%  numa-vmstat.node2=
.nr_zone_acti
> ve_anon
>    1181957 =C2=B1  9%     -62.0%     448842 =C2=B1 68%  numa-vmstat.node2=
.nr_zone_inac
> tive_anon
>    1722185 =C2=B1 10%     -40.3%    1028643 =C2=B1 14%  numa-vmstat.node2=
.numa_hit
>    1555146 =C2=B1 11%     -43.4%     880109 =C2=B1 14%  numa-vmstat.node2=
.numa_local
>     204255 =C2=B1 57%    +127.5%     464675 =C2=B1  2%  numa-vmstat.node3=
.nr_file_page
> s
>     130234 =C2=B1 90%    +206.5%     399174 =C2=B1  2%  numa-vmstat.node3=
.nr_inactive_
> anon
>     104920 =C2=B1 86%    +190.1%     304418 =C2=B1  8%  numa-vmstat.node3=
.nr_mapped
>     143287 =C2=B1 78%    +180.1%     401341 =C2=B1  2%  numa-vmstat.node3=
.nr_shmem
>      19632 =C2=B1 17%     +19.8%      23526 =C2=B1  7%  numa-vmstat.node3=
.nr_slab_unre
> claimable
>     130234 =C2=B1 90%    +206.5%     399174 =C2=B1  2%  numa-vmstat.node3=
.nr_zone_inac
> tive_anon
>     766218 =C2=B1 29%     +56.2%    1196541 =C2=B1 13%  numa-vmstat.node3=
.numa_hit
>     628341 =C2=B1 41%     +74.9%    1099275 =C2=B1 17%  numa-vmstat.node3=
.numa_local
>      25840 =C2=B1 61%     -60.6%      10190 =C2=B1 96%  numa-meminfo.node=
0.AnonHugePag
> es
>       2958 =C2=B1 55%     +77.6%       5254 =C2=B1 10%  numa-meminfo.node=
0.PageTables
>     140026 =C2=B1  9%     -56.2%      61270 =C2=B1 89%  numa-meminfo.node=
1.AnonHugePag
> es
>     214449 =C2=B1  4%     -60.2%      85266 =C2=B1 72%  numa-meminfo.node=
1.AnonPages
>     301802 =C2=B1 22%     -58.6%     125060 =C2=B1 48%  numa-meminfo.node=
1.AnonPages.m
> ax
>       8871 =C2=B1 10%     -21.3%       6978        numa-meminfo.node1.Ker=
nelStack
>       5690 =C2=B1  2%     -78.1%       1247 =C2=B1 17%  numa-meminfo.node=
1.PageTables
>      86876 =C2=B1 10%     -18.5%      70778 =C2=B1  4%  numa-meminfo.node=
1.SUnreclaim
>      10824 =C2=B1 13%     -51.6%       5234 =C2=B1 28%  numa-meminfo.node=
2.Active
>      10824 =C2=B1 13%     -51.6%       5234 =C2=B1 28%  numa-meminfo.node=
2.Active(anon
> )
>      12127 =C2=B1 93%    +562.8%      80373 =C2=B1 57%  numa-meminfo.node=
2.AnonHugePag
> es
>      23892 =C2=B1 51%    +346.2%     106605 =C2=B1 44%  numa-meminfo.node=
2.AnonPages
>    4941646 =C2=B1  9%     -61.1%    1922649 =C2=B1 62%  numa-meminfo.node=
2.FilePages
>    4724255 =C2=B1  9%     -62.0%    1793756 =C2=B1 68%  numa-meminfo.node=
2.Inactive
>    4724255 =C2=B1  9%     -62.0%    1793756 =C2=B1 68%  numa-meminfo.node=
2.Inactive(an
> on)
>       6778 =C2=B1  2%     +14.2%       7739 =C2=B1  7%  numa-meminfo.node=
2.KernelStack
>    1467390 =C2=B1  8%     -50.6%     724647 =C2=B1 62%  numa-meminfo.node=
2.Mapped
>    5489996 =C2=B1  8%     -53.4%    2557796 =C2=B1 47%  numa-meminfo.node=
2.MemUsed
>    4711325 =C2=B1  9%     -64.1%    1692521 =C2=B1 70%  numa-meminfo.node=
2.Shmem
>       9512 =C2=B1141%    +295.9%      37660 =C2=B1 69%  numa-meminfo.node=
3.AnonHugePag
> es
>     816282 =C2=B1 57%    +127.5%    1856924 =C2=B1  2%  numa-meminfo.node=
3.FilePages
>     520411 =C2=B1 90%    +206.5%    1595249 =C2=B1  2%  numa-meminfo.node=
3.Inactive
>     520411 =C2=B1 90%    +206.5%    1595249 =C2=B1  2%  numa-meminfo.node=
3.Inactive(an
> on)
>     419183 =C2=B1 86%    +190.1%    1215878 =C2=B1  8%  numa-meminfo.node=
3.Mapped
>    1398071 =C2=B1 37%     +80.5%    2523230 =C2=B1  2%  numa-meminfo.node=
3.MemUsed
>      78531 =C2=B1 17%     +19.8%      94118 =C2=B1  7%  numa-meminfo.node=
3.SUnreclaim
>     572409 =C2=B1 78%    +180.1%    1603590 =C2=B1  2%  numa-meminfo.node=
3.Shmem
>      14.61 =C2=B1  2%     -12.7%      12.76 =C2=B1  2%  perf-stat.i.MPKI
>   2.99e+10           -13.7%  2.579e+10 =C2=B1  4%  perf-stat.i.branch-ins=
truction
> s
>  4.824e+08           -14.4%   4.13e+08 =C2=B1  4%  perf-stat.i.branch-mis=
ses
>       5.97 =C2=B1  4%     +12.9       18.89 =C2=B1 21%  perf-stat.i.cache=
-miss-rate%
>    1.2e+08 =C2=B1  7%    +143.6%  2.923e+08 =C2=B1 15%  perf-stat.i.cache=
-misses
>  2.109e+09           -24.0%  1.603e+09 =C2=B1  7%  perf-stat.i.cache-refe=
rences
>   10210729           -14.3%    8751520 =C2=B1  4%  perf-stat.i.context-sw=
itches
>       1.58           +11.8%       1.76 =C2=B1  3%  perf-stat.i.cpi
>  2.264e+11            -3.5%  2.185e+11        perf-stat.i.cpu-cycles
>       1972 =C2=B1  7%     -60.0%     788.79 =C2=B1 17%  perf-stat.i.cycle=
s-between-cac
> he-misses
>  4.204e+10           -13.9%  3.618e+10 =C2=B1  4%  perf-stat.i.dTLB-loads
>  2.517e+10           -13.9%  2.168e+10 =C2=B1  4%  perf-stat.i.dTLB-stores
>      58.20            -1.3       56.94        perf-stat.i.iTLB-load-miss-=
rat
> e%
>  3.814e+08 =C2=B1  2%     -16.6%  3.181e+08 =C2=B1  4%  perf-stat.i.iTLB-=
load-misses
>  2.732e+08           -12.4%  2.392e+08 =C2=B1  2%  perf-stat.i.iTLB-loads
>  1.489e+11           -13.8%  1.283e+11 =C2=B1  4%  perf-stat.i.instructio=
ns
>       0.65           -10.7%       0.58 =C2=B1  3%  perf-stat.i.ipc
>       1.18            -3.5%       1.14        perf-stat.i.metric.GHz
>       0.65 =C2=B1  7%     -11.5%       0.58 =C2=B1  7%  perf-stat.i.metri=
c.K/sec
>     518.70           -13.9%     446.49 =C2=B1  4%  perf-stat.i.metric.M/s=
ec
>       8934 =C2=B1  3%      -3.9%       8584        perf-stat.i.minor-faul=
ts
>      95.67            +2.1       97.81        perf-stat.i.node-load-miss-=
rat
> e%
>   63595496 =C2=B1  5%    +158.1%  1.641e+08 =C2=B1 15%  perf-stat.i.node-=
load-misses
>      97.30            +1.0       98.35        perf-stat.i.node-store-miss=
-ra
> te%
>   20677192 =C2=B1  4%    +159.6%   53679952 =C2=B1 13%  perf-stat.i.node-=
store-misses
>       8935 =C2=B1  3%      -3.9%       8585        perf-stat.i.page-faults
>      14.16           -11.9%      12.48 =C2=B1  2%  perf-stat.overall.MPKI
>       5.69 =C2=B1  7%     +12.8       18.52 =C2=B1 21%  perf-stat.overall=
.cache-miss-r
> ate%
>       1.52           +12.1%       1.71 =C2=B1  3%  perf-stat.overall.cpi
>       1897 =C2=B1  7%     -59.6%     766.85 =C2=B1 16%  perf-stat.overall=
.cycles-betwe
> en-cache-misses
>       0.02            +0.0        0.02 =C2=B1  2%  perf-stat.overall.dTLB=
-load-mi
> ss-rate%
>       0.00 =C2=B1  4%      +0.0        0.00 =C2=B1  3%  perf-stat.overall=
.dTLB-store-m
> iss-rate%
>      58.24            -1.2       57.04        perf-stat.overall.iTLB-load=
-mi
> ss-rate%
>       0.66           -10.7%       0.59 =C2=B1  3%  perf-stat.overall.ipc
>      96.59            +2.0       98.59        perf-stat.overall.node-load=
-mi
> ss-rate%
>      97.70            +1.4       99.13        perf-stat.overall.node-stor=
e-m
> iss-rate%
>   2.98e+10           -13.7%   2.57e+10 =C2=B1  4%  perf-stat.ps.branch-in=
structio
> ns
>  4.806e+08           -14.4%  4.115e+08 =C2=B1  4%  perf-stat.ps.branch-mi=
sses
>  1.196e+08 =C2=B1  7%    +143.6%  2.913e+08 =C2=B1 15%  perf-stat.ps.cach=
e-misses
>  2.101e+09           -24.0%  1.598e+09 =C2=B1  7%  perf-stat.ps.cache-ref=
erences
>   10173907           -14.3%    8720173 =C2=B1  4%  perf-stat.ps.context-s=
witches
>  2.257e+11            -3.5%  2.178e+11        perf-stat.ps.cpu-cycles
>  4.189e+10           -13.9%  3.605e+10 =C2=B1  4%  perf-stat.ps.dTLB-loads
>  2.508e+10           -13.9%   2.16e+10 =C2=B1  4%  perf-stat.ps.dTLB-stor=
es
>  3.799e+08 =C2=B1  2%     -16.6%  3.169e+08 =C2=B1  4%  perf-stat.ps.iTLB=
-load-misses
>  2.723e+08           -12.4%  2.385e+08 =C2=B1  2%  perf-stat.ps.iTLB-loads
>  1.483e+11           -13.8%  1.278e+11 =C2=B1  4%  perf-stat.ps.instructi=
ons
>       8897 =C2=B1  3%      -3.9%       8546        perf-stat.ps.minor-fau=
lts
>   63360729 =C2=B1  5%    +158.1%  1.636e+08 =C2=B1 15%  perf-stat.ps.node=
-load-misses
>   20601312 =C2=B1  4%    +159.7%   53497013 =C2=B1 13%  perf-stat.ps.node=
-store-misses
>       8898 =C2=B1  3%      -3.9%       8547        perf-stat.ps.page-faul=
ts
>  4.538e+13           -13.8%  3.913e+13 =C2=B1  4%  perf-stat.total.instru=
ctions
>    2984682           -12.2%    2622005 =C2=B1  8%  softirqs.CPU0.NET_RX
>    3741045 =C2=B1  6%     -19.0%    3032014 =C2=B1  3%  softirqs.CPU1.NET=
_RX
>    3726236 =C2=B1  3%     -11.8%    3286420 =C2=B1  5%  softirqs.CPU10.NE=
T_RX
>    4431153           -14.1%    3804991 =C2=B1  4%  softirqs.CPU100.NET_RX
>    4506101           -18.2%    3685296 =C2=B1  7%  softirqs.CPU101.NET_RX
>    4591260 =C2=B1  2%     -24.5%    3468640 =C2=B1 21%  softirqs.CPU103.N=
ET_RX
>    4697474 =C2=B1  4%     -20.2%    3746657 =C2=B1  7%  softirqs.CPU104.N=
ET_RX
>    4591152           -14.5%    3923714 =C2=B1  8%  softirqs.CPU106.NET_RX
>    4544541           -14.8%    3873413 =C2=B1  6%  softirqs.CPU108.NET_RX
>    4470703 =C2=B1  3%     -17.1%    3704399 =C2=B1  7%  softirqs.CPU109.N=
ET_RX
>    4420204 =C2=B1  3%     -17.2%    3660140 =C2=B1  4%  softirqs.CPU110.N=
ET_RX
>    4303296 =C2=B1  7%     -13.8%    3710814 =C2=B1  9%  softirqs.CPU111.N=
ET_RX
>    4582539           -22.1%    3571877 =C2=B1  4%  softirqs.CPU112.NET_RX
>    4594685           -24.2%    3482381 =C2=B1  7%  softirqs.CPU113.NET_RX
>    4628785 =C2=B1  5%     -20.3%    3688325 =C2=B1  8%  softirqs.CPU114.N=
ET_RX
>    4439775           -18.5%    3616861 =C2=B1  9%  softirqs.CPU115.NET_RX
>    4587826 =C2=B1  4%     -26.7%    3363144 =C2=B1 15%  softirqs.CPU116.N=
ET_RX
>      59275 =C2=B1  5%     -13.2%      51464 =C2=B1 14%  softirqs.CPU116.S=
CHED
>    4467305 =C2=B1  2%     -15.3%    3782094 =C2=B1  5%  softirqs.CPU117.N=
ET_RX
>    4449347 =C2=B1  2%     -17.8%    3657088 =C2=B1  5%  softirqs.CPU119.N=
ET_RX
>    3793120           -14.0%    3263704 =C2=B1  7%  softirqs.CPU12.NET_RX
>    4492949 =C2=B1  5%     -15.3%    3805589 =C2=B1  4%  softirqs.CPU122.N=
ET_RX
>    4652325 =C2=B1  6%     -14.2%    3993056 =C2=B1  6%  softirqs.CPU123.N=
ET_RX
>    4529645 =C2=B1  4%     -17.2%    3750590 =C2=B1  3%  softirqs.CPU124.N=
ET_RX
>    4372094 =C2=B1  6%      -9.8%    3942290 =C2=B1  7%  softirqs.CPU125.N=
ET_RX
>    4234281 =C2=B1  3%     -13.7%    3654186 =C2=B1  9%  softirqs.CPU126.N=
ET_RX
>    4479486 =C2=B1  2%     -14.6%    3826867 =C2=B1  4%  softirqs.CPU127.N=
ET_RX
>    4505631 =C2=B1  4%     -13.8%    3882387 =C2=B1  4%  softirqs.CPU128.N=
ET_RX
>    4614368           -12.7%    4028612 =C2=B1  3%  softirqs.CPU129.NET_RX
>    3798156           -12.8%    3310999 =C2=B1  5%  softirqs.CPU13.NET_RX
>    4661150 =C2=B1  6%     -26.2%    3440798 =C2=B1  6%  softirqs.CPU130.N=
ET_RX
>    4363050 =C2=B1  4%     -15.0%    3709399 =C2=B1  8%  softirqs.CPU132.N=
ET_RX
>    4609795           -15.7%    3884896 =C2=B1  4%  softirqs.CPU133.NET_RX
>    4588413 =C2=B1  5%     -16.2%    3842947 =C2=B1  7%  softirqs.CPU134.N=
ET_RX
>    4429651           -11.1%    3939376 =C2=B1  2%  softirqs.CPU135.NET_RX
>    4470272           -12.7%    3903940 =C2=B1  3%  softirqs.CPU136.NET_RX
>    4305711 =C2=B1  3%     -13.5%    3724642 =C2=B1  5%  softirqs.CPU137.N=
ET_RX
>    4496653 =C2=B1  3%     -14.5%    3845019 =C2=B1  3%  softirqs.CPU138.N=
ET_RX
>    4406328 =C2=B1  2%     -16.1%    3695988 =C2=B1  7%  softirqs.CPU139.N=
ET_RX
>    3927090 =C2=B1  5%     -11.3%    3482506 =C2=B1  7%  softirqs.CPU14.NE=
T_RX
>    4087459           -14.0%    3516886 =C2=B1  7%  softirqs.CPU144.NET_RX
>    4481044 =C2=B1  4%     -24.5%    3381419 =C2=B1  6%  softirqs.CPU146.N=
ET_RX
>    4528686 =C2=B1  3%     -25.0%    3396947 =C2=B1  3%  softirqs.CPU147.N=
ET_RX
>    4582543           -21.7%    3587980 =C2=B1  3%  softirqs.CPU148.NET_RX
>    4450897           -19.6%    3580672 =C2=B1  4%  softirqs.CPU149.NET_RX
>    4528558 =C2=B1  3%     -22.6%    3504283        softirqs.CPU150.NET_RX
>    4577803 =C2=B1  7%     -21.5%    3595818 =C2=B1  4%  softirqs.CPU151.N=
ET_RX
>    4520894 =C2=B1  4%     -24.0%    3433758 =C2=B1  6%  softirqs.CPU152.N=
ET_RX
>    4555415 =C2=B1  2%     -20.3%    3629540        softirqs.CPU153.NET_RX
>    4443995 =C2=B1  4%     -18.4%    3627140        softirqs.CPU154.NET_RX
>    4464536 =C2=B1  4%     -19.4%    3599364 =C2=B1  3%  softirqs.CPU155.N=
ET_RX
>    4606987 =C2=B1  4%     -21.7%    3607224 =C2=B1  6%  softirqs.CPU156.N=
ET_RX
>    4562535 =C2=B1  8%     -22.1%    3555390        softirqs.CPU157.NET_RX
>    4654030           -19.8%    3730425        softirqs.CPU158.NET_RX
>    4663881 =C2=B1  6%     -23.8%    3552288 =C2=B1  3%  softirqs.CPU159.N=
ET_RX
>    4517462 =C2=B1  5%     -18.3%    3691938 =C2=B1  2%  softirqs.CPU160.N=
ET_RX
>    4642487 =C2=B1  5%     -20.2%    3705577 =C2=B1  4%  softirqs.CPU161.N=
ET_RX
>    4220823 =C2=B1  5%     -12.9%    3677375        softirqs.CPU162.NET_RX
>    4288759 =C2=B1  6%     -14.9%    3648769 =C2=B1  5%  softirqs.CPU163.N=
ET_RX
>    4296523           -14.2%    3688199        softirqs.CPU164.NET_RX
>    4209149 =C2=B1  7%     -11.4%    3730129        softirqs.CPU165.NET_RX
>    4261138 =C2=B1  3%     -17.5%    3514007        softirqs.CPU166.NET_RX
>    4247636 =C2=B1  6%     -19.1%    3436582        softirqs.CPU167.NET_RX
>    4220235 =C2=B1  3%     -14.4%    3610604 =C2=B1  2%  softirqs.CPU168.N=
ET_RX
>    4446471 =C2=B1  3%     -11.4%    3940332 =C2=B1  3%  softirqs.CPU169.N=
ET_RX
>    3771685 =C2=B1  4%     -18.0%    3092570 =C2=B1  8%  softirqs.CPU17.NE=
T_RX
>    4512174           -16.4%    3770901 =C2=B1  3%  softirqs.CPU170.NET_RX
>    4386298 =C2=B1  3%     -15.4%    3712136 =C2=B1  3%  softirqs.CPU171.N=
ET_RX
>    4634040 =C2=B1  3%     -19.2%    3743094 =C2=B1  2%  softirqs.CPU172.N=
ET_RX
>    4665603 =C2=B1  6%     -18.2%    3816978 =C2=B1  2%  softirqs.CPU173.N=
ET_RX
>    4593095 =C2=B1  4%     -23.5%    3514787 =C2=B1  6%  softirqs.CPU174.N=
ET_RX
>    4570347           -18.8%    3711642        softirqs.CPU175.NET_RX
>    4681793 =C2=B1  5%     -20.3%    3731275 =C2=B1  2%  softirqs.CPU176.N=
ET_RX
>    4641882 =C2=B1  3%     -19.8%    3721714        softirqs.CPU177.NET_RX
>    4529150 =C2=B1  5%     -14.9%    3853738        softirqs.CPU178.NET_RX
>    4432651 =C2=B1  6%     -16.6%    3696082 =C2=B1  2%  softirqs.CPU179.N=
ET_RX
>    4504028 =C2=B1  5%     -19.1%    3643315 =C2=B1  3%  softirqs.CPU180.N=
ET_RX
>    4466177 =C2=B1  5%     -11.8%    3940310        softirqs.CPU181.NET_RX
>    4490076 =C2=B1  4%     -15.6%    3789423        softirqs.CPU182.NET_RX
>    4440218           -14.0%    3820524        softirqs.CPU183.NET_RX
>    4371478 =C2=B1  5%     -15.3%    3703432 =C2=B1  3%  softirqs.CPU184.N=
ET_RX
>    4354388 =C2=B1  3%     -13.7%    3756557 =C2=B1  2%  softirqs.CPU185.N=
ET_RX
>    4354191 =C2=B1  4%     -14.8%    3711314 =C2=B1  9%  softirqs.CPU186.N=
ET_RX
>    4444305 =C2=B1  7%     -20.3%    3544094 =C2=B1  3%  softirqs.CPU187.N=
ET_RX
>    4451454 =C2=B1  8%     -19.8%    3571687 =C2=B1  8%  softirqs.CPU188.N=
ET_RX
>    4383265 =C2=B1  3%     -19.8%    3517233        softirqs.CPU189.NET_RX
>      59338 =C2=B1  2%     -10.2%      53259 =C2=B1  9%  softirqs.CPU189.S=
CHED
>    3825605 =C2=B1  3%     -12.0%    3368289 =C2=B1 10%  softirqs.CPU19.NE=
T_RX
>    4280065 =C2=B1  3%     -15.9%    3601094 =C2=B1  4%  softirqs.CPU190.N=
ET_RX
>    3676953 =C2=B1  8%     -17.5%    3033297 =C2=B1  8%  softirqs.CPU191.N=
ET_RX
>    3802796           -16.8%    3165372 =C2=B1  6%  softirqs.CPU2.NET_RX
>    3874226 =C2=B1  4%     -10.8%    3455080 =C2=B1 10%  softirqs.CPU21.NE=
T_RX
>    3748577           -12.8%    3268873 =C2=B1  6%  softirqs.CPU22.NET_RX
>    3684381 =C2=B1  6%     -18.7%    2995554 =C2=B1  8%  softirqs.CPU25.NE=
T_RX
>    3591091 =C2=B1  2%     -12.1%    3157301 =C2=B1  3%  softirqs.CPU26.NE=
T_RX
>    3509365 =C2=B1  4%     -12.0%    3087659 =C2=B1  5%  softirqs.CPU27.NE=
T_RX
>    3685334           -13.8%    3174965 =C2=B1  8%  softirqs.CPU28.NET_RX
>    3770853 =C2=B1  4%     -13.5%    3261723 =C2=B1  9%  softirqs.CPU29.NE=
T_RX
>    3730124 =C2=B1  2%     -18.8%    3030515 =C2=B1  9%  softirqs.CPU3.NET=
_RX
>    3835425           -12.8%    3343526 =C2=B1  8%  softirqs.CPU30.NET_RX
>    3711105 =C2=B1  3%     -10.0%    3340632 =C2=B1  5%  softirqs.CPU31.NE=
T_RX
>    3782259 =C2=B1  6%     -12.0%    3326617 =C2=B1  9%  softirqs.CPU32.NE=
T_RX
>    3665362 =C2=B1  2%     -13.5%    3169960 =C2=B1  7%  softirqs.CPU33.NE=
T_RX
>    3792050           -13.7%    3271013 =C2=B1  9%  softirqs.CPU35.NET_RX
>    3803708 =C2=B1  4%     -10.4%    3409892 =C2=B1  8%  softirqs.CPU36.NE=
T_RX
>    3676207 =C2=B1  2%     -13.6%    3176373 =C2=B1 11%  softirqs.CPU37.NE=
T_RX
>    3907579 =C2=B1  3%     -15.7%    3294163 =C2=B1 11%  softirqs.CPU39.NE=
T_RX
>    3895513 =C2=B1  2%     -16.1%    3269407 =C2=B1  6%  softirqs.CPU4.NET=
_RX
>    3902115           -13.4%    3380818 =C2=B1  5%  softirqs.CPU41.NET_RX
>    3782111 =C2=B1  2%     -12.7%    3302834 =C2=B1  2%  softirqs.CPU45.NE=
T_RX
>    3819362           -14.2%    3277066 =C2=B1  5%  softirqs.CPU47.NET_RX
>    3435417 =C2=B1  2%     -15.7%    2896680        softirqs.CPU48.NET_RX
>    3707479 =C2=B1  3%     -19.2%    2994598 =C2=B1  5%  softirqs.CPU49.NE=
T_RX
>    3818132           -12.4%    3344833 =C2=B1  6%  softirqs.CPU5.NET_RX
>    3519922 =C2=B1  2%     -11.6%    3111260 =C2=B1  9%  softirqs.CPU50.NE=
T_RX
>    3553205 =C2=B1  3%     -13.6%    3069104 =C2=B1 11%  softirqs.CPU52.NE=
T_RX
>    3603320 =C2=B1  2%     -13.0%    3133893 =C2=B1  5%  softirqs.CPU53.NE=
T_RX
>    3510331 =C2=B1  4%     -10.4%    3143773 =C2=B1  8%  softirqs.CPU55.NE=
T_RX
>    3632820           -10.2%    3262559 =C2=B1  4%  softirqs.CPU56.NET_RX
>    3556830           -11.4%    3150455 =C2=B1  6%  softirqs.CPU57.NET_RX
>    3749574 =C2=B1  3%     -16.6%    3125992 =C2=B1  7%  softirqs.CPU58.NE=
T_RX
>    3685127           -14.6%    3147644 =C2=B1 11%  softirqs.CPU59.NET_RX
>    3541812 =C2=B1  3%     -12.9%    3084025 =C2=B1 10%  softirqs.CPU62.NE=
T_RX
>    3630620 =C2=B1  2%     -16.2%    3040835 =C2=B1 11%  softirqs.CPU64.NE=
T_RX
>    3512694 =C2=B1  4%     -13.4%    3042849 =C2=B1  9%  softirqs.CPU65.NE=
T_RX
>    3718375 =C2=B1  2%     -18.4%    3034262 =C2=B1  9%  softirqs.CPU66.NE=
T_RX
>    3759247 =C2=B1  4%     -17.1%    3115068 =C2=B1  8%  softirqs.CPU67.NE=
T_RX
>    3780272           -16.5%    3155916 =C2=B1  7%  softirqs.CPU68.NET_RX
>    3743050 =C2=B1  5%     -19.2%    3023195 =C2=B1  6%  softirqs.CPU69.NE=
T_RX
>    3772006 =C2=B1  3%     -15.3%    3194984 =C2=B1 15%  softirqs.CPU7.NET=
_RX
>    3824234           -18.9%    3102892 =C2=B1  8%  softirqs.CPU70.NET_RX
>    3584616 =C2=B1  3%     -12.7%    3130058 =C2=B1  9%  softirqs.CPU71.NE=
T_RX
>    3476565 =C2=B1  4%      -9.7%    3138907        softirqs.CPU73.NET_RX
>    3785815 =C2=B1  2%     -14.3%    3245984 =C2=B1  5%  softirqs.CPU86.NE=
T_RX
>    3733749           -14.4%    3196342 =C2=B1  3%  softirqs.CPU87.NET_RX
>    3808621 =C2=B1  4%     -14.2%    3267130 =C2=B1  5%  softirqs.CPU88.NE=
T_RX
>    3844194 =C2=B1  4%     -14.3%    3292564 =C2=B1  4%  softirqs.CPU89.NE=
T_RX
>    3831167 =C2=B1  2%     -14.5%    3276392 =C2=B1  7%  softirqs.CPU90.NE=
T_RX
>    3738439 =C2=B1  6%     -10.7%    3337727 =C2=B1  7%  softirqs.CPU91.NE=
T_RX
>    3759392           -10.1%    3378439 =C2=B1  7%  softirqs.CPU94.NET_RX
>    4571157 =C2=B1  2%     -11.2%    4059121 =C2=B1  6%  softirqs.CPU96.NE=
T_RX
>    4478966           -14.5%    3829792 =C2=B1 11%  softirqs.CPU98.NET_RX
>   7.78e+08           -14.2%  6.672e+08 =C2=B1  4%  softirqs.NET_RX
>       2.63 =C2=B1  8%      -0.6        2.01 =C2=B1 12%  perf-profile.call=
trace.cycles-
> pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>       2.55 =C2=B1  8%      -0.6        1.95 =C2=B1 13%  perf-profile.call=
trace.cycles-
> pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       3.25 =C2=B1  9%      -0.6        2.67 =C2=B1 10%  perf-profile.call=
trace.cycles-
> pp.__schedule.schedule.schedule_timeout.sctp_skb_recv_datagram.sctp_recvm=
sg
>       3.68 =C2=B1  8%      -0.5        3.13 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg.____=
sys
> _recvmsg
>       3.59 =C2=B1  8%      -0.5        3.06 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.schedule.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_rec=
vms
> g
>       0.74 =C2=B1 21%      -0.4        0.36 =C2=B1 70%  perf-profile.call=
trace.cycles-
> pp.__skb_clone.sctp_ulpevent_make_rcvmsg.sctp_ulpq_tail_data.sctp_cmd_int=
erp
> reter.sctp_do_sm
>       1.64 =C2=B1  8%      -0.4        1.28 =C2=B1 19%  perf-profile.call=
trace.cycles-
> pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_com=
mon
> .__wake_up_common_lock
>       1.68 =C2=B1 14%      -0.4        1.32 =C2=B1 12%  perf-profile.call=
trace.cycles-
> pp.sctp_ulpq_tail_data.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.=
sct
> p_rcv
>       1.52 =C2=B1  8%      -0.4        1.17 =C2=B1 12%  perf-profile.call=
trace.cycles-
> pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
>       0.70 =C2=B1  6%      -0.3        0.36 =C2=B1 71%  perf-profile.call=
trace.cycles-
> pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
>       1.59 =C2=B1  9%      -0.3        1.26 =C2=B1 18%  perf-profile.call=
trace.cycles-
> pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_wake_func=
tio
> n.__wake_up_common
>       1.70 =C2=B1  9%      -0.3        1.38 =C2=B1 12%  perf-profile.call=
trace.cycles-
> pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.sctp_skb_recv_d=
ata
> gram
>       1.18 =C2=B1 15%      -0.3        0.87 =C2=B1 15%  perf-profile.call=
trace.cycles-
> pp.sctp_ulpevent_make_rcvmsg.sctp_ulpq_tail_data.sctp_cmd_interpreter.sct=
p_d
> o_sm.sctp_assoc_bh_rcv
>       1.25 =C2=B1  8%      -0.3        0.94 =C2=B1 13%  perf-profile.call=
trace.cycles-
> pp.pick_next_task_fair.__schedule.schedule_idle.do_idle.cpu_startup_entry
>       1.25 =C2=B1  8%      -0.3        1.00 =C2=B1 18%  perf-profile.call=
trace.cycles-
> pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autor=
emo
> ve_wake_function
>       0.64 =C2=B1  5%      -0.3        0.39 =C2=B1 71%  perf-profile.call=
trace.cycles-
> pp.do_ulpq_tail_event.sctp_cmd_interpreter.sctp_do_sm.sctp_cmd_interprete=
r.s
> ctp_do_sm
>       0.62 =C2=B1  6%      -0.2        0.37 =C2=B1 71%  perf-profile.call=
trace.cycles-
> pp.sctp_ulpq_tail_event.do_ulpq_tail_event.sctp_cmd_interpreter.sctp_do_s=
m.s
> ctp_cmd_interpreter
>       0.63 =C2=B1  6%      -0.2        0.38 =C2=B1 70%  perf-profile.call=
trace.cycles-
> pp.get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get_sleep_leng=
th.
> menu_select.do_idle
>       0.82 =C2=B1  8%      -0.2        0.64 =C2=B1 13%  perf-profile.call=
trace.cycles-
> pp.set_next_entity.pick_next_task_fair.__schedule.schedule_idle.do_idle
>       0.82 =C2=B1 10%      -0.1        0.68 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit.sctp_pack=
et_
> transmit
>       0.59 =C2=B1  8%      +0.1        0.69 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.sock_kmalloc.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64
>       0.96 =C2=B1 11%      +0.1        1.10 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.lock_sock_nested.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg.____=
sys
> _recvmsg
>       0.70 =C2=B1  8%      +0.1        0.84 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.__alloc_skb.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.=
sct
> p_do_sm
>       0.69 =C2=B1 10%      +0.1        0.83 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.kfree_skb.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sys_recvmsg
>       0.59 =C2=B1  7%      +0.1        0.74 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp._sctp_make_chunk.sctp_make_sack.sctp_packet_append_chunk.sctp_packet_t=
ran
> smit_chunk.sctp_outq_flush
>       1.07 =C2=B1  8%      +0.2        1.23 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.sctp_transport_reset_t3_rtx.sctp_outq_flush.sctp_cmd_interpreter.sctp_=
do_
> sm.sctp_primitive_SEND
>       0.84 =C2=B1 11%      +0.2        1.00 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock_bh.lock_sock_nested.sctp_skb_recv_datagram.sctp_recvmsg=
.in
> et_recvmsg
>       0.60 =C2=B1 10%      +0.2        0.77 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.sctp_chunk_free.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_as=
soc
> _bh_rcv
>       0.70 =C2=B1 10%      +0.2        0.91 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.mod_timer.sctp_transport_reset_t3_rtx.sctp_outq_flush.sctp_cmd_interpr=
ete
> r.sctp_do_sm
>       0.36 =C2=B1 70%      +0.3        0.63 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.mod_timer.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_rcv
>       0.36 =C2=B1 70%      +0.3        0.70 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.lock_timer_base.mod_timer.sctp_transport_reset_t3_rtx.sctp_outq_flush.=
sct
> p_cmd_interpreter
>       2.48 =C2=B1  7%      +0.4        2.92 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.sctp_packet_transmit_chunk.sctp_outq_flush.sctp_cmd_interpreter.sctp_d=
o_s
> m.sctp_primitive_SEND
>       1.27 =C2=B1  8%      +0.4        1.71 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.sctp_make_sack.sctp_packet_append_chunk.sctp_packet_transmit_chunk.sct=
p_o
> utq_flush.sctp_cmd_interpreter
>       2.34 =C2=B1  8%      +0.4        2.78 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.sctp_packet_append_chunk.sctp_packet_transmit_chunk.sctp_outq_flush.sc=
tp_
> cmd_interpreter.sctp_do_sm
>       0.18 =C2=B1141%      +0.5        0.66 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.kmem_cache_free.sctp_ulpevent_free.sctp_recvmsg.inet_recvmsg.____sys_r=
ecv
> msg
>       0.00            +0.6        0.56 =C2=B1  5%  perf-profile.calltrace=
.cycles-
> pp.__check_object_size.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_sy=
sca
> ll_64
>       0.00            +0.7        0.67 =C2=B1 17%  perf-profile.calltrace=
.cycles-
> pp.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_=
com
> mon.__wake_up_common_lock
>       0.00            +0.7        0.69 =C2=B1 15%  perf-profile.calltrace=
.cycles-
> pp.sched_ttwu_pending.flush_smp_call_function_from_idle.do_idle.cpu_start=
up_
> entry.start_secondary
>       0.00            +1.2        1.15 =C2=B1 16%  perf-profile.calltrace=
.cycles-
> pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.start_seco=
nda
> ry.secondary_startup_64_no_verify
>       5.86 =C2=B1  8%      -1.2        4.66 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__schedule
>       2.64 =C2=B1  7%      -0.6        2.02 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.schedule_idle
>       3.68 =C2=B1  8%      -0.5        3.13 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.schedule_timeout
>       3.60 =C2=B1  8%      -0.5        3.06 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.schedule
>       0.72 =C2=B1  8%      -0.4        0.32 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.select_task_rq_fair
>       1.68 =C2=B1 14%      -0.4        1.32 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpq_tail_data
>       1.52 =C2=B1  8%      -0.4        1.17 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.dequeue_entity
>       1.70 =C2=B1  9%      -0.3        1.38 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.dequeue_task_fair
>       1.18 =C2=B1 15%      -0.3        0.88 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpevent_make_rcvmsg
>       1.37 =C2=B1  9%      -0.3        1.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.pick_next_task_fair
>       0.74 =C2=B1 21%      -0.3        0.47 =C2=B1 21%  perf-profile.chil=
dren.cycles-p
> p.__skb_clone
>       1.79 =C2=B1  8%      -0.3        1.53 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.ttwu_do_activate
>       0.66 =C2=B1 22%      -0.3        0.40 =C2=B1 24%  perf-profile.chil=
dren.cycles-p
> p.__copy_skb_header
>       1.26 =C2=B1  9%      -0.3        1.01 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.update_load_avg
>       1.73 =C2=B1  8%      -0.2        1.50 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.enqueue_task_fair
>       0.74 =C2=B1  7%      -0.2        0.56 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.update_curr
>       1.38 =C2=B1  8%      -0.2        1.20 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.enqueue_entity
>       0.83 =C2=B1  8%      -0.2        0.65 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.set_next_entity
>       0.80 =C2=B1  8%      -0.2        0.63 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.update_rq_clock
>       0.82 =C2=B1 10%      -0.1        0.68 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.__dev_queue_xmit
>       0.95 =C2=B1  8%      -0.1        0.82 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpq_tail_event
>       0.34 =C2=B1 17%      -0.1        0.22 =C2=B1 21%  perf-profile.chil=
dren.cycles-p
> p.ipv4_dst_check
>       0.26 =C2=B1 16%      -0.1        0.14 =C2=B1 31%  perf-profile.chil=
dren.cycles-p
> p.__ip_finish_output
>       0.35 =C2=B1  8%      -0.1        0.24 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.pick_next_entity
>       0.83 =C2=B1  7%      -0.1        0.73 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.copy_msghdr_from_user
>       0.27 =C2=B1 11%      -0.1        0.17 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.resched_curr
>       0.32 =C2=B1 10%      -0.1        0.23 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.__update_load_avg_se
>       0.64 =C2=B1  5%      -0.1        0.56 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.do_ulpq_tail_event
>       0.49 =C2=B1  6%      -0.1        0.40 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sctp_association_put
>       0.55 =C2=B1  8%      -0.1        0.46 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.dev_hard_start_xmit
>       0.49 =C2=B1  9%      -0.1        0.41 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.loopback_xmit
>       0.64 =C2=B1  6%      -0.1        0.56 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.get_next_timer_interrupt
>       0.57 =C2=B1  7%      -0.1        0.49 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sctp_queue_purge_ulpevents
>       0.21 =C2=B1 30%      -0.1        0.13 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.ip_rcv_finish_core
>       0.31 =C2=B1  9%      -0.1        0.24 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.check_preempt_curr
>       0.43 =C2=B1  8%      -0.1        0.36 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.sctp_datamsg_put
>       0.33 =C2=B1  8%      -0.1        0.26 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.ttwu_do_wakeup
>       0.27 =C2=B1  9%      -0.1        0.20 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.switch_mm_irqs_off
>       0.47 =C2=B1  7%      -0.1        0.41 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.import_iovec
>       0.28 =C2=B1  8%      -0.1        0.23 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p._copy_from_iter_full
>       0.41 =C2=B1  6%      -0.1        0.36 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.sendmsg_copy_msghdr
>       0.24 =C2=B1  9%      -0.1        0.19 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.reweight_entity
>       0.10            -0.1        0.05        perf-profile.children.cycle=
s-p
> p.perf_trace_sched_stat_runtime
>       0.27 =C2=B1 13%      -0.0        0.22 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.sctp_data_ready
>       0.38 =C2=B1  6%      -0.0        0.33 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__switch_to_asm
>       0.37 =C2=B1  5%      -0.0        0.32 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.sctp_ulpevent_new
>       0.54 =C2=B1  5%      -0.0        0.50 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_unlock_irqrestore
>       0.31 =C2=B1  7%      -0.0        0.27 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.read_tsc
>       0.07 =C2=B1 12%      -0.0        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-p
> p.cpuidle_not_available
>       0.19 =C2=B1  4%      -0.0        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.finish_task_switch
>       0.16 =C2=B1  8%      -0.0        0.13 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.sctp_outq_tail
>       0.17 =C2=B1  8%      -0.0        0.14 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.sctp_inq_pop
>       0.17 =C2=B1  5%      -0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p._find_next_bit
>       0.11 =C2=B1 11%      -0.0        0.09 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.update_min_vruntime
>       0.12 =C2=B1  7%      -0.0        0.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.__kmalloc
>       0.10 =C2=B1  8%      -0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.sctp_validate_data
>       0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.cpuacct_charge
>       0.07            -0.0        0.05 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.sctp_v4_xmit
>       0.06 =C2=B1 13%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.set_next_task_idle
>       0.07 =C2=B1 11%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.pick_next_task_idle
>       0.13 =C2=B1 10%      +0.0        0.16 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.___slab_alloc
>       0.14 =C2=B1 11%      +0.0        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__slab_alloc
>       0.14 =C2=B1  9%      +0.0        0.18 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.ip_finish_output
>       0.28 =C2=B1 12%      +0.1        0.34 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.ip_send_check
>       0.26 =C2=B1 11%      +0.1        0.32 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sctp_transport_put
>       0.17 =C2=B1 11%      +0.1        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.skb_put
>       0.12 =C2=B1 18%      +0.1        0.18 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sctp_transport_burst_limited
>       0.39 =C2=B1  8%      +0.1        0.45 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.memset_erms
>       0.27 =C2=B1  8%      +0.1        0.33 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.internal_add_timer
>       0.25 =C2=B1  6%      +0.1        0.32 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.simple_copy_to_iter
>       0.23 =C2=B1  9%      +0.1        0.30 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.enqueue_timer
>       0.00            +0.1        0.08 =C2=B1 12%  perf-profile.children.=
cycles-p
> p.__enqueue_entity
>       0.24 =C2=B1 12%      +0.1        0.32 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.aa_sk_perm
>       0.07 =C2=B1 17%      +0.1        0.15 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.sctp_bind_addr_match
>       0.50 =C2=B1  7%      +0.1        0.59 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.kmem_cache_alloc
>       0.08 =C2=B1  6%      +0.1        0.17 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.available_idle_cpu
>       0.59 =C2=B1  8%      +0.1        0.69 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.sctp_user_addto_chunk
>       0.18 =C2=B1 11%      +0.1        0.28 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.security_socket_sendmsg
>       0.59 =C2=B1  8%      +0.1        0.69 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sock_kmalloc
>       0.40 =C2=B1 10%      +0.1        0.51 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.skb_set_owner_w
>       0.51 =C2=B1 11%      +0.1        0.63 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sctp_addto_chunk
>       1.07 =C2=B1  8%      +0.2        1.23 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.sctp_transport_reset_t3_rtx
>       0.05 =C2=B1  8%      +0.2        0.22 =C2=B1 18%  perf-profile.chil=
dren.cycles-p
> p.llist_reverse_order
>       0.61 =C2=B1 10%      +0.2        0.78 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.sctp_chunk_free
>       0.08 =C2=B1 16%      +0.2        0.25 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.send_call_function_single_ipi
>       0.06 =C2=B1 16%      +0.2        0.23 =C2=B1 22%  perf-profile.chil=
dren.cycles-p
> p.__smp_call_single_queue
>       0.79 =C2=B1  9%      +0.2        0.98 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.__ksize
>       0.04 =C2=B1 71%      +0.2        0.23 =C2=B1 22%  perf-profile.chil=
dren.cycles-p
> p.llist_add_batch
>       0.57 =C2=B1  8%      +0.2        0.76 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.sctp_chunkify
>       1.00 =C2=B1  8%      +0.2        1.23 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__check_object_size
>       0.07 =C2=B1 11%      +0.2        0.31 =C2=B1 18%  perf-profile.chil=
dren.cycles-p
> p.flush_smp_call_function_queue
>       1.66 =C2=B1  8%      +0.2        1.91 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.lock_timer_base
>       1.53 =C2=B1  8%      +0.3        1.80 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p._sctp_make_chunk
>       1.91 =C2=B1  9%      +0.3        2.20 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.kmem_cache_free
>       1.22 =C2=B1  9%      +0.3        1.57 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.mod_timer
>       1.34 =C2=B1  8%      +0.4        1.76 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.sctp_make_sack
>       0.27 =C2=B1 10%      +0.4        0.70 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.sched_ttwu_pending
>       2.48 =C2=B1  7%      +0.4        2.92 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.sctp_packet_transmit_chunk
>       2.34 =C2=B1  8%      +0.5        2.79 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.sctp_packet_append_chunk
>       0.20 =C2=B1 10%      +0.5        0.67 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.ttwu_queue_wakelist
>       1.80 =C2=B1  9%      +0.6        2.43 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.__slab_free
>       0.36 =C2=B1 10%      +0.8        1.16 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.flush_smp_call_function_from_idle
>       1.27 =C2=B1  9%      -0.4        0.90 =C2=B1 14%  perf-profile.self=
.cycles-pp.__
> schedule
>       0.65 =C2=B1 21%      -0.3        0.40 =C2=B1 24%  perf-profile.self=
.cycles-pp.__
> copy_skb_header
>       0.61 =C2=B1  8%      -0.1        0.46 =C2=B1 16%  perf-profile.self=
.cycles-pp.up
> date_rq_clock
>       0.76 =C2=B1  9%      -0.1        0.63 =C2=B1  9%  perf-profile.self=
.cycles-pp.sc
> tp_wfree
>       0.48 =C2=B1  7%      -0.1        0.35 =C2=B1 15%  perf-profile.self=
.cycles-pp.se
> t_next_entity
>       0.49 =C2=B1  7%      -0.1        0.36 =C2=B1 15%  perf-profile.self=
.cycles-pp.__
> update_load_avg_cfs_rq
>       0.34 =C2=B1 17%      -0.1        0.22 =C2=B1 21%  perf-profile.self=
.cycles-pp.ip
> v4_dst_check
>       0.26 =C2=B1  6%      -0.1        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.se
> lect_task_rq_fair
>       0.34 =C2=B1  6%      -0.1        0.23 =C2=B1 15%  perf-profile.self=
.cycles-pp.pi
> ck_next_entity
>       0.53 =C2=B1  7%      -0.1        0.42 =C2=B1  8%  perf-profile.self=
.cycles-pp.do
> _idle
>       0.26 =C2=B1 12%      -0.1        0.17 =C2=B1 10%  perf-profile.self=
.cycles-pp.re
> sched_curr
>       0.49 =C2=B1  6%      -0.1        0.39 =C2=B1  9%  perf-profile.self=
.cycles-pp.sc
> tp_association_put
>       0.30 =C2=B1 10%      -0.1        0.22 =C2=B1 16%  perf-profile.self=
.cycles-pp.__
> update_load_avg_se
>       0.29 =C2=B1 10%      -0.1        0.21 =C2=B1 12%  perf-profile.self=
.cycles-pp.up
> date_curr
>       0.21 =C2=B1 31%      -0.1        0.13 =C2=B1 12%  perf-profile.self=
.cycles-pp.ip
> _rcv_finish_core
>       0.37 =C2=B1  8%      -0.1        0.30 =C2=B1 13%  perf-profile.self=
.cycles-pp.en
> queue_entity
>       0.26 =C2=B1  9%      -0.1        0.20 =C2=B1 17%  perf-profile.self=
.cycles-pp.sw
> itch_mm_irqs_off
>       0.36 =C2=B1  3%      -0.1        0.30 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> tp_transport_reset_t3_rtx
>       0.35 =C2=B1  8%      -0.1        0.30 =C2=B1 15%  perf-profile.self=
.cycles-pp.en
> queue_task_fair
>       0.24 =C2=B1  9%      -0.1        0.19 =C2=B1 12%  perf-profile.self=
.cycles-pp.re
> weight_entity
>       0.10            -0.1        0.05        perf-profile.self.cycles-pp=
.pe
> rf_trace_sched_stat_runtime
>       0.38 =C2=B1  6%      -0.0        0.33 =C2=B1 10%  perf-profile.self=
.cycles-pp.__
> switch_to_asm
>       0.22 =C2=B1  7%      -0.0        0.18 =C2=B1 10%  perf-profile.self=
.cycles-pp.en
> try_SYSCALL_64_after_hwframe
>       0.27 =C2=B1 12%      -0.0        0.22 =C2=B1 12%  perf-profile.self=
.cycles-pp.sc
> tp_data_ready
>       0.28 =C2=B1  4%      -0.0        0.23 =C2=B1  8%  perf-profile.self=
.cycles-pp.__
> softirqentry_text_start
>       0.23 =C2=B1 11%      -0.0        0.18 =C2=B1 13%  perf-profile.self=
.cycles-pp.sc
> tp_datamsg_put
>       0.07 =C2=B1 12%      -0.0        0.03 =C2=B1 70%  perf-profile.self=
.cycles-pp.cp
> uidle_not_available
>       0.50 =C2=B1  5%      -0.0        0.46 =C2=B1  6%  perf-profile.self=
.cycles-pp._r
> aw_spin_unlock_irqrestore
>       0.15 =C2=B1 11%      -0.0        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.__
> __sys_sendmsg
>       0.14 =C2=B1 10%      -0.0        0.11 =C2=B1 15%  perf-profile.self=
.cycles-pp.sc
> tp_outq_tail
>       0.12 =C2=B1  6%      -0.0        0.09 =C2=B1 13%  perf-profile.self=
.cycles-pp.pe
> rf_trace_sched_wakeup_template
>       0.18 =C2=B1  7%      -0.0        0.16 =C2=B1 10%  perf-profile.self=
.cycles-pp.pr
> ocess_backlog
>       0.13 =C2=B1  9%      -0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.do
> _softirq
>       0.11 =C2=B1 11%      -0.0        0.09 =C2=B1  9%  perf-profile.self=
.cycles-pp.up
> date_min_vruntime
>       0.17 =C2=B1  2%      -0.0        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp._f
> ind_next_bit
>       0.15 =C2=B1  3%      -0.0        0.13 =C2=B1  9%  perf-profile.self=
.cycles-pp.fi
> nish_task_switch
>       0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.cp
> uacct_charge
>       0.15 =C2=B1  3%      -0.0        0.13 =C2=B1  6%  perf-profile.self=
.cycles-pp.ne
> t_rx_action
>       0.13 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.__
> virt_addr_valid
>       0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  9%  perf-profile.self=
.cycles-pp.sc
> tp_packet_pack
>       0.09 =C2=B1  9%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.__
> _sys_recvmsg
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.__
> import_iovec
>       0.07 =C2=B1  7%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> tp_v4_xmit
>       0.08            -0.0        0.07        perf-profile.self.cycles-pp=
.sc
> tp_v4_from_skb
>       0.07 =C2=B1  6%      +0.0        0.09 =C2=B1  9%  perf-profile.self=
.cycles-pp.pe
> rf_tp_event
>       0.45 =C2=B1  2%      +0.0        0.48        perf-profile.self.cycl=
es-pp.sc
> tp_rcv
>       0.13 =C2=B1 10%      +0.0        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> _slab_alloc
>       0.14 =C2=B1 11%      +0.0        0.18 =C2=B1 14%  perf-profile.self=
.cycles-pp.de
> queue_task_fair
>       0.23 =C2=B1  9%      +0.0        0.27 =C2=B1  8%  perf-profile.self=
.cycles-pp.ip
> _finish_output2
>       0.12 =C2=B1 11%      +0.0        0.17 =C2=B1  5%  perf-profile.self=
.cycles-pp.sk
> b_put
>       0.07 =C2=B1 18%      +0.0        0.11 =C2=B1 11%  perf-profile.self=
.cycles-pp.pi
> ck_next_task_fair
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.sc
> tp_control_set_owner_w
>       0.32 =C2=B1  4%      +0.0        0.37 =C2=B1  3%  perf-profile.self=
.cycles-pp.sc
> hedule
>       0.28 =C2=B1 12%      +0.0        0.33 =C2=B1  9%  perf-profile.self=
.cycles-pp.ip
> _send_check
>       0.26 =C2=B1 11%      +0.1        0.31 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> tp_transport_put
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 17%  perf-profile.self=
.cycles-pp.ch
> eck_preempt_curr
>       0.08 =C2=B1 10%      +0.1        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp.sc
> tp_hash_cmp
>       0.12 =C2=B1 18%      +0.1        0.18 =C2=B1  9%  perf-profile.self=
.cycles-pp.sc
> tp_transport_burst_limited
>       0.37 =C2=B1  8%      +0.1        0.44 =C2=B1  4%  perf-profile.self=
.cycles-pp.me
> mset_erms
>       0.07 =C2=B1 12%      +0.1        0.14 =C2=B1 14%  perf-profile.self=
.cycles-pp.__
> wake_up_common
>       0.39 =C2=B1  8%      +0.1        0.46 =C2=B1 10%  perf-profile.self=
.cycles-pp.sc
> tp_sf_eat_sack_6_2
>       0.23 =C2=B1  9%      +0.1        0.30 =C2=B1  5%  perf-profile.self=
.cycles-pp.en
> queue_timer
>       0.00            +0.1        0.08 =C2=B1 12%  perf-profile.self.cycl=
es-pp.__
> enqueue_entity
>       0.30 =C2=B1  7%      +0.1        0.39 =C2=B1  7%  perf-profile.self=
.cycles-pp.tr
> y_to_wake_up
>       0.59 =C2=B1  9%      +0.1        0.67 =C2=B1  6%  perf-profile.self=
.cycles-pp._r
> aw_spin_lock_bh
>       0.04 =C2=B1 71%      +0.1        0.13 =C2=B1 19%  perf-profile.self=
.cycles-pp.sc
> tp_bind_addr_match
>       0.16 =C2=B1 10%      +0.1        0.25 =C2=B1  7%  perf-profile.self=
.cycles-pp.sc
> tp_addto_chunk
>       0.07 =C2=B1 12%      +0.1        0.17 =C2=B1 12%  perf-profile.self=
.cycles-pp.av
> ailable_idle_cpu
>       0.44 =C2=B1  9%      +0.1        0.53 =C2=B1  2%  perf-profile.self=
.cycles-pp.sc
> tp_recvmsg
>       0.00            +0.1        0.09 =C2=B1 18%  perf-profile.self.cycl=
es-pp.fl
> ush_smp_call_function_queue
>       0.19 =C2=B1 14%      +0.1        0.28 =C2=B1 10%  perf-profile.self=
.cycles-pp.aa
> _sk_perm
>       0.46 =C2=B1 10%      +0.1        0.55 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> tp_outq_select_transport
>       0.12 =C2=B1 10%      +0.1        0.21 =C2=B1  9%  perf-profile.self=
.cycles-pp.sc
> tp_chunkify
>       0.22 =C2=B1 15%      +0.1        0.33 =C2=B1  6%  perf-profile.self=
.cycles-pp.mo
> d_timer
>       0.07 =C2=B1  7%      +0.1        0.18 =C2=B1 12%  perf-profile.self=
.cycles-pp.tt
> wu_queue_wakelist
>       0.39 =C2=B1 11%      +0.1        0.51 =C2=B1  6%  perf-profile.self=
.cycles-pp.sk
> b_set_owner_w
>       0.54 =C2=B1  7%      +0.1        0.66 =C2=B1  5%  perf-profile.self=
.cycles-pp.sc
> tp_packet_config
>       0.47 =C2=B1  8%      +0.1        0.59 =C2=B1  6%  perf-profile.self=
.cycles-pp.so
> ck_kmalloc
>       0.18 =C2=B1 10%      +0.1        0.31 =C2=B1 11%  perf-profile.self=
.cycles-pp.sc
> tp_user_addto_chunk
>       0.66 =C2=B1  8%      +0.1        0.80 =C2=B1  4%  perf-profile.self=
.cycles-pp.sc
> tp_sendmsg_to_asoc
>       0.41 =C2=B1  8%      +0.1        0.54 =C2=B1  6%  perf-profile.self=
.cycles-pp.sc
> tp_make_sack
>       0.82 =C2=B1  7%      +0.1        0.96 =C2=B1  6%  perf-profile.self=
.cycles-pp.km
> em_cache_free
>       0.48 =C2=B1 11%      +0.1        0.62 =C2=B1 12%  perf-profile.self=
.cycles-pp.sc
> tp_cmd_interpreter
>       0.05 =C2=B1  8%      +0.2        0.21 =C2=B1 17%  perf-profile.self=
.cycles-pp.sc
> hed_ttwu_pending
>       0.00            +0.2        0.15 =C2=B1 16%  perf-profile.self.cycl=
es-pp.fl
> ush_smp_call_function_from_idle
>       0.05 =C2=B1  8%      +0.2        0.21 =C2=B1 17%  perf-profile.self=
.cycles-pp.ll
> ist_reverse_order
>       0.08 =C2=B1 16%      +0.2        0.25 =C2=B1 14%  perf-profile.self=
.cycles-pp.se
> nd_call_function_single_ipi
>       0.54 =C2=B1  9%      +0.2        0.71 =C2=B1 10%  perf-profile.self=
.cycles-pp.lo
> ck_timer_base
>       0.79 =C2=B1  8%      +0.2        0.97 =C2=B1  8%  perf-profile.self=
.cycles-pp.__
> ksize
>       0.04 =C2=B1 71%      +0.2        0.23 =C2=B1 22%  perf-profile.self=
.cycles-pp.ll
> ist_add_batch
>       1.05 =C2=B1  7%      +0.2        1.24 =C2=B1  6%  perf-profile.self=
.cycles-pp.sc
> tp_outq_sack
>       0.55 =C2=B1  9%      +0.2        0.77 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> check_object_size
>       1.78 =C2=B1 10%      +0.6        2.41 =C2=B1  8%  perf-profile.self=
.cycles-pp.__
> slab_free
>      15919 =C2=B1  5%     -97.3%     423.00 =C2=B1 63%  interrupts.34:PCI=
-MSI.524292-e
> dge.eth0-TxRx-3
>     751859 =C2=B1  9%     +84.5%    1387425 =C2=B1  9%  interrupts.CAL:Fu=
nction_call_i
> nterrupts
>      54884 =C2=B1 10%     -21.1%      43281 =C2=B1 14%  interrupts.CPU0.R=
ES:Rescheduli
> ng_interrupts
>      55529 =C2=B1  6%     -26.2%      40984 =C2=B1 21%  interrupts.CPU1.R=
ES:Rescheduli
> ng_interrupts
>      53232 =C2=B1  8%     -23.7%      40611 =C2=B1 15%  interrupts.CPU10.=
RES:Reschedul
> ing_interrupts
>       3209 =C2=B1  4%    +124.2%       7196 =C2=B1 16%  interrupts.CPU100=
.CAL:Function
> _call_interrupts
>      62177 =C2=B1  6%     -25.3%      46453 =C2=B1 15%  interrupts.CPU100=
.RES:Reschedu
> ling_interrupts
>       3398          +117.1%       7377 =C2=B1 14%  interrupts.CPU101.CAL:=
Function
> _call_interrupts
>      63075 =C2=B1  9%     -38.8%      38600 =C2=B1 26%  interrupts.CPU101=
.RES:Reschedu
> ling_interrupts
>       2962 =C2=B1  3%    +128.5%       6770 =C2=B1 11%  interrupts.CPU102=
.CAL:Function
> _call_interrupts
>       3184 =C2=B1 11%     +97.5%       6287 =C2=B1 12%  interrupts.CPU103=
.CAL:Function
> _call_interrupts
>      65846 =C2=B1  7%     -36.8%      41637 =C2=B1 28%  interrupts.CPU103=
.RES:Reschedu
> ling_interrupts
>       3200 =C2=B1  7%    +118.4%       6989 =C2=B1 21%  interrupts.CPU104=
.CAL:Function
> _call_interrupts
>      65280 =C2=B1  7%     -35.2%      42298 =C2=B1 17%  interrupts.CPU104=
.RES:Reschedu
> ling_interrupts
>       2975 =C2=B1  2%    +129.5%       6826 =C2=B1 18%  interrupts.CPU105=
.CAL:Function
> _call_interrupts
>      65522 =C2=B1  8%     -26.3%      48286 =C2=B1 20%  interrupts.CPU105=
.RES:Reschedu
> ling_interrupts
>       1517 =C2=B1136%     -98.2%      28.00 =C2=B1 54%  interrupts.CPU105=
.TLB:TLB_shoo
> tdowns
>       3287 =C2=B1 12%    +115.8%       7095 =C2=B1 18%  interrupts.CPU106=
.CAL:Function
> _call_interrupts
>      64170           -26.6%      47108 =C2=B1 25%  interrupts.CPU106.RES:=
Reschedu
> ling_interrupts
>       3181 =C2=B1  5%    +110.4%       6693 =C2=B1 21%  interrupts.CPU107=
.CAL:Function
> _call_interrupts
>       5238 =C2=B1  8%     -29.4%       3697 =C2=B1 24%  interrupts.CPU107=
.NMI:Non-mask
> able_interrupts
>       5238 =C2=B1  8%     -29.4%       3697 =C2=B1 24%  interrupts.CPU107=
.PMI:Performa
> nce_monitoring_interrupts
>      61281 =C2=B1 17%     -25.5%      45648 =C2=B1 19%  interrupts.CPU107=
.RES:Reschedu
> ling_interrupts
>       3088 =C2=B1  7%    +146.5%       7614 =C2=B1 15%  interrupts.CPU108=
.CAL:Function
> _call_interrupts
>      69838 =C2=B1 10%     -34.3%      45913 =C2=B1  8%  interrupts.CPU108=
.RES:Reschedu
> ling_interrupts
>       3330 =C2=B1  7%    +121.4%       7374 =C2=B1 19%  interrupts.CPU109=
.CAL:Function
> _call_interrupts
>      67470 =C2=B1 12%     -34.3%      44360 =C2=B1 20%  interrupts.CPU109=
.RES:Reschedu
> ling_interrupts
>      50298 =C2=B1 10%     -30.5%      34955 =C2=B1 10%  interrupts.CPU11.=
RES:Reschedul
> ing_interrupts
>       3229 =C2=B1  3%    +120.5%       7119 =C2=B1 20%  interrupts.CPU110=
.CAL:Function
> _call_interrupts
>      65803 =C2=B1 13%     -31.8%      44903 =C2=B1 19%  interrupts.CPU110=
.RES:Reschedu
> ling_interrupts
>       3312          +106.6%       6844 =C2=B1 16%  interrupts.CPU111.CAL:=
Function
> _call_interrupts
>       3031 =C2=B1  2%    +128.7%       6932 =C2=B1 22%  interrupts.CPU112=
.CAL:Function
> _call_interrupts
>      63944 =C2=B1  7%     -37.4%      40004 =C2=B1 16%  interrupts.CPU112=
.RES:Reschedu
> ling_interrupts
>       3686 =C2=B1 14%     +71.3%       6314 =C2=B1 25%  interrupts.CPU113=
.CAL:Function
> _call_interrupts
>      63525 =C2=B1 11%     -35.8%      40762 =C2=B1  9%  interrupts.CPU113=
.RES:Reschedu
> ling_interrupts
>       3281 =C2=B1 11%    +128.2%       7487 =C2=B1 28%  interrupts.CPU114=
.CAL:Function
> _call_interrupts
>      66773 =C2=B1  5%     -36.8%      42175 =C2=B1 21%  interrupts.CPU114=
.RES:Reschedu
> ling_interrupts
>       3186 =C2=B1  8%    +120.8%       7035 =C2=B1 24%  interrupts.CPU115=
.CAL:Function
> _call_interrupts
>      62617 =C2=B1 10%     -31.5%      42877 =C2=B1 22%  interrupts.CPU115=
.RES:Reschedu
> ling_interrupts
>       3352 =C2=B1 12%     +99.7%       6695 =C2=B1 28%  interrupts.CPU116=
.CAL:Function
> _call_interrupts
>      64009 =C2=B1 10%     -44.5%      35503 =C2=B1 27%  interrupts.CPU116=
.RES:Reschedu
> ling_interrupts
>       3264 =C2=B1  5%    +113.4%       6968 =C2=B1 18%  interrupts.CPU117=
.CAL:Function
> _call_interrupts
>       5484 =C2=B1  8%     -18.9%       4445 =C2=B1 14%  interrupts.CPU117=
.NMI:Non-mask
> able_interrupts
>       5484 =C2=B1  8%     -18.9%       4445 =C2=B1 14%  interrupts.CPU117=
.PMI:Performa
> nce_monitoring_interrupts
>      61430 =C2=B1  4%     -28.2%      44102 =C2=B1 14%  interrupts.CPU117=
.RES:Reschedu
> ling_interrupts
>       3297 =C2=B1  6%    +105.6%       6778 =C2=B1 16%  interrupts.CPU118=
.CAL:Function
> _call_interrupts
>      55953 =C2=B1 10%     -21.8%      43768 =C2=B1 24%  interrupts.CPU118=
.RES:Reschedu
> ling_interrupts
>       3803 =C2=B1  5%     +90.8%       7255 =C2=B1 21%  interrupts.CPU119=
.CAL:Function
> _call_interrupts
>       3904 =C2=B1 22%     +32.9%       5188 =C2=B1 11%  interrupts.CPU119=
.NMI:Non-mask
> able_interrupts
>       3904 =C2=B1 22%     +32.9%       5188 =C2=B1 11%  interrupts.CPU119=
.PMI:Performa
> nce_monitoring_interrupts
>      56205 =C2=B1 12%     -34.9%      36592 =C2=B1 10%  interrupts.CPU119=
.RES:Reschedu
> ling_interrupts
>      50941 =C2=B1 15%     -21.0%      40239 =C2=B1  6%  interrupts.CPU12.=
RES:Reschedul
> ing_interrupts
>       3106 =C2=B1 10%    +132.5%       7220 =C2=B1 13%  interrupts.CPU120=
.CAL:Function
> _call_interrupts
>       3299 =C2=B1  9%    +127.3%       7497 =C2=B1  8%  interrupts.CPU121=
.CAL:Function
> _call_interrupts
>       3101 =C2=B1  6%    +135.7%       7308 =C2=B1 14%  interrupts.CPU122=
.CAL:Function
> _call_interrupts
>      57191 =C2=B1 15%     -27.1%      41683 =C2=B1 18%  interrupts.CPU122=
.RES:Reschedu
> ling_interrupts
>       3832 =C2=B1 28%     +84.7%       7076 =C2=B1 13%  interrupts.CPU123=
.CAL:Function
> _call_interrupts
>       3092 =C2=B1  7%    +138.1%       7364 =C2=B1 10%  interrupts.CPU124=
.CAL:Function
> _call_interrupts
>      54730 =C2=B1 18%     -31.1%      37682 =C2=B1 12%  interrupts.CPU124=
.RES:Reschedu
> ling_interrupts
>       3427 =C2=B1 13%     +82.8%       6264 =C2=B1  8%  interrupts.CPU125=
.CAL:Function
> _call_interrupts
>      49209 =C2=B1  9%     -17.3%      40707 =C2=B1 13%  interrupts.CPU125=
.RES:Reschedu
> ling_interrupts
>       3162          +139.0%       7556 =C2=B1 17%  interrupts.CPU126.CAL:=
Function
> _call_interrupts
>      53055 =C2=B1 17%     -27.7%      38379 =C2=B1 19%  interrupts.CPU126=
.RES:Reschedu
> ling_interrupts
>       2955 =C2=B1  9%    +137.6%       7023 =C2=B1 13%  interrupts.CPU127=
.CAL:Function
> _call_interrupts
>      55865 =C2=B1 11%     -23.2%      42886 =C2=B1 20%  interrupts.CPU127=
.RES:Reschedu
> ling_interrupts
>       2940 =C2=B1  4%    +123.3%       6567 =C2=B1  8%  interrupts.CPU128=
.CAL:Function
> _call_interrupts
>      59120 =C2=B1 16%     -32.0%      40186 =C2=B1  6%  interrupts.CPU128=
.RES:Reschedu
> ling_interrupts
>       3061 =C2=B1 10%    +115.7%       6604 =C2=B1 10%  interrupts.CPU129=
.CAL:Function
> _call_interrupts
>       5516 =C2=B1  6%     -29.6%       3886 =C2=B1 25%  interrupts.CPU129=
.NMI:Non-mask
> able_interrupts
>       5516 =C2=B1  6%     -29.6%       3886 =C2=B1 25%  interrupts.CPU129=
.PMI:Performa
> nce_monitoring_interrupts
>      15919 =C2=B1  5%     -97.3%     423.00 =C2=B1 63%  interrupts.CPU13.=
34:PCI-MSI.52
> 4292-edge.eth0-TxRx-3
>       5573 =C2=B1 26%     +37.4%       7660 =C2=B1 11%  interrupts.CPU13.=
CAL:Function_
> call_interrupts
>      57633 =C2=B1  8%     -31.1%      39714 =C2=B1 14%  interrupts.CPU13.=
RES:Reschedul
> ing_interrupts
>       3140 =C2=B1  7%    +135.0%       7381 =C2=B1 11%  interrupts.CPU130=
.CAL:Function
> _call_interrupts
>      60476 =C2=B1 17%     -39.9%      36335 =C2=B1 16%  interrupts.CPU130=
.RES:Reschedu
> ling_interrupts
>       2773 =C2=B1  8%    +153.7%       7037 =C2=B1 13%  interrupts.CPU131=
.CAL:Function
> _call_interrupts
>       5010 =C2=B1 13%     -28.0%       3606 =C2=B1 21%  interrupts.CPU131=
.NMI:Non-mask
> able_interrupts
>       5010 =C2=B1 13%     -28.0%       3606 =C2=B1 21%  interrupts.CPU131=
.PMI:Performa
> nce_monitoring_interrupts
>       2917 =C2=B1 13%    +131.5%       6755 =C2=B1  9%  interrupts.CPU132=
.CAL:Function
> _call_interrupts
>      56642 =C2=B1 11%     -29.7%      39803 =C2=B1 23%  interrupts.CPU132=
.RES:Reschedu
> ling_interrupts
>       2983 =C2=B1 11%    +142.9%       7245 =C2=B1  6%  interrupts.CPU133=
.CAL:Function
> _call_interrupts
>       5329 =C2=B1  6%     -27.9%       3840 =C2=B1 25%  interrupts.CPU133=
.NMI:Non-mask
> able_interrupts
>       5329 =C2=B1  6%     -27.9%       3840 =C2=B1 25%  interrupts.CPU133=
.PMI:Performa
> nce_monitoring_interrupts
>      60992 =C2=B1 10%     -29.3%      43148 =C2=B1 14%  interrupts.CPU133=
.RES:Reschedu
> ling_interrupts
>       2965 =C2=B1 13%    +128.1%       6763 =C2=B1 10%  interrupts.CPU134=
.CAL:Function
> _call_interrupts
>       2882 =C2=B1  8%    +134.3%       6754 =C2=B1 13%  interrupts.CPU135=
.CAL:Function
> _call_interrupts
>       5258 =C2=B1 10%     -23.2%       4040 =C2=B1 26%  interrupts.CPU135=
.NMI:Non-mask
> able_interrupts
>       5258 =C2=B1 10%     -23.2%       4040 =C2=B1 26%  interrupts.CPU135=
.PMI:Performa
> nce_monitoring_interrupts
>       2867 =C2=B1 10%    +142.1%       6942 =C2=B1  9%  interrupts.CPU136=
.CAL:Function
> _call_interrupts
>       5370 =C2=B1  8%     -33.2%       3590 =C2=B1 24%  interrupts.CPU136=
.NMI:Non-mask
> able_interrupts
>       5370 =C2=B1  8%     -33.2%       3590 =C2=B1 24%  interrupts.CPU136=
.PMI:Performa
> nce_monitoring_interrupts
>      56528 =C2=B1  3%     -28.3%      40520 =C2=B1 18%  interrupts.CPU136=
.RES:Reschedu
> ling_interrupts
>       3008 =C2=B1 11%    +120.1%       6620 =C2=B1  6%  interrupts.CPU137=
.CAL:Function
> _call_interrupts
>       3212 =C2=B1  9%    +122.7%       7152 =C2=B1 10%  interrupts.CPU138=
.CAL:Function
> _call_interrupts
>       3306 =C2=B1 11%    +113.3%       7053 =C2=B1  8%  interrupts.CPU139=
.CAL:Function
> _call_interrupts
>       4997 =C2=B1  5%     -19.7%       4014 =C2=B1 21%  interrupts.CPU139=
.NMI:Non-mask
> able_interrupts
>       4997 =C2=B1  5%     -19.7%       4014 =C2=B1 21%  interrupts.CPU139=
.PMI:Performa
> nce_monitoring_interrupts
>       3551 =C2=B1 24%     +85.0%       6568 =C2=B1 14%  interrupts.CPU140=
.CAL:Function
> _call_interrupts
>       3271 =C2=B1 10%    +107.3%       6782 =C2=B1  6%  interrupts.CPU141=
.CAL:Function
> _call_interrupts
>       5384 =C2=B1 10%     -33.1%       3601 =C2=B1 22%  interrupts.CPU141=
.NMI:Non-mask
> able_interrupts
>       5384 =C2=B1 10%     -33.1%       3601 =C2=B1 22%  interrupts.CPU141=
.PMI:Performa
> nce_monitoring_interrupts
>       3444 =C2=B1  9%    +104.4%       7039 =C2=B1 10%  interrupts.CPU142=
.CAL:Function
> _call_interrupts
>       3434 =C2=B1  5%    +100.8%       6894 =C2=B1  5%  interrupts.CPU143=
.CAL:Function
> _call_interrupts
>       3347 =C2=B1 13%    +159.9%       8699 =C2=B1 23%  interrupts.CPU144=
.CAL:Function
> _call_interrupts
>      72255 =C2=B1 16%     -30.7%      50054 =C2=B1 26%  interrupts.CPU144=
.RES:Reschedu
> ling_interrupts
>       3942 =C2=B1 19%    +110.4%       8294 =C2=B1  5%  interrupts.CPU145=
.CAL:Function
> _call_interrupts
>      54776 =C2=B1 10%     -31.4%      37570 =C2=B1 15%  interrupts.CPU145=
.RES:Reschedu
> ling_interrupts
>       3183 =C2=B1  5%    +158.1%       8216 =C2=B1 12%  interrupts.CPU146=
.CAL:Function
> _call_interrupts
>      55645 =C2=B1 16%     -37.6%      34741 =C2=B1 21%  interrupts.CPU146=
.RES:Reschedu
> ling_interrupts
>      28.00 =C2=B1 67%    +245.2%      96.67 =C2=B1 42%  interrupts.CPU146=
.TLB:TLB_shoo
> tdowns
>       3168 =C2=B1  9%    +170.2%       8560 =C2=B1 19%  interrupts.CPU147=
.CAL:Function
> _call_interrupts
>      54651 =C2=B1 19%     -46.9%      29032 =C2=B1 12%  interrupts.CPU147=
.RES:Reschedu
> ling_interrupts
>       3105 =C2=B1  8%    +177.1%       8604 =C2=B1 14%  interrupts.CPU148=
.CAL:Function
> _call_interrupts
>      52996 =C2=B1 14%     -33.2%      35427 =C2=B1 18%  interrupts.CPU148=
.RES:Reschedu
> ling_interrupts
>       3101 =C2=B1  9%    +154.0%       7877 =C2=B1 12%  interrupts.CPU149=
.CAL:Function
> _call_interrupts
>      54070 =C2=B1  8%     -36.1%      34566 =C2=B1 15%  interrupts.CPU149=
.RES:Reschedu
> ling_interrupts
>       3256 =C2=B1  6%    +124.6%       7312 =C2=B1  7%  interrupts.CPU150=
.CAL:Function
> _call_interrupts
>      52428 =C2=B1 14%     -31.1%      36105 =C2=B1 13%  interrupts.CPU150=
.RES:Reschedu
> ling_interrupts
>       3053 =C2=B1 10%    +176.6%       8445 =C2=B1 14%  interrupts.CPU151=
.CAL:Function
> _call_interrupts
>      58267 =C2=B1 14%     -34.2%      38331 =C2=B1 26%  interrupts.CPU151=
.RES:Reschedu
> ling_interrupts
>       3000 =C2=B1 10%    +160.6%       7820 =C2=B1 11%  interrupts.CPU152=
.CAL:Function
> _call_interrupts
>      54739 =C2=B1 18%     -34.1%      36076 =C2=B1 14%  interrupts.CPU152=
.RES:Reschedu
> ling_interrupts
>       2974 =C2=B1  5%    +155.5%       7601 =C2=B1  9%  interrupts.CPU153=
.CAL:Function
> _call_interrupts
>      52621 =C2=B1 17%     -30.5%      36564 =C2=B1 15%  interrupts.CPU153=
.RES:Reschedu
> ling_interrupts
>       3132 =C2=B1 11%    +154.6%       7975 =C2=B1  8%  interrupts.CPU154=
.CAL:Function
> _call_interrupts
>      57369 =C2=B1 15%     -33.6%      38101 =C2=B1 16%  interrupts.CPU154=
.RES:Reschedu
> ling_interrupts
>       3281 =C2=B1  7%    +142.7%       7963 =C2=B1 12%  interrupts.CPU155=
.CAL:Function
> _call_interrupts
>      54010 =C2=B1 20%     -37.5%      33752 =C2=B1 23%  interrupts.CPU155=
.RES:Reschedu
> ling_interrupts
>       3231 =C2=B1  9%    +161.8%       8460 =C2=B1 14%  interrupts.CPU156=
.CAL:Function
> _call_interrupts
>      50187 =C2=B1 13%     -36.0%      32129 =C2=B1  6%  interrupts.CPU156=
.RES:Reschedu
> ling_interrupts
>       3062 =C2=B1  2%    +159.8%       7956 =C2=B1 12%  interrupts.CPU157=
.CAL:Function
> _call_interrupts
>      58454 =C2=B1 16%     -41.0%      34497 =C2=B1 22%  interrupts.CPU157=
.RES:Reschedu
> ling_interrupts
>       3340 =C2=B1 10%    +166.1%       8889 =C2=B1 12%  interrupts.CPU158=
.CAL:Function
> _call_interrupts
>      57677 =C2=B1 19%     -33.3%      38467 =C2=B1  8%  interrupts.CPU158=
.RES:Reschedu
> ling_interrupts
>       3316 =C2=B1  7%    +161.6%       8677 =C2=B1 10%  interrupts.CPU159=
.CAL:Function
> _call_interrupts
>       5314 =C2=B1  9%     -28.6%       3796 =C2=B1 20%  interrupts.CPU159=
.NMI:Non-mask
> able_interrupts
>       5314 =C2=B1  9%     -28.6%       3796 =C2=B1 20%  interrupts.CPU159=
.PMI:Performa
> nce_monitoring_interrupts
>      60115 =C2=B1 16%     -48.2%      31123 =C2=B1 10%  interrupts.CPU159=
.RES:Reschedu
> ling_interrupts
>      53315 =C2=B1  5%     -31.3%      36653 =C2=B1 12%  interrupts.CPU16.=
RES:Reschedul
> ing_interrupts
>       3621 =C2=B1 21%    +124.3%       8125 =C2=B1 16%  interrupts.CPU160=
.CAL:Function
> _call_interrupts
>      56428 =C2=B1 15%     -38.6%      34619 =C2=B1 18%  interrupts.CPU160=
.RES:Reschedu
> ling_interrupts
>       3077 =C2=B1 15%    +149.0%       7662 =C2=B1  8%  interrupts.CPU161=
.CAL:Function
> _call_interrupts
>       5300 =C2=B1  2%     -27.4%       3847 =C2=B1 23%  interrupts.CPU161=
.NMI:Non-mask
> able_interrupts
>       5300 =C2=B1  2%     -27.4%       3847 =C2=B1 23%  interrupts.CPU161=
.PMI:Performa
> nce_monitoring_interrupts
>      55965 =C2=B1 10%     -36.0%      35799 =C2=B1 16%  interrupts.CPU161=
.RES:Reschedu
> ling_interrupts
>       3237 =C2=B1  7%    +137.4%       7686 =C2=B1  6%  interrupts.CPU162=
.CAL:Function
> _call_interrupts
>      50247 =C2=B1 13%     -27.3%      36515 =C2=B1 18%  interrupts.CPU162=
.RES:Reschedu
> ling_interrupts
>       3376 =C2=B1  9%    +141.1%       8138 =C2=B1 14%  interrupts.CPU163=
.CAL:Function
> _call_interrupts
>      55557 =C2=B1 11%     -30.1%      38826 =C2=B1 16%  interrupts.CPU163=
.RES:Reschedu
> ling_interrupts
>       3195 =C2=B1 12%    +141.9%       7729 =C2=B1 12%  interrupts.CPU164=
.CAL:Function
> _call_interrupts
>       5101 =C2=B1  7%     -21.2%       4021 =C2=B1 28%  interrupts.CPU164=
.NMI:Non-mask
> able_interrupts
>       5101 =C2=B1  7%     -21.2%       4021 =C2=B1 28%  interrupts.CPU164=
.PMI:Performa
> nce_monitoring_interrupts
>      51766 =C2=B1 13%     -28.6%      36959 =C2=B1 16%  interrupts.CPU164=
.RES:Reschedu
> ling_interrupts
>       3677 =C2=B1 10%    +110.0%       7722 =C2=B1  9%  interrupts.CPU165=
.CAL:Function
> _call_interrupts
>       5228 =C2=B1 10%     -34.4%       3430 =C2=B1 21%  interrupts.CPU165=
.NMI:Non-mask
> able_interrupts
>       5228 =C2=B1 10%     -34.4%       3430 =C2=B1 21%  interrupts.CPU165=
.PMI:Performa
> nce_monitoring_interrupts
>       4111 =C2=B1 18%    +109.6%       8617 =C2=B1  9%  interrupts.CPU166=
.CAL:Function
> _call_interrupts
>       5180 =C2=B1  7%     -29.7%       3640 =C2=B1 19%  interrupts.CPU166=
.NMI:Non-mask
> able_interrupts
>       5180 =C2=B1  7%     -29.7%       3640 =C2=B1 19%  interrupts.CPU166=
.PMI:Performa
> nce_monitoring_interrupts
>      49514 =C2=B1 21%     -35.8%      31805 =C2=B1 11%  interrupts.CPU166=
.RES:Reschedu
> ling_interrupts
>       3574 =C2=B1  6%    +123.5%       7988 =C2=B1  9%  interrupts.CPU167=
.CAL:Function
> _call_interrupts
>      45629 =C2=B1 13%     -23.2%      35024 =C2=B1 16%  interrupts.CPU167=
.RES:Reschedu
> ling_interrupts
>       3667 =C2=B1 17%     +74.8%       6409 =C2=B1  6%  interrupts.CPU168=
.CAL:Function
> _call_interrupts
>      85851 =C2=B1 12%     -31.5%      58794 =C2=B1  3%  interrupts.CPU168=
.RES:Reschedu
> ling_interrupts
>       3457 =C2=B1 15%    +115.3%       7444 =C2=B1  7%  interrupts.CPU169=
.CAL:Function
> _call_interrupts
>      52397 =C2=B1  5%     -33.2%      35026 =C2=B1  9%  interrupts.CPU17.=
RES:Reschedul
> ing_interrupts
>       3090 =C2=B1  6%    +140.7%       7439 =C2=B1 11%  interrupts.CPU170=
.CAL:Function
> _call_interrupts
>      58979 =C2=B1  9%     -30.7%      40874 =C2=B1 13%  interrupts.CPU170=
.RES:Reschedu
> ling_interrupts
>       3391 =C2=B1  4%    +101.0%       6817 =C2=B1  5%  interrupts.CPU171=
.CAL:Function
> _call_interrupts
>      53880 =C2=B1  3%     -23.9%      40983 =C2=B1 11%  interrupts.CPU171=
.RES:Reschedu
> ling_interrupts
>       3276 =C2=B1  7%    +117.0%       7108 =C2=B1  8%  interrupts.CPU172=
.CAL:Function
> _call_interrupts
>      56474 =C2=B1  5%     -26.7%      41374 =C2=B1  5%  interrupts.CPU172=
.RES:Reschedu
> ling_interrupts
>       3063 =C2=B1  2%    +120.0%       6739 =C2=B1  6%  interrupts.CPU173=
.CAL:Function
> _call_interrupts
>      57239 =C2=B1 15%     -33.7%      37968 =C2=B1  8%  interrupts.CPU173=
.RES:Reschedu
> ling_interrupts
>      28.67 =C2=B1 50%    +230.2%      94.67 =C2=B1  6%  interrupts.CPU173=
.TLB:TLB_shoo
> tdowns
>       3134 =C2=B1  9%    +114.7%       6730 =C2=B1  8%  interrupts.CPU174=
.CAL:Function
> _call_interrupts
>      57564 =C2=B1 12%     -33.7%      38156 =C2=B1  6%  interrupts.CPU174=
.RES:Reschedu
> ling_interrupts
>       3189 =C2=B1  8%    +117.1%       6924 =C2=B1  4%  interrupts.CPU175=
.CAL:Function
> _call_interrupts
>      62673 =C2=B1  7%     -36.8%      39637 =C2=B1 15%  interrupts.CPU175=
.RES:Reschedu
> ling_interrupts
>       2934 =C2=B1  8%    +131.4%       6789 =C2=B1 13%  interrupts.CPU176=
.CAL:Function
> _call_interrupts
>      61575 =C2=B1 10%     -35.5%      39743        interrupts.CPU176.RES:=
Reschedu
> ling_interrupts
>       2988 =C2=B1  9%    +140.8%       7196 =C2=B1  8%  interrupts.CPU177=
.CAL:Function
> _call_interrupts
>      63866 =C2=B1 11%     -34.8%      41657        interrupts.CPU177.RES:=
Reschedu
> ling_interrupts
>       3043 =C2=B1  7%    +135.3%       7160 =C2=B1  9%  interrupts.CPU178=
.CAL:Function
> _call_interrupts
>      60147 =C2=B1  8%     -30.6%      41766 =C2=B1  2%  interrupts.CPU178=
.RES:Reschedu
> ling_interrupts
>       2971 =C2=B1  6%    +139.3%       7111 =C2=B1  7%  interrupts.CPU179=
.CAL:Function
> _call_interrupts
>      54991 =C2=B1 16%     -30.2%      38386 =C2=B1  6%  interrupts.CPU179=
.RES:Reschedu
> ling_interrupts
>      55505 =C2=B1  7%     -31.3%      38114 =C2=B1 15%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>       3107 =C2=B1  5%    +138.7%       7418 =C2=B1 13%  interrupts.CPU180=
.CAL:Function
> _call_interrupts
>      61196 =C2=B1 17%     -37.5%      38268 =C2=B1  4%  interrupts.CPU180=
.RES:Reschedu
> ling_interrupts
>       3041 =C2=B1  6%    +119.0%       6658 =C2=B1 10%  interrupts.CPU181=
.CAL:Function
> _call_interrupts
>       2923 =C2=B1  7%    +138.6%       6974 =C2=B1  7%  interrupts.CPU182=
.CAL:Function
> _call_interrupts
>      61737 =C2=B1 11%     -32.9%      41452 =C2=B1  3%  interrupts.CPU182=
.RES:Reschedu
> ling_interrupts
>       2908 =C2=B1  9%    +132.0%       6747 =C2=B1  9%  interrupts.CPU183=
.CAL:Function
> _call_interrupts
>       5818 =C2=B1 11%     -27.1%       4241 =C2=B1 10%  interrupts.CPU183=
.NMI:Non-mask
> able_interrupts
>       5818 =C2=B1 11%     -27.1%       4241 =C2=B1 10%  interrupts.CPU183=
.PMI:Performa
> nce_monitoring_interrupts
>      60798 =C2=B1  5%     -28.8%      43305 =C2=B1  6%  interrupts.CPU183=
.RES:Reschedu
> ling_interrupts
>       2980 =C2=B1  8%    +112.3%       6327 =C2=B1 10%  interrupts.CPU184=
.CAL:Function
> _call_interrupts
>      54917 =C2=B1 16%     -29.4%      38775 =C2=B1  7%  interrupts.CPU184=
.RES:Reschedu
> ling_interrupts
>      30.33 =C2=B1 37%    +156.0%      77.67 =C2=B1 45%  interrupts.CPU184=
.TLB:TLB_shoo
> tdowns
>       3008 =C2=B1  9%    +136.8%       7124 =C2=B1  9%  interrupts.CPU185=
.CAL:Function
> _call_interrupts
>      55941 =C2=B1 12%     -31.3%      38433 =C2=B1  9%  interrupts.CPU185=
.RES:Reschedu
> ling_interrupts
>       3114 =C2=B1  2%    +123.1%       6947 =C2=B1 15%  interrupts.CPU186=
.CAL:Function
> _call_interrupts
>      59608 =C2=B1  7%     -31.9%      40576 =C2=B1 16%  interrupts.CPU186=
.RES:Reschedu
> ling_interrupts
>       2984 =C2=B1  4%    +125.6%       6730 =C2=B1  8%  interrupts.CPU187=
.CAL:Function
> _call_interrupts
>      57924 =C2=B1  8%     -26.4%      42638 =C2=B1  6%  interrupts.CPU187=
.RES:Reschedu
> ling_interrupts
>      36.33 =C2=B1 21%    +160.6%      94.67 =C2=B1 39%  interrupts.CPU187=
.TLB:TLB_shoo
> tdowns
>       3161 =C2=B1  7%    +125.0%       7113 =C2=B1 23%  interrupts.CPU188=
.CAL:Function
> _call_interrupts
>      57712 =C2=B1 11%     -29.4%      40742 =C2=B1  8%  interrupts.CPU188=
.RES:Reschedu
> ling_interrupts
>       3293 =C2=B1  7%    +102.0%       6654 =C2=B1  9%  interrupts.CPU189=
.CAL:Function
> _call_interrupts
>      51765 =C2=B1 11%     -31.4%      35520 =C2=B1 14%  interrupts.CPU189=
.RES:Reschedu
> ling_interrupts
>       4924 =C2=B1 33%     +48.7%       7322 =C2=B1 14%  interrupts.CPU19.=
CAL:Function_
> call_interrupts
>      51324 =C2=B1 13%     -25.4%      38267 =C2=B1 15%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>       3346 =C2=B1 12%    +107.3%       6935 =C2=B1 12%  interrupts.CPU190=
.CAL:Function
> _call_interrupts
>      55681 =C2=B1 10%     -27.7%      40257 =C2=B1 13%  interrupts.CPU190=
.RES:Reschedu
> ling_interrupts
>       3706 =C2=B1 15%     +78.8%       6626 =C2=B1  6%  interrupts.CPU191=
.CAL:Function
> _call_interrupts
>      48293 =C2=B1 16%     -30.6%      33537 =C2=B1  9%  interrupts.CPU191=
.RES:Reschedu
> ling_interrupts
>      74.67 =C2=B1 59%    +479.5%     432.67 =C2=B1 14%  interrupts.CPU191=
.TLB:TLB_shoo
> tdowns
>      53283 =C2=B1 11%     -33.3%      35535 =C2=B1 25%  interrupts.CPU20.=
RES:Reschedul
> ing_interrupts
>       4831 =C2=B1 15%     +40.5%       6785 =C2=B1 22%  interrupts.CPU21.=
CAL:Function_
> call_interrupts
>       3246 =C2=B1 31%     +42.5%       4624 =C2=B1  9%  interrupts.CPU21.=
NMI:Non-maska
> ble_interrupts
>       3246 =C2=B1 31%     +42.5%       4624 =C2=B1  9%  interrupts.CPU21.=
PMI:Performan
> ce_monitoring_interrupts
>      56218 =C2=B1  5%     -23.4%      43051 =C2=B1 15%  interrupts.CPU21.=
RES:Reschedul
> ing_interrupts
>       4125 =C2=B1 22%     +64.0%       6764 =C2=B1 11%  interrupts.CPU22.=
CAL:Function_
> call_interrupts
>      53539 =C2=B1  4%     -30.7%      37128 =C2=B1  7%  interrupts.CPU22.=
RES:Reschedul
> ing_interrupts
>       4671 =C2=B1 24%     +46.5%       6845 =C2=B1 22%  interrupts.CPU23.=
CAL:Function_
> call_interrupts
>      57885 =C2=B1  4%     -34.1%      38158 =C2=B1 19%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>       5673 =C2=B1 18%     +65.2%       9370 =C2=B1 24%  interrupts.CPU24.=
CAL:Function_
> call_interrupts
>      48949 =C2=B1 13%     -26.7%      35869 =C2=B1 26%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>      50539 =C2=B1 12%     -25.3%      37741 =C2=B1 15%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>      40.00 =C2=B1 37%    +102.5%      81.00 =C2=B1 17%  interrupts.CPU26.=
TLB:TLB_shoot
> downs
>       4352 =C2=B1 17%     +65.0%       7183 =C2=B1  7%  interrupts.CPU27.=
CAL:Function_
> call_interrupts
>       4753 =C2=B1  7%     -14.5%       4065 =C2=B1  8%  interrupts.CPU27.=
NMI:Non-maska
> ble_interrupts
>       4753 =C2=B1  7%     -14.5%       4065 =C2=B1  8%  interrupts.CPU27.=
PMI:Performan
> ce_monitoring_interrupts
>      50518 =C2=B1  9%     -24.2%      38286 =C2=B1 19%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>       4324 =C2=B1 17%     +66.3%       7190 =C2=B1  8%  interrupts.CPU28.=
CAL:Function_
> call_interrupts
>      49862 =C2=B1 11%     -27.9%      35948 =C2=B1 19%  interrupts.CPU28.=
RES:Reschedul
> ing_interrupts
>      31.67 =C2=B1 12%    +321.1%     133.33 =C2=B1 62%  interrupts.CPU28.=
TLB:TLB_shoot
> downs
>       4011 =C2=B1 11%     +66.4%       6674 =C2=B1 11%  interrupts.CPU29.=
CAL:Function_
> call_interrupts
>       3986 =C2=B1 22%     -40.9%       2354 =C2=B1  4%  interrupts.CPU29.=
NMI:Non-maska
> ble_interrupts
>       3986 =C2=B1 22%     -40.9%       2354 =C2=B1  4%  interrupts.CPU29.=
PMI:Performan
> ce_monitoring_interrupts
>      48685 =C2=B1 12%     -26.6%      35723 =C2=B1 18%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>      58513 =C2=B1  9%     -31.3%      40180 =C2=B1 19%  interrupts.CPU3.R=
ES:Rescheduli
> ng_interrupts
>      47.67 =C2=B1 48%    +178.3%     132.67 =C2=B1 67%  interrupts.CPU3.T=
LB:TLB_shootd
> owns
>       4059 =C2=B1 17%     +60.8%       6527 =C2=B1 11%  interrupts.CPU30.=
CAL:Function_
> call_interrupts
>      23.00 =C2=B1 30%    +592.8%     159.33 =C2=B1 73%  interrupts.CPU30.=
TLB:TLB_shoot
> downs
>       4431 =C2=B1 18%     +48.3%       6572 =C2=B1  5%  interrupts.CPU31.=
CAL:Function_
> call_interrupts
>      50848 =C2=B1  8%     -24.0%      38623 =C2=B1 19%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>       4356 =C2=B1 24%     +59.6%       6955 =C2=B1  8%  interrupts.CPU32.=
CAL:Function_
> call_interrupts
>       4796 =C2=B1 10%     -35.2%       3106 =C2=B1 31%  interrupts.CPU32.=
NMI:Non-maska
> ble_interrupts
>       4796 =C2=B1 10%     -35.2%       3106 =C2=B1 31%  interrupts.CPU32.=
PMI:Performan
> ce_monitoring_interrupts
>       4206 =C2=B1 14%     +55.7%       6548 =C2=B1 11%  interrupts.CPU33.=
CAL:Function_
> call_interrupts
>       3535 =C2=B1  6%    +102.7%       7166 =C2=B1  9%  interrupts.CPU34.=
CAL:Function_
> call_interrupts
>      47917 =C2=B1  7%     -32.2%      32504 =C2=B1 21%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>       4034 =C2=B1 15%     +66.1%       6701 =C2=B1 11%  interrupts.CPU35.=
CAL:Function_
> call_interrupts
>      47499 =C2=B1 12%     -22.8%      36670 =C2=B1 12%  interrupts.CPU35.=
RES:Reschedul
> ing_interrupts
>       3770 =C2=B1 12%     +81.6%       6848        interrupts.CPU36.CAL:F=
unction_
> call_interrupts
>      48116 =C2=B1 11%     -26.8%      35231 =C2=B1 16%  interrupts.CPU36.=
RES:Reschedul
> ing_interrupts
>       3761 =C2=B1  2%     +79.8%       6764 =C2=B1  6%  interrupts.CPU37.=
CAL:Function_
> call_interrupts
>      49941 =C2=B1 13%     -30.3%      34822 =C2=B1 14%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>       3647 =C2=B1  9%     +87.0%       6821 =C2=B1  5%  interrupts.CPU38.=
CAL:Function_
> call_interrupts
>      52318 =C2=B1 17%     -32.9%      35094 =C2=B1 16%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>       3661 =C2=B1  7%     +82.0%       6663 =C2=B1  7%  interrupts.CPU39.=
CAL:Function_
> call_interrupts
>      53375 =C2=B1 12%     -32.4%      36068 =C2=B1 23%  interrupts.CPU39.=
RES:Reschedul
> ing_interrupts
>      57739 =C2=B1  6%     -29.0%      40982 =C2=B1 13%  interrupts.CPU4.R=
ES:Rescheduli
> ng_interrupts
>       3947 =C2=B1  8%     +64.8%       6504 =C2=B1  9%  interrupts.CPU40.=
CAL:Function_
> call_interrupts
>       4435 =C2=B1 23%     +54.0%       6832 =C2=B1  5%  interrupts.CPU41.=
CAL:Function_
> call_interrupts
>       5280 =C2=B1 10%     -29.3%       3732 =C2=B1 35%  interrupts.CPU41.=
NMI:Non-maska
> ble_interrupts
>       5280 =C2=B1 10%     -29.3%       3732 =C2=B1 35%  interrupts.CPU41.=
PMI:Performan
> ce_monitoring_interrupts
>      49514 =C2=B1 13%     -27.8%      35728 =C2=B1 21%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>       3633 =C2=B1  3%     +87.3%       6805 =C2=B1  5%  interrupts.CPU42.=
CAL:Function_
> call_interrupts
>       3596 =C2=B1 20%     +34.8%       4847 =C2=B1  7%  interrupts.CPU42.=
NMI:Non-maska
> ble_interrupts
>       3596 =C2=B1 20%     +34.8%       4847 =C2=B1  7%  interrupts.CPU42.=
PMI:Performan
> ce_monitoring_interrupts
>      52841 =C2=B1  9%     -26.4%      38873 =C2=B1 21%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>       3818 =C2=B1  7%     +76.4%       6737 =C2=B1 10%  interrupts.CPU43.=
CAL:Function_
> call_interrupts
>       3485 =C2=B1  8%     +86.9%       6514 =C2=B1 10%  interrupts.CPU44.=
CAL:Function_
> call_interrupts
>       3937 =C2=B1  7%     +84.5%       7262 =C2=B1 10%  interrupts.CPU45.=
CAL:Function_
> call_interrupts
>      50348 =C2=B1 15%     -30.1%      35189 =C2=B1  8%  interrupts.CPU45.=
RES:Reschedul
> ing_interrupts
>       3957 =C2=B1  3%     +73.1%       6851 =C2=B1 12%  interrupts.CPU46.=
CAL:Function_
> call_interrupts
>       3736 =C2=B1  2%     +85.0%       6914 =C2=B1  7%  interrupts.CPU47.=
CAL:Function_
> call_interrupts
>       5473 =C2=B1  2%     +70.4%       9329 =C2=B1  3%  interrupts.CPU48.=
CAL:Function_
> call_interrupts
>      50301 =C2=B1  7%     -36.6%      31911 =C2=B1  9%  interrupts.CPU48.=
RES:Reschedul
> ing_interrupts
>       4714 =C2=B1  2%     +77.6%       8373 =C2=B1  4%  interrupts.CPU49.=
CAL:Function_
> call_interrupts
>      48351 =C2=B1 12%     -39.4%      29286 =C2=B1 21%  interrupts.CPU49.=
RES:Reschedul
> ing_interrupts
>      52179 =C2=B1 17%     -36.5%      33126 =C2=B1 25%  interrupts.CPU5.R=
ES:Rescheduli
> ng_interrupts
>       4102 =C2=B1  2%     +99.3%       8176 =C2=B1  4%  interrupts.CPU50.=
CAL:Function_
> call_interrupts
>       4108 =C2=B1  5%     +96.1%       8056 =C2=B1  7%  interrupts.CPU51.=
CAL:Function_
> call_interrupts
>       3901 =C2=B1  7%     +95.9%       7643 =C2=B1  4%  interrupts.CPU52.=
CAL:Function_
> call_interrupts
>      48305 =C2=B1 12%     -35.3%      31255 =C2=B1 18%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>       3864           +95.6%       7558 =C2=B1 10%  interrupts.CPU53.CAL:F=
unction_
> call_interrupts
>      41594 =C2=B1  4%     -39.0%      25386 =C2=B1 10%  interrupts.CPU53.=
RES:Reschedul
> ing_interrupts
>       3726          +114.7%       8000 =C2=B1 10%  interrupts.CPU54.CAL:F=
unction_
> call_interrupts
>      43602 =C2=B1 13%     -33.7%      28929 =C2=B1 23%  interrupts.CPU54.=
RES:Reschedul
> ing_interrupts
>       3775 =C2=B1  7%    +106.7%       7803 =C2=B1 12%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>       3867 =C2=B1 18%     +27.8%       4941 =C2=B1  7%  interrupts.CPU55.=
NMI:Non-maska
> ble_interrupts
>       3867 =C2=B1 18%     +27.8%       4941 =C2=B1  7%  interrupts.CPU55.=
PMI:Performan
> ce_monitoring_interrupts
>      44809 =C2=B1 12%     -28.6%      32007 =C2=B1 11%  interrupts.CPU55.=
RES:Reschedul
> ing_interrupts
>       3937 =C2=B1  4%    +111.1%       8310 =C2=B1  8%  interrupts.CPU56.=
CAL:Function_
> call_interrupts
>      45965 =C2=B1 16%     -31.2%      31618 =C2=B1 13%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>       3769 =C2=B1  3%     +98.9%       7496 =C2=B1  4%  interrupts.CPU57.=
CAL:Function_
> call_interrupts
>      46799 =C2=B1 14%     -33.5%      31102 =C2=B1 19%  interrupts.CPU57.=
RES:Reschedul
> ing_interrupts
>       3533 =C2=B1  7%    +117.2%       7675 =C2=B1  5%  interrupts.CPU58.=
CAL:Function_
> call_interrupts
>      45366 =C2=B1 13%     -34.7%      29624 =C2=B1 19%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>       3689 =C2=B1 11%    +100.8%       7407 =C2=B1  6%  interrupts.CPU59.=
CAL:Function_
> call_interrupts
>      48835 =C2=B1 14%     -41.8%      28414 =C2=B1 27%  interrupts.CPU59.=
RES:Reschedul
> ing_interrupts
>       3750          +101.5%       7555 =C2=B1  4%  interrupts.CPU60.CAL:F=
unction_
> call_interrupts
>      45392 =C2=B1 15%     -39.3%      27549 =C2=B1 19%  interrupts.CPU60.=
RES:Reschedul
> ing_interrupts
>       3974 =C2=B1  4%    +102.2%       8035 =C2=B1  2%  interrupts.CPU61.=
CAL:Function_
> call_interrupts
>      47520 =C2=B1 13%     -36.8%      30052 =C2=B1 28%  interrupts.CPU61.=
RES:Reschedul
> ing_interrupts
>       3804 =C2=B1  9%    +104.0%       7760 =C2=B1  5%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>      52538 =C2=B1 15%     -34.6%      34381 =C2=B1 16%  interrupts.CPU62.=
RES:Reschedul
> ing_interrupts
>       3450 =C2=B1  6%    +123.2%       7701 =C2=B1 10%  interrupts.CPU63.=
CAL:Function_
> call_interrupts
>      48728 =C2=B1 10%     -40.0%      29232 =C2=B1 29%  interrupts.CPU63.=
RES:Reschedul
> ing_interrupts
>      46.33 =C2=B1 14%    +166.2%     123.33 =C2=B1 66%  interrupts.CPU63.=
TLB:TLB_shoot
> downs
>       3170          +139.6%       7594 =C2=B1  4%  interrupts.CPU64.CAL:F=
unction_
> call_interrupts
>      47669 =C2=B1 16%     -39.5%      28852 =C2=B1  8%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>       3554 =C2=B1  9%    +116.6%       7698 =C2=B1  9%  interrupts.CPU65.=
CAL:Function_
> call_interrupts
>      46727 =C2=B1 12%     -41.6%      27291 =C2=B1 25%  interrupts.CPU65.=
RES:Reschedul
> ing_interrupts
>      38.67 =C2=B1 23%    +125.0%      87.00 =C2=B1 37%  interrupts.CPU65.=
TLB:TLB_shoot
> downs
>       3633 =C2=B1  7%    +109.6%       7615 =C2=B1  6%  interrupts.CPU66.=
CAL:Function_
> call_interrupts
>      45820 =C2=B1 11%     -37.0%      28886 =C2=B1 18%  interrupts.CPU66.=
RES:Reschedul
> ing_interrupts
>       3542 =C2=B1 11%    +121.7%       7854 =C2=B1  9%  interrupts.CPU67.=
CAL:Function_
> call_interrupts
>      47064 =C2=B1 12%     -24.6%      35500 =C2=B1 18%  interrupts.CPU67.=
RES:Reschedul
> ing_interrupts
>       3553 =C2=B1  7%    +112.3%       7544 =C2=B1  2%  interrupts.CPU68.=
CAL:Function_
> call_interrupts
>       3731 =C2=B1  9%    +126.5%       8452 =C2=B1 13%  interrupts.CPU69.=
CAL:Function_
> call_interrupts
>      42430 =C2=B1  9%     -30.4%      29515 =C2=B1 11%  interrupts.CPU69.=
RES:Reschedul
> ing_interrupts
>      56793 =C2=B1  8%     -35.1%      36873 =C2=B1 25%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>       3303 =C2=B1  9%    +135.7%       7786 =C2=B1  7%  interrupts.CPU70.=
CAL:Function_
> call_interrupts
>      46309 =C2=B1 14%     -41.6%      27029 =C2=B1 23%  interrupts.CPU70.=
RES:Reschedul
> ing_interrupts
>       3665 =C2=B1  8%     +96.9%       7216        interrupts.CPU71.CAL:F=
unction_
> call_interrupts
>      41706 =C2=B1 20%     -26.4%      30693 =C2=B1 19%  interrupts.CPU71.=
RES:Reschedul
> ing_interrupts
>      52.00 =C2=B1 43%    +203.2%     157.67 =C2=B1 69%  interrupts.CPU71.=
TLB:TLB_shoot
> downs
>       5229 =C2=B1  4%     +54.0%       8055 =C2=B1  4%  interrupts.CPU72.=
CAL:Function_
> call_interrupts
>      48712 =C2=B1 13%     -21.4%      38293 =C2=B1  7%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>       4458 =C2=B1  3%     +61.3%       7191 =C2=B1 11%  interrupts.CPU73.=
CAL:Function_
> call_interrupts
>      51221 =C2=B1  9%     -21.7%      40093 =C2=B1  2%  interrupts.CPU73.=
RES:Reschedul
> ing_interrupts
>       4131 =C2=B1  5%     +67.7%       6925 =C2=B1  6%  interrupts.CPU74.=
CAL:Function_
> call_interrupts
>      50402 =C2=B1 10%     -29.9%      35330 =C2=B1  6%  interrupts.CPU74.=
RES:Reschedul
> ing_interrupts
>       4189 =C2=B1  4%     +69.8%       7114        interrupts.CPU75.CAL:F=
unction_
> call_interrupts
>      50157 =C2=B1  2%     -27.6%      36303 =C2=B1  7%  interrupts.CPU75.=
RES:Reschedul
> ing_interrupts
>       4048 =C2=B1  4%     +76.8%       7158 =C2=B1  3%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>      44614 =C2=B1  8%     -19.3%      35986 =C2=B1 12%  interrupts.CPU76.=
RES:Reschedul
> ing_interrupts
>       3607 =C2=B1  4%     +95.6%       7055 =C2=B1  8%  interrupts.CPU77.=
CAL:Function_
> call_interrupts
>      46212 =C2=B1 15%     -23.2%      35471 =C2=B1  5%  interrupts.CPU77.=
RES:Reschedul
> ing_interrupts
>       3787 =C2=B1  9%     +72.5%       6533 =C2=B1  6%  interrupts.CPU78.=
CAL:Function_
> call_interrupts
>      49301 =C2=B1  9%     -34.8%      32133 =C2=B1  6%  interrupts.CPU78.=
RES:Reschedul
> ing_interrupts
>       4212 =C2=B1 10%     +64.3%       6922 =C2=B1  7%  interrupts.CPU79.=
CAL:Function_
> call_interrupts
>      51341 =C2=B1  3%     -34.7%      33549 =C2=B1  9%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>      55209 =C2=B1  8%     -32.8%      37099 =C2=B1 19%  interrupts.CPU8.R=
ES:Rescheduli
> ng_interrupts
>       3838 =C2=B1  5%     +69.6%       6510 =C2=B1 10%  interrupts.CPU80.=
CAL:Function_
> call_interrupts
>      47505 =C2=B1  9%     -30.6%      32958 =C2=B1 12%  interrupts.CPU80.=
RES:Reschedul
> ing_interrupts
>       3656 =C2=B1 10%     +88.0%       6871 =C2=B1  5%  interrupts.CPU81.=
CAL:Function_
> call_interrupts
>      48463 =C2=B1 19%     -30.0%      33929        interrupts.CPU81.RES:R=
eschedul
> ing_interrupts
>      41.33 =C2=B1 45%    +110.5%      87.00 =C2=B1 26%  interrupts.CPU81.=
TLB:TLB_shoot
> downs
>       3629 =C2=B1  6%     +76.2%       6396 =C2=B1  5%  interrupts.CPU82.=
CAL:Function_
> call_interrupts
>      53459 =C2=B1  2%     -31.5%      36631 =C2=B1  4%  interrupts.CPU82.=
RES:Reschedul
> ing_interrupts
>       3604 =C2=B1  2%     +71.8%       6192 =C2=B1 11%  interrupts.CPU83.=
CAL:Function_
> call_interrupts
>      48398 =C2=B1  9%     -25.8%      35898 =C2=B1 11%  interrupts.CPU83.=
RES:Reschedul
> ing_interrupts
>       3553 =C2=B1  7%     +79.0%       6361 =C2=B1  8%  interrupts.CPU84.=
CAL:Function_
> call_interrupts
>      45498 =C2=B1 12%     -15.6%      38416 =C2=B1  6%  interrupts.CPU84.=
RES:Reschedul
> ing_interrupts
>      35.33 =C2=B1 49%    +134.0%      82.67 =C2=B1 37%  interrupts.CPU84.=
TLB:TLB_shoot
> downs
>       3470 =C2=B1  8%     +85.3%       6431 =C2=B1  5%  interrupts.CPU85.=
CAL:Function_
> call_interrupts
>      44910 =C2=B1  5%     -14.8%      38278 =C2=B1 14%  interrupts.CPU85.=
RES:Reschedul
> ing_interrupts
>       3734           +83.0%       6836 =C2=B1  7%  interrupts.CPU86.CAL:F=
unction_
> call_interrupts
>      53422 =C2=B1  8%     -33.0%      35806 =C2=B1  4%  interrupts.CPU86.=
RES:Reschedul
> ing_interrupts
>       3818 =C2=B1  2%     +77.0%       6760 =C2=B1  3%  interrupts.CPU87.=
CAL:Function_
> call_interrupts
>      48671 =C2=B1  5%     -24.9%      36544 =C2=B1  3%  interrupts.CPU87.=
RES:Reschedul
> ing_interrupts
>       3300 =C2=B1 13%    +110.6%       6950 =C2=B1  9%  interrupts.CPU88.=
CAL:Function_
> call_interrupts
>      45396 =C2=B1 20%     -34.1%      29914 =C2=B1  9%  interrupts.CPU88.=
RES:Reschedul
> ing_interrupts
>       3503 =C2=B1  6%     +84.9%       6479 =C2=B1  6%  interrupts.CPU89.=
CAL:Function_
> call_interrupts
>      51240 =C2=B1 10%     -29.9%      35922 =C2=B1  5%  interrupts.CPU89.=
RES:Reschedul
> ing_interrupts
>      29.00 =C2=B1 63%   +2678.2%     805.67 =C2=B1126%  interrupts.CPU89.=
TLB:TLB_shoot
> downs
>       3415 =C2=B1  5%     +90.5%       6506 =C2=B1  6%  interrupts.CPU90.=
CAL:Function_
> call_interrupts
>      49944 =C2=B1  3%     -37.4%      31258        interrupts.CPU90.RES:R=
eschedul
> ing_interrupts
>       3809 =C2=B1  5%     +87.7%       7151 =C2=B1 10%  interrupts.CPU91.=
CAL:Function_
> call_interrupts
>       5388 =C2=B1  6%     -12.1%       4736 =C2=B1  7%  interrupts.CPU91.=
NMI:Non-maska
> ble_interrupts
>       5388 =C2=B1  6%     -12.1%       4736 =C2=B1  7%  interrupts.CPU91.=
PMI:Performan
> ce_monitoring_interrupts
>       3671 =C2=B1  2%     +85.8%       6819 =C2=B1  9%  interrupts.CPU92.=
CAL:Function_
> call_interrupts
>      47141 =C2=B1  4%     -22.6%      36490 =C2=B1  3%  interrupts.CPU92.=
RES:Reschedul
> ing_interrupts
>       3794 =C2=B1  2%     +97.9%       7507 =C2=B1  4%  interrupts.CPU93.=
CAL:Function_
> call_interrupts
>      48092 =C2=B1  5%     -27.3%      34948 =C2=B1  7%  interrupts.CPU93.=
RES:Reschedul
> ing_interrupts
>       3568 =C2=B1  5%     +86.4%       6652 =C2=B1  6%  interrupts.CPU94.=
CAL:Function_
> call_interrupts
>      48570 =C2=B1  9%     -32.7%      32705        interrupts.CPU94.RES:R=
eschedul
> ing_interrupts
>       3803 =C2=B1 20%     +77.0%       6733 =C2=B1  3%  interrupts.CPU95.=
CAL:Function_
> call_interrupts
>      45574 =C2=B1 14%     -22.8%      35170 =C2=B1  5%  interrupts.CPU95.=
RES:Reschedul
> ing_interrupts
>       3587 =C2=B1  2%    +108.1%       7466 =C2=B1 19%  interrupts.CPU96.=
CAL:Function_
> call_interrupts
>       3296 =C2=B1 28%     +46.4%       4825 =C2=B1 12%  interrupts.CPU96.=
NMI:Non-maska
> ble_interrupts
>       3296 =C2=B1 28%     +46.4%       4825 =C2=B1 12%  interrupts.CPU96.=
PMI:Performan
> ce_monitoring_interrupts
>      81755 =C2=B1 14%     -27.6%      59167 =C2=B1 18%  interrupts.CPU96.=
RES:Reschedul
> ing_interrupts
>       3592 =C2=B1 11%     +97.7%       7102 =C2=B1 22%  interrupts.CPU97.=
CAL:Function_
> call_interrupts
>       4096 =C2=B1 20%     +27.4%       5217 =C2=B1  4%  interrupts.CPU97.=
NMI:Non-maska
> ble_interrupts
>       4096 =C2=B1 20%     +27.4%       5217 =C2=B1  4%  interrupts.CPU97.=
PMI:Performan
> ce_monitoring_interrupts
>       3450 =C2=B1 14%    +112.0%       7316 =C2=B1 20%  interrupts.CPU98.=
CAL:Function_
> call_interrupts
>      66393 =C2=B1  6%     -31.4%      45565 =C2=B1 28%  interrupts.CPU98.=
RES:Reschedul
> ing_interrupts
>       3223 =C2=B1  5%    +114.9%       6927 =C2=B1 19%  interrupts.CPU99.=
CAL:Function_
> call_interrupts
>       4176 =C2=B1 21%     +29.7%       5418 =C2=B1  4%  interrupts.CPU99.=
NMI:Non-maska
> ble_interrupts
>       4176 =C2=B1 21%     +29.7%       5418 =C2=B1  4%  interrupts.CPU99.=
PMI:Performan
> ce_monitoring_interrupts
>   10335277 =C2=B1 11%     -29.1%    7323648 =C2=B1 12%  interrupts.RES:Re=
scheduling_in
> terrupts
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2ap4: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz wi=
th
> 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tca
> se/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/debian-10.4-x86_64-20200603.cgz/300s/=
2T/
> lkp-csl-2ap4/shm-xread-seq-mt/vm-scalability/0x5003006
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     161894            +4.3%     168921        vm-scalability.median
>   31083772            +4.3%   32432843        vm-scalability.throughput
>      71465           -31.9%      48697        vm-scalability.time.involun=
tar
> y_context_switches
>   36325748            +5.7%   38382741        vm-scalability.time.maximum=
_re
> sident_set_size
>   1.87e+08            +6.7%  1.995e+08        vm-scalability.time.minor_p=
age
> _faults
>       3019            +2.3%       3089        vm-scalability.time.percent=
_of
> _cpu_this_job_got
>       3173            +6.0%       3362        vm-scalability.time.user_ti=
me
>  1.814e+08            +5.8%  1.919e+08        vm-scalability.time.volunta=
ry_
> context_switches
>  9.346e+09            +4.2%   9.74e+09        vm-scalability.workload
>    1176548            +5.8%    1244490        vmstat.system.cs
>      38.09 =C2=B1  3%      +5.3%      40.12        boot-time.boot
>       6437 =C2=B1  4%      +5.9%       6817        boot-time.idle
>  1.844e+08 =C2=B1  7%     +11.4%  2.055e+08 =C2=B1  3%  cpuidle.C1E.usage
>  1.434e+09 =C2=B1 26%     -68.6%    4.5e+08 =C2=B1107%  cpuidle.C6.time
>    2218106 =C2=B1  2%     -60.0%     886653 =C2=B1105%  cpuidle.C6.usage
>      86622           -23.8%      65965 =C2=B1 22%  numa-numastat.node1.ot=
her_node
>    4618105 =C2=B1  4%     +10.1%    5085986 =C2=B1  3%  numa-numastat.nod=
e2.local_node
>    4665587 =C2=B1  4%     +10.2%    5143748 =C2=B1  4%  numa-numastat.nod=
e2.numa_hit
>      99235 =C2=B1137%    +114.6%     212915 =C2=B1 68%  numa-vmstat.node2=
.nr_active_an
> on
>      99235 =C2=B1137%    +114.6%     212915 =C2=B1 68%  numa-vmstat.node2=
.nr_zone_acti
> ve_anon
>     141523 =C2=B1 28%     -50.2%      70477 =C2=B1 36%  numa-vmstat.node3=
.numa_other
>     204046 =C2=B1 39%     -57.1%      87532 =C2=B1101%  numa-meminfo.node=
1.AnonPages.m
> ax
>     396296 =C2=B1137%    +115.0%     852187 =C2=B1 68%  numa-meminfo.node=
2.Active
>     396296 =C2=B1137%    +115.0%     852155 =C2=B1 68%  numa-meminfo.node=
2.Active(anon
> )
>    5751798 =C2=B1  8%     +10.5%    6353426 =C2=B1  7%  numa-meminfo.node=
2.MemUsed
>      11534 =C2=B1  6%     +40.6%      16213 =C2=B1  9%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.stddev
>      11546 =C2=B1  6%     +40.4%      16214 =C2=B1  9%  sched_debug.cfs_r=
q:/.spread0.s
> tddev
>      23.06 =C2=B1  4%      +9.1%      25.16 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.avg
>      90762 =C2=B1  7%     -12.2%      79705 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.min
>     574623           +11.8%     642330 =C2=B1  8%  sched_debug.cpu.max_id=
le_balan
> ce_cost.max
>       8259 =C2=B1 14%     +87.4%      15480 =C2=B1 25%  sched_debug.cpu.m=
ax_idle_balan
> ce_cost.stddev
>       6766 =C2=B1  8%    +154.8%      17241 =C2=B1  5%  sched_debug.cpu.n=
r_switches.st
> ddev
>       1525 =C2=B1  2%     -50.9%     749.28 =C2=B1  2%  sched_debug.cpu.n=
r_uninterrupt
> ible.max
>     -73.67           -31.7%     -50.33        sched_debug.cpu.nr_uninterr=
upt
> ible.min
>     177.93           -48.7%      91.19        sched_debug.cpu.nr_uninterr=
upt
> ible.stddev
>     386168            +6.6%     411753        proc-vmstat.nr_active_anon
>    5150783            +5.3%    5425685        proc-vmstat.nr_file_pages
>    4582303            +5.4%    4830711        proc-vmstat.nr_inactive_anon
>    4445406            +5.4%    4685908        proc-vmstat.nr_mapped
>      10081            +3.8%      10464        proc-vmstat.nr_page_table_p=
age
> s
>    4901156            +5.6%    5176059        proc-vmstat.nr_shmem
>      76310            -2.3%      74522        proc-vmstat.nr_slab_unrecla=
ima
> ble
>     386168            +6.6%     411753        proc-vmstat.nr_zone_active_=
ano
> n
>    4582303            +5.4%    4830711        proc-vmstat.nr_zone_inactiv=
e_a
> non
>   18391760            +5.7%   19438319        proc-vmstat.numa_hit
>   18131861            +5.8%   19178496        proc-vmstat.numa_local
>   18528821            +5.7%   19576418        proc-vmstat.pgalloc_normal
>  1.888e+08            +6.6%  2.013e+08        proc-vmstat.pgfault
>   17647082            +3.9%   18327501 =C2=B1  2%  proc-vmstat.pgfree
>     179427 =C2=B1  2%      -6.8%     167215 =C2=B1  4%  slabinfo.dentry.a=
ctive_objs
>       4283 =C2=B1  2%      -6.8%       3992 =C2=B1  4%  slabinfo.dentry.a=
ctive_slabs
>     179904 =C2=B1  2%      -6.8%     167693 =C2=B1  4%  slabinfo.dentry.n=
um_objs
>       4283 =C2=B1  2%      -6.8%       3992 =C2=B1  4%  slabinfo.dentry.n=
um_slabs
>       1948 =C2=B1  4%     -19.6%       1565 =C2=B1 10%  slabinfo.dmaengin=
e-unmap-16.ac
> tive_objs
>       1948 =C2=B1  4%     -19.6%       1565 =C2=B1 10%  slabinfo.dmaengin=
e-unmap-16.nu
> m_objs
>       7740 =C2=B1  7%     -11.5%       6854 =C2=B1  7%  slabinfo.files_ca=
che.active_ob
> js
>       7740 =C2=B1  7%     -11.5%       6854 =C2=B1  7%  slabinfo.files_ca=
che.num_objs
>      92887           -11.2%      82441 =C2=B1  6%  slabinfo.filp.active_o=
bjs
>       1454           -11.2%       1292 =C2=B1  6%  slabinfo.filp.active_s=
labs
>      93138           -11.2%      82749 =C2=B1  6%  slabinfo.filp.num_objs
>       1454           -11.2%       1292 =C2=B1  6%  slabinfo.filp.num_slabs
>       6421 =C2=B1  5%      -5.7%       6056 =C2=B1  5%  slabinfo.signal_c=
ache.active_o
> bjs
>       6463 =C2=B1  4%      -6.3%       6059 =C2=B1  5%  slabinfo.signal_c=
ache.num_objs
>      10665 =C2=B1  5%      -8.7%       9740 =C2=B1  5%  slabinfo.task_del=
ay_info.activ
> e_objs
>      10665 =C2=B1  5%      -8.7%       9740 =C2=B1  5%  slabinfo.task_del=
ay_info.num_o
> bjs
>       0.01           -16.7%       0.01        perf-sched.sch_delay.avg.ms=
.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault.[un=
kno
> wn]
>       0.01           -16.7%       0.01        perf-sched.sch_delay.avg.ms=
.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on_
> single.[unknown]
>       0.00 =C2=B1 40%     -83.3%       0.00 =C2=B1 70%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc_pages_vm=
a.s
> hmem_alloc_page
>       0.01 =C2=B1 14%     -89.5%       0.00 =C2=B1141%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.change_p4d_range.change_protection.ch=
ang
> e_prot_numa
>       0.01           -16.7%       0.01        perf-sched.sch_delay.avg.ms=
.pr
> eempt_schedule_common._cond_resched.wait_for_completion.stop_two_cpus.mig=
rat
> e_swap
>       0.01           -16.7%       0.01        perf-sched.sch_delay.avg.ms=
.rc
> u_gp_kthread.kthread.ret_from_fork
>       0.01           -16.7%       0.01        perf-sched.sch_delay.avg.ms=
.sc
> hedule_timeout.kcompactd.kthread.ret_from_fork
>       0.01           -12.5%       0.01        perf-sched.sch_delay.avg.ms=
.sm
> pboot_thread_fn.kthread.ret_from_fork
>       0.01           -12.5%       0.01        perf-sched.sch_delay.avg.ms=
.wo
> rker_thread.kthread.ret_from_fork
>       0.11 =C2=B1 33%     -81.8%       0.02 =C2=B1 39%  perf-sched.sch_de=
lay.max.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault.[un=
kno
> wn]
>      10.88 =C2=B1  3%      +9.8%      11.94        perf-sched.sch_delay.m=
ax.ms.io
> _schedule.__lock_page.find_lock_entry.shmem_getpage_gfp
>       0.01           -44.4%       0.00 =C2=B1 70%  perf-sched.sch_delay.m=
ax.ms.pr
> eempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc_pages_vm=
a.s
> hmem_alloc_page
>       0.01 =C2=B1 18%     -80.0%       0.00 =C2=B1141%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.change_p4d_range.change_protection.ch=
ang
> e_prot_numa
>       0.01 =C2=B1  4%     -20.6%       0.01 =C2=B1  9%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.s=
che
> d_setaffinity
>       0.01 =C2=B1 13%     -72.2%       0.00 =C2=B1141%  perf-sched.sch_de=
lay.max.ms.sc
> hedule_timeout.wait_for_completion.stop_two_cpus.migrate_swap
>      10.88 =C2=B1  3%      +9.8%      11.94        perf-sched.total_sch_d=
elay.max
> .ms
>       3727 =C2=B1 15%     +24.1%       4625 =C2=B1  9%  perf-sched.total_=
wait_and_dela
> y.max.ms
>       3727 =C2=B1 15%     +24.1%       4625 =C2=B1  9%  perf-sched.total_=
wait_time.max
> .ms
>     430.15           +26.6%     544.61 =C2=B1  2%  perf-sched.wait_and_de=
lay.avg.
> ms.smpboot_thread_fn.kthread.ret_from_fork
>       4227           -21.3%       3328 =C2=B1  2%  perf-sched.wait_and_de=
lay.coun
> t.smpboot_thread_fn.kthread.ret_from_fork
>      14.82 =C2=B1  9%     -16.7%      12.34 =C2=B1  4%  perf-sched.wait_a=
nd_delay.max.
> ms.io_schedule.__lock_page.find_lock_entry.shmem_getpage_gfp
>     335.00 =C2=B1  3%     -12.0%     294.66 =C2=B1 10%  perf-sched.wait_a=
nd_delay.max.
> ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>       1736 =C2=B1 50%    +166.4%       4625 =C2=B1  9%  perf-sched.wait_a=
nd_delay.max.
> ms.smpboot_thread_fn.kthread.ret_from_fork
>       0.74 =C2=B1  5%     -15.5%       0.63 =C2=B1  3%  perf-sched.wait_t=
ime.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on_
> single.[unknown]
>       0.29 =C2=B1 41%     -66.1%       0.10 =C2=B1 73%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc_pages_vm=
a.s
> hmem_alloc_page
>       0.83 =C2=B1 56%     -92.8%       0.06 =C2=B1141%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.change_p4d_range.change_protection.ch=
ang
> e_prot_numa
>       0.63 =C2=B1  7%     -33.5%       0.42 =C2=B1 28%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.do_user_addr_fault.exc_page_fault.asm=
_ex
> c_page_fault
>       1.77 =C2=B1138%     -98.7%       0.02 =C2=B1 46%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.find_lock_entry.shmem_getpage_gfp.shm=
em_
> write_begin
>       0.74 =C2=B1  2%     -10.2%       0.67 =C2=B1  2%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.stop_one_cpu.migrate_task_to.task_num=
a_m
> igrate
>     430.14           +26.6%     544.60 =C2=B1  2%  perf-sched.wait_time.a=
vg.ms.sm
> pboot_thread_fn.kthread.ret_from_fork
>       1.28 =C2=B1 12%     -22.7%       0.99 =C2=B1 17%  perf-sched.wait_t=
ime.max.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on.
> [unknown]
>       8.06 =C2=B1 12%     -36.3%       5.13 =C2=B1 27%  perf-sched.wait_t=
ime.max.ms.io
> _schedule.__lock_page.find_lock_entry.shmem_getpage_gfp
>       0.95 =C2=B1 54%     -88.0%       0.11 =C2=B1141%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.change_p4d_range.change_protection.ch=
ang
> e_prot_numa
>       1.28 =C2=B1 11%     -25.9%       0.95 =C2=B1 29%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.do_user_addr_fault.exc_page_fault.asm=
_ex
> c_page_fault
>       1.27 =C2=B1  4%     +29.7%       1.64 =C2=B1  8%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.find_lock_entry.shmem_getpage_gfp.shm=
em_
> fault
>     334.99 =C2=B1  3%     -12.0%     294.66 =C2=B1 10%  perf-sched.wait_t=
ime.max.ms.sc
> hedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>       1736 =C2=B1 50%    +166.4%       4625 =C2=B1  9%  perf-sched.wait_t=
ime.max.ms.sm
> pboot_thread_fn.kthread.ret_from_fork
>       3.96 =C2=B1  2%      -5.3%       3.75        perf-stat.i.MPKI
>  2.906e+10            +5.3%  3.059e+10        perf-stat.i.branch-instruct=
ion
> s
>       0.15 =C2=B1  3%      -0.0        0.15        perf-stat.i.branch-mis=
s-rate%
>   38447186            +2.6%   39452837        perf-stat.i.branch-misses
>      23.54            -2.0       21.54 =C2=B1  2%  perf-stat.i.cache-miss=
-rate%
>   83239917            -8.1%   76465336 =C2=B1  3%  perf-stat.i.cache-miss=
es
>    1188730            +5.7%    1256035        perf-stat.i.context-switches
>       1.19            -2.9%       1.16        perf-stat.i.cpi
>  1.077e+11            +2.2%  1.101e+11        perf-stat.i.cpu-cycles
>       5424            -2.5%       5290 =C2=B1  2%  perf-stat.i.cpu-migrat=
ions
>       1293           +11.2%       1438 =C2=B1  3%  perf-stat.i.cycles-bet=
ween-cac
> he-misses
>  2.664e+10            +5.1%  2.801e+10        perf-stat.i.dTLB-loads
>     827699            +6.0%     877175 =C2=B1  3%  perf-stat.i.dTLB-store=
-misses
>  4.281e+09            +5.2%  4.502e+09        perf-stat.i.dTLB-stores
>   12958545            +4.3%   13519452        perf-stat.i.iTLB-load-misses
>    9903049            +3.8%   10284061        perf-stat.i.iTLB-loads
>  9.133e+10            +5.1%  9.603e+10        perf-stat.i.instructions
>       0.84            +2.8%       0.87        perf-stat.i.ipc
>       0.56            +2.2%       0.57        perf-stat.i.metric.GHz
>     314.55            +5.2%     330.79        perf-stat.i.metric.M/sec
>     617210            +6.5%     657406        perf-stat.i.minor-faults
>   28662281           -14.0%   24641433 =C2=B1  2%  perf-stat.i.node-load-=
misses
>    1246335 =C2=B1 11%     -28.2%     894914 =C2=B1  3%  perf-stat.i.node-=
loads
>   11605915            +2.6%   11908271        perf-stat.i.node-store-miss=
es
>     617213            +6.5%     657410        perf-stat.i.page-faults
>       3.89            -3.8%       3.74        perf-stat.overall.MPKI
>       0.13            -0.0        0.13        perf-stat.overall.branch-mi=
ss-
> rate%
>      23.46            -2.2       21.29 =C2=B1  2%  perf-stat.overall.cach=
e-miss-r
> ate%
>       1.18            -2.8%       1.15        perf-stat.overall.cpi
>       1293           +11.4%       1441 =C2=B1  3%  perf-stat.overall.cycl=
es-betwe
> en-cache-misses
>       0.85            +2.9%       0.87        perf-stat.overall.ipc
>  2.896e+10            +5.3%  3.048e+10        perf-stat.ps.branch-instruc=
tio
> ns
>   38321518            +2.6%   39325047        perf-stat.ps.branch-misses
>   82960056            -8.1%   76209700 =C2=B1  3%  perf-stat.ps.cache-mis=
ses
>    1184628            +5.7%    1251746        perf-stat.ps.context-switch=
es
>  1.073e+11            +2.2%  1.097e+11        perf-stat.ps.cpu-cycles
>       5407            -2.5%       5273 =C2=B1  2%  perf-stat.ps.cpu-migra=
tions
>  2.655e+10            +5.1%  2.792e+10        perf-stat.ps.dTLB-loads
>     824894            +6.0%     874202 =C2=B1  3%  perf-stat.ps.dTLB-stor=
e-misses
>  4.266e+09            +5.2%  4.487e+09        perf-stat.ps.dTLB-stores
>   12915614            +4.3%   13475114        perf-stat.ps.iTLB-load-miss=
es
>    9869483            +3.9%   10249536        perf-stat.ps.iTLB-loads
>  9.101e+10            +5.2%   9.57e+10        perf-stat.ps.instructions
>     615084            +6.5%     655165        perf-stat.ps.minor-faults
>   28564746           -14.0%   24558588 =C2=B1  2%  perf-stat.ps.node-load=
-misses
>    1242876 =C2=B1 11%     -28.2%     892764 =C2=B1  3%  perf-stat.ps.node=
-loads
>   11566204            +2.6%   11867942        perf-stat.ps.node-store-mis=
ses
>     615087            +6.5%     655168        perf-stat.ps.page-faults
>  2.793e+13            +5.3%   2.94e+13        perf-stat.total.instructions
>      10.23            -0.5        9.73        perf-profile.calltrace.cycl=
es-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.alloc_set_pte.filemap_=
map
> _pages.do_fault
>      10.30            -0.5        9.81        perf-profile.calltrace.cycl=
es-
> pp.alloc_set_pte.filemap_map_pages.do_fault.__handle_mm_fault.handle_mm_f=
aul
> t
>      12.16            -0.5       11.67        perf-profile.calltrace.cycl=
es-
> pp.filemap_map_pages.do_fault.__handle_mm_fault.handle_mm_fault.do_user_a=
ddr
> _fault
>      10.29            -0.5        9.80        perf-profile.calltrace.cycl=
es-
> pp._raw_spin_lock.alloc_set_pte.filemap_map_pages.do_fault.__handle_mm_fa=
ult
>      49.64            -0.5       49.16        perf-profile.calltrace.cycl=
es-
> pp.secondary_startup_64_no_verify
>      49.34            -0.4       48.91        perf-profile.calltrace.cycl=
es-
> pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      49.33            -0.4       48.90        perf-profile.calltrace.cycl=
es-
> pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_veri=
fy
>      49.34            -0.4       48.92        perf-profile.calltrace.cycl=
es-
> pp.start_secondary.secondary_startup_64_no_verify
>      31.24            -0.4       30.87        perf-profile.calltrace.cycl=
es-
> pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page=
_fa
> ult
>      44.11            -0.3       43.79        perf-profile.calltrace.cycl=
es-
> pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
>      32.13            -0.3       31.83        perf-profile.calltrace.cycl=
es-
> pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.as=
m_e
> xc_page_fault
>      32.27            -0.3       31.97        perf-profile.calltrace.cycl=
es-
> pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.d=
o_a
> ccess
>      46.34            -0.2       46.10        perf-profile.calltrace.cycl=
es-
> pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>      46.24            -0.2       45.99        perf-profile.calltrace.cycl=
es-
> pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_seco=
nda
> ry
>      32.94            -0.2       32.71        perf-profile.calltrace.cycl=
es-
> pp.exc_page_fault.asm_exc_page_fault.do_access
>      32.93            -0.2       32.70        perf-profile.calltrace.cycl=
es-
> pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
>      33.19            -0.2       32.97        perf-profile.calltrace.cycl=
es-
> pp.asm_exc_page_fault.do_access
>       0.74            -0.2        0.52 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.sched_ttwu_pending.flush_smp_call_function_from_idle.do_idle.cpu_start=
up_
> entry.start_secondary
>       0.94            -0.2        0.73        perf-profile.calltrace.cycl=
es-
> pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.start_seco=
nda
> ry.secondary_startup_64_no_verify
>       1.02            -0.1        0.92        perf-profile.calltrace.cycl=
es-
> pp.try_to_wake_up.wake_page_function.__wake_up_common.wake_up_page_bit.do=
_fa
> ult
>       1.11            -0.1        1.03        perf-profile.calltrace.cycl=
es-
> pp.wake_page_function.__wake_up_common.wake_up_page_bit.do_fault.__handle=
_mm
> _fault
>       1.20            -0.1        1.12        perf-profile.calltrace.cycl=
es-
> pp.__wake_up_common.wake_up_page_bit.do_fault.__handle_mm_fault.handle_mm=
_fa
> ult
>       0.69 =C2=B1  2%      -0.1        0.62 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.wake_page_function.__wake_up_common.wake_up_page_bit.filemap_map_pages=
.do
> _fault
>       0.76 =C2=B1  2%      -0.1        0.69 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.__wake_up_common.wake_up_page_bit.filemap_map_pages.do_fault.__handle_=
mm_
> fault
>       0.61 =C2=B1  2%      -0.1        0.54 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.try_to_wake_up.wake_page_function.__wake_up_common.wake_up_page_bit.fi=
lem
> ap_map_pages
>       0.86 =C2=B1  2%      -0.1        0.79        perf-profile.calltrace=
.cycles-
> pp.wake_up_page_bit.filemap_map_pages.do_fault.__handle_mm_fault.handle_m=
m_f
> ault
>       1.39            -0.1        1.34        perf-profile.calltrace.cycl=
es-
> pp.wake_up_page_bit.do_fault.__handle_mm_fault.handle_mm_fault.do_user_ad=
dr_
> fault
>       1.32            +0.1        1.39        perf-profile.calltrace.cycl=
es-
> pp.__schedule.schedule.io_schedule.__lock_page.find_lock_entry
>       1.34            +0.1        1.42        perf-profile.calltrace.cycl=
es-
> pp.io_schedule.__lock_page.find_lock_entry.shmem_getpage_gfp.shmem_fault
>       0.74 =C2=B1  4%      +0.1        0.82 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt.asm_sysvec_apic_t=
ime
> r_interrupt.cpuidle_enter_state.cpuidle_enter
>       0.74 =C2=B1  4%      +0.1        0.82 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.__sysvec_apic_timer_interrupt.asm_call_sysvec_on_stack.sysvec_apic_tim=
er_
> interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>       1.33            +0.1        1.41        perf-profile.calltrace.cycl=
es-
> pp.schedule.io_schedule.__lock_page.find_lock_entry.shmem_getpage_gfp
>       0.73 =C2=B1  4%      +0.1        0.81 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.asm_call_sysvec_on_sta=
ck.
> sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       1.29 =C2=B1  2%      +0.1        1.39 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_en=
ter
> _state.cpuidle_enter.do_idle
>       1.40 =C2=B1  3%      +0.1        1.50 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_i=
dle
> .cpu_startup_entry
>       1.03            +0.1        1.18        perf-profile.calltrace.cycl=
es-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__lock_page.find_l=
ock
> _entry.shmem_getpage_gfp
>       1.24            +0.1        1.39        perf-profile.calltrace.cycl=
es-
> pp._raw_spin_lock_irq.__lock_page.find_lock_entry.shmem_getpage_gfp.shmem=
_fa
> ult
>       3.08            +0.2        3.32        perf-profile.calltrace.cycl=
es-
> pp.__lock_page.find_lock_entry.shmem_getpage_gfp.shmem_fault.__do_fault
>       3.51            +0.3        3.79        perf-profile.calltrace.cycl=
es-
> pp.find_lock_entry.shmem_getpage_gfp.shmem_fault.__do_fault.do_fault
>       3.83            +0.3        4.14        perf-profile.calltrace.cycl=
es-
> pp.shmem_getpage_gfp.shmem_fault.__do_fault.do_fault.__handle_mm_fault
>       3.90            +0.3        4.22        perf-profile.calltrace.cycl=
es-
> pp.shmem_fault.__do_fault.do_fault.__handle_mm_fault.handle_mm_fault
>       3.91            +0.3        4.23        perf-profile.calltrace.cycl=
es-
> pp.__do_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fau=
lt
>      16.94            +0.6       17.53        perf-profile.calltrace.cycl=
es-
> pp.do_rw_once
>      23.80            -0.7       23.15        perf-profile.children.cycle=
s-p
> p.alloc_set_pte
>      24.41            -0.6       23.79        perf-profile.children.cycle=
s-p
> p._raw_spin_lock
>      12.16            -0.5       11.67        perf-profile.children.cycle=
s-p
> p.filemap_map_pages
>      49.64            -0.5       49.16        perf-profile.children.cycle=
s-p
> p.secondary_startup_64_no_verify
>      49.64            -0.5       49.16        perf-profile.children.cycle=
s-p
> p.cpu_startup_entry
>      49.63            -0.5       49.15        perf-profile.children.cycle=
s-p
> p.do_idle
>      25.28            -0.5       24.81        perf-profile.children.cycle=
s-p
> p.native_queued_spin_lock_slowpath
>      49.34            -0.4       48.92        perf-profile.children.cycle=
s-p
> p.start_secondary
>      44.37            -0.4       44.00        perf-profile.children.cycle=
s-p
> p.intel_idle
>      31.24            -0.4       30.87        perf-profile.children.cycle=
s-p
> p.do_fault
>      46.63            -0.3       46.32        perf-profile.children.cycle=
s-p
> p.cpuidle_enter
>      46.62            -0.3       46.32        perf-profile.children.cycle=
s-p
> p.cpuidle_enter_state
>      32.14            -0.3       31.84        perf-profile.children.cycle=
s-p
> p.__handle_mm_fault
>      32.28            -0.3       31.98        perf-profile.children.cycle=
s-p
> p.handle_mm_fault
>       0.31 =C2=B1  3%      -0.2        0.08        perf-profile.children.=
cycles-p
> p.select_task_rq_fair
>      32.94            -0.2       32.71        perf-profile.children.cycle=
s-p
> p.do_user_addr_fault
>      32.95            -0.2       32.72        perf-profile.children.cycle=
s-p
> p.exc_page_fault
>      33.21            -0.2       33.00        perf-profile.children.cycle=
s-p
> p.asm_exc_page_fault
>       0.75            -0.2        0.53 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.sched_ttwu_pending
>       0.58            -0.2        0.37 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.enqueue_task_fair
>       0.95            -0.2        0.74        perf-profile.children.cycle=
s-p
> p.flush_smp_call_function_from_idle
>       0.59            -0.2        0.38 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.ttwu_do_activate
>       1.64            -0.2        1.47        perf-profile.children.cycle=
s-p
> p.try_to_wake_up
>       1.80            -0.2        1.65        perf-profile.children.cycle=
s-p
> p.wake_page_function
>       1.96            -0.1        1.82        perf-profile.children.cycle=
s-p
> p.__wake_up_common
>       0.44            -0.1        0.30        perf-profile.children.cycle=
s-p
> p.enqueue_entity
>       2.25            -0.1        2.13        perf-profile.children.cycle=
s-p
> p.wake_up_page_bit
>       0.35            -0.1        0.23 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.update_load_avg
>       0.13 =C2=B1  7%      -0.1        0.08        perf-profile.children.=
cycles-p
> p.__update_load_avg_cfs_rq
>       0.24            -0.0        0.19 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.update_curr
>       0.16 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.__smp_call_single_queue
>       0.16 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.llist_add_batch
>       0.27 =C2=B1  3%      -0.0        0.24 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.do_softirq_own_stack
>       0.27 =C2=B1  3%      -0.0        0.24 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__softirqentry_text_start
>       0.30 =C2=B1  2%      -0.0        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.irq_exit_rcu
>       0.09 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.__update_load_avg_se
>       0.08            +0.0        0.09        perf-profile.children.cycle=
s-p
> p.__switch_to
>       0.15 =C2=B1  3%      +0.0        0.16        perf-profile.children.=
cycles-p
> p.send_call_function_single_ipi
>       0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.delayacct_end
>       0.12 =C2=B1  6%      +0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_irq_exit
>       0.20 =C2=B1  2%      +0.0        0.22 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_idle_exit
>       0.27 =C2=B1  3%      +0.0        0.29 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.find_get_entry
>       0.09 =C2=B1  9%      +0.0        0.12 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.ktime_get_update_offsets_now
>       0.66            +0.0        0.69 =C2=B1  2%  perf-profile.children.=
cycles-p
> p._raw_spin_lock_irqsave
>       0.26 =C2=B1  7%      +0.0        0.29 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.down_read_trylock
>       0.35 =C2=B1  2%      +0.0        0.38        perf-profile.children.=
cycles-p
> p.ttwu_queue_wakelist
>       0.42            +0.0        0.45 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.finish_task_switch
>       0.16 =C2=B1  6%      +0.0        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.irq_enter_rcu
>       0.13 =C2=B1  3%      +0.0        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.tick_irq_enter
>       0.27 =C2=B1  6%      +0.0        0.32 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.clockevents_program_event
>       1.34            +0.1        1.42        perf-profile.children.cycle=
s-p
> p.io_schedule
>       1.34            +0.1        1.42        perf-profile.children.cycle=
s-p
> p.schedule
>       0.98 =C2=B1  3%      +0.1        1.05 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.__sysvec_apic_timer_interrupt
>       0.96 =C2=B1  3%      +0.1        1.04 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.hrtimer_interrupt
>       1.73            +0.1        1.82 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__schedule
>       1.58 =C2=B1  2%      +0.1        1.68 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.sysvec_apic_timer_interrupt
>       1.72 =C2=B1  2%      +0.1        1.82 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.asm_sysvec_apic_timer_interrupt
>      42.05            +0.1       42.17        perf-profile.children.cycle=
s-p
> p.do_access
>       1.31            +0.2        1.46        perf-profile.children.cycle=
s-p
> p._raw_spin_lock_irq
>       0.59 =C2=B1  2%      +0.2        0.75 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.ktime_get
>       3.08            +0.2        3.32        perf-profile.children.cycle=
s-p
> p.__lock_page
>       3.51            +0.3        3.79        perf-profile.children.cycle=
s-p
> p.find_lock_entry
>       3.83            +0.3        4.14        perf-profile.children.cycle=
s-p
> p.shmem_getpage_gfp
>       3.90            +0.3        4.22        perf-profile.children.cycle=
s-p
> p.shmem_fault
>       3.91            +0.3        4.23        perf-profile.children.cycle=
s-p
> p.__do_fault
>      14.39            +0.6       14.96        perf-profile.children.cycle=
s-p
> p.do_rw_once
>      25.17            -0.5       24.69        perf-profile.self.cycles-pp=
.na
> tive_queued_spin_lock_slowpath
>      44.37            -0.4       44.00        perf-profile.self.cycles-pp=
.in
> tel_idle
>       0.14 =C2=B1  3%      -0.1        0.07        perf-profile.self.cycl=
es-pp.en
> queue_task_fair
>       0.13 =C2=B1  7%      -0.1        0.08        perf-profile.self.cycl=
es-pp.__
> update_load_avg_cfs_rq
>       0.11 =C2=B1  4%      -0.0        0.06        perf-profile.self.cycl=
es-pp.up
> date_curr
>       0.13 =C2=B1  3%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.up
> date_load_avg
>       0.16 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.ll
> ist_add_batch
>       0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.__
> update_load_avg_se
>       0.07 =C2=B1  7%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.up
> date_rq_clock
>       0.20 =C2=B1  4%      +0.0        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.fi
> nd_get_entry
>       0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.do
> _fault
>       0.14 =C2=B1  3%      +0.0        0.16        perf-profile.self.cycl=
es-pp.se
> nd_call_function_single_ipi
>       0.06            +0.0        0.08 =C2=B1  6%  perf-profile.self.cycl=
es-pp.en
> queue_entity
>       0.15 =C2=B1  5%      +0.0        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.fi
> nd_lock_entry
>       0.57            +0.0        0.59        perf-profile.self.cycles-pp=
._r
> aw_spin_lock_irqsave
>       0.26 =C2=B1  3%      +0.0        0.28 =C2=B1  2%  perf-profile.self=
.cycles-pp.tr
> y_to_wake_up
>       0.41            +0.0        0.44        perf-profile.self.cycles-pp=
.__
> lock_page
>       0.41            +0.0        0.43 =C2=B1  2%  perf-profile.self.cycl=
es-pp.fi
> nish_task_switch
>       0.08 =C2=B1 10%      +0.0        0.11 =C2=B1 15%  perf-profile.self=
.cycles-pp.kt
> ime_get_update_offsets_now
>       0.41            +0.0        0.45        perf-profile.self.cycles-pp=
.__
> schedule
>       0.82            +0.1        0.87        perf-profile.self.cycles-pp=
.fi
> lemap_map_pages
>       0.00            +0.1        0.10 =C2=B1  4%  perf-profile.self.cycl=
es-pp.tt
> wu_queue_wakelist
>       0.50 =C2=B1  4%      +0.1        0.65 =C2=B1  8%  perf-profile.self=
.cycles-pp.kt
> ime_get
>       6.86            +0.2        7.10        perf-profile.self.cycles-pp=
.do
> _access
>       9.92            +0.5       10.39        perf-profile.self.cycles-pp=
.do
> _rw_once
>    2036949           -19.4%    1642191        interrupts.CAL:Function_cal=
l_i
> nterrupts
>      15297 =C2=B1  2%     -28.8%      10891 =C2=B1  4%  interrupts.CPU0.C=
AL:Function_c
> all_interrupts
>       1584 =C2=B1  2%     -30.1%       1107 =C2=B1  6%  interrupts.CPU0.R=
ES:Rescheduli
> ng_interrupts
>      13317           -42.0%       7719 =C2=B1  3%  interrupts.CPU0.TLB:TL=
B_shootd
> owns
>      13083 =C2=B1  3%     -22.5%      10140 =C2=B1  2%  interrupts.CPU1.C=
AL:Function_c
> all_interrupts
>       1448           -22.5%       1122 =C2=B1 15%  interrupts.CPU1.RES:Re=
scheduli
> ng_interrupts
>      10279 =C2=B1  2%     -36.0%       6575        interrupts.CPU1.TLB:TL=
B_shootd
> owns
>      10564           -20.2%       8428 =C2=B1  2%  interrupts.CPU10.CAL:F=
unction_
> call_interrupts
>       1367 =C2=B1  3%     -27.7%     989.33 =C2=B1  4%  interrupts.CPU10.=
RES:Reschedul
> ing_interrupts
>       8160 =C2=B1  3%     -29.8%       5728 =C2=B1  5%  interrupts.CPU10.=
TLB:TLB_shoot
> downs
>      10515           -16.7%       8762        interrupts.CPU100.CAL:Funct=
ion
> _call_interrupts
>       8057           -26.1%       5958        interrupts.CPU100.TLB:TLB_s=
hoo
> tdowns
>      10631           -17.9%       8727 =C2=B1  2%  interrupts.CPU101.CAL:=
Function
> _call_interrupts
>       8189 =C2=B1  2%     -28.6%       5848 =C2=B1  4%  interrupts.CPU101=
.TLB:TLB_shoo
> tdowns
>      10321           -16.8%       8584        interrupts.CPU102.CAL:Funct=
ion
> _call_interrupts
>       8031           -28.8%       5719 =C2=B1  3%  interrupts.CPU102.TLB:=
TLB_shoo
> tdowns
>      10699           -20.5%       8503        interrupts.CPU103.CAL:Funct=
ion
> _call_interrupts
>       8170 =C2=B1  2%     -29.5%       5757        interrupts.CPU103.TLB:=
TLB_shoo
> tdowns
>      10572           -19.5%       8510        interrupts.CPU104.CAL:Funct=
ion
> _call_interrupts
>       2570 =C2=B1 80%     -65.4%     888.33 =C2=B1  2%  interrupts.CPU104=
.RES:Reschedu
> ling_interrupts
>       8016 =C2=B1  3%     -28.0%       5768 =C2=B1  2%  interrupts.CPU104=
.TLB:TLB_shoo
> tdowns
>      10666           -16.6%       8891        interrupts.CPU105.CAL:Funct=
ion
> _call_interrupts
>       2549 =C2=B1 78%     -66.4%     857.67 =C2=B1  7%  interrupts.CPU105=
.RES:Reschedu
> ling_interrupts
>       8072           -26.0%       5974 =C2=B1  2%  interrupts.CPU105.TLB:=
TLB_shoo
> tdowns
>      10635           -18.7%       8644        interrupts.CPU106.CAL:Funct=
ion
> _call_interrupts
>       2789 =C2=B1 80%     -68.5%     878.33 =C2=B1  3%  interrupts.CPU106=
.RES:Reschedu
> ling_interrupts
>       8103 =C2=B1  2%     -28.1%       5828 =C2=B1  4%  interrupts.CPU106=
.TLB:TLB_shoo
> tdowns
>      10560           -18.4%       8613        interrupts.CPU107.CAL:Funct=
ion
> _call_interrupts
>       3443 =C2=B1 90%     -72.6%     945.00        interrupts.CPU107.RES:=
Reschedu
> ling_interrupts
>       8103 =C2=B1  2%     -27.6%       5864        interrupts.CPU107.TLB:=
TLB_shoo
> tdowns
>      10608           -19.9%       8496        interrupts.CPU108.CAL:Funct=
ion
> _call_interrupts
>       3231 =C2=B1 77%     -70.1%     967.33 =C2=B1  3%  interrupts.CPU108=
.RES:Reschedu
> ling_interrupts
>       8152           -30.4%       5674 =C2=B1  3%  interrupts.CPU108.TLB:=
TLB_shoo
> tdowns
>      10585           -18.7%       8608        interrupts.CPU109.CAL:Funct=
ion
> _call_interrupts
>       2450 =C2=B1 74%     -64.4%     871.67 =C2=B1  4%  interrupts.CPU109=
.RES:Reschedu
> ling_interrupts
>       8096 =C2=B1  2%     -27.4%       5879 =C2=B1  3%  interrupts.CPU109=
.TLB:TLB_shoo
> tdowns
>      10690           -20.3%       8516        interrupts.CPU11.CAL:Functi=
on_
> call_interrupts
>       1356 =C2=B1  4%     -29.9%     951.00 =C2=B1  4%  interrupts.CPU11.=
RES:Reschedul
> ing_interrupts
>       8209           -28.3%       5882 =C2=B1  2%  interrupts.CPU11.TLB:T=
LB_shoot
> downs
>      10483 =C2=B1  2%     -17.4%       8657        interrupts.CPU110.CAL:=
Function
> _call_interrupts
>       2623 =C2=B1 76%     -65.7%     898.67 =C2=B1  5%  interrupts.CPU110=
.RES:Reschedu
> ling_interrupts
>       8070           -26.5%       5929        interrupts.CPU110.TLB:TLB_s=
hoo
> tdowns
>      10799           -20.0%       8643        interrupts.CPU111.CAL:Funct=
ion
> _call_interrupts
>       2575 =C2=B1 74%     -65.0%     901.33 =C2=B1  5%  interrupts.CPU111=
.RES:Reschedu
> ling_interrupts
>       8219           -31.2%       5656        interrupts.CPU111.TLB:TLB_s=
hoo
> tdowns
>      10439           -18.1%       8544 =C2=B1  2%  interrupts.CPU112.CAL:=
Function
> _call_interrupts
>       1280 =C2=B1  5%     -31.2%     881.00 =C2=B1  3%  interrupts.CPU112=
.RES:Reschedu
> ling_interrupts
>       8248           -29.8%       5786 =C2=B1  4%  interrupts.CPU112.TLB:=
TLB_shoo
> tdowns
>      10638           -19.8%       8531        interrupts.CPU113.CAL:Funct=
ion
> _call_interrupts
>       1253 =C2=B1  4%     -30.0%     878.00 =C2=B1  6%  interrupts.CPU113=
.RES:Reschedu
> ling_interrupts
>       8206 =C2=B1  2%     -29.7%       5770 =C2=B1  2%  interrupts.CPU113=
.TLB:TLB_shoo
> tdowns
>      10512           -17.9%       8627        interrupts.CPU114.CAL:Funct=
ion
> _call_interrupts
>       1251           -30.6%     868.67 =C2=B1  4%  interrupts.CPU114.RES:=
Reschedu
> ling_interrupts
>       8098           -28.3%       5809        interrupts.CPU114.TLB:TLB_s=
hoo
> tdowns
>      10590           -19.6%       8516        interrupts.CPU115.CAL:Funct=
ion
> _call_interrupts
>       1254 =C2=B1  6%     -29.1%     889.00 =C2=B1  3%  interrupts.CPU115=
.RES:Reschedu
> ling_interrupts
>       8191           -30.1%       5722 =C2=B1  3%  interrupts.CPU115.TLB:=
TLB_shoo
> tdowns
>      10500           -18.8%       8531        interrupts.CPU116.CAL:Funct=
ion
> _call_interrupts
>       1372 =C2=B1  3%     -38.3%     846.00 =C2=B1  3%  interrupts.CPU116=
.RES:Reschedu
> ling_interrupts
>       8138           -29.6%       5729        interrupts.CPU116.TLB:TLB_s=
hoo
> tdowns
>      10646           -20.1%       8507 =C2=B1  2%  interrupts.CPU117.CAL:=
Function
> _call_interrupts
>       1326           -32.8%     891.00 =C2=B1  3%  interrupts.CPU117.RES:=
Reschedu
> ling_interrupts
>       8274           -30.0%       5793 =C2=B1  3%  interrupts.CPU117.TLB:=
TLB_shoo
> tdowns
>      10404           -18.0%       8533        interrupts.CPU118.CAL:Funct=
ion
> _call_interrupts
>       1315 =C2=B1  4%     -33.3%     877.33 =C2=B1  2%  interrupts.CPU118=
.RES:Reschedu
> ling_interrupts
>       8140           -29.1%       5770 =C2=B1  2%  interrupts.CPU118.TLB:=
TLB_shoo
> tdowns
>      10686           -19.3%       8627        interrupts.CPU119.CAL:Funct=
ion
> _call_interrupts
>       1301 =C2=B1  3%     -30.9%     898.67 =C2=B1  3%  interrupts.CPU119=
.RES:Reschedu
> ling_interrupts
>       8192           -28.8%       5836        interrupts.CPU119.TLB:TLB_s=
hoo
> tdowns
>      10295 =C2=B1  2%     -17.6%       8486 =C2=B1  2%  interrupts.CPU12.=
CAL:Function_
> call_interrupts
>       1342 =C2=B1  4%     -27.3%     976.33 =C2=B1  3%  interrupts.CPU12.=
RES:Reschedul
> ing_interrupts
>       8078           -29.0%       5734        interrupts.CPU12.TLB:TLB_sh=
oot
> downs
>      10427           -17.7%       8577 =C2=B1  3%  interrupts.CPU120.CAL:=
Function
> _call_interrupts
>       1444 =C2=B1  2%     -41.1%     850.00 =C2=B1  3%  interrupts.CPU120=
.RES:Reschedu
> ling_interrupts
>       8024           -28.3%       5756 =C2=B1  6%  interrupts.CPU120.TLB:=
TLB_shoo
> tdowns
>      10703 =C2=B1  3%     -20.7%       8483 =C2=B1  2%  interrupts.CPU121=
.CAL:Function
> _call_interrupts
>       1253 =C2=B1  3%     -29.3%     886.33 =C2=B1  5%  interrupts.CPU121=
.RES:Reschedu
> ling_interrupts
>       8294           -30.8%       5740 =C2=B1  2%  interrupts.CPU121.TLB:=
TLB_shoo
> tdowns
>      10381           -19.1%       8403        interrupts.CPU122.CAL:Funct=
ion
> _call_interrupts
>       1259 =C2=B1  5%     -32.5%     850.00 =C2=B1  9%  interrupts.CPU122=
.RES:Reschedu
> ling_interrupts
>       7994 =C2=B1  3%     -28.5%       5713 =C2=B1  3%  interrupts.CPU122=
.TLB:TLB_shoo
> tdowns
>      10628           -19.6%       8543        interrupts.CPU123.CAL:Funct=
ion
> _call_interrupts
>       1293 =C2=B1  3%     -33.8%     856.33 =C2=B1  5%  interrupts.CPU123=
.RES:Reschedu
> ling_interrupts
>       8243           -30.4%       5734 =C2=B1  2%  interrupts.CPU123.TLB:=
TLB_shoo
> tdowns
>      10443           -20.4%       8317 =C2=B1  3%  interrupts.CPU124.CAL:=
Function
> _call_interrupts
>       1292 =C2=B1  4%     -31.8%     881.33 =C2=B1  5%  interrupts.CPU124=
.RES:Reschedu
> ling_interrupts
>       7998 =C2=B1  3%     -29.6%       5627 =C2=B1  5%  interrupts.CPU124=
.TLB:TLB_shoo
> tdowns
>      10355           -18.0%       8491        interrupts.CPU125.CAL:Funct=
ion
> _call_interrupts
>       1270 =C2=B1  3%     -33.3%     847.00 =C2=B1  2%  interrupts.CPU125=
.RES:Reschedu
> ling_interrupts
>       8002           -27.8%       5780        interrupts.CPU125.TLB:TLB_s=
hoo
> tdowns
>      10416           -19.6%       8377 =C2=B1  3%  interrupts.CPU126.CAL:=
Function
> _call_interrupts
>       1246 =C2=B1  4%     -30.5%     866.33 =C2=B1  6%  interrupts.CPU126=
.RES:Reschedu
> ling_interrupts
>       8031 =C2=B1  3%     -30.9%       5546 =C2=B1  5%  interrupts.CPU126=
.TLB:TLB_shoo
> tdowns
>      10254           -16.0%       8612        interrupts.CPU127.CAL:Funct=
ion
> _call_interrupts
>       1246 =C2=B1  4%     -26.8%     912.67 =C2=B1  5%  interrupts.CPU127=
.RES:Reschedu
> ling_interrupts
>       8011 =C2=B1  2%     -29.8%       5623 =C2=B1  2%  interrupts.CPU127=
.TLB:TLB_shoo
> tdowns
>      10413           -19.8%       8355 =C2=B1  3%  interrupts.CPU128.CAL:=
Function
> _call_interrupts
>       2553 =C2=B1 74%     -66.6%     852.67 =C2=B1  8%  interrupts.CPU128=
.RES:Reschedu
> ling_interrupts
>       8005           -30.9%       5533 =C2=B1  2%  interrupts.CPU128.TLB:=
TLB_shoo
> tdowns
>      10338           -14.6%       8827 =C2=B1  6%  interrupts.CPU129.CAL:=
Function
> _call_interrupts
>       2861 =C2=B1 75%     -65.0%       1002 =C2=B1 12%  interrupts.CPU129=
.RES:Reschedu
> ling_interrupts
>       7922           -28.3%       5677 =C2=B1  4%  interrupts.CPU129.TLB:=
TLB_shoo
> tdowns
>      10825           -21.7%       8475 =C2=B1  2%  interrupts.CPU13.CAL:F=
unction_
> call_interrupts
>       1385           -29.4%     978.67        interrupts.CPU13.RES:Resche=
dul
> ing_interrupts
>       8308           -31.7%       5676 =C2=B1  4%  interrupts.CPU13.TLB:T=
LB_shoot
> downs
>      10375           -18.9%       8411 =C2=B1  3%  interrupts.CPU130.CAL:=
Function
> _call_interrupts
>       2863 =C2=B1 75%     -70.2%     852.33 =C2=B1  2%  interrupts.CPU130=
.RES:Reschedu
> ling_interrupts
>       8007           -30.8%       5539 =C2=B1  4%  interrupts.CPU130.TLB:=
TLB_shoo
> tdowns
>      10337 =C2=B1  2%     -20.2%       8254        interrupts.CPU131.CAL:=
Function
> _call_interrupts
>       2993 =C2=B1 81%     -70.5%     883.67 =C2=B1  4%  interrupts.CPU131=
.RES:Reschedu
> ling_interrupts
>       8058 =C2=B1  2%     -31.0%       5558 =C2=B1  2%  interrupts.CPU131=
.TLB:TLB_shoo
> tdowns
>      10385           -20.9%       8219 =C2=B1  3%  interrupts.CPU132.CAL:=
Function
> _call_interrupts
>       3130 =C2=B1 78%     -71.5%     893.67 =C2=B1  6%  interrupts.CPU132=
.RES:Reschedu
> ling_interrupts
>       7957 =C2=B1  2%     -31.9%       5417 =C2=B1  5%  interrupts.CPU132=
.TLB:TLB_shoo
> tdowns
>      10758 =C2=B1  3%     -22.6%       8325        interrupts.CPU133.CAL:=
Function
> _call_interrupts
>       2618 =C2=B1 74%     -67.4%     853.33 =C2=B1  2%  interrupts.CPU133=
.RES:Reschedu
> ling_interrupts
>       8156 =C2=B1  2%     -31.5%       5586 =C2=B1  4%  interrupts.CPU133=
.TLB:TLB_shoo
> tdowns
>      10690           -22.3%       8305        interrupts.CPU134.CAL:Funct=
ion
> _call_interrupts
>       2409 =C2=B1 72%     -63.6%     876.67 =C2=B1  6%  interrupts.CPU134=
.RES:Reschedu
> ling_interrupts
>       8131           -31.6%       5562 =C2=B1  2%  interrupts.CPU134.TLB:=
TLB_shoo
> tdowns
>      10416           -20.3%       8301        interrupts.CPU135.CAL:Funct=
ion
> _call_interrupts
>       2523 =C2=B1 73%     -66.0%     858.67 =C2=B1  8%  interrupts.CPU135=
.RES:Reschedu
> ling_interrupts
>       7984 =C2=B1  3%     -29.9%       5600 =C2=B1  3%  interrupts.CPU135=
.TLB:TLB_shoo
> tdowns
>      10345 =C2=B1  2%     -20.4%       8232        interrupts.CPU136.CAL:=
Function
> _call_interrupts
>       1264 =C2=B1  4%     -33.1%     846.33 =C2=B1  2%  interrupts.CPU136=
.RES:Reschedu
> ling_interrupts
>       7973           -29.7%       5604 =C2=B1  2%  interrupts.CPU136.TLB:=
TLB_shoo
> tdowns
>      10360           -16.7%       8625 =C2=B1  3%  interrupts.CPU137.CAL:=
Function
> _call_interrupts
>       1226 =C2=B1  3%     -29.0%     871.00 =C2=B1  6%  interrupts.CPU137=
.RES:Reschedu
> ling_interrupts
>       7966           -27.8%       5754 =C2=B1  6%  interrupts.CPU137.TLB:=
TLB_shoo
> tdowns
>      10450           -18.0%       8568 =C2=B1  2%  interrupts.CPU138.CAL:=
Function
> _call_interrupts
>       1306 =C2=B1  5%     -36.2%     833.67 =C2=B1  2%  interrupts.CPU138=
.RES:Reschedu
> ling_interrupts
>       8019 =C2=B1  3%     -28.4%       5743 =C2=B1  2%  interrupts.CPU138=
.TLB:TLB_shoo
> tdowns
>      10407 =C2=B1  2%     -19.5%       8382 =C2=B1  2%  interrupts.CPU139=
.CAL:Function
> _call_interrupts
>       1210 =C2=B1  2%     -29.7%     851.33 =C2=B1  7%  interrupts.CPU139=
.RES:Reschedu
> ling_interrupts
>       8010 =C2=B1  2%     -28.3%       5741 =C2=B1  4%  interrupts.CPU139=
.TLB:TLB_shoo
> tdowns
>      10253           -17.7%       8435        interrupts.CPU14.CAL:Functi=
on_
> call_interrupts
>       1355 =C2=B1  7%     -28.2%     972.67 =C2=B1  3%  interrupts.CPU14.=
RES:Reschedul
> ing_interrupts
>       8119 =C2=B1  2%     -28.5%       5808 =C2=B1  2%  interrupts.CPU14.=
TLB:TLB_shoot
> downs
>      10335           -16.9%       8593        interrupts.CPU140.CAL:Funct=
ion
> _call_interrupts
>       1254           -33.5%     833.67 =C2=B1  4%  interrupts.CPU140.RES:=
Reschedu
> ling_interrupts
>       7915 =C2=B1  3%     -28.0%       5699 =C2=B1  3%  interrupts.CPU140=
.TLB:TLB_shoo
> tdowns
>      10423           -20.0%       8339        interrupts.CPU141.CAL:Funct=
ion
> _call_interrupts
>       1735 =C2=B1 34%     +51.9%       2635        interrupts.CPU141.NMI:=
Non-mask
> able_interrupts
>       1735 =C2=B1 34%     +51.9%       2635        interrupts.CPU141.PMI:=
Performa
> nce_monitoring_interrupts
>       1246 =C2=B1  4%     -32.7%     838.33 =C2=B1  4%  interrupts.CPU141=
.RES:Reschedu
> ling_interrupts
>       8019           -29.9%       5623 =C2=B1  4%  interrupts.CPU141.TLB:=
TLB_shoo
> tdowns
>      10189           -17.6%       8398        interrupts.CPU142.CAL:Funct=
ion
> _call_interrupts
>       1311 =C2=B1  9%     -30.6%     910.33 =C2=B1  4%  interrupts.CPU142=
.RES:Reschedu
> ling_interrupts
>       7815           -26.6%       5737 =C2=B1  3%  interrupts.CPU142.TLB:=
TLB_shoo
> tdowns
>      10618           -22.4%       8241        interrupts.CPU143.CAL:Funct=
ion
> _call_interrupts
>       1277 =C2=B1  3%     -34.0%     843.67 =C2=B1  9%  interrupts.CPU143=
.RES:Reschedu
> ling_interrupts
>       8167           -29.3%       5771 =C2=B1  2%  interrupts.CPU143.TLB:=
TLB_shoo
> tdowns
>      10984 =C2=B1  2%     -22.5%       8517        interrupts.CPU144.CAL:=
Function
> _call_interrupts
>       1480 =C2=B1  2%     -40.9%     875.33 =C2=B1  5%  interrupts.CPU144=
.RES:Reschedu
> ling_interrupts
>       8148 =C2=B1  3%     -30.6%       5653 =C2=B1  2%  interrupts.CPU144=
.TLB:TLB_shoo
> tdowns
>      10731           -20.6%       8522 =C2=B1  2%  interrupts.CPU145.CAL:=
Function
> _call_interrupts
>       1314           -33.2%     878.33 =C2=B1  7%  interrupts.CPU145.RES:=
Reschedu
> ling_interrupts
>       8166           -27.6%       5910 =C2=B1  4%  interrupts.CPU145.TLB:=
TLB_shoo
> tdowns
>      10483           -19.1%       8484 =C2=B1  4%  interrupts.CPU146.CAL:=
Function
> _call_interrupts
>       1305 =C2=B1  4%     -32.4%     882.00 =C2=B1  5%  interrupts.CPU146=
.RES:Reschedu
> ling_interrupts
>       8095 =C2=B1  2%     -27.2%       5894 =C2=B1  4%  interrupts.CPU146=
.TLB:TLB_shoo
> tdowns
>      10409           -18.5%       8488 =C2=B1  2%  interrupts.CPU147.CAL:=
Function
> _call_interrupts
>       1170 =C2=B1  4%     -24.8%     880.33        interrupts.CPU147.RES:=
Reschedu
> ling_interrupts
>       7964 =C2=B1  2%     -27.0%       5816 =C2=B1  5%  interrupts.CPU147=
.TLB:TLB_shoo
> tdowns
>      10394           -20.2%       8299 =C2=B1  4%  interrupts.CPU148.CAL:=
Function
> _call_interrupts
>       1230           -30.4%     856.00 =C2=B1  5%  interrupts.CPU148.RES:=
Reschedu
> ling_interrupts
>       7792           -29.6%       5486 =C2=B1  5%  interrupts.CPU148.TLB:=
TLB_shoo
> tdowns
>      10386           -18.5%       8467 =C2=B1  2%  interrupts.CPU149.CAL:=
Function
> _call_interrupts
>       1348 =C2=B1  7%     -34.8%     878.67        interrupts.CPU149.RES:=
Reschedu
> ling_interrupts
>       7884 =C2=B1  2%     -27.1%       5744 =C2=B1  2%  interrupts.CPU149=
.TLB:TLB_shoo
> tdowns
>      10613           -18.0%       8705        interrupts.CPU15.CAL:Functi=
on_
> call_interrupts
>       1387           -30.0%     971.67 =C2=B1  5%  interrupts.CPU15.RES:R=
eschedul
> ing_interrupts
>       8240 =C2=B1  2%     -30.6%       5721        interrupts.CPU15.TLB:T=
LB_shoot
> downs
>      10377 =C2=B1  2%     -20.4%       8264 =C2=B1  2%  interrupts.CPU150=
.CAL:Function
> _call_interrupts
>       1270 =C2=B1  4%     -31.0%     876.33 =C2=B1  3%  interrupts.CPU150=
.RES:Reschedu
> ling_interrupts
>       7923 =C2=B1  4%     -28.7%       5650 =C2=B1  5%  interrupts.CPU150=
.TLB:TLB_shoo
> tdowns
>      10759           -15.0%       9145 =C2=B1  6%  interrupts.CPU151.CAL:=
Function
> _call_interrupts
>       1316           -34.1%     868.00 =C2=B1  3%  interrupts.CPU151.RES:=
Reschedu
> ling_interrupts
>       8180           -29.4%       5778 =C2=B1  3%  interrupts.CPU151.TLB:=
TLB_shoo
> tdowns
>      10432           -18.3%       8522        interrupts.CPU152.CAL:Funct=
ion
> _call_interrupts
>       1212 =C2=B1  6%     -28.9%     862.00        interrupts.CPU152.RES:=
Reschedu
> ling_interrupts
>       7991 =C2=B1  2%     -29.8%       5610 =C2=B1  4%  interrupts.CPU152=
.TLB:TLB_shoo
> tdowns
>      10233           -17.8%       8408 =C2=B1  3%  interrupts.CPU153.CAL:=
Function
> _call_interrupts
>       1274 =C2=B1  4%     -33.2%     851.33 =C2=B1  6%  interrupts.CPU153=
.RES:Reschedu
> ling_interrupts
>       7779 =C2=B1  2%     -25.1%       5827 =C2=B1  4%  interrupts.CPU153=
.TLB:TLB_shoo
> tdowns
>      10542           -20.9%       8340        interrupts.CPU154.CAL:Funct=
ion
> _call_interrupts
>       1340 =C2=B1  7%     -35.3%     867.67 =C2=B1  3%  interrupts.CPU154=
.RES:Reschedu
> ling_interrupts
>       7916 =C2=B1  3%     -28.6%       5654 =C2=B1  4%  interrupts.CPU154=
.TLB:TLB_shoo
> tdowns
>      10441           -17.4%       8619 =C2=B1  2%  interrupts.CPU155.CAL:=
Function
> _call_interrupts
>       1280 =C2=B1  3%     -31.5%     877.00 =C2=B1  5%  interrupts.CPU155=
.RES:Reschedu
> ling_interrupts
>       7861           -29.1%       5573 =C2=B1  2%  interrupts.CPU155.TLB:=
TLB_shoo
> tdowns
>      10602           -20.0%       8482 =C2=B1  2%  interrupts.CPU156.CAL:=
Function
> _call_interrupts
>       1278 =C2=B1  4%     -30.7%     886.33 =C2=B1  3%  interrupts.CPU156=
.RES:Reschedu
> ling_interrupts
>       8305 =C2=B1  2%     -32.2%       5629 =C2=B1  3%  interrupts.CPU156=
.TLB:TLB_shoo
> tdowns
>      10580           -20.7%       8393        interrupts.CPU157.CAL:Funct=
ion
> _call_interrupts
>       1317           -34.0%     869.00 =C2=B1  2%  interrupts.CPU157.RES:=
Reschedu
> ling_interrupts
>       8121 =C2=B1  3%     -30.7%       5631 =C2=B1  2%  interrupts.CPU157=
.TLB:TLB_shoo
> tdowns
>      10715           -21.5%       8417 =C2=B1  4%  interrupts.CPU158.CAL:=
Function
> _call_interrupts
>       1209           -28.7%     862.67 =C2=B1  3%  interrupts.CPU158.RES:=
Reschedu
> ling_interrupts
>       8074           -29.9%       5657 =C2=B1  2%  interrupts.CPU158.TLB:=
TLB_shoo
> tdowns
>      10861 =C2=B1  7%     -22.3%       8435        interrupts.CPU159.CAL:=
Function
> _call_interrupts
>       1196 =C2=B1  3%     -24.5%     903.00 =C2=B1  3%  interrupts.CPU159=
.RES:Reschedu
> ling_interrupts
>       7868 =C2=B1  2%     -27.2%       5728 =C2=B1  3%  interrupts.CPU159=
.TLB:TLB_shoo
> tdowns
>      10241           -14.9%       8716        interrupts.CPU16.CAL:Functi=
on_
> call_interrupts
>       2604           -48.5%       1340        interrupts.CPU16.NMI:Non-ma=
ska
> ble_interrupts
>       2604           -48.5%       1340        interrupts.CPU16.PMI:Perfor=
man
> ce_monitoring_interrupts
>       1419           -33.0%     950.33 =C2=B1  3%  interrupts.CPU16.RES:R=
eschedul
> ing_interrupts
>       8121           -27.9%       5853        interrupts.CPU16.TLB:TLB_sh=
oot
> downs
>      10502           -21.0%       8296 =C2=B1  2%  interrupts.CPU160.CAL:=
Function
> _call_interrupts
>       2761 =C2=B1 77%     -68.5%     869.33 =C2=B1  3%  interrupts.CPU160=
.RES:Reschedu
> ling_interrupts
>       7976           -31.2%       5489 =C2=B1  2%  interrupts.CPU160.TLB:=
TLB_shoo
> tdowns
>      10351           -17.4%       8549 =C2=B1  2%  interrupts.CPU161.CAL:=
Function
> _call_interrupts
>       2611 =C2=B1 69%     -67.3%     854.00 =C2=B1  6%  interrupts.CPU161=
.RES:Reschedu
> ling_interrupts
>       7801           -27.2%       5676 =C2=B1  4%  interrupts.CPU161.TLB:=
TLB_shoo
> tdowns
>      10390 =C2=B1  2%     -19.1%       8408 =C2=B1  2%  interrupts.CPU162=
.CAL:Function
> _call_interrupts
>       2697 =C2=B1 74%     -67.4%     879.00 =C2=B1  2%  interrupts.CPU162=
.RES:Reschedu
> ling_interrupts
>       7949           -28.9%       5650 =C2=B1  2%  interrupts.CPU162.TLB:=
TLB_shoo
> tdowns
>      10360 =C2=B1  2%     -16.2%       8681 =C2=B1  2%  interrupts.CPU163=
.CAL:Function
> _call_interrupts
>       2821 =C2=B1 76%     -69.0%     873.67        interrupts.CPU163.RES:=
Reschedu
> ling_interrupts
>       7954 =C2=B1  2%     -27.2%       5792 =C2=B1  4%  interrupts.CPU163=
.TLB:TLB_shoo
> tdowns
>      10402           -18.1%       8521        interrupts.CPU164.CAL:Funct=
ion
> _call_interrupts
>       2876 =C2=B1 80%     -69.4%     881.33 =C2=B1  4%  interrupts.CPU164=
.RES:Reschedu
> ling_interrupts
>       8028           -27.7%       5801        interrupts.CPU164.TLB:TLB_s=
hoo
> tdowns
>      10701           -20.5%       8503 =C2=B1  2%  interrupts.CPU165.CAL:=
Function
> _call_interrupts
>       2684 =C2=B1 71%     -68.4%     849.33        interrupts.CPU165.RES:=
Reschedu
> ling_interrupts
>       8023           -28.8%       5714 =C2=B1  3%  interrupts.CPU165.TLB:=
TLB_shoo
> tdowns
>      10435           -20.2%       8332 =C2=B1  3%  interrupts.CPU166.CAL:=
Function
> _call_interrupts
>       2351 =C2=B1 66%     -63.8%     850.67 =C2=B1  6%  interrupts.CPU166=
.RES:Reschedu
> ling_interrupts
>       7994           -30.0%       5599 =C2=B1  4%  interrupts.CPU166.TLB:=
TLB_shoo
> tdowns
>      10797 =C2=B1  6%     -24.2%       8188 =C2=B1  5%  interrupts.CPU167=
.CAL:Function
> _call_interrupts
>       2753 =C2=B1 79%     -68.3%     873.00        interrupts.CPU167.RES:=
Reschedu
> ling_interrupts
>       7829           -29.3%       5534 =C2=B1  4%  interrupts.CPU167.TLB:=
TLB_shoo
> tdowns
>      11021 =C2=B1  2%     -21.2%       8690        interrupts.CPU168.CAL:=
Function
> _call_interrupts
>       8483           -32.1%       5756        interrupts.CPU168.TLB:TLB_s=
hoo
> tdowns
>      10510           -19.3%       8482        interrupts.CPU169.CAL:Funct=
ion
> _call_interrupts
>       1283           -20.9%       1015 =C2=B1 16%  interrupts.CPU169.RES:=
Reschedu
> ling_interrupts
>       8036           -29.0%       5702 =C2=B1  4%  interrupts.CPU169.TLB:=
TLB_shoo
> tdowns
>      10346           -16.8%       8611        interrupts.CPU17.CAL:Functi=
on_
> call_interrupts
>       1422 =C2=B1  2%     -30.8%     985.00 =C2=B1  5%  interrupts.CPU17.=
RES:Reschedul
> ing_interrupts
>       8005 =C2=B1  2%     -26.5%       5881        interrupts.CPU17.TLB:T=
LB_shoot
> downs
>      10665           -18.5%       8696 =C2=B1  2%  interrupts.CPU170.CAL:=
Function
> _call_interrupts
>       7930 =C2=B1  2%     -27.5%       5750 =C2=B1  3%  interrupts.CPU170=
.TLB:TLB_shoo
> tdowns
>      10671 =C2=B1  2%     -19.6%       8574 =C2=B1  2%  interrupts.CPU171=
.CAL:Function
> _call_interrupts
>       7993 =C2=B1  3%     -28.0%       5755        interrupts.CPU171.TLB:=
TLB_shoo
> tdowns
>      10669           -18.2%       8731        interrupts.CPU172.CAL:Funct=
ion
> _call_interrupts
>       7976           -26.8%       5839 =C2=B1  3%  interrupts.CPU172.TLB:=
TLB_shoo
> tdowns
>      10623           -19.5%       8550 =C2=B1  2%  interrupts.CPU173.CAL:=
Function
> _call_interrupts
>       8135 =C2=B1  3%     -30.7%       5639 =C2=B1  3%  interrupts.CPU173=
.TLB:TLB_shoo
> tdowns
>      10833 =C2=B1  2%     -20.9%       8570        interrupts.CPU174.CAL:=
Function
> _call_interrupts
>       7872           -28.1%       5663        interrupts.CPU174.TLB:TLB_s=
hoo
> tdowns
>      10788           -20.3%       8594        interrupts.CPU175.CAL:Funct=
ion
> _call_interrupts
>       7914 =C2=B1  2%     -28.8%       5637 =C2=B1  2%  interrupts.CPU175=
.TLB:TLB_shoo
> tdowns
>      10870           -20.6%       8636        interrupts.CPU176.CAL:Funct=
ion
> _call_interrupts
>       1280           -31.3%     879.67 =C2=B1  3%  interrupts.CPU176.RES:=
Reschedu
> ling_interrupts
>       8256           -29.9%       5789 =C2=B1  4%  interrupts.CPU176.TLB:=
TLB_shoo
> tdowns
>      11145 =C2=B1  4%     -22.4%       8653        interrupts.CPU177.CAL:=
Function
> _call_interrupts
>       1311 =C2=B1  2%     -33.9%     866.33 =C2=B1  4%  interrupts.CPU177=
.RES:Reschedu
> ling_interrupts
>       8034           -28.0%       5787        interrupts.CPU177.TLB:TLB_s=
hoo
> tdowns
>      10517           -17.9%       8635 =C2=B1  4%  interrupts.CPU178.CAL:=
Function
> _call_interrupts
>       1271 =C2=B1  5%     -31.4%     871.67 =C2=B1  3%  interrupts.CPU178=
.RES:Reschedu
> ling_interrupts
>       8051           -28.4%       5764 =C2=B1  2%  interrupts.CPU178.TLB:=
TLB_shoo
> tdowns
>      10760 =C2=B1  2%     -16.4%       8993 =C2=B1  8%  interrupts.CPU179=
.CAL:Function
> _call_interrupts
>       1251 =C2=B1  4%     -30.1%     875.33 =C2=B1  2%  interrupts.CPU179=
.RES:Reschedu
> ling_interrupts
>       8067 =C2=B1  2%     -30.1%       5639        interrupts.CPU179.TLB:=
TLB_shoo
> tdowns
>      10449           -21.5%       8205 =C2=B1  2%  interrupts.CPU18.CAL:F=
unction_
> call_interrupts
>       1364           -32.0%     928.33        interrupts.CPU18.RES:Resche=
dul
> ing_interrupts
>       8399           -32.1%       5707 =C2=B1  3%  interrupts.CPU18.TLB:T=
LB_shoot
> downs
>      10778           -19.1%       8724 =C2=B1  3%  interrupts.CPU180.CAL:=
Function
> _call_interrupts
>       1286 =C2=B1  6%     -30.1%     899.67 =C2=B1  2%  interrupts.CPU180=
.RES:Reschedu
> ling_interrupts
>       7986           -28.5%       5706 =C2=B1  2%  interrupts.CPU180.TLB:=
TLB_shoo
> tdowns
>      10743           -19.0%       8698 =C2=B1  2%  interrupts.CPU181.CAL:=
Function
> _call_interrupts
>       1293 =C2=B1  3%     -31.5%     885.33 =C2=B1  2%  interrupts.CPU181=
.RES:Reschedu
> ling_interrupts
>       8027           -27.4%       5829        interrupts.CPU181.TLB:TLB_s=
hoo
> tdowns
>      10721 =C2=B1  2%     -18.2%       8765        interrupts.CPU182.CAL:=
Function
> _call_interrupts
>       1240 =C2=B1  6%     -29.8%     870.33        interrupts.CPU182.RES:=
Reschedu
> ling_interrupts
>       7931 =C2=B1  4%     -27.4%       5760 =C2=B1  3%  interrupts.CPU182=
.TLB:TLB_shoo
> tdowns
>      10363           -18.0%       8500        interrupts.CPU183.CAL:Funct=
ion
> _call_interrupts
>       1209 =C2=B1  3%     -27.9%     872.00        interrupts.CPU183.RES:=
Reschedu
> ling_interrupts
>       7962 =C2=B1  2%     -28.9%       5660 =C2=B1  4%  interrupts.CPU183=
.TLB:TLB_shoo
> tdowns
>      10645           -18.7%       8658        interrupts.CPU184.CAL:Funct=
ion
> _call_interrupts
>       1301 =C2=B1  3%     -31.1%     896.33        interrupts.CPU184.RES:=
Reschedu
> ling_interrupts
>       8232           -28.4%       5894        interrupts.CPU184.TLB:TLB_s=
hoo
> tdowns
>      10622           -18.4%       8665        interrupts.CPU185.CAL:Funct=
ion
> _call_interrupts
>       1244 =C2=B1  5%     -29.1%     882.67 =C2=B1  4%  interrupts.CPU185=
.RES:Reschedu
> ling_interrupts
>       8096           -27.9%       5839 =C2=B1  2%  interrupts.CPU185.TLB:=
TLB_shoo
> tdowns
>      10446           -18.6%       8504        interrupts.CPU186.CAL:Funct=
ion
> _call_interrupts
>       1277 =C2=B1  2%     -30.7%     886.00        interrupts.CPU186.RES:=
Reschedu
> ling_interrupts
>       7963 =C2=B1  2%     -27.8%       5749        interrupts.CPU186.TLB:=
TLB_shoo
> tdowns
>      10694           -18.6%       8704 =C2=B1  2%  interrupts.CPU187.CAL:=
Function
> _call_interrupts
>       1239 =C2=B1  2%     -30.2%     865.33 =C2=B1  5%  interrupts.CPU187=
.RES:Reschedu
> ling_interrupts
>       7869           -26.6%       5773 =C2=B1  3%  interrupts.CPU187.TLB:=
TLB_shoo
> tdowns
>      10412           -17.0%       8642 =C2=B1  2%  interrupts.CPU188.CAL:=
Function
> _call_interrupts
>       1287 =C2=B1  4%     -30.4%     896.00 =C2=B1  2%  interrupts.CPU188=
.RES:Reschedu
> ling_interrupts
>       7855 =C2=B1  2%     -26.0%       5811 =C2=B1  2%  interrupts.CPU188=
.TLB:TLB_shoo
> tdowns
>      10888 =C2=B1  2%     -19.7%       8739        interrupts.CPU189.CAL:=
Function
> _call_interrupts
>       1286 =C2=B1  2%     -30.8%     890.00        interrupts.CPU189.RES:=
Reschedu
> ling_interrupts
>       8362           -30.6%       5806 =C2=B1  2%  interrupts.CPU189.TLB:=
TLB_shoo
> tdowns
>      10503           -17.7%       8640        interrupts.CPU19.CAL:Functi=
on_
> call_interrupts
>       1271 =C2=B1  3%     -25.9%     942.00 =C2=B1  2%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>       8093           -28.9%       5754        interrupts.CPU19.TLB:TLB_sh=
oot
> downs
>      10648           -19.0%       8628        interrupts.CPU190.CAL:Funct=
ion
> _call_interrupts
>       1265 =C2=B1  6%     -33.5%     840.67 =C2=B1  4%  interrupts.CPU190=
.RES:Reschedu
> ling_interrupts
>       7952 =C2=B1  2%     -27.2%       5786 =C2=B1  3%  interrupts.CPU190=
.TLB:TLB_shoo
> tdowns
>      10405           -17.7%       8564        interrupts.CPU191.CAL:Funct=
ion
> _call_interrupts
>       1283 =C2=B1  3%     -31.6%     878.33        interrupts.CPU191.RES:=
Reschedu
> ling_interrupts
>       7730           -25.4%       5769 =C2=B1  3%  interrupts.CPU191.TLB:=
TLB_shoo
> tdowns
>      11667 =C2=B1  3%     -22.6%       9035        interrupts.CPU2.CAL:Fu=
nction_c
> all_interrupts
>       1314 =C2=B1  2%     -26.9%     960.67 =C2=B1  3%  interrupts.CPU2.R=
ES:Rescheduli
> ng_interrupts
>       9029 =C2=B1  2%     -31.6%       6172 =C2=B1  2%  interrupts.CPU2.T=
LB:TLB_shootd
> owns
>      10284           -17.2%       8514        interrupts.CPU20.CAL:Functi=
on_
> call_interrupts
>       1400           -32.2%     949.33 =C2=B1  2%  interrupts.CPU20.RES:R=
eschedul
> ing_interrupts
>       8132           -28.2%       5842        interrupts.CPU20.TLB:TLB_sh=
oot
> downs
>      10322           -17.2%       8545        interrupts.CPU21.CAL:Functi=
on_
> call_interrupts
>       1375 =C2=B1  3%     -33.6%     913.67 =C2=B1  3%  interrupts.CPU21.=
RES:Reschedul
> ing_interrupts
>       8055           -28.3%       5775 =C2=B1  3%  interrupts.CPU21.TLB:T=
LB_shoot
> downs
>      10455           -20.8%       8279 =C2=B1  2%  interrupts.CPU22.CAL:F=
unction_
> call_interrupts
>       1384 =C2=B1  2%     -31.9%     942.33 =C2=B1  4%  interrupts.CPU22.=
RES:Reschedul
> ing_interrupts
>       8226           -30.8%       5689 =C2=B1  3%  interrupts.CPU22.TLB:T=
LB_shoot
> downs
>      10508 =C2=B1  3%     -19.5%       8460        interrupts.CPU23.CAL:F=
unction_
> call_interrupts
>       1371           -30.0%     960.33        interrupts.CPU23.RES:Resche=
dul
> ing_interrupts
>       8456 =C2=B1  2%     -32.6%       5702 =C2=B1  2%  interrupts.CPU23.=
TLB:TLB_shoot
> downs
>      13774 =C2=B1  2%     -24.6%      10389        interrupts.CPU24.CAL:F=
unction_
> call_interrupts
>       1484 =C2=B1  6%     -33.8%     982.00 =C2=B1  5%  interrupts.CPU24.=
RES:Reschedul
> ing_interrupts
>      11322 =C2=B1  3%     -31.1%       7801        interrupts.CPU24.TLB:T=
LB_shoot
> downs
>      11680           -18.4%       9526 =C2=B1  5%  interrupts.CPU25.CAL:F=
unction_
> call_interrupts
>       1302 =C2=B1  5%     -30.0%     911.00 =C2=B1  3%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>       9334           -29.8%       6555        interrupts.CPU25.TLB:TLB_sh=
oot
> downs
>      10762 =C2=B1  2%     -19.0%       8716        interrupts.CPU26.CAL:F=
unction_
> call_interrupts
>       1289 =C2=B1  5%     -25.4%     961.00 =C2=B1  5%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>       8470           -31.2%       5824 =C2=B1  2%  interrupts.CPU26.TLB:T=
LB_shoot
> downs
>      10556           -20.7%       8372 =C2=B1  2%  interrupts.CPU27.CAL:F=
unction_
> call_interrupts
>       1291 =C2=B1  4%     -29.5%     910.00 =C2=B1  5%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>       8325           -31.2%       5726 =C2=B1  2%  interrupts.CPU27.TLB:T=
LB_shoot
> downs
>      10689           -20.3%       8517        interrupts.CPU28.CAL:Functi=
on_
> call_interrupts
>       1272 =C2=B1  2%     -29.9%     892.00 =C2=B1  6%  interrupts.CPU28.=
RES:Reschedul
> ing_interrupts
>       8461           -30.8%       5851 =C2=B1  2%  interrupts.CPU28.TLB:T=
LB_shoot
> downs
>      10218 =C2=B1  2%     -18.7%       8310        interrupts.CPU29.CAL:F=
unction_
> call_interrupts
>       1351 =C2=B1  2%     -31.7%     923.00 =C2=B1  2%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>       8071 =C2=B1  2%     -30.7%       5596        interrupts.CPU29.TLB:T=
LB_shoot
> downs
>      10919           -19.8%       8753 =C2=B1  2%  interrupts.CPU3.CAL:Fu=
nction_c
> all_interrupts
>       1273 =C2=B1  2%     -27.2%     927.00        interrupts.CPU3.RES:Re=
scheduli
> ng_interrupts
>       8599           -28.9%       6113 =C2=B1  3%  interrupts.CPU3.TLB:TL=
B_shootd
> owns
>      10294           -19.9%       8249        interrupts.CPU30.CAL:Functi=
on_
> call_interrupts
>       1278 =C2=B1  6%     -31.6%     874.33 =C2=B1  4%  interrupts.CPU30.=
RES:Reschedul
> ing_interrupts
>       8175           -31.6%       5595        interrupts.CPU30.TLB:TLB_sh=
oot
> downs
>      10256           -19.1%       8302        interrupts.CPU31.CAL:Functi=
on_
> call_interrupts
>       1364           -29.7%     958.33 =C2=B1  5%  interrupts.CPU31.RES:R=
eschedul
> ing_interrupts
>       8166 =C2=B1  2%     -29.7%       5743        interrupts.CPU31.TLB:T=
LB_shoot
> downs
>      10255           -17.0%       8508 =C2=B1  7%  interrupts.CPU32.CAL:F=
unction_
> call_interrupts
>       2776 =C2=B1 74%     -63.1%       1025 =C2=B1 18%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>       7972           -31.7%       5445 =C2=B1  2%  interrupts.CPU32.TLB:T=
LB_shoot
> downs
>      10463           -21.6%       8207 =C2=B1  2%  interrupts.CPU33.CAL:F=
unction_
> call_interrupts
>       2948 =C2=B1 77%     -69.6%     896.67 =C2=B1  7%  interrupts.CPU33.=
RES:Reschedul
> ing_interrupts
>       8058           -29.7%       5668 =C2=B1  2%  interrupts.CPU33.TLB:T=
LB_shoot
> downs
>      10401 =C2=B1  2%     -19.2%       8401        interrupts.CPU34.CAL:F=
unction_
> call_interrupts
>       1707 =C2=B1 35%     +54.9%       2645        interrupts.CPU34.NMI:N=
on-maska
> ble_interrupts
>       1707 =C2=B1 35%     +54.9%       2645        interrupts.CPU34.PMI:P=
erforman
> ce_monitoring_interrupts
>       2654 =C2=B1 75%     -66.4%     892.00 =C2=B1  5%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>       8035 =C2=B1  2%     -28.3%       5758 =C2=B1  3%  interrupts.CPU34.=
TLB:TLB_shoot
> downs
>      10441 =C2=B1  2%     -19.7%       8386        interrupts.CPU35.CAL:F=
unction_
> call_interrupts
>       1726 =C2=B1 35%     +50.3%       2595 =C2=B1  2%  interrupts.CPU35.=
NMI:Non-maska
> ble_interrupts
>       1726 =C2=B1 35%     +50.3%       2595 =C2=B1  2%  interrupts.CPU35.=
PMI:Performan
> ce_monitoring_interrupts
>       2967 =C2=B1 80%     -68.7%     928.00 =C2=B1  3%  interrupts.CPU35.=
RES:Reschedul
> ing_interrupts
>       8203 =C2=B1  3%     -31.3%       5635        interrupts.CPU35.TLB:T=
LB_shoot
> downs
>      10338 =C2=B1  2%     -19.7%       8300        interrupts.CPU36.CAL:F=
unction_
> call_interrupts
>       1739 =C2=B1 35%     +50.9%       2624 =C2=B1  2%  interrupts.CPU36.=
NMI:Non-maska
> ble_interrupts
>       1739 =C2=B1 35%     +50.9%       2624 =C2=B1  2%  interrupts.CPU36.=
PMI:Performan
> ce_monitoring_interrupts
>       2648 =C2=B1 69%     -65.9%     904.00        interrupts.CPU36.RES:R=
eschedul
> ing_interrupts
>       8152 =C2=B1  2%     -29.7%       5731        interrupts.CPU36.TLB:T=
LB_shoot
> downs
>      10605 =C2=B1  2%     -21.6%       8312 =C2=B1  2%  interrupts.CPU37.=
CAL:Function_
> call_interrupts
>       2673 =C2=B1 75%     -66.0%     908.67 =C2=B1  4%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>       8162 =C2=B1  2%     -29.1%       5785 =C2=B1  2%  interrupts.CPU37.=
TLB:TLB_shoot
> downs
>      10342 =C2=B1  2%     -17.6%       8522        interrupts.CPU38.CAL:F=
unction_
> call_interrupts
>       2340 =C2=B1 64%     -61.3%     906.00 =C2=B1  6%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>       7972           -27.7%       5761 =C2=B1  6%  interrupts.CPU38.TLB:T=
LB_shoot
> downs
>      10088           -19.3%       8145 =C2=B1  2%  interrupts.CPU39.CAL:F=
unction_
> call_interrupts
>       1739 =C2=B1 35%     +51.2%       2629        interrupts.CPU39.NMI:N=
on-maska
> ble_interrupts
>       1739 =C2=B1 35%     +51.2%       2629        interrupts.CPU39.PMI:P=
erforman
> ce_monitoring_interrupts
>       2661 =C2=B1 75%     -66.7%     887.00 =C2=B1  7%  interrupts.CPU39.=
RES:Reschedul
> ing_interrupts
>       8007           -30.3%       5584 =C2=B1  3%  interrupts.CPU39.TLB:T=
LB_shoot
> downs
>      10739           -21.1%       8476        interrupts.CPU4.CAL:Functio=
n_c
> all_interrupts
>       1372           -30.8%     949.00 =C2=B1  5%  interrupts.CPU4.RES:Re=
scheduli
> ng_interrupts
>       8247           -27.0%       6020 =C2=B1  2%  interrupts.CPU4.TLB:TL=
B_shootd
> owns
>      10133           -17.5%       8354        interrupts.CPU40.CAL:Functi=
on_
> call_interrupts
>       1721 =C2=B1 35%     +53.7%       2647        interrupts.CPU40.NMI:N=
on-maska
> ble_interrupts
>       1721 =C2=B1 35%     +53.7%       2647        interrupts.CPU40.PMI:P=
erforman
> ce_monitoring_interrupts
>       2769 =C2=B1 77%     -66.8%     918.67 =C2=B1  4%  interrupts.CPU40.=
RES:Reschedul
> ing_interrupts
>       7999           -29.6%       5627 =C2=B1  2%  interrupts.CPU40.TLB:T=
LB_shoot
> downs
>      10133           -18.4%       8268 =C2=B1  2%  interrupts.CPU41.CAL:F=
unction_
> call_interrupts
>       1738 =C2=B1 34%     +50.1%       2609 =C2=B1  2%  interrupts.CPU41.=
NMI:Non-maska
> ble_interrupts
>       1738 =C2=B1 34%     +50.1%       2609 =C2=B1  2%  interrupts.CPU41.=
PMI:Performan
> ce_monitoring_interrupts
>       2958 =C2=B1 74%     -68.9%     919.33 =C2=B1  4%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>       7943           -29.0%       5637        interrupts.CPU41.TLB:TLB_sh=
oot
> downs
>      10207           -17.5%       8422        interrupts.CPU42.CAL:Functi=
on_
> call_interrupts
>       3054 =C2=B1 77%     -70.8%     893.00 =C2=B1  8%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>       7965           -27.0%       5812 =C2=B1  5%  interrupts.CPU42.TLB:T=
LB_shoot
> downs
>      10078           -16.0%       8462        interrupts.CPU43.CAL:Functi=
on_
> call_interrupts
>       1727 =C2=B1 35%     +52.4%       2632 =C2=B1  2%  interrupts.CPU43.=
NMI:Non-maska
> ble_interrupts
>       1727 =C2=B1 35%     +52.4%       2632 =C2=B1  2%  interrupts.CPU43.=
PMI:Performan
> ce_monitoring_interrupts
>       3014 =C2=B1 77%     -66.2%       1019 =C2=B1  3%  interrupts.CPU43.=
RES:Reschedul
> ing_interrupts
>       7944 =C2=B1  2%     -28.1%       5714 =C2=B1  5%  interrupts.CPU43.=
TLB:TLB_shoot
> downs
>      10193           -18.5%       8304 =C2=B1  2%  interrupts.CPU44.CAL:F=
unction_
> call_interrupts
>       2947 =C2=B1 78%     -69.7%     893.33 =C2=B1  6%  interrupts.CPU44.=
RES:Reschedul
> ing_interrupts
>       8010 =C2=B1  3%     -28.6%       5718 =C2=B1  4%  interrupts.CPU44.=
TLB:TLB_shoot
> downs
>      10275           -18.5%       8374 =C2=B1  2%  interrupts.CPU45.CAL:F=
unction_
> call_interrupts
>       2790 =C2=B1 75%     -67.9%     896.00 =C2=B1  2%  interrupts.CPU45.=
RES:Reschedul
> ing_interrupts
>       8028           -28.4%       5746 =C2=B1  3%  interrupts.CPU45.TLB:T=
LB_shoot
> downs
>      10303           -20.7%       8174        interrupts.CPU46.CAL:Functi=
on_
> call_interrupts
>       2978 =C2=B1 78%     -70.0%     894.33 =C2=B1  6%  interrupts.CPU46.=
RES:Reschedul
> ing_interrupts
>       8159           -30.9%       5634 =C2=B1  4%  interrupts.CPU46.TLB:T=
LB_shoot
> downs
>      10132 =C2=B1  2%     -19.4%       8164        interrupts.CPU47.CAL:F=
unction_
> call_interrupts
>       2872 =C2=B1 75%     -68.2%     913.00 =C2=B1  9%  interrupts.CPU47.=
RES:Reschedul
> ing_interrupts
>       7945           -28.6%       5669 =C2=B1  2%  interrupts.CPU47.TLB:T=
LB_shoot
> downs
>      13754 =C2=B1  2%     -25.0%      10316        interrupts.CPU48.CAL:F=
unction_
> call_interrupts
>       1586 =C2=B1  4%     -36.8%       1002 =C2=B1  4%  interrupts.CPU48.=
RES:Reschedul
> ing_interrupts
>      11536 =C2=B1  3%     -34.6%       7545 =C2=B1  2%  interrupts.CPU48.=
TLB:TLB_shoot
> downs
>      11394           -19.6%       9165        interrupts.CPU49.CAL:Functi=
on_
> call_interrupts
>       1715 =C2=B1 34%     +52.3%       2612 =C2=B1  2%  interrupts.CPU49.=
NMI:Non-maska
> ble_interrupts
>       1715 =C2=B1 34%     +52.3%       2612 =C2=B1  2%  interrupts.CPU49.=
PMI:Performan
> ce_monitoring_interrupts
>       1328           -27.7%     960.67 =C2=B1  3%  interrupts.CPU49.RES:R=
eschedul
> ing_interrupts
>       9070           -28.7%       6469        interrupts.CPU49.TLB:TLB_sh=
oot
> downs
>      10511           -19.2%       8492        interrupts.CPU5.CAL:Functio=
n_c
> all_interrupts
>       1325 =C2=B1  3%     -29.2%     937.67 =C2=B1  3%  interrupts.CPU5.R=
ES:Rescheduli
> ng_interrupts
>       8345 =C2=B1  2%     -30.1%       5832 =C2=B1  2%  interrupts.CPU5.T=
LB:TLB_shootd
> owns
>      10942           -21.7%       8570        interrupts.CPU50.CAL:Functi=
on_
> call_interrupts
>       1705 =C2=B1 35%     +54.7%       2637        interrupts.CPU50.NMI:N=
on-maska
> ble_interrupts
>       1705 =C2=B1 35%     +54.7%       2637        interrupts.CPU50.PMI:P=
erforman
> ce_monitoring_interrupts
>       1286 =C2=B1  4%     -29.2%     910.67 =C2=B1  5%  interrupts.CPU50.=
RES:Reschedul
> ing_interrupts
>       8626 =C2=B1  3%     -31.5%       5908 =C2=B1  2%  interrupts.CPU50.=
TLB:TLB_shoot
> downs
>      10425           -18.3%       8515 =C2=B1  2%  interrupts.CPU51.CAL:F=
unction_
> call_interrupts
>       1280 =C2=B1  3%     -29.8%     898.00 =C2=B1  3%  interrupts.CPU51.=
RES:Reschedul
> ing_interrupts
>       8239 =C2=B1  2%     -27.4%       5979 =C2=B1  2%  interrupts.CPU51.=
TLB:TLB_shoot
> downs
>      10520           -22.0%       8205 =C2=B1  2%  interrupts.CPU52.CAL:F=
unction_
> call_interrupts
>       1322 =C2=B1  6%     -29.7%     929.33 =C2=B1  4%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>       8139 =C2=B1  2%     -31.0%       5618 =C2=B1  2%  interrupts.CPU52.=
TLB:TLB_shoot
> downs
>      10288           -19.4%       8294 =C2=B1  2%  interrupts.CPU53.CAL:F=
unction_
> call_interrupts
>       1368 =C2=B1  4%     -34.6%     895.00        interrupts.CPU53.RES:R=
eschedul
> ing_interrupts
>       8181           -28.9%       5815 =C2=B1  4%  interrupts.CPU53.TLB:T=
LB_shoot
> downs
>      10283           -19.6%       8272        interrupts.CPU54.CAL:Functi=
on_
> call_interrupts
>       1335           -30.3%     931.33        interrupts.CPU54.RES:Resche=
dul
> ing_interrupts
>       8021           -29.8%       5633 =C2=B1  6%  interrupts.CPU54.TLB:T=
LB_shoot
> downs
>      10425 =C2=B1  3%     -19.6%       8379 =C2=B1  3%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>       1280 =C2=B1  2%     -26.8%     937.67 =C2=B1  5%  interrupts.CPU55.=
RES:Reschedul
> ing_interrupts
>       8067           -26.5%       5929 =C2=B1  2%  interrupts.CPU55.TLB:T=
LB_shoot
> downs
>      10170           -18.0%       8343        interrupts.CPU56.CAL:Functi=
on_
> call_interrupts
>       1331 =C2=B1  2%     -32.6%     897.67 =C2=B1  3%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>       7881           -27.2%       5735        interrupts.CPU56.TLB:TLB_sh=
oot
> downs
>      10228           -18.6%       8330        interrupts.CPU57.CAL:Functi=
on_
> call_interrupts
>       1344 =C2=B1  3%     -33.6%     892.33 =C2=B1  5%  interrupts.CPU57.=
RES:Reschedul
> ing_interrupts
>       8098           -29.4%       5713        interrupts.CPU57.TLB:TLB_sh=
oot
> downs
>      10154           -19.8%       8148 =C2=B1  3%  interrupts.CPU58.CAL:F=
unction_
> call_interrupts
>       1288 =C2=B1  4%     -29.9%     903.67 =C2=B1  6%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>       7933           -28.9%       5638 =C2=B1  4%  interrupts.CPU58.TLB:T=
LB_shoot
> downs
>      10138           -20.0%       8112 =C2=B1  3%  interrupts.CPU59.CAL:F=
unction_
> call_interrupts
>       1300 =C2=B1  2%     -30.6%     902.33 =C2=B1  3%  interrupts.CPU59.=
RES:Reschedul
> ing_interrupts
>       8035           -29.5%       5662 =C2=B1  3%  interrupts.CPU59.TLB:T=
LB_shoot
> downs
>      10430 =C2=B1  2%     -19.4%       8410        interrupts.CPU6.CAL:Fu=
nction_c
> all_interrupts
>       1347 =C2=B1  4%     -30.4%     938.00 =C2=B1  2%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>       8203 =C2=B1  2%     -29.7%       5763 =C2=B1  2%  interrupts.CPU6.T=
LB:TLB_shootd
> owns
>      10258           -19.6%       8252 =C2=B1  4%  interrupts.CPU60.CAL:F=
unction_
> call_interrupts
>       1290 =C2=B1  5%     -29.4%     911.67 =C2=B1  4%  interrupts.CPU60.=
RES:Reschedul
> ing_interrupts
>       7951           -28.5%       5683 =C2=B1  3%  interrupts.CPU60.TLB:T=
LB_shoot
> downs
>      10472           -21.3%       8237 =C2=B1  2%  interrupts.CPU61.CAL:F=
unction_
> call_interrupts
>       1355 =C2=B1  2%     -31.2%     932.33 =C2=B1  2%  interrupts.CPU61.=
RES:Reschedul
> ing_interrupts
>       7876 =C2=B1  3%     -28.2%       5657 =C2=B1  2%  interrupts.CPU61.=
TLB:TLB_shoot
> downs
>      10262           -18.7%       8344 =C2=B1  2%  interrupts.CPU62.CAL:F=
unction_
> call_interrupts
>       1259           -29.1%     893.67 =C2=B1  2%  interrupts.CPU62.RES:R=
eschedul
> ing_interrupts
>       7922 =C2=B1  2%     -30.1%       5541 =C2=B1  2%  interrupts.CPU62.=
TLB:TLB_shoot
> downs
>      10346           -18.2%       8466 =C2=B1  3%  interrupts.CPU63.CAL:F=
unction_
> call_interrupts
>       1321           -31.4%     906.67 =C2=B1  6%  interrupts.CPU63.RES:R=
eschedul
> ing_interrupts
>       7978 =C2=B1  3%     -27.1%       5817 =C2=B1  2%  interrupts.CPU63.=
TLB:TLB_shoot
> downs
>      10375 =C2=B1  2%     -20.8%       8213        interrupts.CPU64.CAL:F=
unction_
> call_interrupts
>       1332           -32.3%     902.00 =C2=B1  6%  interrupts.CPU64.RES:R=
eschedul
> ing_interrupts
>       7952 =C2=B1  3%     -30.2%       5552 =C2=B1  3%  interrupts.CPU64.=
TLB:TLB_shoot
> downs
>      10245           -17.9%       8407        interrupts.CPU65.CAL:Functi=
on_
> call_interrupts
>       1323           -30.2%     923.00 =C2=B1  2%  interrupts.CPU65.RES:R=
eschedul
> ing_interrupts
>       7744           -25.2%       5795 =C2=B1  4%  interrupts.CPU65.TLB:T=
LB_shoot
> downs
>      10502 =C2=B1  2%     -21.5%       8240        interrupts.CPU66.CAL:F=
unction_
> call_interrupts
>       1275 =C2=B1  2%     -28.0%     918.00 =C2=B1  3%  interrupts.CPU66.=
RES:Reschedul
> ing_interrupts
>       8018 =C2=B1  2%     -30.2%       5598 =C2=B1  3%  interrupts.CPU66.=
TLB:TLB_shoot
> downs
>      10442 =C2=B1  2%     -19.8%       8374        interrupts.CPU67.CAL:F=
unction_
> call_interrupts
>       1174 =C2=B1  2%     -20.3%     936.00 =C2=B1  3%  interrupts.CPU67.=
RES:Reschedul
> ing_interrupts
>       8029 =C2=B1  2%     -29.0%       5703 =C2=B1  3%  interrupts.CPU67.=
TLB:TLB_shoot
> downs
>      10370           -20.0%       8298 =C2=B1  2%  interrupts.CPU68.CAL:F=
unction_
> call_interrupts
>       1241 =C2=B1  5%     -26.5%     912.00 =C2=B1  4%  interrupts.CPU68.=
RES:Reschedul
> ing_interrupts
>       7977 =C2=B1  2%     -27.7%       5764 =C2=B1  2%  interrupts.CPU68.=
TLB:TLB_shoot
> downs
>      10375           -20.2%       8277 =C2=B1  2%  interrupts.CPU69.CAL:F=
unction_
> call_interrupts
>       1298 =C2=B1  4%     -30.4%     904.00 =C2=B1  2%  interrupts.CPU69.=
RES:Reschedul
> ing_interrupts
>       8064           -31.5%       5521 =C2=B1  2%  interrupts.CPU69.TLB:T=
LB_shoot
> downs
>      10412           -18.7%       8462        interrupts.CPU7.CAL:Functio=
n_c
> all_interrupts
>       1728 =C2=B1 35%     +55.6%       2690        interrupts.CPU7.NMI:No=
n-maskab
> le_interrupts
>       1728 =C2=B1 35%     +55.6%       2690        interrupts.CPU7.PMI:Pe=
rformanc
> e_monitoring_interrupts
>       1354 =C2=B1  2%     -32.2%     918.00 =C2=B1  3%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>       8166           -29.8%       5733 =C2=B1  4%  interrupts.CPU7.TLB:TL=
B_shootd
> owns
>      10226           -18.9%       8292 =C2=B1  4%  interrupts.CPU70.CAL:F=
unction_
> call_interrupts
>       1283 =C2=B1  2%     -27.7%     927.33 =C2=B1  5%  interrupts.CPU70.=
RES:Reschedul
> ing_interrupts
>       8032 =C2=B1  3%     -28.9%       5714 =C2=B1  4%  interrupts.CPU70.=
TLB:TLB_shoot
> downs
>      10235 =C2=B1  5%     -20.7%       8117 =C2=B1  4%  interrupts.CPU71.=
CAL:Function_
> call_interrupts
>       2545 =C2=B1  2%     -31.5%       1743 =C2=B1 33%  interrupts.CPU71.=
NMI:Non-maska
> ble_interrupts
>       2545 =C2=B1  2%     -31.5%       1743 =C2=B1 33%  interrupts.CPU71.=
PMI:Performan
> ce_monitoring_interrupts
>       1372 =C2=B1 12%     -36.6%     870.00 =C2=B1  3%  interrupts.CPU71.=
RES:Reschedul
> ing_interrupts
>       7670           -27.6%       5557 =C2=B1  6%  interrupts.CPU71.TLB:T=
LB_shoot
> downs
>      14381 =C2=B1  2%     -26.7%      10546 =C2=B1  2%  interrupts.CPU72.=
CAL:Function_
> call_interrupts
>       1519 =C2=B1  7%     -33.3%       1013 =C2=B1  3%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>      11803           -34.0%       7792 =C2=B1  4%  interrupts.CPU72.TLB:T=
LB_shoot
> downs
>      11634 =C2=B1  3%     -21.5%       9131        interrupts.CPU73.CAL:F=
unction_
> call_interrupts
>       1309           -24.6%     987.00 =C2=B1  3%  interrupts.CPU73.RES:R=
eschedul
> ing_interrupts
>       9489           -32.4%       6417        interrupts.CPU73.TLB:TLB_sh=
oot
> downs
>      11032 =C2=B1  2%     -20.2%       8799        interrupts.CPU74.CAL:F=
unction_
> call_interrupts
>       1188 =C2=B1  2%     -19.4%     957.33 =C2=B1  4%  interrupts.CPU74.=
RES:Reschedul
> ing_interrupts
>       8367           -28.8%       5954 =C2=B1  3%  interrupts.CPU74.TLB:T=
LB_shoot
> downs
>      10629           -19.6%       8550 =C2=B1  2%  interrupts.CPU75.CAL:F=
unction_
> call_interrupts
>       2551           -48.2%       1320        interrupts.CPU75.NMI:Non-ma=
ska
> ble_interrupts
>       2551           -48.2%       1320        interrupts.CPU75.PMI:Perfor=
man
> ce_monitoring_interrupts
>       1131           -18.6%     921.00 =C2=B1  2%  interrupts.CPU75.RES:R=
eschedul
> ing_interrupts
>       8186 =C2=B1  2%     -28.5%       5854 =C2=B1  2%  interrupts.CPU75.=
TLB:TLB_shoot
> downs
>      10521 =C2=B1  2%     -18.1%       8620 =C2=B1  2%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>       1180 =C2=B1  2%     -17.0%     979.67 =C2=B1  2%  interrupts.CPU76.=
RES:Reschedul
> ing_interrupts
>       8131 =C2=B1  2%     -29.8%       5706        interrupts.CPU76.TLB:T=
LB_shoot
> downs
>      10410           -16.6%       8680 =C2=B1  2%  interrupts.CPU77.CAL:F=
unction_
> call_interrupts
>       1186           -20.8%     939.67 =C2=B1  2%  interrupts.CPU77.RES:R=
eschedul
> ing_interrupts
>       8041           -26.8%       5883        interrupts.CPU77.TLB:TLB_sh=
oot
> downs
>      10559           -18.5%       8604        interrupts.CPU78.CAL:Functi=
on_
> call_interrupts
>       1221 =C2=B1  4%     -23.6%     932.67        interrupts.CPU78.RES:R=
eschedul
> ing_interrupts
>       8154           -31.0%       5627        interrupts.CPU78.TLB:TLB_sh=
oot
> downs
>      10497           -17.4%       8668        interrupts.CPU79.CAL:Functi=
on_
> call_interrupts
>       2593           -48.5%       1335        interrupts.CPU79.NMI:Non-ma=
ska
> ble_interrupts
>       2593           -48.5%       1335        interrupts.CPU79.PMI:Perfor=
man
> ce_monitoring_interrupts
>       1192 =C2=B1  4%     -21.1%     940.33 =C2=B1  3%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>       7834 =C2=B1  2%     -26.2%       5781        interrupts.CPU79.TLB:T=
LB_shoot
> downs
>      10429           -17.2%       8637        interrupts.CPU8.CAL:Functio=
n_c
> all_interrupts
>       1278 =C2=B1  5%     -24.2%     969.33 =C2=B1  5%  interrupts.CPU8.R=
ES:Rescheduli
> ng_interrupts
>       8179           -29.6%       5754        interrupts.CPU8.TLB:TLB_sho=
otd
> owns
>      10527           -19.0%       8522        interrupts.CPU80.CAL:Functi=
on_
> call_interrupts
>       1152 =C2=B1  2%     -22.1%     898.33 =C2=B1  2%  interrupts.CPU80.=
RES:Reschedul
> ing_interrupts
>       8218           -31.3%       5644        interrupts.CPU80.TLB:TLB_sh=
oot
> downs
>      10517           -19.9%       8429 =C2=B1  4%  interrupts.CPU81.CAL:F=
unction_
> call_interrupts
>       2588           -49.3%       1311        interrupts.CPU81.NMI:Non-ma=
ska
> ble_interrupts
>       2588           -49.3%       1311        interrupts.CPU81.PMI:Perfor=
man
> ce_monitoring_interrupts
>       1071           -14.9%     912.33 =C2=B1  2%  interrupts.CPU81.RES:R=
eschedul
> ing_interrupts
>       8252           -28.9%       5866        interrupts.CPU81.TLB:TLB_sh=
oot
> downs
>      10345           -18.4%       8446 =C2=B1  2%  interrupts.CPU82.CAL:F=
unction_
> call_interrupts
>       1233 =C2=B1  2%     -26.0%     912.33 =C2=B1  5%  interrupts.CPU82.=
RES:Reschedul
> ing_interrupts
>       7977 =C2=B1  2%     -28.3%       5721 =C2=B1  2%  interrupts.CPU82.=
TLB:TLB_shoot
> downs
>      10409           -19.3%       8400        interrupts.CPU83.CAL:Functi=
on_
> call_interrupts
>       1289 =C2=B1  2%     -28.8%     918.33 =C2=B1  2%  interrupts.CPU83.=
RES:Reschedul
> ing_interrupts
>       8013           -28.9%       5693 =C2=B1  3%  interrupts.CPU83.TLB:T=
LB_shoot
> downs
>      10565           -20.6%       8391 =C2=B1  3%  interrupts.CPU84.CAL:F=
unction_
> call_interrupts
>       2568           -48.9%       1313        interrupts.CPU84.NMI:Non-ma=
ska
> ble_interrupts
>       2568           -48.9%       1313        interrupts.CPU84.PMI:Perfor=
man
> ce_monitoring_interrupts
>       1306 =C2=B1  2%     -26.6%     959.00 =C2=B1  2%  interrupts.CPU84.=
RES:Reschedul
> ing_interrupts
>       7944 =C2=B1  2%     -30.0%       5557        interrupts.CPU84.TLB:T=
LB_shoot
> downs
>      10582 =C2=B1  2%     -20.5%       8414        interrupts.CPU85.CAL:F=
unction_
> call_interrupts
>       2582           -49.6%       1302 =C2=B1  3%  interrupts.CPU85.NMI:N=
on-maska
> ble_interrupts
>       2582           -49.6%       1302 =C2=B1  3%  interrupts.CPU85.PMI:P=
erforman
> ce_monitoring_interrupts
>       1101 =C2=B1  2%     -17.9%     904.33 =C2=B1  3%  interrupts.CPU85.=
RES:Reschedul
> ing_interrupts
>       8098           -31.4%       5558 =C2=B1  3%  interrupts.CPU85.TLB:T=
LB_shoot
> downs
>      10319           -17.2%       8543 =C2=B1  2%  interrupts.CPU86.CAL:F=
unction_
> call_interrupts
>       1046 =C2=B1  2%     -12.3%     918.00 =C2=B1  3%  interrupts.CPU86.=
RES:Reschedul
> ing_interrupts
>       7758           -23.4%       5941 =C2=B1  6%  interrupts.CPU86.TLB:T=
LB_shoot
> downs
>      10443 =C2=B1  2%     -18.4%       8518        interrupts.CPU87.CAL:F=
unction_
> call_interrupts
>       2577           -49.2%       1309 =C2=B1  2%  interrupts.CPU87.NMI:N=
on-maska
> ble_interrupts
>       2577           -49.2%       1309 =C2=B1  2%  interrupts.CPU87.PMI:P=
erforman
> ce_monitoring_interrupts
>       1125 =C2=B1  8%     -17.2%     932.33        interrupts.CPU87.RES:R=
eschedul
> ing_interrupts
>       8143 =C2=B1  3%     -28.5%       5823        interrupts.CPU87.TLB:T=
LB_shoot
> downs
>      10436           -18.9%       8463        interrupts.CPU88.CAL:Functi=
on_
> call_interrupts
>       1040 =C2=B1  4%     -10.4%     932.33 =C2=B1  2%  interrupts.CPU88.=
RES:Reschedul
> ing_interrupts
>       8055           -30.6%       5588        interrupts.CPU88.TLB:TLB_sh=
oot
> downs
>      10344           -17.7%       8511        interrupts.CPU89.CAL:Functi=
on_
> call_interrupts
>       1056 =C2=B1  3%     -14.5%     903.00        interrupts.CPU89.RES:R=
eschedul
> ing_interrupts
>       7669           -24.7%       5778 =C2=B1  2%  interrupts.CPU89.TLB:T=
LB_shoot
> downs
>      10248 =C2=B1  2%     -18.1%       8390        interrupts.CPU9.CAL:Fu=
nction_c
> all_interrupts
>       1318 =C2=B1  2%     -30.5%     916.33        interrupts.CPU9.RES:Re=
scheduli
> ng_interrupts
>       8130           -30.0%       5688 =C2=B1  2%  interrupts.CPU9.TLB:TL=
B_shootd
> owns
>      10383           -19.4%       8373        interrupts.CPU90.CAL:Functi=
on_
> call_interrupts
>       7973 =C2=B1  2%     -29.4%       5631        interrupts.CPU90.TLB:T=
LB_shoot
> downs
>      10427 =C2=B1  2%     -19.4%       8408 =C2=B1  2%  interrupts.CPU91.=
CAL:Function_
> call_interrupts
>       1070 =C2=B1  3%     -12.4%     937.67 =C2=B1  3%  interrupts.CPU91.=
RES:Reschedul
> ing_interrupts
>       8107           -29.4%       5721        interrupts.CPU91.TLB:TLB_sh=
oot
> downs
>      10513           -20.1%       8397        interrupts.CPU92.CAL:Functi=
on_
> call_interrupts
>       1067           -14.6%     911.00 =C2=B1  2%  interrupts.CPU92.RES:R=
eschedul
> ing_interrupts
>       7991 =C2=B1  2%     -29.5%       5635        interrupts.CPU92.TLB:T=
LB_shoot
> downs
>      10486           -20.0%       8385 =C2=B1  2%  interrupts.CPU93.CAL:F=
unction_
> call_interrupts
>       1078           -12.9%     939.33 =C2=B1  7%  interrupts.CPU93.RES:R=
eschedul
> ing_interrupts
>       7961 =C2=B1  2%     -29.2%       5636        interrupts.CPU93.TLB:T=
LB_shoot
> downs
>      10281           -17.0%       8529 =C2=B1  2%  interrupts.CPU94.CAL:F=
unction_
> call_interrupts
>       1081           -17.5%     892.33 =C2=B1  2%  interrupts.CPU94.RES:R=
eschedul
> ing_interrupts
>       7895           -26.5%       5805 =C2=B1  3%  interrupts.CPU94.TLB:T=
LB_shoot
> downs
>      10368           -17.7%       8533        interrupts.CPU95.CAL:Functi=
on_
> call_interrupts
>       1704 =C2=B1 33%     +54.4%       2631        interrupts.CPU95.NMI:N=
on-maska
> ble_interrupts
>       1704 =C2=B1 33%     +54.4%       2631        interrupts.CPU95.PMI:P=
erforman
> ce_monitoring_interrupts
>       1043 =C2=B1  6%     -10.8%     930.00 =C2=B1  5%  interrupts.CPU95.=
RES:Reschedul
> ing_interrupts
>       8112           -29.0%       5757 =C2=B1  2%  interrupts.CPU95.TLB:T=
LB_shoot
> downs
>      11127           -20.8%       8813        interrupts.CPU96.CAL:Functi=
on_
> call_interrupts
>       8358 =C2=B1  3%     -31.1%       5761        interrupts.CPU96.TLB:T=
LB_shoot
> downs
>      11140           -16.6%       9286 =C2=B1  8%  interrupts.CPU97.CAL:F=
unction_
> call_interrupts
>       2500 =C2=B1 68%     -55.9%       1102 =C2=B1 12%  interrupts.CPU97.=
RES:Reschedul
> ing_interrupts
>       8439 =C2=B1  4%     -31.2%       5808 =C2=B1  2%  interrupts.CPU97.=
TLB:TLB_shoot
> downs
>      10720           -17.5%       8847 =C2=B1  2%  interrupts.CPU98.CAL:F=
unction_
> call_interrupts
>       8317           -29.1%       5896        interrupts.CPU98.TLB:TLB_sh=
oot
> downs
>      10520           -17.7%       8660 =C2=B1  2%  interrupts.CPU99.CAL:F=
unction_
> call_interrupts
>       8253           -32.6%       5561 =C2=B1  2%  interrupts.CPU99.TLB:T=
LB_shoot
> downs
>     317838 =C2=B1  9%     -44.1%     177647        interrupts.RES:Resched=
uling_in
> terrupts
>    1572415           -29.3%    1111067        interrupts.TLB:TLB_shootdow=
ns
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2sp9: 88 threads Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz with 1=
28G
>  memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
tes
> tcase/ucode:
>   gcc-9/performance/4BRD_12G/xfs/x86_64-rhel-8.3/3000/RAID0/debian-10.4-x=
86_
> 64-20200603.cgz/lkp-csl-2sp9/disk_src/aim7/0x5003006
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     109970            -1.8%     108016        aim7.jobs-per-min
>     163.98            +1.8%     166.93        aim7.time.elapsed_time
>     163.98            +1.8%     166.93        aim7.time.elapsed_time.max
>       1612 =C2=B1  4%     -24.6%       1214 =C2=B1  7%  aim7.time.involun=
tary_context_
> switches
>       1033            +2.4%       1058        aim7.time.system_time
>      28.69            -5.1%      27.23        aim7.time.user_time
>     105896 =C2=B1  5%     +10.8%     117341 =C2=B1  4%  meminfo.PageTables
>     432832 =C2=B1 21%     -21.0%     341856 =C2=B1  7%  numa-numastat.nod=
e0.local_node
>       8.67 =C2=B1 23%    +150.0%      21.67 =C2=B1  6%  sched_debug.cfs_r=
q:/.runnable_
> avg.min
>       8.33 =C2=B1 25%    +158.7%      21.56 =C2=B1  6%  sched_debug.cfs_r=
q:/.util_avg.
> min
>      14068 =C2=B1 25%     -25.0%      10544 =C2=B1 27%  sched_debug.cpu.m=
ax_idle_balan
> ce_cost.stddev
>     115552            -1.9%     113304        proc-vmstat.nr_anon_pages
>      19752            +6.6%      21062        proc-vmstat.nr_mapped
>      26437 =C2=B1  5%     +11.1%      29373 =C2=B1  4%  proc-vmstat.nr_pa=
ge_table_page
> s
>     203598 =C2=B1  4%      -8.6%     186103 =C2=B1  6%  proc-vmstat.numa_=
pte_updates
>    1186643            -7.5%    1098070        proc-vmstat.pgalloc_normal
>     900165           -10.8%     802909 =C2=B1  3%  proc-vmstat.pgfree
>      32293            +9.3%      35305        softirqs.CPU20.RCU
>      30898 =C2=B1  6%     +13.0%      34915        softirqs.CPU23.RCU
>      32035           +10.2%      35297 =C2=B1  2%  softirqs.CPU25.RCU
>      31009 =C2=B1  2%      +8.9%      33785        softirqs.CPU48.RCU
>      31172 =C2=B1  2%      +9.4%      34117        softirqs.CPU49.RCU
>      31976 =C2=B1  3%     +12.9%      36085        softirqs.CPU67.RCU
>      32441           +11.6%      36190        softirqs.CPU68.RCU
>     120358 =C2=B1  7%     -65.6%      41433 =C2=B1134%  numa-meminfo.node=
0.Active
>     120275 =C2=B1  7%     -65.7%      41271 =C2=B1134%  numa-meminfo.node=
0.Active(anon
> )
>     655647 =C2=B1  3%     -14.0%     563913 =C2=B1 11%  numa-meminfo.node=
0.FilePages
>     139661 =C2=B1  8%     -65.0%      48823 =C2=B1134%  numa-meminfo.node=
0.Shmem
>     200791 =C2=B1  8%     +42.1%     285232 =C2=B1 19%  numa-meminfo.node=
1.Active
>     200714 =C2=B1  8%     +42.1%     285223 =C2=B1 19%  numa-meminfo.node=
1.Active(anon
> )
>     764118 =C2=B1  4%     +13.2%     864978 =C2=B1  7%  numa-meminfo.node=
1.FilePages
>      44420 =C2=B1  3%     +18.2%      52490 =C2=B1  6%  numa-meminfo.node=
1.Mapped
>     244040 =C2=B1  8%     +41.0%     343975 =C2=B1 18%  numa-meminfo.node=
1.Shmem
>      29952 =C2=B1  7%     -65.5%      10323 =C2=B1134%  numa-vmstat.node0=
.nr_active_an
> on
>     163937 =C2=B1  3%     -14.0%     141025 =C2=B1 11%  numa-vmstat.node0=
.nr_file_page
> s
>      34939 =C2=B1  8%     -64.9%      12252 =C2=B1134%  numa-vmstat.node0=
.nr_shmem
>      29952 =C2=B1  7%     -65.5%      10323 =C2=B1134%  numa-vmstat.node0=
.nr_zone_acti
> ve_anon
>      49994 =C2=B1  8%     +41.4%      70687 =C2=B1 18%  numa-vmstat.node1=
.nr_active_an
> on
>     191054 =C2=B1  4%     +13.0%     215892 =C2=B1  7%  numa-vmstat.node1=
.nr_file_page
> s
>      11112 =C2=B1  4%     +19.8%      13314 =C2=B1  7%  numa-vmstat.node1=
.nr_mapped
>      61032 =C2=B1  8%     +40.3%      85643 =C2=B1 17%  numa-vmstat.node1=
.nr_shmem
>      49994 =C2=B1  8%     +41.4%      70687 =C2=B1 18%  numa-vmstat.node1=
.nr_zone_acti
> ve_anon
>     611.00 =C2=B1  3%     -12.8%     533.00 =C2=B1  6%  slabinfo.bdev_cac=
he.active_obj
> s
>     611.00 =C2=B1  3%     -12.8%     533.00 =C2=B1  6%  slabinfo.bdev_cac=
he.num_objs
>       1172           -11.9%       1032        slabinfo.file_lock_cache.ac=
tiv
> e_objs
>       1172           -11.9%       1032        slabinfo.file_lock_cache.nu=
m_o
> bjs
>      23068           +16.1%      26782 =C2=B1  2%  slabinfo.filp.active_o=
bjs
>     727.33           +16.0%     843.67 =C2=B1  2%  slabinfo.filp.active_s=
labs
>      23289           +16.0%      27017 =C2=B1  2%  slabinfo.filp.num_objs
>     727.33           +16.0%     843.67 =C2=B1  2%  slabinfo.filp.num_slabs
>       1034 =C2=B1 10%     -20.6%     821.33 =C2=B1  7%  slabinfo.kmem_cac=
he_node.activ
> e_objs
>       1066 =C2=B1 10%     -20.0%     853.33 =C2=B1  7%  slabinfo.kmem_cac=
he_node.num_o
> bjs
>       0.01 =C2=B1  8%     -75.0%       0.00 =C2=B1141%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.__sb_start_write.mnt_want_write.do_un=
lin
> kat
>       0.01 =C2=B1 55%     -59.3%       0.00 =C2=B1 12%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.kmem_cache_alloc.xfs_buf_item_init._x=
fs_
> trans_bjoin
>       0.01           +12.5%       0.01        perf-sched.sch_delay.avg.ms=
.wo
> rker_thread.kthread.ret_from_fork
>       0.01 =C2=B1 22%     -36.4%       0.01 =C2=B1 39%  perf-sched.sch_de=
lay.max.ms.do
> _nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
>       0.02 =C2=B1 41%    +168.6%       0.05 =C2=B1 43%  perf-sched.sch_de=
lay.max.ms.do
> _task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>       0.02 =C2=B1 23%     -22.9%       0.02 =C2=B1  4%  perf-sched.sch_de=
lay.max.ms.md
> _flush_request.raid0_make_request.md_handle_request.md_submit_bio
>       0.01 =C2=B1  6%    +297.6%       0.05 =C2=B1 52%  perf-sched.sch_de=
lay.max.ms.pi
> pe_read.new_sync_read.vfs_read.ksys_read
>       0.01 =C2=B1 44%     -69.2%       0.00 =C2=B1 70%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.__kmalloc.kmem_alloc.xfs_dir_removena=
me
>       0.01 =C2=B1  8%     -75.0%       0.00 =C2=B1141%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.__sb_start_write.mnt_want_write.do_un=
lin
> kat
>       0.01 =C2=B1  8%     +43.8%       0.01 =C2=B1 22%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.dput.path_openat.do_filp_open
>       0.01 =C2=B1 51%     -53.6%       0.00 =C2=B1 10%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.kmem_cache_alloc.xfs_buf_item_init._x=
fs_
> trans_bjoin
>       0.02 =C2=B1 99%     -78.4%       0.00 =C2=B1 12%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_=
cre
> ate
>       0.01 =C2=B1 30%     -45.2%       0.01 =C2=B1 12%  perf-sched.sch_de=
lay.max.ms.rw
> sem_down_read_slowpath.xfs_log_commit_cil.__xfs_trans_commit.xfs_inactive=
_if
> ree
>       0.01 =C2=B1 14%     +21.2%       0.01 =C2=B1  7%  perf-sched.sch_de=
lay.max.ms.sc
> hedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       0.03 =C2=B1 20%     -45.2%       0.02 =C2=B1 12%  perf-sched.sch_de=
lay.max.ms.sc
> hedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>       0.20 =C2=B1 26%     -74.1%       0.05 =C2=B1 48%  perf-sched.sch_de=
lay.max.ms.sm
> pboot_thread_fn.kthread.ret_from_fork
>      16.00 =C2=B1141%    +218.8%      51.00        perf-sched.wait_and_de=
lay.coun
> t.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wa=
it
>     166.65 =C2=B1141%    +200.0%     499.96        perf-sched.wait_and_de=
lay.max.
> ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_w=
ait
>       3493 =C2=B1 19%     +34.3%       4692 =C2=B1 11%  perf-sched.wait_a=
nd_delay.max.
> ms.worker_thread.kthread.ret_from_fork
>       0.01 =C2=B1 20%  +44786.1%       5.39 =C2=B1140%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.dput.do_unlinkat.do_syscall_64
>       3.21 =C2=B1  7%     -79.3%       0.67 =C2=B1 12%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.process_one_work.worker_thread.kthread
>     111.69           -15.7%      94.10 =C2=B1  6%  perf-sched.wait_time.m=
ax.ms.md
> _flush_request.raid0_make_request.md_handle_request.md_submit_bio
>     681.90 =C2=B1 20%     -95.4%      31.28 =C2=B1 14%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.process_one_work.worker_thread.kthread
>     391.78 =C2=B1 22%     +27.6%     499.95        perf-sched.wait_time.m=
ax.ms.sc
> hedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       3493 =C2=B1 19%     +34.3%       4692 =C2=B1 11%  perf-sched.wait_t=
ime.max.ms.wo
> rker_thread.kthread.ret_from_fork
>   36276744            -2.8%   35263114        perf-stat.i.branch-misses
>      28.50            +2.4       30.93        perf-stat.i.cache-miss-rate%
>   97033259            -5.6%   91583338        perf-stat.i.cache-references
>       1.20            +5.3%       1.27 =C2=B1  5%  perf-stat.i.cpi
>       6012           -90.5%     574.18 =C2=B1  3%  perf-stat.i.cpu-migrat=
ions
>  4.625e+09            -1.3%  4.564e+09        perf-stat.i.dTLB-loads
>  1.955e+09            -2.0%  1.915e+09        perf-stat.i.dTLB-stores
>      47.32            -1.2       46.11        perf-stat.i.iTLB-load-miss-=
rat
> e%
>    9005052            -7.7%    8311846        perf-stat.i.iTLB-load-misses
>  1.973e+10            -1.3%  1.947e+10        perf-stat.i.instructions
>       2186            +6.7%       2334        perf-stat.i.instructions-pe=
r-i
> TLB-miss
>       0.89            -2.0%       0.87        perf-stat.i.ipc
>       0.25           -28.2%       0.18 =C2=B1  4%  perf-stat.i.metric.K/s=
ec
>     121.14            -1.5%     119.39        perf-stat.i.metric.M/sec
>   10202664            +1.0%   10303979        perf-stat.i.node-load-misses
>    4031148            +7.6%    4336268        perf-stat.i.node-store-miss=
es
>     383735           -13.3%     332835        perf-stat.i.node-stores
>       4.92            -4.3%       4.71        perf-stat.overall.MPKI
>      29.27            +2.4       31.70        perf-stat.overall.cache-mis=
s-r
> ate%
>       1.11            +2.2%       1.13        perf-stat.overall.cpi
>      47.16            -1.7       45.44        perf-stat.overall.iTLB-load=
-mi
> ss-rate%
>       2191            +6.9%       2342        perf-stat.overall.instructi=
ons
> -per-iTLB-miss
>       0.90            -2.1%       0.88        perf-stat.overall.ipc
>      91.31            +1.6       92.87        perf-stat.overall.node-stor=
e-m
> iss-rate%
>   36055698            -2.8%   35053944        perf-stat.ps.branch-misses
>   96426045            -5.6%   91030646        perf-stat.ps.cache-referenc=
es
>       5974           -90.4%     570.78 =C2=B1  3%  perf-stat.ps.cpu-migra=
tions
>  4.596e+09            -1.3%  4.536e+09        perf-stat.ps.dTLB-loads
>  1.943e+09            -2.0%  1.904e+09        perf-stat.ps.dTLB-stores
>    8948830            -7.7%    8261507        perf-stat.ps.iTLB-load-miss=
es
>  1.961e+10            -1.3%  1.935e+10        perf-stat.ps.instructions
>   10138376            +1.0%   10241120        perf-stat.ps.node-load-miss=
es
>    4005752            +7.6%    4309853        perf-stat.ps.node-store-mis=
ses
>     381416           -13.2%     330910        perf-stat.ps.node-stores
>     116.00 =C2=B1134%    -100.0%       0.00        interrupts.121:PCI-MSI=
.3198165
> 4-edge.i40e-eth0-TxRx-85
>     401.00 =C2=B1  5%     -22.5%     310.67 =C2=B1  8%  interrupts.CPU0.R=
ES:Rescheduli
> ng_interrupts
>     424.67 =C2=B1 12%     -31.8%     289.67 =C2=B1  3%  interrupts.CPU1.R=
ES:Rescheduli
> ng_interrupts
>       4040 =C2=B1  9%     +25.3%       5062 =C2=B1 13%  interrupts.CPU10.=
CAL:Function_
> call_interrupts
>       1197 =C2=B1  4%      -7.7%       1105 =C2=B1  3%  interrupts.CPU11.=
NMI:Non-maska
> ble_interrupts
>       1197 =C2=B1  4%      -7.7%       1105 =C2=B1  3%  interrupts.CPU11.=
PMI:Performan
> ce_monitoring_interrupts
>     351.33           -21.5%     275.67 =C2=B1  2%  interrupts.CPU11.RES:R=
eschedul
> ing_interrupts
>     341.67 =C2=B1 10%     -22.9%     263.33 =C2=B1  8%  interrupts.CPU12.=
RES:Reschedul
> ing_interrupts
>     335.33 =C2=B1  4%     -16.2%     281.00 =C2=B1  9%  interrupts.CPU13.=
RES:Reschedul
> ing_interrupts
>     752.00 =C2=B1 29%     +44.1%       1083 =C2=B1  2%  interrupts.CPU14.=
NMI:Non-maska
> ble_interrupts
>     752.00 =C2=B1 29%     +44.1%       1083 =C2=B1  2%  interrupts.CPU14.=
PMI:Performan
> ce_monitoring_interrupts
>     334.33 =C2=B1  6%     -19.6%     268.67 =C2=B1  8%  interrupts.CPU14.=
RES:Reschedul
> ing_interrupts
>     520.67 =C2=B1 48%     -45.6%     283.33 =C2=B1 10%  interrupts.CPU17.=
RES:Reschedul
> ing_interrupts
>     474.67 =C2=B1 48%     -40.2%     284.00 =C2=B1 13%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>     542.33 =C2=B1 55%     -49.2%     275.33 =C2=B1  8%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>     345.33 =C2=B1  9%     -15.1%     293.33 =C2=B1  5%  interrupts.CPU2.R=
ES:Rescheduli
> ng_interrupts
>       3971 =C2=B1  3%     +13.5%       4506 =C2=B1  6%  interrupts.CPU20.=
CAL:Function_
> call_interrupts
>     546.33 =C2=B1 57%     -48.3%     282.67 =C2=B1  7%  interrupts.CPU21.=
RES:Reschedul
> ing_interrupts
>       4701           -16.1%       3942 =C2=B1  6%  interrupts.CPU22.CAL:F=
unction_
> call_interrupts
>     364.00 =C2=B1  5%     -27.3%     264.67 =C2=B1 15%  interrupts.CPU22.=
RES:Reschedul
> ing_interrupts
>       4366 =C2=B1  5%     -12.6%       3814 =C2=B1  8%  interrupts.CPU23.=
CAL:Function_
> call_interrupts
>     332.00 =C2=B1  4%     -18.0%     272.33 =C2=B1 12%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>     322.33 =C2=B1  5%     -23.4%     247.00 =C2=B1 13%  interrupts.CPU24.=
RES:Reschedul
> ing_interrupts
>     341.33 =C2=B1 10%     -22.7%     264.00 =C2=B1 15%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>     332.33 =C2=B1  2%     -22.0%     259.33 =C2=B1  2%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>     333.33 =C2=B1  3%     -18.9%     270.33 =C2=B1 10%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>     334.00 =C2=B1  6%     -18.7%     271.67 =C2=B1 13%  interrupts.CPU28.=
RES:Reschedul
> ing_interrupts
>       4512 =C2=B1  6%     -11.0%       4017 =C2=B1  6%  interrupts.CPU29.=
CAL:Function_
> call_interrupts
>     345.33 =C2=B1  6%     -15.4%     292.00 =C2=B1  2%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>     352.33           -20.2%     281.33 =C2=B1  2%  interrupts.CPU3.RES:Re=
scheduli
> ng_interrupts
>     334.67 =C2=B1  4%     -25.5%     249.33 =C2=B1 17%  interrupts.CPU30.=
RES:Reschedul
> ing_interrupts
>     331.33 =C2=B1  5%     -21.9%     258.67 =C2=B1  6%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>       4554 =C2=B1  8%      -9.4%       4126 =C2=B1  6%  interrupts.CPU32.=
CAL:Function_
> call_interrupts
>     315.33 =C2=B1  6%     -18.0%     258.67 =C2=B1 10%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>     344.67 =C2=B1  4%     -21.7%     270.00 =C2=B1  4%  interrupts.CPU33.=
RES:Reschedul
> ing_interrupts
>     345.33 =C2=B1  6%     -26.2%     255.00 =C2=B1 10%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>     311.00 =C2=B1  2%     -22.3%     241.67 =C2=B1 10%  interrupts.CPU35.=
RES:Reschedul
> ing_interrupts
>     325.67 =C2=B1  4%     -23.3%     249.67 =C2=B1  3%  interrupts.CPU36.=
RES:Reschedul
> ing_interrupts
>     331.67 =C2=B1  5%     -21.2%     261.33 =C2=B1  8%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>     316.67 =C2=B1  6%     -21.8%     247.67 =C2=B1 12%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>     324.00 =C2=B1  3%     -27.5%     235.00 =C2=B1  7%  interrupts.CPU39.=
RES:Reschedul
> ing_interrupts
>     338.67           -18.2%     277.00 =C2=B1  8%  interrupts.CPU4.RES:Re=
scheduli
> ng_interrupts
>     335.00 =C2=B1  3%     -26.9%     245.00 =C2=B1  3%  interrupts.CPU40.=
RES:Reschedul
> ing_interrupts
>     318.67 =C2=B1  8%     -18.1%     261.00 =C2=B1  7%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>     330.67 =C2=B1  2%     -28.4%     236.67 =C2=B1  4%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>     856.33 =C2=B1 22%     +33.7%       1145 =C2=B1  4%  interrupts.CPU43.=
NMI:Non-maska
> ble_interrupts
>     856.33 =C2=B1 22%     +33.7%       1145 =C2=B1  4%  interrupts.CPU43.=
PMI:Performan
> ce_monitoring_interrupts
>     295.67 =C2=B1  5%     -12.6%     258.33 =C2=B1  7%  interrupts.CPU43.=
RES:Reschedul
> ing_interrupts
>       3973 =C2=B1  5%     +11.0%       4408 =C2=B1  4%  interrupts.CPU44.=
CAL:Function_
> call_interrupts
>     594.67 =C2=B1 58%     -50.0%     297.33 =C2=B1  4%  interrupts.CPU44.=
RES:Reschedul
> ing_interrupts
>     470.67 =C2=B1 43%     -37.7%     293.00 =C2=B1  7%  interrupts.CPU45.=
RES:Reschedul
> ing_interrupts
>     175.00 =C2=B1121%     -98.7%       2.33 =C2=B1 40%  interrupts.CPU45.=
TLB:TLB_shoot
> downs
>       1203 =C2=B1  6%     -11.1%       1069 =C2=B1  2%  interrupts.CPU51.=
NMI:Non-maska
> ble_interrupts
>       1203 =C2=B1  6%     -11.1%       1069 =C2=B1  2%  interrupts.CPU51.=
PMI:Performan
> ce_monitoring_interrupts
>     171.67 =C2=B1126%     -97.7%       4.00 =C2=B1 54%  interrupts.CPU52.=
TLB:TLB_shoot
> downs
>       4059 =C2=B1  9%     +11.8%       4536 =C2=B1  5%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>     332.00 =C2=B1 12%     -18.5%     270.67 =C2=B1  8%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>     339.00 =C2=B1 14%     -25.5%     252.67 =C2=B1  5%  interrupts.CPU57.=
RES:Reschedul
> ing_interrupts
>     339.33 =C2=B1  6%     -23.9%     258.33 =C2=B1 11%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>     330.33 =C2=B1  4%     -20.0%     264.33 =C2=B1  4%  interrupts.CPU59.=
RES:Reschedul
> ing_interrupts
>     739.67 =C2=B1 31%     +48.9%       1101 =C2=B1  7%  interrupts.CPU6.N=
MI:Non-maskab
> le_interrupts
>     739.67 =C2=B1 31%     +48.9%       1101 =C2=B1  7%  interrupts.CPU6.P=
MI:Performanc
> e_monitoring_interrupts
>     362.00 =C2=B1  8%     -17.6%     298.33 =C2=B1  6%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>     392.33 =C2=B1 15%     -36.2%     250.33 =C2=B1  6%  interrupts.CPU60.=
RES:Reschedul
> ing_interrupts
>     355.00 =C2=B1  4%     -25.1%     266.00 =C2=B1  9%  interrupts.CPU61.=
RES:Reschedul
> ing_interrupts
>       3911 =C2=B1  5%     +10.3%       4314 =C2=B1  4%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>     336.33 =C2=B1  6%     +67.2%     562.33 =C2=B1 19%  interrupts.CPU62.=
RES:Reschedul
> ing_interrupts
>       4057 =C2=B1  5%     +12.0%       4544 =C2=B1  7%  interrupts.CPU63.=
CAL:Function_
> call_interrupts
>     363.33 =C2=B1 13%     +50.6%     547.00 =C2=B1 10%  interrupts.CPU63.=
RES:Reschedul
> ing_interrupts
>     331.67 =C2=B1  2%     +56.5%     519.00 =C2=B1 18%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>       3981 =C2=B1  4%     +12.4%       4475 =C2=B1  7%  interrupts.CPU65.=
CAL:Function_
> call_interrupts
>     336.67 =C2=B1  8%     +89.3%     637.33 =C2=B1 14%  interrupts.CPU65.=
RES:Reschedul
> ing_interrupts
>     357.00           -16.9%     296.67 =C2=B1  6%  interrupts.CPU66.RES:R=
eschedul
> ing_interrupts
>     356.33 =C2=B1  3%     -25.6%     265.00 =C2=B1  5%  interrupts.CPU67.=
RES:Reschedul
> ing_interrupts
>     360.00 =C2=B1  8%     -20.5%     286.33 =C2=B1  9%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>       4421 =C2=B1  2%     -12.0%       3889 =C2=B1 11%  interrupts.CPU73.=
CAL:Function_
> call_interrupts
>       1242 =C2=B1  2%     -26.4%     914.67 =C2=B1 28%  interrupts.CPU74.=
NMI:Non-maska
> ble_interrupts
>       1242 =C2=B1  2%     -26.4%     914.67 =C2=B1 28%  interrupts.CPU74.=
PMI:Performan
> ce_monitoring_interrupts
>     531.33 =C2=B1 52%     -50.9%     261.00 =C2=B1  2%  interrupts.CPU77.=
RES:Reschedul
> ing_interrupts
>     467.00 =C2=B1 36%     -46.3%     251.00 =C2=B1  2%  interrupts.CPU78.=
RES:Reschedul
> ing_interrupts
>       4395 =C2=B1  5%     -11.3%       3898 =C2=B1  8%  interrupts.CPU79.=
CAL:Function_
> call_interrupts
>     424.67 =C2=B1 36%     -41.8%     247.00 =C2=B1 10%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>     431.67 =C2=B1 38%     -42.5%     248.00 =C2=B1  8%  interrupts.CPU80.=
RES:Reschedul
> ing_interrupts
>       1175 =C2=B1  3%     -23.3%     901.00 =C2=B1 29%  interrupts.CPU81.=
NMI:Non-maska
> ble_interrupts
>       1175 =C2=B1  3%     -23.3%     901.00 =C2=B1 29%  interrupts.CPU81.=
PMI:Performan
> ce_monitoring_interrupts
>     412.67 =C2=B1 39%     -40.5%     245.33 =C2=B1  9%  interrupts.CPU81.=
RES:Reschedul
> ing_interrupts
>     538.33 =C2=B1 56%     -51.7%     260.00 =C2=B1  7%  interrupts.CPU82.=
RES:Reschedul
> ing_interrupts
>     487.67 =C2=B1 41%     -41.4%     286.00        interrupts.CPU83.RES:R=
eschedul
> ing_interrupts
>       4472 =C2=B1  2%     -10.0%       4023 =C2=B1  3%  interrupts.CPU84.=
CAL:Function_
> call_interrupts
>     115.33 =C2=B1135%    -100.0%       0.00        interrupts.CPU85.121:P=
CI-MSI.3
> 1981654-edge.i40e-eth0-TxRx-85
>     721.00 =C2=B1 36%     +56.8%       1130 =C2=B1  3%  interrupts.CPU86.=
NMI:Non-maska
> ble_interrupts
>     721.00 =C2=B1 36%     +56.8%       1130 =C2=B1  3%  interrupts.CPU86.=
PMI:Performan
> ce_monitoring_interrupts
>       4344 =C2=B1  4%     -30.8%       3004 =C2=B1 15%  interrupts.CPU87.=
CAL:Function_
> call_interrupts
>     712.00 =C2=B1 34%     +63.3%       1163 =C2=B1  2%  interrupts.CPU87.=
NMI:Non-maska
> ble_interrupts
>     712.00 =C2=B1 34%     +63.3%       1163 =C2=B1  2%  interrupts.CPU87.=
PMI:Performan
> ce_monitoring_interrupts
>     128.33 =C2=B1 49%     -61.3%      49.67 =C2=B1 63%  interrupts.CPU87.=
TLB:TLB_shoot
> downs
>       3963 =C2=B1 11%     +15.3%       4568 =C2=B1  4%  interrupts.CPU9.C=
AL:Function_c
> all_interrupts
>     305.67 =C2=B1  8%      -8.1%     281.00 =C2=B1  4%  interrupts.CPU9.R=
ES:Rescheduli
> ng_interrupts
>      32702 =C2=B1  5%     -19.8%      26214 =C2=B1  8%  interrupts.RES:Re=
scheduling_in
> terrupts
>       2679 =C2=B1  7%     -74.2%     690.33 =C2=B1 15%  interrupts.TLB:TL=
B_shootdowns
>       0.57 =C2=B1  5%      -0.2        0.35 =C2=B1 71%  perf-profile.call=
trace.cycles-
> pp.xfs_inobt_get_rec.xfs_check_agi_freecount.xfs_dialloc_ag.xfs_dialloc.x=
fs_
> ialloc
>       1.03 =C2=B1  2%      -0.1        0.96        perf-profile.calltrace=
.cycles-
> pp.xfs_dir2_node_removename.xfs_dir_removename.xfs_remove.xfs_vn_unlink.v=
fs_
> unlink
>       0.66 =C2=B1  6%      -0.1        0.59 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startu=
p_6
> 4_no_verify
>       0.60            -0.1        0.54        perf-profile.calltrace.cycl=
es-
> pp.xfs_da3_node_lookup_int.xfs_dir2_node_removename.xfs_dir_removename.xf=
s_r
> emove.xfs_vn_unlink
>       1.83 =C2=B1  2%      -0.1        1.77 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.xfs_fs_destroy_inod=
e.d
> estroy_inode
>       1.80 =C2=B1  2%      -0.1        1.74 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.xfs_log_commit_cil.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.=
xfs
> _fs_destroy_inode
>       0.67 =C2=B1  4%      -0.0        0.63 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.xfs_dir2_node_addname.xfs_dir_createname.xfs_create.xfs_generic_create=
.pa
> th_openat
>       0.60 =C2=B1  3%      +0.0        0.63 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.xfs_iunlink.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat
>       0.63 =C2=B1  3%      +0.0        0.67 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.memcpy_erms.xfs_buf_item_format.xlog_cil_insert_items.xfs_log_commit_c=
il.
> __xfs_trans_commit
>       0.94 =C2=B1  3%      +0.0        0.99        perf-profile.calltrace=
.cycles-
> pp.xfs_btree_lookup.xfs_check_agi_freecount.xfs_dialloc_ag.xfs_dialloc.xf=
s_i
> alloc
>       0.70 =C2=B1  2%      +0.1        0.77        perf-profile.calltrace=
.cycles-
> pp.__percpu_counter_sum.__percpu_counter_compare.xfs_trans_unreserve_and_=
mod
> _sb.xfs_log_commit_cil.__xfs_trans_commit
>       0.73 =C2=B1  2%      +0.1        0.80        perf-profile.calltrace=
.cycles-
> pp.__percpu_counter_compare.xfs_trans_unreserve_and_mod_sb.xfs_log_commit=
_ci
> l.__xfs_trans_commit.xfs_create
>       2.83            +0.1        2.90        perf-profile.calltrace.cycl=
es-
> pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.do_unlinkat.d=
o_s
> yscall_64
>       0.77 =C2=B1  2%      +0.1        0.85        perf-profile.calltrace=
.cycles-
> pp.xfs_trans_unreserve_and_mod_sb.xfs_log_commit_cil.__xfs_trans_commit.x=
fs_
> create.xfs_generic_create
>       1.97 =C2=B1  3%      +0.1        2.08 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.__xfs_dir3_data_check.xfs_dir3_data_check.xfs_dir2_block_lookup_int.xf=
s_d
> ir2_block_removename.xfs_dir_removename
>       4.98            +0.2        5.15        perf-profile.calltrace.cycl=
es-
> pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpath.do=
_un
> linkat.do_syscall_64
>       4.38 =C2=B1  2%      +0.2        4.56        perf-profile.calltrace=
.cycles-
> pp.__xfs_trans_commit.xfs_create.xfs_generic_create.path_openat.do_filp_o=
pen
>       4.34            +0.2        4.52        perf-profile.calltrace.cycl=
es-
> pp.xfs_log_commit_cil.__xfs_trans_commit.xfs_create.xfs_generic_create.pa=
th_
> openat
>       8.90            +0.2        9.09        perf-profile.calltrace.cycl=
es-
> pp.rwsem_down_write_slowpath.do_unlinkat.do_syscall_64.entry_SYSCALL_64_a=
fte
> r_hwframe.unlink
>       7.86            +0.2        8.10        perf-profile.calltrace.cycl=
es-
> pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.do_unlinkat.do_syscall=
_64
> .entry_SYSCALL_64_after_hwframe
>       0.98 =C2=B1  3%      -0.2        0.76        perf-profile.children.=
cycles-p
> p.try_to_wake_up
>       0.27 =C2=B1  3%      -0.2        0.10        perf-profile.children.=
cycles-p
> p.select_task_rq_fair
>       0.56 =C2=B1 28%      -0.2        0.39 =C2=B1 30%  perf-profile.chil=
dren.cycles-p
> p.start_kernel
>       1.20 =C2=B1  2%      -0.1        1.07        perf-profile.children.=
cycles-p
> p.__schedule
>       0.77 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xfs_buf_unlock
>       1.30 =C2=B1  3%      -0.1        1.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.xfs_inobt_get_rec
>       0.66            -0.1        0.54 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.up
>       0.89            -0.1        0.77 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.xfs_buf_item_release
>       0.48 =C2=B1  4%      -0.1        0.38 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.wake_up_q
>       0.62 =C2=B1  3%      -0.1        0.52 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.rwsem_wake
>       0.68 =C2=B1  6%      -0.1        0.60 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.menu_select
>       1.03 =C2=B1  2%      -0.1        0.96        perf-profile.children.=
cycles-p
> p.xfs_dir2_node_removename
>       0.86            -0.1        0.78        perf-profile.children.cycle=
s-p
> p.xfs_da3_node_lookup_int
>       0.38 =C2=B1  3%      -0.1        0.30 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.ttwu_do_activate
>       0.37 =C2=B1  3%      -0.1        0.30 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.enqueue_task_fair
>       0.30 =C2=B1  4%      -0.1        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.update_load_avg
>       0.80 =C2=B1  2%      -0.1        0.73        perf-profile.children.=
cycles-p
> p.schedule
>       0.30 =C2=B1  3%      -0.1        0.24 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.enqueue_entity
>       0.44            -0.1        0.39 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.xfs_dir2_leafn_lookup_for_entry
>       0.43 =C2=B1  2%      -0.1        0.38        perf-profile.children.=
cycles-p
> p.schedule_idle
>       0.37 =C2=B1  5%      -0.1        0.32 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.dequeue_task_fair
>       0.20 =C2=B1  4%      -0.1        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.update_curr
>       0.63 =C2=B1  4%      -0.0        0.59        perf-profile.children.=
cycles-p
> p.xfs_btree_check_sblock
>       0.15 =C2=B1 11%      -0.0        0.11 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_get_sleep_length
>       0.57 =C2=B1  3%      -0.0        0.52 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.xfs_next_bit
>       0.67 =C2=B1  4%      -0.0        0.63 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xfs_dir2_node_addname
>       0.34 =C2=B1  4%      -0.0        0.30 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.dequeue_entity
>       0.53 =C2=B1  4%      -0.0        0.49 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_lock_irqsave
>       0.19 =C2=B1  6%      -0.0        0.16 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xfs_dialloc_ag_update_inobt
>       0.29 =C2=B1  3%      -0.0        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.pick_next_task_fair
>       0.17 =C2=B1  2%      -0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.dsearch
>       0.12 =C2=B1 10%      -0.0        0.09 =C2=B1 19%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_next_event
>       0.33            -0.0        0.31 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.xfs_btree_update
>       0.13 =C2=B1  6%      -0.0        0.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.update_blocked_averages
>       0.38            -0.0        0.36 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__xfs_btree_check_sblock
>       0.35 =C2=B1  2%      -0.0        0.33        perf-profile.children.=
cycles-p
> p.xfs_inobt_update
>       0.17 =C2=B1  4%      -0.0        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.xlog_space_left
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.__radix_tree_lookup
>       0.33 =C2=B1  2%      -0.0        0.31        perf-profile.children.=
cycles-p
> p.alloc_empty_file
>       0.10 =C2=B1  9%      -0.0        0.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.__update_load_avg_cfs_rq
>       0.12 =C2=B1  4%      -0.0        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.nr_iowait_cpu
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.xfs_trans_buf_item_match
>       0.05            +0.0        0.06        perf-profile.children.cycle=
s-p
> p.errseq_sample
>       0.10 =C2=B1  4%      +0.0        0.11        perf-profile.children.=
cycles-p
> p.__mnt_want_write
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.xfs_dir2_data_log_unused
>       0.07 =C2=B1 11%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.xfs_bmap_last_offset
>       0.20 =C2=B1  4%      +0.0        0.22 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xlog_ticket_alloc
>       0.11            +0.0        0.13 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.mnt_want_write
>       0.52            +0.0        0.55        perf-profile.children.cycle=
s-p
> p.xfs_perag_get
>       0.37 =C2=B1  2%      +0.0        0.39 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.xfs_trans_log_inode
>       0.10 =C2=B1 14%      +0.0        0.13 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.up_write
>       0.23 =C2=B1  4%      +0.0        0.27 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.native_queued_spin_lock_slowpath
>       0.60 =C2=B1  3%      +0.0        0.63 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xfs_iunlink
>       0.27 =C2=B1  7%      +0.0        0.30 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.inode_permission
>       1.17            +0.0        1.21 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.memcpy_erms
>       0.11 =C2=B1 11%      +0.0        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.ttwu_queue_wakelist
>       0.83            +0.0        0.88        perf-profile.children.cycle=
s-p
> p.xfs_trans_unreserve_and_mod_sb
>       0.62 =C2=B1  4%      +0.1        0.67        perf-profile.children.=
cycles-p
> p.link_path_walk
>       1.89            +0.1        1.95        perf-profile.children.cycle=
s-p
> p.xfs_btree_lookup
>       0.74            +0.1        0.81        perf-profile.children.cycle=
s-p
> p.__percpu_counter_compare
>       0.71 =C2=B1  2%      +0.1        0.78        perf-profile.children.=
cycles-p
> p.__percpu_counter_sum
>       0.73 =C2=B1  3%      +0.1        0.80 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xfs_inode_item_format
>       1.26            +0.1        1.33        perf-profile.children.cycle=
s-p
> p.xfs_btree_read_buf_block
>       0.54 =C2=B1  4%      +0.1        0.62        perf-profile.children.=
cycles-p
> p.xfs_buf_item_init
>       1.51 =C2=B1  2%      +0.1        1.58 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xfs_btree_lookup_get_block
>       2.70            +0.1        2.78 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.xfs_dir2_block_addname
>       1.21 =C2=B1  2%      +0.1        1.28 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p._xfs_trans_bjoin
>       3.91            +0.1        4.06        perf-profile.children.cycle=
s-p
> p.xlog_cil_insert_items
>       8.44            +0.2        8.60        perf-profile.children.cycle=
s-p
> p.xfs_log_commit_cil
>       0.09 =C2=B1  5%      -0.1        0.03 =C2=B1 70%  perf-profile.self=
.cycles-pp.up
> date_curr
>       0.13 =C2=B1  6%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.up
> date_load_avg
>       0.09 =C2=B1  5%      -0.0        0.06        perf-profile.self.cycl=
es-pp.se
> lect_task_rq_fair
>       0.16 =C2=B1 10%      -0.0        0.13 =C2=B1  9%  perf-profile.self=
.cycles-pp.__
> d_lookup
>       0.49 =C2=B1  4%      -0.0        0.46        perf-profile.self.cycl=
es-pp.xf
> s_buf_item_format
>       0.45 =C2=B1  2%      -0.0        0.42 =C2=B1  2%  perf-profile.self=
.cycles-pp._r
> aw_spin_lock_irqsave
>       0.13            -0.0        0.11 =C2=B1  7%  perf-profile.self.cycl=
es-pp.ds
> earch
>       0.10 =C2=B1  9%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> update_load_avg_cfs_rq
>       0.24 =C2=B1  3%      -0.0        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp._r
> aw_spin_unlock_irqrestore
>       0.22            -0.0        0.20 =C2=B1  2%  perf-profile.self.cycl=
es-pp.xf
> s_btree_lookup
>       0.30            -0.0        0.28 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__
> xfs_btree_check_sblock
>       0.10            -0.0        0.09 =C2=B1  5%  perf-profile.self.cycl=
es-pp.up
> date_rq_clock
>       0.06 =C2=B1  7%      -0.0        0.05        perf-profile.self.cycl=
es-pp.up
> date_blocked_averages
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.__
> radix_tree_lookup
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.er
> rseq_sample
>       0.09 =C2=B1 10%      +0.0        0.11        perf-profile.self.cycl=
es-pp.__
> mnt_want_write
>       0.44 =C2=B1  2%      +0.0        0.46        perf-profile.self.cycl=
es-pp.xf
> s_perag_get
>       0.13 =C2=B1  6%      +0.0        0.15 =C2=B1  5%  perf-profile.self=
.cycles-pp.xf
> s_dir2_block_sfsize
>       0.10 =C2=B1  9%      +0.0        0.12 =C2=B1  7%  perf-profile.self=
.cycles-pp.up
> _write
>       0.21 =C2=B1  6%      +0.0        0.24 =C2=B1  3%  perf-profile.self=
.cycles-pp.in
> ode_permission
>       0.59 =C2=B1  2%      +0.0        0.62 =C2=B1  3%  perf-profile.self=
.cycles-pp.xl
> og_cil_insert_items
>       0.23 =C2=B1  4%      +0.0        0.27 =C2=B1  3%  perf-profile.self=
.cycles-pp.na
> tive_queued_spin_lock_slowpath
>       0.44 =C2=B1  3%      +0.0        0.48 =C2=B1  2%  perf-profile.self=
.cycles-pp.__
> percpu_counter_sum
>       1.16            +0.0        1.20        perf-profile.self.cycles-pp=
.me
> mcpy_erms
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.tt
> wu_queue_wakelist
>       0.49 =C2=B1  5%      +0.1        0.55        perf-profile.self.cycl=
es-pp.xf
> s_buf_item_init
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-knm01: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz with 80G =
mem
> ory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> blocksize/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/=
tes
> tcase/ucode:
>   128K/gcc-9/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-20200603=
.cg
> z/lkp-knm01/pigz/0x11
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           1:3           38%           2:3     perf-profile.calltrace.cycl=
es-
> pp.error_entry
>           2:3           31%           3:3     perf-profile.children.cycle=
s-p
> p.error_entry
>           1:3           24%           2:3     perf-profile.self.cycles-pp=
.er
> ror_entry
>          %stddev     %change         %stddev
>              \          |                \
>   1.37e+08           +19.7%   1.64e+08        pigz.throughput
>      30751 =C2=B1  5%     +11.4%      34253        pigz.time.involuntary_=
context_
> switches
>     212520 =C2=B1  6%     +23.0%     261296 =C2=B1  3%  pigz.time.maximum=
_resident_set
> _size
>     708742            +7.3%     760675        pigz.time.minor_page_faults
>       4655 =C2=B1  3%      +6.6%       4961        pigz.time.percent_of_c=
pu_this_
> job_got
>      12934 =C2=B1  3%      +7.4%      13893        pigz.time.user_time
>   47966962           +18.1%   56654287        pigz.time.voluntary_context=
_sw
> itches
>     750.00 =C2=B1 67%     -48.2%     388.33 =C2=B1130%  numa-meminfo.node=
0.Mlocked
>   11327916 =C2=B1 10%     +34.5%   15232624 =C2=B1  2%  cpuidle.POLL.time
>     169442 =C2=B1 28%     +53.0%     259206        cpuidle.POLL.usage
>   14187669           +18.4%   16803112        numa-numastat.node0.local_n=
ode
>   14187657           +18.4%   16803096        numa-numastat.node0.numa_hit
>    9125459           +13.7%   10376267        numa-vmstat.node0.numa_hit
>    9125490           +13.7%   10376306        numa-vmstat.node0.numa_local
>      74.00            -2.7%      72.00        vmstat.cpu.id
>     312254           +20.0%     374846        vmstat.system.cs
>       2046 =C2=B1  9%     -16.2%       1714 =C2=B1  6%  slabinfo.dmaengin=
e-unmap-16.ac
> tive_objs
>       2046 =C2=B1  9%     -16.2%       1714 =C2=B1  6%  slabinfo.dmaengin=
e-unmap-16.nu
> m_objs
>       5257 =C2=B1  3%      +7.6%       5656 =C2=B1  3%  slabinfo.khugepag=
ed_mm_slot.ac
> tive_objs
>       5257 =C2=B1  3%      +7.6%       5656 =C2=B1  3%  slabinfo.khugepag=
ed_mm_slot.nu
> m_objs
>     986.00 =C2=B1  2%     -10.3%     884.00 =C2=B1  2%  slabinfo.mnt_cach=
e.active_objs
>     986.00 =C2=B1  2%     -10.3%     884.00 =C2=B1  2%  slabinfo.mnt_cach=
e.num_objs
>       1432           -10.9%       1276 =C2=B1  7%  slabinfo.task_group.ac=
tive_obj
> s
>       1432           -10.9%       1276 =C2=B1  7%  slabinfo.task_group.nu=
m_objs
>     110609            +2.8%     113694        proc-vmstat.nr_anon_pages
>     114074            +2.8%     117268        proc-vmstat.nr_inactive_anon
>     114074            +2.8%     117268        proc-vmstat.nr_zone_inactiv=
e_a
> non
>     564009            +5.9%     597011        proc-vmstat.numa_hint_faults
>     564009            +5.9%     597011        proc-vmstat.numa_hint_fault=
s_l
> ocal
>   14195634           +18.5%   16816823        proc-vmstat.numa_hit
>   14195631           +18.5%   16816819        proc-vmstat.numa_local
>    1043223            +4.1%    1085777        proc-vmstat.numa_pte_updates
>      11714 =C2=B1  6%      +7.3%      12574        proc-vmstat.pgactivate
>   14393562           +18.2%   17011732        proc-vmstat.pgalloc_normal
>    1585213            +3.1%    1634637        proc-vmstat.pgfault
>   14362848           +18.1%   16961366        proc-vmstat.pgfree
>    1550562 =C2=B1  4%     -18.0%    1271800 =C2=B1 18%  sched_debug.cfs_r=
q:/.MIN_vrunt
> ime.max
>       8835 =C2=B1 11%     +32.9%      11739 =C2=B1  9%  sched_debug.cfs_r=
q:/.exec_cloc
> k.min
>       2476 =C2=B1  9%     -39.3%       1502 =C2=B1  8%  sched_debug.cfs_r=
q:/.exec_cloc
> k.stddev
>    1550562 =C2=B1  4%     -18.0%    1271800 =C2=B1 18%  sched_debug.cfs_r=
q:/.max_vrunt
> ime.max
>     763629 =C2=B1 11%     +18.2%     902668 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.min
>     177012 =C2=B1  6%     -39.7%     106749 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.stddev
>       0.16 =C2=B1  6%     -11.2%       0.14 =C2=B1  9%  sched_debug.cfs_r=
q:/.nr_runnin
> g.avg
>      48.54 =C2=B1 22%     -92.8%       3.48 =C2=B1 16%  sched_debug.cfs_r=
q:/.nr_spread
> _over.avg
>      91.43 =C2=B1 14%     -87.5%      11.40 =C2=B1  9%  sched_debug.cfs_r=
q:/.nr_spread
> _over.max
>      10.05 =C2=B1 57%     -98.5%       0.15 =C2=B1 72%  sched_debug.cfs_r=
q:/.nr_spread
> _over.min
>      15.86 =C2=B1  9%     -87.9%       1.92 =C2=B1  6%  sched_debug.cfs_r=
q:/.nr_spread
> _over.stddev
>     171.27 =C2=B1  3%     -13.1%     148.81 =C2=B1  4%  sched_debug.cfs_r=
q:/.runnable_
> avg.avg
>     206.14           -11.0%     183.51 =C2=B1  3%  sched_debug.cfs_rq:/.r=
unnable_
> avg.stddev
>     643426 =C2=B1 15%     -33.1%     430686 =C2=B1 29%  sched_debug.cfs_r=
q:/.spread0.a
> vg
>    1229982 =C2=B1 13%     -28.6%     878127 =C2=B1 17%  sched_debug.cfs_r=
q:/.spread0.m
> ax
>     177020 =C2=B1  6%     -39.7%     106663 =C2=B1  7%  sched_debug.cfs_r=
q:/.spread0.s
> tddev
>     168.91 =C2=B1  4%     -13.3%     146.50 =C2=B1  4%  sched_debug.cfs_r=
q:/.util_avg.
> avg
>     201.62           -12.6%     176.14 =C2=B1  3%  sched_debug.cfs_rq:/.u=
til_avg.
> stddev
>     183.40            +9.9%     201.50        sched_debug.cpu.clock.stddev
>      63424 =C2=B1 20%     +45.3%      92179 =C2=B1  7%  sched_debug.cpu.n=
r_switches.mi
> n
>      16303 =C2=B1 11%     -44.0%       9121 =C2=B1 11%  sched_debug.cpu.n=
r_switches.st
> ddev
>      51576 =C2=B1 23%     +65.9%      85552 =C2=B1  6%  sched_debug.cpu.s=
ched_count.mi
> n
>      16256 =C2=B1 11%     -44.7%       8987 =C2=B1 12%  sched_debug.cpu.s=
ched_count.st
> ddev
>      25311 =C2=B1 23%     +69.0%      42788 =C2=B1  6%  sched_debug.cpu.s=
ched_goidle.m
> in
>       7964 =C2=B1 11%     -43.7%       4486 =C2=B1 12%  sched_debug.cpu.s=
ched_goidle.s
> tddev
>     551357 =C2=B1 15%     +92.0%    1058615 =C2=B1 29%  sched_debug.cpu.t=
twu_count.max
>      77374 =C2=B1  7%     +43.6%     111127 =C2=B1 21%  sched_debug.cpu.t=
twu_count.std
> dev
>     325.76 =C2=B1 14%     -43.0%     185.62 =C2=B1 14%  sched_debug.cpu.t=
twu_local.avg
>     178.43 =C2=B1 15%     -31.0%     123.17 =C2=B1 14%  sched_debug.cpu.t=
twu_local.min
>      31.31            -4.2%      30.01        perf-stat.i.MPKI
>  6.422e+09           +15.9%   7.44e+09        perf-stat.i.branch-instruct=
ion
> s
>  5.819e+08           +15.1%  6.697e+08        perf-stat.i.branch-misses
>      14.41 =C2=B1  2%      -4.0       10.44        perf-stat.i.cache-miss=
-rate%
>  1.912e+08 =C2=B1  4%     -19.5%  1.539e+08        perf-stat.i.cache-miss=
es
>  1.325e+09           +11.3%  1.474e+09        perf-stat.i.cache-references
>     315909           +19.9%     378766        perf-stat.i.context-switches
>      28108           -91.7%       2343 =C2=B1  2%  perf-stat.i.cpu-migrat=
ions
>     708.94 =C2=B1  4%     +30.3%     923.46        perf-stat.i.cycles-bet=
ween-cac
> he-misses
>   82715609 =C2=B1 10%     +13.5%   93853496        perf-stat.i.iTLB-load-=
misses
>   4.23e+10           +16.2%  4.914e+10        perf-stat.i.iTLB-loads
>  4.231e+10           +16.2%  4.914e+10        perf-stat.i.instructions
>       0.18 =C2=B1  2%     -68.8%       0.06 =C2=B1  2%  perf-stat.i.metri=
c.K/sec
>     173.64           +16.0%     201.50        perf-stat.i.metric.M/sec
>       5142            +3.0%       5299        perf-stat.i.minor-faults
>       5143            +3.0%       5300        perf-stat.i.page-faults
>      31.34            -4.1%      30.06        perf-stat.overall.MPKI
>      14.53 =C2=B1  3%      -3.9       10.67        perf-stat.overall.cach=
e-miss-r
> ate%
>     698.37 =C2=B1  4%     +28.5%     897.07        perf-stat.overall.cycl=
es-betwe
> en-cache-misses
>   6.39e+09           +15.8%    7.4e+09        perf-stat.ps.branch-instruc=
tio
> ns
>  5.788e+08           +15.0%  6.658e+08        perf-stat.ps.branch-misses
>  1.918e+08 =C2=B1  4%     -18.3%  1.567e+08        perf-stat.ps.cache-mis=
ses
>  1.319e+09           +11.3%  1.469e+09        perf-stat.ps.cache-referenc=
es
>     314427           +20.0%     377156        perf-stat.ps.context-switch=
es
>      27968           -91.6%       2343 =C2=B1  2%  perf-stat.ps.cpu-migra=
tions
>   82294110 =C2=B1 10%     +13.4%   93351968        perf-stat.ps.iTLB-load=
-misses
>  4.208e+10           +16.1%  4.886e+10        perf-stat.ps.iTLB-loads
>  4.209e+10           +16.1%  4.886e+10        perf-stat.ps.instructions
>       5138            +3.2%       5303        perf-stat.ps.minor-faults
>       5139            +3.2%       5304        perf-stat.ps.page-faults
>  1.267e+13           +16.0%   1.47e+13        perf-stat.total.instructions
>      22143 =C2=B1 15%     +28.6%      28484 =C2=B1  3%  softirqs.CPU1.RCU
>      22488 =C2=B1  2%     +12.7%      25350 =C2=B1  9%  softirqs.CPU10.RCU
>      21455 =C2=B1  3%     +10.2%      23647 =C2=B1  9%  softirqs.CPU100.R=
CU
>      21461 =C2=B1  4%     +10.3%      23667 =C2=B1  9%  softirqs.CPU101.R=
CU
>      21189 =C2=B1  4%     +13.6%      24068 =C2=B1  8%  softirqs.CPU102.R=
CU
>      24371            -9.0%      22167        softirqs.CPU104.SCHED
>      21067 =C2=B1  4%     +12.8%      23755 =C2=B1  9%  softirqs.CPU106.R=
CU
>      24278            -9.2%      22048        softirqs.CPU106.SCHED
>      21016 =C2=B1  4%     +11.3%      23393 =C2=B1  9%  softirqs.CPU107.R=
CU
>      22725 =C2=B1  2%     +12.1%      25483 =C2=B1  9%  softirqs.CPU11.RCU
>      24398 =C2=B1  3%     -10.2%      21905        softirqs.CPU112.SCHED
>      24273            -8.7%      22164 =C2=B1  3%  softirqs.CPU118.SCHED
>      21129 =C2=B1  6%     +13.9%      24061 =C2=B1 10%  softirqs.CPU124.R=
CU
>      24279 =C2=B1  2%      -8.8%      22131        softirqs.CPU124.SCHED
>      21043 =C2=B1  6%     +14.1%      24001 =C2=B1 11%  softirqs.CPU125.R=
CU
>      24386 =C2=B1  2%      -9.0%      22191 =C2=B1  2%  softirqs.CPU125.S=
CHED
>      21265 =C2=B1  6%     +11.5%      23713 =C2=B1  9%  softirqs.CPU126.R=
CU
>      21252 =C2=B1  4%     +11.4%      23668 =C2=B1 10%  softirqs.CPU128.R=
CU
>      21108 =C2=B1  2%     +14.9%      24251 =C2=B1 10%  softirqs.CPU130.R=
CU
>      22874 =C2=B1  6%     +15.9%      26504 =C2=B1  8%  softirqs.CPU14.RCU
>      24210 =C2=B1  2%     -10.8%      21589        softirqs.CPU143.SCHED
>      18979 =C2=B1  4%     +22.4%      23230 =C2=B1  8%  softirqs.CPU144.R=
CU
>      19429 =C2=B1  3%     +22.3%      23771 =C2=B1  4%  softirqs.CPU145.R=
CU
>      20931           +16.3%      24335 =C2=B1  8%  softirqs.CPU154.RCU
>      24599           -10.0%      22140        softirqs.CPU154.SCHED
>      20892           +16.0%      24242 =C2=B1  9%  softirqs.CPU155.RCU
>      21370 =C2=B1  4%     +10.5%      23608 =C2=B1  9%  softirqs.CPU156.R=
CU
>      21314 =C2=B1  5%     +11.6%      23777 =C2=B1 11%  softirqs.CPU158.R=
CU
>      21277 =C2=B1  6%     +11.3%      23687 =C2=B1 11%  softirqs.CPU159.R=
CU
>      24249            -9.0%      22063        softirqs.CPU159.SCHED
>      21393 =C2=B1  5%     +11.8%      23909 =C2=B1 11%  softirqs.CPU162.R=
CU
>      24327            -8.7%      22218        softirqs.CPU163.SCHED
>      21210 =C2=B1  4%     +12.6%      23876 =C2=B1 10%  softirqs.CPU167.R=
CU
>      21140 =C2=B1  5%     +12.6%      23802 =C2=B1 10%  softirqs.CPU168.R=
CU
>      21020 =C2=B1  5%     +13.5%      23850 =C2=B1 10%  softirqs.CPU169.R=
CU
>      24358            -9.4%      22078        softirqs.CPU172.SCHED
>      21484 =C2=B1  5%     +10.3%      23703 =C2=B1 10%  softirqs.CPU173.R=
CU
>      24382            -9.6%      22032        softirqs.CPU174.SCHED
>      24367            -9.5%      22057        softirqs.CPU177.SCHED
>      20803 =C2=B1  4%     +12.9%      23478 =C2=B1 10%  softirqs.CPU179.R=
CU
>      22584 =C2=B1  5%     +15.0%      25972 =C2=B1 10%  softirqs.CPU18.RCU
>      24247            -8.2%      22264        softirqs.CPU181.SCHED
>      20851 =C2=B1  5%     +13.1%      23589 =C2=B1 11%  softirqs.CPU184.R=
CU
>      24551 =C2=B1  2%     -10.2%      22050        softirqs.CPU184.SCHED
>      20880 =C2=B1  5%     +13.9%      23790 =C2=B1 10%  softirqs.CPU185.R=
CU
>      24132 =C2=B1  2%      -8.8%      22015        softirqs.CPU186.SCHED
>      24251            -9.2%      22015        softirqs.CPU187.SCHED
>      21026 =C2=B1  3%     +13.2%      23797 =C2=B1 10%  softirqs.CPU189.R=
CU
>      22821 =C2=B1  6%     +12.1%      25576 =C2=B1 10%  softirqs.CPU19.RCU
>      24486           -10.8%      21839 =C2=B1  2%  softirqs.CPU190.SCHED
>      24292            -8.6%      22207        softirqs.CPU192.SCHED
>      20884 =C2=B1  2%     +14.2%      23857 =C2=B1 10%  softirqs.CPU193.R=
CU
>      21111 =C2=B1  5%     +12.1%      23675 =C2=B1 11%  softirqs.CPU196.R=
CU
>      24460            -9.9%      22047        softirqs.CPU196.SCHED
>      20702 =C2=B1  7%     +14.0%      23597 =C2=B1 10%  softirqs.CPU197.R=
CU
>      24545           -10.1%      22072        softirqs.CPU197.SCHED
>      20920 =C2=B1  7%     +13.7%      23780 =C2=B1  9%  softirqs.CPU199.R=
CU
>      20660 =C2=B1  5%     +12.5%      23251 =C2=B1 11%  softirqs.CPU200.R=
CU
>      20747 =C2=B1  3%     +14.0%      23656 =C2=B1 12%  softirqs.CPU202.R=
CU
>      24615            -9.6%      22257        softirqs.CPU202.SCHED
>      20846 =C2=B1  2%     +21.5%      25335 =C2=B1 12%  softirqs.CPU203.R=
CU
>      24636           -10.3%      22090 =C2=B1  2%  softirqs.CPU205.SCHED
>      22328 =C2=B1  3%     +15.8%      25862 =C2=B1 12%  softirqs.CPU21.RCU
>      20349           +15.3%      23456 =C2=B1 11%  softirqs.CPU210.RCU
>      20386 =C2=B1  2%     +23.6%      25205 =C2=B1 20%  softirqs.CPU211.R=
CU
>      20478 =C2=B1  3%     +14.1%      23371 =C2=B1 11%  softirqs.CPU213.R=
CU
>      20333 =C2=B1  5%     +15.6%      23495 =C2=B1 13%  softirqs.CPU215.R=
CU
>      24155            -9.2%      21928 =C2=B1  2%  softirqs.CPU215.SCHED
>      18162 =C2=B1  3%     +24.7%      22651 =C2=B1  7%  softirqs.CPU216.R=
CU
>      25190            -9.7%      22738 =C2=B1  3%  softirqs.CPU216.SCHED
>      18360 =C2=B1  4%     +23.2%      22614 =C2=B1  7%  softirqs.CPU217.R=
CU
>      24237 =C2=B1  2%      -8.1%      22272        softirqs.CPU225.SCHED
>      20422           +13.8%      23242 =C2=B1 10%  softirqs.CPU226.RCU
>      24806           -10.3%      22250        softirqs.CPU226.SCHED
>      20823 =C2=B1  2%     +19.8%      24953 =C2=B1  6%  softirqs.CPU227.R=
CU
>      24437            -9.1%      22222        softirqs.CPU227.SCHED
>      21002 =C2=B1  5%     +11.3%      23373 =C2=B1 10%  softirqs.CPU231.R=
CU
>      21167 =C2=B1  3%     +12.3%      23762 =C2=B1 10%  softirqs.CPU233.R=
CU
>      24339            -8.3%      22309        softirqs.CPU235.SCHED
>      20858 =C2=B1  3%     +10.8%      23110 =C2=B1  9%  softirqs.CPU244.R=
CU
>      24384            -9.6%      22051        softirqs.CPU248.SCHED
>      22332 =C2=B1  4%     +20.3%      26857 =C2=B1 10%  softirqs.CPU25.RCU
>      20874 =C2=B1  6%     +10.9%      23150 =C2=B1  9%  softirqs.CPU250.R=
CU
>      20662 =C2=B1  6%     +14.5%      23662 =C2=B1 11%  softirqs.CPU256.R=
CU
>      20881 =C2=B1  4%     +12.4%      23475 =C2=B1 11%  softirqs.CPU257.R=
CU
>      24551            -9.5%      22214        softirqs.CPU257.SCHED
>      24374            -8.8%      22235        softirqs.CPU259.SCHED
>      20778 =C2=B1  2%     +15.3%      23947 =C2=B1 10%  softirqs.CPU260.R=
CU
>      20408 =C2=B1  5%     +14.2%      23302 =C2=B1 10%  softirqs.CPU262.R=
CU
>      20696 =C2=B1  2%     +15.1%      23818 =C2=B1  9%  softirqs.CPU265.R=
CU
>      20591 =C2=B1  7%     +14.6%      23590 =C2=B1 11%  softirqs.CPU268.R=
CU
>      20513 =C2=B1  7%     +14.5%      23485 =C2=B1 11%  softirqs.CPU269.R=
CU
>      20953 =C2=B1  5%     +11.8%      23428 =C2=B1 11%  softirqs.CPU270.R=
CU
>      20644 =C2=B1  3%     +16.0%      23945 =C2=B1 12%  softirqs.CPU274.R=
CU
>      20763 =C2=B1  3%     +15.7%      24029 =C2=B1 10%  softirqs.CPU275.R=
CU
>      20574 =C2=B1  2%     +17.7%      24215 =C2=B1 13%  softirqs.CPU282.R=
CU
>      24732            -8.6%      22617        softirqs.CPU283.SCHED
>      20319 =C2=B1  6%     +15.1%      23389 =C2=B1 12%  softirqs.CPU287.R=
CU
>      22456 =C2=B1  4%     +12.3%      25224 =C2=B1 10%  softirqs.CPU29.RCU
>      22391 =C2=B1  4%     +16.7%      26136 =C2=B1 14%  softirqs.CPU31.RCU
>      22143 =C2=B1  5%     +21.2%      26827 =C2=B1  6%  softirqs.CPU33.RCU
>      22046 =C2=B1  5%     +12.8%      24869 =C2=B1 10%  softirqs.CPU35.RCU
>      21547 =C2=B1  6%     +13.6%      24480 =C2=B1 11%  softirqs.CPU52.RCU
>      21463 =C2=B1  6%     +14.2%      24520 =C2=B1 11%  softirqs.CPU53.RCU
>      21656 =C2=B1  3%     +18.0%      25549 =C2=B1  8%  softirqs.CPU56.RCU
>      25128           -10.2%      22569        softirqs.CPU61.SCHED
>      21720 =C2=B1  2%     +14.2%      24795 =C2=B1  8%  softirqs.CPU65.RCU
>      21384 =C2=B1  3%     +13.5%      24272 =C2=B1 11%  softirqs.CPU66.RCU
>      21296 =C2=B1  2%     +13.2%      24107 =C2=B1 11%  softirqs.CPU67.RCU
>      22819 =C2=B1  4%     +16.0%      26481 =C2=B1  8%  softirqs.CPU7.RCU
>      19128 =C2=B1  4%     +21.9%      23325 =C2=B1  7%  softirqs.CPU72.RCU
>      25466            -9.6%      23025 =C2=B1  2%  softirqs.CPU72.SCHED
>      18951 =C2=B1  4%     +20.8%      22894 =C2=B1  9%  softirqs.CPU73.RCU
>      20806           +13.3%      23577 =C2=B1 10%  softirqs.CPU82.RCU
>      24461            -9.5%      22129        softirqs.CPU82.SCHED
>      24453            -9.4%      22150        softirqs.CPU83.SCHED
>      21372 =C2=B1  5%     +10.1%      23540 =C2=B1  9%  softirqs.CPU84.RCU
>      21577 =C2=B1  4%     +11.4%      24047 =C2=B1 10%  softirqs.CPU88.RCU
>      24407 =C2=B1  2%      -8.2%      22409        softirqs.CPU88.SCHED
>      21516 =C2=B1  5%     +13.0%      24319 =C2=B1 10%  softirqs.CPU90.RCU
>      31.50 =C2=B1  9%      -8.1       23.35 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.entry_SYSCALL_64_after_hwframe
>      30.37 =C2=B1  8%      -8.1       22.23        perf-profile.calltrace=
.cycles-
> pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      30.26 =C2=B1  8%      -8.1       22.12 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      30.99 =C2=B1  9%      -8.0       22.98 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      25.62 =C2=B1  7%      -7.8       17.83 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.schedule.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
>      25.53 =C2=B1  7%      -7.8       17.74 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.__schedule.schedule.futex_wait_queue_me.futex_wait.do_futex
>      26.03 =C2=B1  7%      -7.7       18.28 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
>      23.03 =C2=B1  6%      -7.6       15.47 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.pick_next_task_fair.__schedule.schedule.futex_wait_queue_me.futex_wait
>      22.95 =C2=B1  6%      -7.5       15.42 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.newidle_balance.pick_next_task_fair.__schedule.schedule.futex_wait_que=
ue_
> me
>      26.93 =C2=B1  7%      -7.5       19.47        perf-profile.calltrace=
.cycles-
> pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_aft=
er_
> hwframe
>      22.30 =C2=B1  6%      -7.3       15.03 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
>      21.64 =C2=B1  6%      -7.0       14.59 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__=
sch
> edule
>      21.49 =C2=B1  6%      -7.0       14.51 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pic=
k_n
> ext_task_fair
>       5.58 =C2=B1  7%      -2.3        3.32 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.idle_cpu.update_sd_lb_stats.find_busiest_group.load_balance.newidle_ba=
lan
> ce
>       2.23 =C2=B1 17%      -0.9        1.30 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.try_to_wake_up.wake_up_q.futex_wake.do_futex.__x64_sys_futex
>       2.28 =C2=B1 17%      -0.9        1.36 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.wake_up_q.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
>       3.21 =C2=B1 17%      -0.7        2.53 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_aft=
er_
> hwframe
>       1.10 =C2=B1  7%      -0.5        0.60        perf-profile.calltrace=
.cycles-
> pp.cpumask_next_and.update_sd_lb_stats.find_busiest_group.load_balance.ne=
wid
> le_balance
>       0.99            -0.3        0.67        perf-profile.calltrace.cycl=
es-
> pp.finish_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
>       2.31 =C2=B1  8%      -0.3        2.01        perf-profile.calltrace=
.cycles-
> pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       2.36 =C2=B1  8%      -0.3        2.06        perf-profile.calltrace=
.cycles-
> pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>       0.93 =C2=B1 26%      -0.2        0.68 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.irqtime_account_process_tick.update_process_times.tick_sched_handle.ti=
ck_
> sched_timer.__hrtimer_run_queues
>       0.66 =C2=B1  7%      +0.1        0.74 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interr=
upt
> .asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt
>       0.80 =C2=B1  2%      +0.1        0.89        perf-profile.calltrace=
.cycles-
> pp.timerqueue_del.__remove_hrtimer.__hrtimer_run_queues.hrtimer_interrupt=
.__
> sysvec_apic_timer_interrupt
>       0.55            +0.1        0.64 =C2=B1 12%  perf-profile.calltrace=
.cycles-
> pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_ha=
ndl
> e.tick_sched_timer
>       0.75 =C2=B1 17%      +0.2        0.93 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get_sleep_leng=
th.
> menu_select.do_idle
>       4.02 =C2=B1  2%      +0.2        4.23        perf-profile.calltrace=
.cycles-
> pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer=
.__
> hrtimer_run_queues
>       0.38 =C2=B1 70%      +0.2        0.61 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.hrtimer_next_event_without.tick_nohz_get_sleep_length.menu_select.do_i=
dle
> .cpu_startup_entry
>       0.90 =C2=B1 13%      +0.3        1.16 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_sched_=
tim
> er.__hrtimer_run_queues
>       0.74 =C2=B1 18%      +0.3        1.03 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.futex_wait_setup.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
>       1.45 =C2=B1 12%      +0.3        1.73 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_idle.cp=
u_s
> tartup_entry
>       0.49 =C2=B1 70%      +0.3        0.81 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.irqtime_account_irq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysve=
c_a
> pic_timer_interrupt.cpuidle_enter_state
>       2.33 =C2=B1  8%      +0.3        2.67 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.rcu_eqs_exit.rcu_idle_exit.cpuidle_enter_state.cpuidle_enter.do_idle
>       0.19 =C2=B1141%      +0.4        0.57 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_timer_int=
err
> upt.asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt
>       2.56 =C2=B1  8%      +0.4        2.94 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.rcu_idle_exit.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_en=
try
>       2.32 =C2=B1 11%      +0.4        2.74 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_entry.start=
_se
> condary
>       0.53 =C2=B1 70%      +0.5        1.02 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.run_local_timers.update_process_times.tick_sched_handle.tick_sched_tim=
er.
> __hrtimer_run_queues
>       0.18 =C2=B1141%      +0.5        0.68 =C2=B1 12%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock.futex_wait_setup.futex_wait.do_futex.__x64_sys_futex
>       0.00            +0.5        0.51        perf-profile.calltrace.cycl=
es-
> pp.irqentry_enter.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_inter=
rup
> t.cpuidle_enter_state.cpuidle_enter
>       3.51 =C2=B1 11%      +0.6        4.11 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interru=
pt.
> cpuidle_enter_state.cpuidle_enter
>       7.00 =C2=B1  2%      +0.6        7.60        perf-profile.calltrace=
.cycles-
> pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_=
tim
> er_interrupt.asm_call_sysvec_on_stack
>       0.00            +0.7        0.65 =C2=B1 11%  perf-profile.calltrace=
.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_wait_setup.futex=
_wa
> it.do_futex
>       2.85 =C2=B1  5%      +0.7        3.54 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_=
tim
> er_interrupt.sysvec_apic_timer_interrupt
>       4.41 =C2=B1  3%      +0.8        5.17 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.s=
ysv
> ec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       5.17 =C2=B1  2%      +0.8        5.99 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_inte=
rru
> pt.asm_sysvec_apic_timer_interrupt
>       5.47            +0.9        6.32 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_a=
pic
> _timer_interrupt
>       4.89 =C2=B1  8%      +0.9        5.80 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startu=
p_6
> 4_no_verify
>      13.84 =C2=B1  2%      +0.9       14.77        perf-profile.calltrace=
.cycles-
> pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.a=
sm_
> call_sysvec_on_stack.sysvec_apic_timer_interrupt
>       8.46            +1.0        9.45 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_=
que
> ues.hrtimer_interrupt
>       9.08            +1.1       10.14 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interr=
upt
> .__sysvec_apic_timer_interrupt
>       6.91 =C2=B1  2%      +1.1        8.04 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       7.22 =C2=B1  3%      +1.2        8.45 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.asm_sysvec_apic_timer_interrupt
>      17.40            +1.5       18.88        perf-profile.calltrace.cycl=
es-
> pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.asm_call_sysvec_on_sta=
ck.
> sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>      18.58            +1.7       20.23        perf-profile.calltrace.cycl=
es-
> pp.__sysvec_apic_timer_interrupt.asm_call_sysvec_on_stack.sysvec_apic_tim=
er_
> interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>      18.79            +1.7       20.49        perf-profile.calltrace.cycl=
es-
> pp.asm_call_sysvec_on_stack.sysvec_apic_timer_interrupt.asm_sysvec_apic_t=
ime
> r_interrupt.cpuidle_enter_state.cpuidle_enter
>      26.37 =C2=B1  3%      +2.7       29.08        perf-profile.calltrace=
.cycles-
> pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_en=
ter
> _state.cpuidle_enter.do_idle
>      28.54 =C2=B1  4%      +3.0       31.59        perf-profile.calltrace=
.cycles-
> pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_i=
dle
> .cpu_startup_entry
>      43.88 =C2=B1  7%      +4.8       48.73        perf-profile.calltrace=
.cycles-
> pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_seco=
nda
> ry
>      44.97 =C2=B1  7%      +5.0       49.94        perf-profile.calltrace=
.cycles-
> pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>      58.35 =C2=B1  5%      +6.5       64.81        perf-profile.calltrace=
.cycles-
> pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_veri=
fy
>      58.45 =C2=B1  5%      +6.5       64.94        perf-profile.calltrace=
.cycles-
> pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      58.46 =C2=B1  5%      +6.5       64.95        perf-profile.calltrace=
.cycles-
> pp.start_secondary.secondary_startup_64_no_verify
>      58.57 =C2=B1  5%      +6.6       65.16        perf-profile.calltrace=
.cycles-
> pp.secondary_startup_64_no_verify
>      32.18 =C2=B1  9%      -8.2       24.03 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.entry_SYSCALL_64_after_hwframe
>      28.13 =C2=B1  7%      -8.1       19.98 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.__schedule
>      30.27 =C2=B1  8%      -8.1       22.13        perf-profile.children.=
cycles-p
> p.do_futex
>      30.37 =C2=B1  8%      -8.1       22.24        perf-profile.children.=
cycles-p
> p.__x64_sys_futex
>      31.66 =C2=B1  9%      -8.0       23.64 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.do_syscall_64
>      25.87 =C2=B1  7%      -7.8       18.03 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.schedule
>      26.04 =C2=B1  7%      -7.8       18.29        perf-profile.children.=
cycles-p
> p.futex_wait_queue_me
>      23.71 =C2=B1  6%      -7.6       16.12 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.pick_next_task_fair
>      23.16 =C2=B1  6%      -7.6       15.57 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.newidle_balance
>      26.94 =C2=B1  7%      -7.5       19.48        perf-profile.children.=
cycles-p
> p.futex_wait
>      23.38 =C2=B1  6%      -7.3       16.05 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.load_balance
>      22.45 =C2=B1  6%      -7.1       15.32 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.find_busiest_group
>      22.31 =C2=B1  6%      -7.1       15.22 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.update_sd_lb_stats
>       6.12 =C2=B1  3%      -2.1        4.03 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.idle_cpu
>       2.29 =C2=B1 17%      -0.9        1.37 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.wake_up_q
>       2.32 =C2=B1 17%      -0.9        1.40 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.try_to_wake_up
>       3.21 =C2=B1 17%      -0.7        2.54 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.futex_wake
>       1.32 =C2=B1  6%      -0.6        0.77        perf-profile.children.=
cycles-p
> p.cpumask_next_and
>       1.06 =C2=B1 10%      -0.5        0.59        perf-profile.children.=
cycles-p
> p._find_next_bit
>       0.77 =C2=B1 19%      -0.4        0.39 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.select_task_rq_fair
>       1.33            -0.4        0.98        perf-profile.children.cycle=
s-p
> p.finish_task_switch
>       1.09 =C2=B1 30%      -0.3        0.78 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.irqtime_account_process_tick
>       2.37 =C2=B1  8%      -0.3        2.07        perf-profile.children.=
cycles-p
> p.schedule_idle
>       0.52 =C2=B1  8%      -0.2        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.asm_sysvec_call_function_single
>       0.48 =C2=B1  8%      -0.2        0.26 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sysvec_call_function_single
>       0.30 =C2=B1 22%      -0.2        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.select_idle_sibling
>       0.42 =C2=B1  8%      -0.2        0.23 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.__sysvec_call_function_single
>       0.91 =C2=B1 10%      -0.1        0.77 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.update_blocked_averages
>       0.27 =C2=B1 14%      -0.1        0.14 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.switch_fpu_return
>       0.41 =C2=B1 14%      -0.1        0.29 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.syscall_exit_to_user_mode
>       0.36 =C2=B1  9%      -0.1        0.25 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.exit_to_user_mode_prepare
>       0.19 =C2=B1 20%      -0.1        0.09        perf-profile.children.=
cycles-p
> p.__update_idle_core
>       0.21 =C2=B1 22%      -0.1        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.set_next_task_idle
>       0.23 =C2=B1 20%      -0.1        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.pick_next_task_idle
>       0.21 =C2=B1 16%      -0.1        0.13 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.available_idle_cpu
>       0.12 =C2=B1 15%      -0.1        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__bitmap_and
>       0.11 =C2=B1 15%      -0.0        0.07        perf-profile.children.=
cycles-p
> p.update_rt_rq_load_avg
>       0.08 =C2=B1  6%      -0.0        0.05        perf-profile.children.=
cycles-p
> p.find_next_and_bit
>       0.12            +0.0        0.13        perf-profile.children.cycle=
s-p
> p.can_stop_idle_tick
>       0.07 =C2=B1  7%      +0.0        0.08        perf-profile.children.=
cycles-p
> p.process_one_work
>       0.06 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.tick_check_oneshot_broadcast_this_cpu
>       0.09 =C2=B1  5%      +0.0        0.11        perf-profile.children.=
cycles-p
> p.tick_check_broadcast_expired
>       0.07            +0.0        0.09 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.__irqentry_text_end
>       0.16 =C2=B1  2%      +0.0        0.18        perf-profile.children.=
cycles-p
> p.__x86_indirect_thunk_rax
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_tick_stopped
>       0.08 =C2=B1  6%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.worker_thread
>       0.13 =C2=B1  3%      +0.0        0.16 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.menu_reflect
>       0.27 =C2=B1  4%      +0.0        0.30 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_lock_irq
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.__might_sleep
>       0.08 =C2=B1 24%      +0.0        0.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.irqentry_exit_to_user_mode
>       0.44            +0.0        0.47        perf-profile.children.cycle=
s-p
> p.read_tsc
>       0.16 =C2=B1 15%      +0.0        0.20 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.irq_work_needs_cpu
>       0.11 =C2=B1 11%      +0.0        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.tick_sched_do_timer
>       0.48 =C2=B1  6%      +0.0        0.53 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.cpuidle_governor_latency_req
>       0.11 =C2=B1 26%      +0.1        0.16 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.rcu_needs_cpu
>       0.34 =C2=B1 10%      +0.1        0.39 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.native_irq_return_iret
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.poll_idle
>       0.56            +0.1        0.62 =C2=B1  7%  perf-profile.children.=
cycles-p
> p.run_posix_cpu_timers
>       0.21 =C2=B1 15%      +0.1        0.27        perf-profile.children.=
cycles-p
> p.rcu_eqs_enter
>       0.16 =C2=B1 16%      +0.1        0.22 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.sync_regs
>       0.79 =C2=B1  8%      +0.1        0.87 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_unlock_irqrestore
>       0.50 =C2=B1 10%      +0.1        0.58 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.__hrtimer_next_event_base
>       0.54 =C2=B1 12%      +0.1        0.63 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.hrtimer_next_event_without
>       0.11 =C2=B1  4%      +0.1        0.21 =C2=B1 30%  perf-profile.chil=
dren.cycles-p
> p.start_kernel
>       0.81 =C2=B1  5%      +0.1        0.91 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.clockevents_program_event
>       0.60 =C2=B1 10%      +0.1        0.70 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.irqentry_enter
>       0.23 =C2=B1 23%      +0.1        0.33 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.rcu_dynticks_task_exit
>       0.16 =C2=B1 36%      +0.1        0.26        perf-profile.children.=
cycles-p
> p.rcu_nmi_exit
>       0.22 =C2=B1 31%      +0.1        0.33 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.irqentry_exit
>       0.78 =C2=B1  3%      +0.1        0.89 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.rb_next
>       1.02            +0.1        1.14 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.timerqueue_del
>       0.71 =C2=B1  4%      +0.1        0.84 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.perf_event_task_tick
>       0.77 =C2=B1 17%      +0.2        0.95 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.get_next_timer_interrupt
>       0.55 =C2=B1 34%      +0.2        0.75 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.ktime_get_update_offsets_now
>       4.19 =C2=B1  2%      +0.2        4.40        perf-profile.children.=
cycles-p
> p.scheduler_tick
>       1.48 =C2=B1  2%      +0.2        1.72 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_lock_irqsave
>       1.65 =C2=B1  7%      +0.3        1.94        perf-profile.children.=
cycles-p
> p.ktime_get
>       0.74 =C2=B1 17%      +0.3        1.03 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.futex_wait_setup
>       1.48 =C2=B1 12%      +0.3        1.77 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_next_event
>       2.34 =C2=B1  8%      +0.3        2.69 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.rcu_eqs_exit
>       1.82 =C2=B1 11%      +0.4        2.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_lock
>       2.58 =C2=B1  8%      +0.4        2.96 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.rcu_idle_exit
>       1.25 =C2=B1 12%      +0.4        1.67 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.rcu_sched_clock_irq
>       2.35 =C2=B1 11%      +0.4        2.78 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_get_sleep_length
>       0.82 =C2=B1 19%      +0.5        1.27 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.native_queued_spin_lock_slowpath
>       0.83 =C2=B1 35%      +0.6        1.39 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.run_local_timers
>       4.10 =C2=B1 12%      +0.7        4.83 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.irq_exit_rcu
>       4.92 =C2=B1  8%      +0.9        5.85 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.menu_select
>       8.81            +1.0        9.82 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.update_process_times
>       9.46            +1.1       10.52 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.tick_sched_handle
>      10.26 =C2=B1  2%      +1.3       11.58        perf-profile.children.=
cycles-p
> p.tick_sched_timer
>      22.78            +1.6       24.37        perf-profile.children.cycle=
s-p
> p.asm_call_sysvec_on_stack
>      19.06 =C2=B1  2%      +1.7       20.80        perf-profile.children.=
cycles-p
> p.__hrtimer_run_queues
>      23.71            +2.4       26.08        perf-profile.children.cycle=
s-p
> p.hrtimer_interrupt
>      25.08            +2.5       27.62        perf-profile.children.cycle=
s-p
> p.__sysvec_apic_timer_interrupt
>      34.74 =C2=B1  3%      +3.9       38.61        perf-profile.children.=
cycles-p
> p.sysvec_apic_timer_interrupt
>      36.40 =C2=B1  4%      +4.2       40.62        perf-profile.children.=
cycles-p
> p.asm_sysvec_apic_timer_interrupt
>      44.96 =C2=B1  7%      +5.0       49.98        perf-profile.children.=
cycles-p
> p.cpuidle_enter_state
>      45.06 =C2=B1  7%      +5.0       50.10        perf-profile.children.=
cycles-p
> p.cpuidle_enter
>      58.46 =C2=B1  5%      +6.5       64.95        perf-profile.children.=
cycles-p
> p.start_secondary
>      58.57 =C2=B1  5%      +6.6       65.16        perf-profile.children.=
cycles-p
> p.secondary_startup_64_no_verify
>      58.57 =C2=B1  5%      +6.6       65.16        perf-profile.children.=
cycles-p
> p.cpu_startup_entry
>      58.56 =C2=B1  5%      +6.6       65.16        perf-profile.children.=
cycles-p
> p.do_idle
>      15.26 =C2=B1  5%      -4.4       10.84 =C2=B1  4%  perf-profile.self=
.cycles-pp.up
> date_sd_lb_stats
>       6.09 =C2=B1  3%      -2.1        4.02 =C2=B1  4%  perf-profile.self=
.cycles-pp.id
> le_cpu
>       1.04 =C2=B1 10%      -0.5        0.58 =C2=B1  2%  perf-profile.self=
.cycles-pp._f
> ind_next_bit
>       1.09 =C2=B1 30%      -0.3        0.78 =C2=B1  7%  perf-profile.self=
.cycles-pp.ir
> qtime_account_process_tick
>       0.64 =C2=B1  8%      -0.2        0.49 =C2=B1  5%  perf-profile.self=
.cycles-pp.lo
> ad_balance
>       0.26 =C2=B1 14%      -0.1        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp.sw
> itch_fpu_return
>       0.27            -0.1        0.16        perf-profile.self.cycles-pp=
.cp
> umask_next_and
>       0.31 =C2=B1 19%      -0.1        0.23 =C2=B1  2%  perf-profile.self=
.cycles-pp.se
> lect_task_rq_fair
>       0.21 =C2=B1 16%      -0.1        0.13 =C2=B1 10%  perf-profile.self=
.cycles-pp.av
> ailable_idle_cpu
>       0.49 =C2=B1  4%      -0.1        0.43 =C2=B1  3%  perf-profile.self=
.cycles-pp.sc
> heduler_tick
>       0.29 =C2=B1 10%      -0.0        0.25        perf-profile.self.cycl=
es-pp.up
> date_blocked_averages
>       0.26 =C2=B1  9%      -0.0        0.22 =C2=B1  3%  perf-profile.self=
.cycles-pp.ne
> widle_balance
>       0.11 =C2=B1 16%      -0.0        0.07 =C2=B1 11%  perf-profile.self=
.cycles-pp.__
> bitmap_and
>       0.13 =C2=B1 14%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.fi
> nd_busiest_group
>       0.10 =C2=B1 18%      -0.0        0.07        perf-profile.self.cycl=
es-pp.up
> date_rt_rq_load_avg
>       0.11 =C2=B1  4%      +0.0        0.12        perf-profile.self.cycl=
es-pp.ca
> n_stop_idle_tick
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.ti
> ck_check_broadcast_expired
>       0.07            +0.0        0.09 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__
> irqentry_text_end
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  8%  perf-profile.self=
.cycles-pp.sc
> hed_idle_set_state
>       0.08 =C2=B1  5%      +0.0        0.10 =C2=B1  9%  perf-profile.self=
.cycles-pp.ti
> ck_nohz_tick_stopped
>       0.27 =C2=B1  6%      +0.0        0.29 =C2=B1  3%  perf-profile.self=
.cycles-pp._r
> aw_spin_lock_irq
>       0.12 =C2=B1  6%      +0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.cl
> ockevents_program_event
>       0.14 =C2=B1  8%      +0.0        0.17        perf-profile.self.cycl=
es-pp.sc
> hed_clock
>       0.22 =C2=B1  4%      +0.0        0.25 =C2=B1  3%  perf-profile.self=
.cycles-pp.ti
> ck_nohz_get_sleep_length
>       0.13 =C2=B1  3%      +0.0        0.16 =C2=B1 10%  perf-profile.self=
.cycles-pp.rc
> u_is_cpu_rrupt_from_idle
>       0.10 =C2=B1  9%      +0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.pl
> ist_add
>       0.43            +0.0        0.46        perf-profile.self.cycles-pp=
.re
> ad_tsc
>       0.09 =C2=B1 14%      +0.0        0.12        perf-profile.self.cycl=
es-pp.ti
> ck_sched_do_timer
>       0.27 =C2=B1 12%      +0.0        0.31 =C2=B1  4%  perf-profile.self=
.cycles-pp.ti
> ck_nohz_next_event
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.pl
> ace_entity
>       0.05 =C2=B1 71%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.cp
> uacct_account_field
>       0.16 =C2=B1  5%      +0.0        0.21 =C2=B1  2%  perf-profile.self=
.cycles-pp.ir
> qentry_enter
>       0.02 =C2=B1141%      +0.0        0.06        perf-profile.self.cycl=
es-pp.__
> might_sleep
>       0.11 =C2=B1 26%      +0.0        0.15 =C2=B1  6%  perf-profile.self=
.cycles-pp.rc
> u_needs_cpu
>       0.42 =C2=B1  2%      +0.0        0.47        perf-profile.self.cycl=
es-pp.__
> hrtimer_next_event_base
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.ar
> ch_cpu_idle_enter
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.ir
> qentry_exit_to_user_mode
>       0.23 =C2=B1  8%      +0.1        0.29 =C2=B1  4%  perf-profile.self=
.cycles-pp.as
> m_sysvec_apic_timer_interrupt
>       0.55 =C2=B1  5%      +0.1        0.60 =C2=B1  4%  perf-profile.self=
.cycles-pp.ti
> merqueue_add
>       0.56            +0.1        0.62 =C2=B1  7%  perf-profile.self.cycl=
es-pp.ru
> n_posix_cpu_timers
>       0.15 =C2=B1 21%      +0.1        0.21 =C2=B1  4%  perf-profile.self=
.cycles-pp.rc
> u_eqs_enter
>       0.16 =C2=B1 16%      +0.1        0.22 =C2=B1  7%  perf-profile.self=
.cycles-pp.sy
> nc_regs
>       0.50 =C2=B1  7%      +0.1        0.56        perf-profile.self.cycl=
es-pp.up
> date_curr
>       0.23 =C2=B1 23%      +0.1        0.32 =C2=B1  2%  perf-profile.self=
.cycles-pp.rc
> u_dynticks_task_exit
>       0.66 =C2=B1  8%      +0.1        0.76 =C2=B1  3%  perf-profile.self=
.cycles-pp._r
> aw_spin_unlock_irqrestore
>       0.15 =C2=B1 38%      +0.1        0.25        perf-profile.self.cycl=
es-pp.rc
> u_nmi_exit
>       0.56 =C2=B1 12%      +0.1        0.66 =C2=B1  8%  perf-profile.self=
.cycles-pp.ir
> q_enter_rcu
>       0.52 =C2=B1 13%      +0.1        0.63 =C2=B1  7%  perf-profile.self=
.cycles-pp.do
> _idle
>       0.77 =C2=B1  3%      +0.1        0.89        perf-profile.self.cycl=
es-pp.rb
> _next
>       0.71 =C2=B1  4%      +0.1        0.84 =C2=B1 11%  perf-profile.self=
.cycles-pp.pe
> rf_event_task_tick
>       1.07 =C2=B1 11%      +0.1        1.21        perf-profile.self.cycl=
es-pp.__
> sysvec_apic_timer_interrupt
>       0.46 =C2=B1 39%      +0.2        0.64 =C2=B1  3%  perf-profile.self=
.cycles-pp.kt
> ime_get_update_offsets_now
>       0.81 =C2=B1  4%      +0.2        1.00 =C2=B1  3%  perf-profile.self=
.cycles-pp.rc
> u_eqs_exit
>       1.30 =C2=B1  4%      +0.2        1.50 =C2=B1  6%  perf-profile.self=
.cycles-pp._r
> aw_spin_lock_irqsave
>       1.46 =C2=B1  6%      +0.2        1.68        perf-profile.self.cycl=
es-pp.cp
> uidle_enter_state
>       1.20 =C2=B1 11%      +0.3        1.47 =C2=B1  2%  perf-profile.self=
.cycles-pp.kt
> ime_get
>       3.06 =C2=B1  6%      +0.3        3.36 =C2=B1  2%  perf-profile.self=
.cycles-pp.__
> hrtimer_run_queues
>       0.83 =C2=B1 20%      +0.4        1.18 =C2=B1  5%  perf-profile.self=
.cycles-pp.rc
> u_sched_clock_irq
>       1.89 =C2=B1  4%      +0.4        2.28 =C2=B1  2%  perf-profile.self=
.cycles-pp.me
> nu_select
>       0.78 =C2=B1 19%      +0.4        1.21 =C2=B1  8%  perf-profile.self=
.cycles-pp.na
> tive_queued_spin_lock_slowpath
>       0.77 =C2=B1 37%      +0.6        1.33 =C2=B1  2%  perf-profile.self=
.cycles-pp.ru
> n_local_timers
>       1558 =C2=B1101%    +181.4%       4385 =C2=B1 50%  interrupts.40:IR-=
PCI-MSI.41943
> 08-edge.eth0-TxRx-3
>    5239280 =C2=B1  3%     -36.2%    3343903 =C2=B1  2%  interrupts.CAL:Fu=
nction_call_i
> nterrupts
>     702.33 =C2=B1 23%    +103.3%       1427 =C2=B1 29%  interrupts.CPU0.N=
MI:Non-maskab
> le_interrupts
>     702.33 =C2=B1 23%    +103.3%       1427 =C2=B1 29%  interrupts.CPU0.P=
MI:Performanc
> e_monitoring_interrupts
>     760.33 =C2=B1 27%     -58.6%     314.67 =C2=B1  9%  interrupts.CPU0.R=
ES:Rescheduli
> ng_interrupts
>     967.67 =C2=B1  8%     +88.6%       1824 =C2=B1  5%  interrupts.CPU0.T=
LB:TLB_shootd
> owns
>      10778 =C2=B1 10%     -11.3%       9555 =C2=B1  8%  interrupts.CPU1.C=
AL:Function_c
> all_interrupts
>     527.00 =C2=B1 30%     -46.0%     284.33 =C2=B1  3%  interrupts.CPU1.R=
ES:Rescheduli
> ng_interrupts
>       1248 =C2=B1  5%     +82.8%       2281 =C2=B1 16%  interrupts.CPU1.T=
LB:TLB_shootd
> owns
>      16461 =C2=B1 17%     -32.6%      11098        interrupts.CPU10.CAL:F=
unction_
> call_interrupts
>       1345 =C2=B1 11%     +60.6%       2160 =C2=B1  6%  interrupts.CPU10.=
NMI:Non-maska
> ble_interrupts
>       1345 =C2=B1 11%     +60.6%       2160 =C2=B1  6%  interrupts.CPU10.=
PMI:Performan
> ce_monitoring_interrupts
>      18022 =C2=B1  7%     -33.0%      12082 =C2=B1  8%  interrupts.CPU100=
.CAL:Function
> _call_interrupts
>     886.67 =C2=B1 24%     -75.4%     218.33 =C2=B1 26%  interrupts.CPU100=
.RES:Reschedu
> ling_interrupts
>      17990 =C2=B1  2%     -35.2%      11653 =C2=B1 12%  interrupts.CPU101=
.CAL:Function
> _call_interrupts
>     840.00 =C2=B1 26%     -77.0%     193.33 =C2=B1  9%  interrupts.CPU101=
.RES:Reschedu
> ling_interrupts
>      17939 =C2=B1  5%     -31.4%      12305 =C2=B1  3%  interrupts.CPU102=
.CAL:Function
> _call_interrupts
>     940.33 =C2=B1 33%     -74.2%     242.67 =C2=B1 15%  interrupts.CPU102=
.RES:Reschedu
> ling_interrupts
>      17695 =C2=B1 13%     -30.4%      12324 =C2=B1  2%  interrupts.CPU103=
.CAL:Function
> _call_interrupts
>     826.00 =C2=B1 28%     -74.9%     207.00 =C2=B1 11%  interrupts.CPU103=
.RES:Reschedu
> ling_interrupts
>      19276 =C2=B1  9%     -39.1%      11748 =C2=B1  2%  interrupts.CPU104=
.CAL:Function
> _call_interrupts
>      17703 =C2=B1  3%     -37.8%      11008 =C2=B1  4%  interrupts.CPU105=
.CAL:Function
> _call_interrupts
>     842.33 =C2=B1 22%     -39.2%     512.00 =C2=B1 54%  interrupts.CPU105=
.RES:Reschedu
> ling_interrupts
>      18357 =C2=B1  3%     -32.8%      12340 =C2=B1  9%  interrupts.CPU106=
.CAL:Function
> _call_interrupts
>     901.67 =C2=B1 19%     -73.9%     235.67 =C2=B1 39%  interrupts.CPU106=
.RES:Reschedu
> ling_interrupts
>      18258 =C2=B1  4%     -34.2%      12019 =C2=B1  4%  interrupts.CPU107=
.CAL:Function
> _call_interrupts
>     855.00 =C2=B1 22%     -56.5%     371.67 =C2=B1 68%  interrupts.CPU107=
.RES:Reschedu
> ling_interrupts
>      19008 =C2=B1 11%     -32.9%      12756 =C2=B1  4%  interrupts.CPU108=
.CAL:Function
> _call_interrupts
>     946.33 =C2=B1 30%     -62.7%     352.67 =C2=B1 68%  interrupts.CPU108=
.RES:Reschedu
> ling_interrupts
>       2525 =C2=B1 16%     +30.2%       3288 =C2=B1 12%  interrupts.CPU108=
.TLB:TLB_shoo
> tdowns
>      17326 =C2=B1  7%     -28.6%      12369 =C2=B1  2%  interrupts.CPU109=
.CAL:Function
> _call_interrupts
>     799.67 =C2=B1 23%     +41.9%       1135 =C2=B1  5%  interrupts.CPU109=
.NMI:Non-mask
> able_interrupts
>     799.67 =C2=B1 23%     +41.9%       1135 =C2=B1  5%  interrupts.CPU109=
.PMI:Performa
> nce_monitoring_interrupts
>     903.33 =C2=B1 31%     -63.8%     326.67 =C2=B1 69%  interrupts.CPU109=
.RES:Reschedu
> ling_interrupts
>      16002 =C2=B1 15%     -32.4%      10815 =C2=B1  2%  interrupts.CPU11.=
CAL:Function_
> call_interrupts
>     858.33 =C2=B1 26%     -47.2%     453.00 =C2=B1 41%  interrupts.CPU11.=
RES:Reschedul
> ing_interrupts
>      18842 =C2=B1  6%     -37.2%      11826 =C2=B1  3%  interrupts.CPU110=
.CAL:Function
> _call_interrupts
>       1031 =C2=B1 29%     -80.7%     198.67 =C2=B1  7%  interrupts.CPU110=
.RES:Reschedu
> ling_interrupts
>      20344 =C2=B1  4%     -37.4%      12733 =C2=B1  3%  interrupts.CPU111=
.CAL:Function
> _call_interrupts
>     888.33 =C2=B1 26%     -75.0%     222.33 =C2=B1 13%  interrupts.CPU111=
.RES:Reschedu
> ling_interrupts
>       2561 =C2=B1  8%     +24.1%       3177 =C2=B1  2%  interrupts.CPU111=
.TLB:TLB_shoo
> tdowns
>      18246 =C2=B1  2%     -31.3%      12528 =C2=B1  3%  interrupts.CPU112=
.CAL:Function
> _call_interrupts
>       1135 =C2=B1 19%     +70.6%       1937 =C2=B1 29%  interrupts.CPU112=
.NMI:Non-mask
> able_interrupts
>       1135 =C2=B1 19%     +70.6%       1937 =C2=B1 29%  interrupts.CPU112=
.PMI:Performa
> nce_monitoring_interrupts
>     854.00 =C2=B1 32%     -59.4%     347.00 =C2=B1 49%  interrupts.CPU112=
.RES:Reschedu
> ling_interrupts
>      17252 =C2=B1  7%     -27.1%      12570 =C2=B1  3%  interrupts.CPU113=
.CAL:Function
> _call_interrupts
>     816.00 =C2=B1 26%     -53.4%     380.33 =C2=B1 61%  interrupts.CPU113=
.RES:Reschedu
> ling_interrupts
>      19435 =C2=B1  6%     -35.6%      12518 =C2=B1  5%  interrupts.CPU114=
.CAL:Function
> _call_interrupts
>     920.00 =C2=B1 21%     -75.6%     224.67 =C2=B1 33%  interrupts.CPU114=
.RES:Reschedu
> ling_interrupts
>      19270 =C2=B1  7%     -38.7%      11805 =C2=B1  4%  interrupts.CPU115=
.CAL:Function
> _call_interrupts
>     860.67 =C2=B1 24%     -74.6%     218.33 =C2=B1 21%  interrupts.CPU115=
.RES:Reschedu
> ling_interrupts
>      17956 =C2=B1  5%     -31.7%      12258 =C2=B1  2%  interrupts.CPU116=
.CAL:Function
> _call_interrupts
>     986.33 =C2=B1 27%     -75.9%     237.33 =C2=B1 22%  interrupts.CPU116=
.RES:Reschedu
> ling_interrupts
>      18213 =C2=B1  7%     -35.7%      11719 =C2=B1  2%  interrupts.CPU117=
.CAL:Function
> _call_interrupts
>     755.67 =C2=B1 36%    +102.2%       1528 =C2=B1 30%  interrupts.CPU117=
.NMI:Non-mask
> able_interrupts
>     755.67 =C2=B1 36%    +102.2%       1528 =C2=B1 30%  interrupts.CPU117=
.PMI:Performa
> nce_monitoring_interrupts
>     838.00 =C2=B1 24%     -70.5%     247.33 =C2=B1 41%  interrupts.CPU117=
.RES:Reschedu
> ling_interrupts
>       2966 =C2=B1  7%     -17.1%       2460 =C2=B1  7%  interrupts.CPU117=
.TLB:TLB_shoo
> tdowns
>      18208 =C2=B1  7%     -36.6%      11538 =C2=B1  3%  interrupts.CPU118=
.CAL:Function
> _call_interrupts
>     616.00 =C2=B1 45%    +156.3%       1578 =C2=B1 35%  interrupts.CPU118=
.NMI:Non-mask
> able_interrupts
>     616.00 =C2=B1 45%    +156.3%       1578 =C2=B1 35%  interrupts.CPU118=
.PMI:Performa
> nce_monitoring_interrupts
>     888.67 =C2=B1 18%     -68.0%     284.00 =C2=B1 30%  interrupts.CPU118=
.RES:Reschedu
> ling_interrupts
>      18498 =C2=B1  3%     -39.7%      11147 =C2=B1  3%  interrupts.CPU119=
.CAL:Function
> _call_interrupts
>     646.67 =C2=B1 39%    +124.6%       1452 =C2=B1 36%  interrupts.CPU119=
.NMI:Non-mask
> able_interrupts
>     646.67 =C2=B1 39%    +124.6%       1452 =C2=B1 36%  interrupts.CPU119=
.PMI:Performa
> nce_monitoring_interrupts
>     870.00 =C2=B1 24%     -59.2%     355.33 =C2=B1 32%  interrupts.CPU119=
.RES:Reschedu
> ling_interrupts
>      19182 =C2=B1  3%     -45.5%      10453        interrupts.CPU12.CAL:F=
unction_
> call_interrupts
>       1003 =C2=B1 19%     -61.7%     384.33 =C2=B1 33%  interrupts.CPU12.=
RES:Reschedul
> ing_interrupts
>       3345 =C2=B1  7%     -30.4%       2329 =C2=B1  3%  interrupts.CPU12.=
TLB:TLB_shoot
> downs
>      18986 =C2=B1  7%     -35.7%      12213 =C2=B1  4%  interrupts.CPU120=
.CAL:Function
> _call_interrupts
>     951.33 =C2=B1 34%     -66.4%     319.33 =C2=B1 50%  interrupts.CPU120=
.RES:Reschedu
> ling_interrupts
>      18342 =C2=B1  4%     -36.3%      11692 =C2=B1  3%  interrupts.CPU121=
.CAL:Function
> _call_interrupts
>     879.00 =C2=B1 27%     -68.8%     274.33 =C2=B1 24%  interrupts.CPU121=
.RES:Reschedu
> ling_interrupts
>      19432 =C2=B1  7%     -37.0%      12240 =C2=B1  3%  interrupts.CPU122=
.CAL:Function
> _call_interrupts
>     994.67 =C2=B1 11%    +104.1%       2029 =C2=B1 30%  interrupts.CPU122=
.NMI:Non-mask
> able_interrupts
>     994.67 =C2=B1 11%    +104.1%       2029 =C2=B1 30%  interrupts.CPU122=
.PMI:Performa
> nce_monitoring_interrupts
>     992.00 =C2=B1 29%     -66.5%     332.33 =C2=B1 38%  interrupts.CPU122=
.RES:Reschedu
> ling_interrupts
>      19625 =C2=B1  9%     -38.6%      12048 =C2=B1  2%  interrupts.CPU123=
.CAL:Function
> _call_interrupts
>       1037 =C2=B1 12%     +88.1%       1951 =C2=B1 29%  interrupts.CPU123=
.NMI:Non-mask
> able_interrupts
>       1037 =C2=B1 12%     +88.1%       1951 =C2=B1 29%  interrupts.CPU123=
.PMI:Performa
> nce_monitoring_interrupts
>     899.67 =C2=B1 27%     -55.1%     403.67 =C2=B1 48%  interrupts.CPU123=
.RES:Reschedu
> ling_interrupts
>      17835 =C2=B1  9%     -36.5%      11324 =C2=B1  2%  interrupts.CPU124=
.CAL:Function
> _call_interrupts
>     898.33 =C2=B1 26%     -79.6%     183.67 =C2=B1  6%  interrupts.CPU124=
.RES:Reschedu
> ling_interrupts
>      17902 =C2=B1  7%     -35.4%      11565        interrupts.CPU125.CAL:=
Function
> _call_interrupts
>     902.33 =C2=B1 36%     -80.3%     178.00 =C2=B1  3%  interrupts.CPU125=
.RES:Reschedu
> ling_interrupts
>      17824 =C2=B1  6%     -34.8%      11628 =C2=B1 10%  interrupts.CPU126=
.CAL:Function
> _call_interrupts
>      17775 =C2=B1 10%     -35.7%      11432        interrupts.CPU127.CAL:=
Function
> _call_interrupts
>      18667 =C2=B1  4%     -36.1%      11921 =C2=B1  5%  interrupts.CPU128=
.CAL:Function
> _call_interrupts
>      18407 =C2=B1  9%     -37.1%      11584 =C2=B1  4%  interrupts.CPU129=
.CAL:Function
> _call_interrupts
>     871.67 =C2=B1 25%     -37.9%     541.33 =C2=B1 52%  interrupts.CPU129=
.RES:Reschedu
> ling_interrupts
>       2722 =C2=B1  8%     +10.1%       2997 =C2=B1  7%  interrupts.CPU129=
.TLB:TLB_shoo
> tdowns
>      17364 =C2=B1  4%     -37.9%      10791 =C2=B1  5%  interrupts.CPU13.=
CAL:Function_
> call_interrupts
>     947.33 =C2=B1 20%     -61.5%     365.00 =C2=B1 18%  interrupts.CPU13.=
RES:Reschedul
> ing_interrupts
>      18825 =C2=B1  8%     -37.6%      11747 =C2=B1  2%  interrupts.CPU130=
.CAL:Function
> _call_interrupts
>       1003 =C2=B1 30%     -75.4%     246.67 =C2=B1 48%  interrupts.CPU130=
.RES:Reschedu
> ling_interrupts
>      18432 =C2=B1  4%     -33.4%      12277 =C2=B1  6%  interrupts.CPU131=
.CAL:Function
> _call_interrupts
>     928.00 =C2=B1 31%     -71.6%     263.33 =C2=B1 43%  interrupts.CPU131=
.RES:Reschedu
> ling_interrupts
>      17860 =C2=B1  9%     -30.1%      12484 =C2=B1  2%  interrupts.CPU132=
.CAL:Function
> _call_interrupts
>      18406 =C2=B1 13%     -33.4%      12254 =C2=B1  4%  interrupts.CPU133=
.CAL:Function
> _call_interrupts
>      19524 =C2=B1  5%     -45.6%      10611 =C2=B1  3%  interrupts.CPU134=
.CAL:Function
> _call_interrupts
>     952.67 =C2=B1 33%     -81.8%     173.33 =C2=B1  3%  interrupts.CPU134=
.RES:Reschedu
> ling_interrupts
>      19894 =C2=B1  6%     -42.8%      11374 =C2=B1  7%  interrupts.CPU135=
.CAL:Function
> _call_interrupts
>     959.00 =C2=B1 30%     -80.4%     188.33 =C2=B1 19%  interrupts.CPU135=
.RES:Reschedu
> ling_interrupts
>       3101 =C2=B1  7%     -22.5%       2404 =C2=B1  7%  interrupts.CPU135=
.TLB:TLB_shoo
> tdowns
>      18691 =C2=B1 11%     -38.3%      11536 =C2=B1  7%  interrupts.CPU136=
.CAL:Function
> _call_interrupts
>     995.33 =C2=B1 32%     -72.8%     270.33 =C2=B1 44%  interrupts.CPU136=
.RES:Reschedu
> ling_interrupts
>      18764 =C2=B1 12%     -34.7%      12245 =C2=B1  3%  interrupts.CPU137=
.CAL:Function
> _call_interrupts
>       1418 =C2=B1 38%     +40.2%       1987 =C2=B1 27%  interrupts.CPU137=
.NMI:Non-mask
> able_interrupts
>       1418 =C2=B1 38%     +40.2%       1987 =C2=B1 27%  interrupts.CPU137=
.PMI:Performa
> nce_monitoring_interrupts
>     966.33 =C2=B1 32%     -81.9%     174.67        interrupts.CPU137.RES:=
Reschedu
> ling_interrupts
>      18622 =C2=B1  6%     -33.7%      12351        interrupts.CPU138.CAL:=
Function
> _call_interrupts
>       2685 =C2=B1  5%     +12.7%       3026 =C2=B1  7%  interrupts.CPU138=
.TLB:TLB_shoo
> tdowns
>      18120 =C2=B1  6%     -31.3%      12442 =C2=B1  3%  interrupts.CPU139=
.CAL:Function
> _call_interrupts
>     953.67 =C2=B1 16%     -54.0%     438.33 =C2=B1 54%  interrupts.CPU139=
.RES:Reschedu
> ling_interrupts
>       1558 =C2=B1101%    +181.4%       4385 =C2=B1 50%  interrupts.CPU14.=
40:IR-PCI-MSI
> .4194308-edge.eth0-TxRx-3
>      18993 =C2=B1  9%     -37.9%      11798 =C2=B1  4%  interrupts.CPU14.=
CAL:Function_
> call_interrupts
>     993.33 =C2=B1 27%     -56.3%     433.67 =C2=B1 27%  interrupts.CPU14.=
RES:Reschedul
> ing_interrupts
>      18018 =C2=B1 10%     -33.0%      12071 =C2=B1  6%  interrupts.CPU140=
.CAL:Function
> _call_interrupts
>      18975 =C2=B1  7%     -37.5%      11856 =C2=B1  4%  interrupts.CPU141=
.CAL:Function
> _call_interrupts
>      17072 =C2=B1  8%     -30.9%      11802 =C2=B1  2%  interrupts.CPU142=
.CAL:Function
> _call_interrupts
>     920.67 =C2=B1 39%     -68.0%     294.33 =C2=B1 38%  interrupts.CPU142=
.RES:Reschedu
> ling_interrupts
>      17352 =C2=B1  6%     -40.1%      10398 =C2=B1  6%  interrupts.CPU143=
.CAL:Function
> _call_interrupts
>     734.67 =C2=B1 13%     -70.4%     217.33 =C2=B1 50%  interrupts.CPU144=
.RES:Reschedu
> ling_interrupts
>       1767 =C2=B1 21%     +49.9%       2649 =C2=B1 15%  interrupts.CPU144=
.TLB:TLB_shoo
> tdowns
>     677.67 =C2=B1 33%     -71.6%     192.33 =C2=B1 13%  interrupts.CPU145=
.RES:Reschedu
> ling_interrupts
>       1485 =C2=B1 12%     +73.1%       2572 =C2=B1 13%  interrupts.CPU145=
.TLB:TLB_shoo
> tdowns
>      17442 =C2=B1  2%     -35.3%      11292 =C2=B1  7%  interrupts.CPU146=
.CAL:Function
> _call_interrupts
>     981.67 =C2=B1 22%     -79.1%     205.00 =C2=B1 35%  interrupts.CPU146=
.RES:Reschedu
> ling_interrupts
>      19123 =C2=B1 12%     -39.9%      11484 =C2=B1  5%  interrupts.CPU147=
.CAL:Function
> _call_interrupts
>       2089 =C2=B1 27%     -42.2%       1208        interrupts.CPU147.NMI:=
Non-mask
> able_interrupts
>       2089 =C2=B1 27%     -42.2%       1208        interrupts.CPU147.PMI:=
Performa
> nce_monitoring_interrupts
>       1002 =C2=B1 22%     -84.1%     159.33 =C2=B1  5%  interrupts.CPU147=
.RES:Reschedu
> ling_interrupts
>      17429 =C2=B1  6%     -32.3%      11805 =C2=B1  5%  interrupts.CPU148=
.CAL:Function
> _call_interrupts
>     857.00 =C2=B1 31%     -63.8%     310.33 =C2=B1 59%  interrupts.CPU148=
.RES:Reschedu
> ling_interrupts
>       3131 =C2=B1  7%     -16.7%       2610 =C2=B1 10%  interrupts.CPU148=
.TLB:TLB_shoo
> tdowns
>      17246 =C2=B1  8%     -32.7%      11605 =C2=B1  4%  interrupts.CPU149=
.CAL:Function
> _call_interrupts
>       2134 =C2=B1 30%     -44.2%       1191        interrupts.CPU149.NMI:=
Non-mask
> able_interrupts
>       2134 =C2=B1 30%     -44.2%       1191        interrupts.CPU149.PMI:=
Performa
> nce_monitoring_interrupts
>     827.67 =C2=B1 34%     -68.1%     264.33 =C2=B1 51%  interrupts.CPU149=
.RES:Reschedu
> ling_interrupts
>       2871 =C2=B1  4%     -14.3%       2462        interrupts.CPU149.TLB:=
TLB_shoo
> tdowns
>      17806 =C2=B1 10%     -38.6%      10934 =C2=B1  5%  interrupts.CPU15.=
CAL:Function_
> call_interrupts
>       1035 =C2=B1 25%     -53.0%     486.33 =C2=B1 42%  interrupts.CPU15.=
RES:Reschedul
> ing_interrupts
>      16391 =C2=B1 15%     -27.1%      11957 =C2=B1  5%  interrupts.CPU150=
.CAL:Function
> _call_interrupts
>       1036 =C2=B1  7%     +50.9%       1563 =C2=B1 37%  interrupts.CPU150=
.NMI:Non-mask
> able_interrupts
>       1036 =C2=B1  7%     +50.9%       1563 =C2=B1 37%  interrupts.CPU150=
.PMI:Performa
> nce_monitoring_interrupts
>     828.00 =C2=B1 32%     -76.8%     192.33 =C2=B1 25%  interrupts.CPU150=
.RES:Reschedu
> ling_interrupts
>      17598 =C2=B1 10%     -33.3%      11733 =C2=B1  5%  interrupts.CPU151=
.CAL:Function
> _call_interrupts
>       1064 =C2=B1  6%     +78.3%       1897 =C2=B1 28%  interrupts.CPU151=
.NMI:Non-mask
> able_interrupts
>       1064 =C2=B1  6%     +78.3%       1897 =C2=B1 28%  interrupts.CPU151=
.PMI:Performa
> nce_monitoring_interrupts
>     886.33 =C2=B1 37%     -81.1%     167.33 =C2=B1 18%  interrupts.CPU151=
.RES:Reschedu
> ling_interrupts
>       2617           +13.0%       2957 =C2=B1  6%  interrupts.CPU151.TLB:=
TLB_shoo
> tdowns
>      16585 =C2=B1 18%     -34.1%      10931 =C2=B1  6%  interrupts.CPU152=
.CAL:Function
> _call_interrupts
>     854.33 =C2=B1 14%     +86.9%       1597 =C2=B1 35%  interrupts.CPU152=
.NMI:Non-mask
> able_interrupts
>     854.33 =C2=B1 14%     +86.9%       1597 =C2=B1 35%  interrupts.CPU152=
.PMI:Performa
> nce_monitoring_interrupts
>     759.00 =C2=B1 38%     -78.7%     162.00 =C2=B1 11%  interrupts.CPU152=
.RES:Reschedu
> ling_interrupts
>      15942 =C2=B1 13%     -25.9%      11817        interrupts.CPU153.CAL:=
Function
> _call_interrupts
>     827.67 =C2=B1 16%     +91.8%       1587 =C2=B1 33%  interrupts.CPU153=
.NMI:Non-mask
> able_interrupts
>     827.67 =C2=B1 16%     +91.8%       1587 =C2=B1 33%  interrupts.CPU153=
.PMI:Performa
> nce_monitoring_interrupts
>     818.67 =C2=B1 36%     -81.1%     154.67 =C2=B1 15%  interrupts.CPU153=
.RES:Reschedu
> ling_interrupts
>      16776 =C2=B1 15%     -29.0%      11918 =C2=B1  4%  interrupts.CPU154=
.CAL:Function
> _call_interrupts
>     700.33 =C2=B1 26%     -54.6%     318.00 =C2=B1 82%  interrupts.CPU154=
.RES:Reschedu
> ling_interrupts
>      16577 =C2=B1 13%     -27.7%      11992 =C2=B1  3%  interrupts.CPU155=
.CAL:Function
> _call_interrupts
>     736.33 =C2=B1 27%     -67.2%     241.67 =C2=B1 54%  interrupts.CPU155=
.RES:Reschedu
> ling_interrupts
>      18846 =C2=B1  6%     -37.8%      11715 =C2=B1  6%  interrupts.CPU156=
.CAL:Function
> _call_interrupts
>     821.33 =C2=B1 30%     -67.2%     269.00 =C2=B1 58%  interrupts.CPU156=
.RES:Reschedu
> ling_interrupts
>      18476 =C2=B1  4%     -37.5%      11541        interrupts.CPU157.CAL:=
Function
> _call_interrupts
>     803.00 =C2=B1 26%     -68.5%     253.00 =C2=B1 46%  interrupts.CPU157=
.RES:Reschedu
> ling_interrupts
>      18081 =C2=B1 12%     -33.8%      11976 =C2=B1  2%  interrupts.CPU158=
.CAL:Function
> _call_interrupts
>     925.33 =C2=B1 27%     -50.4%     459.33 =C2=B1 75%  interrupts.CPU158=
.RES:Reschedu
> ling_interrupts
>       2871            -9.0%       2614 =C2=B1  8%  interrupts.CPU158.TLB:=
TLB_shoo
> tdowns
>      18354 =C2=B1 10%     -31.1%      12644        interrupts.CPU159.CAL:=
Function
> _call_interrupts
>       2202 =C2=B1 28%     -42.7%       1261 =C2=B1  8%  interrupts.CPU159=
.NMI:Non-mask
> able_interrupts
>       2202 =C2=B1 28%     -42.7%       1261 =C2=B1  8%  interrupts.CPU159=
.PMI:Performa
> nce_monitoring_interrupts
>     949.33 =C2=B1 33%     -72.1%     265.33 =C2=B1 36%  interrupts.CPU159=
.RES:Reschedu
> ling_interrupts
>       2733 =C2=B1 10%     +19.8%       3273 =C2=B1  4%  interrupts.CPU159=
.TLB:TLB_shoo
> tdowns
>      17809 =C2=B1  3%     -39.3%      10815 =C2=B1  3%  interrupts.CPU16.=
CAL:Function_
> call_interrupts
>     984.00 =C2=B1 20%     -70.1%     294.67 =C2=B1  4%  interrupts.CPU16.=
RES:Reschedul
> ing_interrupts
>      18539 =C2=B1  6%     -29.8%      13017        interrupts.CPU160.CAL:=
Function
> _call_interrupts
>     821.67 =C2=B1 25%     -76.4%     193.67 =C2=B1 30%  interrupts.CPU160=
.RES:Reschedu
> ling_interrupts
>      18819 =C2=B1  3%     -31.5%      12882        interrupts.CPU161.CAL:=
Function
> _call_interrupts
>     832.00 =C2=B1 21%     -67.8%     268.00 =C2=B1 54%  interrupts.CPU161=
.RES:Reschedu
> ling_interrupts
>      18670 =C2=B1  7%     -36.9%      11779 =C2=B1  8%  interrupts.CPU162=
.CAL:Function
> _call_interrupts
>     836.67 =C2=B1 30%     -82.8%     144.00 =C2=B1  7%  interrupts.CPU162=
.RES:Reschedu
> ling_interrupts
>      18943 =C2=B1  5%     -33.5%      12593        interrupts.CPU163.CAL:=
Function
> _call_interrupts
>     849.33 =C2=B1 28%     -82.0%     152.67 =C2=B1  7%  interrupts.CPU163=
.RES:Reschedu
> ling_interrupts
>      18175 =C2=B1  3%     -35.7%      11692 =C2=B1  4%  interrupts.CPU164=
.CAL:Function
> _call_interrupts
>     832.00 =C2=B1 18%     -82.2%     148.33 =C2=B1  2%  interrupts.CPU164=
.RES:Reschedu
> ling_interrupts
>      18014 =C2=B1 10%     -38.8%      11029 =C2=B1  8%  interrupts.CPU165=
.CAL:Function
> _call_interrupts
>       1734 =C2=B1 34%     -37.4%       1086 =C2=B1  5%  interrupts.CPU165=
.NMI:Non-mask
> able_interrupts
>       1734 =C2=B1 34%     -37.4%       1086 =C2=B1  5%  interrupts.CPU165=
.PMI:Performa
> nce_monitoring_interrupts
>     789.67 =C2=B1 19%     -77.9%     174.33 =C2=B1 17%  interrupts.CPU165=
.RES:Reschedu
> ling_interrupts
>      19213 =C2=B1  7%     -39.8%      11572 =C2=B1  4%  interrupts.CPU166=
.CAL:Function
> _call_interrupts
>     867.33 =C2=B1 36%     -59.7%     349.67 =C2=B1 62%  interrupts.CPU166=
.RES:Reschedu
> ling_interrupts
>       2977 =C2=B1  7%     -14.5%       2545 =C2=B1  6%  interrupts.CPU166=
.TLB:TLB_shoo
> tdowns
>      18557 =C2=B1  4%     -33.9%      12274 =C2=B1  3%  interrupts.CPU167=
.CAL:Function
> _call_interrupts
>       2261 =C2=B1 33%     -49.0%       1152        interrupts.CPU167.NMI:=
Non-mask
> able_interrupts
>       2261 =C2=B1 33%     -49.0%       1152        interrupts.CPU167.PMI:=
Performa
> nce_monitoring_interrupts
>     823.33 =C2=B1 31%     -59.1%     337.00 =C2=B1 41%  interrupts.CPU167=
.RES:Reschedu
> ling_interrupts
>      16523 =C2=B1 10%     -28.9%      11741 =C2=B1  2%  interrupts.CPU168=
.CAL:Function
> _call_interrupts
>     991.33 =C2=B1 29%     -79.7%     201.00 =C2=B1 37%  interrupts.CPU168=
.RES:Reschedu
> ling_interrupts
>      17715 =C2=B1 11%     -33.3%      11822 =C2=B1  3%  interrupts.CPU169=
.CAL:Function
> _call_interrupts
>     999.33 =C2=B1 31%     -82.8%     172.33 =C2=B1  4%  interrupts.CPU169=
.RES:Reschedu
> ling_interrupts
>      17812 =C2=B1  5%     -38.0%      11040 =C2=B1  4%  interrupts.CPU17.=
CAL:Function_
> call_interrupts
>     942.33 =C2=B1 18%     -66.4%     316.33 =C2=B1  5%  interrupts.CPU17.=
RES:Reschedul
> ing_interrupts
>      20255 =C2=B1  5%     -41.7%      11801 =C2=B1  7%  interrupts.CPU170=
.CAL:Function
> _call_interrupts
>     926.67 =C2=B1 32%     -54.5%     422.00 =C2=B1 90%  interrupts.CPU170=
.RES:Reschedu
> ling_interrupts
>      19759 =C2=B1  7%     -37.7%      12304 =C2=B1  3%  interrupts.CPU171=
.CAL:Function
> _call_interrupts
>       1045 =C2=B1 32%     -70.6%     307.33 =C2=B1 65%  interrupts.CPU171=
.RES:Reschedu
> ling_interrupts
>      18258 =C2=B1  8%     -34.1%      12023 =C2=B1  6%  interrupts.CPU172=
.CAL:Function
> _call_interrupts
>     815.33 =C2=B1 26%     -83.0%     138.67        interrupts.CPU172.RES:=
Reschedu
> ling_interrupts
>      17829 =C2=B1  8%     -35.7%      11458 =C2=B1 11%  interrupts.CPU173=
.CAL:Function
> _call_interrupts
>     820.33 =C2=B1 27%     -82.3%     145.33 =C2=B1  5%  interrupts.CPU173=
.RES:Reschedu
> ling_interrupts
>      18805 =C2=B1  6%     -32.3%      12725        interrupts.CPU174.CAL:=
Function
> _call_interrupts
>     816.00 =C2=B1 33%     -76.7%     190.00 =C2=B1 22%  interrupts.CPU174=
.RES:Reschedu
> ling_interrupts
>       2838 =C2=B1  8%     +13.1%       3211 =C2=B1  2%  interrupts.CPU174=
.TLB:TLB_shoo
> tdowns
>      18237 =C2=B1 14%     -28.2%      13092 =C2=B1  4%  interrupts.CPU175=
.CAL:Function
> _call_interrupts
>     789.67 =C2=B1 27%     -73.1%     212.67 =C2=B1 36%  interrupts.CPU175=
.RES:Reschedu
> ling_interrupts
>       2791 =C2=B1  8%     +22.5%       3419 =C2=B1 10%  interrupts.CPU175=
.TLB:TLB_shoo
> tdowns
>      19217 =C2=B1  5%     -35.3%      12441 =C2=B1  2%  interrupts.CPU176=
.CAL:Function
> _call_interrupts
>      19146 =C2=B1  6%     -36.3%      12194        interrupts.CPU177.CAL:=
Function
> _call_interrupts
>      18226 =C2=B1  5%     -34.1%      12006 =C2=B1  6%  interrupts.CPU178=
.CAL:Function
> _call_interrupts
>       1221 =C2=B1 10%     +63.6%       1998 =C2=B1 27%  interrupts.CPU178=
.NMI:Non-mask
> able_interrupts
>       1221 =C2=B1 10%     +63.6%       1998 =C2=B1 27%  interrupts.CPU178=
.PMI:Performa
> nce_monitoring_interrupts
>      18222 =C2=B1  5%     -35.0%      11841 =C2=B1  8%  interrupts.CPU179=
.CAL:Function
> _call_interrupts
>     798.00 =C2=B1 22%     -74.1%     207.00 =C2=B1 36%  interrupts.CPU179=
.RES:Reschedu
> ling_interrupts
>      18557 =C2=B1  3%     -44.2%      10355 =C2=B1  3%  interrupts.CPU18.=
CAL:Function_
> call_interrupts
>       1996 =C2=B1 20%     -50.1%     996.33 =C2=B1  5%  interrupts.CPU18.=
NMI:Non-maska
> ble_interrupts
>       1996 =C2=B1 20%     -50.1%     996.33 =C2=B1  5%  interrupts.CPU18.=
PMI:Performan
> ce_monitoring_interrupts
>     978.33 =C2=B1 26%     -69.4%     299.33 =C2=B1  4%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>       3234 =C2=B1  3%     -18.2%       2646 =C2=B1 13%  interrupts.CPU18.=
TLB:TLB_shoot
> downs
>      18714 =C2=B1  8%     -36.7%      11854 =C2=B1  3%  interrupts.CPU180=
.CAL:Function
> _call_interrupts
>     773.33 =C2=B1 10%     +51.1%       1168 =C2=B1  4%  interrupts.CPU180=
.NMI:Non-mask
> able_interrupts
>     773.33 =C2=B1 10%     +51.1%       1168 =C2=B1  4%  interrupts.CPU180=
.PMI:Performa
> nce_monitoring_interrupts
>     854.00 =C2=B1 28%     -59.7%     344.00 =C2=B1 81%  interrupts.CPU180=
.RES:Reschedu
> ling_interrupts
>      18054 =C2=B1  4%     -32.6%      12175 =C2=B1  4%  interrupts.CPU181=
.CAL:Function
> _call_interrupts
>       2550 =C2=B1  4%     +20.7%       3077 =C2=B1  8%  interrupts.CPU181=
.TLB:TLB_shoo
> tdowns
>      20072 =C2=B1  7%     -45.5%      10932 =C2=B1  4%  interrupts.CPU182=
.CAL:Function
> _call_interrupts
>       1501 =C2=B1 15%     -27.2%       1093 =C2=B1  6%  interrupts.CPU182=
.NMI:Non-mask
> able_interrupts
>       1501 =C2=B1 15%     -27.2%       1093 =C2=B1  6%  interrupts.CPU182=
.PMI:Performa
> nce_monitoring_interrupts
>     946.67 =C2=B1 30%     -86.3%     130.00 =C2=B1  3%  interrupts.CPU182=
.RES:Reschedu
> ling_interrupts
>       2830 =C2=B1 13%     -18.6%       2304 =C2=B1  4%  interrupts.CPU182=
.TLB:TLB_shoo
> tdowns
>      19789 =C2=B1  5%     -42.2%      11447 =C2=B1  5%  interrupts.CPU183=
.CAL:Function
> _call_interrupts
>     925.00 =C2=B1 35%     -82.0%     166.33 =C2=B1 18%  interrupts.CPU183=
.RES:Reschedu
> ling_interrupts
>      16986 =C2=B1  2%     -30.8%      11748 =C2=B1  3%  interrupts.CPU184=
.CAL:Function
> _call_interrupts
>     773.00 =C2=B1 29%     -61.1%     300.67 =C2=B1 68%  interrupts.CPU184=
.RES:Reschedu
> ling_interrupts
>      17798 =C2=B1  9%     -30.5%      12376        interrupts.CPU185.CAL:=
Function
> _call_interrupts
>      18953 =C2=B1  3%     -33.4%      12621 =C2=B1  3%  interrupts.CPU186=
.CAL:Function
> _call_interrupts
>     979.33 =C2=B1 24%     -83.3%     163.67 =C2=B1  8%  interrupts.CPU186=
.RES:Reschedu
> ling_interrupts
>      19719 =C2=B1  7%     -37.5%      12330 =C2=B1  4%  interrupts.CPU187=
.CAL:Function
> _call_interrupts
>     877.33 =C2=B1 23%     -76.2%     208.67 =C2=B1 34%  interrupts.CPU187=
.RES:Reschedu
> ling_interrupts
>      17948 =C2=B1  2%     -35.9%      11496 =C2=B1  6%  interrupts.CPU188=
.CAL:Function
> _call_interrupts
>     937.33 =C2=B1 29%     -85.0%     140.67 =C2=B1 15%  interrupts.CPU188=
.RES:Reschedu
> ling_interrupts
>      19002           -36.7%      12027 =C2=B1  4%  interrupts.CPU189.CAL:=
Function
> _call_interrupts
>     925.00 =C2=B1 34%     -82.7%     160.00 =C2=B1 27%  interrupts.CPU189=
.RES:Reschedu
> ling_interrupts
>      17392 =C2=B1  9%     -37.5%      10864 =C2=B1  7%  interrupts.CPU19.=
CAL:Function_
> call_interrupts
>     941.33 =C2=B1 31%     -69.4%     288.33 =C2=B1  2%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>      19078 =C2=B1  4%     -39.5%      11541 =C2=B1  5%  interrupts.CPU190=
.CAL:Function
> _call_interrupts
>     673.33 =C2=B1 43%     +72.2%       1159        interrupts.CPU190.NMI:=
Non-mask
> able_interrupts
>     673.33 =C2=B1 43%     +72.2%       1159        interrupts.CPU190.PMI:=
Performa
> nce_monitoring_interrupts
>     842.00 =C2=B1 25%     -78.1%     184.67 =C2=B1 22%  interrupts.CPU190=
.RES:Reschedu
> ling_interrupts
>      18708 =C2=B1  4%     -36.9%      11802 =C2=B1  5%  interrupts.CPU191=
.CAL:Function
> _call_interrupts
>     881.67 =C2=B1 27%     -81.4%     164.00 =C2=B1  9%  interrupts.CPU191=
.RES:Reschedu
> ling_interrupts
>      18776 =C2=B1  4%     -35.6%      12095 =C2=B1  4%  interrupts.CPU192=
.CAL:Function
> _call_interrupts
>     960.33 =C2=B1 37%     -68.8%     299.67 =C2=B1 42%  interrupts.CPU192=
.RES:Reschedu
> ling_interrupts
>      18659 =C2=B1  4%     -35.9%      11958 =C2=B1  4%  interrupts.CPU193=
.CAL:Function
> _call_interrupts
>     867.00 =C2=B1 30%     -80.4%     170.00 =C2=B1 19%  interrupts.CPU193=
.RES:Reschedu
> ling_interrupts
>      19739 =C2=B1  9%     -42.8%      11282        interrupts.CPU194.CAL:=
Function
> _call_interrupts
>     846.00 =C2=B1 32%     -75.8%     204.67 =C2=B1 22%  interrupts.CPU194=
.RES:Reschedu
> ling_interrupts
>      19529 =C2=B1  9%     -41.0%      11518        interrupts.CPU195.CAL:=
Function
> _call_interrupts
>       2588 =C2=B1  9%     +15.9%       3001 =C2=B1  6%  interrupts.CPU195=
.TLB:TLB_shoo
> tdowns
>      18639 =C2=B1 15%     -37.2%      11714 =C2=B1  5%  interrupts.CPU196=
.CAL:Function
> _call_interrupts
>     904.00 =C2=B1 27%     -83.4%     150.00 =C2=B1  7%  interrupts.CPU196=
.RES:Reschedu
> ling_interrupts
>      19286 =C2=B1 12%     -36.5%      12252        interrupts.CPU197.CAL:=
Function
> _call_interrupts
>     942.67 =C2=B1 37%     -84.4%     147.00        interrupts.CPU197.RES:=
Reschedu
> ling_interrupts
>      18551 =C2=B1 13%     -40.0%      11137        interrupts.CPU198.CAL:=
Function
> _call_interrupts
>     860.00 =C2=B1 34%     -56.2%     376.67 =C2=B1 61%  interrupts.CPU198=
.RES:Reschedu
> ling_interrupts
>      19142 =C2=B1  9%     -39.9%      11508 =C2=B1  7%  interrupts.CPU199=
.CAL:Function
> _call_interrupts
>      17741 =C2=B1  3%     -44.3%       9890 =C2=B1  5%  interrupts.CPU2.C=
AL:Function_c
> all_interrupts
>       1991 =C2=B1 35%     -50.0%     996.33 =C2=B1 12%  interrupts.CPU2.N=
MI:Non-maskab
> le_interrupts
>       1991 =C2=B1 35%     -50.0%     996.33 =C2=B1 12%  interrupts.CPU2.P=
MI:Performanc
> e_monitoring_interrupts
>       1138 =C2=B1 20%     -76.0%     273.00 =C2=B1  3%  interrupts.CPU2.R=
ES:Rescheduli
> ng_interrupts
>      18028 =C2=B1 12%     -37.1%      11339        interrupts.CPU20.CAL:F=
unction_
> call_interrupts
>       1578 =C2=B1 37%     -36.5%       1002 =C2=B1  2%  interrupts.CPU20.=
NMI:Non-maska
> ble_interrupts
>       1578 =C2=B1 37%     -36.5%       1002 =C2=B1  2%  interrupts.CPU20.=
PMI:Performan
> ce_monitoring_interrupts
>     885.00 =C2=B1 14%     -66.4%     297.67 =C2=B1 13%  interrupts.CPU20.=
RES:Reschedul
> ing_interrupts
>      19659 =C2=B1  9%     -39.1%      11964 =C2=B1  5%  interrupts.CPU200=
.CAL:Function
> _call_interrupts
>     854.33 =C2=B1 30%     -51.3%     416.00 =C2=B1 76%  interrupts.CPU200=
.RES:Reschedu
> ling_interrupts
>      20055 =C2=B1  8%     -37.9%      12461 =C2=B1  6%  interrupts.CPU201=
.CAL:Function
> _call_interrupts
>      19211 =C2=B1  4%     -32.6%      12939 =C2=B1  4%  interrupts.CPU202=
.CAL:Function
> _call_interrupts
>     869.00 =C2=B1 25%     -71.8%     244.67 =C2=B1 31%  interrupts.CPU202=
.RES:Reschedu
> ling_interrupts
>      18906 =C2=B1  3%     -31.0%      13049 =C2=B1  3%  interrupts.CPU203=
.CAL:Function
> _call_interrupts
>     929.33 =C2=B1 32%     -78.7%     197.67 =C2=B1 34%  interrupts.CPU203=
.RES:Reschedu
> ling_interrupts
>      18537 =C2=B1  4%     -34.3%      12175 =C2=B1  3%  interrupts.CPU204=
.CAL:Function
> _call_interrupts
>      18272 =C2=B1  8%     -39.7%      11019 =C2=B1 17%  interrupts.CPU205=
.CAL:Function
> _call_interrupts
>      20279 =C2=B1  8%     -42.2%      11718 =C2=B1  5%  interrupts.CPU206=
.CAL:Function
> _call_interrupts
>     887.00 =C2=B1 30%     -84.3%     139.33 =C2=B1  2%  interrupts.CPU206=
.RES:Reschedu
> ling_interrupts
>      20121 =C2=B1 11%     -40.0%      12075 =C2=B1  7%  interrupts.CPU207=
.CAL:Function
> _call_interrupts
>     895.67 =C2=B1 31%     -84.3%     140.33 =C2=B1  6%  interrupts.CPU207=
.RES:Reschedu
> ling_interrupts
>      19028 =C2=B1 11%     -37.3%      11931 =C2=B1  8%  interrupts.CPU208=
.CAL:Function
> _call_interrupts
>       1461 =C2=B1 31%     +61.0%       2352 =C2=B1  3%  interrupts.CPU208=
.NMI:Non-mask
> able_interrupts
>       1461 =C2=B1 31%     +61.0%       2352 =C2=B1  3%  interrupts.CPU208=
.PMI:Performa
> nce_monitoring_interrupts
>       1008 =C2=B1 32%     -82.8%     173.67 =C2=B1 14%  interrupts.CPU208=
.RES:Reschedu
> ling_interrupts
>      19687 =C2=B1  6%     -39.0%      12006 =C2=B1  5%  interrupts.CPU209=
.CAL:Function
> _call_interrupts
>     959.00 =C2=B1 25%     -84.8%     145.67 =C2=B1  8%  interrupts.CPU209=
.RES:Reschedu
> ling_interrupts
>      17589 =C2=B1  7%     -44.3%       9797 =C2=B1 10%  interrupts.CPU21.=
CAL:Function_
> call_interrupts
>     885.00 =C2=B1 14%     -66.1%     299.67 =C2=B1  2%  interrupts.CPU21.=
RES:Reschedul
> ing_interrupts
>       2839 =C2=B1 10%     -14.3%       2433 =C2=B1  6%  interrupts.CPU21.=
TLB:TLB_shoot
> downs
>      17899 =C2=B1  4%     -35.8%      11492        interrupts.CPU210.CAL:=
Function
> _call_interrupts
>       2176 =C2=B1 27%     -35.1%       1411 =C2=B1 35%  interrupts.CPU210=
.NMI:Non-mask
> able_interrupts
>       2176 =C2=B1 27%     -35.1%       1411 =C2=B1 35%  interrupts.CPU210=
.PMI:Performa
> nce_monitoring_interrupts
>     889.33 =C2=B1  7%     -58.5%     368.67 =C2=B1 89%  interrupts.CPU210=
.RES:Reschedu
> ling_interrupts
>       2955 =C2=B1  5%     -15.8%       2487 =C2=B1  9%  interrupts.CPU210=
.TLB:TLB_shoo
> tdowns
>      17957 =C2=B1  6%     -35.5%      11578        interrupts.CPU211.CAL:=
Function
> _call_interrupts
>     980.00 =C2=B1 12%     -72.3%     271.67 =C2=B1 32%  interrupts.CPU211=
.RES:Reschedu
> ling_interrupts
>      19619 =C2=B1  3%     -33.8%      12984 =C2=B1  5%  interrupts.CPU212=
.CAL:Function
> _call_interrupts
>     917.00 =C2=B1 29%     -64.3%     327.33 =C2=B1 66%  interrupts.CPU212=
.RES:Reschedu
> ling_interrupts
>       2898 =C2=B1 13%     +19.2%       3455 =C2=B1  4%  interrupts.CPU212=
.TLB:TLB_shoo
> tdowns
>      19021 =C2=B1  7%     -35.4%      12291 =C2=B1  3%  interrupts.CPU213=
.CAL:Function
> _call_interrupts
>      17235 =C2=B1 10%     -34.5%      11292 =C2=B1  4%  interrupts.CPU214=
.CAL:Function
> _call_interrupts
>     961.67 =C2=B1 37%     -67.9%     309.00 =C2=B1 36%  interrupts.CPU214=
.RES:Reschedu
> ling_interrupts
>      17292 =C2=B1 11%     -36.4%      10997 =C2=B1 10%  interrupts.CPU215=
.CAL:Function
> _call_interrupts
>     926.67 =C2=B1 37%     -65.4%     320.67 =C2=B1 45%  interrupts.CPU215=
.RES:Reschedu
> ling_interrupts
>     572.67 =C2=B1 34%     -74.5%     146.00 =C2=B1  9%  interrupts.CPU216=
.RES:Reschedu
> ling_interrupts
>       1728 =C2=B1 14%     +47.7%       2552 =C2=B1 20%  interrupts.CPU216=
.TLB:TLB_shoo
> tdowns
>     544.67 =C2=B1 32%     -62.5%     204.00 =C2=B1 31%  interrupts.CPU217=
.RES:Reschedu
> ling_interrupts
>       1512 =C2=B1 13%     +60.6%       2429 =C2=B1 22%  interrupts.CPU217=
.TLB:TLB_shoo
> tdowns
>      18548 =C2=B1  2%     -36.3%      11823 =C2=B1  7%  interrupts.CPU218=
.CAL:Function
> _call_interrupts
>     913.67 =C2=B1 26%     -82.7%     157.67 =C2=B1 18%  interrupts.CPU218=
.RES:Reschedu
> ling_interrupts
>      19495 =C2=B1  9%     -40.1%      11669 =C2=B1  3%  interrupts.CPU219=
.CAL:Function
> _call_interrupts
>     961.67 =C2=B1 19%     -85.7%     137.33 =C2=B1 16%  interrupts.CPU219=
.RES:Reschedu
> ling_interrupts
>      18012 =C2=B1  7%     -38.6%      11055 =C2=B1  6%  interrupts.CPU22.=
CAL:Function_
> call_interrupts
>     954.33 =C2=B1 30%     -62.4%     358.67 =C2=B1 20%  interrupts.CPU22.=
RES:Reschedul
> ing_interrupts
>      17852 =C2=B1 10%     -34.0%      11783 =C2=B1  8%  interrupts.CPU220=
.CAL:Function
> _call_interrupts
>     829.67 =C2=B1 32%     -71.3%     238.00 =C2=B1 35%  interrupts.CPU220=
.RES:Reschedu
> ling_interrupts
>      18043 =C2=B1  6%     -36.0%      11549 =C2=B1  8%  interrupts.CPU221=
.CAL:Function
> _call_interrupts
>     860.00 =C2=B1 33%     -74.8%     216.67 =C2=B1 31%  interrupts.CPU221=
.RES:Reschedu
> ling_interrupts
>      17544 =C2=B1  9%     -31.3%      12050 =C2=B1 10%  interrupts.CPU222=
.CAL:Function
> _call_interrupts
>     796.67 =C2=B1 28%     -80.1%     158.67 =C2=B1 21%  interrupts.CPU222=
.RES:Reschedu
> ling_interrupts
>      16994 =C2=B1 12%     -30.5%      11817 =C2=B1  4%  interrupts.CPU223=
.CAL:Function
> _call_interrupts
>     943.00 =C2=B1 36%     -81.3%     176.33 =C2=B1 21%  interrupts.CPU223=
.RES:Reschedu
> ling_interrupts
>      17121 =C2=B1 18%     -31.5%      11728 =C2=B1  9%  interrupts.CPU224=
.CAL:Function
> _call_interrupts
>     855.33 =C2=B1 35%     -82.2%     152.00        interrupts.CPU224.RES:=
Reschedu
> ling_interrupts
>       2550 =C2=B1  5%     +17.3%       2992 =C2=B1 16%  interrupts.CPU224=
.TLB:TLB_shoo
> tdowns
>      18011 =C2=B1  9%     -27.1%      13129 =C2=B1  2%  interrupts.CPU225=
.CAL:Function
> _call_interrupts
>     851.00 =C2=B1 19%     +51.2%       1287 =C2=B1  2%  interrupts.CPU225=
.NMI:Non-mask
> able_interrupts
>     851.00 =C2=B1 19%     +51.2%       1287 =C2=B1  2%  interrupts.CPU225=
.PMI:Performa
> nce_monitoring_interrupts
>     794.00 =C2=B1 28%     -82.4%     140.00 =C2=B1  5%  interrupts.CPU225=
.RES:Reschedu
> ling_interrupts
>      16708 =C2=B1 11%     -26.2%      12336 =C2=B1  4%  interrupts.CPU226=
.CAL:Function
> _call_interrupts
>      16860 =C2=B1  8%     -26.1%      12460 =C2=B1  5%  interrupts.CPU227=
.CAL:Function
> _call_interrupts
>      19192 =C2=B1  6%     -39.9%      11528        interrupts.CPU228.CAL:=
Function
> _call_interrupts
>     835.00 =C2=B1 33%     -80.1%     166.33 =C2=B1 10%  interrupts.CPU228=
.RES:Reschedu
> ling_interrupts
>      19312 =C2=B1  7%     -38.6%      11864 =C2=B1  4%  interrupts.CPU229=
.CAL:Function
> _call_interrupts
>     805.33 =C2=B1 27%     -78.1%     176.67 =C2=B1 12%  interrupts.CPU229=
.RES:Reschedu
> ling_interrupts
>      18163 =C2=B1  9%     -40.4%      10827 =C2=B1  5%  interrupts.CPU23.=
CAL:Function_
> call_interrupts
>       2041 =C2=B1 25%     -31.4%       1400 =C2=B1 31%  interrupts.CPU23.=
NMI:Non-maska
> ble_interrupts
>       2041 =C2=B1 25%     -31.4%       1400 =C2=B1 31%  interrupts.CPU23.=
PMI:Performan
> ce_monitoring_interrupts
>     974.33 =C2=B1 27%     -64.1%     349.67 =C2=B1 21%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>      18794 =C2=B1  9%     -35.6%      12112 =C2=B1  4%  interrupts.CPU230=
.CAL:Function
> _call_interrupts
>     883.00 =C2=B1 29%     -68.9%     274.67 =C2=B1 56%  interrupts.CPU230=
.RES:Reschedu
> ling_interrupts
>      18390 =C2=B1 14%     -35.0%      11950 =C2=B1  7%  interrupts.CPU231=
.CAL:Function
> _call_interrupts
>     882.33 =C2=B1 32%     -80.2%     175.00 =C2=B1 17%  interrupts.CPU231=
.RES:Reschedu
> ling_interrupts
>      19320           -33.7%      12813 =C2=B1  4%  interrupts.CPU232.CAL:=
Function
> _call_interrupts
>     812.00 =C2=B1 25%     -82.5%     142.00 =C2=B1  2%  interrupts.CPU232=
.RES:Reschedu
> ling_interrupts
>      19461           -35.7%      12506 =C2=B1  4%  interrupts.CPU233.CAL:=
Function
> _call_interrupts
>     838.67 =C2=B1 27%     -82.2%     149.33 =C2=B1  5%  interrupts.CPU233=
.RES:Reschedu
> ling_interrupts
>      19679 =C2=B1 12%     -40.6%      11699        interrupts.CPU234.CAL:=
Function
> _call_interrupts
>     876.00 =C2=B1 31%     -83.8%     141.67 =C2=B1  3%  interrupts.CPU234=
.RES:Reschedu
> ling_interrupts
>      20047 =C2=B1  4%     -38.1%      12417 =C2=B1  4%  interrupts.CPU235=
.CAL:Function
> _call_interrupts
>     861.00 =C2=B1 30%     -85.4%     126.00 =C2=B1  4%  interrupts.CPU235=
.RES:Reschedu
> ling_interrupts
>      18536 =C2=B1  3%     -33.6%      12307 =C2=B1  2%  interrupts.CPU236=
.CAL:Function
> _call_interrupts
>     791.67 =C2=B1 19%     -81.2%     149.00 =C2=B1  6%  interrupts.CPU236=
.RES:Reschedu
> ling_interrupts
>      18033 =C2=B1  9%     -33.2%      12037 =C2=B1  2%  interrupts.CPU237=
.CAL:Function
> _call_interrupts
>     814.67 =C2=B1 16%     -82.8%     140.00 =C2=B1  8%  interrupts.CPU237=
.RES:Reschedu
> ling_interrupts
>      19424 =C2=B1  9%     -37.8%      12079 =C2=B1  2%  interrupts.CPU238=
.CAL:Function
> _call_interrupts
>     885.33 =C2=B1 33%     -75.5%     217.00 =C2=B1 12%  interrupts.CPU238=
.RES:Reschedu
> ling_interrupts
>      19361 =C2=B1 10%     -39.0%      11818 =C2=B1  4%  interrupts.CPU239=
.CAL:Function
> _call_interrupts
>     856.33 =C2=B1 33%     -70.8%     249.67 =C2=B1 41%  interrupts.CPU239=
.RES:Reschedu
> ling_interrupts
>      17842 =C2=B1  7%     -37.5%      11149 =C2=B1  6%  interrupts.CPU24.=
CAL:Function_
> call_interrupts
>       1209 =C2=B1 26%     -73.6%     319.33 =C2=B1 13%  interrupts.CPU24.=
RES:Reschedul
> ing_interrupts
>      18761 =C2=B1  8%     -34.7%      12246 =C2=B1  5%  interrupts.CPU240=
.CAL:Function
> _call_interrupts
>     979.67 =C2=B1 29%     -83.3%     163.33 =C2=B1 29%  interrupts.CPU240=
.RES:Reschedu
> ling_interrupts
>      17842 =C2=B1 11%     -32.5%      12037 =C2=B1  7%  interrupts.CPU241=
.CAL:Function
> _call_interrupts
>     980.00 =C2=B1 31%     -62.3%     369.67 =C2=B1 89%  interrupts.CPU241=
.RES:Reschedu
> ling_interrupts
>      20037 =C2=B1  3%     -40.2%      11989 =C2=B1  4%  interrupts.CPU242=
.CAL:Function
> _call_interrupts
>       1017 =C2=B1 31%     -83.1%     172.00 =C2=B1 27%  interrupts.CPU242=
.RES:Reschedu
> ling_interrupts
>      19615 =C2=B1  9%     -39.8%      11801 =C2=B1  5%  interrupts.CPU243=
.CAL:Function
> _call_interrupts
>     998.33 =C2=B1 32%     -85.5%     145.00 =C2=B1 16%  interrupts.CPU243=
.RES:Reschedu
> ling_interrupts
>       3330 =C2=B1  4%     -18.1%       2728 =C2=B1  7%  interrupts.CPU243=
.TLB:TLB_shoo
> tdowns
>      18657 =C2=B1  4%     -37.4%      11671 =C2=B1  4%  interrupts.CPU244=
.CAL:Function
> _call_interrupts
>     822.33 =C2=B1 28%     -83.9%     132.33 =C2=B1  9%  interrupts.CPU244=
.RES:Reschedu
> ling_interrupts
>       2956 =C2=B1  2%     -11.6%       2612 =C2=B1  5%  interrupts.CPU244=
.TLB:TLB_shoo
> tdowns
>      17696 =C2=B1  8%     -36.6%      11225 =C2=B1  9%  interrupts.CPU245=
.CAL:Function
> _call_interrupts
>     812.67 =C2=B1 28%     -82.5%     142.33 =C2=B1  6%  interrupts.CPU245=
.RES:Reschedu
> ling_interrupts
>      18750 =C2=B1  9%     -35.6%      12069 =C2=B1  2%  interrupts.CPU246=
.CAL:Function
> _call_interrupts
>     839.67 =C2=B1 34%     -79.3%     174.00 =C2=B1 39%  interrupts.CPU246=
.RES:Reschedu
> ling_interrupts
>      18681 =C2=B1 10%     -31.7%      12752 =C2=B1  2%  interrupts.CPU247=
.CAL:Function
> _call_interrupts
>     803.33 =C2=B1 29%     -68.0%     257.00 =C2=B1 68%  interrupts.CPU247=
.RES:Reschedu
> ling_interrupts
>      18980 =C2=B1 12%     -36.3%      12095 =C2=B1  6%  interrupts.CPU248=
.CAL:Function
> _call_interrupts
>       2543 =C2=B1  9%     +17.4%       2986 =C2=B1  3%  interrupts.CPU248=
.TLB:TLB_shoo
> tdowns
>      19087 =C2=B1 12%     -37.6%      11916 =C2=B1  4%  interrupts.CPU249=
.CAL:Function
> _call_interrupts
>       2824 =C2=B1  2%     +11.3%       3143 =C2=B1  5%  interrupts.CPU249=
.TLB:TLB_shoo
> tdowns
>      16825 =C2=B1  8%     -35.1%      10915 =C2=B1  3%  interrupts.CPU25.=
CAL:Function_
> call_interrupts
>       1221 =C2=B1 26%     -73.9%     318.33 =C2=B1 11%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>      18129 =C2=B1  9%     -34.8%      11826 =C2=B1  6%  interrupts.CPU250=
.CAL:Function
> _call_interrupts
>     809.67 =C2=B1 22%     -56.9%     348.67 =C2=B1 84%  interrupts.CPU250=
.RES:Reschedu
> ling_interrupts
>       3314 =C2=B1  4%     -16.5%       2769        interrupts.CPU250.TLB:=
TLB_shoo
> tdowns
>      18338 =C2=B1  6%     -38.3%      11317 =C2=B1  5%  interrupts.CPU251=
.CAL:Function
> _call_interrupts
>     774.67 =C2=B1 22%     -81.1%     146.33 =C2=B1 15%  interrupts.CPU251=
.RES:Reschedu
> ling_interrupts
>      18834 =C2=B1  6%     -36.4%      11974        interrupts.CPU252.CAL:=
Function
> _call_interrupts
>     783.00 =C2=B1 16%     +53.9%       1204 =C2=B1  2%  interrupts.CPU252=
.NMI:Non-mask
> able_interrupts
>     783.00 =C2=B1 16%     +53.9%       1204 =C2=B1  2%  interrupts.CPU252=
.PMI:Performa
> nce_monitoring_interrupts
>     870.67 =C2=B1 30%     -80.8%     167.33 =C2=B1 28%  interrupts.CPU252=
.RES:Reschedu
> ling_interrupts
>      18604 =C2=B1 11%     -33.7%      12330        interrupts.CPU253.CAL:=
Function
> _call_interrupts
>     874.67 =C2=B1 27%     -78.4%     188.67 =C2=B1 25%  interrupts.CPU253=
.RES:Reschedu
> ling_interrupts
>      19772 =C2=B1  6%     -41.0%      11663 =C2=B1  6%  interrupts.CPU254=
.CAL:Function
> _call_interrupts
>     891.00 =C2=B1 31%     -85.1%     132.67 =C2=B1  7%  interrupts.CPU254=
.RES:Reschedu
> ling_interrupts
>      19946 =C2=B1  5%     -40.9%      11787 =C2=B1  4%  interrupts.CPU255=
.CAL:Function
> _call_interrupts
>     882.00 =C2=B1 30%     -84.7%     135.00 =C2=B1  7%  interrupts.CPU255=
.RES:Reschedu
> ling_interrupts
>      17787 =C2=B1  5%     -37.2%      11173 =C2=B1  6%  interrupts.CPU256=
.CAL:Function
> _call_interrupts
>      17591 =C2=B1 11%     -33.1%      11768 =C2=B1  6%  interrupts.CPU257=
.CAL:Function
> _call_interrupts
>     840.00 =C2=B1 36%     -65.6%     288.67 =C2=B1 65%  interrupts.CPU257=
.RES:Reschedu
> ling_interrupts
>       2670 =C2=B1  5%     +16.5%       3110 =C2=B1  3%  interrupts.CPU257=
.TLB:TLB_shoo
> tdowns
>      19711 =C2=B1  7%     -37.1%      12399 =C2=B1  4%  interrupts.CPU258=
.CAL:Function
> _call_interrupts
>     837.33 =C2=B1 24%     -80.1%     167.00 =C2=B1 37%  interrupts.CPU258=
.RES:Reschedu
> ling_interrupts
>      20157 =C2=B1  9%     -38.1%      12474 =C2=B1  5%  interrupts.CPU259=
.CAL:Function
> _call_interrupts
>     911.00 =C2=B1 26%     -76.2%     216.67 =C2=B1 41%  interrupts.CPU259=
.RES:Reschedu
> ling_interrupts
>      19591 =C2=B1  6%     -44.4%      10902        interrupts.CPU26.CAL:F=
unction_
> call_interrupts
>       1006 =C2=B1 25%     +87.6%       1888 =C2=B1 26%  interrupts.CPU26.=
NMI:Non-maska
> ble_interrupts
>       1006 =C2=B1 25%     +87.6%       1888 =C2=B1 26%  interrupts.CPU26.=
PMI:Performan
> ce_monitoring_interrupts
>       1075 =C2=B1 31%     -72.8%     292.00 =C2=B1 13%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>       3290 =C2=B1  9%     -29.1%       2333 =C2=B1 14%  interrupts.CPU26.=
TLB:TLB_shoot
> downs
>      18307 =C2=B1  3%     -36.2%      11678 =C2=B1  9%  interrupts.CPU260=
.CAL:Function
> _call_interrupts
>     724.00 =C2=B1 44%    +226.3%       2362        interrupts.CPU260.NMI:=
Non-mask
> able_interrupts
>     724.00 =C2=B1 44%    +226.3%       2362        interrupts.CPU260.PMI:=
Performa
> nce_monitoring_interrupts
>     964.67 =C2=B1 35%     -80.5%     188.00 =C2=B1 22%  interrupts.CPU260=
.RES:Reschedu
> ling_interrupts
>      18551 =C2=B1  3%     -33.5%      12335 =C2=B1  6%  interrupts.CPU261=
.CAL:Function
> _call_interrupts
>     885.00 =C2=B1 30%     -83.6%     145.00 =C2=B1 14%  interrupts.CPU261=
.RES:Reschedu
> ling_interrupts
>      19278 =C2=B1  9%     -40.0%      11561 =C2=B1  6%  interrupts.CPU262=
.CAL:Function
> _call_interrupts
>     989.33 =C2=B1 75%    +142.9%       2403 =C2=B1  5%  interrupts.CPU262=
.NMI:Non-mask
> able_interrupts
>     989.33 =C2=B1 75%    +142.9%       2403 =C2=B1  5%  interrupts.CPU262=
.PMI:Performa
> nce_monitoring_interrupts
>     843.67 =C2=B1 24%     -82.1%     151.33 =C2=B1 19%  interrupts.CPU262=
.RES:Reschedu
> ling_interrupts
>      19285 =C2=B1  8%     -40.6%      11447 =C2=B1  7%  interrupts.CPU263=
.CAL:Function
> _call_interrupts
>     733.00 =C2=B1 42%    +165.3%       1944 =C2=B1 25%  interrupts.CPU263=
.NMI:Non-mask
> able_interrupts
>     733.00 =C2=B1 42%    +165.3%       1944 =C2=B1 25%  interrupts.CPU263=
.PMI:Performa
> nce_monitoring_interrupts
>      18864           -38.3%      11640 =C2=B1  4%  interrupts.CPU264.CAL:=
Function
> _call_interrupts
>     897.33 =C2=B1 36%     -84.7%     137.33 =C2=B1  7%  interrupts.CPU264=
.RES:Reschedu
> ling_interrupts
>       2480 =C2=B1 11%     +19.8%       2970 =C2=B1  8%  interrupts.CPU264=
.TLB:TLB_shoo
> tdowns
>      18972 =C2=B1  6%     -43.1%      10797 =C2=B1  5%  interrupts.CPU265=
.CAL:Function
> _call_interrupts
>     854.67 =C2=B1 31%     -80.8%     164.00 =C2=B1 12%  interrupts.CPU265=
.RES:Reschedu
> ling_interrupts
>      19921 =C2=B1  8%     -43.8%      11197 =C2=B1  4%  interrupts.CPU266=
.CAL:Function
> _call_interrupts
>     854.00 =C2=B1 25%     -53.3%     398.67 =C2=B1 87%  interrupts.CPU266=
.RES:Reschedu
> ling_interrupts
>      19570 =C2=B1  9%     -42.9%      11182 =C2=B1  4%  interrupts.CPU267=
.CAL:Function
> _call_interrupts
>     997.00 =C2=B1 16%    +121.4%       2207        interrupts.CPU267.NMI:=
Non-mask
> able_interrupts
>     997.00 =C2=B1 16%    +121.4%       2207        interrupts.CPU267.PMI:=
Performa
> nce_monitoring_interrupts
>     878.00 =C2=B1 34%     -72.2%     243.67 =C2=B1 38%  interrupts.CPU267=
.RES:Reschedu
> ling_interrupts
>      18721 =C2=B1 10%     -39.9%      11245 =C2=B1  4%  interrupts.CPU268=
.CAL:Function
> _call_interrupts
>     925.00 =C2=B1 39%     -87.1%     119.00 =C2=B1 13%  interrupts.CPU268=
.RES:Reschedu
> ling_interrupts
>      18602 =C2=B1 11%     -35.2%      12057 =C2=B1  4%  interrupts.CPU269=
.CAL:Function
> _call_interrupts
>     847.67 =C2=B1 33%     -86.3%     116.00 =C2=B1  5%  interrupts.CPU269=
.RES:Reschedu
> ling_interrupts
>      19067 =C2=B1  8%     -42.1%      11044 =C2=B1  3%  interrupts.CPU27.=
CAL:Function_
> call_interrupts
>       1142 =C2=B1 30%     -68.2%     362.67 =C2=B1 22%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>      19215 =C2=B1  8%     -41.0%      11345 =C2=B1  5%  interrupts.CPU270=
.CAL:Function
> _call_interrupts
>      18723 =C2=B1 15%     -38.5%      11520 =C2=B1  3%  interrupts.CPU271=
.CAL:Function
> _call_interrupts
>     810.33 =C2=B1 34%     -57.3%     346.00 =C2=B1 45%  interrupts.CPU271=
.RES:Reschedu
> ling_interrupts
>      19290 =C2=B1  6%     -41.0%      11378 =C2=B1  8%  interrupts.CPU272=
.CAL:Function
> _call_interrupts
>      19873 =C2=B1  9%     -38.8%      12171 =C2=B1  4%  interrupts.CPU273=
.CAL:Function
> _call_interrupts
>     834.00 =C2=B1 26%     -67.4%     271.67 =C2=B1 42%  interrupts.CPU273=
.RES:Reschedu
> ling_interrupts
>      18437 =C2=B1  3%     -36.9%      11641 =C2=B1  7%  interrupts.CPU274=
.CAL:Function
> _call_interrupts
>     899.00 =C2=B1 34%     -75.8%     217.67 =C2=B1 49%  interrupts.CPU274=
.RES:Reschedu
> ling_interrupts
>      18160 =C2=B1  2%     -33.9%      11997 =C2=B1  4%  interrupts.CPU275=
.CAL:Function
> _call_interrupts
>     880.00 =C2=B1 28%     -79.5%     180.67 =C2=B1 35%  interrupts.CPU275=
.RES:Reschedu
> ling_interrupts
>      18405 =C2=B1  8%     -36.8%      11627 =C2=B1  2%  interrupts.CPU276=
.CAL:Function
> _call_interrupts
>     839.33 =C2=B1 29%     -50.3%     417.33 =C2=B1 52%  interrupts.CPU276=
.RES:Reschedu
> ling_interrupts
>      18636 =C2=B1  9%     -41.1%      10985 =C2=B1  3%  interrupts.CPU277=
.CAL:Function
> _call_interrupts
>      18655 =C2=B1  6%     -39.6%      11274 =C2=B1  9%  interrupts.CPU278=
.CAL:Function
> _call_interrupts
>     921.00 =C2=B1 31%     -86.1%     128.00 =C2=B1  5%  interrupts.CPU278=
.RES:Reschedu
> ling_interrupts
>       2651 =C2=B1  3%     +12.1%       2973 =C2=B1  8%  interrupts.CPU278=
.TLB:TLB_shoo
> tdowns
>      19284 =C2=B1  9%     -42.2%      11141 =C2=B1  6%  interrupts.CPU279=
.CAL:Function
> _call_interrupts
>     940.00 =C2=B1 30%     -84.9%     142.00 =C2=B1 14%  interrupts.CPU279=
.RES:Reschedu
> ling_interrupts
>      17882 =C2=B1  5%     -39.9%      10746 =C2=B1  7%  interrupts.CPU28.=
CAL:Function_
> call_interrupts
>     949.33 =C2=B1 27%     -69.1%     293.33 =C2=B1  4%  interrupts.CPU28.=
RES:Reschedul
> ing_interrupts
>      18314 =C2=B1 13%     -35.2%      11859 =C2=B1  2%  interrupts.CPU280=
.CAL:Function
> _call_interrupts
>     882.00 =C2=B1 32%     -85.7%     126.00 =C2=B1  4%  interrupts.CPU280=
.RES:Reschedu
> ling_interrupts
>      18991 =C2=B1  8%     -37.7%      11831 =C2=B1  3%  interrupts.CPU281=
.CAL:Function
> _call_interrupts
>     943.67 =C2=B1 33%     -86.9%     124.00 =C2=B1 13%  interrupts.CPU281=
.RES:Reschedu
> ling_interrupts
>      17899 =C2=B1  8%     -36.3%      11394 =C2=B1  7%  interrupts.CPU282=
.CAL:Function
> _call_interrupts
>       2423 =C2=B1  2%     -39.3%       1471 =C2=B1 36%  interrupts.CPU282=
.NMI:Non-mask
> able_interrupts
>       2423 =C2=B1  2%     -39.3%       1471 =C2=B1 36%  interrupts.CPU282=
.PMI:Performa
> nce_monitoring_interrupts
>     879.33 =C2=B1 16%     -79.9%     177.00 =C2=B1 30%  interrupts.CPU282=
.RES:Reschedu
> ling_interrupts
>      18635           -43.9%      10461 =C2=B1  4%  interrupts.CPU283.CAL:=
Function
> _call_interrupts
>       2082 =C2=B1 29%     -32.4%       1408 =C2=B1 32%  interrupts.CPU283=
.NMI:Non-mask
> able_interrupts
>       2082 =C2=B1 29%     -32.4%       1408 =C2=B1 32%  interrupts.CPU283=
.PMI:Performa
> nce_monitoring_interrupts
>      18540 =C2=B1  9%     -39.3%      11258        interrupts.CPU284.CAL:=
Function
> _call_interrupts
>      18797 =C2=B1  8%     -40.9%      11114 =C2=B1  8%  interrupts.CPU285=
.CAL:Function
> _call_interrupts
>     847.67 =C2=B1 35%     -75.7%     205.67 =C2=B1 27%  interrupts.CPU285=
.RES:Reschedu
> ling_interrupts
>      15987 =C2=B1 10%     -31.6%      10929 =C2=B1  5%  interrupts.CPU286=
.CAL:Function
> _call_interrupts
>     826.67 =C2=B1 38%     -76.3%     195.67 =C2=B1 58%  interrupts.CPU286=
.RES:Reschedu
> ling_interrupts
>       2163 =C2=B1  8%     +32.4%       2863 =C2=B1 12%  interrupts.CPU286=
.TLB:TLB_shoo
> tdowns
>      16051 =C2=B1  4%     -39.0%       9788 =C2=B1  2%  interrupts.CPU287=
.CAL:Function
> _call_interrupts
>     875.33 =C2=B1 38%     -82.4%     154.33 =C2=B1 36%  interrupts.CPU287=
.RES:Reschedu
> ling_interrupts
>      17617 =C2=B1  6%     -39.9%      10596 =C2=B1 11%  interrupts.CPU29.=
CAL:Function_
> call_interrupts
>     927.33 =C2=B1 21%     -65.7%     317.67 =C2=B1  4%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>      18241 =C2=B1  8%     -45.4%       9957 =C2=B1  2%  interrupts.CPU3.C=
AL:Function_c
> all_interrupts
>       1062 =C2=B1 24%     -73.8%     278.67 =C2=B1 10%  interrupts.CPU3.R=
ES:Rescheduli
> ng_interrupts
>      18312 =C2=B1 11%     -38.8%      11215        interrupts.CPU30.CAL:F=
unction_
> call_interrupts
>     899.00 =C2=B1 28%     -66.3%     303.00 =C2=B1 15%  interrupts.CPU30.=
RES:Reschedul
> ing_interrupts
>      17828 =C2=B1  9%     -36.8%      11271 =C2=B1  5%  interrupts.CPU31.=
CAL:Function_
> call_interrupts
>     929.33 =C2=B1 27%     -60.0%     371.33 =C2=B1 29%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>      17342 =C2=B1  6%     -33.8%      11477        interrupts.CPU32.CAL:F=
unction_
> call_interrupts
>      17592 =C2=B1  6%     -35.2%      11398 =C2=B1  4%  interrupts.CPU33.=
CAL:Function_
> call_interrupts
>      17301           -36.3%      11021 =C2=B1  7%  interrupts.CPU34.CAL:F=
unction_
> call_interrupts
>     935.00 =C2=B1 19%     -63.8%     338.67 =C2=B1 16%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>      17045 =C2=B1  3%     -37.0%      10733 =C2=B1  5%  interrupts.CPU35.=
CAL:Function_
> call_interrupts
>     917.67 =C2=B1 12%     -66.6%     306.67 =C2=B1  9%  interrupts.CPU35.=
RES:Reschedul
> ing_interrupts
>       3163 =C2=B1  6%     -17.6%       2607 =C2=B1 11%  interrupts.CPU35.=
TLB:TLB_shoot
> downs
>      17221 =C2=B1  3%     -36.9%      10860 =C2=B1  4%  interrupts.CPU36.=
CAL:Function_
> call_interrupts
>      16727 =C2=B1  7%     -35.7%      10760        interrupts.CPU37.CAL:F=
unction_
> call_interrupts
>     843.33 =C2=B1 46%    +110.4%       1774 =C2=B1 29%  interrupts.CPU37.=
NMI:Non-maska
> ble_interrupts
>     843.33 =C2=B1 46%    +110.4%       1774 =C2=B1 29%  interrupts.CPU37.=
PMI:Performan
> ce_monitoring_interrupts
>     955.67 =C2=B1 29%     -53.4%     445.67 =C2=B1 47%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>       2773 =C2=B1 10%     -10.6%       2480 =C2=B1  7%  interrupts.CPU37.=
TLB:TLB_shoot
> downs
>      18796 =C2=B1  2%     -42.9%      10725 =C2=B1  4%  interrupts.CPU38.=
CAL:Function_
> call_interrupts
>       1510 =C2=B1 16%     +34.9%       2038        interrupts.CPU38.NMI:N=
on-maska
> ble_interrupts
>       1510 =C2=B1 16%     +34.9%       2038        interrupts.CPU38.PMI:P=
erforman
> ce_monitoring_interrupts
>       1008 =C2=B1 28%     -73.4%     268.00 =C2=B1  4%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>      19154 =C2=B1  5%     -44.0%      10718 =C2=B1  3%  interrupts.CPU39.=
CAL:Function_
> call_interrupts
>       1135 =C2=B1 18%     +92.0%       2181 =C2=B1  5%  interrupts.CPU39.=
NMI:Non-maska
> ble_interrupts
>       1135 =C2=B1 18%     +92.0%       2181 =C2=B1  5%  interrupts.CPU39.=
PMI:Performan
> ce_monitoring_interrupts
>     994.00 =C2=B1 26%     -70.7%     291.33 =C2=B1  6%  interrupts.CPU39.=
RES:Reschedul
> ing_interrupts
>      18719 =C2=B1  5%     -44.4%      10407        interrupts.CPU4.CAL:Fu=
nction_c
> all_interrupts
>       1017 =C2=B1 28%     -70.4%     301.33 =C2=B1  9%  interrupts.CPU4.R=
ES:Rescheduli
> ng_interrupts
>      18472 =C2=B1  5%     -38.1%      11434        interrupts.CPU40.CAL:F=
unction_
> call_interrupts
>       1006 =C2=B1 31%     -59.2%     410.33 =C2=B1 37%  interrupts.CPU40.=
RES:Reschedul
> ing_interrupts
>      18024 =C2=B1  3%     -33.6%      11967 =C2=B1  4%  interrupts.CPU41.=
CAL:Function_
> call_interrupts
>     986.67 =C2=B1 28%     -51.5%     479.00 =C2=B1 44%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>      19370 =C2=B1  8%     -42.6%      11122 =C2=B1  9%  interrupts.CPU42.=
CAL:Function_
> call_interrupts
>     948.33 =C2=B1 20%     -67.6%     307.33 =C2=B1  6%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>      19527 =C2=B1  7%     -40.9%      11532 =C2=B1  3%  interrupts.CPU43.=
CAL:Function_
> call_interrupts
>       1098 =C2=B1 24%     -71.5%     313.00 =C2=B1 12%  interrupts.CPU43.=
RES:Reschedul
> ing_interrupts
>       3265 =C2=B1  3%     -22.7%       2523 =C2=B1  6%  interrupts.CPU43.=
TLB:TLB_shoot
> downs
>      18620 =C2=B1  4%     -39.8%      11217 =C2=B1  4%  interrupts.CPU44.=
CAL:Function_
> call_interrupts
>       1030 =C2=B1 27%     -70.5%     303.67 =C2=B1  8%  interrupts.CPU44.=
RES:Reschedul
> ing_interrupts
>      18265 =C2=B1  5%     -35.5%      11782        interrupts.CPU45.CAL:F=
unction_
> call_interrupts
>     963.33 =C2=B1 24%     -66.0%     328.00 =C2=B1 11%  interrupts.CPU45.=
RES:Reschedul
> ing_interrupts
>      18478 =C2=B1  3%     -39.2%      11232 =C2=B1  7%  interrupts.CPU46.=
CAL:Function_
> call_interrupts
>     975.33 =C2=B1 20%     -53.5%     453.33 =C2=B1 48%  interrupts.CPU46.=
RES:Reschedul
> ing_interrupts
>      18696 =C2=B1  4%     -39.6%      11297 =C2=B1  2%  interrupts.CPU47.=
CAL:Function_
> call_interrupts
>     641.00 =C2=B1 44%    +187.3%       1841 =C2=B1 30%  interrupts.CPU47.=
NMI:Non-maska
> ble_interrupts
>     641.00 =C2=B1 44%    +187.3%       1841 =C2=B1 30%  interrupts.CPU47.=
PMI:Performan
> ce_monitoring_interrupts
>     953.33 =C2=B1 21%     -54.9%     430.00 =C2=B1 34%  interrupts.CPU47.=
RES:Reschedul
> ing_interrupts
>      18893           -39.0%      11515 =C2=B1  4%  interrupts.CPU48.CAL:F=
unction_
> call_interrupts
>       1043 =C2=B1 25%     -72.0%     292.33 =C2=B1  9%  interrupts.CPU48.=
RES:Reschedul
> ing_interrupts
>      19300           -42.1%      11175        interrupts.CPU49.CAL:Functi=
on_
> call_interrupts
>       1035 =C2=B1 30%     -67.1%     341.00 =C2=B1 15%  interrupts.CPU49.=
RES:Reschedul
> ing_interrupts
>      18087 =C2=B1  9%     -44.3%      10070 =C2=B1  2%  interrupts.CPU5.C=
AL:Function_c
> all_interrupts
>     972.67 =C2=B1 26%     -60.9%     380.00 =C2=B1 23%  interrupts.CPU5.R=
ES:Rescheduli
> ng_interrupts
>      19894 =C2=B1 11%     -46.5%      10649 =C2=B1  4%  interrupts.CPU50.=
CAL:Function_
> call_interrupts
>       1039 =C2=B1 16%     +89.7%       1971 =C2=B1 32%  interrupts.CPU50.=
NMI:Non-maska
> ble_interrupts
>       1039 =C2=B1 16%     +89.7%       1971 =C2=B1 32%  interrupts.CPU50.=
PMI:Performan
> ce_monitoring_interrupts
>     974.67 =C2=B1 30%     -66.1%     330.00 =C2=B1 17%  interrupts.CPU50.=
RES:Reschedul
> ing_interrupts
>      19980 =C2=B1 11%     -43.9%      11205 =C2=B1  4%  interrupts.CPU51.=
CAL:Function_
> call_interrupts
>       1063 =C2=B1 30%     -56.4%     463.67 =C2=B1 27%  interrupts.CPU51.=
RES:Reschedul
> ing_interrupts
>       2805 =C2=B1  6%     +13.7%       3190        interrupts.CPU51.TLB:T=
LB_shoot
> downs
>      19282 =C2=B1 11%     -41.3%      11314 =C2=B1  2%  interrupts.CPU52.=
CAL:Function_
> call_interrupts
>       1039 =C2=B1 29%     -71.8%     293.33 =C2=B1  6%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>      19110 =C2=B1 13%     -42.3%      11028 =C2=B1  2%  interrupts.CPU53.=
CAL:Function_
> call_interrupts
>     934.33 =C2=B1 32%     -70.1%     279.33 =C2=B1  2%  interrupts.CPU53.=
RES:Reschedul
> ing_interrupts
>      18445 =C2=B1 14%     -42.1%      10676 =C2=B1  5%  interrupts.CPU54.=
CAL:Function_
> call_interrupts
>       3019 =C2=B1  4%     -15.7%       2545 =C2=B1  3%  interrupts.CPU54.=
TLB:TLB_shoot
> downs
>      18655 =C2=B1 12%     -42.1%      10805 =C2=B1  4%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>     932.67 =C2=B1 32%     -48.9%     476.67 =C2=B1 38%  interrupts.CPU55.=
RES:Reschedul
> ing_interrupts
>       3151 =C2=B1  6%     -23.2%       2421 =C2=B1  5%  interrupts.CPU55.=
TLB:TLB_shoot
> downs
>      19205 =C2=B1  7%     -43.3%      10881 =C2=B1  7%  interrupts.CPU56.=
CAL:Function_
> call_interrupts
>       1886 =C2=B1 23%     -36.9%       1190 =C2=B1  6%  interrupts.CPU56.=
NMI:Non-maska
> ble_interrupts
>       1886 =C2=B1 23%     -36.9%       1190 =C2=B1  6%  interrupts.CPU56.=
PMI:Performan
> ce_monitoring_interrupts
>       1001 =C2=B1 27%     -53.7%     463.33 =C2=B1 54%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>       3147 =C2=B1  5%     -18.2%       2575 =C2=B1  3%  interrupts.CPU56.=
TLB:TLB_shoot
> downs
>      19125 =C2=B1 12%     -42.0%      11086 =C2=B1  5%  interrupts.CPU57.=
CAL:Function_
> call_interrupts
>       1910 =C2=B1 34%     -40.5%       1136        interrupts.CPU57.NMI:N=
on-maska
> ble_interrupts
>       1910 =C2=B1 34%     -40.5%       1136        interrupts.CPU57.PMI:P=
erforman
> ce_monitoring_interrupts
>     955.67 =C2=B1 28%     -38.6%     586.33 =C2=B1 55%  interrupts.CPU57.=
RES:Reschedul
> ing_interrupts
>      19025           -37.6%      11879 =C2=B1  4%  interrupts.CPU58.CAL:F=
unction_
> call_interrupts
>       1691 =C2=B1 43%     -33.9%       1118 =C2=B1  5%  interrupts.CPU58.=
NMI:Non-maska
> ble_interrupts
>       1691 =C2=B1 43%     -33.9%       1118 =C2=B1  5%  interrupts.CPU58.=
PMI:Performan
> ce_monitoring_interrupts
>       1003 =C2=B1 31%     -71.8%     282.67 =C2=B1  7%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>      18484 =C2=B1  2%     -37.1%      11636 =C2=B1  4%  interrupts.CPU59.=
CAL:Function_
> call_interrupts
>       2124 =C2=B1 34%     -31.9%       1447 =C2=B1 36%  interrupts.CPU59.=
NMI:Non-maska
> ble_interrupts
>       2124 =C2=B1 34%     -31.9%       1447 =C2=B1 36%  interrupts.CPU59.=
PMI:Performan
> ce_monitoring_interrupts
>       1031 =C2=B1 30%     -67.9%     331.33 =C2=B1 10%  interrupts.CPU59.=
RES:Reschedul
> ing_interrupts
>       2355 =C2=B1 13%     +40.2%       3303 =C2=B1 12%  interrupts.CPU59.=
TLB:TLB_shoot
> downs
>      17140 =C2=B1 12%     -37.6%      10691 =C2=B1  6%  interrupts.CPU6.C=
AL:Function_c
> all_interrupts
>       1607 =C2=B1 20%     -39.1%     978.67 =C2=B1  5%  interrupts.CPU6.N=
MI:Non-maskab
> le_interrupts
>       1607 =C2=B1 20%     -39.1%     978.67 =C2=B1  5%  interrupts.CPU6.P=
MI:Performanc
> e_monitoring_interrupts
>     910.67 =C2=B1 32%     -66.0%     309.67 =C2=B1  4%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>      19182 =C2=B1  5%     -38.1%      11877 =C2=B1  2%  interrupts.CPU60.=
CAL:Function_
> call_interrupts
>       1001 =C2=B1 27%     -49.2%     508.67 =C2=B1 35%  interrupts.CPU60.=
RES:Reschedul
> ing_interrupts
>      19108 =C2=B1  6%     -41.8%      11111        interrupts.CPU61.CAL:F=
unction_
> call_interrupts
>       1006 =C2=B1 23%     -47.0%     533.67 =C2=B1 39%  interrupts.CPU61.=
RES:Reschedul
> ing_interrupts
>      19941 =C2=B1  7%     -41.9%      11576 =C2=B1  5%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>       1097 =C2=B1 34%     -75.2%     272.67 =C2=B1  8%  interrupts.CPU62.=
RES:Reschedul
> ing_interrupts
>      19686 =C2=B1  8%     -43.2%      11174        interrupts.CPU63.CAL:F=
unction_
> call_interrupts
>       1019 =C2=B1 28%     -77.2%     232.67 =C2=B1  4%  interrupts.CPU63.=
RES:Reschedul
> ing_interrupts
>      18790 =C2=B1  7%     -38.6%      11540 =C2=B1  8%  interrupts.CPU64.=
CAL:Function_
> call_interrupts
>       1047 =C2=B1 31%     -73.8%     274.33 =C2=B1  5%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>      18146 =C2=B1 10%     -37.0%      11424 =C2=B1  8%  interrupts.CPU65.=
CAL:Function_
> call_interrupts
>     977.67 =C2=B1 32%     -74.8%     246.67 =C2=B1 10%  interrupts.CPU65.=
RES:Reschedul
> ing_interrupts
>      18145 =C2=B1  6%     -35.4%      11714 =C2=B1  4%  interrupts.CPU66.=
CAL:Function_
> call_interrupts
>       2564 =C2=B1  3%     -11.4%       2271 =C2=B1  4%  interrupts.CPU66.=
NMI:Non-maska
> ble_interrupts
>       2564 =C2=B1  3%     -11.4%       2271 =C2=B1  4%  interrupts.CPU66.=
PMI:Performan
> ce_monitoring_interrupts
>       1177 =C2=B1 24%     -75.9%     284.00 =C2=B1 21%  interrupts.CPU66.=
RES:Reschedul
> ing_interrupts
>      18096 =C2=B1  8%     -35.0%      11769 =C2=B1  6%  interrupts.CPU67.=
CAL:Function_
> call_interrupts
>       1075 =C2=B1 20%     -70.2%     320.33 =C2=B1 33%  interrupts.CPU67.=
RES:Reschedul
> ing_interrupts
>      17493 =C2=B1  7%     -36.6%      11094 =C2=B1  5%  interrupts.CPU68.=
CAL:Function_
> call_interrupts
>     968.00 =C2=B1 33%     -64.6%     342.33 =C2=B1 28%  interrupts.CPU68.=
RES:Reschedul
> ing_interrupts
>      17391 =C2=B1 13%     -37.9%      10797 =C2=B1  6%  interrupts.CPU69.=
CAL:Function_
> call_interrupts
>       1054 =C2=B1 14%    +116.4%       2281 =C2=B1  2%  interrupts.CPU69.=
NMI:Non-maska
> ble_interrupts
>       1054 =C2=B1 14%    +116.4%       2281 =C2=B1  2%  interrupts.CPU69.=
PMI:Performan
> ce_monitoring_interrupts
>     938.33 =C2=B1 34%     -60.5%     371.00 =C2=B1 52%  interrupts.CPU69.=
RES:Reschedul
> ing_interrupts
>      16629 =C2=B1 14%     -34.9%      10829 =C2=B1  2%  interrupts.CPU7.C=
AL:Function_c
> all_interrupts
>     955.00 =C2=B1 32%     -69.0%     296.00 =C2=B1  7%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>      16187 =C2=B1  5%     -35.4%      10456 =C2=B1  2%  interrupts.CPU70.=
CAL:Function_
> call_interrupts
>     916.33 =C2=B1 35%     -73.3%     244.67 =C2=B1  9%  interrupts.CPU70.=
RES:Reschedul
> ing_interrupts
>      16515 =C2=B1  6%     -40.2%       9878 =C2=B1  9%  interrupts.CPU71.=
CAL:Function_
> call_interrupts
>       1005 =C2=B1 33%     -61.7%     385.33 =C2=B1 22%  interrupts.CPU71.=
RES:Reschedul
> ing_interrupts
>     610.67 =C2=B1 26%     -61.3%     236.33 =C2=B1 27%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>       1469 =C2=B1 11%     +67.3%       2458 =C2=B1  3%  interrupts.CPU72.=
TLB:TLB_shoot
> downs
>     764.33 =C2=B1 21%     -48.9%     390.33 =C2=B1 77%  interrupts.CPU73.=
RES:Reschedul
> ing_interrupts
>       1796 =C2=B1 12%     +35.6%       2436 =C2=B1  6%  interrupts.CPU73.=
TLB:TLB_shoot
> downs
>      19083 =C2=B1 10%     -40.4%      11380 =C2=B1  4%  interrupts.CPU74.=
CAL:Function_
> call_interrupts
>       1022 =C2=B1 22%     -80.1%     203.00 =C2=B1 14%  interrupts.CPU74.=
RES:Reschedul
> ing_interrupts
>       3459 =C2=B1 11%     -23.0%       2664 =C2=B1  4%  interrupts.CPU74.=
TLB:TLB_shoot
> downs
>      19270 =C2=B1 14%     -38.8%      11791 =C2=B1  4%  interrupts.CPU75.=
CAL:Function_
> call_interrupts
>       1009 =C2=B1 23%     -79.1%     211.00 =C2=B1 21%  interrupts.CPU75.=
RES:Reschedul
> ing_interrupts
>      17989 =C2=B1 14%     -32.5%      12145 =C2=B1  5%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>       1026 =C2=B1 34%     -67.4%     334.33 =C2=B1 33%  interrupts.CPU76.=
RES:Reschedul
> ing_interrupts
>      18744 =C2=B1 12%     -39.9%      11269 =C2=B1  7%  interrupts.CPU77.=
CAL:Function_
> call_interrupts
>     900.00 =C2=B1 35%     -65.3%     312.00 =C2=B1 40%  interrupts.CPU77.=
RES:Reschedul
> ing_interrupts
>       2995 =C2=B1  2%     -26.3%       2207 =C2=B1 20%  interrupts.CPU77.=
TLB:TLB_shoot
> downs
>      16544 =C2=B1 14%     -27.0%      12075 =C2=B1  5%  interrupts.CPU78.=
CAL:Function_
> call_interrupts
>     914.67 =C2=B1 35%     -65.8%     312.67 =C2=B1 53%  interrupts.CPU78.=
RES:Reschedul
> ing_interrupts
>      16166 =C2=B1 10%     -31.3%      11101 =C2=B1  9%  interrupts.CPU79.=
CAL:Function_
> call_interrupts
>     846.33 =C2=B1 33%     -73.2%     227.00 =C2=B1 27%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>      17699 =C2=B1 13%     -37.1%      11130 =C2=B1  4%  interrupts.CPU8.C=
AL:Function_c
> all_interrupts
>     785.00 =C2=B1 11%    +141.1%       1893 =C2=B1 30%  interrupts.CPU8.N=
MI:Non-maskab
> le_interrupts
>     785.00 =C2=B1 11%    +141.1%       1893 =C2=B1 30%  interrupts.CPU8.P=
MI:Performanc
> e_monitoring_interrupts
>     907.33 =C2=B1 31%     -66.8%     301.67 =C2=B1  8%  interrupts.CPU8.R=
ES:Rescheduli
> ng_interrupts
>      17088 =C2=B1 18%     -31.7%      11668 =C2=B1  2%  interrupts.CPU80.=
CAL:Function_
> call_interrupts
>     834.00 =C2=B1  7%     +43.4%       1196        interrupts.CPU80.NMI:N=
on-maska
> ble_interrupts
>     834.00 =C2=B1  7%     +43.4%       1196        interrupts.CPU80.PMI:P=
erforman
> ce_monitoring_interrupts
>     841.67 =C2=B1 32%     -49.3%     427.00 =C2=B1 34%  interrupts.CPU80.=
RES:Reschedul
> ing_interrupts
>      16458 =C2=B1 13%     -25.1%      12319 =C2=B1  2%  interrupts.CPU81.=
CAL:Function_
> call_interrupts
>     809.67 =C2=B1 33%     -63.9%     292.67 =C2=B1 55%  interrupts.CPU81.=
RES:Reschedul
> ing_interrupts
>      17988 =C2=B1  4%     -33.0%      12056        interrupts.CPU84.CAL:F=
unction_
> call_interrupts
>     877.00 =C2=B1 26%     -70.8%     256.00 =C2=B1 17%  interrupts.CPU84.=
RES:Reschedul
> ing_interrupts
>       2669 =C2=B1  3%     +11.2%       2967 =C2=B1  5%  interrupts.CPU84.=
TLB:TLB_shoot
> downs
>      17631 =C2=B1  4%     -35.3%      11402 =C2=B1  2%  interrupts.CPU85.=
CAL:Function_
> call_interrupts
>     852.00 =C2=B1 30%     -77.7%     190.33 =C2=B1  3%  interrupts.CPU85.=
RES:Reschedul
> ing_interrupts
>      17624 =C2=B1  8%     -29.4%      12448 =C2=B1  2%  interrupts.CPU86.=
CAL:Function_
> call_interrupts
>     997.33 =C2=B1 28%     -65.6%     343.00 =C2=B1 43%  interrupts.CPU86.=
RES:Reschedul
> ing_interrupts
>      18144 =C2=B1  9%     -37.6%      11318 =C2=B1  5%  interrupts.CPU87.=
CAL:Function_
> call_interrupts
>     960.00 =C2=B1 28%     -54.2%     440.00 =C2=B1 50%  interrupts.CPU87.=
RES:Reschedul
> ing_interrupts
>      18634 =C2=B1  7%     -30.5%      12943 =C2=B1  3%  interrupts.CPU88.=
CAL:Function_
> call_interrupts
>     887.00 =C2=B1 18%     -75.2%     220.00 =C2=B1 23%  interrupts.CPU88.=
RES:Reschedul
> ing_interrupts
>       2769 =C2=B1  6%     +14.9%       3180 =C2=B1  4%  interrupts.CPU88.=
TLB:TLB_shoot
> downs
>      18445 =C2=B1  7%     -32.8%      12397 =C2=B1  6%  interrupts.CPU89.=
CAL:Function_
> call_interrupts
>     855.00 =C2=B1 19%     -76.7%     199.00 =C2=B1 11%  interrupts.CPU89.=
RES:Reschedul
> ing_interrupts
>      16547 =C2=B1 20%     -33.8%      10949        interrupts.CPU9.CAL:Fu=
nction_c
> all_interrupts
>     931.33 =C2=B1 33%     -66.4%     313.33 =C2=B1 13%  interrupts.CPU9.R=
ES:Rescheduli
> ng_interrupts
>      18040 =C2=B1  8%     -32.3%      12205 =C2=B1  4%  interrupts.CPU90.=
CAL:Function_
> call_interrupts
>     916.33 =C2=B1 24%     -78.5%     196.67 =C2=B1  5%  interrupts.CPU90.=
RES:Reschedul
> ing_interrupts
>      18369 =C2=B1  6%     -31.5%      12585 =C2=B1  4%  interrupts.CPU91.=
CAL:Function_
> call_interrupts
>     884.00 =C2=B1 27%     -77.2%     201.67 =C2=B1 10%  interrupts.CPU91.=
RES:Reschedul
> ing_interrupts
>      18539 =C2=B1  8%     -36.9%      11695 =C2=B1  3%  interrupts.CPU92.=
CAL:Function_
> call_interrupts
>       1287 =C2=B1  7%     -15.4%       1089        interrupts.CPU92.NMI:N=
on-maska
> ble_interrupts
>       1287 =C2=B1  7%     -15.4%       1089        interrupts.CPU92.PMI:P=
erforman
> ce_monitoring_interrupts
>     864.00 =C2=B1 20%     -78.4%     187.00 =C2=B1  5%  interrupts.CPU92.=
RES:Reschedul
> ing_interrupts
>       2885 =C2=B1  7%      -9.7%       2605 =C2=B1  8%  interrupts.CPU92.=
TLB:TLB_shoot
> downs
>      18050 =C2=B1  9%     -38.4%      11121 =C2=B1  8%  interrupts.CPU93.=
CAL:Function_
> call_interrupts
>       1673 =C2=B1 27%     -31.9%       1139 =C2=B1  2%  interrupts.CPU93.=
NMI:Non-maska
> ble_interrupts
>       1673 =C2=B1 27%     -31.9%       1139 =C2=B1  2%  interrupts.CPU93.=
PMI:Performan
> ce_monitoring_interrupts
>     916.33 =C2=B1 14%     -79.0%     192.33 =C2=B1 14%  interrupts.CPU93.=
RES:Reschedul
> ing_interrupts
>      18291 =C2=B1 11%     -33.9%      12096 =C2=B1  5%  interrupts.CPU94.=
CAL:Function_
> call_interrupts
>     903.00 =C2=B1 31%     -72.9%     244.33 =C2=B1 22%  interrupts.CPU94.=
RES:Reschedul
> ing_interrupts
>      18272 =C2=B1 10%     -33.2%      12200 =C2=B1  3%  interrupts.CPU95.=
CAL:Function_
> call_interrupts
>      17143 =C2=B1 11%     -30.1%      11988 =C2=B1  4%  interrupts.CPU96.=
CAL:Function_
> call_interrupts
>       1192 =C2=B1 25%     -82.5%     208.33 =C2=B1 14%  interrupts.CPU96.=
RES:Reschedul
> ing_interrupts
>      17148 =C2=B1 13%     -33.1%      11478 =C2=B1  2%  interrupts.CPU97.=
CAL:Function_
> call_interrupts
>       1088 =C2=B1 27%     -78.0%     240.00 =C2=B1 27%  interrupts.CPU97.=
RES:Reschedul
> ing_interrupts
>       2785 =C2=B1  3%     +15.4%       3214 =C2=B1  9%  interrupts.CPU97.=
TLB:TLB_shoot
> downs
>      18784 =C2=B1  9%     -39.3%      11397 =C2=B1  7%  interrupts.CPU98.=
CAL:Function_
> call_interrupts
>     963.00 =C2=B1 26%     -70.4%     284.67 =C2=B1 50%  interrupts.CPU98.=
RES:Reschedul
> ing_interrupts
>      19406 =C2=B1  8%     -37.6%      12114 =C2=B1  5%  interrupts.CPU99.=
CAL:Function_
> call_interrupts
>     972.33 =C2=B1 26%     -76.2%     231.00 =C2=B1 20%  interrupts.CPU99.=
RES:Reschedul
> ing_interrupts
>     260373 =C2=B1 26%     -66.1%      88366        interrupts.RES:Resched=
uling_in
> terrupts
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-knm01: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz with 80G =
mem
> ory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> blocksize/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/=
tes
> tcase/ucode:
>   512K/gcc-9/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-20200603=
.cg
> z/lkp-knm01/pigz/0x11
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           5:3           -1%           5:3     perf-profile.calltrace.cycl=
es-
> pp.error_entry
>           1:3           14%           1:3     perf-profile.calltrace.cycl=
es-
> pp.sync_regs.error_entry
>           0:3           -1%           0:3     perf-profile.children.cycle=
s-p
> p.error_return
>           7:3           -0%           7:3     perf-profile.children.cycle=
s-p
> p.error_entry
>           5:3           -1%           5:3     perf-profile.self.cycles-pp=
.er
> ror_entry
>          %stddev     %change         %stddev
>              \          |                \
>       1.96 =C2=B1  7%      -0.4        1.52 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.wake_up_q.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
>       1.93 =C2=B1  7%      -0.4        1.49 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.try_to_wake_up.wake_up_q.futex_wake.do_futex.__x64_sys_futex
>       2.25 =C2=B1  7%      -0.4        1.83 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_aft=
er_
> hwframe
>       2.00 =C2=B1  4%      -0.2        1.83 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.__libc_write
>       1.90 =C2=B1  4%      -0.2        1.75 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
>       1.84 =C2=B1  4%      -0.2        1.68 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__li=
bc_
> write
>       1.88 =C2=B1  4%      -0.1        1.73 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
>       1.92 =C2=B1  4%      -0.1        1.77 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.entry_SYSCALL_64_after_hwframe.__libc_write
>       1.76 =C2=B1  4%      -0.1        1.61 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_aft=
er_
> hwframe
>       0.84 =C2=B1  3%      -0.1        0.71 =C2=B1 18%  perf-profile.call=
trace.cycles-
> pp.rcu_dynticks_eqs_exit.rcu_eqs_exit.rcu_idle_exit.cpuidle_enter_state.c=
pui
> dle_enter
>       0.69 =C2=B1 10%      +0.1        0.79 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_ha=
ndl
> e.tick_sched_timer
>       0.61 =C2=B1  8%      +0.1        0.76 =C2=B1 11%  perf-profile.call=
trace.cycles-
> pp.perf_swevent_overflow.perf_tp_event.perf_trace_sched_switch.__schedule=
.sc
> hedule_idle
>       0.66 =C2=B1  8%      +0.2        0.81 =C2=B1 11%  perf-profile.call=
trace.cycles-
> pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule_idle.do_idle
>       0.74 =C2=B1  7%      +0.2        0.91 =C2=B1 10%  perf-profile.call=
trace.cycles-
> pp.perf_trace_sched_switch.__schedule.schedule_idle.do_idle.cpu_startup_e=
ntr
> y
>       0.63 =C2=B1  5%      +0.2        0.82 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.sched_ttwu_pending.flush_smp_call_function_from_idle.do_idle.cpu_start=
up_
> entry.start_secondary
>       0.79 =C2=B1  5%      +0.2        1.02 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.start_seco=
nda
> ry.secondary_startup_64_no_verify
>       1.92 =C2=B1  3%      +0.3        2.17        perf-profile.calltrace=
.cycles-
> pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       1.94 =C2=B1  3%      +0.3        2.20 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>       0.00            +0.6        0.56 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_f=
unc
> tion_from_idle.do_idle
>       0.00            +0.6        0.60 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_function_from_idle.=
do_
> idle.cpu_startup_entry
>       1.98 =C2=B1  7%      -0.4        1.54 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.wake_up_q
>       2.01 =C2=B1  7%      -0.4        1.57 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.try_to_wake_up
>       2.25 =C2=B1  7%      -0.4        1.83 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.futex_wake
>       0.21 =C2=B1  8%      -0.2        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-p
> p.set_task_cpu
>       2.02 =C2=B1  4%      -0.2        1.85 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.__libc_write
>       0.36 =C2=B1  2%      -0.2        0.20 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.select_task_rq_fair
>       1.86 =C2=B1  4%      -0.1        1.71 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.vfs_write
>       1.91 =C2=B1  4%      -0.1        1.76 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.ksys_write
>       1.77 =C2=B1  3%      -0.1        1.63 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.new_sync_write
>       0.15 =C2=B1  3%      -0.1        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.select_idle_sibling
>       0.33 =C2=B1 10%      -0.1        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.exit_to_user_mode_prepare
>       0.25 =C2=B1  3%      -0.1        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.syscall_exit_to_user_mode
>       0.15 =C2=B1  6%      -0.1        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.switch_fpu_return
>       0.64 =C2=B1  7%      -0.1        0.58 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.copy_user_enhanced_fast_string
>       0.13 =C2=B1 30%      -0.0        0.09 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.cmd_sched
>       0.15 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.asm_sysvec_call_function_single
>       0.45 =C2=B1  2%      -0.0        0.41 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__hrtimer_next_event_base
>       0.25 =C2=B1  8%      -0.0        0.21 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_lock_irq
>       0.15 =C2=B1  8%      -0.0        0.12 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.timekeeping_max_deferment
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.rb_insert_color
>       0.13 =C2=B1  3%      -0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.sysvec_call_function_single
>       0.11            -0.0        0.09 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.__sysvec_call_function_single
>       0.15 =C2=B1  5%      -0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.native_queued_spin_lock_slowpath
>       0.07 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.plist_add
>       0.05            +0.0        0.06 =C2=B1  7%  perf-profile.children.=
cycles-p
> p.put_prev_task_fair
>       0.06            +0.0        0.07 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.tick_nohz_idle_exit
>       0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.mark_wake_futex
>       0.21 =C2=B1  2%      +0.0        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.___perf_sw_event
>       0.19 =C2=B1  2%      +0.0        0.21 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.futex_wait_setup
>       0.13 =C2=B1  3%      +0.0        0.16 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.copy_fpregs_to_fpstate
>       0.17 =C2=B1  7%      +0.0        0.20 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.tick_sched_do_timer
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.do_sys_open
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.send_call_function_single_ipi
>       0.55 =C2=B1  7%      +0.1        0.66 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.run_posix_cpu_timers
>       0.74 =C2=B1  4%      +0.2        0.90 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.sched_ttwu_pending
>       0.80 =C2=B1  5%      +0.2        1.03 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.flush_smp_call_function_from_idle
>       1.95 =C2=B1  2%      +0.3        2.21        perf-profile.children.=
cycles-p
> p.schedule_idle
>       0.15 =C2=B1  5%      -0.1        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.sw
> itch_fpu_return
>       0.52 =C2=B1  8%      -0.0        0.47 =C2=B1  6%  perf-profile.self=
.cycles-pp.co
> py_user_enhanced_fast_string
>       0.34 =C2=B1  6%      -0.0        0.29 =C2=B1  5%  perf-profile.self=
.cycles-pp.ti
> ck_program_event
>       0.15 =C2=B1  9%      -0.0        0.11 =C2=B1 12%  perf-profile.self=
.cycles-pp.ti
> mekeeping_max_deferment
>       0.13 =C2=B1  7%      -0.0        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp.se
> lect_task_rq_fair
>       0.24 =C2=B1  6%      -0.0        0.21 =C2=B1 10%  perf-profile.self=
.cycles-pp._r
> aw_spin_lock_irq
>       0.12 =C2=B1  7%      -0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.rb
> _insert_color
>       0.14 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.na
> tive_queued_spin_lock_slowpath
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.fi
> nd_busiest_group
>       0.14 =C2=B1  3%      +0.0        0.16 =C2=B1  2%  perf-profile.self=
.cycles-pp.__
> _perf_sw_event
>       0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  7%  perf-profile.self=
.cycles-pp.pe
> rf_callchain
>       0.10 =C2=B1  4%      +0.0        0.13 =C2=B1 13%  perf-profile.self=
.cycles-pp.rc
> u_is_cpu_rrupt_from_idle
>       0.13 =C2=B1  3%      +0.0        0.16 =C2=B1  6%  perf-profile.self=
.cycles-pp.co
> py_fpregs_to_fpstate
>       0.14 =C2=B1  5%      +0.0        0.17 =C2=B1  7%  perf-profile.self=
.cycles-pp.ti
> ck_sched_do_timer
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.se
> nd_call_function_single_ipi
>       0.55 =C2=B1  7%      +0.1        0.66 =C2=B1  9%  perf-profile.self=
.cycles-pp.ru
> n_posix_cpu_timers
>  2.331e+08           +16.1%  2.706e+08        pigz.throughput
>     136590 =C2=B1  2%     -32.2%      92605        pigz.time.involuntary_=
context_
> switches
>     400968 =C2=B1  3%     +14.9%     460538 =C2=B1 10%  pigz.time.maximum=
_resident_set
> _size
>    1756258            +9.7%    1926349        pigz.time.minor_page_faults
>   27954757           +18.8%   33200349        pigz.time.voluntary_context=
_sw
> itches
>    9661422           +34.3%   12979714 =C2=B1  2%  cpuidle.POLL.time
>     124621           +33.6%     166534        cpuidle.POLL.usage
>      11687 =C2=B1 10%     +14.3%      13353 =C2=B1  4%  numa-meminfo.node=
1.SUnreclaim
>      29873 =C2=B1  3%      +9.7%      32762        numa-meminfo.node1.Slab
>   24808520           +15.2%   28579258        numa-numastat.node0.local_n=
ode
>   24808463           +15.2%   28579201        numa-numastat.node0.numa_hit
>       4305 =C2=B1  5%      -7.3%       3992 =C2=B1  3%  slabinfo.kmalloc-=
rcl-512.activ
> e_objs
>       4305 =C2=B1  5%      -6.8%       4013 =C2=B1  4%  slabinfo.kmalloc-=
rcl-512.num_o
> bjs
>     178246           +23.8%     220649        vmstat.system.cs
>     593115            -1.2%     586294        vmstat.system.in
>   14561307           +12.5%   16386444        numa-vmstat.node0.numa_hit
>   14561374           +12.5%   16386527        numa-vmstat.node0.numa_local
>       2921 =C2=B1 10%     +14.3%       3338 =C2=B1  4%  numa-vmstat.node1=
.nr_slab_unre
> claimable
>     112362            +4.7%     117669 =C2=B1  2%  proc-vmstat.nr_active_=
anon
>     157800            +5.7%     166794        proc-vmstat.nr_anon_pages
>     163762            +5.4%     172535        proc-vmstat.nr_inactive_anon
>     118609            +4.3%     123699 =C2=B1  2%  proc-vmstat.nr_shmem
>     112362            +4.7%     117669 =C2=B1  2%  proc-vmstat.nr_zone_ac=
tive_ano
> n
>     163762            +5.4%     172535        proc-vmstat.nr_zone_inactiv=
e_a
> non
>    1393256            +9.0%    1518392        proc-vmstat.numa_hint_faults
>    1393261            +9.0%    1518394        proc-vmstat.numa_hint_fault=
s_l
> ocal
>   24826676           +15.0%   28558291        proc-vmstat.numa_hit
>   24826672           +15.0%   28558285        proc-vmstat.numa_local
>    2080066            +6.9%    2223847        proc-vmstat.numa_pte_updates
>   25021577           +15.1%   28795450        proc-vmstat.pgalloc_normal
>    2822792            +6.3%    3001809        proc-vmstat.pgfault
>   24766991           +15.1%   28504864        proc-vmstat.pgfree
>       5.07 =C2=B1  6%     -12.5%       4.43 =C2=B1  7%  sched_debug.cfs_r=
q:/.load_avg.
> avg
>   11185556 =C2=B1  6%      -9.7%   10095369 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.max
>     648342 =C2=B1 18%     -28.8%     461601 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.stddev
>       0.26 =C2=B1  8%     -16.4%       0.22 =C2=B1  3%  sched_debug.cfs_r=
q:/.nr_runnin
> g.avg
>     290.96 =C2=B1  8%     -20.3%     231.97 =C2=B1  5%  sched_debug.cfs_r=
q:/.runnable_
> avg.avg
>       1459 =C2=B1  9%     -14.3%       1250 =C2=B1  7%  sched_debug.cfs_r=
q:/.runnable_
> avg.max
>       0.01 =C2=B1  4%     -12.7%       0.01        sched_debug.cfs_rq:/.s=
pread.av
> g
>    5656630 =C2=B1 22%     -27.4%    4108227 =C2=B1  6%  sched_debug.cfs_r=
q:/.spread0.m
> ax
>     -27206           +60.1%     -43571        sched_debug.cfs_rq:/.spread=
0.m
> in
>     648305 =C2=B1 18%     -29.0%     460203 =C2=B1  2%  sched_debug.cfs_r=
q:/.spread0.s
> tddev
>     288.57 =C2=B1  8%     -20.2%     230.40 =C2=B1  5%  sched_debug.cfs_r=
q:/.util_avg.
> avg
>       1333 =C2=B1  3%     -20.0%       1066 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_avg.
> max
>      64.33 =C2=B1  9%     -16.3%      53.86 =C2=B1  7%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.avg
>     609256 =C2=B1  5%      -9.9%     549211 =C2=B1  5%  sched_debug.cpu.a=
vg_idle.stdde
> v
>      92180           +23.1%     113474        sched_debug.cpu.nr_switches=
.av
> g
>     116350 =C2=B1  3%     +16.5%     135536 =C2=B1  5%  sched_debug.cpu.n=
r_switches.ma
> x
>      69882 =C2=B1  7%     +24.0%      86668 =C2=B1  2%  sched_debug.cpu.n=
r_switches.mi
> n
>      29.34            -3.4%      28.35        perf-stat.i.MPKI
>  9.568e+09           +14.8%  1.098e+10        perf-stat.i.branch-instruct=
ion
> s
>  8.809e+08           +14.3%  1.007e+09        perf-stat.i.branch-misses
>      17.12            -3.5       13.63        perf-stat.i.cache-miss-rate%
>  3.262e+08           -11.5%  2.888e+08        perf-stat.i.cache-misses
>    1.9e+09           +11.1%  2.111e+09        perf-stat.i.cache-references
>     180810           +23.6%     223499        perf-stat.i.context-switches
>       3.70           -12.8%       3.22        perf-stat.i.cpi
>      20971           -88.2%       2468        perf-stat.i.cpu-migrations
>     738.33           +13.6%     838.51        perf-stat.i.cycles-between-=
cac
> he-misses
>       0.11            -0.0        0.10        perf-stat.i.iTLB-load-miss-=
rat
> e%
>   73336743            +4.2%   76396455        perf-stat.i.iTLB-load-misses
>   6.47e+10           +15.0%  7.442e+10        perf-stat.i.iTLB-loads
>  6.474e+10           +15.0%  7.444e+10        perf-stat.i.instructions
>     883.56           +10.4%     975.62        perf-stat.i.instructions-pe=
r-i
> TLB-miss
>       0.27           +15.4%       0.31        perf-stat.i.ipc
>       0.76           +11.5%       0.85        perf-stat.i.metric.K/sec
>     264.26           +14.9%     303.54        perf-stat.i.metric.M/sec
>       9065            +7.0%       9701        perf-stat.i.minor-faults
>       9067            +7.0%       9703        perf-stat.i.page-faults
>      29.37            -3.3%      28.41        perf-stat.overall.MPKI
>      17.23            -3.4       13.85        perf-stat.overall.cache-mis=
s-r
> ate%
>       3.70           -12.7%       3.23        perf-stat.overall.cpi
>     730.89           +12.4%     821.16        perf-stat.overall.cycles-be=
twe
> en-cache-misses
>       0.11            -0.0        0.10        perf-stat.overall.iTLB-load=
-mi
> ss-rate%
>     882.57           +10.4%     974.27        perf-stat.overall.instructi=
ons
> -per-iTLB-miss
>       0.27           +14.5%       0.31        perf-stat.overall.ipc
>  9.506e+09           +14.7%   1.09e+10        perf-stat.ps.branch-instruc=
tio
> ns
>  8.748e+08           +14.2%  9.992e+08        perf-stat.ps.branch-misses
>  3.254e+08           -10.7%  2.907e+08        perf-stat.ps.cache-misses
>  1.889e+09           +11.2%  2.099e+09        perf-stat.ps.cache-referenc=
es
>     179074           +23.6%     221340        perf-stat.ps.context-switch=
es
>      20736           -88.2%       2449        perf-stat.ps.cpu-migrations
>   72857007            +4.1%   75853857        perf-stat.ps.iTLB-load-miss=
es
>  6.426e+10           +15.0%  7.387e+10        perf-stat.ps.iTLB-loads
>   6.43e+10           +14.9%  7.389e+10        perf-stat.ps.instructions
>       1.96            +2.6%       2.01        perf-stat.ps.major-faults
>       9209            +6.6%       9816        perf-stat.ps.minor-faults
>       9211            +6.6%       9818        perf-stat.ps.page-faults
>   1.94e+13           +15.0%  2.231e+13        perf-stat.total.instructions
>      15693 =C2=B1  8%     -11.5%      13882 =C2=B1  2%  softirqs.CPU10.RCU
>      14214 =C2=B1  5%      -4.8%      13538 =C2=B1  5%  softirqs.CPU110.R=
CU
>      17826 =C2=B1  2%      -9.0%      16219        softirqs.CPU128.SCHED
>      13987 =C2=B1  4%      -5.6%      13209 =C2=B1  2%  softirqs.CPU137.R=
CU
>      15098 =C2=B1  2%     -11.5%      13361 =C2=B1  2%  softirqs.CPU146.R=
CU
>      16209 =C2=B1  2%     -12.4%      14203        softirqs.CPU15.RCU
>      15015 =C2=B1  5%      -5.6%      14169 =C2=B1  5%  softirqs.CPU16.RCU
>      17206 =C2=B1  3%      -7.8%      15870 =C2=B1  2%  softirqs.CPU165.S=
CHED
>      13975 =C2=B1  4%      -5.1%      13261 =C2=B1  2%  softirqs.CPU176.R=
CU
>      15823 =C2=B1 10%     -15.2%      13425        softirqs.CPU183.RCU
>      14224 =C2=B1  7%      -8.4%      13027 =C2=B1  2%  softirqs.CPU192.R=
CU
>      14415            -9.4%      13064        softirqs.CPU202.RCU
>      14556 =C2=B1  2%     -11.1%      12945 =C2=B1  2%  softirqs.CPU218.R=
CU
>      14532 =C2=B1  6%     -11.0%      12939 =C2=B1  3%  softirqs.CPU219.R=
CU
>      17949 =C2=B1  4%     -11.5%      15894        softirqs.CPU223.SCHED
>      17154 =C2=B1  2%      -9.0%      15610 =C2=B1  2%  softirqs.CPU230.S=
CHED
>      15884 =C2=B1 14%     -17.3%      13134        softirqs.CPU233.RCU
>      17619 =C2=B1  3%     -10.9%      15705 =C2=B1  3%  softirqs.CPU235.S=
CHED
>      17292 =C2=B1  3%      -7.1%      16058        softirqs.CPU237.SCHED
>      15487 =C2=B1  8%     -14.9%      13177        softirqs.CPU245.RCU
>      17378 =C2=B1  3%      -9.1%      15793 =C2=B1  2%  softirqs.CPU249.S=
CHED
>      17054 =C2=B1  2%      -9.3%      15472        softirqs.CPU250.SCHED
>      14980 =C2=B1  4%      -7.2%      13908 =C2=B1  2%  softirqs.CPU27.RCU
>      17436 =C2=B1  2%      -6.2%      16350 =C2=B1  2%  softirqs.CPU278.S=
CHED
>      18151           -11.9%      16000 =C2=B1  2%  softirqs.CPU279.SCHED
>      17182 =C2=B1 10%     -18.2%      14052 =C2=B1  2%  softirqs.CPU3.RCU
>      14891            -9.2%      13517 =C2=B1  2%  softirqs.CPU32.RCU
>      14599 =C2=B1  4%      -4.5%      13944 =C2=B1  4%  softirqs.CPU34.RCU
>      14707 =C2=B1  4%      -7.6%      13589        softirqs.CPU36.RCU
>      14596 =C2=B1  6%      -7.4%      13509 =C2=B1  2%  softirqs.CPU48.RCU
>      14443 =C2=B1  5%      -7.7%      13331        softirqs.CPU52.RCU
>      14686 =C2=B1  6%      -9.1%      13354        softirqs.CPU58.RCU
>      14346 =C2=B1  4%      -6.9%      13363 =C2=B1  3%  softirqs.CPU65.RCU
>      14322 =C2=B1  4%      -7.3%      13273 =C2=B1  2%  softirqs.CPU66.RCU
>      16342 =C2=B1 15%     -18.0%      13408        softirqs.CPU68.RCU
>      14111 =C2=B1  5%      -4.4%      13494 =C2=B1  5%  softirqs.CPU70.RCU
>      14822 =C2=B1  5%      -8.7%      13529 =C2=B1  2%  softirqs.CPU74.RCU
>      14719 =C2=B1  5%      -9.1%      13375 =C2=B1  2%  softirqs.CPU75.RCU
>      14101 =C2=B1  5%      -6.4%      13200 =C2=B1  3%  softirqs.CPU79.RCU
>      49411 =C2=B1  2%      +8.7%      53696 =C2=B1  3%  softirqs.TIMER
>       0.20 =C2=B1 37%     -53.8%       0.09 =C2=B1 44%  perf-sched.sch_de=
lay.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_=
int
> errupt.[unknown]
>       0.01 =C2=B1 71%    +906.2%       0.11 =C2=B1109%  perf-sched.sch_de=
lay.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on.
> [unknown]
>       0.13 =C2=B1 69%    +414.0%       0.65 =C2=B1  3%  perf-sched.sch_de=
lay.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_=
ipi
> .[unknown]
>       0.09 =C2=B1  2%     -18.1%       0.08 =C2=B1 10%  perf-sched.sch_de=
lay.avg.ms.pi
> pe_write.new_sync_write.vfs_write.ksys_write
>       0.08 =C2=B1  4%     -30.2%       0.06 =C2=B1 20%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.copy_page_from_iter.pipe_write.new_sy=
nc_
> write
>       0.07 =C2=B1 30%     -67.0%       0.02 =C2=B1 71%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.futex_wait_queue_me.futex_wait.do_fut=
ex
>       0.04 =C2=B1  7%     -10.6%       0.04 =C2=B1  6%  perf-sched.sch_de=
lay.avg.ms.rc
> u_gp_kthread.kthread.ret_from_fork
>       0.05 =C2=B1 26%     -81.7%       0.01 =C2=B1141%  perf-sched.sch_de=
lay.avg.ms.sc
> hedule_timeout.wait_for_completion.__flush_work.lru_add_drain_all
>       0.02 =C2=B1  3%     -20.3%       0.02 =C2=B1  6%  perf-sched.sch_de=
lay.avg.ms.wa
> it_for_partner.fifo_open.do_dentry_open.path_openat
>       0.03 =C2=B1 73%    +720.3%       0.22 =C2=B1108%  perf-sched.sch_de=
lay.max.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on.
> [unknown]
>      33.03 =C2=B1 67%    +540.9%     211.67 =C2=B1 16%  perf-sched.sch_de=
lay.max.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_=
ipi
> .[unknown]
>     234.14 =C2=B1  6%     +18.6%     277.78        perf-sched.sch_delay.m=
ax.ms.fu
> tex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
>       0.20 =C2=B1 73%     -88.3%       0.02 =C2=B1 71%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.futex_wait_queue_me.futex_wait.do_fut=
ex
>       0.05 =C2=B1 67%    +521.9%       0.30 =C2=B1 89%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.stop_one_cpu.sched_exec.bprm_execve
>       0.19 =C2=B1 39%     -63.8%       0.07 =C2=B1  9%  perf-sched.sch_de=
lay.max.ms.rc
> u_gp_kthread.kthread.ret_from_fork
>       0.22 =C2=B1 63%     -54.1%       0.10 =C2=B1 24%  perf-sched.sch_de=
lay.max.ms.sc
> hedule_timeout.kcompactd.kthread.ret_from_fork
>      15.31 =C2=B1  2%     -12.4%      13.42 =C2=B1  2%  perf-sched.total_=
wait_and_dela
> y.average.ms
>     357602           +18.2%     422692 =C2=B1  2%  perf-sched.total_wait_=
and_dela
> y.count.ms
>      15.13           -12.3%      13.28 =C2=B1  2%  perf-sched.total_wait_=
time.ave
> rage.ms
>     380.42 =C2=B1 13%     -17.9%     312.17 =C2=B1 14%  perf-sched.wait_a=
nd_delay.avg.
> ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>     167.54 =C2=B1  8%     +45.4%     243.69 =C2=B1  7%  perf-sched.wait_a=
nd_delay.avg.
> ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>       4.77           -11.7%       4.21 =C2=B1  2%  perf-sched.wait_and_de=
lay.avg.
> ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
>       1.00           -12.7%       0.88 =C2=B1  2%  perf-sched.wait_and_de=
lay.avg.
> ms.pipe_write.new_sync_write.vfs_write.ksys_write
>     333519           +19.8%     399522 =C2=B1  2%  perf-sched.wait_and_de=
lay.coun
> t.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
>       4944           +13.6%       5616        perf-sched.wait_and_delay.c=
oun
> t.pipe_write.new_sync_write.vfs_write.ksys_write
>     380.29 =C2=B1 13%     -17.9%     312.07 =C2=B1 14%  perf-sched.wait_t=
ime.avg.ms.de
> vkmsg_read.vfs_read.ksys_read.do_syscall_64
>     166.15 =C2=B1  9%     +44.9%     240.80 =C2=B1  7%  perf-sched.wait_t=
ime.avg.ms.do
> _task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>       0.92 =C2=B1  5%     -14.4%       0.79 =C2=B1  6%  perf-sched.wait_t=
ime.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_=
int
> errupt.[unknown]
>       0.15 =C2=B1 70%    +381.7%       0.72 =C2=B1 78%  perf-sched.wait_t=
ime.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on.
> [unknown]
>       0.87 =C2=B1  6%     -21.8%       0.68 =C2=B1  3%  perf-sched.wait_t=
ime.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_=
ipi
> .[unknown]
>       4.64           -12.0%       4.08 =C2=B1  2%  perf-sched.wait_time.a=
vg.ms.fu
> tex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
>       0.91           -12.3%       0.80        perf-sched.wait_time.avg.ms=
.pi
> pe_write.new_sync_write.vfs_write.ksys_write
>       0.49 =C2=B1 52%     -77.7%       0.11 =C2=B1 45%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc_pages_vm=
a.s
> hmem_alloc_page
>       0.01 =C2=B1141%    +213.6%       0.05 =C2=B1 17%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.__sb_start_write.vfs_write.ksys_write
>       0.92 =C2=B1  2%     -19.4%       0.74 =C2=B1 11%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.copy_page_from_iter.pipe_write.new_sy=
nc_
> write
>       1.73 =C2=B1100%     -95.8%       0.07 =C2=B1 23%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.find_lock_entry.shmem_getpage_gfp.shm=
em_
> write_begin
>       0.40 =C2=B1 28%     -93.7%       0.03 =C2=B1141%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.mutex_lock.__fdget_pos.ksys_write
>       2.52 =C2=B1  6%     +19.2%       3.00 =C2=B1  6%  perf-sched.wait_t=
ime.avg.ms.rc
> u_gp_kthread.kthread.ret_from_fork
>       0.00 =C2=B1 88%    +362.5%       0.01 =C2=B1 10%  perf-sched.wait_t=
ime.avg.ms.wa
> it_for_partner.fifo_open.do_dentry_open.path_openat
>       0.28 =C2=B1 74%    +356.0%       1.28 =C2=B1 81%  perf-sched.wait_t=
ime.max.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on.
> [unknown]
>      52.67 =C2=B1 50%     -51.4%      25.59 =C2=B1 86%  perf-sched.wait_t=
ime.max.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on_
> single.[unknown]
>       0.89 =C2=B1 44%     -78.7%       0.19 =C2=B1 53%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.__alloc_pages_nodemask.alloc_pages_vm=
a.s
> hmem_alloc_page
>       0.01 =C2=B1141%    +277.3%       0.06 =C2=B1 10%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.__sb_start_write.vfs_write.ksys_write
>       5.01 =C2=B1103%     -96.6%       0.17 =C2=B1 51%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.find_lock_entry.shmem_getpage_gfp.shm=
em_
> write_begin
>       8.86 =C2=B1  6%     -60.2%       3.53 =C2=B1 87%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.futex_wait_queue_me.futex_wait.do_fut=
ex
>       0.62 =C2=B1 27%     -95.9%       0.03 =C2=B1141%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.mutex_lock.__fdget_pos.ksys_write
>    4582057           -35.0%    2979204        interrupts.CAL:Function_cal=
l_i
> nterrupts
>       9004 =C2=B1 13%     -25.2%       6734 =C2=B1  7%  interrupts.CPU0.C=
AL:Function_c
> all_interrupts
>       1327 =C2=B1  8%     -53.5%     617.33 =C2=B1 16%  interrupts.CPU0.R=
ES:Rescheduli
> ng_interrupts
>      12936 =C2=B1 13%     -35.1%       8395 =C2=B1  9%  interrupts.CPU1.C=
AL:Function_c
> all_interrupts
>     991.00 =C2=B1 11%     -29.8%     695.67 =C2=B1 23%  interrupts.CPU1.R=
ES:Rescheduli
> ng_interrupts
>      16614 =C2=B1  3%     -43.0%       9468 =C2=B1  3%  interrupts.CPU10.=
CAL:Function_
> call_interrupts
>     987.33 =C2=B1  5%     -43.7%     555.67 =C2=B1  8%  interrupts.CPU10.=
RES:Reschedul
> ing_interrupts
>       7092 =C2=B1  8%     -15.9%       5965 =C2=B1  8%  interrupts.CPU10.=
TLB:TLB_shoot
> downs
>      16676 =C2=B1  4%     -36.9%      10524 =C2=B1  6%  interrupts.CPU100=
.CAL:Function
> _call_interrupts
>     800.67 =C2=B1 12%     -67.1%     263.33 =C2=B1 18%  interrupts.CPU100=
.RES:Reschedu
> ling_interrupts
>      16946 =C2=B1  4%     -38.2%      10465 =C2=B1  3%  interrupts.CPU101=
.CAL:Function
> _call_interrupts
>     790.67 =C2=B1 10%     -65.0%     277.00 =C2=B1 12%  interrupts.CPU101=
.RES:Reschedu
> ling_interrupts
>      16661           -34.8%      10858 =C2=B1  3%  interrupts.CPU102.CAL:=
Function
> _call_interrupts
>       2277 =C2=B1 16%     +71.0%       3894 =C2=B1  5%  interrupts.CPU102=
.NMI:Non-mask
> able_interrupts
>       2277 =C2=B1 16%     +71.0%       3894 =C2=B1  5%  interrupts.CPU102=
.PMI:Performa
> nce_monitoring_interrupts
>     801.00 =C2=B1  9%     -67.0%     264.00 =C2=B1 16%  interrupts.CPU102=
.RES:Reschedu
> ling_interrupts
>       7386 =C2=B1  5%     -14.2%       6338 =C2=B1  7%  interrupts.CPU102=
.TLB:TLB_shoo
> tdowns
>      15785           -31.8%      10772        interrupts.CPU103.CAL:Funct=
ion
> _call_interrupts
>     783.33 =C2=B1 13%     -69.4%     239.33 =C2=B1 10%  interrupts.CPU103=
.RES:Reschedu
> ling_interrupts
>      15907 =C2=B1  3%     -37.4%       9956 =C2=B1  6%  interrupts.CPU104=
.CAL:Function
> _call_interrupts
>     710.00 =C2=B1  4%     -68.8%     221.67 =C2=B1 12%  interrupts.CPU104=
.RES:Reschedu
> ling_interrupts
>      15829 =C2=B1  7%     -35.5%      10207 =C2=B1  4%  interrupts.CPU105=
.CAL:Function
> _call_interrupts
>     733.33 =C2=B1  9%     -71.3%     210.33 =C2=B1  8%  interrupts.CPU105=
.RES:Reschedu
> ling_interrupts
>      16174 =C2=B1  5%     -32.9%      10859 =C2=B1  6%  interrupts.CPU106=
.CAL:Function
> _call_interrupts
>     746.33           -67.1%     245.33        interrupts.CPU106.RES:Resch=
edu
> ling_interrupts
>      16730 =C2=B1  5%     -34.2%      11003 =C2=B1  6%  interrupts.CPU107=
.CAL:Function
> _call_interrupts
>     731.00 =C2=B1  2%     -65.4%     253.00 =C2=B1 11%  interrupts.CPU107=
.RES:Reschedu
> ling_interrupts
>      16184           -34.1%      10668 =C2=B1  5%  interrupts.CPU108.CAL:=
Function
> _call_interrupts
>     794.00 =C2=B1 12%     -67.7%     256.67 =C2=B1 16%  interrupts.CPU108=
.RES:Reschedu
> ling_interrupts
>      16207 =C2=B1  2%     -37.0%      10209 =C2=B1  3%  interrupts.CPU109=
.CAL:Function
> _call_interrupts
>     761.00 =C2=B1 10%     -67.0%     251.00 =C2=B1  4%  interrupts.CPU109=
.RES:Reschedu
> ling_interrupts
>       6789 =C2=B1  3%      -8.6%       6203 =C2=B1  5%  interrupts.CPU109=
.TLB:TLB_shoo
> tdowns
>      16053 =C2=B1  2%     -39.4%       9733 =C2=B1  4%  interrupts.CPU11.=
CAL:Function_
> call_interrupts
>       1028 =C2=B1 10%     -46.1%     554.33 =C2=B1  9%  interrupts.CPU11.=
RES:Reschedul
> ing_interrupts
>      15984           -31.0%      11031 =C2=B1  2%  interrupts.CPU110.CAL:=
Function
> _call_interrupts
>     833.33 =C2=B1  4%     -68.9%     259.00 =C2=B1 11%  interrupts.CPU110=
.RES:Reschedu
> ling_interrupts
>      16174 =C2=B1  3%     -33.5%      10748 =C2=B1  3%  interrupts.CPU111=
.CAL:Function
> _call_interrupts
>     794.33 =C2=B1  3%     -69.2%     244.33 =C2=B1  5%  interrupts.CPU111=
.RES:Reschedu
> ling_interrupts
>      16614           -38.5%      10224 =C2=B1  3%  interrupts.CPU112.CAL:=
Function
> _call_interrupts
>       4292 =C2=B1 16%     -25.0%       3218 =C2=B1 25%  interrupts.CPU112=
.NMI:Non-mask
> able_interrupts
>       4292 =C2=B1 16%     -25.0%       3218 =C2=B1 25%  interrupts.CPU112=
.PMI:Performa
> nce_monitoring_interrupts
>     735.00 =C2=B1  3%     -68.0%     235.00 =C2=B1  5%  interrupts.CPU112=
.RES:Reschedu
> ling_interrupts
>       6857 =C2=B1  2%     -14.5%       5860 =C2=B1  5%  interrupts.CPU112=
.TLB:TLB_shoo
> tdowns
>      16504 =C2=B1  2%     -38.7%      10118        interrupts.CPU113.CAL:=
Function
> _call_interrupts
>     676.00 =C2=B1  5%     -65.7%     231.67 =C2=B1  3%  interrupts.CPU113=
.RES:Reschedu
> ling_interrupts
>      16456           -37.1%      10356 =C2=B1  6%  interrupts.CPU114.CAL:=
Function
> _call_interrupts
>     696.67           -67.4%     227.00 =C2=B1  2%  interrupts.CPU114.RES:=
Reschedu
> ling_interrupts
>      16357 =C2=B1  5%     -35.2%      10606 =C2=B1  2%  interrupts.CPU115=
.CAL:Function
> _call_interrupts
>     681.33 =C2=B1  5%     -69.0%     211.00 =C2=B1  8%  interrupts.CPU115=
.RES:Reschedu
> ling_interrupts
>      16180 =C2=B1  5%     -33.2%      10803 =C2=B1  4%  interrupts.CPU116=
.CAL:Function
> _call_interrupts
>     711.33 =C2=B1  3%     -65.0%     249.00 =C2=B1 19%  interrupts.CPU116=
.RES:Reschedu
> ling_interrupts
>      15499 =C2=B1  4%     -33.2%      10359 =C2=B1  3%  interrupts.CPU117=
.CAL:Function
> _call_interrupts
>     663.67 =C2=B1  3%     -59.4%     269.67 =C2=B1  8%  interrupts.CPU117=
.RES:Reschedu
> ling_interrupts
>      16179 =C2=B1  4%     -37.8%      10059 =C2=B1  3%  interrupts.CPU118=
.CAL:Function
> _call_interrupts
>     807.00 =C2=B1  9%     -70.3%     239.67 =C2=B1 12%  interrupts.CPU118=
.RES:Reschedu
> ling_interrupts
>      15405 =C2=B1  3%     -33.3%      10274 =C2=B1  5%  interrupts.CPU119=
.CAL:Function
> _call_interrupts
>     734.67 =C2=B1 16%     -62.2%     277.67 =C2=B1 34%  interrupts.CPU119=
.RES:Reschedu
> ling_interrupts
>      16214           -39.7%       9771 =C2=B1  2%  interrupts.CPU12.CAL:F=
unction_
> call_interrupts
>       1008 =C2=B1  6%     -48.2%     521.67 =C2=B1  6%  interrupts.CPU12.=
RES:Reschedul
> ing_interrupts
>      15971 =C2=B1  5%     -32.4%      10803        interrupts.CPU120.CAL:=
Function
> _call_interrupts
>     729.00           -65.9%     248.33 =C2=B1 14%  interrupts.CPU120.RES:=
Reschedu
> ling_interrupts
>      15936 =C2=B1  2%     -35.1%      10337 =C2=B1  4%  interrupts.CPU121=
.CAL:Function
> _call_interrupts
>     750.67 =C2=B1  2%     -69.2%     231.33 =C2=B1 11%  interrupts.CPU121=
.RES:Reschedu
> ling_interrupts
>      16646 =C2=B1  2%     -33.5%      11066 =C2=B1  2%  interrupts.CPU122=
.CAL:Function
> _call_interrupts
>     779.67 =C2=B1  6%     -69.2%     240.00 =C2=B1  2%  interrupts.CPU122=
.RES:Reschedu
> ling_interrupts
>      16369 =C2=B1  2%     -35.2%      10608        interrupts.CPU123.CAL:=
Function
> _call_interrupts
>       2989 =C2=B1 22%     +39.3%       4164 =C2=B1  9%  interrupts.CPU123=
.NMI:Non-mask
> able_interrupts
>       2989 =C2=B1 22%     +39.3%       4164 =C2=B1  9%  interrupts.CPU123=
.PMI:Performa
> nce_monitoring_interrupts
>     733.00 =C2=B1  3%     -69.1%     226.67        interrupts.CPU123.RES:=
Reschedu
> ling_interrupts
>      15162 =C2=B1  6%     -31.6%      10372 =C2=B1  6%  interrupts.CPU124=
.CAL:Function
> _call_interrupts
>       2910 =C2=B1 22%     -37.8%       1809 =C2=B1 21%  interrupts.CPU124=
.NMI:Non-mask
> able_interrupts
>       2910 =C2=B1 22%     -37.8%       1809 =C2=B1 21%  interrupts.CPU124=
.PMI:Performa
> nce_monitoring_interrupts
>     683.33 =C2=B1  2%     -66.6%     228.33 =C2=B1  8%  interrupts.CPU124=
.RES:Reschedu
> ling_interrupts
>      15315 =C2=B1  4%     -33.3%      10209 =C2=B1  9%  interrupts.CPU125=
.CAL:Function
> _call_interrupts
>       3338 =C2=B1 19%     -49.4%       1689 =C2=B1 21%  interrupts.CPU125=
.NMI:Non-mask
> able_interrupts
>       3338 =C2=B1 19%     -49.4%       1689 =C2=B1 21%  interrupts.CPU125=
.PMI:Performa
> nce_monitoring_interrupts
>     671.00 =C2=B1  4%     -59.1%     274.33 =C2=B1 18%  interrupts.CPU125=
.RES:Reschedu
> ling_interrupts
>      15764 =C2=B1  4%     -33.8%      10429 =C2=B1  3%  interrupts.CPU126=
.CAL:Function
> _call_interrupts
>     695.00 =C2=B1  5%     -60.5%     274.67 =C2=B1 15%  interrupts.CPU126=
.RES:Reschedu
> ling_interrupts
>      15821 =C2=B1  4%     -32.3%      10715 =C2=B1  5%  interrupts.CPU127=
.CAL:Function
> _call_interrupts
>     699.33 =C2=B1  5%     -67.0%     231.00 =C2=B1  4%  interrupts.CPU127=
.RES:Reschedu
> ling_interrupts
>      15321           -29.8%      10757        interrupts.CPU128.CAL:Funct=
ion
> _call_interrupts
>       3563 =C2=B1 28%     -44.6%       1975 =C2=B1  2%  interrupts.CPU128=
.NMI:Non-mask
> able_interrupts
>       3563 =C2=B1 28%     -44.6%       1975 =C2=B1  2%  interrupts.CPU128=
.PMI:Performa
> nce_monitoring_interrupts
>     675.67 =C2=B1  2%     -51.8%     325.67 =C2=B1 33%  interrupts.CPU128=
.RES:Reschedu
> ling_interrupts
>       6241            +9.5%       6836 =C2=B1  2%  interrupts.CPU128.TLB:=
TLB_shoo
> tdowns
>      14847           -32.3%      10057 =C2=B1  3%  interrupts.CPU129.CAL:=
Function
> _call_interrupts
>     687.00 =C2=B1  9%     -58.7%     283.67 =C2=B1 11%  interrupts.CPU129=
.RES:Reschedu
> ling_interrupts
>      16264           -36.9%      10269 =C2=B1  2%  interrupts.CPU13.CAL:F=
unction_
> call_interrupts
>       1812 =C2=B1  2%     +14.2%       2068 =C2=B1  2%  interrupts.CPU13.=
NMI:Non-maska
> ble_interrupts
>       1812 =C2=B1  2%     +14.2%       2068 =C2=B1  2%  interrupts.CPU13.=
PMI:Performan
> ce_monitoring_interrupts
>     969.33 =C2=B1  2%     -46.4%     519.67 =C2=B1  3%  interrupts.CPU13.=
RES:Reschedul
> ing_interrupts
>      16510 =C2=B1  2%     -37.1%      10391 =C2=B1  3%  interrupts.CPU130=
.CAL:Function
> _call_interrupts
>     750.00 =C2=B1  8%     -59.9%     301.00 =C2=B1 30%  interrupts.CPU130=
.RES:Reschedu
> ling_interrupts
>       6827 =C2=B1  2%      -9.0%       6214 =C2=B1  5%  interrupts.CPU130=
.TLB:TLB_shoo
> tdowns
>      15687 =C2=B1  5%     -31.7%      10715 =C2=B1  6%  interrupts.CPU131=
.CAL:Function
> _call_interrupts
>     715.33 =C2=B1  4%     -65.6%     246.33 =C2=B1  6%  interrupts.CPU131=
.RES:Reschedu
> ling_interrupts
>      16048 =C2=B1  5%     -32.2%      10886 =C2=B1  2%  interrupts.CPU132=
.CAL:Function
> _call_interrupts
>     740.33 =C2=B1  3%     -69.6%     225.33 =C2=B1  6%  interrupts.CPU132=
.RES:Reschedu
> ling_interrupts
>      15902 =C2=B1  4%     -31.0%      10968 =C2=B1  2%  interrupts.CPU133=
.CAL:Function
> _call_interrupts
>     690.33 =C2=B1  9%     -67.2%     226.33 =C2=B1 11%  interrupts.CPU133=
.RES:Reschedu
> ling_interrupts
>      15278 =C2=B1  3%     -34.6%       9996 =C2=B1  3%  interrupts.CPU134=
.CAL:Function
> _call_interrupts
>     730.33 =C2=B1  5%     -69.4%     223.33 =C2=B1  7%  interrupts.CPU134=
.RES:Reschedu
> ling_interrupts
>      15298 =C2=B1  2%     -32.5%      10324        interrupts.CPU135.CAL:=
Function
> _call_interrupts
>     710.00 =C2=B1  7%     -69.4%     217.33 =C2=B1  2%  interrupts.CPU135=
.RES:Reschedu
> ling_interrupts
>      16041 =C2=B1  3%     -34.9%      10442 =C2=B1  3%  interrupts.CPU136=
.CAL:Function
> _call_interrupts
>     718.67 =C2=B1  5%     -65.3%     249.33 =C2=B1 10%  interrupts.CPU136=
.RES:Reschedu
> ling_interrupts
>       6786 =C2=B1  3%      -9.0%       6176 =C2=B1  7%  interrupts.CPU136=
.TLB:TLB_shoo
> tdowns
>      16540 =C2=B1  6%     -37.0%      10415 =C2=B1  2%  interrupts.CPU137=
.CAL:Function
> _call_interrupts
>     710.67 =C2=B1  2%     -60.0%     284.33 =C2=B1  5%  interrupts.CPU137=
.RES:Reschedu
> ling_interrupts
>      15645 =C2=B1  3%     -29.6%      11012 =C2=B1  6%  interrupts.CPU138=
.CAL:Function
> _call_interrupts
>     725.67 =C2=B1  4%     -66.1%     246.00 =C2=B1 10%  interrupts.CPU138=
.RES:Reschedu
> ling_interrupts
>      16127 =C2=B1  3%     -34.1%      10629        interrupts.CPU139.CAL:=
Function
> _call_interrupts
>     703.67           -67.2%     230.67 =C2=B1  7%  interrupts.CPU139.RES:=
Reschedu
> ling_interrupts
>      16090 =C2=B1  5%     -41.2%       9463 =C2=B1  5%  interrupts.CPU14.=
CAL:Function_
> call_interrupts
>       3430 =C2=B1 23%     -45.5%       1869 =C2=B1  5%  interrupts.CPU14.=
NMI:Non-maska
> ble_interrupts
>       3430 =C2=B1 23%     -45.5%       1869 =C2=B1  5%  interrupts.CPU14.=
PMI:Performan
> ce_monitoring_interrupts
>       1019 =C2=B1  2%     -41.0%     601.33 =C2=B1  7%  interrupts.CPU14.=
RES:Reschedul
> ing_interrupts
>      15691 =C2=B1  5%     -35.4%      10133 =C2=B1  2%  interrupts.CPU140=
.CAL:Function
> _call_interrupts
>     729.33 =C2=B1  3%     -67.6%     236.00 =C2=B1  6%  interrupts.CPU140=
.RES:Reschedu
> ling_interrupts
>      15386 =C2=B1  7%     -34.9%      10016 =C2=B1  4%  interrupts.CPU141=
.CAL:Function
> _call_interrupts
>     699.33 =C2=B1  2%     -63.3%     257.00 =C2=B1  9%  interrupts.CPU141=
.RES:Reschedu
> ling_interrupts
>      14972 =C2=B1  4%     -31.4%      10276 =C2=B1  5%  interrupts.CPU142=
.CAL:Function
> _call_interrupts
>     679.67 =C2=B1  2%     -60.9%     266.00 =C2=B1 19%  interrupts.CPU142=
.RES:Reschedu
> ling_interrupts
>      14685 =C2=B1  5%     -31.1%      10114 =C2=B1  2%  interrupts.CPU143=
.CAL:Function
> _call_interrupts
>     727.33 =C2=B1  3%     -66.9%     240.67 =C2=B1  2%  interrupts.CPU143=
.RES:Reschedu
> ling_interrupts
>      12543 =C2=B1 12%     -20.7%       9944 =C2=B1  8%  interrupts.CPU144=
.CAL:Function
> _call_interrupts
>     769.67 =C2=B1  9%     -61.8%     294.33 =C2=B1 32%  interrupts.CPU144=
.RES:Reschedu
> ling_interrupts
>      12137 =C2=B1 14%     -19.8%       9738 =C2=B1  7%  interrupts.CPU145=
.CAL:Function
> _call_interrupts
>       2749 =C2=B1 24%     -29.6%       1936 =C2=B1 10%  interrupts.CPU145=
.NMI:Non-mask
> able_interrupts
>       2749 =C2=B1 24%     -29.6%       1936 =C2=B1 10%  interrupts.CPU145=
.PMI:Performa
> nce_monitoring_interrupts
>     759.67 =C2=B1  7%     -62.8%     282.67 =C2=B1 43%  interrupts.CPU145=
.RES:Reschedu
> ling_interrupts
>      17548           -39.4%      10630 =C2=B1  2%  interrupts.CPU146.CAL:=
Function
> _call_interrupts
>       1115 =C2=B1 25%     -64.8%     392.33 =C2=B1 34%  interrupts.CPU146=
.RES:Reschedu
> ling_interrupts
>       8334 =C2=B1  4%     -17.8%       6854 =C2=B1  6%  interrupts.CPU146=
.TLB:TLB_shoo
> tdowns
>      17255 =C2=B1  2%     -39.3%      10477 =C2=B1  3%  interrupts.CPU147=
.CAL:Function
> _call_interrupts
>       1069 =C2=B1 24%     -51.9%     514.33 =C2=B1 26%  interrupts.CPU147=
.RES:Reschedu
> ling_interrupts
>       7820 =C2=B1  6%     -13.0%       6800 =C2=B1  7%  interrupts.CPU147=
.TLB:TLB_shoo
> tdowns
>      15987 =C2=B1  3%     -30.7%      11072 =C2=B1  2%  interrupts.CPU148=
.CAL:Function
> _call_interrupts
>       3563 =C2=B1 27%     -44.2%       1987 =C2=B1 11%  interrupts.CPU148=
.NMI:Non-mask
> able_interrupts
>       3563 =C2=B1 27%     -44.2%       1987 =C2=B1 11%  interrupts.CPU148=
.PMI:Performa
> nce_monitoring_interrupts
>     697.67 =C2=B1  7%     -73.0%     188.67 =C2=B1 25%  interrupts.CPU148=
.RES:Reschedu
> ling_interrupts
>      16030           -31.1%      11038        interrupts.CPU149.CAL:Funct=
ion
> _call_interrupts
>     692.00 =C2=B1  3%     -71.7%     195.67 =C2=B1 25%  interrupts.CPU149=
.RES:Reschedu
> ling_interrupts
>      15532           -39.3%       9422 =C2=B1  3%  interrupts.CPU15.CAL:F=
unction_
> call_interrupts
>       2758 =C2=B1 25%     -31.5%       1889 =C2=B1  2%  interrupts.CPU15.=
NMI:Non-maska
> ble_interrupts
>       2758 =C2=B1 25%     -31.5%       1889 =C2=B1  2%  interrupts.CPU15.=
PMI:Performan
> ce_monitoring_interrupts
>     930.33 =C2=B1  2%     -38.6%     571.67 =C2=B1  4%  interrupts.CPU15.=
RES:Reschedul
> ing_interrupts
>      15763 =C2=B1  5%     -34.7%      10300 =C2=B1  2%  interrupts.CPU150=
.CAL:Function
> _call_interrupts
>       2698 =C2=B1 20%     -29.0%       1914 =C2=B1 12%  interrupts.CPU150=
.NMI:Non-mask
> able_interrupts
>       2698 =C2=B1 20%     -29.0%       1914 =C2=B1 12%  interrupts.CPU150=
.PMI:Performa
> nce_monitoring_interrupts
>     729.33 =C2=B1  5%     -77.0%     167.67 =C2=B1  9%  interrupts.CPU150=
.RES:Reschedu
> ling_interrupts
>      15988 =C2=B1  2%     -34.6%      10450        interrupts.CPU151.CAL:=
Function
> _call_interrupts
>       4342 =C2=B1 22%     -41.1%       2557 =C2=B1 22%  interrupts.CPU151=
.NMI:Non-mask
> able_interrupts
>       4342 =C2=B1 22%     -41.1%       2557 =C2=B1 22%  interrupts.CPU151=
.PMI:Performa
> nce_monitoring_interrupts
>     645.67 =C2=B1  6%     -77.1%     147.67 =C2=B1  8%  interrupts.CPU151=
.RES:Reschedu
> ling_interrupts
>      16349           -37.7%      10192 =C2=B1  3%  interrupts.CPU152.CAL:=
Function
> _call_interrupts
>       3856 =C2=B1 25%     -30.3%       2687 =C2=B1 43%  interrupts.CPU152=
.NMI:Non-mask
> able_interrupts
>       3856 =C2=B1 25%     -30.3%       2687 =C2=B1 43%  interrupts.CPU152=
.PMI:Performa
> nce_monitoring_interrupts
>     671.00 =C2=B1  4%     -72.4%     185.00 =C2=B1 19%  interrupts.CPU152=
.RES:Reschedu
> ling_interrupts
>      16801           -37.4%      10521 =C2=B1  4%  interrupts.CPU153.CAL:=
Function
> _call_interrupts
>       3501 =C2=B1 29%     -42.8%       2001 =C2=B1 12%  interrupts.CPU153=
.NMI:Non-mask
> able_interrupts
>       3501 =C2=B1 29%     -42.8%       2001 =C2=B1 12%  interrupts.CPU153=
.PMI:Performa
> nce_monitoring_interrupts
>     658.33 =C2=B1  2%     -64.6%     233.00 =C2=B1 36%  interrupts.CPU153=
.RES:Reschedu
> ling_interrupts
>      16597           -37.6%      10350 =C2=B1  2%  interrupts.CPU154.CAL:=
Function
> _call_interrupts
>     808.33 =C2=B1 11%     -76.9%     187.00 =C2=B1  6%  interrupts.CPU154=
.RES:Reschedu
> ling_interrupts
>      16418 =C2=B1  5%     -36.4%      10436 =C2=B1  4%  interrupts.CPU155=
.CAL:Function
> _call_interrupts
>     725.00 =C2=B1  9%     -62.2%     274.00 =C2=B1 33%  interrupts.CPU155=
.RES:Reschedu
> ling_interrupts
>      15746           -32.1%      10685 =C2=B1  3%  interrupts.CPU156.CAL:=
Function
> _call_interrupts
>     648.00 =C2=B1  2%     -79.5%     133.00        interrupts.CPU156.RES:=
Reschedu
> ling_interrupts
>      15674           -34.2%      10315 =C2=B1  4%  interrupts.CPU157.CAL:=
Function
> _call_interrupts
>     693.33 =C2=B1  4%     -81.1%     131.33 =C2=B1  8%  interrupts.CPU157=
.RES:Reschedu
> ling_interrupts
>      16300 =C2=B1  4%     -33.9%      10775        interrupts.CPU158.CAL:=
Function
> _call_interrupts
>     715.33 =C2=B1  9%     -67.3%     233.67 =C2=B1 27%  interrupts.CPU158=
.RES:Reschedu
> ling_interrupts
>      15651 =C2=B1  3%     -32.3%      10603        interrupts.CPU159.CAL:=
Function
> _call_interrupts
>       3944 =C2=B1 28%     -30.0%       2761 =C2=B1 39%  interrupts.CPU159=
.NMI:Non-mask
> able_interrupts
>       3944 =C2=B1 28%     -30.0%       2761 =C2=B1 39%  interrupts.CPU159=
.PMI:Performa
> nce_monitoring_interrupts
>     721.67 =C2=B1  4%     -72.3%     199.67 =C2=B1 26%  interrupts.CPU159=
.RES:Reschedu
> ling_interrupts
>      16012 =C2=B1  3%     -38.9%       9780 =C2=B1  5%  interrupts.CPU16.=
CAL:Function_
> call_interrupts
>       1013           -47.9%     527.67        interrupts.CPU16.RES:Resche=
dul
> ing_interrupts
>      16122 =C2=B1  2%     -26.7%      11825 =C2=B1  3%  interrupts.CPU160=
.CAL:Function
> _call_interrupts
>     768.67 =C2=B1  6%     -72.7%     209.67 =C2=B1 31%  interrupts.CPU160=
.RES:Reschedu
> ling_interrupts
>      15710           -28.4%      11246 =C2=B1  4%  interrupts.CPU161.CAL:=
Function
> _call_interrupts
>     791.67 =C2=B1  4%     -75.5%     194.33 =C2=B1 29%  interrupts.CPU161=
.RES:Reschedu
> ling_interrupts
>      16165           -33.9%      10680        interrupts.CPU162.CAL:Funct=
ion
> _call_interrupts
>       2408 =C2=B1  8%     +49.8%       3607 =C2=B1 26%  interrupts.CPU162=
.NMI:Non-mask
> able_interrupts
>       2408 =C2=B1  8%     +49.8%       3607 =C2=B1 26%  interrupts.CPU162=
.PMI:Performa
> nce_monitoring_interrupts
>     719.67 =C2=B1  8%     -79.8%     145.33 =C2=B1 10%  interrupts.CPU162=
.RES:Reschedu
> ling_interrupts
>      16583           -34.4%      10877 =C2=B1  4%  interrupts.CPU163.CAL:=
Function
> _call_interrupts
>     688.33 =C2=B1 11%     -80.5%     134.00 =C2=B1  4%  interrupts.CPU163=
.RES:Reschedu
> ling_interrupts
>      15811 =C2=B1  3%     -31.1%      10887 =C2=B1  2%  interrupts.CPU164=
.CAL:Function
> _call_interrupts
>     693.00 =C2=B1 12%     -79.1%     144.67 =C2=B1 12%  interrupts.CPU164=
.RES:Reschedu
> ling_interrupts
>      15821 =C2=B1  3%     -30.9%      10938 =C2=B1  2%  interrupts.CPU165=
.CAL:Function
> _call_interrupts
>     693.33 =C2=B1 10%     -79.7%     141.00 =C2=B1  7%  interrupts.CPU165=
.RES:Reschedu
> ling_interrupts
>      17248 =C2=B1  6%     -40.0%      10349 =C2=B1  2%  interrupts.CPU166=
.CAL:Function
> _call_interrupts
>     751.00 =C2=B1  2%     -80.6%     145.67 =C2=B1 34%  interrupts.CPU166=
.RES:Reschedu
> ling_interrupts
>      16506 =C2=B1  6%     -33.1%      11050 =C2=B1  3%  interrupts.CPU167=
.CAL:Function
> _call_interrupts
>     747.33           -77.3%     169.67 =C2=B1 21%  interrupts.CPU167.RES:=
Reschedu
> ling_interrupts
>      15950 =C2=B1  6%     -32.7%      10739 =C2=B1  2%  interrupts.CPU168=
.CAL:Function
> _call_interrupts
>     676.00 =C2=B1  7%     -72.8%     184.00 =C2=B1  2%  interrupts.CPU168=
.RES:Reschedu
> ling_interrupts
>      15557 =C2=B1  7%     -35.1%      10102 =C2=B1  3%  interrupts.CPU169=
.CAL:Function
> _call_interrupts
>     633.33 =C2=B1  2%     -75.1%     157.67 =C2=B1 11%  interrupts.CPU169=
.RES:Reschedu
> ling_interrupts
>      15854           -38.9%       9694        interrupts.CPU17.CAL:Functi=
on_
> call_interrupts
>       1031 =C2=B1  8%     -48.4%     532.33 =C2=B1  5%  interrupts.CPU17.=
RES:Reschedul
> ing_interrupts
>      16470           -38.3%      10164 =C2=B1  2%  interrupts.CPU170.CAL:=
Function
> _call_interrupts
>     703.33 =C2=B1  4%     -75.2%     174.33 =C2=B1 28%  interrupts.CPU170=
.RES:Reschedu
> ling_interrupts
>      16445 =C2=B1  3%     -35.4%      10621        interrupts.CPU171.CAL:=
Function
> _call_interrupts
>     677.00 =C2=B1  5%     -78.0%     148.67 =C2=B1 25%  interrupts.CPU171=
.RES:Reschedu
> ling_interrupts
>      16503 =C2=B1  5%     -29.5%      11641 =C2=B1  7%  interrupts.CPU172=
.CAL:Function
> _call_interrupts
>     710.67 =C2=B1  8%     -72.9%     192.67 =C2=B1 37%  interrupts.CPU172=
.RES:Reschedu
> ling_interrupts
>      16674 =C2=B1  4%     -33.7%      11054 =C2=B1  3%  interrupts.CPU173=
.CAL:Function
> _call_interrupts
>     688.33 =C2=B1  7%     -75.4%     169.33 =C2=B1 36%  interrupts.CPU173=
.RES:Reschedu
> ling_interrupts
>      16131 =C2=B1  4%     -31.7%      11013 =C2=B1  3%  interrupts.CPU174=
.CAL:Function
> _call_interrupts
>     717.67 =C2=B1 11%     -76.7%     167.33 =C2=B1 19%  interrupts.CPU174=
.RES:Reschedu
> ling_interrupts
>      16249 =C2=B1  2%     -33.4%      10821 =C2=B1  3%  interrupts.CPU175=
.CAL:Function
> _call_interrupts
>       3741 =C2=B1 28%     -44.1%       2091        interrupts.CPU175.NMI:=
Non-mask
> able_interrupts
>       3741 =C2=B1 28%     -44.1%       2091        interrupts.CPU175.PMI:=
Performa
> nce_monitoring_interrupts
>     718.33 =C2=B1  6%     -78.5%     154.33 =C2=B1  8%  interrupts.CPU175=
.RES:Reschedu
> ling_interrupts
>      16051 =C2=B1  5%     -29.8%      11262 =C2=B1  3%  interrupts.CPU176=
.CAL:Function
> _call_interrupts
>     697.00 =C2=B1  5%     -73.2%     186.67 =C2=B1 19%  interrupts.CPU176=
.RES:Reschedu
> ling_interrupts
>      15974 =C2=B1  2%     -32.8%      10742 =C2=B1  2%  interrupts.CPU177=
.CAL:Function
> _call_interrupts
>       3886 =C2=B1 29%     -28.8%       2766 =C2=B1 44%  interrupts.CPU177=
.NMI:Non-mask
> able_interrupts
>       3886 =C2=B1 29%     -28.8%       2766 =C2=B1 44%  interrupts.CPU177=
.PMI:Performa
> nce_monitoring_interrupts
>     708.00 =C2=B1 10%     -80.7%     136.33 =C2=B1  8%  interrupts.CPU177=
.RES:Reschedu
> ling_interrupts
>      16346 =C2=B1  4%     -34.2%      10753 =C2=B1  8%  interrupts.CPU178=
.CAL:Function
> _call_interrupts
>     668.67 =C2=B1  4%     -78.5%     143.67 =C2=B1  5%  interrupts.CPU178=
.RES:Reschedu
> ling_interrupts
>      16195 =C2=B1  6%     -32.4%      10945 =C2=B1  3%  interrupts.CPU179=
.CAL:Function
> _call_interrupts
>     675.00 =C2=B1  4%     -78.7%     143.67 =C2=B1  9%  interrupts.CPU179=
.RES:Reschedu
> ling_interrupts
>      16003           -40.1%       9583        interrupts.CPU18.CAL:Functi=
on_
> call_interrupts
>     981.00 =C2=B1  6%     -42.6%     563.33 =C2=B1  3%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>      16274           -33.0%      10899 =C2=B1  3%  interrupts.CPU180.CAL:=
Function
> _call_interrupts
>     738.00 =C2=B1  8%     -75.4%     181.33 =C2=B1 27%  interrupts.CPU180=
.RES:Reschedu
> ling_interrupts
>      15912           -32.0%      10821 =C2=B1  4%  interrupts.CPU181.CAL:=
Function
> _call_interrupts
>       3499 =C2=B1 25%     -41.9%       2033 =C2=B1  7%  interrupts.CPU181=
.NMI:Non-mask
> able_interrupts
>       3499 =C2=B1 25%     -41.9%       2033 =C2=B1  7%  interrupts.CPU181=
.PMI:Performa
> nce_monitoring_interrupts
>     707.67 =C2=B1  7%     -75.3%     175.00 =C2=B1 17%  interrupts.CPU181=
.RES:Reschedu
> ling_interrupts
>       6418 =C2=B1  5%      +8.7%       6977 =C2=B1  5%  interrupts.CPU181=
.TLB:TLB_shoo
> tdowns
>      16035           -36.2%      10229 =C2=B1  4%  interrupts.CPU182.CAL:=
Function
> _call_interrupts
>     721.67 =C2=B1  2%     -84.1%     115.00 =C2=B1 10%  interrupts.CPU182=
.RES:Reschedu
> ling_interrupts
>      15847           -30.9%      10952 =C2=B1  2%  interrupts.CPU183.CAL:=
Function
> _call_interrupts
>     686.67 =C2=B1  5%     -79.4%     141.33 =C2=B1 17%  interrupts.CPU183=
.RES:Reschedu
> ling_interrupts
>      16073           -34.1%      10594 =C2=B1  6%  interrupts.CPU184.CAL:=
Function
> _call_interrupts
>     619.33 =C2=B1  2%     -81.5%     114.67 =C2=B1 11%  interrupts.CPU184=
.RES:Reschedu
> ling_interrupts
>      16151           -33.2%      10790 =C2=B1  3%  interrupts.CPU185.CAL:=
Function
> _call_interrupts
>     662.67 =C2=B1  2%     -77.2%     151.00 =C2=B1  6%  interrupts.CPU185=
.RES:Reschedu
> ling_interrupts
>      16326 =C2=B1  3%     -35.8%      10480 =C2=B1  4%  interrupts.CPU186=
.CAL:Function
> _call_interrupts
>     666.67 =C2=B1  8%     -81.3%     124.67 =C2=B1  9%  interrupts.CPU186=
.RES:Reschedu
> ling_interrupts
>      15988 =C2=B1  4%     -32.0%      10880        interrupts.CPU187.CAL:=
Function
> _call_interrupts
>     643.33 =C2=B1  2%     -78.2%     140.33 =C2=B1 17%  interrupts.CPU187=
.RES:Reschedu
> ling_interrupts
>      15482 =C2=B1  4%     -32.5%      10450 =C2=B1  3%  interrupts.CPU188=
.CAL:Function
> _call_interrupts
>     607.67 =C2=B1  4%     -69.1%     187.67 =C2=B1 25%  interrupts.CPU188=
.RES:Reschedu
> ling_interrupts
>      16059 =C2=B1  7%     -34.6%      10510 =C2=B1  2%  interrupts.CPU189=
.CAL:Function
> _call_interrupts
>     641.67 =C2=B1  6%     -74.0%     166.67 =C2=B1  4%  interrupts.CPU189=
.RES:Reschedu
> ling_interrupts
>      16047 =C2=B1  3%     -38.4%       9891 =C2=B1  2%  interrupts.CPU19.=
CAL:Function_
> call_interrupts
>     991.33 =C2=B1 13%     -43.8%     557.00 =C2=B1  4%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>      15370 =C2=B1  2%     -33.0%      10298 =C2=B1  3%  interrupts.CPU190=
.CAL:Function
> _call_interrupts
>     696.33 =C2=B1  9%     -80.1%     138.67 =C2=B1 11%  interrupts.CPU190=
.RES:Reschedu
> ling_interrupts
>      15327           -27.5%      11114 =C2=B1  3%  interrupts.CPU191.CAL:=
Function
> _call_interrupts
>     664.33 =C2=B1 10%     -76.3%     157.33 =C2=B1 10%  interrupts.CPU191=
.RES:Reschedu
> ling_interrupts
>      15917 =C2=B1  6%     -32.3%      10774 =C2=B1  4%  interrupts.CPU192=
.CAL:Function
> _call_interrupts
>     713.67 =C2=B1  2%     -81.9%     129.33 =C2=B1  2%  interrupts.CPU192=
.RES:Reschedu
> ling_interrupts
>      15685 =C2=B1  6%     -33.1%      10496 =C2=B1  4%  interrupts.CPU193=
.CAL:Function
> _call_interrupts
>       2145 =C2=B1  5%     +99.1%       4269 =C2=B1 11%  interrupts.CPU193=
.NMI:Non-mask
> able_interrupts
>       2145 =C2=B1  5%     +99.1%       4269 =C2=B1 11%  interrupts.CPU193=
.PMI:Performa
> nce_monitoring_interrupts
>     697.00           -80.8%     134.00 =C2=B1  3%  interrupts.CPU193.RES:=
Reschedu
> ling_interrupts
>      16410 =C2=B1  2%     -36.6%      10408        interrupts.CPU194.CAL:=
Function
> _call_interrupts
>     656.00 =C2=B1  9%     -79.8%     132.67 =C2=B1  9%  interrupts.CPU194=
.RES:Reschedu
> ling_interrupts
>      16168 =C2=B1  3%     -35.5%      10433 =C2=B1  3%  interrupts.CPU195=
.CAL:Function
> _call_interrupts
>     599.00 =C2=B1  5%     -80.5%     116.67 =C2=B1 11%  interrupts.CPU195=
.RES:Reschedu
> ling_interrupts
>      15773 =C2=B1  4%     -33.1%      10545 =C2=B1  4%  interrupts.CPU196=
.CAL:Function
> _call_interrupts
>     626.33           -75.5%     153.67        interrupts.CPU196.RES:Resch=
edu
> ling_interrupts
>      14934 =C2=B1  2%     -28.8%      10629 =C2=B1  2%  interrupts.CPU197=
.CAL:Function
> _call_interrupts
>     610.67           -74.1%     158.00 =C2=B1 29%  interrupts.CPU197.RES:=
Reschedu
> ling_interrupts
>      16138 =C2=B1  7%     -32.3%      10918        interrupts.CPU198.CAL:=
Function
> _call_interrupts
>     686.33 =C2=B1  3%     -75.5%     168.00 =C2=B1 18%  interrupts.CPU198=
.RES:Reschedu
> ling_interrupts
>      15858 =C2=B1  6%     -32.0%      10784 =C2=B1  2%  interrupts.CPU199=
.CAL:Function
> _call_interrupts
>     660.33 =C2=B1  3%     -77.9%     146.00 =C2=B1 18%  interrupts.CPU199=
.RES:Reschedu
> ling_interrupts
>      17857 =C2=B1  4%     -44.0%       9998 =C2=B1  4%  interrupts.CPU2.C=
AL:Function_c
> all_interrupts
>       1395 =C2=B1 15%     -50.2%     695.00 =C2=B1  9%  interrupts.CPU2.R=
ES:Rescheduli
> ng_interrupts
>      15765 =C2=B1  4%     -37.4%       9873 =C2=B1  2%  interrupts.CPU20.=
CAL:Function_
> call_interrupts
>     975.67 =C2=B1  7%     -43.6%     550.00 =C2=B1  4%  interrupts.CPU20.=
RES:Reschedul
> ing_interrupts
>      15048 =C2=B1  3%     -31.5%      10312 =C2=B1  3%  interrupts.CPU200=
.CAL:Function
> _call_interrupts
>     634.00 =C2=B1  4%     -43.6%     357.67 =C2=B1 51%  interrupts.CPU200=
.RES:Reschedu
> ling_interrupts
>      14990 =C2=B1  2%     -27.1%      10931        interrupts.CPU201.CAL:=
Function
> _call_interrupts
>     626.00 =C2=B1  5%     -42.1%     362.67 =C2=B1 44%  interrupts.CPU201=
.RES:Reschedu
> ling_interrupts
>      16414           -32.4%      11091 =C2=B1  3%  interrupts.CPU202.CAL:=
Function
> _call_interrupts
>       4042 =C2=B1 34%     -33.6%       2682 =C2=B1 48%  interrupts.CPU202=
.NMI:Non-mask
> able_interrupts
>       4042 =C2=B1 34%     -33.6%       2682 =C2=B1 48%  interrupts.CPU202=
.PMI:Performa
> nce_monitoring_interrupts
>     739.67 =C2=B1  3%     -71.4%     211.33 =C2=B1 37%  interrupts.CPU202=
.RES:Reschedu
> ling_interrupts
>      16998 =C2=B1  2%     -34.9%      11066 =C2=B1  4%  interrupts.CPU203=
.CAL:Function
> _call_interrupts
>     751.33 =C2=B1  7%     -75.6%     183.33 =C2=B1 19%  interrupts.CPU203=
.RES:Reschedu
> ling_interrupts
>      16146 =C2=B1  8%     -35.2%      10459        interrupts.CPU204.CAL:=
Function
> _call_interrupts
>     656.67 =C2=B1 11%     -79.1%     137.00 =C2=B1  3%  interrupts.CPU204=
.RES:Reschedu
> ling_interrupts
>      15410 =C2=B1  6%     -30.6%      10693        interrupts.CPU205.CAL:=
Function
> _call_interrupts
>     635.33 =C2=B1  4%     -81.6%     117.00 =C2=B1  7%  interrupts.CPU205=
.RES:Reschedu
> ling_interrupts
>      15522           -29.7%      10909 =C2=B1  3%  interrupts.CPU206.CAL:=
Function
> _call_interrupts
>     736.00 =C2=B1 14%     -81.2%     138.00 =C2=B1  7%  interrupts.CPU206=
.RES:Reschedu
> ling_interrupts
>      14652 =C2=B1  3%     -28.5%      10473        interrupts.CPU207.CAL:=
Function
> _call_interrupts
>     683.00 =C2=B1 14%     -76.3%     161.67 =C2=B1 21%  interrupts.CPU207=
.RES:Reschedu
> ling_interrupts
>      16654 =C2=B1  6%     -38.1%      10305 =C2=B1  3%  interrupts.CPU208=
.CAL:Function
> _call_interrupts
>     687.67 =C2=B1  2%     -76.7%     160.33 =C2=B1 14%  interrupts.CPU208=
.RES:Reschedu
> ling_interrupts
>      16333 =C2=B1  4%     -38.0%      10132 =C2=B1  6%  interrupts.CPU209=
.CAL:Function
> _call_interrupts
>       2731 =C2=B1 12%     -22.6%       2114 =C2=B1  4%  interrupts.CPU209=
.NMI:Non-mask
> able_interrupts
>       2731 =C2=B1 12%     -22.6%       2114 =C2=B1  4%  interrupts.CPU209=
.PMI:Performa
> nce_monitoring_interrupts
>     687.33 =C2=B1  5%     -74.2%     177.67 =C2=B1 22%  interrupts.CPU209=
.RES:Reschedu
> ling_interrupts
>      15701 =C2=B1  6%     -37.6%       9803        interrupts.CPU21.CAL:F=
unction_
> call_interrupts
>     910.33 =C2=B1  9%     -37.3%     570.67 =C2=B1  8%  interrupts.CPU21.=
RES:Reschedul
> ing_interrupts
>      16019 =C2=B1  3%     -34.7%      10466 =C2=B1  3%  interrupts.CPU210=
.CAL:Function
> _call_interrupts
>     620.00 =C2=B1  4%     -78.8%     131.67 =C2=B1 11%  interrupts.CPU210=
.RES:Reschedu
> ling_interrupts
>      16357           -33.8%      10824 =C2=B1  4%  interrupts.CPU211.CAL:=
Function
> _call_interrupts
>     654.33 =C2=B1  7%     -73.5%     173.33 =C2=B1 25%  interrupts.CPU211=
.RES:Reschedu
> ling_interrupts
>      15634 =C2=B1  6%     -29.2%      11062 =C2=B1  5%  interrupts.CPU212=
.CAL:Function
> _call_interrupts
>     666.33 =C2=B1  5%     -74.4%     170.33 =C2=B1 15%  interrupts.CPU212=
.RES:Reschedu
> ling_interrupts
>      15469 =C2=B1  6%     -28.8%      11019 =C2=B1  2%  interrupts.CPU213=
.CAL:Function
> _call_interrupts
>       2049 =C2=B1  8%     +70.3%       3490 =C2=B1 27%  interrupts.CPU213=
.NMI:Non-mask
> able_interrupts
>       2049 =C2=B1  8%     +70.3%       3490 =C2=B1 27%  interrupts.CPU213=
.PMI:Performa
> nce_monitoring_interrupts
>     692.67 =C2=B1  3%     -76.0%     166.33 =C2=B1 16%  interrupts.CPU213=
.RES:Reschedu
> ling_interrupts
>      15344 =C2=B1  2%     -32.9%      10301 =C2=B1  3%  interrupts.CPU214=
.CAL:Function
> _call_interrupts
>     659.33 =C2=B1  2%     -75.4%     162.00 =C2=B1 34%  interrupts.CPU214=
.RES:Reschedu
> ling_interrupts
>      15178 =C2=B1  7%     -32.8%      10205 =C2=B1  3%  interrupts.CPU215=
.CAL:Function
> _call_interrupts
>     698.33 =C2=B1  6%     -79.7%     142.00 =C2=B1 18%  interrupts.CPU215=
.RES:Reschedu
> ling_interrupts
>      12566 =C2=B1 13%     -20.9%       9941 =C2=B1  4%  interrupts.CPU216=
.CAL:Function
> _call_interrupts
>       1559 =C2=B1 12%     +32.3%       2063 =C2=B1  7%  interrupts.CPU216=
.NMI:Non-mask
> able_interrupts
>       1559 =C2=B1 12%     +32.3%       2063 =C2=B1  7%  interrupts.CPU216=
.PMI:Performa
> nce_monitoring_interrupts
>     762.33 =C2=B1  8%     -54.5%     346.67 =C2=B1 54%  interrupts.CPU216=
.RES:Reschedu
> ling_interrupts
>      12502 =C2=B1 10%     -24.6%       9422 =C2=B1  2%  interrupts.CPU217=
.CAL:Function
> _call_interrupts
>     788.00 =C2=B1 15%     -65.3%     273.33 =C2=B1 42%  interrupts.CPU217=
.RES:Reschedu
> ling_interrupts
>      16849 =C2=B1  3%     -39.6%      10171 =C2=B1  4%  interrupts.CPU218=
.CAL:Function
> _call_interrupts
>       1110 =C2=B1 15%     -54.1%     510.00 =C2=B1 36%  interrupts.CPU218=
.RES:Reschedu
> ling_interrupts
>      16842 =C2=B1  2%     -38.7%      10322 =C2=B1  3%  interrupts.CPU219=
.CAL:Function
> _call_interrupts
>       1174 =C2=B1 21%     -57.0%     504.33 =C2=B1 25%  interrupts.CPU219=
.RES:Reschedu
> ling_interrupts
>      17047 =C2=B1  6%     -42.6%       9790 =C2=B1  2%  interrupts.CPU22.=
CAL:Function_
> call_interrupts
>       1051 =C2=B1  3%     -49.1%     535.67 =C2=B1  2%  interrupts.CPU22.=
RES:Reschedul
> ing_interrupts
>      16314 =C2=B1  2%     -33.6%      10839        interrupts.CPU220.CAL:=
Function
> _call_interrupts
>     684.00 =C2=B1  3%     -77.1%     156.67 =C2=B1 31%  interrupts.CPU220=
.RES:Reschedu
> ling_interrupts
>       7476           -13.2%       6492 =C2=B1  3%  interrupts.CPU220.TLB:=
TLB_shoo
> tdowns
>      15805 =C2=B1  4%     -31.0%      10900 =C2=B1  5%  interrupts.CPU221=
.CAL:Function
> _call_interrupts
>     740.67 =C2=B1  7%     -70.3%     219.67 =C2=B1 38%  interrupts.CPU221=
.RES:Reschedu
> ling_interrupts
>      16010 =C2=B1  6%     -36.0%      10249 =C2=B1  3%  interrupts.CPU222=
.CAL:Function
> _call_interrupts
>     641.33 =C2=B1  7%     -81.2%     120.67 =C2=B1  7%  interrupts.CPU222=
.RES:Reschedu
> ling_interrupts
>      16239 =C2=B1  6%     -34.4%      10660        interrupts.CPU223.CAL:=
Function
> _call_interrupts
>     651.33 =C2=B1  7%     -80.5%     127.33 =C2=B1 20%  interrupts.CPU223=
.RES:Reschedu
> ling_interrupts
>      16135           -32.0%      10974        interrupts.CPU224.CAL:Funct=
ion
> _call_interrupts
>       3823 =C2=B1 30%     -45.7%       2076 =C2=B1  4%  interrupts.CPU224=
.NMI:Non-mask
> able_interrupts
>       3823 =C2=B1 30%     -45.7%       2076 =C2=B1  4%  interrupts.CPU224=
.PMI:Performa
> nce_monitoring_interrupts
>     662.33 =C2=B1  3%     -79.4%     136.33 =C2=B1 14%  interrupts.CPU224=
.RES:Reschedu
> ling_interrupts
>      16296 =C2=B1  2%     -31.6%      11143 =C2=B1  2%  interrupts.CPU225=
.CAL:Function
> _call_interrupts
>     642.00 =C2=B1  6%     -63.3%     235.33 =C2=B1 36%  interrupts.CPU225=
.RES:Reschedu
> ling_interrupts
>      16349 =C2=B1  4%     -35.5%      10550 =C2=B1  2%  interrupts.CPU226=
.CAL:Function
> _call_interrupts
>     761.00 =C2=B1 14%     -77.0%     174.67 =C2=B1 41%  interrupts.CPU226=
.RES:Reschedu
> ling_interrupts
>      16232 =C2=B1  2%     -35.7%      10437 =C2=B1  3%  interrupts.CPU227=
.CAL:Function
> _call_interrupts
>       2373 =C2=B1 44%     +50.8%       3578 =C2=B1 30%  interrupts.CPU227=
.NMI:Non-mask
> able_interrupts
>       2373 =C2=B1 44%     +50.8%       3578 =C2=B1 30%  interrupts.CPU227=
.PMI:Performa
> nce_monitoring_interrupts
>     699.00 =C2=B1  8%     -66.9%     231.67 =C2=B1 35%  interrupts.CPU227=
.RES:Reschedu
> ling_interrupts
>       7115 =C2=B1  5%     -10.4%       6374 =C2=B1  6%  interrupts.CPU227=
.TLB:TLB_shoo
> tdowns
>      15982 =C2=B1  2%     -34.3%      10495        interrupts.CPU228.CAL:=
Function
> _call_interrupts
>       1951 =C2=B1  3%     +49.1%       2910 =C2=B1 35%  interrupts.CPU228=
.NMI:Non-mask
> able_interrupts
>       1951 =C2=B1  3%     +49.1%       2910 =C2=B1 35%  interrupts.CPU228=
.PMI:Performa
> nce_monitoring_interrupts
>     707.67 =C2=B1  5%     -83.6%     116.33 =C2=B1  8%  interrupts.CPU228=
.RES:Reschedu
> ling_interrupts
>      15670           -30.7%      10857        interrupts.CPU229.CAL:Funct=
ion
> _call_interrupts
>     680.00 =C2=B1  7%     -79.5%     139.67 =C2=B1 41%  interrupts.CPU229=
.RES:Reschedu
> ling_interrupts
>      16790 =C2=B1  2%     -42.2%       9712 =C2=B1  7%  interrupts.CPU23.=
CAL:Function_
> call_interrupts
>       1050 =C2=B1  2%     -47.3%     553.33 =C2=B1  4%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>      15834 =C2=B1  6%     -31.6%      10831 =C2=B1  2%  interrupts.CPU230=
.CAL:Function
> _call_interrupts
>     768.67 =C2=B1 11%     -81.3%     144.00 =C2=B1 28%  interrupts.CPU230=
.RES:Reschedu
> ling_interrupts
>      15755 =C2=B1  6%     -34.2%      10374 =C2=B1  4%  interrupts.CPU231=
.CAL:Function
> _call_interrupts
>     753.67 =C2=B1  5%     -79.2%     157.00 =C2=B1 16%  interrupts.CPU231=
.RES:Reschedu
> ling_interrupts
>      16498           -33.5%      10979 =C2=B1  5%  interrupts.CPU232.CAL:=
Function
> _call_interrupts
>     710.67 =C2=B1  8%     -78.5%     153.00 =C2=B1 21%  interrupts.CPU232=
.RES:Reschedu
> ling_interrupts
>      16157 =C2=B1  3%     -31.7%      11042 =C2=B1  3%  interrupts.CPU233=
.CAL:Function
> _call_interrupts
>     776.33 =C2=B1 13%     -82.8%     133.67 =C2=B1 26%  interrupts.CPU233=
.RES:Reschedu
> ling_interrupts
>      16069 =C2=B1  2%     -33.0%      10765        interrupts.CPU234.CAL:=
Function
> _call_interrupts
>     721.00 =C2=B1 11%     -84.6%     111.00 =C2=B1 29%  interrupts.CPU234=
.RES:Reschedu
> ling_interrupts
>      15902           -30.1%      11121 =C2=B1  3%  interrupts.CPU235.CAL:=
Function
> _call_interrupts
>       3809 =C2=B1 25%     -42.7%       2183 =C2=B1  8%  interrupts.CPU235=
.NMI:Non-mask
> able_interrupts
>       3809 =C2=B1 25%     -42.7%       2183 =C2=B1  8%  interrupts.CPU235=
.PMI:Performa
> nce_monitoring_interrupts
>     687.67 =C2=B1 14%     -82.3%     122.00 =C2=B1 22%  interrupts.CPU235=
.RES:Reschedu
> ling_interrupts
>      15560 =C2=B1  4%     -30.1%      10872 =C2=B1  5%  interrupts.CPU236=
.CAL:Function
> _call_interrupts
>     662.33 =C2=B1  6%     -78.9%     140.00 =C2=B1 12%  interrupts.CPU236=
.RES:Reschedu
> ling_interrupts
>      15750 =C2=B1  2%     -32.9%      10576 =C2=B1  3%  interrupts.CPU237=
.CAL:Function
> _call_interrupts
>     645.00 =C2=B1  7%     -70.7%     189.00 =C2=B1 62%  interrupts.CPU237=
.RES:Reschedu
> ling_interrupts
>      17222 =C2=B1  6%     -36.5%      10944 =C2=B1  2%  interrupts.CPU238=
.CAL:Function
> _call_interrupts
>     696.00 =C2=B1  3%     -81.1%     131.67 =C2=B1 33%  interrupts.CPU238=
.RES:Reschedu
> ling_interrupts
>      16803 =C2=B1  6%     -36.9%      10609 =C2=B1  2%  interrupts.CPU239=
.CAL:Function
> _call_interrupts
>     722.00           -82.2%     128.67 =C2=B1 15%  interrupts.CPU239.RES:=
Reschedu
> ling_interrupts
>      15849 =C2=B1  6%     -40.4%       9449 =C2=B1  3%  interrupts.CPU24.=
CAL:Function_
> call_interrupts
>     935.00 =C2=B1  4%     -41.9%     543.00 =C2=B1  6%  interrupts.CPU24.=
RES:Reschedul
> ing_interrupts
>      15977 =C2=B1  6%     -36.2%      10186        interrupts.CPU240.CAL:=
Function
> _call_interrupts
>     645.33 =C2=B1  6%     -75.0%     161.33 =C2=B1 23%  interrupts.CPU240=
.RES:Reschedu
> ling_interrupts
>      16232 =C2=B1  8%     -36.1%      10372 =C2=B1  2%  interrupts.CPU241=
.CAL:Function
> _call_interrupts
>     659.67 =C2=B1  4%     -78.2%     143.67 =C2=B1 43%  interrupts.CPU241=
.RES:Reschedu
> ling_interrupts
>      16657           -33.9%      11007 =C2=B1  4%  interrupts.CPU242.CAL:=
Function
> _call_interrupts
>       2821 =C2=B1 26%     -26.9%       2062 =C2=B1  4%  interrupts.CPU242=
.NMI:Non-mask
> able_interrupts
>       2821 =C2=B1 26%     -26.9%       2062 =C2=B1  4%  interrupts.CPU242=
.PMI:Performa
> nce_monitoring_interrupts
>     661.33 =C2=B1  3%     -79.4%     136.00 =C2=B1 27%  interrupts.CPU242=
.RES:Reschedu
> ling_interrupts
>       7236 =C2=B1  3%      -7.0%       6729 =C2=B1  5%  interrupts.CPU242=
.TLB:TLB_shoo
> tdowns
>      16078           -33.9%      10628 =C2=B1  3%  interrupts.CPU243.CAL:=
Function
> _call_interrupts
>     704.33 =C2=B1  8%     -83.6%     115.33 =C2=B1 10%  interrupts.CPU243=
.RES:Reschedu
> ling_interrupts
>      17338 =C2=B1  4%     -34.7%      11314 =C2=B1  2%  interrupts.CPU244=
.CAL:Function
> _call_interrupts
>     707.33 =C2=B1  8%     -81.6%     130.00 =C2=B1 37%  interrupts.CPU244=
.RES:Reschedu
> ling_interrupts
>      16581 =C2=B1  6%     -36.6%      10518 =C2=B1  6%  interrupts.CPU245=
.CAL:Function
> _call_interrupts
>     683.33 =C2=B1 10%     -71.9%     192.33 =C2=B1 49%  interrupts.CPU245=
.RES:Reschedu
> ling_interrupts
>      16229 =C2=B1  3%     -32.2%      11011        interrupts.CPU246.CAL:=
Function
> _call_interrupts
>     728.33 =C2=B1  9%     -81.7%     133.33 =C2=B1 13%  interrupts.CPU246=
.RES:Reschedu
> ling_interrupts
>      15944 =C2=B1  2%     -31.3%      10960 =C2=B1  2%  interrupts.CPU247=
.CAL:Function
> _call_interrupts
>     746.33 =C2=B1 10%     -80.1%     148.67 =C2=B1 19%  interrupts.CPU247=
.RES:Reschedu
> ling_interrupts
>      15791 =C2=B1  8%     -31.5%      10821 =C2=B1  5%  interrupts.CPU248=
.CAL:Function
> _call_interrupts
>     692.33 =C2=B1 12%     -81.9%     125.00 =C2=B1 21%  interrupts.CPU248=
.RES:Reschedu
> ling_interrupts
>      15746 =C2=B1  3%     -33.6%      10450 =C2=B1  2%  interrupts.CPU249=
.CAL:Function
> _call_interrupts
>     645.67 =C2=B1  7%     -84.3%     101.67 =C2=B1 14%  interrupts.CPU249=
.RES:Reschedu
> ling_interrupts
>      15770 =C2=B1  3%     -38.6%       9675        interrupts.CPU25.CAL:F=
unction_
> call_interrupts
>     893.67 =C2=B1  4%     -34.5%     585.33 =C2=B1  6%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>      16522 =C2=B1  6%     -35.3%      10689 =C2=B1  3%  interrupts.CPU250=
.CAL:Function
> _call_interrupts
>       4525 =C2=B1  5%     -41.6%       2645 =C2=B1 25%  interrupts.CPU250=
.NMI:Non-mask
> able_interrupts
>       4525 =C2=B1  5%     -41.6%       2645 =C2=B1 25%  interrupts.CPU250=
.PMI:Performa
> nce_monitoring_interrupts
>     633.00 =C2=B1  6%     -83.1%     106.67 =C2=B1  5%  interrupts.CPU250=
.RES:Reschedu
> ling_interrupts
>      16189 =C2=B1  5%     -33.0%      10853 =C2=B1  2%  interrupts.CPU251=
.CAL:Function
> _call_interrupts
>     611.67 =C2=B1  4%     -83.2%     103.00 =C2=B1  8%  interrupts.CPU251=
.RES:Reschedu
> ling_interrupts
>      15867           -32.0%      10790 =C2=B1  5%  interrupts.CPU252.CAL:=
Function
> _call_interrupts
>     722.33 =C2=B1 10%     -67.2%     237.00 =C2=B1 49%  interrupts.CPU252=
.RES:Reschedu
> ling_interrupts
>      16049 =C2=B1  2%     -31.6%      10980 =C2=B1  4%  interrupts.CPU253=
.CAL:Function
> _call_interrupts
>     732.00 =C2=B1 13%     -75.5%     179.00 =C2=B1 42%  interrupts.CPU253=
.RES:Reschedu
> ling_interrupts
>      16139 =C2=B1  3%     -32.0%      10977 =C2=B1  2%  interrupts.CPU254=
.CAL:Function
> _call_interrupts
>     737.67 =C2=B1  5%     -85.2%     109.33 =C2=B1 16%  interrupts.CPU254=
.RES:Reschedu
> ling_interrupts
>      16208 =C2=B1  2%     -33.2%      10829 =C2=B1  2%  interrupts.CPU255=
.CAL:Function
> _call_interrupts
>     707.00 =C2=B1  4%     -84.5%     109.33 =C2=B1  6%  interrupts.CPU255=
.RES:Reschedu
> ling_interrupts
>      16002 =C2=B1  3%     -33.2%      10696 =C2=B1  2%  interrupts.CPU256=
.CAL:Function
> _call_interrupts
>     604.00 =C2=B1  3%     -85.5%      87.33 =C2=B1  7%  interrupts.CPU256=
.RES:Reschedu
> ling_interrupts
>      15926 =C2=B1  3%     -33.7%      10558 =C2=B1  3%  interrupts.CPU257=
.CAL:Function
> _call_interrupts
>     646.00 =C2=B1  2%     -82.3%     114.33 =C2=B1 20%  interrupts.CPU257=
.RES:Reschedu
> ling_interrupts
>      16154 =C2=B1  6%     -33.8%      10686        interrupts.CPU258.CAL:=
Function
> _call_interrupts
>     623.00 =C2=B1  6%     -84.5%      96.33 =C2=B1  5%  interrupts.CPU258=
.RES:Reschedu
> ling_interrupts
>      16402 =C2=B1  5%     -36.8%      10360 =C2=B1  7%  interrupts.CPU259=
.CAL:Function
> _call_interrupts
>     625.67 =C2=B1  2%     -81.8%     113.67 =C2=B1  2%  interrupts.CPU259=
.RES:Reschedu
> ling_interrupts
>      15742 =C2=B1  2%     -42.0%       9128        interrupts.CPU26.CAL:F=
unction_
> call_interrupts
>     937.33 =C2=B1  4%     -40.6%     556.67        interrupts.CPU26.RES:R=
eschedul
> ing_interrupts
>      16093 =C2=B1  4%     -34.0%      10618 =C2=B1  3%  interrupts.CPU260=
.CAL:Function
> _call_interrupts
>     594.00 =C2=B1  2%     -81.1%     112.00 =C2=B1 14%  interrupts.CPU260=
.RES:Reschedu
> ling_interrupts
>      15577           -33.2%      10403 =C2=B1  3%  interrupts.CPU261.CAL:=
Function
> _call_interrupts
>     633.67 =C2=B1  3%     -74.5%     161.67 =C2=B1 33%  interrupts.CPU261=
.RES:Reschedu
> ling_interrupts
>      15583 =C2=B1  3%     -33.8%      10316        interrupts.CPU262.CAL:=
Function
> _call_interrupts
>       2997 =C2=B1 18%     -36.0%       1918 =C2=B1 10%  interrupts.CPU262=
.NMI:Non-mask
> able_interrupts
>       2997 =C2=B1 18%     -36.0%       1918 =C2=B1 10%  interrupts.CPU262=
.PMI:Performa
> nce_monitoring_interrupts
>     661.67 =C2=B1  9%     -79.7%     134.33 =C2=B1 10%  interrupts.CPU262=
.RES:Reschedu
> ling_interrupts
>      15208 =C2=B1  4%     -31.3%      10447 =C2=B1  3%  interrupts.CPU263=
.CAL:Function
> _call_interrupts
>     670.00 =C2=B1  7%     -78.5%     144.00 =C2=B1 17%  interrupts.CPU263=
.RES:Reschedu
> ling_interrupts
>      15992           -32.6%      10776 =C2=B1  3%  interrupts.CPU264.CAL:=
Function
> _call_interrupts
>     671.67 =C2=B1  4%     -82.8%     115.67 =C2=B1 24%  interrupts.CPU264=
.RES:Reschedu
> ling_interrupts
>      15604 =C2=B1  3%     -33.7%      10349        interrupts.CPU265.CAL:=
Function
> _call_interrupts
>     699.33 =C2=B1  4%     -86.1%      97.00 =C2=B1 17%  interrupts.CPU265=
.RES:Reschedu
> ling_interrupts
>      15983 =C2=B1  5%     -36.1%      10206 =C2=B1  3%  interrupts.CPU266=
.CAL:Function
> _call_interrupts
>     649.33           -83.3%     108.67 =C2=B1 14%  interrupts.CPU266.RES:=
Reschedu
> ling_interrupts
>      16080           -36.2%      10263 =C2=B1  2%  interrupts.CPU267.CAL:=
Function
> _call_interrupts
>       2567 =C2=B1 48%     +67.5%       4300 =C2=B1  8%  interrupts.CPU267=
.NMI:Non-mask
> able_interrupts
>       2567 =C2=B1 48%     +67.5%       4300 =C2=B1  8%  interrupts.CPU267=
.PMI:Performa
> nce_monitoring_interrupts
>     647.67 =C2=B1  2%     -85.4%      94.33 =C2=B1  4%  interrupts.CPU267=
.RES:Reschedu
> ling_interrupts
>      14976 =C2=B1  4%     -31.9%      10198 =C2=B1  3%  interrupts.CPU268=
.CAL:Function
> _call_interrupts
>     614.00 =C2=B1  6%     -80.2%     121.67 =C2=B1 48%  interrupts.CPU268=
.RES:Reschedu
> ling_interrupts
>      14786 =C2=B1  4%     -32.7%       9955        interrupts.CPU269.CAL:=
Function
> _call_interrupts
>     579.00 =C2=B1  2%     -81.9%     105.00 =C2=B1  9%  interrupts.CPU269=
.RES:Reschedu
> ling_interrupts
>      16449 =C2=B1  2%     -40.8%       9742 =C2=B1  3%  interrupts.CPU27.=
CAL:Function_
> call_interrupts
>       4245 =C2=B1  9%     -37.3%       2660 =C2=B1 43%  interrupts.CPU27.=
NMI:Non-maska
> ble_interrupts
>       4245 =C2=B1  9%     -37.3%       2660 =C2=B1 43%  interrupts.CPU27.=
PMI:Performan
> ce_monitoring_interrupts
>     926.33 =C2=B1  2%     -41.7%     540.33 =C2=B1  4%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>      16279 =C2=B1  2%     -34.8%      10616 =C2=B1  2%  interrupts.CPU270=
.CAL:Function
> _call_interrupts
>     678.00 =C2=B1  4%     -85.2%     100.33 =C2=B1  3%  interrupts.CPU270=
.RES:Reschedu
> ling_interrupts
>      15420 =C2=B1  5%     -30.9%      10661 =C2=B1  3%  interrupts.CPU271=
.CAL:Function
> _call_interrupts
>     634.67 =C2=B1  5%     -80.6%     123.33 =C2=B1 27%  interrupts.CPU271=
.RES:Reschedu
> ling_interrupts
>      14594           -29.4%      10309 =C2=B1  2%  interrupts.CPU272.CAL:=
Function
> _call_interrupts
>     578.33 =C2=B1  8%     -73.5%     153.33 =C2=B1 17%  interrupts.CPU272=
.RES:Reschedu
> ling_interrupts
>       5945 =C2=B1  2%     +11.4%       6624 =C2=B1  3%  interrupts.CPU272=
.TLB:TLB_shoo
> tdowns
>      15202           -29.4%      10728 =C2=B1  3%  interrupts.CPU273.CAL:=
Function
> _call_interrupts
>       2780 =C2=B1 34%     -32.2%       1885 =C2=B1  6%  interrupts.CPU273=
.NMI:Non-mask
> able_interrupts
>       2780 =C2=B1 34%     -32.2%       1885 =C2=B1  6%  interrupts.CPU273=
.PMI:Performa
> nce_monitoring_interrupts
>     562.33 =C2=B1  8%     -67.8%     181.00 =C2=B1 42%  interrupts.CPU273=
.RES:Reschedu
> ling_interrupts
>      16164           -33.2%      10791 =C2=B1  3%  interrupts.CPU274.CAL:=
Function
> _call_interrupts
>       3208 =C2=B1 21%     -36.5%       2038 =C2=B1 12%  interrupts.CPU274=
.NMI:Non-mask
> able_interrupts
>       3208 =C2=B1 21%     -36.5%       2038 =C2=B1 12%  interrupts.CPU274=
.PMI:Performa
> nce_monitoring_interrupts
>     652.33 =C2=B1  2%     -84.1%     104.00 =C2=B1 12%  interrupts.CPU274=
.RES:Reschedu
> ling_interrupts
>      16371 =C2=B1  2%     -35.8%      10516 =C2=B1  3%  interrupts.CPU275=
.CAL:Function
> _call_interrupts
>     720.33 =C2=B1 10%     -70.4%     213.00 =C2=B1 73%  interrupts.CPU275=
.RES:Reschedu
> ling_interrupts
>      15706 =C2=B1  7%     -33.6%      10424 =C2=B1  2%  interrupts.CPU276=
.CAL:Function
> _call_interrupts
>     644.67 =C2=B1  7%     -87.3%      82.00 =C2=B1 13%  interrupts.CPU276=
.RES:Reschedu
> ling_interrupts
>      15575 =C2=B1  6%     -33.0%      10433 =C2=B1  2%  interrupts.CPU277=
.CAL:Function
> _call_interrupts
>     651.67 =C2=B1 10%     -86.9%      85.67 =C2=B1  9%  interrupts.CPU277=
.RES:Reschedu
> ling_interrupts
>      14992 =C2=B1  5%     -29.7%      10532        interrupts.CPU278.CAL:=
Function
> _call_interrupts
>     653.00 =C2=B1  5%     -83.8%     105.67 =C2=B1 20%  interrupts.CPU278=
.RES:Reschedu
> ling_interrupts
>      15235 =C2=B1  2%     -34.0%      10055 =C2=B1  3%  interrupts.CPU279=
.CAL:Function
> _call_interrupts
>       1676 =C2=B1 10%     +31.0%       2197        interrupts.CPU279.NMI:=
Non-mask
> able_interrupts
>       1676 =C2=B1 10%     +31.0%       2197        interrupts.CPU279.PMI:=
Performa
> nce_monitoring_interrupts
>     702.00 =C2=B1 16%     -87.4%      88.33 =C2=B1  9%  interrupts.CPU279=
.RES:Reschedu
> ling_interrupts
>      17065 =C2=B1  4%     -44.6%       9448 =C2=B1  3%  interrupts.CPU28.=
CAL:Function_
> call_interrupts
>     982.00 =C2=B1  9%     -44.8%     541.67 =C2=B1  6%  interrupts.CPU28.=
RES:Reschedul
> ing_interrupts
>       6552 =C2=B1  4%      -6.3%       6136 =C2=B1  5%  interrupts.CPU28.=
TLB:TLB_shoot
> downs
>      16348 =C2=B1  5%     -38.2%      10103 =C2=B1  3%  interrupts.CPU280=
.CAL:Function
> _call_interrupts
>     653.33 =C2=B1  3%     -77.8%     145.00 =C2=B1 36%  interrupts.CPU280=
.RES:Reschedu
> ling_interrupts
>      16212 =C2=B1  6%     -36.8%      10250 =C2=B1  4%  interrupts.CPU281=
.CAL:Function
> _call_interrupts
>     674.00 =C2=B1  7%     -81.5%     124.67 =C2=B1 10%  interrupts.CPU281=
.RES:Reschedu
> ling_interrupts
>      15628           -32.9%      10478 =C2=B1  3%  interrupts.CPU282.CAL:=
Function
> _call_interrupts
>     596.00 =C2=B1  4%     -81.1%     112.67 =C2=B1  6%  interrupts.CPU282=
.RES:Reschedu
> ling_interrupts
>      15756           -34.1%      10376 =C2=B1  5%  interrupts.CPU283.CAL:=
Function
> _call_interrupts
>     624.00 =C2=B1  5%     -80.2%     123.33 =C2=B1 45%  interrupts.CPU283=
.RES:Reschedu
> ling_interrupts
>      16235 =C2=B1  5%     -36.7%      10276 =C2=B1  7%  interrupts.CPU284=
.CAL:Function
> _call_interrupts
>     638.00 =C2=B1  4%     -83.6%     104.33 =C2=B1  9%  interrupts.CPU284=
.RES:Reschedu
> ling_interrupts
>      15205 =C2=B1  7%     -32.5%      10261        interrupts.CPU285.CAL:=
Function
> _call_interrupts
>     677.67           -84.3%     106.33 =C2=B1 11%  interrupts.CPU285.RES:=
Reschedu
> ling_interrupts
>      15025 =C2=B1  5%     -34.6%       9820 =C2=B1  4%  interrupts.CPU286=
.CAL:Function
> _call_interrupts
>     618.67 =C2=B1  3%     -76.3%     146.33 =C2=B1 57%  interrupts.CPU286=
.RES:Reschedu
> ling_interrupts
>      13486 =C2=B1  5%     -33.7%       8935 =C2=B1  8%  interrupts.CPU287=
.CAL:Function
> _call_interrupts
>     603.33 =C2=B1  3%     -78.6%     129.33 =C2=B1 17%  interrupts.CPU287=
.RES:Reschedu
> ling_interrupts
>      16566 =C2=B1  4%     -41.2%       9733 =C2=B1  4%  interrupts.CPU29.=
CAL:Function_
> call_interrupts
>     950.00 =C2=B1  4%     -42.2%     549.00 =C2=B1  6%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>      17490 =C2=B1  7%     -46.4%       9373        interrupts.CPU3.CAL:Fu=
nction_c
> all_interrupts
>       1304 =C2=B1 10%     -32.9%     875.33 =C2=B1 16%  interrupts.CPU3.R=
ES:Rescheduli
> ng_interrupts
>       7809 =C2=B1 13%     -19.1%       6317 =C2=B1  2%  interrupts.CPU3.T=
LB:TLB_shootd
> owns
>      16212 =C2=B1  3%     -38.7%       9942 =C2=B1  6%  interrupts.CPU30.=
CAL:Function_
> call_interrupts
>       4408 =C2=B1  9%     -58.5%       1830 =C2=B1  4%  interrupts.CPU30.=
NMI:Non-maska
> ble_interrupts
>       4408 =C2=B1  9%     -58.5%       1830 =C2=B1  4%  interrupts.CPU30.=
PMI:Performan
> ce_monitoring_interrupts
>       1029 =C2=B1  4%     -48.7%     528.33        interrupts.CPU30.RES:R=
eschedul
> ing_interrupts
>      15974           -36.7%      10113 =C2=B1  2%  interrupts.CPU31.CAL:F=
unction_
> call_interrupts
>     999.67 =C2=B1  6%     -47.5%     524.33 =C2=B1  3%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>      15946 =C2=B1  3%     -39.1%       9718 =C2=B1  5%  interrupts.CPU32.=
CAL:Function_
> call_interrupts
>     960.67 =C2=B1  5%     -44.8%     530.00 =C2=B1  4%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>      16058 =C2=B1  5%     -38.4%       9884 =C2=B1  2%  interrupts.CPU33.=
CAL:Function_
> call_interrupts
>     932.33 =C2=B1  6%     -45.4%     508.67        interrupts.CPU33.RES:R=
eschedul
> ing_interrupts
>      16184 =C2=B1  5%     -40.8%       9582 =C2=B1  4%  interrupts.CPU34.=
CAL:Function_
> call_interrupts
>     924.67 =C2=B1  5%     -40.9%     546.33 =C2=B1  3%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>      15757 =C2=B1  6%     -35.8%      10110 =C2=B1  2%  interrupts.CPU35.=
CAL:Function_
> call_interrupts
>       3436 =C2=B1 24%     -43.3%       1949 =C2=B1  8%  interrupts.CPU35.=
NMI:Non-maska
> ble_interrupts
>       3436 =C2=B1 24%     -43.3%       1949 =C2=B1  8%  interrupts.CPU35.=
PMI:Performan
> ce_monitoring_interrupts
>     923.67 =C2=B1  3%     -41.9%     536.33        interrupts.CPU35.RES:R=
eschedul
> ing_interrupts
>      16126 =C2=B1  3%     -36.6%      10217        interrupts.CPU36.CAL:F=
unction_
> call_interrupts
>     972.33 =C2=B1 13%     -44.8%     536.33 =C2=B1 10%  interrupts.CPU36.=
RES:Reschedul
> ing_interrupts
>      16023 =C2=B1  3%     -39.8%       9651 =C2=B1  4%  interrupts.CPU37.=
CAL:Function_
> call_interrupts
>       1011 =C2=B1  8%     -47.1%     535.00 =C2=B1  3%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>      16359 =C2=B1  4%     -39.7%       9868 =C2=B1  2%  interrupts.CPU38.=
CAL:Function_
> call_interrupts
>     960.00 =C2=B1  4%     -45.3%     525.33 =C2=B1  3%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>      15679 =C2=B1  2%     -35.7%      10079        interrupts.CPU39.CAL:F=
unction_
> call_interrupts
>     944.00           -43.3%     535.67 =C2=B1  5%  interrupts.CPU39.RES:R=
eschedul
> ing_interrupts
>      16127 =C2=B1  5%     -38.3%       9951 =C2=B1  3%  interrupts.CPU4.C=
AL:Function_c
> all_interrupts
>     970.33 =C2=B1  6%     -46.3%     521.33 =C2=B1  4%  interrupts.CPU4.R=
ES:Rescheduli
> ng_interrupts
>      16774 =C2=B1  2%     -44.0%       9391 =C2=B1  5%  interrupts.CPU40.=
CAL:Function_
> call_interrupts
>     982.33 =C2=B1  7%     -43.2%     557.67        interrupts.CPU40.RES:R=
eschedul
> ing_interrupts
>       6796 =C2=B1  6%     -19.1%       5496 =C2=B1  9%  interrupts.CPU40.=
TLB:TLB_shoot
> downs
>      16850 =C2=B1  2%     -38.8%      10317        interrupts.CPU41.CAL:F=
unction_
> call_interrupts
>     956.33 =C2=B1  3%     -42.2%     552.67 =C2=B1  7%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>      16756 =C2=B1  5%     -43.5%       9466 =C2=B1  3%  interrupts.CPU42.=
CAL:Function_
> call_interrupts
>     939.67 =C2=B1  4%     -43.4%     531.67 =C2=B1  2%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>      16857 =C2=B1  4%     -41.8%       9815 =C2=B1  4%  interrupts.CPU43.=
CAL:Function_
> call_interrupts
>       1890 =C2=B1 17%     +95.0%       3685        interrupts.CPU43.NMI:N=
on-maska
> ble_interrupts
>       1890 =C2=B1 17%     +95.0%       3685        interrupts.CPU43.PMI:P=
erforman
> ce_monitoring_interrupts
>     938.67           -45.1%     515.33 =C2=B1  2%  interrupts.CPU43.RES:R=
eschedul
> ing_interrupts
>      15972 =C2=B1  2%     -36.8%      10096        interrupts.CPU44.CAL:F=
unction_
> call_interrupts
>     930.67 =C2=B1  3%     -44.6%     515.67 =C2=B1  2%  interrupts.CPU44.=
RES:Reschedul
> ing_interrupts
>      15741 =C2=B1  5%     -34.1%      10380 =C2=B1  2%  interrupts.CPU45.=
CAL:Function_
> call_interrupts
>     899.67 =C2=B1  8%     -41.5%     526.33 =C2=B1  3%  interrupts.CPU45.=
RES:Reschedul
> ing_interrupts
>      16036 =C2=B1  4%     -37.0%      10102 =C2=B1  2%  interrupts.CPU46.=
CAL:Function_
> call_interrupts
>     980.33 =C2=B1  6%     -50.1%     489.33 =C2=B1  3%  interrupts.CPU46.=
RES:Reschedul
> ing_interrupts
>      15205 =C2=B1  3%     -34.7%       9933 =C2=B1  3%  interrupts.CPU47.=
CAL:Function_
> call_interrupts
>     922.33 =C2=B1  6%     -46.8%     490.33 =C2=B1  4%  interrupts.CPU47.=
RES:Reschedul
> ing_interrupts
>      16006 =C2=B1  4%     -39.2%       9729        interrupts.CPU48.CAL:F=
unction_
> call_interrupts
>     947.67 =C2=B1  3%     -49.2%     481.33        interrupts.CPU48.RES:R=
eschedul
> ing_interrupts
>      16059           -38.1%       9947 =C2=B1  3%  interrupts.CPU49.CAL:F=
unction_
> call_interrupts
>     922.00 =C2=B1  4%     -47.8%     481.00 =C2=B1  2%  interrupts.CPU49.=
RES:Reschedul
> ing_interrupts
>      16096 =C2=B1  5%     -39.8%       9684 =C2=B1  4%  interrupts.CPU5.C=
AL:Function_c
> all_interrupts
>     983.33 =C2=B1  4%     -45.6%     535.33 =C2=B1  3%  interrupts.CPU5.R=
ES:Rescheduli
> ng_interrupts
>      16493 =C2=B1  3%     -36.8%      10427 =C2=B1  3%  interrupts.CPU50.=
CAL:Function_
> call_interrupts
>     951.00           -51.2%     464.33 =C2=B1  3%  interrupts.CPU50.RES:R=
eschedul
> ing_interrupts
>       6049 =C2=B1  5%     +10.3%       6673 =C2=B1  5%  interrupts.CPU50.=
TLB:TLB_shoot
> downs
>      16322 =C2=B1  4%     -39.8%       9821 =C2=B1  3%  interrupts.CPU51.=
CAL:Function_
> call_interrupts
>     868.67           -49.1%     442.00 =C2=B1  3%  interrupts.CPU51.RES:R=
eschedul
> ing_interrupts
>      15310 =C2=B1  7%     -33.7%      10153 =C2=B1  3%  interrupts.CPU52.=
CAL:Function_
> call_interrupts
>       2585 =C2=B1 31%     -35.0%       1681 =C2=B1 12%  interrupts.CPU52.=
NMI:Non-maska
> ble_interrupts
>       2585 =C2=B1 31%     -35.0%       1681 =C2=B1 12%  interrupts.CPU52.=
PMI:Performan
> ce_monitoring_interrupts
>     875.33 =C2=B1  2%     -46.4%     469.00 =C2=B1  5%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>      15383 =C2=B1  5%     -37.0%       9698 =C2=B1  5%  interrupts.CPU53.=
CAL:Function_
> call_interrupts
>     804.67 =C2=B1  5%     -44.8%     444.33 =C2=B1  3%  interrupts.CPU53.=
RES:Reschedul
> ing_interrupts
>      16307 =C2=B1  4%     -36.7%      10323 =C2=B1  2%  interrupts.CPU54.=
CAL:Function_
> call_interrupts
>     888.67 =C2=B1  4%     -48.3%     459.33 =C2=B1  5%  interrupts.CPU54.=
RES:Reschedul
> ing_interrupts
>      15998           -38.4%       9858 =C2=B1  3%  interrupts.CPU55.CAL:F=
unction_
> call_interrupts
>     873.33 =C2=B1  5%     -47.1%     461.67 =C2=B1  8%  interrupts.CPU55.=
RES:Reschedul
> ing_interrupts
>       6831 =C2=B1  5%     -12.7%       5963 =C2=B1  2%  interrupts.CPU55.=
TLB:TLB_shoot
> downs
>      15775           -40.6%       9365 =C2=B1  4%  interrupts.CPU56.CAL:F=
unction_
> call_interrupts
>     839.67 =C2=B1  5%     -37.4%     526.00 =C2=B1  8%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>       6383 =C2=B1  2%     -10.3%       5728 =C2=B1  2%  interrupts.CPU56.=
TLB:TLB_shoot
> downs
>      15022           -31.6%      10278 =C2=B1  2%  interrupts.CPU57.CAL:F=
unction_
> call_interrupts
>       2629 =C2=B1 18%     -28.1%       1890 =C2=B1  3%  interrupts.CPU57.=
NMI:Non-maska
> ble_interrupts
>       2629 =C2=B1 18%     -28.1%       1890 =C2=B1  3%  interrupts.CPU57.=
PMI:Performan
> ce_monitoring_interrupts
>     800.67 =C2=B1  6%     -36.1%     512.00 =C2=B1 12%  interrupts.CPU57.=
RES:Reschedul
> ing_interrupts
>      16702 =C2=B1  4%     -40.4%       9950 =C2=B1  5%  interrupts.CPU58.=
CAL:Function_
> call_interrupts
>     922.33 =C2=B1  5%     -50.1%     460.33 =C2=B1  4%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>      16015           -37.9%       9947 =C2=B1  9%  interrupts.CPU59.CAL:F=
unction_
> call_interrupts
>     909.33 =C2=B1  3%     -50.5%     449.67 =C2=B1  8%  interrupts.CPU59.=
RES:Reschedul
> ing_interrupts
>      16429 =C2=B1  2%     -44.3%       9146 =C2=B1  2%  interrupts.CPU6.C=
AL:Function_c
> all_interrupts
>     965.33 =C2=B1  4%     -45.9%     522.67 =C2=B1  7%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>      16605 =C2=B1  5%     -38.4%      10225 =C2=B1  3%  interrupts.CPU60.=
CAL:Function_
> call_interrupts
>       2456 =C2=B1 24%     -24.2%       1860 =C2=B1  9%  interrupts.CPU60.=
NMI:Non-maska
> ble_interrupts
>       2456 =C2=B1 24%     -24.2%       1860 =C2=B1  9%  interrupts.CPU60.=
PMI:Performan
> ce_monitoring_interrupts
>     841.33 =C2=B1  5%     -48.3%     435.00        interrupts.CPU60.RES:R=
eschedul
> ing_interrupts
>      15904 =C2=B1  3%     -36.6%      10075 =C2=B1  2%  interrupts.CPU61.=
CAL:Function_
> call_interrupts
>     871.00 =C2=B1  7%     -50.1%     434.33 =C2=B1  3%  interrupts.CPU61.=
RES:Reschedul
> ing_interrupts
>      15657 =C2=B1  7%     -35.4%      10108        interrupts.CPU62.CAL:F=
unction_
> call_interrupts
>     903.33 =C2=B1  4%     -49.9%     452.33 =C2=B1  4%  interrupts.CPU62.=
RES:Reschedul
> ing_interrupts
>      15363 =C2=B1  3%     -35.8%       9856 =C2=B1  2%  interrupts.CPU63.=
CAL:Function_
> call_interrupts
>     876.67 =C2=B1 11%     -48.4%     452.67        interrupts.CPU63.RES:R=
eschedul
> ing_interrupts
>      16677 =C2=B1  6%     -40.8%       9874 =C2=B1  6%  interrupts.CPU64.=
CAL:Function_
> call_interrupts
>     927.00 =C2=B1  2%     -50.2%     461.67 =C2=B1  5%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>      16582 =C2=B1  3%     -40.9%       9806        interrupts.CPU65.CAL:F=
unction_
> call_interrupts
>     873.00 =C2=B1  2%     -48.8%     446.67 =C2=B1  2%  interrupts.CPU65.=
RES:Reschedul
> ing_interrupts
>      16165 =C2=B1  2%     -38.5%       9945 =C2=B1  3%  interrupts.CPU66.=
CAL:Function_
> call_interrupts
>     891.00 =C2=B1  4%     -49.8%     447.00 =C2=B1  3%  interrupts.CPU66.=
RES:Reschedul
> ing_interrupts
>      15845           -39.4%       9610 =C2=B1  4%  interrupts.CPU67.CAL:F=
unction_
> call_interrupts
>     875.33           -49.7%     440.67 =C2=B1 10%  interrupts.CPU67.RES:R=
eschedul
> ing_interrupts
>      15764 =C2=B1  6%     -35.3%      10197 =C2=B1  5%  interrupts.CPU68.=
CAL:Function_
> call_interrupts
>     894.00 =C2=B1  3%     -50.1%     446.33        interrupts.CPU68.RES:R=
eschedul
> ing_interrupts
>      15783 =C2=B1  7%     -35.7%      10142 =C2=B1 10%  interrupts.CPU69.=
CAL:Function_
> call_interrupts
>     835.00 =C2=B1  6%     -47.7%     436.33 =C2=B1  2%  interrupts.CPU69.=
RES:Reschedul
> ing_interrupts
>      15635 =C2=B1  5%     -40.0%       9379        interrupts.CPU7.CAL:Fu=
nction_c
> all_interrupts
>     916.00 =C2=B1  2%     -42.5%     526.67 =C2=B1  6%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>      15154 =C2=B1  5%     -39.2%       9215 =C2=B1  3%  interrupts.CPU70.=
CAL:Function_
> call_interrupts
>     835.00 =C2=B1  3%     -49.9%     418.67        interrupts.CPU70.RES:R=
eschedul
> ing_interrupts
>      15138 =C2=B1  6%     -39.3%       9191 =C2=B1  5%  interrupts.CPU71.=
CAL:Function_
> call_interrupts
>       1436 =C2=B1 22%    +124.2%       3220 =C2=B1 21%  interrupts.CPU71.=
NMI:Non-maska
> ble_interrupts
>       1436 =C2=B1 22%    +124.2%       3220 =C2=B1 21%  interrupts.CPU71.=
PMI:Performan
> ce_monitoring_interrupts
>     882.67 =C2=B1  8%     -53.2%     413.00 =C2=B1  8%  interrupts.CPU71.=
RES:Reschedul
> ing_interrupts
>      12070 =C2=B1 13%     -25.5%       8991 =C2=B1  5%  interrupts.CPU72.=
CAL:Function_
> call_interrupts
>     844.67 =C2=B1 12%     -44.2%     471.33 =C2=B1 42%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>      12035 =C2=B1 10%     -23.6%       9199 =C2=B1  5%  interrupts.CPU73.=
CAL:Function_
> call_interrupts
>     797.00 =C2=B1 11%     -49.1%     405.67 =C2=B1 22%  interrupts.CPU73.=
RES:Reschedul
> ing_interrupts
>      16608 =C2=B1  2%     -37.6%      10367 =C2=B1  3%  interrupts.CPU74.=
CAL:Function_
> call_interrupts
>       1074 =C2=B1 18%     -39.3%     652.00 =C2=B1 27%  interrupts.CPU74.=
RES:Reschedul
> ing_interrupts
>       7597 =C2=B1  5%     -15.0%       6453 =C2=B1  6%  interrupts.CPU74.=
TLB:TLB_shoot
> downs
>      16871           -39.2%      10260 =C2=B1  2%  interrupts.CPU75.CAL:F=
unction_
> call_interrupts
>       1168 =C2=B1 17%     -52.5%     554.67 =C2=B1 22%  interrupts.CPU75.=
RES:Reschedul
> ing_interrupts
>       7525 =C2=B1  5%     -12.5%       6587 =C2=B1  3%  interrupts.CPU75.=
TLB:TLB_shoot
> downs
>      16005 =C2=B1  3%     -32.5%      10800 =C2=B1  4%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>     812.67 =C2=B1  8%     -66.6%     271.33 =C2=B1 12%  interrupts.CPU76.=
RES:Reschedul
> ing_interrupts
>      16274 =C2=B1  2%     -34.6%      10649        interrupts.CPU77.CAL:F=
unction_
> call_interrupts
>     801.00 =C2=B1  4%     -66.9%     265.00 =C2=B1  5%  interrupts.CPU77.=
RES:Reschedul
> ing_interrupts
>      15894 =C2=B1  6%     -37.0%      10015 =C2=B1  3%  interrupts.CPU78.=
CAL:Function_
> call_interrupts
>     767.67 =C2=B1 12%     -69.2%     236.33 =C2=B1  2%  interrupts.CPU78.=
RES:Reschedul
> ing_interrupts
>      15846 =C2=B1  4%     -40.5%       9430 =C2=B1  3%  interrupts.CPU79.=
CAL:Function_
> call_interrupts
>     680.67 =C2=B1  2%     -62.1%     257.67 =C2=B1 14%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>       6650 =C2=B1 13%     -18.4%       5424 =C2=B1  3%  interrupts.CPU79.=
TLB:TLB_shoot
> downs
>      16627           -41.1%       9794        interrupts.CPU8.CAL:Functio=
n_c
> all_interrupts
>     953.67 =C2=B1  2%     -42.6%     547.33 =C2=B1  9%  interrupts.CPU8.R=
ES:Rescheduli
> ng_interrupts
>      16212 =C2=B1  2%     -33.0%      10861        interrupts.CPU80.CAL:F=
unction_
> call_interrupts
>       3040 =C2=B1 29%     -33.6%       2019 =C2=B1  7%  interrupts.CPU80.=
NMI:Non-maska
> ble_interrupts
>       3040 =C2=B1 29%     -33.6%       2019 =C2=B1  7%  interrupts.CPU80.=
PMI:Performan
> ce_monitoring_interrupts
>     723.33 =C2=B1  2%     -59.7%     291.67 =C2=B1 16%  interrupts.CPU80.=
RES:Reschedul
> ing_interrupts
>      16273 =C2=B1  2%     -37.0%      10246 =C2=B1  3%  interrupts.CPU81.=
CAL:Function_
> call_interrupts
>       3705 =C2=B1 29%     -34.3%       2433 =C2=B1 33%  interrupts.CPU81.=
NMI:Non-maska
> ble_interrupts
>       3705 =C2=B1 29%     -34.3%       2433 =C2=B1 33%  interrupts.CPU81.=
PMI:Performan
> ce_monitoring_interrupts
>     733.00 =C2=B1  6%     -64.3%     262.00 =C2=B1 14%  interrupts.CPU81.=
RES:Reschedul
> ing_interrupts
>      15537           -34.9%      10122 =C2=B1  7%  interrupts.CPU82.CAL:F=
unction_
> call_interrupts
>     811.00 =C2=B1  8%     -61.7%     310.33 =C2=B1 10%  interrupts.CPU82.=
RES:Reschedul
> ing_interrupts
>      16510 =C2=B1  2%     -37.1%      10392 =C2=B1  5%  interrupts.CPU83.=
CAL:Function_
> call_interrupts
>     747.33 =C2=B1  8%     -62.4%     280.67 =C2=B1 10%  interrupts.CPU83.=
RES:Reschedul
> ing_interrupts
>       7265 =C2=B1  8%     -11.9%       6399 =C2=B1  8%  interrupts.CPU83.=
TLB:TLB_shoot
> downs
>      15559 =C2=B1  2%     -34.0%      10269        interrupts.CPU84.CAL:F=
unction_
> call_interrupts
>     713.00 =C2=B1  4%     -68.6%     223.67        interrupts.CPU84.RES:R=
eschedul
> ing_interrupts
>      15390           -35.0%      10001 =C2=B1  4%  interrupts.CPU85.CAL:F=
unction_
> call_interrupts
>     704.67           -64.0%     253.67 =C2=B1 14%  interrupts.CPU85.RES:R=
eschedul
> ing_interrupts
>      15589 =C2=B1  4%     -36.3%       9934 =C2=B1  7%  interrupts.CPU86.=
CAL:Function_
> call_interrupts
>     776.67           -62.1%     294.33 =C2=B1 19%  interrupts.CPU86.RES:R=
eschedul
> ing_interrupts
>      15643 =C2=B1  2%     -32.9%      10496 =C2=B1  4%  interrupts.CPU87.=
CAL:Function_
> call_interrupts
>       3748 =C2=B1 29%     -32.2%       2539 =C2=B1 24%  interrupts.CPU87.=
NMI:Non-maska
> ble_interrupts
>       3748 =C2=B1 29%     -32.2%       2539 =C2=B1 24%  interrupts.CPU87.=
PMI:Performan
> ce_monitoring_interrupts
>     776.00 =C2=B1  5%     -56.1%     340.67 =C2=B1 11%  interrupts.CPU87.=
RES:Reschedul
> ing_interrupts
>      15865 =C2=B1  2%     -31.2%      10909        interrupts.CPU88.CAL:F=
unction_
> call_interrupts
>       2092 =C2=B1  5%     +67.0%       3495 =C2=B1 28%  interrupts.CPU88.=
NMI:Non-maska
> ble_interrupts
>       2092 =C2=B1  5%     +67.0%       3495 =C2=B1 28%  interrupts.CPU88.=
PMI:Performan
> ce_monitoring_interrupts
>     830.67 =C2=B1  5%     -68.5%     262.00 =C2=B1 19%  interrupts.CPU88.=
RES:Reschedul
> ing_interrupts
>      15925 =C2=B1  2%     -31.7%      10881 =C2=B1  2%  interrupts.CPU89.=
CAL:Function_
> call_interrupts
>     779.00 =C2=B1  4%     -61.6%     299.33 =C2=B1 21%  interrupts.CPU89.=
RES:Reschedul
> ing_interrupts
>      16220 =C2=B1  2%     -41.9%       9417        interrupts.CPU9.CAL:Fu=
nction_c
> all_interrupts
>     916.33           -41.7%     534.00 =C2=B1  3%  interrupts.CPU9.RES:Re=
scheduli
> ng_interrupts
>       6600 =C2=B1  3%     -10.2%       5925 =C2=B1  3%  interrupts.CPU9.T=
LB:TLB_shootd
> owns
>      15882 =C2=B1  2%     -35.4%      10256 =C2=B1  2%  interrupts.CPU90.=
CAL:Function_
> call_interrupts
>     795.67 =C2=B1 11%     -65.7%     273.00 =C2=B1 12%  interrupts.CPU90.=
RES:Reschedul
> ing_interrupts
>      16401           -34.5%      10737 =C2=B1  2%  interrupts.CPU91.CAL:F=
unction_
> call_interrupts
>     757.33 =C2=B1  9%     -70.7%     221.67 =C2=B1  5%  interrupts.CPU91.=
RES:Reschedul
> ing_interrupts
>      15839 =C2=B1  5%     -33.7%      10502 =C2=B1  5%  interrupts.CPU92.=
CAL:Function_
> call_interrupts
>     737.00 =C2=B1 13%     -63.5%     269.33 =C2=B1 12%  interrupts.CPU92.=
RES:Reschedul
> ing_interrupts
>      15383 =C2=B1  6%     -29.7%      10821 =C2=B1  7%  interrupts.CPU93.=
CAL:Function_
> call_interrupts
>     664.33 =C2=B1  5%     -57.9%     279.67 =C2=B1 10%  interrupts.CPU93.=
RES:Reschedul
> ing_interrupts
>      17405 =C2=B1  6%     -39.7%      10503 =C2=B1  3%  interrupts.CPU94.=
CAL:Function_
> call_interrupts
>     757.33 =C2=B1  6%     -72.1%     211.67 =C2=B1  7%  interrupts.CPU94.=
RES:Reschedul
> ing_interrupts
>      17026 =C2=B1  6%     -39.8%      10246 =C2=B1  3%  interrupts.CPU95.=
CAL:Function_
> call_interrupts
>     755.67           -67.9%     242.33 =C2=B1  4%  interrupts.CPU95.RES:R=
eschedul
> ing_interrupts
>       7085 =C2=B1  8%     -11.3%       6285 =C2=B1  4%  interrupts.CPU95.=
TLB:TLB_shoot
> downs
>      16264 =C2=B1  7%     -35.9%      10417 =C2=B1  3%  interrupts.CPU96.=
CAL:Function_
> call_interrupts
>     729.33 =C2=B1  4%     -63.5%     266.00 =C2=B1 17%  interrupts.CPU96.=
RES:Reschedul
> ing_interrupts
>      16049 =C2=B1  6%     -36.6%      10181        interrupts.CPU97.CAL:F=
unction_
> call_interrupts
>     715.00 =C2=B1  2%     -68.4%     225.67 =C2=B1  8%  interrupts.CPU97.=
RES:Reschedul
> ing_interrupts
>      15655 =C2=B1  4%     -32.5%      10566        interrupts.CPU98.CAL:F=
unction_
> call_interrupts
>     747.67 =C2=B1  8%     -68.7%     234.33 =C2=B1  6%  interrupts.CPU98.=
RES:Reschedul
> ing_interrupts
>      16272           -37.1%      10241        interrupts.CPU99.CAL:Functi=
on_
> call_interrupts
>     777.67           -71.2%     223.67 =C2=B1  5%  interrupts.CPU99.RES:R=
eschedul
> ing_interrupts
>     222434           -63.8%      80497        interrupts.RES:Rescheduling=
_in
> terrupts
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-cpl-4sp1: 144 threads Intel(R) Xeon(R) Gold 5318H CPU @ 2.50GHz with =
128
> G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/tes=
tca
> se/ucode:
>   gcc-9/performance/1BRD_48G/xfs/x86_64-rhel-8.3/600/debian-10.4-x86_64-2=
020
> 0603.cgz/lkp-cpl-4sp1/sync_disk_rw/aim7/0x700001e
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      18797            +4.7%      19676        aim7.jobs-per-min
>     191.57            -4.5%     183.02        aim7.time.elapsed_time
>     191.57            -4.5%     183.02        aim7.time.elapsed_time.max
>     453552           -29.7%     318738        aim7.time.involuntary_conte=
xt_
> switches
>       9392            +6.5%      10000        aim7.time.system_time
>      26.53 =C2=B1  2%     -15.0%      22.56        aim7.time.user_time
>     498131 =C2=B1  3%     +11.8%     556781 =C2=B1  4%  meminfo.Mapped
>      36.19            +3.9       40.11        mpstat.cpu.all.sys%
>  8.127e+08 =C2=B1 13%     -28.0%  5.852e+08        cpuidle.C1.time
>   14566599 =C2=B1  5%     -19.1%   11787585        cpuidle.C1.usage
>      62.96            -6.1%      59.09        iostat.cpu.idle
>      36.76           +10.5%      40.62        iostat.cpu.system
>    2644895 =C2=B1  6%     +15.7%    3061096 =C2=B1  3%  numa-numastat.nod=
e3.local_node
>    2690447 =C2=B1  6%     +16.0%    3120521 =C2=B1  3%  numa-numastat.nod=
e3.numa_hit
>      62.50            -6.0%      58.75        vmstat.cpu.id
>     745927            +4.4%     778810        vmstat.io.bo
>    1103266            +5.6%    1165226        vmstat.system.cs
>     125849 =C2=B1  3%     +11.8%     140669 =C2=B1  4%  proc-vmstat.nr_ma=
pped
>     545931            -1.3%     538967        proc-vmstat.nr_shmem
>     387827            +5.2%     407877        proc-vmstat.numa_hint_faults
>     123926           +11.6%     138279 =C2=B1  3%  proc-vmstat.numa_hint_=
faults_l
> ocal
>       1072 =C2=B1  6%     -22.4%     832.00 =C2=B1  9%  slabinfo.kmem_cac=
he.active_obj
> s
>       1072 =C2=B1  6%     -22.4%     832.00 =C2=B1  9%  slabinfo.kmem_cac=
he.num_objs
>       1555 =C2=B1  4%     -15.4%       1315 =C2=B1  5%  slabinfo.kmem_cac=
he_node.activ
> e_objs
>       1648 =C2=B1  4%     -14.6%       1408 =C2=B1  5%  slabinfo.kmem_cac=
he_node.num_o
> bjs
>       3.88 =C2=B1 21%     +48.4%       5.75 =C2=B1 15%  sched_debug.cfs_r=
q:/.load_avg.
> min
>    2144102           +22.6%    2627676        sched_debug.cfs_rq:/.min_vr=
unt
> ime.avg
>    2387488 =C2=B1  2%     +16.4%    2778678 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.max
>    2105780           +22.9%    2587880        sched_debug.cfs_rq:/.min_vr=
unt
> ime.min
>      27878 =C2=B1 11%     -23.2%      21400 =C2=B1 12%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.stddev
>      86.50 =C2=B1 20%     +46.5%     126.75 =C2=B1  6%  sched_debug.cfs_r=
q:/.runnable_
> avg.min
>      27919 =C2=B1 11%     -23.1%      21471 =C2=B1 12%  sched_debug.cfs_r=
q:/.spread0.s
> tddev
>      68.94 =C2=B1 18%     +47.2%     101.50 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_avg.
> min
>     177641 =C2=B1  7%     -27.0%     129664 =C2=B1  3%  sched_debug.cpu.a=
vg_idle.stdde
> v
>       6.88 =C2=B1 42%     -45.5%       3.75 =C2=B1 21%  sched_debug.cpu.n=
r_running.max
>       0.93 =C2=B1 21%     -26.1%       0.69 =C2=B1  7%  sched_debug.cpu.n=
r_running.std
> dev
>      -1086           -58.8%    -447.31        sched_debug.cpu.nr_uninterr=
upt
> ible.min
>     344.83 =C2=B1  2%     -32.9%     231.43 =C2=B1  5%  sched_debug.cpu.n=
r_uninterrupt
> ible.stddev
>     239785 =C2=B1 20%     -45.4%     130994 =C2=B1 40%  numa-meminfo.node=
0.Active
>     239785 =C2=B1 20%     -45.4%     130994 =C2=B1 40%  numa-meminfo.node=
0.Active(anon
> )
>     650763 =C2=B1  9%     -23.9%     495501 =C2=B1 13%  numa-meminfo.node=
0.FilePages
>     309233 =C2=B1 21%     -45.2%     169338 =C2=B1 39%  numa-meminfo.node=
0.Shmem
>     266993 =C2=B1  6%      -4.9%     253887 =C2=B1  5%  numa-meminfo.node=
0.Unevictable
>     480192 =C2=B1 59%     -68.0%     153569 =C2=B1 26%  numa-meminfo.node=
2.Active
>     480192 =C2=B1 59%     -68.0%     153569 =C2=B1 26%  numa-meminfo.node=
2.Active(anon
> )
>     919025 =C2=B1 38%     -42.9%     524685 =C2=B1 11%  numa-meminfo.node=
2.FilePages
>     598807 =C2=B1 59%     -66.1%     203090 =C2=B1 31%  numa-meminfo.node=
2.Shmem
>     758944 =C2=B1 44%     +59.9%    1213268 =C2=B1  4%  numa-meminfo.node=
3.Active
>     758944 =C2=B1 44%     +59.9%    1213268 =C2=B1  4%  numa-meminfo.node=
3.Active(anon
> )
>    1266802 =C2=B1 33%     +47.6%    1869322 =C2=B1  3%  numa-meminfo.node=
3.FilePages
>     183154 =C2=B1 43%     +82.1%     333504 =C2=B1  5%  numa-meminfo.node=
3.Mapped
>     948674 =C2=B1 45%     +61.8%    1534794 =C2=B1  4%  numa-meminfo.node=
3.Shmem
>      60288 =C2=B1 19%     -45.7%      32751 =C2=B1 40%  numa-vmstat.node0=
.nr_active_an
> on
>     162844 =C2=B1  9%     -24.0%     123745 =C2=B1 13%  numa-vmstat.node0=
.nr_file_page
> s
>      21994 =C2=B1 18%     -24.2%      16662 =C2=B1 20%  numa-vmstat.node0=
.nr_mapped
>      77415 =C2=B1 21%     -45.5%      42212 =C2=B1 39%  numa-vmstat.node0=
.nr_shmem
>      66748 =C2=B1  6%      -4.9%      63471 =C2=B1  5%  numa-vmstat.node0=
.nr_unevictab
> le
>      60288 =C2=B1 19%     -45.7%      32751 =C2=B1 40%  numa-vmstat.node0=
.nr_zone_acti
> ve_anon
>      66748 =C2=B1  6%      -4.9%      63471 =C2=B1  5%  numa-vmstat.node0=
.nr_zone_unev
> ictable
>     120872 =C2=B1 59%     -68.2%      38424 =C2=B1 26%  numa-vmstat.node2=
.nr_active_an
> on
>     230217 =C2=B1 38%     -43.0%     131224 =C2=B1 11%  numa-vmstat.node2=
.nr_file_page
> s
>     150180 =C2=B1 59%     -66.2%      50691 =C2=B1 31%  numa-vmstat.node2=
.nr_shmem
>     120872 =C2=B1 59%     -68.2%      38424 =C2=B1 26%  numa-vmstat.node2=
.nr_zone_acti
> ve_anon
>     190737 =C2=B1 44%     +59.2%     303603 =C2=B1  4%  numa-vmstat.node3=
.nr_active_an
> on
>     317209 =C2=B1 33%     +47.2%     467030 =C2=B1  3%  numa-vmstat.node3=
.nr_file_page
> s
>      44825 =C2=B1 43%     +82.9%      81979 =C2=B1  5%  numa-vmstat.node3=
.nr_mapped
>     237630 =C2=B1 45%     +61.3%     383263 =C2=B1  4%  numa-vmstat.node3=
.nr_shmem
>     190737 =C2=B1 44%     +59.2%     303602 =C2=B1  4%  numa-vmstat.node3=
.nr_zone_acti
> ve_anon
>      13.50 =C2=B1  2%     -10.3%      12.12 =C2=B1  2%  perf-stat.i.MPKI
>  3.281e+09            +4.7%  3.435e+09        perf-stat.i.branch-instruct=
ion
> s
>       1.47            -0.1        1.39 =C2=B1  2%  perf-stat.i.branch-mis=
s-rate%
>      38.36            +1.6       39.94        perf-stat.i.cache-miss-rate%
>   80344215            -3.4%   77607977        perf-stat.i.cache-misses
>  2.047e+08            -7.1%  1.902e+08        perf-stat.i.cache-references
>    1116334            +5.8%    1181479        perf-stat.i.context-switches
>      11.79            +6.5%      12.55        perf-stat.i.cpi
>  1.821e+11           +10.7%  2.016e+11        perf-stat.i.cpu-cycles
>     152433            -9.7%     137600        perf-stat.i.cpu-migrations
>       2259           +13.4%       2561        perf-stat.i.cycles-between-=
cac
> he-misses
>    4115978 =C2=B1  5%     +21.1%    4982607 =C2=B1 10%  perf-stat.i.dTLB-=
load-misses
>  4.169e+09            +3.0%  4.295e+09        perf-stat.i.dTLB-loads
>     560189            +9.4%     612630 =C2=B1  5%  perf-stat.i.dTLB-store=
-misses
>  1.863e+09            +2.5%   1.91e+09        perf-stat.i.dTLB-stores
>    8204616            +4.6%    8585072        perf-stat.i.iTLB-load-misses
>  1.545e+10            +3.9%  1.604e+10        perf-stat.i.instructions
>       0.11            -2.9%       0.11        perf-stat.i.ipc
>       1.26           +10.7%       1.40        perf-stat.i.metric.GHz
>       0.19 =C2=B1  4%    +156.9%       0.50 =C2=B1  5%  perf-stat.i.metri=
c.K/sec
>      66.62            +3.2%      68.78        perf-stat.i.metric.M/sec
>       7193            +4.5%       7520        perf-stat.i.minor-faults
>   33236218            -4.3%   31793162        perf-stat.i.node-load-misses
>    2253688           -12.5%    1972403        perf-stat.i.node-loads
>   15039897            +1.3%   15230683        perf-stat.i.node-store-miss=
es
>       7196            +4.5%       7523        perf-stat.i.page-faults
>      13.25           -10.5%      11.86        perf-stat.overall.MPKI
>       1.34            -0.1        1.26        perf-stat.overall.branch-mi=
ss-
> rate%
>      39.25            +1.5       40.79        perf-stat.overall.cache-mis=
s-r
> ate%
>      11.79            +6.6%      12.56        perf-stat.overall.cpi
>       2266           +14.6%       2597        perf-stat.overall.cycles-be=
twe
> en-cache-misses
>       0.10 =C2=B1  5%      +0.0        0.12 =C2=B1  9%  perf-stat.overall=
.dTLB-load-mi
> ss-rate%
>       0.08            -6.2%       0.08        perf-stat.overall.ipc
>  3.265e+09            +4.7%  3.417e+09        perf-stat.ps.branch-instruc=
tio
> ns
>   79925830            -3.4%   77171812        perf-stat.ps.cache-misses
>  2.037e+08            -7.1%  1.892e+08        perf-stat.ps.cache-referenc=
es
>    1110379            +5.8%    1174647        perf-stat.ps.context-switch=
es
>  1.812e+11           +10.7%  2.005e+11        perf-stat.ps.cpu-cycles
>     151604            -9.8%     136805        perf-stat.ps.cpu-migrations
>    4097832 =C2=B1  5%     +21.1%    4962944 =C2=B1 10%  perf-stat.ps.dTLB=
-load-misses
>  4.148e+09            +3.0%  4.272e+09        perf-stat.ps.dTLB-loads
>     557332            +9.3%     609278 =C2=B1  5%  perf-stat.ps.dTLB-stor=
e-misses
>  1.854e+09            +2.4%    1.9e+09        perf-stat.ps.dTLB-stores
>    8164850            +4.6%    8539978        perf-stat.ps.iTLB-load-miss=
es
>  1.537e+10            +3.8%  1.596e+10        perf-stat.ps.instructions
>       7162            +4.5%       7483        perf-stat.ps.minor-faults
>   33061019            -4.4%   31612394        perf-stat.ps.node-load-miss=
es
>    2243185           -12.5%    1962339        perf-stat.ps.node-loads
>   14961153            +1.2%   15144571        perf-stat.ps.node-store-mis=
ses
>       7164            +4.5%       7486        perf-stat.ps.page-faults
>  2.963e+12            -0.9%  2.935e+12        perf-stat.total.instructions
>       0.04 =C2=B1  4%     -14.7%       0.04 =C2=B1  4%  perf-sched.sch_de=
lay.avg.ms.__
> xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_aio_=
wri
> te
>       0.02 =C2=B1 38%     +68.6%       0.03 =C2=B1 13%  perf-sched.sch_de=
lay.avg.ms.do
> _wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>       0.00 =C2=B1 17%    +731.2%       0.03 =C2=B1 78%  perf-sched.sch_de=
lay.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault.[un=
kno
> wn]
>       0.04 =C2=B1 31%     +76.6%       0.06 =C2=B1 30%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.down_read.xfs_file_fsync.xfs_file_buf=
fer
> ed_aio_write
>       0.00 =C2=B1106%    +184.2%       0.01 =C2=B1 21%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.down_write.xfs_ilock.xfs_iomap_write_=
unw
> ritten
>       0.03 =C2=B1 51%     -68.6%       0.01 =C2=B1106%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.wait_for_completion_io.submit_bio_wai=
t.b
> lkdev_issue_flush
>       0.04 =C2=B1 14%     -48.6%       0.02 =C2=B1 11%  perf-sched.sch_de=
lay.avg.ms.pr
> eempt_schedule_common._cond_resched.write_cache_pages.iomap_writepages.xf=
s_v
> m_writepages
>       0.04 =C2=B1 86%    +149.2%       0.11 =C2=B1 40%  perf-sched.sch_de=
lay.avg.ms.sc
> hedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       0.05 =C2=B1 12%     +42.5%       0.07 =C2=B1  7%  perf-sched.sch_de=
lay.avg.ms.sc
> hedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>       0.10 =C2=B1  3%     -27.7%       0.07 =C2=B1  9%  perf-sched.sch_de=
lay.avg.ms.xl
> og_wait_on_iclog.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_aio=
_wr
> ite
>       0.86 =C2=B1 19%     +73.2%       1.49 =C2=B1  6%  perf-sched.sch_de=
lay.max.ms.do
> _wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>       0.01 =C2=B1 57%    +890.2%       0.10 =C2=B1 72%  perf-sched.sch_de=
lay.max.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault.[un=
kno
> wn]
>       4.88 =C2=B1 15%     -28.8%       3.47 =C2=B1 21%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.__flush_work.xlog_cil_force_lsn.xfs_l=
og_
> force_lsn
>       0.01 =C2=B1114%    +182.6%       0.02 =C2=B1 11%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.down_write.xfs_ilock.xfs_iomap_write_=
unw
> ritten
>       0.84 =C2=B1 61%     -78.1%       0.18 =C2=B1133%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.wait_for_completion_io.submit_bio_wai=
t.b
> lkdev_issue_flush
>       2.85 =C2=B1 17%     -41.9%       1.65 =C2=B1 13%  perf-sched.sch_de=
lay.max.ms.pr
> eempt_schedule_common._cond_resched.write_cache_pages.iomap_writepages.xf=
s_v
> m_writepages
>       8.26 =C2=B1  4%     +54.9%      12.80 =C2=B1 18%  perf-sched.sch_de=
lay.max.ms.xl
> og_wait_on_iclog.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync
>       0.65 =C2=B1173%   +1994.2%      13.53 =C2=B1124%  perf-sched.wait_a=
nd_delay.avg.
> ms.preempt_schedule_common._cond_resched.mutex_lock.perf_poll.do_sys_poll
>       2.88 =C2=B1  5%      -9.7%       2.60 =C2=B1  5%  perf-sched.wait_a=
nd_delay.avg.
> ms.rwsem_down_write_slowpath.xlog_cil_push_work.process_one_work.worker_t=
hre
> ad
>     286.83 =C2=B1 46%     -57.8%     121.12 =C2=B1109%  perf-sched.wait_a=
nd_delay.avg.
> ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_w=
ait
>       1.67 =C2=B1  5%     -12.2%       1.46 =C2=B1  2%  perf-sched.wait_a=
nd_delay.avg.
> ms.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_=
aio
> _write
>       0.51 =C2=B1  3%     -10.1%       0.46 =C2=B1  3%  perf-sched.wait_a=
nd_delay.avg.
> ms.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffere=
d_a
> io_write
>      30903 =C2=B1  2%     +15.4%      35655 =C2=B1  4%  perf-sched.wait_a=
nd_delay.coun
> t.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_=
aio
> _write
>       2.50 =C2=B1173%    +310.0%      10.25 =C2=B1 18%  perf-sched.wait_a=
nd_delay.coun
> t.preempt_schedule_common._cond_resched.mutex_lock.perf_poll.do_sys_poll
>      58.00 =C2=B1 21%     +33.6%      77.50 =C2=B1 10%  perf-sched.wait_a=
nd_delay.coun
> t.rwsem_down_read_slowpath.xfs_log_commit_cil.__xfs_trans_commit.xfs_tran=
s_r
> oll
>     217.75 =C2=B1 59%     +84.5%     401.75 =C2=B1  3%  perf-sched.wait_a=
nd_delay.coun
> t.schedule_timeout.__down.down.xlog_write_iclog
>      30628 =C2=B1  2%     +15.5%      35379 =C2=B1  4%  perf-sched.wait_a=
nd_delay.coun
> t.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered=
_ai
> o_write
>     840309 =C2=B1  2%     +11.9%     940677        perf-sched.wait_and_de=
lay.coun
> t.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync
>       1122 =C2=B1 18%    +119.6%       2465 =C2=B1 18%  perf-sched.wait_a=
nd_delay.max.
> ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>       2.42 =C2=B1173%   +3507.8%      87.42 =C2=B1149%  perf-sched.wait_a=
nd_delay.max.
> ms.preempt_schedule_common._cond_resched.mutex_lock.perf_poll.do_sys_poll
>     684.48 =C2=B1148%    +611.9%       4872 =C2=B1 64%  perf-sched.wait_a=
nd_delay.max.
> ms.rwsem_down_read_slowpath.xfs_log_commit_cil.__xfs_trans_commit.xfs_iom=
ap_
> write_unwritten
>       0.92 =C2=B1 10%     +23.0%       1.13 =C2=B1  8%  perf-sched.wait_t=
ime.avg.ms.ex
> it_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_functi=
on_
> single.[unknown]
>       0.77 =C2=B1  6%     +22.0%       0.94 =C2=B1  4%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.down_read.xfs_file_fsync.xfs_file_buf=
fer
> ed_aio_write
>       0.90 =C2=B1  3%     +12.1%       1.00 =C2=B1  7%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.down_write.xfs_ilock.xfs_buffered_wri=
te_
> iomap_begin
>       1.70           +11.7%       1.90        perf-sched.wait_time.avg.ms=
.pr
> eempt_schedule_common._cond_resched.mempool_alloc.bio_alloc_bioset.blkdev=
_is
> sue_flush
>       2.13 =C2=B1 13%    +534.7%      13.53 =C2=B1124%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.mutex_lock.perf_poll.do_sys_poll
>       0.62 =C2=B1 12%     +34.5%       0.84 =C2=B1 15%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.pagecache_get_page.grab_cache_page_wr=
ite
> _begin.iomap_write_begin
>       1.54 =C2=B1  6%     -18.5%       1.25 =C2=B1  3%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.stop_one_cpu.migrate_task_to.task_num=
a_m
> igrate
>       0.92 =C2=B1  7%     -12.0%       0.81 =C2=B1  2%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.submit_bio_checks.submit_bio_noacct.s=
ubm
> it_bio
>       1.50 =C2=B1  4%     -25.8%       1.11 =C2=B1  6%  perf-sched.wait_t=
ime.avg.ms.pr
> eempt_schedule_common._cond_resched.wait_for_completion.stop_two_cpus.mig=
rat
> e_swap
>       1.30 =C2=B1 10%     -21.6%       1.02 =C2=B1 14%  perf-sched.wait_t=
ime.avg.ms.rw
> sem_down_write_slowpath.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_=
hwf
> rame
>       2.86 =C2=B1  5%      -9.9%       2.58 =C2=B1  4%  perf-sched.wait_t=
ime.avg.ms.rw
> sem_down_write_slowpath.xlog_cil_push_work.process_one_work.worker_thread
>     286.79 =C2=B1 46%     -57.8%     121.01 =C2=B1110%  perf-sched.wait_t=
ime.avg.ms.sc
> hedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       0.01 =C2=B1 21%     -64.6%       0.00 =C2=B1100%  perf-sched.wait_t=
ime.avg.ms.sc
> hedule_timeout.wait_for_completion.stop_one_cpu.__set_cpus_allowed_ptr
>       1.66 =C2=B1  5%     -12.2%       1.46 =C2=B1  2%  perf-sched.wait_t=
ime.avg.ms.xl
> og_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_aio_w=
rit
> e
>       1122 =C2=B1 18%    +119.7%       2465 =C2=B1 18%  perf-sched.wait_t=
ime.max.ms.do
> _task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>       4.79 =C2=B1  9%     -31.3%       3.29 =C2=B1 20%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.down_read.xfs_log_commit_cil.__xfs_tr=
ans
> _commit
>      15.13 =C2=B1 29%     -49.2%       7.69 =C2=B1  5%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.find_lock_entry.shmem_getpage_gfp.shm=
em_
> write_begin
>       9.68 =C2=B1 36%     +55.5%      15.05 =C2=B1 22%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.mempool_alloc.bio_alloc_bioset.blkdev=
_is
> sue_flush
>       5.41 =C2=B1  5%     -13.5%       4.68 =C2=B1 11%  perf-sched.wait_t=
ime.max.ms.pr
> eempt_schedule_common._cond_resched.write_cache_pages.iomap_writepages.xf=
s_v
> m_writepages
>     684.47 =C2=B1148%    +611.9%       4872 =C2=B1 64%  perf-sched.wait_t=
ime.max.ms.rw
> sem_down_read_slowpath.xfs_log_commit_cil.__xfs_trans_commit.xfs_iomap_wr=
ite
> _unwritten
>       5.45 =C2=B1  8%     -12.1%       4.78 =C2=B1  5%  perf-sched.wait_t=
ime.max.ms.rw
> sem_down_read_slowpath.xfs_log_commit_cil.__xfs_trans_commit.xfs_remove
>       5.67 =C2=B1  5%     -12.3%       4.97 =C2=B1  5%  perf-sched.wait_t=
ime.max.ms.rw
> sem_down_write_slowpath.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_=
hwf
> rame
>       0.01 =C2=B1 29%     -71.7%       0.00 =C2=B1100%  perf-sched.wait_t=
ime.max.ms.sc
> hedule_timeout.wait_for_completion.stop_one_cpu.__set_cpus_allowed_ptr
>      13.59 =C2=B1  2%      -2.3       11.25        perf-profile.calltrace=
.cycles-
> pp.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsyn=
c.x
> fs_file_buffered_aio_write
>      13.17 =C2=B1  2%      -2.3       10.87        perf-profile.calltrace=
.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_qu=
eue
> .xlog_wait_on_iclog.__xfs_log_force_lsn
>      13.21 =C2=B1  2%      -2.3       10.90        perf-profile.calltrace=
.cycles-
> pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.__xfs_log_=
for
> ce_lsn.xfs_log_force_lsn
>      13.25 =C2=B1  2%      -2.3       10.95        perf-profile.calltrace=
.cycles-
> pp.remove_wait_queue.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_log_force=
_ls
> n.xfs_file_fsync
>      11.54            -1.8        9.74        perf-profile.calltrace.cycl=
es-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_qu=
eue
> .xlog_cil_force_lsn.xfs_log_force_lsn
>      11.57            -1.8        9.78        perf-profile.calltrace.cycl=
es-
> pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_cil_force_lsn.xfs_log_fo=
rce
> _lsn.xfs_file_fsync
>      11.62            -1.8        9.83        perf-profile.calltrace.cycl=
es-
> pp.remove_wait_queue.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.=
xfs
> _file_buffered_aio_write
>      30.25            -1.7       28.53        perf-profile.calltrace.cycl=
es-
> pp.secondary_startup_64_no_verify
>      30.02            -1.7       28.31        perf-profile.calltrace.cycl=
es-
> pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      30.01            -1.7       28.31        perf-profile.calltrace.cycl=
es-
> pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_veri=
fy
>      30.02            -1.7       28.32        perf-profile.calltrace.cycl=
es-
> pp.start_secondary.secondary_startup_64_no_verify
>      28.58            -1.5       27.04        perf-profile.calltrace.cycl=
es-
> pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>      28.54            -1.5       27.01        perf-profile.calltrace.cycl=
es-
> pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_seco=
nda
> ry
>      27.64            -1.4       26.24        perf-profile.calltrace.cycl=
es-
> pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
>       4.84 =C2=B1 12%      -0.6        4.26 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.ret_from_fork
>       4.84 =C2=B1 12%      -0.6        4.26 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.kthread.ret_from_fork
>       4.84 =C2=B1 12%      -0.6        4.25 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.worker_thread.kthread.ret_from_fork
>       4.04 =C2=B1  2%      -0.3        3.78        perf-profile.calltrace=
.cycles-
> pp.__flush_work.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_f=
ile
> _buffered_aio_write
>       0.63 =C2=B1  4%      -0.2        0.39 =C2=B1 57%  perf-profile.call=
trace.cycles-
> pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_i=
dle
> .cpu_startup_entry
>       0.75 =C2=B1  2%      -0.2        0.55        perf-profile.calltrace=
.cycles-
> pp.wait_for_completion.__flush_work.xlog_cil_force_lsn.xfs_log_force_lsn.=
xfs
> _file_fsync
>       0.55            -0.2        0.38 =C2=B1 57%  perf-profile.calltrace=
.cycles-
> pp.try_to_wake_up.swake_up_locked.complete.process_one_work.worker_thread
>       1.07            -0.1        0.93 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.xlog_cil_push_work.process_one_work.worker_thread.kthread.ret_from_fork
>       0.68 =C2=B1  8%      -0.1        0.57 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.osq_lock.rwsem_optimistic_spin.rwsem_down_read_slowpath.xfs_log_commit=
_ci
> l.__xfs_trans_commit
>       0.75 =C2=B1  8%      -0.1        0.64 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.rwsem_down_read_slowpath.xfs_log_commit_cil.__xfs_trans_commit.xfs_vn_=
upd
> ate_time.file_update_time
>       0.72 =C2=B1  8%      -0.1        0.60 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.rwsem_optimistic_spin.rwsem_down_read_slowpath.xfs_log_commit_cil.__xf=
s_t
> rans_commit.xfs_vn_update_time
>       0.76 =C2=B1  4%      -0.1        0.69        perf-profile.calltrace=
.cycles-
> pp.xlog_state_do_callback.xlog_ioend_work.process_one_work.worker_thread.=
kth
> read
>       0.60            -0.1        0.55        perf-profile.calltrace.cycl=
es-
> pp.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write.new_=
syn
> c_write.vfs_write
>       0.56            -0.1        0.51        perf-profile.calltrace.cycl=
es-
> pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.start_seco=
nda
> ry.secondary_startup_64_no_verify
>       0.60            -0.1        0.55        perf-profile.calltrace.cycl=
es-
> pp.iomap_file_buffered_write.xfs_file_buffered_aio_write.new_sync_write.v=
fs_
> write.ksys_write
>       0.60            -0.0        0.56        perf-profile.calltrace.cycl=
es-
> pp.complete.process_one_work.worker_thread.kthread.ret_from_fork
>       0.59            -0.0        0.55        perf-profile.calltrace.cycl=
es-
> pp.swake_up_locked.complete.process_one_work.worker_thread.kthread
>       0.68 =C2=B1  9%      +0.1        0.79 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.sb_mark_inode_=
wri
> teback.__test_set_page_writeback.iomap_writepage_map
>       0.76 =C2=B1  9%      +0.1        0.88 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.sb_mark_inode_writeback.__test_set_page_writeback.iomap_writepage_map.=
wri
> te_cache_pages.iomap_writepages
>       0.72 =C2=B1 10%      +0.1        0.84 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock_irqsave.sb_mark_inode_writeback.__test_set_page_writeba=
ck.
> iomap_writepage_map.write_cache_pages
>       0.64 =C2=B1  9%      +0.1        0.78 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.sb_clear_inode=
_wr
> iteback.test_clear_page_writeback.end_page_writeback
>       0.78 =C2=B1  8%      +0.1        0.92 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.iomap_finish_ioend.brd_submit_bio.submit_bio_noacct.submit_bio.iomap_s=
ubm
> it_ioend
>       0.67 =C2=B1  8%      +0.1        0.81 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock_irqsave.sb_clear_inode_writeback.test_clear_page_writeb=
ack
> .end_page_writeback.iomap_finish_ioend
>       0.76 =C2=B1  7%      +0.1        0.90 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.end_page_writeback.iomap_finish_ioend.brd_submit_bio.submit_bio_noacct=
.su
> bmit_bio
>       0.71 =C2=B1  7%      +0.1        0.85 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.sb_clear_inode_writeback.test_clear_page_writeback.end_page_writeback.=
iom
> ap_finish_ioend.brd_submit_bio
>       0.75 =C2=B1  7%      +0.1        0.89 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.test_clear_page_writeback.end_page_writeback.iomap_finish_ioend.brd_su=
bmi
> t_bio.submit_bio_noacct
>       0.65 =C2=B1 11%      +0.2        0.85 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.__xfs_log_force_lsn.xf=
s_f
> ile_fsync.xfs_file_buffered_aio_write
>       0.65 =C2=B1 11%      +0.2        0.85 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_ai=
o_w
> rite.new_sync_write
>       1.01 =C2=B1  9%      +0.2        1.23 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_aio_write.new_syn=
c_w
> rite.vfs_write
>      34.06 =C2=B1  2%      +2.2       36.26        perf-profile.calltrace=
.cycles-
> pp.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_=
aio
> _write.new_sync_write
>      64.47            +2.3       66.80        perf-profile.calltrace.cycl=
es-
> pp.write
>      64.35            +2.3       66.68        perf-profile.calltrace.cycl=
es-
> pp.entry_SYSCALL_64_after_hwframe.write
>      64.28            +2.3       66.63        perf-profile.calltrace.cycl=
es-
> pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      64.27            +2.3       66.62        perf-profile.calltrace.cycl=
es-
> pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      64.28            +2.3       66.63        perf-profile.calltrace.cycl=
es-
> pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      64.20            +2.4       66.55        perf-profile.calltrace.cycl=
es-
> pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_aft=
er_
> hwframe
>      55.61            +2.4       57.96        perf-profile.calltrace.cycl=
es-
> pp.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_aio_write.new_sync_=
wri
> te.vfs_write
>      64.17            +2.4       66.53        perf-profile.calltrace.cycl=
es-
> pp.xfs_file_buffered_aio_write.new_sync_write.vfs_write.ksys_write.do_sys=
cal
> l_64
>       7.53 =C2=B1  8%      +2.4        9.96 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.__xfs_log_force_lsn.xf=
s_l
> og_force_lsn.xfs_file_fsync
>       7.56 =C2=B1  8%      +2.4       10.01 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xf=
s_f
> ile_buffered_aio_write
>      59.26            +2.7       61.97        perf-profile.calltrace.cycl=
es-
> pp.xfs_file_fsync.xfs_file_buffered_aio_write.new_sync_write.vfs_write.ks=
ys_
> write
>      17.96 =C2=B1  5%      +4.4       22.31 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs=
_fi
> le_buffered_aio_write
>      17.82 =C2=B1  5%      +4.4       22.18 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.xlog_cil_force_lsn.xfs=
_lo
> g_force_lsn.xfs_file_fsync
>      25.50 =C2=B1  2%      -4.0       21.47        perf-profile.children.=
cycles-p
> p.remove_wait_queue
>      27.55 =C2=B1  2%      -3.8       23.74        perf-profile.children.=
cycles-p
> p._raw_spin_lock_irqsave
>      13.95 =C2=B1  2%      -2.3       11.63        perf-profile.children.=
cycles-p
> p.xlog_wait_on_iclog
>      30.25            -1.7       28.53        perf-profile.children.cycle=
s-p
> p.secondary_startup_64_no_verify
>      30.25            -1.7       28.53        perf-profile.children.cycle=
s-p
> p.cpu_startup_entry
>      30.25            -1.7       28.53        perf-profile.children.cycle=
s-p
> p.do_idle
>      30.02            -1.7       28.32        perf-profile.children.cycle=
s-p
> p.start_secondary
>      28.81            -1.6       27.24        perf-profile.children.cycle=
s-p
> p.cpuidle_enter
>      28.81            -1.6       27.24        perf-profile.children.cycle=
s-p
> p.cpuidle_enter_state
>      27.86            -1.4       26.44        perf-profile.children.cycle=
s-p
> p.intel_idle
>       4.84 =C2=B1 12%      -0.6        4.26 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.ret_from_fork
>       4.84 =C2=B1 12%      -0.6        4.26 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.kthread
>       4.84 =C2=B1 12%      -0.6        4.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.worker_thread
>       1.44            -0.4        1.09        perf-profile.children.cycle=
s-p
> p.__schedule
>       1.20            -0.3        0.88 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.schedule
>       4.05 =C2=B1  2%      -0.3        3.78        perf-profile.children.=
cycles-p
> p.__flush_work
>       0.39            -0.2        0.15 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.pick_next_task_fair
>       0.27            -0.2        0.05        perf-profile.children.cycle=
s-p
> p.load_balance
>       0.75 =C2=B1  2%      -0.2        0.55        perf-profile.children.=
cycles-p
> p.wait_for_completion
>       1.47            -0.2        1.27        perf-profile.children.cycle=
s-p
> p.try_to_wake_up
>       0.63 =C2=B1  2%      -0.2        0.43        perf-profile.children.=
cycles-p
> p.schedule_timeout
>       1.07            -0.1        0.93 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.xlog_cil_push_work
>       0.80 =C2=B1  2%      -0.1        0.67        perf-profile.children.=
cycles-p
> p.__wake_up_common
>       0.93 =C2=B1  2%      -0.1        0.80        perf-profile.children.=
cycles-p
> p.__wake_up_common_lock
>       0.79 =C2=B1  7%      -0.1        0.68 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.rwsem_down_read_slowpath
>       0.78 =C2=B1  7%      -0.1        0.67 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.rwsem_optimistic_spin
>       0.72 =C2=B1  8%      -0.1        0.60 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.osq_lock
>       0.49            -0.1        0.38        perf-profile.children.cycle=
s-p
> p.ttwu_do_activate
>       0.48            -0.1        0.38        perf-profile.children.cycle=
s-p
> p.enqueue_task_fair
>       0.55 =C2=B1  3%      -0.1        0.44        perf-profile.children.=
cycles-p
> p.xlog_write
>       1.04 =C2=B1  2%      -0.1        0.94        perf-profile.children.=
cycles-p
> p.asm_sysvec_apic_timer_interrupt
>       0.95 =C2=B1  2%      -0.1        0.86        perf-profile.children.=
cycles-p
> p.sysvec_apic_timer_interrupt
>       0.38            -0.1        0.30 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.enqueue_entity
>       0.49 =C2=B1  3%      -0.1        0.41        perf-profile.children.=
cycles-p
> p.xlog_state_clean_iclog
>       0.42            -0.1        0.34 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.update_load_avg
>       0.38            -0.1        0.31        perf-profile.children.cycle=
s-p
> p.select_task_rq_fair
>       0.76 =C2=B1  4%      -0.1        0.69        perf-profile.children.=
cycles-p
> p.xlog_state_do_callback
>       0.46            -0.1        0.40 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.dequeue_task_fair
>       0.92            -0.1        0.87        perf-profile.children.cycle=
s-p
> p.asm_call_sysvec_on_stack
>       0.47            -0.1        0.41 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.sched_ttwu_pending
>       0.22 =C2=B1  4%      -0.1        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.xlog_state_get_iclog_space
>       0.60            -0.1        0.55        perf-profile.children.cycle=
s-p
> p.iomap_apply
>       0.57            -0.1        0.52 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.flush_smp_call_function_from_idle
>       0.60            -0.1        0.55        perf-profile.children.cycle=
s-p
> p.iomap_file_buffered_write
>       0.39            -0.0        0.34 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.dequeue_entity
>       0.47 =C2=B1  3%      -0.0        0.42        perf-profile.children.=
cycles-p
> p.brd_do_bvec
>       0.59            -0.0        0.55        perf-profile.children.cycle=
s-p
> p.swake_up_locked
>       0.61            -0.0        0.56        perf-profile.children.cycle=
s-p
> p.complete
>       0.65 =C2=B1  2%      -0.0        0.61 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.__sysvec_apic_timer_interrupt
>       0.64 =C2=B1  2%      -0.0        0.60 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.hrtimer_interrupt
>       0.51            -0.0        0.47        perf-profile.children.cycle=
s-p
> p.iomap_write_actor
>       0.21 =C2=B1  2%      -0.0        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.xfs_bmapi_write
>       0.34 =C2=B1  2%      -0.0        0.29        perf-profile.children.=
cycles-p
> p.schedule_idle
>       0.23 =C2=B1  2%      -0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_unlock_irqrestore
>       0.18 =C2=B1  2%      -0.0        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xfs_bmap_add_extent_unwritten_real
>       0.34 =C2=B1  2%      -0.0        0.30        perf-profile.children.=
cycles-p
> p.menu_select
>       0.24 =C2=B1  3%      -0.0        0.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.update_curr
>       0.19 =C2=B1  3%      -0.0        0.15 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xfs_bmapi_convert_unwritten
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.update_rq_clock
>       0.28            -0.0        0.24        perf-profile.children.cycle=
s-p
> p.select_idle_sibling
>       0.10 =C2=B1  4%      -0.0        0.07 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.__update_load_avg_cfs_rq
>       0.40            -0.0        0.37 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.__hrtimer_run_queues
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.set_task_cpu
>       0.19 =C2=B1  4%      -0.0        0.16 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.irq_exit_rcu
>       0.06 =C2=B1  6%      -0.0        0.04 =C2=B1 57%  perf-profile.chil=
dren.cycles-p
> p.io_schedule
>       0.14 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.__smp_call_single_queue
>       0.14 =C2=B1  6%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.llist_add_batch
>       0.07 =C2=B1  5%      -0.0        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.xfs_end_bio
>       0.29            -0.0        0.27 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.tick_sched_handle
>       0.19 =C2=B1  2%      -0.0        0.17 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.poll_idle
>       0.10 =C2=B1  4%      -0.0        0.08        perf-profile.children.=
cycles-p
> p.find_get_entry
>       0.07            -0.0        0.05 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.queue_work_on
>       0.07 =C2=B1  6%      -0.0        0.05        perf-profile.children.=
cycles-p
> p.__queue_work
>       0.07 =C2=B1  6%      -0.0        0.05        perf-profile.children.=
cycles-p
> p.tick_nohz_idle_exit
>       0.14 =C2=B1  3%      -0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xlog_state_release_iclog
>       0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.migrate_task_rq_fair
>       0.07 =C2=B1  7%      -0.0        0.05        perf-profile.children.=
cycles-p
> p.wake_page_function
>       0.09            -0.0        0.08 =C2=B1  6%  perf-profile.children.=
cycles-p
> p.xfs_btree_lookup
>       0.20 =C2=B1  2%      -0.0        0.19        perf-profile.children.=
cycles-p
> p.iomap_write_begin
>       0.14 =C2=B1  3%      -0.0        0.13        perf-profile.children.=
cycles-p
> p.pagecache_get_page
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.wake_up_page_bit
>       0.07            -0.0        0.06 =C2=B1  7%  perf-profile.children.=
cycles-p
> p.iov_iter_copy_from_user_atomic
>       0.12 =C2=B1  4%      -0.0        0.11 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.down_read
>       0.15 =C2=B1  2%      -0.0        0.14        perf-profile.children.=
cycles-p
> p.grab_cache_page_write_begin
>       0.07            -0.0        0.06        perf-profile.children.cycle=
s-p
> p.llseek
>       0.09            -0.0        0.08        perf-profile.children.cycle=
s-p
> p.set_next_entity
>       0.06            -0.0        0.05        perf-profile.children.cycle=
s-p
> p.xfs_btree_lookup_get_block
>       0.06            -0.0        0.05        perf-profile.children.cycle=
s-p
> p.copyin
>       0.11 =C2=B1  4%      +0.0        0.12        perf-profile.children.=
cycles-p
> p.__sysvec_call_function_single
>       0.76 =C2=B1  9%      +0.1        0.88 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.sb_mark_inode_writeback
>       0.91 =C2=B1  8%      +0.1        1.05 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sb_clear_inode_writeback
>       0.98 =C2=B1  8%      +0.1        1.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.test_clear_page_writeback
>       0.98 =C2=B1  8%      +0.1        1.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.end_page_writeback
>      34.06 =C2=B1  2%      +2.2       36.27        perf-profile.children.=
cycles-p
> p.xlog_cil_force_lsn
>      64.50            +2.3       66.82        perf-profile.children.cycle=
s-p
> p.write
>      64.57            +2.3       66.91        perf-profile.children.cycle=
s-p
> p.entry_SYSCALL_64_after_hwframe
>      64.43            +2.3       66.78        perf-profile.children.cycle=
s-p
> p.do_syscall_64
>      64.29            +2.3       66.63        perf-profile.children.cycle=
s-p
> p.ksys_write
>      64.21            +2.3       66.55        perf-profile.children.cycle=
s-p
> p.new_sync_write
>      64.28            +2.3       66.63        perf-profile.children.cycle=
s-p
> p.vfs_write
>      55.61            +2.4       57.96        perf-profile.children.cycle=
s-p
> p.xfs_log_force_lsn
>      64.17            +2.4       66.53        perf-profile.children.cycle=
s-p
> p.xfs_file_buffered_aio_write
>      60.13            +2.6       62.78        perf-profile.children.cycle=
s-p
> p.native_queued_spin_lock_slowpath
>      59.26            +2.7       61.98        perf-profile.children.cycle=
s-p
> p.xfs_file_fsync
>      30.48 =C2=B1  4%      +6.5       36.93        perf-profile.children.=
cycles-p
> p._raw_spin_lock
>      27.85            -1.4       26.44        perf-profile.self.cycles-pp=
.in
> tel_idle
>       0.72 =C2=B1  7%      -0.1        0.60 =C2=B1  4%  perf-profile.self=
.cycles-pp.os
> q_lock
>       0.21 =C2=B1  2%      -0.0        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp.up
> date_load_avg
>       0.10 =C2=B1  4%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.up
> date_rq_clock
>       0.38 =C2=B1  3%      -0.0        0.35        perf-profile.self.cycl=
es-pp.br
> d_do_bvec
>       0.10 =C2=B1  4%      -0.0        0.07 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> update_load_avg_cfs_rq
>       0.09 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.up
> date_curr
>       0.51            -0.0        0.49        perf-profile.self.cycles-pp=
._r
> aw_spin_lock
>       0.07 =C2=B1  5%      -0.0        0.05        perf-profile.self.cycl=
es-pp.en
> queue_task_fair
>       0.26 =C2=B1  3%      -0.0        0.24        perf-profile.self.cycl=
es-pp._r
> aw_spin_lock_irq
>       0.20 =C2=B1  3%      -0.0        0.18 =C2=B1  3%  perf-profile.self=
.cycles-pp.__
> schedule
>       0.14 =C2=B1  6%      -0.0        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.ll
> ist_add_batch
>       0.15 =C2=B1  2%      -0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.me
> nu_select
>       0.19 =C2=B1  2%      -0.0        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.po
> ll_idle
>       0.09 =C2=B1  4%      -0.0        0.08        perf-profile.self.cycl=
es-pp._r
> aw_spin_unlock_irqrestore
>       0.08 =C2=B1  5%      -0.0        0.07        perf-profile.self.cycl=
es-pp.pr
> ocess_one_work
>       0.06 =C2=B1  6%      -0.0        0.05        perf-profile.self.cycl=
es-pp.en
> queue_entity
>       0.08            -0.0        0.07        perf-profile.self.cycles-pp=
.tr
> y_to_wake_up
>      59.84            +2.6       62.43        perf-profile.self.cycles-pp=
.na
> tive_queued_spin_lock_slowpath
>    9100173            -4.5%    8687790        interrupts.CAL:Function_cal=
l_i
> nterrupts
>       4809           +15.3%       5544        interrupts.CPU0.NMI:Non-mas=
kab
> le_interrupts
>       4809           +15.3%       5544        interrupts.CPU0.PMI:Perform=
anc
> e_monitoring_interrupts
>       4829           +14.6%       5536        interrupts.CPU1.NMI:Non-mas=
kab
> le_interrupts
>       4829           +14.6%       5536        interrupts.CPU1.PMI:Perform=
anc
> e_monitoring_interrupts
>       4182 =C2=B1  3%     -18.2%       3420 =C2=B1  4%  interrupts.CPU1.R=
ES:Rescheduli
> ng_interrupts
>       3613           -13.7%       3116 =C2=B1  6%  interrupts.CPU10.RES:R=
eschedul
> ing_interrupts
>       4271 =C2=B1 24%     +30.0%       5554        interrupts.CPU100.NMI:=
Non-mask
> able_interrupts
>       4271 =C2=B1 24%     +30.0%       5554        interrupts.CPU100.PMI:=
Performa
> nce_monitoring_interrupts
>       3658 =C2=B1  3%     -23.5%       2799 =C2=B1  3%  interrupts.CPU104=
.RES:Reschedu
> ling_interrupts
>       3738           -17.9%       3070 =C2=B1  2%  interrupts.CPU105.RES:=
Reschedu
> ling_interrupts
>       3695 =C2=B1  2%     -22.0%       2881        interrupts.CPU107.RES:=
Reschedu
> ling_interrupts
>       3643 =C2=B1 33%     +51.6%       5523        interrupts.CPU108.NMI:=
Non-mask
> able_interrupts
>       3643 =C2=B1 33%     +51.6%       5523        interrupts.CPU108.PMI:=
Performa
> nce_monitoring_interrupts
>       3630           -26.8%       2657 =C2=B1  2%  interrupts.CPU108.RES:=
Reschedu
> ling_interrupts
>       4236 =C2=B1 24%     +30.0%       5507        interrupts.CPU109.NMI:=
Non-mask
> able_interrupts
>       4236 =C2=B1 24%     +30.0%       5507        interrupts.CPU109.PMI:=
Performa
> nce_monitoring_interrupts
>       4187 =C2=B1  6%     -26.6%       3073        interrupts.CPU109.RES:=
Reschedu
> ling_interrupts
>       3720 =C2=B1  3%     -12.2%       3266 =C2=B1  8%  interrupts.CPU11.=
RES:Reschedul
> ing_interrupts
>       4268 =C2=B1 24%     +28.5%       5485        interrupts.CPU110.NMI:=
Non-mask
> able_interrupts
>       4268 =C2=B1 24%     +28.5%       5485        interrupts.CPU110.PMI:=
Performa
> nce_monitoring_interrupts
>       3495 =C2=B1  3%     -22.6%       2707 =C2=B1  4%  interrupts.CPU110=
.RES:Reschedu
> ling_interrupts
>       4256 =C2=B1 24%     +29.4%       5510        interrupts.CPU111.NMI:=
Non-mask
> able_interrupts
>       4256 =C2=B1 24%     +29.4%       5510        interrupts.CPU111.PMI:=
Performa
> nce_monitoring_interrupts
>       3599 =C2=B1  3%     -24.8%       2707 =C2=B1  4%  interrupts.CPU111=
.RES:Reschedu
> ling_interrupts
>       4265 =C2=B1  4%     -23.4%       3267 =C2=B1 16%  interrupts.CPU112=
.RES:Reschedu
> ling_interrupts
>       3857 =C2=B1  4%     -24.5%       2911 =C2=B1  5%  interrupts.CPU113=
.RES:Reschedu
> ling_interrupts
>       3573           -15.6%       3017 =C2=B1 10%  interrupts.CPU114.RES:=
Reschedu
> ling_interrupts
>       4266 =C2=B1 24%     +29.1%       5508        interrupts.CPU115.NMI:=
Non-mask
> able_interrupts
>       4266 =C2=B1 24%     +29.1%       5508        interrupts.CPU115.PMI:=
Performa
> nce_monitoring_interrupts
>       4251 =C2=B1 24%     +29.4%       5502        interrupts.CPU116.NMI:=
Non-mask
> able_interrupts
>       4251 =C2=B1 24%     +29.4%       5502        interrupts.CPU116.PMI:=
Performa
> nce_monitoring_interrupts
>       3588 =C2=B1  3%     -14.6%       3065 =C2=B1 10%  interrupts.CPU116=
.RES:Reschedu
> ling_interrupts
>       4239 =C2=B1 24%     +30.1%       5517        interrupts.CPU117.NMI:=
Non-mask
> able_interrupts
>       4239 =C2=B1 24%     +30.1%       5517        interrupts.CPU117.PMI:=
Performa
> nce_monitoring_interrupts
>       3942 =C2=B1  4%     -15.8%       3319 =C2=B1 12%  interrupts.CPU117=
.RES:Reschedu
> ling_interrupts
>       4290 =C2=B1 25%     +28.3%       5506        interrupts.CPU118.NMI:=
Non-mask
> able_interrupts
>       4290 =C2=B1 25%     +28.3%       5506        interrupts.CPU118.PMI:=
Performa
> nce_monitoring_interrupts
>       4274 =C2=B1 24%     +28.5%       5494        interrupts.CPU119.NMI:=
Non-mask
> able_interrupts
>       4274 =C2=B1 24%     +28.5%       5494        interrupts.CPU119.PMI:=
Performa
> nce_monitoring_interrupts
>       3667 =C2=B1  3%     -14.9%       3120 =C2=B1  9%  interrupts.CPU12.=
RES:Reschedul
> ing_interrupts
>       4267 =C2=B1 24%     +28.8%       5496        interrupts.CPU120.NMI:=
Non-mask
> able_interrupts
>       4267 =C2=B1 24%     +28.8%       5496        interrupts.CPU120.PMI:=
Performa
> nce_monitoring_interrupts
>       4294 =C2=B1 25%     +28.2%       5505        interrupts.CPU121.NMI:=
Non-mask
> able_interrupts
>       4294 =C2=B1 25%     +28.2%       5505        interrupts.CPU121.PMI:=
Performa
> nce_monitoring_interrupts
>       4263 =C2=B1 24%     +29.6%       5526        interrupts.CPU122.NMI:=
Non-mask
> able_interrupts
>       4263 =C2=B1 24%     +29.6%       5526        interrupts.CPU122.PMI:=
Performa
> nce_monitoring_interrupts
>       3826 =C2=B1  4%     -16.4%       3198 =C2=B1  3%  interrupts.CPU122=
.RES:Reschedu
> ling_interrupts
>       4261 =C2=B1 24%     +29.1%       5500        interrupts.CPU123.NMI:=
Non-mask
> able_interrupts
>       4261 =C2=B1 24%     +29.1%       5500        interrupts.CPU123.PMI:=
Performa
> nce_monitoring_interrupts
>       3786           -19.9%       3033        interrupts.CPU123.RES:Resch=
edu
> ling_interrupts
>       4281 =C2=B1 24%     +28.9%       5519        interrupts.CPU124.NMI:=
Non-mask
> able_interrupts
>       4281 =C2=B1 24%     +28.9%       5519        interrupts.CPU124.PMI:=
Performa
> nce_monitoring_interrupts
>       3531 =C2=B1  3%     -23.2%       2712 =C2=B1  4%  interrupts.CPU124=
.RES:Reschedu
> ling_interrupts
>       3905 =C2=B1  7%     -17.8%       3209 =C2=B1  6%  interrupts.CPU125=
.RES:Reschedu
> ling_interrupts
>       4276 =C2=B1 24%     +30.5%       5580        interrupts.CPU126.NMI:=
Non-mask
> able_interrupts
>       4276 =C2=B1 24%     +30.5%       5580        interrupts.CPU126.PMI:=
Performa
> nce_monitoring_interrupts
>       3593 =C2=B1  3%     -22.6%       2782 =C2=B1  4%  interrupts.CPU126=
.RES:Reschedu
> ling_interrupts
>       3556 =C2=B1  4%     -13.8%       3065 =C2=B1  5%  interrupts.CPU127=
.RES:Reschedu
> ling_interrupts
>       3580           -18.3%       2924 =C2=B1  4%  interrupts.CPU128.RES:=
Reschedu
> ling_interrupts
>       4243 =C2=B1 24%     +30.6%       5543        interrupts.CPU13.NMI:N=
on-maska
> ble_interrupts
>       4243 =C2=B1 24%     +30.6%       5543        interrupts.CPU13.PMI:P=
erforman
> ce_monitoring_interrupts
>       3595 =C2=B1  3%      -9.8%       3241 =C2=B1  5%  interrupts.CPU130=
.RES:Reschedu
> ling_interrupts
>       4839           +14.8%       5557        interrupts.CPU131.NMI:Non-m=
ask
> able_interrupts
>       4839           +14.8%       5557        interrupts.CPU131.PMI:Perfo=
rma
> nce_monitoring_interrupts
>       3622 =C2=B1  3%     -15.3%       3067 =C2=B1  5%  interrupts.CPU131=
.RES:Reschedu
> ling_interrupts
>       4838           +15.1%       5567        interrupts.CPU132.NMI:Non-m=
ask
> able_interrupts
>       4838           +15.1%       5567        interrupts.CPU132.PMI:Perfo=
rma
> nce_monitoring_interrupts
>       3531 =C2=B1  2%     -16.9%       2933 =C2=B1  4%  interrupts.CPU132=
.RES:Reschedu
> ling_interrupts
>       4831           +14.9%       5552        interrupts.CPU133.NMI:Non-m=
ask
> able_interrupts
>       4831           +14.9%       5552        interrupts.CPU133.PMI:Perfo=
rma
> nce_monitoring_interrupts
>       3597 =C2=B1  2%     -18.1%       2945 =C2=B1  5%  interrupts.CPU133=
.RES:Reschedu
> ling_interrupts
>       3821 =C2=B1  4%     -14.3%       3276 =C2=B1  7%  interrupts.CPU134=
.RES:Reschedu
> ling_interrupts
>       3637 =C2=B1  2%     -14.8%       3098 =C2=B1 10%  interrupts.CPU135=
.RES:Reschedu
> ling_interrupts
>       3487 =C2=B1  3%     -21.1%       2751 =C2=B1  5%  interrupts.CPU136=
.RES:Reschedu
> ling_interrupts
>       3411           -21.0%       2695 =C2=B1  3%  interrupts.CPU137.RES:=
Reschedu
> ling_interrupts
>       4254 =C2=B1 24%     +30.6%       5554        interrupts.CPU138.NMI:=
Non-mask
> able_interrupts
>       4254 =C2=B1 24%     +30.6%       5554        interrupts.CPU138.PMI:=
Performa
> nce_monitoring_interrupts
>       3541 =C2=B1  2%     -12.9%       3084 =C2=B1  6%  interrupts.CPU138=
.RES:Reschedu
> ling_interrupts
>       3431 =C2=B1  2%     -16.7%       2857 =C2=B1  3%  interrupts.CPU139=
.RES:Reschedu
> ling_interrupts
>       4240 =C2=B1 24%     +31.0%       5553        interrupts.CPU142.NMI:=
Non-mask
> able_interrupts
>       4240 =C2=B1 24%     +31.0%       5553        interrupts.CPU142.PMI:=
Performa
> nce_monitoring_interrupts
>       4840           +14.1%       5525        interrupts.CPU15.NMI:Non-ma=
ska
> ble_interrupts
>       4840           +14.1%       5525        interrupts.CPU15.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3575           -15.4%       3024 =C2=B1  7%  interrupts.CPU15.RES:R=
eschedul
> ing_interrupts
>       4857           +13.7%       5522        interrupts.CPU16.NMI:Non-ma=
ska
> ble_interrupts
>       4857           +13.7%       5522        interrupts.CPU16.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3557 =C2=B1  4%     -16.2%       2981 =C2=B1  2%  interrupts.CPU16.=
RES:Reschedul
> ing_interrupts
>       4848           +14.1%       5532        interrupts.CPU17.NMI:Non-ma=
ska
> ble_interrupts
>       4848           +14.1%       5532        interrupts.CPU17.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3726 =C2=B1  2%     -13.0%       3242 =C2=B1  2%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>       3745 =C2=B1  2%     -20.6%       2975 =C2=B1  4%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>       3807 =C2=B1  2%     -17.4%       3143        interrupts.CPU20.RES:R=
eschedul
> ing_interrupts
>      64.75 =C2=B1 49%     -52.5%      30.75 =C2=B1 40%  interrupts.CPU20.=
TLB:TLB_shoot
> downs
>       3692 =C2=B1  4%     -16.4%       3087 =C2=B1  2%  interrupts.CPU22.=
RES:Reschedul
> ing_interrupts
>       3732 =C2=B1  3%     -18.7%       3032 =C2=B1  4%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>       3696 =C2=B1  2%     -19.6%       2973        interrupts.CPU24.RES:R=
eschedul
> ing_interrupts
>       3770 =C2=B1  2%     -18.1%       3089 =C2=B1  3%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>       3892            -9.7%       3516 =C2=B1  6%  interrupts.CPU26.RES:R=
eschedul
> ing_interrupts
>       4861           +14.2%       5552        interrupts.CPU27.NMI:Non-ma=
ska
> ble_interrupts
>       4861           +14.2%       5552        interrupts.CPU27.PMI:Perfor=
man
> ce_monitoring_interrupts
>       4911           +13.0%       5549        interrupts.CPU28.NMI:Non-ma=
ska
> ble_interrupts
>       4911           +13.0%       5549        interrupts.CPU28.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3735           -16.8%       3106 =C2=B1  4%  interrupts.CPU28.RES:R=
eschedul
> ing_interrupts
>       3835           -21.2%       3022        interrupts.CPU29.RES:Resche=
dul
> ing_interrupts
>       4226 =C2=B1 24%     +31.1%       5542        interrupts.CPU3.NMI:No=
n-maskab
> le_interrupts
>       4226 =C2=B1 24%     +31.1%       5542        interrupts.CPU3.PMI:Pe=
rformanc
> e_monitoring_interrupts
>       4879           +13.6%       5543        interrupts.CPU31.NMI:Non-ma=
ska
> ble_interrupts
>       4879           +13.6%       5543        interrupts.CPU31.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3722 =C2=B1  2%     -17.9%       3057        interrupts.CPU31.RES:R=
eschedul
> ing_interrupts
>       3620 =C2=B1  2%     -18.2%       2961 =C2=B1  3%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>       4887           +13.7%       5558        interrupts.CPU33.NMI:Non-ma=
ska
> ble_interrupts
>       4887           +13.7%       5558        interrupts.CPU33.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3735           -16.8%       3106        interrupts.CPU33.RES:Resche=
dul
> ing_interrupts
>       4869           +14.3%       5565        interrupts.CPU34.NMI:Non-ma=
ska
> ble_interrupts
>       4869           +14.3%       5565        interrupts.CPU34.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3639 =C2=B1  2%     -17.3%       3011 =C2=B1  2%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>       4266 =C2=B1 24%     +30.6%       5574        interrupts.CPU35.NMI:N=
on-maska
> ble_interrupts
>       4266 =C2=B1 24%     +30.6%       5574        interrupts.CPU35.PMI:P=
erforman
> ce_monitoring_interrupts
>       3658 =C2=B1 34%     +50.0%       5485        interrupts.CPU36.NMI:N=
on-maska
> ble_interrupts
>       3658 =C2=B1 34%     +50.0%       5485        interrupts.CPU36.PMI:P=
erforman
> ce_monitoring_interrupts
>       3679 =C2=B1  4%     -21.9%       2872 =C2=B1  3%  interrupts.CPU36.=
RES:Reschedul
> ing_interrupts
>       4249 =C2=B1 25%     +29.1%       5486        interrupts.CPU37.NMI:N=
on-maska
> ble_interrupts
>       4249 =C2=B1 25%     +29.1%       5486        interrupts.CPU37.PMI:P=
erforman
> ce_monitoring_interrupts
>       3919 =C2=B1  3%     -22.8%       3026 =C2=B1  5%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>      84.25 =C2=B1 26%     -42.1%      48.75 =C2=B1 51%  interrupts.CPU38.=
TLB:TLB_shoot
> downs
>       3691 =C2=B1  2%     -20.6%       2929 =C2=B1  3%  interrupts.CPU39.=
RES:Reschedul
> ing_interrupts
>       3763 =C2=B1  3%     -12.7%       3284 =C2=B1  9%  interrupts.CPU4.R=
ES:Rescheduli
> ng_interrupts
>       3018 =C2=B1 34%     +58.3%       4776 =C2=B1 24%  interrupts.CPU40.=
NMI:Non-maska
> ble_interrupts
>       3018 =C2=B1 34%     +58.3%       4776 =C2=B1 24%  interrupts.CPU40.=
PMI:Performan
> ce_monitoring_interrupts
>       3022 =C2=B1 34%     +58.3%       4784 =C2=B1 24%  interrupts.CPU41.=
NMI:Non-maska
> ble_interrupts
>       3022 =C2=B1 34%     +58.3%       4784 =C2=B1 24%  interrupts.CPU41.=
PMI:Performan
> ce_monitoring_interrupts
>       4236 =C2=B1  6%     -16.6%       3533 =C2=B1 12%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>       3016 =C2=B1 34%     +58.2%       4771 =C2=B1 24%  interrupts.CPU42.=
NMI:Non-maska
> ble_interrupts
>       3016 =C2=B1 34%     +58.2%       4771 =C2=B1 24%  interrupts.CPU42.=
PMI:Performan
> ce_monitoring_interrupts
>       3805 =C2=B1  2%     -24.6%       2869 =C2=B1  2%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>       3759 =C2=B1  3%     -20.3%       2994        interrupts.CPU43.RES:R=
eschedul
> ing_interrupts
>       3711           -23.2%       2849        interrupts.CPU44.RES:Resche=
dul
> ing_interrupts
>       3631           -21.9%       2835        interrupts.CPU45.RES:Resche=
dul
> ing_interrupts
>       3767 =C2=B1  2%     -21.5%       2955 =C2=B1  2%  interrupts.CPU46.=
RES:Reschedul
> ing_interrupts
>       3888 =C2=B1  2%     -20.7%       3084 =C2=B1  2%  interrupts.CPU47.=
RES:Reschedul
> ing_interrupts
>       3714 =C2=B1  3%     -21.2%       2928 =C2=B1  3%  interrupts.CPU48.=
RES:Reschedul
> ing_interrupts
>       3837           -15.2%       3253 =C2=B1  4%  interrupts.CPU49.RES:R=
eschedul
> ing_interrupts
>       4847           +14.4%       5546        interrupts.CPU5.NMI:Non-mas=
kab
> le_interrupts
>       4847           +14.4%       5546        interrupts.CPU5.PMI:Perform=
anc
> e_monitoring_interrupts
>       3808           -17.2%       3154 =C2=B1  5%  interrupts.CPU50.RES:R=
eschedul
> ing_interrupts
>       3650 =C2=B1  2%     -23.7%       2783 =C2=B1  2%  interrupts.CPU51.=
RES:Reschedul
> ing_interrupts
>       3835 =C2=B1  2%     -16.7%       3195 =C2=B1  3%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>       3697 =C2=B1  2%     -21.6%       2897 =C2=B1  2%  interrupts.CPU53.=
RES:Reschedul
> ing_interrupts
>       3655 =C2=B1 34%     +52.4%       5569        interrupts.CPU54.NMI:N=
on-maska
> ble_interrupts
>       3655 =C2=B1 34%     +52.4%       5569        interrupts.CPU54.PMI:P=
erforman
> ce_monitoring_interrupts
>       3625 =C2=B1  4%     -16.4%       3031 =C2=B1  3%  interrupts.CPU54.=
RES:Reschedul
> ing_interrupts
>     329.25 =C2=B1  7%     -18.9%     267.00 =C2=B1 10%  interrupts.CPU54.=
TLB:TLB_shoot
> downs
>       3800           -19.1%       3075 =C2=B1  6%  interrupts.CPU55.RES:R=
eschedul
> ing_interrupts
>       4232 =C2=B1 24%     +30.6%       5526        interrupts.CPU56.NMI:N=
on-maska
> ble_interrupts
>       4232 =C2=B1 24%     +30.6%       5526        interrupts.CPU56.PMI:P=
erforman
> ce_monitoring_interrupts
>       3588 =C2=B1  4%     -16.7%       2988 =C2=B1  6%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>       3543           -13.1%       3079 =C2=B1  6%  interrupts.CPU57.RES:R=
eschedul
> ing_interrupts
>       4239 =C2=B1 24%     +30.7%       5542        interrupts.CPU58.NMI:N=
on-maska
> ble_interrupts
>       4239 =C2=B1 24%     +30.7%       5542        interrupts.CPU58.PMI:P=
erforman
> ce_monitoring_interrupts
>       4270 =C2=B1  5%     -12.5%       3735 =C2=B1  8%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>       4236 =C2=B1 24%     +30.3%       5517        interrupts.CPU59.NMI:N=
on-maska
> ble_interrupts
>       4236 =C2=B1 24%     +30.3%       5517        interrupts.CPU59.PMI:P=
erforman
> ce_monitoring_interrupts
>       3876 =C2=B1  2%      -9.9%       3491        interrupts.CPU59.RES:R=
eschedul
> ing_interrupts
>       3711 =C2=B1  4%     -18.7%       3018 =C2=B1  6%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>       4201 =C2=B1 24%     +31.8%       5538        interrupts.CPU60.NMI:N=
on-maska
> ble_interrupts
>       4201 =C2=B1 24%     +31.8%       5538        interrupts.CPU60.PMI:P=
erforman
> ce_monitoring_interrupts
>       3640 =C2=B1  5%     -19.6%       2925 =C2=B1  4%  interrupts.CPU60.=
RES:Reschedul
> ing_interrupts
>       3617 =C2=B1 32%     +53.4%       5548        interrupts.CPU61.NMI:N=
on-maska
> ble_interrupts
>       3617 =C2=B1 32%     +53.4%       5548        interrupts.CPU61.PMI:P=
erforman
> ce_monitoring_interrupts
>       3783 =C2=B1  4%     -19.1%       3061 =C2=B1  3%  interrupts.CPU61.=
RES:Reschedul
> ing_interrupts
>       4204 =C2=B1 24%     +32.1%       5552        interrupts.CPU62.NMI:N=
on-maska
> ble_interrupts
>       4204 =C2=B1 24%     +32.1%       5552        interrupts.CPU62.PMI:P=
erforman
> ce_monitoring_interrupts
>       3555 =C2=B1  3%     -12.4%       3114 =C2=B1  5%  interrupts.CPU62.=
RES:Reschedul
> ing_interrupts
>       4224 =C2=B1 24%     +31.2%       5543        interrupts.CPU63.NMI:N=
on-maska
> ble_interrupts
>       4224 =C2=B1 24%     +31.2%       5543        interrupts.CPU63.PMI:P=
erforman
> ce_monitoring_interrupts
>       3550           -20.3%       2829 =C2=B1  4%  interrupts.CPU63.RES:R=
eschedul
> ing_interrupts
>       3871 =C2=B1  4%     -15.7%       3263 =C2=B1  4%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>       4211 =C2=B1 24%     +32.1%       5564        interrupts.CPU65.NMI:N=
on-maska
> ble_interrupts
>       4211 =C2=B1 24%     +32.1%       5564        interrupts.CPU65.PMI:P=
erforman
> ce_monitoring_interrupts
>       3693 =C2=B1  2%     -18.2%       3022 =C2=B1  4%  interrupts.CPU65.=
RES:Reschedul
> ing_interrupts
>       3508           -16.6%       2924 =C2=B1  4%  interrupts.CPU66.RES:R=
eschedul
> ing_interrupts
>       4250 =C2=B1 24%     +30.6%       5553        interrupts.CPU67.NMI:N=
on-maska
> ble_interrupts
>       4250 =C2=B1 24%     +30.6%       5553        interrupts.CPU67.PMI:P=
erforman
> ce_monitoring_interrupts
>       3855 =C2=B1  2%     -17.7%       3172 =C2=B1  5%  interrupts.CPU68.=
RES:Reschedul
> ing_interrupts
>       3684           -16.5%       3075 =C2=B1  4%  interrupts.CPU69.RES:R=
eschedul
> ing_interrupts
>       4830           +14.6%       5535        interrupts.CPU7.NMI:Non-mas=
kab
> le_interrupts
>       4830           +14.6%       5535        interrupts.CPU7.PMI:Perform=
anc
> e_monitoring_interrupts
>       3705 =C2=B1  4%     -13.9%       3191 =C2=B1 10%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>       4226 =C2=B1 24%     +31.6%       5563        interrupts.CPU70.NMI:N=
on-maska
> ble_interrupts
>       4226 =C2=B1 24%     +31.6%       5563        interrupts.CPU70.PMI:P=
erforman
> ce_monitoring_interrupts
>       3730 =C2=B1  4%     -14.0%       3207 =C2=B1  7%  interrupts.CPU70.=
RES:Reschedul
> ing_interrupts
>       4836           +15.0%       5564        interrupts.CPU71.NMI:Non-ma=
ska
> ble_interrupts
>       4836           +15.0%       5564        interrupts.CPU71.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3568           -18.1%       2921 =C2=B1  5%  interrupts.CPU71.RES:R=
eschedul
> ing_interrupts
>       3713 =C2=B1  3%     -17.6%       3060        interrupts.CPU72.RES:R=
eschedul
> ing_interrupts
>       4841           +14.1%       5523        interrupts.CPU73.NMI:Non-ma=
ska
> ble_interrupts
>       4841           +14.1%       5523        interrupts.CPU73.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3531           -19.9%       2829 =C2=B1  4%  interrupts.CPU73.RES:R=
eschedul
> ing_interrupts
>       4832           +14.4%       5529        interrupts.CPU74.NMI:Non-ma=
ska
> ble_interrupts
>       4832           +14.4%       5529        interrupts.CPU74.PMI:Perfor=
man
> ce_monitoring_interrupts
>       3618 =C2=B1 34%     +52.5%       5519        interrupts.CPU75.NMI:N=
on-maska
> ble_interrupts
>       3618 =C2=B1 34%     +52.5%       5519        interrupts.CPU75.PMI:P=
erforman
> ce_monitoring_interrupts
>       3590           -15.8%       3024        interrupts.CPU75.RES:Resche=
dul
> ing_interrupts
>       3611 =C2=B1 34%     +53.3%       5535        interrupts.CPU76.NMI:N=
on-maska
> ble_interrupts
>       3611 =C2=B1 34%     +53.3%       5535        interrupts.CPU76.PMI:P=
erforman
> ce_monitoring_interrupts
>       3585 =C2=B1  2%     -18.1%       2938 =C2=B1  3%  interrupts.CPU76.=
RES:Reschedul
> ing_interrupts
>       3035 =C2=B1 36%     +82.4%       5536        interrupts.CPU77.NMI:N=
on-maska
> ble_interrupts
>       3035 =C2=B1 36%     +82.4%       5536        interrupts.CPU77.PMI:P=
erforman
> ce_monitoring_interrupts
>       3481 =C2=B1  3%     -18.4%       2840        interrupts.CPU77.RES:R=
eschedul
> ing_interrupts
>       3496           -20.4%       2784        interrupts.CPU78.RES:Resche=
dul
> ing_interrupts
>       3644 =C2=B1 34%     +52.3%       5549        interrupts.CPU79.NMI:N=
on-maska
> ble_interrupts
>       3644 =C2=B1 34%     +52.3%       5549        interrupts.CPU79.PMI:P=
erforman
> ce_monitoring_interrupts
>       3486 =C2=B1  3%     -14.6%       2976 =C2=B1  4%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>       3479 =C2=B1  5%     -21.5%       2729 =C2=B1  2%  interrupts.CPU82.=
RES:Reschedul
> ing_interrupts
>       4241 =C2=B1 25%     +30.5%       5533        interrupts.CPU83.NMI:N=
on-maska
> ble_interrupts
>       4241 =C2=B1 25%     +30.5%       5533        interrupts.CPU83.PMI:P=
erforman
> ce_monitoring_interrupts
>       3495 =C2=B1  3%     -16.7%       2911 =C2=B1  2%  interrupts.CPU83.=
RES:Reschedul
> ing_interrupts
>       3545 =C2=B1  2%     -18.5%       2889        interrupts.CPU84.RES:R=
eschedul
> ing_interrupts
>       3521 =C2=B1  2%     -16.2%       2949 =C2=B1  3%  interrupts.CPU85.=
RES:Reschedul
> ing_interrupts
>       3766 =C2=B1  2%     -21.5%       2955 =C2=B1  3%  interrupts.CPU86.=
RES:Reschedul
> ing_interrupts
>       4249 =C2=B1 25%     +29.8%       5515        interrupts.CPU87.NMI:N=
on-maska
> ble_interrupts
>       4249 =C2=B1 25%     +29.8%       5515        interrupts.CPU87.PMI:P=
erforman
> ce_monitoring_interrupts
>       3656 =C2=B1  2%     -23.7%       2789 =C2=B1  3%  interrupts.CPU87.=
RES:Reschedul
> ing_interrupts
>       3614 =C2=B1 33%     +53.3%       5541        interrupts.CPU88.NMI:N=
on-maska
> ble_interrupts
>       3614 =C2=B1 33%     +53.3%       5541        interrupts.CPU88.PMI:P=
erforman
> ce_monitoring_interrupts
>       3671 =C2=B1  4%     -23.2%       2817 =C2=B1  2%  interrupts.CPU88.=
RES:Reschedul
> ing_interrupts
>       3590 =C2=B1  2%     -17.1%       2978 =C2=B1  5%  interrupts.CPU9.R=
ES:Rescheduli
> ng_interrupts
>       4055 =C2=B1  3%     -21.0%       3203 =C2=B1  8%  interrupts.CPU90.=
RES:Reschedul
> ing_interrupts
>       3677 =C2=B1  2%     -13.7%       3172 =C2=B1  6%  interrupts.CPU91.=
RES:Reschedul
> ing_interrupts
>       4274 =C2=B1 24%     +30.1%       5559        interrupts.CPU92.NMI:N=
on-maska
> ble_interrupts
>       4274 =C2=B1 24%     +30.1%       5559        interrupts.CPU92.PMI:P=
erforman
> ce_monitoring_interrupts
>       3622 =C2=B1  4%     -17.9%       2973 =C2=B1  3%  interrupts.CPU92.=
RES:Reschedul
> ing_interrupts
>       3657 =C2=B1 33%     +52.5%       5576        interrupts.CPU93.NMI:N=
on-maska
> ble_interrupts
>       3657 =C2=B1 33%     +52.5%       5576        interrupts.CPU93.PMI:P=
erforman
> ce_monitoring_interrupts
>       4262 =C2=B1 24%     +30.6%       5568        interrupts.CPU94.NMI:N=
on-maska
> ble_interrupts
>       4262 =C2=B1 24%     +30.6%       5568        interrupts.CPU94.PMI:P=
erforman
> ce_monitoring_interrupts
>       3651           -15.4%       3087 =C2=B1  5%  interrupts.CPU94.RES:R=
eschedul
> ing_interrupts
>       4265 =C2=B1 24%     +30.5%       5564        interrupts.CPU95.NMI:N=
on-maska
> ble_interrupts
>       4265 =C2=B1 24%     +30.5%       5564        interrupts.CPU95.PMI:P=
erforman
> ce_monitoring_interrupts
>       3032 =C2=B1 35%     +82.9%       5547        interrupts.CPU96.NMI:N=
on-maska
> ble_interrupts
>       3032 =C2=B1 35%     +82.9%       5547        interrupts.CPU96.PMI:P=
erforman
> ce_monitoring_interrupts
>       4256 =C2=B1 24%     +30.5%       5553        interrupts.CPU98.NMI:N=
on-maska
> ble_interrupts
>       4256 =C2=B1 24%     +30.5%       5553        interrupts.CPU98.PMI:P=
erforman
> ce_monitoring_interrupts
>     616116 =C2=B1  5%     +19.0%     733200 =C2=B1  2%  interrupts.NMI:No=
n-maskable_in
> terrupts
>     616116 =C2=B1  5%     +19.0%     733200 =C2=B1  2%  interrupts.PMI:Pe=
rformance_mon
> itoring_interrupts
>     538776           -14.7%     459708        interrupts.RES:Rescheduling=
_in
> terrupts
>       5839 =C2=B1  3%     -34.3%       3837 =C2=B1 23%  interrupts.TLB:TL=
B_shootdowns
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2ap3: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz wi=
th
> 192G memory
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2sp4: 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
tes
> tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/30%/debian-10.4-x86_64-20200603.cgz/3=
00s
> /lkp-csl-2sp4/shell8/unixbench/0x4003003
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      18043 =C2=B1  2%     +11.7%      20157 =C2=B1  2%  unixbench.score
>     317879           +45.7%     463284 =C2=B1  2%  unixbench.time.involun=
tary_con
> text_switches
>      65259 =C2=B1  3%     +22.5%      79969 =C2=B1  5%  unixbench.time.ma=
jor_page_faul
> ts
>   87975588 =C2=B1  2%     +11.8%   98370953 =C2=B1  2%  unixbench.time.mi=
nor_page_faul
> ts
>       3474 =C2=B1  5%     +51.3%       5256        unixbench.time.percent=
_of_cpu_
> this_job_got
>       1840 =C2=B1  6%     +61.3%       2969 =C2=B1  2%  unixbench.time.sy=
stem_time
>   13709117 =C2=B1  3%     -21.7%   10733860        unixbench.time.volunta=
ry_conte
> xt_switches
>     682047 =C2=B1  2%     +12.2%     765054 =C2=B1  3%  unixbench.workload
>       5932           -20.9%       4693 =C2=B1  2%  uptime.idle
>   15243806            +9.9%   16753643 =C2=B1  2%  numa-vmstat.node0.numa=
_hit
>   15315499 =C2=B1  2%     +11.4%   17064700 =C2=B1  4%  numa-vmstat.node1=
.numa_hit
>   15236130           +11.5%   16981600 =C2=B1  4%  numa-vmstat.node1.numa=
_local
>      62.20 =C2=B1  2%     -18.8       43.42 =C2=B1  2%  mpstat.cpu.all.id=
le%
>       1.89 =C2=B1  2%      +0.2        2.13 =C2=B1  5%  mpstat.cpu.all.so=
ft%
>      29.75 =C2=B1  5%     +18.0       47.72 =C2=B1  3%  mpstat.cpu.all.sy=
s%
>       5.18 =C2=B1  4%      +0.5        5.67 =C2=B1  2%  mpstat.cpu.all.us=
r%
>     883.00 =C2=B1  3%     -12.7%     771.00 =C2=B1  3%  slabinfo.kmem_cac=
he_node.activ
> e_objs
>     928.00 =C2=B1  3%     -12.1%     816.00 =C2=B1  3%  slabinfo.kmem_cac=
he_node.num_o
> bjs
>      22572 =C2=B1  2%     -10.6%      20179        slabinfo.lsm_file_cach=
e.active
> _objs
>      22572 =C2=B1  2%     -10.6%      20179        slabinfo.lsm_file_cach=
e.num_ob
> js
>   30048992 =C2=B1  2%     +11.6%   33519783 =C2=B1  2%  numa-numastat.nod=
e0.local_node
>   30079976 =C2=B1  2%     +11.5%   33546111 =C2=B1  2%  numa-numastat.nod=
e0.numa_hit
>   30574211 =C2=B1  2%     +11.4%   34055212 =C2=B1  3%  numa-numastat.nod=
e1.local_node
>   30574301 =C2=B1  2%     +11.4%   34059972 =C2=B1  3%  numa-numastat.nod=
e1.numa_hit
>     104.50 =C2=B1 22%   +4462.7%       4768 =C2=B1168%  numa-numastat.nod=
e1.other_node
>      62.75 =C2=B1  2%     -28.3%      45.00 =C2=B1  2%  vmstat.cpu.id
>      31.25 =C2=B1  5%     +56.8%      49.00 =C2=B1  2%  vmstat.cpu.sy
>      37.75 =C2=B1 13%     +53.6%      58.00        vmstat.procs.r
>     424593 =C2=B1  4%     -19.5%     341957        vmstat.system.cs
>     195771            +2.0%     199732        vmstat.system.in
>  2.886e+08 =C2=B1  3%     -44.1%  1.613e+08 =C2=B1  2%  cpuidle.C1.time
>    4321115 =C2=B1  4%     -43.7%    2432243        cpuidle.C1.usage
>  3.466e+09 =C2=B1  4%     -27.4%  2.518e+09 =C2=B1  5%  cpuidle.C1E.time
>   16538034 =C2=B1  3%     -22.9%   12748752 =C2=B1  3%  cpuidle.C1E.usage
>  1.688e+08 =C2=B1 68%     -66.5%   56467908 =C2=B1129%  cpuidle.C6.time
>    1639806 =C2=B1  2%     +36.4%    2237020 =C2=B1 14%  cpuidle.POLL.time
>     239151 =C2=B1 13%    +138.8%     571046 =C2=B1 27%  cpuidle.POLL.usage
>       1540 =C2=B1  2%     +23.0%       1894 =C2=B1 15%  proc-vmstat.nr_ac=
tive_anon
>       6152            +5.4%       6483 =C2=B1  2%  proc-vmstat.nr_page_ta=
ble_page
> s
>      21110            -1.1%      20877        proc-vmstat.nr_slab_reclaim=
abl
> e
>       1540 =C2=B1  2%     +23.0%       1894 =C2=B1 15%  proc-vmstat.nr_zo=
ne_active_ano
> n
>   60686711 =C2=B1  2%     +11.4%   67594314 =C2=B1  2%  proc-vmstat.numa_=
hit
>   60655609 =C2=B1  2%     +11.4%   67563211 =C2=B1  2%  proc-vmstat.numa_=
local
>      89964 =C2=B1  3%     +12.0%     100727 =C2=B1  3%  proc-vmstat.pgact=
ivate
>   64756068 =C2=B1  2%     +11.2%   72032011 =C2=B1  2%  proc-vmstat.pgall=
oc_normal
>   88550542 =C2=B1  2%     +11.8%   98977852 =C2=B1  2%  proc-vmstat.pgfau=
lt
>   64747116 =C2=B1  2%     +11.2%   72022879 =C2=B1  2%  proc-vmstat.pgfree
>    4206681 =C2=B1  2%     +12.1%    4713816 =C2=B1  2%  proc-vmstat.pgreu=
se
>       2903 =C2=B1  2%     +11.5%       3238 =C2=B1  3%  proc-vmstat.thp_f=
ault_alloc
>    1217299 =C2=B1  2%     +11.7%    1359203 =C2=B1  2%  proc-vmstat.unevi=
ctable_pgs_cu
> lled
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.devkmsg_write.cold.new_sync_write.vfs_write.ksys_write.do_syscall_64
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.devkmsg_emit.devkmsg_write.cold.new_sync_write.vfs_write.ksys_write
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.vprintk_emit.devkmsg_emit.devkmsg_write.cold.new_sync_write.vfs_write
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write.cold.new_sync_w=
rit
> e
>      11.69 =C2=B1100%      -4.6        7.10 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.serial8250_console_write.console_unlock.vprintk_emit.devkmsg_emit.devk=
msg
> _write.cold
>       9.28 =C2=B1101%      -4.3        4.94 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.wait_for_xmitr.serial8250_console_putchar.uart_console_write.serial825=
0_c
> onsole_write.console_unlock
>       9.28 =C2=B1101%      -4.3        4.94 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.serial8250_console_putchar.uart_console_write.serial8250_console_write=
.co
> nsole_unlock.vprintk_emit
>      10.71 =C2=B1100%      -3.9        6.79 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.uart_console_write.serial8250_console_write.console_unlock.vprintk_emi=
t.d
> evkmsg_emit
>       7.10 =C2=B1102%      -2.2        4.94 =C2=B1173%  perf-profile.call=
trace.cycles-
> pp.io_serial_in.wait_for_xmitr.serial8250_console_putchar.uart_console_wr=
ite
> .serial8250_console_write
>       0.00            +1.5        1.52 =C2=B1 12%  perf-profile.calltrace=
.cycles-
> pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.as=
m_e
> xc_page_fault
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.devkmsg_write.cold
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.devkmsg_emit
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.vprintk_emit
>      14.61 =C2=B1100%      -5.7        8.95 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.console_unlock
>      10.26 =C2=B1101%      -5.0        5.25 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.wait_for_xmitr
>      11.69 =C2=B1100%      -4.6        7.10 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.serial8250_console_write
>       9.28 =C2=B1101%      -4.3        4.94 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.serial8250_console_putchar
>      10.71 =C2=B1100%      -3.9        6.79 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.uart_console_write
>       8.08 =C2=B1102%      -2.8        5.25 =C2=B1173%  perf-profile.chil=
dren.cycles-p
> p.io_serial_in
>       0.00            +1.5        1.52 =C2=B1 12%  perf-profile.children.=
cycles-p
> p.__handle_mm_fault
>       0.00            +1.5        1.52 =C2=B1 12%  perf-profile.children.=
cycles-p
> p.do_user_addr_fault
>       0.00            +1.5        1.52 =C2=B1 12%  perf-profile.children.=
cycles-p
> p.exc_page_fault
>       0.00            +1.5        1.52 =C2=B1 12%  perf-profile.children.=
cycles-p
> p.handle_mm_fault
>       8.08 =C2=B1102%      -2.8        5.25 =C2=B1173%  perf-profile.self=
.cycles-pp.io
> _serial_in
>      10874 =C2=B1  5%     +50.4%      16360        sched_debug.cfs_rq:/.e=
xec_cloc
> k.avg
>      12311 =C2=B1  4%     +40.0%      17234        sched_debug.cfs_rq:/.e=
xec_cloc
> k.max
>      10601 =C2=B1  5%     +51.7%      16077 =C2=B1  2%  sched_debug.cfs_r=
q:/.exec_cloc
> k.min
>     233.04 =C2=B1 12%     -17.8%     191.56 =C2=B1 10%  sched_debug.cfs_r=
q:/.exec_cloc
> k.stddev
>    1366968 =C2=B1  5%     +42.3%    1945276 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.avg
>    2082682 =C2=B1  3%     +22.9%    2560291 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.max
>    1318118 =C2=B1  6%     +42.6%    1879145 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.min
>       0.25 =C2=B1 20%     +64.1%       0.41 =C2=B1  5%  sched_debug.cfs_r=
q:/.nr_runnin
> g.avg
>       6.73 =C2=B1  6%     -81.3%       1.26 =C2=B1 21%  sched_debug.cfs_r=
q:/.nr_spread
> _over.avg
>      14.25 =C2=B1 12%     -68.4%       4.50 =C2=B1 17%  sched_debug.cfs_r=
q:/.nr_spread
> _over.max
>       1.25 =C2=B1 20%    -100.0%       0.00        sched_debug.cfs_rq:/.n=
r_spread
> _over.min
>       2.45 =C2=B1  9%     -55.7%       1.08 =C2=B1 12%  sched_debug.cfs_r=
q:/.nr_spread
> _over.stddev
>       4.62 =C2=B1117%   +1148.6%      57.75 =C2=B1 59%  sched_debug.cfs_r=
q:/.runnable_
> avg.min
>       4.62 =C2=B1123%   +1156.8%      58.12 =C2=B1 59%  sched_debug.cfs_r=
q:/.util_avg.
> min
>      56.41 =C2=B1 18%     +71.3%      96.65 =C2=B1 20%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.avg
>     799.12 =C2=B1  6%     +37.4%       1098 =C2=B1 18%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.max
>     144.83 =C2=B1  7%     +32.0%     191.20 =C2=B1 14%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.stddev
>       0.00 =C2=B1 13%     +39.1%       0.00 =C2=B1  6%  sched_debug.cpu.n=
ext_balance.s
> tddev
>       0.24 =C2=B1 19%    +110.8%       0.51 =C2=B1  7%  sched_debug.cpu.n=
r_running.avg
>       1.50 =C2=B1 23%    +166.7%       4.00 =C2=B1 26%  sched_debug.cpu.n=
r_running.max
>       0.43 =C2=B1  7%     +51.0%       0.65 =C2=B1 13%  sched_debug.cpu.n=
r_running.std
> dev
>     141749 =C2=B1  3%     -19.8%     113641        sched_debug.cpu.nr_swi=
tches.av
> g
>     150818 =C2=B1  4%     -18.7%     122583        sched_debug.cpu.nr_swi=
tches.ma
> x
>     130048 =C2=B1  2%     -18.3%     106310        sched_debug.cpu.nr_swi=
tches.mi
> n
>     141010 =C2=B1  3%     -19.4%     113679        sched_debug.cpu.sched_=
count.av
> g
>     144891 =C2=B1  3%     -18.4%     118161        sched_debug.cpu.sched_=
count.ma
> x
>     130293 =C2=B1  2%     -18.6%     106111 =C2=B1  3%  sched_debug.cpu.s=
ched_count.mi
> n
>      67642 =C2=B1  3%     -22.3%      52573        sched_debug.cpu.sched_=
goidle.a
> vg
>      69529 =C2=B1  3%     -20.8%      55062        sched_debug.cpu.sched_=
goidle.m
> ax
>      62497 =C2=B1  2%     -21.4%      49096 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.m
> in
>      68274 =C2=B1  3%     -19.4%      55024        sched_debug.cpu.ttwu_c=
ount.avg
>      74584 =C2=B1  4%     -20.5%      59270        sched_debug.cpu.ttwu_c=
ount.max
>      61758 =C2=B1  4%     -18.7%      50226 =C2=B1  2%  sched_debug.cpu.t=
twu_count.min
>       2465 =C2=B1  6%     -19.4%       1986 =C2=B1  8%  sched_debug.cpu.t=
twu_count.std
> dev
>       4480           +20.2%       5385 =C2=B1  2%  sched_debug.cpu.ttwu_l=
ocal.avg
>       4876 =C2=B1  3%     +21.0%       5902 =C2=B1  2%  sched_debug.cpu.t=
twu_local.max
>       4150           +21.1%       5024 =C2=B1  2%  sched_debug.cpu.ttwu_l=
ocal.min
>      11.56 =C2=B1  3%     -16.0%       9.71 =C2=B1  2%  perf-stat.i.MPKI
>  1.149e+10           +26.7%  1.457e+10        perf-stat.i.branch-instruct=
ion
> s
>       1.92 =C2=B1  2%      -0.2        1.70 =C2=B1  2%  perf-stat.i.branc=
h-miss-rate%
>  2.142e+08 =C2=B1  2%     +11.0%  2.377e+08 =C2=B1  2%  perf-stat.i.branc=
h-misses
>      20.50            +1.0       21.49        perf-stat.i.cache-miss-rate%
>  1.361e+08 =C2=B1  3%     +12.2%  1.527e+08 =C2=B1  2%  perf-stat.i.cache=
-misses
>     447022 =C2=B1  4%     -19.8%     358370        perf-stat.i.context-sw=
itches
>       2.07 =C2=B1  4%     +15.5%       2.40        perf-stat.i.cpi
>  1.168e+11 =C2=B1  4%     +47.5%  1.722e+11        perf-stat.i.cpu-cycles
>     121111 =C2=B1  4%     -40.7%      71780 =C2=B1  2%  perf-stat.i.cpu-m=
igrations
>     937.03 =C2=B1  8%     +26.1%       1181 =C2=B1  4%  perf-stat.i.cycle=
s-between-cac
> he-misses
>       0.09 =C2=B1  2%      -0.0        0.08 =C2=B1  4%  perf-stat.i.dTLB-=
load-miss-rat
> e%
>  1.443e+10           +27.4%  1.839e+10        perf-stat.i.dTLB-loads
>    4078044 =C2=B1  3%      +9.7%    4472973 =C2=B1  3%  perf-stat.i.dTLB-=
store-misses
>  6.741e+09 =C2=B1  3%      +8.5%  7.312e+09 =C2=B1  2%  perf-stat.i.dTLB-=
stores
>  5.591e+10           +27.2%   7.11e+10        perf-stat.i.instructions
>       3368           +26.6%       4265 =C2=B1  3%  perf-stat.i.instructio=
ns-per-i
> TLB-miss
>       0.49 =C2=B1  3%     -13.0%       0.42        perf-stat.i.ipc
>       1015 =C2=B1  5%     +22.8%       1246 =C2=B1  5%  perf-stat.i.major=
-faults
>       1.22 =C2=B1  4%     +47.5%       1.79        perf-stat.i.metric.GHz
>       0.09 =C2=B1 26%    +817.7%       0.82 =C2=B1  4%  perf-stat.i.metri=
c.K/sec
>     348.10           +22.9%     427.82        perf-stat.i.metric.M/sec
>    1345572 =C2=B1  3%     +12.0%    1507666 =C2=B1  2%  perf-stat.i.minor=
-faults
>   40639032 =C2=B1  2%      +9.5%   44513140 =C2=B1  2%  perf-stat.i.node-=
load-misses
>    7796037 =C2=B1  3%     +15.0%    8967879 =C2=B1  3%  perf-stat.i.node-=
loads
>   18605266 =C2=B1  2%     +12.9%   21005199        perf-stat.i.node-store=
-misses
>    4756866 =C2=B1  3%      +9.5%    5210097 =C2=B1  3%  perf-stat.i.node-=
stores
>    1346588 =C2=B1  3%     +12.1%    1508913 =C2=B1  2%  perf-stat.i.page-=
faults
>      11.90 =C2=B1  3%     -16.5%       9.94 =C2=B1  2%  perf-stat.overall=
.MPKI
>       1.86 =C2=B1  2%      -0.2        1.63 =C2=B1  2%  perf-stat.overall=
.branch-miss-
> rate%
>      20.47            +1.1       21.61        perf-stat.overall.cache-mis=
s-r
> ate%
>       2.09 =C2=B1  4%     +15.9%       2.42        perf-stat.overall.cpi
>     859.96 =C2=B1  7%     +31.2%       1128 =C2=B1  3%  perf-stat.overall=
.cycles-betwe
> en-cache-misses
>       0.10 =C2=B1  2%      -0.0        0.08 =C2=B1  4%  perf-stat.overall=
.dTLB-load-mi
> ss-rate%
>       3384           +27.4%       4313 =C2=B1  3%  perf-stat.overall.inst=
ructions
> -per-iTLB-miss
>       0.48 =C2=B1  4%     -13.9%       0.41        perf-stat.overall.ipc
>    5285823 =C2=B1  3%     +13.2%    5983852 =C2=B1  3%  perf-stat.overall=
.path-length
>  1.131e+10           +26.8%  1.434e+10        perf-stat.ps.branch-instruc=
tio
> ns
>  2.108e+08 =C2=B1  2%     +11.0%   2.34e+08 =C2=B1  2%  perf-stat.ps.bran=
ch-misses
>   1.34e+08 =C2=B1  3%     +12.2%  1.503e+08 =C2=B1  2%  perf-stat.ps.cach=
e-misses
>     439843 =C2=B1  4%     -19.8%     352773        perf-stat.ps.context-s=
witches
>  1.149e+11 =C2=B1  4%     +47.5%  1.695e+11        perf-stat.ps.cpu-cycles
>     119164 =C2=B1  4%     -40.7%      70661 =C2=B1  2%  perf-stat.ps.cpu-=
migrations
>   1.42e+10           +27.5%   1.81e+10        perf-stat.ps.dTLB-loads
>    4012691 =C2=B1  3%      +9.7%    4403019 =C2=B1  3%  perf-stat.ps.dTLB=
-store-misses
>  6.634e+09 =C2=B1  3%      +8.5%  7.197e+09 =C2=B1  2%  perf-stat.ps.dTLB=
-stores
>  5.501e+10           +27.2%  6.998e+10        perf-stat.ps.instructions
>     998.81 =C2=B1  4%     +22.8%       1226 =C2=B1  5%  perf-stat.ps.majo=
r-faults
>    1323991 =C2=B1  3%     +12.1%    1484070 =C2=B1  2%  perf-stat.ps.mino=
r-faults
>   39986879 =C2=B1  2%      +9.6%   43815733 =C2=B1  2%  perf-stat.ps.node=
-load-misses
>    7671041 =C2=B1  3%     +15.1%    8828271 =C2=B1  3%  perf-stat.ps.node=
-loads
>   18306688 =C2=B1  2%     +12.9%   20676034        perf-stat.ps.node-stor=
e-misses
>    4680539 =C2=B1  3%      +9.6%    5129193 =C2=B1  3%  perf-stat.ps.node=
-stores
>    1324989 =C2=B1  3%     +12.1%    1485297 =C2=B1  2%  perf-stat.ps.page=
-faults
>  3.602e+12           +26.9%  4.573e+12        perf-stat.total.instructions
>      38178 =C2=B1  5%     +18.6%      45267 =C2=B1  4%  softirqs.CPU0.RCU
>      35224           +22.7%      43230        softirqs.CPU1.RCU
>      13683 =C2=B1  4%      +6.2%      14525 =C2=B1  2%  softirqs.CPU1.SCH=
ED
>      35336           +21.4%      42907        softirqs.CPU10.RCU
>      35296           +20.9%      42665        softirqs.CPU11.RCU
>      35190           +20.9%      42554        softirqs.CPU12.RCU
>      34631           +23.3%      42708        softirqs.CPU13.RCU
>      34748           +23.4%      42875        softirqs.CPU14.RCU
>      35642 =C2=B1  2%     +19.5%      42580        softirqs.CPU15.RCU
>      35263           +21.9%      42975        softirqs.CPU16.RCU
>      35186 =C2=B1  3%     +22.4%      43068        softirqs.CPU17.RCU
>      35235           +22.4%      43137        softirqs.CPU18.RCU
>      35192           +22.3%      43027        softirqs.CPU19.RCU
>      35842           +19.1%      42700        softirqs.CPU2.RCU
>      35847           +19.3%      42758        softirqs.CPU20.RCU
>      35305           +22.6%      43276        softirqs.CPU21.RCU
>      35672           +20.2%      42881        softirqs.CPU22.RCU
>      35499           +21.2%      43020        softirqs.CPU23.RCU
>      35325           +21.1%      42779 =C2=B1  3%  softirqs.CPU24.RCU
>      35114           +22.1%      42865 =C2=B1  2%  softirqs.CPU25.RCU
>      35369           +20.2%      42509        softirqs.CPU26.RCU
>      35317           +21.0%      42744        softirqs.CPU27.RCU
>      35037 =C2=B1  2%     +22.2%      42817        softirqs.CPU28.RCU
>      12678 =C2=B1  2%     +10.5%      14008        softirqs.CPU28.SCHED
>      34962           +24.6%      43551 =C2=B1  2%  softirqs.CPU29.RCU
>      35077           +26.2%      44269 =C2=B1  2%  softirqs.CPU3.RCU
>      12795           +13.0%      14464 =C2=B1  4%  softirqs.CPU3.SCHED
>      34437 =C2=B1  2%     +24.8%      42991 =C2=B1  2%  softirqs.CPU30.RCU
>      35183           +21.8%      42869 =C2=B1  2%  softirqs.CPU31.RCU
>      35047           +21.3%      42503        softirqs.CPU32.RCU
>      34993           +22.3%      42809        softirqs.CPU33.RCU
>      34695           +23.2%      42750        softirqs.CPU34.RCU
>      36771 =C2=B1  5%     +15.3%      42411        softirqs.CPU35.RCU
>      35233 =C2=B1  2%     +21.1%      42657        softirqs.CPU36.RCU
>      35158           +20.5%      42352        softirqs.CPU37.RCU
>      35304           +21.2%      42802 =C2=B1  2%  softirqs.CPU38.RCU
>      35062           +20.7%      42318 =C2=B1  2%  softirqs.CPU39.RCU
>      35145           +21.7%      42766        softirqs.CPU4.RCU
>      35017           +21.5%      42535 =C2=B1  2%  softirqs.CPU40.RCU
>      35467           +20.1%      42613        softirqs.CPU41.RCU
>      35018           +21.3%      42490        softirqs.CPU42.RCU
>      35270           +20.8%      42609        softirqs.CPU43.RCU
>      35102           +21.0%      42477        softirqs.CPU44.RCU
>      35258           +21.0%      42647        softirqs.CPU45.RCU
>      35071           +21.8%      42715 =C2=B1  5%  softirqs.CPU46.RCU
>      35077           +22.6%      43006 =C2=B1  2%  softirqs.CPU47.RCU
>      34761           +24.0%      43097        softirqs.CPU48.RCU
>      35626           +19.8%      42668 =C2=B1  3%  softirqs.CPU49.RCU
>      34073 =C2=B1  3%     +25.2%      42658        softirqs.CPU5.RCU
>      35386           +21.6%      43038        softirqs.CPU50.RCU
>      35708           +21.7%      43471        softirqs.CPU51.RCU
>      12629 =C2=B1  2%     +10.1%      13901        softirqs.CPU51.SCHED
>      36408           +19.6%      43538        softirqs.CPU52.RCU
>      35892 =C2=B1  2%     +21.4%      43571        softirqs.CPU53.RCU
>      35459           +22.6%      43462        softirqs.CPU54.RCU
>      12747           +10.1%      14030        softirqs.CPU54.SCHED
>      35917           +20.8%      43399        softirqs.CPU55.RCU
>      35992           +18.8%      42747        softirqs.CPU56.RCU
>      35603           +22.9%      43772        softirqs.CPU57.RCU
>      12812            +9.6%      14044 =C2=B1  2%  softirqs.CPU57.SCHED
>      35851           +21.4%      43517        softirqs.CPU58.RCU
>      12764            +9.3%      13952        softirqs.CPU58.SCHED
>      35864           +21.4%      43523        softirqs.CPU59.RCU
>      35021 =C2=B1  2%     +21.1%      42411        softirqs.CPU6.RCU
>      35536           +21.7%      43265        softirqs.CPU60.RCU
>      35148 =C2=B1  2%     +22.9%      43213        softirqs.CPU61.RCU
>      35922 =C2=B1  2%     +20.5%      43288        softirqs.CPU62.RCU
>      35604           +21.5%      43271        softirqs.CPU63.RCU
>      36347           +19.1%      43295        softirqs.CPU64.RCU
>      36441           +19.5%      43550        softirqs.CPU65.RCU
>      35623           +21.5%      43283        softirqs.CPU66.RCU
>      36507           +18.9%      43415        softirqs.CPU67.RCU
>      36159           +20.6%      43610        softirqs.CPU68.RCU
>      36447 =C2=B1  2%     +19.7%      43617        softirqs.CPU69.RCU
>      35263           +21.0%      42679        softirqs.CPU7.RCU
>      36231           +21.2%      43895        softirqs.CPU70.RCU
>      36553           +19.5%      43667        softirqs.CPU71.RCU
>      35596           +22.7%      43672 =C2=B1  2%  softirqs.CPU72.RCU
>      12832            +9.7%      14078        softirqs.CPU72.SCHED
>      35408           +22.5%      43371 =C2=B1  2%  softirqs.CPU73.RCU
>      12761            +9.6%      13987        softirqs.CPU73.SCHED
>      35730           +21.1%      43259        softirqs.CPU74.RCU
>      35950           +20.4%      43295        softirqs.CPU75.RCU
>      35783           +22.9%      43984        softirqs.CPU76.RCU
>      36171           +20.4%      43535 =C2=B1  2%  softirqs.CPU77.RCU
>      37390 =C2=B1  5%     +18.2%      44212 =C2=B1  4%  softirqs.CPU78.RCU
>      36118           +19.4%      43108 =C2=B1  2%  softirqs.CPU79.RCU
>      35183           +20.6%      42441        softirqs.CPU8.RCU
>      35434           +20.9%      42855        softirqs.CPU80.RCU
>      35566           +21.1%      43084        softirqs.CPU81.RCU
>      35858           +18.7%      42563 =C2=B1  2%  softirqs.CPU82.RCU
>      35617           +21.0%      43093        softirqs.CPU83.RCU
>      35897           +21.1%      43486        softirqs.CPU84.RCU
>      35415           +23.3%      43651        softirqs.CPU85.RCU
>      12724            +9.5%      13933 =C2=B1  2%  softirqs.CPU85.SCHED
>      35207           +23.4%      43437        softirqs.CPU86.RCU
>      35550           +21.0%      43019 =C2=B1  3%  softirqs.CPU87.RCU
>      35818           +19.8%      42916 =C2=B1  2%  softirqs.CPU88.RCU
>      35126 =C2=B1  2%     +22.7%      43111        softirqs.CPU89.RCU
>      12818            +8.7%      13935        softirqs.CPU89.SCHED
>      35298           +21.4%      42865        softirqs.CPU9.RCU
>      35192           +22.8%      43200 =C2=B1  2%  softirqs.CPU90.RCU
>      35436           +23.4%      43739 =C2=B1  2%  softirqs.CPU91.RCU
>      35571           +22.7%      43648 =C2=B1  2%  softirqs.CPU92.RCU
>      35612           +20.8%      43029        softirqs.CPU93.RCU
>      35601           +19.4%      42495 =C2=B1  3%  softirqs.CPU94.RCU
>      35597           +20.0%      42714        softirqs.CPU95.RCU
>    3410327           +21.3%    4136246        softirqs.RCU
>     356763 =C2=B1  6%     +67.6%     598057 =C2=B1  6%  interrupts.CAL:Fu=
nction_call_i
> nterrupts
>       4044 =C2=B1 15%     +62.2%       6560 =C2=B1  7%  interrupts.CPU0.C=
AL:Function_c
> all_interrupts
>       4399 =C2=B1 11%     -58.7%       1817 =C2=B1 79%  interrupts.CPU0.T=
LB:TLB_shootd
> owns
>       3937 =C2=B1  8%     +65.2%       6504 =C2=B1  9%  interrupts.CPU1.C=
AL:Function_c
> all_interrupts
>       2283 =C2=B1  2%     -10.9%       2034 =C2=B1  3%  interrupts.CPU1.R=
ES:Rescheduli
> ng_interrupts
>       4534 =C2=B1 12%     -77.7%       1010 =C2=B1 11%  interrupts.CPU1.T=
LB:TLB_shootd
> owns
>       3848 =C2=B1 10%     +61.4%       6209 =C2=B1  5%  interrupts.CPU10.=
CAL:Function_
> call_interrupts
>       2208 =C2=B1  3%      -9.7%       1993 =C2=B1  3%  interrupts.CPU10.=
RES:Reschedul
> ing_interrupts
>       4289 =C2=B1 12%     -77.0%     987.00 =C2=B1 11%  interrupts.CPU10.=
TLB:TLB_shoot
> downs
>       3775 =C2=B1  6%     +59.0%       6001 =C2=B1  6%  interrupts.CPU11.=
CAL:Function_
> call_interrupts
>       2206            -9.8%       1989 =C2=B1  3%  interrupts.CPU11.RES:R=
eschedul
> ing_interrupts
>       4373 =C2=B1 10%     -77.1%       1001 =C2=B1  9%  interrupts.CPU11.=
TLB:TLB_shoot
> downs
>       3663 =C2=B1  7%     +71.6%       6288 =C2=B1  3%  interrupts.CPU12.=
CAL:Function_
> call_interrupts
>       4446 =C2=B1  8%     -77.5%       1002 =C2=B1  8%  interrupts.CPU12.=
TLB:TLB_shoot
> downs
>       3727 =C2=B1 11%     +67.5%       6244 =C2=B1  5%  interrupts.CPU13.=
CAL:Function_
> call_interrupts
>       5375 =C2=B1 47%     -81.2%       1010 =C2=B1  8%  interrupts.CPU13.=
TLB:TLB_shoot
> downs
>       3783 =C2=B1  9%     +62.2%       6136 =C2=B1  4%  interrupts.CPU14.=
CAL:Function_
> call_interrupts
>       2237 =C2=B1  3%      -9.5%       2024 =C2=B1  4%  interrupts.CPU14.=
RES:Reschedul
> ing_interrupts
>       4248 =C2=B1  7%     -77.0%     979.00 =C2=B1  6%  interrupts.CPU14.=
TLB:TLB_shoot
> downs
>       3780 =C2=B1  8%     +63.3%       6174 =C2=B1  5%  interrupts.CPU15.=
CAL:Function_
> call_interrupts
>       2259 =C2=B1  2%     -11.9%       1990 =C2=B1  3%  interrupts.CPU15.=
RES:Reschedul
> ing_interrupts
>       4402 =C2=B1  8%     -73.5%       1166 =C2=B1 27%  interrupts.CPU15.=
TLB:TLB_shoot
> downs
>       3750 =C2=B1  5%     +66.4%       6238 =C2=B1  5%  interrupts.CPU16.=
CAL:Function_
> call_interrupts
>       4422 =C2=B1 12%     -77.8%     983.50 =C2=B1  3%  interrupts.CPU16.=
TLB:TLB_shoot
> downs
>       3847 =C2=B1  8%     +68.5%       6480 =C2=B1  6%  interrupts.CPU17.=
CAL:Function_
> call_interrupts
>       2181 =C2=B1  4%      -8.6%       1994 =C2=B1  3%  interrupts.CPU17.=
RES:Reschedul
> ing_interrupts
>       4311 =C2=B1 10%     -77.5%     970.25 =C2=B1  9%  interrupts.CPU17.=
TLB:TLB_shoot
> downs
>       3777 =C2=B1  8%     +67.8%       6338 =C2=B1  4%  interrupts.CPU18.=
CAL:Function_
> call_interrupts
>       2220 =C2=B1  3%      -8.3%       2036 =C2=B1  3%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>       4330 =C2=B1  8%     -77.4%     976.50 =C2=B1  9%  interrupts.CPU18.=
TLB:TLB_shoot
> downs
>       3796 =C2=B1  7%     +63.5%       6208 =C2=B1  3%  interrupts.CPU19.=
CAL:Function_
> call_interrupts
>       4405 =C2=B1 12%     -78.0%     967.75 =C2=B1  8%  interrupts.CPU19.=
TLB:TLB_shoot
> downs
>       3767 =C2=B1  9%     +67.6%       6313 =C2=B1  5%  interrupts.CPU2.C=
AL:Function_c
> all_interrupts
>       2244 =C2=B1  3%     -11.5%       1986 =C2=B1  4%  interrupts.CPU2.R=
ES:Rescheduli
> ng_interrupts
>       4352 =C2=B1 15%     -77.2%     991.00 =C2=B1 10%  interrupts.CPU2.T=
LB:TLB_shootd
> owns
>       3770 =C2=B1  8%     +62.2%       6117 =C2=B1  4%  interrupts.CPU20.=
CAL:Function_
> call_interrupts
>       2238 =C2=B1  3%      -9.8%       2019 =C2=B1  3%  interrupts.CPU20.=
RES:Reschedul
> ing_interrupts
>       4384 =C2=B1 11%     -77.4%     991.75 =C2=B1  6%  interrupts.CPU20.=
TLB:TLB_shoot
> downs
>       3733 =C2=B1  8%     +66.1%       6202 =C2=B1  6%  interrupts.CPU21.=
CAL:Function_
> call_interrupts
>       4361 =C2=B1 10%     -77.8%     966.25 =C2=B1 11%  interrupts.CPU21.=
TLB:TLB_shoot
> downs
>       3852 =C2=B1  7%     +60.0%       6162 =C2=B1  5%  interrupts.CPU22.=
CAL:Function_
> call_interrupts
>       4366 =C2=B1 14%     -77.8%     969.25 =C2=B1  8%  interrupts.CPU22.=
TLB:TLB_shoot
> downs
>       3799 =C2=B1  9%     +71.2%       6502 =C2=B1  5%  interrupts.CPU23.=
CAL:Function_
> call_interrupts
>       2230 =C2=B1  4%     -10.4%       1999 =C2=B1  4%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>       4312 =C2=B1 11%     -76.9%     995.50 =C2=B1 11%  interrupts.CPU23.=
TLB:TLB_shoot
> downs
>       3789 =C2=B1  3%     +65.1%       6257 =C2=B1  8%  interrupts.CPU24.=
CAL:Function_
> call_interrupts
>       2293 =C2=B1  2%     -11.5%       2030 =C2=B1  2%  interrupts.CPU24.=
RES:Reschedul
> ing_interrupts
>       4370 =C2=B1 10%     -76.4%       1030 =C2=B1 14%  interrupts.CPU24.=
TLB:TLB_shoot
> downs
>       3622 =C2=B1  8%     +75.0%       6338 =C2=B1  9%  interrupts.CPU25.=
CAL:Function_
> call_interrupts
>       2263 =C2=B1  3%     -11.7%       1998 =C2=B1  2%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>       4330 =C2=B1  6%     -75.7%       1054 =C2=B1 10%  interrupts.CPU25.=
TLB:TLB_shoot
> downs
>       3646 =C2=B1  6%     +65.7%       6040 =C2=B1 12%  interrupts.CPU26.=
CAL:Function_
> call_interrupts
>       2269 =C2=B1  3%     -14.6%       1938 =C2=B1  2%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>       4341 =C2=B1  9%     -77.2%     988.00 =C2=B1  8%  interrupts.CPU26.=
TLB:TLB_shoot
> downs
>       3596 =C2=B1  4%     +73.1%       6226 =C2=B1 10%  interrupts.CPU27.=
CAL:Function_
> call_interrupts
>       2239 =C2=B1  2%     -10.8%       1997 =C2=B1  2%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>       4400 =C2=B1 10%     -78.1%     965.25 =C2=B1  8%  interrupts.CPU27.=
TLB:TLB_shoot
> downs
>       3592 =C2=B1  4%     +72.6%       6202 =C2=B1 11%  interrupts.CPU28.=
CAL:Function_
> call_interrupts
>       4135 =C2=B1 10%     -75.4%       1018 =C2=B1  8%  interrupts.CPU28.=
TLB:TLB_shoot
> downs
>       3633 =C2=B1  7%     +70.6%       6198 =C2=B1 14%  interrupts.CPU29.=
CAL:Function_
> call_interrupts
>       2171 =C2=B1  2%      -9.5%       1965 =C2=B1  3%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>       4362 =C2=B1 12%     -76.7%       1015 =C2=B1  9%  interrupts.CPU29.=
TLB:TLB_shoot
> downs
>       3838 =C2=B1  8%     +64.6%       6316 =C2=B1  5%  interrupts.CPU3.C=
AL:Function_c
> all_interrupts
>       2284 =C2=B1  3%     -12.0%       2009 =C2=B1  2%  interrupts.CPU3.R=
ES:Rescheduli
> ng_interrupts
>       4324 =C2=B1 11%     -76.4%       1019 =C2=B1 12%  interrupts.CPU3.T=
LB:TLB_shootd
> owns
>       3647 =C2=B1  7%     +70.1%       6201 =C2=B1  9%  interrupts.CPU30.=
CAL:Function_
> call_interrupts
>       2211 =C2=B1  4%     -10.0%       1989 =C2=B1  2%  interrupts.CPU30.=
RES:Reschedul
> ing_interrupts
>       4528 =C2=B1  8%     -78.4%     978.25 =C2=B1  8%  interrupts.CPU30.=
TLB:TLB_shoot
> downs
>       3713 =C2=B1  5%     +69.5%       6292 =C2=B1 11%  interrupts.CPU31.=
CAL:Function_
> call_interrupts
>       2217 =C2=B1  2%     -10.9%       1974 =C2=B1  2%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>       4404 =C2=B1  9%     -77.6%     986.00 =C2=B1  3%  interrupts.CPU31.=
TLB:TLB_shoot
> downs
>       3610 =C2=B1  4%     +71.7%       6199 =C2=B1 11%  interrupts.CPU32.=
CAL:Function_
> call_interrupts
>       2250 =C2=B1  4%     -11.8%       1985 =C2=B1  3%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>       4336 =C2=B1 10%     -77.0%     996.75 =C2=B1  7%  interrupts.CPU32.=
TLB:TLB_shoot
> downs
>       3571 =C2=B1  6%     +71.1%       6110 =C2=B1 11%  interrupts.CPU33.=
CAL:Function_
> call_interrupts
>       2173            -9.4%       1968 =C2=B1  2%  interrupts.CPU33.RES:R=
eschedul
> ing_interrupts
>       4415 =C2=B1  7%     -77.2%       1007 =C2=B1  8%  interrupts.CPU33.=
TLB:TLB_shoot
> downs
>       3755 =C2=B1  4%     +68.0%       6307 =C2=B1 11%  interrupts.CPU34.=
CAL:Function_
> call_interrupts
>       2149 =C2=B1  2%      -9.3%       1950 =C2=B1  2%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>       4328 =C2=B1 10%     -76.3%       1026 =C2=B1  5%  interrupts.CPU34.=
TLB:TLB_shoot
> downs
>       3681 =C2=B1  7%     +72.7%       6359 =C2=B1 10%  interrupts.CPU35.=
CAL:Function_
> call_interrupts
>       2230 =C2=B1  3%     -12.2%       1957 =C2=B1  2%  interrupts.CPU35.=
RES:Reschedul
> ing_interrupts
>       4310 =C2=B1  8%     -76.3%       1022 =C2=B1 12%  interrupts.CPU35.=
TLB:TLB_shoot
> downs
>       3685 =C2=B1  4%     +71.2%       6307 =C2=B1 13%  interrupts.CPU36.=
CAL:Function_
> call_interrupts
>       2233 =C2=B1  2%     -11.2%       1983 =C2=B1  3%  interrupts.CPU36.=
RES:Reschedul
> ing_interrupts
>       4528 =C2=B1 11%     -77.8%       1006 =C2=B1  8%  interrupts.CPU36.=
TLB:TLB_shoot
> downs
>       3673 =C2=B1  6%     +70.0%       6243 =C2=B1 13%  interrupts.CPU37.=
CAL:Function_
> call_interrupts
>       2232 =C2=B1  2%     -11.3%       1980 =C2=B1  2%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>       4510 =C2=B1 13%     -77.6%       1011 =C2=B1  8%  interrupts.CPU37.=
TLB:TLB_shoot
> downs
>       3632 =C2=B1  5%     +69.9%       6170 =C2=B1  8%  interrupts.CPU38.=
CAL:Function_
> call_interrupts
>       2234 =C2=B1  3%     -11.2%       1983 =C2=B1  2%  interrupts.CPU38.=
RES:Reschedul
> ing_interrupts
>       4340 =C2=B1  8%     -76.5%       1021 =C2=B1 10%  interrupts.CPU38.=
TLB:TLB_shoot
> downs
>       3649 =C2=B1  8%     +69.4%       6182 =C2=B1 10%  interrupts.CPU39.=
CAL:Function_
> call_interrupts
>       2249 =C2=B1  2%     -12.6%       1965 =C2=B1  3%  interrupts.CPU39.=
RES:Reschedul
> ing_interrupts
>       4485 =C2=B1  8%     -78.6%     959.00 =C2=B1  9%  interrupts.CPU39.=
TLB:TLB_shoot
> downs
>       3848 =C2=B1 10%     +60.0%       6158 =C2=B1  4%  interrupts.CPU4.C=
AL:Function_c
> all_interrupts
>       2181 =C2=B1  3%      -9.0%       1986 =C2=B1  2%  interrupts.CPU4.R=
ES:Rescheduli
> ng_interrupts
>       4319 =C2=B1 11%     -72.9%       1169 =C2=B1 29%  interrupts.CPU4.T=
LB:TLB_shootd
> owns
>       3544 =C2=B1  5%     +70.8%       6052 =C2=B1 10%  interrupts.CPU40.=
CAL:Function_
> call_interrupts
>       2214 =C2=B1  2%     -11.3%       1964        interrupts.CPU40.RES:R=
eschedul
> ing_interrupts
>       4415 =C2=B1 10%     -77.5%     992.25 =C2=B1 11%  interrupts.CPU40.=
TLB:TLB_shoot
> downs
>       3664 =C2=B1  7%     +71.2%       6275 =C2=B1 10%  interrupts.CPU41.=
CAL:Function_
> call_interrupts
>       4287 =C2=B1  8%     -75.8%       1037 =C2=B1  6%  interrupts.CPU41.=
TLB:TLB_shoot
> downs
>       3688 =C2=B1  5%     +70.5%       6289 =C2=B1 11%  interrupts.CPU42.=
CAL:Function_
> call_interrupts
>       2278           -11.5%       2015 =C2=B1  2%  interrupts.CPU42.RES:R=
eschedul
> ing_interrupts
>       4468 =C2=B1  6%     -77.0%       1026 =C2=B1 12%  interrupts.CPU42.=
TLB:TLB_shoot
> downs
>       3688 =C2=B1  5%     +70.4%       6286 =C2=B1  8%  interrupts.CPU43.=
CAL:Function_
> call_interrupts
>       2265 =C2=B1  4%     -13.8%       1954 =C2=B1  2%  interrupts.CPU43.=
RES:Reschedul
> ing_interrupts
>       4380 =C2=B1  9%     -77.0%       1006 =C2=B1  6%  interrupts.CPU43.=
TLB:TLB_shoot
> downs
>       3655 =C2=B1  5%     +71.4%       6265 =C2=B1 11%  interrupts.CPU44.=
CAL:Function_
> call_interrupts
>       2241 =C2=B1  2%     -13.2%       1946        interrupts.CPU44.RES:R=
eschedul
> ing_interrupts
>       4538 =C2=B1  9%     -78.2%     987.25 =C2=B1 11%  interrupts.CPU44.=
TLB:TLB_shoot
> downs
>       3672 =C2=B1  6%     +68.8%       6197 =C2=B1 11%  interrupts.CPU45.=
CAL:Function_
> call_interrupts
>       2236 =C2=B1  2%     -12.4%       1957 =C2=B1  2%  interrupts.CPU45.=
RES:Reschedul
> ing_interrupts
>       4507 =C2=B1  9%     -77.8%       1000 =C2=B1 13%  interrupts.CPU45.=
TLB:TLB_shoot
> downs
>       3616 =C2=B1  7%     +69.4%       6125 =C2=B1 13%  interrupts.CPU46.=
CAL:Function_
> call_interrupts
>       2203 =C2=B1  2%     -12.3%       1931 =C2=B1  4%  interrupts.CPU46.=
RES:Reschedul
> ing_interrupts
>       4330 =C2=B1  9%     -77.6%     970.75 =C2=B1  6%  interrupts.CPU46.=
TLB:TLB_shoot
> downs
>       3601 =C2=B1  6%     +74.8%       6293 =C2=B1 11%  interrupts.CPU47.=
CAL:Function_
> call_interrupts
>       2167 =C2=B1  4%      -6.7%       2022 =C2=B1  4%  interrupts.CPU47.=
RES:Reschedul
> ing_interrupts
>       4383 =C2=B1  8%     -77.7%     979.00 =C2=B1 11%  interrupts.CPU47.=
TLB:TLB_shoot
> downs
>       3750 =C2=B1  8%     +62.7%       6099 =C2=B1  4%  interrupts.CPU48.=
CAL:Function_
> call_interrupts
>       2368 =C2=B1  4%      -9.6%       2141 =C2=B1  5%  interrupts.CPU48.=
RES:Reschedul
> ing_interrupts
>       4310 =C2=B1 12%     -77.6%     964.75 =C2=B1 11%  interrupts.CPU48.=
TLB:TLB_shoot
> downs
>       3705 =C2=B1  8%     +65.2%       6120 =C2=B1  4%  interrupts.CPU49.=
CAL:Function_
> call_interrupts
>       4331 =C2=B1  9%     -77.1%     992.50 =C2=B1 11%  interrupts.CPU49.=
TLB:TLB_shoot
> downs
>       3833 =C2=B1  8%     +64.9%       6322 =C2=B1  4%  interrupts.CPU5.C=
AL:Function_c
> all_interrupts
>       3612 =C2=B1 10%     +69.1%       6109 =C2=B1  4%  interrupts.CPU50.=
CAL:Function_
> call_interrupts
>       4348 =C2=B1 12%     -77.7%     970.00 =C2=B1  9%  interrupts.CPU50.=
TLB:TLB_shoot
> downs
>       3811 =C2=B1  8%     +62.0%       6172 =C2=B1  4%  interrupts.CPU51.=
CAL:Function_
> call_interrupts
>       2346 =C2=B1  3%      -8.9%       2138 =C2=B1  3%  interrupts.CPU51.=
RES:Reschedul
> ing_interrupts
>       4342 =C2=B1 11%     -77.4%     982.25 =C2=B1  2%  interrupts.CPU51.=
TLB:TLB_shoot
> downs
>       3826 =C2=B1  9%     +63.8%       6269 =C2=B1  6%  interrupts.CPU52.=
CAL:Function_
> call_interrupts
>       4544 =C2=B1 11%     -78.6%     974.25 =C2=B1  6%  interrupts.CPU52.=
TLB:TLB_shoot
> downs
>       3840 =C2=B1  8%     +61.5%       6200 =C2=B1  7%  interrupts.CPU53.=
CAL:Function_
> call_interrupts
>       4292 =C2=B1 10%     -77.0%     987.25 =C2=B1 11%  interrupts.CPU53.=
TLB:TLB_shoot
> downs
>       3694 =C2=B1  9%     +65.8%       6126 =C2=B1  6%  interrupts.CPU54.=
CAL:Function_
> call_interrupts
>       2358 =C2=B1  3%      -9.4%       2137 =C2=B1  2%  interrupts.CPU54.=
RES:Reschedul
> ing_interrupts
>       4361 =C2=B1 13%     -76.8%       1011 =C2=B1  5%  interrupts.CPU54.=
TLB:TLB_shoot
> downs
>       3769 =C2=B1  7%     +65.4%       6232 =C2=B1  6%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>       4434 =C2=B1  8%     -78.5%     955.25 =C2=B1  9%  interrupts.CPU55.=
TLB:TLB_shoot
> downs
>       3713 =C2=B1  6%     +64.6%       6111 =C2=B1  6%  interrupts.CPU56.=
CAL:Function_
> call_interrupts
>       4369 =C2=B1  8%     -78.1%     958.25 =C2=B1 11%  interrupts.CPU56.=
TLB:TLB_shoot
> downs
>       3740 =C2=B1  7%     +63.8%       6126 =C2=B1  4%  interrupts.CPU57.=
CAL:Function_
> call_interrupts
>       4526 =C2=B1 11%     -78.2%     988.50 =C2=B1 10%  interrupts.CPU57.=
TLB:TLB_shoot
> downs
>       3798 =C2=B1 10%     +63.2%       6199 =C2=B1  5%  interrupts.CPU58.=
CAL:Function_
> call_interrupts
>       4373 =C2=B1 12%     -76.9%       1011 =C2=B1  8%  interrupts.CPU58.=
TLB:TLB_shoot
> downs
>       3777 =C2=B1  7%     +64.3%       6207 =C2=B1  6%  interrupts.CPU59.=
CAL:Function_
> call_interrupts
>       4456 =C2=B1  8%     -78.5%     959.25 =C2=B1  5%  interrupts.CPU59.=
TLB:TLB_shoot
> downs
>       3903 =C2=B1 14%     +64.7%       6427 =C2=B1  8%  interrupts.CPU6.C=
AL:Function_c
> all_interrupts
>       4256 =C2=B1  8%     -77.8%     943.00 =C2=B1  9%  interrupts.CPU6.T=
LB:TLB_shootd
> owns
>       3736 =C2=B1  6%     +61.9%       6048 =C2=B1  4%  interrupts.CPU60.=
CAL:Function_
> call_interrupts
>       4534 =C2=B1  9%     -78.1%     992.75 =C2=B1 11%  interrupts.CPU60.=
TLB:TLB_shoot
> downs
>       3745 =C2=B1  9%     +64.1%       6145 =C2=B1  6%  interrupts.CPU61.=
CAL:Function_
> call_interrupts
>       4483 =C2=B1  9%     -77.0%       1029 =C2=B1  4%  interrupts.CPU61.=
TLB:TLB_shoot
> downs
>       3642 =C2=B1  7%     +65.9%       6043 =C2=B1  5%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>       4315 =C2=B1 14%     -77.3%     977.75 =C2=B1 10%  interrupts.CPU62.=
TLB:TLB_shoot
> downs
>       3779 =C2=B1  9%     +63.5%       6178 =C2=B1  5%  interrupts.CPU63.=
CAL:Function_
> call_interrupts
>       4488 =C2=B1 11%     -77.7%     998.75 =C2=B1  6%  interrupts.CPU63.=
TLB:TLB_shoot
> downs
>       3665 =C2=B1  5%     +68.0%       6160 =C2=B1  3%  interrupts.CPU64.=
CAL:Function_
> call_interrupts
>       2363 =C2=B1  2%      -9.9%       2129 =C2=B1  3%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>       4494 =C2=B1 10%     -78.6%     960.50 =C2=B1 13%  interrupts.CPU64.=
TLB:TLB_shoot
> downs
>       3694 =C2=B1  7%     +68.2%       6212 =C2=B1  6%  interrupts.CPU65.=
CAL:Function_
> call_interrupts
>       4467 =C2=B1  9%     -77.9%     986.75 =C2=B1  6%  interrupts.CPU65.=
TLB:TLB_shoot
> downs
>       3826 =C2=B1  7%     +64.0%       6274 =C2=B1  3%  interrupts.CPU66.=
CAL:Function_
> call_interrupts
>       4400 =C2=B1  8%     -77.7%     979.50 =C2=B1  5%  interrupts.CPU66.=
TLB:TLB_shoot
> downs
>       3690 =C2=B1  8%     +67.4%       6176 =C2=B1  3%  interrupts.CPU67.=
CAL:Function_
> call_interrupts
>       2354 =C2=B1  3%     -10.0%       2118 =C2=B1  3%  interrupts.CPU67.=
RES:Reschedul
> ing_interrupts
>       4523 =C2=B1 10%     -77.3%       1025 =C2=B1  6%  interrupts.CPU67.=
TLB:TLB_shoot
> downs
>       3817 =C2=B1  9%     +62.0%       6183 =C2=B1  5%  interrupts.CPU68.=
CAL:Function_
> call_interrupts
>       4356 =C2=B1 10%     -77.9%     964.50 =C2=B1  8%  interrupts.CPU68.=
TLB:TLB_shoot
> downs
>       3708 =C2=B1  9%     +70.9%       6338 =C2=B1  7%  interrupts.CPU69.=
CAL:Function_
> call_interrupts
>       4423 =C2=B1 10%     -77.9%     977.00 =C2=B1  9%  interrupts.CPU69.=
TLB:TLB_shoot
> downs
>       3693 =C2=B1  7%     +69.0%       6242 =C2=B1  5%  interrupts.CPU7.C=
AL:Function_c
> all_interrupts
>       4377 =C2=B1 10%     -78.0%     964.75 =C2=B1  8%  interrupts.CPU7.T=
LB:TLB_shootd
> owns
>       3794 =C2=B1  7%     +67.0%       6338 =C2=B1  6%  interrupts.CPU70.=
CAL:Function_
> call_interrupts
>       2361 =C2=B1  4%      -8.9%       2150 =C2=B1  3%  interrupts.CPU70.=
RES:Reschedul
> ing_interrupts
>       4433 =C2=B1  9%     -77.5%     995.75 =C2=B1  7%  interrupts.CPU70.=
TLB:TLB_shoot
> downs
>       3818 =C2=B1  9%     +66.8%       6369 =C2=B1  5%  interrupts.CPU71.=
CAL:Function_
> call_interrupts
>       4378 =C2=B1  9%     -77.8%     970.50 =C2=B1  4%  interrupts.CPU71.=
TLB:TLB_shoot
> downs
>       3653 =C2=B1  6%     +70.7%       6236 =C2=B1 10%  interrupts.CPU72.=
CAL:Function_
> call_interrupts
>       2362 =C2=B1  3%     -11.5%       2091 =C2=B1  4%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>       4325 =C2=B1  7%     -76.1%       1035 =C2=B1 12%  interrupts.CPU72.=
TLB:TLB_shoot
> downs
>       3592 =C2=B1  7%     +75.0%       6286 =C2=B1 11%  interrupts.CPU73.=
CAL:Function_
> call_interrupts
>       2384 =C2=B1  4%     -10.4%       2135 =C2=B1  2%  interrupts.CPU73.=
RES:Reschedul
> ing_interrupts
>       4571 =C2=B1  9%     -78.0%       1006 =C2=B1 14%  interrupts.CPU73.=
TLB:TLB_shoot
> downs
>       3633 =C2=B1  5%     +75.2%       6367 =C2=B1  9%  interrupts.CPU74.=
CAL:Function_
> call_interrupts
>       2379 =C2=B1  3%     -10.7%       2126        interrupts.CPU74.RES:R=
eschedul
> ing_interrupts
>       4562 =C2=B1  8%     -77.6%       1021 =C2=B1 11%  interrupts.CPU74.=
TLB:TLB_shoot
> downs
>       3586 =C2=B1  7%     +72.4%       6182 =C2=B1  9%  interrupts.CPU75.=
CAL:Function_
> call_interrupts
>       4409 =C2=B1 10%     -77.2%       1003 =C2=B1  6%  interrupts.CPU75.=
TLB:TLB_shoot
> downs
>       3683 =C2=B1  7%     +70.9%       6295 =C2=B1 13%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>       4385 =C2=B1  8%     -77.1%       1005 =C2=B1  7%  interrupts.CPU76.=
TLB:TLB_shoot
> downs
>       3661 =C2=B1  6%     +68.3%       6164 =C2=B1 11%  interrupts.CPU77.=
CAL:Function_
> call_interrupts
>       2294 =C2=B1  2%      -9.2%       2083        interrupts.CPU77.RES:R=
eschedul
> ing_interrupts
>       4432 =C2=B1  9%     -75.8%       1073 =C2=B1  9%  interrupts.CPU77.=
TLB:TLB_shoot
> downs
>       3698 =C2=B1  6%     +73.2%       6405 =C2=B1 11%  interrupts.CPU78.=
CAL:Function_
> call_interrupts
>       2379            -9.3%       2157 =C2=B1  2%  interrupts.CPU78.RES:R=
eschedul
> ing_interrupts
>       4458 =C2=B1 10%     -77.3%       1014 =C2=B1 10%  interrupts.CPU78.=
TLB:TLB_shoot
> downs
>       3661 =C2=B1  7%     +72.1%       6302 =C2=B1 13%  interrupts.CPU79.=
CAL:Function_
> call_interrupts
>       2403 =C2=B1  2%     -11.1%       2135 =C2=B1  2%  interrupts.CPU79.=
RES:Reschedul
> ing_interrupts
>       4459 =C2=B1  8%     -76.9%       1031 =C2=B1 11%  interrupts.CPU79.=
TLB:TLB_shoot
> downs
>       3869 =C2=B1  8%     +63.5%       6325 =C2=B1  5%  interrupts.CPU8.C=
AL:Function_c
> all_interrupts
>       4353 =C2=B1 11%     -78.4%     942.25 =C2=B1  9%  interrupts.CPU8.T=
LB:TLB_shootd
> owns
>       3660 =C2=B1  6%     +71.0%       6257 =C2=B1 11%  interrupts.CPU80.=
CAL:Function_
> call_interrupts
>       4380 =C2=B1 10%     -76.8%       1018 =C2=B1  8%  interrupts.CPU80.=
TLB:TLB_shoot
> downs
>       3676 =C2=B1  6%     +66.7%       6130 =C2=B1 10%  interrupts.CPU81.=
CAL:Function_
> call_interrupts
>       2333 =C2=B1  3%      -8.6%       2133        interrupts.CPU81.RES:R=
eschedul
> ing_interrupts
>       4543 =C2=B1 10%     -77.5%       1020 =C2=B1 10%  interrupts.CPU81.=
TLB:TLB_shoot
> downs
>       3761 =C2=B1  6%     +62.6%       6116 =C2=B1 10%  interrupts.CPU82.=
CAL:Function_
> call_interrupts
>       2338 =C2=B1  3%      -8.9%       2129 =C2=B1  2%  interrupts.CPU82.=
RES:Reschedul
> ing_interrupts
>       4306 =C2=B1 13%     -75.6%       1049 =C2=B1  9%  interrupts.CPU82.=
TLB:TLB_shoot
> downs
>       3685 =C2=B1  5%     +70.7%       6291 =C2=B1 11%  interrupts.CPU83.=
CAL:Function_
> call_interrupts
>       4380 =C2=B1  9%     -76.9%       1013 =C2=B1 10%  interrupts.CPU83.=
TLB:TLB_shoot
> downs
>       3674 =C2=B1  4%     +68.7%       6198 =C2=B1 13%  interrupts.CPU84.=
CAL:Function_
> call_interrupts
>       2356 =C2=B1  2%      -8.9%       2146        interrupts.CPU84.RES:R=
eschedul
> ing_interrupts
>       4598 =C2=B1 11%     -78.4%     994.25 =C2=B1  5%  interrupts.CPU84.=
TLB:TLB_shoot
> downs
>       3561 =C2=B1  2%     +79.8%       6401 =C2=B1 13%  interrupts.CPU85.=
CAL:Function_
> call_interrupts
>       2370 =C2=B1  4%      -7.5%       2192        interrupts.CPU85.RES:R=
eschedul
> ing_interrupts
>       4422 =C2=B1  9%     -76.8%       1028 =C2=B1  6%  interrupts.CPU85.=
TLB:TLB_shoot
> downs
>       3580 =C2=B1  4%     +72.0%       6160 =C2=B1  9%  interrupts.CPU86.=
CAL:Function_
> call_interrupts
>       2282 =C2=B1  3%      -7.7%       2106        interrupts.CPU86.RES:R=
eschedul
> ing_interrupts
>       4285 =C2=B1  6%     -76.0%       1030 =C2=B1 11%  interrupts.CPU86.=
TLB:TLB_shoot
> downs
>       3712 =C2=B1  6%     +62.5%       6033 =C2=B1 11%  interrupts.CPU87.=
CAL:Function_
> call_interrupts
>       2360           -10.9%       2103        interrupts.CPU87.RES:Resche=
dul
> ing_interrupts
>       4513 =C2=B1 10%     -76.5%       1060 =C2=B1  7%  interrupts.CPU87.=
TLB:TLB_shoot
> downs
>       3741 =C2=B1  9%     +66.9%       6245 =C2=B1 12%  interrupts.CPU88.=
CAL:Function_
> call_interrupts
>       4473 =C2=B1  7%     -77.2%       1019 =C2=B1 13%  interrupts.CPU88.=
TLB:TLB_shoot
> downs
>       3601 =C2=B1  5%     +72.4%       6207 =C2=B1 13%  interrupts.CPU89.=
CAL:Function_
> call_interrupts
>       4333 =C2=B1  9%     -76.8%       1003 =C2=B1  7%  interrupts.CPU89.=
TLB:TLB_shoot
> downs
>       3813 =C2=B1  6%     +58.3%       6035 =C2=B1  5%  interrupts.CPU9.C=
AL:Function_c
> all_interrupts
>       4405 =C2=B1 12%     -78.0%     970.75 =C2=B1  6%  interrupts.CPU9.T=
LB:TLB_shootd
> owns
>       3715 =C2=B1  5%     +71.9%       6387 =C2=B1 10%  interrupts.CPU90.=
CAL:Function_
> call_interrupts
>       4338 =C2=B1 10%     -76.0%       1039 =C2=B1  7%  interrupts.CPU90.=
TLB:TLB_shoot
> downs
>       3755 =C2=B1  5%     +68.8%       6340 =C2=B1  9%  interrupts.CPU91.=
CAL:Function_
> call_interrupts
>       4479 =C2=B1 11%     -77.4%       1013 =C2=B1 11%  interrupts.CPU91.=
TLB:TLB_shoot
> downs
>       3623 =C2=B1  6%     +73.1%       6273 =C2=B1 11%  interrupts.CPU92.=
CAL:Function_
> call_interrupts
>       2343            -8.8%       2137        interrupts.CPU92.RES:Resche=
dul
> ing_interrupts
>       4488 =C2=B1  8%     -77.5%       1008 =C2=B1 11%  interrupts.CPU92.=
TLB:TLB_shoot
> downs
>       3642 =C2=B1  6%     +69.0%       6156 =C2=B1  7%  interrupts.CPU93.=
CAL:Function_
> call_interrupts
>       2336 =C2=B1  3%     -10.2%       2099 =C2=B1  2%  interrupts.CPU93.=
RES:Reschedul
> ing_interrupts
>       4467 =C2=B1  6%     -76.5%       1047 =C2=B1  8%  interrupts.CPU93.=
TLB:TLB_shoot
> downs
>       3594 =C2=B1  7%     +67.7%       6027 =C2=B1 14%  interrupts.CPU94.=
CAL:Function_
> call_interrupts
>       2380 =C2=B1  4%     -12.8%       2074 =C2=B1  4%  interrupts.CPU94.=
RES:Reschedul
> ing_interrupts
>       4431 =C2=B1  9%     -77.3%       1003 =C2=B1 11%  interrupts.CPU94.=
TLB:TLB_shoot
> downs
>       3566 =C2=B1  7%     +74.3%       6215 =C2=B1 11%  interrupts.CPU95.=
CAL:Function_
> call_interrupts
>       2306 =C2=B1  3%      -9.3%       2092 =C2=B1  3%  interrupts.CPU95.=
RES:Reschedul
> ing_interrupts
>       4557 =C2=B1  9%     -77.1%       1043 =C2=B1  8%  interrupts.CPU95.=
TLB:TLB_shoot
> downs
>     219141 =C2=B1  2%      -9.5%     198307        interrupts.RES:Resched=
uling_in
> terrupts
>     423649 =C2=B1  9%     -76.7%      98503 =C2=B1  9%  interrupts.TLB:TL=
B_shootdowns
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2sp2: 96 threads Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz wi=
th
> 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
tes
> tcase/ucode:
>   gcc-9/performance/4BRD_12G/xfs/x86_64-rhel-8.3/300/RAID0/debian-10.4-x8=
6_6
> 4-20200603.cgz/lkp-csl-2sp2/sync_disk_rw/aim7/0x4002f01
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           2:4          -50%            :4     kmsg.XFS(md#):xlog_verify_g=
ran
> t_tail:space>BBTOB(tail_blocks)
>          %stddev     %change         %stddev
>              \          |                \
>      12211            +4.7%      12783        aim7.jobs-per-min
>     147.44            -4.5%     140.84        aim7.time.elapsed_time
>     147.44            -4.5%     140.84        aim7.time.elapsed_time.max
>    2129418           -14.4%    1823173        aim7.time.involuntary_conte=
xt_
> switches
>       5745            +2.9%       5909        aim7.time.system_time
>       1000 =C2=B1 17%     +40.0%       1400 =C2=B1 24%  slabinfo.kmalloc-=
rcl-128.num_o
> bjs
>      56.80            -5.5%      53.66        iostat.cpu.idle
>      42.96            +7.3%      46.10        iostat.cpu.system
>      61659 =C2=B1  4%     +14.6%      70667        meminfo.Active
>      61235 =C2=B1  4%     +14.7%      70238        meminfo.Active(anon)
>   12571651 =C2=B1 25%     -22.2%    9777428        cpuidle.C1.usage
>    4158255           +25.7%    5226775 =C2=B1 10%  cpuidle.POLL.time
>    1185158 =C2=B1  2%     +25.2%    1484219        cpuidle.POLL.usage
>      56.00            -4.9%      53.25        vmstat.cpu.id
>     492395            +4.7%     515414        vmstat.io.bo
>     819630            +6.1%     869823        vmstat.system.cs
>      15309 =C2=B1  4%     +14.6%      17551        proc-vmstat.nr_active_=
anon
>      18192 =C2=B1  4%     +13.2%      20588        proc-vmstat.nr_shmem
>      15309 =C2=B1  4%     +14.6%      17551        proc-vmstat.nr_zone_ac=
tive_ano
> n
>      17293 =C2=B1  5%     +17.8%      20368        proc-vmstat.pgactivate
>     514434            -3.1%     498475        proc-vmstat.pgfault
>     108759 =C2=B1 10%     +13.6%     123585 =C2=B1  3%  numa-meminfo.node=
0.SUnreclaim
>      60226 =C2=B1  4%     +14.4%      68876        numa-meminfo.node1.Act=
ive
>      60047 =C2=B1  4%     +14.4%      68695        numa-meminfo.node1.Act=
ive(anon
> )
>      13632 =C2=B1  4%     +34.0%      18263 =C2=B1 12%  numa-meminfo.node=
1.Mapped
>     106627 =C2=B1 10%     -13.9%      91859 =C2=B1  4%  numa-meminfo.node=
1.SUnreclaim
>      63143 =C2=B1  5%     +22.7%      77471 =C2=B1  4%  numa-meminfo.node=
1.Shmem
>       4651 =C2=B1  3%     -20.1%       3719 =C2=B1 13%  numa-vmstat.node0=
.nr_mapped
>      27188 =C2=B1 10%     +13.6%      30896 =C2=B1  3%  numa-vmstat.node0=
.nr_slab_unre
> claimable
>      15006 =C2=B1  4%     +14.4%      17166        numa-vmstat.node1.nr_a=
ctive_an
> on
>       3478 =C2=B1  5%     +34.3%       4671 =C2=B1 11%  numa-vmstat.node1=
.nr_mapped
>      15780 =C2=B1  5%     +22.7%      19361 =C2=B1  4%  numa-vmstat.node1=
.nr_shmem
>      26655 =C2=B1 10%     -13.9%      22962 =C2=B1  4%  numa-vmstat.node1=
.nr_slab_unre
> claimable
>      15006 =C2=B1  4%     +14.4%      17166        numa-vmstat.node1.nr_z=
one_acti
> ve_anon
>       1.78 =C2=B1100%    +442.2%       9.64 =C2=B1 49%  sched_debug.cfs_r=
q:/.removed.l
> oad_avg.avg
>      17.33 =C2=B1100%    +217.4%      55.00 =C2=B1 20%  sched_debug.cfs_r=
q:/.removed.l
> oad_avg.stddev
>       0.61 =C2=B1119%    +488.3%       3.56 =C2=B1 48%  sched_debug.cfs_r=
q:/.removed.r
> unnable_avg.avg
>      58.17 =C2=B1119%    +189.5%     168.42 =C2=B1 28%  sched_debug.cfs_r=
q:/.removed.r
> unnable_avg.max
>       5.91 =C2=B1119%    +286.1%      22.80 =C2=B1 27%  sched_debug.cfs_r=
q:/.removed.r
> unnable_avg.stddev
>       0.61 =C2=B1119%    +482.7%       3.53 =C2=B1 49%  sched_debug.cfs_r=
q:/.removed.u
> til_avg.avg
>      58.17 =C2=B1119%    +184.0%     165.17 =C2=B1 26%  sched_debug.cfs_r=
q:/.removed.u
> til_avg.max
>       5.91 =C2=B1119%    +280.6%      22.47 =C2=B1 27%  sched_debug.cfs_r=
q:/.removed.u
> til_avg.stddev
>     331.26 =C2=B1  8%     -18.1%     271.25 =C2=B1  4%  sched_debug.cfs_r=
q:/.runnable_
> avg.stddev
>     252.48 =C2=B1  5%     -11.3%     223.82 =C2=B1  4%  sched_debug.cfs_r=
q:/.util_avg.
> stddev
>     165889 =C2=B1  6%     -17.5%     136777 =C2=B1 10%  sched_debug.cpu.a=
vg_idle.stdde
> v
>    -601.67           -47.7%    -314.58        sched_debug.cpu.nr_uninterr=
upt
> ible.min
>     254.28 =C2=B1  5%     -30.3%     177.12 =C2=B1  4%  sched_debug.cpu.n=
r_uninterrupt
> ible.stddev
>     195651            +9.8%     214898        sched_debug.cpu.sched_goidl=
e.m
> in
>      10463 =C2=B1  6%     +19.5%      12507 =C2=B1  2%  sched_debug.cpu.t=
twu_count.std
> dev
>      10.19 =C2=B1  2%      -8.0%       9.37 =C2=B1  2%  perf-stat.i.MPKI
>  4.513e+09            +5.6%  4.768e+09        perf-stat.i.branch-instruct=
ion
> s
>       1.12            -0.0        1.10        perf-stat.i.branch-miss-rat=
e%
>   41630550            +1.4%   42211605        perf-stat.i.branch-misses
>      19.69            +1.7       21.35        perf-stat.i.cache-miss-rate%
>   41776885            +5.1%   43904140 =C2=B1  3%  perf-stat.i.cache-miss=
es
>  2.052e+08            -3.5%  1.979e+08 =C2=B1  2%  perf-stat.i.cache-refe=
rences
>     832399            +6.1%     883045        perf-stat.i.context-switches
>       6.39            +2.0%       6.51        perf-stat.i.cpi
>  1.307e+11            +7.4%  1.404e+11        perf-stat.i.cpu-cycles
>     133289           -13.7%     115043        perf-stat.i.cpu-migrations
>  4.994e+09            +4.8%  5.235e+09        perf-stat.i.dTLB-loads
>  1.526e+09            +2.9%  1.571e+09        perf-stat.i.dTLB-stores
>      38.60            -0.6       38.03        perf-stat.i.iTLB-load-miss-=
rat
> e%
>    8587848            +3.2%    8865201        perf-stat.i.iTLB-load-misses
>   14191765            +5.7%   14997829        perf-stat.i.iTLB-loads
>  1.962e+10            +5.1%  2.062e+10        perf-stat.i.instructions
>       1.36            +7.4%       1.46        perf-stat.i.metric.GHz
>     117.48            +4.7%     123.05        perf-stat.i.metric.M/sec
>   15316154            +2.9%   15758529        perf-stat.i.node-load-misses
>    1619943            +4.7%    1695785        perf-stat.i.node-loads
>    6823298            +9.6%    7479544        perf-stat.i.node-store-miss=
es
>      10.46            -8.2%       9.60 =C2=B1  2%  perf-stat.overall.MPKI
>       0.92            -0.0        0.89        perf-stat.overall.branch-mi=
ss-
> rate%
>      20.36            +1.8       22.18        perf-stat.overall.cache-mis=
s-r
> ate%
>       6.66            +2.2%       6.81        perf-stat.overall.cpi
>       0.15            -2.2%       0.15        perf-stat.overall.ipc
>      83.68            +1.1       84.80        perf-stat.overall.node-stor=
e-m
> iss-rate%
>  4.482e+09            +5.6%  4.734e+09        perf-stat.ps.branch-instruc=
tio
> ns
>   41338452            +1.4%   41901404        perf-stat.ps.branch-misses
>   41494241            +5.1%   43596155 =C2=B1  3%  perf-stat.ps.cache-mis=
ses
>  2.038e+08            -3.5%  1.965e+08 =C2=B1  2%  perf-stat.ps.cache-ref=
erences
>     826743            +6.1%     876812        perf-stat.ps.context-switch=
es
>  1.298e+11            +7.4%  1.394e+11        perf-stat.ps.cpu-cycles
>     132382           -13.7%     114234        perf-stat.ps.cpu-migrations
>   4.96e+09            +4.8%  5.198e+09        perf-stat.ps.dTLB-loads
>  1.516e+09            +2.9%   1.56e+09        perf-stat.ps.dTLB-stores
>    8529569            +3.2%    8802506        perf-stat.ps.iTLB-load-miss=
es
>   14095184            +5.6%   14891555        perf-stat.ps.iTLB-loads
>  1.948e+10            +5.1%  2.047e+10        perf-stat.ps.instructions
>   15212401            +2.9%   15647474        perf-stat.ps.node-load-miss=
es
>    1609085            +4.7%    1684545        perf-stat.ps.node-loads
>    6777001            +9.6%    7426708        perf-stat.ps.node-store-mis=
ses
>    3683980           +10.9%    4085372        interrupts.CAL:Function_cal=
l_i
> nterrupts
>      38451 =C2=B1  2%     +11.2%      42755        interrupts.CPU0.CAL:Fu=
nction_c
> all_interrupts
>       4655           -18.5%       3792 =C2=B1  4%  interrupts.CPU0.RES:Re=
scheduli
> ng_interrupts
>     251.50 =C2=B1 21%     -39.3%     152.75 =C2=B1 25%  interrupts.CPU0.T=
LB:TLB_shootd
> owns
>       4604           -23.2%       3536 =C2=B1  5%  interrupts.CPU1.RES:Re=
scheduli
> ng_interrupts
>     117.25 =C2=B1 31%     -59.9%      47.00 =C2=B1 22%  interrupts.CPU1.T=
LB:TLB_shootd
> owns
>      38140           +12.4%      42858        interrupts.CPU10.CAL:Functi=
on_
> call_interrupts
>       4437           -18.2%       3628 =C2=B1  6%  interrupts.CPU10.RES:R=
eschedul
> ing_interrupts
>      38583           +10.5%      42651        interrupts.CPU11.CAL:Functi=
on_
> call_interrupts
>       4493           -20.6%       3566 =C2=B1  4%  interrupts.CPU11.RES:R=
eschedul
> ing_interrupts
>       4492           -20.5%       3572 =C2=B1  4%  interrupts.CPU12.RES:R=
eschedul
> ing_interrupts
>      38319           +11.6%      42747        interrupts.CPU13.CAL:Functi=
on_
> call_interrupts
>       4444           -20.4%       3536 =C2=B1  3%  interrupts.CPU13.RES:R=
eschedul
> ing_interrupts
>      38243           +11.6%      42666        interrupts.CPU14.CAL:Functi=
on_
> call_interrupts
>       4507           -21.3%       3547 =C2=B1  2%  interrupts.CPU14.RES:R=
eschedul
> ing_interrupts
>      38485           +11.0%      42716        interrupts.CPU15.CAL:Functi=
on_
> call_interrupts
>       4503           -22.1%       3510 =C2=B1  2%  interrupts.CPU15.RES:R=
eschedul
> ing_interrupts
>      38453 =C2=B1  2%     +10.8%      42619        interrupts.CPU16.CAL:F=
unction_
> call_interrupts
>       4389 =C2=B1  2%     -19.8%       3519 =C2=B1  2%  interrupts.CPU16.=
RES:Reschedul
> ing_interrupts
>      38513           +10.6%      42610        interrupts.CPU17.CAL:Functi=
on_
> call_interrupts
>       4447           -19.2%       3591 =C2=B1  5%  interrupts.CPU17.RES:R=
eschedul
> ing_interrupts
>      38417 =C2=B1  2%     +11.0%      42635        interrupts.CPU18.CAL:F=
unction_
> call_interrupts
>       4526           -20.8%       3586 =C2=B1  3%  interrupts.CPU18.RES:R=
eschedul
> ing_interrupts
>      38656           +10.3%      42640        interrupts.CPU19.CAL:Functi=
on_
> call_interrupts
>       4496           -19.3%       3630 =C2=B1  3%  interrupts.CPU19.RES:R=
eschedul
> ing_interrupts
>      38534           +10.8%      42706        interrupts.CPU2.CAL:Functio=
n_c
> all_interrupts
>       4585 =C2=B1  3%     -23.1%       3528 =C2=B1  3%  interrupts.CPU2.R=
ES:Rescheduli
> ng_interrupts
>      38568           +10.6%      42662        interrupts.CPU20.CAL:Functi=
on_
> call_interrupts
>       4495           -21.4%       3533 =C2=B1  2%  interrupts.CPU20.RES:R=
eschedul
> ing_interrupts
>      38603 =C2=B1  2%     +11.0%      42857        interrupts.CPU21.CAL:F=
unction_
> call_interrupts
>       4510           -21.0%       3563 =C2=B1  4%  interrupts.CPU21.RES:R=
eschedul
> ing_interrupts
>      38514           +10.1%      42412        interrupts.CPU22.CAL:Functi=
on_
> call_interrupts
>       4404           -20.2%       3516 =C2=B1  3%  interrupts.CPU22.RES:R=
eschedul
> ing_interrupts
>      38335           +11.6%      42795        interrupts.CPU23.CAL:Functi=
on_
> call_interrupts
>       4415           -20.0%       3531 =C2=B1  3%  interrupts.CPU23.RES:R=
eschedul
> ing_interrupts
>      38150           +11.4%      42497        interrupts.CPU24.CAL:Functi=
on_
> call_interrupts
>       4369 =C2=B1  2%     -16.7%       3640 =C2=B1  2%  interrupts.CPU24.=
RES:Reschedul
> ing_interrupts
>     178.50 =C2=B1 14%     -41.2%     105.00 =C2=B1 14%  interrupts.CPU24.=
TLB:TLB_shoot
> downs
>      38172           +12.1%      42801        interrupts.CPU25.CAL:Functi=
on_
> call_interrupts
>       4406 =C2=B1  3%     -17.3%       3644 =C2=B1  2%  interrupts.CPU25.=
RES:Reschedul
> ing_interrupts
>      38375           +11.3%      42712 =C2=B1  2%  interrupts.CPU26.CAL:F=
unction_
> call_interrupts
>       4323 =C2=B1  2%     -16.1%       3627 =C2=B1  3%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>      38284           +11.3%      42618        interrupts.CPU27.CAL:Functi=
on_
> call_interrupts
>       4400 =C2=B1  2%     -19.0%       3565 =C2=B1  3%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>       4340           -16.5%       3622 =C2=B1  2%  interrupts.CPU28.RES:R=
eschedul
> ing_interrupts
>      38382           +11.4%      42761        interrupts.CPU29.CAL:Functi=
on_
> call_interrupts
>       4271           -17.3%       3530 =C2=B1  2%  interrupts.CPU29.RES:R=
eschedul
> ing_interrupts
>       4437           -19.6%       3567 =C2=B1  2%  interrupts.CPU3.RES:Re=
scheduli
> ng_interrupts
>      38712           +10.0%      42589        interrupts.CPU30.CAL:Functi=
on_
> call_interrupts
>       4294 =C2=B1  3%     -17.5%       3543 =C2=B1  2%  interrupts.CPU30.=
RES:Reschedul
> ing_interrupts
>      38397           +10.4%      42371        interrupts.CPU31.CAL:Functi=
on_
> call_interrupts
>       4355 =C2=B1  2%     -18.6%       3543 =C2=B1  2%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>       4434 =C2=B1  2%     -20.6%       3522 =C2=B1  2%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>     148.00 =C2=B1147%     -94.6%       8.00 =C2=B1 42%  interrupts.CPU32.=
TLB:TLB_shoot
> downs
>      38219           +11.6%      42649        interrupts.CPU33.CAL:Functi=
on_
> call_interrupts
>       4374           -17.5%       3608        interrupts.CPU33.RES:Resche=
dul
> ing_interrupts
>      38358           +10.9%      42537        interrupts.CPU34.CAL:Functi=
on_
> call_interrupts
>       4372 =C2=B1  3%     -19.7%       3512 =C2=B1  3%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>      38505           +11.2%      42819        interrupts.CPU35.CAL:Functi=
on_
> call_interrupts
>       4431 =C2=B1  2%     -19.1%       3585 =C2=B1  3%  interrupts.CPU35.=
RES:Reschedul
> ing_interrupts
>      38489           +11.4%      42883        interrupts.CPU36.CAL:Functi=
on_
> call_interrupts
>       4329 =C2=B1  2%     -18.2%       3542 =C2=B1  2%  interrupts.CPU36.=
RES:Reschedul
> ing_interrupts
>      38286           +10.7%      42386        interrupts.CPU37.CAL:Functi=
on_
> call_interrupts
>       4352 =C2=B1  3%     -18.9%       3529 =C2=B1  2%  interrupts.CPU37.=
RES:Reschedul
> ing_interrupts
>      38364           +11.3%      42710        interrupts.CPU38.CAL:Functi=
on_
> call_interrupts
>       4377           -19.4%       3530 =C2=B1  2%  interrupts.CPU38.RES:R=
eschedul
> ing_interrupts
>      38280           +11.5%      42685        interrupts.CPU39.CAL:Functi=
on_
> call_interrupts
>       4358           -19.4%       3513 =C2=B1  2%  interrupts.CPU39.RES:R=
eschedul
> ing_interrupts
>      38462 =C2=B1  2%     +11.0%      42705        interrupts.CPU4.CAL:Fu=
nction_c
> all_interrupts
>       4468 =C2=B1  2%     -20.4%       3556 =C2=B1  3%  interrupts.CPU4.R=
ES:Rescheduli
> ng_interrupts
>      38336           +10.7%      42442        interrupts.CPU40.CAL:Functi=
on_
> call_interrupts
>       4338           -19.2%       3504 =C2=B1  2%  interrupts.CPU40.RES:R=
eschedul
> ing_interrupts
>       4317 =C2=B1  2%     -18.9%       3502 =C2=B1  3%  interrupts.CPU41.=
RES:Reschedul
> ing_interrupts
>      38247           +11.3%      42574 =C2=B1  2%  interrupts.CPU42.CAL:F=
unction_
> call_interrupts
>       4347 =C2=B1  3%     -19.4%       3501 =C2=B1  3%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>      38378 =C2=B1  2%     +10.8%      42527        interrupts.CPU43.CAL:F=
unction_
> call_interrupts
>       4327 =C2=B1  2%     -17.0%       3590        interrupts.CPU43.RES:R=
eschedul
> ing_interrupts
>      38372           +11.2%      42663 =C2=B1  2%  interrupts.CPU44.CAL:F=
unction_
> call_interrupts
>       4333 =C2=B1  2%     -17.8%       3561 =C2=B1  3%  interrupts.CPU44.=
RES:Reschedul
> ing_interrupts
>      38090           +11.2%      42368 =C2=B1  2%  interrupts.CPU45.CAL:F=
unction_
> call_interrupts
>       4252 =C2=B1  2%     -16.8%       3537        interrupts.CPU45.RES:R=
eschedul
> ing_interrupts
>      38465           +10.4%      42473        interrupts.CPU46.CAL:Functi=
on_
> call_interrupts
>       4252           -14.8%       3624 =C2=B1  5%  interrupts.CPU46.RES:R=
eschedul
> ing_interrupts
>       4362           -19.0%       3533 =C2=B1  2%  interrupts.CPU47.RES:R=
eschedul
> ing_interrupts
>      38501 =C2=B1  2%     +10.6%      42571        interrupts.CPU48.CAL:F=
unction_
> call_interrupts
>       4505 =C2=B1  4%     -21.4%       3542 =C2=B1  4%  interrupts.CPU48.=
RES:Reschedul
> ing_interrupts
>      38615 =C2=B1  2%     +10.2%      42556        interrupts.CPU49.CAL:F=
unction_
> call_interrupts
>       4490           -20.6%       3567 =C2=B1  2%  interrupts.CPU49.RES:R=
eschedul
> ing_interrupts
>      38416 =C2=B1  2%     +11.2%      42700        interrupts.CPU5.CAL:Fu=
nction_c
> all_interrupts
>       4400           -20.2%       3512 =C2=B1  3%  interrupts.CPU5.RES:Re=
scheduli
> ng_interrupts
>      38407           +10.9%      42591        interrupts.CPU50.CAL:Functi=
on_
> call_interrupts
>       4442 =C2=B1  2%     -20.1%       3547 =C2=B1  3%  interrupts.CPU50.=
RES:Reschedul
> ing_interrupts
>      38466 =C2=B1  2%     +11.3%      42793        interrupts.CPU51.CAL:F=
unction_
> call_interrupts
>       4443           -20.1%       3550 =C2=B1  4%  interrupts.CPU51.RES:R=
eschedul
> ing_interrupts
>      38463 =C2=B1  2%     +11.1%      42749        interrupts.CPU52.CAL:F=
unction_
> call_interrupts
>       4412 =C2=B1  2%     -20.2%       3519 =C2=B1  4%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>      38371           +10.1%      42256        interrupts.CPU53.CAL:Functi=
on_
> call_interrupts
>       4458           -22.3%       3465 =C2=B1  3%  interrupts.CPU53.RES:R=
eschedul
> ing_interrupts
>      38478 =C2=B1  2%     +10.8%      42616        interrupts.CPU54.CAL:F=
unction_
> call_interrupts
>       4492 =C2=B1  2%     -21.9%       3507 =C2=B1  3%  interrupts.CPU54.=
RES:Reschedul
> ing_interrupts
>      38180           +11.1%      42410        interrupts.CPU55.CAL:Functi=
on_
> call_interrupts
>       4433 =C2=B1  2%     -21.2%       3493 =C2=B1  5%  interrupts.CPU55.=
RES:Reschedul
> ing_interrupts
>      38196 =C2=B1  2%     +11.1%      42454        interrupts.CPU56.CAL:F=
unction_
> call_interrupts
>       4447 =C2=B1  2%     -20.6%       3529 =C2=B1  2%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>      38333 =C2=B1  2%     +10.9%      42502        interrupts.CPU57.CAL:F=
unction_
> call_interrupts
>       4423 =C2=B1  2%     -20.9%       3500 =C2=B1  4%  interrupts.CPU57.=
RES:Reschedul
> ing_interrupts
>      38196           +11.0%      42386        interrupts.CPU58.CAL:Functi=
on_
> call_interrupts
>       4453           -21.7%       3488 =C2=B1  3%  interrupts.CPU58.RES:R=
eschedul
> ing_interrupts
>      38452 =C2=B1  2%     +10.4%      42454        interrupts.CPU59.CAL:F=
unction_
> call_interrupts
>       4353           -18.7%       3537 =C2=B1  6%  interrupts.CPU59.RES:R=
eschedul
> ing_interrupts
>      38584 =C2=B1  2%     +10.3%      42565        interrupts.CPU6.CAL:Fu=
nction_c
> all_interrupts
>       3271 =C2=B1 34%     +72.2%       5633        interrupts.CPU6.NMI:No=
n-maskab
> le_interrupts
>       3271 =C2=B1 34%     +72.2%       5633        interrupts.CPU6.PMI:Pe=
rformanc
> e_monitoring_interrupts
>       4479 =C2=B1  2%     -22.3%       3482 =C2=B1  5%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>      38543           +10.0%      42410        interrupts.CPU60.CAL:Functi=
on_
> call_interrupts
>       4406 =C2=B1  2%     -21.1%       3476 =C2=B1  4%  interrupts.CPU60.=
RES:Reschedul
> ing_interrupts
>      38452 =C2=B1  2%     +10.3%      42400        interrupts.CPU61.CAL:F=
unction_
> call_interrupts
>       4416           -20.8%       3499 =C2=B1  4%  interrupts.CPU61.RES:R=
eschedul
> ing_interrupts
>      38240 =C2=B1  2%     +10.6%      42288 =C2=B1  2%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>       4423           -20.7%       3508 =C2=B1  6%  interrupts.CPU62.RES:R=
eschedul
> ing_interrupts
>      38085 =C2=B1  2%     +11.1%      42324        interrupts.CPU63.CAL:F=
unction_
> call_interrupts
>       4422           -19.6%       3555 =C2=B1  2%  interrupts.CPU63.RES:R=
eschedul
> ing_interrupts
>      37921 =C2=B1  2%     +12.5%      42645        interrupts.CPU64.CAL:F=
unction_
> call_interrupts
>       4417 =C2=B1  2%     -20.2%       3526 =C2=B1  5%  interrupts.CPU64.=
RES:Reschedul
> ing_interrupts
>      38341           +10.8%      42483        interrupts.CPU65.CAL:Functi=
on_
> call_interrupts
>       4401           -20.7%       3490 =C2=B1  3%  interrupts.CPU65.RES:R=
eschedul
> ing_interrupts
>      38134           +11.6%      42548        interrupts.CPU66.CAL:Functi=
on_
> call_interrupts
>       4498           -21.4%       3536 =C2=B1  4%  interrupts.CPU66.RES:R=
eschedul
> ing_interrupts
>      38353           +11.2%      42657        interrupts.CPU67.CAL:Functi=
on_
> call_interrupts
>       3265 =C2=B1 34%     +72.1%       5618        interrupts.CPU67.NMI:N=
on-maska
> ble_interrupts
>       3265 =C2=B1 34%     +72.1%       5618        interrupts.CPU67.PMI:P=
erforman
> ce_monitoring_interrupts
>       4382           -18.7%       3563 =C2=B1  4%  interrupts.CPU67.RES:R=
eschedul
> ing_interrupts
>      38131 =C2=B1  2%     +11.6%      42535        interrupts.CPU68.CAL:F=
unction_
> call_interrupts
>       4412 =C2=B1  2%     -19.3%       3562 =C2=B1  2%  interrupts.CPU68.=
RES:Reschedul
> ing_interrupts
>      38038           +11.5%      42431        interrupts.CPU69.CAL:Functi=
on_
> call_interrupts
>       4393 =C2=B1  2%     -20.0%       3515 =C2=B1  5%  interrupts.CPU69.=
RES:Reschedul
> ing_interrupts
>      38757 =C2=B1  2%     +10.3%      42744        interrupts.CPU7.CAL:Fu=
nction_c
> all_interrupts
>       4571 =C2=B1  2%     -22.8%       3530 =C2=B1  3%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>      38012 =C2=B1  2%     +11.4%      42353        interrupts.CPU70.CAL:F=
unction_
> call_interrupts
>       4334           -17.6%       3572 =C2=B1  5%  interrupts.CPU70.RES:R=
eschedul
> ing_interrupts
>       4439 =C2=B1  3%     -20.5%       3527 =C2=B1  5%  interrupts.CPU71.=
RES:Reschedul
> ing_interrupts
>      38174 =C2=B1  2%     +11.0%      42358 =C2=B1  2%  interrupts.CPU72.=
CAL:Function_
> call_interrupts
>       4442 =C2=B1  3%     -19.2%       3589 =C2=B1  2%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>      38190           +11.0%      42403 =C2=B1  2%  interrupts.CPU73.CAL:F=
unction_
> call_interrupts
>       4454           -19.8%       3573 =C2=B1  2%  interrupts.CPU73.RES:R=
eschedul
> ing_interrupts
>      38403           +11.7%      42886 =C2=B1  2%  interrupts.CPU74.CAL:F=
unction_
> call_interrupts
>       4357           -18.0%       3573 =C2=B1  2%  interrupts.CPU74.RES:R=
eschedul
> ing_interrupts
>      38228           +10.8%      42374 =C2=B1  2%  interrupts.CPU75.CAL:F=
unction_
> call_interrupts
>       4284 =C2=B1  2%     -17.6%       3532 =C2=B1  4%  interrupts.CPU75.=
RES:Reschedul
> ing_interrupts
>      38484           +10.8%      42640        interrupts.CPU76.CAL:Functi=
on_
> call_interrupts
>       4224 =C2=B1  2%     -16.0%       3550        interrupts.CPU76.RES:R=
eschedul
> ing_interrupts
>      38525           +10.6%      42610 =C2=B1  2%  interrupts.CPU77.CAL:F=
unction_
> call_interrupts
>       4327 =C2=B1  2%     -19.1%       3499 =C2=B1  2%  interrupts.CPU77.=
RES:Reschedul
> ing_interrupts
>      38387           +10.4%      42374 =C2=B1  2%  interrupts.CPU78.CAL:F=
unction_
> call_interrupts
>       4314 =C2=B1  3%     -19.0%       3495 =C2=B1  2%  interrupts.CPU78.=
RES:Reschedul
> ing_interrupts
>      38298 =C2=B1  2%     +11.4%      42658        interrupts.CPU79.CAL:F=
unction_
> call_interrupts
>       4284           -17.5%       3536 =C2=B1  3%  interrupts.CPU79.RES:R=
eschedul
> ing_interrupts
>      38489           +10.8%      42658        interrupts.CPU8.CAL:Functio=
n_c
> all_interrupts
>       4459           -20.8%       3532 =C2=B1  3%  interrupts.CPU8.RES:Re=
scheduli
> ng_interrupts
>      38394 =C2=B1  2%     +10.8%      42549        interrupts.CPU80.CAL:F=
unction_
> call_interrupts
>       4347           -17.0%       3608 =C2=B1  4%  interrupts.CPU80.RES:R=
eschedul
> ing_interrupts
>      38311 =C2=B1  2%     +11.1%      42567        interrupts.CPU81.CAL:F=
unction_
> call_interrupts
>       4365 =C2=B1  2%     -18.2%       3570 =C2=B1  3%  interrupts.CPU81.=
RES:Reschedul
> ing_interrupts
>      38318 =C2=B1  2%     +11.3%      42634 =C2=B1  2%  interrupts.CPU82.=
CAL:Function_
> call_interrupts
>       4324 =C2=B1  2%     -18.7%       3517 =C2=B1  2%  interrupts.CPU82.=
RES:Reschedul
> ing_interrupts
>       3251 =C2=B1 34%     +72.4%       5606        interrupts.CPU83.NMI:N=
on-maska
> ble_interrupts
>       3251 =C2=B1 34%     +72.4%       5606        interrupts.CPU83.PMI:P=
erforman
> ce_monitoring_interrupts
>       4242           -17.7%       3491 =C2=B1  3%  interrupts.CPU83.RES:R=
eschedul
> ing_interrupts
>      38688            +9.8%      42478        interrupts.CPU84.CAL:Functi=
on_
> call_interrupts
>       4224 =C2=B1  3%     -15.6%       3566 =C2=B1  4%  interrupts.CPU84.=
RES:Reschedul
> ing_interrupts
>      38457           +10.2%      42373        interrupts.CPU85.CAL:Functi=
on_
> call_interrupts
>       4247 =C2=B1  2%     -16.0%       3566 =C2=B1  2%  interrupts.CPU85.=
RES:Reschedul
> ing_interrupts
>      38538           +10.8%      42696 =C2=B1  2%  interrupts.CPU86.CAL:F=
unction_
> call_interrupts
>       4416 =C2=B1  2%     -19.8%       3541 =C2=B1  2%  interrupts.CPU86.=
RES:Reschedul
> ing_interrupts
>      38467           +10.6%      42533 =C2=B1  2%  interrupts.CPU87.CAL:F=
unction_
> call_interrupts
>       4384           -19.4%       3535 =C2=B1  3%  interrupts.CPU87.RES:R=
eschedul
> ing_interrupts
>      38140           +11.8%      42644        interrupts.CPU88.CAL:Functi=
on_
> call_interrupts
>       4305 =C2=B1  3%     -17.6%       3547 =C2=B1  3%  interrupts.CPU88.=
RES:Reschedul
> ing_interrupts
>      38435           +10.6%      42493        interrupts.CPU89.CAL:Functi=
on_
> call_interrupts
>       4334 =C2=B1  3%     -20.0%       3465 =C2=B1  4%  interrupts.CPU89.=
RES:Reschedul
> ing_interrupts
>       4511           -20.5%       3586 =C2=B1  4%  interrupts.CPU9.RES:Re=
scheduli
> ng_interrupts
>      38343           +11.0%      42561        interrupts.CPU90.CAL:Functi=
on_
> call_interrupts
>       4261 =C2=B1  3%     -18.4%       3479 =C2=B1  2%  interrupts.CPU90.=
RES:Reschedul
> ing_interrupts
>      38298           +10.7%      42398 =C2=B1  2%  interrupts.CPU91.CAL:F=
unction_
> call_interrupts
>       4388           -19.0%       3553 =C2=B1  2%  interrupts.CPU91.RES:R=
eschedul
> ing_interrupts
>       4226 =C2=B1  2%     -16.7%       3520 =C2=B1  2%  interrupts.CPU92.=
RES:Reschedul
> ing_interrupts
>      37970 =C2=B1  2%     +11.9%      42482        interrupts.CPU93.CAL:F=
unction_
> call_interrupts
>       4275 =C2=B1  3%     -17.1%       3544 =C2=B1  2%  interrupts.CPU93.=
RES:Reschedul
> ing_interrupts
>      38414           +10.6%      42474        interrupts.CPU94.CAL:Functi=
on_
> call_interrupts
>       4275           -18.6%       3481 =C2=B1  2%  interrupts.CPU94.RES:R=
eschedul
> ing_interrupts
>      37973           +10.5%      41954        interrupts.CPU95.CAL:Functi=
on_
> call_interrupts
>       4249           -17.0%       3525        interrupts.CPU95.RES:Resche=
dul
> ing_interrupts
>     439732 =C2=B1  5%     +17.8%     517966        interrupts.NMI:Non-mas=
kable_in
> terrupts
>     439732 =C2=B1  5%     +17.8%     517966        interrupts.PMI:Perform=
ance_mon
> itoring_interrupts
>     421913           -19.3%     340320        interrupts.RES:Rescheduling=
_in
> terrupts
>      19.72            -1.0       18.75        perf-profile.calltrace.cycl=
es-
> pp.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered=
_ai
> o_write.new_sync_write
>      13.16            -0.9       12.21        perf-profile.calltrace.cycl=
es-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_qu=
eue
> .xlog_wait_on_iclog.__xfs_log_force_lsn
>       8.83            -0.9        7.93        perf-profile.calltrace.cycl=
es-
> pp.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_log_force_lsn.xfs_file_fsyn=
c.x
> fs_file_buffered_aio_write
>       8.63            -0.9        7.75        perf-profile.calltrace.cycl=
es-
> pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.__xfs_log_=
for
> ce_lsn.xfs_log_force_lsn
>       8.65            -0.9        7.76        perf-profile.calltrace.cycl=
es-
> pp.remove_wait_queue.xlog_wait_on_iclog.__xfs_log_force_lsn.xfs_log_force=
_ls
> n.xfs_file_fsync
>      12.74            -0.9       11.86        perf-profile.calltrace.cycl=
es-
> pp.raid0_make_request.md_handle_request.md_submit_bio.submit_bio_noacct.s=
ubm
> it_bio
>      12.72            -0.9       11.85        perf-profile.calltrace.cycl=
es-
> pp.md_flush_request.raid0_make_request.md_handle_request.md_submit_bio.su=
bmi
> t_bio_noacct
>      12.79            -0.9       11.92        perf-profile.calltrace.cycl=
es-
> pp.md_handle_request.md_submit_bio.submit_bio_noacct.submit_bio.submit_bi=
o_w
> ait
>      12.84            -0.9       11.98        perf-profile.calltrace.cycl=
es-
> pp.md_submit_bio.submit_bio_noacct.submit_bio.submit_bio_wait.blkdev_issu=
e_f
> lush
>      12.96            -0.9       12.11        perf-profile.calltrace.cycl=
es-
> pp.blkdev_issue_flush.xfs_file_fsync.xfs_file_buffered_aio_write.new_sync=
_wr
> ite.vfs_write
>      12.90            -0.9       12.05        perf-profile.calltrace.cycl=
es-
> pp.submit_bio_wait.blkdev_issue_flush.xfs_file_fsync.xfs_file_buffered_ai=
o_w
> rite.new_sync_write
>      12.88            -0.8       12.03        perf-profile.calltrace.cycl=
es-
> pp.submit_bio_noacct.submit_bio.submit_bio_wait.blkdev_issue_flush.xfs_fi=
le_
> fsync
>      12.88            -0.8       12.03        perf-profile.calltrace.cycl=
es-
> pp.submit_bio.submit_bio_wait.blkdev_issue_flush.xfs_file_fsync.xfs_file_=
buf
> fered_aio_write
>      12.00            -0.8       11.21 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.md_flush_request.r=
aid
> 0_make_request.md_handle_request
>      12.06            -0.8       11.28 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp._raw_spin_lock_irq.md_flush_request.raid0_make_request.md_handle_reque=
st.
> md_submit_bio
>       9.17            -0.6        8.55        perf-profile.calltrace.cycl=
es-
> pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_cil_force_lsn.xfs_log_fo=
rce
> _lsn.xfs_file_fsync
>       9.20            -0.6        8.57        perf-profile.calltrace.cycl=
es-
> pp.remove_wait_queue.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.=
xfs
> _file_buffered_aio_write
>       9.15            -0.6        8.53        perf-profile.calltrace.cycl=
es-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_qu=
eue
> .xlog_cil_force_lsn.xfs_log_force_lsn
>      23.94            -0.3       23.64        perf-profile.calltrace.cycl=
es-
> pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>      23.90            -0.3       23.61        perf-profile.calltrace.cycl=
es-
> pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_seco=
nda
> ry
>      26.01            -0.3       25.73        perf-profile.calltrace.cycl=
es-
> pp.secondary_startup_64_no_verify
>      23.36            -0.3       23.11        perf-profile.calltrace.cycl=
es-
> pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry
>       4.61            -0.2        4.36        perf-profile.calltrace.cycl=
es-
> pp.ret_from_fork
>       4.61            -0.2        4.36        perf-profile.calltrace.cycl=
es-
> pp.kthread.ret_from_fork
>       4.39            -0.2        4.14        perf-profile.calltrace.cycl=
es-
> pp.process_one_work.worker_thread.kthread.ret_from_fork
>       4.60            -0.2        4.35        perf-profile.calltrace.cycl=
es-
> pp.worker_thread.kthread.ret_from_fork
>       1.07 =C2=B1  2%      -0.1        0.96        perf-profile.calltrace=
.cycles-
> pp.xlog_ioend_work.process_one_work.worker_thread.kthread.ret_from_fork
>       1.09            -0.1        1.00 =C2=B1  2%  perf-profile.calltrace=
.cycles-
> pp.xlog_cil_push_work.process_one_work.worker_thread.kthread.ret_from_fork
>       0.67            -0.1        0.59        perf-profile.calltrace.cycl=
es-
> pp.xlog_write.xlog_cil_push_work.process_one_work.worker_thread.kthread
>       0.79 =C2=B1  2%      -0.1        0.72 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.xlog_state_do_callback.xlog_ioend_work.process_one_work.worker_thread.=
kth
> read
>       0.66            -0.0        0.63        perf-profile.calltrace.cycl=
es-
> pp.try_to_wake_up.swake_up_locked.complete.process_one_work.worker_thread
>       0.70            -0.0        0.67        perf-profile.calltrace.cycl=
es-
> pp.complete.process_one_work.worker_thread.kthread.ret_from_fork
>       0.68            -0.0        0.66        perf-profile.calltrace.cycl=
es-
> pp.swake_up_locked.complete.process_one_work.worker_thread.kthread
>       0.57            +0.1        0.63 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.xfs_iomap_write_unwritten.xfs_end_ioend.xfs_end_io.process_one_work.wo=
rke
> r_thread
>       0.89 =C2=B1  2%      +0.1        0.95 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.xfs_end_io.process_one_work.worker_thread.kthread.ret_from_fork
>       0.89 =C2=B1  2%      +0.1        0.95 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread.kthread
>       1.46 =C2=B1  2%      +0.1        1.52 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.__flush_work.xlog_=
cil
> _force_lsn.xfs_log_force_lsn
>       1.51 =C2=B1  2%      +0.1        1.58 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock_irq.__flush_work.xlog_cil_force_lsn.xfs_log_force_lsn.x=
fs_
> file_fsync
>       0.71 =C2=B1  5%      +0.1        0.79 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepages.__f=
ile
> map_fdatawrite_range
>       0.62 =C2=B1  6%      +0.1        0.69 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.iomap_writepage_map.write_cache_pages.iomap_writepages.xfs_vm_writepag=
es.
> do_writepages
>       0.71 =C2=B1  5%      +0.1        0.79 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.iomap_writepages.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_=
ran
> ge.file_write_and_wait_range
>       0.60            +0.1        0.70        perf-profile.calltrace.cycl=
es-
> pp.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_function_from_idle.=
do_
> idle.cpu_startup_entry
>       0.60            +0.1        0.70        perf-profile.calltrace.cycl=
es-
> pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_f=
unc
> tion_from_idle.do_idle
>       0.57            +0.1        0.67        perf-profile.calltrace.cycl=
es-
> pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.f=
lus
> h_smp_call_function_from_idle
>       0.92 =C2=B1  2%      +0.1        1.03 =C2=B1  4%  perf-profile.call=
trace.cycles-
> pp.brd_submit_bio.submit_bio_noacct.submit_bio.iomap_submit_ioend.xfs_vm_=
wri
> tepages
>       0.70            +0.1        0.81        perf-profile.calltrace.cycl=
es-
> pp.sched_ttwu_pending.flush_smp_call_function_from_idle.do_idle.cpu_start=
up_
> entry.start_secondary
>       1.10            +0.1        1.21 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.iomap_submit_ioend.xfs_vm_writepages.do_writepages.__filemap_fdatawrit=
e_r
> ange.file_write_and_wait_range
>       1.06            +0.1        1.18 =C2=B1  3%  perf-profile.calltrace=
.cycles-
> pp.submit_bio_noacct.submit_bio.iomap_submit_ioend.xfs_vm_writepages.do_w=
rit
> epages
>       1.09 =C2=B1  2%      +0.1        1.21 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.submit_bio.iomap_submit_ioend.xfs_vm_writepages.do_writepages.__filema=
p_f
> datawrite_range
>       0.82            +0.1        0.95        perf-profile.calltrace.cycl=
es-
> pp.flush_smp_call_function_from_idle.do_idle.cpu_startup_entry.start_seco=
nda
> ry.secondary_startup_64_no_verify
>       0.74 =C2=B1  4%      +0.2        0.92 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.xlog_cil_insert_items.=
xfs
> _log_commit_cil.__xfs_trans_commit
>       0.77 =C2=B1  4%      +0.2        0.95 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock.xlog_cil_insert_items.xfs_log_commit_cil.__xfs_trans_co=
mmi
> t.xfs_vn_update_time
>       1.82 =C2=B1  2%      +0.2        2.02 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.do_writepages.__filemap_fdatawrite_range.file_write_and_wait_range.xfs=
_fi
> le_fsync.xfs_file_buffered_aio_write
>       1.93 =C2=B1  2%      +0.2        2.13 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_aio_write.n=
ew_
> sync_write.vfs_write
>       1.83 =C2=B1  3%      +0.2        2.02 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync.xf=
s_f
> ile_buffered_aio_write.new_sync_write
>       0.95 =C2=B1  4%      +0.2        1.15 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.xlog_cil_insert_items.xfs_log_commit_cil.__xfs_trans_commit.xfs_vn_upd=
ate
> _time.file_update_time
>       1.81 =C2=B1  3%      +0.2        2.02 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_range.file_write_=
and
> _wait_range.xfs_file_fsync
>      66.34            +0.3       66.61        perf-profile.calltrace.cycl=
es-
> pp.xfs_file_fsync.xfs_file_buffered_aio_write.new_sync_write.vfs_write.ks=
ys_
> write
>       1.40            +0.3        1.68 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.xfs_log_commit_cil.__xfs_trans_commit.xfs_vn_update_time.file_update_t=
ime
> .xfs_file_aio_write_checks
>       1.41            +0.3        1.70 =C2=B1  4%  perf-profile.calltrace=
.cycles-
> pp.__xfs_trans_commit.xfs_vn_update_time.file_update_time.xfs_file_aio_wr=
ite
> _checks.xfs_file_buffered_aio_write
>       1.75 =C2=B1  2%      +0.3        2.05 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.xfs_vn_update_time.file_update_time.xfs_file_aio_write_checks.xfs_file=
_bu
> ffered_aio_write.new_sync_write
>       1.81 =C2=B1  2%      +0.3        2.11 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.xfs_file_aio_write_checks.xfs_file_buffered_aio_write.new_sync_write.v=
fs_
> write.ksys_write
>       1.76 =C2=B1  2%      +0.3        2.07 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.file_update_time.xfs_file_aio_write_checks.xfs_file_buffered_aio_write=
.ne
> w_sync_write.vfs_write
>       0.13 =C2=B1173%      +0.4        0.56 =C2=B1  7%  perf-profile.call=
trace.cycles-
> pp.end_page_writeback.iomap_finish_ioend.brd_submit_bio.submit_bio_noacct=
.su
> bmit_bio
>       0.14 =C2=B1173%      +0.4        0.57 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.__test_set_page_writeback.iomap_writepage_map.write_cache_pages.iomap_=
wri
> tepages.xfs_vm_writepages
>       0.13 =C2=B1173%      +0.4        0.57 =C2=B1  6%  perf-profile.call=
trace.cycles-
> pp.iomap_finish_ioend.brd_submit_bio.submit_bio_noacct.submit_bio.iomap_s=
ubm
> it_ioend
>      69.00            +0.5       69.54        perf-profile.calltrace.cycl=
es-
> pp.write
>       0.00            +0.5        0.55        perf-profile.calltrace.cycl=
es-
> pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.ttwu_do_a=
cti
> vate.sched_ttwu_pending
>      68.88            +0.5       69.43        perf-profile.calltrace.cycl=
es-
> pp.entry_SYSCALL_64_after_hwframe.write
>      68.79            +0.6       69.34        perf-profile.calltrace.cycl=
es-
> pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      68.78            +0.6       69.34        perf-profile.calltrace.cycl=
es-
> pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      68.80            +0.6       69.35        perf-profile.calltrace.cycl=
es-
> pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      68.71            +0.6       69.27        perf-profile.calltrace.cycl=
es-
> pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_aft=
er_
> hwframe
>      68.68            +0.6       69.25        perf-profile.calltrace.cycl=
es-
> pp.xfs_file_buffered_aio_write.new_sync_write.vfs_write.ksys_write.do_sys=
cal
> l_64
>      18.79            +0.8       19.56        perf-profile.calltrace.cycl=
es-
> pp.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_=
aio
> _write.new_sync_write
>      12.87 =C2=B1  2%      +1.1       14.00 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_aio_write.new_syn=
c_w
> rite.vfs_write
>       8.15 =C2=B1  2%      +1.2        9.34 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.__xfs_log_force_lsn.xf=
s_f
> ile_fsync.xfs_file_buffered_aio_write
>       8.17 =C2=B1  2%      +1.2        9.36 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp._raw_spin_lock.__xfs_log_force_lsn.xfs_file_fsync.xfs_file_buffered_ai=
o_w
> rite.new_sync_write
>       7.06 =C2=B1  3%      +1.4        8.44        perf-profile.calltrace=
.cycles-
> pp.native_queued_spin_lock_slowpath._raw_spin_lock.xlog_cil_force_lsn.xfs=
_lo
> g_force_lsn.xfs_file_fsync
>       7.13 =C2=B1  3%      +1.4        8.52        perf-profile.calltrace=
.cycles-
> pp._raw_spin_lock.xlog_cil_force_lsn.xfs_log_force_lsn.xfs_file_fsync.xfs=
_fi
> le_buffered_aio_write
>      25.99            -1.6       24.42        perf-profile.children.cycle=
s-p
> p.remove_wait_queue
>      27.85            -1.4       26.43        perf-profile.children.cycle=
s-p
> p._raw_spin_lock_irqsave
>      13.51            -1.0       12.54        perf-profile.children.cycle=
s-p
> p.xlog_wait_on_iclog
>      12.90            -0.9       12.00 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.raid0_make_request
>      12.82            -0.9       11.92        perf-profile.children.cycle=
s-p
> p.md_flush_request
>      12.98            -0.9       12.09        perf-profile.children.cycle=
s-p
> p.md_handle_request
>      13.05            -0.9       12.18        perf-profile.children.cycle=
s-p
> p.md_submit_bio
>      12.96            -0.9       12.11        perf-profile.children.cycle=
s-p
> p.blkdev_issue_flush
>      12.90            -0.9       12.05        perf-profile.children.cycle=
s-p
> p.submit_bio_wait
>      14.12            -0.8       13.36        perf-profile.children.cycle=
s-p
> p.submit_bio_noacct
>      14.09            -0.8       13.34        perf-profile.children.cycle=
s-p
> p.submit_bio
>      13.91            -0.7       13.19        perf-profile.children.cycle=
s-p
> p._raw_spin_lock_irq
>      24.22            -0.4       23.86        perf-profile.children.cycle=
s-p
> p.cpuidle_enter_state
>      24.22            -0.4       23.86        perf-profile.children.cycle=
s-p
> p.cpuidle_enter
>      23.65            -0.3       23.33        perf-profile.children.cycle=
s-p
> p.intel_idle
>      26.01            -0.3       25.73        perf-profile.children.cycle=
s-p
> p.secondary_startup_64_no_verify
>      26.01            -0.3       25.73        perf-profile.children.cycle=
s-p
> p.cpu_startup_entry
>      26.00            -0.3       25.72        perf-profile.children.cycle=
s-p
> p.do_idle
>       4.61            -0.2        4.36        perf-profile.children.cycle=
s-p
> p.ret_from_fork
>       4.61            -0.2        4.36        perf-profile.children.cycle=
s-p
> p.kthread
>       4.60            -0.2        4.35        perf-profile.children.cycle=
s-p
> p.worker_thread
>       4.39            -0.2        4.14        perf-profile.children.cycle=
s-p
> p.process_one_work
>       2.36            -0.2        2.12        perf-profile.children.cycle=
s-p
> p.try_to_wake_up
>       1.51            -0.2        1.31        perf-profile.children.cycle=
s-p
> p.__wake_up_common
>       1.53            -0.2        1.33        perf-profile.children.cycle=
s-p
> p.__wake_up_common_lock
>       1.42            -0.2        1.27        perf-profile.children.cycle=
s-p
> p.__schedule
>       1.05 =C2=B1  2%      -0.1        0.93        perf-profile.children.=
cycles-p
> p.schedule
>       0.35 =C2=B1  2%      -0.1        0.23 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.pick_next_task_fair
>       1.07 =C2=B1  2%      -0.1        0.96        perf-profile.children.=
cycles-p
> p.xlog_ioend_work
>       1.09            -0.1        1.00 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.xlog_cil_push_work
>       0.68            -0.1        0.60        perf-profile.children.cycle=
s-p
> p.xlog_write
>       0.56 =C2=B1  2%      -0.1        0.48 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xlog_state_clean_iclog
>       0.31 =C2=B1  6%      -0.1        0.24 =C2=B1 23%  perf-profile.chil=
dren.cycles-p
> p.start_kernel
>       0.79 =C2=B1  2%      -0.1        0.72 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xlog_state_do_callback
>       0.43            -0.1        0.36        perf-profile.children.cycle=
s-p
> p.select_task_rq_fair
>       0.41 =C2=B1  2%      -0.1        0.34 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.md_submit_flush_data
>       0.32 =C2=B1  2%      -0.1        0.26 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.autoremove_wake_function
>       0.34 =C2=B1  3%      -0.1        0.29        perf-profile.children.=
cycles-p
> p.xlog_state_release_iclog
>       2.05            -0.1        1.99        perf-profile.children.cycle=
s-p
> p.enqueue_task_fair
>       2.06            -0.1        2.00        perf-profile.children.cycle=
s-p
> p.ttwu_do_activate
>       0.38 =C2=B1  3%      -0.1        0.33 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.schedule_timeout
>       0.45 =C2=B1  3%      -0.1        0.39 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.wait_for_completion
>       0.31            -0.0        0.27        perf-profile.children.cycle=
s-p
> p.select_idle_sibling
>       1.12            -0.0        1.08        perf-profile.children.cycle=
s-p
> p.stack_trace_save_tsk
>       0.22            -0.0        0.18 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.prepare_to_wait_event
>       0.72            -0.0        0.68        perf-profile.children.cycle=
s-p
> p.unwind_next_frame
>       0.42            -0.0        0.39        perf-profile.children.cycle=
s-p
> p.update_load_avg
>       1.02            -0.0        0.99        perf-profile.children.cycle=
s-p
> p.arch_stack_walk
>       1.92            -0.0        1.89        perf-profile.children.cycle=
s-p
> p.enqueue_entity
>       0.42 =C2=B1  3%      -0.0        0.39 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.schedule_idle
>       0.70            -0.0        0.68 =C2=B1  2%  perf-profile.children.=
cycles-p
> p.complete
>       0.68            -0.0        0.66        perf-profile.children.cycle=
s-p
> p.swake_up_locked
>       0.27 =C2=B1  2%      -0.0        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xlog_state_done_syncing
>       0.18 =C2=B1  2%      -0.0        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.xfs_bmap_add_extent_unwritten_real
>       0.11 =C2=B1  6%      -0.0        0.09        perf-profile.children.=
cycles-p
> p.set_task_cpu
>       0.21 =C2=B1  2%      -0.0        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.xfs_bmapi_write
>       0.13 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.finish_wait
>       0.10            -0.0        0.08 =C2=B1  5%  perf-profile.children.=
cycles-p
> p.__update_load_avg_cfs_rq
>       0.18 =C2=B1  4%      -0.0        0.16 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xfs_bmapi_convert_unwritten
>       0.15            +0.0        0.16        perf-profile.children.cycle=
s-p
> p.__kernel_text_address
>       0.06 =C2=B1  6%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.__module_text_address
>       0.17 =C2=B1  4%      +0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.__sysvec_call_function_single
>       0.08 =C2=B1 13%      +0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.osq_lock
>       0.12 =C2=B1  3%      +0.0        0.15 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.ttwu_queue_wakelist
>       0.11 =C2=B1 14%      +0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.rwsem_optimistic_spin
>       0.11 =C2=B1  3%      +0.0        0.16 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.rwsem_down_read_slowpath
>       0.57            +0.1        0.63 =C2=B1  4%  perf-profile.children.=
cycles-p
> p.xfs_iomap_write_unwritten
>       0.89 =C2=B1  2%      +0.1        0.95 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xfs_end_ioend
>       0.89 =C2=B1  2%      +0.1        0.95 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.xfs_end_io
>       0.45 =C2=B1  8%      +0.1        0.53 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.sb_mark_inode_writeback
>       0.62 =C2=B1  6%      +0.1        0.69 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.iomap_writepage_map
>       0.71 =C2=B1  5%      +0.1        0.79 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.iomap_writepages
>       0.71 =C2=B1  5%      +0.1        0.79 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.write_cache_pages
>       0.49 =C2=B1  8%      +0.1        0.58 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.__test_set_page_writeback
>       0.79 =C2=B1  6%      +0.1        0.89 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.iomap_finish_ioend
>       0.97 =C2=B1  2%      +0.1        1.08 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.brd_submit_bio
>       0.53 =C2=B1  8%      +0.1        0.63 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.sb_clear_inode_writeback
>       0.59 =C2=B1  6%      +0.1        0.70 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.end_page_writeback
>       0.59 =C2=B1  7%      +0.1        0.70 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.test_clear_page_writeback
>       1.10            +0.1        1.21 =C2=B1  3%  perf-profile.children.=
cycles-p
> p.iomap_submit_ioend
>       0.86            +0.1        0.97        perf-profile.children.cycle=
s-p
> p.sched_ttwu_pending
>       0.83            +0.1        0.96        perf-profile.children.cycle=
s-p
> p.flush_smp_call_function_from_idle
>       1.93 =C2=B1  2%      +0.2        2.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.file_write_and_wait_range
>       1.83 =C2=B1  2%      +0.2        2.03 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.__filemap_fdatawrite_range
>       1.82 =C2=B1  2%      +0.2        2.02 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.do_writepages
>       1.81 =C2=B1  3%      +0.2        2.02 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xfs_vm_writepages
>       1.18 =C2=B1  4%      +0.3        1.43 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.xlog_cil_insert_items
>      66.34            +0.3       66.61        perf-profile.children.cycle=
s-p
> p.xfs_file_fsync
>       1.81 =C2=B1  2%      +0.3        2.11 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xfs_file_aio_write_checks
>       1.75 =C2=B1  2%      +0.3        2.05 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.xfs_vn_update_time
>       1.76 =C2=B1  2%      +0.3        2.07 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.file_update_time
>       1.75 =C2=B1  2%      +0.3        2.09 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__xfs_trans_commit
>       1.72 =C2=B1  2%      +0.4        2.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.xfs_log_commit_cil
>      65.02            +0.5       65.51        perf-profile.children.cycle=
s-p
> p.native_queued_spin_lock_slowpath
>      69.08            +0.5       69.61        perf-profile.children.cycle=
s-p
> p.entry_SYSCALL_64_after_hwframe
>      69.03            +0.5       69.57        perf-profile.children.cycle=
s-p
> p.write
>      68.92            +0.5       69.47        perf-profile.children.cycle=
s-p
> p.do_syscall_64
>      68.80            +0.6       69.35        perf-profile.children.cycle=
s-p
> p.ksys_write
>      68.78            +0.6       69.34        perf-profile.children.cycle=
s-p
> p.vfs_write
>      68.68            +0.6       69.25        perf-profile.children.cycle=
s-p
> p.xfs_file_buffered_aio_write
>      68.71            +0.6       69.28        perf-profile.children.cycle=
s-p
> p.new_sync_write
>      18.79            +0.8       19.56        perf-profile.children.cycle=
s-p
> p.xlog_cil_force_lsn
>      24.37            +2.7       27.06        perf-profile.children.cycle=
s-p
> p._raw_spin_lock
>      23.65            -0.3       23.33        perf-profile.self.cycles-pp=
.in
> tel_idle
>       0.38            -0.0        0.34 =C2=B1  3%  perf-profile.self.cycl=
es-pp.un
> wind_next_frame
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.__
> update_load_avg_cfs_rq
>       0.22            -0.0        0.20 =C2=B1  2%  perf-profile.self.cycl=
es-pp.up
> date_load_avg
>       0.20 =C2=B1  2%      -0.0        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp.__
> schedule
>       0.08            +0.0        0.09 =C2=B1  4%  perf-profile.self.cycl=
es-pp.xf
> s_log_commit_cil
>       0.12            +0.0        0.14 =C2=B1  3%  perf-profile.self.cycl=
es-pp.__
> list_del_entry_valid
>       0.08 =C2=B1 13%      +0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.os
> q_lock
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.xl
> og_cil_insert_items
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.fl
> ush_smp_call_function_from_idle
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.sc
> hed_ttwu_pending
>      64.81            +0.5       65.27        perf-profile.self.cycles-pp=
.na
> tive_queued_spin_lock_slowpath
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2ap3: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz wi=
th
> 192G memory
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2sp4: 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
tes
> tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/30%/debian-10.4-x86_64-20200603.cgz/3=
00s
> /lkp-csl-2sp4/shell8/unixbench/0x4002f01
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      18025           +10.5%      19926 =C2=B1  3%  unixbench.score
>     318336 =C2=B1  2%     +43.7%     457537 =C2=B1  3%  unixbench.time.in=
voluntary_con
> text_switches
>      61780 =C2=B1  3%     +28.0%      79059 =C2=B1  7%  unixbench.time.ma=
jor_page_faul
> ts
>   87844035           +10.7%   97262321 =C2=B1  3%  unixbench.time.minor_p=
age_faul
> ts
>       3533 =C2=B1  6%     +49.0%       5266 =C2=B1  2%  unixbench.time.pe=
rcent_of_cpu_
> this_job_got
>       1886 =C2=B1  7%     +57.0%       2961 =C2=B1  3%  unixbench.time.sy=
stem_time
>   13588038 =C2=B1  3%     -20.6%   10791714        unixbench.time.volunta=
ry_conte
> xt_switches
>     681360           +10.5%     753224 =C2=B1  3%  unixbench.workload
>     150156 =C2=B1  5%      -9.1%     136537 =C2=B1  3%  numa-meminfo.node=
1.Slab
>       5609 =C2=B1  2%     -19.4%       4519        uptime.idle
>       1.26 =C2=B1135%      +3.0        4.26 =C2=B1 58%  perf-profile.call=
trace.cycles-
> pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>       1.26 =C2=B1135%      +3.0        4.26 =C2=B1 58%  perf-profile.chil=
dren.cycles-p
> p.schedule_idle
>      22510           -10.7%      20097 =C2=B1  2%  slabinfo.lsm_file_cach=
e.active
> _objs
>      22510           -10.7%      20097 =C2=B1  2%  slabinfo.lsm_file_cach=
e.num_ob
> js
>   30171517 =C2=B1  2%     +10.5%   33337303 =C2=B1  3%  numa-numastat.nod=
e0.local_node
>   30194745 =C2=B1  2%     +10.4%   33345067 =C2=B1  3%  numa-numastat.nod=
e0.numa_hit
>   30370582           +10.2%   33468872 =C2=B1  3%  numa-numastat.node1.lo=
cal_node
>   30378435           +10.2%   33492206 =C2=B1  3%  numa-numastat.node1.nu=
ma_hit
>      60.55 =C2=B1  3%     -18.3       42.27 =C2=B1  2%  mpstat.cpu.all.id=
le%
>       0.00 =C2=B1  8%      -0.0        0.00 =C2=B1 14%  mpstat.cpu.all.io=
wait%
>       1.95 =C2=B1  2%      +0.2        2.14 =C2=B1  4%  mpstat.cpu.all.so=
ft%
>      31.35 =C2=B1  7%     +17.2       48.56 =C2=B1  3%  mpstat.cpu.all.sy=
s%
>       5.14            +0.8        5.97 =C2=B1  8%  mpstat.cpu.all.usr%
>      61.25 =C2=B1  3%     -29.4%      43.25        vmstat.cpu.id
>      33.00 =C2=B1  7%     +51.5%      50.00 =C2=B1  3%  vmstat.cpu.sy
>      38.25 =C2=B1 16%     +56.2%      59.75 =C2=B1  3%  vmstat.procs.r
>     433478 =C2=B1  3%     -19.0%     351103 =C2=B1  2%  vmstat.system.cs
>     197185            +1.7%     200517        vmstat.system.in
>  2.876e+08 =C2=B1  4%     -35.8%  1.845e+08 =C2=B1 21%  cpuidle.C1.time
>    4267803 =C2=B1  4%     -37.9%    2651017 =C2=B1 14%  cpuidle.C1.usage
>  3.139e+09 =C2=B1  6%     -25.5%  2.338e+09 =C2=B1  6%  cpuidle.C1E.time
>   15780409 =C2=B1  2%     -22.4%   12242614 =C2=B1  6%  cpuidle.C1E.usage
>    1653846 =C2=B1  3%     +41.4%    2338445 =C2=B1 14%  cpuidle.POLL.time
>     255160 =C2=B1 14%    +142.1%     617679 =C2=B1 26%  cpuidle.POLL.usage
>   14925900 =C2=B1  2%      +9.8%   16392797 =C2=B1  4%  numa-vmstat.node0=
.numa_hit
>   14869399 =C2=B1  2%      +9.8%   16323845 =C2=B1  4%  numa-vmstat.node0=
.numa_local
>       1422 =C2=B1 17%     -37.0%     896.25 =C2=B1 19%  numa-vmstat.node1=
.nr_active_an
> on
>       1422 =C2=B1 17%     -37.0%     895.75 =C2=B1 19%  numa-vmstat.node1=
.nr_zone_acti
> ve_anon
>   14985463            +9.0%   16338539 =C2=B1  4%  numa-vmstat.node1.numa=
_hit
>   14871226            +9.2%   16236716 =C2=B1  4%  numa-vmstat.node1.numa=
_local
>   60200712           +10.9%   66779768 =C2=B1  3%  proc-vmstat.numa_hit
>   60169613           +10.9%   66748636 =C2=B1  3%  proc-vmstat.numa_local
>      90020 =C2=B1  2%     +10.4%      99339 =C2=B1  4%  proc-vmstat.pgact=
ivate
>   64676466           +10.1%   71221293 =C2=B1  3%  proc-vmstat.pgalloc_no=
rmal
>   88407228           +10.7%   97861427 =C2=B1  3%  proc-vmstat.pgfault
>   64660677           +10.1%   71210057 =C2=B1  3%  proc-vmstat.pgfree
>    4196883           +11.1%    4662753 =C2=B1  3%  proc-vmstat.pgreuse
>       2910 =C2=B1  2%     +10.1%       3205 =C2=B1  5%  proc-vmstat.thp_f=
ault_alloc
>    1215647           +10.5%    1343578 =C2=B1  3%  proc-vmstat.unevictabl=
e_pgs_cu
> lled
>      11058 =C2=B1  5%     +48.0%      16368 =C2=B1  2%  sched_debug.cfs_r=
q:/.exec_cloc
> k.avg
>      12426 =C2=B1  5%     +43.2%      17793        sched_debug.cfs_rq:/.e=
xec_cloc
> k.max
>      10740 =C2=B1  6%     +49.6%      16064 =C2=B1  2%  sched_debug.cfs_r=
q:/.exec_cloc
> k.min
>    1391992 =C2=B1  5%     +39.8%    1946640 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.avg
>    2033775 =C2=B1  3%     +21.3%    2466806 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.max
>    1339839 =C2=B1  6%     +40.3%    1879749 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.min
>      89159 =C2=B1  4%     -13.4%      77193 =C2=B1 11%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.stddev
>       0.24 =C2=B1 25%     +59.3%       0.38 =C2=B1 11%  sched_debug.cfs_r=
q:/.nr_runnin
> g.avg
>       7.72 =C2=B1 18%     -81.1%       1.46 =C2=B1  7%  sched_debug.cfs_r=
q:/.nr_spread
> _over.avg
>      15.00 =C2=B1  7%     -63.3%       5.50 =C2=B1 27%  sched_debug.cfs_r=
q:/.nr_spread
> _over.max
>       2.00 =C2=B1 61%    -100.0%       0.00        sched_debug.cfs_rq:/.n=
r_spread
> _over.min
>       2.58 =C2=B1  3%     -53.2%       1.21 =C2=B1  7%  sched_debug.cfs_r=
q:/.nr_spread
> _over.stddev
>     675.36 =C2=B1  8%     -14.3%     578.47 =C2=B1  9%  sched_debug.cfs_r=
q:/.runnable_
> avg.avg
>       2856 =C2=B1 19%     -31.5%       1955 =C2=B1 19%  sched_debug.cfs_r=
q:/.runnable_
> avg.max
>     550.15 =C2=B1 14%     -27.0%     401.51 =C2=B1 10%  sched_debug.cfs_r=
q:/.runnable_
> avg.stddev
>      89156 =C2=B1  4%     -13.4%      77193 =C2=B1 11%  sched_debug.cfs_r=
q:/.spread0.s
> tddev
>     670.01 =C2=B1  8%     -15.2%     568.27 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_avg.
> avg
>       2825 =C2=B1 19%     -31.4%       1939 =C2=B1 19%  sched_debug.cfs_r=
q:/.util_avg.
> max
>     546.71 =C2=B1 14%     -27.3%     397.51 =C2=B1  9%  sched_debug.cfs_r=
q:/.util_avg.
> stddev
>      47.39 =C2=B1 19%     +83.7%      87.03 =C2=B1 21%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.avg
>     748.38 =C2=B1  3%     +31.0%     980.38 =C2=B1 15%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.max
>       0.24 =C2=B1 25%     +90.1%       0.45 =C2=B1 22%  sched_debug.cpu.n=
r_running.avg
>       1.38 =C2=B1 30%    +118.2%       3.00 =C2=B1 35%  sched_debug.cpu.n=
r_running.max
>       0.40 =C2=B1  9%     +38.1%       0.56 =C2=B1 20%  sched_debug.cpu.n=
r_running.std
> dev
>     140533 =C2=B1  3%     -18.8%     114182 =C2=B1  2%  sched_debug.cpu.n=
r_switches.av
> g
>     148374 =C2=B1  3%     -17.2%     122924 =C2=B1  3%  sched_debug.cpu.n=
r_switches.ma
> x
>     129273 =C2=B1  3%     -18.6%     105228 =C2=B1  2%  sched_debug.cpu.n=
r_switches.mi
> n
>       1.14 =C2=B1 20%     -46.4%       0.61 =C2=B1 22%  sched_debug.cpu.n=
r_uninterrupt
> ible.avg
>     377.75 =C2=B1  4%      -8.0%     347.50 =C2=B1  4%  sched_debug.cpu.n=
r_uninterrupt
> ible.max
>     139895 =C2=B1  3%     -18.2%     114436        sched_debug.cpu.sched_=
count.av
> g
>     144356 =C2=B1  3%     -17.8%     118726        sched_debug.cpu.sched_=
count.ma
> x
>     129430 =C2=B1  3%     -18.0%     106080 =C2=B1  2%  sched_debug.cpu.s=
ched_count.mi
> n
>      67031 =C2=B1  3%     -21.1%      52879 =C2=B1  2%  sched_debug.cpu.s=
ched_goidle.a
> vg
>      69206 =C2=B1  3%     -20.9%      54753        sched_debug.cpu.sched_=
goidle.m
> ax
>      61906 =C2=B1  3%     -20.7%      49101 =C2=B1  2%  sched_debug.cpu.s=
ched_goidle.m
> in
>       1094 =C2=B1 12%     -20.1%     874.05 =C2=B1 12%  sched_debug.cpu.s=
ched_goidle.s
> tddev
>      67782 =C2=B1  3%     -18.0%      55565        sched_debug.cpu.ttwu_c=
ount.avg
>      73968 =C2=B1  3%     -17.5%      61021 =C2=B1  3%  sched_debug.cpu.t=
twu_count.max
>      59949 =C2=B1  3%     -14.9%      51006        sched_debug.cpu.ttwu_c=
ount.min
>       2681 =C2=B1 12%     -31.6%       1832 =C2=B1  6%  sched_debug.cpu.t=
twu_count.std
> dev
>       4489           +18.5%       5320 =C2=B1  3%  sched_debug.cpu.ttwu_l=
ocal.avg
>       4981           +19.3%       5945        sched_debug.cpu.ttwu_local.=
max
>       4227 =C2=B1  2%     +18.2%       4995 =C2=B1  3%  sched_debug.cpu.t=
twu_local.min
>      11.46 =C2=B1  3%     -15.7%       9.66 =C2=B1  3%  perf-stat.i.MPKI
>  1.174e+10           +24.0%  1.455e+10        perf-stat.i.branch-instruct=
ion
> s
>       1.96 =C2=B1  2%      -0.2        1.73 =C2=B1  2%  perf-stat.i.branc=
h-miss-rate%
>  2.187e+08            +9.1%  2.386e+08 =C2=B1  2%  perf-stat.i.branch-mis=
ses
>      20.55            +1.4       21.99        perf-stat.i.cache-miss-rate%
>  1.371e+08           +11.7%  1.531e+08 =C2=B1  2%  perf-stat.i.cache-miss=
es
>    6.7e+08            +5.1%  7.044e+08 =C2=B1  2%  perf-stat.i.cache-refe=
rences
>     446372 =C2=B1  3%     -19.1%     361211 =C2=B1  2%  perf-stat.i.conte=
xt-switches
>       2.07 =C2=B1  3%     +15.9%       2.40        perf-stat.i.cpi
>  1.194e+11 =C2=B1  5%     +44.7%  1.728e+11        perf-stat.i.cpu-cycles
>     120683 =C2=B1  3%     -40.5%      71800 =C2=B1  2%  perf-stat.i.cpu-m=
igrations
>     915.24 =C2=B1  5%     +25.6%       1149 =C2=B1  4%  perf-stat.i.cycle=
s-between-cac
> he-misses
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  7%  perf-stat.i.dTLB-=
load-miss-rat
> e%
>  1.471e+10 =C2=B1  2%     +24.9%  1.836e+10        perf-stat.i.dTLB-loads
>       0.06            -0.0        0.06        perf-stat.i.dTLB-store-miss=
-ra
> te%
>    4198431            +4.8%    4398736 =C2=B1  2%  perf-stat.i.dTLB-store=
-misses
>  6.785e+09            +7.2%   7.27e+09 =C2=B1  3%  perf-stat.i.dTLB-stores
>      58.48            +1.3       59.74        perf-stat.i.iTLB-load-miss-=
rat
> e%
>  5.711e+10 =C2=B1  2%     +24.4%  7.103e+10        perf-stat.i.instructio=
ns
>       3548 =C2=B1  3%     +20.0%       4258 =C2=B1  6%  perf-stat.i.instr=
uctions-per-i
> TLB-miss
>       0.49 =C2=B1  2%     -13.3%       0.43        perf-stat.i.ipc
>     968.15 =C2=B1  3%     +27.8%       1237 =C2=B1  7%  perf-stat.i.major=
-faults
>       1.24 =C2=B1  5%     +44.7%       1.80        perf-stat.i.metric.GHz
>       0.06 =C2=B1 26%   +1216.6%       0.82        perf-stat.i.metric.K/s=
ec
>     354.10           +20.6%     426.96        perf-stat.i.metric.M/sec
>    1352948           +10.6%    1496141 =C2=B1  3%  perf-stat.i.minor-faul=
ts
>   40773848            +8.9%   44386984 =C2=B1  2%  perf-stat.i.node-load-=
misses
>    7834394           +13.7%    8906921 =C2=B1  4%  perf-stat.i.node-loads
>      78.68            +1.1       79.73        perf-stat.i.node-store-miss=
-ra
> te%
>   18681436           +12.4%   21003341 =C2=B1  2%  perf-stat.i.node-store=
-misses
>    1353916           +10.6%    1497378 =C2=B1  3%  perf-stat.i.page-faults
>      11.74 =C2=B1  3%     -15.5%       9.92 =C2=B1  3%  perf-stat.overall=
.MPKI
>       1.86 =C2=B1  2%      -0.2        1.64 =C2=B1  3%  perf-stat.overall=
.branch-miss-
> rate%
>      20.46            +1.3       21.73        perf-stat.overall.cache-mis=
s-r
> ate%
>       2.09 =C2=B1  3%     +16.4%       2.43        perf-stat.overall.cpi
>     871.34 =C2=B1  6%     +29.7%       1129 =C2=B1  4%  perf-stat.overall=
.cycles-betwe
> en-cache-misses
>       0.10 =C2=B1  3%      -0.0        0.08 =C2=B1  7%  perf-stat.overall=
.dTLB-load-mi
> ss-rate%
>       0.06            -0.0        0.06        perf-stat.overall.dTLB-stor=
e-m
> iss-rate%
>      58.76            +1.5       60.22        perf-stat.overall.iTLB-load=
-mi
> ss-rate%
>       3513 =C2=B1  3%     +21.3%       4261 =C2=B1  6%  perf-stat.overall=
.instructions
> -per-iTLB-miss
>       0.48 =C2=B1  3%     -14.2%       0.41        perf-stat.overall.ipc
>      79.59            +0.7       80.31        perf-stat.overall.node-stor=
e-m
> iss-rate%
>    5278234 =C2=B1  3%     +12.7%    5947422 =C2=B1  4%  perf-stat.overall=
.path-length
>  1.154e+10           +24.1%  1.432e+10        perf-stat.ps.branch-instruc=
tio
> ns
>   2.15e+08            +9.2%  2.348e+08 =C2=B1  3%  perf-stat.ps.branch-mi=
sses
>  1.348e+08           +11.8%  1.507e+08 =C2=B1  2%  perf-stat.ps.cache-mis=
ses
>  6.588e+08            +5.2%  6.932e+08 =C2=B1  2%  perf-stat.ps.cache-ref=
erences
>     438920 =C2=B1  3%     -19.0%     355480 =C2=B1  2%  perf-stat.ps.cont=
ext-switches
>  1.174e+11 =C2=B1  5%     +44.9%    1.7e+11        perf-stat.ps.cpu-cycles
>     118668 =C2=B1  3%     -40.5%      70662 =C2=B1  2%  perf-stat.ps.cpu-=
migrations
>  1.446e+10 =C2=B1  2%     +25.0%  1.807e+10        perf-stat.ps.dTLB-loads
>    4128171            +4.9%    4328966 =C2=B1  2%  perf-stat.ps.dTLB-stor=
e-misses
>  6.671e+09            +7.3%  7.155e+09 =C2=B1  3%  perf-stat.ps.dTLB-stor=
es
>  5.615e+10           +24.5%   6.99e+10        perf-stat.ps.instructions
>     951.89 =C2=B1  3%     +27.9%       1217 =C2=B1  7%  perf-stat.ps.majo=
r-faults
>    1330286           +10.7%    1472422 =C2=B1  3%  perf-stat.ps.minor-fau=
lts
>   40088436            +9.0%   43683157 =C2=B1  2%  perf-stat.ps.node-load=
-misses
>    7703638           +13.8%    8765828 =C2=B1  4%  perf-stat.ps.node-loads
>   18366729           +12.5%   20670236 =C2=B1  2%  perf-stat.ps.node-stor=
e-misses
>    1331238           +10.7%    1473639 =C2=B1  3%  perf-stat.ps.page-faul=
ts
>  3.595e+12           +24.4%  4.473e+12        perf-stat.total.instructions
>      38042 =C2=B1  6%     +20.6%      45891 =C2=B1  4%  softirqs.CPU0.RCU
>      35385           +20.8%      42728        softirqs.CPU1.RCU
>      13259 =C2=B1  3%      +8.3%      14360 =C2=B1  3%  softirqs.CPU1.SCH=
ED
>      34820 =C2=B1  2%     +21.8%      42396        softirqs.CPU10.RCU
>      34935           +21.9%      42579        softirqs.CPU11.RCU
>      35270           +20.1%      42363        softirqs.CPU12.RCU
>      35235           +19.6%      42127        softirqs.CPU13.RCU
>      34729           +21.8%      42287        softirqs.CPU14.RCU
>      34866 =C2=B1  2%     +20.7%      42077        softirqs.CPU15.RCU
>      35597           +20.3%      42830 =C2=B1  3%  softirqs.CPU16.RCU
>      35539           +19.4%      42436        softirqs.CPU17.RCU
>      35092           +20.5%      42275        softirqs.CPU18.RCU
>      35303           +20.9%      42690        softirqs.CPU19.RCU
>      35461           +19.7%      42459 =C2=B1  2%  softirqs.CPU2.RCU
>      35883           +16.8%      41903 =C2=B1  2%  softirqs.CPU20.RCU
>      35394           +20.2%      42544        softirqs.CPU21.RCU
>      34799 =C2=B1  3%     +21.6%      42307        softirqs.CPU22.RCU
>      35731           +17.3%      41914        softirqs.CPU23.RCU
>      35099           +21.7%      42722        softirqs.CPU24.RCU
>      12776 =C2=B1  3%      +7.2%      13702 =C2=B1  3%  softirqs.CPU24.SC=
HED
>      35089 =C2=B1  2%     +19.8%      42039        softirqs.CPU25.RCU
>      34846           +21.5%      42347        softirqs.CPU26.RCU
>      34814           +21.9%      42422        softirqs.CPU27.RCU
>      34949           +21.1%      42332 =C2=B1  2%  softirqs.CPU28.RCU
>      34807           +21.9%      42418        softirqs.CPU29.RCU
>      34923           +21.9%      42568 =C2=B1  2%  softirqs.CPU3.RCU
>      35732           +16.9%      41788        softirqs.CPU30.RCU
>      35481 =C2=B1  2%     +18.0%      41872 =C2=B1  2%  softirqs.CPU31.RCU
>      34898 =C2=B1  2%     +21.3%      42316        softirqs.CPU32.RCU
>      35106           +20.6%      42344        softirqs.CPU33.RCU
>      12451            +9.9%      13686        softirqs.CPU33.SCHED
>      34998           +20.2%      42065        softirqs.CPU34.RCU
>      12623            +8.8%      13737        softirqs.CPU34.SCHED
>      35016           +20.2%      42094        softirqs.CPU35.RCU
>      35691 =C2=B1  2%     +18.1%      42158        softirqs.CPU36.RCU
>      34803           +21.1%      42137        softirqs.CPU37.RCU
>      35265 =C2=B1  2%     +19.9%      42272        softirqs.CPU38.RCU
>      34606           +24.8%      43181 =C2=B1  5%  softirqs.CPU39.RCU
>      12516            +9.5%      13703        softirqs.CPU39.SCHED
>      34890 =C2=B1  2%     +22.7%      42803        softirqs.CPU4.RCU
>      34687           +21.2%      42042        softirqs.CPU40.RCU
>      12557            +9.7%      13772 =C2=B1  2%  softirqs.CPU40.SCHED
>      34992           +20.1%      42033        softirqs.CPU41.RCU
>      12622 =C2=B1  2%      +8.7%      13725        softirqs.CPU41.SCHED
>      34508           +22.3%      42209        softirqs.CPU42.RCU
>      12464           +10.4%      13764        softirqs.CPU42.SCHED
>      34642           +21.7%      42162 =C2=B1  2%  softirqs.CPU43.RCU
>      35145           +20.1%      42208        softirqs.CPU44.RCU
>      12384 =C2=B1  2%      +9.9%      13615        softirqs.CPU44.SCHED
>      34622 =C2=B1  2%     +20.4%      41702        softirqs.CPU45.RCU
>      34580 =C2=B1  2%     +21.5%      42031 =C2=B1  2%  softirqs.CPU46.RCU
>      35213           +19.1%      41943        softirqs.CPU47.RCU
>      34739 =C2=B1  3%     +22.3%      42480        softirqs.CPU48.RCU
>      35462 =C2=B1  2%     +20.5%      42744        softirqs.CPU49.RCU
>      35081           +21.6%      42655        softirqs.CPU5.RCU
>      35459           +20.2%      42618        softirqs.CPU50.RCU
>      35570           +19.9%      42654        softirqs.CPU51.RCU
>      36258 =C2=B1  2%     +17.5%      42620        softirqs.CPU52.RCU
>      35712 =C2=B1  2%     +20.1%      42888        softirqs.CPU53.RCU
>      35942           +20.3%      43236 =C2=B1  2%  softirqs.CPU54.RCU
>      35491 =C2=B1  2%     +20.8%      42888        softirqs.CPU55.RCU
>      35929 =C2=B1  3%     +19.7%      43006        softirqs.CPU56.RCU
>      35926           +19.3%      42844        softirqs.CPU57.RCU
>      35673 =C2=B1  2%     +19.9%      42768        softirqs.CPU58.RCU
>      35815           +19.3%      42732        softirqs.CPU59.RCU
>      34952           +19.6%      41804 =C2=B1  2%  softirqs.CPU6.RCU
>      35953           +19.4%      42926        softirqs.CPU60.RCU
>      34841 =C2=B1  4%     +23.2%      42933        softirqs.CPU61.RCU
>      12642            +9.3%      13815 =C2=B1  2%  softirqs.CPU61.SCHED
>      35535           +20.2%      42730        softirqs.CPU62.RCU
>      35620           +20.4%      42895        softirqs.CPU63.RCU
>      35771           +19.4%      42694 =C2=B1  2%  softirqs.CPU64.RCU
>      35931           +20.8%      43414        softirqs.CPU65.RCU
>      12646            +8.6%      13735        softirqs.CPU65.SCHED
>      35736           +21.7%      43497        softirqs.CPU66.RCU
>      35900           +20.5%      43267        softirqs.CPU67.RCU
>      36311 =C2=B1  2%     +18.4%      43011 =C2=B1  2%  softirqs.CPU68.RCU
>      36327 =C2=B1  2%     +19.6%      43444        softirqs.CPU69.RCU
>      35030 =C2=B1  2%     +21.4%      42539        softirqs.CPU7.RCU
>      36533           +20.0%      43843 =C2=B1  2%  softirqs.CPU70.RCU
>      12706            +9.1%      13860 =C2=B1  2%  softirqs.CPU70.SCHED
>      36222           +19.4%      43241 =C2=B1  2%  softirqs.CPU71.RCU
>      12502 =C2=B1  2%      +9.3%      13669 =C2=B1  4%  softirqs.CPU71.SC=
HED
>      35988           +20.1%      43218 =C2=B1  2%  softirqs.CPU72.RCU
>      35387 =C2=B1  2%     +20.9%      42767        softirqs.CPU73.RCU
>      35598           +21.2%      43143        softirqs.CPU74.RCU
>      12718            +9.0%      13858 =C2=B1  2%  softirqs.CPU74.SCHED
>      35415           +20.6%      42721        softirqs.CPU75.RCU
>      35838           +18.9%      42629        softirqs.CPU76.RCU
>      35821           +19.3%      42741        softirqs.CPU77.RCU
>      36213 =C2=B1  5%     +18.3%      42843        softirqs.CPU78.RCU
>      35947           +19.6%      43007        softirqs.CPU79.RCU
>      12528 =C2=B1  2%      +9.7%      13739        softirqs.CPU79.SCHED
>      34836           +22.1%      42527        softirqs.CPU8.RCU
>      35541           +20.0%      42654        softirqs.CPU80.RCU
>      35370           +20.5%      42624        softirqs.CPU81.RCU
>      35667           +18.9%      42419        softirqs.CPU82.RCU
>      35483           +19.8%      42502        softirqs.CPU83.RCU
>      35340           +20.7%      42669        softirqs.CPU84.RCU
>      35539           +19.5%      42458 =C2=B1  2%  softirqs.CPU85.RCU
>      35116           +21.2%      42547        softirqs.CPU86.RCU
>      12572            +9.8%      13806 =C2=B1  2%  softirqs.CPU86.SCHED
>      35468           +20.0%      42564        softirqs.CPU87.RCU
>      35993           +21.7%      43798 =C2=B1  4%  softirqs.CPU88.RCU
>      35515           +20.3%      42729        softirqs.CPU89.RCU
>      34859 =C2=B1  2%     +20.2%      41888        softirqs.CPU9.RCU
>      35329           +20.2%      42478        softirqs.CPU90.RCU
>      35239           +21.4%      42768 =C2=B1  2%  softirqs.CPU91.RCU
>      35290           +20.4%      42498 =C2=B1  2%  softirqs.CPU92.RCU
>      12537           +10.0%      13786        softirqs.CPU92.SCHED
>      35008 =C2=B1  2%     +22.2%      42787        softirqs.CPU93.RCU
>      12386 =C2=B1  3%     +13.9%      14103 =C2=B1  4%  softirqs.CPU93.SC=
HED
>      35580 =C2=B1  3%     +16.8%      41570 =C2=B1  2%  softirqs.CPU94.RCU
>      35585           +19.7%      42584 =C2=B1  2%  softirqs.CPU95.RCU
>    3398233           +20.3%    4089577        softirqs.RCU
>     366761 =C2=B1  6%     +65.6%     607452 =C2=B1  5%  interrupts.CAL:Fu=
nction_call_i
> nterrupts
>       4551 =C2=B1 16%     +51.7%       6905 =C2=B1  8%  interrupts.CPU0.C=
AL:Function_c
> all_interrupts
>       2207 =C2=B1  3%      -9.5%       1998 =C2=B1  4%  interrupts.CPU0.R=
ES:Rescheduli
> ng_interrupts
>       4288 =C2=B1 13%     -77.6%     961.00 =C2=B1 12%  interrupts.CPU0.T=
LB:TLB_shootd
> owns
>       4288 =C2=B1 13%     +50.0%       6433 =C2=B1  9%  interrupts.CPU1.C=
AL:Function_c
> all_interrupts
>       2223 =C2=B1  4%     -10.4%       1992        interrupts.CPU1.RES:Re=
scheduli
> ng_interrupts
>       4459 =C2=B1 10%     -78.7%     949.25 =C2=B1 16%  interrupts.CPU1.T=
LB:TLB_shootd
> owns
>       3848 =C2=B1  6%     +60.6%       6181 =C2=B1  6%  interrupts.CPU10.=
CAL:Function_
> call_interrupts
>       4332 =C2=B1  9%     -78.4%     937.50 =C2=B1 11%  interrupts.CPU10.=
TLB:TLB_shoot
> downs
>       3865 =C2=B1  7%     +61.1%       6227 =C2=B1  6%  interrupts.CPU11.=
CAL:Function_
> call_interrupts
>       4244 =C2=B1 14%     -77.8%     943.25 =C2=B1 16%  interrupts.CPU11.=
TLB:TLB_shoot
> downs
>       3764 =C2=B1  6%     +65.6%       6236 =C2=B1  4%  interrupts.CPU12.=
CAL:Function_
> call_interrupts
>       4398 =C2=B1  7%     -78.2%     958.75 =C2=B1 11%  interrupts.CPU12.=
TLB:TLB_shoot
> downs
>       3967 =C2=B1  5%     +55.8%       6180 =C2=B1  6%  interrupts.CPU13.=
CAL:Function_
> call_interrupts
>       4434 =C2=B1 12%     -79.1%     925.50 =C2=B1 13%  interrupts.CPU13.=
TLB:TLB_shoot
> downs
>       3780 =C2=B1  8%     +59.6%       6033 =C2=B1  7%  interrupts.CPU14.=
CAL:Function_
> call_interrupts
>       2190           -10.3%       1966 =C2=B1  4%  interrupts.CPU14.RES:R=
eschedul
> ing_interrupts
>       4392 =C2=B1  8%     -77.9%     972.00 =C2=B1 12%  interrupts.CPU14.=
TLB:TLB_shoot
> downs
>       3933 =C2=B1  8%     +54.7%       6086 =C2=B1  5%  interrupts.CPU15.=
CAL:Function_
> call_interrupts
>       4054 =C2=B1  8%     -75.8%     980.25 =C2=B1 12%  interrupts.CPU15.=
TLB:TLB_shoot
> downs
>       3813 =C2=B1 10%     +59.1%       6066 =C2=B1  5%  interrupts.CPU16.=
CAL:Function_
> call_interrupts
>       4191 =C2=B1  9%     -76.9%     967.00 =C2=B1 13%  interrupts.CPU16.=
TLB:TLB_shoot
> downs
>       3909 =C2=B1  9%     +58.4%       6193 =C2=B1  6%  interrupts.CPU17.=
CAL:Function_
> call_interrupts
>       4316 =C2=B1 11%     -77.4%     975.00 =C2=B1  8%  interrupts.CPU17.=
TLB:TLB_shoot
> downs
>       3843 =C2=B1  3%     +60.6%       6173 =C2=B1  6%  interrupts.CPU18.=
CAL:Function_
> call_interrupts
>       2223 =C2=B1  5%     -11.6%       1965 =C2=B1  3%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>       4485 =C2=B1  9%     -75.2%       1113 =C2=B1 20%  interrupts.CPU18.=
TLB:TLB_shoot
> downs
>       3845 =C2=B1  6%     +60.7%       6177 =C2=B1  7%  interrupts.CPU19.=
CAL:Function_
> call_interrupts
>       2188 =C2=B1  3%      -8.7%       1997 =C2=B1  3%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>       4333 =C2=B1 11%     -78.1%     949.25 =C2=B1 13%  interrupts.CPU19.=
TLB:TLB_shoot
> downs
>       3771 =C2=B1  9%     +65.7%       6247 =C2=B1  9%  interrupts.CPU2.C=
AL:Function_c
> all_interrupts
>       4424 =C2=B1  9%     -78.4%     955.75 =C2=B1 14%  interrupts.CPU2.T=
LB:TLB_shootd
> owns
>       3797 =C2=B1  7%     +58.7%       6028 =C2=B1  8%  interrupts.CPU20.=
CAL:Function_
> call_interrupts
>       2199 =C2=B1  3%     -10.3%       1972        interrupts.CPU20.RES:R=
eschedul
> ing_interrupts
>       4262 =C2=B1 11%     -77.1%     974.25 =C2=B1 13%  interrupts.CPU20.=
TLB:TLB_shoot
> downs
>       3859 =C2=B1  6%     +61.1%       6217 =C2=B1  8%  interrupts.CPU21.=
CAL:Function_
> call_interrupts
>       2207 =C2=B1  2%      -9.8%       1991 =C2=B1  3%  interrupts.CPU21.=
RES:Reschedul
> ing_interrupts
>       3827 =C2=B1  5%     +63.1%       6242 =C2=B1  7%  interrupts.CPU22.=
CAL:Function_
> call_interrupts
>       4201 =C2=B1  6%     -77.9%     929.50 =C2=B1 13%  interrupts.CPU22.=
TLB:TLB_shoot
> downs
>       4049 =C2=B1  9%     +56.6%       6340 =C2=B1  9%  interrupts.CPU23.=
CAL:Function_
> call_interrupts
>       2172 =C2=B1  2%     -10.7%       1939 =C2=B1  3%  interrupts.CPU23.=
RES:Reschedul
> ing_interrupts
>       4159 =C2=B1 12%     -76.9%     960.25 =C2=B1  8%  interrupts.CPU23.=
TLB:TLB_shoot
> downs
>       3843 =C2=B1  8%     +72.9%       6646 =C2=B1  8%  interrupts.CPU24.=
CAL:Function_
> call_interrupts
>       4231 =C2=B1  6%     -76.4%     997.50 =C2=B1 12%  interrupts.CPU24.=
TLB:TLB_shoot
> downs
>       3779 =C2=B1 11%     +71.5%       6481 =C2=B1  7%  interrupts.CPU25.=
CAL:Function_
> call_interrupts
>       4211 =C2=B1 10%     -76.2%       1003 =C2=B1 10%  interrupts.CPU25.=
TLB:TLB_shoot
> downs
>       3771 =C2=B1  8%     +71.0%       6449 =C2=B1  7%  interrupts.CPU26.=
CAL:Function_
> call_interrupts
>       2205 =C2=B1  3%     -10.6%       1972 =C2=B1  2%  interrupts.CPU26.=
RES:Reschedul
> ing_interrupts
>       4207 =C2=B1  5%     -77.1%     964.00 =C2=B1 14%  interrupts.CPU26.=
TLB:TLB_shoot
> downs
>       3754 =C2=B1  5%     +73.5%       6513 =C2=B1  9%  interrupts.CPU27.=
CAL:Function_
> call_interrupts
>       2195 =C2=B1  3%     -10.0%       1974 =C2=B1  2%  interrupts.CPU27.=
RES:Reschedul
> ing_interrupts
>       4305 =C2=B1 11%     -77.1%     984.00 =C2=B1  9%  interrupts.CPU27.=
TLB:TLB_shoot
> downs
>       3746 =C2=B1  9%     +70.5%       6386 =C2=B1  5%  interrupts.CPU28.=
CAL:Function_
> call_interrupts
>       2192           -10.6%       1960 =C2=B1  4%  interrupts.CPU28.RES:R=
eschedul
> ing_interrupts
>       4386 =C2=B1  6%     -78.4%     945.50 =C2=B1 12%  interrupts.CPU28.=
TLB:TLB_shoot
> downs
>       3801 =C2=B1  7%     +68.2%       6394 =C2=B1  9%  interrupts.CPU29.=
CAL:Function_
> call_interrupts
>       2207 =C2=B1  3%      -9.9%       1988 =C2=B1  3%  interrupts.CPU29.=
RES:Reschedul
> ing_interrupts
>       4238 =C2=B1  7%     -77.6%     948.75 =C2=B1  7%  interrupts.CPU29.=
TLB:TLB_shoot
> downs
>       4121 =C2=B1 11%     +51.6%       6250 =C2=B1  4%  interrupts.CPU3.C=
AL:Function_c
> all_interrupts
>       2215            -9.5%       2005 =C2=B1  2%  interrupts.CPU3.RES:Re=
scheduli
> ng_interrupts
>       4356 =C2=B1  9%     -76.0%       1046 =C2=B1 21%  interrupts.CPU3.T=
LB:TLB_shootd
> owns
>       3844 =C2=B1  9%     +70.3%       6546 =C2=B1  9%  interrupts.CPU30.=
CAL:Function_
> call_interrupts
>       2219 =C2=B1  3%     -11.1%       1971        interrupts.CPU30.RES:R=
eschedul
> ing_interrupts
>       4220 =C2=B1  9%     -76.6%     989.25 =C2=B1 14%  interrupts.CPU30.=
TLB:TLB_shoot
> downs
>       3844 =C2=B1  9%     +71.1%       6578 =C2=B1  8%  interrupts.CPU31.=
CAL:Function_
> call_interrupts
>       2222 =C2=B1  2%     -10.2%       1994 =C2=B1  2%  interrupts.CPU31.=
RES:Reschedul
> ing_interrupts
>       4336 =C2=B1  4%     -78.2%     944.00 =C2=B1 11%  interrupts.CPU31.=
TLB:TLB_shoot
> downs
>       3791 =C2=B1 10%     +70.8%       6476 =C2=B1  8%  interrupts.CPU32.=
CAL:Function_
> call_interrupts
>       2224 =C2=B1  4%     -11.6%       1966 =C2=B1  2%  interrupts.CPU32.=
RES:Reschedul
> ing_interrupts
>       4231 =C2=B1  5%     -76.8%     980.00 =C2=B1 11%  interrupts.CPU32.=
TLB:TLB_shoot
> downs
>       3780 =C2=B1  8%     +74.6%       6601 =C2=B1 10%  interrupts.CPU33.=
CAL:Function_
> call_interrupts
>       2189 =C2=B1  3%     -11.4%       1940        interrupts.CPU33.RES:R=
eschedul
> ing_interrupts
>       4269 =C2=B1  8%     -77.2%     974.75 =C2=B1 11%  interrupts.CPU33.=
TLB:TLB_shoot
> downs
>       3758 =C2=B1 10%     +73.3%       6513 =C2=B1  8%  interrupts.CPU34.=
CAL:Function_
> call_interrupts
>       2151 =C2=B1  4%      -9.1%       1955 =C2=B1  3%  interrupts.CPU34.=
RES:Reschedul
> ing_interrupts
>       4287 =C2=B1 10%     -77.2%     975.50 =C2=B1  9%  interrupts.CPU34.=
TLB:TLB_shoot
> downs
>       3802 =C2=B1  7%     +71.9%       6536 =C2=B1  9%  interrupts.CPU35.=
CAL:Function_
> call_interrupts
>       4097 =C2=B1  8%     -76.3%     969.75 =C2=B1 13%  interrupts.CPU35.=
TLB:TLB_shoot
> downs
>       3748 =C2=B1  9%     +73.8%       6514 =C2=B1  7%  interrupts.CPU36.=
CAL:Function_
> call_interrupts
>       2204 =C2=B1  2%     -11.4%       1953        interrupts.CPU36.RES:R=
eschedul
> ing_interrupts
>       4332 =C2=B1 10%     -77.3%     984.00 =C2=B1 11%  interrupts.CPU36.=
TLB:TLB_shoot
> downs
>       3736 =C2=B1  9%     +68.9%       6310 =C2=B1  8%  interrupts.CPU37.=
CAL:Function_
> call_interrupts
>       4142 =C2=B1  7%     -76.6%     967.75 =C2=B1 12%  interrupts.CPU37.=
TLB:TLB_shoot
> downs
>       3720 =C2=B1  8%     +73.8%       6467 =C2=B1  9%  interrupts.CPU38.=
CAL:Function_
> call_interrupts
>       4253 =C2=B1  8%     -76.9%     981.75 =C2=B1 10%  interrupts.CPU38.=
TLB:TLB_shoot
> downs
>       3759 =C2=B1  6%     +70.3%       6404 =C2=B1 10%  interrupts.CPU39.=
CAL:Function_
> call_interrupts
>       4169 =C2=B1  2%     -76.3%     989.25 =C2=B1 12%  interrupts.CPU39.=
TLB:TLB_shoot
> downs
>       3910 =C2=B1  8%     +68.6%       6592 =C2=B1 10%  interrupts.CPU4.C=
AL:Function_c
> all_interrupts
>       4453 =C2=B1 12%     -78.6%     951.25 =C2=B1 10%  interrupts.CPU4.T=
LB:TLB_shootd
> owns
>       3751 =C2=B1  9%     +74.3%       6539 =C2=B1 11%  interrupts.CPU40.=
CAL:Function_
> call_interrupts
>       4059 =C2=B1 10%     -76.8%     942.50 =C2=B1  9%  interrupts.CPU40.=
TLB:TLB_shoot
> downs
>       3853 =C2=B1 10%     +69.1%       6517 =C2=B1  6%  interrupts.CPU41.=
CAL:Function_
> call_interrupts
>       4149 =C2=B1 10%     -76.1%     991.75 =C2=B1  9%  interrupts.CPU41.=
TLB:TLB_shoot
> downs
>       3801 =C2=B1  8%     +69.3%       6434 =C2=B1  8%  interrupts.CPU42.=
CAL:Function_
> call_interrupts
>       2239 =C2=B1  5%      -9.2%       2032 =C2=B1  3%  interrupts.CPU42.=
RES:Reschedul
> ing_interrupts
>       4355 =C2=B1  8%     -77.2%     992.00 =C2=B1 12%  interrupts.CPU42.=
TLB:TLB_shoot
> downs
>       3804 =C2=B1  9%     +67.6%       6374 =C2=B1  6%  interrupts.CPU43.=
CAL:Function_
> call_interrupts
>       2191 =C2=B1  2%     -10.0%       1973 =C2=B1  3%  interrupts.CPU43.=
RES:Reschedul
> ing_interrupts
>       4301 =C2=B1  6%     -78.1%     941.25 =C2=B1 13%  interrupts.CPU43.=
TLB:TLB_shoot
> downs
>       3843 =C2=B1  7%     +70.0%       6532 =C2=B1  8%  interrupts.CPU44.=
CAL:Function_
> call_interrupts
>       2170 =C2=B1  3%      -9.8%       1957 =C2=B1  2%  interrupts.CPU44.=
RES:Reschedul
> ing_interrupts
>       4211 =C2=B1  8%     -77.1%     965.00 =C2=B1 11%  interrupts.CPU44.=
TLB:TLB_shoot
> downs
>       3803 =C2=B1  8%     +68.1%       6395 =C2=B1 11%  interrupts.CPU45.=
CAL:Function_
> call_interrupts
>       2178 =C2=B1  4%     -11.5%       1927        interrupts.CPU45.RES:R=
eschedul
> ing_interrupts
>       4089 =C2=B1  6%     -73.5%       1085 =C2=B1 25%  interrupts.CPU45.=
TLB:TLB_shoot
> downs
>       3641 =C2=B1  7%     +76.0%       6409 =C2=B1  7%  interrupts.CPU46.=
CAL:Function_
> call_interrupts
>       2118 =C2=B1  4%     -10.0%       1905 =C2=B1  4%  interrupts.CPU46.=
RES:Reschedul
> ing_interrupts
>       4189 =C2=B1  5%     -75.9%       1009 =C2=B1 11%  interrupts.CPU46.=
TLB:TLB_shoot
> downs
>       3793 =C2=B1 12%     +71.8%       6518 =C2=B1  8%  interrupts.CPU47.=
CAL:Function_
> call_interrupts
>       2145 =C2=B1  4%      -7.8%       1979        interrupts.CPU47.RES:R=
eschedul
> ing_interrupts
>       4236 =C2=B1  8%     -76.8%     984.50 =C2=B1 17%  interrupts.CPU47.=
TLB:TLB_shoot
> downs
>       3758 =C2=B1  7%     +62.4%       6103 =C2=B1  7%  interrupts.CPU48.=
CAL:Function_
> call_interrupts
>       4215 =C2=B1 10%     -76.0%       1011 =C2=B1  9%  interrupts.CPU48.=
TLB:TLB_shoot
> downs
>       3845 =C2=B1  6%     +59.8%       6143 =C2=B1  5%  interrupts.CPU49.=
CAL:Function_
> call_interrupts
>       4333 =C2=B1  6%     -78.2%     945.50 =C2=B1 12%  interrupts.CPU49.=
TLB:TLB_shoot
> downs
>       3845 =C2=B1  5%     +61.8%       6220 =C2=B1  6%  interrupts.CPU5.C=
AL:Function_c
> all_interrupts
>       4258 =C2=B1  6%     -77.3%     968.75 =C2=B1  7%  interrupts.CPU5.T=
LB:TLB_shootd
> owns
>       3856 =C2=B1  6%     +56.0%       6018 =C2=B1  6%  interrupts.CPU50.=
CAL:Function_
> call_interrupts
>       4088 =C2=B1 12%     -76.2%     972.00 =C2=B1  9%  interrupts.CPU50.=
TLB:TLB_shoot
> downs
>       3754 =C2=B1  8%     +65.0%       6196 =C2=B1  7%  interrupts.CPU51.=
CAL:Function_
> call_interrupts
>       2374           -12.5%       2076 =C2=B1  5%  interrupts.CPU51.RES:R=
eschedul
> ing_interrupts
>       4533 =C2=B1 10%     -78.9%     954.25 =C2=B1  8%  interrupts.CPU51.=
TLB:TLB_shoot
> downs
>       3834 =C2=B1  5%     +56.8%       6013 =C2=B1  6%  interrupts.CPU52.=
CAL:Function_
> call_interrupts
>       2345 =C2=B1  2%      -9.6%       2119 =C2=B1  2%  interrupts.CPU52.=
RES:Reschedul
> ing_interrupts
>       4242 =C2=B1 12%     -77.3%     961.50 =C2=B1 12%  interrupts.CPU52.=
TLB:TLB_shoot
> downs
>       3827 =C2=B1  4%     +64.1%       6281 =C2=B1  7%  interrupts.CPU53.=
CAL:Function_
> call_interrupts
>       4190 =C2=B1 12%     -77.5%     944.75 =C2=B1  8%  interrupts.CPU53.=
TLB:TLB_shoot
> downs
>       3839 =C2=B1  5%     +61.0%       6180 =C2=B1  5%  interrupts.CPU54.=
CAL:Function_
> call_interrupts
>       4278 =C2=B1 11%     -77.3%     969.75 =C2=B1  9%  interrupts.CPU54.=
TLB:TLB_shoot
> downs
>       3835 =C2=B1  7%     +61.6%       6197 =C2=B1  7%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>       4419 =C2=B1 13%     -78.8%     935.75 =C2=B1 12%  interrupts.CPU55.=
TLB:TLB_shoot
> downs
>       3815 =C2=B1  7%     +62.7%       6208 =C2=B1  8%  interrupts.CPU56.=
CAL:Function_
> call_interrupts
>       2361 =C2=B1  3%     -10.4%       2115 =C2=B1  3%  interrupts.CPU56.=
RES:Reschedul
> ing_interrupts
>       4288 =C2=B1 10%     -77.6%     961.50 =C2=B1 12%  interrupts.CPU56.=
TLB:TLB_shoot
> downs
>       3800 =C2=B1  6%     +60.6%       6104 =C2=B1  6%  interrupts.CPU57.=
CAL:Function_
> call_interrupts
>       2349           -11.2%       2085 =C2=B1  3%  interrupts.CPU57.RES:R=
eschedul
> ing_interrupts
>       4495 =C2=B1  9%     -69.3%       1378 =C2=B1 57%  interrupts.CPU57.=
TLB:TLB_shoot
> downs
>       3796 =C2=B1  5%     +59.0%       6035 =C2=B1  6%  interrupts.CPU58.=
CAL:Function_
> call_interrupts
>       2328 =C2=B1  2%      -9.8%       2099 =C2=B1  4%  interrupts.CPU58.=
RES:Reschedul
> ing_interrupts
>       4223 =C2=B1 11%     -78.0%     928.25 =C2=B1 11%  interrupts.CPU58.=
TLB:TLB_shoot
> downs
>       3765 =C2=B1  8%     +60.2%       6033 =C2=B1  5%  interrupts.CPU59.=
CAL:Function_
> call_interrupts
>       4377 =C2=B1 11%     -78.2%     952.25 =C2=B1 13%  interrupts.CPU59.=
TLB:TLB_shoot
> downs
>       3900 =C2=B1  7%     +57.3%       6134 =C2=B1  5%  interrupts.CPU6.C=
AL:Function_c
> all_interrupts
>       2203 =C2=B1  3%      -8.7%       2011 =C2=B1  3%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>       4333 =C2=B1 13%     -78.6%     929.25 =C2=B1 13%  interrupts.CPU6.T=
LB:TLB_shootd
> owns
>       3770 =C2=B1  6%     +65.8%       6251 =C2=B1  5%  interrupts.CPU60.=
CAL:Function_
> call_interrupts
>       4354 =C2=B1  7%     -76.6%       1020 =C2=B1 10%  interrupts.CPU60.=
TLB:TLB_shoot
> downs
>       3749 =C2=B1  6%     +62.9%       6109 =C2=B1  6%  interrupts.CPU61.=
CAL:Function_
> call_interrupts
>       4354 =C2=B1 11%     -77.3%     988.50 =C2=B1 11%  interrupts.CPU61.=
TLB:TLB_shoot
> downs
>       3751 =C2=B1  7%     +60.9%       6035 =C2=B1  6%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>       4251 =C2=B1  9%     -77.3%     965.50 =C2=B1  7%  interrupts.CPU62.=
TLB:TLB_shoot
> downs
>       3794 =C2=B1  8%     +56.2%       5926 =C2=B1  4%  interrupts.CPU63.=
CAL:Function_
> call_interrupts
>       4226 =C2=B1  9%     -77.9%     935.75 =C2=B1 11%  interrupts.CPU63.=
TLB:TLB_shoot
> downs
>       3787 =C2=B1  6%     +60.7%       6086 =C2=B1  4%  interrupts.CPU64.=
CAL:Function_
> call_interrupts
>       4164 =C2=B1 10%     -76.5%     976.75 =C2=B1 11%  interrupts.CPU64.=
TLB:TLB_shoot
> downs
>       3748 =C2=B1  5%     +66.6%       6245 =C2=B1  7%  interrupts.CPU65.=
CAL:Function_
> call_interrupts
>       4234 =C2=B1  7%     -76.8%     980.25 =C2=B1 11%  interrupts.CPU65.=
TLB:TLB_shoot
> downs
>       3864 =C2=B1  7%     +58.3%       6117 =C2=B1  6%  interrupts.CPU66.=
CAL:Function_
> call_interrupts
>       2327 =C2=B1  4%      -8.2%       2135        interrupts.CPU66.RES:R=
eschedul
> ing_interrupts
>       4282 =C2=B1 10%     -78.7%     914.00 =C2=B1  8%  interrupts.CPU66.=
TLB:TLB_shoot
> downs
>       3774 =C2=B1  9%     +60.5%       6055 =C2=B1  6%  interrupts.CPU67.=
CAL:Function_
> call_interrupts
>       4146 =C2=B1 10%     -78.2%     903.75 =C2=B1 12%  interrupts.CPU67.=
TLB:TLB_shoot
> downs
>       3782 =C2=B1  6%     +65.2%       6250 =C2=B1  8%  interrupts.CPU68.=
CAL:Function_
> call_interrupts
>       4348 =C2=B1 10%     -77.5%     979.50 =C2=B1  8%  interrupts.CPU68.=
TLB:TLB_shoot
> downs
>       3912 =C2=B1  5%     +58.1%       6185 =C2=B1  5%  interrupts.CPU69.=
CAL:Function_
> call_interrupts
>       2320            -9.5%       2099        interrupts.CPU69.RES:Resche=
dul
> ing_interrupts
>       4336 =C2=B1 11%     -78.0%     953.75 =C2=B1 12%  interrupts.CPU69.=
TLB:TLB_shoot
> downs
>       3907 =C2=B1  9%     +60.0%       6249 =C2=B1  6%  interrupts.CPU7.C=
AL:Function_c
> all_interrupts
>       2197 =C2=B1  4%      -8.8%       2003 =C2=B1  3%  interrupts.CPU7.R=
ES:Rescheduli
> ng_interrupts
>       4242 =C2=B1 13%     -76.1%       1012 =C2=B1 11%  interrupts.CPU7.T=
LB:TLB_shootd
> owns
>       3938 =C2=B1  7%     +52.5%       6006 =C2=B1  7%  interrupts.CPU70.=
CAL:Function_
> call_interrupts
>       2370 =C2=B1  2%     -10.8%       2113 =C2=B1  3%  interrupts.CPU70.=
RES:Reschedul
> ing_interrupts
>       4464 =C2=B1  7%     -79.6%     909.25 =C2=B1 12%  interrupts.CPU70.=
TLB:TLB_shoot
> downs
>       3854 =C2=B1  8%     +59.8%       6161 =C2=B1  8%  interrupts.CPU71.=
CAL:Function_
> call_interrupts
>       2319 =C2=B1  3%     -10.0%       2088 =C2=B1  4%  interrupts.CPU71.=
RES:Reschedul
> ing_interrupts
>       4375 =C2=B1 10%     -77.9%     967.25 =C2=B1 12%  interrupts.CPU71.=
TLB:TLB_shoot
> downs
>       3761 =C2=B1  9%     +69.7%       6383 =C2=B1  8%  interrupts.CPU72.=
CAL:Function_
> call_interrupts
>       2336 =C2=B1  3%      -9.3%       2119 =C2=B1  2%  interrupts.CPU72.=
RES:Reschedul
> ing_interrupts
>       4219 =C2=B1 10%     -76.1%       1008 =C2=B1  9%  interrupts.CPU72.=
TLB:TLB_shoot
> downs
>       3756 =C2=B1  9%     +73.5%       6517 =C2=B1 12%  interrupts.CPU73.=
CAL:Function_
> call_interrupts
>       2369 =C2=B1  2%     -12.1%       2081 =C2=B1  2%  interrupts.CPU73.=
RES:Reschedul
> ing_interrupts
>       4209 =C2=B1 14%     -76.9%     973.75 =C2=B1 10%  interrupts.CPU73.=
TLB:TLB_shoot
> downs
>       3738 =C2=B1  8%     +73.0%       6465 =C2=B1  9%  interrupts.CPU74.=
CAL:Function_
> call_interrupts
>       4189 =C2=B1  7%     -76.9%     969.25 =C2=B1 11%  interrupts.CPU74.=
TLB:TLB_shoot
> downs
>       3815 =C2=B1 14%     +71.4%       6538 =C2=B1 10%  interrupts.CPU75.=
CAL:Function_
> call_interrupts
>       2350           -11.5%       2081 =C2=B1  2%  interrupts.CPU75.RES:R=
eschedul
> ing_interrupts
>       4396 =C2=B1  3%     -78.4%     951.50 =C2=B1 11%  interrupts.CPU75.=
TLB:TLB_shoot
> downs
>       3836 =C2=B1  9%     +73.8%       6668 =C2=B1  8%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>       4241 =C2=B1  8%     -77.2%     967.50 =C2=B1 16%  interrupts.CPU76.=
TLB:TLB_shoot
> downs
>       3699 =C2=B1  8%     +73.2%       6407 =C2=B1  6%  interrupts.CPU77.=
CAL:Function_
> call_interrupts
>       2318 =C2=B1  2%     -10.5%       2074 =C2=B1  4%  interrupts.CPU77.=
RES:Reschedul
> ing_interrupts
>       4181 =C2=B1  4%     -76.7%     975.00 =C2=B1 13%  interrupts.CPU77.=
TLB:TLB_shoot
> downs
>       3814 =C2=B1 10%     +72.7%       6585 =C2=B1  5%  interrupts.CPU78.=
CAL:Function_
> call_interrupts
>       4262 =C2=B1  8%     -78.1%     931.50 =C2=B1 10%  interrupts.CPU78.=
TLB:TLB_shoot
> downs
>       3889 =C2=B1  7%     +64.9%       6414 =C2=B1  7%  interrupts.CPU79.=
CAL:Function_
> call_interrupts
>       4458 =C2=B1 10%     -77.7%     994.25 =C2=B1 15%  interrupts.CPU79.=
TLB:TLB_shoot
> downs
>       3878 =C2=B1  6%     +59.4%       6183 =C2=B1  6%  interrupts.CPU8.C=
AL:Function_c
> all_interrupts
>       4528 =C2=B1  8%     -78.5%     975.00 =C2=B1 10%  interrupts.CPU8.T=
LB:TLB_shootd
> owns
>       3761 =C2=B1  8%     +71.9%       6468 =C2=B1  7%  interrupts.CPU80.=
CAL:Function_
> call_interrupts
>       2367 =C2=B1  2%     -11.1%       2105 =C2=B1  3%  interrupts.CPU80.=
RES:Reschedul
> ing_interrupts
>       4389 =C2=B1  5%     -77.8%     974.75 =C2=B1 13%  interrupts.CPU80.=
TLB:TLB_shoot
> downs
>       3752 =C2=B1  7%     +72.6%       6477 =C2=B1 11%  interrupts.CPU81.=
CAL:Function_
> call_interrupts
>       4188 =C2=B1  6%     -76.6%     980.00 =C2=B1 13%  interrupts.CPU81.=
TLB:TLB_shoot
> downs
>       3804 =C2=B1  8%     +68.9%       6425 =C2=B1  7%  interrupts.CPU82.=
CAL:Function_
> call_interrupts
>       4378 =C2=B1  5%     -78.0%     961.75 =C2=B1 11%  interrupts.CPU82.=
TLB:TLB_shoot
> downs
>       3768 =C2=B1 10%     +72.8%       6510 =C2=B1  8%  interrupts.CPU83.=
CAL:Function_
> call_interrupts
>       4299 =C2=B1  7%     -78.0%     947.50 =C2=B1 13%  interrupts.CPU83.=
TLB:TLB_shoot
> downs
>       3726 =C2=B1  9%     +71.9%       6405 =C2=B1  8%  interrupts.CPU84.=
CAL:Function_
> call_interrupts
>       2273 =C2=B1  3%      -8.2%       2087 =C2=B1  3%  interrupts.CPU84.=
RES:Reschedul
> ing_interrupts
>       4341 =C2=B1  7%     -77.2%     988.50 =C2=B1 12%  interrupts.CPU84.=
TLB:TLB_shoot
> downs
>       3740 =C2=B1  8%     +75.5%       6565 =C2=B1  8%  interrupts.CPU85.=
CAL:Function_
> call_interrupts
>       3669 =C2=B1  6%     +71.3%       6286 =C2=B1  8%  interrupts.CPU86.=
CAL:Function_
> call_interrupts
>       4185 =C2=B1  5%     -76.3%     991.75 =C2=B1 12%  interrupts.CPU86.=
TLB:TLB_shoot
> downs
>       3716 =C2=B1  8%     +74.8%       6497 =C2=B1 11%  interrupts.CPU87.=
CAL:Function_
> call_interrupts
>       2353 =C2=B1  2%     -10.8%       2099 =C2=B1  2%  interrupts.CPU87.=
RES:Reschedul
> ing_interrupts
>       4138 =C2=B1  3%     -76.9%     955.50 =C2=B1  9%  interrupts.CPU87.=
TLB:TLB_shoot
> downs
>       3798 =C2=B1 10%     +71.2%       6501 =C2=B1  9%  interrupts.CPU88.=
CAL:Function_
> call_interrupts
>       2311 =C2=B1  3%      -8.0%       2126        interrupts.CPU88.RES:R=
eschedul
> ing_interrupts
>       4384 =C2=B1  5%     -77.6%     982.25 =C2=B1  8%  interrupts.CPU88.=
TLB:TLB_shoot
> downs
>       3803 =C2=B1  9%     +71.6%       6525 =C2=B1  9%  interrupts.CPU89.=
CAL:Function_
> call_interrupts
>       4294 =C2=B1  7%     -78.5%     922.75 =C2=B1 10%  interrupts.CPU89.=
TLB:TLB_shoot
> downs
>       3876 =C2=B1  6%     +56.6%       6070 =C2=B1  5%  interrupts.CPU9.C=
AL:Function_c
> all_interrupts
>       4439 =C2=B1 10%     -77.9%     979.50 =C2=B1  9%  interrupts.CPU9.T=
LB:TLB_shootd
> owns
>       3756 =C2=B1  7%     +71.5%       6442 =C2=B1  7%  interrupts.CPU90.=
CAL:Function_
> call_interrupts
>       2414 =C2=B1  4%     -10.8%       2154 =C2=B1  4%  interrupts.CPU90.=
RES:Reschedul
> ing_interrupts
>       4255 =C2=B1  8%     -76.3%       1010 =C2=B1 11%  interrupts.CPU90.=
TLB:TLB_shoot
> downs
>       3788 =C2=B1  9%     +69.7%       6430 =C2=B1  6%  interrupts.CPU91.=
CAL:Function_
> call_interrupts
>       2348 =C2=B1  3%     -11.2%       2085 =C2=B1  2%  interrupts.CPU91.=
RES:Reschedul
> ing_interrupts
>       4325 =C2=B1  6%     -78.1%     948.75 =C2=B1 11%  interrupts.CPU91.=
TLB:TLB_shoot
> downs
>       3819 =C2=B1  9%     +70.2%       6499 =C2=B1  8%  interrupts.CPU92.=
CAL:Function_
> call_interrupts
>       2294 =C2=B1  4%      -7.8%       2116 =C2=B1  3%  interrupts.CPU92.=
RES:Reschedul
> ing_interrupts
>       4372 =C2=B1 10%     -77.1%     999.50 =C2=B1  7%  interrupts.CPU92.=
TLB:TLB_shoot
> downs
>       3630 =C2=B1  9%     +78.4%       6474 =C2=B1  5%  interrupts.CPU93.=
CAL:Function_
> call_interrupts
>       2270 =C2=B1  4%      -9.0%       2066 =C2=B1  3%  interrupts.CPU93.=
RES:Reschedul
> ing_interrupts
>       4125 =C2=B1  6%     -75.7%       1003 =C2=B1 11%  interrupts.CPU93.=
TLB:TLB_shoot
> downs
>       3757 =C2=B1  8%     +68.4%       6326 =C2=B1  7%  interrupts.CPU94.=
CAL:Function_
> call_interrupts
>       4226 =C2=B1  4%     -76.7%     985.00 =C2=B1 13%  interrupts.CPU94.=
TLB:TLB_shoot
> downs
>       3773 =C2=B1  8%     +71.8%       6481 =C2=B1  8%  interrupts.CPU95.=
CAL:Function_
> call_interrupts
>       2303 =C2=B1  3%     -10.3%       2066 =C2=B1  2%  interrupts.CPU95.=
RES:Reschedul
> ing_interrupts
>       4269 =C2=B1  6%     -77.6%     955.50 =C2=B1 10%  interrupts.CPU95.=
TLB:TLB_shoot
> downs
>     216451 =C2=B1  2%      -9.3%     196228 =C2=B1  2%  interrupts.RES:Re=
scheduling_in
> terrupts
>     411411 =C2=B1  8%     -76.6%      96406 =C2=B1 10%  interrupts.TLB:TL=
B_shootdowns
>
>
>
> *************************************************************************=
***
> ***********************
> lkp-csl-2ap1: 192 threads Intel(R) Xeon(R) CPU @ 2.20GHz with 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_dire=
cto
> ries/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test=
_si
> ze/testcase/ucode:
>   gcc-9/performance/1SSD/9B/nfsv4/ext4/4/x86_64-rhel-8.3/16d/256fpd/4/deb=
ian
> -10.4-x86_64-20200603.cgz/fsyncBeforeClose/lkp-csl-2ap1/10G/fsmark/0x4002=
f01
>
> commit:
>   43c31ac0e6 ("sched: Remove relyance on STRUCT_ALIGNMENT")
>   d8fcb81f1a ("sched/fair: Check for idle core in wake_affine")
>
> 43c31ac0e665d942 d8fcb81f1acf651a0e50eacecca
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           0:4           -2%           0:4     perf-profile.children.cycle=
s-p
> p.error_entry
>           0:4           -3%           0:4     perf-profile.self.cycles-pp=
.er
> ror_entry
>          %stddev     %change         %stddev
>              \          |                \
>   39716241 =C2=B1  2%     +34.0%   53223347 =C2=B1  3%  fsmark.app_overhe=
ad
>       3457           -13.7%       2983        fsmark.files_per_sec
>     784.31           +14.7%     899.29        fsmark.time.elapsed_time
>     784.31           +14.7%     899.29        fsmark.time.elapsed_time.max
>       7148 =C2=B1  3%     +25.9%       8997 =C2=B1  5%  fsmark.time.invol=
untary_contex
> t_switches
>      23.75 =C2=B1  3%      +8.4%      25.75 =C2=B1  3%  fsmark.time.perce=
nt_of_cpu_thi
> s_job_got
>     173.44           +24.7%     216.32 =C2=B1  2%  fsmark.time.system_time
>   12290406            +3.7%   12744302        fsmark.time.voluntary_conte=
xt_
> switches
>   41988047           -15.6%   35430105 =C2=B1  3%  cpuidle.C1.usage
>     826.57           +13.9%     941.38        uptime.boot
>     153177           +14.1%     174764        uptime.idle
>     169212            -9.7%     152740        vmstat.io.bo
>     280582           -10.2%     251897        vmstat.system.cs
>      91019 =C2=B1  3%     -13.1%      79095 =C2=B1  4%  meminfo.Dirty
>       1003 =C2=B1 10%     +27.1%       1276 =C2=B1  7%  meminfo.Writeback
>      43696           -12.7%      38137        meminfo.max_used_kB
>      31.50 =C2=B1  5%     +24.6%      39.25 =C2=B1  2%  nfsstat.Client.nf=
s.v4.getattr
>       5.00           +20.0%       6.00        nfsstat.Client.nfs.v4.renew
>       5.00           +20.0%       6.00        nfsstat.Server.nfs.v4.opera=
tio
> ns.renew
>      89045 =C2=B1 39%     +93.5%     172290 =C2=B1 17%  numa-meminfo.node=
0.AnonHugePag
> es
>     118914 =C2=B1 33%     +64.2%     195218 =C2=B1 17%  numa-meminfo.node=
0.AnonPages
>     120800 =C2=B1 32%     +61.9%     195542 =C2=B1 16%  numa-meminfo.node=
0.Inactive(an
> on)
>       2795 =C2=B1 16%     -47.6%       1466 =C2=B1 28%  numa-meminfo.node=
0.PageTables
>      57149 =C2=B1 23%     -58.5%      23738 =C2=B1 76%  numa-meminfo.node=
1.AnonHugePag
> es
>      67724 =C2=B1 20%     -55.6%      30063 =C2=B1 67%  numa-meminfo.node=
1.AnonPages
>      72157 =C2=B1 17%     -46.9%      38301 =C2=B1 53%  numa-meminfo.node=
1.Inactive(an
> on)
>       5532 =C2=B1 55%     +89.1%      10461 =C2=B1 10%  numa-meminfo.node=
1.Shmem
>       9383 =C2=B1 13%     +35.6%      12721 =C2=B1 14%  numa-meminfo.node=
3.Shmem
>     344.50 =C2=B1 35%     +83.1%     630.75 =C2=B1 39%  numa-meminfo.node=
3.Writeback
>      29721 =C2=B1 33%     +64.2%      48791 =C2=B1 17%  numa-vmstat.node0=
.nr_anon_page
> s
>      43.00 =C2=B1 39%     +94.8%      83.75 =C2=B1 17%  numa-vmstat.node0=
.nr_anon_tran
> sparent_hugepages
>      30192 =C2=B1 32%     +61.9%      48872 =C2=B1 16%  numa-vmstat.node0=
.nr_inactive_
> anon
>     698.50 =C2=B1 16%     -47.6%     366.25 =C2=B1 28%  numa-vmstat.node0=
.nr_page_tabl
> e_pages
>      30192 =C2=B1 32%     +61.9%      48872 =C2=B1 16%  numa-vmstat.node0=
.nr_zone_inac
> tive_anon
>      16933 =C2=B1 20%     -55.7%       7507 =C2=B1 67%  numa-vmstat.node1=
.nr_anon_page
> s
>      18041 =C2=B1 17%     -47.0%       9566 =C2=B1 53%  numa-vmstat.node1=
.nr_inactive_
> anon
>       1382 =C2=B1 55%     +89.1%       2615 =C2=B1 10%  numa-vmstat.node1=
.nr_shmem
>      18041 =C2=B1 17%     -47.0%       9566 =C2=B1 53%  numa-vmstat.node1=
.nr_zone_inac
> tive_anon
>      82.50 =C2=B1 25%     +74.8%     144.25 =C2=B1 36%  numa-vmstat.node2=
.nr_writeback
>       1694 =C2=B1  5%      -8.8%       1546        numa-vmstat.node3.nr_m=
apped
>       2345 =C2=B1 13%     +35.6%       3178 =C2=B1 14%  numa-vmstat.node3=
.nr_shmem
>      79.25 =C2=B1 25%     +99.7%     158.25 =C2=B1 38%  numa-vmstat.node3=
.nr_writeback
>     939.68 =C2=B1 27%    +130.0%       2161 =C2=B1 29%  sched_debug.cfs_r=
q:/.exec_cloc
> k.min
>       5359 =C2=B1  7%     -20.1%       4284 =C2=B1  8%  sched_debug.cfs_r=
q:/.load_avg.
> max
>     556.94 =C2=B1  5%     -15.1%     473.09 =C2=B1  3%  sched_debug.cfs_r=
q:/.load_avg.
> stddev
>      42343 =C2=B1  7%     -21.7%      33167 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.avg
>      27135 =C2=B1  6%     -27.7%      19625 =C2=B1 13%  sched_debug.cfs_r=
q:/.min_vrunt
> ime.min
>       4320 =C2=B1234%    -284.0%      -7947        sched_debug.cfs_rq:/.s=
pread0.a
> vg
>       7.76 =C2=B1 10%     -19.4%       6.25 =C2=B1 15%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.avg
>      52.48 =C2=B1  5%     -15.8%      44.20 =C2=B1  7%  sched_debug.cfs_r=
q:/.util_est_
> enqueued.stddev
>      94134 =C2=B1 35%    +170.7%     254811 =C2=B1 27%  sched_debug.cpu.n=
r_switches.mi
> n
>     411576 =C2=B1 18%     -35.1%     267173 =C2=B1 47%  sched_debug.cpu.n=
r_switches.st
> ddev
>      92543 =C2=B1 36%    +171.5%     251249 =C2=B1 27%  sched_debug.cpu.s=
ched_count.mi
> n
>     411594 =C2=B1 18%     -35.1%     267043 =C2=B1 47%  sched_debug.cpu.s=
ched_count.st
> ddev
>      43054 =C2=B1 36%    +172.8%     117470 =C2=B1 26%  sched_debug.cpu.s=
ched_goidle.m
> in
>     193579 =C2=B1 18%     -33.9%     128010 =C2=B1 46%  sched_debug.cpu.s=
ched_goidle.s
> tddev
>      43475 =C2=B1 35%    +177.6%     120695 =C2=B1 27%  sched_debug.cpu.t=
twu_count.min
>     213144 =C2=B1 17%     -34.1%     140498 =C2=B1 44%  sched_debug.cpu.t=
twu_count.std
> dev
>       4245 =C2=B1 37%    +138.9%      10143 =C2=B1 28%  sched_debug.cpu.t=
twu_local.min
>      38082 =C2=B1  4%     -12.2%      33420 =C2=B1  3%  slabinfo.dquot.ac=
tive_objs
>      38801 =C2=B1  4%     -12.1%      34102 =C2=B1  3%  slabinfo.dquot.nu=
m_objs
>       9688 =C2=B1  8%     -20.9%       7662 =C2=B1 13%  slabinfo.eventpol=
l_pwq.active_
> objs
>       9688 =C2=B1  8%     -20.9%       7662 =C2=B1 13%  slabinfo.eventpol=
l_pwq.num_obj
> s
>      13976            +8.2%      15120 =C2=B1  3%  slabinfo.file_lock_cac=
he.activ
> e_objs
>      14009            +8.0%      15131 =C2=B1  3%  slabinfo.file_lock_cac=
he.num_o
> bjs
>       6637 =C2=B1  5%     +17.1%       7774 =C2=B1  3%  slabinfo.files_ca=
che.active_ob
> js
>       6637 =C2=B1  5%     +17.1%       7774 =C2=B1  3%  slabinfo.files_ca=
che.num_objs
>      40459           +26.7%      51261 =C2=B1  3%  slabinfo.nfsd4_files.a=
ctive_ob
> js
>     769.00           +25.0%     961.25 =C2=B1  3%  slabinfo.nfsd4_files.a=
ctive_sl
> abs
>      43104           +25.0%      53861 =C2=B1  3%  slabinfo.nfsd4_files.n=
um_objs
>     769.00           +25.0%     961.25 =C2=B1  3%  slabinfo.nfsd4_files.n=
um_slabs
>      14766 =C2=B1  6%     +16.2%      17161 =C2=B1  3%  slabinfo.pde_open=
er.active_obj
> s
>      14766 =C2=B1  6%     +16.2%      17161 =C2=B1  3%  slabinfo.pde_open=
er.num_objs
>       3883 =C2=B1  3%     +10.6%       4294 =C2=B1  2%  slabinfo.sighand_=
cache.active_
> objs
>       3906 =C2=B1  3%     +10.7%       4322 =C2=B1  2%  slabinfo.sighand_=
cache.num_obj
> s
>       9357 =C2=B1  4%     +11.9%      10467        slabinfo.task_delay_in=
fo.activ
> e_objs
>       9357 =C2=B1  4%     +11.9%      10467        slabinfo.task_delay_in=
fo.num_o
> bjs
>       4536            +8.7%       4930        proc-vmstat.nr_active_anon
>    5896119            +2.1%    6021016        proc-vmstat.nr_dirtied
>      22748 =C2=B1  3%     -13.1%      19778 =C2=B1  4%  proc-vmstat.nr_di=
rty
>    3528602            -1.6%    3473496        proc-vmstat.nr_file_pages
>    2894467            -1.9%    2839923        proc-vmstat.nr_inactive_file
>       1195            -2.1%       1169        proc-vmstat.nr_page_table_p=
age
> s
>       7504            +5.8%       7940        proc-vmstat.nr_shmem
>    1110747            -1.8%    1090492        proc-vmstat.nr_slab_reclaim=
abl
> e
>     242.50 =C2=B1 11%     +29.7%     314.50 =C2=B1  7%  proc-vmstat.nr_wr=
iteback
>    5857269            +2.3%    5989504        proc-vmstat.nr_written
>       4536            +8.7%       4930        proc-vmstat.nr_zone_active_=
ano
> n
>    2894467            -1.9%    2839923        proc-vmstat.nr_zone_inactiv=
e_f
> ile
>      23059 =C2=B1  2%     -12.3%      20222 =C2=B1  3%  proc-vmstat.nr_zo=
ne_write_pend
> ing
>     824.25 =C2=B1  9%    +373.2%       3900 =C2=B1 76%  proc-vmstat.numa_=
hint_faults_l
> ocal
>   24672574            +2.2%   25222316        proc-vmstat.numa_hit
>   24578366            +2.2%   25127972        proc-vmstat.numa_local
>      60087 =C2=B1 12%     -38.4%      36989 =C2=B1  8%  proc-vmstat.numa_=
pages_migrate
> d
>   34515798            +1.5%   35037117        proc-vmstat.pgalloc_normal
>    3152943           +14.4%    3606839        proc-vmstat.pgfault
>   26663715            +1.9%   27179175        proc-vmstat.pgfree
>      60087 =C2=B1 12%     -38.4%      36989 =C2=B1  8%  proc-vmstat.pgmig=
rate_success
>  1.331e+08            +3.5%  1.377e+08        proc-vmstat.pgpgout
>     189043 =C2=B1  2%     +15.2%     217831 =C2=B1  2%  proc-vmstat.pgreu=
se
>  1.254e+09            -6.0%  1.179e+09        perf-stat.i.branch-instruct=
ion
> s
>      18.19 =C2=B1 13%      +5.0       23.14 =C2=B1  7%  perf-stat.i.cache=
-miss-rate%
>   27354000 =C2=B1  3%     +19.5%   32699922 =C2=B1  3%  perf-stat.i.cache=
-misses
>     283105           -10.4%     253668        perf-stat.i.context-switches
>       2.87 =C2=B1  2%     +15.8%       3.33        perf-stat.i.cpi
>  1.597e+10 =C2=B1  2%      +9.2%  1.744e+10        perf-stat.i.cpu-cycles
>     332.03            -5.9%     312.36        perf-stat.i.cpu-migrations
>     809.01 =C2=B1 10%     -23.9%     615.27 =C2=B1  4%  perf-stat.i.cycle=
s-between-cac
> he-misses
>   1.53e+09            -6.0%  1.438e+09        perf-stat.i.dTLB-loads
>  7.854e+08            -7.2%  7.291e+08        perf-stat.i.dTLB-stores
>  5.633e+09            -6.1%  5.292e+09        perf-stat.i.instructions
>       0.36 =C2=B1  2%     -14.2%       0.31        perf-stat.i.ipc
>       0.08 =C2=B1  2%      +9.2%       0.09        perf-stat.i.metric.GHz
>       0.31 =C2=B1 32%     +61.2%       0.50 =C2=B1 16%  perf-stat.i.metri=
c.K/sec
>      19.51            -6.3%      18.27        perf-stat.i.metric.M/sec
>    8280859 =C2=B1  3%     +19.1%    9858543 =C2=B1  2%  perf-stat.i.node-=
load-misses
>      80.19 =C2=B1  3%      +9.0       89.17        perf-stat.i.node-store=
-miss-ra
> te%
>    1725509 =C2=B1  3%     +38.1%    2382633 =C2=B1  2%  perf-stat.i.node-=
store-misses
>      17.93 =C2=B1 15%      +5.4       23.31 =C2=B1  8%  perf-stat.overall=
.cache-miss-r
> ate%
>       2.85 =C2=B1  2%     +16.1%       3.31        perf-stat.overall.cpi
>     574.92 =C2=B1  5%      -8.2%     527.80 =C2=B1  3%  perf-stat.overall=
.cycles-betwe
> en-cache-misses
>       0.35 =C2=B1  2%     -13.9%       0.30        perf-stat.overall.ipc
>      84.33 =C2=B1  2%      +5.1       89.44        perf-stat.overall.node=
-store-m
> iss-rate%
>  1.249e+09            -5.8%  1.176e+09        perf-stat.ps.branch-instruc=
tio
> ns
>   27867324 =C2=B1  2%     +18.9%   33139188 =C2=B1  3%  perf-stat.ps.cach=
e-misses
>     280927           -10.3%     252107        perf-stat.ps.context-switch=
es
>  1.599e+10 =C2=B1  2%      +9.2%  1.747e+10        perf-stat.ps.cpu-cycles
>     330.60            -6.0%     310.78        perf-stat.ps.cpu-migrations
>  1.523e+09            -5.9%  1.433e+09        perf-stat.ps.dTLB-loads
>  7.809e+08            -7.0%   7.26e+08        perf-stat.ps.dTLB-stores
>  5.605e+09            -5.9%  5.273e+09        perf-stat.ps.instructions
>    8443395 =C2=B1  3%     +18.1%    9974059 =C2=B1  2%  perf-stat.ps.node=
-load-misses
>    1735712 =C2=B1  3%     +37.0%    2377391 =C2=B1  2%  perf-stat.ps.node=
-store-misses
>    4.4e+12            +7.8%  4.744e+12        perf-stat.total.instructions
>      55141 =C2=B1 12%     +25.6%      69254 =C2=B1  9%  softirqs.CPU0.RCU
>       5531 =C2=B1 36%     +55.9%       8621 =C2=B1 21%  softirqs.CPU10.TI=
MER
>      99781           +10.2%     109928        softirqs.CPU100.SCHED
>      99484           +10.8%     110258 =C2=B1  2%  softirqs.CPU103.SCHED
>      95506 =C2=B1  8%     +14.3%     109118 =C2=B1  4%  softirqs.CPU104.S=
CHED
>      98907            +9.9%     108658 =C2=B1  3%  softirqs.CPU105.SCHED
>      97231 =C2=B1  4%     +10.5%     107437 =C2=B1  3%  softirqs.CPU106.S=
CHED
>       5231 =C2=B1 29%     +67.9%       8780 =C2=B1 16%  softirqs.CPU106.T=
IMER
>       5187 =C2=B1 32%     +59.6%       8280 =C2=B1 18%  softirqs.CPU107.T=
IMER
>      98683           +12.8%     111354        softirqs.CPU108.SCHED
>       5250 =C2=B1 30%     +58.4%       8319 =C2=B1 16%  softirqs.CPU108.T=
IMER
>       5435 =C2=B1 39%     +62.5%       8832 =C2=B1 21%  softirqs.CPU11.TI=
MER
>       5302 =C2=B1 35%     +60.5%       8508 =C2=B1 20%  softirqs.CPU110.T=
IMER
>      98663           +13.4%     111855 =C2=B1  2%  softirqs.CPU111.SCHED
>       4543 =C2=B1 35%     +67.0%       7589 =C2=B1 20%  softirqs.CPU111.T=
IMER
>      98204           +14.1%     112085        softirqs.CPU112.SCHED
>      98191           +11.5%     109453 =C2=B1  2%  softirqs.CPU113.SCHED
>       4760 =C2=B1 31%     +52.6%       7264 =C2=B1 24%  softirqs.CPU113.T=
IMER
>      98404 =C2=B1  2%      +9.2%     107506 =C2=B1  4%  softirqs.CPU114.S=
CHED
>      98229 =C2=B1  3%     +11.3%     109329 =C2=B1  4%  softirqs.CPU115.S=
CHED
>      99835            +9.0%     108848 =C2=B1  3%  softirqs.CPU116.SCHED
>       4834 =C2=B1 31%     +63.1%       7886 =C2=B1 20%  softirqs.CPU116.T=
IMER
>      98149           +12.2%     110153 =C2=B1  3%  softirqs.CPU117.SCHED
>       5109 =C2=B1 29%     +49.0%       7612 =C2=B1 24%  softirqs.CPU117.T=
IMER
>     100210            +9.8%     110030 =C2=B1  2%  softirqs.CPU118.SCHED
>      99966            +7.8%     107782 =C2=B1  4%  softirqs.CPU119.SCHED
>       4888 =C2=B1 35%     +60.6%       7850 =C2=B1 25%  softirqs.CPU119.T=
IMER
>      99708            +9.4%     109035 =C2=B1  5%  softirqs.CPU12.SCHED
>       5681 =C2=B1 26%     +49.2%       8476 =C2=B1 16%  softirqs.CPU12.TI=
MER
>      98545 =C2=B1  2%     +13.3%     111666        softirqs.CPU121.SCHED
>      99762           +11.6%     111378        softirqs.CPU122.SCHED
>      99773           +11.2%     110939        softirqs.CPU123.SCHED
>      98199 =C2=B1  2%     +14.9%     112799        softirqs.CPU124.SCHED
>      96700 =C2=B1  3%     +17.0%     113160        softirqs.CPU125.SCHED
>      99482           +11.1%     110506 =C2=B1  2%  softirqs.CPU126.SCHED
>      99704           +11.1%     110811        softirqs.CPU127.SCHED
>      99371           +11.9%     111181        softirqs.CPU128.SCHED
>      99810           +10.8%     110560 =C2=B1  2%  softirqs.CPU129.SCHED
>      76964 =C2=B1 43%     +67.3%     128731 =C2=B1 25%  softirqs.CPU13.NE=
T_RX
>      97448 =C2=B1  2%     +11.3%     108501 =C2=B1  4%  softirqs.CPU13.SC=
HED
>       5543 =C2=B1 36%     +52.6%       8461 =C2=B1 16%  softirqs.CPU13.TI=
MER
>      99635           +11.9%     111488 =C2=B1  2%  softirqs.CPU132.SCHED
>      97226 =C2=B1  3%     +15.8%     112619        softirqs.CPU133.SCHED
>      99763           +11.3%     111048        softirqs.CPU134.SCHED
>      98920           +13.1%     111878        softirqs.CPU135.SCHED
>      99112           +10.8%     109781 =C2=B1  2%  softirqs.CPU136.SCHED
>      99885           +12.4%     112298        softirqs.CPU137.SCHED
>      99179           +11.7%     110814        softirqs.CPU138.SCHED
>       8085 =C2=B1 18%     -25.7%       6007 =C2=B1 23%  softirqs.CPU138.T=
IMER
>      99809           +10.1%     109857 =C2=B1  4%  softirqs.CPU139.SCHED
>       5103 =C2=B1 33%     +57.5%       8040 =C2=B1 20%  softirqs.CPU14.TI=
MER
>      99014           +13.7%     112552        softirqs.CPU140.SCHED
>      99444           +12.7%     112056        softirqs.CPU143.SCHED
>      93006 =C2=B1  4%     +19.0%     110648        softirqs.CPU144.SCHED
>       6513 =C2=B1 16%     +76.5%      11498 =C2=B1 23%  softirqs.CPU144.T=
IMER
>      98702           +11.0%     109520        softirqs.CPU146.SCHED
>      98910 =C2=B1  2%     +10.6%     109416 =C2=B1  2%  softirqs.CPU147.S=
CHED
>      99672           +10.4%     110031 =C2=B1  3%  softirqs.CPU148.SCHED
>       5418 =C2=B1 26%     +57.6%       8541 =C2=B1 19%  softirqs.CPU148.T=
IMER
>      99178           +10.1%     109148 =C2=B1  3%  softirqs.CPU149.SCHED
>      99413           +10.3%     109675 =C2=B1  4%  softirqs.CPU15.SCHED
>      99301           +11.1%     110372        softirqs.CPU151.SCHED
>       5261 =C2=B1 28%     +74.8%       9196 =C2=B1 12%  softirqs.CPU151.T=
IMER
>      98029 =C2=B1  2%     +13.1%     110904        softirqs.CPU152.SCHED
>      99098           +10.3%     109291 =C2=B1  5%  softirqs.CPU155.SCHED
>      99195           +11.7%     110834        softirqs.CPU159.SCHED
>       5053 =C2=B1 37%     +63.8%       8274 =C2=B1 16%  softirqs.CPU16.TI=
MER
>      99858           +10.3%     110189        softirqs.CPU160.SCHED
>      99197           +11.6%     110719 =C2=B1  2%  softirqs.CPU161.SCHED
>      98819           +10.8%     109458 =C2=B1  3%  softirqs.CPU162.SCHED
>      99208 =C2=B1  2%      +8.5%     107656 =C2=B1  4%  softirqs.CPU163.S=
CHED
>      99242           +11.0%     110138        softirqs.CPU164.SCHED
>      99368           +12.0%     111268 =C2=B1  2%  softirqs.CPU165.SCHED
>      97304 =C2=B1  2%     +12.6%     109518 =C2=B1  4%  softirqs.CPU166.S=
CHED
>      99027           +11.6%     110544 =C2=B1  2%  softirqs.CPU167.SCHED
>      99580           +11.9%     111453        softirqs.CPU168.SCHED
>      97444 =C2=B1  2%     +13.3%     110438        softirqs.CPU169.SCHED
>      99332           +10.1%     109365 =C2=B1  3%  softirqs.CPU17.SCHED
>       4907 =C2=B1 34%     +72.2%       8451 =C2=B1 15%  softirqs.CPU17.TI=
MER
>      95869           +14.1%     109418 =C2=B1  3%  softirqs.CPU170.SCHED
>      99473           +12.7%     112113        softirqs.CPU171.SCHED
>      99215           +12.5%     111595 =C2=B1  2%  softirqs.CPU172.SCHED
>      99629           +10.8%     110355 =C2=B1  3%  softirqs.CPU173.SCHED
>      99560           +13.4%     112916 =C2=B1  2%  softirqs.CPU174.SCHED
>      99441           +12.3%     111623 =C2=B1  2%  softirqs.CPU175.SCHED
>      98524 =C2=B1  2%     +12.8%     111140 =C2=B1  3%  softirqs.CPU176.S=
CHED
>      95664 =C2=B1  4%     +18.1%     112977        softirqs.CPU177.SCHED
>      97844           +14.0%     111562 =C2=B1  2%  softirqs.CPU178.SCHED
>      98778 =C2=B1  2%     +13.9%     112541        softirqs.CPU179.SCHED
>      98072           +12.0%     109795 =C2=B1  2%  softirqs.CPU18.SCHED
>       4818 =C2=B1 31%     +78.8%       8613 =C2=B1 17%  softirqs.CPU18.TI=
MER
>      98028           +13.3%     111086 =C2=B1  3%  softirqs.CPU180.SCHED
>      95130 =C2=B1  4%     +17.3%     111578 =C2=B1  2%  softirqs.CPU181.S=
CHED
>      99000           +13.6%     112458        softirqs.CPU182.SCHED
>      95440 =C2=B1  4%     +16.7%     111338        softirqs.CPU183.SCHED
>      98878 =C2=B1  2%     +11.2%     109964        softirqs.CPU184.SCHED
>      98411 =C2=B1  2%     +13.2%     111386        softirqs.CPU185.SCHED
>      98351           +11.0%     109216 =C2=B1  2%  softirqs.CPU186.SCHED
>      98670           +11.1%     109670 =C2=B1  4%  softirqs.CPU187.SCHED
>      97500 =C2=B1  3%     +11.9%     109127 =C2=B1  4%  softirqs.CPU188.S=
CHED
>      97177 =C2=B1  2%     +14.8%     111582        softirqs.CPU189.SCHED
>       4962 =C2=B1 31%     +66.4%       8259 =C2=B1 17%  softirqs.CPU19.TI=
MER
>      98709           +13.6%     112145 =C2=B1  3%  softirqs.CPU190.SCHED
>      94298 =C2=B1  7%     +18.5%     111718        softirqs.CPU191.SCHED
>      99739           +11.7%     111407 =C2=B1  2%  softirqs.CPU2.SCHED
>      95751 =C2=B1  6%     +15.2%     110340 =C2=B1  3%  softirqs.CPU20.SC=
HED
>      98845           +11.5%     110201 =C2=B1  3%  softirqs.CPU21.SCHED
>       5231 =C2=B1 28%     +61.7%       8461 =C2=B1 15%  softirqs.CPU21.TI=
MER
>      98546           +11.2%     109605 =C2=B1  3%  softirqs.CPU22.SCHED
>       4974 =C2=B1 29%     +78.4%       8876 =C2=B1 17%  softirqs.CPU22.TI=
MER
>      99261            +9.0%     108240 =C2=B1  2%  softirqs.CPU23.SCHED
>       4853 =C2=B1 36%     +76.9%       8586 =C2=B1 19%  softirqs.CPU23.TI=
MER
>      50363 =C2=B1  6%     +14.7%      57764 =C2=B1  3%  softirqs.CPU25.RCU
>      94576 =C2=B1  6%     +16.3%     109982 =C2=B1  2%  softirqs.CPU25.SC=
HED
>      50853 =C2=B1  8%     +10.6%      56246 =C2=B1  5%  softirqs.CPU26.RCU
>      95989 =C2=B1  4%     +16.0%     111390        softirqs.CPU26.SCHED
>      98283           +12.0%     110043 =C2=B1  2%  softirqs.CPU27.SCHED
>      97827           +11.9%     109428 =C2=B1  3%  softirqs.CPU28.SCHED
>      99883           +10.9%     110745 =C2=B1  4%  softirqs.CPU29.SCHED
>      98452 =C2=B1  2%     +12.7%     110914 =C2=B1  3%  softirqs.CPU3.SCH=
ED
>       5939 =C2=B1 28%     +52.9%       9081 =C2=B1 15%  softirqs.CPU3.TIM=
ER
>      99083           +11.7%     110720 =C2=B1  2%  softirqs.CPU30.SCHED
>      98902           +13.3%     112013        softirqs.CPU31.SCHED
>      97986 =C2=B1  2%     +13.6%     111274        softirqs.CPU33.SCHED
>      97995 =C2=B1  2%     +14.0%     111692 =C2=B1  2%  softirqs.CPU34.SC=
HED
>      96755 =C2=B1  2%     +15.0%     111271        softirqs.CPU35.SCHED
>      57226 =C2=B1 10%     +13.7%      65077 =C2=B1  5%  softirqs.CPU37.RCU
>      98714           +10.2%     108739 =C2=B1  2%  softirqs.CPU37.SCHED
>      98782           +12.4%     111008        softirqs.CPU39.SCHED
>      97221           +13.4%     110253 =C2=B1  4%  softirqs.CPU4.SCHED
>       5429 =C2=B1 35%     +60.3%       8703 =C2=B1 21%  softirqs.CPU4.TIM=
ER
>      56931 =C2=B1 10%     +13.2%      64460 =C2=B1  6%  softirqs.CPU40.RCU
>      98575           +10.7%     109081        softirqs.CPU40.SCHED
>      95201 =C2=B1  4%     +17.0%     111415        softirqs.CPU41.SCHED
>      98283           +11.3%     109411 =C2=B1  4%  softirqs.CPU42.SCHED
>      99151           +12.9%     111975 =C2=B1  2%  softirqs.CPU43.SCHED
>      98909           +10.3%     109107 =C2=B1  2%  softirqs.CPU44.SCHED
>      99538           +10.4%     109914 =C2=B1  2%  softirqs.CPU46.SCHED
>      98076           +13.5%     111357        softirqs.CPU47.SCHED
>      97635 =C2=B1  2%     +10.9%     108279 =C2=B1  3%  softirqs.CPU48.SC=
HED
>      90452 =C2=B1 11%     +20.0%     108549 =C2=B1  4%  softirqs.CPU5.SCH=
ED
>       5504 =C2=B1 29%     +63.5%       9001 =C2=B1 24%  softirqs.CPU5.TIM=
ER
>      98921           +12.2%     111036        softirqs.CPU50.SCHED
>       4972 =C2=B1 36%     +78.1%       8854 =C2=B1 25%  softirqs.CPU50.TI=
MER
>      98208 =C2=B1  2%     +11.9%     109878 =C2=B1  2%  softirqs.CPU51.SC=
HED
>      99291           +10.5%     109762 =C2=B1  3%  softirqs.CPU53.SCHED
>       5658 =C2=B1 30%    +105.9%      11648 =C2=B1 49%  softirqs.CPU54.TI=
MER
>      97257 =C2=B1  3%     +12.3%     109213 =C2=B1  3%  softirqs.CPU55.SC=
HED
>       5331 =C2=B1 22%     +56.1%       8324 =C2=B1 14%  softirqs.CPU55.TI=
MER
>      98444            +9.6%     107928 =C2=B1  3%  softirqs.CPU56.SCHED
>      96512 =C2=B1  4%     +13.8%     109879 =C2=B1  2%  softirqs.CPU57.SC=
HED
>      97476           +12.3%     109449 =C2=B1  2%  softirqs.CPU6.SCHED
>       5365 =C2=B1 38%     +57.5%       8449 =C2=B1 14%  softirqs.CPU6.TIM=
ER
>      95860 =C2=B1  5%     +13.2%     108505 =C2=B1  3%  softirqs.CPU61.SC=
HED
>      95491 =C2=B1  4%     +16.8%     111514        softirqs.CPU65.SCHED
>      98744 =C2=B1  2%     +12.9%     111521        softirqs.CPU69.SCHED
>      97718           +10.1%     107540 =C2=B1  4%  softirqs.CPU7.SCHED
>      91940 =C2=B1 14%     +20.7%     110944 =C2=B1  2%  softirqs.CPU70.SC=
HED
>       4619 =C2=B1 49%     +97.6%       9127 =C2=B1 10%  softirqs.CPU70.TI=
MER
>      98310           +12.5%     110642        softirqs.CPU72.SCHED
>      95651 =C2=B1  3%     +17.5%     112357        softirqs.CPU73.SCHED
>      97375 =C2=B1  2%     +13.4%     110423        softirqs.CPU74.SCHED
>      97494 =C2=B1  2%     +14.4%     111516 =C2=B1  3%  softirqs.CPU75.SC=
HED
>      97012 =C2=B1  2%     +12.9%     109484 =C2=B1  3%  softirqs.CPU76.SC=
HED
>      97017 =C2=B1  2%     +14.8%     111395        softirqs.CPU77.SCHED
>      94766 =C2=B1  4%     +14.8%     108831 =C2=B1  4%  softirqs.CPU78.SC=
HED
>       5072 =C2=B1 39%     +74.9%       8871 =C2=B1 26%  softirqs.CPU78.TI=
MER
>      98115           +12.8%     110723 =C2=B1  2%  softirqs.CPU79.SCHED
>      98532           +10.8%     109204 =C2=B1  3%  softirqs.CPU8.SCHED
>      98855           +12.9%     111583        softirqs.CPU80.SCHED
>      95211 =C2=B1  2%     +18.1%     112428        softirqs.CPU81.SCHED
>      98078           +13.5%     111322        softirqs.CPU82.SCHED
>      95678 =C2=B1  5%     +15.1%     110112        softirqs.CPU83.SCHED
>      98101           +13.2%     111031 =C2=B1  2%  softirqs.CPU84.SCHED
>      94465 =C2=B1  4%     +14.6%     108299 =C2=B1  4%  softirqs.CPU85.SC=
HED
>      97901           +12.0%     109679 =C2=B1  2%  softirqs.CPU86.SCHED
>      97118 =C2=B1  3%     +14.1%     110787        softirqs.CPU87.SCHED
>      98197           +14.2%     112170 =C2=B1  2%  softirqs.CPU88.SCHED
>      97234           +14.1%     110981        softirqs.CPU89.SCHED
>       4911 =C2=B1 34%     +87.4%       9205 =C2=B1 22%  softirqs.CPU89.TI=
MER
>      96672 =C2=B1  2%     +16.4%     112500 =C2=B1  2%  softirqs.CPU90.SC=
HED
>      96780 =C2=B1  4%     +14.3%     110581        softirqs.CPU91.SCHED
>      94869 =C2=B1  3%     +11.9%     106154 =C2=B1  4%  softirqs.CPU92.SC=
HED
>      94734 =C2=B1  2%     +16.4%     110257 =C2=B1  3%  softirqs.CPU93.SC=
HED
>       4478 =C2=B1 31%     +99.3%       8924 =C2=B1 25%  softirqs.CPU93.TI=
MER
>      98684            +9.3%     107870 =C2=B1  2%  softirqs.CPU94.SCHED
>      52444 =C2=B1 12%     +25.5%      65795 =C2=B1  9%  softirqs.CPU96.RCU
>       5489 =C2=B1 37%     +57.5%       8643 =C2=B1 18%  softirqs.CPU96.TI=
MER
>      98545 =C2=B1  2%     +10.7%     109102 =C2=B1  3%  softirqs.CPU97.SC=
HED
>      96066 =C2=B1  2%     +14.7%     110176 =C2=B1  3%  softirqs.CPU98.SC=
HED
>       5400 =C2=B1 36%     +58.5%       8556 =C2=B1 20%  softirqs.CPU98.TI=
MER
>      99516            +9.6%     109032 =C2=B1  3%  softirqs.CPU99.SCHED
>       5328 =C2=B1 39%     +52.9%       8148 =C2=B1 21%  softirqs.CPU99.TI=
MER
>   18821695           +11.7%   21025757        softirqs.SCHED
>    1131174           +29.3%    1462636 =C2=B1  2%  softirqs.TIMER
>      22.40 =C2=B1  3%      -1.9       20.48 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.ret_from_fork
>      22.40 =C2=B1  3%      -1.9       20.48 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.kthread.ret_from_fork
>      13.59 =C2=B1  3%      -1.3       12.27 =C2=B1  3%  perf-profile.call=
trace.cycles-
> pp.nfsd.kthread.ret_from_fork
>       9.24 =C2=B1  3%      -1.3        7.94 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.svc_process.nfsd.kthread.ret_from_fork
>       9.24 =C2=B1  3%      -1.3        7.94 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.svc_process_common.svc_process.nfsd.kthread.ret_from_fork
>       8.72 =C2=B1  3%      -1.3        7.47 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.nfsd_dispatch.svc_process_common.svc_process.nfsd.kthread
>       8.40 =C2=B1  3%      -1.2        7.21 =C2=B1  5%  perf-profile.call=
trace.cycles-
> pp.nfsd4_proc_compound.nfsd_dispatch.svc_process_common.svc_process.nfsd
>       5.73 =C2=B1  2%      -1.0        4.77 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.nfsd4_open.nfsd4_proc_compound.nfsd_dispatch.svc_process_common.svc_pr=
oce
> ss
>       4.21 =C2=B1  3%      -0.8        3.45 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.nfsd4_process_open2.nfsd4_open.nfsd4_proc_compound.nfsd_dispatch.svc_p=
roc
> ess_common
>       3.98 =C2=B1  3%      -0.7        3.25 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.nfsd_file_acquire.nfs4_get_vfs_file.nfsd4_process_open2.nfsd4_open.nfs=
d4_
> proc_compound
>       3.99 =C2=B1  3%      -0.7        3.27 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.nfs4_get_vfs_file.nfsd4_process_open2.nfsd4_open.nfsd4_proc_compound.n=
fsd
> _dispatch
>       3.77 =C2=B1  4%      -0.7        3.08 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.nfsd_file_lru_walk_list.nfsd_file_acquire.nfs4_get_vfs_file.nfsd4_proc=
ess
> _open2.nfsd4_open
>       3.69 =C2=B1  4%      -0.7        3.02 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.list_lru_walk_node.nfsd_file_lru_walk_list.nfsd_file_acquire.nfs4_get_=
vfs
> _file.nfsd4_process_open2
>       3.69 =C2=B1  4%      -0.7        3.02 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.list_lru_walk_one.list_lru_walk_node.nfsd_file_lru_walk_list.nfsd_file=
_ac
> quire.nfs4_get_vfs_file
>       3.67 =C2=B1  4%      -0.7        3.01 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.__list_lru_walk_one.list_lru_walk_one.list_lru_walk_node.nfsd_file_lru=
_wa
> lk_list.nfsd_file_acquire
>       2.91 =C2=B1  2%      -0.6        2.35 =C2=B1 10%  perf-profile.call=
trace.cycles-
> pp.entry_SYSCALL_64_after_hwframe
>       2.32 =C2=B1  2%      -0.4        1.91 =C2=B1 11%  perf-profile.call=
trace.cycles-
> pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.67 =C2=B1 10%      -0.4        0.30 =C2=B1101%  perf-profile.call=
trace.cycles-
> pp.lookup_dcache.__lookup_hash.filename_create.do_mkdirat.do_syscall_64
>       0.67 =C2=B1 10%      -0.4        0.30 =C2=B1101%  perf-profile.call=
trace.cycles-
> pp.__lookup_hash.filename_create.do_mkdirat.do_syscall_64.entry_SYSCALL_6=
4_a
> fter_hwframe
>       0.66 =C2=B1 11%      -0.4        0.29 =C2=B1101%  perf-profile.call=
trace.cycles-
> pp.nfs_do_lookup_revalidate.__nfs_lookup_revalidate.lookup_dcache.__looku=
p_h
> ash.filename_create
>       0.66 =C2=B1 11%      -0.4        0.30 =C2=B1101%  perf-profile.call=
trace.cycles-
> pp.__nfs_lookup_revalidate.lookup_dcache.__lookup_hash.filename_create.do=
_mk
> dirat
>       0.66 =C2=B1 10%      -0.4        0.29 =C2=B1101%  perf-profile.call=
trace.cycles-
> pp.nfs_lookup_revalidate_dentry.nfs_do_lookup_revalidate.__nfs_lookup_rev=
ali
> date.lookup_dcache.__lookup_hash
>       0.55 =C2=B1  6%      -0.3        0.27 =C2=B1100%  perf-profile.call=
trace.cycles-
> pp.tcp_rcv_established.tcp_v6_do_rcv.tcp_v6_rcv.ip6_protocol_deliver_rcu.=
ip6
> _input_finish
>       0.69 =C2=B1  4%      -0.3        0.41 =C2=B1 58%  perf-profile.call=
trace.cycles-
> pp.nfsd_file_lru_cb.__list_lru_walk_one.list_lru_walk_one.list_lru_walk_n=
ode
> .nfsd_file_lru_walk_list
>       0.74 =C2=B1 12%      -0.3        0.47 =C2=B1 59%  perf-profile.call=
trace.cycles-
> pp.do_mkdirat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.73 =C2=B1 11%      -0.3        0.46 =C2=B1 59%  perf-profile.call=
trace.cycles-
> pp.filename_create.do_mkdirat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.37 =C2=B1  2%      -0.2        1.18 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.do_nfsd_create.nfsd4_open.nfsd4_proc_compound.nfsd_dispatch.svc_proces=
s_c
> ommon
>       0.72 =C2=B1 11%      -0.1        0.60 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_star=
tup
> _64_no_verify
>       0.69 =C2=B1 11%      -0.1        0.57 =C2=B1  8%  perf-profile.call=
trace.cycles-
> pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       0.77 =C2=B1  5%      -0.1        0.68 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.vfs_create.do_nfsd_create.nfsd4_open.nfsd4_proc_compound.nfsd_dispatch
>       0.76 =C2=B1  5%      -0.1        0.67 =C2=B1  9%  perf-profile.call=
trace.cycles-
> pp.ext4_create.vfs_create.do_nfsd_create.nfsd4_open.nfsd4_proc_compound
>       0.75 =C2=B1  4%      +0.2        0.90 =C2=B1 12%  perf-profile.call=
trace.cycles-
> pp.schedule.worker_thread.kthread.ret_from_fork
>       0.71 =C2=B1  4%      +0.2        0.87 =C2=B1 12%  perf-profile.call=
trace.cycles-
> pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
>      73.06            +2.5       75.56        perf-profile.calltrace.cycl=
es-
> pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      73.07            +2.5       75.57        perf-profile.calltrace.cycl=
es-
> pp.start_secondary.secondary_startup_64_no_verify
>      73.02            +2.5       75.54        perf-profile.calltrace.cycl=
es-
> pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_veri=
fy
>      73.44            +2.7       76.09        perf-profile.calltrace.cycl=
es-
> pp.secondary_startup_64_no_verify
>       6.89 =C2=B1 27%      +2.8        9.65 =C2=B1  2%  perf-profile.call=
trace.cycles-
> pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_startu=
p_6
> 4_no_verify
>      22.40 =C2=B1  3%      -1.9       20.48 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.kthread
>      22.40 =C2=B1  3%      -1.9       20.48 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.ret_from_fork
>      13.59 =C2=B1  3%      -1.3       12.27 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.nfsd
>       9.24 =C2=B1  3%      -1.3        7.94 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.svc_process
>       9.24 =C2=B1  3%      -1.3        7.94 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.svc_process_common
>       8.72 =C2=B1  3%      -1.3        7.47 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.nfsd_dispatch
>       8.40 =C2=B1  3%      -1.2        7.21 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.nfsd4_proc_compound
>       5.73 =C2=B1  2%      -1.0        4.77 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.nfsd4_open
>       4.21 =C2=B1  3%      -0.8        3.45 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.nfsd4_process_open2
>       3.98 =C2=B1  3%      -0.7        3.26 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.nfsd_file_acquire
>       3.99 =C2=B1  3%      -0.7        3.27 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.nfs4_get_vfs_file
>       3.77 =C2=B1  4%      -0.7        3.08 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.nfsd_file_lru_walk_list
>       3.36 =C2=B1  7%      -0.7        2.69 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.try_to_wake_up
>       3.69 =C2=B1  4%      -0.7        3.02 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.list_lru_walk_node
>       3.69 =C2=B1  4%      -0.7        3.02 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.list_lru_walk_one
>       3.69 =C2=B1  4%      -0.7        3.02 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.__list_lru_walk_one
>       3.14 =C2=B1  2%      -0.6        2.58 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.entry_SYSCALL_64_after_hwframe
>       2.55 =C2=B1  2%      -0.4        2.13 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.do_syscall_64
>       2.58 =C2=B1  2%      -0.3        2.25 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.ttwu_do_activate
>       2.55 =C2=B1  2%      -0.3        2.22 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.enqueue_task_fair
>       2.41 =C2=B1  2%      -0.3        2.08 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.enqueue_entity
>       1.48 =C2=B1  6%      -0.3        1.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__queue_work
>       1.47 =C2=B1  9%      -0.3        1.17 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.queue_work_on
>       1.64 =C2=B1  6%      -0.2        1.40 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.stack_trace_save_tsk
>       1.05 =C2=B1  8%      -0.2        0.83 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.rpc_run_task
>       1.48 =C2=B1  4%      -0.2        1.27 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.__wake_up_common
>       0.80 =C2=B1  3%      -0.2        0.60 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.nfsd_file_lru_cb
>       1.97 =C2=B1  3%      -0.2        1.77 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.__account_scheduler_latency
>       1.42 =C2=B1  5%      -0.2        1.22 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.arch_stack_walk
>       0.79 =C2=B1 11%      -0.2        0.59 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.svc_xprt_do_enqueue
>       1.37 =C2=B1  2%      -0.2        1.18 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.do_nfsd_create
>       1.04 =C2=B1  5%      -0.2        0.86 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.unwind_next_frame
>       1.20 =C2=B1  7%      -0.2        1.03 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.autoremove_wake_function
>       0.69 =C2=B1  9%      -0.2        0.53 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.rpc_wake_up_queued_task
>       0.80 =C2=B1  7%      -0.2        0.63 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.rpc_wake_up_task_on_wq_queue_action_locked
>       0.73 =C2=B1 11%      -0.2        0.57 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.filename_create
>       0.74 =C2=B1 12%      -0.2        0.59 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.do_mkdirat
>       0.67 =C2=B1 10%      -0.1        0.52 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.__lookup_hash
>       0.67 =C2=B1 10%      -0.1        0.52 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.nfs_do_lookup_revalidate
>       0.69 =C2=B1 11%      -0.1        0.54 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.lookup_dcache
>       0.68 =C2=B1 10%      -0.1        0.53 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.__nfs_lookup_revalidate
>       0.66 =C2=B1 10%      -0.1        0.51 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.nfs_lookup_revalidate_dentry
>       0.62 =C2=B1 11%      -0.1        0.48 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p._nfs4_proc_lookup
>       0.62 =C2=B1 12%      -0.1        0.48 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.nfs4_do_call_sync
>       0.62 =C2=B1 12%      -0.1        0.48 =C2=B1 14%  perf-profile.chil=
dren.cycles-p
> p.nfs4_call_sync_custom
>       0.62 =C2=B1 11%      -0.1        0.48 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.nfs4_proc_lookup_common
>       0.27 =C2=B1 14%      -0.1        0.14 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.process_srcu
>       0.63 =C2=B1 12%      -0.1        0.49 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.nfs4_proc_lookup
>       0.58 =C2=B1  7%      -0.1        0.44 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.syscall_exit_to_user_mode
>       0.38 =C2=B1 13%      -0.1        0.24 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.select_task_rq_fair
>       0.55 =C2=B1 12%      -0.1        0.42 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.svc_xprt_received
>       0.25 =C2=B1 13%      -0.1        0.12 =C2=B1 15%  perf-profile.chil=
dren.cycles-p
> p.try_check_zero
>       0.72 =C2=B1 11%      -0.1        0.61 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.schedule_idle
>       0.40 =C2=B1  6%      -0.1        0.30 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.ext4_end_io_rsv_work
>       0.23 =C2=B1 49%      -0.1        0.14 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__remove_hrtimer
>       0.64 =C2=B1  9%      -0.1        0.54 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.generic_perform_write
>       0.77 =C2=B1  5%      -0.1        0.68 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.vfs_create
>       0.76 =C2=B1  5%      -0.1        0.67 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.ext4_create
>       0.61 =C2=B1  9%      -0.1        0.52 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.sched_clock
>       0.58 =C2=B1  9%      -0.1        0.50 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.native_sched_clock
>       0.45 =C2=B1 13%      -0.1        0.36 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.__ext4_mark_inode_dirty
>       0.11 =C2=B1  8%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-p
> p.cpumask_next
>       0.42 =C2=B1  8%      -0.1        0.34 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.ext4_map_blocks
>       0.19 =C2=B1 41%      -0.1        0.11 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.timerqueue_del
>       0.53 =C2=B1  4%      -0.1        0.46 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.lapic_next_deadline
>       0.44 =C2=B1  5%      -0.1        0.37 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p._raw_spin_unlock_irqrestore
>       0.51 =C2=B1  7%      -0.1        0.44 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.rpc_free_task
>       0.32 =C2=B1 14%      -0.1        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.ext4_ext_map_blocks
>       0.32 =C2=B1  7%      -0.1        0.26 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.get_next_timer_interrupt
>       0.28 =C2=B1 10%      -0.1        0.21 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.nfs_file_write
>       0.33 =C2=B1  9%      -0.1        0.27        perf-profile.children.=
cycles-p
> p.update_load_avg
>       0.31 =C2=B1 10%      -0.1        0.25 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.ksys_write
>       0.30 =C2=B1  9%      -0.1        0.24 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.vfs_write
>       0.29 =C2=B1 10%      -0.1        0.23 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.new_sync_write
>       0.11 =C2=B1  6%      -0.1        0.05 =C2=B1 59%  perf-profile.chil=
dren.cycles-p
> p.rcu_gp_kthread
>       0.23 =C2=B1  6%      -0.1        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.__switch_to
>       0.24 =C2=B1  7%      -0.1        0.18 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.__dev_queue_xmit
>       0.18 =C2=B1 12%      -0.1        0.12 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.ext4_convert_unwritten_io_end_vec
>       0.14 =C2=B1 16%      -0.1        0.08 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.check_preempt_curr
>       0.23 =C2=B1  8%      -0.1        0.18 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__ext4_find_entry
>       0.18 =C2=B1 14%      -0.1        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.ext4_mark_iloc_dirty
>       0.33 =C2=B1 10%      -0.1        0.28 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.nfs_file_fsync
>       0.33 =C2=B1 10%      -0.0        0.28 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__x64_sys_fsync
>       0.33 =C2=B1 10%      -0.0        0.28 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.do_fsync
>       0.27 =C2=B1  8%      -0.0        0.23 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.memset_erms
>       0.16 =C2=B1 19%      -0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.nfsd_cache_lookup
>       0.15 =C2=B1 21%      -0.0        0.11 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.ext4_mb_new_blocks
>       0.15 =C2=B1 16%      -0.0        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-p
> p.ext4_do_update_inode
>       0.23 =C2=B1  4%      -0.0        0.18 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.tick_nohz_idle_exit
>       0.27 =C2=B1  7%      -0.0        0.23 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__ext4_journal_get_write_access
>       0.15 =C2=B1  5%      -0.0        0.11 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.dev_hard_start_xmit
>       0.24 =C2=B1  6%      -0.0        0.20 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.__switch_to_asm
>       0.20 =C2=B1  4%      -0.0        0.16 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.ext4_nfs_commit_metadata
>       0.12 =C2=B1 16%      -0.0        0.09 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.__list_add_valid
>       0.23 =C2=B1  4%      -0.0        0.20 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.orc_find
>       0.18 =C2=B1  6%      -0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.nfsd_create_setattr
>       0.19 =C2=B1  4%      -0.0        0.16 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.ext4_write_inode
>       0.14 =C2=B1 13%      -0.0        0.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-p
> p.ext4_convert_unwritten_extents
>       0.07 =C2=B1 15%      -0.0        0.04 =C2=B1 57%  perf-profile.chil=
dren.cycles-p
> p.fsnotify_put_mark
>       0.11 =C2=B1 13%      -0.0        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.nfsd_file_delayed_close
>       0.08 =C2=B1 14%      -0.0        0.04 =C2=B1 60%  perf-profile.chil=
dren.cycles-p
> p.fsnotify_connector_destroy_workfn
>       0.20 =C2=B1  3%      -0.0        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-p
> p.svc_generic_init_request
>       0.10 =C2=B1 15%      -0.0        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.nfsd_file_dispose_list
>       0.10 =C2=B1 12%      -0.0        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.nfsd_file_free
>       0.15 =C2=B1  5%      -0.0        0.12 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.__ext4_read_dirblock
>       0.07 =C2=B1 10%      -0.0        0.04 =C2=B1 58%  perf-profile.chil=
dren.cycles-p
> p.netif_rx_internal
>       0.17 =C2=B1  4%      -0.0        0.14 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.rpc_wait_bit_killable
>       0.15 =C2=B1  9%      -0.0        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.generic_write_end
>       0.14 =C2=B1  6%      -0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.loopback_xmit
>       0.07 =C2=B1  7%      -0.0        0.04 =C2=B1 58%  perf-profile.chil=
dren.cycles-p
> p.nfs_write_begin
>       0.10 =C2=B1 21%      -0.0        0.07 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.__might_sleep
>       0.11 =C2=B1 19%      -0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.get_cpu_device
>       0.11 =C2=B1  7%      -0.0        0.09 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.nfs4_set_delegation
>       0.12 =C2=B1  8%      -0.0        0.10 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.smpboot_thread_fn
>       0.08 =C2=B1 10%      -0.0        0.06        perf-profile.children.=
cycles-p
> p.ksys_read
>       0.08 =C2=B1 15%      +0.0        0.11 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.xprt_free_slot
>       0.62 =C2=B1  4%      +0.0        0.67 =C2=B1  2%  perf-profile.chil=
dren.cycles-p
> p.native_irq_return_iret
>       0.01 =C2=B1173%      +0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.xprt_lookup_rqst
>       0.22 =C2=B1  8%      +0.1        0.27 =C2=B1  8%  perf-profile.chil=
dren.cycles-p
> p.call_decode
>       0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-p
> p.wait_for_completion
>       0.01 =C2=B1173%      +0.1        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.nfs4_xdr_dec_open
>       0.20 =C2=B1 10%      +0.1        0.27 =C2=B1 13%  perf-profile.chil=
dren.cycles-p
> p.rpc_release_resources_task
>       0.12 =C2=B1 16%      +0.1        0.21 =C2=B1 22%  perf-profile.chil=
dren.cycles-p
> p.__release_sock
>       0.11 =C2=B1 18%      +0.1        0.22 =C2=B1 16%  perf-profile.chil=
dren.cycles-p
> p.__lock_sock
>       0.00            +0.1        0.10 =C2=B1  8%  perf-profile.children.=
cycles-p
> p.available_idle_cpu
>       0.40 =C2=B1 12%      +0.1        0.52 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.release_sock
>       0.25 =C2=B1 16%      +0.1        0.38 =C2=B1 11%  perf-profile.chil=
dren.cycles-p
> p.lock_sock_nested
>       0.33 =C2=B1 18%      +0.1        0.46 =C2=B1 10%  perf-profile.chil=
dren.cycles-p
> p.idle_cpu
>       1.67 =C2=B1  2%      +0.2        1.83 =C2=B1  5%  perf-profile.chil=
dren.cycles-p
> p.schedule
>       0.90 =C2=B1  5%      +0.2        1.14 =C2=B1  9%  perf-profile.chil=
dren.cycles-p
> p.pick_next_task_fair
>       0.54 =C2=B1 19%      +0.3        0.84 =C2=B1 17%  perf-profile.chil=
dren.cycles-p
> p.newidle_balance
>      73.07            +2.5       75.57        perf-profile.children.cycle=
s-p
> p.start_secondary
>      73.44            +2.7       76.09        perf-profile.children.cycle=
s-p
> p.secondary_startup_64_no_verify
>      73.44            +2.7       76.09        perf-profile.children.cycle=
s-p
> p.cpu_startup_entry
>      73.43            +2.7       76.08        perf-profile.children.cycle=
s-p
> p.do_idle
>       6.95 =C2=B1 27%      +2.8        9.72 =C2=B1  3%  perf-profile.chil=
dren.cycles-p
> p.menu_select
>       2.84 =C2=B1  4%      -0.4        2.40 =C2=B1 10%  perf-profile.self=
.cycles-pp.__
> list_lru_walk_one
>       0.71 =C2=B1  2%      -0.2        0.52 =C2=B1  6%  perf-profile.self=
.cycles-pp.nf
> sd_file_lru_cb
>       0.40 =C2=B1 13%      -0.1        0.28 =C2=B1 10%  perf-profile.self=
.cycles-pp.__
> schedule
>       0.56 =C2=B1  9%      -0.1        0.45 =C2=B1 14%  perf-profile.self=
.cycles-pp.un
> wind_next_frame
>       0.49 =C2=B1 13%      -0.1        0.39 =C2=B1  5%  perf-profile.self=
.cycles-pp.do
> _idle
>       0.55 =C2=B1  7%      -0.1        0.48 =C2=B1  3%  perf-profile.self=
.cycles-pp.na
> tive_sched_clock
>       0.15 =C2=B1 14%      -0.1        0.08 =C2=B1 19%  perf-profile.self=
.cycles-pp.tr
> y_check_zero
>       0.53 =C2=B1  4%      -0.1        0.46 =C2=B1  4%  perf-profile.self=
.cycles-pp.la
> pic_next_deadline
>       0.19 =C2=B1  4%      -0.1        0.12 =C2=B1  8%  perf-profile.self=
.cycles-pp.en
> queue_entity
>       0.22 =C2=B1  6%      -0.1        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.__
> switch_to
>       0.61 =C2=B1  2%      -0.0        0.57 =C2=B1  6%  perf-profile.self=
.cycles-pp.re
> ad_tsc
>       0.26 =C2=B1  9%      -0.0        0.22 =C2=B1  4%  perf-profile.self=
.cycles-pp.me
> mset_erms
>       0.23 =C2=B1  6%      -0.0        0.20 =C2=B1  9%  perf-profile.self=
.cycles-pp.__
> switch_to_asm
>       0.08 =C2=B1 19%      -0.0        0.05 =C2=B1 58%  perf-profile.self=
.cycles-pp.nf
> sd_cache_lookup
>       0.15 =C2=B1  7%      -0.0        0.12 =C2=B1  8%  perf-profile.self=
.cycles-pp.pr
> ocess_one_work
>       0.11 =C2=B1 19%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.ge
> t_cpu_device
>       0.11 =C2=B1  6%      -0.0        0.09 =C2=B1  4%  perf-profile.self=
.cycles-pp.rc
> u_idle_exit
>       0.09 =C2=B1 13%      -0.0        0.07 =C2=B1 10%  perf-profile.self=
.cycles-pp.rb
> _erase
>       0.08 =C2=B1 19%      -0.0        0.06 =C2=B1  6%  perf-profile.self=
.cycles-pp.__
> might_sleep
>       0.62 =C2=B1  4%      +0.0        0.66 =C2=B1  2%  perf-profile.self=
.cycles-pp.na
> tive_irq_return_iret
>       0.00            +0.1        0.10 =C2=B1  7%  perf-profile.self.cycl=
es-pp.av
> ailable_idle_cpu
>       4.77 =C2=B1 35%      +2.7        7.51 =C2=B1  7%  perf-profile.self=
.cycles-pp.me
> nu_select
>       1570           +14.7%       1801        interrupts.9:IO-APIC.9-fast=
eoi
> .acpi
>    1324464 =C2=B1  5%     +36.6%    1809364 =C2=B1  3%  interrupts.CAL:Fu=
nction_call_i
> nterrupts
>    1571518           +11.9%    1758181 =C2=B1  4%  interrupts.CPU0.LOC:Lo=
cal_time
> r_interrupts
>       1570           +14.7%       1801        interrupts.CPU1.9:IO-APIC.9=
-fa
> steoi.acpi
>       7564 =C2=B1 32%     +40.9%      10658 =C2=B1 18%  interrupts.CPU1.C=
AL:Function_c
> all_interrupts
>    1571514           +11.9%    1758602 =C2=B1  4%  interrupts.CPU1.LOC:Lo=
cal_time
> r_interrupts
>    1571476           +11.9%    1758208 =C2=B1  4%  interrupts.CPU10.LOC:L=
ocal_tim
> er_interrupts
>    1571559           +11.9%    1758428 =C2=B1  4%  interrupts.CPU100.LOC:=
Local_ti
> mer_interrupts
>       7111 =C2=B1 36%     +56.1%      11099 =C2=B1 16%  interrupts.CPU101=
.CAL:Function
> _call_interrupts
>    1571606           +11.9%    1758253 =C2=B1  4%  interrupts.CPU101.LOC:=
Local_ti
> mer_interrupts
>    1571563           +11.9%    1758094 =C2=B1  4%  interrupts.CPU102.LOC:=
Local_ti
> mer_interrupts
>    1571594           +11.9%    1758188 =C2=B1  4%  interrupts.CPU103.LOC:=
Local_ti
> mer_interrupts
>    1571446           +11.9%    1758300 =C2=B1  4%  interrupts.CPU104.LOC:=
Local_ti
> mer_interrupts
>    1571453           +11.9%    1757857 =C2=B1  4%  interrupts.CPU105.LOC:=
Local_ti
> mer_interrupts
>    1571515           +11.9%    1758195 =C2=B1  4%  interrupts.CPU106.LOC:=
Local_ti
> mer_interrupts
>       7032 =C2=B1 28%     +55.4%      10929 =C2=B1 17%  interrupts.CPU107=
.CAL:Function
> _call_interrupts
>    1571453           +11.9%    1757935 =C2=B1  4%  interrupts.CPU107.LOC:=
Local_ti
> mer_interrupts
>       7241 =C2=B1 28%     +56.3%      11314 =C2=B1 16%  interrupts.CPU108=
.CAL:Function
> _call_interrupts
>    1571447           +11.9%    1758555 =C2=B1  4%  interrupts.CPU108.LOC:=
Local_ti
> mer_interrupts
>       7224 =C2=B1 35%     +64.5%      11883 =C2=B1 16%  interrupts.CPU109=
.CAL:Function
> _call_interrupts
>    1571503           +11.9%    1758334 =C2=B1  4%  interrupts.CPU109.LOC:=
Local_ti
> mer_interrupts
>       2038 =C2=B1 44%     +55.3%       3166 =C2=B1 28%  interrupts.CPU109=
.RES:Reschedu
> ling_interrupts
>    1571525           +11.9%    1757891 =C2=B1  4%  interrupts.CPU11.LOC:L=
ocal_tim
> er_interrupts
>    1571474           +11.9%    1757821 =C2=B1  4%  interrupts.CPU110.LOC:=
Local_ti
> mer_interrupts
>       6855 =C2=B1 32%     +59.8%      10954 =C2=B1 23%  interrupts.CPU111=
.CAL:Function
> _call_interrupts
>    1571411           +11.9%    1758346 =C2=B1  4%  interrupts.CPU111.LOC:=
Local_ti
> mer_interrupts
>    1571418           +11.9%    1758291 =C2=B1  4%  interrupts.CPU112.LOC:=
Local_ti
> mer_interrupts
>    1571455           +11.9%    1757771 =C2=B1  4%  interrupts.CPU113.LOC:=
Local_ti
> mer_interrupts
>       7128 =C2=B1 38%     +50.8%      10752 =C2=B1 21%  interrupts.CPU114=
.CAL:Function
> _call_interrupts
>    1571418           +11.9%    1757754 =C2=B1  4%  interrupts.CPU114.LOC:=
Local_ti
> mer_interrupts
>       7110 =C2=B1 28%     +45.2%      10323 =C2=B1 28%  interrupts.CPU115=
.CAL:Function
> _call_interrupts
>    1571413           +11.9%    1758041 =C2=B1  4%  interrupts.CPU115.LOC:=
Local_ti
> mer_interrupts
>    1571425           +11.9%    1757878 =C2=B1  4%  interrupts.CPU116.LOC:=
Local_ti
> mer_interrupts
>    1571444           +11.9%    1758072 =C2=B1  4%  interrupts.CPU117.LOC:=
Local_ti
> mer_interrupts
>       6629 =C2=B1 34%     +58.2%      10489 =C2=B1 18%  interrupts.CPU118=
.CAL:Function
> _call_interrupts
>    1571433           +11.9%    1758168 =C2=B1  4%  interrupts.CPU118.LOC:=
Local_ti
> mer_interrupts
>       6405 =C2=B1 29%     +66.5%      10665 =C2=B1 25%  interrupts.CPU119=
.CAL:Function
> _call_interrupts
>    1571571           +11.9%    1758278 =C2=B1  4%  interrupts.CPU119.LOC:=
Local_ti
> mer_interrupts
>       7234 =C2=B1 25%     +42.6%      10314 =C2=B1 17%  interrupts.CPU12.=
CAL:Function_
> call_interrupts
>    1571490           +11.9%    1758493 =C2=B1  4%  interrupts.CPU12.LOC:L=
ocal_tim
> er_interrupts
>    1571325           +11.5%    1751618 =C2=B1  5%  interrupts.CPU120.LOC:=
Local_ti
> mer_interrupts
>    1571408           +11.5%    1751720 =C2=B1  5%  interrupts.CPU121.LOC:=
Local_ti
> mer_interrupts
>    1571469           +11.5%    1752729 =C2=B1  5%  interrupts.CPU122.LOC:=
Local_ti
> mer_interrupts
>    1571362           +11.5%    1752712 =C2=B1  5%  interrupts.CPU123.LOC:=
Local_ti
> mer_interrupts
>    1571349           +11.5%    1752732 =C2=B1  5%  interrupts.CPU124.LOC:=
Local_ti
> mer_interrupts
>    1571357           +11.6%    1753048 =C2=B1  5%  interrupts.CPU125.LOC:=
Local_ti
> mer_interrupts
>    1571360           +11.6%    1753217 =C2=B1  5%  interrupts.CPU126.LOC:=
Local_ti
> mer_interrupts
>    1571340           +11.5%    1752748 =C2=B1  5%  interrupts.CPU127.LOC:=
Local_ti
> mer_interrupts
>    1571342           +11.6%    1754096 =C2=B1  4%  interrupts.CPU128.LOC:=
Local_ti
> mer_interrupts
>    1571336           +11.5%    1752749 =C2=B1  5%  interrupts.CPU129.LOC:=
Local_ti
> mer_interrupts
>       7130 =C2=B1 30%     +57.5%      11229 =C2=B1 14%  interrupts.CPU13.=
CAL:Function_
> call_interrupts
>    1571532           +11.9%    1758400 =C2=B1  4%  interrupts.CPU13.LOC:L=
ocal_tim
> er_interrupts
>       1963 =C2=B1 46%     +77.7%       3488 =C2=B1 28%  interrupts.CPU13.=
RES:Reschedul
> ing_interrupts
>    1571335           +11.6%    1753331 =C2=B1  5%  interrupts.CPU130.LOC:=
Local_ti
> mer_interrupts
>    1571328           +11.6%    1753576 =C2=B1  4%  interrupts.CPU131.LOC:=
Local_ti
> mer_interrupts
>    1571320           +11.6%    1752971 =C2=B1  5%  interrupts.CPU132.LOC:=
Local_ti
> mer_interrupts
>    1571345           +11.6%    1754169 =C2=B1  4%  interrupts.CPU133.LOC:=
Local_ti
> mer_interrupts
>    1571410           +11.6%    1754060 =C2=B1  4%  interrupts.CPU134.LOC:=
Local_ti
> mer_interrupts
>    1571418           +11.6%    1753287 =C2=B1  5%  interrupts.CPU135.LOC:=
Local_ti
> mer_interrupts
>    1571288           +11.6%    1753149 =C2=B1  5%  interrupts.CPU136.LOC:=
Local_ti
> mer_interrupts
>    1571321           +11.5%    1752492 =C2=B1  5%  interrupts.CPU137.LOC:=
Local_ti
> mer_interrupts
>    1571355           +11.5%    1752335 =C2=B1  5%  interrupts.CPU138.LOC:=
Local_ti
> mer_interrupts
>    1571375           +11.5%    1751623 =C2=B1  5%  interrupts.CPU139.LOC:=
Local_ti
> mer_interrupts
>    1571472           +11.9%    1757954 =C2=B1  4%  interrupts.CPU14.LOC:L=
ocal_tim
> er_interrupts
>    1571339           +11.5%    1751465 =C2=B1  5%  interrupts.CPU140.LOC:=
Local_ti
> mer_interrupts
>    1571357           +11.5%    1751624 =C2=B1  5%  interrupts.CPU141.LOC:=
Local_ti
> mer_interrupts
>    1571308           +11.5%    1752124 =C2=B1  5%  interrupts.CPU142.LOC:=
Local_ti
> mer_interrupts
>    1571398           +11.5%    1752826 =C2=B1  5%  interrupts.CPU143.LOC:=
Local_ti
> mer_interrupts
>       5781 =C2=B1 36%     +54.6%       8939 =C2=B1 19%  interrupts.CPU144=
.CAL:Function
> _call_interrupts
>    1571442           +13.1%    1776765 =C2=B1  2%  interrupts.CPU144.LOC:=
Local_ti
> mer_interrupts
>     107.50 =C2=B1 14%     +92.6%     207.00 =C2=B1 57%  interrupts.CPU144=
.NMI:Non-mask
> able_interrupts
>     107.50 =C2=B1 14%     +92.6%     207.00 =C2=B1 57%  interrupts.CPU144=
.PMI:Performa
> nce_monitoring_interrupts
>       1707 =C2=B1 46%     +52.9%       2609 =C2=B1 20%  interrupts.CPU144=
.RES:Reschedu
> ling_interrupts
>    1571457           +13.0%    1776376 =C2=B1  2%  interrupts.CPU145.LOC:=
Local_ti
> mer_interrupts
>       5753 =C2=B1 38%     +52.0%       8746 =C2=B1 20%  interrupts.CPU146=
.CAL:Function
> _call_interrupts
>    1571405           +13.0%    1776393 =C2=B1  2%  interrupts.CPU146.LOC:=
Local_ti
> mer_interrupts
>    1571395           +13.0%    1776089 =C2=B1  2%  interrupts.CPU147.LOC:=
Local_ti
> mer_interrupts
>       6269 =C2=B1 46%     +57.1%       9852 =C2=B1 30%  interrupts.CPU148=
.CAL:Function
> _call_interrupts
>    1571492           +13.0%    1775445 =C2=B1  2%  interrupts.CPU148.LOC:=
Local_ti
> mer_interrupts
>     123.50 =C2=B1 24%     +59.7%     197.25 =C2=B1 28%  interrupts.CPU148=
.NMI:Non-mask
> able_interrupts
>     123.50 =C2=B1 24%     +59.7%     197.25 =C2=B1 28%  interrupts.CPU148=
.PMI:Performa
> nce_monitoring_interrupts
>       6063 =C2=B1 28%     +54.1%       9345 =C2=B1 26%  interrupts.CPU149=
.CAL:Function
> _call_interrupts
>    1571401           +13.0%    1775353 =C2=B1  2%  interrupts.CPU149.LOC:=
Local_ti
> mer_interrupts
>       6410 =C2=B1 31%     +62.1%      10391 =C2=B1 13%  interrupts.CPU15.=
CAL:Function_
> call_interrupts
>    1571577           +11.9%    1758516 =C2=B1  4%  interrupts.CPU15.LOC:L=
ocal_tim
> er_interrupts
>       1933 =C2=B1 45%     +65.3%       3195 =C2=B1 25%  interrupts.CPU15.=
RES:Reschedul
> ing_interrupts
>    1571164           +13.1%    1776226 =C2=B1  2%  interrupts.CPU150.LOC:=
Local_ti
> mer_interrupts
>     101.00 =C2=B1  2%    +154.0%     256.50 =C2=B1 24%  interrupts.CPU150=
.NMI:Non-mask
> able_interrupts
>     101.00 =C2=B1  2%    +154.0%     256.50 =C2=B1 24%  interrupts.CPU150=
.PMI:Performa
> nce_monitoring_interrupts
>    1571414           +13.0%    1775886 =C2=B1  2%  interrupts.CPU151.LOC:=
Local_ti
> mer_interrupts
>      96.50 =C2=B1  9%    +256.7%     344.25 =C2=B1 64%  interrupts.CPU151=
.NMI:Non-mask
> able_interrupts
>      96.50 =C2=B1  9%    +256.7%     344.25 =C2=B1 64%  interrupts.CPU151=
.PMI:Performa
> nce_monitoring_interrupts
>       5793 =C2=B1 36%     +82.6%      10576 =C2=B1 39%  interrupts.CPU152=
.CAL:Function
> _call_interrupts
>    1571433           +13.1%    1777013 =C2=B1  2%  interrupts.CPU152.LOC:=
Local_ti
> mer_interrupts
>    1571367           +13.0%    1776222 =C2=B1  2%  interrupts.CPU153.LOC:=
Local_ti
> mer_interrupts
>      97.75 =C2=B1  5%    +198.5%     291.75 =C2=B1 52%  interrupts.CPU153=
.NMI:Non-mask
> able_interrupts
>      97.75 =C2=B1  5%    +198.5%     291.75 =C2=B1 52%  interrupts.CPU153=
.PMI:Performa
> nce_monitoring_interrupts
>       5949 =C2=B1 26%     +50.3%       8939 =C2=B1 11%  interrupts.CPU154=
.CAL:Function
> _call_interrupts
>    1571354           +13.0%    1776300 =C2=B1  2%  interrupts.CPU154.LOC:=
Local_ti
> mer_interrupts
>       6129 =C2=B1 30%     +52.6%       9355 =C2=B1 16%  interrupts.CPU155=
.CAL:Function
> _call_interrupts
>    1571349           +13.0%    1776369 =C2=B1  2%  interrupts.CPU155.LOC:=
Local_ti
> mer_interrupts
>    1571338           +13.0%    1776046 =C2=B1  2%  interrupts.CPU156.LOC:=
Local_ti
> mer_interrupts
>      97.00 =C2=B1  3%    +176.8%     268.50 =C2=B1 45%  interrupts.CPU156=
.NMI:Non-mask
> able_interrupts
>      97.00 =C2=B1  3%    +176.8%     268.50 =C2=B1 45%  interrupts.CPU156=
.PMI:Performa
> nce_monitoring_interrupts
>       5702 =C2=B1 49%     +73.3%       9883 =C2=B1 14%  interrupts.CPU157=
.CAL:Function
> _call_interrupts
>    1571248           +13.1%    1776434 =C2=B1  2%  interrupts.CPU157.LOC:=
Local_ti
> mer_interrupts
>      95.00 =C2=B1  6%    +188.7%     274.25 =C2=B1 40%  interrupts.CPU157=
.NMI:Non-mask
> able_interrupts
>      95.00 =C2=B1  6%    +188.7%     274.25 =C2=B1 40%  interrupts.CPU157=
.PMI:Performa
> nce_monitoring_interrupts
>       5527 =C2=B1 37%     +54.6%       8543 =C2=B1 26%  interrupts.CPU158=
.CAL:Function
> _call_interrupts
>    1571410           +13.1%    1776746 =C2=B1  2%  interrupts.CPU158.LOC:=
Local_ti
> mer_interrupts
>     101.25 =C2=B1 10%    +214.3%     318.25 =C2=B1 70%  interrupts.CPU158=
.NMI:Non-mask
> able_interrupts
>     101.25 =C2=B1 10%    +214.3%     318.25 =C2=B1 70%  interrupts.CPU158=
.PMI:Performa
> nce_monitoring_interrupts
>    1571340           +13.0%    1775837 =C2=B1  2%  interrupts.CPU159.LOC:=
Local_ti
> mer_interrupts
>       5673 =C2=B1 25%     +63.8%       9290 =C2=B1 15%  interrupts.CPU16.=
CAL:Function_
> call_interrupts
>    1571427           +11.9%    1758347 =C2=B1  4%  interrupts.CPU16.LOC:L=
ocal_tim
> er_interrupts
>    1571365           +13.1%    1776527 =C2=B1  2%  interrupts.CPU160.LOC:=
Local_ti
> mer_interrupts
>      91.25 =C2=B1 10%    +180.0%     255.50 =C2=B1 43%  interrupts.CPU160=
.NMI:Non-mask
> able_interrupts
>      91.25 =C2=B1 10%    +180.0%     255.50 =C2=B1 43%  interrupts.CPU160=
.PMI:Performa
> nce_monitoring_interrupts
>    1571367           +13.1%    1777516 =C2=B1  2%  interrupts.CPU161.LOC:=
Local_ti
> mer_interrupts
>    1571387           +13.0%    1775901 =C2=B1  2%  interrupts.CPU162.LOC:=
Local_ti
> mer_interrupts
>     115.00 =C2=B1 15%    +147.4%     284.50 =C2=B1 31%  interrupts.CPU162=
.NMI:Non-mask
> able_interrupts
>     115.00 =C2=B1 15%    +147.4%     284.50 =C2=B1 31%  interrupts.CPU162=
.PMI:Performa
> nce_monitoring_interrupts
>    1571341           +13.1%    1777434 =C2=B1  2%  interrupts.CPU163.LOC:=
Local_ti
> mer_interrupts
>     104.00 =C2=B1  7%    +159.4%     269.75 =C2=B1  8%  interrupts.CPU163=
.NMI:Non-mask
> able_interrupts
>     104.00 =C2=B1  7%    +159.4%     269.75 =C2=B1  8%  interrupts.CPU163=
.PMI:Performa
> nce_monitoring_interrupts
>    1571350           +13.1%    1776463 =C2=B1  2%  interrupts.CPU164.LOC:=
Local_ti
> mer_interrupts
>     106.00 =C2=B1 13%    +158.3%     273.75 =C2=B1 21%  interrupts.CPU164=
.NMI:Non-mask
> able_interrupts
>     106.00 =C2=B1 13%    +158.3%     273.75 =C2=B1 21%  interrupts.CPU164=
.PMI:Performa
> nce_monitoring_interrupts
>    1571340           +13.0%    1775911 =C2=B1  2%  interrupts.CPU165.LOC:=
Local_ti
> mer_interrupts
>      98.75 =C2=B1  6%    +188.1%     284.50 =C2=B1 29%  interrupts.CPU165=
.NMI:Non-mask
> able_interrupts
>      98.75 =C2=B1  6%    +188.1%     284.50 =C2=B1 29%  interrupts.CPU165=
.PMI:Performa
> nce_monitoring_interrupts
>       5483 =C2=B1 50%     +61.2%       8836 =C2=B1 21%  interrupts.CPU166=
.CAL:Function
> _call_interrupts
>    1571382           +13.0%    1775636 =C2=B1  2%  interrupts.CPU166.LOC:=
Local_ti
> mer_interrupts
>      97.00 =C2=B1  2%    +187.1%     278.50 =C2=B1 18%  interrupts.CPU166=
.NMI:Non-mask
> able_interrupts
>      97.00 =C2=B1  2%    +187.1%     278.50 =C2=B1 18%  interrupts.CPU166=
.PMI:Performa
> nce_monitoring_interrupts
>       5261 =C2=B1 43%     +63.8%       8617 =C2=B1 14%  interrupts.CPU167=
.CAL:Function
> _call_interrupts
>    1571360           +13.1%    1776482 =C2=B1  2%  interrupts.CPU167.LOC:=
Local_ti
> mer_interrupts
>      95.75 =C2=B1  4%    +176.5%     264.75 =C2=B1 20%  interrupts.CPU167=
.NMI:Non-mask
> able_interrupts
>      95.75 =C2=B1  4%    +176.5%     264.75 =C2=B1 20%  interrupts.CPU167=
.PMI:Performa
> nce_monitoring_interrupts
>       6362 =C2=B1 24%     +33.7%       8508 =C2=B1 19%  interrupts.CPU168=
.CAL:Function
> _call_interrupts
>    1571374           +12.8%    1772101 =C2=B1  3%  interrupts.CPU168.LOC:=
Local_ti
> mer_interrupts
>       6789 =C2=B1 28%     +33.0%       9028 =C2=B1 16%  interrupts.CPU169=
.CAL:Function
> _call_interrupts
>    1571469           +12.7%    1771617 =C2=B1  3%  interrupts.CPU169.LOC:=
Local_ti
> mer_interrupts
>       6508 =C2=B1 36%     +52.8%       9947 =C2=B1 11%  interrupts.CPU17.=
CAL:Function_
> call_interrupts
>    1571540           +11.9%    1757876 =C2=B1  4%  interrupts.CPU17.LOC:L=
ocal_tim
> er_interrupts
>    1571393           +12.8%    1772281 =C2=B1  3%  interrupts.CPU170.LOC:=
Local_ti
> mer_interrupts
>    1571380           +12.7%    1771009 =C2=B1  3%  interrupts.CPU171.LOC:=
Local_ti
> mer_interrupts
>    1571457           +12.8%    1772045 =C2=B1  3%  interrupts.CPU172.LOC:=
Local_ti
> mer_interrupts
>    1571292           +12.8%    1771962 =C2=B1  3%  interrupts.CPU173.LOC:=
Local_ti
> mer_interrupts
>    1571456           +12.8%    1773046 =C2=B1  3%  interrupts.CPU174.LOC:=
Local_ti
> mer_interrupts
>    1571412           +12.8%    1772363 =C2=B1  3%  interrupts.CPU175.LOC:=
Local_ti
> mer_interrupts
>    1571459           +12.8%    1771895 =C2=B1  3%  interrupts.CPU176.LOC:=
Local_ti
> mer_interrupts
>    1571377           +12.8%    1772461 =C2=B1  3%  interrupts.CPU177.LOC:=
Local_ti
> mer_interrupts
>    1571377           +12.8%    1772661 =C2=B1  3%  interrupts.CPU178.LOC:=
Local_ti
> mer_interrupts
>    1571387           +12.8%    1772647 =C2=B1  3%  interrupts.CPU179.LOC:=
Local_ti
> mer_interrupts
>       6679 =C2=B1 25%     +53.3%      10237 =C2=B1 18%  interrupts.CPU18.=
CAL:Function_
> call_interrupts
>    1571460           +11.9%    1757826 =C2=B1  4%  interrupts.CPU18.LOC:L=
ocal_tim
> er_interrupts
>       1731 =C2=B1 41%     +73.2%       2997 =C2=B1 26%  interrupts.CPU18.=
RES:Reschedul
> ing_interrupts
>       6617 =C2=B1 28%     +37.2%       9081 =C2=B1 20%  interrupts.CPU180=
.CAL:Function
> _call_interrupts
>    1571360           +12.8%    1772200 =C2=B1  3%  interrupts.CPU180.LOC:=
Local_ti
> mer_interrupts
>    1571400           +12.7%    1771335 =C2=B1  3%  interrupts.CPU181.LOC:=
Local_ti
> mer_interrupts
>    1571394           +12.7%    1771685 =C2=B1  3%  interrupts.CPU182.LOC:=
Local_ti
> mer_interrupts
>    1571289           +12.8%    1771944 =C2=B1  3%  interrupts.CPU183.LOC:=
Local_ti
> mer_interrupts
>    1571385           +12.8%    1772428 =C2=B1  3%  interrupts.CPU184.LOC:=
Local_ti
> mer_interrupts
>    1571355           +12.8%    1772001 =C2=B1  3%  interrupts.CPU185.LOC:=
Local_ti
> mer_interrupts
>    1571346           +12.8%    1772114 =C2=B1  3%  interrupts.CPU186.LOC:=
Local_ti
> mer_interrupts
>    1571366           +12.8%    1771718 =C2=B1  3%  interrupts.CPU187.LOC:=
Local_ti
> mer_interrupts
>       6240 =C2=B1 29%     +56.9%       9788 =C2=B1 22%  interrupts.CPU188=
.CAL:Function
> _call_interrupts
>    1571405           +12.7%    1771649 =C2=B1  3%  interrupts.CPU188.LOC:=
Local_ti
> mer_interrupts
>    1571343           +12.9%    1773772 =C2=B1  3%  interrupts.CPU189.LOC:=
Local_ti
> mer_interrupts
>       6269 =C2=B1 26%     +64.3%      10303 =C2=B1 15%  interrupts.CPU19.=
CAL:Function_
> call_interrupts
>    1571440           +11.9%    1758092 =C2=B1  4%  interrupts.CPU19.LOC:L=
ocal_tim
> er_interrupts
>       1849 =C2=B1 37%     +64.8%       3048 =C2=B1 26%  interrupts.CPU19.=
RES:Reschedul
> ing_interrupts
>    1571337           +12.8%    1771894 =C2=B1  3%  interrupts.CPU190.LOC:=
Local_ti
> mer_interrupts
>    1571464           +12.7%    1770522 =C2=B1  3%  interrupts.CPU191.LOC:=
Local_ti
> mer_interrupts
>       7005 =C2=B1 25%     +64.1%      11494 =C2=B1 17%  interrupts.CPU2.C=
AL:Function_c
> all_interrupts
>    1571542           +11.9%    1758447 =C2=B1  4%  interrupts.CPU2.LOC:Lo=
cal_time
> r_interrupts
>       6469 =C2=B1 33%     +63.6%      10586 =C2=B1 12%  interrupts.CPU20.=
CAL:Function_
> call_interrupts
>    1571491           +11.9%    1757959 =C2=B1  4%  interrupts.CPU20.LOC:L=
ocal_tim
> er_interrupts
>       1780 =C2=B1 40%     +73.0%       3080 =C2=B1 23%  interrupts.CPU20.=
RES:Reschedul
> ing_interrupts
>       6254 =C2=B1 33%     +65.5%      10351 =C2=B1 18%  interrupts.CPU21.=
CAL:Function_
> call_interrupts
>    1571585           +11.9%    1758282 =C2=B1  4%  interrupts.CPU21.LOC:L=
ocal_tim
> er_interrupts
>       6173 =C2=B1 28%     +76.5%      10895 =C2=B1 16%  interrupts.CPU22.=
CAL:Function_
> call_interrupts
>    1571589           +11.9%    1758208 =C2=B1  4%  interrupts.CPU22.LOC:L=
ocal_tim
> er_interrupts
>    1571495           +11.9%    1758396 =C2=B1  4%  interrupts.CPU23.LOC:L=
ocal_tim
> er_interrupts
>    1571375           +11.5%    1751638 =C2=B1  5%  interrupts.CPU24.LOC:L=
ocal_tim
> er_interrupts
>    1571440           +11.5%    1751799 =C2=B1  5%  interrupts.CPU25.LOC:L=
ocal_tim
> er_interrupts
>    1571373           +11.5%    1752727 =C2=B1  5%  interrupts.CPU26.LOC:L=
ocal_tim
> er_interrupts
>    1571371           +11.5%    1752541 =C2=B1  5%  interrupts.CPU27.LOC:L=
ocal_tim
> er_interrupts
>    1571388           +11.5%    1752624 =C2=B1  5%  interrupts.CPU28.LOC:L=
ocal_tim
> er_interrupts
>    1571392           +11.6%    1753078 =C2=B1  5%  interrupts.CPU29.LOC:L=
ocal_tim
> er_interrupts
>       7386 =C2=B1 37%     +48.1%      10941 =C2=B1 18%  interrupts.CPU3.C=
AL:Function_c
> all_interrupts
>    1571498           +11.9%    1758586 =C2=B1  4%  interrupts.CPU3.LOC:Lo=
cal_time
> r_interrupts
>       2110 =C2=B1 43%     +72.5%       3640 =C2=B1 20%  interrupts.CPU3.R=
ES:Rescheduli
> ng_interrupts
>    1571355           +11.6%    1753237 =C2=B1  5%  interrupts.CPU30.LOC:L=
ocal_tim
> er_interrupts
>    1571387           +11.5%    1752766 =C2=B1  5%  interrupts.CPU31.LOC:L=
ocal_tim
> er_interrupts
>    1571391           +11.6%    1754094 =C2=B1  4%  interrupts.CPU32.LOC:L=
ocal_tim
> er_interrupts
>    1571367           +11.5%    1752782 =C2=B1  5%  interrupts.CPU33.LOC:L=
ocal_tim
> er_interrupts
>    1571368           +11.6%    1753263 =C2=B1  5%  interrupts.CPU34.LOC:L=
ocal_tim
> er_interrupts
>    1571320           +11.6%    1753617 =C2=B1  4%  interrupts.CPU35.LOC:L=
ocal_tim
> er_interrupts
>    1571350           +11.6%    1752985 =C2=B1  5%  interrupts.CPU36.LOC:L=
ocal_tim
> er_interrupts
>    1571370           +11.6%    1754190 =C2=B1  4%  interrupts.CPU37.LOC:L=
ocal_tim
> er_interrupts
>     356.00 =C2=B1 39%     -47.8%     185.75 =C2=B1 72%  interrupts.CPU37.=
NMI:Non-maska
> ble_interrupts
>     356.00 =C2=B1 39%     -47.8%     185.75 =C2=B1 72%  interrupts.CPU37.=
PMI:Performan
> ce_monitoring_interrupts
>    1571391           +11.6%    1754034 =C2=B1  4%  interrupts.CPU38.LOC:L=
ocal_tim
> er_interrupts
>    1571359           +11.6%    1753223 =C2=B1  5%  interrupts.CPU39.LOC:L=
ocal_tim
> er_interrupts
>       7553 =C2=B1 35%     +57.4%      11889 =C2=B1 14%  interrupts.CPU4.C=
AL:Function_c
> all_interrupts
>    1571493           +11.9%    1758369 =C2=B1  4%  interrupts.CPU4.LOC:Lo=
cal_time
> r_interrupts
>    1571365           +11.6%    1753178 =C2=B1  5%  interrupts.CPU40.LOC:L=
ocal_tim
> er_interrupts
>    1571426           +11.5%    1752480 =C2=B1  5%  interrupts.CPU41.LOC:L=
ocal_tim
> er_interrupts
>    1571523           +11.5%    1752313 =C2=B1  5%  interrupts.CPU42.LOC:L=
ocal_tim
> er_interrupts
>    1571341           +11.5%    1751659 =C2=B1  5%  interrupts.CPU43.LOC:L=
ocal_tim
> er_interrupts
>    1571387           +11.5%    1751476 =C2=B1  5%  interrupts.CPU44.LOC:L=
ocal_tim
> er_interrupts
>    1571338           +11.5%    1751654 =C2=B1  5%  interrupts.CPU45.LOC:L=
ocal_tim
> er_interrupts
>    1571380           +11.5%    1752146 =C2=B1  5%  interrupts.CPU46.LOC:L=
ocal_tim
> er_interrupts
>    1571375           +11.6%    1752926 =C2=B1  5%  interrupts.CPU47.LOC:L=
ocal_tim
> er_interrupts
>    1571336           +13.1%    1776713 =C2=B1  2%  interrupts.CPU48.LOC:L=
ocal_tim
> er_interrupts
>    1571459           +13.0%    1776369 =C2=B1  2%  interrupts.CPU49.LOC:L=
ocal_tim
> er_interrupts
>     139.75 =C2=B1 41%    +116.6%     302.75 =C2=B1 40%  interrupts.CPU49.=
NMI:Non-maska
> ble_interrupts
>     139.75 =C2=B1 41%    +116.6%     302.75 =C2=B1 40%  interrupts.CPU49.=
PMI:Performan
> ce_monitoring_interrupts
>    1571490           +11.9%    1758226 =C2=B1  4%  interrupts.CPU5.LOC:Lo=
cal_time
> r_interrupts
>    1571360           +13.1%    1776493 =C2=B1  2%  interrupts.CPU50.LOC:L=
ocal_tim
> er_interrupts
>     140.00 =C2=B1 33%    +107.1%     290.00 =C2=B1 34%  interrupts.CPU50.=
NMI:Non-maska
> ble_interrupts
>     140.00 =C2=B1 33%    +107.1%     290.00 =C2=B1 34%  interrupts.CPU50.=
PMI:Performan
> ce_monitoring_interrupts
>    1571393           +13.0%    1776059 =C2=B1  2%  interrupts.CPU51.LOC:L=
ocal_tim
> er_interrupts
>     130.25 =C2=B1 23%    +106.0%     268.25 =C2=B1 32%  interrupts.CPU51.=
NMI:Non-maska
> ble_interrupts
>     130.25 =C2=B1 23%    +106.0%     268.25 =C2=B1 32%  interrupts.CPU51.=
PMI:Performan
> ce_monitoring_interrupts
>       5700 =C2=B1 39%     +59.5%       9094 =C2=B1 18%  interrupts.CPU52.=
CAL:Function_
> call_interrupts
>    1571400           +13.0%    1775615 =C2=B1  2%  interrupts.CPU52.LOC:L=
ocal_tim
> er_interrupts
>     142.50 =C2=B1 17%     +98.9%     283.50 =C2=B1 15%  interrupts.CPU52.=
NMI:Non-maska
> ble_interrupts
>     142.50 =C2=B1 17%     +98.9%     283.50 =C2=B1 15%  interrupts.CPU52.=
PMI:Performan
> ce_monitoring_interrupts
>       5492 =C2=B1 41%     +77.7%       9760 =C2=B1 20%  interrupts.CPU53.=
CAL:Function_
> call_interrupts
>    1571493           +13.0%    1775363 =C2=B1  2%  interrupts.CPU53.LOC:L=
ocal_tim
> er_interrupts
>     127.00 =C2=B1 30%    +121.3%     281.00 =C2=B1 31%  interrupts.CPU53.=
NMI:Non-maska
> ble_interrupts
>     127.00 =C2=B1 30%    +121.3%     281.00 =C2=B1 31%  interrupts.CPU53.=
PMI:Performan
> ce_monitoring_interrupts
>    1571424           +13.0%    1776314 =C2=B1  2%  interrupts.CPU54.LOC:L=
ocal_tim
> er_interrupts
>       5442 =C2=B1 37%     +68.3%       9160 =C2=B1 20%  interrupts.CPU55.=
CAL:Function_
> call_interrupts
>    1571365           +13.0%    1775909 =C2=B1  2%  interrupts.CPU55.LOC:L=
ocal_tim
> er_interrupts
>     119.00 =C2=B1 26%    +172.1%     323.75 =C2=B1 58%  interrupts.CPU55.=
NMI:Non-maska
> ble_interrupts
>     119.00 =C2=B1 26%    +172.1%     323.75 =C2=B1 58%  interrupts.CPU55.=
PMI:Performan
> ce_monitoring_interrupts
>    1571363           +13.1%    1777085 =C2=B1  2%  interrupts.CPU56.LOC:L=
ocal_tim
> er_interrupts
>       5388 =C2=B1 24%     +81.0%       9754 =C2=B1 17%  interrupts.CPU57.=
CAL:Function_
> call_interrupts
>    1571395           +13.0%    1776266 =C2=B1  2%  interrupts.CPU57.LOC:L=
ocal_tim
> er_interrupts
>     128.00 =C2=B1 40%    +127.1%     290.75 =C2=B1 52%  interrupts.CPU57.=
NMI:Non-maska
> ble_interrupts
>     128.00 =C2=B1 40%    +127.1%     290.75 =C2=B1 52%  interrupts.CPU57.=
PMI:Performan
> ce_monitoring_interrupts
>       5401 =C2=B1 36%     +59.7%       8625 =C2=B1 14%  interrupts.CPU58.=
CAL:Function_
> call_interrupts
>    1571351           +13.0%    1776317 =C2=B1  2%  interrupts.CPU58.LOC:L=
ocal_tim
> er_interrupts
>       5520 =C2=B1 35%     +68.6%       9306 =C2=B1  8%  interrupts.CPU59.=
CAL:Function_
> call_interrupts
>    1571335           +13.0%    1776369 =C2=B1  2%  interrupts.CPU59.LOC:L=
ocal_tim
> er_interrupts
>       6874 =C2=B1 33%     +69.1%      11626 =C2=B1  9%  interrupts.CPU6.C=
AL:Function_c
> all_interrupts
>    1571488           +11.9%    1758049 =C2=B1  4%  interrupts.CPU6.LOC:Lo=
cal_time
> r_interrupts
>       2121 =C2=B1 46%     +59.6%       3385 =C2=B1 19%  interrupts.CPU6.R=
ES:Rescheduli
> ng_interrupts
>       5636 =C2=B1 35%    +115.9%      12167 =C2=B1 24%  interrupts.CPU60.=
CAL:Function_
> call_interrupts
>    1571320           +13.0%    1776046 =C2=B1  2%  interrupts.CPU60.LOC:L=
ocal_tim
> er_interrupts
>       5271 =C2=B1 31%     +74.1%       9178 =C2=B1 18%  interrupts.CPU61.=
CAL:Function_
> call_interrupts
>    1571373           +13.0%    1776435 =C2=B1  2%  interrupts.CPU61.LOC:L=
ocal_tim
> er_interrupts
>     116.75 =C2=B1 25%    +137.9%     277.75 =C2=B1 42%  interrupts.CPU61.=
NMI:Non-maska
> ble_interrupts
>     116.75 =C2=B1 25%    +137.9%     277.75 =C2=B1 42%  interrupts.CPU61.=
PMI:Performan
> ce_monitoring_interrupts
>       5171 =C2=B1 28%    +138.9%      12356 =C2=B1 35%  interrupts.CPU62.=
CAL:Function_
> call_interrupts
>    1571395           +13.1%    1776795 =C2=B1  2%  interrupts.CPU62.LOC:L=
ocal_tim
> er_interrupts
>       5926 =C2=B1 26%     +79.0%      10609 =C2=B1 26%  interrupts.CPU63.=
CAL:Function_
> call_interrupts
>    1571461           +13.0%    1775811 =C2=B1  2%  interrupts.CPU63.LOC:L=
ocal_tim
> er_interrupts
>     115.75 =C2=B1 21%    +152.9%     292.75 =C2=B1 18%  interrupts.CPU63.=
NMI:Non-maska
> ble_interrupts
>     115.75 =C2=B1 21%    +152.9%     292.75 =C2=B1 18%  interrupts.CPU63.=
PMI:Performan
> ce_monitoring_interrupts
>       5383 =C2=B1 35%     +78.5%       9611 =C2=B1 23%  interrupts.CPU64.=
CAL:Function_
> call_interrupts
>    1571546           +13.1%    1776683 =C2=B1  2%  interrupts.CPU64.LOC:L=
ocal_tim
> er_interrupts
>     114.25 =C2=B1 22%    +153.4%     289.50 =C2=B1 28%  interrupts.CPU64.=
NMI:Non-maska
> ble_interrupts
>     114.25 =C2=B1 22%    +153.4%     289.50 =C2=B1 28%  interrupts.CPU64.=
PMI:Performan
> ce_monitoring_interrupts
>       5220 =C2=B1 36%     +97.8%      10326 =C2=B1 14%  interrupts.CPU65.=
CAL:Function_
> call_interrupts
>    1571337           +13.1%    1777595 =C2=B1  2%  interrupts.CPU65.LOC:L=
ocal_tim
> er_interrupts
>     114.50 =C2=B1 52%    +169.0%     308.00 =C2=B1 34%  interrupts.CPU65.=
NMI:Non-maska
> ble_interrupts
>     114.50 =C2=B1 52%    +169.0%     308.00 =C2=B1 34%  interrupts.CPU65.=
PMI:Performan
> ce_monitoring_interrupts
>       1391 =C2=B1 47%     +77.3%       2467 =C2=B1 12%  interrupts.CPU65.=
RES:Reschedul
> ing_interrupts
>       5124 =C2=B1 34%     +96.7%      10078 =C2=B1 17%  interrupts.CPU66.=
CAL:Function_
> call_interrupts
>    1571425           +13.0%    1776031 =C2=B1  2%  interrupts.CPU66.LOC:L=
ocal_tim
> er_interrupts
>     146.50 =C2=B1 41%    +101.7%     295.50 =C2=B1 35%  interrupts.CPU66.=
NMI:Non-maska
> ble_interrupts
>     146.50 =C2=B1 41%    +101.7%     295.50 =C2=B1 35%  interrupts.CPU66.=
PMI:Performan
> ce_monitoring_interrupts
>       5568 =C2=B1 29%     +74.4%       9713 =C2=B1 15%  interrupts.CPU67.=
CAL:Function_
> call_interrupts
>    1571386           +13.1%    1777493 =C2=B1  2%  interrupts.CPU67.LOC:L=
ocal_tim
> er_interrupts
>     128.00 =C2=B1 35%    +120.3%     282.00 =C2=B1  9%  interrupts.CPU67.=
NMI:Non-maska
> ble_interrupts
>     128.00 =C2=B1 35%    +120.3%     282.00 =C2=B1  9%  interrupts.CPU67.=
PMI:Performan
> ce_monitoring_interrupts
>       1481 =C2=B1 42%     +67.1%       2474 =C2=B1 15%  interrupts.CPU67.=
RES:Reschedul
> ing_interrupts
>    1571344           +13.1%    1776565 =C2=B1  2%  interrupts.CPU68.LOC:L=
ocal_tim
> er_interrupts
>     135.00 =C2=B1 43%    +101.5%     272.00 =C2=B1 23%  interrupts.CPU68.=
NMI:Non-maska
> ble_interrupts
>     135.00 =C2=B1 43%    +101.5%     272.00 =C2=B1 23%  interrupts.CPU68.=
PMI:Performan
> ce_monitoring_interrupts
>       5448 =C2=B1 31%     +74.4%       9500 =C2=B1 19%  interrupts.CPU69.=
CAL:Function_
> call_interrupts
>    1571367           +13.0%    1775965 =C2=B1  2%  interrupts.CPU69.LOC:L=
ocal_tim
> er_interrupts
>     122.00 =C2=B1 26%    +133.8%     285.25 =C2=B1 32%  interrupts.CPU69.=
NMI:Non-maska
> ble_interrupts
>     122.00 =C2=B1 26%    +133.8%     285.25 =C2=B1 32%  interrupts.CPU69.=
PMI:Performan
> ce_monitoring_interrupts
>       1525 =C2=B1 39%     +69.0%       2578 =C2=B1 22%  interrupts.CPU69.=
RES:Reschedul
> ing_interrupts
>       6939 =C2=B1 33%     +59.3%      11057 =C2=B1 17%  interrupts.CPU7.C=
AL:Function_c
> all_interrupts
>    1571596           +11.9%    1758241 =C2=B1  4%  interrupts.CPU7.LOC:Lo=
cal_time
> r_interrupts
>       5208 =C2=B1 43%     +76.8%       9207 =C2=B1 13%  interrupts.CPU70.=
CAL:Function_
> call_interrupts
>    1571372           +13.0%    1775685 =C2=B1  2%  interrupts.CPU70.LOC:L=
ocal_tim
> er_interrupts
>     129.75 =C2=B1 41%    +121.2%     287.00 =C2=B1 21%  interrupts.CPU70.=
NMI:Non-maska
> ble_interrupts
>     129.75 =C2=B1 41%    +121.2%     287.00 =C2=B1 21%  interrupts.CPU70.=
PMI:Performan
> ce_monitoring_interrupts
>       5454 =C2=B1 39%     +74.9%       9538 =C2=B1 17%  interrupts.CPU71.=
CAL:Function_
> call_interrupts
>    1571376           +13.1%    1776504 =C2=B1  2%  interrupts.CPU71.LOC:L=
ocal_tim
> er_interrupts
>    1571379           +12.8%    1772002 =C2=B1  3%  interrupts.CPU72.LOC:L=
ocal_tim
> er_interrupts
>    1571484           +12.7%    1771538 =C2=B1  3%  interrupts.CPU73.LOC:L=
ocal_tim
> er_interrupts
>    1571505           +12.8%    1772230 =C2=B1  3%  interrupts.CPU74.LOC:L=
ocal_tim
> er_interrupts
>       6464 =C2=B1 28%     +43.8%       9294 =C2=B1 15%  interrupts.CPU75.=
CAL:Function_
> call_interrupts
>    1571448           +12.7%    1770911 =C2=B1  3%  interrupts.CPU75.LOC:L=
ocal_tim
> er_interrupts
>       6363 =C2=B1 32%     +59.1%      10125 =C2=B1  9%  interrupts.CPU76.=
CAL:Function_
> call_interrupts
>    1571396           +12.8%    1771853 =C2=B1  3%  interrupts.CPU76.LOC:L=
ocal_tim
> er_interrupts
>       6789 =C2=B1 27%     +55.9%      10584 =C2=B1 20%  interrupts.CPU77.=
CAL:Function_
> call_interrupts
>    1571460           +12.8%    1771960 =C2=B1  3%  interrupts.CPU77.LOC:L=
ocal_tim
> er_interrupts
>       6668 =C2=B1 26%     +46.7%       9781 =C2=B1 22%  interrupts.CPU78.=
CAL:Function_
> call_interrupts
>    1571420           +12.8%    1773056 =C2=B1  3%  interrupts.CPU78.LOC:L=
ocal_tim
> er_interrupts
>    1571373           +12.8%    1772328 =C2=B1  3%  interrupts.CPU79.LOC:L=
ocal_tim
> er_interrupts
>    1571488           +11.9%    1758293 =C2=B1  4%  interrupts.CPU8.LOC:Lo=
cal_time
> r_interrupts
>       1907 =C2=B1 50%     +62.0%       3090 =C2=B1 26%  interrupts.CPU8.R=
ES:Rescheduli
> ng_interrupts
>       6798 =C2=B1 21%     +40.4%       9544 =C2=B1 21%  interrupts.CPU80.=
CAL:Function_
> call_interrupts
>    1571399           +12.8%    1771881 =C2=B1  3%  interrupts.CPU80.LOC:L=
ocal_tim
> er_interrupts
>    1571399           +12.8%    1772486 =C2=B1  3%  interrupts.CPU81.LOC:L=
ocal_tim
> er_interrupts
>       6879 =C2=B1 25%     +31.5%       9047 =C2=B1 12%  interrupts.CPU82.=
CAL:Function_
> call_interrupts
>    1571428           +12.8%    1772668 =C2=B1  3%  interrupts.CPU82.LOC:L=
ocal_tim
> er_interrupts
>       7160 =C2=B1 19%     +38.8%       9939 =C2=B1 14%  interrupts.CPU83.=
CAL:Function_
> call_interrupts
>    1571387           +12.8%    1772559 =C2=B1  3%  interrupts.CPU83.LOC:L=
ocal_tim
> er_interrupts
>    1571361           +12.8%    1772161 =C2=B1  3%  interrupts.CPU84.LOC:L=
ocal_tim
> er_interrupts
>       6627 =C2=B1 27%     +45.8%       9662 =C2=B1 12%  interrupts.CPU85.=
CAL:Function_
> call_interrupts
>    1571380           +12.7%    1771297 =C2=B1  3%  interrupts.CPU85.LOC:L=
ocal_tim
> er_interrupts
>       6438 =C2=B1 31%     +51.7%       9765 =C2=B1 23%  interrupts.CPU86.=
CAL:Function_
> call_interrupts
>    1571358           +12.7%    1771639 =C2=B1  3%  interrupts.CPU86.LOC:L=
ocal_tim
> er_interrupts
>    1571379           +12.8%    1771900 =C2=B1  3%  interrupts.CPU87.LOC:L=
ocal_tim
> er_interrupts
>    1571372           +12.8%    1772294 =C2=B1  3%  interrupts.CPU88.LOC:L=
ocal_tim
> er_interrupts
>       6195 =C2=B1 30%     +54.7%       9584 =C2=B1 19%  interrupts.CPU89.=
CAL:Function_
> call_interrupts
>    1571354           +12.8%    1771794 =C2=B1  3%  interrupts.CPU89.LOC:L=
ocal_tim
> er_interrupts
>    1571474           +11.9%    1757921 =C2=B1  4%  interrupts.CPU9.LOC:Lo=
cal_time
> r_interrupts
>       6385 =C2=B1 30%     +61.4%      10304 =C2=B1 23%  interrupts.CPU90.=
CAL:Function_
> call_interrupts
>    1571347           +12.8%    1772100 =C2=B1  3%  interrupts.CPU90.LOC:L=
ocal_tim
> er_interrupts
>       6416 =C2=B1 31%     +47.2%       9441 =C2=B1 24%  interrupts.CPU91.=
CAL:Function_
> call_interrupts
>    1571407           +12.7%    1771683 =C2=B1  3%  interrupts.CPU91.LOC:L=
ocal_tim
> er_interrupts
>       6290 =C2=B1 28%     +47.0%       9246 =C2=B1 28%  interrupts.CPU92.=
CAL:Function_
> call_interrupts
>    1571364           +12.7%    1771701 =C2=B1  3%  interrupts.CPU92.LOC:L=
ocal_tim
> er_interrupts
>       5833 =C2=B1 28%     +75.7%      10251 =C2=B1 25%  interrupts.CPU93.=
CAL:Function_
> call_interrupts
>    1571375           +12.9%    1773803 =C2=B1  3%  interrupts.CPU93.LOC:L=
ocal_tim
> er_interrupts
>    1571325           +12.8%    1771911 =C2=B1  3%  interrupts.CPU94.LOC:L=
ocal_tim
> er_interrupts
>    1571415           +12.7%    1770631 =C2=B1  3%  interrupts.CPU95.LOC:L=
ocal_tim
> er_interrupts
>    1571468           +11.9%    1758211 =C2=B1  4%  interrupts.CPU96.LOC:L=
ocal_tim
> er_interrupts
>       6357 =C2=B1 38%     +63.3%      10381 =C2=B1 17%  interrupts.CPU97.=
CAL:Function_
> call_interrupts
>    1571469           +11.9%    1758447 =C2=B1  4%  interrupts.CPU97.LOC:L=
ocal_tim
> er_interrupts
>       6181 =C2=B1 35%     +82.8%      11298 =C2=B1 20%  interrupts.CPU98.=
CAL:Function_
> call_interrupts
>    1571528           +11.9%    1758438 =C2=B1  4%  interrupts.CPU98.LOC:L=
ocal_tim
> er_interrupts
>       1955 =C2=B1 51%     +85.5%       3627 =C2=B1 39%  interrupts.CPU98.=
RES:Reschedul
> ing_interrupts
>       6570 =C2=B1 38%     +70.0%      11173 =C2=B1 22%  interrupts.CPU99.=
CAL:Function_
> call_interrupts
>    1571464           +11.9%    1758575 =C2=B1  4%  interrupts.CPU99.LOC:L=
ocal_tim
> er_interrupts
>       1897 =C2=B1 51%     +77.1%       3361 =C2=B1 34%  interrupts.CPU99.=
RES:Reschedul
> ing_interrupts
>  3.017e+08           +12.3%  3.388e+08 =C2=B1  3%  interrupts.LOC:Local_t=
imer_int
> errupts
>     410571 =C2=B1  3%     +14.4%     469494 =C2=B1  3%  interrupts.RES:Re=
scheduling_in
> terrupts
>
>
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ide
> d
> for informational purposes only. Any difference in system hardware or sof=
twa
> re
> design or configuration may affect actual performance.
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nte
> r
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ratio
> n
>
> Thanks,
> Oliver Sang
>
>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
>
>
> --
> Zhengjun Xing
>
>

--===============4606355843089124566==--

