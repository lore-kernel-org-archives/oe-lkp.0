Content-Type: multipart/mixed; boundary="===============7517317115165786257=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 19f92a030c: apachebench.requests_per_second -37.9% regression
Date: Wed, 13 Nov 2019 18:35:01 +0800
Message-ID: <20191113103501.GD65640@shbuild999.sh.intel.com>
In-Reply-To: <20191108083513.GB29418@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7517317115165786257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Fri, Nov 08, 2019 at 04:35:13PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -37.9% regression of apachebench.requests_per_second du=
e to commit:
> =

> commit: 19f92a030ca6d772ab44b22ee6a01378a8cb32d4 ("net: increase SOMAXCON=
N to 4096")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Any thought on this? The test is actually: =


	sysctl -w net.ipv4.tcp_syncookies=3D0
	enable_apache_mod auth_basic authn_core authn_file authz_core authz_host a=
uthz_user access_compat
	systemctl restart apache2
	ab -k -q -t 300 -n 1000000 -c 4000 127.0.0.1/

And some info about apachebench result is:

w/o patch:
	=

	Connection Times (ms)
		      min  mean[+/-sd] median   max
	Connect:        0    0  19.5      0    7145
	Processing:     0    4 110.0      3   21647
	Waiting:        0    2  92.4      1   21646
	Total:          0    4 121.1      3   24762

w/ patch:

	Connection Times (ms)
		      min  mean[+/-sd] median   max
	Connect:        0    0  43.2      0    7143
	Processing:     0   19 640.4      3   38708
	Waiting:        0   24 796.5      1   38708
	Total:          0   19 657.5      3   39725


Thanks,
Feng

> =

> in testcase: apachebench
> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 48=
G memory
> with following parameters:
> =

> 	runtime: 300s
> 	concurrency: 4000
> 	cluster: cs-localhost
> 	cpufreq_governor: performance
> 	ucode: 0x7000019
> =

> test-description: apachebench is a tool for benchmarking your Apache Hype=
rtext Transfer Protocol (HTTP) server.
> test-url: https://httpd.apache.org/docs/2.4/programs/ab.html
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
-------------+
> | testcase: change | apachebench: apachebench.requests_per_second -37.5% =
regression   |
> | test machine     | 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz wit=
h 48G memory |
> | test parameters  | cluster=3Dcs-localhost                              =
               |
> |                  | concurrency=3D8000                                  =
               |
> |                  | cpufreq_governor=3Dperformance                      =
               |
> |                  | runtime=3D300s                                      =
               |
> |                  | ucode=3D0x7000019                                   =
               |
> +------------------+-----------------------------------------------------=
-------------+
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

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/concurrency/cpufreq_governor/kconfig/rootfs/runtime/tbox=
_group/testcase/ucode:
>   cs-localhost/gcc-7/4000/performance/x86_64-rhel-7.6/debian-x86_64-2019-=
09-23.cgz/300s/lkp-bdw-de1/apachebench/0x7000019
> =

> commit: =

>   6d6f0383b6 ("netdevsim: Fix use-after-free during device dismantle")
>   19f92a030c ("net: increase SOMAXCONN to 4096")
> =

> 6d6f0383b697f004 19f92a030ca6d772ab44b22ee6a =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      22640 =C2=B1  4%     +71.1%      38734        apachebench.connection=
_time.processing.max
>      24701           +60.9%      39743        apachebench.connection_time=
.total.max
>      22639 =C2=B1  4%     +71.1%      38734        apachebench.connection=
_time.waiting.max
>      24701        +15042.0       39743        apachebench.max_latency.100%
>      40454           -37.9%      25128        apachebench.requests_per_se=
cond
>      25.69           +58.8%      40.79        apachebench.time.elapsed_ti=
me
>      25.69           +58.8%      40.79        apachebench.time.elapsed_ti=
me.max
>      79.00           -37.0%      49.75        apachebench.time.percent_of=
_cpu_this_job_got
>      98.88           +61.0%     159.18        apachebench.time_per_request
>     434631           -37.9%     269889        apachebench.transfer_rate
>    1.5e+08 =C2=B1 18%    +109.5%  3.141e+08 =C2=B1 27%  cpuidle.C3.time
>     578957 =C2=B1  7%     +64.1%     949934 =C2=B1 12%  cpuidle.C3.usage
>      79085 =C2=B1  4%     +24.8%      98720        meminfo.AnonHugePages
>      41176           +14.2%      47013        meminfo.PageTables
>      69429           -34.9%      45222        meminfo.max_used_kB
>      63.48           +12.7       76.15        mpstat.cpu.all.idle%
>       2.42 =C2=B1  2%      -0.9        1.56        mpstat.cpu.all.soft%
>      15.30            -5.2       10.13        mpstat.cpu.all.sys%
>      18.80            -6.6       12.16        mpstat.cpu.all.usr%
>      65.00           +17.7%      76.50        vmstat.cpu.id
>      17.00           -35.3%      11.00        vmstat.cpu.us
>       7.00 =C2=B1 24%     -50.0%       3.50 =C2=B1 14%  vmstat.procs.r
>      62957           -33.3%      42012        vmstat.system.cs
>      33174            -1.4%      32693        vmstat.system.in
>       5394 =C2=B1  5%     +16.3%       6272 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       5396 =C2=B1  5%     +16.3%       6275 =C2=B1  6%  sched_debug.cfs_r=
q:/.spread0.stddev
>      33982 =C2=B1 48%     -83.3%       5676 =C2=B1 47%  sched_debug.cpu.a=
vg_idle.min
>      26.75 =C2=B1 77%    +169.8%      72.17 =C2=B1 41%  sched_debug.cpu.s=
ched_count.avg
>     212.00 =C2=B1 90%    +168.2%     568.50 =C2=B1 50%  sched_debug.cpu.s=
ched_count.max
>      52.30 =C2=B1 89%    +182.5%     147.73 =C2=B1 48%  sched_debug.cpu.s=
ched_count.stddev
>      11.33 =C2=B1 80%    +193.9%      33.30 =C2=B1 42%  sched_debug.cpu.s=
ched_goidle.avg
>     104.50 =C2=B1 92%    +170.6%     282.75 =C2=B1 50%  sched_debug.cpu.s=
ched_goidle.max
>      26.18 =C2=B1 90%    +183.9%      74.31 =C2=B1 48%  sched_debug.cpu.s=
ched_goidle.stddev
>     959.00           -32.0%     652.00        turbostat.Avg_MHz
>      39.01           -11.2       27.79        turbostat.Busy%
>       1.46 =C2=B1  7%      -0.5        0.96 =C2=B1  5%  turbostat.C1%
>       9.58 =C2=B1  4%      -3.2        6.38        turbostat.C1E%
>     578646 =C2=B1  7%     +64.1%     949626 =C2=B1 12%  turbostat.C3
>     940073           +51.1%    1420298        turbostat.IRQ
>       2.20 =C2=B1 22%    +159.7%       5.71 =C2=B1 12%  turbostat.Pkg%pc2
>      31.22           -17.2%      25.86        turbostat.PkgWatt
>       4.74            -7.5%       4.39        turbostat.RAMWatt
>      93184            -1.6%      91678        proc-vmstat.nr_active_anon
>      92970            -1.8%      91314        proc-vmstat.nr_anon_pages
>     288405            +1.0%     291286        proc-vmstat.nr_file_pages
>       8307            +6.3%       8831        proc-vmstat.nr_kernel_stack
>      10315           +14.2%      11783        proc-vmstat.nr_page_table_p=
ages
>      21499            +6.0%      22798        proc-vmstat.nr_slab_unrecla=
imable
>     284131            +1.0%     286977        proc-vmstat.nr_unevictable
>      93184            -1.6%      91678        proc-vmstat.nr_zone_active_=
anon
>     284131            +1.0%     286977        proc-vmstat.nr_zone_unevict=
able
>     198874 =C2=B1  2%     +43.7%     285772 =C2=B1 16%  proc-vmstat.numa_=
hit
>     198874 =C2=B1  2%     +43.7%     285772 =C2=B1 16%  proc-vmstat.numa_=
local
>     249594 =C2=B1  3%     +59.6%     398267 =C2=B1 13%  proc-vmstat.pgall=
oc_normal
>    1216885           +12.7%    1371283 =C2=B1  3%  proc-vmstat.pgfault
>     179705 =C2=B1 16%     +82.9%     328634 =C2=B1 21%  proc-vmstat.pgfree
>     346.25 =C2=B1  5%    +133.5%     808.50 =C2=B1  2%  slabinfo.TCPv6.ac=
tive_objs
>     346.25 =C2=B1  5%    +134.4%     811.75 =C2=B1  2%  slabinfo.TCPv6.nu=
m_objs
>      22966           +15.6%      26559        slabinfo.anon_vma.active_ob=
js
>      23091           +15.5%      26664        slabinfo.anon_vma.num_objs
>      69747           +16.1%      81011        slabinfo.anon_vma_chain.act=
ive_objs
>       1094           +15.9%       1269        slabinfo.anon_vma_chain.act=
ive_slabs
>      70092           +15.9%      81259        slabinfo.anon_vma_chain.num=
_objs
>       1094           +15.9%       1269        slabinfo.anon_vma_chain.num=
_slabs
>       1649           +12.9%       1861        slabinfo.cred_jar.active_ob=
js
>       1649           +12.9%       1861        slabinfo.cred_jar.num_objs
>       4924           +20.0%       5907        slabinfo.pid.active_objs
>       4931           +19.9%       5912        slabinfo.pid.num_objs
>     266.50 =C2=B1  3%    +299.2%       1063        slabinfo.request_sock_=
TCP.active_objs
>     266.50 =C2=B1  3%    +299.2%       1063        slabinfo.request_sock_=
TCP.num_objs
>      11.50 =C2=B1  4%   +1700.0%     207.00 =C2=B1  4%  slabinfo.tw_sock_=
TCPv6.active_objs
>      11.50 =C2=B1  4%   +1700.0%     207.00 =C2=B1  4%  slabinfo.tw_sock_=
TCPv6.num_objs
>      41682           +16.0%      48360        slabinfo.vm_area_struct.act=
ive_objs
>       1046           +15.7%       1211        slabinfo.vm_area_struct.act=
ive_slabs
>      41879           +15.7%      48468        slabinfo.vm_area_struct.num=
_objs
>       1046           +15.7%       1211        slabinfo.vm_area_struct.num=
_slabs
>       4276 =C2=B1  2%     +10.0%       4705 =C2=B1  2%  slabinfo.vmap_are=
a.num_objs
>      21.25 =C2=B1 27%   +3438.8%     752.00 =C2=B1 83%  interrupts.36:IR-=
PCI-MSI.2621443-edge.eth0-TxRx-2
>      21.25 =C2=B1 20%   +1777.6%     399.00 =C2=B1155%  interrupts.38:IR-=
PCI-MSI.2621445-edge.eth0-TxRx-4
>      54333           +54.3%      83826        interrupts.CPU0.LOC:Local_t=
imer_interrupts
>      54370           +54.6%      84072        interrupts.CPU1.LOC:Local_t=
imer_interrupts
>      21.25 =C2=B1 27%   +3438.8%     752.00 =C2=B1 83%  interrupts.CPU10.=
36:IR-PCI-MSI.2621443-edge.eth0-TxRx-2
>      54236           +54.7%      83925        interrupts.CPU10.LOC:Local_=
timer_interrupts
>      54223           +54.3%      83655        interrupts.CPU11.LOC:Local_=
timer_interrupts
>     377.75 =C2=B1 21%     +27.1%     480.25 =C2=B1 10%  interrupts.CPU11.=
RES:Rescheduling_interrupts
>      21.25 =C2=B1 20%   +1777.6%     399.00 =C2=B1155%  interrupts.CPU12.=
38:IR-PCI-MSI.2621445-edge.eth0-TxRx-4
>      54279           +54.1%      83646        interrupts.CPU12.LOC:Local_=
timer_interrupts
>      53683           +55.3%      83365        interrupts.CPU13.LOC:Local_=
timer_interrupts
>      53887           +55.7%      83903        interrupts.CPU14.LOC:Local_=
timer_interrupts
>      54156           +54.7%      83803        interrupts.CPU15.LOC:Local_=
timer_interrupts
>      54041           +55.1%      83806        interrupts.CPU2.LOC:Local_t=
imer_interrupts
>      54042           +55.4%      83991        interrupts.CPU3.LOC:Local_t=
imer_interrupts
>      54081           +55.2%      83938        interrupts.CPU4.LOC:Local_t=
imer_interrupts
>      54322           +54.9%      84166        interrupts.CPU5.LOC:Local_t=
imer_interrupts
>      53586           +56.5%      83849        interrupts.CPU6.LOC:Local_t=
imer_interrupts
>      54049           +55.2%      83892        interrupts.CPU7.LOC:Local_t=
imer_interrupts
>      54056           +54.9%      83751        interrupts.CPU8.LOC:Local_t=
imer_interrupts
>      53862           +54.7%      83331        interrupts.CPU9.LOC:Local_t=
imer_interrupts
>     865212           +55.0%    1340925        interrupts.LOC:Local_timer_=
interrupts
>      16477 =C2=B1  4%     +32.2%      21779 =C2=B1  8%  softirqs.CPU0.TIM=
ER
>      18508 =C2=B1 15%     +39.9%      25891 =C2=B1 17%  softirqs.CPU1.TIM=
ER
>      16625 =C2=B1  8%     +21.3%      20166 =C2=B1  7%  softirqs.CPU10.TI=
MER
>       5906 =C2=B1 21%     +62.5%       9597 =C2=B1 13%  softirqs.CPU12.SC=
HED
>      17474 =C2=B1 12%     +29.4%      22610 =C2=B1  7%  softirqs.CPU12.TI=
MER
>       7680 =C2=B1 11%     +20.4%       9246 =C2=B1 14%  softirqs.CPU13.SC=
HED
>      45558 =C2=B1 36%     -37.8%      28320 =C2=B1 25%  softirqs.CPU14.NE=
T_RX
>      15365 =C2=B1  4%     +40.7%      21622 =C2=B1  5%  softirqs.CPU14.TI=
MER
>       8084 =C2=B1  4%     +18.7%       9599 =C2=B1 12%  softirqs.CPU15.RCU
>      16433 =C2=B1  4%     +41.2%      23203 =C2=B1 14%  softirqs.CPU2.TIM=
ER
>       8436 =C2=B1  7%     +19.9%      10117 =C2=B1 10%  softirqs.CPU3.RCU
>      15992 =C2=B1  3%     +48.5%      23742 =C2=B1 18%  softirqs.CPU3.TIM=
ER
>      17389 =C2=B1 14%     +38.7%      24116 =C2=B1 11%  softirqs.CPU4.TIM=
ER
>      17749 =C2=B1 13%     +42.2%      25235 =C2=B1 15%  softirqs.CPU5.TIM=
ER
>      16528 =C2=B1  9%     +28.3%      21200 =C2=B1  2%  softirqs.CPU6.TIM=
ER
>       8321 =C2=B1  8%     +31.3%      10929 =C2=B1  5%  softirqs.CPU7.RCU
>      18024 =C2=B1  8%     +28.8%      23212 =C2=B1  5%  softirqs.CPU7.TIM=
ER
>      15717 =C2=B1  5%     +27.1%      19983 =C2=B1  7%  softirqs.CPU8.TIM=
ER
>       7383 =C2=B1 11%     +30.5%       9632 =C2=B1  9%  softirqs.CPU9.SCH=
ED
>      16342 =C2=B1 18%     +41.0%      23037 =C2=B1 10%  softirqs.CPU9.TIM=
ER
>     148013           +10.2%     163086 =C2=B1  2%  softirqs.RCU
>     112139           +28.0%     143569        softirqs.SCHED
>     276690 =C2=B1  3%     +30.4%     360747 =C2=B1  3%  softirqs.TIMER
>  1.453e+09           -36.2%  9.273e+08        perf-stat.i.branch-instruct=
ions
>   67671486           -35.9%   43396843 =C2=B1  2%  perf-stat.i.branch-mis=
ses
>  5.188e+08           -35.3%  3.357e+08        perf-stat.i.cache-misses
>  5.188e+08           -35.3%  3.357e+08        perf-stat.i.cache-references
>      71149           -36.0%      45536        perf-stat.i.context-switches
>       2.92 =C2=B1  6%     +38.4%       4.04 =C2=B1  5%  perf-stat.i.cpi
>  1.581e+10           -33.8%  1.046e+10        perf-stat.i.cpu-cycles
>       1957 =C2=B1  6%     -35.4%       1264 =C2=B1  5%  perf-stat.i.cpu-m=
igrations
>      40.76 =C2=B1  2%     +33.0%      54.21        perf-stat.i.cycles-bet=
ween-cache-misses
>       0.64 =C2=B1  2%      +0.2        0.86 =C2=B1  2%  perf-stat.i.dTLB-=
load-miss-rate%
>   10720126 =C2=B1  2%     -34.0%    7071299        perf-stat.i.dTLB-load-=
misses
>   2.05e+09           -35.8%  1.315e+09        perf-stat.i.dTLB-loads
>       0.16            +0.0        0.18 =C2=B1  5%  perf-stat.i.dTLB-store=
-miss-rate%
>    1688635           -31.7%    1153595        perf-stat.i.dTLB-store-miss=
es
>   1.17e+09           -33.5%  7.777e+08        perf-stat.i.dTLB-stores
>      61.00 =C2=B1  6%      +8.7       69.70 =C2=B1  2%  perf-stat.i.iTLB-=
load-miss-rate%
>   13112146 =C2=B1 10%     -38.5%    8061589 =C2=B1 13%  perf-stat.i.iTLB-=
load-misses
>    9827689 =C2=B1  3%     -37.1%    6184316        perf-stat.i.iTLB-loads
>      7e+09           -36.2%  4.469e+09        perf-stat.i.instructions
>       0.42 =C2=B1  2%     -22.2%       0.33 =C2=B1  3%  perf-stat.i.ipc
>      45909           -32.4%      31036        perf-stat.i.minor-faults
>      45909           -32.4%      31036        perf-stat.i.page-faults
>       2.26            +3.6%       2.34        perf-stat.overall.cpi
>      30.47            +2.3%      31.16        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.44            -3.5%       0.43        perf-stat.overall.ipc
>  1.398e+09           -35.3%  9.049e+08        perf-stat.ps.branch-instruc=
tions
>   65124290           -35.0%   42353120 =C2=B1  2%  perf-stat.ps.branch-mi=
sses
>  4.993e+08           -34.4%  3.276e+08        perf-stat.ps.cache-misses
>  4.993e+08           -34.4%  3.276e+08        perf-stat.ps.cache-referenc=
es
>      68469           -35.1%      44440        perf-stat.ps.context-switch=
es
>  1.521e+10           -32.9%  1.021e+10        perf-stat.ps.cpu-cycles
>       1884 =C2=B1  6%     -34.5%       1234 =C2=B1  5%  perf-stat.ps.cpu-=
migrations
>   10314734 =C2=B1  2%     -33.1%    6899548        perf-stat.ps.dTLB-load=
-misses
>  1.973e+09           -34.9%  1.283e+09        perf-stat.ps.dTLB-loads
>    1624883           -30.7%    1125668        perf-stat.ps.dTLB-store-mis=
ses
>  1.126e+09           -32.6%  7.589e+08        perf-stat.ps.dTLB-stores
>   12617676 =C2=B1 10%     -37.7%    7866427 =C2=B1 13%  perf-stat.ps.iTLB=
-load-misses
>    9458687 =C2=B1  3%     -36.2%    6036594        perf-stat.ps.iTLB-loads
>  6.736e+09           -35.3%  4.361e+09        perf-stat.ps.instructions
>      44179           -31.4%      30288        perf-stat.ps.minor-faults
>      30791            +1.4%      31223        perf-stat.ps.msec
>      44179           -31.4%      30288        perf-stat.ps.page-faults
>      21.96 =C2=B1 69%     -22.0        0.00        perf-profile.calltrace=
.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      21.96 =C2=B1 69%     -22.0        0.00        perf-profile.calltrace=
.cycles-pp.__do_execve_file.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>      18.63 =C2=B1 89%     -18.6        0.00        perf-profile.calltrace=
.cycles-pp.search_binary_handler.__do_execve_file.__x64_sys_execve.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe
>      18.63 =C2=B1 89%     -18.6        0.00        perf-profile.calltrace=
.cycles-pp.load_elf_binary.search_binary_handler.__do_execve_file.__x64_sys=
_execve.do_syscall_64
>      13.15 =C2=B1 67%      -8.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_st=
artup_entry
>       8.81 =C2=B1133%      -8.0        0.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.secondary_startup_64
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry=
.start_secondary
>       6.70 =C2=B1100%      -6.7        0.00        perf-profile.calltrace=
.cycles-pp.__clear_user.load_elf_binary.search_binary_handler.__do_execve_f=
ile.__x64_sys_execve
>       4.79 =C2=B1108%      -4.8        0.00        perf-profile.calltrace=
.cycles-pp.free_pgtables.exit_mmap.mmput.do_exit.do_group_exit
>       4.79 =C2=B1108%      -4.8        0.00        perf-profile.calltrace=
.cycles-pp.unlink_file_vma.free_pgtables.exit_mmap.mmput.do_exit
>       4.79 =C2=B1108%      -4.0        0.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.mmput.do_exit.do_group_exit.get_signal.do_signal
>       4.79 =C2=B1108%      -4.0        0.83 =C2=B1173%  perf-profile.call=
trace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.get_signal
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.ioctl.perf_evsel__enable.evs=
el__enable.evlist__enable
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl.perf_evs=
el__enable.evsel__enable
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.event_function_call.perf_event_for_each_child._perf_ioctl.p=
erf_ioctl.do_vfs_ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.smp_call_function_single.event_function_call.perf_event_for=
_each_child._perf_ioctl.perf_ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.__libc_start_main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.main.__libc_start_main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.run_builtin.main.__libc_start_main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.cmd_record.run_builtin.main.__libc_start_main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.evlist__enable.cmd_record.run_builtin.main.__libc_start_main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.evsel__enable.evlist__enable.cmd_record.run_builtin.main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.perf_evsel__enable.evsel__enable.evlist__enable.cmd_record.=
run_builtin
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.ioctl.perf_evsel__enable.evsel__enable.evlist__enable.cmd_r=
ecord
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.ioctl.perf_evsel__enable
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.ksys_ioctl.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_vfs_ioctl.ksys_ioctl.__x64_sys_ioctl.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.perf_ioctl.do_vfs_ioctl.ksys_ioctl.__x64_sys_ioctl.do_sysca=
ll_64
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp._perf_ioctl.perf_ioctl.do_vfs_ioctl.ksys_ioctl.__x64_sys_io=
ctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.perf_event_for_each_child._perf_ioctl.perf_ioctl.do_vfs_ioc=
tl.ksys_ioctl
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.call=
trace.cycles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_signal.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.call=
trace.cycles-pp.get_signal.do_signal.exit_to_usermode_loop.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_group_exit.get_signal.do_signal.exit_to_usermode_loop.do=
_syscall_64
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.get_signal.do_signal.exit_to_usermode=
_loop
>      12.92 =C2=B1100%     +12.1       25.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>      12.92 =C2=B1100%     +12.1       25.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>      12.92 =C2=B1100%     +12.1       25.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>      11.25 =C2=B1101%     +13.8       25.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
>       9.58 =C2=B1108%     +15.4       25.00 =C2=B1173%  perf-profile.call=
trace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
>      21.96 =C2=B1 69%     -22.0        0.00        perf-profile.children.=
cycles-pp.__x64_sys_execve
>      21.96 =C2=B1 69%     -22.0        0.00        perf-profile.children.=
cycles-pp.__do_execve_file
>      18.63 =C2=B1 89%     -18.6        0.00        perf-profile.children.=
cycles-pp.search_binary_handler
>      18.63 =C2=B1 89%     -18.6        0.00        perf-profile.children.=
cycles-pp.load_elf_binary
>      13.15 =C2=B1 67%      -8.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.intel_idle
>       8.81 =C2=B1133%      -8.0        0.83 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.start_secondary
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.do_idle
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>      13.15 =C2=B1 67%      -7.3        5.83 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>       6.70 =C2=B1100%      -6.7        0.00        perf-profile.children.=
cycles-pp.__clear_user
>       6.46 =C2=B1100%      -6.5        0.00        perf-profile.children.=
cycles-pp.handle_mm_fault
>       4.79 =C2=B1108%      -4.8        0.00        perf-profile.children.=
cycles-pp.page_fault
>       4.79 =C2=B1108%      -4.8        0.00        perf-profile.children.=
cycles-pp.do_page_fault
>       4.79 =C2=B1108%      -4.8        0.00        perf-profile.children.=
cycles-pp.__do_page_fault
>       4.79 =C2=B1108%      -4.8        0.00        perf-profile.children.=
cycles-pp.free_pgtables
>       4.79 =C2=B1108%      -4.8        0.00        perf-profile.children.=
cycles-pp.unlink_file_vma
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.main
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.run_builtin
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.cmd_record
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.evlist__enable
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.evsel__enable
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.perf_evsel__enable
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.__x64_sys_ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.ksys_ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.do_vfs_ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.perf_ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp._perf_ioctl
>       5.24 =C2=B1112%      -0.2        5.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.perf_event_for_each_child
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.exit_to_usermode_loop
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.do_signal
>       4.79 =C2=B1108%      +8.5       13.33 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.get_signal
>       5.24 =C2=B1112%      +8.9       14.17 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.event_function_call
>       5.24 =C2=B1112%      +8.9       14.17 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.smp_call_function_single
>      12.92 =C2=B1100%     +12.1       25.00 =C2=B1173%  perf-profile.chil=
dren.cycles-pp.__x64_sys_exit_group
>      13.15 =C2=B1 67%      -8.2        5.00 =C2=B1173%  perf-profile.self=
.cycles-pp.intel_idle
>       6.46 =C2=B1100%      -6.5        0.00        perf-profile.self.cycl=
es-pp.unmap_page_range
>       5.24 =C2=B1112%      +8.9       14.17 =C2=B1173%  perf-profile.self=
.cycles-pp.smp_call_function_single
>=20
--===============7517317115165786257==--

