Content-Type: multipart/mixed; boundary="===============4676675549254076368=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] 0472e47660: fsmark.app_overhead 16.0% regression
Date: Thu, 30 May 2019 09:35:12 +0800
Message-ID: <f1abba58-5fd2-5f26-74cc-f72724cfa13f@linux.intel.com>
In-Reply-To: <20190520055434.GZ31424@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4676675549254076368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On 5/20/2019 1:54 PM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 16.0% improvement of fsmark.app_overhead due to commit:
> =

> =

> commit: 0472e476604998c127f3c80d291113e77c5676ac ("SUNRPC: Convert socket=
 page send code to use iov_iter()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: fsmark
> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz wit=
h 384G memory
> with following parameters:
> =

> 	iterations: 1x
> 	nr_threads: 64t
> 	disk: 1BRD_48G
> 	fs: xfs
> 	fs2: nfsv4
> 	filesize: 4M
> 	test_size: 40G
> 	sync_method: fsyncBeforeClose
> 	cpufreq_governor: performance
> =

> test-description: The fsmark is a file system benchmark to test synchrono=
us write workloads, for example, mail servers workload.
> test-url: https://sourceforge.net/projects/fsmark/
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

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_thre=
ads/rootfs/sync_method/tbox_group/test_size/testcase:
>    gcc-7/performance/1BRD_48G/4M/nfsv4/xfs/1x/x86_64-rhel-7.6/64t/debian-=
x86_64-2018-04-03.cgz/fsyncBeforeClose/lkp-ivb-ep01/40G/fsmark
> =

> commit:
>    e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use iov_iter_kvec()")
>    0472e47660 ("SUNRPC: Convert socket page send code to use iov_iter()")
> =

> e791f8e9380d945e 0472e476604998c127f3c80d291
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :4           50%           2:4     dmesg.WARNING:at#for_ip_in=
terrupt_entry/0x
>           %stddev     %change         %stddev
>               \          |                \
>    15118573 =C2=B1  2%     +16.0%   17538083        fsmark.app_overhead
>      510.93           -22.7%     395.12        fsmark.files_per_sec
>       24.90           +22.8%      30.57        fsmark.time.elapsed_time
>       24.90           +22.8%      30.57        fsmark.time.elapsed_time.m=
ax
>      288.00 =C2=B1  2%     -27.8%     208.00        fsmark.time.percent_o=
f_cpu_this_job_got
>       70.03 =C2=B1  2%     -11.3%      62.14        fsmark.time.system_ti=
me
>     4391964           -16.7%    3658341        meminfo.max_used_kB
>        6.10 =C2=B1  4%      +1.9        7.97 =C2=B1  3%  mpstat.cpu.all.i=
owait%
>        0.27            -0.0        0.24 =C2=B1  3%  mpstat.cpu.all.soft%
>    13668070 =C2=B1 40%    +118.0%   29801846 =C2=B1 19%  numa-numastat.no=
de0.local_node
>    13677774 =C2=B1 40%    +117.9%   29810258 =C2=B1 19%  numa-numastat.no=
de0.numa_hit
>        5.70 =C2=B1  3%     +32.1%       7.53 =C2=B1  3%  iostat.cpu.iowait
>       16.42 =C2=B1  2%      -5.8%      15.47        iostat.cpu.system
>        2.57            -4.1%       2.46        iostat.cpu.user
>     1406781 =C2=B1  2%     -15.5%    1188498        vmstat.io.bo
>      251792 =C2=B1  3%     -16.6%     209928        vmstat.system.cs
>       84841            -1.9%      83239        vmstat.system.in
>    97374502 =C2=B1 20%     +66.1%  1.617e+08 =C2=B1 17%  cpuidle.C1E.time
>      573934 =C2=B1 19%     +44.6%     829662 =C2=B1 26%  cpuidle.C1E.usage
>   5.892e+08 =C2=B1  8%     +15.3%  6.796e+08 =C2=B1  2%  cpuidle.C6.time
>     1968016 =C2=B1  3%     -15.1%    1670867 =C2=B1  3%  cpuidle.POLL.time
>      106420 =C2=B1 47%     +86.2%     198108 =C2=B1 35%  numa-meminfo.nod=
e0.Active
>      106037 =C2=B1 48%     +86.2%     197395 =C2=B1 35%  numa-meminfo.nod=
e0.Active(anon)
>      105052 =C2=B1 48%     +86.6%     196037 =C2=B1 35%  numa-meminfo.nod=
e0.AnonPages
>      212876 =C2=B1 24%     -41.5%     124572 =C2=B1 56%  numa-meminfo.nod=
e1.Active
>      211801 =C2=B1 24%     -41.5%     123822 =C2=B1 56%  numa-meminfo.nod=
e1.Active(anon)
>      208559 =C2=B1 24%     -42.2%     120547 =C2=B1 57%  numa-meminfo.nod=
e1.AnonPages
>        9955            +1.6%      10116        proc-vmstat.nr_kernel_stack
>      452.25 =C2=B1 59%    +280.9%       1722 =C2=B1100%  proc-vmstat.numa=
_hint_faults_local
>    33817303           +55.0%   52421773 =C2=B1  5%  proc-vmstat.numa_hit
>    33804286           +55.0%   52408807 =C2=B1  5%  proc-vmstat.numa_local
>    33923002           +81.8%   61663426 =C2=B1  5%  proc-vmstat.pgalloc_n=
ormal
>      184765            +9.3%     201985        proc-vmstat.pgfault
>    12840986          +216.0%   40581327 =C2=B1  7%  proc-vmstat.pgfree
>       31447 =C2=B1 11%     -26.1%      23253 =C2=B1 13%  sched_debug.cfs_=
rq:/.min_vruntime.max
>        4241 =C2=B1  3%     -12.2%       3724 =C2=B1 11%  sched_debug.cfs_=
rq:/.min_vruntime.stddev
>       20631 =C2=B1 11%     -36.7%      13069 =C2=B1 29%  sched_debug.cfs_=
rq:/.spread0.max
>        4238 =C2=B1  4%     -12.1%       3724 =C2=B1 11%  sched_debug.cfs_=
rq:/.spread0.stddev
>      497105 =C2=B1 19%     -16.0%     417777 =C2=B1  4%  sched_debug.cpu.=
avg_idle.avg
>       21199 =C2=B1 10%     -12.0%      18650 =C2=B1  3%  sched_debug.cpu.=
nr_load_updates.max
>        2229 =C2=B1 10%     -15.0%       1895 =C2=B1  4%  sched_debug.cpu.=
nr_load_updates.stddev
>        4.86 =C2=B1  5%     -23.6%       3.72 =C2=B1  5%  sched_debug.cpu.=
nr_uninterruptible.stddev
>      524.75 =C2=B1  2%     -10.7%     468.50        turbostat.Avg_MHz
>        5.26 =C2=B1 41%      -1.6        3.66 =C2=B1  2%  turbostat.C1%
>      573633 =C2=B1 19%     +44.6%     829267 =C2=B1 26%  turbostat.C1E
>        8.53 =C2=B1 20%      +3.4       11.88 =C2=B1 17%  turbostat.C1E%
>       76.75            -6.4%      71.86        turbostat.CorWatt
>     2534071 =C2=B1  2%     +16.2%    2943968        turbostat.IRQ
>        2.89 =C2=B1 24%     +52.9%       4.42 =C2=B1 22%  turbostat.Pkg%pc2
>      104.28            -4.6%      99.51        turbostat.PkgWatt
>        2289           +18.8%       2720        turbostat.SMI
>       26496 =C2=B1 47%     +86.2%      49347 =C2=B1 35%  numa-vmstat.node=
0.nr_active_anon
>       26251 =C2=B1 48%     +86.7%      49008 =C2=B1 35%  numa-vmstat.node=
0.nr_anon_pages
>       26496 =C2=B1 47%     +86.2%      49347 =C2=B1 35%  numa-vmstat.node=
0.nr_zone_active_anon
>     8272770 =C2=B1 35%     +99.6%   16515977 =C2=B1 17%  numa-vmstat.node=
0.numa_hit
>     8199681 =C2=B1 36%    +100.9%   16474282 =C2=B1 17%  numa-vmstat.node=
0.numa_local
>       52953 =C2=B1 24%     -41.5%      30956 =C2=B1 56%  numa-vmstat.node=
1.nr_active_anon
>       52144 =C2=B1 24%     -42.2%      30136 =C2=B1 57%  numa-vmstat.node=
1.nr_anon_pages
>        2899 =C2=B1  2%     -19.4%       2336 =C2=B1 10%  numa-vmstat.node=
1.nr_writeback
>       52953 =C2=B1 24%     -41.5%      30956 =C2=B1 56%  numa-vmstat.node=
1.nr_zone_active_anon
>        4549 =C2=B1  8%     -18.9%       3689 =C2=B1  7%  numa-vmstat.node=
1.nr_zone_write_pending
>       43.25            -1.6       41.69        perf-stat.i.cache-miss-rat=
e%
>      286377 =C2=B1  2%     -19.1%     231819 =C2=B1  2%  perf-stat.i.cont=
ext-switches
>   2.258e+10 =C2=B1  4%     -16.2%  1.893e+10 =C2=B1 10%  perf-stat.i.cpu-=
cycles
>        4084           -34.0%       2696 =C2=B1  2%  perf-stat.i.cpu-migra=
tions
>    21563675 =C2=B1 24%     -30.8%   14929445 =C2=B1  5%  perf-stat.i.dTLB=
-load-misses
>     1996341 =C2=B1 16%     -25.7%    1482826 =C2=B1  6%  perf-stat.i.dTLB=
-store-misses
>   2.313e+09 =C2=B1  4%     -11.7%  2.042e+09 =C2=B1  6%  perf-stat.i.dTLB=
-stores
>       75.93            -1.3       74.66        perf-stat.i.iTLB-load-miss=
-rate%
>     1561381 =C2=B1  3%     -13.4%    1351731        perf-stat.i.iTLB-load=
-misses
>      549643 =C2=B1  4%     -10.1%     494255 =C2=B1  3%  perf-stat.i.iTLB=
-loads
>        6423           -10.0%       5779        perf-stat.i.minor-faults
>       31.72 =C2=B1  2%      +4.4       36.14        perf-stat.i.node-load=
-miss-rate%
>    23492890           +23.5%   29020305 =C2=B1  3%  perf-stat.i.node-load=
-misses
>       15.13 =C2=B1  8%      +7.9       23.02 =C2=B1  3%  perf-stat.i.node=
-store-miss-rate%
>    11517615           +71.3%   19734054 =C2=B1  2%  perf-stat.i.node-stor=
e-misses
>        6423           -10.0%       5779        perf-stat.i.page-faults
>       16.88 =C2=B1 14%     +33.4%      22.52 =C2=B1 23%  perf-stat.overal=
l.MPKI
>       46.67            -2.4       44.31        perf-stat.overall.cache-mi=
ss-rate%
>       31.96            +4.8       36.72        perf-stat.overall.node-loa=
d-miss-rate%
>       13.85            +8.0       21.87        perf-stat.overall.node-sto=
re-miss-rate%
>   2.266e+08            +2.8%  2.331e+08 =C2=B1  2%  perf-stat.ps.cache-re=
ferences
>      275634 =C2=B1  2%     -18.5%     224718 =C2=B1  2%  perf-stat.ps.con=
text-switches
>   2.174e+10 =C2=B1  4%     -15.6%  1.835e+10 =C2=B1 10%  perf-stat.ps.cpu=
-cycles
>        3931           -33.5%       2614 =C2=B1  2%  perf-stat.ps.cpu-migr=
ations
>    20746040 =C2=B1 24%     -30.2%   14476157 =C2=B1  5%  perf-stat.ps.dTL=
B-load-misses
>     1921077 =C2=B1 16%     -25.2%    1437750 =C2=B1  6%  perf-stat.ps.dTL=
B-store-misses
>   2.227e+09 =C2=B1  4%     -11.1%  1.979e+09 =C2=B1  6%  perf-stat.ps.dTL=
B-stores
>     1503433 =C2=B1  3%     -12.8%    1310741        perf-stat.ps.iTLB-loa=
d-misses
>      529058 =C2=B1  4%      -9.4%     479204 =C2=B1  3%  perf-stat.ps.iTL=
B-loads
>        6200            -9.4%       5620        perf-stat.ps.minor-faults
>    22613159           +24.4%   28133123 =C2=B1  3%  perf-stat.ps.node-loa=
d-misses
>    11085254           +72.6%   19131576 =C2=B1  2%  perf-stat.ps.node-sto=
re-misses
>        6200            -9.4%       5620        perf-stat.ps.page-faults
>        7008 =C2=B1 13%     +55.2%      10876 =C2=B1 31%  softirqs.CPU1.NE=
T_RX
>        6509 =C2=B1  4%     +51.8%       9883 =C2=B1 27%  softirqs.CPU1.RCU
>        7294 =C2=B1 13%     +36.7%       9974 =C2=B1  8%  softirqs.CPU10.R=
CU
>        7800 =C2=B1 14%     +85.5%      14469 =C2=B1 23%  softirqs.CPU12.N=
ET_RX
>        5697 =C2=B1 43%     +77.5%      10110 =C2=B1 24%  softirqs.CPU13.N=
ET_RX
>       15944 =C2=B1  9%     +14.6%      18278 =C2=B1 12%  softirqs.CPU14.T=
IMER
>        6064 =C2=B1 19%     +68.6%      10223 =C2=B1 31%  softirqs.CPU15.N=
ET_RX
>        7796 =C2=B1 14%     +80.3%      14059 =C2=B1 25%  softirqs.CPU16.N=
ET_RX
>       15934 =C2=B1 10%     +22.1%      19452 =C2=B1 11%  softirqs.CPU18.T=
IMER
>        6725 =C2=B1  7%     +40.0%       9413 =C2=B1 18%  softirqs.CPU19.N=
ET_RX
>        5710 =C2=B1  3%     +53.4%       8756 =C2=B1 12%  softirqs.CPU20.R=
CU
>        7018 =C2=B1 14%     +65.5%      11616 =C2=B1 40%  softirqs.CPU21.N=
ET_RX
>        6389 =C2=B1 18%     +66.9%      10666 =C2=B1 31%  softirqs.CPU23.N=
ET_RX
>        7259 =C2=B1  7%     +36.1%       9881 =C2=B1  6%  softirqs.CPU24.R=
CU
>        6491 =C2=B1 20%     +58.5%      10289 =C2=B1 33%  softirqs.CPU25.N=
ET_RX
>        7090 =C2=B1 10%     +58.7%      11256 =C2=B1 29%  softirqs.CPU27.N=
ET_RX
>        6333 =C2=B1 27%     +70.3%      10786 =C2=B1 27%  softirqs.CPU29.N=
ET_RX
>        5813 =C2=B1 20%     +84.2%      10706 =C2=B1 36%  softirqs.CPU3.NE=
T_RX
>        7041 =C2=B1 23%    +105.7%      14483 =C2=B1 21%  softirqs.CPU30.N=
ET_RX
>        6654 =C2=B1  7%     +64.1%      10918 =C2=B1 29%  softirqs.CPU31.N=
ET_RX
>       18019 =C2=B1 10%     +11.1%      20016 =C2=B1  7%  softirqs.CPU31.T=
IMER
>        4666 =C2=B1  8%    +104.0%       9518 =C2=B1 23%  softirqs.CPU32.R=
CU
>       15721 =C2=B1 16%     +35.9%      21371 =C2=B1 11%  softirqs.CPU32.T=
IMER
>       15684 =C2=B1 13%     +40.0%      21959 =C2=B1 18%  softirqs.CPU34.T=
IMER
>        6489 =C2=B1 15%     +69.7%      11013 =C2=B1 37%  softirqs.CPU35.N=
ET_RX
>        7930 =C2=B1  7%     +82.1%      14442 =C2=B1 29%  softirqs.CPU36.N=
ET_RX
>       15744 =C2=B1 14%     +24.3%      19563 =C2=B1  6%  softirqs.CPU36.T=
IMER
>        7028 =C2=B1 13%     +29.3%       9085 =C2=B1 11%  softirqs.CPU39.N=
ET_RX
>        7491 =C2=B1 22%    +100.4%      15011 =C2=B1 24%  softirqs.CPU4.NE=
T_RX
>        6119 =C2=B1 13%     +58.7%       9710 =C2=B1 37%  softirqs.CPU5.NE=
T_RX
>        6980 =C2=B1  8%     +47.8%      10318 =C2=B1 42%  softirqs.CPU7.NE=
T_RX
>      285674           +65.7%     473395        softirqs.NET_RX
>      267950 =C2=B1  5%     +21.1%     324597        softirqs.RCU
>      238298 =C2=B1  2%     +15.1%     274371 =C2=B1  2%  softirqs.SCHED
>      689305 =C2=B1  3%     +14.1%     786236 =C2=B1  3%  softirqs.TIMER
>       56196 =C2=B1  2%     +19.9%      67389        interrupts.CPU0.LOC:L=
ocal_timer_interrupts
>       55971 =C2=B1  2%     +19.7%      67005        interrupts.CPU1.LOC:L=
ocal_timer_interrupts
>        5265 =C2=B1 17%     -32.2%       3568 =C2=B1 29%  interrupts.CPU1.=
RES:Rescheduling_interrupts
>       56163 =C2=B1  2%     +19.2%      66960        interrupts.CPU10.LOC:=
Local_timer_interrupts
>       56178 =C2=B1  2%     +19.5%      67139        interrupts.CPU11.LOC:=
Local_timer_interrupts
>        4669 =C2=B1 15%     -30.3%       3253 =C2=B1 29%  interrupts.CPU11=
.RES:Rescheduling_interrupts
>       56081           +19.7%      67142        interrupts.CPU12.LOC:Local=
_timer_interrupts
>       55999 =C2=B1  2%     +19.5%      66893        interrupts.CPU13.LOC:=
Local_timer_interrupts
>        4746 =C2=B1 23%     -30.0%       3324 =C2=B1 29%  interrupts.CPU13=
.RES:Rescheduling_interrupts
>       55991 =C2=B1  2%     +19.5%      66898        interrupts.CPU14.LOC:=
Local_timer_interrupts
>       55855 =C2=B1  2%     +20.0%      67031        interrupts.CPU15.LOC:=
Local_timer_interrupts
>       55943 =C2=B1  2%     +19.9%      67087        interrupts.CPU16.LOC:=
Local_timer_interrupts
>       56164           +18.9%      66802        interrupts.CPU17.LOC:Local=
_timer_interrupts
>        4579 =C2=B1 20%     -45.6%       2492 =C2=B1 16%  interrupts.CPU17=
.RES:Rescheduling_interrupts
>       55913 =C2=B1  2%     +19.6%      66860        interrupts.CPU18.LOC:=
Local_timer_interrupts
>       55820 =C2=B1  2%     +19.7%      66822        interrupts.CPU19.LOC:=
Local_timer_interrupts
>        4733 =C2=B1 17%     -35.5%       3052 =C2=B1 21%  interrupts.CPU19=
.RES:Rescheduling_interrupts
>       55989 =C2=B1  2%     +20.0%      67177        interrupts.CPU2.LOC:L=
ocal_timer_interrupts
>       55891 =C2=B1  2%     +20.3%      67258        interrupts.CPU20.LOC:=
Local_timer_interrupts
>       55966 =C2=B1  2%     +19.6%      66921        interrupts.CPU21.LOC:=
Local_timer_interrupts
>        4920 =C2=B1 21%     -33.4%       3278 =C2=B1 31%  interrupts.CPU21=
.RES:Rescheduling_interrupts
>       55945 =C2=B1  2%     +19.9%      67098        interrupts.CPU22.LOC:=
Local_timer_interrupts
>       55945 =C2=B1  2%     +19.9%      67073        interrupts.CPU23.LOC:=
Local_timer_interrupts
>        4972 =C2=B1 24%     -34.1%       3277 =C2=B1 36%  interrupts.CPU23=
.RES:Rescheduling_interrupts
>       56093 =C2=B1  2%     +19.8%      67185        interrupts.CPU24.LOC:=
Local_timer_interrupts
>       55910 =C2=B1  2%     +19.7%      66914        interrupts.CPU25.LOC:=
Local_timer_interrupts
>        4660 =C2=B1 25%     -28.9%       3313 =C2=B1 34%  interrupts.CPU25=
.RES:Rescheduling_interrupts
>       56105 =C2=B1  2%     +18.8%      66631        interrupts.CPU26.LOC:=
Local_timer_interrupts
>       55928 =C2=B1  2%     +19.5%      66827        interrupts.CPU27.LOC:=
Local_timer_interrupts
>       55934 =C2=B1  2%     +19.3%      66740        interrupts.CPU28.LOC:=
Local_timer_interrupts
>       55918 =C2=B1  2%     +19.5%      66812        interrupts.CPU29.LOC:=
Local_timer_interrupts
>        4825 =C2=B1 22%     -30.3%       3362 =C2=B1 30%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>       55920 =C2=B1  2%     +19.8%      67004        interrupts.CPU3.LOC:L=
ocal_timer_interrupts
>       56007 =C2=B1  2%     +19.5%      66917        interrupts.CPU30.LOC:=
Local_timer_interrupts
>       56238           +18.8%      66838        interrupts.CPU31.LOC:Local=
_timer_interrupts
>        4859 =C2=B1 21%     -33.0%       3257 =C2=B1 36%  interrupts.CPU31=
.RES:Rescheduling_interrupts
>       56099           +19.3%      66921        interrupts.CPU32.LOC:Local=
_timer_interrupts
>       55963 =C2=B1  2%     +19.5%      66866        interrupts.CPU33.LOC:=
Local_timer_interrupts
>       55992 =C2=B1  2%     +19.2%      66767        interrupts.CPU34.LOC:=
Local_timer_interrupts
>       55964 =C2=B1  2%     +19.6%      66939        interrupts.CPU35.LOC:=
Local_timer_interrupts
>        4797 =C2=B1 26%     -33.6%       3185 =C2=B1 38%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>       55770 =C2=B1  2%     +20.2%      67016        interrupts.CPU36.LOC:=
Local_timer_interrupts
>       55889           +20.0%      67095        interrupts.CPU37.LOC:Local=
_timer_interrupts
>       56140 =C2=B1  2%     +18.9%      66743        interrupts.CPU38.LOC:=
Local_timer_interrupts
>       56040 =C2=B1  2%     +19.2%      66828        interrupts.CPU39.LOC:=
Local_timer_interrupts
>        5126 =C2=B1 23%     -40.5%       3052 =C2=B1 11%  interrupts.CPU39=
.RES:Rescheduling_interrupts
>       56022 =C2=B1  2%     +19.9%      67149        interrupts.CPU4.LOC:L=
ocal_timer_interrupts
>       55850 =C2=B1  2%     +20.1%      67066        interrupts.CPU5.LOC:L=
ocal_timer_interrupts
>        4741 =C2=B1 23%     -31.9%       3227 =C2=B1 29%  interrupts.CPU5.=
RES:Rescheduling_interrupts
>       55912           +19.5%      66798        interrupts.CPU6.LOC:Local_=
timer_interrupts
>       56062 =C2=B1  2%     +19.6%      67052        interrupts.CPU7.LOC:L=
ocal_timer_interrupts
>       56118           +19.6%      67142        interrupts.CPU8.LOC:Local_=
timer_interrupts
>       56110 =C2=B1  2%     +19.6%      67121        interrupts.CPU9.LOC:L=
ocal_timer_interrupts
>        2216 =C2=B1 43%     -69.4%     677.50 =C2=B1112%  interrupts.CPU9.=
NMI:Non-maskable_interrupts
>        2216 =C2=B1 43%     -69.4%     677.50 =C2=B1112%  interrupts.CPU9.=
PMI:Performance_monitoring_interrupts
>     2240009 =C2=B1  2%     +19.6%    2678940        interrupts.LOC:Local_=
timer_interrupts
>      168296 =C2=B1  3%     -10.1%     151314        interrupts.RES:Resche=
duling_interrupts
>       20.37            -3.3       17.04 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.svc_process_common.svc_process.nfsd.kthread.ret_from_fork
>       20.38            -3.3       17.04 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.svc_process.nfsd.kthread.ret_from_fork
>       20.27            -3.3       16.95 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.nfsd_dispatch.svc_process_common.svc_process.nfsd.kthread
>       20.21            -3.3       16.91 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.nfsd4_proc_compound.nfsd_dispatch.svc_process_common.svc_proces=
s.nfsd
>       26.02            -3.1       22.91 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.nfsd.kthread.ret_from_fork
>        9.04 =C2=B1  2%      -1.9        7.18 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.nfsd_vfs_write.nfsd4_write.nfsd4_proc_compound.nfsd_dispat=
ch.svc_process_common
>        9.02 =C2=B1  2%      -1.9        7.17 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.do_iter_readv_writev.do_iter_write.nfsd_vfs_write.nfsd4_wr=
ite.nfsd4_proc_compound
>        9.02 =C2=B1  2%      -1.9        7.16 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.xfs_file_buffered_aio_write.do_iter_readv_writev.do_iter_w=
rite.nfsd_vfs_write.nfsd4_write
>        9.03 =C2=B1  2%      -1.9        7.18 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.do_iter_write.nfsd_vfs_write.nfsd4_write.nfsd4_proc_compou=
nd.nfsd_dispatch
>        9.07 =C2=B1  2%      -1.9        7.22 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.nfsd4_write.nfsd4_proc_compound.nfsd_dispatch.svc_process_=
common.svc_process
>       10.50 =C2=B1  2%      -1.4        9.06 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.xfs_file_fsync.nfsd_commit.nfsd4_proc_compound.nfsd_dispat=
ch.svc_process_common
>       10.51 =C2=B1  2%      -1.4        9.08 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.nfsd_commit.nfsd4_proc_compound.nfsd_dispatch.svc_process_=
common.svc_process
>       10.45 =C2=B1  2%      -1.4        9.02 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.file_write_and_wait_range.xfs_file_fsync.nfsd_commit.nfsd4=
_proc_compound.nfsd_dispatch
>        9.82 =C2=B1  3%      -1.4        8.45 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_f=
ile_fsync.nfsd_commit.nfsd4_proc_compound
>        9.82 =C2=B1  3%      -1.4        8.45 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.do_writepages.__filemap_fdatawrite_range.file_write_and_wa=
it_range.xfs_file_fsync.nfsd_commit
>        9.82 =C2=B1  3%      -1.4        8.45 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_range=
.file_write_and_wait_range.xfs_file_fsync
>       10.61 =C2=B1  5%      -1.1        9.46 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.write
>        7.54            -1.1        6.41 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_wri=
te.do_iter_readv_writev.do_iter_write
>        7.54            -1.1        6.41 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_aio_write.do_iter_r=
eadv_writev.do_iter_write.nfsd_vfs_write
>       10.27 =C2=B1  5%      -1.1        9.15 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wr=
ite
>        7.49            -1.1        6.37 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.iomap_write_actor.iomap_apply.iomap_file_buffered_write.xfs_fil=
e_buffered_aio_write.do_iter_readv_writev
>       10.23 =C2=B1  5%      -1.1        9.11 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.write
>       10.35 =C2=B1  5%      -1.1        9.23 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
>       10.08 =C2=B1  5%      -1.1        8.96 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.__vfs_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>       10.33 =C2=B1  5%      -1.1        9.22 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       10.05 =C2=B1  5%      -1.1        8.95 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall=
_64
>        9.80 =C2=B1  5%      -1.1        8.73 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.generic_perform_write.nfs_file_write.__vfs_write.vfs_write=
.ksys_write
>        5.31 =C2=B1  5%      -1.0        4.27 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.rpc_free_task.rpc_async_release.process_one_work.worker_th=
read.kthread
>        5.31 =C2=B1  5%      -1.0        4.27 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.rpc_async_release.process_one_work.worker_thread.kthread.r=
et_from_fork
>        4.38 =C2=B1  5%      -1.0        3.35 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.svc_recvfrom.svc_tcp_recvfrom.svc=
_recv
>        4.38 =C2=B1  6%      -1.0        3.36 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.inet_recvmsg.svc_recvfrom.svc_tcp_recvfrom.svc_recv.nfsd
>        4.39 =C2=B1  6%      -1.0        3.40 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.svc_recvfrom.svc_tcp_recvfrom.svc_recv.nfsd.kthread
>        3.53 =C2=B1  5%      -0.9        2.62 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.skb_copy_datagram_iter.tcp_recvmsg.inet_recvmsg.svc_recvfr=
om.svc_tcp_recvfrom
>        3.52 =C2=B1  5%      -0.9        2.62 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg.ine=
t_recvmsg.svc_recvfrom
>        5.01 =C2=B1  6%      -0.9        4.14 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.fsync
>        4.09 =C2=B1  7%      -0.8        3.24 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.nfs_write_completion.rpc_free_task.rpc_async_release.proce=
ss_one_work.worker_thread
>        4.90 =C2=B1  6%      -0.8        4.05 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.fsync
>        4.90 =C2=B1  6%      -0.8        4.05 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.fsync
>        4.90 =C2=B1  6%      -0.8        4.05 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.fsync
>        4.90 =C2=B1  6%      -0.8        4.05 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.nfs_file_fsync.do_fsync.__x64_sys_fsync.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>        4.90 =C2=B1  6%      -0.8        4.05 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.do_fsync.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.fsync
>        5.84 =C2=B1  2%      -0.8        5.01 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.write_cache_pages.xfs_vm_writepages.do_writepages.__filema=
p_fdatawrite_range.file_write_and_wait_range
>        1.15 =C2=B1  7%      -0.8        0.36 =C2=B1100%  perf-profile.cal=
ltrace.cycles-pp.rwsem_spin_on_owner.rwsem_down_write_failed.call_rwsem_dow=
n_write_failed.down_write.xfs_ilock
>        4.38 =C2=B1  7%      -0.8        3.59 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.filemap_write_and_wait_range.nfs_file_fsync.do_fsync.__x64=
_sys_fsync.do_syscall_64
>        5.17 =C2=B1  2%      -0.8        4.39 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.xfs_do_writepage.write_cache_pages.xfs_vm_writepages.do_wr=
itepages.__filemap_fdatawrite_range
>        4.89 =C2=B1  4%      -0.7        4.18 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.brd_insert_page.brd_do_bvec.brd_make_request.generic_make_=
request.submit_bio
>        1.38 =C2=B1  9%      -0.7        0.68 =C2=B1 22%  perf-profile.cal=
ltrace.cycles-pp.down_write.xfs_ilock.xfs_file_buffered_aio_write.do_iter_r=
eadv_writev.do_iter_write
>        1.38 =C2=B1  9%      -0.7        0.68 =C2=B1 22%  perf-profile.cal=
ltrace.cycles-pp.call_rwsem_down_write_failed.down_write.xfs_ilock.xfs_file=
_buffered_aio_write.do_iter_readv_writev
>        1.38 =C2=B1  9%      -0.7        0.68 =C2=B1 22%  perf-profile.cal=
ltrace.cycles-pp.rwsem_down_write_failed.call_rwsem_down_write_failed.down_=
write.xfs_ilock.xfs_file_buffered_aio_write
>        1.38 =C2=B1  9%      -0.7        0.68 =C2=B1 22%  perf-profile.cal=
ltrace.cycles-pp.xfs_ilock.xfs_file_buffered_aio_write.do_iter_readv_writev=
.do_iter_write.nfsd_vfs_write
>        4.01 =C2=B1  3%      -0.6        3.40 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.brd_make_request.generic_make_request.submit_bio.xfs_add_t=
o_ioend.xfs_do_writepage
>        4.01 =C2=B1  3%      -0.6        3.40 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.submit_bio.xfs_add_to_ioend.xfs_do_writepage.write_cache_p=
ages.xfs_vm_writepages
>        4.01 =C2=B1  3%      -0.6        3.40 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.generic_make_request.submit_bio.xfs_add_to_ioend.xfs_do_wr=
itepage.write_cache_pages
>        3.99 =C2=B1  3%      -0.6        3.38 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.brd_do_bvec.brd_make_request.generic_make_request.submit_b=
io.xfs_add_to_ioend
>        4.11 =C2=B1  3%      -0.6        3.51 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.xfs_add_to_ioend.xfs_do_writepage.write_cache_pages.xfs_vm=
_writepages.do_writepages
>        3.97 =C2=B1  5%      -0.5        3.43 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.submit_bio.xfs_submit_ioend.xfs_vm_writepages.do_writepage=
s.__filemap_fdatawrite_range
>        3.97 =C2=B1  5%      -0.5        3.43 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.generic_make_request.submit_bio.xfs_submit_ioend.xfs_vm_wr=
itepages.do_writepages
>        3.98 =C2=B1  5%      -0.5        3.44 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.xfs_submit_ioend.xfs_vm_writepages.do_writepages.__filemap=
_fdatawrite_range.file_write_and_wait_range
>        3.96 =C2=B1  5%      -0.5        3.43 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.brd_make_request.generic_make_request.submit_bio.xfs_submi=
t_ioend.xfs_vm_writepages
>        3.92 =C2=B1  5%      -0.5        3.40 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.brd_do_bvec.brd_make_request.generic_make_request.submit_b=
io.xfs_submit_ioend
>        2.89 =C2=B1  6%      -0.5        2.38 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.nfs_end_page_writeback.nfs_write_completion.rpc_free_task.=
rpc_async_release.process_one_work
>        2.77 =C2=B1 10%      -0.5        2.28 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__filemap_fdatawrite_range.filemap_write_and_wait_range.nf=
s_file_fsync.do_fsync.__x64_sys_fsync
>        2.77 =C2=B1 10%      -0.5        2.28 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.nfs_writepages.do_writepages.__filemap_fdatawrite_range.fi=
lemap_write_and_wait_range.nfs_file_fsync
>        2.77 =C2=B1 10%      -0.5        2.28 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.do_writepages.__filemap_fdatawrite_range.filemap_write_and=
_wait_range.nfs_file_fsync.do_fsync
>        2.74 =C2=B1 10%      -0.5        2.25 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.write_cache_pages.nfs_writepages.do_writepages.__filemap_f=
datawrite_range.filemap_write_and_wait_range
>        3.12 =C2=B1  7%      -0.5        2.64 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.nfs_write_begin.generic_perform_write.nfs_file_write.__vfs=
_write.vfs_write
>        2.93 =C2=B1  7%      -0.5        2.47 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.grab_cache_page_write_begin.nfs_write_begin.generic_perfor=
m_write.nfs_file_write.__vfs_write
>        3.37 =C2=B1  4%      -0.5        2.91 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.nfs_write_end.generic_perform_write.nfs_file_write.__vfs_w=
rite.vfs_write
>        2.51 =C2=B1  4%      -0.4        2.06 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.clear_page_erms.get_page_from_freelist.__alloc_pages_nodem=
ask.brd_insert_page.brd_do_bvec
>        3.12 =C2=B1  5%      -0.4        2.68 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.__alloc_pages_nodemask.brd_insert_page.brd_do_bvec.brd_mak=
e_request.generic_make_request
>        2.91 =C2=B1  5%      -0.4        2.48 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.t=
cp_recvmsg.inet_recvmsg
>        3.02 =C2=B1  5%      -0.4        2.59 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.brd_insert_p=
age.brd_do_bvec.brd_make_request
>        2.59 =C2=B1  4%      -0.4        2.18 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.nfs_updatepage.nfs_write_end.generic_perform_write.nfs_fil=
e_write.__vfs_write
>        2.84 =C2=B1  7%      -0.4        2.43 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.pagecache_get_page.grab_cache_page_write_begin.nfs_write_b=
egin.generic_perform_write.nfs_file_write
>        3.27            -0.4        2.86 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.iov_iter_copy_from_user_atomic.iomap_write_actor.iomap_apply.io=
map_file_buffered_write.xfs_file_buffered_aio_write
>        3.20            -0.4        2.79 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.memcpy_erms.iov_iter_copy_from_user_atomic.iomap_write_actor.io=
map_apply.iomap_file_buffered_write
>        2.85 =C2=B1  5%      -0.4        2.44 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.memcpy_erms._copy_to_iter.__skb_datagram_iter.skb_copy_dat=
agram_iter.tcp_recvmsg
>        2.50 =C2=B1  4%      -0.4        2.14 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.iomap_write_begin.iomap_write_actor.iomap_apply.iomap_file=
_buffered_write.xfs_file_buffered_aio_write
>        2.41 =C2=B1  4%      -0.4        2.06 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.grab_cache_page_write_begin.iomap_write_begin.iomap_write_=
actor.iomap_apply.iomap_file_buffered_write
>        2.02 =C2=B1 11%      -0.3        1.67 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.nfs_writepages_callback.write_cache_pages.nfs_writepages.d=
o_writepages.__filemap_fdatawrite_range
>        0.60 =C2=B1  8%      -0.3        0.26 =C2=B1100%  perf-profile.cal=
ltrace.cycles-pp.iomap_set_page_dirty.iomap_write_end.iomap_write_actor.iom=
ap_apply.iomap_file_buffered_write
>        1.96 =C2=B1 11%      -0.3        1.62 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.nfs_do_writepage.nfs_writepages_callback.write_cache_pages=
.nfs_writepages.do_writepages
>        1.55 =C2=B1  2%      -0.3        1.22 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.iomap_write_end.iomap_write_actor.iomap_apply.iomap_file_b=
uffered_write.xfs_file_buffered_aio_write
>        2.35 =C2=B1  4%      -0.3        2.03 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.pagecache_get_page.grab_cache_page_write_begin.iomap_write=
_begin.iomap_write_actor.iomap_apply
>        1.60 =C2=B1  2%      -0.3        1.32 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.__filemap_fdatawait_range.filemap_write_and_wait_range.nfs=
_file_fsync.do_fsync.__x64_sys_fsync
>        1.49 =C2=B1  6%      -0.2        1.24 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.brd_insert_page.brd_do_bvec.brd_make_reques=
t.generic_make_request
>        1.03 =C2=B1  6%      -0.2        0.80 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.end_page_writeback.nfs_end_page_writeback.nfs_write_comple=
tion.rpc_free_task.rpc_async_release
>        0.97 =C2=B1  7%      -0.2        0.74 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.test_clear_page_writeback.end_page_writeback.nfs_end_page_=
writeback.nfs_write_completion.rpc_free_task
>        1.45 =C2=B1  6%      -0.2        1.23 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_w=
rite_begin.nfs_write_begin.generic_perform_write
>        0.97 =C2=B1  4%      -0.2        0.77 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.poll_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.st=
art_secondary
>        1.22 =C2=B1  6%      -0.2        1.03 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.nfs_commit_release_pages.nfs_commit_release.rpc_free_task.=
rpc_async_release.process_one_work
>        1.22 =C2=B1  6%      -0.2        1.03 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.nfs_commit_release.rpc_free_task.rpc_async_release.process=
_one_work.worker_thread
>        1.25 =C2=B1  5%      -0.2        1.06 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_w=
rite_begin.iomap_write_begin.iomap_write_actor
>        1.06 =C2=B1  2%      -0.2        0.87 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.wait_on_page_bit_common.__filemap_fdatawait_range.filemap_=
write_and_wait_range.nfs_file_fsync.do_fsync
>        1.27 =C2=B1  5%      -0.2        1.11 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.wake_up_page_bit.nfs_end_page_writeback.nfs_write_completi=
on.rpc_free_task.rpc_async_release
>        0.78 =C2=B1  8%      -0.2        0.63 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.__set_page_dirty_nobuffers.nfs_updatepage.nfs_write_end.ge=
neric_perform_write.nfs_file_write
>        1.11 =C2=B1  7%      -0.1        0.99 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.__wake_up_common.wake_up_page_bit.nfs_end_page_writeback.n=
fs_write_completion.rpc_free_task
>        0.68            -0.1        0.57 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.nfs_create_request.nfs_updatepage.nfs_write_end.generic_perform=
_write.nfs_file_write
>        1.04 =C2=B1  7%      -0.1        0.93 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.autoremove_wake_function.__wake_up_common.wake_up_page_bit=
.nfs_end_page_writeback.nfs_write_completion
>        1.02 =C2=B1  8%      -0.1        0.92 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.w=
ake_up_page_bit.nfs_end_page_writeback
>        0.71 =C2=B1  2%      -0.1        0.60 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.__schedule.schedule.io_schedule.wait_on_page_bit_common.__=
filemap_fdatawait_range
>        0.72 =C2=B1  2%      -0.1        0.61 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.schedule.io_schedule.wait_on_page_bit_common.__filemap_fda=
tawait_range.filemap_write_and_wait_range
>        0.72            -0.1        0.62 =C2=B1  7%  perf-profile.calltrac=
e.cycles-pp.io_schedule.wait_on_page_bit_common.__filemap_fdatawait_range.f=
ilemap_write_and_wait_range.nfs_file_fsync
>        0.93 =C2=B1  5%      -0.1        0.83 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.__alloc_pages_nodemask.pagecache_get_page.grab_cache_page_=
write_begin.nfs_write_begin.generic_perform_write
>        0.73            -0.1        0.67 =C2=B1  5%  perf-profile.calltrac=
e.cycles-pp.end_page_writeback.xfs_destroy_ioend.process_one_work.worker_th=
read.kthread
>        4.86 =C2=B1  6%      +0.5        5.39        perf-profile.calltrac=
e.cycles-pp.svc_recv.nfsd.kthread.ret_from_fork
>        0.00            +0.5        0.54 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.svc_recv.nfsd.kth=
read
>        0.00            +0.6        0.59 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.ip6_xmit.inet6_csk_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_s=
endmsg_locked
>        0.00            +0.6        0.63 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.inet6_csk_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_lo=
cked.tcp_sendmsg
>        0.00            +0.7        0.65 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.__alloc_pages_nodemask.svc_recv.nfsd.kthread.ret_from_fork
>        0.00            +0.7        0.74 =C2=B1  8%  perf-profile.calltrac=
e.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendms=
g.sock_sendmsg
>        0.00            +0.9        0.86 =C2=B1  8%  perf-profile.calltrac=
e.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.xs_s=
endpages
>        9.98 =C2=B1  4%      +2.5       12.44 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.worker_thread.kthread.ret_from_fork
>        9.61 =C2=B1  4%      +2.5       12.15 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>       47.02 =C2=B1  3%      +2.7       49.68 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.secondary_startup_64
>        0.00            +3.5        3.54 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.memcpy_erms.memcpy_from_page._copy_from_iter_full.tcp_sendmsg_l=
ocked.tcp_sendmsg
>        0.00            +3.6        3.56 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.memcpy_from_page._copy_from_iter_full.tcp_sendmsg_locked.tcp_se=
ndmsg.sock_sendmsg
>        0.00            +3.7        3.67 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp._copy_from_iter_full.tcp_sendmsg_locked.tcp_sendmsg.sock_sendms=
g.xs_sendpages
>        2.29 =C2=B1  6%      +3.8        6.05 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.rpc_async_schedule.process_one_work.worker_thread.kthread.=
ret_from_fork
>        2.28 =C2=B1  6%      +3.8        6.05 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__rpc_execute.rpc_async_schedule.process_one_work.worker_t=
hread.kthread
>        1.86 =C2=B1  3%      +3.8        5.64 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.call_transmit.__rpc_execute.rpc_async_schedule.process_one=
_work.worker_thread
>        1.85 =C2=B1  3%      +3.8        5.64 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.xprt_transmit.call_transmit.__rpc_execute.rpc_async_schedu=
le.process_one_work
>        1.80 =C2=B1  4%      +3.8        5.60 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.xs_tcp_send_request.xprt_transmit.call_transmit.__rpc_exec=
ute.rpc_async_schedule
>        1.79 =C2=B1  3%      +3.8        5.60 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.xs_sendpages.xs_tcp_send_request.xprt_transmit.call_transm=
it.__rpc_execute
>        0.00            +5.5        5.47 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.xs_sendpages.xs_tcp=
_send_request
>        0.00            +5.6        5.56 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.tcp_sendmsg.sock_sendmsg.xs_sendpages.xs_tcp_send_request.xprt_=
transmit
>        0.00            +5.6        5.57 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.sock_sendmsg.xs_sendpages.xs_tcp_send_request.xprt_transmit.cal=
l_transmit
>       20.37            -3.3       17.04 =C2=B1  5%  perf-profile.children=
.cycles-pp.svc_process_common
>       20.38            -3.3       17.04 =C2=B1  5%  perf-profile.children=
.cycles-pp.svc_process
>       20.27            -3.3       16.95 =C2=B1  5%  perf-profile.children=
.cycles-pp.nfsd_dispatch
>       20.21            -3.3       16.91 =C2=B1  5%  perf-profile.children=
.cycles-pp.nfsd4_proc_compound
>       26.02            -3.1       22.91 =C2=B1  4%  perf-profile.children=
.cycles-pp.nfsd
>       15.88 =C2=B1  5%      -1.9       13.95 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       15.87 =C2=B1  5%      -1.9       13.95 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.do_syscall_64
>       12.61 =C2=B1  3%      -1.9       10.73 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__filemap_fdatawrite_range
>       12.60 =C2=B1  3%      -1.9       10.73 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.do_writepages
>        9.04 =C2=B1  2%      -1.9        7.18 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.nfsd_vfs_write
>        9.02 =C2=B1  2%      -1.9        7.17 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_iter_readv_writev
>        9.02 =C2=B1  2%      -1.9        7.16 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.xfs_file_buffered_aio_write
>        9.03 =C2=B1  2%      -1.9        7.18 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_iter_write
>        9.07 =C2=B1  2%      -1.9        7.22 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.nfsd4_write
>        2.21 =C2=B1  4%      -1.8        0.41 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.inet_sendpage
>        2.17 =C2=B1  4%      -1.8        0.40 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.tcp_sendpage
>       10.50 =C2=B1  2%      -1.4        9.06 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xfs_file_fsync
>       10.51 =C2=B1  2%      -1.4        9.08 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.nfsd_commit
>       10.45 =C2=B1  2%      -1.4        9.02 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.file_write_and_wait_range
>        9.82 =C2=B1  3%      -1.4        8.45 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.xfs_vm_writepages
>        8.59 =C2=B1  4%      -1.3        7.27 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.write_cache_pages
>        8.02 =C2=B1  4%      -1.2        6.87 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.submit_bio
>        8.02 =C2=B1  4%      -1.2        6.87 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.generic_make_request
>        8.00 =C2=B1  4%      -1.1        6.85 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.brd_make_request
>        7.94 =C2=B1  4%      -1.1        6.79 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.brd_do_bvec
>       10.63 =C2=B1  5%      -1.1        9.49 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.write
>        7.55            -1.1        6.41 =C2=B1  5%  perf-profile.children=
.cycles-pp.iomap_apply
>        7.54            -1.1        6.41 =C2=B1  6%  perf-profile.children=
.cycles-pp.iomap_file_buffered_write
>       10.28 =C2=B1  5%      -1.1        9.16 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.ksys_write
>        7.50            -1.1        6.37 =C2=B1  6%  perf-profile.children=
.cycles-pp.iomap_write_actor
>        4.68 =C2=B1  5%      -1.1        3.56 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.inet_recvmsg
>        4.68 =C2=B1  5%      -1.1        3.56 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.tcp_recvmsg
>       10.24 =C2=B1  5%      -1.1        9.12 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.vfs_write
>       10.08 =C2=B1  5%      -1.1        8.98 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__vfs_write
>       10.05 =C2=B1  5%      -1.1        8.95 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.nfs_file_write
>        5.51 =C2=B1  5%      -1.1        4.43 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.rpc_free_task
>        9.82 =C2=B1  5%      -1.1        8.74 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.generic_perform_write
>        1.39 =C2=B1  5%      -1.1        0.32 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.tcp_sendpage_locked
>        1.36 =C2=B1  5%      -1.1        0.31 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.do_tcp_sendpages
>        5.31 =C2=B1  5%      -1.0        4.27 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.rpc_async_release
>        4.39 =C2=B1  6%      -1.0        3.40 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.svc_recvfrom
>        3.55 =C2=B1  5%      -0.9        2.64 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__skb_datagram_iter
>        3.55 =C2=B1  5%      -0.9        2.64 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.skb_copy_datagram_iter
>        5.01 =C2=B1  6%      -0.9        4.15 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.fsync
>        4.09 =C2=B1  7%      -0.9        3.24 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.nfs_write_completion
>        4.90 =C2=B1  6%      -0.8        4.05 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_fsync
>        4.91 =C2=B1  6%      -0.8        4.07 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.nfs_file_fsync
>        4.90 =C2=B1  6%      -0.8        4.05 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.do_fsync
>        5.36 =C2=B1  4%      -0.8        4.53 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.grab_cache_page_write_begin
>        4.39 =C2=B1  7%      -0.8        3.60 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.filemap_write_and_wait_range
>        5.18 =C2=B1  2%      -0.8        4.40 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.xfs_do_writepage
>        5.21 =C2=B1  4%      -0.7        4.47 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.pagecache_get_page
>        4.90 =C2=B1  4%      -0.7        4.19 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.brd_insert_page
>        1.38 =C2=B1  9%      -0.7        0.68 =C2=B1 22%  perf-profile.chi=
ldren.cycles-pp.xfs_ilock
>        1.41 =C2=B1  8%      -0.7        0.71 =C2=B1 22%  perf-profile.chi=
ldren.cycles-pp.call_rwsem_down_write_failed
>        1.41 =C2=B1  8%      -0.7        0.71 =C2=B1 22%  perf-profile.chi=
ldren.cycles-pp.rwsem_down_write_failed
>        1.44 =C2=B1  7%      -0.7        0.74 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.down_write
>        4.12 =C2=B1  3%      -0.6        3.52 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xfs_add_to_ioend
>        1.18 =C2=B1  6%      -0.6        0.61 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.rwsem_spin_on_owner
>        3.98 =C2=B1  5%      -0.5        3.44 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xfs_submit_ioend
>        6.25            -0.5        5.72 =C2=B1  4%  perf-profile.children=
.cycles-pp.iov_iter_copy_from_user_atomic
>        2.89 =C2=B1  6%      -0.5        2.38 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.nfs_end_page_writeback
>        2.78 =C2=B1 10%      -0.5        2.29 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.nfs_writepages
>        3.12 =C2=B1  7%      -0.5        2.64 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.nfs_write_begin
>        3.37 =C2=B1  4%      -0.5        2.91 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.nfs_write_end
>        2.54 =C2=B1  4%      -0.5        2.08 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.clear_page_erms
>        2.92 =C2=B1  5%      -0.4        2.48 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp._copy_to_iter
>        2.60 =C2=B1  4%      -0.4        2.18 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.nfs_updatepage
>        2.71 =C2=B1  4%      -0.4        2.29 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.add_to_page_cache_lru
>        0.75 =C2=B1  3%      -0.4        0.37 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.release_sock
>        2.51 =C2=B1  4%      -0.4        2.15 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.iomap_write_begin
>        2.02 =C2=B1 10%      -0.3        1.67 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.nfs_writepages_callback
>        2.23 =C2=B1  2%      -0.3        1.89 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__filemap_fdatawait_range
>        0.82 =C2=B1  7%      -0.3        0.47 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__tcp_push_pending_frames
>        1.96 =C2=B1 11%      -0.3        1.63 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.nfs_do_writepage
>        1.55 =C2=B1  2%      -0.3        1.22 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.iomap_write_end
>        0.78 =C2=B1  7%      -0.3        0.48 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.svc_send
>        1.78 =C2=B1  3%      -0.3        1.48 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.end_page_writeback
>        1.73 =C2=B1  3%      -0.3        1.45 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.test_clear_page_writeback
>        0.90 =C2=B1  5%      -0.3        0.63 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.xas_load
>        0.35 =C2=B1 14%      -0.2        0.10 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.simple_copy_to_iter
>        1.78 =C2=B1  4%      -0.2        1.54 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__wake_up_common
>        0.43 =C2=B1  6%      -0.2        0.19 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.lock_sock_nested
>        1.41 =C2=B1  5%      -0.2        1.18 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.nfs_commit_release
>        1.41 =C2=B1  5%      -0.2        1.18 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.nfs_commit_release_pages
>        1.95 =C2=B1  4%      -0.2        1.72 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.try_to_wake_up
>        0.64 =C2=B1  8%      -0.2        0.41 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.svc_tcp_sendto
>        0.63 =C2=B1  8%      -0.2        0.41 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.svc_sendto
>        0.62 =C2=B1  8%      -0.2        0.41 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.svc_send_common
>        0.62 =C2=B1  8%      -0.2        0.41 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.kernel_sendpage
>        1.65 =C2=B1  5%      -0.2        1.44 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.autoremove_wake_function
>        1.34 =C2=B1  3%      -0.2        1.14 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.wait_on_page_bit_common
>        0.98 =C2=B1  4%      -0.2        0.79 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.poll_idle
>        0.26 =C2=B1  8%      -0.2        0.08 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock_bh
>        1.59 =C2=B1  5%      -0.2        1.42 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.schedule
>        0.79 =C2=B1  5%      -0.2        0.62 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.tcp_v6_do_rcv
>        0.64 =C2=B1  5%      -0.2        0.47 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.tcp_v6_rcv
>        0.34 =C2=B1 12%      -0.2        0.18 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.xas_start
>        0.24 =C2=B1 26%      -0.2        0.08 =C2=B1 40%  perf-profile.chi=
ldren.cycles-pp.osq_lock
>        0.76 =C2=B1  5%      -0.2        0.61 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.tcp_rcv_established
>        0.49 =C2=B1 26%      -0.2        0.34 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.nfs_request_add_commit_list
>        0.66 =C2=B1  5%      -0.1        0.52 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.ip6_input
>        0.66 =C2=B1  4%      -0.1        0.51 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.ip6_input_finish
>        0.65 =C2=B1  4%      -0.1        0.51 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.ip6_protocol_deliver_rcu
>        0.79 =C2=B1  8%      -0.1        0.64 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__set_page_dirty_nobuffers
>        0.83 =C2=B1  6%      -0.1        0.69 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__nfs_commit_inode
>        0.42 =C2=B1  4%      -0.1        0.29 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.xs_stream_data_receive_workfn
>        0.42 =C2=B1  4%      -0.1        0.29 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.xs_stream_data_receive
>        0.70 =C2=B1  4%      -0.1        0.56 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.percpu_counter_add_batch
>        0.71 =C2=B1  4%      -0.1        0.58 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.ipv6_rcv
>        0.86 =C2=B1  6%      -0.1        0.73 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__local_bh_enable_ip
>        0.78 =C2=B1  5%      -0.1        0.65 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.process_backlog
>        0.45 =C2=B1 14%      -0.1        0.32 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.__mutex_lock
>        1.06 =C2=B1  4%      -0.1        0.93 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock_irqsave
>        0.86 =C2=B1  6%      -0.1        0.73 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.pagevec_lru_move_fn
>        0.75 =C2=B1  5%      -0.1        0.63 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__netif_receive_skb_one_core
>        0.61 =C2=B1  8%      -0.1        0.49 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.iomap_set_page_dirty
>        0.94 =C2=B1  5%      -0.1        0.81 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__lru_cache_add
>        0.82 =C2=B1  6%      -0.1        0.70 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.clear_page_dirty_for_io
>        0.80 =C2=B1  6%      -0.1        0.68 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.net_rx_action
>        0.94 =C2=B1  2%      -0.1        0.82 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.io_schedule
>        0.81 =C2=B1  7%      -0.1        0.70 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_softirq_own_stack
>        0.69            -0.1        0.58 =C2=B1  5%  perf-profile.children=
.cycles-pp.nfs_create_request
>        0.62 =C2=B1  4%      -0.1        0.51 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__pagevec_lru_add_fn
>        0.32 =C2=B1  4%      -0.1        0.21 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.xs_sock_recvmsg
>        0.49 =C2=B1 12%      -0.1        0.38 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.sched_ttwu_pending
>        0.82 =C2=B1  6%      -0.1        0.72 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_softirq
>        0.32 =C2=B1 10%      -0.1        0.22 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.xfs_map_blocks
>        0.40 =C2=B1 13%      -0.1        0.30 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.mutex_spin_on_owner
>        0.47 =C2=B1  2%      -0.1        0.38 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_alloc
>        0.26 =C2=B1  4%      -0.1        0.17 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__wake_up_common_lock
>        0.52 =C2=B1  6%      -0.1        0.43 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.account_page_dirtied
>        0.22 =C2=B1 16%      -0.1        0.13 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__check_object_size
>        0.50 =C2=B1  8%      -0.1        0.42 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.iomap_set_range_uptodate
>        0.41 =C2=B1  3%      -0.1        0.33 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.__set_page_dirty
>        0.31 =C2=B1 11%      -0.1        0.24 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.nfs_io_completion_release
>        0.41 =C2=B1  8%      -0.1        0.33 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.nfs_inode_remove_request
>        0.25 =C2=B1  9%      -0.1        0.18 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.xfs_iomap_write_allocate
>        0.33 =C2=B1  8%      -0.1        0.26 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.___might_sleep
>        0.25 =C2=B1  5%      -0.1        0.18 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.__xa_set_mark
>        0.31 =C2=B1  9%      -0.1        0.24 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.nfs_scan_commit_list
>        0.25 =C2=B1  5%      -0.1        0.18 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__x86_indirect_thunk_rax
>        0.45 =C2=B1  6%      -0.1        0.39 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.nfs_lock_and_join_requests
>        0.50 =C2=B1  4%      -0.1        0.45 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.nfs_page_group_destroy
>        0.19 =C2=B1 11%      -0.1        0.14 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.xfs_bmap_btalloc
>        0.21 =C2=B1  2%      -0.1        0.15 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.__lock_sock
>        0.17 =C2=B1  8%      -0.1        0.12 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.xfs_alloc_ag_vextent
>        0.18 =C2=B1  9%      -0.1        0.13 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.xfs_alloc_vextent
>        0.20 =C2=B1 12%      -0.1        0.15 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.xfs_bmapi_write
>        0.30 =C2=B1  9%      -0.0        0.25 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.select_task_rq_fair
>        0.16 =C2=B1  8%      -0.0        0.11 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.xfs_alloc_ag_vextent_near
>        0.16 =C2=B1 15%      -0.0        0.12 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.__generic_write_end
>        0.48 =C2=B1  2%      -0.0        0.44 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.dequeue_task_fair
>        0.31 =C2=B1  2%      -0.0        0.27 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.release_pages
>        0.20 =C2=B1  4%      -0.0        0.17 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.nfs_initiate_commit
>        0.17 =C2=B1 10%      -0.0        0.13 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__might_sleep
>        0.29 =C2=B1  6%      -0.0        0.26 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.dec_zone_page_state
>        0.23 =C2=B1  7%      -0.0        0.20 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__pagevec_release
>        0.19 =C2=B1  9%      -0.0        0.15 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.nfs_get_lock_context
>        0.17 =C2=B1 13%      -0.0        0.13 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.check_preempt_curr
>        0.09 =C2=B1 17%      -0.0        0.06 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.memset_erms
>        0.14 =C2=B1  8%      -0.0        0.11 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.nfs_request_remove_commit_list
>        0.07 =C2=B1 10%      -0.0        0.04 =C2=B1 58%  perf-profile.chi=
ldren.cycles-pp.xfs_defer_finish_noroll
>        0.15 =C2=B1  5%      -0.0        0.12 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__nfs_find_lock_context
>        0.19 =C2=B1  4%      -0.0        0.16 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.mem_cgroup_try_charge
>        0.17 =C2=B1  8%      -0.0        0.15 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.vfs_create
>        0.16 =C2=B1  2%      -0.0        0.14 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__fprop_inc_percpu_max
>        0.16 =C2=B1  8%      -0.0        0.13 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.xfs_create
>        0.10 =C2=B1  4%      -0.0        0.07 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.xfs_file_aio_write_checks
>        0.11 =C2=B1 10%      -0.0        0.08 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.nfs_pageio_doio
>        0.11 =C2=B1 10%      -0.0        0.08 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.nfs_generic_pg_pgios
>        0.19 =C2=B1  4%      -0.0        0.17 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.update_rq_clock
>        0.15 =C2=B1  4%      -0.0        0.13 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__xfs_trans_commit
>        0.08 =C2=B1 15%      -0.0        0.06 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.get_mem_cgroup_from_mm
>        0.06 =C2=B1 15%      +0.0        0.07 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.selinux_ip_postroute
>        0.08 =C2=B1 16%      +0.0        0.10 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.nf_hook_slow
>        0.04 =C2=B1 60%      +0.0        0.08 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.__inc_numa_state
>        0.03 =C2=B1100%      +0.0        0.07 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.get_task_policy
>        0.41 =C2=B1  6%      +0.0        0.46        perf-profile.children=
.cycles-pp.__release_sock
>        0.14 =C2=B1 11%      +0.1        0.19 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__list_add_valid
>        0.09 =C2=B1 17%      +0.1        0.14 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.svc_xprt_do_enqueue
>        0.14 =C2=B1 10%      +0.1        0.20 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.tcp_clean_rtx_queue
>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.children=
.cycles-pp.free_unref_page_commit
>        0.10 =C2=B1 11%      +0.1        0.17 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.iov_iter_advance
>        0.17 =C2=B1  9%      +0.1        0.24 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.tcp_ack
>        0.11 =C2=B1 21%      +0.1        0.18 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.schedule_timeout
>        0.00            +0.1        0.08 =C2=B1 17%  perf-profile.children=
.cycles-pp.free_one_page
>        0.23 =C2=B1 12%      +0.1        0.32 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__kfree_skb
>        0.10 =C2=B1  4%      +0.1        0.19 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.xas_create
>        0.12 =C2=B1 17%      +0.1        0.24 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.skb_release_data
>        0.00            +0.1        0.14 =C2=B1  5%  perf-profile.children=
.cycles-pp.__free_pages_ok
>        0.00            +0.2        0.21 =C2=B1  9%  perf-profile.children=
.cycles-pp.skb_page_frag_refill
>        0.00            +0.2        0.22 =C2=B1  9%  perf-profile.children=
.cycles-pp.sk_page_frag_refill
>        0.00            +0.2        0.25 =C2=B1  5%  perf-profile.children=
.cycles-pp.__sk_flush_backlog
>        0.03 =C2=B1100%      +0.4        0.39 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.free_pcppages_bulk
>        0.07 =C2=B1 29%      +0.5        0.54 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.free_unref_page
>        4.86 =C2=B1  6%      +0.5        5.40 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.svc_recv
>        9.98 =C2=B1  4%      +2.5       12.44 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.worker_thread
>        9.61 =C2=B1  4%      +2.5       12.15 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.process_one_work
>       47.02 =C2=B1  3%      +2.7       49.68 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.secondary_startup_64
>       47.02 =C2=B1  3%      +2.7       49.68 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.cpu_startup_entry
>       47.02 =C2=B1  3%      +2.7       49.69 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.do_idle
>        6.12 =C2=B1  2%      +2.8        8.88 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.memcpy_erms
>        0.00            +3.6        3.58 =C2=B1  3%  perf-profile.children=
.cycles-pp.memcpy_from_page
>        0.00            +3.7        3.68 =C2=B1  3%  perf-profile.children=
.cycles-pp._copy_from_iter_full
>        2.43 =C2=B1  6%      +3.8        6.20 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__rpc_execute
>        2.29 =C2=B1  6%      +3.8        6.05 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.rpc_async_schedule
>        1.93 =C2=B1  3%      +3.8        5.71 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.call_transmit
>        1.92 =C2=B1  4%      +3.8        5.71 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xprt_transmit
>        1.87 =C2=B1  4%      +3.8        5.67 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xs_tcp_send_request
>        1.86 =C2=B1  4%      +3.8        5.67 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.xs_sendpages
>        0.21 =C2=B1  7%      +5.3        5.54 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.tcp_sendmsg_locked
>        0.24 =C2=B1  8%      +5.4        5.63 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.tcp_sendmsg
>        0.25 =C2=B1  9%      +5.4        5.64 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.sock_sendmsg
>        1.17 =C2=B1  7%      -0.6        0.61 =C2=B1 21%  perf-profile.sel=
f.cycles-pp.rwsem_spin_on_owner
>        2.50 =C2=B1  4%      -0.5        2.05 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.clear_page_erms
>        2.46 =C2=B1  4%      -0.4        2.06 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.brd_do_bvec
>        0.22 =C2=B1 10%      -0.2        0.03 =C2=B1100%  perf-profile.sel=
f.cycles-pp.__skb_datagram_iter
>        1.53 =C2=B1  6%      -0.2        1.34 =C2=B1  3%  perf-profile.sel=
f.cycles-pp._raw_spin_lock
>        0.91 =C2=B1  4%      -0.2        0.74 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.poll_idle
>        0.24 =C2=B1 25%      -0.2        0.08 =C2=B1 40%  perf-profile.sel=
f.cycles-pp.osq_lock
>        0.74 =C2=B1 14%      -0.2        0.59 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.nfs_do_writepage
>        0.32 =C2=B1 13%      -0.1        0.17 =C2=B1 18%  perf-profile.sel=
f.cycles-pp.xas_start
>        0.97 =C2=B1  3%      -0.1        0.84 =C2=B1  8%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_irqsave
>        0.57 =C2=B1  6%      -0.1        0.45 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.xas_load
>        0.55 =C2=B1 10%      -0.1        0.43 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__schedule
>        0.14 =C2=B1 12%      -0.1        0.03 =C2=B1100%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_bh
>        0.53 =C2=B1  8%      -0.1        0.43 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.percpu_counter_add_batch
>        0.40 =C2=B1 13%      -0.1        0.30 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.mutex_spin_on_owner
>        0.33 =C2=B1  8%      -0.1        0.24 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.nfs_end_page_writeback
>        0.74 =C2=B1  6%      -0.1        0.65 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.nfs_updatepage
>        0.40 =C2=B1  8%      -0.1        0.31 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.__test_set_page_writeback
>        0.50 =C2=B1  8%      -0.1        0.41 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.iomap_set_range_uptodate
>        0.56 =C2=B1  5%      -0.1        0.48 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.try_to_wake_up
>        0.38 =C2=B1  8%      -0.1        0.30 =C2=B1  5%  perf-profile.sel=
f.cycles-pp._raw_spin_unlock_irqrestore
>        0.28 =C2=B1  9%      -0.1        0.20 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.iomap_write_end
>        0.45 =C2=B1  7%      -0.1        0.38 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__pagevec_lru_add_fn
>        0.15 =C2=B1 14%      -0.1        0.08 =C2=B1 27%  perf-profile.sel=
f.cycles-pp.add_to_page_cache_lru
>        0.43 =C2=B1  6%      -0.1        0.36        perf-profile.self.cyc=
les-pp.clear_page_dirty_for_io
>        0.51 =C2=B1  8%      -0.1        0.45 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.test_clear_page_writeback
>        0.20 =C2=B1  9%      -0.1        0.14 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.xas_store
>        0.31 =C2=B1  8%      -0.1        0.25 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.___might_sleep
>        0.15 =C2=B1 20%      -0.1        0.09 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.__check_object_size
>        0.22 =C2=B1  6%      -0.1        0.17 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.__x86_indirect_thunk_rax
>        0.08 =C2=B1 11%      -0.0        0.03 =C2=B1100%  perf-profile.sel=
f.cycles-pp.switch_mm_irqs_off
>        0.28 =C2=B1  4%      -0.0        0.24 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.release_pages
>        0.27 =C2=B1  8%      -0.0        0.23 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.dec_zone_page_state
>        0.19 =C2=B1  6%      -0.0        0.15 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.kmem_cache_alloc
>        0.15 =C2=B1 10%      -0.0        0.11 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__might_sleep
>        0.25 =C2=B1 10%      -0.0        0.21 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.wait_on_page_bit_common
>        0.07 =C2=B1 12%      -0.0        0.03 =C2=B1100%  perf-profile.sel=
f.cycles-pp.___slab_alloc
>        0.23 =C2=B1  7%      -0.0        0.20 =C2=B1 10%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_irq
>        0.18 =C2=B1  5%      -0.0        0.15 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.select_task_rq_fair
>        0.14 =C2=B1  5%      -0.0        0.11 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.alloc_pages_current
>        0.09 =C2=B1 16%      -0.0        0.06 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.memset_erms
>        0.10 =C2=B1  8%      -0.0        0.07        perf-profile.self.cyc=
les-pp._cond_resched
>        0.15 =C2=B1  4%      -0.0        0.12 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__nfs_find_lock_context
>        0.11 =C2=B1 13%      -0.0        0.09 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.nfs_request_add_commit_list_locked
>        0.09 =C2=B1  4%      -0.0        0.07        perf-profile.self.cyc=
les-pp.nfs_request_remove_commit_list
>        0.08 =C2=B1 10%      -0.0        0.06 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.get_mem_cgroup_from_mm
>        0.08 =C2=B1 10%      -0.0        0.06 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.nfs_request_add_commit_list
>        0.10 =C2=B1  5%      -0.0        0.08 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.___perf_sw_event
>        0.08 =C2=B1 13%      +0.0        0.11 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.mem_cgroup_commit_charge
>        0.03 =C2=B1100%      +0.0        0.07 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.run_timer_softirq
>        0.03 =C2=B1100%      +0.0        0.07 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.get_task_policy
>        0.03 =C2=B1100%      +0.0        0.07 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.__inc_numa_state
>        0.03 =C2=B1102%      +0.1        0.08 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.svc_recv
>        0.11 =C2=B1 13%      +0.1        0.17 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.__list_add_valid
>        0.09 =C2=B1 14%      +0.1        0.16 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.iov_iter_advance
>        0.06 =C2=B1 13%      +0.1        0.15 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.xas_create
>        0.00            +0.1        0.15 =C2=B1 14%  perf-profile.self.cyc=
les-pp.tcp_sendmsg_locked
>        0.00            +0.2        0.20 =C2=B1 11%  perf-profile.self.cyc=
les-pp.free_pcppages_bulk
>        0.04 =C2=B1 60%      +0.2        0.28 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.svc_tcp_recvfrom
>        1.25            +0.3        1.52 =C2=B1  5%  perf-profile.self.cyc=
les-pp.get_page_from_freelist
>        6.04 =C2=B1  2%      +2.7        8.74 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.memcpy_erms
> =

> =

>                                                                          =
        =

>                        fsmark.time.percent_of_cpu_this_job_got
>                                                                          =
        =

>    320 +-+---------------------------------------------------------------=
----+
>        |                                                                 =
    |
>    300 +-++.                                                          +  =
    |
>        |.   +..    .+.     +..  +..                              +. .. + =
 .+.|
>    280 +-+     +.+.   +.. :    +    .+..+.  .+.  .+.  .+.+..   ..  +    +=
.   |
>        |                  :   +    +      +.   +.   +.       .+          =
    |
>    260 +-+               +                                  +            =
    |
>        |                                                                 =
    |
>    240 +-+                                                               =
    |
>        |                                                                 =
    |
>    220 +-+                                                               =
    |
>        |       O                                         O  O O  O O  O  =
    |
>    200 O-+       O  O      O       O           O  O O  O                 =
    |
>        |  O O         O  O    O O    O  O O  O                           =
    |
>    180 +-+---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                              fsmark.time.elapsed_time
>                                                                          =
        =

>    32 +-+O---------------------------------------------------------------=
----+
>       O    O    O       O O  O O  O O  O  O O                            =
    |
>    31 +-+     O    O O                         O O  O O    O  O O  O O   =
    |
>    30 +-+                                                O               =
    |
>       |                                                                  =
    |
>    29 +-+                                                                =
    |
>    28 +-+                                                                =
    |
>       |                                                                  =
    |
>    27 +-+                                                                =
    |
>    26 +-+                                                    .+          =
    |
>       |                 +         +                 +.+.. .+.  +  .+.  .+=
.   |
>    25 +-+             .. +  .+   + :   +..+.+..+. ..     +      +.   +.  =
 +..|
>    24 +-+    .+.+..+.+    +.  + +  : ..          +                       =
    |
>       |  +.+.                  +    +                                    =
    |
>    23 +-+----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                            fsmark.time.elapsed_time.max
>                                                                          =
        =

>    32 +-+O---------------------------------------------------------------=
----+
>       O    O    O       O O  O O  O O  O  O O                            =
    |
>    31 +-+     O    O O                         O O  O O    O  O O  O O   =
    |
>    30 +-+                                                O               =
    |
>       |                                                                  =
    |
>    29 +-+                                                                =
    |
>    28 +-+                                                                =
    |
>       |                                                                  =
    |
>    27 +-+                                                                =
    |
>    26 +-+                                                    .+          =
    |
>       |                 +         +                 +.+.. .+.  +  .+.  .+=
.   |
>    25 +-+             .. +  .+   + :   +..+.+..+. ..     +      +.   +.  =
 +..|
>    24 +-+    .+.+..+.+    +.  + +  : ..          +                       =
    |
>       |  +.+.                  +    +                                    =
    |
>    23 +-+----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                 fsmark.files_per_sec
>                                                                          =
        =

>    520 +-+---------------------------------------------------------------=
----+
>        |..     +.+.  +     +.. .+.. :            .+.    .+..         .+.+=
..+ |
>    500 +-+            +.. +   +     :   +.+..+.+.   +..+        .+.+.    =
    |
>    480 +-+               +         +                        +.+.         =
    |
>        |                                                                 =
    |
>    460 +-+                                                               =
    |
>        |                                                                 =
    |
>    440 +-+                                                               =
    |
>        |                                                                 =
    |
>    420 +-+                                                               =
    |
>    400 +-+                                               O               =
    |
>        |                                       O  O O  O    O O  O O  O  =
    |
>    380 O-+     O O  O O  O O            O O  O                           =
    |
>        |  O O                 O O  O O                                   =
    |
>    360 +-+---------------------------------------------------------------=
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
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp
> =


Do you have time to take a look at this regression?

-- =

Zhengjun Xing

--===============4676675549254076368==--

