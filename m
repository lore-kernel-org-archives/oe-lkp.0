Content-Type: multipart/mixed; boundary="===============7357328525995705200=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 1431d4d11a: vm-scalability.throughput -11.5% regression
Date: Thu, 18 Jun 2020 14:16:26 +0800
Message-ID: <38efcb29-14c1-6b8b-ef9b-f42e0de14010@linux.intel.com>
In-Reply-To: <20200616144529.GA616830@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7357328525995705200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/16/2020 10:45 PM, Johannes Weiner wrote:
> On Tue, Jun 16, 2020 at 03:57:50PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -11.5% regression of vm-scalability.throughput due to =
commit:
>>
>>
>> commit: 1431d4d11abb265e79cd44bed2f5ea93f1bcc57b ("mm: base LRU balancin=
g on an explicit cost model")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> That's a really curious result.
> =

> An bit of an increase in system time is expected in the series as a
> whole:
> =

> 1. When thrashing is detected in the file cache, it intentionally
> makes more effort to find reclaimable anon pages than before - in an
> effort to converge on a stable state that has *neither* page reclaim
> nor refault IO.
> =

> 2. There are a couple of XXX about unrealized lock batching
> opportunities. Those weren't/aren't expected to have too much of a
> practical impact, and require a bit more infrastructure work that
> would have interferred with other ongoing work in the area.
> =

> However, this patch in particular doesn't add any locked sections (it
> adds a function call to an existing one, I guess?), and the workload
> is doing streaming mmapped IO and shouldn't experience any thrashing.
> =

> In addition, we shouldn't even scan anon pages - from below:
> =

>> swap_partitions:
>> rootfs_partition: "/dev/disk/by-id/wwn-0x5000c50067b47753-part1"
> =

> Does that mean that no swap space (not even a file) is configured?
> =


In this case, the swap is disabled (if enabled, you should find the =

"swap:" in the job file), "swap_patitions:" is just the description of =

the hardware.

