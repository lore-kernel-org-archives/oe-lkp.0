Content-Type: multipart/mixed; boundary="===============1213514727314617163=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 070f5e860e: reaim.jobs_per_min -10.5% regression
Date: Mon, 15 Jun 2020 15:37:52 +0800
Message-ID: <dda6fcc8-083c-e331-ebe5-74160a92474a@linux.intel.com>
In-Reply-To: <20200612151907.GA11611@vingu-book>
List-Id: <oe-lkp.lists.linux.dev>

--===============1213514727314617163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/12/2020 11:19 PM, Vincent Guittot wrote:
> Le vendredi 12 juin 2020 =C3=A0 14:36:49 (+0800), Xing Zhengjun a =C3=A9c=
rit :
>> Hi Vincent,
>>
>>    We test the regression still existed in v5.7, do you have time to loo=
k at
>> it? Thanks.
>>
>>
> =

> The commit 070f5e860ee2 moveis some cases from the state "group has spare=
 capacity" to
> to the state "group is overloaded". Typically when util_avg decreases sig=
nificantly
> after a migration but the group is in fact still overloaded.
> The current rule uses a fix threshold but has the disavantage of possibly=
 including
> some cases with spare capacity but a high runnable_avg (because of tasks =
running
> simultaneously as an example).
> It looks like this benchmark is impacted by moving such cases from has_sp=
are_capacity
> to is_overloaded. I have a patch in my backlog  that tries to fix the pro=
blem but I
> never sent it because I failed to find a benchmark that will benefit from=
 it.
> =

> This patch moves back some cases from overloaded state to "has spare capa=
city" state.
> =

> Could you make it a try ?
> =

