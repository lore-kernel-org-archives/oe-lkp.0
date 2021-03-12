Content-Type: multipart/mixed; boundary="===============8881749428157790408=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 322b5a8117: netperf.Throughput_tps -84.0% regression
Date: Fri, 12 Mar 2021 23:15:54 +0800
Message-ID: <51bea026-276d-bc0b-0d5f-bf7a82660f54@linux.intel.com>
In-Reply-To: <bf4d38e2-7246-a88e-f19a-1d7d11baeca9@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8881749428157790408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021/3/11 12:08, Li, Aubrey wrote:
> On 2021/3/11 10:58, kernel test robot wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -84.0% regression of netperf.Throughput_tps due to com=
mit:
>>
>>
>> commit: 322b5a81171d432c59b5c6dcf0229d92acf0d9c2 ("[PATCH v9 2/2] sched/=
fair: Remove SIS_PROP")
>> url: https://github.com/0day-ci/linux/commits/Aubrey-Li/sched-fair-selec=
t-idle-cpu-from-idle-cpumask-for-task-wakeup/20210310-100644
>> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 4117cebf1=
a9fcbf35b9aabf0e37b6c5eea296798
>>
>> in testcase: netperf
>> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GH=
z with 192G memory
>> with following parameters:
>>
>> 	ip: ipv4
>> 	runtime: 300s
>> 	nr_threads: 200%
> =

> Thanks for the report, this patch removed time clock read and scan cost c=
omputation, especially
> for 200% case, the task wakeup latency should be significantly reduced. L=
et me try to replicate
> and understand.
>

Okay, this is replicatable, for example, running 384 netperf processes in
TCP_RR mode on a 192 CPUs system. If I understood correctly, this place
is more sensitive than I expected.

- First of all, when time clock and scan computation is removed, task
wakeup path becomes much faster than before, so that the CPUs got the
chance to enter idle, and hence the system idle time increased.

>>   1.91e+08 =C2=B1 26%   +3587.1%  7.042e+09        cpuidle.C1.time
>>   25239057 =C2=B1 16%   +1634.0%  4.376e+08 =C2=B1  2%  cpuidle.C1.usage
>>    1373740 =C2=B1 13%   +1123.6%   16808508 =C2=B1 12%  cpuidle.C1E.usage
>>   19356693 =C2=B1 18%    +186.0%   55355728 =C2=B1 30%  cpuidle.POLL.time
>>      17.59 =C2=B1  4%      +7.3       24.87        mpstat.cpu.all.idle%
>>      53.63           -19.7       33.94        mpstat.cpu.all.sys%
>>       3.93            -2.5        1.42 =C2=B1  7%  mpstat.cpu.all.usr%
>>       1.33 =C2=B1 35%    +950.0%      14.00        vmstat.cpu.id

- what really bad is, the rq lock contention btween schedule_idle() and
try_to_wake_up().

>>       0.00            +6.6        6.60        perf-profile.calltrace.cyc=
les-
pp.native_queued_spin_lock_slowpath._raw_spin_lock.__schedule.schedule_idle=
.do_idle
>>       0.00           +17.5       17.49        perf-profile.calltrace.cyc=
les-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.__wak=
e_up_common.__wake_up_common_lock

I confirmed this by lockstat

- without this patch
 =

	class name    con-bounces    contentions
	----------------------------------------
	&rq->lock:         24764          24768
	---------
	&rq->lock          17027          [<00000000c0692a2b>] try_to_wake_up+0x4b=
7/0x570
	&rq->lock           7423          [<000000003417dc74>] __schedule+0xad/0x7=
50
	---------
	&rq->lock          21459          [<00000000c0692a2b>] try_to_wake_up+0x4b=
7/0x570
	&rq->lock           2894          [<000000003417dc74>] __schedule+0xad/0x7=
50

- with this patch

	class name    con-bounces    contentions
	----------------------------------------
	&rq->lock:       3237291        3237516
	---------
	&rq->lock         933672          [<00000000bf9a57c5>] __schedule+0xad/0x7=
50
	&rq->lock        2297216          [<0000000082f2f7f6>] try_to_wake_up+0x4b=
7/0x570
	---------
	&rq->lock        3154981          [<0000000082f2f7f6>] try_to_wake_up+0x4b=
7/0x570
	&rq->lock          64201          [<00000000bf9a57c5>] __schedule+0xad/0x7=
50

It looks like this patch changed the timing sequence of this extreme
case. I'm not sure if this patch did anything wrong, but I admit it
caused a significant regression.

I think I need to drop this patch, any suggestions are highly appreciated.

Thanks,
-Aubrey

> =

>> 	cluster: cs-localhost
>> 	test: TCP_RR
>> 	cpufreq_governor: performance
>> 	ucode: 0x5003006
>>
>> test-description: Netperf is a benchmark that can be use to measure vari=
ous aspect of networking performance.
>> test-url: http://www.netperf.org/netperf/
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp install                job.yaml  # job file is attached =
in this email
>>         bin/lkp split-job --compatible job.yaml
>>         bin/lkp run                    compatible-job.yaml
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/t=
box_group/test/testcase/ucode:
>>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/200%/debian-10.4-x=
86_64-20200603.cgz/300s/lkp-csl-2ap4/TCP_RR/netperf/0x5003006
>>
>> commit: =

>>   ca52510778 ("sched/fair: select idle cpu from idle cpumask for task wa=
keup")
>>   322b5a8117 ("sched/fair: Remove SIS_PROP")
>>
>> ca52510778e4c6e5 322b5a81171d432c59b5c6dcf02 =

>> ---------------- --------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>   13817913           -84.0%    2208427 =C2=B1  3%  netperf.Throughput_to=
tal_tps
>>      35984           -84.0%       5751 =C2=B1  3%  netperf.Throughput_tps
>>  2.129e+09 =C2=B1  8%     -99.1%   20142981 =C2=B1 41%  netperf.time.inv=
oluntary_context_switches
>>     107905           +19.9%     129367        netperf.time.minor_page_fa=
ults
>>       6660           -54.6%       3023        netperf.time.percent_of_cp=
u_this_job_got
>>      18970 =C2=B1  2%     -53.4%       8849        netperf.time.system_t=
ime
>>       1306           -76.9%     301.26 =C2=B1  9%  netperf.time.user_time
>>  2.016e+09 =C2=B1  7%     -68.3%  6.394e+08 =C2=B1  2%  netperf.time.vol=
untary_context_switches
>>  4.145e+09           -84.0%  6.625e+08 =C2=B1  3%  netperf.workload
>>       7442 =C2=B1  5%     +74.6%      12995 =C2=B1  2%  uptime.idle
>>   1.91e+08 =C2=B1 26%   +3587.1%  7.042e+09        cpuidle.C1.time
>>   25239057 =C2=B1 16%   +1634.0%  4.376e+08 =C2=B1  2%  cpuidle.C1.usage
>>    1373740 =C2=B1 13%   +1123.6%   16808508 =C2=B1 12%  cpuidle.C1E.usage
>>   19356693 =C2=B1 18%    +186.0%   55355728 =C2=B1 30%  cpuidle.POLL.time
>>     206522 =C2=B1103%   +1248.1%    2784046 =C2=B1 23%  numa-numastat.no=
de0.local_node
>>     283690 =C2=B1 76%    +899.8%    2836469 =C2=B1 23%  numa-numastat.no=
de0.numa_hit
>>     699972 =C2=B1 15%     +78.4%    1248418 =C2=B1 49%  numa-numastat.no=
de3.local_node
>>     755619 =C2=B1 15%     +74.8%    1320493 =C2=B1 45%  numa-numastat.no=
de3.numa_hit
>>      17.59 =C2=B1  4%      +7.3       24.87        mpstat.cpu.all.idle%
>>       0.90            +0.5        1.37 =C2=B1  4%  mpstat.cpu.all.irq%
>>      23.95           +14.4       38.40        mpstat.cpu.all.soft%
>>      53.63           -19.7       33.94        mpstat.cpu.all.sys%
>>       3.93            -2.5        1.42 =C2=B1  7%  mpstat.cpu.all.usr%
>>       1.33 =C2=B1 35%    +950.0%      14.00        vmstat.cpu.id
>>      93.00            -9.7%      84.00        vmstat.cpu.sy
>>    3378802 =C2=B1  9%    +143.8%    8238004        vmstat.memory.cache
>>     477.50           -14.4%     408.83        vmstat.procs.r
>>   27106400           -78.2%    5898538 =C2=B1  3%  vmstat.system.cs
>>    3232783 =C2=B1 10%    +149.3%    8058169        meminfo.Cached
>>    3008249 =C2=B1 11%    +161.2%    7856377        meminfo.Committed_AS
>>    2213694 =C2=B1 23%    +232.2%    7354700        meminfo.Inactive
>>    2213694 =C2=B1 23%    +232.2%    7354700        meminfo.Inactive(anon)
>>     909222 =C2=B1 25%    +178.8%    2534646        meminfo.Mapped
>>    6034546 =C2=B1  6%     +80.9%   10914745        meminfo.Memused
>>    2263228 =C2=B1 14%    +213.2%    7088623        meminfo.Shmem
>>    6316722 =C2=B1  4%     +76.3%   11134561        meminfo.max_used_kB
>>     959.50 =C2=B1  8%     -17.7%     789.83 =C2=B1  6%  slabinfo.mnt_cac=
he.active_objs
>>     959.50 =C2=B1  8%     -17.7%     789.83 =C2=B1  6%  slabinfo.mnt_cac=
he.num_objs
>>      30561 =C2=B1  4%     +62.4%      49631        slabinfo.radix_tree_n=
ode.active_objs
>>     545.33 =C2=B1  4%     +62.4%     885.83        slabinfo.radix_tree_n=
ode.active_slabs
>>      30561 =C2=B1  4%     +62.4%      49631        slabinfo.radix_tree_n=
ode.num_objs
>>     545.33 =C2=B1  4%     +62.4%     885.83        slabinfo.radix_tree_n=
ode.num_slabs
>>       1525 =C2=B1  8%     -13.0%       1327 =C2=B1  8%  slabinfo.task_gr=
oup.active_objs
>>       1525 =C2=B1  8%     -13.0%       1327 =C2=B1  8%  slabinfo.task_gr=
oup.num_objs
>>       2193 =C2=B1 62%    +287.7%       8502 =C2=B1 29%  numa-meminfo.nod=
e0.Active
>>       2193 =C2=B1 62%    +287.7%       8502 =C2=B1 29%  numa-meminfo.nod=
e0.Active(anon)
>>     260184 =C2=B1  7%   +1476.3%    4101372 =C2=B1 21%  numa-meminfo.nod=
e0.FilePages
>>     155797 =C2=B1 49%   +2472.0%    4007098 =C2=B1 23%  numa-meminfo.nod=
e0.Inactive
>>     155797 =C2=B1 49%   +2472.0%    4007098 =C2=B1 23%  numa-meminfo.nod=
e0.Inactive(anon)
>>      78745 =C2=B1 16%   +1791.3%    1489348 =C2=B1 11%  numa-meminfo.nod=
e0.Mapped
>>    1037565 =C2=B1  7%    +374.3%    4921173 =C2=B1 20%  numa-meminfo.nod=
e0.MemUsed
>>       8462 =C2=B1 57%  +45383.3%    3848873 =C2=B1 22%  numa-meminfo.nod=
e0.Shmem
>>     887567 =C2=B1  6%    +107.4%    1840670 =C2=B1 31%  numa-meminfo.nod=
e3.FilePages
>>     490746 =C2=B1 23%    +208.5%    1513789 =C2=B1 38%  numa-meminfo.nod=
e3.Inactive
>>     490746 =C2=B1 23%    +208.5%    1513789 =C2=B1 38%  numa-meminfo.nod=
e3.Inactive(anon)
>>     316259 =C2=B1 17%    +141.6%     764021 =C2=B1 10%  numa-meminfo.nod=
e3.Mapped
>>    1557192 =C2=B1  6%     +60.9%    2506075 =C2=B1 23%  numa-meminfo.nod=
e3.MemUsed
>>     643128 =C2=B1  9%    +150.1%    1608493 =C2=B1 36%  numa-meminfo.nod=
e3.Shmem
>>     549.33 =C2=B1 63%    +287.3%       2127 =C2=B1 29%  numa-vmstat.node=
0.nr_active_anon
>>      65046 =C2=B1  7%   +1479.4%    1027316 =C2=B1 21%  numa-vmstat.node=
0.nr_file_pages
>>      38946 =C2=B1 49%   +2477.3%    1003758 =C2=B1 23%  numa-vmstat.node=
0.nr_inactive_anon
>>      19771 =C2=B1 16%   +1791.7%     374017 =C2=B1 11%  numa-vmstat.node=
0.nr_mapped
>>       2115 =C2=B1 57%  +45473.9%     964192 =C2=B1 22%  numa-vmstat.node=
0.nr_shmem
>>     549.33 =C2=B1 63%    +287.3%       2127 =C2=B1 29%  numa-vmstat.node=
0.nr_zone_active_anon
>>      38946 =C2=B1 49%   +2477.3%    1003757 =C2=B1 23%  numa-vmstat.node=
0.nr_zone_inactive_anon
>>     717998 =C2=B1 18%    +143.8%    1750758 =C2=B1 21%  numa-vmstat.node=
0.numa_hit
>>     616749 =C2=B1 22%    +173.4%    1686107 =C2=B1 22%  numa-vmstat.node=
0.numa_local
>>     221911 =C2=B1  6%    +107.7%     460942 =C2=B1 31%  numa-vmstat.node=
3.nr_file_pages
>>     122508 =C2=B1 23%    +209.5%     379175 =C2=B1 38%  numa-vmstat.node=
3.nr_inactive_anon
>>      78890 =C2=B1 17%    +142.6%     191411 =C2=B1 10%  numa-vmstat.node=
3.nr_mapped
>>     160801 =C2=B1  9%    +150.6%     402898 =C2=B1 36%  numa-vmstat.node=
3.nr_shmem
>>     122507 =C2=B1 23%    +209.5%     379174 =C2=B1 38%  numa-vmstat.node=
3.nr_zone_inactive_anon
>>     111333            +4.6%     116424        proc-vmstat.nr_anon_pages
>>    4766626            -2.6%    4644729        proc-vmstat.nr_dirty_backg=
round_threshold
>>    9544909            -2.6%    9300815        proc-vmstat.nr_dirty_thres=
hold
>>     809456 =C2=B1 10%    +149.1%    2016338        proc-vmstat.nr_file_p=
ages
>>   47919019            -2.5%   46698243        proc-vmstat.nr_free_pages
>>     554049 =C2=B1 23%    +232.2%    1840432        proc-vmstat.nr_inacti=
ve_anon
>>     227517 =C2=B1 25%    +179.5%     635910        proc-vmstat.nr_mapped
>>       8267 =C2=B1  3%     +10.8%       9162 =C2=B1  3%  proc-vmstat.nr_p=
age_table_pages
>>     567067 =C2=B1 14%    +212.8%    1773952        proc-vmstat.nr_shmem
>>      33641            +7.9%      36304        proc-vmstat.nr_slab_reclai=
mable
>>     554049 =C2=B1 23%    +232.2%    1840432        proc-vmstat.nr_zone_i=
nactive_anon
>>     316039 =C2=B1 12%    +215.1%     995881 =C2=B1  6%  proc-vmstat.numa=
_hint_faults
>>     148817 =C2=B1 15%    +361.5%     686842 =C2=B1  8%  proc-vmstat.numa=
_hint_faults_local
>>    2728417 =C2=B1  7%    +117.3%    5929219        proc-vmstat.numa_hit
>>    2468898 =C2=B1  8%    +129.6%    5669750        proc-vmstat.numa_local
>>     640372 =C2=B1  8%    +103.8%    1305080 =C2=B1  4%  proc-vmstat.numa=
_pte_updates
>>    2852513 =C2=B1  7%    +112.4%    6057608        proc-vmstat.pgalloc_n=
ormal
>>    1894166 =C2=B1  2%     +44.9%    2745142 =C2=B1  2%  proc-vmstat.pgfa=
ult
>>      71009            -6.2%      66609        proc-vmstat.pgreuse
>>    1669483 =C2=B1223%    +547.5%   10809999 =C2=B1  9%  sched_debug.cfs_=
rq:/.MIN_vruntime.max
>>       1033 =C2=B1 33%    -100.0%       0.00        sched_debug.cfs_rq:/.=
load.min
>>       1.31 =C2=B1 38%     -55.3%       0.58 =C2=B1 35%  sched_debug.cfs_=
rq:/.load_avg.min
>>    1669483 =C2=B1223%    +547.5%   10809999 =C2=B1  9%  sched_debug.cfs_=
rq:/.max_vruntime.max
>>   21407196           -56.9%    9226871        sched_debug.cfs_rq:/.min_v=
runtime.avg
>>   29210953 =C2=B1  3%     -40.8%   17282658 =C2=B1  4%  sched_debug.cfs_=
rq:/.min_vruntime.max
>>   15709396 =C2=B1  4%     -44.5%    8715788        sched_debug.cfs_rq:/.=
min_vruntime.min
>>    3823741 =C2=B1 22%     -78.3%     828290 =C2=B1 12%  sched_debug.cfs_=
rq:/.min_vruntime.stddev
>>       0.83 =C2=B1  2%     -10.8%       0.74        sched_debug.cfs_rq:/.=
nr_running.avg
>>       0.81 =C2=B1  7%    -100.0%       0.00        sched_debug.cfs_rq:/.=
nr_running.min
>>       0.05 =C2=B1 61%    +472.8%       0.31 =C2=B1  3%  sched_debug.cfs_=
rq:/.nr_running.stddev
>>       1955 =C2=B1  5%     -13.4%       1693        sched_debug.cfs_rq:/.=
runnable_avg.avg
>>       3248 =C2=B1 10%     +23.1%       3997 =C2=B1  3%  sched_debug.cfs_=
rq:/.runnable_avg.max
>>     930.19 =C2=B1 12%     -22.0%     725.50 =C2=B1  2%  sched_debug.cfs_=
rq:/.runnable_avg.min
>>    3821269 =C2=B1 22%     -78.3%     828506 =C2=B1 12%  sched_debug.cfs_=
rq:/.spread0.stddev
>>     851.17 =C2=B1  3%     -44.5%     472.16        sched_debug.cfs_rq:/.=
util_avg.avg
>>       1259 =C2=B1  8%     -22.2%     979.56        sched_debug.cfs_rq:/.=
util_avg.max
>>     579.78 =C2=B1 14%     -31.1%     399.75 =C2=B1  4%  sched_debug.cfs_=
rq:/.util_avg.min
>>     570.92 =C2=B1  3%     -96.0%      23.10 =C2=B1  5%  sched_debug.cfs_=
rq:/.util_est_enqueued.avg
>>       1310 =C2=B1 13%     -61.6%     503.33 =C2=B1 10%  sched_debug.cfs_=
rq:/.util_est_enqueued.max
>>     156.42 =C2=B1 22%    -100.0%       0.00        sched_debug.cfs_rq:/.=
util_est_enqueued.min
>>     184.06 =C2=B1  4%     -74.4%      47.15 =C2=B1  9%  sched_debug.cfs_=
rq:/.util_est_enqueued.stddev
>>       5060 =C2=B1 14%     +66.2%       8409 =C2=B1  2%  sched_debug.cpu.=
avg_idle.min
>>      82.09 =C2=B1  9%     -67.5%      26.69 =C2=B1  3%  sched_debug.cpu.=
clock.stddev
>>     146203           -18.0%     119880        sched_debug.cpu.clock_task=
.avg
>>     148209           -13.6%     128111        sched_debug.cpu.clock_task=
.max
>>     137947           -18.6%     112301        sched_debug.cpu.clock_task=
.min
>>     891.38 =C2=B1  4%     +72.6%       1538 =C2=B1 25%  sched_debug.cpu.=
clock_task.stddev
>>       3530           -21.3%       2777        sched_debug.cpu.curr->pid.=
avg
>>       2591 =C2=B1 20%    -100.0%       0.00        sched_debug.cpu.curr-=
>pid.min
>>     602.41 =C2=B1 18%    +173.6%       1648        sched_debug.cpu.curr-=
>pid.stddev
>>       5317 =C2=B1 61%    +202.3%      16071 =C2=B1 74%  sched_debug.cpu.=
max_idle_balance_cost.stddev
>>       0.00 =C2=B1 36%     -69.7%       0.00        sched_debug.cpu.next_=
balance.stddev
>>       2.09 =C2=B1  4%     -13.8%       1.80 =C2=B1  4%  sched_debug.cpu.=
nr_running.avg
>>       3.69 =C2=B1  9%    +151.1%       9.28 =C2=B1  4%  sched_debug.cpu.=
nr_running.max
>>       0.81 =C2=B1  7%    -100.0%       0.00        sched_debug.cpu.nr_ru=
nning.min
>>       0.64 =C2=B1  6%    +153.7%       1.63 =C2=B1  4%  sched_debug.cpu.=
nr_running.stddev
>>   21529949           -77.9%    4767019 =C2=B1  4%  sched_debug.cpu.nr_sw=
itches.avg
>>   22891153           -75.9%    5506756 =C2=B1 10%  sched_debug.cpu.nr_sw=
itches.max
>>   19927966           -80.4%    3915549 =C2=B1  5%  sched_debug.cpu.nr_sw=
itches.min
>>    4140603           -50.0%    2070075        sched_debug.sysctl_sched.s=
ysctl_sched_features
>>       2.22 =C2=B1 10%    +979.8%      23.94        perf-stat.i.MPKI
>>  8.071e+10           -74.8%  2.031e+10 =C2=B1  2%  perf-stat.i.branch-in=
structions
>>       1.49            +0.2        1.66        perf-stat.i.branch-miss-ra=
te%
>>  1.186e+09           -72.8%  3.221e+08 =C2=B1  2%  perf-stat.i.branch-mi=
sses
>>      22.12 =C2=B1  9%     -20.5        1.58 =C2=B1  5%  perf-stat.i.cach=
e-miss-rate%
>>  1.804e+08 =C2=B1 14%     -81.1%   34036288 =C2=B1  6%  perf-stat.i.cach=
e-misses
>>  8.328e+08 =C2=B1  9%    +167.1%  2.225e+09        perf-stat.i.cache-ref=
erences
>>   27354194           -78.4%    5919450 =C2=B1  3%  perf-stat.i.context-s=
witches
>>       1.41          +298.3%       5.62 =C2=B1  2%  perf-stat.i.cpi
>>  5.572e+11            -6.3%  5.222e+11        perf-stat.i.cpu-cycles
>>      24621 =C2=B1 51%  +12292.4%    3051146 =C2=B1  2%  perf-stat.i.cpu-=
migrations
>>       3286 =C2=B1 12%    +397.7%      16355 =C2=B1  7%  perf-stat.i.cycl=
es-between-cache-misses
>>       0.03 =C2=B1 22%      +0.2        0.26 =C2=B1  5%  perf-stat.i.dTLB=
-load-miss-rate%
>>   29759619 =C2=B1 21%    +134.0%   69633082 =C2=B1  5%  perf-stat.i.dTLB=
-load-misses
>>  1.193e+11           -76.6%  2.789e+10 =C2=B1  2%  perf-stat.i.dTLB-loads
>>       0.01 =C2=B1 22%      +0.1        0.08 =C2=B1  5%  perf-stat.i.dTLB=
-store-miss-rate%
>>    5015493 =C2=B1 21%    +104.6%   10261112 =C2=B1  4%  perf-stat.i.dTLB=
-store-misses
>>  6.778e+10           -78.9%  1.433e+10 =C2=B1  2%  perf-stat.i.dTLB-stor=
es
>>      69.23            -6.7       62.58        perf-stat.i.iTLB-load-miss=
-rate%
>>  7.013e+08           -78.2%  1.526e+08 =C2=B1  3%  perf-stat.i.iTLB-load=
-misses
>>  3.103e+08           -70.9%   90260578 =C2=B1  2%  perf-stat.i.iTLB-loads
>>  4.001e+11           -75.4%  9.836e+10 =C2=B1  2%  perf-stat.i.instructi=
ons
>>     587.02           +10.6%     649.42        perf-stat.i.instructions-p=
er-iTLB-miss
>>       0.72           -73.4%       0.19 =C2=B1  2%  perf-stat.i.ipc
>>       2.90            -6.3%       2.72        perf-stat.i.metric.GHz
>>       0.18 =C2=B1 12%     +77.0%       0.31 =C2=B1 13%  perf-stat.i.metr=
ic.K/sec
>>       1401           -75.9%     337.91 =C2=B1  2%  perf-stat.i.metric.M/=
sec
>>       6086 =C2=B1  2%     +45.2%       8834 =C2=B1  2%  perf-stat.i.mino=
r-faults
>>   41400698 =C2=B1 15%     -74.0%   10763215 =C2=B1  6%  perf-stat.i.node=
-load-misses
>>    5852508 =C2=B1  8%     -69.1%    1808560 =C2=B1  4%  perf-stat.i.node=
-loads
>>      99.07            -5.1       94.00        perf-stat.i.node-store-mis=
s-rate%
>>   14478209 =C2=B1 11%     -62.0%    5508812 =C2=B1  4%  perf-stat.i.node=
-store-misses
>>      88440 =C2=B1 30%    +579.5%     600931 =C2=B1  6%  perf-stat.i.node=
-stores
>>       6087 =C2=B1  2%     +45.1%       8835 =C2=B1  2%  perf-stat.i.page=
-faults
>>       2.09 =C2=B1 10%    +985.1%      22.63        perf-stat.overall.MPKI
>>       1.47            +0.1        1.59        perf-stat.overall.branch-m=
iss-rate%
>>      21.62 =C2=B1  9%     -20.1        1.53 =C2=B1  6%  perf-stat.overal=
l.cache-miss-rate%
>>       1.39          +281.5%       5.31 =C2=B1  2%  perf-stat.overall.cpi
>>       3148 =C2=B1 13%    +389.9%      15426 =C2=B1  6%  perf-stat.overal=
l.cycles-between-cache-misses
>>       0.03 =C2=B1 22%      +0.2        0.25 =C2=B1  6%  perf-stat.overal=
l.dTLB-load-miss-rate%
>>       0.01 =C2=B1 22%      +0.1        0.07 =C2=B1  5%  perf-stat.overal=
l.dTLB-store-miss-rate%
>>      69.32            -6.5       62.83        perf-stat.overall.iTLB-loa=
d-miss-rate%
>>     570.55           +13.0%     644.62        perf-stat.overall.instruct=
ions-per-iTLB-miss
>>       0.72           -73.8%       0.19 =C2=B1  2%  perf-stat.overall.ipc
>>      99.37            -9.2       90.19        perf-stat.overall.node-sto=
re-miss-rate%
>>      29341           +52.9%      44875        perf-stat.overall.path-len=
gth
>>  8.042e+10           -74.8%  2.023e+10 =C2=B1  2%  perf-stat.ps.branch-i=
nstructions
>>  1.181e+09           -72.8%  3.209e+08 =C2=B1  2%  perf-stat.ps.branch-m=
isses
>>  1.797e+08 =C2=B1 14%     -81.1%   33893343 =C2=B1  6%  perf-stat.ps.cac=
he-misses
>>  8.305e+08 =C2=B1  9%    +166.9%  2.217e+09        perf-stat.ps.cache-re=
ferences
>>   27256541           -78.4%    5898690 =C2=B1  3%  perf-stat.ps.context-=
switches
>>  5.552e+11            -6.3%  5.204e+11        perf-stat.ps.cpu-cycles
>>      24729 =C2=B1 50%  +12196.4%    3040885 =C2=B1  2%  perf-stat.ps.cpu=
-migrations
>>   29676518 =C2=B1 21%    +133.9%   69414938 =C2=B1  5%  perf-stat.ps.dTL=
B-load-misses
>>  1.188e+11           -76.6%  2.779e+10 =C2=B1  2%  perf-stat.ps.dTLB-loa=
ds
>>    4995687 =C2=B1 21%    +104.7%   10225922 =C2=B1  4%  perf-stat.ps.dTL=
B-store-misses
>>  6.753e+10           -78.9%  1.428e+10 =C2=B1  2%  perf-stat.ps.dTLB-sto=
res
>>  6.987e+08           -78.2%  1.521e+08 =C2=B1  3%  perf-stat.ps.iTLB-loa=
d-misses
>>  3.092e+08           -70.9%   89948944 =C2=B1  2%  perf-stat.ps.iTLB-loa=
ds
>>  3.987e+11           -75.4%  9.799e+10 =C2=B1  2%  perf-stat.ps.instruct=
ions
>>       6065 =C2=B1  2%     +44.7%       8777 =C2=B1  2%  perf-stat.ps.min=
or-faults
>>   41255334 =C2=B1 15%     -74.0%   10721928 =C2=B1  6%  perf-stat.ps.nod=
e-load-misses
>>    5829908 =C2=B1  8%     -69.2%    1793127 =C2=B1  4%  perf-stat.ps.nod=
e-loads
>>   14427293 =C2=B1 11%     -62.0%    5487905 =C2=B1  4%  perf-stat.ps.nod=
e-store-misses
>>      88224 =C2=B1 30%    +576.2%     596567 =C2=B1  6%  perf-stat.ps.nod=
e-stores
>>       6066 =C2=B1  2%     +44.7%       8779 =C2=B1  2%  perf-stat.ps.pag=
e-faults
>>  1.216e+14           -75.6%  2.972e+13 =C2=B1  2%  perf-stat.total.instr=
uctions
>>       4.05 =C2=B1129%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>>       1.47 =C2=B1220%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.do_syslog.part.0.kmsg_read.vfs_read
>>      10.60 =C2=B1213%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>>      24.92 =C2=B1156%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>>       0.03 =C2=B1 66%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64=
_after_hwframe.[unknown]
>>      25.48 =C2=B1124%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>       4.68 =C2=B1 22%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bprm_=
execve
>>     191.29 =C2=B1117%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.rcu_gp_kthread.kthread.ret_from_fork
>>       0.02 =C2=B1 16%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll=
_wait
>>       0.02 =C2=B1 19%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_=
select
>>       0.01 =C2=B1 17%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>>      45.51 =C2=B1 45%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>       0.40 =C2=B1 14%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>       0.12 =C2=B1 87%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.smpboot_thread_fn.kthread.ret_from_fork
>>     196.21 =C2=B1177%    -100.0%       0.00        perf-sched.sch_delay.=
avg.ms.worker_thread.kthread.ret_from_fork
>>       4.26 =C2=B1121%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>>       1.47 =C2=B1220%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.do_syslog.part.0.kmsg_read.vfs_read
>>     172.87 =C2=B1217%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>>     552.66 =C2=B1147%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>>       3900 =C2=B1 33%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64=
_after_hwframe.[unknown]
>>       1268 =C2=B1114%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>      18.62 =C2=B1 30%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bprm_=
execve
>>       1409 =C2=B1 77%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.rcu_gp_kthread.kthread.ret_from_fork
>>       0.02 =C2=B1 23%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll=
_wait
>>       0.02 =C2=B1 21%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_=
select
>>       0.01 =C2=B1 36%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>>       1193 =C2=B1 43%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>       6097 =C2=B1 19%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>       1049 =C2=B1 91%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.smpboot_thread_fn.kthread.ret_from_fork
>>       1527 =C2=B1142%    -100.0%       0.00        perf-sched.sch_delay.=
max.ms.worker_thread.kthread.ret_from_fork
>>       0.22 =C2=B1 16%    -100.0%       0.00        perf-sched.total_sch_=
delay.average.ms
>>       6208 =C2=B1 17%    -100.0%       0.00        perf-sched.total_sch_=
delay.max.ms
>>       1.67 =C2=B1 13%    -100.0%       0.00        perf-sched.total_wait=
_and_delay.average.ms
>>    5989381 =C2=B1 15%    -100.0%       0.00        perf-sched.total_wait=
_and_delay.count.ms
>>      12710 =C2=B1 16%    -100.0%       0.00        perf-sched.total_wait=
_and_delay.max.ms
>>       1.45 =C2=B1 13%    -100.0%       0.00        perf-sched.total_wait=
_time.average.ms
>>      10832 =C2=B1  7%    -100.0%       0.00        perf-sched.total_wait=
_time.max.ms
>>     104.43 =C2=B1113%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>>       0.95 =C2=B1 13%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCA=
LL_64_after_hwframe.[unknown]
>>     184.94 =C2=B1 63%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>      26.74 =C2=B1 63%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.preempt_schedule_common.__cond_resched.generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter
>>       4.69 =C2=B1 22%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.=
bprm_execve
>>      38.80 =C2=B1  5%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affi=
ne_move_task.__set_cpus_allowed_ptr
>>     440.54 =C2=B1101%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
>>     131.85 =C2=B1 41%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>       1.55 =C2=B1 14%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>     271.01 =C2=B1  7%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
>>     604.50 =C2=B1 97%    -100.0%       0.00        perf-sched.wait_and_d=
elay.avg.ms.worker_thread.kthread.ret_from_fork
>>      16.17 =C2=B1 42%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>>    2979948 =C2=B1 15%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCAL=
L_64_after_hwframe.[unknown]
>>     120.33 =C2=B1 66%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.pipe_read.new_sync_read.vfs_read.ksys_read
>>      68.50 =C2=B1146%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.preempt_schedule_common.__cond_resched.generic_perform_write.__g=
eneric_file_write_iter.generic_file_write_iter
>>      11.00 =C2=B1 24%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.b=
prm_execve
>>     265.83 =C2=B1  5%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.preempt_schedule_common.__cond_resched.wait_for_completion.affin=
e_move_task.__set_cpus_allowed_ptr
>>      21.00 =C2=B1 54%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.rcu_gp_kthread.kthread.ret_from_fork
>>      76.50 =C2=B1 29%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>    2999846 =C2=B1 15%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>       8868 =C2=B1 10%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.smpboot_thread_fn.kthread.ret_from_fork
>>      33.83 =C2=B1 23%    -100.0%       0.00        perf-sched.wait_and_d=
elay.count.worker_thread.kthread.ret_from_fork
>>       1507 =C2=B1117%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>>       9360 =C2=B1 21%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCA=
LL_64_after_hwframe.[unknown]
>>       5712 =C2=B1 31%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>     514.61 =C2=B1170%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.preempt_schedule_common.__cond_resched.generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter
>>      18.62 =C2=B1 30%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.=
bprm_execve
>>       1021          -100.0%       0.00        perf-sched.wait_and_delay.=
max.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_mo=
ve_task.__set_cpus_allowed_ptr
>>       3023 =C2=B1 66%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.rcu_gp_kthread.kthread.ret_from_fork
>>       2726 =C2=B1 41%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>      12274 =C2=B1 20%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>      10832 =C2=B1  7%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
>>       6020 =C2=B1 61%    -100.0%       0.00        perf-sched.wait_and_d=
elay.max.ms.worker_thread.kthread.ret_from_fork
>>       0.52 =C2=B1 60%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>>      79.51 =C2=B1103%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>>       0.04 =C2=B1 12%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic=
_timer_interrupt.[unknown]
>>       0.93 =C2=B1 13%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64=
_after_hwframe.[unknown]
>>     159.46 =C2=B1 77%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>     149.83 =C2=B1124%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.alloc_=
pages_vma.shmem_alloc_page
>>      45.93 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.preempt_schedule_common.__cond_resched.__kmalloc_node_track_caller.k=
malloc_reserve.__alloc_skb
>>       0.04 =C2=B1 31%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.preempt_schedule_common.__cond_resched.aa_sk_perm.security_socket_re=
cvmsg.sock_recvmsg
>>       1.88 =C2=B1 24%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
>>      26.74 =C2=B1 63%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.preempt_schedule_common.__cond_resched.generic_perform_write.__gener=
ic_file_write_iter.generic_file_write_iter
>>      49.53 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_node.__alloc=
_skb.sk_stream_alloc_skb
>>      38.80 =C2=B1  5%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_mo=
ve_task.__set_cpus_allowed_ptr
>>     249.25 =C2=B1 90%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.rcu_gp_kthread.kthread.ret_from_fork
>>     150.13 =C2=B1221%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll=
_wait
>>      86.34 =C2=B1 39%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>       1.14 =C2=B1 15%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>     270.88 =C2=B1  7%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.smpboot_thread_fn.kthread.ret_from_fork
>>       0.21 =C2=B1 47%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.isra
>>     408.29 =C2=B1 78%    -100.0%       0.00        perf-sched.wait_time.=
avg.ms.worker_thread.kthread.ret_from_fork
>>       3.32 =C2=B1 94%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
>>       1310 =C2=B1121%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>>       0.09 =C2=B1  8%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic=
_timer_interrupt.[unknown]
>>       6865 =C2=B1 27%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64=
_after_hwframe.[unknown]
>>       5516 =C2=B1 38%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>     697.96 =C2=B1121%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.alloc_=
pages_vma.shmem_alloc_page
>>     183.54 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.preempt_schedule_common.__cond_resched.__kmalloc_node_track_caller.k=
malloc_reserve.__alloc_skb
>>       0.07 =C2=B1 32%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.preempt_schedule_common.__cond_resched.aa_sk_perm.security_socket_re=
cvmsg.sock_recvmsg
>>       2.46 =C2=B1 34%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
>>     514.61 =C2=B1170%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.preempt_schedule_common.__cond_resched.generic_perform_write.__gener=
ic_file_write_iter.generic_file_write_iter
>>     259.91 =C2=B1223%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_node.__alloc=
_skb.sk_stream_alloc_skb
>>       1021          -100.0%       0.00        perf-sched.wait_time.max.m=
s.preempt_schedule_common.__cond_resched.wait_for_completion.affine_move_ta=
sk.__set_cpus_allowed_ptr
>>       1645 =C2=B1 56%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.rcu_gp_kthread.kthread.ret_from_fork
>>     598.67 =C2=B1222%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll=
_wait
>>       1720 =C2=B1 34%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>       7531 =C2=B1 24%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>      10832 =C2=B1  7%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.smpboot_thread_fn.kthread.ret_from_fork
>>       0.36 =C2=B1  7%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.isra
>>       5350 =C2=B1 80%    -100.0%       0.00        perf-sched.wait_time.=
max.ms.worker_thread.kthread.ret_from_fork
>>       9807 =C2=B1 93%     -91.3%     851.33 =C2=B1 85%  interrupts.38:PC=
I-MSI.524289-edge.eth0-TxRx-0
>>     904091 =C2=B1 36%   +4206.1%   38931156        interrupts.CAL:Functi=
on_call_interrupts
>>       5173 =C2=B1 46%   +3806.8%     202126 =C2=B1  7%  interrupts.CPU0.=
CAL:Function_call_interrupts
>>       2548 =C2=B1 48%   +1720.3%      46390 =C2=B1 16%  interrupts.CPU0.=
RES:Rescheduling_interrupts
>>       3437 =C2=B1 38%   +6138.4%     214436 =C2=B1  5%  interrupts.CPU1.=
CAL:Function_call_interrupts
>>       2474 =C2=B1 49%   +1919.7%      49976 =C2=B1 13%  interrupts.CPU1.=
RES:Rescheduling_interrupts
>>       9807 =C2=B1 93%     -91.3%     851.33 =C2=B1 85%  interrupts.CPU10=
.38:PCI-MSI.524289-edge.eth0-TxRx-0
>>       4273 =C2=B1 51%   +4949.3%     215763 =C2=B1  5%  interrupts.CPU10=
.CAL:Function_call_interrupts
>>       2278 =C2=B1 39%   +2065.8%      49343 =C2=B1 12%  interrupts.CPU10=
.RES:Rescheduling_interrupts
>>       4627 =C2=B1 52%   +4584.7%     216786 =C2=B1  5%  interrupts.CPU10=
0.CAL:Function_call_interrupts
>>       2163 =C2=B1 43%   +2121.7%      48055 =C2=B1 12%  interrupts.CPU10=
0.RES:Rescheduling_interrupts
>>       4425 =C2=B1 53%   +4759.5%     215048 =C2=B1  6%  interrupts.CPU10=
1.CAL:Function_call_interrupts
>>       2417 =C2=B1 60%   +1879.9%      47866 =C2=B1 12%  interrupts.CPU10=
1.RES:Rescheduling_interrupts
>>       4448 =C2=B1 53%   +4608.1%     209441 =C2=B1 12%  interrupts.CPU10=
2.CAL:Function_call_interrupts
>>       1532 =C2=B1 54%   +2864.2%      45411 =C2=B1 16%  interrupts.CPU10=
2.RES:Rescheduling_interrupts
>>       4439 =C2=B1 55%   +4752.2%     215395 =C2=B1  6%  interrupts.CPU10=
3.CAL:Function_call_interrupts
>>       1869 =C2=B1 49%   +2479.1%      48225 =C2=B1 12%  interrupts.CPU10=
3.RES:Rescheduling_interrupts
>>       4324 =C2=B1 52%   +4805.6%     212125 =C2=B1  6%  interrupts.CPU10=
4.CAL:Function_call_interrupts
>>       2479 =C2=B1 36%   +1843.9%      48199 =C2=B1 12%  interrupts.CPU10=
4.RES:Rescheduling_interrupts
>>       4306 =C2=B1 50%   +4857.5%     213496 =C2=B1  6%  interrupts.CPU10=
5.CAL:Function_call_interrupts
>>       2907 =C2=B1 53%   +1552.3%      48033 =C2=B1 12%  interrupts.CPU10=
5.RES:Rescheduling_interrupts
>>       4384 =C2=B1 52%   +4802.3%     214951 =C2=B1  6%  interrupts.CPU10=
6.CAL:Function_call_interrupts
>>       3612 =C2=B1 51%   +1229.8%      48033 =C2=B1 12%  interrupts.CPU10=
6.RES:Rescheduling_interrupts
>>       4342 =C2=B1 50%   +4849.2%     214912 =C2=B1  6%  interrupts.CPU10=
7.CAL:Function_call_interrupts
>>       2862 =C2=B1 38%   +1575.6%      47964 =C2=B1 13%  interrupts.CPU10=
7.RES:Rescheduling_interrupts
>>       4322 =C2=B1 50%   +4816.8%     212535 =C2=B1  5%  interrupts.CPU10=
8.CAL:Function_call_interrupts
>>       2011 =C2=B1 34%   +2277.0%      47810 =C2=B1 12%  interrupts.CPU10=
8.RES:Rescheduling_interrupts
>>       4271 =C2=B1 52%   +4913.2%     214149 =C2=B1  6%  interrupts.CPU10=
9.CAL:Function_call_interrupts
>>       2298 =C2=B1 54%   +1987.9%      47990 =C2=B1 12%  interrupts.CPU10=
9.RES:Rescheduling_interrupts
>>       4264 =C2=B1 49%   +4936.9%     214807 =C2=B1  6%  interrupts.CPU11=
.CAL:Function_call_interrupts
>>       2407 =C2=B1 29%   +1970.7%      49842 =C2=B1 14%  interrupts.CPU11=
.RES:Rescheduling_interrupts
>>       4288 =C2=B1 54%   +4903.4%     214547 =C2=B1  6%  interrupts.CPU11=
0.CAL:Function_call_interrupts
>>       2075 =C2=B1 30%   +2225.2%      48252 =C2=B1 12%  interrupts.CPU11=
0.RES:Rescheduling_interrupts
>>       4342 =C2=B1 48%   +4845.1%     214749 =C2=B1  6%  interrupts.CPU11=
1.CAL:Function_call_interrupts
>>       2311 =C2=B1 41%   +1981.0%      48108 =C2=B1 12%  interrupts.CPU11=
1.RES:Rescheduling_interrupts
>>       4299 =C2=B1 52%   +4852.0%     212928 =C2=B1  6%  interrupts.CPU11=
2.CAL:Function_call_interrupts
>>       2217 =C2=B1 48%   +2071.7%      48150 =C2=B1 12%  interrupts.CPU11=
2.RES:Rescheduling_interrupts
>>       4442 =C2=B1 48%   +4668.2%     211836 =C2=B1  6%  interrupts.CPU11=
3.CAL:Function_call_interrupts
>>       1801 =C2=B1 50%   +2549.2%      47733 =C2=B1 12%  interrupts.CPU11=
3.RES:Rescheduling_interrupts
>>       4309 =C2=B1 52%   +4870.8%     214200 =C2=B1  6%  interrupts.CPU11=
4.CAL:Function_call_interrupts
>>       2982 =C2=B1 48%   +1497.1%      47633 =C2=B1 13%  interrupts.CPU11=
4.RES:Rescheduling_interrupts
>>       4480 =C2=B1 56%   +4709.7%     215506 =C2=B1  6%  interrupts.CPU11=
5.CAL:Function_call_interrupts
>>       1757 =C2=B1 34%   +2631.7%      47996 =C2=B1 12%  interrupts.CPU11=
5.RES:Rescheduling_interrupts
>>       4440 =C2=B1 54%   +4758.6%     215744 =C2=B1  6%  interrupts.CPU11=
6.CAL:Function_call_interrupts
>>       3547 =C2=B1 57%   +1252.7%      47984 =C2=B1 12%  interrupts.CPU11=
6.RES:Rescheduling_interrupts
>>       4219 =C2=B1 51%   +4930.2%     212222 =C2=B1  6%  interrupts.CPU11=
7.CAL:Function_call_interrupts
>>       1659 =C2=B1 47%   +2779.5%      47784 =C2=B1 13%  interrupts.CPU11=
7.RES:Rescheduling_interrupts
>>       4271 =C2=B1 51%   +4875.0%     212505 =C2=B1  7%  interrupts.CPU11=
8.CAL:Function_call_interrupts
>>       2078 =C2=B1 59%   +2182.3%      47437 =C2=B1 12%  interrupts.CPU11=
8.RES:Rescheduling_interrupts
>>       3896 =C2=B1 57%   +5360.0%     212730 =C2=B1  6%  interrupts.CPU11=
9.CAL:Function_call_interrupts
>>       2811 =C2=B1 63%   +1596.2%      47695 =C2=B1 12%  interrupts.CPU11=
9.RES:Rescheduling_interrupts
>>       4272 =C2=B1 53%   +4906.0%     213865 =C2=B1  5%  interrupts.CPU12=
.CAL:Function_call_interrupts
>>       2226 =C2=B1 42%   +2098.5%      48948 =C2=B1 12%  interrupts.CPU12=
.RES:Rescheduling_interrupts
>>       3892 =C2=B1 42%   +5007.4%     198788 =C2=B1  7%  interrupts.CPU12=
0.CAL:Function_call_interrupts
>>       1874 =C2=B1 42%   +2492.3%      48584 =C2=B1 13%  interrupts.CPU12=
0.RES:Rescheduling_interrupts
>>       3988 =C2=B1 41%   +4940.1%     201026 =C2=B1  6%  interrupts.CPU12=
1.CAL:Function_call_interrupts
>>       2865 =C2=B1 35%   +1595.0%      48562 =C2=B1 13%  interrupts.CPU12=
1.RES:Rescheduling_interrupts
>>       4099 =C2=B1 44%   +4768.3%     199585 =C2=B1  7%  interrupts.CPU12=
2.CAL:Function_call_interrupts
>>       2896 =C2=B1 48%   +1574.6%      48497 =C2=B1 14%  interrupts.CPU12=
2.RES:Rescheduling_interrupts
>>       4093 =C2=B1 44%   +4867.6%     203331 =C2=B1  6%  interrupts.CPU12=
3.CAL:Function_call_interrupts
>>       1746 =C2=B1 33%   +2674.9%      48454 =C2=B1 13%  interrupts.CPU12=
3.RES:Rescheduling_interrupts
>>       4069 =C2=B1 45%   +4884.4%     202850 =C2=B1  6%  interrupts.CPU12=
4.CAL:Function_call_interrupts
>>       1908 =C2=B1 49%   +2428.3%      48239 =C2=B1 14%  interrupts.CPU12=
4.RES:Rescheduling_interrupts
>>       3890 =C2=B1 45%   +5144.0%     204026 =C2=B1  5%  interrupts.CPU12=
5.CAL:Function_call_interrupts
>>       1687 =C2=B1 40%   +2761.2%      48273 =C2=B1 13%  interrupts.CPU12=
5.RES:Rescheduling_interrupts
>>       4088 =C2=B1 46%   +4860.3%     202784 =C2=B1  6%  interrupts.CPU12=
6.CAL:Function_call_interrupts
>>       2081 =C2=B1 36%   +2210.1%      48072 =C2=B1 13%  interrupts.CPU12=
6.RES:Rescheduling_interrupts
>>       4011 =C2=B1 45%   +4939.2%     202129 =C2=B1  6%  interrupts.CPU12=
7.CAL:Function_call_interrupts
>>       2573 =C2=B1 49%   +1786.6%      48542 =C2=B1 13%  interrupts.CPU12=
7.RES:Rescheduling_interrupts
>>       3825 =C2=B1 43%   +5137.6%     200345 =C2=B1  6%  interrupts.CPU12=
8.CAL:Function_call_interrupts
>>       1565 =C2=B1 51%   +3005.8%      48631 =C2=B1 14%  interrupts.CPU12=
8.RES:Rescheduling_interrupts
>>       3872 =C2=B1 43%   +5066.4%     200050 =C2=B1  7%  interrupts.CPU12=
9.CAL:Function_call_interrupts
>>       2961 =C2=B1 46%   +1529.7%      48257 =C2=B1 14%  interrupts.CPU12=
9.RES:Rescheduling_interrupts
>>       4269 =C2=B1 51%   +4894.4%     213235 =C2=B1  5%  interrupts.CPU13=
.CAL:Function_call_interrupts
>>       2426 =C2=B1 55%   +1937.6%      49439 =C2=B1 12%  interrupts.CPU13=
.RES:Rescheduling_interrupts
>>       4001 =C2=B1 46%   +4946.9%     201969 =C2=B1  6%  interrupts.CPU13=
0.CAL:Function_call_interrupts
>>       2232 =C2=B1 38%   +2071.7%      48479 =C2=B1 14%  interrupts.CPU13=
0.RES:Rescheduling_interrupts
>>       3906 =C2=B1 43%   +5029.0%     200382 =C2=B1  6%  interrupts.CPU13=
1.CAL:Function_call_interrupts
>>       2150 =C2=B1 68%   +2139.5%      48167 =C2=B1 13%  interrupts.CPU13=
1.RES:Rescheduling_interrupts
>>       3818 =C2=B1 45%   +5113.6%     199080 =C2=B1  6%  interrupts.CPU13=
2.CAL:Function_call_interrupts
>>       1515 =C2=B1 52%   +3075.5%      48113 =C2=B1 14%  interrupts.CPU13=
2.RES:Rescheduling_interrupts
>>       3813 =C2=B1 44%   +5113.5%     198815 =C2=B1  6%  interrupts.CPU13=
3.CAL:Function_call_interrupts
>>       2258 =C2=B1 42%   +2046.2%      48464 =C2=B1 14%  interrupts.CPU13=
3.RES:Rescheduling_interrupts
>>       3837 =C2=B1 43%   +5116.6%     200187 =C2=B1  6%  interrupts.CPU13=
4.CAL:Function_call_interrupts
>>       1922 =C2=B1 42%   +2432.6%      48677 =C2=B1 14%  interrupts.CPU13=
4.RES:Rescheduling_interrupts
>>       3907 =C2=B1 42%   +5033.3%     200602 =C2=B1  6%  interrupts.CPU13=
5.CAL:Function_call_interrupts
>>       2667 =C2=B1 44%   +1714.2%      48394 =C2=B1 13%  interrupts.CPU13=
5.RES:Rescheduling_interrupts
>>       3754 =C2=B1 43%   +5199.8%     198996 =C2=B1  7%  interrupts.CPU13=
6.CAL:Function_call_interrupts
>>       1924 =C2=B1 59%   +2410.0%      48300 =C2=B1 13%  interrupts.CPU13=
6.RES:Rescheduling_interrupts
>>       3853 =C2=B1 42%   +5070.9%     199261 =C2=B1  6%  interrupts.CPU13=
7.CAL:Function_call_interrupts
>>       2830 =C2=B1 63%   +1602.9%      48195 =C2=B1 13%  interrupts.CPU13=
7.RES:Rescheduling_interrupts
>>       3937 =C2=B1 46%   +4996.8%     200678 =C2=B1  6%  interrupts.CPU13=
8.CAL:Function_call_interrupts
>>       1753 =C2=B1 41%   +2649.4%      48196 =C2=B1 13%  interrupts.CPU13=
8.RES:Rescheduling_interrupts
>>       3807 =C2=B1 43%   +5193.6%     201572 =C2=B1  6%  interrupts.CPU13=
9.CAL:Function_call_interrupts
>>       1365 =C2=B1 39%   +3462.0%      48651 =C2=B1 14%  interrupts.CPU13=
9.RES:Rescheduling_interrupts
>>       4296 =C2=B1 51%   +4937.4%     216447 =C2=B1  5%  interrupts.CPU14=
.CAL:Function_call_interrupts
>>       2288 =C2=B1 51%   +2061.3%      49461 =C2=B1 13%  interrupts.CPU14=
.RES:Rescheduling_interrupts
>>       3937 =C2=B1 44%   +5023.7%     201754 =C2=B1  6%  interrupts.CPU14=
0.CAL:Function_call_interrupts
>>       1704 =C2=B1 56%   +2752.1%      48623 =C2=B1 14%  interrupts.CPU14=
0.RES:Rescheduling_interrupts
>>       3782 =C2=B1 45%   +5116.1%     197308 =C2=B1  6%  interrupts.CPU14=
1.CAL:Function_call_interrupts
>>       1479 =C2=B1 28%   +3180.1%      48534 =C2=B1 14%  interrupts.CPU14=
1.RES:Rescheduling_interrupts
>>       3818 =C2=B1 44%   +5085.1%     198011 =C2=B1  6%  interrupts.CPU14=
2.CAL:Function_call_interrupts
>>       1522 =C2=B1 35%   +3050.8%      47965 =C2=B1 14%  interrupts.CPU14=
2.RES:Rescheduling_interrupts
>>       3908 =C2=B1 40%   +4969.2%     198112 =C2=B1  7%  interrupts.CPU14=
3.CAL:Function_call_interrupts
>>       2302 =C2=B1 42%   +1985.8%      48033 =C2=B1 13%  interrupts.CPU14=
3.RES:Rescheduling_interrupts
>>       4198 =C2=B1 60%   +4728.9%     202725 =C2=B1  7%  interrupts.CPU14=
4.CAL:Function_call_interrupts
>>       2144 =C2=B1 44%   +2075.5%      46646 =C2=B1 16%  interrupts.CPU14=
4.RES:Rescheduling_interrupts
>>       4255 =C2=B1 59%   +4699.2%     204206 =C2=B1  7%  interrupts.CPU14=
5.CAL:Function_call_interrupts
>>       1642 =C2=B1 43%   +2735.8%      46569 =C2=B1 16%  interrupts.CPU14=
5.RES:Rescheduling_interrupts
>>       4283 =C2=B1 57%   +4650.5%     203470 =C2=B1  7%  interrupts.CPU14=
6.CAL:Function_call_interrupts
>>       2927 =C2=B1 51%   +1485.1%      46394 =C2=B1 16%  interrupts.CPU14=
6.RES:Rescheduling_interrupts
>>       4292 =C2=B1 59%   +4667.7%     204668 =C2=B1  7%  interrupts.CPU14=
7.CAL:Function_call_interrupts
>>       2432 =C2=B1 39%   +1809.5%      46441 =C2=B1 16%  interrupts.CPU14=
7.RES:Rescheduling_interrupts
>>       4268 =C2=B1 58%   +4662.4%     203291 =C2=B1  7%  interrupts.CPU14=
8.CAL:Function_call_interrupts
>>       1587 =C2=B1 49%   +2815.5%      46293 =C2=B1 16%  interrupts.CPU14=
8.RES:Rescheduling_interrupts
>>       4283 =C2=B1 58%   +4628.4%     202555 =C2=B1  7%  interrupts.CPU14=
9.CAL:Function_call_interrupts
>>       2238 =C2=B1 37%   +1962.7%      46179 =C2=B1 16%  interrupts.CPU14=
9.RES:Rescheduling_interrupts
>>       4342 =C2=B1 54%   +4878.5%     216208 =C2=B1  5%  interrupts.CPU15=
.CAL:Function_call_interrupts
>>       2941 =C2=B1 37%   +1579.8%      49415 =C2=B1 12%  interrupts.CPU15=
.RES:Rescheduling_interrupts
>>       4304 =C2=B1 58%   +4604.5%     202480 =C2=B1  7%  interrupts.CPU15=
0.CAL:Function_call_interrupts
>>       2828 =C2=B1 63%   +1527.5%      46040 =C2=B1 16%  interrupts.CPU15=
0.RES:Rescheduling_interrupts
>>       4385 =C2=B1 54%   +4513.1%     202284 =C2=B1  7%  interrupts.CPU15=
1.CAL:Function_call_interrupts
>>       2372 =C2=B1 43%   +1854.2%      46363 =C2=B1 16%  interrupts.CPU15=
1.RES:Rescheduling_interrupts
>>       4298 =C2=B1 58%   +4602.3%     202137 =C2=B1  7%  interrupts.CPU15=
2.CAL:Function_call_interrupts
>>       2039 =C2=B1 50%   +2176.7%      46432 =C2=B1 15%  interrupts.CPU15=
2.RES:Rescheduling_interrupts
>>       4270 =C2=B1 59%   +4644.4%     202594 =C2=B1  7%  interrupts.CPU15=
3.CAL:Function_call_interrupts
>>       1962 =C2=B1 45%   +2253.4%      46181 =C2=B1 16%  interrupts.CPU15=
3.RES:Rescheduling_interrupts
>>       4191 =C2=B1 59%   +4687.4%     200640 =C2=B1  8%  interrupts.CPU15=
4.CAL:Function_call_interrupts
>>       1609 =C2=B1 46%   +2775.9%      46273 =C2=B1 16%  interrupts.CPU15=
4.RES:Rescheduling_interrupts
>>       4140 =C2=B1 57%   +4800.0%     202885 =C2=B1  7%  interrupts.CPU15=
5.CAL:Function_call_interrupts
>>       2165 =C2=B1 44%   +2030.1%      46133 =C2=B1 16%  interrupts.CPU15=
5.RES:Rescheduling_interrupts
>>       4221 =C2=B1 59%   +4677.0%     201676 =C2=B1  7%  interrupts.CPU15=
6.CAL:Function_call_interrupts
>>       2264 =C2=B1 76%   +1940.9%      46219 =C2=B1 16%  interrupts.CPU15=
6.RES:Rescheduling_interrupts
>>       4276 =C2=B1 60%   +4594.6%     200757 =C2=B1  8%  interrupts.CPU15=
7.CAL:Function_call_interrupts
>>       2595 =C2=B1 47%   +1687.2%      46378 =C2=B1 16%  interrupts.CPU15=
7.RES:Rescheduling_interrupts
>>       4244 =C2=B1 59%   +4686.9%     203195 =C2=B1  7%  interrupts.CPU15=
8.CAL:Function_call_interrupts
>>       2996 =C2=B1 51%   +1442.7%      46227 =C2=B1 16%  interrupts.CPU15=
8.RES:Rescheduling_interrupts
>>       4309 =C2=B1 58%   +4605.3%     202774 =C2=B1  7%  interrupts.CPU15=
9.CAL:Function_call_interrupts
>>       2074 =C2=B1 54%   +2139.7%      46465 =C2=B1 16%  interrupts.CPU15=
9.RES:Rescheduling_interrupts
>>       4303 =C2=B1 51%   +4880.5%     214313 =C2=B1  6%  interrupts.CPU16=
.CAL:Function_call_interrupts
>>       2065 =C2=B1 48%   +2290.8%      49375 =C2=B1 12%  interrupts.CPU16=
.RES:Rescheduling_interrupts
>>       4459 =C2=B1 57%   +4455.5%     203129 =C2=B1  7%  interrupts.CPU16=
0.CAL:Function_call_interrupts
>>       2967 =C2=B1 25%   +1462.5%      46371 =C2=B1 16%  interrupts.CPU16=
0.RES:Rescheduling_interrupts
>>       4397 =C2=B1 56%   +4459.5%     200497 =C2=B1  7%  interrupts.CPU16=
1.CAL:Function_call_interrupts
>>       2267 =C2=B1 53%   +1951.8%      46514 =C2=B1 18%  interrupts.CPU16=
1.RES:Rescheduling_interrupts
>>       4330 =C2=B1 59%   +4554.4%     201543 =C2=B1  7%  interrupts.CPU16=
2.CAL:Function_call_interrupts
>>       2667 =C2=B1 37%   +1641.9%      46460 =C2=B1 16%  interrupts.CPU16=
2.RES:Rescheduling_interrupts
>>       4401 =C2=B1 55%   +4524.8%     203561 =C2=B1  7%  interrupts.CPU16=
3.CAL:Function_call_interrupts
>>       3247 =C2=B1 44%   +1332.5%      46524 =C2=B1 16%  interrupts.CPU16=
3.RES:Rescheduling_interrupts
>>       4187 =C2=B1 57%   +4706.3%     201246 =C2=B1  7%  interrupts.CPU16=
4.CAL:Function_call_interrupts
>>       1821 =C2=B1 36%   +2442.8%      46317 =C2=B1 16%  interrupts.CPU16=
4.RES:Rescheduling_interrupts
>>       4227 =C2=B1 52%   +4641.5%     200438 =C2=B1  7%  interrupts.CPU16=
5.CAL:Function_call_interrupts
>>       2505 =C2=B1 38%   +1750.3%      46353 =C2=B1 16%  interrupts.CPU16=
5.RES:Rescheduling_interrupts
>>       4266 =C2=B1 60%   +4654.7%     202859 =C2=B1  7%  interrupts.CPU16=
6.CAL:Function_call_interrupts
>>       1935 =C2=B1 46%   +2293.6%      46316 =C2=B1 16%  interrupts.CPU16=
6.RES:Rescheduling_interrupts
>>       4165 =C2=B1 56%   +4731.5%     201230 =C2=B1  7%  interrupts.CPU16=
7.CAL:Function_call_interrupts
>>       2339 =C2=B1 37%   +1870.9%      46105 =C2=B1 16%  interrupts.CPU16=
7.RES:Rescheduling_interrupts
>>       6514 =C2=B1 44%   +2873.2%     193677 =C2=B1  3%  interrupts.CPU16=
8.CAL:Function_call_interrupts
>>       3170 =C2=B1 46%   +1436.3%      48704 =C2=B1 10%  interrupts.CPU16=
8.RES:Rescheduling_interrupts
>>       6459 =C2=B1 44%   +2847.6%     190411 =C2=B1  9%  interrupts.CPU16=
9.CAL:Function_call_interrupts
>>       2702 =C2=B1 27%   +1619.8%      46470 =C2=B1 10%  interrupts.CPU16=
9.RES:Rescheduling_interrupts
>>       4276 =C2=B1 51%   +4910.0%     214269 =C2=B1  5%  interrupts.CPU17=
.CAL:Function_call_interrupts
>>       2058 =C2=B1 48%   +2281.8%      49030 =C2=B1 12%  interrupts.CPU17=
.RES:Rescheduling_interrupts
>>       6439 =C2=B1 43%   +2942.9%     195932 =C2=B1  4%  interrupts.CPU17=
0.CAL:Function_call_interrupts
>>       3072 =C2=B1 23%   +1485.4%      48709 =C2=B1 10%  interrupts.CPU17=
0.RES:Rescheduling_interrupts
>>       6423 =C2=B1 44%   +2980.6%     197881 =C2=B1  4%  interrupts.CPU17=
1.CAL:Function_call_interrupts
>>       2570 =C2=B1 45%   +1779.0%      48307 =C2=B1 10%  interrupts.CPU17=
1.RES:Rescheduling_interrupts
>>       6399 =C2=B1 42%   +2924.6%     193558 =C2=B1  4%  interrupts.CPU17=
2.CAL:Function_call_interrupts
>>       3087 =C2=B1 24%   +1470.7%      48491 =C2=B1 10%  interrupts.CPU17=
2.RES:Rescheduling_interrupts
>>       6293 =C2=B1 43%   +2967.2%     193037 =C2=B1  4%  interrupts.CPU17=
3.CAL:Function_call_interrupts
>>       2488 =C2=B1 49%   +1827.3%      47968 =C2=B1 10%  interrupts.CPU17=
3.RES:Rescheduling_interrupts
>>       6385 =C2=B1 43%   +2941.0%     194196 =C2=B1  4%  interrupts.CPU17=
4.CAL:Function_call_interrupts
>>       2925 =C2=B1 56%   +1545.4%      48126 =C2=B1 10%  interrupts.CPU17=
4.RES:Rescheduling_interrupts
>>       6382 =C2=B1 44%   +2917.9%     192611 =C2=B1  4%  interrupts.CPU17=
5.CAL:Function_call_interrupts
>>       2941 =C2=B1 45%   +1552.6%      48608 =C2=B1 10%  interrupts.CPU17=
5.RES:Rescheduling_interrupts
>>       6500 =C2=B1 43%   +2867.8%     192906 =C2=B1  4%  interrupts.CPU17=
6.CAL:Function_call_interrupts
>>       2416 =C2=B1 45%   +1913.1%      48643 =C2=B1 10%  interrupts.CPU17=
6.RES:Rescheduling_interrupts
>>       6466 =C2=B1 44%   +2900.9%     194049 =C2=B1  4%  interrupts.CPU17=
7.CAL:Function_call_interrupts
>>       3317 =C2=B1 29%   +1363.4%      48542 =C2=B1 10%  interrupts.CPU17=
7.RES:Rescheduling_interrupts
>>       6335 =C2=B1 43%   +2907.6%     190551 =C2=B1  4%  interrupts.CPU17=
8.CAL:Function_call_interrupts
>>       2739 =C2=B1 50%   +1659.1%      48186 =C2=B1 10%  interrupts.CPU17=
8.RES:Rescheduling_interrupts
>>       6440 =C2=B1 44%   +2905.8%     193583 =C2=B1  4%  interrupts.CPU17=
9.CAL:Function_call_interrupts
>>       3212 =C2=B1 54%   +1400.2%      48189 =C2=B1 10%  interrupts.CPU17=
9.RES:Rescheduling_interrupts
>>       4346 =C2=B1 52%   +4869.8%     216003 =C2=B1  5%  interrupts.CPU18=
.CAL:Function_call_interrupts
>>       2773 =C2=B1 23%   +1668.4%      49037 =C2=B1 12%  interrupts.CPU18=
.RES:Rescheduling_interrupts
>>       6207 =C2=B1 45%   +3007.1%     192868 =C2=B1  4%  interrupts.CPU18=
0.CAL:Function_call_interrupts
>>       3346 =C2=B1 42%   +1345.2%      48361 =C2=B1 11%  interrupts.CPU18=
0.RES:Rescheduling_interrupts
>>       6340 =C2=B1 44%   +2895.0%     189907 =C2=B1  4%  interrupts.CPU18=
1.CAL:Function_call_interrupts
>>       2838 =C2=B1 56%   +1575.8%      47563 =C2=B1 11%  interrupts.CPU18=
1.RES:Rescheduling_interrupts
>>       6365 =C2=B1 43%   +2934.2%     193143 =C2=B1  4%  interrupts.CPU18=
2.CAL:Function_call_interrupts
>>       2646 =C2=B1 45%   +1745.8%      48853 =C2=B1 10%  interrupts.CPU18=
2.RES:Rescheduling_interrupts
>>       6316 =C2=B1 44%   +2940.0%     192012 =C2=B1  4%  interrupts.CPU18=
3.CAL:Function_call_interrupts
>>       3058 =C2=B1 38%   +1485.0%      48481 =C2=B1 10%  interrupts.CPU18=
3.RES:Rescheduling_interrupts
>>       6472 =C2=B1 43%   +2888.3%     193422 =C2=B1  4%  interrupts.CPU18=
4.CAL:Function_call_interrupts
>>       3005 =C2=B1 44%   +1508.6%      48348 =C2=B1 10%  interrupts.CPU18=
4.RES:Rescheduling_interrupts
>>       6309 =C2=B1 43%   +2947.5%     192281 =C2=B1  4%  interrupts.CPU18=
5.CAL:Function_call_interrupts
>>       2506 =C2=B1 48%   +1817.2%      48050 =C2=B1 10%  interrupts.CPU18=
5.RES:Rescheduling_interrupts
>>       6266 =C2=B1 43%   +2954.5%     191418 =C2=B1  4%  interrupts.CPU18=
6.CAL:Function_call_interrupts
>>       2559 =C2=B1 48%   +1791.2%      48396 =C2=B1 10%  interrupts.CPU18=
6.RES:Rescheduling_interrupts
>>       6411 =C2=B1 42%   +2941.6%     195019 =C2=B1  4%  interrupts.CPU18=
7.CAL:Function_call_interrupts
>>       3056 =C2=B1 44%   +1483.4%      48396 =C2=B1 10%  interrupts.CPU18=
7.RES:Rescheduling_interrupts
>>       6412 =C2=B1 43%   +2920.5%     193697 =C2=B1  5%  interrupts.CPU18=
8.CAL:Function_call_interrupts
>>       2539 =C2=B1 35%   +1803.0%      48329 =C2=B1 10%  interrupts.CPU18=
8.RES:Rescheduling_interrupts
>>       6250 =C2=B1 43%   +2958.8%     191179 =C2=B1  4%  interrupts.CPU18=
9.CAL:Function_call_interrupts
>>       2696 =C2=B1 37%   +1697.4%      48464 =C2=B1 10%  interrupts.CPU18=
9.RES:Rescheduling_interrupts
>>       4352 =C2=B1 53%   +4888.8%     217146 =C2=B1  5%  interrupts.CPU19=
.CAL:Function_call_interrupts
>>       1970 =C2=B1 41%   +2394.5%      49161 =C2=B1 12%  interrupts.CPU19=
.RES:Rescheduling_interrupts
>>       6245 =C2=B1 44%   +2971.5%     191834 =C2=B1  4%  interrupts.CPU19=
0.CAL:Function_call_interrupts
>>       2710 =C2=B1 37%   +1671.5%      48008 =C2=B1 10%  interrupts.CPU19=
0.RES:Rescheduling_interrupts
>>       6404 =C2=B1 41%   +2777.1%     184260 =C2=B1  4%  interrupts.CPU19=
1.CAL:Function_call_interrupts
>>       2449 =C2=B1 41%   +1799.2%      46510 =C2=B1 10%  interrupts.CPU19=
1.RES:Rescheduling_interrupts
>>       4527 =C2=B1 57%   +4552.3%     210625 =C2=B1  6%  interrupts.CPU2.=
CAL:Function_call_interrupts
>>       1940 =C2=B1 39%   +2376.1%      48057 =C2=B1 18%  interrupts.CPU2.=
RES:Rescheduling_interrupts
>>       7.50 =C2=B1152%   +1506.7%     120.50 =C2=B1 70%  interrupts.CPU2.=
TLB:TLB_shootdowns
>>       4375 =C2=B1 52%   +4840.8%     216158 =C2=B1  5%  interrupts.CPU20=
.CAL:Function_call_interrupts
>>       2963 =C2=B1 32%   +1561.7%      49236 =C2=B1 12%  interrupts.CPU20=
.RES:Rescheduling_interrupts
>>       4404 =C2=B1 55%   +4774.1%     214678 =C2=B1  6%  interrupts.CPU21=
.CAL:Function_call_interrupts
>>       1918 =C2=B1 42%   +2460.1%      49124 =C2=B1 12%  interrupts.CPU21=
.RES:Rescheduling_interrupts
>>       4408 =C2=B1 54%   +4736.4%     213197 =C2=B1  6%  interrupts.CPU22=
.CAL:Function_call_interrupts
>>       2135 =C2=B1 45%   +2196.0%      49039 =C2=B1 12%  interrupts.CPU22=
.RES:Rescheduling_interrupts
>>       4298 =C2=B1 57%   +4878.8%     214013 =C2=B1  6%  interrupts.CPU23=
.CAL:Function_call_interrupts
>>       2044 =C2=B1 53%   +2288.2%      48823 =C2=B1 12%  interrupts.CPU23=
.RES:Rescheduling_interrupts
>>       3872 =C2=B1 40%   +5034.3%     198807 =C2=B1  6%  interrupts.CPU24=
.CAL:Function_call_interrupts
>>       2057 =C2=B1 50%   +2331.8%      50035 =C2=B1 14%  interrupts.CPU24=
.RES:Rescheduling_interrupts
>>       3623 =C2=B1 38%   +5365.7%     198067 =C2=B1  6%  interrupts.CPU25=
.CAL:Function_call_interrupts
>>       2720 =C2=B1 16%   +1730.8%      49803 =C2=B1 14%  interrupts.CPU25=
.RES:Rescheduling_interrupts
>>       3893 =C2=B1 40%   +4987.4%     198095 =C2=B1  6%  interrupts.CPU26=
.CAL:Function_call_interrupts
>>       2743 =C2=B1 36%   +1714.9%      49786 =C2=B1 13%  interrupts.CPU26=
.RES:Rescheduling_interrupts
>>       3171 =C2=B1 35%   +6270.5%     202007 =C2=B1  6%  interrupts.CPU27=
.CAL:Function_call_interrupts
>>       2258 =C2=B1 51%   +2108.3%      49881 =C2=B1 13%  interrupts.CPU27=
.RES:Rescheduling_interrupts
>>       3947 =C2=B1 44%   +5018.0%     202050 =C2=B1  6%  interrupts.CPU28=
.CAL:Function_call_interrupts
>>       1710 =C2=B1 43%   +2800.3%      49618 =C2=B1 13%  interrupts.CPU28=
.RES:Rescheduling_interrupts
>>       3893 =C2=B1 42%   +5058.8%     200875 =C2=B1  6%  interrupts.CPU29=
.CAL:Function_call_interrupts
>>       1890 =C2=B1 44%   +2513.3%      49395 =C2=B1 13%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>>       4307 =C2=B1 52%   +4925.4%     216468 =C2=B1  5%  interrupts.CPU3.=
CAL:Function_call_interrupts
>>       2522 =C2=B1 39%   +1859.2%      49417 =C2=B1 12%  interrupts.CPU3.=
RES:Rescheduling_interrupts
>>       3946 =C2=B1 43%   +5013.8%     201790 =C2=B1  6%  interrupts.CPU30=
.CAL:Function_call_interrupts
>>       2078 =C2=B1 35%   +2280.1%      49473 =C2=B1 13%  interrupts.CPU30=
.RES:Rescheduling_interrupts
>>       3885 =C2=B1 44%   +5113.6%     202558 =C2=B1  5%  interrupts.CPU31=
.CAL:Function_call_interrupts
>>       2258 =C2=B1 37%   +2105.2%      49797 =C2=B1 13%  interrupts.CPU31=
.RES:Rescheduling_interrupts
>>       3808 =C2=B1 43%   +5188.3%     201388 =C2=B1  6%  interrupts.CPU32=
.CAL:Function_call_interrupts
>>       1944 =C2=B1 66%   +2460.9%      49784 =C2=B1 13%  interrupts.CPU32=
.RES:Rescheduling_interrupts
>>       3868 =C2=B1 40%   +5112.1%     201640 =C2=B1  6%  interrupts.CPU33=
.CAL:Function_call_interrupts
>>       2494 =C2=B1 35%   +1890.5%      49659 =C2=B1 14%  interrupts.CPU33=
.RES:Rescheduling_interrupts
>>       3937 =C2=B1 39%   +5056.1%     203021 =C2=B1  5%  interrupts.CPU34=
.CAL:Function_call_interrupts
>>       3325 =C2=B1 90%   +1395.7%      49743 =C2=B1 13%  interrupts.CPU34=
.RES:Rescheduling_interrupts
>>       3744 =C2=B1 41%   +5252.6%     200402 =C2=B1  6%  interrupts.CPU35=
.CAL:Function_call_interrupts
>>       1950 =C2=B1 46%   +2434.8%      49445 =C2=B1 13%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>>       3819 =C2=B1 44%   +5167.9%     201217 =C2=B1  6%  interrupts.CPU36=
.CAL:Function_call_interrupts
>>       2487 =C2=B1 72%   +1886.2%      49398 =C2=B1 14%  interrupts.CPU36=
.RES:Rescheduling_interrupts
>>       3737 =C2=B1 42%   +5268.2%     200611 =C2=B1  6%  interrupts.CPU37=
.CAL:Function_call_interrupts
>>       2687 =C2=B1 51%   +1750.7%      49741 =C2=B1 14%  interrupts.CPU37=
.RES:Rescheduling_interrupts
>>       3844 =C2=B1 43%   +5162.3%     202325 =C2=B1  5%  interrupts.CPU38=
.CAL:Function_call_interrupts
>>       2550 =C2=B1 45%   +1849.5%      49724 =C2=B1 14%  interrupts.CPU38=
.RES:Rescheduling_interrupts
>>       3830 =C2=B1 41%   +5223.4%     203887 =C2=B1  6%  interrupts.CPU39=
.CAL:Function_call_interrupts
>>       2655 =C2=B1 60%   +1764.0%      49505 =C2=B1 14%  interrupts.CPU39=
.RES:Rescheduling_interrupts
>>       4259 =C2=B1 55%   +4997.8%     217159 =C2=B1  5%  interrupts.CPU4.=
CAL:Function_call_interrupts
>>       2189 =C2=B1 56%   +2159.5%      49480 =C2=B1 12%  interrupts.CPU4.=
RES:Rescheduling_interrupts
>>       3803 =C2=B1 41%   +5185.6%     201036 =C2=B1  6%  interrupts.CPU40=
.CAL:Function_call_interrupts
>>       1761 =C2=B1 31%   +2711.3%      49517 =C2=B1 14%  interrupts.CPU40=
.RES:Rescheduling_interrupts
>>       3911 =C2=B1 40%   +5034.2%     200833 =C2=B1  6%  interrupts.CPU41=
.CAL:Function_call_interrupts
>>       2847 =C2=B1 57%   +1629.9%      49259 =C2=B1 14%  interrupts.CPU41=
.RES:Rescheduling_interrupts
>>       3900 =C2=B1 42%   +5056.7%     201139 =C2=B1  6%  interrupts.CPU42=
.CAL:Function_call_interrupts
>>       2469 =C2=B1 58%   +1890.6%      49158 =C2=B1 13%  interrupts.CPU42=
.RES:Rescheduling_interrupts
>>       3866 =C2=B1 43%   +5149.0%     202933 =C2=B1  6%  interrupts.CPU43=
.CAL:Function_call_interrupts
>>       1781 =C2=B1 40%   +2682.9%      49572 =C2=B1 14%  interrupts.CPU43=
.RES:Rescheduling_interrupts
>>       3939 =C2=B1 44%   +5039.8%     202475 =C2=B1  6%  interrupts.CPU44=
.CAL:Function_call_interrupts
>>       2017 =C2=B1 67%   +2366.7%      49756 =C2=B1 13%  interrupts.CPU44=
.RES:Rescheduling_interrupts
>>       3964 =C2=B1 43%   +4940.1%     199824 =C2=B1  6%  interrupts.CPU45=
.CAL:Function_call_interrupts
>>       1626 =C2=B1 34%   +2957.4%      49713 =C2=B1 14%  interrupts.CPU45=
.RES:Rescheduling_interrupts
>>       3821 =C2=B1 43%   +5145.8%     200442 =C2=B1  6%  interrupts.CPU46=
.CAL:Function_call_interrupts
>>       1665 =C2=B1 46%   +2862.3%      49322 =C2=B1 13%  interrupts.CPU46=
.RES:Rescheduling_interrupts
>>       3889 =C2=B1 43%   +4990.6%     197974 =C2=B1  6%  interrupts.CPU47=
.CAL:Function_call_interrupts
>>       2447 =C2=B1 49%   +1914.5%      49300 =C2=B1 13%  interrupts.CPU47=
.RES:Rescheduling_interrupts
>>       4255 =C2=B1 59%   +4642.5%     201810 =C2=B1  6%  interrupts.CPU48=
.CAL:Function_call_interrupts
>>       2231 =C2=B1 40%   +2059.6%      48185 =C2=B1 15%  interrupts.CPU48=
.RES:Rescheduling_interrupts
>>       4322 =C2=B1 59%   +4576.0%     202110 =C2=B1  7%  interrupts.CPU49=
.CAL:Function_call_interrupts
>>       1896 =C2=B1 57%   +2425.7%      47904 =C2=B1 16%  interrupts.CPU49=
.RES:Rescheduling_interrupts
>>       4200 =C2=B1 50%   +5034.7%     215699 =C2=B1  5%  interrupts.CPU5.=
CAL:Function_call_interrupts
>>       2530 =C2=B1 61%   +1837.3%      49027 =C2=B1 12%  interrupts.CPU5.=
RES:Rescheduling_interrupts
>>       4224 =C2=B1 61%   +4714.4%     203377 =C2=B1  6%  interrupts.CPU50=
.CAL:Function_call_interrupts
>>       2272 =C2=B1 53%   +2009.7%      47951 =C2=B1 15%  interrupts.CPU50=
.RES:Rescheduling_interrupts
>>       4235 =C2=B1 58%   +4715.4%     203946 =C2=B1  7%  interrupts.CPU51=
.CAL:Function_call_interrupts
>>       2536 =C2=B1 42%   +1778.4%      47640 =C2=B1 16%  interrupts.CPU51=
.RES:Rescheduling_interrupts
>>       4161 =C2=B1 59%   +4766.0%     202504 =C2=B1  7%  interrupts.CPU52=
.CAL:Function_call_interrupts
>>       1890 =C2=B1 54%   +2429.5%      47816 =C2=B1 16%  interrupts.CPU52=
.RES:Rescheduling_interrupts
>>       4247 =C2=B1 58%   +4673.7%     202779 =C2=B1  6%  interrupts.CPU53=
.CAL:Function_call_interrupts
>>       2904 =C2=B1 50%   +1534.4%      47477 =C2=B1 16%  interrupts.CPU53=
.RES:Rescheduling_interrupts
>>       4295 =C2=B1 57%   +4595.2%     201683 =C2=B1  7%  interrupts.CPU54=
.CAL:Function_call_interrupts
>>       2110 =C2=B1 33%   +2145.2%      47378 =C2=B1 16%  interrupts.CPU54=
.RES:Rescheduling_interrupts
>>       4146 =C2=B1 59%   +4798.4%     203102 =C2=B1  7%  interrupts.CPU55=
.CAL:Function_call_interrupts
>>       2259 =C2=B1 34%   +2003.3%      47517 =C2=B1 16%  interrupts.CPU55=
.RES:Rescheduling_interrupts
>>       4204 =C2=B1 58%   +4734.8%     203285 =C2=B1  7%  interrupts.CPU56=
.CAL:Function_call_interrupts
>>       2229 =C2=B1 58%   +2045.6%      47824 =C2=B1 16%  interrupts.CPU56=
.RES:Rescheduling_interrupts
>>       4170 =C2=B1 59%   +4767.2%     203004 =C2=B1  7%  interrupts.CPU57=
.CAL:Function_call_interrupts
>>       2084 =C2=B1 56%   +2186.6%      47657 =C2=B1 16%  interrupts.CPU57=
.RES:Rescheduling_interrupts
>>       4210 =C2=B1 60%   +4741.1%     203817 =C2=B1  6%  interrupts.CPU58=
.CAL:Function_call_interrupts
>>       5631 =C2=B1 35%     +38.3%       7787 =C2=B1 20%  interrupts.CPU58=
.NMI:Non-maskable_interrupts
>>       5631 =C2=B1 35%     +38.3%       7787 =C2=B1 20%  interrupts.CPU58=
.PMI:Performance_monitoring_interrupts
>>       1643 =C2=B1 46%   +2786.5%      47448 =C2=B1 16%  interrupts.CPU58=
.RES:Rescheduling_interrupts
>>       4255 =C2=B1 60%   +4711.1%     204752 =C2=B1  7%  interrupts.CPU59=
.CAL:Function_call_interrupts
>>       2161 =C2=B1 40%   +2085.4%      47241 =C2=B1 16%  interrupts.CPU59=
.RES:Rescheduling_interrupts
>>       4298 =C2=B1 51%   +4854.5%     212967 =C2=B1  7%  interrupts.CPU6.=
CAL:Function_call_interrupts
>>       2083 =C2=B1 38%   +2209.0%      48096 =C2=B1 13%  interrupts.CPU6.=
RES:Rescheduling_interrupts
>>       4238 =C2=B1 60%   +4670.6%     202218 =C2=B1  7%  interrupts.CPU60=
.CAL:Function_call_interrupts
>>       2266 =C2=B1 52%   +1999.6%      47595 =C2=B1 16%  interrupts.CPU60=
.RES:Rescheduling_interrupts
>>       4256 =C2=B1 61%   +4655.9%     202443 =C2=B1  7%  interrupts.CPU61=
.CAL:Function_call_interrupts
>>       2921 =C2=B1 43%   +1539.0%      47874 =C2=B1 15%  interrupts.CPU61=
.RES:Rescheduling_interrupts
>>       4284 =C2=B1 60%   +4646.8%     203361 =C2=B1  7%  interrupts.CPU62=
.CAL:Function_call_interrupts
>>       2737 =C2=B1 56%   +1631.0%      47383 =C2=B1 16%  interrupts.CPU62=
.RES:Rescheduling_interrupts
>>       4266 =C2=B1 58%   +4641.7%     202303 =C2=B1  7%  interrupts.CPU63=
.CAL:Function_call_interrupts
>>       2016 =C2=B1 52%   +2262.9%      47655 =C2=B1 16%  interrupts.CPU63=
.RES:Rescheduling_interrupts
>>       4453 =C2=B1 60%   +4479.7%     203941 =C2=B1  6%  interrupts.CPU64=
.CAL:Function_call_interrupts
>>       2809 =C2=B1 26%   +1602.9%      47843 =C2=B1 15%  interrupts.CPU64=
.RES:Rescheduling_interrupts
>>       4299 =C2=B1 59%   +4620.0%     202913 =C2=B1  6%  interrupts.CPU65=
.CAL:Function_call_interrupts
>>       2187 =C2=B1 32%   +2057.8%      47208 =C2=B1 16%  interrupts.CPU65=
.RES:Rescheduling_interrupts
>>       4406 =C2=B1 57%   +4493.2%     202378 =C2=B1  7%  interrupts.CPU66=
.CAL:Function_call_interrupts
>>       2637 =C2=B1 42%   +1706.3%      47633 =C2=B1 15%  interrupts.CPU66=
.RES:Rescheduling_interrupts
>>       4397 =C2=B1 56%   +4546.7%     204353 =C2=B1  7%  interrupts.CPU67=
.CAL:Function_call_interrupts
>>       3138 =C2=B1 36%   +1419.8%      47699 =C2=B1 16%  interrupts.CPU67=
.RES:Rescheduling_interrupts
>>       4261 =C2=B1 60%   +4641.1%     202035 =C2=B1  7%  interrupts.CPU68=
.CAL:Function_call_interrupts
>>       1874 =C2=B1 50%   +2436.6%      47549 =C2=B1 16%  interrupts.CPU68=
.RES:Rescheduling_interrupts
>>       4159 =C2=B1 58%   +4755.4%     201944 =C2=B1  6%  interrupts.CPU69=
.CAL:Function_call_interrupts
>>       3127 =C2=B1 29%   +1417.0%      47441 =C2=B1 16%  interrupts.CPU69=
.RES:Rescheduling_interrupts
>>       4232 =C2=B1 53%   +4973.7%     214759 =C2=B1  5%  interrupts.CPU7.=
CAL:Function_call_interrupts
>>       2427 =C2=B1 54%   +1932.2%      49331 =C2=B1 12%  interrupts.CPU7.=
RES:Rescheduling_interrupts
>>       4317 =C2=B1 58%   +4589.3%     202460 =C2=B1  7%  interrupts.CPU70=
.CAL:Function_call_interrupts
>>       2882 =C2=B1 68%   +1544.4%      47402 =C2=B1 16%  interrupts.CPU70=
.RES:Rescheduling_interrupts
>>       4206 =C2=B1 57%   +4690.5%     201521 =C2=B1  6%  interrupts.CPU71=
.CAL:Function_call_interrupts
>>       2059 =C2=B1 31%   +2192.6%      47220 =C2=B1 16%  interrupts.CPU71=
.RES:Rescheduling_interrupts
>>       5897 =C2=B1 49%   +3199.1%     194573 =C2=B1  4%  interrupts.CPU72=
.CAL:Function_call_interrupts
>>       3160 =C2=B1 35%   +1487.7%      50174 =C2=B1 10%  interrupts.CPU72=
.RES:Rescheduling_interrupts
>>       6303 =C2=B1 43%   +2959.1%     192823 =C2=B1  6%  interrupts.CPU73=
.CAL:Function_call_interrupts
>>       2707 =C2=B1 29%   +1706.9%      48916 =C2=B1  9%  interrupts.CPU73=
.RES:Rescheduling_interrupts
>>       6229 =C2=B1 42%   +3036.2%     195381 =C2=B1  4%  interrupts.CPU74=
.CAL:Function_call_interrupts
>>       2958 =C2=B1 29%   +1588.0%      49930 =C2=B1 10%  interrupts.CPU74=
.RES:Rescheduling_interrupts
>>       6316 =C2=B1 43%   +3028.5%     197612 =C2=B1  4%  interrupts.CPU75=
.CAL:Function_call_interrupts
>>       2711 =C2=B1 39%   +1734.6%      49734 =C2=B1 10%  interrupts.CPU75=
.RES:Rescheduling_interrupts
>>       6326 =C2=B1 44%   +2977.5%     194700 =C2=B1  4%  interrupts.CPU76=
.CAL:Function_call_interrupts
>>       3461 =C2=B1 25%   +1337.3%      49756 =C2=B1 10%  interrupts.CPU76=
.RES:Rescheduling_interrupts
>>       6321 =C2=B1 42%   +2973.2%     194282 =C2=B1  5%  interrupts.CPU77=
.CAL:Function_call_interrupts
>>       2726 =C2=B1 41%   +1714.9%      49482 =C2=B1 10%  interrupts.CPU77=
.RES:Rescheduling_interrupts
>>       6242 =C2=B1 43%   +3038.1%     195890 =C2=B1  5%  interrupts.CPU78=
.CAL:Function_call_interrupts
>>       2930 =C2=B1 47%   +1581.9%      49282 =C2=B1 10%  interrupts.CPU78=
.RES:Rescheduling_interrupts
>>       6299 =C2=B1 43%   +3005.7%     195630 =C2=B1  4%  interrupts.CPU79=
.CAL:Function_call_interrupts
>>       3306 =C2=B1 53%   +1401.3%      49644 =C2=B1 10%  interrupts.CPU79=
.RES:Rescheduling_interrupts
>>       4346 =C2=B1 49%   +4862.7%     215685 =C2=B1  5%  interrupts.CPU8.=
CAL:Function_call_interrupts
>>       2393 =C2=B1 32%   +1960.5%      49315 =C2=B1 12%  interrupts.CPU8.=
RES:Rescheduling_interrupts
>>       6357 =C2=B1 43%   +2978.7%     195728 =C2=B1  4%  interrupts.CPU80=
.CAL:Function_call_interrupts
>>       2917 =C2=B1 34%   +1602.5%      49665 =C2=B1 10%  interrupts.CPU80=
.RES:Rescheduling_interrupts
>>       6358 =C2=B1 43%   +2984.8%     196154 =C2=B1  4%  interrupts.CPU81=
.CAL:Function_call_interrupts
>>       3319 =C2=B1 29%   +1395.8%      49646 =C2=B1 10%  interrupts.CPU81=
.RES:Rescheduling_interrupts
>>       6258 =C2=B1 43%   +3019.1%     195203 =C2=B1  5%  interrupts.CPU82=
.CAL:Function_call_interrupts
>>       3142 =C2=B1 46%   +1478.9%      49612 =C2=B1 10%  interrupts.CPU82=
.RES:Rescheduling_interrupts
>>       6443 =C2=B1 44%   +2958.3%     197053 =C2=B1  4%  interrupts.CPU83=
.CAL:Function_call_interrupts
>>       2678 =C2=B1 51%   +1743.7%      49387 =C2=B1 10%  interrupts.CPU83=
.RES:Rescheduling_interrupts
>>       6273 =C2=B1 44%   +3004.0%     194737 =C2=B1  4%  interrupts.CPU84=
.CAL:Function_call_interrupts
>>       3205 =C2=B1 57%   +1448.1%      49625 =C2=B1 10%  interrupts.CPU84=
.RES:Rescheduling_interrupts
>>       6345 =C2=B1 44%   +2861.5%     187923 =C2=B1  9%  interrupts.CPU85=
.CAL:Function_call_interrupts
>>       2984 =C2=B1 48%   +1497.8%      47681 =C2=B1 14%  interrupts.CPU85=
.RES:Rescheduling_interrupts
>>       6227 =C2=B1 43%   +3050.2%     196160 =C2=B1  4%  interrupts.CPU86=
.CAL:Function_call_interrupts
>>       3442 =C2=B1 24%   +1342.2%      49643 =C2=B1 10%  interrupts.CPU86=
.RES:Rescheduling_interrupts
>>       6385 =C2=B1 44%   +2944.4%     194389 =C2=B1  4%  interrupts.CPU87=
.CAL:Function_call_interrupts
>>       3299 =C2=B1 36%   +1396.9%      49387 =C2=B1 10%  interrupts.CPU87=
.RES:Rescheduling_interrupts
>>       6432 =C2=B1 43%   +2969.7%     197465 =C2=B1  5%  interrupts.CPU88=
.CAL:Function_call_interrupts
>>       3578 =C2=B1 43%   +1284.0%      49527 =C2=B1 10%  interrupts.CPU88=
.RES:Rescheduling_interrupts
>>       6263 =C2=B1 44%   +3012.8%     194967 =C2=B1  4%  interrupts.CPU89=
.CAL:Function_call_interrupts
>>       2479 =C2=B1 49%   +1895.0%      49465 =C2=B1 10%  interrupts.CPU89=
.RES:Rescheduling_interrupts
>>       4242 =C2=B1 51%   +4946.7%     214099 =C2=B1  5%  interrupts.CPU9.=
CAL:Function_call_interrupts
>>       2584 =C2=B1 36%   +1814.6%      49484 =C2=B1 12%  interrupts.CPU9.=
RES:Rescheduling_interrupts
>>       6479 =C2=B1 43%   +2884.4%     193363 =C2=B1  4%  interrupts.CPU90=
.CAL:Function_call_interrupts
>>       3014 =C2=B1 44%   +1542.1%      49491 =C2=B1 10%  interrupts.CPU90=
.RES:Rescheduling_interrupts
>>       6406 =C2=B1 44%   +2968.7%     196586 =C2=B1  4%  interrupts.CPU91=
.CAL:Function_call_interrupts
>>       3035 =C2=B1 49%   +1534.7%      49614 =C2=B1 10%  interrupts.CPU91=
.RES:Rescheduling_interrupts
>>       6361 =C2=B1 43%   +2980.5%     195973 =C2=B1  5%  interrupts.CPU92=
.CAL:Function_call_interrupts
>>       2818 =C2=B1 42%   +1661.2%      49641 =C2=B1 10%  interrupts.CPU92=
.RES:Rescheduling_interrupts
>>       6369 =C2=B1 43%   +2947.5%     194095 =C2=B1  4%  interrupts.CPU93=
.CAL:Function_call_interrupts
>>       3916 =C2=B1 38%   +1164.0%      49499 =C2=B1 10%  interrupts.CPU93=
.RES:Rescheduling_interrupts
>>       6457 =C2=B1 44%   +2927.1%     195472 =C2=B1  4%  interrupts.CPU94=
.CAL:Function_call_interrupts
>>       2911 =C2=B1 33%   +1597.4%      49424 =C2=B1 10%  interrupts.CPU94=
.RES:Rescheduling_interrupts
>>       6452 =C2=B1 44%   +2898.0%     193430 =C2=B1  4%  interrupts.CPU95=
.CAL:Function_call_interrupts
>>       2949 =C2=B1 36%   +1567.0%      49161 =C2=B1 10%  interrupts.CPU95=
.RES:Rescheduling_interrupts
>>       4536 =C2=B1 58%   +4436.2%     205770 =C2=B1  5%  interrupts.CPU96=
.CAL:Function_call_interrupts
>>       3100 =C2=B1 52%   +1387.5%      46115 =C2=B1 15%  interrupts.CPU96=
.RES:Rescheduling_interrupts
>>       4475 =C2=B1 55%   +4697.3%     214709 =C2=B1  6%  interrupts.CPU97=
.CAL:Function_call_interrupts
>>       1921 =C2=B1 39%   +2399.4%      48013 =C2=B1 13%  interrupts.CPU97=
.RES:Rescheduling_interrupts
>>       4606 =C2=B1 55%   +4454.2%     209780 =C2=B1  8%  interrupts.CPU98=
.CAL:Function_call_interrupts
>>       2177 =C2=B1 41%   +2049.1%      46800 =C2=B1 18%  interrupts.CPU98=
.RES:Rescheduling_interrupts
>>       4457 =C2=B1 55%   +4744.4%     215945 =C2=B1  5%  interrupts.CPU99=
.CAL:Function_call_interrupts
>>       2576 =C2=B1 37%   +1767.7%      48126 =C2=B1 12%  interrupts.CPU99=
.RES:Rescheduling_interrupts
>>       2949 =C2=B1 14%    +213.1%       9236        interrupts.IWI:IRQ_wo=
rk_interrupts
>>     471799 =C2=B1 22%   +1865.5%    9273438 =C2=B1 11%  interrupts.RES:R=
escheduling_interrupts
>>      96.09           -18.5       77.54        perf-profile.calltrace.cyc=
les-pp.entry_SYSCALL_64_after_hwframe
>>      87.16           -10.5       76.63        perf-profile.calltrace.cyc=
les-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>      64.87            -8.9       55.99        perf-profile.calltrace.cyc=
les-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>      64.62            -8.7       55.94        perf-profile.calltrace.cyc=
les-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>>      63.28            -7.7       55.54        perf-profile.calltrace.cyc=
les-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>>       8.03            -7.3        0.76        perf-profile.calltrace.cyc=
les-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
>>       7.45            -7.2        0.26 =C2=B1100%  perf-profile.calltrac=
e.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCA=
LL_64_after_hwframe
>>      62.18            -6.8       55.34        perf-profile.calltrace.cyc=
les-pp.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
>>      60.69            -5.7       55.03        perf-profile.calltrace.cyc=
les-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_s=
endto
>>       7.35            -5.3        2.00        perf-profile.calltrace.cyc=
les-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_del=
iver_rcu
>>       5.15            -5.2        0.00        perf-profile.calltrace.cyc=
les-pp.schedule.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_S=
YSCALL_64_after_hwframe
>>       5.38 =C2=B1  2%      -4.2        1.18        perf-profile.calltrac=
e.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit.__=
tcp_transmit_skb
>>       4.58            -3.1        1.43        perf-profile.calltrace.cyc=
les-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4=
_rcv
>>       3.57            -2.7        0.83        perf-profile.calltrace.cyc=
les-pp.sk_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sy=
s_sendto
>>       3.19            -2.4        0.79        perf-profile.calltrace.cyc=
les-pp.__alloc_skb.sk_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_=
sendmsg
>>       2.93 =C2=B1  5%      -2.2        0.73 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.ip_=
output.__ip_queue_xmit
>>       2.67            -1.9        0.75        perf-profile.calltrace.cyc=
les-pp.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg._=
_sys_recvfrom
>>       2.51 =C2=B1  6%      -1.9        0.63 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip_fini=
sh_output2.ip_output
>>       2.54            -1.8        0.74        perf-profile.calltrace.cyc=
les-pp.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_re=
cvmsg.inet_recvmsg
>>       2.60 =C2=B1  2%      -1.7        0.87        perf-profile.calltrac=
e.cycles-pp.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_r=
ecvfrom
>>       2.35 =C2=B1  2%      -1.6        0.77        perf-profile.calltrac=
e.cycles-pp.skb_release_all.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet=
_recvmsg
>>       2.28 =C2=B1  2%      -1.6        0.72 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.skb_release_head_state.skb_release_all.__kfree_skb.tcp_rec=
vmsg_locked.tcp_recvmsg
>>      21.76            -1.3       20.51        perf-profile.calltrace.cyc=
les-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>      21.48            -1.0       20.46        perf-profile.calltrace.cyc=
les-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>>       1.28 =C2=B1  2%      -0.6        0.68        perf-profile.calltrac=
e.cycles-pp.__kfree_skb.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp=
_v4_do_rcv
>>       1.24            -0.5        0.69        perf-profile.calltrace.cyc=
les-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.wait_woken
>>       1.75            +0.1        1.88 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.select_task_rq_fair.try_to_wake_up.__wake_up_common.__wake_up_c=
ommon_lock.sock_def_readable
>>      19.43            +0.4       19.87        perf-profile.calltrace.cyc=
les-pp.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscal=
l_64
>>       0.00            +0.5        0.53        perf-profile.calltrace.cyc=
les-pp.set_next_entity.pick_next_task_fair.__schedule.schedule_idle.do_idle
>>       0.00            +0.6        0.60        perf-profile.calltrace.cyc=
les-pp.pick_next_task_fair.__schedule.schedule_idle.do_idle.cpu_startup_ent=
ry
>>       0.00            +0.7        0.68        perf-profile.calltrace.cyc=
les-pp.available_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wa=
ke_up.__wake_up_common
>>      18.12            +1.4       19.57        perf-profile.calltrace.cyc=
les-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys=
_recvfrom
>>       0.00            +1.5        1.45 =C2=B1  2%  perf-profile.calltrac=
e.cycles-pp.select_idle_sibling.select_task_rq_fair.try_to_wake_up.__wake_u=
p_common.__wake_up_common_lock
>>      50.97            +1.5       52.49        perf-profile.calltrace.cyc=
les-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendms=
g.__sys_sendto
>>      50.63            +1.8       52.45        perf-profile.calltrace.cyc=
les-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_send=
msg.sock_sendmsg
>>       0.00            +2.4        2.38        perf-profile.calltrace.cyc=
les-pp.update_cfs_group.enqueue_entity.enqueue_task_fair.ttwu_do_activate.t=
ry_to_wake_up
>>       0.00            +2.7        2.66        perf-profile.calltrace.cyc=
les-pp.update_cfs_group.dequeue_entity.dequeue_task_fair.__schedule.schedule
>>       0.35 =C2=B1 70%      +3.9        4.20        perf-profile.calltrac=
e.cycles-pp.update_load_avg.dequeue_entity.dequeue_task_fair.__schedule.sch=
edule
>>       0.00            +4.1        4.07        perf-profile.calltrace.cyc=
les-pp.update_cfs_group.enqueue_task_fair.ttwu_do_activate.try_to_wake_up._=
_wake_up_common
>>       0.00            +4.2        4.18        perf-profile.calltrace.cyc=
les-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.schedule_time=
out
>>      47.09            +4.7       51.79        perf-profile.calltrace.cyc=
les-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_send=
msg_locked.tcp_sendmsg
>>       0.44 =C2=B1 44%      +5.5        5.91        perf-profile.calltrac=
e.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.ttwu_do_activa=
te.try_to_wake_up
>>       1.59            +5.8        7.36        perf-profile.calltrace.cyc=
les-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
>>      10.49            +6.4       16.92        perf-profile.calltrace.cyc=
les-pp.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvf=
rom
>>       0.00            +6.6        6.60        perf-profile.calltrace.cyc=
les-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__schedule.schedule_=
idle.do_idle
>>       0.00            +6.7        6.66        perf-profile.calltrace.cyc=
les-pp._raw_spin_lock.__schedule.schedule_idle.do_idle.cpu_startup_entry
>>       0.00            +6.8        6.80        perf-profile.calltrace.cyc=
les-pp.set_task_cpu.try_to_wake_up.__wake_up_common.__wake_up_common_lock.s=
ock_def_readable
>>       1.95            +6.9        8.83        perf-profile.calltrace.cyc=
les-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.__w=
ake_up_common
>>       8.86            +7.0       15.86        perf-profile.calltrace.cyc=
les-pp.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
>>       8.45            +7.1       15.50        perf-profile.calltrace.cyc=
les-pp.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recv=
msg
>>       8.21            +7.2       15.38        perf-profile.calltrace.cyc=
les-pp.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>>       7.95            +7.3       15.21        perf-profile.calltrace.cyc=
les-pp.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_data
>>      42.82            +7.9       50.74        perf-profile.calltrace.cyc=
les-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending=
_frames.tcp_sendmsg_locked
>>       0.00            +8.2        8.22        perf-profile.calltrace.cyc=
les-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>>       0.00            +8.2        8.24        perf-profile.calltrace.cyc=
les-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_st=
artup_64_no_verify
>>       3.24 =C2=B1  2%      +8.7       11.97        perf-profile.calltrac=
e.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.wait_wok=
en
>>       3.64            +9.7       13.38        perf-profile.calltrace.cyc=
les-pp.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_common_lo=
ck.sock_def_readable
>>       3.56            +9.8       13.35        perf-profile.calltrace.cyc=
les-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.__wake_up_common._=
_wake_up_common_lock
>>      40.32           +10.0       50.33        perf-profile.calltrace.cyc=
les-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_pu=
sh_pending_frames
>>       0.00           +11.8       11.78        perf-profile.calltrace.cyc=
les-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_ent=
ry
>>      38.07           +11.9       49.97        perf-profile.calltrace.cyc=
les-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_w=
rite_xmit
>>       0.00           +12.3       12.28        perf-profile.calltrace.cyc=
les-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_se=
condary
>>       0.00           +12.3       12.29        perf-profile.calltrace.cyc=
les-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_st=
artup_64_no_verify
>>      31.75           +16.9       48.60        perf-profile.calltrace.cyc=
les-pp.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_queue_xmit.__t=
cp_transmit_skb
>>      31.43           +17.1       48.56        perf-profile.calltrace.cyc=
les-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_que=
ue_xmit
>>       0.00           +17.5       17.49        perf-profile.calltrace.cyc=
les-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.__wak=
e_up_common.__wake_up_common_lock
>>      30.92           +17.5       48.45        perf-profile.calltrace.cyc=
les-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip_finish_=
output2.ip_output
>>       0.00           +17.7       17.71        perf-profile.calltrace.cyc=
les-pp._raw_spin_lock.try_to_wake_up.__wake_up_common.__wake_up_common_lock=
.sock_def_readable
>>      29.41           +18.6       48.06        perf-profile.calltrace.cyc=
les-pp.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_enable=
_ip.ip_finish_output2
>>      28.60           +19.3       47.92        perf-profile.calltrace.cyc=
les-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_softirq.__loc=
al_bh_enable_ip
>>      28.40           +19.4       47.85        perf-profile.calltrace.cyc=
les-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_text_start.=
do_softirq
>>      27.30           +20.4       47.65        perf-profile.calltrace.cyc=
les-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_acti=
on.__softirqentry_text_start
>>       0.00           +21.4       21.36        perf-profile.calltrace.cyc=
les-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_ve=
rify
>>       0.00           +21.4       21.38        perf-profile.calltrace.cyc=
les-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>>       0.00           +21.4       21.38        perf-profile.calltrace.cyc=
les-pp.start_secondary.secondary_startup_64_no_verify
>>      25.94           +21.5       47.45        perf-profile.calltrace.cyc=
les-pp.ip_rcv.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_=
rx_action
>>       0.00           +21.5       21.50        perf-profile.calltrace.cyc=
les-pp.secondary_startup_64_no_verify
>>      24.16           +23.0       47.18        perf-profile.calltrace.cyc=
les-pp.ip_local_deliver.ip_rcv.__netif_receive_skb_one_core.process_backlog=
.__napi_poll
>>      23.96           +23.2       47.16        perf-profile.calltrace.cyc=
les-pp.ip_local_deliver_finish.ip_local_deliver.ip_rcv.__netif_receive_skb_=
one_core.process_backlog
>>      23.82           +23.3       47.14        perf-profile.calltrace.cyc=
les-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.ip_=
rcv.__netif_receive_skb_one_core
>>      23.39           +23.7       47.07        perf-profile.calltrace.cyc=
les-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_=
deliver.ip_rcv
>>      19.51           +26.1       45.65        perf-profile.calltrace.cyc=
les-pp.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_fi=
nish.ip_local_deliver
>>      18.96           +26.6       45.57        perf-profile.calltrace.cyc=
les-pp.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu=
.ip_local_deliver_finish
>>       7.91           +33.9       41.80        perf-profile.calltrace.cyc=
les-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_rcv_est=
ablished.tcp_v4_do_rcv
>>       8.63           +34.0       42.61        perf-profile.calltrace.cyc=
les-pp.sock_def_readable.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_pr=
otocol_deliver_rcu
>>       7.61           +34.0       41.64        perf-profile.calltrace.cyc=
les-pp.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_reada=
ble.tcp_rcv_established
>>       8.21           +34.2       42.41        perf-profile.calltrace.cyc=
les-pp.__wake_up_common_lock.sock_def_readable.tcp_rcv_established.tcp_v4_d=
o_rcv.tcp_v4_rcv
>>      96.13           -18.5       77.59        perf-profile.children.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>>      87.19           -10.5       76.67        perf-profile.children.cycl=
es-pp.do_syscall_64
>>      64.91            -8.9       56.00        perf-profile.children.cycl=
es-pp.__x64_sys_sendto
>>      64.64            -8.7       55.95        perf-profile.children.cycl=
es-pp.__sys_sendto
>>      63.32            -7.8       55.54        perf-profile.children.cycl=
es-pp.sock_sendmsg
>>       8.07            -7.3        0.76        perf-profile.children.cycl=
es-pp.syscall_exit_to_user_mode
>>       7.55            -7.0        0.52 =C2=B1  2%  perf-profile.children=
.cycles-pp.exit_to_user_mode_prepare
>>      62.25            -6.9       55.35        perf-profile.children.cycl=
es-pp.tcp_sendmsg
>>      60.76            -5.7       55.04        perf-profile.children.cycl=
es-pp.tcp_sendmsg_locked
>>       7.45            -5.4        2.02        perf-profile.children.cycl=
es-pp.tcp_ack
>>       5.39 =C2=B1  2%      -4.2        1.18        perf-profile.children=
.cycles-pp.__dev_queue_xmit
>>       4.67            -3.2        1.44        perf-profile.children.cycl=
es-pp.tcp_clean_rtx_queue
>>       3.58            -2.7        0.84        perf-profile.children.cycl=
es-pp.sk_stream_alloc_skb
>>       3.24            -2.4        0.80        perf-profile.children.cycl=
es-pp.__alloc_skb
>>       3.89 =C2=B1  2%      -2.3        1.55        perf-profile.children=
.cycles-pp.__kfree_skb
>>       2.94 =C2=B1  5%      -2.2        0.73 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.dev_hard_start_xmit
>>       3.38            -2.1        1.32        perf-profile.children.cycl=
es-pp.pick_next_task_fair
>>       2.68            -1.9        0.75        perf-profile.children.cycl=
es-pp.skb_copy_datagram_iter
>>       2.52 =C2=B1  6%      -1.9        0.63 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.loopback_xmit
>>       2.50            -1.9        0.62 =C2=B1  2%  perf-profile.children=
.cycles-pp.update_curr
>>       2.56            -1.8        0.74        perf-profile.children.cycl=
es-pp.__skb_datagram_iter
>>       2.31            -1.8        0.55        perf-profile.children.cycl=
es-pp.switch_mm_irqs_off
>>       2.57 =C2=B1  2%      -1.7        0.84        perf-profile.children=
.cycles-pp.skb_release_all
>>       2.48 =C2=B1  2%      -1.7        0.81        perf-profile.children=
.cycles-pp.skb_release_head_state
>>       1.89 =C2=B1  3%      -1.4        0.48        perf-profile.children=
.cycles-pp.dst_release
>>       1.81 =C2=B1  2%      -1.4        0.42 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.ktime_get
>>       1.57            -1.4        0.21 =C2=B1  3%  perf-profile.children=
.cycles-pp.load_new_mm_cr3
>>       1.48 =C2=B1  4%      -1.3        0.19 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.tcp_send_mss
>>      21.79            -1.3       20.51        perf-profile.children.cycl=
es-pp.__x64_sys_recvfrom
>>       1.62            -1.2        0.40 =C2=B1  3%  perf-profile.children=
.cycles-pp.switch_fpu_return
>>       1.37 =C2=B1  5%      -1.2        0.17 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.tcp_current_mss
>>       1.44            -1.1        0.34 =C2=B1  2%  perf-profile.children=
.cycles-pp.__cgroup_bpf_run_filter_skb
>>      21.51            -1.0       20.47        perf-profile.children.cycl=
es-pp.__sys_recvfrom
>>       1.25            -1.0        0.23 =C2=B1  2%  perf-profile.children=
.cycles-pp.tcp_mstamp_refresh
>>       1.24            -1.0        0.22 =C2=B1  3%  perf-profile.children=
.cycles-pp.sk_filter_trim_cap
>>       1.21 =C2=B1 14%      -1.0        0.20 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.netif_rx
>>       1.16 =C2=B1 14%      -1.0        0.19 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.netif_rx_internal
>>       1.11 =C2=B1  7%      -1.0        0.14 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.ip_rcv_finish
>>       1.22 =C2=B1  2%      -1.0        0.26 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.kmalloc_reserve
>>       1.58            -1.0        0.62        perf-profile.children.cycl=
es-pp.lock_sock_nested
>>       1.21 =C2=B1  2%      -0.9        0.30        perf-profile.children=
.cycles-pp.reweight_entity
>>       0.97 =C2=B1  7%      -0.9        0.07 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__sk_dst_check
>>       1.13            -0.9        0.24 =C2=B1  2%  perf-profile.children=
.cycles-pp.sched_clock_cpu
>>       1.20            -0.9        0.30        perf-profile.children.cycl=
es-pp._copy_to_iter
>>       1.01            -0.9        0.14 =C2=B1  3%  perf-profile.children=
.cycles-pp.tcp_schedule_loss_probe
>>       0.93 =C2=B1  8%      -0.8        0.10 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.ip_rcv_finish_core
>>       0.97 =C2=B1 10%      -0.8        0.15 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__netif_receive_skb_core
>>       1.04 =C2=B1  3%      -0.8        0.22        perf-profile.children=
.cycles-pp.__kmalloc_node_track_caller
>>       1.15            -0.8        0.34 =C2=B1  2%  perf-profile.children=
.cycles-pp.release_sock
>>       1.11            -0.8        0.33        perf-profile.children.cycl=
es-pp.__check_object_size
>>       1.22            -0.8        0.46        perf-profile.children.cycl=
es-pp.sockfd_lookup_light
>>       1.03 =C2=B1  2%      -0.8        0.27 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp._copy_from_iter_full
>>       0.93            -0.8        0.18 =C2=B1  4%  perf-profile.children=
.cycles-pp.irqtime_account_irq
>>       0.92 =C2=B1 10%      -0.7        0.18 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.read_tsc
>>       0.95            -0.7        0.20 =C2=B1  2%  perf-profile.children=
.cycles-pp.sched_clock
>>       0.89            -0.7        0.15 =C2=B1  3%  perf-profile.children=
.cycles-pp.syscall_return_via_sysret
>>       0.82 =C2=B1 12%      -0.7        0.09 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.ipv4_dst_check
>>       0.80 =C2=B1 10%      -0.7        0.07 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.ipv4_mtu
>>       1.33            -0.7        0.60        perf-profile.children.cycl=
es-pp._raw_spin_lock_bh
>>       0.91            -0.7        0.19 =C2=B1  3%  perf-profile.children=
.cycles-pp.native_sched_clock
>>       0.96 =C2=B1  2%      -0.7        0.26 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.tcp_event_new_data_sent
>>       1.11            -0.7        0.42 =C2=B1  3%  perf-profile.children=
.cycles-pp.__switch_to_asm
>>       0.78            -0.7        0.10        perf-profile.children.cycl=
es-pp.pick_next_entity
>>       0.80            -0.7        0.14 =C2=B1  5%  perf-profile.children=
.cycles-pp.kmem_cache_alloc_node
>>       0.81            -0.7        0.15 =C2=B1  3%  perf-profile.children=
.cycles-pp.___might_sleep
>>       0.72            -0.6        0.08 =C2=B1  4%  perf-profile.children=
.cycles-pp.copy_fpregs_to_fpstate
>>       0.75            -0.6        0.12 =C2=B1  3%  perf-profile.children=
.cycles-pp.__might_sleep
>>       0.78 =C2=B1  2%      -0.6        0.17 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__update_load_avg_se
>>       0.82            -0.6        0.23        perf-profile.children.cycl=
es-pp.ip_finish_output
>>       0.92 =C2=B1  2%      -0.6        0.34 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__fget_light
>>       0.77            -0.6        0.21 =C2=B1  2%  perf-profile.children=
.cycles-pp.ttwu_do_wakeup
>>       0.58 =C2=B1  4%      -0.6        0.03 =C2=B1 99%  perf-profile.chi=
ldren.cycles-pp.__might_fault
>>       0.76            -0.5        0.23        perf-profile.children.cycl=
es-pp.simple_copy_to_iter
>>       0.72            -0.5        0.20        perf-profile.children.cycl=
es-pp.validate_xmit_skb
>>       0.60 =C2=B1  3%      -0.5        0.08        perf-profile.children=
.cycles-pp.tcp_ack_update_rtt
>>       0.65 =C2=B1  3%      -0.5        0.13 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.enqueue_to_backlog
>>       0.83 =C2=B1  2%      -0.5        0.31 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.aa_sk_perm
>>       0.71            -0.5        0.20        perf-profile.children.cycl=
es-pp.check_preempt_curr
>>       0.73            -0.5        0.23 =C2=B1  2%  perf-profile.children=
.cycles-pp.__update_load_avg_cfs_rq
>>       0.90 =C2=B1  2%      -0.5        0.41 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__inet_lookup_established
>>       0.77 =C2=B1  2%      -0.5        0.29        perf-profile.children=
.cycles-pp.tcp_rcv_space_adjust
>>       0.77            -0.5        0.28        perf-profile.children.cycl=
es-pp.__switch_to
>>       0.61 =C2=B1  4%      -0.5        0.12 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__virt_addr_valid
>>       0.54 =C2=B1  3%      -0.5        0.07 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__calc_delta
>>       0.53            -0.4        0.10 =C2=B1  3%  perf-profile.children=
.cycles-pp.ip_local_out
>>       0.53 =C2=B1  2%      -0.4        0.11 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.security_socket_sendmsg
>>       0.82            -0.4        0.41        perf-profile.children.cycl=
es-pp.skb_release_data
>>       0.58            -0.4        0.17 =C2=B1  5%  perf-profile.children=
.cycles-pp.__ksize
>>       0.55 =C2=B1  2%      -0.4        0.16 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.___perf_sw_event
>>       0.66 =C2=B1  2%      -0.4        0.29 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.sk_reset_timer
>>       0.45            -0.4        0.08        perf-profile.children.cycl=
es-pp.ip_rcv_core
>>       0.46            -0.4        0.09 =C2=B1  5%  perf-profile.children=
.cycles-pp.__ip_local_out
>>       0.45 =C2=B1  3%      -0.3        0.11 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.kfree
>>       0.40            -0.3        0.07 =C2=B1  5%  perf-profile.children=
.cycles-pp.__entry_text_start
>>       0.48 =C2=B1  5%      -0.3        0.15 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.copyin
>>       0.39            -0.3        0.06 =C2=B1  6%  perf-profile.children=
.cycles-pp.tcp_update_pacing_rate
>>       0.40            -0.3        0.08 =C2=B1  6%  perf-profile.children=
.cycles-pp.copy_user_enhanced_fast_string
>>       0.41 =C2=B1  2%      -0.3        0.08 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__list_del_entry_valid
>>       0.68            -0.3        0.36        perf-profile.children.cycl=
es-pp.__skb_clone
>>       0.56            -0.3        0.24 =C2=B1  2%  perf-profile.children=
.cycles-pp.sock_recvmsg
>>       0.41 =C2=B1  2%      -0.3        0.10 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__cond_resched
>>       0.53 =C2=B1  2%      -0.3        0.23 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.skb_entail
>>       0.52            -0.3        0.23 =C2=B1  2%  perf-profile.children=
.cycles-pp.copyout
>>       0.51            -0.3        0.23 =C2=B1  2%  perf-profile.children=
.cycles-pp.security_socket_recvmsg
>>       0.53 =C2=B1  2%      -0.3        0.27 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.mod_timer
>>       0.35 =C2=B1  3%      -0.3        0.09 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.cpuacct_charge
>>       0.50            -0.3        0.23 =C2=B1  3%  perf-profile.children=
.cycles-pp.copy_user_generic_unrolled
>>       0.33 =C2=B1  4%      -0.3        0.07        perf-profile.children=
.cycles-pp.migrate_enable
>>       0.49            -0.3        0.24 =C2=B1  3%  perf-profile.children=
.cycles-pp.tcp_wfree
>>       0.35 =C2=B1  5%      -0.2        0.10 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.tcp_rearm_rto
>>       0.39 =C2=B1  4%      -0.2        0.15 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.cpumask_next_wrap
>>       0.30            -0.2        0.07 =C2=B1  7%  perf-profile.children=
.cycles-pp.migrate_disable
>>       0.31            -0.2        0.08 =C2=B1  4%  perf-profile.children=
.cycles-pp.import_single_range
>>       0.34 =C2=B1  2%      -0.2        0.11 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.update_min_vruntime
>>       0.30 =C2=B1  2%      -0.2        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.tcp_update_skb_after_send
>>       0.28 =C2=B1  2%      -0.2        0.05 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.skb_clone
>>       0.27 =C2=B1  2%      -0.2        0.05 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.security_sock_rcv_skb
>>       0.27            -0.2        0.06        perf-profile.children.cycl=
es-pp.rcu_nocb_flush_deferred_wakeup
>>       0.53            -0.2        0.32 =C2=B1  3%  perf-profile.children=
.cycles-pp.perf_trace_sched_wakeup_template
>>       0.26            -0.2        0.06        perf-profile.children.cycl=
es-pp.__x86_indirect_thunk_rax
>>       0.31 =C2=B1  3%      -0.2        0.11 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.netif_skb_features
>>       0.26 =C2=B1  2%      -0.2        0.06        perf-profile.children=
.cycles-pp.__tcp_select_window
>>       0.25 =C2=B1  2%      -0.2        0.05 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.tcp_established_options
>>       0.30 =C2=B1  2%      -0.2        0.11 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.tcp_event_data_recv
>>       0.37            -0.2        0.18 =C2=B1  2%  perf-profile.children=
.cycles-pp.tcp_queue_rcv
>>       0.23            -0.2        0.05        perf-profile.children.cycl=
es-pp.bictcp_cwnd_event
>>       0.23 =C2=B1  2%      -0.2        0.06 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.tcp_v4_fill_cb
>>       0.23 =C2=B1  2%      -0.2        0.05        perf-profile.children=
.cycles-pp.rb_insert_color
>>       0.27            -0.2        0.09 =C2=B1  4%  perf-profile.children=
.cycles-pp.syscall_exit_to_user_mode_prepare
>>       0.25            -0.2        0.08 =C2=B1  4%  perf-profile.children=
.cycles-pp.ip_send_check
>>       0.25 =C2=B1  3%      -0.2        0.08 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.tcp_release_cb
>>       0.23 =C2=B1  2%      -0.2        0.06 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.rcu_all_qs
>>       0.20 =C2=B1  7%      -0.2        0.05 =C2=B1 45%  perf-profile.chi=
ldren.cycles-pp.clockevents_program_event
>>       0.26            -0.2        0.11 =C2=B1  3%  perf-profile.children=
.cycles-pp.__copy_skb_header
>>       0.27            -0.2        0.12 =C2=B1  3%  perf-profile.children=
.cycles-pp.__enqueue_entity
>>       0.32 =C2=B1  3%      -0.1        0.17 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.sock_rfree
>>       0.59            -0.1        0.45 =C2=B1  2%  perf-profile.children=
.cycles-pp.update_rq_clock
>>       0.40 =C2=B1  5%      -0.1        0.26 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.sk_page_frag_refill
>>       0.23            -0.1        0.10 =C2=B1  4%  perf-profile.children=
.cycles-pp.tcp_check_space
>>       0.27 =C2=B1  2%      -0.1        0.14 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.perf_tp_event
>>       0.19 =C2=B1  3%      -0.1        0.06 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.rb_next
>>       0.19 =C2=B1  5%      -0.1        0.06        perf-profile.children=
.cycles-pp.tcp_v4_inbound_md5_hash
>>       0.18 =C2=B1  3%      -0.1        0.06        perf-profile.children=
.cycles-pp.tcp_options_write
>>       0.20            -0.1        0.09 =C2=B1  5%  perf-profile.children=
.cycles-pp.__build_skb_around
>>       0.27 =C2=B1  2%      -0.1        0.16 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.add_wait_queue
>>       0.27 =C2=B1  2%      -0.1        0.17 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp._find_next_bit
>>       0.15 =C2=B1  3%      -0.1        0.05 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__list_add_valid
>>       0.13 =C2=B1  2%      -0.1        0.05        perf-profile.children=
.cycles-pp.update_irq_load_avg
>>       0.15 =C2=B1  6%      -0.1        0.07        perf-profile.children=
.cycles-pp.sk_free
>>       0.21 =C2=B1  5%      -0.1        0.14 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.kfree_skbmem
>>       0.14 =C2=B1  2%      -0.1        0.07 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.woken_wake_function
>>       0.28 =C2=B1  7%      -0.1        0.21 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.skb_page_frag_refill
>>       0.29 =C2=B1  5%      -0.1        0.23 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.tcp_cleanup_rbuf
>>       0.33 =C2=B1  2%      -0.1        0.28 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_free
>>       0.11            -0.1        0.06 =C2=B1 11%  perf-profile.children=
.cycles-pp.tcp_rate_check_app_limited
>>       0.08 =C2=B1 17%      -0.0        0.04 =C2=B1 44%  perf-profile.chi=
ldren.cycles-pp.cpus_share_cache
>>       0.10 =C2=B1  3%      -0.0        0.06 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.rb_first
>>       0.10 =C2=B1  4%      -0.0        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__fdget
>>       0.25            -0.0        0.22 =C2=B1  2%  perf-profile.children=
.cycles-pp.remove_wait_queue
>>       0.08 =C2=B1  4%      -0.0        0.05 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.ttwu_queue_wakelist
>>       0.23 =C2=B1  2%      +0.0        0.26 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.sock_put
>>       0.00            +0.0        0.05        perf-profile.children.cycl=
es-pp.get_xsave_addr
>>       0.00            +0.0        0.05        perf-profile.children.cycl=
es-pp.nr_iowait_cpu
>>       0.00            +0.1        0.06 =C2=B1  6%  perf-profile.children=
.cycles-pp.tick_nohz_idle_enter
>>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children=
.cycles-pp.__update_idle_core
>>       0.00            +0.1        0.07 =C2=B1  7%  perf-profile.children=
.cycles-pp.set_next_task_idle
>>       0.00            +0.1        0.07 =C2=B1  8%  perf-profile.children=
.cycles-pp.pick_next_task_idle
>>       0.00            +0.1        0.08 =C2=B1 36%  perf-profile.children=
.cycles-pp.poll_idle
>>       0.00            +0.1        0.08 =C2=B1  8%  perf-profile.children=
.cycles-pp.attach_task
>>       0.00            +0.1        0.08 =C2=B1  8%  perf-profile.children=
.cycles-pp.activate_task
>>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children=
.cycles-pp.attach_entity_load_avg
>>       0.00            +0.1        0.09        perf-profile.children.cycl=
es-pp.tick_nohz_idle_exit
>>       0.00            +0.1        0.09 =C2=B1  7%  perf-profile.children=
.cycles-pp.lock_timer_base
>>       0.00            +0.1        0.10 =C2=B1  8%  perf-profile.children=
.cycles-pp.__task_rq_lock
>>       0.00            +0.1        0.11        perf-profile.children.cycl=
es-pp.get_next_timer_interrupt
>>       0.00            +0.1        0.11 =C2=B1  4%  perf-profile.children=
.cycles-pp.update_cfs_rq_h_load
>>       0.00            +0.1        0.11 =C2=B1  4%  perf-profile.children=
.cycles-pp.cpumask_next
>>       0.00            +0.1        0.12 =C2=B1  7%  perf-profile.children=
.cycles-pp.update_blocked_averages
>>       0.00            +0.1        0.12 =C2=B1  6%  perf-profile.children=
.cycles-pp.run_rebalance_domains
>>       0.00            +0.1        0.12 =C2=B1  3%  perf-profile.children=
.cycles-pp.start_kernel
>>       1.76            +0.1        1.88 =C2=B1  2%  perf-profile.children=
.cycles-pp.select_task_rq_fair
>>       0.00            +0.2        0.16        perf-profile.children.cycl=
es-pp.tick_nohz_next_event
>>       0.00            +0.2        0.17 =C2=B1  3%  perf-profile.children=
.cycles-pp.remove_entity_load_avg
>>       0.00            +0.2        0.22        perf-profile.children.cycl=
es-pp.tick_nohz_get_sleep_length
>>       0.24 =C2=B1  3%      +0.3        0.49 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp._raw_spin_unlock_irqrestore
>>       0.66 =C2=B1  2%      +0.3        0.94 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.hrtimer_interrupt
>>       0.66 =C2=B1  3%      +0.3        0.94 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__sysvec_apic_timer_interrupt
>>       0.59            +0.3        0.88        perf-profile.children.cycl=
es-pp.finish_task_switch
>>       0.00            +0.3        0.29 =C2=B1  3%  perf-profile.children=
.cycles-pp.sched_ttwu_pending
>>       0.00            +0.3        0.30 =C2=B1  7%  perf-profile.children=
.cycles-pp.load_balance
>>       0.00            +0.3        0.30 =C2=B1  3%  perf-profile.children=
.cycles-pp.__sysvec_call_function_single
>>       0.00            +0.3        0.31 =C2=B1  3%  perf-profile.children=
.cycles-pp.sysvec_call_function_single
>>       0.00            +0.3        0.33 =C2=B1  2%  perf-profile.children=
.cycles-pp.asm_sysvec_call_function_single
>>       0.00            +0.3        0.33 =C2=B1  4%  perf-profile.children=
.cycles-pp.rebalance_domains
>>       0.00            +0.3        0.34 =C2=B1  2%  perf-profile.children=
.cycles-pp.__slab_free
>>       0.00            +0.4        0.35        perf-profile.children.cycl=
es-pp.migrate_task_rq_fair
>>       0.00            +0.4        0.37 =C2=B1  2%  perf-profile.children=
.cycles-pp.menu_select
>>       0.64            +0.4        1.01        perf-profile.children.cycl=
es-pp._raw_spin_lock_irqsave
>>       0.08 =C2=B1  8%      +0.4        0.47 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.task_tick_fair
>>      19.47            +0.4       19.88        perf-profile.children.cycl=
es-pp.tcp_recvmsg
>>       0.00            +0.4        0.41 =C2=B1  4%  perf-profile.children=
.cycles-pp.irq_exit_rcu
>>       0.29 =C2=B1  6%      +0.4        0.74 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.tick_sched_timer
>>       0.35 =C2=B1  5%      +0.5        0.82 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__hrtimer_run_queues
>>       0.20 =C2=B1  6%      +0.5        0.72 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.update_process_times
>>       0.20 =C2=B1  6%      +0.5        0.72 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.tick_sched_handle
>>       0.13 =C2=B1  7%      +0.5        0.67 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.scheduler_tick
>>       0.71 =C2=B1  2%      +0.7        1.37 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.sysvec_apic_timer_interrupt
>>       0.76 =C2=B1  2%      +0.7        1.46 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.asm_sysvec_apic_timer_interrupt
>>       0.07 =C2=B1  8%      +0.7        0.78 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.available_idle_cpu
>>      18.17            +1.4       19.58        perf-profile.children.cycl=
es-pp.tcp_recvmsg_locked
>>       0.00            +1.5        1.47 =C2=B1  2%  perf-profile.children=
.cycles-pp.select_idle_sibling
>>      50.99            +1.5       52.49        perf-profile.children.cycl=
es-pp.__tcp_push_pending_frames
>>      50.71            +1.7       52.46        perf-profile.children.cycl=
es-pp.tcp_write_xmit
>>      13.38            +2.0       15.39        perf-profile.children.cycl=
es-pp.schedule
>>      47.16            +4.6       51.80        perf-profile.children.cycl=
es-pp.__tcp_transmit_skb
>>       1.63            +5.8        7.38        perf-profile.children.cycl=
es-pp.dequeue_entity
>>      10.50            +6.4       16.92        perf-profile.children.cycl=
es-pp.sk_wait_data
>>       0.00            +6.9        6.89        perf-profile.children.cycl=
es-pp.set_task_cpu
>>       8.86            +7.0       15.86        perf-profile.children.cycl=
es-pp.wait_woken
>>       8.46            +7.0       15.51        perf-profile.children.cycl=
es-pp.schedule_timeout
>>       2.00            +7.1        9.12        perf-profile.children.cycl=
es-pp.enqueue_entity
>>      42.89            +7.9       50.74        perf-profile.children.cycl=
es-pp.__ip_queue_xmit
>>       0.00            +8.3        8.28        perf-profile.children.cycl=
es-pp.schedule_idle
>>       3.25 =C2=B1  2%      +8.8       12.02        perf-profile.children=
.cycles-pp.dequeue_task_fair
>>       2.58            +8.9       11.44        perf-profile.children.cycl=
es-pp.update_load_avg
>>      40.37           +10.0       50.34        perf-profile.children.cycl=
es-pp.ip_output
>>       3.64           +10.0       13.65        perf-profile.children.cycl=
es-pp.ttwu_do_activate
>>       3.57           +10.1       13.71        perf-profile.children.cycl=
es-pp.enqueue_task_fair
>>      12.98           +10.5       23.50        perf-profile.children.cycl=
es-pp.__schedule
>>       0.00           +11.8       11.85        perf-profile.children.cycl=
es-pp.intel_idle
>>      38.10           +11.9       49.98        perf-profile.children.cycl=
es-pp.ip_finish_output2
>>       0.00           +12.4       12.36        perf-profile.children.cycl=
es-pp.cpuidle_enter_state
>>       0.00           +12.4       12.36        perf-profile.children.cycl=
es-pp.cpuidle_enter
>>       0.62 =C2=B1  2%     +13.3       13.87        perf-profile.children=
.cycles-pp.update_cfs_group
>>      32.14           +16.5       48.66        perf-profile.children.cycl=
es-pp.__local_bh_enable_ip
>>      31.46           +17.1       48.57        perf-profile.children.cycl=
es-pp.do_softirq
>>      30.97           +17.9       48.85        perf-profile.children.cycl=
es-pp.__softirqentry_text_start
>>      29.45           +18.6       48.07        perf-profile.children.cycl=
es-pp.net_rx_action
>>      28.61           +19.3       47.93        perf-profile.children.cycl=
es-pp.__napi_poll
>>      28.43           +19.4       47.86        perf-profile.children.cycl=
es-pp.process_backlog
>>      27.33           +20.3       47.66        perf-profile.children.cycl=
es-pp.__netif_receive_skb_one_core
>>       0.00           +21.4       21.38        perf-profile.children.cycl=
es-pp.start_secondary
>>      25.98           +21.5       47.45        perf-profile.children.cycl=
es-pp.ip_rcv
>>       0.00           +21.5       21.50        perf-profile.children.cycl=
es-pp.do_idle
>>       0.00           +21.5       21.50        perf-profile.children.cycl=
es-pp.secondary_startup_64_no_verify
>>       0.00           +21.5       21.50        perf-profile.children.cycl=
es-pp.cpu_startup_entry
>>      24.18           +23.0       47.18        perf-profile.children.cycl=
es-pp.ip_local_deliver
>>      23.98           +23.2       47.16        perf-profile.children.cycl=
es-pp.ip_local_deliver_finish
>>      23.84           +23.3       47.15        perf-profile.children.cycl=
es-pp.ip_protocol_deliver_rcu
>>      23.44           +23.6       47.07        perf-profile.children.cycl=
es-pp.tcp_v4_rcv
>>       1.15 =C2=B1  2%     +24.8       25.94        perf-profile.children=
.cycles-pp._raw_spin_lock
>>       0.00           +24.8       24.83        perf-profile.children.cycl=
es-pp.native_queued_spin_lock_slowpath
>>      19.53           +26.1       45.66        perf-profile.children.cycl=
es-pp.tcp_v4_do_rcv
>>      19.01           +26.6       45.58        perf-profile.children.cycl=
es-pp.tcp_rcv_established
>>       7.91           +33.9       41.81        perf-profile.children.cycl=
es-pp.__wake_up_common
>>       8.64           +34.0       42.61        perf-profile.children.cycl=
es-pp.sock_def_readable
>>       7.62           +34.0       41.65        perf-profile.children.cycl=
es-pp.try_to_wake_up
>>       8.21           +34.2       42.42        perf-profile.children.cycl=
es-pp.__wake_up_common_lock
>>       1.86 =C2=B1  3%      -1.4        0.45 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.dst_release
>>       1.99            -1.4        0.58        perf-profile.self.cycles-p=
p.tcp_sendmsg_locked
>>       1.57            -1.4        0.21 =C2=B1  3%  perf-profile.self.cyc=
les-pp.load_new_mm_cr3
>>       1.67            -1.3        0.34 =C2=B1  2%  perf-profile.self.cyc=
les-pp.__tcp_transmit_skb
>>       1.49 =C2=B1  4%      -1.3        0.21 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.__dev_queue_xmit
>>       1.50            -1.3        0.23 =C2=B1  3%  perf-profile.self.cyc=
les-pp.tcp_clean_rtx_queue
>>       1.55            -1.2        0.39 =C2=B1  3%  perf-profile.self.cyc=
les-pp.switch_fpu_return
>>       1.39            -1.0        0.36 =C2=B1  2%  perf-profile.self.cyc=
les-pp.tcp_ack
>>       1.18            -1.0        0.18 =C2=B1  3%  perf-profile.self.cyc=
les-pp.tcp_write_xmit
>>       0.97 =C2=B1  2%      -0.8        0.16 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.__ip_queue_xmit
>>       0.89 =C2=B1  8%      -0.8        0.09 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.ip_rcv_finish_core
>>       0.95 =C2=B1  2%      -0.8        0.18 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.ip_finish_output2
>>       0.90 =C2=B1 10%      -0.7        0.16 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.read_tsc
>>       1.28            -0.7        0.55        perf-profile.self.cycles-p=
p._raw_spin_lock_bh
>>       0.88            -0.7        0.15 =C2=B1  3%  perf-profile.self.cyc=
les-pp.syscall_return_via_sysret
>>       0.79 =C2=B1 10%      -0.7        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.ipv4_mtu
>>       0.81 =C2=B1 12%      -0.7        0.09 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.ipv4_dst_check
>>       0.88            -0.7        0.16 =C2=B1  2%  perf-profile.self.cyc=
les-pp.entry_SYSCALL_64_after_hwframe
>>       1.09 =C2=B1  3%      -0.7        0.38 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.tcp_recvmsg_locked
>>       0.94 =C2=B1  2%      -0.7        0.23 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.tcp_v4_rcv
>>       0.87            -0.7        0.18 =C2=B1  2%  perf-profile.self.cyc=
les-pp.native_sched_clock
>>       0.93 =C2=B1  4%      -0.7        0.25 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.ktime_get
>>       1.09            -0.7        0.42 =C2=B1  3%  perf-profile.self.cyc=
les-pp.__switch_to_asm
>>       0.98 =C2=B1  4%      -0.7        0.32 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.update_curr
>>       0.80 =C2=B1  3%      -0.6        0.15 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.__netif_receive_skb_core
>>       0.79            -0.6        0.15        perf-profile.self.cycles-p=
p.___might_sleep
>>       0.71            -0.6        0.08 =C2=B1  4%  perf-profile.self.cyc=
les-pp.copy_fpregs_to_fpstate
>>       0.73            -0.6        0.12 =C2=B1  3%  perf-profile.self.cyc=
les-pp.net_rx_action
>>       0.76 =C2=B1  2%      -0.6        0.17 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.__update_load_avg_se
>>       0.91            -0.6        0.33 =C2=B1  3%  perf-profile.self.cyc=
les-pp.__fget_light
>>       0.78 =C2=B1  2%      -0.6        0.20        perf-profile.self.cyc=
les-pp.__cgroup_bpf_run_filter_skb
>>       0.65            -0.6        0.09 =C2=B1  5%  perf-profile.self.cyc=
les-pp.__local_bh_enable_ip
>>       0.66            -0.5        0.11 =C2=B1  4%  perf-profile.self.cyc=
les-pp.process_backlog
>>       0.66            -0.5        0.11 =C2=B1  3%  perf-profile.self.cyc=
les-pp.__might_sleep
>>       0.57 =C2=B1  2%      -0.5        0.06 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.ip_output
>>       0.58            -0.5        0.08 =C2=B1  4%  perf-profile.self.cyc=
les-pp.exit_to_user_mode_prepare
>>       0.57 =C2=B1  6%      -0.5        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.tcp_current_mss
>>       0.58            -0.5        0.09        perf-profile.self.cycles-p=
p.tcp_schedule_loss_probe
>>       0.57 =C2=B1  2%      -0.5        0.09        perf-profile.self.cyc=
les-pp.__sys_sendto
>>       0.69            -0.5        0.23 =C2=B1  3%  perf-profile.self.cyc=
les-pp.__switch_to
>>       0.57            -0.5        0.10 =C2=B1  7%  perf-profile.self.cyc=
les-pp.kmem_cache_alloc_node
>>       0.53 =C2=B1  2%      -0.5        0.07 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__calc_delta
>>       0.54 =C2=B1  4%      -0.5        0.08 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.tcp_ack_update_rtt
>>       0.58 =C2=B1  4%      -0.5        0.12 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.__virt_addr_valid
>>       0.68            -0.5        0.23 =C2=B1  2%  perf-profile.self.cyc=
les-pp.__update_load_avg_cfs_rq
>>       1.47            -0.4        1.02        perf-profile.self.cycles-p=
p.__schedule
>>       0.60 =C2=B1  2%      -0.4        0.18 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.aa_sk_perm
>>       0.58 =C2=B1  4%      -0.4        0.16 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.__softirqentry_text_start
>>       0.54 =C2=B1  3%      -0.4        0.12        perf-profile.self.cyc=
les-pp.__kmalloc_node_track_caller
>>       0.57            -0.4        0.16 =C2=B1  4%  perf-profile.self.cyc=
les-pp.__alloc_skb
>>       0.81            -0.4        0.40        perf-profile.self.cycles-p=
p.skb_release_data
>>       0.55            -0.4        0.15 =C2=B1  3%  perf-profile.self.cyc=
les-pp.pick_next_task_fair
>>       0.57            -0.4        0.17 =C2=B1  5%  perf-profile.self.cyc=
les-pp.__ksize
>>       0.67 =C2=B1  2%      -0.4        0.28        perf-profile.self.cyc=
les-pp.tcp_rcv_established
>>       0.71            -0.4        0.34        perf-profile.self.cycles-p=
p.switch_mm_irqs_off
>>       0.51 =C2=B1  2%      -0.4        0.14 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.___perf_sw_event
>>       0.44            -0.4        0.08 =C2=B1  4%  perf-profile.self.cyc=
les-pp.__sys_recvfrom
>>       0.43            -0.4        0.08 =C2=B1  4%  perf-profile.self.cyc=
les-pp.ip_rcv_core
>>       0.42 =C2=B1  2%      -0.3        0.08 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.loopback_xmit
>>       0.40            -0.3        0.06        perf-profile.self.cycles-p=
p.__netif_receive_skb_one_core
>>       0.40            -0.3        0.07 =C2=B1  5%  perf-profile.self.cyc=
les-pp.tcp_event_new_data_sent
>>       0.40            -0.3        0.07 =C2=B1  5%  perf-profile.self.cyc=
les-pp.__entry_text_start
>>       0.44 =C2=B1  2%      -0.3        0.11 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.mod_timer
>>       0.37            -0.3        0.04 =C2=B1 44%  perf-profile.self.cyc=
les-pp.copy_user_enhanced_fast_string
>>       0.44 =C2=B1  3%      -0.3        0.11 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.kfree
>>       0.70 =C2=B1  3%      -0.3        0.38 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.__inet_lookup_established
>>       0.38            -0.3        0.06        perf-profile.self.cycles-p=
p.tcp_update_pacing_rate
>>       0.41            -0.3        0.09        perf-profile.self.cycles-p=
p.dev_hard_start_xmit
>>       0.54 =C2=B1  3%      -0.3        0.23 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.select_task_rq_fair
>>       0.36 =C2=B1  2%      -0.3        0.06        perf-profile.self.cyc=
les-pp.sock_sendmsg
>>       0.35            -0.3        0.05        perf-profile.self.cycles-p=
p.enqueue_to_backlog
>>       0.36            -0.3        0.07 =C2=B1  7%  perf-profile.self.cyc=
les-pp.pick_next_entity
>>       0.34 =C2=B1  2%      -0.3        0.06        perf-profile.self.cyc=
les-pp._copy_to_iter
>>       0.35 =C2=B1  3%      -0.3        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.__list_del_entry_valid
>>       0.43            -0.3        0.17 =C2=B1  3%  perf-profile.self.cyc=
les-pp.finish_task_switch
>>       0.35 =C2=B1  3%      -0.3        0.09 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.cpuacct_charge
>>       0.29            -0.3        0.03 =C2=B1 99%  perf-profile.self.cyc=
les-pp.__x64_sys_recvfrom
>>       0.43 =C2=B1  4%      -0.3        0.17 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.enqueue_task_fair
>>       0.33 =C2=B1  3%      -0.3        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.validate_xmit_skb
>>       0.48            -0.2        0.23 =C2=B1  3%  perf-profile.self.cyc=
les-pp.copy_user_generic_unrolled
>>       0.48            -0.2        0.23 =C2=B1  2%  perf-profile.self.cyc=
les-pp.tcp_wfree
>>       0.33 =C2=B1  2%      -0.2        0.09 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.dequeue_entity
>>       0.33            -0.2        0.08 =C2=B1  4%  perf-profile.self.cyc=
les-pp.do_syscall_64
>>       0.31 =C2=B1  3%      -0.2        0.07        perf-profile.self.cyc=
les-pp.migrate_enable
>>       0.45 =C2=B1  3%      -0.2        0.21 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.enqueue_entity
>>       0.30            -0.2        0.07 =C2=B1  7%  perf-profile.self.cyc=
les-pp.import_single_range
>>       0.39            -0.2        0.16 =C2=B1  3%  perf-profile.self.cyc=
les-pp.schedule
>>       0.42            -0.2        0.19 =C2=B1  2%  perf-profile.self.cyc=
les-pp.__skb_datagram_iter
>>       0.29            -0.2        0.06        perf-profile.self.cycles-p=
p.migrate_disable
>>       0.42 =C2=B1  4%      -0.2        0.19 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.__check_object_size
>>       0.33 =C2=B1  2%      -0.2        0.10 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.update_min_vruntime
>>       0.27 =C2=B1  4%      -0.2        0.04 =C2=B1 44%  perf-profile.sel=
f.cycles-pp.ip_rcv
>>       0.28 =C2=B1  4%      -0.2        0.05 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.irqtime_account_irq
>>       0.30 =C2=B1  5%      -0.2        0.08 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.tcp_rearm_rto
>>       0.27 =C2=B1  2%      -0.2        0.05        perf-profile.self.cyc=
les-pp.skb_clone
>>       0.28            -0.2        0.07        perf-profile.self.cycles-p=
p.do_softirq
>>       0.33 =C2=B1  2%      -0.2        0.11 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.kmem_cache_free
>>       0.27            -0.2        0.05 =C2=B1  7%  perf-profile.self.cyc=
les-pp.__x64_sys_sendto
>>       0.41 =C2=B1  2%      -0.2        0.20 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.skb_entail
>>       0.39            -0.2        0.18 =C2=B1  3%  perf-profile.self.cyc=
les-pp.sock_def_readable
>>       0.27 =C2=B1  5%      -0.2        0.06        perf-profile.self.cyc=
les-pp.inet_recvmsg
>>       0.25            -0.2        0.05        perf-profile.self.cycles-p=
p.rcu_nocb_flush_deferred_wakeup
>>       0.23 =C2=B1  2%      -0.2        0.03 =C2=B1 70%  perf-profile.sel=
f.cycles-pp.sk_filter_trim_cap
>>       0.25            -0.2        0.05 =C2=B1  9%  perf-profile.self.cyc=
les-pp.tcp_established_options
>>       0.23 =C2=B1  3%      -0.2        0.03 =C2=B1 70%  perf-profile.sel=
f.cycles-pp.rb_insert_color
>>       0.25 =C2=B1  2%      -0.2        0.06        perf-profile.self.cyc=
les-pp.__tcp_select_window
>>       0.30 =C2=B1  2%      -0.2        0.11 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.tcp_event_data_recv
>>       0.36            -0.2        0.18        perf-profile.self.cycles-p=
p.tcp_queue_rcv
>>       0.23 =C2=B1  2%      -0.2        0.05        perf-profile.self.cyc=
les-pp.release_sock
>>       0.37 =C2=B1  2%      -0.2        0.19 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.reweight_entity
>>       0.23 =C2=B1  2%      -0.2        0.05 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.tcp_v4_fill_cb
>>       0.24            -0.2        0.07 =C2=B1  7%  perf-profile.self.cyc=
les-pp.lock_sock_nested
>>       0.32            -0.2        0.15 =C2=B1  2%  perf-profile.self.cyc=
les-pp.sk_wait_data
>>       0.42            -0.2        0.25        perf-profile.self.cycles-p=
p.__skb_clone
>>       0.25 =C2=B1  3%      -0.2        0.08 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.ip_send_check
>>       0.21 =C2=B1  2%      -0.2        0.05        perf-profile.self.cyc=
les-pp.bictcp_cwnd_event
>>       0.25            -0.2        0.09 =C2=B1  6%  perf-profile.self.cyc=
les-pp.syscall_exit_to_user_mode_prepare
>>       0.23 =C2=B1  3%      -0.2        0.08 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.tcp_release_cb
>>       0.26            -0.2        0.10 =C2=B1  4%  perf-profile.self.cyc=
les-pp.__copy_skb_header
>>       0.21 =C2=B1  3%      -0.2        0.06 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.sockfd_lookup_light
>>       0.22 =C2=B1 13%      -0.1        0.07        perf-profile.self.cyc=
les-pp.tcp_recvmsg
>>       0.20 =C2=B1  6%      -0.1        0.06 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.netif_rx_internal
>>       0.32 =C2=B1  3%      -0.1        0.17 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.sock_rfree
>>       0.19 =C2=B1 13%      -0.1        0.05        perf-profile.self.cyc=
les-pp.ip_rcv_finish
>>       0.17 =C2=B1  2%      -0.1        0.04 =C2=B1 71%  perf-profile.sel=
f.cycles-pp._raw_spin_unlock_irqrestore
>>       0.25            -0.1        0.12 =C2=B1  3%  perf-profile.self.cyc=
les-pp.__enqueue_entity
>>       0.23 =C2=B1  2%      -0.1        0.10 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.tcp_check_space
>>       0.28            -0.1        0.15 =C2=B1  2%  perf-profile.self.cyc=
les-pp.syscall_exit_to_user_mode
>>       0.18 =C2=B1  2%      -0.1        0.06 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.rcu_all_qs
>>       0.24 =C2=B1  5%      -0.1        0.12 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.schedule_timeout
>>       0.18 =C2=B1  4%      -0.1        0.06 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.rb_next
>>       0.18 =C2=B1  6%      -0.1        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.netif_skb_features
>>       0.19            -0.1        0.08 =C2=B1 12%  perf-profile.self.cyc=
les-pp._copy_from_iter_full
>>       0.26 =C2=B1  2%      -0.1        0.15 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.dequeue_task_fair
>>       0.17 =C2=B1  4%      -0.1        0.06        perf-profile.self.cyc=
les-pp.tcp_options_write
>>       0.27 =C2=B1  2%      -0.1        0.17 =C2=B1  2%  perf-profile.sel=
f.cycles-pp._find_next_bit
>>       0.27 =C2=B1  5%      -0.1        0.17 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.skb_release_head_state
>>       0.16 =C2=B1  4%      -0.1        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__napi_poll
>>       0.14 =C2=B1  3%      -0.1        0.05 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__list_add_valid
>>       0.15 =C2=B1  3%      -0.1        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.__wake_up_common
>>       0.15 =C2=B1  5%      -0.1        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.sk_free
>>       0.13 =C2=B1  2%      -0.1        0.05        perf-profile.self.cyc=
les-pp.update_irq_load_avg
>>       0.14            -0.1        0.07        perf-profile.self.cycles-p=
p.woken_wake_function
>>       0.18 =C2=B1  2%      -0.1        0.11 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.set_next_entity
>>       0.21 =C2=B1  5%      -0.1        0.14 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.kfree_skbmem
>>       0.16 =C2=B1  3%      -0.1        0.10 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.perf_tp_event
>>       0.08 =C2=B1 17%      -0.0        0.03 =C2=B1 70%  perf-profile.sel=
f.cycles-pp.cpus_share_cache
>>       0.10 =C2=B1  4%      -0.0        0.06 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.tcp_rate_check_app_limited
>>       0.40            -0.0        0.35 =C2=B1  2%  perf-profile.self.cyc=
les-pp.wait_woken
>>       0.26 =C2=B1  8%      -0.0        0.21 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.skb_page_frag_refill
>>       0.11 =C2=B1  9%      -0.0        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.cpumask_next_wrap
>>       0.09            -0.0        0.05 =C2=B1  7%  perf-profile.self.cyc=
les-pp.add_wait_queue
>>       0.09 =C2=B1 28%      -0.0        0.07 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.copyin
>>       0.08 =C2=B1  4%      -0.0        0.06 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__fdget
>>       0.13 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.tcp_rcv_space_adjust
>>       0.09 =C2=B1  4%      +0.0        0.13        perf-profile.self.cyc=
les-pp.perf_trace_sched_wakeup_template
>>       0.21 =C2=B1  2%      +0.0        0.26 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.sock_put
>>       0.00            +0.0        0.05        perf-profile.self.cycles-p=
p.get_xsave_addr
>>       0.00            +0.0        0.05        perf-profile.self.cycles-p=
p.nr_iowait_cpu
>>       0.00            +0.1        0.08 =C2=B1  4%  perf-profile.self.cyc=
les-pp.attach_entity_load_avg
>>       0.22 =C2=B1  2%      +0.1        0.33 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.update_rq_clock
>>       0.00            +0.1        0.11 =C2=B1  4%  perf-profile.self.cyc=
les-pp.menu_select
>>       0.00            +0.1        0.11 =C2=B1  4%  perf-profile.self.cyc=
les-pp.update_cfs_rq_h_load
>>       1.12 =C2=B1  2%      +0.1        1.24        perf-profile.self.cyc=
les-pp._raw_spin_lock
>>       0.00            +0.1        0.14 =C2=B1  2%  perf-profile.self.cyc=
les-pp.migrate_task_rq_fair
>>       0.00            +0.2        0.17 =C2=B1  2%  perf-profile.self.cyc=
les-pp.do_idle
>>       0.62            +0.3        0.92        perf-profile.self.cycles-p=
p._raw_spin_lock_irqsave
>>       0.00            +0.3        0.33        perf-profile.self.cycles-p=
p.__slab_free
>>       0.00            +0.4        0.44 =C2=B1  3%  perf-profile.self.cyc=
les-pp.select_idle_sibling
>>       0.32 =C2=B1  3%      +0.5        0.80        perf-profile.self.cyc=
les-pp.try_to_wake_up
>>       0.07 =C2=B1 10%      +0.7        0.77 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.available_idle_cpu
>>       0.00            +6.5        6.52        perf-profile.self.cycles-p=
p.set_task_cpu
>>       1.10 =C2=B1  3%      +9.4       10.51        perf-profile.self.cyc=
les-pp.update_load_avg
>>       0.00           +11.8       11.85        perf-profile.self.cycles-p=
p.intel_idle
>>       0.59 =C2=B1  3%     +13.3       13.87        perf-profile.self.cyc=
les-pp.update_cfs_group
>>       0.00           +24.8       24.83        perf-profile.self.cycles-p=
p.native_queued_spin_lock_slowpath
>>   21089949           -85.8%    2989620 =C2=B1 12%  softirqs.CPU0.NET_RX
>>      43259 =C2=B1  4%     -38.2%      26722 =C2=B1 10%  softirqs.CPU0.RCU
>>       9128 =C2=B1  9%   +1186.2%     117403 =C2=B1 11%  softirqs.CPU0.SC=
HED
>>   21110414 =C2=B1  2%     -84.8%    3204968 =C2=B1  6%  softirqs.CPU1.NE=
T_RX
>>      42310 =C2=B1  4%     -46.0%      22838 =C2=B1 11%  softirqs.CPU1.RCU
>>       7021 =C2=B1 13%   +1668.3%     124165 =C2=B1  2%  softirqs.CPU1.SC=
HED
>>   21143855           -84.7%    3243631 =C2=B1  6%  softirqs.CPU10.NET_RX
>>      42441 =C2=B1  5%     -47.3%      22379 =C2=B1 12%  softirqs.CPU10.R=
CU
>>       7111 =C2=B1 10%   +1637.1%     123534        softirqs.CPU10.SCHED
>>   21204884 =C2=B1  2%     -84.7%    3245701 =C2=B1  6%  softirqs.CPU100.=
NET_RX
>>      41490 =C2=B1  4%     -46.6%      22173 =C2=B1 12%  softirqs.CPU100.=
RCU
>>       6455 =C2=B1 10%   +1815.6%     123661        softirqs.CPU100.SCHED
>>   21232081           -84.8%    3231541 =C2=B1  6%  softirqs.CPU101.NET_RX
>>      41589 =C2=B1  4%     -46.8%      22111 =C2=B1 12%  softirqs.CPU101.=
RCU
>>       6425 =C2=B1 10%   +1824.0%     123623        softirqs.CPU101.SCHED
>>   21126545 =C2=B1  2%     -85.4%    3085512 =C2=B1  7%  softirqs.CPU102.=
NET_RX
>>      41763 =C2=B1  5%     -47.1%      22073 =C2=B1 12%  softirqs.CPU102.=
RCU
>>       6441 =C2=B1 10%   +1738.4%     118410 =C2=B1  9%  softirqs.CPU102.=
SCHED
>>   21127232 =C2=B1  2%     -84.7%    3229568 =C2=B1  6%  softirqs.CPU103.=
NET_RX
>>      41827 =C2=B1  5%     -46.2%      22497 =C2=B1 10%  softirqs.CPU103.=
RCU
>>       6478 =C2=B1 10%   +1806.9%     123534        softirqs.CPU103.SCHED
>>   21217326           -84.7%    3237447 =C2=B1  6%  softirqs.CPU104.NET_RX
>>      41828 =C2=B1  5%     -47.4%      22005 =C2=B1 12%  softirqs.CPU104.=
RCU
>>       6448 =C2=B1 10%   +1817.5%     123647        softirqs.CPU104.SCHED
>>   21091797           -84.6%    3258276 =C2=B1  6%  softirqs.CPU105.NET_RX
>>      41694 =C2=B1  5%     -47.2%      22007 =C2=B1 11%  softirqs.CPU105.=
RCU
>>       6300 =C2=B1 11%   +1861.0%     123559        softirqs.CPU105.SCHED
>>   21085207 =C2=B1  2%     -84.6%    3243105 =C2=B1  6%  softirqs.CPU106.=
NET_RX
>>      41857 =C2=B1  4%     -47.4%      22032 =C2=B1 11%  softirqs.CPU106.=
RCU
>>       6490 =C2=B1  9%   +1803.4%     123527        softirqs.CPU106.SCHED
>>   21289615           -84.8%    3242867 =C2=B1  6%  softirqs.CPU107.NET_RX
>>      41335 =C2=B1  5%     -46.9%      21947 =C2=B1 11%  softirqs.CPU107.=
RCU
>>       6393 =C2=B1 10%   +1831.8%     123517        softirqs.CPU107.SCHED
>>   21106732 =C2=B1  2%     -84.7%    3226990 =C2=B1  6%  softirqs.CPU108.=
NET_RX
>>      41558 =C2=B1  5%     -46.8%      22112 =C2=B1 11%  softirqs.CPU108.=
RCU
>>       6581 =C2=B1 13%   +1782.9%     123927        softirqs.CPU108.SCHED
>>   21080026 =C2=B1  2%     -84.7%    3223745 =C2=B1  7%  softirqs.CPU109.=
NET_RX
>>      41748 =C2=B1  5%     -47.3%      21983 =C2=B1 12%  softirqs.CPU109.=
RCU
>>       6565 =C2=B1 10%   +1782.6%     123600        softirqs.CPU109.SCHED
>>   21333326           -84.8%    3233409 =C2=B1  7%  softirqs.CPU11.NET_RX
>>      42155 =C2=B1  5%     -45.5%      22954 =C2=B1 13%  softirqs.CPU11.R=
CU
>>       6449 =C2=B1 11%   +1827.6%     124325        softirqs.CPU11.SCHED
>>   20809847           -84.5%    3233960 =C2=B1  6%  softirqs.CPU110.NET_RX
>>      41662 =C2=B1  5%     -47.0%      22062 =C2=B1 11%  softirqs.CPU110.=
RCU
>>       6394 =C2=B1  9%   +1832.2%     123548        softirqs.CPU110.SCHED
>>   21371230           -84.8%    3247104 =C2=B1  6%  softirqs.CPU111.NET_RX
>>      41795 =C2=B1  5%     -46.9%      22175 =C2=B1 11%  softirqs.CPU111.=
RCU
>>       6388 =C2=B1  9%   +1834.6%     123582        softirqs.CPU111.SCHED
>>   21506296           -84.9%    3245365 =C2=B1  6%  softirqs.CPU112.NET_RX
>>      42999 =C2=B1  5%     -48.7%      22077 =C2=B1 11%  softirqs.CPU112.=
RCU
>>       6429 =C2=B1 10%   +1820.6%     123494        softirqs.CPU112.SCHED
>>   21158589 =C2=B1  2%     -84.8%    3220539 =C2=B1  7%  softirqs.CPU113.=
NET_RX
>>      42935 =C2=B1  5%     -48.3%      22189 =C2=B1 11%  softirqs.CPU113.=
RCU
>>       6390 =C2=B1  8%   +1836.3%     123741        softirqs.CPU113.SCHED
>>   21251449 =C2=B1  2%     -84.9%    3210605 =C2=B1  6%  softirqs.CPU114.=
NET_RX
>>      42964 =C2=B1  5%     -48.9%      21946 =C2=B1 11%  softirqs.CPU114.=
RCU
>>       6418 =C2=B1 10%   +1817.2%     123053 =C2=B1  2%  softirqs.CPU114.=
SCHED
>>   21134317           -84.7%    3232097 =C2=B1  6%  softirqs.CPU115.NET_RX
>>      43081 =C2=B1  5%     -48.7%      22080 =C2=B1 11%  softirqs.CPU115.=
RCU
>>       6453 =C2=B1 10%   +1816.5%     123675        softirqs.CPU115.SCHED
>>   21085261 =C2=B1  2%     -84.6%    3240783 =C2=B1  6%  softirqs.CPU116.=
NET_RX
>>      43194 =C2=B1  5%     -49.1%      21983 =C2=B1 12%  softirqs.CPU116.=
RCU
>>       6490 =C2=B1 10%   +1804.2%     123587        softirqs.CPU116.SCHED
>>   21031757           -84.6%    3239936 =C2=B1  6%  softirqs.CPU117.NET_RX
>>      42936 =C2=B1  5%     -48.7%      22033 =C2=B1 12%  softirqs.CPU117.=
RCU
>>       6389 =C2=B1 11%   +1831.5%     123414 =C2=B1  2%  softirqs.CPU117.=
SCHED
>>   21328805           -84.8%    3234243 =C2=B1  6%  softirqs.CPU118.NET_RX
>>      42825 =C2=B1  5%     -48.7%      21962 =C2=B1 11%  softirqs.CPU118.=
RCU
>>       6262 =C2=B1 12%   +1870.7%     123418        softirqs.CPU118.SCHED
>>   20600211 =C2=B1  2%     -84.4%    3217341 =C2=B1  7%  softirqs.CPU119.=
NET_RX
>>      43424 =C2=B1  6%     -47.2%      22926 =C2=B1 19%  softirqs.CPU119.=
RCU
>>       6219 =C2=B1 12%   +1877.6%     122990        softirqs.CPU119.SCHED
>>   21190692 =C2=B1  3%     -84.8%    3218450 =C2=B1  6%  softirqs.CPU12.N=
ET_RX
>>      42159 =C2=B1  5%     -45.5%      22994 =C2=B1 11%  softirqs.CPU12.R=
CU
>>       6552 =C2=B1 12%   +1790.5%     123884        softirqs.CPU12.SCHED
>>   21060301 =C2=B1  2%     -83.3%    3511051 =C2=B1  7%  softirqs.CPU120.=
NET_RX
>>      43878 =C2=B1  4%     -49.5%      22153 =C2=B1 12%  softirqs.CPU120.=
RCU
>>       6432 =C2=B1  7%   +1799.0%     122140 =C2=B1  3%  softirqs.CPU120.=
SCHED
>>   22076911 =C2=B1  2%     -84.0%    3538992 =C2=B1  7%  softirqs.CPU121.=
NET_RX
>>      44348 =C2=B1  4%     -50.2%      22102 =C2=B1 12%  softirqs.CPU121.=
RCU
>>       6479 =C2=B1  9%   +1782.8%     121988 =C2=B1  3%  softirqs.CPU121.=
SCHED
>>   21689652 =C2=B1  2%     -83.6%    3560830 =C2=B1  7%  softirqs.CPU122.=
NET_RX
>>      43443 =C2=B1  4%     -49.0%      22164 =C2=B1 12%  softirqs.CPU122.=
RCU
>>       6310 =C2=B1  5%   +1832.7%     121956 =C2=B1  3%  softirqs.CPU122.=
SCHED
>>   21434645 =C2=B1  5%     -83.5%    3545442 =C2=B1  7%  softirqs.CPU123.=
NET_RX
>>      42799 =C2=B1  4%     -48.1%      22193 =C2=B1 12%  softirqs.CPU123.=
RCU
>>       6367 =C2=B1  7%   +1814.9%     121932 =C2=B1  3%  softirqs.CPU123.=
SCHED
>>   22107036           -83.9%    3569405 =C2=B1  7%  softirqs.CPU124.NET_RX
>>      43573 =C2=B1  4%     -48.9%      22286 =C2=B1 13%  softirqs.CPU124.=
RCU
>>       6322 =C2=B1  6%   +1830.7%     122076 =C2=B1  3%  softirqs.CPU124.=
SCHED
>>   21971830 =C2=B1  2%     -83.9%    3537171 =C2=B1  7%  softirqs.CPU125.=
NET_RX
>>      43068 =C2=B1  4%     -48.6%      22141 =C2=B1 12%  softirqs.CPU125.=
RCU
>>       6312 =C2=B1  5%   +1831.2%     121912 =C2=B1  3%  softirqs.CPU125.=
SCHED
>>   21977420 =C2=B1  3%     -83.9%    3528263 =C2=B1  7%  softirqs.CPU126.=
NET_RX
>>      43650 =C2=B1  4%     -49.0%      22282 =C2=B1 13%  softirqs.CPU126.=
RCU
>>       6334 =C2=B1  5%   +1826.3%     122024 =C2=B1  3%  softirqs.CPU126.=
SCHED
>>   21741712 =C2=B1  2%     -83.7%    3535470 =C2=B1  7%  softirqs.CPU127.=
NET_RX
>>      43621 =C2=B1  4%     -49.5%      22022 =C2=B1 12%  softirqs.CPU127.=
RCU
>>       6285 =C2=B1  4%   +1839.7%     121921 =C2=B1  3%  softirqs.CPU127.=
SCHED
>>   22266837 =C2=B1  2%     -84.1%    3548256 =C2=B1  7%  softirqs.CPU128.=
NET_RX
>>      41978 =C2=B1  5%     -47.2%      22156 =C2=B1 12%  softirqs.CPU128.=
RCU
>>       6297 =C2=B1  5%   +1836.8%     121961 =C2=B1  3%  softirqs.CPU128.=
SCHED
>>   21798871 =C2=B1  2%     -83.6%    3567035 =C2=B1  7%  softirqs.CPU129.=
NET_RX
>>      41751 =C2=B1  5%     -46.4%      22399 =C2=B1 11%  softirqs.CPU129.=
RCU
>>       6309 =C2=B1  5%   +1828.5%     121681 =C2=B1  3%  softirqs.CPU129.=
SCHED
>>   21262849           -84.8%    3225261 =C2=B1  6%  softirqs.CPU13.NET_RX
>>      41455 =C2=B1  5%     -45.9%      22430 =C2=B1 11%  softirqs.CPU13.R=
CU
>>       6539 =C2=B1 12%   +1793.2%     123805        softirqs.CPU13.SCHED
>>   22112318 =C2=B1  3%     -83.9%    3550339 =C2=B1  7%  softirqs.CPU130.=
NET_RX
>>      42358 =C2=B1  4%     -47.0%      22458 =C2=B1 11%  softirqs.CPU130.=
RCU
>>       6421 =C2=B1  5%   +1797.9%     121866 =C2=B1  3%  softirqs.CPU130.=
SCHED
>>   22061337 =C2=B1  3%     -84.0%    3537435 =C2=B1  7%  softirqs.CPU131.=
NET_RX
>>      41498 =C2=B1  4%     -46.9%      22055 =C2=B1 12%  softirqs.CPU131.=
RCU
>>       6318 =C2=B1  6%   +1830.0%     121952 =C2=B1  3%  softirqs.CPU131.=
SCHED
>>   21719312 =C2=B1  3%     -83.7%    3539791 =C2=B1  7%  softirqs.CPU132.=
NET_RX
>>      41664 =C2=B1  4%     -46.7%      22188 =C2=B1 12%  softirqs.CPU132.=
RCU
>>       6329 =C2=B1  6%   +1828.0%     122030 =C2=B1  3%  softirqs.CPU132.=
SCHED
>>   22111882           -84.0%    3535728 =C2=B1  7%  softirqs.CPU133.NET_RX
>>      41790 =C2=B1  4%     -47.1%      22120 =C2=B1 12%  softirqs.CPU133.=
RCU
>>       6367 =C2=B1  5%   +1815.2%     121952 =C2=B1  3%  softirqs.CPU133.=
SCHED
>>   22070411 =C2=B1  3%     -83.9%    3543159 =C2=B1  7%  softirqs.CPU134.=
NET_RX
>>      41771 =C2=B1  4%     -46.9%      22177 =C2=B1 12%  softirqs.CPU134.=
RCU
>>       6132 =C2=B1  9%   +1888.2%     121926 =C2=B1  3%  softirqs.CPU134.=
SCHED
>>   21797645 =C2=B1  3%     -83.6%    3570452 =C2=B1  7%  softirqs.CPU135.=
NET_RX
>>      42425 =C2=B1  7%     -47.9%      22114 =C2=B1 12%  softirqs.CPU135.=
RCU
>>       6292 =C2=B1  5%   +1837.4%     121898 =C2=B1  3%  softirqs.CPU135.=
SCHED
>>   21861365           -83.7%    3553898 =C2=B1  7%  softirqs.CPU136.NET_RX
>>      41626 =C2=B1  4%     -46.7%      22201 =C2=B1 12%  softirqs.CPU136.=
RCU
>>       6250 =C2=B1  6%   +1850.8%     121936 =C2=B1  3%  softirqs.CPU136.=
SCHED
>>   22026263 =C2=B1  3%     -84.0%    3533248 =C2=B1  7%  softirqs.CPU137.=
NET_RX
>>      41601 =C2=B1  4%     -46.9%      22079 =C2=B1 13%  softirqs.CPU137.=
RCU
>>       6304 =C2=B1  6%   +1833.9%     121929 =C2=B1  3%  softirqs.CPU137.=
SCHED
>>   21738929 =C2=B1  2%     -83.7%    3543092 =C2=B1  7%  softirqs.CPU138.=
NET_RX
>>      41609 =C2=B1  4%     -46.0%      22480 =C2=B1 12%  softirqs.CPU138.=
RCU
>>       6301 =C2=B1  5%   +1833.0%     121813 =C2=B1  3%  softirqs.CPU138.=
SCHED
>>   21927693           -83.9%    3530203 =C2=B1  7%  softirqs.CPU139.NET_RX
>>      41803 =C2=B1  4%     -47.3%      22048 =C2=B1 12%  softirqs.CPU139.=
RCU
>>       6261 =C2=B1  5%   +1846.4%     121880 =C2=B1  3%  softirqs.CPU139.=
SCHED
>>   21004769           -84.6%    3230354 =C2=B1  6%  softirqs.CPU14.NET_RX
>>      41727 =C2=B1  5%     -44.6%      23129 =C2=B1 10%  softirqs.CPU14.R=
CU
>>       6482 =C2=B1 10%   +1802.2%     123305        softirqs.CPU14.SCHED
>>   22068737 =C2=B1  4%     -83.9%    3560636 =C2=B1  7%  softirqs.CPU140.=
NET_RX
>>      41639 =C2=B1  4%     -46.9%      22096 =C2=B1 12%  softirqs.CPU140.=
RCU
>>       6266 =C2=B1  6%   +1843.5%     121795 =C2=B1  3%  softirqs.CPU140.=
SCHED
>>   21903090 =C2=B1  3%     -83.8%    3556461 =C2=B1  7%  softirqs.CPU141.=
NET_RX
>>      41554 =C2=B1  5%     -47.1%      21962 =C2=B1 12%  softirqs.CPU141.=
RCU
>>       6248 =C2=B1  5%   +1849.0%     121791 =C2=B1  3%  softirqs.CPU141.=
SCHED
>>   22076631 =C2=B1  2%     -84.0%    3533559 =C2=B1  7%  softirqs.CPU142.=
NET_RX
>>      41287 =C2=B1  5%     -46.8%      21960 =C2=B1 12%  softirqs.CPU142.=
RCU
>>       6231 =C2=B1  5%   +1855.0%     121831 =C2=B1  3%  softirqs.CPU142.=
SCHED
>>   21676631 =C2=B1  2%     -83.7%    3536303 =C2=B1  7%  softirqs.CPU143.=
NET_RX
>>      41504 =C2=B1  5%     -46.9%      22019 =C2=B1 12%  softirqs.CPU143.=
RCU
>>       6281 =C2=B1  5%   +1842.7%     122026 =C2=B1  3%  softirqs.CPU143.=
SCHED
>>   21727456           -83.7%    3543613 =C2=B1 15%  softirqs.CPU144.NET_RX
>>      41239 =C2=B1  6%     -47.2%      21792 =C2=B1 13%  softirqs.CPU144.=
RCU
>>       6289 =C2=B1  7%   +1832.1%     121512 =C2=B1  3%  softirqs.CPU144.=
SCHED
>>   22306831 =C2=B1  2%     -83.8%    3603104 =C2=B1 15%  softirqs.CPU145.=
NET_RX
>>      41452 =C2=B1  7%     -47.2%      21906 =C2=B1 13%  softirqs.CPU145.=
RCU
>>       6366 =C2=B1  8%   +1807.4%     121434 =C2=B1  3%  softirqs.CPU145.=
SCHED
>>   21785130 =C2=B1  3%     -83.5%    3604421 =C2=B1 15%  softirqs.CPU146.=
NET_RX
>>      41349 =C2=B1  6%     -47.5%      21724 =C2=B1 12%  softirqs.CPU146.=
RCU
>>       6347 =C2=B1  7%   +1813.2%     121435 =C2=B1  3%  softirqs.CPU146.=
SCHED
>>   21232094 =C2=B1  3%     -83.1%    3598219 =C2=B1 15%  softirqs.CPU147.=
NET_RX
>>      40828 =C2=B1  6%     -46.5%      21824 =C2=B1 13%  softirqs.CPU147.=
RCU
>>       6293 =C2=B1  7%   +1828.1%     121336 =C2=B1  3%  softirqs.CPU147.=
SCHED
>>   22069243 =C2=B1  2%     -83.6%    3612608 =C2=B1 15%  softirqs.CPU148.=
NET_RX
>>      40473 =C2=B1  7%     -45.8%      21931 =C2=B1 14%  softirqs.CPU148.=
RCU
>>       6232 =C2=B1  8%   +1846.5%     121308 =C2=B1  3%  softirqs.CPU148.=
SCHED
>>   22177970           -83.7%    3609960 =C2=B1 15%  softirqs.CPU149.NET_RX
>>      41267 =C2=B1  6%     -46.9%      21903 =C2=B1 13%  softirqs.CPU149.=
RCU
>>       6332 =C2=B1  7%   +1818.1%     121455 =C2=B1  3%  softirqs.CPU149.=
SCHED
>>   21356834 =C2=B1  2%     -84.8%    3244899 =C2=B1  6%  softirqs.CPU15.N=
ET_RX
>>      41941 =C2=B1  5%     -46.4%      22485 =C2=B1 11%  softirqs.CPU15.R=
CU
>>       6388 =C2=B1  9%   +1834.5%     123576        softirqs.CPU15.SCHED
>>   22054050 =C2=B1  2%     -83.8%    3576963 =C2=B1 15%  softirqs.CPU150.=
NET_RX
>>      41610 =C2=B1  6%     -47.6%      21822 =C2=B1 13%  softirqs.CPU150.=
RCU
>>       6511 =C2=B1  7%   +1764.7%     121418 =C2=B1  3%  softirqs.CPU150.=
SCHED
>>   22211176 =C2=B1  2%     -83.8%    3598883 =C2=B1 15%  softirqs.CPU151.=
NET_RX
>>      41070 =C2=B1  6%     -46.8%      21838 =C2=B1 13%  softirqs.CPU151.=
RCU
>>       6332 =C2=B1  7%   +1816.1%     121336 =C2=B1  3%  softirqs.CPU151.=
SCHED
>>   22064325 =C2=B1  2%     -83.6%    3611293 =C2=B1 15%  softirqs.CPU152.=
NET_RX
>>      40838 =C2=B1  6%     -46.7%      21774 =C2=B1 13%  softirqs.CPU152.=
RCU
>>       6325 =C2=B1  8%   +1818.5%     121352 =C2=B1  3%  softirqs.CPU152.=
SCHED
>>   22224794 =C2=B1  2%     -83.8%    3611086 =C2=B1 15%  softirqs.CPU153.=
NET_RX
>>      40704 =C2=B1  9%     -46.4%      21801 =C2=B1 13%  softirqs.CPU153.=
RCU
>>       6296 =C2=B1  7%   +1827.7%     121370 =C2=B1  3%  softirqs.CPU153.=
SCHED
>>   21838832 =C2=B1  2%     -83.6%    3581908 =C2=B1 15%  softirqs.CPU154.=
NET_RX
>>      41284 =C2=B1  6%     -47.1%      21842 =C2=B1 13%  softirqs.CPU154.=
RCU
>>       6288 =C2=B1  7%   +1830.9%     121415 =C2=B1  3%  softirqs.CPU154.=
SCHED
>>   22225475 =C2=B1  2%     -83.8%    3593379 =C2=B1 15%  softirqs.CPU155.=
NET_RX
>>      41248 =C2=B1  6%     -47.3%      21739 =C2=B1 13%  softirqs.CPU155.=
RCU
>>       6249 =C2=B1  8%   +1843.3%     121437 =C2=B1  3%  softirqs.CPU155.=
SCHED
>>   22275414 =C2=B1  2%     -83.9%    3590419 =C2=B1 15%  softirqs.CPU156.=
NET_RX
>>      40958 =C2=B1  6%     -46.8%      21790 =C2=B1 13%  softirqs.CPU156.=
RCU
>>       6356 =C2=B1  7%   +1811.1%     121472 =C2=B1  3%  softirqs.CPU156.=
SCHED
>>   22120237 =C2=B1  3%     -83.7%    3605416 =C2=B1 15%  softirqs.CPU157.=
NET_RX
>>      41206 =C2=B1  6%     -47.0%      21827 =C2=B1 13%  softirqs.CPU157.=
RCU
>>       6336 =C2=B1  7%   +1817.0%     121470 =C2=B1  3%  softirqs.CPU157.=
SCHED
>>   22218563 =C2=B1  2%     -83.8%    3606034 =C2=B1 16%  softirqs.CPU158.=
NET_RX
>>      40854 =C2=B1  6%     -45.9%      22086 =C2=B1 15%  softirqs.CPU158.=
RCU
>>       6268 =C2=B1  7%   +1834.4%     121258 =C2=B1  3%  softirqs.CPU158.=
SCHED
>>   22109688 =C2=B1  2%     -83.7%    3606683 =C2=B1 15%  softirqs.CPU159.=
NET_RX
>>      41084 =C2=B1  6%     -47.2%      21696 =C2=B1 13%  softirqs.CPU159.=
RCU
>>       6321 =C2=B1  8%   +1818.9%     121309 =C2=B1  3%  softirqs.CPU159.=
SCHED
>>   21339128 =C2=B1  2%     -84.8%    3240429 =C2=B1  6%  softirqs.CPU16.N=
ET_RX
>>      43110 =C2=B1  5%     -47.6%      22599 =C2=B1 11%  softirqs.CPU16.R=
CU
>>       6382 =C2=B1 10%   +1836.8%     123604        softirqs.CPU16.SCHED
>>   22109619 =C2=B1  2%     -83.6%    3615340 =C2=B1 15%  softirqs.CPU160.=
NET_RX
>>      43313 =C2=B1  5%     -48.8%      22197 =C2=B1 15%  softirqs.CPU160.=
RCU
>>       6349 =C2=B1  7%   +1812.5%     121427 =C2=B1  3%  softirqs.CPU160.=
SCHED
>>   21821599 =C2=B1  2%     -83.5%    3609540 =C2=B1 16%  softirqs.CPU161.=
NET_RX
>>      43460 =C2=B1  5%     -49.6%      21906 =C2=B1 13%  softirqs.CPU161.=
RCU
>>       6301 =C2=B1  9%   +1832.8%     121794 =C2=B1  3%  softirqs.CPU161.=
SCHED
>>   22087548 =C2=B1  3%     -83.7%    3599251 =C2=B1 16%  softirqs.CPU162.=
NET_RX
>>      43164 =C2=B1  5%     -49.2%      21915 =C2=B1 13%  softirqs.CPU162.=
RCU
>>       6322 =C2=B1  7%   +1819.1%     121338 =C2=B1  3%  softirqs.CPU162.=
SCHED
>>   21861229 =C2=B1  2%     -83.6%    3588697 =C2=B1 15%  softirqs.CPU163.=
NET_RX
>>      42815 =C2=B1  5%     -48.8%      21942 =C2=B1 13%  softirqs.CPU163.=
RCU
>>       6296 =C2=B1  7%   +1828.3%     121407 =C2=B1  3%  softirqs.CPU163.=
SCHED
>>   21893539           -83.5%    3617073 =C2=B1 15%  softirqs.CPU164.NET_RX
>>      42932 =C2=B1  5%     -48.9%      21922 =C2=B1 13%  softirqs.CPU164.=
RCU
>>       6326 =C2=B1  8%   +1816.7%     121260 =C2=B1  3%  softirqs.CPU164.=
SCHED
>>   22155077 =C2=B1  3%     -83.7%    3616815 =C2=B1 16%  softirqs.CPU165.=
NET_RX
>>      43440 =C2=B1  6%     -49.6%      21881 =C2=B1 13%  softirqs.CPU165.=
RCU
>>       6357 =C2=B1  9%   +1808.5%     121340 =C2=B1  3%  softirqs.CPU165.=
SCHED
>>   22276929 =C2=B1  2%     -83.9%    3585606 =C2=B1 15%  softirqs.CPU166.=
NET_RX
>>      43511 =C2=B1  5%     -49.7%      21906 =C2=B1 13%  softirqs.CPU166.=
RCU
>>       6293 =C2=B1  8%   +1831.4%     121552 =C2=B1  3%  softirqs.CPU166.=
SCHED
>>   21917532 =C2=B1  3%     -83.7%    3581813 =C2=B1 15%  softirqs.CPU167.=
NET_RX
>>      43558 =C2=B1  5%     -49.5%      21982 =C2=B1 13%  softirqs.CPU167.=
RCU
>>       6583 =C2=B1 11%   +1744.8%     121441 =C2=B1  3%  softirqs.CPU167.=
SCHED
>>   21044980 =C2=B1  2%     -83.8%    3401343 =C2=B1  2%  softirqs.CPU168.=
NET_RX
>>      40641 =C2=B1  6%     -46.7%      21675 =C2=B1 12%  softirqs.CPU168.=
RCU
>>       7154 =C2=B1  8%   +1641.6%     124600        softirqs.CPU168.SCHED
>>   21419375           -84.4%    3334229 =C2=B1  7%  softirqs.CPU169.NET_RX
>>      40916 =C2=B1  5%     -46.8%      21747 =C2=B1 12%  softirqs.CPU169.=
RCU
>>       7037 =C2=B1 10%   +1601.5%     119743 =C2=B1  8%  softirqs.CPU169.=
SCHED
>>   21328933           -84.9%    3217840 =C2=B1  6%  softirqs.CPU17.NET_RX
>>      43234 =C2=B1  4%     -48.6%      22229 =C2=B1 11%  softirqs.CPU17.R=
CU
>>       6453 =C2=B1 10%   +1813.9%     123516        softirqs.CPU17.SCHED
>>   21258245           -83.7%    3468299 =C2=B1  2%  softirqs.CPU170.NET_RX
>>      41473 =C2=B1  5%     -47.8%      21651 =C2=B1 12%  softirqs.CPU170.=
RCU
>>       7023 =C2=B1 11%   +1671.1%     124393        softirqs.CPU170.SCHED
>>   21223382 =C2=B1  2%     -83.7%    3466301 =C2=B1  2%  softirqs.CPU171.=
NET_RX
>>      40893 =C2=B1  5%     -46.7%      21797 =C2=B1 12%  softirqs.CPU171.=
RCU
>>       7026 =C2=B1 11%   +1670.4%     124397        softirqs.CPU171.SCHED
>>   21126518           -83.5%    3481275 =C2=B1  2%  softirqs.CPU172.NET_RX
>>      41233 =C2=B1  5%     -47.2%      21765 =C2=B1 11%  softirqs.CPU172.=
RCU
>>       7087 =C2=B1 11%   +1655.5%     124426        softirqs.CPU172.SCHED
>>   21470783           -83.9%    3455627 =C2=B1  2%  softirqs.CPU173.NET_RX
>>      41193 =C2=B1  5%     -47.3%      21688 =C2=B1 12%  softirqs.CPU173.=
RCU
>>       6987 =C2=B1 10%   +1682.4%     124545        softirqs.CPU173.SCHED
>>   21412226 =C2=B1  2%     -83.9%    3452021 =C2=B1  2%  softirqs.CPU174.=
NET_RX
>>      41316 =C2=B1  5%     -47.6%      21636 =C2=B1 12%  softirqs.CPU174.=
RCU
>>       7020 =C2=B1 11%   +1673.3%     124490        softirqs.CPU174.SCHED
>>   21410841           -83.8%    3469881 =C2=B1  2%  softirqs.CPU175.NET_RX
>>      41129 =C2=B1  5%     -47.4%      21619 =C2=B1 12%  softirqs.CPU175.=
RCU
>>       7003 =C2=B1 12%   +1677.5%     124488        softirqs.CPU175.SCHED
>>   21356566           -83.7%    3482920 =C2=B1  2%  softirqs.CPU176.NET_RX
>>      42741 =C2=B1  5%     -49.2%      21732 =C2=B1 12%  softirqs.CPU176.=
RCU
>>       7028 =C2=B1 11%   +1668.6%     124306        softirqs.CPU176.SCHED
>>   21362620           -83.7%    3480149 =C2=B1  2%  softirqs.CPU177.NET_RX
>>      43210 =C2=B1  5%     -49.1%      21978 =C2=B1 11%  softirqs.CPU177.=
RCU
>>       6999 =C2=B1 11%   +1676.7%     124361        softirqs.CPU177.SCHED
>>   21365410           -83.8%    3459326 =C2=B1  2%  softirqs.CPU178.NET_RX
>>      43212 =C2=B1  5%     -48.9%      22069 =C2=B1 11%  softirqs.CPU178.=
RCU
>>       7034 =C2=B1 12%   +1670.3%     124532        softirqs.CPU178.SCHED
>>   21555250           -83.9%    3460099 =C2=B1  2%  softirqs.CPU179.NET_RX
>>      43065 =C2=B1  5%     -49.5%      21731 =C2=B1 12%  softirqs.CPU179.=
RCU
>>       7013 =C2=B1 11%   +1673.8%     124405        softirqs.CPU179.SCHED
>>   21261067           -84.8%    3234245 =C2=B1  6%  softirqs.CPU18.NET_RX
>>      43393 =C2=B1  5%     -48.9%      22173 =C2=B1 11%  softirqs.CPU18.R=
CU
>>       6462 =C2=B1 10%   +1811.8%     123541        softirqs.CPU18.SCHED
>>   21160181 =C2=B1  2%     -83.6%    3461692 =C2=B1  2%  softirqs.CPU180.=
NET_RX
>>      43049 =C2=B1  4%     -49.5%      21724 =C2=B1 12%  softirqs.CPU180.=
RCU
>>       6974 =C2=B1 11%   +1685.9%     124558        softirqs.CPU180.SCHED
>>   21297779           -83.9%    3429715 =C2=B1  4%  softirqs.CPU181.NET_RX
>>      42816 =C2=B1  5%     -49.4%      21656 =C2=B1 12%  softirqs.CPU181.=
RCU
>>       7005 =C2=B1 12%   +1644.0%     122176 =C2=B1  4%  softirqs.CPU181.=
SCHED
>>   21333411 =C2=B1  2%     -83.7%    3472238 =C2=B1  2%  softirqs.CPU182.=
NET_RX
>>      42723 =C2=B1  5%     -49.3%      21650 =C2=B1 12%  softirqs.CPU182.=
RCU
>>       6954 =C2=B1 12%   +1688.3%     124373        softirqs.CPU182.SCHED
>>   21262028           -83.7%    3469338 =C2=B1  2%  softirqs.CPU183.NET_RX
>>      42955 =C2=B1  5%     -49.6%      21667 =C2=B1 12%  softirqs.CPU183.=
RCU
>>       6954 =C2=B1 10%   +1686.5%     124237        softirqs.CPU183.SCHED
>>   21340897           -83.8%    3461830 =C2=B1  2%  softirqs.CPU184.NET_RX
>>      42800 =C2=B1  5%     -49.2%      21724 =C2=B1 12%  softirqs.CPU184.=
RCU
>>       6933 =C2=B1 11%   +1695.3%     124469        softirqs.CPU184.SCHED
>>   21185172           -83.7%    3457528 =C2=B1  2%  softirqs.CPU185.NET_RX
>>      43033 =C2=B1  5%     -49.7%      21653 =C2=B1 12%  softirqs.CPU185.=
RCU
>>       7119 =C2=B1 12%   +1649.5%     124548        softirqs.CPU185.SCHED
>>   21210384           -83.7%    3447509 =C2=B1  2%  softirqs.CPU186.NET_RX
>>      43046 =C2=B1  5%     -49.6%      21707 =C2=B1 12%  softirqs.CPU186.=
RCU
>>       7012 =C2=B1 11%   +1667.9%     123980        softirqs.CPU186.SCHED
>>   21402048 =C2=B1  2%     -83.9%    3451075 =C2=B1  2%  softirqs.CPU187.=
NET_RX
>>      42928 =C2=B1  5%     -49.2%      21804 =C2=B1 12%  softirqs.CPU187.=
RCU
>>       7005 =C2=B1 11%   +1675.6%     124394        softirqs.CPU187.SCHED
>>   21453931           -83.8%    3471605 =C2=B1  2%  softirqs.CPU188.NET_RX
>>      42653 =C2=B1  5%     -49.2%      21655 =C2=B1 12%  softirqs.CPU188.=
RCU
>>       7078 =C2=B1 11%   +1658.1%     124444        softirqs.CPU188.SCHED
>>   21529386           -83.8%    3477434 =C2=B1  2%  softirqs.CPU189.NET_RX
>>      42966 =C2=B1  5%     -49.6%      21661 =C2=B1 12%  softirqs.CPU189.=
RCU
>>       7097 =C2=B1 10%   +1652.2%     124362        softirqs.CPU189.SCHED
>>   21036465 =C2=B1  2%     -84.7%    3222377 =C2=B1  6%  softirqs.CPU19.N=
ET_RX
>>      43445 =C2=B1  5%     -48.6%      22336 =C2=B1 11%  softirqs.CPU19.R=
CU
>>       6447 =C2=B1 10%   +1814.8%     123455        softirqs.CPU19.SCHED
>>   21376613           -83.9%    3451016 =C2=B1  2%  softirqs.CPU190.NET_RX
>>      43049 =C2=B1  5%     -49.5%      21756 =C2=B1 13%  softirqs.CPU190.=
RCU
>>       7010 =C2=B1 11%   +1676.2%     124523        softirqs.CPU190.SCHED
>>   20635117           -83.9%    3321052 =C2=B1  2%  softirqs.CPU191.NET_RX
>>      43481 =C2=B1  5%     -49.6%      21900 =C2=B1 12%  softirqs.CPU191.=
RCU
>>       7229 =C2=B1 16%   +1567.6%     120548        softirqs.CPU191.SCHED
>>   20797440 =C2=B1  3%     -84.8%    3157799 =C2=B1 11%  softirqs.CPU2.NE=
T_RX
>>      41846 =C2=B1  5%     -45.9%      22642 =C2=B1 11%  softirqs.CPU2.RCU
>>       6888 =C2=B1 18%   +1643.1%     120078 =C2=B1  5%  softirqs.CPU2.SC=
HED
>>   21024095 =C2=B1  2%     -84.5%    3252088 =C2=B1  6%  softirqs.CPU20.N=
ET_RX
>>      43269 =C2=B1  5%     -48.7%      22183 =C2=B1 11%  softirqs.CPU20.R=
CU
>>       6407 =C2=B1 10%   +1831.5%     123763        softirqs.CPU20.SCHED
>>   20926277 =C2=B1  2%     -84.5%    3242026 =C2=B1  6%  softirqs.CPU21.N=
ET_RX
>>      43269 =C2=B1  4%     -48.8%      22139 =C2=B1 12%  softirqs.CPU21.R=
CU
>>       6274 =C2=B1 13%   +1870.4%     123640        softirqs.CPU21.SCHED
>>   21077431 =C2=B1  2%     -84.6%    3246240 =C2=B1  6%  softirqs.CPU22.N=
ET_RX
>>      43234 =C2=B1  5%     -48.4%      22317 =C2=B1 12%  softirqs.CPU22.R=
CU
>>       6376 =C2=B1 11%   +1843.3%     123910        softirqs.CPU22.SCHED
>>   21029368 =C2=B1  3%     -84.7%    3220265 =C2=B1  6%  softirqs.CPU23.N=
ET_RX
>>      43088 =C2=B1  4%     -48.6%      22135 =C2=B1 11%  softirqs.CPU23.R=
CU
>>       6219 =C2=B1 13%   +1887.1%     123588        softirqs.CPU23.SCHED
>>   21307111 =C2=B1  3%     -83.6%    3498024 =C2=B1  7%  softirqs.CPU24.N=
ET_RX
>>      43128 =C2=B1  4%     -48.2%      22331 =C2=B1 12%  softirqs.CPU24.R=
CU
>>       6239 =C2=B1  5%   +1859.0%     122238 =C2=B1  3%  softirqs.CPU24.S=
CHED
>>   21868294 =C2=B1  2%     -83.8%    3535036 =C2=B1  7%  softirqs.CPU25.N=
ET_RX
>>      43203 =C2=B1  4%     -46.5%      23128 =C2=B1 12%  softirqs.CPU25.R=
CU
>>       6222 =C2=B1  4%   +1862.4%     122108 =C2=B1  3%  softirqs.CPU25.S=
CHED
>>   21899068 =C2=B1  2%     -83.8%    3554637 =C2=B1  7%  softirqs.CPU26.N=
ET_RX
>>      43326 =C2=B1  5%     -48.0%      22509 =C2=B1 11%  softirqs.CPU26.R=
CU
>>       6242 =C2=B1  5%   +1856.7%     122138 =C2=B1  3%  softirqs.CPU26.S=
CHED
>>   21745475 =C2=B1  3%     -83.7%    3545972 =C2=B1  7%  softirqs.CPU27.N=
ET_RX
>>      42977 =C2=B1  4%     -47.0%      22776 =C2=B1 12%  softirqs.CPU27.R=
CU
>>       6099 =C2=B1  5%   +1899.4%     121954 =C2=B1  3%  softirqs.CPU27.S=
CHED
>>   21715337 =C2=B1  2%     -83.6%    3555366 =C2=B1  7%  softirqs.CPU28.N=
ET_RX
>>      43381 =C2=B1  3%     -48.0%      22563 =C2=B1 12%  softirqs.CPU28.R=
CU
>>       6244 =C2=B1  6%   +1852.7%     121931 =C2=B1  3%  softirqs.CPU28.S=
CHED
>>   21739607           -83.7%    3547302 =C2=B1  7%  softirqs.CPU29.NET_RX
>>      43164 =C2=B1  4%     -48.1%      22419 =C2=B1 12%  softirqs.CPU29.R=
CU
>>       6244 =C2=B1  6%   +1854.2%     122019 =C2=B1  3%  softirqs.CPU29.S=
CHED
>>   21276568           -84.8%    3233261 =C2=B1  6%  softirqs.CPU3.NET_RX
>>      42043 =C2=B1  5%     -46.5%      22505 =C2=B1 12%  softirqs.CPU3.RCU
>>       6563 =C2=B1  8%   +1783.8%     123644        softirqs.CPU3.SCHED
>>   21780558 =C2=B1  3%     -83.8%    3529211 =C2=B1  7%  softirqs.CPU30.N=
ET_RX
>>      43512 =C2=B1  3%     -48.1%      22601 =C2=B1 13%  softirqs.CPU30.R=
CU
>>       6242 =C2=B1  6%   +1855.7%     122075 =C2=B1  3%  softirqs.CPU30.S=
CHED
>>   21925350 =C2=B1  2%     -83.9%    3525576 =C2=B1  7%  softirqs.CPU31.N=
ET_RX
>>      43589 =C2=B1  3%     -48.2%      22561 =C2=B1 11%  softirqs.CPU31.R=
CU
>>       6292 =C2=B1  6%   +1837.2%     121897 =C2=B1  3%  softirqs.CPU31.S=
CHED
>>   22178024 =C2=B1  2%     -84.0%    3551217 =C2=B1  7%  softirqs.CPU32.N=
ET_RX
>>      42541 =C2=B1  5%     -47.3%      22437 =C2=B1 12%  softirqs.CPU32.R=
CU
>>       6532 =C2=B1 10%   +1767.8%     122014 =C2=B1  3%  softirqs.CPU32.S=
CHED
>>   21895952 =C2=B1  2%     -83.7%    3572427 =C2=B1  7%  softirqs.CPU33.N=
ET_RX
>>      42539 =C2=B1  4%     -46.5%      22745 =C2=B1 11%  softirqs.CPU33.R=
CU
>>       6250 =C2=B1  6%   +1850.8%     121927 =C2=B1  3%  softirqs.CPU33.S=
CHED
>>   21741670 =C2=B1  4%     -83.7%    3554239 =C2=B1  7%  softirqs.CPU34.N=
ET_RX
>>      42853 =C2=B1  5%     -47.4%      22531 =C2=B1 12%  softirqs.CPU34.R=
CU
>>       6268 =C2=B1  5%   +1845.5%     121955 =C2=B1  3%  softirqs.CPU34.S=
CHED
>>   21894414 =C2=B1  3%     -83.8%    3537215 =C2=B1  7%  softirqs.CPU35.N=
ET_RX
>>      42731 =C2=B1  4%     -47.3%      22508 =C2=B1 12%  softirqs.CPU35.R=
CU
>>       6232 =C2=B1  5%   +1858.5%     122071 =C2=B1  3%  softirqs.CPU35.S=
CHED
>>   21881538 =C2=B1  3%     -83.9%    3526863 =C2=B1  7%  softirqs.CPU36.N=
ET_RX
>>      42736 =C2=B1  4%     -47.4%      22478 =C2=B1 12%  softirqs.CPU36.R=
CU
>>       6250 =C2=B1  5%   +1851.9%     122010 =C2=B1  3%  softirqs.CPU36.S=
CHED
>>   22023460 =C2=B1  2%     -83.9%    3536194 =C2=B1  7%  softirqs.CPU37.N=
ET_RX
>>      42264 =C2=B1  4%     -47.0%      22390 =C2=B1 12%  softirqs.CPU37.R=
CU
>>       6251 =C2=B1  6%   +1850.8%     121960 =C2=B1  3%  softirqs.CPU37.S=
CHED
>>   21989677 =C2=B1  3%     -83.9%    3548459 =C2=B1  7%  softirqs.CPU38.N=
ET_RX
>>      42359 =C2=B1  4%     -46.9%      22489 =C2=B1 12%  softirqs.CPU38.R=
CU
>>       6075 =C2=B1 10%   +1905.1%     121824 =C2=B1  3%  softirqs.CPU38.S=
CHED
>>   21181146 =C2=B1  4%     -83.2%    3555781 =C2=B1  7%  softirqs.CPU39.N=
ET_RX
>>      42381 =C2=B1  4%     -47.0%      22448 =C2=B1 12%  softirqs.CPU39.R=
CU
>>       6288 =C2=B1  5%   +1838.7%     121905 =C2=B1  3%  softirqs.CPU39.S=
CHED
>>   21234461 =C2=B1  3%     -84.8%    3232773 =C2=B1  6%  softirqs.CPU4.NE=
T_RX
>>      41094 =C2=B1  5%     -45.6%      22375 =C2=B1 11%  softirqs.CPU4.RCU
>>       6400 =C2=B1 10%   +1829.9%     123516        softirqs.CPU4.SCHED
>>   21625431 =C2=B1  2%     -83.6%    3549473 =C2=B1  7%  softirqs.CPU40.N=
ET_RX
>>      42390 =C2=B1  4%     -46.5%      22698 =C2=B1 12%  softirqs.CPU40.R=
CU
>>       6249 =C2=B1  5%   +1850.9%     121916 =C2=B1  3%  softirqs.CPU40.S=
CHED
>>   22033392 =C2=B1  2%     -84.0%    3524607 =C2=B1  7%  softirqs.CPU41.N=
ET_RX
>>      42784 =C2=B1  4%     -47.4%      22517 =C2=B1 12%  softirqs.CPU41.R=
CU
>>       6271 =C2=B1  5%   +1844.2%     121920 =C2=B1  3%  softirqs.CPU41.S=
CHED
>>   21882934           -83.8%    3543685 =C2=B1  7%  softirqs.CPU42.NET_RX
>>      42866 =C2=B1  5%     -47.8%      22382 =C2=B1 12%  softirqs.CPU42.R=
CU
>>       6293 =C2=B1  5%   +1835.9%     121831 =C2=B1  3%  softirqs.CPU42.S=
CHED
>>   21812590 =C2=B1  2%     -83.8%    3540307 =C2=B1  7%  softirqs.CPU43.N=
ET_RX
>>      42608 =C2=B1  4%     -47.1%      22523 =C2=B1 12%  softirqs.CPU43.R=
CU
>>       6295 =C2=B1  5%   +1838.9%     122059 =C2=B1  3%  softirqs.CPU43.S=
CHED
>>   22126669 =C2=B1  4%     -83.9%    3553763 =C2=B1  7%  softirqs.CPU44.N=
ET_RX
>>      42511 =C2=B1  4%     -46.7%      22650 =C2=B1 12%  softirqs.CPU44.R=
CU
>>       6177 =C2=B1  6%   +1873.7%     121930 =C2=B1  3%  softirqs.CPU44.S=
CHED
>>   21879826 =C2=B1  3%     -83.7%    3555902 =C2=B1  7%  softirqs.CPU45.N=
ET_RX
>>      42813 =C2=B1  4%     -47.6%      22438 =C2=B1 12%  softirqs.CPU45.R=
CU
>>       6279 =C2=B1  5%   +1840.8%     121875 =C2=B1  3%  softirqs.CPU45.S=
CHED
>>   21900318 =C2=B1  2%     -83.8%    3538750 =C2=B1  7%  softirqs.CPU46.N=
ET_RX
>>      42820 =C2=B1  4%     -47.5%      22485 =C2=B1 12%  softirqs.CPU46.R=
CU
>>       6373 =C2=B1  5%   +1812.3%     121877 =C2=B1  3%  softirqs.CPU46.S=
CHED
>>   21967147 =C2=B1  2%     -83.9%    3535657 =C2=B1  7%  softirqs.CPU47.N=
ET_RX
>>      42849 =C2=B1  4%     -47.2%      22609 =C2=B1 14%  softirqs.CPU47.R=
CU
>>       6273 =C2=B1  5%   +1846.6%     122122 =C2=B1  3%  softirqs.CPU47.S=
CHED
>>   21580165 =C2=B1  2%     -83.6%    3548529 =C2=B1 16%  softirqs.CPU48.N=
ET_RX
>>      41466 =C2=B1  7%     -46.2%      22312 =C2=B1 14%  softirqs.CPU48.R=
CU
>>       6443 =C2=B1  6%   +1786.2%     121544 =C2=B1  3%  softirqs.CPU48.S=
CHED
>>   22278431 =C2=B1  3%     -83.9%    3593833 =C2=B1 16%  softirqs.CPU49.N=
ET_RX
>>      41258 =C2=B1  6%     -45.5%      22496 =C2=B1 14%  softirqs.CPU49.R=
CU
>>       6345 =C2=B1  7%   +1810.5%     121228 =C2=B1  3%  softirqs.CPU49.S=
CHED
>>   21250066           -84.8%    3225282 =C2=B1  6%  softirqs.CPU5.NET_RX
>>      42368 =C2=B1  5%     -46.2%      22813 =C2=B1 11%  softirqs.CPU5.RCU
>>       6452 =C2=B1 10%   +1813.3%     123447        softirqs.CPU5.SCHED
>>   22119799           -83.8%    3590117 =C2=B1 16%  softirqs.CPU50.NET_RX
>>      40998 =C2=B1  6%     -45.6%      22285 =C2=B1 14%  softirqs.CPU50.R=
CU
>>       6331 =C2=B1  8%   +1814.3%     121197 =C2=B1  3%  softirqs.CPU50.S=
CHED
>>   22079153 =C2=B1  4%     -83.7%    3600591 =C2=B1 15%  softirqs.CPU51.N=
ET_RX
>>      41134 =C2=B1  6%     -45.8%      22290 =C2=B1 12%  softirqs.CPU51.R=
CU
>>       6289 =C2=B1  8%   +1830.0%     121393 =C2=B1  3%  softirqs.CPU51.S=
CHED
>>   22196382 =C2=B1  2%     -83.7%    3609631 =C2=B1 15%  softirqs.CPU52.N=
ET_RX
>>      40474 =C2=B1  8%     -45.2%      22187 =C2=B1 13%  softirqs.CPU52.R=
CU
>>       6311 =C2=B1  8%   +1824.4%     121447 =C2=B1  3%  softirqs.CPU52.S=
CHED
>>   22092811 =C2=B1  2%     -83.7%    3608982 =C2=B1 16%  softirqs.CPU53.N=
ET_RX
>>      40984 =C2=B1  6%     -46.0%      22113 =C2=B1 13%  softirqs.CPU53.R=
CU
>>       6295 =C2=B1  7%   +1829.4%     121456 =C2=B1  3%  softirqs.CPU53.S=
CHED
>>   21971811 =C2=B1  2%     -83.7%    3577529 =C2=B1 15%  softirqs.CPU54.N=
ET_RX
>>      41234 =C2=B1  6%     -46.1%      22243 =C2=B1 12%  softirqs.CPU54.R=
CU
>>       6359 =C2=B1  7%   +1808.7%     121379 =C2=B1  3%  softirqs.CPU54.S=
CHED
>>   22349548 =C2=B1  2%     -83.9%    3594167 =C2=B1 15%  softirqs.CPU55.N=
ET_RX
>>      41318 =C2=B1  6%     -46.1%      22261 =C2=B1 13%  softirqs.CPU55.R=
CU
>>       6289 =C2=B1  7%   +1829.7%     121364 =C2=B1  3%  softirqs.CPU55.S=
CHED
>>   21867767 =C2=B1  2%     -83.5%    3605717 =C2=B1 15%  softirqs.CPU56.N=
ET_RX
>>      40836 =C2=B1  6%     -46.0%      22043 =C2=B1 13%  softirqs.CPU56.R=
CU
>>       6366 =C2=B1  7%   +1805.6%     121326 =C2=B1  3%  softirqs.CPU56.S=
CHED
>>   22368570 =C2=B1  2%     -83.8%    3613885 =C2=B1 15%  softirqs.CPU57.N=
ET_RX
>>      40641 =C2=B1  8%     -45.6%      22100 =C2=B1 13%  softirqs.CPU57.R=
CU
>>       6312 =C2=B1  8%   +1821.9%     121322 =C2=B1  3%  softirqs.CPU57.S=
CHED
>>   21968019 =C2=B1  2%     -83.7%    3582386 =C2=B1 15%  softirqs.CPU58.N=
ET_RX
>>      41023 =C2=B1  6%     -46.2%      22088 =C2=B1 13%  softirqs.CPU58.R=
CU
>>       6281 =C2=B1  8%   +1832.7%     121392 =C2=B1  3%  softirqs.CPU58.S=
CHED
>>   21916818           -83.6%    3586085 =C2=B1 15%  softirqs.CPU59.NET_RX
>>      41053 =C2=B1  6%     -46.0%      22174 =C2=B1 13%  softirqs.CPU59.R=
CU
>>       6295 =C2=B1  8%   +1823.7%     121109 =C2=B1  4%  softirqs.CPU59.S=
CHED
>>   20991089 =C2=B1  2%     -84.8%    3188337 =C2=B1  5%  softirqs.CPU6.NE=
T_RX
>>      42243 =C2=B1  5%     -47.2%      22315 =C2=B1 11%  softirqs.CPU6.RCU
>>       6471 =C2=B1  9%   +1774.2%     121279 =C2=B1  5%  softirqs.CPU6.SC=
HED
>>   22041840 =C2=B1  3%     -83.7%    3586383 =C2=B1 15%  softirqs.CPU60.N=
ET_RX
>>      41099 =C2=B1  6%     -46.1%      22143 =C2=B1 13%  softirqs.CPU60.R=
CU
>>       6302 =C2=B1  8%   +1827.1%     121462 =C2=B1  3%  softirqs.CPU60.S=
CHED
>>   22130826 =C2=B1  3%     -83.8%    3594520 =C2=B1 15%  softirqs.CPU61.N=
ET_RX
>>      41201 =C2=B1  6%     -46.4%      22097 =C2=B1 13%  softirqs.CPU61.R=
CU
>>       6314 =C2=B1  8%   +1821.3%     121313 =C2=B1  3%  softirqs.CPU61.S=
CHED
>>   22135635 =C2=B1  2%     -83.8%    3590768 =C2=B1 15%  softirqs.CPU62.N=
ET_RX
>>      40926 =C2=B1  6%     -46.1%      22072 =C2=B1 13%  softirqs.CPU62.R=
CU
>>       6326 =C2=B1  8%   +1813.3%     121053 =C2=B1  3%  softirqs.CPU62.S=
CHED
>>   22006279 =C2=B1  2%     -83.6%    3613358 =C2=B1 15%  softirqs.CPU63.N=
ET_RX
>>      40812 =C2=B1  6%     -46.0%      22052 =C2=B1 13%  softirqs.CPU63.R=
CU
>>       6289 =C2=B1  7%   +1830.4%     121403 =C2=B1  3%  softirqs.CPU63.S=
CHED
>>   22162502 =C2=B1  2%     -83.8%    3596046 =C2=B1 15%  softirqs.CPU64.N=
ET_RX
>>      43354 =C2=B1  5%     -48.2%      22462 =C2=B1 14%  softirqs.CPU64.R=
CU
>>       6298 =C2=B1  7%   +1837.0%     122005 =C2=B1  3%  softirqs.CPU64.S=
CHED
>>   22015775           -83.8%    3575745 =C2=B1 15%  softirqs.CPU65.NET_RX
>>      43464 =C2=B1  5%     -49.2%      22086 =C2=B1 13%  softirqs.CPU65.R=
CU
>>       6270 =C2=B1  8%   +1831.5%     121113 =C2=B1  3%  softirqs.CPU65.S=
CHED
>>   21944987 =C2=B1  3%     -83.6%    3597759 =C2=B1 15%  softirqs.CPU66.N=
ET_RX
>>      43140 =C2=B1  5%     -47.9%      22485 =C2=B1 15%  softirqs.CPU66.R=
CU
>>       6282 =C2=B1  8%   +1831.3%     121336 =C2=B1  3%  softirqs.CPU66.S=
CHED
>>   22129685           -83.8%    3577740 =C2=B1 15%  softirqs.CPU67.NET_RX
>>      43165 =C2=B1  5%     -48.7%      22158 =C2=B1 13%  softirqs.CPU67.R=
CU
>>       6445 =C2=B1  8%   +1782.4%     121326 =C2=B1  3%  softirqs.CPU67.S=
CHED
>>   22073607 =C2=B1  2%     -83.6%    3609775 =C2=B1 15%  softirqs.CPU68.N=
ET_RX
>>      43285 =C2=B1  5%     -48.8%      22146 =C2=B1 13%  softirqs.CPU68.R=
CU
>>       6304 =C2=B1  8%   +1824.2%     121298 =C2=B1  3%  softirqs.CPU68.S=
CHED
>>   22033082 =C2=B1  3%     -83.6%    3614951 =C2=B1 15%  softirqs.CPU69.N=
ET_RX
>>      43557 =C2=B1  5%     -49.1%      22170 =C2=B1 13%  softirqs.CPU69.R=
CU
>>       6300 =C2=B1  7%   +1825.1%     121285 =C2=B1  3%  softirqs.CPU69.S=
CHED
>>   21053089 =C2=B1  2%     -84.7%    3212883 =C2=B1  6%  softirqs.CPU7.NE=
T_RX
>>      41729 =C2=B1  5%     -46.5%      22329 =C2=B1 11%  softirqs.CPU7.RCU
>>       6348 =C2=B1  9%   +1839.3%     123119 =C2=B1  2%  softirqs.CPU7.SC=
HED
>>   22178413 =C2=B1  2%     -83.9%    3577845 =C2=B1 15%  softirqs.CPU70.N=
ET_RX
>>      43599 =C2=B1  5%     -49.4%      22076 =C2=B1 13%  softirqs.CPU70.R=
CU
>>       6317 =C2=B1  7%   +1821.0%     121357 =C2=B1  3%  softirqs.CPU70.S=
CHED
>>   21762871 =C2=B1  3%     -83.6%    3579764 =C2=B1 15%  softirqs.CPU71.N=
ET_RX
>>      43364 =C2=B1  5%     -48.4%      22369 =C2=B1 11%  softirqs.CPU71.R=
CU
>>       6382 =C2=B1  8%   +1802.1%     121392 =C2=B1  3%  softirqs.CPU71.S=
CHED
>>   21023350           -83.8%    3409465 =C2=B1  2%  softirqs.CPU72.NET_RX
>>      41025 =C2=B1  5%     -46.3%      22023 =C2=B1 11%  softirqs.CPU72.R=
CU
>>       6814 =C2=B1 10%   +1728.9%     124623        softirqs.CPU72.SCHED
>>   21302700           -84.1%    3394421 =C2=B1  3%  softirqs.CPU73.NET_RX
>>      41214 =C2=B1  5%     -46.2%      22189 =C2=B1 13%  softirqs.CPU73.R=
CU
>>       7056 =C2=B1 11%   +1623.5%     121623 =C2=B1  5%  softirqs.CPU73.S=
CHED
>>   21291105 =C2=B1  2%     -83.8%    3456208 =C2=B1  2%  softirqs.CPU74.N=
ET_RX
>>      41637 =C2=B1  4%     -47.3%      21930 =C2=B1 12%  softirqs.CPU74.R=
CU
>>       7027 =C2=B1  9%   +1670.0%     124391        softirqs.CPU74.SCHED
>>   21429155           -83.9%    3457976 =C2=B1  2%  softirqs.CPU75.NET_RX
>>      41568 =C2=B1  4%     -47.1%      21979 =C2=B1 12%  softirqs.CPU75.R=
CU
>>       7044 =C2=B1 11%   +1664.6%     124314        softirqs.CPU75.SCHED
>>   21534196           -83.9%    3473433 =C2=B1  2%  softirqs.CPU76.NET_RX
>>      41485 =C2=B1  5%     -47.0%      21999 =C2=B1 12%  softirqs.CPU76.R=
CU
>>       7002 =C2=B1 10%   +1677.6%     124484        softirqs.CPU76.SCHED
>>   21488531           -83.9%    3456520 =C2=B1  2%  softirqs.CPU77.NET_RX
>>      41562 =C2=B1  5%     -47.3%      21889 =C2=B1 12%  softirqs.CPU77.R=
CU
>>       7070 =C2=B1 11%   +1661.2%     124528        softirqs.CPU77.SCHED
>>   21287664 =C2=B1  2%     -83.8%    3440745 =C2=B1  2%  softirqs.CPU78.N=
ET_RX
>>      41481 =C2=B1  5%     -46.3%      22274 =C2=B1 10%  softirqs.CPU78.R=
CU
>>       7055 =C2=B1 11%   +1663.8%     124437        softirqs.CPU78.SCHED
>>   21590981           -84.0%    3458262 =C2=B1  2%  softirqs.CPU79.NET_RX
>>      41251 =C2=B1  5%     -46.4%      22115 =C2=B1 11%  softirqs.CPU79.R=
CU
>>       6734 =C2=B1 19%   +1747.5%     124419        softirqs.CPU79.SCHED
>>   21204994 =C2=B1  2%     -84.7%    3235256 =C2=B1  6%  softirqs.CPU8.NE=
T_RX
>>      41695 =C2=B1  5%     -46.2%      22415 =C2=B1 11%  softirqs.CPU8.RCU
>>       6459 =C2=B1  9%   +1809.6%     123346 =C2=B1  2%  softirqs.CPU8.SC=
HED
>>   21455564           -83.8%    3470203 =C2=B1  2%  softirqs.CPU80.NET_RX
>>      42032 =C2=B1  4%     -47.6%      22026 =C2=B1 12%  softirqs.CPU80.R=
CU
>>       7050 =C2=B1 10%   +1664.9%     124440        softirqs.CPU80.SCHED
>>   21494599           -83.9%    3461317 =C2=B1  2%  softirqs.CPU81.NET_RX
>>      41056 =C2=B1  6%     -46.1%      22136 =C2=B1 11%  softirqs.CPU81.R=
CU
>>       6993 =C2=B1 10%   +1678.7%     124400        softirqs.CPU81.SCHED
>>   21500966           -84.0%    3441797 =C2=B1  2%  softirqs.CPU82.NET_RX
>>      40872 =C2=B1  5%     -46.2%      21975 =C2=B1 12%  softirqs.CPU82.R=
CU
>>       6986 =C2=B1 10%   +1683.8%     124620        softirqs.CPU82.SCHED
>>   21415846           -83.9%    3443443 =C2=B1  2%  softirqs.CPU83.NET_RX
>>      41213 =C2=B1  5%     -46.8%      21944 =C2=B1 12%  softirqs.CPU83.R=
CU
>>       6971 =C2=B1 11%   +1684.8%     124431        softirqs.CPU83.SCHED
>>   21158286           -83.7%    3448499 =C2=B1  2%  softirqs.CPU84.NET_RX
>>      41129 =C2=B1  5%     -46.6%      21967 =C2=B1 12%  softirqs.CPU84.R=
CU
>>       6981 =C2=B1 11%   +1682.7%     124461        softirqs.CPU84.SCHED
>>   21275952           -84.4%    3327058 =C2=B1  9%  softirqs.CPU85.NET_RX
>>      41193 =C2=B1  5%     -46.5%      22035 =C2=B1 12%  softirqs.CPU85.R=
CU
>>       7038 =C2=B1 11%   +1593.4%     119196 =C2=B1  9%  softirqs.CPU85.S=
CHED
>>   21456851           -83.8%    3474753 =C2=B1  2%  softirqs.CPU86.NET_RX
>>      41007 =C2=B1  5%     -46.2%      22074 =C2=B1 12%  softirqs.CPU86.R=
CU
>>       7009 =C2=B1 11%   +1675.5%     124444        softirqs.CPU86.SCHED
>>   21294686           -83.7%    3465753 =C2=B1  2%  softirqs.CPU87.NET_RX
>>      41176 =C2=B1  5%     -46.6%      21995 =C2=B1 11%  softirqs.CPU87.R=
CU
>>       6978 =C2=B1 12%   +1682.5%     124390        softirqs.CPU87.SCHED
>>   21345812           -83.8%    3460006 =C2=B1  2%  softirqs.CPU88.NET_RX
>>      41353 =C2=B1  5%     -46.8%      22012 =C2=B1 11%  softirqs.CPU88.R=
CU
>>       7042 =C2=B1 11%   +1665.8%     124353        softirqs.CPU88.SCHED
>>   21158849           -83.6%    3462986 =C2=B1  2%  softirqs.CPU89.NET_RX
>>      40857 =C2=B1  5%     -45.6%      22224 =C2=B1 12%  softirqs.CPU89.R=
CU
>>       7006 =C2=B1 11%   +1676.5%     124461        softirqs.CPU89.SCHED
>>   21346273           -84.8%    3245033 =C2=B1  6%  softirqs.CPU9.NET_RX
>>      41949 =C2=B1  5%     -46.7%      22367 =C2=B1 12%  softirqs.CPU9.RCU
>>       6324 =C2=B1 11%   +1852.5%     123483        softirqs.CPU9.SCHED
>>   21316413           -83.9%    3424944 =C2=B1  2%  softirqs.CPU90.NET_RX
>>      41279 =C2=B1  5%     -46.8%      21944 =C2=B1 12%  softirqs.CPU90.R=
CU
>>       6992 =C2=B1 10%   +1666.1%     123502        softirqs.CPU90.SCHED
>>   21383881           -83.8%    3456891 =C2=B1  2%  softirqs.CPU91.NET_RX
>>      41176 =C2=B1  6%     -46.5%      22022 =C2=B1 11%  softirqs.CPU91.R=
CU
>>       7075 =C2=B1  9%   +1661.4%     124635        softirqs.CPU91.SCHED
>>   21450268           -83.8%    3471616 =C2=B1  2%  softirqs.CPU92.NET_RX
>>      41127 =C2=B1  5%     -46.7%      21927 =C2=B1 12%  softirqs.CPU92.R=
CU
>>       7017 =C2=B1 10%   +1672.8%     124406        softirqs.CPU92.SCHED
>>   21340125 =C2=B1  2%     -83.7%    3469370 =C2=B1  2%  softirqs.CPU93.N=
ET_RX
>>      40908 =C2=B1  5%     -46.2%      22002 =C2=B1 12%  softirqs.CPU93.R=
CU
>>       6971 =C2=B1 11%   +1685.2%     124450        softirqs.CPU93.SCHED
>>   21331962           -83.8%    3446801 =C2=B1  2%  softirqs.CPU94.NET_RX
>>      40770 =C2=B1  5%     -46.2%      21950 =C2=B1 12%  softirqs.CPU94.R=
CU
>>       7047 =C2=B1 10%   +1663.5%     124287        softirqs.CPU94.SCHED
>>   21284890 =C2=B1  2%     -83.8%    3438859 =C2=B1  2%  softirqs.CPU95.N=
ET_RX
>>      40912 =C2=B1  6%     -46.2%      22018 =C2=B1 11%  softirqs.CPU95.R=
CU
>>       6982 =C2=B1 11%   +1653.8%     122454        softirqs.CPU95.SCHED
>>   20868761 =C2=B1  2%     -85.3%    3065044 =C2=B1 10%  softirqs.CPU96.N=
ET_RX
>>      41941 =C2=B1  6%     -47.7%      21950 =C2=B1 11%  softirqs.CPU96.R=
CU
>>       6293 =C2=B1 10%   +1753.4%     116642 =C2=B1  9%  softirqs.CPU96.S=
CHED
>>   21024160 =C2=B1  2%     -84.7%    3207450 =C2=B1  6%  softirqs.CPU97.N=
ET_RX
>>      41240 =C2=B1  7%     -46.6%      22022 =C2=B1 11%  softirqs.CPU97.R=
CU
>>       6305 =C2=B1  4%   +1850.6%     122997 =C2=B1  2%  softirqs.CPU97.S=
CHED
>>   21004489 =C2=B1  2%     -85.0%    3153700 =C2=B1 12%  softirqs.CPU98.N=
ET_RX
>>      41611 =C2=B1  5%     -46.7%      22165 =C2=B1 12%  softirqs.CPU98.R=
CU
>>       6416 =C2=B1  9%   +1758.5%     119241 =C2=B1  6%  softirqs.CPU98.S=
CHED
>>   20862992 =C2=B1  2%     -84.4%    3247430 =C2=B1  6%  softirqs.CPU99.N=
ET_RX
>>      41777 =C2=B1  5%     -47.0%      22123 =C2=B1 12%  softirqs.CPU99.R=
CU
>>       6486 =C2=B1  8%   +1805.9%     123621        softirqs.CPU99.SCHED
>>  4.146e+09           -84.0%  6.626e+08 =C2=B1  3%  softirqs.NET_RX
>>    8087068 =C2=B1  5%     -47.4%    4255788 =C2=B1 12%  softirqs.RCU
>>    1254695 =C2=B1  6%   +1775.7%   23534258        softirqs.SCHED
>>     737871           -94.0%      44540 =C2=B1 11%  softirqs.TIMER
>>
>>
>>                                                                         =
        =

>>                                netperf.Throughput_tps                   =
        =

>>                                                                         =
        =

>>   40000 +---------------------------------------------------------------=
----+   =

>>         |+      + +. ++ +  +            + .+       +                + + =
  ++|   =

>>   35000 |-++++++ +  +  +: + ++++++++++++ +  +++++++ +++++++++++++.++ + +=
++  |   =

>>   30000 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>   25000 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>   20000 |-+             : :                                             =
    |   =

>>         |                ::                                             =
    |   =

>>   15000 |-+              :                                              =
    |   =

>>   10000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>    5000 |OOOOOOOOOO OOOOO:OOO                                           =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                              netperf.Throughput_total_tps               =
        =

>>                                                                         =
        =

>>   1.6e+07 +-------------------------------------------------------------=
----+   =

>>           |                                                             =
    |   =

>>   1.4e+07 |+++++++++++++++ ++++++++++++++++.++++++++++++++++++++++++++++=
++++|   =

>>   1.2e+07 |-+            : :                                            =
    |   =

>>           |              : :                                            =
    |   =

>>     1e+07 |-+            : :                                            =
    |   =

>>           |              : :                                            =
    |   =

>>     8e+06 |-+            : :                                            =
    |   =

>>           |               ::                                            =
    |   =

>>     6e+06 |-+             :                                             =
    |   =

>>     4e+06 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>     2e+06 |OOOOOOOOOOOOOOO:OOO                                          =
    |   =

>>           |               :                                             =
    |   =

>>         0 +-------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                    netperf.workload                     =
        =

>>                                                                         =
        =

>>   4.5e+09 +-------------------------------------------------------------=
----+   =

>>           |+++++++++++++++ ++++++++++++++++.++++++++++++++++++++ +++++++=
++++|   =

>>     4e+09 |-+            : :                                    +       =
    |   =

>>   3.5e+09 |-+            : :                                            =
    |   =

>>           |              : :                                            =
    |   =

>>     3e+09 |-+            : :                                            =
    |   =

>>   2.5e+09 |-+            : :                                            =
    |   =

>>           |              : :                                            =
    |   =

>>     2e+09 |-+             :                                             =
    |   =

>>   1.5e+09 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>     1e+09 |-+             :                                             =
    |   =

>>     5e+08 |OOOOOOOOOOOOOOO:OOO                                          =
    |   =

>>           |               :                                             =
    |   =

>>         0 +-------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                               netperf.time.user_time                    =
        =

>>                                                                         =
        =

>>   1400 +----------------------------------------------------------------=
----+   =

>>        |++++++++.  +++++ + + +  +.+       +++++++ .+++++++++ ++ ++ .++++=
++++|   =

>>   1200 |-+       ++    : :+ + ++   +++++++       +          +  +  +     =
    |   =

>>        |               : :                                              =
    |   =

>>   1000 |-+             : :                                              =
    |   =

>>        |               : :                                              =
    |   =

>>    800 |-+             : :                                              =
    |   =

>>        |               : :                                              =
    |   =

>>    600 |-+              :                                               =
    |   =

>>        |                :                                               =
    |   =

>>    400 |-+           O  :  O                                            =
    |   =

>>        |OOOOOOOO OOOO OO:OO                                             =
    |   =

>>    200 |-+              :                                               =
    |   =

>>        |                :                                               =
    |   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                               netperf.time.system_time                  =
        =

>>                                                                         =
        =

>>   20000 +---------------------------------------------------------------=
----+   =

>>   18000 |+++ ++++  .+++++ ++++++ +++ + + +.+++ +++++++ ++++ +++++.++++++=
 +++|   =

>>         |   +    ++     : :     +   + + +     +       +                 =
    |   =

>>   16000 |-+             : :                                             =
    |   =

>>   14000 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>   12000 |-+             : :                                             =
    |   =

>>   10000 |-+             : :                                             =
    |   =

>>    8000 |OOOOOOOOOO OOOOO:OOO                                           =
    |   =

>>         |                :                                              =
    |   =

>>    6000 |-+              :                                              =
    |   =

>>    4000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                      netperf.time.percent_of_cpu_this_job_got           =
        =

>>                                                                         =
        =

>>   7000 +----------------------------------------------------------------=
----+   =

>>        |+++ ++++.+ +++++ ++++++ +.++++ + ++++ ++++.+++ ++++ +++++++.++++=
 + +|   =

>>   6000 |-+ +      +    : :     +      + +    +        +                 =
    |   =

>>        |               : :                                              =
    |   =

>>   5000 |-+             : :                                              =
    |   =

>>        |               : :                                              =
    |   =

>>   4000 |-+             : :                                              =
    |   =

>>        |               : :                                              =
    |   =

>>   3000 |OOOOOOOO OOOOOOO:OOO                                            =
    |   =

>>        |                :                                               =
    |   =

>>   2000 |-+              :                                               =
    |   =

>>        |                :                                               =
    |   =

>>   1000 |-+              :                                               =
    |   =

>>        |                :                                               =
    |   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                            netperf.time.minor_page_faults               =
        =

>>                                                                         =
        =

>>   140000 +--------------------------------------------------------------=
----+   =

>>          |OOOOOOOOOOOOOOOO OOO                                          =
    |   =

>>   120000 |-+                                                            =
    |   =

>>          |+++++++++++++++  ++++++++++++++++++++++++++++++++.++++++++++++=
++++|   =

>>   100000 |-+            :  :                                            =
    |   =

>>          |              :  :                                            =
    |   =

>>    80000 |-+            : :                                             =
    |   =

>>          |              : :                                             =
    |   =

>>    60000 |-+            : :                                             =
    |   =

>>          |               ::                                             =
    |   =

>>    40000 |-+             ::                                             =
    |   =

>>          |               ::                                             =
    |   =

>>    20000 |-+             :                                              =
    |   =

>>          |               :                                              =
    |   =

>>        0 +--------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                         netperf.time.voluntary_context_switches         =
        =

>>                                                                         =
        =

>>     3e+09 +-------------------------------------------------------------=
----+   =

>>           |                                                             =
    |   =

>>   2.5e+09 |-+ +                  +       +     +       +                =
    |   =

>>           |   ::+  ++       +    ::+ + + :+.   ::+ +   ::+          +   =
    |   =

>>           |++: + :+  :++   + ++++ + + + :   ++: + ::++: + :+ +++   + +++=
 + +|   =

>>     2e+09 |-++   +   +  ++ :            +     +   +   +   + ::  +++     =
::+ |   =

>>           |              : :                                +           =
+   |   =

>>   1.5e+09 |-+            : :                                            =
    |   =

>>           |              : :                                            =
    |   =

>>     1e+09 |-+            : :                                            =
    |   =

>>           |               :                                             =
    |   =

>>           |OOOOOOOOOOOOOOO:OOO                                          =
    |   =

>>     5e+08 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>         0 +-------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                        netperf.time.involuntary_context_switches        =
        =

>>                                                                         =
        =

>>   2.5e+09 +-------------------------------------------------------------=
----+   =

>>           |                                                 +    +      =
+ + |   =

>>           |  +       ++ ++              +     +       +     ::   :+     =
: ::|   =

>>     2e+09 |++: + ++  : + : +  +     + + :  .++: + + ++: + ++ ++++  + +++=
 : +|   =

>>           |   ::+  +:    : :++ ++ ++ + : :+    ::+ +   ::+          +   =
 +  |   =

>>           |   +     +    : :     +     + ::    +       +                =
    |   =

>>   1.5e+09 |-+            : :             +                              =
    |   =

>>           |              : :                                            =
    |   =

>>     1e+09 |-+             ::                                            =
    |   =

>>           |               :                                             =
    |   =

>>           |               :                                             =
    |   =

>>     5e+08 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>           |               :                                             =
    |   =

>>         0 +-------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                           perf-sched.total_wait_time.max.ms             =
        =

>>                                                                         =
        =

>>   14000 +---------------------------------------------------------------=
----+   =

>>         |                                                               =
    |   =

>>   12000 |-+               +                                    +        =
+  +|   =

>>         |   ++       ++   :+  +    + + +      ++      ++  ++ ++ +.+   ++=
 : :|   =

>>   10000 |+++  +++++.+  ++ : ++ ++++ + + ++.+++  ++++++  ++  +      +++  =
 ++ |   =

>>         |               : :                                             =
    |   =

>>    8000 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>    6000 |-+             : :                                             =
    |   =

>>         |                :                                              =
    |   =

>>    4000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                        perf-sched.total_wait_time.average.ms            =
        =

>>                                                                         =
        =

>>     2 +-----------------------------------------------------------------=
----+   =

>>   1.8 |-+ + +                          +     + +     +  +   +           =
    |   =

>>       |   : ::    +   +           +    :     : :     :  :   :  ++       =
+   |   =

>>   1.6 |-+ ::::   + : +: +       ++ : + ::    ::::    ::: :+ :: :: + +  +=
 +  |   =

>>   1.4 |-+: :  :+ : ++ : ::    + :  ++ : +. +: : :+ +: :: ::: ::  ::::+ :=
  + |   =

>>       |+ + +  + +     : :++. + +      +   + + + + + + +  + + ++  + +  + =
   :|   =

>>   1.2 |-+             : :   +                                           =
   +|   =

>>     1 |-+             : :                                               =
    |   =

>>   0.8 |-+              ::                                               =
    |   =

>>       |                :                                                =
    |   =

>>   0.6 |-+              :                                                =
    |   =

>>   0.4 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>   0.2 |-+              :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                           perf-sched.total_sch_delay.max.ms             =
        =

>>                                                                         =
        =

>>   12000 +---------------------------------------------------------------=
----+   =

>>         |    +                                 +       +                =
    |   =

>>   10000 |-+  :                                 :       :   +          + =
    |   =

>>         |    :            +         +          :       :   ::         : =
    |   =

>>         |    ::           :         :+ +       ::      :: + +         : =
    |   =

>>    8000 |-+ : :       +   :       + : + :     : :     : : : : +      : :=
++  |   =

>>         |   : ++  +.+ :++ ::      ::    +     : ++    : ++  : : +.+  : :=
: : |   =

>>    6000 |-+ +  : +   :  : ::     + +     +  + +   + + +      ::::  + + +=
  + |   =

>>         | :+    ::   +  : :++  ++         : :+    : :+       : +    +   =
   +|   =

>>    4000 |:+     +       ::   : :          ::       :         +          =
    |   =

>>         |+               :   ++            +       +                    =
    |   =

>>         |                :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                        perf-sched.total_sch_delay.average.ms            =
        =

>>                                                                         =
        =

>>    0.3 +----------------------------------------------------------------=
----+   =

>>        |     +                                 +        +               =
 +  |   =

>>   0.25 |-+ + :         +                +    + :      + :   +           =
+:  |   =

>>        |   : ::   ++  +:         .++    ::   : ::     : ::+ :  +  +     =
: : |   =

>>        |  : : :   : + :: +    + +   :++: +  : : :+.  : : ::: : :+ :: + +=
  : |   =

>>    0.2 |+++ + ++.:   + : ::   :::   +  +  +++ + +  +++ + + + ::  : : :+ =
  + |   =

>>        |         +     : :++++ +                             ++  +  +   =
   +|   =

>>   0.15 |-+             : :                                              =
    |   =

>>        |                ::                                              =
    |   =

>>    0.1 |-+              ::                                              =
    |   =

>>        |                :                                               =
    |   =

>>        |                :                                               =
    |   =

>>   0.05 |-+              :                                               =
    |   =

>>        |                :                                               =
    |   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                       perf-sched.total_wait_and_delay.count.ms          =
        =

>>                                                                         =
        =

>>   8e+06 +---------------------------------------------------------------=
----+   =

>>         |                                                               =
   :|   =

>>   7e+06 |-+  +             ++++ +      +       +       +   + ++   +   + =
  : |   =

>>   6e+06 |+++ : + +   ++   +    +:   ++ :   +++ : + +++ : + : ::  :: + : =
  + |   =

>>         |: : :::::   : :  :      :  : : : +  : ::::: : :::: :: : : ::: :=
  : |   =

>>   5e+06 |-+ : : + : :  +  :      +++  + :+    : : +   : : + :  ++  + + +=
++  |   =

>>         |   + +   +.+   + :             +     + +     + +   +           =
    |   =

>>   4e+06 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>   3e+06 |-+             ::                                              =
    |   =

>>   2e+06 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>   1e+06 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                        perf-sched.total_wait_and_delay.max.ms           =
        =

>>                                                                         =
        =

>>   25000 +---------------------------------------------------------------=
----+   =

>>         |    +                                 +       +                =
    |   =

>>         |    :                                 :       :                =
    |   =

>>   20000 |-+  :                      +          :       :              + =
    |   =

>>         |    ::       +             :          ::      :: +           : =
    |   =

>>         |   : :       :           + :         : :     : : : +         ::=
++  |   =

>>   15000 |-+ : :    .+ ::+         :: :  +     : :     : :: ::   +   +: :=
::  |   =

>>         |   : +++ +  : +: +     ++ : :++ +.   : +++   : ++ : : + + + + +=
  : |   =

>>   10000 |++++    +   +  : :+ +++   + +     ++++    ++++    + ++   +     =
  ++|   =

>>         |               : : +                                           =
    |   =

>>         |                ::                                             =
    |   =

>>    5000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                     perf-sched.total_wait_and_delay.average.ms          =
        =

>>                                                                         =
        =

>>   2.5 +-----------------------------------------------------------------=
----+   =

>>       |                                                                 =
    |   =

>>       |   + +                          +     + +     +  +   +           =
    |   =

>>     2 |-+ : ::    +   +           +    :     : :     :  :   :  ++ +     =
+   |   =

>>       |   ::::   + : +: +       ++ : + ::    ::::    ::: :+ :: :: : +  +=
 +  |   =

>>       | +: :  ++ : ++ : ::    + :  ++ : +. +: : ++ +: :: + : ::  : ::+ :=
  + |   =

>>   1.5 |+++ +    +     : :++.++ +      +   + + +   + + +    + ++  + +  + =
   +|   =

>>       |               : :                                               =
    |   =

>>     1 |-+             : :                                               =
    |   =

>>       |                ::                                               =
    |   =

>>       |                :                                                =
    |   =

>>   0.5 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   10000 +---------------------------------------------------------------=
----+   =

>>    9000 |-+                                               :             =
::  |   =

>>         |                                                 : +          :=
 ++ |   =

>>    8000 |-+         +  ++         + +                    : ::        + +=
  : |   =

>>    7000 |-+ + +    + : ::      +  : :++ +     + +     + +: ::   +    : :=
  : |   =

>>         |   :+ ++ +  + :: +   + ++ :   + +    :+ ++   :+ + + :  ::   :::=
   :|   =

>>    6000 |:+:     ::   : : :   :    +      +  :     : :       : : : +: : =
   :|   =

>>    5000 |+++     +    + : :: +             +++     +++       : +  + + + =
   :|   =

>>    4000 |-+             : :++                                ++         =
   +|   =

>>         |                ::                                             =
    |   =

>>    3000 |-+              :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>    1000 |-+              :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   1.6 +-----------------------------------------------------------------=
----+   =

>>       |   + +                                + +     +  +               =
    |   =

>>   1.4 |-+ : ::    +   +                +     : :     :  :   +           =
++  |   =

>>   1.2 |-+ ::::   + : +:           +  + ::    ::::    ::: :+ :  ++ +     =
::  |   =

>>       | +: :  :+ : + :: +     + ++ ++ : +. +: : :+ +: :: ::: : : :::+. +=
  : |   =

>>     1 |+++ +  + +   + : ::   + ::     +   + + + + + + +  + + ::  + +  + =
  + |   =

>>       |               : :++.+  +                             ++         =
   +|   =

>>   0.8 |-+             : :                                               =
    |   =

>>       |                ::                                               =
    |   =

>>   0.6 |-+              ::                                               =
    |   =

>>   0.4 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>   0.2 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   9000 +----------------------------------------------------------------=
----+   =

>>        |                          +                       + +           =
    |   =

>>   8000 |-+                        :                       : :           =
++  |   =

>>   7000 |-+         +   +         : :    +                 :::   +       =
::  |   =

>>        |    ++     :  +: +       : :+  +:     ++       ++ :: :  :    + :=
  : |   =

>>   6000 |-+ + :    + : :: :      +  + :+  :   + :      + :: + :  ::+  : +=
  + |   =

>>   5000 |-+ :  :  +  + :: ::    +     +   +   :  :+    :  :   : : + +: ::=
   :|   =

>>        | ++   + +    : : ::   +          : ++   + : ++   +   +++    + : =
   +|   =

>>   4000 |::     +     + : :+  +            ::      : :                 + =
    |   =

>>   3000 |++              :: ++             +        +                    =
    |   =

>>        |                :                                               =
    |   =

>>   2000 |-+              :                                               =
    |   =

>>   1000 |-+              :                                               =
    |   =

>>        |                :                                               =
    |   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   0.6 +-----------------------------------------------------------------=
----+   =

>>       |                                                                 =
    |   =

>>   0.5 |-+ + +         +                +     + +     +  +   +           =
    |   =

>>       |   : ::    +   :           +    ::    : :     :  :   :  +  +     =
++  |   =

>>       |   ::::   + : +: +       ++ : + :+.   ::::+   ::: :+ :: :+ : +  +=
  : |   =

>>   0.4 |++: :  ++ : ++ : ::    + :  ++ :   ++: : + ++: :: + : ::  : ::+ :=
  + |   =

>>       |  + +    +     : :+ .++ +      +     + +     + +    + ++  + +  + =
   +|   =

>>   0.3 |-+             : : +                                             =
    |   =

>>       |                ::                                               =
    |   =

>>   0.2 |-+              ::                                               =
    |   =

>>       |                :                                                =
    |   =

>>       |                :                                                =
    |   =

>>   0.1 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>     4e+06 +-------------------------------------------------------------=
----+   =

>>           |                                                             =
   :|   =

>>   3.5e+06 |-+  +            ++++ +      +       +       +   + ++  +   + =
  : |   =

>>     3e+06 |+++ : + +  ++   +    +:   ++ :   +++ : + +++ : + : ::  : + : =
  + |   =

>>           |: : :::::  : :  :      :  : : : +  : ::::: : :::: :: :: ::: :=
  : |   =

>>   2.5e+06 |-+ : : + ::  +  :      +++  + :+    : : +   : : + :  ++ + + +=
++  |   =

>>           |   + +   ++   + :             +     + +     + +   +          =
    |   =

>>     2e+06 |-+            : :                                            =
    |   =

>>           |              : :                                            =
    |   =

>>   1.5e+06 |-+            ::                                             =
    |   =

>>     1e+06 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>    500000 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>         0 +-------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   18000 +---------------------------------------------------------------=
----+   =

>>         |                         +                       : +           =
    |   =

>>   16000 |-+             +         :                       : :           =
++  |   =

>>   14000 |-+         +   :         ::    +                 :::   +       =
::  |   =

>>         |    ++    +:  +: +      : :+  +:      ++      ++: : :  ::   + :=
  : |   =

>>   12000 |-+ +  :  +  : :: :     ++ + ++  :    +  :    +  : + :  :: + : +=
  + |   =

>>   10000 |-+ :  + +   + :: ::    :        +    :  ++   :  +   : :  + : ::=
   :|   =

>>         | ++    ::    : : ::   +          : ++    : ++       +++    + : =
   +|   =

>>    8000 |::     +     +  ::+  +           : :      ::                 + =
    |   =

>>    6000 |++              :: ++             +       +                    =
    |   =

>>         |                :                                              =
    |   =

>>    4000 |-+              :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   2.5 +-----------------------------------------------------------------=
----+   =

>>       |                                                                 =
    |   =

>>       |                                                                 =
    |   =

>>     2 |-+ + +         +                +     + +     +  +   +           =
    |   =

>>       |   : ::   ++  +:           +    ::    : :     : :: + :  ++ +     =
++  |   =

>>       |  : : :   : + :: +       ++ :++ :+.  : : :+  : :: ::: : :: : +  +=
  : |   =

>>   1.5 |+++ +  +++   + : ::    + :  +  :   +++ + + +++ +  + + ::  : ::+ :=
  + |   =

>>       |               : :++.++ +      +                      ++  + +  + =
   +|   =

>>     1 |-+             : :                                               =
    |   =

>>       |                ::                                               =
    |   =

>>       |                :                                                =
    |   =

>>   0.5 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   10000 +---------------------------------------------------------------=
----+   =

>>    9000 |-+                                                             =
:   |   =

>>         |         +.                                                    =
::  |   =

>>    8000 |-+       : +                                     +            :=
 +  |   =

>>    7000 |-+ + +   : :   +    +          ++    + + +   + + ::   ++    + +=
  : |   =

>>         |   : : +:   : +:    :   ++ + + : :   : : :   : : :++  : : + : :=
  + |   =

>>    6000 |:+ ::::::   :+ :    ::+ : + + :  :   :::: :  ::::  :  : : :: ::=
  : |   =

>>    5000 |++: : + +   +  : + : + +      +   ++: : + ++: : +   ::   : + : =
   :|   =

>>    4000 |-++ +          : :++                + +     + +     ::   +   + =
   :|   =

>>         |                ::                                  ++         =
   +|   =

>>    3000 |-+              ::                                             =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>    1000 |-+              :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   1.4 +-----------------------------------------------------------------=
----+   =

>>       |                                                                 =
    |   =

>>   1.2 |-+ + +         +                +     + +     +  +   +           =
    |   =

>>       |   : ::   ++   :           +    ::    : :     :  : + :  ++ +     =
+   |   =

>>     1 |-+ ::::   : : +: +       ++ : + :+    ::::+   ::: :: :: :: ::+  +=
 +  |   =

>>       |:+: :  +++  ++ : ::    + :  ++ :  + +: : + :+: :: + : ::  : + + :=
  + |   =

>>   0.8 |+++ +          : :++.++ +      +   + + +   + + +    + ++  +    + =
   :|   =

>>       |               : :                                               =
   +|   =

>>   0.6 |-+              ::                                               =
    |   =

>>       |                ::                                               =
    |   =

>>   0.4 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>   0.2 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   7000 +----------------------------------------------------------------=
----+   =

>>        |     +                                 +        +               =
    |   =

>>   6000 |-+   :        +           +            :        :               =
    |   =

>>        |     :        :       +   :            :        :               =
+   |   =

>>   5000 |-+ + :        ::      :  ::          + :      + :              +=
 +  |   =

>>        |   : ::      : +      :  : :         : ::     : ::+           + =
 :  |   =

>>   4000 |-+ :: :    +++ :      ::+  :+        :: :     :: ::    +      : =
 :  |   =

>>        | +: : :   +    : +   : ::  + + +   +: : :   +: : :::+  :+ +   : =
  : |   =

>>   3000 |-:: : :+  :    : :   : +      ::+  :: : :   :: : : ::+ : + : :  =
  :+|   =

>>        | :+ + + : :    : ::+ +        +  : :+ + +   :+ + + +  :    : :  =
  ::|   =

>>   2000 |:+      ::      ::::::           +:      +.:          +     :+  =
  + |   =

>>        |+        +      : + +             +        +                +   =
    |   =

>>   1000 |-+              :                                               =
    |   =

>>        |                :                                               =
    |   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>     4e+06 +-------------------------------------------------------------=
----+   =

>>           |                                                             =
   :|   =

>>   3.5e+06 |-+  +            ++++ +      +       +       +   + ++  +   + =
  : |   =

>>     3e+06 |+++ : + +  ++   +    +:   ++ :   +++ : + +++ : + : ::  : + : =
  + |   =

>>           |: : :::::  : :  :      :  : : : +  : ::::: : :::: :: :: ::: :=
  : |   =

>>   2.5e+06 |-+ : : + ::  +  :      +++  + :+    : : +   : : + :  ++ + + +=
++  |   =

>>           |   + +   ++   + :             +     + +     + +   +          =
    |   =

>>     2e+06 |-+            : :                                            =
    |   =

>>           |              : :                                            =
    |   =

>>   1.5e+06 |-+            ::                                             =
    |   =

>>     1e+06 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>    500000 |-+             :                                             =
    |   =

>>           |               :                                             =
    |   =

>>         0 +-------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   14000 +---------------------------------------------------------------=
----+   =

>>         |     +                                 +       +               =
    |   =

>>   12000 |-+   :        +          +             :       :               =
    |   =

>>         |     :        :       +  :             :       :              +=
++  |   =

>>   10000 |-+ + :        ::      :  ::          + :     + :              :=
 :  |   =

>>         |   : ::      : +      ::: :          : ::    : ::+     +     + =
  : |   =

>>    8000 |-+ :: :  +.+++ :    + :++ ++         :: :    :: ::    + +    : =
  + |   =

>>         | +: : :  :     : +  ::      + +++  +: : :+ +: : :::+  :  ++ +  =
   :|   =

>>    6000 |::+ : :+:      : : : :       +   + :+ : ::::+ : : + + :    ::  =
   +|   =

>>         |+   + + +      : ::+ +            +   + + +   + +    :     +   =
    |   =

>>    4000 |-+              ::+                                  +         =
    |   =

>>         |                :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   1.4 +-----------------------------------------------------------------=
----+   =

>>       |                                +                                =
    |   =

>>   1.2 |-+ + +         +                :     + +     +  +   +           =
+   |   =

>>       |   : ::   ++   :           +    ::    : :     :  : + :  ++ +     =
::  |   =

>>     1 |-+ ::::   : + +: +       ++ : +: +.   ::::+   ::: :: :: :: ::+  +=
 ++ |   =

>>       |++: :  +++   + : ::    + :  ++ :   ++: : + ++: :: + : ::  : + + :=
  : |   =

>>   0.8 |-++ +          : :++.++ +      +     + +     + +    + ++  +    + =
   :|   =

>>       |               : :                                               =
   +|   =

>>   0.6 |-+              ::                                               =
    |   =

>>       |                ::                                               =
    |   =

>>   0.4 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>   0.2 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>          perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_=
fork    =

>>                                                                         =
        =

>>   14000 +---------------------------------------------------------------=
----+   =

>>         |                                                               =
    |   =

>>   12000 |-+               +                                    +        =
+  +|   =

>>         |   ++       ++   :+  +    + + +      ++      ++  ++ ++ +.+   ++=
 : :|   =

>>   10000 |+++  +++++.+  ++ : ++ ++++ + + ++.+++  ++++++  ++  +      +++  =
 ++ |   =

>>         |               : :                                             =
    |   =

>>    8000 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>    6000 |-+             : :                                             =
    |   =

>>         |                :                                              =
    |   =

>>    4000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>         perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_f=
ork     =

>>                                                                         =
        =

>>   350 +-----------------------------------------------------------------=
----+   =

>>       |                                                                 =
    |   =

>>   300 |-+ +           +           +          +       +      +           =
++  |   =

>>       |++ ::      +++ :       +  + :   +  ++ ::   ++ ::   + :   +   +.  =
: : |   =

>>   250 |:++ +   +  :  +: +     ::+  + + ::+  + +   : + +   :: : + :++  ++=
  ++|   =

>>       |     :.+ : :   : ::   + +    ::+ +      :++     + + + + : +      =
    |   =

>>   200 |-+   +   +:    : :++.+       +          +        +     +         =
    |   =

>>       |          +    : :                                               =
    |   =

>>   150 |-+              ::                                               =
    |   =

>>       |                ::                                               =
    |   =

>>   100 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>    50 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>        perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_fro=
m_fork  =

>>                                                                         =
        =

>>   14000 +---------------------------------------------------------------=
----+   =

>>         |                                                     +         =
    |   =

>>   12000 |-+       +         ++       + +                   + +:   +     =
    |   =

>>         |    +   +:        +  + +    : :       +       +   : : : : :  + =
    |   =

>>   10000 |-+  :++ : : +    +    :::  + : :      :++     :++: :: + : +  ::=
  ++|   =

>>         | ++ :  :  : :++  :    + + +  + :+. ++ :  + ++ :  + :   +   ++ +=
+ : |   =

>>    8000 |++ :   +   :   : :       +     +  +  :    +  :     +           =
 :  |   =

>>         |   +       +   + :                   +       +                 =
 +  |   =

>>    6000 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>    4000 |-+             ::                                              =
    |   =

>>         |                :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>       perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork  =

>>                                                                         =
        =

>>   14000 +---------------------------------------------------------------=
----+   =

>>         |                                                               =
    |   =

>>   12000 |-+               +                                    +        =
+  +|   =

>>         |   ++       ++   :+  +    + + +      ++      ++  ++ ++ +.+   ++=
 : :|   =

>>   10000 |+++  +++++.+  ++ : ++ ++++ + + ++.+++  ++++++  ++  +      +++  =
 ++ |   =

>>         |               : :                                             =
    |   =

>>    8000 |-+             : :                                             =
    |   =

>>         |               : :                                             =
    |   =

>>    6000 |-+             : :                                             =
    |   =

>>         |                :                                              =
    |   =

>>    4000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>    2000 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>      perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from=
_fork   =

>>                                                                         =
        =

>>   350 +-----------------------------------------------------------------=
----+   =

>>       |                                                                 =
    |   =

>>   300 |-+ +           +           +          +       +      +           =
++  |   =

>>       |++ ::      +++ :       +  + :   +  ++ ::   ++ ::   + :   +   +.  =
: : |   =

>>   250 |:++ +   +  :  +: +     ::+  + + ::+  + +   : + +   :: : + :++  ++=
  ++|   =

>>       |     :.+ : :   : ::   + +    ::+ +      :++     + + + + : +      =
    |   =

>>   200 |-+   +   +:    : :++.+       +          +        +     +         =
    |   =

>>       |          +    : :                                               =
    |   =

>>   150 |-+              ::                                               =
    |   =

>>       |                ::                                               =
    |   =

>>   100 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>    50 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   140 +-----------------------------------------------------------------=
----+   =

>>       |                                                       +         =
    |   =

>>   120 |-+       ++                                            :         =
   +|   =

>>       | +  +  + ::           +             +  + +  +  +  +    :  + +    =
   :|   =

>>   100 |-:  :  :: :          +: +           :  : :  :  :: ::   :: : :    =
  ::|   =

>>       | :  ::: +  :     +  : : :   ++      :  :::  :  :: :+  : : : :    =
  + |   =

>>    80 |:+:: ::    :     :+ :  ::   :: +   : :: : :: ::  :  : : :: : :   =
  : |   =

>>       |: :: +     + +   : +   : :  : ::   : :: + :: ::  +  + + ++ : :   =
+ : |   =

>>    60 |++:+        ::+  :     + :  : +:  .+ :+   :+ :+     : :    + +. +=
 :  |   =

>>       |  +         +  : :       + :    :+   +    +  +       :         + =
 +  |   =

>>    40 |-+             +:         +:    ::                   +           =
    |   =

>>       |               ::          +    +                                =
    |   =

>>    20 |-+              :                                                =
    |   =

>>       |                :                                                =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>           perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_for=
k       =

>>                                                                         =
        =

>>   8000 +----------------------------------------------------------------=
----+   =

>>        |                                                   +            =
    |   =

>>   7000 |-+                                                 :            =
    |   =

>>   6000 |-+                                                 :            =
    |   =

>>        |               +                                   :            =
    |   =

>>   5000 |-+             :             +                     :            =
   +|   =

>>        |               :             :                     :            =
   :|   =

>>   4000 |-+             :             :                     :            =
 + :|   =

>>        |               :             :                    : :           =
 : :|   =

>>   3000 |-+             ::     +      :                    : :         + =
 : :|   =

>>   2000 |-+            : :     :     : :                   : :         : =
 :: |   =

>>        |              : :     :     : :                   : :         : =
: : |   =

>>   1000 |-+            : :    : :    : :+                  : :        : :=
: : |   =

>>        |           +  : :    : :    : :::                 + :        : :=
: : |   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>           perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_for=
k       =

>>                                                                         =
        =

>>   1000 +----------------------------------------------------------------=
----+   =

>>    900 |-+                                                              =
   +|   =

>>        |                                                                =
   :|   =

>>    800 |-+                                                              =
   :|   =

>>    700 |-+                                                              =
   :|   =

>>        |                                                                =
   :|   =

>>    600 |-+                                                              =
   :|   =

>>    500 |-+                                                              =
   :|   =

>>    400 |-+                                                              =
  : |   =

>>        |                                                                =
  : |   =

>>    300 |-+                                                 +            =
  : |   =

>>    200 |-+             +                                   :            =
 +: |   =

>>        |               :             +                     ::           =
 :: |   =

>>    100 |-+         +  : :     +      ::+                  : :         + =
: : |   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fo=
rk      =

>>                                                                         =
        =

>>   60 +------------------------------------------------------------------=
----+   =

>>      |         +           +          +                                 =
    |   =

>>   50 |-+       :           :          :                              +  =
    |   =

>>      |         :          ::  +       :                              :: =
    |   =

>>      |         :          + : :  +    :                              :: =
   +|   =

>>   40 |-+  +    ::        +  :+:  :   ::      +        +              : +=
+  :|   =

>>      |   + :  : :+       :  :: :: :.+: :+   + :  +   +:       +     :   =
: : |   =

>>   30 |++ : :  : ::  ++  +   +  :+ +  : ::+  : :  :+  : :  .+  :: + +:   =
: + |   =

>>      | ++   + : +:  ::  :      ::    + :: ++   +:  ++  + + : : + :+ +   =
 :: |   =

>>   20 |-+     +:  : : : :       +       :        +       +   :+  +       =
 :  |   =

>>      |        +   :+ : :               +                    +           =
 +  |   =

>>      |            ::  ::                                                =
    |   =

>>   10 |-+          ::  ::                                                =
    |   =

>>      |            :   :                                                 =
    |   =

>>    0 +------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   800 +-----------------------------------------------------------------=
----+   =

>>       |                                                      +          =
    |   =

>>   700 |-+                                                    :          =
    |   =

>>   600 |-+                                                    :          =
    |   =

>>       |                                                      :          =
    |   =

>>   500 |-+                                                    :          =
    |   =

>>       |                                                      :          =
    |   =

>>   400 |-+                                                    :          =
    |   =

>>       |                                                     : :         =
    |   =

>>   300 |-+                                                   : :         =
    |   =

>>   200 |-+                                                   : :         =
    |   =

>>       |                                                     : :         =
    |   =

>>   100 |-+                                                   : :         =
    |   =

>>       |     +.                                 +       .+   : :         =
    |   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   1600 +----------------------------------------------------------------=
----+   =

>>        |                                                                =
  : |   =

>>   1400 |-+                                                              =
  : |   =

>>   1200 |-+                                                              =
  : |   =

>>        |                                                                =
  : |   =

>>   1000 |-+                                                              =
  : |   =

>>        |                                                                =
  : |   =

>>    800 |-+                                                              =
  ::|   =

>>        |                             +                                  =
 : :|   =

>>    600 |-+                           :                                  =
 : :|   =

>>    400 |-+                           :                                  =
 : :|   =

>>        |                             ::                                 =
 : :|   =

>>    200 |-+                          : :                                 =
 : :|   =

>>        |                            : :                                 =
 : :|   =

>>      0 +----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   300 +-----------------------------------------------------------------=
----+   =

>>       |                                                                 =
  : |   =

>>   250 |-+                                                               =
  : |   =

>>       |                                                                 =
  : |   =

>>       |                                                                 =
  : |   =

>>   200 |-+                                                               =
  : |   =

>>       |                                                                 =
  : |   =

>>   150 |-+                           +                                   =
  ::|   =

>>       |                             :                                   =
 : :|   =

>>   100 |-+                           :                                   =
 : :|   =

>>       |                             :                                   =
 : :|   =

>>       |                            : :                                  =
 : :|   =

>>    50 |-+                          : :                                  =
 : :|   =

>>       |                            : :                                  =
 : :|   =

>>     0 +-----------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   18 +------------------------------------------------------------------=
----+   =

>>      |                                                                  =
    |   =

>>   16 |-+                                                                =
    |   =

>>   14 |-+                                                                =
    |   =

>>      |                                                                  =
    |   =

>>   12 |-+                                                                =
    |   =

>>   10 |-+                                                                =
    |   =

>>      |                                                                  =
    |   =

>>    8 |-+                                                                =
   :|   =

>>    6 |-+                                                                =
   :|   =

>>      |                                                                  =
   :|   =

>>    4 |-+                                                                =
   :|   =

>>    2 |-+                                                                =
   :|   =

>>      |                                                                  =
   :|   =

>>    0 +------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   0.045 +---------------------------------------------------------------=
----+   =

>>         |             +                                                 =
    |   =

>>    0.04 |-+     +     :                                      +          =
    |   =

>>   0.035 |-+     :    +:                                      :          =
    |   =

>>         |      ::    : :   ++                                :          =
    |   =

>>    0.03 |-+ + ++ :  :  :+  :: +      +  +   + + ++  + + ++ + :  +       =
    |   =

>>   0.025 |+++: :  :  +  ::  :: :+ +  +:  :  + +: :: + +: :: : :: :+ +    =
    |   =

>>         |:   :   +  :  +: :  :: + ++  : :  :   : : :   :  ::: :+  + + + =
+ ++|   =

>>    0.02 |:+  +   : :    : +  :        :: ::    +  ::   +  : : ::    : ::=
::: |   =

>>   0.015 |-+       ::    : :  +        +: ::       :       + : :      : +=
 +  |   =

>>         |         +      ::            + +        +         + +      +  =
    |   =

>>    0.01 |-+              ::                                             =
    |   =

>>   0.005 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>    0.03 +---------------------------------------------------------------=
----+   =

>>         |            :                                       :          =
    |   =

>>   0.025 |-+     +    ::                                      :          =
    |   =

>>         |       ::  : :                                    + :          =
    |   =

>>         | +   ++ +  : +       +             +   ++  +   ++ : ::    +    =
    |   =

>>    0.02 |-::+ :  :  + : +  ++ ::  + +   +   ::+ ::  ::+ :: :: :    ::   =
   +|   =

>>         |+ + :    ::   ::  :: :+ + ::+  :  + + :  :+ + :  : : : +.+ +   =
   :|   =

>>   0.015 |:+  +    ::   +: +  :  +  +  :: :+    +  ::   +  : : :+     :+ =
+ + |   =

>>         |         +     : :  +        ++ +        +       + + +      + +=
 :: |   =

>>    0.01 |-+             : :                                             =
 +  |   =

>>         |                ::                                             =
    |   =

>>         |                :                                              =
    |   =

>>   0.005 |-+              :                                              =
    |   =

>>         |                :                                              =
    |   =

>>       0 +---------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   12 +------------------------------------------------------------------=
----+   =

>>      |                                  +        +         ++  +        =
    |   =

>>   10 |-+                                :        :         ::  :        =
    |   =

>>      |                                  :        :         ::  :        =
    |   =

>>      |                                  :        :         ::  :        =
    |   =

>>    8 |-+                                :        :        : :  :        =
    |   =

>>      |                                  :        :        : :  :        =
    |   =

>>    6 |-+                                :        :        : :  :        =
    |   =

>>      |:                                : :      : :       :  :: :       =
    |   =

>>    4 |:+                               : :      : :       :  :: :       =
    |   =

>>      |:                                : :      : :       :  :: :       =
    |   =

>>      |:                                : :      : :      :   :: :       =
    |   =

>>    2 |:+                               : :      : :      :   :: :       =
    |   =

>>      |:                                : :      : :      :   :: :       =
    |   =

>>    0 +------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>                                                                         =
        =

>>                                                                         =
        =

>>   6 +-------------------------------------------------------------------=
----+   =

>>     |                                  +        +          +   +        =
    |   =

>>   5 |-+                                :        :          :   :        =
    |   =

>>     |                                  :        :          :   :        =
    |   =

>>     |                                  :        :          :   :        =
    |   =

>>   4 |-+                                ::       :          :   :        =
    |   =

>>     |                                  ::       :         ::   :        =
    |   =

>>   3 |-+                                ::       :         ::   :        =
    |   =

>>     |:                                : :      : :        : : : :       =
    |   =

>>   2 |:+                               : :      : :        + : : :       =
    |   =

>>     |:                                : :      : :        : : : :       =
    |   =

>>     |:                                :  :     : :        : : : :       =
    |   =

>>   1 |:+                               :  :     : :       :  : : :       =
    |   =

>>     |:                                :  :     : :       :  : : :       =
    |   =

>>   0 +-------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>     perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_sysca=
ll_64   =

>>                                                                         =
        =

>>   12 +------------------------------------------------------------------=
----+   =

>>      |  ++                                 ++       ++       +      +  +=
 +  |   =

>>   10 |-+::    +                            ::       ::       :      :  :=
 :  |   =

>>      |  ::    :                     +      ::       ::       :      :  :=
 :  |   =

>>      | : :    : +                   :     : :      : :       :      :  :=
 :  |   =

>>    8 |-+ :    : :                   :     + :      + :       :      : ::=
 :  |   =

>>      | : :    : :                  ::     : :      : :       :      : : =
::  |   =

>>    6 |-: :    : :                  ::     : :      : :       :      : : =
::  |   =

>>      |:   :   :::                  ::    :   :    :   :     : :    : :: =
: : |   =

>>    4 |:+  :  : :::                 : :   :   :    :   :     : :    : :: =
: : |   =

>>      |+   :  : : :                 : :   +   :    +   :     : :    : :: =
: : |   =

>>      |:   :  : : :                 : :   :   :    :   :     : :    : :  =
+ : |   =

>>    2 |:+  :  : : :                :  :   :   :    :   :     : :    : :  =
  : |   =

>>      |    :  : : :             +  :  :  :    :   :    :     : :    : :  =
  : |   =

>>    0 +------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>     perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_sysca=
ll_64   =

>>                                                                         =
        =

>>   12 +------------------------------------------------------------------=
----+   =

>>      |  ++                                 ++       ++       +      +  +=
 +  |   =

>>   10 |-+::    +                            ::       ::       :      :  :=
 :  |   =

>>      |  ::    :                     +      ::       ::       :      :  :=
 :  |   =

>>      | : :    : +                   :     : :      : :       :      :  :=
 :  |   =

>>    8 |-+ :    : :                   :     + :      + :       :      : ::=
 :  |   =

>>      | : :    : :                  ::     : :      : :       :      : ::=
 :  |   =

>>    6 |-: :    : :                  ::     : :      : :       :      : : =
::  |   =

>>      |:   :   :::                  ::    :   :    :   :     : :    : :: =
: : |   =

>>    4 |:+  :  : :::                 : :   :   :    :   :     : :    : :: =
: : |   =

>>      |+   :  : : :                 : :   +   :    +   :     : :    : :: =
: : |   =

>>      |:   :  : : :                 : :   :   :    :   :     : :    : :  =
: : |   =

>>    2 |:+  :  : : :                :  :   :   :    :   :     : :    : :  =
+ : |   =

>>      |    :  : : :                :  :  :    :   :    :     : :    : :  =
  : |   =

>>    0 +------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>          perf-sched.sch_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_read=
        =

>>                                                                         =
        =

>>   14 +------------------------------------------------------------------=
----+   =

>>      |                                +                                 =
    |   =

>>   12 |-+          +         +         :                          +      =
    |   =

>>      |            :         :        +:                          : +    =
    |   =

>>   10 |-+          :         :        ::                          : :    =
    |   =

>>      |            :         :        ::                          : :    =
   +|   =

>>    8 |-+          :         :        ::                          : :    =
   :|   =

>>      |            :         :        ::                          : :    =
   :|   =

>>    6 |-+          ::        ::       : :                         :::    =
   :|   =

>>      |           : :       : :      :  :                        : : :   =
   :|   =

>>    4 |-+         : :       : :      :  :                        : : :   =
  : |   =

>>      |           : : +     : :      :  :                        : : :   =
  : |   =

>>    2 |-+         : : :     : :      :  :                        : : :   =
  : |   =

>>      |           : :: :    : :      :  :                        : : :   =
  : |   =

>>    0 +------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
                                                                           =
             =

>>          perf-sched.sch_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_read=
        =

>>                                                                         =
        =

>>   14 +------------------------------------------------------------------=
----+   =

>>      |                                +                                 =
    |   =

>>   12 |-+          +         +         :                          +      =
    |   =

>>      |            :         :        +:                          : +    =
    |   =

>>   10 |-+          :         :        ::                          : :    =
    |   =

>>      |            :         :        ::                          : :    =
   +|   =

>>    8 |-+          :         :        ::                          : :    =
   :|   =

>>      |            :         :        ::                          : :    =
   :|   =

>>    6 |-+          ::        ::       : :                         :::    =
   :|   =

>>      |           : :       : :      :  :                        : : :   =
   :|   =

>>    4 |-+         : :       : :      :  :                        : : :   =
  : |   =

>>      |           : : +     : :      :  :                        : : :   =
  : |   =

>>    2 |-+         : : :     : :      :  :                        : : :   =
  : |   =

>>      |           : :: :    : :      :  :                        : : :   =
  : |   =

>>    0 +------------------------------------------------------------------=
----+   =

>>                                                                         =
        =

>>                                                                         =
        =

>> [*] bisect-good sample
>> [O] bisect-bad  sample
>>
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>>
>>
>> ---
>> 0DAY/LKP+ Test Infrastructure                   Open Source Technology C=
enter
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corp=
oration
>>
>> Thanks,
>> Oliver Sang
>>
>=20

--===============8881749428157790408==--