>> in testcase: vm-scalability
>> on test machine: 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz w=
ith 256G memory
>> with following parameters:
>>
>> 	runtime: 300s
>> 	test: lru-file-mmap-read
>> 	cpufreq_governor: performance
>> 	ucode: 0xb000038
>>
>> test-description: The motivation behind this suite is to exercise functi=
ons and regions of the mm/ of the Linux kernel which are of interest to us.
>> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalabilit=
y.git/
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install job.yaml  # job file is attached in this email
>>          bin/lkp run     job.yaml
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcas=
e/ucode:
>>    gcc-9/performance/x86_64-rhel-7.6/debian-x86_64-20191114.cgz/300s/lkp=
-bdw-ex2/lru-file-mmap-read/vm-scalability/0xb000038
>>
>> commit:
>>    a4fe1631f3 ("mm: vmscan: drop unnecessary div0 avoidance rounding in =
get_scan_count()")
>>    1431d4d11a ("mm: base LRU balancing on an explicit cost model")
>>
>> a4fe1631f313f75c 1431d4d11abb265e79cd44bed2f
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>        0.23 =C2=B1  2%     +11.7%       0.26        vm-scalability.free_=
time
> =

> What's free_time?

The average of the time to free memory(unit: second) , you can see the =

output of vm-scalability( =

https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability.git/) =

benchamrk log "xxxxxxx usecs to free memory"
> =

>>      103991           -11.6%      91935        vm-scalability.median
>>    20717269           -11.5%   18336098        vm-scalability.throughput
>>      376.47            +8.3%     407.78        vm-scalability.time.elaps=
ed_time
>>      376.47            +8.3%     407.78        vm-scalability.time.elaps=
ed_time.max
>>      392226            +7.2%     420612        vm-scalability.time.invol=
untary_context_switches
>>       11731            +4.4%      12247        vm-scalability.time.perce=
nt_of_cpu_this_job_got
>>       41005           +14.5%      46936        vm-scalability.time.syste=
m_time
>>        3156            -4.8%       3005        vm-scalability.time.user_=
time
>>    52662860 =C2=B1  5%     -14.0%   45266760 =C2=B1  5%  meminfo.DirectM=
ap2M
>>        4.43            -0.5        3.90 =C2=B1  2%  mpstat.cpu.all.usr%
>>        1442 =C2=B1  5%     -14.9%       1227 =C2=B1 10%  slabinfo.kmallo=
c-rcl-96.active_objs
>>        1442 =C2=B1  5%     -14.9%       1227 =C2=B1 10%  slabinfo.kmallo=
c-rcl-96.num_objs
>>       37.50 =C2=B1  2%      -7.3%      34.75        vmstat.cpu.id
>>       57.25            +5.2%      60.25        vmstat.cpu.sy
>>       54428 =C2=B1 60%     -96.5%       1895 =C2=B1173%  numa-meminfo.no=
de1.AnonHugePages
>>      116516 =C2=B1 48%     -88.2%      13709 =C2=B1 26%  numa-meminfo.no=
de1.AnonPages
>>      132303 =C2=B1 84%     -88.9%      14731 =C2=B1 61%  numa-meminfo.no=
de3.Inactive(anon)
> =

> These counters capture present state, not history. Are these averages
> or snapshots? If snapshots, when are they taken during the test?

These are averages.

> =

>>      311.75 =C2=B1  8%     +16.0%     361.75 =C2=B1  2%  numa-vmstat.nod=
e0.nr_isolated_file
>>       29136 =C2=B1 48%     -88.4%       3367 =C2=B1 24%  numa-vmstat.nod=
e1.nr_anon_pages
>>    35935841 =C2=B1  6%     -17.0%   29839972 =C2=B1  6%  numa-vmstat.nod=
e2.numa_foreign
>>       33046 =C2=B1 84%     -89.1%       3595 =C2=B1 61%  numa-vmstat.nod=
e3.nr_inactive_anon
>>       33046 =C2=B1 84%     -89.1%       3596 =C2=B1 61%  numa-vmstat.nod=
e3.nr_zone_inactive_anon
>>       21.43 =C2=B1 15%     +79.4%      38.44 =C2=B1 54%  sched_debug.cfs=
_rq:/.load_avg.avg
>>       95.92 =C2=B1  9%     +96.7%     188.64 =C2=B1 67%  sched_debug.cfs=
_rq:/.load_avg.stddev
>>       36.18 =C2=B1  7%     +13.6%      41.10 =C2=B1  4%  sched_debug.cfs=
_rq:/.nr_spread_over.avg
>>     1075687 =C2=B1102%    +233.3%    3585792 =C2=B1 70%  sched_debug.cfs=
_rq:/.spread0.avg
>>     2865813 =C2=B1 41%     +87.3%    5367329 =C2=B1 42%  sched_debug.cfs=
_rq:/.spread0.max
>>    -6253423           -61.1%   -2430118        sched_debug.cfs_rq:/.spre=
ad0.min
>>      351.68 =C2=B1  8%     -14.8%     299.58 =C2=B1  6%  sched_debug.cpu=
.sched_goidle.avg
>>        9441 =C2=B1 11%     -21.9%       7376 =C2=B1  7%  sched_debug.cpu=
.sched_goidle.max
>>       54.46 =C2=B1  5%     -19.5%      43.82 =C2=B1  6%  sched_debug.cpu=
.sched_goidle.min
>>      873.06 =C2=B1  8%     -19.2%     705.36 =C2=B1  4%  sched_debug.cpu=
.sched_goidle.stddev
>>      898.25 =C2=B1 10%     -15.5%     759.25 =C2=B1 12%  proc-vmstat.ksw=
apd_low_wmark_hit_quickly
>>      108483            +4.0%     112790        proc-vmstat.nr_active_anon
>>        1006 =C2=B1  4%      +9.3%       1099 =C2=B1  2%  proc-vmstat.nr_=
isolated_file
>>    72985192            +4.5%   76275208        proc-vmstat.nr_mapped
>>      634868            +5.0%     666703 =C2=B1  2%  proc-vmstat.nr_page_=
table_pages
>>      106506            +3.6%     110328        proc-vmstat.nr_shmem
>>      108486            +4.0%     112792        proc-vmstat.nr_zone_activ=
e_anon
>>        7453 =C2=B1 42%     +67.4%      12474 =C2=B1 12%  proc-vmstat.num=
a_hint_faults
>>        1597 =C2=B1  5%      -8.8%       1457 =C2=B1  6%  proc-vmstat.pag=
eoutrun
>>       55272            +3.6%      57288        proc-vmstat.pgactivate
>>   1.603e+09            -2.7%   1.56e+09        proc-vmstat.pgscan_direct
>>   2.935e+08 =C2=B1  3%     +13.1%   3.32e+08 =C2=B1  2%  proc-vmstat.pgs=
can_kswapd
> =

> More scan activity. The patch can affect the scan ratio between anon
> and file, so this only makes sense when there is swap space configured
> and anon pages are actually scanned.
> =

> Would it be possible to capture deltas of the new pgscan_anon &
> pgscan_file vmstat counters? As well as the workingset_* ones?
> =


In fact, all the data supported by the vmstat will be captured, but it =

only shows the deltas > 1%, for pgscan_file the delta should < 1%.

> Thanks!
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============7357328525995705200==--