> ---
>   kernel/sched/fair.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> =

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0ed04d2a8959..c24f85969591 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8213,10 +8213,14 @@ static inline int sg_imbalanced(struct sched_grou=
p *group)
>   static inline bool
>   group_has_capacity(unsigned int imbalance_pct, struct sg_lb_stats *sgs)
>   {
> +	unsigned long imb;
> +
>   	if (sgs->sum_nr_running < sgs->group_weight)
>   		return true;
> =

> -	if ((sgs->group_capacity * imbalance_pct) <
> +	imb =3D imbalance_pct-100;
> +	imb =3D sgs->sum_nr_running * imb + 100;
> +	if ((sgs->group_capacity * imb) <
>   			(sgs->group_runnable * 100))
>   		return false;
> =

> @@ -8238,6 +8242,8 @@ group_has_capacity(unsigned int imbalance_pct, stru=
ct sg_lb_stats *sgs)
>   static inline bool
>   group_is_overloaded(unsigned int imbalance_pct, struct sg_lb_stats *sgs)
>   {
> +	unsigned long imb;
> +
>   	if (sgs->sum_nr_running <=3D sgs->group_weight)
>   		return false;
> =

> @@ -8245,7 +8251,9 @@ group_is_overloaded(unsigned int imbalance_pct, str=
uct sg_lb_stats *sgs)
>   			(sgs->group_util * imbalance_pct))
>   		return true;
> =

> -	if ((sgs->group_capacity * imbalance_pct) <
> +	imb =3D imbalance_pct-100;
> +	imb =3D sgs->sum_nr_running * imb + 100;
> +	if ((sgs->group_capacity * imb) <
>   			(sgs->group_runnable * 100))
>   		return true;
> =

> --
> 2.17.1
> =

> =



I apply the patch based on v5.7, the regression still existed.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/runtime/nr_task/debug-setup/tes=
t/cpufreq_governor/ucode:
 =

lkp-ivb-d04/reaim/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/300s/100=
%/test/five_sec/performance/0x21

commit:
   9f68395333ad7f5bfe2f83473fed363d4229f11c
   070f5e860ee2bf588c99ef7b4c202451faa48236
   v5.7
   068638639cdfa15dbff137a0e3ef4a4cc6730ff4 (Vincent's patch)

9f68395333ad7f5b 070f5e860ee2bf588c99ef7b4c2                        v5.7 =

068638639cdfa15dbff137a0e3e
---------------- --------------------------- --------------------------- =

---------------------------
          %stddev     %change         %stddev     %change =

%stddev     %change         %stddev
              \          |                \          |                \ =

         |                \
       0.69           -10.3%       0.62            -9.1%       0.62 =

       -8.9%       0.63        reaim.child_systime
       0.62            -1.0%       0.61            +0.5%       0.62 =

       +0.6%       0.62        reaim.child_utime
      66870           -10.0%      60187            -7.6%      61787 =

       -7.7%      61714        reaim.jobs_per_min
      16717           -10.0%      15046            -7.6%      15446 =

       -7.7%      15428        reaim.jobs_per_min_child
      97.84            -1.1%      96.75            -0.4%      97.43 =

       -0.6%      97.25        reaim.jti
      72000           -10.8%      64216            -8.3%      66000 =

       -8.3%      66000        reaim.max_jobs_per_min
       0.36           +10.6%       0.40            +7.8%       0.39 =

       +8.2%       0.39        reaim.parent_time
       1.58 =C2=B1  2%     +71.0%       2.70 =C2=B1  2%     +26.9%       2.=
01 =C2=B1 =

2%     +38.4%       2.19 =C2=B1  6%  reaim.std_dev_percent
       0.00 =C2=B1  5%    +110.4%       0.01 =C2=B1  3%     +48.8%       0.=
01 =C2=B1 =

7%     +67.1%       0.01 =C2=B1  9%  reaim.std_dev_time
      50800            -2.4%      49600            -1.6%      50000 =

       -1.6%      50000        reaim.workload


> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> tbox_group/testcase/rootfs/kconfig/compiler/runtime/nr_task/debug-setup/=
test/cpufreq_governor/ucode:
>>
>> lkp-ivb-d04/reaim/debian-x86_64-20191114.cgz/x86_64-rhel-7.6/gcc-7/300s/=
100%/test/five_sec/performance/0x21
>>
>> commit:
>>    9f68395333ad7f5bfe2f83473fed363d4229f11c
>>    070f5e860ee2bf588c99ef7b4c202451faa48236
>>    v5.7
>>
>> 9f68395333ad7f5b 070f5e860ee2bf588c99ef7b4c2                        v5.7
>> ---------------- --------------------------- ---------------------------
>>           %stddev     %change         %stddev     %change         %stddev
>>               \          |                \          |                \
>>        0.69           -10.3%       0.62            -9.1%       0.62
>> reaim.child_systime
>>        0.62            -1.0%       0.61            +0.5%       0.62
>> reaim.child_utime
>>       66870           -10.0%      60187            -7.6%      61787
>> reaim.jobs_per_min
>>       16717           -10.0%      15046            -7.6%      15446
>> reaim.jobs_per_min_child
>>       97.84            -1.1%      96.75            -0.4%      97.43
>> reaim.jti
>>       72000           -10.8%      64216            -8.3%      66000
>> reaim.max_jobs_per_min
>>        0.36           +10.6%       0.40            +7.8%       0.39
>> reaim.parent_time
>>        1.58 =C2=B1  2%     +71.0%       2.70 =C2=B1  2%     +26.9%      =
 2.01 =C2=B1 2%
>> reaim.std_dev_percent
>>        0.00 =C2=B1  5%    +110.4%       0.01 =C2=B1  3%     +48.8%      =
 0.01 =C2=B1 7%
>> reaim.std_dev_time
>>       50800            -2.4%      49600            -1.6%      50000
>> reaim.workload
>>
>>
>> On 3/19/2020 10:38 AM, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -10.5% regression of reaim.jobs_per_min due to commit:
>>>
>>>
>>> commit: 070f5e860ee2bf588c99ef7b4c202451faa48236 ("sched/fair: Take int=
o account runnable_avg to classify group")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> in testcase: reaim
>>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with=
 4G memory
>>> with following parameters:
>>>
>>> 	runtime: 300s
>>> 	nr_task: 100%
>>> 	test: five_sec
>>> 	cpufreq_governor: performance
>>> 	ucode: 0x21
>>>
>>> test-description: REAIM is an updated and improved version of AIM 7 ben=
chmark.
>>> test-url: https://sourceforge.net/projects/re-aim-7/
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
--------------------------->
>>>
>>>
>>> To reproduce:
>>>
>>>           git clone https://github.com/intel/lkp-tests.git
>>>           cd lkp-tests
>>>           bin/lkp install job.yaml  # job file is attached in this email
>>>           bin/lkp run     job.yaml
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/tes=
t/testcase/ucode:
>>>     gcc-7/performance/x86_64-rhel-7.6/100%/debian-x86_64-20191114.cgz/3=
00s/lkp-ivb-d04/five_sec/reaim/0x21
>>>
>>> commit:
>>>     9f68395333 ("sched/pelt: Add a new runnable average signal")
>>>     070f5e860e ("sched/fair: Take into account runnable_avg to classify=
 group")
>>>
>>> 9f68395333ad7f5b 070f5e860ee2bf588c99ef7b4c2
>>> ---------------- ---------------------------
>>>          fail:runs  %reproduction    fail:runs
>>>              |             |             |
>>>             4:4          -18%           3:4     perf-profile.children.c=
ycles-pp.error_entry
>>>             3:4          -12%           3:4     perf-profile.self.cycle=
s-pp.error_entry
>>>            %stddev     %change         %stddev
>>>                \          |                \
>>>         0.68           -10.4%       0.61        reaim.child_systime
>>>        67235           -10.5%      60195        reaim.jobs_per_min
>>>        16808           -10.5%      15048        reaim.jobs_per_min_child
>>>        97.90            -1.2%      96.70        reaim.jti
>>>        72000           -10.8%      64216        reaim.max_jobs_per_min
>>>         0.36           +11.3%       0.40        reaim.parent_time
>>>         1.56 =C2=B1  3%     +79.1%       2.80 =C2=B1  6%  reaim.std_dev=
_percent
>>>         0.00 =C2=B1  7%    +145.9%       0.01 =C2=B1  9%  reaim.std_dev=
_time
>>>       104276           -16.0%      87616        reaim.time.involuntary_=
context_switches
>>>     15511157            -2.4%   15144312        reaim.time.minor_page_f=
aults
>>>        55.00            -7.3%      51.00        reaim.time.percent_of_c=
pu_this_job_got
>>>        88.01           -12.4%      77.12        reaim.time.system_time
>>>        79.97            -3.2%      77.38        reaim.time.user_time
>>>       216380            -3.4%     208924        reaim.time.voluntary_co=
ntext_switches
>>>        50800            -2.4%      49600        reaim.workload
>>>        30.40 =C2=B1  2%      -4.7%      28.97 =C2=B1  2%  boot-time.boot
>>>         9.38            -0.7        8.66 =C2=B1  3%  mpstat.cpu.all.sys%
>>>         7452            +7.5%       8014        vmstat.system.cs
>>>      1457802 =C2=B1 16%     +49.3%    2176122 =C2=B1 13%  cpuidle.C1.ti=
me
>>>     48523684           +43.4%   69570233 =C2=B1 22%  cpuidle.C1E.time
>>>       806543 =C2=B1  2%     +20.7%     973406 =C2=B1 11%  cpuidle.C1E.u=
sage
>>>        14328 =C2=B1  6%     +14.5%      16410 =C2=B1  8%  cpuidle.POLL.=
time
>>>        43300 =C2=B1  4%     +13.5%      49150 =C2=B1  5%  softirqs.CPU0=
.SCHED
>>>       118751            -9.3%     107763        softirqs.CPU1.RCU
>>>        41679 =C2=B1  3%     +14.1%      47546 =C2=B1  4%  softirqs.CPU1=
.SCHED
>>>        42688 =C2=B1  3%     +12.3%      47931 =C2=B1  4%  softirqs.CPU2=
.SCHED
>>>        41730 =C2=B1  2%     +17.7%      49115 =C2=B1  4%  softirqs.CPU3=
.SCHED
>>>       169399           +14.4%     193744 =C2=B1  2%  softirqs.SCHED
>>>         3419            +1.0%       3453        proc-vmstat.nr_kernel_s=
tack
>>>     16365616            -1.8%   16077850        proc-vmstat.numa_hit
>>>     16365616            -1.8%   16077850        proc-vmstat.numa_local
>>>        93908            -1.6%      92389        proc-vmstat.pgactivate
>>>     16269664            -3.9%   15629529 =C2=B1  2%  proc-vmstat.pgallo=
c_normal
>>>     15918803            -2.3%   15557936        proc-vmstat.pgfault
>>>     16644610            -2.0%   16310898        proc-vmstat.pgfree
>>>        20125 =C2=B1123%    +161.7%      52662 =C2=B1 30%  sched_debug.c=
fs_rq:/.load.min
>>>       348749 =C2=B1 10%     -11.2%     309562 =C2=B1 11%  sched_debug.c=
fs_rq:/.load.stddev
>>>         1096 =C2=B1  6%     -14.4%     938.42 =C2=B1  7%  sched_debug.c=
fs_rq:/.load_avg.max
>>>       448.46 =C2=B1  8%     -17.5%     370.19 =C2=B1 10%  sched_debug.c=
fs_rq:/.load_avg.stddev
>>>       117372           -10.2%     105432        sched_debug.cfs_rq:/.mi=
n_vruntime.avg
>>>       135242 =C2=B1  4%      -9.2%     122811        sched_debug.cfs_rq=
:/.min_vruntime.max
>>>         0.53 =C2=B1  8%     +17.6%       0.62 =C2=B1  6%  sched_debug.c=
fs_rq:/.nr_running.avg
>>>        29.79 =C2=B1 30%     -51.0%      14.58 =C2=B1 35%  sched_debug.c=
fs_rq:/.nr_spread_over.max
>>>        10.21 =C2=B1 34%     -59.7%       4.12 =C2=B1 52%  sched_debug.c=
fs_rq:/.nr_spread_over.stddev
>>>        78.25 =C2=B1 40%   +3304.7%       2664 =C2=B1 94%  sched_debug.c=
pu.curr->pid.min
>>>       294309 =C2=B1  2%     +34.3%     395172 =C2=B1 12%  sched_debug.c=
pu.nr_switches.min
>>>         9.58 =C2=B1 35%     +84.8%      17.71 =C2=B1 40%  sched_debug.c=
pu.nr_uninterruptible.max
>>>        -6.88          +120.6%     -15.17        sched_debug.cpu.nr_unin=
terruptible.min
>>>         6.41 =C2=B1 30%     +95.2%      12.52 =C2=B1 33%  sched_debug.c=
pu.nr_uninterruptible.stddev
>>>       286185           +33.4%     381734 =C2=B1 13%  sched_debug.cpu.sc=
hed_count.min
>>>       180416           +11.0%     200247        sched_debug.cpu.sched_g=
oidle.avg
>>>       116264 =C2=B1  3%     +44.6%     168090 =C2=B1 15%  sched_debug.c=
pu.sched_goidle.min
>>>       476.00 =C2=B1  8%     +92.4%     915.75 =C2=B1  3%  interrupts.CA=
L:Function_call_interrupts
>>>       110.50 =C2=B1 24%    +101.1%     222.25 =C2=B1  4%  interrupts.CP=
U0.CAL:Function_call_interrupts
>>>         1381 =C2=B1 29%     +23.7%       1709 =C2=B1 26%  interrupts.CP=
U0.NMI:Non-maskable_interrupts
>>>         1381 =C2=B1 29%     +23.7%       1709 =C2=B1 26%  interrupts.CP=
U0.PMI:Performance_monitoring_interrupts
>>>         3319 =C2=B1  9%     +50.4%       4991 =C2=B1  2%  interrupts.CP=
U0.RES:Rescheduling_interrupts
>>>        41.25 =C2=B1 30%    +274.5%     154.50 =C2=B1 15%  interrupts.CP=
U0.TLB:TLB_shootdowns
>>>       116.25 =C2=B1 23%     +96.1%     228.00 =C2=B1 16%  interrupts.CP=
U1.CAL:Function_call_interrupts
>>>         1183 =C2=B1 10%     +43.1%       1692 =C2=B1 23%  interrupts.CP=
U1.NMI:Non-maskable_interrupts
>>>         1183 =C2=B1 10%     +43.1%       1692 =C2=B1 23%  interrupts.CP=
U1.PMI:Performance_monitoring_interrupts
>>>         3335 =C2=B1  7%     +60.4%       5350 =C2=B1  5%  interrupts.CP=
U1.RES:Rescheduling_interrupts
>>>        36.25 =C2=B1 30%    +344.1%     161.00 =C2=B1  8%  interrupts.CP=
U1.TLB:TLB_shootdowns
>>>       131.25 =C2=B1 11%     +81.1%     237.75 =C2=B1 11%  interrupts.CP=
U2.CAL:Function_call_interrupts
>>>         3247 =C2=B1  2%     +62.4%       5274        interrupts.CPU2.RE=
S:Rescheduling_interrupts
>>>        34.50 =C2=B1 36%    +357.2%     157.75 =C2=B1  7%  interrupts.CP=
U2.TLB:TLB_shootdowns
>>>       118.00 =C2=B1 13%     +93.0%     227.75 =C2=B1  9%  interrupts.CP=
U3.CAL:Function_call_interrupts
>>>         3155 =C2=B1  4%     +68.7%       5322 =C2=B1  3%  interrupts.CP=
U3.RES:Rescheduling_interrupts
>>>        38.50 =C2=B1 16%    +303.9%     155.50 =C2=B1  3%  interrupts.CP=
U3.TLB:TLB_shootdowns
>>>        13057 =C2=B1  2%     +60.4%      20939        interrupts.RES:Res=
cheduling_interrupts
>>>       150.50 =C2=B1 27%    +317.8%     628.75 =C2=B1  3%  interrupts.TL=
B:TLB_shootdowns
>>>         2.00            +0.1        2.09 =C2=B1  3%  perf-stat.i.branch=
-miss-rate%
>>>        10.26            +1.1       11.36 =C2=B1  7%  perf-stat.i.cache-=
miss-rate%
>>>      2009706 =C2=B1  2%      +5.4%    2117525 =C2=B1  3%  perf-stat.i.c=
ache-misses
>>>     16867421            -4.5%   16106908        perf-stat.i.cache-refer=
ences
>>>         7514            +7.6%       8083        perf-stat.i.context-swi=
tches
>>>         1.51            -3.0%       1.47        perf-stat.i.cpi
>>>    2.523e+09 =C2=B1  3%      -8.8%  2.301e+09 =C2=B1  2%  perf-stat.i.c=
pu-cycles
>>>       124.54          +157.8%     321.08        perf-stat.i.cpu-migrati=
ons
>>>         1842 =C2=B1 10%     -18.6%       1498 =C2=B1  6%  perf-stat.i.c=
ycles-between-cache-misses
>>>       752585 =C2=B1  2%      -4.1%     721714        perf-stat.i.dTLB-s=
tore-misses
>>>       590441            +2.7%     606399        perf-stat.i.iTLB-load-m=
isses
>>>        68766            +4.0%      71488 =C2=B1  2%  perf-stat.i.iTLB-l=
oads
>>>    1.847e+09 =C2=B1  3%      -4.7%   1.76e+09 =C2=B1  2%  perf-stat.i.i=
nstructions
>>>         3490 =C2=B1  4%      -8.5%       3195 =C2=B1  3%  perf-stat.i.i=
nstructions-per-iTLB-miss
>>>         0.68            +3.7%       0.70        perf-stat.i.ipc
>>>        51861            -2.1%      50797        perf-stat.i.minor-faults
>>>        51861            -2.1%      50797        perf-stat.i.page-faults
>>>         2.68 =C2=B1  2%      +0.1        2.78        perf-stat.overall.=
branch-miss-rate%
>>>        11.91            +1.2       13.14 =C2=B1  2%  perf-stat.overall.=
cache-miss-rate%
>>>         1.37            -4.3%       1.31        perf-stat.overall.cpi
>>>         1255           -13.4%       1087 =C2=B1  2%  perf-stat.overall.=
cycles-between-cache-misses
>>>         3127 =C2=B1  3%      -7.2%       2901 =C2=B1  2%  perf-stat.ove=
rall.instructions-per-iTLB-miss
>>>         0.73            +4.5%       0.76        perf-stat.overall.ipc
>>>      2002763 =C2=B1  2%      +5.4%    2110303 =C2=B1  3%  perf-stat.ps.=
cache-misses
>>>     16809816            -4.5%   16051656        perf-stat.ps.cache-refe=
rences
>>>         7489            +7.6%       8055        perf-stat.ps.context-sw=
itches
>>>    2.514e+09 =C2=B1  3%      -8.8%  2.293e+09 =C2=B1  2%  perf-stat.ps.=
cpu-cycles
>>>       124.12          +157.8%     319.95        perf-stat.ps.cpu-migrat=
ions
>>>       750010 =C2=B1  2%      -4.1%     719223        perf-stat.ps.dTLB-=
store-misses
>>>       588424            +2.7%     604314        perf-stat.ps.iTLB-load-=
misses
>>>        68533            +4.0%      71246 =C2=B1  2%  perf-stat.ps.iTLB-=
loads
>>>    1.841e+09 =C2=B1  3%      -4.7%  1.754e+09 =C2=B1  2%  perf-stat.ps.=
instructions
>>>        51683            -2.1%      50622        perf-stat.ps.minor-faul=
ts
>>>        51683            -2.1%      50622        perf-stat.ps.page-faults
>>>    5.577e+11 =C2=B1  3%      -5.1%  5.292e+11 =C2=B1  2%  perf-stat.tot=
al.instructions
>>>         7.35 =C2=B1 17%      -2.7        4.60 =C2=B1 10%  perf-profile.=
calltrace.cycles-pp.serial8250_console_putchar.uart_console_write.serial825=
0_console_write.console_unlock.vprintk_emit
>>>         7.74 =C2=B1 20%      -2.7        5.00 =C2=B1  6%  perf-profile.=
calltrace.cycles-pp.wait_for_xmitr.serial8250_console_putchar.uart_console_=
write.serial8250_console_write.console_unlock
>>>        10.14 =C2=B1  8%      -2.7        7.44 =C2=B1  6%  perf-profile.=
calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>>>        10.66 =C2=B1  8%      -2.6        8.07 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.write
>>>         7.10 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.write._fini
>>>         7.10 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp._fini
>>>         7.09 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write._fini
>>>         7.09 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write._fini
>>>         7.09 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.write._fini
>>>         7.09 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.devkmsg_write.new_sync_write.vfs_write.ksys_write.do_sy=
scall_64
>>>         7.09 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.vprintk_emit.devkmsg_emit.devkmsg_write.new_sync_write.=
vfs_write
>>>         7.09 =C2=B1 17%      -2.4        4.69 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.devkmsg_emit.devkmsg_write.new_sync_write.vfs_write.ksy=
s_write
>>>         6.20 =C2=B1  8%      -2.1        4.08 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write.=
new_sync_write
>>>         5.15 =C2=B1 11%      -1.8        3.38 =C2=B1  4%  perf-profile.=
calltrace.cycles-pp.serial8250_console_write.console_unlock.vprintk_emit.de=
vkmsg_emit.devkmsg_write
>>>         5.05 =C2=B1 11%      -1.7        3.31 =C2=B1  3%  perf-profile.=
calltrace.cycles-pp.uart_console_write.serial8250_console_write.console_unl=
ock.vprintk_emit.devkmsg_emit
>>>         7.41 =C2=B1 10%      -1.1        6.29 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.__do_execve_file.__x64_sys_execve.do_syscall_64.entry_S=
YSCALL_64_after_hwframe.execve
>>>         7.57 =C2=B1 11%      -1.1        6.46 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.execve
>>>         7.46 =C2=B1 10%      -1.1        6.37 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.execve
>>>         7.46 =C2=B1 10%      -1.1        6.37 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
>>>         7.46 =C2=B1 10%      -1.1        6.37 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>>>         7.03 =C2=B1  5%      -1.1        5.95 =C2=B1 10%  perf-profile.=
calltrace.cycles-pp.brk
>>>         5.90 =C2=B1  7%      -0.9        4.98 =C2=B1 10%  perf-profile.=
calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.brk
>>>         5.84 =C2=B1  7%      -0.9        4.93 =C2=B1  9%  perf-profile.=
calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
>>>        15.77 =C2=B1  2%      -0.9       14.88 =C2=B1  2%  perf-profile.=
calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>>        15.86 =C2=B1  2%      -0.9       14.97 =C2=B1  2%  perf-profile.=
calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>>>         3.88 =C2=B1  6%      -0.9        2.99 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.kill
>>>         1.70 =C2=B1 23%      -0.8        0.90 =C2=B1 10%  perf-profile.=
calltrace.cycles-pp.delay_tsc.wait_for_xmitr.serial8250_console_putchar.uar=
t_console_write.serial8250_console_write
>>>         4.88 =C2=B1  8%      -0.8        4.08 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.brk
>>>         2.39 =C2=B1 27%      -0.7        1.67 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.flush_old_exec.load_elf_binary.search_binary_handler.__=
do_execve_file.__x64_sys_execve
>>>         2.29 =C2=B1 30%      -0.7        1.59 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.mmput.flush_old_exec.load_elf_binary.search_binary_hand=
ler.__do_execve_file
>>>         2.27 =C2=B1 30%      -0.7        1.58 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_b=
inary_handler
>>>         3.11 =C2=B1  5%      -0.6        2.47 =C2=B1  9%  perf-profile.=
calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.kill
>>>         3.07 =C2=B1  5%      -0.6        2.45 =C2=B1  9%  perf-profile.=
calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.kill
>>>         2.09 =C2=B1 18%      -0.4        1.67 =C2=B1  3%  perf-profile.=
calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>>>         2.82 =C2=B1  9%      -0.4        2.40 =C2=B1 12%  perf-profile.=
calltrace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_sys=
call_64
>>>         2.80 =C2=B1  9%      -0.4        2.38 =C2=B1 12%  perf-profile.=
calltrace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_gr=
oup
>>>         1.11 =C2=B1 33%      -0.4        0.71 =C2=B1 10%  perf-profile.=
calltrace.cycles-pp.unmap_vmas.exit_mmap.mmput.flush_old_exec.load_elf_bina=
ry
>>>         1.05 =C2=B1 15%      -0.4        0.69 =C2=B1 13%  perf-profile.=
calltrace.cycles-pp.vt_console_print.console_unlock.vprintk_emit.devkmsg_em=
it.devkmsg_write
>>>         1.03 =C2=B1 17%      -0.4        0.68 =C2=B1 13%  perf-profile.=
calltrace.cycles-pp.lf.vt_console_print.console_unlock.vprintk_emit.devkmsg=
_emit
>>>         1.03 =C2=B1 17%      -0.4        0.68 =C2=B1 13%  perf-profile.=
calltrace.cycles-pp.con_scroll.lf.vt_console_print.console_unlock.vprintk_e=
mit
>>>         1.03 =C2=B1 17%      -0.4        0.68 =C2=B1 13%  perf-profile.=
calltrace.cycles-pp.fbcon_scroll.con_scroll.lf.vt_console_print.console_unl=
ock
>>>         0.96 =C2=B1 16%      -0.3        0.66 =C2=B1 12%  perf-profile.=
calltrace.cycles-pp.fbcon_putcs.fbcon_redraw.fbcon_scroll.con_scroll.lf
>>>         1.85 =C2=B1  4%      -0.3        1.58 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.alloc_pages_vma.handle_pte_fault.__handle_mm_fault.hand=
le_mm_fault.do_page_fault
>>>         0.89 =C2=B1 15%      -0.3        0.62 =C2=B1 12%  perf-profile.=
calltrace.cycles-pp.kill_pid_info.kill_something_info.__x64_sys_kill.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
>>>         1.67 =C2=B1  5%      -0.3        1.41 =C2=B1  9%  perf-profile.=
calltrace.cycles-pp.__alloc_pages_nodemask.alloc_pages_vma.handle_pte_fault=
.__handle_mm_fault.handle_mm_fault
>>>         1.02 =C2=B1  7%      -0.3        0.77 =C2=B1 12%  perf-profile.=
calltrace.cycles-pp.do_signal.exit_to_usermode_loop.do_syscall_64.entry_SYS=
CALL_64_after_hwframe.kill
>>>         0.94 =C2=B1 16%      -0.2        0.70 =C2=B1  5%  perf-profile.=
calltrace.cycles-pp.clear_page_erms.prep_new_page.get_page_from_freelist.__=
alloc_pages_nodemask.alloc_pages_vma
>>>         0.98 =C2=B1 16%      -0.2        0.74 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.prep_new_page.get_page_from_freelist.__alloc_pages_node=
mask.alloc_pages_vma.handle_pte_fault
>>>         1.03 =C2=B1  6%      -0.2        0.79 =C2=B1 10%  perf-profile.=
calltrace.cycles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.kill
>>>         1.00 =C2=B1 10%      -0.2        0.77 =C2=B1  9%  perf-profile.=
calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>>>         0.87 =C2=B1 10%      -0.2        0.66 =C2=B1 15%  perf-profile.=
calltrace.cycles-pp.shmem_file_read_iter.new_sync_read.vfs_read.ksys_read.d=
o_syscall_64
>>>         1.41 =C2=B1  3%      -0.2        1.23 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pag=
es_vma.handle_pte_fault.__handle_mm_fault
>>>         1.88 =C2=B1  5%      -0.1        1.73        perf-profile.callt=
race.cycles-pp.__x64_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>>         1.87 =C2=B1  5%      -0.1        1.73        perf-profile.callt=
race.cycles-pp._do_fork.__x64_sys_clone.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
>>>        10.34 =C2=B1 11%      +7.3       17.66 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary=
.secondary_startup_64
>>>        10.18 =C2=B1 11%      +7.3       17.52 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_e=
ntry.start_secondary
>>>        11.32 =C2=B1  9%      +7.7       19.03 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_sta=
rtup_64
>>>        11.32 =C2=B1  9%      +7.7       19.05 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>>>        11.32 =C2=B1  9%      +7.7       19.05 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.start_secondary.secondary_startup_64
>>>        11.02 =C2=B1  5%      +8.1       19.14 =C2=B1  7%  perf-profile.=
calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cp=
u_startup_entry
>>>        16.04 =C2=B1  6%      +9.1       25.17 =C2=B1  8%  perf-profile.=
calltrace.cycles-pp.secondary_startup_64
>>>        55.98            -7.0       48.94 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.entry_SYSCALL_64_after_hwframe
>>>        55.67            -7.0       48.67 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.do_syscall_64
>>>        10.60 =C2=B1 16%      -3.3        7.30 =C2=B1  8%  perf-profile.=
children.cycles-pp.vprintk_emit
>>>        13.02 =C2=B1  7%      -3.0        9.99 =C2=B1  7%  perf-profile.=
children.cycles-pp.write
>>>         9.92 =C2=B1 13%      -2.8        7.08 =C2=B1  4%  perf-profile.=
children.cycles-pp.console_unlock
>>>        10.26 =C2=B1  8%      -2.7        7.53 =C2=B1  6%  perf-profile.=
children.cycles-pp.new_sync_write
>>>        10.79 =C2=B1  8%      -2.6        8.18 =C2=B1  8%  perf-profile.=
children.cycles-pp.vfs_write
>>>        10.95 =C2=B1  8%      -2.6        8.36 =C2=B1  8%  perf-profile.=
children.cycles-pp.ksys_write
>>>         7.17 =C2=B1 16%      -2.5        4.69 =C2=B1  7%  perf-profile.=
children.cycles-pp.devkmsg_write
>>>         7.17 =C2=B1 16%      -2.5        4.69 =C2=B1  7%  perf-profile.=
children.cycles-pp.devkmsg_emit
>>>         8.65 =C2=B1 16%      -2.4        6.21 =C2=B1  4%  perf-profile.=
children.cycles-pp.serial8250_console_write
>>>         8.53 =C2=B1 17%      -2.4        6.11 =C2=B1  4%  perf-profile.=
children.cycles-pp.uart_console_write
>>>         7.13 =C2=B1 17%      -2.4        4.71 =C2=B1  6%  perf-profile.=
children.cycles-pp._fini
>>>         8.46 =C2=B1 16%      -2.4        6.07 =C2=B1  4%  perf-profile.=
children.cycles-pp.wait_for_xmitr
>>>         8.34 =C2=B1 16%      -2.4        5.97 =C2=B1  4%  perf-profile.=
children.cycles-pp.serial8250_console_putchar
>>>         5.80 =C2=B1 16%      -1.6        4.21 =C2=B1  6%  perf-profile.=
children.cycles-pp.io_serial_in
>>>         7.85 =C2=B1 10%      -1.2        6.67 =C2=B1  5%  perf-profile.=
children.cycles-pp.execve
>>>         7.72 =C2=B1 11%      -1.2        6.55 =C2=B1  5%  perf-profile.=
children.cycles-pp.__do_execve_file
>>>         5.19 =C2=B1 13%      -1.1        4.05 =C2=B1  8%  perf-profile.=
children.cycles-pp.mmput
>>>         5.16 =C2=B1 13%      -1.1        4.03 =C2=B1  8%  perf-profile.=
children.cycles-pp.exit_mmap
>>>         7.76 =C2=B1 10%      -1.1        6.64 =C2=B1  5%  perf-profile.=
children.cycles-pp.__x64_sys_execve
>>>         7.11 =C2=B1  5%      -1.1        6.01 =C2=B1 10%  perf-profile.=
children.cycles-pp.brk
>>>         3.92 =C2=B1  6%      -0.9        3.03 =C2=B1  5%  perf-profile.=
children.cycles-pp.kill
>>>         2.63 =C2=B1 17%      -0.8        1.85        perf-profile.child=
ren.cycles-pp.delay_tsc
>>>         4.89 =C2=B1  8%      -0.8        4.12 =C2=B1  8%  perf-profile.=
children.cycles-pp.__x64_sys_brk
>>>         2.48 =C2=B1 27%      -0.7        1.74 =C2=B1  4%  perf-profile.=
children.cycles-pp.flush_old_exec
>>>         3.02 =C2=B1 12%      -0.7        2.28 =C2=B1 12%  perf-profile.=
children.cycles-pp.unmap_page_range
>>>         3.15 =C2=B1 11%      -0.7        2.40 =C2=B1 12%  perf-profile.=
children.cycles-pp.unmap_vmas
>>>         2.25 =C2=B1 19%      -0.5        1.75 =C2=B1 11%  perf-profile.=
children.cycles-pp.unmap_region
>>>         1.27 =C2=B1 11%      -0.4        0.86 =C2=B1  8%  perf-profile.=
children.cycles-pp.vt_console_print
>>>         1.24 =C2=B1 12%      -0.4        0.85 =C2=B1  9%  perf-profile.=
children.cycles-pp.lf
>>>         1.24 =C2=B1 12%      -0.4        0.85 =C2=B1  9%  perf-profile.=
children.cycles-pp.con_scroll
>>>         1.24 =C2=B1 12%      -0.4        0.85 =C2=B1  9%  perf-profile.=
children.cycles-pp.fbcon_scroll
>>>         1.79 =C2=B1  9%      -0.4        1.41 =C2=B1  4%  perf-profile.=
children.cycles-pp.release_pages
>>>         1.22 =C2=B1 11%      -0.4        0.85 =C2=B1  9%  perf-profile.=
children.cycles-pp.fbcon_redraw
>>>         1.17 =C2=B1 12%      -0.4        0.82 =C2=B1 10%  perf-profile.=
children.cycles-pp.fbcon_putcs
>>>         1.16 =C2=B1 13%      -0.3        0.82 =C2=B1 10%  perf-profile.=
children.cycles-pp.bit_putcs
>>>         0.90 =C2=B1 16%      -0.3        0.62 =C2=B1 12%  perf-profile.=
children.cycles-pp.kill_pid_info
>>>         0.95 =C2=B1 10%      -0.3        0.68 =C2=B1  6%  perf-profile.=
children.cycles-pp.drm_fb_helper_cfb_imageblit
>>>         0.95 =C2=B1 11%      -0.3        0.68 =C2=B1  6%  perf-profile.=
children.cycles-pp.cfb_imageblit
>>>         1.24 =C2=B1  7%      -0.2        1.01 =C2=B1  6%  perf-profile.=
children.cycles-pp.new_sync_read
>>>         0.71 =C2=B1  4%      -0.2        0.49 =C2=B1 23%  perf-profile.=
children.cycles-pp.___perf_sw_event
>>>         0.55 =C2=B1 31%      -0.2        0.33 =C2=B1 16%  perf-profile.=
children.cycles-pp.unlink_anon_vmas
>>>         0.89 =C2=B1 11%      -0.2        0.67 =C2=B1 15%  perf-profile.=
children.cycles-pp.shmem_file_read_iter
>>>         0.60 =C2=B1 20%      -0.2        0.39 =C2=B1 20%  perf-profile.=
children.cycles-pp.__send_signal
>>>         1.06 =C2=B1  6%      -0.2        0.85 =C2=B1 16%  perf-profile.=
children.cycles-pp.pagevec_lru_move_fn
>>>         0.88            -0.2        0.68 =C2=B1  6%  perf-profile.child=
ren.cycles-pp.__perf_sw_event
>>>         1.49 =C2=B1  5%      -0.2        1.29 =C2=B1  7%  perf-profile.=
children.cycles-pp.prepare_exit_to_usermode
>>>         0.56 =C2=B1 12%      -0.2        0.37 =C2=B1 11%  perf-profile.=
children.cycles-pp.do_send_sig_info
>>>         1.65 =C2=B1  8%      -0.2        1.47 =C2=B1  4%  perf-profile.=
children.cycles-pp.perf_event_mmap
>>>         0.69 =C2=B1  2%      -0.2        0.52 =C2=B1 16%  perf-profile.=
children.cycles-pp.page_remove_rmap
>>>         0.61 =C2=B1  5%      -0.2        0.44 =C2=B1 15%  perf-profile.=
children.cycles-pp.free_unref_page_list
>>>         0.60 =C2=B1  6%      -0.2        0.43 =C2=B1 15%  perf-profile.=
children.cycles-pp.__vm_munmap
>>>         0.77 =C2=B1 12%      -0.2        0.62 =C2=B1 12%  perf-profile.=
children.cycles-pp.__might_sleep
>>>         0.39 =C2=B1 12%      -0.2        0.24 =C2=B1 18%  perf-profile.=
children.cycles-pp.time
>>>         0.46 =C2=B1 14%      -0.1        0.34 =C2=B1 14%  perf-profile.=
children.cycles-pp.lru_add_drain_cpu
>>>         0.57 =C2=B1  8%      -0.1        0.47 =C2=B1 14%  perf-profile.=
children.cycles-pp.shmem_undo_range
>>>         0.41 =C2=B1 12%      -0.1        0.30 =C2=B1 15%  perf-profile.=
children.cycles-pp.copy_fpstate_to_sigframe
>>>         0.76 =C2=B1  7%      -0.1        0.67 =C2=B1  8%  perf-profile.=
children.cycles-pp.__x64_sys_rt_sigreturn
>>>         0.26 =C2=B1 16%      -0.1        0.17 =C2=B1 17%  perf-profile.=
children.cycles-pp.mark_page_accessed
>>>         0.12 =C2=B1 47%      -0.1        0.04 =C2=B1103%  perf-profile.=
children.cycles-pp.sigaction
>>>         0.23 =C2=B1 12%      -0.1        0.15 =C2=B1 11%  perf-profile.=
children.cycles-pp.__vm_enough_memory
>>>         0.12 =C2=B1 18%      -0.1        0.05 =C2=B1106%  perf-profile.=
children.cycles-pp.__vsprintf_chk
>>>         0.23 =C2=B1 20%      -0.1        0.17 =C2=B1 13%  perf-profile.=
children.cycles-pp.d_add
>>>         0.13 =C2=B1 23%      -0.1        0.07 =C2=B1 58%  perf-profile.=
children.cycles-pp.fput_many
>>>         0.13 =C2=B1 14%      -0.1        0.08 =C2=B1 24%  perf-profile.=
children.cycles-pp.vfs_unlink
>>>         0.11 =C2=B1 20%      -0.0        0.07 =C2=B1  7%  perf-profile.=
children.cycles-pp.__update_load_avg_cfs_rq
>>>         0.04 =C2=B1 63%      +0.0        0.08 =C2=B1 23%  perf-profile.=
children.cycles-pp.uncharge_page
>>>         0.06 =C2=B1 22%      +0.0        0.10 =C2=B1 36%  perf-profile.=
children.cycles-pp.sched_exec
>>>         0.44 =C2=B1  4%      +0.0        0.48 =C2=B1  4%  perf-profile.=
children.cycles-pp.close
>>>         0.14 =C2=B1 22%      +0.1        0.21 =C2=B1 17%  perf-profile.=
children.cycles-pp.pick_next_task_fair
>>>         0.10 =C2=B1 17%      +0.1        0.17 =C2=B1 23%  perf-profile.=
children.cycles-pp.__anon_vma_prepare
>>>         0.00            +0.1        0.07 =C2=B1 24%  perf-profile.child=
ren.cycles-pp.update_sd_lb_stats
>>>         0.07 =C2=B1 34%      +0.1        0.15 =C2=B1 42%  perf-profile.=
children.cycles-pp.file_free_rcu
>>>         0.15 =C2=B1 27%      +0.1        0.23 =C2=B1 21%  perf-profile.=
children.cycles-pp.__strcasecmp
>>>         0.20 =C2=B1 21%      +0.1        0.29 =C2=B1  8%  perf-profile.=
children.cycles-pp.__pte_alloc
>>>         0.14 =C2=B1 47%      +0.1        0.23 =C2=B1 27%  perf-profile.=
children.cycles-pp.update_blocked_averages
>>>         0.09 =C2=B1 44%      +0.1        0.19 =C2=B1 18%  perf-profile.=
children.cycles-pp.schedule_idle
>>>         0.00            +0.1        0.10 =C2=B1 33%  perf-profile.child=
ren.cycles-pp.newidle_balance
>>>         0.00            +0.1        0.10 =C2=B1 18%  perf-profile.child=
ren.cycles-pp.__vmalloc_node_range
>>>         0.21 =C2=B1 15%      +0.1        0.32 =C2=B1 25%  perf-profile.=
children.cycles-pp.__wake_up_common
>>>         0.63 =C2=B1  8%      +0.1        0.77 =C2=B1  6%  perf-profile.=
children.cycles-pp.rcu_do_batch
>>>         0.76 =C2=B1 14%      +0.1        0.90 =C2=B1  9%  perf-profile.=
children.cycles-pp.rcu_core
>>>         0.07 =C2=B1 90%      +0.2        0.27 =C2=B1109%  perf-profile.=
children.cycles-pp.security_mmap_addr
>>>         0.46 =C2=B1 26%      +0.3        0.75 =C2=B1 13%  perf-profile.=
children.cycles-pp.__sched_text_start
>>>        11.32 =C2=B1  9%      +7.7       19.05 =C2=B1  8%  perf-profile.=
children.cycles-pp.start_secondary
>>>        11.03 =C2=B1  5%      +8.1       19.16 =C2=B1  7%  perf-profile.=
children.cycles-pp.intel_idle
>>>        14.78 =C2=B1  6%      +8.5       23.24 =C2=B1  8%  perf-profile.=
children.cycles-pp.cpuidle_enter
>>>        14.76 =C2=B1  6%      +8.5       23.24 =C2=B1  8%  perf-profile.=
children.cycles-pp.cpuidle_enter_state
>>>        16.04 =C2=B1  6%      +9.1       25.17 =C2=B1  8%  perf-profile.=
children.cycles-pp.secondary_startup_64
>>>        16.04 =C2=B1  6%      +9.1       25.17 =C2=B1  8%  perf-profile.=
children.cycles-pp.cpu_startup_entry
>>>        16.04 =C2=B1  6%      +9.1       25.19 =C2=B1  8%  perf-profile.=
children.cycles-pp.do_idle
>>>         5.79 =C2=B1 16%      -1.6        4.21 =C2=B1  6%  perf-profile.=
self.cycles-pp.io_serial_in
>>>         2.62 =C2=B1 17%      -0.8        1.85        perf-profile.self.=
cycles-pp.delay_tsc
>>>         5.11 =C2=B1  4%      -0.6        4.56 =C2=B1  5%  perf-profile.=
self.cycles-pp.do_syscall_64
>>>         1.44 =C2=B1  6%      -0.3        1.15 =C2=B1  5%  perf-profile.=
self.cycles-pp.unmap_page_range
>>>         0.94 =C2=B1 11%      -0.3        0.68 =C2=B1  6%  perf-profile.=
self.cycles-pp.cfb_imageblit
>>>         0.65 =C2=B1  6%      -0.2        0.42 =C2=B1 23%  perf-profile.=
self.cycles-pp.___perf_sw_event
>>>         1.42 =C2=B1  5%      -0.2        1.22 =C2=B1  7%  perf-profile.=
self.cycles-pp.prepare_exit_to_usermode
>>>         0.65 =C2=B1 13%      -0.2        0.47 =C2=B1  9%  perf-profile.=
self.cycles-pp.do_page_fault
>>>         0.65 =C2=B1  9%      -0.1        0.52 =C2=B1  5%  perf-profile.=
self.cycles-pp.release_pages
>>>         0.24 =C2=B1 20%      -0.1        0.15 =C2=B1 16%  perf-profile.=
self.cycles-pp.mark_page_accessed
>>>         0.16 =C2=B1 28%      -0.1        0.08 =C2=B1 69%  perf-profile.=
self.cycles-pp.free_unref_page_commit
>>>         0.12 =C2=B1 24%      -0.1        0.04 =C2=B1 59%  perf-profile.=
self.cycles-pp.__do_munmap
>>>         0.10 =C2=B1 24%      -0.0        0.06 =C2=B1  7%  perf-profile.=
self.cycles-pp.__update_load_avg_cfs_rq
>>>         0.04 =C2=B1 57%      +0.0        0.07 =C2=B1 19%  perf-profile.=
self.cycles-pp.__sbrk
>>>         0.04 =C2=B1 57%      +0.0        0.08 =C2=B1 23%  perf-profile.=
self.cycles-pp.update_load_avg
>>>         0.04 =C2=B1 57%      +0.0        0.08 =C2=B1 23%  perf-profile.=
self.cycles-pp.uncharge_page
>>>         0.26 =C2=B1 11%      +0.1        0.39 =C2=B1 12%  perf-profile.=
self.cycles-pp.copy_page
>>>         0.49 =C2=B1 13%      +0.1        0.63 =C2=B1 13%  perf-profile.=
self.cycles-pp.get_page_from_freelist
>>>        11.00 =C2=B1  5%      +8.1       19.14 =C2=B1  7%  perf-profile.=
self.cycles-pp.intel_idle
>>>
>>>
>>>                                reaim.time.system_time
>>>     90 +---------------------------------------------------------------=
-------+
>>>        |           +.   .+       ++.++                               .+=
       |
>>>     88 |+.+ +.++. +  +++  ++.++.+     +.++.+++.+++.+++. +.++ .+     +  =
:.+++.+|
>>>        |   +     +                                     +    +  ++.++   =
+      |
>>>     86 |-+                                                             =
       |
>>>        |                                                               =
       |
>>>     84 |-+                                                             =
       |
>>>        |                                                               =
       |
>>>     82 |-+  O                                                          =
       |
>>>        |O OO  OO O                                                     =
       |
>>>     80 |-+                                                             =
       |
>>>        |          OO OOO  O   O  O  O                                  =
       |
>>>     78 |-+               O O O  O O  OO  O                             =
       |
>>>        |                                O  OOO O                       =
       |
>>>     76 +---------------------------------------------------------------=
-------+
>>>                         reaim.time.percent_of_cpu_this_job_got
>>>       55 +-------------------------------------------------------------=
-------+
>>>          |                                                             =
       |
>>>     54.5 |-+                                                           =
       |
>>>       54 |-+                                                           =
       |
>>>          |                                                             =
       |
>>>     53.5 |-+                                                           =
       |
>>>          |                                                             =
       |
>>>       53 |-+OOO OOO                                                    =
       |
>>>          |                                                             =
       |
>>>     52.5 |-+                                                           =
       |
>>>       52 |O+        OOO OOO OOO OOO OO                                 =
       |
>>>          |                                                             =
       |
>>>     51.5 |-+                                                           =
       |
>>>          |                                                             =
       |
>>>       51 +-------------------------------------------------------------=
-------+
>>>                                     reaim.parent_time
>>>     0.405 +------------------------------------------------------------=
-------+
>>>       0.4 |-+                           O                              =
       |
>>>           |                            O O OOO OO                      =
       |
>>>     0.395 |-+                                                          =
       |
>>>      0.39 |-+                                                          =
       |
>>>     0.385 |-+    OOOO OOO OOO OOO OOOO                                 =
       |
>>>      0.38 |O+OOO                                                       =
       |
>>>           |                                                            =
       |
>>>     0.375 |-+                                                          =
       |
>>>      0.37 |-+                                                          =
       |
>>>     0.365 |-+                                                          =
       |
>>>      0.36 |-+                                                          =
       |
>>>           |             +.            .+ +.   .+ +.   +       +.     ++=
+. + .+|
>>>     0.355 |+.  +.+ ++.++  +++. ++.++++  +  +++  +  +++ + ++.++  + +. : =
  + +  |
>>>      0.35 +------------------------------------------------------------=
-------+
>>>                                   reaim.child_systime
>>>     0.69 +-------------------------------------------------------------=
-------+
>>>          |    +.+    ++. ++.+  .++      ++   +++.+  .++ .+++. +     .+ =
:  + .+|
>>>     0.68 |+.++   ++.+   +    ++           +.+     ++   +     + +.+++   =
+.+ +  |
>>>     0.67 |-+                                                           =
       |
>>>          |                                                             =
       |
>>>     0.66 |-+                                                           =
       |
>>>     0.65 |-+                                                           =
       |
>>>          |    O                                                        =
       |
>>>     0.64 |O+O   OOO                                                    =
       |
>>>     0.63 |-+ O                                                         =
       |
>>>          |          O   O       O O  O                                 =
       |
>>>     0.62 |-+         OO  O  O    O  O   O                              =
       |
>>>     0.61 |-+              O  OO       O  OO OOOO                       =
       |
>>>          |                                                             =
       |
>>>      0.6 +-------------------------------------------------------------=
-------+
>>>                                    reaim.jobs_per_min
>>>     69000 +------------------------------------------------------------=
-------+
>>>     68000 |-.++   +        + .++ .+                    .++   + .+++.+  =
       |
>>>           |+   +.+ ++.+++.+ +   +  +++.+++.+++.+++.++++   +.+ +      + =
+.+ +. |
>>>     67000 |-+                                                         +=
   +  +|
>>>     66000 |-+                                                          =
       |
>>>           |                                                            =
       |
>>>     65000 |-+                                                          =
       |
>>>     64000 |-+                                                          =
       |
>>>     63000 |-+                                                          =
       |
>>>           |O OOO O O      O O                                          =
       |
>>>     62000 |-+     O O OOO  O  OOO OOOO                                 =
       |
>>>     61000 |-+                                                          =
       |
>>>           |                              O OOO OO                      =
       |
>>>     60000 |-+                          OO                              =
       |
>>>     59000 +------------------------------------------------------------=
-------+
>>>                                 reaim.jobs_per_min_child
>>>     17500 +------------------------------------------------------------=
-------+
>>>           |                                                            =
       |
>>>     17000 |-.+++. +        + .+++.+                    .++   + .+++.+  =
       |
>>>           |+     + ++.+++.+ +      +++.+++.+++.+++.++++   +.+ +      + =
+.+++.+|
>>>           |                                                           +=
       |
>>>     16500 |-+                                                          =
       |
>>>           |                                                            =
       |
>>>     16000 |-+                                                          =
       |
>>>           |                                                            =
       |
>>>     15500 |O+OOO OOOO OOO OOO OOO OOOO                                 =
       |
>>>           |                                                            =
       |
>>>           |                                O O OO                      =
       |
>>>     15000 |-+                          OOO  O                          =
       |
>>>           |                                                            =
       |
>>>     14500 +------------------------------------------------------------=
-------+
>>>                                  reaim.max_jobs_per_min
>>>     76000 +------------------------------------------------------------=
-------+
>>>           |                                                            =
       |
>>>     74000 |-+  +                                                 +  +  =
       |
>>>           |    ::                                                : ::  =
       |
>>>           |   : :                                               : :: : =
       |
>>>     72000 |+.++  ++++.+++.+++.+++.++++.+++.+++.+++.++++.+++.+++.+ +  ++=
+.+++.+|
>>>           |                                                            =
       |
>>>     70000 |-+                                                          =
       |
>>>           |                                                            =
       |
>>>     68000 |-+ O                                                        =
       |
>>>           |                                                            =
       |
>>>           |                                                            =
       |
>>>     66000 |O+O O OOOO OOO OOO OOO OOOO                                 =
       |
>>>           |                                                            =
       |
>>>     64000 +------------------------------------------------------------=
-------+
>>> [*] bisect-good sample
>>> [O] bisect-bad  sample
>>>
>>>
>>>
>>> Disclaimer:
>>> Results have been estimated based on internal Intel analysis and are pr=
ovided
>>> for informational purposes only. Any difference in system hardware or s=
oftware
>>> design or configuration may affect actual performance.
>>>
>>>
>>> Thanks,
>>> Rong Chen
>>>
>>>
>>> _______________________________________________
>>> LKP mailing list -- lkp(a)lists.01.org
>>> To unsubscribe send an email to lkp-leave(a)lists.01.org
>>>
>>
>> -- =

>> Zhengjun Xing

-- =

Zhengjun Xing
--===============1213514727314617163==--

